' ============================================================================
'  T_PILGEO.BAS - area e perimetro da secao retangular (pilar/PILGEO.BM).
'  Contas a mao:
'    20 x 40 cm: area = 20 x 40 = 800 cm2; perimetro = 2 x (20 + 40) = 120 cm.
'    15 x 25 cm: area = 375 cm2;           perimetro = 2 x (15 + 25) = 80 cm.
'  Secao circular D = 30 cm (conferida a mao, sem teste: o PILAR nao tem secao
'  circular, ver RECONSTRUCAO em EntraSecao): area = pi x 30^2 / 4 = 706,86 cm2;
'  perimetro = pi x 30 = 94,25 cm.
' ============================================================================
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER

AssertNear "20x40: area = 800", SecAreaRet#(20, 40), 800, 0.000001
AssertNear "20x40: perimetro = 120", SecPerimRet#(20, 40), 120, 0.000001
AssertNear "15x25: area = 375", SecAreaRet#(15, 25), 375, 0.000001
AssertNear "15x25: perimetro = 80", SecPerimRet#(15, 25), 80, 0.000001
TestEnd

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILGEO.BM'
