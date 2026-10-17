' ============================================================================
'  PIGRAEDI.BAS - gravacao e leitura de dados de colunas de um edificio (3.x).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de PIGRAEDI.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/PIGRAEDI.md.
'
'  Opcoes: 1 criacao de arquivo, 2 numero de colunas gravadas (pesquisa),
'  3 gravacao, 4 catalogo, 5 leitura, 6 espaco em disco, 7 drive e diretorio.
'  Arquivo: <obra>.COL no diretorio de dados, formato de SISDADOS.BM.
'  Verificacao de licenca do original nao reimplementada.
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Textos de tela que nao estao na spec sao do fonte, nao do EXE.
'  Compilacao: bash tools/build.sh pilar/PIGRAEDI
' ============================================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Rotinas de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE FUNCTION ColLe% (arq AS STRING)
DECLARE SUB ColGrava (arq AS STRING)
DECLARE FUNCTION DadAbreLeitura% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
' Rotinas deste modulo
DECLARE SUB CarregaConfiguracao ()
DECLARE SUB ColCarrega ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB LimpaLinha (lin AS INTEGER)
DECLARE FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
DECLARE FUNCTION DirComBarra$ (d AS STRING)
DECLARE FUNCTION ColCabeca% (arq AS STRING, nNiv AS INTEGER, nCol AS INTEGER)
DECLARE SUB ItemCriaArquivo ()
DECLARE SUB ItemPesquisa ()
DECLARE SUB ItemGravacao ()
DECLARE SUB ItemCatalogo ()
DECLARE SUB ItemLeitura ()
DECLARE SUB ItemEspacoDisco ()
DECLARE SUB ItemDrive ()

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra

CarregaConfiguracao
ColCarrega
MenuPrincipal
' RECONSTRUCAO: protocolo VOLTA nao reconstruido. O EXE tem "VOLTA PIGRAEDI" e "VOLTA PILGEEDI"
' (docs/modules/PIGRAEDI.md secao 2) e a mensagem "Retorno ao Modulo Basico de PILAREDI"; o
' mecanismo do retorno (arquivo, variavel ou parametro) nao aparece no dump. Por enquanto o
' programa sempre termina aqui, com a mensagem de termino e SYSTEM, como antes.
CLS
LOCATE 12, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le o diretorio de dados do PILAR.INI (spec 6, PIGRAEDI.md) e define a obra corrente.
' Sem obra corrente, pergunta o nome e grava com ObraDefine.
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
        ColObra = EntradaTexto$(6, 20, 30, "")
        IF ColObra = "" THEN ColObra = "sem nome"
        ObraDefine DirDados, ColObra
    END IF
END SUB

' Carrega <obra>.COL se existir. Sem arquivo, comeca sem niveis nem colunas.
' RECONSTRUCAO: a memoria inicial desta tela nao esta no dump; carregar o .COL e hipotese.
SUB ColCarrega
    ColNivQtd = 0: ColQtd = 0
    IF _FILEEXISTS(DirDados + ColObra + ".COL") THEN
        IF ColLe%(DirDados + ColObra + ".COL") = 0 THEN Espera DadErro, -1
    END IF
END SUB

' Menu 1 a 7 e R (spec 3.1). Escolha pelo numero; a spec tambem aceita hotkey,
' mas C aparece em dois itens.
' RECONSTRUCAO: hotkeys da spec (C, N, G, C, L, A, A) nao reconstruidas.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        LOCATE 6, 10: PRINT "1  -  ";
        TelaItemMenu 6, 16, "Criacao de Arquivo em disco"
        LOCATE 7, 10: PRINT "2  -  ";
        TelaItemMenu 7, 16, "Numero de Colunas Gravadas"
        LOCATE 8, 10: PRINT "3  -  ";
        TelaItemMenu 8, 16, "Gravacao de Colunas"
        LOCATE 9, 10: PRINT "4  -  ";
        TelaItemMenu 9, 16, "Catalogo de Colunas Gravadas"
        LOCATE 10, 10: PRINT "5  -  ";
        TelaItemMenu 10, 16, "Leitura de Colunas"
        LOCATE 11, 10: PRINT "6  -  ";
        TelaItemMenu 11, 16, "Acesso ao Disco"
        LOCATE 12, 10: PRINT "7  -  ";
        TelaItemMenu 12, 16, "Alterar Drive e Diretorio"
        LOCATE 13, 10: PRINT "R  -  ";
        TelaItemMenu 13, 16, "Retorno ao Menu Principal"
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": ItemCriaArquivo
            CASE "2": ItemPesquisa
            CASE "3": ItemGravacao
            CASE "4": ItemCatalogo
            CASE "5": ItemLeitura
            CASE "6": ItemEspacoDisco
            CASE "7": ItemDrive
        END SELECT
    LOOP UNTIL k = "R"
END SUB

' Cabecalho: titulo, obra e razao social (linhas 1 a 3); subtitulo na linha 4 quando nao vazio.
' RECONSTRUCAO: o diretorio fica na linha 2, encurtado (mantem o final) para caber em 80 colunas.
SUB TelaCabecalho (subtit AS STRING)
    DIM dir AS STRING, espaco AS INTEGER
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "Gravacao e Leitura de Dados de Colunas de um Edificio"
    LimpaLinha 2
    LimpaLinha 3
    LimpaLinha 4
    COLOR COR_TEXTO
    espaco = 76 - LEN("Obra - " + ColObra + "   Dados em ")
    dir = DirDados
    IF LEN(dir) > espaco THEN dir = "..." + RIGHT$(dir, espaco - 3)
    LOCATE 2, 3: PRINT "Obra - "; ColObra; "   Dados em "; dir
    LOCATE 3, 3: PRINT "OpenStrut                             "
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

' Pergunta S/N na linha lin. S = -1, N = 0; Enter devolve padrao; ESC conta como N.
FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    LimpaLinha lin
    LOCATE lin, 3: PRINT texto;
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k = "S" OR k = "N" OR k = CHR$(13) OR k = CHR$(27)
    LimpaLinha lin
    IF k = "S" THEN
        Pergunta% = -1
    ELSEIF k = CHR$(13) THEN
        Pergunta% = padrao
    ELSE
        Pergunta% = 0
    END IF
END FUNCTION

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Le so o cabecalho de arq (niveis e colunas), sem tocar na memoria.
' Devolve -1 se ok; 0 com o motivo em DadErro.
FUNCTION ColCabeca% (arq AS STRING, nNiv AS INTEGER, nCol AS INTEGER)
    DIM f AS INTEGER, obra AS STRING
    f = DadAbreLeitura%(arq, "COL", obra)
    IF f = 0 THEN EXIT FUNCTION
    INPUT #f, nNiv, nCol
    CLOSE #f
    ColCabeca% = -1
END FUNCTION

' Item 1: cria <nome>.COL com as colunas em memoria. O nome padrao e a obra.
' RECONSTRUCAO: "NAO CRIAR" cancela (opcao da spec, nao confirmada no codigo).
' Se o arquivo ja existir, ColGrava copia o anterior para .BAK antes de sobrescrever.
' A mensagem final mantem a grafia "con" do EXE (typo da spec 3.2, item 12).
SUB ItemCriaArquivo
    DIM nome AS STRING, arq AS STRING
    CLS
    TelaCabecalho "Arquivadas em Memoria"
    LOCATE 6, 3: PRINT "ATENCAO !  "
    LOCATE 7, 3: PRINT "A criacao do arquivo, deve ser feita somente quando este ainda nao existe."
    LOCATE 8, 3: PRINT "Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido."
    LOCATE 10, 3: PRINT "O Arquivo que sera criado para gravacao das Colunas arquivadas em Memoria,"
    LOCATE 11, 3: PRINT "tera o nome da Obra arquivada com extensao .COL"
    IF ColQtd = 0 THEN
        Espera "Nao ha Colunas Arquivadas na Memoria", -1
        EXIT SUB
    END IF
    LOCATE 13, 3: PRINT "Colunas da Obra "; ColObra
    LOCATE 15, 3: PRINT "Nome do arquivo *";
    LOCATE 17, 3: PRINT "Digite NAO CRIAR para cancelar a criacao";
    nome = EntradaTexto$(15, 22, 30, ColObra)
    LimpaLinha 17
    IF nome = "" OR UCASE$(nome) = "NAO CRIAR" THEN EXIT SUB
    arq = DirDados + nome + ".COL"
    ColObra = nome
    ColGrava arq
    ObraDefine DirDados, nome
    Espera "Arquivo con dados de PILARES inicializado em " + DATE$, 0
END SUB

' Item 2: informa niveis e colunas de um .COL gravado, sem carregar a memoria.
SUB ItemPesquisa
    DIM nome AS STRING, arq AS STRING, nNiv AS INTEGER, nCol AS INTEGER
    CLS
    TelaCabecalho "Pesquisa do Numero de Colunas Gravadas"
    DO
        LimpaLinha 6
        LOCATE 6, 3: PRINT "Nome do Arquivo a Pesquisar *FIM* ";
        nome = EntradaTexto$(6, 42, 30, "")
        IF nome = "" OR UCASE$(nome) = "FIM" THEN EXIT DO
        arq = DirDados + nome + ".COL"
        LimpaLinha 8
        LimpaLinha 9
        IF NOT _FILEEXISTS(arq) THEN
            Espera "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ", -1
        ELSEIF ColCabeca%(arq, nNiv, nCol) THEN
            LOCATE 8, 3: PRINT "NUMERO DE NIVEIS "; nNiv
            LOCATE 9, 3: PRINT "NUMERO DE COLUNAS "; nCol
        ELSE
            Espera DadErro, -1
        END IF
    LOOP
END SUB

' Item 3: grava as colunas em memoria em <obra>.COL. ColGrava faz o .BAK do anterior.
' RECONSTRUCAO: a ordem dos avisos de backup e a grafia "com" da confirmacao sao inferidas do dump.
SUB ItemGravacao
    DIM obra AS STRING, arq AS STRING, existia AS INTEGER
    IF ColNivQtd = 0 OR ColQtd = 0 THEN
        Espera "Nao ha Colunas Arquivadas na Memoria", -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Gravacao de Colunas"
    LOCATE 6, 3: PRINT "Colunas referentes a Obra "; ColObra
    LOCATE 7, 3: PRINT "Nome da Obra *";
    obra = EntradaTexto$(7, 20, 30, ColObra)
    IF obra = "" THEN EXIT SUB
    IF Pergunta%(9, "Continuo N/*S* ", -1) = 0 THEN EXIT SUB
    arq = DirDados + obra + ".COL"
    existia = _FILEEXISTS(arq)
    ColObra = obra
    ObraDefine DirDados, obra
    LOCATE 11, 3: PRINT "Aguarde ..";
    IF existia THEN LOCATE 12, 3: PRINT obra; ".COL.BAK     Aguarde ...";
    ColGrava arq
    IF existia THEN
        Espera "Dados anteriores copiados para " + obra + ".COL.BAK", 0
    ELSE
        Espera "Arquivo com dados de PILARES inicializado em " + DATE$, 0
    END IF
END SUB

' Item 4: lista as colunas de um .COL gravado, sem carregar a memoria.
' inicio e termino sao o primeiro e o ultimo nivel com armadura (nBarras > 0).
' RECONSTRUCAO: o significado de inicio e termino e inferido; nao confirmado no EXE.
SUB ItemCatalogo
    DIM nome AS STRING, arq AS STRING, obra AS STRING, f AS INTEGER
    DIM nNiv AS INTEGER, nCol AS INTEGER, c AS INTEGER, k AS INTEGER
    DIM nivNome(1 TO DAD_MAXNIV) AS STRING, nivTmp AS STRING
    DIM nivCota AS DOUBLE, nivPe AS DOUBLE
    DIM cNome AS STRING, cSec AS STRING, cBx AS DOUBLE, cBy AS DOUBLE, cX AS DOUBLE, cY AS DOUBLE
    DIM eN AS DOUBLE, eMx AS DOUBLE, eMy AS DOUBLE, eLx AS DOUBLE, eLy AS DOUBLE
    DIM eAs AS DOUBLE, ePhi AS DOUBLE, eNb AS INTEGER, ePhiE AS DOUBLE, eSe AS DOUBLE
    DIM ini AS INTEGER, fim AS INTEGER, lin AS INTEGER, linha AS STRING, tecla AS STRING
    CLS
    TelaCabecalho "Catalogo de Colunas Gravadas em Disco"
    LOCATE 6, 3: PRINT "Nome do Arquivo a Catalogar *FIM* ";
    nome = EntradaTexto$(6, 40, 30, "")
    IF nome = "" OR UCASE$(nome) = "FIM" THEN EXIT SUB
    arq = DirDados + nome + ".COL"
    IF NOT _FILEEXISTS(arq) THEN
        Espera "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ", -1
        EXIT SUB
    END IF
    f = DadAbreLeitura%(arq, "COL", obra)
    IF f = 0 THEN
        Espera DadErro, -1
        EXIT SUB
    END IF
    INPUT #f, nNiv, nCol
    ' RECONSTRUCAO: limites sao DAD_MAXNIV e DAD_MAXPIL de SISDADOS.BI; os do EXE nao estao no dump.
    IF nNiv < 0 OR nNiv > DAD_MAXNIV THEN
        CLOSE #f
        Espera "NUMERO DE NIVEIS INSUFICIENTE", -1
        EXIT SUB
    END IF
    IF nCol < 0 OR nCol > DAD_MAXPIL THEN
        CLOSE #f
        Espera "NUMERO MAXIMO DE COLUNAS ARQUIVADAS INSUFICIENTE", -1
        EXIT SUB
    END IF
    FOR k = 1 TO nNiv
        INPUT #f, nivTmp, nivCota, nivPe
        nivNome(k) = nivTmp
    NEXT
    LOCATE 7, 3: PRINT "NUMERO DE NIVEIS "; nNiv
    LOCATE 8, 3: PRINT "NUMERO DE COLUNAS "; nCol
    LOCATE 9, 3: PRINT "Colunas   * interrompe"
    LOCATE 10, 3: PRINT "Pos  Coluna         inicio         termino"
    lin = 11
    FOR c = 1 TO nCol
        INPUT #f, cNome, cSec, cBx, cBy, cX, cY
        ini = 0: fim = 0
        FOR k = 1 TO nNiv
            INPUT #f, eN, eMx, eMy, eLx, eLy, eAs, ePhi, eNb, ePhiE, eSe
            IF eNb > 0 THEN
                IF ini = 0 THEN ini = k
                fim = k
            END IF
        NEXT
        linha = LEFT$(LTRIM$(STR$(c)) + SPACE$(5), 5)
        linha = linha + LEFT$(RTRIM$(cNome) + SPACE$(15), 15)
        IF ini > 0 THEN
            linha = linha + LEFT$(RTRIM$(nivNome(ini)) + SPACE$(15), 15) + RTRIM$(nivNome(fim))
        ELSE
            linha = linha + "-"
        END IF
        LOCATE lin, 3: PRINT linha
        lin = lin + 1
        IF lin > 21 THEN
            LOCATE 23, 3: PRINT "Qualquer Tecla para Continuar ";
            tecla = TeclaLer$
            LimpaLinha 23
            IF tecla = "*" THEN EXIT FOR
            FOR k = 11 TO 21: LimpaLinha k: NEXT
            lin = 11
        END IF
    NEXT
    CLOSE #f
    Espera "", 0
END SUB

' Item 5: le <nome>.COL para a memoria; os dados em memoria sao substituidos.
' RECONSTRUCAO: o prompt do nome na leitura nao esta no dump; usa "Nome da Obra".
SUB ItemLeitura
    DIM nome AS STRING, arq AS STRING
    CLS
    TelaCabecalho "Leitura de Colunas Gravadas em Disco"
    LOCATE 6, 3: PRINT "Os Dados em memoria das Colunas da Obra "; ColObra
    IF Pergunta%(7, "serao Perdidos  SIM/*N* ", 0) = 0 THEN EXIT SUB
    LOCATE 9, 3: PRINT "Nome da Obra *";
    nome = EntradaTexto$(9, 20, 30, ColObra)
    IF nome = "" THEN EXIT SUB
    arq = DirDados + nome + ".COL"
    IF NOT _FILEEXISTS(arq) THEN
        Espera "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ", -1
        EXIT SUB
    END IF
    ColObra = nome
    IF ColLe%(arq) = 0 THEN
        Espera DadErro, -1
    ELSE
        ObraDefine DirDados, ColObra
        Espera "Colunas lidas: " + LTRIM$(STR$(ColQtd)), 0
    END IF
END SUB

' Item 6: espaco livre em disco (spec 3.1, item 6).
' RECONSTRUCAO: a rotina de espaco livre do EXE nao foi identificada; mostra so o aviso.
' Item 6: espaco livre em disco. RECONSTRUCAO: o texto do meio do item nao esta na
' especificacao e nao ha funcao de espaco livre no repositorio; so o aviso e mostrado.
SUB ItemEspacoDisco
    Espera "Opcao nao disponivel nesta reconstrucao", 0
END SUB

' Item 7: troca drive e subdiretorio dos arquivos de obra; cria o diretorio se o usuario pedir.
' RECONSTRUCAO: o novo caminho nao e gravado no PILAR.INI; a memoria atual nao e descartada.
' Sem diretorio e sem resposta S, mostra o hint de D; diretorio sem .COL mostra "Nenhum Arquivo Encontrado".
' Estas duas condicoes de exibicao sao inferidas da spec 3.7.
SUB ItemDrive
    DIM drv AS STRING, subd AS STRING, novo AS STRING, chk AS STRING
    CLS
    TelaCabecalho "Alterar Drive e Diretorio"
    LOCATE 6, 3: PRINT "Drive que contem o Disco de Dados ";
    drv = UCASE$(EntradaTexto$(6, 40, 2, LEFT$(DirDados, 2)))
    IF drv = "" THEN EXIT SUB
    IF RIGHT$(drv, 1) <> ":" THEN drv = drv + ":"
    LOCATE 7, 3: PRINT "\Diretorio\Subdiretorio\...\"
    LOCATE 8, 3: PRINT "Subdiretorio ";
    subd = EntradaTexto$(8, 17, 50, "")
    IF LEFT$(subd, 1) = "\" THEN subd = MID$(subd, 2)
    novo = DirComBarra$(drv + "\" + subd)
    chk = novo
    IF LEN(chk) > 3 THEN chk = LEFT$(chk, LEN(chk) - 1)
    IF NOT _DIREXISTS(chk) THEN
        Espera "ATENCAO ! ..  Drive e Diretorio nao encontrados", -1
        IF Pergunta%(10, "Crio o Diretorio  S/*N* ", 0) = 0 THEN
            Espera "Acione  D <Enter>  para alterar Drive e Diretorio", 0
            EXIT SUB
        END IF
        ' RECONSTRUCAO: drive inexistente (ex.: Z:) nao e criado; MKDIR daria erro 76.
        IF NOT _DIREXISTS(LEFT$(chk, 3)) THEN
            Espera "Drive " + LEFT$(chk, 2) + " nao encontrado; nada foi criado", 0
            Espera "Acione  D <Enter>  para alterar Drive e Diretorio", 0
            EXIT SUB
        END IF
        LOCATE 10, 3: PRINT "Criando Diretorio     Aguarde ...";
        MKDIR chk
    END IF
    DirDados = DirUtilizavel$(chk)
    ColObra = ObraAtual$(DirDados)
    IF ColObra = "" THEN
        ColObra = "sem nome"
        ObraDefine DirDados, ColObra
    END IF
    IF _FILES$(DirDados + "*.COL") = "" THEN
        LOCATE 10, 3: PRINT "Nenhum Arquivo Encontrado";
        Espera "", 0
    END IF
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
