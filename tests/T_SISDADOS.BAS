' Teste de round-trip dos arquivos de obra (common/SISDADOS.BM):
' grava, zera a memoria, le de volta e confere campo a campo.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM dir AS STRING, v AS INTEGER, t AS INTEGER, i AS INTEGER, ok AS INTEGER, f AS INTEGER
dir = COMMAND$
IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" AND RIGHT$(dir, 1) <> "\" THEN dir = dir + "/"

' ---- .LAJ com resultados
LajObra = "EDIF A": LajNivel = 2: LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5.5: Laj(1).h = 10
Laj(1).bordos = "AEEA": Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).vigas = "V1/V2/V3/V4"
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).lx = 3: Laj(2).ly = 5.5: Laj(2).bordos = "EAAL": Laj(2).vigas = "V3/V2/V5/-"
Laj(1).temRes = -1: Laj(1).mx = 0.4321: Laj(1).r4 = 1.25
LajGrava dir + "T.LAJ"
Laj(1).nome = "": Laj(1).ly = 0: Laj(1).mx = 0: Laj(2).bordos = "": LajQtd = 0: LajObra = ""
AssertTrue "laj: le", LajLe%(dir + "T.LAJ")
AssertEq "laj: obra", LajObra, "EDIF A"
AssertTrue "laj: qtd e nivel", LajQtd = 2 AND LajNivel = 2
AssertEq "laj: nome", DadNome$(Laj(1).nome), "L1"
AssertNear "laj: ly", Laj(1).ly, 5.5, 0
AssertEq "laj: bordos", Laj(2).bordos, "EAAL"
AssertEq "laj: vigas", DadNome$(Laj(2).vigas), "V3/V2/V5/-"
AssertTrue "laj: resultado lido", Laj(1).temRes
AssertNear "laj: mx", Laj(1).mx, 0.4321, 0.0000001
AssertNear "laj: r4", Laj(1).r4, 1.25, 0
' backup
LajGrava dir + "T.LAJ"
AssertTrue "laj: gera .LAJ.BAK ao regravar", _FILEEXISTS(dir + "T.LAJ.BAK")

' ---- .VIG com cargas concentradas
VigLimpa: VigObra = "EDIF A": VigNivel = 2
v = VigAdiciona%("V1", 2, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2": VigApo(VigApoio%(v, 3)).nome = "-"
VigApo(VigApoio%(v, 2)).x = 4.5
t = VigTramo%(v, 1): VigTra(t).vao = 4.5: VigTra(t).qPerm = 1.2: VigTra(t).qAcid = 0.4
VigAddConc t, 1.5, 3: VigAddConc t, 3, 2
t = VigTramo%(v, 2): VigTra(t).vao = 1.2: VigTra(t).qPerm = 0.8
VigAddConc t, 1.2, 1.5
v = VigAdiciona%("V2", 1, 15, 40)
VigTra(VigTramo%(v, 1)).vao = 3
VigGrava dir + "T.VIG", "VIG"
VigLimpa
AssertTrue "vig: le", VigLe%(dir + "T.VIG", "VIG")
AssertTrue "vig: 2 vigas", VigQtd = 2
AssertEq "vig: apoio 3 balanco", DadNome$(VigApo(VigApoio%(1, 3)).nome), "-"
AssertNear "vig: x apoio 2", VigApo(VigApoio%(1, 2)).x, 4.5, 0
t = VigTramo%(1, 1)
AssertTrue "vig: tramo 1 tem 2 cargas", VigTra(t).nConc = 2
AssertNear "vig: 2a carga P", VigCon(VigTra(t).iCon + 1).P, 2, 0
t = VigTramo%(1, 2)
AssertNear "vig: carga do tramo 2", VigCon(VigTra(t).iCon).a, 1.2, 0
AssertNear "vig: V2 bw", Vig(2).bw, 15, 0

' ---- .EDV (SEC + posicoes)
Vig(1).d = 46
t = VigTramo%(1, 1): VigTra(t).mPos = 5.5: VigTra(t).asPos = 3.9: VigTra(t).nPos = 2: VigTra(t).sEst = 15
VigAddPos t, 1, 12.5, 2, 520, "U"
VigAddPos t, 2, 5, 30, 130, "E"
VigGrava dir + "T.EDV", "EDV"
VigLimpa
AssertTrue "edv: le", VigLe%(dir + "T.EDV", "EDV")
t = VigTramo%(1, 1)
AssertNear "edv: d", Vig(1).d, 46, 0
AssertNear "edv: mPos", VigTra(t).mPos, 5.5, 0
AssertTrue "edv: 2 posicoes", VigTra(t).nPosFerro = 2
AssertEq "edv: forma pos 2", VigPos(VigTra(t).iPosFerro + 1).forma, "E"
AssertTrue "sec: tipo errado recusado", VigLe%(dir + "T.EDV", "SEC") = 0
AssertEq "sec: mensagem de erro", DadErro, "Arquivo invalido ou de outra versao"

' ---- .REP com soma
CPilQtd = 0: CPilObra = "EDIF A": CPilNivel = 2
i = CPilSoma%("P1", 0, 0, 10, 0, 0)
i = CPilSoma%("P2", 4.5, 0, 7, 0, 0)
i = CPilSoma%("P1", 0, 0, 2.5, 0.3, 0)
AssertTrue "rep: soma no mesmo pilar", CPilQtd = 2
CPilGrava dir + "T.REP", "REP"
CPilQtd = 0
AssertTrue "rep: le", CPilLe%(dir + "T.REP", "REP")
AssertNear "rep: N de P1", CPil(1).N, 12.5, 0
AssertNear "rep: Mx de P1", CPil(1).Mx, 0.3, 0

' ---- .COL
ColObra = "EDIF A": ColNivQtd = 2: ColQtd = 1
ColNiv(1).nome = "COBERTURA": ColNiv(1).cota = 6: ColNiv(1).peDireito = 3
ColNiv(2).nome = "TERREO": ColNiv(2).cota = 3: ColNiv(2).peDireito = 3
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 40
ColEsf(ColIdx%(1, 2)).N = 45: ColEsf(ColIdx%(1, 2)).nBarras = 6
ColGrava dir + "T.COL"
ColQtd = 0: ColEsf(2).N = 0
AssertTrue "col: le", ColLe%(dir + "T.COL")
AssertEq "col: nivel 2", DadNome$(ColNiv(2).nome), "TERREO"
AssertNear "col: N no nivel 2", ColEsf(ColIdx%(1, 2)).N, 45, 0
AssertTrue "col: barras", ColEsf(ColIdx%(1, 2)).nBarras = 6

' ---- .FRM / .FOR
FrmObra = "EDIF A": FrmLajQtd = 1: FrmVigQtd = 1: FrmPilQtd = 1
FrmLaj(1).nome = "L1": FrmLaj(1).lx = 4
FrmVig(1).nome = "V1": FrmVig(1).x1 = 0: FrmVig(1).y1 = 0: FrmVig(1).x2 = 3: FrmVig(1).y2 = 4: FrmVig(1).bw = 20
FrmPil(1).nome = "P1": FrmPil(1).secao = "C": FrmPil(1).bx = 30
FrmGrava dir + "T.FRM"
FrmLajQtd = 0: FrmPil(1).secao = ""
AssertTrue "frm: le", FrmLe%(dir + "T.FRM")
AssertTrue "frm: qtds", FrmLajQtd = 1 AND FrmVigQtd = 1 AND FrmPilQtd = 1
AssertEq "frm: secao circular", FrmPil(1).secao, "C"
ForGrava dir + "T.FOR", 2
ok = ForLe%(dir + "T.FOR", i)
AssertTrue "for: le", ok
AssertNear "for: comprimento 3-4-5", FrmVig(1).x2, 5, 0.0000001
AssertTrue "for: nivel", i = 2
ObraDefine dir, "EDIF B"
AssertEq "obra corrente", ObraAtual$(dir), "EDIF B"
AssertTrue "arquivo inexistente -> 0", LajLe%(dir + "NAOEXISTE.LAJ") = 0
' bloco RES maior que o numero de lajes
f = FREEFILE
OPEN dir + "R.LAJ" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "LAJ", 1, "X"
WRITE #f, 1, 1
WRITE #f, "L1", 0, 0, 4, 5, 10, "AAAA", 0.1, 0.15, "V1/V2/V3/V4"
WRITE #f, "RES", 2
WRITE #f, "L1", 10, 0.5, 0.2, 0.2, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0.1, 1, 1, 1, 1
CLOSE #f
AssertTrue "RES maior que LajQtd: recusado", LajLe%(dir + "R.LAJ") = 0
' arquivo truncado no meio das lajes nao trava (erro tratado)
f = FREEFILE
OPEN dir + "Q.LAJ" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "LAJ", 1, "X"
WRITE #f, 1, 3
WRITE #f, "L1", 0, 0, 4, 5, 10, "AAAA", 0.1, 0.15, "V1/V2/V3/V4"
CLOSE #f
AssertTrue "truncado: recusado sem travar", LajLe%(dir + "Q.LAJ") = 0
AssertEq "truncado: mensagem", DadErro, "Arquivo truncado ou corrompido"
' B1: laje sem resultado continua sem resultado depois de gravar e reler
LajQtd = 2: LajObra = "B1"
Laj(1).nome = "L1": Laj(1).temRes = -1: Laj(1).p = 0.5: Laj(1).r1 = 1
Laj(2).nome = "L2": Laj(2).temRes = 0: Laj(2).p = 0: Laj(2).r1 = 0
LajGrava dir + "B1.LAJ"
LajQtd = 0
AssertTrue "B1: le", LajLe%(dir + "B1.LAJ")
AssertTrue "B1: L1 com resultado", Laj(1).temRes
AssertTrue "B1: L2 continua sem resultado", Laj(2).temRes = 0
AssertNear "B1: resultado de L1 preservado", Laj(1).r1, 1, 0

' bordos nunca preenchidos (NUL) ou em branco sao gravados como A
LajQtd = 1: Laj(1).nome = "LN": Laj(1).temRes = 0
Laj(1).bordos = CHR$(0) + "e" + " " + "L"
LajGrava dir + "NUL.LAJ"
LajQtd = 0
AssertTrue "bordos: le", LajLe%(dir + "NUL.LAJ")
AssertEq "bordos: NUL e espaco viram A, e vira E", Laj(1).bordos, "AEAL"

' leitores robustos: .VIG truncado no meio dos tramos
f = FREEFILE
OPEN dir + "TR.VIG" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "VIG", 1, "X"
WRITE #f, 1, 1
WRITE #f, "V1", 2, 20, 50
WRITE #f, "P1", 0, 0: WRITE #f, "P2", 4, 0: WRITE #f, "P3", 8, 0
WRITE #f, 4, 1, 0.5, 0
CLOSE #f
AssertTrue "vig truncado: recusado", VigLe%(dir + "TR.VIG", "VIG") = 0
AssertTrue "vig truncado: lista vazia", VigQtd = 0
' .COL truncado dentro dos niveis
f = FREEFILE
OPEN dir + "TR.COL" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "COL", 1, "X"
WRITE #f, 2, 1
WRITE #f, "N1", 6, 3: WRITE #f, "N2", 3, 3
WRITE #f, "P1", "R", 20, 20, 0, 0
WRITE #f, 10, 0, 0, 3, 3, 0, 0, 0, 0, 0
CLOSE #f
AssertTrue "col truncado: recusado e zerado", ColLe%(dir + "TR.COL") = 0 AND ColQtd = 0 AND ColNivQtd = 0
' .FRM com mais lajes que o limite
f = FREEFILE
OPEN dir + "TR.FRM" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "FRM", 1, "X"
WRITE #f, "LAJES", 9999
CLOSE #f
AssertTrue "frm acima do limite: recusado", FrmLe%(dir + "TR.FRM") = 0 AND FrmLajQtd = 0
' .SEC de versao antiga (sem apoios) e recusado
f = FREEFILE
OPEN dir + "V1.SEC" FOR OUTPUT AS #f
WRITE #f, "SISTRUT40", "SEC", 1, "X"
WRITE #f, 0
CLOSE #f
AssertTrue "sec v1 (sem apoios): recusado", VigLe%(dir + "V1.SEC", "SEC") = 0
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
