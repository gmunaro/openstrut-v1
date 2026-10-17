OPEN "QB64_T6.TXT" FOR OUTPUT AS #1
x! = 2.5: i% = 2: l& = 16777217: f## = 2.5##: d# = 2.5#
PRINT #1, "x>i"; (x! > i%); " FX(x)>i"; (FX##(x!) > i%); " f>i"; (f## > i%); " d>i"; (d# > i%)
y! = 16777216
PRINT #1, "l>y"; (l& > y!); " l>FX(y)"; (l& > FX##(y!)); " l>d"; (l& > CDBL(y!))
z# = 0.15#: s! = 0.15
PRINT #1, "sng(d)"; RT_SNG!((z#)) = s!; " pu"; RT_PU#(RT_SNG!(FX##(z#) * 1.0), 1)
CLOSE
SYSTEM
FUNCTION FX## (x AS _FLOAT)
    FX## = x
END FUNCTION
FUNCTION RT_SNG! (x AS _FLOAT)
    RT_SNG! = x
END FUNCTION
FUNCTION RT_PU# (v AS DOUBLE, k AS INTEGER)
    RT_PU# = v
END FUNCTION
