ON ERROR GOTO trata
OPEN "C:\OUT14.TXT" FOR OUTPUT AS #1
CLOSE #1
n$ = "0"
e = 0: OPEN "C:\.FRM" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "1"
e = 0: OPEN "C:\ABCDEFGHIJ.FRM" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "2"
e = 0: OPEN "C:\LONGO.ABCDE" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "3"
e = 0: OPEN "C:\A+B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "4"
e = 0: OPEN "C:\A B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "5"
e = 0: OPEN "C:\A*.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "6"
e = 0: OPEN "C:\A?.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "7"
e = 0: OPEN "C:\A,B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "8"
e = 0: OPEN "C:\A;B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "9"
e = 0: OPEN "C:\A=B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "10"
e = 0: OPEN "C:\A[B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "11"
e = 0: OPEN "C:\A|B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "12"
e = 0: OPEN "C:\A<B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "13"
e = 0: OPEN "C:\A" + CHR$(34) + "B.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "14"
e = 0: OPEN "C:\NAOEXIS\X.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "15"
e = 0: OPEN "C:\X..TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "16"
e = 0: OPEN "C:\CON" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "17"
e = 0: OPEN "C:\NUL.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "18"
e = 0: OPEN "" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "19"
e = 0: OPEN "C:\" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "20"
e = 0: OPEN "C:\SEMEXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "21"
e = 0: OPEN "Z:\X.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "22"
e = 0: OPEN "C:\ÇÃO.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "23"
e = 0: OPEN "C:\A.B.C" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "24"
e = 0: OPEN "C:\ABC." FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "25"
e = 0: OPEN "C:\." FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "26"
e = 0: OPEN "C:\..\X.TXT" FOR OUTPUT AS #2: PRINT #2, "x": CLOSE #2: GOSUB anota
n$ = "I0": e = 0: OPEN "C:\NAOHA.TXT" FOR INPUT AS #2: CLOSE #2: GOSUB anota
n$ = "I1": e = 0: OPEN "C:\.FRM" FOR INPUT AS #2: CLOSE #2: GOSUB anota
n$ = "I2": e = 0: OPEN "C:\NAOEXIS\X.TXT" FOR INPUT AS #2: CLOSE #2: GOSUB anota
n$ = "kill": e = 0: KILL "C:\NAOHA.TXT": GOSUB anota
n$ = "name": e = 0: NAME "C:\NAOHA.TXT" AS "C:\OUTRO.TXT": GOSUB anota
n$ = "mkdir": e = 0: MKDIR "C:\.DIR": GOSUB anota
n$ = "chdir": e = 0: CHDIR "C:\NAOEXIS": GOSUB anota
END
anota:
OPEN "C:\OUT14.TXT" FOR APPEND AS #1
PRINT #1, n$; " e="; e
CLOSE #1
RETURN
trata:
IF e = 0 THEN e = ERR
RESUME NEXT
