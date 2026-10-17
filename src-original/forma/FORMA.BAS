' ============================================================================
'  FORMA - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/FORMA/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: dc9230474b4413c84af5cc9228bf13de2a81556f0fd84b707fffbef78e0c014e
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_FORMA.BI'

' ---- variaveis do FORMA fora do COMMON (DS do programa)
DIM SHARED V_1866$
DIM SHARED V_186a!
DIM SHARED V_186e$
DIM SHARED V_1872$
DIM SHARED V_1876$
DIM SHARED V_187a$
DIM SHARED V_187e$
DIM SHARED V_1882$
DIM SHARED V_1886$
DIM SHARED V_188a$
DIM SHARED V_188e$
DIM SHARED V_1892$
DIM SHARED V_1896$
DIM SHARED V_189a$
DIM SHARED V_189e$
DIM SHARED V_18a2!
DIM SHARED V_18a6!
DIM SHARED V_18aa!
DIM SHARED V_18ae!
DIM SHARED V_18b2!
DIM SHARED V_18b6!
DIM SHARED V_18ba!
DIM SHARED V_18be!
DIM SHARED V_18c2!
DIM SHARED V_18c6!
DIM SHARED V_18ca!
DIM SHARED V_18ce!
DIM SHARED V_18d2!
DIM SHARED V_18d6!
DIM SHARED V_18da!
DIM SHARED V_18de!
DIM SHARED V_18e2!
DIM SHARED V_18e6$
DIM SHARED V_18ea!
DIM SHARED V_18ee!
DIM SHARED V_18f2%
DIM SHARED V_18f4!
DIM SHARED V_18f8!
DIM SHARED V_1a04$
DIM SHARED V_1a08%
DIM SHARED V_1a12!
DIM SHARED V_1a16!
DIM SHARED V_1a2a!
DIM SHARED V_1a2e!
DIM SHARED V_1a42!
DIM SHARED V_1a46!
DIM SHARED V_1a5a!
DIM SHARED V_1a5e!
DIM SHARED V_1a72!
DIM SHARED V_1a76!
DIM SHARED V_1a8a!
DIM SHARED V_1a8e!
DIM SHARED V_1aa2!
DIM SHARED V_1aa6!
DIM SHARED V_1aba!
DIM SHARED V_1abe!
DIM SHARED V_1ad2!
DIM SHARED V_1ad6!
DIM SHARED V_1aea!
DIM SHARED V_1aee!
DIM SHARED V_1b02!
DIM SHARED V_1b06!
DIM SHARED V_1b1a!
DIM SHARED V_1b1e!
DIM SHARED V_1b32!
DIM SHARED V_1b36!
DIM SHARED V_1b4a!
DIM SHARED V_1b4e!
DIM SHARED V_1b62$
DIM SHARED V_1b66$
DIM SHARED V_1b7f%
DIM SHARED V_1b81%
DIM SHARED V_1b83%
DIM SHARED V_1b8d!
DIM SHARED V_1b91!
DIM SHARED V_1b99!
DIM SHARED V_1b9d!
DIM SHARED V_1ba5!
DIM SHARED V_1ba9!
DIM SHARED V_1bb1!
DIM SHARED V_1bb5!
DIM SHARED V_1bbd!
DIM SHARED V_1bc1!
DIM SHARED V_1bc9!
DIM SHARED V_1bcd!
DIM SHARED V_1bd5!
DIM SHARED V_1bd9!
DIM SHARED V_1be1!
DIM SHARED V_1be5!
DIM SHARED V_1bed!
DIM SHARED V_1bf1!
DIM SHARED V_1bf9!
DIM SHARED V_1bfd!
DIM SHARED V_1c05!
DIM SHARED V_1c09!
DIM SHARED V_1c11!
DIM SHARED V_1c15!
DIM SHARED V_1c1d!
DIM SHARED V_1c21!
DIM SHARED V_1c29!
DIM SHARED V_1c2d!
DIM SHARED RG_1A08 AS STRING * 346   ' registro de GET/PUT # em DS:1A08
DIM SHARED RG_1B66 AS STRING * 855   ' registro de GET/PUT # em DS:1B66

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "FORMA"
' ---- M_FORMA @0x10030  (010030_M_FORMA.lift.txt; evidence_id (assembly): ev_6efa8d99940cabc12b70474ef3c1bb101cbedfc2c5d5b32387ce4e9e26662ca2)
' @10030 inicio do programa (B$?EVT)
IF NOT (V_157a$ <> "") THEN GOTO L_101e2   '@101b1 DS:1ec0
GOSUB L_115a3   '@101c8
GOTO L_119dd   '@101d5
L_101e2:
RT_CLEAR   '@101e2 (CLEAR zera as variaveis do programa e do COMMON, nao o estado do RT45)
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@101f4
GOSUB L_115a3   '@10203
CALL S_30042   '@10210
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0dc0! = 15.0   '@1021a DS:1ec4
V_0dc8! = 1.0   '@1022b DS:1ec8
V_0dc4! = 15.0   '@1023c DS:1ec4
V_0e22$ = "SISTRUT"   '@1024d DS:1ecc
V_0e36$ = "A:\"   '@1025f DS:1ed8
V_0e42$ = "A:\"   '@10271 DS:1ed8
V_0e3e$ = "A:\"   '@10283 DS:1ed8
V_0e46$ = "A:\"   '@10295 DS:1ed8
V_0e4e$ = "A:\"   '@102a7 DS:1ed8
V_0e4a$ = "A:\"   '@102b9 DS:1ed8
V_1530% = 841   '@102cb
V_1532% = 594   '@102d6
V_1534% = 25   '@102e1
V_1536% = 10   '@102ec
V_1538% = 175   '@102f7
V_153a% = 287   '@10302
V_153c% = 50   '@1030d
V_153e! = 3.0   '@10318 DS:1ee0
V_1542! = 3.0   '@10329 DS:1ee0
V_1546! = 3.0   '@1033a DS:1ee0
V_154a! = 2.0   '@1034b DS:1ee4
V_154e! = 2.0   '@1035c DS:1ee4
V_1552! = 1.5   '@1036d DS:1ee8
V_1524$ = "N"   '@1037e DS:1eec
V_1528! = 0.0   '@10390 DS:1ef2
V_152c! = 0.0   '@103a1 DS:1ef2
V_1556$ = "S"   '@103b2 DS:1ef6
V_155a$ = "S"   '@103c4 DS:1ef6
V_155e$ = "S"   '@103d6 DS:1ef6
V_1562$ = "S"   '@103e8 DS:1ef6
V_1566$ = "S"   '@103fa DS:1ef6
V_156a$ = "S"   '@1040c DS:1ef6
V_156e$ = "S"   '@1041e DS:1ef6
V_1572$ = "S"   '@10430 DS:1ef6
V_1576$ = "S"   '@10442 DS:1ef6
V_0df4$ = CHR$(27) + CHR$(50)   '@10454
V_0df8$ = CHR$(27) + CHR$(48)   '@1047c
V_0dfc$ = CHR$(27) + CHR$(78) + CHR$(6)   '@104a4
V_0e00$ = CHR$(27) + CHR$(79)   '@104dc
V_0dcc$ = "CGA"   '@10504 DS:1efc
V_0dd0$ = "LPT1:"   '@10516 DS:1f04
V_0dd4$ = "COM1:"   '@10528 DS:1f0e
V_0e04# = ATN(FX##(1.0)) * 4.0   '@1053a DS:1ec8,1f18
V_11b8! = 1.0   '@10557 DS:1ec8
L_1056e:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_11b8!))) <> "") THEN GOTO L_10610   '@1056f DS:1ec0
IF NOT (RT_INSTR%((1), (ENVIRON$(RT_CINT%(FX##(V_11b8!)))), ("COMSPEC")) > 0) THEN GOTO L_105f1   '@1058d DS:1f1c
V_1866$ = RT_MID$((ENVIRON$(RT_CINT%(FX##(V_11b8!)))), (9), (1))   '@105b7
GOTO L_10610   '@105e4
L_105f1:
V_11b8! = FX##(V_11b8!) + 1.0   '@105f1 DS:1ec8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1056e   '@10607
L_10610:
V_0e3a$ = V_1866$   '@10610
L_BP0c% = (V_0e3a$ = "A")   '@10622 DS:1f28
IF NOT ((V_0e3a$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_10680   '@10647 DS:1f2e
V_0e3a$ = V_0e3a$ + ":\"   '@1065c DS:1f34
GOTO L_106a1   '@10678
L_10680:
V_0e3a$ = V_0e3a$ + ":\SISTRUT\EXEC40\"   '@10680 DS:1f3a
L_106a1:
V_11c0! = 1.0   '@106a1 DS:1ec8
V_0e0c$ = ""   '@106b2 DS:1ec0
L_106ca:
IF NOT (V_11c0! < 18.0) THEN GOTO L_10734   '@106cb DS:1f50
V_0e0c$ = V_0e0c$ + CHR$(SCREEN(4, RT_CINT%(FX##(V_11c0!))))   '@106e0
V_11c0! = FX##(V_11c0!) + 1.0   '@10716 DS:1ec8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_106ca   '@1072c
L_10734:
' PROTECAO: verificacao de licenca do original desativada
V_11c0! = 1.0   '@1074b DS:1ec8
V_0e0c$ = ""   '@1075c DS:1ec0
L_10774:
IF NOT (V_11c0! < 40.0) THEN GOTO L_107de   '@10775 DS:1f6a
V_0e0c$ = V_0e0c$ + CHR$(SCREEN(5, RT_CINT%(FX##(V_11c0!))))   '@1078a
V_11c0! = FX##(V_11c0!) + 1.0   '@107c0 DS:1ec8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_10774   '@107d6
L_107de:
V_0e3a$ = RTRIM$(RT_MID2$((V_0e0c$), (17)))   '@107de
V_0dcc$ = RT_MID$((V_0e0c$), (1), (3))   '@10804
V_0dd0$ = RT_MID$((V_0e0c$), (4), (5))   '@10824
V_0dd4$ = RT_MID$((V_0e0c$), (10), (5))   '@10844
GOTO L_108a5   '@10864
L_1086c:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_108a5:
L_108aa:   ' entrada vinda de 0113d3_F_113d3
ON ERROR GOTO L_11443
RT_ONERR = &H11443   '@108af
OPEN RT_ARQ$(V_0e3a$ + "FORMA.INI") FOR INPUT AS #1   '@108be DS:1fc4,1fca
LINE INPUT #1, V_0e0c$   '@108e2 DS:1ec0
V_0e22$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10905 DS:1fd8
LINE INPUT #1, V_0e0c$   '@10931 DS:1ec0
V_0e36$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10954 DS:1fd8
LINE INPUT #1, V_0e0c$   '@10980 DS:1ec0
V_0e42$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@109a3 DS:1fd8
LINE INPUT #1, V_0e0c$   '@109cf DS:1ec0
V_0e3e$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@109f2 DS:1fd8
LINE INPUT #1, V_0e0c$   '@10a1e DS:1ec0
V_0e46$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10a41 DS:1fd8
LINE INPUT #1, V_0e0c$   '@10a6d DS:1ec0
V_0e4e$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10a90 DS:1fd8
LINE INPUT #1, V_0e0c$   '@10abc DS:1ec0
V_0e4a$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10adf DS:1fd8
LINE INPUT #1, V_0e0c$   '@10b0b DS:1ec0
V_0e52$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@10b2e DS:1fd8
LINE INPUT #1, V_0e0c$   '@10b5a DS:1ec0
V_1530% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10b7d
LINE INPUT #1, V_0e0c$   '@10b98 DS:1ec0
V_1532% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10bbb
LINE INPUT #1, V_0e0c$   '@10bd6 DS:1ec0
V_1534% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10bf9
LINE INPUT #1, V_0e0c$   '@10c14 DS:1ec0
V_1536% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10c37
LINE INPUT #1, V_0e0c$   '@10c52 DS:1ec0
V_1538% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10c75
LINE INPUT #1, V_0e0c$   '@10c90 DS:1ec0
V_153a% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10cb3
LINE INPUT #1, V_0e0c$   '@10cce DS:1ec0
V_153c% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@10cf1
LINE INPUT #1, V_0e0c$   '@10d0c DS:1ec0
V_153e! = VAL(V_0e0c$)   '@10d2f
LINE INPUT #1, V_0e0c$   '@10d49 DS:1ec0
V_1542! = VAL(V_0e0c$)   '@10d6c
LINE INPUT #1, V_0e0c$   '@10d86 DS:1ec0
V_1546! = VAL(V_0e0c$)   '@10da9
LINE INPUT #1, V_0e0c$   '@10dc3 DS:1ec0
V_154a! = VAL(V_0e0c$)   '@10de6
LINE INPUT #1, V_0e0c$   '@10e00 DS:1ec0
V_154e! = VAL(V_0e0c$)   '@10e23
LINE INPUT #1, V_0e0c$   '@10e3d DS:1ec0
V_1552! = VAL(V_0e0c$)   '@10e60
LINE INPUT #1, V_0e0c$   '@10e7a DS:1ec0
V_1524$ = RT_MID$((V_0e0c$), (1), (1))   '@10e9d
LINE INPUT #1, V_0e0c$   '@10eba DS:1ec0
V_1528! = VAL(V_0e0c$)   '@10edd
LINE INPUT #1, V_0e0c$   '@10ef7 DS:1ec0
V_152c! = VAL(V_0e0c$)   '@10f1a
LINE INPUT #1, V_0e0c$   '@10f34 DS:1ec0
V_1556$ = RT_MID$((V_0e0c$), (1), (1))   '@10f57
LINE INPUT #1, V_0e0c$   '@10f74 DS:1ec0
V_155a$ = RT_MID$((V_0e0c$), (1), (1))   '@10f97
LINE INPUT #1, V_0e0c$   '@10fb4 DS:1ec0
V_155e$ = RT_MID$((V_0e0c$), (1), (1))   '@10fd7
LINE INPUT #1, V_0e0c$   '@10ff4 DS:1ec0
V_1562$ = RT_MID$((V_0e0c$), (1), (1))   '@11017
LINE INPUT #1, V_0e0c$   '@11034 DS:1ec0
V_1566$ = RT_MID$((V_0e0c$), (1), (1))   '@11057
LINE INPUT #1, V_0e0c$   '@11074 DS:1ec0
V_156a$ = RT_MID$((V_0e0c$), (1), (1))   '@11097
LINE INPUT #1, V_0e0c$   '@110b4 DS:1ec0
V_156e$ = RT_MID$((V_0e0c$), (1), (1))   '@110d7
LINE INPUT #1, V_0e0c$   '@110f4 DS:1ec0
V_1572$ = RT_MID$((V_0e0c$), (1), (1))   '@11117
LINE INPUT #1, V_0e0c$   '@11134 DS:1ec0
V_1576$ = RT_MID$((V_0e0c$), (1), (1))   '@11157
LINE INPUT #1, V_0e0c$   '@11174 DS:1ec0
V_0df4$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@11197 DS:1fd8
LINE INPUT #1, V_0e0c$   '@111c3 DS:1ec0
V_0df8$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@111e6 DS:1fd8
LINE INPUT #1, V_0e0c$   '@11212 DS:1ec0
V_0dfc$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@11235 DS:1fd8
LINE INPUT #1, V_0e0c$   '@11261 DS:1ec0
V_0e00$ = RT_MID$((V_0e0c$), (1), (RT_INSTR%((1), (V_0e0c$), ("=")) - 1))   '@11284 DS:1fd8
CLOSE #1   '@112b0
L_112c4:   ' entrada vinda de 0113d3_F_113d3
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@112c9
V_0e0c$ = V_0df4$   '@112d8
GOSUB L_114c4   '@112ea
V_0df4$ = V_0e10$   '@112f7
V_0e0c$ = V_0df8$   '@11309
GOSUB L_114c4   '@1131b
V_0df8$ = V_0e10$   '@11328
V_0e0c$ = V_0dfc$   '@1133a
GOSUB L_114c4   '@1134c
V_0dfc$ = V_0e10$   '@11359
V_0e0c$ = V_0e00$   '@1136b
GOSUB L_114c4   '@1137d
V_0e00$ = V_0e10$   '@1138a
ON ERROR GOTO L_113d8
RT_ONERR = &H113d8   '@1139c
PCOPY 0, 1   '@113ab
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@113bc
GOTO L_119dd   '@113cb
' ---- F_113d3 @0x113d3  (0113d3_F_113d3.lift.txt; evidence_id (assembly): ev_832288c544bdb79fee1bac09e10dfc590acbdb4a5a27f47e069541dc12bf8ad1)
L_113d8:   ' entrada vinda de 010030_M_FORMA
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@113dd
V_0dcc$ = "HER"   '@113ec DS:1fde
V_0dc0! = 14.0   '@113fe DS:1fe6
V_0dc8! = 0.0   '@1140f DS:1ef2
V_0dc4! = 9.0   '@11420 DS:1fea
RESUME L_119dd   '@11431
L_11443:   ' entrada vinda de 010030_M_FORMA
CLOSE #1   '@11448
IF NOT (RT_INSTR%((1), ("CDEF"), (RT_MID$((V_0e3a$), (1), (1)))) > 0) THEN GOTO L_114a3   '@11457 DS:1fee
V_0e3a$ = "A:\"   '@1147f DS:1ed8
RESUME L_108aa   '@11491
L_114a3:
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@114a3
RESUME L_112c4   '@114b2
L_114c4:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMA
V_11c0! = 0.0   '@114c9 DS:1ef2
V_0e10$ = ""   '@114da DS:1ec0
L_114f2:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_11c0!) + 1.0)), (V_0e0c$), ("(")) > 0) THEN GOTO L_11594   '@114f3 DS:1ec8,1ff6
V_11c0! = RT_INSTR%((RT_CINT%(FX##(V_11c0!) + 1.0)), (V_0e0c$), ("(")) + 1   '@11516 DS:1ec8,1ff6
V_0e10$ = V_0e10$ + CHR$(RT_CINT%(FX##(VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11c0!))))))))   '@11545
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_114f2   '@1158c
L_11594:
RETURN   '@11594
L_115a3:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMA, 011877_F_11877
FOR V_186a! = 1.0 TO 10.0   '@115a8 DS:1ec8,1ffc
ON KEY(RT_CINT%(FX##(V_186a!))) GOSUB L_1187c
RT_ONKEY RT_CINT%(FX##(V_186a!)), 1   '@115b6
KEY(RT_CINT%(FX##(V_186a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_186a!)), 1   '@115d0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_186a!   '@115e5 DS:1ec8,1ffc
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1160e
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@11636
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1165e
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@11686
FOR V_186a! = 15.0 TO 18.0   '@116ae DS:1ec4,1ec8,1f50
ON KEY(RT_CINT%(FX##(V_186a!))) GOSUB L_118a7
RT_ONKEY RT_CINT%(FX##(V_186a!)), 2   '@116bc
KEY(RT_CINT%(FX##(V_186a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_186a!)), 1   '@116d6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_186a!   '@116eb DS:1ec8,1f50
ON KEY(2) GOSUB L_118a7
RT_ONKEY 2, 2   '@11714
KEY(2) ON
RT_KEYESTADO 2, 1   '@11727
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@11735
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1175d
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@11785
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@117ad
FOR V_186a! = 19.0 TO 22.0   '@117d4 DS:1ec8,2000,2004
ON KEY(RT_CINT%(FX##(V_186a!))) GOSUB L_119af
RT_ONKEY RT_CINT%(FX##(V_186a!)), 3   '@117e2
KEY(RT_CINT%(FX##(V_186a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_186a!)), 1   '@117fc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_186a!   '@11811 DS:1ec8,2004
RETURN   '@1183a
L_11849:   ' entrada vinda de 010030_M_FORMA, 0119dd_FUN_1000_19dd, 015120_F_15120, 015539_FUN_1000_5539
RESUME L_11860   '@1184e
L_11860:
CALL S_16558   '@11865
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
GOTO L_119dd   '@1186f
' ---- F_11877 @0x11877  (011877_F_11877.lift.txt; evidence_id (assembly): ev_711104f6546c0d7ac9498505521469808a2d2137e2d74aaa0a246f233f288ee9)
L_1187c:   ' entrada vinda de 0113d3_F_113d3
BEEP   '@11881
GOSUB L_115a3   '@1188b
RETURN   '@11898
L_118a7:   ' entrada vinda de 0113d3_F_113d3
RT_SCREEN 0   '@118ac
RT_VIEWPRINT 1, 25   '@118c1
COLOR 7, 0, 0   '@118d3
RT_CLS 0   '@118f7
PRINT " Aguarde ..."   '@11904 DS:2008
PRINT ""   '@11912 DS:1ec0
PRINT " Retorno ao Modulo Gerenciador"   '@11920 DS:2018
ON ERROR GOTO L_11968
RT_ONERR = &H11968   '@1192e
RT_RUN RT_MID$((V_0e3a$), (1), (11)) + "SISTRUT"   '@1193d DS:1ecc
L_11968:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0e3a$), (1), (11))   '@1196d DS:203a
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@11992 DS:1f88
RT_FIM   '@119a0 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_119af:   ' entrada vinda de 0113d3_F_113d3
BEEP   '@119b4
GOSUB L_115a3   '@119be
RETURN L_119dd   '@119d5
' ---- FUN_1000_19dd @0x119dd  (0119dd_FUN_1000_19dd.lift.txt; evidence_id (assembly): ev_7100472f490fe500653ec20d0056428c24c73ce0d976364d22abaf19ea2d4a51)
L_119dd:   ' entrada vinda de 010030_M_FORMA, 0113d3_F_113d3, 011877_F_11877, 015120_F_15120, 01533d_F_1533d
RT_SCREEN 0   '@119e2
RT_VIEWPRINT 1, 25   '@119f7
COLOR 7, RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@11a09
RT_CLOSE   '@11a3d (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RT_CLS 0   '@11a4a
COLOR 11   '@11a57
PRINT RT_STRINGC$((80), (219))   '@11a6d
PRINT "   MONTAGEM E DESENHO DE FORMAS"   '@11a85 DS:2058
PRINT "   OpenStrut  eng. reversa independente do"   '@11a93 DS:207c
PRINT "   SISTRUT 4.0 (1991), sem vinculo oficial  "   '@11aa1 DS:20aa
PRINT "   Versao 4.0   "; V_1b62$   '@11aaf DS:20da
PRINT RT_STRINGC$((80), (219))   '@11ac6
IF NOT (V_0e20% = 0) THEN GOTO L_11b4b   '@11ade
V_0e0c$ = V_0e22$   '@11aed
CALL S_166d5   '@11aff
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e20% = 1   '@11b09
RT_VIEWPRINT 9, 25   '@11b14
RT_CLS 2   '@11b26
RT_VIEWPRINT 1, 25   '@11b34
L_11b4b:
COLOR 7   '@11b4b
LOCATE 9, 20   '@11b61
PRINT "1  -  ";   '@11b7f DS:20ee
COLOR RT_CINT%(FX##(V_0dc4!))   '@11b8d
PRINT "M";   '@11baa DS:20f8
COLOR 7   '@11bb8
PRINT "ontagem e Desenho de Formas"   '@11bce DS:20fe
LOCATE 11, 20   '@11bdc
PRINT "2  -  ";   '@11bfa DS:211e
COLOR RT_CINT%(FX##(V_0dc4!))   '@11c08
PRINT "E";   '@11c25 DS:2128
COLOR 7   '@11c33
PRINT "ditadas, acesso as Formas gravadas"   '@11c49 DS:212e
LOCATE 13, 20   '@11c57
PRINT "3  -  ";   '@11c75 DS:2154
COLOR RT_CINT%(FX##(V_0dc4!))   '@11c83
PRINT "I";   '@11ca0 DS:1fc4
COLOR 7   '@11cae
PRINT "mpressao de Formas"   '@11cc4 DS:215e
LOCATE 15, 20   '@11cd2
PRINT "4  -  ";   '@11cf0 DS:2174
COLOR RT_CINT%(FX##(V_0dc4!))   '@11cfe
PRINT "D";   '@11d1b DS:217e
COLOR 7   '@11d29
PRINT "esenhos e Plotagens"   '@11d3f DS:2184
LOCATE 17, 20   '@11d4d
PRINT "5  -  ";   '@11d6b DS:219c
COLOR RT_CINT%(FX##(V_0dc4!))   '@11d79
PRINT "P";   '@11d96 DS:21a6
COLOR 7   '@11da4
PRINT "arametrizacoes / escolha"   '@11dba DS:21ac
LOCATE 19, 20   '@11dc8
PRINT "6  -  ";   '@11de6 DS:21c8
COLOR RT_CINT%(FX##(V_0dc4!))   '@11df4
PRINT "A";   '@11e11 DS:1f28
COLOR 7   '@11e1f
PRINT "lteracao de Drive e Subdiretorio"   '@11e35 DS:21d2
LOCATE 22, 60   '@11e43
COLOR RT_CINT%(FX##(V_0dc0!)), 3   '@11e61
PRINT " <F2> = Fim "   '@11e86 DS:21f6
L_11e99:
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@11e9e
LOCATE 22, 20   '@11eca
PRINT "escolha opcao ";   '@11ee8 DS:2206
CALL MIXT_07f1_LimpaTeclado   '@11ef6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@11f00
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_11d4! = RT_FRE&("")   '@11f1c DS:1ec0
COLOR 7   '@11f36
V_186e$ = V_0e0c$   '@11f4c
IF NOT (V_186e$ <> "1") THEN GOTO L_11f99   '@11f5e DS:2218
IF NOT (V_186e$ <> "M") THEN GOTO L_11f99   '@11f75 DS:20f8
IF NOT (V_186e$ = "m") THEN GOTO L_11fa9   '@11f87 DS:221e
L_11f99:
GOTO L_1217d   '@11f99
L_11fa9:
IF NOT (V_186e$ <> "2") THEN GOTO L_11fdf   '@11fa9 DS:2224
IF NOT (V_186e$ <> "E") THEN GOTO L_11fdf   '@11fbb DS:2128
IF NOT (V_186e$ = "e") THEN GOTO L_12001   '@11fcd DS:222a
L_11fdf:
V_157a$ = "EDITA"   '@11fdf DS:2230
GOTO L_12b65   '@11ff1
L_12001:
IF NOT (V_186e$ <> "3") THEN GOTO L_12037   '@12001 DS:223a
IF NOT (V_186e$ <> "I") THEN GOTO L_12037   '@12013 DS:1fc4
IF NOT (V_186e$ = "i") THEN GOTO L_12059   '@12025 DS:2240
L_12037:
V_157a$ = "IMPRIME"   '@12037 DS:2246
GOTO L_12b65   '@12049
L_12059:
IF NOT (V_186e$ <> "4") THEN GOTO L_1208f   '@12059 DS:2252
IF NOT (V_186e$ <> "D") THEN GOTO L_1208f   '@1206b DS:217e
IF NOT (V_186e$ = "d") THEN GOTO L_120b1   '@1207d DS:2258
L_1208f:
V_157a$ = "PLOTA"   '@1208f DS:225e
GOTO L_12b65   '@120a1
L_120b1:
IF NOT (V_186e$ <> "5") THEN GOTO L_120e7   '@120b1 DS:2268
IF NOT (V_186e$ <> "P") THEN GOTO L_120e7   '@120c3 DS:21a6
IF NOT (V_186e$ = "p") THEN GOTO L_120f7   '@120d5 DS:226e
L_120e7:
GOTO L_15375   '@120e7
L_120f7:
IF NOT (V_186e$ <> "6") THEN GOTO L_1212d   '@120f7 DS:2274
IF NOT (V_186e$ <> "A") THEN GOTO L_1212d   '@12109 DS:1f28
IF NOT (V_186e$ = "a") THEN GOTO L_12161   '@1211b DS:227a
L_1212d:
V_1872$ = "T"   '@1212d DS:2280
CALL S_15539(V_1872$)   '@1213f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @12148 libera strings locais (V_1872)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_11e99   '@12151
L_12161:
BEEP   '@12161
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_11e99   '@1216b
L_1217d:
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@12182
L_12196:
RT_VIEWPRINT 8, 25   '@1219b
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@121ad
RT_CLS 2   '@121d2
COLOR 14   '@121e0
PRINT " Coloque o Disco de Dados no Drive "; V_0e42$   '@121f6 DS:2286
V_1876$ = V_0e42$   '@1220d
V_187a$ = "LAJ"   '@1221f DS:22ae
GOSUB L_15031   '@12231
RT_VIEWPRINT 12, 15   '@1223e
LOCATE 12, 1   '@12250
CALL MIXT_07f1_LimpaTeclado   '@1226b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0dc0!))   '@12275
RT_LINEINPUT " Nome do Arquivo de Lajes  *RETORNO* ", V_0e2a$   '@12292 DS:22b6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e2a$ = UCASE$(V_0e2a$)   '@122ac
IF NOT (LEN(V_0e2a$) = 0) THEN GOTO L_122e1   '@122c4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@122d9
L_122e1:
IF NOT (VAL(V_0e2a$) <> 0.0#) THEN GOTO L_12317   '@122e1 DS:22e0
BEEP   '@12305
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12196   '@1230f
L_12317:
IF NOT (V_0e2a$ = "D") THEN GOTO L_1235a   '@12317 DS:217e
V_187e$ = "LAJE"   '@1232e DS:22e8
CALL S_15539(V_187e$)   '@12340
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @12349 libera strings locais (V_187e)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12196   '@12352
L_1235a:
ON ERROR GOTO L_15342
RT_ONERR = &H15342   '@1235a
V_0e0c$ = ""   '@12369 DS:1ec0
OPEN RT_ARQ$(V_0e42$ + V_0e2a$ + ".LAJ") FOR INPUT AS #1   '@1237b DS:1fc4,22f0
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_123d2   '@123a9 DS:22f8
BEEP   '@123c0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12196   '@123ca
L_123d2:
CLOSE #1   '@123d2
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@123e1
RT_VIEWPRINT 1, 25   '@123f0
COLOR 7   '@12402
LOCATE 8, 1   '@12418
PRINT " Lajes a serem utilizadas   "; V_0e42$; V_0e2a$; ".LAJ"; RT_TAB$(79); ""; ""   '@12433 DS:1ec0,22f0,2306
L_1247c:
RT_VIEWPRINT 9, 25   '@12481
RT_CLS 2   '@12493
COLOR 14   '@124a1
PRINT " Coloque o Disco de Dados no Drive "; V_0e3e$   '@124b7 DS:2286
V_1876$ = V_0e3e$   '@124ce
V_187a$ = "VIG"   '@124e0 DS:2326
GOSUB L_15031   '@124f2
RT_VIEWPRINT 12, 15   '@124ff
LOCATE 12, 1   '@12511
CALL MIXT_07f1_LimpaTeclado   '@1252c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0dc0!))   '@12536
RT_LINEINPUT " Nome do Arquivo de Vigas  *RETORNO* ", V_0e26$   '@12553 DS:232e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e26$ = UCASE$(V_0e26$)   '@1256d
IF NOT (LEN(V_0e26$) = 0) THEN GOTO L_125a2   '@12585
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12196   '@1259a
L_125a2:
IF NOT (VAL(V_0e26$) <> 0.0#) THEN GOTO L_125d8   '@125a2 DS:22e0
BEEP   '@125c6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1247c   '@125d0
L_125d8:
IF NOT (V_0e26$ = "D") THEN GOTO L_1261b   '@125d8 DS:217e
V_1882$ = "VIGA"   '@125ef DS:2358
CALL S_15539(V_1882$)   '@12601
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @1260a libera strings locais (V_1882)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1247c   '@12613
L_1261b:
ON ERROR GOTO L_15342
RT_ONERR = &H15342   '@1261b
V_0e0c$ = ""   '@1262a DS:1ec0
OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".SEC") FOR INPUT AS #1   '@1263c DS:1fc4,2360
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_12693   '@1266a DS:22f8
BEEP   '@12681
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1247c   '@1268b
L_12693:
CLOSE #1   '@12693
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@126a2
RT_VIEWPRINT 1, 25   '@126b1
COLOR 7   '@126c3
LOCATE 9, 1   '@126d9
PRINT " Vigas a serem utilizadas   "; V_0e3e$; V_0e26$; ".VIG"; RT_TAB$(79); ""; ""   '@126f4 DS:1ec0,2368,2388
L_1273d:
RT_VIEWPRINT 10, 25   '@12742
RT_CLS 2   '@12754
COLOR 14   '@12762
PRINT " Coloque o Disco de Dados no Drive "; V_0e46$   '@12778 DS:2286
V_1876$ = V_0e46$   '@1278f
V_187a$ = "COL"   '@127a1 DS:2390
GOSUB L_15031   '@127b3
RT_VIEWPRINT 12, 15   '@127c0
LOCATE 12, 1   '@127d2
CALL MIXT_07f1_LimpaTeclado   '@127ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0dc0!))   '@127f7
RT_LINEINPUT " Nome do Arquivo de Colunas  *RETORNO* ", V_0e2e$   '@12814 DS:2398
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e2e$ = UCASE$(V_0e2e$)   '@1282e
IF NOT (LEN(V_0e2e$) = 0) THEN GOTO L_12863   '@12846
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1247c   '@1285b
L_12863:
IF NOT (VAL(V_0e2e$) <> 0.0#) THEN GOTO L_12899   '@12863 DS:22e0
BEEP   '@12887
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1273d   '@12891
L_12899:
IF NOT (V_0e2e$ = "D") THEN GOTO L_128dc   '@12899 DS:217e
V_1886$ = "PILAR"   '@128b0 DS:23c4
CALL S_15539(V_1886$)   '@128c2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @128cb libera strings locais (V_1886)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1273d   '@128d4
L_128dc:
ON ERROR GOTO L_15342
RT_ONERR = &H15342   '@128dc
V_0e0c$ = ""   '@128eb DS:1ec0
OPEN RT_ARQ$(V_0e46$ + V_0e2e$ + ".COL") FOR INPUT AS #1   '@128fd DS:1fc4,23ce
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_12954   '@1292b DS:22f8
BEEP   '@12942
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1273d   '@1294c
L_12954:
CLOSE #1   '@12954
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@12963
RT_VIEWPRINT 1, 25   '@12972
COLOR 7   '@12984
LOCATE 10, 1   '@1299a
PRINT " Colunas a serem utilizadas "; V_0e46$; V_0e2e$; ".COL"; RT_TAB$(79); ""; ""   '@129b5 DS:1ec0,23ce,23d6
RT_VIEWPRINT 12, 25   '@129f9
RT_CLS 2   '@12a0b
PRINT " Leitura de dados   Aguarde ... "   '@12a19 DS:23f6
GOSUB L_14fab   '@12a27
IF NOT (V_1a04$ <> "") THEN GOTO L_12a7e   '@12a34 DS:1ec0
BEEP   '@12a4b
V_0e0c$ = RT_INPUT$(1)   '@12a55
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_1217d   '@12a71
L_12a7e:
GOSUB L_14d69   '@12a7e
LOCATE 23, 1   '@12a8b
PRINT " Todos os dados de dimensionamento foram lidos."   '@12aa6 DS:241a
PRINT " Inicio a montagem da Forma  N/*S*";   '@12ab4 DS:244e
CALL MIXT_07f1_LimpaTeclado   '@12ac2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_0e0c$   '@12acc DS:2474
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_12b0b   '@12ae6 DS:1eec
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@12b03
L_12b0b:
CALL S_166f2   '@12b0b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "RETORNA") THEN GOTO L_12b34   '@12b15 DS:247a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@12b2c
L_12b34:
V_157a$ = "FORMA"   '@12b34 DS:2486
V_0e0c$ = "FORMINIT"   '@12b46 DS:2490
GOTO L_15387   '@12b58
L_12b65:
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@12b6a
L_12b7e:
RT_VIEWPRINT 8, 25   '@12b83
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@12b95
RT_CLS 2   '@12bba
COLOR 14   '@12bc8
PRINT " Coloque o Disco de Dados no Drive "; V_0e4e$   '@12bde DS:2286
V_1876$ = V_0e4e$   '@12bf5
V_187a$ = "FRM"   '@12c07 DS:249c
GOSUB L_15031   '@12c19
RT_VIEWPRINT 12, 15   '@12c26
LOCATE 12, 1   '@12c38
CALL MIXT_07f1_LimpaTeclado   '@12c53
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0dc0!))   '@12c5d
RT_LINEINPUT " Nome do Arquivo de Forma  *RETORNO* ", V_0e32$   '@12c7a DS:24a4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e32$ = UCASE$(V_0e32$)   '@12c94
IF NOT (LEN(V_0e32$) = 0) THEN GOTO L_12cc9   '@12cac
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@12cc1
L_12cc9:
IF NOT (VAL(V_0e32$) <> 0.0#) THEN GOTO L_12cff   '@12cc9 DS:22e0
BEEP   '@12ced
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12b7e   '@12cf7
L_12cff:
IF NOT (V_0e32$ = "D") THEN GOTO L_12d42   '@12cff DS:217e
V_188a$ = "FORMA"   '@12d16 DS:2486
CALL S_15539(V_188a$)   '@12d28
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @12d31 libera strings locais (V_188a)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12b7e   '@12d3a
L_12d42:
ON ERROR GOTO L_15342
RT_ONERR = &H15342   '@12d42
V_0e0c$ = ""   '@12d51 DS:1ec0
OPEN RT_ARQ$(V_0e4e$ + V_0e32$ + ".FRM") FOR INPUT AS #1   '@12d63 DS:1fc4,24ce
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_12dba   '@12d91 DS:22f8
BEEP   '@12da8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12b7e   '@12db2
L_12dba:
CLOSE #1   '@12dba
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@12dc9
RT_VIEWPRINT 1, 25   '@12dd8
COLOR 7   '@12dea
LOCATE 8, 1   '@12e00
PRINT " Forma a ser editada        "; V_0e4e$; V_0e32$; ".FRM "; RT_TAB$(79); ""; ""   '@12e1b DS:1ec0,24d6,24f6
OPEN RT_ARQ$(V_0e4e$ + V_0e32$ + ".FRM") FOR INPUT AS #1   '@12e5f DS:1fc4,24ce
LINE INPUT #1, V_0e0c$   '@12e8d DS:1ec0
LINE INPUT #1, V_0e0c$   '@12eb0 DS:1ec0
LINE INPUT #1, V_0e2a$   '@12ed3 DS:1ec0
LINE INPUT #1, V_0e26$   '@12ef6 DS:1ec0
LINE INPUT #1, V_0e2e$   '@12f19 DS:1ec0
LINE INPUT #1, V_0e42$   '@12f3c DS:1ec0
LINE INPUT #1, V_0e3e$   '@12f5f DS:1ec0
LINE INPUT #1, V_0e46$   '@12f82 DS:1ec0
LINE INPUT #1, V_188e$   '@12fa5 DS:1ec0
RT_CLOSE   '@12fc8 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
L_12fda:
RT_VIEWPRINT 9, 11   '@12fdf
RT_CLS 2   '@12ff1
ON ERROR GOTO L_15342
RT_ONERR = &H15342   '@12fff
COLOR 7   '@1300e
LOCATE 9, 1   '@13024
PRINT " Lajes a serem utilizadas   "; V_0e42$; V_0e2a$; ".LAJ";   '@1303f DS:22f0,2306
V_0e0c$ = ""   '@13068 DS:1ec0
OPEN RT_ARQ$(V_0e42$ + V_0e2a$ + ".LAJ") FOR INPUT AS #1   '@1307a DS:1fc4,22f0
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_13132   '@130a8 DS:22f8
RT_CLOSE   '@130bf (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
BEEP   '@130cc
COLOR RT_CINT%(FX##(V_0dc0!))   '@130d6
PRINT " NAO ENCONTRADO";   '@130f3 DS:2500
V_1892$ = "LAJE"   '@13101 DS:22e8
CALL S_15539(V_1892$)   '@13113
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @1311c libera strings locais (V_1892)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12fda   '@13125
L_13132:
CLOSE #1   '@13132
COLOR 7   '@13141
LOCATE 10, 1   '@13157
PRINT " Vigas a serem utilizadas   "; V_0e3e$; V_0e26$; ".VIG";   '@13172 DS:2368,2388
V_0e0c$ = ""   '@1319b DS:1ec0
OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".SEC") FOR INPUT AS #1   '@131ad DS:1fc4,2360
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_13265   '@131db DS:22f8
RT_CLOSE   '@131f2 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
BEEP   '@131ff
COLOR RT_CINT%(FX##(V_0dc0!))   '@13209
PRINT " NAO ENCONTRADO";   '@13226 DS:2500
V_1896$ = "VIGA"   '@13234 DS:2358
CALL S_15539(V_1896$)   '@13246
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @1324f libera strings locais (V_1896)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12fda   '@13258
L_13265:
CLOSE #1   '@13265
COLOR 7   '@13274
LOCATE 11, 1   '@1328a
PRINT " Colunas a serem utilizadas "; V_0e46$; V_0e2e$; ".COL";   '@132a5 DS:23ce,23d6
V_0e0c$ = ""   '@132ce DS:1ec0
OPEN RT_ARQ$(V_0e46$ + V_0e2e$ + ".COL") FOR INPUT AS #1   '@132e0 DS:1fc4,23ce
IF NOT (V_0e0c$ = "NOMEERRADO") THEN GOTO L_13398   '@1330e DS:22f8
RT_CLOSE   '@13325 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
BEEP   '@13332
COLOR RT_CINT%(FX##(V_0dc0!))   '@1333c
PRINT " NAO ENCONTRADO";   '@13359 DS:2500
V_189a$ = "PILAR"   '@13367 DS:23c4
CALL S_15539(V_189a$)   '@13379
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
' @13382 libera strings locais (V_189a)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12fda   '@1338b
L_13398:
CLOSE #1   '@13398
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@133a7
RT_VIEWPRINT 12, 25   '@133b6
RT_CLS 2   '@133c8
COLOR RT_CINT%(FX##(V_0dc0!))   '@133d6
PRINT " Continuo com a edicao da forma N/*S* ";   '@133f3 DS:2514
CALL MIXT_07f1_LimpaTeclado   '@13401
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@1340b DS:1ec0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1344a   '@13425 DS:1eec
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12b65   '@13442
L_1344a:
RT_CLS 2   '@1344a
PRINT " Leitura de dados   Aguarde ... "   '@13458 DS:23f6
GOSUB L_14fab   '@13466
IF NOT (V_1a04$ <> "") THEN GOTO L_134cb   '@13473 DS:1ec0
CALL MIXT_07f1_LimpaTeclado   '@1348a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
PRINT " Qualquer Tecla para Continuar ";   '@13494 DS:253e
V_0e0c$ = RT_INPUT$(1)   '@134a2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_12b65   '@134be
L_134cb:
GOSUB L_14d69   '@134cb
LOCATE 23, 1   '@134d8
PRINT " Todos os dados de dimensionamento foram lidos."   '@134f3 DS:241a
V_189e$ = V_157a$   '@13501
IF NOT (V_189e$ = "EDITA") THEN GOTO L_13540   '@13513 DS:2230
PRINT " Inicio da reedicao da Forma  N/*S*";   '@1352a DS:2562
GOTO L_13590   '@13538
L_13540:
IF NOT (V_189e$ = "IMPRIME") THEN GOTO L_13568   '@13540 DS:2246
PRINT " Inicio da Montagem de Impressao da Forma  N/*S*";   '@13552 DS:258a
GOTO L_13590   '@13560
L_13568:
IF NOT (V_189e$ = "PLOTA") THEN GOTO L_13590   '@13568 DS:225e
PRINT " Inicio da Montagem da Plotagem da Forma  N/*S*";   '@1357a DS:25be
GOTO L_13590   '@13588
L_13590:
CALL MIXT_07f1_LimpaTeclado   '@13590
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_0e0c$   '@1359a DS:2474
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_135d9   '@135b4 DS:1eec
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@135d1
L_135d9:
OPEN RT_ARQ$(V_0e4e$ + V_0e32$ + ".FRM") FOR INPUT AS #1   '@135d9 DS:1fc4,24ce
LINE INPUT #1, V_0e0c$   '@13607 DS:1ec0
LINE INPUT #1, V_0e0c$   '@1362a DS:1ec0
LINE INPUT #1, V_0e0c$   '@1364d DS:1ec0
LINE INPUT #1, V_0e0c$   '@13670 DS:1ec0
LINE INPUT #1, V_0e0c$   '@13693 DS:1ec0
LINE INPUT #1, V_0e0c$   '@136b6 DS:1ec0
LINE INPUT #1, V_0e0c$   '@136d9 DS:1ec0
LINE INPUT #1, V_0e0c$   '@136fc DS:1ec0
LINE INPUT #1, V_0e22$   '@1371f DS:1ec0
LINE INPUT #1, V_0e0c$   '@13742 DS:1ec0
LINE INPUT #1, V_0e0c$   '@13765 DS:1ec0
LINE INPUT #1, V_0e0c$   '@13788 DS:1ec0
INPUT #1, V_11e0!   '@137ab
REDIM A_157e%(-32768 TO -32768)   '@137ca
REDIM A_157e%(0 TO CINT(V_11e0! + 10.0))   '@137d8 DS:1ffc
IF NOT (V_11e0! > 0.0) THEN GOTO L_13895   '@13801 DS:1ef2
V_18a2! = V_11e0!   '@1381c
FOR V_11b8! = 0.0 TO V_18a2!   '@1382e DS:1ec8,1ef2
INPUT #1, A_157e%(RT_CINT%(FX##(V_11b8!)))   '@13836
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13867 DS:1ec8
L_13895:
INPUT #1, V_11e0!   '@13895
REDIM A_15ac%(-32768 TO -32768)   '@138b4
REDIM A_15ac%(0 TO CINT(V_11e0! + 10.0))   '@138c2 DS:1ffc
IF NOT (V_11e0! > 0.0) THEN GOTO L_1397f   '@138eb DS:1ef2
V_18a6! = V_11e0!   '@13906
FOR V_11b8! = 0.0 TO V_18a6!   '@13918 DS:1ec8,1ef2
INPUT #1, A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@13920
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13951 DS:1ec8
L_1397f:
INPUT #1, V_11e0!   '@1397f
REDIM A_15da!(-32768 TO -32768, -32768 TO -32768)   '@1399e
REDIM A_15da!(0 TO CINT(V_11e0! + 2.0), 0 TO 5)   '@139ac DS:1ee4
IF NOT (V_11e0! > 0.0) THEN GOTO L_13ab4   '@139dc DS:1ef2
V_18aa! = V_11e0!   '@139f7
FOR V_11b8! = 0.0 TO V_18aa!   '@13a09 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 5.0   '@13a10 DS:1ec8,1ef2,25f2
INPUT #1, A_15da!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@13a1e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@13a5a DS:1ec8,25f2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13a83 DS:1ec8
L_13ab4:
INPUT #1, V_11e0!   '@13ab4
REDIM A_1608!(-32768 TO -32768, -32768 TO -32768)   '@13ad3
REDIM A_1608!(0 TO CINT(V_11e0! + 2.0), 0 TO 4)   '@13ae1 DS:1ee4
REDIM A_17d4!(-32768 TO -32768, -32768 TO -32768)   '@13b0e
REDIM A_17d4!(0 TO CINT(V_11e0! + 2.0), 0 TO 8)   '@13b1c DS:1ee4
INPUT #1, V_11e0!   '@13b4c
IF NOT (V_11e0! > 0.0) THEN GOTO L_13cfc   '@13b6b DS:1ef2
V_18ae! = V_11e0!   '@13b86
FOR V_11b8! = 0.0 TO V_18ae!   '@13b98 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 4.0   '@13ba0 DS:1ec8,1ef2,1f18
INPUT #1, A_1608!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@13bae
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@13bea DS:1ec8,1f18
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13c13 DS:1ec8
V_18b2! = V_11e0!   '@13c3f
FOR V_11b8! = 0.0 TO V_18b2!   '@13c51 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 8.0   '@13c58 DS:1ec8,1ef2,25f6
INPUT #1, A_17d4!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@13c66
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@13ca2 DS:1ec8,25f6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13ccb DS:1ec8
L_13cfc:
INPUT #1, V_11e0!   '@13cfc
REDIM A_1636!(-32768 TO -32768, -32768 TO -32768)   '@13d1b
REDIM A_1636!(0 TO CINT(V_11e0! + 10.0), 0 TO 4)   '@13d29 DS:1ffc
IF NOT (V_11e0! > 0.0) THEN GOTO L_13e2e   '@13d56 DS:1ef2
V_18b6! = V_11e0!   '@13d71
FOR V_11b8! = 0.0 TO V_18b6!   '@13d83 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 4.0   '@13d8a DS:1ec8,1ef2,1f18
INPUT #1, A_1636!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@13d98
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@13dd4 DS:1ec8,1f18
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13dfd DS:1ec8
L_13e2e:
INPUT #1, A_15ac%(A_15ac%(0) + 1)   '@13e2e
INPUT #1, V_11e0!   '@13e65
IF NOT (V_11e0! > 0.0) THEN GOTO L_13fd1   '@13e84 DS:1ef2
V_18ba! = A_1200!(0, 0, 0)   '@13e9f
FOR V_11b8! = 1.0 TO V_18ba!   '@13ec1 DS:1ec8
FOR V_11bc! = 0.0 TO 13.0   '@13ec8 DS:1ec8,1ef2,25fa
INPUT #1, A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 2)   '@13ed6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@13f16 DS:1ec8,25fa
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13f3f DS:1ec8
INPUT #1, A_1200!(1, 14, 3)   '@13f6b
INPUT #1, A_1200!(1, 14, 4)   '@13f9a
L_13fd1:
LINE INPUT #1, V_0e0c$   '@13fd1 DS:1ec0
INPUT #1, V_11e0!   '@13ff4
REDIM A_1664!(-32768 TO -32768, -32768 TO -32768)   '@14013
V_18be! = FX##(A_1608!(0, 0)) * 4.0   '@14021 DS:1f18
CALL MIXT_082a_Maior(V_11e0!, V_18be!, V_18c2!)   '@14046
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
REDIM A_1664!(0 TO CINT(V_18c2!), 0 TO 4)   '@14057
IF NOT (V_11e0! > 0.0) THEN GOTO L_14152   '@1407a DS:1ef2
V_18c6! = V_11e0!   '@14095
FOR V_11b8! = 0.0 TO V_18c6!   '@140a7 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 4.0   '@140ae DS:1ec8,1ef2,1f18
INPUT #1, A_1664!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@140bc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@140f8 DS:1ec8,1f18
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14121 DS:1ec8
L_14152:
INPUT #1, V_11e0!   '@14152
REDIM A_171c%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@14171
REDIM A_171c%(0 TO CINT(A_1608!(0, 1)), 0 TO 6, 0 TO 1)   '@1417f
IF NOT (A_1608!(0, 0) > 0.0) THEN GOTO L_142fe   '@141c1 DS:1ef2
V_18ca! = A_1608!(0, 0)   '@141eb
FOR V_11b8! = 0.0 TO V_18ca!   '@1420c DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 6.0   '@14214 DS:1ec8,1ef2,25fe
INPUT #1, A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 0)   '@14222
INPUT #1, A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 1)   '@14261
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@142a1 DS:1ec8,25fe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@142cd DS:1ec8
L_142fe:
INPUT #1, V_11e0!   '@142fe
REDIM A_1692!(-32768 TO -32768, -32768 TO -32768)   '@1431d
REDIM A_1692!(0 TO CINT(A_1636!(0, 0) + 30.0), 0 TO 4)   '@1432b DS:2602
IF NOT (V_11e0! > 0.0) THEN GOTO L_1443e   '@14365 DS:1ef2
V_18ce! = V_11e0!   '@14380
FOR V_11b8! = 0.0 TO V_18ce!   '@14392 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 4.0   '@1439a DS:1ec8,1ef2,1f18
INPUT #1, A_1692!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@143a8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@143e4 DS:1ec8,1f18
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1440d DS:1ec8
L_1443e:
LINE INPUT #1, V_0e0c$   '@1443e DS:1ec0
LINE INPUT #1, V_0e0c$   '@14461 DS:1ec0
LINE INPUT #1, V_0e0c$   '@14484 DS:1ec0
LINE INPUT #1, V_0e0c$   '@144a7 DS:1ec0
LINE INPUT #1, V_0e0c$   '@144ca DS:1ec0
LINE INPUT #1, V_0e0c$   '@144ed DS:1ec0
INPUT #1, V_1802%   '@14510
REDIM A_1832%(-32768 TO -32768, -32768 TO -32768)   '@1452f
REDIM A_1832%(0 TO 400, 0 TO 2)   '@1453d
REDIM A_1804!(-32768 TO -32768, -32768 TO -32768)   '@1455e
REDIM A_1804!(0 TO 80, 0 TO 5)   '@1456c
IF NOT (V_1802% = 1) THEN GOTO L_1477c   '@14590
INPUT #1, V_11e0!   '@1459f
V_18d2! = V_11e0!   '@145be
FOR V_11b8! = 0.0 TO V_18d2!   '@145d0 DS:1ec8,1ef2
INPUT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 0)   '@145d8
INPUT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 1)   '@1460c
INPUT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 2)   '@14641
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14673 DS:1ec8
INPUT #1, V_11e0!   '@1469f
V_18d6! = V_11e0!   '@146be
FOR V_11b8! = 0.0 TO V_18d6!   '@146d0 DS:1ec8,1ef2
FOR V_11bc! = 0.0 TO 5.0   '@146d8 DS:1ec8,1ef2,25f2
INPUT #1, A_1804!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@146e6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@14722 DS:1ec8,25f2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1474b DS:1ec8
L_1477c:
INPUT #1, V_11e0!   '@1477c
REDIM A_17a6%(-32768 TO -32768, -32768 TO -32768)   '@1479b
REDIM A_17a6%(0 TO CINT(V_11e0!), 0 TO 1)   '@147a9
IF NOT (V_11e0! > 0.0) THEN GOTO L_148a2   '@147d4 DS:1ef2
V_18da! = V_11e0!   '@147ef
FOR V_11b8! = 0.0 TO V_18da!   '@14801 DS:1ec8,1ef2
INPUT #1, A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)   '@14808
INPUT #1, A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)   '@1483c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14871 DS:1ec8
L_148a2:
INPUT #1, V_11e0!   '@148a2
REDIM A_174a%(-32768 TO -32768, -32768 TO -32768)   '@148c1
REDIM A_174a%(0 TO CINT(V_11e0!), 0 TO 1)   '@148cf
IF NOT (V_11e0! > 0.0) THEN GOTO L_149c8   '@148fa DS:1ef2
V_18de! = V_11e0!   '@14915
FOR V_11b8! = 0.0 TO V_18de!   '@14927 DS:1ec8,1ef2
INPUT #1, A_174a%(RT_CINT%(FX##(V_11b8!)), 0)   '@1492e
INPUT #1, A_174a%(RT_CINT%(FX##(V_11b8!)), 1)   '@14962
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14997 DS:1ec8
L_149c8:
INPUT #1, V_11e0!   '@149c8
REDIM A_1778%(-32768 TO -32768, -32768 TO -32768)   '@149e7
REDIM A_1778%(0 TO CINT(V_11e0!), 0 TO 2)   '@149f5
IF NOT (V_11e0! > 0.0) THEN GOTO L_14b1e   '@14a1d DS:1ef2
V_18e2! = V_11e0!   '@14a38
FOR V_11b8! = 0.0 TO V_18e2!   '@14a4a DS:1ec8,1ef2
INPUT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 0)   '@14a52
INPUT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 1)   '@14a86
INPUT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 2)   '@14abb
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14aed DS:1ec8
L_14b1e:
RT_CLOSE   '@14b1e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
CALL S_239c9   '@14b2b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11d4! = 1.0) THEN GOTO L_14c4d   '@14b35 DS:1ec8
RT_VIEWPRINT 7, 25   '@14b50
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@14b62
RT_CLS 2   '@14b87
LOCATE 23, 1   '@14b95
BEEP   '@14bb0
IF NOT (V_157a$ = "EDITA") THEN GOTO L_14c07   '@14bba DS:2230
PRINT " Reedicao necessaria devido a mudanca de secao nas Vigas"   '@14bd1 DS:2606
PRINT " Aguarde ... "   '@14bdf DS:2642
V_157a$ = "REEDITA"   '@14bed DS:2654
GOTO L_14c48   '@14bff
L_14c07:
PRINT " Vigas com secao alterada.  Edite novamente a Forma  *RETORNA* ";   '@14c07 DS:2660
CALL MIXT_07f1_LimpaTeclado   '@14c15
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@14c1f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@14c3b
L_14c48:
L_14c4d:
V_18e6$ = V_157a$   '@14c4d
IF NOT (V_18e6$ = "EDITA") THEN GOTO L_14ca2   '@14c5f DS:2230
V_157a$ = "FORMA"   '@14c76 DS:2486
V_0e0c$ = "FORMEDCA"   '@14c88 DS:26a4
GOTO L_14d5c   '@14c9a
L_14ca2:
IF NOT (V_18e6$ = "IMPRIME") THEN GOTO L_14ce0   '@14ca2 DS:2246
V_157a$ = "FORMA"   '@14cb4 DS:2486
V_0e0c$ = "FORMIMP"   '@14cc6 DS:26b0
GOTO L_14d5c   '@14cd8
L_14ce0:
IF NOT (V_18e6$ = "PLOTA") THEN GOTO L_14d1e   '@14ce0 DS:225e
V_157a$ = "FORMA"   '@14cf2 DS:2486
V_0e0c$ = "FORMPLOT"   '@14d04 DS:26bc
GOTO L_14d5c   '@14d16
L_14d1e:
IF NOT (V_18e6$ = "REEDITA") THEN GOTO L_14d5c   '@14d1e DS:2654
V_157a$ = "FORMEDCA"   '@14d30 DS:26a4
V_0e0c$ = "FORMINIT"   '@14d42 DS:2490
GOTO L_14d5c   '@14d54
L_14d5c:
GOTO L_15387   '@14d5c
' ---- F_14d64 @0x14d64  (014d64_F_14d64.lift.txt; evidence_id (assembly): ev_c1ee34e9f607e3b792c3a9fd963b5a45fdccb1fbf53835f3bdc6776d2ff811de)
L_14d69:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0119dd_FUN_1000_19dd
RT_VIEWPRINT 8, 25   '@14d6e
RT_CLS 2   '@14d80
PRINT " Lajes a serem utilizadas   "; V_0e42$; V_0e2a$; ".LAJ"; RT_TAB$(79); ""; ""   '@14d8e DS:1ec0,22f0,2306
PRINT "                            tracos de arquitetura"; A_0ea6!(0, 0)   '@14dd2 DS:26c8
PRINT "                            tracos de estrutura"; A_0ed4!(0, 0)   '@14dfc DS:26fe
PRINT "                            lajes arquivadas"; V_0e66%   '@14e26 DS:2732
PRINT "                            trechos de pilares arquivados"; A_0fe8!(0, 0)   '@14e3d DS:2762
PRINT "                            vigas arquivadas"; A_1044%(0, 0)   '@14e67 DS:27a0
PRINT ""   '@14e8d DS:1ec0
PRINT " Vigas a serem utilizadas   "; V_0e3e$; V_0e26$; ".VIG"; RT_TAB$(79); ""; ""   '@14e9b DS:1ec0,2368,2388
PRINT "                            vigas arquivadas"; A_1200!(0, 0, 0)   '@14edf DS:27a0
PRINT ""   '@14f0a DS:1ec0
PRINT " Colunas a serem utilizadas "; V_0e46$; V_0e2e$; ".COL"; RT_TAB$(79); ""; ""   '@14f18 DS:1ec0,23ce,23d6
PRINT "                            niveis definidos"; A_13b0!(0)   '@14f5c DS:27d0
PRINT "                            colunas arquivadas"; V_139e%   '@14f85 DS:2800
RETURN   '@14f9c
L_14fab:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0119dd_FUN_1000_19dd
V_1a04$ = ""   '@14fb0 DS:1ec0
CALL S_21093   '@14fc2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_1a04$ <> "") THEN GOTO L_14fed   '@14fcc DS:1ec0
RETURN   '@14fe3
L_14fed:
CALL S_22aec   '@14fed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_1a04$ <> "") THEN GOTO L_15018   '@14ff7 DS:1ec0
RETURN   '@1500e
L_15018:
CALL S_2018c   '@15018
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@15022
L_15031:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0119dd_FUN_1000_19dd
RT_VIEWPRINT 14, 25   '@15036
RT_CLS 2   '@15048
COLOR 3   '@15056
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@1506c DS:1ec0,2832
RT_VIEWPRINT 16, 25   '@1508c
COLOR 14   '@1509e
ON ERROR GOTO L_15125
RT_ONERR = &H15125   '@150b4
L_BP0c% = (LEN(V_1876$) > 3)   '@150c3
CHDIR RT_ARQ$(RT_LEFT$((V_1876$), (LEN(V_1876$) + L_BP0c%)))   '@150e2
RT_FILES V_1876$ + "*." + V_187a$   '@150f6 DS:2868 (FILES: cabecalho em forma DOS (RT45))
GOTO L_15182   '@15118
' ---- F_15120 @0x15120  (015120_F_15120.lift.txt; evidence_id (assembly): ev_525e8f3a7bc9108284c5f560d2cbb616b1d3991f05451a6147966b4511170b39)
L_15125:   ' entrada vinda de 014d64_F_14d64, 015539_FUN_1000_5539
IF NOT (ERR = 53) THEN GOTO L_15159   '@1512a
PRINT " Nenhum Arquivo Encontrado"   '@1513c DS:286e
RESUME NEXT   '@1514a
L_15159:
RESUME L_1516b   '@15159
L_1516b:
GOSUB L_151a5   '@15170
L_15182:   ' entrada vinda de 014d64_F_14d64
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@15187
RETURN   '@15196
L_151a5:   ' sub-rotina (alvo de GOSUB)
BEEP   '@151aa
V_18ea! = 0.0   '@151b4 DS:1ef2
V_18ee! = 1.0   '@151c6 DS:1ec8
CALL MIXT_0dbe_GuardaTela(V_18ea!, V_18ee!, V_0dcc$)   '@151d1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
ON ERROR GOTO L_11849
RT_ONERR = &H11849   '@151e2
RT_CLOSE   '@151f1 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RT_VIEWPRINT 21, 25   '@151fe
RT_CLS 2   '@15210
LOCATE 23, 20   '@1521e
COLOR 14, RT_CINT%(FX##(V_0dc8!))   '@1523c
V_18f2% = ERR   '@15261
IF NOT (V_18f2% = 53) THEN GOTO L_15293   '@1526e
PRINT "NAO EXISTE ESTE ARQUIVO NESTE DISCO"   '@1527d DS:288c
GOTO L_152c6   '@1528b
L_15293:
IF NOT (V_18f2% = 61) THEN GOTO L_152b3   '@15293
PRINT "O SEU DISCO DE DADOS ESTA COMPLETO"   '@1529d DS:28b4
GOTO L_152c6   '@152ab
L_152b3:
PRINT "VERIFIQUE O SEU DRIVE"   '@152b3 DS:28da
L_152c6:
COLOR 7   '@152c6
CALL MIXT_07f1_LimpaTeclado   '@152dc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@152e6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
V_18f4! = 1.0   '@15302 DS:1ec8
V_18f8! = 0.0   '@15314 DS:1ef2
CALL MIXT_0dbe_GuardaTela(V_18f4!, V_18f8!, V_0dcc$)   '@1531f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
RETURN L_119dd   '@1533a
' ---- F_1533d @0x1533d  (01533d_F_1533d.lift.txt; evidence_id (assembly): ev_4e69090f4384d3e3b4711f7cb283a4289d9cb2a47751b314699c9946571d598b)
L_15342:   ' entrada vinda de 0119dd_FUN_1000_19dd
RT_CLOSE   '@15347 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
V_0e0c$ = "NOMEERRADO"   '@15354 DS:22f8
RESUME NEXT   '@15366
L_15375:   ' entrada vinda de 0119dd_FUN_1000_19dd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY no laco (B$EVCK)
GOTO L_119dd   '@1537a
' ---- FUN_1000_5387 @0x15387  (015387_FUN_1000_5387.lift.txt; evidence_id (assembly): ev_86c5d5bb06b5e57836860a79cabb4c5a0b8f1f5a30fd2f78e12b55ff87c25eb5)
L_15387:   ' entrada vinda de 0119dd_FUN_1000_19dd
ON ERROR GOTO L_15515
RT_ONERR = &H15515   '@1538c
IF NOT (V_157a$ = "FORMA") THEN GOTO L_1540f   '@1539b DS:2486
RT_VIEWPRINT (V_0e0c$ = "FORMINIT") + 7, 25   '@153b2 DS:2490
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@153d7
RT_CLS 2   '@153fc
L_1540f:
L_BP0c% = (V_0e3a$ = "A:\")   '@1540f DS:1ed8
IF NOT ((V_0e3a$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_154ab   '@15434 DS:28f4
CALL MIXT_07f1_LimpaTeclado   '@15449
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
PRINT ""   '@15453 DS:1ec0
PRINT " Coloque o disco contendo o Modulo "; V_0e0c$; " em "; V_0e3a$   '@15461 DS:28fc,2924
V_0e10$ = RT_INPUT$(1)   '@1548a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1187c, L_118a7, L_119af   ' ON KEY pelo roteiro (entre comandos)
L_154ab:
V_11d4! = RT_FRE&("")   '@154ab DS:1ec0
L_BP0c% = (LEN(V_0e3a$) > 3)   '@154c5
CHDIR RT_ARQ$(RT_LEFT$((V_0e3a$), (LEN(V_0e3a$) + L_BP0c%)))   '@154e4
RT_CHAIN V_0e3a$ + V_0e0c$   '@154f8
L_15515:
BEEP   '@1551a
RESUME L_15387   '@15524
' @15531 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_16550   '@15531
' ---- FUN_1000_6550 @0x16550  (016550_FUN_1000_6550.lift.txt; evidence_id (assembly): ev_62809f908f1b5fa8f69cec276a6d6aa591ad04b15c4f5fd5d73b0878505c7d7f)
L_16550:   ' entrada vinda de 015387_FUN_1000_5387
GOTO L_166cd   '@16550
' ---- FUN_1000_66cd @0x166cd  (0166cd_FUN_1000_66cd.lift.txt; evidence_id (assembly): ev_c41d5f18de02e50c5565ce245144f73d6a400c2b7750879cea041e8530f83ab9)
L_166cd:   ' entrada vinda de 016550_FUN_1000_6550
GOTO L_166ea   '@166cd
' ---- FUN_1000_66ea @0x166ea  (0166ea_FUN_1000_66ea.lift.txt; evidence_id (assembly): ev_5c94f3d0b544591eedb7ca0a9dfe5521e126c46c25aa1b5375f3387cca00836b)
L_166ea:   ' entrada vinda de 0166cd_FUN_1000_66cd
GOTO L_1998b   '@166ea
' ---- FUN_1000_998b @0x1998b  (01998b_FUN_1000_998b.lift.txt; evidence_id (assembly): ev_afdd2e81dc76becef6448d77fd4bd487952ad9aff46fb49499094c5e2e9dc397)
L_1998b:   ' entrada vinda de 0166ea_FUN_1000_66ea
RT_FIM   ' @1998b B$CENP (inicio/fim do modulo)
'RETRAD? @19990 ?? 50 bytes sem caminho de entrada conhecido (dados/lixo, 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH; ADD byte ptr [BX + SI], AL ...
L_199c2:
'RETRAD? @199c2 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x1000:99c6
L_199c6:
'RETRAD? @199c6 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x1000:99ca
L_199ca:
'RETRAD? @199ca ?? 375 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 161 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
L_19b41:
'RETRAD? @19b41 ?? 100 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 44 instr.): ADD AX, word ptr [BX + SI]; ADD byte ptr [BX + DI + 0x3], AH ...
' ---- F_19ba5 @0x19ba5  (019ba5_F_19ba5.lift.txt; evidence_id (assembly): ev_c064117bd8cec9629ef1cb082f5ca710281bcf74250a850da857dbf104f12927)
'RETRAD? @19baa ?? 46 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 21 instr.): ADD byte ptr [BX + SI], AL; ADC byte ptr [0x0], AL ...
L_19bd8:
'RETRAD? @19bd8 ?? 165 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 75 instr.): SUB AL, 0x7; ADD byte ptr [BX + SI], AL ...
L_19c7d:
'RETRAD? @19c7d ?? 103 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 46 instr.): OR AX, word ptr [BX + SI]; ADD CL, BH ...
L_19ce4:
'RETRAD? @19ce4 ?? 33 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 15 instr.): TEST word ptr [0x0], 0xf1a; ADD byte ptr [BX + SI], AL ...
L_19d05:
'RETRAD? @19d05 ?? 66 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 32 instr.): SLDT word ptr [BX + SI]; POP SS ...
L_19d47:
'RETRAD? @19d47 ?? 86 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 40 instr.): ADD byte ptr [DI], DH; ADC AL, byte ptr [BX + SI] ...
L_19d9d:
'RETRAD? @19d9d ?? 144 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 68 instr.): ADC AX, word ptr [BX + SI]; ADD BL, DL ...
' ---- F_19e2e @0x19e2e  (019e2e_F_19e2e.lift.txt; evidence_id (assembly): ev_77d3bca955c8b42218a66fdd956b656399329f65abbc479d114969a4e94d5782)
'RETRAD? @19e2e ?? 22 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 11 instr.): ADD byte ptr [BX + SI], AL; ADC AL, 0x17 ...
L_19e44:   ' entrada vinda de 019ba5_F_19ba5
'RETRAD? @19e44 ?? 33 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 19 instr.): LODSW SI; POP SS ...
L_19e65:
'RETRAD? @19e65 ?? 220 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 97 instr.): SBB byte ptr [BX + SI], AL; ADD byte ptr [DI + 0x18], AH ...
L_19f41:
'RETRAD? @19f41 ?? 96 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 43 instr.): SBB AL, 0x0; ADD byte ptr [DI], AH ...
' ---- F_19fa1 @0x19fa1  (019fa1_F_19fa1.lift.txt; evidence_id (assembly): ev_e174037096745835a6d75b9ef6aa42b5d85a6aab05fecd650756cc419a78153b)
'RETRAD? @19fa1 ?? dado (entre trechos de dado lido como codigo): SBB AX, 0x0   '??
'RETRAD? @19fa4 ?? dado (entre trechos de dado lido como codigo): ADC word ptr [0x0], BX   '??
'RETRAD? @19fa8 ?? 29 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 17 instr.): POP DS; PUSH DS ...
' ---- F_19fc7 @0x19fc7  (019fc7_F_19fc7.lift.txt; evidence_id (assembly): ev_256b3474614550980a9a88d7349cd5a062be6b8c43ce352bed868ee5c57f16cd)
'RETRAD? @19fc7 ?? 42 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 24 instr.): ADD AL, CH; PUSH DS ...
' ---- F_19ff1 @0x19ff1  (019ff1_F_19ff1.lift.txt; evidence_id (assembly): ev_35d37788b175dc184bf1b37a11506eb0b3bde6a540e2df9f5f275175f32ca58b)
'RETRAD? @19ff1 ?? 98 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 43 instr.): POP DS; ADD byte ptr [BX + SI], AL ...
L_1a053:
'RETRAD? @1a053 ?? 110 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 50 instr.): ADD byte ptr [BX], BL; AND AL, byte ptr [BX + SI] ...
L_1a0c1:
'RETRAD? @1a0c1 ?? 69 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 29 instr.): AND AL, 0x0; ADD byte ptr [BX + 0x24], DH ...
' ---- M_FORMAUX @0x20030  (020030_M_FORMAUX.lift.txt; evidence_id (assembly): ev_f14743406d57f773e958d6104117c053882808ffdcd64eb5772fd60a41dd590a)
' @20030 inicio do programa (B$?EVT)
GOTO L_2108b   '@20184
' ---- FUN_2000_108b @0x2108b  (02108b_FUN_2000_108b.lift.txt; evidence_id (assembly): ev_e8cc84bfc94b524314cc73def14b449e0bce82d3536b8c669fca63679bfb7527)
L_2108b:   ' entrada vinda de 020030_M_FORMAUX
GOTO L_22ae4   '@2108b
' ---- FUN_2000_2ae4 @0x22ae4  (022ae4_FUN_2000_2ae4.lift.txt; evidence_id (assembly): ev_0621f54ffe2b388fdb7a08fd9a494d85a322344649eef4d75644135bceed4e1f)
L_22ae4:   ' entrada vinda de 02108b_FUN_2000_108b
GOTO L_239c1   '@22ae4
' ---- FUN_2000_39c1 @0x239c1  (0239c1_FUN_2000_39c1.lift.txt; evidence_id (assembly): ev_bcd0412c73bfa7a5b00d4c78538fbf5b2a19648d5f2feb02103ee8a83b5c21d9)
L_239c1:   ' entrada vinda de 022ae4_FUN_2000_2ae4
GOTO L_25b3c   '@239c1
' ---- FUN_2000_5b3c @0x25b3c  (025b3c_FUN_2000_5b3c.lift.txt; evidence_id (assembly): ev_ed7fa2d016b282c25e84a6b978ee52bb9c5a5116fd6da671b081ae089f7e7585)
L_25b3c:   ' entrada vinda de 0239c1_FUN_2000_39c1
RT_FIM   ' @25b3c B$CENP (inicio/fim do modulo)
'RETRAD? @25b41 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
' ---- M_NOM @0x30030  (030030_M_NOM.lift.txt; evidence_id (assembly): ev_81153431bf0deb8e03f66831fa13b0d20f7561e631c0dd76e30e4c6217ab9826)
' @30030 inicio do programa (B$?EVT)
GOTO L_302f1   '@3003a
' ---- FUN_3000_02f1 @0x302f1  (0302f1_FUN_3000_02f1.lift.txt; evidence_id (assembly): ev_eb2986ee6be1c6bc288686c4e10f69df32210c07c739471b55f06853a0c6896e)
L_302f1:   ' entrada vinda de 030030_M_NOM
RT_FIM   ' @302f1 B$CENP (inicio/fim do modulo)
'RETRAD? @302f6 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Registro de 346 bytes em DS:1A08 (GET/PUT #): campos pelo endereco das variaveis.
SUB RT_REG_1A08_LE (f AS INTEGER, r AS LONG)
    GET #f, r, RG_1A08
    V_1a08% = CVI(MID$(RG_1A08, 1, 2))
    V_1a12! = CVS(MID$(RG_1A08, 11, 4))
    V_1a16! = CVS(MID$(RG_1A08, 15, 4))
    V_1a2a! = CVS(MID$(RG_1A08, 35, 4))
    V_1a2e! = CVS(MID$(RG_1A08, 39, 4))
    V_1a42! = CVS(MID$(RG_1A08, 59, 4))
    V_1a46! = CVS(MID$(RG_1A08, 63, 4))
    V_1a5a! = CVS(MID$(RG_1A08, 83, 4))
    V_1a5e! = CVS(MID$(RG_1A08, 87, 4))
    V_1a72! = CVS(MID$(RG_1A08, 107, 4))
    V_1a76! = CVS(MID$(RG_1A08, 111, 4))
    V_1a8a! = CVS(MID$(RG_1A08, 131, 4))
    V_1a8e! = CVS(MID$(RG_1A08, 135, 4))
    V_1aa2! = CVS(MID$(RG_1A08, 155, 4))
    V_1aa6! = CVS(MID$(RG_1A08, 159, 4))
    V_1aba! = CVS(MID$(RG_1A08, 179, 4))
    V_1abe! = CVS(MID$(RG_1A08, 183, 4))
    V_1ad2! = CVS(MID$(RG_1A08, 203, 4))
    V_1ad6! = CVS(MID$(RG_1A08, 207, 4))
    V_1aea! = CVS(MID$(RG_1A08, 227, 4))
    V_1aee! = CVS(MID$(RG_1A08, 231, 4))
    V_1b02! = CVS(MID$(RG_1A08, 251, 4))
    V_1b06! = CVS(MID$(RG_1A08, 255, 4))
    V_1b1a! = CVS(MID$(RG_1A08, 275, 4))
    V_1b1e! = CVS(MID$(RG_1A08, 279, 4))
    V_1b32! = CVS(MID$(RG_1A08, 299, 4))
    V_1b36! = CVS(MID$(RG_1A08, 303, 4))
    V_1b4a! = CVS(MID$(RG_1A08, 323, 4))
    V_1b4e! = CVS(MID$(RG_1A08, 327, 4))
END SUB
SUB RT_REG_1A08_GRAVA (f AS INTEGER, r AS LONG)
    MID$(RG_1A08, 1, 2) = MKI$(V_1a08%)
    MID$(RG_1A08, 11, 4) = MKS$(V_1a12!)
    MID$(RG_1A08, 15, 4) = MKS$(V_1a16!)
    MID$(RG_1A08, 35, 4) = MKS$(V_1a2a!)
    MID$(RG_1A08, 39, 4) = MKS$(V_1a2e!)
    MID$(RG_1A08, 59, 4) = MKS$(V_1a42!)
    MID$(RG_1A08, 63, 4) = MKS$(V_1a46!)
    MID$(RG_1A08, 83, 4) = MKS$(V_1a5a!)
    MID$(RG_1A08, 87, 4) = MKS$(V_1a5e!)
    MID$(RG_1A08, 107, 4) = MKS$(V_1a72!)
    MID$(RG_1A08, 111, 4) = MKS$(V_1a76!)
    MID$(RG_1A08, 131, 4) = MKS$(V_1a8a!)
    MID$(RG_1A08, 135, 4) = MKS$(V_1a8e!)
    MID$(RG_1A08, 155, 4) = MKS$(V_1aa2!)
    MID$(RG_1A08, 159, 4) = MKS$(V_1aa6!)
    MID$(RG_1A08, 179, 4) = MKS$(V_1aba!)
    MID$(RG_1A08, 183, 4) = MKS$(V_1abe!)
    MID$(RG_1A08, 203, 4) = MKS$(V_1ad2!)
    MID$(RG_1A08, 207, 4) = MKS$(V_1ad6!)
    MID$(RG_1A08, 227, 4) = MKS$(V_1aea!)
    MID$(RG_1A08, 231, 4) = MKS$(V_1aee!)
    MID$(RG_1A08, 251, 4) = MKS$(V_1b02!)
    MID$(RG_1A08, 255, 4) = MKS$(V_1b06!)
    MID$(RG_1A08, 275, 4) = MKS$(V_1b1a!)
    MID$(RG_1A08, 279, 4) = MKS$(V_1b1e!)
    MID$(RG_1A08, 299, 4) = MKS$(V_1b32!)
    MID$(RG_1A08, 303, 4) = MKS$(V_1b36!)
    MID$(RG_1A08, 323, 4) = MKS$(V_1b4a!)
    MID$(RG_1A08, 327, 4) = MKS$(V_1b4e!)
    PUT #f, r, RG_1A08
END SUB

' Registro de 855 bytes em DS:1B66 (GET/PUT #): campos pelo endereco das variaveis.
SUB RT_REG_1B66_LE (f AS INTEGER, r AS LONG)
    GET #f, r, RG_1B66
    V_1b66$ = MID$(RG_1B66, 1, 20)
    V_1b7f% = CVI(MID$(RG_1B66, 26, 2))
    V_1b81% = CVI(MID$(RG_1B66, 28, 2))
    V_1b83% = CVI(MID$(RG_1B66, 30, 2))
    V_1b8d! = CVS(MID$(RG_1B66, 40, 4))
    V_1b91! = CVS(MID$(RG_1B66, 44, 4))
    V_1b99! = CVS(MID$(RG_1B66, 52, 4))
    V_1b9d! = CVS(MID$(RG_1B66, 56, 4))
    V_1ba5! = CVS(MID$(RG_1B66, 64, 4))
    V_1ba9! = CVS(MID$(RG_1B66, 68, 4))
    V_1bb1! = CVS(MID$(RG_1B66, 76, 4))
    V_1bb5! = CVS(MID$(RG_1B66, 80, 4))
    V_1bbd! = CVS(MID$(RG_1B66, 88, 4))
    V_1bc1! = CVS(MID$(RG_1B66, 92, 4))
    V_1bc9! = CVS(MID$(RG_1B66, 100, 4))
    V_1bcd! = CVS(MID$(RG_1B66, 104, 4))
    V_1bd5! = CVS(MID$(RG_1B66, 112, 4))
    V_1bd9! = CVS(MID$(RG_1B66, 116, 4))
    V_1be1! = CVS(MID$(RG_1B66, 124, 4))
    V_1be5! = CVS(MID$(RG_1B66, 128, 4))
    V_1bed! = CVS(MID$(RG_1B66, 136, 4))
    V_1bf1! = CVS(MID$(RG_1B66, 140, 4))
    V_1bf9! = CVS(MID$(RG_1B66, 148, 4))
    V_1bfd! = CVS(MID$(RG_1B66, 152, 4))
    V_1c05! = CVS(MID$(RG_1B66, 160, 4))
    V_1c09! = CVS(MID$(RG_1B66, 164, 4))
    V_1c11! = CVS(MID$(RG_1B66, 172, 4))
    V_1c15! = CVS(MID$(RG_1B66, 176, 4))
    V_1c1d! = CVS(MID$(RG_1B66, 184, 4))
    V_1c21! = CVS(MID$(RG_1B66, 188, 4))
    V_1c29! = CVS(MID$(RG_1B66, 196, 4))
    V_1c2d! = CVS(MID$(RG_1B66, 200, 4))
END SUB
SUB RT_REG_1B66_GRAVA (f AS INTEGER, r AS LONG)
    MID$(RG_1B66, 1, 20) = RT_FIX$(V_1b66$, 20)
    MID$(RG_1B66, 26, 2) = MKI$(V_1b7f%)
    MID$(RG_1B66, 28, 2) = MKI$(V_1b81%)
    MID$(RG_1B66, 30, 2) = MKI$(V_1b83%)
    MID$(RG_1B66, 40, 4) = MKS$(V_1b8d!)
    MID$(RG_1B66, 44, 4) = MKS$(V_1b91!)
    MID$(RG_1B66, 52, 4) = MKS$(V_1b99!)
    MID$(RG_1B66, 56, 4) = MKS$(V_1b9d!)
    MID$(RG_1B66, 64, 4) = MKS$(V_1ba5!)
    MID$(RG_1B66, 68, 4) = MKS$(V_1ba9!)
    MID$(RG_1B66, 76, 4) = MKS$(V_1bb1!)
    MID$(RG_1B66, 80, 4) = MKS$(V_1bb5!)
    MID$(RG_1B66, 88, 4) = MKS$(V_1bbd!)
    MID$(RG_1B66, 92, 4) = MKS$(V_1bc1!)
    MID$(RG_1B66, 100, 4) = MKS$(V_1bc9!)
    MID$(RG_1B66, 104, 4) = MKS$(V_1bcd!)
    MID$(RG_1B66, 112, 4) = MKS$(V_1bd5!)
    MID$(RG_1B66, 116, 4) = MKS$(V_1bd9!)
    MID$(RG_1B66, 124, 4) = MKS$(V_1be1!)
    MID$(RG_1B66, 128, 4) = MKS$(V_1be5!)
    MID$(RG_1B66, 136, 4) = MKS$(V_1bed!)
    MID$(RG_1B66, 140, 4) = MKS$(V_1bf1!)
    MID$(RG_1B66, 148, 4) = MKS$(V_1bf9!)
    MID$(RG_1B66, 152, 4) = MKS$(V_1bfd!)
    MID$(RG_1B66, 160, 4) = MKS$(V_1c05!)
    MID$(RG_1B66, 164, 4) = MKS$(V_1c09!)
    MID$(RG_1B66, 172, 4) = MKS$(V_1c11!)
    MID$(RG_1B66, 176, 4) = MKS$(V_1c15!)
    MID$(RG_1B66, 184, 4) = MKS$(V_1c1d!)
    MID$(RG_1B66, 188, 4) = MKS$(V_1c21!)
    MID$(RG_1B66, 196, 4) = MKS$(V_1c29!)
    MID$(RG_1B66, 200, 4) = MKS$(V_1c2d!)
    PUT #f, r, RG_1B66
END SUB

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    V_1866$ = ""
    V_186a! = 0
    V_186e$ = ""
    V_1872$ = ""
    V_1876$ = ""
    V_187a$ = ""
    V_187e$ = ""
    V_1882$ = ""
    V_1886$ = ""
    V_188a$ = ""
    V_188e$ = ""
    V_1892$ = ""
    V_1896$ = ""
    V_189a$ = ""
    V_189e$ = ""
    V_18a2! = 0
    V_18a6! = 0
    V_18aa! = 0
    V_18ae! = 0
    V_18b2! = 0
    V_18b6! = 0
    V_18ba! = 0
    V_18be! = 0
    V_18c2! = 0
    V_18c6! = 0
    V_18ca! = 0
    V_18ce! = 0
    V_18d2! = 0
    V_18d6! = 0
    V_18da! = 0
    V_18de! = 0
    V_18e2! = 0
    V_18e6$ = ""
    V_18ea! = 0
    V_18ee! = 0
    V_18f2% = 0
    V_18f4! = 0
    V_18f8! = 0
    V_1a04$ = ""
    V_1a08% = 0
    V_1a12! = 0
    V_1a16! = 0
    V_1a2a! = 0
    V_1a2e! = 0
    V_1a42! = 0
    V_1a46! = 0
    V_1a5a! = 0
    V_1a5e! = 0
    V_1a72! = 0
    V_1a76! = 0
    V_1a8a! = 0
    V_1a8e! = 0
    V_1aa2! = 0
    V_1aa6! = 0
    V_1aba! = 0
    V_1abe! = 0
    V_1ad2! = 0
    V_1ad6! = 0
    V_1aea! = 0
    V_1aee! = 0
    V_1b02! = 0
    V_1b06! = 0
    V_1b1a! = 0
    V_1b1e! = 0
    V_1b32! = 0
    V_1b36! = 0
    V_1b4a! = 0
    V_1b4e! = 0
    V_1b62$ = ""
    V_1b66$ = ""
    V_1b7f% = 0
    V_1b81% = 0
    V_1b83% = 0
    V_1b8d! = 0
    V_1b91! = 0
    V_1b99! = 0
    V_1b9d! = 0
    V_1ba5! = 0
    V_1ba9! = 0
    V_1bb1! = 0
    V_1bb5! = 0
    V_1bbd! = 0
    V_1bc1! = 0
    V_1bc9! = 0
    V_1bcd! = 0
    V_1bd5! = 0
    V_1bd9! = 0
    V_1be1! = 0
    V_1be5! = 0
    V_1bed! = 0
    V_1bf1! = 0
    V_1bf9! = 0
    V_1bfd! = 0
    V_1c05! = 0
    V_1c09! = 0
    V_1c11! = 0
    V_1c15! = 0
    V_1c1d! = 0
    V_1c21! = 0
    V_1c29! = 0
    V_1c2d! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_1187c: BEEP; GOSUB L_115a3; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_118a7: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_119af: sai da SUB (BEEP; GOSUB L_115a3; RETURN L_119dd)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H113d8: ON ERROR GOTO L_113d8
        CASE &H11443: ON ERROR GOTO L_11443
        CASE &H11849: ON ERROR GOTO L_11849
        CASE &H11968: ON ERROR GOTO L_11968
        CASE &H15125: ON ERROR GOTO L_15125
        CASE &H15342: ON ERROR GOTO L_15342
        CASE &H15515: ON ERROR GOTO L_15515
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_15539 (P_BP06$)   ' entrada de SUB/FUNCTION (B$ENRA, locais 104 bytes) (0x15539)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP14%
    DIM L_BP18!
    DIM L_BP1c!
    DIM L_BP1e%
    DIM L_BP20%
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP36%
    DIM L_BP38%
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP42%
    DIM L_BP44%
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP4e%
    DIM L_BP50%
    DIM L_BP54!
    DIM L_BP58!
    DIM L_BP5a%
    DIM L_BP5c%
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP66%
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP70%
    DIM L_BP72%
    ' ---- FUN_1000_5539 @0x15539  (015539_FUN_1000_5539.lift.txt; evidence_id (assembly): ev_9476093f69a1126ae1e2d821e3601f7dbaf38f98851f91f2be3da76b1b3df45c)
    L_BP0e! = 0.0   '@15541 DS:1ef2
    L_BP12! = 1.0   '@15552 DS:1ec8
    CALL MIXT_0dbe_GuardaTela(L_BP0e!, L_BP12!, V_0dcc$)   '@1555c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_VIEWPRINT 22, 25   '@1556d
L_15584:
    L_BP14% = (P_BP06$ = "LAJE")   '@15589 DS:22e8
    IF NOT ((P_BP06$ = "T" OR L_BP14%) <> 0) THEN GOTO L_15779   '@155ac DS:2280
    RT_CLS 2   '@155c1
    LOCATE 23, 1   '@155cf
    COLOR RT_CINT%(FX##(V_0dc0!))   '@155ea
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@15607 DS:292c
    COLOR 14   '@15615
    PRINT "  dos arquivos de Lajes (.LAJ)"   '@1562b DS:2954
    COLOR 7   '@15639
    PRINT " *"; V_0e42$;   '@1564f DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@15666
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@15670 DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_156a7   '@1568a
    GOTO L_1577e   '@1569f
L_156a7:
    V_0e10$ = V_0e42$   '@156a7
    GOSUB L_16398   '@156b9
    IF NOT (V_0e18$ = "*") THEN GOTO L_156e5   '@156c6 DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15584   '@156dd
L_156e5:
    V_0e42$ = V_0e18$   '@156e5
    L_BP18! = 1.0   '@156f7 DS:1ec8
    L_BP1c! = 0.0   '@15708 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP18!, L_BP1c!, V_0dcc$)   '@15712
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@15723
    L_BP1e% = (LEN(V_0e42$) > 3)   '@15732
    CHDIR RT_ARQ$(RT_LEFT$((V_0e42$), (LEN(V_0e42$) + L_BP1e%)))   '@15751
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@15765
L_15779:
L_1577e:
    L_BP20% = (P_BP06$ = "VIGA")   '@15783 DS:2358
    IF NOT ((P_BP06$ = "T" OR L_BP20%) <> 0) THEN GOTO L_15973   '@157a6 DS:2280
    RT_CLS 2   '@157bb
    LOCATE 23, 1   '@157c9
    COLOR RT_CINT%(FX##(V_0dc0!))   '@157e4
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@15801 DS:292c
    COLOR 14   '@1580f
    PRINT "  dos arquivos de Vigas (.VIG .SEC .FOR)"   '@15825 DS:2988
    COLOR 7   '@15833
    PRINT " *"; V_0e3e$;   '@15849 DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@15860
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@1586a DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_158a1   '@15884
    GOTO L_15978   '@15899
L_158a1:
    V_0e10$ = V_0e3e$   '@158a1
    GOSUB L_16398   '@158b3
    IF NOT (V_0e18$ = "*") THEN GOTO L_158df   '@158c0 DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1577e   '@158d7
L_158df:
    V_0e3e$ = V_0e18$   '@158df
    L_BP24! = 1.0   '@158f1 DS:1ec8
    L_BP28! = 0.0   '@15902 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP24!, L_BP28!, V_0dcc$)   '@1590c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@1591d
    L_BP2a% = (LEN(V_0e3e$) > 3)   '@1592c
    CHDIR RT_ARQ$(RT_LEFT$((V_0e3e$), (LEN(V_0e3e$) + L_BP2a%)))   '@1594b
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@1595f
L_15973:
L_15978:
    L_BP2c% = (P_BP06$ = "PILAR")   '@1597d DS:23c4
    IF NOT ((P_BP06$ = "T" OR L_BP2c%) <> 0) THEN GOTO L_15b6d   '@159a0 DS:2280
    RT_CLS 2   '@159b5
    LOCATE 23, 1   '@159c3
    COLOR RT_CINT%(FX##(V_0dc0!))   '@159de
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@159fb DS:292c
    COLOR 14   '@15a09
    PRINT "  dos arquivos de Colunas (.COL)"   '@15a1f DS:29b4
    COLOR 7   '@15a2d
    PRINT " *"; V_0e46$;   '@15a43 DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@15a5a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@15a64 DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_15a9b   '@15a7e
    GOTO L_15b72   '@15a93
L_15a9b:
    V_0e10$ = V_0e46$   '@15a9b
    GOSUB L_16398   '@15aad
    IF NOT (V_0e18$ = "*") THEN GOTO L_15ad9   '@15aba DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15978   '@15ad1
L_15ad9:
    V_0e46$ = V_0e18$   '@15ad9
    L_BP30! = 1.0   '@15aeb DS:1ec8
    L_BP34! = 0.0   '@15afc DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP30!, L_BP34!, V_0dcc$)   '@15b06
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@15b17
    L_BP36% = (LEN(V_0e46$) > 3)   '@15b26
    CHDIR RT_ARQ$(RT_LEFT$((V_0e46$), (LEN(V_0e46$) + L_BP36%)))   '@15b45
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@15b59
L_15b6d:
L_15b72:
    L_BP38% = (P_BP06$ = "FORMA")   '@15b77 DS:2486
    IF NOT ((P_BP06$ = "T" OR L_BP38%) <> 0) THEN GOTO L_15d67   '@15b9a DS:2280
    RT_CLS 2   '@15baf
    LOCATE 23, 1   '@15bbd
    COLOR RT_CINT%(FX##(V_0dc0!))   '@15bd8
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@15bf5 DS:292c
    COLOR 14   '@15c03
    PRINT "  dos arquivos de Formas (.FRM)"   '@15c19 DS:29d8
    COLOR 7   '@15c27
    PRINT " *"; V_0e4e$;   '@15c3d DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@15c54
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@15c5e DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_15c95   '@15c78
    GOTO L_15d6c   '@15c8d
L_15c95:
    V_0e10$ = V_0e4e$   '@15c95
    GOSUB L_16398   '@15ca7
    IF NOT (V_0e18$ = "*") THEN GOTO L_15cd3   '@15cb4 DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15978   '@15ccb
L_15cd3:
    V_0e4e$ = V_0e18$   '@15cd3
    L_BP3c! = 1.0   '@15ce5 DS:1ec8
    L_BP40! = 0.0   '@15cf6 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP3c!, L_BP40!, V_0dcc$)   '@15d00
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@15d11
    L_BP42% = (LEN(V_0e4e$) > 3)   '@15d20
    CHDIR RT_ARQ$(RT_LEFT$((V_0e4e$), (LEN(V_0e4e$) + L_BP42%)))   '@15d3f
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@15d53
L_15d67:
L_15d6c:
    L_BP44% = (P_BP06$ = "PARA")   '@15d71 DS:29fc
    IF NOT ((P_BP06$ = "T" OR L_BP44%) <> 0) THEN GOTO L_15f61   '@15d94 DS:2280
    RT_CLS 2   '@15da9
    LOCATE 23, 1   '@15db7
    COLOR RT_CINT%(FX##(V_0dc0!))   '@15dd2
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@15def DS:292c
    COLOR 14   '@15dfd
    PRINT "  dos arquivos de Parametrizacao (.FOP)"   '@15e13 DS:2a04
    COLOR 7   '@15e21
    PRINT " *"; V_0e36$;   '@15e37 DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@15e4e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@15e58 DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_15e8f   '@15e72
    GOTO L_15f66   '@15e87
L_15e8f:
    V_0e10$ = V_0e36$   '@15e8f
    GOSUB L_16398   '@15ea1
    IF NOT (V_0e18$ = "*") THEN GOTO L_15ecd   '@15eae DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15d6c   '@15ec5
L_15ecd:
    V_0e36$ = V_0e18$   '@15ecd
    L_BP48! = 1.0   '@15edf DS:1ec8
    L_BP4c! = 0.0   '@15ef0 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP48!, L_BP4c!, V_0dcc$)   '@15efa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@15f0b
    L_BP4e% = (LEN(V_0e36$) > 3)   '@15f1a
    CHDIR RT_ARQ$(RT_LEFT$((V_0e36$), (LEN(V_0e36$) + L_BP4e%)))   '@15f39
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@15f4d
L_15f61:
L_15f66:
    L_BP50% = (P_BP06$ = "CAD")   '@15f6b DS:2a30
    IF NOT ((P_BP06$ = "T" OR L_BP50%) <> 0) THEN GOTO L_1615b   '@15f8e DS:2280
    RT_CLS 2   '@15fa3
    LOCATE 23, 1   '@15fb1
    COLOR RT_CINT%(FX##(V_0dc0!))   '@15fcc
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@15fe9 DS:292c
    COLOR 14   '@15ff7
    PRINT "  dos arquivos publicos CAD (.DXF)"   '@1600d DS:2a38
    COLOR 7   '@1601b
    PRINT " *"; V_0e4a$;   '@16031 DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@16048
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@16052 DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_16089   '@1606c
    GOTO L_16160   '@16081
L_16089:
    V_0e10$ = V_0e4a$   '@16089
    GOSUB L_16398   '@1609b
    IF NOT (V_0e18$ = "*") THEN GOTO L_160c7   '@160a8 DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15f66   '@160bf
L_160c7:
    V_0e4a$ = V_0e18$   '@160c7
    L_BP54! = 1.0   '@160d9 DS:1ec8
    L_BP58! = 0.0   '@160ea DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP54!, L_BP58!, V_0dcc$)   '@160f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@16105
    L_BP5a% = (LEN(V_0e4a$) > 3)   '@16114
    CHDIR RT_ARQ$(RT_LEFT$((V_0e4a$), (LEN(V_0e4a$) + L_BP5a%)))   '@16133
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@16147
L_1615b:
L_16160:
    L_BP5c% = (P_BP06$ = "CAD")   '@16165 DS:2a30
    IF NOT ((P_BP06$ = "T" OR L_BP5c%) <> 0) THEN GOTO L_16355   '@16188 DS:2280
    RT_CLS 2   '@1619d
    LOCATE 23, 1   '@161ab
    COLOR RT_CINT%(FX##(V_0dc0!))   '@161c6
    PRINT " Drive:\Diretorio\...\Subdiretorio ";   '@161e3 DS:292c
    COLOR 14   '@161f1
    PRINT "  dos arquivos de plotagem (.PLT)"   '@16207 DS:2a5e
    COLOR 7   '@16215
    PRINT " *"; V_0e52$;   '@1622b DS:2976
    CALL MIXT_07f1_LimpaTeclado   '@16242
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "* ", V_0e18$   '@1624c DS:297c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e18$) = 0) THEN GOTO L_16283   '@16266
    GOTO L_1635a   '@1627b
L_16283:
    V_0e10$ = V_0e52$   '@16283
    GOSUB L_16398   '@16295
    IF NOT (V_0e18$ = "*") THEN GOTO L_162c1   '@162a2 DS:2982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16160   '@162b9
L_162c1:
    V_0e52$ = V_0e18$   '@162c1
    L_BP60! = 1.0   '@162d3 DS:1ec8
    L_BP64! = 0.0   '@162e4 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP60!, L_BP64!, V_0dcc$)   '@162ee
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ON ERROR GOTO L_15125
    RT_ONERR = &H15125   '@162ff
    L_BP66% = (LEN(V_0e52$) > 3)   '@1630e
    CHDIR RT_ARQ$(RT_LEFT$((V_0e52$), (LEN(V_0e52$) + L_BP66%)))   '@1632d
    ON ERROR GOTO L_11849
    RT_ONERR = &H11849   '@16341
L_16355:
L_1635a:
    L_BP6a! = 1.0   '@1635f DS:1ec8
    L_BP6e! = 0.0   '@16370 DS:1ef2
    CALL MIXT_0dbe_GuardaTela(L_BP6a!, L_BP6e!, V_0dcc$)   '@1637a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    GOTO L_16548   '@1638b
    ' ---- F_16393 @0x16393  (016393_F_16393.lift.txt; evidence_id (assembly): ev_38d7d63956c217c4cd4a779f2d7f707bf40eb8c308420fe113762172f151bc02)
L_16398:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015539_FUN_1000_5539
    IF NOT (VAL(V_0e18$) <> 0.0#) THEN GOTO L_163dd   '@1639d DS:22e0
    V_0e18$ = "*"   '@163c1 DS:2982
    RETURN   '@163d3
L_163dd:
    IF NOT (LEN(V_0e18$) = 1) THEN GOTO L_1640f   '@163dd
    V_0e18$ = V_0e18$ + ":\"   '@163f3 DS:1f34
L_1640f:
    L_BP70% = (LEN(V_0e18$) = 2)   '@1640f
    IF NOT ((RT_MID$((V_0e18$), (2), (1)) = ":" AND L_BP70%) <> 0) THEN GOTO L_16470   '@16435 DS:2a84
    V_0e18$ = V_0e18$ + "\"   '@16454 DS:2a8a
L_16470:
    L_BP72% = (INSTR(V_0e18$, ":\") = 0)   '@16470 DS:1f34
    IF NOT ((RT_MID$((V_0e18$), (1), (1)) <> "\" AND L_BP72%) <> 0) THEN GOTO L_164d1   '@16496 DS:2a8a
    V_0e18$ = V_0e10$ + V_0e18$   '@164b5
L_164d1:
    IF NOT (RT_RIGHT$((V_0e18$), (1)) <> "\") THEN GOTO L_1650e   '@164d1 DS:2a8a
    V_0e18$ = V_0e18$ + "\"   '@164f2 DS:2a8a
L_1650e:
    IF NOT (INSTR(V_0e18$, ":\") = 0) THEN GOTO L_16539   '@1650e DS:1f34
    V_0e18$ = "*"   '@16527 DS:2982
L_16539:
    RETURN   '@16539
L_16548:   ' entrada vinda de 015539_FUN_1000_5539
    ' END SUB   '@16548
END SUB

SUB S_16558   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x16558)
    ' ---- FUN_1000_6558 @0x16558  (016558_FUN_1000_6558.lift.txt; evidence_id (assembly): ev_811232a41162960412bd8e6740ee4f8f5b945e232a44a0d3ba98ace679640655)
    BEEP   '@16560
    BEEP   '@1656a
    BEEP   '@16574
    RT_SCREEN 0   '@1657e
    RT_VIEWPRINT 1, 25   '@16593
    RT_CLOSE   '@165a5 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@165b2 DS:1f18
    RT_CLS 0   '@165f7
    LOCATE 10, 1   '@16604
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1661f DS:1ec0,2a90
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@1663f DS:1ec0,2aaa
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@1665f DS:1ec0,2ad6
L_16684:
    CALL MIXT_07f1_LimpaTeclado   '@16689
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@16693
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@166af
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16684   '@166b9
END SUB

SUB S_166d5   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x166d5)
    ' ---- FUN_1000_66d5 @0x166d5  (0166d5_FUN_1000_66d5.lift.txt; evidence_id (assembly): ev_9d4e3c0fa4cd357c10f1ca38cad0b014a3e1e0d35c3f49a9bf599e75f28f4552)
    ' END SUB   '@166dd
END SUB

SUB S_166f2   ' entrada de SUB/FUNCTION (B$ENRA, locais 108 bytes) (0x166f2)
    DIM L_BP0c%
    DIM L_BP0e%
    DIM L_BP12%
    DIM L_BP14%
    DIM L_BP16%
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46$
    DIM L_BP4a$
    DIM L_BP4e!
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62$
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e$
    DIM L_BP70%
    DIM L_BP74!
    DIM L_BP76%
    ' ---- FUN_1000_66f2 @0x166f2  (0166f2_FUN_1000_66f2.lift.txt; evidence_id (assembly): ev_ec014ae2511cf5c2f3d0bde5e1eaa64fff88c426a21faeff1acce25d491192f1)
    RT_VIEWPRINT 1, 25   '@16709
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1671b
    RT_CLS 2   '@16747
    PRINT RT_STRINGC$((80), (205));   '@16755
    PRINT " Vinculo entre os Elementos Estruturais"   '@1676d DS:2afc
    PRINT " Painel de Lajes "; V_0e2a$; RT_TAB$(30); ""; "Vigas "; V_0e26$; RT_TAB$(50); ""; "Colunas "; V_0e2e$   '@1677b DS:1ec0,2b28,2b3e,2b48
    PRINT RT_STRINGC$((80), (205));   '@167da
    REDIM A_157e%(-32768 TO -32768)   '@167f2
    REDIM A_157e%(0 TO A_1044%(0, 0))   '@16800
    A_157e%(0) = A_1044%(0, 0)   '@16827
    L_BP1e! = A_157e%(0)   '@16853
    FOR V_11b8! = 1.0 TO L_BP1e!   '@16876 DS:1ec8
    L_BP22! = A_1200!(0, 0, 0)   '@1687e
    CALL MIXT_0877_Menor(V_11b8!, L_BP22!, L_BP26!)   '@1689e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1200!(0, 0, 0) = L_BP22!   '@168b0
    A_157e%(RT_CINT%(FX##(V_11b8!))) = RT_CINT%(FX##(L_BP26!))   '@168cb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@168f1 DS:1ec8
    REDIM A_15ac%(-32768 TO -32768)   '@1691c
    REDIM A_15ac%(0 TO CINT(A_0fe8!(0, 0) + 1.0))   '@1692a DS:1ec8
    V_11b8! = 1.0   '@16960 DS:1ec8
    L_BP2a! = A_0fe8!(0, 0)   '@16971
    FOR V_11bc! = 2.0 TO L_BP2a!   '@16991 DS:1ec8,1ee4
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11bc!))) <> A_0fba$(RT_CINT%(FX##(V_11bc!) - 1.0))) THEN GOTO L_169f2   '@16998 DS:2b54
    V_11b8! = FX##(V_11b8!) + 1.0   '@169dc DS:1ec8
L_169f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@169f2 DS:1ec8
    A_15ac%(0) = RT_CINT%(FX##(V_11b8!))   '@16a1d
    L_BP2e! = A_15ac%(0)   '@16a42
    FOR V_11b8! = 1.0 TO L_BP2e!   '@16a65 DS:1ec8
    IF NOT (V_11b8! = 1.0) THEN GOTO L_16aa0   '@16a6c DS:1ec8
    V_11cc! = 1.0   '@16a87 DS:1ec8
    GOTO L_16b63   '@16a98
L_16aa0:
    L_BP32! = 1.0   '@16aa0 DS:1ec8
    V_11cc! = 2.0   '@16ab0 DS:1ee4
L_16ac6:
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11cc!) - 1.0)) <> A_0fba$(RT_CINT%(FX##(V_11cc!)))) THEN GOTO L_16b1e   '@16ac6 DS:2b54
    L_BP32! = FX##(L_BP32!) + 1.0   '@16b0a DS:1ec8
L_16b1e:
    IF NOT (L_BP32! = V_11b8!) THEN GOTO L_16b40   '@16b1e
    GOTO L_16b5e   '@16b38
L_16b40:
    V_11cc! = FX##(V_11cc!) + 1.0   '@16b40 DS:1ec8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16ac6   '@16b56
L_16b5e:
L_16b63:
    L_BP36! = V_139e%   '@16b63
    FOR V_11bc! = 1.0 TO L_BP36!   '@16b77 DS:1ec8
    IF NOT (RT_INSTR%((1), (A_143a$(RT_CINT%(FX##(V_11bc!)))), (A_0fba$(RT_CINT%(FX##(V_11cc!))))) > 0) THEN GOTO L_16bfd   '@16b7e
    A_15ac%(RT_CINT%(FX##(V_11b8!))) = RT_CINT%(FX##(V_11bc!))   '@16bc3
    GOTO L_16c28   '@16bf0
L_16bfd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@16bfd DS:1ec8
L_16c28:
    IF NOT (V_139e% < V_11bc!) THEN GOTO L_16c67   '@16c28
    A_15ac%(RT_CINT%(FX##(V_11b8!))) = -1   '@16c46
L_16c67:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@16c67 DS:1ec8
    A_15ac%(RT_CINT%(FX##(A_0fe8!(0, 0)) + 1.0)) = A_140c%(1, 0)   '@16c92 DS:1ec8
    L_BP3a! = V_139e%   '@16cdb
    FOR V_11b8! = 2.0 TO L_BP3a!   '@16cef DS:1ec8,1ee4
    IF NOT (A_140c%(RT_CINT%(FX##(V_11b8!)), 0) < A_15ac%(RT_CINT%(FX##(A_0fe8!(0, 0)) + 1.0))) THEN GOTO L_16d9d   '@16cf6 DS:1ec8
    A_15ac%(RT_CINT%(FX##(A_0fe8!(0, 0)) + 1.0)) = A_140c%(RT_CINT%(FX##(V_11b8!)), 0)   '@16d4d DS:1ec8
L_16d9d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@16d9d DS:1ec8
L_16dcd:   ' entrada vinda de 017768_F_17768
    RT_VIEWPRINT 6, 25   '@16dd2
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@16de4
    RT_CLS 2   '@16e09
    COLOR 14   '@16e17
    PRINT "  Viga do Painel     Viga Correspondente        Tramos    Secao"   '@16e2d DS:2b58
    LOCATE 23, 1   '@16e3b
    COLOR RT_CINT%(FX##(V_0dc0!))   '@16e56
    PRINT "    "; CHR$(24); CHR$(25);   '@16e73 DS:2b9c
    COLOR 3   '@16e9f
    PRINT " Proxima Viga        ";   '@16eb5 DS:2ba4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@16ec3
    PRINT CHR$(27); CHR$(26);   '@16ee0
    COLOR 3   '@16f03
    PRINT " Altera Viga Correspondente       <";   '@16f19 DS:2bbe
    COLOR RT_CINT%(FX##(V_0dc0!))   '@16f27
    PRINT "*";   '@16f44 DS:2982
    COLOR 3   '@16f52
    PRINT "> Elimina "   '@16f68 DS:2be6
    COLOR 3   '@16f76
    PRINT "    <";   '@16f8c DS:2bf4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@16f9a
    PRINT "F";   '@16fb7 DS:2bfe
    COLOR 3   '@16fc5
    PRINT ">im  aceita correspondencia       <";   '@16fdb DS:2c04
    COLOR RT_CINT%(FX##(V_0dc0!))   '@16fe9
    PRINT "R";   '@17006 DS:2c2c
    COLOR 3   '@17014
    PRINT ">etorna a escolha dos arquivos "   '@1702a DS:2c32
    L_BP0c% = 1   '@17038
    L_BP0e% = 1   '@17042
L_17052:
    GOSUB L_170ac   '@17052
    GOSUB L_17e19   '@1705f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "NAO" THEN GOTO L_17052   '@1706c DS:2c56
    IF NOT (V_0e0c$ = "RETORNA") THEN GOTO L_1709f   '@17080 DS:247a
    GOTO L_1995f   '@17097
L_1709f:
    GOTO L_17e2d   '@1709f
    ' ---- F_170a7 @0x170a7  (0170a7_F_170a7.lift.txt; evidence_id (assembly): ev_69f5bf6ce6b22989e6a9e108ddfa8fbefc3921cf16dc1512f3613997e06ba5f4)
L_170ac:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0166f2_FUN_1000_66f2
    IF NOT (L_BP0c% + 13 > A_157e%(0)) THEN GOTO L_17104   '@170b1
    V_11cc! = A_157e%(0)   '@170d9
    GOTO L_1711b   '@170fc
L_17104:
    V_11cc! = L_BP0c% + 13   '@17104
L_1711b:
    L_BP3e! = V_11cc!   '@1711b
    FOR L_BP32! = L_BP0c% TO L_BP3e!   '@1712b DS:1ec8
    GOSUB L_1776d   '@17136
    GOSUB L_17872   '@17143
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@17150 DS:1ec8
    IF NOT (L_BP0c% + 13 > V_11cc!) THEN GOTO L_17251   '@17175
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@17196
    L_BP42! = L_BP0c% + 12   '@171bb
    FOR L_BP32! = FX##(V_11cc!) + 1.0 TO L_BP42!   '@171d2 DS:1ec8
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP0c% + 8.0), 1   '@171de DS:25f6
    PRINT RT_STRINGC$((80), (32));   '@1720f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@17227 DS:1ec8
L_17251:
L_17256:
    V_0e0c$ = ""   '@17256 DS:1ec0
L_1726e:
    V_0e0c$ = RT_INKEY$   '@1726e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_1726e   '@17282 DS:1ec0
    L_BP46$ = V_0e0c$   '@17296
    IF NOT (L_BP46$ <> "8") THEN GOTO L_172e6   '@172a8 DS:2c5e
    IF NOT (CHR$(0) + CHR$(72) = L_BP46$) THEN GOTO L_17391   '@172bf
L_172e6:
    IF NOT (L_BP0e% > 1) THEN GOTO L_17389   '@172e6
    L_BP0e% = L_BP0e% - 1   '@172f4
    IF NOT (L_BP0c% > L_BP0e%) THEN GOTO L_17324   '@172fc
    L_BP0c% = L_BP0c% - 1   '@1730c
    GOTO L_17760   '@17314
L_17324:
    L_BP32! = L_BP0e% + 1   '@17324
    GOSUB L_1776d   '@17338
    GOSUB L_17872   '@17345
    L_BP32! = L_BP0e%   '@17352
    GOSUB L_1776d   '@17365
    GOSUB L_17872   '@17372
L_17389:
    GOTO L_17757   '@17389
L_17391:
    IF NOT (L_BP46$ <> "2") THEN GOTO L_173ca   '@17391 DS:2224
    IF NOT (CHR$(0) + CHR$(80) = L_BP46$) THEN GOTO L_17489   '@173a3
L_173ca:
    IF NOT (A_157e%(0) > L_BP0e%) THEN GOTO L_17481   '@173ca
    L_BP0e% = L_BP0e% + 1   '@173e9
    IF NOT (L_BP0c% + 13 < L_BP0e%) THEN GOTO L_1741c   '@173f1
    L_BP0c% = L_BP0c% + 1   '@17404
    GOTO L_17760   '@1740c
L_1741c:
    L_BP32! = L_BP0e% - 1   '@1741c
    GOSUB L_1776d   '@17430
    GOSUB L_17872   '@1743d
    L_BP32! = L_BP0e%   '@1744a
    GOSUB L_1776d   '@1745d
    GOSUB L_17872   '@1746a
L_17481:
    GOTO L_17757   '@17481
L_17489:
    IF NOT (L_BP46$ <> "4") THEN GOTO L_174c2   '@17489 DS:2252
    IF NOT (CHR$(0) + CHR$(75) = L_BP46$) THEN GOTO L_17534   '@1749b
L_174c2:
    IF NOT (A_157e%(L_BP0e%) > 1) THEN GOTO L_1752c   '@174c2
    A_157e%(L_BP0e%) = A_157e%(L_BP0e%) - 1   '@174e0
    L_BP32! = L_BP0e%   '@17507
    GOSUB L_17872   '@1751a
L_1752c:
    GOTO L_17757   '@1752c
L_17534:
    IF NOT (L_BP46$ <> "6") THEN GOTO L_1756d   '@17534 DS:2274
    IF NOT (CHR$(0) + CHR$(77) = L_BP46$) THEN GOTO L_17661   '@17546
L_1756d:
    IF NOT (A_157e%(L_BP0e%) = -1) THEN GOTO L_175cb   '@1756d
    A_157e%(L_BP0e%) = 1   '@1758c
    L_BP32! = L_BP0e%   '@175a3
    GOSUB L_17872   '@175b6
    GOTO L_17659   '@175c3
L_175cb:
    IF NOT (A_157e%(L_BP0e%) < A_1200!(0, 0, 0)) THEN GOTO L_17654   '@175cb
    A_157e%(L_BP0e%) = A_157e%(L_BP0e%) + 1   '@17608
    L_BP32! = L_BP0e%   '@1762f
    GOSUB L_17872   '@17642
L_17654:
L_17659:
    GOTO L_17757   '@17659
L_17661:
    IF NOT (L_BP46$ = "*") THEN GOTO L_176b4   '@17661 DS:2982
    A_157e%(L_BP0e%) = -1   '@17673
    L_BP32! = L_BP0e%   '@1768c
    GOSUB L_17872   '@1769f
    GOTO L_17757   '@176ac
L_176b4:
    IF NOT (L_BP46$ <> "F") THEN GOTO L_176d8   '@176b4 DS:2bfe
    IF NOT (L_BP46$ = "f") THEN GOTO L_176fc   '@176c6 DS:2c64
L_176d8:
    V_0e0c$ = ""   '@176d8 DS:1ec0
    RETURN   '@176ea
    ' @176f4 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_17757   '@176f4
L_176fc:
    IF NOT (L_BP46$ <> "R") THEN GOTO L_17720   '@176fc DS:2c2c
    IF NOT (L_BP46$ = "r") THEN GOTO L_17752   '@1770e DS:2c6a
L_17720:
    V_0e0c$ = "RETORNA"   '@17720 DS:247a
    RT_CLS 2   '@17732
    RETURN   '@17740
    ' @1774a (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_17757   '@1774a
L_17752:
L_17757:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17256   '@17757
L_17760:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_170ac   '@17760
    ' ---- F_17768 @0x17768  (017768_F_17768.lift.txt; evidence_id (assembly): ev_64a6754cd4b759c2afde8dd6de6eeca9e335f98837c78da872fa6eed03e7dbba)
L_1776d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0170a7_F_170a7
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@17772
    IF NOT (L_BP0e% = L_BP32!) THEN GOTO L_177d1   '@17797
    COLOR 0, 7   '@177b4
L_177d1:
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP0c% + 8.0), 5   '@177d1 DS:25f6
    PRINT USING " \      \"; V_0e74$ + LTRIM$(RT_STR8$(RT_DBL#(FX##(V_0e70!) + VAL(A_1016$(RT_CINT%(FX##(L_BP32!)))))));   '@17805 DS:2c70
    RETURN   '@17863
L_17872:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0170a7_F_170a7
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@17877
    IF NOT (L_BP0e% = L_BP32!) THEN GOTO L_178d7   '@1789c
    COLOR 14, 7   '@178b9
L_178d7:
    IF NOT (A_157e%(RT_CINT%(FX##(L_BP32!))) <> -1) THEN GOTO L_17d6d   '@178d7
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 14, 0) <> -1.0) THEN GOTO L_17d0b   '@178fd DS:2b54
    L_BP4a$ = ""   '@17943 DS:1ec0
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 0, 1) <> 0.0 AND A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 0, 0) <> 0.0) THEN GOTO L_17a86   '@17955 DS:1ef2
    L_BP4a$ = LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 0, 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 0, 1)))   '@179e8 DS:2c7e
L_17a86:
    V_11a4! = 1.0   '@17a86 DS:1ec8
L_17a9c:
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), RT_CINT%(FX##(V_11a4!)), 1) <> 0.0 AND A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), RT_CINT%(FX##(V_11a4!)), 0) <> 0.0) THEN GOTO L_17c60   '@17a9c DS:1ef2
    V_0e10$ = LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), RT_CINT%(FX##(V_11a4!)), 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), RT_CINT%(FX##(V_11a4!)), 1)))   '@17b41 DS:2c7e
    IF NOT (RT_INSTR%((1), (L_BP4a$), (V_0e10$)) = 0) THEN GOTO L_17c5b   '@17bec
    IF NOT (LEN(L_BP4a$) > 0) THEN GOTO L_17c3a   '@17c09
    L_BP4a$ = L_BP4a$ + "/"   '@17c1e DS:2c84
L_17c3a:
    L_BP4a$ = L_BP4a$ + V_0e10$   '@17c3a
L_17c5b:
L_17c60:
    V_11a4! = FX##(V_11a4!) + 1.0   '@17c60 DS:1ec8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 14, 0) < V_11a4!) THEN GOTO L_17a9c   '@17c76
    V_0e0c$ = STR$(A_1200!(A_157e%(RT_CINT%(FX##(L_BP32!))), 14, 0))   '@17cbc
    GOTO L_17d34   '@17d03
L_17d0b:
    L_BP4a$ = "SECAO NAO DEFINIDA"   '@17d0b DS:2c8a
    V_0e0c$ = ""   '@17d1d DS:1ec0
L_17d34:
    V_0e10$ = A_122e$(A_157e%(RT_CINT%(FX##(L_BP32!))))   '@17d34
    GOTO L_17da8   '@17d65
L_17d6d:
    L_BP4a$ = ""   '@17d6d DS:1ec0
    V_0e10$ = "VIGA ELIMINADA DA FORMA"   '@17d7f DS:2ca0
    V_0e0c$ = ""   '@17d91 DS:1ec0
L_17da8:
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP0c% + 8.0), 22   '@17da8 DS:25f6
    PRINT USING " \                      \    \    \  \                  \"; V_0e10$; V_0e0c$; L_BP4a$;   '@17ddc DS:2cbc
    RETURN   '@17e0a
L_17e19:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0166f2_FUN_1000_66f2
    RETURN   '@17e1e
L_17e2d:   ' entrada vinda de 0166f2_FUN_1000_66f2, 0184be_F_184be
    RT_VIEWPRINT 6, 25   '@17e32
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@17e44
    RT_CLS 2   '@17e69
    GOSUB L_17eb0   '@17e77
    IF NOT (V_0e0c$ = "RETORNA") THEN GOTO L_17ea3   '@17e84 DS:247a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16dcd   '@17e9b
L_17ea3:
    GOTO L_185b8   '@17ea3
    ' ---- F_17eab @0x17eab  (017eab_F_17eab.lift.txt; evidence_id (assembly): ev_ffaf17d111a9f9842040d03cbef9c755c06a47607efa54067a20623481d35758)
L_17eb0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 017768_F_17768
    PRINT " Escolha o Nivel referente as secoes das Colunas"   '@17eb5 DS:2cfa
    LOCATE 23, 1   '@17ec3
    COLOR RT_CINT%(FX##(V_0dc0!))   '@17ede
    PRINT "    "; CHR$(24); CHR$(25);   '@17efb DS:2b9c
    COLOR 3   '@17f27
    PRINT " Seleciona proximo Nivel              <";   '@17f3d DS:2d2e
    COLOR RT_CINT%(FX##(V_0dc0!))   '@17f4b
    PRINT "F";   '@17f68 DS:2bfe
    COLOR 3   '@17f76
    PRINT ">im aceita nivel escolhido"   '@17f8c DS:2d5a
    PRINT "    <";   '@17f9a DS:2bf4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@17fa8
    PRINT "R";   '@17fc5 DS:2c2c
    COLOR 3   '@17fd3
    PRINT ">etorna a correspondencia das vigas ";   '@17fe9 DS:2d78
    L_BP16% = A_15ac%(RT_CINT%(FX##(A_0fe8!(0, 0)) + 1.0))   '@17ff7 DS:1ec8
    L_BP4e! = L_BP16% - 5   '@1802d
    L_BP52! = 1.0   '@18044 DS:1ec8
    CALL MIXT_082a_Maior(L_BP4e!, L_BP52!, L_BP56!)   '@1804e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12% = RT_CINT%(FX##(L_BP56!))   '@18060
L_18070:
    L_BP14% = L_BP12% + 11   '@18075
    IF NOT (L_BP14% > A_13b0!(0)) THEN GOTO L_180cf   '@18083
    L_BP14% = RT_CINT%(FX##(A_13b0!(0)))   '@180af
L_180cf:
    L_BP5a! = L_BP14%   '@180cf
    FOR L_BP32! = L_BP12% TO L_BP5a!   '@180e2 DS:1ec8
    GOSUB L_184c3   '@180ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@180fb DS:1ec8
    IF NOT (20 - L_BP14% + L_BP12% > 8) THEN GOTO L_181e2   '@18120
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@18136
    L_BP5e! = 19 - L_BP14% + L_BP12%   '@1815b
    FOR L_BP32! = 8.0 TO L_BP5e!   '@18175 DS:1ec8,25f6
    LOCATE RT_CINT%(FX##(L_BP32!)), 5   '@1817c
    PRINT RT_STRINGC$((50), (32))   '@181a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@181b8 DS:1ec8
L_181e2:
L_181e8:
    V_0e0c$ = ""   '@181e8 DS:1ec0
L_18200:
    V_0e0c$ = RT_INKEY$   '@18200
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_18200   '@18214 DS:1ec0
    L_BP62$ = V_0e0c$   '@18228
    IF NOT (L_BP62$ <> "8") THEN GOTO L_18278   '@1823a DS:2c5e
    IF NOT (CHR$(0) + CHR$(72) = L_BP62$) THEN GOTO L_18327   '@18251
L_18278:
    IF NOT (L_BP16% < A_13b0!(0)) THEN GOTO L_1831f   '@18278
    L_BP16% = L_BP16% + 1   '@182a4
    IF NOT (L_BP14% < L_BP16%) THEN GOTO L_182d4   '@182ac
    L_BP12% = L_BP12% + 1   '@182bc
    GOTO L_184b6   '@182c4
L_182d4:
    L_BP32! = L_BP16% - 1   '@182d4
    GOSUB L_184c3   '@182e8
    L_BP32! = L_BP16%   '@182f5
    GOSUB L_184c3   '@18308
L_1831f:
    GOTO L_184ae   '@1831f
L_18327:
    IF NOT (L_BP62$ <> "2") THEN GOTO L_18360   '@18327 DS:2224
    IF NOT (CHR$(0) + CHR$(80) = L_BP62$) THEN GOTO L_183f1   '@18339
L_18360:
    IF NOT (L_BP16% > 1) THEN GOTO L_183e9   '@18360
    L_BP16% = L_BP16% - 1   '@1836e
    IF NOT (L_BP12% > L_BP16%) THEN GOTO L_1839e   '@18376
    L_BP12% = L_BP12% - 1   '@18386
    GOTO L_184b6   '@1838e
L_1839e:
    L_BP32! = L_BP16% + 1   '@1839e
    GOSUB L_184c3   '@183b2
    L_BP32! = L_BP16%   '@183bf
    GOSUB L_184c3   '@183d2
L_183e9:
    GOTO L_184ae   '@183e9
L_183f1:
    IF NOT (L_BP62$ <> "F") THEN GOTO L_18415   '@183f1 DS:2bfe
    IF NOT (L_BP62$ = "f") THEN GOTO L_18461   '@18403 DS:2c64
L_18415:
    V_0e0c$ = ""   '@18415 DS:1ec0
    A_15ac%(A_15ac%(0) + 1) = L_BP16%   '@18427
    RETURN   '@1844f
    ' @18459 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_184ae   '@18459
L_18461:
    IF NOT (L_BP62$ <> "R") THEN GOTO L_18485   '@18461 DS:2c2c
    IF NOT (L_BP62$ = "r") THEN GOTO L_184a9   '@18473 DS:2c6a
L_18485:
    V_0e0c$ = "RETORNA"   '@18485 DS:247a
    RETURN   '@18497
    ' @184a1 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_184ae   '@184a1
L_184a9:
L_184ae:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_181e8   '@184ae
L_184b6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_18070   '@184b6
    ' ---- F_184be @0x184be  (0184be_F_184be.lift.txt; evidence_id (assembly): ev_105e6ef468eadc127331635c368bdbf920ddbbbf4dca8270c999a994e1be39ef)
L_184c3:   ' sub-rotina (alvo de GOSUB); entrada vinda de 017eab_F_17eab
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@184c8
    IF NOT (L_BP16% = L_BP32!) THEN GOTO L_18527   '@184ed
    COLOR 0, 7   '@1850a
L_18527:
    LOCATE RT_CINT%(FX##(L_BP12%) - L_BP32! + 20.0), 5   '@18527 DS:2da0
    PRINT USING " \            \    ####.### "; A_13de$(RT_CINT%(FX##(L_BP32!))); RT_PU#(A_13b0!(RT_CINT%(FX##(L_BP32!))), " \            \    ####.### ", 1);   '@18558 DS:2da4
    RETURN   '@185a9
L_185b8:   ' entrada vinda de 017768_F_17768
    RT_VIEWPRINT 6, 25   '@185bd
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@185cf
    RT_CLS 2   '@185f4
    COLOR 14   '@18602
    PRINT "  Pilar do Painel    Pilar Correspondente       Secao";   '@18618 DS:2dc4
    PRINT "    Nivel "; A_13de$(A_15ac%(A_15ac%(0) + 1))   '@18626 DS:2dfe
    LOCATE 23, 1   '@18663
    COLOR RT_CINT%(FX##(V_0dc0!))   '@1867e
    PRINT "    "; CHR$(24); CHR$(25);   '@1869b DS:2b9c
    COLOR 3   '@186c7
    PRINT " Proximo Pilar       ";   '@186dd DS:2e0c
    COLOR RT_CINT%(FX##(V_0dc0!))   '@186eb
    PRINT CHR$(27); CHR$(26);   '@18708
    COLOR 3   '@1872b
    PRINT " Altera Pilar Correspondente      <";   '@18741 DS:2e26
    COLOR RT_CINT%(FX##(V_0dc0!))   '@1874f
    PRINT "*";   '@1876c DS:2982
    COLOR 3   '@1877a
    PRINT "> Elimina "   '@18790 DS:2be6
    COLOR 3   '@1879e
    PRINT "    <";   '@187b4 DS:2bf4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@187c2
    PRINT "F";   '@187df DS:2bfe
    COLOR 3   '@187ed
    PRINT ">im  aceita correspondencia       <";   '@18803 DS:2c04
    COLOR RT_CINT%(FX##(V_0dc0!))   '@18811
    PRINT "R";   '@1882e DS:2c2c
    COLOR 3   '@1883c
    PRINT ">etorna a escolha do nivel "   '@18852 DS:2e4e
    L_BP18% = 1   '@18860
    L_BP1a% = 1   '@1886a
    GOSUB L_188eb   '@18874
    IF NOT (V_0e0c$ = "RETORNA") THEN GOTO L_188a0   '@18881 DS:247a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17e2d   '@18898
L_188a0:
    GOSUB L_19703   '@188a0
    IF NOT (V_0e0c$ = "NAO") THEN GOTO L_188cc   '@188ad DS:2c56
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_185b8   '@188c4
L_188cc:
    V_0e0c$ = ""   '@188cc DS:1ec0
    GOTO L_1995f   '@188de
    ' ---- F_188e6 @0x188e6  (0188e6_F_188e6.lift.txt; evidence_id (assembly): ev_e31b469ff959ab545ba28fac3827f7ead85e36dda5a1fe737eb2587ec1c2d726)
L_188eb:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0184be_F_184be
    IF NOT (L_BP18% + 13 > A_15ac%(0)) THEN GOTO L_18943   '@188f0
    V_11cc! = A_15ac%(0)   '@18918
    GOTO L_1895a   '@1893b
L_18943:
    V_11cc! = L_BP18% + 13   '@18943
L_1895a:
    L_BP66! = V_11cc!   '@1895a
    FOR L_BP32! = L_BP18% TO L_BP66!   '@1896a DS:1ec8
    GOSUB L_18f81   '@18976
    GOSUB L_191d2   '@18983
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@18990 DS:1ec8
    IF NOT (L_BP18% + 13 > V_11cc!) THEN GOTO L_18a91   '@189b5
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@189d6
    L_BP6a! = L_BP18% + 12   '@189fb
    FOR L_BP32! = FX##(V_11cc!) + 1.0 TO L_BP6a!   '@18a12 DS:1ec8
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP18% + 8.0), 1   '@18a1e DS:25f6
    PRINT RT_STRINGC$((80), (32));   '@18a4f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP32!   '@18a67 DS:1ec8
L_18a91:
L_18a96:
    V_0e0c$ = ""   '@18a96 DS:1ec0
L_18aae:
    V_0e0c$ = RT_INKEY$   '@18aae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_18aae   '@18ac2 DS:1ec0
    L_BP6e$ = V_0e0c$   '@18ad6
    IF NOT (L_BP6e$ <> "8") THEN GOTO L_18b26   '@18ae8 DS:2c5e
    IF NOT (CHR$(0) + CHR$(72) = L_BP6e$) THEN GOTO L_18bd1   '@18aff
L_18b26:
    IF NOT (L_BP1a% > 1) THEN GOTO L_18bc9   '@18b26
    L_BP1a% = L_BP1a% - 1   '@18b34
    IF NOT (L_BP18% > L_BP1a%) THEN GOTO L_18b64   '@18b3c
    L_BP18% = L_BP18% - 1   '@18b4c
    GOTO L_18f74   '@18b54
L_18b64:
    L_BP32! = L_BP1a% + 1   '@18b64
    GOSUB L_18f81   '@18b78
    GOSUB L_191d2   '@18b85
    L_BP32! = L_BP1a%   '@18b92
    GOSUB L_18f81   '@18ba5
    GOSUB L_191d2   '@18bb2
L_18bc9:
    GOTO L_18f6c   '@18bc9
L_18bd1:
    IF NOT (L_BP6e$ <> "2") THEN GOTO L_18c0a   '@18bd1 DS:2224
    IF NOT (CHR$(0) + CHR$(80) = L_BP6e$) THEN GOTO L_18cc9   '@18be3
L_18c0a:
    IF NOT (A_15ac%(0) > L_BP1a%) THEN GOTO L_18cc1   '@18c0a
    L_BP1a% = L_BP1a% + 1   '@18c29
    IF NOT (L_BP18% + 13 < L_BP1a%) THEN GOTO L_18c5c   '@18c31
    L_BP18% = L_BP18% + 1   '@18c44
    GOTO L_18f74   '@18c4c
L_18c5c:
    L_BP32! = L_BP1a% - 1   '@18c5c
    GOSUB L_18f81   '@18c70
    GOSUB L_191d2   '@18c7d
    L_BP32! = L_BP1a%   '@18c8a
    GOSUB L_18f81   '@18c9d
    GOSUB L_191d2   '@18caa
L_18cc1:
    GOTO L_18f6c   '@18cc1
L_18cc9:
    IF NOT (L_BP6e$ <> "4") THEN GOTO L_18d02   '@18cc9 DS:2252
    IF NOT (CHR$(0) + CHR$(75) = L_BP6e$) THEN GOTO L_18d74   '@18cdb
L_18d02:
    IF NOT (A_15ac%(L_BP1a%) > 1) THEN GOTO L_18d6c   '@18d02
    A_15ac%(L_BP1a%) = A_15ac%(L_BP1a%) - 1   '@18d20
    L_BP32! = L_BP1a%   '@18d47
    GOSUB L_191d2   '@18d5a
L_18d6c:
    GOTO L_18f6c   '@18d6c
L_18d74:
    IF NOT (L_BP6e$ <> "6") THEN GOTO L_18dad   '@18d74 DS:2274
    IF NOT (CHR$(0) + CHR$(77) = L_BP6e$) THEN GOTO L_18e84   '@18d86
L_18dad:
    IF NOT (A_15ac%(L_BP1a%) = -1) THEN GOTO L_18e0b   '@18dad
    A_15ac%(L_BP1a%) = 1   '@18dcc
    L_BP32! = L_BP1a%   '@18de3
    GOSUB L_191d2   '@18df6
    GOTO L_18e7c   '@18e03
L_18e0b:
    IF NOT (A_15ac%(L_BP1a%) < V_139e%) THEN GOTO L_18e77   '@18e0b
    A_15ac%(L_BP1a%) = A_15ac%(L_BP1a%) + 1   '@18e2b
    L_BP32! = L_BP1a%   '@18e52
    GOSUB L_191d2   '@18e65
L_18e77:
L_18e7c:
    GOTO L_18f6c   '@18e7c
L_18e84:
    IF NOT (L_BP6e$ = "*") THEN GOTO L_18ed7   '@18e84 DS:2982
    A_15ac%(L_BP1a%) = -1   '@18e96
    L_BP32! = L_BP1a%   '@18eaf
    GOSUB L_191d2   '@18ec2
    GOTO L_18f6c   '@18ecf
L_18ed7:
    IF NOT (L_BP6e$ <> "F") THEN GOTO L_18efb   '@18ed7 DS:2bfe
    IF NOT (L_BP6e$ = "f") THEN GOTO L_18f1f   '@18ee9 DS:2c64
L_18efb:
    V_0e0c$ = ""   '@18efb DS:1ec0
    RETURN   '@18f0d
    ' @18f17 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_18f6c   '@18f17
L_18f1f:
    IF NOT (L_BP6e$ <> "R") THEN GOTO L_18f43   '@18f1f DS:2c2c
    IF NOT (L_BP6e$ = "r") THEN GOTO L_18f67   '@18f31 DS:2c6a
L_18f43:
    V_0e0c$ = "RETORNA"   '@18f43 DS:247a
    RETURN   '@18f55
    ' @18f5f (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_18f6c   '@18f5f
L_18f67:
L_18f6c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_18a96   '@18f6c
L_18f74:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_188eb   '@18f74
    ' ---- F_18f7c @0x18f7c  (018f7c_F_18f7c.lift.txt; evidence_id (assembly): ev_c09900577bd37563cf77d5ad2d27c3e1beaa5b4239bdc4a2972f332eb9bfb08f)
L_18f81:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0188e6_F_188e6
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@18f86
    IF NOT (L_BP1a% = L_BP32!) THEN GOTO L_18fe5   '@18fab
    COLOR 0, 7   '@18fc8
L_18fe5:
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP18% + 8.0), 5   '@18fe5 DS:25f6
    IF NOT (L_BP32! = 1.0) THEN GOTO L_1904c   '@19019 DS:1ec8
    V_11c0! = 1.0   '@19033 DS:1ec8
    GOTO L_19113   '@19044
L_1904c:
    V_11d0! = 1.0   '@1904c DS:1ec8
    V_11c0! = 2.0   '@1905d DS:1ee4
L_19074:
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11c0!) - 1.0)) <> A_0fba$(RT_CINT%(FX##(V_11c0!)))) THEN GOTO L_190ce   '@19074 DS:2b54
    V_11d0! = FX##(V_11d0!) + 1.0   '@190b8 DS:1ec8
L_190ce:
    IF NOT (V_11d0! = L_BP32!) THEN GOTO L_190f0   '@190ce
    GOTO L_1910e   '@190e8
L_190f0:
    V_11c0! = FX##(V_11c0!) + 1.0   '@190f0 DS:1ec8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19074   '@19106
L_1910e:
L_19113:
    V_0e0c$ = "P" + LTRIM$(A_0fba$(RT_CINT%(FX##(V_11c0!))))   '@19113 DS:21a6
    IF NOT (VAL(A_0fba$(RT_CINT%(FX##(V_11c0!)))) = 0.0#) THEN GOTO L_191a7   '@19149 DS:22e0
    V_0e0c$ = A_0fba$(RT_CINT%(FX##(V_11c0!)))   '@19181
L_191a7:
    PRINT USING " \      \"; V_0e0c$;   '@191a7 DS:2c70
    RETURN   '@191c3
L_191d2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0188e6_F_188e6
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@191d7
    IF NOT (L_BP1a% = L_BP32!) THEN GOTO L_19237   '@191fc
    COLOR 14, 7   '@19219
L_19237:
    IF NOT (A_15ac%(RT_CINT%(FX##(L_BP32!))) <> -1) THEN GOTO L_19672   '@19237
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), 0, 0) > 0) THEN GOTO L_19622   '@1925d
    L_BP4a$ = ""   '@19296 DS:1ec0
    V_13aa% = 0   '@192a8
L_192b8:
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_1931d   '@192b8
    GOTO L_1932e   '@19315
L_1931d:
    V_13aa% = V_13aa% + 1   '@1931d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_192b8   '@19326
L_1932e:
    L_BP70% = A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 6)   '@1932e
    IF NOT (L_BP70% = 1) THEN GOTO L_194ae   '@19366
    L_BP4a$ = "Retangular " + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 1))) + "x" + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 2)))   '@19374 DS:2c7e,2e6e
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 3) > 0) THEN GOTO L_194a6   '@19411
    L_BP4a$ = L_BP4a$ + "  rot " + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 3)))   '@1944b DS:2e7e
L_194a6:
    GOTO L_1961a   '@194a6
L_194ae:
    IF NOT (L_BP70% = 2) THEN GOTO L_195ab   '@194ae
    L_BP4a$ = "Circular " + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 1)))   '@194b7 DS:2e88
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 2) > 0) THEN GOTO L_195a3   '@19508
    L_BP4a$ = L_BP4a$ + "  di " + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 2)))   '@19545 DS:2e96
L_195a3:
    GOTO L_1961a   '@195a3
L_195ab:
    IF NOT (L_BP70% = 3) THEN GOTO L_1961a   '@195ab
    L_BP4a$ = "Poligonal " + LTRIM$(STR$(A_1496%(A_15ac%(RT_CINT%(FX##(L_BP32!))), V_13aa%, 2))) + " vertices"   '@195b4 DS:2ea0,2eae
    GOTO L_1961a   '@19612
L_1961a:
    GOTO L_19639   '@1961a
L_19622:
    L_BP4a$ = "SECAO NAO DEFINIDA"   '@19622 DS:2c8a
L_19639:
    V_0e10$ = A_143a$(A_15ac%(RT_CINT%(FX##(L_BP32!))))   '@19639
    GOTO L_1969b   '@1966a
L_19672:
    L_BP4a$ = ""   '@19672 DS:1ec0
    V_0e10$ = "PILAR ELIMINADO DA FORMA"   '@19684 DS:2ebc
L_1969b:
    LOCATE RT_CINT%(FX##(L_BP32!) - L_BP18% + 8.0), 22   '@1969b DS:25f6
    PRINT USING " \                      \    \                          \"; V_0e10$; L_BP4a$;   '@196cf DS:2ed8
    RETURN   '@196f4
L_19703:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0184be_F_184be
    L_BP74! = A_15ac%(0)   '@19708
    FOR V_11b8! = 1.0 TO L_BP74!   '@1972b DS:1ec8
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@19732
    IF NOT (V_11bc! <> -1.0) THEN GOTO L_19925   '@1975d DS:2b54
    L_BP76% = A_140c%(RT_CINT%(FX##(V_11bc!)), 1)   '@19778
    IF NOT (A_15ac%(A_15ac%(0) + 1) > L_BP76% OR A_140c%(RT_CINT%(FX##(V_11bc!)), 0) > A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_19920   '@197f4
    RT_VIEWPRINT 23, 25   '@19817
    RT_CLS 2   '@19829
    PRINT "  Atencao !!"   '@19837 DS:2f16
    PRINT "  O Pilar  "; A_143a$(RT_CINT%(FX##(V_11bc!))); "  nao se encontra definido no nivel  "; A_13de$(A_15ac%(A_15ac%(0) + 1)); "  escolhido."   '@19845 DS:2f26,2f36,2f60
    PRINT "  Retorne e ANULE o pilar da montagem da forma ou ESCOLHA outro Nivel";   '@198b1 DS:2f70
    BEEP   '@198bf
    CALL MIXT_07f1_LimpaTeclado   '@198c9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@198d3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = "NAO"   '@198ef DS:2c56
    RT_VIEWPRINT 6, 23   '@19901
    GOTO L_19950   '@19913
L_19920:
L_19925:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@19925 DS:1ec8
L_19950:
    RETURN   '@19950
L_1995f:   ' entrada vinda de 0166f2_FUN_1000_66f2, 0184be_F_184be
    ' @1995f libera strings locais (L_BP6e)
    ' @19968 libera strings locais (L_BP62)
    ' @19971 libera strings locais (L_BP46)
    ' @1997a libera strings locais (L_BP4a)
    ' END SUB   '@19983
END SUB

SUB S_2018c   ' entrada de SUB/FUNCTION (B$ENRA, locais 50 bytes) (0x2018c)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a$
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP38%
    DIM L_BP3c!
    ' ---- FUN_2000_018c @0x2018c  (02018c_FUN_2000_018c.lift.txt; evidence_id (assembly): ev_5fa5a4b4a343185aaf51d7611cce4fe3605449af6deaffba6feac29599df6b64)
    OPEN RT_ARQ$(V_0e46$ + V_0e2e$ + ".COL") FOR INPUT AS #1   '@20194 DS:2fc0,2fc6
    INPUT #1, V_0e0c$   '@201c2
    INPUT #1, V_0e0c$   '@201e2
    INPUT #1, V_0e0c$   '@20202
    INPUT #1, V_0e0c$   '@20222
    V_13ac! = VAL(V_0e0c$)   '@20242
    REDIM A_13b0!(-32768 TO -32768)   '@2025c
    REDIM A_13de$(-32768 TO -32768)   '@2026a
    REDIM A_13b0!(0 TO CINT(V_13ac!))   '@20273
    REDIM A_13de$(0 TO CINT(V_13ac!))   '@20297
    A_13b0!(0) = VAL(V_0e0c$)   '@202bb
    INPUT #1, V_0e0c$   '@202e3
    V_139e% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@20303
    L_BP0e! = A_13b0!(0)   '@2031e
    FOR V_11cc! = 0.0 TO L_BP0e!   '@2033d DS:2fce,2fd2
    INPUT #1, A_13b0!(RT_CINT%(FX##(V_11cc!))), A_13de$(RT_CINT%(FX##(V_11cc!)))   '@20344
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@20396 DS:2fd2
    REDIM A_140c%(-32768 TO -32768, -32768 TO -32768)   '@203be
    REDIM A_143a$(-32768 TO -32768)   '@203cc
    REDIM A_140c%(0 TO V_139e%, 0 TO 7)   '@203d5
    REDIM A_143a$(0 TO V_139e%)   '@203f7
    L_BP12! = V_139e%   '@20414
    FOR V_11cc! = 1.0 TO L_BP12!   '@20428 DS:2fd2
    INPUT #1, A_143a$(RT_CINT%(FX##(V_11cc!))), V_0e0c$, V_0e14$   '@20430
    A_140c%(RT_CINT%(FX##(V_11cc!)), 0) = RT_CINT%(FX##(VAL(RT_MID2$((V_0e0c$), (4)))))   '@2047e
    A_140c%(RT_CINT%(FX##(V_11cc!)), 1) = RT_CINT%(FX##(VAL(RT_MID2$((V_0e14$), (4)))))   '@204c5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@2050d DS:2fd2
    L_BP16! = V_139e%   '@20538
    FOR V_11cc! = 1.0 TO L_BP16!   '@2054c DS:2fd2
    INPUT #1, A_140c%(RT_CINT%(FX##(V_11cc!)), 2), A_140c%(RT_CINT%(FX##(V_11cc!)), 3), A_140c%(RT_CINT%(FX##(V_11cc!)), 4), A_140c%(RT_CINT%(FX##(V_11cc!)), 5), A_140c%(RT_CINT%(FX##(V_11cc!)), 6), A_140c%(RT_CINT%(FX##(V_11cc!)), 7)   '@20554
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@20630 DS:2fd2
    REDIM A_1468%(-32768 TO -32768, -32768 TO -32768)   '@2065b
    REDIM A_1468%(0 TO V_139e%, 0 TO CINT(V_13ac!))   '@20669
    LINE INPUT #1, L_BP1a$   '@20692 DS:2fd6
    L_BP1e! = VAL(L_BP1a$)   '@206b5
    IF NOT (L_BP1e! = 1.0) THEN GOTO L_207ec   '@206ce DS:2fd2
    L_BP22! = V_139e%   '@206e8
    FOR V_11cc! = 1.0 TO L_BP22!   '@206fc DS:2fd2
    L_BP26! = A_140c%(RT_CINT%(FX##(V_11cc!)), 1)   '@20704
    FOR V_11ec! = A_140c%(RT_CINT%(FX##(V_11cc!)), 0) TO L_BP26!   '@20733 DS:2fd2
    INPUT #1, A_1468%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11ec!)))   '@20758
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@20794 DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@207bc DS:2fd2
L_207ec:
    INPUT #1, L_BP1e!   '@207ec
    IF NOT (L_BP1e! = 1.0) THEN GOTO L_20a94   '@2080b DS:2fd2
    L_BP2a! = V_139e%   '@20825
    FOR V_11cc! = 1.0 TO L_BP2a!   '@20839 DS:2fd2
    L_BP2e! = A_140c%(RT_CINT%(FX##(V_11cc!)), 1)   '@20840
    FOR V_11ec! = A_140c%(RT_CINT%(FX##(V_11cc!)), 0) TO L_BP2e!   '@2086f DS:2fd2
    FOR V_11c0! = 0.0 TO 16.0   '@20894 DS:2fce,2fd2,2fe6
    INPUT #1, V_11d4!   '@208a2
    IF NOT (V_11d4! = 0.0 AND (V_11c0! = 13.0 OR (V_11c0! = 9.0 OR (V_11c0! = 5.0 OR V_11c0! = 1.0)))) THEN GOTO L_20958   '@208c1 DS:2fce,2fd2,2fda,2fde,2fe2
    GOTO L_20984   '@20950
L_20958:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20958 DS:2fd2,2fe6
L_20984:
    INPUT #1, V_0e0c$, V_0e0c$, V_0e0c$, V_0e0c$   '@20984
    INPUT #1, V_11d4!, V_11d4!, V_11d4!, V_11d4!, V_11d4!   '@209cb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@20a1a DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@20a45 DS:2fd2
    INPUT #1, V_11d4!   '@20a70
L_20a94:
    REDIM A_1496%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@20a94
    REDIM A_14c4%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@20aa2
    INPUT #1, L_BP1e!   '@20ab0
    INPUT #1, V_13a0%   '@20acf
    IF NOT (L_BP1e! <> 1.0) THEN GOTO L_20b44   '@20aee DS:2fd2
    PRINT " Colunas ainda nao Dimensionadas "   '@20b08 DS:2fea
    V_1a04$ = "S"   '@20b16 DS:3010
    CLOSE #1   '@20b28
    GOTO L_2107a   '@20b37
L_20b44:
    IF NOT (L_BP1e! = 1.0) THEN GOTO L_21066   '@20b44 DS:2fd2
    V_13a2% = 3   '@20b5e
    IF NOT (RT_INSTR%((1), (L_BP1a$), ("[1]")) > 0) THEN GOTO L_20bc5   '@20b69 DS:3016
    V_13a2% = RT_CINT%(FX##(VAL(RT_MID2$((L_BP1a$), (RT_INSTR%((1), (L_BP1a$), ("[1]")) + 3)))))   '@20b86 DS:3016
L_20bc5:
    V_13a6! = 30.0   '@20bc5 DS:301e
    IF NOT (RT_INSTR%((1), (L_BP1a$), ("[3]")) > 0) THEN GOTO L_20c31   '@20bd6 DS:3022
    V_13a6! = VAL(RT_MID2$((L_BP1a$), (RT_INSTR%((1), (L_BP1a$), ("[3]")) + 3)))   '@20bf3 DS:3022
L_20c31:
    REDIM A_1496%(0 TO V_139e%, 0 TO V_13a2%, 0 TO 6)   '@20c31
    REDIM A_14c4%(0 TO V_13a0%, 0 TO CINT(V_13a6!), 0 TO 1)   '@20c58
    L_BP32! = V_139e%   '@20c88
    FOR V_11cc! = 1.0 TO L_BP32!   '@20c9c DS:2fd2
    L_BP36! = V_13a2%   '@20ca4
    FOR V_11c0! = 0.0 TO L_BP36!   '@20cb8 DS:2fce,2fd2
    INPUT #1, A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), 0)   '@20cc0
    IF NOT (A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), 0) = 0) THEN GOTO L_20e47   '@20cff
    IF NOT (A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0! > 0.0) + V_11c0!), 0) <> A_140c%(RT_CINT%(FX##(V_11cc!)), 1) AND V_11c0! > 0.0 OR V_11c0! = 0.0) THEN GOTO L_20e3a   '@20d34 DS:2fce
    PRINT " Secao da Coluna"; V_11cc!; " com definicao incorreta "   '@20de8 DS:302a,303e
    V_1a04$ = "S"   '@20e0c DS:3010
    CLOSE #1   '@20e1e
    GOTO L_2107a   '@20e2d
L_20e3a:
    GOTO L_21036   '@20e3a
L_20e47:
    FOR V_11c4! = 1.0 TO 6.0   '@20e47 DS:2fd2,305c
    INPUT #1, A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(V_11c4!)))   '@20e54
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c4!   '@20e9b DS:2fd2,305c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), 6) = 3) THEN GOTO L_2100b   '@20ec4
    L_BP38% = A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), 1)   '@20ef9
    L_BP3c! = A_1496%(RT_CINT%(FX##(V_11cc!)), RT_CINT%(FX##(V_11c0!)), 2)   '@20f2a
    FOR V_11ec! = 0.0 TO L_BP3c!   '@20f64 DS:2fce,2fd2
    INPUT #1, A_14c4%(L_BP38%, RT_CINT%(FX##(V_11ec!)), 0)   '@20f6c
    INPUT #1, A_14c4%(L_BP38%, RT_CINT%(FX##(V_11ec!)), 1)   '@20fa3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@20fdb DS:2fd2
L_2100b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2100b DS:2fd2
L_21036:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@21036 DS:2fd2
L_21066:
    CLOSE #1   '@21066
L_2107a:
    ' @2107a libera strings locais (L_BP1a)
    ' END SUB   '@21083
END SUB

SUB S_21093   ' entrada de SUB/FUNCTION (B$ENRA, locais 76 bytes) (0x21093)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46!
    DIM L_BP4a!
    DIM L_BP4e!
    DIM L_BP52!
    DIM L_BP56!
    ' ---- FUN_2000_1093 @0x21093  (021093_FUN_2000_1093.lift.txt; evidence_id (assembly): ev_d57eb083c71c96e9a7f08b3a26ce7bc45115211479c8eae5630f395e1ff31e5a)
    REDIM A_0e78!(-32768 TO -32768, -32768 TO -32768)   '@2109b
    REDIM A_0ea6!(-32768 TO -32768, -32768 TO -32768)   '@210a9
    REDIM A_0ed4!(-32768 TO -32768, -32768 TO -32768)   '@210b2
    REDIM A_0f30%(-32768 TO -32768, -32768 TO -32768)   '@210bb
    REDIM A_0f8c%(-32768 TO -32768, -32768 TO -32768)   '@210c4
    REDIM A_0f5e!(-32768 TO -32768, -32768 TO -32768)   '@210cd
    REDIM A_0fba$(-32768 TO -32768)   '@210d6
    REDIM A_0fe8!(-32768 TO -32768, -32768 TO -32768)   '@210e4
    REDIM A_1044%(-32768 TO -32768, -32768 TO -32768)   '@210ed
    REDIM A_1016$(-32768 TO -32768)   '@210f6
    REDIM A_1072%(-32768 TO -32768, -32768 TO -32768)   '@210ff
    REDIM A_10a2!(-32768 TO -32768, -32768 TO -32768)   '@2110d
    REDIM A_115e!(-32768 TO -32768, -32768 TO -32768)   '@21116
    V_0e56% = 0   '@2111f
    V_0e58% = 0   '@2112a
    V_0e5a% = 0   '@21135
    V_0e5c% = 0   '@21140
    V_0e66% = 0   '@2114b
    V_0e5e% = 0   '@21156
    V_0e60% = 0   '@21161
    V_0e62% = 0   '@2116c
    V_10a0% = 0   '@21177
    V_10fe% = 0   '@21182
    V_115c% = 0   '@2118d
    OPEN RT_ARQ$(V_0e42$ + V_0e2a$ + ".LAJ") FOR INPUT AS #1   '@21198 DS:2fc0,3060
    INPUT #1, V_0e0c$   '@211c6
    INPUT #1, V_0e0c$   '@211e6
    INPUT #1, V_0e0c$   '@21206
    INPUT #1, V_0e0c$   '@21226
    INPUT #1, V_0e56%   '@21246
    INPUT #1, V_11b8!   '@21265
    REDIM A_0e78!(-32768 TO -32768, -32768 TO -32768)   '@21284
    REDIM A_0e78!(0 TO CINT(V_11b8!), 0 TO 1)   '@21292
    A_0e78!(0, 0) = V_11b8!   '@212bd
    L_BP0e! = A_0e78!(0, 0)   '@212dd
    FOR V_11b8! = 1.0 TO L_BP0e!   '@212fd DS:2fd2
    INPUT #1, A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)   '@21304
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21338 DS:2fd2
    INPUT #1, A_0e78!(0, 1)   '@21360
    IF NOT (A_0e78!(0, 1) > A_0e78!(0, 0)) THEN GOTO L_215c5   '@2138d
    REDIM A_0ea6!(-32768 TO -32768, -32768 TO -32768)   '@213c9
    REDIM A_0ea6!(0 TO CINT(A_0e78!(0, 0)), 0 TO 1)   '@213d7
    L_BP12! = A_0e78!(0, 0)   '@2140f
    FOR V_11b8! = 0.0 TO L_BP12!   '@2142f DS:2fce,2fd2
    A_0ea6!(RT_CINT%(FX##(V_11b8!)), 0) = A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)   '@21436
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21479 DS:2fd2
    V_11bc! = A_0e78!(0, 1)   '@214a1
    REDIM A_0e78!(-32768 TO -32768, -32768 TO -32768)   '@214c4
    REDIM A_0e78!(0 TO CINT(V_11bc!), 0 TO 1)   '@214d2
    L_BP16! = A_0ea6!(0, 0)   '@214fd
    FOR V_11b8! = 0.0 TO L_BP16!   '@2151d DS:2fce,2fd2
    A_0e78!(RT_CINT%(FX##(V_11b8!)), 0) = A_0ea6!(RT_CINT%(FX##(V_11b8!)), 0)   '@21524
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21567 DS:2fd2
    A_0e78!(0, 1) = V_11bc!   '@2158f
    REDIM A_0ea6!(-32768 TO -32768, -32768 TO -32768)   '@215b2
L_215c5:
    L_BP1a! = A_0e78!(0, 1)   '@215c5
    FOR V_11b8! = 1.0 TO L_BP1a!   '@215e8 DS:2fd2
    INPUT #1, A_0e78!(RT_CINT%(FX##(V_11b8!)), 1)   '@215f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21625 DS:2fd2
    INPUT #1, V_0e58%   '@2164d
    IF NOT (V_0e58% = 1) THEN GOTO L_217c0   '@2166c
    INPUT #1, V_11b8!   '@2167b
    REDIM A_0ea6!(-32768 TO -32768, -32768 TO -32768)   '@2169a
    REDIM A_0ea6!(0 TO CINT(V_11b8!), 0 TO 3)   '@216a8
    A_0ea6!(0, 0) = V_11b8!   '@216d3
    L_BP1e! = A_0ea6!(0, 0)   '@216f3
    FOR V_11b8! = 1.0 TO L_BP1e!   '@21713 DS:2fd2
    FOR V_11c0! = 0.0 TO 3.0   '@2171a DS:2fce,2fd2,3068
    INPUT #1, A_0ea6!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@21728
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@21764 DS:2fd2,3068
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@2178d DS:2fd2
    GOTO L_217fc   '@217b8
L_217c0:
    PRINT " Painel de Lajes ainda nao definido "   '@217c0 DS:306c
    V_1a04$ = "S"   '@217ce DS:3010
    CLOSE #1   '@217e0
    GOTO L_22adc   '@217ef
L_217fc:
    INPUT #1, V_0e5a%   '@217fc
    IF NOT (V_0e5a% = 1) THEN GOTO L_219a1   '@2181b
    INPUT #1, V_11bc!   '@2182a
    L_BP22! = V_11bc!   '@21849
    FOR V_11b8! = 1.0 TO L_BP22!   '@2185a DS:2fd2
    FOR V_11c0! = 0.0 TO 4.0   '@21862 DS:2fce,2fd2,3094
    INPUT #1, V_11c4!   '@21870
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2188f DS:2fd2,3094
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@218b8 DS:2fd2
    INPUT #1, V_11bc!   '@218e0
    INPUT #1, V_11b8!   '@218ff
    L_BP26! = V_11bc!   '@2191e
    FOR V_11b8! = 1.0 TO L_BP26!   '@2192f DS:2fd2
    INPUT #1, V_11c4!   '@21936
    INPUT #1, V_11c4!   '@21955
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21974 DS:2fd2
L_219a1:
    INPUT #1, V_0e5c%   '@219a1
    IF NOT (V_0e5c% = 1) THEN GOTO L_21b14   '@219c0
    INPUT #1, V_11b8!   '@219cf
    REDIM A_0ed4!(-32768 TO -32768, -32768 TO -32768)   '@219ee
    REDIM A_0ed4!(0 TO CINT(V_11b8!), 0 TO 3)   '@219fc
    A_0ed4!(0, 0) = V_11b8!   '@21a27
    L_BP2a! = A_0ed4!(0, 0)   '@21a47
    FOR V_11b8! = 1.0 TO L_BP2a!   '@21a67 DS:2fd2
    FOR V_11c0! = 0.0 TO 3.0   '@21a6e DS:2fce,2fd2,3068
    INPUT #1, A_0ed4!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@21a7c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@21ab8 DS:2fd2,3068
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21ae1 DS:2fd2
    GOTO L_21b50   '@21b0c
L_21b14:
    PRINT " Estrutura do painel de Lajes ainda nao definido "   '@21b14 DS:3098
    V_1a04$ = "S"   '@21b22 DS:3010
    CLOSE #1   '@21b34
    GOTO L_22adc   '@21b43
L_21b50:
    INPUT #1, V_0e68!   '@21b50
    INPUT #1, V_0e6c$   '@21b6f
    INPUT #1, V_0e66%   '@21b8f
    INPUT #1, V_0e5e%   '@21bae
    IF NOT (V_0e5e% = 1) THEN GOTO L_2200a   '@21bcd
    INPUT #1, V_11b8!   '@21bdc
    REDIM A_0f02!(-32768 TO -32768, -32768 TO -32768)   '@21bfb
    REDIM A_0f02!(0 TO CINT(V_11b8!), 0 TO 1)   '@21c09
    A_0f02!(0, 0) = V_11b8!   '@21c34
    L_BP2e! = A_0f02!(0, 0)   '@21c54
    FOR V_11b8! = 0.0 TO L_BP2e!   '@21c74 DS:2fce,2fd2
    INPUT #1, A_0f02!(RT_CINT%(FX##(V_11b8!)), 0)   '@21c7c
    INPUT #1, A_0f02!(RT_CINT%(FX##(V_11b8!)), 1)   '@21cb0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21ce5 DS:2fd2
    INPUT #1, V_0e64%   '@21d10
    REDIM A_0f30%(-32768 TO -32768, -32768 TO -32768)   '@21d2f
    REDIM A_0f8c%(-32768 TO -32768, -32768 TO -32768)   '@21d3d
    REDIM A_0f30%(0 TO V_0e64%, 0 TO 50)   '@21d46
    REDIM A_0f8c%(0 TO V_0e64%, 0 TO 50)   '@21d68
    A_0f30%(0, 0) = V_0e64%   '@21d8a
    L_BP32! = A_0f30%(0, 0)   '@21da5
    FOR V_11b8! = 1.0 TO L_BP32!   '@21dc9 DS:2fd2
    INPUT #1, A_0f30%(RT_CINT%(FX##(V_11b8!)), 0)   '@21dd0
    L_BP36! = A_0f30%(RT_CINT%(FX##(V_11b8!)), 0)   '@21e04
    FOR V_11c0! = 1.0 TO L_BP36!   '@21e32 DS:2fd2
    INPUT #1, A_0f30%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@21e3a
    INPUT #1, A_0f8c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@21e76
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@21eb2 DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21edd DS:2fd2
    REDIM A_0f5e!(-32768 TO -32768, -32768 TO -32768)   '@21f08
    REDIM A_0f5e!(0 TO V_0e64%, 0 TO 8)   '@21f16
    L_BP3a! = A_0f30%(0, 0)   '@21f38
    FOR V_11b8! = 1.0 TO L_BP3a!   '@21f5c DS:2fd2
    FOR V_11c0! = 0.0 TO 8.0   '@21f64 DS:2fce,2fd2,30ce
    INPUT #1, A_0f5e!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@21f72
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@21fae DS:2fd2,30ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21fd7 DS:2fd2
    GOTO L_22046   '@22002
L_2200a:
    PRINT " Lajes ainda nao definidas "   '@2200a DS:30d2
    V_1a04$ = "S"   '@22018 DS:3010
    CLOSE #1   '@2202a
    GOTO L_22adc   '@22039
L_22046:
    INPUT #1, V_0e60%   '@22046
    IF NOT (V_0e60% = 1) THEN GOTO L_22248   '@22065
    INPUT #1, V_11b8!   '@22074
    REDIM A_0fba$(-32768 TO -32768)   '@22093
    REDIM A_0fe8!(-32768 TO -32768, -32768 TO -32768)   '@220a1
    REDIM A_0fba$(0 TO CINT(V_11b8!))   '@220aa
    REDIM A_0fe8!(0 TO CINT(V_11b8!), 0 TO 3)   '@220ce
    A_0fe8!(0, 0) = V_11b8!   '@220f9
    INPUT #1, A_0fe8!(0, 1)   '@22119
    L_BP3e! = A_0fe8!(0, 0)   '@22146
    FOR V_11b8! = 1.0 TO L_BP3e!   '@22166 DS:2fd2
    FOR V_11c0! = 0.0 TO 3.0   '@2216e DS:2fce,2fd2,3068
    INPUT #1, A_0fe8!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@2217c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@221b8 DS:2fd2,3068
    INPUT #1, A_0fba$(RT_CINT%(FX##(V_11b8!)))   '@221e1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@22215 DS:2fd2
    GOTO L_22284   '@22240
L_22248:
    PRINT " Pilares ainda nao definidos "   '@22248 DS:30f2
    V_1a04$ = "S"   '@22256 DS:3010
    CLOSE #1   '@22268
    GOTO L_22adc   '@22277
L_22284:
    INPUT #1, V_0e62%   '@22284
    IF NOT (V_0e62% = 1) THEN GOTO L_22529   '@222a3
    INPUT #1, V_0e70!   '@222b2
    INPUT #1, V_0e74$   '@222d1
    INPUT #1, V_11b8!   '@222f1
    REDIM A_1044%(-32768 TO -32768, -32768 TO -32768)   '@22310
    REDIM A_1016$(-32768 TO -32768)   '@2231e
    REDIM A_1016$(0 TO CINT(V_11b8!))   '@22327
    REDIM A_1044%(0 TO CINT(V_11b8!), 0 TO 50)   '@2234b
    A_1044%(0, 0) = RT_CINT%(FX##(V_11b8!))   '@22376
    INPUT #1, A_1044%(0, 1)   '@2239c
    L_BP42! = A_1044%(0, 0)   '@223c9
    FOR V_11b8! = 1.0 TO L_BP42!   '@223ed DS:2fd2
    INPUT #1, A_1016$(RT_CINT%(FX##(V_11b8!)))   '@223f4
    INPUT #1, A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@22428
    L_BP46! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@2245c
    FOR V_11c0! = 1.0 TO L_BP46!   '@2248a DS:2fd2
    INPUT #1, A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@22492
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@224ce DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@224f6 DS:2fd2
    GOTO L_22565   '@22521
L_22529:
    PRINT " Vigas ainda nao definidas "   '@22529 DS:3114
    V_1a04$ = "S"   '@22537 DS:3010
    CLOSE #1   '@22549
    GOTO L_22adc   '@22558
L_22565:
    INPUT #1, V_10a0%   '@22565
    IF NOT (EOF(1) <> -1) THEN GOTO L_22aaa   '@22584
    IF NOT (V_10a0% = 1) THEN GOTO L_226f8   '@2259a
    INPUT #1, V_11b8!   '@225a9
    REDIM A_1072%(-32768 TO -32768, -32768 TO -32768)   '@225c8
    REDIM A_1072%(0 TO CINT(V_11b8!), 0 TO 4)   '@225d6
    A_1072%(0, 0) = RT_CINT%(FX##(V_11b8!))   '@22601
    L_BP4a! = A_1072%(0, 0)   '@22627
    FOR V_11b8! = 0.0 TO L_BP4a!   '@2264b DS:2fce,2fd2
    FOR V_11c0! = 0.0 TO 4.0   '@22652 DS:2fce,2fd2,3094
    INPUT #1, A_1072%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)))   '@22660
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2269c DS:2fd2,3094
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@226c5 DS:2fd2
    GOTO L_2270b   '@226f0
L_226f8:
    PRINT " Continuidade ainda nao definida "   '@226f8 DS:3134
L_2270b:
    INPUT #1, V_10fe%   '@2270b
    IF NOT (V_10fe% = 1) THEN GOTO L_22830   '@2272a
    REDIM A_10a2!(-32768 TO -32768, -32768 TO -32768)   '@22739
    REDIM A_10a2!(0 TO V_0e64%, 0 TO 1)   '@22747
    L_BP4e! = A_0f30%(0, 0)   '@22769
    FOR V_11b8! = 0.0 TO L_BP4e!   '@2278d DS:2fce,2fd2
    INPUT #1, A_10a2!(RT_CINT%(FX##(V_11b8!)), 0)   '@22794
    INPUT #1, A_10a2!(RT_CINT%(FX##(V_11b8!)), 1)   '@227c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@227fd DS:2fd2
    GOTO L_22843   '@22828
L_22830:
    PRINT " Dimensionamento ainda nao definido "   '@22830 DS:315a
L_22843:
    INPUT #1, V_11b8!   '@22843
    IF NOT (V_11b8! = 1.0) THEN GOTO L_228f4   '@22862 DS:2fd2
    L_BP52! = A_0f30%(0, 0)   '@2287d
    FOR V_11b8! = 0.0 TO L_BP52!   '@228a1 DS:2fce,2fd2
    INPUT #1, V_11bc!   '@228a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@228c7 DS:2fd2
L_228f4:
    INPUT #1, V_115c%   '@228f4
    IF NOT (V_115c% = 1) THEN GOTO L_22a8f   '@22913
    REDIM A_115e!(-32768 TO -32768, -32768 TO -32768)   '@22922
    REDIM A_115e!(0 TO A_0f30%(0, 0), 0 TO 3)   '@22930
    L_BP56! = A_0f30%(0, 0)   '@22961
    FOR V_11b8! = 0.0 TO L_BP56!   '@22985 DS:2fce,2fd2
    INPUT #1, A_115e!(RT_CINT%(FX##(V_11b8!)), 0)   '@2298c
    INPUT #1, A_115e!(RT_CINT%(FX##(V_11b8!)), 1)   '@229c0
    INPUT #1, A_115e!(RT_CINT%(FX##(V_11b8!)), 2)   '@229f5
    INPUT #1, A_115e!(RT_CINT%(FX##(V_11b8!)), 3)   '@22a27
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@22a5c DS:2fd2
    GOTO L_22aa2   '@22a87
L_22a8f:
    PRINT " Armaduras ainda nao definidas "   '@22a8f DS:3182
L_22aa2:
    GOTO L_22ac8   '@22aa2
L_22aaa:
    V_10a0% = 0   '@22aaa
    PRINT " Continuidade ainda nao definida "   '@22ab5 DS:3134
L_22ac8:
    CLOSE #1   '@22ac8
L_22adc:
    ' END SUB   '@22adc
END SUB

SUB S_22aec   ' entrada de SUB/FUNCTION (B$ENRA, locais 6 bytes) (0x22aec)
    DIM L_BP0e!
    DIM L_BP10%
    ' ---- FUN_2000_2aec @0x22aec  (022aec_FUN_2000_2aec.lift.txt; evidence_id (assembly): ev_05f02f81598ca7b64b94412f2d6aef3569c5227c9cef38384dc8adf9ca20f664)
    OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".VIG") FOR RANDOM AS #1 LEN = 855   '@22afe DS:31a6,31ac
    RT_REG_1B66_LE 1, 1&   '@22b2c (registro de 855 bytes)
    CLOSE #1   '@22b4b
    V_11c0! = V_1b7f%   '@22b5a
    REDIM A_1200!(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@22b6e
    REDIM A_122e$(-32768 TO -32768)   '@22b7c
    REDIM A_1200!(0 TO CINT(V_11c0!), 0 TO 14, 0 TO 4)   '@22b85
    REDIM A_122e$(0 TO CINT(V_11c0!))   '@22bb4
    A_1200!(0, 0, 0) = V_11c0!   '@22bd8
    L_BP0e! = V_11c0!   '@22bf9
    FOR V_11b8! = 1.0 TO L_BP0e!   '@22c0a DS:2fd2
    OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".SEC") FOR RANDOM AS #1 LEN = 346   '@22c12 DS:31a6,31b4
    RT_REG_1A08_LE 1, RT_CLNG&(FX##(V_11b8!))   '@22c40 (registro de 346 bytes)
    CLOSE #1   '@22c65
    L_BP10% = (V_1a08% <= 12 AND V_1a08% >= 0)   '@22c74
    IF NOT ((V_1a08% = INT(V_1a08%) AND L_BP10%) <> 0) THEN GOTO L_231d9   '@22c9e
    A_1200!(RT_CINT%(FX##(V_11b8!)), 0, 0) = V_1a12!   '@22cc2
    A_1200!(RT_CINT%(FX##(V_11b8!)), 0, 1) = V_1a16!   '@22ced
    A_1200!(RT_CINT%(FX##(V_11b8!)), 1, 0) = V_1a2a!   '@22d1b
    A_1200!(RT_CINT%(FX##(V_11b8!)), 1, 1) = V_1a2e!   '@22d49
    A_1200!(RT_CINT%(FX##(V_11b8!)), 2, 0) = V_1a42!   '@22d75
    A_1200!(RT_CINT%(FX##(V_11b8!)), 2, 1) = V_1a46!   '@22da3
    A_1200!(RT_CINT%(FX##(V_11b8!)), 3, 0) = V_1a5a!   '@22dd2
    A_1200!(RT_CINT%(FX##(V_11b8!)), 3, 1) = V_1a5e!   '@22e00
    A_1200!(RT_CINT%(FX##(V_11b8!)), 4, 0) = V_1a72!   '@22e2f
    A_1200!(RT_CINT%(FX##(V_11b8!)), 4, 1) = V_1a76!   '@22e5d
    A_1200!(RT_CINT%(FX##(V_11b8!)), 5, 0) = V_1a8a!   '@22e8c
    A_1200!(RT_CINT%(FX##(V_11b8!)), 5, 1) = V_1a8e!   '@22eba
    A_1200!(RT_CINT%(FX##(V_11b8!)), 6, 0) = V_1aa2!   '@22ee9
    A_1200!(RT_CINT%(FX##(V_11b8!)), 6, 1) = V_1aa6!   '@22f17
    A_1200!(RT_CINT%(FX##(V_11b8!)), 7, 0) = V_1aba!   '@22f46
    A_1200!(RT_CINT%(FX##(V_11b8!)), 7, 1) = V_1abe!   '@22f74
    A_1200!(RT_CINT%(FX##(V_11b8!)), 8, 0) = V_1ad2!   '@22fa3
    A_1200!(RT_CINT%(FX##(V_11b8!)), 8, 1) = V_1ad6!   '@22fd1
    A_1200!(RT_CINT%(FX##(V_11b8!)), 9, 0) = V_1aea!   '@23000
    A_1200!(RT_CINT%(FX##(V_11b8!)), 9, 1) = V_1aee!   '@2302e
    A_1200!(RT_CINT%(FX##(V_11b8!)), 10, 0) = V_1b02!   '@2305d
    A_1200!(RT_CINT%(FX##(V_11b8!)), 10, 1) = V_1b06!   '@2308b
    A_1200!(RT_CINT%(FX##(V_11b8!)), 11, 0) = V_1b1a!   '@230ba
    A_1200!(RT_CINT%(FX##(V_11b8!)), 11, 1) = V_1b1e!   '@230e8
    A_1200!(RT_CINT%(FX##(V_11b8!)), 12, 0) = V_1b32!   '@23117
    A_1200!(RT_CINT%(FX##(V_11b8!)), 12, 1) = V_1b36!   '@23145
    A_1200!(RT_CINT%(FX##(V_11b8!)), 13, 0) = V_1b4a!   '@23174
    A_1200!(RT_CINT%(FX##(V_11b8!)), 13, 1) = V_1b4e!   '@231a2
    GOTO L_23230   '@231d1
L_231d9:
    A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 0) = -1.0   '@231d9 DS:31bc
    PRINT " Secao da Viga"; V_11b8!; "nao confere "   '@23207 DS:31c0,31d2
L_23230:
    OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".VIG") FOR RANDOM AS #1 LEN = 855   '@23230 DS:31a6,31ac
    RT_REG_1B66_LE 1, RT_CLNG&(FX##(V_11b8!) + 1.0)   '@2325e DS:2fd2 (registro de 855 bytes)
    CLOSE #1   '@23288
    A_122e$(RT_CINT%(FX##(V_11b8!))) = LTRIM$(RTRIM$(RT_FIXL$(V_1b66$, 20)))   '@23297
    A_1200!(RT_CINT%(FX##(V_11b8!)), 0, 3) = V_1b8d!   '@232d4
    A_1200!(RT_CINT%(FX##(V_11b8!)), 1, 3) = V_1b99!   '@232ff
    A_1200!(RT_CINT%(FX##(V_11b8!)), 2, 3) = V_1ba5!   '@2332b
    A_1200!(RT_CINT%(FX##(V_11b8!)), 3, 3) = V_1bb1!   '@23357
    A_1200!(RT_CINT%(FX##(V_11b8!)), 4, 3) = V_1bbd!   '@23380
    A_1200!(RT_CINT%(FX##(V_11b8!)), 5, 3) = V_1bc9!   '@233ac
    A_1200!(RT_CINT%(FX##(V_11b8!)), 6, 3) = V_1bd5!   '@233d8
    A_1200!(RT_CINT%(FX##(V_11b8!)), 7, 3) = V_1be1!   '@23404
    A_1200!(RT_CINT%(FX##(V_11b8!)), 8, 3) = V_1bed!   '@23430
    A_1200!(RT_CINT%(FX##(V_11b8!)), 9, 3) = V_1bf9!   '@2345c
    A_1200!(RT_CINT%(FX##(V_11b8!)), 10, 3) = V_1c05!   '@23488
    A_1200!(RT_CINT%(FX##(V_11b8!)), 11, 3) = V_1c11!   '@234b4
    A_1200!(RT_CINT%(FX##(V_11b8!)), 12, 3) = V_1c1d!   '@234e0
    A_1200!(RT_CINT%(FX##(V_11b8!)), 13, 3) = V_1c29!   '@2350c
    A_1200!(RT_CINT%(FX##(V_11b8!)), 0, 4) = V_1b91!   '@23538
    A_1200!(RT_CINT%(FX##(V_11b8!)), 1, 4) = V_1b9d!   '@23566
    A_1200!(RT_CINT%(FX##(V_11b8!)), 2, 4) = V_1ba9!   '@23595
    A_1200!(RT_CINT%(FX##(V_11b8!)), 3, 4) = V_1bb5!   '@235c4
    A_1200!(RT_CINT%(FX##(V_11b8!)), 4, 4) = V_1bc1!   '@235f3
    A_1200!(RT_CINT%(FX##(V_11b8!)), 5, 4) = V_1bcd!   '@2361f
    A_1200!(RT_CINT%(FX##(V_11b8!)), 6, 4) = V_1bd9!   '@2364e
    A_1200!(RT_CINT%(FX##(V_11b8!)), 7, 4) = V_1be5!   '@2367d
    A_1200!(RT_CINT%(FX##(V_11b8!)), 8, 4) = V_1bf1!   '@236ac
    A_1200!(RT_CINT%(FX##(V_11b8!)), 9, 4) = V_1bfd!   '@236db
    A_1200!(RT_CINT%(FX##(V_11b8!)), 10, 4) = V_1c09!   '@2370a
    A_1200!(RT_CINT%(FX##(V_11b8!)), 11, 4) = V_1c15!   '@23739
    A_1200!(RT_CINT%(FX##(V_11b8!)), 12, 4) = V_1c21!   '@23768
    A_1200!(RT_CINT%(FX##(V_11b8!)), 13, 4) = V_1c2d!   '@23797
    A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 0) = V_1b7f%   '@237c6
    A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 1) = V_1b81%   '@237f7
    A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 2) = V_1b83%   '@23829
    FOR V_11c0! = 0.0 TO 13.0   '@2385b DS:2fce,2fd2,2fe2
    A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)), 4) = RT_CINT%((A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)), 4) - INT(FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)), 4)) * 100.0) / 100.0) * 100000.0)   '@23868 DS:31e2,31e6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@23910 DS:2fd2,2fe2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@2393c DS:2fd2
    A_1200!(1, 14, 3) = 0.0   '@23967 DS:2fce
    A_1200!(1, 14, 4) = 0.0   '@2398c DS:2fce
    ' END SUB   '@239b4
END SUB

SUB S_239c9   ' entrada de SUB/FUNCTION (B$ENRA, locais 60 bytes) (0x239c9)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46!
    ' ---- FUN_2000_39c9 @0x239c9  (0239c9_FUN_2000_39c9.lift.txt; evidence_id (assembly): ev_ee855c87083234fc9a1c7968c70a999c4b28e5f1183ac460f3e710074ca02ec5)
    V_11d4! = 0.0   '@239e0 DS:2fce
    V_11b8! = 1.0   '@239f1 DS:2fd2
L_23a08:
    IF NOT (A_1200!(0, 0, 0) >= V_11b8!) THEN GOTO L_25a5e   '@23a09
    L_BP32! = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 2)   '@23a2e
    FOR V_11c4! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), 14, 1)) TO L_BP32!   '@23a7f DS:2fd2
    V_11e4! = FX##(V_11c4!) / 100.0 + V_11b8!   '@23aaa DS:31e2
    V_0e10$ = ""   '@23ac5 DS:2fd6
    V_11bc! = 1.0   '@23ad7 DS:2fd2
L_23aee:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = V_11e4!) THEN GOTO L_259d4   '@23aee
    V_11c0! = FX##(V_11bc!) + 1.0   '@23b23 DS:2fd2
L_23b3e:
    IF NOT (A_1608!(0, 0) >= V_11c0!) THEN GOTO L_259b0   '@23b3f
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_25992   '@23b63
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 0) = A_1608!(RT_CINT%(FX##(V_11bc!)), 2)) THEN GOTO L_240ea   '@23bb2
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) THEN GOTO L_240e2   '@23bfd
    IF NOT (ABS(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) - A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) < 0.699999988079071044921875##) THEN GOTO L_23ceb   '@23c48 DS:31ea
    V_0e10$ = "OK"   '@23cc9 DS:31ee
    GOTO L_259b0   '@23cdb
L_23ceb:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 0) <> A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) THEN GOTO L_240d8   '@23ceb
    L_BP0e! = (FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) + A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) / 2.0   '@23d38 DS:31f4
    L_BP36! = A_1608!(0, 0)   '@23d84
    FOR V_11c0! = 1.0 TO L_BP36!   '@23da4 DS:2fd2
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_2407d   '@23dac
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) THEN GOTO L_23fe9   '@23dfb
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 0) < L_BP0e!) THEN GOTO L_23f33   '@23e46
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = L_BP0e! - FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0   '@23e79 DS:31f4
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = L_BP0e! - FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0   '@23ed3 DS:31f4
    GOTO L_23fe4   '@23f2b
L_23f33:
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 + L_BP0e!   '@23f33 DS:31f4
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 + L_BP0e!   '@23f8a DS:31f4
L_23fe4:
L_23fe9:
    FOR L_BP3a! = 0.0 TO 8.0   '@23fe9 DS:2fce,2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BP3a!))) = 0.0   '@23ff6 DS:2fce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP3a!   '@24027 DS:2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) = 2.0   '@2404d DS:31f4
L_2407d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2407d DS:2fd2
    V_11d4! = 1.0   '@240a8 DS:2fd2
    V_0e10$ = "OK"   '@240b9 DS:31ee
    GOTO L_259b0   '@240cb
L_240d8:
L_240e2:
    GOTO L_2598d   '@240e2
L_240ea:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 1) = A_1608!(RT_CINT%(FX##(V_11bc!)), 3)) THEN GOTO L_2463e   '@240ea
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) THEN GOTO L_24636   '@24139
    IF NOT (ABS(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) - A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) < 0.699999988079071044921875##) THEN GOTO L_2422d   '@24188 DS:31ea
    V_0e10$ = "OK"   '@2420b DS:31ee
    GOTO L_259b0   '@2421d
L_2422d:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 1) <> A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) THEN GOTO L_2462c   '@2422d
    L_BP12! = (FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) + A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) / 2.0   '@2427c DS:31f4
    L_BP3e! = A_1608!(0, 0)   '@242ca
    FOR V_11c0! = 1.0 TO L_BP3e!   '@242ea DS:2fd2
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_245d1   '@242f2
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) THEN GOTO L_2453c   '@24341
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 1) < L_BP12!) THEN GOTO L_24482   '@24390
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = L_BP12! - FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0   '@243c4 DS:31f4
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = L_BP12! - FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0   '@2441f DS:31f4
    GOTO L_24537   '@2447a
L_24482:
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 + L_BP12!   '@24482 DS:31f4
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 + L_BP12!   '@244da DS:31f4
L_24537:
L_2453c:
    FOR L_BP3a! = 0.0 TO 8.0   '@2453c DS:2fce,2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BP3a!))) = 0.0   '@2454a DS:2fce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP3a!   '@2457b DS:2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) = 2.0   '@245a1 DS:31f4
L_245d1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@245d1 DS:2fd2
    V_11d4! = 1.0   '@245fc DS:2fd2
    V_0e10$ = "OK"   '@2460d DS:31ee
    GOTO L_259b0   '@2461f
L_2462c:
L_24636:
    GOTO L_25988   '@24636
L_2463e:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 3) > A_1608!(RT_CINT%(FX##(V_11bc!)), 1) AND A_1608!(RT_CINT%(FX##(V_11bc!)), 2) > A_1608!(RT_CINT%(FX##(V_11bc!)), 0) OR A_1608!(RT_CINT%(FX##(V_11bc!)), 1) > A_1608!(RT_CINT%(FX##(V_11bc!)), 3) AND A_1608!(RT_CINT%(FX##(V_11bc!)), 0) > A_1608!(RT_CINT%(FX##(V_11bc!)), 2)) THEN GOTO L_2481b   '@2463e
    L_BP1a! = ATN(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)) / ABS(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)))   '@24780
    GOTO L_248c0   '@24813
L_2481b:
    L_BP1a! = FX##(V_0e04#) / 2.0# + ATN(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)) / ABS(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)))   '@2481b DS:31f8
L_248c0:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 1) <> A_1608!(RT_CINT%(FX##(V_11c0!)), 3) AND A_1608!(RT_CINT%(FX##(V_11c0!)), 0) <> A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) THEN GOTO L_25983   '@248c0
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 3) > A_1608!(RT_CINT%(FX##(V_11c0!)), 1) AND A_1608!(RT_CINT%(FX##(V_11c0!)), 2) > A_1608!(RT_CINT%(FX##(V_11c0!)), 0) OR A_1608!(RT_CINT%(FX##(V_11c0!)), 1) > A_1608!(RT_CINT%(FX##(V_11c0!)), 3) AND A_1608!(RT_CINT%(FX##(V_11c0!)), 0) > A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) THEN GOTO L_24b41   '@24964
    L_BP1e! = ATN(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) / ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 2)))   '@24aa6
    GOTO L_24be6   '@24b39
L_24b41:
    L_BP1e! = FX##(V_0e04#) / 2.0# + ATN(ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) / ABS(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 3)))   '@24b41 DS:31f8
L_24be6:
    IF NOT (ABS(FX##(L_BP1a!) - L_BP1e!) < 0.100000001490116119384765625##) THEN GOTO L_2597e   '@24be6 DS:3200
    L_BP22! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 0)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 1)), (2.0)))   '@24c07 DS:31f4
    L_BP26! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)), (2.0)))   '@24caa DS:31f4
    L_BP2a! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 1)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)), (2.0)))   '@24d4b DS:31f4
    GOSUB L_25a6b   '@24dec
    L_BP2e! = L_BP42!   '@24df9
    IF NOT (ABS(FX##(L_BP2e!) - A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) < 0.699999988079071044921875##) THEN GOTO L_24e70   '@24e08 DS:31ea
    V_0e10$ = "OK"   '@24e4e DS:31ee
    GOTO L_259b0   '@24e60
L_24e70:
    IF NOT (L_BP2e! > 1.0) THEN GOTO L_25974   '@24e70 DS:2fd2
    L_BP0e! = A_1608!(RT_CINT%(FX##(V_11bc!)), 2) - (FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 2)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 0)) * A_1608!(RT_CINT%(FX##(V_11bc!)), 3) / (FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 3)) - A_1608!(RT_CINT%(FX##(V_11bc!)), 1))   '@24e8a
    L_BP12! = A_1608!(RT_CINT%(FX##(V_11c0!)), 2) - (FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) * A_1608!(RT_CINT%(FX##(V_11c0!)), 3) / (FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 1))   '@24f4e
    L_BP0e! = (FX##(L_BP0e!) + L_BP12!) / 2.0   '@25012 DS:31f4
    L_BP46! = A_1608!(0, 0)   '@2502a
    FOR V_11c0! = 1.0 TO L_BP46!   '@2504a DS:2fd2
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_25919   '@25052
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c0!)), 0) <> A_1608!(RT_CINT%(FX##(V_11c0!)), 2) AND A_1608!(RT_CINT%(FX##(V_11c0!)), 1) <> A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) THEN GOTO L_25884   '@250a1
    L_BP12! = A_1608!(RT_CINT%(FX##(V_11c0!)), 2) - (FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) * A_1608!(RT_CINT%(FX##(V_11c0!)), 3) / (FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) - A_1608!(RT_CINT%(FX##(V_11c0!)), 1))   '@25145
    IF NOT (FX##(L_BP1a!) < FX##(V_0e04#) / 2.0#) THEN GOTO L_25547   '@25209 DS:31f8
    L_BP16! = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 - ABS(FX##(L_BP12!) - L_BP0e!) * RT_SIN##(FX##(L_BP1a!))   '@25228 DS:31f4
    IF NOT (L_BP12! < L_BP0e!) THEN GOTO L_253ec   '@2527d
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = A_1608!(RT_CINT%(FX##(V_11c0!)), 0) - RT_SIN##(FX##(L_BP1a!)) * L_BP16!   '@25296
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = RT_COS##(FX##(L_BP1a!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 1)   '@252eb
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = A_1608!(RT_CINT%(FX##(V_11c0!)), 2) - RT_SIN##(FX##(L_BP1a!)) * L_BP16!   '@2533f
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = RT_COS##(FX##(L_BP1a!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 3)   '@25390
    GOTO L_2553f   '@253e4
L_253ec:
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = RT_SIN##(FX##(L_BP1a!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 0)   '@253ec
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = A_1608!(RT_CINT%(FX##(V_11c0!)), 1) - RT_COS##(FX##(L_BP1a!)) * L_BP16!   '@2543e
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = RT_SIN##(FX##(L_BP1a!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 2)   '@25495
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = A_1608!(RT_CINT%(FX##(V_11c0!)), 3) - RT_COS##(FX##(L_BP1a!)) * L_BP16!   '@254e3
L_2553f:
    GOTO L_2587f   '@2553f
L_25547:
    L_BP1e! = L_BP1a! - FX##(V_0e04#) / 2.0#   '@25547 DS:31f8
    L_BP16! = FX##(A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), 0)) / 2.0 - ABS(FX##(L_BP12!) - L_BP0e!) * RT_SIN##(FX##(L_BP1e!))   '@25563 DS:31f4
    IF NOT (L_BP12! < L_BP0e!) THEN GOTO L_2572d   '@255b8
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = A_1608!(RT_CINT%(FX##(V_11c0!)), 0) - RT_SIN##(FX##(L_BP1e!)) * L_BP16!   '@255d1
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = A_1608!(RT_CINT%(FX##(V_11c0!)), 1) - RT_COS##(FX##(L_BP1e!)) * L_BP16!   '@25626
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = A_1608!(RT_CINT%(FX##(V_11c0!)), 2) - RT_SIN##(FX##(L_BP1e!)) * L_BP16!   '@2567d
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = A_1608!(RT_CINT%(FX##(V_11c0!)), 3) - RT_COS##(FX##(L_BP1e!)) * L_BP16!   '@256ce
    GOTO L_2587a   '@25725
L_2572d:
    A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = RT_SIN##(FX##(L_BP1e!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 0)   '@2572d
    A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = RT_COS##(FX##(L_BP1e!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 1)   '@2577f
    A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = RT_SIN##(FX##(L_BP1e!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 2)   '@257d3
    A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = RT_COS##(FX##(L_BP1e!)) * L_BP16! + A_1608!(RT_CINT%(FX##(V_11c0!)), 3)   '@25821
L_2587a:
L_2587f:
L_25884:
    FOR L_BP3a! = 0.0 TO 8.0   '@25884 DS:2fce,2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BP3a!))) = 0.0   '@25892 DS:2fce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP3a!   '@258c3 DS:2fd2,30ce
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) = 2.0   '@258e9 DS:31f4
L_25919:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@25919 DS:2fd2
    V_11d4! = 1.0   '@25944 DS:2fd2
    V_0e10$ = "OK"   '@25955 DS:31ee
    GOTO L_259b0   '@25967
L_25974:
L_2597e:
L_25983:
L_25988:
L_2598d:
L_25992:
    V_11c0! = FX##(V_11c0!) + 1.0   '@25992 DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23b3e   '@259a8
L_259b0:
    IF NOT (V_0e10$ = "OK") THEN GOTO L_259cf   '@259b0 DS:31ee
    GOTO L_25a14   '@259c7
L_259cf:
L_259d4:
    V_11bc! = FX##(V_11bc!) + 1.0   '@259d4 DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) <= V_11bc!) THEN GOTO L_23aee   '@259ea
L_25a14:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c4!   '@25a14 DS:2fd2
    V_11b8! = FX##(V_11b8!) + 1.0   '@25a3f DS:2fd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23a08   '@25a55
L_25a5e:
    GOTO L_25b34   '@25a5e
    ' ---- F_25a66 @0x25a66  (025a66_F_25a66.lift.txt; evidence_id (assembly): ev_e35757f162ed691e9919f9be05a1459e489cce691474a5cd3431c0acb6ad1346)
L_25a6b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0239c9_FUN_2000_39c9
    L_BP42! = RT_POT##((FX##(L_BP22!)), (2.0)) - RT_POT##(((RT_POT##((FX##(L_BP2a!)), (2.0)) + (RT_POT##((FX##(L_BP22!)), (2.0)) - RT_POT##((FX##(L_BP26!)), (2.0)))) / (FX##(L_BP2a!) * 2.0)), (2.0))   '@25a70 DS:31f4
    IF NOT (L_BP42! > 0.0) THEN GOTO L_25b10   '@25adc DS:2fce
    L_BP42! = RT_SQR##(FX##(L_BP42!))   '@25af6
    GOTO L_25b25   '@25b08
L_25b10:
    L_BP42! = 0.0   '@25b10 DS:2fce
L_25b25:
    RETURN   '@25b25
L_25b34:   ' entrada vinda de 0239c9_FUN_2000_39c9
    ' END SUB   '@25b34
END SUB

SUB S_30042   ' entrada de SUB/FUNCTION (B$ENRA, locais 6 bytes) (0x30042)
    DIM L_BP0e$
    ' ---- FUN_3000_0042 @0x30042  (030042_FUN_3000_0042.lift.txt; evidence_id (assembly): ev_6bb04cbdd594feae6d5f78b613660f08094389ecb3e4dc996a92fef41417b287)
    V_1b62$ = "OpenStrut (eng. reversa)"   '@3004f DS:3210
    L_BP0e$ = ""   '@30061 DS:322c
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
'$INCLUDE: 'COMUM_FORMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
