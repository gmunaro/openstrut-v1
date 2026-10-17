' ===============================================================
' FORMPLOT.BAS - desenho da planta de formas (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Le <obra>.FRM e FORMA.INI (pastas, folha, opcoes); pergunta opcoes,
' selecao e zoom (janela em m); grava <obra>_FORMA.VET e mostra a
' previa (VetMostra%). Setas movem a origem da folha em passos de mm.
' Gera <obra>_FORMA.PLT (HP-GL) e <obra>_FORMA.DXF conforme resposta.
' Corte opcional em y = c: <obra>_CORTE.VET.
' Fontes: docs/modules/FORMPLOT.md, dump de strings do FORMPLOT.EXE (fora do repositorio).
' Compilacao: tools/build.sh forma/FORMPLOT
' Sem $CONSOLE:ONLY: a previa usa SCREEN 12 (SISPLOT).
' Marcas RECONSTRUCAO: abaixo, onde o dump nao traz o dado.
' ===============================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST FORMA_INI_NOME = "FORMA.INI"
CONST PL_METROS_MM = 1000#
CONST PL_ESCALA_PADRAO = 50#
CONST PL_PASSO_PADRAO = 10#
' Indices de folha#(), na ordem das linhas de FORMA.INI.
CONST FL_LARG = 1
CONST FL_ALT = 2
CONST FL_MARG_ESQ = 3
CONST FL_MARG_OUT = 4
CONST FL_CAR_LARG = 5
CONST FL_CAR_ALT = 6
CONST FL_ESCALA = 7
CONST FL_ORIG_X = 8
CONST FL_ORIG_Y = 9
CONST FL_TXT_PIL = 10
CONST FL_TXT_VIG = 11
CONST FL_TXT_LAJ = 12
CONST FL_TXT_COTA = 13
CONST FL_TXT_ELEV = 14
CONST FL_TXT_EXTRA = 15
' Indices de opc%(): opcoes S/N de desenho (linhas 25 a 33 de FORMA.INI).
CONST OP_LAJ_NOME = 1
CONST OP_LAJ_ESP = 2
CONST OP_VIG_NOME = 3
CONST OP_VIG_SEC = 4
CONST OP_PIL_NOME = 5
CONST OP_PIL_SEC = 6
CONST OP_COTA = 7
CONST OP_CORTE = 8
CONST OP_ELEV_VAL = 9
' Indices de sel%(): grupos de elementos desenhados.
' RECONSTRUCAO: o dump nao traz esta tela; os grupos sao deste modulo.
CONST SE_LAJ = 1
CONST SE_VIG = 2
CONST SE_PIL = 3
CONST SE_COTA = 4
' Penas usadas no .VET (VetCor% aceita 1..15).
' RECONSTRUCAO: o dump cita camadas EST-*; VetParaDxf% grava "PENA<n>".
CONST PEN_LAJE = 1
CONST PEN_VIGA = 2
CONST PEN_PILAR = 3
CONST PEN_COTA = 4
CONST PEN_CARIMBO = 5

DIM SHARED obra$, dirDados$, dirLaj$, dirVig$, dirCol$, dirFrm$, dirPlt$, dirDxf$
DIM SHARED folha#(1 TO 15), folhaChave$(1 TO 15)
DIM SHARED opc%(1 TO 9), opcChave$(1 TO 9), opcTexto$(1 TO 9)
DIM SHARED sel%(1 TO 4)
DIM SHARED fatorMm#, offX#, offY#
DIM SHARED minX#, minY#, maxX#, maxY#
DIM SHARED janX1#, janX2#, janY1#, janY2#
DIM SHARED clipT0#, clipT1#

DECLARE SUB CarregaIni ()
DECLARE SUB CfgInicia ()
DECLARE SUB CfgItem (i%, chave$, valor#)
DECLARE SUB OpcItem (i%, chave$, texto$)
DECLARE SUB LeFolha ()
DECLARE SUB LeOpcoes ()
DECLARE SUB GravaFolhaIni ()
DECLARE FUNCTION IniDirDe$ (chave$)
DECLARE FUNCTION DirIni$ (chave$)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB Cabeca (titulo$)
DECLARE SUB Etapa (lin%, texto$)
DECLARE SUB FalhaProcessa (motivo$)
DECLARE SUB TelaFim ()
DECLARE FUNCTION PerguntaSN% (lin%, texto$, padrao$)
DECLARE FUNCTION SN$ (v%)
DECLARE FUNCTION Num$ (v#, casas%)
DECLARE SUB CampoCfg (lin%, i%, rotulo$)
DECLARE SUB TelaConfiguracao ()
DECLARE SUB PerguntaOpcoes ()
DECLARE SUB PerguntaSelecao ()
DECLARE SUB PerguntaZoom ()
DECLARE SUB CalculaLimites ()
DECLARE SUB Expande (x#, y#)
DECLARE FUNCTION MenorD# (a#, b#)
DECLARE FUNCTION MaiorD# (a#, b#)
DECLARE FUNCTION NaJanela% (x1#, y1#, x2#, y2#)
DECLARE FUNCTION LajeNaJanela% (i%)
DECLARE FUNCTION VigaNaJanela% (i%)
DECLARE FUNCTION MmX# (x#)
DECLARE FUNCTION MmY# (y#)
DECLARE FUNCTION AreaCabe% ()
DECLARE SUB TelaMontagem ()
DECLARE SUB Planeja ()
DECLARE SUB MoveOrigem (c$, passo#)
DECLARE SUB GravaVet (arq$)
DECLARE SUB GravaCorte (arq$, c#)
DECLARE SUB DesenhaLajes (f%)
DECLARE SUB DesenhaVigas (f%)
DECLARE SUB DesenhaPilares (f%)
DECLARE SUB DesenhaCotas (f%)
DECLARE SUB DesenhaCarimbo (f%)
DECLARE SUB RelataGeracao (lin%, n%, arq$)
DECLARE SUB RelataArquivo (lin%, arq$)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION RecortaT% (p#, q#)
DECLARE SUB FLinha (f%, x1#, y1#, x2#, y2#, pena%)
DECLARE SUB FRetangulo (f%, x1#, y1#, x2#, y2#, pena%)
DECLARE SUB FTexto (f%, x#, y#, altura#, angulo#, pena%, texto$)
DECLARE FUNCTION VetParaHpgl% (arqVet AS STRING, arqPlt AS STRING)
DECLARE FUNCTION VetParaDxf% (arqVet AS STRING, arqDxf AS STRING)
DECLARE FUNCTION VetMostra% (arqVet AS STRING)

' ---- programa principal ----
ComumDirExecDefine _CWD$
CarregaIni
obra$ = ObraAtual$(dirDados$)
Cabeca ""
IF obra$ = "" THEN
    FalhaProcessa "Obra corrente nao definida em SISTRUT.OBR"
ELSEIF FrmLe%(dirDados$ + obra$ + ".FRM") = 0 THEN
    FalhaProcessa DadErro
ELSEIF FrmLajQtd + FrmVigQtd + FrmPilQtd = 0 THEN
    ' RECONSTRUCAO: o aviso de forma vazia nao esta no dump.
    FalhaProcessa "Forma sem lajes, vigas ou pilares"
ELSE
    Planeja
END IF
TelaFim

' Preenche pasta de dados (obra e .FRM, como FORMEDCA), pastas, folha e opcoes a
' partir do FORMA.INI. Sem FORMA.INI, pastas ficam no diretorio do executavel e
' valem os padroes de CfgInicia; a pasta de dados fica na pasta de trabalho.
SUB CarregaIni
    CfgInicia
    dirDados$ = DirUtilizavel$("")
    dirLaj$ = ComumDirExec$: dirVig$ = ComumDirExec$
    dirCol$ = ComumDirExec$: dirFrm$ = ComumDirExec$
    dirPlt$ = ComumDirExec$: dirDxf$ = ComumDirExec$
    IF ArqLer%(ComumDirExec$ + FORMA_INI_NOME) < 0 THEN EXIT SUB
    dirDados$ = IniDirDados$
    dirLaj$ = DirIni$("ARQUIVOS DE LAJES")
    dirVig$ = DirIni$("ARQUIVOS DE VIGAS")
    dirCol$ = DirIni$("ARQUIVOS DE COLUNAS")
    dirFrm$ = DirIni$("ARQUIVOS DE FORMAS")
    dirPlt$ = DirIni$("ARQUIVOS DE PLOTAGEM")
    dirDxf$ = DirIni$("ARQUIVOS PADRAO CAD")
    LeFolha
    LeOpcoes
END SUB

' Define chave do FORMA.INI e padrao de cada valor de folha (linhas 9 a 24 do arquivo).
SUB CfgInicia
    CfgItem FL_LARG, "LARGURA DE CORTE DA FOLHA", 841#
    CfgItem FL_ALT, "ALTURA DE CORTE DA FOLHA", 594#
    CfgItem FL_MARG_ESQ, "MARGEM A ESQUERDA DA FOLHA", 25#
    CfgItem FL_MARG_OUT, "MARGEM NAS OUTRAS FACES", 10#
    CfgItem FL_CAR_LARG, "LARGURA DO CARIMBO", 175#
    CfgItem FL_CAR_ALT, "ALTURA DO CARIMBO", 287#
    CfgItem FL_ESCALA, "ESCALA DO DESENHO", PL_ESCALA_PADRAO
    CfgItem FL_ORIG_X, "X inicial DE PLOTAGEM", 0#
    CfgItem FL_ORIG_Y, "Y inicial DE PLOTAGEM", 0#
    CfgItem FL_TXT_PIL, "ALTURA DA LETRA USADA NO NOME DOS PILARES", 3#
    CfgItem FL_TXT_VIG, "ALTURA DA LETRA USADA NO NOME DAS VIGAS", 3#
    CfgItem FL_TXT_LAJ, "ALTURA DA LETRA USADA NO NOME DAS LAJES", 3#
    CfgItem FL_TXT_COTA, "ALTURA DA LETRA USADA NAS COTAS DE AMARRACAO", 2#
    CfgItem FL_TXT_ELEV, "ALTURA DA LETRA USADA NAS COTAS DE ELEVACAO / CORTES", 2#
    CfgItem FL_TXT_EXTRA, "ALTURA DA LETRA USADA NOS EXTRAS", 1.5#
    OpcItem OP_LAJ_NOME, "IMPRIMO NOME DAS LAJES", "Imprimo Nome das Lajes"
    OpcItem OP_LAJ_ESP, "IMPRIMO ESPESSURA DAS LAJES", "Imprimo Espessura das Lajes"
    OpcItem OP_VIG_NOME, "IMPRIMO NOME DAS VIGAS", "Imprimo Nome das Vigas"
    OpcItem OP_VIG_SEC, "IMPRIMO SECAO DAS VIGAS", "Imprimo Secao das Vigas"
    OpcItem OP_PIL_NOME, "IMPRIMO NOME DOS PILARES", "Imprimo Nome dos Pilares"
    OpcItem OP_PIL_SEC, "IMPRIMO SECAO DOS PILARES", "Imprimo Secao dos Pilares"
    OpcItem OP_COTA, "IMPRIMO VALORES/COTAS DE AMARRACAO", "Imprimo Cotas e Medidas"
    OpcItem OP_CORTE, "DESENHO TRACOS DE ELEVACAO", "Desenho Cortes e Elevacao das Vigas"
    OpcItem OP_ELEV_VAL, "IMPRIMO VALORES DAS COTAS DE ELEVACAO", "Imprimo valores de Elevacao das Vigas"
    sel%(SE_LAJ) = -1: sel%(SE_VIG) = -1: sel%(SE_PIL) = -1: sel%(SE_COTA) = -1
END SUB

' Guarda chave e padrao de um valor numerico de folha.
SUB CfgItem (i%, chave$, valor#)
    folhaChave$(i%) = chave$
    folha#(i%) = valor#
END SUB

' Guarda chave e texto de uma opcao S/N; padrao S.
SUB OpcItem (i%, chave$, texto$)
    opcChave$(i%) = chave$
    opcTexto$(i%) = texto$
    opc%(i%) = -1
END SUB

' Le os valores de folha do FORMA.INI; chave ausente mantem o padrao.
' RECONSTRUCAO: parametros de folha no FORMA.INI (o .FOP original e texto livre).
SUB LeFolha
    DIM i%, j%
    FOR i% = 1 TO 15
        j% = ArqAchaTexto%(folhaChave$(i%), 0)
        IF j% > 0 THEN folha#(i%) = VAL(IniValor$(j%))
    NEXT
    IF folha#(FL_ESCALA) <= 0# THEN folha#(FL_ESCALA) = PL_ESCALA_PADRAO
END SUB

' Le as opcoes S/N do FORMA.INI; so N desliga, ausente fica em S.
SUB LeOpcoes
    DIM i%, j%
    FOR i% = 1 TO 9
        j% = ArqAchaTexto%(opcChave$(i%), 0)
        IF j% > 0 THEN opc%(i%) = (UCASE$(IniValor$(j%)) <> "N")
    NEXT
END SUB

' Regrava os valores de folha no FORMA.INI, trocando so o valor de cada linha.
' Sem FORMA.INI nada e gravado.
' RECONSTRUCAO: o dump nao diz o que acontece quando o arquivo falta.
SUB GravaFolhaIni
    DIM i%, j%, arq$
    arq$ = ComumDirExec$ + FORMA_INI_NOME
    IF ArqLer%(arq$) < 0 THEN EXIT SUB
    FOR i% = 1 TO 15
        j% = ArqAchaTexto%(folhaChave$(i%), 0)
        IF j% > 0 THEN IniDefinir j%, LTRIM$(STR$(folha#(i%)))
    NEXT
    ArqGravar arq$
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

' Limpa a tela e escreve o titulo do modulo e o subtitulo da tela.
SUB Cabeca (titulo$)
    CLS
    COLOR COR_TEXTO
    Etapa 2, "Desenho e Plotagem de Formas"
    Etapa 3, titulo$
END SUB

' Escreve o texto na linha lin%, a partir da coluna 4.
SUB Etapa (lin%, texto$)
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT texto$
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
    LOCATE 12, 10: PRINT "Retorno ao Modulo Gerenciador"
    COLOR COR_TEXTO, 0
    SYSTEM
END SUB

' Pergunta S/N na linha lin%; Enter escolhe padrao$. Devolve -1 para S, 0 para N.
FUNCTION PerguntaSN% (lin%, texto$, padrao$)
    DIM k$
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT texto$;
    DO
        k$ = UCASE$(TeclaLer$)
        IF k$ = CHR$(13) THEN k$ = padrao$
    LOOP UNTIL k$ = "S" OR k$ = "N"
    PRINT k$
    PerguntaSN% = (k$ = "S")
END FUNCTION

' Texto S ou N para o padrao de uma opcao.
FUNCTION SN$ (v%)
    IF v% THEN SN$ = "S" ELSE SN$ = "N"
END FUNCTION

' Numero sem espacos, com casas decimais.
FUNCTION Num$ (v#, casas%)
    Num$ = LTRIM$(RTRIM$(FormataNumero$(v#, casas%, 0)))
END FUNCTION

' Linha de campo da configuracao: rotulo e valor editavel da folha#(i%).
SUB CampoCfg (lin%, i%, rotulo$)
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT rotulo$;
    folha#(i%) = EntradaNumero#(lin%, 4 + LEN(rotulo$), 8, folha#(i%))
END SUB

' Tela 3.4: folha, escala, origem e alturas de letra. Enter confirma e grava; ESC Enter volta sem gravar.
' RECONSTRUCAO: a ordem dos campos e os rotulos de origem X/Y sao deste modulo.
SUB TelaConfiguracao
    DIM antes#(1 TO 15), i%, k$
    FOR i% = 1 TO 15: antes#(i%) = folha#(i%): NEXT
    Cabeca "Configuracao do tamanho da folha de Plotagem e Escala"
    Etapa 5, "- Area de Plotagem e Bordas"
    CampoCfg 6, FL_LARG, "largura da folha (mm)  "
    CampoCfg 7, FL_ALT, "altura da folha (mm)  "
    CampoCfg 8, FL_MARG_ESQ, "margem esquerda (mm)  "
    CampoCfg 9, FL_MARG_OUT, "outras margens (mm)  "
    CampoCfg 10, FL_CAR_LARG, "largura do carimbo (mm)  "
    CampoCfg 11, FL_CAR_ALT, "altura do carimbo (mm)  "
    CampoCfg 12, FL_ESCALA, "escala do desenho 1/  "
    CampoCfg 13, FL_ORIG_X, "origem da folha X (mm)  "
    CampoCfg 14, FL_ORIG_Y, "origem da folha Y (mm)  "
    Etapa 16, "- Grandezas de Escrita   altura de letra (mm) para :"
    CampoCfg 17, FL_TXT_PIL, "coluna  "
    CampoCfg 18, FL_TXT_VIG, "vigas  "
    CampoCfg 19, FL_TXT_LAJ, "lajes  "
    CampoCfg 20, FL_TXT_COTA, "amarracao  "
    CampoCfg 21, FL_TXT_ELEV, "elevacao  "
    CampoCfg 22, FL_TXT_EXTRA, "extras  "
    Etapa 23, "Acione   <Enter> para manter   ou   <ESC> <Enter> para Retornar"
    k$ = TeclaLer$
    IF k$ = CHR$(27) THEN
        tecla$ = TeclaLer$
        FOR i% = 1 TO 15: folha#(i%) = antes#(i%): NEXT
    ELSE
        IF folha#(FL_ESCALA) <= 0# THEN folha#(FL_ESCALA) = PL_ESCALA_PADRAO
        GravaFolhaIni
    END IF
END SUB

' Tela de opcoes S/N de desenho (nove itens de FORMA.INI).
SUB PerguntaOpcoes
    DIM i%
    Cabeca "Opcoes de desenho"
    FOR i% = 1 TO 9
        opc%(i%) = PerguntaSN%(4 + i%, opcTexto$(i%) + "  S/N  ", SN$(opc%(i%)))
    NEXT
END SUB

' Selecao dos grupos de elementos a desenhar.
' RECONSTRUCAO: o dump nao traz perguntas por grupo; o <S>eleciona do menu e o unico indicio.
SUB PerguntaSelecao
    Cabeca "Seleciona Campo de Plotagem"
    sel%(SE_LAJ) = PerguntaSN%(5, "Seleciono Lajes  S/N  ", SN$(sel%(SE_LAJ)))
    sel%(SE_VIG) = PerguntaSN%(6, "Seleciono Vigas  S/N  ", SN$(sel%(SE_VIG)))
    sel%(SE_PIL) = PerguntaSN%(7, "Seleciono Pilares  S/N  ", SN$(sel%(SE_PIL)))
    sel%(SE_COTA) = PerguntaSN%(8, "Seleciono Cotas  S/N  ", SN$(sel%(SE_COTA)))
END SUB

' Janela de desenho em m (xmin..xmax, ymin..ymax). Padrao: forma inteira.
' <D>efine informa a janela; <T>odo o campo volta ao total; <R>etorna (Enter) mantem a atual.
' RECONSTRUCAO: os rotulos Xmin, Xmax, Ymin, Ymax sao deste modulo; o dump so traz Xmax e Ymax.
SUB PerguntaZoom
    DIM k$
    Cabeca "ZOOM"
    LOCATE 4, 4: COLOR COR_TEXTO
    PRINT "<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";
    k$ = UCASE$(TeclaLer$)
    IF k$ = "T" THEN CalculaLimites
    IF k$ = "D" THEN
        Etapa 7, "Xmin (m)"
        janX1# = EntradaNumero#(7, 16, 12, janX1#)
        Etapa 8, "Xmax (m)"
        janX2# = EntradaNumero#(8, 16, 12, janX2#)
        Etapa 9, "Ymin (m)"
        janY1# = EntradaNumero#(9, 16, 12, janY1#)
        Etapa 10, "Ymax (m)"
        janY2# = EntradaNumero#(10, 16, 12, janY2#)
        IF janX2# <= janX1# OR janY2# <= janY1# THEN
            CalculaLimites
            Etapa 12, "Campo invalido; uso o total da forma"
            tecla$ = TeclaLer$
        END IF
    END IF
END SUB

' Limites da forma (m), com a borda das vigas e pilares; a janela padrao e o total.
SUB CalculaLimites
    DIM i%, dw#, dpx#, dpy#
    minX# = 1E+30: minY# = 1E+30: maxX# = -1E+30: maxY# = -1E+30
    FOR i% = 1 TO FrmLajQtd
        Expande FrmLaj(i%).x0, FrmLaj(i%).y0
        Expande FrmLaj(i%).x0 + FrmLaj(i%).lx, FrmLaj(i%).y0 + FrmLaj(i%).ly
    NEXT
    FOR i% = 1 TO FrmVigQtd
        dw# = FrmVig(i%).bw / 200#
        Expande MenorD#(FrmVig(i%).x1, FrmVig(i%).x2) - dw#, MenorD#(FrmVig(i%).y1, FrmVig(i%).y2) - dw#
        Expande MaiorD#(FrmVig(i%).x1, FrmVig(i%).x2) + dw#, MaiorD#(FrmVig(i%).y1, FrmVig(i%).y2) + dw#
    NEXT
    FOR i% = 1 TO FrmPilQtd
        dpx# = FrmPil(i%).bx / 200#: dpy# = FrmPil(i%).by / 200#
        Expande FrmPil(i%).x - dpx#, FrmPil(i%).y - dpy#
        Expande FrmPil(i%).x + dpx#, FrmPil(i%).y + dpy#
    NEXT
    janX1# = minX#: janX2# = maxX#: janY1# = minY#: janY2# = maxY#
END SUB

' Guarda os extremos (m) vistos ate aqui.
SUB Expande (x#, y#)
    IF x# < minX# THEN minX# = x#
    IF x# > maxX# THEN maxX# = x#
    IF y# < minY# THEN minY# = y#
    IF y# > maxY# THEN maxY# = y#
END SUB

' Menor e maior de dois valores.
FUNCTION MenorD# (a#, b#)
    IF a# < b# THEN MenorD# = a# ELSE MenorD# = b#
END FUNCTION

FUNCTION MaiorD# (a#, b#)
    IF a# > b# THEN MaiorD# = a# ELSE MaiorD# = b#
END FUNCTION

' Verdadeiro se o retangulo (m) cruza a janela de desenho.
FUNCTION NaJanela% (x1#, y1#, x2#, y2#)
    NaJanela% = (x2# >= janX1#) AND (x1# <= janX2#) AND (y2# >= janY1#) AND (y1# <= janY2#)
END FUNCTION

' Laje i% cruza a janela.
FUNCTION LajeNaJanela% (i%)
    LajeNaJanela% = NaJanela%(FrmLaj(i%).x0, FrmLaj(i%).y0, FrmLaj(i%).x0 + FrmLaj(i%).lx, FrmLaj(i%).y0 + FrmLaj(i%).ly)
END FUNCTION

' Viga i% (com a largura bw) cruza a janela.
FUNCTION VigaNaJanela% (i%)
    DIM dw#
    dw# = FrmVig(i%).bw / 200#
    VigaNaJanela% = NaJanela%(MenorD#(FrmVig(i%).x1, FrmVig(i%).x2) - dw#, MenorD#(FrmVig(i%).y1, FrmVig(i%).y2) - dw#, MaiorD#(FrmVig(i%).x1, FrmVig(i%).x2) + dw#, MaiorD#(FrmVig(i%).y1, FrmVig(i%).y2) + dw#)
END FUNCTION

' Coordenada x da forma (m) -> mm na folha, a partir da margem esquerda e da origem X.
FUNCTION MmX# (x#)
    MmX# = (x# - janX1#) * fatorMm# + folha#(FL_MARG_ESQ) + offX#
END FUNCTION

' Coordenada y da forma (m) -> mm na folha, a partir da margem inferior e da origem Y.
FUNCTION MmY# (y#)
    MmY# = (y# - janY1#) * fatorMm# + folha#(FL_MARG_OUT) + offY#
END FUNCTION

' Area util da folha em mm: dentro das margens (esquerda e demais faces).
' RECONSTRUCAO: o desenho e recortado nessa area. Sem o recorte, a parte da forma fora
' da janela de zoom saia na margem (x < MARGEM ESQ).
' RecortaT% (Liang-Barsky): restringe [clipT0#, clipT1#] a p*t <= q; falso se nada sobra.
FUNCTION RecortaT% (p#, q#)
    DIM r#
    IF p# = 0# THEN
        RecortaT% = (q# >= 0#)
    ELSE
        r# = q# / p#
        IF p# < 0# THEN
            IF r# > clipT1# THEN RecortaT% = 0: EXIT FUNCTION
            IF r# > clipT0# THEN clipT0# = r#
        ELSE
            IF r# < clipT0# THEN RecortaT% = 0: EXIT FUNCTION
            IF r# < clipT1# THEN clipT1# = r#
        END IF
        RecortaT% = -1
    END IF
END FUNCTION

' Linha em mm, cortada na area util; so grava o trecho que sobra.
SUB FLinha (f%, x1#, y1#, x2#, y2#, pena%)
    DIM dx#, dy#, ok%
    dx# = x2# - x1#: dy# = y2# - y1#
    clipT0# = 0#: clipT1# = 1#
    ok% = RecortaT%(-dx#, x1# - folha#(FL_MARG_ESQ))
    ok% = ok% AND RecortaT%(dx#, folha#(FL_LARG) - folha#(FL_MARG_OUT) - x1#)
    ok% = ok% AND RecortaT%(-dy#, y1# - folha#(FL_MARG_OUT))
    ok% = ok% AND RecortaT%(dy#, folha#(FL_ALT) - folha#(FL_MARG_OUT) - y1#)
    IF ok% AND clipT0# <= clipT1# THEN
        VetLinha f%, x1# + clipT0# * dx#, y1# + clipT0# * dy#, x1# + clipT1# * dx#, y1# + clipT1# * dy#, pena%
    END IF
END SUB

' Retangulo em mm: quatro FLinha, na mesma ordem de VetRetangulo.
SUB FRetangulo (f%, x1#, y1#, x2#, y2#, pena%)
    FLinha f%, x1#, y1#, x2#, y1#, pena%
    FLinha f%, x2#, y1#, x2#, y2#, pena%
    FLinha f%, x2#, y2#, x1#, y2#, pena%
    FLinha f%, x1#, y2#, x1#, y1#, pena%
END SUB

' Texto em mm: so grava se a ancora cai na area util.
SUB FTexto (f%, x#, y#, altura#, angulo#, pena%, texto$)
    IF x# >= folha#(FL_MARG_ESQ) AND x# <= folha#(FL_LARG) - folha#(FL_MARG_OUT) AND y# >= folha#(FL_MARG_OUT) AND y# <= folha#(FL_ALT) - folha#(FL_MARG_OUT) THEN
        VetTexto f%, x#, y#, altura#, angulo#, pena%, texto$
    END IF
END SUB

' Verdadeiro se a janela, em mm no papel, cabe na area util da folha.
' RECONSTRUCAO: a area util desconta so as margens; o carimbo nao e descontado.
FUNCTION AreaCabe%
    DIM w#, h#
    w# = (janX2# - janX1#) * fatorMm#
    h# = (janY2# - janY1#) * fatorMm#
    AreaCabe% = (w# <= folha#(FL_LARG) - folha#(FL_MARG_ESQ) - folha#(FL_MARG_OUT)) AND (h# <= folha#(FL_ALT) - 2# * folha#(FL_MARG_OUT))
END FUNCTION

' Tela 3.3: area ocupada pelo desenho e, se nao couber, o aviso.
SUB TelaMontagem
    Cabeca "Montagem de Folha para Plotagem"
    Etapa 5, "AREA OCUPADA PELO DESENHO " + Num$((janX2# - janX1#) * fatorMm#, 0) + " x " + Num$((janY2# - janY1#) * fatorMm#, 0) + " mm "
    IF NOT AreaCabe% THEN Etapa 7, "DESENHO NA ESCALA ESCOLHIDA E MAIOR QUE A AREA UTIL DA FOLHA"
END SUB

' Fluxo da forma: configuracao, opcoes, selecao, zoom, montagem, movimento e saidas.
' Em movimento, A abandona sem gravar a plotagem; C volta a origem original.
SUB Planeja
    DIM pronto%, abandona%, passo#, k$, cy#, vet$
    vet$ = dirFrm$ + obra$ + "_FORMA.VET"
    CalculaLimites
    IF PerguntaSN%(5, "Deseja Alterar as parametrizacoes  S/*N* ", "N") THEN TelaConfiguracao
    PerguntaOpcoes
    PerguntaSelecao
    PerguntaZoom
    DO
        fatorMm# = PL_METROS_MM / folha#(FL_ESCALA)
        TelaMontagem
        IF AreaCabe% THEN
            pronto% = PerguntaSN%(11, "Sigo com a Configuracao para Plotagem  N/*S* ", "S")
        ELSE
            pronto% = PerguntaSN%(11, "Altere a escala ou o tamanho da Folha.  Sigo mesmo assim  SIM/*N* ", "N")
        END IF
        IF pronto% = 0 THEN TelaConfiguracao
    LOOP UNTIL pronto%

    offX# = folha#(FL_ORIG_X): offY# = folha#(FL_ORIG_Y)
    passo# = PL_PASSO_PADRAO
    abandona% = 0
    DO
        GravaVet vet$
        IF VetMostra%(vet$) < 0 THEN Etapa 22, "Arquivo VET invalido"
        SCREEN 0
        CLS
        COLOR COR_TEXTO
        Etapa 22, "movimenta    <S>egue com a Plotagem    <A>bandona    <C>ancela    <P>asso"
        k$ = UCASE$(TeclaLer$)
        IF LEFT$(k$, 1) = CHR$(0) THEN
            MoveOrigem MID$(k$, 2, 1), passo#
        ELSEIF k$ = "P" THEN
            LOCATE 23, 4: PRINT "Passo de Movimento  mm ";
            passo# = EntradaNumero#(23, 30, 8, passo#)
            IF passo# <= 0# THEN passo# = PL_PASSO_PADRAO
        ELSEIF k$ = "C" THEN
            offX# = folha#(FL_ORIG_X): offY# = folha#(FL_ORIG_Y)
        ELSEIF k$ = "A" THEN
            abandona% = -1
        END IF
    LOOP UNTIL k$ = "S" OR abandona%
    IF abandona% THEN EXIT SUB

    Cabeca "Geracao de arquivo de Plotagem (.PLT)"
    RelataArquivo 5, vet$
    IF opc%(OP_CORTE) THEN
        LOCATE 8, 4: PRINT "Corte em y = (m) ";
        cy# = EntradaNumero#(8, 22, 12, (janY1# + janY2#) / 2#)
        GravaCorte dirFrm$ + obra$ + "_CORTE.VET", cy#
        RelataArquivo 9, dirFrm$ + obra$ + "_CORTE.VET"
    END IF
    IF PerguntaSN%(11, "Sigo com a Plotagem  S/N  ", "S") THEN
        RelataGeracao 12, VetParaHpgl%(vet$, dirPlt$ + obra$ + "_FORMA.PLT"), dirPlt$ + obra$ + "_FORMA.PLT"
    END IF
    ' RECONSTRUCAO: o dump so traz ".DXF N/*S*"; o texto da pergunta e este.
    IF PerguntaSN%(13, ".DXF  S/N  ", "S") THEN
        RelataGeracao 14, VetParaDxf%(vet$, dirDxf$ + obra$ + "_FORMA.DXF"), dirDxf$ + obra$ + "_FORMA.DXF"
    END IF
END SUB

' Move a origem da folha um passo (mm): H sobe, P desce, K esquerda, M direita (codigos de seta).
SUB MoveOrigem (c$, passo#)
    IF c$ = "H" THEN offY# = offY# + passo#
    IF c$ = "P" THEN offY# = offY# - passo#
    IF c$ = "K" THEN offX# = offX# - passo#
    IF c$ = "M" THEN offX# = offX# + passo#
END SUB

' Grava o .VET completo da forma (lajes, vigas, pilares, cotas, carimbo) conforme selecao.
SUB GravaVet (arq$)
    DIM f%
    f% = VetAbre%(arq$, "Plotagem da Forma " + obra$)
    IF sel%(SE_LAJ) THEN DesenhaLajes f%
    IF sel%(SE_VIG) THEN DesenhaVigas f%
    IF sel%(SE_PIL) THEN DesenhaPilares f%
    IF sel%(SE_COTA) AND opc%(OP_COTA) THEN DesenhaCotas f%
    DesenhaCarimbo f%
    VetFecha f%
END SUB

' Corte em y = c (m): cada laje que cruza y = c vira uma faixa de espessura h;
' cada viga cortada vira uma secao bw x h, e a viga paralela ao corte vira faixa de elevacao.
' RECONSTRUCAO: a posicao vertical (lajes acima da linha de base, vigas abaixo) e convencao deste modulo.
SUB GravaCorte (arq$, c#)
    DIM f%, i%, baseY#, x1#, x2#, y1#, y2#, xi#, half#, zl#, zv#, t#, tv#
    f% = VetAbre%(arq$, "Corte da Forma " + obra$ + " em y = " + Num$(c#, 2))
    baseY# = folha#(FL_ALT) / 2# + offY#
    t# = folha#(FL_TXT_ELEV)
    IF sel%(SE_LAJ) THEN
        FOR i% = 1 TO FrmLajQtd
            x1# = FrmLaj(i%).x0: y1# = FrmLaj(i%).y0
            x2# = x1# + FrmLaj(i%).lx: y2# = y1# + FrmLaj(i%).ly
            IF c# >= y1# AND c# <= y2# AND LajeNaJanela%(i%) THEN
                zl# = FrmLaj(i%).h / 100# * fatorMm#
                FRetangulo f%, MmX#(x1#), baseY#, MmX#(x2#), baseY# + zl#, PEN_LAJE
                IF opc%(OP_LAJ_ESP) THEN FTexto f%, MmX#((x1# + x2#) / 2#), baseY# + zl# + t#, t#, 0#, PEN_LAJE, "h=" + Num$(FrmLaj(i%).h, 0) + "cm"
            END IF
        NEXT
    END IF
    IF sel%(SE_VIG) THEN
        FOR i% = 1 TO FrmVigQtd
            IF VigaNaJanela%(i%) THEN
                x1# = FrmVig(i%).x1: y1# = FrmVig(i%).y1
                x2# = FrmVig(i%).x2: y2# = FrmVig(i%).y2
                half# = FrmVig(i%).bw / 200#
                zv# = FrmVig(i%).h / 100# * fatorMm#
                IF y1# <> y2# AND c# >= MenorD#(y1#, y2#) AND c# <= MaiorD#(y1#, y2#) THEN
                    xi# = x1# + (c# - y1#) * (x2# - x1#) / (y2# - y1#)
                    FRetangulo f%, MmX#(xi# - half#), baseY# - zv#, MmX#(xi# + half#), baseY#, PEN_VIGA
                    IF opc%(OP_ELEV_VAL) THEN FTexto f%, MmX#(xi#), baseY# - zv# - t#, t#, 0#, PEN_VIGA, Num$(FrmVig(i%).bw, 0) + " x " + Num$(FrmVig(i%).h, 0)
                ELSEIF y1# = y2# AND ABS(y1# - c#) <= half# THEN
                    FRetangulo f%, MmX#(MenorD#(x1#, x2#)), baseY# - zv#, MmX#(MaiorD#(x1#, x2#)), baseY#, PEN_VIGA
                END IF
            END IF
        NEXT
    END IF
    VetFecha f%
END SUB

' Retangulo de cada laje visivel na janela; nome, espessura e o texto de cota ficam no centro.
SUB DesenhaLajes (f%)
    DIM i%, x1#, y1#, x2#, y2#, xc#, yc#, t#
    t# = folha#(FL_TXT_LAJ)
    FOR i% = 1 TO FrmLajQtd
        IF LajeNaJanela%(i%) THEN
            x1# = FrmLaj(i%).x0: y1# = FrmLaj(i%).y0
            x2# = x1# + FrmLaj(i%).lx: y2# = y1# + FrmLaj(i%).ly
            FRetangulo f%, MmX#(x1#), MmY#(y1#), MmX#(x2#), MmY#(y2#), PEN_LAJE
            xc# = MmX#((x1# + x2#) / 2#): yc# = MmY#((y1# + y2#) / 2#)
            IF opc%(OP_LAJ_NOME) THEN FTexto f%, xc#, yc# + 2# * t#, t#, 0#, PEN_LAJE, RTRIM$(FrmLaj(i%).nome)
            IF opc%(OP_LAJ_ESP) THEN FTexto f%, xc#, yc#, t#, 0#, PEN_LAJE, "h=" + Num$(FrmLaj(i%).h, 0) + "cm"
        END IF
    NEXT
END SUB

' Viga como faixa de largura bw (cm) sobre o eixo (x1,y1)-(x2,y2): 4 linhas, nome e secao no meio.
SUB DesenhaVigas (f%)
    DIM i%, dx#, dy#, comp#, hm#, ox#, oy#, ax1#, ay1#, ax2#, ay2#, xm#, ym#, t#
    t# = folha#(FL_TXT_VIG)
    FOR i% = 1 TO FrmVigQtd
        IF VigaNaJanela%(i%) THEN
            dx# = FrmVig(i%).x2 - FrmVig(i%).x1
            dy# = FrmVig(i%).y2 - FrmVig(i%).y1
            comp# = SQR(dx# * dx# + dy# * dy#)
            IF comp# > 0# THEN
                hm# = FrmVig(i%).bw / 200# * fatorMm#
                ox# = -dy# / comp# * hm#
                oy# = dx# / comp# * hm#
                ax1# = MmX#(FrmVig(i%).x1): ay1# = MmY#(FrmVig(i%).y1)
                ax2# = MmX#(FrmVig(i%).x2): ay2# = MmY#(FrmVig(i%).y2)
                FLinha f%, ax1# + ox#, ay1# + oy#, ax2# + ox#, ay2# + oy#, PEN_VIGA
                FLinha f%, ax1# - ox#, ay1# - oy#, ax2# - ox#, ay2# - oy#, PEN_VIGA
                FLinha f%, ax1# + ox#, ay1# + oy#, ax1# - ox#, ay1# - oy#, PEN_VIGA
                FLinha f%, ax2# + ox#, ay2# + oy#, ax2# - ox#, ay2# - oy#, PEN_VIGA
                xm# = (ax1# + ax2#) / 2#: ym# = (ay1# + ay2#) / 2#
                IF opc%(OP_VIG_NOME) THEN FTexto f%, xm#, ym# + t#, t#, 0#, PEN_VIGA, RTRIM$(FrmVig(i%).nome)
                IF opc%(OP_VIG_SEC) THEN FTexto f%, xm#, ym# - t#, t#, 0#, PEN_VIGA, Num$(FrmVig(i%).bw, 0) + " x " + Num$(FrmVig(i%).h, 0)
            END IF
        END IF
    NEXT
END SUB

' Pilar como retangulo centrado em (x,y), lados bx e by (cm), com nome e secao.
SUB DesenhaPilares (f%)
    DIM i%, dpx#, dpy#, xc#, yc#, t#
    t# = folha#(FL_TXT_PIL)
    FOR i% = 1 TO FrmPilQtd
        dpx# = FrmPil(i%).bx / 200#: dpy# = FrmPil(i%).by / 200#
        IF NaJanela%(FrmPil(i%).x - dpx#, FrmPil(i%).y - dpy#, FrmPil(i%).x + dpx#, FrmPil(i%).y + dpy#) THEN
            FRetangulo f%, MmX#(FrmPil(i%).x - dpx#), MmY#(FrmPil(i%).y - dpy#), MmX#(FrmPil(i%).x + dpx#), MmY#(FrmPil(i%).y + dpy#), PEN_PILAR
            xc# = MmX#(FrmPil(i%).x): yc# = MmY#(FrmPil(i%).y)
            IF opc%(OP_PIL_NOME) THEN FTexto f%, xc#, yc# + t#, t#, 0#, PEN_PILAR, RTRIM$(FrmPil(i%).nome)
            IF opc%(OP_PIL_SEC) THEN FTexto f%, xc#, yc# - t#, t#, 0#, PEN_PILAR, Num$(FrmPil(i%).bx, 0) + " x " + Num$(FrmPil(i%).by, 0)
        END IF
    NEXT
END SUB

' Cota de cada laje (lx x ly em m), abaixo do centro.
' RECONSTRUCAO: sem cotas de vigas e pilares; o dump nao traz o layout das linhas de cota.
SUB DesenhaCotas (f%)
    DIM i%, xc#, yc#, t#
    t# = folha#(FL_TXT_COTA)
    FOR i% = 1 TO FrmLajQtd
        IF LajeNaJanela%(i%) THEN
            xc# = MmX#(FrmLaj(i%).x0 + FrmLaj(i%).lx / 2#)
            yc# = MmY#(FrmLaj(i%).y0 + FrmLaj(i%).ly / 2#)
            FTexto f%, xc#, yc# - 2# * t#, t#, 0#, PEN_COTA, Num$(FrmLaj(i%).lx, 2) + " x " + Num$(FrmLaj(i%).ly, 2)
        END IF
    NEXT
END SUB

' Carimbo no canto inferior direito: "OBRA - <obra>" e escala.
' Posicao do carimbo e altura do texto (extras) vem de FORMA.INI; textos e deslocamentos (5, 10, 20 mm) sao deste modulo.
SUB DesenhaCarimbo (f%)
    DIM x1#, y1#, x2#, y2#, t#
    t# = folha#(FL_TXT_EXTRA)
    x2# = folha#(FL_LARG) - folha#(FL_MARG_OUT)
    x1# = x2# - folha#(FL_CAR_LARG)
    y1# = folha#(FL_MARG_OUT)
    y2# = y1# + folha#(FL_CAR_ALT)
    VetRetangulo f%, x1#, y1#, x2#, y2#, PEN_CARIMBO
    VetTexto f%, x1# + 5#, y2# - 10#, t#, 0#, PEN_CARIMBO, "OBRA - " + obra$
    VetTexto f%, x1# + 5#, y2# - 20#, t#, 0#, PEN_CARIMBO, "ESCALA 1/" + Num$(folha#(FL_ESCALA), 0)
END SUB

' Mostra o resultado de VetParaHpgl% / VetParaDxf% na linha lin%.
' RECONSTRUCAO: caminho que nao cabe em 76 colunas quebra para a linha do prompt seguinte
' (sobrepondo ".DXF S/N"); nesse caso mostra so o nome do arquivo.
SUB RelataGeracao (lin%, n%, arq$)
    IF n% < 0 THEN
        Etapa lin%, "Falha na geracao de " + arq$
    ELSE
        RelataArquivo lin%, arq$
    END IF
END SUB

' Mostra "Arquivo gravado" na linha lin%; caminho que nao cabe em 76 colunas vira so o nome do arquivo.
SUB RelataArquivo (lin%, arq$)
    DIM i%, nome$
    IF LEN("Arquivo gravado em " + arq$) <= 76 THEN
        Etapa lin%, "Arquivo gravado em " + arq$
    ELSE
        nome$ = arq$
        FOR i% = LEN(arq$) TO 1 STEP -1
            IF MID$(arq$, i%, 1) = CHR$(92) THEN nome$ = MID$(arq$, i% + 1): EXIT FOR
        NEXT
        Etapa lin%, "Arquivo gravado: " + nome$
    END IF
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
