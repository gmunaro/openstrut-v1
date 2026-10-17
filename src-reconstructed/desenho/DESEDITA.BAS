' ===============================================================
' DESEDITA.BAS - edicao e geracao do desenho de vigas (SISTRUT 4.0, familia DESENHO).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: dump de strings do DESEDITA.EXE (fora do repositorio), docs/modules/_FAMILIA_DESENHO.md, DESGRAF.BAS.
' Entrada: <dirEdv><obra>.EDV (vigas editadas) e DESENHO.INI (diretorios).
' Saida: <dirDados><obra>_<viga>.VET (com CAB/NOT), <dirDados><obra>_<viga>.PLT (HP-GL, se S),
'        <dirCad><obra>_<viga>.DXF (arquivo publico CAD, se S).
' Lacunas: gravacao do .EDV, alteracao de posicoes de ferro, selecao por registro I/J/N
'          (aceita numero ou nome), REPETIR, medidas e dobramento, tipo Adtec (C).
' Compilacao: tools/build.sh desenho/DESEDITA
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST EDI_MAXLISTA = 64      ' vigas listadas na tela (4 colunas de 16 linhas)

DECLARE FUNCTION VetMostra% (arqVet AS STRING)
DECLARE FUNCTION VetParaDxf% (arqVet AS STRING, arqDxf AS STRING)
DECLARE FUNCTION VetParaHpgl% (arqVet AS STRING, arqPlt AS STRING)
DECLARE FUNCTION EdiDirOk% (d AS STRING)
DECLARE FUNCTION EdiAcha% (sel AS STRING)
DECLARE FUNCTION EdiSim% (pergunta AS STRING, padrao AS STRING)
DECLARE FUNCTION EdiCampo$ (lin AS INTEGER, rot AS STRING, padrao AS STRING)
DECLARE SUB DcDesenhaViga (v AS INTEGER, arq AS STRING, esc AS DOUBLE, obra AS STRING)
DECLARE SUB EdiLista (obra AS STRING)
DECLARE SUB EdiObra (nome AS STRING, dirDados AS STRING, dirCad AS STRING, dirEdv AS STRING)
DECLARE SUB EdiVigaEdita (v AS INTEGER, dirDados AS STRING, dirCad AS STRING, obra AS STRING)
DECLARE SUB EdiInsereTextos (arq AS STRING)
DECLARE SUB EdiPausa (msg AS STRING)
DECLARE SUB EdiFim

DIM SHARED txtCab(1 TO 3) AS STRING, txtNot(1 TO 2) AS STRING

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, dirEdv AS STRING, dirCad AS STRING, obra AS STRING, nome AS STRING

IF ArqLer%("DESENHO.INI") < 0 THEN
    TelaErro "erro no processamento"
    EdiPausa "Acione ESC <Enter> para Continuar "
    EdiFim
END IF

dirDados = IniDirDados$
dirEdv = DirUtilizavel$(RTRIM$(IniValor$(4)))  ' mesma regra de DESINIT
dirCad = DirUtilizavel$(RTRIM$(IniValor$(5)))
obra = ObraAtual$(dirDados)

IF NOT EdiDirOk%(dirDados) THEN EdiFim
IF NOT EdiDirOk%(dirCad) THEN EdiFim

' Pede o nome da obra (Enter em branco encerra). Obra sem .EDV e recusada e pede outra.
DO
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 21, 5: PRINT "Nome da Obra ";
    nome = UCASE$(LTRIM$(RTRIM$(EntradaTexto$(21, 19, 20, obra))))
    IF nome = "" THEN EXIT DO
    IF NOT _FILEEXISTS(dirEdv + nome + ".EDV") THEN
        TelaErro "NAO EXISTE ESTE ARQUIVO NESTE DISCO"
        EdiPausa "Acione ESC <Enter> para Continuar "
    ELSE
        EdiObra nome, dirDados, dirCad, dirEdv
    END IF
LOOP

EdiFim

' Confere o diretorio; se nao existe, pergunta se cria. Retorna -1 (verdadeiro) se pode usar, 0 se nao.
FUNCTION EdiDirOk% (d AS STRING)
    IF _DIREXISTS(d) THEN EdiDirOk% = -1: EXIT FUNCTION
    TelaErro " ATENCAO ! .. Drive e Diretorio nao encontrados"
    LOCATE 9, 5: PRINT "NAO EXISTE ESTE ARQIVO "; d
    LOCATE 11, 5: PRINT "Drive:\Diretorio\...\Subdiretorio "
    LOCATE 12, 5: PRINT " dos arquivos de Vigas (.VIG .SEC .FOR)"
    LOCATE 13, 5: PRINT " dos arquivos de Vigas Editadas (.EDV)"
    LOCATE 14, 5: PRINT " dos arquivos de Parametrizacao (.DSP)"
    LOCATE 15, 5: PRINT " dos arquivos publicos CAD (.DXF ou .PUB)"
    IF EdiSim%("Crio o Diretorio " + d + " S/N", "S") THEN
        TelaStatus "Criando Diretorio     Aguarde ..."
        MKDIR LEFT$(d, LEN(d) - 1)
    ELSE
        TelaErro "VERIFIQUE O SEU DRIVE"
        EdiPausa "Acione ESC <Enter> para Continuar "
    END IF
    EdiDirOk% = _DIREXISTS(d)
END FUNCTION

' Acha a viga por numero de registro (1..VigQtd) ou por nome. 0 = nao achou.
FUNCTION EdiAcha% (sel AS STRING)
    DIM n AS STRING, v AS INTEGER, num AS DOUBLE
    num = VAL(sel)
    IF num >= 1 AND num <= VigQtd AND num = INT(num) THEN
        EdiAcha% = INT(num)
        EXIT FUNCTION
    END IF
    n = UCASE$(LTRIM$(RTRIM$(sel)))
    EdiAcha% = 0
    FOR v = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(v).nome)) = n THEN
            EdiAcha% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Pergunta S/N na linha 22. Enter usa padrao. Retorna 1 para S.
FUNCTION EdiSim% (pergunta AS STRING, padrao AS STRING)
    DIM k AS STRING
    LOCATE 22, 5: PRINT SPACE$(70)
    LOCATE 22, 5: PRINT pergunta;
    DO
        k = UCASE$(TeclaLer$)
        IF k = CHR$(13) THEN k = padrao
    LOOP UNTIL k = "S" OR k = "N" OR k = CHR$(27)
    EdiSim% = (k = "S")
END FUNCTION

' Rotulo na linha lin, coluna 10, e campo de texto de 40 caracteres logo depois. Mantem padrao se Enter.
FUNCTION EdiCampo$ (lin AS INTEGER, rot AS STRING, padrao AS STRING)
    LOCATE lin, 10: PRINT rot;
    EdiCampo$ = EntradaTexto$(lin, 10 + LEN(rot), 40, padrao)
END FUNCTION

' Mostra mensagem na linha de status e espera ENTER ou ESC.
SUB EdiPausa (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mensagem de encerramento, como no dump.
SUB EdiFim
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

' Lista as vigas do .EDV em 4 colunas a partir da linha 4.
' Passou de EDI_MAXLISTA: some da tela, mas continua aceita pelo numero ou nome.
SUB EdiLista (obra AS STRING)
    DIM v AS INTEGER
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 2, 55: PRINT "DESEDITA"
    FOR v = 1 TO VigQtd
        IF v > EDI_MAXLISTA THEN EXIT FOR
        LOCATE 4 + ((v - 1) MOD 16), 5 + ((v - 1) \ 16) * 18
        PRINT RTRIM$(Vig(v).nome)
    NEXT
    LOCATE 19, 5: PRINT "Retorno ao Modulo Gerenciador"
END SUB

' Carrega o .EDV da obra e repete: lista, escolhe viga, confirma e edita. Enter volta.
SUB EdiObra (nome AS STRING, dirDados AS STRING, dirCad AS STRING, dirEdv AS STRING)
    DIM sel AS STRING, v AS INTEGER
    IF VigLe%(dirEdv + nome + ".EDV", "EDV") = 0 THEN
        TelaErro DadErro
        EdiPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    IF VigQtd = 0 THEN
        TelaErro "Nenhum Arquivo Encontrado"
        EdiPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    DO
        EdiLista nome
        LOCATE 21, 5: PRINT "Registros  I/J/N a M/.../K ";
        sel = EntradaTexto$(21, 36, 20, "")
        IF sel = "" THEN EXIT DO
        v = EdiAcha%(sel)
        IF v = 0 THEN
            TelaErro "Viga nao existente ( registro " + sel + " )"
            EdiPausa "Acione ESC <Enter> para Continuar "
        ELSEIF EdiSim%("As Vigas escolhidas estao Corretas N/S ", "S") THEN
            EdiVigaEdita v, dirDados, dirCad, nome
        END IF
    LOOP
END SUB

' Edita uma viga: escala, CAB/NOT, gera o .VET e mostra. Repete enquanto
' o usuario quiser editar de novo. Depois oferece HP-GL e DXF (CAD).
SUB EdiVigaEdita (v AS INTEGER, dirDados AS STRING, dirCad AS STRING, obra AS STRING)
    DIM viga AS STRING, arqVet AS STRING, esc AS DOUBLE, r AS INTEGER, s AS STRING, tipo AS STRING, i AS INTEGER
    viga = RTRIM$(Vig(v).nome)
    arqVet = dirDados + obra + "_" + viga + ".VET"
    esc = 50#   ' RECONSTRUCAO: escala inicial; a re-edicao reaproveita a ultima digitada.
    DO
        CLS
        TelaMoldura 1, 1, 23, 80
        LOCATE 3, 10: PRINT "OBRA - "; obra
        LOCATE 4, 10: PRINT "VIGA - "; viga
        LOCATE 6, 10: PRINT "Escala 1/.. 200 100 50 25 ... ";
        s = EntradaTexto$(6, 43, 6, LTRIM$(STR$(esc)))
        esc = VAL(s)
        IF esc <= 0 THEN esc = 50#
        LOCATE 8, 10: PRINT "3 Cabecalhos e 2 Notas gerais, ate 40 caracteres cada"
        LOCATE 14, 10: PRINT "Quando nao alterado, mantem o anteriormente definido"
        txtCab(1) = EdiCampo$(9, "CAB 1) ", txtCab(1))
        txtCab(2) = EdiCampo$(10, "CAB 2) ", txtCab(2))
        txtCab(3) = EdiCampo$(11, "CAB 3) ", txtCab(3))
        txtNot(1) = EdiCampo$(12, "NOT 1) ", txtNot(1))
        txtNot(2) = EdiCampo$(13, "NOT 2) ", txtNot(2))
        TelaStatus "Aguarde ..."
        DcDesenhaViga v, arqVet, esc, obra
        IF NOT _FILEEXISTS(arqVet) THEN
            TelaErro "erro no processamento"
            EdiPausa "Acione ESC <Enter> para Continuar "
            EXIT SUB
        END IF
        EdiInsereTextos arqVet
        r = VetMostra%(arqVet)
        IF r <> 1 THEN
            IF r = -1 THEN
                TelaErro "verifique a consistencia dos seus dados"
            ELSE
                TelaErro "erro no processamento"
            END IF
            EdiPausa "Acione ESC <Enter> para Continuar "
            EXIT SUB
        END IF
    LOOP WHILE EdiSim%("Edito novamente o desenho da armacao para alteracoes S/N", "N")

    IF EdiSim%("Imprimo Desenho Definitivo da Viga na Impressora S/N", "N") THEN
        r = VetParaHpgl%(arqVet, dirDados + obra + "_" + viga + ".PLT")
        IF r = -1 THEN
            TelaErro "verifique a consistencia dos seus dados"
            EdiPausa "Acione ESC <Enter> para Continuar "
        END IF
    END IF

    IF EdiSim%("Gero arquivo publico padrao CAD S/N", "N") THEN
        LOCATE 21, 5: PRINT SPACE$(70)
        LOCATE 21, 5: PRINT "Tipo de Arquivo CAD  <A>utocad  <C>adtec ";
        tipo = UCASE$(EntradaTexto$(21, 50, 1, "A"))
        IF tipo <> "A" THEN
            TelaErro "Tipo C (Adtec) nao reconstruido: use A"
            EdiPausa "Acione ESC <Enter> para Continuar "
        ELSEIF EdiSim%("Dados Corretos N/S ", "S") THEN
            r = VetParaDxf%(arqVet, dirCad + obra + "_" + viga + ".DXF")
            IF r = -1 THEN
                TelaErro "verifique a consistencia dos seus dados"
                EdiPausa "Acione ESC <Enter> para Continuar "
            END IF
        END IF
    END IF
END SUB

' Reescreve o .VET acrescentando as notas CAB/NOT como entidades T, antes do F final.
SUB EdiInsereTextos (arq AS STRING)
    DIM fi AS INTEGER, fo AS INTEGER, s AS STRING, i AS INTEGER, y AS DOUBLE, tmp AS STRING
    tmp = arq + ".TMP"
    IF _FILEEXISTS(tmp) THEN KILL tmp
    fi = FREEFILE
    OPEN arq FOR INPUT AS #fi
    fo = FREEFILE
    OPEN tmp FOR OUTPUT AS #fo
    DO WHILE NOT EOF(fi)
        LINE INPUT #fi, s
        ' O .VET grava o fim como "F" com aspas (WRITE #).
        IF LTRIM$(RTRIM$(s)) = CHR$(34) + "F" + CHR$(34) THEN EXIT DO
        PRINT #fo, s
    LOOP
    CLOSE #fi
    y = -36#
    FOR i = 1 TO 3
        IF txtCab(i) <> "" THEN WRITE #fo, "T", 0#, y, 2.5#, 0#, 3, txtCab(i)
        y = y - 4#
    NEXT
    FOR i = 1 TO 2
        IF txtNot(i) <> "" THEN WRITE #fo, "T", 0#, y, 2.5#, 0#, 3, txtNot(i)
        y = y - 4#
    NEXT
    WRITE #fo, "F"
    CLOSE #fo
    KILL arq
    NAME tmp AS arq
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/CALCCA.BM'
