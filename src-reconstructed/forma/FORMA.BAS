' ===============================================================
' FORMA.BAS - gerenciador da familia Forma (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: docs/modules/FORMA.md, dump de strings do FORMA.EXE (fora do repositorio).
' Submodulos chamados (nao escritos aqui): FORMEDCA, FORMINIT,
' FORMIMP, FORMPLOT. Parametros: FORMA.INI na pasta do executavel,
' formato VALOR=DESCRICAO. Obra: <pasta de Lajes>SISTRUT.OBR.
' Compilacao: tools/build.sh forma/FORMA.BAS
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST FORMA_INI_NOME = "FORMA.INI"
CONST NUM_PARAM = 7

DIM SHARED iniArq$, obraDir$, obra$
DIM SHARED paramChave$(1 TO NUM_PARAM), paramRotulo$(1 TO NUM_PARAM)

DECLARE SUB ParamInicia ()
DECLARE FUNCTION IniDirDe$ (chave$)
DECLARE FUNCTION DirBarra$ (dir$)
DECLARE SUB TelaObra ()
DECLARE SUB TelaPrincipal ()
DECLARE SUB TelaOpcao (lin%, numero$, texto$)
DECLARE SUB TelaParametros ()
DECLARE SUB ParamDesenha ()
DECLARE SUB AlteraDrive ()
DECLARE SUB MenuTecla (k$)
DECLARE SUB SubmoduloExecuta (nome$)
DECLARE SUB TelaFim ()
DECLARE SUB Montagem ()
DECLARE SUB Reedicao ()
DECLARE FUNCTION PedeNome$ (lin%, rotulo$)
DECLARE FUNCTION DirDado$ (k%)
DECLARE FUNCTION SimNao% (lin%, texto$)
DECLARE SUB MostraLido (lin%, rotulo$, qtd%)
DECLARE SUB FalhaLeitura ()

' ---- programa principal ----
DIM k$, tecla$
ComumDirExecDefine _CWD$
ParamInicia
iniArq$ = ComumDirExec$ + FORMA_INI_NOME

IF ArqLer%(iniArq$) < 0 THEN
    TelaErro "NAO EXISTE ESTE ARQUIVO NESTE DISCO: " + iniArq$
    tecla$ = TeclaLer$
ELSE
    obraDir$ = IniDirDados$
    obra$ = ObraAtual$(obraDir$)
    TelaObra
    DO
        TelaPrincipal
        k$ = TeclaLer$
        IF k$ = CHR$(0) + CHR$(60) THEN EXIT DO
        MenuTecla k$
    LOOP
END IF
TelaFim

' Preenche as 7 pastas de dados: chave (texto da descricao no FORMA.INI) e rotulo da tela.
SUB ParamInicia
    paramChave$(1) = "ARQUIVOS DE LAJES": paramRotulo$(1) = "dos arquivos de Lajes (.LAJ)"
    paramChave$(2) = "ARQUIVOS DE VIGAS": paramRotulo$(2) = "dos arquivos de Vigas (.VIG .SEC .FOR)"
    paramChave$(3) = "ARQUIVOS DE COLUNAS": paramRotulo$(3) = "dos arquivos de Colunas (.COL)"
    paramChave$(4) = "ARQUIVOS DE FORMAS": paramRotulo$(4) = "dos arquivos de Formas (.FRM)"
    paramChave$(5) = "ARQUIVOS DE PARAMETRIZACAO": paramRotulo$(5) = "dos arquivos de Parametrizacao (.FOP)"
    paramChave$(6) = "ARQUIVOS PADRAO CAD": paramRotulo$(6) = "dos arquivos publicos CAD (.DXF)"
    paramChave$(7) = "ARQUIVOS DE PLOTAGEM": paramRotulo$(7) = "dos arquivos de plotagem (.PLT)"
END SUB

' Pasta do FORMA.INI pela descricao da chave, com barra final e validada por
' DirUtilizavel$ (raiz ou pasta inexistente vira a pasta de trabalho). "" se a linha nao existir.
FUNCTION IniDirDe$ (chave$)
    DIM i%
    IniDirDe$ = ""
    i% = ArqAchaTexto%(chave$, 0)
    IF i% > 0 THEN IniDirDe$ = DirUtilizavel$(IniValor$(i%))
END FUNCTION

' Garante a barra final em um diretorio. Texto vazio continua vazio.
FUNCTION DirBarra$ (dir$)
    IF dir$ <> "" AND RIGHT$(dir$, 1) <> "\" THEN
        DirBarra$ = dir$ + "\"
    ELSE
        DirBarra$ = dir$
    END IF
END FUNCTION

' Pede o nome da obra corrente. Enter confirma e grava SISTRUT.OBR; Esc mantem o atual.
' RECONSTRUCAO: o dump de FORMA nao traz o rotulo deste campo.
SUB TelaObra
    DIM nova$
    CLS
    TelaMoldura 1, 1, 23, 80
    COLOR COR_TEXTO
    LOCATE 7, 4: PRINT "Nome da obra:"
    nova$ = EntradaTexto$(7, 20, 40, obra$)
    IF nova$ <> "" THEN
        obra$ = nova$
        ObraDefine obraDir$, obra$
    END IF
END SUB

' Desenha o menu principal: titulo, obra corrente, seis opcoes e a linha de status.
SUB TelaPrincipal
    CLS
    TelaMoldura 1, 1, 23, 80
    COLOR COR_DESTAQUE
    LOCATE 2, 24: PRINT "MONTAGEM E DESENHO DE FORMAS"
    COLOR COR_TEXTO
    LOCATE 3, 24: PRINT "OpenStrut                               "
    LOCATE 4, 24: PRINT "Outubro 1993   (omitido)                 "
    LOCATE 5, 24: PRINT "Versao 4.0"
    LOCATE 7, 4: PRINT "Obra: " + obra$
    TelaOpcao 9, "1  -  ", "Montagem e Desenho de Formas"
    TelaOpcao 10, "2  -  ", "Reeditadas, acesso as Formas gravadas"
    TelaOpcao 11, "3  -  ", "Impressao de Formas"
    TelaOpcao 12, "4  -  ", "Desenhos e Plotagens"
    TelaOpcao 13, "5  -  ", "Parametrizacoes / escolha"
    TelaOpcao 14, "6  -  ", "Alteracao de Drive e Subdiretorio"
    COLOR COR_TEXTO
    LOCATE 16, 20: PRINT "escolha opcao"
    TelaStatus "<F2> = Fim"
END SUB

' Escreve uma opcao de menu: numero$ em texto comum e a primeira letra de texto$ em destaque.
SUB TelaOpcao (lin%, numero$, texto$)
    COLOR COR_TEXTO
    LOCATE lin%, 20: PRINT numero$;
    TelaItemMenu lin%, 20 + LEN(numero$), texto$
END SUB

' Tela de parametrizacoes: mostra as pastas e aceita D para alterar drive e diretorio.
' Enter ou Esc volta ao menu.
SUB TelaParametros
    DIM k$
    ParamDesenha
    DO
        k$ = TeclaLer$
        IF UCASE$(k$) = "D" THEN
            AlteraDrive
            ParamDesenha
        ELSEIF k$ = CHR$(13) OR k$ = CHR$(27) THEN
            EXIT DO
        END IF
    LOOP
END SUB

' Desenha a tela de parametrizacoes: uma linha por pasta, com o valor atual do FORMA.INI.
SUB ParamDesenha
    DIM k%, i%, valor$
    CLS
    TelaMoldura 1, 1, 23, 80
    COLOR COR_TEXTO
    LOCATE 3, 4: PRINT "Drive:\Diretorio\...\Subdiretorio"
    FOR k% = 1 TO NUM_PARAM
        valor$ = ""
        i% = ArqAchaTexto%(paramChave$(k%), 0)
        IF i% > 0 THEN valor$ = IniValor$(i%)
        LOCATE 3 + k%, 4: PRINT LEFT$(valor$ + SPACE$(30), 30); " "; paramRotulo$(k%)
    NEXT
    LOCATE 21, 4: PRINT "Acione  D <Enter>  para alterar Drive e Diretorio"
    TelaStatus "Acione ESC <Enter> para Continuar"
END SUB

' Pede um drive e diretorio e grava nas 7 pastas do FORMA.INI. Esc cancela.
' Diretorio inexistente nao grava.
SUB AlteraDrive
    DIM novo$, i%, k%, tecla$
    COLOR COR_TEXTO
    LOCATE 22, 4: PRINT "Drive:\Diretorio\...\Subdiretorio ";
    novo$ = EntradaTexto$(22, 38, 36, "")
    IF novo$ = "" THEN EXIT SUB
    novo$ = DirBarra$(novo$)
    IF NOT _DIREXISTS(novo$) THEN
        TelaErro "NAO EXISTE ESTE ARQUIVO NESTE DISCO. VERIFIQUE O SEU DRIVE"
        tecla$ = TeclaLer$
        EXIT SUB
    END IF
    FOR k% = 1 TO NUM_PARAM
        i% = ArqAchaTexto%(paramChave$(k%), 0)
        IF i% > 0 THEN IniDefinir i%, novo$
    NEXT
    ArqGravar iniArq$
END SUB

' Despacha a tecla do menu: digito ou letra da opcao.
SUB MenuTecla (k$)
    SELECT CASE UCASE$(k$)
        CASE "1", "M": Montagem
        CASE "2", "R": Reedicao
        CASE "3", "I": SubmoduloExecuta "FORMIMP"
        CASE "4", "D": SubmoduloExecuta "FORMPLOT"
        CASE "5", "P": TelaParametros
        CASE "6", "A": ParamDesenha: AlteraDrive
    END SELECT
END SUB

' Chama um submodulo pelo nome, se o .EXE existir no diretorio de executaveis.
SUB SubmoduloExecuta (nome$)
    DIM dir$, tecla$
    dir$ = ComumDirExec$
    IF dir$ = "" THEN dir$ = DIR_EXEC_PADRAO
    IF FileExists%(dir$ + nome$ + ".EXE") = 0 THEN
        TelaErro "Modulo nao encontrado em " + dir$ + nome$ + ".EXE"
        tecla$ = TeclaLer$
        EXIT SUB
    END IF
    TelaStatus "Aguarde ..."
    RunSubmodulo nome$
END SUB

' Mensagem de encerramento (F2) e saida. A linha do gerenciador e inferida do dump.
SUB TelaFim
    CLS
    COLOR COR_TEXTO
    LOCATE 11, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    LOCATE 12, 10: PRINT "Retorno ao Modulo Gerenciador"
    COLOR COR_TEXTO, 0
    SYSTEM
END SUB

' Montagem: le Lajes, Vigas e Colunas da obra (cada um pede o nome e repete se falhar),
' mostra as quantidades e, com S, chama FORMINIT. Esc em qualquer nome volta ao menu.
' RECONSTRUCAO: FORMINIT nao recebe os nomes lidos; o canal de passagem nao esta no dump.
' Vigas: so o tipo VIG. Os tipos SEC e FOR nao tem fluxo reconstruido.
SUB Montagem
    DIM nome$
    CLS
    TelaMoldura 1, 1, 23, 80
    COLOR COR_TEXTO
    LOCATE 3, 4: PRINT "Leitura de dados"
    LajObra = obra$: VigObra = obra$: ColObra = obra$

    DO
        nome$ = PedeNome$(5, "Nome do Arquivo de Lajes")
        IF nome$ = "" THEN EXIT SUB
        IF LajLe%(DirDado$(1) + nome$ + ".LAJ") THEN EXIT DO
        FalhaLeitura
    LOOP
    MostraLido 7, "Lajes a serem utilizadas", LajQtd

    DO
        nome$ = PedeNome$(8, "Nome do Arquivo de Vigas")
        IF nome$ = "" THEN EXIT SUB
        IF VigLe%(DirDado$(2) + nome$ + ".VIG", "VIG") THEN EXIT DO
        FalhaLeitura
    LOOP
    MostraLido 10, "Vigas a serem utilizadas", VigQtd

    DO
        nome$ = PedeNome$(11, "Nome do Arquivo de Colunas")
        IF nome$ = "" THEN EXIT SUB
        IF ColLe%(DirDado$(3) + nome$ + ".COL") THEN EXIT DO
        FalhaLeitura
    LOOP
    MostraLido 13, "Colunas a serem utilizadas", ColQtd

    LOCATE 15, 4: COLOR COR_TEXTO
    PRINT "Todos os dados de dimensionamento foram lidos."
    IF SimNao%(17, "Inicio a montagem da Forma") THEN SubmoduloExecuta "FORMINIT"
END SUB

' Reedicao: pede o nome da Forma (.FRM) e confere se o arquivo existe; com S chama FORMEDCA.
' Nome inexistente mostra o aviso e pede outro. Esc volta ao menu.
' RECONSTRUCAO: FORMEDCA nao recebe a Forma escolhida; o canal de passagem nao esta no dump.
SUB Reedicao
    DIM nome$, tecla$
    CLS
    TelaMoldura 1, 1, 23, 80
    COLOR COR_TEXTO
    DO
        nome$ = PedeNome$(5, "Forma a ser editada")
        IF nome$ = "" THEN EXIT SUB
        IF FileExists%(DirDado$(4) + nome$ + ".FRM") THEN EXIT DO
        LOCATE 7, 4: PRINT nome$ + ".FRM NAO ENCONTRADO"
        LOCATE 9, 4: PRINT "Qualquer Tecla para Continuar"
        tecla$ = TeclaLer$
        LOCATE 7, 4: PRINT SPACE$(60)
        LOCATE 9, 4: PRINT SPACE$(60)
    LOOP
    IF SimNao%(7, "Inicio da reedicao da Forma") THEN SubmoduloExecuta "FORMEDCA"
END SUB

' Pergunta de confirmacao na linha lin%: S devolve -1; N ou Esc devolve 0; outras teclas sao ignoradas.
FUNCTION SimNao% (lin%, texto$)
    DIM k$
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT texto$ + "  N/*S*";
    DO
        k$ = UCASE$(TeclaLer$)
        IF k$ = "S" THEN SimNao% = -1: EXIT FUNCTION
        IF k$ = "N" OR k$ = CHR$(27) THEN SimNao% = 0: EXIT FUNCTION
    LOOP
END FUNCTION

' Campo de nome de arquivo com o rotulo e *RETORNO*. Devolve o nome em maiusculas;
' "" (Enter vazio ou Esc) significa voltar.
FUNCTION PedeNome$ (lin%, rotulo$)
    DIM texto$
    texto$ = rotulo$ + "  *RETORNO* "
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT SPACE$(70);
    LOCATE lin%, 4: PRINT texto$;
    PedeNome$ = UCASE$(EntradaTexto$(lin%, 4 + LEN(texto$), 8, ""))
END FUNCTION

' Pasta do FORMA.INI para o tipo de dado k% (ver ParamInicia). Sem valor, usa o diretorio do executavel.
FUNCTION DirDado$ (k%)
    DIM d$
    d$ = IniDirDe$(paramChave$(k%))
    IF d$ = "" THEN d$ = ComumDirExec$
    DirDado$ = d$
END FUNCTION

' Linha de contagem de elementos lidos: rotulo e quantidade.
SUB MostraLido (lin%, rotulo$, qtd%)
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT rotulo$ + ": " + LTRIM$(STR$(qtd%))
END SUB

' Mostra o motivo da falha de leitura (DadErro) e espera uma tecla.
SUB FalhaLeitura
    DIM tecla$
    TelaErro DadErro
    tecla$ = TeclaLer$
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
