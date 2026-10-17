$CONSOLE:ONLY
DIM fck AS SINGLE, gc AS SINGLE, dd AS SINGLE, M AS SINGLE, gf AS SINGLE
CONST K85! = .85
fck = 150: gc = 1.4: dd = 8.5: M = 1.234: gf = 1.4
t# = FX##(80) * dd * CSNG(.85) * 1 * fck / gc
PRINT "CSNG  t#="; HX$(t#)
t# = FX##(80) * dd * K85! * 1 * fck / gc
PRINT "CONST t#="; HX$(t#)
t# = FX##(80) * dd * 0.85000002384185791015625## * 1 * fck / gc
PRINT "lit## t#="; HX$(t#)
t# = FX##(80) * dd * .85! * 1 * fck / gc
PRINT ".85!  t#="; HX$(t#)
x1! = (FX##(80) * dd * CSNG(.85) * 1 * fck / gc - SQR((FX##(80) * dd * CSNG(.85) * 1 * fck / gc) ^ 2 - FX##(CSNG(108.8)) * 1 * fck * M * 100000 * gf / gc)) / (FX##(fck) * 1 * CSNG(54.4)) * gc
PRINT "x1!="; HEX$(CVL(MKS$(x1!)))
SYSTEM
FUNCTION FX## (x AS _FLOAT)
    FX## = x
END FUNCTION
FUNCTION HX$ (z#)
    HX$ = HEX$(CVL(MID$(MKD$(z#), 5, 4))) + ":" + HEX$(CVL(LEFT$(MKD$(z#), 4)))
END FUNCTION
