' W_BENCH.BAS - sonda de desempenho do build web: contas em _FLOAT como as do tradutor (FX##),
' SQR, ATN, strings e PRINT USING, em laco. Grava o tempo (TIMER) em W_BENCH.TXT.
DIM i AS LONG, a AS SINGLE, b AS SINGLE, s AS SINGLE, x AS _FLOAT, t0 AS DOUBLE, t$, n AS LONG
OPEN "W_BENCH.TXT" FOR OUTPUT AS #1
t0 = TIMER
a = 1.15: b = 0.85
FOR i = 1 TO 10000000
    s = (a * 0.85000002384185791015625## * b + i) / (1.39999997615814208984375## * a) - s * 0.5
    x = s: s = s + SQR(ABS(x)) * 0.001
NEXT
PRINT #1, "flutuante"; TIMER - t0; s
t0 = TIMER
FOR i = 1 TO 2000000
    s = ATN(i / 1000) + SIN(i / 1000)
NEXT
PRINT #1, "atn sin"; TIMER - t0; s
t0 = TIMER
FOR i = 1 TO 1000000
    t$ = LTRIM$(STR$(i)) + "," + MID$("abcdefgh", (i MOD 8) + 1, 2)
    n = n + LEN(t$) + VAL(t$)
NEXT
PRINT #1, "strings"; TIMER - t0; n
t0 = TIMER
OPEN "W_B2.TXT" FOR OUTPUT AS #2
FOR i = 1 TO 20000
    PRINT #2, USING "####.## ##.###"; i / 7; i / 13
NEXT
CLOSE #2
PRINT #1, "print using"; TIMER - t0
CLOSE #1
SYSTEM
