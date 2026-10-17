' Teste de integracao do fluxo de uma obra pelas bibliotecas de calculo
' (sem tela), passando pelos arquivos do contrato docs/formats/DADOS.md:
'   geometria -> .LAJ -> calculo de lajes -> .LAJ+RES -> montagem -> .VIG/.RLP
'   -> vigas -> .SEC/.REP -> colunas -> .COL -> pilares -> detalhamento -> .EDV
'   -> desenho .VET -> plotter .PLT / CAD .DXF
' Confere equilibrio de cargas entre as etapas.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISTELA.BI'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM dir AS STRING, msg AS STRING, i AS INTEGER, v AS INTEGER, t AS INTEGER, k AS INTEGER, c AS INTEGER, j AS INTEGER
DIM cargaLajes AS DOUBLE, cargaVigas AS DOUBLE, somaReac AS DOUBLE, somaRep AS DOUBLE, pp AS DOUBLE, ult AS INTEGER
DIM reac(1 TO 50) AS DOUBLE, compr(1 TO 9) AS DOUBLE, peso(1 TO 9) AS DOUBLE, tot AS DOUBLE
dir = COMMAND$: IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" AND RIGHT$(dir, 1) <> "\" THEN dir = dir + "/"

' 1) geometria: duas lajes lado a lado; continuidade e vigas automaticas
LajObra = "FLUXO": LajNivel = 1: LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).h = 10: Laj(1).g = 0.1: Laj(1).q = 0.15
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 3.5: Laj(2).ly = 5: Laj(2).h = 10: Laj(2).g = 0.1: Laj(2).q = 0.15
LgDetectaContinuidade
AssertEq "geometria: L1 engastada a direita", MID$(Laj(1).bordos, 3, 1), "E"
AssertEq "geometria: viga comum entre L1 e L2", LcViga$(Laj(1).vigas, 3), LcViga$(Laj(2).vigas, 1)
LajGrava dir + "FLUXO.LAJ"

' 2) calculo das lajes e gravacao com resultados
LajQtd = 0
AssertTrue "laj: le", LajLe%(dir + "FLUXO.LAJ")
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
AssertEq "lajes calculadas sem avisos", msg, ""
FOR i = 1 TO LajQtd
    cargaLajes = cargaLajes + Laj(i).p * Laj(i).lx * Laj(i).ly
NEXT
LajGrava dir + "FLUXO.LAJ"
LajQtd = 0
AssertTrue "laj+RES: le de volta", LajLe%(dir + "FLUXO.LAJ") AND Laj(1).temRes

' 3) montagem de cargas nas vigas e pilares
LmMonta msg
AssertEq "montagem sem avisos", msg, ""
FOR v = 1 TO VigQtd
    FOR t = 1 TO Vig(v).nTramos
        cargaVigas = cargaVigas + (VigTra(VigTramo%(v, t)).qPerm + VigTra(VigTramo%(v, t)).qAcid) * VigTra(VigTramo%(v, t)).vao
    NEXT
NEXT
AssertNear "equilibrio: cargas das lajes = cargas nas vigas", cargaVigas, cargaLajes, 0.005
VigGrava dir + "FLUXO.VIG", "VIG"
CPilGrava dir + "FLUXO.RLP", "RLP"
AssertTrue "pilares inferidos (6 cruzamentos)", CPilQtd = 6

' 4) vigas: analise, dimensionamento, .SEC e .REP
AssertTrue "vig: le", VigLe%(dir + "FLUXO.VIG", "VIG")
CPilQtd = 0: CPilObra = VigObra: CPilNivel = 1
FOR v = 1 TO VigQtd
    pp = Vig(v).bw * Vig(v).h / 10000 * 2.5
    AssertTrue "viga " + RTRIM$(Vig(v).nome) + " analisada", VcAnalisa%(v, -1, reac(), msg)
    VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
    FOR k = 1 TO Vig(v).nTramos + 1
        j = VigApoio%(v, k)
        IF LEFT$(RTRIM$(VigApo(j).nome), 1) = "P" THEN i = CPilSoma%(RTRIM$(VigApo(j).nome), VigApo(j).x, VigApo(j).y, reac(k), 0, 0)
    NEXT
    FOR t = 1 TO Vig(v).nTramos
        somaReac = somaReac + (VigTra(VigTramo%(v, t)).qPerm + VigTra(VigTramo%(v, t)).qAcid + pp) * VigTra(VigTramo%(v, t)).vao
    NEXT
NEXT
FOR i = 1 TO CPilQtd: somaRep = somaRep + CPil(i).N: NEXT
' reacoes maximas da envoltoria >= carga total (acidental desfavoravel por apoio)
AssertTrue "equilibrio: reacoes nos pilares >= carga total das vigas", somaRep >= somaReac - 0.001
AssertTrue "reacoes nao absurdas (< 1.5 x carga)", somaRep < 1.5 * somaReac
VigGrava dir + "FLUXO.SEC", "SEC"
CPilGrava dir + "FLUXO.REP", "REP"

' 5) colunas: um nivel, pilares do .REP, peso proprio do lance
AssertTrue "rep: le", CPilLe%(dir + "FLUXO.REP", "REP")
ColObra = "FLUXO": ColNivQtd = 1: ColQtd = CPilQtd
ColNiv(1).nome = "TERREO": ColNiv(1).cota = 3: ColNiv(1).peDireito = 3
FOR c = 1 TO CPilQtd
    Col(c).nome = CPil(c).nome: Col(c).secao = "R": Col(c).bx = 20: Col(c).by = 30: Col(c).x = CPil(c).x: Col(c).y = CPil(c).y
    ColEsf(ColIdx%(c, 1)).lex = 3: ColEsf(ColIdx%(c, 1)).ley = 3
NEXT
PgSomaPavimento 1, msg
AssertEq "colunas: cargas somadas", msg, ""
AssertNear "colunas: N = reacao + peso proprio do lance", ColEsf(ColIdx%(1, 1)).N, CPil(1).N + 0.2 * 0.3 * 3 * 2.5, 0.000001

' 6) dimensionamento dos pilares e .COL
PeDimensionaTodas 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertEq "pilares dimensionados sem avisos", msg, ""
AssertTrue "pilar com armadura >= minima", ColEsf(ColIdx%(1, 1)).asTot >= 0.008 * 600 - 0.000001
ColGrava dir + "FLUXO.COL"
ColQtd = 0
AssertTrue "col: le de volta", ColLe%(dir + "FLUXO.COL") AND ColQtd = 6

' 7) detalhamento das vigas -> .EDV, tabela de aco
AssertTrue "sec: le", VigLe%(dir + "FLUXO.SEC", "SEC")
FOR v = 1 TO VigQtd
    ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
NEXT
AssertTrue "posicoes de ferro geradas", VigPosQtd > 0
tot = DcTabelaAco#(compr(), peso())
AssertTrue "peso de aco positivo", tot > 0
VigGrava dir + "FLUXO.EDV", "EDV"
AssertTrue "edv: le de volta", VigLe%(dir + "FLUXO.EDV", "EDV") AND VigPosQtd > 0

' 8) desenho e saida para plotter / CAD
DcDesenhaViga 1, dir + "FLUXO_V.VET", 50, "FLUXO"
AssertTrue "plotter HP-GL gerado", VetParaHpgl%(dir + "FLUXO_V.VET", dir + "FLUXO_V.PLT") > 0
AssertTrue "CAD DXF gerado", VetParaDxf%(dir + "FLUXO_V.VET", dir + "FLUXO_V.DXF") > 0
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/common/SISPLOT.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJEGEOT.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJCALC.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJMONT.BM'
'$INCLUDE: '../src-reconstructed/viga/ARMCALC.BM'
'$INCLUDE: '../src-reconstructed/viga/VIGCALC.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILGECAL.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILCALC.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILEDCAL.BM'
'$INCLUDE: '../src-reconstructed/desenho/DESCALC.BM'
'$INCLUDE: '../src-reconstructed/common/SISTELA.BM'
