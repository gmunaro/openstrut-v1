OPEN "QB64_T10.TXT" FOR OUTPUT AS #1
ON ERROR GOTO trata
DIM n AS _FLOAT, z AS _FLOAT
z = 0
n = z / z
PRINT #1, "nan"; n
PRINT #1, "cint"; CINT(n)
PRINT #1, "clng"; CLNG(n)
i% = n
PRINT #1, "atrib%"; i%
PRINT #1, "nan<0"; (n < 0); " nan>0"; (n > 0); " nan=nan"; (n = n)
x! = n
PRINT #1, "sng"; x!; " str "; STR$(x!)
PRINT #1, "sqr"; SQR(-4)
PRINT #1, "log"; LOG(-1)
CLOSE
SYSTEM
trata:
PRINT #1, "ERRO"; ERR
RESUME NEXT
