' Teste do dimensionamento de colunas do edificio (pilar/PILEDCAL.BM).
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM msg AS STRING, j AS INTEGER, mr AS DOUBLE, nd AS DOUBLE, md AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, asSo AS DOUBLE
DIM asf AS DOUBLE, ab AS DOUBLE, nfx AS INTEGER, nfy AS INTEGER, v AS DOUBLE, nc AS INTEGER
REDIM yc(1 TO 1) AS DOUBLE, acm(1 TO 1) AS DOUBLE
fcd = 0.15 / 1.4: fyd = 5 / 1.15
ColNivQtd = 1: ColQtd = 1
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 40
j = ColIdx%(1, 1)

' 1) pilar curto e pouco carregado -> armadura minima 0,5% (lambda <= 30)
ColEsf(j).N = 20: ColEsf(j).lex = 1.5: ColEsf(j).ley = 1.5
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertEq "1: sem aviso", msg, ""
AssertNear "1: armadura minima 0.5% de 800", ColEsf(j).asTot, 4, 0.000001
AssertTrue "1: barras cobrem As, numero par >= 4", ColEsf(j).nBarras * CcaAreaBarra#(ColEsf(j).phi) >= 4 AND ColEsf(j).nBarras MOD 2 = 0 AND ColEsf(j).nBarras >= 4

' Referencias dos casos 2, 6 e 7: equilibrio conferido a mao na linha neutra x dada,
' pivo B (3,5 por mil na borda, x <= h), concreto parabola-retangulo em forma fechada
' (17/21)*0,85fcd*b*x a 0,415966x da borda (0,85fcd = 0,0910714), aco classe A
' (fyd = 4,347826, eps_yd = 2,0704 por mil), concreto descontado sob barra comprimida.
' x achado por bisseccao numa planilha independente (Python), nao pelas funcoes testadas.

' 2) esbelto, so excentricidades. 20x40 (bx = 20), N = 60, le = 3 m: nd = 84.
' Direcao x (h = 20, b = 40): lambda = 3,464*300/20 = 51,96 (> 40, < 80: sem fluencia);
'   ea = 2; nu = 84/(800*0,107143) = 0,98;
'   e2 = 300^2/10 * (0,0035 + 0,0020704)/((0,98 + 0,5)*20) = 1,69370; mdx = 84*3,69370 = 310,271.
' Direcao y (h = 40): lambda 25,98 -> e2 = 0; mdy = 84*2 = 168.
' As por face (duas faces, d' = 4) na direcao x, em x = 17,0641:
'   concreto 0,809524*0,0910714*40*17,0641 = 50,3218 tf, braco 10 - 7,0981 = 2,9019 -> 146,028
'   y = 4:  eps 3,5*13,0641/17,0641 = 2,680 por mil > 2,070 -> 4,347826 - 0,091071 = 4,256755 As
'   y = 16: eps 0,2183 por mil -> 2100 eps = 0,45836; concreto 0,01879 -> 0,43957 As
'   N = 50,3218 + 4,696325 As = 84 -> As = 7,17118
'   M = 146,028 + (4,256755 - 0,43957)*7,17118*6 = 146,028 + 164,243 = 310,271 = mdx
' asTot = 2*7,17118 = 14,3424 (> 0,8% de 800 = 6,4). (Antes o caso so conferia
' MR(asTot/2) >= Md, que vale por construcao.)
' Barras: 14,3424/0,785398 = 18,26 -> 19 -> 20 phi 10 (par). Distribuicao: (20-4)/2 = 8 pares;
' asy (y, dominio 5, planilha) = 2,6076 -> ex = INT(8*7,1712/9,7788 + 0,5) = 6: nfx = 8, nfy = 4.
' MRx do arranjo (faces y = 4 e 16 com 8 ab = 6,2832; intermediarias y = 8 e 12 com 2 ab = 1,5708),
' x = 16,2522: concreto 47,9274 a 3,2396 -> 155,267; y=4: eps 2,639 -> 4,256755*6,2832 = 26,7460
'   -> 160,476; y=8: eps 1,7772 -> (3,73203 - 0,08994)*1,5708 = 5,7210 -> 11,442;
'   y=12: eps 0,9157 -> (1,92304 - 0,06430)*1,5708 = 2,9197 -> -5,839;
'   y=16: eps 0,0543 -> (0,11405 - 0,00488)*6,2832 = 0,6860 -> -4,116.
'   N = 84,000; MRx = 317,230 >= 310,271.
' Estribo: phi 10/4 < 5 -> 5 mm; s = min(30, 20, 40, 12*1,0) = 12 cm.
ColEsf(j).N = 60: ColEsf(j).lex = 3: ColEsf(j).ley = 3
PeDimensionaArranjo 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg, nfx, nfy
AssertEq "2: sem aviso", msg, ""
AssertNear "2: asTot = 2 x 7,17118 (conta a mao)", ColEsf(j).asTot, 14.34237, 0.0005
AssertTrue "2: 20 phi 10, nfx = 8, nfy = 4", ColEsf(j).nBarras = 20 AND ColEsf(j).phi = 10 AND nfx = 8 AND nfy = 4
ab = CcaAreaBarra#(10)
PeCamadasFace 20, 4, 8, 4, ab, nc, yc(), acm()
AssertTrue "2: camadas x em 4, 16, 8, 12", nc = 4 AND yc(1) = 4 AND yc(2) = 16 AND ABS(yc(3) - 8) < 0.000001 AND ABS(yc(4) - 12) < 0.000001
AssertTrue "2: areas 8 ab nas faces e 2 ab nas intermediarias", ABS(acm(1) - 8 * ab) < 0.000001 AND ABS(acm(3) - 2 * ab) < 0.000001
AssertNear "2: MRx do arranjo = 317,230 (conta a mao)", PcMRCamadas#(84, 40, 20, nc, yc(), acm(), fcd, fyd), 317.23, 0.01
AssertTrue "2: estribo 5 mm a cada 12 cm", ColEsf(j).phiEstribo = 5 AND ColEsf(j).sEstribo = 12

' 3) obliqua: com My > 0 a armadura nao diminui
ColEsf(j).N = 60: ColEsf(j).Mx = 2: ColEsf(j).My = 0
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
asSo = ColEsf(j).asTot
ColEsf(j).My = 2
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "3: obliqua exige >= que normal", ColEsf(j).asTot >= asSo - 0.000001

' 4) esbeltez excessiva e secao insuficiente
ColEsf(j).Mx = 0: ColEsf(j).My = 0: ColEsf(j).lex = 9
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "4: esbeltez > 140 avisada", INSTR(msg, "Esbeltez maxima excedida") > 0
ColEsf(j).lex = 3: ColEsf(j).N = 400
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "4: secao insuficiente avisada", INSTR(msg, "aumente a secao") > 0

' 5) circular vira quadrado de mesma area
Col(1).secao = "C": Col(1).bx = 30: ColEsf(j).N = 30: ColEsf(j).lex = 2: ColEsf(j).ley = 2
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "5: circular dimensionada", ColEsf(j).asTot > 0 AND msg = ""

' 6) item 5: obliqua com o arranjo real. 30x40 (bx = 30, by = 40), N = 40 tf, Mx = My = 2 t.m,
' le = 1,5 m (lambda 17,3 e 13: sem e2), ea = 2: mdx = mdy = 1,4*200 + 56*2 = 392 tf.cm.
' Minima 0,5% de 1200 = 6 cm2 (lambda <= 30) -> 6/0,785398 = 7,6 -> 8 phi 10, cantos + 1
' por face (nfx = nfy = 3; asx = asy, flexao normal sem aco). Conta a mao, nd = 56:
'   x (h = 30, b = 40): faces y = 4 e 26 com 3 ab = 2,3562; intermediaria y = 15 com 1,5708.
'     x = 17,7405: concreto 0,809524*0,0910714*40*17,7405 = 52,3164 a 7,3795 -> braco 7,6205
'     -> 398,679; y=4: eps 2,711 -> 4,256755*2,3562 = 10,0297 -> 110,327;
'     y=26: eps -1,6295 -> -3,42195*2,3562 = -8,0628 -> 88,691; y=15: eps 0,5407 ->
'     (1,13541 - 0,04258)*1,5708 = 1,7166, braco 0. N = 56,000; MRx = 597,697.
'   y (h = 40, b = 30): faces y = 4 e 36 com 2,3562; intermediaria y = 20 com 1,5708.
'     x = 23,9172: concreto 52,8985 -> 531,696; y=4: 10,0297 -> 160,476;
'     y=36: eps -1,7682 -> -3,71316*2,3562 = -8,7489 -> 139,983; y=20: 1,8207, braco 0.
'     N = 56,000; MRy = 832,155.
'   indice = (392/597,697)^1,2 + (392/832,155)^1,2 = 0,6028 + 0,4052 = 1,008 > 1: nao passa.
' Proxima tentativa: 8*0,785398 + 0,01 = 6,293 -> 9 -> 10 phi 10; 3 pares: nfx = 4, nfy = 3.
'   x: faces com 4 ab = 3,1416, intermediaria y = 15: x = 17,6192, concreto 51,9588 -> 398,575;
'     y=4: 13,3730 -> 147,103; y=26: eps -1,6648 -> -3,49610*3,1416 = -10,9833 -> 120,817;
'     y=15: 1,6516. MRx = 666,495.
'   y: faces com 3 ab, intermediarias y = 14,667 e 25,333 com 1,5708: x = 23,4745,
'     concreto 51,9193 -> 531,415; y=4: 160,476; y=36: -9,2406 -> 147,849;
'     y=14,667: eps 1,3132 -> 4,2057 -> 22,431; y=25,333: eps -0,2772 -> -0,9142 -> 4,876.
'     MRy = 867,047.
'   indice = (392/666,495)^1,2 + (392/867,047)^1,2 = 0,5289 + 0,3857 = 0,915 <= 1: passa.
Col(1).secao = "R": Col(1).bx = 30: Col(1).by = 40
ColEsf(j).N = 40: ColEsf(j).Mx = 2: ColEsf(j).My = 2: ColEsf(j).lex = 1.5: ColEsf(j).ley = 1.5
nd = 56: md = 392
PeCamadasFace 30, 4, 3, 3, ab, nc, yc(), acm()
AssertNear "6: 8 phi 10, MRx = 597,697 (conta a mao)", PcMRCamadas#(nd, 40, 30, nc, yc(), acm(), fcd, fyd), 597.697, 0.01
PeCamadasFace 40, 4, 3, 3, ab, nc, yc(), acm()
AssertNear "6: 8 phi 10, MRy = 832,155 (conta a mao)", PcMRCamadas#(nd, 30, 40, nc, yc(), acm(), fcd, fyd), 832.155, 0.01
AssertTrue "6: arranjo 3 x 3 (indice 1,008) recusado", PeArranjoOk%(nd, md, md, -1, 30, 40, 4, 3, 3, ab, fcd, fyd) = 0
PeDimensionaArranjo 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg, nfx, nfy
AssertEq "6: sem aviso", msg, ""
AssertTrue "6: 10 phi 10, nfx = 4, nfy = 3", ColEsf(j).nBarras = 10 AND ColEsf(j).phi = 10 AND nfx = 4 AND nfy = 3
AssertNear "6: asTot = 10 x 0,785398", ColEsf(j).asTot, 7.853982, 0.000001
PeCamadasFace 30, 4, 4, 3, ab, nc, yc(), acm()
AssertTrue "6: camadas x em 4, 26, 15 com 4 ab, 4 ab, 2 ab", nc = 3 AND yc(2) = 26 AND ABS(yc(3) - 15) < 0.000001 AND ABS(acm(1) - 4 * ab) < 0.000001 AND ABS(acm(3) - 2 * ab) < 0.000001
AssertNear "6: 10 phi 10, MRx = 666,495 (conta a mao)", PcMRCamadas#(nd, 40, 30, nc, yc(), acm(), fcd, fyd), 666.495, 0.01
PeCamadasFace 40, 4, 3, 4, ab, nc, yc(), acm()
AssertTrue "6: camadas y em 4, 36, 14,667, 25,333", nc = 4 AND ABS(yc(3) - 14.666667) < 0.00001 AND ABS(yc(4) - 25.333333) < 0.00001
AssertNear "6: 10 phi 10, MRy = 867,047 (conta a mao)", PcMRCamadas#(nd, 30, 40, nc, yc(), acm(), fcd, fyd), 867.047, 0.01
AssertTrue "6: arranjo 4 x 3 (indice 0,915) aceito", PeArranjoOk%(nd, md, md, -1, 30, 40, 4, 4, 3, ab, fcd, fyd) = -1
' distribuicao de 8 barras sem preferencia: cantos + 1 por face
PeArranjo 8, 1, 1, 30, 40, nfx, nfy
AssertTrue "6: PeArranjo 8 barras -> 3 por face", nfx = 3 AND nfy = 3
PeArranjo 8, 1, 0, 30, 40, nfx, nfy
AssertTrue "6: so asx -> pares extras nas faces de x", nfx = 4 AND nfy = 2

' 7) item 7: tracao. 20x40 (bx = 20), N = -10 tf, Mx = 2 t.m: nd = -14; mdx = 1,4*200 = 280
' (sem ea/e2; antes 280 + (-14)*2 = 252, reduzido pela tracao). As por face na direcao x
' (h = 20, b = 40, d' = 4), em x = 4,1600 (dominio 3: x > 0,259*16 = 4,148; pivo B):
'   concreto 0,809524*0,0910714*40*4,16 = 12,2678 tf, braco 10 - 1,7304 = 8,2696 -> 101,450
'   y = 4:  eps 3,5*0,16/4,16 = 0,1346 por mil -> 0,28273 - 0,01185 = 0,27088 As
'   y = 16: eps -9,961 por mil -> -4,347826 As
'   N = 12,2678 + (0,27088 - 4,347826) As = -14 -> As = 26,2678/4,076946 = 6,44302
'   M = 101,450 + (0,27088 + 4,347826)*6,44302*6 = 101,450 + 178,550 = 280,000
' asTot = 2*6,44302 = 12,8860 (> 6,4). Barras: 12,886/0,785398 = 16,4 -> 17 -> 18 phi 10.
' asy (tracao centrada) = 14/(2*4,347826) = 1,61 -> ex = INT(7*6,443/8,053 + 0,5) = 6:
' nfx = 8, nfy = 3. MRx do arranjo (8 ab = 6,2832 em y = 4 e 16, 2 ab em y = 10), x = 4,6702:
'   concreto 13,7722 -> 110,968; y=4: eps 0,5022 -> (1,05470 - 0,04000)*6,2832 = 6,3756 -> 38,253;
'   y=16: -27,3182 -> 163,909; y=10: eps -3,994 -> -6,8295, braco 0. N = -14; MRx = 313,130.
Col(1).bx = 20: Col(1).by = 40
ColEsf(j).N = -10: ColEsf(j).Mx = 2: ColEsf(j).My = 0: ColEsf(j).lex = 3: ColEsf(j).ley = 3
PeDimensionaArranjo 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg, nfx, nfy
AssertEq "7: sem aviso", msg, ""
AssertNear "7: tracao: asTot = 2 x 6,44302 (conta a mao)", ColEsf(j).asTot, 12.88604, 0.0005
AssertTrue "7: 18 phi 10, nfx = 8, nfy = 3", ColEsf(j).nBarras = 18 AND ColEsf(j).phi = 10 AND nfx = 8 AND nfy = 3
PeCamadasFace 20, 4, 8, 3, ab, nc, yc(), acm()
AssertNear "7: MRx do arranjo (Nd = -14) = 313,130 (conta a mao)", PcMRCamadas#(-14, 40, 20, nc, yc(), acm(), fcd, fyd), 313.13, 0.01

' 8) item 10: fluencia e lambda maximo do INI (PeParam#). Padrao lim80 = 80, lim140 = 140,
' Mult. Fluencia 1,1. Fator = maior entre Mult. e a rampa 1 + 0,25 (lambda - 80)/60.
AssertNear "8: fluencia lambda 80 = 1", PeFluencia#(80), 1, 0.000001
AssertNear "8: fluencia lambda 90 = max(1,1; 1,0417) = 1,1", PeFluencia#(90), 1.1, 0.000001
AssertNear "8: fluencia lambda 110 = 1 + 0,25*30/60 = 1,125", PeFluencia#(110), 1.125, 0.000001
AssertNear "8: fluencia lambda 140 = 1,25", PeFluencia#(140), 1.25, 0.000001
v = PeParam#(3, 1.2): v = PeParam#(1, 60)
AssertNear "8: lim80 = 60, Mult 1,2: lambda 70 -> 1,2", PeFluencia#(70), 1.2, 0.000001
AssertNear "8: lim80 = 60: lambda 59 -> 1", PeFluencia#(59), 1, 0.000001
v = PeParam#(2, 50)
ColEsf(j).N = 60: ColEsf(j).Mx = 0: ColEsf(j).lex = 3: ColEsf(j).ley = 3
PeDimensiona 1, 1, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "8: lim140 = 50 recusa lambda 52", INSTR(msg, "Esbeltez maxima excedida") > 0
v = PeParam#(1, 80): v = PeParam#(2, 140): v = PeParam#(3, 1.1)
TestEnd

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILCALC.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILEDCAL.BM'
