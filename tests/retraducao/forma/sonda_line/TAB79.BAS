SCREEN 2
VIEW PRINT 1 TO 25
CLS 0
LINE (0, 5)-(639, 5)
LOCATE 24, 1
PRINT " "; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " movimenta    <S>egue com a Plotagem    <A>bandona    <C>ancela    <P>asso"; TAB(79); ""; "";
r1 = CSRLIN: p1 = POS(0)
' saida: <V1_TRAB>\retrad_forma\t\tb.txt (pasta descartavel; sem V1_TRAB, %TEMP%\v1-retrad)
d$ = ENVIRON$("V1_TRAB"): IF d$ = "" THEN d$ = ENVIRON$("TEMP") + "\v1-retrad"
OPEN d$ + "\retrad_forma\t\tb.txt" FOR OUTPUT AS #1
FOR y = 0 TO 10
  IF POINT(100, y) THEN PRINT #1, "linha em y="; y
NEXT
PRINT #1, "csrlin"; r1; "pos"; p1
CLOSE #1
SYSTEM
