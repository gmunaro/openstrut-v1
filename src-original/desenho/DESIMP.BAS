' ============================================================================
'  DESIMP - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/DESIMP/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 9959062079cb8c05a50a174f2b3d6b7255a4caa7df61adcf73e145c61e5b803b
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_DESENHO.BI'

' ---- variaveis do DESIMP fora do COMMON (DS do programa)
DIM SHARED V_1e06!
DIM SHARED V_1f12$
DIM SHARED V_1f16!
DIM SHARED V_1f1a!
DIM SHARED V_1f1e!
DIM SHARED V_1f22!
DIM SHARED V_1f26!
DIM SHARED V_1f2a!
DIM SHARED V_1f2e!
DIM SHARED V_1f32!
DIM SHARED V_1f36!
DIM SHARED V_1f3a!
DIM SHARED V_1f3e!
DIM SHARED V_1f42!
DIM SHARED V_1f46!
DIM SHARED V_1f4a!
DIM SHARED V_1f4e!
DIM SHARED V_1f52!
DIM SHARED V_1f56!
DIM SHARED V_1f5a!
DIM SHARED V_1f5e!
DIM SHARED V_1f62!
DIM SHARED V_1f66!
DIM SHARED V_1f6a!
DIM SHARED V_1f6e!
DIM SHARED V_1f72!
DIM SHARED V_1f76!
DIM SHARED V_1f7a!
DIM SHARED V_1f7e!
DIM SHARED V_1f82!
DIM SHARED V_1f86!
DIM SHARED V_1f8a!
DIM SHARED V_1f8e$

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "DESIMP"
' ---- M_DESIMP @0x10030  (010030_M_DESIMP.lift.txt; evidence_id (assembly): ev_4c078dd6cbd466e073c46de523388384f447b88d0f0ff62d4cf63cf5cfae3de7)
' @10030 inicio do programa (B$?EVT)
GOTO L_101ac   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101ac:
L_101b1:   ' entrada vinda de 010390_F_10390
ON ERROR GOTO L_10799
RT_ONERR = &H10799   '@101b6
GOSUB L_10395   '@101c5
IF NOT (V_1846$ = "S") THEN GOTO L_101f3   '@101d2 DS:1ffa
CALL S_107d6   '@101e9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY pelo roteiro (entre comandos)
L_101f3:
IF NOT (V_1852$ = "S") THEN GOTO L_10214   '@101f3 DS:1ffa
CALL S_30155   '@1020a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY pelo roteiro (entre comandos)
L_10214:
L_10219:
ON ERROR GOTO L_102a9
RT_ONERR = &H102a9   '@1021e
V_0dfc$ = "DESIMP"   '@1022d DS:2000
V_1f26! = RT_FRE&("")   '@1023f DS:1fa0
L_BP0c% = (LEN(V_0dc8$) > 3)   '@10259
CHDIR RT_ARQ$(RT_LEFT$((V_0dc8$), (LEN(V_0dc8$) + L_BP0c%)))   '@10278
RT_CHAIN V_0dc8$ + "DESINIT"   '@1028c DS:200a
L_102a9:
RESUME L_102c0   '@102ae
L_102c0:
BEEP   '@102c5
L_BP0c% = (V_0dc8$ = "A:\")   '@102cf DS:2016
IF NOT ((V_0dc8$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_10388   '@102f4 DS:201e
RT_VIEWPRINT 25, 25   '@10309
RT_CLS 2   '@10318
PRINT " Coloque o Disco DESINIT no Drive "; V_0dc8$;   '@10326 DS:2026
CALL MIXT_07f1_LimpaTeclado   '@1033d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY pelo roteiro (entre comandos)
V_0e00$ = RT_INPUT$(1)   '@10347
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY pelo roteiro (entre comandos)
RT_CLS 2   '@10363
RT_VIEWPRINT 1, 25   '@10371
L_10388:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY no laco (B$EVCK)
GOTO L_10219   '@10388
' ---- F_10390 @0x10390  (010390_F_10390.lift.txt; evidence_id (assembly): ev_eb7f254887f990ac03ae36e645b38bbac66407b99b5478ea4df4ba69809ba38e)
L_10395:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_DESIMP
FOR V_1e06! = 1.0 TO 10.0   '@1039a DS:204c,2050
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_1063b
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 1   '@103a8
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@103c2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@103d7 DS:204c,2050
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@10400
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10428
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@10450
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10478
FOR V_1e06! = 15.0 TO 18.0   '@104a0 DS:204c,2054,2058
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_10666
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 2   '@104ae
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@104c8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@104dd DS:204c,2058
ON KEY(2) GOSUB L_10666
RT_ONKEY 2, 2   '@10506
KEY(2) ON
RT_KEYESTADO 2, 1   '@10519
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10527
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1054f
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@10577
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1059f
FOR V_1e06! = 19.0 TO 22.0   '@105c6 DS:204c,205c,2060
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_1076b
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 3   '@105d4
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@105ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@10603 DS:204c,2060
RETURN   '@1062c
L_1063b:
BEEP   '@10640
GOSUB L_10395   '@1064a
RETURN   '@10657
L_10666:
RT_VIEWPRINT 1, 25   '@1066b
COLOR 7, 0, 0   '@1067d
RT_CLS 0   '@106a1
PRINT " Aguarde ..."   '@106ae DS:2064
PRINT ""   '@106bc DS:1fa0
PRINT " Retorno ao Modulo Gerenciador"   '@106ca DS:2074
ON ERROR GOTO L_1071b
RT_ONERR = &H1071b   '@106d8
RT_RUN RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7)) + "SISTRUT"   '@106e7 DS:2096
L_1071b:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7))   '@10720 DS:20a2
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@1074e DS:1fbe
RT_FIM   '@1075c (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_1076b:
BEEP   '@10770
GOSUB L_10395   '@1077a
RETURN L_101b1   '@10791
' ---- F_10794 @0x10794  (010794_F_10794.lift.txt; evidence_id (assembly): ev_fd654647f317a2d7b0a29d4701d00033148bc35f09ed26b09cf854f14d454ebc)
L_10799:   ' entrada vinda de 010030_M_DESIMP
RESUME L_107b0   '@1079e
L_107b0:
ON ERROR GOTO L_10799
RT_ONERR = &H10799   '@107b5
CALL S_250a7   '@107c4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1063b, L_10666, L_1076b   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1e627   '@107ce
' ---- F_1e627 @0x1e627  (01e627_F_1e627.lift.txt; evidence_id (assembly): ev_5605b1e819f13110a08fbf10e34a30d0f6beddb0b3f3a28b32d574d737547df2)
L_1e627:   ' entrada vinda de 010794_F_10794
RT_FIM   ' @1e627 B$CENP (inicio/fim do modulo)
' ---- F_1e62c @0x1e62c  (01e62c_F_1e62c.lift.txt; evidence_id (assembly): ev_f3b822d25daecd3d6836d85b79be2c1dafbeb038d4f1dae49c07753853005876)
'RETRAD? @1e62c ?? 38 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 19 instr.): SBB AL, 0xc0; ADC AL, byte ptr [BX + SI] ...
' ---- M_DESAUXIM @0x20030  (020030_M_DESAUXIM.lift.txt; evidence_id (assembly): ev_7d98c6ee735b86b4b369e7c0ec43ebd02cd555d8769edb3ed322ec4df5a65d83)
' @20030 inicio do programa (B$?EVT)
GOTO L_2509f   '@20148
' ---- FUN_2000_509f @0x2509f  (02509f_FUN_2000_509f.lift.txt; evidence_id (assembly): ev_8cd0c73e18ec2daa511028e8296d329b84e378812bf4c832bc278003e33a801f)
L_2509f:   ' entrada vinda de 020030_M_DESAUXIM
GOTO L_2521c   '@2509f
' ---- FUN_2000_521c @0x2521c  (02521c_FUN_2000_521c.lift.txt; evidence_id (assembly): ev_d5cf85bdaac51afc340e05870ee3cfb9ac58fedd3cfe39fd39fc06939ba9b81f)
L_2521c:   ' entrada vinda de 02509f_FUN_2000_509f
GOTO L_2ea7b   '@2521c
' ---- RT_EA @0x2ea7b  (02ea7b_RT_EA.lift.txt; evidence_id (assembly): ev_65f77f85913b8789b77fd34ec70495e0b2310976f8907f93b69a9da3d80b9652)
L_2ea7b:   ' entrada vinda de 02521c_FUN_2000_521c
RT_FIM   ' @2ea7b B$CENP (inicio/fim do modulo)
' ---- M_DESCAD @0x30030  (030030_M_DESCAD.lift.txt; evidence_id (assembly): ev_2b24e907b6f623c19c67872c4ca498456f957977d236e47e3f4c35bf93482d6f)
' @30030 inicio do programa (B$?EVT)
GOTO L_38799   '@3014d
' ---- RT_EA @0x38799  (038799_RT_EA.lift.txt; evidence_id (assembly): ev_3eb2c336668414afb9846c63d33295d54c1c63702d17e98bd56c04f0350ec449)
L_38799:   ' entrada vinda de 030030_M_DESCAD
RT_FIM   ' @38799 B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x50f20 (chamada por CALL SUB_50f20 no lift).
' Versao C; DS do original: inicio DS:2812, CR LF DS:280C, fim DS:280F, margem em [DS:2AE1], ESC L em [DS:280A].
SUB RT_ROTINA_0F20
    SELECT CASE RT_MODO
        CASE 9
            RT_COPIA_TELA "C", 0, 344, 320, "          ", CHR$(27) + "L" + CHR$(176) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE 3
            RT_COPIA_TELA "C", 0, 344, 360, "          ", CHR$(27) + "L" + CHR$(176) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE ELSE
            RT_COPIA_TELA "C", 0, 200, 320, "       ", CHR$(27) + "K" + CHR$(144) + CHR$(1), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
    END SELECT
END SUB

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    V_1e06! = 0
    V_1f12$ = ""
    V_1f16! = 0
    V_1f1a! = 0
    V_1f1e! = 0
    V_1f22! = 0
    V_1f26! = 0
    V_1f2a! = 0
    V_1f2e! = 0
    V_1f32! = 0
    V_1f36! = 0
    V_1f3a! = 0
    V_1f3e! = 0
    V_1f42! = 0
    V_1f46! = 0
    V_1f4a! = 0
    V_1f4e! = 0
    V_1f52! = 0
    V_1f56! = 0
    V_1f5a! = 0
    V_1f5e! = 0
    V_1f62! = 0
    V_1f66! = 0
    V_1f6a! = 0
    V_1f6e! = 0
    V_1f72! = 0
    V_1f76! = 0
    V_1f7a! = 0
    V_1f7e! = 0
    V_1f82! = 0
    V_1f86! = 0
    V_1f8a! = 0
    V_1f8e$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_1063b: BEEP; GOSUB L_10395; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_10666: sai da SUB (RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; PRINT ""; PRI)
        CASE 3   ' L_1076b: sai da SUB (BEEP; GOSUB L_10395; RETURN L_101b1)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H102a9: ON ERROR GOTO L_102a9
        CASE &H1071b: ON ERROR GOTO L_1071b
        CASE &H10799: ON ERROR GOTO L_10799
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_107d6   ' entrada de SUB/FUNCTION (B$ENRA, locais 1482 bytes) (0x107d6)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26$
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a$
    DIM L_BP3c%
    DIM L_BP3e%
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
    DIM L_BPd0%
    DIM L_BPd2%
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
    ' ---- FUN_1000_07d6 @0x107d6  (0107d6_FUN_1000_07d6.lift.txt; evidence_id (assembly): ev_cfce8acfa3bec02baccb647449bdeab89f3518e57d7e8cacf77c8ac45a26553d)
    V_0f6a! = VAL(V_184a$) * 1131.31005859375## / 100.0#   '@107ed DS:20c0,20c8
    IF NOT (V_17f2$ = "HER") THEN GOTO L_1084c   '@10811 DS:20d0
    V_0f6a! = VAL(V_184a$) * 1272.7249755859375## / 100.0#   '@10828 DS:20c8,20d8
L_1084c:
    V_0f72! = V_0e5c! / (2.0 * FX##(V_0f6a!))   '@1084c DS:20e0
    L_BP0e! = 0.0   '@1086a DS:20e4
    L_BP12! = 0.0   '@1087a DS:20e4
    L_BP22! = FX##(V_0ddc!) + V_0de4!   '@1088a
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP22!   '@108a0 DS:204c
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e14!))) < L_BP0e!) THEN GOTO L_10902   '@108ac
    L_BP0e! = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@108dc
L_10902:
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) > FX##(L_BP12!)) THEN GOTO L_10996   '@10902
    L_BP12! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@10951
L_10996:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@10996 DS:204c
    L_BP26$ = V_17f2$   '@109c1
    IF NOT (L_BP26$ <> "HER") THEN GOTO L_10a0e   '@109d3 DS:20d0
    IF NOT (L_BP26$ <> "EGA") THEN GOTO L_10a0e   '@109ea DS:20e8
    IF NOT (L_BP26$ = "VGA") THEN GOTO L_10a27   '@109fc DS:20f0
L_10a0e:
    V_18e6! = 0.94480001926422119140625##   '@10a0e DS:20f8
    GOTO L_10a3d   '@10a1f
L_10a27:
    V_18e6! = 0.472400009632110595703125##   '@10a27 DS:20fc
L_10a3d:
    L_BP2a! = V_0e60! / ((FX##(L_BP12!) - L_BP0e!) * 25.0) * 2.0   '@10a3d DS:20e0,2100
    L_BP2e! = V_0e60! / ((FX##(L_BP12!) - L_BP0e!) * 4.0)   '@10a63 DS:2104
    CALL MIXT_0877_Menor(L_BP2e!, V_18e6!, L_BP32!)   '@10a7d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2a!, L_BP32!, L_BP36!)   '@10a8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_18e6! = L_BP36!   '@10aa0
    L_BP16! = L_BP0e!   '@10aaa
    L_BP0e! = -3.0 * FX##(V_0e68!) / V_0f72!   '@10ab9 DS:2108
    L_BP12! = V_0f6a! - 3.0 * FX##(V_0e68!) / V_0f72!   '@10ad3 DS:210c
    RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@10af5
    RT_LPTABRE: RT_LPS V_0f96$: RT_LPFIM   '@10b0e
L_10b26:
    RT_VIEWPRINT 1, 25   '@10b26
    GOSUB L_10bcf   '@10b38
    RT_ROTINA_0F20   '@10b45 (rotina em assembly ligada ao EXE (SUB_50f20); gerada no fim do programa)
    L_BP0e! = L_BP12!   '@10b4f
    L_BP12! = V_0e5c! / (2.0 * FX##(V_0f72!)) + L_BP0e!   '@10b5e DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) <= L_BP0e!) THEN GOTO L_10b26   '@10b7f DS:204c
    CALL S_20150   '@10bb8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_1e60d   '@10bc2
    ' ---- F_10bca @0x10bca  (010bca_F_10bca.lift.txt; evidence_id (assembly): ev_f73c6e2833208e5121b9d0f23decf4c58e363938e03684c1e88149d7cb74dc39)
L_10bcf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0107d6_FUN_1000_07d6
    L_BP3a$ = V_17f2$   '@10bd4
    IF NOT (L_BP3a$ <> "EGA") THEN GOTO L_10c0f   '@10be6 DS:20e8
    IF NOT (L_BP3a$ = "VGA") THEN GOTO L_10c43   '@10bfd DS:20f0
L_10c0f:
    RT_SCREEN 9   '@10c0f
    COLOR , 1   '@10c25
    GOTO L_10c8b   '@10c3b
L_10c43:
    IF NOT (L_BP3a$ = "HER") THEN GOTO L_10c73   '@10c43 DS:20d0
    RT_SCREEN 3   '@10c55
    GOTO L_10c8b   '@10c6b
L_10c73:
    RT_SCREEN 2   '@10c73
L_10c8b:
    RT_CLS 0   '@10c8b
    GOSUB L_112b4   '@10c98
    GOSUB L_12cef   '@10ca5
    GOSUB L_161a5   '@10cb2
    GOSUB L_19428   '@10cbf
    GOSUB L_19f6d   '@10ccc
    GOSUB L_1a7ea   '@10cd9
    GOSUB L_1db9a   '@10ce6
    RETURN   '@10cf3
L_10d02:   ' sub-rotina (alvo de GOSUB)
    V_0e30! = FX##(RT_CINT%(FX##(V_0e30!) / V_0e68!)) * V_0e68! - FX##(L_BP0e!) * V_0f72!   '@10d07
    IF NOT (L_BP0e! <= 0.0 AND V_0e30! < 0.0) THEN GOTO L_10d86   '@10d38 DS:20e4
    V_0e30! = 2.0   '@10d75 DS:20e0
L_10d86:
    L_BP3c% = (FX##(V_0e5c!) / 2.0 - 1.0 <= FX##(V_0e30!))   '@10d86 DS:20e0,20e4,2110
    IF NOT ((FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! <= FX##(0.0) OR L_BP3c%) <> 0) THEN GOTO L_10def   '@10dba
    RETURN   '@10de5
L_10def:
    IF NOT (V_0e30! < 0.0) THEN GOTO L_10e4f   '@10def DS:20e4
    V_0dfc$ = RT_MID2$((V_0dfc$), (RT_CINT%(-V_0e30! / FX##(V_0e68!) + 1.0)))   '@10e0a DS:204c
    V_0e30! = 0.0   '@10e3e DS:20e4
L_10e4f:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) > L_BP12! AND FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! > FX##(V_0e5c!) / 2.0 - 1.0) THEN GOTO L_10f00   '@10e4f DS:204c,20e0,2110
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_CINT%((FX##(V_0e5c!) / 2.0 - V_0e30!) / V_0e68!)))   '@10eca DS:20e0
L_10f00:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) <= L_BP12! AND FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! > FX##(V_0e5c!) / 2.0 - 2.0) THEN GOTO L_10fac   '@10f00 DS:204c,20e0,2114
    V_0e30! = FX##(V_0e5c!) / 2.0 - 3.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@10f7b DS:20e0,2108
L_10fac:
    CALL MIXT_08c4_TextoGrafico(V_0e30!, V_0e34!, V_0dfc$, V_17f2$)   '@10fac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@10fc6
L_10fd5:   ' sub-rotina (alvo de GOSUB)
    V_0e30! = FX##(RT_CINT%(FX##(V_0e30!) / V_0e68!)) * V_0e68! - FX##(L_BP0e!) * V_0f72!   '@10fda
    IF NOT (L_BP0e! <= 0.0 AND FX##(V_0e5c!) / 2.0 > FX##(V_0e30!)) THEN GOTO L_11068   '@1100b DS:20e0,20e4
    V_0e30! = FX##(V_0e5c!) / 2.0 + 2.0   '@1104d DS:20e0
L_11068:
    L_BP3e% = (FX##(V_0e5c!) - 1.0 <= FX##(V_0e30!))   '@11068 DS:20e0,2110
    IF NOT ((FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! <= FX##(V_0e5c!) / 2.0 OR L_BP3e%) <> 0) THEN GOTO L_110d1   '@1109c
    RETURN   '@110c7
L_110d1:
    IF NOT (FX##(V_0e5c!) / 2.0 > FX##(V_0e30!)) THEN GOTO L_11142   '@110d1 DS:20e0
    V_0dfc$ = RT_MID2$((V_0dfc$), (RT_CINT%((FX##(V_0e5c!) / 2.0 - V_0e30!) / V_0e68! + 1.0)))   '@110f1 DS:204c,20e0
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1112c DS:20e0
L_11142:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) > L_BP12! AND FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! > FX##(V_0e5c!) - 1.0) THEN GOTO L_111e9   '@11142 DS:204c,2110
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_CINT%((FX##(V_0e5c!) - V_0e30!) / V_0e68!)))   '@111b8
L_111e9:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) <= L_BP12! AND FX##(LEN(V_0dfc$)) * V_0e68! + V_0e30! > FX##(V_0e5c!) - 2.0) THEN GOTO L_1128b   '@111e9 DS:204c,2114
    V_0e30! = FX##(V_0e5c!) - 3.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@1125f DS:2108
L_1128b:
    CALL MIXT_08c4_TextoGrafico(V_0e30!, V_0e34!, V_0dfc$, V_17f2$)   '@1128b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@112a5
L_112b4:   ' sub-rotina (alvo de GOSUB)
    L_BP42! = V_185a!   '@112b9
    FOR V_0e14! = 0.0 TO L_BP42!   '@112ca DS:204c,20e4
    IF NOT (A_1a68!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP0e! OR A_1a68!(RT_CINT%(FX##(V_0e14!)), 0) >= L_BP12!) THEN GOTO L_11348   '@112d2
    GOTO L_11a61   '@11340
L_11348:
    IF NOT (A_1a68!(RT_CINT%(FX##(V_0e14!)), 0) = A_1a68!(RT_CINT%(FX##(V_0e14!)), 2)) THEN GOTO L_1139b   '@11348
    GOTO L_115d2   '@11393
L_1139b:
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1139b DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@113b1 DS:2110,2118
    IF NOT ((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_11439   '@113cc DS:211c
    V_0e30! = 0.0   '@1140f DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@11420 DS:211c
L_11439:
    L_BP46! = 0.0   '@11439 DS:20e4
    L_BP4a! = (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!   '@1144a
    CALL MIXT_082a_Maior(L_BP46!, L_BP4a!, L_BP4e!)   '@11476
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52! = 0.0   '@11488 DS:20e4
    L_BP56! = FX##(V_0e60!) - 1.0   '@11493 DS:2110
    L_BP5a! = (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! + V_0e34!   '@114a3
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@114d5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP52!, L_BP5e!, L_BP62!)   '@114e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP66! = FX##(V_0e5c!) / 2.0 - 1.0   '@114f8 DS:20e0,2110
    L_BP6a! = (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1152b
    CALL MIXT_0877_Menor(L_BP66!, L_BP6a!, L_BP6e!)   '@11555
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP4e!) + V_0e30!), L_BP62!, RT_SNG!(FX##(L_BP6e!) + V_0e30!), RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@11567
    GOTO L_11a61   '@115c5
L_115d2:
    IF NOT ((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0 AND (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1166f   '@115d7 DS:211c
    GOTO L_118c4   '@11667
L_1166f:
    L_BP72! = FX##(V_0e60!) / 2.0   '@1166f DS:20e0
    L_BP76! = FX##(V_0e60!) - 1.0   '@11685 DS:2110
    L_BP7a! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6!   '@11695 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP76!, L_BP7a!, L_BP7e!)   '@116d4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP72!, L_BP7e!, L_BP82!)   '@116e5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP86! = FX##(V_0e60!) / 2.0   '@116f8 DS:20e0
    L_BP8a! = FX##(V_0e60!) - 1.0   '@11753 DS:2110
    L_BP8e! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP16!) * V_18e6!   '@11764 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP8a!, L_BP8e!, L_BP92!)   '@117a4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP86!, L_BP92!, L_BP96!)   '@117b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP82!, RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP96!, 9, V_191a%, 0   '@117cd DS:20e0
    IF NOT ((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP16!) * V_18e6! <= FX##(V_0e60!) / 8.0 AND (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! <= FX##(V_0e60!) / 8.0) THEN GOTO L_118bf   '@11827 DS:211c
    GOTO L_11a61   '@118b7
L_118bf:
L_118c4:
    L_BP9a! = 0.4000000059604644775390625## * V_0e60!   '@118c9 DS:2120
    L_BP9e! = 0.0   '@118e0 DS:20e4
    L_BPa2! = (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@118ec DS:211c
    CALL MIXT_082a_Maior(L_BP9e!, L_BPa2!, L_BPa6!)   '@11927
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP9a!, L_BPa6!, L_BPaa!)   '@1193b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPae! = 0.4000000059604644775390625## * V_0e60!   '@11950 DS:2120
    L_BPb2! = 0.0   '@1199f DS:20e4
    L_BPb6! = (FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@119ab DS:211c
    CALL MIXT_082a_Maior(L_BPb2!, L_BPb6!, L_BPba!)   '@119e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BPae!, L_BPba!, L_BPbe!)   '@119fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!), L_BPaa!, RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!), L_BPbe!, 9, V_191a%, 0   '@11a0f
L_11a61:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11a66 DS:204c
    IF NOT (V_1842$ <> "N") THEN GOTO L_11b9e   '@11a91 DS:2124
    L_BPc2! = A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)   '@11aa8 DS:204c,20e4,212a
    CALL MIXT_0877_Menor(L_BP12!, L_BPc2!, L_BPc6!)   '@11b1f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) = L_BPc2!   '@11b33 DS:204c
    RT_LINE RT_SNG!(FX##(L_BP0e! < 0.0) * L_BP0e! * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60!), RT_SNG!((FX##(L_BPc6!) - L_BP0e!) * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60!), 9, V_191e%, 0   '@11b5e DS:212a
L_11b9e:
    L_BPca! = FX##(V_0ddc!) + 1.0   '@11b9e DS:204c
    FOR V_0e14! = 0.0 TO L_BPca!   '@11bb5 DS:204c,20e4
    IF NOT (V_1842$ = "N") THEN GOTO L_11bdb   '@11bbc DS:2124
    GOTO L_121bf   '@11bd3
L_11bdb:
    CALL MIXT_0877_Menor(V_0e14!, V_0ddc!, L_BPce!)   '@11bdb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0e14! <= V_0ddc! AND A_1a0c!(RT_CINT%(FX##(L_BPce!) + 1.0), 0) < L_BP0e! OR A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) > L_BP12!) THEN GOTO L_11c85   '@11bf3 DS:204c
    GOTO L_1243d   '@11c7d
L_11c85:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) > L_BP0e!) THEN GOTO L_11d6b   '@11c85
    RT_LINE RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60! - 3.0), RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60! + 3.0), 9, V_191e%, 0   '@11cb8 DS:2108,210c,212a
L_11d6b:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) < L_BP12!) THEN GOTO L_11e54   '@11d6b
    RT_LINE RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP0e!) * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60! - 3.0), RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP0e!) * V_0f72!), RT_SNG!(0.935000002384185791015625## * V_0e60! + 3.0), 9, V_191e%, 0   '@11d9f DS:2108,210c,212a
L_11e54:
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e14!) AND V_0e14! > 0.0 OR (V_0de4! = 1.0 AND FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR V_0de0! = 1.0 AND V_0e14! = 0.0)) THEN GOTO L_11fe7   '@11e54 DS:204c,20e4
    V_0dfc$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@11f08
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@11f4c DS:20e0
    V_0e34! = 0.935000002384185791015625## * V_0e60! - 3.0   '@11fba DS:2108,212a
    GOSUB L_10d02   '@11fd5
L_11fe7:
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e14!) AND V_0e14! > 0.0 OR (V_0de4! = 1.0 AND FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR V_0de0! = 1.0 AND V_0e14! = 0.0)) THEN GOTO L_121ba   '@11fe7 DS:204c,20e4
    V_0dfc$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + "/" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@1209b DS:212e
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@12124 DS:20e0
    V_0e34! = FX##(V_0e60!) - 2.0   '@12192 DS:2114
    GOSUB L_10d02   '@121a8
L_121ba:
L_121bf:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!)) THEN GOTO L_121ec   '@121c4 DS:204c
    GOTO L_1243d   '@121e4
L_121ec:
    IF NOT (V_1842$ <> "N") THEN GOTO L_122e6   '@121ec DS:2124
    V_0dfc$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@12203
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@12246 DS:204c,20e0
    V_0e34! = 0.935000002384185791015625## * V_0e60! - 3.0   '@122b9 DS:2108,212a
    GOSUB L_10d02   '@122d4
L_122e6:
    V_0dfc$ = RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (2))   '@122e6
    IF NOT (V_1842$ <> "N") THEN GOTO L_123c2   '@1231a DS:2124
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@12331 DS:204c,20e0
    V_0e34! = FX##(V_0e60!) - 2.0   '@123a4 DS:2114
    GOTO L_1242b   '@123ba
L_123c2:
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) * V_0f72! + FX##(V_0e68!) / 2.0   '@123c2 DS:204c,20e0
    V_0e34! = FX##(V_0e60!) - 2.0 - 0.7799999713897705078125## * V_0e60!   '@12403 DS:2114,2134
L_1242b:
    GOSUB L_10d02   '@1242b
L_1243d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@12442 DS:204c
    FOR V_0e14! = 2.0 TO 5.0   '@1246e DS:204c,20e0,215e
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "") THEN GOTO L_124bd   '@1247c DS:1fa0
    GOTO L_1296e   '@124b5
L_124bd:
    V_0e20! = VAL(A_1c90$(RT_CINT%(FX##(V_0e14!))))   '@124bd
    IF NOT (FX##(V_0ddc!) + V_0de4! < FX##(V_0e20!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e20!)) THEN GOTO L_1253b   '@124eb DS:204c
    GOTO L_1296e   '@12533
L_1253b:
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "E") THEN GOTO L_125be   '@1253b DS:2138
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) * V_0f72! + V_0e68!   '@12574
    V_0e34! = 0.185000002384185791015625## * V_0e60!   '@125a8 DS:213e
L_125be:
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "C") THEN GOTO L_1266d   '@125be DS:2142
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) * V_0f72! / 2.0 + 36.0 * FX##(V_0e68!)   '@125f7 DS:20e0,2148
    V_0e34! = 0.824999988079071044921875## * V_0e60!   '@12657 DS:214c
L_1266d:
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "D") THEN GOTO L_126f9   '@1266d DS:2150
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) * V_0f72! - 2.5 * FX##(V_0e68!)   '@126a6 DS:2156
    V_0e34! = 0.185000002384185791015625## * V_0e60!   '@126e3 DS:213e
L_126f9:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) - 1.0))), (2))   '@126f9 DS:2110
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "C") THEN GOTO L_1277d   '@1272f DS:2142
    GOSUB L_10fd5   '@12768
    GOTO L_1278a   '@12775
L_1277d:
    GOSUB L_10d02   '@1277d
L_1278a:
    L_BPd0% = (V_0e30! < V_0e5c! AND FX##(V_0e5c!) / 2.0 - 1.0 < FX##(V_0e30!))   '@1278a DS:20e0,2110
    IF NOT ((RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) = "C" AND L_BPd0%) <> 0) THEN GOTO L_1287c   '@127f3 DS:2142
    ' @12813 CIRCLE aspecto 1.0   ' DS:204c,20e0
    RT_CIRCLE RT_SNG!(FX##(V_0e68!) / 2.0 + V_0e30!), RT_SNG!(V_0e34! - FX##(V_0e68!) / 2.0), RT_SNG!(0.75 * FX##(V_0e68!)), 1024, 0, 0, 0, 1.0   '@12860 DS:215a
L_1287c:
    L_BPd2% = (FX##(V_0e5c!) / 2.0 > FX##(V_0e30!) AND V_0e30! > 0.0)   '@1287c DS:20e0,20e4
    IF NOT ((RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e14!)))), (3), (1)) <> "C" AND L_BPd2%) <> 0) THEN GOTO L_12969   '@128e0 DS:2142
    ' @12900 CIRCLE aspecto 1.0   ' DS:204c,20e0
    RT_CIRCLE RT_SNG!(FX##(V_0e68!) / 2.0 + V_0e30!), RT_SNG!(V_0e34! - FX##(V_0e68!) / 2.0), RT_SNG!(0.75 * FX##(V_0e68!)), 1024, 0, 0, 0, 1.0   '@1294d DS:215a
L_12969:
L_1296e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@12973 DS:204c,215e
    L_BPd6! = V_0ddc!   '@1299f
    FOR V_0e28! = 0.0 TO L_BPd6!   '@129b1 DS:204c,20e4
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e28!)), 0) < FX##(L_BP0e!) OR A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > L_BP12!) THEN GOTO L_12a50   '@129b8
    GOTO L_12b95   '@12a48
L_12a50:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) < L_BP0e!) THEN GOTO L_12a8c   '@12a50
    GOTO L_12ad2   '@12a84
L_12a8c:
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - L_BP0e!) * V_0f72!   '@12a8c
    GOSUB L_12bd5   '@12ac0
L_12ad2:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e28!)), 0) > FX##(L_BP12!)) THEN GOTO L_12b31   '@12ad7
    GOTO L_12b95   '@12b29
L_12b31:
    V_0e30! = (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - L_BP0e! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) * V_0f72!   '@12b31
    GOSUB L_12bd5   '@12b83
L_12b95:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@12b9a DS:204c
    RETURN   '@12bc6
L_12bd5:   ' sub-rotina (alvo de GOSUB)
    V_0e34! = FX##(V_0e60!) / 4.0   '@12bda DS:2104
L_12bf6:
    IF NOT (3.0 * FX##(V_0e60!) / 4.0 >= FX##(V_0e34!)) THEN GOTO L_12c68   '@12bf7 DS:2104,210c
    RT_PSET RT_SNG!(FX##(V_0e5c!) / 2.0 + V_0e30!), V_0e34!, 0, 0   '@12c16 DS:20e0
    V_0e34! = FX##(V_0e60!) / 40.0 + V_0e34!   '@12c46 DS:2162
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_12bf6   '@12c61
L_12c68:
    V_0e34! = FX##(V_0e60!) / 8.0   '@12c68 DS:211c
L_12c84:
    IF NOT (0.72500002384185791015625## * V_0e60! >= FX##(V_0e34!)) THEN GOTO L_12ce0   '@12c85 DS:2166
    RT_PSET V_0e30!, V_0e34!, 0, 0   '@12c9f
    V_0e34! = FX##(V_0e60!) / 40.0 + V_0e34!   '@12cbe DS:2162
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_12c84   '@12cd9
L_12ce0:
    RETURN   '@12ce0
L_12cef:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@12cf4
    REDIM A_13fe%(0 TO 20)   '@12d02
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@12d1f DS:204c,205c,20e0
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@12d2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@12d4d DS:205c,20e0
    IF NOT (V_185e! = 0.0) THEN GOTO L_12d99   '@12d76 DS:20e4
    GOTO L_13c4a   '@12d91
L_12d99:
    L_BPda! = V_185e!   '@12d99
    FOR V_0e14! = 1.0 TO L_BPda!   '@12dab DS:204c
    V_0e18! = 0.0   '@12db2 DS:20e4
L_12dc8:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_12eba   '@12dcd DS:204c
    V_0e18! = FX##(V_0e18!) + 2.0   '@12e9c DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_12dc8   '@12eb2
L_12eba:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) < L_BP0e! OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) > L_BP12!) THEN GOTO L_12f31   '@12eba
    GOTO L_134ac   '@12f29
L_12f31:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP0e!) THEN GOTO L_13082   '@12f31
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.23999999463558197021484375## * V_0e60! + (V_0e18! * 0.0599999986588954925537109375## * V_0e60! - (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) * 10)), RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@12f62 DS:20e0,20e4,216a,216e
L_13082:
    L_BPde! = 0.0   '@13082 DS:20e4
    L_BPe2! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@13094
    CALL MIXT_082a_Maior(L_BPde!, L_BPe2!, L_BPe6!)   '@130bf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPea! = FX##(V_0e5c!) / 2.0 - 1.0   '@130d4 DS:20e0,2110,216a,216e
    L_BPee! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1312e
    CALL MIXT_0877_Menor(L_BPea!, L_BPee!, L_BPf2!)   '@1315c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BPe6!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BPf2!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@13171 DS:20e0,216a,216e
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP12!) THEN GOTO L_132ed   '@131c4
    L_BPf6! = FX##(V_0e5c!) / 2.0 - 1.0   '@131f8 DS:20e0,2110
    L_BPfa! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@13214
    CALL MIXT_0877_Menor(L_BPf6!, L_BPfa!, L_BPfe!)   '@13242
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BPfe!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + (V_0e18! * 0.0599999986588954925537109375## * V_0e60! - (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) * 0.0599999986588954925537109375## * V_0e60!)), 8, V_1922%, 0   '@13257 DS:20e0,20e4,216a,216e
L_132ed:
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@132ed
    IF NOT (V_190e$ = "S") THEN GOTO L_134a7   '@13371 DS:1ffa
    V_0e20! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@13388 DS:20e4,2172
L_134a7:
L_134ac:
    V_0e20! = INT(FX##(V_0e20!))   '@134b1
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(V_0e14!)), (2)) + STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@134c9 DS:2176,217c
    V_0e30! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@1359c DS:20e0
    V_0e34! = 0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@13615 DS:216a,216e
    GOSUB L_10fd5   '@1363d
    V_0e34! = 6.0   '@1364a DS:2184
L_13660:
    L_BP100% = (V_0e34! = 15.0)   '@13661 DS:2054
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_0e34!)))) = 0 OR L_BP100%) = 0) THEN GOTO L_13808   '@13697
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (2), (2)))) = FX##(V_0e14!)) THEN GOTO L_137e4   '@136af
    V_0dfc$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (4))   '@136f2
    V_0e30! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@13726 DS:20e0
    V_0e34! = 0.2899999916553497314453125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@1379f DS:216e,2188
    GOSUB L_10fd5   '@137c7
    GOTO L_13808   '@137d4
L_137e4:
    V_0e34! = FX##(V_0e34!) + 1.0   '@137e4 DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_13660   '@137ff
L_13808:
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_13916   '@13808 DS:20e4
    V_0dfc$ = RT_MID2$((STR$(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@1383c
    V_0e30! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! + (FX##(V_0e5c!) / 2.0 - FX##(V_0e68!) / 2.0)   '@1387f DS:20e0
    V_0e34! = 0.2899999916553497314453125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@138dc DS:216e,2188
    GOSUB L_10fd5   '@13904
L_13916:
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_13a13   '@13916 DS:20e4
    V_0dfc$ = RT_MID2$((STR$(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@1394b
    V_0e30! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! + FX##(V_0e5c!) / 2.0 + FX##(V_0e68!) / 2.0   '@1398f DS:20e0
    V_0e34! = 0.2899999916553497314453125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@139d9 DS:216e,2188
    GOSUB L_10fd5   '@13a01
L_13a13:
    L_BP104! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@13a13
    L_BP108! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@13a3f DS:204c
    CALL MIXT_082a_Maior(L_BP104!, L_BP108!, L_BP10c!)   '@13a69
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP104!   '@13a7e
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP10c!))   '@13aa4
    L_BP110! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@13acb
    L_BP114! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@13af4 DS:204c
    CALL MIXT_0877_Menor(L_BP110!, L_BP114!, L_BP118!)   '@13b23
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP110!   '@13b38
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP118!))   '@13b5b DS:204c
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0 OR A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_13c02   '@13b87 DS:20e4
    GOTO L_13c14   '@13bfa
L_13c02:
    GOSUB L_15429   '@13c02
L_13c14:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@13c19 DS:204c
L_13c4a:
    IF NOT (V_1872! = 0.0) THEN GOTO L_13c72   '@13c4f DS:20e4
    GOTO L_14d93   '@13c6a
L_13c72:
    L_BP11c! = V_1872!   '@13c72
    FOR V_0e14! = 1.0 TO L_BP11c!   '@13c84 DS:204c
    V_0e18! = 0.0   '@13c8c DS:20e4
L_13ca2:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) < A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_13d94   '@13ca7 DS:204c
    V_0e18! = FX##(V_0e18!) + 2.0   '@13d76 DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_13ca2   '@13d8c
L_13d94:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) < L_BP0e! OR A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) > L_BP12!) THEN GOTO L_13e0b   '@13d94
    GOTO L_14543   '@13e03
L_13e0b:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) THEN GOTO L_13e48   '@13e0b DS:204c
    GOTO L_141d5   '@13e40
L_13e48:
    L_BP120! = FX##(V_0e5c!) / 2.0 - 1.0   '@13e48 DS:20e0,2110
    L_BP124! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@13e64
    CALL MIXT_0877_Menor(L_BP120!, L_BP124!, L_BP128!)   '@13e92
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12c! = 0.0   '@13ea7 DS:20e0,20e4,216a,216e
    L_BP130! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + V_0e68! + 2.0   '@13ef7 DS:20e0
    CALL MIXT_082a_Maior(L_BP12c!, L_BP130!, L_BP134!)   '@13f2c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP128!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP134!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@13f41 DS:20e0,216a,216e
    IF NOT ((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! >= FX##(V_0e68!) + 2.0) THEN GOTO L_14079   '@13f94 DS:20e0
    L_BP138! = 0.0   '@13fd4 DS:20e4
    L_BP13c! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@13fe6
    CALL MIXT_082a_Maior(L_BP138!, L_BP13c!, L_BP140!)   '@14011
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP140!), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 8, V_1922%, 0   '@14026 DS:20e0,216e,218c
L_14079:
    L_BP144! = 0.0   '@14079 DS:20e4
    L_BP148! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1408b
    CALL MIXT_082a_Maior(L_BP144!, L_BP148!, L_BP14c!)   '@140b6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP150! = FX##(V_0e5c!) / 2.0 - 1.0   '@140cb DS:20e0,2110,216e,218c
    L_BP154! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - 1.5 * FX##(V_0e68!)   '@14125 DS:2190
    CALL MIXT_0877_Menor(L_BP150!, L_BP154!, L_BP158!)   '@14160
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP14c!), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP158!), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@14175 DS:20e0,216e,218c
    GOTO L_14543   '@141c8
L_141d5:
    L_BP15c! = 0.0   '@141da DS:20e4
    L_BP160! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + V_0e68! + 2.0   '@141ec DS:20e0
    CALL MIXT_082a_Maior(L_BP15c!, L_BP160!, L_BP164!)   '@14221
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP168! = FX##(V_0e5c!) / 2.0 - 1.0   '@14236 DS:20e0,2110,216a,216e
    L_BP16c! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@14290
    CALL MIXT_0877_Menor(L_BP168!, L_BP16c!, L_BP170!)   '@142be
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP164!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP170!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@142d3 DS:20e0,216a,216e
    IF NOT ((FX##(L_BP12!) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! - V_0e68! - 2.0 >= FX##(0.0)) THEN GOTO L_143f7   '@14326 DS:20e4,2114
    RT_LINE 0, 0, RT_SNG!((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - V_0e68! - 2.0 + FX##(V_0e5c!) / 2.0), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 8, V_1922%, 0   '@1436e DS:20e0,2114,216e,218c
L_143f7:
    L_BP174! = 0.0   '@143f7 DS:20e4
    L_BP178! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@14409
    CALL MIXT_082a_Maior(L_BP174!, L_BP178!, L_BP17c!)   '@14434
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP180! = FX##(V_0e5c!) / 2.0 - 1.0   '@14449 DS:20e0,2110,216e,218c
    L_BP184! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - 12.0   '@144a3 DS:2194
    CALL MIXT_0877_Menor(L_BP180!, L_BP184!, L_BP188!)   '@144d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP17c!), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP188!), RT_SNG!(0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@144eb DS:20e0,216e,218c
L_14543:
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e!))), (2)) + STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@14548 DS:20e0,2176,217c
    V_0e30! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@1468f DS:20e0
    V_0e34! = 0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@14708 DS:216a,216e
    GOSUB L_10fd5   '@14730
    V_0e34! = 6.0   '@1473d DS:2184
L_14754:
    L_BP18a% = (V_0e34! = 15.0)   '@14755 DS:2054
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_0e34!)))) = 0 OR L_BP18a%) = 0) THEN GOTO L_14900   '@1478b
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (2), (2)))) = FX##(V_0e14!) + V_185e!) THEN GOTO L_148dd   '@147a3
    V_0dfc$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (4))   '@147eb
    V_0e30! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@1481f DS:20e0
    V_0e34! = 0.3300000131130218505859375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@14898 DS:216e,2198
    GOSUB L_10fd5   '@148c0
    GOTO L_14900   '@148cd
L_148dd:
    V_0e34! = FX##(V_0e34!) + 1.0   '@148dd DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14754   '@148f8
L_14900:
    V_0dfc$ = RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))), (2))   '@14900
    V_0e30! = -((A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!) + FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) * V_0f72!) + FX##(V_0e5c!) / 2.0   '@14944 DS:204c,20e0,20e4
    V_0e34! = 0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@14a2d DS:216e,218c
    GOSUB L_10fd5   '@14a55
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@14a62
    V_0e30! = -((A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!) + FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) * V_0f72!) + FX##(V_0e5c!) / 2.0   '@14ad0 DS:204c,20e0,20e4
    V_0e34! = 0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@14bb9 DS:216e,218c
    GOSUB L_10fd5   '@14be1
    L_BP18e! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)   '@14bee
    L_BP192! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@14c1a DS:204c
    CALL MIXT_082a_Maior(L_BP18e!, L_BP192!, L_BP196!)   '@14c44
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP18e!   '@14c59
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP196!))   '@14c7f
    L_BP19a! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)   '@14ca6
    L_BP19e! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@14ccf DS:204c
    CALL MIXT_0877_Menor(L_BP19a!, L_BP19e!, L_BP1a2!)   '@14cfe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP19a!   '@14d13
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP1a2!))   '@14d36 DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@14d62 DS:204c
L_14d93:
    IF NOT (V_1862! = 0.0) THEN GOTO L_14dbd   '@14d98 DS:20e4
    RETURN   '@14db3
L_14dbd:
    L_BP1a6! = V_1862!   '@14dbd
    FOR V_0e14! = 1.0 TO L_BP1a6!   '@14dcf DS:204c
    V_0e18! = 0.0   '@14dd6 DS:20e4
L_14dec:
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_14ede   '@14df1 DS:204c
    V_0e18! = FX##(V_0e18!) + 2.0   '@14ec0 DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14dec   '@14ed6
L_14ede:
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_14f55   '@14ede
    GOTO L_1509c   '@14f4d
L_14f55:
    L_BP1aa! = 0.0   '@14f55 DS:20e4
    L_BP1ae! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@14f67
    CALL MIXT_082a_Maior(L_BP1aa!, L_BP1ae!, L_BP1b2!)   '@14f92
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1b6! = FX##(V_0e5c!) / 2.0 - 1.0   '@14fa7 DS:20e0,2110,216a,216e
    L_BP1ba! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@15001
    CALL MIXT_0877_Menor(L_BP1b6!, L_BP1ba!, L_BP1be!)   '@1502f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP1b2!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP1be!), RT_SNG!(0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_191c%, 0   '@15044 DS:20e0,216a,216e
L_1509c:
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1872! + V_1876! + V_0e14!))), (2)) + STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)))), (2))   '@150a1 DS:2176,217c
    V_0e30! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@151cc DS:20e0
    V_0e34! = 0.23999999463558197021484375## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@15245 DS:216a,216e
    GOSUB L_10fd5   '@1526d
    L_BP1c2! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)   '@1527a
    L_BP1c6! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@152a6 DS:204c
    CALL MIXT_082a_Maior(L_BP1c2!, L_BP1c6!, L_BP1ca!)   '@152d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP1c2!   '@152e5
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP1ca!))   '@1530b
    L_BP1ce! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)   '@15332
    L_BP1d2! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@1535b DS:204c
    CALL MIXT_0877_Menor(L_BP1ce!, L_BP1d2!, L_BP1d6!)   '@1538a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP1ce!   '@1539f
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP1d6!))   '@153c2 DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@153ee DS:204c
    RETURN   '@1541a
L_15429:   ' sub-rotina (alvo de GOSUB)
    L_BP1da! = V_0ddc!   '@1542e
    FOR V_0e28! = 0.0 TO L_BP1da!   '@15440 DS:204c,20e4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa! + 1.0 OR (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! - 1.0 OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))) THEN GOTO L_15653   '@15448 DS:204c,2110
    GOTO L_1567f   '@1564b
L_15653:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@15653 DS:204c
L_1567f:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_156a7   '@1567f DS:204c
    GOTO L_15dc4   '@1569f
L_156a7:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) > FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) THEN GOTO L_1573d   '@156a7 DS:204c
    GOTO L_15a65   '@15735
L_1573d:
L_15742:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@15747
    V_0e30! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! + FX##(V_0e5c!) / 2.0 + 1.5 * FX##(V_0e68!)   '@157b5 DS:20e0,2190
    V_0e34! = 0.2899999916553497314453125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@157fc DS:216e,2188
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < FX##(0.0)) THEN GOTO L_1587d   '@15824 DS:20e4
    GOTO L_15a65   '@15875
L_1587d:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP12! AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP0e!) THEN GOTO L_1595c   '@1587d
    L_BP1de! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0   '@158e9 DS:20e0
    L_BP1e2$ = CHR$(27)   '@15927
    CALL MIXT_08c4_TextoGrafico(L_BP1de!, V_0e34!, L_BP1e2$, V_17f2$)   '@1593b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @15952 libera strings locais (L_BP1e2)
L_1595c:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) <= L_BP12! AND A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > L_BP0e!) THEN GOTO L_15a49   '@1595c
    L_BP1e6! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - L_BP0e!) * V_0f72! + (FX##(V_0e5c!) / 2.0 - V_0e68!)   '@159ce DS:20e0
    L_BP1ea$ = CHR$(26)   '@15a14
    CALL MIXT_08c4_TextoGrafico(L_BP1e6!, V_0e34!, L_BP1ea$, V_17f2$)   '@15a28
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @15a3f libera strings locais (L_BP1ea)
L_15a49:
    GOSUB L_10fd5   '@15a49
    RETURN   '@15a56
L_15a65:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0))))), (2))   '@15a6a DS:204c
    V_0e30! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! + (FX##(V_0e5c!) / 2.0 - 1.5 * FX##(V_0e68!) - FX##(LEN(V_0dfc$)) * V_0e68!)   '@15adf DS:20e0,2190
    V_0e34! = 0.2899999916553497314453125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@15b3f DS:216e,2188
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) < FX##(0.0)) THEN GOTO L_15bc7   '@15b67 DS:204c,20e4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15742   '@15bbf
L_15bc7:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) < L_BP12! AND A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) >= L_BP0e!) THEN GOTO L_15cbb   '@15bc7 DS:204c
    L_BP1ee! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0   '@15c41 DS:204c,20e0
    L_BP1f2$ = CHR$(27)   '@15c86
    CALL MIXT_08c4_TextoGrafico(L_BP1ee!, V_0e34!, L_BP1f2$, V_17f2$)   '@15c9a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @15cb1 libera strings locais (L_BP1f2)
L_15cbb:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP12! AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > L_BP0e!) THEN GOTO L_15da8   '@15cbb
    L_BP1f6! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! + (FX##(V_0e5c!) / 2.0 - V_0e68!)   '@15d2d DS:20e0
    L_BP1fa$ = CHR$(26)   '@15d73
    CALL MIXT_08c4_TextoGrafico(L_BP1f6!, V_0e34!, L_BP1fa$, V_17f2$)   '@15d87
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @15d9e libera strings locais (L_BP1fa)
L_15da8:
    GOSUB L_10fd5   '@15da8
    RETURN   '@15db5
L_15dc4:
    L_BP1fe! = V_0ddc!   '@15dc9
    FOR V_0e28! = 1.0 TO L_BP1fe!   '@15ddb DS:204c
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_15e8e   '@15de2
    GOTO L_15eba   '@15e86
L_15e8e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@15e8e DS:204c
L_15eba:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_15ee4   '@15eba DS:204c
    RETURN   '@15eda
L_15ee4:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))))), (2))   '@15ee4
    V_0e30! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! + FX##(V_0e5c!) / 2.0 + 1.5 * FX##(V_0e68!)   '@15f51 DS:20e0,2190
    V_0e34! = 0.2800000011920928955078125## * V_0e60! + V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@15f98 DS:216e,218c
    GOSUB L_10fd5   '@15fc0
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) <= L_BP12! AND A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) > L_BP0e!) THEN GOTO L_160b7   '@15fcd
    L_BP202! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - L_BP0e!) * V_0f72! + (FX##(V_0e5c!) / 2.0 - V_0e68!)   '@1603d DS:20e0
    L_BP206$ = CHR$(26)   '@16082
    CALL MIXT_08c4_TextoGrafico(L_BP202!, V_0e34!, L_BP206$, V_17f2$)   '@16096
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @160ad libera strings locais (L_BP206)
L_160b7:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP12! AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP0e!) THEN GOTO L_16196   '@160b7
    L_BP20a! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0   '@16123 DS:20e0
    L_BP20e$ = CHR$(27)   '@16161
    CALL MIXT_08c4_TextoGrafico(L_BP20a!, V_0e34!, L_BP20e$, V_17f2$)   '@16175
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1618c libera strings locais (L_BP20e)
L_16196:
    RETURN   '@16196
L_161a5:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@161aa
    REDIM A_13fe%(0 TO 20)   '@161b8
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@161d5 DS:204c,205c,20e0
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@161e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@16203 DS:205c,20e0
    IF NOT (V_1866! = 0.0) THEN GOTO L_1624f   '@1622c DS:20e4
    GOTO L_171e5   '@16247
L_1624f:
    L_BP212! = V_1866!   '@1624f
    FOR V_0e14! = 1.0 TO L_BP212!   '@16261 DS:204c
    V_0e18! = 0.0   '@16268 DS:20e4
L_1627e:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_16370   '@16283 DS:204c
    V_0e18! = FX##(V_0e18!) + 2.0   '@16352 DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1627e   '@16368
L_16370:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < L_BP0e! OR A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > L_BP12!) THEN GOTO L_163e7   '@16370
    GOTO L_1691a   '@163df
L_163e7:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP0e!) THEN GOTO L_16523   '@163e7
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), RT_SNG!(0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60! + FX##(A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) * 1.5 * V_0e68!), RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), RT_SNG!(0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@16418 DS:20e4,216e,2190,219c
L_16523:
    L_BP216! = 0.0   '@16523 DS:20e4
    L_BP21a! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@16535
    CALL MIXT_082a_Maior(L_BP216!, L_BP21a!, L_BP21e!)   '@16560
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP222! = FX##(V_0e5c!) / 2.0 - 1.0   '@16574 DS:20e0,2110,216e,219c
    L_BP226! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@165be
    CALL MIXT_0877_Menor(L_BP222!, L_BP226!, L_BP22a!)   '@165ec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP21e!, RT_SNG!(0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), L_BP22a!, RT_SNG!(0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@16600 DS:216e,219c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP12!) THEN GOTO L_1675b   '@16643
    L_BP22e! = FX##(V_0e5c!) / 2.0 - 1.0   '@16677 DS:20e0,2110
    L_BP232! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@16693
    CALL MIXT_0877_Menor(L_BP22e!, L_BP232!, L_BP236!)   '@166c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, L_BP236!, RT_SNG!(0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60! + FX##(A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) * 1.5 * V_0e68!), 8, V_1922%, 0   '@166d5 DS:20e4,216e,2190,219c
L_1675b:
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@1675b
    IF NOT (V_190e$ = "S") THEN GOTO L_16915   '@167df DS:1ffa
    V_0e20! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@167f6 DS:20e4,2172
L_16915:
L_1691a:
    V_0e20! = INT(FX##(V_0e20!))   '@1691f
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1872! + V_0e14!))), (2)) + STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@16937 DS:2176,217c
    L_BP23a! = -(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! + FX##(V_0e68!) / 2.0) * (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)   '@16a1b DS:20e0,20e4
    L_BP23e! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@16a91 DS:20e0
    L_BP242! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!   '@16af8
    CALL MIXT_0877_Menor(L_BP23e!, L_BP242!, L_BP246!)   '@16b38
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP23a!, L_BP246!, L_BP24a!)   '@16b4c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP24a!   '@16b61
    V_0e34! = 0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@16b6c DS:216e,219c
    GOSUB L_10d02   '@16b94
    V_0e34! = 6.0   '@16ba1 DS:2184
L_16bb8:
    L_BP24c% = (V_0e34! = 15.0)   '@16bb9 DS:2054
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_0e34!)))) = 0 OR L_BP24c%) = 0) THEN GOTO L_16e42   '@16bef
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (2), (2)))) = FX##(V_0e14!) + V_185e! + V_1872!) THEN GOTO L_16e1e   '@16c07
    V_0dfc$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (4))   '@16c54
    L_BP250! = -(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! + FX##(L_BP264!) / 2.0) * (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)   '@16c88 DS:20e0,20e4
    L_BP254! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@16cfe DS:20e0
    L_BP258! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!   '@16d65
    CALL MIXT_0877_Menor(L_BP254!, L_BP258!, L_BP25c!)   '@16da5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP250!, L_BP25c!, L_BP260!)   '@16db9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP260!   '@16dce
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@16dd9 DS:214c,216e
    GOSUB L_10d02   '@16e01
    GOTO L_16e42   '@16e0e
L_16e1e:
    V_0e34! = FX##(V_0e34!) + 1.0   '@16e1e DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16bb8   '@16e39
L_16e42:
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_16f43   '@16e42 DS:20e4
    V_0dfc$ = RT_MID2$((STR$(A_1b20!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@16e76
    V_0e30! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! - FX##(V_0e68!) / 2.0   '@16eb9 DS:20e0
    V_0e34! = 0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@16f09 DS:216e,219c
    GOSUB L_10d02   '@16f31
L_16f43:
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_17033   '@16f43 DS:20e4
    V_0dfc$ = RT_MID2$((STR$(A_1b20!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@16f78
    V_0e30! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! + FX##(V_0e68!) / 2.0   '@16fbc DS:20e0
    V_0e34! = 0.77499997615814208984375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@16ff9 DS:216e,219c
    GOSUB L_10d02   '@17021
L_17033:
    L_BP268! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@17033
    L_BP26c! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@1705f DS:204c
    CALL MIXT_082a_Maior(L_BP268!, L_BP26c!, L_BP270!)   '@17089
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP268!   '@1709e
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP270!))   '@170c4
    L_BP274! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@170eb
    L_BP278! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@17114 DS:204c
    CALL MIXT_0877_Menor(L_BP274!, L_BP278!, L_BP27c!)   '@17143
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP274!   '@17158
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP27c!))   '@1717b DS:204c
    GOSUB L_18275   '@171a7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@171b4 DS:204c
L_171e5:
    IF NOT (V_1876! = 0.0) THEN GOTO L_1720f   '@171ea DS:20e4
    RETURN   '@17205
L_1720f:
    L_BP280! = V_1876!   '@1720f
    FOR V_0e14! = 1.0 TO L_BP280!   '@17221 DS:204c
    V_0e18! = 0.0   '@17228 DS:20e4
L_1723e:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) < A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_17330   '@17243 DS:204c
    V_0e18! = FX##(V_0e18!) + 2.0   '@17312 DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1723e   '@17328
L_17330:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) < L_BP0e! OR A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) > L_BP12!) THEN GOTO L_173a7   '@17330
    GOTO L_17a3b   '@1739f
L_173a7:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) THEN GOTO L_173e4   '@173a7 DS:204c
    GOTO L_17719   '@173dc
L_173e4:
    L_BP284! = FX##(V_0e5c!) / 2.0 - 1.0   '@173e4 DS:20e0,2110
    L_BP288! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@17400
    CALL MIXT_0877_Menor(L_BP284!, L_BP288!, L_BP28c!)   '@1742e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP290! = 0.0   '@17442 DS:20e4,216e,21a0
    L_BP294! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + V_0e68! + 2.0   '@17482 DS:20e0
    CALL MIXT_082a_Maior(L_BP290!, L_BP294!, L_BP298!)   '@174b7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP28c!, RT_SNG!(0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), L_BP298!, RT_SNG!(0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@174cb DS:216e,21a0
    IF NOT ((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! >= FX##(V_0e68!) + 2.0) THEN GOTO L_175e2   '@1750e DS:20e0
    L_BP29c! = 0.0   '@1754e DS:20e4
    L_BP2a0! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@17560
    CALL MIXT_082a_Maior(L_BP29c!, L_BP2a0!, L_BP2a4!)   '@1758b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, L_BP2a4!, RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 8, V_1922%, 0   '@1759f DS:216e,21a4
L_175e2:
    L_BP2a8! = 0.0   '@175e2 DS:20e4
    L_BP2ac! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@175f4
    CALL MIXT_082a_Maior(L_BP2a8!, L_BP2ac!, L_BP2b0!)   '@1761f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2b4! = FX##(V_0e5c!) / 2.0 - 1.0   '@17633 DS:20e0,2110,216e,21a4
    L_BP2b8! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - V_0e68! - 2.0   '@1767d DS:2114
    CALL MIXT_0877_Menor(L_BP2b4!, L_BP2b8!, L_BP2bc!)   '@176b5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP2b0!, RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), L_BP2bc!, RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@176c9 DS:216e,21a4
    GOTO L_17a3b   '@1770c
L_17719:
    L_BP2c0! = 0.0   '@1771e DS:20e4
    L_BP2c4! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + V_0e68! + 2.0   '@17730 DS:20e0
    CALL MIXT_082a_Maior(L_BP2c0!, L_BP2c4!, L_BP2c8!)   '@17765
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2cc! = FX##(V_0e5c!) / 2.0 - 1.0   '@17779 DS:20e0,2110,216e,21a0
    L_BP2d0! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@177c3
    CALL MIXT_0877_Menor(L_BP2cc!, L_BP2d0!, L_BP2d4!)   '@177f1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP2c8!, RT_SNG!(0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), L_BP2d4!, RT_SNG!(0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@17805 DS:216e,21a0
    IF NOT ((FX##(L_BP12!) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! - V_0e68! - 2.0 >= FX##(0.0)) THEN GOTO L_1790c   '@17848 DS:20e4,2114
    RT_LINE 0, 0, RT_SNG!((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - V_0e68! - 2.0), RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 8, V_1922%, 0   '@17890 DS:2114,216e,21a4
L_1790c:
    L_BP2d8! = 0.0   '@1790c DS:20e4
    L_BP2dc! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1791e
    CALL MIXT_082a_Maior(L_BP2d8!, L_BP2dc!, L_BP2e0!)   '@17949
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2e4! = FX##(V_0e5c!) / 2.0 - 1.0   '@1795d DS:20e0,2110,216e,21a4
    L_BP2e8! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - V_0e68! - 2.0   '@179a7 DS:2114
    CALL MIXT_0877_Menor(L_BP2e4!, L_BP2e8!, L_BP2ec!)   '@179df
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP2e0!, RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), L_BP2ec!, RT_SNG!(0.795000016689300537109375## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!), 9, V_1922%, 0   '@179f3 DS:216e,21a4
L_17a3b:
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e! + V_1872! + V_1866!))), (2)) + STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@17a40 DS:20e0,2176,217c
    V_0e30! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@17b91 DS:20e0
    V_0e34! = 0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@17bfd DS:216e,21a0
    GOSUB L_10d02   '@17c25
    V_0e34! = 6.0   '@17c32 DS:2184
L_17c48:
    L_BP2ee% = (V_0e34! = 15.0)   '@17c49 DS:2054
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_0e34!)))) = 0 OR L_BP2ee%) = 0) THEN GOTO L_17df2   '@17c7f
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (2), (2)))) = FX##(V_0e14!) + V_185e! + V_1872! + V_1866!) THEN GOTO L_17dce   '@17c97
    V_0dfc$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e34!)))), (4))   '@17ce9
    V_0e30! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@17d1d DS:20e0
    V_0e34! = 0.8450000286102294921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@17d89 DS:216e,21a8
    GOSUB L_10d02   '@17db1
    GOTO L_17df2   '@17dbe
L_17dce:
    V_0e34! = FX##(V_0e34!) + 1.0   '@17dce DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17c48   '@17de9
L_17df2:
    V_0dfc$ = RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))), (2))   '@17df2
    V_0e30! = -((A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!) + FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) * V_0f72!)   '@17e36 DS:204c,20e4
    V_0e34! = 0.805000007152557373046875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@17f12 DS:216e,21ac
    GOSUB L_10d02   '@17f3a
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@17f47
    V_0e30! = -((A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!) + FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) * V_0f72!)   '@17fb5 DS:204c,20e4
    V_0e34! = 0.805000007152557373046875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@18091 DS:216e,21ac
    GOSUB L_10d02   '@180b9
    L_BP2f2! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)   '@180c6
    L_BP2f6! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@180f2 DS:204c
    CALL MIXT_082a_Maior(L_BP2f2!, L_BP2f6!, L_BP2fa!)   '@1811c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP2f2!   '@18131
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP2fa!))   '@18157
    L_BP2fe! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)   '@1817e
    L_BP302! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@181a7 DS:204c
    CALL MIXT_0877_Menor(L_BP2fe!, L_BP302!, L_BP306!)   '@181d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP2fe!   '@181eb
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP306!))   '@1820e DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1823a DS:204c
    RETURN   '@18266
L_18275:   ' sub-rotina (alvo de GOSUB)
    L_BP30a! = FX##(V_0ddc!) + V_0de4!   '@1827a
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP30a!   '@18291 DS:204c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_1834a   '@1829e
    GOTO L_18376   '@18342
L_1834a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1834a DS:204c
L_18376:
    IF NOT (FX##(V_0ddc!) + V_0de4! + 1.0 = FX##(V_0e28!)) THEN GOTO L_183a3   '@18376 DS:204c
    GOTO L_18996   '@1839b
L_183a3:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) THEN GOTO L_18434   '@183a3
    GOTO L_186ce   '@1842c
L_18434:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))))), (2))   '@18434
    V_0e30! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! + 1.5 * FX##(V_0e68!)   '@184a1 DS:2190
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@184db DS:214c,216e
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) <= L_BP12! AND A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) > L_BP0e!) THEN GOTO L_185e0   '@18503
    L_BP30e! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - L_BP0e!) * V_0f72! - V_0e68!   '@18573
    L_BP312$ = CHR$(26)   '@185ab
    CALL MIXT_08c4_TextoGrafico(L_BP30e!, V_0e34!, L_BP312$, V_17f2$)   '@185bf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @185d6 libera strings locais (L_BP312)
L_185e0:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP12! AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP0e!) THEN GOTO L_186b2   '@185e0
    L_BP316! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1864c
    L_BP31a$ = CHR$(27)   '@1867d
    CALL MIXT_08c4_TextoGrafico(L_BP316!, V_0e34!, L_BP31a$, V_17f2$)   '@18691
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @186a8 libera strings locais (L_BP31a)
L_186b2:
    GOSUB L_10d02   '@186b2
    RETURN   '@186bf
L_186ce:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3))))), (2))   '@186d3
    V_0e30! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f72! - 1.5 * FX##(V_0e68!) - FX##(LEN(V_0dfc$)) * V_0e68!   '@18744 DS:2190
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@18797 DS:214c,216e
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP12! AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > L_BP0e!) THEN GOTO L_1889f   '@187bf
    L_BP31e! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! - V_0e68!   '@18831
    L_BP322$ = CHR$(26)   '@1886a
    CALL MIXT_08c4_TextoGrafico(L_BP31e!, V_0e34!, L_BP322$, V_17f2$)   '@1887e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @18895 libera strings locais (L_BP322)
L_1889f:
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) < L_BP12! AND A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) >= L_BP0e!) THEN GOTO L_1897a   '@1889f
    L_BP326! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - L_BP0e!) * V_0f72!   '@18911
    L_BP32a$ = CHR$(27)   '@18945
    CALL MIXT_08c4_TextoGrafico(L_BP326!, V_0e34!, L_BP32a$, V_17f2$)   '@18959
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @18970 libera strings locais (L_BP32a)
L_1897a:
    GOSUB L_10d02   '@1897a
    RETURN   '@18987
L_18996:
    L_BP32e! = V_0ddc!   '@1899b
    FOR V_0e28! = 0.0 TO L_BP32e!   '@189ad DS:204c,20e4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa! + 1.0) THEN GOTO L_18bca   '@189b4 DS:204c
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@18a64 DS:204c
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) * V_0f72! + FX##(V_0e68!) / 2.0   '@18ad6 DS:204c,20e0
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@18b17 DS:214c,216e
    GOSUB L_10d02   '@18b3f
    V_0e30! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@18b4c
    GOSUB L_192e5   '@18b74
    V_0e30! = A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)   '@18b81 DS:204c
    GOSUB L_19384   '@18bb0
    GOTO L_192d6   '@18bbd
L_18bca:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! - 1.0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_18df6   '@18bca DS:204c,2110
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))))), (2))   '@18c80
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) * V_0f72! - FX##(V_0e68!) / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@18cf1 DS:20e0
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@18d44 DS:214c,216e
    GOSUB L_10d02   '@18d6c
    V_0e30! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@18d79
    GOSUB L_192e5   '@18da4
    V_0e30! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@18db1
    GOSUB L_19384   '@18ddc
    GOTO L_192d6   '@18de9
L_18df6:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa!) THEN GOTO L_18eb1   '@18df6 DS:204c
    GOTO L_192a5   '@18ea9
L_18eb1:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) THEN GOTO L_190a9   '@18eb1 DS:204c
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@18f43 DS:204c
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) * V_0f72! + FX##(V_0e68!) / 2.0   '@18fb5 DS:204c,20e0
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@18ff6 DS:214c,216e
    GOSUB L_10d02   '@1901e
    V_0e30! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@1902b
    GOSUB L_192e5   '@19053
    V_0e30! = A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)   '@19060 DS:204c
    GOSUB L_19384   '@1908f
    GOTO L_192d6   '@1909c
L_190a9:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 1) AND FX##(V_0ddc!) + V_0de4! > FX##(V_0e28!)) THEN GOTO L_1912f   '@190a9 DS:204c
    GOTO L_192a5   '@19127
L_1912f:
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))))), (2))   '@1912f
    V_0e30! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) * V_0f72! - FX##(V_0e68!) / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@191a0 DS:20e0
    V_0e34! = 0.824999988079071044921875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@191f3 DS:214c,216e
    GOSUB L_10d02   '@1921b
    V_0e30! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@19228
    GOSUB L_192e5   '@19253
    V_0e30! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@19260
    GOSUB L_19384   '@1928b
    GOTO L_192d6   '@19298
L_192a5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@192aa DS:204c
L_192d6:
    RETURN   '@192d6
L_192e5:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e30! < L_BP12! AND V_0e30! >= L_BP0e!) THEN GOTO L_19375   '@192ea
    L_BP332! = (FX##(V_0e30!) - L_BP0e!) * V_0f72!   '@19326
    L_BP336$ = CHR$(27)   '@19340
    CALL MIXT_08c4_TextoGrafico(L_BP332!, V_0e34!, L_BP336$, V_17f2$)   '@19354
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1936b libera strings locais (L_BP336)
L_19375:
    RETURN   '@19375
L_19384:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e30! <= L_BP12! AND V_0e30! > L_BP0e!) THEN GOTO L_19419   '@19389
    L_BP33a! = (FX##(V_0e30!) - L_BP0e!) * V_0f72! - V_0e68!   '@193c5
    L_BP33e$ = CHR$(26)   '@193e4
    CALL MIXT_08c4_TextoGrafico(L_BP33a!, V_0e34!, L_BP33e$, V_17f2$)   '@193f8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1940f libera strings locais (L_BP33e)
L_19419:
    RETURN   '@19419
L_19428:   ' sub-rotina (alvo de GOSUB)
    V_0e18! = 0.0   '@1942d DS:20e4
    IF NOT (V_186e! = 0.0) THEN GOTO L_19463   '@1943e DS:20e4
    RETURN   '@19459
L_19463:
L_19468:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0) THEN GOTO L_194b1   '@1946d
    V_0e18! = FX##(V_0e18!) + 2.0   '@19494 DS:20e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19468   '@194aa
L_194b1:
    L_BP342! = FX##(V_0ddc!) + V_0de4!   '@194b1
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP342!   '@194c8 DS:204c
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR (A_1c34!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12! OR A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0)) THEN GOTO L_19581   '@194d4 DS:20e4
    GOTO L_19f2d   '@19579
L_19581:
    L_BP346! = A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)   '@19581
    FOR V_0e28! = 1.0 TO L_BP346!   '@195ac DS:204c
    V_0e30! = FX##(V_0e5c!) / 2.0   '@195b4 DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@195ca DS:2110,2118
    IF NOT ((FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28! - L_BP16!)) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_196ad   '@195e5 DS:204c,20e0,211c
    V_0e30! = 0.0   '@19683 DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@19694 DS:211c
L_196ad:
    L_BP34a! = 0.0   '@196ad DS:20e4
    L_BP34e! = (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@196bf
    CALL MIXT_082a_Maior(L_BP34a!, L_BP34e!, L_BP352!)   '@196ea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP356! = 0.0   '@196ff DS:20e4
    L_BP35a! = FX##(V_0e60!) - 1.0   '@1970b DS:2110
    L_BP35e! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28! - L_BP16!)) * V_18e6! + V_0e34!   '@1971c DS:204c,20e0
    CALL MIXT_0877_Menor(L_BP35a!, L_BP35e!, L_BP362!)   '@197aa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP356!, L_BP362!, L_BP366!)   '@197be
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_PSET RT_SNG!(FX##(L_BP352!) + V_0e30!), L_BP366!, 0, 0   '@197d3
    L_BP36a! = FX##(V_0e5c!) / 2.0 - 1.0   '@197f8 DS:20e0,2110
    L_BP36e! = (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@19814
    CALL MIXT_0877_Menor(L_BP36a!, L_BP36e!, L_BP372!)   '@19842
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP376! = 0.0   '@19857 DS:20e4
    L_BP37a! = FX##(V_0e60!) - 1.0   '@19863 DS:2110
    L_BP37e! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28! - L_BP16!)) * V_18e6! + V_0e34!   '@19874 DS:204c,20e0
    CALL MIXT_0877_Menor(L_BP37a!, L_BP37e!, L_BP382!)   '@19902
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP376!, L_BP382!, L_BP386!)   '@19916
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!(FX##(L_BP372!) + V_0e30!), L_BP386!, 8, V_191a%, 0   '@1992b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1995b DS:204c
    V_0e20! = 0.0   '@19987 DS:20e4
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0eee!) THEN GOTO L_19b45   '@19998
    V_0e20! = -(A_1a96%(0) > 0)   '@199cd
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef2!) THEN GOTO L_19b40   '@199fb
    V_0e20! = FX##(V_0e20!) - (A_1a96%(1) > 0)   '@19a30
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef6!) THEN GOTO L_19b3b   '@19a62
    V_0e20! = FX##(V_0e20!) - (A_1a96%(2) > 0)   '@19a97
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efa!) THEN GOTO L_19b36   '@19acc
    V_0e20! = FX##(V_0e20!) - (A_1a96%(3) > 0)   '@19b01
L_19b36:
L_19b3b:
L_19b40:
L_19b45:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efe!) THEN GOTO L_19c87   '@19b45
    V_0e20! = -(A_1a96%(4) > 0)   '@19b7a
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0f02!) THEN GOTO L_19c82   '@19ba9
    V_0e20! = FX##(V_0e20!) - (A_1a96%(5) > 0)   '@19bde
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0f06!) THEN GOTO L_19c7d   '@19c13
    V_0e20! = FX##(V_0e20!) - (A_1a96%(6) > 0)   '@19c48
L_19c7d:
L_19c82:
L_19c87:
    V_0dfc$ = "2x" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1862! + V_1872! + V_1876! + V_0e20!))), (2)) + "#" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@19c87 DS:2176,21b0,21b6
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@19d70 DS:20e0
    L_BP38a! = 0.2249999940395355224609375## * V_0e60!   '@19dde DS:21bc
    L_BP38e! = 0.75499999523162841796875## * V_0e60! - V_0e18! * 0.0599999986588954925537109375## * V_0e60!   '@19df5 DS:216e,21a0
    CALL MIXT_082a_Maior(L_BP38a!, L_BP38e!, L_BP392!)   '@19e17
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e34! = L_BP392!   '@19e2c
    GOSUB L_10d02   '@19e37
    L_BP396! = 0.0   '@19e44 DS:20e4
    L_BP39a! = (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@19e56
    CALL MIXT_082a_Maior(L_BP396!, L_BP39a!, L_BP39e!)   '@19e81
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3a2! = FX##(V_0e5c!) / 2.0 - 1.0   '@19e95 DS:20e0,2110
    L_BP3a6! = (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@19ec1
    CALL MIXT_0877_Menor(L_BP3a2!, L_BP3a6!, L_BP3aa!)   '@19eef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BP39e!, V_0e34!, L_BP3aa!, V_0e34!, 9, V_1924%, 0   '@19f03
L_19f2d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@19f32 DS:204c
    RETURN   '@19f5e
L_19f6d:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@19f72
    IF NOT (V_186a! = 0.0) THEN GOTO L_19fc1   '@19f9c DS:20e4
    RETURN   '@19fb7
L_19fc1:
    L_BP3ae! = V_186a!   '@19fc1
    FOR V_0e14! = 1.0 TO L_BP3ae!   '@19fd3 DS:204c
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 1) < L_BP0e! OR A_1c06!(RT_CINT%(FX##(V_0e14!)), 0) > L_BP12!) THEN GOTO L_1a053   '@19fda
    GOTO L_1a367   '@1a04b
L_1a053:
    L_BP3b2! = 0.0   '@1a053 DS:20e4
    L_BP3b6! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72!   '@1a065
    CALL MIXT_082a_Maior(L_BP3b2!, L_BP3b6!, L_BP3ba!)   '@1a092
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3be! = FX##(V_0e5c!) / 2.0 - 1.0   '@1a0a7 DS:20e0,2110,21c0
    L_BP3c2! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP0e!) * V_0f72!   '@1a0ef
    CALL MIXT_0877_Menor(L_BP3be!, L_BP3c2!, L_BP3c6!)   '@1a11d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP3ba!), RT_SNG!(FX##(V_0e60!) / 12.0), RT_SNG!(FX##(V_0e5c!) / 2.0 + L_BP3c6!), RT_SNG!(FX##(V_0e60!) / 12.0), 9, V_1920%, 0   '@1a132 DS:20e0,21c0
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 0) >= L_BP0e!) THEN GOTO L_1a269   '@1a173
    RT_LINE RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.07999999821186065673828125## * V_0e60!), RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.100000001490116119384765625## * V_0e60!), 9, V_1920%, 0   '@1a1a6 DS:20e0,21c4,21c8
L_1a269:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 1) <= L_BP12!) THEN GOTO L_1a362   '@1a269
    RT_LINE RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.07999999821186065673828125## * V_0e60!), RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.100000001490116119384765625## * V_0e60!), 9, V_1920%, 0   '@1a29d DS:20e0,21c4,21c8
L_1a362:
L_1a367:
    V_0dfc$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 6)) + V_0e20!))), (2))   '@1a36c DS:21b6
    V_0e00$ = "c/" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 3))), (2))   '@1a3d0 DS:21cc
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) / A_1c06!(RT_CINT%(FX##(V_0e14!)), 3)) + 1.0))), (2)) + V_0dfc$   '@1a41e DS:204c
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 4) > 1.0) THEN GOTO L_1a549   '@1a4bc DS:204c
    V_0dfc$ = RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 4))), (2)) + "x" + V_0dfc$   '@1a4f1 DS:21d2
L_1a549:
    V_0e30! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 + (FX##(V_0e5c!) / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0)   '@1a549 DS:20e0
    V_0e34! = FX##(V_0e60!) / 25.0 - 1.0   '@1a5c4 DS:2100,2110
    GOSUB L_10fd5   '@1a5df
    V_0dfc$ = V_0e00$   '@1a5ec
    V_0e30! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 + (FX##(V_0e5c!) / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0)   '@1a5fe DS:20e0
    V_0e34! = 2.0 * FX##(V_0e60!) / 25.0   '@1a679 DS:20e0,2100
    GOSUB L_10fd5   '@1a694
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0))))), (2))   '@1a6a1
    V_0e30! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 + (FX##(V_0e5c!) / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0)   '@1a711 DS:20e0
    V_0e34! = 0.13500000536441802978515625## * V_0e60!   '@1a78c DS:21d8
    GOSUB L_10fd5   '@1a7a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1a7af DS:204c
    RETURN   '@1a7db
L_1a7ea:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_185e! = 0.0) THEN GOTO L_1a812   '@1a7ef DS:20e4
    GOTO L_1b2f5   '@1a80a
L_1a812:
    L_BP3ca! = V_185e!   '@1a812
    FOR V_0e14! = 1.0 TO L_BP3ca!   '@1a824 DS:204c
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_1a8a3   '@1a82c
    GOTO L_1b2bf   '@1a89b
L_1a8a3:
    V_0f7e! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@1a8a3
    V_0f82! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@1a8cb
    V_0dfc$ = "N"   '@1a8f6 DS:2124
    GOSUB L_1d880   '@1a908
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP0e!) THEN GOTO L_1a94e   '@1a915
    GOTO L_1ad05   '@1a946
L_1a94e:
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1a97e   '@1a94e DS:211c
    GOTO L_1ab2f   '@1a976
L_1a97e:
    L_BP3ce! = FX##(V_0e60!) - 1.0   '@1a97e DS:2110
    L_BP3d2! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16!) * V_18e6!   '@1a995 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP3ce!, L_BP3d2!, L_BP3d6!)   '@1a9ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3da! = FX##(V_0e60!) - 1.0   '@1a9cf DS:20e0,2110
    L_BP3de! = 3.0   '@1aa29 DS:210c
    L_BP3e2! = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)   '@1aa35
    CALL MIXT_082a_Maior(L_BP3de!, L_BP3e2!, L_BP3e6!)   '@1aa59
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP3e2!   '@1aa6e
    L_BP3ea! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16! + L_BP3e6!) * V_18e6!   '@1aa93 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP3da!, L_BP3ea!, L_BP3ee!)   '@1aabd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP3d6!, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP3ee!, 9, V_191a%, 0   '@1aad2 DS:20e0
L_1ab2f:
    IF NOT ((FX##(L_BP1e!) - L_BP16! + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)) * V_18e6! <= FX##(V_0e60!) / 8.0) THEN GOTO L_1ab82   '@1ab34 DS:211c
    GOTO L_1ad05   '@1ab7a
L_1ab82:
    L_BP3f2! = 0.0   '@1ab82 DS:20e4
    L_BP3f6! = (FX##(L_BP1e!) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1ab94 DS:211c
    CALL MIXT_082a_Maior(L_BP3f2!, L_BP3f6!, L_BP3fa!)   '@1abb4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3fe! = 0.0   '@1abc9 DS:20e4
    L_BP402! = 3.0   '@1ac11 DS:210c
    L_BP406! = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)   '@1ac1d
    CALL MIXT_082a_Maior(L_BP402!, L_BP406!, L_BP40a!)   '@1ac41
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP406!   '@1ac56
    L_BP40e! = (FX##(L_BP1e!) - L_BP16! + L_BP40a!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1ac7b DS:211c
    CALL MIXT_082a_Maior(L_BP3fe!, L_BP40e!, L_BP412!)   '@1aca0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), L_BP3fa!, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), L_BP412!, 9, V_191a%, 0   '@1acb5
L_1ad05:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > L_BP12!) THEN GOTO L_1ad46   '@1ad0a
    GOTO L_1b10e   '@1ad3e
L_1ad46:
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1ad76   '@1ad46 DS:211c
    GOTO L_1af2f   '@1ad6e
L_1ad76:
    L_BP416! = FX##(V_0e60!) - 1.0   '@1ad76 DS:2110
    L_BP41a! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16!) * V_18e6!   '@1ad8d DS:2110,2118
    CALL MIXT_0877_Menor(L_BP416!, L_BP41a!, L_BP41e!)   '@1adb2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP422! = FX##(V_0e60!) - 1.0   '@1adc7 DS:20e0,2110
    L_BP426! = 3.0   '@1ae24 DS:210c
    L_BP42a! = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@1ae30
    CALL MIXT_082a_Maior(L_BP426!, L_BP42a!, L_BP42e!)   '@1ae55
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP42a!   '@1ae6a
    L_BP432! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16! + L_BP42e!) * V_18e6!   '@1ae90 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP422!, L_BP432!, L_BP436!)   '@1aeba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP41e!, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP436!, 9, V_191a%, 0   '@1aecf DS:20e0
L_1af2f:
    IF NOT ((FX##(L_BP1e!) - L_BP16! + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18e6! <= FX##(V_0e60!) / 8.0) THEN GOTO L_1af83   '@1af34 DS:211c
    GOTO L_1b10e   '@1af7b
L_1af83:
    L_BP43a! = 0.0   '@1af83 DS:20e4
    L_BP43e! = (FX##(L_BP1e!) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1af95 DS:211c
    CALL MIXT_082a_Maior(L_BP43a!, L_BP43e!, L_BP442!)   '@1afb5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP446! = 0.0   '@1afca DS:20e4
    L_BP44a! = 3.0   '@1b015 DS:210c
    L_BP44e! = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@1b021
    CALL MIXT_082a_Maior(L_BP44a!, L_BP44e!, L_BP452!)   '@1b046
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP44e!   '@1b05b
    L_BP456! = (FX##(L_BP1e!) - L_BP16! + L_BP452!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1b081 DS:211c
    CALL MIXT_082a_Maior(L_BP446!, L_BP456!, L_BP45a!)   '@1b0a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!), L_BP442!, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!), L_BP45a!, 9, V_191a%, 0   '@1b0bb
L_1b10e:
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1b113 DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@1b129 DS:2110,2118
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1b196   '@1b144 DS:211c
    V_0e30! = 0.0   '@1b16c DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@1b17d DS:211c
L_1b196:
    L_BP45e! = 0.0   '@1b196 DS:20e4
    L_BP462! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1b1a8
    CALL MIXT_082a_Maior(L_BP45e!, L_BP462!, L_BP466!)   '@1b1d3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46a! = FX##(V_0e5c!) / 2.0 - 1.0   '@1b1e8 DS:20e0,2110
    L_BP46e! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1b233
    CALL MIXT_0877_Menor(L_BP46a!, L_BP46e!, L_BP472!)   '@1b261
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP466!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), RT_SNG!(FX##(L_BP472!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@1b276
L_1b2bf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1b2c4 DS:204c
L_1b2f5:
    IF NOT (V_1872! = 0.0) THEN GOTO L_1b31d   '@1b2fa DS:20e4
    GOTO L_1b6f2   '@1b315
L_1b31d:
    L_BP476! = V_1872!   '@1b31d
    FOR V_0e14! = 1.0 TO L_BP476!   '@1b32f DS:204c
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_1b3ad   '@1b336
    GOTO L_1b6bc   '@1b3a5
L_1b3ad:
    V_0f7e! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)   '@1b3ad
    V_0f82! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)   '@1b3d5
    V_0dfc$ = "GN"   '@1b400 DS:21dc
    GOSUB L_1d880   '@1b412
    V_1f36! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0 + 1.0) / A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))   '@1b41f DS:204c,20e0,215e
    V_0e28! = 4.0   '@1b491 DS:2104
L_1b4a8:
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1b4a8 DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@1b4be DS:2110,2118
    IF NOT ((FX##(L_BP1e!) - L_BP16! + V_0e28!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1b530   '@1b4d9 DS:211c
    V_0e30! = 0.0   '@1b506 DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@1b517 DS:211c
L_1b530:
    L_BP47a! = 0.0   '@1b530 DS:20e4
    L_BP47e! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1b542
    CALL MIXT_082a_Maior(L_BP47a!, L_BP47e!, L_BP482!)   '@1b56d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP486! = FX##(V_0e5c!) / 2.0 - 1.0   '@1b582 DS:20e0,2110
    L_BP48a! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1b5d2
    CALL MIXT_0877_Menor(L_BP486!, L_BP48a!, L_BP48e!)   '@1b600
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP482!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16! + V_0e28!) * V_18e6! + V_0e34!), RT_SNG!(FX##(L_BP48e!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16! + V_0e28!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@1b615
    V_0e28! = FX##(V_0e28!) + 4.0   '@1b65e DS:2104
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT ((FX##(V_0e28!) / 4.0 - 1.0) * V_1f36! >= FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 0))) THEN GOTO L_1b4a8   '@1b674 DS:2104,2110
L_1b6bc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1b6c1 DS:204c
L_1b6f2:
    IF NOT (V_1862! = 0.0) THEN GOTO L_1b71a   '@1b6f7 DS:20e4
    GOTO L_1b9ff   '@1b712
L_1b71a:
    L_BP492! = V_1862!   '@1b71a
    FOR V_0e14! = 1.0 TO L_BP492!   '@1b72c DS:204c
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_1b7ab   '@1b734
    GOTO L_1b9c9   '@1b7a3
L_1b7ab:
    V_0f7e! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)   '@1b7ab
    V_0f82! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)   '@1b7d3
    V_0dfc$ = "GN"   '@1b7fe DS:21dc
    GOSUB L_1d880   '@1b810
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1b81d DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!)   '@1b833 DS:2118
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1b8a0   '@1b849 DS:211c
    V_0e30! = 0.0   '@1b871 DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0 - 1.0   '@1b882 DS:2110,211c
L_1b8a0:
    L_BP496! = 0.0   '@1b8a0 DS:20e4
    L_BP49a! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1b8b2
    CALL MIXT_082a_Maior(L_BP496!, L_BP49a!, L_BP49e!)   '@1b8dd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4a2! = FX##(V_0e5c!) / 2.0 - 1.0   '@1b8f2 DS:20e0,2110
    L_BP4a6! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1b93d
    CALL MIXT_0877_Menor(L_BP4a2!, L_BP4a6!, L_BP4aa!)   '@1b96b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP49e!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), RT_SNG!(FX##(L_BP4aa!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@1b980
L_1b9c9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1b9ce DS:204c
L_1b9ff:
    IF NOT (V_1866! = 0.0) THEN GOTO L_1ba27   '@1ba04 DS:20e4
    GOTO L_1c509   '@1ba1f
L_1ba27:
    L_BP4ae! = V_1866!   '@1ba27
    FOR V_0e14! = 1.0 TO L_BP4ae!   '@1ba39 DS:204c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_1bab7   '@1ba40
    GOTO L_1c4d3   '@1baaf
L_1bab7:
    V_0f7e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@1bab7
    V_0f82! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@1badf
    V_0dfc$ = "P"   '@1bb0a DS:21e2
    GOSUB L_1d880   '@1bb1c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < L_BP0e!) THEN GOTO L_1bb62   '@1bb29
    GOTO L_1bf19   '@1bb5a
L_1bb62:
    IF NOT ((FX##(L_BP1e!) - L_BP16! - A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1bbb0   '@1bb62 DS:211c
    GOTO L_1bd61   '@1bba8
L_1bbb0:
    L_BP4b2! = FX##(V_0e60!) - 1.0   '@1bbb0 DS:2110
    L_BP4b6! = 3.0   '@1bbc7 DS:210c
    L_BP4ba! = A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)   '@1bbd3
    CALL MIXT_082a_Maior(L_BP4b6!, L_BP4ba!, L_BP4be!)   '@1bbf7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4ba!   '@1bc0c
    L_BP4c2! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16! - L_BP4be!) * V_18e6!   '@1bc31 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP4b2!, L_BP4c2!, L_BP4c6!)   '@1bc5b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4ca! = FX##(V_0e60!) - 1.0   '@1bc70 DS:20e0,2110
    L_BP4ce! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16!) * V_18e6!   '@1bcca DS:2110,2118
    CALL MIXT_0877_Menor(L_BP4ca!, L_BP4ce!, L_BP4d2!)   '@1bcef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP4c6!, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP4d2!, 9, V_191a%, 0   '@1bd04 DS:20e0
L_1bd61:
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! <= FX##(V_0e60!) / 8.0) THEN GOTO L_1bd96   '@1bd66 DS:211c
    GOTO L_1bf19   '@1bd8e
L_1bd96:
    L_BP4d6! = 0.0   '@1bd96 DS:20e4
    L_BP4da! = 3.0   '@1bda8 DS:210c
    L_BP4de! = A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)   '@1bdb4
    CALL MIXT_082a_Maior(L_BP4da!, L_BP4de!, L_BP4e2!)   '@1bdd8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4de!   '@1bded
    L_BP4e6! = (FX##(L_BP1e!) - L_BP16! - L_BP4e2!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1be12 DS:211c
    CALL MIXT_082a_Maior(L_BP4d6!, L_BP4e6!, L_BP4ea!)   '@1be37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4ee! = 0.0   '@1be4c DS:20e4
    L_BP4f2! = (FX##(L_BP1e!) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1be94 DS:211c
    CALL MIXT_082a_Maior(L_BP4ee!, L_BP4f2!, L_BP4f6!)   '@1beb4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), L_BP4ea!, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!), L_BP4f6!, 9, V_191a%, 0   '@1bec9
L_1bf19:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > L_BP12!) THEN GOTO L_1bf5a   '@1bf1e
    GOTO L_1c322   '@1bf52
L_1bf5a:
    IF NOT ((FX##(L_BP1e!) - L_BP16! - A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1bfa9   '@1bf5a DS:211c
    GOTO L_1c162   '@1bfa1
L_1bfa9:
    L_BP4fa! = FX##(V_0e60!) - 1.0   '@1bfa9 DS:2110
    L_BP4fe! = 3.0   '@1bfc0 DS:210c
    L_BP502! = A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@1bfcc
    CALL MIXT_082a_Maior(L_BP4fe!, L_BP502!, L_BP506!)   '@1bff1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP502!   '@1c006
    L_BP50a! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16! - L_BP506!) * V_18e6!   '@1c02c DS:2110,2118
    CALL MIXT_0877_Menor(L_BP4fa!, L_BP50a!, L_BP50e!)   '@1c056
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP512! = FX##(V_0e60!) - 1.0   '@1c06b DS:20e0,2110
    L_BP516! = 0.875 * FX##(V_0e60!) - 1.0 + (FX##(L_BP1e!) - L_BP16!) * V_18e6!   '@1c0c8 DS:2110,2118
    CALL MIXT_0877_Menor(L_BP512!, L_BP516!, L_BP51a!)   '@1c0ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP50e!, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), L_BP51a!, 9, V_191a%, 0   '@1c102 DS:20e0
L_1c162:
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! <= FX##(V_0e60!) / 8.0) THEN GOTO L_1c197   '@1c167 DS:211c
    GOTO L_1c322   '@1c18f
L_1c197:
    L_BP51e! = 0.0   '@1c197 DS:20e4
    L_BP522! = 3.0   '@1c1a9 DS:210c
    L_BP526! = A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@1c1b5
    CALL MIXT_082a_Maior(L_BP522!, L_BP526!, L_BP52a!)   '@1c1da
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP526!   '@1c1ef
    L_BP52e! = (FX##(L_BP1e!) - L_BP16! - L_BP52a!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1c215 DS:211c
    CALL MIXT_082a_Maior(L_BP51e!, L_BP52e!, L_BP532!)   '@1c23a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP536! = 0.0   '@1c24f DS:20e4
    L_BP53a! = (FX##(L_BP1e!) - L_BP16!) * V_18e6! - FX##(V_0e60!) / 8.0   '@1c29a DS:211c
    CALL MIXT_082a_Maior(L_BP536!, L_BP53a!, L_BP53e!)   '@1c2ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!), L_BP532!, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!), L_BP53e!, 9, V_191a%, 0   '@1c2cf
L_1c322:
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1c327 DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@1c33d DS:2110,2118
    IF NOT ((FX##(L_BP1e!) - L_BP16!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1c3aa   '@1c358 DS:211c
    V_0e30! = 0.0   '@1c380 DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@1c391 DS:211c
L_1c3aa:
    L_BP542! = 0.0   '@1c3aa DS:20e4
    L_BP546! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1c3bc
    CALL MIXT_082a_Maior(L_BP542!, L_BP546!, L_BP54a!)   '@1c3e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP54e! = FX##(V_0e5c!) / 2.0 - 1.0   '@1c3fc DS:20e0,2110
    L_BP552! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1c447
    CALL MIXT_0877_Menor(L_BP54e!, L_BP552!, L_BP556!)   '@1c475
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP54a!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), RT_SNG!(FX##(L_BP556!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@1c48a
L_1c4d3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1c4d8 DS:204c
L_1c509:
    IF NOT (V_1876! = 0.0) THEN GOTO L_1c531   '@1c50e DS:20e4
    GOTO L_1c906   '@1c529
L_1c531:
    L_BP55a! = V_1876!   '@1c531
    FOR V_0e14! = 1.0 TO L_BP55a!   '@1c543 DS:204c
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) <= L_BP0e! OR A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) >= L_BP12!) THEN GOTO L_1c5c1   '@1c54a
    GOTO L_1c8d0   '@1c5b9
L_1c5c1:
    V_0f7e! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)   '@1c5c1
    V_0f82! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)   '@1c5e9
    V_0dfc$ = "GP"   '@1c614 DS:21e8
    GOSUB L_1d880   '@1c626
    V_1f36! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0 + 1.0) / A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))   '@1c633 DS:204c,20e0,215e
    V_0e28! = 4.0   '@1c6a5 DS:2104
L_1c6bc:
    V_0e30! = FX##(V_0e5c!) / 2.0   '@1c6bc DS:20e0
    V_0e34! = 0.875 * FX##(V_0e60!) - 1.0   '@1c6d2 DS:2110,2118
    IF NOT ((FX##(L_BP1e!) - L_BP16! - V_0e28!) * V_18e6! > FX##(V_0e60!) / 8.0) THEN GOTO L_1c744   '@1c6ed DS:211c
    V_0e30! = 0.0   '@1c71a DS:20e4
    V_0e34! = FX##(-V_0e60!) / 8.0   '@1c72b DS:211c
L_1c744:
    L_BP55e! = 0.0   '@1c744 DS:20e4
    L_BP562! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - L_BP0e!) * V_0f72!   '@1c756
    CALL MIXT_082a_Maior(L_BP55e!, L_BP562!, L_BP566!)   '@1c781
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP56a! = FX##(V_0e5c!) / 2.0 - 1.0   '@1c796 DS:20e0,2110
    L_BP56e! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!) * V_0f72!   '@1c7e6
    CALL MIXT_0877_Menor(L_BP56a!, L_BP56e!, L_BP572!)   '@1c814
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!(FX##(L_BP566!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16! - V_0e28!) * V_18e6! + V_0e34!), RT_SNG!(FX##(L_BP572!) + V_0e30!), RT_SNG!((FX##(L_BP1e!) - L_BP16! - V_0e28!) * V_18e6! + V_0e34!), 9, V_191a%, 0   '@1c829
    V_0e28! = FX##(V_0e28!) + 4.0   '@1c872 DS:2104
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT ((FX##(V_0e28!) / 4.0 - 1.0) * V_1f36! >= FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 0))) THEN GOTO L_1c6bc   '@1c888 DS:2104,2110
L_1c8d0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1c8d5 DS:204c
L_1c906:
    L_BP576! = V_0ddc!   '@1c90b
    FOR V_0e14! = 0.0 TO L_BP576!   '@1c91d DS:204c,20e4
    REDIM A_13fe%(-32768 TO -32768)   '@1c924
    REDIM A_13fe%(0 TO 20)   '@1c932
    IF NOT (V_185e! = 0.0) THEN GOTO L_1c972   '@1c94f DS:20e4
    GOTO L_1d0d4   '@1c96a
L_1c972:
    L_BP57a! = V_185e!   '@1c972
    FOR V_0e28! = 1.0 TO L_BP57a!   '@1c984 DS:204c
    IF NOT (V_0de0! = 0.0 AND V_0e14! = 0.0) THEN GOTO L_1ca16   '@1c98c DS:20e4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) < A_1a0c!(1, 0)) THEN GOTO L_1ca16   '@1c9ca
    GOTO L_1cb7b   '@1ca0e
L_1ca16:
    IF NOT (V_0de4! = 0.0 AND V_0e14! = V_0ddc!) THEN GOTO L_1caab   '@1ca16 DS:20e4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) THEN GOTO L_1caab   '@1ca54
    GOTO L_1cb7b   '@1caa3
L_1caab:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0) OR A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) THEN GOTO L_1cb76   '@1caab
    GOTO L_1cd30   '@1cb6e
L_1cb76:
L_1cb7b:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@1cb80
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@1cbab
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1af2!(RT_CINT%(FX##(V_0e28!)), 0))   '@1ccc6
L_1cd30:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1cd35 DS:204c
    V_0dfc$ = ""   '@1cd61 DS:1fa0
    V_0e34! = 0.875 * FX##(V_0e60!) - 2.0   '@1cd73 DS:2114,2118
    FOR V_0e28! = 9.0 TO 0.0 STEP -1.0   '@1cd8e DS:20e4,2110,21ee
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e28!))) > 0) THEN GOTO L_1cfda   '@1cd9c
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(A_13fe%(RT_CINT%(FX##(V_0e28!)))) + "#"), (2))   '@1cdc3 DS:2176
    V_0e30! = -(V_0e28! = 0.0) * FX##(V_0eee!) - FX##(V_0e28! = 1.0) * V_0ef2! - FX##(V_0e28! = 2.0) * V_0ef6! - FX##(V_0e28! = 3.0) * V_0efa! - FX##(V_0e28! = 4.0) * V_0efe!   '@1ce13 DS:204c,20e0,20e4,2104,210c
    V_0e30! = V_0e30! - FX##(V_0e28! = 5.0) * V_0f02! - FX##(V_0e28! = 6.0) * V_0f06! - FX##(V_0e28! = 7.0) * V_0f0a! - FX##(V_0e28! = 8.0) * V_0f0e! - FX##(V_0e28! = 9.0) * V_0f12!   '@1ced2 DS:211c,215e,2184,21ee,21f2
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(V_0e30!)), (2)) + "+"   '@1cf97 DS:21f6
L_1cfda:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1cfda DS:20e4,2110
    IF NOT (LEN(V_0dfc$) > 0) THEN GOTO L_1d0cf   '@1d006
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (LEN(V_0dfc$) - 1))   '@1d01b
    V_0e30! = (FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) / 2.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0 + FX##(V_0e5c!) / 2.0   '@1d042 DS:20e0
    GOSUB L_10fd5   '@1d0bd
L_1d0cf:
L_1d0d4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1d0d9 DS:204c
    L_BP57e! = FX##(V_0ddc!) + V_0de4!   '@1d105
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP57e!   '@1d11c DS:204c
    REDIM A_13fe%(-32768 TO -32768)   '@1d128
    REDIM A_13fe%(0 TO 20)   '@1d136
    IF NOT (V_1866! = 0.0) THEN GOTO L_1d176   '@1d153 DS:20e4
    GOTO L_1d845   '@1d16e
L_1d176:
    L_BP582! = V_1866!   '@1d176
    FOR V_0e28! = 1.0 TO L_BP582!   '@1d188 DS:204c
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)) < FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) * 3.0 / 5.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)) > FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) * 2.0 / 5.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) THEN GOTO L_1d28d   '@1d190 DS:20e0,210c,215e
    GOTO L_1d43d   '@1d285
L_1d28d:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@1d28d
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@1d2b8
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0))   '@1d3d3
L_1d43d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1d442 DS:204c
    V_0dfc$ = ""   '@1d46e DS:1fa0
    L_BP586! = 10.0   '@1d480 DS:2050
    L_BP58a! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) - L_BP16! + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18e6! - 2.0 * FX##(V_0e60!) / 25.0   '@1d492 DS:20e0,2100
    CALL MIXT_082a_Maior(L_BP586!, L_BP58a!, L_BP58e!)   '@1d4ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e34! = L_BP58e!   '@1d502
    FOR V_0e28! = 9.0 TO 0.0 STEP -1.0   '@1d50d DS:20e4,2110,21ee
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e28!))) > 0) THEN GOTO L_1d758   '@1d51a
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(A_13fe%(RT_CINT%(FX##(V_0e28!)))) + "#"), (2))   '@1d541 DS:2176
    V_0e30! = -(V_0e28! = 0.0) * FX##(V_0eee!) - FX##(V_0e28! = 1.0) * V_0ef2! - FX##(V_0e28! = 2.0) * V_0ef6! - FX##(V_0e28! = 3.0) * V_0efa! - FX##(V_0e28! = 4.0) * V_0efe!   '@1d591 DS:204c,20e0,20e4,2104,210c
    V_0e30! = V_0e30! - FX##(V_0e28! = 5.0) * V_0f02! - FX##(V_0e28! = 6.0) * V_0f06! - FX##(V_0e28! = 7.0) * V_0f0a! - FX##(V_0e28! = 8.0) * V_0f0e! - FX##(V_0e28! = 9.0) * V_0f12!   '@1d650 DS:211c,215e,2184,21ee,21f2
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(V_0e30!)), (2)) + "+"   '@1d715 DS:21f6
L_1d758:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1d758 DS:20e4,2110
    IF NOT (LEN(V_0dfc$) > 0) THEN GOTO L_1d840   '@1d784
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (LEN(V_0dfc$) - 1))   '@1d799
    V_0e30! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f72! / 2.0 - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@1d7c0 DS:20e0
    GOSUB L_10d02   '@1d82e
L_1d840:
L_1d845:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1d84a DS:204c
    RETURN   '@1d876
L_1d880:   ' sub-rotina (alvo de GOSUB)
    L_BP1e! = L_BP16!   '@1d885
    L_BP590% = (V_0dfc$ = "P")   '@1d894 DS:21e2
    IF NOT ((V_0dfc$ = "GP" OR L_BP590%) <> 0) THEN GOTO L_1d8ee   '@1d8ba DS:21e8
    L_BP1e! = 0.2599999904632568359375## * V_0e60! / V_18e6! - L_BP16!   '@1d8d0 DS:21fc
L_1d8ee:
    L_BP594! = FX##(V_0ddc!) + V_0de4!   '@1d8ee
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP594!   '@1d905 DS:204c
    L_BP596% = (V_0dfc$ = "N")   '@1d912 DS:2124
    IF NOT ((A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) < V_0f82! AND (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > V_0f7e! AND (V_0dfc$ = "GN" OR L_BP596%))) <> 0) THEN GOTO L_1da29   '@1d938 DS:21dc
    L_BP59a! = FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + V_0ea6!   '@1d9bb
    CALL MIXT_082a_Maior(L_BP1e!, L_BP59a!, L_BP59e!)   '@1d9e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1e! = L_BP59e!   '@1d9fb
    IF NOT (V_0dfc$ = "GN") THEN GOTO L_1da24   '@1da05 DS:21dc
    GOTO L_1db8b   '@1da1c
L_1da24:
L_1da29:
    L_BP5a0% = (V_0dfc$ = "P")   '@1da29 DS:21e2
    IF NOT ((A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) < V_0f82! AND (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > V_0f7e! AND (V_0dfc$ = "GP" OR L_BP5a0%))) <> 0) THEN GOTO L_1db5f   '@1da4f DS:21e8
    L_BP5a4! = FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0ea6! + A_19b0!(RT_CINT%(FX##(V_0e28!)))   '@1dad2
    CALL MIXT_0877_Menor(L_BP1e!, L_BP5a4!, L_BP5a8!)   '@1db1d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1e! = L_BP5a8!   '@1db31
    IF NOT (V_0dfc$ = "GP") THEN GOTO L_1db5a   '@1db3b DS:21e8
    GOTO L_1db8b   '@1db52
L_1db5a:
L_1db5f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1db5f DS:204c
L_1db8b:
    RETURN   '@1db8b
L_1db9a:   ' sub-rotina (alvo de GOSUB)
    L_BP1a! = 65.0   '@1db9f DS:2200
    L_BP5ac! = FX##(V_0ddc!) + V_0de4!   '@1dbaf
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP5ac!   '@1dbc6 DS:204c
    V_0e28! = 1.0 - FX##(V_0de0!)   '@1dbd2 DS:204c
L_1dbed:
    IF NOT (V_0e28! < V_0e14! AND (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) = A_1232!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1232!(RT_CINT%(FX##(V_0e14!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0))) THEN GOTO L_1dcbb   '@1dbf2
    GOTO L_1dd1a   '@1dcb3
L_1dcbb:
    IF NOT (V_0e28! < V_0e14!) THEN GOTO L_1dcf4   '@1dcbb
    V_0e28! = FX##(V_0e28!) + 1.0   '@1dcd6 DS:204c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1dbed   '@1dcec
L_1dcf4:
    GOSUB L_1dd5a   '@1dcf4
    L_BP1a! = FX##(L_BP1a!) + 1.0   '@1dd01 DS:204c
L_1dd1a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1dd1f DS:204c
    RETURN   '@1dd4b
L_1dd5a:   ' sub-rotina (alvo de GOSUB)
    V_0e40! = V_0e14!   '@1dd5f
    L_BP5b0! = FX##(V_0ddc!) + V_0de4!   '@1dd70
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP5b0!   '@1dd87 DS:204c
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e40!)), 1) = A_1232!(RT_CINT%(FX##(V_0e28!)), 1) AND (A_1232!(RT_CINT%(FX##(V_0e40!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0) AND A_128e!(RT_CINT%(FX##(V_0e28!)), 4) > A_128e!(RT_CINT%(FX##(V_0e40!)), 4))) THEN GOTO L_1de9c   '@1dd94
    V_0e40! = V_0e28!   '@1de8b
L_1de9c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@1de9c DS:204c
    V_1f26! = FX##(A_1926!(RT_CINT%(FX##(V_0e40!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e40!)), 0)   '@1dec8 DS:210c
    IF NOT (V_0ddc! > 1.0 AND (V_0de0! = 0.0 AND V_0e40! = 1.0) OR V_0de4! = 1.0 AND V_0e40! = V_0ddc!) THEN GOTO L_1dff8   '@1df16 DS:204c,20e4
    V_1f26! = FX##(A_1926!(RT_CINT%(FX##(V_0e40!)), 1)) * 2.0 / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e40!)), 0)   '@1dfa5 DS:20e0,210c
L_1dff8:
    IF NOT (V_0e40! < V_0ddc! AND V_0e40! > 1.0) THEN GOTO L_1e167   '@1dff8 DS:204c
    V_1f26! = A_1a0c!(RT_CINT%(FX##(V_0e40!)), 0) - FX##(A_128e!(RT_CINT%(FX##(V_0e40!) - 1.0), 4) >= A_128e!(RT_CINT%(FX##(V_0e40!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e40!)), 1) / 3.0 - FX##(A_128e!(RT_CINT%(FX##(V_0e40!) - 1.0), 4) < A_128e!(RT_CINT%(FX##(V_0e40!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e40!)), 1) * 2.0 / 3.0   '@1e036 DS:204c,20e0,210c,2110
L_1e167:
    IF NOT (V_1f26! > L_BP12! OR V_1f26! < L_BP0e!) THEN GOTO L_1e1ad   '@1e167
    RETURN   '@1e1a3
L_1e1ad:
    RT_LINE RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(FX##(V_0e60!) - 1.0), RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.7799999713897705078125## * V_0e60!), 9, V_191a%, 0   '@1e1ad DS:20e0,2110,2134
    RT_LINE 0, 0, RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72! + (FX##(V_0e5c!) / 2.0 - FX##(V_0e68!) / 2.0)), RT_SNG!(0.800000011920928955078125## * V_0e60!), 8, V_191a%, 0   '@1e23e DS:20e0,2204
    RT_LINE 0, 0, RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72! + FX##(V_0e5c!) / 2.0), RT_SNG!(0.819999992847442626953125## * V_0e60!), 8, V_191a%, 0   '@1e29e DS:20e0,2208
    V_0e30! = FX##(V_1f26!) * V_0f72! + FX##(V_0e5c!) / 2.0 + FX##(V_0e68!) / 2.0   '@1e2f1 DS:20e0
    V_0e34! = 0.824999988079071044921875## * V_0e60!   '@1e321 DS:214c
    V_0e30! = FX##(V_0e30! - FX##(L_BP0e!) * V_0f72! > FX##(V_0e5c!) + 2.0) * 2.5 * V_0e68! + V_0e30!   '@1e337 DS:20e0,2156
    V_0dfc$ = CHR$(RT_CINT%(FX##(L_BP1a!)))   '@1e37f
    GOSUB L_10fd5   '@1e39d
    L_BP5b4! = 0.104999996721744537353515625## * V_0e60!   '@1e3aa DS:20e4,220c
    L_BP5b8! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e40!)))) - L_BP16! + A_1232!(RT_CINT%(FX##(V_0e40!)), 1)) * V_18e6! - FX##(V_0e60!) / 50.0   '@1e3e6 DS:2210
    CALL MIXT_082a_Maior(L_BP5b4!, L_BP5b8!, L_BP5bc!)   '@1e43c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72!), 0.0, RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72!), L_BP5bc!, 9, V_191a%, 0   '@1e451
    L_BP5c0! = 0.085000000894069671630859375## * V_0e60!   '@1e485 DS:2214
    L_BP5c4! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e40!)))) - L_BP16! + A_1232!(RT_CINT%(FX##(V_0e40!)), 1)) * V_18e6! - FX##(V_0e60!) / 25.0   '@1e49c DS:2100
    CALL MIXT_082a_Maior(L_BP5c0!, L_BP5c4!, L_BP5c8!)   '@1e4f2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72! - FX##(V_0e68!) / 2.0), L_BP5c8!, 8, V_191a%, 0   '@1e507 DS:20e0
    L_BP5cc! = 0.064999997615814208984375## * V_0e60!   '@1e548 DS:2218
    L_BP5d0! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e40!)))) - L_BP16! + A_1232!(RT_CINT%(FX##(V_0e40!)), 1)) * V_18e6! - 0.0599999986588954925537109375## * V_0e60!   '@1e55f DS:216e
    CALL MIXT_082a_Maior(L_BP5cc!, L_BP5d0!, L_BP5d4!)   '@1e5b5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!((FX##(V_1f26!) - L_BP0e!) * V_0f72!), L_BP5d4!, 8, V_191a%, 0   '@1e5ca
    RETURN   '@1e5fe
L_1e60d:   ' entrada vinda de 0107d6_FUN_1000_07d6
    ' @1e60d libera strings locais (L_BP3a)
    ' @1e616 libera strings locais (L_BP26)
    ' END SUB   '@1e61f
END SUB

SUB S_20150   ' entrada de SUB/FUNCTION (B$ENRA, locais 352 bytes) (0x20150)
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
    DIM L_BP46$
    DIM L_BP4a!
    DIM L_BP4e!
    DIM L_BP52$
    DIM L_BP56$
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62$
    DIM L_BP66$
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72!
    DIM L_BP76!
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP82!
    DIM L_BP86!
    DIM L_BP8a!
    DIM L_BP8e$
    DIM L_BP92!
    DIM L_BP96!
    DIM L_BP9a!
    DIM L_BP9e!
    DIM L_BPa2!
    DIM L_BPa6!
    DIM L_BPaa!
    DIM L_BPae$
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
    ' ---- FUN_2000_0150 @0x20150  (020150_FUN_2000_0150.lift.txt; evidence_id (assembly): ev_734579d7bd7dcf3d857383a4b27846cf87491636812cfc04ba5d6e840a7c7f49)
    RT_VIEWPRINT 1, 25   '@2016c
    RT_VIEW 1, (0), (0), (RT_CINT%(FX##(V_0e5c!) - 1.0)), (RT_CINT%(FX##(V_0e60!) - 1.0)), (-1), (-1)   '@2017e DS:2220 (B$VIEW decodificado)
    RT_WINDOW 1, (0), (0), (639), (199)   '@201b2 DS:2224,2226,2228,222a,222c,222e (B$WIND decodificado)
    RT_CLS 0   '@201e0
    V_0e30! = 320.0   '@201ed DS:2230
    V_0e34! = 0.0   '@201fe DS:2224
    L_BP1e! = 65.0   '@2020f DS:2234
    L_BP22! = FX##(V_0ddc!) + V_0de4!   '@2021f
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP22!   '@20235 DS:2238
    V_0e28! = 1.0 - FX##(V_0de0!)   '@20242 DS:2238
L_2025d:
    IF NOT (V_0e28! < V_0e14! AND (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) = A_1232!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1232!(RT_CINT%(FX##(V_0e14!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0))) THEN GOTO L_2032b   '@20262
    GOTO L_2074b   '@20323
L_2032b:
    IF NOT (V_0e28! < V_0e14!) THEN GOTO L_20364   '@2032b
    V_0e28! = FX##(V_0e28!) + 1.0   '@20346 DS:2238
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2025d   '@2035c
L_20364:
    GOSUB L_207a9   '@20364
    L_BP1e! = FX##(L_BP1e!) + 1.0   '@20371 DS:2238
    IF NOT (V_0e34! = 0.0 AND V_0e30! = 320.0) THEN GOTO L_203dc   '@20385 DS:2224,2230
    V_0e34! = 85.0   '@203c3 DS:223c
    GOTO L_2074b   '@203d4
L_203dc:
    IF NOT (V_0e34! = 85.0 AND V_0e30! = 320.0) THEN GOTO L_20444   '@203dc DS:2230,223c
    V_0e30! = 0.0   '@2041a DS:2224
    V_0e34! = 0.0   '@2042b DS:2224
    GOTO L_2074b   '@2043c
L_20444:
    IF NOT (V_0e34! = 0.0 AND V_0e30! = 0.0) THEN GOTO L_2049b   '@20444 DS:2224
    V_0e34! = 85.0   '@20482 DS:223c
    GOTO L_2074b   '@20493
L_2049b:
    IF NOT (V_0e34! = 85.0 AND V_0e30! = 0.0) THEN GOTO L_2055e   '@2049b DS:2224,223c
    V_0e30! = 480.0   '@204d9 DS:2240
    V_0e34! = 0.0   '@204ea DS:2224
    RT_LINE 480, 0, 480, 170, 1, 0, 0   '@204fb
    RT_LINE 160, 0, 160, 170, 1, 0, 0   '@20526
    GOTO L_2074b   '@20551
L_2055e:
    IF NOT (V_0e34! = 0.0 AND V_0e30! = 480.0) THEN GOTO L_205b5   '@2055e DS:2224,2240
    V_0e34! = 85.0   '@2059c DS:223c
    GOTO L_2074b   '@205ad
L_205b5:
    IF NOT (V_0e34! = 85.0 AND V_0e30! = 480.0) THEN GOTO L_2061d   '@205b5 DS:223c,2240
    V_0e30! = 160.0   '@205f3 DS:2244
    V_0e34! = 0.0   '@20604 DS:2224
    GOTO L_2074b   '@20615
L_2061d:
    IF NOT (V_0e34! = 0.0 AND V_0e30! = 160.0) THEN GOTO L_20674   '@2061d DS:2224,2244
    V_0e34! = 85.0   '@2065b DS:223c
    GOTO L_2074b   '@2066c
L_20674:
    IF NOT (V_0e34! = 85.0 AND V_0e30! = 160.0) THEN GOTO L_20746   '@20674 DS:223c,2244
    RT_LINE 639, 0, 639, 170, 1, 0, 0   '@206b2
    RT_LINE 319, 0, 319, 170, 1, 0, 0   '@206dd
    RT_ROTINA_0F20   '@20708 (rotina em assembly ligada ao EXE (SUB_50f20); gerada no fim do programa)
    V_0e30! = 320.0   '@20712 DS:2230
    V_0e34! = 0.0   '@20723 DS:2224
    RT_CLS 0   '@20734
L_20746:
L_2074b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@20750 DS:2238
    GOSUB L_24b05   '@2077b
    RT_WINDOW 0, 0, 0, 0, 0   '@20788 (sem argumentos (B$WIN0/B$VEW0))
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@20792 (sem argumentos (B$WIN0/B$VEW0))
    GOTO L_25097   '@2079c
    ' ---- F_207a4 @0x207a4  (0207a4_F_207a4.lift.txt; evidence_id (assembly): ev_7dc4d45ffc77ffb33a5940c4a7daf3b1b5ed3053c8fe440ca53cfb7fe386ce9d)
L_207a9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020150_FUN_2000_0150
    V_0e44! = V_0e14!   '@207ae
    L_BP26! = V_0ddc!   '@207bf
    FOR V_0e28! = 1.0 TO L_BP26!   '@207d0 DS:2238
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e28!)), 1) = A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0) AND A_128e!(RT_CINT%(FX##(V_0e28!)), 4) > A_128e!(RT_CINT%(FX##(V_0e44!)), 4))) THEN GOTO L_208e0   '@207d8
    V_0e44! = V_0e28!   '@208cf
L_208e0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@208e0 DS:2238
    L_BP2a! = 30.0 / FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))   '@2090b DS:2248
    L_BP2e! = 50.0 / FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1))   '@2093a DS:224c
    CALL MIXT_0877_Menor(L_BP2a!, L_BP2e!, L_BP32!)   '@20963
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP32!   '@20975
    L_BP0e! = 2.0   '@2097f DS:2250
    L_BP12! = 1.0   '@2098f DS:2238
    GOSUB L_20bfe   '@2099f
    GOSUB L_22967   '@209ac
    IF NOT (V_0e1c! = 0.0) THEN GOTO L_209dc   '@209b9 DS:2224
    GOTO L_20b6e   '@209d4
L_209dc:
    V_0dfc$ = STR$(RT_SNG!(A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!)))   '@209dc DS:2250
    L_BP36! = -(LEN(V_0dfc$) * 8 - 158) + FX##(V_0e30!)   '@20a26
    L_BP3a! = FX##(V_0e30!) + 97.0 + FX##(L_BP0e!) * V_0e1c! * V_0e28!   '@20a50 DS:2254
    CALL MIXT_0877_Menor(L_BP36!, L_BP3a!, L_BP3e!)   '@20a70
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP42! = FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28! / 2.0   '@20a82 DS:2250,2258
    L_BP46$ = "CGA"   '@20ac1 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP3e!, L_BP42!, V_0dfc$, L_BP46$)   '@20ace
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @20ae3 libera strings locais (L_BP46)
    L_BP4a! = FX##(V_0e30!) + 100.0   '@20aec DS:2264
    L_BP4e! = FX##(V_0e34!) + 11.0   '@20b02 DS:2268
    L_BP52$ = STR$(V_0e1c!)   '@20b11
    L_BP56$ = "CGA"   '@20b28 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP4a!, L_BP4e!, L_BP52$, L_BP56$)   '@20b35
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @20b4a libera strings locais (L_BP52)
    ' @20b53 libera strings locais (L_BP56)
    GOSUB L_21f67   '@20b5c
L_20b6e:
    L_BP5a! = FX##(V_0e30!) + 15.0   '@20b73 DS:226c
    L_BP5e! = FX##(V_0e34!) + 10.0   '@20b89 DS:2258
    L_BP62$ = "CORTE " + CHR$(RT_CINT%(FX##(L_BP1e!)))   '@20b98 DS:2270
    L_BP66$ = "CGA"   '@20bbb DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP5a!, L_BP5e!, L_BP62$, L_BP66$)   '@20bc8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @20bdd libera strings locais (L_BP62)
    ' @20be6 libera strings locais (L_BP66)
    RETURN   '@20bef
L_20bfe:   ' sub-rotina (alvo de GOSUB)
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), 9, V_191a%, 0   '@20c03 DS:2258,226c
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@20c9c DS:2258,226c
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) = 0) THEN GOTO L_20e58   '@20d8b
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@20db6 DS:2258,226c
    GOTO L_210cc   '@20e50
L_20e58:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@20e58 DS:2258,226c
    RT_LINE 0, 0, V_0e30!, RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), 8, V_191a%, 0   '@20ef5 DS:2258
    RT_LINE V_0e30!, RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@20f59 DS:2258,226c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), 8, V_191a%, 0   '@2105a DS:2258,226c
L_210cc:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) = 0) THEN GOTO L_211f2   '@210d1
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@210fc DS:2258,226c
    GOTO L_21572   '@211ea
L_211f2:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@211f2 DS:2258,226c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 30.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP12! * V_0e28!), 8, V_191a%, 0   '@212e1 DS:2248,2258
    RT_LINE RT_SNG!(FX##(V_0e30!) + 30.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP12! * V_0e28!), 9, V_191a%, 0   '@21379 DS:2248,2258,226c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28!), 8, V_191a%, 0   '@214d6 DS:2258,226c
L_21572:
    V_0e20! = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@21577
    L_BP1a! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@215f1 DS:227a
    IF NOT (V_186a! = 0.0) THEN GOTO L_2166b   '@21648 DS:2224
    GOTO L_21979   '@21663
L_2166b:
    L_BP6a! = V_186a!   '@2166b
    FOR V_0e1c! = 1.0 TO L_BP6a!   '@2167c DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e1c!)), 5) = L_BP1a!) THEN GOTO L_216c0   '@21684
    GOTO L_216e8   '@216b8
L_216c0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@216c0 DS:2238
L_216e8:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e1c!)) THEN GOTO L_21721   '@216e8 DS:2238
    V_0e1c! = 0.0   '@21708 DS:2224
    GOTO L_21979   '@21719
L_21721:
    L_BP6e! = V_0e20!   '@21721
    FOR V_0e1c! = 1.0 TO L_BP6e!   '@21732 DS:2238
    RT_PSET RT_SNG!(FX##(V_0e30!) + 15.0 + (V_0eaa! - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * (FX##(V_0e20! = 2.0) / 3.0 + FX##(V_0e20! = 3.0) / 5.0) * (FX##(V_0e1c!) - 1.0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), 0, 0   '@2173a DS:2220,2250,2258,226c,227e,2282
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0 + (V_0eaa! - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + (V_0e20! = 2.0) * (FX##(V_0e1c!) + 1.0) / 3.0 + (V_0e20! = 3.0) * (FX##(V_0e1c!) + 2.0) / 5.0)) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * L_BP12! * V_0e28!), 24, V_1920%, 0   '@21816 DS:2238,2250,2258,226c,227e,2282
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@21949 DS:2238
L_21979:
    GOSUB L_22ec0   '@2197e
    GOSUB L_23fb3   '@2198b
    GOSUB L_2266b   '@21998
    RETURN   '@219a5
    ' @219af (trecho de 285 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@219b9
    V_1f2a! = 0.0   '@219e3 DS:2224
    V_1f2e! = 0.0   '@219f4 DS:2224
    L_BP72! = V_186a!   '@21a05
    FOR V_0e40! = 1.0 TO L_BP72!   '@21a16 DS:2238
    L_BP76! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)   '@21a1e
    CALL MIXT_082a_Maior(V_1f2e!, L_BP76!, L_BP7a!)   '@21a48
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) = L_BP76!   '@21a5a
    V_1f2e! = L_BP7a!   '@21a7f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@21a89 DS:2238
    L_BP7e! = V_1f2e!   '@21ab4
    FOR V_1f22! = 1.0 TO L_BP7e!   '@21ac5 DS:2238
    L_BP82! = V_186a!   '@21acc
    FOR V_0e40! = 1.0 TO L_BP82!   '@21ade DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 1) < A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0) OR A_1c06!(RT_CINT%(FX##(V_0e40!)), 0) > A_1a0c!(RT_CINT%(FX##(V_0e44!)), 1)) THEN GOTO L_21b94   '@21ae6
    GOTO L_21efc   '@21b8c
L_21b94:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> V_1f22!) THEN GOTO L_21bd1   '@21b94
    GOTO L_21efc   '@21bc9
L_21bd1:
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) + V_0e20!))), (2)) + " #" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e40!)), 2))), (2)) + " C:"   '@21bd1 DS:2286,228c
    V_1f22! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@21c78
    V_1f22! = -((V_1f22! = V_0f0a!) * 7 + ((V_1f22! = V_0f06!) * 6 + ((V_1f22! = V_0f02!) * 5 + ((V_1f22! = V_0efe!) * 4 + ((V_1f22! = V_0efa!) * 3 + ((V_1f22! = V_0ef6!) * 2 + (V_1f22! = V_0ef2!)))))))   '@21ca0
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(RT_SNG!(INT((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!) + V_0e1c!) * 2.0 + A_1c62%(RT_CINT%(FX##(V_1f22!)), 4))))), (2))   '@21d86 DS:2250
    V_1f22! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)   '@21e1f
    L_BP86! = FX##(V_0e30!) + 10.0   '@21e4a DS:2258
    L_BP8a! = FX##(V_0e34!) + 25.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28! + FX##(V_1f2a!) * 10.0   '@21e61 DS:2258,2294
    L_BP8e$ = "CGA"   '@21ea9 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP86!, L_BP8a!, V_0dfc$, L_BP8e$)   '@21eb7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @21ecf libera strings locais (L_BP8e)
    V_1f2a! = FX##(V_1f2a!) + 1.0   '@21ed9 DS:2238
    GOTO L_21f2d   '@21eef
L_21efc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@21f01 DS:2238
L_21f2d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1f22!   '@21f2d DS:2238
    RETURN   '@21f58
L_21f67:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@21f6c
    V_1f2a! = 1.0   '@21f96 DS:2238
    V_1f32! = 1.0   '@21fa7 DS:2238
    V_1f2e! = 0.0   '@21fb8 DS:2224
    L_BP92! = V_186a!   '@21fc9
    FOR V_0e40! = 1.0 TO L_BP92!   '@21fdb DS:2238
    L_BP96! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)   '@21fe2
    CALL MIXT_082a_Maior(V_1f2e!, L_BP96!, L_BP9a!)   '@2200d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) = L_BP96!   '@22021
    V_1f2e! = L_BP9a!   '@22047
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@22052 DS:2238
    L_BP1a! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@2207e DS:227a
L_220da:
    L_BP9e! = V_186a!   '@220df
    FOR V_0e40! = 1.0 TO L_BP9e!   '@220f1 DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 5) <> L_BP1a! OR A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> V_1f2a!) THEN GOTO L_22173   '@220f8
    GOTO L_225f2   '@2216b
L_22173:
    V_0dfc$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) + V_0e20!))), (2)) + " #" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e40!)), 2))), (2)) + " C:"   '@22173 DS:2286,228c,2298
    V_0e48! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@22224
    V_0e48! = -((V_0e48! = V_0f06!) * 6 + ((V_0e48! = V_0f02!) * 5 + ((V_0e48! = V_0efe!) * 4 + ((V_0e48! = V_0efa!) * 3 + ((V_0e48! = V_0ef6!) * 2 + (V_0e48! = V_0ef2!))))))   '@2224c
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(RT_SNG!(INT((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!) + V_0e1c!) * 2.0 + A_1c62%(RT_CINT%(FX##(V_0e48!)), 4))))), (2))   '@22312 DS:2250
    V_0e48! = 0.0   '@223ab DS:2224
    L_BPa2! = V_186a!   '@223bc
    FOR V_1f26! = 1.0 TO L_BPa2!   '@223ce DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_1f26!)), 6) = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) THEN GOTO L_224bd   '@223d6
    V_0e48! = (INT((FX##(A_1c06!(RT_CINT%(FX##(V_1f26!)), 1)) - A_1c06!(RT_CINT%(FX##(V_1f26!)), 0)) / A_1c06!(RT_CINT%(FX##(V_1f26!)), 3)) + 1.0) * A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) + V_0e48!   '@22425 DS:2238
L_224bd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1f26!   '@224bd DS:2238
    V_0dfc$ = RT_MID2$((STR$(V_0e48!)), (2)) + V_0dfc$   '@224e9
    IF NOT (V_0e48! = 0.0) THEN GOTO L_22540   '@2251d DS:2224
    GOTO L_22623   '@22538
L_22540:
    L_BPa6! = FX##(V_0e30!) + 10.0   '@22540 DS:2258
    L_BPaa! = FX##(V_0e34!) + 13.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28! + FX##(V_1f32!) * 10.0   '@22557 DS:2258,229e
    L_BPae$ = "CGA"   '@2259f DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BPa6!, L_BPaa!, V_0dfc$, L_BPae$)   '@225ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @225c5 libera strings locais (L_BPae)
    V_1f32! = FX##(V_1f32!) + 1.0   '@225cf DS:2238
    GOTO L_22623   '@225e5
L_225f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@225f7 DS:2238
L_22623:
    IF NOT (V_1f2a! < V_1f2e!) THEN GOTO L_2265c   '@22623
    V_1f2a! = FX##(V_1f2a!) + 1.0   '@2263e DS:2238
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_220da   '@22654
L_2265c:
    RETURN   '@2265c
L_2266b:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e44!)), 0) = 0.0) THEN GOTO L_226ae   '@22670 DS:2224
    RETURN   '@226a4
L_226ae:
    L_BPb2! = A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)   '@226ae
    FOR V_0e40! = 1.0 TO L_BPb2!   '@226d9 DS:2238
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + (FX##(V_0eaa!) + 1.0 + FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + ((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)) + 1.0) * V_0e40! + V_0ea6!) * L_BP12! * V_0e28!), RT_SNG!(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP0e! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@226e0 DS:2238,2250,2258,226c,22a2
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 1.0 - FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0) * L_BP0e! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + ((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)) + 1.0) * V_0e40! + V_0ea6!) * L_BP12! * V_0e28!), RT_SNG!(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP0e! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@227f7 DS:2220,2238,2250,2258,226c,22a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2292c DS:2238
    RETURN   '@22958
L_22967:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@2296c
    L_BP1a! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@229e6 DS:227a
    V_0e1c! = 0.0   '@22a3d DS:2224
    IF NOT (V_186a! = 0.0) THEN GOTO L_22a73   '@22a4e DS:2224
    RETURN   '@22a69
L_22a73:
    L_BPb6! = V_186a!   '@22a73
    FOR V_0e1c! = 1.0 TO L_BPb6!   '@22a85 DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e1c!)), 5) = L_BP1a!) THEN GOTO L_22ac8   '@22a8c
    GOTO L_22af1   '@22ac0
L_22ac8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@22ac8 DS:2238
L_22af1:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e1c!)) THEN GOTO L_22b2c   '@22af1 DS:2238
    V_0e1c! = 0.0   '@22b11 DS:2224
    RETURN   '@22b22
L_22b2c:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 95.0 + FX##(L_BP0e!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(95.0 - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa!) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0) * L_BP0e! * V_0e28! + V_0e30!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * L_BP12! * V_0e28!), 25, V_1920%, 0   '@22b2c DS:2238,2250,2258,227e,2282,22a6
    RT_LINE RT_SNG!(FX##(V_0e30!) + 95.0 + FX##(L_BP0e!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 13.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 100.0 + FX##(L_BP0e!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 13.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), 9, V_1920%, 0   '@22c8b DS:2264,229e,22a6
    RT_LINE RT_SNG!(FX##(V_0e30!) + 98.0 + FX##(V_0eaa!) * V_0e28! * L_BP0e!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 98.0 + FX##(L_BP0e!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 15.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), 9, V_1920%, 0   '@22d3e DS:2258,226c,22aa
    V_0e1c! = -(A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0)   '@22df1 DS:2238,2250,227e,2282
    V_0e1c! = INT(FX##(V_0e1c!))   '@22e99
    RETURN   '@22eb1
L_22ec0:   ' sub-rotina (alvo de GOSUB)
    GOSUB L_23d03   '@22ec5
    REDIM A_13fe%(-32768 TO -32768)   '@22ed2
    REDIM A_13fe%(0 TO 20)   '@22ee0
    V_0e20! = 0.0   '@22efd DS:2224
    IF NOT (V_185e! = 0.0) THEN GOTO L_22f31   '@22f0e DS:2224
    GOTO L_23351   '@22f29
L_22f31:
    L_BPba! = V_185e!   '@22f31
    FOR V_0e40! = 1.0 TO L_BPba!   '@22f43 DS:2238
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP16! OR A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP16!) THEN GOTO L_22fc1   '@22f4a
    GOTO L_2331b   '@22fb9
L_22fc1:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_23095   '@22fc1 DS:2238
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_23090   '@22fe1 DS:2220
    GOTO L_2331b   '@23088
L_23090:
L_23095:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_2316b   '@23095
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_23166   '@230b5 DS:2238
    GOTO L_2331b   '@2315e
L_23166:
L_2316b:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e40!)), 1)   '@2316b
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@23196
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1af2!(RT_CINT%(FX##(V_0e40!)), 0))   '@232b1
L_2331b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@23320 DS:2238
L_23351:
    IF NOT (2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!) * 2 <= V_0e20! OR V_1862! = 0.0) THEN GOTO L_2340d   '@23356 DS:2224
    GOTO L_23683   '@23405
L_2340d:
    L_BPbe! = V_1862!   '@2340d
    FOR V_0e40! = 1.0 TO L_BPbe!   '@2341f DS:2238
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP16! OR A_1b7c!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP16!) THEN GOTO L_2349d   '@23426
    GOTO L_2364d   '@23495
L_2349d:
    V_0e20! = A_1b7c!(RT_CINT%(FX##(V_0e40!)), 1)   '@2349d
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@234c8
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1b7c!(RT_CINT%(FX##(V_0e40!)), 0))   '@235e3
L_2364d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@23652 DS:2238
L_23683:
    FOR V_0e40! = 0.0 TO 9.0   '@23688 DS:2224,2238,22ae
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@23696
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@236dd DS:2238,22ae
    V_0e40! = 9.0   '@23706 DS:22ae
    V_1f22! = 0.0   '@23717 DS:2224
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_23752   '@23728
    RETURN   '@23748
L_23752:
L_23757:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_237a0   '@2375c
    V_0e40! = FX##(V_0e40!) - 1.0   '@23783 DS:2220
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23757   '@23799
L_237a0:
    V_1f22! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@237a0 DS:2224,2238,2250,227e,2282,22ae,22b2,22b6,22ba,22be
    L_BPc2! = 2.0   '@23913 DS:2250
    L_BPc6! = FX##(A_13fe%(10)) * 1.0   '@23924 DS:2238
    L_BPca! = 2.0 * FX##(V_1f22!) / 10.0   '@23949 DS:2250,2258
    L_BPce! = FX##(V_1f22!) / 10.0 + 2.5   '@2395f DS:2258,22c2
    CALL MIXT_082a_Maior(L_BPca!, L_BPce!, L_BPd2!)   '@23974
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPd6! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_1f22!) / 10.0 - 6.0) / L_BPd2!) + 1   '@23989 DS:2250,2258,22c6,22ca
    CALL MIXT_0877_Menor(L_BPc6!, L_BPd6!, L_BPda!)   '@239e1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPc2!, L_BPda!, L_BPde!)   '@239f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BPde!   '@23a0a
    V_1f26! = 0.0   '@23a15 DS:2224
    V_1f1e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 7.2600002288818359375## - FX##(V_0e48!) * V_1f22! / 10.0) / (FX##(V_0e48!) - 1.0)   '@23a26 DS:2220,2250,2258,22ce
    L_BPe2! = A_13fe%(10)   '@23a81
    FOR V_0e40! = 1.0 TO L_BPe2!   '@23aa6 DS:2238
    V_1f1a! = V_0eaa! + 0.62999999523162841796875## + FX##(V_1f22!) / 20.0 + (FX##(V_1f22!) / 10.0 + V_1f1e!) * (FX##(V_0e40!) - 1.0 - FX##(V_0e48!) * V_1f26!)   '@23aae DS:2220,2258,22a2,22d2
    IF NOT (V_0e40! - FX##(V_0e48!) * V_1f26! > RT_CINT%(FX##(V_0e48!) / 2.0)) THEN GOTO L_23b4a   '@23afd DS:2250
    V_1f1a! = FX##(V_1f1a!) + 6.0   '@23b34 DS:22b6
L_23b4a:
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_23bb9   '@23b4a
    V_1f1a! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 20.0   '@23b78 DS:22a2,22d6
L_23bb9:
    L_BPe6! = FX##(V_1f22!) / 10.0 + 1.5   '@23bb9 DS:2258,22da
    L_BPea! = FX##(V_1f22!) / 5.0   '@23bd5 DS:2282
    CALL MIXT_082a_Maior(L_BPe6!, L_BPea!, L_BPee!)   '@23be5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(L_BP0e!) * V_1f1a! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (V_0eaa! + 0.62999999523162841796875## + FX##(V_1f22!) / 20.0 + FX##(L_BPee!) * V_1f26!) * L_BP12! * V_0e28!), RT_SNG!(FX##(L_BP0e!) * V_1f22! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@23bfa DS:2258,226c,22a2,22d2
    IF NOT ((FX##(V_1f26!) + 1.0) * V_0e48! = FX##(V_0e40!)) THEN GOTO L_23cc8   '@23c8d DS:2238
    V_1f26! = FX##(V_1f26!) + 1.0   '@23cb2 DS:2238
L_23cc8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@23cc8 DS:2238
    RETURN   '@23cf4
L_23d03:   ' sub-rotina (alvo de GOSUB)
    L_BP16! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@23d08 DS:227e
    IF NOT (V_0ddc! > 1.0 AND (V_0de0! = 0.0 AND V_0e44! = 1.0) OR V_0de4! = 1.0 AND V_0e44! = V_0ddc!) THEN GOTO L_23e36   '@23d55 DS:2224,2238
    L_BP16! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) * 2.0 / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@23de4 DS:2250,227e
L_23e36:
    IF NOT (V_0e44! < V_0ddc! AND V_0e44! > 1.0) THEN GOTO L_23fa4   '@23e36 DS:2238
    L_BP16! = A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0) - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) >= A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) / 3.0 - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) < A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) * 2.0 / 3.0   '@23e74 DS:2220,2238,2250,227e
L_23fa4:
    RETURN   '@23fa4
L_23fb3:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@23fb8
    REDIM A_13fe%(0 TO 20)   '@23fc6
    GOSUB L_23d03   '@23fe3
    IF NOT (V_1866! = 0.0) THEN GOTO L_24013   '@23ff0 DS:2224
    GOTO L_244b9   '@2400b
L_24013:
    L_BPf2! = V_1866!   '@24013
    FOR V_0e40! = 1.0 TO L_BPf2!   '@24025 DS:2238
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP16! OR A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP16!) THEN GOTO L_240a3   '@2402c
    GOTO L_24483   '@2409b
L_240a3:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_241ba   '@240a3 DS:2238
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) - 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_241b5   '@240c3 DS:2220
    GOTO L_24483   '@241ad
L_241b5:
L_241ba:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_242d3   '@241ba
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_242ce   '@241da DS:2238
    GOTO L_24483   '@242c6
L_242ce:
L_242d3:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e40!)), 1)   '@242d3
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@242fe
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1ac4!(RT_CINT%(FX##(V_0e40!)), 0))   '@24419
L_24483:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@24488 DS:2238
L_244b9:
    FOR V_0e40! = 0.0 TO 9.0   '@244be DS:2224,2238,22ae
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@244cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@24513 DS:2238,22ae
    V_0e40! = 9.0   '@2453c DS:22ae
    V_1f22! = 0.0   '@2454d DS:2224
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_24588   '@2455e
    RETURN   '@2457e
L_24588:
L_2458d:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_245d6   '@24592
    V_0e40! = FX##(V_0e40!) - 1.0   '@245b9 DS:2220
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2458d   '@245cf
L_245d6:
    V_1f22! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@245d6 DS:2224,2238,2250,227e,2282,22ae,22b2,22b6,22ba,22be
    L_BPf6! = 2.0   '@24749 DS:2250
    L_BPfa! = FX##(A_13fe%(10)) * 1.0   '@2475a DS:2238
    L_BPfe! = 2.0 * FX##(V_1f22!) / 10.0   '@2477f DS:2250,2258
    L_BP102! = FX##(V_1f22!) / 10.0 + 2.5   '@24795 DS:2258,22c2
    CALL MIXT_082a_Maior(L_BPfe!, L_BP102!, L_BP106!)   '@247aa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP10a! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_1f22!) / 10.0) / L_BP106!) + 1   '@247bf DS:2250,2258,22c6
    CALL MIXT_0877_Menor(L_BPfa!, L_BP10a!, L_BP10e!)   '@24812
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPf6!, L_BP10e!, L_BP112!)   '@24826
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BP112!   '@2483b
    V_1f26! = 0.0   '@24846 DS:2224
    V_1f1e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_0e48!) * V_1f22! / 10.0) / (FX##(V_0e48!) - 1.0)   '@24857 DS:2220,2250,2258,22c6
    L_BP116! = A_13fe%(10)   '@248b2
    FOR V_0e40! = 1.0 TO L_BP116!   '@248d7 DS:2238
    V_1f1a! = V_0eaa! + 0.62999999523162841796875## + FX##(V_1f22!) / 20.0 + (FX##(V_1f22!) / 10.0 + V_1f1e!) * (FX##(V_0e40!) - 1.0 - FX##(V_0e48!) * V_1f26!)   '@248de DS:2220,2258,22a2,22d2
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_2499c   '@2492d
    V_1f1a! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 20.0   '@2495b DS:22a2,22d6
L_2499c:
    L_BP11a! = FX##(V_1f22!) / 10.0 + 1.5   '@2499c DS:2258,22da
    L_BP11e! = FX##(V_1f22!) / 5.0   '@249b8 DS:2282
    CALL MIXT_082a_Maior(L_BP11a!, L_BP11e!, L_BP122!)   '@249c8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(L_BP0e!) * V_1f1a! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 20.0 - FX##(L_BP122!) * V_1f26!) * L_BP12! * V_0e28!), RT_SNG!(FX##(L_BP0e!) * V_1f22! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@249dd DS:2258,226c,22a2,22d6
    IF NOT ((FX##(V_1f26!) + 1.0) * V_0e48! = FX##(V_0e40!)) THEN GOTO L_24aca   '@24a8f DS:2238
    V_1f26! = FX##(V_1f26!) + 1.0   '@24ab4 DS:2238
L_24aca:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@24aca DS:2238
    RETURN   '@24af6
L_24b05:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020150_FUN_2000_0150
    IF NOT (V_183e$ = "N") THEN GOTO L_24b29   '@24b0a DS:22de
    GOTO L_24f5f   '@24b21
L_24b29:
    RT_LINE 1, 169, 318, 169, 1, 0, 0   '@24b29
    L_BP126! = 1.0   '@24b55 DS:2238
    L_BP12a! = 181.0   '@24b67 DS:22e4
    L_BP12e$ = " Raio de"   '@24b72 DS:22e8
    L_BP132$ = "CGA"   '@24b80 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP126!, L_BP12a!, L_BP12e$, L_BP132$)   '@24b8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24ba7 libera strings locais (L_BP12e)
    ' @24bb1 libera strings locais (L_BP132)
    L_BP136! = 1.0   '@24bbb DS:2238
    L_BP13a! = 190.0   '@24bcd DS:22f4
    L_BP13e$ = "Dobramento"   '@24bd8 DS:22f8
    L_BP142$ = "CGA"   '@24be6 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP136!, L_BP13a!, L_BP13e$, L_BP142$)   '@24bf4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24c0d libera strings locais (L_BP13e)
    ' @24c17 libera strings locais (L_BP142)
    FOR V_0e14! = 5.0 TO 9.0   '@24c21 DS:2238,2282,22ae
    V_0dfc$ = "#"   '@24c2e DS:2306
    V_0dfc$ = V_0dfc$ + RT_MID2$((STR$(RT_SNG!(-(V_0e14! = 5.0) * FX##(V_0f02!) - FX##(V_0e14! = 6.0) * V_0f06! - FX##(V_0e14! = 7.0) * V_0f0a! - FX##(V_0e14! = 8.0) * V_0f0e! - FX##(V_0e14! = 9.0) * V_0f12!))), (2))   '@24c40 DS:2282,22ae,22b6,22ba,22be
    L_BP146! = FX##(V_0e14!) * 48.0 - 155.0   '@24d29 DS:230c,2310
    L_BP14a! = 181.0   '@24d45 DS:22e4
    L_BP14e$ = "CGA"   '@24d50 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP146!, L_BP14a!, V_0dfc$, L_BP14e$)   '@24d5e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24d76 libera strings locais (L_BP14e)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@24d80 DS:2238,22ae
    FOR V_0e14! = 5.0 TO 9.0   '@24dac DS:2238,2282,22ae
    V_0dfc$ = STR$(RT_CINT%((-(V_0e14! = 5.0) * INT(FX##(V_0f02!) * V_18ca!) - (V_0e14! = 6.0) * INT(FX##(V_0f06!) * V_18ca!) - (V_0e14! = 7.0) * INT(FX##(V_0f0a!) * V_18ca!) - (V_0e14! = 8.0) * INT(FX##(V_0f0e!) * V_18ca!) - (V_0e14! = 9.0) * INT(FX##(V_0f12!) * V_18ca!)) / 10.0))   '@24dba DS:2258,2282,22ae,22b6,22ba,22be
    L_BP152! = FX##(V_0e14!) * 48.0 - 155.0   '@24ed7 DS:230c,2310
    L_BP156! = 190.0   '@24ef3 DS:22f4
    L_BP15a$ = "CGA"   '@24efe DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP152!, L_BP156!, V_0dfc$, L_BP15a$)   '@24f0c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24f24 libera strings locais (L_BP15a)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@24f2e DS:2238,22ae
L_24f5f:
    L_BP15e! = 336.0   '@24f64 DS:2314
    L_BP162! = 185.0   '@24f76 DS:2318
    L_BP166$ = "VIGA " + V_0dd4$   '@24f81 DS:231c
    L_BP16a$ = "CGA"   '@24f99 DS:225c
    CALL MIXT_08c4_TextoGrafico(L_BP15e!, L_BP162!, L_BP166$, L_BP16a$)   '@24fa7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24fc0 libera strings locais (L_BP166)
    ' @24fca libera strings locais (L_BP16a)
    RT_LINE 320, 170, (LEN(V_0dd4$) * 8 + 392), 190, 17, 0, 0   '@24fd4
    RT_LINE 322, 172, (LEN(V_0dd4$) * 8 + 390), 188, 17, 0, 0   '@25010
    RT_LINE 324, 174, (LEN(V_0dd4$) * 8 + 388), 186, 17, 0, 0   '@2504c
    RETURN   '@25088
L_25097:   ' entrada vinda de 020150_FUN_2000_0150
    ' END SUB   '@25097
END SUB

SUB S_250a7   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x250a7)
    ' ---- FUN_2000_50a7 @0x250a7  (0250a7_FUN_2000_50a7.lift.txt; evidence_id (assembly): ev_d672508d1d4f7cb7a35869bddb922fb420c99c6df609ebfcdb990bea56975ded)
    BEEP   '@250af
    BEEP   '@250b9
    BEEP   '@250c3
    RT_SCREEN 0   '@250cd
    RT_VIEWPRINT 1, 25   '@250e2
    RT_CLOSE   '@250f4 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_17fe!)), RT_CINT%(4.0 * FX##(V_1802!)), RT_CINT%(4.0 * FX##(V_1802!))   '@25101 DS:22b2
    RT_CLS 0   '@25146
    LOCATE 10, 1   '@25153
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@2516e DS:2326,232a
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@2518e DS:2326,2344
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@251ae DS:2326,2370
L_251d3:
    CALL MIXT_07f1_LimpaTeclado   '@251d8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@251e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@251fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_251d3   '@25208
END SUB

SUB S_25224   ' entrada de SUB/FUNCTION (B$ENRA, locais 294 bytes) (0x25224)
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
    DIM L_BP48%
    DIM L_BP4c!
    DIM L_BP4e%
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP58%
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
    DIM L_BPd0!
    DIM L_BPd4!
    DIM L_BPd8!
    DIM L_BPdc!
    DIM L_BPe0!
    DIM L_BPe4!
    DIM L_BPe8!
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc!
    ' ---- FUN_2000_5224 @0x25224  (025224_FUN_2000_5224.lift.txt; evidence_id (assembly): ev_db71c17beeec95ea2c86be8fa9b63a312f5a0c5ee800ffc3d29a24cc24139585)
    GOSUB L_25260   '@2522c
    GOSUB L_27791   '@25239
    GOSUB L_2bb0a   '@25246
    GOTO L_2ea73   '@25253
    ' ---- F_2525b @0x2525b  (02525b_F_2525b.lift.txt; evidence_id (assembly): ev_ae8fc64c88674575836bcdb3c2681fef5b7192347cf36911a4d8a0f5ce5528c6)
L_25260:   ' sub-rotina (alvo de GOSUB); entrada vinda de 025224_FUN_2000_5224
    V_1f12$ = "FORMAFE"   '@25265 DS:2396
    IF NOT (V_185e! = 0.0) THEN GOTO L_252a4   '@25281 DS:2224
    GOTO L_2561e   '@2529c
L_252a4:
    L_BP0e! = V_185e!   '@252a4
    FOR V_0e14! = 1.0 TO L_BP0e!   '@252b5 DS:2238
    V_0dfc$ = "N"   '@252bc DS:22de
    V_0f7e! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@252ce
    V_0f82! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@252f6
    GOSUB L_273d0   '@25321
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_25432   '@2532e DS:2224
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25362 DS:2258
    V_1f7a! = V_1f62! - (FX##(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)) + V_1f4e!) * 10.0 + V_1f42!   '@2538f DS:2258
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@253d0 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@253fd DS:2258
    GOSUB L_2e45f   '@25420
L_25432:
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25432 DS:2258
    V_1f7a! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@2545f DS:2258
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25482 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@254b2 DS:2258
    GOSUB L_2e45f   '@254d5
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_255ee   '@254e2 DS:2224
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25517 DS:2258
    V_1f7a! = V_1f62! - (FX##(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)) + V_1f4e!) * 10.0 + V_1f42!   '@25547 DS:2258
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25589 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@255b9 DS:2258
    GOSUB L_2e45f   '@255dc
L_255ee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@255ee DS:2238
L_2561e:
    IF NOT (V_1872! = 0.0) THEN GOTO L_25646   '@25623 DS:2224
    GOTO L_2589b   '@2563e
L_25646:
    L_BP12! = V_1872!   '@25646
    FOR V_0e14! = 1.0 TO L_BP12!   '@25657 DS:2238
    V_0dfc$ = "GN"   '@2565e DS:23a2
    V_0f7e! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)   '@25670
    V_0f82! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)   '@25698
    GOSUB L_273d0   '@256c3
    V_1f36! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0 + 1.0) / A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))   '@256d0 DS:2238,2250,2282
    V_0e28! = 4.0   '@25742 DS:22b2
L_25758:
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25758 DS:2258
    V_1f7a! = V_1f62! - (FX##(V_1f4e!) + V_0e28!) * 10.0 + V_1f42!   '@25785 DS:2258
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@257ad DS:2258
    V_1f82! = V_1f62! - (FX##(V_1f4e!) + V_0e28!) * 10.0 + V_1f42!   '@257dd DS:2258
    GOSUB L_2e45f   '@25805
    V_0e28! = FX##(V_0e28!) + 4.0   '@25812 DS:22b2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT ((FX##(V_0e28!) / 4.0 - 1.0) * V_1f36! >= FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 0))) THEN GOTO L_25758   '@25828 DS:2220,22b2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@2586b DS:2238
L_2589b:
    IF NOT (V_1866! = 0.0) THEN GOTO L_258c3   '@258a0 DS:2224
    GOTO L_25c3e   '@258bb
L_258c3:
    L_BP16! = V_1866!   '@258c3
    FOR V_0e14! = 1.0 TO L_BP16!   '@258d4 DS:2238
    V_0dfc$ = "P"   '@258dc DS:23a8
    V_0f7e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@258ee
    V_0f82! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@25916
    GOSUB L_273d0   '@25941
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_25a52   '@2594e DS:2224
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25982 DS:2258
    V_1f7a! = V_1f62! - (FX##(V_1f4e!) - A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0 + V_1f42!   '@259af DS:2258
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@259f0 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@25a1d DS:2258
    GOSUB L_2e45f   '@25a40
L_25a52:
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25a52 DS:2258
    V_1f7a! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@25a7f DS:2258
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25aa2 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@25ad2 DS:2258
    GOSUB L_2e45f   '@25af5
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_25c0e   '@25b02 DS:2224
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25b37 DS:2258
    V_1f7a! = V_1f62! - (FX##(V_1f4e!) - A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0 + V_1f42!   '@25b67 DS:2258
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25ba9 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 + V_1f42!   '@25bd9 DS:2258
    GOSUB L_2e45f   '@25bfc
L_25c0e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@25c0e DS:2238
L_25c3e:
    IF NOT (V_1876! = 0.0) THEN GOTO L_25c66   '@25c43 DS:2224
    GOTO L_25ebb   '@25c5e
L_25c66:
    L_BP1a! = V_1876!   '@25c66
    FOR V_0e14! = 1.0 TO L_BP1a!   '@25c77 DS:2238
    V_0dfc$ = "GP"   '@25c7e DS:23ae
    V_0f7e! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)   '@25c90
    V_0f82! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)   '@25cb8
    GOSUB L_273d0   '@25ce3
    V_1f36! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0 + 1.0) / A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))   '@25cf0 DS:2238,2250,2282
    V_0e28! = 4.0   '@25d62 DS:22b2
L_25d78:
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25d78 DS:2258
    V_1f7a! = V_1f62! - (FX##(V_1f4e!) - V_0e28!) * 10.0 + V_1f42!   '@25da5 DS:2258
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25dcd DS:2258
    V_1f82! = V_1f62! - (FX##(V_1f4e!) - V_0e28!) * 10.0 + V_1f42!   '@25dfd DS:2258
    GOSUB L_2e45f   '@25e25
    V_0e28! = FX##(V_0e28!) + 4.0   '@25e32 DS:22b2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT ((FX##(V_0e28!) / 4.0 - 1.0) * V_1f36! >= FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 0))) THEN GOTO L_25d78   '@25e48 DS:2220,22b2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@25e8b DS:2238
L_25ebb:
    IF NOT (V_1862! = 0.0) THEN GOTO L_25ee3   '@25ec0 DS:2224
    GOTO L_26058   '@25edb
L_25ee3:
    L_BP1e! = V_1862!   '@25ee3
    FOR V_0e14! = 1.0 TO L_BP1e!   '@25ef4 DS:2238
    V_0f7e! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)   '@25efc
    V_0f82! = A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)   '@25f24
    V_0dfc$ = "GN"   '@25f4f DS:23a2
    GOSUB L_273d0   '@25f61
    V_1f76! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@25f6e DS:2258
    V_1f7a! = V_1f62! - FX##(V_1f4e!) * 10.0 - 20.0 + V_1f42!   '@25f9b DS:2258,23b4
    V_1f7e! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@25fc3 DS:2258
    V_1f82! = V_1f62! - FX##(V_1f4e!) * 10.0 - 20.0 + V_1f42!   '@25ff3 DS:2258,23b4
    GOSUB L_2e45f   '@2601b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@26028 DS:2238
L_26058:
    IF NOT (V_186e! = 0.0) THEN GOTO L_26080   '@2605d DS:2224
    GOTO L_2630f   '@26078
L_26080:
    L_BP22! = FX##(V_0ddc!) + V_0de4!   '@26080
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP22!   '@26096 DS:2238
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_260de   '@260a2 DS:2224
    GOTO L_262da   '@260d6
L_260de:
    L_BP26! = A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)   '@260de
    FOR V_0e28! = 1.0 TO L_BP26!   '@26108 DS:2238
    V_1f76! = FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@26110 DS:2258
    V_1f7a! = V_1f62! - (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28!) * 10.0 + V_1f42!   '@2613d DS:2238,2250,2258
    V_1f7e! = FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@261d5 DS:2258
    V_1f82! = V_1f62! - (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28!) * 10.0 + V_1f42!   '@26205 DS:2238,2250,2258
    GOSUB L_2e45f   '@2629d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@262aa DS:2238
L_262da:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@262df DS:2238
L_2630f:
    IF NOT (V_185e! = 0.0) THEN GOTO L_26337   '@26314 DS:2224
    GOTO L_26c57   '@2632f
L_26337:
    L_BP2a! = V_0ddc!   '@26337
    FOR V_0e14! = 0.0 TO L_BP2a!   '@26348 DS:2224,2238
    REDIM A_13fe%(-32768 TO -32768)   '@26350
    REDIM A_13fe%(0 TO 20)   '@2635e
    L_BP2e! = V_185e!   '@2637b
    FOR V_0e28! = 1.0 TO L_BP2e!   '@2638c DS:2238
    IF NOT (V_0de0! = 0.0 AND V_0e14! = 0.0) THEN GOTO L_2641e   '@26394 DS:2224
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) < A_1a0c!(1, 0)) THEN GOTO L_2641e   '@263d2
    GOTO L_26583   '@26416
L_2641e:
    IF NOT (V_0de4! = 0.0 AND V_0e14! = V_0ddc!) THEN GOTO L_264b3   '@2641e DS:2224
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) THEN GOTO L_264b3   '@2645c
    GOTO L_26583   '@264ab
L_264b3:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0) OR A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) THEN GOTO L_2657e   '@264b3
    GOTO L_26738   '@26576
L_2657e:
L_26583:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@26588
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@265b3
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1af2!(RT_CINT%(FX##(V_0e28!)), 0))   '@266ce
L_26738:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2673d DS:2238
    V_1f8e$ = ""   '@26768 DS:2326
    FOR V_0e28! = 9.0 TO 0.0 STEP -1.0   '@2677a DS:2220,2224,22ae
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e28!))) > 0) THEN GOTO L_269c6   '@26788
    V_1f8e$ = V_1f8e$ + RT_MID2$((STR$(A_13fe%(RT_CINT%(FX##(V_0e28!)))) + "#"), (2))   '@267af DS:2306
    V_0e30! = -(V_0e28! = 0.0) * FX##(V_0eee!) - FX##(V_0e28! = 1.0) * V_0ef2! - FX##(V_0e28! = 2.0) * V_0ef6! - FX##(V_0e28! = 3.0) * V_0efa! - FX##(V_0e28! = 4.0) * V_0efe!   '@267ff DS:2224,2238,2250,227e,22b2
    V_0e30! = V_0e30! - FX##(V_0e28! = 5.0) * V_0f02! - FX##(V_0e28! = 6.0) * V_0f06! - FX##(V_0e28! = 7.0) * V_0f0a! - FX##(V_0e28! = 8.0) * V_0f0e! - FX##(V_0e28! = 9.0) * V_0f12!   '@268be DS:2282,22ae,22b6,22ba,22be
    V_1f8e$ = V_1f8e$ + RT_MID2$((STR$(V_0e30!)), (2)) + "+"   '@26983 DS:23b8
L_269c6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@269c6 DS:2220,2224
    IF NOT (LEN(V_1f8e$) > 0) THEN GOTO L_26c27   '@269f2
    V_1f8e$ = RT_MID$((V_1f8e$), (1), (LEN(V_1f8e$) - 1))   '@26a07
    V_1f5e! = 0.89999997615814208984375## * V_1f5e!   '@26a2e DS:23be
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) * 10.0 + V_1f5e! + (V_0de4! = 0.0 AND V_0e14! = V_0ddc!) * (FX##(A_1926!(RT_CINT%(FX##(V_0ddc!)), 0)) * 10.0 + FX##(LEN(V_1f8e$)) * V_1f5e! + 2.0 * FX##(V_1f5e!))   '@26a44 DS:2224,2238,2250,2258
    IF NOT (FX##(V_1f86!) / 10.0 < (FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) / 2.0 AND (V_0de4! = 0.0 AND V_0e14! = V_0ddc!)) THEN GOTO L_26bd2   '@26b00 DS:2224,2250,2258
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) * 10.0 - V_1f5e!   '@26b9d DS:2258
L_26bd2:
    V_1f8a! = FX##(V_1f62!) - V_1f66! - 250.0 + V_1f42! + FX##(V_1f5e!) / 2.0   '@26bd2 DS:2250,23c2
    GOSUB L_2e734   '@26bff
    V_1f5e! = V_1f5e! / 0.89999997615814208984375##   '@26c0c DS:23be
L_26c27:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@26c27 DS:2238
L_26c57:
    IF NOT (V_1866! = 0.0) THEN GOTO L_26c81   '@26c5c DS:2224
    RETURN   '@26c77
L_26c81:
    L_BP32! = FX##(V_0ddc!) + V_0de4!   '@26c81
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP32!   '@26c97 DS:2238
    REDIM A_13fe%(-32768 TO -32768)   '@26ca4
    REDIM A_13fe%(0 TO 20)   '@26cb2
    L_BP36! = V_1866!   '@26ccf
    FOR V_0e28! = 1.0 TO L_BP36!   '@26ce0 DS:2238
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)) < FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) * 3.0 / 5.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)) > FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) * 2.0 / 5.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) THEN GOTO L_26de5   '@26ce8 DS:2250,227e,2282
    GOTO L_26f95   '@26ddd
L_26de5:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@26de5
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@26e10
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0))   '@26f2b
L_26f95:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@26f9a DS:2238
    V_1f8e$ = ""   '@26fc5 DS:2326
    FOR V_0e28! = 9.0 TO 0.0 STEP -1.0   '@26fd7 DS:2220,2224,22ae
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e28!))) > 0) THEN GOTO L_27222   '@26fe4
    V_1f8e$ = V_1f8e$ + RT_MID2$((STR$(A_13fe%(RT_CINT%(FX##(V_0e28!)))) + "#"), (2))   '@2700b DS:2306
    V_1f86! = -(V_0e28! = 0.0) * FX##(V_0eee!) - FX##(V_0e28! = 1.0) * V_0ef2! - FX##(V_0e28! = 2.0) * V_0ef6! - FX##(V_0e28! = 3.0) * V_0efa! - FX##(V_0e28! = 4.0) * V_0efe!   '@2705b DS:2224,2238,2250,227e,22b2
    V_1f86! = V_1f86! - FX##(V_0e28! = 5.0) * V_0f02! - FX##(V_0e28! = 6.0) * V_0f06! - FX##(V_0e28! = 7.0) * V_0f0a! - FX##(V_0e28! = 8.0) * V_0f0e! - FX##(V_0e28! = 9.0) * V_0f12!   '@2711a DS:2282,22ae,22b6,22ba,22be
    V_1f8e$ = V_1f8e$ + RT_MID2$((STR$(V_1f86!)), (2)) + "+"   '@271df DS:23b8
L_27222:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@27222 DS:2220,2224
    IF NOT (LEN(V_1f8e$) > 0) THEN GOTO L_27396   '@2724e
    V_1f8e$ = RT_MID$((V_1f8e$), (1), (LEN(V_1f8e$) - 1))   '@27263
    V_1f5e! = 0.89999997615814208984375## * V_1f5e!   '@2728a DS:23be
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5e! / 2.0   '@272a0 DS:2250,2282
    V_1f8a! = V_1f62! - 1.5 * FX##(V_1f5e!) - (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0 + V_1f42!   '@27309 DS:2258,22da
    GOSUB L_2e734   '@2736e
    V_1f5e! = V_1f5e! / 0.89999997615814208984375##   '@2737b DS:23be
L_27396:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@27396 DS:2238
    RETURN   '@273c1
L_273d0:   ' sub-rotina (alvo de GOSUB)
    V_1f4e! = 0.0   '@273d5 DS:2224
    L_BP3a! = FX##(V_0ddc!) + V_0de4!   '@273e6
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP3a!   '@273fc DS:2238
    L_BP3e! = 1.0 * FX##(V_1f4e!)   '@27408 DS:2238
    L_BP42! = A_19b0!(RT_CINT%(FX##(V_0e28!)))   '@2741e
    CALL MIXT_0877_Menor(L_BP3e!, L_BP42!, L_BP46!)   '@2743e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e28!))) = L_BP42!   '@27450
    V_1f4e! = L_BP46!   '@27471
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2747b DS:2238
    L_BP48% = (V_0dfc$ = "P")   '@274a6 DS:23a8
    IF NOT ((V_0dfc$ = "GP" OR L_BP48%) <> 0) THEN GOTO L_274f1   '@274cb DS:23ae
    V_1f4e! = 5000.0   '@274e0 DS:23c6
L_274f1:
    L_BP4c! = FX##(V_0ddc!) + V_0de4!   '@274f1
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP4c!   '@27507 DS:2238
    L_BP4e% = (V_0dfc$ = "N")   '@27514 DS:22de
    IF NOT ((A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) < V_0f82! AND (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > V_0f7e! AND (V_0dfc$ = "GN" OR L_BP4e%))) <> 0) THEN GOTO L_27626   '@27539 DS:23a2
    L_BP52! = FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + V_0ea6!   '@275bb
    CALL MIXT_082a_Maior(V_1f4e!, L_BP52!, L_BP56!)   '@275e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f4e! = L_BP56!   '@275f8
    IF NOT (V_0dfc$ = "GN") THEN GOTO L_27621   '@27602 DS:23a2
    GOTO L_27782   '@27619
L_27621:
L_27626:
    L_BP58% = (V_0dfc$ = "P")   '@27626 DS:23a8
    IF NOT ((A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) < V_0f82! AND (A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > V_0f7e! AND (V_0dfc$ = "GP" OR L_BP58%))) <> 0) THEN GOTO L_27757   '@2764b DS:23ae
    L_BP5c! = FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0ea6! + A_19b0!(RT_CINT%(FX##(V_0e28!)))   '@276cd
    CALL MIXT_0877_Menor(V_1f4e!, L_BP5c!, L_BP60!)   '@27717
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f4e! = L_BP60!   '@27729
    IF NOT (V_0dfc$ = "GP") THEN GOTO L_27752   '@27733 DS:23ae
    GOTO L_27782   '@2774a
L_27752:
L_27757:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@27757 DS:2238
L_27782:
    RETURN   '@27782
L_27791:   ' sub-rotina (alvo de GOSUB); entrada vinda de 025224_FUN_2000_5224
    V_1f4e! = 65.0   '@27796 DS:2234
    V_1f72! = V_1f4a!   '@277a7
    V_0ee6! = V_1f6e!   '@277b8
    V_1f6a! = V_1f72!   '@277c9
    L_BP64! = FX##(V_0ddc!) + V_0de4!   '@277da
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP64!   '@277f0 DS:2238
    V_0e28! = 1.0 - FX##(V_0de0!)   '@277fc DS:2238
L_27817:
    IF NOT (V_0e28! < V_0e14! AND (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) = A_1232!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1232!(RT_CINT%(FX##(V_0e14!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0))) THEN GOTO L_278e5   '@2781c
    GOTO L_27953   '@278dd
L_278e5:
    IF NOT (V_0e28! < V_0e14!) THEN GOTO L_2791e   '@278e5
    V_0e28! = FX##(V_0e28!) + 1.0   '@27900 DS:2238
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_27817   '@27916
L_2791e:
    GOSUB L_27992   '@2791e
    GOSUB L_2810b   '@2792b
    V_1f4e! = FX##(V_1f4e!) + 1.0   '@27938 DS:2238
L_27953:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@27958 DS:2238
    RETURN   '@27983
L_27992:   ' sub-rotina (alvo de GOSUB)
    V_0e44! = V_0e14!   '@27997
    V_1f12$ = "FORMA"   '@279a8 DS:23ca
    L_BP68! = V_0ddc!   '@279ba
    FOR V_0e28! = 1.0 TO L_BP68!   '@279cb DS:2238
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e44!)), 1) = A_1232!(RT_CINT%(FX##(V_0e28!)), 1) AND (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) = A_1232!(RT_CINT%(FX##(V_0e28!)), 0) AND A_128e!(RT_CINT%(FX##(V_0e28!)), 4) > A_128e!(RT_CINT%(FX##(V_0e44!)), 4))) THEN GOTO L_27ada   '@279d2
    V_0e44! = V_0e28!   '@27ac9
L_27ada:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@27ada DS:2238
    V_0f82! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@27b05 DS:227e
    IF NOT (V_0ddc! > 1.0 AND (V_0de0! = 0.0 AND V_0e44! = 1.0) OR V_0de4! = 1.0 AND V_0e44! = V_0ddc!) THEN GOTO L_27c35   '@27b53 DS:2224,2238
    V_0f82! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) * 2.0 / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@27be2 DS:2250,227e
L_27c35:
    IF NOT (V_0e44! < V_0ddc! AND V_0e44! > 1.0) THEN GOTO L_27da4   '@27c35 DS:2238
    V_0f82! = A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0) - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) >= A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) / 3.0 - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) < A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) * 2.0 / 3.0   '@27c73 DS:2220,2238,2250,227e
L_27da4:
    V_1f76! = FX##(V_0f82!) * 10.0   '@27da4 DS:2258
    V_1f7a! = V_1f42! - 0.4000000059604644775390625## * V_1f5a!   '@27dba DS:23d4
    V_1f7e! = FX##(V_0f82!) * 10.0   '@27dd8 DS:2258
    V_1f82! = FX##(V_1f62!) - V_1f66! + V_1f42! + V_1f5a!   '@27dee
    GOSUB L_2e45f   '@27e0e
    V_1f7e! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 2.0   '@27e1b DS:2250,2258
    V_1f82! = V_1f42!   '@27e3e
    GOSUB L_2e45f   '@27e4f
    V_1f76! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 2.0   '@27e5c DS:2250,2258
    V_1f7a! = V_1f42!   '@27e7f
    V_1f7e! = FX##(V_0f82!) * 10.0   '@27e90 DS:2258
    V_1f82! = 0.4000000059604644775390625## * V_1f5a! + V_1f42!   '@27ea6 DS:23d4
    GOSUB L_2e45f   '@27ec1
    V_1f76! = FX##(V_0f82!) * 10.0   '@27ece DS:2258
    V_1f7a! = FX##(V_1f62!) - V_1f66! + V_1f42! + V_1f5a!   '@27ee4
    V_1f7e! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 2.0   '@27f04 DS:2250,2258
    V_1f82! = FX##(V_1f62!) - V_1f66! + V_1f42! + 0.60000002384185791015625## * V_1f5a!   '@27f27 DS:23d8
    GOSUB L_2e45f   '@27f4f
    V_1f76! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 2.0   '@27f5c DS:2250,2258
    V_1f7a! = FX##(V_1f62!) - V_1f66! + V_1f42! + 0.60000002384185791015625## * V_1f5a!   '@27f7f DS:23d8
    V_1f7e! = FX##(V_0f82!) * 10.0   '@27fa7 DS:2258
    V_1f82! = FX##(V_1f62!) - V_1f66! + V_1f42! + 0.20000000298023223876953125## * V_1f5a!   '@27fbd DS:23dc
    GOSUB L_2e45f   '@27fe5
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@27ff2 DS:23e0
    V_1f86! = FX##(V_0f82!) * 10.0 + FX##(V_1f5a!) / 3.0   '@28008 DS:2258,227e
    V_1f8a! = FX##(V_1f62!) - V_1f66! + V_1f42!   '@2802b
    V_1f8e$ = CHR$(RT_CINT%(FX##(V_1f4e!)))   '@28046
    GOSUB L_2e734   '@28065
    IF NOT (V_1f72! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0 - 2.599999904632568359375## * V_1f5a! < FX##(V_1f3a!)) THEN GOTO L_280eb   '@28072 DS:22a2,23e4
    V_0ee6! = V_1f6e!   '@280c1
    V_1f6a! = V_1f4a!   '@280d2
    GOTO L_280fc   '@280e3
L_280eb:
    V_1f6a! = V_1f72!   '@280eb
L_280fc:
    RETURN   '@280fc
L_2810b:   ' sub-rotina (alvo de GOSUB)
    V_1f5e! = V_1f5a! * 0.800000011920928955078125##   '@28110 DS:23e0
    V_1f12$ = "TEXTO"   '@28126 DS:23e8
    V_1f86! = 2.0 * FX##(V_1f5a!) + V_0ee6!   '@28138 DS:2250
    V_1f8a! = V_1f5a! * 1.2000000476837158203125## + V_1f6a!   '@28153 DS:23f2
    V_1f8e$ = "CORTE " + CHR$(RT_CINT%(FX##(V_1f4e!)))   '@2816e DS:2270
    GOSUB L_2e734   '@28197
    GOSUB L_28bda   '@281a4
    GOSUB L_295b5   '@281b1
    GOSUB L_29cde   '@281be
    GOSUB L_2b7ac   '@281cb
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@281d8
    V_1f2a! = 1.0   '@28202 DS:2238
    V_1f32! = 1.0   '@28213 DS:2238
    V_1f2e! = 0.0   '@28224 DS:2224
    V_1f12$ = "TEXTO"   '@28235 DS:23e8
    L_BP6c! = V_186a!   '@28247
    FOR V_0e40! = 1.0 TO L_BP6c!   '@28258 DS:2238
    L_BP70! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)   '@28260
    CALL MIXT_082a_Maior(V_1f2e!, L_BP70!, L_BP74!)   '@2828a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) = L_BP70!   '@2829c
    V_1f2e! = L_BP74!   '@282c1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@282cb DS:2238
L_282fb:
    L_BP78! = V_186a!   '@28300
    FOR V_0e40! = 1.0 TO L_BP78!   '@28311 DS:2238
    V_0e48! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@28318 DS:227a
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 5) <> V_0e48! OR A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> V_1f2a!) THEN GOTO L_283ec   '@28370
    GOTO L_2894b   '@283e4
L_283ec:
    V_0e48! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@283ec
    V_0e48! = -((V_0e48! = V_0f06!) * 6 + ((V_0e48! = V_0f02!) * 5 + ((V_0e48! = V_0efe!) * 4 + ((V_0e48! = V_0efa!) * 3 + ((V_0e48! = V_0ef6!) * 2 + (V_0e48! = V_0ef2!))))))   '@28414
    V_1f8e$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) + V_0e20!))), (2)) + " #" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e40!)), 2))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!) + V_0e1c!) * 2.0 + A_1c62%(RT_CINT%(FX##(V_0e48!)), 4))))), (2))   '@284da DS:2250,2286,228c,2298
    V_0e48! = 0.0   '@28612 DS:2224
    L_BP7c! = V_186a!   '@28623
    FOR V_1f26! = 1.0 TO L_BP7c!   '@28634 DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_1f26!)), 6) = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) THEN GOTO L_28723   '@2863c
    V_0e48! = (INT((FX##(A_1c06!(RT_CINT%(FX##(V_1f26!)), 1)) - A_1c06!(RT_CINT%(FX##(V_1f26!)), 0)) / A_1c06!(RT_CINT%(FX##(V_1f26!)), 3)) + 1.0) * A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) + V_0e48!   '@2868b DS:2238
L_28723:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1f26!   '@28723 DS:2238
    IF NOT (V_0e48! = 0.0) THEN GOTO L_28771   '@2874e DS:2224
    GOTO L_2894b   '@28769
L_28771:
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@28771 DS:23e0
    V_1f8e$ = RT_MID2$((STR$(V_0e48!)), (2)) + V_1f8e$   '@28787
    V_0f7e! = V_1f6e! - 2.0 * FX##(V_1f5a!) - FX##(LEN(V_1f8e$)) * V_1f5e!   '@287bb DS:2250
    IF NOT (V_0f7e! < V_0ee6!) THEN GOTO L_2881b   '@287ef
    V_0f7e! = V_0ee6!   '@2880a
L_2881b:
    L_BP80! = FX##(LEN(V_1f8e$)) * V_1f5e! + V_0ee6! + 2.0 * FX##(V_1f5a!)   '@2881b DS:2250
    CALL MIXT_082a_Maior(V_1f6e!, L_BP80!, L_BP84!)   '@2884b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f6e! = L_BP84!   '@2885e
    V_1f86! = V_0f7e!   '@28869
    V_1f8a! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0 - FX##(V_1f32!) * V_1f5a! * 1.2999999523162841796875##   '@2887a DS:22a2,23f6
    GOSUB L_2e734   '@288c4
    V_1f32! = FX##(V_1f32!) + 1.0   '@288d1 DS:2238
    V_1f72! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0 - FX##(V_1f32!) * V_1f5a! * 1.2999999523162841796875## - 2.0 * FX##(V_1f5a!)   '@288e7 DS:2250,22a2,23f6
    GOTO L_2897b   '@2893e
L_2894b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@28950 DS:2238
L_2897b:
    IF NOT (V_1f2a! < V_1f2e!) THEN GOTO L_289b4   '@2897b
    V_1f2a! = FX##(V_1f2a!) + 1.0   '@28996 DS:2238
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_282fb   '@289ac
L_289b4:
    IF NOT (V_186a! = 0.0) THEN GOTO L_28a72   '@289b4 DS:2224
    L_BP88! = 15.0 * FX##(V_1f5e!) + V_0ee6! + 2.0 * FX##(V_1f5a!)   '@289cf DS:2250,226c
    CALL MIXT_082a_Maior(V_1f6e!, L_BP88!, L_BP8c!)   '@289f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f6e! = L_BP8c!   '@28a0b
    V_1f72! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0 - FX##(V_1f32!) * V_1f5a! * 1.2999999523162841796875## - 2.0 * FX##(V_1f5a!)   '@28a16 DS:2250,22a2,23f6
L_28a72:
    V_1f5e! = 0.60000002384185791015625## * V_1f5a!   '@28a72 DS:23d8
    V_1f8e$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@28a88
    V_1f86! = FX##(V_0ee6!) + 200.0   '@28acb DS:23fa
    V_1f8a! = 0.20999999344348907470703125## * V_1f5e! + V_1f6a!   '@28ae1 DS:23fe
    GOSUB L_2e734   '@28afc
    V_1f8e$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@28b09
    V_1f86! = 200.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5e!) / 2.0 + V_0ee6!   '@28b4d DS:2250,23fa
    V_1f8a! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 10.0   '@28b86 DS:2258
    GOSUB L_2e734   '@28bbe
    RETURN   '@28bcb
L_28bda:   ' sub-rotina (alvo de GOSUB)
    V_1f12$ = "FORMA"   '@28bdf DS:23ca
    V_1f76! = FX##(V_0ee6!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) > 0 OR A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) = 0) * 200   '@28bf1
    V_1f7a! = V_1f6a!   '@28c5e
    V_1f7e! = FX##(V_0ee6!) + 200.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0 - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) > 0 AND A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) = 0) * 200)   '@28c6f DS:22a2,23fa
    V_1f82! = V_1f6a!   '@28d05
    GOSUB L_2e45f   '@28d16
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) > 0) THEN GOTO L_28e81   '@28d23
    V_1f76! = FX##(V_0ee6!) + 200.0   '@28d4d DS:23fa
    V_1f7a! = V_1f6a!   '@28d63
    V_1f7e! = FX##(V_0ee6!) + 200.0   '@28d74 DS:23fa
    V_1f82! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) * 20   '@28d8a
    GOSUB L_2e45f   '@28dc5
    V_1f76! = V_0ee6!   '@28dd2
    V_1f7a! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) * 20   '@28de3
    V_1f7e! = FX##(V_0ee6!) + 200.0   '@28e1e DS:23fa
    V_1f82! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) * 20   '@28e34
    GOSUB L_2e45f   '@28e6f
L_28e81:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) > 0) THEN GOTO L_29074   '@28e81
    V_1f76! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@28ea9 DS:22a2,23fa
    V_1f7a! = V_1f6a!   '@28ee5
    V_1f7e! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@28ef6 DS:22a2,23fa
    V_1f82! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) * 20   '@28f32
    GOSUB L_2e45f   '@28f6b
    V_1f76! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@28f78 DS:22a2,23fa
    V_1f7a! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) * 20   '@28fb4
    V_1f7e! = FX##(V_0ee6!) + 400.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@28fed DS:22a2,2402
    V_1f82! = FX##(V_1f6a!) - A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) * 20   '@29029
    GOSUB L_2e45f   '@29062
L_29074:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) > 0) THEN GOTO L_2918e   '@29074
    V_1f76! = V_0ee6!   '@2909f
    V_1f7a! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * 20   '@290b0
    V_1f7e! = FX##(V_0ee6!) + 200.0   '@2910b DS:23fa
    V_1f82! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * 20   '@29121
    GOSUB L_2e45f   '@2917c
L_2918e:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) > 0) THEN GOTO L_292f5   '@2918e
    V_1f76! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@291b9 DS:22a2,23fa
    V_1f7a! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * 20   '@291f5
    V_1f7e! = FX##(V_0ee6!) + 400.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@2924e DS:22a2,2402
    V_1f82! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * 20   '@2928a
    GOSUB L_2e45f   '@292e3
L_292f5:
    V_1f76! = FX##(V_0ee6!) + 200.0   '@292f5 DS:23fa
    V_1f7a! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * 20   '@2930b
    V_1f7e! = FX##(V_0ee6!) + 200.0   '@29366 DS:23fa
    V_1f82! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0   '@2937c DS:22a2
    GOSUB L_2e45f   '@293b4
    V_1f76! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@293c1 DS:22a2,23fa
    V_1f7a! = FX##(V_1f6a!) - (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * 20   '@293fd
    V_1f7e! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@29456 DS:22a2,23fa
    V_1f82! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0   '@29492 DS:22a2
    GOSUB L_2e45f   '@294ca
    V_1f76! = FX##(V_0ee6!) + 200.0   '@294d7 DS:23fa
    V_1f7a! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0   '@294ed DS:22a2
    V_1f7e! = FX##(V_0ee6!) + 200.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0   '@29525 DS:22a2,23fa
    V_1f82! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 20.0   '@29561 DS:22a2
    GOSUB L_2e45f   '@29599
    RETURN   '@295a6
L_295b5:   ' sub-rotina (alvo de GOSUB)
    V_1f12$ = "FORMAFE"   '@295ba DS:2396
    V_0e20! = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@295cc
    V_0f7e! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@29646 DS:227a
    V_0e1c! = INT(-(A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0))   '@2969e DS:2238,2250,227e,2282
    L_BP90! = V_186a!   '@2974d
    FOR V_0e48! = 1.0 TO L_BP90!   '@2975f DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e48!)), 5) = V_0f7e!) THEN GOTO L_297a3   '@29766
    GOTO L_297cc   '@2979b
L_297a3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@297a3 DS:2238
L_297cc:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e48!)) THEN GOTO L_297f6   '@297cc DS:2238
    RETURN   '@297ec
L_297f6:
    L_BP94! = V_0e20!   '@297f6
    FOR V_0e48! = 1.0 TO L_BP94!   '@29808 DS:2238
    V_0f7e! = FX##(V_0ee6!) + 200.0 + (FX##(V_0eaa!) * 20.0 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * (FX##(V_0e20! = 2.0) / 3.0 + FX##(V_0e20! = 3.0) / 5.0) * (FX##(V_0e48!) - 1.0) * 20.0)   '@29810 DS:2220,2250,227e,2282,22a2,23fa
    GOSUB L_29903   '@298bb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@298c8 DS:2238
    RETURN   '@298f4
L_29903:   ' sub-rotina (alvo de GOSUB)
    V_1f76! = V_0f7e!   '@29908
    V_1f7a! = V_1f6a! - FX##(V_0eaa!) * 20.0   '@29919 DS:22a2
    V_1f7e! = FX##(V_0e1c!) * 20.0 + V_0f7e!   '@29937 DS:22a2
    V_1f82! = V_1f6a! - FX##(V_0eaa!) * 20.0   '@29952 DS:22a2
    GOSUB L_2e45f   '@29970
    V_1f76! = V_0f7e!   '@2997d
    V_1f7a! = V_1f6a! - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * 20.0   '@2998e DS:22a2
    V_1f7e! = FX##(V_0e1c!) * 20.0 + V_0f7e!   '@299cb DS:22a2
    V_1f82! = V_1f6a! - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * 20.0   '@299e6 DS:22a2
    GOSUB L_2e45f   '@29a23
    V_1f76! = V_0f7e!   '@29a30
    V_1f7a! = V_1f6a! - FX##(V_0eaa!) * 20.0   '@29a41 DS:22a2
    V_1f7e! = V_0f7e!   '@29a5f
    V_1f82! = V_1f6a! - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * 20.0   '@29a70 DS:22a2
    GOSUB L_2e45f   '@29aad
    V_1f76! = FX##(V_0e1c!) * 20.0 + V_0f7e!   '@29aba DS:22a2
    V_1f7a! = V_1f6a! - FX##(V_0eaa!) * 20.0   '@29ad5 DS:22a2
    V_1f7e! = FX##(V_0e1c!) * 20.0 + V_0f7e!   '@29af3 DS:22a2
    V_1f82! = V_1f6a! - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * 20.0   '@29b0e DS:22a2
    GOSUB L_2e45f   '@29b4b
    V_1f76! = FX##(V_0f7e!) + 40.0   '@29b58 DS:2406
    V_1f7a! = V_1f6a! - FX##(V_0eaa!) * 20.0   '@29b6e DS:22a2
    V_1f7e! = FX##(V_0f7e!) + 40.0 + A_1c62%(3, 4) * 3.599999904632568359375##   '@29b8c DS:2406,240a
    V_1f82! = V_1f6a! - FX##(V_0eaa!) * 20.0 - A_1c62%(3, 4) * 3.599999904632568359375##   '@29bc6 DS:22a2,240a
    GOSUB L_2e45f   '@29c08
    V_1f76! = V_0f7e!   '@29c15
    V_1f7a! = V_1f6a! - FX##(V_0eaa!) * 20.0 - 40.0   '@29c26 DS:22a2,240e
    V_1f7e! = A_1c62%(3, 4) * 3.599999904632568359375## + V_0f7e!   '@29c49 DS:240a
    V_1f82! = V_1f6a! - FX##(V_0eaa!) * 20.0 - 40.0 - A_1c62%(3, 4) * 3.599999904632568359375##   '@29c7b DS:22a2,240a,240e
    GOSUB L_2e45f   '@29cc2
    RETURN   '@29ccf
L_29cde:   ' sub-rotina (alvo de GOSUB)
    V_1f12$ = "FORMAFE"   '@29ce3 DS:2396
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e44!)), 0) > 0.0) THEN GOTO L_29d36   '@29cf5 DS:2224
    GOSUB L_2a029   '@29d29
L_29d36:
    GOSUB L_2a1ef   '@29d36
    IF NOT (V_1866! > 0.0) THEN GOTO L_29d6b   '@29d43 DS:2224
    GOSUB L_2adb1   '@29d5e
L_29d6b:
    RETURN   '@29d6b
L_29d7a:   ' sub-rotina (alvo de GOSUB)
    V_1f76! = V_0f7e!   '@29d7f
    V_1f7a! = V_0e48!   '@29d90
    V_1f7e! = FX##(V_0f7e!) + V_0e20!   '@29da1
    V_1f82! = V_0e48!   '@29db7
    GOSUB L_2e45f   '@29dc8
    V_1f76! = FX##(V_0f7e!) + V_0e20!   '@29dd5
    V_1f7a! = V_0e48!   '@29deb
    V_1f7e! = FX##(V_0f7e!) + V_0e20!   '@29dfc
    V_1f82! = FX##(V_0e48!) - V_0e20!   '@29e12
    GOSUB L_2e45f   '@29e28
    V_1f76! = FX##(V_0f7e!) + V_0e20!   '@29e35
    V_1f7a! = FX##(V_0e48!) - V_0e20!   '@29e4b
    V_1f7e! = V_0f7e!   '@29e61
    V_1f82! = FX##(V_0e48!) - V_0e20!   '@29e72
    GOSUB L_2e45f   '@29e88
    V_1f76! = V_0f7e!   '@29e95
    V_1f7a! = FX##(V_0e48!) - V_0e20!   '@29ea6
    V_1f7e! = V_0f7e!   '@29ebc
    V_1f82! = V_0e48!   '@29ecd
    GOSUB L_2e45f   '@29ede
    RETURN   '@29eeb
L_29efa:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@29eff
    RETURN   '@2a01a
L_2a029:   ' sub-rotina (alvo de GOSUB)
    L_BP98! = A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)   '@2a02e
    FOR V_0e40! = 1.0 TO L_BP98!   '@2a059 DS:2238
    V_0f7e! = FX##(V_0ee6!) + 200.0 + (FX##(V_0eaa!) * 20.0 + 10.0)   '@2a060 DS:2258,22a2,23fa
    V_0e48! = V_1f6a! - ((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)) + 1.0) * V_0e40! + V_0ea6!) * 20.0   '@2a088 DS:2238,2250,22a2
    V_0e20! = FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) * 2.0   '@2a0fd DS:2250
    GOSUB L_29d7a   '@2a12d
    V_0f7e! = FX##(V_0ee6!) + 200.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.5 - FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) / 10.0) * 20.0   '@2a13a DS:2258,22a2,23fa,2412
    GOSUB L_29d7a   '@2a1a7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2a1b4 DS:2238
    RETURN   '@2a1e0
L_2a1ef:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@2a1f4
    REDIM A_13fe%(0 TO 20)   '@2a202
    V_0e20! = 0.0   '@2a21f DS:2224
    L_BP9c! = V_185e!   '@2a230
    FOR V_0e40! = 1.0 TO L_BP9c!   '@2a242 DS:2238
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) < V_0f82! OR A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) > V_0f82!) THEN GOTO L_2a2c3   '@2a24a
    GOTO L_2a50f   '@2a2bb
L_2a2c3:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_2a397   '@2a2c3 DS:2238
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_2a392   '@2a2e3 DS:2220
    GOTO L_2a50f   '@2a38a
L_2a392:
L_2a397:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_2a46d   '@2a397
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_2a468   '@2a3b7 DS:2238
    GOTO L_2a50f   '@2a460
L_2a468:
L_2a46d:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e40!)), 1)   '@2a46d
    GOSUB L_29efa   '@2a498
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1af2!(RT_CINT%(FX##(V_0e40!)), 0))   '@2a4a5
L_2a50f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2a514 DS:2238
    IF NOT (2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!) * 2 < V_0e20! OR V_1862! = 0.0) THEN GOTO L_2a5f7   '@2a540 DS:2224
    GOTO L_2a761   '@2a5ef
L_2a5f7:
    L_BPa0! = V_1862!   '@2a5f7
    FOR V_0e40! = 1.0 TO L_BPa0!   '@2a609 DS:2238
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e40!)), 3) < V_0f82! OR A_1b7c!(RT_CINT%(FX##(V_0e40!)), 2) > V_0f82!) THEN GOTO L_2a689   '@2a610
    GOTO L_2a72b   '@2a681
L_2a689:
    V_0e20! = A_1b7c!(RT_CINT%(FX##(V_0e40!)), 1)   '@2a689
    GOSUB L_29efa   '@2a6b4
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1b7c!(RT_CINT%(FX##(V_0e40!)), 0))   '@2a6c1
L_2a72b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2a730 DS:2238
L_2a761:
    FOR V_0e40! = 0.0 TO 9.0   '@2a766 DS:2224,2238,22ae
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@2a774
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2a7bb DS:2238,22ae
    V_0e40! = 9.0   '@2a7e4 DS:22ae
    V_1f22! = 0.0   '@2a7f5 DS:2224
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_2a830   '@2a806
    RETURN   '@2a826
L_2a830:
L_2a835:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_2a87e   '@2a83a
    V_0e40! = FX##(V_0e40!) - 1.0   '@2a861 DS:2220
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2a835   '@2a877
L_2a87e:
    V_1f22! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@2a87e DS:2224,2238,2250,227e,2282,22ae,22b2,22b6,22ba,22be
    L_BPa4! = 2.0   '@2a9f1 DS:2250
    L_BPa8! = FX##(A_13fe%(10)) * 1.0   '@2aa02 DS:2238
    L_BPac! = 2.0 * FX##(V_1f22!) / 10.0   '@2aa27 DS:2250,2258
    L_BPb0! = FX##(V_1f22!) / 10.0 + 2.5   '@2aa3d DS:2258,22c2
    CALL MIXT_082a_Maior(L_BPac!, L_BPb0!, L_BPb4!)   '@2aa52
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb8! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_1f22!) / 10.0 - 6.0) / L_BPb4!) + 1   '@2aa67 DS:2250,2258,22c6,22ca
    CALL MIXT_0877_Menor(L_BPa8!, L_BPb8!, L_BPbc!)   '@2aabf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPa4!, L_BPbc!, L_BPc0!)   '@2aad3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f16! = L_BPc0!   '@2aae8
    V_1f26! = 0.0   '@2aaf3 DS:2224
    V_1f1e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 7.2600002288818359375## - FX##(V_1f16!) * V_1f22! / 10.0) / (FX##(V_1f16!) - 1.0)   '@2ab04 DS:2220,2250,2258,22ce
    L_BPc4! = A_13fe%(10)   '@2ab5f
    FOR V_0e40! = 1.0 TO L_BPc4!   '@2ab84 DS:2238
    V_1f1a! = V_0eaa! + 0.62999999523162841796875## + (FX##(V_1f22!) / 10.0 + V_1f1e!) * (FX##(V_0e40!) - 1.0 - FX##(V_1f16!) * V_1f26!)   '@2ab8c DS:2220,2258,22d2
    IF NOT (V_0e40! - FX##(V_1f16!) * V_1f26! > RT_CINT%(FX##(V_1f16!) / 2.0)) THEN GOTO L_2ac1b   '@2abce DS:2250
    V_1f1a! = FX##(V_1f1a!) + 6.0   '@2ac05 DS:22b6
L_2ac1b:
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_2ac8a   '@2ac1b
    V_1f1a! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 10.0   '@2ac49 DS:2258,22d6
L_2ac8a:
    V_0f7e! = FX##(V_0ee6!) + 200.0 + FX##(V_1f1a!) * 20.0   '@2ac8a DS:22a2,23fa
    L_BPc8! = FX##(V_1f22!) / 10.0 + 1.5   '@2acad DS:2258,22da
    L_BPcc! = FX##(V_1f22!) / 5.0   '@2acc9 DS:2282
    CALL MIXT_082a_Maior(L_BPc8!, L_BPcc!, L_BPd0!)   '@2acd9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = V_1f6a! - (V_0eaa! + 0.62999999523162841796875## + FX##(L_BPd0!) * V_1f26!) * 20.0   '@2acee DS:22a2,22d2
    V_0e20! = 2.0 * FX##(V_1f22!)   '@2ad18 DS:2250
    GOSUB L_29d7a   '@2ad2e
    IF NOT ((FX##(V_1f26!) + 1.0) * V_1f16! = FX##(V_0e40!)) THEN GOTO L_2ad76   '@2ad3b DS:2238
    V_1f26! = FX##(V_1f26!) + 1.0   '@2ad60 DS:2238
L_2ad76:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2ad76 DS:2238
    RETURN   '@2ada2
L_2adb1:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@2adb6
    REDIM A_13fe%(0 TO 20)   '@2adc4
    V_0e20! = 0.0   '@2ade1 DS:2224
    L_BPd4! = V_1866!   '@2adf2
    FOR V_0e40! = 1.0 TO L_BPd4!   '@2ae04 DS:2238
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) < V_0f82! OR A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) > V_0f82!) THEN GOTO L_2ae85   '@2ae0c
    GOTO L_2b157   '@2ae7d
L_2ae85:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_2af9c   '@2ae85 DS:2238
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) - 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_2af97   '@2aea5 DS:2220
    GOTO L_2b157   '@2af8f
L_2af97:
L_2af9c:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_2b0b5   '@2af9c
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_2b0b0   '@2afbc DS:2238
    GOTO L_2b157   '@2b0a8
L_2b0b0:
L_2b0b5:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e40!)), 1)   '@2b0b5
    GOSUB L_29efa   '@2b0e0
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1ac4!(RT_CINT%(FX##(V_0e40!)), 0))   '@2b0ed
L_2b157:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2b15c DS:2238
    FOR V_0e40! = 0.0 TO 9.0   '@2b188 DS:2224,2238,22ae
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@2b196
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2b1dd DS:2238,22ae
    V_0e40! = 9.0   '@2b206 DS:22ae
    V_1f22! = 0.0   '@2b217 DS:2224
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_2b252   '@2b228
    RETURN   '@2b248
L_2b252:
L_2b257:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_2b2a0   '@2b25c
    V_0e40! = FX##(V_0e40!) - 1.0   '@2b283 DS:2220
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2b257   '@2b299
L_2b2a0:
    V_1f22! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@2b2a0 DS:2224,2238,2250,227e,2282,22ae,22b2,22b6,22ba,22be
    L_BPd8! = 2.0   '@2b413 DS:2250
    L_BPdc! = FX##(A_13fe%(10)) * 1.0   '@2b424 DS:2238
    L_BPe0! = 2.0 * FX##(V_1f22!) / 10.0   '@2b449 DS:2250,2258
    L_BPe4! = FX##(V_1f22!) / 10.0 + 2.5   '@2b45f DS:2258,22c2
    CALL MIXT_082a_Maior(L_BPe0!, L_BPe4!, L_BPe8!)   '@2b474
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPec! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_1f22!) / 10.0) / L_BPe8!) + 1   '@2b489 DS:2250,2258,22c6
    CALL MIXT_0877_Menor(L_BPdc!, L_BPec!, L_BPf0!)   '@2b4dc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPd8!, L_BPf0!, L_BPf4!)   '@2b4f0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f16! = L_BPf4!   '@2b505
    V_1f26! = 0.0   '@2b510 DS:2224
    V_1f1e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(V_1f16!) * V_1f22! / 10.0) / (FX##(V_1f16!) - 1.0)   '@2b521 DS:2220,2250,2258,22c6
    L_BPf8! = A_13fe%(10)   '@2b57c
    FOR V_0e40! = 1.0 TO L_BPf8!   '@2b5a1 DS:2238
    V_1f1a! = V_0eaa! + 0.62999999523162841796875## + (FX##(V_1f22!) / 10.0 + V_1f1e!) * (FX##(V_0e40!) - 1.0 - FX##(V_1f16!) * V_1f26!)   '@2b5a8 DS:2220,2258,22d2
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_2b659   '@2b5ea
    V_1f1a! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 10.0   '@2b618 DS:2258,22d6
L_2b659:
    V_0f7e! = FX##(V_0ee6!) + 200.0 + FX##(V_1f1a!) * 20.0   '@2b659 DS:22a2,23fa
    L_BPfc! = FX##(V_1f22!) / 10.0 + 1.5   '@2b67c DS:2258,22da
    L_BP100! = FX##(V_1f22!) / 5.0   '@2b698 DS:2282
    CALL MIXT_082a_Maior(L_BPfc!, L_BP100!, L_BP104!)   '@2b6a8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = V_1f6a! - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa! - 0.62999999523162841796875## - FX##(V_1f22!) / 10.0 - FX##(L_BP104!) * V_1f26!) * 20.0   '@2b6bd DS:2258,22a2,22d6
    V_0e20! = 2.0 * FX##(V_1f22!)   '@2b713 DS:2250
    GOSUB L_29d7a   '@2b729
    IF NOT ((FX##(V_1f26!) + 1.0) * V_1f16! = FX##(V_0e40!)) THEN GOTO L_2b771   '@2b736 DS:2238
    V_1f26! = FX##(V_1f26!) + 1.0   '@2b75b DS:2238
L_2b771:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2b771 DS:2238
    RETURN   '@2b79d
L_2b7ac:   ' sub-rotina (alvo de GOSUB)
    V_1f12$ = "FERRO"   '@2b7b1 DS:2416
    L_BP108! = FX##(V_0ee6!) + 400.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0 + 2.0 * FX##(V_1f5a!) + FX##(V_0e1c!) * 20.0   '@2b7c3 DS:2250,22a2,2402
    CALL MIXT_082a_Maior(V_1f6e!, L_BP108!, L_BP10c!)   '@2b819
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f6e! = L_BP10c!   '@2b82d
    V_0f7e! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@2b838 DS:227a
    L_BP110! = V_186a!   '@2b890
    FOR V_0e48! = 1.0 TO L_BP110!   '@2b8a2 DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e48!)), 5) = V_0f7e!) THEN GOTO L_2b8e7   '@2b8aa
    GOTO L_2b910   '@2b8df
L_2b8e7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@2b8e7 DS:2238
L_2b910:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e48!)) THEN GOTO L_2b93a   '@2b910 DS:2238
    RETURN   '@2b930
L_2b93a:
    V_0f7e! = FX##(V_0ee6!) + 400.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * 20.0 + 2.0 * FX##(V_1f5a!)   '@2b93a DS:2250,22a2,2402
    GOSUB L_29903   '@2b983
    V_1f12$ = "TEXTO"   '@2b990 DS:23e8
    V_1f5e! = 0.60000002384185791015625## * V_1f5a!   '@2b9a2 DS:23d8
    V_1f8e$ = RT_MID2$((STR$(V_0e1c!)), (2))   '@2b9b8
    V_1f86! = FX##(V_0e1c!) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! / 2.0 + V_0f7e!   '@2b9e2 DS:2250,2258
    V_1f8a! = V_1f6a!   '@2ba18
    GOSUB L_2e734   '@2ba29
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!)))), (2))   '@2ba36 DS:2250
    V_1f86! = FX##(V_0e1c!) * 20.0 + V_0f7e! + FX##(V_1f5e!) / 2.0   '@2ba8e DS:2250,22a2
    V_1f8a! = V_1f6a! - FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * 10.0   '@2bab6 DS:2258
    GOSUB L_2e734   '@2baee
    RETURN   '@2bafb
L_2bb0a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 025224_FUN_2000_5224
    V_1f5e! = FX##(V_1f5a!) * 2.0   '@2bb0f DS:2250
    V_1f8e$ = V_0dd4$   '@2bb25
    V_1f12$ = "TABELA"   '@2bb37 DS:2420
    IF NOT (V_1842$ <> "N") THEN GOTO L_2bb68   '@2bb49 DS:22de
    GOTO L_2bd47   '@2bb60
L_2bb68:
    V_1f8e$ = V_1f8e$ + " (" + RT_MID2$((STR$(A_1232!(RT_CINT%(1.0 - FX##(V_0de0!)), 0))), (2)) + "x" + RT_MID2$((STR$(A_1232!(RT_CINT%(1.0 - FX##(V_0de0!)), 1))), (2))   '@2bb68 DS:2238,242a,2430
    L_BP114! = FX##(V_0ddc!) + V_0de4!   '@2bc0f
    FOR V_0e14! = 1.0 TO L_BP114!   '@2bc26 DS:2238
    V_0e00$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + "x" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@2bc2e DS:2430
    IF NOT (RT_INSTR%((1), (V_1f8e$), (V_0e00$)) = 0) THEN GOTO L_2bcfa   '@2bcb7
    V_1f8e$ = V_1f8e$ + "/" + V_0e00$   '@2bcd4 DS:2436
L_2bcfa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@2bcfa DS:2238
    V_1f8e$ = V_1f8e$ + ")"   '@2bd26 DS:243c
L_2bd47:
    V_1f86! = 0.0   '@2bd4c DS:2224
    V_1f8a! = V_1f56!   '@2bd5d
    GOSUB L_2e734   '@2bd6e
    V_0ee6! = V_1f6e!   '@2bd7b
    V_1f4e! = 1.0   '@2bd8c DS:2238
    V_1f5e! = V_1f5a!   '@2bd9d
    V_1f86! = V_0ee6!   '@2bdae
    V_1f8a! = FX##(V_1f5a!) / 3.0 + V_1f4a!   '@2bdbf DS:227e
    V_1f8e$ = V_0dd4$   '@2bdda
    GOSUB L_2e734   '@2bdec
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@2bdf9 DS:23e0
    V_1f86! = V_0ee6!   '@2be0f
    V_1f8a! = FX##(V_1f4a!) - V_1f5a!   '@2be20
    V_1f8e$ = " " + V_18ea$ + "  #   Q   UNI  TOTAL"   '@2be36 DS:2298,2442
    GOSUB L_2e734   '@2be5c
    V_1f76! = V_0ee6!   '@2be69
    V_1f7a! = V_1f4a!   '@2be7a
    V_1f7e! = 22.0 * FX##(V_1f5e!) + V_0ee6!   '@2be8b DS:245a
    V_1f82! = 1.0 * FX##(V_1f4a!)   '@2bea6 DS:2238
    GOSUB L_2e45f   '@2bebc
    V_1f76! = V_0ee6!   '@2bec9
    V_1f7a! = 0.100000001490116119384765625## * V_1f5a! + V_1f4a!   '@2beda DS:245e
    V_1f7e! = 22.0 * FX##(V_1f5e!) + V_0ee6!   '@2bef5 DS:245a
    V_1f82! = 0.100000001490116119384765625## * V_1f5a! + V_1f4a!   '@2bf10 DS:245e
    GOSUB L_2e45f   '@2bf2b
    L_BP118! = FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_186e! + V_1862! + V_1f2e!   '@2bf38
    FOR V_0e14! = 1.0 TO L_BP118!   '@2bf68 DS:2238
    V_0f7e! = V_1f4a! - (FX##(V_1f4e!) + 1.0) * V_1f5a! * 1.2000000476837158203125##   '@2bf70 DS:2238,23f2
    GOSUB L_2c6cd   '@2bf98
    V_1f4e! = FX##(V_1f4e!) + 1.0   '@2bfa5 DS:2238
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@2bfbb DS:2238
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@2bfe4 DS:23e0
    V_1f4e! = FX##(V_1f4e!) + 1.5   '@2bffa DS:22da
    V_1f86! = V_0ee6!   '@2c010
    V_1f8a! = V_1f4a! - FX##(V_1f4e!) * V_1f5a! * 1.2000000476837158203125##   '@2c021 DS:23f2
    V_1f8e$ = " ACO  #   TOTAL  PESO"   '@2c044 DS:2462
    GOSUB L_2e734   '@2c056
    V_1f4e! = FX##(V_1f4e!) + 1.0   '@2c063 DS:2238
    FOR V_0e14! = 5.0 TO 14.0   '@2c079 DS:2238,2282,248c
    IF NOT (A_1cec!(RT_CINT%(FX##(V_0e14!))) = 0.0) THEN GOTO L_2c0bf   '@2c086 DS:2224
    GOTO L_2c487   '@2c0b7
L_2c0bf:
    V_1f8e$ = STR$(RT_SNG!(10.0 * FX##(V_0ebe!) * V_0ec6!)) + V_0ec2$   '@2c0bf DS:2258
    IF NOT (FX##(V_0e14!) - 5.0 <= FX##(V_18d6!)) THEN GOTO L_2c134   '@2c0f6 DS:247c
    RT_MIDCHK (2), 0: MID$(V_1f8e$, 2) = "60B"   '@2c116 DS:2480
L_2c134:
    V_1f86! = V_0ee6!   '@2c134
    V_1f8a! = V_1f4a! - FX##(V_1f4e!) * V_1f5a! * 1.2000000476837158203125##   '@2c145 DS:23f2
    GOSUB L_2e734   '@2c168
    V_1f86! = 5.0 * FX##(V_1f5e!) + V_0ee6!   '@2c175 DS:2282
    V_1f8a! = V_1f4a! - FX##(V_1f4e!) * V_1f5a! * 1.2000000476837158203125##   '@2c190 DS:23f2
    V_1f8e$ = STR$(RT_SNG!(-(V_0e14! = 5.0) * FX##(V_0eee!) - FX##(V_0e14! = 6.0) * V_0ef2! - FX##(V_0e14! = 7.0) * V_0ef6! - FX##(V_0e14! = 8.0) * V_0efa! - FX##(V_0e14! = 9.0) * V_0efe! - FX##(V_0e14! = 10.0) * V_0f02! - FX##(V_0e14! = 11.0) * V_0f06! - FX##(V_0e14! = 12.0) * V_0f0a! - FX##(V_0e14! = 13.0) * V_0f0e! - FX##(V_0e14! = 14.0) * V_0f12!))   '@2c1b3 DS:2258,2268,2282,229e,22ae,22b6,22ba,22be,2488,248c
    GOSUB L_2e734   '@2c338
    V_1f86! = 9.0 * FX##(V_1f5e!) + V_0ee6!   '@2c345 DS:22ae
    V_1f8a! = V_1f4a! - FX##(V_1f4e!) * V_1f5a! * 1.2000000476837158203125##   '@2c360 DS:23f2
    V_1f8e$ = STR$(A_1cec!(RT_CINT%(FX##(V_0e14!))))   '@2c383
    GOSUB L_2e734   '@2c3b5
    V_1f86! = 17.0 * FX##(V_1f5e!) + V_0ee6!   '@2c3c2 DS:2490
    V_1f8a! = V_1f4a! - FX##(V_1f4e!) * V_1f5a! * 1.2000000476837158203125##   '@2c3dd DS:23f2
    V_1f8e$ = STR$(RT_CINT%(FX##(A_1cec!(RT_CINT%(FX##(V_0e14!)))) * A_1488!(RT_CINT%(FX##(V_0e14!) - 5.0)) / 100.0 + 0.5))   '@2c400 DS:2264,247c,2494
    GOSUB L_2e734   '@2c45f
    V_1f4e! = FX##(V_1f4e!) + 1.0   '@2c46c DS:2238
L_2c487:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@2c48c DS:2238,248c
    V_1f76! = V_0ee6!   '@2c4b8
    V_1f7a! = V_1f4a! - (FX##(V_1f4e!) - 1.0) * V_1f5a! * 1.2000000476837158203125## - 0.20000000298023223876953125## * V_1f5a!   '@2c4c9 DS:2220,23dc,23f2
    V_1f7e! = 22.0 * FX##(V_1f5e!) + V_0ee6!   '@2c4fe DS:245a
    V_1f82! = V_1f4a! - (FX##(V_1f4e!) - 1.0) * V_1f5a! * 1.2000000476837158203125## - 0.20000000298023223876953125## * V_1f5a!   '@2c519 DS:2220,23dc,23f2
    GOSUB L_2e45f   '@2c54e
    V_1f76! = V_0ee6!   '@2c55b
    V_1f7a! = V_1f4a! - (FX##(V_1f4e!) - 1.0) * V_1f5a! * 1.2000000476837158203125## - 0.300000011920928955078125## * V_1f5a!   '@2c56c DS:2220,23f2,2498
    V_1f7e! = 22.0 * FX##(V_1f5e!) + V_0ee6!   '@2c5a1 DS:245a
    V_1f82! = V_1f4a! - (FX##(V_1f4e!) - 1.0) * V_1f5a! * 1.2000000476837158203125## - 0.300000011920928955078125## * V_1f5a!   '@2c5bc DS:2220,23f2,2498
    GOSUB L_2e45f   '@2c5f1
    IF NOT (A_1cbe%(RT_CINT%(FX##(V_0e58!))) > 1) THEN GOTO L_2c6be   '@2c5fe
    V_1f86! = V_0ee6!   '@2c624
    V_1f8a! = V_1f4a! - (FX##(V_1f4e!) - 1.0) * V_1f5a! * 1.2000000476837158203125## - 1.39999997615814208984375## * V_1f5a!   '@2c635 DS:2220,23f2,249c
    V_1f8e$ = "REPETIR" + STR$(A_1cbe%(RT_CINT%(FX##(V_0e58!)))) + " VEZES"   '@2c66a DS:24a0,24ac
    GOSUB L_2e734   '@2c6ac
L_2c6be:
    RETURN   '@2c6be
L_2c6cd:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e14! <= V_185e!) THEN GOTO L_2c6f5   '@2c6d2
    GOTO L_2c7fc   '@2c6ed
L_2c6f5:
    IF NOT (FX##(V_185e!) + V_1872! >= FX##(V_0e14!)) THEN GOTO L_2c71d   '@2c6f5
    GOTO L_2cbea   '@2c715
L_2c71d:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! >= FX##(V_0e14!)) THEN GOTO L_2c74a   '@2c71d
    GOTO L_2ce7d   '@2c742
L_2c74a:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! >= FX##(V_0e14!)) THEN GOTO L_2c77c   '@2c74a
    GOTO L_2d275   '@2c774
L_2c77c:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_1862! >= FX##(V_0e14!)) THEN GOTO L_2c7b3   '@2c77c
    GOTO L_2d9af   '@2c7ab
L_2c7b3:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_1862! + V_186e! >= FX##(V_0e14!)) THEN GOTO L_2c7ef   '@2c7b3
    GOTO L_2d512   '@2c7e7
L_2c7ef:
    GOTO L_2dc26   '@2c7ef
L_2c7fc:
    V_0e44! = V_0e14!   '@2c801
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) + A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0) + A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1)   '@2c812
    IF NOT (V_190e$ = "S") THEN GOTO L_2c9cc   '@2c896 DS:24b6
    V_0e20! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1) > 0.0) + (A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0) > 0.0)) + FX##(V_0e20!)   '@2c8ad DS:2224,24bc
L_2c9cc:
    V_0e20! = INT(FX##(V_0e20!))   '@2c9cc
    V_1f86! = V_0ee6!   '@2c9e4
    V_1f8a! = V_0f7e!   '@2c9f5
    V_1f8e$ = STR$(V_0e14!)   '@2ca06
    GOSUB L_2e734   '@2ca22
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2ca2f DS:227e
    V_1f8a! = V_0f7e!   '@2ca4a
    V_1f8e$ = STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1))   '@2ca5b
    GOSUB L_2e734   '@2ca91
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2ca9e DS:22ba
    V_1f8a! = V_0f7e!   '@2cab9
    V_1f8e$ = STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0))   '@2caca
    GOSUB L_2e734   '@2caff
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2cb0c DS:2268
    V_1f8a! = V_0f7e!   '@2cb27
    V_1f8e$ = STR$(V_0e20!)   '@2cb38
    GOSUB L_2e734   '@2cb54
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2cb61 DS:24c0
    V_1f8a! = V_0f7e!   '@2cb7c
    V_1f8e$ = STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))   '@2cb8d
    GOSUB L_2e734   '@2cbce
    RETURN   '@2cbdb
L_2cbea:
    V_0e44! = FX##(V_0e14!) - V_185e!   '@2cbef
    V_0e20! = INT((FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e44!)), 2)) * 2.0 + A_1bd8!(RT_CINT%(FX##(V_0e44!)), 5))   '@2cc05 DS:2250
    V_1f86! = V_0ee6!   '@2cc77
    V_1f8a! = V_0f7e!   '@2cc88
    V_1f8e$ = STR$(V_0e14!)   '@2cc99
    GOSUB L_2e734   '@2ccb5
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2ccc2 DS:227e
    V_1f8a! = V_0f7e!   '@2ccdd
    V_1f8e$ = STR$(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 1))   '@2ccee
    GOSUB L_2e734   '@2cd24
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2cd31 DS:22ba
    V_1f8a! = V_0f7e!   '@2cd4c
    V_1f8e$ = STR$(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0))   '@2cd5d
    GOSUB L_2e734   '@2cd92
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2cd9f DS:2268
    V_1f8a! = V_0f7e!   '@2cdba
    V_1f8e$ = STR$(V_0e20!)   '@2cdcb
    GOSUB L_2e734   '@2cde7
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2cdf4 DS:24c0
    V_1f8a! = V_0f7e!   '@2ce0f
    V_1f8e$ = STR$(RT_SNG!(FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))   '@2ce20
    GOSUB L_2e734   '@2ce61
    RETURN   '@2ce6e
L_2ce7d:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872!   '@2ce82
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) + A_1b20!(RT_CINT%(FX##(V_0e44!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e44!)), 1)   '@2ce9d
    IF NOT (V_190e$ = "S") THEN GOTO L_2d057   '@2cf21 DS:24b6
    V_0e20! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e44!)), 1) > 0.0) + (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e44!)), 0) > 0.0)) + FX##(V_0e20!)   '@2cf38 DS:2224,24bc
L_2d057:
    V_0e20! = INT(FX##(V_0e20!))   '@2d057
    V_1f86! = V_0ee6!   '@2d06f
    V_1f8a! = V_0f7e!   '@2d080
    V_1f8e$ = STR$(V_0e14!)   '@2d091
    GOSUB L_2e734   '@2d0ad
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2d0ba DS:227e
    V_1f8a! = V_0f7e!   '@2d0d5
    V_1f8e$ = STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1))   '@2d0e6
    GOSUB L_2e734   '@2d11c
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2d129 DS:22ba
    V_1f8a! = V_0f7e!   '@2d144
    V_1f8e$ = STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0))   '@2d155
    GOSUB L_2e734   '@2d18a
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2d197 DS:2268
    V_1f8a! = V_0f7e!   '@2d1b2
    V_1f8e$ = STR$(V_0e20!)   '@2d1c3
    GOSUB L_2e734   '@2d1df
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2d1ec DS:24c0
    V_1f8a! = V_0f7e!   '@2d207
    V_1f8e$ = STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))   '@2d218
    GOSUB L_2e734   '@2d259
    RETURN   '@2d266
L_2d275:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866!   '@2d27a
    V_0e20! = INT((FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e44!)), 2)) * 2.0 + A_1baa!(RT_CINT%(FX##(V_0e44!)), 5))   '@2d29a DS:2250
    V_1f86! = V_0ee6!   '@2d30c
    V_1f8a! = V_0f7e!   '@2d31d
    V_1f8e$ = STR$(V_0e14!)   '@2d32e
    GOSUB L_2e734   '@2d34a
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2d357 DS:227e
    V_1f8a! = V_0f7e!   '@2d372
    V_1f8e$ = STR$(A_1baa!(RT_CINT%(FX##(V_0e44!)), 1))   '@2d383
    GOSUB L_2e734   '@2d3b9
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2d3c6 DS:22ba
    V_1f8a! = V_0f7e!   '@2d3e1
    V_1f8e$ = STR$(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0))   '@2d3f2
    GOSUB L_2e734   '@2d427
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2d434 DS:2268
    V_1f8a! = V_0f7e!   '@2d44f
    V_1f8e$ = STR$(V_0e20!)   '@2d460
    GOSUB L_2e734   '@2d47c
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2d489 DS:24c0
    V_1f8a! = V_0f7e!   '@2d4a4
    V_1f8e$ = STR$(RT_SNG!(FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))   '@2d4b5
    GOSUB L_2e734   '@2d4f6
    RETURN   '@2d503
L_2d512:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876! - V_1862!   '@2d517
    V_0e48! = 0.0   '@2d541 DS:2224
    FOR V_0e40! = 0.0 TO 6.0   '@2d552 DS:2224,2238,22b6
    V_0e48! = FX##(V_0e48!) - (A_1a96%(RT_CINT%(FX##(V_0e40!))) > 0)   '@2d560
    IF NOT (V_0e48! = V_0e44!) THEN GOTO L_2d5bf   '@2d59c
    GOTO L_2d5eb   '@2d5b7
L_2d5bf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2d5bf DS:2238,22b6
L_2d5eb:
    V_0e48! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06!   '@2d5eb DS:2224,2238,2250,227e,2282,22b2,22b6
    V_0e20! = 0.0   '@2d6f2 DS:2224
    L_BP11c! = FX##(V_0ddc!) + V_0de4!   '@2d703
    FOR V_0e44! = 1.0 - FX##(V_0de0!) TO L_BP11c!   '@2d71a DS:2238
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e44!)), 1) = V_0e48!) THEN GOTO L_2d7d4   '@2d726
    V_0e20! = FX##(RT_CINT%(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1c34!(RT_CINT%(FX##(V_0e44!)), 2))) * A_1c34!(RT_CINT%(FX##(V_0e44!)), 0) * 2.0 + V_0e20!   '@2d75b DS:2250
L_2d7d4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e44!   '@2d7d4 DS:2238
    V_0e44! = -((V_18e2! > 100.0) * (FX##(V_18e2!) - 100.0) * V_0e48! / 10.0 + FX##(V_18e2! < 100.0) * V_18e2!)   '@2d800 DS:2258,2264,24c4
    IF NOT (V_0e20! > 1000.0) THEN GOTO L_2d8ab   '@2d866 DS:24c8
    V_0e20! = FX##(RT_CINT%(FX##(V_0e20!) * V_0e44! / 1000.0)) + V_0e20!   '@2d881 DS:24c8
L_2d8ab:
    V_1f86! = V_0ee6!   '@2d8ab
    V_1f8a! = V_0f7e!   '@2d8bc
    V_1f8e$ = STR$(V_0e14!)   '@2d8cd
    GOSUB L_2e734   '@2d8e9
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2d8f6 DS:227e
    V_1f8a! = V_0f7e!   '@2d911
    V_1f8e$ = STR$(V_0e48!)   '@2d922
    GOSUB L_2e734   '@2d93e
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2d94b DS:24c0
    V_1f8a! = V_0f7e!   '@2d966
    V_1f8e$ = STR$(V_0e20!)   '@2d977
    GOSUB L_2e734   '@2d993
    RETURN   '@2d9a0
L_2d9af:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876!   '@2d9b4
    V_0e20! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e44!)), 2)   '@2d9d9
    V_1f86! = V_0ee6!   '@2da20
    V_1f8a! = V_0f7e!   '@2da31
    V_1f8e$ = STR$(V_0e14!)   '@2da42
    GOSUB L_2e734   '@2da5e
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2da6b DS:227e
    V_1f8a! = V_0f7e!   '@2da86
    V_1f8e$ = STR$(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 1))   '@2da97
    GOSUB L_2e734   '@2dacd
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2dada DS:22ba
    V_1f8a! = V_0f7e!   '@2daf5
    V_1f8e$ = STR$(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0))   '@2db06
    GOSUB L_2e734   '@2db3b
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2db48 DS:2268
    V_1f8a! = V_0f7e!   '@2db63
    V_1f8e$ = STR$(V_0e20!)   '@2db74
    GOSUB L_2e734   '@2db90
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2db9d DS:24c0
    V_1f8a! = V_0f7e!   '@2dbb8
    V_1f8e$ = STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))   '@2dbc9
    GOSUB L_2e734   '@2dc0a
    RETURN   '@2dc17
L_2dc26:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876! - V_1862! - V_186e!   '@2dc2b
    V_0e48! = 0.0   '@2dc5a DS:2224
    L_BP120! = V_186a!   '@2dc6b
    FOR V_0e40! = 1.0 TO L_BP120!   '@2dc7d DS:2238
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> V_0e44!) THEN GOTO L_2dcc1   '@2dc84
    GOTO L_2e274   '@2dcb9
L_2dcc1:
    L_BP124! = FX##(V_0ddc!) + V_0de4!   '@2dcc1
    FOR V_1f2a! = 1.0 - FX##(V_0de0!) TO L_BP124!   '@2dcd8 DS:2238
    IF NOT ((FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) / 2.0 < FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 1)) AND (FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) / 2.0 > FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 0)) OR (FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) < FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) > FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 0)) - 1.0 OR FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) < FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) > FX##(A_1a0c!(RT_CINT%(FX##(V_1f2a!)), 0)) - 1.0)) THEN GOTO L_2df2d   '@2dce4 DS:2220,2238,2250
    GOTO L_2df59   '@2df25
L_2df2d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1f2a!   '@2df2d DS:2238
L_2df59:
    V_0e20! = A_1232!(RT_CINT%(FX##(V_1f2a!)), 1) - 2.0 * FX##(V_0eaa!) - (A_1232!(RT_CINT%(FX##(V_1f2a!)), 0) - 2.0 * FX##(V_0eaa!)) * ((A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 1.0) + FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 2.0) * 2.0 / 3.0 + FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 3.0) * 3.0 / 5.0)   '@2df59 DS:2238,2250,227e,2282
    V_1f2a! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@2e07e
    V_1f2a! = -((V_1f2a! = V_0f06!) * 6 + ((V_1f2a! = V_0f02!) * 5 + ((V_1f2a! = V_0efe!) * 4 + ((V_1f2a! = V_0efa!) * 3 + ((V_1f2a! = V_0ef6!) * 2 + (V_1f2a! = V_0ef2!))))))   '@2e0a6
    V_0e20! = INT(FX##(V_0e20!) * 2.0) + A_1c62%(RT_CINT%(FX##(V_1f2a!)), 4)   '@2e16c DS:2250
    V_0e48! = (INT((FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) / A_1c06!(RT_CINT%(FX##(V_0e40!)), 3)) + 1.0) * A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) + V_0e48!   '@2e1af DS:2238
    V_1f2a! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@2e247
L_2e274:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@2e279 DS:2238
    V_1f86! = V_0ee6!   '@2e2a5
    V_1f8a! = V_0f7e!   '@2e2b6
    V_1f8e$ = STR$(V_0e14!)   '@2e2c7
    GOSUB L_2e734   '@2e2e3
    V_1f86! = 3.0 * FX##(V_1f5e!) + V_0ee6!   '@2e2f0 DS:227e
    V_1f8a! = V_0f7e!   '@2e30b
    V_1f8e$ = STR$(V_1f2a!)   '@2e31c
    GOSUB L_2e734   '@2e338
    V_1f86! = 7.0 * FX##(V_1f5e!) + V_0ee6!   '@2e345 DS:22ba
    V_1f8a! = V_0f7e!   '@2e360
    V_1f8e$ = STR$(V_0e48!)   '@2e371
    GOSUB L_2e734   '@2e38d
    V_1f86! = 11.0 * FX##(V_1f5e!) + V_0ee6!   '@2e39a DS:2268
    V_1f8a! = V_0f7e!   '@2e3b5
    V_1f8e$ = STR$(V_0e20!)   '@2e3c6
    GOSUB L_2e734   '@2e3e2
    V_1f86! = 16.0 * FX##(V_1f5e!) + V_0ee6!   '@2e3ef DS:24c0
    V_1f8a! = V_0f7e!   '@2e40a
    V_1f8e$ = STR$(RT_SNG!(FX##(V_0e20!) * V_0e48!))   '@2e41b
    GOSUB L_2e734   '@2e443
    RETURN   '@2e450
L_2e45f:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_1856$ = "C") THEN GOTO L_2e483   '@2e464 DS:24cc
    GOTO L_2e5d7   '@2e47b
L_2e483:
    PRINT #2, 0   '@2e48d
    PRINT #2, "LINE"   '@2e4a3 DS:24d2
    PRINT #2, 8   '@2e4ba
    PRINT #2, V_1f12$   '@2e4d1
    PRINT #2, 10   '@2e4e8
    PRINT #2, RT_SNG!(FX##(V_1f76!) + 3000.0)   '@2e4ff DS:24da
    PRINT #2, 20   '@2e526
    PRINT #2, V_1f7a!   '@2e53d
    PRINT #2, 11   '@2e558
    PRINT #2, RT_SNG!(FX##(V_1f7e!) + 3000.0)   '@2e56f DS:24da
    PRINT #2, 21   '@2e596
    PRINT #2, V_1f82!   '@2e5ad
    RETURN   '@2e5c8
L_2e5d7:
    L_BP128! = 1.0   '@2e5dc DS:2238
    IF NOT (V_1f12$ = "FERRO") THEN GOTO L_2e615   '@2e5ed DS:2416
    L_BP128! = 2.0   '@2e604 DS:2250
L_2e615:
    IF NOT (V_1f12$ = "TEXTO") THEN GOTO L_2e63d   '@2e615 DS:23e8
    L_BP128! = 3.0   '@2e62c DS:227e
L_2e63d:
    IF NOT (V_1f12$ = "COTAS") THEN GOTO L_2e665   '@2e63d DS:24de
    L_BP128! = 4.0   '@2e654 DS:22b2
L_2e665:
    IF NOT (V_1f12$ = "FORMAFE") THEN GOTO L_2e68d   '@2e665 DS:2396
    L_BP128! = 5.0   '@2e67c DS:2282
L_2e68d:
    IF NOT (V_1f12$ = "TABELA") THEN GOTO L_2e6b5   '@2e68d DS:2420
    L_BP128! = 6.0   '@2e6a4 DS:22b6
L_2e6b5:
    PRINT #2, "L          1 1 1"; L_BP128!; RT_SNG!(FX##(V_1f76!) + 3000.0); V_1f7a!; RT_SNG!(FX##(V_1f7e!) + 3000.0); V_1f82!   '@2e6b5 DS:24da,24e8
    RETURN   '@2e725
L_2e734:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_1856$ = "C") THEN GOTO L_2e758   '@2e739 DS:24cc
    GOTO L_2e89a   '@2e750
L_2e758:
    PRINT #2, 0   '@2e762
    PRINT #2, "TEXT"   '@2e778 DS:24fc
    PRINT #2, 8   '@2e78f
    PRINT #2, V_1f12$   '@2e7a6
    PRINT #2, 10   '@2e7bd
    PRINT #2, RT_SNG!(FX##(V_1f86!) + 3000.0)   '@2e7d4 DS:24da
    PRINT #2, 20   '@2e7fb
    PRINT #2, V_1f8a!   '@2e812
    PRINT #2, 40   '@2e82d
    PRINT #2, V_1f5e!   '@2e844
    PRINT #2, 1   '@2e85f
    PRINT #2, V_1f8e$   '@2e876
    GOTO L_2ea19   '@2e88d
L_2e89a:
    L_BP128! = 1.0   '@2e89f DS:2238
    IF NOT (V_1f12$ = "FERRO") THEN GOTO L_2e8d8   '@2e8b0 DS:2416
    L_BP128! = 2.0   '@2e8c7 DS:2250
L_2e8d8:
    IF NOT (V_1f12$ = "TEXTO") THEN GOTO L_2e900   '@2e8d8 DS:23e8
    L_BP128! = 3.0   '@2e8ef DS:227e
L_2e900:
    IF NOT (V_1f12$ = "COTAS") THEN GOTO L_2e928   '@2e900 DS:24de
    L_BP128! = 4.0   '@2e917 DS:22b2
L_2e928:
    IF NOT (V_1f12$ = "FORMAFE") THEN GOTO L_2e950   '@2e928 DS:2396
    L_BP128! = 5.0   '@2e93f DS:2282
L_2e950:
    IF NOT (V_1f12$ = "TABELA") THEN GOTO L_2e978   '@2e950 DS:2420
    L_BP128! = 6.0   '@2e967 DS:22b6
L_2e978:
    PRINT #2, "T          1"; V_1f5e!; V_1f5e!; L_BP128!; " 1 0 0"; RT_SNG!(FX##(V_1f86!) + 3000.0); V_1f8a!; LEN(V_1f8e$)   '@2e978 DS:24da,2504,2514
    PRINT #2, "           "; V_1f8e$   '@2e9f4 DS:251e
L_2ea19:
    L_BP12c! = FX##(LEN(V_1f8e$) + 2) * V_1f5e! + V_1f86!   '@2ea1e
    CALL MIXT_082a_Maior(V_1f6e!, L_BP12c!, L_BP130!)   '@2ea45
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f6e! = L_BP130!   '@2ea59
    RETURN   '@2ea64
L_2ea73:   ' entrada vinda de 025224_FUN_2000_5224
    ' END SUB   '@2ea73
END SUB

SUB S_30155   ' entrada de SUB/FUNCTION (B$ENRA, locais 364 bytes) (0x30155)
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
    DIM L_BP40%
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP70!
    DIM L_BP72%
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
    ' ---- FUN_3000_0155 @0x30155  (030155_FUN_3000_0155.lift.txt; evidence_id (assembly): ev_0ef1ec63971d087d22971e1833198f7f66028f17367c3bdf36c7847fb14b5f31)
    V_1f3a! = 0.0   '@3015d DS:2530
    V_1f3e! = 0.0   '@3016e DS:2530
    V_1f42! = 0.0   '@3017f DS:2530
    V_1f46! = 0.0   '@30190 DS:2530
    V_1f4a! = 0.0   '@301a1 DS:2530
    V_1f56! = 0.0   '@301b2 DS:2530
    IF NOT (V_1856$ = "C") THEN GOTO L_301e2   '@301c3 DS:2534
    GOTO L_30302   '@301da
L_301e2:
    IF RT_DISP%(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".DXF") THEN OPEN RT_ARQ$(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".DXF") FOR APPEND AS #2 ELSE OPEN RT_ARQ$(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".DXF") FOR OUTPUT AS #2   '@301ec DS:253a,2540,2546,254a,254e
    PRINT #2, 0   '@3029a
    PRINT #2, "SECTION"   '@302b0 DS:2556
    PRINT #2, 2   '@302c7
    PRINT #2, "ENTITIES"   '@302de DS:2562
    GOTO L_303ff   '@302f5
L_30302:
    IF RT_DISP%(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".PUB") THEN OPEN RT_ARQ$(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".PUB") FOR APPEND AS #2 ELSE OPEN RT_ARQ$(V_1816$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".PUB") FOR OUTPUT AS #2   '@30307 DS:253a,2540,2546,254a,256e
    PRINT #2, "* PROGER   SISTRUT-DESENHO VERSAO 40"   '@303b5 DS:2576
    PRINT #2, "$ UNI      1.00 mm"   '@303cc DS:259e
    PRINT #2, "!          ENTIDADES"   '@303e3 DS:25b4
L_303ff:
    GOSUB L_3052f   '@30404
    GOSUB L_30d1e   '@30411
    GOSUB L_33ecf   '@3041e
    GOSUB L_347cc   '@3042b
    GOSUB L_34ca2   '@30438
    GOSUB L_37b3d   '@30445
    CALL S_25224   '@30452
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1856$ = "C") THEN GOTO L_3047b   '@3045c DS:2534
    GOTO L_304f9   '@30473
L_3047b:
    PRINT #2, 0   '@30485
    PRINT #2, "ENDSEC"   '@3049b DS:25cc
    PRINT #2, 0   '@304b2
    PRINT #2, "EOF"   '@304c8 DS:25d6
    RT_CLOSE   '@304df (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    GOTO L_38791   '@304ec
L_304f9:
    PRINT #2, ".          FIM DE ARQUIVO"   '@304fe DS:25de
    RT_CLOSE   '@30515 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    GOTO L_38791   '@30522
    ' ---- F_3052a @0x3052a  (03052a_F_3052a.lift.txt; evidence_id (assembly): ev_776219b7f3a424acd40e7db5f7f46788cd6aeaa22d76c49a8dffff6946900c2d)
L_3052f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    V_1f12$ = "COTAS"   '@30534 DS:25fc
    V_1f5e! = 150.0   '@30546 DS:2606
    V_1f5a! = V_1f5e!   '@30557
    V_1f3a! = 1800.0   '@30568 DS:260a
    V_1f6e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) * 10.0 + V_1f5a!   '@30579 DS:260e,2612
    IF NOT (V_1842$ = "N") THEN GOTO L_305ea   '@305b3 DS:2616
    V_1f3e! = V_1f3a!   '@305ca
    RETURN   '@305db
L_305ea:
    V_1f76! = 0.0   '@305ea DS:2530
    V_1f7a! = V_1f3a!   '@305fb
    V_1f7e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) * 10.0   '@3060c DS:260e,2612
    V_1f82! = V_1f3a!   '@30641
    GOSUB L_3821d   '@30652
    L_BP0e! = FX##(V_0ddc!) + 1.0   '@3065f DS:260e
    FOR V_0e14! = 0.0 TO L_BP0e!   '@30675 DS:2530,260e
    V_1f76! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@3067c DS:2612
    V_1f7a! = V_1f3a! - FX##(V_1f5a!) / 2.0   '@306ab DS:261c
    V_1f7e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@306c9 DS:2612
    V_1f82! = FX##(V_1f5a!) / 2.0 + V_1f3a!   '@306f8 DS:261c
    GOSUB L_3821d   '@30713
    V_1f76! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@30720 DS:2612
    V_1f7e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@30750 DS:2612
    GOSUB L_3821d   '@30780
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e14!) AND V_0e14! > 0.0 OR (V_0de4! = 1.0 AND FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR V_0de0! = 1.0 AND V_0e14! = 0.0)) THEN GOTO L_3091e   '@3078d DS:2530,260e
    V_1f8e$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@30841
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.5   '@30885 DS:2620,2624
    V_1f8a! = V_1f3a! - 1.5 * FX##(V_1f5a!)   '@308ee DS:2628
    GOSUB L_384a2   '@3090c
L_3091e:
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e14!) AND V_0e14! > 0.0 OR (V_0de4! = 1.0 AND FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR V_0de0! = 1.0 AND V_0e14! = 0.0)) THEN GOTO L_30af1   '@3091e DS:2530,260e
    V_1f8e$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + "/" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@309d2 DS:262c
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@30a5b DS:261c,2620
    V_1f8a! = FX##(V_1f5a!) / 2.0 + V_1f3a!   '@30ac4 DS:261c
    GOSUB L_384a2   '@30adf
L_30af1:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!)) THEN GOTO L_30b19   '@30af1 DS:260e
    GOTO L_30cc4   '@30b11
L_30b19:
    V_1f8e$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@30b19
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@30b5c DS:260e,261c,2620
    V_1f8a! = V_1f3a! - 1.5 * FX##(V_1f5a!)   '@30bca DS:2628
    GOSUB L_384a2   '@30be8
    V_1f8e$ = RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (2))   '@30bf5
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@30c29 DS:260e,261c,2620
    V_1f8a! = FX##(V_1f5a!) / 2.0 + V_1f3a!   '@30c97 DS:261c
    GOSUB L_384a2   '@30cb2
L_30cc4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@30cc9 DS:260e
    V_1f3e! = 3.0 * FX##(V_1f5a!) + V_1f3a!   '@30cf4 DS:2632
    RETURN   '@30d0f
L_30d1e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    REDIM A_13fe%(-32768 TO -32768)   '@30d23
    REDIM A_13fe%(0 TO 20)   '@30d31
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@30d4e DS:260e,261c,2636
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@30d5c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@30d7d DS:261c,2636
    IF NOT (V_1866! = 0.0) THEN GOTO L_30dc9   '@30da6 DS:2530
    GOTO L_31cd2   '@30dc1
L_30dc9:
    L_BP12! = V_1866!   '@30dc9
    FOR V_0e14! = 1.0 TO L_BP12!   '@30dda DS:260e
    V_0e18! = 0.0   '@30de2 DS:2530
    V_1f12$ = "FERRO"   '@30df3 DS:263a
    V_1f5e! = V_1f5a!   '@30e05
L_30e1b:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_30f0d   '@30e20 DS:260e
    V_0e18! = FX##(V_0e18!) + 2.0   '@30eef DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30e1b   '@30f05
L_30f0d:
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_3103b   '@30f0d DS:2530
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@30f41 DS:2612
    L_BP16! = FX##(A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@30f6e DS:2612
    L_BP1a! = 1.5 * FX##(V_1f5a!)   '@30f9d DS:2628
    CALL MIXT_0877_Menor(L_BP16!, L_BP1a!, L_BP1e!)   '@30fac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + L_BP1e!   '@30fbe DS:2628
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@30fdc DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@31009 DS:2628
    GOSUB L_3821d   '@31029
L_3103b:
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@3103b DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@31068 DS:2628
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@31088 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@310b8 DS:2628
    GOSUB L_3821d   '@310d8
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_3121b   '@310e5 DS:2530
    V_1f76! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@3111a DS:2612
    L_BP22! = FX##(A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@3114a DS:2612
    L_BP26! = 1.5 * FX##(V_1f5a!)   '@3117a DS:2628
    CALL MIXT_0877_Menor(L_BP22!, L_BP26!, L_BP2a!)   '@31189
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + L_BP2a!   '@3119b DS:2628
    V_1f7e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@311b9 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@311e9 DS:2628
    GOSUB L_3821d   '@31209
L_3121b:
    V_1f12$ = "TEXTO"   '@3121b DS:2644
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@3122d
    IF NOT (V_190e$ = "S") THEN GOTO L_313e7   '@312b1 DS:264e
    V_0e20! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@312c8 DS:2530,2654
L_313e7:
    V_0e20! = INT(FX##(V_0e20!))   '@313e7
    V_1f8e$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1872! + V_0e14!))), (2)) + STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@313ff DS:2658,265e
    L_BP2e! = -(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + FX##(V_1f5a!) / 3.0) * (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)   '@314e3 DS:2530,2612,2632
    L_BP32! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@31558 DS:261c,2620
    L_BP36! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5a!   '@315b9 DS:2612
    CALL MIXT_0877_Menor(L_BP32!, L_BP36!, L_BP3a!)   '@315f8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2e!, L_BP3a!, L_BP3e!)   '@31609
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f86! = L_BP3e!   '@3161b
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + FX##(V_1f5a!) / 3.0   '@31625 DS:2628,2632
    GOSUB L_384a2   '@31652
    V_1f8a! = 6.0   '@3165f DS:2666
L_31676:
    L_BP40% = (V_1f8a! = 15.0)   '@31677 DS:266a
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_1f8a!)))) = 0 OR L_BP40%) = 0) THEN GOTO L_3190c   '@316ac
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (2), (2)))) = FX##(V_0e14!) + V_185e! + V_1872!) THEN GOTO L_318e8   '@316c3
    V_1f8e$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (4))   '@31710
    L_BP44! = -(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + FX##(V_1f5a!) / 3.0) * (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)   '@31744 DS:2530,2612,2632
    L_BP48! = (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - LEN(V_1f8e$) * 0.699999988079071044921875## * V_1f5a! / 2.0   '@317b9 DS:261c,2620,266e
    L_BP4c! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - LEN(V_1f8e$) * 0.699999988079071044921875## * V_1f5a!   '@3181f DS:2612,266e
    CALL MIXT_0877_Menor(L_BP48!, L_BP4c!, L_BP50!)   '@31863
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP44!, L_BP50!, L_BP54!)   '@31874
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f86! = L_BP54!   '@31886
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f3e!   '@31890 DS:2628
    V_1f5e! = 0.699999988079071044921875## * V_1f5a!   '@318b5 DS:266e
    GOSUB L_384a2   '@318cb
    GOTO L_3190c   '@318d8
L_318e8:
    V_1f8a! = FX##(V_1f8a!) + 1.0   '@318e8 DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31676   '@31903
L_3190c:
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_31a1b   '@3190c DS:2530
    V_1f8e$ = RT_MID2$((STR$(A_1b20!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@31940
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@31983 DS:2672
    V_1f86! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0   '@31999 DS:2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@319e9 DS:2628
    GOSUB L_384a2   '@31a09
L_31a1b:
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_31b19   '@31a1b DS:2530
    V_1f8e$ = RT_MID2$((STR$(A_1b20!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@31a50
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@31a94 DS:2672
    V_1f86! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) / 3.0   '@31aaa DS:2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@31ae7 DS:2628
    GOSUB L_384a2   '@31b07
L_31b19:
    L_BP58! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@31b19
    L_BP5c! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@31b44 DS:260e
    CALL MIXT_082a_Maior(L_BP58!, L_BP5c!, L_BP60!)   '@31b6d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP58!   '@31b7f
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP60!))   '@31ba4
    L_BP64! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@31bca
    L_BP68! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@31bf2 DS:260e
    CALL MIXT_0877_Menor(L_BP64!, L_BP68!, L_BP6c!)   '@31c20
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP64!   '@31c32
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP6c!))   '@31c54 DS:260e
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@31c7f DS:2672
    GOSUB L_32d6c   '@31c95
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@31ca2 DS:260e
L_31cd2:
    IF NOT (V_1876! = 0.0) THEN GOTO L_31cfa   '@31cd7 DS:2530
    GOTO L_32c57   '@31cf2
L_31cfa:
    L_BP70! = V_1876!   '@31cfa
    FOR V_0e14! = 1.0 TO L_BP70!   '@31d0b DS:260e
    V_0e18! = 0.0   '@31d12 DS:2530
    V_1f12$ = "FERRO"   '@31d23 DS:263a
L_31d3a:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) < A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_31e2c   '@31d3f DS:260e
    V_0e18! = FX##(V_0e18!) + 2.0   '@31e0e DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31d3a   '@31e24
L_31e2c:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 3.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!) + 2.0)) > 0 AND A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) < A_13fe%(RT_CINT%(FX##(V_0e18!) + 2.0)))) THEN GOTO L_31f23   '@31e2c DS:261c,2632
    V_0e18! = FX##(V_0e18!) + 2.0   '@31f05 DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31d3a   '@31f1b
L_31f23:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) THEN GOTO L_31f60   '@31f23 DS:260e
    GOTO L_32186   '@31f58
L_31f60:
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + V_1f5a!   '@31f60 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@31f95 DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + V_1f5a!   '@31fba DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@31fec DS:2628
    GOSUB L_3821d   '@32011
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + V_1f5a!   '@3201e DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@32050 DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@32075 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@320a2 DS:2628
    GOSUB L_3821d   '@320c2
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@320cf DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@320fc DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@3211c DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@3214c DS:2628
    GOSUB L_3821d   '@3216c
    GOTO L_323af   '@32179
L_32186:
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@3218b DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@321b8 DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@321dd DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@3220d DS:2628
    GOSUB L_3821d   '@32232
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@3223f DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + V_1f5a!   '@3226f DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - V_1f5a!   '@32294 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@322c9 DS:2628
    GOSUB L_3821d   '@322e9
    V_1f76! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - V_1f5a!   '@322f6 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@3232b DS:2628
    V_1f7e! = FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - V_1f5a!   '@3234b DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@3237d DS:2628
    GOSUB L_3821d   '@3239d
L_323af:
    V_1f8e$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e! + V_1872! + V_1866!))), (2)) + STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@323b4 DS:261c,2658,265e
    V_1f5e! = V_1f5a!   '@32505
    V_1f12$ = "TEXTO"   '@32516 DS:2644
    V_1f86! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@32528 DS:261c,2620
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + 4.0 * FX##(V_1f5a!) / 3.0   '@3258f DS:2628,2632,2676
    GOSUB L_384a2   '@325c1
    V_1f8a! = 6.0   '@325ce DS:2666
L_325e4:
    L_BP72% = (V_1f8a! = 15.0)   '@325e5 DS:266a
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_1f8a!)))) = 0 OR L_BP72%) = 0) THEN GOTO L_3279e   '@3261a
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (2), (2)))) = FX##(V_0e14!) + V_185e! + V_1872! + V_1866!) THEN GOTO L_3277b   '@32631
    V_1f8e$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (4))   '@32683
    V_1f86! = (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - LEN(V_1f8e$) * 0.699999988079071044921875## * V_1f5a! / 2.0   '@326b7 DS:261c,2620,266e
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f3e!   '@32723 DS:2628
    V_1f5e! = 0.699999988079071044921875## * V_1f5a!   '@32748 DS:266e
    GOSUB L_384a2   '@3275e
    GOTO L_3279e   '@3276b
L_3277b:
    V_1f8a! = FX##(V_1f8a!) + 1.0   '@3277b DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_325e4   '@32796
L_3279e:
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@3279e DS:2672
    V_1f8e$ = RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))), (2))   '@327b4
    V_1f86! = -(A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0) - (A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) / 6.0)   '@327f8 DS:2530,260e,2612,2632,2666
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@328f0 DS:2628
    GOSUB L_384a2   '@32910
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@3291d
    V_1f86! = -(A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - 4.0 * FX##(V_1f5a!) / 3.0) - (A_1baa!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) * 4.0 / 6.0)   '@3298b DS:2530,260e,2612,2632,2666,2676
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@32a8d DS:2628
    GOSUB L_384a2   '@32aad
    L_BP76! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)   '@32aba
    L_BP7a! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@32ae5 DS:260e
    CALL MIXT_082a_Maior(L_BP76!, L_BP7a!, L_BP7e!)   '@32b0e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP76!   '@32b20
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP7e!))   '@32b45
    L_BP82! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)   '@32b6b
    L_BP86! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@32b94 DS:260e
    CALL MIXT_0877_Menor(L_BP82!, L_BP86!, L_BP8a!)   '@32bc3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP82!   '@32bd8
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP8a!))   '@32bfb DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@32c27 DS:260e
L_32c57:
    V_0e18! = 0.0   '@32c5c DS:2530
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@32c6d DS:260e,261c,2636
    V_0e18! = FX##(-V_0e18!) * (A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999) - FX##(A_13fe%(RT_CINT%(FX##(V_0e14!))) < 9999) * V_0e14!   '@32c7a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@32ced DS:261c,2636
    V_1f42! = FX##(V_0e18!) * V_1f5a! * 1.5 - FX##(V_1876! > 0.0) * V_1f5a! + V_1f3e!   '@32d19 DS:2530,2628
    RETURN   '@32d5d
L_32d6c:   ' sub-rotina (alvo de GOSUB)
    L_BP8e! = FX##(V_0ddc!) + V_0de4!   '@32d71
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP8e!   '@32d88 DS:260e
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_32e40   '@32d94
    GOTO L_32e6c   '@32e38
L_32e40:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@32e40 DS:260e
L_32e6c:
    V_1f12$ = "COTAS"   '@32e6c DS:25fc
    V_1f4e! = V_1f3e!   '@32e7e
    IF NOT (FX##(V_0ddc!) + V_0de4! + 1.0 = FX##(V_0e28!)) THEN GOTO L_32ebc   '@32e8f DS:260e
    GOTO L_331f9   '@32eb4
L_32ebc:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) THEN GOTO L_32f4d   '@32ebc
    GOTO L_3308c   '@32f45
L_32f4d:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))))), (2))   '@32f4d
    V_1f86! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + V_1f5a!   '@32fba DS:2612
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f3e!   '@32fec DS:2628
    GOSUB L_384a2   '@33011
    V_0f7e! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)   '@3301e
    V_0f82! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@33048
    GOSUB L_33b09   '@33070
    RETURN   '@3307d
L_3308c:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3))))), (2))   '@33091
    V_1f86! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0   '@33102 DS:2612,2632
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f3e!   '@33155 DS:2628
    GOSUB L_384a2   '@3317a
    V_0f7e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@33187
    V_0f82! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@331b2
    GOSUB L_33b09   '@331dd
    RETURN   '@331ea
L_331f9:
    L_BP92! = V_0ddc!   '@331fe
    FOR V_0e28! = 0.0 TO L_BP92!   '@33210 DS:2530,260e
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa! + 1.0) THEN GOTO L_3341e   '@33218 DS:260e
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@332c8 DS:260e
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) * 10.0 + FX##(V_1f5a!) / 3.0   '@3333a DS:260e,2612,2632
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f3e!   '@3337b DS:2628
    GOSUB L_384a2   '@333a0
    V_0f7e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@333ad
    V_0f82! = A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)   '@333d5 DS:260e
    GOSUB L_33b09   '@33404
    GOTO L_33afa   '@33411
L_3341e:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! - 1.0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_3363a   '@3341e DS:260e,267a
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))))), (2))   '@334d4
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0   '@33545 DS:2612,2632
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f3e!   '@33598 DS:2628
    GOSUB L_384a2   '@335bd
    V_0f7e! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@335ca
    V_0f82! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@335f5
    GOSUB L_33b09   '@33620
    GOTO L_33afa   '@3362d
L_3363a:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa!) THEN GOTO L_336f5   '@3363a DS:260e
    GOTO L_33ac9   '@336ed
L_336f5:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) THEN GOTO L_338dd   '@336f5 DS:260e
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@33787 DS:260e
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) * 10.0 + FX##(V_1f5a!) / 3.0   '@337f9 DS:260e,2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f3e!   '@3383a DS:2628
    GOSUB L_384a2   '@3385f
    V_0f7e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@3386c
    V_0f82! = A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)   '@33894 DS:260e
    GOSUB L_33b09   '@338c3
    GOTO L_33afa   '@338d0
L_338dd:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 1) AND FX##(V_0ddc!) + V_0de4! > FX##(V_0e28!)) THEN GOTO L_33963   '@338dd DS:260e
    GOTO L_33ac9   '@3395b
L_33963:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))))), (2))   '@33963
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0   '@339d4 DS:2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f3e!   '@33a27 DS:2628
    GOSUB L_384a2   '@33a4c
    V_0f7e! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@33a59
    V_0f82! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@33a84
    GOSUB L_33b09   '@33aaf
    GOTO L_33afa   '@33abc
L_33ac9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@33ace DS:260e
L_33afa:
    RETURN   '@33afa
L_33b09:   ' sub-rotina (alvo de GOSUB)
    V_1f12$ = "COTAS"   '@33b0e DS:25fc
    V_1f76! = FX##(V_0f7e!) * 10.0   '@33b20 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33b36 DS:2628,266e
    V_1f7e! = FX##(V_0f7e!) * 10.0 + V_1f5a!   '@33b63 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33b7e DS:2628,266e
    GOSUB L_3821d   '@33bab
    V_1f76! = FX##(V_0f7e!) * 10.0   '@33bb8 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33bce DS:2628,266e
    V_1f7e! = FX##(V_0f7e!) * 10.0 + FX##(V_1f5a!) / 3.0   '@33bfb DS:2612,2632
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.4000000059604644775390625## * V_1f5a! + V_1f4e!   '@33c1e DS:2628,267e
    GOSUB L_3821d   '@33c4b
    V_1f76! = FX##(V_0f7e!) * 10.0   '@33c58 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33c6e DS:2628,266e
    V_1f7e! = FX##(V_0f7e!) * 10.0 + FX##(V_1f5a!) / 3.0   '@33c9b DS:2612,2632
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f4e!   '@33cbe DS:2628
    GOSUB L_3821d   '@33ce3
    V_1f76! = FX##(V_0f82!) * 10.0   '@33cf0 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33d06 DS:2628,266e
    V_1f7e! = FX##(V_0f82!) * 10.0 - V_1f5a!   '@33d33 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33d4e DS:2628,266e
    GOSUB L_3821d   '@33d7b
    V_1f76! = FX##(V_0f82!) * 10.0   '@33d88 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33d9e DS:2628,266e
    V_1f7e! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 3.0   '@33dcb DS:2612,2632
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.4000000059604644775390625## * V_1f5a! + V_1f4e!   '@33dee DS:2628,267e
    GOSUB L_3821d   '@33e1b
    V_1f76! = FX##(V_0f82!) * 10.0   '@33e28 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 0.699999988079071044921875## * V_1f5a! + V_1f4e!   '@33e3e DS:2628,266e
    V_1f7e! = FX##(V_0f82!) * 10.0 - FX##(V_1f5a!) / 3.0   '@33e6b DS:2612,2632
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f4e!   '@33e8e DS:2628
    GOSUB L_3821d   '@33eb3
    RETURN   '@33ec0
L_33ecf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    IF NOT (V_186e! = 0.0) THEN GOTO L_33f0f   '@33ed4 DS:2530
    V_1f42! = FX##(V_1f42!) + V_1f5a!   '@33eef
    RETURN   '@33f05
L_33f0f:
    V_0e18! = 0.0   '@33f0f DS:2530
    V_1f5e! = V_1f5a!   '@33f20
L_33f36:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0) THEN GOTO L_33f7f   '@33f3b
    V_0e18! = FX##(V_0e18!) + 2.0   '@33f62 DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33f36   '@33f78
L_33f7f:
    L_BP96! = FX##(V_0ddc!) + V_0de4!   '@33f7f
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP96!   '@33f96 DS:260e
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_33fde   '@33fa2 DS:2530
    GOTO L_34771   '@33fd6
L_33fde:
    V_0e20! = 0.0   '@33fde DS:2530
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0eee!) THEN GOTO L_3419c   '@33fef
    V_0e20! = -(A_1a96%(0) > 0)   '@34024
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef2!) THEN GOTO L_34197   '@34052
    V_0e20! = FX##(V_0e20!) - (A_1a96%(1) > 0)   '@34087
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef6!) THEN GOTO L_34192   '@340b9
    V_0e20! = FX##(V_0e20!) - (A_1a96%(2) > 0)   '@340ee
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efa!) THEN GOTO L_3418d   '@34123
    V_0e20! = FX##(V_0e20!) - (A_1a96%(3) > 0)   '@34158
L_3418d:
L_34192:
L_34197:
L_3419c:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efe!) THEN GOTO L_342e4   '@3419c
    V_0e20! = FX##(V_0e20!) - (A_1a96%(4) > 0)   '@341d1
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0f02!) THEN GOTO L_342df   '@34206
    V_0e20! = FX##(V_0e20!) - (A_1a96%(5) > 0)   '@3423b
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0f06!) THEN GOTO L_342da   '@34270
    V_0e20! = FX##(V_0e20!) - (A_1a96%(6) > 0)   '@342a5
L_342da:
L_342df:
L_342e4:
    V_1f8e$ = "2x" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1862! + V_1872! + V_1876! + V_0e20!))), (2)) + "#" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@342e4 DS:2658,2682,2688
    V_1f12$ = "FERRO"   '@343cd DS:263a
    V_1f76! = FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@343df DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@3440c DS:2628
    V_1f7e! = FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@3442c DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e!   '@3445c DS:2628
    GOSUB L_3821d   '@3447c
    V_1f12$ = "TEXTO"   '@34489 DS:2644
    V_1f86! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@3449b DS:261c,2620
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f3e! + FX##(V_1f5a!) / 3.0   '@34504 DS:2628,2632
    L_BP9a! = 0.0   '@34531 DS:2530
    L_BP9e! = FX##(V_0e14!) - 1.0   '@34543 DS:267a
    CALL MIXT_082a_Maior(L_BP9a!, L_BP9e!, L_BPa2!)   '@34553
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPa6! = 0.0   '@34568 DS:2530
    L_BPaa! = FX##(V_0e14!) - 1.0   '@34574 DS:267a
    CALL MIXT_082a_Maior(L_BPa6!, L_BPaa!, L_BPae!)   '@34584
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb2! = FX##(V_0ddc!) + 1.0   '@34599 DS:260e
    L_BPb6! = FX##(V_0e14!) + 1.0   '@345aa DS:260e
    CALL MIXT_0877_Menor(L_BPb2!, L_BPb6!, L_BPba!)   '@345ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPbe! = FX##(V_0ddc!) + 1.0   '@345cf DS:260e
    L_BPc2! = FX##(V_0e14!) + 1.0   '@345e0 DS:260e
    CALL MIXT_0877_Menor(L_BPbe!, L_BPc2!, L_BPc6!)   '@345f0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) * A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) <> FX##(A_1c34!(RT_CINT%(FX##(L_BPba!)), 0)) * A_1c34!(RT_CINT%(FX##(L_BPc6!)), 1) OR (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) * A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) <> FX##(A_1c34!(RT_CINT%(FX##(L_BPa2!)), 0)) * A_1c34!(RT_CINT%(FX##(L_BPae!)), 1) OR FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0 < FX##(V_1f86!))) THEN GOTO L_3476c   '@34605 DS:2612
    GOSUB L_384a2   '@3475a
L_3476c:
L_34771:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@34776 DS:260e
    V_1f42! = FX##(V_1f5a!) * 4.0 + V_1f42!   '@347a2 DS:2676
    RETURN   '@347bd
L_347cc:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    V_1f62! = 0.0   '@347d1 DS:2530
    V_1f66! = 0.0   '@347e2 DS:2530
    V_1f12$ = "FORMA"   '@347f3 DS:268e
    L_BPca! = V_185a!   '@34805
    FOR V_0e14! = 0.0 TO L_BPca!   '@34817 DS:2530,260e
    IF NOT (A_1a68!(RT_CINT%(FX##(V_0e14!)), 1) = A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) THEN GOTO L_3494d   '@3481e
    L_BPce! = A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)   '@3486d
    CALL MIXT_082a_Maior(V_1f62!, L_BPce!, L_BPd2!)   '@34898
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a68!(RT_CINT%(FX##(V_0e14!)), 1) = L_BPce!   '@348ac
    V_1f62! = L_BPd2!   '@348d2
    L_BPd6! = A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)   '@348dd
    CALL MIXT_0877_Menor(V_1f66!, L_BPd6!, L_BPda!)   '@34908
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a68!(RT_CINT%(FX##(V_0e14!)), 1) = L_BPd6!   '@3491c
    V_1f66! = L_BPda!   '@34942
L_3494d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3494d DS:260e
    V_1f62! = FX##(V_1f62!) * 10.0 + 250.0   '@34979 DS:2612,2698
    V_1f66! = FX##(V_1f66!) * 10.0 - 250.0   '@34994 DS:2612,269c
    L_BPde! = V_185a!   '@349af
    FOR V_0e14! = 0.0 TO L_BPde!   '@349c1 DS:2530,260e
    V_1f76! = FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@349c8 DS:2612
    L_BPe2! = FX##(V_1f62!) - V_1f66! + V_1f42!   '@349f7
    L_BPe6! = V_1f62! - FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0 + V_1f42!   '@34a13 DS:2612
    CALL MIXT_082a_Maior(V_1f42!, L_BPe6!, L_BPea!)   '@34a4a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BPe2!, L_BPea!, L_BPee!)   '@34a5d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f7a! = L_BPee!   '@34a72
    V_1f7e! = FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@34a7d DS:2612
    L_BPf2! = FX##(V_1f62!) - V_1f66! + V_1f42!   '@34aaa
    L_BPf6! = V_1f62! - FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + V_1f42!   '@34ac6 DS:2612
    CALL MIXT_082a_Maior(V_1f42!, L_BPf6!, L_BPfa!)   '@34afd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BPf2!, L_BPfa!, L_BPfe!)   '@34b10
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f82! = L_BPfe!   '@34b25
    GOSUB L_3821d   '@34b30
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@34b3d DS:260e
    IF NOT (V_1842$ <> "N") THEN GOTO L_34b88   '@34b69 DS:2616
    GOTO L_34c66   '@34b80
L_34b88:
    L_BP102! = V_0ddc!   '@34b88
    FOR V_0e14! = 0.0 TO L_BP102!   '@34b9a DS:2530,260e
    V_1f8e$ = RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (2))   '@34ba2
    V_1f86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) * 10.0 + FX##(V_1f5a!) / 3.0   '@34bd6 DS:260e,2612,2632
    V_1f8a! = V_1f42!   '@34c17
    GOSUB L_384a2   '@34c28
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@34c35 DS:260e
L_34c66:
    V_1f46! = FX##(V_1f62!) - V_1f66! + V_1f42! + FX##(V_1f5a!) * 3.0   '@34c6b DS:2632
    RETURN   '@34c93
L_34ca2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    REDIM A_13fe%(-32768 TO -32768)   '@34ca7
    REDIM A_13fe%(0 TO 20)   '@34cb5
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@34cd2 DS:260e,261c,2636
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@34ce0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@34d01 DS:261c,2636
    GOSUB L_37813   '@34d2a
    IF NOT (V_185e! = 0.0) THEN GOTO L_34d5a   '@34d37 DS:2530
    GOTO L_35b2b   '@34d52
L_34d5a:
    L_BP106! = V_185e!   '@34d5a
    FOR V_0e14! = 1.0 TO L_BP106!   '@34d6c DS:260e
    V_0e18! = 0.0   '@34d74 DS:2530
    V_1f12$ = "FERRO"   '@34d85 DS:263a
    V_1f5e! = V_1f5a!   '@34d97
L_34dad:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_34e9f   '@34db2 DS:260e
    V_0e18! = FX##(V_0e18!) + 2.0   '@34e81 DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34dad   '@34e97
L_34e9f:
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_34fd3   '@34e9f DS:2530
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@34ed3 DS:2612
    L_BP10a! = FX##(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@34f00 DS:2612
    L_BP10e! = 1.5 * FX##(V_1f5a!)   '@34f30 DS:2628
    CALL MIXT_0877_Menor(L_BP10a!, L_BP10e!, L_BP112!)   '@34f40
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - L_BP112! + V_1f46!   '@34f55 DS:2628
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@34f74 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@34fa1 DS:2628
    GOSUB L_3821d   '@34fc1
L_34fd3:
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@34fd3 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35000 DS:2628
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@35020 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35050 DS:2628
    GOSUB L_3821d   '@35070
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_351b9   '@3507d DS:2530
    V_1f76! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@350b2 DS:2612
    L_BP116! = FX##(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@350e2 DS:2612
    L_BP11a! = 1.5 * FX##(V_1f5a!)   '@35113 DS:2628
    CALL MIXT_0877_Menor(L_BP116!, L_BP11a!, L_BP11e!)   '@35123
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! - L_BP11e! + V_1f46!   '@35138 DS:2628
    V_1f7e! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@35157 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35187 DS:2628
    GOSUB L_3821d   '@351a7
L_351b9:
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@351b9
    IF NOT (V_190e$ = "S") THEN GOTO L_35373   '@3523d DS:264e
    V_0e20! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@35254 DS:2530,2654
L_35373:
    V_0e20! = INT(FX##(V_0e20!))   '@35373
    V_1f8e$ = V_18ea$ + RT_MID2$((STR$(V_0e14!)), (2)) + STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@3538b DS:2658,265e
    V_1f12$ = "TEXTO"   '@3545e DS:2644
    V_1f86! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.5   '@35470 DS:2620,2624
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + FX##(V_1f5a!) / 3.0   '@354d7 DS:2628,2632
    GOSUB L_384a2   '@35504
    V_1f8a! = 6.0   '@35511 DS:2666
L_35528:
    L_BP120% = (V_1f8a! = 15.0)   '@35529 DS:266a
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_1f8a!)))) = 0 OR L_BP120%) = 0) THEN GOTO L_356d6   '@3555f
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (2), (2)))) = FX##(V_0e14!)) THEN GOTO L_356b2   '@35577
    V_1f8e$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (4))   '@355ba
    V_1f86! = (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - LEN(V_1f8e$) * 0.699999988079071044921875## * V_1f5a! / 2.5   '@355ee DS:2620,2624,266e
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f46!   '@3565a DS:2628
    V_1f5e! = 0.699999988079071044921875## * V_1f5a!   '@3567f DS:266e
    GOSUB L_384a2   '@35695
    GOTO L_356d6   '@356a2
L_356b2:
    V_1f8a! = FX##(V_1f8a!) + 1.0   '@356b2 DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35528   '@356cd
L_356d6:
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) THEN GOTO L_357e5   '@356d6 DS:2530
    V_1f8e$ = RT_MID2$((STR$(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@3570a
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@3574d DS:2672
    V_1f86! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e!   '@35763 DS:2612
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 1.2000000476837158203125## * V_1f5a! + V_1f46!   '@357a6 DS:2628,26a0
    GOSUB L_384a2   '@357d3
L_357e5:
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_358f0   '@357e5 DS:2530
    V_1f8e$ = RT_MID2$((STR$(A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@3581a
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@3585e DS:2672
    V_1f86! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) / 3.0   '@35874 DS:2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - 1.2000000476837158203125## * V_1f5a! + V_1f46!   '@358b1 DS:2628,26a0
    GOSUB L_384a2   '@358de
L_358f0:
    L_BP124! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@358f0
    L_BP128! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@3591c DS:260e
    CALL MIXT_082a_Maior(L_BP124!, L_BP128!, L_BP12c!)   '@35946
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP124!   '@3595b
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP12c!))   '@35981
    L_BP130! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@359a8
    L_BP134! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@359d1 DS:260e
    CALL MIXT_0877_Menor(L_BP130!, L_BP134!, L_BP138!)   '@35a00
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP130!   '@35a15
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP138!))   '@35a38 DS:260e
    IF NOT (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = 0.0 AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_35afa   '@35a64 DS:2530
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@35ad7 DS:2672
    GOSUB L_36ee7   '@35aed
L_35afa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@35afa DS:260e
L_35b2b:
    IF NOT (V_1872! = 0.0) THEN GOTO L_35b53   '@35b30 DS:2530
    GOTO L_369b1   '@35b4b
L_35b53:
    L_BP13c! = V_1872!   '@35b53
    FOR V_0e14! = 1.0 TO L_BP13c!   '@35b65 DS:260e
    V_0e18! = 0.0   '@35b6c DS:2530
    V_1f12$ = "FERRO"   '@35b7d DS:263a
L_35b94:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) < A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_35c86   '@35b99 DS:260e
    V_0e18! = FX##(V_0e18!) + 2.0   '@35c68 DS:261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35b94   '@35c7e
L_35c86:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) THEN GOTO L_35cc3   '@35c86 DS:260e
    GOTO L_35ee9   '@35cbb
L_35cc3:
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + V_1f5a!   '@35cc3 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35cf8 DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + V_1f5a!   '@35d1d DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35d4f DS:2628
    GOSUB L_3821d   '@35d74
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + V_1f5a!   '@35d81 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35db3 DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@35dd8 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35e05 DS:2628
    GOSUB L_3821d   '@35e25
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@35e32 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35e5f DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@35e7f DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@35eaf DS:2628
    GOSUB L_3821d   '@35ecf
    GOTO L_36112   '@35edc
L_35ee9:
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@35eee DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35f1b DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@35f40 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35f70 DS:2628
    GOSUB L_3821d   '@35f95
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@35fa2 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + V_1f5a!   '@35fd2 DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - V_1f5a!   '@35ff7 DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@3602c DS:2628
    GOSUB L_3821d   '@3604c
    V_1f76! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - V_1f5a!   '@36059 DS:2612
    V_1f7a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@3608e DS:2628
    V_1f7e! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - V_1f5a!   '@360ae DS:2612
    V_1f82! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@360e0 DS:2628
    GOSUB L_3821d   '@36100
L_36112:
    V_1f8e$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e!))), (2)) + STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@36117 DS:261c,2658,265e
    V_1f5e! = V_1f5a!   '@3625e
    V_1f12$ = "TEXTO"   '@3626f DS:2644
    V_1f86! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.0   '@36281 DS:261c,2620
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46! + 4.0 * FX##(V_1f5a!) / 3.0   '@362e8 DS:2628,2632,2676
    GOSUB L_384a2   '@3631a
    V_1f8a! = 6.0   '@36327 DS:2666
L_3633e:
    L_BP13e% = (V_1f8a! = 15.0)   '@3633f DS:266a
    IF NOT ((LEN(A_1c90$(RT_CINT%(FX##(V_1f8a!)))) = 0 OR L_BP13e%) = 0) THEN GOTO L_364f0   '@36375
    IF NOT (FX##(VAL(RT_MID$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (2), (2)))) = FX##(V_0e14!) + V_185e!) THEN GOTO L_364cd   '@3638d
    V_1f8e$ = RT_MID2$((A_1c90$(RT_CINT%(FX##(V_1f8a!)))), (4))   '@363d5
    V_1f86! = (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - LEN(V_1f8e$) * 0.699999988079071044921875## * V_1f5a! / 2.0   '@36409 DS:261c,2620,266e
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f46!   '@36475 DS:2628
    V_1f5e! = 0.699999988079071044921875## * V_1f5a!   '@3649a DS:266e
    GOSUB L_384a2   '@364b0
    GOTO L_364f0   '@364bd
L_364cd:
    V_1f8a! = FX##(V_1f8a!) + 1.0   '@364cd DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3633e   '@364e8
L_364f0:
    V_1f5e! = 0.800000011920928955078125## * V_1f5a!   '@364f0 DS:2672
    V_1f8e$ = RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))), (2))   '@36506
    V_1f86! = -(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) / 3.0) - (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) / 6.0)   '@3654a DS:2530,260e,2612,2632,2666
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@36642 DS:2628
    GOSUB L_384a2   '@36662
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@3666f
    V_1f86! = -(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 1.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - 4.0 * FX##(V_1f5a!) / 3.0) - (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 4) = 0.0) * (FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 + FX##(V_1f5a!) * 4.0 / 6.0)   '@366dd DS:2530,260e,2612,2632,2666,2676
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! + V_1f46!   '@367df DS:2628
    GOSUB L_384a2   '@367ff
    L_BP142! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)   '@3680c
    L_BP146! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@36838 DS:260e
    CALL MIXT_082a_Maior(L_BP142!, L_BP146!, L_BP14a!)   '@36862
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP142!   '@36877
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP14a!))   '@3689d
    L_BP14e! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)   '@368c4
    L_BP152! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@368ed DS:260e
    CALL MIXT_0877_Menor(L_BP14e!, L_BP152!, L_BP156!)   '@3691c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP14e!   '@36931
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP156!))   '@36954 DS:260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@36980 DS:260e
L_369b1:
    V_0e18! = 0.0   '@369b6 DS:2530
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@369c7 DS:260e,261c,2636
    V_0e18! = FX##(-V_0e18!) * (A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999) - FX##(A_13fe%(RT_CINT%(FX##(V_0e14!))) < 9999) * V_0e14!   '@369d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@36a47 DS:261c,2636
    V_1f4a! = FX##(V_0e18!) * V_1f5a! * 1.5 + V_1f46! + (2.599999904632568359375## * V_1f5a! - FX##(V_1872! > 0.0) * V_1f5a!)   '@36a73 DS:2530,2628,26a4
    V_1f4e! = (FX##(V_1f4a!) - V_1f46!) / 12.0   '@36ace DS:26a8
    V_1f52! = (FX##(V_1f42!) - V_1f3e!) / 12.0   '@36ae9 DS:26a8
    V_1f12$ = "FORMA"   '@36b04 DS:268e
    L_BP15a! = V_0ddc!   '@36b16
    FOR V_0e14! = 0.0 TO L_BP15a!   '@36b28 DS:2530,260e
    FOR V_0e18! = 0.0 TO 10.0 STEP 2.0   '@36b30 DS:2530,2612,261c
    V_1f76! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@36b3e DS:2612
    V_1f7a! = FX##(V_0e18!) * V_1f52! + V_1f3e!   '@36b6e
    V_1f7e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@36b89 DS:2612
    V_1f82! = (V_0e18! + 0.300000011920928955078125##) * V_1f52! + V_1f3e!   '@36bb9 DS:26ac
    GOSUB L_3821d   '@36bd9
    V_1f76! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@36be6 DS:2612
    V_1f7a! = FX##(V_0e18!) * V_1f52! + V_1f3e!   '@36c34
    V_1f7e! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@36c4f DS:2612
    V_1f82! = (V_0e18! + 0.300000011920928955078125##) * V_1f52! + V_1f3e!   '@36c9d DS:26ac
    GOSUB L_3821d   '@36cbd
    V_1f76! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@36cca DS:2612
    V_1f7a! = FX##(V_1f46!) - V_1f5a! + (FX##(V_0e18!) + 1.0) * V_1f4e!   '@36cfa DS:260e
    V_1f7e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@36d22 DS:2612
    V_1f82! = FX##(V_1f46!) - V_1f5a! + (V_0e18! + 1.2999999523162841796875##) * V_1f4e!   '@36d52 DS:26b0
    GOSUB L_3821d   '@36d7a
    V_1f76! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@36d87 DS:2612
    V_1f7a! = FX##(V_1f46!) - V_1f5a! + (FX##(V_0e18!) + 1.0) * V_1f4e!   '@36dd5 DS:260e
    V_1f7e! = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@36dfd DS:2612
    V_1f82! = FX##(V_1f46!) - V_1f5a! + (V_0e18! + 1.2999999523162841796875##) * V_1f4e!   '@36e4b DS:26b0
    GOSUB L_3821d   '@36e73
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@36e80 DS:2612,261c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@36eac DS:260e
    RETURN   '@36ed8
L_36ee7:   ' sub-rotina (alvo de GOSUB)
    L_BP15e! = V_0ddc!   '@36eec
    FOR V_0e28! = 0.0 TO L_BP15e!   '@36efe DS:2530,260e
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + V_0eaa! + 1.0 OR (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - V_0eaa! - 1.0 OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1))) THEN GOTO L_37111   '@36f06 DS:260e,267a
    GOTO L_3713d   '@37109
L_37111:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@37111 DS:260e
L_3713d:
    V_1f12$ = "COTAS"   '@3713d DS:25fc
    V_1f4e! = V_1f46!   '@3714f
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_37188   '@37160 DS:260e
    GOTO L_375ab   '@37180
L_37188:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < FX##(0.0) OR FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) > FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) THEN GOTO L_37279   '@37188 DS:2530,260e
    GOTO L_373d1   '@37271
L_37279:
L_3727e:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2))))), (2))   '@37283
    V_1f86! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + FX##(V_1f5a!) * 4.0 / 3.0   '@372f1 DS:2612,2632,2676
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f46!   '@37330 DS:2628
    GOSUB L_384a2   '@37355
    V_0f7e! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@37362
    V_0f82! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@3738a
    GOSUB L_33b09   '@373b5
    RETURN   '@373c2
L_373d1:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) < FX##(0.0)) THEN GOTO L_37436   '@373d6 DS:2530,260e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3727e   '@3742e
L_37436:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0))))), (2))   '@37436 DS:260e
    V_1f86! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0 - FX##(LEN(V_1f8e$)) * V_1f5e! - FX##(V_1f5a!) * 4.0 / 3.0   '@374ab DS:2612,2632,2676
    V_1f8a! = 1.5 * FX##(V_0e18!) * V_1f5a! - V_1f5a! + V_1f46!   '@37503 DS:2628
    GOSUB L_384a2   '@37528
    V_0f7e! = A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)   '@37535 DS:260e
    V_0f82! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@37564
    GOSUB L_33b09   '@3758f
    RETURN   '@3759c
L_375ab:
    L_BP162! = V_0ddc!   '@375b0
    FOR V_0e28! = 1.0 TO L_BP162!   '@375c2 DS:260e
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_37676   '@375ca
    GOTO L_376a2   '@3766e
L_37676:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@37676 DS:260e
L_376a2:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_376cc   '@376a2 DS:260e
    RETURN   '@376c2
L_376cc:
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))))), (2))   '@376cc
    V_1f86! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0 + FX##(V_1f5a!) / 3.0   '@37739 DS:2612,2632
    V_1f8a! = FX##(V_0e18!) * 1.5 * V_1f5a! - V_1f5a! + V_1f46!   '@37773 DS:2628
    GOSUB L_384a2   '@37798
    V_0f7e! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)   '@377a5
    V_0f82! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@377cf
    GOSUB L_33b09   '@377f7
    RETURN   '@37804
L_37813:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_1862! = 0.0) THEN GOTO L_3783d   '@37818 DS:2530
    RETURN   '@37833
L_3783d:
    V_1f46! = FX##(V_1f46!) - V_1f5a!   '@3783d
    L_BP166! = V_1862!   '@37853
    FOR V_0e14! = 1.0 TO L_BP166!   '@37865 DS:260e
    V_1f5e! = V_1f5a!   '@3786c
    V_1f12$ = "FERRO"   '@3787d DS:263a
    V_1f76! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) * 10.0   '@3788f DS:2612
    V_1f7a! = V_1f46!   '@378bc
    V_1f7e! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) * 10.0   '@378cd DS:2612
    V_1f82! = V_1f46!   '@378fd
    GOSUB L_3821d   '@3790e
    V_1f8e$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1872! + V_1876! + V_0e14!))), (2)) + STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)))), (2))   '@3791b DS:2658,265e
    V_1f12$ = "TEXTO"   '@37a46 DS:2644
    V_1f86! = (FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) + A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5a! / 2.5   '@37a58 DS:2620,2624
    V_1f8a! = 0.5 * FX##(V_1f5a!) + V_1f46!   '@37abf DS:26b4
    GOSUB L_384a2   '@37ada
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@37ae7 DS:260e
    V_1f46! = 3.0 * FX##(V_1f5a!) + V_1f46!   '@37b13 DS:2632
    RETURN   '@37b2e
L_37b3d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030155_FUN_3000_0155
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@37b42
    V_1f5e! = V_1f5a! * 0.800000011920928955078125##   '@37b6c DS:2672
    IF NOT (V_186a! = 0.0) THEN GOTO L_37ba5   '@37b82 DS:2530
    GOTO L_381ee   '@37b9d
L_37ba5:
    L_BP16a! = V_186a!   '@37ba5
    FOR V_0e14! = 1.0 TO L_BP16a!   '@37bb7 DS:260e
    V_1f12$ = "COTAS"   '@37bbe DS:25fc
    V_1f76! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@37bd0 DS:2612
    V_1f7a! = V_1f4a!   '@37bff
    V_1f7e! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@37c10 DS:2612
    V_1f82! = V_1f4a!   '@37c40
    GOSUB L_3821d   '@37c51
    V_1f76! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@37c5e DS:2612
    V_1f7a! = V_1f4a! - FX##(V_1f5a!) / 2.0   '@37c8d DS:261c
    V_1f7e! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) * 10.0   '@37cab DS:2612
    V_1f82! = FX##(V_1f5a!) / 2.0 + V_1f4a!   '@37cda DS:261c
    GOSUB L_3821d   '@37cf5
    V_1f76! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@37d02 DS:2612
    V_1f7a! = V_1f4a! - FX##(V_1f5a!) / 2.0   '@37d32 DS:261c
    V_1f7e! = FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 10.0   '@37d50 DS:2612
    V_1f82! = FX##(V_1f5a!) / 2.0 + V_1f4a!   '@37d80 DS:261c
    GOSUB L_3821d   '@37d9b
    V_1f12$ = "TEXTO"   '@37da8 DS:2644
    V_1f8e$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 6)) + V_0e20!))), (2))   '@37dba DS:2688
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) / A_1c06!(RT_CINT%(FX##(V_0e14!)), 3)) + 1.0))), (2)) + V_1f8e$   '@37e1e DS:260e
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 4) > 1.0) THEN GOTO L_37f49   '@37ebc DS:260e
    V_1f8e$ = RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 4))), (2)) + "x" + V_1f8e$   '@37ef1 DS:26b8
L_37f49:
    V_1f86! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5e! / 2.0   '@37f49 DS:261c,2620
    V_1f8a! = 1.5 * FX##(V_1f5a!) + V_1f4a!   '@37fb2 DS:2628
    GOSUB L_384a2   '@37fcd
    V_1f8e$ = "c/" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 3))), (2))   '@37fda DS:26be
    V_1f86! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5e! / 2.0   '@38028 DS:261c,2620
    V_1f8a! = 0.300000011920928955078125## * V_1f5a! + V_1f4a!   '@38091 DS:26ac
    GOSUB L_384a2   '@380ac
    V_1f8e$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0))))), (2))   '@380b9
    V_1f86! = (FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) * 5.0 - FX##(LEN(V_1f8e$)) * V_1f5e! / 2.0   '@38129 DS:261c,2620
    V_1f8a! = V_1f4a! - 1.2000000476837158203125## * V_1f5a!   '@38192 DS:26a0
    GOSUB L_384a2   '@381b0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@381bd DS:260e
L_381ee:
    V_1f56! = 4.0 * FX##(V_1f5a!) + V_1f4a!   '@381f3 DS:2676
    RETURN   '@3820e
L_3821d:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_1856$ = "C") THEN GOTO L_38241   '@38222 DS:2534
    GOTO L_38395   '@38239
L_38241:
    PRINT #2, 0   '@3824b
    PRINT #2, "LINE"   '@38261 DS:26c4
    PRINT #2, 8   '@38278
    PRINT #2, V_1f12$   '@3828f
    PRINT #2, 10   '@382a6
    PRINT #2, RT_SNG!(FX##(V_1f76!) + 3000.0)   '@382bd DS:26cc
    PRINT #2, 20   '@382e4
    PRINT #2, V_1f7a!   '@382fb
    PRINT #2, 11   '@38316
    PRINT #2, RT_SNG!(FX##(V_1f7e!) + 3000.0)   '@3832d DS:26cc
    PRINT #2, 21   '@38354
    PRINT #2, V_1f82!   '@3836b
    RETURN   '@38386
L_38395:
    L_BP16e! = 1.0   '@3839a DS:260e
    IF NOT (V_1f12$ = "FERRO") THEN GOTO L_383d3   '@383ab DS:263a
    L_BP16e! = 2.0   '@383c2 DS:261c
L_383d3:
    IF NOT (V_1f12$ = "TEXTO") THEN GOTO L_383fb   '@383d3 DS:2644
    L_BP16e! = 3.0   '@383ea DS:2632
L_383fb:
    IF NOT (V_1f12$ = "COTAS") THEN GOTO L_38423   '@383fb DS:25fc
    L_BP16e! = 4.0   '@38412 DS:2676
L_38423:
    PRINT #2, "L          1 1 1"; L_BP16e!; RT_SNG!(FX##(V_1f76!) + 3000.0); V_1f7a!; RT_SNG!(FX##(V_1f7e!) + 3000.0); V_1f82!   '@38423 DS:26cc,26d0
    RETURN   '@38493
L_384a2:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_1856$ = "C") THEN GOTO L_384c6   '@384a7 DS:2534
    GOTO L_38608   '@384be
L_384c6:
    PRINT #2, 0   '@384d0
    PRINT #2, "TEXT"   '@384e6 DS:26e4
    PRINT #2, 8   '@384fd
    PRINT #2, V_1f12$   '@38514
    PRINT #2, 10   '@3852b
    PRINT #2, RT_SNG!(FX##(V_1f86!) + 3000.0)   '@38542 DS:26cc
    PRINT #2, 20   '@38569
    PRINT #2, V_1f8a!   '@38580
    PRINT #2, 40   '@3859b
    PRINT #2, V_1f5e!   '@385b2
    PRINT #2, 1   '@385cd
    PRINT #2, V_1f8e$   '@385e4
    GOTO L_38737   '@385fb
L_38608:
    L_BP16e! = 1.0   '@3860d DS:260e
    IF NOT (V_1f12$ = "FERRO") THEN GOTO L_38646   '@3861e DS:263a
    L_BP16e! = 2.0   '@38635 DS:261c
L_38646:
    IF NOT (V_1f12$ = "TEXTO") THEN GOTO L_3866e   '@38646 DS:2644
    L_BP16e! = 3.0   '@3865d DS:2632
L_3866e:
    IF NOT (V_1f12$ = "COTAS") THEN GOTO L_38696   '@3866e DS:25fc
    L_BP16e! = 4.0   '@38685 DS:2676
L_38696:
    PRINT #2, "T          1"; V_1f5e!; V_1f5e!; L_BP16e!; " 1 0 0"; RT_SNG!(FX##(V_1f86!) + 3000.0); V_1f8a!; LEN(V_1f8e$)   '@38696 DS:26cc,26ec,26fc
    PRINT #2, "           "; V_1f8e$   '@38712 DS:2706
L_38737:
    L_BP172! = FX##(LEN(V_1f8e$) + 2) * V_1f5e! + V_1f86!   '@3873c
    CALL MIXT_082a_Maior(V_1f6e!, L_BP172!, L_BP176!)   '@38763
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1f6e! = L_BP176!   '@38777
    RETURN   '@38782
L_38791:   ' entrada vinda de 030155_FUN_3000_0155
    ' END SUB   '@38791
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_DESENHO.BM'
'$INCLUDE: '../comum/MIXT.BM'
