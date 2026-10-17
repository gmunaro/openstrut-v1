' Sonda T21 (v1-difs): em que forma o BC gera FIL2 + FMULP (e -0) para (i% > 0) * (i% < n! + 1) * b!
' (DESENHO 0x38ebb grava Bf = -0 no .SEC). Cada variante grava r! cru em C:\OUT21.BIN.
DECLARE SUB VAR1 (n!, b!)
DIM SHARED a!(5, 3)
OPEN "C:\OUT21.BIN" FOR BINARY AS #2
i% = 0: n! = 3: b! = 20
r! = (i% > 0) * (i% < n! + 1) * b!: PUT #2, , r!
a!(i%, 2) = (i% > 0) * (i% < n! + 1) * b!: r! = a!(i%, 2): PUT #2, , r!
r! = (i% > 0!) * (i% < n! + 1!) * b!: PUT #2, , r!
r! = ((i% > 0) * (i% < n! + 1)) * b!: PUT #2, , r!
r! = (i% > 0) * (i% < (n! + 1)) * b!: PUT #2, , r!
CALL VAR1(n!, b!)
CLOSE
END
SUB VAR1 (n!, b!)
DIM c!(5, 3)
FOR i% = 0 TO 1
r! = (i% > 0) * (i% < n! + 1) * b!: PUT #2, , r!
a!(i%, 2) = (i% > 0) * (i% < n! + 1) * b!: r! = a!(i%, 2): PUT #2, , r!
c!(i%, 2) = (i% > 0) * (i% < n! + 1) * b!: r! = c!(i%, 2): PUT #2, , r!
NEXT
END SUB
