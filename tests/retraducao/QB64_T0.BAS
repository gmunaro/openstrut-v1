$CONSOLE:ONLY
DIM a AS SINGLE, b AS SINGLE, c AS SINGLE, d AS DOUBLE, e AS DOUBLE, f AS DOUBLE
DIM x AS SINGLE, y AS SINGLE
a = 16777216: b = 1
c = a + b - a
PRINT "T1 single (2^24+1)-2^24 ="; c; "(x87 ext: 1, float: 0)"
d = 9007199254740992#: e = 1
f = d + e - d
PRINT "T2 double (2^53+1)-2^53 ="; f; "(x87 ext: 1, double: 0)"
x = 3
y = 1 / x * x
PRINT "T3 1/3*3 single ="; y
DIM fl AS _FLOAT
fl = 1
fl = fl + 2 ^ -60
fl = fl - 1
PRINT "T4 _FLOAT (1+2^-60)-1 ="; fl; "(64-bit mantissa: 8.67E-19; 53-bit: 0)"
PRINT "CINT 2.5 3.5 -2.5 0.5 1.5:"; CINT(2.5); CINT(3.5); CINT(-2.5); CINT(.5); CINT(1.5)
DIM i AS INTEGER
x = 2.5: i = x: PRINT "i=2.5! ->"; i
x = 3.5: i = x: PRINT "i=3.5! ->"; i
PRINT "CLNG 2.5:"; CLNG(2.5); " INT -2.5:"; INT(-2.5); " FIX -2.5:"; FIX(-2.5)
SYSTEM
