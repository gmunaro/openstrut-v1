' ============================================================================
'  SISTRUT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/SISTRUT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 17aaef4fd32f46220ca84aa2e0d97d6ea10f281628310dc770fc262774bce5bc
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_SISTEMA.BI'

' ---- variaveis do SISTRUT fora do COMMON (DS do programa)
DIM SHARED V_0dc6!
DIM SHARED V_0dca!
DIM SHARED V_0dce!
DIM SHARED V_0dd2%
DIM SHARED V_0dd4$
DIM SHARED V_0dd8$
DIM SHARED V_0ddc$
DIM SHARED V_0de0$
DIM SHARED V_0de4$
DIM SHARED V_0de8$
DIM SHARED V_0dec$
DIM SHARED V_0df0$
DIM SHARED V_0df4!
DIM SHARED V_0df8!
DIM SHARED V_0dfc!
DIM SHARED V_0e00$
DIM SHARED V_0e04!
DIM SHARED V_0e08$
DIM SHARED V_0e18!
DIM SHARED V_0e1c!
DIM SHARED V_0e20$
DIM SHARED V_0e24$
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
DIM SHARED V_0e68$
DIM SHARED V_0e6c!
DIM SHARED V_0e70!
DIM SHARED V_0e74$
DIM SHARED V_0e78!
DIM SHARED V_0e7c!
DIM SHARED V_0e80$
DIM SHARED V_0e84$
DIM SHARED V_0e88$
DIM SHARED V_0e8c!
DIM SHARED V_0e90!
DIM SHARED V_0e94$
DIM SHARED V_0e98$
DIM SHARED V_0e9c!
DIM SHARED V_0ea0!
DIM SHARED V_0ea4$
DIM SHARED V_0ea8$
DIM SHARED V_0eac!
DIM SHARED V_0eb0!
DIM SHARED V_0eb4$
DIM SHARED V_0eb8!
DIM SHARED V_0ebc!
DIM SHARED V_0ec0$
DIM SHARED V_0ec4!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "SISTRUT"
' ---- M_SISTRUT @0x10030  (010030_M_SISTRUT.lift.txt; evidence_id (assembly): ev_fde35f251fc2e6e8957d83e816180fd8842ab5ad2a80fb5c5f4312452b96c589)
' @10030 inicio do programa (B$?EVT)
ON ERROR GOTO L_1250d
RT_ONERR = &H1250d   '@10067
GOSUB L_12615   '@10076
V_0ddc$ = "A:\"   '@10083 DS:0fd0
V_0dd8$ = "C"   '@10095 DS:0fd8
V_0de0$ = ""   '@100a7 DS:0fde
V_0de4$ = "CGA"   '@100b9 DS:0fe2
V_0de8$ = "LPT1:"   '@100cb DS:0fea
V_0dec$ = "COM1:"   '@100dd DS:0ff4
V_0df0$ = ""   '@100ef DS:0fde
V_0e00$ = CHR$(83) + CHR$(73) + CHR$(83) + CHR$(84) + CHR$(82) + CHR$(85) + CHR$(84)   '@10101
V_0df4! = 15.0   '@10179 DS:0ffe
V_0df8! = 1.0   '@1018a DS:1002
V_0dfc! = 3.0   '@1019b DS:1006
V_0e04! = 1.0   '@101ac DS:1002
L_101c2:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_0e04!))) <> "") THEN GOTO L_10292   '@101c3 DS:0fde
IF NOT (RT_INSTR%((1), (UCASE$(ENVIRON$(RT_CINT%(FX##(V_0e04!))))), ("COMSPEC")) > 0) THEN GOTO L_10273   '@101e1 DS:100a
V_0dd8$ = RT_MID$((ENVIRON$(RT_CINT%(FX##(V_0e04!)))), (9), (1))   '@10211
IF NOT (ASC(V_0dd8$) > 68) THEN GOTO L_10266   '@1023e
V_0dd8$ = "C"   '@10254 DS:0fd8
L_10266:
GOTO L_10292   '@10266
L_10273:
V_0e04! = FX##(V_0e04!) + 1.0   '@10273 DS:1002
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_101c2   '@10289
L_10292:
V_0e04! = 1.0   '@10292 DS:1002
L_102a8:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_0e04!))) <> "") THEN GOTO L_10356   '@102a9 DS:0fde
IF NOT (RT_INSTR%((1), (UCASE$(ENVIRON$(RT_CINT%(FX##(V_0e04!))))), ("SISTRUTREDE")) > 0) THEN GOTO L_10337   '@102c7 DS:1016
V_0de0$ = RT_MID2$((UCASE$(ENVIRON$(RT_CINT%(FX##(V_0e04!))))), (13))   '@102f7
GOTO L_10356   '@1032a
L_10337:
V_0e04! = FX##(V_0e04!) + 1.0   '@10337 DS:1002
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_102a8   '@1034d
L_10356:
L_BP0c% = (V_0dd8$ = "A")   '@10356 DS:1026
IF NOT ((V_0dd8$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_103b4   '@1037b DS:102c
V_0dd8$ = V_0dd8$ + ":\"   '@10390 DS:1032
GOTO L_103d5   '@103ac
L_103b4:
V_0dd8$ = V_0dd8$ + ":\SISTRUT\"   '@103b4 DS:1038
L_103d5:
L_103da:   ' entrada vinda de 010ff4_F_10ff4
V_0dd2% = 0   '@103df
ON ERROR GOTO L_10ff9
RT_ONERR = &H10ff9   '@103ea
OPEN RT_ARQ$(V_0dd8$ + "SISTRUT.INI") FOR INPUT AS #1   '@103f9 DS:1046,104c
LINE INPUT #1, V_0dd4$   '@1041d DS:0fde
LINE INPUT #1, V_0dd4$   '@10440 DS:0fde
LINE INPUT #1, V_0dd4$   '@10463 DS:0fde
V_0ddc$ = RT_MID$((V_0dd4$), (1), (RT_INSTR%((1), (V_0dd4$), ("=")) - 1))   '@10486 DS:105c
IF NOT (RT_RIGHT$((V_0ddc$), (1)) <> "\") THEN GOTO L_104ef   '@104b2 DS:1062
V_0ddc$ = V_0ddc$ + "\"   '@104d3 DS:1062
L_104ef:
L_BP0c% = (V_0dd8$ = V_0de0$)   '@104ef
IF NOT ((RT_MID$((V_0ddc$), (1), (1)) <> RT_MID$((V_0dd8$), (1), (1)) AND L_BP0c%) <> 0) THEN GOTO L_10560   '@10515
V_0ddc$ = V_0de0$ + "EXEC40\"   '@1053f DS:1068
L_10560:
LINE INPUT #1, V_0dd4$   '@10560 DS:0fde
V_0de4$ = RT_MID$((V_0dd4$), (1), (RT_INSTR%((1), (V_0dd4$), ("=")) - 1))   '@10583 DS:105c
LINE INPUT #1, V_0dd4$   '@105af DS:0fde
V_0de8$ = RT_MID$((V_0dd4$), (1), (RT_INSTR%((1), (V_0dd4$), ("=")) - 1))   '@105d2 DS:105c
LINE INPUT #1, V_0dd4$   '@105fe DS:0fde
V_0dec$ = RT_MID$((V_0dd4$), (1), (RT_INSTR%((1), (V_0dd4$), ("=")) - 1))   '@10621 DS:105c
LINE INPUT #1, V_0dd4$   '@1064d DS:0fde
V_0df0$ = RT_MID$((V_0dd4$), (1), (RT_INSTR%((1), (V_0dd4$), ("=")) - 1))   '@10670 DS:105c
LINE INPUT #1, V_0dd4$   '@1069c DS:0fde
LINE INPUT #1, V_0dd4$   '@106bf DS:0fde
V_0e08$ = V_0dd4$   '@106e2
CLOSE #1   '@106f4
GOTO L_10a8c   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_107ea:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_1087a:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_109b9:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_109f4:
L_109f9:
' PROTECAO (removido)
L_10a01:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10a6b:
' PROTECAO (removido)
L_10a82:
L_10a87:
L_10a8c:
V_0dd4$ = V_0e08$   '@10a8c
L_10aa3:   ' entrada vinda de 010df9_F_10df9
ON ERROR GOTO L_10dfe
RT_ONERR = &H10dfe   '@10aa8
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10dda:
' PROTECAO (removido)
L_10df1:
GOTO L_10e15   '@10df1
' ---- F_10df9 @0x10df9  (010df9_F_10df9.lift.txt; evidence_id (assembly): ev_ff0348d9e90c5c3f3cd2e8214820a0d493d6964ecd7ab5a8c7ee132c480cac4e)
L_10dfe:   ' entrada vinda de 010030_M_SISTRUT
RESUME L_10e15   '@10e03
L_10e15:   ' entrada vinda de 010030_M_SISTRUT
ON ERROR GOTO L_10ff9
RT_ONERR = &H10ff9   '@10e1a
L_BP0c% = (RT_MID$((V_0dd8$), (1), (1)) = "A")   '@10e29 DS:1026
IF NOT ((RT_MID$((V_0dd8$), (1), (1)) = "B" OR L_BP0c%) <> 0) THEN GOTO L_10f72   '@10e5a DS:102c
' PROTECAO (removido)
GOTO L_10f5a   ' PROTECAO: verificacao de licenca do original desativada
IF NOT (V_0dd2% = 0) THEN GOTO L_10f45   '@10eb3
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10f45:
GOTO L_12319   '@10f45
L_10f5a:
V_0dd2% = 2   '@10f5a
GOTO L_10fec   '@10f6a
L_10f72:
' PROTECAO (removido)
' PROTECAO (removido)
GOTO L_10fd7   ' PROTECAO: verificacao de licenca do original desativada
GOTO L_12319   '@10fc7
L_10fd7:
V_0dd2% = 2   '@10fd7
L_10fec:
GOTO L_1125c   '@10fec
' ---- F_10ff4 @0x10ff4  (010ff4_F_10ff4.lift.txt; evidence_id (assembly): ev_42571684544c477a8ecf8fc2b43b329168db7657fdf3d0169b15cb6a95a4dfc1)
L_10ff9:   ' entrada vinda de 010030_M_SISTRUT, 010df9_F_10df9
CLOSE #1   '@10ffe
IF NOT (RT_MID$((V_0dd8$), (1), (1)) = "C") THEN GOTO L_1106b   '@1100d DS:0fd8
V_0dd8$ = "D" + RT_MID2$((V_0dd8$), (2))   '@1102f DS:10f0
RESUME L_103da   '@11059
L_1106b:
IF NOT (RT_MID$((V_0dd8$), (1), (1)) = "D") THEN GOTO L_110c9   '@1106b DS:10f0
V_0dd8$ = "E" + RT_MID2$((V_0dd8$), (2))   '@1108d DS:10f6
RESUME L_103da   '@110b7
L_110c9:
IF NOT (RT_MID$((V_0dd8$), (1), (1)) = "E") THEN GOTO L_11127   '@110c9 DS:10f6
V_0dd8$ = "F" + RT_MID2$((V_0dd8$), (2))   '@110eb DS:10fc
RESUME L_103da   '@11115
L_11127:
L_BP0c% = (RT_MID$((V_0dd8$), (1), (1)) = "F")   '@11127 DS:10fc
IF NOT ((V_0de0$ <> "" AND L_BP0c%) <> 0) THEN GOTO L_11190   '@11157 DS:0fde
V_0dd8$ = V_0de0$   '@1116c
RESUME L_103da   '@1117e
L_11190:
L_BP0c% = (RT_MID$((V_0dd8$), (1), (1)) <> "A")   '@11190 DS:1026
IF NOT ((RT_MID$((V_0dd8$), (1), (1)) <> "B" AND L_BP0c%) <> 0) THEN GOTO L_11204   '@111c1 DS:102c
V_0dd8$ = "A:\"   '@111e0 DS:0fd0
RESUME L_103da   '@111f2
L_11204:
IF NOT (RT_MID$((V_0dd8$), (1), (1)) = "A") THEN GOTO L_1124a   '@11204 DS:1026
V_0dd8$ = "B:\"   '@11226 DS:1102
RESUME L_103da   '@11238
L_1124a:
RESUME L_1125c   '@1124a
L_1125c:   ' entrada vinda de 010df9_F_10df9
RT_CLOSE   '@11261 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
GOTO L_11285   ' PROTECAO: verificacao de licenca do original desativada
GOTO L_12319   '@1127d
L_11285:
ON ERROR GOTO L_11301
RT_ONERR = &H11301   '@11285
V_0dd4$ = V_0ddc$   '@11294
IF NOT (LEN(V_0ddc$) > 3) THEN GOTO L_112dc   '@112a6
V_0dd4$ = RT_MID$((V_0ddc$), (1), (10))   '@112bc
L_112dc:
ENVIRON "PATH=" + V_0dd4$   '@112dc DS:110a
GOTO L_11318   '@112f4
' ---- F_112fc @0x112fc  (0112fc_F_112fc.lift.txt; evidence_id (assembly): ev_26a73626639b8d12c76e9bffa89bcff9658f7ee192622c6bb1048ed0f1a62d4d)
L_11301:   ' entrada vinda de 010ff4_F_10ff4
RESUME L_11318   '@11306
L_11318:   ' entrada vinda de 010ff4_F_10ff4
ON ERROR GOTO L_11396
RT_ONERR = &H11396   '@1131d
RT_SCREEN 0   '@1132c
PCOPY 0, 1   '@11341
IF NOT (RT_MID$((V_0de4$), (1), (3)) = "HER") THEN GOTO L_11389   '@11352 DS:1114
V_0de4$ = "CGA"   '@11377 DS:0fe2
L_11389:
GOTO L_113bf   '@11389
' ---- F_11391 @0x11391  (011391_F_11391.lift.txt; evidence_id (assembly): ev_307dbdddbd039eadaf7ccf1c39189d34a5bd4a0ad839186f3666cb3a593c0904)
L_11396:   ' entrada vinda de 0112fc_F_112fc
V_0de4$ = "HER"   '@1139b DS:1114
RESUME L_113bf   '@113ad
L_113bf:   ' entrada vinda de 0112fc_F_112fc
ON ERROR GOTO L_1250d
RT_ONERR = &H1250d   '@113c4
IF NOT (UCASE$(RT_MID$((V_0de4$), (1), (3))) = "HER") THEN GOTO L_1154d   '@113d3 DS:1114
V_0df4! = 14.0   '@113fe DS:111c
V_0df8! = 0.0   '@1140f DS:1120
V_0dfc! = 9.0   '@11420 DS:1124
ON ERROR GOTO L_11478
RT_ONERR = &H11478   '@11431
RT_SCREEN 3   '@11440
RT_SCREEN 0   '@11456
GOTO L_11534   '@1146b
' ---- F_11473 @0x11473  (011473_F_11473.lift.txt; evidence_id (assembly): ev_ba0baec0201e0e5ce1e380218fdc23e9324cd02f73fdc561680c5a82a3001658)
L_11478:   ' entrada vinda de 011391_F_11391
RT_SCREEN 0   '@1147d
COLOR 7, 0, 0   '@11492
RT_CLS 0   '@114b6
PRINT ""   '@114c3 DS:0fde
PRINT " As Rotinas Graficas referentes a placa Hercules nao estao instaladas."   '@114d1 DS:1128
PRINT ""   '@114df DS:0fde
PRINT " Acione o modulo  HERCULES.COM  que esta no disco de instalacao  ou,"   '@114ed DS:1172
PRINT " no subdiretorio SISTRUT quando implantado em Winchester . "   '@114fb DS:11ba
PRINT " Este modulo ficara residente na memoria (+ - 7k)."   '@11509 DS:11fa
PRINT " E conveniente colocar o acionamento do mesmo pela AUTOEXEC.BAT  ."   '@11517 DS:1230
RT_FIM   '@11525 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_11534:   ' entrada vinda de 011391_F_11391
ON ERROR GOTO L_1250d
RT_ONERR = &H1250d   '@11539
L_1154d:   ' entrada vinda de 011391_F_11391
L_BP0c% = (LEN(V_0df0$) > 0)   '@1154d DS:1276
IF NOT ((VAL(V_0df0$) = 0.0# AND L_BP0c%) <> 0) THEN GOTO L_115a3   '@1156f
RT_SHELL V_0df0$   '@11590
L_115a3:
GOTO L_129d9   '@115a3
' ---- F_115ab @0x115ab  (0115ab_F_115ab.lift.txt; evidence_id (assembly): ev_817a3d2e18f77ae000ac315b9f165bac530891586877e7cf07fe83150a0547b1)
L_115b0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0129d9_FUN_1000_29d9
COLOR RT_CINT%(FX##(V_0df8!)), 7, 7   '@115b5
RT_VIEWPRINT 1, 25   '@115e2
RT_CLS 2   '@115f4
PRINT CHR$(201); RT_STRINGC$((78), (205)); CHR$(187)   '@11602
V_0e04! = 2.0   '@11638 DS:127e
L_1164e:
IF NOT (V_0e04! <= 24.0) THEN GOTO L_116f2   '@1164f DS:1282
LOCATE RT_CINT%(FX##(V_0e04!)), 1   '@11664
PRINT CHR$(186)   '@11686
LOCATE RT_CINT%(FX##(V_0e04!)), 80   '@1169a
PRINT CHR$(186)   '@116bf
V_0e04! = FX##(V_0e04!) + 1.0   '@116d3 DS:1002
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_1164e   '@116e9
L_116f2:
PRINT CHR$(200); RT_STRINGC$((78), (205)); CHR$(188);   '@116f2
COLOR (RT_MID$((V_0de4$), (1), (3)) = "HER") * 4 + 4   '@11728 DS:1114
LOCATE 2, 34   '@11763
PRINT "  OpenStrut  "   '@11781 DS:1286
LOCATE 3, 25   '@1178f
PRINT " Eng. reversa independente do "   '@117ad DS:1298
LOCATE 4, 25   '@117bb
PRINT "      SISTRUT 4.0 (1991)      "   '@117d9 DS:12ba
LOCATE 5, 27   '@117e7
PRINT "   sem vinculo oficial    "   '@11805 DS:12dc
COLOR RT_CINT%(FX##(V_0df8!))   '@11813
LOCATE 7, 14   '@11830
PRINT CHR$(218); CHR$(196); " ";   '@1184e DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@1187a
PRINT "P";   '@11897 DS:1300
COLOR RT_CINT%(FX##(V_0df8!))   '@118a5
PRINT "ortico "; RT_STRINGC$((10), (250))   '@118c2 DS:1306
LOCATE 8, 14   '@118e3
PRINT CHR$(179); RT_TAB$(35); ""; CHR$(58)   '@11901 DS:0fde
LOCATE 9, 14   '@11936
PRINT CHR$(195); CHR$(196); " ";   '@11954 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@11980
PRINT "G";   '@1199d DS:1312
COLOR RT_CINT%(FX##(V_0df8!))   '@119ab
PRINT "relha "; RT_STRINGC$((6), (250)); " Diagramas"   '@119c8 DS:1318,1322
LOCATE 10, 14   '@119f2
PRINT CHR$(179); RT_TAB$(35); ""; CHR$(58)   '@11a10 DS:0fde
LOCATE 11, 14   '@11a45
PRINT CHR$(195); CHR$(196); " ";   '@11a63 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@11a8f
PRINT "T";   '@11aac DS:1330
COLOR RT_CINT%(FX##(V_0df8!))   '@11aba
PRINT "relica "; RT_STRINGC$((10), (250))   '@11ad7 DS:1336
LOCATE 12, 14   '@11af8
PRINT CHR$(179)   '@11b16
LOCATE 13, 14   '@11b2a
PRINT CHR$(195); CHR$(196); " ";   '@11b48 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@11b74
PRINT "L";   '@11b91 DS:1342
COLOR RT_CINT%(FX##(V_0df8!))   '@11b9f
PRINT "aje "; RT_STRINGC$((16), (250)); " Desenho "; RT_STRINGC$((11), (250)); " Plotagem "; RT_STRINGC$((5), (250))   '@11bbc DS:1348,1350,135e
LOCATE 14, 14   '@11c15
PRINT CHR$(179); RT_TAB$(73); ""; CHR$(58)   '@11c33 DS:0fde
LOCATE 15, 14   '@11c68
PRINT CHR$(195); CHR$(196); " ";   '@11c86 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@11cb2
PRINT "V";   '@11ccf DS:136c
COLOR RT_CINT%(FX##(V_0df8!))   '@11cdd
PRINT "iga "; RT_STRINGC$((8), (250)); " Detalhamento & Desenho "; RT_STRINGC$((4), (250)); " Plotagem "; RT_STRINGC$((5), (250))   '@11cfa DS:135e,1372,137a
LOCATE 16, 14   '@11d53
PRINT CHR$(179); RT_TAB$(73); ""; CHR$(58)   '@11d71 DS:0fde
LOCATE 17, 14   '@11da6
PRINT CHR$(195); CHR$(196); " ";   '@11dc4 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@11df0
PRINT "A";   '@11e0d DS:1026
COLOR RT_CINT%(FX##(V_0df8!))   '@11e1b
PRINT "rmacao "   '@11e38 DS:1396
LOCATE 17, 71   '@11e46
COLOR RT_CINT%(FX##(V_0dfc!))   '@11e64
PRINT "F";   '@11e81 DS:10fc
COLOR RT_CINT%(FX##(V_0df8!))   '@11e8f
PRINT "orma "   '@11eac DS:13a2
LOCATE 18, 14   '@11eba
PRINT CHR$(179); RT_TAB$(73); ""; CHR$(58)   '@11ed8 DS:0fde
LOCATE 19, 14   '@11f0d
PRINT CHR$(195); CHR$(196); " P";   '@11f2b DS:13ac
COLOR RT_CINT%(FX##(V_0dfc!))   '@11f57
PRINT "i";   '@11f74 DS:13b2
COLOR RT_CINT%(FX##(V_0df8!))   '@11f82
PRINT "lar "; RT_STRINGC$((15), (250)); " Desenho "; RT_STRINGC$((11), (250)); " Plotagem "; RT_STRINGC$((5), (250))   '@11f9f DS:1350,135e,13b8
LOCATE 20, 14   '@11ff8
PRINT ":"   '@12016 DS:13c0
LOCATE 21, 14   '@12024
PRINT ":"   '@12042 DS:13c0
LOCATE 22, 14   '@12050
PRINT CHR$(195); CHR$(196); " ";   '@1206e DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@1209a
PRINT "C";   '@120b7 DS:0fd8
COLOR RT_CINT%(FX##(V_0df8!))   '@120c5
PRINT "onfiguracao "   '@120e2 DS:13c6
LOCATE 23, 14   '@120f0
PRINT CHR$(179)   '@1210e
LOCATE 24, 14   '@12122
PRINT CHR$(192); CHR$(196); " ";   '@12140 DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@1216c
PRINT "E";   '@12189 DS:10f6
COLOR RT_CINT%(FX##(V_0df8!))   '@12197
PRINT "ditor"   '@121b4 DS:13d6
COLOR 3, RT_CINT%(FX##(V_0df8!))   '@121c2
LOCATE 23, 49   '@121e7
PRINT " <F1> = Informacoes "   '@12205 DS:13e0
COLOR 7, 4   '@12213
LOCATE 21, 53   '@1222e
PRINT " <F2> = Fim "   '@1224c DS:13f8
COLOR RT_CINT%(FX##(V_0df8!)), 7   '@1225a
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
GOTO L_124fe   ' PROTECAO: verificacao de licenca do original desativada
L_12319:   ' entrada vinda de 010df9_F_10df9, 010ff4_F_10ff4, 0129d9_FUN_1000_29d9
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_124c0:
' PROTECAO (removido)
' PROTECAO (removido)
' ---- F_124db @0x124db  (0124db_F_124db.lift.txt; evidence_id (assembly): ev_007fd936f3c51ada4007a163be6475fd58016bd5fe47524c4b3f4c29049cf75a)
RT_FIM   '@124db (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
' @124e5 (trecho de 25 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
RT_FIM   '@124e5 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
RT_FIM   '@124ef (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_124fe:   ' entrada vinda de 0115ab_F_115ab
RETURN   '@124fe
L_1250d:   ' entrada vinda de 010030_M_SISTRUT, 011391_F_11391, 011473_F_11473, 0129d9_FUN_1000_29d9
RESUME L_12524   '@12512
L_12524:
BEEP   '@12529
BEEP   '@12533
RT_SCREEN 0   '@1253d
RT_VIEWPRINT 1, 25   '@12552
COLOR RT_CINT%(FX##(V_0df4!)), RT_CINT%(4.0 * FX##(V_0df8!)), RT_CINT%(4.0 * FX##(V_0df8!))   '@12564 DS:16ee
RT_CLS 0   '@125a9
LOCATE 10, 32   '@125b6
PRINT "Erro de Operacao"   '@125d4 DS:16f2
CALL MIXT_07f1_LimpaTeclado   '@125e2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dd4$ = RT_INPUT$(1)   '@125ec
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
GOTO L_129d9   '@12608
' ---- F_12610 @0x12610  (012610_F_12610.lift.txt; evidence_id (assembly): ev_2556646c541b271d42015d2ea07e91bf53c66d785e46581da60325db59c8ff77)
L_12615:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_SISTRUT, 0129d9_FUN_1000_29d9
ON KEY(1) GOSUB L_154ba
RT_ONKEY 1, 1   '@1261a
KEY(1) ON
RT_KEYESTADO 1, 1   '@1262d
ON KEY(2) GOSUB L_12906
RT_ONKEY 2, 2   '@1263b
KEY(2) ON
RT_KEYESTADO 2, 1   '@1264e
FOR V_0e04! = 3.0 TO 10.0   '@1265c DS:1002,1006,1706
ON KEY(RT_CINT%(FX##(V_0e04!))) GOSUB L_128db
RT_ONKEY RT_CINT%(FX##(V_0e04!)), 3   '@1266a
KEY(RT_CINT%(FX##(V_0e04!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e04!)), 1   '@12684
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@12699 DS:1002,1706
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@126c2
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@126ea
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@12712
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@1273a
FOR V_0e04! = 15.0 TO 18.0   '@12762 DS:0ffe,1002,170a
ON KEY(RT_CINT%(FX##(V_0e04!))) GOSUB L_12906
RT_ONKEY RT_CINT%(FX##(V_0e04!)), 2   '@12770
KEY(RT_CINT%(FX##(V_0e04!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e04!)), 1   '@1278a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@1279f DS:1002,170a
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@127c8
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@127f0
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@12818
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@12840
FOR V_0e04! = 19.0 TO 22.0   '@12867 DS:1002,170e,1712
ON KEY(RT_CINT%(FX##(V_0e04!))) GOSUB L_129ab
RT_ONKEY RT_CINT%(FX##(V_0e04!)), 4   '@12874
KEY(RT_CINT%(FX##(V_0e04!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e04!)), 1   '@1288e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@128a3 DS:1002,1712
RETURN   '@128cc
L_128db:
BEEP   '@128e0
GOSUB L_12615   '@128ea
RETURN   '@128f7
L_12906:
RT_VIEWPRINT 1, 25   '@1290b
COLOR 7, 0, 0   '@1291d
RT_CLS 0   '@12941
PRINT " Termino da Utilizacao do Sistema OpenStrut   Obrigado ..."   '@1294e DS:1716
PRINT ""   '@1295c DS:0fde
IF NOT (LEN(V_0ddc$) > 3) THEN GOTO L_1299c   '@1296a
CHDIR RT_ARQ$(RT_MID$((V_0ddc$), (1), (3)))   '@12980
L_1299c:
RT_FIM   '@1299c (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_129ab:
BEEP   '@129b0
GOSUB L_12615   '@129ba
RETURN L_129d9   '@129d1
' ---- FUN_1000_29d9 @0x129d9  (0129d9_FUN_1000_29d9.lift.txt; evidence_id (assembly): ev_aa58b99084baa1023aff898c935fedd7e49610316632595fc7535cfe571ea9a1)
L_129d9:   ' entrada vinda de 011473_F_11473, 0124db_F_124db, 012610_F_12610
GOSUB L_115b0   '@129de
RT_VIEWPRINT 1, 25   '@129eb
V_0dc6! = 10.0   '@129fd DS:1706
V_0e18! = 7.0   '@12a0e DS:1754
V_0e1c! = 17.0   '@12a1f DS:1758
V_0e20$ = " Portico "   '@12a30 DS:175c
V_0dca! = 7.0   '@12a42 DS:1754
V_0dce! = 17.0   '@12a53 DS:1758
L_12a69:
COLOR RT_CINT%(FX##(V_0df8!)), 7   '@12a6e
LOCATE RT_CINT%(FX##(V_0e18!)), RT_CINT%(FX##(V_0e1c!) - 1.0)   '@12a93 DS:176a
IF NOT (V_0e1c! = 71.0 OR V_0e1c! = 17.0) THEN GOTO L_12c4c   '@12ac4 DS:1758,176e
IF NOT (V_0e20$ = " Pilar ") THEN GOTO L_12ba2   '@12b02 DS:1772
COLOR RT_CINT%(FX##(V_0df8!))   '@12b19
PRINT " P";   '@12b36 DS:13ac
COLOR RT_CINT%(FX##(V_0dfc!))   '@12b44
PRINT "i";   '@12b61 DS:13b2
COLOR RT_CINT%(FX##(V_0df8!))   '@12b6f
PRINT "lar "   '@12b8c DS:13b8
GOTO L_12c44   '@12b9a
L_12ba2:
COLOR RT_CINT%(FX##(V_0df8!))   '@12ba2
PRINT " ";   '@12bbf DS:12fa
COLOR RT_CINT%(FX##(V_0dfc!))   '@12bcd
PRINT RT_MID$((V_0e20$), (2), (1));   '@12bea
COLOR RT_CINT%(FX##(V_0df8!))   '@12c06
PRINT RT_MID2$((V_0e20$), (3))   '@12c23
L_12c44:
GOTO L_12c5f   '@12c44
L_12c4c:
PRINT V_0e20$   '@12c4c
L_12c5f:
IF NOT (V_0dce! = 17.0) THEN GOTO L_12e5c   '@12c5f DS:1758
IF NOT (V_0dca! = 7.0) THEN GOTO L_12caf   '@12c7a DS:1754
V_0e20$ = " Portico "   '@12c95 DS:175c
GOTO L_12f4c   '@12ca7
L_12caf:
IF NOT (V_0dca! = 9.0) THEN GOTO L_12ce4   '@12caf DS:1124
V_0e20$ = " Grelha "   '@12cca DS:177e
GOTO L_12f4c   '@12cdc
L_12ce4:
IF NOT (V_0dca! = 11.0) THEN GOTO L_12d19   '@12ce4 DS:178a
V_0e20$ = " Trelica "   '@12cff DS:178e
GOTO L_12f4c   '@12d11
L_12d19:
IF NOT (V_0dca! = 13.0) THEN GOTO L_12d4e   '@12d19 DS:179c
V_0e20$ = " Laje "   '@12d34 DS:17a0
GOTO L_12f4c   '@12d46
L_12d4e:
IF NOT (V_0dca! = 15.0) THEN GOTO L_12d83   '@12d4e DS:0ffe
V_0e20$ = " Viga "   '@12d69 DS:17aa
GOTO L_12f4c   '@12d7b
L_12d83:
IF NOT (V_0dca! = 17.0) THEN GOTO L_12db8   '@12d83 DS:1758
V_0e20$ = " Armacao "   '@12d9e DS:17b4
GOTO L_12f4c   '@12db0
L_12db8:
IF NOT (V_0dca! = 19.0) THEN GOTO L_12ded   '@12db8 DS:170e
V_0e20$ = " Pilar "   '@12dd3 DS:1772
GOTO L_12f4c   '@12de5
L_12ded:
IF NOT (V_0dca! = 22.0) THEN GOTO L_12e22   '@12ded DS:1712
V_0e20$ = " Configuracao "   '@12e08 DS:17c2
GOTO L_12f4c   '@12e1a
L_12e22:
IF NOT (V_0dca! = 24.0) THEN GOTO L_12e57   '@12e22 DS:1282
V_0e20$ = " Editor "   '@12e3d DS:17d4
GOTO L_12f4c   '@12e4f
L_12e57:
L_12e5c:
IF NOT (V_0dce! = 31.0) THEN GOTO L_12ecb   '@12e5c DS:17e0
IF NOT (V_0dca! = 9.0) THEN GOTO L_12eac   '@12e77 DS:1124
V_0e20$ = " Diagramas "   '@12e92 DS:17e4
GOTO L_12f4c   '@12ea4
L_12eac:
V_0e20$ = " Detalhamento & Desenho "   '@12eac DS:137a
GOTO L_12f4c   '@12ebe
L_12ecb:
IF NOT (V_0dce! = 39.0) THEN GOTO L_12f00   '@12ecb DS:17f4
V_0e20$ = " Desenho "   '@12ee6 DS:1350
GOTO L_12f4c   '@12ef8
L_12f00:
IF NOT (V_0dce! = 59.0) THEN GOTO L_12f35   '@12f00 DS:17f8
V_0e20$ = " Plotagem "   '@12f1b DS:135e
GOTO L_12f4c   '@12f2d
L_12f35:
V_0e20$ = " Forma "   '@12f35 DS:17fc
L_12f4c:
COLOR RT_CINT%(FX##(V_0df4!)), 0   '@12f51
LOCATE RT_CINT%(FX##(V_0dca!)), RT_CINT%(FX##(V_0dce!) - 1.0)   '@12f75 DS:176a
PRINT V_0e20$   '@12fa6
V_0e18! = V_0dca!   '@12fb4
V_0e1c! = V_0dce!   '@12fc5
LOCATE 24, 50   '@12fd6
COLOR 0, 7   '@12ff4
PRINT V_0ddc$   '@13011
CALL MIXT_07f1_LimpaTeclado   '@1301f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
L_1302e:
V_0dd4$ = RT_INKEY$   '@1302e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
IF V_0dd4$ = "" THEN GOTO L_1302e   '@13042 DS:0fde
COLOR RT_CINT%(FX##(V_0df8!)), 7   '@13056
V_0e24$ = V_0dd4$   '@1307b
IF NOT (V_0e24$ <> "8") THEN GOTO L_130cb   '@1308d DS:1808
IF NOT (CHR$(0) + CHR$(72) = V_0e24$) THEN GOTO L_1311a   '@130a4
L_130cb:
V_0e28! = 10.0   '@130cb DS:1706
V_0e2c! = FX##(V_0dc6!) - 10.0   '@130dd DS:180e
CALL MIXT_082a_Maior(V_0e28!, V_0e2c!, V_0e30!)   '@130ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dc6! = V_0e30!   '@130ff
GOTO L_136d3   '@1310a
L_1311a:
IF NOT (V_0e24$ <> "2") THEN GOTO L_13153   '@1311a DS:1812
IF NOT (CHR$(0) + CHR$(80) = V_0e24$) THEN GOTO L_131a2   '@1312c
L_13153:
V_0e34! = 90.0   '@13153 DS:1818
V_0e38! = FX##(V_0dc6!) + 10.0   '@13165 DS:1706
CALL MIXT_0877_Menor(V_0e34!, V_0e38!, V_0e3c!)   '@13175
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dc6! = V_0e3c!   '@13187
GOTO L_136d3   '@13192
L_131a2:
IF NOT (V_0e24$ <> "4") THEN GOTO L_131db   '@131a2 DS:181c
IF NOT (CHR$(0) + CHR$(75) = V_0e24$) THEN GOTO L_1323b   '@131b4
L_131db:
V_0e40! = INT(FX##(V_0dc6!) / 10.0) * 10.0   '@131db DS:1706
V_0e44! = FX##(V_0dc6!) - 1.0   '@131fe DS:176a
CALL MIXT_082a_Maior(V_0e40!, V_0e44!, V_0e48!)   '@1320e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dc6! = V_0e48!   '@13220
GOTO L_136d3   '@1322b
L_1323b:
IF NOT (V_0e24$ <> "6") THEN GOTO L_13274   '@1323b DS:1822
IF NOT (CHR$(0) + CHR$(77) = V_0e24$) THEN GOTO L_132d9   '@1324d
L_13274:
V_0e4c! = INT(FX##(V_0dc6!) / 10.0) * 10.0 + 3.0   '@13274 DS:1006,1706
V_0e50! = FX##(V_0dc6!) + 1.0   '@1329c DS:1002
CALL MIXT_0877_Menor(V_0e4c!, V_0e50!, V_0e54!)   '@132ac
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dc6! = V_0e54!   '@132be
GOTO L_136d3   '@132c9
L_132d9:
IF NOT (V_0e24$ <> "P") THEN GOTO L_132fd   '@132d9 DS:1300
IF NOT (V_0e24$ = "p") THEN GOTO L_1331e   '@132eb DS:1828
L_132fd:
V_0dc6! = 10.0   '@132fd DS:1706
GOTO L_1391d   '@1330e
L_1331e:
IF NOT (V_0e24$ <> "G") THEN GOTO L_13342   '@1331e DS:1312
IF NOT (V_0e24$ = "g") THEN GOTO L_13363   '@13330 DS:182e
L_13342:
V_0dc6! = 20.0   '@13342 DS:1834
GOTO L_1391d   '@13353
L_13363:
IF NOT (V_0e24$ <> "T") THEN GOTO L_13387   '@13363 DS:1330
IF NOT (V_0e24$ = "t") THEN GOTO L_133a8   '@13375 DS:1838
L_13387:
V_0dc6! = 30.0   '@13387 DS:183e
GOTO L_1391d   '@13398
L_133a8:
IF NOT (V_0e24$ <> "L") THEN GOTO L_133cc   '@133a8 DS:1342
IF NOT (V_0e24$ = "l") THEN GOTO L_133ed   '@133ba DS:1842
L_133cc:
V_0dc6! = 40.0   '@133cc DS:1848
GOTO L_1391d   '@133dd
L_133ed:
IF NOT (V_0e24$ <> "V") THEN GOTO L_13411   '@133ed DS:136c
IF NOT (V_0e24$ = "v") THEN GOTO L_13432   '@133ff DS:184c
L_13411:
V_0dc6! = 50.0   '@13411 DS:1852
GOTO L_1391d   '@13422
L_13432:
IF NOT (V_0e24$ <> "A") THEN GOTO L_13456   '@13432 DS:1026
IF NOT (V_0e24$ = "a") THEN GOTO L_13477   '@13444 DS:1856
L_13456:
V_0dc6! = 60.0   '@13456 DS:185c
GOTO L_1391d   '@13467
L_13477:
IF NOT (V_0e24$ <> "F") THEN GOTO L_1349b   '@13477 DS:10fc
IF NOT (V_0e24$ = "f") THEN GOTO L_134bc   '@13489 DS:1860
L_1349b:
V_0dc6! = 63.0   '@1349b DS:1866
GOTO L_1391d   '@134ac
L_134bc:
IF NOT (V_0e24$ <> "I") THEN GOTO L_134e0   '@134bc DS:1046
IF NOT (V_0e24$ = "i") THEN GOTO L_13501   '@134ce DS:13b2
L_134e0:
V_0dc6! = 70.0   '@134e0 DS:186a
GOTO L_1391d   '@134f1
L_13501:
IF NOT (V_0e24$ <> "C") THEN GOTO L_13525   '@13501 DS:0fd8
IF NOT (V_0e24$ = "c") THEN GOTO L_13546   '@13513 DS:186e
L_13525:
V_0dc6! = 80.0   '@13525 DS:1874
GOTO L_1391d   '@13536
L_13546:
IF NOT (V_0e24$ <> "E") THEN GOTO L_1356a   '@13546 DS:10f6
IF NOT (V_0e24$ = "e") THEN GOTO L_1358b   '@13558 DS:1878
L_1356a:
V_0dc6! = 90.0   '@1356a DS:1818
GOTO L_1391d   '@1357b
L_1358b:
IF NOT (CHR$(13) = V_0e24$) THEN GOTO L_135d2   '@1358b
GOTO L_13d85   ' PROTECAO: verificacao de licenca do original desativada
GOTO L_13d85   '@135b2
L_135c2:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12319   '@135c2
L_135d2:
IF NOT (V_0e24$ <> "0") THEN GOTO L_1360b   '@135d2 DS:187e
IF NOT (CHR$(0) + CHR$(82) = V_0e24$) THEN GOTO L_136b7   '@135e4
L_1360b:
IF NOT (INSTR(V_0ddc$, "EXEC40") > 0) THEN GOTO L_13659   '@1360b DS:1884
RT_MIDCHK (INSTR(V_0ddc$, "4")), (2): MID$(V_0ddc$, INSTR(V_0ddc$, "4"), 2) = "32"   '@13624 DS:181c,188e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12f4c   '@1364c
L_13659:
IF NOT (INSTR(V_0ddc$, "EXEC32") > 0) THEN GOTO L_136a7   '@13659 DS:1894
RT_MIDCHK (INSTR(V_0ddc$, "3")), (2): MID$(V_0ddc$, INSTR(V_0ddc$, "3"), 2) = "40"   '@13672 DS:10a6,189e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12f4c   '@1369a
L_136a7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12f4c   '@136a7
L_136b7:
BEEP   '@136b7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12a69   '@136c1
L_136d3:
IF NOT (V_0dc6! = 11.0) THEN GOTO L_1370c   '@136d8 DS:178a
V_0dc6! = 21.0   '@136f3 DS:18a4
GOTO L_1391d   '@13704
L_1370c:
IF NOT (V_0dc6! = 31.0) THEN GOTO L_13740   '@1370c DS:17e0
V_0dc6! = 21.0   '@13727 DS:18a4
GOTO L_1391d   '@13738
L_13740:
IF NOT (V_0dc6! < 30.0) THEN GOTO L_13791   '@13740 DS:183e
V_0e58! = 21.0   '@1375b DS:18a4
CALL MIXT_0877_Menor(V_0e58!, V_0dc6!, V_0e5c!)   '@1376c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dc6! = V_0e5c!   '@1377e
GOTO L_1391d   '@13789
L_13791:
IF NOT (V_0dc6! = 32.0) THEN GOTO L_137c5   '@13791 DS:18a8
V_0dc6! = 30.0   '@137ac DS:183e
GOTO L_1391d   '@137bd
L_137c5:
IF NOT (V_0dc6! < 40.0) THEN GOTO L_137e8   '@137c5 DS:1848
GOTO L_1391d   '@137e0
L_137e8:
IF NOT (V_0dc6! = 63.0 OR (V_0dc6! = 73.0 OR (V_0dc6! = 53.0 OR V_0dc6! = 43.0))) THEN GOTO L_13875   '@137e8 DS:1866,18ac,18b0,18b4
V_0dc6! = 63.0   '@1385c DS:1866
GOTO L_1391d   '@1386d
L_13875:
IF NOT (V_0dc6! < 70.0 AND V_0dc6! > 53.0) THEN GOTO L_138cc   '@13875 DS:186a,18b0
V_0dc6! = 60.0   '@138b3 DS:185c
GOTO L_1391d   '@138c4
L_138cc:
IF NOT (V_0dc6! > 73.0) THEN GOTO L_13918   '@138cc DS:18b4
V_0dc6! = 10& * (RT_CLNG&(FX##(V_0dc6!)) \ 10&)   '@138e7
L_13918:
L_1391d:
V_0e60! = V_0dc6!   '@13922
IF NOT (V_0e60! = 10.0) THEN GOTO L_13978   '@13933 DS:1706
V_0dca! = 7.0   '@1394e DS:1754
V_0dce! = 17.0   '@1395f DS:1758
GOTO L_13d78   '@13970
L_13978:
IF NOT (V_0e60! = 20.0) THEN GOTO L_139b8   '@13979 DS:1834
V_0dca! = 9.0   '@1398e DS:1124
V_0dce! = 17.0   '@1399f DS:1758
GOTO L_13d78   '@139b0
L_139b8:
IF NOT (V_0e60! = 21.0) THEN GOTO L_139f8   '@139b9 DS:18a4
V_0dca! = 9.0   '@139ce DS:1124
V_0dce! = 31.0   '@139df DS:17e0
GOTO L_13d78   '@139f0
L_139f8:
IF NOT (V_0e60! = 30.0) THEN GOTO L_13a38   '@139f9 DS:183e
V_0dca! = 11.0   '@13a0e DS:178a
V_0dce! = 17.0   '@13a1f DS:1758
GOTO L_13d78   '@13a30
L_13a38:
IF NOT (V_0e60! = 40.0) THEN GOTO L_13a78   '@13a39 DS:1848
V_0dca! = 13.0   '@13a4e DS:179c
V_0dce! = 17.0   '@13a5f DS:1758
GOTO L_13d78   '@13a70
L_13a78:
IF NOT (V_0e60! = 41.0) THEN GOTO L_13ab8   '@13a79 DS:18b8
V_0dca! = 13.0   '@13a8e DS:179c
V_0dce! = 39.0   '@13a9f DS:17f4
GOTO L_13d78   '@13ab0
L_13ab8:
IF NOT (V_0e60! = 42.0) THEN GOTO L_13af8   '@13ab9 DS:18bc
V_0dca! = 13.0   '@13ace DS:179c
V_0dce! = 59.0   '@13adf DS:17f8
GOTO L_13d78   '@13af0
L_13af8:
IF NOT (V_0e60! = 50.0) THEN GOTO L_13b38   '@13af9 DS:1852
V_0dca! = 15.0   '@13b0e DS:0ffe
V_0dce! = 17.0   '@13b1f DS:1758
GOTO L_13d78   '@13b30
L_13b38:
IF NOT (V_0e60! = 51.0) THEN GOTO L_13b78   '@13b39 DS:18c0
V_0dca! = 15.0   '@13b4e DS:0ffe
V_0dce! = 31.0   '@13b5f DS:17e0
GOTO L_13d78   '@13b70
L_13b78:
IF NOT (V_0e60! = 52.0) THEN GOTO L_13bb8   '@13b79 DS:18c4
V_0dca! = 15.0   '@13b8e DS:0ffe
V_0dce! = 59.0   '@13b9f DS:17f8
GOTO L_13d78   '@13bb0
L_13bb8:
IF NOT (V_0e60! = 60.0) THEN GOTO L_13bf8   '@13bb9 DS:185c
V_0dca! = 17.0   '@13bce DS:1758
V_0dce! = 17.0   '@13bdf DS:1758
GOTO L_13d78   '@13bf0
L_13bf8:
IF NOT (V_0e60! = 63.0) THEN GOTO L_13c38   '@13bf9 DS:1866
V_0dca! = 17.0   '@13c0e DS:1758
V_0dce! = 71.0   '@13c1f DS:176e
GOTO L_13d78   '@13c30
L_13c38:
IF NOT (V_0e60! = 70.0) THEN GOTO L_13c78   '@13c39 DS:186a
V_0dca! = 19.0   '@13c4e DS:170e
V_0dce! = 17.0   '@13c5f DS:1758
GOTO L_13d78   '@13c70
L_13c78:
IF NOT (V_0e60! = 71.0) THEN GOTO L_13cb8   '@13c79 DS:176e
V_0dca! = 19.0   '@13c8e DS:170e
V_0dce! = 39.0   '@13c9f DS:17f4
GOTO L_13d78   '@13cb0
L_13cb8:
IF NOT (V_0e60! = 72.0) THEN GOTO L_13cf8   '@13cb9 DS:18c8
V_0dca! = 19.0   '@13cce DS:170e
V_0dce! = 59.0   '@13cdf DS:17f8
GOTO L_13d78   '@13cf0
L_13cf8:
IF NOT (V_0e60! = 80.0) THEN GOTO L_13d38   '@13cf9 DS:1874
V_0dca! = 22.0   '@13d0e DS:1712
V_0dce! = 17.0   '@13d1f DS:1758
GOTO L_13d78   '@13d30
L_13d38:
IF NOT (V_0e60! = 90.0) THEN GOTO L_13d78   '@13d39 DS:1818
V_0dca! = 24.0   '@13d4e DS:1282
V_0dce! = 17.0   '@13d5f DS:1758
GOTO L_13d78   '@13d70
L_13d78:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12a69   '@13d78
L_13d85:
RT_VIEWPRINT 1, 25   '@13d8a
V_0e64! = V_0dc6!   '@13d9c
IF NOT (V_0e64! = 10.0) THEN GOTO L_13dea   '@13dad DS:1706
V_0dd4$ = "PORTICO"   '@13dc8 DS:18cc
GOTO L_14181   '@13dda
L_13dea:
IF NOT (V_0e64! = 20.0) THEN GOTO L_13e22   '@13deb DS:1834
V_0dd4$ = "GRELHA"   '@13e00 DS:18d8
GOTO L_14181   '@13e12
L_13e22:
IF NOT (V_0e64! = 30.0) THEN GOTO L_13e5a   '@13e23 DS:183e
V_0dd4$ = "TRELICA"   '@13e38 DS:18e2
GOTO L_14181   '@13e4a
L_13e5a:
IF NOT (V_0e64! = 40.0) THEN GOTO L_13e92   '@13e5b DS:1848
V_0dd4$ = "LAJE"   '@13e70 DS:18ee
GOTO L_14181   '@13e82
L_13e92:
IF NOT (V_0e64! = 50.0) THEN GOTO L_13eca   '@13e93 DS:1852
V_0dd4$ = "VIGA"   '@13ea8 DS:18f6
GOTO L_14181   '@13eba
L_13eca:
IF NOT (V_0e64! = 60.0) THEN GOTO L_13f02   '@13ecb DS:185c
V_0dd4$ = "ARMADURA"   '@13ee0 DS:18fe
GOTO L_14181   '@13ef2
L_13f02:
IF NOT (V_0e64! = 63.0) THEN GOTO L_13f3a   '@13f03 DS:1866
V_0dd4$ = "FORMA"   '@13f18 DS:190a
GOTO L_14181   '@13f2a
L_13f3a:
IF NOT (V_0e64! = 70.0) THEN GOTO L_13f72   '@13f3b DS:186a
V_0dd4$ = "PILAR"   '@13f50 DS:1914
GOTO L_14181   '@13f62
L_13f72:
IF NOT (V_0e64! = 21.0) THEN GOTO L_13faa   '@13f73 DS:18a4
V_0dd4$ = "DIAGRAMA"   '@13f88 DS:191e
GOTO L_14181   '@13f9a
L_13faa:
IF NOT (V_0e64! = 41.0) THEN GOTO L_13fe2   '@13fab DS:18b8
V_0dd4$ = "LDESENHO"   '@13fc0 DS:192a
GOTO L_14181   '@13fd2
L_13fe2:
IF NOT (V_0e64! = 51.0) THEN GOTO L_1401a   '@13fe3 DS:18c0
V_0dd4$ = "DESENHO"   '@13ff8 DS:1936
GOTO L_14181   '@1400a
L_1401a:
IF NOT (V_0e64! = 71.0) THEN GOTO L_14052   '@1401b DS:176e
V_0dd4$ = "PDESENHO"   '@14030 DS:1942
GOTO L_14181   '@14042
L_14052:
IF NOT (V_0e64! = 42.0) THEN GOTO L_1408a   '@14053 DS:18bc
V_0dd4$ = "LPLOTA"   '@14068 DS:194e
GOTO L_14181   '@1407a
L_1408a:
IF NOT (V_0e64! = 52.0) THEN GOTO L_140c2   '@1408b DS:18c4
V_0dd4$ = "VPLOTA"   '@140a0 DS:1958
GOTO L_14181   '@140b2
L_140c2:
IF NOT (V_0e64! = 72.0) THEN GOTO L_140fa   '@140c3 DS:18c8
V_0dd4$ = "PPLOTA"   '@140d8 DS:1962
GOTO L_14181   '@140ea
L_140fa:
IF NOT (V_0e64! = 80.0) THEN GOTO L_1412d   '@140fb DS:1874
GOSUB L_14593   '@14110
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_129d9   '@1411d
L_1412d:
IF NOT (V_0e64! = 90.0) THEN GOTO L_14165   '@1412e DS:1818
V_0dd4$ = "SISEDIT"   '@14143 DS:196c
GOTO L_14181   '@14155
L_14165:
BEEP   '@14165
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_12f4c   '@1416f
L_14181:
COLOR 7, 0, 0   '@14186
RT_CLS 0   '@141aa
PRINT " Aguarde ..."   '@141b7 DS:1978
PRINT ""   '@141c5 DS:0fde
PRINT "OpenStrut (eng. reversa independente) "   '@141d3 DS:1988
PRINT "Leitura do Modulo "; V_0dd4$   '@141e1 DS:19b2
PRINT RT_MID$((V_0de4$), (1), (3)) + " " + V_0de8$ + " " + V_0dec$ + " " + V_0ddc$   '@141f8 DS:12fa
IF NOT (LEN(V_0ddc$) = 3) THEN GOTO L_14274   '@14250
CHDIR RT_ARQ$(V_0ddc$)   '@14266
L_14274:
IF NOT (LEN(V_0ddc$) > 3) THEN GOTO L_142af   '@14274
CHDIR RT_ARQ$(RT_MID$((V_0ddc$), (1), (LEN(V_0ddc$) - 8)))   '@1428a
L_142af:
IF NOT (RT_INSTR%((1), (V_0ddc$), ("EXEC32")) > 0) THEN GOTO L_142d4   '@142af DS:1894
GOTO L_144a9   '@142cc
L_142d4:
L_142d9:
ON ERROR GOTO L_1435c
RT_ONERR = &H1435c   '@142de
IF NOT (V_0dd4$ = "SISEDIT") THEN GOTO L_14328   '@142ed DS:196c
V_0e68$ = V_0dd8$ + V_0dd4$   '@14304
GOTO L_14349   '@14320
L_14328:
V_0e68$ = V_0ddc$ + V_0dd4$   '@14328
L_14349:
RT_CHAIN V_0e68$   '@14349
L_1435c:
L_BP0c% = (V_0dc6! = 51.0 AND ERR = 53)   '@14361 DS:18c0
IF NOT ((V_0dd4$ = "DESENHO" AND L_BP0c%) <> 0) THEN GOTO L_143d3   '@1439a DS:1936
V_0dd4$ = "DETALHA"   '@143af DS:19c8
RESUME L_142d9   '@143c1
L_143d3:
L_BP0c% = (V_0dc6! = 51.0)   '@143d3 DS:18c0
IF NOT ((V_0dd4$ = "DETALHA" AND L_BP0c%) <> 0) THEN GOTO L_14423   '@143fc DS:19c8
V_0dd4$ = "DESENHO"   '@14411 DS:1936
L_14423:
RESUME L_14435   '@14423
L_14435:
L_BP0c% = (RT_INSTR%((1), (" 10 20 30 40 50 60 70 51"), (STR$(V_0dc6!))) > 0)   '@1443a DS:19d4
IF NOT ((RT_INSTR%((1), (V_0ddc$), ("EXEC40")) > 0 AND L_BP0c%) <> 0) THEN GOTO L_14571   '@14471 DS:1884
PRINT ""   '@14488 DS:0fde
PRINT "Versao 4.0 nao encontrda   -   Acionando Versao 3.2"   '@14496 DS:19f0
L_144a9:
ON ERROR GOTO L_1450d
RT_ONERR = &H1450d   '@144ae
V_0e68$ = RT_MID$((V_0ddc$), (1), (LEN(V_0ddc$) - 8)) + "\EXEC32\" + V_0dd4$   '@144bd DS:1a28
RT_RUN V_0e68$   '@144fa
L_1450d:
IF NOT (V_0dd4$ = "DESENHO") THEN GOTO L_14550   '@14512 DS:1936
V_0dd4$ = "DETALHA"   '@14529 DS:19c8
RESUME L_144a9   '@1453b
' @14548 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_14562   '@14548
L_14550:
RESUME L_14567   '@14550
L_14562:
L_14567:
L_14571:
ON ERROR GOTO L_1250d
RT_ONERR = &H1250d   '@14571
ERROR 53   '@14580
L_14593:   ' sub-rotina (alvo de GOSUB)
COLOR 7, RT_CINT%(FX##(V_0df8!))   '@14598
LOCATE 2, 3   '@145bd
PRINT CHR$(201); RT_STRINGC$((73), (205)); CHR$(187)   '@145db
FOR V_0e04! = 3.0 TO 6.0   '@14611 DS:1002,1006,1a34
LOCATE RT_CINT%(FX##(V_0e04!)), 3   '@1461e
COLOR 7   '@14643
PRINT CHR$(186); RT_STRINGC$((73), (32)); CHR$(186);   '@14659
COLOR 0   '@1468f
PRINT CHR$(219)   '@146a4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@146b8 DS:1002,1a34
COLOR 7   '@146e4
LOCATE 7, 3   '@146fa
PRINT CHR$(200); RT_STRINGC$((73), (205)); CHR$(188);   '@14718
COLOR 0   '@1474e
PRINT CHR$(219)   '@14763
LOCATE 8, 5   '@14777
PRINT RT_STRINGC$((74), (219))   '@14795
V_0e6c! = 0.0   '@147ad DS:1120
V_0e70! = 1.0   '@147bf DS:1002
V_0e74$ = RT_MID$((V_0de4$), (1), (3))   '@147ca
CALL MIXT_0dbe_GuardaTela(V_0e6c!, V_0e70!, V_0e74$)   '@147e5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @147f6 libera strings locais (V_0e74)
L_14804:
COLOR 7   '@14809
LOCATE 4, 5   '@1481f
PRINT "Drive:\Diretorio ...onde estao os executaveis .EXE"   '@1483d DS:1a38
COLOR 15   '@1484b
LOCATE 5, 5   '@14861
PRINT "*"; V_0ddc$; "* ";   '@1487f DS:1a6e,1a74
COLOR 7   '@1489f
CALL MIXT_07f1_LimpaTeclado   '@148b5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0dd4$   '@148bf DS:0fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0dd4$) > 0) THEN GOTO L_149bb   '@148d9
IF NOT (LEN(V_0dd4$) = 1) THEN GOTO L_14920   '@148ee
V_0dd4$ = V_0dd4$ + ":\"   '@14904 DS:1032
L_14920:
IF NOT (RT_RIGHT$((V_0dd4$), (1)) <> "\") THEN GOTO L_1495d   '@14920 DS:1062
V_0dd4$ = V_0dd4$ + "\"   '@14941 DS:1062
L_1495d:
IF NOT (RT_INSTR%((1), (V_0dd4$), (":\")) = 0) THEN GOTO L_1498c   '@1495d DS:1032
BEEP   '@1497a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14804   '@14984
L_1498c:
V_0dd4$ = UCASE$(V_0dd4$)   '@1498c
V_0ddc$ = V_0dd4$   '@149a4
L_149bb:
V_0e78! = 1.0   '@149bb DS:1002
V_0e7c! = 0.0   '@149cd DS:1120
V_0e80$ = RT_MID$((V_0de4$), (1), (3))   '@149d8
CALL MIXT_0dbe_GuardaTela(V_0e78!, V_0e7c!, V_0e80$)   '@149f3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @14a04 libera strings locais (V_0e80)
L_14a12:
LOCATE 4, 5   '@14a17
V_0e84$ = V_0de4$   '@14a35
IF NOT (V_0e84$ = "CGA") THEN GOTO L_14a74   '@14a47 DS:0fe2
PRINT "Monitor  <*1*>CGA  <2>HERCULES\MONOCROMATICO  <3>EGA  <4>VGA  <5>MCGA"   '@14a5e DS:1a7a
GOTO L_14b14   '@14a6c
L_14a74:
IF NOT (V_0e84$ = "HER") THEN GOTO L_14a9c   '@14a74 DS:1114
PRINT "Monitor  <1>CGA  <*2*>HERCULES\MONOCROMATICO  <3>EGA  <4>VGA  <5>MCGA"   '@14a86 DS:1ac4
GOTO L_14b14   '@14a94
L_14a9c:
IF NOT (V_0e84$ = "EGA") THEN GOTO L_14ac4   '@14a9c DS:1b0e
PRINT "Monitor  <1>CGA  <2>HERCULES\MONOCROMATICO  <*3*>EGA  <4>VGA  <5>MCGA"   '@14aae DS:1b16
GOTO L_14b14   '@14abc
L_14ac4:
IF NOT (V_0e84$ = "VGA") THEN GOTO L_14aec   '@14ac4 DS:1b60
PRINT "Monitor  <1>CGA  <2>HERCULES\MONOCROMATICO  <3>EGA  <*4*>VGA  <5>MCGA"   '@14ad6 DS:1b68
GOTO L_14b14   '@14ae4
L_14aec:
IF NOT (V_0e84$ = "MCGA") THEN GOTO L_14b14   '@14aec DS:1bb2
PRINT "Monitor  <1>CGA  <2>HERCULES\MONOCROMATICO  <3>EGA  <4>VGA  <*5*>MCGA"   '@14afe DS:1bba
GOTO L_14b14   '@14b0c
L_14b14:
LOCATE 5, 5   '@14b14
CALL MIXT_07f1_LimpaTeclado   '@14b32
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0dd4$   '@14b3c DS:0fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
L_BP0c% = (V_0de4$ = "HER")   '@14b56 DS:1114
IF NOT ((V_0dd4$ <> "2" AND L_BP0c%) <> 0) THEN GOTO L_14ba2   '@14b7b DS:1812
BEEP   '@14b90
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14a12   '@14b9a
L_14ba2:
V_0e88$ = V_0dd4$   '@14ba2
IF NOT (V_0e88$ = "1") THEN GOTO L_14be5   '@14bb4 DS:1c04
V_0de4$ = "CGA"   '@14bcb DS:0fe2
GOTO L_14d11   '@14bdd
L_14be5:
IF NOT (V_0e88$ = "2") THEN GOTO L_14c5c   '@14be5 DS:1812
IF NOT (V_0de4$ <> "HER") THEN GOTO L_14c20   '@14bf7 DS:1114
BEEP   '@14c0e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14a12   '@14c18
L_14c20:
V_0de4$ = "HERCULES"   '@14c20 DS:1c0a
V_0df4! = 14.0   '@14c32 DS:111c
V_0df8! = 0.0   '@14c43 DS:1120
GOTO L_14d11   '@14c54
L_14c5c:
IF NOT (V_0e88$ = "3") THEN GOTO L_14c88   '@14c5c DS:10a6
V_0de4$ = "EGA"   '@14c6e DS:1b0e
GOTO L_14d11   '@14c80
L_14c88:
IF NOT (V_0e88$ = "4") THEN GOTO L_14cb4   '@14c88 DS:181c
V_0de4$ = "VGA"   '@14c9a DS:1b60
GOTO L_14d11   '@14cac
L_14cb4:
IF NOT (V_0e88$ = "5") THEN GOTO L_14ce0   '@14cb4 DS:1c16
V_0de4$ = "MCGA"   '@14cc6 DS:1bb2
GOTO L_14d11   '@14cd8
L_14ce0:
IF NOT (LEN(V_0dd4$) > 0) THEN GOTO L_14d0c   '@14ce0
BEEP   '@14cf5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14a12   '@14cff
L_14d0c:
L_14d11:
V_0e8c! = 1.0   '@14d11 DS:1002
V_0e90! = 0.0   '@14d23 DS:1120
V_0e94$ = RT_MID$((V_0de4$), (1), (3))   '@14d2e
CALL MIXT_0dbe_GuardaTela(V_0e8c!, V_0e90!, V_0e94$)   '@14d49
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @14d5a libera strings locais (V_0e94)
L_14d68:
LOCATE 4, 5   '@14d6d
PRINT "Impressora Paralela conectada em  <*1*>LPT1:  <2>LPT2:"   '@14d8b DS:1c1c
LOCATE 5, 5   '@14d99
CALL MIXT_07f1_LimpaTeclado   '@14db7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0dd4$   '@14dc1 DS:0fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0dd4$) = 0) THEN GOTO L_14e02   '@14ddb
V_0dd4$ = "1"   '@14df0 DS:1c04
L_14e02:
V_0e98$ = V_0dd4$   '@14e02
IF NOT (V_0e98$ = "1") THEN GOTO L_14e45   '@14e14 DS:1c04
V_0de8$ = "LPT1:"   '@14e2b DS:0fea
GOTO L_14e88   '@14e3d
L_14e45:
IF NOT (V_0e98$ = "2") THEN GOTO L_14e71   '@14e45 DS:1812
V_0de8$ = "LPT2:"   '@14e57 DS:1c56
GOTO L_14e88   '@14e69
L_14e71:
BEEP   '@14e71
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14d68   '@14e7b
L_14e88:
V_0e9c! = 1.0   '@14e88 DS:1002
V_0ea0! = 0.0   '@14e9a DS:1120
V_0ea4$ = RT_MID$((V_0de4$), (1), (3))   '@14ea5
CALL MIXT_0dbe_GuardaTela(V_0e9c!, V_0ea0!, V_0ea4$)   '@14ec0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @14ed1 libera strings locais (V_0ea4)
L_14edf:
LOCATE 4, 5   '@14ee4
PRINT "Comunicacao Serial/Mouse conectada em  <*1*>COM1:  <2>COM2:"   '@14f02 DS:1c60
LOCATE 5, 5   '@14f10
CALL MIXT_07f1_LimpaTeclado   '@14f2e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0dd4$   '@14f38 DS:0fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0dd4$) = 0) THEN GOTO L_14f79   '@14f52
V_0dd4$ = "1"   '@14f67 DS:1c04
L_14f79:
V_0ea8$ = V_0dd4$   '@14f79
IF NOT (V_0ea8$ = "1") THEN GOTO L_14fbc   '@14f8b DS:1c04
V_0dec$ = "COM1:"   '@14fa2 DS:0ff4
GOTO L_14fff   '@14fb4
L_14fbc:
IF NOT (V_0ea8$ = "2") THEN GOTO L_14fe8   '@14fbc DS:1812
V_0dec$ = "COM2:"   '@14fce DS:1ca0
GOTO L_14fff   '@14fe0
L_14fe8:
BEEP   '@14fe8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
GOTO L_14edf   '@14ff2
L_14fff:
V_0eac! = 1.0   '@14fff DS:1002
V_0eb0! = 0.0   '@15011 DS:1120
V_0eb4$ = RT_MID$((V_0de4$), (1), (3))   '@1501c
CALL MIXT_0dbe_GuardaTela(V_0eac!, V_0eb0!, V_0eb4$)   '@15037
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @15048 libera strings locais (V_0eb4)
LOCATE 4, 5   '@1505b
PRINT "Nome do arquivo .BAT .COM ou .EXE a ser executado na entrada do Sistema"   '@15079 DS:1caa
COLOR 15   '@15087
LOCATE 5, 5   '@1509d
PRINT "Drive:\Diretorio...\Arquivo ";   '@150bb DS:1cf6
COLOR 15   '@150c9
RT_LINEINPUT "", V_0df0$   '@150df DS:0fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0eb8! = 1.0   '@15103 DS:1002
V_0ebc! = 0.0   '@15115 DS:1120
V_0ec0$ = RT_MID$((V_0de4$), (1), (3))   '@15120
CALL MIXT_0dbe_GuardaTela(V_0eb8!, V_0ebc!, V_0ec0$)   '@1513b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
' @1514c libera strings locais (V_0ec0)
V_0dd8$ = RT_MID$((V_0ddc$), (1), (11))   '@15155
L_BP0c% = (RT_MID$((V_0ddc$), (1), (1)) = "A")   '@15175 DS:1026
IF NOT ((RT_MID$((V_0ddc$), (1), (1)) = "B" OR L_BP0c%) <> 0) THEN GOTO L_15242   '@151a6 DS:102c
V_0dd8$ = V_0ddc$   '@151c5
LOCATE 3, 5   '@151d7
PRINT " Coloque o Disco Instalacao de Utilizacao no drive "; RT_MID$((V_0ddc$), (1), (1));   '@151f5 DS:1d16
CALL MIXT_07f1_LimpaTeclado   '@15217
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dd4$ = RT_INPUT$(1)   '@15221
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
L_15242:
LOCATE 4, 5   '@15242
PRINT " Aguarde ...   gravando o arquivo inicializacao... "   '@15260 DS:1d4e
LOCATE 5, 5   '@1526e
PRINT " "; V_0ddc$; "SISTRUT.INI"   '@1528c DS:104c,12fa
OPEN RT_ARQ$(V_0dd8$ + "SISTRUT.INI") FOR INPUT AS #1   '@152ac DS:1046,104c
V_0ec4! = 0.0   '@152d0 DS:1120
L_152e6:
LINE INPUT #1, V_0dd4$   '@152e6 DS:0fde
V_0ec4! = FX##(V_0ec4!) + 1.0   '@15309 DS:1002
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
IF V_0ec4! < 9.0 THEN GOTO L_152e6   '@1531f DS:1124
CLOSE #1   '@15337
IF RT_DISP%(V_0dd8$ + "SISTRUT.INI") THEN OPEN RT_ARQ$(V_0dd8$ + "SISTRUT.INI") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0dd8$ + "SISTRUT.INI") FOR OUTPUT AS #1   '@15346 DS:104c,1d86
PRINT #1, "SISTRUT Software e tecnologia s/c Ltda"   '@1536a DS:1d8c
PRINT #1, "Versao 4.0                  Abril 1991"   '@15381 DS:1db6
PRINT #1, V_0ddc$; "=DRIVE IMPLANTACAO"   '@15398 DS:1de0
PRINT #1, V_0de4$; "=MONITOR UTILIZADO"   '@153b8 DS:1df6
PRINT #1, V_0de8$; "=SAIDA PARALELA UTILIZADA"   '@153d8 DS:1e0c
PRINT #1, V_0dec$; "=PORTA DE COMUNICACAO SERIAL UTILIZADA"   '@153f8 DS:1e2a
PRINT #1, V_0df0$; "=ARQUIVO .BAT ACESSADO NA INSTALACAO"   '@15418 DS:1e54
PRINT #1, "PARAMETRIZADO EM:"; RT_DATE$; "  "; RT_TIME$   '@15438 DS:1e7c,1e92
PRINT #1, V_0dd4$   '@1546e
PRINT #1, "FINAL DE PARAMETRIZACAO"   '@15485 DS:10d2
CLOSE #1   '@1549c
RETURN   '@154ab
L_154ba:   ' entrada vinda de 012610_F_12610
GOSUB L_12615   '@154bf
COLOR 15, RT_CINT%(4.0 * FX##(V_0df8!))   '@154cc DS:16ee
LOCATE 4, 6   '@154f6
PRINT CHR$(218); RT_STRINGC$((67), (196)); CHR$(191)   '@15514
FOR V_0e04! = 5.0 TO 22.0   '@1554a DS:1002,1712,1e98
LOCATE RT_CINT%(FX##(V_0e04!)), 6   '@15558
COLOR 15   '@1557d
PRINT CHR$(179); RT_STRINGC$((67), (32)); CHR$(179);   '@15593
COLOR 0   '@155c9
PRINT CHR$(219)   '@155de
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@155f2 DS:1002,1712
LOCATE 23, 6   '@1561e
COLOR 15   '@1563c
PRINT CHR$(192); RT_STRINGC$((67), (196)); CHR$(217);   '@15652
COLOR 0   '@15688
PRINT CHR$(219)   '@1569d
LOCATE 24, 8   '@156b1
PRINT RT_STRINGC$((68), (219))   '@156cf
COLOR 15   '@156e7
LOCATE 5, 8   '@156fd
COLOR 14   '@1571b
PRINT "<Ctrl>+<Alt>+<Del>";   '@15731 DS:1e9c
COLOR 15   '@1573f
PRINT " ou ";   '@15755 DS:1eb2
COLOR 14   '@15763
PRINT "<F2> ";   '@15779 DS:1eba
COLOR 15   '@15787
PRINT "   Retorna ao Sistema Operacional."   '@1579d DS:1ec4
LOCATE 7, 8   '@157ab
PRINT "Escolha o modulo desejado pelas teclas ";   '@157c9 DS:1eea
COLOR 14   '@157d7
PRINT CHR$(24); " "; CHR$(25); " "; CHR$(26); " "; CHR$(27)   '@157ed DS:12fa
COLOR 15   '@15849
LOCATE 8, 8   '@1585f
PRINT "ou pela letra em intensidade dos Modulos principais (";   '@1587d DS:1f16
COLOR RT_CINT%(FX##(V_0dfc!))   '@1588b
PRINT "PGTLVAiCD";   '@158a8 DS:1f50
COLOR 15   '@158b6
PRINT ")"   '@158cc DS:1f5e
LOCATE 9, 8   '@158da
PRINT "Escolhido o Modulo Desejado, acione <Enter> para prosseguir"   '@158f8 DS:1f64
LOCATE 11, 8   '@15906
PRINT "No caso do Sistema estar implantado no Drive A ou B , coloque"   '@15924 DS:1fa4
LOCATE 12, 8   '@15932
PRINT "o disco do Modulo desejado no respectivo Drive"   '@15950 DS:1fe6
LOCATE 14, 8   '@1595e
PRINT "No caso do Sistema estar implantado no Winchester,"   '@1597c DS:2018
LOCATE 15, 8   '@1598a
PRINT "o Modulo escolhido da Versao 4.0 sera acionado."   '@159a8 DS:204e
LOCATE 16, 8   '@159b6
PRINT "Nao existindo o respectivo Modulo, o sistema tentara a Versao 3.2"   '@159d4 DS:2082
LOCATE 18, 8   '@159e2
PRINT "Quando implantado em Winchester, acione ";   '@15a00 DS:20c8
COLOR 14   '@15a0e
PRINT "<Ins>";   '@15a24 DS:20f4
COLOR 15   '@15a32
PRINT " para acionar"   '@15a48 DS:20fe
LOCATE 19, 8   '@15a56
PRINT "a Versao 3.2 (somente para quem a possua - vide direita abaixo)"   '@15a74 DS:2110
LOCATE 21, 8   '@15a82
PRINT "Acionado um determinado Modulo, acione ";   '@15aa0 DS:2154
COLOR 14   '@15aae
PRINT "<Ctrl>+<Alt>+<Del>";   '@15ac4 DS:1e9c
COLOR 15   '@15ad2
PRINT " ou ";   '@15ae8 DS:1eb2
COLOR 14   '@15af6
PRINT "<F2>"   '@15b0c DS:2180
COLOR 15   '@15b1a
LOCATE 22, 8   '@15b30
PRINT "para retornar ao Modulo Gerenciador (somente para Versao 4.0)"   '@15b4e DS:2188
CALL MIXT_07f1_LimpaTeclado   '@15b5c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dd4$ = RT_INPUT$(1)   '@15b66
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
COLOR 15, RT_CINT%(FX##(V_0df8!))   '@15b82
LOCATE 6, 7   '@15ba7
PRINT CHR$(218); RT_STRINGC$((69), (196)); CHR$(191)   '@15bc5
FOR V_0e04! = 7.0 TO 20.0   '@15bfb DS:1002,1754,1834
LOCATE RT_CINT%(FX##(V_0e04!)), 7   '@15c08
COLOR 15   '@15c2d
PRINT CHR$(179); RT_STRINGC$((69), (32)); CHR$(179);   '@15c43
COLOR 0   '@15c79
PRINT CHR$(219)   '@15c8e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@15ca2 DS:1002,1834
LOCATE 21, 7   '@15cce
COLOR 15   '@15cec
PRINT CHR$(192); RT_STRINGC$((69), (196)); CHR$(217);   '@15d02
COLOR 0   '@15d38
PRINT CHR$(219)   '@15d4d
LOCATE 22, 9   '@15d61
PRINT RT_STRINGC$((70), (219))   '@15d7f
COLOR 30   '@15d97
LOCATE 7, 38   '@15dad
PRINT "CONFIGURACAO"   '@15dcb DS:21ca
COLOR 15   '@15dd9
LOCATE 8, 9   '@15def
PRINT "Drive:\Diretorio onde estao os executaveis .EXE"   '@15e0d DS:21da
LOCATE 9, 10   '@15e1b
COLOR 14   '@15e39
PRINT "A:\                ";   '@15e4f DS:220e
COLOR 15   '@15e5d
PRINT "equipamento sem winchester-discos no drive A"   '@15e73 DS:2226
LOCATE 10, 10   '@15e81
COLOR 14   '@15e9f
PRINT "C:\SISTRUT\EXEC40  ";   '@15eb5 DS:2256
COLOR 15   '@15ec3
PRINT "equipamento com winchester-implantado no drive C"   '@15ed9 DS:226e
LOCATE 12, 9   '@15ee7
PRINT "Monitor *CGA* , Mouse *COM1* , Impressora *LPT1*"   '@15f05 DS:22a2
LOCATE 13, 10   '@15f13
PRINT "aceitar default quando monitor nao conhecido,sem mouse conectado"   '@15f31 DS:22d6
LOCATE 14, 10   '@15f3f
PRINT "e com apenas uma impressora trabalhando."   '@15f5d DS:231a
LOCATE 16, 9   '@15f6b
PRINT "Arquivo .BAT .COM ou .EXE a ser executado ."   '@15f89 DS:2346
LOCATE 17, 10   '@15f97
PRINT "Possibilidade de acionar um Programa/Arquivo Instrucao"   '@15fb5 DS:2376
LOCATE 18, 10   '@15fc3
PRINT "Por exemplo: caso deseje checar o winchester toda vez que"   '@15fe1 DS:23b0
LOCATE 19, 10   '@15fef
PRINT "entramos no sist. OpenStrut ";   '@1600d DS:23ee
COLOR 14   '@1601b
PRINT " C:\DOS\CHKDSK /F"   '@16031 DS:240e
COLOR 15   '@1603f
LOCATE 20, 10   '@16055
PRINT "Gera o mesmo resultado de C:\>\DOS\CHKDSK /F quando estamos no DOS"   '@16073 DS:2424
CALL MIXT_07f1_LimpaTeclado   '@16081
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dd4$ = RT_INPUT$(1)   '@1608b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0df4!)), 3   '@160a7
LOCATE 7, 3   '@160cc
PRINT CHR$(218); RT_STRINGC$((69), (196)); CHR$(191)   '@160ea
FOR V_0e04! = 8.0 TO 17.0   '@16120 DS:1002,1758,246a
LOCATE RT_CINT%(FX##(V_0e04!)), 3   '@1612e
COLOR RT_CINT%(FX##(V_0df4!))   '@16153
PRINT CHR$(179); RT_STRINGC$((69), (32)); CHR$(179);   '@16170
COLOR 0   '@161a6
PRINT CHR$(219)   '@161bb
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY no laco (B$EVCK)
NEXT V_0e04!   '@161cf DS:1002,1758
LOCATE 18, 3   '@161fb
COLOR RT_CINT%(FX##(V_0df4!))   '@16219
PRINT CHR$(192); RT_STRINGC$((69), (196)); CHR$(217);   '@16236
COLOR 0   '@1626c
PRINT CHR$(219)   '@16281
LOCATE 19, 5   '@16295
PRINT RT_STRINGC$((70), (219))   '@162b3
COLOR 31   '@162cb
LOCATE 8, 36   '@162e1
PRINT "EDITOR"   '@162ff DS:246e
COLOR 8   '@1630d
LOCATE 10, 5   '@16323
PRINT "Todos os Aplicativos, possuem um arquivo de inicializacao com o"   '@16341 DS:2478
LOCATE 11, 5   '@1634f
PRINT "mesmo nome do programa, porem com extensao .INI ."   '@1636d DS:24bc
LOCATE 12, 5   '@1637b
PRINT "Para alterar estes arquivos, acione EDITOR no menu principal."   '@16399 DS:24f2
LOCATE 14, 5   '@163a7
PRINT "Estes arquivos contem a configuracao dos Drives default de dados,"   '@163c5 DS:2534
LOCATE 15, 5   '@163d3
PRINT "Unidades, Parametrizacoes iniciais, Parametrizacoes de impressora."   '@163f1 DS:257a
LOCATE 17, 5   '@163ff
PRINT "Os arquivos .DSP .PIP .LAP  tambem poderao ser editados pelo EDITOR"   '@1641d DS:25c0
CALL MIXT_07f1_LimpaTeclado   '@1642b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
V_0dd4$ = RT_INPUT$(1)   '@16435
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_154ba, L_12906, L_128db, L_129ab   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0df8!)), 7   '@16451
RETURN L_129d9   '@16480
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
    V_0dc6! = 0
    V_0dca! = 0
    V_0dce! = 0
    V_0dd2% = 0
    V_0dd4$ = ""
    V_0dd8$ = ""
    V_0ddc$ = ""
    V_0de0$ = ""
    V_0de4$ = ""
    V_0de8$ = ""
    V_0dec$ = ""
    V_0df0$ = ""
    V_0df4! = 0
    V_0df8! = 0
    V_0dfc! = 0
    V_0e00$ = ""
    V_0e04! = 0
    V_0e08$ = ""
    V_0e18! = 0
    V_0e1c! = 0
    V_0e20$ = ""
    V_0e24$ = ""
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
    V_0e68$ = ""
    V_0e6c! = 0
    V_0e70! = 0
    V_0e74$ = ""
    V_0e78! = 0
    V_0e7c! = 0
    V_0e80$ = ""
    V_0e84$ = ""
    V_0e88$ = ""
    V_0e8c! = 0
    V_0e90! = 0
    V_0e94$ = ""
    V_0e98$ = ""
    V_0e9c! = 0
    V_0ea0! = 0
    V_0ea4$ = ""
    V_0ea8$ = ""
    V_0eac! = 0
    V_0eb0! = 0
    V_0eb4$ = ""
    V_0eb8! = 0
    V_0ebc! = 0
    V_0ec0$ = ""
    V_0ec4! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_154ba: sai da SUB (GOSUB L_12615; COLOR 15, RT_CINT%(4.0 * FX##(V_0df8!)); LOCATE 4, 6; PRINT CHR$()
        CASE 2   ' L_12906: sai da SUB (RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Termino da Utilizacao do Si)
        CASE 3   ' L_128db: BEEP; GOSUB L_12615; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 4   ' L_129ab: sai da SUB (BEEP; GOSUB L_12615; RETURN L_129d9)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H10dfe: ON ERROR GOTO L_10dfe
        CASE &H10ff9: ON ERROR GOTO L_10ff9
        CASE &H11301: ON ERROR GOTO L_11301
        CASE &H11396: ON ERROR GOTO L_11396
        CASE &H11478: ON ERROR GOTO L_11478
        CASE &H1250d: ON ERROR GOTO L_1250d
        CASE &H1435c: ON ERROR GOTO L_1435c
        CASE &H1450d: ON ERROR GOTO L_1450d
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_SISTEMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
