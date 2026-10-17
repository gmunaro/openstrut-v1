' Teste da montagem da forma e dos quantitativos (forma/FORMCALC.BM).
' Valores conferidos a mao (ver contas abaixo). Unidades: m, cm; area m2, volume m3.
'
' Dados: L1 4x5 h=12; L2 3x5 h=0 (usa hlaje = 12). hlaje de referencia = 12.
'   V1: 1 tramo, eixo (0,0)-(4,0), bw=12, h=50 -> comp 4
'   V2: 2 tramos, eixo (0,5)-(7,5), bw=20, h=40 -> comp 7
'   P1 20x30 e P2 20x20 (cm)
' Area lajes = 20 + 15 = 35
' Area vigas = 4*(12+2*38)/100 + 7*(20+2*28)/100 = 3.52 + 5.32 = 8.84
' Area pilares (pe-direito 3) = 2*50/100*3 + 2*40/100*3 = 3 + 2.4 = 5.4
'   -> FcAreaForma#(0) = 43.84 ; FcAreaForma#(3) = 49.24
' Volume lajes = 4*5*12/100 + 3*5*12/100 = 2.4 + 1.8 = 4.2
' Volume vigas = 4*12*38/10000 + 7*20*28/10000 = 0.1824 + 0.392 = 0.5744
'   -> FcVolumeConcreto# = 4.7744
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM msg AS STRING

LajQtd = 2: LajObra = "T": LajNivel = 1
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).h = 12
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 3: Laj(2).ly = 5: Laj(2).h = 0

VigQtd = 2: VigApoQtd = 5: VigObra = "T": VigNivel = 1
Vig(1).nome = "V1": Vig(1).nTramos = 1: Vig(1).bw = 12: Vig(1).h = 50: Vig(1).iApo = 1: Vig(1).iTra = 1
VigApo(1).nome = "P1": VigApo(1).x = 0: VigApo(1).y = 0
VigApo(2).nome = "P2": VigApo(2).x = 4: VigApo(2).y = 0
Vig(2).nome = "V2": Vig(2).nTramos = 2: Vig(2).bw = 20: Vig(2).h = 40: Vig(2).iApo = 3: Vig(2).iTra = 2
VigApo(3).nome = "P3": VigApo(3).x = 0: VigApo(3).y = 5
VigApo(4).nome = "P4": VigApo(4).x = 4: VigApo(4).y = 5
VigApo(5).nome = "P5": VigApo(5).x = 7: VigApo(5).y = 5

ColQtd = 2: ColObra = "T"
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 30: Col(1).x = 0: Col(1).y = 5
Col(2).nome = "P2": Col(2).secao = "R": Col(2).bx = 20: Col(2).by = 20: Col(2).x = 4: Col(2).y = 0

' A) montagem da forma a partir dos dados carregados
FcMontaForma msg
AssertEq "A: montagem sem recusa", msg, ""
AssertTrue "A: 2 lajes montadas", FrmLajQtd = 2
AssertTrue "A: 2 vigas montadas", FrmVigQtd = 2
AssertTrue "A: 2 pilares montados", FrmPilQtd = 2
AssertNear "A: laje sem h usa hlaje de referencia (12)", FrmLaj(2).h, 12, 0.000001
AssertNear "A: laje L1 mantem h", FrmLaj(1).h, 12, 0.000001
AssertEq "A: nome da viga V2", RTRIM$(FrmVig(2).nome), "V2"
AssertNear "A: V2 inicio x1 = primeiro apoio", FrmVig(2).x1, 0, 0.000001
AssertNear "A: V2 fim x2 = ultimo apoio", FrmVig(2).x2, 7, 0.000001
AssertNear "A: V2 fim y2", FrmVig(2).y2, 5, 0.000001
AssertNear "A: V2 bw", FrmVig(2).bw, 20, 0.000001
AssertNear "A: V2 h", FrmVig(2).h, 40, 0.000001
AssertNear "A: V1 fim x2 = 4", FrmVig(1).x2, 4, 0.000001
AssertEq "A: pilar P2 secao", FrmPil(2).secao, "R"
AssertNear "A: pilar P2 bx", FrmPil(2).bx, 20, 0.000001

' B) quantitativos
AssertNear "B: area sem pe-direito (lajes + vigas)", FcAreaForma#(0), 43.84, 0.000001
AssertNear "B: area com pe-direito 3 m", FcAreaForma#(3), 49.24, 0.000001
AssertNear "B: volume de concreto (lajes + vigas)", FcVolumeConcreto#, 4.7744, 0.000001

' C) obra vazia e recusada
LajQtd = 0: VigQtd = 0
FcMontaForma msg
AssertTrue "C: obra vazia recusada com mensagem", LEN(msg) > 0

TestEnd

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/forma/FORMCALC.BM'
