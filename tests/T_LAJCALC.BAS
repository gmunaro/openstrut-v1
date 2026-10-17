' Teste do calculo de lajes (laje/LAJCALC.BM) contra solucoes fechadas
' e equilibrio, nao contra o proprio resultado.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM mx AS DOUBLE, my AS DOUBLE, x1 AS DOUBLE, x2 AS DOUBLE, x3 AS DOUBLE, x4 AS DOUBLE, t AS STRING
DIM r1 AS DOUBLE, r2 AS DOUBLE, r3 AS DOUBLE, r4 AS DOUBLE, ei AS DOUBLE, msg AS STRING

' momentos
LcMomentos 4, 4, "AAAA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "quadrada apoiada m = pL2/24", mx, 16 / 24, 0.000001
AssertEq "quadrada: tipo cruz", t, "C"
LcMomentos 4, 10, "AAAA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "uma direcao apoiada pl2/8", mx, 2, 0.000001
AssertTrue "uma direcao: my = 0", my = 0 AND t = "UX"
LcMomentos 4, 10, "EAEA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "bi-engastada i=2: positivo pl2/24", mx, 16 / 24, 0.000001
AssertNear "bi-engastada i=2: negativo pl2/12", x1, 16 / 12, 0.000001
AssertNear "bi-engastada: negativo direito", x3, 16 / 12, 0.000001
LcMomentos 1.5, 4, "ELLL", 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "balanco pl2/2", x1, 1.125, 0.000001
AssertEq "balanco: tipo", t, "BX"
LcMomentos 4, 5, "AALA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertTrue "bordo livre a direita: vence ly", t = "UY" AND mx = 0
AssertNear "bordo livre: my = p ly2/8", my, 25 / 8, 0.000001
LcMomentos 4, 5, "ALLA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertEq "dois livres: nao suportada", t, ""
' Johansen retangular apoiada 4x6 (a/b = 2/3): m = 16/24 (raiz(3+4/9) - 2/3)^2
LcMomentos 4, 6, "AAAA", 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "Johansen 4x6", mx, 16 / 24 * (SQR(3 + 4 / 9) - 2 / 3) ^ 2, 0.000001

' reacoes
LcReacoes 4, 4, "AAAA", 1, r1, r2, r3, r4
AssertNear "reacao quadrada pL/4", r1, 1, 0.01
AssertNear "reacao quadrada simetrica", r4, 1, 0.01
LcReacoes 4, 6, "AAAA", 1, r1, r2, r3, r4
AssertNear "4x6: bordo curto p*4/4", r2, 1, 0.01
AssertNear "4x6: bordo longo p*8/6", r1, 8 / 6, 0.01
LcReacoes 4, 5, "EAAE", 1.3, r1, r2, r3, r4
AssertNear "equilibrio bordos mistos", r1 * 5 + r2 * 4 + r3 * 5 + r4 * 4, 1.3 * 20, 0.001
AssertTrue "engastado carrega mais que apoiado oposto", r1 > r3
LcReacoes 1.5, 4, "ELLL", 1, r1, r2, r3, r4
AssertNear "balanco: tudo no engaste", r1 * 4, 6, 0.001
AssertNear "balanco: livre sem reacao", r3, 0, 0

' flecha uma direcao apoiada: 5 p l^4 / (384 E I)
ei = LcModuloE#(0.15) * 0.1 ^ 3 / 12
AssertNear "flecha uma direcao 5pl4/384EI (cm)", LcFlecha#(4, 10, "AAAA", 1, 10, 0.15), 5 * 256 / (384 * ei) * 100, 0.000001
AssertNear "Ec fck15: 0,9*6600*raiz(18.21) MPa", LcModuloE#(0.15) * 9.80665 / 1000, 0.9 * 6600 * SQR(0.15 * 98.0665 + 3.5), 0.000001
AssertTrue "flecha cruz < flecha faixa isolada", LcFlecha#(4, 4, "AAAA", 1, 10, 0.15) < LcFlecha#(4, 10, "AAAA", 1, 10, 0.15)

' espessura: resultado atende os limites e h-1 nao atende
DIM h AS DOUBLE
h = LcEspessura#(5, 6, "AAAA", 0.1, 0.15, 2.5, 0.15, 6, 300, 500)
AssertTrue "espessura encontrada", h >= 6 AND h <= 60
AssertTrue "espessura atende L/300", LcFlecha#(5, 6, "AAAA", h / 100 * 2.5 + 0.25, h, 0.15) <= 500 / 300
AssertTrue "h-1 nao atende", LcFlecha#(5, 6, "AAAA", (h - 1) / 100 * 2.5 + 0.25, h - 1, 0.15) > 500 / 300 OR LcFlecha#(5, 6, "AAAA", 0.15, h - 1, 0.15) > 500 / 500

' compatibilizacao
AssertNear "compat (2,1) = 1.6", LcCompatibiliza#(2, 1), 1.6, 0.000001
AssertNear "compat (2,1.8) = 1.9", LcCompatibiliza#(2, 1.8), 1.9, 0.000001
AssertEq "token de viga", LcViga$("V1/V2/V3/V4", 3), "V3"

' calculo completo de duas lajes continuas
LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).h = 10: Laj(1).bordos = "AAEA": Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).vigas = "V1/V2/V3/V4"
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 3: Laj(2).ly = 5: Laj(2).h = 10: Laj(2).bordos = "EAAA": Laj(2).g = 0.1: Laj(2).q = 0.15: Laj(2).vigas = "V3/V5/V6/V7"
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertEq "calculo sem avisos", msg, ""
AssertTrue "resultados marcados", Laj(1).temRes AND Laj(2).temRes
AssertNear "negativo compatibilizado igual nos dois lados", Laj(1).x3, Laj(2).x1, 0.000001
AssertTrue "armadura >= minima", Laj(1).asx >= 0.0015 * 100 * 10 - 0.000001
AssertNear "carga total L1 = pp + g + q", Laj(1).p, 0.25 + 0.1 + 0.15, 0.000001
' positivo corrigido com metade da reducao do negativo (L1 perdeu negativo)
DIM mxL1 AS DOUBLE, x3L1 AS DOUBLE, tt AS STRING, a1 AS DOUBLE, a2 AS DOUBLE, a3 AS DOUBLE, a4 AS DOUBLE, a5 AS DOUBLE
LcMomentos 4, 5, "AAEA", 2, Laj(1).p, mxL1, a1, a2, a3, x3L1, a4, tt
AssertNear "positivo corrigido: mx + (Xproprio - Xcompat)/2", Laj(1).mx, mxL1 + (x3L1 - Laj(1).x3) / 2, 0.000001

' balanco ao lado de laje interna: momento do balanco nao e reduzido
LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 3: Laj(1).ly = 5: Laj(1).h = 10: Laj(1).bordos = "AAEA": Laj(1).g = 0.05: Laj(1).q = 0.25: Laj(1).vigas = "V1/V2/V3/V4"
Laj(2).nome = "L2": Laj(2).x0 = 3: Laj(2).y0 = 0: Laj(2).lx = 2: Laj(2).ly = 5: Laj(2).h = 10: Laj(2).bordos = "ELLL": Laj(2).g = 0.05: Laj(2).q = 0.25: Laj(2).vigas = "V3/-/-/-"
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertNear "balanco: X = pl2/2 sem reducao", Laj(2).x1, Laj(2).p * 4 / 2, 0.000001
AssertNear "laje interna recebe o momento do balanco", Laj(1).x3, Laj(2).x1, 0.000001

' vizinhos do mesmo lado da viga nao se compatibilizam entre si
LajQtd = 3
Laj(1).nome = "A": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 8: Laj(1).ly = 4: Laj(1).h = 12: Laj(1).bordos = "AAAE": Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).vigas = "V1/V2/V3/V4"
Laj(2).nome = "B": Laj(2).x0 = 0: Laj(2).y0 = 4: Laj(2).lx = 4: Laj(2).ly = 4: Laj(2).h = 12: Laj(2).bordos = "AEAA": Laj(2).g = 0.1: Laj(2).q = 0.15: Laj(2).vigas = "V5/V4/V6/V7"
Laj(3).nome = "C": Laj(3).x0 = 4: Laj(3).y0 = 4: Laj(3).lx = 2: Laj(3).ly = 4: Laj(3).h = 12: Laj(3).bordos = "AEAA": Laj(3).g = 0.1: Laj(3).q = 0.15: Laj(3).vigas = "V6/V4/V8/V9"
' momentos proprios de B e C antes da compatibilizacao
DIM xb AS DOUBLE, xcc AS DOUBLE, xa AS DOUBLE
LcMomentos 4, 4, "AEAA", 2, 0.12 * 2.5 + 0.25, a1, a2, a3, xb, a4, a5, tt
LcMomentos 2, 4, "AEAA", 2, 0.12 * 2.5 + 0.25, a1, a2, a3, xcc, a4, a5, tt
LcMomentos 8, 4, "AAAE", 2, 0.12 * 2.5 + 0.25, a1, a2, a3, a4, a5, xa, tt
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertTrue "B >= compat(B, A) (simetria eleva ao maior)", Laj(2).x2 >= LcCompatibiliza#(xb, xa) - 0.000001
AssertTrue "C nao se compatibiliza com B (mesmo lado)", Laj(3).x2 >= LcCompatibiliza#(xcc, xa) - 0.000001
AssertNear "A fica com o maior dos compatibilizados", Laj(1).x4, LcMaior#(LcCompatibiliza#(xa, xb), LcCompatibiliza#(xa, xcc)), 0.000001
AssertNear "simetria: B igual a A no mesmo trecho", Laj(2).x2, Laj(1).x4, 0.000001

' armadura de distribuicao em laje armada numa direcao
LajQtd = 1
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 3: Laj(1).ly = 8: Laj(1).h = 10: Laj(1).bordos = "AAAA": Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).vigas = "V1/V2/V3/V4"
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertNear "distribuicao = max(principal/5; 0,9)", Laj(1).asy, LcMaior#(Laj(1).asx / 5, 0.9), 0.000001
AssertTrue "distribuicao >= 0,9 cm2/m", Laj(1).asy >= 0.9

' fluencia: fator 3 na carga permanente aumenta a flecha e a espessura
DIM h1 AS DOUBLE, h3 AS DOUBLE, f1 AS DOUBLE
h1 = LcEspessura#(5, 6, "AAAA", 0.1, 0.15, 2.5, 0.15, 6, 300, 500)
f1 = LcFluencia#(3)
h3 = LcEspessura#(5, 6, "AAAA", 0.1, 0.15, 2.5, 0.15, 6, 300, 500)
AssertTrue "fluencia: espessura maior ou igual", h3 >= h1 AND h3 > 0
AssertTrue "fluencia: com h3 a flecha total com fator 3 atende L/300", LcFlecha#(5, 6, "AAAA", h3 / 100 * 2.5 + 0.1, h3, 0.15) * 3 + LcFlecha#(5, 6, "AAAA", 0.15, h3, 0.15) <= 500 / 300
f1 = LcFluencia#(1)
' espessura automatica e deteccao de secao insuficiente
LajQtd = 1
Laj(1).h = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).bordos = "AAAA"
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertTrue "espessura automatica", Laj(1).h >= 6 AND Laj(1).h <= 15
Laj(1).h = 6: Laj(1).lx = 7: Laj(1).ly = 8: Laj(1).q = 1
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertTrue "secao insuficiente avisada", INSTR(msg, "Secao insuficiente") > 0 AND Laj(1).asx = -1
' --- correcoes de engenharia (ortotropia, classe do aco, linha neutra, cortante) ---
DIM fcdT AS DOUBLE, fydT AS DOUBLE, mT AS DOUBLE, mc AS DOUBLE, ng AS INTEGER, dummy AS DOUBLE
fcdT = 0.15 / 1.4: fydT = 5 / 1.15

' Ortotropia, laje quadrada apoiada L = 4, p = 1, my = mu mx com mu = 2.
' Trabalho virtual (cumeeira paralela a x a partir de c dos bordos x = 0 e x = L):
'   p (L^2/2 - L c/3) = mx (4 mu + 2 L/c)  ->  maximo em c da
'   mx = (L/raiz(mu))^2/24 (raiz(3 + 1/mu) - 1/raiz(mu))^2 = (raiz(3,5) - raiz(0,5))^2 / 3 = 0,451416
' (conferido por varredura de c em 0 < c < 2: maximo 0,451416 em c = 1,6458).
LcMomentosOrto 4, 4, "AAAA", 2, 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "ortotropa mu=2: mx = (raiz(3,5)-raiz(0,5))^2/3", mx, (SQR(3.5) - SQR(0.5)) ^ 2 / 3, 0.000001
AssertNear "ortotropa mu=2: my = 2 mx", my, 2 * (SQR(3.5) - SQR(0.5)) ^ 2 / 3, 0.000001
AssertEq "ortotropa: tipo cruz", t, "C"
LcMomentosOrto 4, 4, "AAAA", 2, 1, 1, mx, my, x1, x2, x3, x4, t
AssertNear "ortotropa mu=1 = isotropa pL2/24", mx, 16 / 24, 0.000001
' Engastada em y (AEAE), i = 2, mu = 2: vao reduzido ly = 2*4/(2 raiz(3)) = 4/raiz(3),
' afim ly/raiz(2); a = 4/raiz(6) < b = 4: mx = a^2/24 (raiz(3 + (a/4)^2) - a/4)^2,
' my = 2 mx, X2 = X4 = i my = 4 mx.
DIM aT AS DOUBLE
aT = 4 / SQR(6)
LcMomentosOrto 4, 4, "AEAE", 2, 2, 1, mx, my, x1, x2, x3, x4, t
AssertNear "ortotropa engastada em y: mx", mx, aT * aT / 24 * (SQR(3 + (aT / 4) ^ 2) - aT / 4) ^ 2, 0.000001
AssertNear "ortotropa engastada em y: X2 = i mu mx", x2, 4 * aT * aT / 24 * (SQR(3 + (aT / 4) ^ 2) - aT / 4) ^ 2, 0.000001
AssertNear "ortotropa: bordos x apoiados sem negativo", x1 + x3, 0, 0
' LcCalculaTodas usa LcMu# da laje: 4 x 4 apoiada, h 10, p = 0,25 + 0,1 + 0,15 = 0,5
LajQtd = 1
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 4: Laj(1).h = 10: Laj(1).bordos = "AAAA": Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).vigas = "V1/V2/V3/V4"
dummy = LcMu#(1, 2)
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertNear "calculo com mu=2: mx = 0,5 (raiz(3,5)-raiz(0,5))^2/3", Laj(1).mx, 0.5 * (SQR(3.5) - SQR(0.5)) ^ 2 / 3, 0.000001
AssertNear "calculo com mu=2: my = 2 mx", Laj(1).my, (SQR(3.5) - SQR(0.5)) ^ 2 / 3, 0.000001
dummy = LcMu#(1, 1)
AssertNear "LcMu# volta a 1", LcMu#(1, 0), 1, 0

' Classe do aco: CA-50, fcd = 0,15/1,4, fyd = 5/1,15, d = 8, b = 100.
' Momento que leva a x/d = 0,5 (x = 4): Md = 0,85 fcd b 0,8 x (d - 0,4 x)
'   = 0,68 fcd 100 4 6,4 = 186,51 tf.cm  ->  m = Md / (1,4 100) = 1,3322 tf.m/m.
' Classe A: x/d lim = 0,0035/(0,0035 + fyd/Es) = 0,628 > 0,5: As = 0,68 fcd 100 x / fyd = 6,703 cm2/m.
' Classe B: x/d lim = 0,0035/(0,0035 + fyd/Es + 0,002) = 0,462 < 0,5: secao insuficiente (-1).
mT = 0.68 * fcdT * 100 * 4 * (8 - 1.6) / 140
AssertNear "LcXd# devolve x/d = 0,5", LcXd#(mT, 8, 1.4, fcdT), 0.5, 0.000001
AssertNear "classe A: As = 0,68 fcd b x / fyd", LcAs#(mT, 10, 8, 1.4, fcdT, fydT, 0.0015), 0.68 * fcdT * 100 * 4 / fydT, 0.000001
dummy = CcaAcoClasse%(1)
AssertNear "classe B: x/d 0,5 > 0,462 -> secao insuficiente", LcAs#(mT, 10, 8, 1.4, fcdT, fydT, 0.0015), -1, 0
dummy = CcaAcoClasse%(0)

' Porcentagem da linha neutra: momento com x/d = 0,4 (x = 3,2): m = 0,68 fcd 100 3,2 6,72 / 140.
' 100 %: limite 0,628, As = 0,68 fcd 100 3,2 / fyd = 5,362. 70 %: limite 0,440 > 0,4, mesmo As.
' 50 %: limite 0,314 < 0,4 -> -1.
mT = 0.68 * fcdT * 100 * 3.2 * (8 - 1.28) / 140
AssertNear "linha neutra 100%: As", LcAs#(mT, 10, 8, 1.4, fcdT, fydT, 0.0015), 0.68 * fcdT * 100 * 3.2 / fydT, 0.000001
dummy = LcLinhaNeutra#(70)
AssertNear "linha neutra 70%: x/d 0,4 < 0,440 passa", LcAs#(mT, 10, 8, 1.4, fcdT, fydT, 0.0015), 0.68 * fcdT * 100 * 3.2 / fydT, 0.000001
AssertNear "limite 70%: 0,7 x 0,0035/(0,0035 + fyd/Es)", LcXdMax#(fydT), 0.7 * 0.0035 / (0.0035 + fydT / 2100), 0.000001
dummy = LcLinhaNeutra#(50)
AssertNear "linha neutra 50%: x/d 0,4 > 0,314 -> -1", LcAs#(mT, 10, 8, 1.4, fcdT, fydT, 0.0015), -1, 0
dummy = LcLinhaNeutra#(100)

' Secao mais solicitada (colunas x/d e As da tabela de espessuras):
' 4 x 10 EAEA, i = 2, p = 1: positivo pl2/24 = 0,667 < negativo pl2/12 = 1,333.
LcMomentoCritico 4, 10, "EAEA", 2, 1, 1, mc, ng
AssertNear "critico: negativo pl2/12", mc, 16 / 12, 0.000001
AssertTrue "critico: e negativo", ng
LcMomentoCritico 4, 10, "AAAA", 2, 1, 1, mc, ng
AssertNear "critico: positivo pl2/8", mc, 2, 0.000001
AssertTrue "critico: e positivo", ng = 0

' Cortante: twu1 = 0,07 raiz(fck MPa) = 0,07 raiz(14,71) = 0,2685 MPa = 0,0027378 tf/cm2;
' twd = 1,4 x 2 tf/m / (100 cm x 8 cm) = 0,0035 tf/cm2.
AssertNear "twu1 fck 15 MPa", LcTauWu1#(0.15), 0.07 * SQR(0.15 * 98.0665) / 98.0665, 0.0000001
AssertNear "twd = gf r / (100 d)", LcTauWd#(2, 8, 1.4), 0.0035, 0.0000001
' Balanco curto e carregado: ELLL 0,8 x 5, h 10, p = 0,25 + 0,1 + 3 = 3,35 tf/m2.
' r1 = p l = 2,68 tf/m; twd = 1,4 x 2,68 / 800 = 0,00469 > 0,00274 -> aviso.
' Flexao continua igual: X1 = p l2/2 = 1,072; Md = 150,08 tf.cm; r = Md/(0,425 100 64 fcd) = 0,5150;
' x/d = 1,25 (1 - raiz(1 - r)) = 0,3795 < 0,628; As = 0,68 fcd 100 x / fyd = 5,087 cm2/m.
LajQtd = 1
Laj(1).nome = "B1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 0.8: Laj(1).ly = 5: Laj(1).h = 10: Laj(1).bordos = "ELLL": Laj(1).g = 0.1: Laj(1).q = 3: Laj(1).vigas = "V1/-/-/-"
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertNear "balanco curto: r1 = p l", Laj(1).r1, 3.35 * 0.8, 0.001
AssertTrue "cortante avisada", INSTR(msg, "Cortante") > 0
AssertTrue "so cortante, sem secao insuficiente", INSTR(msg, "Secao insuficiente") = 0
DIM rT AS DOUBLE
rT = 1.4 * 3.35 * 0.32 * 100 / (0.425 * 100 * 64 * fcdT)
AssertNear "armadura inalterada pelo aviso de cortante", Laj(1).as1, 0.68 * fcdT * 100 * 8 * 1.25 * (1 - SQR(1 - rT)) / fydT, 0.000001
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJCALC.BM'
