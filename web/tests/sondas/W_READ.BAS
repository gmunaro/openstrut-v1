' W_READ.BAS - sonda do build web: READ de DATA, VAL e conta em _FLOAT, gravados em W_READ.TXT
DIM a AS SINGLE, b AS SINGLE, c AS SINGLE, s AS STRING, x AS _FLOAT
OPEN "W_READ.TXT" FOR OUTPUT AS #1
READ a, b, c
PRINT #1, "READ"; a; b; c
READ s
PRINT #1, "READ$ "; s
PRINT #1, "VAL"; VAL("0.85"); VAL("12.5E2")
x = 1.1## * 3
PRINT #1, "FLOAT"; CSNG(x); CDBL(x)
a = 0.85: x = a * 3
PRINT #1, "MIX"; CSNG(x)
CLOSE #1
SYSTEM
DATA 3.2,4,12.5
DATA "texto"
