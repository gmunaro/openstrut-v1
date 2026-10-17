' Teste da montagem de cargas laje -> vigas/pilares (laje/LAJMONT.BM).
' Bordos na ordem do contrato: 1 esquerdo, 2 inferior, 3 direito, 4 superior.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM msg AS STRING, v AS INTEGER, t AS INTEGER, tot AS DOUBLE, i AS INTEGER

' A) laje isolada 4 x 5, p = 1 (q = 0.25), reacoes dadas
LajQtd = 1: LajObra = "T": LajNivel = 1
Poe 1, "L1", 0, 0, 4, 5, "V1/V2/V3/V4", 1, 0.25, 1.1, 0.9, 1.2, 0.95
LmMonta msg
AssertEq "A: sem avisos de montagem", AvisoSemCarga$(msg), ""
AssertTrue "A: 4 vigas", VigQtd = 4
AssertTrue "A: 4 pilares", CPilQtd = 4
v = AchaViga%("V2")
AssertTrue "A: V2 com 1 tramo", Vig(v).nTramos = 1
t = VigTramo%(v, 1)
AssertNear "A: V2 vao = lx", VigTra(t).vao, 4, 0.000001
AssertNear "A: V2 qPerm = r2 * (p-q)/p", VigTra(t).qPerm, 0.9 * 0.75, 0.000001
AssertNear "A: V2 qAcid = r2 * q/p", VigTra(t).qAcid, 0.9 * 0.25, 0.000001
v = AchaViga%("V1")
AssertNear "A: V1 (esquerda) vao = ly", VigTra(VigTramo%(v, 1)).vao, 5, 0.000001
AssertNear "A: V1 carga = r1", VigTra(VigTramo%(v, 1)).qPerm + VigTra(VigTramo%(v, 1)).qAcid, 1.1, 0.000001
AssertEq "A: P1 e o canto superior esquerdo", DadNome$(CPil(1).nome) + STR$(CPil(1).x) + STR$(CPil(1).y), "P1 0 5"
AssertTrue "A: secao inicial 12 x vao/10 (5 m -> 50)", Vig(v).bw = 12 AND Vig(v).h = 50

' B) duas lajes lado a lado 4x5 e 3x5 com viga central V3 compartilhada
LajQtd = 2
Poe 1, "L1", 0, 0, 4, 5, "V1/V2/V3/V4", 1, 0.25, 1, 1, 1.2, 1
Poe 2, "L2", 4, 0, 3, 5, "V3/V2/V5/V4", 1, 0.25, 1.1, 0.8, 0.9, 0.8
LmMonta msg
AssertTrue "B: 4 vigas (V1 V2 V3 V4 V5 -> 5)", VigQtd = 5
AssertTrue "B: 6 pilares", CPilQtd = 6
v = AchaViga%("V2")
AssertTrue "B: V2 inferior com 2 tramos", Vig(v).nTramos = 2
AssertNear "B: V2 tramo 1 = 4 m", VigTra(VigTramo%(v, 1)).vao, 4, 0.000001
AssertNear "B: V2 tramo 2 = 3 m", VigTra(VigTramo%(v, 2)).vao, 3, 0.000001
AssertNear "B: V2 tramo 2 carga = r2 de L2", VigTra(VigTramo%(v, 2)).qPerm + VigTra(VigTramo%(v, 2)).qAcid, 0.8, 0.000001
v = AchaViga%("V3")
AssertNear "B: V3 recebe as duas lajes", VigTra(VigTramo%(v, 1)).qPerm + VigTra(VigTramo%(v, 1)).qAcid, 1.2 + 1.1, 0.000001
tot = 0
FOR v = 1 TO VigQtd
    FOR t = 1 TO Vig(v).nTramos
        tot = tot + (VigTra(VigTramo%(v, t)).qPerm + VigTra(VigTramo%(v, t)).qAcid) * VigTra(VigTramo%(v, t)).vao
    NEXT
NEXT
AssertNear "B: total nas vigas = soma r*l das lajes", tot, (1 * 5 + 1 * 4 + 1.2 * 5 + 1 * 4) + (1.1 * 5 + 0.8 * 3 + 0.9 * 5 + 0.8 * 3), 0.000001

' C) reacoes incoerentes com a carga -> aviso de 3% (texto do original)
LajQtd = 1
Poe 1, "L1", 0, 0, 4, 5, "V1/V2/V3/V4", 1, 0.25, 0.5, 0.5, 0.5, 0.5
LmMonta msg
AssertTrue "C: aviso de 3%", INSTR(msg, "difere em mais de 3% da Carga total das Lajes") > 0
' coerentes (pL/4 em laje quadrada 4x4 => 4*4*1 = 16 = 4 * 1 * 4)
Poe 1, "L1", 0, 0, 4, 4, "V1/V2/V3/V4", 1, 0.25, 1, 1, 1, 1
LmMonta msg
AssertEq "C: sem aviso com reacoes coerentes", msg, ""

' D) bordo livre sem viga e balanco
Poe 1, "L1", 0, 0, 4, 4, "V1/V2/V3/-", 1, 0.25, 1, 1, 1, 0
LmMonta msg
AssertTrue "D: 3 vigas", VigQtd = 3
AssertEq "D: bordo livre sem reacao nao gera aviso de apoio", AvisoApoio$(msg), ""

' E) laje sem calculo
Laj(1).temRes = 0
LmMonta msg
AssertTrue "E: aviso de laje sem calculo", INSTR(msg, "Lajes sem calculo") > 0
AssertTrue "E: nada montado", VigQtd = 0 AND CPilQtd = 0
TestEnd

' Preenche a laje i com geometria, vigas, p, q e reacoes r1..r4.
SUB Poe (i AS INTEGER, nome AS STRING, x0 AS DOUBLE, y0 AS DOUBLE, lx AS DOUBLE, ly AS DOUBLE, vigas AS STRING, p AS DOUBLE, q AS DOUBLE, r1 AS DOUBLE, r2 AS DOUBLE, r3 AS DOUBLE, r4 AS DOUBLE)
    Laj(i).nome = nome: Laj(i).x0 = x0: Laj(i).y0 = y0: Laj(i).lx = lx: Laj(i).ly = ly
    Laj(i).vigas = vigas: Laj(i).p = p: Laj(i).q = q: Laj(i).temRes = -1
    Laj(i).r1 = r1: Laj(i).r2 = r2: Laj(i).r3 = r3: Laj(i).r4 = r4
END SUB

' Indice da viga pelo nome (0 se nao existe).
FUNCTION AchaViga% (nome AS STRING)
    DIM v AS INTEGER
    FOR v = 1 TO VigQtd
        IF DadNome$(Vig(v).nome) = nome THEN AchaViga% = v
    NEXT
END FUNCTION

' Avisos exceto a conferencia de 3% (que depende das reacoes de exemplo).
FUNCTION AvisoSemCarga$ (msg AS STRING)
    IF INSTR(msg, "3%") > 0 AND INSTR(msg, "|") = 0 THEN AvisoSemCarga$ = "" ELSE AvisoSemCarga$ = msg
END FUNCTION

' So o aviso de "reacao e sem viga de apoio", se houver.
FUNCTION AvisoApoio$ (msg AS STRING)
    IF INSTR(msg, "sem viga de apoio") > 0 THEN AvisoApoio$ = msg
END FUNCTION
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJMONT.BM'
