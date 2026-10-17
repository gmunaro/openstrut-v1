ON ERROR GOTO trata
OPEN "C:\OUT5.TXT" FOR OUTPUT AS #1
d# = .15#: x! = .15
PRINT #1, "d>=x"; (d# >= x!); " d=x"; (d# = x!); " d<x"; (d# < x!)
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
k = 0: IF d# >= x! THEN k = 1
PRINT #1, "IF"; k
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
v = 0: IF VAL("0.15") >= x! THEN v = 1
PRINT #1, "VAL"; v
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
e# = 1#: t# = 2# ^ -60
PRINT #1, "ext>e"; (e# + t# > e#)
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
s = 0: SELECT CASE d#: CASE x!: s = 1: CASE ELSE: s = 2: END SELECT
PRINT #1, "SELECT d"; s
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
s = 0: SELECT CASE x!: CASE d#: s = 1: CASE ELSE: s = 2: END SELECT
PRINT #1, "SELECT x"; s
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
n = 0: FOR i# = x! TO d#: n = n + 1: NEXT
PRINT #1, "FOR#"; n
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
n = 0: FOR j! = 0 TO d# STEP x!: n = n + 1: NEXT
PRINT #1, "FOR!"; n
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
w = 0: WHILE d# = x! AND w < 3: w = w + 1: WEND
PRINT #1, "WHILE"; w
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
w = 0: DO WHILE d# >= x! AND w < 3: w = w + 1: LOOP
PRINT #1, "DO"; w
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
CLOSE
END
trata:
CLOSE #1: OPEN "C:\OUT5.TXT" FOR APPEND AS #1
PRINT #1, "ERRO"; ERR
RESUME NEXT
