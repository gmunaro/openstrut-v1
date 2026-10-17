' ============================================================================
'  VIGA.BAS - modulo VIGA do SISTRUT 4.0 (vigas continuas, NB-1/78)
'  Reconstruido do VIGA.EXE (QuickBASIC 4.5, abril 1991) em QB64 Phoenix.
'  Verificacao de licenca do original nao reimplementada. Textos de tela seguem dump de strings do VIGA.EXE (fora do repositorio).
'
'  Fluxo: menu principal -> entrada e correcao de vigas (memoria) -> calculo
'  -> resultados por tramo, relatorio .LST, gravacao .VIG/.SEC, somatoria de
'  cargas .REP e desenho .VET. Dados e calculo: SISDADOS.BM e VIGCALC.BM.
'
'  RECONSTRUCAO: quando o dump nao mostra a tela inteira, o trecho esta
'  marcado com "RECONSTRUCAO:" e a suposicao aparece no comentario.
' ============================================================================
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' --- chaves do VIGA.INI (achadas pela descricao, nao pela posicao) --------
CONST DESC_UN_MEDIDA = "UNIDADE DE MEDIDA LINEAR"
CONST DESC_MULT_MEDIDA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE MEDIDA PARA TRANSFORMAR EM METROS"
CONST DESC_UN_FORCA = "UNIDADE DE FORCA"
CONST DESC_MULT_FORCA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE FORCA PARA TRANSFORMAR EM TONELADAS"
CONST DESC_PCT_NEG = "PORCENTAGEM MULTIPLICADORA DOS MOMENTOS NEGATIVOS PARA REDUCAO - 15 a 100"
CONST DESC_ACID_SN = "CONSIDERACAO DE CARGAS ACIDENTAIS NOS DADOS E RESULTADOS - S/N"
CONST DESC_ACID_FG = "DADOS DE CARGA ACIDENTAL FORNECIDOS PELA ENTRADA DE DADOS OU GERADOS - F/G"
CONST DESC_ACID_PCT = "PORCENTAGEM DE CARGA ACIDENTAL GERADA EM RELACAO A CARGA TOTAL - 4 a 96"
CONST DESC_MEXT = "APLICACAO E FORNECIMENTO DE MOMENTOS EXTERNOS ACIDENTAIS - S/N"
CONST DESC_INDEX = "INDEXACAO E\OU SOMATORIA EM PILARES COM REACOES ESTATICAS OU MAXIMAS - E/M"
CONST DESC_MAXMEM = "NUMERO MAXIMO DE VIGAS ARQUIVADOS SIMULTANEAMENTE EM MEMORIA"
CONST DESC_MAXPROC = "NUMERO MAXIMO DE VIGAS PARA PROCESSAMENTO CONJUNTO COM REACAO EM PILARES"
CONST DESC_MAXPIL = "NUMERO MAXIMO DE PILARES DIFERENTES PARA A SOMATORIA DE CARGAS NOS PILARES"

DIM SHARED DirDados AS STRING          ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED UnMedida AS STRING          ' unidade de medida linear (VIGA.INI)
DIM SHARED UnForca AS STRING           ' unidade de forca (VIGA.INI)
DIM SHARED AcidSN AS STRING            ' considera cargas acidentais: S/N
DIM SHARED AcidFG AS STRING            ' acidental fornecida (F) ou gerada (G)
DIM SHARED AcidPct AS DOUBLE           ' % da carga total gerada como acidental
' Materiais do dimensionamento (VigLeMateriais): fck, fyk em tf/cm2,
' coeficientes de seguranca e cobrimento ate o centro da armadura (h - d, cm).
DIM SHARED MatFck AS DOUBLE, MatFyk AS DOUBLE, MatGf AS DOUBLE, MatGc AS DOUBLE, MatGs AS DOUBLE, MatCob AS DOUBLE

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho ()
DECLARE SUB MenuItem (lin AS INTEGER, num AS INTEGER, texto AS STRING)
DECLARE FUNCTION IniValorDe$ (desc AS STRING)
DECLARE FUNCTION IniArq$ ()
DECLARE SUB VigEntrada ()
DECLARE FUNCTION VigNova% (nome AS STRING)
DECLARE FUNCTION SimNao$ (padrao AS STRING)
DECLARE SUB VigProcessaArq ()
DECLARE SUB VigUma ()
DECLARE SUB VigParametros ()
DECLARE SUB VigLista ()
DECLARE SUB VigCorrige ()
DECLARE SUB VigDisco ()
DECLARE FUNCTION VigAchaNome% (nome AS STRING)
DECLARE FUNCTION VigMarca% (lista AS STRING, marc() AS INTEGER, vazias AS STRING)
DECLARE SUB VigResumoPilares ()
DECLARE SUB VigRelatorio (marc() AS INTEGER, avs() AS STRING)
DECLARE SUB VigTextoQuebrado (texto AS STRING, lin AS INTEGER, limite AS INTEGER)
DECLARE FUNCTION VigCorte% (s AS STRING, larg AS INTEGER)
DECLARE SUB VigDesenho (v AS INTEGER)
DECLARE FUNCTION VigContaArq% (arq AS STRING, nomes AS STRING)
DECLARE SUB VigRecalcApoio (v AS INTEGER)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB VigLeMateriais ()
DECLARE FUNCTION VigNumArq# (desc AS STRING, padrao AS DOUBLE)
DECLARE FUNCTION VigApoioTxt$ (v AS INTEGER, k AS INTEGER, r AS DOUBLE)

' --- programa principal ----------------------------------------------------
CarregaConfiguracao
MenuPrincipal
CLS
LOCATE 12, 3: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le o VIGA.INI da pasta de execucao e define o diretorio de dados e a obra.
' Sem VIGA.INI (ou sem chave de dados) IniDirDados$ usa a pasta de trabalho.
SUB CarregaConfiguracao
    ComumDirExecDefine _CWD$
    TelaStatus "Aguarde ..."
    VigLeMateriais                     ' antes do VIGA.INI: usa o buffer do ArqLer%
    IF ArqLer%(IniArq$) > 0 THEN
        DirDados = IniDirDados$
    ELSE
        DirDados = DirUtilizavel$("")
    END IF
    VigObra$ = ObraAtual$(DirDados)
    IF VigObra$ = "" THEN VigObra$ = "sem nome"
    ' Parametros usados pela entrada de cargas (VIGA.INI; padrao se faltar).
    UnMedida = IniValorDe$(DESC_UN_MEDIDA)
    UnForca = IniValorDe$(DESC_UN_FORCA)
    AcidSN = IniValorDe$(DESC_ACID_SN)
    AcidFG = IniValorDe$(DESC_ACID_FG)
    AcidPct = VAL(IniValorDe$(DESC_ACID_PCT))
END SUB

' Valor da chave do VIGA.INI pela descricao; "?" se a chave nao existe.
FUNCTION IniValorDe$ (desc AS STRING)
    DIM n AS INTEGER
    n = ArqAchaTexto%(desc, 0)
    IF n > 0 THEN IniValorDe$ = IniValor$(n) ELSE IniValorDe$ = "?"
END FUNCTION

' Materiais do dimensionamento. O VIGA.INI nao tem essas chaves; como o
' DESDIM, le Fck, Fyk (vezes o multiplicador de unidade), tipo de aco A/B
' (CcaAcoClasse%) e os coeficientes de seguranca do ARMADURA.INI da pasta de
' execucao. h - d = cobrimento + acrescimo do SISTRUT.DSP (linhas
' "COBRIMENTO DA ARMADURA" e "ACRESCIMO AO COBRIMENTO"). Chave ausente ou
' invalida fica no padrao: fck 0,15, fyk 5,0 tf/cm2, gf 1,4, gc 1,4, gs 1,15,
' h - d = 4 cm, aco classe A.
' RECONSTRUCAO: o EXE nao mostra de onde o VIGA tirava os materiais.
SUB VigLeMateriais
    DIM mult AS DOUBLE, n AS INTEGER
    MatFck = 0.15#: MatFyk = 5#: MatGf = 1.4#: MatGc = 1.4#: MatGs = 1.15#: MatCob = 4#
    IF ArqLer%(ComumDirExec$ + "ARMADURA.INI") > 0 THEN
        mult = VigNumArq#("COEFICIENTE MULTIPLICADOR DA UNIDADE DE Fck E Fyk PARA TRANSFORMAR EM T/C2", 1#)
        MatFck = VigNumArq#("RESISTENCIA CARACTERISTICA DO CONCRETO - Fck", 0.15#) * mult
        MatFyk = VigNumArq#("RESISTENCIA CATACTERISTICA DO ACO - Fyk", 5#) * mult
        MatGf = VigNumArq#("COEFICIENTE DE SEGURANCA DOS ESFORCOS", 1.4#)
        MatGc = VigNumArq#("COEFICIENTE DE SEGURANCA DO CONCRETO", 1.4#)
        MatGs = VigNumArq#("COEFICIENTE DE SEGURANCA DO ACO", 1.15#)
        n = ArqAchaTexto%("TIPO DE ACO (A/B)", 0)
        IF n > 0 THEN
            IF UCASE$(LTRIM$(RTRIM$(IniValor$(n)))) = "B" THEN n = CcaAcoClasse%(1) ELSE n = CcaAcoClasse%(0)
        END IF
    END IF
    IF ArqLer%(ComumDirExec$ + "SISTRUT.DSP") > 0 THEN
        MatCob = VigNumArq#("COBRIMENTO DA ARMADURA-CM", 2#) + VigNumArq#("ACRESCIMO AO COBRIMENTO PARA O INICIO DA ALTURA UTIL-CM", 2#)
    END IF
    ArqQtd = 0                         ' sem VIGA.INI o buffer fica vazio, como antes
END SUB

' Valor numerico positivo da linha do ultimo arquivo lido (ArqLer%) que contem
' desc: antes do "=" (formato INI) ou primeiro campo (formato DSP). padrao se a
' linha nao existe ou o valor nao e positivo.
FUNCTION VigNumArq# (desc AS STRING, padrao AS DOUBLE)
    DIM n AS INTEGER, l AS STRING, p AS INTEGER
    VigNumArq# = padrao
    n = ArqAchaTexto%(desc, 0)
    IF n = 0 THEN EXIT FUNCTION
    l = LTRIM$(ArqLinha$(n))
    p = INSTR(l, "=")
    IF p > 0 THEN l = LEFT$(l, p - 1)
    IF VAL(l) > 0 THEN VigNumArq# = VAL(l)
END FUNCTION

' Caminho do VIGA.INI: pasta de execucao, como nos demais modulos.
FUNCTION IniArq$ ()
    IniArq$ = ComumDirExec$ + "VIGA.INI"
END FUNCTION

' Menu principal. Teclas 1 a 8 chamam as rotinas; <F2> = Fim.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        TelaCabecalho
        MenuItem 7, 1, "Arquivar Geometria das Vigas"
        MenuItem 8, 2, "Processar Vigas arquivadas"
        MenuItem 9, 3, "Processar uma Viga"
        MenuItem 10, 4, "Lista das Vigas Arquivadas"
        MenuItem 11, 5, "Correcoes dos dados"
        MenuItem 12, 6, "Gravacao e Leitura de Vigas"
        LOCATE 13, 8: PRINT "7  -  Processar com ";
        TelaItemMenu 13, 28, "Resumo de cargas nos Pilares"
        MenuItem 14, 8, "Visualizar / Alterar Parametrizacoes"
        LOCATE 17, 8: PRINT "<F2> = Fim "
        LOCATE 19, 8: PRINT "Escolha opcao ";
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1": VigEntrada
            CASE "2": VigProcessaArq
            CASE "3": VigUma
            CASE "4": VigLista
            CASE "5": VigCorrige
            CASE "6": VigDisco
            CASE "7": VigResumoPilares
            CASE "8": VigParametros
            CASE CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Item de menu: numero, separador e texto com a primeira letra em destaque.
SUB MenuItem (lin AS INTEGER, num AS INTEGER, texto AS STRING)
    LOCATE lin, 8: PRINT LTRIM$(STR$(num)); "  -  ";
    TelaItemMenu lin, 14, texto
END SUB

' Cabecalho das telas: titulo, versao e obra corrente.
SUB TelaCabecalho
    CLS
    LOCATE 2, 3: PRINT "VIGAS CONTINUAS"
    LOCATE 3, 3: PRINT "OpenStrut                              "
    LOCATE 4, 3: PRINT "Abril 1991   (omitido)                 "
    LOCATE 5, 3: PRINT "Versao 4.0   "
    LOCATE 5, 40: PRINT "Obra "; VigObra$
    TelaStatus "<F2> = Fim"
END SUB

' ----------------------------------------------------------------------------
' Entrada de vigas (opcao 1). Os dados de uma viga ficam nos arrays Nov* ate o
' usuario confirmar "Dados Corretos"; so depois a viga entra em VigAdiciona.
' ----------------------------------------------------------------------------
CONST NOV_MAXT = 100       ' tramos por viga na entrada
CONST NOV_MAXC = 20        ' cargas concentradas por tramo na entrada
DIM SHARED NovVao(1 TO NOV_MAXT) AS DOUBLE, NovQP(1 TO NOV_MAXT) AS DOUBLE
DIM SHARED NovQA(1 TO NOV_MAXT) AS DOUBLE, NovNC(1 TO NOV_MAXT) AS INTEGER
DIM SHARED NovCa(1 TO NOV_MAXT, 1 TO NOV_MAXC) AS DOUBLE
DIM SHARED NovCP(1 TO NOV_MAXT, 1 TO NOV_MAXC) AS DOUBLE
DIM SHARED NovApo(0 TO NOV_MAXT) AS STRING

' Opcao 1: obra, opcao de manter vigas em memoria e leitura de vigas ate FIM.
SUB VigEntrada
    DIM nome AS STRING, v AS INTEGER
    TelaCabecalho
    LOCATE 7, 3: PRINT "Arquivo de Vigas Continuas"
    IF VigQtd > 0 THEN
        LOCATE 8, 3: PRINT "Mantenho as Vigas arquivadas em memoria   NAO/*";
        IF SimNao$("S") = "N" THEN VigLimpa
        PRINT "* ";
    END IF
    LOCATE 10, 3: PRINT "Obra ";
    VigObra$ = EntradaTexto$(CSRLIN, POS(0), 8, VigObra$)
    LOCATE 11, 3: PRINT "maximo 8 caracteres"
    DO
        LOCATE 13, 3: PRINT "Viga *FIM* ";
        nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, ""))
        IF nome = "" OR nome = "FIM" THEN EXIT DO
        v = VigNova%(nome)
        IF v = 0 THEN EXIT DO
    LOOP
END SUB

' Le uma viga: geometria, cargas por tramo e pilares dos apoios. Repete ate
' "Dados Corretos" = S. Devolve o indice da viga, ou 0 se estourar os limites.
FUNCTION VigNova% (nome AS STRING)
    DIM semBal AS INTEGER, balE AS STRING, balD AS STRING, ambos AS STRING
    DIM engE AS STRING, engD AS STRING, bw AS DOUBLE, h AS DOUBLE
    DIM nTra AS INTEGER, t AS INTEGER, k AS INTEGER, j AS INTEGER, nd AS INTEGER
    DIM qTot AS DOUBLE, v AS INTEGER, ti AS INTEGER
    DIM ok AS STRING, lin AS INTEGER, ans AS STRING, r AS INTEGER
    DO
        TelaCabecalho
        LOCATE 7, 3: PRINT "Viga "; nome
        LOCATE 9, 3: PRINT "Numero de tramos sem balanco ";
        semBal = INT(EntradaNumero#(CSRLIN, POS(0), 3, 1))
        ' RECONSTRUCAO: a ordem e o efeito de "ambos" nao estao no dump; ambos = S marca os dois lados.
        LOCATE 10, 3: PRINT "Balanco  esquerda(";
        balE = SimNao$("N")
        PRINT ")  direita(";
        balD = SimNao$("N")
        PRINT ")  ambos(";
        ambos = SimNao$("N")
        PRINT ")"
        IF ambos = "S" THEN balE = "S": balD = "S"
        ' Engaste so onde nao ha balanco. RECONSTRUCAO: rotulos do engaste na linha 11.
        engE = "N": engD = "N"
        LOCATE 11, 3
        IF balE = "N" THEN
            PRINT "Engaste  esquerda(";
            engE = SimNao$("N")
            PRINT ")  ";
        END IF
        IF balD = "N" THEN
            PRINT "direita(";
            engD = SimNao$("N")
            PRINT ")"
        END IF
        LOCATE 12, 3: PRINT "Secao 1)  Bw,Hw ";
        bw = EntradaNumero#(CSRLIN, POS(0), 8, 0)
        PRINT ",";
        h = EntradaNumero#(CSRLIN, POS(0), 8, 0)

        nTra = semBal
        IF balE = "S" THEN nTra = nTra + 1
        IF balD = "S" THEN nTra = nTra + 1
        IF nTra < 1 OR nTra > NOV_MAXT THEN
            TelaErro "Numero de tramos fora do limite"
            nTra = 1
        END IF

        ' Vao, cargas e cargas concentradas de cada tramo.
        FOR t = 1 TO nTra
            TelaCabecalho
            LOCATE 7, 3: PRINT "Viga "; nome; "   Tramo "; t
            LOCATE 9, 3: PRINT "TRAMO     L(";
            NovVao(t) = EntradaNumero#(CSRLIN, POS(0), 8, 0)
            PRINT ")";
            LOCATE 10, 3: PRINT "CARGA  TRAMO    P(";
            qTot = EntradaNumero#(CSRLIN, POS(0), 8, 0)
            PRINT ")";
            NovQA(t) = 0
            IF AcidSN = "S" AND AcidFG = "F" THEN
                LOCATE 11, 3: PRINT "CARGA  TRAMO   Pac(";
                NovQA(t) = EntradaNumero#(CSRLIN, POS(0), 8, 0)
                PRINT ")";
            ELSEIF AcidSN = "S" THEN
                ' Gerada: acidental = AcidPct% da carga total.
                NovQA(t) = qTot * AcidPct / 100
            END IF
            NovQP(t) = qTot - NovQA(t)

            ' Cargas concentradas: "*NAO*" = nenhuma; S inclui uma e repete.
            nd = 0
            DO
                LOCATE 12, 3: PRINT "CARGA , P , D , F  *";
                ans = SimNao$("N")
                PRINT "*";
                IF ans = "N" OR nd >= NOV_MAXC THEN EXIT DO
                nd = nd + 1
                LOCATE 13, 3: PRINT "P ("; UnForca; ") ";
                NovCP(t, nd) = EntradaNumero#(CSRLIN, POS(0), 8, 0)
                PRINT "  D ("; UnMedida; ") ";
                NovCa(t, nd) = EntradaNumero#(CSRLIN, POS(0), 8, 0)
                LOCATE 14, 3: PRINT SPACE$(70)
            LOOP
            NovNC(t) = nd
        NEXT

        ' Apoios: balanco = "-", engaste = "ENG", demais = numero do pilar.
        TelaCabecalho
        LOCATE 7, 3: PRINT "Dados de Apoio"
        LOCATE 8, 1: PRINT "Entre somente com o numero do Pilar ou   * <Enter>  para desconsiderar o apoio"
        FOR k = 0 TO nTra
            ' Apoios em blocos de 13 linhas (10 a 22): ao virar o bloco, limpa a area.
            IF k > 0 AND k MOD 13 = 0 THEN
                FOR r = 10 TO 22
                    LOCATE r, 1: PRINT SPACE$(79);
                NEXT
            END IF
            lin = 10 + (k MOD 13)
            LOCATE lin, 3: PRINT "Numero do pilar referente ao Apoio "; k + 1; " ";
            IF k = 0 AND balE = "S" THEN
                NovApo(k) = "-": PRINT "-"
            ELSEIF k = nTra AND balD = "S" THEN
                NovApo(k) = "-": PRINT "-"
            ELSEIF k = 0 AND engE = "S" THEN
                NovApo(k) = "ENG": PRINT "ENG"
            ELSEIF k = nTra AND engD = "S" THEN
                NovApo(k) = "ENG": PRINT "ENG"
            ELSE
                NovApo(k) = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, ""))
            END IF
        NEXT

        LOCATE 24, 3: PRINT "Dados Corretos N/*";
        ok = SimNao$("S")
        PRINT "* ";
    LOOP UNTIL ok = "S"

    ' Confirmado: grava a viga na memoria.
    v = VigAdiciona%(nome, nTra, bw, h)
    IF v = 0 THEN
        TelaErro "Limite de vigas em memoria atingido"
        VigNova% = 0
        EXIT FUNCTION
    END IF
    FOR t = 1 TO nTra
        ti = VigTramo%(v, t)
        VigTra(ti).vao = NovVao(t)
        VigTra(ti).qPerm = NovQP(t)
        VigTra(ti).qAcid = NovQA(t)
        FOR j = 1 TO NovNC(t)
            VigAddConc ti, NovCa(t, j), NovCP(t, j)
        NEXT
    NEXT
    FOR k = 0 TO nTra
        VigApo(VigApoio%(v, k + 1)).nome = NovApo(k)
    NEXT
    VigRecalcApoio v
    VigNova% = v
END FUNCTION

' ----------------------------------------------------------------------------
' Recalcula a abscissa x de cada apoio da viga v a partir dos vaos atuais dos
' tramos. Chamada ao cadastrar e ao corrigir um comprimento. y fica 0: a VIGA
' e 1D e o programa nao pede coordenada y do apoio.
' ----------------------------------------------------------------------------
SUB VigRecalcApoio (v AS INTEGER)
    DIM k AS INTEGER, acum AS DOUBLE
    acum = 0
    FOR k = 0 TO Vig(v).nTramos
        VigApo(VigApoio%(v, k + 1)).x = acum
        VigApo(VigApoio%(v, k + 1)).y = 0
        IF k < Vig(v).nTramos THEN acum = acum + VigTra(VigTramo%(v, k + 1)).vao
    NEXT
END SUB

' ----------------------------------------------------------------------------
' Opcao 2: calcula as vigas arquivadas digitadas. A lista usa "/"
' entre nomes; "V1 a V6" e um intervalo pelo numero do nome (VIGFAIXA.BM).
' ----------------------------------------------------------------------------

' Indice da viga de nome dado (em maiusculas), ou 0 se nao existe.
FUNCTION VigAchaNome% (nome AS STRING)
    DIM i AS INTEGER
    FOR i = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(i).nome)) = nome THEN VigAchaNome% = i: EXIT FUNCTION
    NEXT
END FUNCTION

' Marca marc(v) = -1 nas vigas da lista ("I/J/N a M/.../K", ver VIGFAIXA.BM).
' Devolve quantas ficaram marcadas; em vazias, os itens sem nenhuma viga.
FUNCTION VigMarca% (lista AS STRING, marc() AS INTEGER, vazias AS STRING)
    DIM nomes(1 TO DAD_MAXVIG) AS STRING, i AS INTEGER
    FOR i = 1 TO VigQtd
        nomes(i) = Vig(i).nome
    NEXT
    VigMarca% = FaixaMarca%(lista, nomes(), VigQtd, marc(), vazias)
END FUNCTION

' Mostra texto na linha 24 (erro) ou 25 (status), pede ESC ou Enter na linha 23
' e limpa 23 a 25 ao sair. Igual ao Espera do ARMADURA.BAS.
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

' Analisa e dimensiona as vigas marcadas com os materiais de VigLeMateriais
' (ARMADURA.INI e SISTRUT.DSP; padrao 0,15/5,0/1,4/1,4/1,15/4). Vigas que nao
' fecham a analise vao para a lista "NAO FORAM PROCESSADAS".
SUB VigProcessaArq
    DIM marc(1 TO DAD_MAXVIG) AS INTEGER, reac(1 TO NOV_MAXT + 1) AS DOUBLE, avs(1 TO DAD_MAXVIG) AS STRING
    DIM lista AS STRING, msg AS STRING, nao AS STRING, avisos AS STRING, vazias AS STRING
    DIM v AS INTEGER, lin AS INTEGER, k AS STRING, procs AS INTEGER
    TelaCabecalho
    LOCATE 7, 3: PRINT "Calculo das Vigas Arquivadas"
    LOCATE 8, 3: PRINT "Vigas referentes a Obra "; VigObra$
    LOCATE 10, 3: PRINT "Calcular posicoes I/J/N a M/.../K  *RETORNO*"
    LOCATE 11, 3: PRINT "Posicoes ";
    lista = EntradaTexto$(CSRLIN, POS(0), 60, "")
    IF lista = "" THEN EXIT SUB
    IF VigMarca%(lista, marc(), vazias) = 0 THEN
        Espera "Nenhuma viga em: " + LEFT$(vazias, 60), 1
        EXIT SUB
    END IF
    IF vazias <> "" THEN Espera "Sem vigas em: " + LEFT$(vazias, 62), 1
    TelaStatus "Aguarde ..."
    procs = 0
    FOR v = 1 TO VigQtd
        IF marc(v) THEN
            IF VcAnalisa%(v, -1, reac(), msg) THEN
                VcDimensiona v, MatFck, MatFyk, MatGf, MatGc, MatGs, MatCob, msg
                procs = procs + 1
                avisos = avisos + msg
            ELSE
                nao = nao + " " + RTRIM$(Vig(v).nome)
                avisos = avisos + RTRIM$(Vig(v).nome) + ": " + msg
            END IF
            avs(v) = msg
        END IF
    NEXT
    TelaCabecalho
    lin = 13
    IF nao <> "" THEN
        LOCATE lin, 3: PRINT "AS VIGAS REFERENTES AS POSICOES:"
        LOCATE lin + 1, 3: PRINT LEFT$(LTRIM$(nao), 76)
        LOCATE lin + 2, 3: PRINT "NAO FORAM PROCESSADAS"
        lin = lin + 4
    END IF
    VigTextoQuebrado avisos, lin, 22
    ' resultados: .SEC (para ARMADURA/DESENHO/FORMA) e relatorio .LST.
    ' O .SEC so e gravado se todas as vigas marcadas foram processadas.
    IF procs = 0 THEN
        Espera "Nenhuma viga processada: .SEC nao gravado", 1
        EXIT SUB
    ELSEIF nao <> "" THEN
        Espera "Vigas nao processadas: .SEC nao gravado", 1
    ELSE
        VigGrava DirDados + VigObra$ + ".SEC", "SEC"
    END IF
    VigRelatorio marc(), avs()
    LOCATE 23, 3: PRINT "Desenho do esquema de uma viga (nome ou <Enter>) ";
    k = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, ""))
    IF k <> "" THEN
        IF VigAchaNome%(k) > 0 THEN VigDesenho VigAchaNome%(k)
    END IF
END SUB

' Opcao 3: calcula uma viga digitada na hora. Ela entra na memoria (como na
' opcao 1), mas nao e gravada em disco. Mostra momentos e cortantes por tramo.
SUB VigUma
    DIM nome AS STRING, v AS INTEGER, t AS INTEGER, ti AS INTEGER, lin AS INTEGER
    DIM reac(1 TO NOV_MAXT + 1) AS DOUBLE, msg AS STRING, k AS STRING
    TelaCabecalho
    LOCATE 7, 3: PRINT "Calculo de uma Viga independente dos Arquivos"
    LOCATE 9, 3: PRINT "OBRA - ";
    VigObra$ = EntradaTexto$(CSRLIN, POS(0), 8, VigObra$)
    LOCATE 10, 3: PRINT "VIGA - ";
    nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, ""))
    IF nome = "" THEN EXIT SUB
    v = VigNova%(nome)
    IF v = 0 THEN EXIT SUB
    TelaStatus "Aguarde ..."
    IF VcAnalisa%(v, -1, reac(), msg) = 0 THEN
        TelaCabecalho
        lin = 7
        VigTextoQuebrado msg, lin, 21
        Espera "Viga " + nome + " nao processada", 1
        EXIT SUB
    END IF
    VcDimensiona v, MatFck, MatFyk, MatGf, MatGc, MatGs, MatCob, msg
    TelaCabecalho
    LOCATE 7, 3: PRINT "OBRA - "; VigObra$
    LOCATE 8, 3: PRINT "VIGA - "; nome
    ' Larguras das colunas somam 70 (cabe em 80): cada rotulo e alinhado a direita
    ' na mesma largura do valor que aparece embaixo.
    LOCATE 10, 3: PRINT "Tramo";
    PRINT RIGHT$(SPACE$(8) + "Mpos", 8); RIGHT$(SPACE$(9) + "Mneg esq", 9); RIGHT$(SPACE$(9) + "Mneg dir", 9);
    PRINT RIGHT$(SPACE$(8) + "Vesq", 8); RIGHT$(SPACE$(8) + "Vdir", 8); RIGHT$(SPACE$(7) + "As+", 7);
    PRINT RIGHT$(SPACE$(7) + "As-e", 7); RIGHT$(SPACE$(7) + "As-d", 7)
    lin = 11
    FOR t = 1 TO Vig(v).nTramos
        IF lin > 22 THEN
            TelaStatus "Qualquer Tecla para Continuar"
            k = TeclaLer$
            TelaCabecalho
            lin = 7
        END IF
        ti = Vig(v).iTra + t - 1
        LOCATE lin, 3
        PRINT USING "##"; t;
        PRINT "   "; FormataNumero$(VigTra(ti).mPos, 3, 8); FormataNumero$(VigTra(ti).mNegEsq, 3, 9);
        PRINT FormataNumero$(VigTra(ti).mNegDir, 3, 9); FormataNumero$(VigTra(ti).vEsq, 3, 8);
        PRINT FormataNumero$(VigTra(ti).vDir, 3, 8); FormataNumero$(VigTra(ti).asPos, 2, 7);
        PRINT FormataNumero$(VigTra(ti).asNegEsq, 2, 7); FormataNumero$(VigTra(ti).asNegDir, 2, 7)
        lin = lin + 1
    NEXT
    lin = lin + 1
    VigTextoQuebrado msg, lin, 22
    TelaStatus "Qualquer Tecla para Continuar"
    k = TeclaLer$
END SUB

' Opcao 6: grava e le vigas em DRIVE\DIR\OBRA.VIG. Item 2 grava todas as vigas
' da memoria (VigGrava faz copia .BAK); item 5 le o arquivo e substitui a
' memoria; 1 cria arquivo vazio; 3/4 contam e listam sem tocar a memoria;
' 6 abre o DOS; 7 troca o diretorio de dados.
SUB VigDisco
    DIM k AS STRING, nome AS STRING, arq AS STRING, ok AS STRING, f AS INTEGER, n AS INTEGER, nomes AS STRING
    DO
        TelaCabecalho
        LOCATE 7, 3: PRINT "Gravacao e Leitura de Vigas Continuas"
        MenuItem 9, 1, "Criacao de Arquivo em Disco"
        MenuItem 10, 2, "Gravacao de Vigas em Disco"
        MenuItem 11, 3, "Numero de Vigas Gravadas"
        MenuItem 12, 4, "Catalogo de Vigas Gravadas"
        MenuItem 13, 5, "Leitura de Vigas Gravadas"
        MenuItem 14, 6, "Acesso ao DOS (Bytes livres)"
        MenuItem 15, 7, "Alterar Drive e Diretorio"
        MenuItem 16, 8, "Retorno ao Menu Principal"
        LOCATE 19, 8: PRINT "Escolha opcao ";
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "2"
                TelaCabecalho
                LOCATE 7, 3: PRINT "Gravacao de Vigas Continuas"
                IF VigQtd = 0 THEN
                    TelaErro "Nao ha Vigas Arquivadas na Memoria"
                ELSE
                    LOCATE 9, 3: PRINT "Nome do arquivo ";
                    nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, VigObra$))
                    IF nome <> "" THEN
                        arq = DirDados + nome + ".VIG"
                        ok = "S"
                        IF _FILEEXISTS(arq) THEN
                            LOCATE 11, 3: PRINT "ATENCAO ! Este arquivo ja existe e sera substituido."
                            LOCATE 12, 3: PRINT "Gravar mesmo assim SIM/*N* ";
                            ok = SimNao$("N")
                        END IF
                        IF ok = "S" THEN
                            VigGrava arq, "VIG"
                            LOCATE 14, 3: PRINT "Vigas gravadas em "; arq
                        END IF
                        TelaStatus "Qualquer Tecla para Continuar"
                        ok = TeclaLer$
                    END IF
                END IF
            CASE "5"
                TelaCabecalho
                LOCATE 7, 3: PRINT "Leitura de Vigas Gravadas em Disco"
                LOCATE 9, 3: PRINT "Nome da Obra ";
                nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, ""))
                IF nome <> "" THEN
                    arq = DirDados + nome + ".VIG"
                    LOCATE 11, 3: PRINT "As Vigas da memoria serao perdidas SIM/*N* ";
                    ok = SimNao$("N")
                    IF ok = "S" THEN
                        IF VigLe%(arq, "VIG") = 0 THEN
                            TelaErro LEFT$(DadErro, 76)
                        ELSE
                            LOCATE 13, 3: PRINT "Vigas lidas de "; arq
                            TelaStatus "Qualquer Tecla para Continuar"
                            ok = TeclaLer$
                        END IF
                    END IF
                END IF
            CASE "1"
                TelaCabecalho
                LOCATE 7, 3: PRINT "Criacao de Arquivo em Disco"
                LOCATE 9, 3: PRINT "Nome da Obra ";
                nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, VigObra$))
                IF nome <> "" THEN
                    arq = DirDados + nome + ".VIG"
                    ok = "S"
                    IF _FILEEXISTS(arq) THEN
                        LOCATE 11, 3: PRINT "ATENCAO ! Este arquivo ja existe e sera perdido."
                        LOCATE 12, 3: PRINT "Confirme SIM/*N* ";
                        ok = SimNao$("N")
                    END IF
                    IF ok = "S" THEN
                        f = FREEFILE
                        OPEN arq FOR OUTPUT AS #f
                        WRITE #f, "SISTRUT40", "VIG", 1, nome
                        WRITE #f, VigNivel, 0
                        CLOSE #f
                        VigObra$ = nome
                        LOCATE 14, 3: PRINT "Arquivo criado: "; arq
                        TelaStatus "Qualquer Tecla para Continuar"
                        ok = TeclaLer$
                    END IF
                END IF
            CASE "3", "4"
                TelaCabecalho
                IF k = "3" THEN LOCATE 7, 3: PRINT "Numero de Vigas Gravadas" ELSE LOCATE 7, 3: PRINT "Catalogo de Vigas Gravadas"
                LOCATE 9, 3: PRINT "Nome da Obra ";
                nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, VigObra$))
                IF nome <> "" THEN
                    n = VigContaArq%(DirDados + nome + ".VIG", nomes)
                    IF n < 0 THEN
                        TelaErro "NAO EXISTE ESTE ARQUIVO NESTE DISCO"
                    ELSE
                        LOCATE 11, 3: PRINT "Registros "; n
                        IF k = "4" THEN
                            LOCATE 13, 3: PRINT LEFT$(nomes, 76)
                            IF LEN(nomes) > 76 THEN LOCATE 14, 3: PRINT MID$(nomes, 77, 76)
                        END IF
                        TelaStatus "Qualquer Tecla para Continuar"
                        ok = TeclaLer$
                    END IF
                END IF
            CASE "6"
                ' RECONSTRUCAO: "Acesso ao DOS" abre o interpretador de comandos; EXIT volta
                CLS
                PRINT "Digite EXIT para voltar ao SISTRUT"
                SHELL ""
            CASE "7"
                TelaCabecalho
                LOCATE 9, 3: PRINT "Drive:\Diretorio\...\Subdiretorio ";
                ' Padrao vazio: EntradaTexto$ posiciona o cursor em col + LEN(padrao) e
                ' estoura a tela (erro 5) com caminho longo. Enter sem digitar mantem o atual.
                nome = EntradaTexto$(CSRLIN, POS(0), 40, "")
                IF nome <> "" THEN DirDados = DirUtilizavel$(nome)
                LOCATE 11, 3: PRINT "Dados em "; DirDados
                TelaStatus "Qualquer Tecla para Continuar"
                ok = TeclaLer$
            CASE "8", CHR$(0) + CHR$(60)
                EXIT DO
        END SELECT
    LOOP
END SUB

' Opcao 8: corrige os parametros do VIGA.INI. Os valores ficam na coluna 74.
' Itens 1 a 5 editam o grupo; 6 volta ao menu. Ao sair, grava o .INI se algo
' mudou e recarrega as variaveis globais. Momentos externos (item 3) so mostram
' o valor: o VIGCALC ainda nao aplica momentos externos.
SUB VigParametros
    DIM k AS STRING, s AS STRING, v AS DOUBLE, n AS INTEGER, mudou AS INTEGER
    IF ArqLer%(IniArq$) <= 0 THEN
        TelaErro "VIGA.INI nao encontrado"
        EXIT SUB
    END IF
    DO
        TelaCabecalho
        LOCATE 6, 3: PRINT "Correcao dos Parametros"
        LOCATE 8, 5: PRINT "1  -  Reduzir Momentos Negativos a ";
        LOCATE 8, 74: PRINT IniValorDe$(DESC_PCT_NEG)
        LOCATE 9, 5: PRINT "2  -  Considero Cargas Acidentais na entrada de dados/processamento ";
        LOCATE 9, 74: PRINT IniValorDe$(DESC_ACID_SN)
        LOCATE 10, 5: PRINT "     As cargas Acidentais serao <F>ornecidas ou <G>eradas ";
        LOCATE 10, 74: PRINT IniValorDe$(DESC_ACID_FG)
        LOCATE 11, 5: PRINT "     Percentual de Carga Acidental ";
        LOCATE 11, 74: PRINT IniValorDe$(DESC_ACID_PCT)
        LOCATE 12, 5: PRINT "3  -  Aplicacao e Fornecimento de Momentos Externos ";
        LOCATE 12, 74: PRINT IniValorDe$(DESC_MEXT)
        LOCATE 13, 5: PRINT "4  -  Indexacao com reacoes Maximas ou Estaticas (E/M) ";
        LOCATE 13, 74: PRINT IniValorDe$(DESC_INDEX)
        LOCATE 14, 5: PRINT "5  -  Unidade de Esforcos e Medidas"
        LOCATE 15, 5: PRINT "     Unidade de Forca ";
        LOCATE 15, 74: PRINT IniValorDe$(DESC_UN_FORCA)
        LOCATE 16, 5: PRINT "     Coef. Multiplicador para tonelada ";
        LOCATE 16, 74: PRINT IniValorDe$(DESC_MULT_FORCA)
        LOCATE 17, 5: PRINT "     Unidade de Medida ";
        LOCATE 17, 74: PRINT IniValorDe$(DESC_UN_MEDIDA)
        LOCATE 18, 5: PRINT "     Coef. Multiplicador para metro ";
        LOCATE 18, 74: PRINT IniValorDe$(DESC_MULT_MEDIDA)
        LOCATE 20, 5: PRINT "6 - *Retorno ao Menu Principal*"
        LOCATE 22, 5: PRINT "Escolha opcao ";
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "1"
                DO
                    v = EntradaNumero#(8, 74, 5, VAL(IniValorDe$(DESC_PCT_NEG)))
                    IF v >= 15 AND v <= 100 THEN EXIT DO
                    TelaErro "Valor fora da faixa."
                LOOP
                n = ArqAchaTexto%(DESC_PCT_NEG, 0)
                IniDefinir n, LTRIM$(STR$(v))
                mudou = -1
            CASE "2"
                n = ArqAchaTexto%(DESC_ACID_SN, 0)
                LOCATE 9, 74
                IniDefinir n, SimNao$(IniValorDe$(DESC_ACID_SN))
                mudou = -1
                IF IniValorDe$(DESC_ACID_SN) = "S" THEN
                    DO
                        s = UCASE$(EntradaTexto$(10, 74, 1, IniValorDe$(DESC_ACID_FG)))
                        IF s = "F" OR s = "G" THEN EXIT DO
                        TelaErro "Digite F ou G."
                    LOOP
                    n = ArqAchaTexto%(DESC_ACID_FG, 0)
                    IniDefinir n, s
                    DO
                        v = EntradaNumero#(11, 74, 5, VAL(IniValorDe$(DESC_ACID_PCT)))
                        IF v >= 4 AND v <= 96 THEN EXIT DO
                        TelaErro "Valor fora da faixa."
                    LOOP
                    n = ArqAchaTexto%(DESC_ACID_PCT, 0)
                    IniDefinir n, LTRIM$(STR$(v))
                END IF
            CASE "3"
                TelaErro "Momentos externos ainda nao suportados pelo calculo."
            CASE "4"
                DO
                    s = UCASE$(EntradaTexto$(13, 74, 1, IniValorDe$(DESC_INDEX)))
                    IF s = "E" OR s = "M" THEN EXIT DO
                    TelaErro "Digite E ou M."
                LOOP
                n = ArqAchaTexto%(DESC_INDEX, 0)
                IniDefinir n, s
                mudou = -1
            CASE "5"
                s = EntradaTexto$(15, 74, 6, IniValorDe$(DESC_UN_FORCA))
                n = ArqAchaTexto%(DESC_UN_FORCA, 0)
                IniDefinir n, s
                DO
                    v = EntradaNumero#(16, 74, 5, VAL(IniValorDe$(DESC_MULT_FORCA)))
                    IF v > 0 THEN EXIT DO
                    TelaErro "Valor fora da faixa."
                LOOP
                n = ArqAchaTexto%(DESC_MULT_FORCA, 0)
                IniDefinir n, LTRIM$(STR$(v))
                s = EntradaTexto$(17, 74, 6, IniValorDe$(DESC_UN_MEDIDA))
                n = ArqAchaTexto%(DESC_UN_MEDIDA, 0)
                IniDefinir n, s
                DO
                    v = EntradaNumero#(18, 74, 5, VAL(IniValorDe$(DESC_MULT_MEDIDA)))
                    IF v > 0 THEN EXIT DO
                    TelaErro "Valor fora da faixa."
                LOOP
                n = ArqAchaTexto%(DESC_MULT_MEDIDA, 0)
                IniDefinir n, LTRIM$(STR$(v))
                mudou = -1
            CASE "6"
                EXIT DO
        END SELECT
    LOOP
    IF mudou THEN
        ArqGravar IniArq$
        CarregaConfiguracao
    END IF
END SUB

' Opcao 5: corrige nome, vaos e cargas de uma viga pela posicao. Numero de tramos,
' balancos/engastes e momentos externos nao sao alterados aqui (ver TelaErro).
SUB VigCorrige
    DIM s AS STRING, p AS INTEGER, t AS INTEGER, ti AS INTEGER, k AS STRING
    DIM v AS DOUBLE, nome AS STRING
    DO
        TelaCabecalho
        LOCATE 6, 3: PRINT "Correcoes das Geometrias e Carregamentos das Vigas"
        LOCATE 7, 3: PRINT "Posicionadas"
        IF VigQtd = 0 THEN
            TelaErro "Nao ha Vigas Arquivadas na Memoria"
            EXIT SUB
        END IF
        LOCATE 9, 3: PRINT "Numero da Posicao a ser Alterada *FIM* ";
        s = EntradaTexto$(CSRLIN, POS(0), 4, "")
        IF s = "" OR UCASE$(s) = "FIM" THEN EXIT DO
        p = VAL(s)
        IF p < 1 OR p > VigQtd THEN
            TelaErro "Posicao inexistente"
        ELSE
            DO
                TelaCabecalho
                LOCATE 7, 3: PRINT "Posicao("; p; ")  Viga "; RTRIM$(Vig(p).nome)
                LOCATE 9, 5: PRINT "1  -  Alteracao do nome da Viga"
                LOCATE 10, 5: PRINT "2  -  Numero de Tramos"
                LOCATE 11, 5: PRINT "3  -  Balancos e Engastes"
                LOCATE 12, 5: PRINT "4  -  Comprimento dos Tramos e Inercias"
                LOCATE 13, 5: PRINT "5  -  Cargas Totais"
                LOCATE 14, 5: PRINT "6  -  Cargas Acidentais"
                LOCATE 15, 5: PRINT "7  -  Momentos Aplicados"
                LOCATE 16, 5: PRINT "8  -  *Fim da Correcao*"
                LOCATE 18, 5: PRINT "Escolha opcao ";
                k = UCASE$(TeclaLer$)
                SELECT CASE k
                    CASE "1"
                        LOCATE 20, 5: PRINT "Viga ";
                        nome = UCASE$(EntradaTexto$(CSRLIN, POS(0), 8, RTRIM$(Vig(p).nome)))
                        IF nome <> "" AND nome <> RTRIM$(Vig(p).nome) THEN
                            IF VigAchaNome%(nome) > 0 THEN
                                TelaErro "Ja existe viga com este nome"
                            ELSE
                                Vig(p).nome = nome
                            END IF
                        END IF
                    CASE "2", "3"
                        TelaErro "Tramos e balancos nao mudam aqui; cadastre a viga de novo (opcao 1)."
                    CASE "4", "5", "6"
                        LOCATE 20, 5: PRINT "Tramo ";
                        t = INT(EntradaNumero#(CSRLIN, POS(0), 3, 1))
                        IF t < 1 OR t > Vig(p).nTramos THEN
                            TelaErro "Tramo inexistente"
                        ELSE
                            ti = VigTramo%(p, t)
                            IF k = "4" THEN
                                LOCATE 21, 5: PRINT "Comprimento L (m) ";
                                v = EntradaNumero#(CSRLIN, POS(0), 8, VigTra(ti).vao)
                                IF v > 0 THEN
                                    VigTra(ti).vao = v
                                    VigRecalcApoio p
                                ELSE
                                    TelaErro "Comprimento deve ser maior que zero"
                                END IF
                            ELSEIF k = "5" THEN
                                LOCATE 21, 5: PRINT "Carga permanente (tf/m) ";
                                v = EntradaNumero#(CSRLIN, POS(0), 8, VigTra(ti).qPerm)
                                IF v >= 0 THEN VigTra(ti).qPerm = v ELSE TelaErro "Carga nao pode ser negativa"
                            ELSE
                                LOCATE 21, 5: PRINT "Carga acidental (tf/m) ";
                                v = EntradaNumero#(CSRLIN, POS(0), 8, VigTra(ti).qAcid)
                                IF v >= 0 THEN VigTra(ti).qAcid = v ELSE TelaErro "Carga nao pode ser negativa"
                            END IF
                        END IF
                    CASE "7"
                        TelaErro "Momentos externos ainda nao suportados pelo calculo."
                    CASE "8", CHR$(0) + CHR$(60)
                        EXIT DO
                END SELECT
            LOOP
        END IF
    LOOP
END SUB

' Opcao 4: lista as vigas arquivadas em memoria (posicao, viga e tramos).
' Repete enquanto "Relisto as Vigas" for S.
SUB VigLista
    DIM v AS INTEGER, lin AS INTEGER, k AS STRING
    DO
        TelaCabecalho
        LOCATE 7, 3: PRINT "Lista das Vigas Arquivadas"
        IF VigQtd = 0 THEN
            TelaErro "Nao ha Vigas Arquivadas na Memoria"
            EXIT SUB
        END IF
        LOCATE 8, 3: PRINT "Vigas da Obra "; VigObra$
        LOCATE 10, 3: PRINT "Listo as Vigas S/*N* ";
        IF SimNao$("N") = "N" THEN EXIT SUB
        LOCATE 12, 3: PRINT "Posicao"; TAB(12); "Viga"; TAB(26); "Tramos"
        lin = 13
        FOR v = 1 TO VigQtd
            IF lin > 22 THEN
                TelaStatus "Qualquer Tecla para Continuar"
                k = TeclaLer$
                TelaCabecalho
                lin = 7
            END IF
            LOCATE lin, 3: PRINT LTRIM$(STR$(v)); TAB(12); RTRIM$(Vig(v).nome); TAB(26); LTRIM$(STR$(Vig(v).nTramos))
            lin = lin + 1
        NEXT
        LOCATE 23, 3: PRINT "Relisto as Vigas S/*N* ";
        k = SimNao$("N")
    LOOP WHILE k = "S"
END SUB

' Le S ou N com o padrao mostrado na posicao do cursor. Enter devolve o padrao.
' Deixa o cursor logo depois da resposta. Quem chama imprime o texto em volta.
FUNCTION SimNao$ (padrao AS STRING)
    DIM lin AS INTEGER, col AS INTEGER, k AS STRING
    lin = CSRLIN: col = POS(0)
    PRINT padrao;
    LOCATE lin, col
    DO
        k = UCASE$(TeclaLer$)
        IF k = CHR$(13) THEN k = padrao
        IF k = "S" OR k = "N" THEN
            LOCATE lin, col: PRINT k;
            SimNao$ = k: EXIT FUNCTION
        END IF
    LOOP
END FUNCTION


' Opcao 7: processa todas as vigas, soma as reacoes nos apoios que sao
' pilares (nome iniciado por "P") e oferece gravar o .REP para o PILAR.
' Reacoes que nao vao para pilar (engaste "ENG" e apoio em outra viga) saem
' na mesma tabela, depois dos pilares, com o destino (VigApoioTxt$).
SUB VigResumoPilares
    DIM v AS INTEGER, k AS INTEGER, i AS INTEGER, lin AS INTEGER, msg AS STRING, avisos AS STRING
    DIM cut AS INTEGER, rest AS STRING
    DIM reac(1 TO NOV_MAXT + 1) AS DOUBLE, ap AS INTEGER, nome AS STRING, ok AS STRING
    DIM marc(1 TO DAD_MAXVIG) AS INTEGER, falhas AS INTEGER, avs(1 TO DAD_MAXVIG) AS STRING
    DIM outras(1 TO 200) AS STRING, nOutras AS INTEGER
    TelaCabecalho
    LOCATE 7, 3: PRINT "Processamento de Vigas Continuas com saida de cargas nos Pilares"
    IF VigQtd = 0 THEN TelaErro "Nao ha Vigas Arquivadas na Memoria": EXIT SUB
    TelaStatus "Aguarde ..."
    CPilQtd = 0: CPilObra = VigObra$: CPilNivel = VigNivel
    falhas = 0
    FOR v = 1 TO VigQtd
        marc(v) = -1
        IF VcAnalisa%(v, -1, reac(), msg) THEN
            VcDimensiona v, MatFck, MatFyk, MatGf, MatGc, MatGs, MatCob, msg
            avisos = avisos + msg
            avs(v) = msg
            FOR k = 1 TO Vig(v).nTramos + 1
                ap = VigApoio%(v, k): nome = RTRIM$(VigApo(ap).nome)
                IF LEFT$(UCASE$(nome), 1) = "P" THEN
                    i = CPilSoma%(nome, VigApo(ap).x, VigApo(ap).y, reac(k), 0, 0)
                ELSEIF VigApoioTxt$(v, k, reac(k)) <> "" AND nOutras < 200 THEN
                    ' engaste ou viga de apoio: nao entra no .REP, sai na tabela
                    ' RECONSTRUCAO: a carga em outra viga e informada, nao propagada
                    nOutras = nOutras + 1
                    outras(nOutras) = LEFT$(nome + SPACE$(8), 8) + FormataNumero$(reac(k), 2, 12) + "  " + VigApoioTxt$(v, k, reac(k))
                END IF
            NEXT
        ELSE
            avisos = avisos + RTRIM$(Vig(v).nome) + ": " + msg + " "
            avs(v) = msg
            falhas = falhas + 1
        END IF
    NEXT
    TelaCabecalho
    LOCATE 7, 3: PRINT "SOMATORIA DE REACOES EM PILARES"
    LOCATE 8, 3: PRINT "Pilar      carga (tf)"
    lin = 9
    FOR i = 1 TO CPilQtd
        IF lin > 21 THEN
            TelaStatus "Qualquer Tecla para Continuar"
            ok = TeclaLer$
            TelaCabecalho
            lin = 7
        END IF
        LOCATE lin, 3: PRINT LEFT$(RTRIM$(CPil(i).nome) + SPACE$(8), 8); FormataNumero$(CPil(i).N, 2, 12)
        lin = lin + 1
    NEXT
    ' Cada reacao de outra destinacao quebra no ultimo espaco, como os avisos abaixo.
    FOR i = 1 TO nOutras
        rest = outras(i)
        DO WHILE rest <> ""
            IF lin > 21 THEN
                TelaStatus "Qualquer Tecla para Continuar"
                ok = TeclaLer$
                TelaCabecalho
                lin = 7
            END IF
            cut = LEN(rest)
            IF cut > 76 THEN
                cut = 76
                DO WHILE cut > 1 AND MID$(rest, cut, 1) <> " ": cut = cut - 1: LOOP
                IF cut = 1 THEN cut = 76
            END IF
            LOCATE lin, 3: PRINT RTRIM$(LEFT$(rest, cut))
            rest = LTRIM$(MID$(rest, cut + 1))
            lin = lin + 1
        LOOP
    NEXT
    ' Avisos saem em linhas de ate 76 colunas, quebradas no ultimo espaco,
    ' com a mesma paginacao da lista de pilares (nada cortado).
    DO WHILE avisos <> ""
        IF lin > 21 THEN
            TelaStatus "Qualquer Tecla para Continuar"
            ok = TeclaLer$
            TelaCabecalho
            lin = 7
        END IF
        cut = LEN(avisos)
        IF cut > 76 THEN
            cut = 76
            DO WHILE cut > 1 AND MID$(avisos, cut, 1) <> " ": cut = cut - 1: LOOP
            IF cut = 1 THEN cut = 76
        END IF
        LOCATE lin, 3: PRINT RTRIM$(LEFT$(avisos, cut))
        avisos = LTRIM$(MID$(avisos, cut + 1))
        lin = lin + 1
    LOOP
    LOCATE 23, 3: PRINT "GRAVO A SOMATORIA DE CARGAS NOS PILARES EM DISCO DE DADOS (.REP)  S/*N* ";
    ok = SimNao$("N")
    IF ok = "S" THEN
        CPilGrava DirDados + VigObra$ + ".REP", "REP"
        TelaErro "Este arquivo  (.REP)  sera recuperado pelo programa PILAR - Edificios"
    END IF
    ' .SEC so se todas as vigas tiveram calculo (senao o arquivo ficaria incompleto)
    IF falhas > 0 THEN
        Espera "Vigas sem calculo: .SEC nao gravado", 1
    ELSE
        VigGrava DirDados + VigObra$ + ".SEC", "SEC"
    END IF
    VigRelatorio marc(), avs()
END SUB

' Destino da reacao r (tf) do apoio k (1..nTramos+1) da viga v quando nao e
' pilar: engaste "ENG" (reacao e momento no engaste, nao transferidos a pilar)
' ou outra viga (carga transferida a viga de apoio). "" para pilar e balanco.
FUNCTION VigApoioTxt$ (v AS INTEGER, k AS INTEGER, r AS DOUBLE)
    DIM nome AS STRING, m AS DOUBLE
    nome = RTRIM$(VigApo(VigApoio%(v, k)).nome)
    IF VcEngaste%(v, k - 1) THEN
        IF k = 1 THEN m = VigTra(VigTramo%(v, 1)).mNegEsq ELSE m = VigTra(VigTramo%(v, Vig(v).nTramos)).mNegDir
        VigApoioTxt$ = "engaste de " + RTRIM$(Vig(v).nome) + ", M =" + STR$(CLNG(m * 100) / 100) + " tf.m, nao vai a pilar"
    ELSEIF UCASE$(nome) = "ENG" THEN
        VigApoioTxt$ = "ENG interno de " + RTRIM$(Vig(v).nome) + " (apoio continuo), nao vai a pilar"
    ELSEIF nome <> "" AND nome <> "-" AND LEFT$(UCASE$(nome), 1) <> "P" THEN
        VigApoioTxt$ = "carga de " + RTRIM$(Vig(v).nome) + " transferida a viga " + nome + ", nao vai a pilar"
    END IF
END FUNCTION

' Escreve texto na tela a partir da linha lin (coluna 3), em linhas de ate 76
' colunas quebradas no ultimo espaco. Passando da linha limite, pede tecla e
' continua numa tela nova a partir da linha 7. Devolve em lin a proxima linha.
SUB VigTextoQuebrado (texto AS STRING, lin AS INTEGER, limite AS INTEGER)
    DIM rest AS STRING, cut AS INTEGER, k AS STRING
    rest = LTRIM$(texto)
    DO WHILE rest <> ""
        IF lin > limite THEN
            TelaStatus "Qualquer Tecla para Continuar"
            k = TeclaLer$
            TelaCabecalho
            lin = 7
        END IF
        cut = VigCorte%(rest, 76)
        LOCATE lin, 3: PRINT RTRIM$(LEFT$(rest, cut))
        rest = LTRIM$(MID$(rest, cut + 1))
        lin = lin + 1
    LOOP
END SUB

' Quantos caracteres de s cabem numa linha de larg colunas sem partir palavra
' (ultimo espaco antes de larg); palavra maior que a linha e cortada em larg.
FUNCTION VigCorte% (s AS STRING, larg AS INTEGER)
    DIM cut AS INTEGER
    cut = LEN(s)
    IF cut > larg THEN
        cut = larg + 1
        DO WHILE cut > 1 AND MID$(s, cut, 1) <> " ": cut = cut - 1: LOOP
        IF cut = 1 THEN cut = larg
    END IF
    VigCorte% = cut
END FUNCTION

' Grava o relatorio <obra>_VIGA.LST das vigas marcadas ja processadas:
' por tramo vao, cargas, esforcos da envoltoria, armaduras e estribos; depois
' as reacoes por apoio, com o destino das que nao vao para pilar, e os avisos
' do calculo avs(v) inteiros, um por linha.
SUB VigRelatorio (marc() AS INTEGER, avs() AS STRING)
    DIM f AS INTEGER, v AS INTEGER, t AS INTEGER, ti AS INTEGER, arq AS STRING
    DIM reac(1 TO NOV_MAXT + 1) AS DOUBLE, msg AS STRING, k AS INTEGER, rest AS STRING, p AS INTEGER
    arq = DirDados + VigObra$ + "_VIGA.LST"
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    PRINT #f, "SISTRUT Software e Tecnologia s/c Ltda      VIGAS CONTINUAS - Versao 4.0"
    PRINT #f, "Obra - "; VigObra$
    FOR v = 1 TO VigQtd
        IF marc(v) THEN
            PRINT #f, ""
            PRINT #f, "VIGA - "; RTRIM$(Vig(v).nome); "   secao"; Vig(v).bw; "x"; Vig(v).h; "cm   d ="; Vig(v).d; "cm"
            PRINT #f, "Tramo   Vao(m)  qPerm   qAcid    M+(tfm)  M-esq    M-dir    Vesq(tf) Vdir     As+(cm2) As-esq   As-dir   Estribos"
            FOR t = 1 TO Vig(v).nTramos
                ti = VigTramo%(v, t)
                PRINT #f, USING "##   "; t;
                PRINT #f, FormataNumero$(VigTra(ti).vao, 2, 8); FormataNumero$(VigTra(ti).qPerm, 2, 8); FormataNumero$(VigTra(ti).qAcid, 2, 8);
                PRINT #f, FormataNumero$(VigTra(ti).mPos, 2, 9); FormataNumero$(VigTra(ti).mNegEsq, 2, 9); FormataNumero$(VigTra(ti).mNegDir, 2, 9);
                PRINT #f, FormataNumero$(VigTra(ti).vEsq, 2, 9); FormataNumero$(VigTra(ti).vDir, 2, 9);
                PRINT #f, FormataNumero$(VigTra(ti).asPos, 2, 9); FormataNumero$(VigTra(ti).asNegEsq, 2, 9); FormataNumero$(VigTra(ti).asNegDir, 2, 9);
                PRINT #f, "  phi"; LTRIM$(STR$(VigTra(ti).phiEst)); " c/"; LTRIM$(STR$(VigTra(ti).sEst))
            NEXT
            ' reacoes (VcAnalisa% so recalcula a envoltoria, igual a ja gravada)
            IF VcAnalisa%(v, -1, reac(), msg) THEN
                PRINT #f, "Apoio    Reacao(tf)"
                FOR k = 1 TO Vig(v).nTramos + 1
                    IF RTRIM$(VigApo(VigApoio%(v, k)).nome) <> "-" THEN
                        PRINT #f, LEFT$(RTRIM$(VigApo(VigApoio%(v, k)).nome) + SPACE$(8), 8); FormataNumero$(reac(k), 2, 10); "  "; VigApoioTxt$(v, k, reac(k))
                    END IF
                NEXT
            END IF
            ' avisos terminam em ". " (VcAnalisa%/VcDimensiona)
            rest = LTRIM$(RTRIM$(avs(v)))
            IF rest <> "" THEN PRINT #f, "Avisos:"
            DO WHILE rest <> ""
                p = INSTR(rest, ". ")
                IF p = 0 THEN p = LEN(rest)
                PRINT #f, "  "; LEFT$(rest, p)
                rest = LTRIM$(MID$(rest, p + 1))
            LOOP
        END IF
    NEXT
    CLOSE #f
    TelaStatus "Relatorio gravado em " + arq
END SUB

' Desenha o esquema da viga v (tramos, apoios, vaos e diagrama de momentos
' da envoltoria) em <obra>_<viga>.VET, ESCALA 1/50, e mostra na tela.
SUB VigDesenho (v AS INTEGER)
    DIM f AS INTEGER, t AS INTEGER, ti AS INTEGER, x0 AS DOUBLE, L AS DOUBLE, esc AS DOUBLE
    DIM mmax AS DOUBLE, fm AS DOUBLE, arq AS STRING, r AS INTEGER, k AS INTEGER, ap AS INTEGER
    esc = 20#   ' mm de papel por metro
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        IF VigTra(ti).mPos > mmax THEN mmax = VigTra(ti).mPos
        IF -VigTra(ti).mNegEsq > mmax THEN mmax = -VigTra(ti).mNegEsq
        IF -VigTra(ti).mNegDir > mmax THEN mmax = -VigTra(ti).mNegDir
    NEXT
    IF mmax > 0 THEN fm = 30# / mmax
    arq = DirDados + VigObra$ + "_" + RTRIM$(Vig(v).nome) + ".VET"
    f = VetAbre%(arq, "OBRA - " + VigObra$ + "   VIGA - " + RTRIM$(Vig(v).nome))
    VetTexto f, 0, 60, 3.5, 0, 5, "OBRA - " + VigObra$ + "   VIGA - " + RTRIM$(Vig(v).nome) + "   ESCALA 1/50"
    x0 = 0
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t): L = VigTra(ti).vao * esc
        VetLinha f, x0, 0, x0 + L, 0, 1
        VetLinha f, x0, -8, x0 + L, -8, 3
        VetTexto f, x0 + L / 2 - 4, -13, 2.5, 0, 3, LTRIM$(STR$(VigTra(ti).vao))
        ' diagrama simplificado da envoltoria: negativos nos apoios, positivo no meio
        VetLinha f, x0, -VigTra(ti).mNegEsq * fm, x0 + L / 2, -VigTra(ti).mPos * fm, 2
        VetLinha f, x0 + L / 2, -VigTra(ti).mPos * fm, x0 + L, -VigTra(ti).mNegDir * fm, 2
        VetTexto f, x0 + L / 2, -VigTra(ti).mPos * fm - 4, 2, 0, 2, FormataNumero$(VigTra(ti).mPos, 2, 6)
        x0 = x0 + L
    NEXT
    x0 = 0
    FOR k = 1 TO Vig(v).nTramos + 1
        ap = VigApoio%(v, k)
        IF RTRIM$(VigApo(ap).nome) <> "-" THEN
            VetLinha f, x0, 0, x0 - 2, -4, 1: VetLinha f, x0, 0, x0 + 2, -4, 1: VetLinha f, x0 - 2, -4, x0 + 2, -4, 1
            VetTexto f, x0 - 2, 4, 2, 0, 3, RTRIM$(VigApo(ap).nome)
        END IF
        IF k <= Vig(v).nTramos THEN x0 = x0 + VigTra(VigTramo%(v, k)).vao * esc
    NEXT
    VetFecha f
    r = VetMostra%(arq)
    TelaStatus "Desenho gravado em " + arq
END SUB

' Conta as vigas de um .VIG e devolve os nomes em nomes$ (separados por espaco).
' Le o arquivo direto, sem tocar na memoria. -1 se nao existe ou o cabecalho
' nao e SISTRUT40/VIG. Ordem dos campos: ver VigGrava em SISDADOS.BM.
FUNCTION VigContaArq% (arq AS STRING, nomes AS STRING)
    DIM s1 AS STRING, s2 AS STRING, s3 AS STRING
    DIM d AS DOUBLE, e AS DOUBLE, q AS DOUBLE
    DIM n AS INTEGER, nt AS INTEGER, nc AS INTEGER
    DIM v AS INTEGER, k AS INTEGER, j AS INTEGER, f AS INTEGER
    nomes = ""
    IF NOT _FILEEXISTS(arq) THEN VigContaArq% = -1: EXIT FUNCTION
    f = FREEFILE
    OPEN arq FOR INPUT AS #f
    INPUT #f, s1, s2, d, s3                 ' cabecalho: "SISTRUT40","VIG",versao,"obra"
    IF s1 <> "SISTRUT40" OR s2 <> "VIG" THEN CLOSE #f: VigContaArq% = -1: EXIT FUNCTION
    INPUT #f, d, n                          ' nivel, numero de vigas
    FOR v = 1 TO n
        INPUT #f, s1, nt, d, e              ' nome, nTramos, bw, h
        nomes = nomes + RTRIM$(s1) + " "
        FOR k = 0 TO nt                     ' apoios: nTramos+1 linhas
            INPUT #f, s2, d, e
        NEXT
        FOR k = 1 TO nt                     ' tramos: vao, qPerm, qAcid, nConc
            INPUT #f, d, e, q, nc
            FOR j = 1 TO nc                 ' cargas concentradas: a, P
                INPUT #f, d, e
            NEXT
        NEXT
    NEXT
    CLOSE #f
    VigContaArq% = n
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: 'ARMCALC.BM'
'$INCLUDE: 'VIGCALC.BM'
'$INCLUDE: 'VIGFAIXA.BM'
