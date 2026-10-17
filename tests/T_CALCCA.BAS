' Teste do nucleo de concreto armado (common/CALCCA.BM).
' As verificacoes usam equilibrio e casos-limite, nao valores copiados da funcao.
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, md AS DOUBLE, b AS DOUBLE, d AS DOUBLE
DIM x AS DOUBLE, as1 AS DOUBLE, phi AS DOUBLE, s AS DOUBLE, n AS INTEGER, asw AS DOUBLE
fck = 0.15#: fcd = fck / 1.4#: fyd = 5# / 1.15#

' Laje: b=100, d=8, Mk=0.5 tf.m/m -> Md=70 tf.cm
md = 70#: b = 100#: d = 8#
x = CcaLinhaNeutra#(md, b, d, fcd, fyd)
as1 = CcaAsFlexao#(md, b, d, fcd, fyd)
AssertNear "flexao: equilibrio de forcas", 0.85# * fcd * b * 0.8# * x, as1 * fyd, 0.000001#
AssertNear "flexao: equilibrio de momentos", as1 * fyd * (d - 0.4# * x), md, 0.000001#
AssertNear "flexao: valor de referencia As=2.150 cm2/m", as1, 2.1505#, 0.001#
AssertNear "flexao: momento nulo -> As 0", CcaAsFlexao#(0, b, d, fcd, fyd), 0, 0
AssertTrue "flexao: momento acima do limite -> -1", CcaAsFlexao#(CcaMdLim#(b, d, fcd, fyd) * 1.01#, b, d, fcd, fyd) = -1
AssertTrue "flexao: momento no limite resolve", CcaAsFlexao#(CcaMdLim#(b, d, fcd, fyd) * 0.999#, b, d, fcd, fyd) > 0
AssertNear "x/d limite CA-50", CcaXdLim#(fyd), 0.0035# / (0.0035# + fyd / 2100#), 0.0000001#
AssertNear "As min 0.15% de 100x10", CcaAsMin#(100#, 10#, 0.0015#), 1.5#, 0.0000001#

' Cisalhamento: bw=20, d=45, Vd=10 tf
asw = CcaAswEstribo#(10#, 20#, 45#, fck, fcd, fyd)
' referencia manual (psi1 = 0,07 sem armadura longitudinal informada):
' twd=10/900=0.011111; tc=0.07*sqrt(14.70998)/98.0665=0.0027377
' td=1.15*0.011111-0.0027377=0.0100401; asw=0.0100401*20/4.347826*100=4.6184
AssertNear "estribo Vd=10 bw=20 d=45 (psi1 0,07)", asw, 4.6184#, 0.001#
' com As = 4,5 cm2: rho1 = 0,005 -> psi1 = 0,095; tc = 0.0037155; td = 0.0090623
' asw = 0.0090623*20/4.347826*100 = 4.1686
AssertNear "estribo com rho1 = 0,5% (psi1 0,095)", CcaAswEstriboRho#(10#, 20#, 45#, fck, fcd, fyd, 4.5#), 4.1686#, 0.001#
' rho1 = 2% daria psi1 0,17: limitado a 0,14 -> tc = 0.14*3.83536/98.0665 = 0.0054754
' td = 0.0127778 - 0.0054754 = 0.0073024; asw = 3.3591
AssertNear "estribo psi1 limitado a 0,14", CcaAswEstriboRho#(10#, 20#, 45#, fck, fcd, fyd, 18#), 3.3591#, 0.001#
AssertTrue "estribo biela esmagada -> -1", CcaAswEstribo#(100#, 20#, 45#, fck, fcd, fyd) = -1
AssertNear "estribo cortante baixo -> 0", CcaAswEstribo#(1#, 20#, 45#, fck, fcd, fyd), 0, 0
AssertNear "estribo minimo bw=20", CcaAswMin#(20#, 0.0014#), 2.8#, 0.0000001#

' Escolha de armadura
AssertNear "area barra 10mm", CcaAreaBarra#(10#), 0.785398#, 0.00001#
CcaEscolheMalha 2.1505#, 5#, 7#, 20#, phi, s
AssertTrue "malha: area fornecida >= requerida", CcaAreaBarra#(phi) * 100# / s >= 2.1505#
AssertNear "malha: phi 5 c/9", phi * 100 + s, 509#, 0
CcaEscolheBarras 7.5#, 10#, 2, 6, phi, n
AssertTrue "barras: area fornecida >= requerida", n * CcaAreaBarra#(phi) >= 7.5#
AssertNear "barras: 4 phi 16 (10mm daria 10 barras, 12.5 daria 7)", phi * 100 + n, 1604#, 0

' Estribo minimo rho_w,min (NB-1/78): 0,14% CA-50/60; 0,25% CA-25 (RECONSTRUCAO)
AssertNear "rho_w,min CA-50 = 0,14%", CcaRhoWMin#(5#), 0.0014#, 0
AssertNear "rho_w,min CA-60 = 0,14%", CcaRhoWMin#(6#), 0.0014#, 0
AssertNear "rho_w,min CA-25 = 0,25%", CcaRhoWMin#(2.5#), 0.0025#, 0

' Aco classe B (diagrama NB-1/78). CA-50, fyd = 4,347826 tf/cm2, Es = 2100:
' classe A: eyd = fyd/Es = 0,0020704 -> x/d lim = 0,0035/0,0055704 = 0,62832
' classe B: eyd = fyd/Es + 0,002 = 0,0040704 -> x/d lim = 0,0035/0,0075704 = 0,46233
AssertNear "classe A por padrao", CcaAcoClasse%(-1), 0, 0
AssertNear "x/d lim CA-50 classe A = 0,628", CcaXdLim#(fyd), 0.62832#, 0.00002#
' secao b = 20, d = 45 com x/d = 0,55 (entre 0,462 e 0,628):
' Md = 0,85 fcd b 0,8 x (d - 0,4 x) = 0,0728571 x 20 x 24,75 x 35,1 = 1265,856 tf.cm
' classe A: As = Md / (fyd (d - 0,4 x)) = 1265,856 / (4,347826 x 35,1) = 8,2948 cm2
AssertNear "classe A, x/d = 0,55: As = 8,2948", CcaAsFlexao#(1265.856#, 20#, 45#, fcd, fyd), 8.2948#, 0.0001#
n = CcaAcoClasse%(1)
AssertNear "classe B definida", CcaAcoClasse%(-1), 1, 0
AssertNear "x/d lim CA-50 classe B = 0,462", CcaXdLim#(fyd), 0.46233#, 0.00002#
AssertTrue "classe B, x/d = 0,55: armadura simples nao basta (-1)", CcaAsFlexao#(1265.856#, 20#, 45#, fcd, fyd) = -1
' diagrama B: s = 0,85 fyd -> e = 0,85 fyd/Es + 0,823 (0,15)^5 = 0,0017598 + 0,0000062 = 0,0017660
AssertNear "classe B: tensao no trecho curvo (0,85 fyd)", CcaTensaoAco#(0.85# * fyd / 2100# + 0.823# * 0.15# ^ 5, fyd), 0.85# * fyd, 0.000001#
AssertNear "classe B: trecho elastico (0,5 fyd)", CcaTensaoAco#(0.5# * fyd / 2100#, fyd), 0.5# * fyd, 0.000001#
AssertNear "classe B: escoamento so em fyd/Es + 0,002", CcaTensaoAco#(fyd / 2100# + 0.002#, fyd), fyd, 0.000001#
AssertTrue "classe B: em fyd/Es ainda abaixo de fyd", CcaTensaoAco#(fyd / 2100#, fyd) < 0.99# * fyd
AssertNear "classe B: compressao com sinal", CcaTensaoAco#(-0.01#, fyd), -fyd, 0.000001#
n = CcaAcoClasse%(0)
AssertNear "classe A: bilinear escoa em fyd/Es", CcaTensaoAco#(fyd / 2100# * 1.0001#, fyd), fyd, 0.000001#
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
