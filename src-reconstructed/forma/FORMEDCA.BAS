' ============================================================================
'  FORMEDCA.BAS - edicao da forma do pavimento (amarracao, elevacao, cotas).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de FORMEDCA.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/FORMEDCA.md.
'
'  Implementado:
'  - P e V: amarracao de pilares (ponto em X e Y) e de faces de vigas por
'    coordenada, eixo (<obra>.EIX), outro pilar ou viga (spec 3.2 a 3.4),
'    geometria em FORMAMAR.BM; tambem editam bx/by e bw/h. B: espessura da laje.
'    Tudo em memoria; vai ao .FRM no G. Elemento amarrado fica bloqueado ate R.
'  - E: cota basica e alinhamento em <obra>.FEL. Nao recalcula Z de lajes e vigas.
'  - R e Z: desenho da forma em <obra>_FORMA.VET (1:50 em R; Z pede o fator).
'  - D: lista dos elementos com dimensoes.
'  - F: quantitativos. G: <obra>.FRM e, em seguida, .FOR e .CFO (desenho).
'  RECONSTRUCAO: T (textos) e C (cotas) saem do menu. O EXE edita posicao de
'  texto e linha de cota, e os arquivos de obra nao guardam esses dados.
'  Verificacao de licenca do original nao reimplementada. Formato .FRM nao decodificado:
'  FrmGrava (SISDADOS.BM) grava o layout reconstruido.
' ============================================================================

' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Rotinas de SISDADOS.BM, SISPLOT.BM e FORMCALC.BM (o .BI nao traz DECLARE)
DECLARE SUB DadBackup (arq AS STRING)
DECLARE FUNCTION DadAbreLeitura% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE FUNCTION DadAbreGravacao% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE SUB FrmGrava (arq AS STRING)
DECLARE SUB ForGrava (arq AS STRING, nivel AS INTEGER)
DECLARE SUB CfoGrava (arq AS STRING, nivel AS INTEGER, altura AS DOUBLE)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE FUNCTION VigLe% (arq AS STRING, tipo AS STRING)
DECLARE FUNCTION ColLe% (arq AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
DECLARE SUB FcMontaForma (msg AS STRING)
DECLARE FUNCTION FcAreaForma# (peDireito AS DOUBLE)
DECLARE FUNCTION FcVolumeConcreto# ()
DECLARE FUNCTION FcCompVig# (v AS INTEGER)
DECLARE FUNCTION FcEspLaje# (i AS INTEGER)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetCirculo (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION VetMostra% (arq AS STRING)

' Rotinas de FORMAMAR.BM (geometria da amarracao)
DECLARE FUNCTION FaFace# (centro AS DOUBLE, dimensao AS DOUBLE, lado AS INTEGER)
DECLARE FUNCTION FaCentro# (alvo AS DOUBLE, dimensao AS DOUBLE, lado AS INTEGER)
DECLARE FUNCTION FaAlvo# (ref AS DOUBLE, dist AS DOUBLE, ang AS DOUBLE)
DECLARE FUNCTION FaLadoVertice% (k AS INTEGER, s AS INTEGER)
DECLARE SUB FaMoveFace (centro AS DOUBLE, dimensao AS DOUBLE, lado AS INTEGER, alvo AS DOUBLE)
DECLARE FUNCTION FaSentidoViga% (x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE)

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB CarregaEixos ()
DECLARE SUB CarregaObra ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE FUNCTION ConfirmaS% (texto AS STRING)
DECLARE FUNCTION AchaPilar% (txt AS STRING)
DECLARE FUNCTION AchaViga% (txt AS STRING)
DECLARE FUNCTION AchaLaje% (txt AS STRING)
DECLARE SUB ItemEditaPilar ()
DECLARE SUB ItemEditaViga ()
DECLARE SUB ItemEditaLaje ()
DECLARE SUB ItemElevacao ()
DECLARE SUB ItemDesenha (fator AS DOUBLE)
DECLARE SUB ItemZoom ()
DECLARE SUB ItemDetalhes ()
DECLARE SUB DetLinha (texto AS STRING, lin AS INTEGER)
DECLARE SUB DesenhaForma (esc AS DOUBLE)
DECLARE SUB DesLimites (xmin AS DOUBLE, ymin AS DOUBLE)
DECLARE FUNCTION DesCoord# (v AS DOUBLE, mn AS DOUBLE, esc AS DOUBLE)
DECLARE SUB DesViga (f AS INTEGER, v AS INTEGER, xmin AS DOUBLE, ymin AS DOUBLE, esc AS DOUBLE)
DECLARE SUB DesPilar (f AS INTEGER, i AS INTEGER, xmin AS DOUBLE, ymin AS DOUBLE, esc AS DOUBLE)
DECLARE SUB ItemGrava ()
DECLARE SUB ItemDadosDesenho ()
DECLARE SUB ItemQuantitativos ()
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE FUNCTION ArqObra$ (ext AS STRING)

CONST FORMEDCA_INI = "FORMA.INI"    ' RECONSTRUCAO: mesmo INI de FORMA (a confirmar)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra

' Amarracao (so em memoria; os formatos de arquivo nao mudam)
CONST AMR_MAXEIX = 40               ' eixos por direcao lidos do .EIX
DIM SHARED PilAlt(1 TO DAD_MAXPIL) AS INTEGER           ' -1 = pilar amarrado desde o ultimo R
DIM SHARED VigAlt(1 TO DAD_MAXVIG) AS INTEGER           ' -1 = viga amarrada desde o ultimo R
DIM SHARED PilDesc(1 TO DAD_MAXPIL, 1 TO 2) AS STRING   ' descricao da amarracao em X e Y
DIM SHARED VigDesc(1 TO DAD_MAXVIG) AS STRING           ' descricao da amarracao das faces
DIM SHARED EixN(1 TO 2) AS INTEGER                      ' eixos: 1 horizontais, 2 verticais
DIM SHARED EixC(1 TO 2, 1 TO AMR_MAXEIX) AS DOUBLE      ' cota (m) de cada eixo
DIM SHARED EscX(1 TO 5) AS DOUBLE, EscY(1 TO 5) AS DOUBLE   ' pontos mostrados por Escolhe%

CarregaConfiguracao
CarregaObra
MenuPrincipal
CLS
PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le FORMA.INI do diretorio de execucao para achar o diretorio de dados.
' Sem INI, IniDirDados$ cai na pasta de trabalho (DirUtilizavel$).
SUB CarregaConfiguracao
    ComumDirExecDefine _CWD$
    IF ArqLer%(ComumDirExec$ + FORMEDCA_INI) >= 0 THEN
        DirDados = IniDirDados$
    ELSE
        DirDados = DirUtilizavel$("")
    END IF
END SUB

' Define a obra corrente (pergunta se nao houver) e carrega .LAJ, .VIG e .COL.
' Arquivo ausente deixa o tipo vazio; erro de leitura mostra DadErro.
SUB CarregaObra
    FrmObra = ObraAtual$(DirDados)
    IF FrmObra = "" THEN
        CLS
        TelaCabecalho ""
        LOCATE 6, 3: PRINT "Nome da obra corrente: ";
        FrmObra = EntradaTexto$(6, 27, 30, "")
        IF FrmObra = "" THEN FrmObra = "sem nome"
        ObraDefine DirDados, FrmObra
    END IF
    LajObra = FrmObra
    VigObra = FrmObra
    ColObra = FrmObra
    LajQtd = 0
    VigQtd = 0
    ColQtd = 0
    IF _FILEEXISTS(ArqObra$(".LAJ")) THEN
        IF LajLe%(ArqObra$(".LAJ")) = 0 THEN Espera DadErro, -1
    END IF
    IF _FILEEXISTS(ArqObra$(".VIG")) THEN
        IF VigLe%(ArqObra$(".VIG"), "VIG") = 0 THEN Espera DadErro, -1
    END IF
    IF _FILEEXISTS(ArqObra$(".COL")) THEN
        IF ColLe%(ArqObra$(".COL")) = 0 THEN Espera DadErro, -1
    END IF
    CarregaEixos
END SUB

' Le os eixos de auxilio de <obra>.EIX (gravado pelo LAJE): para cada direcao
' (1 horizontais, 2 verticais) a quantidade e as cotas em m. Sem arquivo: sem eixos.
SUB CarregaEixos
    DIM f AS INTEGER, ob AS STRING, d AS INTEGER, k AS INTEGER, n AS INTEGER, c AS DOUBLE
    EixN(1) = 0: EixN(2) = 0
    IF NOT _FILEEXISTS(ArqObra$(".EIX")) THEN EXIT SUB
    ob = FrmObra
    f = DadAbreLeitura%(ArqObra$(".EIX"), "EIX", ob)
    IF f = 0 THEN Espera DadErro, -1: EXIT SUB
    FOR d = 1 TO 2
        IF EOF(f) THEN EXIT FOR
        INPUT #f, n
        FOR k = 1 TO n
            INPUT #f, c
            IF k <= AMR_MAXEIX THEN EixC(d, k) = c
        NEXT
        IF n > AMR_MAXEIX THEN n = AMR_MAXEIX
        EixN(d) = n
    NEXT
    CLOSE #f
END SUB

' Caminho de um arquivo da obra corrente: diretorio de dados + obra + extensao.
FUNCTION ArqObra$ (ext AS STRING)
    ArqObra$ = DirDados + FrmObra + ext
END FUNCTION

' Cabecalho das telas: titulo do modulo, obra corrente e subtitulo (linha 4).
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "Edicao da forma do pavimento"
    COLOR COR_TEXTO
    ' RECONSTRUCAO: o caminho de DirDados pode passar de 80 colunas e quebrar a linha
    ' sobre o subtitulo; mostra-se o fim do caminho com "..." para caber em 77 colunas.
    DIM rot$, cam$, sobra%
    rot$ = "Obra - " + FrmObra + "   Dados em "
    cam$ = DirDados
    sobra% = 74 - LEN(rot$)
    IF LEN(cam$) > sobra% THEN
        IF sobra% < 3 THEN sobra% = 3
        cam$ = "..." + RIGHT$(cam$, sobra% - 3)
    END IF
    LOCATE 2, 3: PRINT rot$; cam$
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 4, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Menu principal (spec 3.1). ESC e S saem. Opcoes T (textos) e C (cotas)
' nao foram reconstruidas: RECONSTRUCAO, saem do menu (ver cabecalho).
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        ' RECONSTRUCAO: era o subtitulo literal "<INICIAL>"; no menu nao ha subtitulo.
        TelaCabecalho ""
        LOCATE 7, 3: PRINT "<P>ilares     <V>igas    <B>orda de Laje           <R>edesenha"
        LOCATE 8, 3: PRINT "<D>etalhes    <E>levacao    <Z>oom"
        LOCATE 9, 3: PRINT "<G>ravacao    <F>orma gera Vigas+Pilares                         <S>egue .."
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "P": ItemEditaPilar
            CASE "V": ItemEditaViga
            CASE "B": ItemEditaLaje
            CASE "E": ItemElevacao
            CASE "R": ItemDesenha 1#
            CASE "Z": ItemZoom
            CASE "D": ItemDetalhes
            CASE "G": ItemGrava
            CASE "F": ItemQuantitativos
            CASE "S", CHR$(27): EXIT DO
        END SELECT
    LOOP
END SUB

' Confirmacao com S como padrao (Enter tambem confirma). Devolve -1 se sim.
FUNCTION ConfirmaS% (texto AS STRING)
    DIM k AS STRING
    LOCATE 14, 3: PRINT texto;
    k = UCASE$(TeclaLer$)
    ConfirmaS% = (k = "S" OR k = CHR$(13))
    LOCATE 14, 1: PRINT SPACE$(79);
END FUNCTION

' Indice do pilar pelo numero ou pelo nome (sem diferenciar maiusculas). 0 = nao achou.
FUNCTION AchaPilar% (txt AS STRING)
    DIM i AS INTEGER
    AchaPilar% = 0
    IF NumeroValido%(txt) THEN
        i = INT(VAL(txt))
        IF i >= 1 AND i <= ColQtd THEN AchaPilar% = i
        EXIT FUNCTION
    END IF
    FOR i = 1 TO ColQtd
        IF UCASE$(RTRIM$(Col(i).nome)) = UCASE$(txt) THEN AchaPilar% = i: EXIT FUNCTION
    NEXT
END FUNCTION

' Indice da viga pelo numero ou pelo nome. 0 = nao achou.
FUNCTION AchaViga% (txt AS STRING)
    DIM i AS INTEGER
    AchaViga% = 0
    IF NumeroValido%(txt) THEN
        i = INT(VAL(txt))
        IF i >= 1 AND i <= VigQtd THEN AchaViga% = i
        EXIT FUNCTION
    END IF
    FOR i = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(i).nome)) = UCASE$(txt) THEN AchaViga% = i: EXIT FUNCTION
    NEXT
END FUNCTION

' Indice da laje pelo numero ou pelo nome. 0 = nao achou.
FUNCTION AchaLaje% (txt AS STRING)
    DIM i AS INTEGER
    AchaLaje% = 0
    IF NumeroValido%(txt) THEN
        i = INT(VAL(txt))
        IF i >= 1 AND i <= LajQtd THEN AchaLaje% = i
        EXIT FUNCTION
    END IF
    FOR i = 1 TO LajQtd
        IF UCASE$(RTRIM$(Laj(i).nome)) = UCASE$(txt) THEN AchaLaje% = i: EXIT FUNCTION
    NEXT
END FUNCTION

' ---------------------------------------------------------------------------
' Amarracao (spec 3.2 a 3.4). Geometria em FORMAMAR.BM; aqui so tela e dados.
' Coordenadas e distancias em m (como no .COL/.VIG/.FRM); bx, by e bw em cm.
' Sentido s: 1 = X, 2 = Y. Pontos do pilar: 0 centro, 1..4 vertices
' (1 inf. esq., 2 inf. dir., 3 sup. dir., 4 sup. esq.). Lado de viga: -1/+1.
' Layout: grade nas linhas 8 a 12, "Altero" na 14, amarracao nas 15 a 21.
' ---------------------------------------------------------------------------

' Amarracao de pilar (P). Pede o pilar, mostra a amarracao e as dimensoes e,
' com "Altero", amarra um ponto do pilar em X e em Y. Altera Col(i) em memoria
' (x, y, bx, by); o .COL nao e regravado e a posicao vai ao .FRM no G.
' RECONSTRUCAO: a edicao de bx e by nao esta no EXE; fica antes do "Altero" e
' vale mesmo se a amarracao for abandonada com <R>etorna no sentido X.
SUB ItemEditaPilar
    DIM txt AS STRING, i AS INTEGER, bx AS DOUBLE, by AS DOUBLE
    DIM s AS INTEGER, novo(1 TO 2) AS DOUBLE, desc(1 TO 2) AS STRING, alterou AS INTEGER
    IF ColQtd = 0 THEN Espera "Nao ha pilares na obra.", -1: EXIT SUB
    CLS
    TelaCabecalho "Amarracao dos Elementos Estruturais na Forma"
    LOCATE 5, 3: PRINT "Alteracao e Visualizacao da Amarracao dos Pilares"
    LOCATE 6, 3: PRINT "Numero ou Nome do Pilar *FIM* ";
    txt = EntradaTexto$(6, 34, 12, "")
    IF EhFim%(txt) THEN EXIT SUB
    i = AchaPilar%(txt)
    IF i = 0 THEN Espera "Pilar nao encontrado.", -1: EXIT SUB
    IF PilAlt(i) THEN
        LOCATE 21, 3: PRINT "Esta Coluna nao pode ser modificada pois ja foi alterada."
        Espera "Acione REDESENHA para poder modifica-la novamente", -1
        EXIT SUB
    END IF
    IF AlgumaVigaAlterada% THEN
        LOCATE 20, 3: PRINT "Atencao !!!"
        LOCATE 21, 3: PRINT "Existem Vigas ou Bordas de Lajes alteradas."
        Espera "Acione REDESENHA para poder alterar os Pilares", -1
        EXIT SUB
    END IF
    MostraPilar i
    LOCATE 11, 3: PRINT "Dimensao x (cm): ";
    bx = EntradaNumero#(11, 25, 8, Col(i).bx)
    LOCATE 12, 3: PRINT "Dimensao y (cm): ";
    by = EntradaNumero#(12, 25, 8, Col(i).by)
    IF bx <= 0 OR (by <= 0 AND Col(i).secao <> "C") THEN Espera "Dimensoes devem ser maiores que zero.", -1: EXIT SUB
    IF NOT ConfirmaS%("Altero N/*S*") THEN EXIT SUB
    Col(i).bx = bx: Col(i).by = by
    MostraPilar i
    LOCATE 15, 3: PRINT "Alteracoes na amarracao do Pilar /" + RTRIM$(Col(i).nome)
    FOR s = 1 TO 2
        IF AmarraPilarSentido%(i, s, novo(s), desc(s)) < 0 THEN EXIT SUB
    NEXT
    LimpaLinhas 16, 21
    IF NOT ConfirmaS%("Corfirme Alteracao N/*S*") THEN EXIT SUB
    alterou = 0
    FOR s = 1 TO 2
        IF desc(s) <> "" THEN
            IF s = 1 THEN Col(i).x = novo(1) ELSE Col(i).y = novo(2)
            PilDesc(i, s) = desc(s)
            alterou = -1
        END IF
    NEXT
    IF alterou THEN PilAlt(i) = -1
    MostraPilar i
    Espera "alteracao registrada na obra; grave com G para o .FRM", 0
END SUB

' Amarracao do pilar i no sentido s (spec 3.2): escolhe o ponto amarrado e a
' referencia (coordenada, eixo, outro pilar ou viga). Devolve 1 com o novo centro
' (m) em centro e a descricao em desc; 0 se <M>antem; -1 se <R>etorna.
' RECONSTRUCAO: Enter e Esc valem <R>etorna (o menu nao marca opcao padrao).
FUNCTION AmarraPilarSentido% (i AS INTEGER, s AS INTEGER, centro AS DOUBLE, desc AS STRING)
    DIM k AS STRING, pto AS INTEGER, alvo AS DOUBLE, ok AS INTEGER, c AS DOUBLE
    centro = CoordPil#(i, s): desc = ""
    DO
        LimpaLinhas 16, 21
        LOCATE 16, 3: PRINT SelS$(s, "Sentido X  -  Amarrar um vertice do Pilar por:", "Sentido Y  -  Amarrar um vertice do Pilar por:")
        EscreveLinha 17, "<C>oordenada   <E>ixo   outro <P>ilar   uma <V>iga   <M>antem   <R>etorna"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "M"
                AmarraPilarSentido% = 0
                EXIT FUNCTION
            CASE "R", CHR$(13), CHR$(27)
                AmarraPilarSentido% = -1
                EXIT FUNCTION
            CASE "C", "E", "P", "V"
                pto = EscolhePontoAmarrado%(i, s)
                IF pto >= 0 THEN
                    ok = 0
                    SELECT CASE k
                        CASE "C": ok = PilarPorCoordenada%(i, s, pto, alvo, desc)
                        CASE "E": ok = PilarPorEixo%(s, pto, alvo, desc)
                        CASE "P": ok = PilarPorPilar%(i, s, pto, alvo, desc)
                        CASE "V": ok = PilarPorViga%(s, pto, alvo, desc)
                    END SELECT
                    IF ok THEN
                        c = FaCentro#(alvo, DimPil#(i, s), FaLadoVertice%(pto, s))
                        IF Aceita%(SelS$(s, "Centro da Secao  Coordenada Absoluta em X=", "Centro da Secao  Coordenada Absoluta em Y=") + Num$(c)) THEN
                            centro = c
                            AmarraPilarSentido% = 1
                            EXIT FUNCTION
                        END IF
                    END IF
                END IF
        END SELECT
        desc = ""
    LOOP
END FUNCTION

' Ponto do pilar i a amarrar no sentido s: 0 (centro) direto na secao circular;
' na retangular, escolha ciclica entre centro e vertices. -1 se cancelou.
' Deixa na linha 16 o titulo do ponto escolhido.
' RECONSTRUCAO: o centro entra no ciclo da secao retangular (amarrar por eixo).
FUNCTION EscolhePontoAmarrado% (i AS INTEGER, s AS INTEGER)
    DIM k AS INTEGER
    IF Col(i).secao = "C" THEN
        LimpaLinhas 16, 21
        LOCATE 16, 3: PRINT SelS$(s, "Sentido X  -  Pilar com Secao Circular", "Sentido Y  -  Pilar com Secao Circular")
        EscolhePontoAmarrado% = 0
        EXIT FUNCTION
    END IF
    ListaPontosPilar i
    k = Escolhe%(SelS$(s, "Sentido X  -  Escolha do Vertice a ser amarrado", "Sentido Y  -  Escolha do Vertice a ser amarrado"), "<S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela", RotPontos$("Vertice"), 5, "C", -1)
    EscolhePontoAmarrado% = k - 1
    IF k = 0 THEN EXIT FUNCTION
    LimpaLinhas 16, 21
    LOCATE 16, 3: PRINT SelS$(s, "Sentido X  -  Vertice a ser amarrado", "Sentido Y  -  Vertice a ser amarrado") + "  " + RotPonto$(k - 1, "Vertice") + "  " + SelS$(s, "X=", "Y=") + Num$(PontoPil#(i, k - 1, s))
END FUNCTION

' <C>oordenada: Xref (ou Yref), Dist e Ang; alvo = FaAlvo#.
FUNCTION PilarPorCoordenada% (i AS INTEGER, s AS INTEGER, pto AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM ref AS DOUBLE, dist AS DOUBLE, ang AS DOUBLE
    LimpaLinhas 17, 21
    IF pto = 0 THEN
        LOCATE 17, 3: PRINT "Coordenada absoluta do Centro da Secao"
    ELSE
        LOCATE 17, 3: PRINT "Coordenada absoluta do vertice"
    END IF
    LOCATE 18, 3: PRINT SelS$(s, "Xref , + - Dist , Angulo ou vert/hori *RETORNA*", "Yref , + - Dist , Angulo ou hori/vert *RETORNA*")
    LOCATE 19, 3: PRINT SelS$(s, "Xref", "Yref")
    ref = EntradaNumero#(19, 8, 9, PontoPil#(i, pto, s))
    LOCATE 19, 19: PRINT "Dist"
    dist = EntradaNumero#(19, 24, 9, 0)
    LOCATE 19, 35: PRINT "Ang"
    ang = EntradaNumero#(19, 39, 6, 0)
    alvo = FaAlvo#(ref, dist, ang)
    LimpaLinhas 19, 19
    LOCATE 19, 3: PRINT USING SelS$(s, "Xref #####.##   Dist #####.##  Ang ##.##     X=", "Yref #####.##   Dist #####.##  Ang ##.##     Y="); ref; dist; ang;
    PRINT Num$(alvo)
    IF pto = 0 THEN
        desc = SelS$(s, "Centro da Secao  Coordenada Absoluta em X=", "Centro da Secao  Coordenada Absoluta em Y=") + Num$(alvo)
    ELSE
        desc = "Vertice" + STR$(pto) + SelS$(s, " Coordenada Absoluta em X=", " Coordenada Absoluta em Y=") + Num$(alvo)
    END IF
    PilarPorCoordenada% = -1
END FUNCTION

' <E>ixo: eixo de auxilio do .EIX mais a distancia do eixo ao ponto amarrado.
FUNCTION PilarPorEixo% (s AS INTEGER, pto AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM n AS INTEGER, e AS DOUBLE, dist AS DOUBLE, rot AS STRING
    PilarPorEixo% = 0
    n = EscolheEixo%(s)
    IF n = 0 THEN EXIT FUNCTION
    e = EixC(3 - s, n)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Eixo Referencia", "Sentido Y  -  Eixo Referencia") + "  Eixo" + STR$(n) + "  " + SelS$(s, "X=", "Y=") + Num$(e)
    IF pto = 0 THEN rot = "Distancia relativa do eixo ao Centro da secao" ELSE rot = "Distancia relativa do eixo ao vertice"
    dist = PedeDistancia#(rot)
    alvo = e + dist
    IF pto = 0 THEN
        desc = SelS$(s, "Centro do Pilar distante em X=", "Centro do Pilar distante em Y=")
    ELSE
        desc = "Vertice" + STR$(pto) + SelS$(s, " distante em X=", " distante em Y=")
    END IF
    desc = desc + Num$(dist) + " do eixo " + LTRIM$(STR$(n))
    PilarPorEixo% = -1
END FUNCTION

' outro <P>ilar: centro ou vertice de outro pilar mais a distancia ao ponto amarrado.
FUNCTION PilarPorPilar% (i AS INTEGER, s AS INTEGER, pto AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM j AS INTEGER, q AS INTEGER, r AS DOUBLE, dist AS DOUBLE, rot AS STRING
    PilarPorPilar% = 0
    j = PedePilarRef%(i)
    IF j = 0 THEN EXIT FUNCTION
    q = EscolhePontoRef%(j, s, SelS$(s, "Sentido X  -  Escolha do Vertice de Referencia", "Sentido Y  -  Escolha do Vertice de Referencia"), "<S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela", "C")
    IF q < 0 THEN EXIT FUNCTION
    r = PontoPil#(j, q, s)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Pilar Referencia", "Sentido Y  -  Pilar Referencia") + "  " + RTRIM$(Col(j).nome) + "  " + RotPonto$(q, "vertice") + "  " + SelS$(s, "X=", "Y=") + Num$(r)
    IF pto = 0 THEN rot = "Distancia relativa da referencia ao Centro da Secao" ELSE rot = "Distancia relativa da referencia ao vertice"
    dist = PedeDistancia#(rot)
    alvo = r + dist
    IF pto = 0 THEN
        desc = SelS$(s, "Centro do Pilar distante em X=", "Centro do Pilar distante em Y=")
    ELSE
        desc = "Vertice" + STR$(pto) + SelS$(s, " distante em X=", " distante em Y=")
    END IF
    IF q = 0 THEN
        desc = desc + Num$(dist) + " do Centro do Pilar " + RTRIM$(Col(j).nome)
    ELSE
        desc = desc + Num$(dist) + " do vertice" + STR$(q) + " do Pilar *" + RTRIM$(Col(j).nome) + "*"
    END IF
    PilarPorPilar% = -1
END FUNCTION

' uma <V>iga: face de uma viga paralela ao eixo do sentido mais a distancia.
FUNCTION PilarPorViga% (s AS INTEGER, pto AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM v AS INTEGER, lado AS INTEGER, f AS DOUBLE, dist AS DOUBLE, rot AS STRING
    PilarPorViga% = 0
    v = EscolheVigaRef%(s, 0)
    IF v = 0 THEN EXIT FUNCTION
    lado = EscolheFaceViga%(v, s, SelS$(s, "Sentido X  -  Viga Referencia", "Sentido Y  -  Viga Referencia") + "  " + RTRIM$(Vig(v).nome))
    IF lado = 0 THEN EXIT FUNCTION
    f = FaceViga#(v, s, lado)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Viga Referencia", "Sentido Y  -  Viga Referencia") + "  " + RTRIM$(Vig(v).nome) + "  " + RotFace$(s, lado) + "  " + SelS$(s, "X=", "Y=") + Num$(f)
    IF pto = 0 THEN rot = "Distancia relativa da Viga ao Centro da secao" ELSE rot = "Distancia relativa da Viga ao vertice"
    dist = PedeDistancia#(rot)
    alvo = f + dist
    IF pto = 0 THEN
        desc = SelS$(s, "Centro do Pilar distante em X=", "Centro do Pilar distante em Y=")
    ELSE
        desc = "Vertice" + STR$(pto) + SelS$(s, " distante em X=", " distante em Y=")
    END IF
    ' RECONSTRUCAO: o EXE nao tem o texto da descricao por viga; " da <face> da Viga".
    desc = desc + Num$(dist) + " da " + RotFace$(s, lado) + " da Viga " + RTRIM$(Vig(v).nome)
    PilarPorViga% = -1
END FUNCTION

' Grade do pilar i (spec 3.4), linhas 8 a 10: numero, nome, secao e a amarracao
' de cada sentido (a feita nesta sessao ou a coordenada do centro).
SUB MostraPilar (i AS INTEGER)
    DIM s AS INTEGER
    LimpaLinhas 8, 10
    LOCATE 8, 3: PRINT "Pilar -" + STR$(i) + "   Nome - *" + RTRIM$(Col(i).nome) + "*   secao " + Col(i).secao + FormataNumero$(Col(i).bx, 1, 7) + " x" + FormataNumero$(Col(i).by, 1, 6) + " cm"
    FOR s = 1 TO 2
        LOCATE 8 + s, 3
        IF PilDesc(i, s) <> "" THEN
            PRINT PilDesc(i, s)
        ELSE
            PRINT SelS$(s, "Centro da Secao  Coordenada Absoluta em X=", "Centro da Secao  Coordenada Absoluta em Y=") + Num$(CoordPil#(i, s))
        END IF
    NEXT
END SUB

' Pede o pilar de referencia (diferente de excluir). 0 se fim, invalido ou ja
' alterado (a referencia precisa estar no lugar desenhado).
FUNCTION PedePilarRef% (excluir AS INTEGER)
    DIM txt AS STRING, j AS INTEGER
    PedePilarRef% = 0
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT "Numero ou Nome do Pilar que servira de Referencia *FIM* ";
    txt = EntradaTexto$(17, 60, 10, "")
    IF EhFim%(txt) THEN EXIT FUNCTION
    j = AchaPilar%(txt)
    IF j = 0 OR j = excluir THEN Espera "Pilar de referencia nao encontrado.", -1: EXIT FUNCTION
    IF PilAlt(j) THEN
        LOCATE 21, 3: PRINT "Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada."
        Espera "Acione REDESENHA para poder utiliza-la", -1
        EXIT FUNCTION
    END IF
    PedePilarRef% = j
END FUNCTION

' Ponto de referencia do pilar j: 0 (centro) na secao circular; senao escolha
' ciclica com o titulo e as teclas do contexto. -1 se cancelou.
FUNCTION EscolhePontoRef% (j AS INTEGER, s AS INTEGER, titulo AS STRING, teclas AS STRING, cancela AS STRING)
    IF Col(j).secao = "C" THEN EscolhePontoRef% = 0: EXIT FUNCTION
    ListaPontosPilar j
    EscolhePontoRef% = Escolhe%(titulo, teclas, RotPontos$("vertice"), 5, cancela, -1) - 1
END FUNCTION

' Eixo de referencia do sentido s (verticais em X, horizontais em Y), lidos do
' <obra>.EIX. 0 se nao ha eixos ou se cancelou.
' RECONSTRUCAO: os eixos sao os de auxilio do LAJE (<obra>.EIX).
FUNCTION EscolheEixo% (s AS INTEGER)
    DIM d AS INTEGER, n AS INTEGER, lista AS STRING
    EscolheEixo% = 0
    d = 3 - s
    IF EixN(d) = 0 THEN
        Espera SelS$(s, "Nao ha eixos verticais em " + FrmObra + ".EIX (LAJE, Eixos de Auxilio).", "Nao ha eixos horizontais em " + FrmObra + ".EIX (LAJE, Eixos de Auxilio)."), -1
        EXIT FUNCTION
    END IF
    lista = ""
    FOR n = 1 TO EixN(d)
        IF n > 1 THEN lista = lista + "|"
        lista = lista + "Eixo" + STR$(n) + "   " + SelS$(s, "X=", "Y=") + Num$(EixC(d, n))
    NEXT
    EscolheEixo% = Escolhe%(SelS$(s, "Sentido X  -  Escolha do Eixo Vertical de Referencia", "Sentido Y  -  Escolha do Eixo Horizontal de Referencia"), "<S>im eixo de referencia                 <*P*>roximo   <A>nterior   <C>ancela", lista, EixN(d), "C", 0)
END FUNCTION

' Viga de referencia no sentido s: so vigas cujas faces sao amarradas em s
' (verticais em X, horizontais em Y), menos excluir. 0 se nao ha ou cancelou.
FUNCTION EscolheVigaRef% (s AS INTEGER, excluir AS INTEGER)
    DIM v AS INTEGER, n AS INTEGER, lista AS STRING, k AS INTEGER
    DIM idx(1 TO DAD_MAXVIG) AS INTEGER
    EscolheVigaRef% = 0
    n = 0: lista = ""
    FOR v = 1 TO VigQtd
        IF v <> excluir AND SentidoViga%(v) = s THEN
            n = n + 1: idx(n) = v
            IF n > 1 THEN lista = lista + "|"
            lista = lista + "Viga - " + RTRIM$(Vig(v).nome) + "   eixo " + SelS$(s, "X=", "Y=") + Num$(EixoViga#(v, s)) + "   bw" + FormataNumero$(Vig(v).bw, 1, 6) + " cm"
        END IF
    NEXT
    IF n = 0 THEN
        ' RECONSTRUCAO: aviso sem texto no EXE.
        Espera SelS$(s, "Nao ha viga vertical para referencia em X.", "Nao ha viga horizontal para referencia em Y."), -1
        EXIT FUNCTION
    END IF
    k = Escolhe%(SelS$(s, "Sentido X  -  Escolha da Viga de Referencia", "Sentido Y  -  Escolha da Viga de Referencia"), "<S>im Viga de referencia                 <*P*>roxima   <A>nterior   <C>ancela", lista, n, "C", 0)
    IF k > 0 THEN EscolheVigaRef% = idx(k)
END FUNCTION

' Face da viga v usada como referencia no sentido s: -1 ou +1; 0 se retornou.
FUNCTION EscolheFaceViga% (v AS INTEGER, s AS INTEGER, titulo AS STRING)
    DIM lista AS STRING, k AS INTEGER
    lista = RotFace$(s, -1) + "   " + SelS$(s, "X=", "Y=") + Num$(FaceViga#(v, s, -1)) + "|" + RotFace$(s, 1) + "   " + SelS$(s, "X=", "Y=") + Num$(FaceViga#(v, s, 1))
    k = Escolhe%(titulo, "<S>im face a ser utilizada como referencia    <*P*>roxima    <R>etorna", lista, 2, "R", 0)
    EscolheFaceViga% = 0
    IF k = 1 THEN EscolheFaceViga% = -1
    IF k = 2 THEN EscolheFaceViga% = 1
END FUNCTION

' Escolha ciclica (spec 3.2) entre n itens de lista (separados por "|"):
' titulo na linha 17, teclas na 18, item na 19 e, com mostraXY, as coordenadas
' EscX/EscY na 20. S escolhe; P, O ou Enter avanca; A volta; cancela ou Esc
' devolvem 0. Devolve o numero do item (1..n).
FUNCTION Escolhe% (titulo AS STRING, teclas AS STRING, lista AS STRING, n AS INTEGER, cancela AS STRING, mostraXY AS INTEGER)
    DIM k AS STRING, c AS INTEGER
    Escolhe% = 0
    IF n < 1 THEN EXIT FUNCTION
    c = 1
    LimpaLinhas 17, 21
    EscreveLinha 17, titulo
    EscreveLinha 18, teclas
    DO
        LOCATE 19, 3: PRINT LEFT$(ItemLista$(lista, c) + SPACE$(76), 76);
        IF mostraXY THEN
            LOCATE 20, 3: PRINT USING "X=#####.##  Y=#####.##"; EscX(c); EscY(c)
        END IF
        k = UCASE$(TeclaLer$)
        IF k = "S" THEN
            Escolhe% = c
            EXIT DO
        ELSEIF k = "P" OR k = "O" OR k = CHR$(13) THEN
            c = c MOD n + 1
        ELSEIF k = "A" THEN
            c = (c + n - 2) MOD n + 1
        ELSEIF k = cancela OR k = CHR$(27) THEN
            EXIT DO
        END IF
    LOOP
END FUNCTION

' Item k (1..) de uma lista separada por "|".
FUNCTION ItemLista$ (lista AS STRING, k AS INTEGER)
    DIM ini AS INTEGER, fim AS INTEGER, n AS INTEGER
    ini = 1
    FOR n = 2 TO k
        ini = INSTR(ini, lista, "|") + 1
        IF ini = 1 THEN ItemLista$ = "": EXIT FUNCTION
    NEXT
    fim = INSTR(ini, lista, "|")
    IF fim = 0 THEN fim = LEN(lista) + 1
    ItemLista$ = MID$(lista, ini, fim - ini)
END FUNCTION

' Preenche EscX/EscY com centro e vertices 1..4 do pilar j (para Escolhe%).
SUB ListaPontosPilar (j AS INTEGER)
    DIM k AS INTEGER
    FOR k = 0 TO 4
        EscX(k + 1) = PontoPil#(j, k, 1)
        EscY(k + 1) = PontoPil#(j, k, 2)
    NEXT
END SUB

' Rotulos dos pontos do pilar para Escolhe%: centro e 4 vertices.
FUNCTION RotPontos$ (vert AS STRING)
    RotPontos$ = RotPonto$(0, vert) + "|" + RotPonto$(1, vert) + "|" + RotPonto$(2, vert) + "|" + RotPonto$(3, vert) + "|" + RotPonto$(4, vert)
END FUNCTION

' Rotulo do ponto k do pilar: "Centro da Secao" ou "<vert> k".
FUNCTION RotPonto$ (k AS INTEGER, vert AS STRING)
    IF k = 0 THEN RotPonto$ = "Centro da Secao" ELSE RotPonto$ = vert + STR$(k)
END FUNCTION

' Nome da face lado (-1/+1) de uma viga no sentido s.
FUNCTION RotFace$ (s AS INTEGER, lado AS INTEGER)
    IF lado < 0 THEN RotFace$ = SelS$(s, "face esquerda", "face inferior") ELSE RotFace$ = SelS$(s, "face direita", "face superior")
END FUNCTION

' Pede uma distancia (m) na linha 19 com o rotulo dado; padrao 0.
FUNCTION PedeDistancia# (rot AS STRING)
    LOCATE 19, 3: PRINT rot;
    PedeDistancia# = EntradaNumero#(19, 5 + LEN(rot), 9, 0)
END FUNCTION

' Mostra o resultado na linha 21 e pede "aceita N/*S*". -1 se aceitou.
FUNCTION Aceita% (texto AS STRING)
    DIM k AS STRING
    LimpaLinhas 21, 21
    LOCATE 21, 3: PRINT texto + "   aceita N/*S*";
    k = UCASE$(TeclaLer$)
    Aceita% = (k = "S" OR k = CHR$(13))
END FUNCTION

' Coordenada do centro do pilar j no sentido s (m).
FUNCTION CoordPil# (j AS INTEGER, s AS INTEGER)
    IF s = 1 THEN CoordPil# = Col(j).x ELSE CoordPil# = Col(j).y
END FUNCTION

' Dimensao do pilar j no sentido s (m). Secao circular: bx e o diametro.
FUNCTION DimPil# (j AS INTEGER, s AS INTEGER)
    IF s = 1 OR Col(j).secao = "C" THEN DimPil# = Col(j).bx / 100 ELSE DimPil# = Col(j).by / 100
END FUNCTION

' Coordenada (m) do ponto k (0 centro, 1..4 vertices) do pilar j no sentido s.
FUNCTION PontoPil# (j AS INTEGER, k AS INTEGER, s AS INTEGER)
    DIM lado AS INTEGER
    lado = FaLadoVertice%(k, s)
    IF Col(j).secao = "C" THEN lado = 0
    PontoPil# = FaFace#(CoordPil#(j, s), DimPil#(j, s), lado)
END FUNCTION

' Sentido de amarracao das faces da viga v (FaSentidoViga%): 1 X, 2 Y, 0 inclinada.
FUNCTION SentidoViga% (v AS INTEGER)
    DIM a AS INTEGER, b AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE
    a = Vig(v).iApo: b = a + Vig(v).nTramos
    x1 = VigApo(a).x: y1 = VigApo(a).y: x2 = VigApo(b).x: y2 = VigApo(b).y
    SentidoViga% = FaSentidoViga%(x1, y1, x2, y2)
END FUNCTION

' Coordenada (m) do eixo da viga v no sentido s (primeiro apoio).
FUNCTION EixoViga# (v AS INTEGER, s AS INTEGER)
    IF s = 1 THEN EixoViga# = VigApo(Vig(v).iApo).x ELSE EixoViga# = VigApo(Vig(v).iApo).y
END FUNCTION

' Coordenada (m) da face lado (-1/+1) da viga v no sentido s.
FUNCTION FaceViga# (v AS INTEGER, s AS INTEGER, lado AS INTEGER)
    FaceViga# = FaFace#(EixoViga#(v, s), Vig(v).bw / 100, lado)
END FUNCTION

' Texto do sentido: tx em X (s = 1), ty em Y.
FUNCTION SelS$ (s AS INTEGER, tx AS STRING, ty AS STRING)
    IF s = 1 THEN SelS$ = tx ELSE SelS$ = ty
END FUNCTION

' Numero em m com 3 casas, para as telas de amarracao.
FUNCTION Num$ (v AS DOUBLE)
    Num$ = " " + LTRIM$(FormataNumero$(v, 3, 0))
END FUNCTION

' Fim de lista nos pedidos de nome: vazio, FIM ou *FIM*.
FUNCTION EhFim% (txt AS STRING)
    DIM t AS STRING
    t = UCASE$(LTRIM$(RTRIM$(txt)))
    EhFim% = (t = "" OR t = "FIM" OR t = "*FIM*")
END FUNCTION

' Escreve texto na linha l a partir da coluna 3; texto longo (as linhas de
' teclas do EXE tem ate 79 caracteres) recua para nao quebrar na coluna 80.
SUB EscreveLinha (l AS INTEGER, texto AS STRING)
    DIM c AS INTEGER
    c = 3
    IF c + LEN(texto) - 1 > 80 THEN c = 81 - LEN(texto)
    IF c < 1 THEN c = 1
    LOCATE l, c: PRINT LEFT$(texto, 80);
END SUB

' Apaga as linhas de a ate b (colunas 1 a 80).
SUB LimpaLinhas (a AS INTEGER, b AS INTEGER)
    DIM l AS INTEGER
    FOR l = a TO b
        LOCATE l, 1: PRINT SPACE$(80);
    NEXT
END SUB

' -1 se ha pilar amarrado desde o ultimo REDESENHA.
FUNCTION AlgumPilarAlterado% ()
    DIM i AS INTEGER
    AlgumPilarAlterado% = 0
    FOR i = 1 TO ColQtd
        IF PilAlt(i) THEN AlgumPilarAlterado% = -1: EXIT FUNCTION
    NEXT
END FUNCTION

' -1 se ha viga amarrada desde o ultimo REDESENHA.
FUNCTION AlgumaVigaAlterada% ()
    DIM v AS INTEGER
    AlgumaVigaAlterada% = 0
    FOR v = 1 TO VigQtd
        IF VigAlt(v) THEN AlgumaVigaAlterada% = -1: EXIT FUNCTION
    NEXT
END FUNCTION

' Amarracao de viga (V, spec 3.3). Pede a viga (*PROXIMA* = a seguinte), mostra
' as faces e bw/h e, com "Altero", amarra faces no sentido perpendicular ao eixo
' (X para viga vertical, Y para horizontal). Todas as faces: a viga inteira
' desloca. So uma face: ela vai ao alvo e a outra fica (muda bw). Altera em
' memoria os apoios VigApo e Vig(v).bw; vai ao .FRM no G.
' RECONSTRUCAO: bw e h editaveis antes do "Altero" (nao estao no EXE). O EXE
' pergunta as faces (<*T*>odas/<E>scolho) antes do sentido; aqui o sentido vem
' antes, para Enter no primeiro menu valer <R>etorna. Vigas inclinadas e faces
' por tramo nao sao amarradas (o .VIG guarda uma so largura e o eixo nos apoios).
SUB ItemEditaViga
    DIM txt AS STRING, v AS INTEGER, bw AS DOUBLE, h AS DOUBLE, s AS INTEGER
    DIM eixoNovo AS DOUBLE, bwNovo AS DOUBLE, desc AS STRING, delta AS DOUBLE, k AS INTEGER, a AS INTEGER
    STATIC ultima AS INTEGER
    IF VigQtd = 0 THEN Espera "Nao ha vigas na obra.", -1: EXIT SUB
    CLS
    TelaCabecalho "Amarracao dos Elementos Estruturais na Forma"
    LOCATE 5, 3: PRINT "Alteracao e Visualizacao da Amarracao das Vigas"
    LOCATE 6, 3: PRINT "Numero ou Nome da Viga *FIM* ";
    LOCATE 7, 3: PRINT "*PROXIMA*"
    txt = EntradaTexto$(6, 34, 12, "")
    IF EhFim%(txt) THEN EXIT SUB
    IF UCASE$(txt) = "*PROXIMA*" OR UCASE$(txt) = "PROXIMA" THEN
        v = ultima MOD VigQtd + 1
    ELSE
        v = AchaViga%(txt)
    END IF
    IF v = 0 THEN Espera "Viga nao encontrada.", -1: EXIT SUB
    ultima = v
    IF VigAlt(v) THEN
        LOCATE 21, 3: PRINT "Esta Viga nao pode ser modificada pois ja foi alterada."
        Espera "Acione REDESENHA para poder modifica-la novamente", -1
        EXIT SUB
    END IF
    IF AlgumPilarAlterado% THEN
        LOCATE 21, 3: PRINT "Existem Pilares ou Bordas de Lajes alteradas.."
        Espera "Acione REDESENHA para poder alterar as Vigas", -1
        EXIT SUB
    END IF
    MostraViga v
    LOCATE 11, 3: PRINT "Largura bw (cm): ";
    bw = EntradaNumero#(11, 25, 8, Vig(v).bw)
    LOCATE 12, 3: PRINT "Altura h (cm): ";
    h = EntradaNumero#(12, 25, 8, Vig(v).h)
    IF bw <= 0 OR h <= 0 THEN Espera "Dimensoes devem ser maiores que zero.", -1: EXIT SUB
    IF NOT ConfirmaS%("Altero N/*S*") THEN EXIT SUB
    Vig(v).bw = bw: Vig(v).h = h
    MostraViga v
    LOCATE 15, 3: PRINT "Alteracoes na amarracao da Viga " + RTRIM$(Vig(v).nome)
    s = SentidoViga%(v)
    IF s = 0 THEN Espera "Viga inclinada: so vigas horizontais ou verticais tem faces amarradas.", -1: EXIT SUB
    IF AmarraVigaSentido%(v, s, eixoNovo, bwNovo, desc) <= 0 THEN EXIT SUB
    LimpaLinhas 16, 21
    IF NOT ConfirmaS%("Corfirme Alteracao N/*S*") THEN EXIT SUB
    TelaStatus "Aguarde ..."
    delta = eixoNovo - EixoViga#(v, s)
    a = Vig(v).iApo
    FOR k = a TO a + Vig(v).nTramos
        IF s = 1 THEN VigApo(k).x = VigApo(k).x + delta ELSE VigApo(k).y = VigApo(k).y + delta
    NEXT
    Vig(v).bw = bwNovo * 100
    VigDesc(v) = desc
    VigAlt(v) = -1
    MostraViga v
    Espera "alteracao registrada na obra; grave com G para o .FRM", 0
END SUB

' Amarracao das faces da viga v no sentido s (spec 3.3). Devolve 1 com o novo
' eixo (m), a nova largura (m) e a descricao; -1 se <R>etorna.
FUNCTION AmarraVigaSentido% (v AS INTEGER, s AS INTEGER, eixoNovo AS DOUBLE, bwNovo AS DOUBLE, desc AS STRING)
    DIM k AS STRING, lado AS INTEGER, so AS INTEGER, alvo AS DOUBLE, ok AS INTEGER
    DIM c AS DOUBLE, b AS DOUBLE
    eixoNovo = EixoViga#(v, s): bwNovo = Vig(v).bw / 100
    DO
        desc = ""
        LimpaLinhas 16, 21
        LOCATE 16, 3: PRINT SelS$(s, "Sentido X  -  Amarrar faces de Viga por:", "Sentido Y  -  Amarrar faces de Viga por:")
        EscreveLinha 17, "<C>oordenada absoluta    <E>ixo    um <P>ilar    outra <V>iga    <R>etorna"
        k = UCASE$(TeclaLer$)
        IF k = "R" OR k = CHR$(13) OR k = CHR$(27) THEN AmarraVigaSentido% = -1: EXIT FUNCTION
        IF k = "C" OR k = "E" OR k = "P" OR k = "V" THEN
            IF EscolheFacesViga%(v, s, lado, so) THEN
                LimpaLinhas 16, 21
                LOCATE 16, 3: PRINT SelS$(s, "Sentido X  -  Amarrar faces", "Sentido Y  -  Amarrar faces") + "  " + RTRIM$(Vig(v).nome) + "  " + RotFace$(s, lado) + "  " + SelS$(s, "X=", "Y=") + Num$(FaceViga#(v, s, lado))
                ok = 0
                SELECT CASE k
                    CASE "C": ok = VigaPorCoordenada%(v, s, lado, alvo, desc)
                    CASE "E": ok = VigaPorEixo%(s, alvo, desc)
                    CASE "P": ok = VigaPorPilar%(s, alvo, desc)
                    CASE "V": ok = VigaPorViga%(v, s, alvo, desc)
                END SELECT
                IF ok THEN
                    c = EixoViga#(v, s): b = Vig(v).bw / 100
                    IF so THEN FaMoveFace c, b, lado, alvo ELSE c = FaCentro#(alvo, b, lado)
                    IF b <= 0 THEN
                        Espera "A face nao pode ficar sobre a face oposta (bw = 0).", -1
                    ELSEIF Aceita%(SelS$(s, "Coordenada Absoluta em X", "Coordenada Absoluta em Y") + " do eixo" + Num$(c) + "   bw" + FormataNumero$(b * 100, 1, 6) + " cm") THEN
                        eixoNovo = c: bwNovo = b
                        AmarraVigaSentido% = 1
                        EXIT FUNCTION
                    END IF
                END IF
            END IF
        END IF
    LOOP
END FUNCTION

' Faces a amarrar (spec 3.3). <*T*>odas: pede a face que vai ao alvo (a viga
' desloca inteira, so = 0). <E>scolho: marca faces; com uma so, ela vai ao alvo
' e a oposta fica (so = -1); com as duas, segue como <T>odas. 0 se retornou.
FUNCTION EscolheFacesViga% (v AS INTEGER, s AS INTEGER, lado AS INTEGER, so AS INTEGER)
    DIM k AS STRING, c AS INTEGER, marca(1 TO 2) AS INTEGER, t AS STRING
    EscolheFacesViga% = 0
    so = 0: lado = 0
    LimpaLinhas 17, 21
    EscreveLinha 17, "<*T*>odas faces serao amarradas   <E>scolho faces a serem amarradas  <R>etorna"
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k = "T" OR k = "E" OR k = "R" OR k = CHR$(13) OR k = CHR$(27)
    IF k = "R" OR k = CHR$(27) THEN EXIT FUNCTION
    IF k = "E" THEN
        c = 1
        EscreveLinha 18, "<S>im face escolhida    <A>nula escolha    <*P*>roximo    <F>im    <C>ancela"
        DO
            LOCATE 19, 3: PRINT LEFT$(RotFace$(s, 2 * c - 3) + "   " + SelS$(s, "X=", "Y=") + Num$(FaceViga#(v, s, 2 * c - 3)) + SPACE$(60), 60);
            t = "escolhidas:"
            IF marca(1) THEN t = t + " " + RotFace$(s, -1)
            IF marca(2) THEN t = t + " " + RotFace$(s, 1)
            LOCATE 20, 3: PRINT LEFT$(t + SPACE$(60), 60);
            k = UCASE$(TeclaLer$)
            IF k = "S" THEN
                marca(c) = -1
            ELSEIF k = "A" THEN
                marca(c) = 0
            ELSEIF k = "P" OR k = CHR$(13) THEN
                c = 3 - c
            ELSEIF k = "F" THEN
                EXIT DO
            ELSEIF k = "C" OR k = CHR$(27) THEN
                EXIT FUNCTION
            END IF
        LOOP
        IF marca(1) = 0 AND marca(2) = 0 THEN EXIT FUNCTION
        IF marca(1) = 0 OR marca(2) = 0 THEN
            IF marca(1) THEN lado = -1 ELSE lado = 1
            so = -1
            EscolheFacesViga% = -1
            EXIT FUNCTION
        END IF
    END IF
    lado = EscolheFaceViga%(v, s, SelS$(s, "Sentido X  -  Amarrar faces", "Sentido Y  -  Amarrar faces") + "  " + RTRIM$(Vig(v).nome))
    IF lado <> 0 THEN EscolheFacesViga% = -1
END FUNCTION

' <C>oordenada absoluta da face (padrao: a posicao atual).
FUNCTION VigaPorCoordenada% (v AS INTEGER, s AS INTEGER, lado AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM rot AS STRING
    LimpaLinhas 17, 21
    rot = SelS$(s, "Coordenada absoluta do vertice X= *", "Coordenada absoluta do vertice Y= *")
    LOCATE 19, 3: PRINT rot;
    alvo = EntradaNumero#(19, 5 + LEN(rot), 9, FaceViga#(v, s, lado))
    desc = SelS$(s, "Coordenada Absoluta em X", "Coordenada Absoluta em Y") + Num$(alvo)
    VigaPorCoordenada% = -1
END FUNCTION

' <E>ixo de auxilio mais a distancia do eixo a face.
FUNCTION VigaPorEixo% (s AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM n AS INTEGER, e AS DOUBLE, dist AS DOUBLE
    VigaPorEixo% = 0
    n = EscolheEixo%(s)
    IF n = 0 THEN EXIT FUNCTION
    e = EixC(3 - s, n)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Eixo Referencia", "Sentido Y  -  Eixo Referencia") + "  Eixo" + STR$(n) + "  " + SelS$(s, "X=", "Y=") + Num$(e)
    dist = PedeDistancia#(SelS$(s, "Distancia relativa do eixo ao vertice X= *", "Distancia relativa do eixo ao vertice Y= *"))
    alvo = e + dist
    desc = "Distante do eixo" + STR$(n) + SelS$(s, " em X", " em Y") + Num$(dist)
    VigaPorEixo% = -1
END FUNCTION

' um <P>ilar: centro ou vertice de um pilar mais a distancia a face.
FUNCTION VigaPorPilar% (s AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM j AS INTEGER, q AS INTEGER, r AS DOUBLE, dist AS DOUBLE
    VigaPorPilar% = 0
    j = PedePilarRef%(0)
    IF j = 0 THEN EXIT FUNCTION
    q = EscolhePontoRef%(j, s, SelS$(s, "Sentido X  -  Pilar Referencia", "Sentido Y  -  Pilar Referencia") + "  " + RTRIM$(Col(j).nome), "<S>im vertice a ser utilizada como referencia    <*O*>utro    <R>etorna", "R")
    IF q < 0 THEN EXIT FUNCTION
    r = PontoPil#(j, q, s)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Pilar Referencia", "Sentido Y  -  Pilar Referencia") + "  " + RTRIM$(Col(j).nome) + "  " + RotPonto$(q, "vertice") + "  " + SelS$(s, "X=", "Y=") + Num$(r)
    dist = PedeDistancia#(SelS$(s, "Distancia relativa da referencia ao vertice X= *", "Distancia relativa da referencia ao vertice Y= *"))
    alvo = r + dist
    desc = "Distante" + Num$(dist) + SelS$(s, " em X", " em Y") + " do Pilar *" + RTRIM$(Col(j).nome) + "*"
    VigaPorPilar% = -1
END FUNCTION

' outra <V>iga: face de outra viga paralela mais a distancia a face.
FUNCTION VigaPorViga% (v AS INTEGER, s AS INTEGER, alvo AS DOUBLE, desc AS STRING)
    DIM w AS INTEGER, lado AS INTEGER, f AS DOUBLE, dist AS DOUBLE
    VigaPorViga% = 0
    w = EscolheVigaRef%(s, v)
    IF w = 0 THEN EXIT FUNCTION
    lado = EscolheFaceViga%(w, s, SelS$(s, "Sentido X  -  Viga Referencia", "Sentido Y  -  Viga Referencia") + "  " + RTRIM$(Vig(w).nome))
    IF lado = 0 THEN EXIT FUNCTION
    f = FaceViga#(w, s, lado)
    LimpaLinhas 17, 21
    LOCATE 17, 3: PRINT SelS$(s, "Sentido X  -  Viga Referencia", "Sentido Y  -  Viga Referencia") + "  " + RTRIM$(Vig(w).nome) + "  " + RotFace$(s, lado) + "  " + SelS$(s, "X=", "Y=") + Num$(f)
    dist = PedeDistancia#(SelS$(s, "Distancia relativa da Viga referencia a face X= *", "Distancia relativa da Viga referencia a face Y= *"))
    alvo = f + dist
    desc = "Distante" + Num$(dist) + SelS$(s, " em X", " em Y") + " da " + RotFace$(s, lado) + " da Viga " + RTRIM$(Vig(w).nome)
    VigaPorViga% = -1
END FUNCTION

' Grade da viga v (spec 3.4), linhas 8 a 10: nome, faces e amarracao.
SUB MostraViga (v AS INTEGER)
    DIM s AS INTEGER
    LimpaLinhas 8, 10
    s = SentidoViga%(v)
    LOCATE 8, 3: PRINT "Viga - " + RTRIM$(Vig(v).nome) + "   tramos:" + STR$(Vig(v).nTramos) + "   bw" + FormataNumero$(Vig(v).bw, 1, 6) + "  h" + FormataNumero$(Vig(v).h, 1, 6) + " cm"
    IF s = 0 THEN
        LOCATE 9, 3: PRINT "  faces   (viga inclinada)"
        EXIT SUB
    END IF
    LOCATE 9, 3: PRINT "  faces  " + SelS$(s, "Coordenada Absoluta em X", "Coordenada Absoluta em Y") + Num$(FaceViga#(v, s, -1)) + " /" + Num$(FaceViga#(v, s, 1))
    LOCATE 10, 3
    IF VigDesc(v) <> "" THEN PRINT VigDesc(v) ELSE PRINT SelS$(s, "Nao Alterado em X", "Nao Alterado em Y")
END SUB

' Edicao de laje (B): espessura h em cm (0 = usa a espessura de referencia). Altera a
' obra em memoria; o .LAJ nao e regravado. Vai ao .FRM na gravacao (G), via FcMontaForma.
SUB ItemEditaLaje
    DIM txt AS STRING, i AS INTEGER, h AS DOUBLE
    IF LajQtd = 0 THEN Espera "Nao ha lajes na obra.", -1: EXIT SUB
    CLS
    TelaCabecalho "Edicao das lajes"
    LOCATE 6, 3: PRINT "numero ou nome da laje *fim* ";
    txt = EntradaTexto$(6, 40, 12, "")
    IF txt = "" THEN EXIT SUB
    i = AchaLaje%(txt)
    IF i = 0 THEN Espera "Laje nao encontrada.", -1: EXIT SUB
    LOCATE 8, 3: PRINT "Laje " + RTRIM$(Laj(i).nome) + "   lx " + FormataNumero$(Laj(i).lx, 2, 6) + " m   ly " + FormataNumero$(Laj(i).ly, 2, 6) + " m"
    LOCATE 9, 3: PRINT "Espessura h (cm, 0 = calcular): ";
    h = EntradaNumero#(9, 40, 8, Laj(i).h)
    IF h < 0 THEN Espera "Espessura nao pode ser negativa.", -1: EXIT SUB
    IF NOT ConfirmaS%("altero n/*s*") THEN EXIT SUB
    Laj(i).h = h
    Espera "alteracao registrada na obra; grave com G para o .FRM", 0
END SUB

' Elevacao (E): cota basica Z (m) e alinhamento das vigas (S = face superior,
' I = face inferior) em <obra>.FEL. O alinhamento e so gravado.
SUB ItemElevacao
    DIM arq AS STRING, f AS INTEGER, cota AS DOUBLE, alin AS STRING, k AS STRING
    arq = ArqObra$(".FEL")
    cota = 0: alin = "S"
    IF _FILEEXISTS(arq) THEN
        f = DadAbreLeitura%(arq, "FEL", FrmObra)
        IF f <> 0 THEN
            IF NOT EOF(f) THEN INPUT #f, cota, alin
            CLOSE #f
        END IF
    END IF
    CLS
    TelaCabecalho "Elevacao (cota basica)"
    LOCATE 6, 3: PRINT "Cota basica Z (m): ";
    cota = EntradaNumero#(6, 25, 10, cota)
    LOCATE 7, 3: PRINT "Alinhamento das vigas <S>uperior <I>nferior (atual " + alin + "): ";
    k = UCASE$(TeclaLer$)
    IF k = "S" OR k = "I" THEN alin = k
    IF NOT ConfirmaS%("confirme mudar cota basica de z  N/*S*") THEN EXIT SUB
    DadErro = ""
    f = DadAbreGravacao%(arq, "FEL", FrmObra)
    WRITE #f, cota, alin
    CLOSE #f
    Espera "elevacao gravada em " + arq, 0
END SUB

' Desenho (R e Z): gera <obra>_FORMA.VET na escala 20 mm/m * fator e mostra.
' R usa fator 1 (1:50); Z usa o fator pedido. O desenho atualiza a forma e
' libera os elementos amarrados (REDESENHA, spec 3.9).
SUB ItemDesenha (fator AS DOUBLE)
    DIM arq AS STRING, i AS INTEGER
    IF LajQtd = 0 AND VigQtd = 0 AND ColQtd = 0 THEN Espera "Obra sem elementos para desenhar.", -1: EXIT SUB
    arq = ArqObra$("_FORMA.VET")
    DesenhaForma 20# * fator
    FOR i = 1 TO ColQtd: PilAlt(i) = 0: NEXT
    FOR i = 1 TO VigQtd: VigAlt(i) = 0: NEXT
    IF VetMostra%(arq) <> 1 THEN Espera "Nao foi possivel mostrar " + arq, -1
END SUB

' Zoom (Z): pede o fator de ampliacao e gera o desenho nessa escala.
SUB ItemZoom
    DIM fator AS DOUBLE
    CLS
    TelaCabecalho "Zoom do desenho da forma"
    LOCATE 6, 3: PRINT "Fator de ampliacao: ";
    fator = EntradaNumero#(6, 27, 8, 1)
    IF fator <= 0 THEN Espera "O fator deve ser maior que zero.", -1: EXIT SUB
    ItemDesenha fator
END SUB

' Detalhes (D): lista lajes, vigas e pilares com as dimensoes, paginada.
SUB ItemDetalhes
    DIM i AS INTEGER, v AS INTEGER, lin AS INTEGER, t AS STRING
    IF LajQtd = 0 AND VigQtd = 0 AND ColQtd = 0 THEN Espera "Obra sem elementos.", -1: EXIT SUB
    CLS
    TelaCabecalho "Detalhes dos elementos da forma"
    lin = 6
    FOR i = 1 TO LajQtd
        t = "L " + RTRIM$(Laj(i).nome) + "  " + FormataNumero$(Laj(i).lx, 2, 6) + " x" + FormataNumero$(Laj(i).ly, 2, 6) + " m   h" + FormataNumero$(FcEspLaje#(i), 1, 6) + " cm"
        DetLinha t, lin
    NEXT
    FOR v = 1 TO VigQtd
        t = "V " + RTRIM$(Vig(v).nome) + "  bw" + FormataNumero$(Vig(v).bw, 1, 6) + " h" + FormataNumero$(Vig(v).h, 1, 6) + " cm   comp" + FormataNumero$(FcCompVig#(v), 2, 6) + " m"
        DetLinha t, lin
    NEXT
    FOR i = 1 TO ColQtd
        t = "P " + RTRIM$(Col(i).nome) + "  " + FormataNumero$(Col(i).bx, 1, 6) + " x" + FormataNumero$(Col(i).by, 1, 6) + " cm   secao " + Col(i).secao
        DetLinha t, lin
    NEXT
    Espera "", 0
END SUB

' Escreve uma linha da lista; troca de pagina passando da linha 21.
SUB DetLinha (texto AS STRING, lin AS INTEGER)
    IF lin > 21 THEN
        Espera "", 0
        CLS
        TelaCabecalho "Detalhes dos elementos da forma"
        lin = 6
    END IF
    LOCATE lin, 3: PRINT texto
    lin = lin + 1
END SUB

' Grava <obra>_FORMA.VET: lajes (retangulo), vigas (contorno do eixo com a largura)
' e pilares (retangulo ou circulo). Escala esc em mm por metro.
SUB DesenhaForma (esc AS DOUBLE)
    DIM arq AS STRING, f AS INTEGER, xmin AS DOUBLE, ymin AS DOUBLE, i AS INTEGER, v AS INTEGER
    arq = ArqObra$("_FORMA.VET")
    DesLimites xmin, ymin
    f = VetAbre%(arq, "Forma da obra " + FrmObra)
    FOR i = 1 TO LajQtd
        VetRetangulo f, DesCoord#(Laj(i).x0, xmin, esc), DesCoord#(Laj(i).y0, ymin, esc), DesCoord#(Laj(i).x0 + Laj(i).lx, xmin, esc), DesCoord#(Laj(i).y0 + Laj(i).ly, ymin, esc), 1
    NEXT
    FOR v = 1 TO VigQtd
        DesViga f, v, xmin, ymin, esc
    NEXT
    FOR i = 1 TO ColQtd
        DesPilar f, i, xmin, ymin, esc
    NEXT
    VetTexto f, 10, 3, 4, 0, 3, FrmObra
    VetFecha f
END SUB

' Menor x e menor y entre lajes, apoios de vigas e pilares (origem do desenho).
SUB DesLimites (xmin AS DOUBLE, ymin AS DOUBLE)
    DIM i AS INTEGER, v AS INTEGER, k AS INTEGER, a AS INTEGER
    xmin = 1E+30: ymin = 1E+30
    FOR i = 1 TO LajQtd
        IF Laj(i).x0 < xmin THEN xmin = Laj(i).x0
        IF Laj(i).y0 < ymin THEN ymin = Laj(i).y0
    NEXT
    FOR v = 1 TO VigQtd
        a = Vig(v).iApo
        FOR k = a TO a + Vig(v).nTramos
            IF VigApo(k).x < xmin THEN xmin = VigApo(k).x
            IF VigApo(k).y < ymin THEN ymin = VigApo(k).y
        NEXT
    NEXT
    FOR i = 1 TO ColQtd
        IF Col(i).x < xmin THEN xmin = Col(i).x
        IF Col(i).y < ymin THEN ymin = Col(i).y
    NEXT
END SUB

' Coordenada no papel (mm) de um valor em metros, com margem de 10 mm.
FUNCTION DesCoord# (v AS DOUBLE, mn AS DOUBLE, esc AS DOUBLE)
    DesCoord# = (v - mn) * esc + 10
END FUNCTION

' Viga v: contorno de retangulo de largura bw centrado no eixo primeiro-ultimo apoio.
SUB DesViga (f AS INTEGER, v AS INTEGER, xmin AS DOUBLE, ymin AS DOUBLE, esc AS DOUBLE)
    DIM a AS INTEGER, b AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE
    DIM comp AS DOUBLE, nx AS DOUBLE, ny AS DOUBLE, meia AS DOUBLE
    a = Vig(v).iApo: b = a + Vig(v).nTramos
    x1 = VigApo(a).x: y1 = VigApo(a).y: x2 = VigApo(b).x: y2 = VigApo(b).y
    comp = SQR((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
    IF comp = 0 THEN EXIT SUB
    meia = Vig(v).bw / 200                 ' meia largura em m (bw em cm)
    nx = -(y2 - y1) / comp * meia
    ny = (x2 - x1) / comp * meia
    VetLinha f, DesCoord#(x1 + nx, xmin, esc), DesCoord#(y1 + ny, ymin, esc), DesCoord#(x2 + nx, xmin, esc), DesCoord#(y2 + ny, ymin, esc), 1
    VetLinha f, DesCoord#(x2 + nx, xmin, esc), DesCoord#(y2 + ny, ymin, esc), DesCoord#(x2 - nx, xmin, esc), DesCoord#(y2 - ny, ymin, esc), 1
    VetLinha f, DesCoord#(x2 - nx, xmin, esc), DesCoord#(y2 - ny, ymin, esc), DesCoord#(x1 - nx, xmin, esc), DesCoord#(y1 - ny, ymin, esc), 1
    VetLinha f, DesCoord#(x1 - nx, xmin, esc), DesCoord#(y1 - ny, ymin, esc), DesCoord#(x1 + nx, xmin, esc), DesCoord#(y1 + ny, ymin, esc), 1
END SUB

' Pilar i: retangulo (secao R) ou circulo (secao C) centrado no pilar; dimensoes em cm.
SUB DesPilar (f AS INTEGER, i AS INTEGER, xmin AS DOUBLE, ymin AS DOUBLE, esc AS DOUBLE)
    DIM cx AS DOUBLE, cy AS DOUBLE, mx AS DOUBLE, my AS DOUBLE
    cx = DesCoord#(Col(i).x, xmin, esc)
    cy = DesCoord#(Col(i).y, ymin, esc)
    mx = Col(i).bx / 200 * esc
    my = Col(i).by / 200 * esc
    IF Col(i).secao = "C" THEN
        VetCirculo f, cx, cy, mx, 1
    ELSE
        VetRetangulo f, cx - mx, cy - my, cx + mx, cy + my, 1
    END IF
END SUB

' Mensagem de aviso ou erro na linha 23/24, com espera de ESC ou Enter.
' erro <> 0 escreve em vermelho (TelaErro); senao, na barra de status.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF texto <> "" THEN
        IF erro THEN TelaErro texto ELSE TelaStatus texto
    END IF
    LOCATE 23, 3: PRINT "Acione ESC <Enter> para Continuar";
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27) OR k = CHR$(13)
    LOCATE 23, 1: PRINT SPACE$(79);
    LOCATE 24, 1: PRINT SPACE$(79);
    LOCATE 25, 1: PRINT SPACE$(79);
END SUB

' Quantitativos (F): area de forma e volume de concreto do pavimento (FORMCALC.BM).
' Pe-direito pedido ao usuario (padrao 3 m).
SUB ItemQuantitativos
    DIM msg AS STRING, pe AS DOUBLE
    FcMontaForma msg
    IF msg <> "" THEN
        Espera msg, -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Quantitativos da forma"
    LOCATE 6, 3: PRINT "Pe-direito (m): ";
    pe = VAL(EntradaTexto$(6, 20, 8, "3"))
    LOCATE 8, 3: PRINT "Area de forma sem pe-direito (m2): "; FormataNumero$(FcAreaForma#(0), 2, 10)
    LOCATE 9, 3: PRINT "Area de forma com pe-direito (m2): "; FormataNumero$(FcAreaForma#(pe), 2, 10)
    LOCATE 10, 3: PRINT "Volume de concreto (m3): "; FormataNumero$(FcVolumeConcreto#, 3, 10)
    Espera "", 0
END SUB

' Gravacao (3.10): confirma o caminho, faz copia de seguranca e grava <obra>.FRM.
' Depois oferece a geracao de .FOR e .CFO (ItemDadosDesenho).
SUB ItemGrava
    DIM msg AS STRING, arq AS STRING, k AS STRING
    IF AlgumPilarAlterado% OR AlgumaVigaAlterada% THEN
        LOCATE 21, 3: PRINT "Existem elementos alterados."
        Espera "Acione REDESENHA para atualizacao e depois grave os dados da forma.", -1
        EXIT SUB
    END IF
    FcMontaForma msg
    IF msg <> "" THEN
        Espera msg, -1
        EXIT SUB
    END IF
    arq = ArqObra$(".FRM")
    CLS
    TelaCabecalho "Gravacao dos dados da Forma"
    LOCATE 7, 3: PRINT "Sigo com a gravacao em " + arq + "   N/*S*"
    k = UCASE$(TeclaLer$)
    IF k <> "S" AND k <> CHR$(13) THEN
        Espera "Atencao !! as alteracoes executadas nao foram gravadas", 0
        EXIT SUB
    END IF
    TelaStatus "aguarde"
    DadErro = ""
    FrmGrava arq
    IF DadErro <> "" THEN
        Espera DadErro, -1
        EXIT SUB
    END IF
    Espera "arquivo de dados de forma gravado em " + arq, 0
    ItemDadosDesenho
END SUB

' Geracao dos dados para desenho: <obra>.FOR (vigas) e <obra>.CFO (pilares),
' a partir de FrmVig/FrmPil montados em ItemGrava. Pede nivel e pe-direito.
' Cada arquivo anterior vira <arq>.BAK por extensao (DadAbreGravacao% faz a copia).
SUB ItemDadosDesenho
    DIM nivel AS INTEGER, altura AS DOUBLE, k AS STRING
    CLS
    TelaCabecalho "Geracao dos dados para Desenho de Vigas e Desenho de Pilares"
    LOCATE 6, 3: PRINT "Nivel (numero): ";
    nivel = INT(EntradaNumero#(6, 22, 4, 1))
    LOCATE 7, 3: PRINT "Pe-direito do nivel (m): ";
    altura = EntradaNumero#(7, 30, 8, 3)
    LOCATE 9, 3: PRINT "Gera " + FrmObra + ".FOR (vigas) e " + FrmObra + ".CFO (pilares)   N/*S*"
    k = UCASE$(TeclaLer$)
    IF k <> "S" AND k <> CHR$(13) THEN
        Espera "Dados para desenho nao gerados; o .FRM ja foi gravado.", 0
        EXIT SUB
    END IF
    TelaStatus "aguarde"
    DadErro = ""
    ForGrava ArqObra$(".FOR"), nivel
    IF DadErro = "" THEN CfoGrava ArqObra$(".CFO"), nivel, altura
    IF DadErro <> "" THEN
        Espera DadErro, -1
        EXIT SUB
    END IF
    Espera "dados de desenho gravados em " + FrmObra + ".FOR e " + FrmObra + ".CFO; anteriores em " + FrmObra + ".FOR.BAK e " + FrmObra + ".CFO.BAK", 0
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: 'FORMCALC.BM'
'$INCLUDE: 'FORMAMAR.BM'
