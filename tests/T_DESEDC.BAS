' Teste das contas do editor de ferragem DESEDCAO (desenho/DESEDC.BM):
' juntar, separar, porta-estribo e corte. Valores esperados feitos a mao.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISTELA.BI'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM SHARED gT(1 TO DAD_MAXPOS) AS STRING, gX(1 TO DAD_MAXPOS) AS DOUBLE
DIM v AS INTEGER, j AS INTEGER, j1 AS INTEGER, j2 AS INTEGER, dir AS STRING, dsp AS STRING
DIM cA AS DOUBLE, cB AS DOUBLE, cobE AS DOUBLE, cobD AS DOUBLE, ini AS DOUBLE, fim AS DOUBLE
dir = COMMAND$: IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" THEN dir = dir + "/"

' --- tipo e inicio deduzidos (como DcDesenhaViga desenha)
AssertEq "U e positivo", DecInfereTipo$("U", 10), "P"
AssertEq "R 6.3 e porta-estribo", DecInfereTipo$("R", 6.3), "PE"
AssertEq "R 10 e negativo", DecInfereTipo$("R", 10), "N"
AssertEq "L 16 e negativo", DecInfereTipo$("L", 16), "N"
AssertEq "E e estribo", DecInfereTipo$("E", 5), "E"
' positivo de 520 cm num vao de 500: centrado, comeca em 250 - 260 = -10
AssertNear "positivo centrado no vao", DecInfereXi#("P", 0, 500, 520, 0, 0), -10, 0
' negativo de 305,8 no apoio direito do vao de 400: 400 - 152,9 = 247,1
AssertNear "negativo centrado no apoio direito", DecInfereXi#("N", 0, 400, 305.8, 0, 0), 247.1, 0.000001
AssertNear "negativo de extremidade esquerda comeca no apoio", DecInfereXi#("N", 0, 400, 200, -1, 0), 0, 0
' extremidade direita: tramo de 400 a 750, barra de 200 termina em 750 -> comeca em 550
AssertNear "negativo de extremidade direita termina no apoio", DecInfereXi#("N", 400, 350, 200, 0, -1), 550, 0

' --- emenda arredondada para cima
AssertNear "emenda 49,99 -> 50", DecEmenda#(49.99), 50, 0
AssertNear "emenda 50 -> 50", DecEmenda#(50), 50, 0
AssertNear "emenda 50,2 -> 51", DecEmenda#(50.2), 51, 0
' padrao da Separacao = 2 x lb, arredondado: 2 x 79,35 = 158,7 -> 159; 2 x 52,9 = 105,8 -> 106
AssertNear "separar: emenda padrao 2 x 79,35 -> 159", DecEmendaSepara#(79.35), 159, 0
AssertNear "separar: emenda padrao 2 x 52,9 -> 106", DecEmendaSepara#(52.9), 106, 0

' --- comprimento da juncao
' [0,300] + [300,500]: encostadas, sem traspasse -> uniao = 500
AssertNear "juntar encostadas: uniao 500", DecJuntaCompr#(0, 300, 300, 200, 50), 500, 0
' [0,300] + [250,500]: sobrepostas 50 -> uniao 500 + emenda 50 = 550
AssertNear "juntar com traspasse: 500 + 50 = 550", DecJuntaCompr#(0, 300, 250, 250, 50), 550, 0
' ordem invertida da o mesmo
AssertNear "juntar na ordem inversa: 550", DecJuntaCompr#(250, 250, 0, 300, 50), 550, 0
' [0,300] + [310,500]: folga de 10 -> nao junta
AssertNear "juntar com folga de 10 cm: recusa (-1)", DecJuntaCompr#(0, 300, 310, 190, 50), -1, 0
' folga de 0,5 cm cabe na tolerancia de 1 cm: uniao 0..500,5
AssertNear "folga de 0,5 cm: uniao 500,5", DecJuntaCompr#(0, 300, 300.5, 200, 50), 500.5, 0

' --- partes da separacao: barra de 500, emenda de 50 a 200 da ponta
' A = 200 + 50 = 250; B = 500 - 200 = 300; A + B = 550 = 500 + 50
AssertTrue "separar 500 em 200 com 50: valido", DecSeparaPartes%(500, 200, 50, cA, cB)
AssertNear "parte A = 250", cA, 250, 0
AssertNear "parte B = 300", cB, 300, 0
AssertNear "A + B = original + emenda = 550", cA + cB, 550, 0
AssertTrue "separar na ponta (d = 0): recusa", NOT DecSeparaPartes%(500, 0, 50, cA, cB)
AssertTrue "emenda passa da ponta (460 + 50 >= 500): recusa", NOT DecSeparaPartes%(500, 460, 50, cA, cB)

' --- cobertura dos negativos e trecho do porta-estribo
' tramo 1 (0..400) com negativo [247,1 ; 552,9]: cobre 152,9 pela direita
cobE = 0: cobD = 0
DecCobertura 0, 400, 247.1, 552.9, cobE, cobD
AssertNear "tramo 1: cobertura esquerda 0", cobE, 0, 0
AssertNear "tramo 1: cobertura direita 152,9", cobD, 152.9, 0.000001
' porta-estribo com traspasse 15: de 0 a 400 - 152,9 + 15 = 262,1
AssertTrue "tramo 1 tem porta-estribo", DecPortaTrecho%(400, cobE, cobD, 15, ini, fim)
AssertNear "porta-estribo tramo 1 comeca na face", ini, 0, 0
AssertNear "porta-estribo tramo 1 termina em 262,1", fim, 262.1, 0.000001
' tramo 2 (400..750) com o mesmo negativo: cobre 552,9 - 400 = 152,9 pela esquerda
cobE = 0: cobD = 0
DecCobertura 400, 350, 247.1, 552.9, cobE, cobD
AssertNear "tramo 2: cobertura esquerda 152,9", cobE, 152.9, 0.000001
AssertNear "tramo 2: cobertura direita 0", cobD, 0, 0
AssertTrue "tramo 2 tem porta-estribo", DecPortaTrecho%(350, cobE, cobD, 15, ini, fim)
AssertNear "porta-estribo tramo 2 de 137,9 a 350 (212,1 cm)", fim - ini, 212.1, 0.000001
AssertTrue "negativos 160 + 150 cobrem o vao de 300: sem porta-estribo", NOT DecPortaTrecho%(300, 160, 150, 15, ini, fim)

' --- parametros do .DSP: ordem 2 da tabela de bitolas = 6,3; traspasse 15 cm
dsp = dir + "SISTRUT.DSP"
AssertNear "bitola minima do porta-estribo (ordem 2) = 6,3", DecPortaPhi#(dsp), 6.3, 0.000001
AssertNear "traspasse do porta-estribo = 15 cm", DecPortaTraspasse#(dsp, 6.3), 15, 0
AssertNear "sem .DSP: bitola 6,3", DecPortaPhi#(dir + "NAOEXISTE.DSP"), 6.3, 0.000001
AssertEq "porta-estribo automatico (S)", DecDspTexto$(dsp, "COLOCACAO AUTOMATICA DE PORTA ESTRIBOS"), "S"

' --- viga de 2 tramos (4 m e 3,5 m), como a V2 da obra FLUXO
MontaViga v
AssertTrue "viga montada com 5 posicoes", DecQtdPos%(v) = 5
AssertNear "N1 (positivo do tramo 1) comeca em 200 - 210 = -10", gX(1), -10, 0
AssertNear "N4 (positivo do tramo 2) comeca em 400 + 175 - 185 = 390", gX(4), 390, 0

' juntar N1 [-10, 410] com N4 [390, 760]: sobrepostas 20 -> uniao 770 + emenda 53 = 823
AssertTrue "juntar positivo com negativo: codigo 1", DecJunta%(v, 1, 2, 53, gT(), gX()) = 1
AssertTrue "juntar estribos: codigo 2", DecJunta%(v, 3, 5, 53, gT(), gX()) = 2
AssertTrue "juntar N1 com N4: ok", DecJunta%(v, 1, 4, 53, gT(), gX()) = 0
AssertTrue "juntar: 5 posicoes viram 4", DecQtdPos%(v) = 4
j = AchaPos%(v, 1)
AssertNear "N1 juntada: 770 + 53 = 823", VigPos(j).compr, 823, 0.000001
AssertNear "N1 juntada comeca em -10", gX(j), -10, 0
AssertTrue "N1 juntada: 2 barras, forma U", VigPos(j).n = 2 AND VigPos(j).forma = "U"
AssertTrue "N4 saiu", AchaPos%(v, 4) = 0

' separar N2 (negativo, 305,8 cm em [247,1 ; 552,9]) com emenda 50 a 100 da ponta
' A = 100 + 50 = 150; B = 305,8 - 100 = 205,8; total 355,8 = 305,8 + 50
j = AchaPos%(v, 2)
AssertTrue "separar com emenda passando da ponta: recusa", NOT DecSepara%(v, j, 300, 50, gT(), gX())
AssertTrue "recusa nao muda a quantidade (4)", DecQtdPos%(v) = 4
AssertTrue "separar N2: ok", DecSepara%(v, j, 100, 50, gT(), gX())
AssertTrue "separar: 4 posicoes viram 5", DecQtdPos%(v) = 5
j1 = AchaPos%(v, 2): j2 = AchaPos%(v, 6)
AssertTrue "parte nova recebe o numero 6 (maior 5 + 1)", j2 > 0
AssertNear "N2 = parte A = 150", VigPos(j1).compr, 150, 0.000001
AssertNear "N6 = parte B = 205,8", VigPos(j2).compr, 205.8, 0.000001
AssertNear "A + B = 305,8 + 50", VigPos(j1).compr + VigPos(j2).compr, 355.8, 0.000001
AssertNear "N6 comeca em 247,1 + 100 = 347,1", gX(j2), 347.1, 0.000001
AssertTrue "N6 no mesmo tramo, negativo, 2 phi 10", DecTramoDaPos%(v, j2) = VigTramo%(v, 1) AND gT(j2) = "N" AND VigPos(j2).n = 2 AND VigPos(j2).phi = 10

' juntar de volta N2 [247,1 ; 397,1] e N6 [347,1 ; 552,9]: sobrepostas 50
' -> uniao 305,8 + emenda 50 = 355,8
AssertTrue "juntar N2 com N6: ok", DecJunta%(v, AchaPos%(v, 2), AchaPos%(v, 6), 50, gT(), gX()) = 0
AssertTrue "juntar de volta: 4 posicoes", DecQtdPos%(v) = 4
AssertNear "N2 de volta: 305,8 + 50 = 355,8", VigPos(AchaPos%(v, 2)).compr, 355.8, 0.000001

' --- porta-estribo na viga original: negativo [247,1 ; 552,9], traspasse 15
' tramo 1: 0..262,1 (262,1 cm); tramo 2: 400 + 137,9 .. 750 (212,1 cm)
MontaViga v
AssertTrue "porta-estribo: 2 posicoes criadas", DecPortaEstribo%(v, 6.3, 15, gT(), gX()) = 2
AssertTrue "porta-estribo: 5 + 2 = 7 posicoes", DecQtdPos%(v) = 7
j1 = AchaPos%(v, 6): j2 = AchaPos%(v, 7)
AssertNear "N6 porta-estribo do tramo 1 = 262,1", VigPos(j1).compr, 262.1, 0.000001
AssertNear "N7 porta-estribo do tramo 2 = 212,1", VigPos(j2).compr, 212.1, 0.000001
AssertNear "N7 comeca em 537,9", gX(j2), 537.9, 0.000001
AssertTrue "porta-estribo: 2 phi 6,3 forma R", VigPos(j1).n = 2 AND VigPos(j1).phi = 6.3 AND VigPos(j1).forma = "R" AND gT(j1) = "PE"
AssertTrue "gerar de novo troca os porta-estribos (continua 7)", DecPortaEstribo%(v, 6.3, 15, gT(), gX()) = 2 AND DecQtdPos%(v) = 7

' --- corte no meio do tramo 1 (x = 200): embaixo N1 (2 barras), em cima o
' porta-estribo [0 ; 262,1] (2 barras); o negativo [247,1 ; 552,9] nao passa em 200
AssertTrue "corte em x = 200: 4 barras", DecCorteVet%(v, 200, dir + "CORTE.VET", 2, "CORTE", gT(), gX()) = 4
' em x = 400 (apoio): N1 [-10,410], N4 [390,760] embaixo (4) e o negativo em cima (2)
AssertTrue "corte em x = 400: 6 barras", DecCorteVet%(v, 400, dir + "CORTE.VET", 2, "CORTE", gT(), gX()) = 6
AssertTrue "corte vira .VET valido", VetParaHpgl%(dir + "CORTE.VET", dir + "CORTE.PLT") > 5

' --- balanco de 1 tramo (ENG / -), L = 3 m: o negativo L + lb = 352,9 cm
' termina na ponta livre (x = 300) e entra lb = 52,9 no engaste: inicio = -52,9
VigLimpa
v = VigAdiciona%("VB", 1, 12, 25)
VigApo(VigApoio%(v, 1)).nome = "ENG": VigApo(VigApoio%(v, 2)).nome = "-"
t = VigTramo%(v, 1): VigTra(t).vao = 3: VigTra(t).nNegEsq = 2: VigTra(t).phiNegEsq = 10
VigAddPos t, 1, 10, 2, 352.9, "R"
DecGeoInfere v, gT(), gX()
AssertEq "balanco: o negativo e do tipo N", gT(AchaPos%(v, 1)), "N"
AssertNear "balanco: negativo termina na ponta livre (inicio = 300 - 352,9)", gX(AchaPos%(v, 1)), -52.9, 0.000001

TestEnd

' Monta a viga V2 (4 m e 3,5 m, 12 x 40) com as 5 posicoes da obra FLUXO e
' deduz tipo e inicio de cada uma.
SUB MontaViga (v AS INTEGER)
    DIM t AS INTEGER
    VigLimpa
    v = VigAdiciona%("V2", 2, 12, 40)
    VigApo(VigApoio%(v, 1)).nome = "P4": VigApo(VigApoio%(v, 2)).nome = "P5": VigApo(VigApoio%(v, 3)).nome = "P6"
    t = VigTramo%(v, 1): VigTra(t).vao = 4: VigTra(t).phiEst = 5: VigTra(t).sEst = 18
    VigAddPos t, 1, 10, 2, 420, "U"
    VigAddPos t, 2, 10, 2, 305.8, "R"
    VigAddPos t, 3, 5, 23, 94, "E"
    t = VigTramo%(v, 2): VigTra(t).vao = 3.5: VigTra(t).phiEst = 5: VigTra(t).sEst = 18
    VigAddPos t, 4, 10, 2, 370, "U"
    VigAddPos t, 5, 5, 20, 94, "E"
    DecGeoInfere v, gT(), gX()
END SUB

' Indice em VigPos da posicao num (n > 0) da viga v; 0 se nao ha.
FUNCTION AchaPos% (v AS INTEGER, num AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).numPos = num AND VigPos(j).n > 0 THEN AchaPos% = j: EXIT FUNCTION
        NEXT
    NEXT
END FUNCTION

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/common/SISPLOT.BM'
'$INCLUDE: '../src-reconstructed/desenho/DESCALC.BM'
'$INCLUDE: '../src-reconstructed/desenho/DESEDC.BM'
'$INCLUDE: '../src-reconstructed/common/SISTELA.BM'
