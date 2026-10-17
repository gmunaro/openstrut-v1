ON ERROR GOTO trata
OPEN "C:\OUT19.TXT" FOR OUTPUT AS #1
e = 0: x# = 12345: i% = 32767: i% = i% + 1: x# = i%: PRINT #1, "i%+1"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: l& = 100000: i% = l&: x# = i%: PRINT #1, "i%=l&"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: l& = 2147483647: l& = l& + 1: x# = l&: PRINT #1, "l&+1"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: i% = 300: i% = i% * i%: x# = i%: PRINT #1, "i%*i%"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 32767.6: i% = CINT(q#): x# = i%: PRINT #1, "CINT(32767.6)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 40000: i% = q#: x# = i%: PRINT #1, "i%=q#"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: i% = -32768: i% = -i%: x# = i%: PRINT #1, "-i%"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: i% = -32768: i% = ABS(i%): x# = i%: PRINT #1, "ABS(i%)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 1.5D+9: x# = SIN(q#): PRINT #1, "SIN(1.5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 1.5D+9: x# = COS(q#): PRINT #1, "COS(1.5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 1.5D+9: x# = TAN(q#): PRINT #1, "TAN(1.5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 1.5D+9: x# = ATN(q#): PRINT #1, "ATN(1.5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2D+9: x# = SIN(q#): PRINT #1, "SIN(2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2D+9: x# = COS(q#): PRINT #1, "COS(2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2D+9: x# = TAN(q#): PRINT #1, "TAN(2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2D+9: x# = ATN(q#): PRINT #1, "ATN(2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.147D+9: x# = SIN(q#): PRINT #1, "SIN(2.147D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.147D+9: x# = COS(q#): PRINT #1, "COS(2.147D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.147D+9: x# = TAN(q#): PRINT #1, "TAN(2.147D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.147D+9: x# = ATN(q#): PRINT #1, "ATN(2.147D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.2D+9: x# = SIN(q#): PRINT #1, "SIN(2.2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.2D+9: x# = COS(q#): PRINT #1, "COS(2.2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.2D+9: x# = TAN(q#): PRINT #1, "TAN(2.2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 2.2D+9: x# = ATN(q#): PRINT #1, "ATN(2.2D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 3D+9: x# = SIN(q#): PRINT #1, "SIN(3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 3D+9: x# = COS(q#): PRINT #1, "COS(3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 3D+9: x# = TAN(q#): PRINT #1, "TAN(3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 3D+9: x# = ATN(q#): PRINT #1, "ATN(3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.29D+9: x# = SIN(q#): PRINT #1, "SIN(4.29D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.29D+9: x# = COS(q#): PRINT #1, "COS(4.29D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.29D+9: x# = TAN(q#): PRINT #1, "TAN(4.29D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.29D+9: x# = ATN(q#): PRINT #1, "ATN(4.29D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.3D+9: x# = SIN(q#): PRINT #1, "SIN(4.3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.3D+9: x# = COS(q#): PRINT #1, "COS(4.3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.3D+9: x# = TAN(q#): PRINT #1, "TAN(4.3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 4.3D+9: x# = ATN(q#): PRINT #1, "ATN(4.3D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 5D+9: x# = SIN(q#): PRINT #1, "SIN(5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 5D+9: x# = COS(q#): PRINT #1, "COS(5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 5D+9: x# = TAN(q#): PRINT #1, "TAN(5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 5D+9: x# = ATN(q#): PRINT #1, "ATN(5D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 6.7D+9: x# = SIN(q#): PRINT #1, "SIN(6.7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 6.7D+9: x# = COS(q#): PRINT #1, "COS(6.7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 6.7D+9: x# = TAN(q#): PRINT #1, "TAN(6.7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 6.7D+9: x# = ATN(q#): PRINT #1, "ATN(6.7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 7D+9: x# = SIN(q#): PRINT #1, "SIN(7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 7D+9: x# = COS(q#): PRINT #1, "COS(7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 7D+9: x# = TAN(q#): PRINT #1, "TAN(7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 7D+9: x# = ATN(q#): PRINT #1, "ATN(7D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 8D+9: x# = SIN(q#): PRINT #1, "SIN(8D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 8D+9: x# = COS(q#): PRINT #1, "COS(8D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 8D+9: x# = TAN(q#): PRINT #1, "TAN(8D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 8D+9: x# = ATN(q#): PRINT #1, "ATN(8D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 9D+9: x# = SIN(q#): PRINT #1, "SIN(9D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 9D+9: x# = COS(q#): PRINT #1, "COS(9D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 9D+9: x# = TAN(q#): PRINT #1, "TAN(9D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: q# = 9D+9: x# = ATN(q#): PRINT #1, "ATN(9D+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: a! = 2E+9: x# = SIN(a!): PRINT #1, "SIN!(2E+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: a! = 4E+9: x# = SIN(a!): PRINT #1, "SIN!(4E+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: a! = 5E+9: x# = SIN(a!): PRINT #1, "SIN!(5E+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
e = 0: x# = 12345: a! = 8E+9: x# = SIN(a!): PRINT #1, "SIN!(8E+9)"; " e="; e; " x#="; x#
CLOSE #1: OPEN "C:\OUT19.TXT" FOR APPEND AS #1
CLOSE
END
trata:
IF e = 0 THEN e = ERR
RESUME NEXT
