' T5 no QB64: mesmas comparacoes do T5.BAS (QB4.5), sem e com promocao do lado menos preciso.
OPEN "QB64_T5.TXT" FOR OUTPUT AS #1
d# = 0.15#: x! = 0.15
PRINT #1, "d>=x"; (d# >= x!); " d=x"; (d# = x!); " d<x"; (d# < x!)
PRINT #1, "promovido: d>=x"; (d# >= FX##(x!)); " d=x"; (d# = FX##(x!)); " d<x"; (d# < FX##(x!))
k = 0: IF d# >= x! THEN k = 1
PRINT #1, "IF"; k
k = 0: IF d# >= FX##(x!) THEN k = 1
PRINT #1, "promovido: IF"; k
v = 0: IF VAL("0.15") >= x! THEN v = 1
PRINT #1, "VAL"; v
v = 0: IF VAL("0.15") >= FX##(x!) THEN v = 1
PRINT #1, "promovido: VAL"; v
e# = 1#: t# = 2# ^ -60
PRINT #1, "ext>e"; (FX##(e#) + t# > e#); " promovido:"; (FX##(e#) + t# > FX##(e#))
s = 0: SELECT CASE d#: CASE x!: s = 1: CASE ELSE: s = 2: END SELECT
PRINT #1, "SELECT d"; s
s = 0: SELECT CASE x!: CASE d#: s = 1: CASE ELSE: s = 2: END SELECT
PRINT #1, "SELECT x"; s
n = 0: FOR i# = x! TO d#: n = n + 1: NEXT
PRINT #1, "FOR#"; n
n = 0: FOR j! = 0 TO d# STEP x!: n = n + 1: NEXT
PRINT #1, "FOR!"; n
w = 0: WHILE d# = x! AND w < 3: w = w + 1: WEND
PRINT #1, "WHILE"; w
w = 0: WHILE d# = FX##(x!) AND w < 3: w = w + 1: WEND
PRINT #1, "promovido: WHILE"; w
w = 0: DO WHILE d# >= x! AND w < 3: w = w + 1: LOOP
PRINT #1, "DO"; w
w = 0: DO WHILE d# >= FX##(x!) AND w < 3: w = w + 1: LOOP
PRINT #1, "promovido: DO"; w
CLOSE
SYSTEM
FUNCTION FX## (x AS _FLOAT)
    FX## = x
END FUNCTION
