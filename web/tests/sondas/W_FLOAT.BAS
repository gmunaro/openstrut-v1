' W_FLOAT.BAS - sonda do build web: funcoes do BASIC aplicadas a _FLOAT (o long double do x87),
' gravadas em W_FLOAT.TXT com o valor em hexadecimal (MKD$ do resultado em DOUBLE e do estendido
' como SINGLE e DOUBLE). O nativo e a web tem de gravar o mesmo arquivo.
DIM SHARED x AS _FLOAT, i AS LONG, k AS INTEGER, v(30) AS _FLOAT, s AS STRING
OPEN "W_FLOAT.TXT" FOR OUTPUT AS #1
v(0) = 1.01##: v(1) = -1.01##: v(2) = 2.5##: v(3) = -2.5##: v(4) = 0.5##: v(5) = -0.5##
v(6) = 1234.5678##: v(7) = -0.0001##: v(8) = 1000000000000000##: v(9) = 3.14159265358979323846##
v(10) = 0.85000002384185791015625##: v(11) = 32767.5##: v(12) = -32768.5##: v(13) = 0.00000000015##
v(14) = 7##: v(15) = -7##: v(16) = 100.25##: v(17) = 0##
FOR i = 0 TO 17
    x = v(i)
    PRINT #1, "x"; i; H(x)
    PRINT #1, " FIX"; H(FIX(x)); " INT"; H(INT(x)); " ABS"; H(ABS(x)); " SGN"; SGN(x)
    IF ABS(x) < 30000000 THEN PRINT #1, " CINT"; CINT(x / 1000##); " CLNG"; CLNG(x / 1000##); " ROUND"; _ROUND(x / 1000##)
    PRINT #1, " SQR"; H(SQR(ABS(x))); " SIN"; H(SIN(x)); " COS"; H(COS(x)); " ATN"; H(ATN(x))
    IF ABS(x) < 700 THEN PRINT #1, " EXP"; H(EXP(x / 10##));
    IF x > 0 THEN PRINT #1, " LOG"; H(LOG(x));
    PRINT #1, " TAN"; H(TAN(x / 3##))
    PRINT #1, " STR"; STR$(CDBL(x)); STR$(CSNG(x)); " ";
    PRINT #1, USING "####.#### ##.##^^^^"; x; x
    IF ABS(x) < 1000000 THEN PRINT #1, " DIV"; CLNG(x) \ 3; " MOD"; CLNG(x) MOD 3;
    PRINT #1, " CMP"; (x > 1.01#); (x = CSNG(x)); (x < 2.5!)
NEXT
s = "12.5": x = VAL(s) * 3##: PRINT #1, "VAL"; H(x)
CLOSE #1
SYSTEM

' DOUBLE e SINGLE do valor, em hexadecimal (os bits, sem a formatacao do PRINT)
FUNCTION H$ (y AS _FLOAT)
    DIM d AS DOUBLE, f AS SINGLE, t AS STRING, j AS INTEGER, m AS STRING
    d = y: f = y
    m = MKD$(d) + MKS$(f)
    FOR j = LEN(m) TO 1 STEP -1
        t = t + RIGHT$("0" + HEX$(ASC(m, j)), 2)
    NEXT
    H$ = " " + t
END FUNCTION
