' Teste do predimensionamento de secao e do resumo da fundacao (pilar/PILPRED.BM).
' Valores esperados por conta a mao. Fck = 0,15 tf/cm2: tensao (1) = 0,6 Fck = 0,09;
' tensao (2) = 0,75 Fck = 0,1125 tf/cm2. Medida minima 14 e multiplo 5: primeira 15 cm.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM fck AS DOUBLE, bx AS DOUBLE, by AS DOUBLE, ok AS INTEGER, s1 AS DOUBLE, s2 AS DOUBLE, k1 AS INTEGER, k2 AS INTEGER
DIM nMax AS DOUBLE, ppB AS DOUBLE, nB AS DOUBLE, z AS DOUBLE, v AS DOUBLE, carga AS DOUBLE, pp AS DOUBLE, fund AS DOUBLE
DIM k AS INTEGER, n AS INTEGER, j AS INTEGER
DIM lista(1 TO 30) AS INTEGER
DIM nivIni(1 TO 20) AS INTEGER, tipo(1 TO 20) AS STRING, bFix(1 TO 20) AS DOUBLE, hFix(1 TO 20) AS DOUBLE
DIM ex(1 TO 20) AS DOUBLE, ey(1 TO 20) AS DOUBLE, rbx(1 TO 20) AS DOUBLE, rby(1 TO 20) AS DOUBLE, rok(1 TO 20) AS INTEGER
DIM rs1(1 TO 20) AS DOUBLE, rk1(1 TO 20) AS INTEGER, rs2(1 TO 20) AS DOUBLE, rk2(1 TO 20) AS INTEGER, rn(1 TO 20) AS DOUBLE
fck = 0.15: z = 0

' 1) tensao admissivel e medida minima
AssertNear "1: 0,6 * 0,15", PpTensaoAdm#(0.6, 0.15), 0.09, 0.0000001
AssertNear "1: valor negativo e a propria tensao", PpTensaoAdm#(-0.08, 0.15), 0.08, 0.0000001
AssertNear "1: minima 14 multiplo 5 -> 15", PpMedidaMinima#(14, 5), 15, 0.0000001
AssertNear "1: minima 20 multiplo 5 -> 20", PpMedidaMinima#(20, 5), 20, 0.0000001
AssertNear "1: multiplo 0 -> a propria minima", PpMedidaMinima#(14, 0), 14, 0.0000001

' coluna de 1 nivel, pe-direito 3 m, le = 3 m
ColNivQtd = 1: ColQtd = 1
ColNiv(1).nome = "TERREO": ColNiv(1).peDireito = 3
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 30
j = ColIdx%(1, 1)
ColEsf(j).N = 100: ColEsf(j).Mx = 0: ColEsf(j).My = 0: ColEsf(j).lex = 3: ColEsf(j).ley = 3

' 2) compressao, sem peso proprio: A >= 100/0,09 = 1111,1 cm2; bx = 20 -> by >= 55,6 -> 60
v = PpParam#(6, 0, -1)
PpTrecho 1, 1, 1, "R", 20, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertTrue "2: atende", ok
AssertNear "2: bx dado", bx, 20, 0.0000001
AssertNear "2: by = 60", by, 60, 0.0000001
AssertNear "2: sig1 = 100/1200", s1, 100 / 1200, 0.0000001
AssertNear "2: N = 100 (N do .COL)", nMax, 100, 0.0000001

' 3) com peso proprio (2,5 t/m3): o .COL ja tem 0,06 m2 * 3 m * 2,5 = 0,45 tf do PILGEEDI.
' by = 55: pp 0,11*3*2,5 = 0,825; N = 99,55 + 0,825 = 100,375; 100,375/1100 = 0,09125 > 0,09.
' by = 60: pp 0,9; N = 100,45; 100,45/1200 = 0,0837 <= 0,09.
v = PpParam#(6, 1, -1): v = PpParam#(7, 2.5, -1)
AssertNear "3: peso do PILGEEDI 0,45", PpPesoGeedi#(1, 1), 0.45, 0.0000001
AssertNear "3: carga sem pp 99,55", PpCargaSemPP#(1, 1), 99.55, 0.0000001
PpTrecho 1, 1, 1, "R", 20, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertNear "3: by = 60", by, 60, 0.0000001
AssertNear "3: N = 100,45", nMax, 100.45, 0.0000001
AssertNear "3: pp na base 0,9", ppB, 0.9, 0.0000001
v = PpParam#(6, 0, -1)

' 4) Mx = 2 tf.m flete na direcao de bx = 20: Wx = by*400/6.
' sig2 = 40/(20h) + 200*6/(400h) = 2/h + 3/h = 5/h <= 0,1125 -> h >= 44,4 -> 45 (h = 40: 0,125)
ColEsf(j).N = 40: ColEsf(j).Mx = 2: ColEsf(j).My = 0
PpTrecho 1, 1, 1, "R", 20, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertTrue "4: atende", ok
AssertNear "4: by = 45", by, 45, 0.0000001
AssertNear "4: sig2 = 5/45", s2, 5 / 45, 0.0000001

' 5) My = 2 tf.m flete na direcao de by: Wy = 20 h^2/6.
' sig2 = 2/h + 60/h^2: h = 30 -> 0,1333; h = 35 -> 0,0571 + 0,0490 = 0,1061 <= 0,1125
ColEsf(j).Mx = 0: ColEsf(j).My = 2
PpTrecho 1, 1, 1, "R", 20, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertNear "5: by = 35", by, 35, 0.0000001
AssertNear "5: sig2 = 2/35 + 60/1225", s2, 2 / 35 + 60 / 1225, 0.0000001

' 6) circular, N = 100: D = 35 -> A = 962,1 -> 0,1039 > 0,09; D = 40 -> A = 1256,6 -> 0,0796
ColEsf(j).N = 100: ColEsf(j).My = 0
PpTrecho 1, 1, 1, "C", 0, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertTrue "6: atende", ok
AssertNear "6: D = 40", bx, 40, 0.0000001
AssertNear "6: sig1 = 100/(pi*1600/4)", s1, 100 / (3.14159265358979# * 400), 0.0000001

' 7) secao toda dada e insuficiente: 20x20, N = 100 -> 100/400 = 0,25 > 0,09
PpTrecho 1, 1, 1, "R", 20, 20, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertTrue "7: nao atende", NOT ok
AssertNear "7: medidas mantidas", bx + by, 40, 0.0000001
AssertNear "7: sig1 = 0,25", s1, 0.25, 0.0000001

' 8) esbeltez: N = 1 tf, le = 10 m, quadrada: 3,464*1000/a <= 140 -> a >= 24,74 -> 25
ColEsf(j).N = 1: ColEsf(j).lex = 10: ColEsf(j).ley = 10
PpTrecho 1, 1, 1, "R", 0, 0, fck, z, z, z, bx, by, ok, s1, k1, s2, k2, nMax, ppB, nB
AssertNear "8: lado 25 pelo lambda maximo 140", bx, 25, 0.0000001
AssertNear "8: quadrada", by, 25, 0.0000001

' 9) duas secoes. Nivel 1 (topo) N = 20; nivel 2 N = 60; le = 3 m; sem peso proprio.
' Secao 2 (nivel 1), quadrada: 20/225 = 0,0889 <= 0,09 -> 15x15 (lambda 69,3).
' Secao 1 (nivel 2), bx = 20, CG da de cima a Ex = 10 cm: Mx = 20 * 0,10 = 2 tf.m.
' sig2 = 60/(20h) + 200*6/(400h) = 3/h + 3/h = 6/h <= 0,1125 -> h >= 53,3 -> 55.
' Sem Ex: 3/h <= 0,09 -> h >= 33,3 -> 35.
ColNivQtd = 2
ColNiv(2).nome = "SUBSOLO": ColNiv(2).peDireito = 3
ColEsf(ColIdx%(1, 1)).N = 20: ColEsf(ColIdx%(1, 1)).Mx = 0: ColEsf(ColIdx%(1, 1)).My = 0
ColEsf(ColIdx%(1, 1)).lex = 3: ColEsf(ColIdx%(1, 1)).ley = 3
ColEsf(ColIdx%(1, 2)).N = 60: ColEsf(ColIdx%(1, 2)).Mx = 0: ColEsf(ColIdx%(1, 2)).My = 0
ColEsf(ColIdx%(1, 2)).lex = 3: ColEsf(ColIdx%(1, 2)).ley = 3
nivIni(1) = 2: tipo(1) = "R": bFix(1) = 20: hFix(1) = 0
nivIni(2) = 1: tipo(2) = "R": bFix(2) = 0: hFix(2) = 0: ex(2) = 10: ey(2) = 0
PpColuna 1, 2, nivIni(), tipo(), bFix(), hFix(), ex(), ey(), fck, rbx(), rby(), rok(), rs1(), rk1(), rs2(), rk2(), rn()
AssertNear "9: secao de cima 15", rbx(2) + rby(2), 30, 0.0000001
AssertNear "9: secao de baixo by = 55 com Ex = 10", rby(1), 55, 0.0000001
AssertTrue "9: as duas atendem", rok(1) AND rok(2)
AssertTrue "9: nivel critico da de baixo = 2", rk2(1) = 2
ex(2) = 0
PpColuna 1, 2, nivIni(), tipo(), bFix(), hFix(), ex(), ey(), fck, rbx(), rby(), rok(), rs1(), rk1(), rs2(), rk2(), rn()
AssertNear "9: sem Ex by = 35", rby(1), 35, 0.0000001

' 10) fundacao. 2 niveis, 20x30, pe-direito 3: PILGEEDI somou 2 * 0,45 = 0,9 tf.
' carga = 60 - 0,9 = 59,1; 2 pavimentos -> reducao 0; fundacao = 59,1 + 0,9 = 60
v = PpParam#(6, 1, -1): v = PpParam#(7, 2.5, -1): v = PpParam#(8, 10, -1): v = PpParam#(9, 1, -1)
PpFundacao 1, carga, pp, fund
AssertNear "10: carga 59,1", carga, 59.1, 0.0000001
AssertNear "10: peso proprio 0,9", pp, 0.9, 0.0000001
AssertNear "10: fundacao 60", fund, 60, 0.0000001
' 6 niveis, N(k) = 10k: pp do PILGEEDI 6 * 0,45 = 2,7; carga 57,3; reducao 60% de 10%:
' fundacao = 57,3 * (1 - 0,06) + 2,7 = 53,862 + 2,7 = 56,562
ColNivQtd = 6
FOR k = 1 TO 6
    ColNiv(k).peDireito = 3: ColEsf(ColIdx%(1, k)).N = 10 * k
NEXT
PpFundacao 1, carga, pp, fund
AssertNear "10: carga 57,3", carga, 57.3, 0.0000001
AssertNear "10: fundacao 56,562", fund, 56.562, 0.0000001
v = PpParam#(9, 0, -1)
PpFundacao 1, carga, pp, fund
AssertNear "10: sem reducao 57,3 + 2,7", fund, 60, 0.0000001
AssertNear "10: NBR 6120 3 pav", PpReducao#(3), 0, 0.0000001
AssertNear "10: NBR 6120 4 pav", PpReducao#(4), 0.2, 0.0000001
AssertNear "10: NBR 6120 5 pav", PpReducao#(5), 0.4, 0.0000001
AssertNear "10: NBR 6120 7 pav", PpReducao#(7), 0.6, 0.0000001

' 11) lista de posicoes
n = PpListaPosicoes%("1/3 a 5/4/9", 6, lista(), 30)
AssertTrue "11: 1/3 a 5/4/9 -> 1 3 4 5", n = 4 AND lista(1) = 1 AND lista(2) = 3 AND lista(3) = 4 AND lista(4) = 5
n = PpListaPosicoes%("5 A 2", 6, lista(), 30)
AssertTrue "11: 5 A 2 -> 2 a 5", n = 4 AND lista(1) = 2 AND lista(4) = 5
n = PpListaPosicoes%("", 6, lista(), 30)
AssertTrue "11: vazio", n = 0
n = PpListaPosicoes%("1 a 6", 6, lista(), 3)
AssertTrue "11: limite de 3", n = 3

' 12) aceite da secao (PpAplicaSecao): 20x20 -> 30x50, 10 niveis de 3 m (1 = topo).
' Peso proprio por lance: 20x20 = 0,04*3*2,5 = 0,3 tf; 30x50 = 0,15*3*2,5 = 1,125 tf.
' Diferenca (0,15 - 0,04)*3*2,5 = 0,825 tf por lance; na base, 10 lances = 8,25 tf.
' Coluna 1: 10 tf em cada nivel + 0,3 do PILGEEDI -> N(k) = 10,3 k.
'   Depois: N(1) = 10,3 + 0,825 = 11,125; N(10) = 103 + 8,25 = 111,25.
' Coluna 2: sem carga no nivel 1 (N = 0) -> 9 lances: N(k) = 10,3 (k - 1).
'   Depois: N(1) = 0; N(2) = 10,3 + 0,825 = 11,125; N(10) = 92,7 + 9*0,825 = 100,125.
' Sem a correcao o N da base ficaria 103 (faltam 8,25 tf).
ColNivQtd = 10: ColQtd = 2
Col(2).nome = "P2": Col(2).secao = "R": Col(2).bx = 20: Col(2).by = 20
Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 20
FOR k = 1 TO 10
    ColNiv(k).peDireito = 3
    ColEsf(ColIdx%(1, k)).N = 10.3 * k
    ColEsf(ColIdx%(2, k)).N = 10.3 * (k - 1)
NEXT
PpAplicaSecao 1, "R", 30, 50
PpAplicaSecao 2, "R", 30, 50
AssertTrue "12: secao gravada 30x50", Col(1).secao = "R" AND Col(1).bx = 30 AND Col(1).by = 50
AssertNear "12: P1 nivel 1 = 11,125", ColEsf(ColIdx%(1, 1)).N, 11.125, 0.000001
AssertNear "12: P1 base = 103 + 8,25", ColEsf(ColIdx%(1, 10)).N, 111.25, 0.000001
AssertNear "12: P1 base sem pp continua 100", PpCargaSemPP#(1, 10), 100, 0.000001
AssertNear "12: P2 nivel 1 sem lance fica 0", ColEsf(ColIdx%(2, 1)).N, 0, 0.000001
AssertNear "12: P2 nivel 2 = 11,125", ColEsf(ColIdx%(2, 2)).N, 11.125, 0.000001
AssertNear "12: P2 base = 92,7 + 7,425", ColEsf(ColIdx%(2, 10)).N, 100.125, 0.000001
' circular D = 40 sobre a 30x50: pi*0,16/4 - 0,15 = -0,024336 m2 -> -0,182522 tf por lance
PpAplicaSecao 1, "C", 40, 0
AssertTrue "12: circular by = D", Col(1).secao = "C" AND Col(1).by = 40
AssertNear "12: P1 base = 111,25 - 10*0,182522", ColEsf(ColIdx%(1, 10)).N, 111.25 - 10 * (0.15 - 3.14159265358979# * 0.16 / 4) * 7.5, 0.000001

' 13) classe do aco (linha 19 do PILAR.INI): sem INI = A (0), como CcaAcoClasse% e os
' outros modulos; com INI vale a linha (antes: sem INI ou linha vazia = B).
AssertTrue "13: sem INI -> A", PpClasseAco%(0, "") = 0
AssertTrue "13: sem INI ignora a linha", PpClasseAco%(0, "B") = 0
AssertTrue "13: INI com B -> B", PpClasseAco%(-1, " b") = 1
AssertTrue "13: INI com A -> A", PpClasseAco%(-1, "A") = 0
AssertTrue "13: INI com linha vazia -> A", PpClasseAco%(-1, "") = 0

TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILCALC.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILEDCAL.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILPRED.BM'
