' Teste da SUB pura LgDetectaContinuidade (src-reconstructed/laje/LAJEGEOT.BM).
' Esperados derivados a mao a partir das regras do LAJEGEOT.BM, nao da saida do codigo.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER

' ---- Caso 1: duas lajes lado a lado, 4x5 e 3x5, mesma linha de y
LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).bordos = "AAAA"
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 3: Laj(2).ly = 5: Laj(2).bordos = "AAAA"
LgDetectaContinuidade
AssertEq "lado a lado: bordos L1", Laj(1).bordos, "AAEA"
AssertEq "lado a lado: bordos L2", Laj(2).bordos, "EAAA"
AssertEq "lado a lado: vigas L1 (bordas sup/inf continuas)", RTRIM$(Laj(1).vigas), "V3/V2/V4/V1"
AssertEq "lado a lado: vigas L2 (mesmas V1/V2 de L1)", RTRIM$(Laj(2).vigas), "V4/V2/V5/V1"

' ---- Caso 2: laje isolada, sem vizinho
LajQtd = 1
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).bordos = "AAAA": Laj(1).vigas = ""
LgDetectaContinuidade
AssertEq "isolada: bordos", Laj(1).bordos, "AAAA"
AssertEq "isolada: vigas", RTRIM$(Laj(1).vigas), "V3/V2/V4/V1"

' ---- Caso 3: grade 2x2 de lajes 4x5; cada laje com 2 bordos E internos
LajQtd = 4
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).bordos = "AAAA"
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 4: Laj(2).ly = 5: Laj(2).bordos = "AAAA"
Laj(3).nome = "L3": Laj(3).x0 = 0: Laj(3).y0 = 5: Laj(3).lx = 4: Laj(3).ly = 5: Laj(3).bordos = "AAAA"
Laj(4).nome = "L4": Laj(4).x0 = 4: Laj(4).y0 = 5: Laj(4).lx = 4: Laj(4).ly = 5: Laj(4).bordos = "AAAA"
LgDetectaContinuidade
AssertEq "grade: bordos L1", Laj(1).bordos, "AAEE"
AssertEq "grade: bordos L2", Laj(2).bordos, "EAAE"
AssertEq "grade: bordos L3", Laj(3).bordos, "AEEA"
AssertEq "grade: bordos L4", Laj(4).bordos, "EEAA"
AssertEq "grade: vigas L1 (3 horizontais + 3 verticais continuas)", RTRIM$(Laj(1).vigas), "V4/V3/V5/V2"
AssertEq "grade: vigas L2", RTRIM$(Laj(2).vigas), "V5/V3/V6/V2"
AssertEq "grade: vigas L3", RTRIM$(Laj(3).vigas), "V4/V2/V5/V1"
AssertEq "grade: vigas L4", RTRIM$(Laj(4).vigas), "V5/V2/V6/V1"

' Segunda chamada sobre o mesmo estado: deve dar o mesmo resultado (grp/numVig zerados).
LgDetectaContinuidade
AssertEq "grade 2a chamada: bordos L1", Laj(1).bordos, "AAEE"
AssertEq "grade 2a chamada: vigas L4", RTRIM$(Laj(4).vigas), "V5/V2/V6/V1"

' ---- Carga equivalente (LgCargaEquivalente#). Esperados a mao.
' Laje 4x5: linear 2 tf/m x 4 m = 8 tf -> 8/20 = 0.4 tf/m2.
AssertNear "carga equiv: so linear", LgCargaEquivalente#(4, 5, 8, 0), 0.4, 0.000001
' Laje 4x5: linear 1 tf/m x 3 m = 3 tf; area 1 tf/m2 x 10 m2 = 10 tf -> 13/20 = 0.65 tf/m2.
AssertNear "carga equiv: linear + area", LgCargaEquivalente#(4, 5, 3, 10), 0.65, 0.000001

TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJEGEOT.BM'
