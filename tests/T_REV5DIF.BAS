' Rascunho da revisao 5 (teste diferencial V1 x V2, NB-1/78). Gera duas obras
' na pasta de dados recebida na linha de comando (como T_FLUXO.BAS) e imprime casos de
' pilar em flexao obliqua. Nao confere valores: so grava e imprime.
'  TRES: 3 lajes em fila (viga continua de 3 tramos), mu = 1,5 em L2, aco
'        CA-50 classe B, fck 0,20, viga V2 12x30 com parede 0,8 tf/m (armadura
'        dupla), 4 niveis iguais (carga acumulada), pilares 20x25, le 3,5 m.
'  BALC: L1 5x4 e L2 2x4 com bordo direito livre; vigas horizontais com
'        balanco de 2 m (apoio "-" em x = 7); CA-25; pilares 20x20, le 4,5 m.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISTELA.BI'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM dir AS STRING, msg AS STRING, i AS INTEGER, v AS INTEGER, t AS INTEGER, k AS INTEGER, c AS INTEGER, j AS INTEGER
DIM reac(1 TO 50) AS DOUBLE, x AS DOUBLE, ult AS INTEGER, a1 AS INTEGER, a2 AS INTEGER
dir = COMMAND$: IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" AND RIGHT$(dir, 1) <> "\" THEN dir = dir + "/"
OPEN dir + "T_REV5DIF.LOG" FOR OUTPUT AS #77

' ============================== TRES ======================================
i = CcaAcoClasse%(1)
x = LcFluencia#(3#)
LajObra = "TRES": LajNivel = 1: LajQtd = 3
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 5: Laj(2).ly = 5
Laj(3).nome = "L3": Laj(3).x0 = 9: Laj(3).y0 = 0: Laj(3).lx = 3.5: Laj(3).ly = 5
FOR i = 1 TO 3
    Laj(i).h = 10: Laj(i).g = 0.1: Laj(i).q = 0.3: Laj(i).bordos = "AAAA"
NEXT
LgDetectaContinuidade
LajGrava dir + "TRES.LAJ"
LajQtd = 0
AssertTrue "tres: le laj", LajLe%(dir + "TRES.LAJ")
x = LcMu#(2, 1.5#)
LcCalculaTodas 0.2, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
PRINT #77, "TRES lajes: "; msg
LajGrava dir + "TRES.LAJ"
LajQtd = 0
AssertTrue "tres: le laj+res", LajLe%(dir + "TRES.LAJ")
LmMonta msg
PRINT #77, "TRES montagem: "; msg
' viga horizontal em y = 0: 12 x 30 e parede de 0,8 tf/m (edicao no modulo VIGA)
FOR v = 1 TO VigQtd
    a1 = VigApoio%(v, 1): a2 = VigApoio%(v, Vig(v).nTramos + 1)
    IF VigApo(a1).y = 0 AND VigApo(a2).y = 0 THEN
        Vig(v).h = 30
        FOR t = 1 TO Vig(v).nTramos
            VigTra(VigTramo%(v, t)).qPerm = VigTra(VigTramo%(v, t)).qPerm + 0.8
        NEXT
        PRINT #77, "TRES viga editada: "; Vig(v).nome
    END IF
NEXT
VigGrava dir + "TRES.VIG", "VIG"
CPilGrava dir + "TRES.RLP", "RLP"
AssertTrue "tres: le vig", VigLe%(dir + "TRES.VIG", "VIG")
CPilQtd = 0: CPilObra = VigObra: CPilNivel = 1
FOR v = 1 TO VigQtd
    AssertTrue "tres: viga " + RTRIM$(Vig(v).nome), VcAnalisa%(v, -1, reac(), msg)
    VcDimensiona v, 0.2, 5, 1.4, 1.4, 1.15, 4, msg
    IF msg <> "" THEN PRINT #77, "TRES "; RTRIM$(Vig(v).nome); ": "; msg
    FOR k = 1 TO Vig(v).nTramos + 1
        j = VigApoio%(v, k)
        IF LEFT$(RTRIM$(VigApo(j).nome), 1) = "P" THEN i = CPilSoma%(RTRIM$(VigApo(j).nome), VigApo(j).x, VigApo(j).y, reac(k), 0, 0)
    NEXT
NEXT
VigGrava dir + "TRES.SEC", "SEC"
CPilGrava dir + "TRES.REP", "REP"
AssertTrue "tres: le rep", CPilLe%(dir + "TRES.REP", "REP")
ColObra = "TRES": ColNivQtd = 4: ColQtd = CPilQtd
FOR k = 1 TO 4
    ColNiv(k).nome = "N" + LTRIM$(STR$(k)): ColNiv(k).cota = 3.5 * (5 - k): ColNiv(k).peDireito = 3.5
NEXT
FOR c = 1 TO CPilQtd
    Col(c).nome = CPil(c).nome: Col(c).secao = "R": Col(c).bx = 20: Col(c).by = 25: Col(c).x = CPil(c).x: Col(c).y = CPil(c).y
    FOR k = 1 TO 4
        ColEsf(ColIdx%(c, k)).lex = 3.5: ColEsf(ColIdx%(c, k)).ley = 3.5
    NEXT
NEXT
FOR k = 1 TO 4
    PgSomaPavimento k, msg
    IF msg <> "" THEN PRINT #77, "TRES soma"; k; ": "; msg
NEXT
PgAcumula
PeDimensionaTodas 0.2, 5, 1.4, 1.4, 1.15, 4, msg
PRINT #77, "TRES pilares: "; msg
ColGrava dir + "TRES.COL"

' ============================== BALC ======================================
i = CcaAcoClasse%(0)
x = LcMu#(2, 1#)
LajObra = "BALC": LajNivel = 1: LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 5: Laj(1).ly = 4: Laj(1).bordos = "AAAA"
Laj(2).nome = "L2": Laj(2).x0 = 5: Laj(2).y0 = 0: Laj(2).lx = 2: Laj(2).ly = 4: Laj(2).bordos = "AALA"
Laj(3).nome = "": Laj(3).bordos = ""
FOR i = 1 TO 2
    Laj(i).h = 10: Laj(i).g = 0.1: Laj(i).q = 0.2: Laj(i).vigas = ""
NEXT
LgDetectaContinuidade
LajGrava dir + "BALC.LAJ"
LajQtd = 0
AssertTrue "balc: le laj", LajLe%(dir + "BALC.LAJ")
LcCalculaTodas 0.15, 2.5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
PRINT #77, "BALC lajes: "; msg
LajGrava dir + "BALC.LAJ"
LajQtd = 0
AssertTrue "balc: le laj+res", LajLe%(dir + "BALC.LAJ")
LmMonta msg
PRINT #77, "BALC montagem: "; msg
' balanco: apoio em x = 7 das vigas horizontais vira "-" (edicao no modulo VIGA)
FOR v = 1 TO VigQtd
    a1 = VigApoio%(v, 1): a2 = VigApoio%(v, Vig(v).nTramos + 1)
    IF VigApo(a1).y = VigApo(a2).y AND ABS(VigApo(a2).x - 7) < 0.001 THEN
        VigApo(a2).nome = "-"
        PRINT #77, "BALC balanco em "; Vig(v).nome
    END IF
NEXT
VigGrava dir + "BALC.VIG", "VIG"
CPilGrava dir + "BALC.RLP", "RLP"
AssertTrue "balc: le vig", VigLe%(dir + "BALC.VIG", "VIG")
CPilQtd = 0: CPilObra = VigObra: CPilNivel = 1
FOR v = 1 TO VigQtd
    AssertTrue "balc: viga " + RTRIM$(Vig(v).nome), VcAnalisa%(v, -1, reac(), msg)
    VcDimensiona v, 0.15, 2.5, 1.4, 1.4, 1.15, 4, msg
    IF msg <> "" THEN PRINT #77, "BALC "; RTRIM$(Vig(v).nome); ": "; msg
    FOR k = 1 TO Vig(v).nTramos + 1
        j = VigApoio%(v, k)
        IF LEFT$(RTRIM$(VigApo(j).nome), 1) = "P" THEN i = CPilSoma%(RTRIM$(VigApo(j).nome), VigApo(j).x, VigApo(j).y, reac(k), 0, 0)
    NEXT
NEXT
VigGrava dir + "BALC.SEC", "SEC"
CPilGrava dir + "BALC.REP", "REP"
AssertTrue "balc: le rep", CPilLe%(dir + "BALC.REP", "REP")
ColObra = "BALC": ColNivQtd = 1: ColQtd = CPilQtd
ColNiv(1).nome = "TERREO": ColNiv(1).cota = 4.5: ColNiv(1).peDireito = 4.5
FOR c = 1 TO CPilQtd
    Col(c).nome = CPil(c).nome: Col(c).secao = "R": Col(c).bx = 20: Col(c).by = 20: Col(c).x = CPil(c).x: Col(c).y = CPil(c).y
    ColEsf(ColIdx%(c, 1)).lex = 4.5: ColEsf(ColIdx%(c, 1)).ley = 4.5
NEXT
PgSomaPavimento 1, msg
PeDimensionaTodas 0.15, 2.5, 1.4, 1.4, 1.15, 4, msg
PRINT #77, "BALC pilares: "; msg
ColGrava dir + "BALC.COL"

' ============================== FLUXO (refeita com o codigo atual) ==========
i = CcaAcoClasse%(0)
x = LcFluencia#(1#)
x = LcMu#(2, 1#)
LajObra = "FLUXO": LajNivel = 1: LajQtd = 2
Laj(1).nome = "L1": Laj(1).x0 = 0: Laj(1).y0 = 0: Laj(1).lx = 4: Laj(1).ly = 5: Laj(1).h = 10: Laj(1).g = 0.1: Laj(1).q = 0.15: Laj(1).bordos = "": Laj(1).vigas = ""
Laj(2).nome = "L2": Laj(2).x0 = 4: Laj(2).y0 = 0: Laj(2).lx = 3.5: Laj(2).ly = 5: Laj(2).h = 10: Laj(2).g = 0.1: Laj(2).q = 0.15: Laj(2).bordos = "": Laj(2).vigas = ""
LgDetectaContinuidade
LajGrava dir + "FLUXO.LAJ"
LajQtd = 0
AssertTrue "fluxo: le laj", LajLe%(dir + "FLUXO.LAJ")
LcCalculaTodas 0.15, 5, 1.4, 1.4, 1.15, 1.5, 0.5, 6, 300, 500, 2, 0.0015, 0.001, 2.5, msg
LajGrava dir + "FLUXO.LAJ"
LajQtd = 0
AssertTrue "fluxo: le laj+res", LajLe%(dir + "FLUXO.LAJ")
LmMonta msg
VigGrava dir + "FLUXO.VIG", "VIG"
AssertTrue "fluxo: le vig", VigLe%(dir + "FLUXO.VIG", "VIG")
CPilQtd = 0: CPilObra = VigObra: CPilNivel = 1
FOR v = 1 TO VigQtd
    AssertTrue "fluxo: viga " + RTRIM$(Vig(v).nome), VcAnalisa%(v, -1, reac(), msg)
    VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
    FOR k = 1 TO Vig(v).nTramos + 1
        j = VigApoio%(v, k)
        IF LEFT$(RTRIM$(VigApo(j).nome), 1) = "P" THEN i = CPilSoma%(RTRIM$(VigApo(j).nome), VigApo(j).x, VigApo(j).y, reac(k), 0, 0)
    NEXT
NEXT
VigGrava dir + "FLUXO.SEC", "SEC"
CPilGrava dir + "FLUXO.REP", "REP"
AssertTrue "fluxo: le rep", CPilLe%(dir + "FLUXO.REP", "REP")
ColObra = "FLUXO": ColNivQtd = 1: ColQtd = CPilQtd
ColNiv(1).nome = "TERREO": ColNiv(1).cota = 3: ColNiv(1).peDireito = 3
FOR c = 1 TO CPilQtd
    Col(c).nome = CPil(c).nome: Col(c).secao = "R": Col(c).bx = 20: Col(c).by = 30: Col(c).x = CPil(c).x: Col(c).y = CPil(c).y
    ColEsf(ColIdx%(c, 1)).lex = 3: ColEsf(ColIdx%(c, 1)).ley = 3
NEXT
PgSomaPavimento 1, msg
PeDimensionaTodas 0.15, 5, 1.4, 1.4, 1.15, 4, msg
ColGrava dir + "FLUXO.COL"

' ======================= pilares avulsos (flexao obliqua) ==================
' caso: classe, fck, fyk, bx, by, le, N, Mx, My
ColQtd = 1: ColNivQtd = 1
Obl 1, 0, 0.15, 2.5, 20, 20, 4.5, 20, 1, 0.6
Obl 2, 0, 0.2, 5, 20, 30, 3.5, 40, 2, 1.5
Obl 3, 1, 0.2, 5, 20, 30, 3.5, 40, 2, 1.5
Obl 4, 0, 0.2, 5, 20, 30, 3.5, 60, 0, 2
Obl 5, 1, 0.2, 5, 20, 25, 3.5, 80, 1.5, 1
Obl 6, 0, 0.15, 5, 20, 40, 5, 50, 3, 1
Obl 7, 0, 0.15, 5, 20, 30, 3, 25, 0.8, 0.5
Obl 8, 1, 0.2, 5, 25, 25, 4.5, 35, 1, 1
Obl 9, 0, 0.15, 2.5, 20, 30, 3.6, 20, 0.6, 0.4
Obl 10, 0, 0.2, 5, 20, 30, 4.5, 30, 0, 0
CLOSE #77
TestEnd

SUB Obl (caso AS INTEGER, classe AS INTEGER, fck AS DOUBLE, fyk AS DOUBLE, bx AS DOUBLE, by AS DOUBLE, le AS DOUBLE, N AS DOUBLE, Mx AS DOUBLE, My AS DOUBLE)
    DIM i AS INTEGER, j AS INTEGER, m AS STRING
    i = CcaAcoClasse%(classe)
    Col(1).nome = "PX": Col(1).secao = "R": Col(1).bx = bx: Col(1).by = by
    j = ColIdx%(1, 1)
    ColEsf(j).N = N: ColEsf(j).Mx = Mx: ColEsf(j).My = My: ColEsf(j).lex = le: ColEsf(j).ley = le
    PeDimensiona 1, 1, fck, fyk, 1.4, 1.4, 1.15, 4, m
    PRINT #77, "OBL"; caso; "asTot="; ColEsf(j).asTot; "phi="; ColEsf(j).phi; "n="; ColEsf(j).nBarras; "phiT="; ColEsf(j).phiEstribo; "s="; ColEsf(j).sEstribo; " msg="; m
END SUB
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
