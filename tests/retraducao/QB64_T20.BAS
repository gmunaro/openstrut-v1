' QB64_T20 (v1-difs): o lado V1 da sonda QB45_T20.BAS, com o RT45 de src-original/comum.
' Recalcula as potencias e x - SQR(x ^ 2) dos 130 valores como o tradutor escreve (RT_POT##, RT_SQR##)
' e compara bit a bit com QB45_T20.saida.bin (oraculo, runs/retrad_t20-20261015-191529); depois os
' casos especiais do ^ (sondas T13/T17) e o PRINT USING de -0 (linhas U1 a U4 do QB45_T20.saida.txt).
' Compilar com tools/qbcompile.sh; o QB64 roda na pasta do EXE: copie QB45_T20.saida.bin para ela.
' Saida em QB64_T20.saida.txt (na pasta do EXE).
'$INCLUDE: '../../src-original/comum/RT45.BI'
'$INCLUDE: '../../src-original/comum/RT45GFX.BI'
ON ERROR GOTO trata
DIM x AS SINGLE, h AS DOUBLE, l AS DOUBLE, s AS SINGLE, h3 AS DOUBLE, l3 AS DOUBLE, hm AS DOUBLE, lm AS DOUBLE
DIM hn AS DOUBLE, ln AS DOUBLE, hd AS DOUBLE, ld AS DOUBLE, t AS INTEGER, o AS STRING, v AS STRING
DIM e AS INTEGER, xd AS DOUBLE, nd AS INTEGER, f AS STRING, k AS INTEGER, w AS INTEGER, ps AS INTEGER
OPEN "QB45_T20.saida.bin" FOR BINARY AS #2
o = SPACE$(LOF(2)): GET #2, 1, o: CLOSE #2
OPEN "QB64_T20.saida.txt" FOR OUTPUT AS #1
FOR t = 1 TO 130
    READ x
    h = RT_POT##(FX##(x), 2): l = RT_POT##(FX##(x), 2) - h: s = x - RT_SQR##(RT_POT##(FX##(x), 2) - 0)
    h3 = RT_POT##(FX##(x), 3): l3 = RT_POT##(FX##(x), 3) - h3: hm = RT_POT##(FX##(x), 1.5): lm = RT_POT##(FX##(x), 1.5) - hm
    hn = RT_POT##(FX##(x), -2): ln = RT_POT##(FX##(x), -2) - hn: hd = RT_POT##(FX##(CDBL(x)), .37#): ld = RT_POT##(FX##(CDBL(x)), .37#) - hd
    v = MKS$(x) + MKD$(h) + MKD$(l) + MKS$(s) + MKD$(h3) + MKD$(l3) + MKD$(hm) + MKD$(lm) + MKD$(hn) + MKD$(ln) + MKD$(hd) + MKD$(ld)
    ps = 1
    FOR k = 1 TO 12
        w = 8: IF k = 1 OR k = 4 THEN w = 4
        IF MID$(v, ps, w) <> MID$(o, 61 + (t - 1) * 88 + ps - 1, w) THEN nd = nd + 1: PRINT #1, "DIFERE"; t; MID$("x  h  l  s  h3 l3 hm lm hn ln hd ld ", 3 * k - 2, 2)
        ps = ps + w
    NEXT
NEXT
PRINT #1, "potencias: 130 valores x 12 campos,"; nd; "diferentes"
e = 0: xd = 12345: xd = RT_POT##(-2, 2): PRINT #1, "(-2)^2 e="; e; " x#="; RT_STR8$(xd)
e = 0: xd = 12345: xd = RT_POT##(-2, 3): PRINT #1, "(-2)^3 e="; e; " x#="; RT_STR8$(xd)
e = 0: xd = 12345: xd = RT_POT##(0, -1): PRINT #1, "0^-1 e="; e
e = 0: xd = 12345: xd = RT_POT##(0, 0): PRINT #1, "0^0 e="; e; " x#="; RT_STR8$(xd)
e = 0: xd = 12345: xd = RT_POT##(-8, 1## / 3##): PRINT #1, "(-8)^(1/3) e="; e
e = 0: xd = 12345: xd = RT_POT##(-2, .5): PRINT #1, "(-2)^.5 e="; e
e = 0: xd = 12345: xd = RT_POT##(10, 400): PRINT #1, "10^400 e="; e; " x#="; RT_STR8$(xd)
z! = 0: m! = -z!: zd# = 0: md# = -zd#
f = "U1 ##.## ##.## #####.## ##.## ##.##"
PRINT #1, USING f; RT_PU#(m!, f, 1); RT_PU#(md#, f, 2); RT_PU#(m!, f, 3); RT_PU#(z!, f, 4); RT_PU#(zd#, f, 5)
a! = -.001: b! = -.004: c! = -.0049: d! = -.005: e2! = -.0000001: f! = -1E-20
f = "U2 ##.## ##.## ##.## ##.## ##.## ##.##"
PRINT #1, USING f; RT_PU#(a!, f, 1); RT_PU#(b!, f, 2); RT_PU#(c!, f, 3); RT_PU#(d!, f, 4); RT_PU#(e2!, f, 5); RT_PU#(f!, f, 6)
g! = m! * 5.5: h! = m! * 5.5 * 3.25
f = "U4 ######.## #####.##"
PRINT #1, USING f; RT_PU#(g!, f, 1); RT_PU#(h!, f, 2)
CLOSE
SYSTEM
trata:
e = ERR: RESUME NEXT
DATA 4.7137, 8.4548, 12.2233, 16.0192, 19.8425, 23.6932, 27.5713, 31.4768, 35.4097, 39.37
DATA 43.3577, 47.3728, 51.4153, 55.4852, 59.5825, 63.7072, 67.8593, 72.0388, 76.2457, 80.48
DATA 84.7417, 89.0308, 93.3473, 97.6912, 102.062, 106.461, 110.887, 115.341, 119.822, 124.33
DATA 128.866, 133.429, 138.019, 142.637, 147.282, 151.955, 156.655, 161.383, 166.138, 170.92
DATA 175.73, 180.567, 185.431, 190.323, 195.243, 200.189, 205.163, 210.165, 215.194, 220.25
DATA 225.334, 230.445, 235.583, 240.749, 245.942, 251.163, 256.411, 261.687, 266.99, 272.32
DATA 277.678, 283.063, 288.475, 293.915, 299.382, 304.877, 310.399, 315.949, 321.526, 327.13
DATA 332.762, 338.421, 344.107, 349.821, 355.562, 361.331, 367.127, 372.951, 378.802, 384.68
DATA 390.586, 396.519, 402.479, 408.467, 414.483, 420.525, 426.595, 432.693, 438.818, 444.97
DATA 451.15, 457.357, 463.591, 469.853, 476.142, 482.459, 488.803, 495.175, 501.574, 508
DATA 514.454, 520.935, 527.443, 533.979, 540.543, 547.133, 553.751, 560.397, 567.07, 573.77
DATA 580.498, 587.253, 594.035, 600.845, 607.683, 614.547, 621.439, 628.359, 635.306, 642.28
DATA 0.3, 0.7, 1.1, 2.5, 10, 100, 123.456, 0.001, 1E+10, 7.77E-05
SUB RT_COMMON_LE (f AS INTEGER)
END SUB
SUB RT_COMMON_GRAVA (f AS INTEGER)
END SUB
SUB RT_COMMON_LIMPA
END SUB
SUB RT_PROG_LIMPA
END SUB
SUB RT_REARMA_ERRO
END SUB
'$INCLUDE: '../../src-original/comum/RT45.BM'
'$INCLUDE: '../../src-original/comum/RT45GFX.BM'
