' ============================================================================
'  ARMADURA - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/ARMADURA/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 3ab1abcb40bafbeaaf1abdc0e217d2734600194d0ee41e0f3f8a73fc8f737fc1
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_ARMACAO.BI'

' ---- variaveis do ARMADURA fora do COMMON (DS do programa)
DIM SHARED V_0dc0!
DIM SHARED V_0dc4!
DIM SHARED V_0dc8!
DIM SHARED V_0dcc$
DIM SHARED V_0dd0$
DIM SHARED V_0dd4$
DIM SHARED V_0dd8!
DIM SHARED V_0ddc!
DIM SHARED V_0de0!
DIM SHARED V_0de4$
DIM SHARED V_0de8$
DIM SHARED V_0dec$
DIM SHARED V_0df0$
DIM SHARED V_0df4$
DIM SHARED V_0df8$
DIM SHARED V_0dfc$
DIM SHARED V_0e00$
DIM SHARED V_0e04$
DIM SHARED V_0e08$
DIM SHARED V_0e0c!
DIM SHARED V_0e10!
DIM SHARED V_0e14!
DIM SHARED V_0e18!
DIM SHARED V_0e1c!
DIM SHARED V_0e20!
DIM SHARED V_0e24!
DIM SHARED V_0e28!
DIM SHARED V_0e2c!
DIM SHARED V_0e30!
DIM SHARED V_0e34!
DIM SHARED V_0e38!
DIM SHARED V_0e3c!
DIM SHARED V_0e40!
DIM SHARED V_0e44!
DIM SHARED V_0e48!
DIM SHARED V_0e4c!
DIM SHARED V_0e50!
DIM SHARED V_0e54!
DIM SHARED V_0e58!
DIM SHARED V_0e5c!
DIM SHARED V_0e60!
DIM SHARED V_0e64!
DIM SHARED V_0e68!
DIM SHARED V_0e6c!
DIM SHARED V_0e70!
DIM SHARED V_0e74!
DIM SHARED V_0e78!
DIM SHARED V_0e7c!
DIM SHARED V_0e80$
DIM SHARED V_0e84!
DIM SHARED V_0e88!
DIM SHARED V_0e8c!
DIM SHARED V_0e90!
DIM SHARED V_0e94!
DIM SHARED V_0e98!
DIM SHARED V_0e9c!
DIM SHARED V_0ea0!
DIM SHARED V_0ea4!
DIM SHARED V_0ea8!
DIM SHARED V_0eac!
DIM SHARED V_0eb0!
DIM SHARED V_0eb4!
DIM SHARED V_0eb8!
DIM SHARED V_0ebc!
DIM SHARED V_0ec0!
DIM SHARED V_0ec4!
DIM SHARED V_1466!
DIM SHARED V_146a!
DIM SHARED V_147e$
DIM SHARED V_1482$
DIM SHARED V_1486$
DIM SHARED V_148a!
DIM SHARED V_148e!
DIM SHARED V_1492%
DIM SHARED V_1494!
DIM SHARED V_14a0$
DIM SHARED V_14a4$
DIM SHARED V_14a8!
DIM SHARED V_14ac!
DIM SHARED V_14b0$
DIM SHARED V_14b4!
DIM SHARED V_14b8$
DIM SHARED V_14bc$
DIM SHARED V_14c0$
DIM SHARED V_14c4!
DIM SHARED V_14c8!
DIM SHARED V_14cc!
DIM SHARED V_14d0!
DIM SHARED V_14d4!
DIM SHARED V_14d8!
DIM SHARED V_14dc!
DIM SHARED V_14e0!
DIM SHARED V_14e4!
DIM SHARED V_14e8!
DIM SHARED V_14ec!
DIM SHARED V_14f0!
DIM SHARED V_14f4!
DIM SHARED V_14f8!
DIM SHARED V_14fc!
DIM SHARED V_1500!
DIM SHARED V_1504!
DIM SHARED V_1508!
DIM SHARED V_150c!
DIM SHARED V_1510!
DIM SHARED V_1514!
DIM SHARED V_1518#
DIM SHARED V_1520#
DIM SHARED V_1528!
DIM SHARED V_152c!
DIM SHARED V_1638$
DIM SHARED ST_0ece!(0 TO 12)   ' matriz estatica em DS:0ECE (elementos de indice constante sao V_ no lift)
DIM SHARED ST_0f06!(0 TO 12)   ' matriz estatica em DS:0F06 (elementos de indice constante sao V_ no lift)
DIM SHARED ST_0f3e!(0 TO 2)   ' matriz estatica em DS:0F3E (elementos de indice constante sao V_ no lift)
DIM SHARED ST_0f4e!(0 TO 2)   ' matriz estatica em DS:0F4E (elementos de indice constante sao V_ no lift)
DIM SHARED ST_0f5e!(0 TO 5)   ' matriz estatica em DS:0F5E (elementos de indice constante sao V_ no lift)
DIM SHARED ST_0f7a!(0 TO 131)   ' matriz estatica em DS:0F7A (elementos de indice constante sao V_ no lift)
DIM SHARED ST_11e2!(0 TO 131)   ' matriz estatica em DS:11E2 (elementos de indice constante sao V_ no lift)
DIM SHARED ST_144a$(0 TO 2)   ' matriz estatica em DS:144A (elementos de indice constante sao V_ no lift)

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "ARMADURA"
' ---- M_ARMADURA @0x10030  (010030_M_ARMADURA.lift.txt; evidence_id (assembly): ev_e36d097f96b86bcb09dc0a4c09b759db5f273e0ca788412c70f6d8c0f2ed6dd4)
' @10030 inicio do programa (B$?EVT)
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@100fd
RT_CLEAR   '@1010c (CLEAR zera as variaveis do programa e do COMMON, nao o estado do RT45)
GOSUB L_113fd   '@1011e
CALL S_30042   '@1012b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e98! = 1.0   '@10135 DS:1640
L_1014c:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_0e98!))) <> "") THEN GOTO L_101ee   '@1014d DS:1644
IF NOT (RT_INSTR%((1), (ENVIRON$(RT_CINT%(FX##(V_0e98!)))), ("COMSPEC")) > 0) THEN GOTO L_101cf   '@1016b DS:1648
V_0df0$ = RT_MID$((ENVIRON$(RT_CINT%(FX##(V_0e98!)))), (9), (1))   '@10195
GOTO L_101ee   '@101c2
L_101cf:
V_0e98! = FX##(V_0e98!) + 1.0   '@101cf DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1014c   '@101e5
L_101ee:
V_0e00$ = CHR$(27) + CHR$(50)   '@101ee
V_0e04$ = CHR$(27) + CHR$(48)   '@10216
V_14a0$ = CHR$(27) + CHR$(78) + CHR$(6)   '@1023e
V_0e08$ = CHR$(27) + CHR$(79)   '@10276
V_14a4$ = V_0df0$   '@1029e
L_BP0c% = (V_14a4$ = "A")   '@102b0 DS:1654
IF NOT ((V_14a4$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_1030e   '@102d5 DS:165a
V_14a4$ = V_14a4$ + ":\"   '@102ea DS:1660
GOTO L_1032f   '@10306
L_1030e:
V_14a4$ = V_14a4$ + ":\SISTRUT\EXEC40\"   '@1030e DS:1666
L_1032f:
V_0de4$ = "CGA"   '@1032f DS:167c
V_0de8$ = "LPT1:"   '@10341 DS:1684
V_0dec$ = "COM1:"   '@10353 DS:168e
V_0ea0! = 1.0   '@10365 DS:1640
V_147e$ = ""   '@10376 DS:1644
L_1038e:
IF NOT (V_0ea0! < 18.0) THEN GOTO L_103f8   '@1038f DS:1698
V_147e$ = V_147e$ + CHR$(SCREEN(4, RT_CINT%(FX##(V_0ea0!))))   '@103a4
V_0ea0! = FX##(V_0ea0!) + 1.0   '@103da DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1038e   '@103f0
L_103f8:
' PROTECAO: verificacao de licenca do original desativada
V_0ea0! = 1.0   '@1040f DS:1640
V_147e$ = ""   '@10420 DS:1644
L_10438:
IF NOT (V_0ea0! < 40.0) THEN GOTO L_104a2   '@10439 DS:16b2
V_147e$ = V_147e$ + CHR$(SCREEN(5, RT_CINT%(FX##(V_0ea0!))))   '@1044e
V_0ea0! = FX##(V_0ea0!) + 1.0   '@10484 DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_10438   '@1049a
L_104a2:
V_14a4$ = RTRIM$(RT_MID2$((V_147e$), (17)))   '@104a2
V_0de4$ = RT_MID$((V_147e$), (1), (3))   '@104c8
V_0de8$ = RT_MID$((V_147e$), (4), (5))   '@104e8
V_0dec$ = RT_MID$((V_147e$), (10), (5))   '@10508
GOTO L_10569   '@10528
L_10530:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10569:
L_1056e:   ' entrada vinda de 0111ed_F_111ed
V_1494! = 20.0   '@10573 DS:170c
V_0dc0! = 15.0   '@10584 DS:1710
V_0dc8! = 1.0   '@10595 DS:1640
V_0dc4! = 15.0   '@105a6 DS:1710
READ ST_0ece!(0), ST_0ece!(1), ST_0ece!(2), ST_0ece!(3), ST_0ece!(4), ST_0ece!(5), ST_0ece!(6), ST_0ece!(7), ST_0ece!(8), ST_0ece!(9), ST_0ece!(10), ST_0ece!(11), ST_0ece!(12)   '@105bd
READ ST_0f06!(0), ST_0f06!(1), ST_0f06!(2), ST_0f06!(3), ST_0f06!(4), ST_0f06!(5), ST_0f06!(6), ST_0f06!(7), ST_0f06!(8), ST_0f06!(9), ST_0f06!(10), ST_0f06!(11), ST_0f06!(12)   '@10664
V_0e14! = 0.5299999713897705078125##   '@10705 DS:1714
V_0e18! = 0.00150000001303851604461669921875##   '@10716 DS:1718
V_0e60! = 1.39999997615814208984375##   '@10727 DS:171c
V_0e64! = 1.39999997615814208984375##   '@10738 DS:171c
V_0e68! = 1.14999997615814208984375##   '@10749 DS:1720
V_0dd4$ = "m"   '@1075a DS:1724
V_0dd0$ = "t"   '@1076c DS:172a
V_0ddc! = 1.0   '@1077e DS:1640
V_0de0! = 1.0   '@1078f DS:1640
V_0df4$ = "\"   '@107a0 DS:1730
V_0e74! = 0.1500000059604644775390625##   '@107b2 DS:1736
V_0e78! = 5.0   '@107c3 DS:173a
V_0e80$ = "B"   '@107d4 DS:165a
V_0dcc$ = "t/cm2"   '@107e6 DS:173e
V_0dd8! = 1.0   '@107f8 DS:1640
V_0e0c! = 40.0   '@10809 DS:16b2
V_0e10! = 60.0   '@1081a DS:1748
ON ERROR GOTO L_1125d
RT_ONERR = &H1125d   '@1082b
OPEN RT_ARQ$(V_14a4$ + "ARMADURA.INI") FOR INPUT AS #1   '@1083a DS:174c,1752
LINE INPUT #1, V_147e$   '@1085e DS:1644
V_0df0$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10881 DS:1762
LINE INPUT #1, V_147e$   '@108ad DS:1644
V_0df4$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@108d0 DS:1762
IF NOT (RT_MID$((V_0df4$), (1), (1)) <> "\") THEN GOTO L_1093a   '@108fc DS:1730
V_0df4$ = "\" + V_0df4$   '@1091e DS:1730
L_1093a:
L_BP0c% = (LEN(V_0df4$) > 1)   '@1093a
IF NOT ((RT_RIGHT$((V_0df4$), (1)) <> "\" AND L_BP0c%) <> 0) THEN GOTO L_10997   '@1095c DS:1730
V_0df4$ = V_0df4$ + "\"   '@1097b DS:1730
L_10997:
LINE INPUT #1, V_147e$   '@10997 DS:1644
V_0dd4$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@109ba DS:1762
LINE INPUT #1, V_147e$   '@109e6 DS:1644
V_0dd0$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10a09 DS:1762
LINE INPUT #1, V_147e$   '@10a35 DS:1644
V_0ddc! = VAL(V_147e$)   '@10a58
LINE INPUT #1, V_147e$   '@10a72 DS:1644
V_0de0! = VAL(V_147e$)   '@10a95
LINE INPUT #1, V_147e$   '@10aaf DS:1644
V_0dcc$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10ad2 DS:1762
LINE INPUT #1, V_147e$   '@10afe DS:1644
V_0dd8! = VAL(V_147e$)   '@10b21
LINE INPUT #1, V_147e$   '@10b3b DS:1644
V_0e74! = VAL(V_147e$)   '@10b5e
LINE INPUT #1, V_147e$   '@10b78 DS:1644
V_0e78! = VAL(V_147e$)   '@10b9b
LINE INPUT #1, V_147e$   '@10bb5 DS:1644
V_0e80$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10bd8 DS:1762
LINE INPUT #1, V_147e$   '@10c04 DS:1644
FOR V_0e9c! = 0.0 TO 12.0   '@10c27 DS:1640,1768,176c
INPUT #1, ST_0ece!(RT_CINT%(FX##(V_0e9c!)))   '@10c34
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e9c!   '@10c64 DS:1640,176c
LINE INPUT #1, V_147e$   '@10c8d DS:1644
FOR V_0e9c! = 0.0 TO 12.0   '@10cb0 DS:1640,1768,176c
INPUT #1, ST_0f06!(RT_CINT%(FX##(V_0e9c!)))   '@10cbe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e9c!   '@10cee DS:1640,176c
LINE INPUT #1, V_147e$   '@10d17 DS:1644
V_0e14! = VAL(V_147e$)   '@10d3a
LINE INPUT #1, V_147e$   '@10d54 DS:1644
V_0e18! = VAL(V_147e$)   '@10d77
LINE INPUT #1, V_147e$   '@10d91 DS:1644
V_0e60! = VAL(V_147e$)   '@10db4
LINE INPUT #1, V_147e$   '@10dce DS:1644
V_0e64! = VAL(V_147e$)   '@10df1
LINE INPUT #1, V_147e$   '@10e0b DS:1644
V_0e68! = VAL(V_147e$)   '@10e2e
LINE INPUT #1, V_147e$   '@10e48 DS:1644
V_0e0c! = VAL(V_147e$)   '@10e6b
LINE INPUT #1, V_147e$   '@10e85 DS:1644
V_0e10! = VAL(V_147e$)   '@10ea8
LINE INPUT #1, V_147e$   '@10ec2 DS:1644
V_0e00$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10ee5 DS:1762
LINE INPUT #1, V_147e$   '@10f11 DS:1644
V_0e04$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10f34 DS:1762
LINE INPUT #1, V_147e$   '@10f60 DS:1644
V_14a0$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10f83 DS:1762
LINE INPUT #1, V_147e$   '@10faf DS:1644
V_0e08$ = RT_MID$((V_147e$), (1), (RT_INSTR%((1), (V_147e$), ("=")) - 1))   '@10fd2 DS:1762
CLOSE #1   '@10ffe
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@1100d
V_147e$ = V_0e00$   '@1101c
GOSUB L_112de   '@1102e
V_0e00$ = V_1482$   '@1103b
V_147e$ = V_0e04$   '@1104d
GOSUB L_112de   '@1105f
V_0e04$ = V_1482$   '@1106c
V_147e$ = V_14a0$   '@1107e
GOSUB L_112de   '@11090
V_14a0$ = V_1482$   '@1109d
V_147e$ = V_0e08$   '@110af
GOSUB L_112de   '@110c1
V_0e08$ = V_1482$   '@110ce
L_110e5:   ' entrada vinda de 0111ed_F_111ed
V_0df8$ = V_0df0$   '@110ea
V_0dfc$ = V_0df4$   '@110fc
L_BP0c% = (V_0df8$ <> "A")   '@1110e DS:1654
IF NOT ((V_0df8$ <> "B" AND L_BP0c%) <> 0) THEN GOTO L_11194   '@11133 DS:165a
L_BP0c% = (LEN(V_0dfc$) > 1)   '@11148 DS:1770
CHDIR RT_ARQ$(V_0df8$ + ":" + RT_LEFT$((V_0dfc$), (LEN(V_0dfc$) + L_BP0c%)))   '@11175
L_11194:
V_0e6c! = V_0e74!   '@11194
V_0e70! = V_0e78!   '@111a5
ON ERROR GOTO L_111f2
RT_ONERR = &H111f2   '@111b6
PCOPY 0, 1   '@111c5
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@111d6
GOTO L_11801   '@111e5
' ---- F_111ed @0x111ed  (0111ed_F_111ed.lift.txt; evidence_id (assembly): ev_df6d25b8f71c1d2259aebffbc2dfc4cfac59e3a977798a4d9d71a79d2db0067f)
L_111f2:   ' entrada vinda de 010030_M_ARMADURA
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@111f7
V_0de4$ = "HER"   '@11206 DS:1776
V_0dc0! = 14.0   '@11218 DS:177e
V_0dc8! = 0.0   '@11229 DS:1768
V_0dc4! = 9.0   '@1123a DS:1782
RESUME L_11801   '@1124b
L_1125d:   ' entrada vinda de 010030_M_ARMADURA
CLOSE #1   '@11262
IF NOT (RT_INSTR%((1), ("CDEF"), (RT_MID$((V_14a4$), (1), (1)))) > 0) THEN GOTO L_112bd   '@11271 DS:1786
V_14a4$ = "A:\"   '@11299 DS:178e
RESUME L_1056e   '@112ab
L_112bd:
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@112bd
RESUME L_110e5   '@112cc
L_112de:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_ARMADURA
V_0ea0! = 0.0   '@112e3 DS:1768
V_1482$ = ""   '@112f4 DS:1644
L_1130c:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_0ea0!) + 1.0)), (V_147e$), ("(")) > 0) THEN GOTO L_113ae   '@1130d DS:1640,1796
V_0ea0! = RT_INSTR%((RT_CINT%(FX##(V_0ea0!) + 1.0)), (V_147e$), ("(")) + 1   '@11330 DS:1640,1796
V_1482$ = V_1482$ + CHR$(RT_CINT%(FX##(VAL(RT_MID2$((V_147e$), (RT_CINT%(FX##(V_0ea0!))))))))   '@1135f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1130c   '@113a6
L_113ae:
RETURN   '@113ae
L_113bd:   ' entrada vinda de 010030_M_ARMADURA, 011801_FUN_1000_1801
RESUME L_113d4   '@113c2
L_113d4:
GOSUB L_113fd   '@113d9
CALL S_196cc   '@113e6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
GOTO L_11801   '@113f0
' ---- F_113f8 @0x113f8  (0113f8_F_113f8.lift.txt; evidence_id (assembly): ev_26056adbb69ad22eff396cf54258a15061eef25e28c6728d7192d17d6956d40c)
L_113fd:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_ARMADURA, 0111ed_F_111ed
FOR V_14a8! = 1.0 TO 10.0   '@11402 DS:1640,179c
ON KEY(RT_CINT%(FX##(V_14a8!))) GOSUB L_116a3
RT_ONKEY RT_CINT%(FX##(V_14a8!)), 1   '@11410
KEY(RT_CINT%(FX##(V_14a8!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a8!)), 1   '@1142a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_14a8!   '@1143f DS:1640,179c
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@11468
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@11490
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@114b8
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@114e0
FOR V_14a8! = 15.0 TO 18.0   '@11508 DS:1640,1698,1710
ON KEY(RT_CINT%(FX##(V_14a8!))) GOSUB L_116ce
RT_ONKEY RT_CINT%(FX##(V_14a8!)), 2   '@11516
KEY(RT_CINT%(FX##(V_14a8!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a8!)), 1   '@11530
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_14a8!   '@11545 DS:1640,1698
ON KEY(2) GOSUB L_116ce
RT_ONKEY 2, 2   '@1156e
KEY(2) ON
RT_KEYESTADO 2, 1   '@11581
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@1158f
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@115b7
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@115df
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@11607
FOR V_14a8! = 19.0 TO 22.0   '@1162e DS:1640,17a0,17a4
ON KEY(RT_CINT%(FX##(V_14a8!))) GOSUB L_117d3
RT_ONKEY RT_CINT%(FX##(V_14a8!)), 3   '@1163c
KEY(RT_CINT%(FX##(V_14a8!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a8!)), 1   '@11656
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_14a8!   '@1166b DS:1640,17a4
RETURN   '@11694
L_116a3:
BEEP   '@116a8
GOSUB L_113fd   '@116b2
RETURN   '@116bf
L_116ce:
RT_VIEWPRINT 1, 25   '@116d3
COLOR 7, 0, 0   '@116e5
RT_CLS 0   '@11709
PRINT " Aguarde ..."   '@11716 DS:17a8
PRINT ""   '@11724 DS:1644
PRINT " Retorno ao Modulo Gerenciador"   '@11732 DS:17b8
ON ERROR GOTO L_11783
RT_ONERR = &H11783   '@11740
RT_RUN RT_MID$((V_14a4$), (1), (LEN(V_14a4$) - 7)) + "SISTRUT"   '@1174f DS:17da
L_11783:
PRINT " Modulo nao encontrado em "; RT_MID$((V_14a4$), (1), (LEN(V_14a4$) - 7))   '@11788 DS:17e6
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@117b6 DS:16d0
RT_FIM   '@117c4 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_117d3:
BEEP   '@117d8
GOSUB L_113fd   '@117e2
RETURN L_11801   '@117f9
' ---- FUN_1000_1801 @0x11801  (011801_FUN_1000_1801.lift.txt; evidence_id (assembly): ev_0167fbd9dfdd5845679ca8a4c4a8b895b62ddea7032a4f844c7b26ab5e5f6d62)
L_11801:   ' entrada vinda de 010030_M_ARMADURA, 0111ed_F_111ed, 0113f8_F_113f8, 013130_F_13130, 0147d0_F_147d0, 014b58_F_14b58, 017beb_FUN_1000_7beb, 01894d_FUN_1000_894d, 018f3a_FUN_1000_8f3a
RT_SCREEN 0   '@11806
RT_VIEWPRINT 1, 25   '@1181b
COLOR 7, RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@1182d
RT_CLOSE   '@11861 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RT_CLS 0   '@1186e
ON ERROR GOTO L_113bd
RT_ONERR = &H113bd   '@1187b
COLOR 11   '@1188a
PRINT RT_STRINGC$((80), (219))   '@118a0
PRINT "   ARMADURA PARA VIGAS DE CONCRETO SUBMETIDA A FLEXAO SIMPLES"   '@118b8 DS:1804
PRINT "   OpenStrut  eng. reversa independente do"   '@118c6 DS:1846
PRINT "   SISTRUT 4.0 (1991), sem vinculo oficial"   '@118d4 DS:1874
PRINT "   Versao 4.0   "; V_1638$   '@118e2 DS:18a2
PRINT RT_STRINGC$((80), (219))   '@118f9
COLOR 7   '@11911
LOCATE 8, 20   '@11927
PRINT "1  -  ";   '@11945 DS:18b6
COLOR RT_CINT%(FX##(V_0dc4!))   '@11953
PRINT "M";   '@11970 DS:18c0
COLOR 7   '@1197e
PRINT "ateriais, Concreto Aco"   '@11994 DS:18c6
LOCATE 10, 20   '@119a2
PRINT "2  -  ";   '@119c0 DS:18e0
COLOR RT_CINT%(FX##(V_0dc4!))   '@119ce
PRINT "A";   '@119eb DS:1654
COLOR 7   '@119f9
PRINT "rquivar Secoes"   '@11a0f DS:18ea
LOCATE 12, 20   '@11a1d
PRINT "3  -  ";   '@11a3b DS:18fc
COLOR RT_CINT%(FX##(V_0dc4!))   '@11a49
PRINT "P";   '@11a66 DS:1906
COLOR 7   '@11a74
PRINT "rocessar Calculo das Secoes"   '@11a8a DS:190c
LOCATE 14, 20   '@11a98
PRINT "4  -  Calculo de ";   '@11ab6 DS:192c
COLOR RT_CINT%(FX##(V_0dc4!))   '@11ac4
PRINT "u";   '@11ae1 DS:1942
COLOR 7   '@11aef
PRINT "ma Secao"   '@11b05 DS:1948
LOCATE 16, 20   '@11b13
PRINT "5  -  ";   '@11b31 DS:1954
COLOR RT_CINT%(FX##(V_0dc4!))   '@11b3f
PRINT "C";   '@11b5c DS:195e
COLOR 7   '@11b6a
PRINT "orrecoes dos dados"   '@11b80 DS:1964
LOCATE 18, 20   '@11b8e
PRINT "6  -  ";   '@11bac DS:197a
COLOR RT_CINT%(FX##(V_0dc4!))   '@11bba
PRINT "D";   '@11bd7 DS:1984
COLOR 7   '@11be5
PRINT "imensionamento"   '@11bfb DS:198a
LOCATE 20, 20   '@11c09
PRINT "7  -  ";   '@11c27 DS:199c
COLOR RT_CINT%(FX##(V_0dc4!))   '@11c35
PRINT "V";   '@11c52 DS:19a6
COLOR 7   '@11c60
PRINT "isualizar / Alterar Parametrizacoes"   '@11c76 DS:19ac
LOCATE 22, 20   '@11c84
PRINT "8  -  ";   '@11ca2 DS:19d4
COLOR RT_CINT%(FX##(V_0dc4!))   '@11cb0
PRINT "L";   '@11ccd DS:19de
COLOR 7   '@11cdb
PRINT "ista das Secoes Arquivadas"   '@11cf1 DS:19e4
LOCATE 24, 60   '@11cff
COLOR RT_CINT%(FX##(V_0dc0!)), 3   '@11d1d
PRINT " <F2> = Fim "   '@11d42 DS:1a02
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@11d50
L_11d81:
COLOR RT_CINT%(FX##(V_0dc0!))   '@11d86
LOCATE 24, 20   '@11da3
PRINT "escolha opcao ";   '@11dc1 DS:1a12
CALL MIXT_07f1_LimpaTeclado   '@11dcf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@11dd9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_14ac! = RT_FRE&("")   '@11df5 DS:1644
COLOR 7   '@11e0f
V_14b0$ = V_147e$   '@11e25
IF NOT (V_14b0$ <> "1") THEN GOTO L_11e72   '@11e37 DS:1a24
IF NOT (V_14b0$ <> "M") THEN GOTO L_11e72   '@11e4e DS:18c0
IF NOT (V_14b0$ = "m") THEN GOTO L_11e82   '@11e60 DS:1724
L_11e72:
GOTO L_12092   '@11e72
L_11e82:
IF NOT (V_14b0$ <> "2") THEN GOTO L_11eb8   '@11e82 DS:1a2a
IF NOT (V_14b0$ <> "A") THEN GOTO L_11eb8   '@11e94 DS:1654
IF NOT (V_14b0$ = "a") THEN GOTO L_11ec8   '@11ea6 DS:1a30
L_11eb8:
GOTO L_12717   '@11eb8
L_11ec8:
IF NOT (V_14b0$ <> "3") THEN GOTO L_11efe   '@11ec8 DS:1a36
IF NOT (V_14b0$ <> "P") THEN GOTO L_11efe   '@11eda DS:1906
IF NOT (V_14b0$ = "p") THEN GOTO L_11f0e   '@11eec DS:1a3c
L_11efe:
GOTO L_14589   '@11efe
L_11f0e:
IF NOT (V_14b0$ <> "4") THEN GOTO L_11f44   '@11f0e DS:1a42
IF NOT (V_14b0$ <> "U") THEN GOTO L_11f44   '@11f20 DS:1a48
IF NOT (V_14b0$ = "u") THEN GOTO L_11f54   '@11f32 DS:1942
L_11f44:
GOTO L_17681   '@11f44
L_11f54:
IF NOT (V_14b0$ <> "5") THEN GOTO L_11f8a   '@11f54 DS:1a4e
IF NOT (V_14b0$ <> "C") THEN GOTO L_11f8a   '@11f66 DS:195e
IF NOT (V_14b0$ = "c") THEN GOTO L_11f9a   '@11f78 DS:1a54
L_11f8a:
GOTO L_17beb   '@11f8a
L_11f9a:
IF NOT (V_14b0$ <> "6") THEN GOTO L_11fd0   '@11f9a DS:1a5a
IF NOT (V_14b0$ <> "D") THEN GOTO L_11fd0   '@11fac DS:1984
IF NOT (V_14b0$ = "d") THEN GOTO L_11fea   '@11fbe DS:1a60
L_11fd0:
CALL S_200c9   '@11fd0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@11fda
L_11fea:
IF NOT (V_14b0$ <> "7") THEN GOTO L_12020   '@11fea DS:1a66
IF NOT (V_14b0$ <> "V") THEN GOTO L_12020   '@11ffc DS:19a6
IF NOT (V_14b0$ = "v") THEN GOTO L_12030   '@1200e DS:1a6c
L_12020:
GOTO L_1894d   '@12020
L_12030:
IF NOT (V_14b0$ <> "8") THEN GOTO L_12066   '@12030 DS:1a72
IF NOT (V_14b0$ <> "L") THEN GOTO L_12066   '@12042 DS:19de
IF NOT (V_14b0$ = "l") THEN GOTO L_12076   '@12054 DS:1a78
L_12066:
GOTO L_18f3a   '@12066
L_12076:
BEEP   '@12076
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11d81   '@12080
L_12092:
RT_VIEWPRINT 1, 25   '@12097
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@120a9
RT_CLS 2   '@120d5
PRINT RT_STRINGC$((80), (205))   '@120e3
PRINT " Definicao dos Materiais e unidades de trabalho"   '@120fb DS:1a7e
PRINT RT_STRINGC$((80), (205))   '@12109
L_12126:
COLOR 7   '@1212b
LOCATE 6, 1   '@12141
PRINT " Concreto Fck *";   '@1215c DS:1ab2
COLOR RT_CINT%(FX##(V_0dc0!))   '@1216a
PRINT LTRIM$(STR$(V_0e74!));   '@12187
COLOR 7   '@121a5
PRINT "* "; V_0dcc$;   '@121bb DS:1ac6
CALL MIXT_07f1_LimpaTeclado   '@121d2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@121dc DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_1249a   '@121f6
IF NOT (VAL(V_147e$) <= 0.0#) THEN GOTO L_12241   '@1220b DS:1ad2
BEEP   '@1222f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_12126   '@12239
L_12241:
V_0e74! = VAL(V_147e$)   '@12241
L_12260:
LOCATE 9, 1   '@12265
PRINT "  Unidade de grandeza para os valores caracteristicos do Concreto e Aco"   '@12280 DS:1ada
PRINT "  *";   '@1228e DS:1b26
COLOR RT_CINT%(FX##(V_0dc0!))   '@1229c
PRINT V_0dcc$;   '@122b9
COLOR 7   '@122c7
CALL MIXT_07f1_LimpaTeclado   '@122dd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_147e$   '@122e7 DS:1ac6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_12363   '@12301
IF NOT (VAL(V_147e$) <> 0.0#) THEN GOTO L_1234c   '@12316 DS:1ad2
BEEP   '@1233a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_12260   '@12344
L_1234c:
V_0dcc$ = V_147e$   '@1234c
L_12363:
L_12368:
LOCATE 12, 1   '@1236d
PRINT "  Multiplicador de ("; V_0dcc$; ") para transformar em Tonelada/Centimetro2"   '@12388 DS:1b2e,1b46
PRINT "  *";   '@123a8 DS:1b26
COLOR RT_CINT%(FX##(V_0dc0!))   '@123b6
PRINT LTRIM$(STR$(V_0dd8!));   '@123d3
COLOR 7   '@123f1
CALL MIXT_07f1_LimpaTeclado   '@12407
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_147e$   '@12411 DS:1ac6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_12495   '@1242b
IF NOT (VAL(V_147e$) <= 0.0#) THEN GOTO L_12476   '@12440 DS:1ad2
BEEP   '@12464
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_12368   '@1246e
L_12476:
V_0dd8! = VAL(V_147e$)   '@12476
L_12495:
L_1249a:
L_1249f:
LOCATE 7, 1   '@124a4
PRINT " Aco      Fyk *";   '@124bf DS:1b74
COLOR RT_CINT%(FX##(V_0dc0!))   '@124cd
PRINT LTRIM$(STR$(V_0e78!));   '@124ea
COLOR 7   '@12508
PRINT "* "; V_0dcc$;   '@1251e DS:1ac6
CALL MIXT_07f1_LimpaTeclado   '@12535
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@1253f DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) <> 0) THEN GOTO L_125d4   '@12559
IF NOT (VAL(V_147e$) <= 0.0#) THEN GOTO L_125a4   '@1256e DS:1ad2
BEEP   '@12592
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1249f   '@1259c
L_125a4:
V_0e78! = VAL(V_147e$)   '@125a4
V_0e70! = V_0e78!   '@125be
L_125d4:
L_125d9:
LOCATE 7, 45   '@125de
PRINT " Tipo de Aco  A/B *";   '@125fc DS:1b88
COLOR RT_CINT%(FX##(V_0dc0!))   '@1260a
PRINT V_0e80$;   '@12627
COLOR 7   '@12635
CALL MIXT_07f1_LimpaTeclado   '@1264b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_147e$   '@12655 DS:1ac6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_126f9   '@1266f
L_BP0c% = (UCASE$(V_147e$) <> "A")   '@12684 DS:1654
IF NOT ((UCASE$(V_147e$) <> "B" AND L_BP0c%) <> 0) THEN GOTO L_126dc   '@126ab DS:165a
BEEP   '@126ca
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_125d9   '@126d4
L_126dc:
V_0e80$ = UCASE$(V_147e$)   '@126dc
L_126f9:
V_14b4! = 1.0   '@126f9 DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@1270a
L_12717:
RT_VIEWPRINT 1, 25   '@1271c
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1272e
RT_CLS 2   '@1275a
PRINT RT_STRINGC$((80), (205))   '@12768
PRINT " Arquivo de Secoes para dimensionamento"   '@12780 DS:1ba0
PRINT " numero maximo de posicoes -"; V_1494!;   '@1278e DS:1bcc
IF NOT (V_1492% = 0) THEN GOTO L_127ce   '@127a9
PRINT ""   '@127b8 DS:1644
GOTO L_127ee   '@127c6
L_127ce:
PRINT "    posicionadas"; V_1492%; "Secoes"   '@127ce DS:1bec,1c00
L_127ee:
PRINT RT_STRINGC$((80), (205))   '@127ee
L_1280b:
RT_VIEWPRINT 6, 25   '@12810
RT_CLS 2   '@12822
COLOR 7   '@12830
PRINT " Posicao *";   '@12846 DS:1c0a
COLOR RT_CINT%(FX##(V_0dc0!))   '@12854
PRINT V_1492% + 1;   '@12871
COLOR 7   '@12880
PRINT "*";   '@12896 DS:1c18
CALL MIXT_07f1_LimpaTeclado   '@128a4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@128ae DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e9c! = VAL(V_147e$)   '@128c8
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_1290c   '@128e2
V_0e9c! = V_1492% + 1   '@128f7
L_1290c:
IF NOT (V_0e9c! > V_1494! OR V_1492% + 1 < V_0e9c!) THEN GOTO L_12956   '@1290c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1280b   '@1294e
L_12956:
L_1295b:
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@12960
RT_CLS 2   '@1298c
PRINT " ( POSICAO"; V_0e9c!; ")"   '@1299a DS:1c1e,1c2c
GOSUB L_13135   '@129be
IF NOT (V_147e$ = "FIM") THEN GOTO L_129ea   '@129cb DS:1c32
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@129e2
L_129ea:
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@129ea DS:1c3a
LOCATE 7, 30   '@12a1b
PRINT CHR$(218); RT_STRINGC$((38), (196)); CHR$(191)   '@12a39
V_0e98! = 8.0   '@12a6f DS:1c3e
L_12a86:
LOCATE RT_CINT%(FX##(V_0e98!)), 30   '@12a86
COLOR RT_CINT%(FX##(V_0dc0!))   '@12aab
PRINT CHR$(179); RT_STRINGC$((38), (32)); CHR$(179);   '@12ac8
COLOR 0   '@12afe
PRINT CHR$(219)   '@12b13
V_0e98! = FX##(V_0e98!) + 1.0   '@12b27 DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
IF NOT (V_0e98! = 20.0) THEN GOTO L_12a86   '@12b3d DS:170c
LOCATE 20, 30   '@12b58
COLOR RT_CINT%(FX##(V_0dc0!))   '@12b76
PRINT CHR$(192); RT_STRINGC$((38), (196)); CHR$(217);   '@12b93
COLOR 0   '@12bc9
PRINT CHR$(219)   '@12bde
LOCATE 21, 32   '@12bf2
PRINT RT_STRINGC$((39), (219))   '@12c10
COLOR RT_CINT%(FX##(V_0dc0!))   '@12c28
LOCATE 8, 33   '@12c45
IF NOT (V_0ec0! <= 5.0) THEN GOTO L_12f00   '@12c63 DS:173a
IF NOT (V_0ec0! < 3.0) THEN GOTO L_12ca7   '@12c7e DS:1c42
PRINT "Secao Retangular - Te"   '@12c99 DS:1c46
L_12ca7:
IF NOT (V_0ec0! = 3.0) THEN GOTO L_12cd0   '@12ca7 DS:1c42
PRINT "Secao Triangular"   '@12cc2 DS:1c60
L_12cd0:
IF NOT (V_0ec0! = 4.0) THEN GOTO L_12cf9   '@12cd0 DS:1c3a
PRINT "Secao Triangular Invertida"   '@12ceb DS:1c74
L_12cf9:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_12d22   '@12cf9 DS:173a
PRINT "Secao Trapezoidal"   '@12d14 DS:1c92
L_12d22:
LOCATE 10, 33   '@12d22
IF NOT (V_0ec0! <= 4.0) THEN GOTO L_12e4f   '@12d40 DS:1c3a
PRINT "B="; V_0e84!; RT_TAB$(45); ""; "H="; V_0e88!; RT_TAB$(55); ""; "d="; V_0e8c!   '@12d5b DS:1644,1ca8,1cae,1cb4
IF NOT (V_0ec0! < 3.0) THEN GOTO L_12e47   '@12dc6 DS:1c42
LOCATE 11, 33   '@12de1
PRINT "Bf="; V_0e90!; RT_TAB$(45); ""; "Hf="; V_0e94!   '@12dff DS:1644,1cba,1cc2
L_12e47:
GOTO L_12ef8   '@12e47
L_12e4f:
PRINT "Binf="; V_0e84!; RT_TAB$(45); ""; "H="; V_0e88!; RT_TAB$(55); ""; "d="; V_0e8c!   '@12e4f DS:1644,1cae,1cb4,1cca
LOCATE 11, 33   '@12eba
PRINT "Bsup="; V_0e90!   '@12ed8 DS:1cd4
L_12ef8:
GOTO L_12f74   '@12ef8
L_12f00:
PRINT "Secao Circular"   '@12f00 DS:1cde
LOCATE 10, 33   '@12f0e
PRINT "Diametro="; V_0e84!; RT_TAB$(55); ""; "d="; V_0e8c!   '@12f2c DS:1644,1cb4,1cf0
L_12f74:
LOCATE 13, 33   '@12f74
PRINT "Bitolas utilizadas na Flexao"   '@12f92 DS:1cfe
LOCATE 14, 33   '@12fa0
PRINT ST_0f5e!(0); ST_0f5e!(1); ST_0f5e!(2)   '@12fbe
LOCATE 16, 33   '@12fea
PRINT "Bitolas utilizadas no Cisalhamento"   '@13008 DS:1d1e
LOCATE 17, 33   '@13016
PRINT ST_0f5e!(3); ST_0f5e!(4); ST_0f5e!(5)   '@13034
LOCATE 19, 33   '@13060
PRINT "Dados Corretos  N/*S*";   '@1307e DS:1d44
CALL MIXT_07f1_LimpaTeclado   '@1308c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@13096 DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_147e$) = "N") THEN GOTO L_130d5   '@130b0 DS:1d5e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1295b   '@130cd
L_130d5:
GOSUB L_141da   '@130d5
IF NOT (V_1492% < V_0e9c!) THEN GOTO L_13112   '@130e2
V_1492% = RT_CINT%(FX##(V_0e9c!))   '@13100
L_13112:
V_0e9c! = FX##(V_0e9c!) + 1.0   '@13112 DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1295b   '@13128
' ---- F_13130 @0x13130  (013130_F_13130.lift.txt; evidence_id (assembly): ev_1b37ebbceaf29e31a8323d027c87aba25ef7f60f57e4c10f7aab61d9c7e81000)
L_13135:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011801_FUN_1000_1801, 014b58_F_14b58
RT_VIEWPRINT 8, 25   '@1313a
COLOR 7   '@1314c
RT_CLS 2   '@13162
PRINT "     1  -  ";   '@13170 DS:1d64
COLOR RT_CINT%(FX##(V_0dc4!))   '@1317e
PRINT "R";   '@1319b DS:1d74
COLOR 7   '@131a9
PRINT "etangular Te"   '@131bf DS:1d7a
PRINT "     2  -  ";   '@131cd DS:1d8a
COLOR RT_CINT%(FX##(V_0dc4!))   '@131db
PRINT "T";   '@131f8 DS:1d9a
COLOR 7   '@13206
PRINT "riangular"   '@1321c DS:1da0
PRINT "     3  -  Triangular ";   '@1322a DS:1dae
COLOR RT_CINT%(FX##(V_0dc4!))   '@13238
PRINT "I";   '@13255 DS:174c
COLOR 7   '@13263
PRINT "nvertida"   '@13279 DS:1dc8
PRINT "     4  -  Trape";   '@13287 DS:1dd4
COLOR RT_CINT%(FX##(V_0dc4!))   '@13295
PRINT "z";   '@132b2 DS:1de8
COLOR 7   '@132c0
PRINT "oidal"   '@132d6 DS:1dee
PRINT "     5  -  ";   '@132e4 DS:1df8
COLOR RT_CINT%(FX##(V_0dc4!))   '@132f2
PRINT "C";   '@1330f DS:195e
COLOR 7   '@1331d
PRINT "ircular"   '@13333 DS:1e08
PRINT "           *Fim*"   '@13341 DS:1e14
PRINT ""   '@1334f DS:1644
PRINT "     Escolha o tipo de secao ";   '@1335d DS:1e28
CALL MIXT_07f1_LimpaTeclado   '@1336b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@13375
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_CLS 2   '@13391
RT_VIEWPRINT 6, 25   '@1339f
V_14b8$ = V_147e$   '@133b1
IF NOT (V_14b8$ <> "1") THEN GOTO L_133fe   '@133c3 DS:1a24
IF NOT (V_14b8$ <> "R") THEN GOTO L_133fe   '@133da DS:1d74
IF NOT (V_14b8$ = "r") THEN GOTO L_13417   '@133ec DS:1e4a
L_133fe:
V_0ec0! = 2.0   '@133fe DS:1e50
GOTO L_13574   '@1340f
L_13417:
IF NOT (V_14b8$ <> "2") THEN GOTO L_1344d   '@13417 DS:1a2a
IF NOT (V_14b8$ <> "T") THEN GOTO L_1344d   '@13429 DS:1d9a
IF NOT (V_14b8$ = "t") THEN GOTO L_13466   '@1343b DS:172a
L_1344d:
V_0ec0! = 3.0   '@1344d DS:1c42
GOTO L_13574   '@1345e
L_13466:
IF NOT (V_14b8$ <> "3") THEN GOTO L_1349c   '@13466 DS:1a36
IF NOT (V_14b8$ <> "I") THEN GOTO L_1349c   '@13478 DS:174c
IF NOT (V_14b8$ = "i") THEN GOTO L_134b5   '@1348a DS:1e54
L_1349c:
V_0ec0! = 4.0   '@1349c DS:1c3a
GOTO L_13574   '@134ad
L_134b5:
IF NOT (V_14b8$ <> "4") THEN GOTO L_134eb   '@134b5 DS:1a42
IF NOT (V_14b8$ <> "z") THEN GOTO L_134eb   '@134c7 DS:1de8
IF NOT (V_14b8$ = "Z") THEN GOTO L_13504   '@134d9 DS:1e5a
L_134eb:
V_0ec0! = 5.0   '@134eb DS:173a
GOTO L_13574   '@134fc
L_13504:
IF NOT (V_14b8$ <> "5") THEN GOTO L_1353a   '@13504 DS:1a4e
IF NOT (V_14b8$ <> "C") THEN GOTO L_1353a   '@13516 DS:195e
IF NOT (V_14b8$ = "c") THEN GOTO L_13553   '@13528 DS:1a54
L_1353a:
V_0ec0! = 10.0   '@1353a DS:179c
GOTO L_13574   '@1354b
L_13553:
V_147e$ = "FIM"   '@13553 DS:1c32
RETURN   '@13565
L_13574:
V_0e84! = 0.0   '@13574 DS:1768
V_0e88! = 0.0   '@13585 DS:1768
V_0e8c! = 0.0   '@13596 DS:1768
V_0e90! = 0.0   '@135a7 DS:1768
V_0e94! = 0.0   '@135b8 DS:1768
V_0eb4! = 0.0   '@135c9 DS:1768
L_135df:
LOCATE 8, 1   '@135e4
COLOR 7   '@135ff
IF NOT (V_0ec0! <= 4.0) THEN GOTO L_1383c   '@13615 DS:1c3a
PRINT " B(cm) , H(cm) , d(cm) *RETORNO* ";   '@13630 DS:1e60
CALL MIXT_07f1_LimpaTeclado   '@1363e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_00ff_Le3Campos(V_147e$, V_1482$, V_1486$)   '@13648
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e84! = VAL(V_147e$)   '@1365e
V_0e88! = VAL(V_1482$)   '@13678
V_0e8c! = VAL(V_1486$)   '@13692
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_136c9   '@136ac
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_13135   '@136c1
L_136c9:
IF NOT (LEN(V_1486$) = 0) THEN GOTO L_136f4   '@136c9
V_0e8c! = FX##(V_0e88!) - 4.0   '@136de DS:1e86
L_136f4:
IF NOT (V_0e8c! >= V_0e88! OR V_0e84! <= 0.0) THEN GOTO L_13744   '@136f4 DS:1768
BEEP   '@13732
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_135df   '@1373c
L_13744:
L_13749:
IF NOT (V_0ec0! <= 2.0) THEN GOTO L_13837   '@1374e DS:1e50
LOCATE 9, 1   '@13769
PRINT " Bf(cm) , Hf(cm) ";   '@13784 DS:1e8a
CALL MIXT_07f1_LimpaTeclado   '@13792
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_147e$, V_1482$)   '@1379c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e90! = VAL(V_147e$)   '@137ae
V_0e94! = VAL(V_1482$)   '@137c8
IF NOT (V_0e94! < 0.0 OR V_0e90! < 0.0) THEN GOTO L_13832   '@137e2 DS:1768
BEEP   '@13820
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_13749   '@1382a
L_13832:
L_13837:
L_1383c:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_139c4   '@1383c DS:173a
PRINT " Binf(cm) , Bsup(cm) , H(cm) , d(cm) *RETORNO* ";   '@13857 DS:1ea0
CALL MIXT_07f1_LimpaTeclado   '@13865
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_021e_Le4Campos(V_147e$, V_1482$, V_1486$, V_14bc$)   '@1386f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e84! = VAL(V_147e$)   '@13889
V_0e90! = VAL(V_1482$)   '@138a3
V_0e88! = VAL(V_1486$)   '@138bd
V_0e8c! = VAL(V_14bc$)   '@138d7
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_1390e   '@138f1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_13135   '@13906
L_1390e:
IF NOT (LEN(V_14bc$) = 0) THEN GOTO L_13939   '@1390e
V_0e8c! = FX##(V_0e88!) - 4.0   '@13923 DS:1e86
L_13939:
IF NOT (V_0e8c! >= V_0e88! OR (V_0e90! = V_0e84! OR (V_0e90! < 0.0 OR V_0e84! < 0.0))) THEN GOTO L_139bf   '@13939 DS:1768
BEEP   '@139ad
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_135df   '@139b7
L_139bf:
L_139c4:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_13aeb   '@139c4 DS:179c
PRINT " Diametro(cm) , d(cm) *RETORNO* ";   '@139df DS:1ed4
CALL MIXT_07f1_LimpaTeclado   '@139ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_147e$, V_1486$)   '@139f7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e84! = VAL(V_147e$)   '@13a09
V_0e88! = V_0e84!   '@13a23
V_0e8c! = VAL(V_1486$)   '@13a34
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_13a6b   '@13a4e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_13135   '@13a63
L_13a6b:
IF NOT (LEN(V_1486$) = 0) THEN GOTO L_13a96   '@13a6b
V_0e8c! = FX##(V_0e88!) - 4.0   '@13a80 DS:1e86
L_13a96:
IF NOT (V_0e8c! >= V_0e88! OR V_0e84! <= 0.0) THEN GOTO L_13ae6   '@13a96 DS:1768
BEEP   '@13ad4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_135df   '@13ade
L_13ae6:
L_13aeb:
L_13af0:
LOCATE 11, 1   '@13af5
COLOR 3   '@13b10
PRINT " Dentre as Bitolas mostradas abaixo, escolha tres (3)"   '@13b26 DS:1ef8
PRINT " para utilizacao no calculo de esforcos de Flexao ."   '@13b34 DS:1f32
FOR V_0e98! = 0.0 TO 12.0   '@13b42 DS:1640,1768,176c
COLOR 7   '@13b50
PRINT ST_0ece!(RT_CINT%(FX##(V_0e98!)));   '@13b66
COLOR 3   '@13b89
PRINT "/";   '@13b9f DS:1f6a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@13bad DS:1640,176c
COLOR 7   '@13bd9
PRINT " Bitolas(mm) *"; LTRIM$(STR$(ST_0ece!(5))); ","; LTRIM$(STR$(ST_0ece!(6))); ","; LTRIM$(STR$(ST_0ece!(7))); "* ";   '@13bef DS:1ac6,1f70,1f82
COLOR RT_CINT%(FX##(V_0dc0!))   '@13c63
CALL MIXT_07f1_LimpaTeclado   '@13c80
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_00ff_Le3Campos(V_147e$, V_1482$, V_1486$)   '@13c8a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
ST_0f5e!(0) = ST_0ece!(5)   '@13ca0
ST_0f5e!(1) = ST_0ece!(6)   '@13cb1
ST_0f5e!(2) = ST_0ece!(7)   '@13cc2
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_13d02   '@13cd3
ST_0f5e!(0) = VAL(V_147e$)   '@13ce8
L_13d02:
IF NOT (LEN(V_1482$) > 0) THEN GOTO L_13d31   '@13d02
ST_0f5e!(1) = VAL(V_1482$)   '@13d17
L_13d31:
IF NOT (LEN(V_1486$) > 0) THEN GOTO L_13d60   '@13d31
ST_0f5e!(2) = VAL(V_1486$)   '@13d46
L_13d60:
LOCATE 16, 1   '@13d60
COLOR 3   '@13d7b
PRINT " Dentre as Bitolas mostradas abaixo, escolha tres (3)"   '@13d91 DS:1ef8
PRINT " para utilizacao no calculo de esforcos de Cisalhamento."   '@13d9f DS:1f88
FOR V_0e98! = 0.0 TO 12.0   '@13dad DS:1640,1768,176c
COLOR 7   '@13dba
PRINT ST_0ece!(RT_CINT%(FX##(V_0e98!)));   '@13dd0
COLOR 3   '@13df3
PRINT "/";   '@13e09 DS:1f6a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@13e17 DS:1640,176c
COLOR 7   '@13e43
PRINT " Bitolas(mm) *"; LTRIM$(STR$(ST_0ece!(2))); ","; LTRIM$(STR$(ST_0ece!(3))); ","; LTRIM$(STR$(ST_0ece!(4))); "* ";   '@13e59 DS:1ac6,1f70,1f82
COLOR RT_CINT%(FX##(V_0dc0!))   '@13ecd
CALL MIXT_07f1_LimpaTeclado   '@13eea
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_00ff_Le3Campos(V_147e$, V_1482$, V_1486$)   '@13ef4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
ST_0f5e!(3) = ST_0ece!(2)   '@13f0a
ST_0f5e!(4) = ST_0ece!(3)   '@13f1b
ST_0f5e!(5) = ST_0ece!(4)   '@13f2c
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_13f6c   '@13f3d
ST_0f5e!(3) = VAL(V_147e$)   '@13f52
L_13f6c:
IF NOT (LEN(V_1482$) > 0) THEN GOTO L_13f9b   '@13f6c
ST_0f5e!(4) = VAL(V_1482$)   '@13f81
L_13f9b:
IF NOT (LEN(V_1486$) > 0) THEN GOTO L_13fca   '@13f9b
ST_0f5e!(5) = VAL(V_1486$)   '@13fb0
L_13fca:
GOSUB L_140cc   '@13fca
IF NOT (V_147e$ = "*") THEN GOTO L_140bd   '@13fd7 DS:1c18
LOCATE 22, 1   '@13fee
BEEP   '@14009
PRINT " BITOLA NAO PADRONIZADA"   '@14013 DS:1fc4
PRINT " FAVOR REPETIR";   '@14021 DS:1fe0
CALL MIXT_07f1_LimpaTeclado   '@1402f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@14039
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
LOCATE 22, 1   '@14055
PRINT RT_TAB$(30); ""; ""   '@14070 DS:1644
PRINT RT_TAB$(30); ""; ""   '@14090 DS:1644
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_13af0   '@140b0
L_140bd:
RETURN   '@140bd
L_140cc:   ' sub-rotina (alvo de GOSUB); entrada vinda de 017beb_FUN_1000_7beb
V_147e$ = " "   '@140d1 DS:1acc
FOR V_0e98! = 0.0 TO 5.0   '@140e3 DS:1640,173a,1768
FOR V_0ea4! = 0.0 TO 12.0   '@140f0 DS:1640,1768,176c
IF NOT (ST_0f5e!(RT_CINT%(FX##(V_0e98!))) = ST_0ece!(RT_CINT%(FX##(V_0ea4!)))) THEN GOTO L_14141   '@140fe
GOTO L_1416a   '@14139
L_14141:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea4!   '@14141 DS:1640,176c
L_1416a:
IF NOT (V_0ea4! >= 13.0) THEN GOTO L_1419f   '@1416a DS:1ff2
V_147e$ = "*"   '@14185 DS:1c18
GOTO L_141cb   '@14197
L_1419f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@1419f DS:1640,173a
L_141cb:
RETURN   '@141cb
L_141da:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011801_FUN_1000_1801, 017beb_FUN_1000_7beb
ST_11e2!(RT_CINT%(FX##(V_0e9c!))) = V_0e84!   '@141df
ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 22) = V_0e88!   '@14200
ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 44) = V_0e8c!   '@14224
ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 66) = V_0e90!   '@14248
ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 88) = V_0e94!   '@1426c
ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 110) = V_0ec0!   '@14290
ST_0f7a!(RT_CINT%(FX##(V_0e9c!))) = ST_0f5e!(0)   '@142b4
ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 22) = ST_0f5e!(1)   '@142d5
ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 44) = ST_0f5e!(2)   '@142f9
ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 66) = ST_0f5e!(3)   '@1431d
ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 88) = ST_0f5e!(4)   '@14341
ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 110) = ST_0f5e!(5)   '@14365
RETURN   '@14389
L_14398:   ' sub-rotina (alvo de GOSUB); entrada vinda de 014b58_F_14b58, 017beb_FUN_1000_7beb
V_0e84! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)))   '@1439d
V_0e88! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 22)   '@143be
V_0e8c! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 44)   '@143e2
V_0e90! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 66)   '@14406
V_0e94! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 88)   '@1442a
V_0ec0! = ST_11e2!(RT_CINT%(FX##(V_0e9c!)) + 110)   '@1444e
ST_0f5e!(0) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)))   '@14472
ST_0f5e!(1) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 22)   '@14493
ST_0f5e!(2) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 44)   '@144b7
ST_0f5e!(3) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 66)   '@144db
ST_0f5e!(4) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 88)   '@144ff
ST_0f5e!(5) = ST_0f7a!(RT_CINT%(FX##(V_0e9c!)) + 110)   '@14523
V_0e6c! = V_0e74!   '@14547
V_0e70! = V_0e78!   '@14558
V_0eb4! = 0.0   '@14569 DS:1768
RETURN   '@1457a
L_14589:   ' entrada vinda de 011801_FUN_1000_1801
IF NOT (V_1492% = 0) THEN GOTO L_145a5   '@1458e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@1459d
L_145a5:
RT_VIEWPRINT 1, 25   '@145a5
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@145b7
RT_CLS 2   '@145e3
PRINT RT_STRINGC$((80), (205))   '@145f1
PRINT " Processamento de Secoes Arquivadas"   '@14609 DS:1ff6
PRINT " posicionadas"; V_1492%; " Secoes "   '@14617 DS:201e,2030
PRINT RT_STRINGC$((80), (205))   '@14637
L_1464f:   ' entrada vinda de 0147d0_F_147d0
RT_VIEWPRINT 6, 25   '@14654
RT_CLS 2   '@14666
COLOR 7   '@14674
RT_LINEINPUT " Calcular posicoes I/J/N a M/.../K *RETORNO* ", V_14c0$   '@1468a DS:203c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_14c0$) = 0) THEN GOTO L_146c1   '@146a4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@146b9
L_146c1:
V_14c0$ = UCASE$(V_14c0$)   '@146c1
V_0ea0! = 1.0   '@146d9 DS:1640
IF NOT (RT_MID2$((V_14c0$), (LEN(V_14c0$))) <> "/") THEN GOTO L_1472e   '@146ea DS:1f6a
V_14c0$ = V_14c0$ + "/"   '@14712 DS:1f6a
L_1472e:
V_14c4! = LEN(V_14c0$)   '@1472e
FOR V_0e9c! = 2.0 TO V_14c4!   '@14749 DS:1640,1e50
IF NOT (RT_MID$((V_14c0$), (RT_CINT%(FX##(V_0e9c!))), (1)) = "/") THEN GOTO L_1479f   '@14750 DS:1f6a
GOSUB L_147d0   '@1477c
V_0ea0! = FX##(V_0e9c!) + 1.0   '@14789 DS:1640
L_1479f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e9c!   '@1479f DS:1640
GOTO L_1499d   '@147c8
' ---- F_147d0 @0x147d0  (0147d0_F_147d0.lift.txt; evidence_id (assembly): ev_bf3d5c92b0ccb7a45ebac92400118d587729b6a00a84e2cf4c4590a61f9632a7)
L_147d0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 013130_F_13130
V_1482$ = RT_MID$((V_14c0$), (RT_CINT%(FX##(V_0ea0!))), (RT_CINT%(FX##(V_0e9c!) - V_0ea0!)))   '@147d5
L_BP0c% = (VAL(V_1482$) < 1.0#)   '@14808 DS:206e
IF NOT ((VAL(V_1482$) > V_1492% OR L_BP0c%) <> 0) THEN GOTO L_1487b   '@1483e
V_14c0$ = "*"   '@1485f DS:1c18
RETURN   '@14871
L_1487b:
IF NOT (RT_INSTR%((1), (V_1482$), ("A")) = 0) THEN GOTO L_148a2   '@1487b DS:1654
RETURN   '@14898
L_148a2:
L_BP0c% = (VAL(RT_MID2$((V_1482$), (RT_INSTR%((1), (V_1482$), ("A")) + 1))) < 1.0#)   '@148a2 DS:1654,206e
L_BP0e% = VAL(RT_MID2$((V_1482$), (RT_INSTR%((1), (V_1482$), ("A")) + 1))) > V_1492% OR L_BP0c%   '@14901 DS:1654
IF NOT ((VAL(RT_MID2$((V_1482$), (RT_INSTR%((1), (V_1482$), ("A")) + 1))) < VAL(V_1482$) OR L_BP0e%) <> 0) THEN GOTO L_14993   '@14935 DS:1654
V_14c0$ = "*"   '@14981 DS:1c18
L_14993:
RETURN   '@14993
L_1499d:   ' entrada vinda de 013130_F_13130
IF NOT (V_14c0$ = "*") THEN GOTO L_149cb   '@149a2 DS:1c18
BEEP   '@149b9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1464f   '@149c3
L_149cb:
LOCATE 8, 1   '@149cb
CALL MIXT_07f1_LimpaTeclado   '@149e6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Imprimo os resultados S/*N* ", V_147e$   '@149f0 DS:2076
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e7c! = 0.0   '@14a0a DS:1768
IF NOT (UCASE$(V_147e$) = "S") THEN GOTO L_14a49   '@14a1b DS:2098
V_0e7c! = 1.0   '@14a38 DS:1640
L_14a49:
CALL MIXT_07f1_LimpaTeclado   '@14a49
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Dados Corretos N/*S* ", V_147e$   '@14a53 DS:209e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_147e$) = "N") THEN GOTO L_14a92   '@14a6d DS:1d5e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@14a8a
L_14a92:
RT_VIEWPRINT 1, 25   '@14a92
V_14c8! = 1.0   '@14aa4 DS:1640
V_14cc! = LEN(V_14c0$)   '@14ab5
FOR V_14d0! = 2.0 TO V_14cc!   '@14ad0 DS:1640,1e50
IF NOT (RT_MID$((V_14c0$), (RT_CINT%(FX##(V_14d0!))), (1)) = "/") THEN GOTO L_14b27   '@14ad8 DS:1f6a
GOSUB L_14b58   '@14b04
V_14c8! = FX##(V_14d0!) + 1.0   '@14b11 DS:1640
L_14b27:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_14d0!   '@14b27 DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@14b50
' ---- F_14b58 @0x14b58  (014b58_F_14b58.lift.txt; evidence_id (assembly): ev_9a3938933ce9ab740c4c29b780b5606ca3a2a0db613043f47e0c1ed7049ff996)
L_14b58:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0147d0_F_147d0
V_1482$ = RT_MID$((V_14c0$), (RT_CINT%(FX##(V_14c8!))), (RT_CINT%(FX##(V_14d0!) - V_14c8!)))   '@14b5d
V_148a! = VAL(V_1482$)   '@14b90
V_148e! = V_148a!   '@14baa
IF NOT (RT_INSTR%((1), (V_1482$), ("A")) > 0) THEN GOTO L_14c08   '@14bbb DS:1654
V_148e! = VAL(RT_MID2$((V_1482$), (INSTR(V_1482$, "A") + 1)))   '@14bd8 DS:1654
L_14c08:
V_14d4! = V_148e!   '@14c08
FOR V_0e9c! = V_148a! TO V_14d4!   '@14c1a DS:1640
GOSUB L_14398   '@14c22
GOSUB L_14c81   '@14c2f
GOSUB L_16852   '@14c3c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e9c!   '@14c49 DS:1640
RETURN   '@14c72
L_14c81:   ' sub-rotina (alvo de GOSUB)
IF NOT (V_0e7c! = 1.0) THEN GOTO L_14cef   '@14c86 DS:1640
RT_LPTABRE: RT_LPS CHR$(12)   '@14ca1
RT_LPTABRE: RT_LPS V_0e04$   '@14cbf
RT_LPTABRE: RT_LPS V_14a0$: RT_LPFIM   '@14cd7
L_14cef:
COLOR 7   '@14cef
RT_CLS 2   '@14d05
V_147e$ = "#################"   '@14d13 DS:20b8
PRINT RT_TAB$(12); ""; V_147e$   '@14d25 DS:1644
IF NOT (V_0ec0! <= 4.0) THEN GOTO L_14d9f   '@14d45 DS:1c3a
PRINT RT_SPC$(15); ""; V_0e84!; "/"; V_0e88!   '@14d60 DS:1644,1f6a
L_14d9f:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_14e27   '@14d9f DS:173a
PRINT RT_SPC$(13); ""; LTRIM$(STR$(V_0e84!)); "-"; LTRIM$(STR$(V_0e90!)); " /"; V_0e88!   '@14dba DS:1644,20ce,20d4
L_14e27:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_14e74   '@14e27 DS:179c
PRINT RT_SPC$(15); ""; "Diam."; V_0e84!   '@14e42 DS:1644,20da
L_14e74:
PRINT RT_TAB$(12); ""; V_147e$   '@14e74 DS:1644
PRINT RT_STRINGC$((40), (46))   '@14e94
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15083   '@14eac DS:1640
RT_LPTABRE: RT_LPTAB 32: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@14ec7 DS:1644
IF NOT (V_0ec0! <= 4.0) THEN GOTO L_14f4b   '@14eec DS:1c3a
RT_LPTABRE: RT_LPSPC 35: RT_LPS "": RT_LPS STR$(V_0e84!) + " ": RT_LPS "/": RT_LPS STR$(V_0e88!) + " ": RT_LPFIM   '@14f07 DS:1644,1f6a
L_14f4b:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_14fd8   '@14f4b DS:173a
RT_LPTABRE: RT_LPSPC 33: RT_LPS "": RT_LPS LTRIM$(STR$(V_0e84!)): RT_LPS "-": RT_LPS LTRIM$(STR$(V_0e90!)): RT_LPS " /": RT_LPS STR$(V_0e88!) + " ": RT_LPFIM   '@14f66 DS:1644,20ce,20d4
L_14fd8:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_1502a   '@14fd8 DS:179c
RT_LPTABRE: RT_LPSPC 35: RT_LPS "": RT_LPS "Diam.": RT_LPS STR$(V_0e84!) + " ": RT_LPFIM   '@14ff3 DS:1644,20da
L_1502a:
RT_LPTABRE: RT_LPTAB 32: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@1502a DS:1644
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS RT_STRINGC$((40), (46)): RT_LPFIM   '@1504f DS:1644
L_15083:
COLOR 14   '@15083
IF NOT (V_0ec0! <= 4.0) THEN GOTO L_15316   '@15099 DS:1c3a
V_147e$ = "Secao Retangular - Te"   '@150b4 DS:1c46
IF NOT (V_0ec0! = 3.0) THEN GOTO L_150f3   '@150c6 DS:1c42
V_147e$ = "Secao Triangular"   '@150e1 DS:1c60
L_150f3:
IF NOT (V_0ec0! = 4.0) THEN GOTO L_15120   '@150f3 DS:1c3a
V_147e$ = "Secao Triangular Invertida"   '@1510e DS:1c74
L_15120:
PRINT V_147e$   '@15120
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1516e   '@1512e DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@15149 DS:1644
L_1516e:
V_147e$ = "B=###.# cm    H=####.# cm    d=####.# cm"   '@1516e DS:20e4
PRINT USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e88!, V_147e$, 2); RT_PU#(V_0e8c!, V_147e$, 3)   '@15180
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1522b   '@151b5 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@151d0 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e88!, V_147e$, 2); RT_PU#(V_0e8c!, V_147e$, 3): RT_LPTQUEBRA 0   '@151f1
L_1522b:
IF NOT (V_0e94! > 0.0 AND V_0e90! > 0.0) THEN GOTO L_15311   '@1522b DS:1768
V_147e$ = "Bf=###.# cm   Hf=####.# cm"   '@15269 DS:2110
PRINT USING V_147e$; RT_PU#(V_0e90!, V_147e$, 1); RT_PU#(V_0e94!, V_147e$, 2)   '@1527b
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1530c   '@152a3 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@152be DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e90!, V_147e$, 1); RT_PU#(V_0e94!, V_147e$, 2): RT_LPTQUEBRA 0   '@152df
L_1530c:
L_15311:
L_15316:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_154ca   '@15316 DS:173a
PRINT "Secao Trapezoidal"   '@15331 DS:1c92
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1537f   '@1533f DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS "Secao Trapezoidal": RT_LPFIM   '@1535a DS:1644,1c92
L_1537f:
V_147e$ = "Binf=###.# cm  H=####.# cm  d=####.# cm"   '@1537f DS:212e
PRINT USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e88!, V_147e$, 2); RT_PU#(V_0e8c!, V_147e$, 3)   '@15391
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1543c   '@153c6 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@153e1 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e88!, V_147e$, 2); RT_PU#(V_0e8c!, V_147e$, 3): RT_LPTQUEBRA 0   '@15402
L_1543c:
V_147e$ = "Bsup=###.# cm  "   '@1543c DS:215a
PRINT USING V_147e$; RT_PU#(V_0e90!, V_147e$, 1)   '@1544e
IF NOT (V_0e7c! = 1.0) THEN GOTO L_154c5   '@15469 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@15484 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e90!, V_147e$, 1): RT_LPTQUEBRA 0   '@154a5
L_154c5:
L_154ca:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_155db   '@154ca DS:179c
PRINT "Secao Circular"   '@154e5 DS:1cde
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15533   '@154f3 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS "Secao Circular": RT_LPFIM   '@1550e DS:1644,1cde
L_15533:
V_147e$ = "Diametro=####.# cm           d=####.# cm"   '@15533 DS:216e
PRINT USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e8c!, V_147e$, 2)   '@15545
IF NOT (V_0e7c! = 1.0) THEN GOTO L_155d6   '@1556d DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@15588 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e84!, V_147e$, 1); RT_PU#(V_0e8c!, V_147e$, 2): RT_LPTQUEBRA 0   '@155a9
L_155d6:
L_155db:
V_147e$ = "Fck=#.### \   \"   '@155db DS:219a
IF NOT (V_0e6c! >= 10.0) THEN GOTO L_1561a   '@155ed DS:179c
V_147e$ = "Fck=####.# \   \"   '@15608 DS:21ae
L_1561a:
PRINT USING V_147e$; RT_PU#(V_0e6c!, V_147e$, 1); V_0dcc$   '@1561a
IF NOT (V_0e7c! = 1.0) THEN GOTO L_156a3   '@1563e DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@15659 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e6c!, V_147e$, 1); V_0dcc$: RT_LPTQUEBRA 0   '@1567a
L_156a3:
V_147e$ = "Fyk=#.### \   \ do Tipo \\"   '@156a3 DS:21c2
IF NOT (V_0e70! >= 10.0) THEN GOTO L_156e2   '@156b5 DS:179c
V_147e$ = "Fyk=####.# \   \ do Tipo \\"   '@156d0 DS:21e0
L_156e2:
PRINT USING V_147e$; RT_PU#(V_0e70!, V_147e$, 1); V_0dcc$; V_0e80$   '@156e2
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1577d   '@1570f DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@1572a DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e70!, V_147e$, 1); V_0dcc$; V_0e80$: RT_LPTQUEBRA 0   '@1574b
L_1577d:
PRINT RT_STRINGC$((40), (46))   '@1577d
IF NOT (V_0e7c! = 1.0) THEN GOTO L_157df   '@15795 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS RT_STRINGC$((40), (46)): RT_LPFIM   '@157b0 DS:1644
L_157df:
COLOR RT_CINT%(FX##(V_0dc0!))   '@157df
CALL S_2413f   '@157fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@15806
PRINT RT_STRINGC$((40), (46))   '@1581c
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1587e   '@15834 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS RT_STRINGC$((40), (46)): RT_LPFIM   '@1584f DS:1644
L_1587e:
V_147e$ = " momentos(Mk) em " + V_0dd0$ + V_0dd4$   '@1587e DS:2200
LOCATE 1, 50   '@158a4
PRINT V_147e$   '@158bc
IF NOT (V_0e7c! = 1.0) THEN GOTO L_1592f   '@158ca DS:1640
RT_LPTABRE: RT_LPTAB 21: RT_LPS "": RT_LPS V_1638$: RT_LPFIM   '@158e5 DS:1644
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@1590a DS:1644
L_1592f:
V_147e$ = "-------   -------   -------"   '@1592f DS:2216
LOCATE 2, 51   '@15941
PRINT V_147e$   '@1595f
IF NOT (V_0e7c! = 1.0) THEN GOTO L_159ad   '@1596d DS:1640
RT_LPTABRE: RT_LPTAB 31: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@15988 DS:1644
L_159ad:
V_1482$ = "#####.#   #####.#   #####.#"   '@159ad DS:2236
LOCATE 3, 50   '@159bf
PRINT USING V_1482$; RT_PU#(ST_0f5e!(0), V_1482$, 1); RT_PU#(ST_0f5e!(1), V_1482$, 2); RT_PU#(ST_0f5e!(2), V_1482$, 3)   '@159dd
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15a88   '@15a12 DS:1640
RT_LPTABRE: RT_LPTAB 30: RT_LPS ""   '@15a2d DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_1482$; RT_PU#(ST_0f5e!(0), V_1482$, 1); RT_PU#(ST_0f5e!(1), V_1482$, 2); RT_PU#(ST_0f5e!(2), V_1482$, 3): RT_LPTQUEBRA 0   '@15a4e
L_15a88:
LOCATE 4, 51   '@15a88
PRINT V_147e$   '@15aa6
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15af4   '@15ab4 DS:1640
RT_LPTABRE: RT_LPTAB 31: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@15acf DS:1644
L_15af4:
GOSUB L_15f8c   '@15af4
COLOR 7   '@15b01
V_147e$ = "    dc+##fi  ####      ####      ####"   '@15b17 DS:2256
LOCATE 22, 40   '@15b29
PRINT USING V_147e$; RT_PU#(10, V_147e$, 1); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(0))), V_147e$, 2); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(1))), V_147e$, 3); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(2))), V_147e$, 4)   '@15b47 DS:2280
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15c99   '@15bcd DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@15be8 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(10, V_147e$, 1); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(0))), V_147e$, 2); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(1))), V_147e$, 3); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + ST_0f5e!(2))), V_147e$, 4): RT_LPTQUEBRA 0   '@15c09 DS:2280
L_15c99:
LOCATE 23, 40   '@15c99
PRINT USING V_147e$; RT_PU#(50, V_147e$, 1); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(0)))), V_147e$, 2); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(1)))), V_147e$, 3); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(2)))), V_147e$, 4)   '@15cb7 DS:173a,2280
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15e39   '@15d55 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS ""   '@15d70 DS:1644
RT_LPTABRE: PRINT #RT_LPT, USING V_147e$; RT_PU#(50, V_147e$, 1); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(0)))), V_147e$, 2); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(1)))), V_147e$, 3); RT_PU#(RT_SNG!(INT(0.75 * FX##(V_0e8c!) + 5.0 * FX##(ST_0f5e!(2)))), V_147e$, 4): RT_LPTQUEBRA 0   '@15d91 DS:173a,2280
L_15e39:
IF NOT (V_0ec0! <= 4.0 AND V_0e88! >= 60.0) THEN GOTO L_15f37   '@15e39 DS:1748,1c3a
LOCATE 24, 43   '@15e77
PRINT USING " As(pele)=####.# cm2 por face"; RT_PU#(RT_SNG!(0.0005000000237487256526947021484375## * V_0e84! * V_0e88!), " As(pele)=####.# cm2 por face", 1)   '@15e95 DS:2284,22a6
IF NOT (V_0e7c! = 1.0) THEN GOTO L_15f32   '@15ec1 DS:1640
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@15edc DS:1644
RT_LPTABRE: RT_LPTAB 25: RT_LPS "": PRINT #RT_LPT, USING " As(pele)=####.# cm2 por face"; RT_PU#(RT_SNG!(0.0005000000237487256526947021484375## * V_0e84! * V_0e88!), " As(pele)=####.# cm2 por face", 1): RT_LPTQUEBRA 0   '@15eef DS:1644,2284,22a6
L_15f32:
L_15f37:
IF NOT (V_0e7c! = 0.0) THEN GOTO L_15f7d   '@15f37 DS:1768
CALL MIXT_07f1_LimpaTeclado   '@15f52
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@15f5c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
L_15f7d:
RETURN   '@15f7d
L_15f8c:   ' sub-rotina (alvo de GOSUB)
FOR V_0e98! = 0.0 TO 2.0   '@15f91 DS:1640,1768,1e50
FOR V_0ea4! = 0.0 TO 12.0   '@15f9e DS:1640,1768,176c
IF NOT (ST_0f5e!(RT_CINT%(FX##(V_0e98!))) = ST_0ece!(RT_CINT%(FX##(V_0ea4!)))) THEN GOTO L_15fef   '@15fac
GOTO L_16018   '@15fe7
L_15fef:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea4!   '@15fef DS:1640,176c
L_16018:
ST_0f3e!(RT_CINT%(FX##(V_0e98!))) = ST_0f06!(RT_CINT%(FX##(V_0ea4!)))   '@16018
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@16049 DS:1640,1e50
V_14d8! = 20.0   '@16075 DS:170c
V_14dc! = 4.0   '@16087 DS:1c3a
CALL MIXT_082a_Maior(V_0e44!, V_0e38!, V_14e0!)   '@16092
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_14e4! = FX##(V_14e0!) / ST_0f3e!(2)   '@160a4
CALL MIXT_082a_Maior(V_14dc!, V_14e4!, V_14e8!)   '@160b4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0877_Menor(V_14d8!, V_14e8!, V_14ec!)   '@160c5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_14f0! = RT_CINT%(FX##(V_14ec!))   '@160d7
FOR V_0e98! = 2.0 TO V_14f0!   '@160ed DS:1640,1e50
FOR V_0eb8! = 1.0 TO 2.0   '@160f4 DS:1640,1e50
IF NOT (V_0ec0! <= 2.0 AND V_0eb8! = 1.0) THEN GOTO L_16191   '@16102 DS:1640,1e50
V_1466! = V_0e90!   '@16140
V_146a! = V_0e94!   '@16151
V_0e90! = 0.0   '@16162 DS:1768
V_0e94! = 0.0   '@16173 DS:1768
GOTO L_16277   '@16184
L_16191:
IF NOT (V_0ec0! <= 2.0 AND V_0eb8! = 2.0) THEN GOTO L_161f6   '@16191 DS:1e50
V_0e90! = V_1466!   '@161cf
V_0e94! = V_146a!   '@161e0
L_161f6:
IF NOT ((V_0ec0! > 2.0 OR (V_0e94! = 0.0 OR V_0e90! = 0.0)) AND V_0eb8! = 2.0) THEN GOTO L_16272   '@161f6 DS:1768,1e50
GOTO L_167aa   '@1626a
L_16272:
L_16277:
FOR V_0ea4! = 0.0 TO 2.0   '@1627c DS:1640,1768,1e50
V_0eb0! = FX##(ST_0f3e!(RT_CINT%(FX##(V_0ea4!)))) * V_0e98!   '@1628a
CALL S_19857   '@162b0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
ST_0f4e!(RT_CINT%(FX##(V_0ea4!))) = V_0eac!   '@162ba
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "  "   '@162db DS:22aa
IF NOT (V_0eb0! > V_0e34! AND V_0eb8! = 1.0) THEN GOTO L_1635b   '@162fc DS:1640
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "# "   '@1633a DS:22b0
L_1635b:
IF NOT (V_0eb0! > V_0e40! AND V_0eb8! = 2.0) THEN GOTO L_163ba   '@1635b DS:1e50
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "# "   '@16399 DS:22b0
L_163ba:
IF NOT (V_0eb0! < V_0e5c!) THEN GOTO L_163f6   '@163ba
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "@ "   '@163d5 DS:22b6
L_163f6:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea4!   '@163f6 DS:1640,1e50
V_147e$ = "##  #####.##\\#####.##\\#####.##\\"   '@16422 DS:22bc
IF NOT (CSRLIN > 20) THEN GOTO L_16464   '@16434
LOCATE 5, 45   '@16446
L_16464:
LOCATE , 45   '@16464
COLOR RT_CINT%(FX##(V_0dc0!))   '@1647d
IF NOT (V_0eb8! = 1.0) THEN GOTO L_16536   '@1649a DS:1640
PRINT USING V_147e$; RT_PU#(V_0e98!, V_147e$, 1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(0)) / 100.0), V_147e$, 2); ST_144a$(0); RT_PU#(RT_SNG!(FX##(ST_0f4e!(1)) / 100.0), V_147e$, 3); ST_144a$(1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(2)) / 100.0), V_147e$, 4); ST_144a$(2)   '@164b5 DS:22e2
L_16536:
IF NOT (V_0e7c! = 1.0 AND V_0eb8! = 1.0) THEN GOTO L_1660c   '@16536 DS:1640
RT_LPTABRE: RT_LPTAB 25: RT_LPS "": PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e98!, V_147e$, 1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(0)) / 100.0), V_147e$, 2); ST_144a$(0); RT_PU#(RT_SNG!(FX##(ST_0f4e!(1)) / 100.0), V_147e$, 3); ST_144a$(1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(2)) / 100.0), V_147e$, 4); ST_144a$(2): RT_LPTQUEBRA 0   '@16574 DS:1644,22e2
L_1660c:
V_147e$ = "    #####.##\\#####.##\\#####.##\\"   '@1660c DS:22e6
LOCATE , 45   '@1661e
COLOR 14   '@16637
IF NOT (V_0eb8! = 2.0) THEN GOTO L_166dc   '@1664d DS:1e50
PRINT USING V_147e$; RT_PU#(RT_SNG!(FX##(ST_0f4e!(0)) / 100.0), V_147e$, 1); ST_144a$(0); RT_PU#(RT_SNG!(FX##(ST_0f4e!(1)) / 100.0), V_147e$, 2); ST_144a$(1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(2)) / 100.0), V_147e$, 3); ST_144a$(2)   '@16668 DS:22e2
L_166dc:
IF NOT (V_0e7c! = 1.0 AND V_0eb8! = 2.0) THEN GOTO L_167a5   '@166dc DS:1640,1e50
RT_LPTABRE: RT_LPTAB 25: RT_LPS "": PRINT #RT_LPT, USING V_147e$; RT_PU#(RT_SNG!(FX##(ST_0f4e!(0)) / 100.0), V_147e$, 1); ST_144a$(0); RT_PU#(RT_SNG!(FX##(ST_0f4e!(1)) / 100.0), V_147e$, 2); ST_144a$(1); RT_PU#(RT_SNG!(FX##(ST_0f4e!(2)) / 100.0), V_147e$, 3); ST_144a$(2): RT_LPTQUEBRA 0   '@1671a DS:1644,22e2
L_167a5:
L_167aa:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0eb8!   '@167af DS:1640,1e50
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16809   '@167db DS:1640
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@167f6 DS:1644
L_16809:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@16809 DS:1640
PRINT ""   '@16835 DS:1644
RETURN   '@16843
L_16852:   ' sub-rotina (alvo de GOSUB)
LOCATE 18, 1   '@16857
IF NOT (FX##(V_0e90!) * V_0e94! = FX##(0.0)) THEN GOTO L_168ad   '@16872 DS:1768
LOCATE 15, 1   '@16892
L_168ad:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_168e3   '@168ad DS:173a
LOCATE 16, 1   '@168c8
L_168e3:
COLOR RT_CINT%(FX##(V_0dc0!))   '@168e3
CALL S_23d85   '@16900
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@1690a
PRINT RT_STRINGC$((40), (46))   '@16920
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16982   '@16938 DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS RT_STRINGC$((40), (46)): RT_LPFIM   '@16953 DS:1644
L_16982:
V_147e$ = " cortantes(Vk) em " + V_0dd0$ + "   "   '@16982 DS:230c,2322
LOCATE 1, 50   '@169a8
PRINT V_147e$   '@169c0
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16a0e   '@169ce DS:1640
RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@169e9 DS:1644
L_16a0e:
IF NOT (V_0ec0! <= 2.0) THEN GOTO L_16aba   '@16a0e DS:1e50
V_14f4! = 2.0   '@16a29 DS:1e50
IF NOT (V_0e84! < V_0e10! AND V_0e84! >= V_0e0c!) THEN GOTO L_16a89   '@16a3a
V_14f4! = 4.0   '@16a78 DS:1c3a
L_16a89:
IF NOT (V_0e84! >= V_0e10!) THEN GOTO L_16ab5   '@16a89
V_14f4! = 6.0   '@16aa4 DS:232a
L_16ab5:
L_16aba:
IF NOT (V_0ec0! = 4.0 OR V_0ec0! = 3.0) THEN GOTO L_16b0e   '@16aba DS:1c3a,1c42
V_14f4! = 2.0   '@16af8 DS:1e50
L_16b0e:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_16bdc   '@16b0e DS:173a
CALL MIXT_082a_Maior(V_0e84!, V_0e90!, V_14f8!)   '@16b29
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_082a_Maior(V_0e84!, V_0e90!, V_14fc!)   '@16b3f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_14fc! < V_0e10! AND V_14f8! >= V_0e0c!) THEN GOTO L_16b9a   '@16b51
V_14f4! = 4.0   '@16b89 DS:1c3a
L_16b9a:
CALL MIXT_082a_Maior(V_0e84!, V_0e90!, V_1500!)   '@16b9a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_1500! >= V_0e10!) THEN GOTO L_16bd7   '@16bb1
V_14f4! = 6.0   '@16bc6 DS:232a
L_16bd7:
L_16bdc:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_16c88   '@16bdc DS:179c
V_14f4! = 2.0   '@16bf7 DS:1e50
IF NOT (V_0e84! < V_0e10! AND V_0e84! >= V_0e0c!) THEN GOTO L_16c57   '@16c08
V_14f4! = 4.0   '@16c46 DS:1c3a
L_16c57:
IF NOT (V_0e84! >= V_0e10!) THEN GOTO L_16c83   '@16c57
V_14f4! = 6.0   '@16c72 DS:232a
L_16c83:
L_16c88:
V_147e$ = "-------   -------   -------"   '@16c88 DS:2216
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16cda   '@16c9a DS:1640
RT_LPTABRE: RT_LPTAB 31: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@16cb5 DS:1644
L_16cda:
V_1482$ = " # Ramos ####.#    ####.#    ####.#"   '@16cda DS:232e
LOCATE 3, 42   '@16cec
PRINT USING V_1482$; RT_PU#(V_14f4!, V_1482$, 1); RT_PU#(ST_0f5e!(3), V_1482$, 2); RT_PU#(ST_0f5e!(4), V_1482$, 3); RT_PU#(ST_0f5e!(5), V_1482$, 4)   '@16d0a
FOR V_0e98! = 5.0 TO 20.0   '@16d4c DS:1640,170c,173a
LOCATE RT_CINT%(FX##(V_0e98!)), 42   '@16d5a
PRINT RT_TAB$(78); ""; ""   '@16d7f DS:1644
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@16d9f DS:1640,170c
LOCATE 5   '@16dc8
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16e52   '@16dde DS:1640
RT_LPTABRE: RT_LPSPC 21: RT_LPS "": PRINT #RT_LPT, USING V_1482$; RT_PU#(V_14f4!, V_1482$, 1); RT_PU#(ST_0f5e!(3), V_1482$, 2); RT_PU#(ST_0f5e!(4), V_1482$, 3); RT_PU#(ST_0f5e!(5), V_1482$, 4): RT_LPTQUEBRA 0   '@16df9 DS:1644
L_16e52:
IF NOT (V_0e7c! = 1.0) THEN GOTO L_16e92   '@16e52 DS:1640
RT_LPTABRE: RT_LPTAB 31: RT_LPS "": RT_LPS V_147e$: RT_LPFIM   '@16e6d DS:1644
L_16e92:
GOSUB L_172ad   '@16e92
IF NOT (V_0e88! > 60.0 OR 5.0 * FX##(V_0e88!) > FX##(V_0e84!)) THEN GOTO L_16efb   '@16e9f DS:173a,1748
V_0e48! = 1.0   '@16ee2 DS:1640
GOTO L_16f47   '@16ef3
L_16efb:
V_0e48! = FX##(V_0e88!) / 50.0 + 0.3333333432674407958984375##   '@16efb DS:2356,235a
IF NOT (V_0e88! <= 15.0) THEN GOTO L_16f42   '@16f16 DS:1710
V_0e48! = 0.5   '@16f31 DS:235e
L_16f42:
L_16f47:
COLOR 7   '@16f4c
LOCATE 21, 44   '@16f62
PRINT USING "Twu= ####.## k/cm2"; RT_PU#(RT_SNG!(250.0 * FX##(V_0e6c!) * V_0dd8! * V_0e48! / V_0e64!), "Twu= ####.## k/cm2", 1)   '@16f80 DS:2362,2378
IF NOT (V_0e7c! = 1.0) THEN GOTO L_17036   '@16fb6 DS:1640
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@16fd1 DS:1644
RT_LPTABRE: RT_LPTAB 25: RT_LPS "": PRINT #RT_LPT, USING " Twu= ####.## K/cm2"; RT_PU#(RT_SNG!(250.0 * FX##(V_0e6c!) * V_0dd8! * V_0e48! / V_0e64!), " Twu= ####.## K/cm2", 1): RT_LPTQUEBRA 0   '@16fe4 DS:1644,2378,237c
L_17036:
IF NOT (FX##(V_0e68!) <> 1.14999997615814208984375## OR (FX##(V_0e64!) <> 1.39999997615814208984375## OR FX##(V_0e60!) <> 1.39999997615814208984375##)) THEN GOTO L_17124   '@17036 DS:171c,1720
LOCATE 21, 1   '@1708f
COLOR 7   '@170aa
PRINT " COEFICIENTES DE SEGURANCA"   '@170c0 DS:2394
PRINT "  Forca "; V_0e60!   '@170ce DS:23b2
PRINT "  Concreto "; V_0e64!   '@170e9 DS:23be
PRINT "  Aco "; V_0e68!   '@17104 DS:23ce
L_17124:
IF NOT (V_0e7c! = 1.0 AND (FX##(V_0e68!) <> 1.14999997615814208984375## OR (FX##(V_0e64!) <> 1.39999997615814208984375## OR FX##(V_0e60!) <> 1.39999997615814208984375##))) THEN GOTO L_17258   '@17124 DS:1640,171c,1720
RT_LPTABRE: RT_LPTAB 25: RT_LPS "": RT_LPS "COEFICIENTES DE SEGURANCA": RT_LPFIM   '@17198 DS:1644,23d8
RT_LPTABRE: RT_LPTAB 26: RT_LPS "": RT_LPS "Forca ": RT_LPS STR$(V_0e60!) + " ": RT_LPFIM   '@171bd DS:1644,23f6
RT_LPTABRE: RT_LPTAB 26: RT_LPS "": RT_LPS "Concreto ": RT_LPS STR$(V_0e64!) + " ": RT_LPFIM   '@171ef DS:1644,2400
RT_LPTABRE: RT_LPTAB 26: RT_LPS "": RT_LPS "Aco ": RT_LPS STR$(V_0e68!) + " ": RT_LPFIM   '@17221 DS:1644,240e
L_17258:
IF NOT (V_0e7c! = 0.0) THEN GOTO L_1729e   '@17258 DS:1768
CALL MIXT_07f1_LimpaTeclado   '@17273
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@1727d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
L_1729e:
RETURN   '@1729e
L_172ad:   ' sub-rotina (alvo de GOSUB)
FOR V_0e98! = 3.0 TO 5.0   '@172b2 DS:1640,173a,1c42
FOR V_0ea4! = 0.0 TO 12.0   '@172c0 DS:1640,1768,176c
IF NOT (ST_0f5e!(RT_CINT%(FX##(V_0e98!))) = ST_0ece!(RT_CINT%(FX##(V_0ea4!)))) THEN GOTO L_17311   '@172ce
GOTO L_1733a   '@17309
L_17311:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea4!   '@17311 DS:1640,176c
L_1733a:
ST_0f3e!(RT_CINT%(FX##(V_0e98!) - 3.0)) = ST_0f06!(RT_CINT%(FX##(V_0ea4!)))   '@1733a DS:2416
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@17370 DS:1640,173a
V_1504! = FX##(V_0e88!) / 2.0   '@1739c DS:1e50
V_1508! = 30.0   '@173b3 DS:241a
CALL MIXT_0877_Menor(V_1504!, V_1508!, V_150c!)   '@173be
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_1510! = V_150c!   '@173d0
FOR V_0e98! = 7.5 TO V_1510! STEP 2.5   '@173dc DS:241e,2448
FOR V_0ea4! = 0.0 TO 2.0   '@173e4 DS:1640,1768,1e50
V_0eb0! = FX##(ST_0f3e!(RT_CINT%(FX##(V_0ea4!)))) * 100.0 * V_14f4! / V_0e98!   '@173f2 DS:22e2
CALL S_1ace8   '@17422
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
ST_0f4e!(RT_CINT%(FX##(V_0ea4!))) = V_0e48!   '@1742c
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "  "   '@1744d DS:22aa
IF NOT (V_0e48! > V_0e50!) THEN GOTO L_174aa   '@1746e
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "# "   '@17489 DS:22b0
L_174aa:
IF NOT (V_0e48! < V_0e4c!) THEN GOTO L_174e6   '@174aa
ST_144a$(RT_CINT%(FX##(V_0ea4!))) = "@ "   '@174c5 DS:22b6
L_174e6:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea4!   '@174e6 DS:1640,1e50
COLOR RT_CINT%(FX##(V_0dc0!))   '@17512
V_147e$ = "##.# ####.##\\ ####.##\\ ####.##\\"   '@1752f DS:2422
LOCATE , 45   '@17541
PRINT USING V_147e$; RT_PU#(V_0e98!, V_147e$, 1); RT_PU#(ST_0f4e!(0), V_147e$, 2); ST_144a$(0); RT_PU#(ST_0f4e!(1), V_147e$, 3); ST_144a$(1); RT_PU#(ST_0f4e!(2), V_147e$, 4); ST_144a$(2)   '@1755a
IF NOT (V_0e7c! = 1.0) THEN GOTO L_17646   '@175b7 DS:1640
RT_LPTABRE: RT_LPSPC 24: RT_LPS "": PRINT #RT_LPT, USING V_147e$; RT_PU#(V_0e98!, V_147e$, 1); RT_PU#(ST_0f4e!(0), V_147e$, 2); ST_144a$(0); RT_PU#(ST_0f4e!(1), V_147e$, 3); ST_144a$(1); RT_PU#(ST_0f4e!(2), V_147e$, 4); ST_144a$(2): RT_LPTQUEBRA 0   '@175d2 DS:1644
L_17646:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0e98!   '@17646 DS:2448
RETURN   '@17672
L_17681:   ' entrada vinda de 011801_FUN_1000_1801
RT_VIEWPRINT 1, 25   '@17686
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@17698
RT_CLS 2   '@176c4
PRINT RT_STRINGC$((80), (205))   '@176d2
PRINT " Processamento de uma Secao"   '@176ea DS:244c
PRINT RT_STRINGC$((80), (205))   '@176f8
COLOR 7   '@17710
L_1772b:
COLOR 7   '@17730
LOCATE 5, 1   '@17746
PRINT " Concreto Fck *";   '@17761 DS:1ab2
COLOR RT_CINT%(FX##(V_0dc0!))   '@1776f
PRINT LTRIM$(STR$(V_0e6c!));   '@1778c
COLOR 7   '@177aa
PRINT "* "; V_0dcc$;   '@177c0 DS:1ac6
CALL MIXT_07f1_LimpaTeclado   '@177d7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@177e1 DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_17865   '@177fb
IF NOT (VAL(V_147e$) <= 0.0#) THEN GOTO L_17846   '@17810 DS:1ad2
BEEP   '@17834
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1772b   '@1783e
L_17846:
V_0e6c! = VAL(V_147e$)   '@17846
L_17865:
L_1786a:
LOCATE 5, 45   '@1786f
PRINT " Aco Fyk *";   '@1788d DS:246c
COLOR RT_CINT%(FX##(V_0dc0!))   '@1789b
PRINT LTRIM$(STR$(V_0e70!));   '@178b8
COLOR 7   '@178d6
PRINT "* "; V_0dcc$;   '@178ec DS:1ac6
CALL MIXT_07f1_LimpaTeclado   '@17903
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_147e$   '@1790d DS:1acc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) <> 0) THEN GOTO L_17991   '@17927
IF NOT (VAL(V_147e$) <= 0.0#) THEN GOTO L_17972   '@1793c DS:1ad2
BEEP   '@17960
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_1786a   '@1796a
L_17972:
V_0e70! = VAL(V_147e$)   '@17972
L_17991:
L_17996:
LOCATE 6, 45   '@1799b
PRINT " Tipo de Aco  A/B *";   '@179b9 DS:1b88
COLOR RT_CINT%(FX##(V_0dc0!))   '@179c7
PRINT V_0e80$;   '@179e4
COLOR 7   '@179f2
CALL MIXT_07f1_LimpaTeclado   '@17a08
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_147e$   '@17a12 DS:1ac6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) > 0) THEN GOTO L_17ab6   '@17a2c
L_BP0c% = (UCASE$(V_147e$) <> "A")   '@17a41 DS:1654
IF NOT ((UCASE$(V_147e$) <> "B" AND L_BP0c%) <> 0) THEN GOTO L_17a99   '@17a68 DS:165a
BEEP   '@17a87
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_17996   '@17a91
L_17a99:
V_0e80$ = UCASE$(V_147e$)   '@17a99
L_17ab6:
GOSUB L_13135   '@17ab6
IF NOT (V_147e$ = "FIM") THEN GOTO L_17ae2   '@17ac3 DS:1c32
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@17ada
L_17ae2:
COLOR 7   '@17ae2
PRINT ""   '@17af8 DS:1644
CALL MIXT_07f1_LimpaTeclado   '@17b06
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Imprimo os resultados S/*N* ", V_147e$   '@17b10 DS:2076
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_0e7c! = 0.0   '@17b2a DS:1768
IF NOT (UCASE$(V_147e$) = "S") THEN GOTO L_17b69   '@17b3b DS:2098
V_0e7c! = 1.0   '@17b58 DS:1640
L_17b69:
CALL MIXT_07f1_LimpaTeclado   '@17b69
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Dados Corretos N/*S* ", V_147e$   '@17b73 DS:209e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_147e$) = "N") THEN GOTO L_17bb2   '@17b8d DS:1d5e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@17baa
L_17bb2:
RT_VIEWPRINT 1, 25   '@17bb2
GOSUB L_14c81   '@17bc4
GOSUB L_16852   '@17bd1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@17bde
' ---- FUN_1000_7beb @0x17beb  (017beb_FUN_1000_7beb.lift.txt; evidence_id (assembly): ev_13137e770be0473a51dc06ca80d36068eb924fc0f062dde5e39cc091567febdc)
L_17beb:   ' entrada vinda de 011801_FUN_1000_1801
IF NOT (V_1492% = 0) THEN GOTO L_17c07   '@17bf0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@17bff
L_17c07:
RT_VIEWPRINT 1, 25   '@17c07
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@17c19
RT_CLS 2   '@17c45
PRINT RT_STRINGC$((80), (205))   '@17c53
PRINT " Correcao de Secoes"   '@17c6b DS:247a
PRINT " posicionada(s)"; V_1492%; "Secao(oes)"   '@17c79 DS:2492,24a6
PRINT RT_STRINGC$((80), (205))   '@17c99
RT_VIEWPRINT 6, 25   '@17cb1
L_17cc8:
COLOR 7   '@17ccd
RT_CLS 2   '@17ce3
CALL MIXT_07f1_LimpaTeclado   '@17cf1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Numero da posicao a ser alterada *FIM* ", V_147e$   '@17cfb DS:24b4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_17d32   '@17d15
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@17d2a
L_17d32:
L_BP0c% = (VAL(V_147e$) < 1.0#)   '@17d32 DS:206e
IF NOT ((VAL(V_147e$) > V_1492% OR L_BP0c%) <> 0) THEN GOTO L_17d91   '@17d68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_17cc8   '@17d89
L_17d91:
V_0e9c! = VAL(V_147e$)   '@17d91
GOSUB L_14398   '@17dab
L_17dbd:
LOCATE 8, 1   '@17dc2
COLOR RT_CINT%(FX##(V_0dc0!))   '@17ddd
PRINT "( Posicao"; V_0e9c!; ")"   '@17dfa DS:1c2c,24e0
COLOR 7   '@17e1e
PRINT ""   '@17e34 DS:1644
V_1514! = V_0ec0!   '@17e42
IF NOT (V_1514! <> 1.0) THEN GOTO L_17e84   '@17e53 DS:1640
IF NOT (V_1514! = 2.0) THEN GOTO L_17e9a   '@17e6f DS:1e50
L_17e84:
PRINT " Secao Retangular - Te"   '@17e84 DS:24ee
GOTO L_17f4a   '@17e92
L_17e9a:
IF NOT (V_1514! = 3.0) THEN GOTO L_17ec6   '@17e9b DS:1c42
PRINT " Secao Triangular"   '@17eb0 DS:2508
GOTO L_17f4a   '@17ebe
L_17ec6:
IF NOT (V_1514! = 4.0) THEN GOTO L_17ef2   '@17ec7 DS:1c3a
PRINT " Secao Triangular Invertida"   '@17edc DS:251e
GOTO L_17f4a   '@17eea
L_17ef2:
IF NOT (V_1514! = 5.0) THEN GOTO L_17f1e   '@17ef3 DS:173a
PRINT " Secao Trapezoidal"   '@17f08 DS:253e
GOTO L_17f4a   '@17f16
L_17f1e:
IF NOT (V_1514! = 10.0) THEN GOTO L_17f4a   '@17f1f DS:179c
PRINT " Secao Circular"   '@17f34 DS:2554
GOTO L_17f4a   '@17f42
L_17f4a:
PRINT ""   '@17f4a DS:1644
IF NOT (V_0ec0! < 5.0) THEN GOTO L_18088   '@17f58 DS:173a
PRINT " (1) B ="; V_0e84!; "cm     "   '@17f73 DS:2568,2574
PRINT " (2) H ="; V_0e88!; "cm     "   '@17f97 DS:2574,2580
PRINT " (3) d ="; V_0e8c!; "cm     "   '@17fbb DS:2574,258c
IF NOT (V_0ec0! <= 2.0) THEN GOTO L_18083   '@17fdf DS:1e50
LOCATE 12, 40   '@17ffa
PRINT " (4) Bf="; V_0e90!; "cm    "   '@18018 DS:2598,25a4
LOCATE 13, 40   '@1803c
PRINT " (5) Hf="; V_0e94!; "cm    "   '@1805a DS:25a4,25ae
L_18083:
L_18088:
IF NOT (V_0ec0! = 5.0) THEN GOTO L_18156   '@18088 DS:173a
PRINT " (1) Binf ="; V_0e84!; "cm     "   '@180a3 DS:2574,25ba
PRINT " (2) H ="; V_0e88!; "cm     "   '@180c7 DS:2574,2580
PRINT " (3) d ="; V_0e8c!; "cm     "   '@180eb DS:2574,258c
LOCATE 12, 40   '@1810f
PRINT " (4) Bsup ="; V_0e90!; "cm    "   '@1812d DS:25a4,25ca
L_18156:
IF NOT (V_0ec0! = 10.0) THEN GOTO L_181cc   '@18156 DS:179c
PRINT " (1) Diametro ="; V_0e84!; "cm     "   '@18171 DS:2574,25da
PRINT ""   '@18195 DS:1644
PRINT " (3) d ="; V_0e8c!; "cm     "   '@181a3 DS:2574,258c
L_181cc:
LOCATE 16, 1   '@181cc
PRINT " Bitolas (mm), para utilizacao no calculo de esforcos de Flexao"   '@181e7 DS:25ee
PRINT " (6)"; ST_0f5e!(0); "    (7)"; ST_0f5e!(1); "    (8)"; ST_0f5e!(2); RT_TAB$(78); ""; ""   '@181f5 DS:1644,2632,263a,2646
PRINT ""   '@18257 DS:1644
PRINT " Bitolas (mm), para utilizacao no calculo de esforcos de Cisalhamento"   '@18265 DS:2652
PRINT " (9)"; ST_0f5e!(3); "    (10)"; ST_0f5e!(4); "    (11)"; ST_0f5e!(5); RT_TAB$(78); ""; ""   '@18273 DS:1644,269c,26a4,26b0
L_182da:
COLOR 7   '@182df
LOCATE 22, 1   '@182f5
PRINT " item , Novo Valor  *NAO* "; RT_TAB$(80); "";   '@18310 DS:1644,26bc
LOCATE 22, 27   '@18330
CALL MIXT_07f1_LimpaTeclado   '@1834e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_147e$, V_1482$)   '@18358
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_18387   '@1836a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_17cc8   '@1837f
L_18387:
IF NOT (VAL(V_1482$) < 0.0#) THEN GOTO L_183bd   '@18387 DS:1ad2
BEEP   '@183ab
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@183b5
L_183bd:
V_1518# = VAL(V_147e$)   '@183bd
IF NOT (V_1518# = 1.0#) THEN GOTO L_18414   '@183d7 DS:206e
V_0e84! = VAL(V_1482$)   '@183f2
GOTO L_18933   '@1840c
L_18414:
IF NOT (V_1518# = 2.0#) THEN GOTO L_18479   '@18415 DS:26da
IF NOT (V_0ec0! = 10.0) THEN GOTO L_18457   '@1842a DS:179c
BEEP   '@18445
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@1844f
L_18457:
V_0e88! = VAL(V_1482$)   '@18457
GOTO L_18933   '@18471
L_18479:
IF NOT (V_1518# = 3.0#) THEN GOTO L_184b1   '@1847a DS:26e2
V_0e8c! = VAL(V_1482$)   '@1848f
GOTO L_18933   '@184a9
L_184b1:
IF NOT (V_1518# = 4.0#) THEN GOTO L_18539   '@184b2 DS:26ea
IF NOT (V_0ec0! <> 5.0 AND V_0ec0! > 2.0) THEN GOTO L_18517   '@184c7 DS:173a,1e50
BEEP   '@18505
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@1850f
L_18517:
V_0e90! = VAL(V_1482$)   '@18517
GOTO L_18933   '@18531
L_18539:
IF NOT (V_1518# = 5.0#) THEN GOTO L_1859e   '@1853a DS:26f2
IF NOT (V_0ec0! > 2.0) THEN GOTO L_1857c   '@1854f DS:1e50
BEEP   '@1856a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@18574
L_1857c:
V_0e94! = VAL(V_1482$)   '@1857c
GOTO L_18933   '@18596
L_1859e:
IF NOT (V_1518# = 6.0#) THEN GOTO L_18633   '@1859f DS:26fa
V_0e54! = ST_0f5e!(0)   '@185b4
ST_0f5e!(0) = VAL(V_1482$)   '@185c5
GOSUB L_140cc   '@185df
IF NOT (V_147e$ = "*") THEN GOTO L_1862b   '@185ec DS:1c18
ST_0f5e!(0) = V_0e54!   '@18603
BEEP   '@18614
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@1861e
L_1862b:
GOTO L_18933   '@1862b
L_18633:
IF NOT (V_1518# = 7.0#) THEN GOTO L_186c8   '@18634 DS:2702
V_0e54! = ST_0f5e!(1)   '@18649
ST_0f5e!(1) = VAL(V_1482$)   '@1865a
GOSUB L_140cc   '@18674
IF NOT (V_147e$ = "*") THEN GOTO L_186c0   '@18681 DS:1c18
ST_0f5e!(1) = V_0e54!   '@18698
BEEP   '@186a9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@186b3
L_186c0:
GOTO L_18933   '@186c0
L_186c8:
IF NOT (V_1518# = 8.0#) THEN GOTO L_1875d   '@186c9 DS:270a
V_0e54! = ST_0f5e!(2)   '@186de
ST_0f5e!(2) = VAL(V_1482$)   '@186ef
GOSUB L_140cc   '@18709
IF NOT (V_147e$ = "*") THEN GOTO L_18755   '@18716 DS:1c18
ST_0f5e!(2) = V_0e54!   '@1872d
BEEP   '@1873e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@18748
L_18755:
GOTO L_18933   '@18755
L_1875d:
IF NOT (V_1518# = 9.0#) THEN GOTO L_187f2   '@1875e DS:2712
V_0e54! = ST_0f5e!(3)   '@18773
ST_0f5e!(3) = VAL(V_1482$)   '@18784
GOSUB L_140cc   '@1879e
IF NOT (V_147e$ = "*") THEN GOTO L_187ea   '@187ab DS:1c18
ST_0f5e!(3) = V_0e54!   '@187c2
BEEP   '@187d3
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@187dd
L_187ea:
GOTO L_18933   '@187ea
L_187f2:
IF NOT (V_1518# = 10.0#) THEN GOTO L_18887   '@187f3 DS:271a
V_0e54! = ST_0f5e!(4)   '@18808
ST_0f5e!(4) = VAL(V_1482$)   '@18819
GOSUB L_140cc   '@18833
IF NOT (V_147e$ = "*") THEN GOTO L_1887f   '@18840 DS:1c18
ST_0f5e!(4) = V_0e54!   '@18857
BEEP   '@18868
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@18872
L_1887f:
GOTO L_18933   '@1887f
L_18887:
IF NOT (V_1518# = 11.0#) THEN GOTO L_1891c   '@18888 DS:2722
V_0e54! = ST_0f5e!(5)   '@1889d
ST_0f5e!(5) = VAL(V_1482$)   '@188ae
GOSUB L_140cc   '@188c8
IF NOT (V_147e$ = "*") THEN GOTO L_18914   '@188d5 DS:1c18
ST_0f5e!(5) = V_0e54!   '@188ec
BEEP   '@188fd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@18907
L_18914:
GOTO L_18933   '@18914
L_1891c:
BEEP   '@1891c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_182da   '@18926
L_18933:
GOSUB L_141da   '@18933
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_17dbd   '@18940
' ---- FUN_1000_894d @0x1894d  (01894d_FUN_1000_894d.lift.txt; evidence_id (assembly): ev_25c3ced0f0f244f53da54662db2de86fe4943409e22d9bfa9387cf0c456d95cf)
L_1894d:   ' entrada vinda de 011801_FUN_1000_1801
RT_VIEWPRINT 1, 25   '@18952
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@18964
RT_CLS 2   '@18990
PRINT RT_STRINGC$((80), (205))   '@1899e
PRINT " Correcao de Parametros"   '@189b6 DS:272a
PRINT RT_STRINGC$((80), (205))   '@189c4
L_189e1:
LOCATE 6, 1   '@189e6
COLOR 7   '@18a01
PRINT " Limite da posicao da Linha Neutra"   '@18a17 DS:2746
COLOR RT_CINT%(FX##(V_0dc0!))   '@18a25
PRINT " (1) x/d(lim)="; V_0e14!; "    "   '@18a42 DS:276c,277e
COLOR 7   '@18a66
PRINT " Taxa de Armadura Longitudinal"   '@18a7c DS:2786
COLOR RT_CINT%(FX##(V_0dc0!))   '@18a8a
PRINT " (2) @1="; V_0e18!; "    "   '@18aa7 DS:277e,27a8
PRINT ""   '@18acb DS:1644
COLOR 7   '@18ad9
PRINT " Coeficientes de Seguranca"   '@18aef DS:27b4
COLOR RT_CINT%(FX##(V_0dc0!))   '@18afd
PRINT " (3) Forcas ="; V_0e60!; "    "   '@18b1a DS:277e,27d2
PRINT " (4) Concreto ="; V_0e64!; "    "   '@18b3e DS:277e,27e4
PRINT " (5) Aco ="; V_0e68!; "    "   '@18b62 DS:277e,27f8
PRINT ""   '@18b86 DS:1644
COLOR 7   '@18b94
PRINT " Unidades de trabalho dos esforcos solicitantes"   '@18baa DS:2806
COLOR RT_CINT%(FX##(V_0dc0!))   '@18bb8
PRINT " (6) Unidade de Forca = "; V_0dd0$; "    "   '@18bd5 DS:277e,283a
PRINT " (7) Coef. multiplicador para transformar em toneladas ="; V_0de0!; "   "   '@18bf5 DS:2322,2856
PRINT " (8) Unidade de Medida = "; V_0dd4$; "    "   '@18c19 DS:277e,2892
PRINT " (9) Coef. multiplicador para transformar em metros ="; V_0ddc!; "   "   '@18c39 DS:2322,28b0
L_18c62:
COLOR 7   '@18c67
LOCATE 22, 1   '@18c7d
PRINT " item , Novo Valor  *NAO* "; RT_TAB$(70); "";   '@18c98 DS:1644,26bc
LOCATE 22, 27   '@18cb8
CALL MIXT_07f1_LimpaTeclado   '@18cd6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_147e$, V_1482$)   '@18ce0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_147e$) = 0) THEN GOTO L_18d0f   '@18cf2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@18d07
L_18d0f:
V_1520# = VAL(V_147e$)   '@18d0f
IF NOT (V_1520# = 1.0#) THEN GOTO L_18d66   '@18d29 DS:206e
V_0e14! = VAL(V_1482$)   '@18d44
GOTO L_18f2d   '@18d5e
L_18d66:
IF NOT (V_1520# = 2.0#) THEN GOTO L_18d9e   '@18d67 DS:26da
V_0e18! = VAL(V_1482$)   '@18d7c
GOTO L_18f2d   '@18d96
L_18d9e:
IF NOT (V_1520# = 3.0#) THEN GOTO L_18dd6   '@18d9f DS:26e2
V_0e60! = VAL(V_1482$)   '@18db4
GOTO L_18f2d   '@18dce
L_18dd6:
IF NOT (V_1520# = 4.0#) THEN GOTO L_18e0e   '@18dd7 DS:26ea
V_0e64! = VAL(V_1482$)   '@18dec
GOTO L_18f2d   '@18e06
L_18e0e:
IF NOT (V_1520# = 5.0#) THEN GOTO L_18e46   '@18e0f DS:26f2
V_0e68! = VAL(V_1482$)   '@18e24
GOTO L_18f2d   '@18e3e
L_18e46:
IF NOT (V_1520# = 6.0#) THEN GOTO L_18e76   '@18e47 DS:26fa
V_0dd0$ = V_1482$   '@18e5c
GOTO L_18f2d   '@18e6e
L_18e76:
IF NOT (V_1520# = 7.0#) THEN GOTO L_18eae   '@18e77 DS:2702
V_0de0! = VAL(V_1482$)   '@18e8c
GOTO L_18f2d   '@18ea6
L_18eae:
IF NOT (V_1520# = 8.0#) THEN GOTO L_18ede   '@18eaf DS:270a
V_0dd4$ = V_1482$   '@18ec4
GOTO L_18f2d   '@18ed6
L_18ede:
IF NOT (V_1520# = 9.0#) THEN GOTO L_18f16   '@18edf DS:2712
V_0ddc! = VAL(V_1482$)   '@18ef4
GOTO L_18f2d   '@18f0e
L_18f16:
BEEP   '@18f16
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_18c62   '@18f20
L_18f2d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_189e1   '@18f2d
' ---- FUN_1000_8f3a @0x18f3a  (018f3a_FUN_1000_8f3a.lift.txt; evidence_id (assembly): ev_77658bbdc55407d096cac3c1183c7ba03aa72cad9ab455ae246d80cf41a82b51)
L_18f3a:   ' entrada vinda de 011801_FUN_1000_1801
IF NOT (V_1492% = 0) THEN GOTO L_18f56   '@18f3f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@18f4e
L_18f56:
RT_VIEWPRINT 1, 25   '@18f56
RT_CLS 2   '@18f68
V_0e98! = 1.0   '@18f76 DS:1640
L_18f8c:
V_0e9c! = FX##(V_0e98!) + 16.0   '@18f91 DS:28ea
IF NOT (V_1492% < V_0e9c!) THEN GOTO L_18fd9   '@18fa7
V_0e9c! = V_1492%   '@18fc5
L_18fd9:
GOSUB L_1902f   '@18fd9
IF NOT (V_1492% = V_0e9c!) THEN GOTO L_1900c   '@18fe6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_11801   '@19004
L_1900c:
V_0e98! = FX##(V_0e9c!) + 1.0   '@1900c DS:1640
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
GOTO L_18f8c   '@19022
' ---- F_1902a @0x1902a  (01902a_F_1902a.lift.txt; evidence_id (assembly): ev_7bf0ca7cc5fe1540e402d7dd0659ecb8082591f8f6dd76de68b14f9bb452e71f)
L_1902f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 018f3a_FUN_1000_8f3a
COLOR 7   '@19034
RT_CLS 2   '@1904a
PRINT RT_STRINGC$((80), (205))   '@19058
PRINT " Lista das Secoes arquivadas"   '@19070 DS:28ee
PRINT " POS tipo   B     H     Diam    d   Bsup/Bf   Hf    Bit Flexao    Bit Cisalham"   '@1907e DS:290e
PRINT RT_STRINGC$((80), (205))   '@1908c
V_1482$ = "##.#/##.#/##.# ##.#/##.#/##.#"   '@190a4 DS:2960
V_1528! = V_0e9c!   '@190b6
FOR V_0ea0! = V_0e98! TO V_1528!   '@190c8 DS:1640
COLOR RT_CINT%(FX##(V_0dc0!))   '@190d0
V_152c! = ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 110)   '@190ed
IF NOT (V_152c! <> 1.0) THEN GOTO L_19142   '@19111 DS:1640
IF NOT (V_152c! = 2.0) THEN GOTO L_19239   '@1912d DS:1e50
L_19142:
V_147e$ = " ###  \\ ###.# ###.#         ###.#   ###.# ###.#  "   '@19142 DS:2982
V_1486$ = "rt"   '@19154 DS:29b8
PRINT USING V_147e$; RT_PU#(V_0ea0!, V_147e$, 1); V_1486$; RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!))), V_147e$, 2); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 22), V_147e$, 3); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 44), V_147e$, 4); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 66), V_147e$, 5); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 88), V_147e$, 6);   '@19166
GOTO L_19565   '@19231
L_19239:
IF NOT (V_152c! = 3.0) THEN GOTO L_19304   '@1923a DS:1c42
V_147e$ = " ###  \\ ###.# ###.#         ###.#                "   '@1924f DS:29be
V_1486$ = "tr"   '@19261 DS:29f4
PRINT USING V_147e$; RT_PU#(V_0ea0!, V_147e$, 1); V_1486$; RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!))), V_147e$, 2); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 22), V_147e$, 3); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 44), V_147e$, 4);   '@19273
GOTO L_19565   '@192fc
L_19304:
IF NOT (V_152c! = 4.0) THEN GOTO L_193cf   '@19305 DS:1c3a
V_147e$ = " ###  \\ ###.# ###.#         ###.#                "   '@1931a DS:29be
V_1486$ = "ti"   '@1932c DS:29fa
PRINT USING V_147e$; RT_PU#(V_0ea0!, V_147e$, 1); V_1486$; RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!))), V_147e$, 2); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 22), V_147e$, 3); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 44), V_147e$, 4);   '@1933e
GOTO L_19565   '@193c7
L_193cf:
IF NOT (V_152c! = 5.0) THEN GOTO L_194bb   '@193d0 DS:173a
V_147e$ = " ###  \\ ###.# ###.#         ###.#   ###.#        "   '@193e5 DS:2a00
V_1486$ = "tz"   '@193f7 DS:2a36
PRINT USING V_147e$; RT_PU#(V_0ea0!, V_147e$, 1); V_1486$; RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!))), V_147e$, 2); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 22), V_147e$, 3); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 44), V_147e$, 4); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 66), V_147e$, 5);   '@19409
GOTO L_19565   '@194b3
L_194bb:
IF NOT (V_152c! = 10.0) THEN GOTO L_19565   '@194bc DS:179c
V_147e$ = " ###  \\               ###.# ###.#                "   '@194d1 DS:2a3c
V_1486$ = "ci"   '@194e3 DS:2a72
PRINT USING V_147e$; RT_PU#(V_0ea0!, V_147e$, 1); V_1486$; RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!))), V_147e$, 2); RT_PU#(ST_11e2!(RT_CINT%(FX##(V_0ea0!)) + 44), V_147e$, 3);   '@194f5
GOTO L_19565   '@1955d
L_19565:
COLOR 7   '@19565
PRINT USING V_1482$; RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!))), V_1482$, 1); RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!)) + 22), V_1482$, 2); RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!)) + 44), V_1482$, 3); RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!)) + 66), V_1482$, 4); RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!)) + 88), V_1482$, 5); RT_PU#(ST_0f7a!(RT_CINT%(FX##(V_0ea0!)) + 110), V_1482$, 6)   '@1957b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY no laco (B$EVCK)
NEXT V_0ea0!   '@1964c DS:1640
PRINT ""   '@19678 DS:1644
PRINT " Qualquer Tecla para Continuar ";   '@19686 DS:2a78
CALL MIXT_07f1_LimpaTeclado   '@19694
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
V_147e$ = RT_INPUT$(1)   '@1969e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_116a3, L_116ce, L_117d3   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@196ba
' @196c4 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_1984f   '@196c4
' ---- FUN_1000_984f @0x1984f  (01984f_FUN_1000_984f.lift.txt; evidence_id (assembly): ev_2dff7d84da2e62d9738e032beaf670e23c4fce519f547162d0444377f9367930)
L_1984f:   ' entrada vinda de 01902a_F_1902a
GOTO L_1ace0   '@1984f
' ---- FUN_1000_ace0 @0x1ace0  (01ace0_FUN_1000_ace0.lift.txt; evidence_id (assembly): ev_5112c5fe7b387eedf66ddd66395f384c084702e79011afca3d42a49a34fd50fa)
L_1ace0:   ' entrada vinda de 01984f_FUN_1000_984f
GOTO L_1af83   '@1ace0
' ---- F_1af83 @0x1af83  (01af83_F_1af83.lift.txt; evidence_id (assembly): ev_f895161fb67e0a8d9ce9ce6c7a9ed14b543f99b086b32be23453651f7b6ae163)
L_1af83:   ' entrada vinda de 01ace0_FUN_1000_ace0
RT_FIM   ' @1af83 B$CENP (inicio/fim do modulo)
' ---- F_1af88 @0x1af88  (01af88_F_1af88.lift.txt; evidence_id (assembly): ev_fdcf8cfd2d89195dbbbf759e7c0217e1c820bfda8c2ada0ae40119f8e2f4bfc4)
'RETRAD? @1af8e ?? 43 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 22 instr.): MOV SP, 0x9d0b; DEC CX ...
' ---- M_ARMADAUX @0x20030  (020030_M_ARMADAUX.lift.txt; evidence_id (assembly): ev_00f37029742e1d3798441e565f5b6d7c3d70053dd31203d66e8b575cd11a2af1)
' @20030 inicio do programa (B$?EVT)
GOTO L_23d7d   '@200c1
' ---- FUN_2000_3d7d @0x23d7d  (023d7d_FUN_2000_3d7d.lift.txt; evidence_id (assembly): ev_47c5ee7085418174fd338bcf0311a8e0aacffd06fb90af1f42d7c896890840fa)
L_23d7d:   ' entrada vinda de 020030_M_ARMADAUX
GOTO L_24137   '@23d7d
' ---- FUN_2000_4137 @0x24137  (024137_FUN_2000_4137.lift.txt; evidence_id (assembly): ev_e48da303472a86be73ffccddd4cd0b34fdbc61b369610e43e22cc2a53feee60a)
L_24137:   ' entrada vinda de 023d7d_FUN_2000_3d7d
GOTO L_25aad   '@24137
' ---- FUN_2000_5aad @0x25aad  (025aad_FUN_2000_5aad.lift.txt; evidence_id (assembly): ev_2ba6fdd47602bbdc46fc4a5749a9fbd26224b5066840434bb55e16da726eac92)
L_25aad:   ' entrada vinda de 024137_FUN_2000_4137
GOTO L_25d8c   '@25aad
' ---- RT_EA @0x25d8c  (025d8c_RT_EA.lift.txt; evidence_id (assembly): ev_8d5335ec626a7e5ef9a3267b3266b850f0a4772f764a403fc166674b0859b1b1)
L_25d8c:   ' entrada vinda de 025aad_FUN_2000_5aad
RT_FIM   ' @25d8c B$CENP (inicio/fim do modulo)
' ---- M_NOM @0x30030  (030030_M_NOM.lift.txt; evidence_id (assembly): ev_81ef5a126822a619584db77a0a85a9f08b0764b14ce5760f9e2dcd1c51216fc9)
' @30030 inicio do programa (B$?EVT)
GOTO L_302f1   '@3003a
' ---- RT_EA @0x302f1  (0302f1_RT_EA.lift.txt; evidence_id (assembly): ev_0fa465a32bd683d4358190317564eabc01e3c801b7e7daaeb770653fcb1b96ab)
L_302f1:   ' entrada vinda de 030030_M_NOM
RT_FIM   ' @302f1 B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' ---- DATA do original (texto da area de DATA do EXE, na ordem; ver RETRADUCAO.md)
' DATA do arquivo do EXE em 1c412
DATA 3.2,4,5,6.3,8,10,12.5,16,20,22.2,25,32,40
' DATA do arquivo do EXE em 1c43f
DATA .08,.125,.2,.315,.5,.8,1.25,2,3.15,3.88,5,8,12.5

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    ERASE ST_0ece!
    ERASE ST_0f06!
    ERASE ST_0f3e!
    ERASE ST_0f4e!
    ERASE ST_0f5e!
    ERASE ST_0f7a!
    ERASE ST_11e2!
    ERASE ST_144a$
    V_0dc0! = 0
    V_0dc4! = 0
    V_0dc8! = 0
    V_0dcc$ = ""
    V_0dd0$ = ""
    V_0dd4$ = ""
    V_0dd8! = 0
    V_0ddc! = 0
    V_0de0! = 0
    V_0de4$ = ""
    V_0de8$ = ""
    V_0dec$ = ""
    V_0df0$ = ""
    V_0df4$ = ""
    V_0df8$ = ""
    V_0dfc$ = ""
    V_0e00$ = ""
    V_0e04$ = ""
    V_0e08$ = ""
    V_0e0c! = 0
    V_0e10! = 0
    V_0e14! = 0
    V_0e18! = 0
    V_0e1c! = 0
    V_0e20! = 0
    V_0e24! = 0
    V_0e28! = 0
    V_0e2c! = 0
    V_0e30! = 0
    V_0e34! = 0
    V_0e38! = 0
    V_0e3c! = 0
    V_0e40! = 0
    V_0e44! = 0
    V_0e48! = 0
    V_0e4c! = 0
    V_0e50! = 0
    V_0e54! = 0
    V_0e58! = 0
    V_0e5c! = 0
    V_0e60! = 0
    V_0e64! = 0
    V_0e68! = 0
    V_0e6c! = 0
    V_0e70! = 0
    V_0e74! = 0
    V_0e78! = 0
    V_0e7c! = 0
    V_0e80$ = ""
    V_0e84! = 0
    V_0e88! = 0
    V_0e8c! = 0
    V_0e90! = 0
    V_0e94! = 0
    V_0e98! = 0
    V_0e9c! = 0
    V_0ea0! = 0
    V_0ea4! = 0
    V_0ea8! = 0
    V_0eac! = 0
    V_0eb0! = 0
    V_0eb4! = 0
    V_0eb8! = 0
    V_0ebc! = 0
    V_0ec0! = 0
    V_0ec4! = 0
    V_1466! = 0
    V_146a! = 0
    V_147e$ = ""
    V_1482$ = ""
    V_1486$ = ""
    V_148a! = 0
    V_148e! = 0
    V_1492% = 0
    V_1494! = 0
    V_14a0$ = ""
    V_14a4$ = ""
    V_14a8! = 0
    V_14ac! = 0
    V_14b0$ = ""
    V_14b4! = 0
    V_14b8$ = ""
    V_14bc$ = ""
    V_14c0$ = ""
    V_14c4! = 0
    V_14c8! = 0
    V_14cc! = 0
    V_14d0! = 0
    V_14d4! = 0
    V_14d8! = 0
    V_14dc! = 0
    V_14e0! = 0
    V_14e4! = 0
    V_14e8! = 0
    V_14ec! = 0
    V_14f0! = 0
    V_14f4! = 0
    V_14f8! = 0
    V_14fc! = 0
    V_1500! = 0
    V_1504! = 0
    V_1508! = 0
    V_150c! = 0
    V_1510! = 0
    V_1514! = 0
    V_1518# = 0
    V_1520# = 0
    V_1528! = 0
    V_152c! = 0
    V_1638$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_116a3: BEEP; GOSUB L_113fd; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_116ce: sai da SUB (RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; PRINT ""; PRI)
        CASE 3   ' L_117d3: sai da SUB (BEEP; GOSUB L_113fd; RETURN L_11801)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H111f2: ON ERROR GOTO L_111f2
        CASE &H1125d: ON ERROR GOTO L_1125d
        CASE &H113bd: ON ERROR GOTO L_113bd
        CASE &H11783: ON ERROR GOTO L_11783
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_196cc   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x196cc)
    DIM L_BP0e$
    ' ---- FUN_1000_96cc @0x196cc  (0196cc_FUN_1000_96cc.lift.txt; evidence_id (assembly): ev_e4c5c005e237539914579298c538497f61be4561d9cda484108d2f3d902f2f63)
    BEEP   '@196d9
    BEEP   '@196e3
    BEEP   '@196ed
    RT_SCREEN 0   '@196f7
    RT_VIEWPRINT 1, 25   '@1970c
    RT_CLOSE   '@1971e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@1972b DS:1c3a
    RT_CLS 0   '@19770
    LOCATE 10, 1   '@1977d
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@19798 DS:1644,2a9c
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@197b8 DS:1644,2ab6
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@197d8 DS:1644,2ae2
L_197fd:
    CALL MIXT_07f1_LimpaTeclado   '@19802
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@1980c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@19828
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_197fd   '@19832
    ' ---- F_19839 @0x19839  (019839_F_19839.lift.txt; evidence_id (assembly): ev_35057f83e28411f2d2bdb81a5ad91d12a24107ab43b21d101d460bb9d48795d2)
    ' @19839 libera strings locais (L_BP0e)
    ' END SUB   '@19847
END SUB

SUB S_19857   ' entrada de SUB/FUNCTION (B$ENRA, locais 12 bytes) (0x19857)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    ' ---- FUN_1000_9857 @0x19857  (019857_FUN_1000_9857.lift.txt; evidence_id (assembly): ev_873c9f64699efd7564df60dbb0ef6b28f06d84a1852282589db34d904c016704)
    V_0ea8! = 0.0   '@19869 DS:1768
    V_0eac! = 0.0   '@1987a DS:1768
    IF NOT (V_0ec0! <= 2.0) THEN GOTO L_19dbd   '@1988b DS:1e50
    IF NOT (V_0eb0! > V_0e44! AND V_0eb8! = 2.0 OR V_0eb0! > V_0e38! AND V_0eb8! = 1.0) THEN GOTO L_19922   '@198a6 DS:1640,1e50
    GOTO L_1acd8   '@1991a
L_19922:
    IF NOT (V_0eb0! <= V_0e3c! AND V_0eb8! = 2.0) THEN GOTO L_19a15   '@19922 DS:1e50
    V_0ea8! = V_0eb0! / (0.800000011920928955078125## * V_0e68! * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e90!) * V_0e70! * V_0dd8! * V_0e64!   '@19960 DS:2b08,2b0c
    V_0eac! = (V_0e8c! - 0.4000000059604644775390625## * V_0ea8!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * 0.800000011920928955078125## * V_0e90! * V_0ea8!   '@199a1 DS:2b08,2b0c,2b10
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@199ea
    GOTO L_1acd8   '@19a08
L_19a15:
    IF NOT (V_0eb0! <= V_0e40! AND V_0eb8! = 2.0 OR V_0eb0! <= V_0e34! AND V_0eb8! = 1.0) THEN GOTO L_19b7a   '@19a15 DS:1640,1e50
    V_0ea8! = (V_0eb0! / (V_0e68! * 0.85000002384185791015625## * V_0e6c! * V_0dd8!) * V_0e64! * V_0e70! * V_0dd8! - (FX##(V_0e90!) - V_0e84!) * V_0e94!) / (V_0e84! * 0.800000011920928955078125##)   '@19a89 DS:2b08,2b0c
    V_0eac! = ((FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) * V_0e94! + (V_0e8c! - 0.4000000059604644775390625## * V_0ea8!) * V_0e84! * 0.800000011920928955078125## * V_0ea8!) / (FX##(V_0e60!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@19adf DS:1e50,2b08,2b0c,2b10
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@19b4f
    GOTO L_1acd8   '@19b6d
L_19b7a:
    IF NOT (V_0eb0! > V_0e40! AND V_0eb8! = 2.0 OR V_0eb0! > V_0e34! AND V_0eb8! = 1.0) THEN GOTO L_19db8   '@19b7a DS:1640,1e50
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@19bee DS:2b14
    V_0ebc! = 3.0   '@19c09 DS:1c42
L_19c1f:
L_19c2a:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@19c2a
    L_BP0e! = ((FX##(V_0e90!) - V_0e84!) * V_0e94! + V_0e84! * 0.800000011920928955078125## * V_0ea8!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! / V_0e64!   '@19c40 DS:2b08,2b0c
    V_0e58! = V_0e8c! * 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@19c80 DS:2b18,2b1c
    CALL S_25ab5   '@19ca0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e54!) * V_0eb0! >= FX##(L_BP0e!)) THEN GOTO L_19c2a   '@19caa
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_19d1d   '@19cc9 DS:2b20
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@19ce4
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@19cfa DS:1e50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19c1f   '@19d10
L_19d1d:
    V_0eac! = ((V_0e8c! - 0.4000000059604644775390625## * V_0ea8!) * V_0e84! * 0.800000011920928955078125## * V_0ea8! + (FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) * V_0e94!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@19d1d DS:1e50,2b08,2b0c,2b10
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@19d8d
    GOTO L_1acd8   '@19dab
L_19db8:
L_19dbd:
    IF NOT (V_0ec0! = 3.0) THEN GOTO L_1a0a7   '@19dbd DS:1c42
    IF NOT (V_0eb0! > V_0e38!) THEN GOTO L_19dfb   '@19dd8
    GOTO L_1acd8   '@19df3
L_19dfb:
    IF NOT (V_0eb0! <= V_0e34!) THEN GOTO L_19ee5   '@19dfb
    V_0ea8! = RT_SQR##(V_0eb0! / (0.2560000121593475341796875## * V_0e6c! * V_0dd8! * V_0e68! * V_0e84!) * V_0e64! * V_0e70! * V_0dd8! * V_0e88!)   '@19e16 DS:2b24
    V_0eac! = RT_POT##((FX##(V_0ea8!)), (2.0)) * (V_0e8c! - 0.533333361148834228515625## * V_0ea8!) / (FX##(V_0e64!) * V_0e88! * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * 0.319999992847442626953125## * V_0e84!   '@19e5a DS:1e50,2b08,2b28,2b2c
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@19eb7
    GOTO L_1acd8   '@19ed5
L_19ee5:
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@19ee5 DS:2b14
    V_0ebc! = 3.0   '@19f00 DS:1c42
L_19f16:
L_19f20:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@19f20
    L_BP0e! = RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) / (FX##(V_0e64!) * 2.0 * V_0e88!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e84!   '@19f36 DS:1e50,2b08
    V_0e58! = V_0e8c! * 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@19f7d DS:2b18,2b1c
    CALL S_25ab5   '@19f9d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e54!) * V_0eb0! >= FX##(L_BP0e!)) THEN GOTO L_19f20   '@19fa7
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_1a01a   '@19fc6 DS:2b20
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@19fe1
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@19ff7 DS:1e50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19f16   '@1a00d
L_1a01a:
    V_0eac! = RT_POT##((FX##(V_0ea8!)), (2.0)) * (V_0e8c! - 0.533333361148834228515625## * V_0ea8!) / (FX##(V_0e64!) * V_0e88! * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * 0.319999992847442626953125## * V_0e84!   '@1a01a DS:1e50,2b08,2b28,2b2c
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1a077
    GOTO L_1acd8   '@1a095
L_1a0a7:
    IF NOT (V_0ec0! = 4.0) THEN GOTO L_1a4bd   '@1a0a7 DS:1c3a
    IF NOT (V_0eb0! > V_0e38!) THEN GOTO L_1a0e5   '@1a0c2
    GOTO L_1acd8   '@1a0dd
L_1a0e5:
    IF NOT (V_0eb0! <= V_0e34!) THEN GOTO L_1a29b   '@1a0e5
    V_0ea8! = RT_POT##((0.800000011920928955078125##), (2.0)) * RT_POT##((FX##(V_0e84!)), (2.0)) - RT_POT##((0.800000011920928955078125##), (2.0)) / (FX##(V_0e88!) * V_0e6c! * V_0dd8! * V_0e68! * 0.85000002384185791015625##) * 2.0 * V_0e84! * V_0eb0! * V_0e64! * V_0e70! * V_0dd8!   '@1a100 DS:1e50,2b08,2b0c
    V_0ea8! = (V_0e84! * 0.800000011920928955078125## - RT_SQR##(FX##(V_0ea8!))) / (RT_POT##((0.800000011920928955078125##), (2.0)) * V_0e84!) * V_0e88!   '@1a17f DS:1e50,2b08
    V_0eac! = V_0e8c! - (0.5 - 0.800000011920928955078125## / (3.0 * FX##(V_0e88!)) * V_0ea8!) / (1.0 - 0.800000011920928955078125## / (2.0 * FX##(V_0e88!)) * V_0ea8!) * 0.800000011920928955078125## * V_0ea8!   '@1a1be DS:1640,1c42,1e50,235e,2b08
    V_0eac! = (2.0 - 0.800000011920928955078125## * V_0ea8! / V_0e88!) / (FX##(V_0e64!) * 2.0 * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0ea8! * 0.800000011920928955078125## * V_0e84! * V_0eac!   '@1a21d DS:1e50,2b08,2b0c
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1a275
    GOTO L_1a4b8   '@1a293
L_1a29b:
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@1a29b DS:2b14
    V_0ebc! = 3.0   '@1a2b6 DS:1c42
L_1a2cc:
L_1a2d6:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@1a2d6
    L_BP0e! = (2.0 - 0.800000011920928955078125## * V_0ea8! / V_0e88!) / (FX##(V_0e64!) * 2.0) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0ea8! * 0.800000011920928955078125## * V_0e84!   '@1a2ec DS:1e50,2b08,2b0c
    V_0e58! = V_0e8c! * 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@1a339 DS:2b18,2b1c
    CALL S_25ab5   '@1a359
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e54!) * V_0eb0! >= FX##(L_BP0e!)) THEN GOTO L_1a2d6   '@1a363
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_1a3d6   '@1a382 DS:2b20
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@1a39d
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@1a3b3 DS:1e50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1a2cc   '@1a3c9
L_1a3d6:
    V_0eac! = V_0e8c! - (0.5 - 0.800000011920928955078125## / (3.0 * FX##(V_0e88!)) * V_0ea8!) / (1.0 - 0.800000011920928955078125## / (2.0 * FX##(V_0e88!)) * V_0ea8!) * 0.800000011920928955078125## * V_0ea8!   '@1a3d6 DS:1640,1c42,1e50,235e,2b08
    V_0eac! = (2.0 - 0.800000011920928955078125## * V_0ea8! / V_0e88!) / (FX##(V_0e64!) * 2.0 * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0ea8! * 0.800000011920928955078125## * V_0e84! * V_0eac!   '@1a435 DS:1e50,2b08,2b0c
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1a48d
    GOTO L_1acd8   '@1a4ab
L_1a4b8:
L_1a4bd:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_1a9d5   '@1a4bd DS:173a
    IF NOT (V_0eb0! > V_0e38!) THEN GOTO L_1a4fb   '@1a4d8
    GOTO L_1acd8   '@1a4f3
L_1a4fb:
    L_BP12! = 0.800000011920928955078125##   '@1a4fb DS:2b08
    IF NOT (V_0e90! >= V_0e84!) THEN GOTO L_1a536   '@1a50b
    L_BP12! = 0.85000002384185791015625##   '@1a526 DS:2b0c
L_1a536:
    IF NOT (V_0eb0! <= V_0e34!) THEN GOTO L_1a75e   '@1a536
    V_0ea8! = RT_POT##((0.800000011920928955078125##), (2.0)) * RT_POT##((FX##(V_0e90!)), (2.0)) + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125##), (2.0)) / (FX##(V_0e88!) * 2.0 * V_0e6c! * V_0dd8! * V_0e68! * L_BP12!) * 4.0 * V_0eb0! * V_0e64! * V_0e70! * V_0dd8!   '@1a551 DS:1c3a,1e50,2b08
    V_0ea8! = (-V_0e90! * 0.800000011920928955078125## + RT_SQR##(FX##(V_0ea8!))) / ((FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125##), (2.0))) * V_0e88!   '@1a5dc DS:1e50,2b08
    V_0eac! = (V_0e90! * 0.800000011920928955078125## * V_0ea8! + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) / (FX##(V_0e88!) * 2.0)) * L_BP12! * V_0e6c! * V_0dd8! / V_0e64!   '@1a626 DS:1e50,2b08
    V_0eac! = (V_0e8c! - (RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) * V_0e90! / 2.0 + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (3.0)) / (FX##(V_0e88!) * 3.0)) / ((2.0 * FX##(V_0e90!) + (FX##(V_0e84!) - V_0e90!) * 0.800000011920928955078125## * V_0ea8! / V_0e88!) * V_0ea8! * 0.800000011920928955078125##) * 2.0) * V_0eac! / V_0e60!   '@1a687 DS:1c42,1e50,2b08
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1a730
    GOTO L_1acd8   '@1a74e
L_1a75e:
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@1a75e DS:2b14
    V_0ebc! = 3.0   '@1a779 DS:1c42
L_1a78f:
L_1a79a:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@1a79a
    L_BP0e! = ((FX##(V_0e84!) - V_0e90!) / (FX##(V_0e88!) * 2.0) * 0.800000011920928955078125## * V_0ea8! + V_0e90!) * L_BP12! * V_0e6c! * V_0dd8! * V_0ea8! * 0.800000011920928955078125## / V_0e64!   '@1a7b0 DS:1e50,2b08
    V_0e58! = V_0e8c! * 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@1a7fe DS:2b18,2b1c
    CALL S_25ab5   '@1a81e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e54!) * V_0eb0! >= FX##(L_BP0e!)) THEN GOTO L_1a79a   '@1a828
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_1a89b   '@1a847 DS:2b20
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@1a862
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@1a878 DS:1e50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1a78f   '@1a88e
L_1a89b:
    V_0eac! = (V_0e90! * 0.800000011920928955078125## * V_0ea8! + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) / (FX##(V_0e88!) * 2.0)) * L_BP12! * V_0e6c! * V_0dd8! / V_0e64!   '@1a89b DS:1e50,2b08
    V_0eac! = (V_0e8c! - (RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) * V_0e90! / 2.0 + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (3.0)) / (FX##(V_0e88!) * 3.0)) / ((2.0 * FX##(V_0e90!) + (FX##(V_0e84!) - V_0e90!) * 0.800000011920928955078125## * V_0ea8! / V_0e88!) * V_0ea8! * 0.800000011920928955078125##) * 2.0) * V_0eac! / V_0e60!   '@1a8fc DS:1c42,1e50,2b08
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1a9a5
    GOTO L_1acd8   '@1a9c3
L_1a9d5:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_1acd3   '@1a9d5 DS:179c
    IF NOT (V_0eb0! > V_0e38!) THEN GOTO L_1aa13   '@1a9f0
    GOTO L_1acd8   '@1aa0b
L_1aa13:
    IF NOT (V_0eb0! <= V_0e34!) THEN GOTO L_1aa51   '@1aa13
    V_0ea8! = FX##(V_0e1c!) * V_0e8c! + 1.5   '@1aa2e DS:2b14
    GOTO L_1aa71   '@1aa49
L_1aa51:
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@1aa51 DS:2b14
L_1aa71:
    V_0ebc! = 3.0   '@1aa71 DS:1c42
L_1aa87:
L_1aa92:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@1aa92
    L_BP16! = ATN(RT_SQR##(-(RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0))) + V_0e84! * 0.800000011920928955078125## * V_0ea8!) / (FX##(V_0e84!) / 2.0 - 0.800000011920928955078125## * V_0ea8!))   '@1aaa8 DS:1e50,2b08
    V_0e58! = V_0e8c! * 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@1ab02 DS:2b18,2b1c
    CALL S_25ab5   '@1ab22
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) / (FX##(V_0e64!) * 4.0) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! <= FX##(V_0eb0!) * V_0e54!) THEN GOTO L_1aa92   '@1ab2c DS:1c3a,1e50,2b08
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_1abeb   '@1ab97 DS:2b20
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@1abb2
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@1abc8 DS:1e50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1aa87   '@1abde
L_1abeb:
    V_0eac! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * (V_0e8c! - FX##(V_0e84!) / 2.0 + RT_POT##((RT_SIN##(FX##(L_BP16!))), (3.0)) / ((L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * 3.0) * V_0e84!) / (FX##(V_0e64!) * V_0e60! * 4.0) * 0.800000011920928955078125## * V_0e6c! * V_0dd8!   '@1abeb DS:1c3a,1c42,1e50,2b08
    V_0eac! = V_0eac! / (FX##(V_0ddc!) * V_0de0!)   '@1aca8
    GOTO L_1acd8   '@1acc6
L_1acd3:
L_1acd8:
    ' END SUB   '@1acd8
END SUB

SUB S_1ace8   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x1ace8)
    DIM L_BP0e!
    DIM L_BP12!
    ' ---- FUN_1000_ace8 @0x1ace8  (01ace8_FUN_1000_ace8.lift.txt; evidence_id (assembly): ev_f012f22b261e71743a0922a24bbe7fe6a4d57d8730303ad4a896a3de1f0cf812)
    L_BP0e! = V_0e18!   '@1acfa
    IF NOT (FX##(L_BP0e!) <= 0.001000000047497451305389404296875##) THEN GOTO L_1ad3d   '@1ad0a DS:2b30
    V_0e54! = 0.23999999463558197021484375##   '@1ad24 DS:2b34
    GOTO L_1adb8   '@1ad35
L_1ad3d:
    IF NOT (FX##(L_BP0e!) >= 0.001000000047497451305389404296875##) THEN GOTO L_1ad8a   '@1ad3e DS:2b30
    IF NOT (FX##(L_BP0e!) <= 0.014999999664723873138427734375##) THEN GOTO L_1ad8a   '@1ad53 DS:2b38
    V_0e54! = 15.0 * FX##(V_0e18!) + 0.2249999940395355224609375##   '@1ad67 DS:1710,2b3c
    GOTO L_1adb8   '@1ad82
L_1ad8a:
    IF NOT (FX##(L_BP0e!) >= 0.014999999664723873138427734375##) THEN GOTO L_1adb8   '@1ad8b DS:2b38
    V_0e54! = 0.449999988079071044921875##   '@1ad9f DS:2b40
    GOTO L_1adb8   '@1adb0
L_1adb8:
    L_BP12! = V_0ec0!   '@1adb8
    IF NOT (L_BP12! <> 1.0) THEN GOTO L_1adf7   '@1adc8 DS:1640
    IF NOT (L_BP12! = 2.0) THEN GOTO L_1ae15   '@1ade3 DS:1e50
L_1adf7:
    V_0ec4! = FX##(V_0e84!) * V_0e8c!   '@1adf7
    GOTO L_1aee3   '@1ae0d
L_1ae15:
    IF NOT (L_BP12! <> 3.0) THEN GOTO L_1ae3f   '@1ae16 DS:1c42
    IF NOT (L_BP12! = 4.0) THEN GOTO L_1ae62   '@1ae2b DS:1c3a
L_1ae3f:
    V_0ec4! = FX##(V_0e84!) * V_0e8c! / 2.0   '@1ae3f DS:1e50
    GOTO L_1aee3   '@1ae5a
L_1ae62:
    IF NOT (L_BP12! = 5.0) THEN GOTO L_1ae9f   '@1ae63 DS:173a
    V_0ec4! = (FX##(V_0e84!) + V_0e90!) * V_0e8c! / 2.0   '@1ae77 DS:1e50
    GOTO L_1aee3   '@1ae97
L_1ae9f:
    IF NOT (L_BP12! = 10.0) THEN GOTO L_1aee3   '@1aea0 DS:179c
    V_0ec4! = RT_POT##((FX##(V_0e84!)), (2.0)) * 3.141499996185302734375## / 4.0   '@1aeb4 DS:1c3a,1e50,2b44
    GOTO L_1aee3   '@1aedb
L_1aee3:
    V_0e48! = V_0eb0! / (FX##(V_0e84!) * 100.0 * V_0e68!) * V_0e70! * V_0dd8!   '@1aee3 DS:22e2
    V_0e48! = RT_SQR##(1000.0 * FX##(V_0e6c!) * V_0dd8!) * V_0e54! / 1000.0 + V_0e48!   '@1af10 DS:2b48
    V_0e48! = V_0e48! / (1.14999997615814208984375## * V_0e60!) * V_0ec4!   '@1af3d DS:1720
    V_0e48! = FX##(V_0e48!) / V_0de0!   '@1af60
    ' END SUB   '@1af76
END SUB

SUB S_200c9   ' entrada de SUB/FUNCTION (B$ENRA, locais 70 bytes) (0x200c9)
    DIM L_BP0e$
    DIM L_BP12$
    DIM L_BP14%
    DIM L_BP18$
    DIM L_BP1c$
    DIM L_BP20$
    DIM L_BP24$
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    ' ---- FUN_2000_00c9 @0x200c9  (0200c9_FUN_2000_00c9.lift.txt; evidence_id (assembly): ev_b932c76587b1293b86e7d2e4ff9e66ff13bc5cec9abbf5ceca1be91999a60fab)
L_200d6:   ' entrada vinda de 021607_F_21607, 022ee9_F_22ee9
    RT_VIEWPRINT 1, 25   '@200db
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@200ed
    RT_CLS 2   '@20112
    PRINT RT_STRINGC$((80), (205))   '@20120
    PRINT " Dimensionamento de Secoes"   '@20138 DS:2b50
    PRINT RT_STRINGC$((80), (205))   '@20146
    V_0e7c! = 0.0   '@2015e DS:2b6e
    LOCATE 6, 20   '@2016f
    PRINT "1  -  ";   '@2018d DS:2b72
    COLOR RT_CINT%(FX##(V_0dc0!))   '@2019b
    PRINT "S";   '@201b8 DS:2b7c
    COLOR 7   '@201c6
    PRINT "ecao da Viga"   '@201dc DS:2b82
    LOCATE 8, 20   '@201ea
    PRINT "2  -  Momento ";   '@20208 DS:2b92
    COLOR RT_CINT%(FX##(V_0dc0!))   '@20216
    PRINT "F";   '@20233 DS:2ba4
    COLOR 7   '@20241
    PRINT "letor"   '@20257 DS:2baa
    LOCATE 10, 20   '@20265
    PRINT "3  -  Forca ";   '@20283 DS:2bb4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@20291
    PRINT "C";   '@202ae DS:2bc4
    COLOR 7   '@202bc
    PRINT "ortante"   '@202d2 DS:2bca
    LOCATE 12, 20   '@202e0
    PRINT "4  -  Momento ";   '@202fe DS:2bd6
    COLOR RT_CINT%(FX##(V_0dc0!))   '@2030c
    PRINT "T";   '@20329 DS:2be8
    COLOR 7   '@20337
    PRINT "orcor"   '@2034d DS:2bee
    LOCATE 14, 20   '@2035b
    PRINT "5  -  *Retorno ao Menu Principal*"   '@20379 DS:2bf8
    LOCATE 17, 20   '@20387
    PRINT "escolha opcao ";   '@203a5 DS:2c1e
    CALL MIXT_07f1_LimpaTeclado   '@203b3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@203bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12$ = L_BP0e$   '@203d9
    IF NOT (L_BP12$ <> "1") THEN GOTO L_20426   '@203eb DS:2c30
    IF NOT (L_BP12$ <> "S") THEN GOTO L_20426   '@20402 DS:2b7c
    IF NOT (L_BP12$ = "s") THEN GOTO L_20436   '@20414 DS:2c36
L_20426:
    GOTO L_2051a   '@20426
L_20436:
    IF NOT (L_BP12$ <> "2") THEN GOTO L_2046c   '@20436 DS:2c3c
    IF NOT (L_BP12$ <> "F") THEN GOTO L_2046c   '@20448 DS:2ba4
    IF NOT (L_BP12$ = "f") THEN GOTO L_2047c   '@2045a DS:2c42
L_2046c:
    GOTO L_2128b   '@2046c
L_2047c:
    IF NOT (L_BP12$ <> "3") THEN GOTO L_204b2   '@2047c DS:2c48
    IF NOT (L_BP12$ <> "C") THEN GOTO L_204b2   '@2048e DS:2bc4
    IF NOT (L_BP12$ = "c") THEN GOTO L_204c2   '@204a0 DS:2c4e
L_204b2:
    GOTO L_22cee   '@204b2
L_204c2:
    IF NOT (L_BP12$ <> "4") THEN GOTO L_204f8   '@204c2 DS:2c54
    IF NOT (L_BP12$ <> "T") THEN GOTO L_204f8   '@204d4 DS:2be8
    IF NOT (L_BP12$ = "t") THEN GOTO L_20508   '@204e6 DS:2c5a
L_204f8:
    GOTO L_23170   '@204f8
L_20508:
    GOTO L_23d3f   '@20508
L_2051a:
    RT_VIEWPRINT 5, 25   '@2051f
    RT_CLS 2   '@20531
    PRINT " (Secao para Dimensionamento)"   '@2053f DS:2c60
L_20552:
    LOCATE 7, 1   '@20557
    PRINT " Concreto Fck *";   '@20572 DS:2c82
    COLOR RT_CINT%(FX##(V_0dc0!))   '@20580
    PRINT LTRIM$(STR$(V_0e6c!));   '@2059d
    COLOR 7   '@205bb
    PRINT "* "; V_0dcc$;   '@205d1 DS:2c96
    CALL MIXT_07f1_LimpaTeclado   '@205e8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", L_BP0e$   '@205f2 DS:2c9c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) > 0) THEN GOTO L_20676   '@2060c
    IF NOT (VAL(L_BP0e$) <= 0.0#) THEN GOTO L_20657   '@20621 DS:2ca2
    BEEP   '@20645
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20552   '@2064f
L_20657:
    V_0e6c! = VAL(L_BP0e$)   '@20657
L_20676:
L_2067b:
    LOCATE 8, 1   '@20680
    PRINT " Aco      Fyk *";   '@2069b DS:2caa
    COLOR RT_CINT%(FX##(V_0dc0!))   '@206a9
    PRINT LTRIM$(STR$(V_0e70!));   '@206c6
    COLOR 7   '@206e4
    PRINT "* "; V_0dcc$;   '@206fa DS:2c96
    CALL MIXT_07f1_LimpaTeclado   '@20711
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", L_BP0e$   '@2071b DS:2c9c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) <> 0) THEN GOTO L_2079f   '@20735
    IF NOT (VAL(L_BP0e$) <= 0.0#) THEN GOTO L_20780   '@2074a DS:2ca2
    BEEP   '@2076e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2067b   '@20778
L_20780:
    V_0e70! = VAL(L_BP0e$)   '@20780
L_2079f:
L_207a4:
    LOCATE 9, 1   '@207a9
    PRINT " Tipo de Aco  A/B *";   '@207c4 DS:2cbe
    COLOR RT_CINT%(FX##(V_0dc0!))   '@207d2
    PRINT V_0e80$;   '@207ef
    COLOR 7   '@207fd
    CALL MIXT_07f1_LimpaTeclado   '@20813
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", L_BP0e$   '@2081d DS:2c96
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) > 0) THEN GOTO L_208c1   '@20837
    L_BP14% = (UCASE$(L_BP0e$) <> "A")   '@2084c DS:2cd6
    IF NOT ((UCASE$(L_BP0e$) <> "B" AND L_BP14%) <> 0) THEN GOTO L_208a4   '@20873 DS:2cdc
    BEEP   '@20892
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_207a4   '@2089c
L_208a4:
    V_0e80$ = UCASE$(L_BP0e$)   '@208a4
L_208c1:
L_208c6:
    RT_VIEWPRINT 11, 25   '@208cb
    COLOR 7   '@208dd
    RT_CLS 2   '@208f3
    PRINT "     1  -  ";   '@20901 DS:2ce2
    COLOR RT_CINT%(FX##(V_0dc4!))   '@2090f
    PRINT "R";   '@2092c DS:2cf2
    COLOR 7   '@2093a
    PRINT "etangular Te"   '@20950 DS:2cf8
    PRINT "     2  -  ";   '@2095e DS:2d08
    COLOR RT_CINT%(FX##(V_0dc4!))   '@2096c
    PRINT "T";   '@20989 DS:2be8
    COLOR 7   '@20997
    PRINT "riangular"   '@209ad DS:2d18
    PRINT "     3  -  Triangular ";   '@209bb DS:2d26
    COLOR RT_CINT%(FX##(V_0dc4!))   '@209c9
    PRINT "I";   '@209e6 DS:2d40
    COLOR 7   '@209f4
    PRINT "nvertida"   '@20a0a DS:2d46
    PRINT "     4  -  Trape";   '@20a18 DS:2d52
    COLOR RT_CINT%(FX##(V_0dc4!))   '@20a26
    PRINT "z";   '@20a43 DS:2d66
    COLOR 7   '@20a51
    PRINT "oidal"   '@20a67 DS:2d6c
    PRINT "     5  -  ";   '@20a75 DS:2d76
    COLOR RT_CINT%(FX##(V_0dc4!))   '@20a83
    PRINT "C";   '@20aa0 DS:2bc4
    COLOR 7   '@20aae
    PRINT "ircular"   '@20ac4 DS:2d86
    PRINT "           *Retorno*"   '@20ad2 DS:2d92
    PRINT ""   '@20ae0 DS:2daa
    COLOR 7   '@20aee
    PRINT "     Escolha o tipo de secao ";   '@20b04 DS:2dae
    CALL MIXT_07f1_LimpaTeclado   '@20b12
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@20b1c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS 2   '@20b38
    RT_VIEWPRINT 11, 25   '@20b46
    L_BP18$ = L_BP0e$   '@20b58
    IF NOT (L_BP18$ <> "1") THEN GOTO L_20ba5   '@20b6a DS:2c30
    IF NOT (L_BP18$ <> "R") THEN GOTO L_20ba5   '@20b81 DS:2cf2
    IF NOT (L_BP18$ = "r") THEN GOTO L_20bbe   '@20b93 DS:2dd0
L_20ba5:
    V_0ec0! = 2.0   '@20ba5 DS:2dd6
    GOTO L_20d07   '@20bb6
L_20bbe:
    IF NOT (L_BP18$ <> "2") THEN GOTO L_20bf4   '@20bbe DS:2c3c
    IF NOT (L_BP18$ <> "T") THEN GOTO L_20bf4   '@20bd0 DS:2be8
    IF NOT (L_BP18$ = "t") THEN GOTO L_20c0d   '@20be2 DS:2c5a
L_20bf4:
    V_0ec0! = 3.0   '@20bf4 DS:2dda
    GOTO L_20d07   '@20c05
L_20c0d:
    IF NOT (L_BP18$ <> "3") THEN GOTO L_20c43   '@20c0d DS:2c48
    IF NOT (L_BP18$ <> "I") THEN GOTO L_20c43   '@20c1f DS:2d40
    IF NOT (L_BP18$ = "i") THEN GOTO L_20c5c   '@20c31 DS:2dde
L_20c43:
    V_0ec0! = 4.0   '@20c43 DS:2de4
    GOTO L_20d07   '@20c54
L_20c5c:
    IF NOT (L_BP18$ <> "4") THEN GOTO L_20c92   '@20c5c DS:2c54
    IF NOT (L_BP18$ <> "z") THEN GOTO L_20c92   '@20c6e DS:2d66
    IF NOT (L_BP18$ = "Z") THEN GOTO L_20cab   '@20c80 DS:2de8
L_20c92:
    V_0ec0! = 5.0   '@20c92 DS:2dee
    GOTO L_20d07   '@20ca3
L_20cab:
    IF NOT (L_BP18$ <> "5") THEN GOTO L_20ce1   '@20cab DS:2df2
    IF NOT (L_BP18$ <> "C") THEN GOTO L_20ce1   '@20cbd DS:2bc4
    IF NOT (L_BP18$ = "c") THEN GOTO L_20cfa   '@20ccf DS:2c4e
L_20ce1:
    V_0ec0! = 10.0   '@20ce1 DS:2df8
    GOTO L_20d07   '@20cf2
L_20cfa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@20cfa
L_20d07:
    V_0e84! = 0.0   '@20d07 DS:2b6e
    V_0e88! = 0.0   '@20d18 DS:2b6e
    V_0e8c! = 0.0   '@20d29 DS:2b6e
    V_0e90! = 0.0   '@20d3a DS:2b6e
    V_0e94! = 0.0   '@20d4b DS:2b6e
    COLOR 7   '@20d5c
L_20d77:
    LOCATE 12, 1   '@20d7c
    IF NOT (V_0ec0! <= 4.0) THEN GOTO L_20fbe   '@20d97 DS:2de4
    PRINT " B(cm) , H(cm) , d(cm) *RETORNO* ";   '@20db2 DS:2dfc
    CALL MIXT_07f1_LimpaTeclado   '@20dc0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_00ff_Le3Campos(L_BP0e$, L_BP1c$, L_BP20$)   '@20dca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e84! = VAL(L_BP0e$)   '@20de0
    V_0e88! = VAL(L_BP1c$)   '@20dfa
    V_0e8c! = VAL(L_BP20$)   '@20e14
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_20e4b   '@20e2e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_208c6   '@20e43
L_20e4b:
    IF NOT (LEN(L_BP20$) = 0) THEN GOTO L_20e76   '@20e4b
    V_0e8c! = FX##(V_0e88!) - 4.0   '@20e60 DS:2e22
L_20e76:
    IF NOT (V_0e8c! >= V_0e88! OR V_0e84! <= 0.0) THEN GOTO L_20ec6   '@20e76 DS:2b6e
    BEEP   '@20eb4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20d77   '@20ebe
L_20ec6:
L_20ecb:
    IF NOT (V_0ec0! <= 2.0) THEN GOTO L_20fb9   '@20ed0 DS:2dd6
    LOCATE 13, 1   '@20eeb
    PRINT " Bf(cm) , Hf(cm) ";   '@20f06 DS:2e26
    CALL MIXT_07f1_LimpaTeclado   '@20f14
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(L_BP0e$, L_BP1c$)   '@20f1e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e90! = VAL(L_BP0e$)   '@20f30
    V_0e94! = VAL(L_BP1c$)   '@20f4a
    IF NOT (V_0e94! < 0.0 OR V_0e90! < 0.0) THEN GOTO L_20fb4   '@20f64 DS:2b6e
    BEEP   '@20fa2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20ecb   '@20fac
L_20fb4:
L_20fb9:
L_20fbe:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_21146   '@20fbe DS:2dee
    PRINT " Binf(cm) , Bsup(cm) , H(cm) , d(cm) *RETORNO* ";   '@20fd9 DS:2e3c
    CALL MIXT_07f1_LimpaTeclado   '@20fe7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_021e_Le4Campos(L_BP0e$, L_BP1c$, L_BP20$, L_BP24$)   '@20ff1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e84! = VAL(L_BP0e$)   '@2100b
    V_0e90! = VAL(L_BP1c$)   '@21025
    V_0e88! = VAL(L_BP20$)   '@2103f
    V_0e8c! = VAL(L_BP24$)   '@21059
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_21090   '@21073
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_208c6   '@21088
L_21090:
    IF NOT (LEN(L_BP24$) = 0) THEN GOTO L_210bb   '@21090
    V_0e8c! = FX##(V_0e88!) - 4.0   '@210a5 DS:2e22
L_210bb:
    IF NOT (V_0e8c! >= V_0e88! OR (V_0e90! = V_0e84! OR (V_0e90! < 0.0 OR V_0e84! < 0.0))) THEN GOTO L_21141   '@210bb DS:2b6e
    BEEP   '@2112f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20d77   '@21139
L_21141:
L_21146:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_2126d   '@21146 DS:2df8
    PRINT " Diametro(cm) , d(cm) *RETORNO* ";   '@21161 DS:2e70
    CALL MIXT_07f1_LimpaTeclado   '@2116f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(L_BP0e$, L_BP20$)   '@21179
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e84! = VAL(L_BP0e$)   '@2118b
    V_0e88! = V_0e84!   '@211a5
    V_0e8c! = VAL(L_BP20$)   '@211b6
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_211ed   '@211d0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_208c6   '@211e5
L_211ed:
    IF NOT (LEN(L_BP20$) = 0) THEN GOTO L_21218   '@211ed
    V_0e8c! = FX##(V_0e88!) - 4.0   '@21202 DS:2e22
L_21218:
    IF NOT (V_0e8c! >= V_0e88! OR V_0e84! <= 0.0) THEN GOTO L_21268   '@21218 DS:2b6e
    BEEP   '@21256
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20d77   '@21260
L_21268:
L_2126d:
    V_0eb4! = 1.0   '@2126d DS:2e94
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@2127e
L_2128b:
    IF NOT (V_0eb4! = 0.0) THEN GOTO L_212b3   '@21290 DS:2b6e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@212ab
L_212b3:
    GOSUB L_238de   '@212b3
    CALL S_2413f   '@212c0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    PRINT RT_STRINGC$((80), (46))   '@212ca
    IF NOT (V_0ec0! <= 2.0) THEN GOTO L_2134b   '@212e2 DS:2dd6
    BEEP   '@212fd
    LOCATE 16, 1   '@21307
    COLOR 3   '@21322
    PRINT " use sinal negativo (-) para ser considerada somente a secao retangular "   '@21338 DS:2e98
L_2134b:
    RT_VIEWPRINT 17, 25   '@2134b
L_21362:
    RT_CLS 2   '@21367
    COLOR 7   '@21375
    CALL MIXT_07f1_LimpaTeclado   '@2138b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT " Mk("; V_0dd0$; V_0dd4$;   '@21395 DS:2ee4
    CALL MIXT_07f1_LimpaTeclado   '@213b5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT ")  *FIM* ", L_BP0e$   '@213bf DS:2eec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_213f6   '@213d9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@213ee
L_213f6:
    V_0e48! = VAL(L_BP0e$)   '@213f6
    IF NOT (V_0ec0! <= 2.0 AND V_0e48! < 0.0) THEN GOTO L_21495   '@21410 DS:2b6e,2dd6
    L_BP28! = V_0e90!   '@2144e
    L_BP2c! = V_0e94!   '@2145e
    V_0e94! = 0.0   '@2146e DS:2b6e
    V_0e90! = 0.0   '@2147f DS:2b6e
L_21495:
    V_0eac! = ABS(FX##(V_0e48!)) * 100.0   '@21495 DS:2efa
    GOSUB L_2160c   '@214ae
    IF NOT (V_0ec0! <= 2.0 AND V_0e48! < 0.0) THEN GOTO L_2151e   '@214bb DS:2b6e,2dd6
    V_0e90! = L_BP28!   '@214f9
    V_0e94! = L_BP2c!   '@21509
L_2151e:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@2151e
    PRINT USING " Ast=###.## cm2     x/d=#.###"; RT_PU#(V_0eb0!, " Ast=###.## cm2     x/d=#.###", 1); RT_PU#(V_0ea8!, " Ast=###.## cm2     x/d=#.###", 2)   '@2153b DS:2efe
    IF NOT (V_0e54! <> 0.0) THEN GOTO L_215a7   '@21563 DS:2b6e
    PRINT USING " Asc=###.## \ \"; RT_PU#(V_0e54!, " Asc=###.## \ \", 1); "cm2"   '@2157e DS:2f20,2f34
L_215a7:
    COLOR 7   '@215a7
    PRINT ""   '@215bd DS:2daa
    PRINT " Qualquer Tecla para Continuar ";   '@215cb DS:2f3c
    CALL MIXT_07f1_LimpaTeclado   '@215d9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@215e3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21362   '@215ff
    ' ---- F_21607 @0x21607  (021607_F_21607.lift.txt; evidence_id (assembly): ev_aaef6d9135e2627f4895857c70fdc7ba97ff42050e121717b29cf29bf81dcc4e)
L_2160c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0200c9_FUN_2000_00c9
    V_0ea8! = 0.0   '@21611 DS:2b6e
    IF NOT (V_0ec0! <= 2.0) THEN GOTO L_21d9c   '@21622 DS:2dd6
    IF NOT (V_0eac! <= V_0e28! AND FX##(V_0e90!) * V_0e94! <> FX##(0.0)) THEN GOTO L_21793   '@2163d DS:2b6e
    L_BP30! = 0.4000000059604644775390625##   '@21680 DS:2f60
    L_BP34! = -V_0e8c!   '@21690
    L_BP38! = V_0e60! / (0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e90! * 0.800000011920928955078125##) * V_0eac! * V_0de0! * V_0ddc! * V_0e64!   '@216a3 DS:2f64,2f68
    V_0ea8! = (-L_BP34! - RT_SQR##(RT_POT##((FX##(L_BP34!)), (2.0)) - FX##(L_BP30!) * 4.0 * L_BP38!)) / (FX##(L_BP30!) * 2.0 * V_0e8c!)   '@216e3 DS:2dd6,2de4
    V_0eb0! = 0.85000002384185791015625## / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * V_0e6c! * V_0dd8! * V_0e90! * 0.800000011920928955078125## * V_0ea8! * V_0e8c! * V_0e68!   '@2172d DS:2f64,2f68
    V_0e54! = 0.0   '@21773 DS:2b6e
    RETURN   '@21784
L_21793:
    IF NOT (V_0eac! <= V_0e2c! AND FX##(V_0e90!) * V_0e94! <> FX##(0.0) OR V_0eac! <= V_0e20! AND FX##(V_0e90!) * V_0e94! = FX##(0.0)) THEN GOTO L_2196a   '@21793 DS:2b6e
    L_BP30! = 0.4000000059604644775390625##   '@21811 DS:2f60
    L_BP34! = -V_0e8c!   '@21821
    L_BP38! = V_0e60! / (0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.800000011920928955078125##) * V_0eac! * V_0de0! * V_0ddc! * V_0e64! - (FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) / (V_0e84! * 0.800000011920928955078125##) * V_0e94!   '@21834 DS:2dd6,2f64,2f68
    V_0ea8! = (-L_BP34! - RT_SQR##(RT_POT##((FX##(L_BP34!)), (2.0)) - FX##(L_BP30!) * 4.0 * L_BP38!)) / (FX##(L_BP30!) * 2.0 * V_0e8c!)   '@218a8 DS:2dd6,2de4
    V_0eb0! = ((FX##(V_0e90!) - V_0e84!) * V_0e94! + V_0e84! * 0.800000011920928955078125## * V_0ea8! * V_0e8c!) / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e68!   '@218f2 DS:2f64,2f68
    V_0e54! = 0.0   '@2194a DS:2b6e
    RETURN   '@2195b
L_2196a:
    IF NOT (V_0eac! <= V_0e30! AND (V_0eac! > V_0e2c! AND FX##(V_0e90!) * V_0e94! <> FX##(0.0)) OR V_0eac! <= V_0e24! AND (V_0eac! > V_0e20! AND FX##(V_0e90!) * V_0e94! = FX##(0.0))) THEN GOTO L_21b92   '@2196a DS:2b6e
    L_BP30! = 0.4000000059604644775390625##   '@21a1e DS:2f60
    L_BP34! = -V_0e8c!   '@21a2e
    L_BP38! = V_0e60! / (0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.800000011920928955078125##) * V_0eac! * V_0de0! * V_0ddc! * V_0e64! - (FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) / (V_0e84! * 0.800000011920928955078125##) * V_0e94!   '@21a41 DS:2dd6,2f64,2f68
    V_0ea8! = (-L_BP34! - RT_SQR##(RT_POT##((FX##(L_BP34!)), (2.0)) - FX##(L_BP30!) * 4.0 * L_BP38!)) / (FX##(L_BP30!) * 2.0 * V_0e8c!)   '@21ab5 DS:2dd6,2de4
    V_0e58! = 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@21aff DS:2f6c,2f70
    CALL S_25ab5   '@21b1a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = ((FX##(V_0e90!) - V_0e84!) * V_0e94! + V_0e84! * 0.800000011920928955078125## * V_0ea8! * V_0e8c!) / (FX##(V_0e64!) * V_0e54!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@21b24 DS:2f64,2f68
    V_0e54! = 0.0   '@21b72 DS:2b6e
    RETURN   '@21b83
L_21b92:
    IF NOT (V_0eac! > V_0e30! AND FX##(V_0e90!) * V_0e94! <> FX##(0.0) OR V_0eac! > V_0e24! AND FX##(V_0e90!) * V_0e94! = FX##(0.0)) THEN GOTO L_21d97   '@21b92 DS:2b6e
    V_0eb0! = V_0e44!   '@21c10
    IF NOT (FX##(V_0e90!) * V_0e94! = FX##(0.0)) THEN GOTO L_21c52   '@21c21 DS:2b6e
    V_0eb0! = V_0e38!   '@21c41
L_21c52:
    V_0eac! = FX##(V_0eac!) - V_0e30!   '@21c52
    IF NOT (FX##(V_0e90!) * V_0e94! = FX##(0.0)) THEN GOTO L_21ca3   '@21c68 DS:2b6e
    V_0eac! = FX##(V_0eac!) + V_0e30! - V_0e24!   '@21c88
L_21ca3:
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@21ca3 DS:2f6c,2f70
    CALL S_25ab5   '@21cbe
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0! + V_0eb0!   '@21cc8 DS:2dd6
    V_0e58! = ((1.0 + FX##(V_0e14!)) * V_0e8c! - V_0e88!) / (FX##(V_0e14!) * V_0e8c!) * 0.0035000001080334186553955078125##   '@21d04 DS:2e94,2f6c
    CALL S_25ab5   '@21d36
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e54! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0!   '@21d40 DS:2dd6
    V_0ea8! = V_0e14!   '@21d77
    RETURN   '@21d88
L_21d97:
L_21d9c:
    IF NOT (V_0ec0! = 3.0) THEN GOTO L_220d6   '@21d9c DS:2dda
    IF NOT (V_0eac! <= V_0e24!) THEN GOTO L_21f9b   '@21db7
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@21dd2 DS:2f74
    V_0ebc! = 3.0   '@21ded DS:2dda
L_21e03:
L_21e0e:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@21e0e
    L_BP30! = (V_0e8c! - 0.533333361148834228515625## * V_0ea8!) / (FX##(V_0e64!) * V_0e88!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e84! * 0.800000011920928955078125## * V_0ea8! * 0.4000000059604644775390625## * V_0ea8!   '@21e24 DS:2f60,2f68,2f78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e60!) * V_0eac! * V_0ddc! * V_0de0! >= FX##(L_BP30!)) THEN GOTO L_21e0e   '@21e76
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_21ef3   '@21e9f DS:2f7c
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@21eba
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@21ed0 DS:2dd6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21e03   '@21ee6
L_21ef3:
    V_0ea8! = FX##(V_0ea8!) / V_0e8c!   '@21ef3
    V_0e58! = 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@21f09 DS:2f6c,2f70
    CALL S_25ab5   '@21f24
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = RT_POT##((FX##(V_0ea8!) * V_0e8c!), (2.0)) / (FX##(V_0e64!) * V_0e54! * V_0e88!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * 0.3200000226497650146484375## * V_0e84!   '@21f2e DS:2dd6,2f68,2f80
    V_0e54! = 0.0   '@21f7b DS:2b6e
    RETURN   '@21f8c
L_21f9b:
    IF NOT (V_0eac! > V_0e24!) THEN GOTO L_220d1   '@21f9b
    V_0eb0! = V_0e38!   '@21fb6
    V_0eac! = FX##(V_0eac!) - V_0e24!   '@21fc7
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@21fdd DS:2f6c,2f70
    CALL S_25ab5   '@21ff8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0! + V_0eb0!   '@22002 DS:2dd6
    V_0e58! = ((1.0 + FX##(V_0e14!)) * V_0e8c! - V_0e88!) / (FX##(V_0e14!) * V_0e8c!) * 0.0035000001080334186553955078125##   '@2203e DS:2e94,2f6c
    CALL S_25ab5   '@22070
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e54! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0!   '@2207a DS:2dd6
    V_0ea8! = V_0e14!   '@220b1
    RETURN   '@220c2
L_220d1:
L_220d6:
    IF NOT (V_0ec0! = 4.0) THEN GOTO L_22475   '@220d6 DS:2de4
    IF NOT (V_0eac! <= V_0e24!) THEN GOTO L_2233a   '@220f1
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@2210c DS:2f74
    V_0ebc! = 3.0   '@22127 DS:2dda
L_2213d:
L_22148:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@22148
    L_BP30! = V_0e8c! - (0.5 - 0.800000011920928955078125## / (3.0 * FX##(V_0e88!)) * V_0ea8!) / (1.0 - 0.800000011920928955078125## / (2.0 * FX##(V_0e88!)) * V_0ea8!) * 0.800000011920928955078125## * V_0ea8!   '@2215e DS:2dd6,2dda,2e94,2f68,2f84
    L_BP30! = (2.0 - 0.800000011920928955078125## * V_0ea8! / V_0e88!) * L_BP30! * V_0e84! * 0.4000000059604644775390625## * V_0ea8! * 0.85000002384185791015625## * V_0e6c! * V_0dd8! / V_0e64!   '@221bc DS:2dd6,2f60,2f64,2f68
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e60!) * V_0eac! * V_0ddc! * V_0de0! >= FX##(L_BP30!)) THEN GOTO L_22148   '@22205
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_22282   '@2222e DS:2f7c
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@22249
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@2225f DS:2dd6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2213d   '@22275
L_22282:
    V_0ea8! = FX##(V_0ea8!) / V_0e8c!   '@22282
    V_0e58! = 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@22298 DS:2f6c,2f70
    CALL S_25ab5   '@222b3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = (2.0 - 0.800000011920928955078125## * V_0ea8! * V_0e8c! / V_0e88!) / (FX##(V_0e64!) * V_0e54! * 2.0) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e8c! * V_0ea8! * 0.800000011920928955078125## * V_0e84!   '@222bd DS:2dd6,2f64,2f68
    V_0e54! = 0.0   '@2231a DS:2b6e
    RETURN   '@2232b
L_2233a:
    IF NOT (V_0eac! > V_0e24!) THEN GOTO L_22470   '@2233a
    V_0eb0! = V_0e38!   '@22355
    V_0eac! = FX##(V_0eac!) - V_0e24!   '@22366
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@2237c DS:2f6c,2f70
    CALL S_25ab5   '@22397
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0! + V_0eb0!   '@223a1 DS:2dd6
    V_0e58! = ((1.0 + FX##(V_0e14!)) * V_0e8c! - V_0e88!) / (FX##(V_0e14!) * V_0e8c!) * 0.0035000001080334186553955078125##   '@223dd DS:2e94,2f6c
    CALL S_25ab5   '@2240f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e54! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0!   '@22419 DS:2dd6
    V_0ea8! = V_0e14!   '@22450
    RETURN   '@22461
L_22470:
L_22475:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_228c7   '@22475 DS:2dee
    L_BP3c! = 0.800000011920928955078125##   '@22490 DS:2f68
    IF NOT (V_0e90! >= V_0e84!) THEN GOTO L_224cb   '@224a0
    L_BP3c! = 0.85000002384185791015625##   '@224bb DS:2f64
L_224cb:
    IF NOT (V_0eac! <= V_0e24!) THEN GOTO L_2278c   '@224cb
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@224e6 DS:2f74
    V_0ebc! = 3.0   '@22501 DS:2dda
L_22517:
L_22522:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@22522
    L_BP30! = RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) * V_0e90! / 2.0 + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) / (FX##(V_0e88!) * 3.0) * 0.800000011920928955078125## * V_0ea8!   '@22538 DS:2dd6,2dda,2f68
    L_BP30! = L_BP30! / ((2.0 * FX##(V_0e90!) + (FX##(V_0e84!) - V_0e90!) * 0.800000011920928955078125## * V_0ea8! / V_0e88!) * V_0ea8! * 0.800000011920928955078125##) * 2.0   '@225a0 DS:2dd6,2f68
    L_BP30! = (V_0e90! * 0.800000011920928955078125## * V_0ea8! + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0)) / (FX##(V_0e88!) * 2.0)) * (FX##(V_0e8c!) - L_BP30!) * L_BP3c! * V_0e6c! * V_0dd8! / V_0e64!   '@225e7 DS:2dd6,2f68
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e60!) * V_0eac! * V_0ddc! * V_0de0! >= FX##(L_BP30!)) THEN GOTO L_22522   '@22653
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_226d0   '@2267c DS:2f7c
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@22697
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@226ad DS:2dd6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22517   '@226c3
L_226d0:
    V_0ea8! = FX##(V_0ea8!) / V_0e8c!   '@226d0
    V_0e58! = 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@226e6 DS:2f6c,2f70
    CALL S_25ab5   '@22701
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = ((FX##(V_0e84!) - V_0e90!) / (FX##(V_0e88!) * 2.0) * 0.800000011920928955078125## * V_0ea8! * V_0e8c! + V_0e90!) / (FX##(V_0e64!) * V_0e54!) * L_BP3c! * V_0e6c! * V_0dd8! * V_0e8c! * V_0ea8! * 0.800000011920928955078125##   '@2270b DS:2dd6,2f68
    V_0e54! = 0.0   '@2276c DS:2b6e
    RETURN   '@2277d
L_2278c:
    IF NOT (V_0eac! > V_0e24!) THEN GOTO L_228c2   '@2278c
    V_0eb0! = V_0e38!   '@227a7
    V_0eac! = FX##(V_0eac!) - V_0e24!   '@227b8
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@227ce DS:2f6c,2f70
    CALL S_25ab5   '@227e9
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0! + V_0eb0!   '@227f3 DS:2dd6
    V_0e58! = ((1.0 + FX##(V_0e14!)) * V_0e8c! - V_0e88!) / (FX##(V_0e14!) * V_0e8c!) * 0.0035000001080334186553955078125##   '@2282f DS:2e94,2f6c
    CALL S_25ab5   '@22861
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e54! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0!   '@2286b DS:2dd6
    V_0ea8! = V_0e14!   '@228a2
    RETURN   '@228b3
L_228c2:
L_228c7:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_22cdf   '@228c7 DS:2df8
    IF NOT (V_0eac! <= V_0e24!) THEN GOTO L_22ba4   '@228e2
    V_0ea8! = FX##(V_0e14!) * V_0e8c! + 1.5   '@228fd DS:2f74
    V_0ebc! = 3.0   '@22918 DS:2dda
L_2292e:
L_22938:
    V_0ea8! = FX##(V_0ea8!) - V_0ebc!   '@22938
    L_BP40! = ATN(RT_SQR##(-(RT_POT##((0.800000011920928955078125## * V_0ea8!), (2.0))) + V_0e84! * 0.800000011920928955078125## * V_0ea8!) / (FX##(V_0e84!) / 2.0 - 0.800000011920928955078125## * V_0ea8!))   '@2294e DS:2dd6,2f68
    L_BP30! = V_0e8c! - FX##(V_0e84!) / 2.0 + RT_POT##((RT_SIN##(FX##(L_BP40!))), (3.0)) / ((L_BP40! - RT_SIN##(FX##(L_BP40!)) * RT_COS##(FX##(L_BP40!))) * 3.0) * V_0e84!   '@229a8 DS:2dd6,2dda
    L_BP30! = (L_BP40! - RT_SIN##(FX##(L_BP40!)) * RT_COS##(FX##(L_BP40!))) * RT_POT##((FX##(V_0e84!)), (2.0)) / (FX##(V_0e64!) * 4.0) * L_BP30! * 0.800000011920928955078125## * V_0e6c! * V_0dd8!   '@22a0c DS:2dd6,2de4,2f68
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(V_0e60!) * V_0eac! * V_0ddc! * V_0de0! >= FX##(L_BP30!)) THEN GOTO L_22938   '@22a6b
    IF NOT (FX##(V_0ebc!) > 0.0000999999974737875163555145263671875##) THEN GOTO L_22ae8   '@22a94 DS:2f7c
    V_0ea8! = FX##(V_0ea8!) + V_0ebc!   '@22aaf
    V_0ebc! = FX##(V_0ebc!) / 2.0   '@22ac5 DS:2dd6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2292e   '@22adb
L_22ae8:
    V_0ea8! = FX##(V_0ea8!) / V_0e8c!   '@22ae8
    V_0e58! = 0.0035000001080334186553955078125## / V_0ea8! - 0.0035000001080334186553955078125##   '@22afe DS:2f6c,2f70
    CALL S_25ab5   '@22b19
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP40! - RT_SIN##(FX##(L_BP40!)) * RT_COS##(FX##(L_BP40!))) / (FX##(V_0e64!) * V_0e54! * 4.0) * 0.800000011920928955078125## * V_0e6c! * V_0dd8!   '@22b23 DS:2dd6,2de4,2f68
    V_0e54! = 0.0   '@22b84 DS:2b6e
    RETURN   '@22b95
L_22ba4:
    IF NOT (V_0eac! > V_0e24!) THEN GOTO L_22cda   '@22ba4
    V_0eb0! = V_0e38!   '@22bbf
    V_0eac! = FX##(V_0eac!) - V_0e24!   '@22bd0
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@22be6 DS:2f6c,2f70
    CALL S_25ab5   '@22c01
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0eb0! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0! + V_0eb0!   '@22c0b DS:2dd6
    V_0e58! = ((1.0 + FX##(V_0e14!)) * V_0e8c! - V_0e88!) / (FX##(V_0e14!) * V_0e8c!) * 0.0035000001080334186553955078125##   '@22c47 DS:2e94,2f6c
    CALL S_25ab5   '@22c79
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e54! = V_0e60! / ((2.0 * FX##(V_0e8c!) - V_0e88!) * V_0e54!) * V_0eac! * V_0ddc! * V_0de0!   '@22c83 DS:2dd6
    V_0ea8! = V_0e14!   '@22cba
    RETURN   '@22ccb
L_22cda:
L_22cdf:
    RETURN   '@22cdf
L_22cee:   ' entrada vinda de 0200c9_FUN_2000_00c9
    IF NOT (V_0eb4! = 0.0) THEN GOTO L_22d16   '@22cf3 DS:2b6e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@22d0e
L_22d16:
    GOSUB L_238de   '@22d16
    CALL S_23d85   '@22d23
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    PRINT RT_STRINGC$((80), (46))   '@22d2d
L_22d4a:
    RT_VIEWPRINT 16, 25   '@22d4f
    RT_CLS 2   '@22d61
    COLOR 7   '@22d6f
    CALL MIXT_07f1_LimpaTeclado   '@22d85
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT " Vk("; V_0dd0$;   '@22d8f DS:2f88
    CALL MIXT_07f1_LimpaTeclado   '@22da6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT ") *FIM* ", L_BP0e$   '@22db0 DS:2f90
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_22de7   '@22dca
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@22ddf
L_22de7:
    IF NOT (VAL(L_BP0e$) <= 0.0#) THEN GOTO L_22e1d   '@22de7 DS:2ca2
    BEEP   '@22e0b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22d4a   '@22e15
L_22e1d:
    V_0e48! = VAL(L_BP0e$)   '@22e1d
    GOSUB L_22eee   '@22e37
    COLOR RT_CINT%(FX##(V_0dc0!))   '@22e44
    PRINT USING " Ase=###.## cm2/m    Twd=##.## k/cm2"; RT_PU#(V_0eb0!, " Ase=###.## cm2/m    Twd=##.## k/cm2", 1); RT_PU#(V_0e54!, " Ase=###.## cm2/m    Twd=##.## k/cm2", 2)   '@22e61 DS:2f9c
    COLOR 7   '@22e89
    PRINT ""   '@22e9f DS:2daa
    PRINT " Qualquer Tecla para Continuar ";   '@22ead DS:2f3c
    CALL MIXT_07f1_LimpaTeclado   '@22ebb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@22ec5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22d4a   '@22ee1
    ' ---- F_22ee9 @0x22ee9  (022ee9_F_22ee9.lift.txt; evidence_id (assembly): ev_3f866d1af3170b9eb148090ecccc53dee6e30beb2bb6092c58f712b362c3ed5e)
L_22eee:   ' sub-rotina (alvo de GOSUB); entrada vinda de 021607_F_21607
    L_BP44! = V_0e18!   '@22ef3
    IF NOT (FX##(L_BP44!) <= 0.001000000047497451305389404296875##) THEN GOTO L_22f36   '@22f03 DS:2fc4
    V_0e54! = 0.23999999463558197021484375##   '@22f1d DS:2fc8
    GOTO L_22fb1   '@22f2e
L_22f36:
    IF NOT (FX##(L_BP44!) >= 0.001000000047497451305389404296875##) THEN GOTO L_22f83   '@22f37 DS:2fc4
    IF NOT (FX##(L_BP44!) <= 0.014999999664723873138427734375##) THEN GOTO L_22f83   '@22f4c DS:2fcc
    V_0e54! = 15.0 * FX##(V_0e18!) + 0.2249999940395355224609375##   '@22f60 DS:2fd0,2fd4
    GOTO L_22fb1   '@22f7b
L_22f83:
    IF NOT (FX##(L_BP44!) >= 0.014999999664723873138427734375##) THEN GOTO L_22fb1   '@22f84 DS:2fcc
    V_0e54! = 0.449999988079071044921875##   '@22f98 DS:2fd8
    GOTO L_22fb1   '@22fa9
L_22fb1:
    L_BP48! = V_0ec0!   '@22fb1
    IF NOT (L_BP48! <> 1.0) THEN GOTO L_22ff0   '@22fc1 DS:2e94
    IF NOT (L_BP48! = 2.0) THEN GOTO L_2300e   '@22fdc DS:2dd6
L_22ff0:
    V_0ec4! = FX##(V_0e84!) * V_0e8c!   '@22ff0
    GOTO L_230dc   '@23006
L_2300e:
    IF NOT (L_BP48! <> 3.0) THEN GOTO L_23038   '@2300f DS:2dda
    IF NOT (L_BP48! = 4.0) THEN GOTO L_2305b   '@23024 DS:2de4
L_23038:
    V_0ec4! = FX##(V_0e84!) * V_0e8c! / 2.0   '@23038 DS:2dd6
    GOTO L_230dc   '@23053
L_2305b:
    IF NOT (L_BP48! = 5.0) THEN GOTO L_23098   '@2305c DS:2dee
    V_0ec4! = (FX##(V_0e84!) + V_0e90!) * V_0e8c! / 2.0   '@23070 DS:2dd6
    GOTO L_230dc   '@23090
L_23098:
    IF NOT (L_BP48! = 10.0) THEN GOTO L_230dc   '@23099 DS:2df8
    V_0ec4! = RT_POT##((FX##(V_0e84!)), (2.0)) * 3.141499996185302734375## / 4.0   '@230ad DS:2dd6,2de4,2fdc
    GOTO L_230dc   '@230d4
L_230dc:
    V_0eb0! = (1.14999997615814208984375## * V_0e60! * V_0e48! * V_0de0! / V_0ec4! - RT_SQR##(1000.0 * FX##(V_0e6c!) * V_0dd8!) * V_0e54! / 1000.0) / (FX##(V_0e70!) * V_0dd8!) * V_0e84! * 100.0 * V_0e68!   '@230dc DS:2efa,2fe0,2fe4
    V_0e54! = FX##(V_0e60!) * V_0e48! * V_0de0! * 1000.0 / V_0ec4!   '@2313c DS:2fe4
    RETURN   '@23161
L_23170:   ' entrada vinda de 0200c9_FUN_2000_00c9
    IF NOT (V_0eb4! = 0.0) THEN GOTO L_23198   '@23175 DS:2b6e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@23190
L_23198:
    GOSUB L_238de   '@23198
L_231aa:
    LOCATE 8, 1   '@231af
    RT_LINEINPUT " cobrimento + fi/2 (cm) ", L_BP0e$   '@231ca DS:2fe8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = VAL(L_BP0e$)   '@231e4
    IF NOT (FX##(V_0e84!) / 2.0 <= FX##(V_0e48!) OR V_0e48! < 0.0) THEN GOTO L_23253   '@231fe DS:2b6e,2dd6
    BEEP   '@23241
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_231aa   '@2324b
L_23253:
    L_BP4c! = 40.0   '@23253 DS:3004
    IF NOT (0.2199999988079071044921875## * V_0e6c! * V_0dd8! * 1000.0 / V_0e64! < FX##(40.0)) THEN GOTO L_232b6   '@23263 DS:2fe4,3004,3008
    L_BP4c! = 0.2199999988079071044921875## * V_0e6c! * V_0dd8! * 1000.0 / V_0e64!   '@23292 DS:2fe4,3008
L_232b6:
    IF NOT (V_0ec0! <= 2.0) THEN GOTO L_233f4   '@232b6 DS:2dd6
    IF NOT (V_0e84! - 2.0 * FX##(V_0e48!) > 5.0 * FX##(V_0e84!) / 6.0) THEN GOTO L_2336c   '@232d1 DS:2dd6,2dee,300c
    V_0eac! = FX##(V_0e84!) / 6.0   '@23303 DS:300c
    V_0eb0! = (FX##(V_0e88!) - V_0eac!) * (FX##(V_0e84!) - V_0eac!)   '@23319
    V_0e58! = (V_0e84! - 2.0 * FX##(V_0eac!) + V_0e88!) * 2.0   '@2333c DS:2dd6
    GOTO L_233ef   '@23364
L_2336c:
    V_0eac! = (V_0e84! - 2.0 * FX##(V_0e48!)) / 5.0   '@2336c DS:2dd6,2dee
    V_0eb0! = (V_0e84! - 2.0 * FX##(V_0e48!)) * (V_0e88! - 2.0 * FX##(V_0e48!))   '@2338f DS:2dd6
    V_0e58! = (V_0e88! - 4.0 * FX##(V_0e48!) + V_0e84!) * 2.0   '@233c2 DS:2dd6,2de4
L_233ef:
L_233f4:
    IF NOT (V_0ec0! = 5.0 OR (V_0ec0! = 4.0 OR V_0ec0! = 3.0)) THEN GOTO L_23530   '@233f4 DS:2dda,2de4,2dee
    IF NOT (V_0e90! = V_0e84!) THEN GOTO L_23480   '@2344d
    L_BP50! = V_0e84!   '@23468
    GOTO L_234d6   '@23478
L_23480:
    L_BP50! = ATN(V_0e88! / (FX##(V_0e84!) / 2.0 - FX##(V_0e90!) / 2.0))   '@23480 DS:2dd6
    L_BP50! = RT_TAN##(FX##(L_BP50!) / 2.0) * V_0e84!   '@234b1 DS:2dd6
L_234d6:
    V_0eac! = FX##(L_BP50!) / 6.0   '@234d6 DS:300c
    V_0eb0! = RT_POT##((FX##(L_BP50!)), (2.0)) * 3.141499996185302734375## / 4.0   '@234eb DS:2dd6,2de4,2fdc
    V_0e58! = L_BP50! * 3.141499996185302734375## / 2.0   '@23511 DS:2dd6,2fdc
L_23530:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_235b5   '@23530 DS:2df8
    L_BP50! = V_0e84!   '@2354b
    V_0eac! = FX##(L_BP50!) / 6.0   '@2355b DS:300c
    V_0eb0! = RT_POT##((FX##(L_BP50!)), (2.0)) * 3.141499996185302734375## / 4.0   '@23570 DS:2dd6,2de4,2fdc
    V_0e58! = L_BP50! * 3.141499996185302734375## / 2.0   '@23596 DS:2dd6,2fdc
L_235b5:
    V_0e54! = FX##(L_BP4c!) * 2.0 * V_0eb0! * V_0eac! / V_0e60! / 100000.0#   '@235b5 DS:2dd6,3010
    V_0e54! = V_0e54! / (FX##(V_0de0!) * V_0ddc!)   '@235de
    COLOR RT_CINT%(FX##(V_0dc0!))   '@235fc
    PRINT RT_STRINGC$((80), (46))   '@23619
    PRINT USING " Tk(lim)=######.## \   \"; RT_PU#(V_0e54!, " Tk(lim)=######.## \   \", 1); V_0dd0$ + V_0dd4$   '@23631 DS:3018
    PRINT USING " Twu=###.## k/cm2"; RT_PU#(L_BP4c!, " Twu=###.## k/cm2", 1)   '@2365f DS:3034
    PRINT RT_STRINGC$((80), (46))   '@23678
L_23695:
    RT_VIEWPRINT 16, 25   '@2369a
    RT_CLS 2   '@236ac
    COLOR 7   '@236ba
    CALL MIXT_07f1_LimpaTeclado   '@236d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT " Tk("; V_0dd0$; V_0dd4$;   '@236da DS:304a
    CALL MIXT_07f1_LimpaTeclado   '@236fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT ") *FIM* ", L_BP0e$   '@23704 DS:2f90
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(L_BP0e$) = 0) THEN GOTO L_2373b   '@2371e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_200d6   '@23733
L_2373b:
    IF NOT (VAL(L_BP0e$) < 0.0#) THEN GOTO L_23771   '@2373b DS:2ca2
    BEEP   '@2375f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23695   '@23769
L_23771:
    V_0e54! = FX##(VAL(L_BP0e$)) * V_0ddc! * V_0de0!   '@23771
    PRINT USING " Asl=###.## cm2"; RT_PU#(RT_SNG!(V_0e58! / (2.0 * FX##(V_0eb0!) * V_0e70! * V_0dd8!) * V_0e60! * 100.0 * V_0e54! * V_0e68!), " Asl=###.## cm2", 1)   '@2379b DS:2dd6,2efa,3052
    PRINT USING " Ase=###.## cm2/m"; RT_PU#(RT_SNG!(100.0 / (2.0 * FX##(V_0eb0!) * V_0e70! * V_0dd8!) * V_0e60! * 100.0 * V_0e54! * V_0e68!), " Ase=###.## cm2/m", 1)   '@237e8 DS:2dd6,2efa,3066
    PRINT USING " Ttd=###.## k/cm2"; RT_PU#(RT_DBL#(FX##(V_0e60!) * V_0e54! / (FX##(V_0eb0!) * V_0eac! * 2.0#) * 100000.0#), " Ttd=###.## k/cm2", 1)   '@23835 DS:3010,307c,3092
    COLOR 7   '@23879
    PRINT ""   '@2388f DS:2daa
    PRINT " Qualquer Tecla para Continuar ";   '@2389d DS:2f3c
    CALL MIXT_07f1_LimpaTeclado   '@238ab
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@238b5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23695   '@238d1
    ' ---- F_238d9 @0x238d9  (0238d9_F_238d9.lift.txt; evidence_id (assembly): ev_abfe9f43626891e00bdf53cb1345ffb497894ee689fa4052882e65d94c1cfd45)
L_238de:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0200c9_FUN_2000_00c9, 021607_F_21607, 022ee9_F_22ee9
    COLOR 14   '@238e3
    RT_CLS 2   '@238f9
    PRINT RT_STRINGC$((80), (46))   '@23907
    IF NOT (V_0ec0! <= 4.0) THEN GOTO L_23a7d   '@2391f DS:2de4
    L_BP0e$ = "Secao Retangular - Te"   '@2393a DS:309a
    IF NOT (V_0ec0! = 3.0) THEN GOTO L_23979   '@2394c DS:2dda
    L_BP0e$ = "Secao Triangular"   '@23967 DS:30b4
L_23979:
    IF NOT (V_0ec0! = 4.0) THEN GOTO L_239a6   '@23979 DS:2de4
    L_BP0e$ = "Secao Triangular Invertida"   '@23994 DS:30c8
L_239a6:
    PRINT L_BP0e$   '@239a6
    L_BP0e$ = "B=###.# cm    H=####.# cm    d=####.# cm"   '@239b4 DS:30e6
    PRINT USING L_BP0e$; RT_PU#(V_0e84!, L_BP0e$, 1); RT_PU#(V_0e88!, L_BP0e$, 2); RT_PU#(V_0e8c!, L_BP0e$, 3)   '@239c6
    IF NOT (V_0e94! > 0.0 AND V_0e90! > 0.0) THEN GOTO L_23a78   '@239fb DS:2b6e
    L_BP0e$ = "Bf=###.# cm   Hf=####.# cm"   '@23a39 DS:3112
    PRINT USING L_BP0e$; RT_PU#(V_0e90!, L_BP0e$, 1); RT_PU#(V_0e94!, L_BP0e$, 2)   '@23a4b
L_23a78:
L_23a7d:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_23b1f   '@23a7d DS:2dee
    PRINT "Secao Trapezoidal"   '@23a98 DS:3130
    L_BP0e$ = "Binf=###.# cm  H=####.# cm  d=####.# cm"   '@23aa6 DS:3146
    PRINT USING L_BP0e$; RT_PU#(V_0e84!, L_BP0e$, 1); RT_PU#(V_0e88!, L_BP0e$, 2); RT_PU#(V_0e8c!, L_BP0e$, 3)   '@23ab8
    L_BP0e$ = "Bsup=###.# cm  "   '@23aed DS:3172
    PRINT USING L_BP0e$; RT_PU#(V_0e90!, L_BP0e$, 1)   '@23aff
L_23b1f:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_23b87   '@23b1f DS:2df8
    PRINT "Secao Circular"   '@23b3a DS:3186
    L_BP0e$ = "Diametro=####.# cm           d=####.# cm"   '@23b48 DS:3198
    PRINT USING L_BP0e$; RT_PU#(V_0e84!, L_BP0e$, 1); RT_PU#(V_0e8c!, L_BP0e$, 2)   '@23b5a
L_23b87:
    L_BP0e$ = "Fck=#.### \   \"   '@23b87 DS:31c4
    IF NOT (V_0e6c! >= 10.0) THEN GOTO L_23bc6   '@23b99 DS:2df8
    L_BP0e$ = "Fck=####.# \   \"   '@23bb4 DS:31d8
L_23bc6:
    PRINT USING L_BP0e$; RT_PU#(V_0e6c!, L_BP0e$, 1); V_0dcc$   '@23bc6
    L_BP0e$ = "Fyk=#.### \   \ do Tipo \\"   '@23bea DS:31ec
    IF NOT (V_0e70! >= 10.0) THEN GOTO L_23c29   '@23bfc DS:2df8
    L_BP0e$ = "Fyk=####.# \   \ do Tipo \\"   '@23c17 DS:320a
L_23c29:
    PRINT USING L_BP0e$; RT_PU#(V_0e70!, L_BP0e$, 1); V_0dcc$; V_0e80$   '@23c29
    IF NOT (FX##(V_0e68!) <> 1.14999997615814208984375## OR (FX##(V_0e64!) <> 1.39999997615814208984375## OR FX##(V_0e60!) <> 1.39999997615814208984375##)) THEN GOTO L_23cfb   '@23c56 DS:2fe0,322a
    PRINT " coeficientes de seguranca    forcas "; V_0e60!; "   concreto "; V_0e64!; "   aco "; V_0e68!   '@23caf DS:322e,3258,3268
L_23cfb:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@23cfb
    PRINT RT_STRINGC$((80), (46))   '@23d18
    RETURN   '@23d30
L_23d3f:   ' entrada vinda de 0200c9_FUN_2000_00c9
    ' @23d3f libera strings locais (L_BP18)
    ' @23d48 libera strings locais (L_BP12)
    ' @23d51 libera strings locais (L_BP0e)
    ' @23d5a libera strings locais (L_BP1c)
    ' @23d63 libera strings locais (L_BP20)
    ' @23d6c libera strings locais (L_BP24)
    ' END SUB   '@23d75
END SUB

SUB S_23d85   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x23d85)
    DIM L_BP0e!
    DIM L_BP12$
    ' ---- FUN_2000_3d85 @0x23d85  (023d85_FUN_2000_3d85.lift.txt; evidence_id (assembly): ev_fd485b8d97b120746110bf28c7b15579fa21e503b3c386965d442664fdf1945c)
    L_BP0e! = V_0ec0!   '@23d97
    IF NOT (L_BP0e! <> 1.0) THEN GOTO L_23dd6   '@23da7 DS:2e94
    IF NOT (L_BP0e! = 2.0) THEN GOTO L_23df4   '@23dc2 DS:2dd6
L_23dd6:
    V_0eb0! = 0.14000000059604644775390625## * V_0e84!   '@23dd6 DS:3274
    GOTO L_23eb1   '@23dec
L_23df4:
    IF NOT (L_BP0e! <> 3.0) THEN GOTO L_23e1e   '@23df5 DS:2dda
    IF NOT (L_BP0e! = 4.0) THEN GOTO L_23e41   '@23e0a DS:2de4
L_23e1e:
    V_0eb0! = 0.14000000059604644775390625## * V_0e84! / 2.0   '@23e1e DS:2dd6,3274
    GOTO L_23eb1   '@23e39
L_23e41:
    IF NOT (L_BP0e! = 5.0) THEN GOTO L_23e7e   '@23e42 DS:2dee
    V_0eb0! = (FX##(V_0e90!) + V_0e84!) * 0.14000000059604644775390625## / 2.0   '@23e56 DS:2dd6,3274
    GOTO L_23eb1   '@23e76
L_23e7e:
    IF NOT (L_BP0e! = 10.0) THEN GOTO L_23eb1   '@23e7f DS:2df8
    V_0eb0! = 0.14000000059604644775390625## * V_0e84!   '@23e93 DS:3274
    GOTO L_23eb1   '@23ea9
L_23eb1:
    CALL S_1ace8   '@23eb1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e4c! = V_0e48!   '@23ebb
    L_BP12$ = " \        \########.## \\"   '@23ecc DS:3278
    PRINT USING L_BP12$; "VK (min) ="; RT_PU#(V_0e48!, L_BP12$, 1); V_0dd0$   '@23ede DS:3296
    IF NOT (V_0dd8! / (4.0 * FX##(V_0e64!)) * V_0e6c! <= 0.04500000178813934326171875##) THEN GOTO L_23f6d   '@23f0b DS:2de4,32a4
    V_0e50! = V_0dd8! / (4.0 * FX##(V_0e64!) * V_0e60!) * V_0e6c! * V_0ec4!   '@23f38 DS:2de4
    GOTO L_23f8d   '@23f65
L_23f6d:
    V_0e50! = 0.04500000178813934326171875## * V_0ec4! / V_0e60!   '@23f6d DS:32a4
L_23f8d:
    V_0e50! = FX##(V_0e50!) / V_0de0!   '@23f8d
    PRINT USING L_BP12$; "VK (max) ="; RT_PU#(V_0e50!, L_BP12$, 1); V_0dd0$   '@23fa3 DS:32a8
    PRINT " @1="; RT_SNG!(100.0 * FX##(V_0e18!)); " %"   '@23fd0 DS:2efa,32b6,32be
    IF NOT (V_0e7c! = 0.0) THEN GOTO L_24023   '@24000 DS:2b6e
    GOTO L_24126   '@2401b
L_24023:
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS RT_STRINGC$((40), (46)): RT_LPFIM   '@24023 DS:2daa
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP12$; "VK (min) ="; RT_PU#(V_0e48!, L_BP12$, 1); V_0dd0$: RT_LPTQUEBRA 0   '@24052 DS:2daa,3296
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP12$; "VK (max) ="; RT_PU#(V_0e50!, L_BP12$, 1); V_0dd0$: RT_LPTQUEBRA 0   '@24096 DS:2daa,32a8
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS " @1=": RT_LPS STR$(RT_SNG!(100.0 * FX##(V_0e18!))) + " ": RT_LPS " %": RT_LPFIM   '@240da DS:2daa,2efa,32b6,32be
L_24126:
    ' @24126 libera strings locais (L_BP12)
    ' END SUB   '@2412f
END SUB

SUB S_2413f   ' entrada de SUB/FUNCTION (B$ENRA, locais 12 bytes) (0x2413f)
    DIM L_BP0e$
    DIM L_BP12!
    DIM L_BP16!
    ' ---- FUN_2000_413f @0x2413f  (02413f_FUN_2000_413f.lift.txt; evidence_id (assembly): ev_688ac1e336a04bff44745cae48e0e4f22e8de0983e0f310aa799b270f76ae68b)
    V_0e1c! = INT(1000.0 / ((V_0dd8! / (2.099999904632568359375## * V_0e68!) * V_0e70! - (V_0e80$ = "B") * 2) / 3.5 + 1.0)) / 1000.0   '@24151 DS:2cdc,2e94,2fe4,32c4,32c8
    V_0e34! = 0.0   '@241af DS:2b6e
    V_0e38! = 0.0   '@241c0 DS:2b6e
    V_0e3c! = 0.0   '@241d1 DS:2b6e
    V_0e40! = 0.0   '@241e2 DS:2b6e
    V_0e44! = 0.0   '@241f3 DS:2b6e
    L_BP0e$ = " \        \########.## \ \"   '@24204 DS:32cc
    IF NOT (V_0ec0! = 2.0 OR V_0ec0! = 1.0) THEN GOTO L_248da   '@24216 DS:2dd6,2e94
    V_0e34! = 0.85000002384185791015625## / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * V_0e6c! * V_0dd8! * V_0e68! * V_0e84! * 0.800000011920928955078125## * V_0e1c! * V_0e8c!   '@24254 DS:2f64,2f68
    V_0e20! = RT_POT##((FX##(V_0e8c!)), (2.0)) * (1.0 - 0.4000000059604644775390625## * V_0e1c!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * 0.800000011920928955078125## * V_0e84! * V_0e1c!   '@2429a DS:2dd6,2e94,2f60,2f64,2f68
    V_0e20! = V_0e20! / (FX##(V_0ddc!) * V_0de0!)   '@242f7
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@24315 DS:2f6c,2f70
    CALL S_25ab5   '@24330
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e38! = 0.85000002384185791015625## / (FX##(V_0e64!) * V_0e54!) * V_0e6c! * V_0dd8! * V_0e84! * 0.800000011920928955078125## * V_0e14! * V_0e8c!   '@2433a DS:2f64,2f68
    V_0e24! = RT_POT##((FX##(V_0e8c!)), (2.0)) * (1.0 - 0.4000000059604644775390625## * V_0e14!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.800000011920928955078125## * V_0e14!   '@24376 DS:2dd6,2e94,2f60,2f64,2f68
    V_0e24! = V_0e24! / (FX##(V_0ddc!) * V_0de0!)   '@243d3
    V_0e3c! = 0.85000002384185791015625## / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * V_0e6c! * V_0dd8! * V_0e90! * V_0e94! * V_0e68!   '@243f1 DS:2f64
    V_0e28! = (V_0e8c! - FX##(V_0e94!) / 2.0) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e90! * V_0e94!   '@2442d DS:2dd6,2f64
    V_0e28! = V_0e28! / (FX##(V_0ddc!) * V_0de0!)   '@24471
    V_0e40! = ((FX##(V_0e90!) - V_0e84!) * V_0e94! + V_0e84! * 0.800000011920928955078125## * V_0e1c! * V_0e8c!) / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e68!   '@2448f DS:2f64,2f68
    V_0e2c! = ((FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) * V_0e94! + RT_POT##((FX##(V_0e8c!)), (2.0)) * (1.0 - 0.4000000059604644775390625## * V_0e1c!) * V_0e84! * 0.800000011920928955078125## * V_0e1c!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@244e7 DS:2dd6,2e94,2f60,2f64,2f68
    V_0e2c! = V_0e2c! / (FX##(V_0ddc!) * V_0de0!)   '@2456b
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@24589 DS:2f6c,2f70
    CALL S_25ab5   '@245a4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e44! = ((FX##(V_0e90!) - V_0e84!) * V_0e94! + V_0e84! * 0.800000011920928955078125## * V_0e14! * V_0e8c!) / (FX##(V_0e64!) * V_0e54!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@245ae DS:2f64,2f68
    V_0e30! = (RT_POT##((FX##(V_0e8c!)), (2.0)) * (1.0 - 0.4000000059604644775390625## * V_0e14!) * V_0e84! * 0.800000011920928955078125## * V_0e14! + (FX##(V_0e90!) - V_0e84!) * (V_0e8c! - FX##(V_0e94!) / 2.0) * V_0e94!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8!   '@245fc DS:2dd6,2e94,2f60,2f64,2f68
    V_0e30! = V_0e30! / (FX##(V_0ddc!) * V_0de0!)   '@24680
    PRINT USING L_BP0e$; "Mk(ret)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@2469e DS:2efa,32ea
    IF NOT (V_0e94! > 0.0) THEN GOTO L_24787   '@246e1 DS:2b6e
    PRINT USING L_BP0e$; "Mk(fla)  ="; RT_PU#(RT_SNG!(FX##(V_0e28!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@246fc DS:2efa,32f8
    PRINT USING L_BP0e$; "Mk(sec)  ="; RT_PU#(RT_SNG!(FX##(V_0e30!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@2473f DS:2efa,3306
L_24787:
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_248d5   '@24787 DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(ret)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@247a2 DS:2daa,2efa,32ea
    IF NOT (V_0e94! > 0.0) THEN GOTO L_248d0   '@247fc DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(fla)  ="; RT_PU#(RT_SNG!(FX##(V_0e28!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@24817 DS:2daa,2efa,32f8
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(sec)  ="; RT_PU#(RT_SNG!(FX##(V_0e30!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@24871 DS:2daa,2efa,3306
L_248d0:
L_248d5:
L_248da:
    IF NOT (V_0ec0! = 3.0) THEN GOTO L_24b94   '@248da DS:2dda
    V_0e34! = RT_POT##((FX##(V_0e1c!) * V_0e8c!), (2.0)) / (FX##(V_0e64!) * V_0e70! * V_0dd8! * V_0e88!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e68! * 0.3200000226497650146484375## * V_0e84!   '@248f5 DS:2dd6,2f68,2f80
    V_0e20! = RT_POT##((0.800000011920928955078125## * V_0e1c! * V_0e8c!), (2.0)) * (V_0e8c! - 0.533333361148834228515625## * V_0e1c! * V_0e8c!) / (FX##(V_0e64!) * 2.0 * V_0e88! * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e84!   '@2494c DS:2dd6,2f68,2f78
    V_0e20! = V_0e20! / (FX##(V_0ddc!) * V_0de0!)   '@249b8
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@249d6 DS:2f6c,2f70
    CALL S_25ab5   '@249f1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e38! = RT_POT##((FX##(V_0e14!) * V_0e8c!), (2.0)) / (FX##(V_0e64!) * V_0e88! * V_0e54!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * 0.3200000226497650146484375## * V_0e84!   '@249fb DS:2dd6,2f68,2f80
    V_0e24! = RT_POT##((0.800000011920928955078125## * V_0e14! * V_0e8c!), (2.0)) * (V_0e8c! - 0.533333361148834228515625## * V_0e14! * V_0e8c!) / (FX##(V_0e64!) * 2.0 * V_0e88! * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e84!   '@24a48 DS:2dd6,2f68,2f78
    V_0e24! = V_0e24! / (FX##(V_0ddc!) * V_0de0!)   '@24ab4
    PRINT USING L_BP0e$; "Mk(tri)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@24ad2 DS:2efa,3314
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_24b8f   '@24b15 DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(tri)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@24b30 DS:2daa,2efa,3314
L_24b8f:
L_24b94:
    IF NOT (V_0ec0! = 4.0) THEN GOTO L_24f22   '@24b94 DS:2de4
    V_0e34! = (2.0 - 0.800000011920928955078125## * V_0e1c! * V_0e8c! / V_0e88!) / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e68! * V_0e84! * 0.4000000059604644775390625## * V_0e1c! * V_0e8c!   '@24baf DS:2dd6,2f60,2f64,2f68
    V_0e20! = V_0e8c! - (0.5 - 0.800000011920928955078125## / (3.0 * FX##(V_0e88!)) * V_0e1c! * V_0e8c!) / (1.0 - 0.800000011920928955078125## / (2.0 * FX##(V_0e88!)) * V_0e1c! * V_0e8c!) * 0.800000011920928955078125## * V_0e1c! * V_0e8c!   '@24c11 DS:2dd6,2dda,2e94,2f68,2f84
    V_0e20! = (2.0 - 0.800000011920928955078125## * V_0e1c! * V_0e8c! / V_0e88!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.4000000059604644775390625## * V_0e1c! * V_0e8c! * V_0e20!   '@24c7f DS:2dd6,2f60,2f64,2f68
    V_0e20! = V_0e20! / (FX##(V_0ddc!) * V_0de0!)   '@24cdc
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@24cfa DS:2f6c,2f70
    CALL S_25ab5   '@24d15
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e38! = (2.0 - 0.800000011920928955078125## * V_0e14! * V_0e8c! / V_0e88!) / (FX##(V_0e64!) * V_0e54!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.4000000059604644775390625## * V_0e14! * V_0e8c!   '@24d1f DS:2dd6,2f60,2f64,2f68
    V_0e24! = V_0e8c! - (0.5 - 0.800000011920928955078125## / (3.0 * FX##(V_0e88!)) * V_0e14! * V_0e8c!) / (1.0 - 0.800000011920928955078125## / (2.0 * FX##(V_0e88!)) * V_0e14! * V_0e8c!) * 0.800000011920928955078125## * V_0e14! * V_0e8c!   '@24d77 DS:2dd6,2dda,2e94,2f68,2f84
    V_0e24! = (2.0 - 0.800000011920928955078125## * V_0e14! * V_0e8c! / V_0e88!) / (FX##(V_0e64!) * V_0e60!) * 0.85000002384185791015625## * V_0e6c! * V_0dd8! * V_0e84! * 0.4000000059604644775390625## * V_0e14! * V_0e8c! * V_0e24!   '@24de5 DS:2dd6,2f60,2f64,2f68
    V_0e24! = V_0e24! / (FX##(V_0ddc!) * V_0de0!)   '@24e42
    PRINT USING L_BP0e$; "Mk(itr)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@24e60 DS:2efa,3322
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_24f1d   '@24ea3 DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(itr)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@24ebe DS:2daa,2efa,3322
L_24f1d:
L_24f22:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_253b7   '@24f22 DS:2dee
    L_BP12! = 0.800000011920928955078125##   '@24f3d DS:2f68
    IF NOT (V_0e84! <= V_0e90!) THEN GOTO L_24f78   '@24f4d
    L_BP12! = 0.85000002384185791015625##   '@24f68 DS:2f64
L_24f78:
    V_0e34! = ((FX##(V_0e84!) - V_0e90!) / (FX##(V_0e88!) * 2.0) * 0.800000011920928955078125## * V_0e1c! * V_0e8c! + V_0e90!) / (FX##(V_0e64!) * V_0e70! * V_0dd8!) * L_BP12! * V_0e6c! * V_0dd8! * V_0e68! * V_0e8c! * V_0e1c! * 0.800000011920928955078125##   '@24f78 DS:2dd6,2f68
    V_0e20! = (V_0e90! * 0.800000011920928955078125## * V_0e1c! * V_0e8c! + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0e1c! * V_0e8c!), (2.0)) / (FX##(V_0e88!) * 2.0)) * L_BP12! * V_0e6c! * V_0dd8! / V_0e64!   '@24fe3 DS:2dd6,2f68
    V_0e20! = (V_0e8c! - (RT_POT##((0.800000011920928955078125## * V_0e1c! * V_0e8c!), (2.0)) * V_0e90! / 2.0 + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0e1c! * V_0e8c!), (3.0)) / (FX##(V_0e88!) * 3.0)) / ((2.0 * FX##(V_0e90!) + (FX##(V_0e84!) - V_0e90!) * 0.800000011920928955078125## * V_0e1c! * V_0e8c! / V_0e88!) * V_0e8c! * V_0e1c! * 0.800000011920928955078125##) * 2.0) * V_0e20! / V_0e60!   '@2504e DS:2dd6,2dda,2f68
    V_0e20! = V_0e20! / (FX##(V_0ddc!) * V_0de0!)   '@2510b
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@25129 DS:2f6c,2f70
    CALL S_25ab5   '@25144
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e38! = ((FX##(V_0e84!) - V_0e90!) / (FX##(V_0e88!) * 2.0) * 0.800000011920928955078125## * V_0e14! * V_0e8c! + V_0e90!) / (FX##(V_0e64!) * V_0e54!) * L_BP12! * V_0e6c! * V_0dd8! * V_0e8c! * V_0e14! * 0.800000011920928955078125##   '@2514e DS:2dd6,2f68
    V_0e24! = (V_0e90! * 0.800000011920928955078125## * V_0e14! * V_0e8c! + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0e14! * V_0e8c!), (2.0)) / (FX##(V_0e88!) * 2.0)) * L_BP12! * V_0e6c! * V_0dd8! / V_0e64!   '@251af DS:2dd6,2f68
    V_0e24! = (V_0e8c! - (RT_POT##((0.800000011920928955078125## * V_0e14! * V_0e8c!), (2.0)) * V_0e90! / 2.0 + (FX##(V_0e84!) - V_0e90!) * RT_POT##((0.800000011920928955078125## * V_0e14! * V_0e8c!), (3.0)) / (FX##(V_0e88!) * 3.0)) / ((2.0 * FX##(V_0e90!) + (FX##(V_0e84!) - V_0e90!) * 0.800000011920928955078125## * V_0e14! * V_0e8c! / V_0e88!) * V_0e8c! * V_0e14! * 0.800000011920928955078125##) * 2.0) * V_0e24! / V_0e60!   '@2521a DS:2dd6,2dda,2f68
    V_0e24! = V_0e24! / (FX##(V_0ddc!) * V_0de0!)   '@252d7
    PRINT USING L_BP0e$; "Mk(tpz)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@252f5 DS:2efa,3330
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_253b2   '@25338 DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(tpz)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@25353 DS:2daa,2efa,3330
L_253b2:
L_253b7:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_2581e   '@253b7 DS:2df8
    L_BP16! = ATN(RT_SQR##(-(RT_POT##((0.800000011920928955078125## * V_0e1c! * V_0e8c!), (2.0))) + 0.800000011920928955078125## * V_0e1c! * V_0e8c! * V_0e84!) / (FX##(V_0e84!) / 2.0 - 0.800000011920928955078125## * V_0e1c! * V_0e8c!))   '@253d2 DS:2dd6,2f68
    V_0e34! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) / (FX##(V_0e64!) * V_0e70! * V_0dd8! * 4.0) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e68!   '@2543b DS:2dd6,2de4,2f68
    V_0e20! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * (V_0e8c! - FX##(V_0e84!) / 2.0 + RT_POT##((RT_SIN##(FX##(L_BP16!))), (3.0)) / ((L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * 3.0) * V_0e84!) / (FX##(V_0e64!) * 4.0 * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8!   '@254a6 DS:2dd6,2dda,2de4,2f68
    V_0e20! = V_0e20! / (FX##(V_0ddc!) * V_0de0!)   '@25563
    V_0e58! = 0.0035000001080334186553955078125## / V_0e14! - 0.0035000001080334186553955078125##   '@25581 DS:2f6c,2f70
    CALL S_25ab5   '@2559c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP16! = ATN(RT_SQR##(-(RT_POT##((0.800000011920928955078125## * V_0e14! * V_0e84!), (2.0))) + RT_POT##((FX##(V_0e84!)), (2.0)) * 0.800000011920928955078125## * V_0e14!) / (FX##(V_0e84!) / 2.0 - 0.800000011920928955078125## * V_0e14! * V_0e84!))   '@255a6 DS:2dd6,2f68
    V_0e38! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) / (FX##(V_0e64!) * V_0e70! * V_0dd8! * 4.0) * 0.800000011920928955078125## * V_0e6c! * V_0dd8! * V_0e68!   '@25616 DS:2dd6,2de4,2f68
    V_0e24! = RT_POT##((FX##(V_0e84!)), (2.0)) * (L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * (V_0e8c! - FX##(V_0e84!) / 2.0 + RT_POT##((RT_SIN##(FX##(L_BP16!))), (3.0)) / ((L_BP16! - RT_SIN##(FX##(L_BP16!)) * RT_COS##(FX##(L_BP16!))) * 3.0) * V_0e84!) / (FX##(V_0e64!) * 4.0 * V_0e60!) * 0.800000011920928955078125## * V_0e6c! * V_0dd8!   '@25681 DS:2dd6,2dda,2de4,2f68
    V_0e24! = V_0e24! / (FX##(V_0ddc!) * V_0de0!)   '@2573e
    PRINT USING L_BP0e$; "Mk(cir)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@2575c DS:2efa,333e
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_25819   '@2579f DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(cir)  ="; RT_PU#(RT_SNG!(FX##(V_0e24!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@257ba DS:2daa,2efa,333e
L_25819:
L_2581e:
    V_0e5c! = 0.1500000059604644775390625## * V_0e84! * V_0e88! / 100.0   '@2581e DS:2efa,334c
    V_0eb8! = 2.0   '@2583e DS:2dd6
    IF NOT (V_0ec0! = 4.0 OR V_0ec0! = 3.0) THEN GOTO L_258a3   '@2584f DS:2dda,2de4
    V_0e5c! = FX##(V_0e5c!) / 2.0   '@2588d DS:2dd6
L_258a3:
    IF NOT (V_0ec0! = 5.0) THEN GOTO L_258e3   '@258a3 DS:2dee
    V_0e5c! = (FX##(V_0e84!) + V_0e90!) * 0.1500000059604644775390625## * V_0e88! / 200.0   '@258be DS:334c,3350
L_258e3:
    IF NOT (V_0ec0! = 10.0) THEN GOTO L_25925   '@258e3 DS:2df8
    V_0e5c! = RT_POT##((FX##(V_0e84!)), (2.0)) * 0.4712400138378143310546875## / 400.0   '@258fe DS:2dd6,3354,3358
L_25925:
    V_0eb0! = V_0e5c!   '@25925
    CALL S_19857   '@25936
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    PRINT USING L_BP0e$; "Mk(min)  ="; RT_PU#(RT_SNG!(FX##(V_0eac!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$   '@25940 DS:2efa,335c
    PRINT " x/d(3-4) ="; V_0e1c!   '@25983 DS:336a
    PRINT " x/d(lim) ="; V_0e14!   '@2599e DS:337a
    IF NOT (V_0e7c! > 0.0) THEN GOTO L_25a97   '@259b9 DS:2b6e
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": PRINT #RT_LPT, USING L_BP0e$; "Mk(min)  ="; RT_PU#(RT_SNG!(FX##(V_0eac!) / 100.0), L_BP0e$, 1); V_0dd0$ + V_0dd4$: RT_LPTQUEBRA 0   '@259d4 DS:2daa,2efa,335c
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS " x/d(3-4) =": RT_LPS STR$(V_0e1c!) + " ": RT_LPFIM   '@25a2e DS:2daa,336a
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS " x/d(lim) =": RT_LPS STR$(V_0e14!) + " ": RT_LPFIM   '@25a60 DS:2daa,337a
L_25a97:
    ' @25a97 libera strings locais (L_BP0e)
    ' END SUB   '@25aa5
END SUB

SUB S_25ab5   ' entrada de SUB/FUNCTION (B$ENRA, locais 2 bytes) (0x25ab5)
    DIM L_BP0c%
    ' ---- FUN_2000_5ab5 @0x25ab5  (025ab5_FUN_2000_5ab5.lift.txt; evidence_id (assembly): ev_df0d1faa4b7d017837f80f3b61d270b40aca99b0a1078b3bf946cdf92f9800a2)
    L_BP0c% = (0.699999988079071044921875## / (FX##(V_0e68!) * 2100.0) * V_0e70! * V_0dd8! >= FX##(V_0e58!) AND V_0e80$ = "B")   '@25ac7 DS:2cdc,338a,338e
    IF NOT ((V_0dd8! / (FX##(V_0e68!) * 2100.0) * V_0e70! >= FX##(V_0e58!) AND V_0e80$ = "A" OR L_BP0c%) <> 0) THEN GOTO L_25b88   '@25b1e DS:2cd6,338e
    V_0e54! = FX##(V_0e58!) * 2100.0 / V_0e68!   '@25b60 DS:338e
    GOTO L_25d84   '@25b7b
L_25b88:
    IF NOT (V_0dd8! / (FX##(V_0e68!) * 2100.0) * V_0e70! - (V_0e80$ = "B") * 0.00200000009499490261077880859375## < FX##(V_0e58!)) THEN GOTO L_25bfd   '@25b88 DS:2cdc,338e,3392
    V_0e54! = FX##(V_0dd8!) * V_0e70! / V_0e68!   '@25bd5
    GOTO L_25d84   '@25bf0
L_25bfd:
    V_0e54! = 0.000476190471090376377105712890625## - 1.39999997615814208984375## / (45.0 * FX##(V_0e70!) * V_0dd8!) * V_0e68!   '@25bfd DS:322a,3396,339a
    IF NOT (RT_POT##((FX##(V_0e68!)), (2.0)) * (RT_POT##((0.699999988079071044921875##), (2.0)) / 45.0 - V_0e58!) / (RT_POT##((FX##(V_0dd8!) * V_0e70!), (2.0)) * 45.0) * 4.0 > RT_POT##((FX##(V_0e54!)), (2.0))) THEN GOTO L_25cba   '@25c2d DS:2dd6,2de4,338a,339a
    V_0e54! = -1.0   '@25ca1 DS:339e
    GOTO L_25d84   '@25cb2
L_25cba:
    V_0e54! = -V_0e54! + RT_SQR##(RT_POT##((FX##(V_0e54!)), (2.0)) - RT_POT##((FX##(V_0e68!)), (2.0)) * (RT_POT##((0.699999988079071044921875##), (2.0)) / 45.0 - V_0e58!) / (RT_POT##((FX##(V_0dd8!) * V_0e70!), (2.0)) * 45.0) * 4.0)   '@25cba DS:2dd6,2de4,338a,339a
    V_0e54! = RT_POT##((FX##(V_0dd8!) * V_0e70!), (2.0)) / (RT_POT##((FX##(V_0e68!)), (2.0)) * 2.0) * V_0e54! * 45.0   '@25d3a DS:2dd6,339a
L_25d84:
    ' END SUB   '@25d84
END SUB

SUB S_30042   ' entrada de SUB/FUNCTION (B$ENRA, locais 6 bytes) (0x30042)
    DIM L_BP0e$
    ' ---- FUN_3000_0042 @0x30042  (030042_FUN_3000_0042.lift.txt; evidence_id (assembly): ev_41a670ae4619cbc7fab4d53825ca671248188e2141db27fb79f7d72cdc863c26)
    V_1638$ = "OpenStrut (eng. reversa)"   '@3004f DS:33b0
    L_BP0e$ = ""   '@30061 DS:33cc
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    GOTO L_3025c   ' PROTECAO: verificacao de licenca do original desativada
    ' PROTECAO (removido)
L_3025c:
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
L_302b2:
    GOTO L_302e0   ' PROTECAO: verificacao de licenca do original desativada
    ' PROTECAO (removido)
L_302d1:
    ' PROTECAO (removido)
L_302e0:
    ' @302e0 libera strings locais (L_BP0e)
    ' END SUB   '@302e9
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_ARMACAO.BM'
'$INCLUDE: '../comum/MIXT.BM'
