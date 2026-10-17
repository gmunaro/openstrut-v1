' ===============================================================
' DESIMP.BAS - tabela de aco e desenho das vigas da familia DESENHO (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: dump de strings do DESIMP.EXE (fora do repositorio), docs/modules/_FAMILIA_DESENHO.md.
' Entrada: <dirEdv><obra>.EDV (vigas editadas), <dirEdv><obra>.EDX (tipo e
'          inicio das barras, se existir), o .DSP da obra (cobrimento e
'          materiais) e DESENHO.INI (diretorios).
' Saida: <dirDados><obra>_<viga>.VET (uma por viga consultada) e,
'        por opcao, <dirCad><obra>_TABELA.DXF (tabela de aco, raio de
'        dobramento, forma e cortes de cada viga).
' Tabela: metros, kg/m e kg por bitola, somando todas as vigas do .EDV.
' Lacunas: REPETIR (repeticoes por viga), medidas, DESINIT.
' Compilacao: tools/build.sh desenho/DESIMP
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST IMP_MAXLISTA = 64      ' vigas listadas na tela (4 colunas de 16 linhas)

DECLARE FUNCTION VetMostra% (arqVet AS STRING)
DECLARE FUNCTION VetParaDxf% (arqVet AS STRING, arqDxf AS STRING)
DECLARE FUNCTION ImpAcha% (nome AS STRING)
DECLARE FUNCTION DcTabelaAco# (compr() AS DOUBLE, peso() AS DOUBLE)
DECLARE FUNCTION DcPesoMetro# (phi AS DOUBLE)
DECLARE FUNCTION CcaBitola# (i AS INTEGER)
DECLARE SUB DcDesenhaVigaGeo (v AS INTEGER, arq AS STRING, esc AS DOUBLE, obra AS STRING, gT() AS STRING, gX() AS DOUBLE, nota AS STRING)
DECLARE SUB DcGeoBarra (v AS INTEGER, t AS INTEGER, k AS INTEGER, gT() AS STRING, gX() AS DOUBLE, tipo AS STRING, xi AS DOUBLE)
DECLARE FUNCTION DcLeEdx% (arq AS STRING, gT() AS STRING, gX() AS DOUBLE)
DECLARE FUNCTION DcAvisoAsLinha$ (v AS INTEGER, fck AS DOUBLE, gc AS DOUBLE, fyk AS DOUBLE, gs AS DOUBLE)
DECLARE SUB DcLeMateriais (arq AS STRING, cob AS DOUBLE, fck AS DOUBLE, gc AS DOUBLE, fyk AS DOUBLE, gs AS DOUBLE)
DECLARE FUNCTION DcDiamPino# (phi AS DOUBLE)
DECLARE FUNCTION ImpArqDsp$ ()
DECLARE SUB ImpDxfVigas (f AS INTEGER, y AS DOUBLE)
DECLARE SUB DxfRetangulo (f AS INTEGER, layer AS STRING, xa AS DOUBLE, ya AS DOUBLE, xb AS DOUBLE, yb AS DOUBLE)
DECLARE SUB DxfCirculo (f AS INTEGER, layer AS STRING, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE)
DECLARE SUB ImpListaVigas (obra AS STRING)
DECLARE SUB ImpDesenha (v AS INTEGER, dirDados AS STRING, obra AS STRING)
DECLARE SUB ImpTabela (dirCad AS STRING, obra AS STRING)
DECLARE SUB ImpTabDxf (arq AS STRING, obra AS STRING, compr() AS DOUBLE, peso() AS DOUBLE)
DECLARE SUB DxfCamada (f AS INTEGER, nome AS STRING)
DECLARE SUB DxfTexto (f AS INTEGER, layer AS STRING, x AS DOUBLE, y AS DOUBLE, h AS DOUBLE, txt AS STRING)
DECLARE SUB DxfLinha (f AS INTEGER, layer AS STRING, xa AS DOUBLE, ya AS DOUBLE, xb AS DOUBLE, yb AS DOUBLE)
DECLARE FUNCTION DxfNum$ (v AS DOUBLE)
DECLARE SUB ImpPausa (msg AS STRING)
DECLARE SUB ImpFim

' Tipo e inicio (cm) de cada barra vindos do .EDX, paralelos a VigPos (DcLeEdx%).
DIM SHARED ImpGT(1 TO DAD_MAXPOS) AS STRING, ImpGX(1 TO DAD_MAXPOS) AS DOUBLE
' Cobrimento (cm) e materiais (tf/cm2) do .DSP da obra (DcLeMateriais).
DIM SHARED ImpCob AS DOUBLE, ImpFck AS DOUBLE, ImpGc AS DOUBLE, ImpFyk AS DOUBLE, ImpGs AS DOUBLE

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, dirEdv AS STRING, dirCad AS STRING, obra AS STRING
DIM nome AS STRING, v AS INTEGER, q AS INTEGER

IF ArqLer%("DESENHO.INI") < 0 THEN
    TelaErro "erro no processamento"
    ImpPausa "Acione ESC <Enter> para Continuar "
    ImpFim
END IF

dirDados = IniDirDados$
dirEdv = DirUtilizavel$(RTRIM$(IniValor$(4)))  ' mesma regra de DESINIT
dirCad = DirUtilizavel$(RTRIM$(IniValor$(5)))
obra = ObraAtual$(dirDados)

IF obra = "" THEN
    TelaErro "verifique a consistencia dos seus dados"
    ImpPausa "Acione ESC <Enter> para Continuar "
    ImpFim
END IF

IF VigLe%(dirEdv + obra + ".EDV", "EDV") = 0 THEN
    TelaErro DadErro
    ImpPausa "Acione ESC <Enter> para Continuar "
    ImpFim
END IF

IF VigQtd = 0 THEN
    TelaErro "verifique a consistencia dos seus dados"
    ImpPausa "Acione ESC <Enter> para Continuar "
    ImpFim
END IF

q = DcLeEdx%(dirEdv + obra + ".EDX", ImpGT(), ImpGX())
DcLeMateriais ImpArqDsp$, ImpCob, ImpFck, ImpGc, ImpFyk, ImpGs

' Lista as vigas. Nome de viga gera o .VET dela; nome em branco abre a tabela de aco.
DO
    ImpListaVigas obra
    nome = EntradaTexto$(21, 12, 20, "")
    IF nome = "" THEN EXIT DO
    v = ImpAcha%(nome)
    IF v = 0 THEN
        TelaErro "verifique a consistencia dos seus dados"
        ImpPausa "Acione ESC <Enter> para Continuar "
    ELSE
        ImpDesenha v, dirDados, obra
    END IF
LOOP

ImpTabela dirCad, obra
ImpFim

' Acha a viga cujo nome, sem caixa nem espacos nas pontas, bate com nome. 0 = nao achou.
FUNCTION ImpAcha% (nome AS STRING)
    DIM n AS STRING, v AS INTEGER
    n = UCASE$(LTRIM$(RTRIM$(nome)))
    ImpAcha% = 0
    FOR v = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(v).nome)) = n THEN
            ImpAcha% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Lista as vigas do .EDV em 4 colunas a partir da linha 4.
' Passou de IMP_MAXLISTA: some da tela, mas continua aceita pelo nome.
SUB ImpListaVigas (obra AS STRING)
    DIM v AS INTEGER
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 3, 10: PRINT "DESIMP"
    FOR v = 1 TO VigQtd
        IF v > IMP_MAXLISTA THEN EXIT FOR
        LOCATE 4 + ((v - 1) MOD 16), 5 + ((v - 1) \ 16) * 18
        PRINT RTRIM$(Vig(v).nome)
    NEXT
    LOCATE 19, 5: PRINT "Retorno ao Modulo Gerenciador"
    LOCATE 20, 5: PRINT "Enter em branco: TABELA de aco"
    LOCATE 21, 5: PRINT "VIGA - "
END SUB

' Gera o .VET da viga v na escala 1/50 e mostra o desenho. Qualquer tecla volta a lista.
' As barras seguem o tipo e o inicio do .EDX; a nota avisa armadura dupla sem As'.
SUB ImpDesenha (v AS INTEGER, dirDados AS STRING, obra AS STRING)
    DIM viga AS STRING, arqVet AS STRING, esc AS DOUBLE, r AS INTEGER, k AS STRING
    viga = RTRIM$(Vig(v).nome)
    arqVet = dirDados + obra + "_" + viga + ".VET"
    esc = 50#
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 3, 10: PRINT "OBRA - "; obra
    LOCATE 4, 10: PRINT "VIGA - "; viga
    LOCATE 5, 10: PRINT "ESCALA 1/50"
    TelaStatus "Aguarde ..."
    DcDesenhaVigaGeo v, arqVet, esc, obra, ImpGT(), ImpGX(), DcAvisoAsLinha$(v, ImpFck, ImpGc, ImpFyk, ImpGs)
    IF NOT _FILEEXISTS(arqVet) THEN
        TelaErro "erro no processamento"
        ImpPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    r = VetMostra%(arqVet)
    IF r <> 1 THEN
        IF r = -1 THEN
            TelaErro "verifique a consistencia dos seus dados"
        ELSE
            TelaErro "erro no processamento"
        END IF
        ImpPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    TelaStatus "Qualquer Tecla para Continuar "
    DO
        k = TeclaLer$
    LOOP UNTIL k <> ""
END SUB

' Mostra a tabela de aco de todas as vigas do .EDV: metros, kg/m e kg por bitola, e o total.
' X grava <dirCad><obra>_TABELA.DXF. Qualquer outra tecla volta.
SUB ImpTabela (dirCad AS STRING, obra AS STRING)
    DIM compr(1 TO 9) AS DOUBLE, peso(1 TO 9) AS DOUBLE, tot AS DOUBLE
    DIM i AS INTEGER, lin AS INTEGER, k AS STRING
    tot = DcTabelaAco#(compr(), peso())
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 3, 10: PRINT "FERRO"
    ' RECONSTRUCAO: cabecalho alinhado as colunas de ImpTabela (bitola, metros, kg/m, kg).
    ' "#" e "Q" vem do original, mas nao ha quantidade de barras na tabela.
    LOCATE 4, 10: PRINT "ACO"
    LOCATE 4, 15: PRINT "#"
    LOCATE 4, 19: PRINT "TOTAL"
    LOCATE 4, 33: PRINT "PESO"
    LOCATE 5, 12: PRINT "Q"
    LOCATE 5, 30: PRINT "UNI"
    LOCATE 5, 38: PRINT "TOTAL"
    lin = 6
    FOR i = 1 TO 9
        IF compr(i) > 0 THEN
            LOCATE lin, 10
            PRINT USING "##.#  #####.##  ###.###  #####.##"; CcaBitola#(i); compr(i); DcPesoMetro#(CcaBitola#(i)); peso(i)
            lin = lin + 1
        END IF
    NEXT
    LOCATE lin + 1, 10: PRINT "PESO TOTAL (kg): ";
    PRINT USING "#####.##"; tot
    TelaStatus "X - grava tabela DXF   Qualquer tecla - voltar "
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    IF k = "X" THEN ImpTabDxf dirCad + obra + "_TABELA.DXF", obra, compr(), peso()
END SUB

' Grava a tabela em DXF R12 minimo, em mm no papel, com TABLES de camadas:
' tabela de aco, raio de dobramento por bitola (DcDiamPino#) e, por viga, a
' forma e os cortes (ImpDxfVigas). Camadas dos textos do original (DESIMP.strings:
' COTAS, FERRO, TEXTO, FORMA, CORTE, TABELA) [inferido: uso de cada camada].
' RECONSTRUCAO: a camada FORMAFE do original fica de fora (sem geometria reconstruida).
' Usado so pela opcao X de ImpTabela.
SUB ImpTabDxf (arq AS STRING, obra AS STRING, compr() AS DOUBLE, peso() AS DOUBLE)
    DIM f AS INTEGER, i AS INTEGER, y AS DOUBLE, tot AS DOUBLE
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    PRINT #f, "999": PRINT #f, "* PROGER   SISTRUT-DESENHO VERSAO 40"
    PRINT #f, "999": PRINT #f, "UNI      1.00 mm"
    PRINT #f, "  0": PRINT #f, "SECTION"
    PRINT #f, "  2": PRINT #f, "TABLES"
    PRINT #f, "  0": PRINT #f, "TABLE"
    PRINT #f, "  2": PRINT #f, "LAYER"
    PRINT #f, " 70": PRINT #f, "7"
    DxfCamada f, "0"
    DxfCamada f, "CORTE"
    DxfCamada f, "FORMA"
    DxfCamada f, "TEXTO"
    DxfCamada f, "FERRO"
    DxfCamada f, "COTAS"
    DxfCamada f, "TABELA"
    PRINT #f, "  0": PRINT #f, "ENDTAB"
    PRINT #f, "  0": PRINT #f, "ENDSEC"
    PRINT #f, "  0": PRINT #f, "SECTION"
    PRINT #f, "  2": PRINT #f, "ENTITIES"
    y = 0#
    DxfTexto f, "TABELA", 0#, y, 3.5#, "TABELA"
    y = y - 6#
    DxfTexto f, "TEXTO", 0#, y, 2.5#, "OBRA " + obra
    y = y - 4#
    DxfTexto f, "FERRO", 0#, y, 2.5#, "FERRO"
    y = y - 4#
    tot = 0#
    FOR i = 1 TO 9
        IF compr(i) > 0 THEN
            ' metros e kg com 2 casas, como na tela
            DxfTexto f, "FERRO", 0#, y, 2.5#, "d" + DxfNum$(CcaBitola#(i)) + "  " + DxfNum$(INT(compr(i) * 100# + 0.5) / 100#) + " m  " + DxfNum$(INT(peso(i) * 100# + 0.5) / 100#) + " kg"
            tot = tot + peso(i)
            y = y - 4#
        END IF
    NEXT
    ' Cota: linha de base da tabela e peso total.
    DxfLinha f, "COTAS", 0#, y, 40#, y
    y = y - 4#
    DxfTexto f, "COTAS", 0#, y, 2.5#, "PESO TOTAL " + DxfNum$(INT(tot * 100# + 0.5) / 100#) + " kg"
    y = y - 8#
    DxfTexto f, "TABELA", 0#, y, 2.5#, "Raio de Dobramento"
    FOR i = 1 TO 9
        IF compr(i) > 0 THEN
            y = y - 4#
            DxfTexto f, "TABELA", 0#, y, 2.5#, "d" + DxfNum$(CcaBitola#(i)) + "  pino " + DxfNum$(DcDiamPino#(CcaBitola#(i))) + " mm  raio " + DxfNum$(DcDiamPino#(CcaBitola#(i)) / 2#) + " mm"
        END IF
    NEXT
    ImpDxfVigas f, y
    PRINT #f, "  0": PRINT #f, "ENDSEC"
    PRINT #f, "  0": PRINT #f, "EOF"
    CLOSE #f
END SUB

' Grava no DXF f, descendo a partir de y (mm), cada viga do .EDV: a FORMA em
' elevacao na escala 1/50 (contorno de cada tramo e os apoios, como no .VET) e
' o CORTE no meio de cada tramo na escala 1/10 (secao bw x h, estribo com o
' cobrimento do .DSP e as barras que passam ali, P/G embaixo e N/PE em cima,
' em circulos na largura, como DecCorteVet% do DESEDCAO). Ao sair, y fica
' abaixo da ultima viga.
' RECONSTRUCAO: barras numa camada so; apoio com largura fixa (o .EDV nao a traz).
SUB ImpDxfVigas (f AS INTEGER, y AS DOUBLE)
    DIM v AS INTEGER, t AS INTEGER, ti AS INTEGER, tt AS INTEGER, k AS INTEGER, j AS INTEGER, i AS INTEGER, lado AS INTEGER
    DIM s AS DOUBLE, x0 AS DOUBLE, L AS DOUBLE, hh AS DOUBLE, yb AS DOUBLE, yc AS DOUBLE, xc AS DOUBLE, xm AS DOUBLE
    DIM bw AS DOUBLE, h AS DOUBLE, phiE AS DOUBLE, r AS DOUBLE, yy AS DOUBLE, xa AS DOUBLE, xb AS DOUBLE, xx AS DOUBLE
    DIM tipo AS STRING, xi AS DOUBLE, nb(0 TO 1) AS INTEGER, phiM(0 TO 1) AS DOUBLE, txt(0 TO 1) AS STRING
    s = 20#                     ' 1/50: mm de papel por m
    FOR v = 1 TO VigQtd
        bw = Vig(v).bw: h = Vig(v).h: hh = h / 100# * s
        y = y - 10#
        DxfTexto f, "TEXTO", 0#, y, 2.5#, "VIGA " + RTRIM$(Vig(v).nome) + " " + DxfNum$(bw) + "x" + DxfNum$(h) + "  FORMA 1/50  CORTE 1/10"
        yb = y - 6# - hh
        x0 = 0
        FOR t = 1 TO Vig(v).nTramos
            L = VigTra(Vig(v).iTra + t - 1).vao * s
            DxfRetangulo f, "FORMA", x0, yb, x0 + L, yb + hh
            IF RTRIM$(VigApo(Vig(v).iApo + t - 1).nome) <> "-" THEN DxfRetangulo f, "FORMA", x0 - 2#, yb - 6#, x0 + 2#, yb
            x0 = x0 + L
        NEXT
        IF RTRIM$(VigApo(Vig(v).iApo + Vig(v).nTramos).nome) <> "-" THEN DxfRetangulo f, "FORMA", x0 - 2#, yb - 6#, x0 + 2#, yb
        ' cortes no meio de cada tramo (1/10: cm da secao = mm de papel); xm em cm da ponta esquerda
        yc = yb - 12# - h: xc = 0: xm = 0
        FOR t = 1 TO Vig(v).nTramos
            ti = Vig(v).iTra + t - 1
            IF t > 1 THEN xm = xm + VigTra(ti - 1).vao * 50#
            xm = xm + VigTra(ti).vao * 50#
            phiE = VigTra(ti).phiEst
            DxfRetangulo f, "CORTE", xc, yc, xc + bw, yc + h
            IF phiE > 0 THEN DxfRetangulo f, "FERRO", xc + ImpCob, yc + ImpCob, xc + bw - ImpCob, yc + h - ImpCob
            FOR lado = 0 TO 1: nb(lado) = 0: phiM(lado) = 0: txt(lado) = "": NEXT
            FOR tt = 1 TO Vig(v).nTramos
                FOR k = 0 TO VigTra(Vig(v).iTra + tt - 1).nPosFerro - 1
                    j = VigTra(Vig(v).iTra + tt - 1).iPosFerro + k
                    DcGeoBarra v, tt, k, ImpGT(), ImpGX(), tipo, xi
                    lado = -1
                    IF tipo = "P" OR tipo = "G" THEN lado = 0
                    IF tipo = "N" OR tipo = "PE" THEN lado = 1
                    IF lado >= 0 AND VigPos(j).n > 0 AND xm >= xi AND xm <= xi + VigPos(j).compr THEN
                        nb(lado) = nb(lado) + VigPos(j).n
                        IF VigPos(j).phi > phiM(lado) THEN phiM(lado) = VigPos(j).phi
                        txt(lado) = txt(lado) + " N" + LTRIM$(STR$(VigPos(j).numPos)) + " " + LTRIM$(STR$(VigPos(j).n)) + " d" + DxfNum$(VigPos(j).phi)
                    END IF
                NEXT
            NEXT
            FOR lado = 0 TO 1
                IF nb(lado) > 0 THEN
                    r = phiM(lado) / 20#
                    IF lado = 0 THEN yy = ImpCob + phiE / 10# + r ELSE yy = h - ImpCob - phiE / 10# - r
                    xa = ImpCob + phiE / 10# + r: xb = bw - xa
                    FOR i = 1 TO nb(lado)
                        IF nb(lado) = 1 THEN xx = bw / 2# ELSE xx = xa + (xb - xa) * (i - 1) / (nb(lado) - 1)
                        DxfCirculo f, "FERRO", xc + xx, yc + yy, r
                    NEXT
                    DxfTexto f, "TEXTO", xc + bw + 2#, yc + yy, 1.8#, LTRIM$(txt(lado))
                END IF
            NEXT
            DxfTexto f, "TEXTO", xc, yc - 4#, 1.8#, "CORTE T" + LTRIM$(STR$(t))
            xc = xc + bw + 45#
        NEXT
        y = yc - 8#
    NEXT
END SUB

' Grava um retangulo como 4 LINE na camada layer, cantos (xa, ya) e (xb, yb) em mm.
SUB DxfRetangulo (f AS INTEGER, layer AS STRING, xa AS DOUBLE, ya AS DOUBLE, xb AS DOUBLE, yb AS DOUBLE)
    DxfLinha f, layer, xa, ya, xb, ya
    DxfLinha f, layer, xb, ya, xb, yb
    DxfLinha f, layer, xb, yb, xa, yb
    DxfLinha f, layer, xa, yb, xa, ya
END SUB

' Grava um CIRCLE na camada layer, centro (x, y) e raio r, em mm.
SUB DxfCirculo (f AS INTEGER, layer AS STRING, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE)
    PRINT #f, "  0": PRINT #f, "CIRCLE"
    PRINT #f, "  8": PRINT #f, layer
    PRINT #f, " 10": PRINT #f, DxfNum$(x)
    PRINT #f, " 20": PRINT #f, DxfNum$(y)
    PRINT #f, " 40": PRINT #f, DxfNum$(r)
END SUB

' Caminho do .DSP da obra: pasta da linha 3 do DESENHO.INI ou, se nao estiver
' la, pasta do programa (como DESINIT e DESEDCAO).
FUNCTION ImpArqDsp$
    DIM arq AS STRING
    arq = DirUtilizavel$(RTRIM$(IniValor$(3))) + RTRIM$(IniValor$(1)) + ".DSP"
    IF NOT _FILEEXISTS(arq) THEN arq = ComumDirExec$ + RTRIM$(IniValor$(1)) + ".DSP"
    ImpArqDsp$ = arq
END FUNCTION

' Escreve uma camada (registro LAYER) dentro da TABLE LAYER.
SUB DxfCamada (f AS INTEGER, nome AS STRING)
    PRINT #f, "  0": PRINT #f, "LAYER"
    PRINT #f, "  2": PRINT #f, nome
    PRINT #f, " 70": PRINT #f, "0"
    PRINT #f, " 62": PRINT #f, "7"
    PRINT #f, "  6": PRINT #f, "CONTINUOUS"
END SUB

' Grava um TEXT na camada layer, no ponto (x, y), altura h, em mm.
SUB DxfTexto (f AS INTEGER, layer AS STRING, x AS DOUBLE, y AS DOUBLE, h AS DOUBLE, txt AS STRING)
    PRINT #f, "  0": PRINT #f, "TEXT"
    PRINT #f, "  8": PRINT #f, layer
    PRINT #f, " 10": PRINT #f, DxfNum$(x)
    PRINT #f, " 20": PRINT #f, DxfNum$(y)
    PRINT #f, " 40": PRINT #f, DxfNum$(h)
    PRINT #f, "  1": PRINT #f, txt
END SUB

' Grava um LINE na camada layer, de (xa, ya) a (xb, yb), em mm.
SUB DxfLinha (f AS INTEGER, layer AS STRING, xa AS DOUBLE, ya AS DOUBLE, xb AS DOUBLE, yb AS DOUBLE)
    PRINT #f, "  0": PRINT #f, "LINE"
    PRINT #f, "  8": PRINT #f, layer
    PRINT #f, " 10": PRINT #f, DxfNum$(xa)
    PRINT #f, " 20": PRINT #f, DxfNum$(ya)
    PRINT #f, " 11": PRINT #f, DxfNum$(xb)
    PRINT #f, " 21": PRINT #f, DxfNum$(yb)
END SUB

' Numero em texto para DXF: sem espaco inicial e com zero antes do ponto (STR$ gera ".5").
FUNCTION DxfNum$ (v AS DOUBLE)
    DIM s AS STRING
    s = LTRIM$(STR$(v))
    IF LEFT$(s, 1) = "." THEN s = "0" + s
    IF LEFT$(s, 2) = "-." THEN s = "-0" + MID$(s, 2)
    DxfNum$ = s
END FUNCTION

' Mostra msg na linha de status e espera ENTER ou ESC.
SUB ImpPausa (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mensagem de encerramento, como no dump.
SUB ImpFim
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
