' ============================================================================
'  ARMADURA.BAS - dimensionamento de armadura de secoes de vigas de concreto
'  armado (flexao simples, NB-1/78). Fonte RECONSTRUIDO (engenharia reversa)
'  a partir de ARMADURA.EXE (1991), originalmente QuickBASIC 4.5.
'  Especificacao: docs/modules/ARMADURA.md.
'
'  Unidades: tf, cm, tf/cm2 (ver common/CALCCA.BM). Armadura dupla em ARMCALC.BM.
'  Secoes do ARMADURA gravadas pelo SISDADOS (VigGrava "SEC") em <obra>_ARM.SEC.
' Arquivo de secoes proprio (<obra>_ARM.SEC) para nao misturar com o .SEC do VIGA.
'
'  Teclas do menu inferidas do dump de textos (letra destacada perdida no
'  dump); so o item 4 traz o numero no dump.
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Verificacao de licenca do original nao reimplementada.
'  Compilacao: bash tools/build.sh viga/ARMADURA
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Descricoes das linhas do ARMADURA.INI (texto depois do "="). A linha se acha
' pela descricao, nao pela posicao. Textos iguais aos do arquivo, typos inclusos.
CONST DESC_DRIVE = "DRIVE DEFAULT DE DADOS"
CONST DESC_DIRDADOS = "DIRETORIO DEFAULT DE DADOS"
CONST DESC_UN_MEDIDA = "UNIDADE DE MEDIDA LINEAR"
CONST DESC_UN_FORCA = "UNIDADE DE FORCA"
CONST DESC_MULT_MEDIDA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE MEDIDA PARA TRANSFORMAR EM METROS"
CONST DESC_MULT_FORCA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE FORCA PARA TRANSFORMAR EM TONELADAS"
CONST DESC_GRANDEZA = "UNIDADE DE GRANDEZA PARA Fck E Fyk"
CONST DESC_MULT_GRANDEZA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE Fck E Fyk PARA TRANSFORMAR EM T/C2"
CONST DESC_FCK = "RESISTENCIA CARACTERISTICA DO CONCRETO - Fck"
CONST DESC_FYK = "RESISTENCIA CATACTERISTICA DO ACO - Fyk"
CONST DESC_ACO = "TIPO DE ACO (A/B)"
CONST DESC_LIM_LN = "LIMITE DA LINHA NEUTRA PARA INICIO DE CONSIDERACAO DE ARMADURA DUPLA"
CONST DESC_TAXA = "TAXA DE ARMADURA LONGITUDINAL TRACIONADA - TENSAO CORRECAO CISALHAMENTO"
CONST DESC_CS_FORCA = "COEFICIENTE DE SEGURANCA DOS ESFORCOS"
CONST DESC_CS_CONC = "COEFICIENTE DE SEGURANCA DO CONCRETO"
CONST DESC_CS_ACO = "COEFICIENTE DE SEGURANCA DO ACO"
CONST DESC_ESTRIBO_DUPLO = "LARGURA DA PECA PARA INICIO DE ESTRIBLO DUPLO - 4 RAMOS"
CONST DESC_ESTRIBO_TRIPLO = "LARGURA DA PECA PARA INICIO DE ESTRIBO TRIPLO - 6 RAMOS"

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB ItemMateriais ()
DECLARE SUB IniEdita (lin AS INTEGER, col AS INTEGER, desc AS STRING, tipo AS INTEGER)
DECLARE FUNCTION IniValido% (v AS STRING, tipo AS INTEGER)
DECLARE FUNCTION IniLinhaDesc% (desc AS STRING)
DECLARE FUNCTION IniValorDe$ (desc AS STRING)
DECLARE FUNCTION IniArq$ ()
DECLARE FUNCTION DirComBarra$ (d AS STRING)
' Rotina de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ItemArquivar ()
DECLARE SUB ItemProcessar ()
DECLARE SUB ArmCadastraRetangular (mudou AS INTEGER)
DECLARE FUNCTION ArmFmt$ (x AS DOUBLE)
DECLARE FUNCTION ArmFlexao% (md AS DOUBLE, bw AS DOUBLE, h AS DOUBLE, d AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, taxa AS DOUBLE, asOut AS DOUBLE, aslOut AS DOUBLE, phiOut AS DOUBLE, nOut AS INTEGER)
DECLARE FUNCTION ArmProcessaSecao% (v AS INTEGER, gf AS DOUBLE, fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, taxa AS DOUBLE, lin AS INTEGER)
DECLARE FUNCTION ArmEstribo% (vd AS DOUBLE, bw AS DOUBLE, d AS DOUBLE, fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, asl AS DOUBLE, taxa AS DOUBLE, aswOut AS DOUBLE, phiOut AS DOUBLE, sOut AS DOUBLE)
DECLARE SUB ArmLeMateriais (fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, gf AS DOUBLE, taxa AS DOUBLE, ok AS INTEGER)
DECLARE FUNCTION ArmNumIni# (desc AS STRING)
DECLARE SUB ArmLeRetangular (b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, mk AS DOUBLE, vk AS DOUBLE, ok AS INTEGER)
DECLARE SUB ItemAvulso ()
DECLARE SUB ArmAvulsoRetangular ()
DECLARE SUB ItemCorrige ()
DECLARE FUNCTION ArmItemValor# (v AS INTEGER, it AS INTEGER)
DECLARE SUB ArmCorrigePosicao (v AS INTEGER, it AS INTEGER, novo AS DOUBLE, mudou AS INTEGER)
DECLARE SUB ItemParametros ()
DECLARE SUB ItemLista ()
DECLARE SUB ArmRelatorio (arq AS STRING)
DECLARE FUNCTION ArmLinhaLista$ (v AS INTEGER)
DECLARE FUNCTION ArmCol$ (x AS DOUBLE, w AS INTEGER)

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra

CarregaConfiguracao
MenuPrincipal
CLS
LOCATE 12, 3: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le ARMADURA.INI da pasta de execucao (drive e diretorio de dados) e a obra
' corrente. Sem ARMADURA.INI usa C:\ . ArqLer% substitui ArqDados$; quem
' precisar do INI le de novo (ItemMateriais faz isso).
' RECONSTRUCAO: o EXE nao mostra a leitura do INI; as chaves vem dos nomes do ARMADURA.INI.
SUB CarregaConfiguracao
    DIM d AS STRING, i AS INTEGER
    ComumDirExecDefine(_CWD$)
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    TelaStatus "Aguarde ..."            ' RECONSTRUCAO: posicao do aviso no EXE nao confirmada
    i = ArqLer%(IniArq$)
    IF i >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    VigObra = ObraAtual$(DirDados)
    IF VigObra = "" THEN VigObra = "sem nome"
END SUB

' Menu principal. Teclas M, A, P, 4, C, V, L; F2 termina. Itens ainda nao
' ligados a uma tela caem no CASE ELSE sem acao.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho ""
        MenuLinha 7, "M", "ateriais, Concreto Aco"
        MenuLinha 8, "A", "rquivar Secoes"
        MenuLinha 9, "P", "rocessar Calculo das Secoes"
        MenuLinha 10, "4", "  -  Calculo de Dimensionamento de uma Secao"
        MenuLinha 11, "C", "orrecoes dos dados"
        MenuLinha 12, "V", "isualizar / Alterar Parametrizacoes"
        MenuLinha 13, "L", "ista das Secoes Arquivadas"
        LOCATE 19, 10: PRINT "<F2> = Fim"
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "M": ItemMateriais
            CASE "A": ItemArquivar
            CASE "P": ItemProcessar
            CASE "4": ItemAvulso
            CASE "C": ItemCorrige
            CASE "V": ItemParametros
            CASE "L": ItemLista
            CASE CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Titulo, empresa, obra corrente e diretorio de dados. subtit "" nao escreve na linha 6.
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "ARMADURA PARA VIGAS DE CONCRETO SUBMETIDA A FLEXAO SIMPLES"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "OpenStrut                              *"
    LOCATE 3, 3: PRINT "Abril 1991   (omitido)                 "
    LOCATE 4, 3: PRINT "Versao 4.0"
    LOCATE 5, 3: PRINT "Obra: "; VigObra
    LOCATE 5, 45: PRINT "Dados: "; DirDados
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 6, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Uma linha do menu: tecla em COR_DESTAQUE, texto em COR_TEXTO.
SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
    LOCATE lin, 10
    COLOR COR_DESTAQUE: PRINT tecla;
    COLOR COR_TEXTO: PRINT texto
END SUB

' Mostra texto na linha 24 (erro) ou 25 (status), pede ESC ou Enter na linha 23
' e limpa 23 a 25 ao sair.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF erro THEN TelaErro texto ELSE TelaStatus texto
    LOCATE 23, 10: COLOR COR_TEXTO: PRINT "Acione ESC <Enter> para Continuar"
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27) OR k = CHR$(13)
    LOCATE 23, 1: PRINT SPACE$(80);
    LOCATE 24, 1: PRINT SPACE$(80);
    LOCATE 25, 1: PRINT SPACE$(80);
END SUB

' Caminho do ARMADURA.INI, na pasta de execucao.
FUNCTION IniArq$ ()
    IniArq$ = ComumDirExec$ + "ARMADURA.INI"
END FUNCTION

' Garante barra final no diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Numero da linha do INI cuja descricao (depois do "=") bate com desc; 0 se nao acha.
FUNCTION IniLinhaDesc% (desc AS STRING)
    DIM n AS INTEGER
    FOR n = 1 TO ArqQtd
        IF IniDesc$(n) = desc THEN IniLinhaDesc% = n: EXIT FUNCTION
    NEXT
    IniLinhaDesc% = 0
END FUNCTION

' Valor (antes do "=") da linha de descricao desc; "" se a linha nao existe.
FUNCTION IniValorDe$ (desc AS STRING)
    DIM n AS INTEGER
    n = IniLinhaDesc%(desc)
    IF n = 0 THEN IniValorDe$ = "" ELSE IniValorDe$ = IniValor$(n)
END FUNCTION

' Validacao por tipo: 0 texto nao vazio; 1 numero; 4 letra A ou B.
FUNCTION IniValido% (v AS STRING, tipo AS INTEGER)
    SELECT CASE tipo
        CASE 1: IniValido% = NumeroValido%(v)
        CASE 4: IniValido% = (UCASE$(v) = "A" OR UCASE$(v) = "B")
        CASE ELSE: IniValido% = (LEN(v) > 0)
    END SELECT
END FUNCTION

' Edita um valor do INI: Enter confirma, Esc mantem. Valor invalido pede de novo.
' Grava o INI so quando o valor muda. tipo como em IniValido%.
SUB IniEdita (lin AS INTEGER, col AS INTEGER, desc AS STRING, tipo AS INTEGER)
    DIM n AS INTEGER, atual AS STRING, v AS STRING
    n = IniLinhaDesc%(desc)
    IF n = 0 THEN Espera "Linha ausente no ARMADURA.INI", 1: EXIT SUB
    atual = IniValor$(n)
    DO
        v = EntradaTexto$(lin, col, 12, atual)
        IF tipo = 4 THEN v = UCASE$(v)
        IF v = atual THEN EXIT DO
        IF IniValido%(v, tipo) THEN
            IniDefinir n, v
            ArqGravar IniArq$
            EXIT DO
        END IF
        Espera "Valor invalido para este campo", 1   ' RECONSTRUCAO: mensagem nao esta no dump
        atual = IniValor$(n)
    LOOP
END SUB

' Tela 3.2: concreto, aco e unidades. Cada campo vale o que esta no INI.
SUB ItemMateriais
    DIM i AS INTEGER
    i = ArqLer%(IniArq$)
    CLS
    TelaCabecalho "Definicao dos Materiais e unidades de trabalho"
    LOCATE 8, 3: PRINT "Concreto Fck *"
    IniEdita 8, 30, DESC_FCK, 1
    LOCATE 9, 3: PRINT "Aco      Fyk *"
    IniEdita 9, 30, DESC_FYK, 1
    LOCATE 10, 3: PRINT "Tipo de Aco  A/B *"
    IniEdita 10, 30, DESC_ACO, 4
    LOCATE 12, 3: PRINT "Unidade de grandeza para os valores caracteristicos do Concreto e Aco"
    IniEdita 13, 30, DESC_GRANDEZA, 0
    LOCATE 14, 3: PRINT "Multiplicador de (*"
    IniEdita 14, 30, DESC_MULT_GRANDEZA, 1
    LOCATE 14, 50: PRINT ") para transformar em Tonelada/Centimetro2"
    Espera "", 0
END SUB

' ============================================================================
'  PARTE 2: arquivamento (A) e processamento (P) das secoes de <obra>_ARM.SEC.
' ============================================================================

' Constantes provisorias do dimensionamento. Nao vem do INI nem do dump.
' RECONSTRUCAO: bitolas, numero de barras e espacamentos sem fonte no EXE.
CONST ARM_DL = 3.5#                 ' cm, d' = cobrimento (2.5 provisorio) + 1 cm
CONST ARM_PHI_FLEX = 10#            ' mm, menor bitola longitudinal
CONST ARM_N_MIN = 2                 ' barras longitudinais, minimo
CONST ARM_N_MAX = 8                 ' barras longitudinais, maximo
CONST ARM_PHI_EST = 5#              ' mm, menor bitola do estribo
CONST ARM_S_MIN = 7#                ' cm, espacamento minimo do estribo (igual a VIGCALC e DESDIM)
CONST ARM_S_MAX = 30#               ' cm, espacamento maximo do estribo, limitado a 0,5 d

' Valor com duas casas e sem zeros a esquerda, para a tela.
FUNCTION ArmFmt$ (x AS DOUBLE)
    ArmFmt$ = LTRIM$(STR$(INT(x * 100# + 0.5#) / 100#))
END FUNCTION

' Cadastra uma secao retangular (tipo 1): B, H, d, Mk (tf.m) e Vk (tf). Mk >= 0
' vai para o momento positivo; Mk < 0, para o negativo. Campo zero (ou ESC) cancela.
' A confirmacao so aceita S ou N (qualquer outra tecla e ignorada).
' RECONSTRUCAO: rotulos de Mk e Vk e o cancelamento por campo zero nao vem do dump.
SUB ArmCadastraRetangular (mudou AS INTEGER)
    DIM b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, mk AS DOUBLE, vk AS DOUBLE
    DIM v AS INTEGER, t AS INTEGER, k AS STRING, ok AS INTEGER
    ArmLeRetangular b, h, d, mk, vk, ok
    IF ok = 0 THEN EXIT SUB
    LOCATE 18, 3: PRINT "Dados Corretos  N/*S*"
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k = "S" OR k = "N"
    IF k = "N" THEN EXIT SUB
    v = VigAdiciona%("POS " + LTRIM$(STR$(VigQtd + 1)), 1, b, h)
    IF v = 0 THEN Espera "Numero maximo de secoes excedido", 1: EXIT SUB
    Vig(v).d = d
    t = VigTramo%(v, 1)
    VigTra(t).mPos = 0: VigTra(t).mNegEsq = 0
    IF mk >= 0 THEN VigTra(t).mPos = mk ELSE VigTra(t).mNegEsq = mk
    VigTra(t).vEsq = ABS(vk): VigTra(t).vDir = ABS(vk)
    mudou = -1
END SUB

' Menu A: cadastra secoes na obra e grava <obra>_ARM.SEC ao sair, se algo mudou.
' So a secao retangular (tipo 1) foi reconstruida; tipos 2 a 5 sao lacuna.
SUB ItemArquivar
    DIM arq AS STRING, k AS STRING, mudou AS INTEGER
    arq = DirDados + VigObra + "_ARM.SEC"
    IF _FILEEXISTS(arq) THEN
        IF VigLe%(arq, "SEC") = 0 THEN Espera DadErro, 1: EXIT SUB
    ELSE
        VigLimpa
    END IF
    DO
        CLS
        TelaCabecalho "Arquivo de Secoes para dimensionamento"
        LOCATE 8, 3: PRINT "Secoes arquivadas:"; VigQtd
        LOCATE 9, 3: PRINT "Posicao *"; VigQtd + 1
        LOCATE 11, 3: PRINT "1  -  Retangular     2  -  Triangular     3  -  Triangular Invertida"
        LOCATE 12, 3: PRINT "4  -  Trapezoidal    5  -  Circular"   ' RECONSTRUCAO: layout da lista de tipos
        LOCATE 13, 10: PRINT "<F2> = Fim"
        TelaStatus "Escolha o tipo de secao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": ArmCadastraRetangular mudou
            CASE "2", "3", "4", "5": Espera "Tipo de secao ainda nao reconstruido", 1   ' RECONSTRUCAO: lacuna
            CASE CHR$(27), CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
    IF mudou THEN VigGrava arq, "SEC"
END SUB

' Texto de erro ou aviso de ArmFlexao% (rf): -1 d <= dl, -2 nenhum arranjo com 8 barras de 32 mm,
' 1 barras nao cabem em uma camada. Outros codigos devolvem vazio.
FUNCTION ArmMsgFlex$ (rf AS INTEGER)
    SELECT CASE rf
        CASE -1: ArmMsgFlex$ = "erro no processamento"
        CASE -2: ArmMsgFlex$ = "erro no processamento: armadura acima de 8 barras de 32 mm, aumente a secao"
        CASE -3: ArmMsgFlex$ = "erro no processamento: As + As' acima de 4% da secao, aumente a secao"   ' RECONSTRUCAO: texto
        CASE 1: ArmMsgFlex$ = "barras nao cabem em uma camada"
    END SELECT
END FUNCTION

' Dimensiona a secao v (um tramo) e grava os resultados no tramo, so se der certo.
' Escreve duas linhas a partir de lin. Devolve -1 se houve erro no processamento.
' Flexao: Md = gf |Mk| 100; As e As' pelas funcoes de ARMCALC.BM. Cortante: Vd = gf |Vk|.
FUNCTION ArmProcessaSecao% (v AS INTEGER, gf AS DOUBLE, fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, taxa AS DOUBLE, lin AS INTEGER)
    DIM t AS INTEGER, bw AS DOUBLE, h AS DOUBLE, d AS DOUBLE, falha AS INTEGER, msg AS STRING
    DIM asP AS DOUBLE, aslP AS DOUBLE, phiP AS DOUBLE, nP AS INTEGER
    DIM asN AS DOUBLE, aslN AS DOUBLE, phiN AS DOUBLE, nN AS INTEGER
    DIM asw AS DOUBLE, phiE AS DOUBLE, sE AS DOUBLE, txt1 AS STRING, txt2 AS STRING, rf AS INTEGER
    t = VigTramo%(v, 1)
    bw = Vig(v).bw: h = Vig(v).h: d = Vig(v).d
    asP = 0: aslP = 0: phiP = 0: nP = 0
    asN = 0: aslN = 0: phiN = 0: nN = 0
    falha = 0: msg = "erro no processamento"
    txt1 = RTRIM$(Vig(v).nome) + "  M+ -"
    txt2 = "        M- -"
    IF VigTra(t).mPos > 0 THEN
        rf = ArmFlexao%(gf * VigTra(t).mPos * 100#, bw, h, d, fcd, fyd, taxa, asP, aslP, phiP, nP)
        IF rf < 0 THEN falha = -1: msg = ArmMsgFlex$(rf)
        txt1 = RTRIM$(Vig(v).nome) + "  M+ As=" + ArmFmt$(asP) + " As'=" + ArmFmt$(aslP) + " " + LTRIM$(STR$(nP)) + "x" + ArmFmt$(phiP)
        IF rf = 1 THEN txt1 = txt1 + "  " + ArmMsgFlex$(rf)
    END IF
    IF VigTra(t).mNegEsq < 0 AND falha = 0 THEN
        rf = ArmFlexao%(gf * ABS(VigTra(t).mNegEsq) * 100#, bw, h, d, fcd, fyd, taxa, asN, aslN, phiN, nN)
        IF rf < 0 THEN falha = -1: msg = ArmMsgFlex$(rf)
        txt2 = "        M- As=" + ArmFmt$(asN) + " As'=" + ArmFmt$(aslN) + " " + LTRIM$(STR$(nN)) + "x" + ArmFmt$(phiN)
        IF rf = 1 THEN txt2 = txt2 + "  " + ArmMsgFlex$(rf)
    END IF
    asw = 0: phiE = 0: sE = 0
    IF falha = 0 THEN
        SELECT CASE ArmEstribo%(gf * ABS(VigTra(t).vEsq), bw, d, fck, fcd, fyd, asN, taxa, asw, phiE, sE)
            CASE -1: falha = -1: msg = "erro no processamento: biela esmagada, aumente a secao"   ' RECONSTRUCAO: texto
            CASE -2: falha = -1: msg = "erro no processamento: sem bitola para o estribo"   ' RECONSTRUCAO: texto
        END SELECT
    END IF
    IF falha THEN
        COLOR COR_ERRO
        LOCATE lin, 3: PRINT RTRIM$(Vig(v).nome) + "  " + msg
        COLOR COR_TEXTO
        ArmProcessaSecao% = -1: EXIT FUNCTION
    END IF
    VigTra(t).asPos = asP: VigTra(t).phiPos = phiP: VigTra(t).nPos = nP
    VigTra(t).asNegEsq = asN: VigTra(t).phiNegEsq = phiN: VigTra(t).nNegEsq = nN
    VigTra(t).aswEsq = asw: VigTra(t).phiEst = phiE: VigTra(t).sEst = sE
    LOCATE lin, 3: PRINT txt1
    LOCATE lin + 1, 3: PRINT txt2 + "  Est " + ArmFmt$(phiE) + " c/" + ArmFmt$(sE) + " asw=" + ArmFmt$(asw)
    ArmProcessaSecao% = 0
END FUNCTION

' Armadura de um momento md (tf.cm, ja com gf): As, As' (cm2), bitola (mm) e numero de
' barras. As minimo 0,15% de bw*h (como VIGCALC). Devolve -1 se d <= dl; -2 se nem 8
' barras de 32 mm atendem; -3 se As + As' passa de 4% de bw*h (ArmAsMax#, como VIGCALC);
' 1 se as barras nao cabem em uma camada (sai a mais estreita); 0 se ok.
' taxa nao e usada: a linha TAXA do INI e o rho1 do psi1, nao armadura minima.
' RECONSTRUCAO: a escolha de bitolas pelo usuario (3 bitolas no dump) nao foi reconstruida.
FUNCTION ArmFlexao% (md AS DOUBLE, bw AS DOUBLE, h AS DOUBLE, d AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, taxa AS DOUBLE, asOut AS DOUBLE, aslOut AS DOUBLE, phiOut AS DOUBLE, nOut AS INTEGER)
    DIM asReq AS DOUBLE, asMin AS DOUBLE, dl AS DOUBLE, cabe AS INTEGER
    dl = ARM_DL
    asReq = ArmAsDupla#(md, bw, d, dl, fcd, fyd)
    IF asReq < 0 THEN ArmFlexao% = -1: EXIT FUNCTION
    aslOut = ArmAsLinha#(md, bw, d, dl, fcd, fyd)
    IF aslOut < 0 THEN aslOut = 0: ArmFlexao% = -1: EXIT FUNCTION
    IF asReq + aslOut > ArmAsMax#(bw, h) THEN ArmFlexao% = -3: EXIT FUNCTION
    asMin = CcaAsMin#(bw, h, 0.0015#)
    IF asReq < asMin THEN asReq = asMin
    asOut = asReq
    CcaEscolheBarrasBw asReq, bw, 2#, phiOut, nOut, cabe
    IF cabe = -1 THEN ArmFlexao% = -2: EXIT FUNCTION
    IF cabe = 0 THEN ArmFlexao% = 1 ELSE ArmFlexao% = 0
END FUNCTION

' Menu P: dimensiona as secoes I a J de <obra>_ARM.SEC e grava o arquivo.
' Materiais e coeficientes vem do ARMADURA.INI. Resultado impresso na tela;
' relatorio em <obra>_ARMADURA.LST fica para a parte 3.
SUB ItemProcessar
    DIM arq AS STRING, i AS INTEGER, j AS INTEGER, v AS INTEGER, lin AS INTEGER, erros AS INTEGER
    DIM fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, gf AS DOUBLE, taxa AS DOUBLE, ok AS INTEGER
    arq = DirDados + VigObra + "_ARM.SEC"
    IF NOT _FILEEXISTS(arq) THEN Espera "Arquivo de secoes nao encontrado", 1: EXIT SUB   ' RECONSTRUCAO: texto
    IF VigLe%(arq, "SEC") = 0 THEN Espera DadErro, 1: EXIT SUB
    IF VigQtd = 0 THEN Espera "Nenhuma secao arquivada", 1: EXIT SUB
    ArmLeMateriais fck, fcd, fyd, gf, taxa, ok
    IF ok = 0 THEN Espera "Materiais ou coeficientes invalidos no ARMADURA.INI", 1: EXIT SUB
    CLS
    TelaCabecalho "Processamento de Secoes Arquivadas"
    LOCATE 9, 3: PRINT "Posicao inicial I *"
    i = INT(EntradaNumero#(9, 26, 5, 1))
    LOCATE 10, 3: PRINT "Posicao final   J *"
    j = INT(EntradaNumero#(10, 26, 5, VigQtd))
    IF i < 1 OR j > VigQtd OR i > j THEN Espera "Faixa de posicoes invalida", 1: EXIT SUB
    CLS
    TelaCabecalho "Processamento de Secoes Arquivadas"
    lin = 8: erros = 0
    FOR v = i TO j
        IF lin > 19 THEN
            Espera "", 0
            CLS
            TelaCabecalho "Processamento de Secoes Arquivadas"
            lin = 8
        END IF
        IF ArmProcessaSecao%(v, gf, fck, fcd, fyd, taxa, lin) THEN erros = erros + 1
        lin = lin + 2
    NEXT
    ' So grava se todas as secoes foram dimensionadas; com erro, o arquivo fica como estava.
    IF erros = 0 THEN
        VigGrava arq, "SEC"
        Espera "Secoes processadas e gravadas em " + arq, 0
    ELSE
        Espera "Secoes NAO gravadas: " + LTRIM$(STR$(erros)) + " erro(s) no processamento", 1
    END IF
END SUB

' Le b, h, d (cm), Mk (tf.m) e Vk (tf) da secao retangular nas linhas 15 a 17.
' ok = -1 se b, h e d sao positivos; campo zero ou ESC cancela (ok = 0).
' RECONSTRUCAO: rotulos de Mk e Vk e o cancelamento por campo zero nao vem do dump.
SUB ArmLeRetangular (b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, mk AS DOUBLE, vk AS DOUBLE, ok AS INTEGER)
    ok = 0
    LOCATE 15, 3: PRINT "B(cm) , H(cm) , d(cm) *RETORNO* "
    b = EntradaNumero#(15, 36, 8, 0)
    h = EntradaNumero#(15, 45, 8, 0)
    d = EntradaNumero#(15, 54, 8, 0)
    IF b <= 0 OR h <= 0 OR d <= 0 THEN EXIT SUB
    LOCATE 16, 3: PRINT "Momento Mk (tf.m) *"
    mk = EntradaNumero#(16, 30, 10, 0)
    LOCATE 17, 3: PRINT "Cortante Vk (tf) *"
    vk = EntradaNumero#(17, 30, 10, 0)
    ok = -1
END SUB

' Valor numerico de uma linha do INI pela descricao; 0 se ausente ou invalido.
FUNCTION ArmNumIni# (desc AS STRING)
    DIM v AS STRING
    v = IniValorDe$(desc)
    IF NumeroValido%(v) THEN ArmNumIni# = VAL(v) ELSE ArmNumIni# = 0
END FUNCTION

' Materiais e coeficientes do ARMADURA.INI, em tf e cm2. fck = Fck * multiplicador;
' fyk = Fyk * multiplicador; fcd = fck / CS concreto; fyd = fyk / CS aco;
' gf = CS dos esforcos; taxa = rho_w,min do estribo (CcaRhoWMin#, NB-1/78).
' Define a classe do aco (CcaAcoClasse%) pelo TIPO DE ACO (A/B).
' A linha TAXA DE ARMADURA LONGITUDINAL TRACIONADA do INI e o rho1 do psi1;
' o psi1 usa a armadura tracionada real da secao (como VIGCALC e DESDIM),
' entao essa linha nao entra no calculo.
' ok = -1 se todos os valores sao positivos.
SUB ArmLeMateriais (fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, gf AS DOUBLE, taxa AS DOUBLE, ok AS INTEGER)
    DIM mult AS DOUBLE, fyk AS DOUBLE, csC AS DOUBLE, csA AS DOUBLE, classe AS INTEGER
    fck = ArmNumIni#(DESC_FCK)
    fyk = ArmNumIni#(DESC_FYK)
    mult = ArmNumIni#(DESC_MULT_GRANDEZA)
    gf = ArmNumIni#(DESC_CS_FORCA)
    csC = ArmNumIni#(DESC_CS_CONC)
    csA = ArmNumIni#(DESC_CS_ACO)
    ok = 0
    IF fck <= 0 OR fyk <= 0 OR mult <= 0 OR gf <= 0 OR csC <= 0 OR csA <= 0 THEN EXIT SUB
    fck = fck * mult
    fyk = fyk * mult
    taxa = CcaRhoWMin#(fyk)
    IF UCASE$(LTRIM$(RTRIM$(IniValorDe$(DESC_ACO)))) = "B" THEN classe = CcaAcoClasse%(1) ELSE classe = CcaAcoClasse%(0)
    fcd = fck / csC
    fyd = fyk / csA
    ok = -1
END SUB

' Estribo para o cortante vd (tf): asw em cm2/m, bitola (mm) e espacamento (cm).
' asl (cm2) e a tracionada longitudinal da regiao, 0 se nao ha. Devolve 0; -1 se a
' biela esmaga (aumente a secao); -2 se nenhuma bitola atende.
' O minimo (taxa = rho_w,min, vezes bw) entra aqui, pois CcaAswEstriboRho# nao o aplica.
' Estribo de 2 ramos: a bitola e escolhida para asw/2 por ramo, com s entre 7 cm e
' min(0,5 d; 30 cm), como VIGCALC e DESDIM.
FUNCTION ArmEstribo% (vd AS DOUBLE, bw AS DOUBLE, d AS DOUBLE, fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, asl AS DOUBLE, taxa AS DOUBLE, aswOut AS DOUBLE, phiOut AS DOUBLE, sOut AS DOUBLE)
    DIM asw AS DOUBLE, asMin AS DOUBLE, sMax AS DOUBLE
    asw = CcaAswEstriboRho#(vd, bw, d, fck, fcd, fyd, asl)
    IF asw < 0 THEN ArmEstribo% = -1: EXIT FUNCTION
    asMin = CcaAswMin#(bw, taxa)
    IF asw < asMin THEN asw = asMin
    aswOut = asw
    sMax = ARM_S_MAX: IF 0.5# * d < sMax THEN sMax = 0.5# * d
    CcaEscolheMalha aswOut / 2#, ARM_PHI_EST, ARM_S_MIN, sMax, phiOut, sOut
    IF phiOut = 0 THEN ArmEstribo% = -2 ELSE ArmEstribo% = 0
END FUNCTION

' ============================================================================
'  PARTE 3: dimensionamento avulso (4), correcao (C), parametrizacao (V),
'  lista (L) e relatorio LST.
' ============================================================================

' Menu 4: dimensiona uma secao avulsa, sem gravar arquivo. Materiais editados
' no ARMADURA.INI, como em ItemMateriais. So a secao retangular (1) foi reconstruida.
' RECONSTRUCAO: subtitulo da tela e posicao de "*Retorno*" nao confirmados no dump.
SUB ItemAvulso
    DIM k AS STRING, i AS INTEGER
    i = ArqLer%(IniArq$)
    DO
        CLS
        TelaCabecalho "Dimensionamento de Secoes"
        LOCATE 7, 3: PRINT "(Secao para Dimensionamento)"
        LOCATE 8, 3: PRINT "Concreto Fck *"
        IniEdita 8, 30, DESC_FCK, 1
        LOCATE 9, 3: PRINT "Aco      Fyk *"
        IniEdita 9, 30, DESC_FYK, 1
        LOCATE 10, 3: PRINT "Tipo de Aco  A/B *"
        IniEdita 10, 30, DESC_ACO, 4
        LOCATE 12, 3: PRINT "1  -  Retangular     2  -  Triangular     3  -  Triangular Invertida"
        LOCATE 13, 3: PRINT "4  -  Trapezoidal    5  -  Circular"
        LOCATE 14, 10: PRINT "*Retorno*"
        TelaStatus "Escolha o tipo de secao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": ArmAvulsoRetangular
            CASE "2", "3", "4", "5": Espera "Tipo de secao ainda nao reconstruido", 1   ' RECONSTRUCAO: lacuna
            CASE CHR$(27), CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Dimensiona uma secao retangular digitada (B, H, d, Mk, Vk) sem gravar arquivo.
' Mostra As, As' e estribo; qualquer tecla volta ao menu. Calculo igual ao de
' ArmProcessaSecao% (duplicado de proposito: aquela trabalha sobre o arquivo).
SUB ArmAvulsoRetangular
    DIM b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, mk AS DOUBLE, vk AS DOUBLE, ok AS INTEGER
    DIM fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, gf AS DOUBLE, taxa AS DOUBLE
    DIM asT AS DOUBLE, aslC AS DOUBLE, phiT AS DOUBLE, nT AS INTEGER
    DIM asw AS DOUBLE, phiE AS DOUBLE, sE AS DOUBLE, erroE AS INTEGER, k AS STRING, rf AS INTEGER
    CLS
    TelaCabecalho "Dimensionamento de Secoes"
    ArmLeMateriais fck, fcd, fyd, gf, taxa, ok
    IF ok = 0 THEN Espera "Materiais ou coeficientes invalidos no ARMADURA.INI", 1: EXIT SUB
    ArmLeRetangular b, h, d, mk, vk, ok
    IF ok = 0 THEN EXIT SUB
    CLS
    TelaCabecalho "Dimensionamento de Secoes"
    rf = ArmFlexao%(gf * ABS(mk) * 100#, b, h, d, fcd, fyd, taxa, asT, aslC, phiT, nT)
    IF rf < 0 THEN
        COLOR COR_ERRO
        LOCATE 8, 3: PRINT ArmMsgFlex$(rf)
        LOCATE 9, 3: PRINT "verifique a consistencia dos seus dados"
        COLOR COR_TEXTO
        Espera "", 0
        EXIT SUB
    END IF
    erroE = ArmEstribo%(gf * ABS(vk), b, d, fck, fcd, fyd, asT, taxa, asw, phiE, sE)
    LOCATE 8, 3: PRINT "Ast=" + ArmFmt$(asT) + " cm2   " + LTRIM$(STR$(nT)) + " x " + ArmFmt$(phiT) + " mm"
    LOCATE 9, 3: PRINT "Asc=" + ArmFmt$(aslC) + " cm2"
    IF rf = 1 THEN LOCATE 11, 3: PRINT ArmMsgFlex$(rf)
    IF erroE = 0 THEN
        LOCATE 10, 3: PRINT "Ase=" + ArmFmt$(asw) + " cm2/m    Est " + ArmFmt$(phiE) + " c/" + ArmFmt$(sE)
    ELSE
        COLOR COR_ERRO
        IF erroE = -1 THEN
            LOCATE 10, 3: PRINT "erro no processamento: biela esmagada, aumente a secao"   ' RECONSTRUCAO: texto
        ELSE
            LOCATE 10, 3: PRINT "erro no processamento: sem bitola para o estribo"          ' RECONSTRUCAO: texto
        END IF
        COLOR COR_TEXTO
    END IF
    TelaStatus "Qualquer Tecla para Continuar"
    k = TeclaLer$
END SUB

' Valor do item it (1 B, 2 H, 3 d, 4 Mk, 5 Vk) da secao v. Mk sai com o sinal
' que foi gravado (mPos ou mNegEsq). RECONSTRUCAO: mapeamento de itens nao vem do dump.
FUNCTION ArmItemValor# (v AS INTEGER, it AS INTEGER)
    DIM t AS INTEGER
    t = VigTramo%(v, 1)
    SELECT CASE it
        CASE 1: ArmItemValor# = Vig(v).bw
        CASE 2: ArmItemValor# = Vig(v).h
        CASE 3: ArmItemValor# = Vig(v).d
        CASE 4
            IF VigTra(t).mNegEsq < 0 THEN ArmItemValor# = VigTra(t).mNegEsq ELSE ArmItemValor# = VigTra(t).mPos
        CASE 5: ArmItemValor# = VigTra(t).vEsq
    END SELECT
END FUNCTION

' Grava o novo valor do item it na secao v. mudou = -1 se o valor mudou.
' Mk positivo vai para mPos e negativo para mNegEsq; o outro zera.
' Zera as armaduras calculadas por P (campos do tramo que P grava): deixam de valer.
SUB ArmCorrigePosicao (v AS INTEGER, it AS INTEGER, novo AS DOUBLE, mudou AS INTEGER)
    DIM t AS INTEGER
    IF ArmItemValor#(v, it) = novo THEN EXIT SUB
    t = VigTramo%(v, 1)
    SELECT CASE it
        CASE 1: Vig(v).bw = novo
        CASE 2: Vig(v).h = novo
        CASE 3: Vig(v).d = novo
        CASE 4
            VigTra(t).mPos = 0: VigTra(t).mNegEsq = 0
            IF novo >= 0 THEN VigTra(t).mPos = novo ELSE VigTra(t).mNegEsq = novo
        CASE 5: VigTra(t).vEsq = ABS(novo): VigTra(t).vDir = ABS(novo)
    END SELECT
    VigTra(t).asPos = 0: VigTra(t).phiPos = 0: VigTra(t).nPos = 0
    VigTra(t).asNegEsq = 0: VigTra(t).phiNegEsq = 0: VigTra(t).nNegEsq = 0
    VigTra(t).aswEsq = 0: VigTra(t).phiEst = 0: VigTra(t).sEst = 0
    mudou = -1
END SUB

' Menu C: troca um item de uma secao arquivada (posicao 0 sai). Grava <obra>_ARM.SEC ao
' sair, se algo mudou. Itens e rotulos sao RECONSTRUCAO (ver ArmItemValor#).
SUB ItemCorrige
    DIM arq AS STRING, v AS INTEGER, it AS INTEGER, novo AS DOUBLE, mudou AS INTEGER
    mudou = 0
    arq = DirDados + VigObra + "_ARM.SEC"
    IF NOT _FILEEXISTS(arq) THEN Espera "Arquivo de secoes nao encontrado", 1: EXIT SUB
    IF VigLe%(arq, "SEC") = 0 THEN Espera DadErro, 1: EXIT SUB
    IF VigQtd = 0 THEN Espera "Nenhuma secao arquivada", 1: EXIT SUB
    DO
        CLS
        TelaCabecalho "Correcao de Secoes"
        LOCATE 8, 3: PRINT "Secoes arquivadas:"; VigQtd
        LOCATE 9, 3: PRINT "Numero da posicao a ser alterada *FIM* "
        v = INT(EntradaNumero#(9, 46, 5, 0))
        IF v = 0 THEN EXIT DO
        IF v < 1 OR v > VigQtd THEN
            Espera "Posicao inexistente", 1   ' RECONSTRUCAO: texto nao esta no dump
        ELSE
            LOCATE 11, 3: PRINT "(1) ";: PRINT "B (cm) =";
            LOCATE 11, 30: PRINT ArmFmt$(ArmItemValor#(v, 1))
            LOCATE 12, 3: PRINT "(2) ";: PRINT "H (cm) =";
            LOCATE 12, 30: PRINT ArmFmt$(ArmItemValor#(v, 2))
            LOCATE 13, 3: PRINT "(3) ";: PRINT "d (cm) =";
            LOCATE 13, 30: PRINT ArmFmt$(ArmItemValor#(v, 3))
            LOCATE 14, 3: PRINT "(4) ";: PRINT "Mk (tf.m) =";
            LOCATE 14, 30: PRINT ArmFmt$(ArmItemValor#(v, 4))
            LOCATE 15, 3: PRINT "(5) ";: PRINT "Vk (tf) =";
            LOCATE 15, 30: PRINT ArmFmt$(ArmItemValor#(v, 5))
            LOCATE 17, 3: PRINT "item , Novo Valor  *NAO* "
            it = INT(EntradaNumero#(17, 30, 3, 0))
            IF it >= 1 AND it <= 5 THEN
                novo = EntradaNumero#(17, 45, 10, ArmItemValor#(v, it))
                ArmCorrigePosicao v, it, novo, mudou
            END IF
        END IF
    LOOP
    IF mudou THEN
        VigGrava arq, "SEC"
        Espera "Secao corrigida: reprocesse com P", 0   ' RECONSTRUCAO: texto
    END IF
END SUB

' Menu V: edita os parametros do ARMADURA.INI (limite da LN, taxa, coeficientes e
' unidades). Cada campo usa IniEdita: Enter confirma, Esc mantem.
SUB ItemParametros
    DIM i AS INTEGER
    i = ArqLer%(IniArq$)
    CLS
    TelaCabecalho "Correcao de Parametros"
    LOCATE 8, 3: PRINT "Limite da posicao da Linha Neutra"
    IniEdita 8, 62, DESC_LIM_LN, 1
    LOCATE 9, 3: PRINT "Taxa de Armadura Longitudinal"
    IniEdita 9, 62, DESC_TAXA, 1
    LOCATE 11, 3: PRINT "Coeficientes de Seguranca"
    LOCATE 12, 3: PRINT "(3) ";: PRINT "Forcas ="
    IniEdita 12, 62, DESC_CS_FORCA, 1
    LOCATE 13, 3: PRINT "(4) ";: PRINT "Concreto ="
    IniEdita 13, 62, DESC_CS_CONC, 1
    LOCATE 14, 3: PRINT "(5) ";: PRINT "Aco ="
    IniEdita 14, 62, DESC_CS_ACO, 1
    LOCATE 16, 3: PRINT "Unidades de trabalho dos esforcos solicitantes"
    LOCATE 17, 3: PRINT "(6) ";: PRINT "Unidade de Forca ="
    IniEdita 17, 62, DESC_UN_FORCA, 0
    LOCATE 18, 3: PRINT "(7) ";: PRINT "Coef. multiplicador para transformar em toneladas ="
    IniEdita 18, 62, DESC_MULT_FORCA, 1
    LOCATE 19, 3: PRINT "(8) ";: PRINT "Unidade de Medida ="
    IniEdita 19, 62, DESC_UN_MEDIDA, 0
    LOCATE 20, 3: PRINT "(9) ";: PRINT "Coef. multiplicador para transformar em metros ="
    IniEdita 20, 62, DESC_MULT_MEDIDA, 1
    Espera "", 0
END SUB

' Cabecalho do quadro da lista (tela e LST); uma linha por secao em ArmLinhaLista$.
CONST LST_CABECALHO = "POS tipo   B     H     Diam    d   Bsup/Bf   Hf    Bit Flexao    Bit Cisalham"

' Valor formatado em w colunas, alinhado a direita.
FUNCTION ArmCol$ (x AS DOUBLE, w AS INTEGER)
    ArmCol$ = RIGHT$(SPACE$(w) + ArmFmt$(x), w)
END FUNCTION

' Uma linha do quadro: posicao, tipo (1 = retangular), B, H, d e bitolas de flexao
' (phiPos) e de cisalhamento (phiEst). Diam e Bsup/Bf ficam em branco.
FUNCTION ArmLinhaLista$ (v AS INTEGER)
    DIM t AS INTEGER
    t = VigTramo%(v, 1)
    ArmLinhaLista$ = RIGHT$("   " + LTRIM$(STR$(v)), 3) + "  1" + ArmCol$(Vig(v).bw, 8) + ArmCol$(Vig(v).h, 8) + SPACE$(8) + ArmCol$(Vig(v).d, 8) + SPACE$(12) + ArmCol$(VigTra(t).phiPos, 12) + ArmCol$(VigTra(t).phiEst, 12)
END FUNCTION

' Grava o quadro da lista em arq (cabecalho e uma linha por secao).
SUB ArmRelatorio (arq AS STRING)
    DIM f AS INTEGER, v AS INTEGER
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    PRINT #f, LST_CABECALHO
    FOR v = 1 TO VigQtd
        PRINT #f, ArmLinhaLista$(v)
    NEXT
    CLOSE #f
END SUB

' Menu L: lista as secoes de <obra>_ARM.SEC na tela, com paginacao. Se S, grava
' <obra>_ARMADURA.LST com o mesmo quadro.
SUB ItemLista
    DIM arq AS STRING, arqLst AS STRING, v AS INTEGER, lin AS INTEGER, k AS STRING
    arq = DirDados + VigObra + "_ARM.SEC"
    IF NOT _FILEEXISTS(arq) THEN Espera "Arquivo de secoes nao encontrado", 1: EXIT SUB
    IF VigLe%(arq, "SEC") = 0 THEN Espera DadErro, 1: EXIT SUB
    IF VigQtd = 0 THEN Espera "Nenhuma secao arquivada", 1: EXIT SUB
    CLS
    TelaCabecalho "Lista das Secoes arquivadas"
    LOCATE 8, 1: PRINT LST_CABECALHO
    lin = 9
    FOR v = 1 TO VigQtd
        IF lin > 19 THEN
            Espera "", 0
            CLS
            TelaCabecalho "Lista das Secoes arquivadas"
            LOCATE 8, 1: PRINT LST_CABECALHO
            lin = 9
        END IF
        LOCATE lin, 1: PRINT ArmLinhaLista$(v)
        lin = lin + 1
    NEXT
    LOCATE 21, 3: PRINT "Imprimo os resultados S/*N* "
    k = UCASE$(TeclaLer$)
    IF k = "S" THEN
        arqLst = DirDados + VigObra + "_ARMADURA.LST"
        TelaStatus "Aguarde ..."
        ArmRelatorio arqLst
        Espera "Relatorio gravado em " + arqLst, 0   ' RECONSTRUCAO: texto nao esta no dump
    END IF
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: 'ARMCALC.BM'
