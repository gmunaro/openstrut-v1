' ===============================================================
' DESGRAF.BAS - desenho grafico de uma viga da familia DESENHO (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: dump de strings do DESGRAF.EXE (fora do repositorio), docs/modules/_FAMILIA_DESENHO.md.
' Entrada: <dirEdv><obra>.EDV (vigas editadas), <dirEdv><obra>.EDX (tipo e
'          inicio das barras, se existir), o .DSP da obra (materiais, para o
'          aviso de armadura dupla) e DESENHO.INI (diretorios).
' Saida: <dirDados><obra>_<viga>.VET e, por opcao, <dirCad><obra>_<viga>.DXF.
' Escala fixa 1/50: a leitura da escala no .DSP nao foi reconstruida.
' Compilacao: tools/build.sh desenho/DESGRAF.BAS
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST GRF_MAXLISTA = 64      ' vigas listadas na tela (4 colunas de 16 linhas)

DECLARE FUNCTION VetMostra% (arqVet AS STRING)
DECLARE FUNCTION VetParaDxf% (arqVet AS STRING, arqDxf AS STRING)
DECLARE FUNCTION GrfAcha% (nome AS STRING)
DECLARE SUB DcDesenhaVigaGeo (v AS INTEGER, arq AS STRING, esc AS DOUBLE, obra AS STRING, gT() AS STRING, gX() AS DOUBLE, nota AS STRING)
DECLARE FUNCTION DcLeEdx% (arq AS STRING, gT() AS STRING, gX() AS DOUBLE)
DECLARE FUNCTION DcAvisoAsLinha$ (v AS INTEGER, fck AS DOUBLE, gc AS DOUBLE, fyk AS DOUBLE, gs AS DOUBLE)
DECLARE SUB DcLeMateriais (arq AS STRING, cob AS DOUBLE, fck AS DOUBLE, gc AS DOUBLE, fyk AS DOUBLE, gs AS DOUBLE)
DECLARE FUNCTION GrfArqDsp$ ()
DECLARE SUB GrfListaVigas (obra AS STRING)
DECLARE SUB GrfDesenha (v AS INTEGER, dirDados AS STRING, dirCad AS STRING, obra AS STRING)
DECLARE SUB GrfDesdim
DECLARE SUB GrfEspera (msg AS STRING)
DECLARE SUB GrfPausa (msg AS STRING)
DECLARE SUB GrfFim
DECLARE SUB GrfEscolheVideo

' Tipo e inicio (cm) de cada barra vindos do .EDX, paralelos a VigPos (DcLeEdx%).
DIM SHARED GrfGT(1 TO DAD_MAXPOS) AS STRING, GrfGX(1 TO DAD_MAXPOS) AS DOUBLE
' Cobrimento (cm) e materiais (tf/cm2) do .DSP da obra (DcLeMateriais).
DIM SHARED GrfCob AS DOUBLE, GrfFck AS DOUBLE, GrfGc AS DOUBLE, GrfFyk AS DOUBLE, GrfGs AS DOUBLE

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, dirEdv AS STRING, dirCad AS STRING, obra AS STRING
DIM nome AS STRING, v AS INTEGER, q AS INTEGER

IF ArqLer%("DESENHO.INI") < 0 THEN
    TelaErro "erro no processamento"
    GrfPausa "Acione ESC <Enter> para Continuar "
    GrfFim
END IF

dirDados = IniDirDados$
dirEdv = DirUtilizavel$(RTRIM$(IniValor$(4)))  ' mesma regra de DESINIT
dirCad = DirUtilizavel$(RTRIM$(IniValor$(5)))
obra = ObraAtual$(dirDados)

IF obra = "" THEN
    TelaErro "verifique a consistencia dos seus dados"
    GrfPausa "Acione ESC <Enter> para Continuar "
    GrfFim
END IF

IF VigLe%(dirEdv + obra + ".EDV", "EDV") = 0 THEN
    TelaErro DadErro
    GrfPausa "Acione ESC <Enter> para Continuar "
    GrfFim
END IF

IF VigQtd = 0 THEN
    TelaErro "verifique a consistencia dos seus dados"
    GrfPausa "Acione ESC <Enter> para Continuar "
    GrfFim
END IF

q = DcLeEdx%(dirEdv + obra + ".EDX", GrfGT(), GrfGX())
DcLeMateriais GrfArqDsp$, GrfCob, GrfFck, GrfGc, GrfFyk, GrfGs

' Antes da lista, mostra a escolha de adaptador de video.
GrfEscolheVideo

' Lista as vigas e pede uma pelo nome. Nome vazio encerra.
DO
    GrfListaVigas obra
    nome = EntradaTexto$(21, 12, 20, "")
    IF nome = "" THEN EXIT DO
    v = GrfAcha%(nome)
    IF v = 0 THEN
        TelaErro "verifique a consistencia dos seus dados"
        GrfPausa "Acione ESC <Enter> para Continuar "
    ELSE
        GrfDesenha v, dirDados, dirCad, obra
    END IF
LOOP

GrfFim

' Acha a viga cujo nome, sem caixa nem espacos nas pontas, bate com nome. 0 = nao achou.
FUNCTION GrfAcha% (nome AS STRING)
    DIM n AS STRING, v AS INTEGER
    n = UCASE$(LTRIM$(RTRIM$(nome)))
    GrfAcha% = 0
    FOR v = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(v).nome)) = n THEN
            GrfAcha% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Lista as vigas do .EDV em 4 colunas a partir da linha 4.
' Passou de GRF_MAXLISTA: some da tela, mas continua aceita pelo nome.
SUB GrfListaVigas (obra AS STRING)
    DIM v AS INTEGER
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    FOR v = 1 TO VigQtd
        IF v > GRF_MAXLISTA THEN EXIT FOR
        LOCATE 4 + ((v - 1) MOD 16), 5 + ((v - 1) \ 16) * 18
        PRINT RTRIM$(Vig(v).nome)
    NEXT
    LOCATE 19, 5: PRINT "Retorno ao Modulo Gerenciador"
    LOCATE 21, 5: PRINT "VIGA - "
END SUB

' Gera o .VET da viga v na escala 1/50, mostra o desenho e espera uma tecla.
' X exporta DXF; D chama DESDIM; outra tecla volta a lista.
' As barras seguem o tipo e o inicio do .EDX; a nota avisa armadura dupla sem As'.
SUB GrfDesenha (v AS INTEGER, dirDados AS STRING, dirCad AS STRING, obra AS STRING)
    DIM viga AS STRING, arqVet AS STRING, esc AS DOUBLE, r AS INTEGER, k AS STRING
    viga = RTRIM$(Vig(v).nome)
    arqVet = dirDados + obra + "_" + viga + ".VET"
    esc = 50#
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 3, 10: PRINT "OBRA - "; obra
    LOCATE 4, 10: PRINT "VIGA - "; viga
    LOCATE 5, 10: PRINT "ESCALA 1/"; LTRIM$(STR$(50))
    TelaStatus "Aguarde ..."
    DcDesenhaVigaGeo v, arqVet, esc, obra, GrfGT(), GrfGX(), DcAvisoAsLinha$(v, GrfFck, GrfGc, GrfFyk, GrfGs)
    IF NOT _FILEEXISTS(arqVet) THEN
        TelaErro "erro no processamento"
        GrfPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    r = VetMostra%(arqVet)
    IF r <> 1 THEN
        IF r = -1 THEN
            TelaErro "verifique a consistencia dos seus dados"
        ELSE
            TelaErro "erro no processamento"
        END IF
        GrfPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    ' RECONSTRUCAO: as teclas X e D nao constam no dump; a linha abaixo as informa.
    LOCATE 22, 10: PRINT "X - exporta DXF   D - DESDIM"
    TelaStatus "Qualquer Tecla para Continuar "
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    IF k = "X" THEN
        r = VetParaDxf%(arqVet, dirCad + obra + "_" + viga + ".DXF")
        IF r = -1 THEN
            TelaErro "verifique a consistencia dos seus dados"
            GrfPausa "Acione ESC <Enter> para Continuar "
        END IF
    ELSEIF k = "D" THEN
        GrfDesdim
    END IF
END SUB

' Roda DESDIM pelo diretorio de ComumDirExecDefine. RunSubmodulo avisa se o .EXE nao existir.
SUB GrfDesdim
    TelaStatus "Aguarde ..."
    RunSubmodulo "DESDIM"
END SUB

' Caminho do .DSP da obra: pasta da linha 3 do DESENHO.INI ou, se nao estiver
' la, pasta do programa (como DESINIT e DESEDCAO).
FUNCTION GrfArqDsp$
    DIM arq AS STRING
    arq = DirUtilizavel$(RTRIM$(IniValor$(3))) + RTRIM$(IniValor$(1)) + ".DSP"
    IF NOT _FILEEXISTS(arq) THEN arq = ComumDirExec$ + RTRIM$(IniValor$(1)) + ".DSP"
    GrfArqDsp$ = arq
END FUNCTION

' Mostra msg na linha de status e espera qualquer tecla.
SUB GrfEspera (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k <> ""
END SUB

' Mostra msg na linha de status e espera ENTER ou ESC.
SUB GrfPausa (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mensagem de encerramento, como no dump.
SUB GrfFim
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

' Tela de escolha do adaptador de video, com os textos de dump de strings do DESGRAF.EXE (fora do repositorio).
' RECONSTRUCAO: a resposta nao e lida; qualquer tecla cai em SCREEN 12
' (no QB64 o video e sempre VGA).
SUB GrfEscolheVideo
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 3, 10: PRINT "VIDEO"
    LOCATE 5, 10: PRINT "CGA  MCG  EGA  VGA  HER"
    GrfEspera "Qualquer Tecla para Continuar "
    SCREEN 12
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
