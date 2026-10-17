' Teste da geometria da amarracao (forma/FORMAMAR.BM). Contas a mao abaixo.
' Unidade unica (cm nos casos do brief). lado: -1 esquerda/inferior, 0 centro, +1 direita/superior.
'
' A) face com face: viga vertical de bw 12 com a face esquerda em x = 100.
'    eixo = 100 + 12/2 = 106; face direita = 106 + 6 = 112.
'    Pilar 20x40 amarrado pela face esquerda (vertice 1, lado -1 em X) a essa face:
'    vertice x = 112; centro = 112 + 20/2 = 122.
' B) por eixo: centro no eixo x = 250 -> centro 250 (lado 0, dist 0).
'    Vertice 3 (superior direito) em Y a 15 do eixo y = 300: alvo 315;
'    centro = 315 - 40/2 = 295.
' C) por coordenada: o valor digitado. Centro em 87.5 -> 87.5.
'    Vertice 2 (inferior direito) em X = 87.5 com bx 20: centro = 87.5 - 10 = 77.5.
' D) distancia com angulo: 100 + 50 * cos(60) = 100 + 25 = 125.
' E) so uma face da viga: centro 500, bw 12 -> faces 494 e 506. Face superior
'    vai a 510: a inferior fica em 494; centro = (510 + 494)/2 = 502; bw = 16.
' F) sentido da viga: (0,0)-(0,5) vertical -> X (1); (0,5)-(7,5) -> Y (2);
'    (0,0)-(3,4) inclinada -> 0.
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM eixoV AS DOUBLE, faceDir AS DOUBLE, vx AS DOUBLE, cx AS DOUBLE
DIM c AS DOUBLE, b AS DOUBLE

' A) face com face
eixoV = FaCentro#(100, 12, -1)
AssertNear "A: eixo da viga com face esquerda em 100", eixoV, 106, 0.000001
faceDir = FaFace#(eixoV, 12, 1)
AssertNear "A: face direita da viga", faceDir, 112, 0.000001
AssertTrue "A: vertice 1 e a face esquerda em X", FaLadoVertice%(1, 1) = -1
vx = FaAlvo#(faceDir, 0, 0)
cx = FaCentro#(vx, 20, FaLadoVertice%(1, 1))
AssertNear "A: face esquerda do pilar fica em x = 112", FaFace#(cx, 20, -1), 112, 0.000001
AssertNear "A: centro do pilar 20x40 em x = 122", cx, 122, 0.000001

' B) por eixo
AssertNear "B: centro coincide com o eixo x = 250", FaCentro#(FaAlvo#(250, 0, 0), 20, 0), 250, 0.000001
AssertTrue "B: vertice 3 e a face superior em Y", FaLadoVertice%(3, 2) = 1
AssertNear "B: vertice 3 a 15 do eixo y = 300, centro 295", FaCentro#(FaAlvo#(300, 15, 0), 40, FaLadoVertice%(3, 2)), 295, 0.000001

' C) por coordenada
AssertNear "C: centro no valor digitado 87.5", FaCentro#(FaAlvo#(87.5, 0, 0), 20, 0), 87.5, 0.000001
AssertNear "C: vertice 2 em x = 87.5, centro 77.5", FaCentro#(87.5, 20, FaLadoVertice%(2, 1)), 77.5, 0.000001
AssertTrue "C: centro (k = 0) tem lado 0", FaLadoVertice%(0, 1) = 0

' D) angulo
AssertNear "D: 100 + 50 cos 60 = 125", FaAlvo#(100, 50, 60), 125, 0.000001

' E) uma face so
c = 500: b = 12
FaMoveFace c, b, 1, 510
AssertNear "E: centro da viga apos mover a face superior", c, 502, 0.000001
AssertNear "E: nova largura", b, 16, 0.000001

' F) sentido da viga
AssertTrue "F: viga vertical amarra em X", FaSentidoViga%(0, 0, 0, 5) = 1
AssertTrue "F: viga horizontal amarra em Y", FaSentidoViga%(0, 5, 7, 5) = 2
AssertTrue "F: viga inclinada nao amarra", FaSentidoViga%(0, 0, 3, 4) = 0

TestEnd

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/forma/FORMAMAR.BM'
