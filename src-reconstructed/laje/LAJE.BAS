' ============================================================================
'  LAJE.BAS - gerenciador da familia LAJE (lajes em regime de ruptura).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de LAJE.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/LAJE.md.
'
'  Convencao SISTRUT.OBR: o nome da obra corrente fica em <dir de dados>SISTRUT.OBR.
'  Este modulo so le a obra (ObraAtual$) para o cabecalho; nao chama ObraDefine,
'  porque nao pede outra obra. Os submodulos (LAJEGRAV, ...) leem e gravam o
'  SISTRUT.OBR por conta propria.
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE
'  (rotulo ausente, destino nao identificado, fonte de dados desconhecida).
'  Verificacao de licenca do original nao reimplementada.
'  Compilacao: bash tools/build.sh laje/LAJE.BAS
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Descricoes das linhas do LAJE.INI (texto depois do "="). A linha se acha
' pela descricao, nao pela posicao.
CONST DESC_LAP = "PARAMETRIZACAO UTILIZADA - NOME DO ARQUIVO PARAMETRIZACAO DEFAULT"
CONST DESC_DIRLAP = "DRIVE E DIRETORIO DEFAULT PARA OS ARQUIVOS PARAMETRIZACAO (.LAP)"
CONST DESC_FCK = "RESISTENCIA CARACTERISTICA DO CONCRETO - Fck"
CONST DESC_FYK = "RESISTENCIA CATACTERISTICA DO ACO - Fyk"
CONST DESC_GRANDEZA = "UNIDADE DE GRANDEZA PARA Fck E Fyk"
CONST DESC_MULT_GRANDEZA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE Fck E Fyk PARA TRANSFORMAR EM T/C2"
CONST DESC_ACO = "TIPO DE ACO (A/B)"
CONST DESC_CS_FORCA = "COEFICIENTE DE SEGURANCA DOS ESFORCOS"
CONST DESC_CS_CONC = "COEFICIENTE DE SEGURANCA DO CONCRETO"
CONST DESC_CS_ACO = "COEFICIENTE DE SEGURANCA DO ACO"
CONST DESC_UN_FORCA = "UNIDADE DE FORCA"
CONST DESC_MULT_FORCA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE FORCA PARA TRANSFORMAR EM TONELADAS"
CONST DESC_UN_MEDIDA = "UNIDADE DE MEDIDA LINEAR"
CONST DESC_MULT_MEDIDA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE MEDIDA PARA TRANSFORMAR EM METROS"

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB Chama (nome AS STRING)
DECLARE SUB ItemMateriais ()
DECLARE SUB ItemCorrecao ()
DECLARE SUB ItemLista ()
DECLARE SUB IniEdita (lin AS INTEGER, col AS INTEGER, desc AS STRING, tipo AS INTEGER)
DECLARE FUNCTION IniValido% (v AS STRING, tipo AS INTEGER)
DECLARE FUNCTION IniLinhaDesc% (desc AS STRING)
DECLARE FUNCTION IniValorDe$ (desc AS STRING)
DECLARE FUNCTION IniArq$ ()
DECLARE FUNCTION LapNome$ ()
DECLARE FUNCTION LapSituacao% (arq AS STRING)
DECLARE FUNCTION DirComBarra$ (d AS STRING)
DECLARE FUNCTION LapCaminho$ (nome AS STRING)
DECLARE FUNCTION LajLe% (arq AS STRING)
' Rotina de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra

CarregaConfiguracao
MenuPrincipal
CLS
LOCATE 12, 3: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le LAJE.INI da pasta de execucao (drive e diretorio de dados) e verifica o
' .LAP da parametrizacao. Sem LAJE.INI usa C:\ . ArqLer% substitui ArqDados$,
' por isso o INI e lido de novo depois do .LAP.
' RECONSTRUCAO: o EXE nao mostra a leitura do INI; as chaves vem dos nomes do LAJE.INI.
SUB CarregaConfiguracao
    DIM d AS STRING, lap AS STRING, sit AS INTEGER, i AS INTEGER
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    TelaStatus "Aguarde ..."            ' RECONSTRUCAO: posicao do aviso no EXE nao confirmada
    i = ArqLer%(IniArq$)
    IF i >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    lap = LapCaminho$(LapNome$)
    sit = LapSituacao%(lap)
    i = ArqLer%(IniArq$)
    LajObra = ObraAtual$(DirDados)
    IF LajObra = "" THEN LajObra = "sem nome"
    IF sit = 0 THEN
        CLS
        LOCATE 10, 3: PRINT ".LAP   nao encontrado"
    ELSEIF sit = 2 THEN
        CLS
        LOCATE 10, 3: PRINT "Erro no Arquivo parametrizacao"
    END IF
    IF sit <> 1 THEN
        LOCATE 11, 3: PRINT "Sera adotada a parametrizacao SISTRUT"
        LOCATE 12, 3: PRINT "Arquivo parametrizacao "; lap
        Espera "", 0
    END IF
END SUB

' Menu principal. Teclas 1 a 7 seguem os rotulos "N  -  " do LAJE.EXE original
' (install_source/LAJE.EXE, desempacotado em dist/unpacked/LAJE.EXE). As letras
' destacadas nos rotulos sao mnemonicos, nao teclas. 8 e 9 nao tem rotulo no
' original; F2 termina. Itens sem evidencia completa estao marcados RECONSTRUCAO.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        MenuLinha 7, "1", "Definicao dos Materiais, Concreto Aco"
        MenuLinha 8, "2", "Arquivar dados de Painel"
        MenuLinha 9, "3", "Continuidade / Espessura / Dimensionamento"
        MenuLinha 10, "4", "Processar / Detalhar Lajes"
        MenuLinha 11, "5", "Lista das Lajes Arquivadas"
        MenuLinha 12, "6", "Gravacao e Leitura"
        MenuLinha 13, "7", "Visualizar e Alterar Parametrizacoes"
        MenuLinha 14, "8", "Geometria das Lajes"    ' RECONSTRUCAO: rotulo ausente no original
        MenuLinha 15, "9", "Montagem .VIG .RLP"     ' RECONSTRUCAO: rotulo ausente no original
        LOCATE 19, 10: PRINT "<F2> = Fim"
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": ItemMateriais
            CASE "2": Chama "LAJEGRAV"              ' RECONSTRUCAO: "Arquivar dados de Painel" -> LAJEGRAV [inferido]
            CASE "3": Chama "LAJECALC"              ' RECONSTRUCAO: um rotulo com tres opcoes; destino unico [inferido]
            CASE "4": Chama "LAJEPROC"
            CASE "5": ItemLista
            CASE "6": Chama "LAJEGRAV"              ' RECONSTRUCAO: "Gravacao e Leitura" sem destino no dump; LAJEGRAV tem esse titulo [inferido]
            CASE "7": ItemCorrecao                  ' RECONSTRUCAO: destino Correcao de Parametros (0x00e6b8) [inferido]
            CASE "8": Chama "LAJEGEOM"              ' RECONSTRUCAO: rotulo e tecla inventados
            CASE "9": Chama "LAJEMONT"              ' RECONSTRUCAO: rotulo e tecla inventados
            CASE CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Titulo, empresa, obra corrente e unidade de dados. subtit "" nao escreve na linha 5.
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "LAJES EM REGIME DE RUPTURA"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "OpenStrut                              *"   ' "*" como no EXE
    LOCATE 3, 3: PRINT "Abril 1991   (omitido)                 "
    LOCATE 4, 3: PRINT "Versao 4.0"
    LOCATE 1, 45: PRINT "Obra - "; LajObra       ' RECONSTRUCAO: posicao e rotulo inventados
    LOCATE 2, 45: PRINT "Dados em "; DirCurto$(DirDados, 26)
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 5, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Uma linha do menu: tecla em destaque, texto em COR_TEXTO.
SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
    LOCATE lin, 10
    COLOR COR_DESTAQUE
    PRINT tecla;
    COLOR COR_TEXTO
    PRINT "  -  "; texto
END SUB

' Mostra texto na linha de erro (erro = -1, linha 24) ou de status (linha 25),
' espera ESC ou Enter e limpa as linhas 23 a 25. texto "" so espera.
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

' Executa o submodulo nome pela pasta dos executaveis. Sem o .EXE, avisa.
' Depois do retorno, espera tecla (RECONSTRUCAO: protocolo VOLTA nao identificado).
SUB Chama (nome AS STRING)
    IF FileExists%(ComumDirExec$ + nome + ".EXE") = 0 THEN
        Espera "Modulo nao encontrado em " + ComumDirExec$ + nome + ".EXE", -1
    ELSE
        TelaStatus "Aguarde ..."
        RunSubmodulo nome
        Espera "Retorno ao Modulo Gerenciador", 0
    END IF
END SUB

' Definicao dos Materiais (0x00e388): Fck, Fyk, unidade e tipo de aco no LAJE.INI.
' Enter ou ESC em cada campo passa ao seguinte; ao final espera ESC ou Enter.
' Linha 10 e 11: o rotulo do multiplicador e dividido em torno do campo, como no dump.
SUB ItemMateriais
    CLS
    TelaCabecalho "Definicao dos Materiais e unidades de trabalho"
    LOCATE 7, 3: PRINT "Concreto Fck *";
    IniEdita 7, 50, DESC_FCK, 1
    LOCATE 8, 3: PRINT "Aco      Fyk *";
    IniEdita 8, 50, DESC_FYK, 1
    LOCATE 9, 3: PRINT "    Unidade de grandeza para os valores caracteristicos do Concreto e Aco"
    IniEdita 10, 3, DESC_GRANDEZA, 0
    LOCATE 11, 3: PRINT "Multiplicador de (*";
    LOCATE 11, 37: PRINT ") para transformar em Tonelada/Centimetro2";
    IniEdita 11, 22, DESC_MULT_GRANDEZA, 1
    LOCATE 12, 3: PRINT "Tipo de Aco  A/B *";
    IniEdita 12, 50, DESC_ACO, 4
    Espera "", 0
END SUB

' Correcao de Parametros (0x00e6b8). Mostra os valores do LAJE.INI e edita o item
' digitado. Enter ou ESC volta ao menu.
' RECONSTRUCAO: "*NAO*" tratado como "Enter sem alterar"; o sentido exato do campo nao foi identificado.
SUB ItemCorrecao
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho "Correcao de Parametros"
        LOCATE 6, 3: PRINT "Parametrizacao Utilizada (.LAP)"
        LOCATE 7, 3: PRINT "(P)  Parametrizacao ="; : LOCATE 7, 62: PRINT LapNome$
        LOCATE 8, 3: PRINT "Coeficientes de Seguranca"
        LOCATE 9, 3: PRINT "(1)  Forcas ="; : LOCATE 9, 62: PRINT IniValorDe$(DESC_CS_FORCA)
        LOCATE 10, 3: PRINT "(2)  Concreto ="; : LOCATE 10, 62: PRINT IniValorDe$(DESC_CS_CONC)
        LOCATE 11, 3: PRINT "(3)  Aco ="; : LOCATE 11, 62: PRINT IniValorDe$(DESC_CS_ACO)
        LOCATE 12, 3: PRINT "Unidades de trabalho dos esforcos solicitantes"
        LOCATE 13, 3: PRINT "(4)  Unidade de Forca ="; : LOCATE 13, 62: PRINT IniValorDe$(DESC_UN_FORCA)
        LOCATE 14, 3: PRINT "(5)  Coef. multiplicador para transformar em toneladas ="; : LOCATE 14, 62: PRINT IniValorDe$(DESC_MULT_FORCA)
        LOCATE 15, 3: PRINT "(6)  Unidade de Medida ="; : LOCATE 15, 62: PRINT IniValorDe$(DESC_UN_MEDIDA)
        LOCATE 16, 3: PRINT "(7)  Coef. multiplicador para transformar em metros ="; : LOCATE 16, 62: PRINT IniValorDe$(DESC_MULT_MEDIDA)
        LOCATE 18, 3: PRINT "item , Novo Valor  *NAO* 1";     ' RECONSTRUCAO: "1" do dump; sentido do campo nao identificado
        LOCATE 19, 3: PRINT "Acione  D <Enter>  para alterar Drive e Diretorio"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE CHR$(13), CHR$(27): EXIT DO
            CASE "P"
                LOCATE 21, 3: PRINT "Nome do Arquivo PARAMETRIZACAO *"     ' RECONSTRUCAO: posicao do rotulo
                IniEdita 21, 36, DESC_LAP, 2
            CASE "1": IniEdita 9, 62, DESC_CS_FORCA, 1
            CASE "2": IniEdita 10, 62, DESC_CS_CONC, 1
            CASE "3": IniEdita 11, 62, DESC_CS_ACO, 1
            CASE "4": IniEdita 13, 62, DESC_UN_FORCA, 0
            CASE "5": IniEdita 14, 62, DESC_MULT_FORCA, 1
            CASE "6": IniEdita 15, 62, DESC_UN_MEDIDA, 0
            CASE "7": IniEdita 16, 62, DESC_MULT_MEDIDA, 1
            CASE "D"
                LOCATE 20, 3: PRINT "    dos arquivos de Parametrizacao (.LAP)"   ' RECONSTRUCAO: posicao do rotulo
                LOCATE 21, 3: PRINT "Drive:\Diretorio\...\Subdiretorio"
                IniEdita 22, 3, DESC_DIRLAP, 3
        END SELECT
    LOOP
END SUB

' Edita o valor da linha do LAJE.INI com descricao desc, no ponto lin/col.
' tipo: 0 texto; 1 numero; 2 nome de .LAP existente; 3 diretorio existente (grava
' com "\" final); 4 letra A ou B. Valor igual ao atual ou ESC nao grava. Valor
' invalido pede de novo. Valor aceito e gravado no LAJE.INI com IniDefinir + ArqGravar.
SUB IniEdita (lin AS INTEGER, col AS INTEGER, desc AS STRING, tipo AS INTEGER)
    DIM n AS INTEGER, atual AS STRING, dflt AS STRING, v AS STRING, larg AS INTEGER
    n = IniLinhaDesc%(desc)
    IF n = 0 THEN
        Espera "Chave nao existe no LAJE.INI: " + desc, -1
        EXIT SUB
    END IF
    atual = IniValor$(n)
    dflt = atual
    larg = 14
    IF tipo = 3 THEN larg = 50
    DO
        v = EntradaTexto$(lin, col, larg, dflt)
        IF tipo = 3 THEN v = DirComBarra$(v)
        IF tipo = 4 THEN v = UCASE$(v)
        IF v = atual THEN EXIT DO
        IF IniValido%(v, tipo) THEN
            IniDefinir n, v
            ArqGravar(IniArq$)
            EXIT DO
        END IF
        dflt = v
        IF tipo = 2 THEN
            TelaErro "NAO EXISTE ESTE ARQUIVO "
        ELSEIF tipo = 3 THEN
            TelaErro "Nenhum Arquivo Encontrado"    ' RECONSTRUCAO: texto do EXE; uso por tipo 3 nao confirmado
        ELSE
            TelaErro "Valor invalido para este campo."   ' RECONSTRUCAO: texto nao encontrado no dump
        END IF
        Espera "", 0
    LOOP
END SUB

' Vale o valor v para o tipo do campo (ver IniEdita).
FUNCTION IniValido% (v AS STRING, tipo AS INTEGER)
    SELECT CASE tipo
        CASE 1: IniValido% = NumeroValido%(v)
        CASE 2: IniValido% = FileExists%(LapCaminho$(v))
        CASE 3: IniValido% = (LEN(v) > 1 AND _DIREXISTS(v))
        CASE 4: IniValido% = (v = "A" OR v = "B")
        CASE ELSE: IniValido% = (LEN(v) > 0)
    END SELECT
END FUNCTION

' Numero da linha do LAJE.INI cuja descricao e igual a desc. 0 se nao existe.
FUNCTION IniLinhaDesc% (desc AS STRING)
    DIM i AS INTEGER
    FOR i = 1 TO ArqQtd
        IF IniDesc$(i) = desc THEN
            IniLinhaDesc% = i
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Valor (texto antes do "=") da linha com descricao desc. "?" se a linha nao existe.
FUNCTION IniValorDe$ (desc AS STRING)
    DIM n AS INTEGER
    n = IniLinhaDesc%(desc)
    IF n > 0 THEN IniValorDe$ = IniValor$(n) ELSE IniValorDe$ = "?"
END FUNCTION

' Caminho do LAJE.INI: pasta de execucao (ComumDirExec$), a mesma lida na inicializacao.
FUNCTION IniArq$ ()
    IniArq$ = ComumDirExec$ + "LAJE.INI"
END FUNCTION

' Nome do .LAP sem extensao: valor da chave da parametrizacao; SISTRUT se a chave falta.
FUNCTION LapNome$ ()
    DIM n AS INTEGER
    n = IniLinhaDesc%(DESC_LAP)
    IF n > 0 THEN LapNome$ = IniValor$(n) ELSE LapNome$ = "SISTRUT"
END FUNCTION

' Caminho completo do .LAP <nome>: pasta do LAJE.INI se o arquivo estiver la; senao
' a pasta do programa (ComumDirExec$), onde o LAJECALC tambem procura.
FUNCTION LapCaminho$ (nome AS STRING)
    DIM d AS STRING
    d = DirUtilizavel$(IniDirParam$)
    IF FileExists%(d + nome + ".LAP") THEN
        LapCaminho$ = d + nome + ".LAP"
    ELSE
        LapCaminho$ = ComumDirExec$ + nome + ".LAP"
    END IF
END FUNCTION

' Situacao do .LAP: 0 = nao existe; 2 = sem a marca "FINAL DA PARAMETRIZACAO"; 1 = ok.
' Usa ArqLer%, que substitui ArqDados$: quem chama deve reler o INI depois.
FUNCTION LapSituacao% (arq AS STRING)
    IF ArqLer%(arq) < 0 THEN
        LapSituacao% = 0
    ELSEIF ArqAchaTexto%("FINAL DA PARAMETRIZACAO", 0) = 0 THEN
        LapSituacao% = 2
    ELSE
        LapSituacao% = 1
    END IF
END FUNCTION

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Carrega <obra>.LAJ da obra corrente e lista as lajes (teclas 1 a 16 de linhas).
' Falha de leitura mostra DadErro e volta ao menu. O cabecalho de colunas e do EXE;
' as linhas mostram nome, lx, ly, h e area.
SUB ItemLista
    DIM i AS INTEGER, mostra AS INTEGER, k AS STRING
    IF LajLe%(DirDados + LajObra + ".LAJ") = 0 THEN
        Espera DadErro, -1
        EXIT SUB
    END IF
    CLS
    TelaCabecalho "Lista das Lajes arquivadas            Obra H"
    LOCATE 5, 46: PRINT LajObra                ' RECONSTRUCAO: "H" do titulo e inicio do campo da obra
    LOCATE 6, 3: PRINT "Laje    tipo  lados  livre   peso p.    carga     area     H   Armadura"
    IF LajQtd = 0 THEN
        LOCATE 8, 3: PRINT "Nao ha Lajes Arquivadas na Memoria"    ' RECONSTRUCAO: texto nao encontrado no dump
    ELSE
        mostra = LajQtd
        IF mostra > 16 THEN mostra = 16
        ' RECONSTRUCAO: conteudo das colunas inferido dos titulos: tipo = cruz ou
        ' armada em 1 direcao (ly/lx > 2); lados = bordos engastados; livre =
        ' bordos livres; peso p. = 2,5 h (tf/m2); carga = g + q (tf/m2);
        ' area (m2); H (cm); Armadura = calculada ou nao
        FOR i = 1 TO mostra
            LOCATE 6 + i, 3: PRINT RTRIM$(Laj(i).nome);
            LOCATE 6 + i, 11: PRINT LajTipoLista$(i);
            LOCATE 6 + i, 18: PRINT LTRIM$(STR$(LajContaBordo%(i, "E")));
            LOCATE 6 + i, 25: PRINT LTRIM$(STR$(LajContaBordo%(i, "L")));
            LOCATE 6 + i, 31: PRINT FormataNumero$(2.5# * Laj(i).h / 100#, 3, 8);
            LOCATE 6 + i, 41: PRINT FormataNumero$(Laj(i).g + Laj(i).q, 3, 8);
            LOCATE 6 + i, 50: PRINT FormataNumero$(Laj(i).lx * Laj(i).ly, 2, 8);
            LOCATE 6 + i, 59: PRINT FormataNumero$(Laj(i).h, 1, 5);
            LOCATE 6 + i, 66: IF Laj(i).temRes THEN PRINT "calculada" ELSE PRINT "nao";
        NEXT
        IF LajQtd > mostra THEN LOCATE 23, 3: PRINT "Mostrando " + LTRIM$(STR$(mostra)) + " de " + LTRIM$(STR$(LajQtd))
    END IF
    LOCATE 24, 3: PRINT "Qualquer Tecla para Continuar";
    k = TeclaLer$
END SUB

' Tipo da laje para a lista: "cruz" ou "1 dir" (ly/lx ou lx/ly acima de 2).
FUNCTION LajTipoLista$ (i AS INTEGER)
    DIM a AS DOUBLE, b AS DOUBLE
    a = Laj(i).lx: b = Laj(i).ly
    IF a <= 0 OR b <= 0 THEN LajTipoLista$ = "-": EXIT FUNCTION
    IF b / a > 2 OR a / b > 2 THEN LajTipoLista$ = "1 dir" ELSE LajTipoLista$ = "cruz"
END FUNCTION

' Quantos bordos da laje i tem a letra c (E engastado, L livre).
FUNCTION LajContaBordo% (i AS INTEGER, c AS STRING)
    DIM k AS INTEGER, n AS INTEGER
    FOR k = 1 TO 4
        IF UCASE$(MID$(Laj(i).bordos, k, 1)) = c THEN n = n + 1
    NEXT
    LajContaBordo% = n
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
