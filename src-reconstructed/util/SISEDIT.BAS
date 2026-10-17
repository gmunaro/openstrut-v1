' ============================================================================
'  SISEDIT.BAS - editor de tela cheia dos arquivos de parametrizacao SISTRUT
'  Edita .INI, .LAP, .PIP, .FOP, .DSP e PLOTER.INI em tela 80x25 (texto).
'  Uso: SISEDIT [arquivo]. Sem argumento, pede o nome do arquivo no inicio.
'  Teclas: setas, PgUp/PgDn, Home/End, Ctrl+Home/End, Tab, Del, Backspace,
'  Enter (divide a linha), ESC (menu Ler/Salvar/Deletar/Incluir/Fim), F1 (ajuda).
' ============================================================================
'$INCLUDE: '../common/SISCOMUM.BI'

CONST ED_LARG_MAX = 200                 ' comprimento maximo de uma linha
CONST ED_LIN_TOPO = 3                   ' primeira linha da area de texto
CONST ED_LIN_BASE = 22                  ' ultima linha da area de texto (20 linhas)
CONST ED_LARG_TELA = 79                 ' colunas visiveis do texto (a 80a fica livre)

DIM SHARED EdNome$                      ' arquivo carregado; vazio se nenhum
DIM SHARED EdAlterado%                  ' -1 se o texto mudou desde a ultima gravacao
DIM SHARED EdLin%, EdCol%               ' cursor: linha (1..ArqQtd) e coluna (1..)
DIM SHARED EdTopo%                      ' primeira linha exibida na area de texto
DIM SHARED EdMsg$, EdErr$               ' mensagens das linhas 25 e 24
DIM SHARED EdFim%                       ' -1 quando o usuario confirmou Fim
DIM SHARED EdSoLeitura%                 ' -1 se o arquivo lido foi cortado em ARQ_MAX linhas

DECLARE SUB EdRedesenha ()
DECLARE SUB EdLimpaArea (l1%, l2%)
DECLARE SUB EdTecla (k$)
DECLARE SUB EdMenu ()
DECLARE SUB EdLer ()
DECLARE SUB EdSalvar ()
DECLARE SUB EdCarregar (nome$)
DECLARE SUB EdDeletarLinha ()
DECLARE SUB EdIncluirLinha ()
DECLARE SUB EdFimPedido ()
DECLARE SUB EdAjuda ()
DECLARE SUB EdEsperaEnter ()
DECLARE SUB EdInsereLinha (n%, txt$)
DECLARE SUB EdRemoveLinha (n%)
DECLARE FUNCTION EdPedeNome$ (padrao$)
DECLARE FUNCTION EdConfirma% (texto$, padraoSim%)
DECLARE FUNCTION EdProtegido% (nome$)

' ---- programa principal ----------------------------------------------------
DIM k$

SCREEN 0: WIDTH 80, 25
COLOR COR_TEXTO, 0
CLS

ArqQtd = 1
ArqDados$(1) = ""
EdLin% = 1: EdCol% = 1: EdTopo% = 1
EdNome$ = LTRIM$(RTRIM$(COMMAND$))
IF EdNome$ = "" THEN
    EdLer
ELSE
    EdCarregar EdNome$
END IF

EdFim% = 0
DO
    EdRedesenha
    k$ = TeclaLer$
    EdMsg$ = ""
    EdErr$ = ""
    IF k$ = CHR$(27) THEN
        EdMenu
    ELSEIF k$ = CHR$(0) + CHR$(59) THEN
        EdAjuda
    ELSE
        EdTecla k$
    END IF
LOOP UNTIL EdFim%

CLS
LOCATE 12, 15
PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' ---- tela ------------------------------------------------------------------

' Desenha cabecalho, texto, barra de teclas e linhas de erro/estado.
' Ajusta o cursor e a janela antes de desenhar, para que o cursor fique visivel.
SUB EdRedesenha
    DIM r%, idx%, jan%, txt$, cab$
    IF EdLin% > ArqQtd THEN EdLin% = ArqQtd
    IF EdLin% < 1 THEN EdLin% = 1
    IF EdCol% > LEN(ArqDados$(EdLin%)) + 1 THEN EdCol% = LEN(ArqDados$(EdLin%)) + 1
    IF EdCol% < 1 THEN EdCol% = 1
    IF EdLin% < EdTopo% THEN EdTopo% = EdLin%
    IF EdLin% > EdTopo% + 19 THEN EdTopo% = EdLin% - 19

    COLOR COR_TEXTO, 0
    LOCATE 1, 1
    PRINT LEFT$("OpenStrut                                 Versao 4.0   Abril 1991     EDITOR" + SPACE$(79), 79);

    cab$ = "Arquivo:                                           Linha:        Coluna:"
    LOCATE 2, 1: PRINT cab$;
    LOCATE 2, 10: PRINT LEFT$(EdNome$ + SPACE$(40), 40);
    LOCATE 2, INSTR(cab$, "Linha:") + 7: PRINT RIGHT$("     " + LTRIM$(STR$(EdLin%)), 5);
    LOCATE 2, INSTR(cab$, "Coluna:") + 8: PRINT RIGHT$("    " + LTRIM$(STR$(EdCol%)), 4);

    ' janela horizontal: o cursor nunca sai da coluna 79 visivel
    jan% = 0
    IF EdCol% > ED_LARG_TELA THEN jan% = EdCol% - ED_LARG_TELA
    FOR r% = 0 TO ED_LIN_BASE - ED_LIN_TOPO
        idx% = EdTopo% + r%
        txt$ = ""
        IF idx% <= ArqQtd THEN txt$ = MID$(ArqDados$(idx%), jan% + 1, ED_LARG_TELA)
        LOCATE ED_LIN_TOPO + r%, 1
        PRINT LEFT$(txt$ + SPACE$(ED_LARG_TELA), ED_LARG_TELA);
    NEXT

    LOCATE 23, 1
    COLOR COR_TEXTO, 0
    PRINT LEFT$("<ESC>=Acesso as funcoes Ler/Salvar/Deletar/Incluir/Fim     <F1>=Informacoes" + SPACE$(79), 79);

    TelaErro EdErr$
    IF EdMsg$ = "" THEN
        ' RECONSTRUCAO: o DOS mostrava a memoria livre do sistema. O QB64-PE nao
        ' implementa FRE(-1) ("Command not implemented"), entao o valor e "n/d".
        TelaStatus "Memoria Livre disponivel: n/d"
    ELSE
        TelaStatus EdMsg$
    END IF

    LOCATE ED_LIN_TOPO + (EdLin% - EdTopo%), EdCol% - jan%, 1
END SUB

' Apaga as linhas l1% a l2% (inclusive) da tela.
SUB EdLimpaArea (l1%, l2%)
    DIM l%
    COLOR COR_TEXTO, 0
    FOR l% = l1% TO l2%
        LOCATE l%, 1
        PRINT SPACE$(79);
    NEXT
END SUB

' Espera Enter com a mensagem de continuacao na linha 25. Nao redesenha a tela.
SUB EdEsperaEnter
    DIM k$
    TelaStatus "Acione <Enter> para Continuar "
    DO
        k$ = TeclaLer$
    LOOP UNTIL k$ = CHR$(13)
END SUB

' ---- teclas de edicao --------------------------------------------------------

' Trata uma tecla de edicao (setas, paginacao, Del, Backspace, Enter e caracteres).
' ESC e F1 ficam fora daqui: sao tratados no laco principal.
SUB EdTecla (k$)
    DIM txt$
    txt$ = ArqDados$(EdLin%)
    SELECT CASE k$
        CASE CHR$(0) + CHR$(72)                 ' seta para cima
            IF EdLin% > 1 THEN EdLin% = EdLin% - 1
        CASE CHR$(0) + CHR$(80)                 ' seta para baixo
            IF EdLin% < ArqQtd THEN EdLin% = EdLin% + 1
        CASE CHR$(0) + CHR$(75)                 ' seta para esquerda
            IF EdCol% > 1 THEN
                EdCol% = EdCol% - 1
            ELSEIF EdLin% > 1 THEN
                EdLin% = EdLin% - 1
                EdCol% = LEN(ArqDados$(EdLin%)) + 1
            END IF
        CASE CHR$(0) + CHR$(77)                 ' seta para direita
            IF EdCol% <= LEN(txt$) THEN
                EdCol% = EdCol% + 1
            ELSEIF EdLin% < ArqQtd THEN
                EdLin% = EdLin% + 1
                EdCol% = 1
            END IF
        CASE CHR$(0) + CHR$(73)                 ' PgUp: sobe 10 linhas
            EdLin% = EdLin% - 10
            IF EdLin% < 1 THEN EdLin% = 1
        CASE CHR$(0) + CHR$(81)                 ' PgDn: desce 10 linhas
            EdLin% = EdLin% + 10
            IF EdLin% > ArqQtd THEN EdLin% = ArqQtd
        CASE CHR$(0) + CHR$(71)                 ' Home: inicio da linha
            EdCol% = 1
        CASE CHR$(0) + CHR$(79)                 ' End: fim da linha
            EdCol% = LEN(txt$) + 1
        CASE CHR$(0) + CHR$(119)                ' Ctrl+Home: inicio do texto
            EdLin% = 1: EdCol% = 1
        CASE CHR$(0) + CHR$(117)                ' Ctrl+End: fim do texto
            EdLin% = ArqQtd: EdCol% = LEN(ArqDados$(ArqQtd)) + 1
        CASE CHR$(9)                            ' Tab: avanca para a proxima parada de 8
            EdCol% = (INT((EdCol% - 1) / 8) + 1) * 8 + 1
            IF EdCol% > LEN(txt$) + 1 THEN EdCol% = LEN(txt$) + 1
        CASE CHR$(0) + CHR$(15)                 ' Shift+Tab: volta a parada anterior
            IF EdCol% > 1 THEN EdCol% = INT((EdCol% - 2) / 8) * 8 + 1
        CASE CHR$(0) + CHR$(83)                 ' Del: apaga o caractere sob o cursor
            IF EdCol% <= LEN(txt$) THEN
                ArqDados$(EdLin%) = LEFT$(txt$, EdCol% - 1) + MID$(txt$, EdCol% + 1)
                EdAlterado% = -1
            ELSEIF EdLin% < ArqQtd AND LEN(txt$) + LEN(ArqDados$(EdLin% + 1)) <= ED_LARG_MAX THEN
                ' no fim da linha, junta a linha seguinte
                ArqDados$(EdLin%) = txt$ + ArqDados$(EdLin% + 1)
                EdRemoveLinha EdLin% + 1
                EdAlterado% = -1
            END IF
        CASE CHR$(8)                            ' Backspace: apaga a esquerda; no inicio, junta com a anterior
            IF EdCol% > 1 THEN
                ArqDados$(EdLin%) = LEFT$(txt$, EdCol% - 2) + MID$(txt$, EdCol%)
                EdCol% = EdCol% - 1
                EdAlterado% = -1
            ELSEIF EdLin% > 1 AND LEN(ArqDados$(EdLin% - 1)) + LEN(txt$) <= ED_LARG_MAX THEN
                EdCol% = LEN(ArqDados$(EdLin% - 1)) + 1
                ArqDados$(EdLin% - 1) = ArqDados$(EdLin% - 1) + txt$
                EdRemoveLinha EdLin%
                EdLin% = EdLin% - 1
                EdAlterado% = -1
            END IF
        CASE CHR$(13)                           ' Enter: divide a linha no cursor
            IF ArqQtd >= ARQ_MAX THEN
                EdErr$ = "Limite de linhas atingido"
            ELSE
                ArqDados$(EdLin%) = LEFT$(txt$, EdCol% - 1)
                EdInsereLinha EdLin%, MID$(txt$, EdCol%)
                EdLin% = EdLin% + 1
                EdCol% = 1
            END IF
        CASE ELSE                               ' caractere digitado: insere no cursor
            IF LEN(k$) = 1 AND k$ >= " " AND LEN(txt$) < ED_LARG_MAX THEN
                ArqDados$(EdLin%) = LEFT$(txt$, EdCol% - 1) + k$ + MID$(txt$, EdCol%)
                EdCol% = EdCol% + 1
                EdAlterado% = -1
            END IF
    END SELECT
END SUB

' Insere txt$ como linha n% + 1, empurrando as seguintes. Quem chama garante o limite ARQ_MAX.
SUB EdInsereLinha (n%, txt$)
    DIM i%
    FOR i% = ArqQtd TO n% + 1 STEP -1
        ArqDados$(i% + 1) = ArqDados$(i%)
    NEXT
    ArqDados$(n% + 1) = txt$
    ArqQtd = ArqQtd + 1
    EdAlterado% = -1
END SUB

' Remove a linha n% e puxa as seguintes. Com uma unica linha, apenas a esvazia.
SUB EdRemoveLinha (n%)
    DIM i%
    IF ArqQtd = 1 THEN
        ArqDados$(1) = ""
    ELSE
        FOR i% = n% TO ArqQtd - 1
            ArqDados$(i%) = ArqDados$(i% + 1)
        NEXT
        ArqQtd = ArqQtd - 1
    END IF
END SUB

' ---- menu e funcoes ----------------------------------------------------------

' Mostra o menu na linha 23 e executa a funcao pela letra inicial. ESC cancela.
SUB EdMenu
    DIM mnu$, k$
    mnu$ = "Ler    Salvar    Deletar Linha    Incluir Linha    Fim     <F1>=Informacoes"
    COLOR COR_TEXTO, 0
    LOCATE 23, 1
    PRINT LEFT$(mnu$ + SPACE$(79), 79);
    TelaItemMenu 23, INSTR(mnu$, "Ler"), "Ler"
    TelaItemMenu 23, INSTR(mnu$, "Salvar"), "Salvar"
    TelaItemMenu 23, INSTR(mnu$, "Deletar Linha"), "Deletar Linha"
    TelaItemMenu 23, INSTR(mnu$, "Incluir Linha"), "Incluir Linha"
    TelaItemMenu 23, INSTR(mnu$, "Fim"), "Fim"

    k$ = UCASE$(TeclaLer$)
    SELECT CASE k$
        CASE "L": EdLer
        CASE "S": EdSalvar
        CASE "D": EdDeletarLinha
        CASE "I": EdIncluirLinha
        CASE "F": EdFimPedido
        CASE CHR$(0) + CHR$(59): EdAjuda
    END SELECT
END SUB

' Pede o nome e carrega o arquivo. Nome vazio cancela.
' RECONSTRUCAO: a leitura substitui o texto sem confirmar alteracoes nao gravadas;
' o dump nao traz texto de confirmacao para isso.
SUB EdLer
    DIM nome$
    nome$ = EdPedeNome$("")
    IF nome$ <> "" THEN EdCarregar nome$
END SUB

' Carrega nome$ em ArqDados. Em caso de erro, mantem o texto atual.
' Arquivo com ARQ_MAX linhas ou mais foi cortado pela leitura: fica somente leitura.
SUB EdCarregar (nome$)
    DIM n%
    TelaStatus "Aguarde ..."
    n% = ArqLer%(nome$)
    IF n% < 0 THEN
        TelaErro "Erro na leitura ...."
        EdEsperaEnter
        EXIT SUB
    END IF
    IF ArqQtd < 1 THEN
        ArqQtd = 1
        ArqDados$(1) = ""
    END IF
    EdNome$ = nome$
    EdLin% = 1: EdCol% = 1: EdTopo% = 1
    EdAlterado% = 0
    EdSoLeitura% = (ArqQtd >= ARQ_MAX)
    IF EdSoLeitura% THEN
        EdErr$ = "Arquivo com mais de " + LTRIM$(STR$(ARQ_MAX)) + " linhas: aberto somente para leitura"
    ELSE
        EdMsg$ = "Ok leitura terminada"
    END IF
END SUB

' Pede o nome e grava. Os parametros SISTRUT.DSP/.LAP/.PIP nao podem ser sobrescritos.
' Arquivo somente leitura nao grava. Outro nome que ja existe pede confirmacao (padrao N).
SUB EdSalvar
    DIM nome$
    IF EdSoLeitura% THEN
        EdErr$ = "Arquivo somente leitura: nao e possivel salvar"
        EXIT SUB
    END IF
    nome$ = EdPedeNome$(EdNome$)
    DO WHILE nome$ <> "" AND EdProtegido%(nome$)
        TelaErro "As parametrizacoes SISTRUT .DSP .LAP .PIP nao devem ser alteradas"
        TelaStatus "Salve com OUTRO NOME com a mesma extencao (Veja nota na parametrizacao)"
        nome$ = EdPedeNome$(EdNome$)
    LOOP
    IF nome$ = "" THEN EXIT SUB
    IF UCASE$(nome$) <> UCASE$(EdNome$) AND FileExists%(nome$) THEN
        IF EdConfirma%("Arquivo existe. Substituo S/*N* ", 0) = 0 THEN EXIT SUB
    END IF
    TelaStatus "Aguarde .."
    ArqGravar nome$
    IF FileExists%(nome$) = 0 THEN
        EdErr$ = "Erro na gravacao ...."
    ELSE
        EdNome$ = nome$
        EdAlterado% = 0
        EdMsg$ = "Ok gravacao terminada"
    END IF
END SUB

' Apaga a linha do cursor depois de confirmar.
SUB EdDeletarLinha
    IF EdConfirma%("Confirme DELETAR  " + "N/*S* ", -1) THEN
        EdRemoveLinha EdLin%
        EdAlterado% = -1
    END IF
END SUB

' Inclui uma linha vazia depois da linha do cursor, depois de confirmar.
SUB EdIncluirLinha
    IF EdConfirma%("Confirme INCLUIR  " + "N/*S* ", -1) THEN
        IF ArqQtd >= ARQ_MAX THEN
            EdErr$ = "Limite de linhas atingido"
        ELSE
            EdInsereLinha EdLin%, ""
            EdLin% = EdLin% + 1
            EdCol% = 1
        END IF
    END IF
END SUB

' Fim: sai direto se nada mudou; senao confirma o descarte.
SUB EdFimPedido
    IF EdAlterado% = 0 THEN
        EdFim% = -1
    ELSEIF EdConfirma%("Confirme FIM  " + "S/N ", 0) THEN
        EdFim% = -1
    END IF
END SUB

' Espera S ou N. Enter devolve padraoSim%; ESC devolve 0. Devolve -1 para sim.
FUNCTION EdConfirma% (texto$, padraoSim%)
    DIM k$
    TelaStatus texto$
    DO
        k$ = UCASE$(TeclaLer$)
        IF k$ = "S" THEN
            EdConfirma% = -1
            EXIT FUNCTION
        ELSEIF k$ = "N" OR k$ = CHR$(27) THEN
            EdConfirma% = 0
            EXIT FUNCTION
        ELSEIF k$ = CHR$(13) THEN
            EdConfirma% = padraoSim%
            EXIT FUNCTION
        END IF
    LOOP
END FUNCTION

' Tela de ajuda (F1): lista as teclas e espera Enter.
SUB EdAjuda
    EdLimpaArea 3, 22
    COLOR COR_DESTAQUE, 0
    LOCATE 4, 3: PRINT "TECLAS DE FUNCIONAMENTO";
    COLOR COR_TEXTO, 0
    LOCATE 6, 3: PRINT "movimentar o cursor";
    LOCATE 7, 3: PRINT "<ESC>   acesso as funcoes Ler/Salvar/Incluir/Deletar/Fim";
    LOCATE 8, 3: PRINT "<PG UP> sobe 10            <PG DN>       desce 10";
    LOCATE 9, 3: PRINT "<HOME>  inicio da linha    <Ctrl>+<HOME> inicio do texto";
    LOCATE 10, 3: PRINT "<END>   fim da linha       <Ctrl>+<END>  fim do texto";
    LOCATE 11, 3: PRINT "<TAB>   avanca na linha    <Shift>+<TAB> retorna na linha";
    LOCATE 12, 3: PRINT "<DEL>   deleta o caracter sob o cursor,";
    LOCATE 13, 3: PRINT "Ao termino da edicao, salve o texto editado.";
    EdEsperaEnter
END SUB

' Tela de nome de arquivo. Devolve o nome digitado (vazio = cancelou).
' padrao$ aparece no campo; ESC devolve padrao$.
FUNCTION EdPedeNome$ (padrao$)
    DIM nome$
    EdLimpaArea 3, 22
    COLOR COR_DESTAQUE, 0
    LOCATE 4, 3: PRINT "GRAVACAO E LEITURA DOS ARQUIVOS";
    COLOR COR_TEXTO, 0
    LOCATE 6, 3: PRINT "Para Leitura e Gravacao dos arquivos editados, forneca o nome do";
    LOCATE 7, 3: PRINT "arquivo e sua respectiva extensao caso exista .";
    LOCATE 9, 3: PRINT "Para alterar o Drive e o Diretorio, entre no nome do arquivo com";
    LOCATE 10, 3: PRINT "a rota completa.  exemplo:   C:\SISTRUT\EXEC40\PILAR.INI ";
    LOCATE 12, 3: PRINT "No caso do Drive e Diretorio estarem corretos, entre somente com";
    LOCATE 13, 3: PRINT "o nome do arquivo.  exemplo: PILAR.INI";
    LOCATE 16, 3: PRINT "SISTRUT.DSP  SISTRUT.LAP  SISTRUT.PIP";
    LOCATE 19, 3: PRINT "Nome do Arquivo  *RETORNO* ";
    nome$ = EntradaTexto$(19, 30, 40, padrao$)
    EdPedeNome$ = LTRIM$(RTRIM$(nome$))
END FUNCTION

' Verdadeiro para SISTRUT.DSP, SISTRUT.LAP e SISTRUT.PIP, em qualquer pasta.
FUNCTION EdProtegido% (nome$)
    DIM base$, i%, c$
    base$ = UCASE$(nome$)
    FOR i% = LEN(base$) TO 1 STEP -1
        c$ = MID$(base$, i%, 1)
        IF c$ = "\" OR c$ = "/" OR c$ = ":" THEN
            base$ = MID$(base$, i% + 1)
            EXIT FOR
        END IF
    NEXT
    IF LEFT$(base$, 8) = "SISTRUT." AND (RIGHT$(base$, 4) = ".DSP" OR RIGHT$(base$, 4) = ".LAP" OR RIGHT$(base$, 4) = ".PIP") THEN
        EdProtegido% = -1
    ELSE
        EdProtegido% = 0
    END IF
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
