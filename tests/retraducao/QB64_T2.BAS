$CONSOLE:ONLY
DIM fck AS SINGLE, gc AS SINGLE, M AS SINGLE, gf AS SINGLE, dd AS SINGLE
fck = 150: gc = 1.4: gf = 1.4: M = 1.234: dd = 8.5
t# = FX##(80) * dd * .85! * 1 * fck / gc
PRINT "t#="; HX$(t#)
u# = (FX##(80) * dd * .85! * 1 * fck / gc) ^ 2
PRINT "u#="; HX$(u#)
v# = (FX##(80) * dd * .85! * 1 * fck / gc) * (FX##(80) * dd * .85! * 1 * fck / gc)
PRINT "v#="; HX$(v#)
w# = FX##(108.8!) * 1 * fck * M * 100000 * gf / gc
PRINT "w#="; HX$(w#)
s# = SQR((FX##(80) * dd * .85! * 1 * fck / gc) ^ 2 - FX##(108.8!) * 1 * fck * M * 100000 * gf / gc)
PRINT "s#="; HX$(s#)
x1! = (FX##(80) * dd * .85! * 1 * fck / gc - SQR((FX##(80) * dd * .85! * 1 * fck / gc) ^ 2 - FX##(108.8!) * 1 * fck * M * 100000 * gf / gc)) / (FX##(fck) * 1 * 54.4!) * gc
PRINT "x1!="; HEX$(CVL(MKS$(x1!)))
x2# = (FX##(80) * dd * .85! * 1 * fck / gc - SQR((FX##(80) * dd * .85! * 1 * fck / gc) ^ 2 - FX##(108.8!) * 1 * fck * M * 100000 * gf / gc)) / (FX##(fck) * 1 * 54.4!) * gc
PRINT "x2#="; HX$(x2#)
a! = 1.1: b# = FX##(a!) ^ 3: c# = FX##(a!) ^ 2.5: d# = FX##(a!) ^ 7: e# = FX##(a!) ^ -2: f# = FX##(1.1#) ^ 10
PRINT "pow:"; HX$(b#); " "; HX$(c#); " "; HX$(d#); " "; HX$(e#); " "; HX$(f#)
g# = EXP(FX##(1.3#)): h# = LOG(FX##(7.7#)): k# = SQR(FX##(2#)): l# = SIN(FX##(100#)): m2# = COS(FX##(1D+10))
PRINT "fn:"; HX$(g#); " "; HX$(h#); " "; HX$(k#); " "; HX$(l#); " "; HX$(m2#)
' sem promocao
x1! = (80 * dd * .85! * 1 * fck / gc - SQR((80 * dd * .85! * 1 * fck / gc) ^ 2 - 108.8! * 1 * fck * M * 100000 * gf / gc)) / (fck * 1 * 54.4!) * gc
PRINT "x1! sem promocao="; HEX$(CVL(MKS$(x1!)))
b# = a! ^ 3: c# = a! ^ 2.5: d# = a! ^ 7: e# = a! ^ -2: f# = 1.1# ^ 10
PRINT "pow sem:"; HX$(b#); " "; HX$(c#); " "; HX$(d#); " "; HX$(e#); " "; HX$(f#)
SYSTEM
FUNCTION FX## (x AS _FLOAT)
    FX## = x
END FUNCTION
FUNCTION HX$ (z#)
    HX$ = HEX$(CVL(MID$(MKD$(z#), 5, 4))) + ":" + HEX$(CVL(LEFT$(MKD$(z#), 4)))
END FUNCTION
