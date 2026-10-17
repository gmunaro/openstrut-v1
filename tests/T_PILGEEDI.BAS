' ============================================================================
'  T_PILGEEDI.BAS - testes de soma por pavimento, acumulo e round-trip .COL.
'  Caso: 2 niveis (1 = topo, 2 = base), 2 pilares 20x20, pe 3 m (0,3 tf/lance).
'  P2 existe so no nivel de baixo.
' ============================================================================
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'

DIM msg AS STRING, ok AS INTEGER, rt AS STRING

' --- geometria -----------------------------------------------------------------
ColObra = "OBRA TESTE"
ColNivQtd = 2: ColQtd = 2
ColNiv(1).nome = "TOPO": ColNiv(1).cota = 6: ColNiv(1).peDireito = 3
ColNiv(2).nome = "BASE": ColNiv(2).cota = 3: ColNiv(2).peDireito = 3
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 20: Col(1).x = 0: Col(1).y = 0
Col(2).nome = "P2": Col(2).secao = "R": Col(2).bx = 20: Col(2).by = 20: Col(2).x = 5: Col(2).y = 0

' --- nivel 1 (topo): so P1 --------------------------------------------------
CPilQtd = 0: CPilNivel = 1
ok = CPilSoma%("P1", 0, 0, 10, 1, 0.5)
PgSomaPavimento 1, msg
AssertEq "topo: sem erro", msg, ""
AssertNear "topo: P1 N = 10 + peso proprio 0,3", ColEsf(ColIdx%(1, 1)).N, 10.3, 0.000001
AssertNear "topo: P1 Mx", ColEsf(ColIdx%(1, 1)).Mx, 1, 0.000001
AssertNear "topo: P1 My", ColEsf(ColIdx%(1, 1)).My, 0.5, 0.000001
AssertNear "topo: P2 sem lance no topo (N = 0)", ColEsf(ColIdx%(2, 1)).N, 0, 0.000001

' --- nivel 2 (base): P1 e P2 -------------------------------------------------
CPilQtd = 0: CPilNivel = 2
ok = CPilSoma%("P1", 0, 0, 20, 2, 1)
ok = CPilSoma%("P2", 5, 0, 5, 0, 0)
PgSomaPavimento 2, msg
AssertEq "base: sem erro", msg, ""
AssertNear "base: P1 N = 20 + peso proprio 0,3", ColEsf(ColIdx%(1, 2)).N, 20.3, 0.000001
AssertNear "base: P2 N = 5 + peso proprio 0,3", ColEsf(ColIdx%(2, 2)).N, 5.3, 0.000001
AssertNear "base: peso proprio por lance = 0,3 tf", ColEsf(ColIdx%(2, 2)).N - 5, 0.3, 0.000001

' --- acumulo descendente -------------------------------------------------------
PgAcumula
AssertNear "acumulo: P1 base N = 20,3 + 10,3", ColEsf(ColIdx%(1, 2)).N, 30.6, 0.000001
AssertNear "momento local: P1 base Mx = 2 (nao acumula)", ColEsf(ColIdx%(1, 2)).Mx, 2, 0.000001
AssertNear "momento local: P1 base My = 1 (nao acumula)", ColEsf(ColIdx%(1, 2)).My, 1, 0.000001
AssertNear "acumulo: P1 topo nao muda", ColEsf(ColIdx%(1, 1)).N, 10.3, 0.000001
AssertNear "acumulo: P2 base sem carga do topo", ColEsf(ColIdx%(2, 2)).N, 5.3, 0.000001

' --- round-trip .COL -------------------------------------------------------------
rt = "T_PILGEEDI_RT.COL"
ColGrava rt
ColNivQtd = 0: ColQtd = 0
ColEsf(ColIdx%(1, 2)).N = 0
ok = ColLe%(rt)
AssertTrue "round-trip: ColLe% retorna -1", ok = -1
AssertTrue "round-trip: niveis e colunas", ColNivQtd = 2 AND ColQtd = 2
AssertEq "round-trip: nome da coluna 2", RTRIM$(Col(2).nome), "P2"
AssertNear "round-trip: peDireito do nivel 2", ColNiv(2).peDireito, 3, 0.000001
AssertNear "round-trip: P1 base N", ColEsf(ColIdx%(1, 2)).N, 30.6, 0.000001
KILL rt

' --- erros -----------------------------------------------------------------------
CPilQtd = 0: CPilNivel = 2
ok = CPilSoma%("P9", 0, 0, 1, 0, 0)
PgSomaPavimento 2, msg
AssertTrue "erro: nome sem coluna gera mensagem", INSTR(msg, "NAO ENCONTRADO") > 0
PgSomaPavimento 1, msg
AssertTrue "nivel gravado no arquivo nao e conferido (usuario escolhe)", INSTR(msg, "outro nivel") = 0

' pilar circular D = 40, pe-direito 3: peso proprio = pi*0,4^2/4*3*2,5 = 0,9425 tf
ColNivQtd = 1: ColQtd = 1
ColNiv(1).nome = "T": ColNiv(1).peDireito = 3
Col(1).nome = "PC": Col(1).secao = "C": Col(1).bx = 40: Col(1).by = 0
CPilQtd = 1: CPilNivel = 1: CPil(1).nome = "PC": CPil(1).N = 10: CPil(1).Mx = 0: CPil(1).My = 0
PgSomaPavimento 1, msg
AssertNear "circular: N = carga + pi D2/4 x pe-direito x 2,5", ColEsf(ColIdx%(1, 1)).N, 10 + 3.14159265 * 0.16 / 4 * 3 * 2.5, 0.00001

' dois registros da mesma coluna no nivel (CPilLe le o arquivo sem juntar nomes):
' P1 20x20, pe 3 m, cargas 10 e 5 -> N = 15 + 0,2*0,2*3*2,5 = 15,3 (peso proprio uma vez;
' antes 15,6, com o lance contado duas vezes)
Col(1).nome = "P1": Col(1).secao = "R": Col(1).bx = 20: Col(1).by = 20
CPilQtd = 2: CPilNivel = 1
CPil(1).nome = "P1": CPil(1).N = 10: CPil(1).Mx = 1: CPil(1).My = 0
CPil(2).nome = "P1": CPil(2).N = 5: CPil(2).Mx = 0.5: CPil(2).My = 0
PgSomaPavimento 1, msg
AssertNear "dois registros: peso proprio uma vez por coluna e nivel", ColEsf(ColIdx%(1, 1)).N, 15.3, 0.000001
AssertNear "dois registros: momentos somados", ColEsf(ColIdx%(1, 1)).Mx, 1.5, 0.000001
TestEnd

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/pilar/PILGECAL.BM'
