' ============================================================================
'  LAJE - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/LAJE/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 473a36666ed927d6fb276a5413232f0478471383941839ac1405a4574059452e
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_LAJE.BI'

' ---- variaveis do LAJE fora do COMMON (DS do programa)
DIM SHARED V_1348!
DIM SHARED V_134c$
DIM SHARED V_1350!
DIM SHARED V_1354!
DIM SHARED V_1358!
DIM SHARED V_135c$
DIM SHARED V_1360!
DIM SHARED V_1364!
DIM SHARED V_1368!
DIM SHARED V_136c!
DIM SHARED V_1370!
DIM SHARED V_1374!
DIM SHARED V_147a$

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "LAJE"
' ---- M_LAJE @0x10030  (010030_M_LAJE.lift.txt; evidence_id (assembly): ev_caeeb3005c17b17847b54fd417c419d5d0a8e3b614ddcf18de6d3469bc710891)
' @10030 inicio do programa (B$?EVT)
L_BP0c% = (V_0f28_volta$ = "VOLTA LAJEGEOM")   '@10125 DS:1480
L_BP0e% = V_0f28_volta$ = "VOLTA LAJEGRAV" OR L_BP0c%   '@1014a DS:1492
L_BP10% = V_0f28_volta$ = "VOLTA LAJECALC" OR L_BP0e%   '@10165 DS:14a4
IF NOT ((V_0f28_volta$ = "VOLTA LAJEPROC" OR L_BP10%) <> 0) THEN GOTO L_101fc   '@10180 DS:14b6
V_0ef4# = RT_FRE&("")   '@10195 DS:14c8
V_0f28_volta$ = ""   '@101af DS:14c8
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@101c1
GOSUB L_117af   '@101d0
V_147a$ = V_0dd8$   '@101dd
GOTO L_11bc8   '@101ef
L_101fc:
RT_CLEAR   '@101fc (CLEAR zera as variaveis do programa e do COMMON, nao o estado do RT45)
GOSUB L_117af   '@1020e
CALL S_20042   '@1021b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0dd8$ = V_147a$   '@10225
V_0f0c! = 1.0   '@10237 DS:14cc
L_1024e:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_0f0c!))) <> "") THEN GOTO L_102f0   '@1024f DS:14c8
IF NOT (RT_INSTR%((1), (ENVIRON$(RT_CINT%(FX##(V_0f0c!)))), ("COMSPEC")) > 0) THEN GOTO L_102d1   '@1026d DS:14d0
V_0df4$ = RT_MID$((ENVIRON$(RT_CINT%(FX##(V_0f0c!)))), (9), (1))   '@10297
GOTO L_102f0   '@102c4
L_102d1:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@102d1 DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1024e   '@102e7
L_102f0:
V_0e08$ = CHR$(27) + CHR$(50)   '@102f0
V_0e0c$ = CHR$(27) + CHR$(48)   '@10318
V_0e10$ = CHR$(27) + CHR$(78) + CHR$(6)   '@10340
V_0e14$ = CHR$(27) + CHR$(79)   '@10378
V_0e04_direxe$ = V_0df4$   '@103a0
L_BP0c% = (V_0e04_direxe$ = "A")   '@103b2 DS:14dc
IF NOT ((V_0e04_direxe$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_10410   '@103d7 DS:14e2
V_0e04_direxe$ = V_0e04_direxe$ + ":\"   '@103ec DS:14e8
GOTO L_10431   '@10408
L_10410:
V_0e04_direxe$ = V_0e04_direxe$ + ":\SISTRUT\EXEC40\"   '@10410 DS:14ee
L_10431:
V_0dcc_placa$ = "CGA"   '@10431 DS:1504
V_0dd0$ = "LPT1:"   '@10443 DS:150c
V_0dd4$ = "COM1:"   '@10455 DS:1516
V_0f04! = 1.0   '@10467 DS:14cc
V_0f18$ = ""   '@10478 DS:14c8
L_10490:
IF NOT (V_0f04! < 18.0) THEN GOTO L_104fa   '@10491 DS:1520
V_0f18$ = V_0f18$ + CHR$(SCREEN(4, RT_CINT%(FX##(V_0f04!))))   '@104a6
V_0f04! = FX##(V_0f04!) + 1.0   '@104dc DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_10490   '@104f2
L_104fa:
' PROTECAO: verificacao de licenca do original desativada
V_0f04! = 1.0   '@10511 DS:14cc
V_0f18$ = ""   '@10522 DS:14c8
L_1053a:
IF NOT (V_0f04! < 40.0) THEN GOTO L_105a4   '@1053b DS:153a
V_0f18$ = V_0f18$ + CHR$(SCREEN(5, RT_CINT%(FX##(V_0f04!))))   '@10550
V_0f04! = FX##(V_0f04!) + 1.0   '@10586 DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1053a   '@1059c
L_105a4:
V_0e04_direxe$ = RTRIM$(RT_MID2$((V_0f18$), (17)))   '@105a4
V_0dcc_placa$ = RT_MID$((V_0f18$), (1), (3))   '@105ca
V_0dd0$ = RT_MID$((V_0f18$), (4), (5))   '@105ea
V_0dd4$ = RT_MID$((V_0f18$), (10), (5))   '@1060a
GOTO L_1066b   '@1062a
L_10632:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_1066b:
L_10670:   ' entrada vinda de 0113ec_F_113ec
V_0dc0_cortexto! = 15.0   '@10675 DS:1594
V_0dc8_corfundo! = 1.0   '@10686 DS:14cc
V_0dc4_cordestaque! = 15.0   '@10697 DS:1594
V_0e28! = 1.39999997615814208984375##   '@106a8 DS:1598
V_0e2c! = 1.0   '@106b9 DS:14cc
V_0e30! = 1.0   '@106ca DS:14cc
V_0ddc$ = "m"   '@106db DS:159c
V_0de0$ = "t"   '@106ed DS:15a2
V_0de8! = 1.0   '@106ff DS:14cc
V_0dec! = 1.0   '@10710 DS:14cc
V_0df8$ = "\"   '@10721 DS:15a8
V_0e78! = 0.1500000059604644775390625##   '@10733 DS:15ae
V_0e7c! = 5.0   '@10744 DS:15b2
V_0e80_tipoaco$ = "B"   '@10755 DS:14e2
V_0de4$ = "t/cm2"   '@10767 DS:15b6
V_0df0! = 1.0   '@10779 DS:14cc
V_0e68_pi# = ATN(FX##(1.0#)) * 4.0#   '@1078a DS:15c0,15c8
V_133a! = 0.004999999888241291046142578125##   '@107a7 DS:15d0
V_133e! = 0.00200000009499490261077880859375##   '@107b8 DS:15d4
V_0e18$ = "SISTRUT"   '@107c9 DS:15d8
V_0e1c$ = V_0e04_direxe$   '@107db
V_0e50% = 80   '@107ed
V_0e42% = 40   '@107f8
V_0e44% = 200   '@10803
V_0e46% = 70   '@1080e
V_0e48% = 70   '@10819
V_0e4a% = 200   '@10824
V_0e4c% = 60   '@1082f
V_0e4e% = 200   '@1083a
V_0e54_nivellaje! = 0.0   '@10845 DS:15e4
V_0e58_prefixolaje$ = "L"   '@10856 DS:15e8
V_0e5c! = 0.0   '@10868 DS:15e4
V_0e60$ = "V"   '@10879 DS:15ee
ON ERROR GOTO L_1145c
RT_ONERR = &H1145c   '@1088b
OPEN RT_ARQ$(V_0e04_direxe$ + "LAJE.INI") FOR INPUT AS #1   '@1089a DS:15f4,15fa
LINE INPUT #1, V_0f18$   '@108be DS:14c8
V_0df4$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@108e1 DS:1606
LINE INPUT #1, V_0f18$   '@1090d DS:14c8
V_0df8$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10930 DS:1606
IF NOT (RT_MID$((V_0df8$), (1), (1)) <> "\") THEN GOTO L_1099a   '@1095c DS:15a8
V_0df8$ = "\" + V_0df8$   '@1097e DS:15a8
L_1099a:
L_BP0c% = (LEN(V_0df8$) > 1)   '@1099a
IF NOT ((RT_RIGHT$((V_0df8$), (1)) <> "\" AND L_BP0c%) <> 0) THEN GOTO L_109f7   '@109bc DS:15a8
V_0df8$ = V_0df8$ + "\"   '@109db DS:15a8
L_109f7:
LINE INPUT #1, V_0f18$   '@109f7 DS:14c8
V_0e18$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10a1a DS:1606
LINE INPUT #1, V_0f18$   '@10a46 DS:14c8
V_0e1c$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10a69 DS:1606
LINE INPUT #1, V_0f18$   '@10a95 DS:14c8
V_0e50% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10ab8
LINE INPUT #1, V_0f18$   '@10ad3 DS:14c8
V_0e42% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10af6
LINE INPUT #1, V_0f18$   '@10b11 DS:14c8
V_0e44% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10b34
LINE INPUT #1, V_0f18$   '@10b4f DS:14c8
V_0e46% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10b72
LINE INPUT #1, V_0f18$   '@10b8d DS:14c8
V_0e48% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10bb0
LINE INPUT #1, V_0f18$   '@10bcb DS:14c8
V_0e4a% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10bee
LINE INPUT #1, V_0f18$   '@10c09 DS:14c8
V_0e4c% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10c2c
LINE INPUT #1, V_0f18$   '@10c47 DS:14c8
V_0e4e% = RT_CINT%(FX##(VAL(V_0f18$)))   '@10c6a
LINE INPUT #1, V_0f18$   '@10c85 DS:14c8
V_0e58_prefixolaje$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10ca8 DS:1606
LINE INPUT #1, V_0f18$   '@10cd4 DS:14c8
V_0e54_nivellaje! = VAL(V_0f18$)   '@10cf7
LINE INPUT #1, V_0f18$   '@10d11 DS:14c8
V_0e60$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10d34 DS:1606
LINE INPUT #1, V_0f18$   '@10d60 DS:14c8
V_0e5c! = VAL(V_0f18$)   '@10d83
LINE INPUT #1, V_0f18$   '@10d9d DS:14c8
V_0ddc$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10dc0 DS:1606
LINE INPUT #1, V_0f18$   '@10dec DS:14c8
V_0de0$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10e0f DS:1606
LINE INPUT #1, V_0f18$   '@10e3b DS:14c8
V_0de8! = VAL(V_0f18$)   '@10e5e
LINE INPUT #1, V_0f18$   '@10e78 DS:14c8
V_0dec! = VAL(V_0f18$)   '@10e9b
LINE INPUT #1, V_0f18$   '@10eb5 DS:14c8
V_0de4$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10ed8 DS:1606
LINE INPUT #1, V_0f18$   '@10f04 DS:14c8
V_0df0! = VAL(V_0f18$)   '@10f27
LINE INPUT #1, V_0f18$   '@10f41 DS:14c8
V_0e78! = VAL(V_0f18$)   '@10f64
LINE INPUT #1, V_0f18$   '@10f7e DS:14c8
V_0e7c! = VAL(V_0f18$)   '@10fa1
LINE INPUT #1, V_0f18$   '@10fbb DS:14c8
V_0e80_tipoaco$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@10fde DS:1606
LINE INPUT #1, V_0f18$   '@1100a DS:14c8
V_0e28! = VAL(V_0f18$)   '@1102d
LINE INPUT #1, V_0f18$   '@11047 DS:14c8
V_0e2c! = VAL(V_0f18$)   '@1106a
LINE INPUT #1, V_0f18$   '@11084 DS:14c8
V_0e30! = VAL(V_0f18$)   '@110a7
LINE INPUT #1, V_0f18$   '@110c1 DS:14c8
V_0e08$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@110e4 DS:1606
LINE INPUT #1, V_0f18$   '@11110 DS:14c8
V_0e0c$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@11133 DS:1606
LINE INPUT #1, V_0f18$   '@1115f DS:14c8
V_0e10$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@11182 DS:1606
LINE INPUT #1, V_0f18$   '@111ae DS:14c8
V_0e14$ = RT_MID$((V_0f18$), (1), (RT_INSTR%((1), (V_0f18$), ("=")) - 1))   '@111d1 DS:1606
CLOSE #1   '@111fd
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@1120c
V_0f18$ = V_0e08$   '@1121b
GOSUB L_114dd   '@1122d
V_0e08$ = V_0f1c$   '@1123a
V_0f18$ = V_0e0c$   '@1124c
GOSUB L_114dd   '@1125e
V_0e0c$ = V_0f1c$   '@1126b
V_0f18$ = V_0e10$   '@1127d
GOSUB L_114dd   '@1128f
V_0e10$ = V_0f1c$   '@1129c
V_0f18$ = V_0e14$   '@112ae
GOSUB L_114dd   '@112c0
V_0e14$ = V_0f1c$   '@112cd
L_112e4:   ' entrada vinda de 0113ec_F_113ec
V_0dfc$ = V_0df4$   '@112e9
V_0e00$ = V_0df8$   '@112fb
L_BP0c% = (V_0dfc$ <> "A")   '@1130d DS:14dc
IF NOT ((V_0dfc$ <> "B" AND L_BP0c%) <> 0) THEN GOTO L_11393   '@11332 DS:14e2
L_BP0c% = (LEN(V_0e00$) > 1)   '@11347 DS:160c
CHDIR RT_ARQ$(V_0dfc$ + ":" + RT_LEFT$((V_0e00$), (LEN(V_0e00$) + L_BP0c%)))   '@11374
L_11393:
V_0e70! = V_0e78!   '@11393
V_0e74! = V_0e7c!   '@113a4
ON ERROR GOTO L_113f1
RT_ONERR = &H113f1   '@113b5
PCOPY 0, 1   '@113c4
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@113d5
GOTO L_115bb   '@113e4
' ---- F_113ec @0x113ec  (0113ec_F_113ec.lift.txt; evidence_id (assembly): ev_23946f4a31e18ed483e1e79671ed95092411e7c70dfaac5a0288dcb6ed088e93)
L_113f1:   ' entrada vinda de 010030_M_LAJE
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@113f6
V_0dcc_placa$ = "HER"   '@11405 DS:1612
V_0dc0_cortexto! = 14.0   '@11417 DS:161a
V_0dc8_corfundo! = 0.0   '@11428 DS:15e4
V_0dc4_cordestaque! = 9.0   '@11439 DS:161e
RESUME L_115bb   '@1144a
L_1145c:   ' entrada vinda de 010030_M_LAJE
CLOSE #1   '@11461
IF NOT (RT_INSTR%((1), ("CDEF"), (RT_MID$((V_0e04_direxe$), (1), (1)))) > 0) THEN GOTO L_114bc   '@11470 DS:1622
V_0e04_direxe$ = "A:\"   '@11498 DS:162a
RESUME L_10670   '@114aa
L_114bc:
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@114bc
RESUME L_112e4   '@114cb
L_114dd:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJE
V_0f04! = 0.0   '@114e2 DS:15e4
V_0f1c$ = ""   '@114f3 DS:14c8
L_1150a:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_0f04!) + 1.0)), (V_0f18$), ("(")) > 0) THEN GOTO L_115ac   '@1150b DS:14cc,1632
V_0f04! = RT_INSTR%((RT_CINT%(FX##(V_0f04!) + 1.0)), (V_0f18$), ("(")) + 1   '@1152e DS:14cc,1632
V_0f1c$ = V_0f1c$ + CHR$(RT_CINT%(FX##(VAL(RT_MID2$((V_0f18$), (RT_CINT%(FX##(V_0f04!))))))))   '@1155d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1150a   '@115a4
L_115ac:
RETURN   '@115ac
L_115bb:   ' entrada vinda de 010030_M_LAJE
ON ERROR GOTO L_115f5
RT_ONERR = &H115f5   '@115c0
CALL S_14959   '@115cf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@115d9
GOTO L_11bc8   '@115e8
' ---- F_115f0 @0x115f0  (0115f0_F_115f0.lift.txt; evidence_id (assembly): ev_670e9f76897c6c89424ac1b87be715118b7de2db9e4a1d1cb852e918fe9080b2)
L_115f5:   ' entrada vinda de 0113ec_F_113ec
RESUME L_1160c   '@115fa
L_1160c:
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@11611
RT_VIEWPRINT 1, 25   '@11620
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@11632
RT_CLS 2   '@1166d
LOCATE 10, 1   '@1167b
BEEP   '@11696
IF NOT (V_0f18$ = "NOME") THEN GOTO L_116e8   '@116a0 DS:1638
PRINT " Arquivo parametrizacao "; V_0e1c$; V_0e18$; ".LAP   nao encontrado"   '@116b7 DS:1640,165c
GOTO L_11712   '@116e0
L_116e8:
PRINT " Erro no Arquivo parametrizacao"   '@116e8 DS:1676
PRINT " ultimo dado lido "; V_0f18$   '@116f6 DS:169a
L_11712:
V_0e18$ = "SISTRUT"   '@11712 DS:15d8
CALL S_14959   '@11724
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
PRINT " Sera adotada a parametrizacao SISTRUT ";   '@1172e DS:16b0
CALL MIXT_07f1_LimpaTeclado   '@1173c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@11746
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
GOTO L_11bc8   '@11762
' ---- F_1176a @0x1176a  (01176a_F_1176a.lift.txt; evidence_id (assembly): ev_3d71015d58a6a13c9f96a891d63a70c52950988b170a4e2338d6b81c3efbfc44)
L_1176f:   ' entrada vinda de 010030_M_LAJE, 0113ec_F_113ec, 0115f0_F_115f0, 011bc8_FUN_1000_1bc8, 013997_FUN_1000_3997, 014172_F_14172
RESUME L_11786   '@11774
L_11786:
GOSUB L_117af   '@1178b
CALL S_147d7   '@11798
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
GOTO L_11bc8   '@117a2
' ---- F_117aa @0x117aa  (0117aa_F_117aa.lift.txt; evidence_id (assembly): ev_6bd5712304946854d3dbc5cfc49e63c452fd85082f1555678cdf5a378ee3c7ed)
L_117af:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJE, 01176a_F_1176a
FOR V_1348! = 1.0 TO 10.0   '@117b4 DS:14cc,16dc
ON KEY(RT_CINT%(FX##(V_1348!))) GOSUB L_11a55
RT_ONKEY RT_CINT%(FX##(V_1348!)), 1   '@117c2
KEY(RT_CINT%(FX##(V_1348!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1348!)), 1   '@117dc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
NEXT V_1348!   '@117f1 DS:14cc,16dc
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1181a
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@11842
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1186a
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@11892
FOR V_1348! = 15.0 TO 18.0   '@118ba DS:14cc,1520,1594
ON KEY(RT_CINT%(FX##(V_1348!))) GOSUB L_11a80
RT_ONKEY RT_CINT%(FX##(V_1348!)), 2   '@118c8
KEY(RT_CINT%(FX##(V_1348!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1348!)), 1   '@118e2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
NEXT V_1348!   '@118f7 DS:14cc,1520
ON KEY(2) GOSUB L_11a80
RT_ONKEY 2, 2   '@11920
KEY(2) ON
RT_KEYESTADO 2, 1   '@11933
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@11941
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@11969
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@11991
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@119b9
FOR V_1348! = 19.0 TO 22.0   '@119e0 DS:14cc,16e0,16e4
ON KEY(RT_CINT%(FX##(V_1348!))) GOSUB L_11b9a
RT_ONKEY RT_CINT%(FX##(V_1348!)), 3   '@119ee
KEY(RT_CINT%(FX##(V_1348!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1348!)), 1   '@11a08
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
NEXT V_1348!   '@11a1d DS:14cc,16e4
RETURN   '@11a46
L_11a55:
BEEP   '@11a5a
GOSUB L_117af   '@11a64
RETURN   '@11a71
L_11a80:
RT_SCREEN 0   '@11a85
RT_VIEWPRINT 1, 25   '@11a9a
COLOR 7, 0, 0   '@11aac
RT_CLS 0   '@11ad0
PRINT " Aguarde ..."   '@11add DS:16e8
PRINT ""   '@11aeb DS:14c8
PRINT " Retorno ao Modulo Gerenciador"   '@11af9 DS:16f8
ON ERROR GOTO L_11b4a
RT_ONERR = &H11b4a   '@11b07
RT_RUN RT_MID$((V_0e04_direxe$), (1), (LEN(V_0e04_direxe$) - 7)) + "SISTRUT"   '@11b16 DS:15d8
L_11b4a:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0e04_direxe$), (1), (LEN(V_0e04_direxe$) - 7))   '@11b4f DS:171a
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@11b7d DS:1558
RT_FIM   '@11b8b (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_11b9a:
BEEP   '@11b9f
GOSUB L_117af   '@11ba9
RETURN L_11bc8   '@11bc0
' ---- FUN_1000_1bc8 @0x11bc8  (011bc8_FUN_1000_1bc8.lift.txt; evidence_id (assembly): ev_91d07508262d99f3d1e96d58c20a5dca36b169536ab4106cbb32d76e6575c260)
L_11bc8:   ' entrada vinda de 010030_M_LAJE, 0113ec_F_113ec, 0115f0_F_115f0, 01176a_F_1176a, 0117aa_F_117aa, 0130c0_F_130c0, 013997_FUN_1000_3997
RT_SCREEN 0   '@11bcd
RT_VIEWPRINT 1, 25   '@11be2
COLOR 7, RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@11bf4
RT_CLS 0   '@11c28
RT_CLOSE   '@11c35 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@11c42
COLOR 11   '@11c51
PRINT RT_STRINGC$((80), (219));   '@11c67
PRINT "   LAJES EM REGIME DE RUPTURA"   '@11c7f DS:1738
PRINT "   OpenStrut  eng. reversa independente do"   '@11c8d DS:175a
PRINT "   SISTRUT 4.0 (1991), sem vinculo oficial"   '@11c9b DS:1788
PRINT "   Versao 4.0   "; V_147a$   '@11ca9 DS:17b6
PRINT RT_STRINGC$((80), (219));   '@11cc0
COLOR 7   '@11cd8
LOCATE 8, 20   '@11cee
PRINT "1  -  ";   '@11d0c DS:17ca
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11d1a
PRINT "M";   '@11d37 DS:17d4
COLOR 7   '@11d45
PRINT "ateriais, Concreto Aco"   '@11d5b DS:17da
LOCATE 10, 20   '@11d69
PRINT "2  -  ";   '@11d87 DS:17f4
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11d95
PRINT "A";   '@11db2 DS:14dc
COLOR 7   '@11dc0
PRINT "rquivar dados de Painel"   '@11dd6 DS:17fe
LOCATE 12, 20   '@11de4
PRINT "3  -  ";   '@11e02 DS:181a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11e10
PRINT "C";   '@11e2d DS:1824
COLOR 7   '@11e3b
PRINT "ontinuidade / ";   '@11e51 DS:182a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11e5f
PRINT "E";   '@11e7c DS:183c
COLOR 7   '@11e8a
PRINT "spessura / ";   '@11ea0 DS:1842
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11eae
PRINT "D";   '@11ecb DS:1852
COLOR 7   '@11ed9
PRINT "imensionamento"   '@11eef DS:1858
LOCATE 14, 20   '@11efd
PRINT "4  -  "; "";   '@11f1b DS:14c8,186a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11f32
PRINT "P";   '@11f4f DS:1874
COLOR 7   '@11f5d
PRINT "rocessar / Detalhar Lajes"   '@11f73 DS:187a
LOCATE 16, 20   '@11f81
PRINT "5  -  ";   '@11f9f DS:1898
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@11fad
PRINT "L";   '@11fca DS:15e8
COLOR 7   '@11fd8
PRINT "ista das Lajes Arquivadas"   '@11fee DS:18a2
LOCATE 18, 20   '@11ffc
PRINT "6  -  "; "";   '@1201a DS:14c8,18c0
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@12031
PRINT "G";   '@1204e DS:18ca
COLOR 7   '@1205c
PRINT "ravacao e Leitura"   '@12072 DS:18d0
LOCATE 20, 20   '@12080
PRINT "7  -  ";   '@1209e DS:18e6
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@120ac
PRINT "V";   '@120c9 DS:15ee
COLOR 7   '@120d7
PRINT "isualizar e Alterar Parametrizacoes"   '@120ed DS:18f0
LOCATE 24, 50   '@120fb
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), 3   '@12119
PRINT " <F2> = Fim "   '@1213e DS:1918
L_12151:
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@12156
LOCATE 22, 20   '@12182
PRINT "escolha opcao ";   '@121a0 DS:1928
CALL MIXT_07f1_LimpaTeclado   '@121ae
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@121b8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0ef4# = RT_FRE&("")   '@121d4 DS:14c8
COLOR 7   '@121ee
V_134c$ = V_0f18$   '@12204
IF NOT (V_134c$ <> "1") THEN GOTO L_12251   '@12216 DS:193a
IF NOT (V_134c$ <> "M") THEN GOTO L_12251   '@1222d DS:17d4
IF NOT (V_134c$ = "m") THEN GOTO L_12261   '@1223f DS:159c
L_12251:
GOTO L_12469   '@12251
L_12261:
IF NOT (V_134c$ <> "2") THEN GOTO L_12297   '@12261 DS:1940
IF NOT (V_134c$ <> "A") THEN GOTO L_12297   '@12273 DS:14dc
IF NOT (V_134c$ = "a") THEN GOTO L_122a7   '@12285 DS:1946
L_12297:
GOTO L_12aee   '@12297
L_122a7:
IF NOT (V_134c$ <> "3") THEN GOTO L_12325   '@122a7 DS:194c
IF NOT (V_134c$ <> "C") THEN GOTO L_12325   '@122b9 DS:1824
IF NOT (V_134c$ <> "c") THEN GOTO L_12325   '@122cb DS:1952
IF NOT (V_134c$ <> "E") THEN GOTO L_12325   '@122dd DS:183c
IF NOT (V_134c$ <> "e") THEN GOTO L_12325   '@122ef DS:1958
IF NOT (V_134c$ <> "D") THEN GOTO L_12325   '@12301 DS:1852
IF NOT (V_134c$ = "d") THEN GOTO L_12335   '@12313 DS:195e
L_12325:
GOTO L_12c80   '@12325
L_12335:
IF NOT (V_134c$ <> "4") THEN GOTO L_1236b   '@12335 DS:1964
IF NOT (V_134c$ <> "P") THEN GOTO L_1236b   '@12347 DS:1874
IF NOT (V_134c$ = "p") THEN GOTO L_1237b   '@12359 DS:196a
L_1236b:
GOTO L_12e12   '@1236b
L_1237b:
IF NOT (V_134c$ <> "5") THEN GOTO L_123b1   '@1237b DS:1970
IF NOT (V_134c$ <> "L") THEN GOTO L_123b1   '@1238d DS:15e8
IF NOT (V_134c$ = "l") THEN GOTO L_123c1   '@1239f DS:1976
L_123b1:
GOTO L_12fd0   '@123b1
L_123c1:
IF NOT (V_134c$ <> "6") THEN GOTO L_123f7   '@123c1 DS:197c
IF NOT (V_134c$ <> "G") THEN GOTO L_123f7   '@123d3 DS:18ca
IF NOT (V_134c$ = "g") THEN GOTO L_12407   '@123e5 DS:1982
L_123f7:
GOTO L_13805   '@123f7
L_12407:
IF NOT (V_134c$ <> "7") THEN GOTO L_1243d   '@12407 DS:1988
IF NOT (V_134c$ <> "V") THEN GOTO L_1243d   '@12419 DS:15ee
IF NOT (V_134c$ = "v") THEN GOTO L_1244d   '@1242b DS:198e
L_1243d:
GOTO L_13997   '@1243d
L_1244d:
BEEP   '@1244d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12151   '@12457
L_12469:
RT_VIEWPRINT 1, 25   '@1246e
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@12480
RT_CLS 2   '@124ac
PRINT RT_STRINGC$((80), (205))   '@124ba
PRINT " Definicao dos Materiais e unidades de trabalho"   '@124d2 DS:1994
PRINT RT_STRINGC$((80), (205))   '@124e0
L_124fd:
COLOR 7   '@12502
LOCATE 6, 1   '@12518
PRINT " Concreto Fck *";   '@12533 DS:19c8
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@12541
PRINT LTRIM$(STR$(V_0e78!));   '@1255e
COLOR 7   '@1257c
PRINT "* "; V_0de4$;   '@12592 DS:19dc
CALL MIXT_07f1_LimpaTeclado   '@125a9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_0f18$   '@125b3 DS:19e2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_12871   '@125cd
IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_12618   '@125e2 DS:19e8
BEEP   '@12606
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_124fd   '@12610
L_12618:
V_0e78! = VAL(V_0f18$)   '@12618
L_12637:
LOCATE 9, 1   '@1263c
PRINT "  Unidade de grandeza para os valores caracteristicos do Concreto e Aco"   '@12657 DS:19f0
PRINT "  *";   '@12665 DS:1a3c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@12673
PRINT V_0de4$;   '@12690
COLOR 7   '@1269e
CALL MIXT_07f1_LimpaTeclado   '@126b4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_0f18$   '@126be DS:19dc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_1273a   '@126d8
IF NOT (VAL(V_0f18$) <> 0.0#) THEN GOTO L_12723   '@126ed DS:19e8
BEEP   '@12711
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12637   '@1271b
L_12723:
V_0de4$ = V_0f18$   '@12723
L_1273a:
L_1273f:
LOCATE 12, 1   '@12744
PRINT "  Multiplicador de ("; V_0de4$; ") para transformar em Tonelada/Centimetro2"   '@1275f DS:1a44,1a5c
PRINT "  *";   '@1277f DS:1a3c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1278d
PRINT LTRIM$(STR$(V_0df0!));   '@127aa
COLOR 7   '@127c8
CALL MIXT_07f1_LimpaTeclado   '@127de
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_0f18$   '@127e8 DS:19dc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_1286c   '@12802
IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_1284d   '@12817 DS:19e8
BEEP   '@1283b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1273f   '@12845
L_1284d:
V_0df0! = VAL(V_0f18$)   '@1284d
L_1286c:
L_12871:
L_12876:
LOCATE 7, 1   '@1287b
PRINT " Aco      Fyk *";   '@12896 DS:1a8a
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@128a4
PRINT LTRIM$(STR$(V_0e7c!));   '@128c1
COLOR 7   '@128df
PRINT "* "; V_0de4$;   '@128f5 DS:19dc
CALL MIXT_07f1_LimpaTeclado   '@1290c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_0f18$   '@12916 DS:19e2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) <> 0) THEN GOTO L_1299a   '@12930
IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_1297b   '@12945 DS:19e8
BEEP   '@12969
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12876   '@12973
L_1297b:
V_0e7c! = VAL(V_0f18$)   '@1297b
L_1299a:
L_1299f:
LOCATE 7, 45   '@129a4
PRINT " Tipo de Aco  A/B *";   '@129c2 DS:1a9e
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@129d0
PRINT V_0e80_tipoaco$;   '@129ed
COLOR 7   '@129fb
CALL MIXT_07f1_LimpaTeclado   '@12a11
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_0f18$   '@12a1b DS:19dc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_12abf   '@12a35
L_BP0c% = (UCASE$(V_0f18$) <> "A")   '@12a4a DS:14dc
IF NOT ((UCASE$(V_0f18$) <> "B" AND L_BP0c%) <> 0) THEN GOTO L_12aa2   '@12a71 DS:14e2
BEEP   '@12a90
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1299f   '@12a9a
L_12aa2:
V_0e80_tipoaco$ = UCASE$(V_0f18$)   '@12aa2
L_12abf:
V_0e70! = V_0e78!   '@12abf
V_0e74! = V_0e7c!   '@12ad0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12ae1
L_12aee:
V_0ef0! = 0.0   '@12af3 DS:15e4
L_12b09:
ON ERROR GOTO L_12b87
RT_ONERR = &H12b87   '@12b0e
V_0ef4# = RT_FRE&("")   '@12b1d DS:14c8
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@12b37
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@12b56
RT_CHAIN V_0e04_direxe$ + "LAJEGEOM"   '@12b6a DS:1ab6
L_12b87:
RESUME L_12b9e   '@12b8c
L_12b9e:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@12ba3 DS:162a
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_12c3a   '@12bc8 DS:1ac2
LOCATE 22, 1   '@12bdd
PRINT " Coloque o disco LAJEGEOM no Drive "; V_0e04_direxe$   '@12bf8 DS:1aca
CALL MIXT_07f1_LimpaTeclado   '@12c0f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@12c19
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
L_12c3a:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@12c3a DS:14cc
IF NOT (V_0ef0! = 4.0) THEN GOTO L_12c73   '@12c50 DS:1af2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12c6b
L_12c73:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12b09   '@12c73
L_12c80:
V_0ef0! = 0.0   '@12c85 DS:15e4
L_12c9b:
ON ERROR GOTO L_12d19
RT_ONERR = &H12d19   '@12ca0
V_0ef4# = RT_FRE&("")   '@12caf DS:14c8
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@12cc9
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@12ce8
RT_CHAIN V_0e04_direxe$ + "LAJECALC"   '@12cfc DS:1af6
L_12d19:
RESUME L_12d30   '@12d1e
L_12d30:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@12d35 DS:162a
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_12dcc   '@12d5a DS:1ac2
LOCATE 22, 1   '@12d6f
PRINT " Coloque o disco LAJECALC no Drive "; V_0e04_direxe$   '@12d8a DS:1b02
CALL MIXT_07f1_LimpaTeclado   '@12da1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@12dab
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
L_12dcc:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@12dcc DS:14cc
IF NOT (V_0ef0! = 4.0) THEN GOTO L_12e05   '@12de2 DS:1af2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12dfd
L_12e05:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12c9b   '@12e05
L_12e12:
IF NOT (V_12fa% = 0 OR V_120e% = 0) THEN GOTO L_12e43   '@12e17
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12e3b
L_12e43:
V_0ef0! = 0.0   '@12e43 DS:15e4
L_12e59:
ON ERROR GOTO L_12ed7
RT_ONERR = &H12ed7   '@12e5e
V_0ef4# = RT_FRE&("")   '@12e6d DS:14c8
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@12e87
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@12ea6
RT_CHAIN V_0e04_direxe$ + "LAJEPROC"   '@12eba DS:1b2a
L_12ed7:
RESUME L_12eee   '@12edc
L_12eee:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@12ef3 DS:162a
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_12f8a   '@12f18 DS:1ac2
LOCATE 22, 1   '@12f2d
PRINT " Coloque o disco LAJEPROC no Drive "; V_0e04_direxe$   '@12f48 DS:1b36
CALL MIXT_07f1_LimpaTeclado   '@12f5f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@12f69
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
L_12f8a:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@12f8a DS:14cc
IF NOT (V_0ef0! = 4.0) THEN GOTO L_12fc3   '@12fa0 DS:1af2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12fbb
L_12fc3:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_12e59   '@12fc3
L_12fd0:
IF NOT (V_0e3c% = 0) THEN GOTO L_12fec   '@12fd5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@12fe4
L_12fec:
RT_VIEWPRINT 1, 25   '@12fec
RT_CLS 2   '@12ffe
V_0f0c! = 1.0   '@1300c DS:14cc
L_13022:
V_0f10! = FX##(V_0f0c!) + 16.0   '@13027 DS:1b5e
IF NOT (V_0e52% < V_0f10!) THEN GOTO L_1306f   '@1303d
V_0f10! = V_0e52%   '@1305b
L_1306f:
GOSUB L_130c5   '@1306f
IF NOT (V_0e52% = V_0f10!) THEN GOTO L_130a2   '@1307c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@1309a
L_130a2:
V_0f0c! = FX##(V_0f10!) + 1.0   '@130a2 DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13022   '@130b8
' ---- F_130c0 @0x130c0  (0130c0_F_130c0.lift.txt; evidence_id (assembly): ev_43e2f07ee75236d8375182d77acb8f40daf599a7195b6fd7711b5a140e9b45e0)
L_130c5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011bc8_FUN_1000_1bc8
COLOR 7   '@130ca
RT_CLS 2   '@130e0
PRINT RT_STRINGC$((80), (205))   '@130ee
PRINT " Lista das Lajes arquivadas            Obra "; V_0e24$   '@13106 DS:1b62
PRINT " Laje    tipo  lados  livre   peso p.    carga     area     H   Armadura"   '@1311d DS:1b92
PRINT RT_STRINGC$((80), (205))   '@1312b
V_1350! = V_0f10!   '@13143
FOR V_0f04! = V_0f0c! TO V_1350!   '@13155 DS:14cc
V_0f14! = 1.0   '@1315c DS:14cc
V_1354! = 0.0   '@1316d DS:15e4
L_13184:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f14!)), 1) <> 2.0) THEN GOTO L_131cf   '@13184 DS:1bde
V_1354! = FX##(V_1354!) + 1.0   '@131b9 DS:14cc
L_131cf:
IF NOT (V_1354! = V_0f04!) THEN GOTO L_131f2   '@131cf
GOTO L_13210   '@131ea
L_131f2:
V_0f14! = FX##(V_0f14!) + 1.0   '@131f2 DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13184   '@13208
L_13210:
V_1358! = A_10cc!(RT_CINT%(FX##(V_0f14!)), 0)   '@13210
V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0f04!) + V_0e54_nivellaje!)))   '@1323a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f14!)), 1) = 0.0) THEN GOTO L_132b9   '@13272 DS:15e4
V_0f20$ = "MA"   '@132a7 DS:1be2
L_132b9:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f14!)), 1) = 1.0) THEN GOTO L_13300   '@132b9 DS:14cc
V_0f20$ = "PRE"   '@132ee DS:1be8
L_13300:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f14!)), 1) = 3.0) THEN GOTO L_13347   '@13300 DS:1bf0
V_0f20$ = "MAn"   '@13335 DS:1bf4
L_13347:
V_1354! = 0.0   '@13347 DS:15e4
V_0ef0! = 1.0   '@13358 DS:14cc
L_1336e:
IF NOT (A_10fa%(RT_CINT%(FX##(V_1358!)), RT_CINT%(FX##(V_0ef0!))) = 1) THEN GOTO L_133b6   '@1336e
V_1354! = FX##(V_1354!) + 1.0   '@133a0 DS:14cc
L_133b6:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@133b6 DS:14cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
IF NOT (A_109e%(RT_CINT%(FX##(V_1358!)), 0) - 1 < V_0ef0!) THEN GOTO L_1336e   '@133cc
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f14!)), 1) <> 1.0) THEN GOTO L_1346d   '@13405 DS:14cc
V_0ef0! = A_10cc!(RT_CINT%(FX##(V_0f14!)), 5)   '@1343a
GOTO L_1347e   '@13465
L_1346d:
V_0ef0! = 0.0   '@1346d DS:15e4
L_1347e:
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1347e
V_0f18$ = "## \    \"   '@1349b DS:1bfc
PRINT USING V_0f18$; RT_PU#(V_0f04!, V_0f18$, 1); V_0f1c$;   '@134ad
COLOR 7   '@134d6
V_0f18$ = " \ \   ###   ####  ####.##    ####.##   ####.##  "   '@134ec DS:1c0a
PRINT USING V_0f18$; V_0f20$; RT_PU#(A_109e%(RT_CINT%(FX##(V_1358!)), 0) - 1, V_0f18$, 1); RT_PU#(V_1354!, V_0f18$, 2); RT_PU#(V_0ef0!, V_0f18$, 3); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f14!)), 4), V_0f18$, 4); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f14!)), 2), V_0f18$, 5);   '@134fe
IF NOT (V_12fa% = 1) THEN GOTO L_13764   '@135a3
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@135b2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f14!)), 0) > 0.0) THEN GOTO L_1363c   '@135cf DS:15e4
PRINT USING "###"; RT_PU#(A_12fc!(RT_CINT%(FX##(V_0f14!)), 0), "###", 1);   '@13603 DS:1c40
L_1363c:
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f14!)), 2) <> 0.0) THEN GOTO L_1375f   '@1363c DS:15e4
V_0ef4# = INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f14!)), 2))) / 1000.0)   '@1366e DS:1c48
V_0efc# = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f14!)), 2))) - 1000.0# * FX##(V_0ef4#)   '@136a5 DS:1c4c
COLOR 14   '@136dd
PRINT "  #";   '@136f3 DS:1c54
PRINT USING "##.# c/##.#"; RT_PU#(A_0e8c_bitola!(RT_CINT%(FX##(V_0ef4#))), "##.# c/##.#", 1); RT_PU#(A_129c_espacamento!(RT_CINT%(FX##(V_0efc#))), "##.# c/##.#", 2);   '@13701 DS:1c5c
L_1375f:
L_13764:
PRINT ""   '@13764 DS:14c8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@13772 DS:14cc
PRINT ""   '@1379e DS:14c8
COLOR 7   '@137ac
PRINT " Qualquer Tecla para Continuar ";   '@137c2 DS:1c6c
CALL MIXT_07f1_LimpaTeclado   '@137d0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@137da
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@137f6
L_13805:   ' entrada vinda de 011bc8_FUN_1000_1bc8
V_0ef0! = 0.0   '@1380a DS:15e4
L_13820:
ON ERROR GOTO L_1389e
RT_ONERR = &H1389e   '@13825
V_0ef4# = RT_FRE&("")   '@13834 DS:14c8
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@1384e
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@1386d
RT_CHAIN V_0e04_direxe$ + "LAJEGRAV"   '@13881 DS:1c90
L_1389e:
RESUME L_138b5   '@138a3
L_138b5:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@138ba DS:162a
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_13951   '@138df DS:1ac2
LOCATE 23, 1   '@138f4
PRINT " Coloque o disco LAJEGRAV no Drive "; V_0e04_direxe$   '@1390f DS:1c9c
CALL MIXT_07f1_LimpaTeclado   '@13926
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@13930
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
L_13951:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@13951 DS:14cc
IF NOT (V_0ef0! = 4.0) THEN GOTO L_1398a   '@13967 DS:1af2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@13982
L_1398a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13820   '@1398a
' ---- FUN_1000_3997 @0x13997  (013997_FUN_1000_3997.lift.txt; evidence_id (assembly): ev_8615ffe5d084e24f2afc7597c902efd76406f71f445c26721a24df533f32de89)
L_13997:   ' entrada vinda de 011bc8_FUN_1000_1bc8
RT_VIEWPRINT 1, 25   '@1399c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@139ae
RT_CLS 2   '@139da
PRINT RT_STRINGC$((80), (205))   '@139e8
PRINT " Correcao de Parametros"   '@13a00 DS:1cc4
PRINT RT_STRINGC$((80), (205))   '@13a0e
L_13a2b:   ' entrada vinda de 014172_F_14172
LOCATE 5, 1   '@13a30
COLOR 7   '@13a4b
PRINT " Parametrizacao Utilizada (.LAP)"   '@13a61 DS:1ce0
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@13a6f
PRINT " (P)  Parametrizacao = ";   '@13a8c DS:1d04
IF NOT (V_0e18$ = "SISTRUT") THEN GOTO L_13ac7   '@13a9a DS:15d8
PRINT V_0e18$   '@13ab1
GOTO L_13ade   '@13abf
L_13ac7:
PRINT V_0e1c$; V_0e18$   '@13ac7
L_13ade:
PRINT ""   '@13ade DS:14c8
COLOR 7   '@13aec
PRINT " Coeficientes de Seguranca"   '@13b02 DS:1d20
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@13b10
PRINT " (1)  Forcas ="; V_0e28!; "    "   '@13b2d DS:1d3e,1d50
PRINT " (2)  Concreto ="; V_0e2c!; "    "   '@13b51 DS:1d50,1d58
PRINT " (3)  Aco ="; V_0e30!; "    "   '@13b75 DS:1d50,1d6c
PRINT ""   '@13b99 DS:14c8
COLOR 7   '@13ba7
PRINT " Unidades de trabalho dos esforcos solicitantes"   '@13bbd DS:1d7c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@13bcb
PRINT " (4)  Unidade de Forca = "; V_0de0$; "    "   '@13be8 DS:1d50,1db0
PRINT " (5)  Coef. multiplicador para transformar em toneladas ="; V_0dec!; "   "   '@13c08 DS:1dce,1e0c
PRINT " (6)  Unidade de Medida = "; V_0ddc$; "    "   '@13c2c DS:1d50,1e14
PRINT " (7)  Coef. multiplicador para transformar em metros ="; V_0de8!; "   "   '@13c4c DS:1e0c,1e32
L_13c75:
COLOR 7   '@13c7a
LOCATE 24, 1   '@13c90
PRINT " item , Novo Valor  *NAO* "; RT_TAB$(70); "";   '@13cab DS:14c8,1e6c
LOCATE 24, 27   '@13ccb
CALL MIXT_07f1_LimpaTeclado   '@13ce9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@13cf3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_13d22   '@13d05
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_11bc8   '@13d1a
L_13d22:
V_135c$ = V_0f18$   '@13d22
IF NOT (V_135c$ <> "P") THEN GOTO L_13d5d   '@13d34 DS:1874
IF NOT (V_135c$ = "p") THEN GOTO L_13ff7   '@13d4b DS:196a
L_13d5d:
L_13d62:   ' entrada vinda de 014172_F_14172
RT_VIEWPRINT 5, 25   '@13d67
RT_CLS 2   '@13d79
LOCATE 7, 1   '@13d87
COLOR 3   '@13da2
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@13db8 DS:14c8,1e8a
COLOR 14   '@13dd8
RT_VIEWPRINT 8, 25   '@13dee
ON ERROR GOTO L_14177
RT_ONERR = &H14177   '@13e00
L_BP0c% = (LEN(V_0e1c$) > 3)   '@13e0f
CHDIR RT_ARQ$(RT_LEFT$((V_0e1c$), (LEN(V_0e1c$) + L_BP0c%)))   '@13e2e
IF NOT (V_0f18$ = "ERPARA") THEN GOTO L_13e61   '@13e42 DS:1ec0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13a2b   '@13e59
L_13e61:
RT_FILES V_0e1c$ + "*.LAP"   '@13e61 DS:1eca (FILES: cabecalho em forma DOS (RT45))
IF NOT (V_0f18$ = "ERRPARA") THEN GOTO L_13e98   '@13e79 DS:1ed4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13a2b   '@13e90
L_13e98:
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@13e98
RT_VIEWPRINT 5, 6   '@13ea7
RT_CLS 2   '@13eb9
COLOR 7   '@13ec7
PRINT " Nome do Arquivo PARAMETRIZACAO *"; V_0e18$; "* ";   '@13edd DS:19dc,1ee0
CALL MIXT_07f1_LimpaTeclado   '@13efd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@13f07 DS:14c8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_13f3e   '@13f21
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13997   '@13f36
L_13f3e:
IF NOT (UCASE$(V_0f1c$) = "D") THEN GOTO L_13f70   '@13f3e DS:1852
GOSUB L_143d2   '@13f5b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13d62   '@13f68
L_13f70:
ON ERROR GOTO L_141de
RT_ONERR = &H141de   '@13f70
V_0f24$ = V_0e18$   '@13f7f
V_0e18$ = UCASE$(V_0f1c$)   '@13f91
CALL S_14959   '@13fb3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 5, 25   '@13fbd
RT_CLS 2   '@13fcf
RT_VIEWPRINT 1, 25   '@13fdd
GOTO L_1416a   '@13fef
L_13ff7:
IF NOT (V_135c$ = "1") THEN GOTO L_1402b   '@13ff7 DS:193a
V_0e28! = VAL(V_0f1c$)   '@14009
GOTO L_1416a   '@14023
L_1402b:
IF NOT (V_135c$ = "2") THEN GOTO L_1405f   '@1402b DS:1940
V_0e2c! = VAL(V_0f1c$)   '@1403d
GOTO L_1416a   '@14057
L_1405f:
IF NOT (V_135c$ = "3") THEN GOTO L_14093   '@1405f DS:194c
V_0e30! = VAL(V_0f1c$)   '@14071
GOTO L_1416a   '@1408b
L_14093:
IF NOT (V_135c$ = "4") THEN GOTO L_140bf   '@14093 DS:1964
V_0de0$ = V_0f1c$   '@140a5
GOTO L_1416a   '@140b7
L_140bf:
IF NOT (V_135c$ = "5") THEN GOTO L_140f3   '@140bf DS:1970
V_0dec! = VAL(V_0f1c$)   '@140d1
GOTO L_1416a   '@140eb
L_140f3:
IF NOT (V_135c$ = "6") THEN GOTO L_1411f   '@140f3 DS:197c
V_0ddc$ = V_0f1c$   '@14105
GOTO L_1416a   '@14117
L_1411f:
IF NOT (V_135c$ = "7") THEN GOTO L_14153   '@1411f DS:1988
V_0de8! = VAL(V_0f1c$)   '@14131
GOTO L_1416a   '@1414b
L_14153:
BEEP   '@14153
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13c75   '@1415d
L_1416a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13a2b   '@1416a
' ---- F_14172 @0x14172  (014172_F_14172.lift.txt; evidence_id (assembly): ev_10c29430f48ee23a2a6c30b4ed488d2a348de9eaa68b671ff5afcf3d32b494ac)
L_14177:   ' entrada vinda de 013997_FUN_1000_3997
IF NOT (ERR = 53) THEN GOTO L_141bd   '@1417c
PRINT " Nenhum Arquivo Encontrado"   '@1418e DS:1f06
V_0f18$ = ""   '@1419c DS:14c8
RESUME NEXT   '@141ae
L_141bd:
V_0f18$ = "ERRPARA"   '@141bd DS:1ed4
RESUME NEXT   '@141cf
L_141de:   ' entrada vinda de 013997_FUN_1000_3997
IF NOT (V_0f18$ = "NOME") THEN GOTO L_142ad   '@141e3 DS:1638
V_0e18$ = V_0f24$   '@141fa
LOCATE 6, 1   '@1420c
BEEP   '@14227
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@14231
PRINT " NAO EXISTE ESTE ARQUIVO ";   '@1424e DS:1f24
CALL MIXT_07f1_LimpaTeclado   '@1425c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@14266
V_0f18$ = RT_INPUT$(1)   '@1427c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RESUME L_13d62   '@14298
' @142a5 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_143cd   '@142a5
L_142ad:
RESUME L_142bf   '@142ad
L_142bf:
RT_VIEWPRINT 15, 25   '@142c4
RT_CLS 2   '@142d6
BEEP   '@142e4
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@142ee
PRINT " ERRO NO ARQUIVO PARAMETRIZACAO "   '@1430b DS:1f42
PRINT " ultimo dado lido "; V_0f18$   '@14319 DS:169a
PRINT ""   '@14330 DS:14c8
PRINT " Sera adotada a parametrizacao SISTRUT"   '@1433e DS:1f66
V_0f18$ = "SISTRUT"   '@1434c DS:15d8
CALL S_14959   '@1435e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_07f1_LimpaTeclado   '@14368
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@14372
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 5, 25   '@1438e
RT_CLS 2   '@143a0
RT_VIEWPRINT 1, 25   '@143ae
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_13a2b   '@143c0
L_143cd:
L_143d2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 013997_FUN_1000_3997
V_1360! = 0.0   '@143d7 DS:15e4
V_1364! = 1.0   '@143e9 DS:14cc
CALL MIXT_0dbe_GuardaTela(V_1360!, V_1364!, V_0dcc_placa$)   '@143f4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 22, 25   '@14405
L_1441c:
RT_CLS 2   '@14421
LOCATE 23, 1   '@1442f
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1444a
PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@14467 DS:1f90
COLOR 14   '@14475
PRINT "  dos arquivos de Parametrizacao (.LAP)"   '@1448b DS:1fb8
COLOR 7   '@14499
PRINT " *"; V_0e1c$;   '@144af DS:1fe4
CALL MIXT_07f1_LimpaTeclado   '@144c6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_0f24$   '@144d0 DS:19dc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f24$) = 0) THEN GOTO L_1453c   '@144ea
V_1368! = 1.0   '@144ff DS:14cc
V_136c! = 0.0   '@14511 DS:15e4
CALL MIXT_0dbe_GuardaTela(V_1368!, V_136c!, V_0dcc_placa$)   '@1451c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@1452d
L_1453c:
V_0f1c$ = V_0e1c$   '@1453c
GOSUB L_1465f   '@1454e
IF NOT (V_0f24$ = "*") THEN GOTO L_14584   '@1455b DS:1fea
BEEP   '@14572
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1441c   '@1457c
L_14584:
V_0e1c$ = V_0f24$   '@14584
ON ERROR GOTO L_147ae
RT_ONERR = &H147ae   '@14596
L_BP0c% = (LEN(V_0e1c$) > 3)   '@145a5
CHDIR RT_ARQ$(RT_LEFT$((V_0e1c$), (LEN(V_0e1c$) + L_BP0c%)))   '@145c4
ON ERROR GOTO L_1176f
RT_ONERR = &H1176f   '@145d8
IF NOT (V_0f24$ = "*") THEN GOTO L_14622   '@145e7 DS:1fea
V_0e1c$ = V_0f1c$   '@145fe
BEEP   '@14610
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY no laco (B$EVCK)
GOTO L_1441c   '@1461a
L_14622:
V_1370! = 1.0   '@14622 DS:14cc
V_1374! = 0.0   '@14634 DS:15e4
CALL MIXT_0dbe_GuardaTela(V_1370!, V_1374!, V_0dcc_placa$)   '@1463f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_11a55, L_11a80, L_11b9a   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@14650
L_1465f:   ' sub-rotina (alvo de GOSUB)
IF NOT (VAL(V_0f24$) <> 0.0#) THEN GOTO L_146a4   '@14664 DS:19e8
V_0f24$ = "*"   '@14688 DS:1fea
RETURN   '@1469a
L_146a4:
IF NOT (LEN(V_0f24$) = 1) THEN GOTO L_146d6   '@146a4
V_0f24$ = V_0f24$ + ":\"   '@146ba DS:14e8
L_146d6:
L_BP0c% = (INSTR(V_0f24$, ":\") = 0)   '@146d6 DS:14e8
IF NOT ((RT_MID$((V_0f24$), (1), (1)) <> "\" AND L_BP0c%) <> 0) THEN GOTO L_14737   '@146fc DS:15a8
V_0f24$ = V_0f1c$ + V_0f24$   '@1471b
L_14737:
IF NOT (RT_RIGHT$((V_0f24$), (1)) <> "\") THEN GOTO L_14774   '@14737 DS:15a8
V_0f24$ = V_0f24$ + "\"   '@14758 DS:15a8
L_14774:
IF NOT (INSTR(V_0f24$, ":\") = 0) THEN GOTO L_1479f   '@14774 DS:14e8
V_0f24$ = "*"   '@1478d DS:1fea
L_1479f:
RETURN   '@1479f
L_147ae:
V_0f24$ = "*"   '@147b3 DS:1fea
RESUME NEXT   '@147c5
' @147cf (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_14951   '@147cf
' ---- FUN_1000_4951 @0x14951  (014951_FUN_1000_4951.lift.txt; evidence_id (assembly): ev_96762a8cb9ce5e2bc6804dc79cb95405fd720fc3da91650a2adc6d6197acb8cc)
L_14951:   ' entrada vinda de 014172_F_14172
GOTO L_1663b   '@14951
' ---- F_1663b @0x1663b  (01663b_F_1663b.lift.txt; evidence_id (assembly): ev_e703e520b2f119a6dc7d6bd28fe384fbed584fabb1eadff6248ef9d631e882dc)
L_1663b:   ' entrada vinda de 014951_FUN_1000_4951
RT_FIM   ' @1663b B$CENP (inicio/fim do modulo)
'RETRAD? @16640 ?? 50 bytes sem caminho de entrada conhecido (dados/lixo, 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH; ADD byte ptr [BX + SI], AL ...
L_16672:
'RETRAD? @16672 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x1000:6676
L_16676:
'RETRAD? @16676 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x1000:667a
L_1667a:
'RETRAD? @1667a ?? 276 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 118 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
L_1678e:
'RETRAD? @1678e ?? 47 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 24 instr.): ADD byte ptr [BX + SI], AL; CMPSB ES:DI, SI ...
' ---- F_167bf @0x167bf  (0167bf_F_167bf.lift.txt; evidence_id (assembly): ev_c4a650cc1e0cd4da3ce9f2f082c81d47a7d656f9aea5832c6be2fd8e55aac460)
'RETRAD? @167bf ?? 106 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 53 instr.): ADD DL, CH; ADD AX, 0x0 ...
L_16829:
'RETRAD? @1682a ?? 101 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 49 instr.): ADD byte ptr [BX + SI], AL; MOV AX, 0x7 ...
L_1688f:
'RETRAD? @1688f ?? 58 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 27 instr.): ADD BH, DH; OR word ptr [BX + SI], AX ...
L_168c9:
'RETRAD? @168c9 ?? 95 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 43 instr.): OR AX, word ptr [BX + SI]; ADD DH, CH ...
L_16928:
'RETRAD? @16928 ?? 140 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 56 instr.): ADD AL, 0xf; ADD byte ptr [BX + SI], AL ...
L_169b4:
'RETRAD? @169b4 ?? 9 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 5 instr.): INT 0x12; ADD byte ptr [BX + SI], AL ...
' ---- F_169bf @0x169bf  (0169bf_F_169bf.lift.txt; evidence_id (assembly): ev_dee0fcd0bc4571556857285d0647eae648f02054e126729d5c5520c972342472)
'RETRAD? @169bf ?? 18 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 9 instr.): ADD BL, BH; ADC AL, byte ptr [BX + SI] ...
L_169d1:   ' entrada vinda de 0167bf_F_167bf
'RETRAD? @169d1 ?? 152 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 68 instr.): ADC AX, word ptr [BX + SI]; ADD byte ptr [SI + 0x13], AH ...
' ---- FUN_1000_6a6c @0x16a6c  (016a6c_FUN_1000_6a6c.lift.txt; evidence_id (assembly): ev_52262793d223c2b96893293570793221e066e32811f038dffb14da2e26c67b72)
'RETRAD? @16a6c ?? 32 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 15 instr.): XOR DL, byte ptr [0x0]; INSW ES:DI, DX ...
L_16a8c:
'RETRAD? @16a8c ?? dado (entre trechos de dado lido como codigo): NOT byte ptr [0x0]   '??
'RETRAD? @16a93 ?? 66 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 33 instr.): ADD byte ptr [BP + SI], DL; POP SS ...
' ---- F_16ad5 @0x16ad5  (016ad5_F_16ad5.lift.txt; evidence_id (assembly): ev_9b93a2919ab89ff8ddf417cafddfbaa9d9fbc83b0aa1f441c6d9f6a2ae15a3c1)
'RETRAD? @16ad5 ?? 123 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 56 instr.): POP SS; ADD byte ptr [BX + SI], AL ...
L_16b50:
'RETRAD? @16b50 ?? 212 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 97 instr.): STC; SBB AL, byte ptr [BX + SI] ...
L_16c24:
'RETRAD? @16c24 ?? dado (entre trechos de dado lido como codigo): SBB BX, word ptr [BX]   '??
'RETRAD? @16c26 ?? 47 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 19 instr.): ADD byte ptr [BX + SI], AL; XOR BL, byte ptr [BX] ...
L_16c55:
'RETRAD? @16c55 ?? 160 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 68 instr.): AND byte ptr [BX + SI], AL; ADD byte ptr [BX + DI], DH ...
L_16cf5:
'RETRAD? @16cf5 ?? 147 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 62 instr.): AND AL, 0x0; ADD byte ptr [SI + 0x24], AH ...
L_16d88:
'RETRAD? @16d8b ?? 54 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 29 instr.): ADD byte ptr [BP + SI], BH; DAA ...
L_16dc1:
'RETRAD? @16dc1 ?? 102 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 46 instr.): SUB byte ptr [BX + SI], AL; ADD byte ptr [BX + 0x28], AH ...
L_16e27:
'RETRAD? @16e27 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [DI], DH; SUB AL, byte ptr [BX + SI]
L_16e2b:
'RETRAD? @16e2b ?? 159 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 65 instr.): ADD byte ptr [BP + SI + 0x2a], CL; ADD byte ptr [BX + SI], AL ...
L_16eca:
'RETRAD? @16eca ?? 19 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 8 instr.): ADD byte ptr [BX + SI], AL; MOV CH, byte ptr [DI] ...
' ---- F_16edd @0x16edd  (016edd_F_16edd.lift.txt; evidence_id (assembly): ev_a75969d44b46e28b2f3820acb559cde0aa37d532a79df448301107b43c2af095)
'RETRAD? @16ee0 ?? 47 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 20 instr.): LOOP 0x1000:6f0f; ADD byte ptr [BX + SI], AL ...
L_16f0f:
'RETRAD? @16f0f ?? 10 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 4 instr.): ADD DL, DL; ADD byte ptr CS:[BX + SI], AL ...
' ---- F_16f1b @0x16f1b  (016f1b_F_16f1b.lift.txt; evidence_id (assembly): ev_88f0c117bedced482c1978aea412d3d873fc3535aafe2f57835d43dc1715f6ad)
'RETRAD? @16f1b ?? 42 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 19 instr.): ADD BL, DH; ADD byte ptr CS:[BX + SI], AL ...
' ---- FUN_1000_6f49 @0x16f49  (016f49_FUN_1000_6f49.lift.txt; evidence_id (assembly): ev_fe186210bec63b78bc09b0a4356dcd0f08a654b136f6e3df298b0b88bc561c0f)
L_16f49:   ' entrada vinda de 016edd_F_16edd
'RETRAD? @16f49 ?? 146 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 68 instr.): DAS; ADD byte ptr [BX + SI], AL ...
L_16fdb:
'RETRAD? @16fdb ?? 142 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 66 instr.): ADD byte ptr [BX + SI], AL; XOR AX, word ptr [BX + SI] ...
' ---- F_1706b @0x1706b  (01706b_F_1706b.lift.txt; evidence_id (assembly): ev_e21de15960c4a57c86775f690c9a7890279e3eb13434aa2fc48249029f948347)
'RETRAD? @1706b ?? 42 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 20 instr.): ADD AL, DL; AAA ...
L_17095:   ' entrada vinda de 016f49_FUN_1000_6f49
'RETRAD? @17095 ?? 98 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 38 instr.): CMP byte ptr [BX + SI], AL; ADD byte ptr [BP + DI + 0x38], AH ...
' ---- M_NOM @0x20030  (020030_M_NOM.lift.txt; evidence_id (assembly): ev_8b83aa1634c59dd84e29bcb983a1042666089850255f93a27bb148faa619f94f)
' @20030 inicio do programa (B$?EVT)
GOTO L_202f1   '@2003a
' ---- FUN_2000_02f1 @0x202f1  (0202f1_FUN_2000_02f1.lift.txt; evidence_id (assembly): ev_f5f7facd6522eb024e4a31ad5745e47985f4ba7e72dc6e25c02d272376d01638)
L_202f1:   ' entrada vinda de 020030_M_NOM
RT_FIM   ' @202f1 B$CENP (inicio/fim do modulo)
'RETRAD? @202f6 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    V_1348! = 0
    V_134c$ = ""
    V_1350! = 0
    V_1354! = 0
    V_1358! = 0
    V_135c$ = ""
    V_1360! = 0
    V_1364! = 0
    V_1368! = 0
    V_136c! = 0
    V_1370! = 0
    V_1374! = 0
    V_147a$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_11a55: BEEP; GOSUB L_117af; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_11a80: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_11b9a: sai da SUB (BEEP; GOSUB L_117af; RETURN L_11bc8)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H113f1: ON ERROR GOTO L_113f1
        CASE &H1145c: ON ERROR GOTO L_1145c
        CASE &H115f5: ON ERROR GOTO L_115f5
        CASE &H1176f: ON ERROR GOTO L_1176f
        CASE &H11b4a: ON ERROR GOTO L_11b4a
        CASE &H12b87: ON ERROR GOTO L_12b87
        CASE &H12d19: ON ERROR GOTO L_12d19
        CASE &H12ed7: ON ERROR GOTO L_12ed7
        CASE &H1389e: ON ERROR GOTO L_1389e
        CASE &H14177: ON ERROR GOTO L_14177
        CASE &H141de: ON ERROR GOTO L_141de
        CASE &H147ae: ON ERROR GOTO L_147ae
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_147d7   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x147d7)
    ' ---- FUN_1000_47d7 @0x147d7  (0147d7_FUN_1000_47d7.lift.txt; evidence_id (assembly): ev_b744a01975cb606dfa65c5dc2434f218fc83614042de49491b13446871c39bee)
    BEEP   '@147e4
    BEEP   '@147ee
    BEEP   '@147f8
    RT_SCREEN 0   '@14802
    RT_VIEWPRINT 1, 25   '@14817
    RT_CLOSE   '@14829 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!))   '@14836 DS:1af2
    RT_CLS 0   '@1487b
    LOCATE 10, 1   '@14888
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@148a3 DS:14c8,1ff0
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@148c3 DS:14c8,200a
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@148e3 DS:14c8,2036
L_14908:
    CALL MIXT_07f1_LimpaTeclado   '@1490d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@14917
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@14933
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14908   '@1493d
    ' ---- F_14944 @0x14944  (014944_F_14944.lift.txt; evidence_id (assembly): ev_71e10bc1fabbddbcbf26de3807b632935fa62789f886742a30f8afc220b5b1ff)
    ' END SUB   '@14944
END SUB

SUB S_14959   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x14959)
    ' ---- FUN_1000_4959 @0x14959  (014959_FUN_1000_4959.lift.txt; evidence_id (assembly): ev_f31ab581905d09f193757a076996d3b34c5f6290318796e6c9a0541e5a5dabc2)
    IF NOT (V_0e18$ = "SISTRUT") THEN GOTO L_14995   '@14961 DS:15d8
    GOSUB L_149a7   '@14978
    GOTO L_16633   '@14985
L_14995:
    GOTO L_156b7   '@14995
    ' ---- F_1499d @0x1499d  (01499d_F_1499d.lift.txt; evidence_id (assembly): ev_a48874a7952253f98ae6150e6783bb76c111ceb8124b15d198e4e64a513c6761)
L_149a7:   ' sub-rotina (alvo de GOSUB); entrada vinda de 014959_FUN_1000_4959
    V_0e18$ = "SISTRUT"   '@149ac DS:15d8
    V_0e28! = 1.39999997615814208984375##   '@149be DS:1598
    V_0e2c! = 1.39999997615814208984375##   '@149cf DS:1598
    V_0e30! = 1.14999997615814208984375##   '@149e0 DS:205c
    V_0e84! = 1.5   '@149f1 DS:2060
    V_0e88! = 0.5   '@14a02 DS:2064
    REDIM A_0e8c_bitola!(-32768 TO -32768)   '@14a13
    REDIM A_0eba_areabarra!(-32768 TO -32768)   '@14a21
    REDIM A_0eba_areabarra!(0 TO 10)   '@14a2a
    REDIM A_0e8c_bitola!(0 TO 10)   '@14a47
    A_0e8c_bitola!(0) = 4.0   '@14a5f DS:1af2
    A_0eba_areabarra!(0) = 0.0   '@14a7e DS:15e4
    A_0e8c_bitola!(1) = 5.0   '@14a9d DS:15b2
    A_0eba_areabarra!(1) = 0.20000000298023223876953125##   '@14aba DS:2068
    A_0e8c_bitola!(2) = 6.30000019073486328125##   '@14ad7 DS:206c
    A_0eba_areabarra!(2) = 0.314999997615814208984375##   '@14af7 DS:2070
    A_0e8c_bitola!(3) = 8.0   '@14b17 DS:2074
    A_0eba_areabarra!(3) = 0.5   '@14b37 DS:2064
    A_0e8c_bitola!(4) = 10.0   '@14b57 DS:16dc
    A_0eba_areabarra!(4) = 0.800000011920928955078125##   '@14b77 DS:2078
    A_0e8c_bitola!(5) = 12.5   '@14b97 DS:207c
    A_0eba_areabarra!(5) = 1.25   '@14bb7 DS:2080
    A_0e8c_bitola!(6) = 16.0   '@14bd7 DS:1b5e
    A_0eba_areabarra!(6) = 2.0   '@14bf7 DS:1bde
    A_0e8c_bitola!(7) = 20.0   '@14c17 DS:2084
    A_0eba_areabarra!(7) = 3.150000095367431640625##   '@14c37 DS:2088
    A_0e8c_bitola!(8) = 22.200000762939453125##   '@14c57 DS:208c
    A_0eba_areabarra!(8) = 3.88000011444091796875##   '@14c77 DS:2090
    A_0e8c_bitola!(9) = 25.0   '@14c97 DS:2094
    A_0eba_areabarra!(9) = 5.0   '@14cb7 DS:15b2
    REDIM A_123e!(-32768 TO -32768, -32768 TO -32768)   '@14cd7
    REDIM A_123e!(0 TO 15, 0 TO 1)   '@14ce5
    A_123e!(0, 0) = 15.0   '@14d09 DS:1594
    A_123e!(1, 0) = 0.25   '@14d29 DS:2098
    A_123e!(1, 1) = 0.4000000059604644775390625##   '@14d4c DS:209c
    A_123e!(2, 0) = 0.300000011920928955078125##   '@14d6d DS:20a0
    A_123e!(2, 1) = 0.5   '@14d90 DS:2064
    A_123e!(3, 0) = 0.3300000131130218505859375##   '@14db4 DS:20a4
    A_123e!(3, 1) = 0.550000011920928955078125##   '@14dd7 DS:20a8
    A_123e!(4, 0) = 0.4000000059604644775390625##   '@14dfb DS:209c
    A_123e!(4, 1) = 0.60000002384185791015625##   '@14e1e DS:20ac
    A_123e!(5, 0) = 0.5   '@14e42 DS:2064
    A_123e!(5, 1) = 0.699999988079071044921875##   '@14e65 DS:20b0
    A_123e!(6, 0) = 0.670000016689300537109375##   '@14e89 DS:20b4
    A_123e!(6, 1) = 0.800000011920928955078125##   '@14eac DS:2078
    A_123e!(7, 0) = 0.829999983310699462890625##   '@14ed0 DS:20b8
    A_123e!(7, 1) = 0.89999997615814208984375##   '@14ef3 DS:20bc
    A_123e!(8, 0) = 1.0   '@14f17 DS:14cc
    A_123e!(8, 1) = 1.0   '@14f3a DS:14cc
    A_123e!(9, 0) = 1.2000000476837158203125##   '@14f5e DS:20c0
    A_123e!(9, 1) = 1.10000002384185791015625##   '@14f81 DS:20c4
    A_123e!(10, 0) = 1.5   '@14fa5 DS:2060
    A_123e!(10, 1) = 1.2000000476837158203125##   '@14fc8 DS:20c0
    A_123e!(11, 0) = 2.0   '@14fec DS:1bde
    A_123e!(11, 1) = 1.39999997615814208984375##   '@1500f DS:1598
    A_123e!(12, 0) = 2.5   '@15033 DS:20c8
    A_123e!(12, 1) = 1.60000002384185791015625##   '@15056 DS:20cc
    A_123e!(13, 0) = 3.0   '@1507a DS:1bf0
    A_123e!(13, 1) = 1.7999999523162841796875##   '@1509d DS:20d0
    A_123e!(14, 0) = 3.5   '@150c1 DS:20d4
    A_123e!(14, 1) = 2.0   '@150e4 DS:1bde
    A_123e!(15, 0) = 4.0   '@15108 DS:1af2
    A_123e!(15, 1) = 2.5   '@1512b DS:20c8
    V_0f2c! = 6.0   '@1514f DS:20d8
    V_0f30! = 40.0   '@15160 DS:153a
    REDIM A_0f34!(-32768 TO -32768, -32768 TO -32768)   '@15171
    REDIM A_0f34!(0 TO 3, 0 TO 1)   '@1517f
    A_0f34!(0, 0) = 10.0   '@151a3 DS:16dc
    A_0f34!(0, 1) = 7.5   '@151c3 DS:20dc
    A_0f34!(1, 0) = 22.0   '@151e6 DS:16e4
    A_0f34!(1, 1) = 10.0   '@15209 DS:16dc
    A_0f34!(2, 0) = 30.0   '@1522a DS:20e0
    A_0f34!(2, 1) = 12.5   '@1524d DS:207c
    A_0f34!(3, 0) = 40.0   '@15271 DS:153a
    A_0f34!(3, 1) = 15.0   '@15294 DS:1594
    V_0f62! = 20.0   '@152b8 DS:2084
    REDIM A_129c_espacamento!(-32768 TO -32768)   '@152c9
    REDIM A_129c_espacamento!(0 TO 6)   '@152d7
    A_129c_espacamento!(0) = 6.0   '@152f4 DS:20d8
    A_129c_espacamento!(1) = 7.5   '@15313 DS:20dc
    A_129c_espacamento!(2) = 10.0   '@15330 DS:16dc
    A_129c_espacamento!(3) = 12.5   '@15350 DS:207c
    A_129c_espacamento!(4) = 15.0   '@15370 DS:1594
    A_129c_espacamento!(5) = 17.5   '@15390 DS:20e4
    A_129c_espacamento!(6) = 20.0   '@153b0 DS:2084
    REDIM A_126e!(-32768 TO -32768, -32768 TO -32768)   '@153d0
    REDIM A_126e!(0 TO 6, 0 TO 1)   '@153de
    A_126e!(0, 0) = 6.0   '@15402 DS:20d8
    A_126e!(1, 0) = 5.0   '@15422 DS:15b2
    A_126e!(1, 1) = 0.0   '@15445 DS:15e4
    A_126e!(2, 0) = 5.5   '@15466 DS:20e8
    A_126e!(2, 1) = 1.0   '@15489 DS:14cc
    A_126e!(3, 0) = 14.0   '@154ad DS:161a
    A_126e!(3, 1) = 2.0   '@154d0 DS:1bde
    A_126e!(4, 0) = 25.0   '@154f4 DS:2094
    A_126e!(4, 1) = 3.0   '@15517 DS:1bf0
    A_126e!(5, 0) = 32.0   '@1553b DS:20ec
    A_126e!(5, 1) = 4.0   '@1555e DS:1af2
    A_126e!(6, 0) = 40.0   '@15582 DS:153a
    A_126e!(6, 1) = 5.0   '@155a5 DS:15b2
    V_0f72! = 0.1500000059604644775390625##   '@155c9 DS:15ae
    V_0f76! = 0.100000001490116119384765625##   '@155da DS:20f0
    V_0f66$ = "S"   '@155eb DS:20f4
    V_0f6a! = 1.0   '@155fd DS:14cc
    V_132a! = 300.0   '@1560e DS:20fa
    V_132e! = 500.0   '@1561f DS:20fe
    V_1336! = 0.89999997615814208984375##   '@15630 DS:20bc
    V_1332$ = "S"   '@15641 DS:20f4
    V_0f6e! = 2.5   '@15653 DS:20c8
    V_0f7a! = 0.300000011920928955078125##   '@15664 DS:20a0
    V_0f7e! = 2.0   '@15675 DS:1bde
    V_0f82! = 1.0   '@15686 DS:14cc
    V_0f86! = 1.0   '@15697 DS:14cc
    RETURN   '@156a8
L_156b7:   ' entrada vinda de 014959_FUN_1000_4959
    V_0f18$ = "NOME"   '@156bc DS:1638
    OPEN RT_ARQ$(V_0e1c$ + V_0e18$ + ".LAP") FOR INPUT AS #1   '@156ce DS:15f4,2102
L_15702:
    LINE INPUT #1, V_0f18$   '@15702 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_15702   '@15725 DS:1fea
    LINE INPUT #1, V_0f18$   '@15744 DS:14c8
    V_0e84! = VAL(V_0f18$)   '@15767
    LINE INPUT #1, V_0f18$   '@15781 DS:14c8
    V_0e88! = VAL(V_0f18$)   '@157a4
L_157c4:
    LINE INPUT #1, V_0f18$   '@157c4 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_157c4   '@157e7 DS:1fea
    REDIM A_0e8c_bitola!(-32768 TO -32768)   '@15806
    REDIM A_0eba_areabarra!(-32768 TO -32768)   '@15814
    REDIM A_0eba_areabarra!(0 TO 10)   '@1581d
    REDIM A_0e8c_bitola!(0 TO 10)   '@1583a
    V_0f0c! = 0.0   '@15852 DS:15e4
L_15868:
    LINE INPUT #1, V_0f18$   '@15868 DS:14c8
    A_0e8c_bitola!(RT_CINT%(FX##(V_0f0c!))) = VAL(RT_MID2$((V_0f18$), (7)))   '@1588b
    A_0eba_areabarra!(RT_CINT%(FX##(V_0f0c!))) = VAL(RT_MID2$((V_0f18$), (26)))   '@158c9
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@15907 DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f0c! > 9.0) THEN GOTO L_15868   '@1591d DS:161e
L_1593e:
    LINE INPUT #1, V_0f18$   '@1593e DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_1593e   '@15961 DS:1fea
    LINE INPUT #1, V_0f18$   '@15980 DS:14c8
    V_0f2c! = VAL(V_0f18$)   '@159a3
    LINE INPUT #1, V_0f18$   '@159bd DS:14c8
    V_0f30! = VAL(V_0f18$)   '@159e0
    LINE INPUT #1, V_0f18$   '@159fa DS:14c8
    V_0f6a! = FX##(VAL(V_0f18$)) / 100.0#   '@15a1d DS:210a
    LINE INPUT #1, V_0f18$   '@15a3c DS:14c8
    V_132a! = VAL(V_0f18$)   '@15a5f
    LINE INPUT #1, V_0f18$   '@15a79 DS:14c8
    V_132e! = VAL(V_0f18$)   '@15a9c
    LINE INPUT #1, V_0f18$   '@15ab6 DS:14c8
    V_1332$ = UCASE$(RT_MID$((LTRIM$(V_0f18$)), (1), (1)))   '@15ad9
    LINE INPUT #1, V_0f18$   '@15b02 DS:14c8
    V_0f18$ = UCASE$(LTRIM$(V_0f18$))   '@15b25
    IF NOT (RT_MID$((V_0f18$), (1), (1)) = "E") THEN GOTO L_15b98   '@15b43 DS:183c
    V_1336! = -VAL(RT_MID2$((V_0f18$), (2)))   '@15b65
    GOTO L_15bb7   '@15b90
L_15b98:
    V_1336! = VAL(V_0f18$)   '@15b98
L_15bb7:
    LINE INPUT #1, V_0f18$   '@15bb7 DS:14c8
    V_0f6e! = VAL(V_0f18$)   '@15bda
L_15bfa:
    LINE INPUT #1, V_0f18$   '@15bfa DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_15bfa   '@15c1d DS:1fea
    REDIM A_123e!(-32768 TO -32768, -32768 TO -32768)   '@15c3c
    REDIM A_123e!(0 TO 21, 0 TO 1)   '@15c4a
    V_0f0c! = 1.0   '@15c6e DS:14cc
L_15c84:
    LINE INPUT #1, V_0f18$   '@15c84 DS:14c8
    V_0f18$ = LTRIM$(V_0f18$)   '@15ca7
    IF NOT (V_0f18$ <> "FIM") THEN GOTO L_15d73   '@15cbf DS:2112
    A_123e!(RT_CINT%(FX##(V_0f0c!)), 0) = VAL(V_0f18$)   '@15cd6
    A_123e!(RT_CINT%(FX##(V_0f0c!)), 1) = VAL(RT_MID2$((V_0f18$), (24)))   '@15d09
    A_123e!(0, 0) = V_0f0c!   '@15d4b
    GOTO L_15d80   '@15d6b
L_15d73:
    GOTO L_15d9e   '@15d73
L_15d80:
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@15d80 DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15c84   '@15d96
L_15d9e:
L_15da4:
    LINE INPUT #1, V_0f18$   '@15da4 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_15da4   '@15dc7 DS:1fea
    LINE INPUT #1, V_0f18$   '@15de6 DS:14c8
    V_0f7e! = VAL(V_0f18$)   '@15e09
    LINE INPUT #1, V_0f18$   '@15e23 DS:14c8
    V_0f7a! = VAL(V_0f18$)   '@15e46
    LINE INPUT #1, V_0f18$   '@15e60 DS:14c8
    V_0f82! = VAL(V_0f18$)   '@15e83
    IF NOT (V_0f82! > 1.0 OR V_0f82! < 0.0) THEN GOTO L_15ee9   '@15e9d DS:14cc,15e4
    ERROR 1   '@15edb
L_15ee9:
L_15eee:
    LINE INPUT #1, V_0f18$   '@15eee DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_15eee   '@15f11 DS:1fea
    V_0f72! = VAL(V_0f18$)   '@15f30
    LINE INPUT #1, V_0f18$   '@15f4a DS:14c8
    V_0f76! = VAL(V_0f18$)   '@15f6d
    LINE INPUT #1, V_0f18$   '@15f87 DS:14c8
    V_0f86! = FX##(VAL(V_0f18$)) / 100.0#   '@15faa DS:210a
    IF NOT (V_0f86! > 100.0 OR V_0f86! <= 0.0) THEN GOTO L_16015   '@15fc9 DS:15e4,211a
    ERROR 1   '@16007
L_16015:
L_1601a:
    LINE INPUT #1, V_0f18$   '@1601a DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_1601a   '@1603d DS:1fea
    V_0f62! = VAL(V_0f18$)   '@1605c
    LINE INPUT #1, V_0f18$   '@16076 DS:14c8
    V_0f66$ = UCASE$(RT_MID$((LTRIM$(V_0f18$)), (1), (1)))   '@16099
L_160c8:
    LINE INPUT #1, V_0f18$   '@160c8 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_160c8   '@160eb DS:1fea
    REDIM A_0f34!(-32768 TO -32768, -32768 TO -32768)   '@1610a
    REDIM A_0f34!(0 TO 3, 0 TO 1)   '@16118
    V_0f0c! = 0.0   '@1613c DS:15e4
L_16152:
    LINE INPUT #1, V_0f18$   '@16152 DS:14c8
    V_0f18$ = LTRIM$(V_0f18$)   '@16175
    A_0f34!(RT_CINT%(FX##(V_0f0c!)), 0) = VAL(V_0f18$)   '@1618d
    A_0f34!(RT_CINT%(FX##(V_0f0c!)), 1) = VAL(RT_MID2$((V_0f18$), (19)))   '@161c0
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@16202 DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f0c! > 3.0) THEN GOTO L_16152   '@16218 DS:1bf0
L_16238:
    LINE INPUT #1, V_0f18$   '@16238 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_16238   '@1625b DS:1fea
    REDIM A_129c_espacamento!(-32768 TO -32768)   '@1627a
    REDIM A_129c_espacamento!(0 TO 20)   '@16288
    V_0f10! = 1.0   '@162a5 DS:14cc
    V_0f04! = 1.0   '@162b6 DS:14cc
L_162cc:
    V_0f0c! = FX##(V_0f04!) + 1.0   '@162d1 DS:14cc
L_162ec:
    IF NOT (RT_MID$((V_0f18$), (RT_CINT%(FX##(V_0f0c!))), (1)) = "/") THEN GOTO L_163c1   '@162ec DS:211e
    A_129c_espacamento!(0) = V_0f10!   '@16318
    A_129c_espacamento!(RT_CINT%(FX##(V_0f10!))) = VAL(RT_MID$((V_0f18$), (RT_CINT%(FX##(V_0f04!))), (RT_CINT%(FX##(V_0f0c!) - 1.0))))   '@16337 DS:2124
    V_0f04! = FX##(V_0f0c!) + 1.0   '@16388 DS:14cc
    V_0f10! = FX##(V_0f10!) + 1.0   '@1639e DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162cc   '@163b4
L_163c1:
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@163c1 DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (LEN(V_0f18$) < V_0f0c!) THEN GOTO L_162ec   '@163d7
L_16400:
    LINE INPUT #1, V_0f18$   '@16400 DS:14c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_0f18$), (1), (1)) = "*" THEN GOTO L_16400   '@16423 DS:1fea
    REDIM A_126e!(-32768 TO -32768, -32768 TO -32768)   '@16442
    REDIM A_126e!(0 TO 6, 0 TO 1)   '@16450
    A_126e!(0, 0) = 6.0   '@16474 DS:20d8
    V_0f0c! = 1.0   '@16494 DS:14cc
L_164aa:
    LINE INPUT #1, V_0f18$   '@164aa DS:14c8
    V_0f18$ = LTRIM$(V_0f18$)   '@164cd
    A_126e!(RT_CINT%(FX##(V_0f0c!)), 0) = VAL(V_0f18$)   '@164e5
    A_126e!(RT_CINT%(FX##(V_0f0c!)), 1) = VAL(RT_MID2$((V_0f18$), (46)))   '@16518
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@1655a DS:14cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f0c! > 6.0) THEN GOTO L_164aa   '@16570 DS:20d8
    LINE INPUT #1, V_0f18$   '@1658b DS:14c8
    LINE INPUT #1, V_0f18$   '@165ae DS:14c8
    LINE INPUT #1, V_0f18$   '@165d1 DS:14c8
    IF NOT (V_0f18$ <> "FINAL DA PARAMETRIZACAO") THEN GOTO L_16619   '@165f4 DS:2128
    ERROR 1   '@1660b
L_16619:
    RT_CLOSE   '@16619 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    GOTO L_16633   '@16626
    ' ---- FUN_1000_6633 @0x16633  (016633_FUN_1000_6633.lift.txt; evidence_id (assembly): ev_960281345515a77f5a087c9e35880e95390457aad8c28b71073e960f5a40e92b)
L_16633:   ' entrada vinda de 014959_FUN_1000_4959, 01499d_F_1499d
    ' END SUB   '@16633
END SUB

SUB S_20042   ' entrada de SUB/FUNCTION (B$ENRA, locais 6 bytes) (0x20042)
    DIM L_BP0e$
    ' ---- FUN_2000_0042 @0x20042  (020042_FUN_2000_0042.lift.txt; evidence_id (assembly): ev_bbb872e798231fb138a87e46d0ea0168704a6dc1e134b823cdc9fa2b8f2d3eb3)
    V_147a$ = "OpenStrut (eng. reversa)"   '@2004f DS:2150
    L_BP0e$ = ""   '@20061 DS:216c
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    GOTO L_2025c   ' PROTECAO: verificacao de licenca do original desativada
    ' PROTECAO (removido)
L_2025c:
    ' PROTECAO (removido)
    ' PROTECAO (removido)
    ' PROTECAO (removido)
L_202b2:
    GOTO L_202e0   ' PROTECAO: verificacao de licenca do original desativada
    ' PROTECAO (removido)
L_202d1:
    ' PROTECAO (removido)
L_202e0:
    ' @202e0 libera strings locais (L_BP0e)
    ' END SUB   '@202e9
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_LAJE.BM'
'$INCLUDE: '../comum/MIXT.BM'
