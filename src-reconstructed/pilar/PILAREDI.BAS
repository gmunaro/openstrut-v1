' ============================================================================
' PILAREDI - Gerenciador de colunas do PILAR - Edificios (SISTRUT 4.0)
' Reconstruido a partir de dump de strings do PILAREDI.EXE (fora do repositorio), com
' PIPROEDI.BAS como modelo. Verificacao de licenca do original nao reimplementada.
'
' Menu principal: despacha para PILGEEDI e PIGRAEDI (reler o .COL ao voltar)
' e tem telas locais: materiais, parametrizacao (PILAR.INI), lista/correcao
' de colunas, dimensionamento com desenho da secao (.VET) e o menu de calculo
' (3.4): predimensionamento de secao (PILPRED.BM), dimensionamento, resumo de
' cargas na fundacao, momentos e carga normal com diagramas, e PIPROEDI.
' Arquivo auxiliar proprio: <obra>.PRD guarda as secoes predimensionadas
' (ver PrdGrava).
' RECONSTRUCAO: o dump nao diz qual submodulo cada item do menu chama; o
' mapeamento adotado esta em MenuPrincipal.
' ============================================================================

' (interface em janela: sem $CONSOLE)
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

DECLARE FUNCTION ColLe% (arq AS STRING)
DECLARE SUB ColGrava (arq AS STRING)
DECLARE FUNCTION ColIdx% (c AS INTEGER, k AS INTEGER)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
DECLARE SUB PeDimensionaArranjo (c AS INTEGER, k AS INTEGER, fck AS DOUBLE, fyk AS DOUBLE, gf AS DOUBLE, gc AS DOUBLE, gs AS DOUBLE, dl AS DOUBLE, msg AS STRING, nfx AS INTEGER, nfy AS INTEGER)
DECLARE SUB IniParaCalculo ()
DECLARE FUNCTION PcEsbeltez# (le AS DOUBLE, h AS DOUBLE)
DECLARE FUNCTION DirComBarra$ (d AS STRING)
DECLARE FUNCTION ArqColuna$ ()
DECLARE FUNCTION IniCarrega% ()
DECLARE FUNCTION IniNumero# (n AS INTEGER, padrao AS DOUBLE)
DECLARE SUB IniGrava (n AS INTEGER, valor AS STRING)
DECLARE FUNCTION NumTexto$ (v AS DOUBLE)
DECLARE FUNCTION ParamIni% (item AS INTEGER)
DECLARE FUNCTION ParamValido% (item AS INTEGER, v AS DOUBLE)
DECLARE SUB CarregaConfiguracao ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB LimpaLinha (lin AS INTEGER)
DECLARE SUB ColRecarrega ()
DECLARE SUB ColSalvaSeMudou ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB EditaMateriais ()
DECLARE SUB EditaParametros ()
DECLARE SUB ParametrosMostra ()
DECLARE SUB ListaColunas ()
DECLARE SUB EditaColuna (c AS INTEGER)
DECLARE SUB Dimensiona ()
DECLARE SUB MostraDimensionamento (c AS INTEGER)
DECLARE SUB DimPagina (c AS INTEGER, pag AS INTEGER, ultima AS INTEGER)
DECLARE SUB DetalheNivel (c AS INTEGER)
DECLARE SUB ColLambda (c AS INTEGER, j AS INTEGER, lx AS DOUBLE, ly AS DOUBLE)
DECLARE FUNCTION ColArea# (c AS INTEGER)
DECLARE SUB DesenhaSecao (c AS INTEGER)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetCirculo (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION VetMostra% (arq AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE FUNCTION PerguntaSN% (lin AS INTEGER, col AS INTEGER, texto AS STRING, padrao AS INTEGER)
DECLARE SUB PipCarrega ()
DECLARE SUB MenuCalculo ()
DECLARE FUNCTION MaxColunas% ()
DECLARE FUNCTION NivNome$ (k AS INTEGER)
DECLARE FUNCTION SecaoTexto$ (tipo AS STRING, bx AS DOUBLE, by AS DOUBLE)
DECLARE SUB Predimensiona ()
DECLARE SUB PredimColuna (c AS INTEGER)
DECLARE SUB PredimInicia ()
DECLARE FUNCTION PrTopo% (s AS INTEGER)
DECLARE FUNCTION PredimDefineSecao% (c AS INTEGER, s AS INTEGER)
DECLARE SUB PredimCalcula (c AS INTEGER, fck AS DOUBLE)
DECLARE SUB PredimMostra (c AS INTEGER, fck AS DOUBLE)
DECLARE FUNCTION PredimOpcao$ (c AS INTEGER)
DECLARE SUB PredimAceita (c AS INTEGER)
DECLARE SUB PredimExcentricidades (c AS INTEGER)
DECLARE SUB PredimElimina ()
DECLARE SUB PredimRemove (s AS INTEGER)
DECLARE SUB PredimVaria (c AS INTEGER)
DECLARE FUNCTION NivelPede% (lin AS INTEGER)
DECLARE FUNCTION ArqPredim$ ()
DECLARE FUNCTION PrdLe% (c AS INTEGER)
DECLARE SUB PrdGrava (c AS INTEGER)
DECLARE SUB ResumoFundacao ()
DECLARE SUB FundParametros ()
DECLARE FUNCTION FundLinha$ (c AS INTEGER)
DECLARE SUB MomentosDiagramas ()
DECLARE SUB MomentosColuna (c AS INTEGER)
DECLARE SUB DiagramaColuna (c AS INTEGER)

' RECONSTRUCAO: escala do desenho da secao, 1 mm no papel por cm real.
CONST VET_MM_POR_CM = 1#
' Cobrimento usado no dimensionamento (cm); o original o mostra como "Cobrimento ##.# cm".
' RECONSTRUCAO: valor herdado do Dimensiona anterior; nao vem do PILAR.INI.
CONST DL_COBRIMENTO = 4#
CONST PIAREA = 3.14159265358979#

DIM SHARED DirDados AS STRING
DIM SHARED ColMudou AS INTEGER                 ' -1 quando .COL em memoria mudou
DIM SHARED DimAviso(1 TO DAD_MAXNIV) AS STRING ' avisos do ultimo dimensionamento, por nivel
DIM SHARED DimNfx(1 TO DAD_MAXNIV) AS INTEGER  ' barras por face perpendicular a bx, por nivel
DIM SHARED DimNfy(1 TO DAD_MAXNIV) AS INTEGER  ' barras por face perpendicular a by, por nivel

' Secoes do predimensionamento da coluna em edicao (PpColuna, PILPRED.BM).
' Secao 1 = a de baixo; PrNiv(s) = nivel mais baixo da secao s (1 = topo).
' RECONSTRUCAO: o original mostra "(maximo ... secoes)" sem o valor; 8 cabem na tela.
CONST PR_MAXSEC = 8
DIM SHARED PrQtd AS INTEGER
DIM SHARED PrNiv(1 TO PR_MAXSEC) AS INTEGER, PrTipo(1 TO PR_MAXSEC) AS STRING
DIM SHARED PrB(1 TO PR_MAXSEC) AS DOUBLE, PrH(1 TO PR_MAXSEC) AS DOUBLE     ' medidas dadas (0 = ?)
DIM SHARED PrEx(1 TO PR_MAXSEC) AS DOUBLE, PrEy(1 TO PR_MAXSEC) AS DOUBLE   ' CG da secao de baixo ao desta (cm)
DIM SHARED PrBx(1 TO PR_MAXSEC) AS DOUBLE, PrBy(1 TO PR_MAXSEC) AS DOUBLE   ' secao proposta
DIM SHARED PrOk(1 TO PR_MAXSEC) AS INTEGER, PrN(1 TO PR_MAXSEC) AS DOUBLE
DIM SHARED PrS1(1 TO PR_MAXSEC) AS DOUBLE, PrK1(1 TO PR_MAXSEC) AS INTEGER
DIM SHARED PrS2(1 TO PR_MAXSEC) AS DOUBLE, PrK2(1 TO PR_MAXSEC) AS INTEGER

CarregaConfiguracao
' obra nova (sem .COL) tambem abre o menu: o .COL e criado pelo PILGEEDI
' (Arquivar) ou pelo PIGRAEDI (Gravacao e Leitura), chamados daqui
IF ColLe%(ArqColuna$) = 0 THEN
    Espera "Nenhum Arquivo Encontrado - obra nova: comece por Arquivar (geometria e cargas)", 0
END IF
MenuPrincipal
CLS
LOCATE 12, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le drive/diretorio do PILAR.INI, pede o nome da obra e a define.
' Sem PILAR.INI, a pasta de trabalho e o diretorio de dados.
SUB CarregaConfiguracao
    DIM d AS STRING
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")
    IF IniCarrega% THEN DirDados = IniDirDados$
    ColObra = ObraAtual$(DirDados)
    TelaCabecalho "Identificacao da obra"
    LOCATE 6, 3: PRINT "Nome da obra ..."
    ColObra = EntradaTexto$(6, 20, 30, ColObra)
    ObraDefine DirDados, ColObra
END SUB

' Recarrega o PILAR.INI. ArqLer% sobrescreve o buffer, por isso e chamado
' antes de cada leitura e gravacao. Retorna -1 se o arquivo foi lido.
FUNCTION IniCarrega%
    IniCarrega% = (ArqLer%(ComumDirExec$ + "PILAR.INI") >= 0)
END FUNCTION

' Valor numerico da linha n do PILAR.INI (texto antes do "="); padrao se
' o arquivo nao existe ou a linha esta vazia.
FUNCTION IniNumero# (n AS INTEGER, padrao AS DOUBLE)
    DIM t AS STRING
    IniNumero# = padrao
    IF IniCarrega% THEN
        t = IniValor$(n)
        IF t <> "" THEN IniNumero# = VAL(t)
    END IF
END FUNCTION

' Grava o valor da linha n no PILAR.INI (recarrega antes, para nao perder
' o que estiver no buffer). Sem arquivo, nao faz nada.
SUB IniGrava (n AS INTEGER, valor AS STRING)
    IF IniCarrega% THEN
        IniDefinir n, valor
        ArqGravar ComumDirExec$ + "PILAR.INI"
    END IF
END SUB

' Numero como texto para o PILAR.INI: "0.15" e nao " .15".
FUNCTION NumTexto$ (v AS DOUBLE)
    DIM t AS STRING
    t = LTRIM$(STR$(v))
    IF LEFT$(t, 1) = "." THEN t = "0" + t
    NumTexto$ = t
END FUNCTION

' Linha do PILAR.INI de cada item editavel da tela de parametrizacao.
FUNCTION ParamIni% (item AS INTEGER)
    SELECT CASE item
        CASE 1: ParamIni% = 35
        CASE 2: ParamIni% = 36
        CASE 3: ParamIni% = 37
        CASE 4: ParamIni% = 32
        CASE 5: ParamIni% = 33
        CASE 6: ParamIni% = 34
    END SELECT
END FUNCTION

' Faixas dadas pelo original: fluencia 0 a 2; multiplicador de fluencia
' 1.1 a 1.25; coeficientes de seguranca e multiplicador de Nk positivos.
FUNCTION ParamValido% (item AS INTEGER, v AS DOUBLE)
    SELECT CASE item
        CASE 4: ParamValido% = (v >= 0# AND v <= 2#)
        CASE 6: ParamValido% = (v >= 1.1# AND v <= 1.25#)
        CASE ELSE: ParamValido% = (v > 0#)
    END SELECT
END FUNCTION

' Garante a barra final do diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Caminho completo do .COL da obra corrente.
FUNCTION ArqColuna$ ()
    ArqColuna$ = DirDados + ColObra + ".COL"
END FUNCTION

' Cabecalho de 4 linhas: titulo, obra/diretorio, razao social e subtitulo.
SUB TelaCabecalho (subtit AS STRING)
    CLS
    LOCATE 1, 2: PRINT "PILARES DE CONCRETO ARMADO - CALCULO DE EDIFICIOS DE MULTIPLOS ANDARES"
    ' RECONSTRUCAO: o caminho pode passar de 80 colunas e quebrar sobre a linha 3; corta na largura da tela.
    LOCATE 2, 3: PRINT LEFT$("Obra: " + ColObra + "   Dados: " + DirDados, 77)
    LOCATE 3, 3: PRINT "OpenStrut                              "
    LOCATE 4, 3: PRINT subtit
END SUB

' Mostra texto (aviso se erro <> 0) e espera ESC ou Enter.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF erro THEN TelaErro texto ELSE TelaStatus texto
    LOCATE 23, 3: PRINT "Acione ESC <Enter> para Continuar "
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

' Grava o .COL so se a memoria foi alterada.
SUB ColSalvaSeMudou
    IF ColMudou THEN
        ColGrava ArqColuna$
        ColMudou = 0
    END IF
END SUB

' Reler o .COL depois de um submodulo, que pode te-lo alterado.
SUB ColRecarrega
    IF NOT _FILEEXISTS(ArqColuna$) THEN EXIT SUB   ' obra nova ainda sem .COL
    IF ColLe%(ArqColuna$) = 0 THEN
        Espera "erro no processamento: " + DadErro + " - verifique a consistencia dos seus dados", -1
    END IF
END SUB

' Menu principal. Letra destacada = primeira letra do item.
' Mapeamento (RECONSTRUCAO): A -> PILGEEDI, G -> PIGRAEDI, P -> menu de
' calculo 3.4 (MenuCalculo, que chama o PIPROEDI no item 5); M, L, S e V sao
' telas locais. S vai direto ao dimensionamento (o mesmo do item 2 do 3.4).
' ESC ou F2 retornam.
' RECONSTRUCAO: opcoes do original sem tela aqui, fora do menu:
'   variacao de armadura ao longo da coluna; parada para visualizacao por
'   trecho; relatorio da armacao; redefinicao <A>/<R>/<C>/<I>/<D>/<V> da
'   armadura; editor poligonal de secao; confirmacao "Dados Corretos" antes
'   do dimensionamento.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        TelaCabecalho "Versao 4.0   Abril 1991   (omitido)                 "
        TelaItemMenu 8, 20, "Materiais, Concreto Aco"
        TelaItemMenu 9, 20, "Arquivar dados de Colunas"
        TelaItemMenu 10, 20, "Secoes / Dimensionamento"
        TelaItemMenu 11, 20, "Processar / Detalhar Colunas"
        TelaItemMenu 12, 20, "Lista das Colunas Arquivadas"
        TelaItemMenu 13, 20, "Gravacao e Leitura"
        TelaItemMenu 14, 20, "Visualizar e Alterar Parametrizacoes"
        LOCATE 20, 3: PRINT "escolha opcao"
        LOCATE 23, 3: PRINT "<F2> = Retorno"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "M"
                EditaMateriais
            CASE "A"
                ColSalvaSeMudou
                RunSubmodulo "PILGEEDI"
                ColRecarrega
            CASE "S"
                Dimensiona
            CASE "P"
                MenuCalculo
            CASE "L"
                ListaColunas
            CASE "G"
                ColSalvaSeMudou
                RunSubmodulo "PIGRAEDI"
                ColRecarrega
            CASE "V"
                EditaParametros
            CASE CHR$(27), CHR$(0) + CHR$(60)
                EXIT DO
        END SELECT
    LOOP
    ColSalvaSeMudou
END SUB

' Definicao dos materiais: Fck e Fyk (gravados), unidades e multiplicador
' (somente leitura). Gravacao no PILAR.INI, linhas 17, 18 e 19.
SUB EditaMateriais
    DIM fck AS DOUBLE, fyk AS DOUBLE, tipo AS STRING
    IF NOT IniCarrega% THEN
        Espera "Erro no Arquivo parametrizacao", -1
        EXIT SUB
    END IF
    TelaCabecalho "Definicao dos Materiais e unidades de trabalho"
    LOCATE 6, 3: PRINT "Concreto Fck *"
    LOCATE 7, 3: PRINT "Unidade de grandeza para os valores caracteristicos do Concreto e Aco"
    LOCATE 7, 74: PRINT IniValor$(15)
    LOCATE 8, 3: PRINT "Multiplicador de (*) para transformar em Tonelada/Centimetro2"
    LOCATE 8, 74: PRINT IniValor$(16)
    LOCATE 9, 3: PRINT "Aco      Fyk *"
    LOCATE 10, 3: PRINT "Tipo de Aco  A/B *"
    fck = EntradaNumero#(6, 30, 10, VAL(IniValor$(17)))
    fyk = EntradaNumero#(9, 30, 10, VAL(IniValor$(18)))
    tipo = UCASE$(LEFT$(EntradaTexto$(10, 30, 1, IniValor$(19)) + " ", 1))
    IF fck > 0# AND fyk > 0# AND (tipo = "A" OR tipo = "B") THEN
        IniGrava 17, NumTexto$(fck)
        IniGrava 18, NumTexto$(fyk)
        IniGrava 19, tipo
    ELSE
        Espera "valores invalidos: Fck e Fyk maiores que zero; tipo A ou B", -1
    END IF
END SUB

' Visualizar e alterar parametrizacao. Itens 1 a 6 sao gravados no PILAR.INI;
' as unidades (7 a 10) so mostram o valor. ENTER sem item sai.
SUB EditaParametros
    DIM n AS DOUBLE, v AS DOUBLE, item AS INTEGER, linha AS INTEGER
    IF NOT IniCarrega% THEN
        Espera "Erro no Arquivo parametrizacao", -1
        EXIT SUB
    END IF
    DO
        ParametrosMostra
        LOCATE 22, 3: PRINT "item"
        LOCATE 22, 10: PRINT ", Novo Valor  *NAO*"
        n = EntradaNumero#(22, 8, 2, 0)
        item = INT(n)
        IF item < 1 OR item > 6 THEN EXIT DO
        linha = ParamIni%(item)
        v = EntradaNumero#(22, 30, 10, VAL(IniValor$(linha)))
        IF ParamValido%(item, v) THEN
            IniGrava linha, NumTexto$(v)
        ELSE
            Espera "valor fora da faixa permitida", -1
        END IF
    LOOP
END SUB

' Tela da parametrizacao atual, lida do PILAR.INI.
SUB ParametrosMostra
    TelaCabecalho "Correcao de Parametros"
    LOCATE 5, 3: PRINT "Parametrizacao Utilizada (.PIP)"
    LOCATE 6, 3: PRINT "(P)  Parametrizacao = "; IniValor$(3)
    LOCATE 7, 3: PRINT "Coeficientes de Seguranca"
    LOCATE 8, 3: PRINT "(1)  Forcas = "; IniValor$(35)
    LOCATE 9, 3: PRINT "(2)  Concreto = "; IniValor$(36)
    LOCATE 10, 3: PRINT "(3)  Aco = "; IniValor$(37)
    LOCATE 11, 3: PRINT "Coeficientes para o calculo da fluencia"
    ' RECONSTRUCAO: (4) e (5) nao entram no calculo; (6) entra em PeFluencia#
    LOCATE 12, 3: PRINT "(4)  de Fluencia (0 a 2) = "; IniValor$(32); "   (nao usado)"
    LOCATE 13, 3: PRINT "(5)  Mult. de  Nk  par  obter (Ngk + Nqk)  = "; IniValor$(33); " (nao usado)"
    LOCATE 14, 3: PRINT "(6)  Mult. Fluencia (1.1 a 1.25) = "; IniValor$(34)
    LOCATE 15, 3: PRINT "Unidades de trabalho dos esforcos solicitantes"
    LOCATE 16, 3: PRINT "(7)  Unidade de Forca = "; IniValor$(12)
    LOCATE 17, 3: PRINT "(8)  Coef. multiplicador para transformar em toneladas = "; IniValor$(14)
    LOCATE 18, 3: PRINT "(9)  Unidade de Medida = "; IniValor$(11)
    LOCATE 19, 3: PRINT "(10) Coef. multiplicador para transformar em metros = "; IniValor$(13)
END SUB

' Lista as colunas em memoria (14 por tela). Digitar a posicao abre a
' correcao da secao e de lex/ley. ENTER ou ESC sai e grava se mudou.
' Carga e Armadura sao os valores do nivel 1 (aproximacao, ver relatorio).
SUB ListaColunas
    DIM n AS DOUBLE, sel AS INTEGER, pag AS INTEGER, c AS INTEGER, lin AS INTEGER, j AS INTEGER
    sel = 1
    DO
        TelaCabecalho "Lista das Colunas arquivadas"
        LOCATE 5, 1: PRINT "    Coluna      inicio         termino        Carga   Secao     Armadura"
        pag = (sel - 1) \ 14
        FOR c = pag * 14 + 1 TO pag * 14 + 14
            IF c > ColQtd THEN EXIT FOR
            lin = 6 + (c - pag * 14 - 1)
            j = ColIdx%(c, 1)
            LOCATE lin, 1
            PRINT RIGHT$("   " + LTRIM$(STR$(c)), 3); " "; LEFT$(RTRIM$(Col(c).nome) + SPACE$(10), 10); "  "; LEFT$(RTRIM$(ColNiv(1).nome) + SPACE$(13), 13); "  "; LEFT$(RTRIM$(ColNiv(ColNivQtd).nome) + SPACE$(13), 13); "  "; FormataNumero$(ColEsf(j).N, 1, 8); Col(c).secao; SPACE$(9); FormataNumero$(ColEsf(j).asTot, 2, 10)
        NEXT
        LOCATE 21, 3: PRINT "Numero da Posicao das Colunas que serao Listadas"
        n = EntradaNumero#(21, 52, 4, 0)
        IF n < 1 OR n > ColQtd THEN EXIT DO
        sel = INT(n)
        EditaColuna sel
    LOOP
    ColSalvaSeMudou
END SUB

' Corrige a secao (R/C) e lex/ley (m) de cada nivel da coluna c.
' Pagina de 14 niveis; o campo de secao aparece na primeira pagina.
SUB EditaColuna (c AS INTEGER)
    DIM s AS STRING, k AS INTEGER, j AS INTEGER, r AS INTEGER
    DIM lex AS DOUBLE, ley AS DOUBLE
    FOR k = 1 TO ColNivQtd
        IF (k - 1) MOD 14 = 0 THEN
            TelaCabecalho "Correcao da secao e dos comprimentos de flambagem"
            LOCATE 5, 3: PRINT "Coluna "; RTRIM$(Col(c).nome); "   posicao "; LTRIM$(STR$(c))
            LOCATE 7, 3: PRINT "Nivel           lex (m)      ley (m)"
            IF k = 1 THEN
                LOCATE 6, 3: PRINT "Secao (R/C)"
                s = UCASE$(LEFT$(EntradaTexto$(6, 20, 1, RTRIM$(Col(c).secao)), 1))
                IF (s = "R" OR s = "C") AND s <> RTRIM$(Col(c).secao) THEN
                    ' troca de forma muda a area: corrige o peso proprio no N (PILPRED.BM)
                    PpAplicaSecao c, s, Col(c).bx, Col(c).by
                    ColMudou = -1
                END IF
            END IF
        END IF
        r = 8 + (k - 1) MOD 14
        j = ColIdx%(c, k)
        LOCATE r, 3: PRINT LEFT$(RTRIM$(ColNiv(k).nome) + SPACE$(12), 12)
        lex = EntradaNumero#(r, 20, 10, ColEsf(j).lex)
        ley = EntradaNumero#(r, 36, 10, ColEsf(j).ley)
        IF lex <> ColEsf(j).lex OR ley <> ColEsf(j).ley THEN
            ColEsf(j).lex = lex
            ColEsf(j).ley = ley
            ColMudou = -1
        END IF
    NEXT
END SUB

' Classe do aco (linha 19, A/B) e limites de esbeltez/fluencia (linhas 30, 31 e 34)
' do PILAR.INI para o calculo (CcaAcoClasse%, PeParam#). Sem INI: classe A
' (PpClasseAco%, como os outros modulos) e os padroes de PeParam#.
SUB IniParaCalculo
    DIM cl AS INTEGER, v AS DOUBLE, t AS STRING, tem AS INTEGER
    tem = IniCarrega%
    IF tem THEN t = IniValor$(19)
    cl = CcaAcoClasse%(PpClasseAco%(tem, t))
    v = PeParam#(1, IniNumero#(30, 80#))
    v = PeParam#(2, IniNumero#(31, 140#))
    v = PeParam#(3, IniNumero#(34, 1.1#))
END SUB

' Pede a coluna, dimensiona todos os niveis dela (PeDimensionaArranjo) e mostra.
' Fck, Fyk e coeficientes de seguranca vem do PILAR.INI (linhas 17, 18, 35 a 37).
SUB Dimensiona
    DIM n AS DOUBLE, c AS INTEGER, k AS INTEGER, msg AS STRING
    DIM fck AS DOUBLE, fyk AS DOUBLE, gf AS DOUBLE, gc AS DOUBLE, gs AS DOUBLE, nfx AS INTEGER, nfy AS INTEGER
    TelaCabecalho "Secoes / Dimensionamento"
    LOCATE 22, 3: PRINT "Numero da Posicao das Colunas que serao Dimensionadas"
    n = EntradaNumero#(22, 58, 4, 0)
    c = INT(n)
    IF c < 1 OR c > ColQtd THEN EXIT SUB
    ' RECONSTRUCAO: Fck/Fyk do INI estao na unidade de grandeza (linha 16), como no PILAR.
    fck = IniNumero#(17, 0.15#) * IniNumero#(16, 1#)
    fyk = IniNumero#(18, 5#) * IniNumero#(16, 1#)
    gf = IniNumero#(35, 1.4#)
    gc = IniNumero#(36, 1.4#)
    gs = IniNumero#(37, 1.15#)
    IniParaCalculo
    FOR k = 1 TO ColNivQtd
        msg = ""
        ' variaveis simples: elemento de vetor passado a SUB nao volta alterado
        PeDimensionaArranjo c, k, fck, fyk, gf, gc, gs, DL_COBRIMENTO, msg, nfx, nfy
        DimAviso(k) = msg: DimNfx(k) = nfx: DimNfy(k) = nfy
    NEXT
    ColMudou = -1
    MostraDimensionamento c
END SUB

' Paginas da tabela do dimensionamento da coluna c, 14 niveis por tela.
' Teclas: D desenha a secao; N detalha um nivel; ENTER/ESC vai a proxima pagina.
' RECONSTRUCAO: as teclas D e N nao aparecem no dump desta tela; o dump
' mostra <D> na tela de armadura por trecho, aqui a tecla foi reaproveitada.
SUB MostraDimensionamento (c AS INTEGER)
    DIM pag AS INTEGER, ultima AS INTEGER, tecla AS STRING
    ultima = (ColNivQtd - 1) \ 14
    FOR pag = 0 TO ultima
        DO
            DimPagina c, pag, ultima
            DO
                tecla = UCASE$(TeclaLer$)
            LOOP UNTIL tecla = "D" OR tecla = "N" OR tecla = CHR$(13) OR tecla = CHR$(27)
            IF tecla = CHR$(13) OR tecla = CHR$(27) THEN EXIT DO
            IF tecla = "D" THEN DesenhaSecao c
            IF tecla = "N" THEN DetalheNivel c
        LOOP
    NEXT
END SUB

' Desenha a tabela de uma pagina do dimensionamento.
' RECONSTRUCAO: lambda = PcEsbeltez#(le, h) com le em cm (lex*100) e h em cm;
' lambda x usa by (dimensao perpendicular ao eixo x) e lambda y usa bx.
SUB DimPagina (c AS INTEGER, pag AS INTEGER, ultima AS INTEGER)
    DIM k AS INTEGER, j AS INTEGER, r AS INTEGER, lx AS DOUBLE, ly AS DOUBLE, av AS STRING
    TelaCabecalho "DIMENSIONAMENTO"
    LOCATE 5, 2: PRINT "Coluna "; RTRIM$(Col(c).nome); "  secao "; Col(c).secao; "  bx="; FormataNumero$(Col(c).bx, 1, 7); "  by="; FormataNumero$(Col(c).by, 1, 7)
    LOCATE 6, 2: PRINT "Nivel        N(t)    Mx(t.m)  My(t.m)  lamx    lamy     As  n  phi  est    s"
    FOR k = pag * 14 + 1 TO pag * 14 + 14
        IF k > ColNivQtd THEN EXIT FOR
        j = ColIdx%(c, k)
        ColLambda c, j, lx, ly
        r = 7 + (k - 1) MOD 14
        LOCATE r, 2
        PRINT LEFT$(RTRIM$(ColNiv(k).nome) + SPACE$(10), 10); FormataNumero$(ColEsf(j).N, 1, 8); FormataNumero$(ColEsf(j).Mx, 1, 8); FormataNumero$(ColEsf(j).My, 1, 8); FormataNumero$(lx, 1, 8); FormataNumero$(ly, 1, 8); FormataNumero$(ColEsf(j).asTot, 2, 8); RIGHT$("  " + LTRIM$(STR$(ColEsf(j).nBarras)), 3); FormataNumero$(ColEsf(j).phi, 1, 6); FormataNumero$(ColEsf(j).phiEstribo, 1, 6); FormataNumero$(ColEsf(j).sEstribo, 1, 6)
    NEXT
    av = ""
    FOR k = pag * 14 + 1 TO pag * 14 + 14
        IF k > ColNivQtd THEN EXIT FOR
        IF DimAviso(k) <> "" THEN av = av + RTRIM$(ColNiv(k).nome) + ": " + DimAviso(k) + " | "
    NEXT
    LOCATE 21, 2: PRINT LEFT$(av, 78)
    LOCATE 22, 2: PRINT MID$(av, 79, 78)
    LOCATE 23, 2: PRINT "<D> Desenho da secao   <N> Detalhe do nivel   <Enter> Continua"
    LOCATE 24, 2: PRINT "Pagina "; LTRIM$(STR$(pag + 1)); " de "; LTRIM$(STR$(ultima + 1))
END SUB

' Pede o nivel e mostra o detalhe do dimensionamento dele.
' RECONSTRUCAO: o gatilho (N + numero do nivel) nao aparece no dump; a
' linha "Barras" (bitolas, estribos) tambem nao e rotulo do dump.
SUB DetalheNivel (c AS INTEGER)
    DIM n AS DOUBLE, k AS INTEGER, j AS INTEGER, lx AS DOUBLE, ly AS DOUBLE
    DIM fck AS DOUBLE, fyk AS DOUBLE, taxa AS DOUBLE, tipo AS STRING
    LOCATE 22, 3: PRINT "Numero do Nivel que sera Detalhado"
    n = EntradaNumero#(22, 40, 3, 1)
    k = INT(n)
    IF k < 1 OR k > ColNivQtd THEN EXIT SUB
    j = ColIdx%(c, k)
    ColLambda c, j, lx, ly
    ' RECONSTRUCAO: mesma conversao de unidade de Dimensiona (linha 16 do INI).
    fck = IniNumero#(17, 0.15#) * IniNumero#(16, 1#)
    fyk = IniNumero#(18, 5#) * IniNumero#(16, 1#)
    tipo = IniValor$(19)
    taxa = 100# * ColEsf(j).asTot / ColArea#(c)
    TelaCabecalho "DETALHE DO DIMENSIONAMENTO"
    LOCATE 5, 3: PRINT "OBRA - "; ColObra
    LOCATE 6, 3: PRINT "COLUNA - "; RTRIM$(Col(c).nome)
    LOCATE 7, 3: PRINT "Nivel "; RTRIM$(ColNiv(k).nome); " ("; FormataNumero$(ColNiv(k).cota, 2, 8); " m)"
    LOCATE 9, 3: PRINT "Lbx="; FormataNumero$(lx, 1, 8); "   Lby="; FormataNumero$(ly, 1, 8)
    LOCATE 10, 3: PRINT "Nk ="; FormataNumero$(ColEsf(j).N, 1, 9); " t"
    LOCATE 11, 3: PRINT "Mkx i ="; FormataNumero$(ColEsf(j).Mx, 1, 9); " t.m"
    LOCATE 12, 3: PRINT "Mky i ="; FormataNumero$(ColEsf(j).My, 1, 9); " t.m"
    LOCATE 13, 3: PRINT "Fck "; FormataNumero$(fck, 3, 9); "   Fyk "; FormataNumero$(fyk, 3, 9); "   ACO "; tipo; "   Cobrimento "; FormataNumero$(DL_COBRIMENTO, 1, 5); " cm"
    LOCATE 15, 3: PRINT "As "; FormataNumero$(ColEsf(j).asTot, 2, 8); " cm2   Taxa "; FormataNumero$(taxa, 2, 7); "%"
    LOCATE 17, 3: PRINT "Barras "; LTRIM$(STR$(ColEsf(j).nBarras)); " x "; FormataNumero$(ColEsf(j).phi, 1, 5); " mm   Estribos "; FormataNumero$(ColEsf(j).phiEstribo, 1, 5); " mm c/ "; FormataNumero$(ColEsf(j).sEstribo, 1, 5); " cm"
    ' distribuicao verificada em PeDimensionaArranjo (cantos incluidos em cada face)
    IF DimNfx(k) > 0 THEN LOCATE 18, 3: PRINT "Por face (com cantos): "; LTRIM$(STR$(DimNfx(k))); " nas faces de"; FormataNumero$(Col(c).by, 1, 6); " cm,"; STR$(DimNfy(k)); " nas de"; FormataNumero$(Col(c).bx, 1, 6); " cm"
    LOCATE 19, 3: PRINT LEFT$(DimAviso(k), 76)
    Espera "Detalhe do nivel " + RTRIM$(ColNiv(k).nome), 0
END SUB

' Lambda nas duas direcoes do nivel k (ver MostraDimensionamento).
SUB ColLambda (c AS INTEGER, j AS INTEGER, lx AS DOUBLE, ly AS DOUBLE)
    lx = PcEsbeltez#(ColEsf(j).lex * 100#, Col(c).by)
    ly = PcEsbeltez#(ColEsf(j).ley * 100#, Col(c).bx)
END SUB

' Area da secao em cm2: retangular bx*by; circular, bx e o diametro.
FUNCTION ColArea# (c AS INTEGER)
    IF RTRIM$(Col(c).secao) = "C" THEN
        ColArea# = PIAREA * Col(c).bx ^ 2 / 4#
    ELSE
        ColArea# = Col(c).bx * Col(c).by
    END IF
END FUNCTION

' Grava o contorno da secao da coluna c em <DirDados><ColObra>_<nome>.VET
' e mostra o desenho. Sem armadura: RECONSTRUCAO, o dump nao mostra o layout.
SUB DesenhaSecao (c AS INTEGER)
    DIM arq AS STRING, rotulo AS STRING, f AS INTEGER, s AS DOUBLE, alt AS DOUBLE, r AS DOUBLE
    arq = DirDados + ColObra + "_" + RTRIM$(Col(c).nome) + ".VET"
    f = VetAbre%(arq, "Secao da coluna " + RTRIM$(Col(c).nome))
    s = VET_MM_POR_CM
    IF RTRIM$(Col(c).secao) = "C" THEN
        r = Col(c).bx * s / 2#
        VetCirculo f, r, r, r, 1
        alt = 2# * r
        rotulo = "Coluna " + RTRIM$(Col(c).nome) + "  diametro " + LTRIM$(STR$(Col(c).bx)) + " cm"
    ELSE
        VetRetangulo f, 0#, 0#, Col(c).bx * s, Col(c).by * s, 1
        alt = Col(c).by * s
        rotulo = "Coluna " + RTRIM$(Col(c).nome) + "  " + LTRIM$(STR$(Col(c).bx)) + " x " + LTRIM$(STR$(Col(c).by)) + " cm"
    END IF
    VetTexto f, 0#, alt + 4#, 3#, 0#, 1, rotulo
    VetFecha f
    IF VetMostra%(arq) <> 1 THEN Espera "erro no processamento", -1
END SUB

' Pergunta S/N na posicao dada. S = -1, N = 0; Enter ou ESC devolvem o padrao.
FUNCTION PerguntaSN% (lin AS INTEGER, col AS INTEGER, texto AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    LOCATE lin, col: PRINT texto;
    DO
        k = UCASE$(TeclaLer$)
        IF k = "S" THEN PerguntaSN% = -1: EXIT FUNCTION
        IF k = "N" THEN PerguntaSN% = 0: EXIT FUNCTION
        IF k = CHR$(13) OR k = CHR$(27) THEN PerguntaSN% = padrao: EXIT FUNCTION
    LOOP
END FUNCTION

' Le do .PIP da parametrizacao (nome na linha 3 do PILAR.INI; pasta da linha 4
' ou a dos executaveis) os 10 parametros de "PREDIMENSIONAMENTO DA SECAO" para
' PpParam#. Uma vez por execucao. .PIP ausente ou com erro: avisa e ficam os
' valores da parametrizacao SISTRUT (padroes de PpParam#).
SUB PipCarrega
    STATIC lido AS INTEGER
    DIM nome AS STRING, arq AS STRING, i AS INTEGER, p AS INTEGER, q AS INTEGER, t AS STRING, v AS DOUBLE
    DIM vals(1 TO 10) AS DOUBLE
    IF lido THEN EXIT SUB
    lido = -1
    nome = "SISTRUT"
    IF IniCarrega% THEN
        IF IniValor$(3) <> "" THEN nome = IniValor$(3)
        arq = DirComBarra$(DirUtilizavel$(IniDirParam$)) + nome + ".PIP"
    END IF
    IF NOT _FILEEXISTS(arq) THEN arq = ComumDirExec$ + nome + ".PIP"
    IF ArqLer%(arq) < 0 THEN
        Espera "Arquivo parametrizacao " + nome + ".PIP   nao encontrado  Sera adotada a parametrizacao SISTRUT", -1
        EXIT SUB
    END IF
    i = ArqAchaTexto%("PREDIMENSIONAMENTO DA SECAO", 0)
    IF i > 0 THEN p = ArqAchaExato%("PARAMETROS", i)
    t = ""
    IF p > 0 THEN
        FOR q = 1 TO 10
            t = UCASE$(ParToken$(ArqLinha$(p + q), " ", 1))
            SELECT CASE q
                CASE 6, 9, 10
                    IF t <> "S" AND t <> "N" THEN p = 0: EXIT FOR
                    IF t = "S" THEN vals(q) = 1# ELSE vals(q) = 0#
                CASE ELSE
                    IF NOT NumeroValido%(t) THEN p = 0: EXIT FOR
                    vals(q) = VAL(t)
            END SELECT
        NEXT
    END IF
    IF p = 0 THEN
        Espera "Erro no Arquivo parametrizacao " + nome + ".PIP  ultimo dado lido " + t + "  Sera adotada a parametrizacao SISTRUT", -1
        EXIT SUB
    END IF
    FOR q = 1 TO 10
        v = PpParam#(q, vals(q), -1)
    NEXT
END SUB

' Numero maximo de colunas tratadas por vez (PILAR.INI linha 8, padrao 30).
FUNCTION MaxColunas%
    DIM n AS INTEGER
    n = INT(IniNumero#(8, 30#))
    IF n < 1 THEN n = 30
    MaxColunas% = n
END FUNCTION

FUNCTION NivNome$ (k AS INTEGER)
    NivNome$ = RTRIM$(ColNiv(k).nome)
END FUNCTION

' Secao em texto curto: "20x60" ou "D40".
FUNCTION SecaoTexto$ (tipo AS STRING, bx AS DOUBLE, by AS DOUBLE)
    IF UCASE$(tipo) = "C" THEN
        SecaoTexto$ = "D" + LTRIM$(STR$(bx))
    ELSE
        SecaoTexto$ = LTRIM$(STR$(bx)) + "x" + LTRIM$(STR$(by))
    END IF
END FUNCTION

' Menu de calculo (3.4): "Predimensionamento de Secao e Dimensionamento da Armadura".
' RECONSTRUCAO: o dump traz os quatro itens e "6 - *Retorno ao Menu Principal*";
' a numeracao 1 a 4 segue a ordem do dump e o item 5 chama o PIPROEDI
' ("Processar posicoes"), que antes ficava na tecla P do menu principal.
SUB MenuCalculo
    DIM k AS STRING
    PipCarrega
    DO
        TelaCabecalho "Predimensionamento de Secao e Dimensionamento da Armadura"
        LOCATE 6, 3: PRINT "Numero maximo de Colunas"; MaxColunas%; "     Posicionadas"; ColQtd; "Colunas"
        LOCATE 9, 20: PRINT "1  -  ";: TelaItemMenu 9, 26, "Predimensionamento de Secao"
        LOCATE 10, 20: PRINT "2  -  ";: TelaItemMenu 10, 26, "Dimensionamento da Armadura"
        LOCATE 11, 20: PRINT "3  -  ";: TelaItemMenu 11, 26, "Resumo de cargas Acumuladas"
        LOCATE 12, 20: PRINT "4  -  ";: TelaItemMenu 12, 26, "Momentos e Carga Normal / Diagramas"
        LOCATE 13, 20: PRINT "5  -  Processar posicoes (PIPROEDI)"
        LOCATE 14, 20: PRINT "6  -  *Retorno ao Menu Principal*"
        LOCATE 20, 3: PRINT "escolha opcao"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1", "P"
                Predimensiona
            CASE "2", "D"
                Dimensiona
            CASE "3", "R"
                ResumoFundacao
            CASE "4", "M"
                MomentosDiagramas
            CASE "5"
                ColSalvaSeMudou
                RunSubmodulo "PIPROEDI"
                ColRecarrega
            CASE "6", CHR$(13), CHR$(27), CHR$(0) + CHR$(60)
                EXIT DO
        END SELECT
    LOOP
    ColSalvaSeMudou
END SUB

' Pede as posicoes e predimensiona cada coluna (PredimColuna).
SUB Predimensiona
    DIM t AS STRING, n AS INTEGER, i AS INTEGER, c AS INTEGER, lin AS INTEGER
    DIM lista(1 TO DAD_MAXPIL) AS INTEGER
    TelaCabecalho "PREDIMENSIONAMENTO"
    LOCATE 5, 3: PRINT "Posicao  Coluna    Secao      Nivel         Carga (t)"
    FOR c = 1 TO ColQtd
        lin = 6 + c - 1
        IF lin > 19 THEN EXIT FOR
        LOCATE lin, 3
        PRINT RIGHT$("    " + LTRIM$(STR$(c)), 5); "    "; LEFT$(RTRIM$(Col(c).nome) + SPACE$(8), 8); "  "; LEFT$(Col(c).secao + " " + SecaoTexto$(Col(c).secao, Col(c).bx, Col(c).by) + SPACE$(9), 9); "  "; LEFT$(NivNome$(ColNivQtd) + SPACE$(12), 12); FormataNumero$(ColEsf(ColIdx%(c, ColNivQtd)).N, 2, 10)
    NEXT
    LOCATE 21, 3: PRINT "Numero da Posicao das Colunas que serao Predimensionadas"
    LOCATE 22, 3: PRINT "I/J/N a M/... /K *RETORNO*"
    t = EntradaTexto$(22, 31, 40, "")
    n = PpListaPosicoes%(t, ColQtd, lista(), MaxColunas%)
    FOR i = 1 TO n
        PredimColuna lista(i)
    NEXT
    ColSalvaSeMudou
END SUB

' Uma secao so, do topo a base, ainda sem medidas.
SUB PredimInicia
    PrQtd = 1: PrNiv(1) = ColNivQtd: PrEx(1) = 0: PrEy(1) = 0
    PrTipo(1) = "R": PrB(1) = 0: PrH(1) = 0
END SUB

' Nivel mais alto da secao s.
FUNCTION PrTopo% (s AS INTEGER)
    IF s >= PrQtd THEN PrTopo% = 1 ELSE PrTopo% = PrNiv(s + 1) + 1
END FUNCTION

' Predimensiona a coluna c: secao(oes), calculo, proposta e opcoes
' Aceita/Modifica/Retorna/Elimina/Cancela/Inicia/Varia.
SUB PredimColuna (c AS INTEGER)
    DIM t AS STRING, op AS STRING, fck AS DOUBLE, novo AS INTEGER, s AS INTEGER
    ' RECONSTRUCAO: Fck na unidade de grandeza (linha 16), como em Dimensiona.
    fck = IniNumero#(17, 0.15#) * IniNumero#(16, 1#)
    IniParaCalculo
    novo = -1
    IF PrdLe%(c) THEN
        TelaCabecalho "PREDIMENSIONAMENTO"
        LOCATE 6, 3: PRINT "Coluna ja predimensionada   "; RTRIM$(Col(c).nome); "   "; Col(c).secao; " "; SecaoTexto$(Col(c).secao, Col(c).bx, Col(c).by)
        LOCATE 8, 3: PRINT "Acione  * <Enter>  para manter a Secao para alteracoes"
        LOCATE 9, 3: PRINT "Predimensiono a Coluna novamente  S/*N* "
        t = UCASE$(LTRIM$(EntradaTexto$(9, 44, 2, "")))
        IF t = "*" THEN
            novo = 0
        ELSEIF t <> "S" THEN
            EXIT SUB
        END IF
    END IF
    IF novo THEN
        PredimInicia
        IF PredimDefineSecao%(c, 1) = 0 THEN EXIT SUB
    END IF
    DO
        PredimCalcula c, fck
        PredimMostra c, fck
        op = PredimOpcao$(c)
        SELECT CASE op
            CASE "A"
                PredimAceita c
                EXIT DO
            CASE "C"
                EXIT DO
            CASE "I"
                PredimInicia
                IF PredimDefineSecao%(c, 1) = 0 THEN EXIT DO
            CASE "R"
                s = 1
                IF PrQtd > 1 THEN
                    ' RECONSTRUCAO: o dump nao traz o pedido da secao a redefinir
                    LOCATE 23, 3: PRINT "Numero da Secao que sera redefinida *CANCELA* ";
                    s = INT(EntradaNumero#(23, 50, 3, 0))
                END IF
                IF s >= 1 AND s <= PrQtd THEN novo = PredimDefineSecao%(c, s)
            CASE "M"
                PredimExcentricidades c
            CASE "E"
                PredimElimina
            CASE "V"
                PredimVaria c
        END SELECT
    LOOP
END SUB

' Tipo e medidas da secao s. "?" = medida a predimensionar. Devolve -1, ou 0
' se o usuario escolheu FIM. RECONSTRUCAO: so retangular sem rotacao e circular
' cheia; poligonal, secao arquivada, rotacao e diametro interno nao entram.
FUNCTION PredimDefineSecao% (c AS INTEGER, s AS INTEGER)
    DIM k AS STRING, t AS STRING, a AS STRING, b AS STRING, r AS STRING, tipo AS STRING
    DIM va AS DOUBLE, vb AS DOUBLE
    PredimDefineSecao% = 0
    DO
        TelaCabecalho "PREDIMENSIONAMENTO"
        LOCATE 5, 3: PRINT "Coluna "; RTRIM$(Col(c).nome); "   Posicao"; c; "   NIVEL "; NivNome$(PrTopo%(s)); " a "; NivNome$(PrNiv(s))
        LOCATE 7, 20: PRINT "1  -  ";: TelaItemMenu 7, 26, "Retangular"
        LOCATE 8, 20: PRINT "2  -  ";: TelaItemMenu 8, 26, "Circular"
        LOCATE 9, 20: PRINT "3  -  ";: TelaItemMenu 9, 26, "Poligonal fechada"
        LOCATE 10, 20: PRINT "4  -  ";: TelaItemMenu 10, 26, "Leitura  de Secao arquivada"
        LOCATE 11, 20: PRINT "5  -  ";: TelaItemMenu 11, 26, "Alterar Drive e Diretorio"
        LOCATE 13, 20: PRINT "Escolha o tipo de secao  *FIM* "
        k = UCASE$(TeclaLer$)
        tipo = ""
        SELECT CASE k
            CASE "1", "R": tipo = "R"
            CASE "2", "C": tipo = "C"
            CASE "3", "P", "4", "L", "5", "A"
                Espera "Poligonal, secao arquivada e drive nao estao disponiveis no predimensionamento", -1
            CASE CHR$(13), CHR$(27), "F"
                EXIT FUNCTION
        END SELECT
        DO WHILE tipo <> ""
            LOCATE 15, 3: PRINT "Entre com a Secao da Coluna no Nivel indicado ou use o codigo auxiliar"
            LOCATE 16, 3: PRINT "?     tamanho nao determinado a ser predimensionado"
            LimpaLinha 18
            IF tipo = "R" THEN
                LOCATE 18, 3: PRINT "B(cm) , H(cm) [, Rotacao(*0*)] *RETORNO* "
                t = EntradaTexto$(18, 45, 20, "")
            ELSE
                LOCATE 18, 3: PRINT "Diametro(cm) [, Dinterno(cm) ]  *RETORNO* "
                t = EntradaTexto$(18, 46, 20, "")
            END IF
            IF LTRIM$(t) = "" THEN EXIT DO
            a = ParToken$(t, ",", 1): b = ParToken$(t, ",", 2): r = ParToken$(t, ",", 3)
            IF a = "?" THEN va = 0 ELSE va = VAL(a)
            IF b = "?" OR b = "" THEN vb = 0 ELSE vb = VAL(b)
            IF (a <> "?" AND va <= 0) OR (b <> "" AND b <> "?" AND vb <= 0) THEN
                Espera "Medida invalida: use numero maior que zero ou ?", -1
            ELSEIF tipo = "R" AND VAL(r) <> 0 THEN
                Espera "Rotacao diferente de 0 nao e aceita no predimensionamento", -1
            ELSEIF tipo = "C" AND vb > 0 THEN
                Espera "Secao circular vazada (Dinterno) nao e aceita no predimensionamento", -1
            ELSE
                PrTipo(s) = tipo: PrB(s) = va: PrH(s) = vb
                IF tipo = "C" THEN PrH(s) = 0
                PredimDefineSecao% = -1
                EXIT FUNCTION
            END IF
        LOOP
    LOOP
END FUNCTION

' Predimensiona as secoes em memoria (PpColuna, PILPRED.BM).
SUB PredimCalcula (c AS INTEGER, fck AS DOUBLE)
    PpColuna c, PrQtd, PrNiv(), PrTipo(), PrB(), PrH(), PrEx(), PrEy(), fck, PrBx(), PrBy(), PrOk(), PrS1(), PrK1(), PrS2(), PrK2(), PrN()
END SUB

' Tela de calculo: por secao, tensoes admissiveis e maximas e o nivel onde
' ocorrem; duas secoes por pagina, de cima para baixo.
SUB PredimMostra (c AS INTEGER, fck AS DOUBLE)
    DIM s AS INTEGER, lin AS INTEGER, k AS STRING, a1 AS DOUBLE, a2 AS DOUBLE, n AS INTEGER
    a1 = PpTensaoAdm#(PpParam#(1, 0, 0), fck): a2 = PpTensaoAdm#(PpParam#(2, 0, 0), fck)
    n = 0
    FOR s = PrQtd TO 1 STEP -1
        IF n MOD 2 = 0 THEN
            TelaCabecalho "PREDIMENSIONAMENTO"
            LOCATE 4, 40: PRINT "Coluna "; RTRIM$(Col(c).nome); "   Posicao"; c
            lin = 6
        END IF
        LOCATE lin, 3: PRINT "NIVEL "; NivNome$(PrTopo%(s)); " a "; NivNome$(PrNiv(s)); "     CARGA :"; FormataNumero$(PrN(s), 2, 10)
        LOCATE lin + 1, 3: PRINT "Compressao :"
        LOCATE lin + 1, 28: PRINT "tensao maxima admissivel "; FormataNumero$(a1, 3, 9)
        LOCATE lin + 2, 28: PRINT "maxima de "; FormataNumero$(PrS1(s), 3, 9); "  encontrada no NIVEL "; NivNome$(PrK1(s))
        LOCATE lin + 3, 3: PRINT "Compressao + Momento :"
        LOCATE lin + 3, 28: PRINT "tensao maxima admissivel "; FormataNumero$(a2, 3, 9)
        LOCATE lin + 4, 28: PRINT "maxima de "; FormataNumero$(PrS2(s), 3, 9); "  encontrada no NIVEL "; NivNome$(PrK2(s))
        LOCATE lin + 5, 3: PRINT "SECAO PROPOSTA : ";
        IF PrTipo(s) = "C" THEN PRINT "Diametro ="; PrBx(s); "cm"; ELSE PRINT "B ="; PrBx(s); "cm   H ="; PrBy(s); "cm";
        IF NOT PrOk(s) THEN COLOR COR_ERRO, COR_ERRO_FUNDO: PRINT "  CUIDADO ";: COLOR COR_TEXTO, 0
        lin = lin + 8: n = n + 1
        IF n MOD 2 = 0 OR s = 1 THEN
            LOCATE 23, 3: PRINT "<Enter> para seguir";
            k = TeclaLer$
        END IF
    NEXT
END SUB

' Proposta (uma linha por secao) e menu de opcoes. Devolve A, M, R, E, C, I ou V.
' RECONSTRUCAO: a letra de cada opcao e a primeira do texto, cortada no dump.
FUNCTION PredimOpcao$ (c AS INTEGER)
    DIM s AS INTEGER, lin AS INTEGER, k AS STRING, mx AS INTEGER
    mx = PR_MAXSEC: IF ColNivQtd < mx THEN mx = ColNivQtd
    TelaCabecalho "PREDIMENSIONAMENTO"
    LOCATE 4, 40: PRINT "Coluna "; RTRIM$(Col(c).nome); "   Posicao"; c
    lin = 5
    FOR s = PrQtd TO 1 STEP -1
        LOCATE lin, 3
        PRINT LTRIM$(STR$(s)); " NIVEL "; LEFT$(NivNome$(PrTopo%(s)) + " a " + NivNome$(PrNiv(s)) + SPACE$(24), 24); " CARGA :"; FormataNumero$(PrN(s), 2, 9); "  SECAO PROPOSTA : "; PrTipo(s); " "; SecaoTexto$(PrTipo(s), PrBx(s), PrBy(s));
        IF NOT PrOk(s) THEN COLOR COR_ERRO, COR_ERRO_FUNDO: PRINT " CUIDADO";: COLOR COR_TEXTO, 0
        lin = lin + 1
    NEXT
    TelaItemMenu 14, 5, "Aceita a Secao proposta e passa a predimensionar a proxima Coluna"
    TelaItemMenu 15, 5, "Modifica as excentricidades entre as diferentes Secoes"
    TelaItemMenu 16, 5, "Retorna a escolha do tipo de secao e redefine"
    TelaItemMenu 17, 5, "Elimina uma variacao de secao"
    TelaItemMenu 18, 5, "Cancela o predimensionamento e passa para proxima Coluna"
    TelaItemMenu 19, 5, "Inicia novamente o predimensionamento desta Coluna"
    TelaItemMenu 20, 5, "Varia a secao da Coluna entre os niveis (maximo" + STR$(mx) + " secoes)"
    LOCATE 22, 3: PRINT "escolha opcao"
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL LEN(k) = 1 AND INSTR("AMRECIV", k) > 0
    PredimOpcao$ = k
END FUNCTION

' Grava a secao proposta no .COL e as secoes no .PRD. O N de cada nivel troca o
' peso proprio da secao antiga pelo da nova (PpAplicaSecao, PILPRED.BM).
' RECONSTRUCAO: o .COL guarda uma secao por coluna (docs/formats/DADOS.md); vai
' a de baixo (secao 1), tambem no peso proprio de todos os niveis. Com variacao,
' avisa: o dimensionamento usara essa secao em todos os niveis.
SUB PredimAceita (c AS INTEGER)
    PpAplicaSecao c, PrTipo(1), PrBx(1), PrBy(1)
    ColMudou = -1
    PrdGrava c
    IF PrQtd > 1 THEN Espera "CUIDADO: o .COL guarda uma secao por coluna; gravada a do NIVEL " + NivNome$(PrNiv(1)) + " (secao 1)", -1
END SUB

' Distancias entre os centros de gravidade das secoes (Ex, Ey em cm).
' Xcg/Ycg = posicao da coluna (m no .COL, em cm aqui) somada as distancias.
SUB PredimExcentricidades (c AS INTEGER)
    DIM s AS INTEGER, n AS DOUBLE, t AS STRING, xcg AS DOUBLE, ycg AS DOUBLE
    IF PrQtd < 2 THEN Espera "Coluna com uma so secao: nao ha excentricidade entre secoes", 0: EXIT SUB
    DO
        TelaCabecalho "PREDIMENSIONAMENTO"
        LOCATE 5, 2: PRINT "Entre com a distancia a PARTIR do Centro de Gravidade da Secao do Nivel"
        LOCATE 6, 2: PRINT "inferior, ate o centro de gravidade da Secao do Nivel Superior  (cm)"
        xcg = Col(c).x * 100#: ycg = Col(c).y * 100#
        FOR s = 1 TO PrQtd
            xcg = xcg + PrEx(s): ycg = ycg + PrEy(s)
            LOCATE 7 + s, 2
            PRINT LTRIM$(STR$(s)); " NIVEL "; LEFT$(NivNome$(PrNiv(s)) + SPACE$(12), 12); "  Xcg="; FormataNumero$(xcg, 2, 9); "  Ycg="; FormataNumero$(ycg, 2, 9); "  Ex="; FormataNumero$(PrEx(s), 2, 8); "  Ey="; FormataNumero$(PrEy(s), 2, 8)
        NEXT
        LOCATE 20, 2: PRINT "Numero da Secao do Nivel superior que deseja alterar *FIM* "
        n = EntradaNumero#(20, 62, 3, 0)
        s = INT(n)
        IF s < 2 OR s > PrQtd THEN EXIT DO
        LOCATE 21, 2: PRINT "Ex , Ey (cm) "
        t = EntradaTexto$(21, 16, 20, LTRIM$(STR$(PrEx(s))) + "," + LTRIM$(STR$(PrEy(s))))
        PrEx(s) = VAL(ParToken$(t, ",", 1)): PrEy(s) = VAL(ParToken$(t, ",", 2))
    LOOP
END SUB

' Escolhe e elimina uma variacao de secao (secao 2 em diante).
SUB PredimElimina
    DIM s AS INTEGER, k AS STRING
    IF PrQtd < 2 THEN Espera "Coluna com uma so secao: nao ha variacao para eliminar", 0: EXIT SUB
    TelaCabecalho "Eliminacao de variacao de secao"
    FOR s = 2 TO PrQtd
        LOCATE 5 + s, 3: PRINT LTRIM$(STR$(s)); "  NIVEL "; NivNome$(PrTopo%(s)); " a "; NivNome$(PrNiv(s)); "   "; PrTipo(s); " "; SecaoTexto$(PrTipo(s), PrBx(s), PrBy(s))
    NEXT
    LOCATE 20, 3: PRINT "Escolha a secao que deseja Eliminar  "
    s = INT(EntradaNumero#(20, 40, 3, 0))
    IF s < 2 OR s > PrQtd THEN EXIT SUB
    LOCATE 21, 3: PRINT "Acione  <Enter> para Eliminar,  <R> para Retornar "
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k = CHR$(13) OR k = "R" OR k = CHR$(27)
    IF k = CHR$(13) THEN PredimRemove s
END SUB

' Tira a secao s (>= 2): os niveis dela passam para a secao de baixo e a de
' cima mantem a posicao do seu CG (soma a distancia da secao tirada).
SUB PredimRemove (s AS INTEGER)
    DIM i AS INTEGER
    IF s < PrQtd THEN PrEx(s + 1) = PrEx(s + 1) + PrEx(s): PrEy(s + 1) = PrEy(s + 1) + PrEy(s)
    FOR i = s TO PrQtd - 1
        PrNiv(i) = PrNiv(i + 1): PrTipo(i) = PrTipo(i + 1): PrB(i) = PrB(i + 1): PrH(i) = PrH(i + 1)
        PrEx(i) = PrEx(i + 1): PrEy(i) = PrEy(i + 1)
    NEXT
    PrQtd = PrQtd - 1
END SUB

' Pede o nivel (numero ou nome) na linha lin. "*" lista os niveis.
' Devolve o numero do nivel ou 0 (CANCELA).
FUNCTION NivelPede% (lin AS INTEGER)
    DIM t AS STRING, k AS INTEGER, i AS INTEGER
    NivelPede% = 0
    DO
        LOCATE lin, 3: PRINT "Numero ou Nome *CANCELA* "
        t = UCASE$(LTRIM$(RTRIM$(EntradaTexto$(lin, 29, 12, ""))))
        IF t = "" THEN EXIT FUNCTION
        IF t = "*" THEN
            TelaCabecalho "NIVEL"
            FOR i = 1 TO ColNivQtd
                IF i > 18 THEN EXIT FOR
                LOCATE 4 + i, 3: PRINT RIGHT$("  " + LTRIM$(STR$(i)), 3); "  "; NivNome$(i)
            NEXT
            Espera "Niveis definidos (1 = topo)", 0
            EXIT FUNCTION
        END IF
        k = 0
        IF NumeroValido%(t) THEN
            k = INT(VAL(t))
        ELSE
            FOR i = 1 TO ColNivQtd
                IF UCASE$(NivNome$(i)) = t THEN k = i
            NEXT
        END IF
        IF k >= 1 AND k <= ColNivQtd THEN NivelPede% = k: EXIT FUNCTION
        TelaErro "Nivel nao encontrado"
    LOOP
END FUNCTION

' Cria uma secao nova a partir de um nivel (ele e os de cima).
SUB PredimVaria (c AS INTEGER)
    DIM k AS INTEGER, s AS INTEGER, p AS INTEGER, mx AS INTEGER, t AS STRING
    mx = PR_MAXSEC: IF ColNivQtd < mx THEN mx = ColNivQtd
    IF PrQtd >= mx THEN Espera "Varia a secao da Coluna entre os niveis (maximo" + STR$(mx) + " secoes)", -1: EXIT SUB
    TelaCabecalho "PREDIMENSIONAMENTO"
    LOCATE 5, 3: PRINT "Varia a secao da Coluna entre os niveis (maximo"; mx; "secoes)"
    LOCATE 7, 3: PRINT "Nivel a partir do qual (superiores) teremos uma nova secao"
    LOCATE 8, 3: PRINT "* <Enter>  para visualizar os Niveis definidos"
    k = NivelPede%(9)
    IF k < 1 THEN EXIT SUB
    FOR s = 1 TO PrQtd
        IF PrNiv(s) = k THEN Espera "Ja existe secao a partir do NIVEL " + NivNome$(k), -1: EXIT SUB
    NEXT
    IF PerguntaSN%(11, 3, "Confirme uma nova secao a partir do NIVEL " + NivNome$(k) + "  N/*S* ", -1) = 0 THEN EXIT SUB
    p = PrQtd + 1
    FOR s = PrQtd TO 1 STEP -1
        IF PrNiv(s) < k THEN p = s
    NEXT
    FOR s = PrQtd TO p STEP -1
        PrNiv(s + 1) = PrNiv(s): PrTipo(s + 1) = PrTipo(s): PrB(s + 1) = PrB(s): PrH(s + 1) = PrH(s)
        PrEx(s + 1) = PrEx(s): PrEy(s + 1) = PrEy(s)
    NEXT
    PrQtd = PrQtd + 1
    PrNiv(p) = k: PrEx(p) = 0: PrEy(p) = 0: PrTipo(p) = PrTipo(p - 1): PrB(p) = 0: PrH(p) = 0
    IF PredimDefineSecao%(c, p) = 0 THEN PredimRemove p: EXIT SUB
    TelaCabecalho "PREDIMENSIONAMENTO"
    LOCATE 5, 2: PRINT "Entre com a distancia a PARTIR do Centro de Gravidade da Secao do Nivel"
    LOCATE 6, 2: PRINT "inferior, ate o centro de gravidade da Secao do Nivel Superior  (cm)"
    LOCATE 8, 2: PRINT "NIVEL "; NivNome$(k); "   Ex , Ey (cm) "
    t = EntradaTexto$(8, 40, 20, "0,0")
    PrEx(p) = VAL(ParToken$(t, ",", 1)): PrEy(p) = VAL(ParToken$(t, ",", 2))
END SUB

' Arquivo auxiliar das secoes predimensionadas: <DirDados><obra>.PRD.
' Formato (texto, uma linha por coluna depois do cabecalho):
'   SISTRUT40 PRD 1 <obra>
'   <nome>|<q>|<niv>,<tipo>,<B>,<H>,<Ex>,<Ey>,<bx>,<by>|... (q grupos, secao 1 = base)
' B/H = medidas dadas (0 = ?); bx/by = secao proposta e aceita.
FUNCTION ArqPredim$
    ArqPredim$ = DirDados + ColObra + ".PRD"
END FUNCTION

' Carrega em Pr*() as secoes gravadas da coluna c. Devolve -1 se havia registro.
FUNCTION PrdLe% (c AS INTEGER)
    DIM f AS INTEGER, l AS STRING, s AS INTEGER, g AS STRING, q AS INTEGER
    PrdLe% = 0
    IF NOT _FILEEXISTS(ArqPredim$) THEN EXIT FUNCTION
    f = FREEFILE
    OPEN ArqPredim$ FOR INPUT AS #f
    DO WHILE NOT EOF(f)
        LINE INPUT #f, l
        IF ParToken$(l, "|", 1) = RTRIM$(Col(c).nome) THEN
            q = INT(VAL(ParToken$(l, "|", 2)))
            IF q >= 1 AND q <= PR_MAXSEC THEN
                PrQtd = q
                FOR s = 1 TO q
                    g = ParToken$(l, "|", 2 + s)
                    PrNiv(s) = INT(VAL(ParToken$(g, ",", 1))): PrTipo(s) = ParToken$(g, ",", 2)
                    PrB(s) = VAL(ParToken$(g, ",", 3)): PrH(s) = VAL(ParToken$(g, ",", 4))
                    PrEx(s) = VAL(ParToken$(g, ",", 5)): PrEy(s) = VAL(ParToken$(g, ",", 6))
                    IF PrNiv(s) < 1 OR PrNiv(s) > ColNivQtd THEN PrQtd = 0
                NEXT
                IF PrQtd > 0 THEN PrNiv(1) = ColNivQtd: PrdLe% = -1
            END IF
        END IF
    LOOP
    CLOSE #f
END FUNCTION

' Regrava o .PRD trocando (ou acrescentando) o registro da coluna c.
SUB PrdGrava (c AS INTEGER)
    DIM f AS INTEGER, l AS STRING, s AS INTEGER, nome AS STRING, n AS INTEGER, i AS INTEGER
    DIM outras(1 TO DAD_MAXPIL) AS STRING
    nome = RTRIM$(Col(c).nome)
    IF _FILEEXISTS(ArqPredim$) THEN
        f = FREEFILE
        OPEN ArqPredim$ FOR INPUT AS #f
        DO WHILE NOT EOF(f)
            LINE INPUT #f, l
            IF INSTR(l, "|") > 0 AND ParToken$(l, "|", 1) <> nome AND n < DAD_MAXPIL THEN n = n + 1: outras(n) = l
        LOOP
        CLOSE #f
    END IF
    l = nome + "|" + LTRIM$(STR$(PrQtd))
    FOR s = 1 TO PrQtd
        l = l + "|" + LTRIM$(STR$(PrNiv(s))) + "," + PrTipo(s) + "," + NumTexto$(PrB(s)) + "," + NumTexto$(PrH(s)) + "," + NumTexto$(PrEx(s)) + "," + NumTexto$(PrEy(s)) + "," + NumTexto$(PrBx(s)) + "," + NumTexto$(PrBy(s))
    NEXT
    f = FREEFILE
    OPEN ArqPredim$ FOR OUTPUT AS #f
    PRINT #f, "SISTRUT40 PRD 1 " + ColObra
    FOR i = 1 TO n
        PRINT #f, outras(i)
    NEXT
    PRINT #f, l
    CLOSE #f
END SUB

' Resumo de cargas acumuladas na fundacao (3.5): parametros, impressao opcional
' em <DirDados><obra>_FUND.LST e tabela na tela, 14 colunas por pagina.
' RECONSTRUCAO: parametros alterados valem so nesta execucao (o SISTRUT.PIP
' nao deve ser alterado, ver SISEDIT); a "impressao" grava o arquivo .LST.
SUB ResumoFundacao
    DIM imprime AS INTEGER, t AS STRING, f AS INTEGER, c AS INTEGER, lin AS INTEGER, k AS STRING, v AS DOUBLE
    DIM cab1 AS STRING, cab2 AS STRING
    cab1 = " Coluna     Carga      Peso    Fundacao     Mx       My    Secao       As"
    cab2 = "          Acumulada   Proprio            fundacao fundacao          fundacao"
    DO
        TelaCabecalho "Resumo de Cargas acumuladas na Fundacao"
        FundParametros
        IF PerguntaSN%(14, 3, "Deseja alterar os parametros S/*N* ", 0) = 0 THEN EXIT DO
        v = PpParam#(9, -PerguntaSN%(16, 3, "Reduzo cargas acidentais para fundacao (S/N) ", PpParam#(9, 0, 0) <> 0), -1)
        LOCATE 17, 3: PRINT "Porcentagem da carga considerada acidental (%) "
        v = PpParam#(8, EntradaNumero#(17, 52, 6, PpParam#(8, 0, 0)), -1)
        v = PpParam#(6, -PerguntaSN%(18, 3, "Acrescento o peso Proprio (S/N) ", PpParam#(6, 0, 0) <> 0), -1)
        LOCATE 19, 3: PRINT "Densidade do Concreto (t/m3) "
        v = PpParam#(7, EntradaNumero#(19, 34, 6, PpParam#(7, 0, 0)), -1)
    LOOP
    imprime = PerguntaSN%(16, 3, "Deseja imprimir o  relatorio S/*N* ", 0)
    IF imprime THEN
        LOCATE 18, 3: PRINT "<Enter> para seguir ou * <Enter> para nao avancar o formulario :"
        t = EntradaTexto$(18, 69, 2, "")
        f = FREEFILE
        OPEN DirDados + ColObra + "_FUND.LST" FOR OUTPUT AS #f
        IF LTRIM$(t) <> "*" THEN PRINT #f, CHR$(12);
        PRINT #f, "RESUMO DE CARGAS NA FUNDACAO"
        PRINT #f, "Obra - " + ColObra
        PRINT #f, cab1
        PRINT #f, cab2
        FOR c = 1 TO ColQtd
            PRINT #f, FundLinha$(c)
        NEXT
        CLOSE #f
    END IF
    IF ColQtd = 0 THEN Espera "Nenhum Arquivo Encontrado", 0: EXIT SUB
    c = 1
    DO WHILE c <= ColQtd
        TelaCabecalho "RESUMO DE CARGAS NA FUNDACAO"
        LOCATE 5, 2: PRINT "Obra - "; ColObra
        LOCATE 6, 1: PRINT cab1
        LOCATE 7, 1: PRINT cab2
        FOR lin = 8 TO 21
            IF c > ColQtd THEN EXIT FOR
            LOCATE lin, 1: PRINT FundLinha$(c)
            c = c + 1
        NEXT
        IF imprime THEN LOCATE 22, 2: PRINT "Relatorio gravado em "; DirCurto$(DirDados + ColObra + "_FUND.LST", 55)
        LOCATE 23, 2: PRINT "Qualquer tecla para Continuar"
        k = TeclaLer$
    LOOP
END SUB

' Mostra os parametros da fundacao (linhas 6 a 11).
SUB FundParametros
    DIM sn AS STRING
    LOCATE 6, 3: PRINT "Parametros que influenciam as cargas na fundacao"
    IF PpParam#(9, 0, 0) <> 0 THEN sn = "S" ELSE sn = "N"
    LOCATE 8, 3: PRINT "Reduzo cargas acidentais para fundacao = "; sn
    LOCATE 9, 3: PRINT "Porcentagem da carga considerada acidental = "; LTRIM$(FormataNumero$(PpParam#(8, 0, 0), 0, 3)); "%"
    IF PpParam#(6, 0, 0) <> 0 THEN sn = "S" ELSE sn = "N"
    LOCATE 10, 3: PRINT "Acrescento o peso Proprio = "; sn
    LOCATE 11, 3: PRINT "Densidade do Concreto (t/m3) = "; LTRIM$(FormataNumero$(PpParam#(7, 0, 0), 2, 6))
END SUB

' Linha do resumo da fundacao da coluna c (PpFundacao; momentos e As do nivel mais baixo).
FUNCTION FundLinha$ (c AS INTEGER)
    DIM carga AS DOUBLE, pp AS DOUBLE, fund AS DOUBLE, j AS INTEGER
    PpFundacao c, carga, pp, fund
    j = ColIdx%(c, ColNivQtd)
    FundLinha$ = " " + LEFT$(RTRIM$(Col(c).nome) + SPACE$(9), 9) + FormataNumero$(carga, 2, 8) + "   " + FormataNumero$(pp, 2, 7) + "  " + FormataNumero$(fund, 2, 8) + "  " + FormataNumero$(ColEsf(j).Mx, 1, 7) + "  " + FormataNumero$(ColEsf(j).My, 1, 7) + "  " + LEFT$(Col(c).secao + " " + SecaoTexto$(Col(c).secao, Col(c).bx, Col(c).by) + SPACE$(8), 8) + FormataNumero$(ColEsf(j).asTot, 2, 8) + " cm2"
END FUNCTION

' Momentos e carga normal por nivel das colunas pedidas, com diagramas.
SUB MomentosDiagramas
    DIM t AS STRING, n AS INTEGER, i AS INTEGER
    DIM lista(1 TO DAD_MAXPIL) AS INTEGER
    TelaCabecalho "Momentos e Carga Normal / Diagramas"
    LOCATE 20, 3: PRINT "Numero da Posicao das Colunas que serao Listadas"
    LOCATE 21, 3: PRINT "I/J/N a M/... /K *RETORNO*"
    t = EntradaTexto$(21, 31, 40, "")
    n = PpListaPosicoes%(t, ColQtd, lista(), MaxColunas%)
    FOR i = 1 TO n
        MomentosColuna lista(i)
    NEXT
END SUB

' Tabela por nivel (14 por pagina) de N, Mx e My da coluna c. <D> mostra os diagramas.
' RECONSTRUCAO: o dump so traz os titulos CARGA ACUMULADA, MOMENTOS e NIVEL;
' o layout da tabela e a tecla <D> sao desta reconstrucao.
SUB MomentosColuna (c AS INTEGER)
    DIM pag AS INTEGER, ultima AS INTEGER, k AS INTEGER, j AS INTEGER, tecla AS STRING
    ultima = (ColNivQtd - 1) \ 14
    FOR pag = 0 TO ultima
        DO
            TelaCabecalho "Momentos e Carga Normal / Diagramas"
            LOCATE 5, 2: PRINT "COLUNA - "; RTRIM$(Col(c).nome); "   Secao "; Col(c).secao; " "; SecaoTexto$(Col(c).secao, Col(c).bx, Col(c).by); "   Obra - "; ColObra
            LOCATE 6, 2: PRINT "NIVEL          Cota (m)   CARGA ACUMULADA (t)   MOMENTOS  Mx (t.m)   My (t.m)"
            FOR k = pag * 14 + 1 TO pag * 14 + 14
                IF k > ColNivQtd THEN EXIT FOR
                j = ColIdx%(c, k)
                LOCATE 7 + (k - 1) MOD 14, 2
                PRINT LEFT$(NivNome$(k) + SPACE$(12), 12); FormataNumero$(ColNiv(k).cota, 2, 10); FormataNumero$(ColEsf(j).N, 2, 18); SPACE$(4); FormataNumero$(ColEsf(j).Mx, 2, 17); FormataNumero$(ColEsf(j).My, 2, 11)
            NEXT
            LOCATE 23, 2: PRINT "<D> Diagramas   <Enter> Continua"
            LOCATE 24, 2: PRINT "Pagina "; LTRIM$(STR$(pag + 1)); " de "; LTRIM$(STR$(ultima + 1))
            DO
                tecla = UCASE$(TeclaLer$)
            LOOP UNTIL tecla = "D" OR tecla = CHR$(13) OR tecla = CHR$(27)
            IF tecla <> "D" THEN EXIT DO
            DiagramaColuna c
        LOOP
    NEXT
END SUB

' Diagramas de carga normal e momentos da coluna c, um nivel por faixa (topo em
' cima), gravados em <DirDados><obra>_<coluna>_D.VET e mostrados em SCREEN 12.
' Cada painel: o valor escrito a esquerda, eixo vertical e barra horizontal por
' nivel proporcional ao valor (momentos com eixo no centro, para o sinal).
SUB DiagramaColuna (c AS INTEGER)
    DIM arq AS STRING, f AS INTEGER, p AS INTEGER, k AS INTEGER, j AS INTEGER, mx AS DOUBLE, v AS DOUBLE
    DIM xa AS DOUBLE, y AS DOUBLE, yAnt AS DOUBLE, xAnt AS DOUBLE, x AS DOUBLE, esc AS DOUBLE, topo AS DOUBLE, tit AS STRING
    DIM dy AS DOUBLE, larg AS DOUBLE, x0 AS DOUBLE, passo AS DOUBLE, xp AS DOUBLE
    dy = 12#: larg = 60#: x0 = 34#: passo = 92#
    arq = DirDados + ColObra + "_" + RTRIM$(Col(c).nome) + "_D.VET"
    f = VetAbre%(arq, "Momentos e Carga Normal / Diagramas - COLUNA " + RTRIM$(Col(c).nome))
    topo = (ColNivQtd + 1) * dy
    FOR k = 1 TO ColNivQtd
        VetTexto f, 0#, topo - k * dy + 2#, 3#, 0#, 7, NivNome$(k)
    NEXT
    FOR p = 1 TO 3
        SELECT CASE p
            CASE 1: tit = "CARGA ACUMULADA (t)"
            CASE 2: tit = "MOMENTOS Mx (t.m)"
            CASE ELSE: tit = "MOMENTOS My (t.m)"
        END SELECT
        xp = x0 + (p - 1) * passo
        mx = 0#
        FOR k = 1 TO ColNivQtd
            j = ColIdx%(c, k)
            SELECT CASE p
                CASE 1: v = ColEsf(j).N
                CASE 2: v = ColEsf(j).Mx
                CASE ELSE: v = ColEsf(j).My
            END SELECT
            IF ABS(v) > mx THEN mx = ABS(v)
        NEXT
        IF p = 1 THEN xa = xp + 26#: esc = larg ELSE xa = xp + 26# + larg / 2#: esc = larg / 2#
        IF mx > 0# THEN esc = esc / mx ELSE esc = 0#
        VetTexto f, xp, topo + dy / 2#, 3#, 0#, 14, tit
        VetLinha f, xa, topo, xa, dy / 2#, 15
        xAnt = xa: yAnt = topo
        FOR k = 1 TO ColNivQtd
            j = ColIdx%(c, k)
            SELECT CASE p
                CASE 1: v = ColEsf(j).N
                CASE 2: v = ColEsf(j).Mx
                CASE ELSE: v = ColEsf(j).My
            END SELECT
            y = topo - k * dy
            x = xa + v * esc
            VetLinha f, xa, y, x, y, 10 + p
            VetLinha f, xAnt, yAnt, x, y, 10 + p
            VetTexto f, xp, y + 2#, 3#, 0#, 7, LTRIM$(FormataNumero$(v, 2, 9))
            xAnt = x: yAnt = y
        NEXT
    NEXT
    VetFecha f
    IF VetMostra%(arq) <> 1 THEN Espera "erro no processamento", -1
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: 'PILCALC.BM'
'$INCLUDE: 'PILEDCAL.BM'
'$INCLUDE: 'PILPRED.BM'
