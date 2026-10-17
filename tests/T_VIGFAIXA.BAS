' Teste da selecao de vigas por faixa (viga/VIGFAIXA.BM).
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM nomes(1 TO 8) AS STRING, marc(1 TO 8) AS INTEGER, vaz AS STRING, q AS INTEGER

' ordem do arquivo da obra E2E: V1 e a ultima
nomes(1) = "V4": nomes(2) = "V5": nomes(3) = "V2": nomes(4) = "V3"
nomes(5) = "V6": nomes(6) = "V1"

ERASE marc: q = FaixaMarca%("V1 A V6", nomes(), 6, marc(), vaz)
AssertEq "V1 A V6 marca as 6", Marcas$(marc(), 6), "111111"
AssertTrue "V1 A V6 conta 6", q = 6
AssertEq "V1 A V6 sem vazias", vaz, ""

ERASE marc: q = FaixaMarca%("V6 A V1", nomes(), 6, marc(), vaz)
AssertEq "V6 A V1 marca as 6", Marcas$(marc(), 6), "111111"

ERASE marc: q = FaixaMarca%("v4 a v1", nomes(), 6, marc(), vaz)
AssertEq "v4 a v1 (minusculas) marca V1..V4", Marcas$(marc(), 6), "101101"

' V10 depois de V9: por string, "V10" < "V2"
nomes(7) = "V10": nomes(8) = "V20"
ERASE marc: q = FaixaMarca%("V2 A V10", nomes(), 8, marc(), vaz)
AssertEq "V2 A V10 inclui V10, exclui V1 e V20", Marcas$(marc(), 8), "11111010"
AssertTrue "V2 A V10 conta 6", q = 6

ERASE marc: q = FaixaMarca%("V10/V3", nomes(), 8, marc(), vaz)
AssertEq "lista V10/V3", Marcas$(marc(), 8), "00010010"

' faixa vazia
ERASE marc: q = FaixaMarca%("V11 A V15", nomes(), 8, marc(), vaz)
AssertTrue "V11 A V15 nao marca nada", q = 0
AssertEq "V11 A V15 vai para vazias", vaz, "V11 A V15"

ERASE marc: q = FaixaMarca%("V1 A V2/V30/P1 A V3", nomes(), 8, marc(), vaz)
AssertEq "mista: so V1 e V2", Marcas$(marc(), 8), "00100100"
AssertEq "mista: vazias", vaz, "V30, P1 A V3"

TestEnd

' "1" para viga marcada, "0" para nao marcada, na ordem do arquivo.
FUNCTION Marcas$ (marc() AS INTEGER, n AS INTEGER)
    DIM i AS INTEGER, s AS STRING
    FOR i = 1 TO n
        IF marc(i) THEN s = s + "1" ELSE s = s + "0"
    NEXT
    Marcas$ = s
END FUNCTION

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/viga/VIGFAIXA.BM'
