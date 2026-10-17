' ===============================================================
' DESINIT.BAS - inicializacao da familia DESENHO (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: docs/modules/DESINIT.md, dump de strings do DESINIT.EXE (fora do repositorio).
' Entrada: <dirDados>SISTRUT.OBR (obra), <obra>.SEC (vigas),
'          dir do .DSP (DESENHO.INI linha 3) e nome do .DSP (linha 1).
' Saida: <dirEdv><obra>.EDV (vigas detalhadas) e
'        <dirDados><obra>_DESINIT.LST (TABELA PARA 1 VIGA).
' Lacunas nao reconstruidas: area de forma, codigos Ad..Cf. Marcadas como "RECONSTRUCAO:" no codigo.
' Compilacao: tools/build.sh desenho/DESINIT
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' RECONSTRUCAO: valores padrao quando o DSP nao traz o campo.
CONST DSI_COB = 2.5        ' cobrimento (cm)
CONST DSI_FCK = 0.15       ' fck (t/cm2)
CONST DSI_FYK = 5#         ' fyk (t/cm2)
CONST DSI_GC = 1.4         ' coeficiente de seguranca do concreto
CONST DSI_GS = 1.15        ' coeficiente de seguranca do aco

' Linhas do SISTRUT.DSP, contadas a partir de 1. RECONSTRUCAO: conferir com o DSP usado.
CONST DSI_LN_COB = 39
CONST DSI_LN_FCK = 33
CONST DSI_LN_FYK = 34
CONST DSI_LN_MULT = 36     ' multiplicador de Fck/Fyk para t/cm2 (como no PILAREDI)
' RECONSTRUCAO: linha 45 do DSP (coef. concreto 1.4); a 44 e o coef. de esforcos.
CONST DSI_LN_GC = 45
CONST DSI_LN_GS = 46

DECLARE FUNCTION DsiValorDsp# (arq AS STRING, linha AS INTEGER, padrao AS DOUBLE)
DECLARE SUB DsiEscreve (f AS INTEGER, s AS STRING)
DECLARE SUB DsiTabela (f AS INTEGER, obra AS STRING, cob AS DOUBLE, fck AS DOUBLE, compr() AS DOUBLE, peso() AS DOUBLE, tot AS DOUBLE, vol AS DOUBLE)
DECLARE SUB DsiErro (motivo AS STRING)
DECLARE SUB DsiPausa
DECLARE FUNCTION DcDetalha% (v AS INTEGER, pos0 AS INTEGER, cob AS DOUBLE, fck AS DOUBLE, gc AS DOUBLE, fyk AS DOUBLE, gs AS DOUBLE)
DECLARE FUNCTION DcTabelaAco# (compr() AS DOUBLE, peso() AS DOUBLE)
DECLARE FUNCTION DsiVolume#

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, dirEdv AS STRING, obra AS STRING
DIM dspArq AS STRING, nomeDsp AS STRING, arqSec AS STRING, arqEdv AS STRING, arqLst AS STRING
DIM cob AS DOUBLE, fck AS DOUBLE, fyk AS DOUBLE, gc AS DOUBLE, gs AS DOUBLE, tot AS DOUBLE, mult AS DOUBLE, vol AS DOUBLE
DIM v AS INTEGER, totPos AS INTEGER, f AS INTEGER
DIM compr(1 TO 9) AS DOUBLE, peso(1 TO 9) AS DOUBLE

IF ArqLer%("DESENHO.INI") < 0 THEN DsiErro "arquivo DESENHO.INI nao encontrado."
dirDados = IniDirDados$
dirEdv = DirUtilizavel$(RTRIM$(IniValor$(4)))  ' raiz C: do original vira a pasta de trabalho
obra = ObraAtual$(dirDados)
IF obra = "" THEN
    DsiErro "RECONSTRUCAO: obra corrente nao definida (SISTRUT.OBR)."
END IF

' .DSP: diretorio da linha 3 do DESENHO.INI; se nao estiver la, pasta do programa.
nomeDsp = RTRIM$(IniValor$(1)) + ".DSP"
dspArq = DirUtilizavel$(RTRIM$(IniValor$(3))) + nomeDsp
IF NOT _FILEEXISTS(dspArq) THEN dspArq = ComumDirExec$ + nomeDsp
' Sem o arquivo, os valores padrao (DSI_*) valem.
IF NOT _FILEEXISTS(dspArq) THEN PRINT "Arquivo parametrizacao " + nomeDsp + " nao encontrado; adotados valores padrao"
cob =DsiValorDsp#(dspArq, DSI_LN_COB, DSI_COB)
' Fck/Fyk do DSP estao na unidade de grandeza da linha 37; a linha 36 converte para t/cm2.
' Sem o campo, o padrao (ja em t/cm2) vale como esta.
mult = DsiValorDsp#(dspArq, DSI_LN_MULT, 1#)
fck = DsiValorDsp#(dspArq, DSI_LN_FCK, 0#) * mult: IF fck <= 0 THEN fck = DSI_FCK
fyk = DsiValorDsp#(dspArq, DSI_LN_FYK, 0#) * mult: IF fyk <= 0 THEN fyk = DSI_FYK
gc = DsiValorDsp#(dspArq, DSI_LN_GC, DSI_GC)
gs = DsiValorDsp#(dspArq, DSI_LN_GS, DSI_GS)

arqSec = dirDados + obra + ".SEC"
VigLimpa
IF VigLe%(arqSec, "SEC") = 0 THEN
    DsiErro DadErro
END IF

' Detalha cada viga com a numeracao de posicoes a partir de 1.
PRINT "Aguarde ..."
totPos = 0
FOR v = 1 TO VigQtd
    totPos = totPos + DcDetalha%(v, 1, cob, fck, gc, fyk, gs)
NEXT

arqEdv = dirEdv + obra + ".EDV"
VigGrava arqEdv, "EDV"

tot = DcTabelaAco#(compr(), peso())
vol = DsiVolume#

arqLst = dirDados + obra + "_DESINIT.LST"
f = FREEFILE
OPEN arqLst FOR OUTPUT AS #f
CLS
DsiTabela f, obra, cob, fck, compr(), peso(), tot, vol
' RECONSTRUCAO: contador de posicoes, rotulo nao esta no dump.
PRINT #f, "RECONSTRUCAO posicoes geradas: "; totPos
PRINT "RECONSTRUCAO posicoes geradas: "; totPos
CLOSE #f

DsiPausa
PRINT "Retorno ao Modulo Gerenciador"
SYSTEM

' Le o valor numerico da linha "linha" do arquivo .DSP (formato "valor  descricao").
' Devolve padrao se o arquivo ou a linha nao existirem.
FUNCTION DsiValorDsp# (arq AS STRING, linha AS INTEGER, padrao AS DOUBLE)
    DIM f AS INTEGER, i AS INTEGER, l AS STRING, tok AS STRING, p AS INTEGER
    DsiValorDsp# = padrao
    IF NOT _FILEEXISTS(arq) THEN EXIT FUNCTION
    f = FREEFILE
    OPEN arq FOR INPUT AS #f
    l = ""
    FOR i = 1 TO linha
        IF EOF(f) THEN EXIT FOR
        LINE INPUT #f, l
    NEXT
    CLOSE #f
    l = LTRIM$(RTRIM$(l))
    p = INSTR(l, " ")
    IF p > 0 THEN tok = LEFT$(l, p - 1) ELSE tok = l
    IF VAL(tok) > 0 THEN DsiValorDsp# = VAL(tok)
END FUNCTION

' Escreve s na tela e, se f > 0, no arquivo de listagem f.
SUB DsiEscreve (f AS INTEGER, s AS STRING)
    PRINT s
    IF f > 0 THEN PRINT #f, s
END SUB

' Mostra o erro do dump, pausa e encerra. Usada quando o SEC nao le ou falta a obra.
SUB DsiErro (motivo AS STRING)
    PRINT "erro no processamento"
    PRINT "verifique a consistencia dos seus dados"
    PRINT motivo
    DsiPausa
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM 1  ' RECONSTRUCAO: codigo 1 para o gerenciador saber que houve erro
END SUB

' Volume de concreto de todas as vigas, em m3: soma por tramo de bw x h x vao.
' bw e h em cm (TViga), vao em m (TTramo); 10000 cm2 por m2 converte para m3.
FUNCTION DsiVolume#
    DIM v AS INTEGER, k AS INTEGER, s AS DOUBLE
    FOR v = 1 TO VigQtd
        FOR k = 0 TO Vig(v).nTramos - 1
            s = s + Vig(v).bw * Vig(v).h * VigTra(Vig(v).iTra + k).vao
        NEXT
    NEXT
    DsiVolume# = s / 10000#
END FUNCTION

' Espera ENTER ou ESC depois de um aviso ou erro.
SUB DsiPausa
    DIM k AS STRING
    PRINT "Acione ESC <Enter> para Continuar "
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Imprime a TABELA PARA 1 VIGA: cabecalho, uma linha por bitola usada, total de aco
' e volume de concreto (vol, m3). AREA FORMA e REPETIR x VEZES ficam como lacuna
' explicita: o dump mostra os rotulos, nao a formula.
SUB DsiTabela (f AS INTEGER, obra AS STRING, cob AS DOUBLE, fck AS DOUBLE, compr() AS DOUBLE, peso() AS DOUBLE, tot AS DOUBLE, vol AS DOUBLE)
    DIM i AS INTEGER
    DsiEscreve f, "TABELA PARA 1 VIGA   OBRA: " + obra
    ' Fck na unidade do DSP (t/cm2), com zero a esquerda: STR$ daria ".15".
    DsiEscreve f, "MEDIDAS EM CM   COBRIMENTO: " + LTRIM$(STR$(cob)) + " CM   Fck: " + LTRIM$(FormataNumero$(fck, 2, 0)) + " t/cm2"
    DsiEscreve f, "ACO  #   TOTAL PESO"
    FOR i = 1 TO 9
        IF compr(i) > 0 THEN
            DsiEscreve f, LTRIM$(STR$(i)) + "   " + LTRIM$(STR$(compr(i))) + "   " + LTRIM$(STR$(peso(i)))
        END IF
    NEXT
    DsiEscreve f, "UNI TOTAL   PESO TOTAL: " + LTRIM$(STR$(tot))
    DsiEscreve f, "VOL. CONCR: " + LTRIM$(FormataNumero$(vol, 3, 0)) + " m3"
    DsiEscreve f, "AREA FORMA: RECONSTRUCAO, nao calculado (lacuna)"
    DsiEscreve f, "REPETIR x VEZES: RECONSTRUCAO, nao calculado (lacuna)"
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
