' ============================================================================
'  PILGEEDI.BAS - definicao dos niveis, colunas e cargas dos pilares (3.x).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de PILGEEDI.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/PILGEEDI.md.
'
'  Itens com tela: 1 niveis, 2 arquivar coluna, 3 esforcos externos, 4 vento/momentos,
'  5 leitura .REP/.RLP, 6 travamentos horizontais, 7 impressao.
'  Soma por pavimento, peso proprio e acumulo: PILGECAL.BM.
'  Verificacao de licenca do original nao reimplementada.
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Textos de tela que nao estao na spec sao do fonte, nao do EXE.
'  Compilacao: bash tools/build.sh pilar/PILGEEDI
' ============================================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Rotinas de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE FUNCTION CPilLe% (arq AS STRING, tipo AS STRING)
DECLARE FUNCTION ColIdx% (c AS INTEGER, k AS INTEGER)
DECLARE FUNCTION ColLe% (arq AS STRING)
DECLARE SUB ColGrava (arq AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
' Rotinas de PILGECAL.BM (o .BM nao traz DECLARE)
DECLARE FUNCTION PgColuna% (nome AS STRING)
DECLARE SUB PgSomaPavimento (k AS INTEGER, msg AS STRING)
DECLARE SUB PgAcumula

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB ColCarrega ()
DECLARE SUB ColSalva ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB LimpaLinha (lin AS INTEGER)
DECLARE FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
DECLARE SUB ItemNivel ()
DECLARE SUB ItemArquivarColuna ()
DECLARE SUB ItemLeituraCarga ()
DECLARE FUNCTION CarregaNivelCarga$ (k AS INTEGER, nomeArq AS STRING)
DECLARE SUB ItemImpressao ()
DECLARE SUB ImprimeRelatorio (arq AS STRING, geo AS INTEGER)
DECLARE SUB ItemEsforcoExterno ()
DECLARE SUB EsforcoExternoColuna (c AS INTEGER)
DECLARE SUB ItemVentoExterno ()
DECLARE SUB VentoNivel (k AS INTEGER)
DECLARE SUB ItemTravamento ()
DECLARE SUB TravamentoColuna (c AS INTEGER)
DECLARE FUNCTION TravFator# (cod AS INTEGER)
DECLARE SUB OfereceGravar ()
DECLARE FUNCTION DirComBarra$ (d AS STRING)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED ColAlterada AS INTEGER   ' -1 se ha alteracao ainda nao gravada

CONST NIV_TELA = 15                 ' niveis visiveis numa tela (linhas 8 a 22)

CarregaConfiguracao
ColCarrega
MenuPrincipal
CLS
LOCATE 12, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le o diretorio de dados do INI e define a obra corrente.
' Sem obra corrente, pergunta o nome e grava com ObraDefine.
' Configuracao no PILAR.INI, como os demais modulos da familia PILAR.
SUB CarregaConfiguracao
    DIM d AS STRING
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    IF ArqLer%(ComumDirExec$ + "PILAR.INI") >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    ColObra = ObraAtual$(DirDados)
    IF ColObra = "" THEN
        CLS
        TelaCabecalho ""
        LOCATE 6, 3: PRINT "Nome da Obra ";
        ColObra = EntradaTexto$(6, 27, 30, "")
        IF ColObra = "" THEN ColObra = "sem nome"
        ObraDefine DirDados, ColObra
    END IF
END SUB

' Carrega <obra>.COL se existir. Sem arquivo, comeca sem niveis nem colunas.
SUB ColCarrega
    ColNivQtd = 0: ColQtd = 0
    IF _FILEEXISTS(DirDados + ColObra + ".COL") THEN
        IF ColLe%(DirDados + ColObra + ".COL") = 0 THEN Espera DadErro, -1
    END IF
    ColAlterada = 0
END SUB

' Grava <obra>.COL com niveis, colunas e esforcos em memoria.
SUB ColSalva
    ColGrava DirDados + ColObra + ".COL"
    ColAlterada = 0
END SUB

' Menu 1 a 7 e R (spec 3.1). R grava o .COL se houver alteracao e sai.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        LOCATE 7, 10: PRINT "1  -  ";
        TelaItemMenu 7, 16, "Niveis de referencia"
        LOCATE 8, 10: PRINT "2  -  ";
        TelaItemMenu 8, 16, "Arquivar Coluna"
        LOCATE 9, 10: PRINT "3  -  ";
        TelaItemMenu 9, 16, "Esforcos externos"
        LOCATE 10, 10: PRINT "4  -  ";
        TelaItemMenu 10, 16, "Vento / Momentos externos"
        LOCATE 11, 10: PRINT "5  -  ";
        TelaItemMenu 11, 16, "Leitura da Carga e Geometria (.REP .RLP)"
        LOCATE 12, 10: PRINT "6  -  ";
        TelaItemMenu 12, 16, "Travamentos horizontais"
        LOCATE 13, 10: PRINT "7  -  ";
        TelaItemMenu 13, 16, "Impressao dos dados"
        LOCATE 14, 10: PRINT "R  -  ";
        TelaItemMenu 14, 16, "Retorno ao Menu Principal"
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": ItemNivel
            CASE "2": ItemArquivarColuna
            CASE "3": ItemEsforcoExterno
            CASE "4": ItemVentoExterno
            CASE "5": ItemLeituraCarga
            CASE "6": ItemTravamento
            CASE "7": ItemImpressao
        END SELECT
    LOOP UNTIL k = "R"
    IF ColAlterada THEN ColSalva
END SUB

' Cabecalho: titulo (linha 1), obra (linha 2), pasta (linha 3) e subtitulo (linha 4, se nao vazio).
' Linhas 2 a 4 sao limpas antes: sem isso, restos de um caminho longo ficam na tela.
' RECONSTRUCAO: pasta em linha propria, encurtada para caber em 80 colunas (mantem o final).
SUB TelaCabecalho (subtit AS STRING)
    DIM dir AS STRING
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "PILGEEDI - Niveis, Colunas e Cargas dos Pilares"
    LimpaLinha 2
    LimpaLinha 3
    LimpaLinha 4
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "Obra - "; ColObra
    dir = DirDados
    IF LEN(dir) > 66 THEN dir = "..." + RIGHT$(dir, 63)
    LOCATE 3, 3: PRINT "Dados em "; dir
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

' Pergunta S/N na linha lin. Enter devolve padrao; N ou ESC devolve 0.
FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    LimpaLinha lin
    LOCATE lin, 3: PRINT texto;
    DO
        k = UCASE$(TeclaLer$)
        IF k = "S" THEN
            Pergunta% = -1
            EXIT FUNCTION
        END IF
        IF k = "N" OR k = CHR$(27) THEN
            Pergunta% = 0
            EXIT FUNCTION
        END IF
        IF k = CHR$(13) THEN
            Pergunta% = padrao
            EXIT FUNCTION
        END IF
    LOOP
END FUNCTION

' Item 1: numero de niveis (1 = mais alto) e, para cada um, nome, cota e pe-direito (m).
' RECONSTRUCAO: codes de edicao da spec (A, R, C, I, S, D) nao reconstruidos.
' Numero de niveis so muda enquanto nao ha colunas arquivadas (indices de ColEsf).
SUB ItemNivel
    DIM n AS INTEGER, i AS INTEGER, lin AS INTEGER, dflt AS INTEGER
    dflt = ColNivQtd
    IF dflt = 0 THEN dflt = 1
    CLS
    TelaCabecalho "Definicao dos Niveis das Colunas"
    LOCATE 6, 3: PRINT "Numero maximo de Niveis - ";
    n = INT(EntradaNumero#(6, 27, 3, dflt))
    IF n < 1 OR n > NIV_TELA THEN
        Espera "Numero de niveis fora do intervalo 1 a " + LTRIM$(STR$(NIV_TELA)), -1
        EXIT SUB
    END IF
    IF ColQtd > 0 AND n <> ColNivQtd THEN
        Espera "Ha colunas arquivadas; o numero de niveis nao pode mudar", -1
        EXIT SUB
    END IF
    LOCATE 7, 3: PRINT "Nivel  nome          cota (m)   pe-direito (m)";
    FOR i = 1 TO n
        lin = 7 + i
        LOCATE lin, 3: PRINT i;
        ColNiv(i).nome = EntradaTexto$(lin, 10, 12, RTRIM$(ColNiv(i).nome))
        ColNiv(i).cota = EntradaNumero#(lin, 26, 8, ColNiv(i).cota)
        ColNiv(i).peDireito = EntradaNumero#(lin, 40, 8, ColNiv(i).peDireito)
    NEXT
    ColNivQtd = n
    ColAlterada = -1
END SUB

' Item 2: arquiva uma coluna (nome, secao, bx, by, x, y) e a faixa de niveis em que existe.
' RECONSTRUCAO: nome limitado a 8 caracteres (TColuna). A faixa de niveis e validada,
' mas nao e guardada: o contrato .COL (docs/formats/DADOS.md) nao tem campo para ela.
SUB ItemArquivarColuna
    DIM nome AS STRING, sec AS STRING, c AS INTEGER, k AS INTEGER, j AS INTEGER
    DIM bx AS DOUBLE, by AS DOUBLE, x AS DOUBLE, y AS DOUBLE, ni AS INTEGER, ns AS INTEGER
    IF ColNivQtd = 0 THEN
        Espera "Defina os niveis (item 1) antes de arquivar colunas", -1
        EXIT SUB
    END IF
    IF ColQtd >= DAD_MAXPIL THEN
        Espera "Numero maximo de colunas atingido", -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Arquivo de Colunas para dimensionamento"
    LOCATE 6, 3: PRINT "Nome da Coluna *RETORNO* ";
    nome = UCASE$(EntradaTexto$(6, 36, 8, ""))
    IF nome = "" THEN EXIT SUB
    IF PgColuna%(nome) > 0 THEN
        Espera "Ja existe coluna com o nome " + nome, -1
        EXIT SUB
    END IF
    LOCATE 7, 3: PRINT "Secao (R retangular, C circular) ... ";
    sec = UCASE$(EntradaTexto$(7, 36, 1, "R"))
    IF sec <> "R" AND sec <> "C" THEN
        Espera "Secao deve ser R ou C", -1
        EXIT SUB
    END IF
    LOCATE 8, 3: PRINT "Dimensao bx (cm) ............. ";
    bx = EntradaNumero#(8, 36, 8, 20)
    LOCATE 9, 3: PRINT "Dimensao by (cm) ............. ";
    by = EntradaNumero#(9, 36, 8, 20)
    LOCATE 10, 3: PRINT "Coordenada x (m) ............. ";
    x = EntradaNumero#(10, 36, 8, 0)
    LOCATE 11, 3: PRINT "Coordenada y (m) ............. ";
    y = EntradaNumero#(11, 36, 8, 0)
    LOCATE 12, 3: PRINT "Nivel inferior (numero) ...... ";
    ni = INT(EntradaNumero#(12, 36, 3, ColNivQtd))
    LOCATE 13, 3: PRINT "Nivel superior (numero) ...... ";
    ns = INT(EntradaNumero#(13, 36, 3, 1))
    IF ns < 1 OR ni > ColNivQtd OR ns > ni THEN
        Espera "Faixa invalida: 1 <= superior <= inferior <= " + LTRIM$(STR$(ColNivQtd)), -1
        EXIT SUB
    END IF
    IF Pergunta%(15, "Dados Corretos N/*S* ", -1) = 0 THEN EXIT SUB
    c = ColQtd + 1
    Col(c).nome = nome: Col(c).secao = sec
    Col(c).bx = bx: Col(c).by = by: Col(c).x = x: Col(c).y = y
    ColQtd = c
    FOR k = 1 TO ColNivQtd
        j = ColIdx%(c, k)
        ColEsf(j).N = 0: ColEsf(j).Mx = 0: ColEsf(j).My = 0
    NEXT
    ColAlterada = -1
    Espera "Coluna arquivada: " + nome, 0
END SUB

' Item 5: pede o nome de cada nivel (com ou sem .REP/.RLP), le o .REP e o .RLP
' desse nivel (basta um existir) e acumula de cima para baixo.
' RECONSTRUCAO: a leitura refaz todos os niveis de uma vez (PgAcumula nao e
' incremental). Tela "Cargas Totais" e confirmacao por coluna (<M>axima, <+>Soma,
' <N>ao, <A>bandona, <*S*>im) nao reconstruidas: falta o layout da tela e a regra
' de Maxima/Soma (a evidencia so tem os rotulos). Colunas PERMANENTES e VENTO do
' relatorio tambem faltam: ColEsf guarda so N, Mx e My somados, e o .COL nao tem campo
' separado (DADOS.md nao muda).
SUB ItemLeituraCarga
    DIM k AS INTEGER, lin AS INTEGER, arq(1 TO NIV_TELA) AS STRING, msg AS STRING
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Defina niveis (item 1) e arquive colunas (item 2) antes", -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Leitura de Arquivos de Cargas e Geometria (.REP e .RLP)"
    LOCATE 5, 3: PRINT "Numero ou Nome do Nivel onde as cargas serao introduzidas"
    LOCATE 6, 40: PRINT "Nome do Arquivo Carregamento *RETORNO*"
    FOR k = 1 TO ColNivQtd
        lin = 6 + k
        LOCATE lin, 3: PRINT "Nivel"; k; "  "; RTRIM$(ColNiv(k).nome);
        arq(k) = UCASE$(EntradaTexto$(lin, 40, 20, ""))
        IF arq(k) = "" OR arq(k) = "*RETORNO*" THEN EXIT SUB
    NEXT
    FOR k = 1 TO ColNivQtd
        msg = CarregaNivelCarga$(k, arq(k))
        IF msg <> "" THEN
            ' descarta a soma parcial dos niveis ja lidos: recarrega o .COL (ColLe% zera niveis e colunas)
            IF _FILEEXISTS(DirDados + ColObra + ".COL") THEN
                IF ColLe%(DirDados + ColObra + ".COL") = 0 THEN msg = msg + "; " + DadErro
            END IF
            Espera msg + " (refaca o item 5)", -1
            EXIT SUB
        END IF
    NEXT
    PgAcumula
    ColAlterada = -1
    Espera "Carga lida dos " + LTRIM$(STR$(ColNivQtd)) + " niveis e acumulada", 0
END SUB

' Le o .REP e o .RLP do nivel k (nomeArq sem extensao; basta um existir), soma as
' cargas por pilar e as passa a PgSomaPavimento. Devolve "" ou a mensagem de erro.
FUNCTION CarregaNivelCarga$ (k AS INTEGER, nomeArq AS STRING)
    DIM nomeBase AS STRING, msg AS STRING, i AS INTEGER, nRep AS INTEGER
    DIM cop(1 TO DAD_MAXPIL) AS TCargaPilar
    CarregaNivelCarga$ = ""
    nomeBase = nomeArq
    IF RIGHT$(nomeBase, 4) = ".REP" OR RIGHT$(nomeBase, 4) = ".RLP" THEN nomeBase = LEFT$(nomeBase, LEN(nomeBase) - 4)
    IF NOT _FILEEXISTS(DirDados + nomeBase + ".REP") AND NOT _FILEEXISTS(DirDados + nomeBase + ".RLP") THEN
        CarregaNivelCarga$ = "Nenhum Arquivo Encontrado: " + DirDados + nomeBase + ".REP/.RLP VERIFIQUE O SEU DRIVE"
        EXIT FUNCTION
    END IF
    CPilObra = ColObra
    nRep = 0
    IF _FILEEXISTS(DirDados + nomeBase + ".REP") THEN
        IF CPilLe%(DirDados + nomeBase + ".REP", "REP") = 0 THEN
            CarregaNivelCarga$ = "Falha na leitura de " + nomeBase + ".REP " + DadErro
            EXIT FUNCTION
        END IF
        ' CPil() e reescrito pela leitura do .RLP, entao guarda a copia do .REP
        nRep = CPilQtd
        FOR i = 1 TO nRep: cop(i) = CPil(i): NEXT
    END IF
    IF _FILEEXISTS(DirDados + nomeBase + ".RLP") THEN
        IF CPilLe%(DirDados + nomeBase + ".RLP", "RLP") = 0 THEN
            CarregaNivelCarga$ = "Falha na leitura de " + nomeBase + ".RLP " + DadErro
            EXIT FUNCTION
        END IF
        FOR i = 1 TO nRep
            IF CPilSoma%(RTRIM$(cop(i).nome), cop(i).x, cop(i).y, cop(i).N, cop(i).Mx, cop(i).My) = 0 THEN
                CarregaNivelCarga$ = "Numero maximo de pilares excedido em " + nomeBase + ".RLP"
                EXIT FUNCTION
            END IF
        NEXT
    END IF
    CPilNivel = k
    PgSomaPavimento k, msg
    CarregaNivelCarga$ = msg
END FUNCTION

' Item 7: pergunta se imprime a geometria e grava <obra>_PILGEEDI.LST em DirDados.
' RECONSTRUCAO: faixa de posicoes da spec nao reconstruida (sempre imprime tudo).
SUB ItemImpressao
    DIM geo AS INTEGER, lst AS STRING
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Nao ha dados para imprimir", -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Impressao dos Niveis, Esforcos Externos e Travamentos"
    geo = Pergunta%(6, "Imprimo os Dados Geometricos  S/*N* ", 0)
    lst = DirDados + ColObra + "_PILGEEDI.LST"
    ImprimeRelatorio lst, geo
    Espera "Relatorio gravado em " + ColObra + "_PILGEEDI.LST", 0
END SUB

' Grava o relatorio em arq: geometria (se geo) e esforcos acumulados por nivel e coluna.
SUB ImprimeRelatorio (arq AS STRING, geo AS INTEGER)
    DIM f AS INTEGER, k AS INTEGER, c AS INTEGER, j AS INTEGER
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    PRINT #f, "PILGEEDI - obra " + ColObra
    IF geo THEN
        PRINT #f, ""
        PRINT #f, "NIVEIS (1 = mais alto)"
        FOR k = 1 TO ColNivQtd
            PRINT #f, "  " + LTRIM$(STR$(k)) + "  " + RTRIM$(ColNiv(k).nome) + "  cota " + FormataNumero$(ColNiv(k).cota, 2, 8) + " m  pe " + FormataNumero$(ColNiv(k).peDireito, 2, 6) + " m"
        NEXT
        PRINT #f, ""
        PRINT #f, "COLUNAS"
        FOR c = 1 TO ColQtd
            PRINT #f, "  " + RTRIM$(Col(c).nome) + "  secao " + Col(c).secao + "  bx " + FormataNumero$(Col(c).bx, 1, 6) + "  by " + FormataNumero$(Col(c).by, 1, 6) + "  x " + FormataNumero$(Col(c).x, 2, 7) + "  y " + FormataNumero$(Col(c).y, 2, 7)
        NEXT
    END IF
    PRINT #f, ""
    PRINT #f, "ESFORCOS ACUMULADOS (N em tf, Mx e My em tf.m)"
    FOR k = 1 TO ColNivQtd
        PRINT #f, "Nivel " + LTRIM$(STR$(k)) + " " + RTRIM$(ColNiv(k).nome)
        FOR c = 1 TO ColQtd
            j = ColIdx%(c, k)
            PRINT #f, "  " + RTRIM$(Col(c).nome) + "  N " + FormataNumero$(ColEsf(j).N, 3, 10) + "  Mx " + FormataNumero$(ColEsf(j).Mx, 3, 10) + "  My " + FormataNumero$(ColEsf(j).My, 3, 10)
        NEXT
    NEXT
    ' RECONSTRUCAO: travamentos (lex, ley em m) impressos sempre, por nivel e coluna; layout suposto.
    PRINT #f, ""
    PRINT #f, "TRAVAMENTOS (comprimento de flambagem em m)"
    FOR k = 1 TO ColNivQtd
        PRINT #f, "Nivel " + LTRIM$(STR$(k)) + " " + RTRIM$(ColNiv(k).nome)
        FOR c = 1 TO ColQtd
            j = ColIdx%(c, k)
            PRINT #f, "  " + RTRIM$(Col(c).nome) + "  lex " + FormataNumero$(ColEsf(j).lex, 2, 7) + "  ley " + FormataNumero$(ColEsf(j).ley, 2, 7)
        NEXT
    NEXT
    PRINT #f, ""
    PRINT #f, "Relatorio gravado em " + arq
    CLOSE #f
END SUB

' Item 3: esforcos externos (N, Mx, My) por coluna e nivel. Os valores digitados somam
' ao que ja esta em ColEsf. N lancado no nivel k vale para k e os niveis abaixo; os
' momentos valem so no nivel k. O .COL nao tem campo proprio para externos: o item 5
' recalcula N/Mx/My e apaga esses valores.
SUB ItemEsforcoExterno
    DIM nome AS STRING, c AS INTEGER
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Defina niveis (item 1) e arquive colunas (item 2) antes", -1
        EXIT SUB
    END IF
    DO
        CLS
        TelaCabecalho "Definicao dos Esforcos Externamente Aplicados"
        LOCATE 6, 3: PRINT "Nome da Coluna *RETORNO* ";
        nome = UCASE$(EntradaTexto$(6, 36, 8, ""))
        IF nome = "" THEN EXIT DO
        c = PgColuna%(nome)
        IF c = 0 THEN
            Espera "Coluna nao arquivada: " + nome, -1
        ELSE
            EsforcoExternoColuna c
        END IF
    LOOP
    IF ColAlterada THEN OfereceGravar
END SUB

' Pede N, Mx e My externos de cada nivel da coluna c e soma em ColEsf.
SUB EsforcoExternoColuna (c AS INTEGER)
    DIM k AS INTEGER, m AS INTEGER, j AS INTEGER, lin AS INTEGER
    DIM dN(1 TO NIV_TELA) AS DOUBLE, dMx(1 TO NIV_TELA) AS DOUBLE, dMy(1 TO NIV_TELA) AS DOUBLE
    CLS
    TelaCabecalho "Esforcos externos da coluna " + RTRIM$(Col(c).nome)
    LOCATE 6, 3: PRINT "Nivel";
    LOCATE 6, 11: PRINT "N (tf)";
    LOCATE 6, 24: PRINT "Mx (tf.m)";
    LOCATE 6, 38: PRINT "My (tf.m)";
    FOR k = 1 TO ColNivQtd
        lin = 6 + k
        LOCATE lin, 3: PRINT k;
        dN(k) = EntradaNumero#(lin, 11, 10, 0)
        dMx(k) = EntradaNumero#(lin, 24, 10, 0)
        dMy(k) = EntradaNumero#(lin, 38, 10, 0)
    NEXT
    FOR k = 1 TO ColNivQtd
        j = ColIdx%(c, k)
        ColEsf(j).Mx = ColEsf(j).Mx + dMx(k)
        ColEsf(j).My = ColEsf(j).My + dMy(k)
        ' laco explicito: o N do nivel k tambem pesa nos niveis de baixo
        FOR m = k TO ColNivQtd
            j = ColIdx%(c, m)
            ColEsf(j).N = ColEsf(j).N + dN(k)
        NEXT
    NEXT
    ColAlterada = -1
    Espera "Esforcos externos somados a coluna " + RTRIM$(Col(c).nome), 0
END SUB

' Item 4: momentos de vento acidentais por nivel, somados a Mx e My do nivel em ColEsf.
' Nivel 0 encerra. Coluna T aplica o mesmo valor a todas as colunas (suposicao: o vento
' vale por pilar). RECONSTRUCAO: rotulos Nkv e Ma..Md do original nao reconstruidos.
SUB ItemVentoExterno
    DIM k AS INTEGER
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Defina niveis (item 1) e arquive colunas (item 2) antes", -1
        EXIT SUB
    END IF
    DO
        CLS
        TelaCabecalho "Momento de Vento acidental"
        LOCATE 6, 3: PRINT "Numero do Nivel (0 = *FIM*) ... ";
        k = INT(EntradaNumero#(6, 36, 3, 0))
        IF k = 0 THEN EXIT DO
        IF k < 1 OR k > ColNivQtd THEN
            Espera "Nivel fora do intervalo 1 a " + LTRIM$(STR$(ColNivQtd)), -1
        ELSE
            VentoNivel k
        END IF
    LOOP
    IF ColAlterada THEN OfereceGravar
END SUB

' Pede a coluna (nome ou T = todas) e os momentos de vento Mx e My do nivel k.
SUB VentoNivel (k AS INTEGER)
    DIM nome AS STRING, c AS INTEGER, c1 AS INTEGER, c2 AS INTEGER, j AS INTEGER
    DIM mx AS DOUBLE, my AS DOUBLE
    LOCATE 7, 3: PRINT "Coluna (nome ou T = todas) ..... ";
    nome = UCASE$(EntradaTexto$(7, 36, 8, "T"))
    IF nome = "T" THEN
        c1 = 1: c2 = ColQtd
    ELSE
        c = PgColuna%(nome)
        IF c = 0 THEN
            Espera "Coluna nao arquivada: " + nome, -1
            EXIT SUB
        END IF
        c1 = c: c2 = c
    END IF
    LOCATE 8, 3: PRINT "Momento Mx de vento (tf.m) ..... ";
    mx = EntradaNumero#(8, 36, 10, 0)
    LOCATE 9, 3: PRINT "Momento My de vento (tf.m) ..... ";
    my = EntradaNumero#(9, 36, 10, 0)
    FOR c = c1 TO c2
        j = ColIdx%(c, k)
        ColEsf(j).Mx = ColEsf(j).Mx + mx
        ColEsf(j).My = ColEsf(j).My + my
    NEXT
    ColAlterada = -1
    Espera "Vento somado ao nivel " + LTRIM$(STR$(k)) + " (" + nome + ")", 0
END SUB

' Item 6: travamento em x e em y por coluna e nivel. Tipo 1 a 4 faz o comprimento de
' flambagem = fator x pe-direito do nivel; tipo 0 pede o comprimento direto (m).
' O tipo nao e guardado: o .COL so tem lex e ley.
SUB ItemTravamento
    DIM nome AS STRING, c AS INTEGER
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Defina niveis (item 1) e arquive colunas (item 2) antes", -1
        EXIT SUB
    END IF
    DO
        CLS
        TelaCabecalho "Definicao dos Vinculos de extremidade"
        LOCATE 6, 3: PRINT "Nome da Coluna *RETORNO* ";
        nome = UCASE$(EntradaTexto$(6, 36, 8, ""))
        IF nome = "" THEN EXIT DO
        c = PgColuna%(nome)
        IF c = 0 THEN
            Espera "Coluna nao arquivada: " + nome, -1
        ELSE
            TravamentoColuna c
        END IF
    LOOP
    IF ColAlterada THEN OfereceGravar
END SUB

' Pede o travamento de x e de y em cada nivel da coluna c e grava lex/ley em ColEsf.
SUB TravamentoColuna (c AS INTEGER)
    DIM k AS INTEGER, j AS INTEGER, lin AS INTEGER, tx AS INTEGER, ty AS INTEGER
    DIM lx AS DOUBLE, ly AS DOUBLE
    CLS
    TelaCabecalho "Travamentos Horizontais da coluna " + RTRIM$(Col(c).nome)
    LOCATE 6, 3: PRINT "Nivel";
    LOCATE 6, 11: PRINT "Tipo x";
    LOCATE 6, 20: PRINT "Compr x (m)";
    LOCATE 6, 32: PRINT "Tipo y";
    LOCATE 6, 41: PRINT "Compr y (m)";
    TelaStatus "Tipo 1 a 4; 0 = comprimento direto em metros"
    FOR k = 1 TO ColNivQtd
        lin = 6 + k
        j = ColIdx%(c, k)
        LOCATE lin, 3: PRINT k;
        DO
            tx = INT(EntradaNumero#(lin, 11, 2, 0))
        LOOP UNTIL tx >= 0 AND tx <= 4
        IF tx = 0 THEN
            lx = EntradaNumero#(lin, 20, 9, ColEsf(j).lex)
        ELSE
            lx = TravFator#(tx) * ColNiv(k).peDireito
        END IF
        DO
            ty = INT(EntradaNumero#(lin, 32, 2, 0))
        LOOP UNTIL ty >= 0 AND ty <= 4
        IF ty = 0 THEN
            ly = EntradaNumero#(lin, 41, 9, ColEsf(j).ley)
        ELSE
            ly = TravFator#(ty) * ColNiv(k).peDireito
        END IF
        ColEsf(j).lex = lx
        ColEsf(j).ley = ly
    NEXT
    ColAlterada = -1
    Espera "Travamentos da coluna " + RTRIM$(Col(c).nome) + " atualizados", 0
END SUB

' Fator do comprimento de flambagem por tipo de travamento: 1 engaste-engaste 0.5,
' 2 engaste-rotula 0.7, 3 rotula-rotula 1.0, 4 engaste-livre 2.0.
FUNCTION TravFator# (cod AS INTEGER)
    SELECT CASE cod
        CASE 1: TravFator# = 0.5
        CASE 2: TravFator# = 0.7
        CASE 3: TravFator# = 1#
        CASE 4: TravFator# = 2#
    END SELECT
END FUNCTION

' Pergunta se grava o .COL agora. Se nao grava, a gravacao fica para o R do menu.
SUB OfereceGravar
    IF Pergunta%(22, "Grava o .COL agora S/*N* ", 0) THEN ColSalva
    LimpaLinha 22
END SUB

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

'$INCLUDE: '../pilar/PILGECAL.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
