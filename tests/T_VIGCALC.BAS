' Teste da viga continua (viga/VIGCALC.BM) contra solucoes fechadas.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM v AS INTEGER, t AS INTEGER, msg AS STRING, ok AS INTEGER, tot AS DOUBLE
DIM r(1 TO 20) AS DOUBLE

' biapoiada q = 2, L = 5 (sem peso proprio)
VigLimpa: v = Monta%("V1", 1, 5, 2, 0, "P1", "P2", "")
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "biapoiada M = qL2/8", VigTra(VigTramo%(v, 1)).mPos, 2 * 25 / 8, 0.0001
AssertNear "biapoiada R = qL/2", r(1), 5, 0.000001
AssertNear "biapoiada V = qL/2", VigTra(VigTramo%(v, 1)).vEsq, 5, 0.000001

' biapoiada com P = 4 no meio, L = 6
VigLimpa: v = Monta%("V2", 1, 6, 0, 0, "P1", "P2", "")
VigAddConc VigTramo%(v, 1), 3, 4
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "carga concentrada PL/4", VigTra(VigTramo%(v, 1)).mPos, 6, 0.0001
AssertNear "carga concentrada R = P/2", r(2), 2, 0.000001

' dois vaos iguais q = 1, L = 4
VigLimpa: v = Monta%("V3", 2, 4, 1, 0, "P1", "P2", "P3")
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "2 vaos: M apoio = -qL2/8", VigTra(VigTramo%(v, 1)).mNegDir, -2, 0.000001
AssertNear "2 vaos: M apoio visto do tramo 2", VigTra(VigTramo%(v, 2)).mNegEsq, -2, 0.000001
AssertNear "2 vaos: R central = 1.25qL", r(2), 5, 0.000001
AssertNear "2 vaos: R extremo = 0.375qL", r(1), 1.5, 0.000001
AssertNear "2 vaos: M+ = 9qL2/128", VigTra(VigTramo%(v, 1)).mPos, 9 * 16 / 128, 0.002

' dois vaos com acidental so no 1o (qPerm = 0): M apoio = -qL2/16
VigLimpa: v = Monta%("V4", 2, 4, 0, 0, "P1", "P2", "P3")
VigTra(VigTramo%(v, 1)).qAcid = 1
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "acidental num vao: M apoio = -qL2/16", VigTra(VigTramo%(v, 1)).mNegDir, -1, 0.000001

' envoltoria: alternancia aumenta o positivo
VigLimpa: v = Monta%("V5", 2, 4, 1, 1, "P1", "P2", "P3")
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "envoltoria: M+ com alternancia > tudo carregado (9qL2/128, q=2)", VigTra(VigTramo%(v, 1)).mPos > 9 * 2 * 16 / 128 + 0.01
AssertNear "envoltoria: M- igual a tudo carregado", VigTra(VigTramo%(v, 1)).mNegDir, -4, 0.000001

' tres vaos iguais: M apoios internos = -0.1 qL2
VigLimpa: v = Monta%("V6", 3, 5, 1, 0, "P1", "P2", "P3")
VigApo(VigApoio%(v, 4)).nome = "P4"
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "3 vaos: M apoio interno = -0.1qL2", VigTra(VigTramo%(v, 1)).mNegDir, -2.5, 0.000001
AssertNear "3 vaos: simetria", VigTra(VigTramo%(v, 3)).mNegEsq, -2.5, 0.000001

' engaste (apoio "ENG"): engastada-apoiada q = 1, L = 4:
' M engaste = -qL2/8 = -2, M+ = 9qL2/128 = 1,125, R = 5qL/8 = 2,5 e 3qL/8 = 1,5
VigLimpa: v = Monta%("VE1", 1, 4, 1, 0, "ENG", "P1", "")
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "engastada-apoiada: estavel", ok
AssertNear "engastada-apoiada: M engaste = -qL2/8", VigTra(VigTramo%(v, 1)).mNegEsq, -2, 0.000001
AssertNear "engastada-apoiada: M+ = 9qL2/128", VigTra(VigTramo%(v, 1)).mPos, 1.125, 0.002
AssertNear "engastada-apoiada: R engaste = 5qL/8", r(1), 2.5, 0.000001
AssertNear "engastada-apoiada: R apoio = 3qL/8", r(2), 1.5, 0.000001
' biengastada q = 1, L = 4: M extremos = -qL2/12, M+ = qL2/24
VigLimpa: v = Monta%("VE2", 1, 4, 1, 0, "ENG", "ENG", "")
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "biengastada: M esquerdo = -qL2/12", VigTra(VigTramo%(v, 1)).mNegEsq, -16 / 12, 0.000001
AssertNear "biengastada: M direito = -qL2/12", VigTra(VigTramo%(v, 1)).mNegDir, -16 / 12, 0.000001
AssertNear "biengastada: M+ = qL2/24", VigTra(VigTramo%(v, 1)).mPos, 16 / 24, 0.002
' balanco engastado (ENG e ponta livre) q = 3, L = 2: M = -qL2/2, R = qL
VigLimpa: v = Monta%("VE3", 1, 2, 3, 0, "ENG", "-", "")
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "balanco engastado: estavel", ok
AssertNear "balanco engastado: M = -qL2/2", VigTra(VigTramo%(v, 1)).mNegEsq, -6, 0.000001
AssertNear "balanco engastado: R = qL", r(1), 6, 0.000001
' engaste + dois vaos (A engastado, B e C apoiados), q = 1, L = 4. Rotacoes:
' 2 thB + 0,5 thC = 0 e 0,5 thB + thC = -qL2/12 -> thC = -1,5238, thB = 0,38095;
' M_A = -qL2/12 + 0,5 thB = -qL2/14; M_B = -(qL2/12 + 0,5 . 2 thB) = -3qL2/28
VigLimpa: v = Monta%("VE4", 2, 4, 1, 0, "ENG", "P1", "P2")
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "engaste + 2 vaos: M_A = -qL2/14", VigTra(VigTramo%(v, 1)).mNegEsq, -16 / 14, 0.000001
AssertNear "engaste + 2 vaos: M_B = -3qL2/28", VigTra(VigTramo%(v, 1)).mNegDir, -48 / 28, 0.000001
AssertNear "engaste + 2 vaos: equilibrio", r(1) + r(2) + r(3), 8, 0.000001
' engaste a direita (apoiada-engastada) q = 1, L = 4: espelho da VE1:
' M engaste = -qL2/8 = -2, M+ = 9qL2/128 = 1,125, R apoio = 3qL/8 = 1,5, R engaste = 5qL/8 = 2,5
VigLimpa: v = Monta%("VE5", 1, 4, 1, 0, "P1", "ENG", "")
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "apoiada-engastada: estavel", ok
AssertNear "apoiada-engastada: M engaste (dir) = -qL2/8", VigTra(VigTramo%(v, 1)).mNegDir, -2, 0.000001
AssertNear "apoiada-engastada: sem negativo no apoio simples", VigTra(VigTramo%(v, 1)).mNegEsq, 0, 0
AssertNear "apoiada-engastada: M+ = 9qL2/128", VigTra(VigTramo%(v, 1)).mPos, 1.125, 0.002
AssertNear "apoiada-engastada: R apoio = 3qL/8", r(1), 1.5, 0.000001
AssertNear "apoiada-engastada: R engaste = 5qL/8", r(2), 2.5, 0.000001
' engaste + balanco (ENG, P1, "-"), q = 1, vao 4 m e balanco 2 m:
' M_B = -q a2/2 = -2; transporte ao engaste (fator 1/2): M_A = -qL2/8 - M_B/2 = -2 + 1 = -1
' V_A = (M_B - M_A + qL2/2)/L = (-2 + 1 + 8)/4 = 1,75 = R_A; R_B = (4 - 1,75) + 2 = 4,25
' M+ em x = 1,75: -1 + 1,75 x 1,75 - 1,75^2/2 = 0,53125
VigLimpa: v = Monta%("VE6", 2, 4, 1, 0, "ENG", "P1", "-")
VigTra(VigTramo%(v, 2)).vao = 2
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "engaste + balanco: estavel", ok
AssertNear "engaste + balanco: M_A = -1", VigTra(VigTramo%(v, 1)).mNegEsq, -1, 0.000001
AssertNear "engaste + balanco: M_B = -qa2/2 = -2", VigTra(VigTramo%(v, 1)).mNegDir, -2, 0.000001
AssertNear "engaste + balanco: M+ = 0,53125", VigTra(VigTramo%(v, 1)).mPos, 0.53125, 0.002
AssertNear "engaste + balanco: R engaste = 1,75", r(1), 1.75, 0.000001
AssertNear "engaste + balanco: R apoio = 4,25", r(2), 4.25, 0.000001
AssertNear "engaste + balanco: ponta sem reacao", r(3), 0, 0
' "ENG" num apoio interno: vira apoio continuo (2 vaos iguais, M = -qL2/8) com aviso
VigLimpa: v = Monta%("VE7", 2, 4, 1, 0, "P1", "ENG", "P2")
ok = VcAnalisa%(v, 0, r(), msg)
AssertTrue "ENG interno: analisada", ok
AssertNear "ENG interno: apoio continuo M = -qL2/8", VigTra(VigTramo%(v, 1)).mNegDir, -2, 0.000001
AssertTrue "ENG interno: aviso em msg", INSTR(msg, "ENG no apoio interno") > 0

' balanco a direita: L = 2, q = 3 -> M = -qL2/2 no apoio
VigLimpa: v = Monta%("V7", 2, 4, 3, 0, "P1", "P2", "-")
VigTra(VigTramo%(v, 2)).vao = 2
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "balanco direito: M apoio = -qL2/2", VigTra(VigTramo%(v, 2)).mNegEsq, -6, 0.000001
AssertNear "balanco: continuidade do momento", VigTra(VigTramo%(v, 1)).mNegDir, -6, 0.000001
AssertNear "balanco: equilibrio", r(1) + r(2) + r(3), 3 * 6, 0.000001
AssertNear "balanco: ponta sem reacao", r(3), 0, 0

' balanco a esquerda com carga concentrada na ponta: M = -P L
VigLimpa: v = Monta%("V8", 2, 4, 0, 0, "-", "P1", "P2")
VigTra(VigTramo%(v, 1)).vao = 1.5
VigAddConc VigTramo%(v, 1), 0, 2
ok = VcAnalisa%(v, 0, r(), msg)
AssertNear "balanco esquerdo: M = -P*L", VigTra(VigTramo%(v, 1)).mNegDir, -3, 0.000001

' equilibrio caso misto com peso proprio e concentradas
VigLimpa: v = Monta%("V9", 3, 4, 1.2, 0, "P1", "P2", "P3")
VigApo(VigApoio%(v, 4)).nome = "P4"
VigTra(VigTramo%(v, 2)).vao = 6
VigAddConc VigTramo%(v, 2), 2, 3
VigAddConc VigTramo%(v, 3), 1, 1.5
ok = VcAnalisa%(v, -1, r(), msg)
tot = (1.2 + 0.2 * 0.5 * 2.5) * 14 + 4.5
AssertNear "equilibrio com peso proprio", r(1) + r(2) + r(3) + r(4), tot, 0.000001

' instavel
VigLimpa: v = Monta%("VX", 1, 3, 1, 0, "-", "-", "")
AssertTrue "viga instavel recusada", VcAnalisa%(v, 0, r(), msg) = 0

' dimensionamento: armadura positiva cobre o momento e estribo >= minimo
VigLimpa: v = Monta%("V10", 1, 5, 2, 0, "P1", "P2", "")
ok = VcAnalisa%(v, 0, r(), msg)
VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
t = VigTramo%(v, 1)
AssertNear "d = h - cob", Vig(v).d, 46, 0
AssertNear "As+ = flexao de 1.4 M", VigTra(t).asPos, CcaAsFlexao#(1.4 * 6.25 * 100, 20, 46, 0.15 / 1.4, 5 / 1.15), 0.000001
AssertTrue "barras cobrem As", VigTra(t).nPos * CcaAreaBarra#(VigTra(t).phiPos) >= VigTra(t).asPos
AssertTrue "estribo >= minimo", VigTra(t).aswEsq >= 0.0014 * 20 * 100 - 0.000001
AssertTrue "sem negativo em biapoiada", VigTra(t).nNegEsq = 0
AssertEq "sem avisos", msg, ""
' estabilidade: 1 apoio real so (balanco + apoio) e instavel
VigLimpa: v = Monta%("VY", 1, 3, 1, 0, "-", "P1", "")
AssertTrue "um apoio so: instavel", VcAnalisa%(v, 0, r(), msg) = 0
VigLimpa: v = Monta%("VZ", 2, 3, 1, 0, "-", "P1", "-")
AssertTrue "dois balancos sobre um apoio: instavel", VcAnalisa%(v, 0, r(), msg) = 0
' barras que cabem na alma (largura util = bw - 2 x (2 + 0,5))
DIM phB AS DOUBLE, nB AS INTEGER, cabe AS INTEGER, mB AS STRING
CcaEscolheBarrasBw 3.96, 12, 2, phB, nB, cabe
AssertTrue "bw 12, As 3,96: cabe numa camada", cabe = 1 AND CcaLarguraCamada#(nB, phB) <= 7
AssertTrue "bw 12, As 3,96: area >= requerida", nB * CcaAreaBarra#(phB) >= 3.96
AssertNear "largura de 2 phi 16 = 3,2 + 2,28", CcaLarguraCamada#(2, 16), 5.48, 0.000001
CcaEscolheBarrasBw 25, 12, 2, phB, nB, cabe
AssertTrue "bw 12, As 25: nao cabe, arranjo mais estreito", cabe = 0 AND nB * CcaAreaBarra#(phB) >= 25
CcaEscolheBarrasBw 70, 20, 2, phB, nB, cabe
AssertTrue "As 70 (> 8 phi 32): sem solucao", cabe = -1 AND nB = 0
mB = ""
VcEscolheBarras 70, 20, 4, phB, nB, mB, "VX", 1
AssertTrue "VcEscolheBarras avisa sem solucao", INSTR(mB, "aumente a secao") > 0
mB = ""
VcEscolheBarras 3.96, 12, 4, phB, nB, mB, "VX", 1
AssertEq "VcEscolheBarras: secao padrao 12 cm sem aviso", mB, ""

' armadura dupla no VcDimensiona (antes: "secao insuficiente"). 20x50, d = 46, d' = 3,5,
' classe A: xl = 0,62832 x 46 = 28,9028; MdLim = 0,85 fcd b 0,8 xl (d - 0,4 xl) = 1450,41 tf.cm
' (Mk = 10,36 tf.m). Biapoiada L = 5, q = 3,84: Mk = qL2/8 = 12 -> Md = 1680 tf.cm.
' es' = 0,0035 (xl - 3,5)/xl = 0,003076 > eyd -> s's = fyd.
' As = MdLim/(fyd (d - 0,4 xl)) + (Md - MdLim)/(fyd (d - d')) = 9,6866 + 1,2425 = 10,9290
' As' = (Md - MdLim)/(fyd (d - d')) = 1,2425 (so no aviso: o .SEC nao tem campo para As')
VigLimpa: v = Monta%("VD1", 1, 5, 3.84, 0, "P1", "P2", "")
ok = VcAnalisa%(v, 0, r(), msg)
VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
t = VigTramo%(v, 1)
AssertNear "dupla: As tracionada = 10,929", VigTra(t).asPos, 10.92905, 0.0001
AssertTrue "dupla: aviso de As' (nao gravada no .SEC)", INSTR(msg, "armadura dupla no M+, As' = 1.24") > 0
AssertTrue "dupla: nao e secao insuficiente", INSTR(msg, "insuficiente") = 0
' acima de 4% de Ac: Mk = 60 (q = 19,2) -> As = 47,30 e As' = 37,61; soma 84,9 > 40 cm2
VigLimpa: v = Monta%("VD2", 1, 5, 19.2, 0, "P1", "P2", "")
ok = VcAnalisa%(v, 0, r(), msg)
VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertTrue "As + As' > 4% Ac: secao insuficiente", INSTR(msg, "secao insuficiente") > 0
AssertNear "As + As' > 4% Ac: As = -1", VigTra(VigTramo%(v, 1)).asPos, -1, 0
' estribo minimo pelo aco: CA-25 (fyk 2,5) -> 0,25% x 20 x 100 = 5 cm2/m (RECONSTRUCAO)
VigLimpa: v = Monta%("VC25", 1, 3, 0.5, 0, "P1", "P2", "")
ok = VcAnalisa%(v, 0, r(), msg)
VcDimensiona v, 0.15, 2.5, 1.4, 1.4, 1.15, 4, msg
AssertNear "estribo minimo CA-25 = 5 cm2/m", VigTra(VigTramo%(v, 1)).aswEsq, 5, 0.000001
VcDimensiona v, 0.15, 5, 1.4, 1.4, 1.15, 4, msg
AssertNear "estribo minimo CA-50 = 0,14% -> 2,8 cm2/m", VigTra(VigTramo%(v, 1)).aswEsq, 2.8, 0.000001

' rho1 do tc no apoio: so a parcela da positiva que chega ao apoio (1/3 sem
' negativo, 1/4 com negativo), nao a positiva do vao inteiro (revisao V1).
' a mao: asPos = 6 -> 6/3 = 2 (apoio simples); 6/4 = 1,5 < asNeg 3 (apoio com M-).
AssertNear "rho1 no apoio simples: 1/3 da positiva", VcAsLong#(6, 0), 2, 0.000001
AssertNear "rho1 no apoio com negativo: min(1/4 da positiva; negativa)", VcAsLong#(6, 3), 1.5, 0.000001
AssertNear "rho1: negativa menor que 1/4 da positiva", VcAsLong#(6, 1), 1, 0.000001
TestEnd

' Monta viga de nT tramos iguais (vao L, qPerm, qAcid) com secao 20x50 e apoios a1..a3.
FUNCTION Monta% (nome AS STRING, nT AS INTEGER, L AS DOUBLE, qp AS DOUBLE, qa AS DOUBLE, a1 AS STRING, a2 AS STRING, a3 AS STRING)
    DIM v AS INTEGER, t AS INTEGER
    v = VigAdiciona%(nome, nT, 20, 50)
    VigApo(VigApoio%(v, 1)).nome = a1: VigApo(VigApoio%(v, 2)).nome = a2
    IF nT >= 2 THEN VigApo(VigApoio%(v, 3)).nome = a3
    FOR t = 1 TO nT
        VigTra(VigTramo%(v, t)).vao = L: VigTra(VigTramo%(v, t)).qPerm = qp: VigTra(VigTramo%(v, t)).qAcid = qa
    NEXT
    Monta% = v
END FUNCTION
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/viga/ARMCALC.BM'
'$INCLUDE: '../src-reconstructed/viga/VIGCALC.BM'
