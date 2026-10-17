' ===============================================================
' FORMIMP.BAS - relatorio de quantitativos ou lista de elementos da Forma (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Chamado por FORMA. Le <obra>.FRM e grava <obra>_FORMIMP.LST na pasta de Formas,
' com a mesma saida mostrada na tela.
' Fontes: docs/modules/FORMIMP.md (sec. 3 e 7), dump de strings do FORMIMP.EXE (fora do repositorio).
' Dados: SISDADOS.BM (FrmLe%, Frm*()). Diretorios: FORMA.INI.
' Compilacao: tools/build.sh forma/FORMIMP
' Do original (dump): as sete opcoes "Imprimo ...", o campo de impressao
' ("SELECIONA", "campo de impressao definido ...") e "Retorno ao Modulo Basico de FORMA".
' RECONSTRUCAO: o dump nao tem relatorio tabular (FORMIMP.md, sec. 7). O LST de
' quantitativos e lista e criacao para o pedido. As sete opcoes filtram colunas do LST.
' Escala de impressao (tecla E em Aguarda; contas em FORMIMPESC.BM): grava um .VET por
' folha, <obra>_FORMIMP_<n>.VET em dirFrm$. Sem impressora. Telas do dump: "Escala do
' Desenho 1/ 100 *50* 20 FOTO", "folhas em ... partes", "Sigo com a Impressao do Desenho em
' Escala". RECONSTRUCAO: FOTO (ajuste automatico), penas por grupo, pausa "Ajuste a
' Impressora" (omitida). Nao reconstruido: copia da tela (ZOOM, cursor de Passo), carimbo e
' cotas do desenho. O LST nao usa escala.
' ===============================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST FORMA_INI_NOME = "FORMA.INI"
CONST IMP_OPCOES = 7

DIM SHARED obra$, dirDados$, dirLaj$, dirVig$, dirCol$, dirFrm$
DIM SHARED peDireito#, volTot#, areaTot#
DIM SHARED lstArq AS INTEGER
DIM SHARED mostra(1 TO IMP_OPCOES) AS INTEGER
DIM SHARED relLista%                       ' -1 = lista de elementos; 0 = quantitativos
DIM SHARED campoX1#, campoX2#, campoY1#, campoY2#
DIM SHARED bbOk%, bbX1#, bbX2#, bbY1#, bbY2#   ' caixa envolvente da forma

DECLARE SUB CarregaDirs ()
DECLARE FUNCTION IniDirDe$ (chave$)
DECLARE FUNCTION DirIni$ (chave$)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE FUNCTION ImpTexto$ (i%)
DECLARE FUNCTION Dentro% (ax1#, ay1#, ax2#, ay2#)
DECLARE FUNCTION TextoCampo$ ()
DECLARE SUB PerguntaPeDireito ()
DECLARE SUB PerguntaTipo ()
DECLARE SUB PerguntaOpcoes ()
DECLARE SUB PerguntaCampo ()
DECLARE SUB LimitesForma ()
DECLARE SUB BoxInclui (ax1#, ay1#, ax2#, ay2#)
DECLARE SUB Relatorio ()
DECLARE SUB ListaLajes ()
DECLARE SUB ListaVigas ()
DECLARE SUB ListaPilares ()
DECLARE SUB Subtotal (rotulo$, v#, a#)
DECLARE SUB ImpLinha (texto$)
DECLARE SUB Aguarda ()
DECLARE SUB Etapa (lin%, texto$)
DECLARE SUB FalhaProcessa (motivo$)
DECLARE SUB TelaFim ()
DECLARE SUB ImprimeEscala ()
DECLARE SUB DesenhaParte (f%, janX1#, janY1#, limX2#, limY2#, mmPorM#)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetCirculo (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION EscMmPorM# (escala AS INTEGER)
DECLARE FUNCTION EscFotoMmPorM# (largM AS DOUBLE, altM AS DOUBLE)
DECLARE FUNCTION EscFolhaM# (mmPorM AS DOUBLE, eixo AS INTEGER)
DECLARE FUNCTION EscTeto% (mm AS DOUBLE, folha AS DOUBLE)
DECLARE SUB EscPartes (largM AS DOUBLE, altM AS DOUBLE, mmPorM AS DOUBLE, nx AS INTEGER, ny AS INTEGER)
DECLARE SUB EscRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER, janX1 AS DOUBLE, janY1 AS DOUBLE, mmPorM AS DOUBLE, limX1 AS DOUBLE, limY1 AS DOUBLE, limX2 AS DOUBLE, limY2 AS DOUBLE)

' ---- programa principal ----
ComumDirExecDefine _CWD$
CarregaDirs
obra$ = ObraAtual$(dirDados$)
CLS
COLOR COR_TEXTO
IF obra$ = "" THEN
    FalhaProcessa "Obra corrente nao definida em SISTRUT.OBR"
ELSE
    Etapa 3, "Forma: " + obra$
    PerguntaPeDireito
    PerguntaTipo
    PerguntaOpcoes
    IF FrmLe%(dirDados$ + obra$ + ".FRM") = 0 THEN
        FalhaProcessa DadErro
    ELSE
        PerguntaCampo
        Relatorio
        Aguarda
    END IF
END IF
TelaFim

' Pergunta o pe-direito usado nos pilares; vazio ou zero cai em 3 m.
SUB PerguntaPeDireito
    Etapa 5, "Pe-direito (m) : "
    peDireito# = EntradaNumero#(5, 22, 8, 3)
    IF peDireito# <= 0 THEN peDireito# = 3
END SUB

' Tipo de relatorio: Q = quantitativos (so subtotais), L ou vazio = lista de elementos.
SUB PerguntaTipo
    DIM t$, k$
    ' RECONSTRUCAO: texto nao esta no dump.
    t$ = "Tipo de relatorio  <Q>uantitativos  <L>ista de elementos : "
    Etapa 6, t$
    k$ = EntradaTexto$(6, 4 + LEN(t$), 1, "L")
    relLista% = (UCASE$(LEFT$(k$, 1)) <> "Q")
END SUB

' Uma pergunta S/N por grupo de colunas; "N" desliga, qualquer outra resposta liga.
SUB PerguntaOpcoes
    DIM i%, t$, k$
    FOR i% = 1 TO IMP_OPCOES
        t$ = ImpTexto$(i%)
        Etapa 7 + i%, t$
        k$ = EntradaTexto$(7 + i%, 4 + LEN(t$), 1, "S")
        mostra(i%) = UCASE$(LEFT$(k$, 1)) <> "N"
    NEXT
END SUB

' Campo de impressao: <D>efine pede os limites X e Y em m; <T>odo ou Enter usa a forma inteira.
' RECONSTRUCAO: <R>etorna do original cai em "todo o campo" (sem volta ao menu).
SUB PerguntaCampo
    DIM t$, k$
    LimitesForma
    t$ = "<D>efine um campo de Impressao    <T>odo o campo    <*R*>etorna"
    Etapa 16, "SELECIONA"
    Etapa 17, t$
    k$ = EntradaTexto$(17, 4 + LEN(t$) + 1, 1, "T")
    IF UCASE$(LEFT$(k$, 1)) = "D" THEN
        ' RECONSTRUCAO: rotulos dos quatro limites nao estao no dump.
        Etapa 18, "X inicial (m) : "
        campoX1# = EntradaNumero#(18, 20, 10, bbX1#)
        Etapa 19, "X final   (m) : "
        campoX2# = EntradaNumero#(19, 20, 10, bbX2#)
        Etapa 20, "Y inicial (m) : "
        campoY1# = EntradaNumero#(20, 20, 10, bbY1#)
        Etapa 21, "Y final   (m) : "
        campoY2# = EntradaNumero#(21, 20, 10, bbY2#)
    ELSE
        campoX1# = bbX1#: campoX2# = bbX2#
        campoY1# = bbY1#: campoY2# = bbY2#
    END IF
    Etapa 23, TextoCampo$
END SUB

' Texto do dump "campo de impressao definido X=... a ...  Y=... a ..." com os limites atuais.
FUNCTION TextoCampo$
    TextoCampo$ = "campo de impressao definido X=" + FormataNumero$(campoX1#, 1, 8) + " a " + FormataNumero$(campoX2#, 1, 8) + "  Y=" + FormataNumero$(campoY1#, 2, 8) + " a " + FormataNumero$(campoY2#, 2, 8)
END FUNCTION

' Caixa envolvente de lajes, vigas (eixo) e pilares (face externa), em m; zero se a forma for vazia.
SUB LimitesForma
    DIM i%
    bbOk% = 0
    FOR i% = 1 TO FrmLajQtd
        BoxInclui FrmLaj(i%).x0, FrmLaj(i%).y0, FrmLaj(i%).x0 + FrmLaj(i%).lx, FrmLaj(i%).y0 + FrmLaj(i%).ly
    NEXT
    FOR i% = 1 TO FrmVigQtd
        BoxInclui FrmVig(i%).x1, FrmVig(i%).y1, FrmVig(i%).x2, FrmVig(i%).y2
    NEXT
    FOR i% = 1 TO FrmPilQtd
        BoxInclui FrmPil(i%).x - FrmPil(i%).bx / 200, FrmPil(i%).y - FrmPil(i%).by / 200, FrmPil(i%).x + FrmPil(i%).bx / 200, FrmPil(i%).y + FrmPil(i%).by / 200
    NEXT
    IF bbOk% = 0 THEN bbX1# = 0: bbX2# = 0: bbY1# = 0: bbY2# = 0
END SUB

' Inclui a caixa (ax1,ay1)-(ax2,ay2) na caixa da forma; aceita cantos em qualquer ordem.
SUB BoxInclui (ax1#, ay1#, ax2#, ay2#)
    DIM p1#, p2#, q1#, q2#
    p1# = ax1#: p2# = ax2#: q1# = ay1#: q2# = ay2#
    IF p1# > p2# THEN SWAP p1#, p2#
    IF q1# > q2# THEN SWAP q1#, q2#
    IF bbOk% = 0 THEN
        bbX1# = p1#: bbX2# = p2#: bbY1# = q1#: bbY2# = q2#: bbOk% = -1
    ELSE
        IF p1# < bbX1# THEN bbX1# = p1#
        IF p2# > bbX2# THEN bbX2# = p2#
        IF q1# < bbY1# THEN bbY1# = q1#
        IF q2# > bbY2# THEN bbY2# = q2#
    END IF
END SUB

' Verdadeiro se a caixa (ax1,ay1)-(ax2,ay2) cruza o campo de impressao; aceita cantos em qualquer ordem.
FUNCTION Dentro% (ax1#, ay1#, ax2#, ay2#)
    DIM p1#, p2#, q1#, q2#
    p1# = ax1#: p2# = ax2#: q1# = ay1#: q2# = ay2#
    IF p1# > p2# THEN SWAP p1#, p2#
    IF q1# > q2# THEN SWAP q1#, q2#
    Dentro% = (p2# >= campoX1#) AND (p1# <= campoX2#) AND (q2# >= campoY1#) AND (q1# <= campoY2#)
END FUNCTION

' Texto da opcao i% (ordem: nome e espessura das lajes, nome e secao das vigas,
' nome e secao dos pilares, cotas).
FUNCTION ImpTexto$ (i%)
    SELECT CASE i%
        CASE 1: ImpTexto$ = "Imprimo Nome das Lajes  S/N  "
        CASE 2: ImpTexto$ = "Imprimo Espessura das Lajes  S/N  "
        CASE 3: ImpTexto$ = "Imprimo Nome das Vigas  S/N  "
        CASE 4: ImpTexto$ = "Imprimo Secao das Vigas  S/N  "
        CASE 5: ImpTexto$ = "Imprimo Nome dos Pilares  S/N  "
        CASE 6: ImpTexto$ = "Imprimo Secao dos Pilares  S/N  "
        CASE 7: ImpTexto$ = "Imprimo Cotas e Medidas  S/N  "
    END SELECT
END FUNCTION

' Escreve o relatorio na tela e em <obra>_FORMIMP.LST: cabecalho, lajes, vigas, pilares e total.
SUB Relatorio
    DIM nome$
    CLS
    volTot# = 0: areaTot# = 0
    nome$ = dirFrm$ + obra$ + "_FORMIMP.LST"
    lstArq = FREEFILE
    OPEN nome$ FOR OUTPUT AS #lstArq
    ImpLinha "FORMA " + obra$ + "   pe-direito " + FormataNumero$(peDireito#, 2, 6) + " m"
    ImpLinha TextoCampo$
    ListaLajes
    ListaVigas
    ListaPilares
    ImpLinha ""
    ImpLinha "TOTAL  volume de concreto " + FormataNumero$(volTot#, 3, 10) + " m3   area de forma " + FormataNumero$(areaTot#, 3, 10) + " m2"
    ImpLinha "Arquivo gravado em " + nome$
    CLOSE #lstArq
END SUB

' Lajes dentro do campo: volume = lx*ly*h/100 (h em cm), area = lx*ly.
SUB ListaLajes
    DIM i%, gv#, ga#, v#, a#, t$
    ImpLinha ""
    ImpLinha "LAJES"
    gv# = 0: ga# = 0
    FOR i% = 1 TO FrmLajQtd
        IF Dentro%(FrmLaj(i%).x0, FrmLaj(i%).y0, FrmLaj(i%).x0 + FrmLaj(i%).lx, FrmLaj(i%).y0 + FrmLaj(i%).ly) THEN
            v# = FrmLaj(i%).lx * FrmLaj(i%).ly * FrmLaj(i%).h / 100
            a# = FrmLaj(i%).lx * FrmLaj(i%).ly
            IF relLista% THEN
                t$ = "  "
                IF mostra(1) THEN t$ = t$ + RTRIM$(FrmLaj(i%).nome) + "  "
                IF mostra(2) THEN t$ = t$ + "h=" + FormataNumero$(FrmLaj(i%).h, 1, 6) + " cm  "
                IF mostra(7) THEN t$ = t$ + "lx=" + FormataNumero$(FrmLaj(i%).lx, 2, 7) + " ly=" + FormataNumero$(FrmLaj(i%).ly, 2, 7) + "  "
                t$ = t$ + "vol=" + FormataNumero$(v#, 3, 9) + " m3  area=" + FormataNumero$(a#, 3, 9) + " m2"
                ImpLinha t$
            END IF
            gv# = gv# + v#: ga# = ga# + a#
        END IF
    NEXT
    Subtotal "lajes", gv#, ga#
END SUB

' Vigas dentro do campo: L = comprimento do eixo; volume = L*bw*h, area = L*(bw+2*h) (bw e h em cm).
SUB ListaVigas
    DIM i%, gv#, ga#, v#, a#, c#, t$
    ImpLinha ""
    ImpLinha "VIGAS"
    gv# = 0: ga# = 0
    FOR i% = 1 TO FrmVigQtd
        IF Dentro%(FrmVig(i%).x1, FrmVig(i%).y1, FrmVig(i%).x2, FrmVig(i%).y2) THEN
            c# = SQR((FrmVig(i%).x2 - FrmVig(i%).x1) ^ 2 + (FrmVig(i%).y2 - FrmVig(i%).y1) ^ 2)
            v# = c# * FrmVig(i%).bw / 100 * FrmVig(i%).h / 100
            a# = c# * (FrmVig(i%).bw + 2 * FrmVig(i%).h) / 100
            IF relLista% THEN
                t$ = "  "
                IF mostra(3) THEN t$ = t$ + RTRIM$(FrmVig(i%).nome) + "  "
                IF mostra(4) THEN t$ = t$ + FormataNumero$(FrmVig(i%).bw, 1, 6) + " x " + FormataNumero$(FrmVig(i%).h, 1, 6) + " cm  "
                IF mostra(7) THEN t$ = t$ + "L=" + FormataNumero$(c#, 2, 7) + " m  "
                t$ = t$ + "vol=" + FormataNumero$(v#, 3, 9) + " m3  area=" + FormataNumero$(a#, 3, 9) + " m2"
                ImpLinha t$
            END IF
            gv# = gv# + v#: ga# = ga# + a#
        END IF
    NEXT
    Subtotal "vigas", gv#, ga#
END SUB

' Pilares dentro do campo: volume = bx*by/10000*pd, area = 2*(bx+by)/100*pd (bx, by em cm).
SUB ListaPilares
    DIM i%, gv#, ga#, v#, a#, t$
    ImpLinha ""
    ImpLinha "PILARES"
    gv# = 0: ga# = 0
    FOR i% = 1 TO FrmPilQtd
        IF Dentro%(FrmPil(i%).x - FrmPil(i%).bx / 200, FrmPil(i%).y - FrmPil(i%).by / 200, FrmPil(i%).x + FrmPil(i%).bx / 200, FrmPil(i%).y + FrmPil(i%).by / 200) THEN
            v# = FrmPil(i%).bx * FrmPil(i%).by / 10000 * peDireito#
            a# = 2 * (FrmPil(i%).bx + FrmPil(i%).by) / 100 * peDireito#
            IF relLista% THEN
                t$ = "  "
                IF mostra(5) THEN t$ = t$ + RTRIM$(FrmPil(i%).nome) + "  "
                IF mostra(6) THEN t$ = t$ + FormataNumero$(FrmPil(i%).bx, 1, 6) + " x " + FormataNumero$(FrmPil(i%).by, 1, 6) + " cm  secao=" + FrmPil(i%).secao + "  "
                IF mostra(7) THEN t$ = t$ + "x=" + FormataNumero$(FrmPil(i%).x, 2, 7) + " y=" + FormataNumero$(FrmPil(i%).y, 2, 7) + "  "
                t$ = t$ + "vol=" + FormataNumero$(v#, 3, 9) + " m3  area=" + FormataNumero$(a#, 3, 9) + " m2"
                ImpLinha t$
            END IF
            gv# = gv# + v#: ga# = ga# + a#
        END IF
    NEXT
    Subtotal "pilares", gv#, ga#
END SUB

' Imprime o subtotal do grupo e soma no total geral.
SUB Subtotal (rotulo$, v#, a#)
    ImpLinha "  Subtotal " + rotulo$ + " vol=" + FormataNumero$(v#, 3, 10) + " m3  area=" + FormataNumero$(a#, 3, 10) + " m2"
    volTot# = volTot# + v#: areaTot# = areaTot# + a#
END SUB

' Escreve a linha na tela e no arquivo <obra>_FORMIMP.LST.
SUB ImpLinha (texto$)
    PRINT texto$
    PRINT #lstArq, texto$
END SUB

' Espera ESC ou Enter antes de sair da tela de relatorio; E imprime em escala (ImprimeEscala).
' RECONSTRUCAO: o aviso so vai para a tela; Relatorio ja fechou <obra>_FORMIMP.LST
' e um ImpLinha aqui dava erro 52 (arquivo nao aberto).
SUB Aguarda
    DIM k$
    PRINT "<E>scala   Acione ESC <Enter> para Continuar"
    DO
        k$ = TeclaLer$
        IF UCASE$(k$) = "E" THEN
            ImprimeEscala
            PRINT "<E>scala   Acione ESC <Enter> para Continuar"
        END IF
    LOOP UNTIL k$ = CHR$(27) OR k$ = CHR$(13)
END SUB

' Escala de impressao do campo: pede 100, 50, 20 ou FOTO, divide em folhas e grava
' <obra>_FORMIMP_<n>.VET (uma parte por arquivo). Sem impressora.
' RECONSTRUCAO: Enter vazio usa 50; a confirmacao N cancela sem gravar. Linhas 7, 8 e 10
' e o texto "Parte N gravada" nao estao no dump (so ha "folhas em", "partes" e "FOTO").
SUB ImprimeEscala
    DIM t$, k$, escala%, foto%, mmPorM#, largM#, altM#, nx%, ny%, ix%, iy%, n%
    DIM janX1#, janX2#, janY1#, janY2#, folhaX#, folhaY#, nome$, f%
    CLS
    COLOR COR_TEXTO
    Etapa 3, "Escolha de Escala para desenho de Forma em Impressora"
    t$ = "Escala do Desenho 1/ 100 *50* 20 FOTO "
    Etapa 5, t$
    DO
        k$ = UCASE$(EntradaTexto$(5, 4 + LEN(t$), 4, "50"))
        IF k$ = "" THEN k$ = "50"
    LOOP UNTIL k$ = "100" OR k$ = "50" OR k$ = "20" OR k$ = "FOTO"
    foto% = (k$ = "FOTO")
    IF NOT foto% THEN escala% = VAL(k$)

    largM# = campoX2# - campoX1#
    altM# = campoY2# - campoY1#
    IF foto% THEN
        mmPorM# = EscFotoMmPorM#(largM#, altM#)
        nx% = 1: ny% = 1
    ELSE
        mmPorM# = EscMmPorM#(escala%)
        EscPartes largM#, altM#, mmPorM#, nx%, ny%
    END IF
    folhaX# = EscFolhaM#(mmPorM#, 1)
    folhaY# = EscFolhaM#(mmPorM#, 2)

    IF foto% THEN
        Etapa 7, "Escala FOTO"
    ELSE
        Etapa 7, "Escala 1/" + LTRIM$(STR$(escala%))
    END IF
    Etapa 8, LTRIM$(STR$(nx% * ny%)) + " folhas em partes"
    t$ = "Sigo com a Impressao do Desenho em Escala  N/*S* "
    Etapa 10, t$
    k$ = EntradaTexto$(10, 4 + LEN(t$) + 1, 1, "S")
    IF UCASE$(LEFT$(k$, 1)) = "N" THEN EXIT SUB

    CLS
    n% = 0
    FOR iy% = 0 TO ny% - 1
        janY1# = campoY1# + iy% * folhaY#
        janY2# = janY1# + folhaY#
        IF janY2# > campoY2# THEN janY2# = campoY2#
        FOR ix% = 0 TO nx% - 1
            janX1# = campoX1# + ix% * folhaX#
            janX2# = janX1# + folhaX#
            IF janX2# > campoX2# THEN janX2# = campoX2#
            n% = n% + 1
            nome$ = dirFrm$ + obra$ + "_FORMIMP_" + LTRIM$(STR$(n%)) + ".VET"
            f% = VetAbre%(nome$, obra$ + " parte " + LTRIM$(STR$(n%)))
            DesenhaParte f%, janX1#, janY1#, janX2#, janY2#, mmPorM#
            VetFecha f%
            PRINT "Parte " + LTRIM$(STR$(n%)) + " gravada em " + nome$
        NEXT
    NEXT
END SUB

' Grava na folha f% as lajes (pena 1), vigas (pena 2) e pilares (pena 3) que cruzam a janela.
' (janX1,janY1) e a origem da folha; (limX2,limY2) o canto superior. Coordenadas em m.
' RECONSTRUCAO: vigas inclinadas nao saem (so retas em X ou em Y); penas por grupo.
SUB DesenhaParte (f%, janX1#, janY1#, limX2#, limY2#, mmPorM#)
    DIM i%, hw#, xa#, xb#, ya#, yb#
    FOR i% = 1 TO FrmLajQtd
        EscRetangulo f%, FrmLaj(i%).x0, FrmLaj(i%).y0, FrmLaj(i%).x0 + FrmLaj(i%).lx, FrmLaj(i%).y0 + FrmLaj(i%).ly, 1, janX1#, janY1#, mmPorM#, janX1#, janY1#, limX2#, limY2#
    NEXT
    FOR i% = 1 TO FrmVigQtd
        hw# = FrmVig(i%).bw / 200
        IF ABS(FrmVig(i%).y1 - FrmVig(i%).y2) < 0.000001 THEN
            xa# = FrmVig(i%).x1: xb# = FrmVig(i%).x2
            IF xa# > xb# THEN SWAP xa#, xb#
            ya# = FrmVig(i%).y1 - hw#: yb# = FrmVig(i%).y1 + hw#
        ELSEIF ABS(FrmVig(i%).x1 - FrmVig(i%).x2) < 0.000001 THEN
            ya# = FrmVig(i%).y1: yb# = FrmVig(i%).y2
            IF ya# > yb# THEN SWAP ya#, yb#
            xa# = FrmVig(i%).x1 - hw#: xb# = FrmVig(i%).x1 + hw#
        ELSE
            ' RECONSTRUCAO: viga inclinada nao e desenhada.
            xa# = 0: xb# = 0: ya# = 0: yb# = 0
        END IF
        IF xb# > xa# THEN EscRetangulo f%, xa#, ya#, xb#, yb#, 2, janX1#, janY1#, mmPorM#, janX1#, janY1#, limX2#, limY2#
    NEXT
    FOR i% = 1 TO FrmPilQtd
        hw# = FrmPil(i%).bx / 200
        ya# = FrmPil(i%).by / 200
        EscRetangulo f%, FrmPil(i%).x - hw#, FrmPil(i%).y - ya#, FrmPil(i%).x + hw#, FrmPil(i%).y + ya#, 3, janX1#, janY1#, mmPorM#, janX1#, janY1#, limX2#, limY2#
    NEXT
END SUB

' Preenche a pasta de dados (obra e .FRM, como FORMEDCA) e as quatro pastas
' (Lajes, Vigas, Colunas, Formas) a partir do FORMA.INI.
' Sem FORMA.INI, todas ficam na pasta de trabalho (DirUtilizavel$).
SUB CarregaDirs
    dirLaj$ = ComumDirExec$: dirVig$ = ComumDirExec$
    dirCol$ = ComumDirExec$: dirFrm$ = ComumDirExec$
    dirDados$ = DirUtilizavel$("")
    IF ArqLer%(ComumDirExec$ + FORMA_INI_NOME) < 0 THEN EXIT SUB
    dirDados$ = IniDirDados$
    dirLaj$ = DirIni$("ARQUIVOS DE LAJES")
    dirVig$ = DirIni$("ARQUIVOS DE VIGAS")
    dirCol$ = DirIni$("ARQUIVOS DE COLUNAS")
    dirFrm$ = DirIni$("ARQUIVOS DE FORMAS")
END SUB

' Diretorio do FORMA.INI para a chave; vazio cai no diretorio do executavel.
FUNCTION DirIni$ (chave$)
    DIM d$
    d$ = IniDirDe$(chave$)
    IF d$ = "" THEN d$ = ComumDirExec$
    DirIni$ = d$
END FUNCTION

' Pasta do FORMA.INI pela descricao da chave, validada por DirUtilizavel$
' (raiz ou pasta inexistente vira a pasta de trabalho). "" se a linha nao existir.
FUNCTION IniDirDe$ (chave$)
    DIM i%
    IniDirDe$ = ""
    i% = ArqAchaTexto%(chave$, 0)
    IF i% > 0 THEN IniDirDe$ = DirUtilizavel$(IniValor$(i%))
END FUNCTION

' Escreve o texto na linha lin%, a partir da coluna 4.
SUB Etapa (lin%, texto$)
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT texto$;
END SUB

' Mostra a falha de processamento com o motivo, espera ESC ou Enter e encerra.
' RECONSTRUCAO: o motivo pode passar de 76 colunas (caminho completo do .FRM);
' quebra em blocos de 76 a partir da linha 13 e o aviso de ESC desce logo abaixo.
SUB FalhaProcessa (motivo$)
    DIM k$, lin%, resto$
    CLS
    Etapa 11, "erro no processamento"
    Etapa 12, "verifique a consistencia dos seus dados"
    lin% = 13: resto$ = motivo$
    DO
        Etapa lin%, LEFT$(resto$, 76)
        resto$ = MID$(resto$, 77)
        lin% = lin% + 1
    LOOP UNTIL resto$ = ""
    Etapa lin%, "Acione ESC <Enter> para Continuar"
    DO
        k$ = TeclaLer$
    LOOP UNTIL k$ = CHR$(27) OR k$ = CHR$(13)
END SUB

' Encerramento como no gerenciador: mensagem de termino e volta ao FORMA.
SUB TelaFim
    CLS
    COLOR COR_TEXTO
    LOCATE 11, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    LOCATE 12, 10: PRINT "Retorno ao Modulo Basico de FORMA"
    COLOR COR_TEXTO, 0
    SYSTEM
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: 'FORMIMPESC.BM'
