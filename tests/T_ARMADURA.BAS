' Teste da armadura dupla (viga/ARMCALC.BM).
' As referencias sao recalculadas aqui por equilibrio de forcas e momentos,
' sem chamar a funcao testada.
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM fck AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE
DIM bw AS DOUBLE, d AS DOUBLE, dl AS DOUBLE, md AS DOUBLE
DIM xl AS DOUBLE, mdLim AS DOUBLE, as1 AS DOUBLE, asLin AS DOUBLE, asT AS DOUBLE, x AS DOUBLE
fck = 0.15#: fcd = fck / 1.4#: fyd = 5# / 1.15#
bw = 20#: d = 45#: dl = 5#

' Linha neutra limite (x/d = 0.0035/(0.0035+fyd/Es), Es = 2100 tf/cm2) e Md limite
xl = 0.0035# * d / (0.0035# + fyd / 2100#)
mdLim = 0.85# * fcd * bw * 0.8# * xl * (d - 0.4# * xl)
AssertNear "limite: MdLim recalculado = CcaMdLim#", CcaMdLim#(bw, d, fcd, fyd), mdLim, 0.000001#

' Caso 1: Md = 1.5 MdLim (armadura dupla)
md = 1.5# * mdLim
asT = ArmAsDupla#(md, bw, d, dl, fcd, fyd)
asLin = ArmAsLinha#(md, bw, d, dl, fcd, fyd)
as1 = mdLim / (fyd * (d - 0.4# * xl))
AssertNear "dupla: As' = 0.5 MdLim/(fyd(d-d'))", asLin, 0.5# * mdLim / (fyd * (d - dl)), 0.000001#
AssertNear "dupla: As total = As1 + As'", asT, as1 + asLin, 0.000001#
' equilibrio: As fyd = Cc + As' fyd ; Md = Cc (d-0.4x) + As' fyd (d-d')
AssertNear "dupla: forcas (As-As') fyd = 0.85 fcd b 0.8 x", (asT - asLin) * fyd, 0.85# * fcd * bw * 0.8# * xl, 0.000001#
AssertNear "dupla: momentos Cc(d-0.4x) + As' fyd (d-d') = Md", 0.85# * fcd * bw * 0.8# * xl * (d - 0.4# * xl) + asLin * fyd * (d - dl), md, 0.000001#

' Caso 2: Md abaixo do limite -> armadura simples, As' = 0
md = 0.6# * mdLim
asT = ArmAsDupla#(md, bw, d, dl, fcd, fyd)
AssertNear "simples: As' = 0", ArmAsLinha#(md, bw, d, dl, fcd, fyd), 0, 0
AssertNear "simples: As = CcaAsFlexao#", asT, CcaAsFlexao#(md, bw, d, fcd, fyd), 0.000001#
' equilibrio: Cc = As fyd, Cc (d-0.4x) = Md com x = As fyd / (0.85 fcd b 0.8)
x = asT * fyd / (0.85# * fcd * bw * 0.8#)
AssertNear "simples: momento Cc(d-0.4x) = Md", asT * fyd * (d - 0.4# * x), md, 0.000001#

' Caso 3: Md = 0 -> nada a armar
AssertNear "Md=0: As = 0", ArmAsDupla#(0#, bw, d, dl, fcd, fyd), 0, 0
AssertNear "Md=0: As' = 0", ArmAsLinha#(0#, bw, d, dl, fcd, fyd), 0, 0

' Caso 4: altura util insuficiente (d <= d') -> -1
AssertTrue "d<=d': ArmAsDupla# = -1", ArmAsDupla#(70#, bw, 5#, 5#, fcd, fyd) = -1
AssertTrue "d<=d': ArmAsLinha# = -1", ArmAsLinha#(70#, bw, 4#, 5#, fcd, fyd) = -1

' Caso 5: aco classe B, b = 20, d = 45, d' = 3,5, Md = 1265,856 tf.cm (x/d = 0,55 em
' armadura simples, acima do limite B 0,4623). Conta a mao (Python, bisseccao propria):
' xl = 0,46233 x 45 = 20,8047; MdLim = 0,85 fcd b 0,8 xl (d - 0,4 xl) = 1111,914
' es' = 0,0035 (xl - 3,5)/xl = 0,0029112 < eyd(B) = 0,0040704 -> s's = 4,16241 tf/cm2 (< fyd)
' As = MdLim/(fyd (d - 0,4 xl)) + (Md - MdLim)/(fyd (d - d')) = 7,82573 cm2
' As' = (Md - MdLim)/(s's (d - d')) = 0,89118 cm2 (classe A daria As' = As2 = 0,85316)
DIM k AS INTEGER
k = CcaAcoClasse%(1)
asT = ArmAsDupla#(1265.856#, 20#, 45#, 3.5#, fcd, fyd)
asLin = ArmAsLinha#(1265.856#, 20#, 45#, 3.5#, fcd, fyd)
AssertNear "classe B: As tracionada = 7,8257", asT, 7.82573#, 0.0001#
AssertNear "classe B: As' com s's do diagrama B = 0,8912", asLin, 0.89118#, 0.0002#
' equilibrio de forcas: As fyd = 0,85 fcd b 0,8 xl + As' s's
AssertNear "classe B: equilibrio de forcas", asT * fyd, 0.85# * fcd * 20# * 0.8# * 20.80473# + asLin * 4.162411#, 0.0001#
k = CcaAcoClasse%(0)
' limite As + As' <= 4% Ac (RECONSTRUCAO): 20 x 50 -> 40 cm2
AssertNear "As + As' maximo = 4% de 20x50", ArmAsMax#(20#, 50#), 40#, 0
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/viga/ARMCALC.BM'
