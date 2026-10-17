' Teste do calculo de pilares (pilar/PILCALC.BM).
' Referencias calculadas a mao (contas no comentario) ou por integracao numerica
' independente (Python: faixas de ponto medio na parabola-retangulo, deformacoes pela
' regra dos pivos escritas de novo), nunca copiadas da funcao.
' Nucleo atual: parabola-retangulo 0,85 fcd, pivos A/B/C, concreto descontado sob as
' barras comprimidas. Os valores antigos (retangulo 0,8x, dominio 5 por reta, sem
' desconto) mudaram e estao anotados como "antes".
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, fcd30 AS DOUBLE, fyd50 AS DOUBLE
DIM n AS DOUBLE, m AS DOUBLE, mr AS DOUBLE, as1 AS DOUBLE, asm AS DOUBLE
DIM b AS DOUBLE, h AS DOUBLE, dl AS DOUBLE, nd AS DOUBLE, md AS DOUBLE, cl AS INTEGER
DIM nc AS INTEGER, i AS INTEGER, k AS INTEGER, mOld AS DOUBLE
REDIM yc(1 TO 1) AS DOUBLE, ac(1 TO 1) AS DOUBLE
DIM tabNu(1 TO 5) AS DOUBLE, tabMu(1 TO 5) AS DOUBLE, tabAs(1 TO 5) AS DOUBLE

fck = 0.15#: fcd = fck / 1.4#: fyd = 5# / 1.15#
b = 20#: h = 50#: dl = 4#
cl = CcaAcoClasse%(0)

' Esbeltez e excentricidades
AssertNear "esbeltez 300/20", PcEsbeltez#(300#, 20#), 51.96#, 0.0001#
AssertNear "ea minima 2 cm para h=20", PcExcAcidental#(20#), 2#, 0.0001#
AssertNear "ea = h/30 para h=90", PcExcAcidental#(90#), 3#, 0.0001#
AssertNear "e2 nula para lambda <= 40", PcE2#(100#, 20#, 10#, 400#, fcd, fyd), 0#, 0.0000001#
' nu = 10/(400*0.107143) = 0.2333; nu + 0,5 = 0,733 < 1 -> usa 1 (NB-1/78)
' e2 = 300^2/10 * (0.0035 + 4.347826/2100) / (1 * 20) = 2.50668
AssertNear "e2 lambda 52, nd=10, Ac=400 (nu+0,5 limitado a 1)", PcE2#(300#, 20#, 10#, 400#, fcd, fyd), 2.50668#, 0.0001#

' Tensao do aco classe A: linear ate fyd
AssertNear "aco A: eps 0.002 -> 4.2 tf/cm2", PcTensaoAco#(0.002#, fyd), 4.2#, 0.0001#
AssertNear "aco A: eps 0.010 limitado a fyd", PcTensaoAco#(0.01#, fyd), fyd, 0.0000001#
AssertNear "aco A: compressao negativa limitada a -fyd", PcTensaoAco#(-0.01#, fyd), -fyd, 0.0000001#

' Capacidade axial centrada, concreto descontado na area do aco:
' 0.85*0.107143*(400-10) + 10*4.2 = 35.518 + 42 = 77.518 (antes 78.429, sem desconto)
AssertNear "Nmax centrada 400 cm2, As=10 (concreto descontado)", PcNmaxAxial#(400#, fcd, 10#, fyd), 77.51785714#, 0.00001#

' --- Deformacoes pela regra dos pivos (h = 50, d = 46) ---
' dominio 2, x = 5: eps(d) = -10 por mil; eps(0) = 0.010*5/41 = 0.00121951
AssertNear "pivo A: x=5, eps(d) = -10 por mil", PcDeformacao#(5#, 46#, 50#, 46#), -0.01#, 0.0000001#
AssertNear "pivo A: x=5, eps(0) = 0,010*5/41", PcDeformacao#(5#, 0#, 50#, 46#), 0.00121951#, 0.00001#
' dominio 4a, x = h: eps(0) = 3,5 por mil, eps(h) = 0
AssertNear "pivo B: x=h, eps(0) = 3,5 por mil", PcDeformacao#(50#, 0#, 50#, 46#), 0.0035#, 0.0000001#
' dominio 5, x = 60: eps(y) = 0.002*(60-y)/(60-150/7); em y = 3h/7 = 21.4286 vale 2 por mil;
' borda: 0.002*60/38.5714 = 0.00311111; base: 0.002*10/38.5714 = 0.00051852
AssertNear "pivo C: x=60, 2 por mil em 3h/7", PcDeformacao#(60#, 150# / 7#, 50#, 46#), 0.002#, 0.0000001#
AssertNear "pivo C: x=60, borda", PcDeformacao#(60#, 0#, 50#, 46#), 0.00311111#, 0.00001#
AssertNear "pivo C: x=60, base", PcDeformacao#(60#, 50#, 50#, 46#), 0.00051852#, 0.0001#
AssertNear "pivo C: x -> infinito, 2 por mil uniforme", PcDeformacao#(1000000#, 50#, 50#, 46#), 0.002#, 0.0001#

' --- Flexao simples (N = 0), 20x50, As1 = 5 cm2 em d = 46, sem As2 ---
' Dominio 3 (eps_c = 3,5 por mil): resultante da parabola-retangulo = (17/21)*0.85*fcd*b*x
' = 1.4744898 x a 0.415966x (99/238) da borda. Aco escoa: T = 5*4.347826 = 21.739130.
' x = 21.739130/1.4744898 = 14.74349 > 0.259*46 = 11.926 (dominio 3 ok);
' eps_s = 3.5*(46-14.743)/14.743 = 7.42 por mil > eps_yd.
' M (centro) = 21.73913*(25 - 0.415966*14.74349) + 21.73913*21 = 21.73913*39.86737 = 866.68
' (antes, retangulo 0,8x: 870.27)
CALL PcNMdeX(14.74349#, b, h, dl, 5#, 0#, fcd, fyd, n, m)
AssertNear "NMdeX dominio 3: N = 0 em x = 14.743", n, 0#, 0.001#
AssertNear "NMdeX dominio 3: M = 866.68 (conta a mao)", m, 866.68#, 0.0001#
mr = PcMRparaN#(0#, b, h, dl, 5#, 0#, fcd, fyd)
AssertNear "MRparaN: N=0 -> MR = 866.68", mr, 866.68#, 0.0002#
AssertNear "dimensionamento cruzado: As para MR=866.68 ~ 5 cm2", CcaAsFlexao#(866.68#, b, 46#, fcd, fyd), 5#, 0.05#

' --- Dominio 5 (item 1): x = 60 = 1,2h, As1 = As2 = 5 cm2, pivo C ---
' eps(y) = 0.002*(60-y)/38.5714 (ver acima).
' Barra y=4: eps = 0.0029037 > eps_yd -> fyd; desconta 0.85fcd = 0.0910714:
'   5*(4.347826 - 0.091071) = 21.28377 tf, braco 21.
' Barra y=46: eps = 0.00072593 -> 2100*eps = 1.524444; concreto no ponto
'   0.0910714*(1-(1-0.362963)^2) = 0.054113 -> 5*(1.524444-0.054113) = 7.35166 tf, braco -21.
' Concreto: patamar y 0..21.4286: 0.0910714*20*21.4286 = 39.0306 tf, braco 14.2857 -> 557.58.
'   parabola y 21.4286..50, u = eps/0.002 de 1 a 0.259259, y = 60 - 38.5714u:
'   N = 20*0.0910714*38.5714*[u^2 - u^3/3] = 70.2551*0.605261 = 42.5227 tf;
'   M = 70.2551*(-35*0.605261 + 38.5714*[2u^3/3 - u^4/4]) = 70.2551*(-21.18414 + 15.66686) = -387.62.
' N = 39.0306 + 42.5227 + 21.28377 + 7.35166 = 110.1887 tf
' M = 557.58 - 387.62 + (21.28377 - 7.35166)*21 = 169.96 + 292.57 = 462.53 tf.cm
' (integracao numerica independente: 110.18865 e 462.5425)
CALL PcNMdeX(60#, b, h, dl, 5#, 5#, fcd, fyd, n, m)
AssertNear "NMdeX dominio 5 (pivo C): N = 110.189", n, 110.18865#, 0.0001#
AssertNear "NMdeX dominio 5 (pivo C): M = 462.54", m, 462.5425#, 0.0002#
' Antes (dominio 5 por reta ate Nmax, sem desconto): 488.80, 5,7% contra a seguranca
mr = PcMRparaN#(110.18865#, b, h, dl, 5#, 5#, fcd, fyd)
AssertNear "MRparaN dominio 5: MR(110.19) = 462.54", mr, 462.5425#, 0.001#

' Compressao acima da capacidade axial -> -1
AssertNear "MRparaN: nd acima de Nmax -> -1", PcMRparaN#(140#, b, h, dl, 5#, 5#, fcd, fyd), -1#, 0#

' --- Item 1: flexao normal com nu alto (0,65 a 0,9), 20x50, d' = 4, C30, CA-50A ---
' fck = 30 MPa = 0.305915 tf/cm2, fyk = 500 MPa = 5.098581 tf/cm2; nd = nu*b*h*fcd,
' md = mu*b*h^2*fcd. As total = 2 x por face. Referencia: integracao numerica
' independente do revisor (script Python fora do repositorio: fibras, parabola-retangulo, pivos A/B/C,
' concreto descontado), conferida por outra integracao (faixas) a 0,2%. Antes (V1):
' 3.47 / 17.79 / 9.67 / 14.62 / 27.34 (ate 23% a menos).
fcd30 = 30# / 98.0665# / 1.4#: fyd50 = 500# / 98.0665# / 1.15#
tabNu(1) = 0.65#: tabMu(1) = 0.1#: tabAs(1) = 4.52#
tabNu(2) = 0.65#: tabMu(2) = 0.2#: tabAs(2) = 19.04#
tabNu(3) = 0.8#: tabMu(3) = 0.1#: tabAs(3) = 11#
tabNu(4) = 0.9#: tabMu(4) = 0.1#: tabAs(4) = 15.86#
tabNu(5) = 0.9#: tabMu(5) = 0.2#: tabAs(5) = 29.33#
FOR i = 1 TO 5
    nd = tabNu(i) * b * h * fcd30: md = tabMu(i) * b * h * h * fcd30
    asm = PcAsMinCentrado#(nd, md, b, h, dl, fcd30, fyd50)
    AssertNear "nu alto: As total nu=" + STR$(tabNu(i)) + " mu=" + STR$(tabMu(i)), 2# * asm, tabAs(i), 0.02#
NEXT

' Armadura minima centrada: a area achada atinge o momento e a area menor nao.
asm = PcAsMinCentrado#(20#, 500#, b, h, dl, fcd, fyd)
AssertTrue "AsMinCentrado: area atinge MR >= Md", PcMRparaN#(20#, b, h, dl, asm, asm, fcd, fyd) >= 499.9#
AssertTrue "AsMinCentrado: area menor nao atinge", PcMRparaN#(20#, b, h, dl, asm * 0.98#, asm * 0.98#, fcd, fyd) < 500#
AssertNear "AsMinCentrado: Md inatingivel -> -1", PcAsMinCentrado#(20#, 1000000#, b, h, dl, fcd, fyd), -1#, 0#

' --- Item 3: flexo-tracao, As1 = As2 = 5, Nd = -40 tf ---
' Dominio 1 (pivo A): barra inferior a 10 por mil, sigma = fyd -> 21.73913 tf.
' Barra superior: 40 - 21.73913 = 18.26087 tf -> sigma = 3.652174 (eps = 1.739 por mil < eps_yd).
' Linha neutra: eps(y) = -1.739 - 8.261*(y-4)/42 por mil zera em y = -4.842 < 0 (toda tracionada).
' M = (21.73913 - 18.26087)*21 = 73.043 tf.cm (antes: MR com N = 0 = 923.1, 12x maior)
AssertNear "flexo-tracao: MR(Nd = -40) = 73.043", PcMRparaN#(-40#, b, h, dl, 5#, 5#, fcd, fyd), 73.04348#, 0.001#
AssertNear "flexo-tracao: alem de -As*fyd -> -1", PcMRparaN#(-44#, b, h, dl, 5#, 5#, fcd, fyd), -1#, 0#
AssertTrue "flexo-tracao: MR(-20) < MR(0)", PcMRparaN#(-20#, b, h, dl, 5#, 5#, fcd, fyd) < PcMRparaN#(0#, b, h, dl, 5#, 5#, fcd, fyd)

' --- Item 4: barras laterais na posicao real. 20x60, c' = 4, 2 barras em cima, 2 em
' baixo, 2 laterais por lado centradas (y = 4 + 52/3 = 21.333 e 38.667), area 2.0 cada.
' Camadas (Mx): y=4: 4 cm2; 21.333: 4; 38.667: 4; 56: 4.
' N = 0: dominio 3 (x23 = 0.259*56 = 14.52). Concreto 1.4744898 x a 0.415966x.
'   x = 17.0504: y=4: eps 2.68 por mil -> (4.347826-0.091071)*4 = 17.0270 (comp.)
'   y=21.333: eps = 3.5*(17.0504-21.3333)/17.0504 = -0.879 por mil -> -1.846285*4 = -7.3851
'   y=38.667 e 56: escoam -> -17.3913 cada. Concreto 1.4744898*17.0504 = 25.1407.
'   N = 25.1407 + 17.0270 - 7.3851 - 2*17.3913 = 0.
'   M = 25.1407*(30-7.0924) + 17.0270*26 - 7.3851*8.6667 + 17.3913*8.6667 + 17.3913*26
'     = 575.91 + 442.70 - 64.00 + 150.72 + 452.17 = 1557.51 tf.cm
' Antes (laterais somadas as faces: 8 cm2 em y=4 e 8 em y=56): 1810.32, 16% a mais.
PcCamadasRet 1, 20#, 60#, 4#, 2, 2, 2, 0#, 0#, 2#, nc, yc(), ac()
AssertTrue "laterais: 8 camadas (uma por barra: 2+2+2x2)", nc = 8
mr = PcMRDoisSentidos#(0#, 20#, 60#, nc, yc(), ac(), fcd, fyd)
AssertNear "laterais na posicao real: MRx(N=0) = 1557.51", mr, 1557.51#, 0.0002#
mOld = PcMRparaN#(0#, 20#, 60#, 4#, 8#, 8#, fcd, fyd)
AssertTrue "laterais: MR real < MR com laterais nas faces", mr < mOld * 0.9#
AssertNear "PcYLateral: 1a lateral centrada em 4 + 52/3", PcYLateral#(1, 2, 60#, 4#, 0#, 0#), 21.33333#, 0.00001#
' direcao y (altura 20): todas as barras em x = 4 ou 16 -> 8 cm2 em cada face, igual a antes
PcCamadasRet 2, 20#, 60#, 4#, 2, 2, 2, 0#, 0#, 2#, nc, yc(), ac()
AssertNear "laterais: MRy = duas faces de 8 cm2", PcMRDoisSentidos#(0#, 60#, 20#, nc, yc(), ac(), fcd, fyd), PcMRparaN#(0#, 60#, 20#, 4#, 8#, 8#, fcd, fyd), 0.000001#

' Flexao obliqua: com mxd = MRx/2 e myd = 0, o indice vale 0.5^1.2.
mr = PcMRparaN#(0#, b, h, dl, 5#, 5#, fcd, fyd)
AssertNear "obliqua: indice com mxd = MR/2", PcIndiceObliquo#(0#, mr / 2#, 0#, b, h, dl, 5#, fcd, fyd), 0.5# ^ 1.2#, 0.0001#
AssertNear "obliqua: indice sem momento = 0", PcIndiceObliquo#(0#, 0#, 0#, b, h, dl, 5#, fcd, fyd), 0#, 0.0000001#
AssertNear "obliqua: nd acima de Nmax -> 99", PcIndiceObliquo#(140#, 10#, 0#, b, h, dl, 5#, fcd, fyd), 99#, 0#
asm = PcAsMinObliquo#(0#, mr * 0.5#, 0#, b, h, dl, fcd, fyd)
AssertTrue "AsMinObliquo: area atende o indice", PcIndiceObliquo#(0#, mr * 0.5#, 0#, b, h, dl, asm, fcd, fyd) <= 1.001#
AssertNear "AsMinObliquo: momento inatingivel -> -1", PcAsMinObliquo#(0#, 1000000#, 0#, b, h, dl, fcd, fyd), -1#, 0#

' --- Item 2: aco classe B (NB-1/78): eps = s/Es + 0,823 (s/fyd - 0,7)^5 acima de 0,7 fyd ---
cl = CcaAcoClasse%(1)
' elastico abaixo de 0,7 fyd = 3.0435: eps 0.001 -> 2.1
AssertNear "aco B: eps 0.001 -> 2.1 (elastico)", PcTensaoAco#(0.001#, fyd), 2.1#, 0.000001#
' s = 0,9 fyd = 3.913043: eps = 3.913043/2100 + 0.823*0.2^5 = 0.00186335 + 0.00026336 = 0.00212671
AssertNear "aco B: eps 0.00212671 -> 0,9 fyd", PcTensaoAco#(0.00212671#, fyd), 3.913043#, 0.00001#
AssertNear "aco B: compressao simetrica", PcTensaoAco#(-0.00212671#, fyd), -3.913043#, 0.00001#
' fyd so em eps = fyd/Es + 0,002 = 0.0040704
AssertNear "aco B: eps 0.0041 -> fyd", PcTensaoAco#(0.0041#, fyd), fyd, 0.0000001#
AssertTrue "aco B: eps 0.003 < fyd (A ja escoou)", PcTensaoAco#(0.003#, fyd) < fyd * 0.999#
' Nmax: sigma(2 por mil) = 3.84103 (bisseccao independente) -> 0.0910714*390 + 38.4103 = 73.928
AssertNear "aco B: Nmax 400 cm2, As=10", PcNmaxAxial#(400#, fcd, 10#, fyd), 73.92817#, 0.0001#
' e2 com eps_yd = fyd/Es + 0,002: 300^2/10*(0.0035+0.0040704)/20 = 3.40668
AssertNear "aco B: e2 com eps_yd + 2 por mil", PcE2#(300#, 20#, 10#, 400#, fcd, fyd), 3.40668#, 0.0001#
' flexo-compressao com aco B pede mais armadura que com A (nu = 0,7, mu = 0,15, C15;
' integracao independente: por face A 3.3771, B 3.4833 cm2; total 6.7541 e 6.9666)
nd = 0.7# * b * h * fcd: md = 0.15# * b * h * h * fcd
AssertNear "aco B: As total nu 0,7 mu 0,15", 2# * PcAsMinCentrado#(nd, md, b, h, dl, fcd, fyd), 6.9666#, 0.005#
cl = CcaAcoClasse%(0)
AssertNear "aco A: As total nu 0,7 mu 0,15", 2# * PcAsMinCentrado#(nd, md, b, h, dl, fcd, fyd), 6.7541#, 0.005#

TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILCALC.BM'
