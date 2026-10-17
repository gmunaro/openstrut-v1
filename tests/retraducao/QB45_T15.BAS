OPEN "C:\OUT15.TXT" FOR OUTPUT AS #1
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 24, 1: PRINT STRING$(80, "A");
l = CSRLIN: c = POS(0): PRINT #1, "== 80 na 24 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 24, 1: PRINT STRING$(80, "A")
l = CSRLIN: c = POS(0): PRINT #1, "== 80 na 24: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(80, "B");
l = CSRLIN: c = POS(0): PRINT #1, "== 80 na 25 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(80, "B")
l = CSRLIN: c = POS(0): PRINT #1, "== 80 na 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(79, "C");
l = CSRLIN: c = POS(0): PRINT #1, "== 79 na 25 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(79, "C"); "D"
l = CSRLIN: c = POS(0): PRINT #1, "== 79+1 na 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(79, "C"); "DE";
l = CSRLIN: c = POS(0): PRINT #1, "== 79+2 na 25 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 24, 75: PRINT "1234567890"
l = CSRLIN: c = POS(0): PRINT #1, "== 10 em 24,75: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 75: PRINT "1234567890";
l = CSRLIN: c = POS(0): PRINT #1, "== 10 em 25,75 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 80: PRINT "Z";
l = CSRLIN: c = POS(0): PRINT #1, "== Z em 25,80 com ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 80: PRINT "Z"
l = CSRLIN: c = POS(0): PRINT #1, "== Z em 25,80: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 24, 1: PRINT STRING$(79, "T"); TAB(79); "";
l = CSRLIN: c = POS(0): PRINT #1, "== TAB79 em 24: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(79, "T"); TAB(79); "X";
l = CSRLIN: c = POS(0): PRINT #1, "== TAB79 em 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(20, "T"); TAB(10); "X";
l = CSRLIN: c = POS(0): PRINT #1, "== TAB10 em 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 1: PRINT STRING$(20, "S"); SPC(90); "X";
l = CSRLIN: c = POS(0): PRINT #1, "== SPC90 em 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 60: PRINT "A", "B", "C";
l = CSRLIN: c = POS(0): PRINT #1, "== virgula em 25: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
VIEW PRINT 5 TO 10: LOCATE 10, 1: PRINT "V10": PRINT "V11";: VIEW PRINT
l = CSRLIN: c = POS(0): PRINT #1, "== VP 5-10 linha 10: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
VIEW PRINT 5 TO 10: LOCATE 10, 1: PRINT STRING$(80, "W");: VIEW PRINT
l = CSRLIN: c = POS(0): PRINT #1, "== VP 5-10 80 col: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
VIEW PRINT 5 TO 10: LOCATE 10, 1: PRINT STRING$(80, "W"): VIEW PRINT
l = CSRLIN: c = POS(0): PRINT #1, "== VP 5-10 80 col sem ;: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
VIEW PRINT 1 TO 24: LOCATE 24, 1: PRINT "L24": PRINT "L25";: VIEW PRINT
l = CSRLIN: c = POS(0): PRINT #1, "== VP 1-24 linha 24: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 78: PRINT 12345;
l = CSRLIN: c = POS(0): PRINT #1, "== numero na 25,78: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLS: FOR r = 1 TO 25: LOCATE r, 1: PRINT LEFT$(STR$(r) + "..", 3);: NEXT
LOCATE 25, 78: PRINT "ABCDE";
l = CSRLIN: c = POS(0): PRINT #1, "== string 5 na 25,78: cursor"; l; c
FOR r = 1 TO 25: t$ = "": FOR k = 1 TO 80: t$ = t$ + CHR$(SCREEN(r, k)): NEXT: PRINT #1, RTRIM$(t$): NEXT
CLOSE
CLS
END
