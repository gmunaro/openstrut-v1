ON ERROR GOTO trata
OPEN "C:\OUT11.TXT" FOR OUTPUT AS #1
d# = 78062.4#: GOSUB pd
d# = 78062.39999999999#: GOSUB pd
d# = 77167.60000000001#: GOSUB pd
d# = .1#: GOSUB pd
d# = 1# / 3#: GOSUB pd
d# = 2# / 3#: GOSUB pd
d# = 100#: GOSUB pd
d# = 1D+16: GOSUB pd
d# = 1D+15: GOSUB pd
d# = 1.5D+17: GOSUB pd
d# = 1D-05: GOSUB pd
d# = .001#: GOSUB pd
d# = -2.5#: GOSUB pd
d# = 123456789.123#: GOSUB pd
d# = 0#: GOSUB pd
d# = .15#: GOSUB pd
d# = 1.1# * 1.1#: GOSUB pd
d# = 4937.4#: GOSUB pd
d# = 1234567890123456#: GOSUB pd
d# = 12345678901234567#: GOSUB pd
s! = .1: GOSUB ps
s! = 1 / 3: GOSUB ps
s! = 78062.4: GOSUB ps
s! = 1E+07: GOSUB ps
s! = 1E+06: GOSUB ps
s! = 123456.7: GOSUB ps
s! = 1234567: GOSUB ps
s! = 12345678: GOSUB ps
s! = .0001: GOSUB ps
s! = -.15: GOSUB ps
a$ = "ABCDEF"
e = 0: x$ = MID$(a$, 1, -1): PRINT #1, "mid -1:"; e; "["; x$; "]"
e = 0: x$ = MID$(a$, 0, 2): PRINT #1, "mid p0:"; e; "["; x$; "]"
e = 0: x$ = MID$(a$, 8, 2): PRINT #1, "mid p8:"; e; "["; x$; "]"
e = 0: x$ = MID$(a$, 2, 0): PRINT #1, "mid n0:"; e; "["; x$; "]"
e = 0: x$ = LEFT$(a$, -1): PRINT #1, "left -1:"; e; "["; x$; "]"
e = 0: x$ = RIGHT$(a$, -1): PRINT #1, "right -1:"; e; "["; x$; "]"
e = 0: x$ = LEFT$(a$, 10): PRINT #1, "left 10:"; e; "["; x$; "]"
e = 0: x$ = STRING$(-1, 65): PRINT #1, "string -1:"; e; "["; x$; "]"
e = 0: x$ = STRING$(3, 300): PRINT #1, "string 300:"; e; "["; x$; "]"
e = 0: x$ = SPACE$(-1): PRINT #1, "space -1:"; e; "["; x$; "]"
e = 0: b$ = "ABCDEF": MID$(b$, 2, -1) = "XY": PRINT #1, "midst -1:"; e; "["; b$; "]"
e = 0: b$ = "ABCDEF": MID$(b$, 0) = "XY": PRINT #1, "midst p0:"; e; "["; b$; "]"
e = 0: x$ = CHR$(256): PRINT #1, "chr 256:"; e
e = 0: i% = ASC(""): PRINT #1, "asc vazio:"; e
e = 0: i% = INSTR(0, a$, "B"): PRINT #1, "instr 0:"; e; i%
CLOSE
END
pd:
PRINT #1, "D"; STR$(d#); "|"; d#; "|"
RETURN
ps:
PRINT #1, "S"; STR$(s!); "|"; s!; "|"
RETURN
trata:
e = ERR
RESUME NEXT
