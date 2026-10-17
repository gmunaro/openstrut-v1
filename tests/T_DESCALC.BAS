' Teste do detalhamento de vigas (desenho/DESCALC.BM).
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISTELA.BI'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM v AS INTEGER, t AS INTEGER, ult AS INTEGER, j AS INTEGER, dir AS STRING, tot AS DOUBLE
DIM compr(1 TO 9) AS DOUBLE, peso(1 TO 9) AS DOUBLE, achou AS INTEGER, lb AS DOUBLE
dir = COMMAND$: IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" THEN dir = dir + "/"

' ancoragem phi 10, fck 15 MPa, CA-50:
' fcd = 0.15/1.4*98.0665 = 10.507 MPa; tbu = 0.42*10.507^(2/3) = 2.0149 MPa
' fyd = 5/1.15*98.0665 = 426.38 MPa; lb = 1.0/4 * 426.38/2.0149 = 52.90 cm
AssertNear "ancoragem phi10 fck15 CA-50", DcAncoragem#(10, 0.15, 1.4, 5, 1.15), 52.90, 0.002
AssertNear "ancoragem proporcional a phi", DcAncoragem#(20, 0.15, 1.4, 5, 1.15) / DcAncoragem#(10, 0.15, 1.4, 5, 1.15), 2, 0.000001
AssertNear "peso phi10 = 0.617 kg/m", DcPesoMetro#(10), 0.6165, 0.001
AssertNear "estribo 20x50 cob 2.5 phi5", DcComprEstribo#(20, 50, 2.5, 5), 2 * 15 + 2 * 45 + 10, 0.000001

' viga de 2 tramos (4 m e 5 m) com negativo no apoio central
VigLimpa
v = VigAdiciona%("V1", 2, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2": VigApo(VigApoio%(v, 3)).nome = "P3"
t = VigTramo%(v, 1): VigTra(t).vao = 4: VigTra(t).phiPos = 12.5: VigTra(t).nPos = 3
VigTra(t).phiNegDir = 16: VigTra(t).nNegDir = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
t = VigTramo%(v, 2): VigTra(t).vao = 5: VigTra(t).phiPos = 12.5: VigTra(t).nPos = 4
VigTra(t).phiNegEsq = 16: VigTra(t).nNegEsq = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
t = VigTramo%(v, 1)
' Negativo e barra superior de viga com h = 50 >= 30: ma aderencia, lb x 1,5
' (lb phi16 = 84,65 -> 126,97). O negativo cobre 125 + 126,97 = 251,97 cm de cada
' vao; o resto do vao (400 e 500 cm) fica sem barra em cima, entao os dois tramos
' passam a ter porta-estribos (antes o tramo com negativo numa ponta ficava sem).
AssertTrue "tramo 1: positivo, negativo, porta-estribos e estribo (4 posicoes)", VigTra(t).nPosFerro = 4
j = VigTra(t).iPosFerro
AssertNear "N1 positivo: vao + 2x10phi", VigPos(j).compr, 400 + 25, 0.000001
AssertEq "N1 forma U", VigPos(j).forma, "U"
lb = 1.5 * DcAncoragem#(16, 0.15, 1.4, 5, 1.15)
AssertNear "N2 negativo: 2 x (0.25 x 5 m + 1,5 lb) = 503,94", VigPos(j + 1).compr, 2 * (125 + 126.9713), 0.00001
AssertTrue "N3 porta-estribos 2 phi 6.3", VigPos(j + 2).phi = 6.3 AND VigPos(j + 2).n = 2
AssertNear "N4 estribos: 400/15 + 1 = 27", VigPos(j + 3).n, 27, 0
AssertEq "N4 forma E", VigPos(j + 3).forma, "E"
t = VigTramo%(v, 2)
AssertTrue "tramo 2: positivo, porta-estribos e estribo (negativo ja na N2)", VigTra(t).nPosFerro = 3
AssertTrue "numeracao sequencial ate N7", ult = 7
' sem negativo -> porta-estribos
VigLimpa
v = VigAdiciona%("V2", 1, 15, 40)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).phiPos = 10: VigTra(t).nPos = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 20
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
achou = 0
FOR j = VigTra(t).iPosFerro TO VigTra(t).iPosFerro + VigTra(t).nPosFerro - 1
    IF VigPos(j).phi = 6.3 AND VigPos(j).n = 2 THEN achou = -1
NEXT
AssertTrue "porta-estribos 2 phi 6.3", achou
' tabela de aco: 2 phi10 x (300+20) cm = 6.4 m
tot = DcTabelaAco#(compr(), peso())
AssertNear "tabela: metros de phi 10", compr(4), 6.4, 0.000001
AssertNear "tabela: peso total = soma das bitolas", tot, peso(1) + peso(2) + peso(4), 0.000001
' desenho
DcDesenhaViga v, dir + "V2.VET", 50, "OBRA T"
AssertTrue "desenho gerado e convertivel", VetParaHpgl%(dir + "V2.VET", dir + "V2.PLT") > 5
' round-trip .EDV com as posicoes
VigGrava dir + "T.EDV", "EDV"
VigLimpa
AssertTrue "EDV le de volta", VigLe%(dir + "T.EDV", "EDV")
AssertTrue "EDV preserva posicoes", VigTra(VigTramo%(1, 1)).nPosFerro = 3
' balanco a direita preservado no caminho .SEC -> detalhamento
VigLimpa
v = VigAdiciona%("V3", 2, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2": VigApo(VigApoio%(v, 3)).nome = "-"
t = VigTramo%(v, 1): VigTra(t).vao = 4: VigTra(t).phiPos = 10: VigTra(t).nPos = 2: VigTra(t).phiNegDir = 10: VigTra(t).nNegDir = 5: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
t = VigTramo%(v, 2): VigTra(t).vao = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
VigGrava dir + "B.SEC", "SEC"
VigLimpa
AssertTrue "sec com balanco: le", VigLe%(dir + "B.SEC", "SEC")
AssertEq "sec preserva apoio de balanco", DadNome$(VigApo(VigApoio%(1, 3)).nome), "-"
ult = DcDetalha%(1, 1, 2.5, 0.15, 1.4, 5, 1.15)
t = VigTramo%(1, 1)
achou = 0
FOR j = VigTra(t).iPosFerro TO VigTra(t).iPosFerro + VigTra(t).nPosFerro - 1
    IF VigPos(j).forma = "L" THEN achou = -1: lb = VigPos(j).compr
NEXT
AssertTrue "negativo do balanco em forma L", achou
' h = 50: ma aderencia, lb phi10 = 1,5 x 52,90 = 79,36
AssertNear "negativo cobre 0,25 x 4 m + balanco 2 m + 1,5 lb", lb, 100 + 200 + 79.357, 0.00001
' tabela de aco ignora posicoes orfas de detalhamento repetido
DIM p1 AS DOUBLE, p2 AS DOUBLE
p1 = DcTabelaAco#(compr(), peso())
ult = DcDetalha%(1, 1, 2.5, 0.15, 1.4, 5, 1.15)
p2 = DcTabelaAco#(compr(), peso())
AssertNear "detalhar de novo nao duplica o peso", p2, p1, 0.000001

' ancoragem de negativo (barra superior): ma aderencia com h >= 30 cm, tbu x 2/3 -> lb x 1,5
AssertNear "lb negativo phi10, h = 50: 1,5 x 52,90 = 79,36", DcAncoragemNeg#(10, 0.15, 1.4, 5, 1.15, 50), 79.357, 0.0002
AssertNear "lb negativo phi10, h = 25: boa aderencia 52,90", DcAncoragemNeg#(10, 0.15, 1.4, 5, 1.15, 25), 52.90, 0.002
AssertNear "lb negativo h = 30 ja e ma aderencia", DcAncoragemNeg#(10, 0.15, 1.4, 5, 1.15, 30), 79.357, 0.0002

' engastada-apoiada (ENG a esquerda), 1 tramo de 5 m, 20x50, negativo 3 phi 12.5 no engaste:
' lb phi12.5 = 66,13 x 1,5 = 99,20 (ma aderencia). Barra: 0,25 x 500 + lb (vao) + lb (apoio)
' + gancho 10 phi = 125 + 198,39 + 12,5 = 335,89 cm, forma L, antes do positivo.
' Cobre 125 + 99,20 = 224,20 < 500 cm: porta-estribos continua.
VigLimpa
v = VigAdiciona%("VE", 1, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "ENG": VigApo(VigApoio%(v, 2)).nome = "P1"
t = VigTramo%(v, 1): VigTra(t).vao = 5: VigTra(t).phiPos = 10: VigTra(t).nPos = 3
VigTra(t).phiNegEsq = 12.5: VigTra(t).nNegEsq = 3: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
j = VigTra(t).iPosFerro
AssertTrue "engaste esq: negativo, positivo, porta-estribos, estribo", VigTra(t).nPosFerro = 4
AssertNear "engaste esq: N1 3 phi 12.5", VigPos(j).phi * 10 + VigPos(j).n, 128, 0
AssertNear "engaste esq: N1 = 0,25 L + 2 x 1,5 lb + 10 phi = 335,89", VigPos(j).compr, 335.893, 0.00001
AssertEq "engaste esq: N1 forma L (gancho no apoio)", VigPos(j).forma, "L"
AssertEq "engaste esq: N2 positivo", VigPos(j + 1).forma, "U"
AssertTrue "engaste esq: porta-estribos mantido", VigPos(j + 2).phi = 6.3 AND VigPos(j + 2).n = 2
DcDesenhaViga v, dir + "VE.VET", 50, "OBRA T"
AssertTrue "engaste esq: desenho gerado", VetParaHpgl%(dir + "VE.VET", dir + "VE.PLT") > 5
' espelho: apoiada-engastada (ENG a direita), negativo no NegDir do ultimo tramo
VigLimpa
v = VigAdiciona%("VD", 1, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "ENG"
t = VigTramo%(v, 1): VigTra(t).vao = 5: VigTra(t).phiPos = 10: VigTra(t).nPos = 3
VigTra(t).phiNegDir = 12.5: VigTra(t).nNegDir = 3: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
j = VigTra(t).iPosFerro
AssertTrue "engaste dir: positivo, negativo, porta-estribos, estribo", VigTra(t).nPosFerro = 4
AssertNear "engaste dir: N2 = 335,89", VigPos(j + 1).compr, 335.893, 0.00001
AssertEq "engaste dir: N2 forma L", VigPos(j + 1).forma, "L"
' vaos curtos: 2 x 1,5 m, negativo phi16 no apoio central cobre 37,5 + 126,97 = 164,47 >= 150
' em cada tramo -> sem porta-estribos
VigLimpa
v = VigAdiciona%("VC", 2, 20, 50)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2": VigApo(VigApoio%(v, 3)).nome = "P3"
t = VigTramo%(v, 1): VigTra(t).vao = 1.5: VigTra(t).phiPos = 10: VigTra(t).nPos = 2
VigTra(t).phiNegDir = 16: VigTra(t).nNegDir = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
t = VigTramo%(v, 2): VigTra(t).vao = 1.5: VigTra(t).phiPos = 10: VigTra(t).nPos = 2
VigTra(t).phiNegEsq = 16: VigTra(t).nNegEsq = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
AssertTrue "negativo cobre o vao curto: sem porta-estribos no tramo 1", VigTra(VigTramo%(v, 1)).nPosFerro = 3
AssertTrue "negativo cobre o vao curto: sem porta-estribos no tramo 2", VigTra(VigTramo%(v, 2)).nPosFerro = 2

' Balanco de 1 tramo engastado a esquerda (apoios ENG e -, como o VE3 do T_VIGCALC):
' L = 3 m, 15x25 (h < 30: boa aderencia), negativo 3 phi10 no engaste, C15, CA-50.
' lb phi10 = 52,90 cm (conta no topo). M(x) = M_eng (1 - x/L)^2 so zera na ponta livre,
' entao a barra corre o balanco inteiro e ancora lb no engaste: 300 + 52,90 = 352,90 cm,
' forma L (gancho na ponta livre). Ela cobre o vao todo: sem porta-estribo.
' Antes: 0,25 x 300 + 2 x 52,90 + 10 = 190,80 cm, cobrindo 75 + 52,90 = 127,90 cm; nos
' 172,1 cm restantes M chegava a (172,1 / 300)^2 = 33 % de M_eng so com 2 phi 6,3.
VigLimpa
v = VigAdiciona%("VB", 1, 15, 25)
VigApo(VigApoio%(v, 1)).nome = "ENG": VigApo(VigApoio%(v, 2)).nome = "-"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).phiPos = 10: VigTra(t).nPos = 2
VigTra(t).phiNegEsq = 10: VigTra(t).nNegEsq = 3: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
j = VigTra(t).iPosFerro
AssertTrue "balanco ENG/-: negativo, positivo e estribo, sem porta-estribo", VigTra(t).nPosFerro = 3
AssertNear "balanco ENG/-: N1 = L + lb = 300 + 52,90 = 352,90", VigPos(j).compr, 352.90, 0.002
AssertEq "balanco ENG/-: N1 forma L (gancho na ponta livre)", VigPos(j).forma, "L"
' espelho: balanco a esquerda (apoios - e ENG), negativo no NegDir
VigLimpa
v = VigAdiciona%("VB2", 1, 15, 25)
VigApo(VigApoio%(v, 1)).nome = "-": VigApo(VigApoio%(v, 2)).nome = "ENG"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).phiPos = 10: VigTra(t).nPos = 2
VigTra(t).phiNegDir = 10: VigTra(t).nNegDir = 3: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
j = VigTra(t).iPosFerro
AssertTrue "balanco -/ENG: positivo, negativo e estribo, sem porta-estribo", VigTra(t).nPosFerro = 3
AssertNear "balanco -/ENG: N2 = 352,90", VigPos(j + 1).compr, 352.90, 0.002
AssertEq "balanco -/ENG: N2 forma L", VigPos(j + 1).forma, "L"
' desenho sem .EDX: o negativo do balanco termina na ponta livre (300 cm) e
' entra lb = 52,90 no engaste: xi = 300 - 352,90 = -52,90 (ENG/-); no espelho
' comeca na ponta livre, xi = 0, e termina em 352,90 (lb dentro do engaste).
DIM gT(1 TO DAD_MAXPOS) AS STRING, gX(1 TO DAD_MAXPOS) AS DOUBLE, tipo AS STRING, xi AS DOUBLE
DcGeoBarra v, 1, 1, gT(), gX(), tipo, xi
AssertNear "balanco -/ENG: negativo comeca na ponta livre", xi, 0, 0.000001
VigLimpa
v = VigAdiciona%("VB", 1, 15, 25)
VigApo(VigApoio%(v, 1)).nome = "ENG": VigApo(VigApoio%(v, 2)).nome = "-"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).phiPos = 10: VigTra(t).nPos = 2
VigTra(t).phiNegEsq = 10: VigTra(t).nNegEsq = 3: VigTra(t).phiEst = 5: VigTra(t).sEst = 15
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
DcGeoBarra v, 1, 0, gT(), gX(), tipo, xi
AssertEq "balanco ENG/-: N1 e negativo", tipo, "N"
AssertNear "balanco ENG/-: negativo termina na ponta livre (xi = -52,90)", xi, -52.90, 0.002

' Positivo separado no DESEDCAO: a U de 2 phi10 vira duas partes L (DecSepara%). O .EDX
' guarda tipo P e inicio de cada parte. Viga 15x40, L = 3 m, escala 1:50 (20 mm/m),
' hh = 0,40 x 20 = 8 mm. N1 = parte esquerda, 200 cm de -10 a 190 cm -> linha embaixo
' (y = 3) de -2 a 38 mm; N4 = parte direita, 150 cm de 160 a 310 cm -> y = 3, de 32 a 62 mm.
' Sem o .EDX, L de phi10 > 6,3 e deduzido negativo e sai em cima (y = hh - 3 = 5).
VigLimpa
v = VigAdiciona%("VS", 1, 15, 40)
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).phiPos = 10: VigTra(t).nPos = 2: VigTra(t).phiEst = 5: VigTra(t).sEst = 20
ult = DcDetalha%(v, 1, 2.5, 0.15, 1.4, 5, 1.15)
j = VigTra(t).iPosFerro
VigPos(j).forma = "L": VigPos(j).compr = 200
VigAddPos t, 4, 10, 2, 150, "L"
DIM fe AS INTEGER
fe = DadAbreGravacao%(dir + "S.EDX", "EDX", "OBRA T")
WRITE #fe, 3
WRITE #fe, "VS", 1, 10, 2, 200, "P", -10
WRITE #fe, "VS", 4, 10, 2, 150, "P", 160
WRITE #fe, "VS", 2, 6.3, 2, 999, "PE", 0
WRITE #fe, 0
CLOSE #fe
AssertTrue "edx: 2 barras batem (N2 com comprimento diferente fica de fora)", DcLeEdx%(dir + "S.EDX", gT(), gX()) = 2
DcGeoBarra v, 1, 0, gT(), gX(), tipo, xi
AssertEq "edx: parte esquerda do positivo e P", tipo, "P"
DcDesenhaVigaGeo v, dir + "VS.VET", 50, "OBRA T", gT(), gX(), ""
AssertTrue "desenho com .EDX: N1 embaixo de -2 a 38 mm", VetTemLinha%(dir + "VS.VET", -2, 3, 38, 3)
AssertTrue "desenho com .EDX: N4 embaixo de 32 a 62 mm", VetTemLinha%(dir + "VS.VET", 32, 3, 62, 3)
DcDesenhaViga v, dir + "VS0.VET", 50, "OBRA T"
AssertTrue "desenho sem .EDX: N1 deduzido negativo, em cima de 40 a 80 mm", VetTemLinha%(dir + "VS0.VET", 40, 5, 80, 5)
AssertTrue "sem .EDX: DcLeEdx% devolve 0", DcLeEdx%(dir + "NAOHA.EDX", gT(), gX()) = 0

' Armadura dupla sem As' no .SEC: aviso. Viga 20x50, d = 46,5, C15 (fcd = 0,15/1,4 =
' 0,107143 tf/cm2), CA-50 classe A (fyd = 4,3478; eyd = 4,3478/2100 = 0,0020704).
' x_lim = 0,0035 / (0,0035 + 0,0020704) d = 0,62832 x 46,5 = 29,217 cm;
' Md_lim = 0,85 fcd b 0,8 x (d - 0,4 x) = 0,072857 x 20 x 29,217 x 34,813 = 1482,1 tf.cm
' -> Mk_lim = 14,821 / 1,4 = 10,59 tf.m. Mk+ = 10,7 pede As'; 10,5 e Mk- = -9 nao.
VigLimpa
v = VigAdiciona%("VD2", 1, 20, 50): Vig(v).d = 46.5
VigApo(VigApoio%(v, 1)).nome = "P1": VigApo(VigApoio%(v, 2)).nome = "P2"
t = VigTramo%(v, 1): VigTra(t).vao = 6: VigTra(t).mPos = 10.5: VigTra(t).mNegDir = -9
AssertEq "As': Mk = 10,5 < 10,59 sem aviso", DcAvisoAsLinha$(v, 0.15, 1.4, 5, 1.15), ""
VigTra(t).mPos = 10.7
AssertEq "As': Mk = 10,7 > 10,59 avisa so o M+", DcAvisoAsLinha$(v, 0.15, 1.4, 5, 1.15), "AVISO VD2: armadura dupla sem As' no .SEC, detalhar a mao: T1 M+"
VigTra(t).mNegDir = -11
AssertEq "As': M- de -11 tambem", DcAvisoAsLinha$(v, 0.15, 1.4, 5, 1.15), "AVISO VD2: armadura dupla sem As' no .SEC, detalhar a mao: T1 M+ T1 M- dir"

' Pino de dobramento CA-50: 5 phi (phi < 20), 8 phi (phi >= 20)
AssertNear "pino phi10 = 5 x 10 = 50 mm", DcDiamPino#(10), 50, 0
AssertNear "pino phi16 = 5 x 16 = 80 mm", DcDiamPino#(16), 80, 0
AssertNear "pino phi20 = 8 x 20 = 160 mm", DcDiamPino#(20), 160, 0
' materiais sem .DSP: padroes de DESINIT
DIM cb AS DOUBLE, fk AS DOUBLE, gcc AS DOUBLE, fy AS DOUBLE, gss AS DOUBLE
DcLeMateriais dir + "NAOHA.DSP", cb, fk, gcc, fy, gss
AssertTrue "materiais sem .DSP: 2,5 / 0,15 / 1,4 / 5 / 1,15", cb = 2.5 AND fk = 0.15# AND gcc = 1.4# AND fy = 5 AND gss = 1.15#
TestEnd

' Ha no .VET arq uma linha de (xa, ya) a (xb, yb) mm (tolerancia 0,01)?
FUNCTION VetTemLinha% (arq AS STRING, xa AS DOUBLE, ya AS DOUBLE, xb AS DOUBLE, yb AS DOUBLE)
    DIM f AS INTEGER, a AS STRING, b AS STRING, n AS INTEGER, tg AS STRING
    DIM x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, p AS INTEGER, al AS DOUBLE, an AS DOUBLE, tx AS STRING
    f = FREEFILE
    OPEN arq FOR INPUT AS #f
    INPUT #f, a, b, n, tx
    DO WHILE NOT EOF(f)
        INPUT #f, tg
        SELECT CASE tg
            CASE "L"
                INPUT #f, x1, y1, x2, y2, p
                IF ABS(x1 - xa) < 0.01 AND ABS(y1 - ya) < 0.01 AND ABS(x2 - xb) < 0.01 AND ABS(y2 - yb) < 0.01 THEN VetTemLinha% = -1
            CASE "T": INPUT #f, x1, y1, al, an, p, tx
            CASE "C": INPUT #f, x1, y1, al, p
        END SELECT
    LOOP
    CLOSE #f
END FUNCTION
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/common/SISPLOT.BM'
'$INCLUDE: '../src-reconstructed/desenho/DESCALC.BM'
'$INCLUDE: '../src-reconstructed/common/SISTELA.BM'
