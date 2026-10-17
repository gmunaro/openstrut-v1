' ===============================================================
' DESDIM.BAS - detalhamento e desenho de vigas continuas (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: dump de strings do DESDIM.EXE (fora do repositorio) (textos das telas).
' Entrada: <dirDados><obra>.SEC (vigas e tramos) e DESENHO.INI (dirDados).
' Saida: <dirDados><obra>.SEC regravado quando o usuario confirma.
' Compilacao: tools/build.sh desenho/DESDIM
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Materiais e coeficientes lidos do ARMADURA.INI (DimCarregaMateriais%), em tf e cm.
' dimRhoW = taxa minima de estribos rho_w,min (CcaRhoWMin#, NB-1/78).
DIM SHARED dimFck AS DOUBLE, dimFcd AS DOUBLE, dimFyd AS DOUBLE, dimGf AS DOUBLE, dimRhoW AS DOUBLE
' Motivo do ultimo calculo que falhou (texto de tela do dump).
DIM SHARED dimMsg AS STRING
CONST DIM_DESC_FCK = "RESISTENCIA CARACTERISTICA DO CONCRETO - Fck"
CONST DIM_DESC_FYK = "RESISTENCIA CATACTERISTICA DO ACO - Fyk"
CONST DIM_DESC_MULT_GRANDEZA = "COEFICIENTE MULTIPLICADOR DA UNIDADE DE Fck E Fyk PARA TRANSFORMAR EM T/C2"
CONST DIM_DESC_ACO = "TIPO DE ACO (A/B)"
CONST DIM_DESC_CS_FORCA = "COEFICIENTE DE SEGURANCA DOS ESFORCOS"
CONST DIM_DESC_CS_CONC = "COEFICIENTE DE SEGURANCA DO CONCRETO"
CONST DIM_DESC_CS_ACO = "COEFICIENTE DE SEGURANCA DO ACO"
CONST DIM_COBR = 4                 ' d = h - 4
CONST DIM_PHI_MIN = 10#            ' barras longitudinais: bitola minima (mm)
CONST DIM_N_MIN = 2                ' barras longitudinais: quantidade minima
CONST DIM_N_MAX = 8                ' barras longitudinais: quantidade maxima
CONST DIM_EST_PHI_MIN = 5#         ' estribo: bitola minima (mm)
CONST DIM_EST_S_MIN = 7#           ' estribo: espacamento minimo (cm)
CONST DIM_EST_S_MAX = 30#          ' estribo: espacamento maximo (cm), limitado a 0.5d
CONST DIM_MAX_LISTA = 64           ' vigas listadas na tela (4 colunas de 16 linhas)
CONST DIM_DL = 3.5#                ' armadura dupla: barra comprimida a 3.5 cm da face (cm); igual a ARM_DL do ARMADURA.BAS

DECLARE SUB DimPausa (msg AS STRING)
DECLARE SUB DimErro (msg AS STRING)
DECLARE FUNCTION DimTecla$ ()
DECLARE FUNCTION DimNum$ (valor AS DOUBLE, larg AS INTEGER)
DECLARE FUNCTION DimMd# (mk AS DOUBLE)
DECLARE FUNCTION DimBitolaOk% (phi AS DOUBLE)
DECLARE FUNCTION DimAcha% (nome AS STRING)
DECLARE SUB DimFim
DECLARE FUNCTION DimIniValor$ (desc AS STRING)
DECLARE FUNCTION DimCarregaMateriais% ()
DECLARE FUNCTION CcaLinhaNeutra# (md AS DOUBLE, b AS DOUBLE, d AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE)
DECLARE FUNCTION CcaAsFlexao# (md AS DOUBLE, b AS DOUBLE, d AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE)
DECLARE FUNCTION CcaAsMin# (b AS DOUBLE, h AS DOUBLE, taxa AS DOUBLE)
DECLARE FUNCTION CcaAswEstriboRho# (vd AS DOUBLE, bw AS DOUBLE, d AS DOUBLE, fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, asl AS DOUBLE)
DECLARE FUNCTION CcaAswMin# (bw AS DOUBLE, taxa AS DOUBLE)
DECLARE FUNCTION CcaAreaBarra# (phi AS DOUBLE)
DECLARE FUNCTION CcaMdLim# (b AS DOUBLE, d AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE)
DECLARE FUNCTION CcaXdLim# (fyd AS DOUBLE)
DECLARE FUNCTION ArmAsDupla# (md AS DOUBLE, bw AS DOUBLE, d AS DOUBLE, dl AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE)
DECLARE FUNCTION ArmAsLinha# (md AS DOUBLE, bw AS DOUBLE, d AS DOUBLE, dl AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE)
DECLARE FUNCTION ArmAsMax# (bw AS DOUBLE, h AS DOUBLE)
DECLARE FUNCTION CcaRhoWMin# (fyk AS DOUBLE)
DECLARE FUNCTION CcaAcoClasse% (novo AS INTEGER)
DECLARE SUB CcaEscolheMalha (asm AS DOUBLE, phiMin AS DOUBLE, sMin AS DOUBLE, sMax AS DOUBLE, phi AS DOUBLE, s AS DOUBLE)
DECLARE SUB CcaEscolheBarrasBw (asReq AS DOUBLE, bw AS DOUBLE, cobLat AS DOUBLE, phi AS DOUBLE, n AS INTEGER, cabe AS INTEGER)

' Mostra msg na linha de status e espera ENTER ou ESC.
SUB DimPausa (msg AS STRING)
    DIM k AS STRING
    TelaStatus(msg)
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mostra o erro na tela e espera ESC ou ENTER.
SUB DimErro (msg AS STRING)
    TelaErro(msg)
    DimPausa("Acione ESC <Enter> para Continuar ")
END SUB

' Espera uma tecla e devolve em maiusculas.
FUNCTION DimTecla$
    DIM k AS STRING
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    DimTecla$ = k
END FUNCTION

' Formata valor com 2 casas na largura larg, para as telas de tramo.
FUNCTION DimNum$ (valor AS DOUBLE, larg AS INTEGER)
    DimNum$ = FormataNumero$(valor, 2, larg)
END FUNCTION

' Momento de calculo (tf.cm) a partir de Mk (tf.m): gf x |Mk| x 100, gf do ARMADURA.INI.
FUNCTION DimMd# (mk AS DOUBLE)
    DimMd# = dimGf * ABS(mk) * 100#
END FUNCTION

' Retorna -1 se phi e uma bitola padronizada (mm), 0 se nao.
FUNCTION DimBitolaOk% (phi AS DOUBLE)
    DimBitolaOk% = 0
    SELECT CASE phi
        CASE 5#, 6.3#, 8#, 10#, 12.5#, 16#, 20#, 25#, 32#
            DimBitolaOk% = -1
    END SELECT
END FUNCTION

' Acha a viga cujo nome, sem caixa nem espacos nas pontas, bate com nome. 0 = nao achou.
FUNCTION DimAcha% (nome AS STRING)
    DIM n AS STRING, v AS INTEGER
    n = UCASE$(LTRIM$(RTRIM$(nome)))
    DimAcha% = 0
    FOR v = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(v).nome)) = n THEN
            DimAcha% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Encerra o modulo com a mensagem do dump.
SUB DimFim
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

' Valor (depois do "=") da linha do ARMADURA.INI cuja descricao bate com desc; "" se nao acha.
FUNCTION DimIniValor$ (desc AS STRING)
    DIM n AS INTEGER
    DimIniValor$ = ""
    FOR n = 1 TO ArqQtd
        IF IniDesc$(n) = desc THEN DimIniValor$ = IniValor$(n): EXIT FUNCTION
    NEXT
END FUNCTION

' Le o ARMADURA.INI da pasta de execucao e carrega os materiais (mesma regra do ARMADURA.BAS):
' Fck e Fyk vezes o multiplicador, classe do aco (CcaAcoClasse%) pelo TIPO DE ACO e
' rho_w,min pelo Fyk. A linha TAXA DE ARMADURA LONGITUDINAL TRACIONADA e o rho1 do
' psi1; o psi1 usa a armadura tracionada real (CcaAswEstriboRho#), entao ela nao e lida.
' Devolve 0 se o arquivo nao existe ou algum valor e invalido.
FUNCTION DimCarregaMateriais%
    DIM mult AS DOUBLE, fyk AS DOUBLE, csC AS DOUBLE, csA AS DOUBLE, classe AS INTEGER
    DimCarregaMateriais% = 0
    IF ArqLer%(ComumDirExec$ + "ARMADURA.INI") < 0 THEN EXIT FUNCTION
    mult = VAL(DimIniValor$(DIM_DESC_MULT_GRANDEZA))
    dimFck = VAL(DimIniValor$(DIM_DESC_FCK)) * mult
    fyk = VAL(DimIniValor$(DIM_DESC_FYK)) * mult
    csC = VAL(DimIniValor$(DIM_DESC_CS_CONC))
    csA = VAL(DimIniValor$(DIM_DESC_CS_ACO))
    dimGf = VAL(DimIniValor$(DIM_DESC_CS_FORCA))
    IF dimFck <= 0 OR fyk <= 0 OR csC <= 0 OR csA <= 0 OR dimGf <= 0 THEN EXIT FUNCTION
    dimRhoW = CcaRhoWMin#(fyk)
    IF UCASE$(LTRIM$(RTRIM$(DimIniValor$(DIM_DESC_ACO)))) = "B" THEN classe = CcaAcoClasse%(1) ELSE classe = CcaAcoClasse%(0)
    dimFcd = dimFck / csC
    dimFyd = fyk / csA
    DimCarregaMateriais% = -1
END FUNCTION

' ---- lista, tela por tramo e programa principal ----
DIM SHARED dimArq AS STRING, dimObra AS STRING

DECLARE SUB DimCelula (lin AS INTEGER, col AS INTEGER, txt AS STRING)
DECLARE FUNCTION DimEscolheViga% ()
DECLARE FUNCTION DimBarra$ (n AS INTEGER, phi AS DOUBLE)
DECLARE FUNCTION DimXdTxt$ (mk AS DOUBLE, b AS DOUBLE, d AS DOUBLE)
DECLARE SUB DimMostraTramo (v AS INTEGER, t AS INTEGER)
DECLARE SUB DimNavegaTramos (v AS INTEGER)
DECLARE SUB DimPrompt (lin AS INTEGER, txt AS STRING)
DECLARE FUNCTION DimPedeNum# (lin AS INTEGER, txt AS STRING, padrao AS DOUBLE)
DECLARE FUNCTION DimFlexao% (mk AS DOUBLE, b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, asMin AS DOUBLE, asOut AS DOUBLE, phi AS DOUBLE, n AS INTEGER)
DECLARE FUNCTION DimAswLado# (vk AS DOUBLE, b AS DOUBLE, d AS DOUBLE, asl AS DOUBLE)
DECLARE FUNCTION DimCalculaTramo% (v AS INTEGER, t AS INTEGER)
DECLARE FUNCTION DimCalculaViga% (v AS INTEGER)
DECLARE SUB DimAlteraBase (v AS INTEGER)
DECLARE SUB DimAlteraTramo (v AS INTEGER)
DECLARE FUNCTION DimAsComp# (mk AS DOUBLE, b AS DOUBLE, d AS DOUBLE)
DECLARE FUNCTION DimMomentoAlto% (v AS INTEGER)
DECLARE SUB DimVoltaBase (v AS INTEGER, bOld AS DOUBLE, hOld AS DOUBLE, dOld AS DOUBLE)

' Escreve txt na linha lin e coluna col da tela.
SUB DimCelula (lin AS INTEGER, col AS INTEGER, txt AS STRING)
    LOCATE lin, col
    PRINT txt;
END SUB

' Lista as vigas do .SEC (ate DIM_MAX_LISTA) e pede o nome de uma. Devolve o indice ou 0.
FUNCTION DimEscolheViga%
    DIM v AS INTEGER, nome AS STRING
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 3: PRINT "OBRA - "; dimObra
    FOR v = 1 TO VigQtd
        IF v > DIM_MAX_LISTA THEN EXIT FOR
        LOCATE 4 + ((v - 1) MOD 16), 3 + ((v - 1) \ 16) * 19
        PRINT RTRIM$(Vig(v).nome)
    NEXT
    LOCATE 22, 3: PRINT "VIGA - ";
    nome = EntradaTexto$(22, 11, 8, "")
    DimEscolheViga% = DimAcha%(nome)
END FUNCTION

' Texto de barras adotadas, ex.: "4 x 12.5mm".
FUNCTION DimBarra$ (n AS INTEGER, phi AS DOUBLE)
    DimBarra$ = LTRIM$(STR$(n)) + " x " + LTRIM$(STR$(phi)) + "mm"
END FUNCTION

' As' comprimida (cm2) da secao com momento mk (tf.m); 0 quando a armadura simples basta.
FUNCTION DimAsComp# (mk AS DOUBLE, b AS DOUBLE, d AS DOUBLE)
    DIM md AS DOUBLE
    DimAsComp# = 0
    md = DimMd#(mk)
    IF CcaAsFlexao#(md, b, d, dimFcd, dimFyd) < 0 THEN
        DimAsComp# = ArmAsLinha#(md, b, d, DIM_DL, dimFcd, dimFyd)
    END IF
END FUNCTION

' x/d do momento mk (tf.m) na secao b x d. Com armadura dupla a linha neutra fica no limite (CcaXdLim#).
FUNCTION DimXdTxt$ (mk AS DOUBLE, b AS DOUBLE, d AS DOUBLE)
    DIM x AS DOUBLE
    x = CcaLinhaNeutra#(DimMd#(mk), b, d, dimFcd, dimFyd)
    IF x < 0 THEN
        DimXdTxt$ = DimNum$(CcaXdLim#(dimFyd), 9)
        EXIT FUNCTION
    END IF
    DimXdTxt$ = DimNum$(x / d, 9)
END FUNCTION

' Tela de um tramo: Mk, x/d, Ast, Asc, barras e cortante/estribo das extremidades.
' RECONSTRUCAO: os cabecalhos Positivo/Neg. esq./Neg. dir. nao vem do dump (que usa telas APOIO e TRAMO).
' RECONSTRUCAO: flecha(cm) nao e mostrada; o .SEC nao traz dado de flecha.
' Asc so aparece na tela: o .SEC (TTramo) nao tem campo para a armadura comprimida.
SUB DimMostraTramo (v AS INTEGER, t AS INTEGER)
    DIM ti AS INTEGER, b AS DOUBLE, d AS DOUBLE
    ti = VigTramo%(v, t)
    b = Vig(v).bw
    d = Vig(v).d
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 3: PRINT "OBRA - "; dimObra; "   VIGA - "; RTRIM$(Vig(v).nome); "   TRAMO "; t; " de "; Vig(v).nTramos
    LOCATE 3, 3: PRINT "Bw (cm) "; DimNum$(b, 8); "  Hw (cm) "; DimNum$(Vig(v).h, 8); "  d (cm) "; DimNum$(d, 8); "  vao (m) "; DimNum$(VigTra(ti).vao, 8)
    DimCelula 5, 22, "Positivo"
    DimCelula 5, 36, "Neg. esq."
    DimCelula 5, 50, "Neg. dir."
    DimCelula 6, 3, "Mk"
    DimCelula 6, 22, DimNum$(VigTra(ti).mPos, 10)
    DimCelula 6, 36, DimNum$(VigTra(ti).mNegEsq, 10)
    DimCelula 6, 50, DimNum$(VigTra(ti).mNegDir, 10)
    DimCelula 7, 3, "x/d"
    DimCelula 7, 22, DimXdTxt$(VigTra(ti).mPos, b, d)
    DimCelula 7, 36, DimXdTxt$(VigTra(ti).mNegEsq, b, d)
    DimCelula 7, 50, DimXdTxt$(VigTra(ti).mNegDir, b, d)
    DimCelula 8, 3, "Ast"
    DimCelula 8, 22, DimNum$(VigTra(ti).asPos, 10)
    DimCelula 8, 36, DimNum$(VigTra(ti).asNegEsq, 10)
    DimCelula 8, 50, DimNum$(VigTra(ti).asNegDir, 10)
    DimCelula 9, 3, "Asc"
    DimCelula 9, 22, DimNum$(DimAsComp#(VigTra(ti).mPos, b, d), 10)
    DimCelula 9, 36, DimNum$(DimAsComp#(VigTra(ti).mNegEsq, b, d), 10)
    DimCelula 9, 50, DimNum$(DimAsComp#(VigTra(ti).mNegDir, b, d), 10)
    DimCelula 10, 3, "Barras"
    DimCelula 10, 22, DimBarra$(VigTra(ti).nPos, VigTra(ti).phiPos)
    DimCelula 10, 36, DimBarra$(VigTra(ti).nNegEsq, VigTra(ti).phiNegEsq)
    DimCelula 10, 50, DimBarra$(VigTra(ti).nNegDir, VigTra(ti).phiNegDir)
    DimCelula 12, 3, "Vke"
    DimCelula 12, 22, DimNum$(VigTra(ti).vEsq, 10)
    DimCelula 13, 3, "Aee"
    DimCelula 13, 22, DimNum$(VigTra(ti).aswEsq, 10)
    DimCelula 14, 3, "Vkd"
    DimCelula 14, 22, DimNum$(VigTra(ti).vDir, 10)
    DimCelula 15, 3, "Aed"
    DimCelula 15, 22, DimNum$(VigTra(ti).aswDir, 10)
    DimCelula 16, 3, "Estribo"
    DimCelula 16, 22, LTRIM$(STR$(VigTra(ti).phiEst)) + " mm c/" + DimNum$(VigTra(ti).sEst, 8) + " cm"
END SUB

' Mostra os tramos da viga, um por tela; ESC volta a lista de vigas.
' Limpa a linha lin e escreve txt na coluna 3.
SUB DimPrompt (lin AS INTEGER, txt AS STRING)
    LOCATE lin, 1: PRINT SPACE$(79);
    LOCATE lin, 3: PRINT txt;
END SUB

' Pede um numero na linha lin, com txt como rotulo. Enter sem valor devolve padrao.
FUNCTION DimPedeNum# (lin AS INTEGER, txt AS STRING, padrao AS DOUBLE)
    DimPrompt lin, txt
    DimPedeNum# = EntradaNumero#(lin, 3 + LEN(txt), 8, padrao)
END FUNCTION

' Armadura de flexao de uma secao com momento mk (tf.m). Devolve 0 se falhar e dimMsg diz o motivo.
' Armadura dupla (CcaAsFlexao# = -1): asOut e a As tracionada total de ArmAsDupla#; a As' sai de DimAsComp#.
' asOut recebe a area pedida (maior entre a calculada e a minima), phi/n a bitola e a quantidade.
' As + As' acima de 4% de b*h (ArmAsMax#) e secao insuficiente, como em VIGCALC e ARMADURA.
FUNCTION DimFlexao% (mk AS DOUBLE, b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, asMin AS DOUBLE, asOut AS DOUBLE, phi AS DOUBLE, n AS INTEGER)
    DIM md AS DOUBLE, asCalc AS DOUBLE, asReq AS DOUBLE, cabe AS INTEGER, asl AS DOUBLE
    md = DimMd#(mk)
    asCalc = CcaAsFlexao#(md, b, d, dimFcd, dimFyd)
    IF asCalc < 0 THEN
        asCalc = ArmAsDupla#(md, b, d, DIM_DL, dimFcd, dimFyd)
        asl = ArmAsLinha#(md, b, d, DIM_DL, dimFcd, dimFyd)
        IF asl < 0 THEN asCalc = -1
        IF asCalc + asl > ArmAsMax#(b, h) THEN asCalc = -1
    END IF
    IF asCalc < 0 THEN
        dimMsg = "ARMADURA INSUFICIENTE"
        DimFlexao% = 0
        EXIT FUNCTION
    END IF
    asReq = asCalc
    IF asReq < asMin THEN asReq = asMin
    asOut = asReq
    CcaEscolheBarrasBw asReq, b, 2#, phi, n, cabe
    IF cabe = -1 THEN
        dimMsg = "armadura acima de 8 barras de 32 mm, aumente a secao"
        DimFlexao% = 0
        EXIT FUNCTION
    END IF
    ' cabe = 0: nao cabe em uma camada; a menor quantidade foi escolhida e o aviso fica em dimMsg
    IF cabe = 0 THEN dimMsg = "barras nao cabem em uma camada"
    DimFlexao% = -1
END FUNCTION

' Asw (cm2/m) de um lado do tramo para o cortante vk (tf) e a As tracionada asl (cm2)
' da secao. Devolve -1 se a biela esmagar.
FUNCTION DimAswLado# (vk AS DOUBLE, b AS DOUBLE, d AS DOUBLE, asl AS DOUBLE)
    DIM r AS DOUBLE, minimo AS DOUBLE
    r = CcaAswEstriboRho#(dimGf * ABS(vk), b, d, dimFck, dimFcd, dimFyd, asl)
    IF r < 0 THEN
        DimAswLado# = -1
        EXIT FUNCTION
    END IF
    minimo = CcaAswMin#(b, dimRhoW)
    IF r < minimo THEN r = minimo
    DimAswLado# = r
END FUNCTION

' Calcula flexao e estribo do tramo t da viga v e grava nos campos do tramo.
' Devolve 0 se falhar; nesse caso os campos do tramo nao sao alterados.
FUNCTION DimCalculaTramo% (v AS INTEGER, t AS INTEGER)
    DIM ti AS INTEGER, b AS DOUBLE, h AS DOUBLE, d AS DOUBLE, asMin AS DOUBLE
    DIM asP AS DOUBLE, asE AS DOUBLE, asD AS DOUBLE
    DIM phiP AS DOUBLE, phiE AS DOUBLE, phiD AS DOUBLE
    DIM nP AS INTEGER, nE AS INTEGER, nD AS INTEGER
    DIM aswE AS DOUBLE, aswD AS DOUBLE, asw AS DOUBLE
    DIM phiEs AS DOUBLE, sEs AS DOUBLE, sMax AS DOUBLE

    ti = VigTramo%(v, t)
    b = Vig(v).bw
    h = Vig(v).h
    d = Vig(v).d
    asMin = CcaAsMin#(b, h, 0.0015#)   ' 0,15% como VIGCALC e ARMADURA

    asP = 0: phiP = 0: nP = 0
    IF VigTra(ti).mPos > 0 THEN
        IF DimFlexao%(VigTra(ti).mPos, b, h, d, asMin, asP, phiP, nP) = 0 THEN
            DimCalculaTramo% = 0
            EXIT FUNCTION
        END IF
    END IF

    asE = 0: phiE = 0: nE = 0
    IF VigTra(ti).mNegEsq < 0 THEN
        IF DimFlexao%(VigTra(ti).mNegEsq, b, h, d, asMin, asE, phiE, nE) = 0 THEN
            DimCalculaTramo% = 0
            EXIT FUNCTION
        END IF
    END IF

    asD = 0: phiD = 0: nD = 0
    IF VigTra(ti).mNegDir < 0 THEN
        IF DimFlexao%(VigTra(ti).mNegDir, b, h, d, asMin, asD, phiD, nD) = 0 THEN
            DimCalculaTramo% = 0
            EXIT FUNCTION
        END IF
    END IF

    aswE = DimAswLado#(VigTra(ti).vEsq, b, d, asE)
    aswD = DimAswLado#(VigTra(ti).vDir, b, d, asD)
    IF aswE < 0 OR aswD < 0 THEN
        dimMsg = "Tensao de Cisalhamento acima do Limite."
        DimCalculaTramo% = 0
        EXIT FUNCTION
    END IF

    asw = aswE
    IF aswD > asw THEN asw = aswD
    sMax = DIM_EST_S_MAX
    IF 0.5 * d < sMax THEN sMax = 0.5 * d
    CcaEscolheMalha asw / 2, DIM_EST_PHI_MIN, DIM_EST_S_MIN, sMax, phiEs, sEs

    VigTra(ti).asPos = asP
    VigTra(ti).asNegEsq = asE
    VigTra(ti).asNegDir = asD
    VigTra(ti).phiPos = phiP
    VigTra(ti).nPos = nP
    VigTra(ti).phiNegEsq = phiE
    VigTra(ti).nNegEsq = nE
    VigTra(ti).phiNegDir = phiD
    VigTra(ti).nNegDir = nD
    VigTra(ti).aswEsq = aswE
    VigTra(ti).aswDir = aswD
    VigTra(ti).phiEst = phiEs
    VigTra(ti).sEst = sEs
    DimCalculaTramo% = -1
END FUNCTION

' Recalcula todos os tramos da viga v. Devolve 0 no primeiro tramo que falhar.
FUNCTION DimCalculaViga% (v AS INTEGER)
    DIM t AS INTEGER
    FOR t = 1 TO Vig(v).nTramos
        IF DimCalculaTramo%(v, t) = 0 THEN
            DimCalculaViga% = 0
            EXIT FUNCTION
        END IF
    NEXT
    DimCalculaViga% = -1
END FUNCTION

' Restaura bw, h e d da viga v aos valores antigos e recalcula os tramos com eles.
' Os valores antigos ja tinham passado no calculo, entao o resultado do recalculo nao e conferido.
SUB DimVoltaBase (v AS INTEGER, bOld AS DOUBLE, hOld AS DOUBLE, dOld AS DOUBLE)
    DIM ok AS INTEGER
    Vig(v).bw = bOld
    Vig(v).h = hOld
    Vig(v).d = dOld
    ok = DimCalculaViga%(v)
END SUB

' Devolve -1 se algum momento de tramo passa de 40% do momento limite da armadura simples (CcaMdLim#).
FUNCTION DimMomentoAlto% (v AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, lim AS DOUBLE
    lim = 0.4 * CcaMdLim#(Vig(v).bw, Vig(v).d, dimFcd, dimFyd)
    DimMomentoAlto% = 0
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        IF DimMd#(VigTra(ti).mPos) > lim OR DimMd#(VigTra(ti).mNegEsq) > lim OR DimMd#(VigTra(ti).mNegDir) > lim THEN
            DimMomentoAlto% = -1
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Tecla B: altera bw e h da viga, d = h - DIM_COBR, e recalcula. Falha ou resposta N restaura os valores antigos.
' Momento acima de 40% do limite avisa e pede confirmacao; so grava o .SEC quando o calculo passa e o usuario confirma.
SUB DimAlteraBase (v AS INTEGER)
    DIM bOld AS DOUBLE, hOld AS DOUBLE, dOld AS DOUBLE, bNew AS DOUBLE, hNew AS DOUBLE, msg AS STRING
    bOld = Vig(v).bw
    hOld = Vig(v).h
    dOld = Vig(v).d
    bNew = DimPedeNum#(23, "Bw (cm) ", bOld)
    hNew = DimPedeNum#(23, "Hw (cm) ", hOld)
    IF bNew <= 0 OR hNew <= DIM_COBR THEN
        DimErro "verifique a consistencia dos seus dados"
        EXIT SUB
    END IF

    Vig(v).bw = bNew
    Vig(v).h = hNew
    Vig(v).d = hNew - DIM_COBR
    IF DimCalculaViga%(v) = 0 THEN
        msg = dimMsg
        DimVoltaBase v, bOld, hOld, dOld
        DimErro msg
        EXIT SUB
    END IF
    IF DimMomentoAlto%(v) <> 0 THEN
        DimErro "Momento Aplicado acima de 40% do Momento Limite da Armadura simples."
        DimPrompt 23, "Continuo com o processamento desta Viga  S/*N* "
        IF DimTecla$ <> "S" THEN
            DimVoltaBase v, bOld, hOld, dOld
            EXIT SUB
        END IF
    END IF
    VigGrava dimArq, "SEC"
END SUB

' Tecla A + S: troca bitola e quantidade de um tramo. Recusa area menor que a calculada.
SUB DimAlteraTramo (v AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, reg AS STRING, phi AS DOUBLE, n AS INTEGER
    DIM asReq AS DOUBLE, area AS DOUBLE
    t = INT(DimPedeNum#(23, "Numero do Tramo *FIM* ", 0))
    IF t = 0 THEN EXIT SUB
    IF t < 1 OR t > Vig(v).nTramos THEN
        DimErro "verifique a consistencia dos seus dados"
        EXIT SUB
    END IF
    ti = VigTramo%(v, t)

    ' RECONSTRUCAO: o dump nao traz o texto que pede a regiao (P/E/D).
    DimPrompt 23, "Regiao P/E/D "
    reg = UCASE$(EntradaTexto$(23, 16, 1, ""))
    IF reg <> "P" AND reg <> "E" AND reg <> "D" THEN
        DimErro "verifique a consistencia dos seus dados"
        EXIT SUB
    END IF

    phi = DimPedeNum#(23, "Bitola (mm) ", 0)
    IF DimBitolaOk%(phi) = 0 THEN
        DimErro "BITOLA NAO PADRONIZADA"
        EXIT SUB
    END IF

    n = INT(DimPedeNum#(23, "Quantidade ", 0))
    IF n < 1 THEN
        DimErro "Numero de Barras  *NECESSARIO*"
        EXIT SUB
    END IF

    asReq = 0
    IF reg = "P" THEN asReq = VigTra(ti).asPos
    IF reg = "E" THEN asReq = VigTra(ti).asNegEsq
    IF reg = "D" THEN asReq = VigTra(ti).asNegDir
    area = n * CcaAreaBarra#(phi)
    IF area < asReq THEN
        DimErro "ARMADURA INSUFICIENTE"
        EXIT SUB
    END IF

    IF reg = "P" THEN
        VigTra(ti).phiPos = phi
        VigTra(ti).nPos = n
    END IF
    IF reg = "E" THEN
        VigTra(ti).phiNegEsq = phi
        VigTra(ti).nNegEsq = n
    END IF
    IF reg = "D" THEN
        VigTra(ti).phiNegDir = phi
        VigTra(ti).nNegDir = n
    END IF
    VigGrava dimArq, "SEC"
    DimMostraTramo v, t
END SUB

' Mostra os tramos da viga v. A/B alteram armadura e base; ESC volta.
SUB DimNavegaTramos (v AS INTEGER)
    DIM t AS INTEGER, k AS STRING, k2 AS STRING
    t = 1
    DO
        DimMostraTramo v, t
        LOCATE 22, 3: PRINT "Continua ...";
        k = DimTecla$
        SELECT CASE k
            CASE CHR$(27)
                EXIT DO
            CASE "A"
                DimPrompt 23, "Modifico as Armaduras N/*S* "
                k2 = DimTecla$
                IF k2 = "S" THEN DimAlteraTramo v
            CASE "B"
                DimAlteraBase v
                DimMostraTramo v, t
            CASE ELSE
                t = t + 1
                IF t > Vig(v).nTramos THEN EXIT DO
        END SELECT
    LOOP
END SUB

' ---- programa principal ----
DIM v AS INTEGER, dirDados AS STRING
ComumDirExecDefine _CWD$
IF ArqLer%("DESENHO.INI") < 0 THEN
    DimErro("erro no processamento")
    DimFim
END IF
dirDados = IniDirDados$
dimObra = ObraAtual$(dirDados)
dimArq = dirDados + dimObra + ".SEC"
IF DimCarregaMateriais% = 0 THEN
    DimErro("verifique a consistencia dos seus dados")
    DimFim
END IF
IF VigLe%(dimArq, "SEC") = 0 THEN
    DimErro(DadErro)
    DimFim
END IF
IF VigQtd = 0 THEN
    DimErro("verifique a consistencia dos seus dados")
    DimFim
END IF
DO
    v = DimEscolheViga%
    IF v = 0 THEN EXIT DO
    DimNavegaTramos v
LOOP
DimFim

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../viga/ARMCALC.BM'
