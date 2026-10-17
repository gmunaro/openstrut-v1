DIM fck AS SINGLE, gc AS SINGLE, M AS SINGLE, gf AS SINGLE, dd AS SINGLE
OPEN "C:\OUT2.TXT" FOR OUTPUT AS #1
fck = 150: gc = 1.4: gf = 1.4: M = 1.234: dd = 8.5
t# = 80 * dd * .85 * 1 * fck / gc
zz# = t#: GOSUB hx: h0$ = hx$
PRINT #1, "t#="; h0$
u# = (80 * dd * .85 * 1 * fck / gc) ^ 2
zz# = u#: GOSUB hx: h0$ = hx$
PRINT #1, "u#="; h0$
v# = (80 * dd * .85 * 1 * fck / gc) * (80 * dd * .85 * 1 * fck / gc)
zz# = v#: GOSUB hx: h0$ = hx$
PRINT #1, "v#="; h0$
w# = 108.8 * 1 * fck * M * 100000 * gf / gc
zz# = w#: GOSUB hx: h0$ = hx$
PRINT #1, "w#="; h0$
s# = SQR((80 * dd * .85 * 1 * fck / gc) ^ 2 - 108.8 * 1 * fck * M * 100000 * gf / gc)
zz# = s#: GOSUB hx: h0$ = hx$
PRINT #1, "s#="; h0$
x1! = (80 * dd * .85 * 1 * fck / gc - SQR((80 * dd * .85 * 1 * fck / gc) ^ 2 - 108.8 * 1 * fck * M * 100000 * gf / gc)) / (fck * 1 * 54.4) * gc
PRINT #1, "x1!="; HEX$(CVL(MKS$(x1!)))
x2# = (80 * dd * .85 * 1 * fck / gc - SQR((80 * dd * .85 * 1 * fck / gc) ^ 2 - 108.8 * 1 * fck * M * 100000 * gf / gc)) / (fck * 1 * 54.4) * gc
zz# = x2#: GOSUB hx: h0$ = hx$
PRINT #1, "x2#="; h0$
a! = 1.1: b# = a! ^ 3: c# = a! ^ 2.5: d# = a! ^ 7: e# = a! ^ -2: f# = 1.1# ^ 10
zz# = b#: GOSUB hx: h0$ = hx$
zz# = c#: GOSUB hx: h1$ = hx$
zz# = d#: GOSUB hx: h2$ = hx$
zz# = e#: GOSUB hx: h3$ = hx$
zz# = f#: GOSUB hx: h4$ = hx$
PRINT #1, "pow:"; h0$; " "; h1$; " "; h2$; " "; h3$; " "; h4$
g# = EXP(1.3#): h# = LOG(7.7#): k# = SQR(2#): l# = SIN(100#): m2# = COS(1E+10#)
zz# = g#: GOSUB hx: h0$ = hx$
zz# = h#: GOSUB hx: h1$ = hx$
zz# = k#: GOSUB hx: h2$ = hx$
zz# = l#: GOSUB hx: h3$ = hx$
zz# = m2#: GOSUB hx: h4$ = hx$
PRINT #1, "fn:"; h0$; " "; h1$; " "; h2$; " "; h3$; " "; h4$
CLOSE
END
hx:
hx$ = HEX$(CVL(MID$(MKD$(zz#), 5, 4))) + ":" + HEX$(CVL(LEFT$(MKD$(zz#), 4)))
RETURN
