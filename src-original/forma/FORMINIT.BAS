' ============================================================================
'  FORMINIT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/FORMINIT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: e45fc85a2e1228b67a2160348fd0c235299f09d73842fa4a36a361314debb771
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_FORMA.BI'

' ---- variaveis do FORMINIT fora do COMMON (DS do programa)
REDIM SHARED A_196c!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1866!
DIM SHARED V_199a!
DIM SHARED V_199e!
DIM SHARED V_19a2!
DIM SHARED V_19a6!
DIM SHARED V_19aa!
DIM SHARED V_19ae!
DIM SHARED V_19b2!
DIM SHARED V_19b6!
DIM SHARED V_19ba!
DIM SHARED V_19be!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "FORMINIT"
' ---- M_FORMINIT @0x10030  (010030_M_FORMINIT.lift.txt; evidence_id (assembly): ev_f5ad895e6a0fff50a78e892d3a1b1392a8f0a82cfbe5f765e211f122bf43d039)
' @10030 inicio do programa (B$?EVT)
GOTO L_101de   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101de:
L_101e3:   ' entrada vinda de 0104a6_F_104a6
ON ERROR GOTO L_108b2
RT_ONERR = &H108b2   '@101e8
GOSUB L_104ab   '@101f7
IF NOT (V_157a$ = "FORMA") THEN GOTO L_10249   '@10204 DS:1a2a
V_1802% = 0   '@1021b
CALL S_116a5   '@10226
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
CALL S_1296d   '@10230
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
CALL S_11237   '@1023a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
L_10249:
IF NOT (V_157a$ = "FORMEDCA") THEN GOTO L_102cb   '@10249 DS:1a34
LOCATE 24, 1   '@10260
PRINT " Atualizacao da posicao dos Pilares Alterados.                       "   '@1027b DS:1a40
CALL S_16a6d   '@10289
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
LOCATE 24, 1   '@10293
PRINT " Atualizacao da posicao das Vigas Alteradas.                         "   '@102ae DS:1a8a
CALL S_18105   '@102bc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
L_102cb:
CALL S_20c9a   '@102cb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_157a$ = "FORMA") THEN GOTO L_10303   '@102d5 DS:1a2a
V_157a$ = "FORMINIT"   '@102ec DS:1ad4
L_10303:
IF NOT (V_157a$ = "FORMEDCA") THEN GOTO L_10331   '@10303 DS:1a34
V_157a$ = "VOLTAFORMINIT"   '@1031a DS:1ae0
L_10331:
L_10336:
V_0e0c$ = "FORMEDCA"   '@1033b DS:1a34
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@1034d
V_11d4! = RT_FRE&("")   '@1035c DS:19d0
L_BP0c% = (LEN(V_0e3a$) > 3)   '@10376
CHDIR RT_ARQ$(RT_LEFT$((V_0e3a$), (LEN(V_0e3a$) + L_BP0c%)))   '@10395
RT_CHAIN V_0e3a$ + V_0e0c$   '@103a9
L_103c6:
RESUME L_103dd   '@103cb
L_103dd:
BEEP   '@103e2
L_BP0c% = (V_0e3a$ = "A:\")   '@103ec DS:1af2
IF NOT ((V_0e3a$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_1049e   '@10411 DS:1afa
LOCATE 25, 1   '@10426
PRINT " Coloque o Disco "; V_0e0c$; " no Drive "; V_0e3a$; " ";   '@10441 DS:1b02,1b18,1b26
CALL MIXT_07f1_LimpaTeclado   '@10473
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
V_0e10$ = RT_INPUT$(1)   '@1047d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
L_1049e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY no laco (B$EVCK)
GOTO L_10336   '@1049e
' ---- F_104a6 @0x104a6  (0104a6_F_104a6.lift.txt; evidence_id (assembly): ev_a3303b38751320aea2ce52e60c78ca96e5ad0abb54a2d2cb007bc3201a759a50)
L_104ab:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMINIT
FOR V_1866! = 1.0 TO 10.0   '@104b0 DS:1b2c,1b30
ON KEY(RT_CINT%(FX##(V_1866!))) GOSUB L_10751
RT_ONKEY RT_CINT%(FX##(V_1866!)), 1   '@104be
KEY(RT_CINT%(FX##(V_1866!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1866!)), 1   '@104d8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY no laco (B$EVCK)
NEXT V_1866!   '@104ed DS:1b2c,1b30
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@10516
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@1053e
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@10566
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@1058e
FOR V_1866! = 15.0 TO 18.0   '@105b6 DS:1b2c,1b34,1b38
ON KEY(RT_CINT%(FX##(V_1866!))) GOSUB L_1077c
RT_ONKEY RT_CINT%(FX##(V_1866!)), 2   '@105c4
KEY(RT_CINT%(FX##(V_1866!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1866!)), 1   '@105de
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY no laco (B$EVCK)
NEXT V_1866!   '@105f3 DS:1b2c,1b38
ON KEY(2) GOSUB L_1077c
RT_ONKEY 2, 2   '@1061c
KEY(2) ON
RT_KEYESTADO 2, 1   '@1062f
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@1063d
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@10665
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@1068d
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@106b5
FOR V_1866! = 19.0 TO 22.0   '@106dc DS:1b2c,1b3c,1b40
ON KEY(RT_CINT%(FX##(V_1866!))) GOSUB L_10884
RT_ONKEY RT_CINT%(FX##(V_1866!)), 3   '@106ea
KEY(RT_CINT%(FX##(V_1866!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1866!)), 1   '@10704
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY no laco (B$EVCK)
NEXT V_1866!   '@10719 DS:1b2c,1b40
RETURN   '@10742
L_10751:
BEEP   '@10756
GOSUB L_104ab   '@10760
RETURN   '@1076d
L_1077c:
RT_SCREEN 0   '@10781
RT_VIEWPRINT 1, 25   '@10796
COLOR 7, 0, 0   '@107a8
RT_CLS 0   '@107cc
PRINT " Aguarde ..."   '@107d9 DS:1b44
PRINT ""   '@107e7 DS:19d0
PRINT " Retorno ao Modulo Gerenciador"   '@107f5 DS:1b54
ON ERROR GOTO L_1083d
RT_ONERR = &H1083d   '@10803
RT_RUN RT_MID$((V_0e3a$), (1), (11)) + "SISTRUT"   '@10812 DS:1b76
L_1083d:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0e3a$), (1), (11))   '@10842 DS:1b82
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@10867 DS:19ee
RT_FIM   '@10875 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10884:
BEEP   '@10889
GOSUB L_104ab   '@10893
RETURN L_101e3   '@108aa
' ---- F_108ad @0x108ad  (0108ad_F_108ad.lift.txt; evidence_id (assembly): ev_ec7a50918e46715fea219499fd44758c0cfd1aba0c61ec56901f5d41aca52149)
L_108b2:   ' entrada vinda de 010030_M_FORMINIT
RESUME L_108c9   '@108b7
L_108c9:
ON ERROR GOTO L_108b2
RT_ONERR = &H108b2   '@108ce
CALL S_110ba   '@108dd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10751, L_1077c, L_10884   ' ON KEY pelo roteiro (entre comandos)
GOTO L_110b2   '@108e7
' ---- FUN_1000_10b2 @0x110b2  (0110b2_FUN_1000_10b2.lift.txt; evidence_id (assembly): ev_5350054b4ce7cc4c32937c7a2f8d74d941e1d0cb8a2e4bd5733c923fbfa5c8db)
L_110b2:   ' entrada vinda de 0108ad_F_108ad
GOTO L_1122f   '@110b2
' ---- FUN_1000_122f @0x1122f  (01122f_FUN_1000_122f.lift.txt; evidence_id (assembly): ev_e64f08512177ce38aaf63c323f6ec93b7365258fa510bdd4c1b5c303407654b9)
L_1122f:   ' entrada vinda de 0110b2_FUN_1000_10b2
GOTO L_1169d   '@1122f
' ---- FUN_1000_169d @0x1169d  (01169d_FUN_1000_169d.lift.txt; evidence_id (assembly): ev_a0eaa0525df7f332a7f8093649cef9f84ac1594f3b7d57175a273373c9d72b0f)
L_1169d:   ' entrada vinda de 01122f_FUN_1000_122f
GOTO L_12965   '@1169d
' ---- FUN_1000_2965 @0x12965  (012965_FUN_1000_2965.lift.txt; evidence_id (assembly): ev_5a1c36a262b79dbe00d1b036ae2e21385dc67990362afcaba7e820c42d45e962)
L_12965:   ' entrada vinda de 01169d_FUN_1000_169d
GOTO L_16a65   '@12965
' ---- FUN_1000_6a65 @0x16a65  (016a65_FUN_1000_6a65.lift.txt; evidence_id (assembly): ev_2aac90ae10ee359383efec3d3ead7ae0b21edbe94ed14f28263351ca6c83f5ae)
L_16a65:   ' entrada vinda de 012965_FUN_1000_2965
GOTO L_17d0c   '@16a65
' ---- FUN_1000_7d0c @0x17d0c  (017d0c_FUN_1000_7d0c.lift.txt; evidence_id (assembly): ev_b01139d7c8fd954bdc64f86b41178f5a8f955f58de2a513be2c5c15f20817390)
L_17d0c:   ' entrada vinda de 016a65_FUN_1000_6a65
GOTO L_180fd   '@17d0c
' ---- FUN_1000_80fd @0x180fd  (0180fd_FUN_1000_80fd.lift.txt; evidence_id (assembly): ev_4abae380bf83cf7b445a5e935c3fbb619a6e6f9e825833ff859f0e2ea1635a22)
L_180fd:   ' entrada vinda de 017d0c_FUN_1000_7d0c
GOTO L_199ca   '@180fd
' ---- F_199ca @0x199ca  (0199ca_F_199ca.lift.txt; evidence_id (assembly): ev_88fe64a3b10ab1f7b609f2a53aa05fd38a9a84a352afa1330e4f5a62107ec231)
L_199ca:   ' entrada vinda de 0180fd_FUN_1000_80fd
RT_FIM   ' @199ca B$CENP (inicio/fim do modulo)
'RETRAD? @199cf ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
' ---- M_FORMINUX @0x20030  (020030_M_FORMINUX.lift.txt; evidence_id (assembly): ev_32fbc6217f296a301cc6c93ca742dd187fecddf1ccbaa1646c28fb1beffa586b)
' @20030 inicio do programa (B$?EVT)
GOTO L_20c92   '@2016b
' ---- FUN_2000_0c92 @0x20c92  (020c92_FUN_2000_0c92.lift.txt; evidence_id (assembly): ev_2945a406ca995e24566a8ca421608d18df1f5e1635feb1fcbaecfd069f45dede)
L_20c92:   ' entrada vinda de 020030_M_FORMINUX
GOTO L_2bcde   '@20c92
' ---- FUN_2000_bcde @0x2bcde  (02bcde_FUN_2000_bcde.lift.txt; evidence_id (assembly): ev_5af50549834a878162df990fab2004393c49a5d83a80403c70c03c4d06bb1f39)
L_2bcde:   ' entrada vinda de 020c92_FUN_2000_0c92
RT_FIM   ' @2bcde B$CENP (inicio/fim do modulo)
'RETRAD? @2bce3 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
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
    REDIM A_196c!(-32768 TO -32768, -32768 TO -32768)
    V_1866! = 0
    V_199a! = 0
    V_199e! = 0
    V_19a2! = 0
    V_19a6! = 0
    V_19aa! = 0
    V_19ae! = 0
    V_19b2! = 0
    V_19b6! = 0
    V_19ba! = 0
    V_19be! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_10751: BEEP; GOSUB L_104ab; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_1077c: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10884: sai da SUB (BEEP; GOSUB L_104ab; RETURN L_101e3)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H103c6: ON ERROR GOTO L_103c6
        CASE &H1083d: ON ERROR GOTO L_1083d
        CASE &H108b2: ON ERROR GOTO L_108b2
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_108ef   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x108ef)
    ' ---- FUN_1000_08ef @0x108ef  (0108ef_FUN_1000_08ef.lift.txt; evidence_id (assembly): ev_9bad4ce2dc781d92743fe332942694fc96086f96a7884cf75f5a55df12dd7612)
    V_0e14$ = "NAOCRUZA"   '@108f7 DS:1ba0
    IF NOT (V_19a2! < V_19b2! AND (V_19a2! < V_19aa! AND (V_199a! < V_19b2! AND V_199a! < V_19aa!))) THEN GOTO L_10985   '@10909
    GOTO L_110a0   '@1097d
L_10985:
    IF NOT (V_19b2! < V_19a2! AND (V_19b2! < V_199a! AND (V_19aa! < V_19a2! AND V_19aa! < V_199a!))) THEN GOTO L_10a01   '@10985
    GOTO L_110a0   '@109f9
L_10a01:
    IF NOT (V_19a6! < V_19b6! AND (V_19a6! < V_19ae! AND (V_199e! < V_19b6! AND V_199e! < V_19ae!))) THEN GOTO L_10a7d   '@10a01
    GOTO L_110a0   '@10a75
L_10a7d:
    IF NOT (V_19b6! < V_19a6! AND (V_19b6! < V_199e! AND (V_19ae! < V_19a6! AND V_19ae! < V_199e!))) THEN GOTO L_10af9   '@10a7d
    GOTO L_110a0   '@10af1
L_10af9:
    IF NOT (V_199e! = V_19ae! AND (V_19ae! = V_19b6! AND V_199e! = V_19a6!)) THEN GOTO L_10b5a   '@10af9
    GOTO L_110a0   '@10b52
L_10b5a:
    IF NOT (V_199a! = V_19aa! AND (V_19aa! = V_19b2! AND V_199a! = V_19a2!)) THEN GOTO L_10bbb   '@10b5a
    GOTO L_110a0   '@10bb3
L_10bbb:
    IF NOT (V_199e! <> V_19a6! AND V_19ae! <> V_19b6!) THEN GOTO L_10c50   '@10bbb
    IF NOT (ABS((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)) < 0.0000999999974737875163555145263671875##) THEN GOTO L_10c4b   '@10bf9 DS:1bac
    GOTO L_110a0   '@10c43
L_10c4b:
L_10c50:
    IF NOT (V_19ae! = V_19b6! OR V_199e! = V_19a6!) THEN GOTO L_10cd3   '@10c50
    V_19be! = V_199e!   '@10c8e
    IF NOT (V_19ae! = V_19b6!) THEN GOTO L_10ccb   '@10c9f
    V_19be! = V_19ae!   '@10cba
L_10ccb:
    GOTO L_10d71   '@10ccb
L_10cd3:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@10cd3
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@10d27
L_10d71:
    IF NOT (V_19aa! = V_19b2! OR V_199a! = V_19a2!) THEN GOTO L_10df4   '@10d71
    V_19ba! = V_199a!   '@10daf
    IF NOT (V_19aa! = V_19b2!) THEN GOTO L_10dec   '@10dc0
    V_19ba! = V_19aa!   '@10ddb
L_10dec:
    GOTO L_10e91   '@10dec
L_10df4:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_10e4f   '@10df4
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@10e0f
    GOTO L_10e8c   '@10e47
L_10e4f:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@10e4f
L_10e8c:
L_10e91:
    IF NOT (V_19ba! < V_19b2! AND V_19ba! < V_19aa! OR V_19ba! < V_19a2! AND V_19ba! < V_199a!) THEN GOTO L_10f0d   '@10e91
    GOTO L_110a0   '@10f05
L_10f0d:
    IF NOT (V_19ba! > V_19b2! AND V_19ba! > V_19aa! OR V_19ba! > V_19a2! AND V_19ba! > V_199a!) THEN GOTO L_10f89   '@10f0d
    GOTO L_110a0   '@10f81
L_10f89:
    IF NOT (V_19be! < V_19b6! AND V_19be! < V_19ae! OR V_19be! < V_19a6! AND V_19be! < V_199e!) THEN GOTO L_11005   '@10f89
    GOTO L_110a0   '@10ffd
L_11005:
    IF NOT (V_19be! > V_19b6! AND V_19be! > V_19ae! OR V_19be! > V_19a6! AND V_19be! > V_199e!) THEN GOTO L_11081   '@11005
    GOTO L_110a0   '@11079
L_11081:
    V_0e14$ = "CRUZA"   '@11081 DS:1bb0
    GOTO L_110aa   '@11093
L_110a0:
L_110aa:
    ' END SUB   '@110aa
END SUB

SUB S_110ba   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x110ba)
    ' ---- FUN_1000_10ba @0x110ba  (0110ba_FUN_1000_10ba.lift.txt; evidence_id (assembly): ev_ba069abe423246c52ff7d85eaf0a70e984f9c1d5ad1d57e615258dcf02c8d421)
    BEEP   '@110c2
    BEEP   '@110cc
    BEEP   '@110d6
    RT_SCREEN 0   '@110e0
    RT_VIEWPRINT 1, 25   '@110f5
    RT_CLOSE   '@11107 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@11114 DS:1bba
    RT_CLS 0   '@11159
    LOCATE 10, 1   '@11166
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@11181 DS:19d0,1bbe
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@111a1 DS:19d0,1bd8
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@111c1 DS:19d0,1c04
L_111e6:
    CALL MIXT_07f1_LimpaTeclado   '@111eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@111f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@11211
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_111e6   '@1121b
    ' ---- F_11222 @0x11222  (011222_F_11222.lift.txt; evidence_id (assembly): ev_b987fa21f3c7d62fa94ef83f4a3a20fdb3a0887a2ff4100f95e0ecaf8d767664)
    ' END SUB   '@11222
END SUB

SUB S_11237   ' entrada de SUB/FUNCTION (B$ENRA, locais 18 bytes) (0x11237)
    DIM L_BP0c%
    DIM L_BP10!
    DIM L_BP14!
    DIM L_BP18!
    DIM L_BP1c!
    ' ---- FUN_1000_1237 @0x11237  (011237_FUN_1000_1237.lift.txt; evidence_id (assembly): ev_6aec7e143f4d177e28fadd77673d756c8ae3806232fa9c6b387e6e6b8abe5e61)
    LOCATE 24, 1   '@11244
    PRINT " Posicionando Bordos livres e Buracos na Forma.                      "   '@1125f DS:1c2a
    L_BP0c% = 0   '@1126d
    L_BP10! = 1.0   '@11277 DS:1b2c
L_1128c:
    IF NOT (L_BP0c% = 1) THEN GOTO L_112d9   '@11291
    REDIM A_1636!(-32768 TO -32768, -32768 TO -32768)   '@1129f
    REDIM A_1636!(0 TO CINT(L_BP10!), 0 TO 4)   '@112ad
L_112d9:
    V_11b8! = 0.0   '@112d9 DS:1c74
L_112f0:
    V_11b8! = FX##(V_11b8!) + 1.0   '@112f0 DS:1b2c
    IF NOT (A_0f5e!(RT_CINT%(FX##(V_11b8!)), 1) <> 2.0) THEN GOTO L_1163d   '@11306 DS:1c78
    L_BP14! = A_0f5e!(RT_CINT%(FX##(V_11b8!)), 0)   '@1133b
    L_BP18! = A_0f30%(RT_CINT%(FX##(L_BP14!)), 0) - 1   '@11364
    FOR V_11c0! = 1.0 TO L_BP18!   '@11392 DS:1b2c
    IF NOT (A_0f8c%(RT_CINT%(FX##(L_BP14!)), RT_CINT%(FX##(V_11c0!))) = 1) THEN GOTO L_1160d   '@1139a
    IF NOT (L_BP0c% = 0) THEN GOTO L_113f5   '@113cb
    L_BP10! = FX##(L_BP10!) + 1.0   '@113d9 DS:1b2c
    GOTO L_11608   '@113ed
L_113f5:
    L_BP1c! = FX##(A_1636!(0, 0)) + 1.0   '@113f5 DS:1b2c
    A_1636!(RT_CINT%(FX##(L_BP1c!)), 0) = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP14!)), RT_CINT%(FX##(V_11c0!))), 0)) * 100.0   '@11419 DS:1c7c
    A_1636!(RT_CINT%(FX##(L_BP1c!)), 1) = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP14!)), RT_CINT%(FX##(V_11c0!))), 1)) * 100.0   '@11479 DS:1c7c
    A_1636!(RT_CINT%(FX##(L_BP1c!)), 2) = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP14!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 0)) * 100.0   '@114db DS:1b2c,1c7c
    A_1636!(RT_CINT%(FX##(L_BP1c!)), 3) = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP14!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 1)) * 100.0   '@1153e DS:1b2c,1c7c
    A_1636!(RT_CINT%(FX##(L_BP1c!)), 4) = V_11b8!   '@115a5
    A_1636!(0, 0) = FX##(A_1636!(0, 0)) + 1.0   '@115cf DS:1b2c
L_11608:
L_1160d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@1160d DS:1b2c
L_1163d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0f30%(0, 0) <= V_11b8!) THEN GOTO L_112f0   '@1163d
    IF NOT (L_BP0c% = 0) THEN GOTO L_11690   '@1166b
    L_BP0c% = 1   '@11679
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1128c   '@11683
L_11690:
    ' END SUB   '@11690
END SUB

SUB S_116a5   ' entrada de SUB/FUNCTION (B$ENRA, locais 42 bytes) (0x116a5)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    ' ---- FUN_1000_16a5 @0x116a5  (0116a5_FUN_1000_16a5.lift.txt; evidence_id (assembly): ev_236ca02002a61e79dbeb53fcbf0d20609408f4ad014074a0a36288b27d7942ae)
    REDIM A_15da!(-32768 TO -32768, -32768 TO -32768)   '@116ad
    REDIM A_15da!(0 TO A_15ac%(0), 0 TO 5)   '@116bb
    LOCATE 24, 1   '@116f5
    PRINT " Posicionando Secao dos Pilares na forma.                            ";   '@11710 DS:1c80
    A_15da!(0, 0) = A_15ac%(0)   '@1171e
    L_BP22! = A_15da!(0, 0)   '@11750
    FOR V_11b8! = 1.0 TO L_BP22!   '@11770 DS:1b2c
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@11778
    IF NOT (V_11bc! > 0.0) THEN GOTO L_1292d   '@117a3 DS:1c74
    IF NOT (V_11b8! = 1.0) THEN GOTO L_117f2   '@117be DS:1b2c
    V_11cc! = 1.0   '@117d9 DS:1b2c
    GOTO L_118b5   '@117ea
L_117f2:
    L_BP0e! = 1.0   '@117f2 DS:1b2c
    V_11cc! = 2.0   '@11802 DS:1c78
L_11818:
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11cc!) - 1.0)) <> A_0fba$(RT_CINT%(FX##(V_11cc!)))) THEN GOTO L_11870   '@11818 DS:1cca
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@1185c DS:1b2c
L_11870:
    IF NOT (L_BP0e! = V_11b8!) THEN GOTO L_11892   '@11870
    GOTO L_118b0   '@1188a
L_11892:
    V_11cc! = FX##(V_11cc!) + 1.0   '@11892 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11818   '@118a8
L_118b0:
L_118b5:
    V_13aa% = 0   '@118b5
L_118c6:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_1191d   '@118c6
    GOTO L_1192e   '@11915
L_1191d:
    V_13aa% = V_13aa% + 1   '@1191d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_118c6   '@11926
L_1192e:
    L_BP24% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@1192e
    IF NOT (L_BP24% = 1) THEN GOTO L_11c36   '@11958
    V_11d4! = (FX##(A_0fe8!(RT_CINT%(FX##(V_11cc!)), 0)) + A_0fe8!(RT_CINT%(FX##(V_11cc!)), 2)) / 2.0   '@11966 DS:1c78
    V_11d8! = (FX##(A_0fe8!(RT_CINT%(FX##(V_11cc!)), 1)) + A_0fe8!(RT_CINT%(FX##(V_11cc!)), 3)) / 2.0   '@119b1 DS:1c78
    L_BP1a! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@11a00
    V_11c8! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@11a32
    L_BP1e! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 3)   '@11a65
    A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0   '@11a94 DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = 1.0   '@11abe DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = 100.0 * FX##(V_11d4!) + (FX##(V_11c8!) / 2.0 * RT_SIN##(FX##(L_BP1e!) * V_0e04# / 180.0#) - FX##(L_BP1a!) / 2.0 * RT_COS##(FX##(L_BP1e!) * V_0e04# / 180.0#))   '@11ae9 DS:1c78,1c7c,1cce
    A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = 0.0   '@11b5f DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0   '@11b8a DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = 100.0 * FX##(V_11d8!) - FX##(V_11c8!) / 2.0 * RT_COS##(FX##(L_BP1e!) * V_0e04# / 180.0#) - FX##(L_BP1a!) / 2.0 * RT_SIN##(FX##(L_BP1e!) * V_0e04# / 180.0#)   '@11bb5 DS:1c78,1c7c,1cce
    GOTO L_12928   '@11c2e
L_11c36:
    IF NOT (L_BP24% = 2) THEN GOTO L_11de9   '@11c36
    V_11d4! = (FX##(A_0fe8!(RT_CINT%(FX##(V_11cc!)), 0)) + A_0fe8!(RT_CINT%(FX##(V_11cc!)), 2)) / 2.0   '@11c3f DS:1c78
    V_11d8! = (FX##(A_0fe8!(RT_CINT%(FX##(V_11cc!)), 1)) + A_0fe8!(RT_CINT%(FX##(V_11cc!)), 3)) / 2.0   '@11c8a DS:1c78
    A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0   '@11cd9 DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = 1.0   '@11d03 DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = 100.0 * FX##(V_11d4!)   '@11d2e DS:1c7c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = 0.0   '@11d5b DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0   '@11d86 DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = 100.0 * FX##(V_11d8!)   '@11db1 DS:1c7c
    GOTO L_12928   '@11de1
L_11de9:
    IF NOT (L_BP24% = 3) THEN GOTO L_12928   '@11de9
    V_11c4! = 0.0   '@11df2 DS:1c74
    L_BP12! = 0.0   '@11e03 DS:1c74
    L_BP16! = 0.0   '@11e13 DS:1c74
    L_BP0e! = 0.0   '@11e23 DS:1c74
L_11e38:
    V_11c4! = RT_SQR##(RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 0)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 2)), (2.0)) + RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 1)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 3)), (2.0))) + V_11c4!   '@11e38 DS:1c78
    L_BP12! = RT_SQR##(RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 0)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 2)), (2.0)) + RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 1)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 3)), (2.0))) * (FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 1)) + A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 3)) / 2.0 + L_BP12!   '@11eef DS:1c78
    L_BP16! = RT_SQR##(RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 0)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 2)), (2.0)) + RT_POT##((FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 1)) - A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 3)), (2.0))) * (FX##(A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 0)) + A_0fe8!(RT_CINT%(FX##(L_BP0e!) + V_11cc!), 2)) / 2.0 + L_BP16!   '@11ff2 DS:1c78
    IF NOT (FX##(L_BP0e!) + V_11cc! >= FX##(A_0fe8!(0, 0))) THEN GOTO L_12127   '@120f1
    GOTO L_12198   '@1211f
L_12127:
    IF NOT (A_0fba$(RT_CINT%(FX##(L_BP0e!) + V_11cc!)) <> A_0fba$(RT_CINT%(FX##(L_BP0e!) + V_11cc! + 1.0))) THEN GOTO L_1217b   '@12127 DS:1b2c
    GOTO L_12198   '@12173
L_1217b:
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@1217b DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11e38   '@1218f
L_12198:
    IF NOT (V_11c4! > 0.0) THEN GOTO L_121e5   '@12198 DS:1c74
    V_11d4! = FX##(L_BP16!) / V_11c4!   '@121b3
    V_11d8! = FX##(L_BP12!) / V_11c4!   '@121c8
    GOTO L_1223f   '@121dd
L_121e5:
    V_11d4! = A_0fe8!(RT_CINT%(FX##(V_11cc!)), 0)   '@121e5
    V_11d8! = A_0fe8!(RT_CINT%(FX##(V_11cc!)), 1)   '@1220f
L_1223f:
    L_BP28! = 0.0   '@1223f DS:1c74
    L_BP2c! = 0.0   '@1224f DS:1c74
    L_BP30! = 0.0   '@1225f DS:1c74
    L_BP34! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@1226f
    FOR V_11c4! = 1.0 TO L_BP34!   '@122a2 DS:1b2c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > V_11c4!) THEN GOTO L_12398   '@122aa
    L_BP12! = A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!) + 1.0), 0)   '@122e7 DS:1b2c
    L_BP16! = A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!) + 1.0), 1)   '@1233b DS:1b2c
    GOTO L_1242b   '@12390
L_12398:
    L_BP12! = A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), 1, 0)   '@12398
    L_BP16! = A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), 1, 1)   '@123e0
L_1242b:
    L_BP0e! = FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 0)) * L_BP16! / 100.0 - FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 1)) * L_BP12! / 100.0   '@1242b DS:1c7c
    L_BP28! = (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 1)) / 10.0 + FX##(L_BP16!) / 10.0) * L_BP0e! / 6.0 + L_BP28!   '@124d4 DS:1b30,1cd6
    L_BP0e! = FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 0)) * L_BP16! / 100.0 - FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 1)) * L_BP12! / 100.0   '@12542 DS:1c7c
    L_BP2c! = (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 0)) / 10.0 + FX##(L_BP12!) / 10.0) * L_BP0e! / 6.0 + L_BP2c!   '@125eb DS:1b30,1cd6
    L_BP30! = (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 0)) / 10.0 + FX##(L_BP12!) / 10.0) * (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), RT_CINT%(FX##(V_11c4!)), 1)) / 10.0 - FX##(L_BP16!) / 10.0) / 2.0 + L_BP30!   '@12658 DS:1b30,1c78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c4!   '@1271a DS:1b2c
    L_BP28! = ABS(FX##(L_BP28!) / L_BP30!)   '@12745
    L_BP2c! = ABS(FX##(L_BP2c!) / L_BP30!)   '@1275b
    SWAP L_BP28!, L_BP2c!   '@1277c (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0   '@12788 DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = 1.0   '@127b2 DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = 100.0 * FX##(V_11d4!) + (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), 1, 0)) / 10.0 - L_BP28!)   '@127dd DS:1b30,1c7c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = 0.0   '@12853 DS:1c74
    A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0   '@1287e DS:1b2c
    A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = 100.0 * FX##(V_11d8!) + (FX##(A_14c4%(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1), 1, 1)) / 10.0 - L_BP2c!)   '@128a9 DS:1b30,1c7c
    GOTO L_12928   '@12920
L_12928:
L_1292d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@1292d DS:1b2c
    ' END SUB   '@12958
END SUB

SUB S_1296d   ' entrada de SUB/FUNCTION (B$ENRA, locais 288 bytes) (0x1296d)
    DIM L_BP0e!
    DIM L_BP10%
    DIM L_BP12%
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP54!
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP70!
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP88!
    DIM L_BP8c!
    DIM L_BP90!
    DIM L_BP94!
    DIM L_BP98!
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa4!
    DIM L_BPa8!
    DIM L_BPac!
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb8!
    DIM L_BPbc!
    DIM L_BPc0!
    DIM L_BPc4!
    DIM L_BPc8!
    DIM L_BPcc!
    DIM L_BPce%
    DIM L_BPd2!
    DIM L_BPd6!
    DIM L_BPda!
    DIM L_BPde!
    DIM L_BPe2!
    DIM L_BPe6!
    DIM L_BPea!
    DIM L_BPee!
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe!
    REDIM L_BP50%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_1000_296d @0x1296d  (01296d_FUN_1000_296d.lift.txt; evidence_id (assembly): ev_1315f319854777235383e7d3e12a00d1069d3da63d3ef2a33e76544134bbc642)
    REDIM L_BP50%(0 TO 1)   '@12984
    LOCATE 24, 1   '@129a1
    PRINT " Posicionando Vigas em planta na forma.                              "   '@129bc DS:1cda
    REDIM A_1608!(-32768 TO -32768, -32768 TO -32768)   '@129ca
    REDIM A_1608!(0 TO A_157e%(0) * 20, 0 TO 4)   '@129d8
    REDIM A_17d4!(-32768 TO -32768, -32768 TO -32768)   '@12a0b
    REDIM A_17d4!(0 TO A_157e%(0) * 20, 0 TO 8)   '@12a19
    L_BP3a! = 0.00200000009499490261077880859375##   '@12a4f DS:1d24
    L_BP3e! = 0.00999999977648258209228515625##   '@12a5f DS:1d28
    A_1608!(0, 0) = 0.0   '@12a6f DS:1c74
    L_BP54! = A_157e%(0)   '@12a8f
    FOR V_11b8! = 1.0 TO L_BP54!   '@12ab2 DS:1b2c
    IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_15d72   '@12aba
    V_199a! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), 1), 0)   '@12ae1
    V_199e! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), 1), 1)   '@12b1e
    V_19a2! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), A_1044%(RT_CINT%(FX##(V_11b8!)), 0)), 0)   '@12b5c
    V_19a6! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), A_1044%(RT_CINT%(FX##(V_11b8!)), 0)), 1)   '@12baf
    L_BP58! = A_0f02!(0, 0)   '@12c03
    FOR V_11cc! = 1.0 TO L_BP58!   '@12c23 DS:1b2c
    IF NOT (ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 1)) - V_19a6!) < FX##(L_BP3e!) AND ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) - V_19a2!) < FX##(L_BP3e!) OR ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 1)) - V_199e!) < FX##(L_BP3e!) AND ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) - V_199a!) < FX##(L_BP3e!)) THEN GOTO L_12d2e   '@12c2a
    GOTO L_1376e   '@12d26
L_12d2e:
    IF NOT (V_199a! = V_19a2!) THEN GOTO L_13030   '@12d2e
    IF NOT (ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) - V_199a!) > 0.00999999977648258209228515625##) THEN GOTO L_12d8d   '@12d49 DS:1d28
    GOTO L_1376e   '@12d85
L_12d8d:
    CALL MIXT_0877_Menor(V_199e!, V_19a6!, L_BP5c!)   '@12d8d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_199e!, V_19a6!, L_BP60!)   '@12da3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_0f02!(RT_CINT%(FX##(V_11cc!)), 1) > L_BP60! OR A_0f02!(RT_CINT%(FX##(V_11cc!)), 1) < L_BP5c!) THEN GOTO L_12e29   '@12db5
    GOTO L_1376e   '@12e21
L_12e29:
    L_BP64! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@12e29
    FOR V_11c0! = 1.0 TO L_BP64!   '@12e57 DS:1b2c
    IF NOT (A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))), 1) > A_0f02!(RT_CINT%(FX##(V_11cc!)), 1)) THEN GOTO L_12f80   '@12e5e
    L_BP68! = V_11c0!   '@12ec7
    FOR L_BP6c! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) TO L_BP68! STEP -1.0   '@12ed8 DS:1cca
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!) + 1.0)) = A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!)))   '@12efc DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP6c!   '@12f4e DS:1cca
    GOTO L_12fab   '@12f73
L_12f80:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@12f80 DS:1b2c
L_12fab:
    A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) + 1   '@12fab
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(V_11cc!))   '@12feb
    GOTO L_1376e   '@13023
L_13030:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_13330   '@13030
    IF NOT (ABS(FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 1)) - V_199e!) > 0.00999999977648258209228515625##) THEN GOTO L_13090   '@1304b DS:1d28
    GOTO L_1376e   '@13088
L_13090:
    CALL MIXT_0877_Menor(V_199a!, V_19a2!, L_BP70!)   '@13090
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_199a!, V_19a2!, L_BP74!)   '@130a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_0f02!(RT_CINT%(FX##(V_11cc!)), 0) > L_BP74! OR A_0f02!(RT_CINT%(FX##(V_11cc!)), 0) < L_BP70!) THEN GOTO L_1312a   '@130b8
    GOTO L_1376e   '@13122
L_1312a:
    L_BP78! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@1312a
    FOR V_11c0! = 1.0 TO L_BP78!   '@13158 DS:1b2c
    IF NOT (A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))), 0) > A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) THEN GOTO L_13280   '@13160
    L_BP7c! = V_11c0!   '@131c7
    FOR L_BP6c! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) TO L_BP7c! STEP -1.0   '@131d8 DS:1cca
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!) + 1.0)) = A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!)))   '@131fc DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP6c!   '@1324e DS:1cca
    GOTO L_132ab   '@13273
L_13280:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@13280 DS:1b2c
L_132ab:
    A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) + 1   '@132ab
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(V_11cc!))   '@132eb
    GOTO L_1376e   '@13323
L_13330:
    IF NOT (ABS(FX##(V_19a2!) - A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) < 0.00999999977648258209228515625## OR ABS(FX##(V_199a!) - A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) < 0.00999999977648258209228515625##) THEN GOTO L_133ba   '@13330 DS:1d28
    GOTO L_1376e   '@133b2
L_133ba:
    CALL MIXT_082a_Maior(V_199a!, V_19a2!, L_BP80!)   '@133ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_199a!, V_19a2!, L_BP84!)   '@133d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_199e!, V_19a6!, L_BP88!)   '@133e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_199e!, V_19a6!, L_BP8c!)   '@133f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_0f02!(RT_CINT%(FX##(V_11cc!)), 1) < L_BP8c! OR (A_0f02!(RT_CINT%(FX##(V_11cc!)), 1) > L_BP88! OR (A_0f02!(RT_CINT%(FX##(V_11cc!)), 0) < L_BP84! OR A_0f02!(RT_CINT%(FX##(V_11cc!)), 0) > L_BP80!))) THEN GOTO L_134e8   '@13407
    GOTO L_1376e   '@134e0
L_134e8:
    IF NOT (ABS(A_0f02!(RT_CINT%(FX##(V_11cc!)), 1) - ((FX##(V_19a6!) - V_199e!) * (FX##(A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) - V_199a!) / (FX##(V_19a2!) - V_199a!) + V_199e!)) > FX##(L_BP3a!)) THEN GOTO L_1356c   '@134e8
    GOTO L_1376e   '@13564
L_1356c:
    L_BP90! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@1356c
    FOR V_11c0! = 1.0 TO L_BP90!   '@1359b DS:1b2c
    IF NOT (A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))), 0) > A_0f02!(RT_CINT%(FX##(V_11cc!)), 0)) THEN GOTO L_136c5   '@135a2
    L_BP94! = V_11c0!   '@13609
    FOR L_BP6c! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) TO L_BP94! STEP -1.0   '@1361b DS:1cca
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!) + 1.0)) = A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BP6c!)))   '@13640 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP6c!   '@13692 DS:1cca
    GOTO L_136f1   '@136b8
L_136c5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@136c5 DS:1b2c
L_136f1:
    A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = A_1044%(RT_CINT%(FX##(V_11b8!)), 0) + 1   '@136f1
    A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(V_11cc!))   '@13731
L_1376e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@13773 DS:1b2c
    ERASE L_BP50%   '@1379e
    REDIM L_BP50%(0 TO 50)   '@137ac
    L_BP98! = A_1044%(RT_CINT%(FX##(V_11b8!)), 0)   '@137c9
    FOR V_11c0! = 1.0 TO L_BP98!   '@137f8 DS:1b2c
    V_199a! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))), 0)   '@13800
    V_199e! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!))), 1)   '@13844
    IF NOT (L_BP50%(RT_CINT%(FX##(V_11c0!))) = 0) THEN GOTO L_144de   '@13889
    L_BP9c! = A_0fe8!(0, 0)   '@138b0
    FOR L_BP6c! = 1.0 TO L_BP9c!   '@138d1 DS:1b2c
    IF NOT ((ABS(FX##(V_199e!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)) > 0.00999999977648258209228515625## OR ABS(FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)) > 0.00999999977648258209228515625##) AND (A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3) AND A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2))) THEN GOTO L_139fb   '@138d8 DS:1d28
    GOTO L_144ab   '@139f3
L_139fb:
    IF NOT (A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)) THEN GOTO L_13c5b   '@139fb
    IF NOT (ABS(FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)) > 0.00999999977648258209228515625##) THEN GOTO L_13a87   '@13a44 DS:1d28
    GOTO L_144ab   '@13a7f
L_13a87:
    L_BPa0! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)   '@13a87
    L_BPa4! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)   '@13ab2
    CALL MIXT_0877_Menor(L_BPa0!, L_BPa4!, L_BPa8!)   '@13ad6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3) = L_BPa4!   '@13aeb
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = L_BPa0!   '@13b10
    L_BPac! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)   '@13b35
    L_BPb0! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)   '@13b5a
    CALL MIXT_082a_Maior(L_BPac!, L_BPb0!, L_BPb4!)   '@13b7e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3) = L_BPb0!   '@13b93
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = L_BPac!   '@13bb8
    IF NOT (V_199e! > L_BPb4! OR V_199e! < L_BPa8!) THEN GOTO L_13c1d   '@13bdd
    GOTO L_144ab   '@13c15
L_13c1d:
    L_BP50%(RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(L_BP6c!) + 1000.0)   '@13c1d DS:1d2c
    GOTO L_144d9   '@13c4e
L_13c5b:
    IF NOT (A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)) THEN GOTO L_13eb0   '@13c5b
    IF NOT (ABS(FX##(V_199e!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)) > 0.00999999977648258209228515625##) THEN GOTO L_13cec   '@13ca8 DS:1d28
    GOTO L_144ab   '@13ce4
L_13cec:
    L_BPb8! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)   '@13cec
    L_BPbc! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)   '@13d16
    CALL MIXT_0877_Menor(L_BPb8!, L_BPbc!, L_BPc0!)   '@13d37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2) = L_BPbc!   '@13d4c
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = L_BPb8!   '@13d6e
    L_BPc4! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)   '@13d92
    L_BPc8! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)   '@13db6
    CALL MIXT_082a_Maior(L_BPc4!, L_BPc8!, L_BPcc!)   '@13dd7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2) = L_BPc8!   '@13dec
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = L_BPc4!   '@13e0e
    IF NOT (V_199a! > L_BPcc! OR V_199a! < L_BPc0!) THEN GOTO L_13e72   '@13e32
    GOTO L_144ab   '@13e6a
L_13e72:
    L_BP50%(RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(L_BP6c!) + 1000.0)   '@13e72 DS:1d2c
    GOTO L_144d9   '@13ea3
L_13eb0:
    L_BPce% = (RT_POT##((FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)), (2.0)) + RT_POT##((FX##(V_199e!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)), (2.0)) < 0.00999999977648258209228515625##)   '@13eb0 DS:1c78,1d28
    IF NOT ((RT_POT##((FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)), (2.0)) + RT_POT##((FX##(V_199e!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)), (2.0)) < 0.00999999977648258209228515625## OR L_BPce%) <> 0) THEN GOTO L_13fe8   '@13f5b DS:1c78
    L_BP50%(RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(L_BP6c!) + 1000.0)   '@13faa DS:1d2c
    GOTO L_144d9   '@13fdb
L_13fe8:
    IF NOT (ABS(FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)) < 0.00999999977648258209228515625## OR ABS(FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)) < 0.00999999977648258209228515625##) THEN GOTO L_1406e   '@13fe8 DS:1d28
    GOTO L_144ab   '@14066
L_1406e:
    L_BPd2! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)   '@1406e
    L_BPd6! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)   '@14098
    CALL MIXT_0877_Menor(L_BPd2!, L_BPd6!, L_BPda!)   '@140b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2) = L_BPd6!   '@140ce
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = L_BPd2!   '@140f0
    L_BPde! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)   '@14114
    L_BPe2! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)   '@14138
    CALL MIXT_082a_Maior(L_BPde!, L_BPe2!, L_BPe6!)   '@14159
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2) = L_BPe2!   '@1416e
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0) = L_BPde!   '@14190
    IF NOT (V_199a! > L_BPe6! OR V_199a! < L_BPda!) THEN GOTO L_141f4   '@141b4
    GOTO L_144ab   '@141ec
L_141f4:
    L_BPea! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)   '@141f4
    L_BPee! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)   '@1421f
    CALL MIXT_0877_Menor(L_BPea!, L_BPee!, L_BPf2!)   '@14243
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3) = L_BPee!   '@14258
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = L_BPea!   '@1427d
    L_BPf6! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)   '@142a2
    L_BPfa! = A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)   '@142c7
    CALL MIXT_082a_Maior(L_BPf6!, L_BPfa!, L_BPfe!)   '@142eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3) = L_BPfa!   '@14300
    A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1) = L_BPf6!   '@14325
    IF NOT (V_199e! > L_BPfe! OR V_199e! < L_BPf2!) THEN GOTO L_1438a   '@1434a
    GOTO L_144ab   '@14382
L_1438a:
    IF NOT (ABS(V_199e! - ((FX##(A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 3)) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1)) * (FX##(V_199a!) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)) / (FX##(A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 2)) - A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 0)) + A_0fe8!(RT_CINT%(FX##(L_BP6c!)), 1))) > 0.00999999977648258209228515625##) THEN GOTO L_1446d   '@1438a DS:1d28
    GOTO L_144ab   '@14465
L_1446d:
    L_BP50%(RT_CINT%(FX##(V_11c0!))) = RT_CINT%(FX##(L_BP6c!) + 1000.0)   '@1446d DS:1d2c
    GOTO L_144d9   '@1449e
L_144ab:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP6c!   '@144b0 DS:1b2c
L_144d9:
L_144de:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@144de DS:1b2c
    L_BP12% = 0   '@1450a
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 1) = 0.0) THEN GOTO L_14566   '@14514 DS:1c74
    L_BP12% = 1   '@1455c
L_14566:
    L_BP100% = 1   '@14566
    L_BP16! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP100%), 0)   '@14571
    L_BP1a! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP100%), 1)   '@145ad
    L_BP102% = L_BP100%   '@145ea
    IF NOT (L_BP50%(L_BP100%) = 0 OR L_BP12% = 0 AND L_BP100% = 1) THEN GOTO L_146bb   '@145f7
    V_19aa! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP102%), 0)   '@14638
    V_19ae! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP102%), 1)   '@14675
    GOTO L_14847   '@146b3
L_146bb:
L_146c0:
    V_19aa! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP102%), 0)   '@146c0
    V_19ae! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP102%), 1)   '@146fd
    IF NOT (L_BP102% + 1 >= A_1044%(RT_CINT%(FX##(V_11b8!)), 0)) THEN GOTO L_14775   '@1473b
    GOTO L_14842   '@1476d
L_14775:
    IF NOT (L_BP50%(L_BP102%) > 1000) THEN GOTO L_14824   '@14775
    IF NOT (L_BP50%(L_BP102% + 1) = 0) THEN GOTO L_147c0   '@14796
    GOTO L_14842   '@147b8
L_147c0:
    IF NOT (A_0fba$(L_BP50%(L_BP102%) - 1000) <> A_0fba$(L_BP50%(1 + L_BP102%) - 1000)) THEN GOTO L_1481c   '@147c0
    GOTO L_14842   '@14814
L_1481c:
    GOTO L_14831   '@1481c
L_14824:
    GOTO L_14842   '@14824
L_14831:
    L_BP102% = L_BP102% + 1   '@14831
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_146c0   '@1483a
L_14842:
L_14847:
L_1484c:
    L_BP104% = L_BP102% + 1   '@14851
    IF NOT (L_BP50%(L_BP104%) > 1000 OR A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = L_BP104%) THEN GOTO L_14934   '@1485f
    V_19b2! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP104%), 0)   '@148b1
    V_19b6! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP104%), 1)   '@148ee
    GOTO L_14b21   '@1492c
L_14934:
L_1493a:
    V_19b2! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP104%), 0)   '@1493a
    V_19b6! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP104%), 1)   '@14977
    IF NOT (A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = L_BP104%) THEN GOTO L_149e8   '@149b5
    GOTO L_14b1c   '@149e0
L_149e8:
    IF NOT (L_BP50%(L_BP104%) > 1000) THEN GOTO L_14a11   '@149e8
    GOTO L_14b1c   '@14a09
L_14a11:
    IF NOT (ABS(RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19aa!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19ae!), (2.0))) - A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 3)) < 0.00999999977648258209228515625##) THEN GOTO L_14a92   '@14a11 DS:1c78,1d28
    GOTO L_14b1c   '@14a8a
L_14a92:
    IF NOT (RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19aa!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19ae!), (2.0))) > FX##(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 3))) THEN GOTO L_14b0b   '@14a92 DS:1c78
    GOTO L_14b1c   '@14b03
L_14b0b:
    L_BP104% = L_BP104% + 1   '@14b0b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1493a   '@14b14
L_14b1c:
L_14b21:
    L_BP106% = L_BP104%   '@14b21
    IF NOT (L_BP50%(L_BP104%) = 0 OR A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = L_BP104%) THEN GOTO L_14c02   '@14b2e
    L_BP10a! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP106%), 0)   '@14b7f
    L_BP10e! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP106%), 1)   '@14bbc
    GOTO L_14d89   '@14bfa
L_14c02:
L_14c08:
    L_BP10a! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP106%), 0)   '@14c08
    L_BP10e! = A_0f02!(A_1044%(RT_CINT%(FX##(V_11b8!)), L_BP106%), 1)   '@14c45
    IF NOT (A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = L_BP106%) THEN GOTO L_14cb6   '@14c83
    GOTO L_14d84   '@14cae
L_14cb6:
    IF NOT (L_BP50%(L_BP106%) > 1000) THEN GOTO L_14d65   '@14cb6
    IF NOT (L_BP50%(L_BP106% + 1) = 0) THEN GOTO L_14d01   '@14cd7
    GOTO L_14d84   '@14cf9
L_14d01:
    IF NOT (A_0fba$(L_BP50%(L_BP106%) - 1000) <> A_0fba$(L_BP50%(1 + L_BP106%) - 1000)) THEN GOTO L_14d5d   '@14d01
    GOTO L_14d84   '@14d55
L_14d5d:
    GOTO L_14d72   '@14d5d
L_14d65:
    GOTO L_14d84   '@14d65
L_14d72:
    L_BP106% = L_BP106% + 1   '@14d72
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14c08   '@14d7b
L_14d84:
L_14d89:
    IF NOT (L_BP100% = 1) THEN GOTO L_14dc0   '@14d89
    L_BP112! = L_BP16!   '@14d98
    L_BP116! = L_BP1a!   '@14da8
    GOTO L_14df9   '@14db8
L_14dc0:
    L_BP112! = (FX##(L_BP16!) + V_19aa!) / 2.0   '@14dc0 DS:1c78
    L_BP116! = (FX##(L_BP1a!) + V_19ae!) / 2.0   '@14dda DS:1c78
L_14df9:
    IF NOT (A_1044%(RT_CINT%(FX##(V_11b8!)), 0) = L_BP106%) THEN GOTO L_14e4e   '@14df9
    L_BP11a! = L_BP10a!   '@14e24
    L_BP11e! = L_BP10e!   '@14e35
    GOTO L_14e89   '@14e46
L_14e4e:
    L_BP11a! = (FX##(L_BP10a!) + V_19b2!) / 2.0   '@14e4e DS:1c78
    L_BP11e! = (FX##(L_BP10e!) + V_19b6!) / 2.0   '@14e69 DS:1c78
L_14e89:
    IF NOT (L_BP116! <= L_BP11e! AND L_BP112! < L_BP11a!) THEN GOTO L_14ef5   '@14e89
    L_BP0e! = ATN((FX##(L_BP11e!) - L_BP116!) / (FX##(L_BP11a!) - L_BP112!))   '@14ec7
L_14ef5:
    IF NOT (L_BP116! < L_BP11e! AND L_BP112! >= L_BP11a!) THEN GOTO L_14f6e   '@14ef5
    L_BP0e! = FX##(V_0e04#) / 2.0# + ATN((FX##(L_BP112!) - L_BP11a!) / (FX##(L_BP11e!) - L_BP116!))   '@14f33 DS:1d30
L_14f6e:
    IF NOT (L_BP116! >= L_BP11e! AND L_BP112! > L_BP11a!) THEN GOTO L_14fdf   '@14f6e
    L_BP0e! = ATN((FX##(L_BP116!) - L_BP11e!) / (FX##(L_BP112!) - L_BP11a!)) + V_0e04#   '@14fac
L_14fdf:
    IF NOT (L_BP116! > L_BP11e! AND L_BP112! <= L_BP11a!) THEN GOTO L_1505d   '@14fdf
    L_BP0e! = 3.0# * FX##(V_0e04#) / 2.0# + ATN((FX##(L_BP11a!) - L_BP112!) / (FX##(L_BP116!) - L_BP11e!))   '@1501d DS:1d30,1d38
L_1505d:
    L_BP6c! = FX##(A_1608!(0, 0)) + 1.0   '@1505d DS:1b2c
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 0) = FX##(RT_CLNG&((FX##(L_BP112!) * 100.0 - RT_SIN##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@15081 DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 1) = FX##(RT_CLNG&((FX##(L_BP116!) * 100.0 + RT_COS##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@15106 DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 2) = FX##(RT_CLNG&((FX##(L_BP11a!) * 100.0 - RT_SIN##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@1518c DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 3) = FX##(RT_CLNG&((FX##(L_BP11e!) * 100.0 + RT_COS##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@1520f DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 4) = FX##(L_BP12%) / 100.0 + V_11b8!   '@15295 DS:1c7c
    L_BP6c! = FX##(A_1608!(0, 0)) + 2.0   '@152cc DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 0) = FX##(RT_CLNG&((FX##(L_BP112!) * 100.0 + RT_SIN##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@152f0 DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 1) = FX##(RT_CLNG&((FX##(L_BP116!) * 100.0 - RT_COS##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@15375 DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 2) = FX##(RT_CLNG&((FX##(L_BP11a!) * 100.0 + RT_SIN##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@153fb DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 3) = FX##(RT_CLNG&((FX##(L_BP11e!) * 100.0 - RT_COS##(FX##(L_BP0e!)) * A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP12%, 0) / 2.0) * 1000.0)) / 1000.0#   '@1547e DS:1c78,1c7c,1d2c,1d40
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 4) = FX##(L_BP12%) / 100.0 + V_11b8!   '@15504 DS:1c7c
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 2.0   '@1553b DS:1c78
    IF NOT (A_1608!(0, 0) > 2.0) THEN GOTO L_15c80   '@1556f DS:1c78
    L_BP6c! = A_1608!(0, 0)   '@15599
    IF NOT (INT(FX##(A_1608!(RT_CINT%(FX##(L_BP6c!) - 2.0), 4))) = INT(FX##(A_1608!(RT_CINT%(FX##(L_BP6c!)), 4)))) THEN GOTO L_15c7b   '@155b8 DS:1d48
    IF NOT (RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BP6c!) - 2.0), 2)) - A_1608!(RT_CINT%(FX##(L_BP6c!)), 0)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BP6c!) - 2.0), 3)) - A_1608!(RT_CINT%(FX##(L_BP6c!)), 1)), (2.0)) > FX##(2.0)) THEN GOTO L_15c76   '@15618 DS:1c78,1d48
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 0) = A_1608!(RT_CINT%(FX##(L_BP6c!)), 0)   '@156c7 DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 1) = A_1608!(RT_CINT%(FX##(L_BP6c!)), 1)   '@1570d DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 2) = A_1608!(RT_CINT%(FX##(L_BP6c!)), 2)   '@15755 DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 3) = A_1608!(RT_CINT%(FX##(L_BP6c!)), 3)   '@15797 DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 4) = A_1608!(RT_CINT%(FX##(L_BP6c!)), 4)   '@157df DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 0) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 0)   '@15827 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 1) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 1)   '@15872 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 2) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 2)   '@158bf DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 3) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 3)   '@15906 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 4) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 4)   '@15953 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 0) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 2.0), 2)   '@159a0 DS:1d48
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 1) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 2.0), 3)   '@159e4 DS:1d48
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 2) = A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 0)   '@15a2c DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 3) = A_1608!(RT_CINT%(FX##(L_BP6c!) + 2.0), 1)   '@15a70 DS:1c78
    A_1608!(RT_CINT%(FX##(L_BP6c!)), 4) = 0.0   '@15ab8 DS:1c74
    A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 0) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 3.0), 2)   '@15ae2 DS:1cca,1d4c
    A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 1) = A_1608!(RT_CINT%(FX##(L_BP6c!) - 3.0), 3)   '@15b2b DS:1cca,1d4c
    A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 2) = A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 0)   '@15b78 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 3) = A_1608!(RT_CINT%(FX##(L_BP6c!) + 1.0), 1)   '@15bc1 DS:1b2c,1cca
    A_1608!(RT_CINT%(FX##(L_BP6c!) - 1.0), 4) = 0.0   '@15c0e DS:1c74,1cca
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 2.0   '@15c3d DS:1c78
L_15c76:
L_15c7b:
L_15c80:
    L_BP12% = L_BP12% + 1   '@15c80
    IF NOT (L_BP12% <= FX##(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 0)) + A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 2)) THEN GOTO L_15d6d   '@15c88
    L_BP100% = L_BP104%   '@15d04
    L_BP102% = L_BP106%   '@15d11
    L_BP16! = V_19b2!   '@15d1e
    L_BP1a! = V_19b6!   '@15d2e
    V_19aa! = L_BP10a!   '@15d3e
    V_19ae! = L_BP10e!   '@15d4f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1484c   '@15d60
L_15d6d:
L_15d72:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@15d72 DS:1b2c
    L_BP10% = 0   '@15d9d
    A_1608!(0, 1) = FX##(A_1608!(0, 0)) + 50.0   '@15da7 DS:1d50
    V_11cc! = 0.0   '@15dde DS:1c74
L_15df4:
    V_11b8! = 1.0   '@15df9 DS:1b2c
L_15e10:
    IF NOT (A_1608!(0, 0) > V_11b8!) THEN GOTO L_16710   '@15e11
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@15e35
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@15e5f
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@15e8a
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@15eb2
    V_11bc! = FX##(V_11b8!) + 1.0   '@15edd DS:1b2c
L_15ef8:
    IF NOT (A_1608!(0, 0) >= V_11bc!) THEN GOTO L_166f2   '@15ef9
    IF NOT (INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4))) <> INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))) THEN GOTO L_166d3   '@15f1d
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11bc!)), 0)   '@15f7a
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11bc!)), 1)   '@15fa4
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11bc!)), 2)   '@15fcf
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11bc!)), 3)   '@15ff7
    CALL S_108ef   '@16022
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (FX##(V_19be!) < FX##(2000000.0#) AND FX##(V_19ba!) < FX##(2000000.0#)) THEN GOTO L_160b9   '@1602c DS:1d54
    V_19ba! = FX##(RT_CLNG&(1000.0 * FX##(V_19ba!))) / 1000.0#   '@1606a DS:1d2c,1d40
    V_19be! = FX##(RT_CLNG&(1000.0 * FX##(V_19be!))) / 1000.0#   '@1608f DS:1d2c,1d40
L_160b9:
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_166ce   '@160b9 DS:1bb0
    L_BP120% = (RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19aa!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19ae!), (2.0))) > 0.100000001490116119384765625##)   '@160d0 DS:1c78,1d5c
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19b6!), (2.0))) > 0.100000001490116119384765625## AND L_BP120%) <> 0) THEN GOTO L_163a3   '@16133 DS:1c78
    V_11cc! = FX##(V_11cc!) + 1.0   '@1616c DS:1b2c
    IF NOT (L_BP10% > 0) THEN GOTO L_1639e   '@16182
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 0) = V_19ba!   '@16190 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 1) = V_19be!   '@161ce DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 2) = A_1608!(RT_CINT%(FX##(V_11bc!)), 2)   '@1620d DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 3) = A_1608!(RT_CINT%(FX##(V_11bc!)), 3)   '@16260 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 4) = A_1608!(RT_CINT%(FX##(V_11bc!)), 4)   '@162b9 DS:1b2c
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 1.0   '@16312 DS:1b2c
    A_1608!(RT_CINT%(FX##(V_11bc!)), 2) = V_19ba!   '@16346
    A_1608!(RT_CINT%(FX##(V_11bc!)), 3) = V_19be!   '@1636e
L_1639e:
L_163a3:
    L_BP122% = (RT_SQR##(RT_POT##((FX##(V_19ba!) - V_199a!), (2.0)) + RT_POT##((FX##(V_19be!) - V_199e!), (2.0))) > 0.100000001490116119384765625##)   '@163a3 DS:1c78,1d5c
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19a6!), (2.0))) > 0.100000001490116119384765625## AND L_BP122%) <> 0) THEN GOTO L_166c9   '@16406 DS:1c78
    V_11cc! = FX##(V_11cc!) + 1.0   '@1643f DS:1b2c
    IF NOT (L_BP10% > 0) THEN GOTO L_166c4   '@16455
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 0) = V_19ba!   '@16463 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 1) = V_19be!   '@164a1 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 2) = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@164e0 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 3) = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@16533 DS:1b2c
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0)) + 1.0), 4) = A_1608!(RT_CINT%(FX##(V_11b8!)), 4)   '@1658c DS:1b2c
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 1.0   '@165e5 DS:1b2c
    A_1608!(RT_CINT%(FX##(V_11b8!)), 2) = V_19ba!   '@16619
    A_1608!(RT_CINT%(FX##(V_11b8!)), 3) = V_19be!   '@16641
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@1666c
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@16694
L_166c4:
L_166c9:
L_166ce:
L_166d3:
    V_11bc! = FX##(V_11bc!) + 1.0   '@166d3 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15ef8   '@166e9
L_166f2:
    V_11b8! = FX##(V_11b8!) + 1.0   '@166f2 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15e10   '@16708
L_16710:
    IF NOT (L_BP10% = 0 AND V_11cc! > 0.0) THEN GOTO L_16a4f   '@16710 DS:1c74
    REDIM A_1664!(-32768 TO -32768, -32768 TO -32768)   '@1673f
    REDIM A_1664!(0 TO CINT(A_1608!(0, 0)), 0 TO 4)   '@1674d
    L_BP126! = A_1608!(0, 0)   '@16782
    FOR V_11b8! = 0.0 TO L_BP126!   '@167a3 DS:1b2c,1c74
    FOR V_11bc! = 0.0 TO 4.0   '@167aa DS:1b2c,1bba,1c74
    A_1664!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!))) = A_1608!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@167b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@1680b DS:1b2c,1bba
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@16834 DS:1b2c
    V_11cc! = FX##(A_1608!(0, 0)) + V_11cc! + 50.0   '@16860 DS:1d50
    REDIM A_1608!(-32768 TO -32768, -32768 TO -32768)   '@1688a
    REDIM A_1608!(0 TO CINT(V_11cc!), 0 TO 4)   '@16898
    A_1608!(0, 0) = A_1664!(0, 0)   '@168c0
    A_1608!(0, 1) = V_11cc!   '@168ef
    REDIM A_17d4!(-32768 TO -32768, -32768 TO -32768)   '@16912
    REDIM A_17d4!(0 TO CINT(V_11cc!), 0 TO 8)   '@16920
    L_BP12a! = A_1608!(0, 0)   '@1694b
    FOR V_11b8! = 1.0 TO L_BP12a!   '@1696c DS:1b2c
    FOR V_11bc! = 0.0 TO 4.0   '@16974 DS:1b2c,1bba,1c74
    A_1608!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!))) = A_1664!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@16982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@169d5 DS:1b2c,1bba
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@169fe DS:1b2c
    REDIM A_1664!(-32768 TO -32768, -32768 TO -32768)   '@16a2a
    L_BP10% = 1   '@16a38
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15df4   '@16a42
L_16a4f:
    ERASE L_BP50%   '@16a4f
    ' END SUB   '@16a5d
END SUB

SUB S_16a6d   ' entrada de SUB/FUNCTION (B$ENRA, locais 50 bytes) (0x16a6d)
    DIM L_BP0c%
    DIM L_BP10!
    DIM L_BP14!
    DIM L_BP16%
    DIM L_BP1a!
    DIM L_BP1c%
    DIM L_BP1e%
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP28!
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    ' ---- FUN_1000_6a6d @0x16a6d  (016a6d_FUN_1000_6a6d.lift.txt; evidence_id (assembly): ev_cc52841a7c9c41bfe8d90f444a4a9691434b146e5085bc770bce651c585e2dbc)
    REDIM A_196c!(-32768 TO -32768, -32768 TO -32768)   '@16a7a
    REDIM A_196c!(0 TO CINT(A_15da!(0, 0)), 0 TO 4)   '@16a88
L_16ac2:
    L_BP0c% = 0   '@16ac7
    L_BP10! = A_15da!(0, 0)   '@16ad1
    FOR V_11c0! = 1.0 TO L_BP10!   '@16af1 DS:1b2c
    IF NOT (NOT (A_196c!(RT_CINT%(FX##(V_11c0!)), 0) = 0.0 AND ((A_15da!(RT_CINT%(FX##(V_11c0!)), 3) <> -2.0 OR A_196c!(RT_CINT%(FX##(V_11c0!)), 4) = 1.0) AND (A_15da!(RT_CINT%(FX##(V_11c0!)), 0) <> -2.0 OR A_196c!(RT_CINT%(FX##(V_11c0!)), 3) = 1.0)))) THEN GOTO L_16c19   '@16af8 DS:1b2c,1c74,1d48
    GOTO L_17cb9   '@16c11
L_16c19:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11c0!)))   '@16c19
    IF NOT (V_11bc! <= 0.0) THEN GOTO L_16c67   '@16c44 DS:1c74
    GOTO L_17cb9   '@16c5f
L_16c67:
    CALL S_20173   '@16c67
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP14! = A_15da!(RT_CINT%(FX##(V_11c0!)), 0)   '@16c71
    IF NOT (L_BP14! = 0.0) THEN GOTO L_16d9c   '@16c9a DS:1c74
    L_BP16% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@16cb4
    IF NOT (L_BP16% <> 1) THEN GOTO L_16cf5   '@16cde
    IF NOT (L_BP16% = 3) THEN GOTO L_16d5c   '@16cec
L_16cf5:
    L_BP1a! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1))), 0)   '@16cf5
    GOTO L_16d94   '@16d54
L_16d5c:
    IF NOT (L_BP16% = 2) THEN GOTO L_16d94   '@16d5c
    L_BP1a! = A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@16d65
    GOTO L_16d94   '@16d8c
L_16d94:
    GOTO L_170da   '@16d94
L_16d9c:
    IF NOT (L_BP14! = -1.0) THEN GOTO L_16f54   '@16d9d DS:1cca
    L_BP1c% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@16db1
    IF NOT (L_BP1c% <> 1) THEN GOTO L_16df2   '@16ddb
    IF NOT (L_BP1c% = 3) THEN GOTO L_16ecf   '@16de9
L_16df2:
    L_BP1a! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))) * 100.0), 0))   '@16df2 DS:1c7c
    GOTO L_16f4c   '@16ec7
L_16ecf:
    IF NOT (L_BP1c% = 2) THEN GOTO L_16f4c   '@16ecf
    L_BP1a! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@16ed8 DS:1c7c
    GOTO L_16f4c   '@16f44
L_16f4c:
    GOTO L_170da   '@16f4c
L_16f54:
    IF NOT (L_BP14! = -2.0) THEN GOTO L_170bd   '@16f55 DS:1d48
    L_BP1e% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@16f69
    IF NOT (L_BP1e% <> 1) THEN GOTO L_16faa   '@16f93
    IF NOT (L_BP1e% = 3) THEN GOTO L_1705e   '@16fa1
L_16faa:
    L_BP1a! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))) * 100.0), 0) + A_196c!(RT_CINT%(FX##(V_11c0!)), 1)   '@16faa DS:1c7c
    GOTO L_170b5   '@17056
L_1705e:
    IF NOT (L_BP1e% = 2) THEN GOTO L_170b5   '@1705e
    L_BP1a! = FX##(A_196c!(RT_CINT%(FX##(V_11c0!)), 1)) + A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@17067
    GOTO L_170b5   '@170ad
L_170b5:
    GOTO L_170da   '@170b5
L_170bd:
    IF NOT (L_BP14! = -3.0) THEN GOTO L_170da   '@170be DS:1d4c
    GOTO L_170da   '@170d2
L_170da:
    L_BP22! = A_15da!(RT_CINT%(FX##(V_11c0!)), 3)   '@170da
    IF NOT (L_BP22! = 0.0) THEN GOTO L_1720d   '@17104 DS:1c74
    L_BP24% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@1711e
    IF NOT (L_BP24% <> 1) THEN GOTO L_1715f   '@17148
    IF NOT (L_BP24% = 3) THEN GOTO L_171ca   '@17156
L_1715f:
    L_BP28! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4))), 1)   '@1715f
    GOTO L_17205   '@171c2
L_171ca:
    IF NOT (L_BP24% = 2) THEN GOTO L_17205   '@171ca
    L_BP28! = A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@171d3
    GOTO L_17205   '@171fd
L_17205:
    GOTO L_17551   '@17205
L_1720d:
    IF NOT (L_BP22! = -1.0) THEN GOTO L_173ca   '@1720e DS:1cca
    L_BP2a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@17222
    IF NOT (L_BP2a% <> 1) THEN GOTO L_17263   '@1724c
    IF NOT (L_BP2a% = 3) THEN GOTO L_17343   '@1725a
L_17263:
    L_BP28! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))) * 100.0), 1))   '@17263 DS:1c7c
    GOTO L_173c2   '@1733b
L_17343:
    IF NOT (L_BP2a% = 2) THEN GOTO L_173c2   '@17343
    L_BP28! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@1734c DS:1c7c
    GOTO L_173c2   '@173ba
L_173c2:
    GOTO L_17551   '@173c2
L_173ca:
    IF NOT (L_BP22! = -2.0) THEN GOTO L_17534   '@173cb DS:1d48
    L_BP2c% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@173df
    IF NOT (L_BP2c% <> 1) THEN GOTO L_17420   '@17409
    IF NOT (L_BP2c% = 3) THEN GOTO L_174d5   '@17417
L_17420:
    L_BP28! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))) * 100.0), 1) + A_196c!(RT_CINT%(FX##(V_11c0!)), 2)   '@17420 DS:1c7c
    GOTO L_1752c   '@174cd
L_174d5:
    IF NOT (L_BP2c% = 2) THEN GOTO L_1752c   '@174d5
    L_BP28! = FX##(A_196c!(RT_CINT%(FX##(V_11c0!)), 2)) + A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@174de
    GOTO L_1752c   '@17524
L_1752c:
    GOTO L_17551   '@1752c
L_17534:
    IF NOT (L_BP22! = -3.0) THEN GOTO L_17551   '@17535 DS:1d4c
    GOTO L_17551   '@17549
L_17551:
    L_BP30! = A_15da!(0, 0)   '@17551
    FOR V_11ec! = 1.0 TO L_BP30!   '@17571 DS:1b2c
    IF NOT (V_11ec! <> V_11c0!) THEN GOTO L_17942   '@17578
    L_BP34! = A_15da!(RT_CINT%(FX##(V_11ec!)), 0)   '@17593
    IF NOT (L_BP34! = -2.0) THEN GOTO L_1774d   '@175bc DS:1d48
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)) / 1000.0) * 1000) = FX##(V_11c0!)) THEN GOTO L_17745   '@175d6 DS:1d2c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_176a9   '@17648
    A_196c!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP1a!   '@17677
    GOTO L_17715   '@176a1
L_176a9:
    A_196c!(RT_CINT%(FX##(V_11ec!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)) / 1000.0), 0)) + L_BP1a!   '@176a9 DS:1d2c
L_17715:
    A_196c!(RT_CINT%(FX##(V_11ec!)), 3) = 1.0   '@17715 DS:1b2c
L_17745:
    GOTO L_1776a   '@17745
L_1774d:
    IF NOT (L_BP34! = -3.0) THEN GOTO L_1776a   '@1774e DS:1d4c
    GOTO L_1776a   '@17762
L_1776a:
    L_BP38! = A_15da!(RT_CINT%(FX##(V_11ec!)), 3)   '@1776a
    IF NOT (L_BP38! = -2.0) THEN GOTO L_17920   '@17794 DS:1d48
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)) / 1000.0) * 1000) = FX##(V_11c0!)) THEN GOTO L_17918   '@177ae DS:1d2c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_1787e   '@17820
    A_196c!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP28!   '@1784f
    GOTO L_178e8   '@17876
L_1787e:
    A_196c!(RT_CINT%(FX##(V_11ec!)), 2) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)) / 1000.0), 1)) + L_BP28!   '@1787e DS:1d2c
L_178e8:
    A_196c!(RT_CINT%(FX##(V_11ec!)), 4) = 1.0   '@178e8 DS:1b2c
L_17918:
    GOTO L_1793d   '@17918
L_17920:
    IF NOT (L_BP38! = -3.0) THEN GOTO L_1793d   '@17921 DS:1d4c
    GOTO L_1793d   '@17935
L_1793d:
L_17942:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@17942 DS:1b2c
    L_BP3c! = A_1608!(0, 0)   '@1796d
    FOR V_11ec! = 1.0 TO L_BP3c!   '@1798d DS:1b2c
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11ec!)), 0) = -2.0) THEN GOTO L_17af7   '@17994 DS:1d48
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11ec!)), 1) = V_11c0!) THEN GOTO L_17ac7   '@179c8
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_17a5e   '@179fd
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 7) = L_BP1a!   '@17a2c
    GOTO L_17ac2   '@17a56
L_17a5e:
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 7) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11ec!)), 2))), 0)) + L_BP1a!   '@17a5e
L_17ac2:
L_17ac7:
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 6) = 2.0   '@17ac7 DS:1c78
L_17af7:
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11ec!)), 3) = -2.0) THEN GOTO L_17c5f   '@17af7 DS:1d48
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11ec!)), 4) = V_11c0!) THEN GOTO L_17c2f   '@17b2c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_17bc2   '@17b61
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 8) = L_BP28!   '@17b90
    GOTO L_17c2a   '@17bba
L_17bc2:
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 8) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11ec!)), 5))), 1)) + L_BP28!   '@17bc2
L_17c2a:
L_17c2f:
    A_17d4!(RT_CINT%(FX##(V_11ec!)), 6) = 2.0   '@17c2f DS:1c78
L_17c5f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@17c5f DS:1b2c
    A_196c!(RT_CINT%(FX##(V_11c0!)), 0) = 1.0   '@17c8a DS:1b2c
L_17cb9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@17cbe DS:1b2c
    IF NOT (L_BP0c% = 1) THEN GOTO L_17cff   '@17ce9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16ac2   '@17cf7
L_17cff:
    ' END SUB   '@17cff
END SUB

SUB S_17d14 (P_BP0a!, P_BP08!, P_BP06!)   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x17d14)
    DIM L_BP0e!
    DIM L_BP12!
    ' ---- FUN_1000_7d14 @0x17d14  (017d14_FUN_1000_7d14.lift.txt; evidence_id (assembly): ev_4fd748eee2ada596ccb75adac5efc65508757c67341e1d92635e44fdec31b88b)
    IF NOT (A_1608!(0, 0) < P_BP0a!) THEN GOTO L_17d4f   '@17d1c
    GOTO L_180f2   '@17d47
L_17d4f:
    IF NOT (P_BP08! = 2.0 OR P_BP08! = 0.0) THEN GOTO L_17f3e   '@17d4f DS:1c74,1c78
    L_BP0e! = A_17d4!(RT_CINT%(FX##(P_BP0a!)), 0)   '@17d8c
    IF NOT (L_BP0e! = 0.0) THEN GOTO L_17e0d   '@17db6 DS:1c74
    P_BP06! = A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@17dd0
    GOTO L_17f36   '@17e05
L_17e0d:
    IF NOT (L_BP0e! = -1.0) THEN GOTO L_17eaa   '@17e0e DS:1cca
    P_BP06! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 1))), 1)) * 1000.0)) / 10.0 + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@17e22 DS:1b30,1d2c
    GOTO L_17f36   '@17ea2
L_17eaa:
    IF NOT (L_BP0e! = -2.0) THEN GOTO L_17f19   '@17eab DS:1d48
    P_BP06! = FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 7)) + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@17ebf
    GOTO L_17f36   '@17f11
L_17f19:
    IF NOT (L_BP0e! = -3.0) THEN GOTO L_17f36   '@17f1a DS:1d4c
    GOTO L_17f36   '@17f2e
L_17f36:
    GOTO L_180ed   '@17f36
L_17f3e:
    L_BP12! = A_17d4!(RT_CINT%(FX##(P_BP0a!)), 3)   '@17f3e
    IF NOT (L_BP12! = 0.0) THEN GOTO L_17fc0   '@17f69 DS:1c74
    P_BP06! = A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@17f83
    GOTO L_180e8   '@17fb8
L_17fc0:
    IF NOT (L_BP12! = -1.0) THEN GOTO L_1805c   '@17fc1 DS:1cca
    P_BP06! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 4))), 0)) * 1000.0)) / 10.0 + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@17fd5 DS:1b30,1d2c
    GOTO L_180e8   '@18054
L_1805c:
    IF NOT (L_BP12! = -2.0) THEN GOTO L_180cb   '@1805d DS:1d48
    P_BP06! = FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 8)) + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@18071
    GOTO L_180e8   '@180c3
L_180cb:
    IF NOT (L_BP12! = -3.0) THEN GOTO L_180e8   '@180cc DS:1d4c
    GOTO L_180e8   '@180e0
L_180e8:
L_180ed:
L_180f2:
    ' END SUB   '@180f2
END SUB

SUB S_18105   ' entrada de SUB/FUNCTION (B$ENRA, locais 380 bytes) (0x18105)
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
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72!
    DIM L_BP76!
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP82!
    DIM L_BP86!
    DIM L_BP8a!
    DIM L_BP8e!
    DIM L_BP92!
    DIM L_BP96!
    DIM L_BP9a!
    DIM L_BP9e!
    DIM L_BPa2!
    DIM L_BPa6!
    DIM L_BPaa!
    DIM L_BPae!
    DIM L_BPb2!
    DIM L_BPb6!
    DIM L_BPba!
    DIM L_BPbe!
    DIM L_BPc2!
    DIM L_BPc6!
    DIM L_BPca!
    DIM L_BPce!
    DIM L_BPd2!
    DIM L_BPd6!
    DIM L_BPda!
    DIM L_BPde!
    DIM L_BPe2!
    DIM L_BPe6!
    DIM L_BPea!
    DIM L_BPee!
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe!
    ' ---- FUN_1000_8105 @0x18105  (018105_FUN_1000_8105.lift.txt; evidence_id (assembly): ev_eb129d9ffbaca225bf94fc0cc1d754b344e0a483bb046d6c707bb703e7f45b6b)
    V_11b8! = 1.0   '@18112 DS:1b2c
L_18128:
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11b8!)), 6) = 2.0) THEN GOTO L_194d5   '@18128 DS:1c78
    L_BP1e! = 0.0   '@1815d DS:1c74
    CALL S_17d14(V_11b8!, L_BP1e!, L_BP22!)   '@1816d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP26! = L_BP22!   '@1817f
    L_BP2a! = 1.0   '@18188 DS:1b2c
    CALL S_17d14(V_11b8!, L_BP2a!, L_BP2e!)   '@18198
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP32! = L_BP2e!   '@181aa
    L_BP36! = 2.0   '@181b3 DS:1c78
    CALL S_17d14(V_11b8!, L_BP36!, L_BP3a!)   '@181c3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP3e! = L_BP3a!   '@181d5
    L_BP42! = 3.0   '@181de DS:1d60
    CALL S_17d14(V_11b8!, L_BP42!, L_BP46!)   '@181ee
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP4a! = L_BP46!   '@18200
    L_BP4e! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0)   '@18209
    FOR V_11c0! = 1.0 TO L_BP4e!   '@18238 DS:1b2c
    V_11c4! = A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)), 0)   '@18240
    L_BP52! = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 0)   '@18279
    FOR L_BP56! = 1.0 TO L_BP52!   '@182a8 DS:1b2c
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(L_BP56!)), 0) = V_11b8!) THEN GOTO L_1869d   '@182b0
    IF NOT (L_BP32! = L_BP4a! OR L_BP26! = L_BP3e!) THEN GOTO L_1868b   '@182f2
    L_BP5a! = 0.0   '@1832c DS:1c74
    CALL S_17d14(V_11c4!, L_BP5a!, L_BP5e!)   '@1833c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP62! = 2.0   '@1834e DS:1c78
    CALL S_17d14(V_11c4!, L_BP62!, L_BP66!)   '@18358
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP5e! = L_BP66!) THEN GOTO L_183ee   '@1836a
    L_BP6a! = 1.0   '@1837d DS:1b2c
    CALL S_17d14(V_11c4!, L_BP6a!, L_BP6e!)   '@1838d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 1) = FX##(L_BP32!) - L_BP6e! + A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@1839f
    GOTO L_18683   '@183e6
L_183ee:
    L_BP72! = 1.0   '@183ee DS:1b2c
    CALL S_17d14(V_11c4!, L_BP72!, L_BP76!)   '@183fe
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP7a! = 3.0   '@18410 DS:1d60
    CALL S_17d14(V_11c4!, L_BP7a!, L_BP7e!)   '@1841a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP76! = L_BP7e!) THEN GOTO L_184b2   '@1842c
    L_BP82! = 0.0   '@1843f DS:1c74
    CALL S_17d14(V_11c4!, L_BP82!, L_BP86!)   '@18450
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 0) = FX##(L_BP26!) - L_BP86! + A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@18464
    GOTO L_1867e   '@184aa
L_184b2:
L_184b7:
    GOSUB L_19522   '@184bc
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_18679   '@184c9 DS:1bb0
    A_1608!(RT_CINT%(FX##(V_11b8!)), 0) = FX##(V_19ba!) - L_BP26! + A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@184e0
    A_1608!(RT_CINT%(FX##(V_11b8!)), 1) = FX##(V_19be!) - L_BP32! + A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@1852c
    L_BP26! = V_19ba!   '@1857a
    L_BP32! = V_19be!   '@1858a
    L_BP8a! = 0.0   '@1859a DS:1c74
    CALL S_17d14(V_11c4!, L_BP8a!, L_BP8e!)   '@185ab
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 0) = FX##(V_19ba!) - L_BP8e! + A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@185bf
    L_BP92! = 1.0   '@18606 DS:1b2c
    CALL S_17d14(V_11c4!, L_BP92!, L_BP96!)   '@18617
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 1) = FX##(V_19be!) - L_BP96! + A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@1862b
L_18679:
L_1867e:
L_18683:
    GOTO L_18698   '@18683
L_1868b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_184b7   '@1868b
L_18698:
L_1869d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP56!   '@1869d DS:1b2c
    L_BP9a! = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1)   '@186c5
    FOR L_BP56! = 1.0 TO L_BP9a!   '@186f8 DS:1b2c
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(L_BP56!)), 1) = V_11b8!) THEN GOTO L_18afa   '@18700
    IF NOT (L_BP32! = L_BP4a! OR L_BP26! = L_BP3e!) THEN GOTO L_18ae8   '@18743
    L_BP9e! = 0.0   '@1877d DS:1c74
    CALL S_17d14(V_11c4!, L_BP9e!, L_BPa2!)   '@1878e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPa6! = 2.0   '@187a2 DS:1c78
    CALL S_17d14(V_11c4!, L_BPa6!, L_BPaa!)   '@187ad
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BPa2! = L_BPaa!) THEN GOTO L_1884b   '@187c1
    L_BPae! = 3.0   '@187d6 DS:1d60
    CALL S_17d14(V_11c4!, L_BPae!, L_BPb2!)   '@187e7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 3) = FX##(L_BP32!) - L_BPb2! + A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@187fb
    GOTO L_18ae0   '@18843
L_1884b:
    L_BPb6! = 1.0   '@1884b DS:1b2c
    CALL S_17d14(V_11c4!, L_BPb6!, L_BPba!)   '@1885c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPbe! = 3.0   '@18870 DS:1d60
    CALL S_17d14(V_11c4!, L_BPbe!, L_BPc2!)   '@1887b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BPba! = L_BPc2!) THEN GOTO L_18913   '@1888f
    L_BPc6! = 2.0   '@188a4 DS:1c78
    CALL S_17d14(V_11c4!, L_BPc6!, L_BPca!)   '@188b5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 2) = FX##(L_BP26!) - L_BPca! + A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@188c9
    GOTO L_18adb   '@1890b
L_18913:
L_18918:
    GOSUB L_19522   '@1891d
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_18ad6   '@1892a DS:1bb0
    A_1608!(RT_CINT%(FX##(V_11b8!)), 0) = FX##(V_19ba!) - L_BP26! + A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@18941
    A_1608!(RT_CINT%(FX##(V_11b8!)), 1) = FX##(V_19be!) - L_BP32! + A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@1898d
    L_BP26! = V_19ba!   '@189db
    L_BP32! = V_19be!   '@189eb
    L_BPce! = 2.0   '@189fb DS:1c78
    CALL S_17d14(V_11c4!, L_BPce!, L_BPd2!)   '@18a0c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 2) = FX##(V_19ba!) - L_BPd2! + A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@18a20
    L_BPd6! = 3.0   '@18a63 DS:1d60
    CALL S_17d14(V_11c4!, L_BPd6!, L_BPda!)   '@18a74
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 3) = FX##(V_19be!) - L_BPda! + A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@18a88
L_18ad6:
L_18adb:
L_18ae0:
    GOTO L_18af5   '@18ae0
L_18ae8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_18918   '@18ae8
L_18af5:
L_18afa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP56!   '@18afa DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@18b23 DS:1b2c
    L_BPde! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1)   '@18b4e
    FOR V_11c0! = 1.0 TO L_BPde!   '@18b81 DS:1b2c
    V_11c4! = A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c0!)), 1)   '@18b88
    L_BPe2! = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 0)   '@18bc2
    FOR L_BP56! = 1.0 TO L_BPe2!   '@18bf2 DS:1b2c
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(L_BP56!)), 0) = V_11b8!) THEN GOTO L_18ff7   '@18bfa
    IF NOT (L_BP32! = L_BP4a! OR L_BP26! = L_BP3e!) THEN GOTO L_18fe5   '@18c3c
    L_BPe6! = 0.0   '@18c76 DS:1c74
    CALL S_17d14(V_11c4!, L_BPe6!, L_BPea!)   '@18c87
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPee! = 2.0   '@18c9b DS:1c78
    CALL S_17d14(V_11c4!, L_BPee!, L_BPf2!)   '@18ca6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BPea! = L_BPf2!) THEN GOTO L_18d44   '@18cba
    L_BPf6! = 1.0   '@18ccf DS:1b2c
    CALL S_17d14(V_11c4!, L_BPf6!, L_BPfa!)   '@18ce0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 1) = FX##(L_BP4a!) - L_BPfa! + A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@18cf4
    GOTO L_18fdd   '@18d3c
L_18d44:
    L_BPfe! = 1.0   '@18d44 DS:1b2c
    CALL S_17d14(V_11c4!, L_BPfe!, L_BP102!)   '@18d55
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP106! = 3.0   '@18d69 DS:1d60
    CALL S_17d14(V_11c4!, L_BP106!, L_BP10a!)   '@18d74
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP102! = L_BP10a!) THEN GOTO L_18e10   '@18d88
    L_BP10e! = 0.0   '@18d9d DS:1c74
    CALL S_17d14(V_11c4!, L_BP10e!, L_BP112!)   '@18dae
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 0) = FX##(L_BP3e!) - L_BP112! + A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@18dc2
    GOTO L_18fd8   '@18e08
L_18e10:
L_18e15:
    GOSUB L_19522   '@18e1a
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_18fd3   '@18e27 DS:1bb0
    A_1608!(RT_CINT%(FX##(V_11b8!)), 2) = FX##(V_19ba!) - L_BP3e! + A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@18e3e
    A_1608!(RT_CINT%(FX##(V_11b8!)), 3) = FX##(V_19be!) - L_BP4a! + A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@18e86
    L_BP3e! = V_19ba!   '@18ed4
    L_BP4a! = V_19be!   '@18ee4
    L_BP116! = 0.0   '@18ef4 DS:1c74
    CALL S_17d14(V_11c4!, L_BP116!, L_BP11a!)   '@18f05
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 0) = FX##(V_19ba!) - L_BP11a! + A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@18f19
    L_BP11e! = 1.0   '@18f60 DS:1b2c
    CALL S_17d14(V_11c4!, L_BP11e!, L_BP122!)   '@18f71
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 1) = FX##(V_19be!) - L_BP122! + A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@18f85
L_18fd3:
L_18fd8:
L_18fdd:
    GOTO L_18ff2   '@18fdd
L_18fe5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_18e15   '@18fe5
L_18ff2:
L_18ff7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP56!   '@18ff7 DS:1b2c
    L_BP126! = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1)   '@19020
    FOR L_BP56! = 1.0 TO L_BP126!   '@19053 DS:1b2c
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(L_BP56!)), 1) = V_11b8!) THEN GOTO L_19450   '@1905a
    IF NOT (L_BP32! = L_BP4a! OR L_BP26! = L_BP3e!) THEN GOTO L_1943e   '@1909d
    L_BP12a! = 0.0   '@190d7 DS:1c74
    CALL S_17d14(V_11c4!, L_BP12a!, L_BP12e!)   '@190e8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP132! = 2.0   '@190fc DS:1c78
    CALL S_17d14(V_11c4!, L_BP132!, L_BP136!)   '@19107
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP12e! = L_BP136!) THEN GOTO L_191a5   '@1911b
    L_BP13a! = 3.0   '@19130 DS:1d60
    CALL S_17d14(V_11c4!, L_BP13a!, L_BP13e!)   '@19141
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 3) = FX##(L_BP4a!) - L_BP13e! + A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@19155
    GOTO L_19436   '@1919d
L_191a5:
    L_BP142! = 1.0   '@191a5 DS:1b2c
    CALL S_17d14(V_11c4!, L_BP142!, L_BP146!)   '@191b6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP14a! = 3.0   '@191ca DS:1d60
    CALL S_17d14(V_11c4!, L_BP14a!, L_BP14e!)   '@191d5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP146! = L_BP14e!) THEN GOTO L_1926d   '@191e9
    L_BP152! = 2.0   '@191fe DS:1c78
    CALL S_17d14(V_11c4!, L_BP152!, L_BP156!)   '@1920f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 2) = FX##(L_BP3e!) - L_BP156! + A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@19223
    GOTO L_19431   '@19265
L_1926d:
L_19272:
    GOSUB L_19522   '@19277
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_1942c   '@19284 DS:1bb0
    A_1608!(RT_CINT%(FX##(V_11b8!)), 2) = FX##(V_19ba!) - L_BP3e! + A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@1929b
    A_1608!(RT_CINT%(FX##(V_11b8!)), 3) = FX##(V_19be!) - L_BP4a! + A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@192e3
    L_BP3e! = V_19ba!   '@19331
    L_BP4a! = V_19be!   '@19341
    L_BP15a! = 2.0   '@19351 DS:1c78
    CALL S_17d14(V_11c4!, L_BP15a!, L_BP15e!)   '@19362
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 2) = FX##(V_19ba!) - L_BP15e! + A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@19376
    L_BP162! = 3.0   '@193b9 DS:1d60
    CALL S_17d14(V_11c4!, L_BP162!, L_BP166!)   '@193ca
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1608!(RT_CINT%(FX##(V_11c4!)), 3) = FX##(V_19be!) - L_BP166! + A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@193de
L_1942c:
L_19431:
L_19436:
    GOTO L_1944b   '@19436
L_1943e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19272   '@1943e
L_1944b:
L_19450:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP56!   '@19450 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@19479 DS:1b2c
    A_17d4!(RT_CINT%(FX##(V_11b8!)), 6) = 0.0   '@194a5 DS:1c74
L_194d5:
    V_11b8! = FX##(V_11b8!) + 1.0   '@194d5 DS:1b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11b8!) THEN GOTO L_18128   '@194eb
    GOTO L_199c2   '@19515
    ' ---- F_1951d @0x1951d  (01951d_F_1951d.lift.txt; evidence_id (assembly): ev_fcc84d48f206821ad0ad03dbe0882b4ab7f356285514c9a073aac05846649cd0)
L_19522:   ' sub-rotina (alvo de GOSUB); entrada vinda de 018105_FUN_1000_8105
    V_199a! = L_BP26!   '@19527
    V_199e! = L_BP32!   '@19537
    V_19a2! = L_BP3e!   '@19547
    V_19a6! = L_BP4a!   '@19557
    L_BP16a! = 0.0   '@19567 DS:1c74
    CALL S_17d14(V_11c4!, L_BP16a!, L_BP16e!)   '@19578
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_19aa! = L_BP16e!   '@1958c
    L_BP172! = 1.0   '@19597 DS:1b2c
    CALL S_17d14(V_11c4!, L_BP172!, L_BP176!)   '@195a8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_19ae! = L_BP176!   '@195bc
    L_BP17a! = 2.0   '@195c7 DS:1c78
    CALL S_17d14(V_11c4!, L_BP17a!, L_BP17e!)   '@195d8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_19b2! = L_BP17e!   '@195ec
    L_BP182! = 3.0   '@195f7 DS:1d60
    CALL S_17d14(V_11c4!, L_BP182!, L_BP186!)   '@19608
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_19b6! = L_BP186!   '@1961c
    V_0e14$ = "NAOCRUZA"   '@19627 DS:1ba0
    IF NOT (V_19ae! = V_19b6! AND V_199e! = V_19a6!) THEN GOTO L_19681   '@19639
    RETURN   '@19677
L_19681:
    IF NOT (V_19aa! = V_19b2! AND V_199a! = V_19a2!) THEN GOTO L_196c9   '@19681
    RETURN   '@196bf
L_196c9:
    IF NOT (V_199e! <> V_19a6! AND V_19ae! <> V_19b6!) THEN GOTO L_19760   '@196c9
    IF NOT (ABS((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)) < 0.0000999999974737875163555145263671875##) THEN GOTO L_1975b   '@19707 DS:1bac
    RETURN   '@19751
L_1975b:
L_19760:
    IF NOT (V_19ae! = V_19b6! OR V_199e! = V_19a6!) THEN GOTO L_197e3   '@19760
    V_19be! = V_199e!   '@1979e
    IF NOT (V_19ae! = V_19b6!) THEN GOTO L_197db   '@197af
    V_19be! = V_19ae!   '@197ca
L_197db:
    GOTO L_19881   '@197db
L_197e3:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@197e3
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@19837
L_19881:
    IF NOT (V_19aa! = V_19b2! OR V_199a! = V_19a2!) THEN GOTO L_19904   '@19881
    V_19ba! = V_199a!   '@198bf
    IF NOT (V_19aa! = V_19b2!) THEN GOTO L_198fc   '@198d0
    V_19ba! = V_19aa!   '@198eb
L_198fc:
    GOTO L_199a1   '@198fc
L_19904:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_1995f   '@19904
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@1991f
    GOTO L_1999c   '@19957
L_1995f:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@1995f
L_1999c:
L_199a1:
    V_0e14$ = "CRUZA"   '@199a1 DS:1bb0
    RETURN   '@199b3
L_199c2:   ' entrada vinda de 018105_FUN_1000_8105
    ' END SUB   '@199c2
END SUB

SUB S_20173   ' entrada de SUB/FUNCTION (B$ENRA, locais 30 bytes) (0x20173)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP28!
    ' ---- FUN_2000_0173 @0x20173  (020173_FUN_2000_0173.lift.txt; evidence_id (assembly): ev_90299773bb5d45b77a8617e5b9c5ddbf15394d3b4878e100477e5b43efa395a7)
    V_13aa% = 0   '@2017b
L_2018c:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_201e3   '@2018c
    GOTO L_201f4   '@201db
L_201e3:
    V_13aa% = V_13aa% + 1   '@201e3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2018c   '@201ec
L_201f4:
    REDIM A_16c0!(-32768 TO -32768, -32768 TO -32768)   '@201f4
    REDIM A_16ee!(-32768 TO -32768, -32768 TO -32768)   '@20202
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1) THEN GOTO L_2096c   '@2020b
    REDIM A_16c0!(0 TO 10, 0 TO 1)   '@2023a
    REDIM A_16ee!(0 TO 10, 0 TO 1)   '@2025e
    A_16c0!(0, 0) = 4.0   '@20282 DS:1d70
    A_16c0!(1, 0) = 0.0   '@202a2 DS:1d74
    A_16c0!(1, 1) = 0.0   '@202c5 DS:1d74
    A_16c0!(2, 0) = 0.0   '@202e6 DS:1d74
    A_16c0!(2, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@20309
    A_16c0!(3, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@2034f
    A_16c0!(3, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@20394
    A_16c0!(4, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@203da
    A_16c0!(4, 1) = 0.0   '@2041f DS:1d74
    A_16c0!(5, 0) = 0.0   '@20443 DS:1d74
    A_16c0!(5, 1) = 0.0   '@20466 DS:1d74
    A_16c0!(6, 0) = 0.0   '@2048a DS:1d74
    A_16c0!(6, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@204ad
    L_BP0e! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 3)   '@204f3
    REDIM A_16ee!(0 TO 6, 0 TO 1)   '@20522
    A_16ee!(0, 0) = A_16c0!(0, 0)   '@20546
    L_BP12! = FX##(A_16ee!(0, 0)) + 1.0   '@20575 DS:1d78
    FOR V_11d4! = 1.0 TO L_BP12!   '@2059a DS:1d78
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#) - A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@205a2 DS:1d7c
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#) + A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@20637 DS:1d7c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@206cd DS:1d78
    L_BP16! = A_16ee!(0, 0)   '@206f8
    FOR V_11d4! = 1.0 TO L_BP16!   '@20718 DS:1d78
    IF NOT (V_11d4! = 1.0) THEN GOTO L_20796   '@20720 DS:1d78
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@2073b
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@20764
    GOTO L_20855   '@2078e
L_20796:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) < L_BP1a!) THEN GOTO L_207f2   '@20796
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@207c9
L_207f2:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) < L_BP1e!) THEN GOTO L_20850   '@207f2
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@20826
L_20850:
L_20855:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@20855 DS:1d78
    L_BP22! = FX##(A_16ee!(0, 0)) + 1.0   '@20880 DS:1d78
    FOR V_11d4! = 1.0 TO L_BP22!   '@208a5 DS:1d78
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)) - L_BP1a!   '@208ac
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)) - L_BP1e!   '@208f3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@2093c DS:1d78
L_2096c:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 3) THEN GOTO L_20c85   '@2096c
    L_BP24% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@2099a
    REDIM A_16ee!(0 TO A_1496%(CINT(V_11bc!), V_13aa%, 2) + 5, 0 TO 1)   '@209c4
    A_16ee!(0, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@20a0a
    L_BP28! = A_16ee!(0, 0)   '@20a4c
    FOR V_11d4! = 0.0 TO L_BP28!   '@20a6c DS:1d74,1d78
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 0)) / 10.0   '@20a74 DS:1d84
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 1)) / 10.0   '@20ac3 DS:1d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@20b14 DS:1d78
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 0) = A_16ee!(1, 0)   '@20b3f DS:1d78
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 1) = A_16ee!(1, 1)   '@20b8f DS:1d78
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 0) = A_16ee!(2, 0)   '@20bde DS:1d88
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 1) = A_16ee!(2, 1)   '@20c2e DS:1d88
L_20c85:
    ' END SUB   '@20c85
END SUB

SUB S_20c9a   ' entrada de SUB/FUNCTION (B$ENRA, locais 306 bytes) (0x20c9a)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP90!
    DIM L_BP94!
    DIM L_BP98!
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa4!
    DIM L_BPa8!
    DIM L_BPac!
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb8!
    DIM L_BPbc!
    DIM L_BPc0!
    DIM L_BPc4!
    DIM L_BPc8!
    DIM L_BPcc!
    DIM L_BPd0!
    DIM L_BPd4!
    DIM L_BPd6%
    DIM L_BPda!
    DIM L_BPde!
    DIM L_BPe2!
    DIM L_BPe6!
    DIM L_BPe8%
    DIM L_BPea%
    DIM L_BPee!
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfc%
    REDIM L_BP2c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_0c9a @0x20c9a  (020c9a_FUN_2000_0c9a.lift.txt; evidence_id (assembly): ev_d49c84edb890f0f8f62dc7a790e3404403e9f7b36b5ce9d836640ff3e26ff8d0)
    REDIM L_BP2c%(0 TO 1)   '@20ca7
    IF NOT (V_157a$ = "FORMA") THEN GOTO L_20d44   '@20cd8 DS:1d8c
    LOCATE 24, 1   '@20cef
    PRINT " Interseccoes entre linhas de faces das Vigas.                       "   '@20d0a DS:1d96
    GOSUB L_210f4   '@20d18
    GOSUB L_2428f   '@20d25
    GOSUB L_2726d   '@20d32
L_20d44:
    REDIM A_1664!(-32768 TO -32768, -32768 TO -32768)   '@20d44
    REDIM A_1664!(0 TO CINT(A_1608!(0, 0) * 4.0), 0 TO 4)   '@20d52 DS:1d70
    V_11c0! = 0.0   '@20d8c DS:1d74
    L_BP90! = A_1608!(0, 0)   '@20d9d
    FOR V_11b8! = 0.0 TO L_BP90!   '@20dbe DS:1d74,1d78
    L_BP94! = 0.0   '@20dc6 DS:1d74
    CALL S_17d14(V_11b8!, L_BP94!, L_BP98!)   '@20dd7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 0) = L_BP98!   '@20deb
    L_BP9c! = 1.0   '@20e14 DS:1d78
    CALL S_17d14(V_11b8!, L_BP9c!, L_BPa0!)   '@20e25
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 1) = L_BPa0!   '@20e39
    L_BPa4! = 2.0   '@20e63 DS:1d88
    CALL S_17d14(V_11b8!, L_BPa4!, L_BPa8!)   '@20e74
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 2) = L_BPa8!   '@20e88
    L_BPac! = 3.0   '@20eaf DS:1de0
    CALL S_17d14(V_11b8!, L_BPac!, L_BPb0!)   '@20ec0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 3) = L_BPb0!   '@20ed4
    A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 4) = A_1608!(RT_CINT%(FX##(V_11b8!)), 4)   '@20efe
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 1) = A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 3) AND A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 0) = A_1664!(RT_CINT%(FX##(V_11b8!) + V_11c0!), 2)) THEN GOTO L_2104f   '@20f48
    A_1664!(0, 0) = FX##(A_1664!(0, 0)) - 1.0   '@21000 DS:1de4
    V_11c0! = FX##(V_11c0!) - 1.0   '@21034 DS:1de4
L_2104f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@2104f DS:1d78
    LOCATE 24, 1   '@2107b
    PRINT " Interseccoes entre linhas de faces das Vigas com Pilares.           "   '@21096 DS:1de8
    GOSUB L_29194   '@210a4
    LOCATE 24, 1   '@210b1
    PRINT " Interseccoes entre linhas de Bordos Livres de Lajes.                "   '@210cc DS:1e32
    GOSUB L_2bb5f   '@210da
    GOTO L_2bccd   '@210e7
    ' ---- F_210ef @0x210ef  (0210ef_F_210ef.lift.txt; evidence_id (assembly): ev_55d7eba0e1bb37e1d912c68cadc492aa9f5c4ee335a4e5036143d05c476d8169)
L_210f4:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020c9a_FUN_2000_0c9a
    REDIM A_171c%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@210f9
    REDIM A_171c%(0 TO CINT(A_1608!(0, 0) + 50.0), 0 TO 6, 0 TO 1)   '@21107 DS:1e7c
    ERASE L_BP2c%   '@2114b
    REDIM L_BP2c%(0 TO CINT(A_1608!(0, 0) + 50.0))   '@21159 DS:1e7c
    V_11b8! = 1.0   '@2118f DS:1d78
L_211a6:
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@211a6
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@211d0
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@211fb
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@21223
    V_11bc! = FX##(V_11b8!) + 1.0   '@2124e DS:1d78
L_2126a:
    IF NOT (RT_POT##((FX##(V_199a!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 0)), (2.0)) + RT_POT##((FX##(V_199e!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 1)), (2.0)) < 0.039999999105930328369140625##) THEN GOTO L_2140a   '@2126a DS:1d88,1e80
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1   '@212e2
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0), 0) = RT_CINT%(FX##(V_11bc!))   '@21324
    A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0) + 1   '@21372
    A_171c%(RT_CINT%(FX##(V_11bc!)), A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0), 0) = RT_CINT%(FX##(V_11b8!))   '@213b4
    GOTO L_2191a   '@21402
L_2140a:
    IF NOT (RT_POT##((FX##(V_199a!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)), (2.0)) + RT_POT##((FX##(V_199e!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)), (2.0)) < 0.039999999105930328369140625##) THEN GOTO L_215b2   '@2140a DS:1d88,1e80
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1   '@21480
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0), 0) = RT_CINT%(FX##(V_11bc!))   '@214c2
    A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) + 1   '@21510
    A_171c%(RT_CINT%(FX##(V_11bc!)), A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1), 1) = RT_CINT%(FX##(V_11b8!))   '@21558
    GOTO L_21915   '@215aa
L_215b2:
    IF NOT (RT_POT##((FX##(V_19a2!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 0)), (2.0)) + RT_POT##((FX##(V_19a6!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 1)), (2.0)) < 0.039999999105930328369140625##) THEN GOTO L_2175c   '@215b2 DS:1d88,1e80
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1   '@2162a
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1), 1) = RT_CINT%(FX##(V_11bc!))   '@21672
    A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0) + 1   '@216c4
    A_171c%(RT_CINT%(FX##(V_11bc!)), A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0), 0) = RT_CINT%(FX##(V_11b8!))   '@21706
    GOTO L_21910   '@21754
L_2175c:
    IF NOT (RT_POT##((FX##(V_19a2!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 2)), (2.0)) + RT_POT##((FX##(V_19a6!) - A_1608!(RT_CINT%(FX##(V_11bc!)), 3)), (2.0)) < 0.039999999105930328369140625##) THEN GOTO L_2190b   '@2175c DS:1d88,1e80
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1   '@217d2
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1), 1) = RT_CINT%(FX##(V_11bc!))   '@2181a
    A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) + 1   '@2186c
    A_171c%(RT_CINT%(FX##(V_11bc!)), A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1), 1) = RT_CINT%(FX##(V_11b8!))   '@218b4
L_2190b:
L_21910:
L_21915:
L_2191a:
    V_11bc! = FX##(V_11bc!) + 1.0   '@2191a DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11bc!) THEN GOTO L_2126a   '@21930
    V_11b8! = FX##(V_11b8!) + 1.0   '@2195a DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) <= V_11b8!) THEN GOTO L_211a6   '@21970
    V_11b8! = 1.0   '@2199a DS:1d78
L_219b0:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11b8!)), 4) = 0.0) THEN GOTO L_219ed   '@219b0 DS:1d74
    GOTO L_23a29   '@219e5
L_219ed:
    L_BP12! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0)   '@219ed
    L_BP16! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1)   '@21a1b
    L_BP1a% = 0   '@21a4c
L_21a5b:
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 0 AND (L_BP16! > 2.0 AND L_BP12! > 2.0)) THEN GOTO L_22751   '@21a60 DS:1d88
    V_11c4! = 1.0   '@21ac5 DS:1d78
L_21adc:
    IF NOT (V_11c4! <= L_BP12!) THEN GOTO L_2274c   '@21add
    IF NOT (INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4))) <> INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))) THEN GOTO L_2272d   '@21af1
    V_11cc! = 1.0   '@21b6b DS:1d78
L_21b82:
    IF NOT (V_11cc! <= L_BP16!) THEN GOTO L_22728   '@21b83
    IF NOT (INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4))) = INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), 4)))) THEN GOTO L_21ee3   '@21b97
    V_11d4! = RT_CINT%((A_1608!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@21c38 DS:1e84
    V_11d8! = RT_CINT%((A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4) - INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))) * 100.0)   '@21c9b DS:1e84
    IF NOT (FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 1) >= FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))), RT_CINT%(FX##(V_11d8!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))), RT_CINT%(FX##(V_11d8!)), 1)) THEN GOTO L_21ed3   '@21d38
    L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 1   '@21eaf
L_21ed3:
    GOTO L_23a29   '@21ed3
L_21ee3:
    L_BPb4! = 0.0   '@21ee3 DS:1d74
    V_11bc! = 1.0   '@21ef4 DS:1d78
L_21f0a:
    IF NOT (A_171c%(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), 0, 0) >= V_11bc!) THEN GOTO L_2200c   '@21f0b
    IF NOT (A_171c%(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), RT_CINT%(FX##(V_11bc!)), 0) = V_11b8!) THEN GOTO L_21fed   '@21f65
    L_BPb4! = 1.0   '@21fcf DS:1d78
    GOTO L_2200c   '@21fe0
L_21fed:
    V_11bc! = FX##(V_11bc!) + 1.0   '@21fed DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21f0a   '@22003
L_2200c:
    V_11bc! = 1.0   '@2200c DS:1d78
L_22022:
    IF NOT (A_171c%(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), 0, RT_CINT%(FX##(L_BPb4!))) >= V_11bc!) THEN GOTO L_22704   '@22023
    IF NOT (INT(FX##(A_1608!(A_171c%(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), RT_CINT%(FX##(V_11bc!)), RT_CINT%(FX##(L_BPb4!))), 4))) = INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))) THEN GOTO L_226e6   '@22087
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11b8!)), -(L_BP1a% = 1) * 2)   '@2214d
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11b8!)), -(L_BP1a% = 1) * 2 + 1)   '@22183
    L_BPb8! = A_171c%(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11cc!)), -(L_BP1a% = 0)), RT_CINT%(FX##(V_11bc!)), RT_CINT%(FX##(L_BPb4!)))   '@221ba
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 0)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 1)), (2.0)))   '@22222 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 2)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 3)), (2.0)))   '@22292 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb8!)), 0)) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb8!)), 1)) - A_1608!(RT_CINT%(FX##(L_BPb8!)), 3)), (2.0)))   '@22300 DS:1d88
    GOSUB L_290cb   '@223a1
    L_BP5c! = L_BP30!   '@223ae
    V_11d4! = RT_CINT%((A_1608!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@223bd DS:1e84
    V_11d8! = RT_CINT%((A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4) - INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))) * 100.0)   '@22420 DS:1e84
    IF NOT (ABS(FX##(L_BP5c!) - A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))), RT_CINT%(FX##(V_11d8!)), 0)) < 0.20000000298023223876953125##) THEN GOTO L_226e1   '@224bd DS:1e88
    IF NOT (FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 1) >= FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))), RT_CINT%(FX##(V_11d8!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11c4!)), L_BP1a%), 4)))), RT_CINT%(FX##(V_11d8!)), 1)) THEN GOTO L_226dc   '@22541
    L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 1   '@226b8
L_226dc:
L_226e1:
L_226e6:
    V_11bc! = FX##(V_11bc!) + 1.0   '@226e6 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22022   '@226fc
L_22704:
    V_11cc! = FX##(V_11cc!) + 1.0   '@22709 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21b82   '@2271f
L_22728:
L_2272d:
    V_11c4! = FX##(V_11c4!) + 1.0   '@2272d DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21adc   '@22743
L_2274c:
L_22751:
    IF NOT (L_BP1a% = 0) THEN GOTO L_227d5   '@22751
    L_BP16! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0)   '@2275f
    L_BP12! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1)   '@2278d
    L_BP1a% = 1   '@227be
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21a5b   '@227c8
L_227d5:
    L_BP12! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0)   '@227d5
    L_BP16! = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1)   '@22803
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 0 AND (L_BP16! > 1.0 OR L_BP12! > 1.0)) THEN GOTO L_23a24   '@22834 DS:1d78
    IF NOT (L_BP12! > 1.0) THEN GOTO L_22929   '@22899 DS:1d78
    L_BP0e! = L_BP12!   '@228b3
    V_11d4! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@228c2
    V_11d8! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@228ec
    L_BP1a% = 0   '@22917
    GOTO L_229d3   '@22921
L_22929:
L_2292e:
    IF NOT (L_BP16! > 1.0) THEN GOTO L_229c1   '@22933 DS:1d78
    L_BP0e! = L_BP16!   '@2294d
    V_11d4! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@2295c
    V_11d8! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@22984
    L_BP1a% = 1   '@229af
    GOTO L_229ce   '@229b9
L_229c1:
    GOTO L_23a29   '@229c1
L_229ce:
L_229d3:
    V_11bc! = 1.0   '@229d3 DS:1d78
L_229ea:
    IF NOT (A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4) > 0.0 AND A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4) <> A_1608!(RT_CINT%(FX##(V_11b8!)), 4)) THEN GOTO L_239d9   '@229ea DS:1d74
    V_11c4! = 1.0   '@22ab2 DS:1d78
L_22ac8:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11c4!)), 4) = A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4) AND A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%) <> V_11c4!) THEN GOTO L_2398a   '@22ac8
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@22b81
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@22bab
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@22bd6
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@22bfe
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@22c29
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@22c53
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@22c7e
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@22ca6
    IF NOT (ABS(FX##(V_19ae!) - V_19b6!) < 0.0500000007450580596923828125## OR ABS(FX##(V_199e!) - V_19a6!) < 0.0500000007450580596923828125##) THEN GOTO L_22d6c   '@22cd1 DS:1e8c
    V_19be! = V_199e!   '@22d1f
    IF NOT (ABS(FX##(V_19ae!) - V_19b6!) < 0.0500000007450580596923828125##) THEN GOTO L_22d64   '@22d30 DS:1e8c
    V_19be! = V_19ae!   '@22d53
L_22d64:
    GOTO L_22e5c   '@22d64
L_22d6c:
    IF NOT (ABS((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)) < 0.0500000007450580596923828125##) THEN GOTO L_22dbe   '@22d6c DS:1e8c
    GOTO L_2398f   '@22db6
L_22dbe:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@22dbe
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@22e12
L_22e5c:
    IF NOT (ABS(FX##(V_19aa!) - V_19b2!) < 0.0500000007450580596923828125## OR ABS(FX##(V_199a!) - V_19a2!) < 0.0500000007450580596923828125##) THEN GOTO L_22ef7   '@22e5c DS:1e8c
    V_19ba! = V_199a!   '@22eaa
    IF NOT (ABS(FX##(V_19aa!) - V_19b2!) < 0.0500000007450580596923828125##) THEN GOTO L_22eef   '@22ebb DS:1e8c
    V_19ba! = V_19aa!   '@22ede
L_22eef:
    GOTO L_22fc7   '@22eef
L_22ef7:
    IF NOT (ABS(FX##(V_199e!) - V_19a6!) < 0.0500000007450580596923828125##) THEN GOTO L_22f85   '@22ef7 DS:1e8c
    IF NOT (ABS(FX##(V_19b6!) - V_19ae!) < 0.0500000007450580596923828125##) THEN GOTO L_22f45   '@22f1a DS:1e8c
    GOTO L_2398f   '@22f3d
L_22f45:
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@22f45
    GOTO L_22fc2   '@22f7d
L_22f85:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@22f85
L_22fc2:
L_22fc7:
    IF NOT (ABS(RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19b6!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19b6!), (2.0)))) > FX##(1.0)) THEN GOTO L_23084   '@22fc7 DS:1d78,1d88
    GOTO L_2398f   '@2307c
L_23084:
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 1)), (2.0)))   '@23084 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 3)), (2.0)))   '@230f4 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1608!(RT_CINT%(FX##(V_11c4!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1608!(RT_CINT%(FX##(V_11c4!)), 3)), (2.0)))   '@23162 DS:1d88
    GOSUB L_290cb   '@23203
    L_BP5c! = L_BP30!   '@23210
    IF NOT (L_BP5c! > 0.0) THEN GOTO L_23985   '@2321f DS:1d74
    V_19aa! = (FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 0)) + A_1608!(RT_CINT%(FX##(V_11b8!)), 2)) / 2.0   '@23239 DS:1d88
    V_19ae! = (FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 1)) + A_1608!(RT_CINT%(FX##(V_11b8!)), 3)) / 2.0   '@23284 DS:1d88
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 0)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 1)), (2.0)))   '@232d3 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 2)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(V_11c4!)), 3)), (2.0)))   '@23343 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1608!(RT_CINT%(FX##(V_11c4!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1608!(RT_CINT%(FX##(V_11c4!)), 3)), (2.0)))   '@233b1 DS:1d88
    GOSUB L_290cb   '@23452
    L_BP60! = L_BP30!   '@2345f
    L_BP3c! = A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%)   '@2346e
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 0)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 1)), (2.0)))   '@234a6 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19aa!) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 2)), (2.0)) + RT_POT##((FX##(V_19ae!) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 3)), (2.0)))   '@23514 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BP3c!)), 0)) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 2)), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BP3c!)), 1)) - A_1608!(RT_CINT%(FX##(L_BP3c!)), 3)), (2.0)))   '@23580 DS:1d88
    GOSUB L_290cb   '@2361d
    L_BP64! = L_BP30!   '@2362a
    IF NOT (ABS(FX##(L_BP5c!) - L_BP60! - L_BP64!) < 0.0500000007450580596923828125##) THEN GOTO L_23980   '@23639 DS:1e8c
    L_BP34! = RT_CINT%((A_1608!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@2365e DS:1e84
    L_BP38! = RT_CINT%((A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4) - INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4)))) * 100.0)   '@236c0 DS:1e84
    IF NOT (FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(L_BP34!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(L_BP34!)), 1) >= FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4)))), RT_CINT%(FX##(L_BP38!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), L_BP1a%), 4)))), RT_CINT%(FX##(L_BP38!)), 1)) THEN GOTO L_238f6   '@2375c
    L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 1   '@238cf
    GOTO L_23973   '@238ee
L_238f6:
    IF NOT (A_171c%(RT_CINT%(FX##(V_11b8!)), 0, -(L_BP1a% = 0)) = 0) THEN GOTO L_2396e   '@238f6
    L_BP2c%(RT_CINT%(FX##(V_11b8!))) = RT_CINT%(-10.0 * FX##(V_11c4!) - L_BP1a%)   '@2392c DS:1e90
L_2396e:
L_23973:
    GOTO L_23a29   '@23973
L_23980:
L_23985:
L_2398a:
L_2398f:
    V_11c4! = FX##(V_11c4!) + 1.0   '@23994 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11c4!) THEN GOTO L_22ac8   '@239aa
L_239d9:
    V_11bc! = FX##(V_11bc!) + 1.0   '@239d9 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_11bc! > L_BP0e!) THEN GOTO L_229ea   '@239ef
    IF NOT (L_BP1a% = 0) THEN GOTO L_23a1f   '@23a09
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2292e   '@23a17
L_23a1f:
L_23a24:
L_23a29:
    V_11b8! = FX##(V_11b8!) + 1.0   '@23a2e DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11b8!) THEN GOTO L_219b0   '@23a44
    V_11c4! = 1.0   '@23a6e DS:1d78
L_23a84:
    V_11b8! = A_1608!(0, 0)   '@23a84
L_23aaa:
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11b8!))) = 1) THEN GOTO L_23add   '@23aaa
    GOSUB L_23b4b   '@23ad0
L_23add:
    V_11b8! = FX##(V_11b8!) - 1.0   '@23add DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_11b8! > 0.0 THEN GOTO L_23aaa   '@23af3 DS:1d74
    V_11c4! = FX##(V_11c4!) + 1.0   '@23b0b DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_11c4! > 2.0) THEN GOTO L_23a84   '@23b21 DS:1d88
    RETURN   '@23b3c
L_23b4b:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1608!(0, 0) > V_11b8!) THEN GOTO L_23d99   '@23b50
    L_BPbc! = A_1608!(0, 0)   '@23b7a
    FOR V_11c0! = FX##(V_11b8!) + 1.0 TO L_BPbc!   '@23b9b DS:1d78
    FOR L_BPb4! = 0.0 TO 4.0   '@23ba8 DS:1d70,1d74,1d78
    A_1608!(RT_CINT%(FX##(V_11c0!) - 1.0), RT_CINT%(FX##(L_BPb4!))) = A_1608!(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb4!)))   '@23bb6 DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPb4!   '@23c0e DS:1d70,1d78
    FOR L_BPb4! = 0.0 TO 6.0   '@23c3a DS:1d74,1d78,1e94
    A_171c%(RT_CINT%(FX##(V_11c0!) - 1.0), RT_CINT%(FX##(L_BPb4!)), 0) = A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb4!)), 0)   '@23c48 DS:1de4
    A_171c%(RT_CINT%(FX##(V_11c0!) - 1.0), RT_CINT%(FX##(L_BPb4!)), 1) = A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb4!)), 1)   '@23ca2 DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPb4!   '@23cfe DS:1d78,1e94
    L_BP2c%(RT_CINT%(FX##(V_11c0!) - 1.0)) = L_BP2c%(RT_CINT%(FX##(V_11c0!)))   '@23d2a DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@23d68 DS:1d78
L_23d99:
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) - 1.0   '@23d99 DS:1de4
    L_BPc0! = A_1608!(0, 0)   '@23dcd
    FOR V_11c0! = 1.0 TO L_BPc0!   '@23dee DS:1d78
    L_BPc4! = 0.0   '@23df6 DS:1d74
L_23e0c:
    L_BPb8! = 1.0   '@23e0c DS:1d78
L_23e22:
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c0!)), 0, RT_CINT%(FX##(L_BPc4!))) >= L_BPb8!) THEN GOTO L_24102   '@23e23
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb8!)), RT_CINT%(FX##(L_BPc4!))) = V_11b8!) THEN GOTO L_2402d   '@23e60
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c0!)), 0, RT_CINT%(FX##(L_BPc4!))) > L_BPb8!) THEN GOTO L_23fcf   '@23eab
    L_BPc8! = A_171c%(RT_CINT%(FX##(V_11c0!)), 0, RT_CINT%(FX##(L_BPc4!)))   '@23eee
    FOR V_11c8! = FX##(L_BPb8!) + 1.0 TO L_BPc8!   '@23f28 DS:1d78
    A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(V_11c8!) - 1.0), RT_CINT%(FX##(L_BPc4!))) = A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(V_11c8!)), RT_CINT%(FX##(L_BPc4!)))   '@23f34 DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c8!   '@23f9e DS:1d78
L_23fcf:
    A_171c%(RT_CINT%(FX##(V_11c0!)), 0, RT_CINT%(FX##(L_BPc4!))) = A_171c%(RT_CINT%(FX##(V_11c0!)), 0, RT_CINT%(FX##(L_BPc4!))) - 1   '@23fcf
    GOTO L_240f9   '@24025
L_2402d:
    IF NOT (A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb8!)), RT_CINT%(FX##(L_BPc4!))) > V_11b8!) THEN GOTO L_240de   '@2402d
    A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb8!)), RT_CINT%(FX##(L_BPc4!))) = A_171c%(RT_CINT%(FX##(V_11c0!)), RT_CINT%(FX##(L_BPb8!)), RT_CINT%(FX##(L_BPc4!))) - 1   '@24078
L_240de:
    L_BPb8! = FX##(L_BPb8!) + 1.0   '@240de DS:1d78
L_240f9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23e22   '@240f9
L_24102:
    L_BPc4! = FX##(L_BPc4!) + 1.0   '@24102 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPc4! > 1.0) THEN GOTO L_23e0c   '@24118 DS:1d78
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11c0!))) < 0) THEN GOTO L_24254   '@24133
    IF NOT (INT(FX##(-L_BP2c%(RT_CINT%(FX##(V_11c0!)))) / 10.0) * 10.0 = 10.0 * FX##(V_11b8!)) THEN GOTO L_241ce   '@2415a DS:1d84
    L_BP2c%(RT_CINT%(FX##(V_11c0!))) = 1   '@241a7
    GOTO L_2424f   '@241c6
L_241ce:
    IF NOT (-L_BP2c%(RT_CINT%(FX##(V_11c0!))) > 10.0 * FX##(V_11b8!)) THEN GOTO L_2424a   '@241ce DS:1d84
    L_BP2c%(RT_CINT%(FX##(V_11c0!))) = -(-L_BP2c%(RT_CINT%(FX##(V_11c0!))) - 10)   '@2420a
L_2424a:
L_2424f:
L_24254:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@24254 DS:1d78
    RETURN   '@24280
L_2428f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020c9a_FUN_2000_0c9a
    L_BP18% = 1   '@24294
L_242a3:
    V_11b8! = 1.0   '@242a8 DS:1d78
L_242be:
    IF NOT (L_BP18% = 1) THEN GOTO L_2437c   '@242be
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@242cc
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@242f6
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@24321
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@24349
    GOTO L_24429   '@24374
L_2437c:
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@2437c
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@243a6
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@243d1
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@243f9
L_24429:
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11b8!))) >= 0 AND (A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = 0 AND L_BP18% = 2 OR A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = 0 AND L_BP18% = 1)) THEN GOTO L_271f9   '@24429
    L_BP5c! = -1.0   '@244cd DS:1de4
    V_11bc! = 1.0   '@244dd DS:1d78
L_244f4:
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11bc!))) >= 0 AND INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4))) <> INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))) THEN GOTO L_2530e   '@244f4
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11bc!)), 0)   '@24582
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11bc!)), 1)   '@245ac
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11bc!)), 2)   '@245d7
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11bc!)), 3)   '@245ff
    V_11d4! = V_19aa!   '@2462a
    V_11d8! = V_19ae!   '@2463b
    V_11cc! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19aa!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19ae!), (2.0)))   '@2464c DS:1d88
    IF NOT (A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 0) > 0 OR A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) = 0 AND RT_SQR##(RT_POT##((FX##(V_199a!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19b6!), (2.0))) < FX##(V_11cc!)) THEN GOTO L_247ce   '@2468a DS:1d88
    IF NOT (A_171c%(RT_CINT%(FX##(V_11bc!)), 0, 1) > 0) THEN GOTO L_24769   '@24733
    GOTO L_25313   '@24761
L_24769:
    V_11d4! = V_19b2!   '@24769
    V_11d8! = V_19b6!   '@2477a
    V_11cc! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19b6!), (2.0)))   '@2478b DS:1d88
L_247ce:
    IF NOT (V_11cc! > L_BP5c! AND L_BP5c! <> -1.0) THEN GOTO L_24812   '@247ce DS:1de4
    GOTO L_25313   '@2480a
L_24812:
    V_19aa! = 0.0   '@24812 DS:1d74
    L_BPcc! = FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), 14, 0)) + A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), 14, 2)   '@24823
    FOR V_11ec! = 1.0 - FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), 14, 1)) TO L_BPcc!   '@248b7 DS:1d78
    IF NOT (A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11ec!)), 0) > V_19aa!) THEN GOTO L_249b8   '@24902
    V_19aa! = A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11ec!)), 0)   '@24962
L_249b8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@249b8 DS:1d78
    V_19b2! = 0.0   '@249e4 DS:1d74
    L_BPd0! = FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))), 14, 0)) + A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), 14, 2)   '@249f5
    FOR V_11ec! = 1.0 - FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))), 14, 1)) TO L_BPd0!   '@24a89 DS:1d78
    IF NOT (A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))), RT_CINT%(FX##(V_11ec!)), 0) > V_19b2!) THEN GOTO L_24b8a   '@24ad4
    V_19b2! = A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11bc!)), 4)))), RT_CINT%(FX##(V_11ec!)), 0)   '@24b34
L_24b8a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@24b8a DS:1d78
    IF NOT ((FX##(V_19aa!) + V_19b2!) * 2.0 > FX##(V_11cc!)) THEN GOTO L_25309   '@24bb6 DS:1d88
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11bc!)), 0)   '@24bdb
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11bc!)), 1)   '@24c05
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11bc!)), 2)   '@24c30
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11bc!)), 3)   '@24c58
    GOSUB L_28bdf   '@24c83
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_25304   '@24c90 DS:1e98
    V_0e0c$ = ""   '@24ca7 DS:1ea2
    V_11ec! = FX##(V_11b8!) + 1.0   '@24cb9 DS:1d78
L_24cd4:
    IF NOT (A_1608!(0, 0) >= V_11ec!) THEN GOTO L_252c2   '@24cd5
    IF NOT (A_1608!(RT_CINT%(FX##(V_11b8!)), 4) = A_1608!(RT_CINT%(FX##(V_11ec!)), 4)) THEN GOTO L_252a4   '@24cf9
    L_BP34! = -1.0   '@24d48 DS:1de4
    IF NOT (A_171c%(RT_CINT%(FX##(V_11ec!)), 0, 0) = 0) THEN GOTO L_24e09   '@24d58
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1608!(RT_CINT%(FX##(V_11ec!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1608!(RT_CINT%(FX##(V_11ec!)), 1)), (2.0)))   '@24d83 DS:1d88
    V_11d0! = 0.0   '@24df3 DS:1d74
L_24e09:
    IF NOT (A_171c%(RT_CINT%(FX##(V_11ec!)), 0, 1) = 0) THEN GOTO L_24f05   '@24e09
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1608!(RT_CINT%(FX##(V_11ec!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1608!(RT_CINT%(FX##(V_11ec!)), 3)), (2.0)))   '@24e37 DS:1d88
    IF NOT (L_BP3c! < L_BP34! OR L_BP34! = -1.0) THEN GOTO L_24f00   '@24ea5 DS:1de4
    L_BP34! = L_BP3c!   '@24ee0
    V_11d0! = 2.0   '@24eef DS:1d88
L_24f00:
L_24f05:
    IF NOT (L_BP34! <> -1.0) THEN GOTO L_25297   '@24f05 DS:1de4
    L_BPb4! = 1.0   '@24f1f DS:1d78
L_24f36:
    IF NOT (A_1608!(RT_CINT%(FX##(V_11bc!)), 4) = A_1608!(RT_CINT%(FX##(L_BPb4!)), 4) AND L_BPb4! <> V_11bc!) THEN GOTO L_25251   '@24f36
    L_BP38! = -1.0   '@24faa DS:1de4
    IF NOT (A_171c%(RT_CINT%(FX##(L_BPb4!)), 0, 0) = 0) THEN GOTO L_250a1   '@24fba
    L_BP38! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb4!)), 0)) - A_1608!(RT_CINT%(FX##(V_11ec!)), RT_CINT%(FX##(V_11d0!)))), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb4!)), 1)) - A_1608!(RT_CINT%(FX##(V_11ec!)), RT_CINT%(FX##(V_11d0!) + 1.0))), (2.0)))   '@24fe5 DS:1d78,1d88
L_250a1:
    IF NOT (A_171c%(RT_CINT%(FX##(L_BPb4!)), 0, 1) = 0) THEN GOTO L_251d3   '@250a1
    L_BP3c! = RT_SQR##(RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb4!)), 2)) - A_1608!(RT_CINT%(FX##(V_11ec!)), RT_CINT%(FX##(V_11d0!)))), (2.0)) + RT_POT##((FX##(A_1608!(RT_CINT%(FX##(L_BPb4!)), 3)) - A_1608!(RT_CINT%(FX##(V_11ec!)), RT_CINT%(FX##(V_11d0!) + 1.0))), (2.0)))   '@250cf DS:1d78,1d88
    IF NOT (L_BP3c! < L_BP38! OR L_BP38! = -1.0) THEN GOTO L_251ce   '@25184 DS:1de4
    L_BP38! = L_BP3c!   '@251bf
L_251ce:
L_251d3:
    IF NOT (L_BP38! <> -1.0) THEN GOTO L_2524c   '@251d3 DS:1de4
    IF NOT (L_BP38! > L_BP34! AND L_BP34! < V_11cc!) THEN GOTO L_25247   '@251ed
    V_0e0c$ = "*"   '@25228 DS:1ea6
    GOTO L_25292   '@2523a
L_25247:
L_2524c:
L_25251:
    L_BPb4! = FX##(L_BPb4!) + 1.0   '@25251 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < L_BPb4!) THEN GOTO L_24f36   '@25267
L_25292:
L_25297:
    GOTO L_252c2   '@25297
L_252a4:
    V_11ec! = FX##(V_11ec!) + 1.0   '@252a4 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24cd4   '@252ba
L_252c2:
    IF NOT (V_0e0c$ = "") THEN GOTO L_252ff   '@252c2 DS:1ea2
    L_BP5c! = V_11cc!   '@252d9
    L_BPd4! = V_11bc!   '@252e9
L_252ff:
L_25304:
L_25309:
L_2530e:
L_25313:
    V_11bc! = FX##(V_11bc!) + 1.0   '@25318 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11bc!) THEN GOTO L_244f4   '@2532e
    IF NOT (L_BP5c! <> -1.0) THEN GOTO L_271f4   '@25358 DS:1de4
    V_19aa! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 0)   '@25372
    V_19ae! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 1)   '@2539c
    V_19b2! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 2)   '@253c7
    V_19b6! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 3)   '@253ef
    GOSUB L_28bdf   '@2541a
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_25a3a   '@25427 DS:1e98
    IF NOT (L_BP18% = 1) THEN GOTO L_255b0   '@2543e
    A_1608!(RT_CINT%(FX##(V_11b8!)), 0) = INT(100.0 * FX##(V_19ba!)) / 100.0   '@2544c DS:1e84
    A_1608!(RT_CINT%(FX##(V_11b8!)), 1) = INT(100.0 * FX##(V_19be!)) / 100.0   '@25487 DS:1e84
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1   '@254c3
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0), 0) = RT_CINT%(FX##(L_BPd4!))   '@25505
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@25553
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@2557d
    GOTO L_25717   '@255a8
L_255b0:
    A_1608!(RT_CINT%(FX##(V_11b8!)), 2) = INT(100.0 * FX##(V_19ba!)) / 100.0   '@255b0 DS:1e84
    A_1608!(RT_CINT%(FX##(V_11b8!)), 3) = INT(100.0 * FX##(V_19be!)) / 100.0   '@255e9 DS:1e84
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1   '@25625
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1), 1) = RT_CINT%(FX##(L_BPd4!))   '@2566d
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@256bf
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@256e7
L_25717:
    IF NOT (RT_SQR##(RT_POT##((FX##(V_19ba!) - A_1608!(RT_CINT%(FX##(L_BPd4!)), 0)), (2.0)) + RT_POT##((FX##(V_19be!) - A_1608!(RT_CINT%(FX##(L_BPd4!)), 1)), (2.0))) < RT_SQR##(RT_POT##((FX##(V_19ba!) - A_1608!(RT_CINT%(FX##(L_BPd4!)), 2)), (2.0)) + RT_POT##((FX##(V_19be!) - A_1608!(RT_CINT%(FX##(L_BPd4!)), 3)), (2.0)))) THEN GOTO L_25910   '@25717 DS:1d88
    A_1608!(RT_CINT%(FX##(L_BPd4!)), 0) = INT(100.0 * FX##(V_19ba!)) / 100.0   '@257f0 DS:1e84
    A_1608!(RT_CINT%(FX##(L_BPd4!)), 1) = INT(100.0 * FX##(V_19be!)) / 100.0   '@2582b DS:1e84
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) + 1   '@25867
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0), 0) = RT_CINT%(FX##(V_11b8!))   '@258a9
    L_BPb4! = 1.0   '@258f7 DS:1d78
    GOTO L_25a35   '@25908
L_25910:
    A_1608!(RT_CINT%(FX##(L_BPd4!)), 2) = INT(100.0 * FX##(V_19ba!)) / 100.0   '@25910 DS:1e84
    A_1608!(RT_CINT%(FX##(L_BPd4!)), 3) = INT(100.0 * FX##(V_19be!)) / 100.0   '@25949 DS:1e84
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) + 1   '@25985
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1), 1) = RT_CINT%(FX##(V_11b8!))   '@259cd
    L_BPb4! = 2.0   '@25a1f DS:1d88
L_25a35:
L_25a3a:
    V_11cc! = 0.0   '@25a3a DS:1d74
    V_11d4! = RT_CINT%((A_1608!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@25a4b DS:1e84
    V_11d8! = RT_CINT%((A_1608!(RT_CINT%(FX##(L_BPd4!)), 4) - INT(FX##(A_1608!(RT_CINT%(FX##(L_BPd4!)), 4)))) * 100.0)   '@25aae DS:1e84
    IF NOT (FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 1) < FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(L_BPd4!)), 4)))), RT_CINT%(FX##(V_11d8!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(L_BPd4!)), 4)))), RT_CINT%(FX##(V_11d8!)), 1)) THEN GOTO L_26531   '@25b11
    V_11ec! = 1.0   '@25c4e DS:1d78
L_25c64:
    IF NOT (A_1608!(0, 0) >= V_11ec!) THEN GOTO L_2652c   '@25c65
    IF NOT (V_11ec! <> L_BPd4! AND A_1608!(RT_CINT%(FX##(L_BPd4!)), 4) = A_1608!(RT_CINT%(FX##(V_11ec!)), 4)) THEN GOTO L_2650e   '@25c89
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11ec!)), 0)   '@25cfb
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11ec!)), 1)   '@25d25
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11ec!)), 2)   '@25d50
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11ec!)), 3)   '@25d78
    GOSUB L_28bdf   '@25da3
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_26509   '@25db0 DS:1e98
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19be!), (2.0)))   '@25dc7 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19a2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19a6!) - V_19be!), (2.0)))   '@25e04 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19a6!), (2.0)))   '@25e41 DS:1d88
    IF NOT (FX##(L_BP34!) > 0.00999999977648258209228515625## AND ABS(FX##(L_BP38!) - L_BP34! - L_BP3c!) < 0.20000000298023223876953125##) THEN GOTO L_26504   '@25e7e DS:1e88,1eac
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0)))   '@25ec5 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19be!), (2.0)))   '@25f02 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19b6!), (2.0)))   '@25f3f DS:1d88
    IF NOT (ABS(FX##(L_BP3c!) - L_BP34! - L_BP38!) < 0.20000000298023223876953125##) THEN GOTO L_264ff   '@25f7c DS:1e88
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 1.0   '@25fa1 DS:1d78
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 0) = V_199a!   '@25fd5
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 1) = V_199e!   '@2600e
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 2) = (FX##(V_199a!) + V_19ba!) / 2.0   '@26048 DS:1d88
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 3) = (FX##(V_199e!) + V_19be!) / 2.0   '@26089 DS:1d88
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 1) = 0   '@260cd
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 0) = 2   '@26104
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 1, 0) = RT_CINT%(FX##(V_11b8!))   '@26138
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 2, 0) = RT_CINT%(FX##(L_BPd4!))   '@2617b
    IF NOT (L_BP18% = 1) THEN GOTO L_26273   '@261be
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1   '@261cc
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0), 0) = RT_CINT%(FX##(A_1608!(0, 0)))   '@2620e
    GOTO L_26321   '@2626b
L_26273:
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1   '@26273
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@262bb
L_26321:
    IF NOT (L_BPb4! = 1.0) THEN GOTO L_263e3   '@26321 DS:1d78
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) + 1   '@2633c
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0), 0) = RT_CINT%(FX##(A_1608!(0, 0)))   '@2637e
    GOTO L_26491   '@263db
L_263e3:
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) + 1   '@263e3
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@2642b
L_26491:
    L_BP2c%(RT_CINT%(FX##(A_1608!(0, 0)))) = RT_CINT%(-10.0 * FX##(V_11ec!))   '@26491 DS:1e90
    V_11cc! = A_1608!(0, 0)   '@264d2
    GOTO L_2652c   '@264f2
L_264ff:
L_26504:
L_26509:
L_2650e:
    V_11ec! = FX##(V_11ec!) + 1.0   '@2650e DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25c64   '@26524
L_2652c:
L_26531:
    IF NOT (FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(L_BPd4!)), 4)))), RT_CINT%(FX##(V_11d8!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(L_BPd4!)), 4)))), RT_CINT%(FX##(V_11d8!)), 1) < FX##(A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 2)) - A_1200!(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11b8!)), 4)))), RT_CINT%(FX##(V_11d4!)), 1)) THEN GOTO L_271ef   '@26531
    IF NOT (L_BPb4! = 1.0) THEN GOTO L_26739   '@2666e DS:1d78
    V_199a! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 0)   '@26689
    V_199e! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 1)   '@266b3
    V_19a2! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 2)   '@266de
    V_19a6! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 3)   '@26706
    GOTO L_267e6   '@26731
L_26739:
    V_199a! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 2)   '@26739
    V_199e! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 3)   '@26761
    V_19a2! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 0)   '@2678c
    V_19a6! = A_1608!(RT_CINT%(FX##(L_BPd4!)), 1)   '@267b6
L_267e6:
    V_11ec! = 1.0   '@267e6 DS:1d78
L_267fc:
    IF NOT (A_1608!(0, 0) >= V_11ec!) THEN GOTO L_271ea   '@267fd
    IF NOT (V_11ec! <> V_11b8! AND A_1608!(RT_CINT%(FX##(V_11b8!)), 4) = A_1608!(RT_CINT%(FX##(V_11ec!)), 4)) THEN GOTO L_271cb   '@26821
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11ec!)), 0)   '@26893
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11ec!)), 1)   '@268bd
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11ec!)), 2)   '@268e8
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11ec!)), 3)   '@26910
    GOSUB L_28bdf   '@2693b
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_271c6   '@26948 DS:1e98
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19be!), (2.0)))   '@2695f DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19a2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19a6!) - V_19be!), (2.0)))   '@2699c DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19a6!), (2.0)))   '@269d9 DS:1d88
    IF NOT (FX##(L_BP34!) > 0.00999999977648258209228515625## AND ABS(FX##(L_BP38!) - L_BP34! - L_BP3c!) < 0.20000000298023223876953125##) THEN GOTO L_271c1   '@26a16 DS:1e88,1eac
    L_BP34! = RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0)))   '@26a5d DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19be!), (2.0)))   '@26a9a DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19b6!), (2.0)))   '@26ad7 DS:1d88
    IF NOT (ABS(FX##(L_BP3c!) - L_BP34! - L_BP38!) < 0.20000000298023223876953125##) THEN GOTO L_271bc   '@26b14 DS:1e88
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 1.0   '@26b39 DS:1d78
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 0) = V_199a!   '@26b6d
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 1) = V_199e!   '@26ba6
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 2) = (FX##(V_199a!) + V_19ba!) / 2.0   '@26be0 DS:1d88
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 3) = (FX##(V_199e!) + V_19be!) / 2.0   '@26c21 DS:1d88
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 1) = 0   '@26c65
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 0) = -(V_11cc! <> 0.0) + 2   '@26c9c DS:1d74
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 1, 0) = RT_CINT%(FX##(V_11b8!))   '@26cee
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 2, 0) = RT_CINT%(FX##(L_BPd4!))   '@26d31
    IF NOT (V_11cc! <> 0.0) THEN GOTO L_26dd2   '@26d74 DS:1d74
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 3, 0) = RT_CINT%(FX##(V_11cc!))   '@26d8f
L_26dd2:
    IF NOT (L_BP18% = 1) THEN GOTO L_26e87   '@26dd2
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1   '@26de0
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0), 0) = RT_CINT%(FX##(A_1608!(0, 0)))   '@26e22
    GOTO L_26f35   '@26e7f
L_26e87:
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1   '@26e87
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@26ecf
L_26f35:
    IF NOT (L_BPb4! = 1.0) THEN GOTO L_26ff7   '@26f35 DS:1d78
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0) + 1   '@26f50
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 0), 0) = RT_CINT%(FX##(A_1608!(0, 0)))   '@26f92
    GOTO L_270a5   '@26fef
L_26ff7:
    A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) = A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1) + 1   '@26ff7
    A_171c%(RT_CINT%(FX##(L_BPd4!)), A_171c%(RT_CINT%(FX##(L_BPd4!)), 0, 1), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@2703f
L_270a5:
    IF NOT (V_11cc! <> 0.0) THEN GOTO L_2716e   '@270a5 DS:1d74
    A_171c%(RT_CINT%(FX##(V_11cc!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11cc!)), 0, 1) + 1   '@270c0
    A_171c%(RT_CINT%(FX##(V_11cc!)), A_171c%(RT_CINT%(FX##(V_11cc!)), 0, 1), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@27108
L_2716e:
    L_BP2c%(RT_CINT%(FX##(A_1608!(0, 0)))) = RT_CINT%(-10.0 * FX##(V_11ec!))   '@2716e DS:1e90
    GOTO L_271ea   '@271af
L_271bc:
L_271c1:
L_271c6:
L_271cb:
    V_11ec! = FX##(V_11ec!) + 1.0   '@271cb DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_267fc   '@271e1
L_271ea:
L_271ef:
L_271f4:
L_271f9:
    V_11b8! = FX##(V_11b8!) + 1.0   '@271f9 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11b8!) THEN GOTO L_242be   '@2720f
    IF NOT (L_BP18% = 1) THEN GOTO L_2725e   '@27239
    L_BP18% = 2   '@27247
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_242a3   '@27251
L_2725e:
    RETURN   '@2725e
L_2726d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020c9a_FUN_2000_0c9a
    V_11b8! = 1.0   '@27272 DS:1d78
L_27288:
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11b8!))) < 0) THEN GOTO L_28b90   '@27292
    V_11c4! = INT(FX##(-L_BP2c%(RT_CINT%(FX##(V_11b8!)))) / 10.0)   '@272b9 DS:1d84
    IF NOT (FX##(-L_BP2c%(RT_CINT%(FX##(V_11b8!)))) / 10.0 = -L_BP2c%(RT_CINT%(FX##(V_11b8!))) \ 10) THEN GOTO L_27366   '@272f2 DS:1d84
    L_BP1a% = 0   '@27354
    GOTO L_27370   '@2735e
L_27366:
    L_BP1a% = 1   '@27366
L_27370:
    V_199a! = A_1608!(RT_CINT%(FX##(V_11b8!)), 0)   '@27370
    V_199e! = A_1608!(RT_CINT%(FX##(V_11b8!)), 1)   '@2739a
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11b8!)), 2)   '@273c5
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11b8!)), 3)   '@273ed
    V_19aa! = A_1608!(RT_CINT%(FX##(V_11c4!)), 0)   '@27418
    V_19ae! = A_1608!(RT_CINT%(FX##(V_11c4!)), 1)   '@27442
    V_19b2! = A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@2746d
    V_19b6! = A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@27495
    IF NOT (V_19ae! = V_19b6! OR V_199e! = V_19a6!) THEN GOTO L_27543   '@274c0
    V_19be! = V_199e!   '@274fe
    IF NOT (V_19ae! = V_19b6!) THEN GOTO L_2753b   '@2750f
    V_19be! = V_19ae!   '@2752a
L_2753b:
    GOTO L_275e1   '@2753b
L_27543:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@27543
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@27597
L_275e1:
    IF NOT (V_19aa! = V_19b2! OR V_199a! = V_19a2!) THEN GOTO L_27664   '@275e1
    V_19ba! = V_199a!   '@2761f
    IF NOT (V_19aa! = V_19b2!) THEN GOTO L_2765c   '@27630
    V_19ba! = V_19aa!   '@2764b
L_2765c:
    GOTO L_27701   '@2765c
L_27664:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_276bf   '@27664
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@2767f
    GOTO L_276fc   '@276b7
L_276bf:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@276bf
L_276fc:
L_27701:
    IF NOT (ABS(RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19b6!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19be!), (2.0)))) < FX##(0.5)) THEN GOTO L_28b63   '@27701 DS:1d88,1eb0
    V_19ba! = FX##(RT_CLNG&(1000.0 * FX##(V_19ba!))) / 1000.0#   '@277b6 DS:1eb4,1eb8
    V_19be! = FX##(RT_CLNG&(1000.0 * FX##(V_19be!))) / 1000.0#   '@277db DS:1eb4,1eb8
    IF NOT (L_BP1a% = 0) THEN GOTO L_2797b   '@2780a
    A_1608!(RT_CINT%(FX##(V_11b8!)), 2) = V_19ba!   '@27818
    A_1608!(RT_CINT%(FX##(V_11b8!)), 3) = V_19be!   '@27840
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 1, 1) = RT_CINT%(FX##(V_11c4!))   '@2786b
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 2, 1) = RT_CINT%(FX##(A_1608!(0, 0)) + 1.0)   '@278bf DS:1d78
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 1) + 2   '@27929
    GOTO L_27acf   '@27973
L_2797b:
    A_1608!(RT_CINT%(FX##(V_11b8!)), 0) = V_19ba!   '@2797b
    A_1608!(RT_CINT%(FX##(V_11b8!)), 1) = V_19be!   '@279a5
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 1, 0) = RT_CINT%(FX##(V_11c4!))   '@279d0
    A_171c%(RT_CINT%(FX##(V_11b8!)), A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 2, 0) = RT_CINT%(FX##(A_1608!(0, 0)) + 1.0)   '@27a20 DS:1d78
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, 0) + 2   '@27a86
L_27acf:
    L_BPd6% = (RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0))) < 0.100000001490116119384765625##)   '@27acf DS:1d88,1ec0
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19be!), (2.0))) < 0.100000001490116119384765625## OR L_BPd6%) <> 0) THEN GOTO L_27d3f   '@27b32 DS:1d88
    IF NOT (RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0))) < 0.100000001490116119384765625##) THEN GOTO L_27c4b   '@27b6b DS:1d88,1ec0
    A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 0) = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 0) + 1   '@27bb3
    A_171c%(RT_CINT%(FX##(V_11c4!)), A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 0), 0) = RT_CINT%(FX##(V_11b8!))   '@27bf5
    GOTO L_27cea   '@27c43
L_27c4b:
    A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1) = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1) + 1   '@27c4b
    A_171c%(RT_CINT%(FX##(V_11c4!)), A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1), 1) = RT_CINT%(FX##(V_11b8!))   '@27c93
L_27cea:
    A_171c%(RT_CINT%(FX##(V_11b8!)), 0, -(L_BP1a% = 0)) = A_171c%(RT_CINT%(FX##(V_11b8!)), 0, -(L_BP1a% = 0)) - 1   '@27cea
    GOTO L_28b5b   '@27d37
L_27d3f:
    A_1608!(0, 0) = FX##(A_1608!(0, 0)) + 1.0   '@27d3f DS:1d78
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 2) = A_1608!(RT_CINT%(FX##(V_11c4!)), 2)   '@27d73
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 3) = A_1608!(RT_CINT%(FX##(V_11c4!)), 3)   '@27dc1
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 4) = A_1608!(RT_CINT%(FX##(V_11c4!)), 4)   '@27e15
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 0) = V_19ba!   '@27e69
    A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 1) = V_19be!   '@27ea2
    A_1608!(RT_CINT%(FX##(V_11c4!)), 2) = V_19ba!   '@27edc
    A_1608!(RT_CINT%(FX##(V_11c4!)), 3) = V_19be!   '@27f04
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 1, 0) = RT_CINT%(FX##(V_11b8!))   '@27f2f
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 2, 0) = RT_CINT%(FX##(V_11c4!))   '@27f72
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 0) = 2   '@27fb5
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), 0, 1) = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1)   '@27fe9
    L_BPda! = A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1)   '@2803f
    FOR V_11cc! = 1.0 TO L_BPda!   '@28072 DS:1d78
    A_171c%(RT_CINT%(FX##(A_1608!(0, 0))), RT_CINT%(FX##(V_11cc!)), 1) = A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1)   '@2807a
    L_BPde! = A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), 0, 0)   '@280e0
    FOR V_11bc! = 1.0 TO L_BPde!   '@2812e DS:1d78
    IF NOT (A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), RT_CINT%(FX##(V_11bc!)), 0) = V_11c4!) THEN GOTO L_2820c   '@28136
    A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), RT_CINT%(FX##(V_11bc!)), 0) = RT_CINT%(FX##(A_1608!(0, 0)))   '@28197
    GOTO L_28238   '@281ff
L_2820c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@2820c DS:1d78
L_28238:
    L_BPe2! = A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), 0, 1)   '@28238
    FOR V_11bc! = 1.0 TO L_BPe2!   '@28289 DS:1d78
    IF NOT (A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), RT_CINT%(FX##(V_11bc!)), 1) = V_11c4!) THEN GOTO L_28368   '@28290
    A_171c%(A_171c%(RT_CINT%(FX##(V_11c4!)), RT_CINT%(FX##(V_11cc!)), 1), RT_CINT%(FX##(V_11bc!)), 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@282f2
    GOTO L_28394   '@2835b
L_28368:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@28368 DS:1d78
L_28394:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@28394 DS:1d78
    A_171c%(RT_CINT%(FX##(V_11c4!)), 1, 1) = RT_CINT%(FX##(V_11b8!))   '@283c0
    A_171c%(RT_CINT%(FX##(V_11c4!)), 2, 1) = RT_CINT%(FX##(A_1608!(0, 0)))   '@283f2
    A_171c%(RT_CINT%(FX##(V_11c4!)), 0, 1) = 2   '@28436
    L_BP2c%(RT_CINT%(FX##(A_1608!(0, 0)))) = 0   '@2845e
    IF NOT (L_BP2c%(RT_CINT%(FX##(V_11c4!))) < 0) THEN GOTO L_2858a   '@2848e
    IF NOT (FX##(-L_BP2c%(RT_CINT%(FX##(V_11c4!)))) / 10.0 <> -L_BP2c%(RT_CINT%(FX##(V_11c4!))) \ 10) THEN GOTO L_28585   '@284b5 DS:1d84
    L_BP2c%(RT_CINT%(FX##(A_1608!(0, 0)))) = L_BP2c%(RT_CINT%(FX##(V_11c4!)))   '@28517
    L_BP2c%(RT_CINT%(FX##(V_11c4!))) = 0   '@2855f
L_28585:
L_2858a:
    L_BPe6! = A_1608!(0, 0)   '@2858a
    FOR V_11cc! = 1.0 TO L_BPe6!   '@285ab DS:1d78
    IF NOT (INT(FX##(-L_BP2c%(RT_CINT%(FX##(V_11cc!)))) / 10.0) = FX##(V_11c4!)) THEN GOTO L_28b2a   '@285b2 DS:1d84
    V_199a! = A_1608!(RT_CINT%(FX##(V_11cc!)), 0)   '@285f5
    V_199e! = A_1608!(RT_CINT%(FX##(V_11cc!)), 1)   '@2861f
    V_19a2! = A_1608!(RT_CINT%(FX##(V_11cc!)), 2)   '@2864a
    V_19a6! = A_1608!(RT_CINT%(FX##(V_11cc!)), 3)   '@28672
    V_19aa! = A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 0)   '@2869d
    V_19ae! = A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 1)   '@286d6
    V_19b2! = A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 2)   '@28710
    V_19b6! = A_1608!(RT_CINT%(FX##(A_1608!(0, 0))), 3)   '@28747
    IF NOT (V_19ae! = V_19b6! OR V_199e! = V_19a6!) THEN GOTO L_28804   '@28781
    V_19be! = V_199e!   '@287bf
    IF NOT (V_19ae! = V_19b6!) THEN GOTO L_287fc   '@287d0
    V_19be! = V_19ae!   '@287eb
L_287fc:
    GOTO L_288a2   '@287fc
L_28804:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@28804
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@28858
L_288a2:
    IF NOT (V_19aa! = V_19b2! OR V_199a! = V_19a2!) THEN GOTO L_28925   '@288a2
    V_19ba! = V_199a!   '@288e0
    IF NOT (V_19aa! = V_19b2!) THEN GOTO L_2891d   '@288f1
    V_19ba! = V_19aa!   '@2890c
L_2891d:
    GOTO L_289c2   '@2891d
L_28925:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_28980   '@28925
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@28940
    GOTO L_289bd   '@28978
L_28980:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@28980
L_289bd:
L_289c2:
    IF NOT (ABS(RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19b6!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19aa!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19ae!) - V_19be!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_19b2!) - V_19ba!), (2.0)) + RT_POT##((FX##(V_19b6!) - V_19be!), (2.0)))) < FX##(0.5)) THEN GOTO L_28b25   '@289c2 DS:1d88,1eb0
    L_BP2c%(RT_CINT%(FX##(V_11cc!))) = RT_CINT%((FX##(-L_BP2c%(RT_CINT%(FX##(V_11cc!)))) / 10.0 <> -L_BP2c%(RT_CINT%(FX##(V_11cc!))) \ 10) - FX##(A_1608!(0, 0)) * 10.0)   '@28a77 DS:1d84
L_28b25:
L_28b2a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@28b2a DS:1d78
L_28b5b:
    GOTO L_28b8b   '@28b5b
L_28b63:
    GOSUB L_23b4b   '@28b63
    V_11b8! = FX##(V_11b8!) - 1.0   '@28b70 DS:1de4
L_28b8b:
L_28b90:
    V_11b8! = FX##(V_11b8!) + 1.0   '@28b90 DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1608!(0, 0) < V_11b8!) THEN GOTO L_27288   '@28ba6
    RETURN   '@28bd0
L_28bdf:   ' sub-rotina (alvo de GOSUB)
    V_0e14$ = "NAOCRUZA"   '@28be4 DS:1ec4
    IF NOT (V_19ae! = V_19b6! AND V_199e! = V_19a6!) THEN GOTO L_28c3e   '@28bf6
    RETURN   '@28c34
L_28c3e:
    IF NOT (V_19aa! = V_19b2! AND V_199a! = V_19a2!) THEN GOTO L_28c86   '@28c3e
    RETURN   '@28c7c
L_28c86:
    IF NOT (V_199e! <> V_19a6! AND V_19ae! <> V_19b6!) THEN GOTO L_28d1d   '@28c86
    IF NOT (ABS((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)) < 0.0000999999974737875163555145263671875##) THEN GOTO L_28d18   '@28cc4 DS:1ed0
    RETURN   '@28d0e
L_28d18:
L_28d1d:
    IF NOT (V_19ae! = V_19b6! OR V_199e! = V_19a6!) THEN GOTO L_28da0   '@28d1d
    V_19be! = V_199e!   '@28d5b
    IF NOT (V_19ae! = V_19b6!) THEN GOTO L_28d98   '@28d6c
    V_19be! = V_19ae!   '@28d87
L_28d98:
    GOTO L_28e3e   '@28d98
L_28da0:
    V_19be! = FX##(V_19a2!) - V_19b2! + ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) * V_19b6! - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!) * V_19a6!)   '@28da0
    V_19be! = V_19be! / ((FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) - (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!))   '@28df4
L_28e3e:
    IF NOT (V_19aa! = V_19b2! OR V_199a! = V_19a2!) THEN GOTO L_28ec1   '@28e3e
    V_19ba! = V_199a!   '@28e7c
    IF NOT (V_19aa! = V_19b2!) THEN GOTO L_28eb9   '@28e8d
    V_19ba! = V_19aa!   '@28ea8
L_28eb9:
    GOTO L_28f5e   '@28eb9
L_28ec1:
    IF NOT (V_199e! = V_19a6!) THEN GOTO L_28f1c   '@28ec1
    V_19ba! = V_19b2! - (FX##(V_19b6!) - V_19be!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!)   '@28edc
    GOTO L_28f59   '@28f14
L_28f1c:
    V_19ba! = V_19a2! - (FX##(V_19a6!) - V_19be!) * (FX##(V_19a2!) - V_199a!) / (FX##(V_19a6!) - V_199e!)   '@28f1c
L_28f59:
L_28f5e:
    L_BPe8% = (RT_SQR##(RT_POT##((FX##(V_19ba!) - V_199a!), (2.0)) + RT_POT##((FX##(V_19be!) - V_199e!), (2.0))) < 0.100000001490116119384765625##)   '@28f5e DS:1d88,1ec0
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19a6!), (2.0))) < 0.100000001490116119384765625## OR L_BPe8%) <> 0) THEN GOTO L_29004   '@28fc1 DS:1d88
    RETURN   '@28ffa
L_29004:
    L_BPea% = (RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19aa!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19ae!), (2.0))) < 0.100000001490116119384765625##)   '@29004 DS:1d88,1ec0
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19b2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19b6!), (2.0))) < 0.100000001490116119384765625## OR L_BPea%) <> 0) THEN GOTO L_290aa   '@29067 DS:1d88
    RETURN   '@290a0
L_290aa:
    V_0e14$ = "CRUZA"   '@290aa DS:1e98
    RETURN   '@290bc
L_290cb:   ' sub-rotina (alvo de GOSUB)
    L_BP30! = RT_POT##((FX##(L_BP34!)), (2.0)) - RT_POT##(((RT_POT##((FX##(L_BP3c!)), (2.0)) + (RT_POT##((FX##(L_BP34!)), (2.0)) - RT_POT##((FX##(L_BP38!)), (2.0)))) / (FX##(L_BP3c!) * 2.0)), (2.0))   '@290d0 DS:1d88
    IF NOT (L_BP30! > 0.0) THEN GOTO L_29170   '@2913c DS:1d74
    L_BP30! = RT_SQR##(FX##(L_BP30!))   '@29156
    GOTO L_29185   '@29168
L_29170:
    L_BP30! = 0.0   '@29170 DS:1d74
L_29185:
    RETURN   '@29185
L_29194:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020c9a_FUN_2000_0c9a
    V_11b8! = 1.0   '@29199 DS:1d78
L_291b0:
    V_199a! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@291b0
    V_199e! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@291da
    V_19a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@29205
    V_19a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2922d
    L_BPee! = A_15da!(0, 0)   '@29258
    FOR V_11c0! = 1.0 TO L_BPee!   '@29279 DS:1d78
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11c0!)))   '@29280
    IF NOT (V_11bc! <= 0.0) THEN GOTO L_292ce   '@292ab DS:1d74
    GOTO L_2a80c   '@292c6
L_292ce:
    CALL S_20173   '@292ce
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOSUB L_2b23d   '@292d8
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_2a3db   '@292e5
    L_BP34! = RT_SQR##(RT_POT##((FX##(L_BPf2!) - V_199a!), (2.0)) + RT_POT##((FX##(L_BPf6!) - V_199e!), (2.0)))   '@29314 DS:1d88
    L_BP38! = RT_SQR##(RT_POT##((FX##(L_BPf2!) - V_19a2!), (2.0)) + RT_POT##((FX##(L_BPf6!) - V_19a6!), (2.0)))   '@29351 DS:1d88
    L_BP3c! = RT_SQR##(RT_POT##((FX##(V_199a!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_199e!) - V_19a6!), (2.0)))   '@2938e DS:1d88
    GOSUB L_290cb   '@293cb
    L_BP5c! = L_BP30!   '@293d8
    IF NOT (FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 > FX##(L_BP5c!)) THEN GOTO L_2a3d3   '@293e7 DS:1d88
    IF NOT (V_199a! = V_19a2!) THEN GOTO L_29640   '@29428
    L_BP4c! = V_199a!   '@29443
    L_BP54! = V_199a!   '@29453
    L_BP40! = 1.0   '@29463 DS:1d78
    L_BP44! = FX##(L_BPf6!) * -2.0   '@29473 DS:1ed4
    L_BP48! = RT_POT##((FX##(V_199a!) - L_BPf2!), (2.0)) + (RT_POT##((FX##(L_BPf6!)), (2.0)) - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)))   '@29488 DS:1d88
    L_BP50! = (-L_BP44! + RT_SQR##((RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48!) * -(RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48! > FX##(0.0)))) / (FX##(L_BP40!) * 2.0)   '@294f8 DS:1d70,1d74,1d88
    L_BP50! = INT(FX##(L_BP50!) * 100.0) / 100.0   '@29578 DS:1e84
    L_BP58! = (-L_BP44! - RT_SQR##((RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48!) * -(RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48! > FX##(0.0)))) / (FX##(L_BP40!) * 2.0)   '@29598 DS:1d70,1d74,1d88
    L_BP58! = INT(FX##(L_BP58!) * 100.0) / 100.0   '@29618 DS:1e84
    GOTO L_299f2   '@29638
L_29640:
    L_BP40! = RT_POT##((FX##(V_19a6!) - V_199e!), (2.0)) / RT_POT##((FX##(V_19a2!) - V_199a!), (2.0)) + 1.0   '@29640 DS:1d78,1d88
    L_BP44! = FX##(L_BPf2!) * -2.0 - RT_POT##((FX##(V_19a6!) - V_199e!), (2.0)) / RT_POT##((FX##(V_19a2!) - V_199a!), (2.0)) * 2.0 * V_199a! + (FX##(V_19a6!) - V_199e!) * (FX##(V_199e!) - L_BPf6!) / (FX##(V_19a2!) - V_199a!) * 2.0   '@2967f DS:1d88,1ed4
    L_BP48! = RT_POT##((FX##(L_BPf2!)), (2.0)) + RT_POT##((FX##(V_199e!)), (2.0)) + RT_POT##((FX##(V_199a!)), (2.0)) * RT_POT##((FX##(V_19a6!) - V_199e!), (2.0)) / RT_POT##((FX##(V_19a2!) - V_199a!), (2.0)) + ((-V_199e! + FX##(L_BPf6!)) * (FX##(V_19a6!) - V_199e!) / (FX##(V_19a2!) - V_199a!) * 2.0 * V_199a! - FX##(L_BPf6!) * 2.0 * V_199e!) + (RT_POT##((FX##(L_BPf6!)), (2.0)) - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)))   '@296fc DS:1d88
    L_BP4c! = (-L_BP44! + RT_SQR##((RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48!) * -(RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48! > FX##(0.0)))) / (FX##(L_BP40!) * 2.0)   '@29807 DS:1d70,1d74,1d88
    L_BP4c! = INT(FX##(L_BP4c!) * 100.0) / 100.0   '@29887 DS:1e84
    L_BP50! = (FX##(V_19a6!) - V_199e!) * (FX##(L_BP4c!) - V_199a!) / (FX##(V_19a2!) - V_199a!) + V_199e!   '@298a7
    L_BP50! = INT(FX##(L_BP50!) * 100.0) / 100.0   '@298da DS:1e84
    L_BP54! = (-L_BP44! - RT_SQR##((RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48!) * -(RT_POT##((FX##(L_BP44!)), (2.0)) - FX##(L_BP40!) * 4.0 * L_BP48! > FX##(0.0)))) / (FX##(L_BP40!) * 2.0)   '@298fa DS:1d70,1d74,1d88
    L_BP54! = INT(FX##(L_BP54!) * 100.0) / 100.0   '@2997a DS:1e84
    L_BP58! = (FX##(V_19a6!) - V_199e!) * (FX##(L_BP54!) - V_199a!) / (FX##(V_19a2!) - V_199a!) + V_199e!   '@2999a
    L_BP58! = INT(FX##(L_BP58!) * 100.0) / 100.0   '@299cd DS:1e84
L_299f2:
    IF NOT (RT_SQR##(RT_POT##((FX##(V_19a6!) - V_199e!), (2.0)) + RT_POT##((FX##(V_19a2!) - V_199a!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_199e!) - L_BP50!), (2.0)) + RT_POT##((FX##(V_199a!) - L_BP4c!), (2.0))) - RT_SQR##(RT_POT##((FX##(L_BP50!) - V_19a6!), (2.0)) + RT_POT##((FX##(L_BP4c!) - V_19a2!), (2.0))) < FX##(-1.0)) THEN GOTO L_29ab8   '@299f2 DS:1d88,1de4
    L_BP40! = 0.0   '@29aa0 DS:1d74
    GOTO L_29ac8   '@29ab0
L_29ab8:
    L_BP40! = 1.0   '@29ab8 DS:1d78
L_29ac8:
    IF NOT (RT_SQR##(RT_POT##((FX##(V_19a6!) - V_199e!), (2.0)) + RT_POT##((FX##(V_19a2!) - V_199a!), (2.0))) - RT_SQR##(RT_POT##((FX##(V_199e!) - L_BP58!), (2.0)) + RT_POT##((FX##(V_199a!) - L_BP54!), (2.0))) - RT_SQR##(RT_POT##((FX##(L_BP58!) - V_19a6!), (2.0)) + RT_POT##((FX##(L_BP54!) - V_19a2!), (2.0))) < FX##(-1.0)) THEN GOTO L_29b8e   '@29ac8 DS:1d88,1de4
    L_BP44! = 0.0   '@29b76 DS:1d74
    GOTO L_29b9e   '@29b86
L_29b8e:
    L_BP44! = 1.0   '@29b8e DS:1d78
L_29b9e:
    IF NOT (ABS(FX##(L_BP58!) - L_BP50!) < 0.00999999977648258209228515625## AND ABS(FX##(L_BP54!) - L_BP4c!) < 0.00999999977648258209228515625##) THEN GOTO L_29bf8   '@29b9e DS:1eac
    L_BP44! = 0.0   '@29be8 DS:1d74
L_29bf8:
    IF NOT (ABS(FX##(V_19a6!) - L_BP50!) < 0.100000001490116119384765625## AND ABS(FX##(V_19a2!) - L_BP4c!) < 0.100000001490116119384765625## OR ABS(FX##(V_199e!) - L_BP50!) < 0.100000001490116119384765625## AND ABS(FX##(V_199a!) - L_BP4c!) < 0.100000001490116119384765625##) THEN GOTO L_29ca0   '@29bf8 DS:1ec0
    L_BP34! = 0.0   '@29c88 DS:1d74
    GOTO L_29cb0   '@29c98
L_29ca0:
    L_BP34! = 1.0   '@29ca0 DS:1d78
L_29cb0:
    IF NOT (ABS(FX##(V_19a6!) - L_BP58!) < 0.100000001490116119384765625## AND ABS(FX##(V_19a2!) - L_BP54!) < 0.100000001490116119384765625## OR ABS(FX##(V_199e!) - L_BP58!) < 0.100000001490116119384765625## AND ABS(FX##(V_199a!) - L_BP54!) < 0.100000001490116119384765625##) THEN GOTO L_29d58   '@29cb0 DS:1ec0
    L_BP38! = 0.0   '@29d40 DS:1d74
    GOTO L_29d68   '@29d50
L_29d58:
    L_BP38! = 1.0   '@29d58 DS:1d78
L_29d68:
    IF NOT (L_BP40! = 0.0 AND L_BP38! = 0.0 OR L_BP44! = 0.0 AND L_BP34! = 0.0) THEN GOTO L_29de0   '@29d68 DS:1d74
    GOTO L_2a3c9   '@29dd8
L_29de0:
    IF NOT (L_BP38! = 0.0 AND L_BP34! = 0.0 OR L_BP44! = 0.0 AND L_BP40! = 0.0) THEN GOTO L_29e58   '@29de0 DS:1d74
    GOTO L_2a3c9   '@29e50
L_29e58:
    IF NOT (L_BP40! = 0.0) THEN GOTO L_29e95   '@29e58 DS:1d74
    L_BP4c! = L_BP54!   '@29e72
    L_BP50! = L_BP58!   '@29e81
L_29e95:
    IF NOT (L_BP44! = 0.0) THEN GOTO L_29ed2   '@29e95 DS:1d74
    L_BP54! = L_BP4c!   '@29eaf
    L_BP58! = L_BP50!   '@29ebe
L_29ed2:
    IF NOT (RT_POT##((FX##(L_BP4c!) - V_199a!), (2.0)) + RT_POT##((FX##(L_BP50!) - V_199e!), (2.0)) > RT_POT##((FX##(L_BP54!) - V_199a!), (2.0)) + RT_POT##((FX##(L_BP58!) - V_199e!), (2.0))) THEN GOTO L_29f9e   '@29ed2 DS:1d88
    SWAP L_BP4c!, L_BP54!   '@29f48 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP50!, L_BP58!   '@29f5f (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP40!, L_BP44!   '@29f76 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP34!, L_BP38!   '@29f8d (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
L_29f9e:
    IF NOT (L_BP38! = 1.0) THEN GOTO L_2a158   '@29f9e DS:1d78
    A_1664!(0, 0) = FX##(A_1664!(0, 0)) + 1.0   '@29fb8 DS:1d78
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 0) = L_BP54!   '@29fec
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 1) = L_BP58!   '@2a024
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 2) = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@2a05d
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 3) = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2a0ab
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 4) = A_1664!(RT_CINT%(FX##(V_11b8!)), 4)   '@2a0ff
L_2a158:
    IF NOT (L_BP34! = 1.0) THEN GOTO L_2a3c4   '@2a158 DS:1d78
    IF NOT (L_BP44! = 1.0 AND L_BP40! = 1.0) THEN GOTO L_2a31b   '@2a172 DS:1d78
    A_1664!(0, 0) = FX##(A_1664!(0, 0)) + 1.0   '@2a1ae DS:1d78
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 0) = L_BP4c!   '@2a1e2
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 1) = L_BP50!   '@2a21a
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 2) = L_BP54!   '@2a253
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 3) = L_BP58!   '@2a289
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 4) = A_1664!(RT_CINT%(FX##(V_11b8!)), 4)   '@2a2c2
L_2a31b:
    A_1664!(RT_CINT%(FX##(V_11b8!)), 2) = L_BP4c!   '@2a31b
    A_1664!(RT_CINT%(FX##(V_11b8!)), 3) = L_BP50!   '@2a342
    V_19a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@2a36c
    V_19a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2a394
L_2a3c4:
L_2a3c9:
L_2a3d3:
    GOTO L_2a807   '@2a3d3
L_2a3db:
    L_BPfa! = A_16ee!(0, 0)   '@2a3db
    FOR V_11ec! = 1.0 TO L_BPfa!   '@2a3fc DS:1d78
    V_19aa! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BPf2!   '@2a404
    V_19ae! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BPf6!   '@2a433
    V_19b2! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BPf2!   '@2a463 DS:1d78
    V_19b6! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BPf6!   '@2a497 DS:1d78
    CALL S_108ef   '@2a4cc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_2a7d6   '@2a4d6 DS:1e98
    L_BPfc% = (RT_SQR##(RT_POT##((FX##(V_19ba!) - V_199a!), (2.0)) + RT_POT##((FX##(V_19be!) - V_199e!), (2.0))) > 0.100000001490116119384765625##)   '@2a4ed DS:1d88,1ec0
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_19ba!) - V_19a2!), (2.0)) + RT_POT##((FX##(V_19be!) - V_19a6!), (2.0))) > 0.100000001490116119384765625## AND L_BPfc%) <> 0) THEN GOTO L_2a7d1   '@2a550 DS:1d88
    A_1664!(0, 0) = FX##(A_1664!(0, 0)) + 1.0   '@2a589 DS:1d78
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 0) = V_19ba!   '@2a5bd
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 1) = V_19be!   '@2a5f6
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 2) = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@2a630
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 3) = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2a67e
    A_1664!(RT_CINT%(FX##(A_1664!(0, 0))), 4) = A_1664!(RT_CINT%(FX##(V_11b8!)), 4)   '@2a6d2
    A_1664!(RT_CINT%(FX##(V_11b8!)), 2) = V_19ba!   '@2a726
    A_1664!(RT_CINT%(FX##(V_11b8!)), 3) = V_19be!   '@2a74e
    V_19a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@2a779
    V_19a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2a7a1
L_2a7d1:
L_2a7d6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2a7d6 DS:1d78
L_2a807:
L_2a80c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2a811 DS:1d78
    V_11b8! = FX##(V_11b8!) + 1.0   '@2a83d DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11b8!) THEN GOTO L_291b0   '@2a853
    V_11b8! = 1.0   '@2a87d DS:1d78
L_2a894:
    V_199a! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@2a894
    V_199e! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@2a8be
    V_19a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@2a8e9
    V_19a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@2a911
    L_BP100! = A_15da!(0, 0)   '@2a93c
    FOR V_11c0! = 1.0 TO L_BP100!   '@2a95d DS:1d78
    IF NOT (V_11c0! = 1.0) THEN GOTO L_2a998   '@2a964 DS:1d78
    V_11cc! = 1.0   '@2a97f DS:1d78
    GOTO L_2aa61   '@2a990
L_2a998:
    L_BPb4! = 1.0   '@2a998 DS:1d78
    V_11cc! = 2.0   '@2a9a9 DS:1d88
L_2a9c0:
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11cc!) - 1.0)) <> A_0fba$(RT_CINT%(FX##(V_11cc!)))) THEN GOTO L_2aa1a   '@2a9c0 DS:1de4
    L_BPb4! = FX##(L_BPb4!) + 1.0   '@2aa04 DS:1d78
L_2aa1a:
    IF NOT (L_BPb4! = V_11c0!) THEN GOTO L_2aa3d   '@2aa1a
    GOTO L_2aa5c   '@2aa35
L_2aa3d:
    V_11cc! = FX##(V_11cc!) + 1.0   '@2aa3d DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2a9c0   '@2aa53
L_2aa5c:
L_2aa61:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11c0!)))   '@2aa61
    IF NOT (V_11bc! > 0.0) THEN GOTO L_2b1c2   '@2aa8c DS:1d74
    CALL S_20173   '@2aaa7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOSUB L_2b23d   '@2aab1
    L_BP0e! = 0.0   '@2aabe DS:1d74
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_2abd0   '@2aace
    L_BP104! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@2aafd DS:1d88
    V_11d4! = (FX##(V_199a!) + V_19a2!) / 2.0   '@2ab35 DS:1d88
    V_11d8! = (FX##(V_199e!) + V_19a6!) / 2.0   '@2ab50 DS:1d88
    IF NOT (RT_SQR##(RT_POT##((FX##(V_11d4!) - L_BPf2!), (2.0)) + RT_POT##((FX##(V_11d8!) - L_BPf6!), (2.0))) <= FX##(L_BP104!)) THEN GOTO L_2abc8   '@2ab6b DS:1d88
    L_BP0e! = 1.0   '@2abb3 DS:1d78
L_2abc8:
    GOTO L_2aff7   '@2abc8
L_2abd0:
    L_BP108! = A_16ee!(0, 0)   '@2abd0
    FOR V_11ec! = 1.0 TO L_BP108!   '@2abf1 DS:1d78
    V_19aa! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BPf2!   '@2abf8
    V_19ae! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BPf6!   '@2ac27
    V_19b2! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BPf2!   '@2ac57 DS:1d78
    V_19b6! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BPf6!   '@2ac8b DS:1d78
    V_19ba! = (FX##(V_199a!) + V_19a2!) / 2.0   '@2acc0 DS:1d88
    V_19be! = (FX##(V_199e!) + V_19a6!) / 2.0   '@2acdb DS:1d88
    CALL MIXT_0877_Menor(V_19ae!, V_19b6!, L_BP10c!)   '@2acf6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_19ae!, V_19b6!, L_BP110!)   '@2ad0d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_19be! <= L_BP110! AND V_19be! > L_BP10c!) THEN GOTO L_2af04   '@2ad20
    IF NOT (V_19aa! = V_19ba! AND V_19aa! = V_19b2!) THEN GOTO L_2adae   '@2ad58
    L_BP0e! = 1.0   '@2ad96 DS:1d78
    GOTO L_2aff2   '@2ada6
L_2adae:
    CALL MIXT_082a_Maior(V_19aa!, V_19b2!, L_BP114!)   '@2adae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_19ba! > L_BP114!) THEN GOTO L_2ae17   '@2adc6
    IF NOT (V_19ae! <> V_19b6!) THEN GOTO L_2ae0f   '@2addb
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@2adf6 DS:1d78
L_2ae0f:
    GOTO L_2aefc   '@2ae0f
L_2ae17:
    CALL MIXT_0877_Menor(V_19aa!, V_19b2!, L_BP118!)   '@2ae17
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_19ba! > L_BP118!) THEN GOTO L_2aef7   '@2ae2f
    IF NOT (V_19ae! <> V_19b6!) THEN GOTO L_2aeba   '@2ae44
    IF NOT ((FX##(V_19be!) - V_19ae!) * (FX##(V_19b2!) - V_19aa!) / (FX##(V_19b6!) - V_19ae!) + V_19aa! < FX##(V_19ba!)) THEN GOTO L_2aeb2   '@2ae5f
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@2ae9e DS:1d78
L_2aeb2:
    GOTO L_2aef2   '@2aeb2
L_2aeba:
    IF NOT (V_19be! = V_19ae!) THEN GOTO L_2aeed   '@2aeba
    L_BP0e! = 1.0   '@2aed5 DS:1d78
    GOTO L_2aff2   '@2aee5
L_2aeed:
L_2aef2:
L_2aef7:
L_2aefc:
    GOTO L_2afc6   '@2aefc
L_2af04:
    IF NOT (V_19be! = V_19ae! AND V_19ae! = V_19b6!) THEN GOTO L_2afc1   '@2af04
    CALL MIXT_0877_Menor(V_19aa!, V_19b2!, L_BP11c!)   '@2af42
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_19aa!, V_19b2!, L_BP120!)   '@2af59
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_19ba! < L_BP120! AND V_19ba! > L_BP11c!) THEN GOTO L_2afbc   '@2af6c
    L_BP0e! = 1.0   '@2afa4 DS:1d78
    GOTO L_2aff2   '@2afb4
L_2afbc:
L_2afc1:
L_2afc6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2afc6 DS:1d78
L_2aff2:
L_2aff7:
    IF NOT (L_BP0e! > 0.0) THEN GOTO L_2b1bd   '@2aff7 DS:1d74
    IF NOT (FX##(L_BP0e!) / 2.0 <> RT_CLNG&(FX##(L_BP0e!)) \ 2&) THEN GOTO L_2b1b8   '@2b011 DS:1d88
    IF NOT (A_1664!(0, 0) > V_11b8!) THEN GOTO L_2b161   '@2b046
    L_BP124! = A_1664!(0, 0)   '@2b070
    FOR V_11ec! = FX##(V_11b8!) + 1.0 TO L_BP124!   '@2b091 DS:1d78
    FOR V_11d0! = 0.0 TO 4.0   '@2b09e DS:1d70,1d74,1d78
    A_1664!(RT_CINT%(FX##(V_11ec!) - 1.0), RT_CINT%(FX##(V_11d0!))) = A_1664!(RT_CINT%(FX##(V_11ec!)), RT_CINT%(FX##(V_11d0!)))   '@2b0ac DS:1de4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d0!   '@2b104 DS:1d70,1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2b130 DS:1d78
L_2b161:
    A_1664!(0, 0) = FX##(A_1664!(0, 0)) - 1.0   '@2b161 DS:1de4
    V_11b8! = FX##(V_11b8!) - 1.0   '@2b195 DS:1de4
    GOTO L_2b1ee   '@2b1ab
L_2b1b8:
L_2b1bd:
L_2b1c2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2b1c2 DS:1d78
L_2b1ee:
    V_11b8! = FX##(V_11b8!) + 1.0   '@2b1ee DS:1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11b8!) THEN GOTO L_2a894   '@2b204
    RETURN   '@2b22e
L_2b23d:   ' sub-rotina (alvo de GOSUB)
    L_BP128! = A_15da!(RT_CINT%(FX##(V_11c0!)), 0)   '@2b242
    IF NOT (L_BP128! = 0.0) THEN GOTO L_2b375   '@2b26c DS:1d74
    L_BP12a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b287
    IF NOT (L_BP12a% <> 1) THEN GOTO L_2b2cb   '@2b2b2
    IF NOT (L_BP12a% = 3) THEN GOTO L_2b333   '@2b2c1
L_2b2cb:
    L_BPf2! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1))), 0)   '@2b2cb
    GOTO L_2b36d   '@2b32b
L_2b333:
    IF NOT (L_BP12a% = 2) THEN GOTO L_2b36d   '@2b333
    L_BPf2! = A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@2b33d
    GOTO L_2b36d   '@2b365
L_2b36d:
    GOTO L_2b6c2   '@2b36d
L_2b375:
    IF NOT (L_BP128! = -1.0) THEN GOTO L_2b534   '@2b376 DS:1de4
    L_BP12c% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b38b
    IF NOT (L_BP12c% <> 1) THEN GOTO L_2b3cf   '@2b3b6
    IF NOT (L_BP12c% = 3) THEN GOTO L_2b4ad   '@2b3c5
L_2b3cf:
    L_BPf2! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))) * 100.0), 0))   '@2b3cf DS:1e84
    GOTO L_2b52c   '@2b4a5
L_2b4ad:
    IF NOT (L_BP12c% = 2) THEN GOTO L_2b52c   '@2b4ad
    L_BPf2! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@2b4b7 DS:1e84
    GOTO L_2b52c   '@2b524
L_2b52c:
    GOTO L_2b6c2   '@2b52c
L_2b534:
    IF NOT (L_BP128! = -2.0) THEN GOTO L_2b6a4   '@2b535 DS:1ed4
    L_BP12e% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b54a
    IF NOT (L_BP12e% <> 1) THEN GOTO L_2b58e   '@2b575
    IF NOT (L_BP12e% = 3) THEN GOTO L_2b643   '@2b584
L_2b58e:
    L_BPf2! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)))) * 100.0), 0) + A_196c!(RT_CINT%(FX##(V_11c0!)), 1)   '@2b58e DS:1e84
    GOTO L_2b69c   '@2b63b
L_2b643:
    IF NOT (L_BP12e% = 2) THEN GOTO L_2b69c   '@2b643
    L_BPf2! = FX##(A_196c!(RT_CINT%(FX##(V_11c0!)), 1)) + A_15da!(RT_CINT%(FX##(V_11c0!)), 2)   '@2b64d
    GOTO L_2b69c   '@2b694
L_2b69c:
    GOTO L_2b6c2   '@2b69c
L_2b6a4:
    IF NOT (L_BP128! = -3.0) THEN GOTO L_2b6c2   '@2b6a5 DS:1ed8
    GOTO L_2b6c2   '@2b6ba
L_2b6c2:
    L_BP132! = A_15da!(RT_CINT%(FX##(V_11c0!)), 3)   '@2b6c2
    IF NOT (L_BP132! = 0.0) THEN GOTO L_2b7fd   '@2b6ed DS:1d74
    L_BP134% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b708
    IF NOT (L_BP134% <> 1) THEN GOTO L_2b74c   '@2b733
    IF NOT (L_BP134% = 3) THEN GOTO L_2b7b8   '@2b742
L_2b74c:
    L_BPf6! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4))), 1)   '@2b74c
    GOTO L_2b7f5   '@2b7b0
L_2b7b8:
    IF NOT (L_BP134% = 2) THEN GOTO L_2b7f5   '@2b7b8
    L_BPf6! = A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@2b7c2
    GOTO L_2b7f5   '@2b7ed
L_2b7f5:
    GOTO L_2bb50   '@2b7f5
L_2b7fd:
    IF NOT (L_BP132! = -1.0) THEN GOTO L_2b9c1   '@2b7fe DS:1de4
    L_BP136% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b813
    IF NOT (L_BP136% <> 1) THEN GOTO L_2b857   '@2b83e
    IF NOT (L_BP136% = 3) THEN GOTO L_2b938   '@2b84d
L_2b857:
    L_BPf6! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))) * 100.0), 1))   '@2b857 DS:1e84
    GOTO L_2b9b9   '@2b930
L_2b938:
    IF NOT (L_BP136% = 2) THEN GOTO L_2b9b9   '@2b938
    L_BPf6! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@2b942 DS:1e84
    GOTO L_2b9b9   '@2b9b1
L_2b9b9:
    GOTO L_2bb50   '@2b9b9
L_2b9c1:
    IF NOT (L_BP132! = -2.0) THEN GOTO L_2bb32   '@2b9c2 DS:1ed4
    L_BP138% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2b9d7
    IF NOT (L_BP138% <> 1) THEN GOTO L_2ba1b   '@2ba02
    IF NOT (L_BP138% = 3) THEN GOTO L_2bad1   '@2ba11
L_2ba1b:
    L_BPf6! = FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11c0!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)))) * 100.0), 1) + A_196c!(RT_CINT%(FX##(V_11c0!)), 2)   '@2ba1b DS:1e84
    GOTO L_2bb2a   '@2bac9
L_2bad1:
    IF NOT (L_BP138% = 2) THEN GOTO L_2bb2a   '@2bad1
    L_BPf6! = FX##(A_196c!(RT_CINT%(FX##(V_11c0!)), 2)) + A_15da!(RT_CINT%(FX##(V_11c0!)), 5)   '@2badb
    GOTO L_2bb2a   '@2bb22
L_2bb2a:
    GOTO L_2bb50   '@2bb2a
L_2bb32:
    IF NOT (L_BP132! = -3.0) THEN GOTO L_2bb50   '@2bb33 DS:1ed8
    GOTO L_2bb50   '@2bb48
L_2bb50:
    RETURN   '@2bb50
L_2bb5f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020c9a_FUN_2000_0c9a
    REDIM A_1692!(-32768 TO -32768, -32768 TO -32768)   '@2bb64
    REDIM A_1692!(0 TO CINT(A_1636!(0, 0) + 30.0), 0 TO 4)   '@2bb72 DS:1edc
    L_BP13c! = A_1636!(0, 0)   '@2bbac
    FOR V_11b8! = 0.0 TO L_BP13c!   '@2bbcd DS:1d74,1d78
    FOR L_BPb4! = 0.0 TO 4.0   '@2bbd4 DS:1d70,1d74,1d78
    A_1692!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BPb4!))) = A_1636!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(L_BPb4!)))   '@2bbe2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPb4!   '@2bc35 DS:1d70,1d78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@2bc5e DS:1d78
    IF NOT (A_1692!(0, 0) = 0.0) THEN GOTO L_2bcbe   '@2bc8a DS:1d74
    RETURN   '@2bcb4
L_2bcbe:
    RETURN   '@2bcbe
L_2bccd:   ' entrada vinda de 020c9a_FUN_2000_0c9a
    ERASE L_BP2c%   '@2bccd
    ' END SUB   '@2bcd6
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_FORMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
