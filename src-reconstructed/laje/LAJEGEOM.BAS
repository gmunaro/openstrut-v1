' ============================================================================
'  LAJEGEOM.BAS - definicao dos dados de geometria do painel de lajes (3.1).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de LAJEGEOM.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/LAJEGEOM.md.
'
'  Opcoes com tela: 1 (eixos de auxilio, .EIX), 2 (geometria, visualizacao SCREEN 12),
'  3 (cargas de arquitetura), 6 (cargas g e q), 7 (nivel e geracao de .VIG e .RLP via
'  LAJEMONT), 8 (planta .VET), 9 (retorno). Opcoes 4 e 5 removidas do menu (RECONSTRUCAO).
'  Continuidade e numeracao de vigas: LgDetectaContinuidade (LAJEGEOT.BM).
'  Verificacao de licenca do original nao reimplementada.
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Textos de tela que nao estao na spec sao do fonte, nao do EXE.
'  Compilacao: tools/build.sh laje/LAJEGEOM   (qb64pe -c -x LAJEGEOM.BAS)
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'
'$INCLUDE: '../laje/LAJEGEOT.BM'

' Rotinas de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE SUB LajGrava (arq AS STRING)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
' Rotinas de SISPLOT.BM (o .BM nao traz DECLARE)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB LajCarrega ()
DECLARE SUB LajSalva ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE FUNCTION DadNome$ (s AS STRING)
DECLARE FUNCTION DadAbreLeitura% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE FUNCTION DadAbreGravacao% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB LimpaLinha (lin AS INTEGER)
DECLARE FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
DECLARE FUNCTION CampoNum# (rotulo AS STRING, padrao AS DOUBLE)
DECLARE FUNCTION CampoTexto$ (rotulo AS STRING, padrao AS STRING, larg AS INTEGER)
DECLARE FUNCTION BordosValidos% (b AS STRING)
DECLARE FUNCTION TabCabecalho$ (modo AS INTEGER)
DECLARE FUNCTION TabLinha$ (i AS INTEGER, modo AS INTEGER)
DECLARE SUB TabelaLajes (modo AS INTEGER)
DECLARE SUB TabInclui (sel AS INTEGER)
DECLARE SUB TabDeleta (sel AS INTEGER)
DECLARE FUNCTION LajEditaGeom% (i AS INTEGER)
DECLARE SUB LajEditaCarga (i AS INTEGER)
DECLARE SUB LajContinuidade ()
DECLARE SUB Desenha ()
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB EixCarrega ()
DECLARE SUB EixGrava ()
DECLARE FUNCTION EixArq$ (obra AS STRING)
DECLARE SUB EixosTela ()
DECLARE SUB EixMostra (lin AS INTEGER, d AS INTEGER)
DECLARE SUB EixInclui (d AS INTEGER)
DECLARE SUB EixDeleta ()
DECLARE FUNCTION CampoCoord# (rotulo AS STRING, padrao AS DOUBLE, d AS INTEGER)
DECLARE SUB CargasLajes ()
DECLARE SUB CargasArq (i AS INTEGER)
DECLARE SUB CargaMostra (i AS INTEGER, tipo AS INTEGER, lin AS INTEGER)
DECLARE SUB CargaInclui (i AS INTEGER, tipo AS INTEGER)
DECLARE SUB CargaUltima (i AS INTEGER, tipo AS INTEGER)
DECLARE SUB CargaCopia (dst AS INTEGER, src AS INTEGER)
DECLARE FUNCTION CargaTotal# (i AS INTEGER, tipo AS INTEGER)
DECLARE SUB LajBBox (xmin AS DOUBLE, xmax AS DOUBLE, ymin AS DOUBLE, ymax AS DOUBLE)
DECLARE SUB ItemVigas ()
DECLARE SUB GeraVigas ()
DECLARE SUB ItemPlanta ()
DECLARE SUB ItemRetorno ()
DECLARE FUNCTION ArqLajPath$ (obra AS STRING)
DECLARE FUNCTION DirComBarra$ (d AS STRING)

CONST EIX_MAX = 40                  ' teto de eixos por direcao (tamanho do array)
CONST CARGA_MAX = 70                ' teto de cargas por tipo e laje (tamanho do array)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED LimLajes AS INTEGER      ' lajes maximas: LAJE.INI, no maximo DAD_MAXLAJ
DIM SHARED LimEixos AS INTEGER      ' eixos maximos por direcao: LAJE.INI, no maximo EIX_MAX
DIM SHARED LimCargas AS INTEGER     ' cargas maximas por tipo: LAJE.INI, no maximo CARGA_MAX
DIM SHARED LajAlterada AS INTEGER   ' -1 se ha alteracao ainda nao gravada
DIM SHARED EixQtd(1 TO 2) AS INTEGER                    ' eixos em uso: 1 horizontais, 2 verticais
DIM SHARED EixCota(1 TO 2, 1 TO EIX_MAX) AS DOUBLE      ' cota (m) de cada eixo
DIM SHARED CargaQtd(1 TO DAD_MAXLAJ, 1 TO 2) AS INTEGER ' cargas por laje: 1 linear, 2 por area
DIM SHARED CargaDado(1 TO DAD_MAXLAJ, 1 TO 2, 1 TO CARGA_MAX, 1 TO 2) AS DOUBLE   ' (comprimento ou area, carga)
DIM SHARED CargaGAplicado(1 TO DAD_MAXLAJ) AS DOUBLE    ' parcela de g ja somada pela carga equivalente

CONST LINHAS_TAB = 15               ' linhas de lajes visiveis na tabela (linhas 6 a 20)
CONST PLANTA_MM_POR_M = 10          ' RECONSTRUCAO: escala da planta (1:100), inferida

CarregaConfiguracao
LajCarrega
MenuPrincipal
SYSTEM

' Le LAJE.INI (limites, diretorio de dados) e define a obra corrente.
' Sem obra corrente, pergunta o nome e grava com ObraDefine.
SUB CarregaConfiguracao
    DIM i AS INTEGER, d AS STRING
    ComumDirExecDefine _CWD$
    LimLajes = DAD_MAXLAJ
    LimEixos = EIX_MAX
    LimCargas = CARGA_MAX
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    IF ArqLer%(ComumDirExec$ + "LAJE.INI") >= 0 THEN
        i = ArqAchaTexto%("NUMERO MAXIMO DE LAJES ARQUIVADAS", 0)
        IF i > 0 THEN
            LimLajes = VAL(IniValor$(i))
            IF LimLajes < 1 OR LimLajes > DAD_MAXLAJ THEN LimLajes = DAD_MAXLAJ
        END IF
        i = ArqAchaTexto%("NUMERO MAXIMO DE EIXOS", 0)
        IF i > 0 THEN
            LimEixos = VAL(IniValor$(i))
            IF LimEixos < 1 OR LimEixos > EIX_MAX THEN LimEixos = EIX_MAX
        END IF
        ' RECONSTRUCAO: o limite de cargas vale para os dois tipos (linear e por area).
        i = ArqAchaTexto%("NUMERO MAXIMO DE CARGAS LINEARES", 0)
        IF i > 0 THEN
            LimCargas = VAL(IniValor$(i))
            IF LimCargas < 1 OR LimCargas > CARGA_MAX THEN LimCargas = CARGA_MAX
        END IF
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    LajObra = ObraAtual$(DirDados)
    IF LajObra = "" THEN
        CLS
        TelaCabecalho ""
        LOCATE 6, 3: PRINT "Nome da obra corrente: ";
        LajObra = EntradaTexto$(6, 3 + 24, 30, "")
        IF LajObra = "" THEN LajObra = "sem nome"
        ObraDefine DirDados, LajObra
    END IF
END SUB

' Carrega <obra>.LAJ e <obra>.EIX se existirem. Sem arquivo, comeca vazio.
' RECONSTRUCAO: o .LAJ grava so g (que ja inclui a parcela das cargas linear/area
' de sessoes anteriores) e nao grava as cargas linear/area. Por isso CargaGAplicado
' zera aqui e nada e reaplicado: o menu 3 soma so o que o usuario digitar nesta
' sessao. Suposicao a confirmar com o autor do formato.
SUB LajCarrega
    DIM k AS INTEGER
    LajQtd = 0
    IF _FILEEXISTS(ArqLajPath$(LajObra)) THEN
        IF LajLe%(ArqLajPath$(LajObra)) = 0 THEN Espera DadErro, -1
    END IF
    FOR k = 1 TO DAD_MAXLAJ
        CargaGAplicado(k) = 0
    NEXT k
    EixCarrega
    LajAlterada = 0
END SUB

' Grava <obra>.LAJ e <obra>.EIX com o que esta em memoria.
SUB LajSalva
    LajGrava ArqLajPath$(LajObra)
    EixGrava
    LajAlterada = 0
END SUB

' Menu 1 a 9 da definicao da geometria (spec 3.1). 9 sai.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        LOCATE 7, 10: PRINT "1  -  ";
        TelaItemMenu 7, 16, "Eixos de Auxilio"
        LOCATE 8, 10: PRINT "2  -  ";
        TelaItemMenu 8, 16, "Arquitetura, definicoes de contorno"
        LOCATE 9, 10: PRINT "3  -  ";
        TelaItemMenu 9, 16, "Ocupacao / Cargas de Arquitetura"
        LOCATE 12, 10: PRINT "6  -  ";
        TelaItemMenu 12, 16, "Lajes / Cargas de Estrutura"
        LOCATE 13, 10: PRINT "7  -  ";
        TelaItemMenu 13, 16, "Vigas / Geracao de Arquivos (.VIG e .RLP)"
        LOCATE 14, 10: PRINT "8  -  ";
        TelaItemMenu 14, 16, "Impressao de Relatorios"
        LOCATE 15, 10: PRINT "9  -  ";
        TelaItemMenu 15, 16, "Retorno ao Menu Principal"
        TelaStatus "escolha opcao "
        k = TeclaLer$
        ' RECONSTRUCAO: opcoes 4 (Estrutura / Lancamento) e 5 (Pilares) saem do menu.
        SELECT CASE k
            CASE "1": EixosTela
            CASE "2": TabelaLajes 2
            CASE "3": CargasLajes
            CASE "6": TabelaLajes 6
            CASE "7": ItemVigas
            CASE "8": ItemPlanta
            CASE "9": ItemRetorno
        END SELECT
    LOOP UNTIL k = "9"
END SUB

' Cabecalho: titulo e obra (linhas 1 e 2); subtitulo na linha 4 quando nao vazio.
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "Definicao dos dados de Geometria do Painel"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "Obra - "; LajObra; "   Dados em "; DirCurto$(DirDados, 77 - LEN("Obra - " + RTRIM$(LajObra) + "   Dados em "))
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 4, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Aviso (erro = -1) ou status (erro = 0) nas linhas 24 e 25, espera ESC ou Enter.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF texto <> "" THEN
        IF erro THEN TelaErro texto ELSE TelaStatus texto
    END IF
    LOCATE 23, 3: PRINT "Acione ESC <Enter> para Continuar";
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27) OR k = CHR$(13)
    LimpaLinha 23
    LimpaLinha 24
    LimpaLinha 25
END SUB

SUB LimpaLinha (lin AS INTEGER)
    LOCATE lin, 1: PRINT SPACE$(79);
END SUB

' Pergunta S/N na linha lin. Enter devolve padrao; ESC devolve 0.
FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    LimpaLinha lin
    LOCATE lin, 3: PRINT texto;
    DO
        k = UCASE$(TeclaLer$)
        IF k = "S" THEN
            Pergunta% = -1
            EXIT FUNCTION
        ELSEIF k = "N" OR k = CHR$(27) THEN
            Pergunta% = 0
            EXIT FUNCTION
        ELSEIF k = CHR$(13) THEN
            Pergunta% = padrao
            EXIT FUNCTION
        END IF
    LOOP
END FUNCTION

' Campo numerico com rotulo na linha 23. ESC mantem o valor atual.
FUNCTION CampoNum# (rotulo AS STRING, padrao AS DOUBLE)
    LimpaLinha 23
    LOCATE 23, 3: PRINT rotulo;
    CampoNum# = EntradaNumero#(23, 3 + LEN(rotulo) + 1, 10, padrao)
END FUNCTION

' Campo de texto com rotulo na linha 23. ESC mantem o valor atual.
FUNCTION CampoTexto$ (rotulo AS STRING, padrao AS STRING, larg AS INTEGER)
    LimpaLinha 23
    LOCATE 23, 3: PRINT rotulo;
    CampoTexto$ = EntradaTexto$(23, 3 + LEN(rotulo) + 1, larg, padrao)
END FUNCTION

' Campo de coordenada (m) com rotulo na linha 23. Aceita numero ou E<n>: cota do
' eixo n da direcao d (1 horizontal, 2 vertical). Repete ate ter valor valido; ESC
' mantem o valor atual.
' RECONSTRUCAO: snap E<n> inferido; a spec nao descreve a entrada por eixo.
FUNCTION CampoCoord# (rotulo AS STRING, padrao AS DOUBLE, d AS INTEGER)
    DIM t AS STRING, n AS INTEGER
    DO
        LimpaLinha 23
        LOCATE 23, 3: PRINT rotulo;
        t = UCASE$(EntradaTexto$(23, 3 + LEN(rotulo) + 1, 10, LTRIM$(STR$(padrao))))
        IF LEFT$(t, 1) = "E" AND NumeroValido%(MID$(t, 2)) THEN
            n = INT(VAL(MID$(t, 2)))
            IF n >= 1 AND n <= EixQtd(d) THEN
                CampoCoord# = EixCota(d, n)
                EXIT FUNCTION
            END IF
        ELSEIF NumeroValido%(t) THEN
            CampoCoord# = VAL(t)
            EXIT FUNCTION
        END IF
        Espera "Digite um numero ou E<n> com um eixo existente.", -1
    LOOP
END FUNCTION

' Bordos: 4 letras, cada uma A (apoiado), E (engastado) ou L (livre).
FUNCTION BordosValidos% (b AS STRING)
    DIM i AS INTEGER, c AS STRING
    BordosValidos% = (LEN(b) = 4)
    FOR i = 1 TO LEN(b)
        c = MID$(b, i, 1)
        IF INSTR("AEL", c) = 0 THEN BordosValidos% = 0
    NEXT
END FUNCTION

' Cabecalho das colunas da tabela. modo 2 = geometria, 6 = cargas.
FUNCTION TabCabecalho$ (modo AS INTEGER)
    DIM s AS STRING
    s = "  N  " + LEFT$("Nome" + SPACE$(8), 8)
    IF modo = 2 THEN
        s = s + " " + RIGHT$(SPACE$(8) + "x0", 8) + " " + RIGHT$(SPACE$(8) + "y0", 8)
        s = s + " " + RIGHT$(SPACE$(8) + "lx", 8) + " " + RIGHT$(SPACE$(8) + "ly", 8)
        s = s + " " + RIGHT$(SPACE$(8) + "h", 8) + "  Bordos"
    ELSE
        s = s + " " + RIGHT$(SPACE$(8) + "g", 8) + " " + RIGHT$(SPACE$(8) + "q", 8)
    END IF
    TabCabecalho$ = s
END FUNCTION

' Linha da tabela para a laje i.
FUNCTION TabLinha$ (i AS INTEGER, modo AS INTEGER)
    DIM s AS STRING
    s = RIGHT$("   " + LTRIM$(STR$(i)), 3) + "  " + LEFT$(DadNome$(Laj(i).nome) + SPACE$(8), 8)
    IF modo = 2 THEN
        s = s + " " + FormataNumero$(Laj(i).x0, 2, 8) + " " + FormataNumero$(Laj(i).y0, 2, 8)
        s = s + " " + FormataNumero$(Laj(i).lx, 2, 8) + " " + FormataNumero$(Laj(i).ly, 2, 8)
        s = s + " " + FormataNumero$(Laj(i).h, 2, 8) + "  " + LEFT$(Laj(i).bordos, 4)
    ELSE
        s = s + " " + FormataNumero$(Laj(i).g, 2, 8) + " " + FormataNumero$(Laj(i).q, 2, 8)
    END IF
    TabLinha$ = s
END FUNCTION

' Tabela de lajes com cursor. modo 2: geometria (inclui, edita, deleta, visualiza).
' modo 6: cargas g e q (edita). Setas movem o cursor; F ou ESC sai.
SUB TabelaLajes (modo AS INTEGER)
    DIM sel AS INTEGER, topo AS INTEGER, r AS INTEGER, i AS INTEGER, k AS STRING
    sel = 1
    topo = 1
    DO
        CLS
        IF modo = 2 THEN
            TelaCabecalho " A R Q U I T E T U R A"
        ELSE
            TelaCabecalho " C A R G A S   D E   L A J E"
        END IF
        COLOR COR_DESTAQUE
        LOCATE 5, 1: PRINT TabCabecalho$(modo)
        COLOR COR_TEXTO
        IF sel < topo THEN topo = sel
        IF sel > topo + LINHAS_TAB - 1 THEN topo = sel - LINHAS_TAB + 1
        FOR r = 0 TO LINHAS_TAB - 1
            i = topo + r
            IF i <= LajQtd THEN
                IF i = sel THEN
                    COLOR COR_STATUS, COR_STATUS_FUNDO
                ELSE
                    COLOR COR_TEXTO
                END IF
                LOCATE 6 + r, 1: PRINT TabLinha$(i, modo)
            END IF
        NEXT
        COLOR COR_TEXTO
        IF modo = 2 THEN
            LOCATE 22, 3: PRINT "<I>nclui  <E>dita  <D>eleta  <V>isualiza  <F>im";
        ELSE
            LOCATE 22, 3: PRINT "<E>dita  <F>im";
        END IF
        TelaStatus "escolha opcao "
        k = TeclaLer$
        IF LEN(k) = 2 THEN
            IF ASC(RIGHT$(k, 1)) = 72 AND sel > 1 THEN sel = sel - 1
            IF ASC(RIGHT$(k, 1)) = 80 AND sel < LajQtd THEN sel = sel + 1
        ELSE
            SELECT CASE UCASE$(k)
                CASE "I"
                    IF modo = 2 THEN TabInclui sel
                CASE "E", CHR$(13)
                    IF LajQtd > 0 THEN
                        IF modo = 2 THEN
                            i = LajEditaGeom%(sel)
                        ELSE
                            LajEditaCarga sel
                        END IF
                    END IF
                CASE "D"
                    IF modo = 2 AND LajQtd > 0 THEN TabDeleta sel
                CASE "V"
                    IF modo = 2 THEN Desenha
            END SELECT
        END IF
    LOOP UNTIL UCASE$(k) = "F" OR k = CHR$(27)
END SUB

' Inclui uma laje no fim da tabela. Some se os dados forem recusados.
' Devolve o primeiro "L<n>" que nenhuma laje da lista usa. Deletar uma laje
' do meio deixa buracos na numeracao; sem isso a inclusao repetia nomes.
' RECONSTRUCAO: a regra "L<n> com menor n livre" e suposicao; o original
' pode ter numerado pela posicao (L<n> = n-esima laje).
FUNCTION LajNomeLivre$
    DIM n AS INTEGER, k AS INTEGER, usado AS INTEGER
    n = 1
    DO
        usado = 0
        FOR k = 1 TO LajQtd
            ' RTRIM$: o campo e STRING * 8; em QB64 "L1      " <> "L1" na comparacao.
            IF RTRIM$(Laj(k).nome) = "L" + LTRIM$(STR$(n)) THEN usado = -1
        NEXT k
        IF usado = 0 THEN EXIT DO
        n = n + 1
    LOOP
    LajNomeLivre$ = "L" + LTRIM$(STR$(n))
END FUNCTION

SUB TabInclui (sel AS INTEGER)
    DIM ok AS INTEGER, nomeNovo AS STRING
    IF LajQtd >= LimLajes THEN
        Espera "Numero maximo de lajes atingido: " + LTRIM$(STR$(LimLajes)), -1
        EXIT SUB
    END IF
    nomeNovo = LajNomeLivre$
    LajQtd = LajQtd + 1
    sel = LajQtd
    Laj(sel).nome = nomeNovo
    Laj(sel).x0 = 0: Laj(sel).y0 = 0: Laj(sel).lx = 0: Laj(sel).ly = 0: Laj(sel).h = 0
    Laj(sel).bordos = "AAAA"
    Laj(sel).g = 0: Laj(sel).q = 0
    Laj(sel).vigas = ""
    Laj(sel).temRes = 0
    CargaQtd(sel, 1) = 0: CargaQtd(sel, 2) = 0
    CargaGAplicado(sel) = 0
    ok = LajEditaGeom%(sel)
    IF ok = 0 THEN
        LajQtd = LajQtd - 1
        IF sel > LajQtd THEN sel = LajQtd
        IF sel < 1 THEN sel = 1
    END IF
END SUB

' Remove a laje sel (com confirmacao) e recalcula continuidade.
SUB TabDeleta (sel AS INTEGER)
    DIM j AS INTEGER
    IF Pergunta%(23, "Confirma exclusao da laje " + DadNome$(Laj(sel).nome) + "  S/*N*", 0) = 0 THEN EXIT SUB
    FOR j = sel TO LajQtd - 1
        Laj(j) = Laj(j + 1)
        CargaCopia j, j + 1
    NEXT
    LajQtd = LajQtd - 1
    IF sel > LajQtd AND sel > 1 THEN sel = sel - 1
    LajContinuidade
    LajAlterada = -1
END SUB

' Edita nome, geometria e bordos da laje i. Devolve -1 se aplicou, 0 se recusou.
' Bordos E sao recalculados pela continuidade; o usuario informa A ou L.
' x0 aceita E<n> (eixo vertical n) e y0 aceita E<n> (eixo horizontal n).
FUNCTION LajEditaGeom% (i AS INTEGER)
    DIM nome AS STRING, bd AS STRING
    DIM x0 AS DOUBLE, y0 AS DOUBLE, lx AS DOUBLE, ly AS DOUBLE, h AS DOUBLE
    nome = CampoTexto$("Nome:", DadNome$(Laj(i).nome), 8)
    x0 = CampoCoord#("x0 (m):", Laj(i).x0, 2)
    y0 = CampoCoord#("y0 (m):", Laj(i).y0, 1)
    lx = CampoNum#("lx (m):", Laj(i).lx)
    ly = CampoNum#("ly (m):", Laj(i).ly)
    h = CampoNum#("h (cm, 0 = calcular):", Laj(i).h)
    bd = UCASE$(CampoTexto$("Bordos (A/E/L):", Laj(i).bordos, 4))
    IF lx <= 0 OR ly <= 0 THEN
        Espera "Os lados lx e ly devem ser maiores que zero.", -1
        LajEditaGeom% = 0
        EXIT FUNCTION
    END IF
    IF BordosValidos%(bd) = 0 THEN
        Espera "Bordos: 4 letras, cada uma A, E ou L.", -1
        LajEditaGeom% = 0
        EXIT FUNCTION
    END IF
    Laj(i).nome = nome
    Laj(i).x0 = x0: Laj(i).y0 = y0
    Laj(i).lx = lx: Laj(i).ly = ly: Laj(i).h = h
    Laj(i).bordos = bd
    Laj(i).temRes = 0
    LajContinuidade
    LajAlterada = -1
    LajEditaGeom% = -1
END FUNCTION

' Edita as cargas g e q da laje i. O g digitado e a carga permanente base (sem
' paredes): a parcela das cargas linear/area do menu 3 deixa de estar somada, por
' isso CargaGAplicado zera e o proximo menu 3 soma a equivalente sobre a base.
SUB LajEditaCarga (i AS INTEGER)
    DIM g AS DOUBLE, q AS DOUBLE
    ' RECONSTRUCAO: rotulos de g e q inferidos (a spec nao os liga aos campos).
    g = CampoNum#("Digite a nova carga *###.##* g:", Laj(i).g)
    q = CampoNum#("Parcela Acidental *###.##* q:", Laj(i).q)
    Laj(i).g = g
    CargaGAplicado(i) = 0
    Laj(i).q = q
    Laj(i).temRes = 0
    LajAlterada = -1
END SUB

' Recalcula a continuidade (bordos E); se bordos ou vigas mudaram, zera os
' resultados de todas as lajes. Quem edita uma laje zera o temRes dela.
SUB LajContinuidade
    DIM i AS INTEGER, antes AS STRING, depois AS STRING
    FOR i = 1 TO LajQtd: antes = antes + Laj(i).bordos + RTRIM$(Laj(i).vigas) + "|": NEXT
    LgDetectaContinuidade
    FOR i = 1 TO LajQtd: depois = depois + Laj(i).bordos + RTRIM$(Laj(i).vigas) + "|": NEXT
    ' so invalida os resultados se bordos ou vigas mudaram (visualizar nao zera)
    IF depois <> antes THEN
        FOR i = 1 TO LajQtd
            Laj(i).temRes = 0
        NEXT
    END IF
END SUB

' Retangulo envolvente das lajes (m). Garante tamanho nao nulo em x e y.
SUB LajBBox (xmin AS DOUBLE, xmax AS DOUBLE, ymin AS DOUBLE, ymax AS DOUBLE)
    DIM i AS INTEGER
    xmin = Laj(1).x0: xmax = Laj(1).x0 + Laj(1).lx
    ymin = Laj(1).y0: ymax = Laj(1).y0 + Laj(1).ly
    FOR i = 2 TO LajQtd
        IF Laj(i).x0 < xmin THEN xmin = Laj(i).x0
        IF Laj(i).x0 + Laj(i).lx > xmax THEN xmax = Laj(i).x0 + Laj(i).lx
        IF Laj(i).y0 < ymin THEN ymin = Laj(i).y0
        IF Laj(i).y0 + Laj(i).ly > ymax THEN ymax = Laj(i).y0 + Laj(i).ly
    NEXT
    IF xmax - xmin <= 0 THEN xmax = xmin + 1
    IF ymax - ymin <= 0 THEN ymax = ymin + 1
END SUB

' Visualizacao em SCREEN 12: retangulos das lajes, nomes e eixos. Qualquer tecla volta.
' RECONSTRUCAO: cor e extensao dos eixos na tela inferidas; eixos fora da area sao cortados.
SUB Desenha
    DIM i AS INTEGER, j AS INTEGER
    DIM xmin AS DOUBLE, xmax AS DOUBLE, ymin AS DOUBLE, ymax AS DOUBLE
    DIM escala AS DOUBLE, px1 AS DOUBLE, py1 AS DOUBLE, px2 AS DOUBLE, py2 AS DOUBLE
    DIM px AS DOUBLE, py AS DOUBLE
    DIM tecla AS STRING
    IF LajQtd = 0 THEN
        Espera "Nao ha lajes para visualizar.", 0
        EXIT SUB
    END IF
    LajBBox xmin, xmax, ymin, ymax
    escala = 560 / (xmax - xmin)
    IF 360 / (ymax - ymin) < escala THEN escala = 360 / (ymax - ymin)
    SCREEN 12
    CLS
    ' y cresce para cima: topo da tela = maior y (RECONSTRUCAO, ver LAJEGEOT.BM)
    FOR j = 1 TO EixQtd(2)
        px = 40 + (EixCota(2, j) - xmin) * escala
        LINE (px, 420 - (ymax - ymin) * escala)-(px, 420), COR_TEXTO
    NEXT
    FOR j = 1 TO EixQtd(1)
        py = 420 - (EixCota(1, j) - ymin) * escala
        LINE (40, py)-(40 + (xmax - xmin) * escala, py), COR_TEXTO
    NEXT
    FOR i = 1 TO LajQtd
        px1 = 40 + (Laj(i).x0 - xmin) * escala
        py1 = 420 - (Laj(i).y0 + Laj(i).ly - ymin) * escala
        px2 = 40 + (Laj(i).x0 + Laj(i).lx - xmin) * escala
        py2 = 420 - (Laj(i).y0 - ymin) * escala
        LINE (px1, py1)-(px2, py2), COR_DESTAQUE, B
        LOCATE INT((py1 + py2) / 32) + 1, INT((px1 + px2) / 16) + 1
        PRINT DadNome$(Laj(i).nome)
    NEXT
    tecla = TeclaLer$
    SCREEN 0
END SUB

' Gera <obra>_PLANTA.VET (retangulos, nomes, vigas de cada lado e eixos). Mm = m * PLANTA_MM_POR_M.
SUB ItemPlanta
    DIM f AS INTEGER, i AS INTEGER, j AS INTEGER, s AS INTEGER, arq AS STRING, nv AS STRING
    DIM x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE
    DIM mx AS DOUBLE, my AS DOUBLE, px AS DOUBLE, py AS DOUBLE
    DIM xmin AS DOUBLE, xmax AS DOUBLE, ymin AS DOUBLE, ymax AS DOUBLE
    IF LajQtd = 0 THEN
        Espera "Nao ha lajes cadastradas.", 0
        EXIT SUB
    END IF
    LajContinuidade
    arq = DirDados + LajObra + "_PLANTA.VET"
    f = VetAbre%(arq, "Planta de lajes - " + LajObra)
    FOR i = 1 TO LajQtd
        x1 = Laj(i).x0 * PLANTA_MM_POR_M
        y1 = Laj(i).y0 * PLANTA_MM_POR_M
        x2 = (Laj(i).x0 + Laj(i).lx) * PLANTA_MM_POR_M
        y2 = (Laj(i).y0 + Laj(i).ly) * PLANTA_MM_POR_M
        mx = (x1 + x2) / 2
        my = (y1 + y2) / 2
        VetRetangulo f, x1, y1, x2, y2, 1
        VetTexto f, mx, my, 2.5, 0, 2, DadNome$(Laj(i).nome)
        FOR s = 1 TO 4
            nv = ParToken$(RTRIM$(Laj(i).vigas), "/", s)
            IF nv <> "" AND nv <> "-" THEN
                SELECT CASE s
                    CASE 1: px = x1 + 1: py = my
                    CASE 2: px = mx: py = y1 + 1
                    CASE 3: px = x2 - 6: py = my
                    CASE 4: px = mx: py = y2 - 4
                END SELECT
                VetTexto f, px, py, 1.5, 0, 3, nv
            END IF
        NEXT
    NEXT
    ' Eixos de auxilio na planta: pena 4, em mm, ocupando o retangulo das lajes.
    LajBBox xmin, xmax, ymin, ymax
    FOR j = 1 TO EixQtd(1)
        y1 = EixCota(1, j) * PLANTA_MM_POR_M
        VetLinha f, xmin * PLANTA_MM_POR_M, y1, xmax * PLANTA_MM_POR_M, y1, 4
    NEXT
    FOR j = 1 TO EixQtd(2)
        x1 = EixCota(2, j) * PLANTA_MM_POR_M
        VetLinha f, x1, ymin * PLANTA_MM_POR_M, x1, ymax * PLANTA_MM_POR_M, 4
    NEXT
    VetFecha f
    Espera "Planta gravada: " + arq, 0
END SUB

' Opcao 7: nivel das vigas e geracao de .VIG e .RLP (LAJEMONT). Sair com F ou ESC.
' RECONSTRUCAO: J (juntar), S (separar) e R (redesenhar) nao reconstruidos.
SUB ItemVigas
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho " V I G A S"
        LOCATE 7, 3: PRINT "<N>ivel   <G>eracao .VIG .RLP    <F>im"
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        IF k = "N" THEN
            LajNivel = INT(CampoNum#("Nivel das Vigas para numeracao *", LajNivel))
            LajAlterada = -1
        ELSEIF k = "G" THEN
            GeraVigas
        END IF
    LOOP UNTIL k = "F" OR k = CHR$(27)
END SUB

' Avisos, confirmacao, gravacao do .LAJ e chamada do LAJEMONT.
SUB GeraVigas
    DIM i AS INTEGER, sem AS INTEGER
    IF LajQtd = 0 THEN
        Espera "Nao ha lajes cadastradas.", 0
        EXIT SUB
    END IF
    ' RECONSTRUCAO: "sem peso proprio" inferido como altura h nao positiva.
    FOR i = 1 TO LajQtd
        IF Laj(i).h <= 0 THEN sem = sem + 1
    NEXT
    IF sem > 0 THEN
        IF Pergunta%(22, "Existem Lajes a serem calculadas sem peso proprio.  Continuo  N/*S*", -1) = 0 THEN EXIT SUB
    END IF
    COLOR COR_DESTAQUE
    LOCATE 14, 3: PRINT "ATENCAO !     Caso o arquivo de Vigas seja Gerado apos as consideracoes de Continuidade,"
    LOCATE 16, 3: PRINT "a Distribuicao de Cargas sera Alterada ."
    COLOR COR_TEXTO
    IF Pergunta%(19, "Confirme prosseguir para montagem dos arquivos .VIG e .RLP  N/*S*", -1) = 0 THEN EXIT SUB
    LajContinuidade
    LajSalva
    RunSubmodulo "LAJEMONT"
END SUB

' Opcao 9: grava se houver alteracao pendente e espera EXIT <Enter>.
SUB ItemRetorno
    DIM k AS STRING
    IF LajAlterada THEN
        ' ESC conta como N; antes de descartar, pede confirmacao explicita.
        DO
            IF Pergunta%(22, "Grava alteracoes da obra S/*N*", 0) THEN
                LajSalva
                EXIT DO
            END IF
            IF Pergunta%(22, "Abandono as alteracoes S/*N*", 0) THEN EXIT DO
        LOOP
    END IF
    CLS
    LOCATE 4, 3: PRINT "Retorno ao Modulo Basico de LAJE"
    LOCATE 5, 3: PRINT "Para retornar acione EXIT <Enter>"
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13)
END SUB

' ---------------------------------------------------------------- eixos ------

' Le <obra>.EIX (eixos horizontais e verticais). Sem arquivo, comeca sem eixos.
' RECONSTRUCAO: formato do .EIX inferido: cabecalho SISTRUT40 e, por direcao, a
' quantidade seguida das cotas, uma por linha (WRITE #, sequencial).
SUB EixCarrega
    DIM f AS INTEGER, ob AS STRING, d AS INTEGER, k AS INTEGER, n AS INTEGER
    EixQtd(1) = 0: EixQtd(2) = 0
    IF NOT _FILEEXISTS(EixArq$(LajObra)) THEN EXIT SUB
    ob = LajObra
    f = DadAbreLeitura%(EixArq$(LajObra), "EIX", ob)
    IF f = 0 THEN Espera DadErro, -1: EXIT SUB
    FOR d = 1 TO 2
        INPUT #f, n
        IF n > EIX_MAX THEN n = EIX_MAX
        EixQtd(d) = n
        FOR k = 1 TO n
            INPUT #f, EixCota(d, k)
        NEXT
    NEXT
    CLOSE #f
END SUB

' Grava <obra>.EIX com backup do anterior (DadAbreGravacao%). Formato: ver EixCarrega.
SUB EixGrava
    DIM f AS INTEGER, ob AS STRING, d AS INTEGER, k AS INTEGER
    ob = LajObra
    f = DadAbreGravacao%(EixArq$(LajObra), "EIX", ob)
    FOR d = 1 TO 2
        WRITE #f, EixQtd(d)
        FOR k = 1 TO EixQtd(d)
            WRITE #f, EixCota(d, k)
        NEXT
    NEXT
    CLOSE #f
END SUB

' Caminho do .EIX da obra no diretorio de dados corrente.
FUNCTION EixArq$ (obra AS STRING)
    EixArq$ = DirDados + obra + ".EIX"
END FUNCTION

' Opcao 1: lista os eixos horizontais e verticais. H e V incluem; D deleta; F sai.
SUB EixosTela
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho "Numero maximo de Eixos - " + LTRIM$(STR$(LimEixos))
        COLOR COR_DESTAQUE
        LOCATE 5, 3: PRINT "Eixos Horizontais"
        LOCATE 5, 40: PRINT "Eixos Verticais"
        COLOR COR_TEXTO
        EixMostra 6, 1
        EixMostra 6, 2
        LOCATE 22, 3: PRINT "<H>orizontal  <V>ertical  <D>eleta  <F>im";
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        IF k = "H" THEN EixInclui 1
        IF k = "V" THEN EixInclui 2
        IF k = "D" THEN EixDeleta
    LOOP UNTIL k = "F" OR k = CHR$(27)
END SUB

' Lista os eixos da direcao d (1 horizontal, 2 vertical) a partir da linha lin.
' Mostra ate LINHAS_TAB; o restante vira "..." na ultima linha.
SUB EixMostra (lin AS INTEGER, d AS INTEGER)
    DIM k AS INTEGER, col AS INTEGER
    IF d = 1 THEN
        col = 3
    ELSE
        col = 40
    END IF
    FOR k = 1 TO EixQtd(d)
        IF k > LINHAS_TAB THEN
            LOCATE lin + LINHAS_TAB, col: PRINT "...";
            EXIT FOR
        END IF
        LOCATE lin + k - 1, col
        PRINT RIGHT$("   " + LTRIM$(STR$(k)), 3) + "  " + FormataNumero$(EixCota(d, k), 2, 8);
    NEXT
END SUB

' Acrescenta um eixo ao fim da direcao d (1 horizontal, 2 vertical), com cota pedida.
SUB EixInclui (d AS INTEGER)
    DIM cota AS DOUBLE
    IF EixQtd(d) >= LimEixos THEN
        Espera "Numero maximo de eixos atingido: " + LTRIM$(STR$(LimEixos)), -1
        EXIT SUB
    END IF
    cota = CampoNum#("Cota do eixo (m):", 0)
    EixQtd(d) = EixQtd(d) + 1
    EixCota(d, EixQtd(d)) = cota
    LajAlterada = -1
END SUB

' Exclui o eixo n da direcao escolhida (H ou V). Pede a direcao e o numero.
SUB EixDeleta
    DIM d AS INTEGER, n AS INTEGER, j AS INTEGER, s AS STRING
    s = UCASE$(CampoTexto$("Deleta eixo H ou V:", "", 1))
    IF s = "H" THEN
        d = 1
    ELSEIF s = "V" THEN
        d = 2
    ELSE
        EXIT SUB
    END IF
    n = INT(CampoNum#("Numero do eixo:", 0))
    IF n < 1 OR n > EixQtd(d) THEN
        Espera "Eixo inexistente.", -1
        EXIT SUB
    END IF
    FOR j = n TO EixQtd(d) - 1
        EixCota(d, j) = EixCota(d, j + 1)
    NEXT
    EixQtd(d) = EixQtd(d) - 1
    LajAlterada = -1
END SUB

' ---------------------------------------------------------------- cargas ------

' Opcao 3: lista as lajes com o total das cargas linear e por area. E ou Enter abre
' as cargas da laje; F ou ESC sai.
SUB CargasLajes
    DIM sel AS INTEGER, topo AS INTEGER, r AS INTEGER, i AS INTEGER, k AS STRING
    IF LajQtd = 0 THEN
        Espera "Nao ha lajes cadastradas.", 0
        EXIT SUB
    END IF
    sel = 1
    topo = 1
    DO
        CLS
        TelaCabecalho " O C U P A C A O   E   C A R G A S"
        COLOR COR_DESTAQUE
        LOCATE 5, 1: PRINT "  N  Nome      Lin  Carga lin(tf)   Area  Carga area(tf)"
        COLOR COR_TEXTO
        IF sel < topo THEN topo = sel
        IF sel > topo + LINHAS_TAB - 1 THEN topo = sel - LINHAS_TAB + 1
        FOR r = 0 TO LINHAS_TAB - 1
            i = topo + r
            IF i <= LajQtd THEN
                IF i = sel THEN
                    COLOR COR_STATUS, COR_STATUS_FUNDO
                ELSE
                    COLOR COR_TEXTO
                END IF
                LOCATE 6 + r, 1
                PRINT RIGHT$("   " + LTRIM$(STR$(i)), 3) + "  " + LEFT$(DadNome$(Laj(i).nome) + SPACE$(8), 8) + "  " + RIGHT$("   " + LTRIM$(STR$(CargaQtd(i, 1))), 4) + "  " + FormataNumero$(CargaTotal#(i, 1), 2, 12) + "  " + RIGHT$("   " + LTRIM$(STR$(CargaQtd(i, 2))), 4) + "  " + FormataNumero$(CargaTotal#(i, 2), 2, 12)
            END IF
        NEXT
        COLOR COR_TEXTO
        LOCATE 22, 3: PRINT "<E>dita  <F>im";
        TelaStatus "escolha opcao "
        k = TeclaLer$
        IF LEN(k) = 2 THEN
            IF ASC(RIGHT$(k, 1)) = 72 AND sel > 1 THEN sel = sel - 1
            IF ASC(RIGHT$(k, 1)) = 80 AND sel < LajQtd THEN sel = sel + 1
        ELSEIF UCASE$(k) = "E" OR k = CHR$(13) THEN
            CargasArq sel
        END IF
    LOOP UNTIL UCASE$(k) = "F" OR k = CHR$(27)
END SUB

' Cargas de arquitetura da laje i. L inclui linear, A inclui por area, U retira a
' ultima; F ou ESC sai. Ao sair, Laj(i).g recebe a carga equivalente
' (LgCargaEquivalente#); a parcela aplicada antes nesta sessao e trocada, nao somada.
SUB CargasArq (i AS INTEGER)
    DIM k AS STRING, tp AS STRING, eq AS DOUBLE
    DO
        eq = LgCargaEquivalente#(Laj(i).lx, Laj(i).ly, CargaTotal#(i, 1), CargaTotal#(i, 2))
        CLS
        TelaCabecalho "Laje " + DadNome$(Laj(i).nome) + "   Carga equivalente (tf/m2): " + FormataNumero$(eq, 3, 8)
        COLOR COR_DESTAQUE
        LOCATE 5, 3: PRINT "Carga Linear         Comprimento      Carga(tf/m)       Total(tf)"
        COLOR COR_TEXTO
        CargaMostra i, 1, 6
        LOCATE 12, 3: PRINT "total de Carga Linear " + FormataNumero$(CargaTotal#(i, 1), 2, 8)
        COLOR COR_DESTAQUE
        LOCATE 13, 3: PRINT "Carga Area           Area(m2)         Carga(tf/m2)      Total(tf)"
        COLOR COR_TEXTO
        CargaMostra i, 2, 14
        LOCATE 20, 3: PRINT "total de Carga Area " + FormataNumero$(CargaTotal#(i, 2), 2, 8)
        LOCATE 22, 3: PRINT "<L>inear  <A>rea  <U>ltima carga  <F>im";
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        IF k = "L" THEN
            CargaInclui i, 1
        ELSEIF k = "A" THEN
            CargaInclui i, 2
        ELSEIF k = "U" THEN
            tp = UCASE$(CampoTexto$("Retira ultima carga (L/A):", "", 1))
            IF tp = "L" THEN CargaUltima i, 1
            IF tp = "A" THEN CargaUltima i, 2
        END IF
    LOOP UNTIL k = "F" OR k = CHR$(27)
    eq = LgCargaEquivalente#(Laj(i).lx, Laj(i).ly, CargaTotal#(i, 1), CargaTotal#(i, 2))
    Laj(i).g = Laj(i).g - CargaGAplicado(i) + eq
    CargaGAplicado(i) = eq
    Laj(i).temRes = 0
    LajAlterada = -1
END SUB

' Lista as cargas do tipo (1 linear, 2 area) da laje i a partir da linha lin.
' Mostra ate 5; a sexta linha vira "..." quando ha mais.
SUB CargaMostra (i AS INTEGER, tipo AS INTEGER, lin AS INTEGER)
    DIM k AS INTEGER, a AS DOUBLE, c AS DOUBLE
    FOR k = 1 TO CargaQtd(i, tipo)
        IF k > 5 THEN
            LOCATE lin + 5, 3: PRINT "...";
            EXIT FOR
        END IF
        a = CargaDado(i, tipo, k, 1)
        c = CargaDado(i, tipo, k, 2)
        LOCATE lin + k - 1, 3
        PRINT RIGHT$("   " + LTRIM$(STR$(k)), 3) + "  " + FormataNumero$(a, 2, 12) + FormataNumero$(c, 2, 12) + FormataNumero$(a * c, 2, 12);
    NEXT
END SUB

' Inclui uma carga do tipo na laje i. Linear: comprimento e carga tf/m; area: area e
' carga tf/m2. Recusa comprimento ou area nao positivos.
SUB CargaInclui (i AS INTEGER, tipo AS INTEGER)
    DIM a AS DOUBLE, c AS DOUBLE, k AS INTEGER
    IF CargaQtd(i, tipo) >= LimCargas THEN
        Espera "Numero maximo de cargas atingido: " + LTRIM$(STR$(LimCargas)), -1
        EXIT SUB
    END IF
    IF tipo = 1 THEN
        a = CampoNum#("Comprimento (m):", 0)
        c = CampoNum#("Carga (tf/m):", 0)
    ELSE
        a = CampoNum#("Area (m2):", 0)
        c = CampoNum#("Carga (tf/m2):", 0)
    END IF
    IF a <= 0 THEN
        Espera "Comprimento ou area deve ser maior que zero.", -1
        EXIT SUB
    END IF
    CargaQtd(i, tipo) = CargaQtd(i, tipo) + 1
    k = CargaQtd(i, tipo)
    CargaDado(i, tipo, k, 1) = a
    CargaDado(i, tipo, k, 2) = c
END SUB

' Retira a ultima carga do tipo (1 linear, 2 area) da laje i.
SUB CargaUltima (i AS INTEGER, tipo AS INTEGER)
    IF CargaQtd(i, tipo) > 0 THEN CargaQtd(i, tipo) = CargaQtd(i, tipo) - 1
END SUB

' Copia as cargas da laje src para dst (acompanha TabDeleta, que desloca Laj).
SUB CargaCopia (dst AS INTEGER, src AS INTEGER)
    DIM tipo AS INTEGER, k AS INTEGER, c AS INTEGER
    CargaGAplicado(dst) = CargaGAplicado(src)
    FOR tipo = 1 TO 2
        CargaQtd(dst, tipo) = CargaQtd(src, tipo)
        FOR k = 1 TO CARGA_MAX
            FOR c = 1 TO 2
                CargaDado(dst, tipo, k, c) = CargaDado(src, tipo, k, c)
            NEXT
        NEXT
    NEXT
END SUB

' Soma da laje i do tipo (tf): linear = comprimento x carga; area = area x carga.
FUNCTION CargaTotal# (i AS INTEGER, tipo AS INTEGER)
    DIM k AS INTEGER, t AS DOUBLE
    t = 0
    FOR k = 1 TO CargaQtd(i, tipo)
        t = t + CargaDado(i, tipo, k, 1) * CargaDado(i, tipo, k, 2)
    NEXT
    CargaTotal# = t
END FUNCTION

' Caminho do .LAJ da obra no diretorio de dados corrente.
FUNCTION ArqLajPath$ (obra AS STRING)
    ArqLajPath$ = DirDados + obra + ".LAJ"
END FUNCTION

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
