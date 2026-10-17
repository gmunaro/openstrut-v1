$CONSOLE:ONLY
DEFINT I-N
DIM a AS SINGLE, b AS SINGLE, c AS SINGLE, d AS DOUBLE, e AS DOUBLE, f AS DOUBLE
DIM x AS SINGLE, y AS SINGLE
OPEN "QB64_T1.saida.txt" FOR OUTPUT AS #1
a = 16777216: b = 1
c = FX##(a) + b - a
PRINT #1, "T1 single (2^24+1)-2^24 ="; c
d = 9007199254740992#: e = 1
f = FX##(d) + e - d
PRINT #1, "T2 double (2^53+1)-2^53 ="; f
x = 3
y = FX##(1) / x * x
PRINT #1, "T3 1/3*3 single ="; y
PRINT #1, "CINT 2.5 3.5 -2.5 0.5 1.5:"; CINT(2.5); CINT(3.5); CINT(-2.5); CINT(.5); CINT(1.5)
DIM i AS INTEGER
x = 2.5: i = x: PRINT #1, "i=2.5! ->"; i
x = 3.5: i = x: PRINT #1, "i=3.5! ->"; i
PRINT #1, "CLNG 2.5:"; CLNG(2.5); " INT -2.5:"; INT(-2.5); " FIX -2.5:"; FIX(-2.5)
FOR k = 1 TO 24
  READ v#
  s! = v#
  PRINT #1, "S"; k; "["; STR$(s!); "]["; STR$(v#); "]";
  PRINT #1, s!; v#
NEXT
DATA 0,1,-1,.5,1.5,1234567,12345678,1E7,1.234567E-5,.1,100000,1E16,-.001,3.14159265358979
DATA .333333333333333,16777216,6.3,12.5,0.01,9999999,99999999,1E-7,123.456,-2.75
FOR k = 1 TO 12
  READ v#
  s! = v#
  PRINT #1, USING " M =######.##  As =####.## cm2|"; s!; v#
NEXT
DATA 2.675,0.125,-0.005,0.005,1.005,12345.6,999999.995,-123456.78,0.0049,1E10,2.5,-0.125
PRINT #1, USING "        \                    \|"; "#5.0 c/10"
DATA "1,5"," 12 3","1e3","&H10",".5.","1d2","-.5","+3","1E40","abc"
FOR k = 1 TO 10
 READ t$
 PRINT #1, "VAL("; t$; ")="; VAL(t$)
NEXT
PRINT #1, "INSTR(5,abc,/)="; INSTR(5, "abc", "/")
DIM h AS SINGLE, fck AS SINGLE, gc AS SINGLE, M AS SINGLE, gf AS SINGLE, dd AS SINGLE, fyk AS SINGLE, gs AS SINGLE
h = 10: fck = 150: gc = 1.4: gf = 1.4: M = 1.234: dd = 8.5: fyk = 5000: gs = 1.15
xx! = (FX##(80) * dd * .85 * 1 * fck / gc - SQR((FX##(80) * dd * .85 * 1 * fck / gc) ^ 2 - FX##(108.8!) * 1 * fck * M * 100000 * gf / gc)) / (FX##(fck) * 1 * 54.4!) * gc
PRINT #1, "xx="; xx!; " hex "; HEX$(CVL(MKS$(xx!)))
ass! = FX##(80) / (FX##(gc) * 1 * fyk) * xx! * .85! * 1 * fck * gs
PRINT #1, "As="; ass!; " hex "; HEX$(CVL(MKS$(ass!)))
z# = FX##(1#) / 3#
PRINT #1, "z#="; z#; " hex "; HEX$(CVL(MID$(MKD$(z#), 5, 4))); HEX$(CVL(LEFT$(MKD$(z#), 4)))
w# = SIN(FX##(.5#)) * COS(FX##(.25#)) + TAN(FX##(1.1#)) - ATN(FX##(.7#))
PRINT #1, "w#="; w#; " hex "; HEX$(CVL(MID$(MKD$(w#), 5, 4))); HEX$(CVL(LEFT$(MKD$(w#), 4)))
p# = FX##(1.1#) ^ 3#: q# = FX##(1.1#) ^ 2.5#: r! = FX##(1.7!) ^ 2!
PRINT #1, "p#="; p#; HEX$(CVL(MID$(MKD$(p#), 5, 4))); HEX$(CVL(LEFT$(MKD$(p#), 4))); " q#="; q#; HEX$(CVL(MID$(MKD$(q#), 5, 4))); HEX$(CVL(LEFT$(MKD$(q#), 4))); " r!="; r!; HEX$(CVL(MKS$(r!)))
ON ERROR GOTO trata
x = 0: y = 1 / x
PRINT #1, "1/0 sem erro: "; y
x = 1E+30: y = FX##(x) * x
PRINT #1, "overflow sem erro: "; y
x = 0: y = FX##(1) / x
PRINT #1, "1/0 FX sem erro: "; y
' sem promocao (comportamento padrao do QB64)
xx! = (80 * dd * .85 * 1 * fck / gc - SQR((80 * dd * .85 * 1 * fck / gc) ^ 2 - 108.8 * 1 * fck * M * 100000 * gf / gc)) / (fck * 1 * 54.4) * gc
PRINT #1, "xx sem promocao="; xx!; " hex "; HEX$(CVL(MKS$(xx!)))
w# = SIN(.5#) * COS(.25#) + TAN(1.1#) - ATN(.7#)
PRINT #1, "w# sem promocao="; w#; " hex "; HEX$(CVL(MID$(MKD$(w#), 5, 4))); HEX$(CVL(LEFT$(MKD$(w#), 4)))
PRINT #1, "VAL(0.1)=.1#?"; VAL("0.1") = .1#; " VAL(0.1)=.1!?"; VAL("0.1") = .1!
CLOSE
SYSTEM
trata:
PRINT #1, "ERRO"; ERR; "na linha seguinte"
RESUME NEXT
FUNCTION FX## (x AS _FLOAT)
    FX## = x
END FUNCTION
