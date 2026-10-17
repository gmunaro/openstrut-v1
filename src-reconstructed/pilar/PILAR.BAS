' ===============================================================
' PILAR.BAS - dimensionamento e verificacao de pilares de concreto
' armado (SISTRUT 4.0), NB-1/78.
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Unidades: tf, cm, tf/cm2.
' Fontes: docs/modules/PILAR.md, dump de strings do PILAR.EXE (fora do repositorio),
' sistrut-game/PILAR.INI. Calculo: pilar/PILCALC.BM e common/CALCCA.BM.
' Compilacao: tools/build.sh pilar/PILAR.BAS
' Arquivos gerados (formatos NAO confirmados no original):
'   <obra>.PSC        secoes arquivadas, uma linha por posicao ocupada.
'   <obra>_PILAR.LST  relatorio do processamento (opcao 2) e da verificacao (opcao 6).
'   <obra>_VERIF.VET  desenho da secao verificada (formato SISPLOT.BM).
' Verificacao de licenca do original nao reimplementada.
' ===============================================================
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST MAXSEC = 20
CONST MAXBIT = 13

TYPE Secao
    b AS DOUBLE
    h AS DOUBLE
    dl AS DOUBLE
    di AS DOUBLE
    df AS DOUBLE
    nSup AS INTEGER
    nInf AS INTEGER
    nLat AS INTEGER
    bit AS INTEGER
    nk AS DOUBLE
    mxk AS DOUBLE
    myk AS DOUBLE
    lxe AS DOUBLE
    lye AS DOUBLE
END TYPE

' Resultado de AnaliseSecao. situ: 1 flexo-tracao, 2 flexao obliqua,
' 3 flexo-compressao, 4 compressao centrada. Forcas em tf, momentos em tf.cm.
' asSup/asInf: barras das bordas; asLat: barras de UM lado; asTotal: todas.
' asNorma: As minima da NB-1/78 (0,8% ou 0,5% de Ac). xln/xlny: linha neutra (cm) nas
' direcoes x e y; dx/dy: profundidade da barra mais afastada. aviso: limite violado.
TYPE Resultado
    lamx AS DOUBLE
    lamy AS DOUBLE
    nd AS DOUBLE
    eax AS DOUBLE
    eay AS DOUBLE
    e2x AS DOUBLE
    e2y AS DOUBLE
    mxd AS DOUBLE
    myd AS DOUBLE
    asInf AS DOUBLE
    asSup AS DOUBLE
    asLat AS DOUBLE
    asTotal AS DOUBLE
    asNorma AS DOUBLE
    nmax AS DOUBLE
    mrx AS DOUBLE
    mry AS DOUBLE
    indice AS DOUBLE
    xln AS DOUBLE
    xlny AS DOUBLE
    dx AS DOUBLE
    dy AS DOUBLE
    situ AS INTEGER
    ok AS INTEGER
    aviso AS STRING * 90
END TYPE

DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetCirculo (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION VetMostra% (arqVet AS STRING)

DIM SHARED fck AS DOUBLE, fyk AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE
DIM SHARED fatorGrandeza AS DOUBLE, fatorForca AS DOUBLE, fatorMedida AS DOUBLE
DIM SHARED csf AS DOUBLE, csc AS DOUBLE, csa AS DOUBLE
DIM SHARED multNk AS DOUBLE, multFluencia AS DOUBLE, coefFluencia AS DOUBLE
DIM SHARED lim40 AS DOUBLE, lim80 AS DOUBLE, lim140 AS DOUBLE
DIM SHARED tipoAco AS STRING
DIM SHARED bitDiam(1 TO MAXBIT) AS DOUBLE, bitArea(1 TO MAXBIT) AS DOUBLE
DIM SHARED sec(1 TO MAXSEC) AS Secao, nSec AS INTEGER
DIM SHARED ver AS Secao
DIM SHARED pasta AS STRING, obraCorr AS STRING, unidMedida AS STRING, unidForca AS STRING
DIM SHARED lstF AS INTEGER

' ---------------------------------------------------------------
' Programa principal: carga do PILAR.INI, abertura, menu, fim.
' ---------------------------------------------------------------
CarregaConfiguracao
Abertura
MenuPrincipal
CLS
PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM 0

' Carrega o PILAR.INI do diretorio de execucao (linhas numeradas como no arquivo
' distribuido: 17 = Fck, 18 = Fyk, 21/23 = bitolas). Sem o arquivo, mantem os padroes.
' Depois le as secoes arquivadas da obra corrente (SISTRUT.OBR).
SUB CarregaConfiguracao
    DIM i AS INTEGER, ps AS INTEGER, fim AS INTEGER, lista AS STRING

    fck = 0.15#: fyk = 5#: tipoAco = "B"
    fatorGrandeza = 1#: fatorForca = 1#: fatorMedida = 1#
    csf = 1.4#: csc = 1.4#: csa = 1.15#
    multNk = 0.95#: multFluencia = 1.1#: coefFluencia = 0#
    lim40 = 40#: lim80 = 80#: lim140 = 140#
    unidMedida = "m": unidForca = "t"
    pasta = DirUtilizavel$("")
    obraCorr = ""
    nSec = 0

    PRINT "Aguarde ..."
    ComumDirExecDefine _CWD$
    IF ArqLer%(ComumDirExec$ + "PILAR.INI") < 0 THEN
        RecalculaMateriais
        Aviso "ATENCAO ! .. Drive e Diretorio nao encontrados"
        EXIT SUB
    END IF

    pasta = IniDirDados$
    fck = VAL(IniValor$(17))
    fyk = VAL(IniValor$(18))
    tipoAco = IniValor$(19)
    unidMedida = IniValor$(11)
    unidForca = IniValor$(12)
    fatorMedida = VAL(IniValor$(13))
    fatorForca = VAL(IniValor$(14))
    fatorGrandeza = VAL(IniValor$(16))
    lim40 = VAL(IniValor$(29))
    lim80 = VAL(IniValor$(30))
    lim140 = VAL(IniValor$(31))
    coefFluencia = VAL(IniValor$(32))
    multNk = VAL(IniValor$(33))
    multFluencia = VAL(IniValor$(34))
    csf = VAL(IniValor$(35))
    csc = VAL(IniValor$(36))
    csa = VAL(IniValor$(37))

    ' Bitolas: linha 21 = diametros (mm), linha 23 = areas (cm2), separados por virgula.
    ' RECONSTRUCAO: essas linhas nao tem "=", entao IniValor$ devolve vazio; le-se a linha inteira.
    ps = 1: lista = ArqLinha$(21)
    FOR i = 1 TO MAXBIT
        fim = INSTR(ps, lista, ",")
        IF fim = 0 THEN fim = LEN(lista) + 1
        bitDiam(i) = VAL(MID$(lista, ps, fim - ps))
        ps = fim + 1
    NEXT
    ps = 1: lista = ArqLinha$(23)
    FOR i = 1 TO MAXBIT
        fim = INSTR(ps, lista, ",")
        IF fim = 0 THEN fim = LEN(lista) + 1
        bitArea(i) = VAL(MID$(lista, ps, fim - ps))
        ps = fim + 1
    NEXT

    obraCorr = ObraAtual$(pasta)
    LeSecoes
    RecalculaMateriais
END SUB

' Converte fck/fyk (unidade de grandeza) em fcd e fyd (tf/cm2) e passa ao calculo a
' classe do aco (CcaAcoClasse%) e os limites de esbeltez/fluencia do INI (PeParam#:
' lim80 = inicio da fluencia, lim140 = lambda maximo, Mult. Fluencia).
SUB RecalculaMateriais
    DIM cl AS INTEGER, v AS DOUBLE
    fcd = fck * fatorGrandeza / csc
    fyd = fyk * fatorGrandeza / csa
    IF UCASE$(LEFT$(LTRIM$(tipoAco), 1)) = "B" THEN cl = CcaAcoClasse%(1) ELSE cl = CcaAcoClasse%(0)
    v = PeParam#(1, lim80)
    v = PeParam#(2, lim140)
    v = PeParam#(3, multFluencia)
END SUB

' Mensagem curta com espera de tecla.
SUB Aviso (msg AS STRING)
    PRINT
    PRINT "  "; msg
    Espera
END SUB

' Espera uma tecla qualquer.
SUB Espera
    PRINT
    PRINT "  + Qualquer Tecla para Continuar"
    DIM k AS STRING
    k = Tecla$
END SUB

' Le uma tecla (sem eco), esperando ate que haja uma.
FUNCTION Tecla$
    DIM k AS STRING
    DO
        k = TelaTecla$
        _LIMIT 30
    LOOP WHILE k = ""
    Tecla$ = k
END FUNCTION

' Linha de item de menu: numero e texto.
SUB Opcao (numOpc AS STRING, texto AS STRING)
    PRINT "  "; numOpc; " - "; texto
END SUB

' Tela de abertura do sistema.
SUB Abertura
    CLS
    PRINT
    PRINT "    OpenStrut                              *"
    PRINT "    PILARES DE CONCRETO ARMADO"
    PRINT "    Abril 1991   (omitido)                 "
    PRINT "    Versao 4.0"
    PRINT "    Eng. (omitido)          "
    Espera
END SUB

' Menu principal (opcoes 1 a 8). <F2> encerra o modulo.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        PRINT "SISTRUT"; "  "; "PILARES DE CONCRETO ARMADO"
        PRINT
        Opcao "1", "Arquivar Secoes"
        Opcao "2", "Processar Calculo das Secoes"
        Opcao "3", "Lista das Secoes Arquivadas"
        Opcao "4", "Correcoes dos dados"
        Opcao "5", "Materiais, Concreto Aco"
        Opcao "6", "Verificacao de Pilares pela"
        PRINT "       NB1/78"
        Opcao "7", "Visualizar / Alterar Parametrizacoes"
        Opcao "8", "Edificios de Multiplos andares"
        PRINT
        PRINT "  <F2> = Fim"
        PRINT
        PRINT "  escolha opcao ";
        k = Tecla$
        SELECT CASE k
            CASE "1": ArquivaSecao
            CASE "2": ProcessaSecoes
            CASE "3": ListaSecoes
            CASE "4": CorrigeSecao
            CASE "5": ScreenMateriais
            CASE "6": VerificaPilar
            CASE "7": ScreenParametros
            CASE "8": ChamaPILAREDI
            CASE CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Pergunta numerica: mostra o valor atual, aceita Enter para manter.
SUB LeNumero (rotulo AS STRING, vl AS DOUBLE)
    DIM txt AS STRING
    PRINT "  "; rotulo; " ["; LTRIM$(STR$(vl)); "] ";
    txt = TelaLinha$
    txt = LTRIM$(RTRIM$(txt))
    IF txt <> "" THEN vl = VAL(txt)
END SUB

' Pergunta de texto: mostra o valor atual, aceita Enter para manter.
SUB LeTexto (rotulo AS STRING, vt AS STRING)
    DIM txt AS STRING
    PRINT "  "; rotulo; " ["; vt; "] ";
    txt = TelaLinha$
    txt = LTRIM$(RTRIM$(txt))
    IF txt <> "" THEN vt = txt
END SUB

' Confirmacao S/N. Enter responde com o padrao (1 = S, 0 = N).
FUNCTION Sim% (rotulo AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    PRINT "  "; rotulo; " ";
    DO
        k = UCASE$(Tecla$)
    LOOP WHILE k <> "S" AND k <> "N" AND k <> CHR$(13)
    IF k = CHR$(13) THEN
        IF padrao THEN k = "S" ELSE k = "N"
    END IF
    PRINT k
    Sim% = (k = "S")
END FUNCTION

' Numero de barras (ou posicao) como inteiro, nunca negativo.
FUNCTION Barras% (v AS DOUBLE)
    DIM n AS INTEGER
    n = INT(v)
    IF n < 0 THEN n = 0
    Barras% = n
END FUNCTION

' Valor numerico para tela e relatorio (2 casas).
FUNCTION Num$ (v AS DOUBLE)
    Num$ = FormataNumero$(v, 2, 0)
END FUNCTION

' Recalcula os materiais a partir de fck/fyk e do tipo de aco (A ou B).
' Tipo A/B define o diagrama do aco no calculo (RecalculaMateriais -> CcaAcoClasse%).
SUB ScreenMateriais
    CLS
    PRINT "Definicao dos Materiais e unidades de trabalho"
    PRINT
    LeNumero "Concreto Fck *", fck
    LeNumero "Aco      Fyk *", fyk
    DO
        LeTexto "do Tipo  A/B *", tipoAco
        tipoAco = UCASE$(tipoAco)
    LOOP UNTIL tipoAco = "A" OR tipoAco = "B"
    PRINT
    PRINT "Unidade de grandeza para os valores caracteristicos do Concreto e Aco"
    LeNumero "Multiplicador para transformar em Tonelada/Centimetro2", fatorGrandeza
    RecalculaMateriais
END SUB

' Visualizar / alterar coeficientes e unidades (opcao 7).
' Item (4) = coeficiente de fluencia (PILAR.INI linha 32). HIPOTESE: o dump nao traz o item 4.
SUB ScreenParametros
    CLS
    PRINT "Correcao de Parametros"
    PRINT
    PRINT "Coeficientes de Seguranca"
    LeNumero "(1)  Forcas =", csf
    LeNumero "(2)  Concreto =", csc
    LeNumero "(3)  Aco =", csa
    PRINT
    PRINT "Coeficientes para o calculo da fluencia"
    ' RECONSTRUCAO: (4) e (5) sao guardados mas o calculo nao os usa (lei da fluencia
    ' do original desconhecida); (6) entra em PeFluencia# (PILEDCAL.BM).
    LeNumero "(4)  Coef. de fluencia =", coefFluencia
    PRINT "       (nao usado nesta reconstrucao)"
    LeNumero "(5)  Mult. de  Nk  para  obter (Ngk + Nqk)  =", multNk
    PRINT "       (nao usado nesta reconstrucao)"
    LeNumero "(6)  Mult. Fluencia (1.1 a 1.25) =", multFluencia
    PRINT
    PRINT "Unidades de trabalho dos esforcos solicitantes"
    LeTexto "(7)  Unidade de Forca =", unidForca
    LeNumero "(8)  Coef. multiplicador para transformar em toneladas =", fatorForca
    LeTexto "(9)  Unidade de Medida =", unidMedida
    LeNumero "(10) Coef. multiplicador para transformar em metros =", fatorMedida
    RecalculaMateriais
    Espera
END SUB

' Geometria e armaduras de secao retangular: B, H, c', barras por borda, Di/Df e bitola.
' Enter mantem o valor mostrado. Di = 0 (padrao) centraliza as barras laterais.
SUB LeGeometria (t AS Secao)
    DIM v AS DOUBLE
    v = t.b: LeNumero "B(cm) =", v: t.b = v
    v = t.h: LeNumero "H(cm) =", v: t.h = v
    v = t.dl: LeNumero "c'(cm) =", v: t.dl = v
    v = t.nSup: LeNumero "Numero de barras na borda superior", v: t.nSup = Barras%(v)
    v = t.nInf: LeNumero "Numero de barras na borda inferior", v: t.nInf = Barras%(v)
    v = t.nLat: LeNumero "Numero de barras nas bordas laterais (por lado) *0*", v: t.nLat = Barras%(v)
    IF t.nLat > 0 THEN
        PRINT "  As barras laterais serao posicionadas internamente as das extremidades."
        PRINT "  O valor mostrado entre * fara com que as barras fiquem centradas."
        PRINT "  Distancia da borda superior ate a primeira e ate a ultima barra lateral"
        v = t.di: LeNumero "Posicao da primeira barra =", v: t.di = v
        v = t.df: LeNumero "Posicao da ultima  barra =", v: t.df = v
    ELSE
        t.di = 0#: t.df = 0#
    END IF
    v = t.bit: LeNumero "Bitola (indice 1 a 13)", v: t.bit = Barras%(v)
    IF t.bit < 1 OR t.bit > MAXBIT THEN t.bit = 1
END SUB

' Esforcos caracteristicos do pilar: Nk (forca normal), Mxk, Myk, Lxe e Lye (comprimentos em m).
SUB LeEsforcos (t AS Secao)
    DIM v AS DOUBLE
    PRINT
    v = t.nk: LeNumero "Forca Normal Nk(" + unidForca + ")", v: t.nk = v
    v = t.mxk: LeNumero "Momento inicial Mxk(" + unidForca + "*" + unidMedida + ")", v: t.mxk = v
    v = t.myk: LeNumero "Momento inicial Myk(" + unidForca + "*" + unidMedida + ")", v: t.myk = v
    v = t.lxe: LeNumero "Compr. flambagem Lxe(m)", v: t.lxe = v
    v = t.lye: LeNumero "Compr. flambagem Lye(m)", v: t.lye = v
END SUB

' RECONSTRUCAO: secoes circular e poligonal (PILAR.md) nao estao no menu e nao sao implementadas.
' Entrada de uma secao retangular na posicao ps. Grava so se confirmada.
SUB EntraSecao (ps AS INTEGER)
    DIM t AS Secao
    t = sec(ps)
    CLS
    PRINT "( POSICAO"; ps
    PRINT "  Numero da posicao a ser gravada *CANCELA*"
    PRINT "  B(cm) , H(cm) , c'(cm) *RETORNO*"
    LeGeometria t
    PRINT "Area = "; Num$(SecAreaRet#(t.b, t.h))
    PRINT "Perimetro = "; Num$(SecPerimRet#(t.b, t.h))
    PRINT "Barras internas a secao = "; LTRIM$(STR$(BarrasInternas%(t)))
    LeEsforcos t
    IF NOT Sim%("Dados Corretos  N/*S*", 1) THEN EXIT SUB
    IF t.b <= 0# OR t.h <= 0# THEN Aviso "Secao invalida: B e H devem ser maiores que zero": EXIT SUB
    sec(ps) = t
    AtualizaNSec
    SalvaSecoes
END SUB

' Barras fora dos 4 cantos no arranjo de PcCamadasRet: borda (superior ou inferior)
' com 2 ou mais barras tem as das pontas nos cantos (x = c' e B - c'); borda com
' uma barra a poe no meio; as laterais ficam entre as bordas.
' RECONSTRUCAO: o termo nao tem definicao na evidencia; adotado "fora dos cantos".
FUNCTION BarrasInternas% (t AS Secao)
    DIM n AS INTEGER
    n = t.nSup + t.nInf + 2 * t.nLat
    IF t.nSup >= 2 THEN n = n - 2
    IF t.nInf >= 2 THEN n = n - 2
    BarrasInternas% = n
END FUNCTION

' Arquivo de secoes (opcao 1). Enter em branco na posicao sai.
SUB ArquivaSecao
    DIM p AS DOUBLE
    DO
        CLS
        PRINT "Arquivo de Secoes para dimensionamento"
        PRINT
        PRINT "Numero maximo de posicoes -"; MAXSEC; " posicionadas"
        PRINT "Secoes"; nSec
        p = 0
        LeNumero "Posicao *", p
        IF p < 1 OR p > MAXSEC THEN EXIT DO
        EntraSecao INT(p)
    LOOP
END SUB

' Correcao de uma secao arquivada (opcao 4). Enter em branco sai.
SUB CorrigeSecao
    DIM p AS DOUBLE
    CLS
    PRINT "Correcao de Secoes"
    PRINT "CORRECAO"
    PRINT
    p = 0
    LeNumero "Numero da posicao a ser alterada *FIM*", p
    IF p >= 1 AND p <= MAXSEC THEN EntraSecao INT(p)
END SUB

' Analise da secao s com os esforcos gravados nela, em tf e tf.cm.
' Forca normal positiva = compressao, negativa = tracao. Momentos tomados em modulo.
' MR de cada direcao com cada barra na posicao real (PcCamadasRet: bordas igualmente
' espacadas, laterais como no desenho, PcYLateral#), o menor dos dois sentidos
' (PcMRDoisSentidos#). Com tracao, MR e calculado com o Nd de tracao (dominios 1 e 2).
' e2 (PcE2#) e ea somadas (nd*(ea+e2)) so com nd > 0.
' Indice = (Mx/MRx)^1.2 + (My/MRy)^1.2; ok quando <= 1 e sem aviso. MR < 0 (nd fora
' da capacidade) = NAO. Limites como PILEDCAL PeDimensiona: As minima 0,8% de Ac
' (lambda > 30) ou 0,5%, maxima 6%, lambda maximo lim140.
SUB AnaliseSecao (s AS Secao, r AS Resultado)
    DIM ba AS DOUBLE, ac AS DOUBLE, ix AS DOUBLE, iy AS DOUBLE, lam AS DOUBLE
    DIM ncx AS INTEGER, ncy AS INTEGER, av AS STRING
    REDIM ycx(1 TO 1) AS DOUBLE, acx(1 TO 1) AS DOUBLE, ycy(1 TO 1) AS DOUBLE, acy(1 TO 1) AS DOUBLE
    ba = bitArea(s.bit)
    ac = s.b * s.h
    PcCamadasRet 1, s.b, s.h, s.dl, s.nSup, s.nInf, s.nLat, s.di, s.df, ba, ncx, ycx(), acx()
    PcCamadasRet 2, s.b, s.h, s.dl, s.nSup, s.nInf, s.nLat, s.di, s.df, ba, ncy, ycy(), acy()
    r.asSup = s.nSup * ba
    r.asInf = s.nInf * ba
    r.asLat = s.nLat * ba
    r.asTotal = (s.nSup + s.nInf + 2 * s.nLat) * ba
    r.dx = PcDCamadas#(s.h, ncx, ycx())
    r.dy = PcDCamadas#(s.b, ncy, ycy())
    r.lamx = PcEsbeltez#(s.lxe * 100#, s.h)
    r.lamy = PcEsbeltez#(s.lye * 100#, s.b)
    r.nd = s.nk * fatorForca * csf
    r.eax = PcExcAcidental#(s.h)
    r.eay = PcExcAcidental#(s.b)
    r.e2x = 0#: r.e2y = 0#
    IF r.nd > 0# THEN
        ' fluencia (PeFluencia#, como PILEDCAL): e2 de cada direcao x lambda da direcao
        r.e2x = PcE2#(s.lxe * 100#, s.h, r.nd, ac, fcd, fyd) * PeFluencia#(r.lamx)
        r.e2y = PcE2#(s.lye * 100#, s.b, r.nd, ac, fcd, fyd) * PeFluencia#(r.lamy)
    END IF
    ' NB-1/78: e = e1 + ea + e2 (ea somada a excentricidade inicial, como em
    ' PILEDCAL PeDimensiona), nao apenas como minimo
    r.mxd = ABS(s.mxk) * fatorForca * fatorMedida * 100# * csf
    r.myd = ABS(s.myk) * fatorForca * fatorMedida * 100# * csf
    IF r.nd > 0# THEN
        r.mxd = r.mxd + r.nd * (r.eax + r.e2x)
        r.myd = r.myd + r.nd * (r.eay + r.e2y)
    END IF

    r.nmax = PcNmaxAxial#(ac, fcd, r.asTotal, fyd)
    r.mrx = PcMRDoisSentidos#(r.nd, s.b, s.h, ncx, ycx(), acx(), fcd, fyd)
    r.mry = PcMRDoisSentidos#(r.nd, s.h, s.b, ncy, ycy(), acy(), fcd, fyd)

    ix = 0#: iy = 0#
    IF r.mxd > 0# THEN
        IF r.mrx <= 0# THEN ix = 99# ELSE ix = (r.mxd / r.mrx) ^ 1.2#
    END IF
    IF r.myd > 0# THEN
        IF r.mry <= 0# THEN iy = 99# ELSE iy = (r.myd / r.mry) ^ 1.2#
    END IF
    r.indice = ix + iy
    IF r.mrx < 0# OR r.mry < 0# THEN r.indice = 99#

    ' limites da NB-1/78 (mesmos de PILEDCAL PeDimensiona)
    lam = r.lamx: IF r.lamy > lam THEN lam = r.lamy
    IF lam > 30# THEN r.asNorma = 0.008# * ac ELSE r.asNorma = 0.005# * ac
    av = ""
    IF lam > lim140 THEN av = "Esbeltez maxima excedida (lambda > " + Num$(lim140) + "). "
    IF r.asTotal < r.asNorma THEN av = av + "As menor que a minima (" + Num$(r.asNorma) + " cm2). "
    IF r.asTotal > 0.06# * ac THEN av = av + "Armadura excede o maximo (6% = " + Num$(0.06# * ac) + " cm2). "
    r.aviso = av

    r.ok = 0
    IF r.indice <= 1# AND av = "" THEN r.ok = 1
    IF r.nd < 0# THEN
        r.situ = 1
    ELSEIF r.mxd > 0# AND r.myd > 0# THEN
        r.situ = 2
    ELSEIF r.mxd > 0# OR r.myd > 0# THEN
        r.situ = 3
    ELSE
        r.situ = 4
    END IF
    r.xln = PcXCamadas#(r.nd, s.b, s.h, ncx, ycx(), acx(), fcd, fyd)
    r.xlny = PcXCamadas#(r.nd, s.h, s.b, ncy, ycy(), acy(), fcd, fyd)
END SUB

' Nome da situacao de calculo (codigo de AnaliseSecao).
FUNCTION SituacaoTexto$ (cod AS INTEGER)
    SELECT CASE cod
        CASE 1: SituacaoTexto$ = "Situacao - Flexo Tracao"
        CASE 2: SituacaoTexto$ = "Situacao - Flexao Obliqua"
        CASE 3: SituacaoTexto$ = "Situacao - Flexo Compressao"
        CASE ELSE: SituacaoTexto$ = "Situacao - Compressao Centrada"
    END SELECT
END FUNCTION

' Linha so no relatorio aberto (AbreLst).
SUB RelataLst (txt AS STRING)
    IF lstF > 0 THEN PRINT #lstF, txt
END SUB

' Linha na tela e no relatorio aberto.
SUB ImprimeLin (txt AS STRING)
    PRINT txt
    RelataLst txt
END SUB

' Abre <obra>_PILAR.LST: acumula (APPEND) ou recria (OUTPUT). Sem obra, avisa e nao grava.
SUB AbreLst (acumula AS INTEGER)
    lstF = 0
    IF obraCorr = "" THEN
        Aviso "Obra nao definida (SISTRUT.OBR): relatorio nao gravado."
        EXIT SUB
    END IF
    lstF = FREEFILE
    IF acumula THEN
        OPEN pasta + obraCorr + "_PILAR.LST" FOR APPEND AS #lstF
    ELSE
        OPEN pasta + obraCorr + "_PILAR.LST" FOR OUTPUT AS #lstF
    END IF
END SUB

SUB FechaLst
    IF lstF > 0 THEN CLOSE #lstF
    lstF = 0
END SUB

' Processa as secoes arquivadas (opcao 2): esbeltez, ea, e2, armaduras, Nmax, MR e indice.
SUB ProcessaSecoes
    DIM i AS INTEGER, r AS Resultado
    CLS
    PRINT "Processamento de Secoes Arquivadas"
    PRINT "Aguarde ..."
    PRINT "Esforcos resistentes do Pilar"
    AbreLst 0
    FOR i = 1 TO MAXSEC
        IF sec(i).b > 0# THEN
            AnaliseSecao sec(i), r
            ImprimeLin "POS " + LTRIM$(STR$(i)) + "  " + SituacaoTexto$(r.situ)
            ImprimeLin "  Lambda x = " + Num$(r.lamx) + "   Lambda y = " + Num$(r.lamy)
            IF r.lamx > 200# OR r.lamy > 200# THEN ImprimeLin "  ESTE APLICATIVO NAO ACEITA PILARES COM ESBELTEZ MAIOR QUE 200"
            ImprimeLin "  ea x = " + Num$(r.eax) + " cm   ea y = " + Num$(r.eay) + " cm   e2 x = " + Num$(r.e2x) + " cm   e2 y = " + Num$(r.e2y) + " cm"
            ImprimeLin "  As sup = " + Num$(r.asSup) + "   As inf = " + Num$(r.asInf) + "   As lateral (por lado) = " + Num$(r.asLat) + "   As total = " + Num$(r.asTotal) + " cm2"
            ImprimeLin "  Nd = " + Num$(r.nd) + " tf   Nmax = " + Num$(r.nmax) + " tf"
            ImprimeLin "  Mx = " + Num$(r.mxd) + "   My = " + Num$(r.myd) + " tf.cm"
            ImprimeLin "  MR x = " + Num$(r.mrx) + "   MR y = " + Num$(r.mry) + " tf.cm"
            IF r.ok THEN
                ImprimeLin "  ok   indice = " + Num$(r.indice)
            ELSE
                ImprimeLin "  NAO   indice = " + Num$(r.indice)
            END IF
            IF RTRIM$(r.aviso) <> "" THEN ImprimeLin "  " + RTRIM$(r.aviso)
            Espera
        END IF
    NEXT
    IF lstF > 0 THEN PRINT "Relatorio gravado em "; DirCurto$(pasta + obraCorr + "_PILAR.LST", 55)
    FechaLst
END SUB

' Lista das secoes arquivadas (opcao 3).
SUB ListaSecoes
    DIM i AS INTEGER, lin AS STRING
    CLS
    PRINT "Lista das Secoes arquivadas"
    PRINT "POS tipo B(cm) H(cm) c'(cm) Sup Inf Lat d1 d2 Diametro Bit da armadura"
    IF nSec = 0 THEN PRINT "Nenhum Arquivo Encontrado"
    FOR i = 1 TO MAXSEC
        IF sec(i).b > 0# THEN
            lin = FormataNumero$(i, 0, 3) + "  Ret  " + FormataNumero$(sec(i).b, 1, 6) + FormataNumero$(sec(i).h, 1, 6) + FormataNumero$(sec(i).dl, 1, 7)
            lin = lin + FormataNumero$(sec(i).nSup, 0, 4) + FormataNumero$(sec(i).nInf, 0, 4) + FormataNumero$(sec(i).nLat, 0, 4)
            lin = lin + FormataNumero$(sec(i).di, 1, 6) + FormataNumero$(sec(i).df, 1, 6) + FormataNumero$(bitDiam(sec(i).bit), 1, 9) + FormataNumero$(sec(i).bit, 0, 5)
            PRINT lin
        END IF
    NEXT
    Espera
END SUB

' Tela de esforcos do pilar e resistencias da secao (verificacao).
SUB TelaEsforcos (r AS Resultado)
    DIM ang AS DOUBLE, mtot AS DOUBLE
    CLS
    PRINT SituacaoTexto$(r.situ)
    PRINT "Lambda x = "; Num$(r.lamx); "   Lambda y = "; Num$(r.lamy)
    PRINT "ea x = "; Num$(r.eax); " cm   ea y = "; Num$(r.eay); " cm"
    PRINT "e2 x = "; Num$(r.e2x); " cm   e2 y = "; Num$(r.e2y); " cm"
    PRINT
    PRINT "Tela de esforcos do pilar"
    PRINT "caso "; LTRIM$(STR$(r.situ))
    mtot = SQR(r.mxd ^ 2 + r.myd ^ 2)
    ang = 90#
    IF r.mxd > 0# THEN ang = ATN(r.myd / r.mxd) * 180# / (4# * ATN(1#))
    PRINT "Mx= "; Num$(r.mxd); " tf.cm   My= "; Num$(r.myd); " tf.cm"
    PRINT "Mtotal= "; Num$(mtot); " tf.cm   incl "; Num$(ang); " graus"
    PRINT
    PRINT "Esforcos resistentes do Pilar"
    PRINT "MAX  Nmax = "; Num$(r.nmax); " tf"
    PRINT "     MR x = "; Num$(r.mrx); " tf.cm   MR y = "; Num$(r.mry); " tf.cm"
    Espera
END SUB

' Tela de instabilidade para a direcao de maior esbeltez (lambda > lim40, com e2).
' rot: rotulo da direcao. hs: dimensao da secao nessa direcao; d: profundidade da barra
' mais afastada; xln: linha neutra (cm) do estado limite com Nd.
' Deformacoes pela regra dos pivos (PcDeformacao#): borda mais comprimida e barra mais
' afastada (positivo = encurtamento); 1/r = (eps_borda - eps_barra)/d. Com xln > hs a
' secao esta toda comprimida (dominio 5); com xln < 0, toda tracionada (dominio 1).
' Se Nd passa da capacidade (mr < 0) nao ha estado limite e nada e calculado.
SUB TelaInstab (rot AS STRING, mAt AS DOUBLE, mr AS DOUBLE, le AS DOUBLE, hs AS DOUBLE, d AS DOUBLE, xln AS DOUBLE)
    DIM epsC AS DOUBLE, epsS AS DOUBLE, txt AS STRING
    CLS
    PRINT "SITUACAO DE INSTABILIDADE"
    PRINT
    PRINT "  "; rot; "  M(Atuante) = "; Num$(mAt); " tf.cm   MR = "; Num$(mr); " tf.cm"
    IF mr < mAt THEN
        PRINT "  < M(Atuante)   INSTABILIDADE"
    ELSE
        PRINT "  >= M(Atuante)   ok"
    END IF
    IF mr < 0# THEN
        PRINT "  ln = "; Num$(le); " cm   Xln: nao aplicavel (Nd fora da capacidade da secao)"
        Espera
        EXIT SUB
    END IF
    epsC = PcDeformacao#(xln, 0#, hs, d)
    epsS = PcDeformacao#(xln, d, hs, d)
    txt = ""
    IF xln > hs THEN txt = "  (dominio 5: secao toda comprimida)"
    IF xln < 0# THEN txt = "  (dominio 1: secao toda tracionada)"
    PRINT "  ln = "; Num$(le); " cm   Xln = "; Num$(xln); " cm"; txt
    PRINT "  1/r = "; Num$(1000# * (epsC - epsS) / d); " x 10-3 (1/cm)"
    txt = " (encurtamento)": IF epsS < 0# THEN txt = " (alongamento)"
    PRINT "  Def con "; Num$(1000# * epsC); " x 10-3   Def aco "; Num$(1000# * ABS(epsS)); " x 10-3"; txt
    Espera
END SUB

' Resultado final da verificacao: ok ou NAO, avisos de limite da norma e As minima.
' asmin = As por face exigida pelos esforcos (PcAsMinObliquo#, barras nas faces); -1
' quando a taxa de 3% por face nao basta.
SUB TelaResultado (r AS Resultado, asmin AS DOUBLE)
    CLS
    IF r.ok THEN
        PRINT "ok"
    ELSE
        PRINT "NAO"
        IF r.indice > 1# THEN PRINT "OS ESFORCOS APLICADOS NO PILAR SAO SUPERIORES AOS MAXIMOS ESFORCOS RESISTENTES DA SECAO "
    END IF
    IF RTRIM$(r.aviso) <> "" THEN PRINT "  "; RTRIM$(r.aviso)
    IF asmin >= 0# THEN
        PRINT "  As minima por face (cm2) = "; Num$(asmin)
    ELSE
        PRINT "  As minima: nao atingida com taxa de 3%"
    END IF
    PRINT "  As minima da norma (total, cm2) = "; Num$(r.asNorma); "   As da secao = "; Num$(r.asTotal)
    Espera
END SUB

' Resumo da verificacao no relatorio (quando "Imprimo as verificacoes" = S).
SUB RelataVerif (s AS Secao, r AS Resultado, asmin AS DOUBLE)
    RelataLst "Verificacao NB-1/78  B=" + Num$(s.b) + " cm  H=" + Num$(s.h) + " cm  c'=" + Num$(s.dl) + " cm"
    RelataLst "Nk=" + Num$(s.nk) + "  Mxk=" + Num$(s.mxk) + "  Myk=" + Num$(s.myk) + "  Lxe=" + Num$(s.lxe) + " m  Lye=" + Num$(s.lye) + " m"
    RelataLst SituacaoTexto$(r.situ) + "   Lambda x = " + Num$(r.lamx) + "   Lambda y = " + Num$(r.lamy)
    RelataLst "Nd=" + Num$(r.nd) + " tf   Nmax=" + Num$(r.nmax) + " tf   Mx=" + Num$(r.mxd) + "   My=" + Num$(r.myd) + " tf.cm"
    RelataLst "MR x=" + Num$(r.mrx) + "   MR y=" + Num$(r.mry) + " tf.cm   indice=" + Num$(r.indice)
    IF r.ok THEN
        RelataLst "ok"
    ELSE
        RelataLst "NAO"
    END IF
    IF RTRIM$(r.aviso) <> "" THEN RelataLst RTRIM$(r.aviso)
    IF asmin >= 0# THEN RelataLst "As minima por face (cm2) = " + Num$(asmin)
    RelataLst "As minima da norma (total, cm2) = " + Num$(r.asNorma) + "   As da secao = " + Num$(r.asTotal)
    RelataLst ""
END SUB

' Verificacao de um pilar retangular isolado pela NB-1/78 (opcao 6).
' Forcas em unidForca, momentos em unidForca*unidMedida, comprimentos em m.
' Desenho: <obra>_VERIF.VET (HIPOTESE: o nome do arquivo nao esta no dump).
SUB VerificaPilar
    DIM r AS Resultado, imprime AS INTEGER, desenha AS INTEGER, asmin AS DOUBLE, arq AS STRING
    CLS
    PRINT "Verificacao de Pilares segundo a Norma Brasileira - NB1/78"
    PRINT
    PRINT "Concreto Fck ="; fck; "  "
    PRINT "Aco      Fyk ["; fyk; "]  do Tipo "; tipoAco
    PRINT
    PRINT "Secao Retangular"
    LeGeometria ver
    imprime = Sim%("Imprimo as verificacoes S/*N*", 0)
    desenha = Sim%("Desenho a Secao comprimida N/*S*", 1)
    LeEsforcos ver
    IF NOT Sim%("Dados Corretos  N/*S*", 1) THEN EXIT SUB
    IF ver.b <= 0# OR ver.h <= 0# THEN Aviso "Secao invalida: B e H devem ser maiores que zero": EXIT SUB

    AnaliseSecao ver, r
    IF r.lamx > 200# OR r.lamy > 200# THEN
        Aviso "ESTE APLICATIVO NAO ACEITA PILARES COM ESBELTEZ MAIOR QUE 200"
        EXIT SUB
    END IF
    ' RECONSTRUCAO: acima de lim140 o original usava o processo exato, nao reconstruido;
    ' a secao e recusada, como em PILEDCAL PeDimensiona
    IF r.lamx > lim140 OR r.lamy > lim140 THEN
        Aviso "Esbeltez maxima excedida (lambda > " + Num$(lim140) + "): processo exato nao reconstruido"
        EXIT SUB
    END IF
    ' com tracao tambem: o nucleo aceita Nd negativo (dominios 1 e 2)
    asmin = PcAsMinObliquo#(r.nd, r.mxd, r.myd, ver.b, ver.h, ver.dl, fcd, fyd)

    TelaEsforcos r
    IF r.lamx > lim40 OR r.lamy > lim40 THEN
        IF r.lamx >= r.lamy THEN
            TelaInstab "Mx=", r.mxd, r.mrx, ver.lxe * 100#, ver.h, r.dx, r.xln
        ELSE
            TelaInstab "My=", r.myd, r.mry, ver.lye * 100#, ver.b, r.dy, r.xlny
        END IF
    END IF
    TelaResultado r, asmin

    IF imprime THEN
        AbreLst 1
        RelataVerif ver, r, asmin
        FechaLst
    END IF
    IF desenha THEN
        IF obraCorr = "" THEN
            Aviso "Obra nao definida (SISTRUT.OBR): desenho nao gravado."
        ELSE
            arq = pasta + obraCorr + "_VERIF.VET"
            DesenhaSecao ver, arq, "Verificacao", r.xln
            IF VetMostra%(arq) < 0 THEN Aviso "Arquivo de desenho invalido."
        END IF
    END IF
END SUB

' Grava o desenho da secao em arq (formato SISPLOT.BM): contorno, barras e zona comprimida
' (acima da linha neutra xln; a secao toda se xln >= h). Coordenadas: y para cima, origem na base.
SUB DesenhaSecao (s AS Secao, arq AS STRING, titulo AS STRING, xln AS DOUBLE)
    DIM f AS INTEGER, j AS INTEGER, k AS INTEGER, x AS DOUBLE, y AS DOUBLE, yt AS DOUBLE, rr AS DOUBLE
    f = VetAbre%(arq, titulo)
    IF xln > 0# AND xln < s.h THEN VetRetangulo f, 0#, s.h - xln, s.b, s.h, 3
    IF xln >= s.h THEN VetRetangulo f, 0#, 0#, s.b, s.h, 3   ' dominio 5: toda comprimida
    VetRetangulo f, 0#, 0#, s.b, s.h, 1
    rr = bitDiam(s.bit) / 20#
    FOR j = 1 TO s.nSup
        IF s.nSup = 1 THEN x = s.b / 2# ELSE x = s.dl + (j - 1) * (s.b - 2# * s.dl) / (s.nSup - 1)
        VetCirculo f, x, s.h - s.dl, rr, 2
    NEXT
    FOR j = 1 TO s.nInf
        IF s.nInf = 1 THEN x = s.b / 2# ELSE x = s.dl + (j - 1) * (s.b - 2# * s.dl) / (s.nInf - 1)
        VetCirculo f, x, s.dl, rr, 2
    NEXT
    FOR k = 1 TO s.nLat
        yt = PcYLateral#(k, s.nLat, s.h, s.dl, s.di, s.df)   ' mesma posicao do calculo
        y = s.h - yt
        VetCirculo f, s.dl, y, rr, 2
        VetCirculo f, s.b - s.dl, y, rr, 2
    NEXT
    VetTexto f, 0#, -3#, 3#, 0#, 1, "B=" + FormataNumero$(s.b, 1, 0) + "  H=" + FormataNumero$(s.h, 1, 0)
    VetFecha f
END SUB

' Recalcula nSec como a maior posicao ocupada.
SUB AtualizaNSec
    DIM i AS INTEGER
    nSec = 0
    FOR i = 1 TO MAXSEC
        IF sec(i).b > 0# THEN nSec = i
    NEXT
END SUB

' Le <pasta><obra>.PSC (uma linha por posicao). Sem obra ou sem arquivo, nao faz nada.
SUB LeSecoes
    DIM f AS INTEGER, i AS INTEGER, t AS Secao
    IF obraCorr = "" THEN EXIT SUB
    IF NOT _FILEEXISTS(pasta + obraCorr + ".PSC") THEN EXIT SUB
    f = FREEFILE
    OPEN pasta + obraCorr + ".PSC" FOR INPUT AS #f
    DO WHILE NOT EOF(f)
        INPUT #f, i, t.b, t.h, t.dl, t.di, t.df, t.nSup, t.nInf, t.nLat, t.bit, t.nk, t.mxk, t.myk, t.lxe, t.lye
        IF i >= 1 AND i <= MAXSEC THEN sec(i) = t
    LOOP
    CLOSE #f
    AtualizaNSec
END SUB

' Grava as secoes em <pasta><obra>.PSC. Sem obra, avisa e mantem so na memoria.
SUB SalvaSecoes
    DIM f AS INTEGER, i AS INTEGER
    IF obraCorr = "" THEN
        Aviso "Obra nao definida (SISTRUT.OBR): secoes mantidas so na memoria."
        EXIT SUB
    END IF
    DadBackup pasta + obraCorr + ".PSC"
    f = FREEFILE
    OPEN pasta + obraCorr + ".PSC" FOR OUTPUT AS #f
    FOR i = 1 TO MAXSEC
        IF sec(i).b > 0# THEN
            WRITE #f, i, sec(i).b, sec(i).h, sec(i).dl, sec(i).di, sec(i).df, sec(i).nSup, sec(i).nInf, sec(i).nLat, sec(i).bit, sec(i).nk, sec(i).mxk, sec(i).myk, sec(i).lxe, sec(i).lye
        END IF
    NEXT
    CLOSE #f
END SUB

' Chama o modulo PILAREDI (opcao 8).
' RECONSTRUCAO: no DOS o original avisava que as secoes arquivadas em memoria
' seriam perdidas ao carregar o PILAREDI; aqui elas ficam gravadas no .PSC e
' nada e apagado, entao o aviso e a confirmacao nao se aplicam.
SUB ChamaPILAREDI
    SalvaSecoes
    RunSubmodulo "PILAREDI"
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../pilar/PILCALC.BM'
'$INCLUDE: 'PILEDCAL.BM'
'$INCLUDE: 'PILGEO.BM'
