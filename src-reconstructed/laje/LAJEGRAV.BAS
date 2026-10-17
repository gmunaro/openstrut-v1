' ============================================================================
'  LAJEGRAV.BAS - gravacao e leitura do painel de lajes de um edificio (.LAJ).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de LAJEGRAV.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/LAJEGRAV.md.
'
'  Convencao SISTRUT.OBR: o nome da obra corrente fica em <dir de dados>SISTRUT.OBR.
'  ObraAtual$ da o padrao ao entrar; ObraDefine grava a obra quando o usuario
'  informa outra (criacao, gravacao e leitura).
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Textos do EXE que nao tem uso identificado neste modulo ficam de fora.
'  Compilacao: bash tools/build.sh laje/LAJEGRAV
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB ListaLajesMemoria (lin AS INTEGER, rotulo AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE FUNCTION Confirma% (lin AS INTEGER, marca AS STRING)
DECLARE SUB ItemCriaArquivo ()
DECLARE SUB ItemGrava ()
DECLARE SUB ItemPesquisa ()
DECLARE SUB ItemLe ()
DECLARE SUB ItemAcessoDisco ()
DECLARE SUB ItemAlteraDir ()
DECLARE FUNCTION ArqLajPath$ (obra AS STRING)
DECLARE FUNCTION DirComBarra$ (d AS STRING)
DECLARE FUNCTION PaiDir$ (d AS STRING)
' Rotinas de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE SUB LajGrava (arq AS STRING)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE FUNCTION DadAbreLeitura% (arq AS STRING, tipo AS STRING, obra AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED LimLajes AS INTEGER      ' lajes maximas: LAJE.INI, no maximo DAD_MAXLAJ

CarregaConfiguracao
MenuPrincipal
CLS
LOCATE 12, 3: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
LOCATE 13, 3: PRINT "OpenStrut                             "
SYSTEM

' Le LAJE.INI da pasta de execucao: limite de lajes e unidade/diretorio de dados.
' Sem o arquivo usa DAD_MAXLAJ e C:\ . Por fim carrega a obra corrente.
' RECONSTRUCAO: o EXE nao mostra leitura do INI (lacuna 5); a leitura aqui e
' inferida pelos nomes das chaves do LAJE.INI.
SUB CarregaConfiguracao
    DIM i AS INTEGER, d AS STRING
    ComumDirExecDefine _CWD$
    LimLajes = DAD_MAXLAJ
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    IF ArqLer%(ComumDirExec$ + "LAJE.INI") >= 0 THEN
        i = ArqAchaTexto%("NUMERO MAXIMO DE LAJES ARQUIVADAS", 0)
        IF i > 0 THEN
            LimLajes = VAL(IniValor$(i))
            IF LimLajes < 1 OR LimLajes > DAD_MAXLAJ THEN LimLajes = DAD_MAXLAJ
        END IF
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    LajObra = ObraAtual$(DirDados)
    IF LajObra = "" THEN LajObra = "sem nome"
END SUB

' Tela principal: opcoes 1 a 7. A opcao 7 devolve o controle ao LAJE.
' RECONSTRUCAO: atalhos por letra do menu nao reconstruidos (so 1 a 7).
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        LOCATE 7, 10: PRINT "1  -  ";
        TelaItemMenu 7, 16, "Criacao de Arquivo em disco"
        LOCATE 8, 10: PRINT "2  -  ";
        TelaItemMenu 8, 16, "Gravacao de Painel / Lajes"
        LOCATE 9, 10: PRINT "3  -  ";
        TelaItemMenu 9, 16, "Numero de Lajes Gravadas"
        LOCATE 10, 10: PRINT "4  -  ";
        TelaItemMenu 10, 16, "Leitura de Painel / Lajes"
        LOCATE 11, 10: PRINT "5  -  Acesso ao ";
        PRINT "disco de dados"
        LOCATE 12, 10: PRINT "6  -  ";
        TelaItemMenu 12, 16, "Alterar Drive e Diretorio"
        LOCATE 13, 10: PRINT "7  -  ";
        TelaItemMenu 13, 16, "Retorno ao Menu Principal"
        TelaStatus "escolha opcao "
        k = TeclaLer$
        SELECT CASE k
            CASE "1": ItemCriaArquivo
            CASE "2": ItemGrava
            CASE "3": ItemPesquisa
            CASE "4": ItemLe
            CASE "5": ItemAcessoDisco
            CASE "6": ItemAlteraDir
            CASE "7": EXIT DO
        END SELECT
    LOOP
    CLS
    LOCATE 4, 3: PRINT "Retorno ao Modulo Basico de LAJE"
    LOCATE 5, 3: PRINT "Para retornar acione EXIT <Enter>"
    DO: LOOP UNTIL TeclaLer$ = CHR$(13)
END SUB

' Titulo, obra corrente e subtitulo da tela (subtit "" = so o titulo).
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "Gravacao e Leitura de Dados de Painel / Lajes de um Edificio"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "Obra - "; LajObra; "   Dados em "; DirCurto$(DirDados, 77 - LEN("Obra - " + RTRIM$(LajObra) + "   Dados em "))
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 4, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Lista as lajes em memoria a partir da linha lin. rotulo e o texto que
' antecede o nome da obra (muda entre a criacao e a gravacao).
' RECONSTRUCAO: a lista e truncada na largura da tela; o EXE nao mostra a forma exata.
SUB ListaLajesMemoria (lin AS INTEGER, rotulo AS STRING)
    DIM i AS INTEGER, txt AS STRING
    LOCATE lin, 3: PRINT "Arquivadas em Memoria"
    LOCATE lin + 1, 3: PRINT rotulo; LajObra
    IF LajQtd = 0 THEN
        LOCATE lin + 2, 3: PRINT "Nao ha Lajes Arquivadas na Memoria"
        EXIT SUB
    END IF
    FOR i = 1 TO LajQtd
        txt = txt + RTRIM$(Laj(i).nome) + " "
    NEXT
    LOCATE lin + 2, 3: PRINT LEFT$(txt, 76)
END SUB

' Mostra texto na linha de erro (erro = -1, linha 24) ou de status (linha 25)
' e espera ESC ou Enter. texto "" so espera. Limpa as linhas 23 a 25 ao sair.
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

' Marca de confirmacao (ex.: "*GRAVA"): Enter confirma, ESC cancela.
' Devolve -1 se confirmou.
FUNCTION Confirma% (lin AS INTEGER, marca AS STRING)
    DIM k AS STRING
    LOCATE lin, 3: PRINT marca;
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
    Confirma% = (k = CHR$(13))
END FUNCTION

' Caminho do .LAJ da obra no diretorio de dados corrente.
FUNCTION ArqLajPath$ (obra AS STRING)
    ArqLajPath$ = DirDados + obra + ".LAJ"
END FUNCTION

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Diretorio pai de d (com barra final), para criar um nivel por vez.
FUNCTION PaiDir$ (d AS STRING)
    DIM s AS STRING, p AS INTEGER
    s = LEFT$(d, LEN(d) - 1)
    p = _INSTRREV(s, "\")
    IF p <= 3 THEN PaiDir$ = LEFT$(s, 2) + "\" ELSE PaiDir$ = LEFT$(s, p)
END FUNCTION

' Item 1: cria o .LAJ da obra informada com as lajes em memoria.
' RECONSTRUCAO: arquivo ja existente e recusado (o EXE so avisa e o perderia).
' O nivel do pavimento nao e perguntado nas telas conhecidas: fica o valor atual.
SUB ItemCriaArquivo
    DIM nome AS STRING, arq AS STRING, k AS STRING
    CLS
    TelaCabecalho "Criacao de Arquivo em disco"
    LOCATE 6, 3: PRINT "ATENCAO !"
    LOCATE 7, 3: PRINT "A criacao do arquivo, deve ser feita somente quando este ainda nao existe."
    LOCATE 8, 3: PRINT "Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido."
    LOCATE 9, 3: PRINT "O Arquivo que sera criado para gravacao das Lajes arquivadas em Memoria,"
    LOCATE 10, 3: PRINT "tera o nome da Obra arquivada com extensao .LAJ"
    ListaLajesMemoria 12, "Lajes da Obra "
    LOCATE 17, 3: PRINT "Nome do arquivo *";
    nome = EntradaTexto$(17, 22, 30, LajObra)
    IF nome = "" THEN EXIT SUB
    LOCATE 19, 3: PRINT "NAO CRIAR"; SPACE$(4); "*CRIAR"
    k = TeclaLer$
    IF UCASE$(k) = "N" OR k = CHR$(27) THEN EXIT SUB
    IF NOT _DIREXISTS(DirDados) THEN
        Espera "VERIFIQUE O SEU DRIVE", -1
        EXIT SUB
    END IF
    arq = ArqLajPath$(nome)
    IF _FILEEXISTS(arq) THEN
        Espera "ARQUIVO JA EXISTE: CRIACAO NAO FEITA", -1
        EXIT SUB
    END IF
    IF LajQtd > LimLajes THEN
        Espera "CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA", -1
        EXIT SUB
    END IF
    LajObra = nome
    TelaStatus "Aguarde ...!"
    LajGrava arq
    ObraDefine DirDados, LajObra
    Espera "Arquivo con dados de LAJES inicializado em " + arq, 0
END SUB

' Item 2: grava as lajes em memoria no .LAJ da obra informada. Se o arquivo
' ja existe, LajGrava copia o anterior para .BAK antes de sobrescrever.
SUB ItemGrava
    DIM nome AS STRING, arq AS STRING, k AS STRING, msg AS STRING
    CLS
    TelaCabecalho "Gravacao de Painel / Lajes"
    ListaLajesMemoria 6, "Lajes referentes a Obra "
    IF LajQtd = 0 THEN
        Espera "Nao ha Lajes Arquivadas na Memoria", 0
        EXIT SUB
    END IF
    LOCATE 11, 3: PRINT "Nome da Obra *";
    nome = EntradaTexto$(11, 20, 30, LajObra)
    IF nome = "" THEN EXIT SUB
    LOCATE 13, 3: PRINT "Continuo N/*S* ";
    k = TeclaLer$
    IF UCASE$(k) = "N" OR k = CHR$(27) THEN EXIT SUB
    IF LajQtd > LimLajes THEN
        Espera "CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA", -1
        EXIT SUB
    END IF
    IF NOT _DIREXISTS(DirDados) THEN
        Espera "VERIFIQUE O SEU DRIVE", -1
        EXIT SUB
    END IF
    IF NOT Confirma%(15, "*GRAVA") THEN EXIT SUB
    arq = ArqLajPath$(nome)
    LajObra = nome
    msg = "Lajes gravadas em " + arq
    IF _FILEEXISTS(arq) THEN
        TelaStatus ".BAK     Aguarde ..."
        msg = "Dados anteriores copiados para " + LEFT$(arq, LEN(arq) - 3) + ".BAK " + msg
    ELSE
        TelaStatus "Aguarde .."
    END IF
    LajGrava arq
    ObraDefine DirDados, LajObra
    Espera msg, 0
END SUB

' Item 3: informa o numero de lajes de um .LAJ sem alterar a memoria.
' Enter ou FIM encerra; repete a pergunta enquanto o usuario informar arquivos.
SUB ItemPesquisa
    DIM nome AS STRING, arq AS STRING, f AS INTEGER, obraArq AS STRING, nivel AS INTEGER, n AS INTEGER
    IF _FILES$(DirDados + "*.LAJ") = "" THEN
        Espera "Nenhum Arquivo Encontrado/", -1
        EXIT SUB
    END IF
    DO
        CLS
        TelaCabecalho "Pesquisa do Numero de Lajes Gravadas"
        LOCATE 6, 3: PRINT "Nome do Arquivo a Pesquisar *FIM* ";
        nome = EntradaTexto$(6, 40, 30, "")
        IF nome = "" OR UCASE$(nome) = "FIM" THEN EXIT DO
        arq = ArqLajPath$(nome)
        IF NOT _FILEEXISTS(arq) THEN
            Espera "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR", -1
        ELSE
            f = DadAbreLeitura%(arq, "LAJ", obraArq)
            IF f = 0 THEN
                Espera DadErro, -1
            ELSE
                INPUT #f, nivel, n
                CLOSE #f
                LOCATE 8, 3: PRINT "*NUMERO"
                LOCATE 8, 12: PRINT "Gravadas"
                LOCATE 8, 22: PRINT "Lajes ,"; LTRIM$(STR$(n))
                LOCATE 9, 3: PRINT "Obra "; obraArq
                Espera "", 0
            END IF
        END IF
    LOOP
END SUB

' Item 4: le o .LAJ da obra informada para a memoria. Pede confirmacao antes de
' descartar as lajes atuais. RETORNO ou Enter cancela.
SUB ItemLe
    DIM nome AS STRING, arq AS STRING, k AS STRING
    CLS
    TelaCabecalho "Leitura de Painel / Lajes Gravadas em Disco"
    LOCATE 6, 3: PRINT "Nome da Obra '";
    LOCATE 8, 3: PRINT "RETORNO"; "  para cancelar"
    nome = EntradaTexto$(6, 21, 30, "")
    IF nome = "" OR UCASE$(nome) = "RETORNO" THEN EXIT SUB
    arq = ArqLajPath$(nome)
    IF NOT _FILEEXISTS(arq) THEN
        Espera "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR", -1
        EXIT SUB
    END IF
    IF LajQtd > 0 THEN
        LOCATE 9, 3: PRINT "Os Dados em memoria das Lajes da Obra "; LajObra
        LOCATE 10, 3: PRINT "serao Perdidos  SIM/*N* ";
        k = TeclaLer$
        IF UCASE$(k) <> "S" THEN EXIT SUB
    END IF
    IF NOT Confirma%(12, "*LEIA") THEN EXIT SUB
    TelaStatus "Aguarde ...!"
    IF LajLe%(arq) = 0 THEN
        LOCATE 20, 3: PRINT "erro no processamento"
        LOCATE 21, 3: PRINT "verifique a consistencia dos seus dados"
        Espera DadErro, -1
        EXIT SUB
    END IF
    IF LajQtd > LimLajes THEN
        LajQtd = 0
        Espera "CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA", -1
        EXIT SUB
    END IF
    ObraDefine DirDados, LajObra
    Espera "Lajes lidas: " + LTRIM$(STR$(LajQtd)) + "   Obra " + LajObra, 0
END SUB

' Item 5: mostra a unidade de dados.
' RECONSTRUCAO: o EXE mostra os Kbytes livres do disco; nao ha funcao de espaco
' livre em QB64 usada aqui, entao a linha de Kbytes fica como nao calculada.
SUB ItemAcessoDisco
    CLS
    TelaCabecalho "Acesso ao disco de dados"
    LOCATE 6, 3: PRINT "Acesso ao "; LEFT$(DirDados, 2); " ( nao calculado "; "Kbytes livres )"
    Espera "", 0
END SUB

' Item 6: troca a unidade e o diretorio de dados. Oferece criar o diretorio
' que nao existe, um nivel por vez.
' RECONSTRUCAO: o texto "Acione D <Enter>" aparece quando o usuario recusa criar;
' o EXE pode mostra-lo em outro momento.
SUB ItemAlteraDir
    DIM d AS STRING, dr AS STRING, dpad AS STRING, novo AS STRING, k AS STRING
    CLS
    TelaCabecalho "Alterar Drive e Diretorio"
    LOCATE 6, 3: PRINT "Drive que contem o Disco de Dados ";
    d = EntradaTexto$(6, 38, 1, LEFT$(DirDados, 1))
    LOCATE 8, 3: PRINT "\Diretorio\Subdiretorio\...\"
    ' RECONSTRUCAO: EntradaTexto$ (SISCOMUM.BM:333) faz LOCATE com o comprimento
    ' do padrao, sem limitar a larg; caminho longo estoura a coluna 80 (erro 5).
    ' Com padrao longo, o campo comeca vazio, o atual aparece na linha 10 e
    ' ENTER vazio mantem o diretorio atual.
    dpad = MID$(DirDados, 3)
    IF LEN(dpad) > 60 THEN
        LOCATE 10, 3: PRINT "Atual: "; LEFT$(DirDados, 70)
        dpad = ""
    END IF
    dr = EntradaTexto$(9, 3, 60, dpad)
    IF d = "" THEN EXIT SUB
    IF dr = "" THEN dr = MID$(DirDados, 3)
    dr = DirComBarra$(dr)
    IF LEFT$(dr, 1) <> "\" THEN dr = "\" + dr
    novo = UCASE$(LEFT$(d, 1)) + ":" + dr
    IF NOT _DIREXISTS(novo) THEN
        LOCATE 11, 3: PRINT "ATENCAO ! ..  Drive e Diretorio nao encontrados"
        LOCATE 12, 3: PRINT "Crio o Diretorio "; novo; "  S/*N* ";
        k = TeclaLer$
        IF UCASE$(k) <> "S" THEN
            Espera "Acione  D <Enter>  para alterar Drive e Diretorio", 0
            EXIT SUB
        END IF
        IF NOT _DIREXISTS(PaiDir$(novo)) THEN
            Espera "Drive e Diretorio nao encontrados", -1
            EXIT SUB
        END IF
        TelaStatus "Criando Diretorio     Aguarde ..."
        MKDIR LEFT$(novo, LEN(novo) - 1)
    END IF
    DirDados = DirUtilizavel$(novo)
    Espera "Diretorio de dados: " + DirDados, 0
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
