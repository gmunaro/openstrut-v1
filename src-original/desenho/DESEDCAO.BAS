' ============================================================================
'  DESEDCAO - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/DESEDCAO/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 94b0927c5ca6476d816ee9032287217a0cf36008fcf8868ee6315b50eb111f27
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_DESENHO.BI'

' ---- variaveis do DESEDCAO fora do COMMON (DS do programa)
DIM SHARED V_1e06!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "DESEDCAO"
' ---- M_DESEDCAO @0x10030  (010030_M_DESEDCAO.lift.txt; evidence_id (assembly): ev_19c34e1d2e7165f114ae2e66d67c4460e0d2557ecf5052cea312536adf33ce47)
' @10030 inicio do programa (B$?EVT)
GOTO L_1019d   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_1019d:
L_101a2:   ' entrada vinda de 010349_F_10349
ON ERROR GOTO L_10766
RT_ONERR = &H10766   '@101a7
GOSUB L_1034e   '@101b6
CALL S_107a3   '@101c3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY pelo roteiro (entre comandos)
V_0dfc$ = "DESEDCAO"   '@101cd DS:1f7a
L_101e4:
ON ERROR GOTO L_10262
RT_ONERR = &H10262   '@101e9
V_0e30! = RT_FRE&("")   '@101f8 DS:1f20
L_BP0c% = (LEN(V_0dc8$) > 3)   '@10212
CHDIR RT_ARQ$(RT_LEFT$((V_0dc8$), (LEN(V_0dc8$) + L_BP0c%)))   '@10231
RT_CHAIN V_0dc8$ + "DESINIT"   '@10245 DS:1f86
L_10262:
RESUME L_10279   '@10267
L_10279:
BEEP   '@1027e
L_BP0c% = (V_0dc8$ = "A:\")   '@10288 DS:1f92
IF NOT ((V_0dc8$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_10341   '@102ad DS:1f9a
RT_VIEWPRINT 25, 25   '@102c2
RT_CLS 2   '@102d1
PRINT " Coloque o Disco DESINIT no Drive "; V_0dc8$;   '@102df DS:1fa2
CALL MIXT_07f1_LimpaTeclado   '@102f6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY pelo roteiro (entre comandos)
V_0e00$ = RT_INPUT$(1)   '@10300
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY pelo roteiro (entre comandos)
RT_CLS 2   '@1031c
RT_VIEWPRINT 1, 25   '@1032a
L_10341:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY no laco (B$EVCK)
GOTO L_101e4   '@10341
' ---- F_10349 @0x10349  (010349_F_10349.lift.txt; evidence_id (assembly): ev_bd77ab9e8d3b9c7ec848ee555efd785a6e9a041de37da8dbee4aa71b33c5651e)
L_1034e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_DESEDCAO
FOR V_1e06! = 1.0 TO 10.0   '@10353 DS:1fc8,1fcc
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_105f3
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 1   '@10360
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@1037a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@1038f DS:1fc8,1fcc
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@103b8
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@103e0
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@10408
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10430
FOR V_1e06! = 15.0 TO 18.0   '@10458 DS:1fc8,1fd0,1fd4
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_1061e
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 2   '@10466
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@10480
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@10495 DS:1fc8,1fd4
ON KEY(2) GOSUB L_1061e
RT_ONKEY 2, 2   '@104be
KEY(2) ON
RT_KEYESTADO 2, 1   '@104d1
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@104df
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@10507
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@1052f
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@10557
FOR V_1e06! = 19.0 TO 22.0   '@1057e DS:1fc8,1fd8,1fdc
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_10738
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 3   '@1058c
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@105a6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@105bb DS:1fc8,1fdc
RETURN   '@105e4
L_105f3:
BEEP   '@105f8
GOSUB L_1034e   '@10602
RETURN   '@1060f
L_1061e:
RT_SCREEN 0   '@10623
RT_VIEWPRINT 1, 25   '@10638
COLOR 7, 0, 0   '@1064a
RT_CLS 0   '@1066e
PRINT " Aguarde ..."   '@1067b DS:1fe0
PRINT ""   '@10689 DS:1f20
PRINT " Retorno ao Modulo Gerenciador"   '@10697 DS:1ff0
ON ERROR GOTO L_106e8
RT_ONERR = &H106e8   '@106a5
RT_RUN RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7)) + "SISTRUT"   '@106b4 DS:2012
L_106e8:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7))   '@106ed DS:201e
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@1071b DS:1f3e
RT_FIM   '@10729 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10738:
BEEP   '@1073d
GOSUB L_1034e   '@10747
RETURN L_101a2   '@1075e
' ---- F_10761 @0x10761  (010761_F_10761.lift.txt; evidence_id (assembly): ev_d783820500bfb360ca04fc8f08f431360aa0405dbf2edef5c4ded6b67351e226)
L_10766:   ' entrada vinda de 010030_M_DESEDCAO
RESUME L_1077d   '@1076b
L_1077d:
ON ERROR GOTO L_10766
RT_ONERR = &H10766   '@10782
CALL S_40137   '@10791
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105f3, L_1061e, L_10738   ' ON KEY pelo roteiro (entre comandos)
GOTO L_12309   '@1079b
' ---- RT_EA @0x12309  (012309_RT_EA.lift.txt; evidence_id (assembly): ev_035afa0d0e5e6f6ef8e8c58fb0d891d1790d3a2d94faf4e61505005f6e16c49c)
L_12309:   ' entrada vinda de 010761_F_10761
RT_FIM   ' @12309 B$CENP (inicio/fim do modulo)
' ---- M_DESEDLON @0x20030  (020030_M_DESEDLON.lift.txt; evidence_id (assembly): ev_4b0e533285247af91f984baf124bc69668fdff41165c8231d90db2541a4cbbbf)
' @20030 inicio do programa (B$?EVT)
GOTO L_2ad7b   '@2013e
' ---- RT_EA @0x2ad7b  (02ad7b_RT_EA.lift.txt; evidence_id (assembly): ev_c555ab825012e6b2b662ec9ffd1a0b93cc2d72d58fef53a493ff697194ba1021)
L_2ad7b:   ' entrada vinda de 020030_M_DESEDLON
RT_FIM   ' @2ad7b B$CENP (inicio/fim do modulo)
' ---- M_DESPARTE @0x30030  (030030_M_DESPARTE.lift.txt; evidence_id (assembly): ev_6dfe358f6287f9e67cd49d5e353dc4f4160c97e657a5321a327e8f4731f209fe)
' @30030 inicio do programa (B$?EVT)
GOTO L_34ca8   '@3012f
' ---- FUN_3000_4ca8 @0x34ca8  (034ca8_FUN_3000_4ca8.lift.txt; evidence_id (assembly): ev_9c7721010b8ed7255852e42ca028e7933da84c7eadfd2a00edcc746b9e9a9707)
L_34ca8:   ' entrada vinda de 030030_M_DESPARTE
GOTO L_35a63   '@34ca8
' ---- FUN_3000_5a63 @0x35a63  (035a63_FUN_3000_5a63.lift.txt; evidence_id (assembly): ev_ef8bfc575f849e0bc203162490e1304ca0966bbb2cae96075e52441be76d9a0e)
L_35a63:   ' entrada vinda de 034ca8_FUN_3000_4ca8
GOTO L_38b7b   '@35a63
' ---- FUN_3000_8b7b @0x38b7b  (038b7b_FUN_3000_8b7b.lift.txt; evidence_id (assembly): ev_b837469659e1650e514a1e6406acc45a73af7a7cfcf16e7f82570849215dc704)
L_38b7b:   ' entrada vinda de 035a63_FUN_3000_5a63
GOTO L_39440   '@38b7b
' ---- RT_EA @0x39440  (039440_RT_EA.lift.txt; evidence_id (assembly): ev_9fbf3e549eeb191964ed7280d7c78003a0b93e9b73a3b6fdb059978bfdd80e22)
L_39440:   ' entrada vinda de 038b7b_FUN_3000_8b7b
RT_FIM   ' @39440 B$CENP (inicio/fim do modulo)
' ---- M_DESAUXCA @0x40030  (040030_M_DESAUXCA.lift.txt; evidence_id (assembly): ev_1c65569616e2cd7a3697c35cba788293b0b8b7297550d3ded8ae8e0163688281)
' @40030 inicio do programa (B$?EVT)
GOTO L_402ac   '@4012f
' ---- FUN_4000_02ac @0x402ac  (0402ac_FUN_4000_02ac.lift.txt; evidence_id (assembly): ev_955721b9a2fec777cf27c548069bded174fdb1e6016276f1f42bf3dad8f84f7b)
L_402ac:   ' entrada vinda de 040030_M_DESAUXCA
GOTO L_40d7a   '@402ac
' ---- RT_EA @0x40d7a  (040d7a_RT_EA.lift.txt; evidence_id (assembly): ev_5c77539a688eca74af6d0bcdd40423a5c8c5f8e89a296a02130a80046592402b)
L_40d7a:   ' entrada vinda de 0402ac_FUN_4000_02ac
RT_FIM   ' @40d7a B$CENP (inicio/fim do modulo)
' ---- M_DESEDTRA @0x50030  (050030_M_DESEDTRA.lift.txt; evidence_id (assembly): ev_eaba215d292076212749082b2f691ed20655e666cadf8f243560ead541b38847)
' @50030 inicio do programa (B$?EVT)
GOTO L_54431   '@5013e
' ---- RT_EA @0x54431  (054431_RT_EA.lift.txt; evidence_id (assembly): ev_05faf98ceb07b9fa224dd778d054f843cd3e84a9f4d5ce35f69bbe959f8e500e)
L_54431:   ' entrada vinda de 050030_M_DESEDTRA
RT_FIM   ' @54431 B$CENP (inicio/fim do modulo)
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
    V_1e06! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_105f3: BEEP; GOSUB L_1034e; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_1061e: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10738: sai da SUB (BEEP; GOSUB L_1034e; RETURN L_101a2)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H10262: ON ERROR GOTO L_10262
        CASE &H106e8: ON ERROR GOTO L_106e8
        CASE &H10766: ON ERROR GOTO L_10766
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_107a3   ' entrada de SUB/FUNCTION (B$ENRA, locais 68 bytes) (0x107a3)
    DIM L_BP10%
    DIM L_BP12%
    DIM L_BP14%
    DIM L_BP16%
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1c%
    DIM L_BP1e%
    DIM L_BP20%
    DIM L_BP22%
    DIM L_BP24%
    DIM L_BP26%
    DIM L_BP28%
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP2e%
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46!
    DIM L_BP4a!
    DIM L_BP4e!
    ' ---- FUN_1000_07a3 @0x107a3  (0107a3_FUN_1000_07a3.lift.txt; evidence_id (assembly): ev_cbac09c0a566c2bceeb32b0f1cff4a4e01ca82a1372758191ec615ac9824062b)
    L_BP10% = (V_0e04$ = "INILONG")   '@107b0 DS:203c
    IF NOT ((V_0e04$ = "INITRAN" OR L_BP10%) <> 0) THEN GOTO L_107f2   '@107d5 DS:2048
    GOTO L_10911   '@107ea
L_107f2:
    L_BP12% = (V_17f2$ = "CGA")   '@107f2 DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP12%) <> 0) THEN GOTO L_10844   '@10817 DS:205c
    RT_SCREEN 2   '@1082c
L_10844:
    L_BP14% = (V_17f2$ = "EGA")   '@10844 DS:2064
    IF NOT ((V_17f2$ = "VGA" OR L_BP14%) <> 0) THEN GOTO L_108af   '@10869 DS:206c
    RT_SCREEN 9   '@1087e
    COLOR , 1   '@10894
L_108af:
    IF NOT (V_17f2$ = "HER") THEN GOTO L_108e1   '@108af DS:2074
    RT_SCREEN 3   '@108c6
L_108e1:
    RT_CLS 0   '@108e1
    CALL S_34cb0   '@108ee
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_35a6b   '@108f8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_38b83   '@10902
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_10911:
    GOSUB L_10930   '@10916
    GOTO L_122f8   '@10923
    ' ---- F_1092b @0x1092b  (01092b_F_1092b.lift.txt; evidence_id (assembly): ev_9b1166af0b508a315408a7dc65a803a5a08f8c1b6daf6382ef8d09b3ca7d9545)
L_10930:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0107a3_FUN_1000_07a3
    IF NOT (V_0e04$ = "INILONG") THEN GOTO L_10954   '@10935 DS:203c
    GOTO L_10a23   '@1094c
L_10954:
    IF NOT (V_0e04$ = "INITRAN") THEN GOTO L_10973   '@10954 DS:2048
    GOTO L_10ab9   '@1096b
L_10973:
    L_BP16% = (V_17f2$ = "CGA")   '@10973 DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP16%) <> 0) THEN GOTO L_10a08   '@10998 DS:205c
    RT_GCAIXA 0, 0, RT_SNG!(FX##(V_0e5c!) - 1.0), RT_SNG!(FX##(V_0e60!) - 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1D76(1): RT_GFIM   '@109ad DS:207c
    GOTO L_10a1e   '@10a00
L_10a08:
    PCOPY 0, 1   '@10a08
L_10a1e:
L_10a23:
    CALL S_20146   '@10a28
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0dfc$ = "INICIA") THEN GOTO L_10a5d   '@10a32 DS:2080
    GOSUB L_10d16   '@10a49
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10a23   '@10a56
L_10a5d:
    IF NOT (V_0dfc$ = "ZOOM") THEN GOTO L_10a88   '@10a5d DS:208a
    GOSUB L_11367   '@10a74
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10a23   '@10a81
L_10a88:
    IF NOT (V_0dfc$ = "ESFORCOS") THEN GOTO L_10ab4   '@10a88 DS:2092
    GOSUB L_110ee   '@10a9f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10a23   '@10aac
L_10ab4:
L_10ab9:
    CALL S_50146   '@10abe
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0dfc$ = "INICIA") THEN GOTO L_10af3   '@10ac8 DS:2080
    GOSUB L_10f02   '@10adf
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10ab9   '@10aec
L_10af3:
    IF NOT (V_0dfc$ = "ZOOMEST") THEN GOTO L_10b1e   '@10af3 DS:209e
    GOSUB L_11367   '@10b0a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10ab9   '@10b17
L_10b1e:
    IF NOT (V_0dfc$ = "ESFORCOS") THEN GOTO L_10b4a   '@10b1e DS:2092
    GOSUB L_110ee   '@10b35
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10ab9   '@10b42
L_10b4a:
    IF NOT (V_0dfc$ = "RET") THEN GOTO L_10b7b   '@10b4a DS:20aa
    V_0dfc$ = ""   '@10b61 DS:1f20
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10a23   '@10b73
L_10b7b:
    RT_VIEWPRINT 23, 25   '@10b7b
    RT_CLS 2   '@10b8d
    BEEP   '@10b9b
    PRINT " Gravo a Viga Editada em <"; V_1812$; "R"; RT_MID2$((STR$(V_0e58!)), (2)); RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)); RT_MID$((V_0dd8$), (1), (4));   '@10ba5 DS:20b2,20d0,20d6,20da
    CALL MIXT_07f1_LimpaTeclado   '@10c42
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT ".EDV>  S/*N* ", V_0dfc$   '@10c4c DS:20de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) = "S") THEN GOTO L_10c90   '@10c66 DS:20f0
    GOSUB L_11637   '@10c83
L_10c90:
    CALL MIXT_07f1_LimpaTeclado   '@10c90
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Confirme o termino da Edicao  SIM/*N* ", V_0dfc$   '@10c9a DS:20f6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "SIM") THEN GOTO L_10cd9   '@10cb4 DS:2122
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_10a23   '@10cd1
L_10cd9:
    V_0e04$ = ""   '@10cd9 DS:1f20
    RT_CLS 2   '@10ceb
    PRINT " Aguarde ...";   '@10cf9 DS:1fe0
    RETURN   '@10d07
L_10d16:   ' sub-rotina (alvo de GOSUB)
    L_BP18% = (V_17f2$ = "CGA")   '@10d1b DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP18%) <> 0) THEN GOTO L_10dda   '@10d40 DS:205c
    RT_GCAIXA 0, 0, RT_SNG!(FX##(V_0e5c!) - 1.0), RT_SNG!(FX##(V_0e60!) - 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1DD2(1): RT_GFIM   '@10d55 DS:207c
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1D76(1), PSET: RT_GFIM   '@10da8
    GOTO L_10df0   '@10dd2
L_10dda:
    PCOPY 1, 0   '@10dda
L_10df0:
    RT_CLS 2   '@10df0
    PRINT " Inicializacao de Ferragem Longitudinal"   '@10dfe DS:212a
    RT_LINEINPUT " Abandono TODAS as modificacoes e retorno a Armacao acima SIM/*N* ", V_0dfc$   '@10e0c DS:2156
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "SIM") THEN GOTO L_10ed5   '@10e26 DS:2122
    L_BP1a% = (V_17f2$ = "CGA")   '@10e43 DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP1a%) <> 0) THEN GOTO L_10eaf   '@10e68 DS:205c
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1DD2(1), PSET: RT_GFIM   '@10e7d
    GOTO L_10ec6   '@10ea7
L_10eaf:
    V_0dfc$ = "RET"   '@10eaf DS:20aa
L_10ec6:
    RETURN   '@10ec6
L_10ed5:
    PRINT " Aguarde ...";   '@10ed5 DS:1fe0
    V_0e04$ = "INILONG"   '@10ee3 DS:203c
    GOTO L_122f8   '@10ef5
    ' ---- F_10efd @0x10efd  (010efd_F_10efd.lift.txt; evidence_id (assembly): ev_b444cfb97c9340ebe4a47fd804d396d75475705b3e589530c1b472c60d37f574)
L_10f02:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01092b_F_1092b
    L_BP1c% = (V_17f2$ = "CGA")   '@10f07 DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP1c%) <> 0) THEN GOTO L_10fc6   '@10f2c DS:205c
    RT_GCAIXA 0, 0, RT_SNG!(FX##(V_0e5c!) - 1.0), RT_SNG!(FX##(V_0e60!) - 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1DD2(1): RT_GFIM   '@10f41 DS:207c
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1D76(1), PSET: RT_GFIM   '@10f94
    GOTO L_10fdc   '@10fbe
L_10fc6:
    PCOPY 1, 0   '@10fc6
L_10fdc:
    RT_CLS 2   '@10fdc
    PRINT " Inicializacao de Ferragem Transversal"   '@10fea DS:219c
    RT_LINEINPUT " Abandono TODAS as modificacoes e retorno a Armacao acima SIM/*N* ", V_0dfc$   '@10ff8 DS:2156
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "SIM") THEN GOTO L_110c1   '@11012 DS:2122
    L_BP1e% = (V_17f2$ = "CGA")   '@1102f DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP1e%) <> 0) THEN GOTO L_1109b   '@11054 DS:205c
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1DD2(1), PSET: RT_GFIM   '@11069
    GOTO L_110b2   '@11093
L_1109b:
    V_0dfc$ = "RET"   '@1109b DS:20aa
L_110b2:
    RETURN   '@110b2
L_110c1:
    PRINT " Aguarde ...";   '@110c1 DS:1fe0
    V_0e04$ = "INITRAN"   '@110cf DS:2048
    GOTO L_122f8   '@110e1
    ' ---- F_110e9 @0x110e9  (0110e9_F_110e9.lift.txt; evidence_id (assembly): ev_eef4cfabd11f8a842190520beaf232da4b5e0b2d96d526b9b603f28eea710519)
L_110ee:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01092b_F_1092b
    RT_CLS 2   '@110f3
    L_BP20% = (V_0e80$ = "VIDEO")   '@11101 DS:21c6
    L_BP22% = V_0e80$ = "FOTO" OR L_BP20%   '@11126 DS:21d0
    L_BP24% = (V_0e7c$ = "S")   '@11141 DS:20f0
    IF NOT (((V_0e84$ = "S" OR L_BP24%) AND L_BP22%) <> 0) THEN GOTO L_11179   '@11159 DS:20f0
    GOTO L_111ca   '@11171
L_11179:
    PRINT " Desenho Diagramas e Armacoes"   '@11179 DS:21d8
    PRINT " Diagramas de Esforcos/Armacao nao foram solicitados ou impressos em escala ";   '@11187 DS:21fa
    CALL MIXT_07f1_LimpaTeclado   '@11195
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@1119f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@111bb
L_111ca:
    L_BP26% = (V_17f2$ = "CGA")   '@111cf DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP26%) <> 0) THEN GOTO L_1125c   '@111f4 DS:205c
    RT_GCAIXA 0, 0, RT_SNG!(FX##(V_0e5c!) - 1.0), RT_SNG!(FX##(V_0e60!) - 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1DD2(1): RT_GFIM   '@11209 DS:207c
L_1125c:
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1DA4(1), PSET: RT_GFIM   '@1125c
    LOCATE 25, 1   '@11286
    PRINT " Qualquer Tecla para Continuar ";   '@112a1 DS:224a
    CALL MIXT_07f1_LimpaTeclado   '@112af
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@112b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28% = (V_17f2$ = "CGA")   '@112d5 DS:2054
    IF NOT ((V_17f2$ = "MCG" OR L_BP28%) <> 0) THEN GOTO L_11341   '@112fa DS:205c
    RT_GPONTO 0, 0, 0: PUT (RG_GX1, RG_GY1), A_1DD2(1), PSET: RT_GFIM   '@1130f
    GOTO L_11358   '@11339
L_11341:
    V_0dfc$ = "RET"   '@11341 DS:20aa
L_11358:
    RETURN   '@11358
L_11367:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01092b_F_1092b
    RT_CLS 2   '@1136c
    PRINT " Ampliacao de Trecho do Desenho"   '@1137a DS:226e
    LOCATE 25, 1   '@11388
    PRINT " (Desenho total da Viga, do Tramo"; RT_SNG!(1.0 - FX##(V_0de0!)); " ao Tramo"; RT_SNG!(FX##(V_0ddc!) + V_0de4!); ")";   '@113a3 DS:1fc8,2292,22b8,22c6
    LOCATE 24, 1   '@113f5
    PRINT " Desenhar do Tramo i a j  i,j  *"; RT_MID2$((STR$(V_18fe!)), (2)); ","; RT_MID2$((STR$(V_1902!)), (2));   '@11410 DS:22cc,22f0
    PRINT "* ";   '@11469 DS:22f6
    CALL MIXT_0049_Le2Campos(V_0e04$, V_0e00$)   '@11477
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a% = (LEN(V_0e04$) = 0)   '@11489
    IF NOT ((LEN(V_0e00$) = 0 AND L_BP2a%) <> 0) THEN GOTO L_114d9   '@114a6
    V_0dfc$ = ""   '@114bd DS:1f20
    RETURN   '@114cf
L_114d9:
    IF NOT (LEN(V_0e04$) > 0) THEN GOTO L_11508   '@114d9
    V_0f7e! = VAL(V_0e04$)   '@114ee
L_11508:
    IF NOT (LEN(V_0e00$) > 0) THEN GOTO L_11537   '@11508
    V_0f82! = VAL(V_0e00$)   '@1151d
L_11537:
    L_BP2c% = (V_0f7e! > V_0f82! OR (FX##(V_0ddc!) + V_0de4! < FX##(V_0f82!) OR 1.0 - FX##(V_0de0!) > FX##(V_0f7e!)))   '@11537 DS:1fc8
    L_BP2e% = INT(FX##(V_0f7e!)) <> FX##(V_0f7e!) OR L_BP2c%   '@115a2
    IF NOT ((INT(FX##(V_0f82!)) <> FX##(V_0f82!) OR L_BP2e%) <> 0) THEN GOTO L_115f4   '@115c6
    BEEP   '@115e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11367   '@115ec
L_115f4:
    V_18fe! = V_0f7e!   '@115f4
    V_1902! = V_0f82!   '@11605
    V_0dfc$ = "RET"   '@11616 DS:20aa
    RETURN   '@11628
L_11637:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01092b_F_1092b
    IF RT_DISP%(V_1812$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".EDV") THEN OPEN RT_ARQ$(V_1812$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".EDV") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_1812$ + "R" + RT_MID2$((STR$(V_0e58!)), (2)) + RT_STRINGC$(((V_0e58! > 99.0) + (V_0e58! > 9.0) + 2), (95)) + RT_MID$((V_0dd8$), (1), (4)) + ".EDV") FOR OUTPUT AS #1   '@1163c DS:20d0,20d6,20da,22fc,2302
    PRINT #1, V_0dd4$   '@116ea
    PRINT #1, RT_SNG!(A_1926!(RT_CINT%(FX##(V_0ddc!)), 0) - FX##(V_0de4! = 1.0) * A_1926!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1) + A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1) - (FX##(A_1a0c!(1, 0)) - A_1926!(0, 0) + FX##(V_0de0! = 1.0) * A_1926!(0, 1)))   '@11701 DS:1fc8
    PRINT #1, V_0eba!   '@11802
    PRINT #1, V_0ebe!   '@1181d
    PRINT #1, V_0ec6!   '@11838
    PRINT #1, V_0eca$   '@11853
    PRINT #1, V_0eaa!   '@1186a
    PRINT #1, V_0ea6!   '@11885
    PRINT #1, A_1cbe%(RT_CINT%(FX##(V_0e58!)))   '@118a0
    PRINT #1, V_0ddc!   '@118cd
    PRINT #1, V_0de0!   '@118e8
    PRINT #1, V_0de4!   '@11903
    PRINT #1, V_185e!   '@1191e
    IF NOT (V_185e! = 0.0) THEN GOTO L_1195c   '@11939 DS:230a
    GOTO L_11a80   '@11954
L_1195c:
    L_BP32! = V_185e!   '@1195c
    FOR V_0e14! = 1.0 TO L_BP32!   '@1196d DS:1fc8
    FOR V_0e18! = 0.0 TO 3.0   '@11974 DS:1fc8,230a,230e
    PRINT #1, A_1af2!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11982
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@119be DS:1fc8,230e
    PRINT #1, A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)   '@119e7
    PRINT #1, A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@11a1b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11a50 DS:1fc8
L_11a80:
    PRINT #1, V_1872!   '@11a85
    IF NOT (V_1872! = 0.0) THEN GOTO L_11ac3   '@11aa0 DS:230a
    GOTO L_11b7f   '@11abb
L_11ac3:
    L_BP36! = V_1872!   '@11ac3
    FOR V_0e14! = 1.0 TO L_BP36!   '@11ad4 DS:1fc8
    FOR V_0e18! = 0.0 TO 5.0   '@11adc DS:1fc8,230a,2312
    PRINT #1, A_1bd8!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11aea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@11b26 DS:1fc8,2312
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11b4f DS:1fc8
L_11b7f:
    PRINT #1, V_1866!   '@11b84
    IF NOT (V_1866! = 0.0) THEN GOTO L_11bc2   '@11b9f DS:230a
    GOTO L_11ce6   '@11bba
L_11bc2:
    L_BP3a! = V_1866!   '@11bc2
    FOR V_0e14! = 1.0 TO L_BP3a!   '@11bd3 DS:1fc8
    FOR V_0e18! = 0.0 TO 3.0   '@11bda DS:1fc8,230a,230e
    PRINT #1, A_1ac4!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11be8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@11c24 DS:1fc8,230e
    PRINT #1, A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)   '@11c4d
    PRINT #1, A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@11c81
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11cb6 DS:1fc8
L_11ce6:
    PRINT #1, V_1876!   '@11ceb
    IF NOT (V_1876! = 0.0) THEN GOTO L_11d29   '@11d06 DS:230a
    GOTO L_11de5   '@11d21
L_11d29:
    L_BP3e! = V_1876!   '@11d29
    FOR V_0e14! = 1.0 TO L_BP3e!   '@11d3a DS:1fc8
    FOR V_0e18! = 0.0 TO 5.0   '@11d42 DS:1fc8,230a,2312
    PRINT #1, A_1baa!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11d50
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@11d8c DS:1fc8,2312
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11db5 DS:1fc8
L_11de5:
    PRINT #1, V_1862!   '@11dea
    IF NOT (V_1862! = 0.0) THEN GOTO L_11e28   '@11e05 DS:230a
    GOTO L_11ee3   '@11e20
L_11e28:
    L_BP42! = V_1862!   '@11e28
    FOR V_0e14! = 1.0 TO L_BP42!   '@11e39 DS:1fc8
    FOR V_0e18! = 0.0 TO 3.0   '@11e40 DS:1fc8,230a,230e
    PRINT #1, A_1b7c!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11e4e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@11e8a DS:1fc8,230e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11eb3 DS:1fc8
L_11ee3:
    PRINT #1, V_186e!   '@11ee8
    IF NOT (V_186e! = 0.0) THEN GOTO L_11f26   '@11f03 DS:230a
    GOTO L_1204b   '@11f1e
L_11f26:
    L_BP46! = FX##(V_0ddc!) + V_0de4!   '@11f26
    FOR V_0e14! = 0.0 TO L_BP46!   '@11f3c DS:1fc8,230a
    FOR V_0e18! = 0.0 TO 3.0   '@11f44 DS:1fc8,230a,230e
    PRINT #1, A_1c34!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@11f52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@11f8e DS:1fc8,230e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@11fb7 DS:1fc8
    FOR V_0e14! = 0.0 TO 5.0   '@11fe2 DS:1fc8,230a,2312
    PRINT #1, A_1a96%(RT_CINT%(FX##(V_0e14!)))   '@11ff0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1201d DS:1fc8,2312
L_1204b:
    PRINT #1, V_186a!   '@12050
    IF NOT (V_186a! = 0.0) THEN GOTO L_1208e   '@1206b DS:230a
    GOTO L_12149   '@12086
L_1208e:
    L_BP4a! = V_186a!   '@1208e
    FOR V_0e14! = 1.0 TO L_BP4a!   '@1209f DS:1fc8
    FOR V_0e18! = 0.0 TO 6.0   '@120a6 DS:1fc8,230a,2316
    PRINT #1, A_1c06!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(V_0e18!)))   '@120b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@120f0 DS:1fc8,2316
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@12119 DS:1fc8
L_12149:
    PRINT #1, A_1c90$(2)   '@1214e
    PRINT #1, A_1c90$(3)   '@12172
    PRINT #1, A_1c90$(4)   '@12196
    PRINT #1, A_1c90$(5)   '@121ba
    L_BP4e! = FX##(V_0ddc!) + V_0de4!   '@121de
    FOR V_0e18! = 0.0 TO L_BP4e!   '@121f4 DS:1fc8,230a
    PRINT #1, A_128e!(RT_CINT%(FX##(V_0e18!)), 4)   '@121fc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@12231 DS:1fc8
    V_0e18! = 6.0   '@12259 DS:2316
L_12270:
    IF NOT (LEN(A_1c90$(RT_CINT%(FX##(V_0e18!)))) <> 0) THEN GOTO L_122dc   '@12271
    PRINT #1, A_1c90$(RT_CINT%(FX##(V_0e18!)))   '@12294
    V_0e18! = FX##(V_0e18!) + 1.0   '@122bf DS:1fc8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_12270   '@122d5
L_122dc:
    RT_CLOSE   '@122dc (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    RETURN   '@122e9
L_122f8:   ' entrada vinda de 0107a3_FUN_1000_07a3, 01092b_F_1092b, 010efd_F_10efd
    ' @122f8 libera strings locais (L_BP0e)
    ' END SUB   '@12301
END SUB

SUB S_20146   ' entrada de SUB/FUNCTION (B$ENRA, locais 484 bytes) (0x20146)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16$
    DIM L_BP1a$
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP28%
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP2e%
    DIM L_BP30%
    DIM L_BP32%
    DIM L_BP34%
    DIM L_BP36%
    DIM L_BP38%
    DIM L_BP3a%
    DIM L_BP3c%
    DIM L_BP3e%
    DIM L_BP40%
    DIM L_BP42%
    DIM L_BP44%
    DIM L_BP46%
    DIM L_BP48%
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP56%
    DIM L_BP58%
    DIM L_BP5a%
    DIM L_BP5c%
    DIM L_BP5e%
    DIM L_BP60%
    DIM L_BP62%
    DIM L_BP64%
    DIM L_BP66%
    DIM L_BP68%
    DIM L_BP6a%
    DIM L_BP6c%
    DIM L_BP6e%
    DIM L_BP70%
    DIM L_BP72%
    DIM L_BP74%
    DIM L_BP76%
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
    DIM L_BPa4%
    DIM L_BPa6%
    DIM L_BPaa!
    DIM L_BPae$
    DIM L_BPb0%
    DIM L_BPb2%
    DIM L_BPb4%
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
    DIM L_BPe6%
    DIM L_BPe8%
    DIM L_BPea%
    DIM L_BPee!
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe!
    ' ---- FUN_2000_0146 @0x20146  (020146_FUN_2000_0146.lift.txt; evidence_id (assembly): ev_2e155a4cf0275647267c2cd9e5c648ef37c293dccb1d31cb9b15313ee459b123)
    IF NOT (V_0dfc$ = "RET") THEN GOTO L_20172   '@20153 DS:2320
    GOTO L_20536   '@2016a
L_20172:
L_20177:
    RT_VIEWPRINT 23, 25   '@2017c
    RT_CLS 2   '@2018e
    PRINT " Edicao de Ferragem Longitudinal"   '@2019c DS:2328
    PRINT " <C>riar  <A>lterar  <J>untar  <S>eparar  <D>eletar  <I>niciar  <E>sforcos"   '@201aa DS:234c
    PRINT " <Z>oom   <P>orta estribo      <F>erragem transversal ";   '@201b8 DS:239a
    CALL MIXT_07f1_LimpaTeclado   '@201c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@201d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = RT_FRE&("")   '@201ec DS:23d4
    L_BP16$ = V_0dfc$   '@20206
    IF NOT (L_BP16$ <> "C") THEN GOTO L_20241   '@20218 DS:23d8
    IF NOT (L_BP16$ = "c") THEN GOTO L_2025e   '@2022f DS:23de
L_20241:
    GOSUB L_20586   '@20241
    GOTO L_20503   '@2024e
L_2025e:
    IF NOT (L_BP16$ <> "A") THEN GOTO L_20282   '@2025e DS:23e4
    IF NOT (L_BP16$ = "a") THEN GOTO L_2029f   '@20270 DS:23ea
L_20282:
    GOSUB L_242ee   '@20282
    GOTO L_20503   '@2028f
L_2029f:
    IF NOT (L_BP16$ <> "J") THEN GOTO L_202c3   '@2029f DS:23f0
    IF NOT (L_BP16$ = "j") THEN GOTO L_202e0   '@202b1 DS:23f6
L_202c3:
    GOSUB L_267de   '@202c3
    GOTO L_20503   '@202d0
L_202e0:
    IF NOT (L_BP16$ <> "S") THEN GOTO L_20304   '@202e0 DS:23fc
    IF NOT (L_BP16$ = "s") THEN GOTO L_20321   '@202f2 DS:2402
L_20304:
    GOSUB L_28ab4   '@20304
    GOTO L_20503   '@20311
L_20321:
    IF NOT (L_BP16$ <> "D") THEN GOTO L_20345   '@20321 DS:2408
    IF NOT (L_BP16$ = "d") THEN GOTO L_20362   '@20333 DS:240e
L_20345:
    GOSUB L_29bd6   '@20345
    GOTO L_20503   '@20352
L_20362:
    IF NOT (L_BP16$ <> "I") THEN GOTO L_20386   '@20362 DS:2414
    IF NOT (L_BP16$ = "i") THEN GOTO L_203c7   '@20374 DS:241a
L_20386:
    IF NOT (V_1826$ = "*") THEN GOTO L_203a5   '@20386 DS:2420
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20177   '@2039d
L_203a5:
    V_0dfc$ = "INICIA"   '@203a5 DS:2426
    GOTO L_2ad57   '@203b7
L_203c7:
    IF NOT (L_BP16$ <> "E") THEN GOTO L_203eb   '@203c7 DS:2430
    IF NOT (L_BP16$ = "e") THEN GOTO L_2042c   '@203d9 DS:2436
L_203eb:
    IF NOT (V_1826$ = "*") THEN GOTO L_2040a   '@203eb DS:2420
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20177   '@20402
L_2040a:
    V_0dfc$ = "ESFORCOS"   '@2040a DS:243c
    GOTO L_2ad57   '@2041c
L_2042c:
    IF NOT (L_BP16$ <> "Z") THEN GOTO L_20450   '@2042c DS:2448
    IF NOT (L_BP16$ = "z") THEN GOTO L_20472   '@2043e DS:244e
L_20450:
    V_0dfc$ = "ZOOM"   '@20450 DS:2454
    GOTO L_2ad57   '@20462
L_20472:
    IF NOT (L_BP16$ <> "P") THEN GOTO L_20496   '@20472 DS:245c
    IF NOT (L_BP16$ = "p") THEN GOTO L_204b3   '@20484 DS:2462
L_20496:
    GOSUB L_2aa1d   '@20496
    GOTO L_20503   '@204a3
L_204b3:
    IF NOT (L_BP16$ <> "F") THEN GOTO L_204d7   '@204b3 DS:2468
    IF NOT (L_BP16$ = "f") THEN GOTO L_204e7   '@204c5 DS:246e
L_204d7:
    GOTO L_2ad57   '@204d7
L_204e7:
    BEEP   '@204e7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20177   '@204f1
L_20503:
    IF NOT (V_0dfc$ = "RET") THEN GOTO L_20527   '@20508 DS:2320
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20177   '@2051f
L_20527:
    CALL S_402b4   '@20527
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_20536:
    RT_VIEWPRINT 1, 25   '@2053b
    RT_CLS 1   '@2054d
    CALL S_34cb0   '@2055b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_35a6b   '@20565
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_38b83   '@2056f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20177   '@20579
    ' ---- F_20581 @0x20581  (020581_F_20581.lift.txt; evidence_id (assembly): ev_55ac1bb2f8849c0ce5cb712d0e96e011a8af1af29b2c9e1c1a961852108a11a6)
L_20586:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@2058b
    PRINT " Criacao de Ferragem"   '@20599 DS:2474
    PRINT " <P>ositivo  <N>egativo  pe<L>e  <G>rampo  <R>etorno ";   '@205a7 DS:248c
    V_0dfc$ = RT_INPUT$(1)   '@205b5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a$ = V_0dfc$   '@205d1
    IF NOT (L_BP1a$ <> "R") THEN GOTO L_2060c   '@205e3 DS:24c6
    IF NOT (L_BP1a$ = "r") THEN GOTO L_20630   '@205fa DS:24cc
L_2060c:
    V_0dfc$ = "RET"   '@2060c DS:2320
    RETURN   '@2061e
    ' @20628 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_20717   '@20628
L_20630:
    IF NOT (L_BP1a$ <> "P") THEN GOTO L_20654   '@20630 DS:245c
    IF NOT (L_BP1a$ = "p") THEN GOTO L_20664   '@20642 DS:2462
L_20654:
    GOTO L_2071c   '@20654
L_20664:
    IF NOT (L_BP1a$ <> "N") THEN GOTO L_20688   '@20664 DS:24d2
    IF NOT (L_BP1a$ = "n") THEN GOTO L_20698   '@20676 DS:24d8
L_20688:
    GOTO L_214e9   '@20688
L_20698:
    IF NOT (L_BP1a$ <> "L") THEN GOTO L_206bc   '@20698 DS:24de
    IF NOT (L_BP1a$ = "l") THEN GOTO L_206cc   '@206aa DS:24e4
L_206bc:
    GOTO L_222b6   '@206bc
L_206cc:
    IF NOT (L_BP1a$ <> "G") THEN GOTO L_206f0   '@206cc DS:24ea
    IF NOT (L_BP1a$ = "g") THEN GOTO L_20700   '@206de DS:24f0
L_206f0:
    GOTO L_22fc0   '@206f0
L_20700:
    BEEP   '@20700
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@2070a
L_20717:
L_2071c:
    RT_CLS 2   '@20721
    PRINT " Criacao de Ferragem Positiva"   '@2072f DS:24f6
    RT_LINEINPUT " Quantidade *0* ", V_0dfc$   '@2073d DS:2518
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_20774   '@20757
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@2076c
L_20774:
L_20779:
    LOCATE 24, 25   '@2077e
    RT_LINEINPUT "Bitola da Ferragem (mm) ", V_0e00$   '@2079c DS:252c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@207b6
    V_0e34! = V_0e44!   '@207d0
    GOSUB L_2ab31   '@207e1
    IF NOT (V_0e44! = 0.0 OR V_0e44! = V_0e34!) THEN GOTO L_2083e   '@207ee DS:2548
    BEEP   '@2082c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20779   '@20836
L_2083e:
    A_1ac4!(RT_CINT%(FX##(V_1866!) + 1.0), 0) = VAL(V_0dfc$)   '@2083e DS:254c
    A_1ac4!(RT_CINT%(FX##(V_1866!) + 1.0), 1) = VAL(V_0e00$)   '@20876 DS:254c
L_208b4:
    LOCATE 25, 1   '@208b9
    RT_LINEINPUTPV " Inicio no Tramo ", V_0dfc$   '@208d4 DS:2550 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0dfc$)   '@208ee
    IF NOT (FX##(V_0ddc!) + V_0de4! < FX##(V_0e44!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e44!)) THEN GOTO L_20962   '@20908 DS:254c
    BEEP   '@20950
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_208b4   '@2095a
L_20962:
L_20967:
    LOCATE 25, 21   '@2096c
    PRINT "Distancia (cm "; CHR$(26); " +) a partir da face ";   '@2098a DS:2566,2578
    IF NOT (V_0e44! = 0.0) THEN GOTO L_209e1   '@209b0 DS:2548
    PRINT "esquerda do Balanco";   '@209cb DS:2592
    GOTO L_20a24   '@209d9
L_209e1:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e44!) - 1.0))), (2));   '@209e1 DS:25aa,25b8
L_20a24:
    RT_LINEINPUTPV " ", V_0dfc$   '@20a24 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@20a3e
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_20ada   '@20a56
    V_0e30! = 3.0   '@20a78 DS:25c2
    V_0e34! = FX##(V_0e44!) - 1.0   '@20a89 DS:25b8
    GOSUB L_2659d   '@20a9f
    IF NOT (V_0dfc$ = "*") THEN GOTO L_20ad5   '@20aac DS:2420
    BEEP   '@20ac3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20967   '@20acd
L_20ad5:
L_20ada:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_20b5a   '@20ada DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@20afc DS:25cc
L_20b5a:
    L_BP1e! = FX##(V_0e44!) - 1.0   '@20b5a DS:25b8
    L_BP22! = 0.0   '@20b70 DS:2548
    CALL MIXT_082a_Maior(L_BP1e!, L_BP22!, L_BP26!)   '@20b7a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28% = (LEN(V_0dfc$) = 0)   '@20b8b DS:2548,25d0
    L_BP2a% = (V_0e44! = 0.0)   '@20bc1
    L_BP2c% = (V_0e44! > 0.0)   '@20bc4 DS:2548,25d0
    L_BP2e% = VAL(V_0dfc$) < 0.0# AND L_BP2a% OR L_BP28%   '@20c08
    L_BP30% = VAL(V_0dfc$) < 0.0# AND L_BP2c%   '@20c0b
    L_BP32% = FX##(-VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(L_BP26!)), 0)) AND L_BP30% OR L_BP2e%   '@20c4d DS:254c
    L_BP34% = (FX##(V_0ddc!) + 1.0 = FX##(V_0e44!))   '@20cb5
    L_BP36% = FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) AND L_BP34% OR L_BP32%   '@20cb8
    L_BP38% = (V_0e44! <= V_0ddc!)   '@20d18
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) AND L_BP38% OR L_BP36%) <> 0) THEN GOTO L_20d51   '@20d1b
    BEEP   '@20d3f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20967   '@20d49
L_20d51:
    A_1ac4!(RT_CINT%(FX##(V_1866!) + 1.0), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)) + VAL(V_0dfc$)   '@20d51 DS:254c
L_20daa:
    LOCATE 25, 1   '@20daf
    PRINT RT_STRINGC$((80), (32));   '@20dca
    LOCATE 25, 1   '@20de2
    RT_LINEINPUTPV " Termino no Tramo ", V_0dfc$   '@20dfd DS:25d8 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = VAL(V_0dfc$)   '@20e17
    IF NOT (V_0e20! < V_0e44! OR (FX##(V_0ddc!) + V_0de4! < FX##(V_0e20!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e20!))) THEN GOTO L_20ea6   '@20e31 DS:254c
    BEEP   '@20e94
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20daa   '@20e9e
L_20ea6:
L_20eab:
    LOCATE 25, 21   '@20eb0
    PRINT "Distancia (cm "; CHR$(26); " +) a partir da face ";   '@20ece DS:2566,2578
    IF NOT (V_0e20! = 0.0) THEN GOTO L_20f25   '@20ef4 DS:2548
    PRINT "esquerda do Balanco";   '@20f0f DS:2592
    GOTO L_20f68   '@20f1d
L_20f25:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2));   '@20f25 DS:25aa,25b8
L_20f68:
    RT_LINEINPUTPV " ", V_0dfc$   '@20f68 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@20f82
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_2101e   '@20f9a
    V_0e30! = 2.0   '@20fbc DS:25cc
    V_0e34! = FX##(V_0e20!) - 1.0   '@20fcd DS:25b8
    GOSUB L_2659d   '@20fe3
    IF NOT (V_0dfc$ = "*") THEN GOTO L_21019   '@20ff0 DS:2420
    BEEP   '@21007
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20eab   '@21011
L_21019:
L_2101e:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_2109e   '@2101e DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@21040 DS:25cc
L_2109e:
    L_BP3a% = (LEN(V_0dfc$) = 0)   '@2109e DS:2548,25d0
    L_BP3c% = (V_0e20! = 0.0)   '@210d9
    L_BP3e% = (V_0e20! > 0.0)   '@210dc DS:2548,25d0
    L_BP40% = VAL(V_0dfc$) < 0.0# AND L_BP3c% OR L_BP3a%   '@21120
    L_BP42% = VAL(V_0dfc$) < 0.0# AND L_BP3e% OR L_BP40%   '@21123 DS:254c
    L_BP44% = (FX##(V_0ddc!) + 1.0 = FX##(V_0e20!))   '@21188
    L_BP46% = FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) AND L_BP44% OR L_BP42%   '@2118b
    L_BP48% = (V_0e20! <= V_0ddc!)   '@21209
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e20!)), 0) AND L_BP48% OR L_BP46%) <> 0) THEN GOTO L_21242   '@2120c
    BEEP   '@21230
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20eab   '@2123a
L_21242:
    A_1ac4!(RT_CINT%(FX##(V_1866!) + 1.0), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@21242 DS:254c
    V_1866! = FX##(V_1866!) + 1.0   '@21299 DS:254c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_1866!)), 3)) THEN GOTO L_21323   '@212af
    V_1866! = FX##(V_1866!) - 1.0   '@212fb DS:25b8
    BEEP   '@21311
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20daa   '@2131b
L_21323:
L_21328:
    LOCATE 25, 1   '@2132d
    PRINT RT_STRINGC$((80), (32));   '@21348
    LOCATE 25, 1   '@21360
    RT_LINEINPUTPV " Comprimento do Gancho Esquerdo (cm) *0* ", V_0dfc$   '@2137b DS:25ee (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_1866!)), 0) = VAL(V_0dfc$)   '@21395
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_213fe   '@213c8 DS:25d0
    BEEP   '@213ec
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21328   '@213f6
L_213fe:
L_21403:
    LOCATE 25, 1   '@21408
    PRINT RT_STRINGC$((80), (32));   '@21423
    LOCATE 25, 1   '@2143b
    RT_LINEINPUTPV " Comprimento do Gancho Direito (cm) *0* ", V_0dfc$   '@21456 DS:261c (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b20!(RT_CINT%(FX##(V_1866!)), 1) = VAL(V_0dfc$)   '@21470
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_214da   '@214a4 DS:25d0
    BEEP   '@214c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21403   '@214d2
L_214da:
    RETURN   '@214da
L_214e9:
    RT_CLS 2   '@214ee
    PRINT " Criacao de Ferragem Negativa"   '@214fc DS:2648
    RT_LINEINPUT " Quantidade *0* ", V_0dfc$   '@2150a DS:2518
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_21541   '@21524
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@21539
L_21541:
L_21546:
    LOCATE 24, 25   '@2154b
    RT_LINEINPUT "Bitola da ferragem (mm) ", V_0e00$   '@21569 DS:266a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@21583
    V_0e34! = V_0e44!   '@2159d
    GOSUB L_2ab31   '@215ae
    IF NOT (V_0e44! = 0.0 OR V_0e44! = V_0e34!) THEN GOTO L_2160b   '@215bb DS:2548
    BEEP   '@215f9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21546   '@21603
L_2160b:
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 0) = VAL(V_0dfc$)   '@2160b DS:254c
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 1) = VAL(V_0e00$)   '@21643 DS:254c
L_21681:
    LOCATE 25, 1   '@21686
    RT_LINEINPUTPV " Inicio no tramo ", V_0dfc$   '@216a1 DS:2686 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0dfc$)   '@216bb
    IF NOT (FX##(V_0ddc!) + V_0de4! < FX##(V_0e44!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e44!)) THEN GOTO L_2172f   '@216d5 DS:254c
    BEEP   '@2171d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21681   '@21727
L_2172f:
L_21734:
    LOCATE 25, 21   '@21739
    PRINT "Distancia (cm "; CHR$(26); " +) a partir da face ";   '@21757 DS:2566,2578
    IF NOT (V_0e44! = 0.0) THEN GOTO L_217ae   '@2177d DS:2548
    PRINT "esquerda do Balanco";   '@21798 DS:2592
    GOTO L_217f1   '@217a6
L_217ae:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e44!) - 1.0))), (2));   '@217ae DS:25aa,25b8
L_217f1:
    RT_LINEINPUTPV " ", V_0dfc$   '@217f1 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@2180b
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_218a7   '@21823
    V_0e30! = 3.0   '@21845 DS:25c2
    V_0e34! = FX##(V_0e44!) - 1.0   '@21856 DS:25b8
    GOSUB L_2636c   '@2186c
    IF NOT (V_0dfc$ = "*") THEN GOTO L_218a2   '@21879 DS:2420
    BEEP   '@21890
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21734   '@2189a
L_218a2:
L_218a7:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_21927   '@218a7 DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@218c9 DS:25cc
L_21927:
    L_BP4c! = FX##(V_0e44!) - 1.0   '@21927 DS:25b8
    L_BP50! = 0.0   '@2193d DS:2548
    CALL MIXT_082a_Maior(L_BP4c!, L_BP50!, L_BP54!)   '@21947
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP56% = (LEN(V_0dfc$) = 0)   '@21958 DS:2548,25d0
    L_BP58% = (V_0e44! = 0.0)   '@2198e
    L_BP5a% = (V_0e44! > 0.0)   '@21991 DS:2548,25d0
    L_BP5c% = VAL(V_0dfc$) < 0.0# AND L_BP58% OR L_BP56%   '@219d5
    L_BP5e% = VAL(V_0dfc$) < 0.0# AND L_BP5a%   '@219d8
    L_BP60% = FX##(-VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(L_BP54!)), 0)) AND L_BP5e% OR L_BP5c%   '@21a1a DS:254c
    L_BP62% = (FX##(V_0ddc!) + 1.0 = FX##(V_0e44!))   '@21a82
    L_BP64% = FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) AND L_BP62% OR L_BP60%   '@21a85
    L_BP66% = (V_0e44! <= V_0ddc!)   '@21ae5
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) AND L_BP66% OR L_BP64%) <> 0) THEN GOTO L_21b1e   '@21ae8
    BEEP   '@21b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21734   '@21b16
L_21b1e:
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)) + VAL(V_0dfc$)   '@21b1e DS:254c
L_21b77:
    LOCATE 25, 1   '@21b7c
    PRINT RT_STRINGC$((80), (32));   '@21b97
    LOCATE 25, 1   '@21baf
    RT_LINEINPUTPV " Termino no Tramo ", V_0dfc$   '@21bca DS:25d8 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = VAL(V_0dfc$)   '@21be4
    IF NOT (V_0e20! < V_0e44! OR (FX##(V_0ddc!) + V_0de4! < FX##(V_0e20!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e20!))) THEN GOTO L_21c73   '@21bfe DS:254c
    BEEP   '@21c61
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21b77   '@21c6b
L_21c73:
L_21c78:
    LOCATE 25, 21   '@21c7d
    PRINT "Distancia (cm "; CHR$(26); " +) a partir da face ";   '@21c9b DS:2566,2578
    IF NOT (V_0e20! = 0.0) THEN GOTO L_21cf2   '@21cc1 DS:2548
    PRINT "esquerda do Balanco";   '@21cdc DS:2592
    GOTO L_21d35   '@21cea
L_21cf2:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2));   '@21cf2 DS:25aa,25b8
L_21d35:
    RT_LINEINPUTPV " ", V_0dfc$   '@21d35 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@21d4f
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_21deb   '@21d67
    V_0e30! = 2.0   '@21d89 DS:25cc
    V_0e34! = FX##(V_0e20!) - 1.0   '@21d9a DS:25b8
    GOSUB L_2636c   '@21db0
    IF NOT (V_0dfc$ = "*") THEN GOTO L_21de6   '@21dbd DS:2420
    BEEP   '@21dd4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21c78   '@21dde
L_21de6:
L_21deb:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_21e6b   '@21deb DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@21e0d DS:25cc
L_21e6b:
    L_BP68% = (LEN(V_0dfc$) = 0)   '@21e6b DS:2548,25d0
    L_BP6a% = (V_0e20! = 0.0)   '@21ea6
    L_BP6c% = (V_0e20! > 0.0)   '@21ea9 DS:2548,25d0
    L_BP6e% = VAL(V_0dfc$) < 0.0# AND L_BP6a% OR L_BP68%   '@21eed
    L_BP70% = VAL(V_0dfc$) < 0.0# AND L_BP6c% OR L_BP6e%   '@21ef0 DS:254c
    L_BP72% = (FX##(V_0ddc!) + 1.0 = FX##(V_0e20!))   '@21f55
    L_BP74% = FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) AND L_BP72% OR L_BP70%   '@21f58
    L_BP76% = (V_0e20! <= V_0ddc!)   '@21fd6
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e20!)), 0) AND L_BP76% OR L_BP74%) <> 0) THEN GOTO L_2200f   '@21fd9
    BEEP   '@21ffd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21c78   '@22007
L_2200f:
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@2200f DS:254c
    V_185e! = FX##(V_185e!) + 1.0   '@22066 DS:254c
    IF NOT (A_1af2!(RT_CINT%(FX##(V_185e!)), 2) >= A_1af2!(RT_CINT%(FX##(V_185e!)), 3)) THEN GOTO L_220f0   '@2207c
    V_185e! = FX##(V_185e!) - 1.0   '@220c8 DS:25b8
    BEEP   '@220de
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21b77   '@220e8
L_220f0:
L_220f5:
    LOCATE 25, 1   '@220fa
    PRINT RT_STRINGC$((80), (32));   '@22115
    LOCATE 25, 1   '@2212d
    RT_LINEINPUTPV " Comprimento do Gancho Esquerdo (cm) *0* ", V_0dfc$   '@22148 DS:25ee (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_185e!)), 0) = VAL(V_0dfc$)   '@22162
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_221cb   '@22195 DS:25d0
    BEEP   '@221b9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_220f5   '@221c3
L_221cb:
L_221d0:
    LOCATE 25, 1   '@221d5
    PRINT RT_STRINGC$((80), (32));   '@221f0
    LOCATE 25, 1   '@22208
    RT_LINEINPUTPV " Comprimento do Gancho Direito (cm) *0* ", V_0dfc$   '@22223 DS:261c (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b4e!(RT_CINT%(FX##(V_185e!)), 1) = VAL(V_0dfc$)   '@2223d
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_222a7   '@22271 DS:25d0
    BEEP   '@22295
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_221d0   '@2229f
L_222a7:
    RETURN   '@222a7
L_222b6:
    RT_CLS 2   '@222bb
    PRINT " Criacao da Armadura de Pele"   '@222c9 DS:269c
    IF NOT (V_186e! > 0.0) THEN GOTO L_22435   '@222d7 DS:2548
    BEEP   '@222f2
    RT_LINEINPUT " ATENCAO!  A Armadura existente deve ser mantida  NAO/*S* ", V_0dfc$   '@222fc DS:26bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "NAO") THEN GOTO L_2233b   '@22316 DS:26fa
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@22333
L_2233b:
    LOCATE 24, 1   '@2233b
    PRINT RT_STRINGC$((80), (32))   '@22356
    LOCATE 24, 1   '@2236e
    RT_LINEINPUT " Crio uma Nova Armadura N/*S* ", V_0dfc$   '@22389 DS:2702
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    REDIM A_1c34!(-32768 TO -32768, -32768 TO -32768)   '@223a3
    REDIM A_1a96%(-32768 TO -32768)   '@223b1
    REDIM A_1c34!(0 TO 14, 0 TO 4)   '@223ba
    REDIM A_1a96%(0 TO 6)   '@223db
    V_186e! = 0.0   '@223f8 DS:2548
    IF NOT (UCASE$(V_0dfc$) = "N") THEN GOTO L_22430   '@22409 DS:24d2
    RETURN   '@22426
L_22430:
L_22435:
L_2243a:
    LOCATE 24, 1   '@2243f
    PRINT RT_STRINGC$((80), (32))   '@2245a
    LOCATE 24, 1   '@22472
    RT_LINEINPUT " Bitola (mm) *RETORNO* ", V_0dfc$   '@2248d DS:2724
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_224c4   '@224a7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@224bc
L_224c4:
    V_0e44! = VAL(V_0dfc$)   '@224c4
    V_0e34! = V_0e44!   '@224de
    GOSUB L_2ab31   '@224ef
    IF NOT (V_0e34! > V_0f02! OR (V_0e44! = V_0e34! OR V_0e44! = 0.0)) THEN GOTO L_22567   '@224fc DS:2548
    BEEP   '@22555
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2243a   '@2255f
L_22567:
    L_BP7a! = FX##(V_0ddc!) + V_0de4!   '@22567
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP7a!   '@2257d DS:254c
    A_1c34!(RT_CINT%(FX##(V_0e28!)), 1) = VAL(V_0dfc$)   '@2258a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@225be DS:254c
L_225eb:
    LOCATE 24, 40   '@225f0
    RT_LINEINPUT "Numero de Barras por face ", V_0dfc$   '@2260e DS:2740
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = INT(FX##(VAL(V_0dfc$)))   '@22628
    IF NOT (V_0e44! > 30.0 OR V_0e44! < 1.0) THEN GOTO L_22699   '@22649 DS:254c,275e
    BEEP   '@22687
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_225eb   '@22691
L_22699:
    L_BP7e! = FX##(V_0ddc!) + V_0de4!   '@22699
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP7e!   '@226af DS:254c
    A_1c34!(RT_CINT%(FX##(V_0e28!)), 0) = V_0e44!   '@226bc
    L_BP82! = 0.0   '@226e6 DS:2548
    L_BP86! = FX##(V_0e28!) - 1.0   '@226f8 DS:25b8
    CALL MIXT_082a_Maior(L_BP82!, L_BP86!, L_BP8a!)   '@22708
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8e! = FX##(A_1926!(RT_CINT%(FX##(L_BP8a!)), 0)) / 2.0   '@2271d DS:25cc
    L_BP92! = 20.0   '@22747 DS:2762
    CALL MIXT_0877_Menor(L_BP8e!, L_BP92!, L_BP96!)   '@22752
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e28!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) - FX##(V_0e28! = 0.0) * V_0eaa! + FX##(V_0e28! > 0.0) * L_BP96!   '@22767 DS:2548
    L_BP9a! = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) / 2.0   '@227ea DS:25cc
    L_BP9e! = 20.0   '@2281a DS:2762
    CALL MIXT_0877_Menor(L_BP9a!, L_BP9e!, L_BPa2!)   '@22825
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e28!)), 3) = FX##(FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) * V_0eaa! - FX##(V_0e28! <= V_0ddc!) * L_BPa2! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@2283a DS:254c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@228c3 DS:254c
L_228f3:
    LOCATE 25, 1   '@228f8
    PRINT RT_STRINGC$((80), (32));   '@22913
    LOCATE 25, 1   '@2292b
    RT_LINEINPUTPV " Tramo que possua Armadura Diferente *NENHUM* ", V_0dfc$   '@22946 DS:2766 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2297d   '@22960
    GOTO L_22caf   '@22975
L_2297d:
    L_BPa4% = (FX##(VAL(V_0dfc$)) < 1.0 - FX##(V_0de0!))   '@2297d DS:254c
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(V_0ddc!) + V_0de4! OR L_BPa4%) <> 0) THEN GOTO L_229ef   '@229bb
    BEEP   '@229dd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_228f3   '@229e7
L_229ef:
L_229f4:
    LOCATE 25, 1   '@229f9
    PRINT RT_STRINGC$((80), (32));   '@22a14
    LOCATE 25, 1   '@22a2c
    PRINT " Numero de barras do Tramo "; V_0dfc$;   '@22a47 DS:2798
    RT_LINEINPUTPV " por face ", V_0e00$   '@22a5e DS:27b8 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPa6% = (VAL(V_0e00$) < 0.0#)   '@22a78 DS:25d0,27c6
    IF NOT ((VAL(V_0e00$) > 30.0# OR L_BPa6%) <> 0) THEN GOTO L_22ae0   '@22aac
    BEEP   '@22ace
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_229f4   '@22ad8
L_22ae0:
    A_1c34!(RT_CINT%(FX##(VAL(V_0dfc$))), 0) = INT(FX##(VAL(V_0e00$)))   '@22ae0
    IF NOT (INT(FX##(VAL(V_0e00$))) = FX##(0.0#)) THEN GOTO L_22b56   '@22b23 DS:25d0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_228f3   '@22b4e
L_22b56:
L_22b5b:
    LOCATE 25, 50   '@22b60
    RT_LINEINPUTPV "Bitola (mm) ", V_0e00$   '@22b7e DS:27ce (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@22b98
    IF NOT (V_0e44! <> V_0f02! AND (V_0e44! <> V_0efe! AND (V_0e44! <> V_0efa! AND (V_0e44! <> V_0ef6! AND (V_0e44! <> V_0ef2! AND V_0e44! <> V_0eee!))))) THEN GOTO L_22c6e   '@22bb2
    BEEP   '@22c5c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22b5b   '@22c66
L_22c6e:
    A_1c34!(RT_CINT%(FX##(VAL(V_0dfc$))), 1) = V_0e44!   '@22c6e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_228f3   '@22ca2
L_22caf:
    L_BPaa! = FX##(V_0ddc!) + V_0de4!   '@22cb4
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BPaa!   '@22ccb DS:254c
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0eee!) THEN GOTO L_22d37   '@22cd8
    A_1a96%(0) = A_1a96%(0) + 1   '@22d0d
L_22d37:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef2!) THEN GOTO L_22d8f   '@22d37
    A_1a96%(1) = A_1a96%(1) + 1   '@22d6c
L_22d8f:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef6!) THEN GOTO L_22df0   '@22d8f
    A_1a96%(2) = A_1a96%(2) + 1   '@22dc4
L_22df0:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efa!) THEN GOTO L_22e51   '@22df0
    A_1a96%(3) = A_1a96%(3) + 1   '@22e25
L_22e51:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efe!) THEN GOTO L_22eb2   '@22e51
    A_1a96%(4) = A_1a96%(4) + 1   '@22e86
L_22eb2:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0f02!) THEN GOTO L_22f13   '@22eb2
    A_1a96%(5) = A_1a96%(5) + 1   '@22ee7
L_22f13:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@22f13 DS:254c
    FOR V_0e14! = 0.0 TO 5.0   '@22f3f DS:2548,254c,27de
    V_186e! = FX##(V_186e!) - (A_1a96%(RT_CINT%(FX##(V_0e14!))) > 0)   '@22f4c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@22f88 DS:254c,27de
    RETURN   '@22fb1
L_22fc0:
    RT_CLS 2   '@22fc5
    PRINT " Criacao de Grampos"   '@22fd3 DS:27e2
    IF NOT (FX##(V_1876!) + V_1872! > FX##(0.0)) THEN GOTO L_2301e   '@22fe1 DS:2548
    BEEP   '@23001
    PRINT " ATENCAO!  para Substituicao,   a Armadura existente devera ser DELETADA"   '@2300b DS:27fa
L_2301e:
    PRINT " <P>ositivo  <N>egativo  <R>etorno ";   '@2301e DS:2846
L_23031:
    CALL MIXT_07f1_LimpaTeclado   '@23036
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@23040
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPae$ = V_0dfc$   '@2305c
    IF NOT (L_BPae$ <> "R") THEN GOTO L_2309a   '@2306f DS:24c6
    IF NOT (L_BPae$ = "r") THEN GOTO L_230aa   '@23087 DS:24cc
L_2309a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20586   '@2309a
L_230aa:
    IF NOT (L_BPae$ <> "P") THEN GOTO L_230d0   '@230aa DS:245c
    IF NOT (L_BPae$ = "p") THEN GOTO L_239be   '@230bd DS:2462
L_230d0:
    RT_CLS 2   '@230d0
    PRINT " Criacao de Grampos Positivos"   '@230de DS:286e
L_230f1:
    LOCATE 24, 1   '@230f6
    RT_LINEINPUT " Numero do Tramo ", V_0dfc$   '@23111 DS:2890
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb0% = (LEN(V_0dfc$) = 0)   '@2312b DS:254c
    L_BPb2% = FX##(VAL(V_0dfc$)) < 1.0 - FX##(V_0de0!) OR L_BPb0%   '@23153
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(V_0ddc!) + V_0de4! OR L_BPb2%) <> 0) THEN GOTO L_231b6   '@23182
    BEEP   '@231a4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_230f1   '@231ae
L_231b6:
    V_0e20! = VAL(V_0dfc$)   '@231b6
L_231d5:
    LOCATE 24, 27   '@231da
    RT_LINEINPUT "no lado <E>squerdo ou <D>ireito ", V_0dfc$   '@231f8 DS:28a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@23212
    L_BPb4% = (V_0dfc$ <> "E")   '@2322a DS:2430
    IF NOT ((V_0dfc$ <> "D" AND L_BPb4%) <> 0) THEN GOTO L_23278   '@23250 DS:2408
    BEEP   '@23266
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_231d5   '@23270
L_23278:
L_2327d:
    LOCATE 25, 1   '@23282
    RT_LINEINPUTPV " Bitola (mm) ", V_0e00$   '@2329d DS:28ca (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@232b7
    IF NOT (V_0e44! <> V_0f02! AND (V_0e44! <> V_0efe! AND (V_0e44! <> V_0efa! AND (V_0e44! <> V_0ef6! AND (V_0e44! <> V_0ef2! AND V_0e44! <> V_0eee!))))) THEN GOTO L_2338d   '@232d1
    BEEP   '@2337b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2327d   '@23385
L_2338d:
L_23392:
    LOCATE 25, 27   '@23397
    RT_LINEINPUTPV "Numero de Grampos ", V_0e00$   '@233b5 DS:28dc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = VAL(V_0e00$)   '@233cf
    IF NOT (V_0e28! > 20.0 OR V_0e28! < 1.0) THEN GOTO L_23439   '@233e9 DS:254c,2762
    BEEP   '@23427
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23392   '@23431
L_23439:
L_2343e:
    LOCATE 25, 1   '@23443
    PRINT RT_STRINGC$((80), (32));   '@2345e
    LOCATE 25, 1   '@23476
    L_BPb8! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) - V_0eaa!   '@23491 DS:28f2
    L_BPbc! = INT(7.5 * FX##(V_0e44!))   '@234e9 DS:292e
    PRINT " Comprimento do Grampo a partir da face do Apoio (cm) *";   '@23491
    CALL MIXT_0877_Menor(L_BPb8!, L_BPbc!, L_BPc0!)   '@2350f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT RT_MID2$((STR$(L_BPc0!)), (2));   '@23514
    RT_LINEINPUTPV "* ", V_0e00$   '@23535 DS:2932 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e00$) = 0) THEN GOTO L_235f2   '@2354f
    L_BPc4! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) - V_0eaa!   '@23564
    L_BPc8! = INT(7.5 * FX##(V_0e44!))   '@235b3 DS:292e
    CALL MIXT_0877_Menor(L_BPc4!, L_BPc8!, L_BPcc!)   '@235ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BPcc!   '@235df
    GOTO L_2366b   '@235ea
L_235f2:
    V_0e30! = VAL(V_0e00$)   '@235f2
    IF NOT (20.0 * FX##(V_0e44!) < FX##(V_0e30!) OR 4.0 * FX##(V_0e44!) > FX##(V_0e30!)) THEN GOTO L_23666   '@2360c DS:2762,2938
    BEEP   '@23654
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2343e   '@2365e
L_23666:
L_2366b:
    V_1876! = FX##(V_1876!) + 1.0   '@23670 DS:254c
    A_1baa!(RT_CINT%(FX##(V_1876!)), 0) = V_0e28!   '@23686
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0e44!   '@236b0
    L_BPd0! = 0.0   '@236db DS:2548
    L_BPd4! = FX##(V_0e20!) - 1.0   '@236ed DS:25b8
    CALL MIXT_082a_Maior(L_BPd0!, L_BPd4!, L_BPd8!)   '@236fd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 2) = -(V_0dfc$ = "E") * (FX##(V_0e20! <> 0.0) * A_1926!(RT_CINT%(FX##(L_BPd8!)), 0) + A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) + V_0eaa!) - (V_0dfc$ = "D") * (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - V_0e30!)   '@23711 DS:2408,2430,2548
    L_BPdc! = 0.0   '@237eb DS:2548
    L_BPe0! = FX##(V_0e20!) - 1.0   '@237fd DS:25b8
    CALL MIXT_082a_Maior(L_BPdc!, L_BPe0!, L_BPe4!)   '@2380d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 3) = V_0e30! - (V_0dfc$ = "D") * (FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 0)) - V_0eaa!) - (V_0dfc$ = "E") * (FX##(-A_1926!(RT_CINT%(FX##(L_BPe4!)), 0)) * (V_0e20! <> 0.0) - V_0eaa!) + A_1baa!(RT_CINT%(FX##(V_1876!)), 2)   '@23822 DS:2408,2430,2548
    A_1baa!(RT_CINT%(FX##(V_1876!)), 4) = -(V_0dfc$ = "D")   '@23907 DS:2408
    A_1baa!(RT_CINT%(FX##(V_1876!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e20!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@23947 DS:25cc,27de
    RETURN   '@239ac
    ' @239b6 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_242e9   '@239b6
L_239be:
    IF NOT (L_BPae$ <> "N") THEN GOTO L_239e4   '@239be DS:24d2
    IF NOT (L_BPae$ = "n") THEN GOTO L_242d2   '@239d1 DS:24d8
L_239e4:
    RT_CLS 2   '@239e4
    PRINT " Criacao de Grampos Negativos"   '@239f2 DS:293c
L_23a05:
    LOCATE 24, 1   '@23a0a
    RT_LINEINPUT " Numero do Tramo ", V_0dfc$   '@23a25 DS:2890
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe6% = (LEN(V_0dfc$) = 0)   '@23a3f DS:254c
    L_BPe8% = FX##(VAL(V_0dfc$)) < 1.0 - FX##(V_0de0!) OR L_BPe6%   '@23a67
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(V_0ddc!) + V_0de4! OR L_BPe8%) <> 0) THEN GOTO L_23aca   '@23a96
    BEEP   '@23ab8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23a05   '@23ac2
L_23aca:
    V_0e20! = VAL(V_0dfc$)   '@23aca
L_23ae9:
    LOCATE 24, 27   '@23aee
    RT_LINEINPUT "no lado <E>squerdo ou <D>ireito ", V_0dfc$   '@23b0c DS:28a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@23b26
    L_BPea% = (V_0dfc$ <> "E")   '@23b3e DS:2430
    IF NOT ((V_0dfc$ <> "D" AND L_BPea%) <> 0) THEN GOTO L_23b8c   '@23b64 DS:2408
    BEEP   '@23b7a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23ae9   '@23b84
L_23b8c:
L_23b91:
    LOCATE 25, 1   '@23b96
    RT_LINEINPUTPV " Bitola (mm) ", V_0e00$   '@23bb1 DS:28ca (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@23bcb
    IF NOT (V_0e44! <> V_0f02! AND (V_0e44! <> V_0efe! AND (V_0e44! <> V_0efa! AND (V_0e44! <> V_0ef6! AND (V_0e44! <> V_0ef2! AND V_0e44! <> V_0eee!))))) THEN GOTO L_23ca1   '@23be5
    BEEP   '@23c8f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23b91   '@23c99
L_23ca1:
L_23ca6:
    LOCATE 25, 27   '@23cab
    RT_LINEINPUTPV " Numero de Grampos ", V_0e00$   '@23cc9 DS:295e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = VAL(V_0e00$)   '@23ce3
    IF NOT (V_0e28! > 20.0 OR V_0e28! < 1.0) THEN GOTO L_23d4d   '@23cfd DS:254c,2762
    BEEP   '@23d3b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23ca6   '@23d45
L_23d4d:
L_23d52:
    LOCATE 25, 1   '@23d57
    PRINT RT_STRINGC$((80), (32));   '@23d72
    LOCATE 25, 1   '@23d8a
    L_BPee! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) - V_0eaa!   '@23da5 DS:28f2
    L_BPf2! = INT(12.0 * FX##(V_0e44!))   '@23dfd DS:2976
    PRINT " Comprimento do Grampo a partir da face do Apoio (cm) *";   '@23da5
    CALL MIXT_0877_Menor(L_BPee!, L_BPf2!, L_BPf6!)   '@23e23
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT RT_MID2$((STR$(L_BPf6!)), (2));   '@23e28
    RT_LINEINPUTPV "* ", V_0e00$   '@23e49 DS:2932 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e00$) = 0) THEN GOTO L_23f06   '@23e63
    L_BPfa! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) - V_0eaa!   '@23e78
    L_BPfe! = INT(12.0 * FX##(V_0e44!))   '@23ec7 DS:2976
    CALL MIXT_0877_Menor(L_BPfa!, L_BPfe!, L_BP102!)   '@23ede
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP102!   '@23ef3
    GOTO L_23f7f   '@23efe
L_23f06:
    V_0e30! = VAL(V_0e00$)   '@23f06
    IF NOT (20.0 * FX##(V_0e44!) < FX##(V_0e30!) OR 4.0 * FX##(V_0e44!) > FX##(V_0e30!)) THEN GOTO L_23f7a   '@23f20 DS:2762,2938
    BEEP   '@23f68
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23d52   '@23f72
L_23f7a:
L_23f7f:
    V_1872! = FX##(V_1872!) + 1.0   '@23f84 DS:254c
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 0) = V_0e28!   '@23f9a
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0e44!   '@23fc4
    L_BP106! = 0.0   '@23fef DS:2548
    L_BP10a! = FX##(V_0e20!) - 1.0   '@24001 DS:25b8
    CALL MIXT_082a_Maior(L_BP106!, L_BP10a!, L_BP10e!)   '@24011
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 2) = -(V_0dfc$ = "E") * (FX##(V_0e20! <> 0.0) * A_1926!(RT_CINT%(FX##(L_BP10e!)), 0) + A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0) + V_0eaa!) - (V_0dfc$ = "D") * (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) - V_0e30!)   '@24025 DS:2408,2430,2548
    L_BP112! = 0.0   '@240ff DS:2548
    L_BP116! = FX##(V_0e20!) - 1.0   '@24111 DS:25b8
    CALL MIXT_082a_Maior(L_BP112!, L_BP116!, L_BP11a!)   '@24121
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 3) = V_0e30! - (V_0dfc$ = "D") * (FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 0)) - V_0eaa!) - (V_0dfc$ = "E") * (FX##(-A_1926!(RT_CINT%(FX##(L_BP11a!)), 0)) * (V_0e20! <> 0.0) - V_0eaa!) + A_1bd8!(RT_CINT%(FX##(V_1872!)), 2)   '@24136 DS:2408,2430,2548
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 4) = -(V_0dfc$ = "D")   '@2421b DS:2408
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e20!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@2425b DS:25cc,27de
    RETURN   '@242c0
    ' @242ca (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_242e9   '@242ca
L_242d2:
    BEEP   '@242d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23031   '@242dc
L_242e9:
L_242ee:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@242f3
    PRINT " Alteracao de Ferragem"   '@24301 DS:297a
    RT_LINEINPUT " Numero da posicao a ser alterada *RETORNO* ", V_0dfc$   '@2430f DS:2994
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2435a   '@24329
    V_0dfc$ = "RET"   '@2433e DS:2320
    RETURN   '@24350
L_2435a:
    L_BP11c% = (VAL(V_0dfc$) <= 0.0#)   '@2435a DS:25d0
    L_BP11e% = FX##(VAL(V_0dfc$)) > FX##(V_1866!) + V_185e! + V_1872! OR L_BP11c%   '@24398
    L_BP120% = (FX##(VAL(V_0dfc$)) > FX##(V_185e!))   '@243c2
    IF NOT ((FX##(VAL(V_0dfc$)) <= FX##(V_185e!) + V_1872! AND L_BP120% OR L_BP11e%) <> 0) THEN GOTO L_24425   '@243ed
    BEEP   '@24413
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_242ee   '@2441d
L_24425:
    V_0e44! = VAL(V_0dfc$)   '@24425
    IF NOT (V_0e44! <= V_185e!) THEN GOTO L_24462   '@2443f
    GOTO L_25400   '@2445a
L_24462:
    V_0e44! = FX##(V_0e44!) - V_185e! - V_1872!   '@24462
L_24482:
    LOCATE 24, 1   '@24487
    PRINT RT_STRINGC$((80), (32));   '@244a2
    LOCATE 24, 1   '@244ba
    PRINT " Posicao "; V_18ea$; RT_MID2$((STR$(RT_SNG!(FX##(V_0e44!) + V_185e! + V_1872!))), (2)); "   Quantidade *"; LTRIM$(STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0))); "*";   '@244d5 DS:2420,29c4,29d2
    RT_LINEINPUT " ", V_0dfc$   '@24562 DS:25bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_24599   '@2457c
    GOTO L_24607   '@24591
L_24599:
    IF NOT (VAL(V_0dfc$) <= 0.0#) THEN GOTO L_245cf   '@24599 DS:25d0
    BEEP   '@245bd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24482   '@245c7
L_245cf:
    A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0) = VAL(V_0dfc$)   '@245cf
L_24607:
    LOCATE 24, 35   '@2460c
    PRINT "Bitola (mm) *"; LTRIM$(STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1))); "*";   '@2462a DS:2420,29e6
    RT_LINEINPUT " ", V_0dfc$   '@24674 DS:25bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f7e! = 1.0 - FX##(V_0de0!)   '@2468e DS:254c
    V_0f82! = 0.0   '@246a4 DS:2548
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_246d2   '@246b5
    GOTO L_247d3   '@246ca
L_246d2:
    V_0e20! = VAL(V_0dfc$)   '@246d2
    L_BP0e! = V_0e44!   '@246ec
    V_0e44! = V_0e20!   '@246fc
    GOSUB L_2ab31   '@2470d
    V_0e20! = V_0e44!   '@2471a
    V_0e44! = L_BP0e!   '@2472b
    L_BP122% = (V_0e20! = 0.0)   '@2473b DS:2548
    IF NOT ((FX##(V_0e20!) = FX##(VAL(V_0dfc$)) OR L_BP122%) <> 0) THEN GOTO L_2479a   '@24761
    BEEP   '@24788
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24607   '@24792
L_2479a:
    A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) = VAL(V_0dfc$)   '@2479a
L_247d3:
    L_BP126! = FX##(V_0ddc!) + V_0de4!   '@247d8
    FOR V_0e20! = 1.0 - FX##(V_0de0!) TO L_BP126!   '@247ef DS:254c
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) THEN GOTO L_2485e   '@247fc
    V_0f7e! = FX##(V_0e20!) + 1.0   '@24848 DS:254c
L_2485e:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) THEN GOTO L_248bd   '@2485e
    V_0f82! = V_0e20!   '@248ac
L_248bd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e20!   '@248bd DS:254c
    V_0e20! = V_0f7e!   '@248e9
L_248ff:
    LOCATE 25, 1   '@24904
    PRINT " Inicio-Distancia (cm "; CHR$(26); " +) a partir da face ";   '@2491f DS:2578,29f8
    IF NOT (V_0e20! = 0.0) THEN GOTO L_249af   '@24945 DS:2548
    PRINT "esquerda do Balanco *"; LTRIM$(STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2))); "*";   '@24960 DS:2420,2a12
    GOTO L_24a59   '@249a7
L_249af:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2)); " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)))); "*";   '@249af DS:2420,25aa,25b8,2a2c
L_24a59:
    RT_LINEINPUTPV " ", V_0dfc$   '@24a59 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@24a73
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_24b0f   '@24a8b
    V_0e30! = 3.0   '@24aad DS:25c2
    V_0e34! = FX##(V_0e20!) - 1.0   '@24abe DS:25b8
    GOSUB L_2659d   '@24ad4
    IF NOT (V_0dfc$ = "*") THEN GOTO L_24b0a   '@24ae1 DS:2420
    BEEP   '@24af8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_248ff   '@24b02
L_24b0a:
L_24b0f:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_24b8f   '@24b0f DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@24b31 DS:25cc
L_24b8f:
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_24bac   '@24b8f
    GOTO L_24cde   '@24ba4
L_24bac:
    L_BP128% = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) < FX##(A_1a0c!(0, 0)) + V_0eaa!)   '@24bac DS:254c
    IF NOT ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) > FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! OR L_BP128%) <> 0) THEN GOTO L_24c8a   '@24c56
    BEEP   '@24c78
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_248ff   '@24c82
L_24c8a:
    A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@24c8a
L_24cde:
    LOCATE 25, 1   '@24ce3
    PRINT RT_STRINGC$((80), (32));   '@24cfe
    V_0e20! = V_0f82!   '@24d16
    LOCATE 25, 1   '@24d27
    PRINT " Termino-Distancia (cm "; CHR$(26); " +) a partir da face ";   '@24d42 DS:2578,2a32
    IF NOT (V_0e20! = 0.0) THEN GOTO L_24dd5   '@24d68 DS:2548
    PRINT "esquerda do Balanco *"; LTRIM$(STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3))); "*";   '@24d83 DS:2420,2a12
    GOTO L_24e82   '@24dcd
L_24dd5:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2)); " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)))); "*";   '@24dd5 DS:2420,25aa,25b8,2a2c
L_24e82:
    RT_LINEINPUTPV " ", V_0dfc$   '@24e82 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@24e9c
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_24f38   '@24eb4
    V_0e30! = 2.0   '@24ed6 DS:25cc
    V_0e34! = FX##(V_0e20!) - 1.0   '@24ee7 DS:25b8
    GOSUB L_2659d   '@24efd
    IF NOT (V_0dfc$ = "*") THEN GOTO L_24f33   '@24f0a DS:2420
    BEEP   '@24f21
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24cde   '@24f2b
L_24f33:
L_24f38:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_24fb8   '@24f38 DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@24f5a DS:25cc
L_24fb8:
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_24fd5   '@24fb8
    GOTO L_25168   '@24fcd
L_24fd5:
    L_BP12a% = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) < FX##(A_1a0c!(0, 0)) + V_0eaa!)   '@24fd5 DS:254c
    IF NOT ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) > FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! OR L_BP12a%) <> 0) THEN GOTO L_250b3   '@2507f
    BEEP   '@250a1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24cde   '@250ab
L_250b3:
    A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@250b3
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) THEN GOTO L_25163   '@25105
    BEEP   '@25151
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24cde   '@2515b
L_25163:
L_25168:
    LOCATE 25, 1   '@2516d
    PRINT RT_STRINGC$((80), (32));   '@25188
    LOCATE 25, 1   '@251a0
    PRINT " Comprimento do Gancho Esquerdo (cm) *"; LTRIM$(STR$(A_1b20!(RT_CINT%(FX##(V_0e44!)), 0))); "*";   '@251bb DS:2420,2a4e
    RT_LINEINPUTPV " ", V_0dfc$   '@25204 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2523b   '@2521e
    GOTO L_252a9   '@25233
L_2523b:
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_25271   '@2523b DS:25d0
    BEEP   '@2525f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25168   '@25269
L_25271:
    A_1b20!(RT_CINT%(FX##(V_0e44!)), 0) = VAL(V_0dfc$)   '@25271
L_252a9:
    LOCATE 25, 1   '@252ae
    PRINT RT_STRINGC$((80), (32));   '@252c9
    LOCATE 25, 1   '@252e1
    PRINT " Comprimento do Gancho Direito (cm) *"; LTRIM$(STR$(A_1b20!(RT_CINT%(FX##(V_0e44!)), 1))); "*";   '@252fc DS:2420,2a78
    RT_LINEINPUTPV " ", V_0dfc$   '@25346 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2537d   '@25360
    GOTO L_253ec   '@25375
L_2537d:
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_253b3   '@2537d DS:25d0
    BEEP   '@253a1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_252a9   '@253ab
L_253b3:
    A_1b20!(RT_CINT%(FX##(V_0e44!)), 1) = VAL(V_0dfc$)   '@253b3
L_253ec:
    RETURN   '@253f1
L_25400:
    LOCATE 24, 1   '@25405
    PRINT RT_STRINGC$((80), (32));   '@25420
    LOCATE 24, 1   '@25438
    PRINT " Posicao "; V_18ea$; RT_MID2$((STR$(V_0e44!)), (2)); "   Quantidade *"; LTRIM$(STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0))); "*";   '@25453 DS:2420,29c4,29d2
    RT_LINEINPUT " ", V_0dfc$   '@254cf DS:25bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_25506   '@254e9
    GOTO L_25574   '@254fe
L_25506:
    IF NOT (VAL(V_0dfc$) <= 0.0#) THEN GOTO L_2553c   '@25506 DS:25d0
    BEEP   '@2552a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25400   '@25534
L_2553c:
    A_1af2!(RT_CINT%(FX##(V_0e44!)), 0) = VAL(V_0dfc$)   '@2553c
L_25574:
    LOCATE 24, 35   '@25579
    PRINT "Bitola (mm) *"; LTRIM$(STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1))); "*";   '@25597 DS:2420,29e6
    RT_LINEINPUT " ", V_0dfc$   '@255e1 DS:25bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f7e! = 1.0 - FX##(V_0de0!)   '@255fb DS:254c
    V_0f82! = 0.0   '@25611 DS:2548
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2563f   '@25622
    GOTO L_25740   '@25637
L_2563f:
    V_0e20! = VAL(V_0dfc$)   '@2563f
    L_BP0e! = V_0e44!   '@25659
    V_0e44! = V_0e20!   '@25669
    GOSUB L_2ab31   '@2567a
    V_0e20! = V_0e44!   '@25687
    V_0e44! = L_BP0e!   '@25698
    L_BP12c% = (V_0e20! = 0.0)   '@256a8 DS:2548
    IF NOT ((FX##(V_0e20!) = FX##(VAL(V_0dfc$)) OR L_BP12c%) <> 0) THEN GOTO L_25707   '@256ce
    BEEP   '@256f5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25574   '@256ff
L_25707:
    A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) = VAL(V_0dfc$)   '@25707
L_25740:
    L_BP130! = FX##(V_0ddc!) + V_0de4!   '@25745
    FOR V_0e20! = 1.0 - FX##(V_0de0!) TO L_BP130!   '@2575c DS:254c
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e20!)), 1)) THEN GOTO L_257ca   '@25768
    V_0f7e! = FX##(V_0e20!) + 1.0   '@257b4 DS:254c
L_257ca:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e44!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) THEN GOTO L_25829   '@257ca
    V_0f82! = V_0e20!   '@25818
L_25829:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e20!   '@25829 DS:254c
    V_0e20! = V_0f7e!   '@25855
L_2586b:
    LOCATE 25, 1   '@25870
    PRINT " Inicio-Distancia (cm "; CHR$(26); " +) a partir da face ";   '@2588b DS:2578,29f8
    IF NOT (V_0e20! = 0.0) THEN GOTO L_2591b   '@258b1 DS:2548
    PRINT "esquerda do Balanco *"; LTRIM$(STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 2))); "*";   '@258cc DS:2420,2a12
    GOTO L_259c5   '@25913
L_2591b:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2)); " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)))); "*";   '@2591b DS:2420,25aa,25b8,2a2c
L_259c5:
    RT_LINEINPUTPV " ", V_0dfc$   '@259c5 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@259df
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_25a7b   '@259f7
    V_0e30! = 3.0   '@25a19 DS:25c2
    V_0e34! = FX##(V_0e20!) - 1.0   '@25a2a DS:25b8
    GOSUB L_2636c   '@25a40
    IF NOT (V_0dfc$ = "*") THEN GOTO L_25a76   '@25a4d DS:2420
    BEEP   '@25a64
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2586b   '@25a6e
L_25a76:
L_25a7b:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_25afb   '@25a7b DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@25a9d DS:25cc
L_25afb:
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_25b18   '@25afb
    GOTO L_25c4a   '@25b10
L_25b18:
    L_BP132% = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) < FX##(A_1a0c!(0, 0)) + V_0eaa!)   '@25b18 DS:254c
    IF NOT ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) > FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! OR L_BP132%) <> 0) THEN GOTO L_25bf6   '@25bc2
    BEEP   '@25be4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2586b   '@25bee
L_25bf6:
    A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@25bf6
L_25c4a:
    LOCATE 25, 1   '@25c4f
    PRINT RT_STRINGC$((80), (32));   '@25c6a
    V_0e20! = V_0f82!   '@25c82
    LOCATE 25, 1   '@25c93
    PRINT " Termino-Distancia (cm "; CHR$(26); " +) a partir da face ";   '@25cae DS:2578,2a32
    IF NOT (V_0e20! = 0.0) THEN GOTO L_25d41   '@25cd4 DS:2548
    PRINT "esquerda do Balanco *"; LTRIM$(STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3))); "*";   '@25cef DS:2420,2a12
    GOTO L_25dee   '@25d39
L_25d41:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e20!) - 1.0))), (2)); " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)))); "*";   '@25d41 DS:2420,25aa,25b8,2a2c
L_25dee:
    RT_LINEINPUTPV " ", V_0dfc$   '@25dee DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@25e08
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = V_18ea$) THEN GOTO L_25ea4   '@25e20
    V_0e30! = 2.0   '@25e42 DS:25cc
    V_0e34! = FX##(V_0e20!) - 1.0   '@25e53 DS:25b8
    GOSUB L_2636c   '@25e69
    IF NOT (V_0dfc$ = "*") THEN GOTO L_25e9f   '@25e76 DS:2420
    BEEP   '@25e8d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25c4a   '@25e97
L_25e9f:
L_25ea4:
    IF NOT (RT_MID$((V_0dfc$), (1), (1)) = "M") THEN GOTO L_25f24   '@25ea4 DS:25c6
    V_0dfc$ = RT_STR8$(RT_DBL#(FX##(A_1926!(RT_CINT%(FX##(V_0e20!)), 1)) / 2.0 + VAL(RT_MID2$((V_0dfc$), (2)))))   '@25ec6 DS:25cc
L_25f24:
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_25f41   '@25f24
    GOTO L_260d4   '@25f39
L_25f41:
    L_BP134% = (FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) < FX##(A_1a0c!(0, 0)) + V_0eaa!)   '@25f41 DS:254c
    IF NOT ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$) > FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! OR L_BP134%) <> 0) THEN GOTO L_2601f   '@25feb
    BEEP   '@2600d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25c4a   '@26017
L_2601f:
    A_1af2!(RT_CINT%(FX##(V_0e44!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e20!)), 0)) + VAL(V_0dfc$)   '@2601f
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) THEN GOTO L_260cf   '@26071
    BEEP   '@260bd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25c4a   '@260c7
L_260cf:
L_260d4:
    LOCATE 25, 1   '@260d9
    PRINT RT_STRINGC$((80), (32));   '@260f4
    LOCATE 25, 1   '@2610c
    PRINT " Comprimento do Gancho Esquerdo (cm) *"; LTRIM$(STR$(A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0))); "*";   '@26127 DS:2420,2a4e
    RT_LINEINPUTPV " ", V_0dfc$   '@26170 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_261a7   '@2618a
    GOTO L_26215   '@2619f
L_261a7:
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_261dd   '@261a7 DS:25d0
    BEEP   '@261cb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_260d4   '@261d5
L_261dd:
    A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0) = VAL(V_0dfc$)   '@261dd
L_26215:
    LOCATE 25, 1   '@2621a
    PRINT RT_STRINGC$((80), (32));   '@26235
    LOCATE 25, 1   '@2624d
    PRINT " Comprimento do Gancho Direito (cm) *"; LTRIM$(STR$(A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1))); "*";   '@26268 DS:2420,2a78
    RT_LINEINPUTPV " ", V_0dfc$   '@262b2 DS:25bc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_262e9   '@262cc
    GOTO L_26358   '@262e1
L_262e9:
    IF NOT (VAL(V_0dfc$) < 0.0#) THEN GOTO L_2631f   '@262e9 DS:25d0
    BEEP   '@2630d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26215   '@26317
L_2631f:
    A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1) = VAL(V_0dfc$)   '@2631f
L_26358:
    RETURN   '@2635d
L_2636c:   ' sub-rotina (alvo de GOSUB)
    V_0e28! = VAL(RT_MID2$((V_0dfc$), (2)))   '@26371
    L_BP136% = (V_0e28! < 1.0 OR V_0e28! > V_185e!)   '@26399 DS:254c
    IF NOT ((INT(FX##(V_0e28!)) <> FX##(V_0e28!) OR L_BP136%) <> 0) THEN GOTO L_26419   '@263e0
    V_0dfc$ = "*"   '@263fd DS:2420
    RETURN   '@2640f
L_26419:
    IF NOT (RT_INSTR%((1), (V_0dfc$), ("+")) = 0) THEN GOTO L_2646f   '@26419 DS:2aa2
    L_BP12! = A_1af2!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))   '@26436
    GOTO L_264d0   '@26467
L_2646f:
    L_BP12! = FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))) + VAL(RT_MID2$((V_0dfc$), (RT_INSTR%((1), (V_0dfc$), ("+")) + 1)))   '@2646f DS:2aa2
L_264d0:
    IF NOT (RT_INSTR%((1), (V_0dfc$), ("-")) <> 0) THEN GOTO L_26549   '@264d0 DS:2aa8
    L_BP12! = FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))) - VAL(RT_MID2$((V_0dfc$), (RT_INSTR%((1), (V_0dfc$), ("-")) + 1)))   '@264ed DS:2aa8
L_26549:
    V_0dfc$ = STR$(RT_SNG!(FX##(L_BP12!) - A_1a0c!(RT_CINT%(FX##(V_0e34!) + 1.0), 0)))   '@26549 DS:254c
    RETURN   '@2658e
L_2659d:   ' sub-rotina (alvo de GOSUB)
    V_0e28! = FX##(VAL(RT_MID2$((V_0dfc$), (2)))) - V_185e! - V_1872!   '@265a2
    L_BP138% = (V_0e28! < 1.0 OR V_0e28! > V_1866!)   '@265da DS:254c
    IF NOT ((INT(FX##(V_0e28!)) <> FX##(V_0e28!) OR L_BP138%) <> 0) THEN GOTO L_2665a   '@26621
    V_0dfc$ = "*"   '@2663e DS:2420
    RETURN   '@26650
L_2665a:
    IF NOT (RT_INSTR%((1), (V_0dfc$), ("+")) = 0) THEN GOTO L_266b0   '@2665a DS:2aa2
    L_BP12! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))   '@26677
    GOTO L_26711   '@266a8
L_266b0:
    L_BP12! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))) + VAL(RT_MID2$((V_0dfc$), (RT_INSTR%((1), (V_0dfc$), ("+")) + 1)))   '@266b0 DS:2aa2
L_26711:
    IF NOT (RT_INSTR%((1), (V_0dfc$), ("-")) <> 0) THEN GOTO L_2678a   '@26711 DS:2aa8
    L_BP12! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), RT_CINT%(FX##(V_0e30!)))) - VAL(RT_MID2$((V_0dfc$), (RT_INSTR%((1), (V_0dfc$), ("-")) + 1)))   '@2672e DS:2aa8
L_2678a:
    V_0dfc$ = STR$(RT_SNG!(FX##(L_BP12!) - A_1a0c!(RT_CINT%(FX##(V_0e34!) + 1.0), 0)))   '@2678a DS:254c
    RETURN   '@267cf
L_267de:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@267e3
    PRINT " Juncao de Ferragem"   '@267f1 DS:2aae
L_26804:
    LOCATE 24, 1   '@26809
    RT_LINEINPUT " Primeira posicao *RETORNO* ", V_0dfc$   '@26824 DS:2ac6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0dfc$)   '@2683e
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_26889   '@26858
    V_0dfc$ = "RET"   '@2686d DS:2320
    RETURN   '@2687f
L_26889:
    L_BP13a% = (VAL(V_0dfc$) <= 0.0#)   '@26889 DS:25d0
    L_BP13c% = FX##(VAL(V_0dfc$)) > FX##(V_185e!) + V_1866! + V_1872! OR L_BP13a%   '@268c7
    L_BP13e% = (FX##(VAL(V_0dfc$)) > FX##(V_185e!))   '@268f1
    IF NOT ((FX##(VAL(V_0dfc$)) <= FX##(V_185e!) + V_1872! AND L_BP13e% OR L_BP13c%) <> 0) THEN GOTO L_26954   '@2691c
    BEEP   '@26942
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26804   '@2694c
L_26954:
L_26959:
    LOCATE 24, 40   '@2695e
    RT_LINEINPUT "Segunda posicao *VOLTA* ", V_0dfc$   '@2697c DS:2ae6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e! = VAL(V_0dfc$)   '@26996
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_269cc   '@269af
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_267de   '@269c4
L_269cc:
    L_BP140% = (VAL(V_0dfc$) <= 0.0#)   '@269cc DS:25d0
    L_BP142% = FX##(VAL(V_0dfc$)) > FX##(V_185e!) + V_1866! + V_1872! OR L_BP140%   '@26a0a
    L_BP144% = (FX##(VAL(V_0dfc$)) > FX##(V_185e!))   '@26a34
    IF NOT ((FX##(VAL(V_0dfc$)) <= FX##(V_185e!) + V_1872! AND L_BP144% OR L_BP142%) <> 0) THEN GOTO L_26a97   '@26a5f
    BEEP   '@26a85
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26959   '@26a8f
L_26a97:
    IF NOT (L_BP0e! <= V_185e! AND FX##(V_185e!) + V_1872! < FX##(V_0e44!) OR FX##(V_185e!) + V_1872! < FX##(L_BP0e!) AND V_0e44! <= V_185e!) THEN GOTO L_26b79   '@26a97
    BEEP   '@26b13
    LOCATE 25, 1   '@26b1d
    PRINT " NAO PODEMOS JUNTAR FERROS POSITIVOS COM NEGATICOS ";   '@26b38 DS:2b02
    CALL MIXT_07f1_LimpaTeclado   '@26b46
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@26b50
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_267de   '@26b6c
L_26b79:
    V_0e14! = FX##(V_0e44!) - V_185e! - V_1872!   '@26b79
    V_0e1c! = FX##(L_BP0e!) - V_185e! - V_1872!   '@26b94
    IF NOT (V_0e44! <= V_185e!) THEN GOTO L_26bf2   '@26bae
    V_0e14! = V_0e44!   '@26bc9
    V_0e1c! = L_BP0e!   '@26bda
    GOTO L_27b56   '@26bea
L_26bf2:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) <> A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 1)) THEN GOTO L_26d9f   '@26bf2
    BEEP   '@26c4b
    LOCATE 25, 1   '@26c55
    CALL MIXT_07f1_LimpaTeclado   '@26c70
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " Junto pela maior Bitola <S> ou <*R*>etorno ", V_0dfc$   '@26c7a DS:2b3a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "S") THEN GOTO L_26cb9   '@26c94 DS:23fc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_267de   '@26cb1
L_26cb9:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 1)) THEN GOTO L_26d55   '@26cb9
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 1) = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)   '@26d08
    GOTO L_26d9a   '@26d4d
L_26d55:
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 1)   '@26d55
L_26d9a:
L_26d9f:
    GOSUB L_2795b   '@26d9f
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_26e01   '@26dac
    GOTO L_27312   '@26df9
L_26e01:
    V_0e28! = V_0e14!   '@26e01
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) > A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_26e70   '@26e12
    V_0e28! = V_0e1c!   '@26e5f
L_26e70:
    IF NOT (V_0e28! = V_0e14!) THEN GOTO L_26ef4   '@26e70
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)   '@26e8b
    GOTO L_26f55   '@26eec
L_26ef4:
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)   '@26ef4
L_26f55:
    A_1b20!(RT_CINT%(FX##(V_0e28!)), 0) = 0.0 - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b20!(RT_CINT%(FX##(V_0e1c!)), 0)   '@26f55 DS:2548
    A_1b20!(RT_CINT%(FX##(V_0e28!)), 1) = 0.0 - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b20!(RT_CINT%(FX##(V_0e1c!)), 1)   '@27055 DS:2548
    L_BP148! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@27164
    L_BP14c! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@2718d
    CALL MIXT_0877_Menor(L_BP148!, L_BP14c!, L_BP150!)   '@271af
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP14c!   '@271c4
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP148!   '@271e7
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP150!   '@2720a
    L_BP154! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@2722c
    L_BP158! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@27258
    CALL MIXT_082a_Maior(L_BP154!, L_BP158!, L_BP15c!)   '@2727d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP158!   '@27292
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP154!   '@272b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP15c!   '@272de
    RETURN   '@27303
L_27312:
    CALL MIXT_0877_Menor(V_0e14!, V_0e1c!, L_BP160!)   '@27317
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP160!   '@2732f
    A_1b20!(RT_CINT%(FX##(V_0e28!)), 0) = 0.0 - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) < A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b20!(RT_CINT%(FX##(V_0e1c!)), 0)   '@2733a DS:2548
    A_1b20!(RT_CINT%(FX##(V_0e28!)), 1) = 0.0 - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) > A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b20!(RT_CINT%(FX##(V_0e1c!)), 1)   '@2743a DS:2548
    L_BP164! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@27549
    L_BP168! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@27572
    CALL MIXT_0877_Menor(L_BP164!, L_BP168!, L_BP16c!)   '@27594
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP168!   '@275a9
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP164!   '@275cc
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP16c!   '@275ef
    L_BP170! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@27611
    L_BP174! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@2763d
    CALL MIXT_082a_Maior(L_BP170!, L_BP174!, L_BP178!)   '@27662
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP174!   '@27677
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP170!   '@2769d
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP178!   '@276c3
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP17c!)   '@276e8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP17c! >= V_1866!) THEN GOTO L_2771d   '@27700
    GOTO L_27931   '@27715
L_2771d:
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP180!)   '@2771d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP184! = V_1866!   '@27735
    FOR V_0e28! = FX##(L_BP180!) + 1.0 TO L_BP184!   '@27741 DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)   '@2774e DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@27796 DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)   '@277e0 DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)   '@27824 DS:25b8
    A_1b20!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1b20!(RT_CINT%(FX##(V_0e28!)), 0)   '@2786e DS:25b8
    A_1b20!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1b20!(RT_CINT%(FX##(V_0e28!)), 1)   '@278b6 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@27900 DS:254c
L_27931:
    V_1866! = FX##(V_1866!) - 1.0   '@27936 DS:25b8
    RETURN   '@2794c
L_2795b:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) OR A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) <= A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) AND A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) THEN GOTO L_27b47   '@27960
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)   '@27a9e
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)   '@27aff
L_27b47:
    RETURN   '@27b47
L_27b56:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) <> A_1af2!(RT_CINT%(FX##(V_0e1c!)), 1)) THEN GOTO L_27cfe   '@27b5b
    BEEP   '@27baa
    LOCATE 25, 1   '@27bb4
    CALL MIXT_07f1_LimpaTeclado   '@27bcf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " Junto pela maior Bitola <S> ou <*R*>etorno ", V_0dfc$   '@27bd9 DS:2b3a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) <> "S") THEN GOTO L_27c18   '@27bf3 DS:23fc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_267de   '@27c10
L_27c18:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > A_1af2!(RT_CINT%(FX##(V_0e1c!)), 1)) THEN GOTO L_27cb4   '@27c18
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 1) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)   '@27c67
    GOTO L_27cf9   '@27cac
L_27cb4:
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 1)   '@27cb4
L_27cf9:
L_27cfe:
    GOSUB L_288b9   '@27cfe
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_27d60   '@27d0b
    GOTO L_28271   '@27d58
L_27d60:
    V_0e28! = V_0e14!   '@27d60
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) > A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_27dcf   '@27d71
    V_0e28! = V_0e1c!   '@27dbe
L_27dcf:
    IF NOT (V_0e28! = V_0e14!) THEN GOTO L_27e53   '@27dcf
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)   '@27dea
    GOTO L_27eb4   '@27e4b
L_27e53:
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)   '@27e53
L_27eb4:
    A_1b4e!(RT_CINT%(FX##(V_0e28!)), 0) = 0.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b4e!(RT_CINT%(FX##(V_0e1c!)), 0)   '@27eb4 DS:2548
    A_1b4e!(RT_CINT%(FX##(V_0e28!)), 1) = 0.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b4e!(RT_CINT%(FX##(V_0e1c!)), 1)   '@27fb4 DS:2548
    L_BP188! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@280c3
    L_BP18c! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@280ec
    CALL MIXT_0877_Menor(L_BP188!, L_BP18c!, L_BP190!)   '@2810e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP18c!   '@28123
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP188!   '@28146
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP190!   '@28169
    L_BP194! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@2818b
    L_BP198! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@281b7
    CALL MIXT_082a_Maior(L_BP194!, L_BP198!, L_BP19c!)   '@281dc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP198!   '@281f1
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP194!   '@28217
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP19c!   '@2823d
    RETURN   '@28262
L_28271:
    CALL MIXT_0877_Menor(V_0e14!, V_0e1c!, L_BP1a0!)   '@28276
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP1a0!   '@2828e
    A_1b4e!(RT_CINT%(FX##(V_0e28!)), 0) = 0.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) * A_1b4e!(RT_CINT%(FX##(V_0e1c!)), 0)   '@28299 DS:2548
    A_1b4e!(RT_CINT%(FX##(V_0e28!)), 1) = 0.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) * A_1b4e!(RT_CINT%(FX##(V_0e1c!)), 1)   '@28399 DS:2548
    L_BP1a4! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@284a8
    L_BP1a8! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@284d1
    CALL MIXT_0877_Menor(L_BP1a4!, L_BP1a8!, L_BP1ac!)   '@284f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP1a8!   '@28508
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP1a4!   '@2852b
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP1ac!   '@2854e
    L_BP1b0! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@28570
    L_BP1b4! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@2859c
    CALL MIXT_082a_Maior(L_BP1b0!, L_BP1b4!, L_BP1b8!)   '@285c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP1b4!   '@285d6
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP1b0!   '@285fc
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP1b8!   '@28622
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP1bc!)   '@28647
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1bc! >= V_185e!) THEN GOTO L_2867c   '@2865f
    GOTO L_2888f   '@28674
L_2867c:
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP1c0!)   '@2867c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1c4! = V_185e!   '@28694
    FOR V_0e28! = FX##(L_BP1c0!) + 1.0 TO L_BP1c4!   '@286a0 DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)   '@286ac DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@286f4 DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)   '@2873e DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)   '@28782 DS:25b8
    A_1b4e!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1b4e!(RT_CINT%(FX##(V_0e28!)), 0)   '@287cc DS:25b8
    A_1b4e!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1b4e!(RT_CINT%(FX##(V_0e28!)), 1)   '@28814 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2885e DS:254c
L_2888f:
    V_185e! = FX##(V_185e!) - 1.0   '@28894 DS:25b8
    RETURN   '@288aa
L_288b9:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) OR A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) <= A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) AND A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) THEN GOTO L_28aa5   '@288be
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)   '@289fc
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)   '@28a5d
L_28aa5:
    RETURN   '@28aa5
L_28ab4:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@28ab9
    PRINT " Separacao de Ferragem"   '@28ac7 DS:2b6a
    RT_LINEINPUT " Numero da Posicao a ser Separada *RETORNO* ", V_0dfc$   '@28ad5 DS:2b84
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@28aef
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_28b38   '@28b07
    V_0dfc$ = "RET"   '@28b1c DS:2320
    RETURN   '@28b2e
L_28b38:
    L_BP1c6% = (VAL(V_0dfc$) <= 0.0#)   '@28b38 DS:25d0
    L_BP1c8% = FX##(VAL(V_0dfc$)) > FX##(V_1866!) + V_185e! + V_1872! OR L_BP1c6%   '@28b76
    L_BP1ca% = (FX##(VAL(V_0dfc$)) > FX##(V_185e!))   '@28ba0
    IF NOT ((FX##(VAL(V_0dfc$)) < FX##(V_1866!) AND L_BP1ca% OR L_BP1c8%) <> 0) THEN GOTO L_28bfe   '@28bc6
    BEEP   '@28bec
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28ab4   '@28bf6
L_28bfe:
    V_0e44! = VAL(V_0dfc$)   '@28bfe
    IF NOT (V_0e44! <= V_185e!) THEN GOTO L_28c3b   '@28c18
    GOTO L_29416   '@28c33
L_28c3b:
    V_0e44! = FX##(V_0e44!) - V_185e! - V_1872!   '@28c3b
L_28c5b:
    LOCATE 24, 1   '@28c60
    PRINT RT_STRINGC$((80), (32));   '@28c7b
    LOCATE 24, 1   '@28c93
    V_0e28! = INT(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)) * 7.5)   '@28cae DS:292e
    PRINT " Comprimento de Emenda *"; LTRIM$(STR$(V_0e28!));   '@28ce5 DS:2bb4
    RT_LINEINPUT "* ", V_0dfc$   '@28d0c DS:2932
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_28d43   '@28d26
    GOTO L_28e40   '@28d3b
L_28d43:
    V_0e28! = VAL(V_0dfc$)   '@28d43
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) <= FX##(V_0e28!) OR (FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)) * 10.0 < FX##(V_0e28!) OR A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > V_0e28!)) THEN GOTO L_28e3b   '@28d5d DS:2bd0
    BEEP   '@28e29
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28c5b   '@28e33
L_28e3b:
L_28e40:
    LOCATE 25, 1   '@28e45
    V_0e20! = INT((FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) - V_0e28!) / 2.0)   '@28e60 DS:25cc
    PRINT " A partir da ponta da Barra ("; CHR$(26); " +), Distancia do Inicio da Emenda *"; LTRIM$(STR$(V_0e20!));   '@28eb8 DS:2bd4,2bf6
    RT_LINEINPUTPV "* ", V_0dfc$   '@28ef7 DS:2932 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_28f2e   '@28f11
    GOTO L_28fda   '@28f26
L_28f2e:
    V_0e20! = VAL(V_0dfc$)   '@28f2e
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) - V_0e28! <= FX##(V_0e20!) OR V_0e20! <= 0.0) THEN GOTO L_28fd5   '@28f48 DS:2548
    BEEP   '@28fc3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28e40   '@28fcd
L_28fd5:
L_28fda:
    L_BP1ce! = FX##(V_0e44!) + 1.0   '@28fdf DS:254c
    FOR V_0e14! = V_1866! TO L_BP1ce! STEP -1.0   '@28ff6 DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)   '@28ffe DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e14!) + 1.0), 1) = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)   '@29046 DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e14!) + 1.0), 2) = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@29090 DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e14!) + 1.0), 3) = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@290d4 DS:254c
    A_1b20!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) = A_1b20!(RT_CINT%(FX##(V_0e14!)), 0)   '@2911e DS:254c
    A_1b20!(RT_CINT%(FX##(V_0e14!) + 1.0), 1) = A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@29166 DS:254c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@291b0 DS:25b8
    V_1866! = FX##(V_1866!) + 1.0   '@291dc DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e44!) + 1.0), 0) = A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)   '@291f2 DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) = A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)   '@2923a DS:254c
    A_1b20!(RT_CINT%(FX##(V_0e44!) + 1.0), 0) = 0.0   '@29284 DS:2548,254c
    A_1b20!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) = A_1b20!(RT_CINT%(FX##(V_0e44!)), 1)   '@292b3 DS:254c
    A_1b20!(RT_CINT%(FX##(V_0e44!)), 1) = 0.0   '@292fd DS:2548
    A_1ac4!(RT_CINT%(FX##(V_0e44!) + 1.0), 3) = A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)   '@29328 DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2)) + V_0e20! + V_0e28!   '@29372
    A_1ac4!(RT_CINT%(FX##(V_0e44!) + 1.0), 2) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2)) + V_0e20!   '@293be DS:254c
    RETURN   '@29407
L_29416:
    LOCATE 24, 1   '@2941b
    PRINT RT_STRINGC$((80), (32));   '@29436
    LOCATE 24, 1   '@2944e
    V_0e28! = INT(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)) * 7.5)   '@29469 DS:292e
    PRINT " Comprimento de Emenda *"; LTRIM$(STR$(V_0e28!));   '@294a0 DS:2bb4
    RT_LINEINPUT "* ", V_0dfc$   '@294c7 DS:2932
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_294fe   '@294e1
    GOTO L_29600   '@294f6
L_294fe:
    V_0e28! = VAL(V_0dfc$)   '@294fe
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) <= FX##(V_0e28!) OR (FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)) * 10.0 < FX##(V_0e28!) OR FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)) * 4.0 > FX##(V_0e28!))) THEN GOTO L_295fb   '@29518 DS:2938,2bd0
    BEEP   '@295e9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29416   '@295f3
L_295fb:
L_29600:
    LOCATE 25, 1   '@29605
    V_0e20! = INT((FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) - V_0e28!) / 2.0)   '@29620 DS:25cc
    PRINT " A partir da Ponta da Barra ("; CHR$(26); " +), Distancia do inicio da Emenda *"; LTRIM$(STR$(V_0e20!));   '@29678 DS:2c1e,2c40
    RT_LINEINPUTPV "* ", V_0dfc$   '@296b7 DS:2932 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_296ee   '@296d1
    GOTO L_2979a   '@296e6
L_296ee:
    V_0e20! = VAL(V_0dfc$)   '@296ee
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) - V_0e28! <= FX##(V_0e20!) OR V_0e20! <= 0.0) THEN GOTO L_29795   '@29708 DS:2548
    BEEP   '@29783
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29600   '@2978d
L_29795:
L_2979a:
    L_BP1d2! = FX##(V_0e44!) + 1.0   '@2979f DS:254c
    FOR V_0e14! = V_185e! TO L_BP1d2! STEP -1.0   '@297b6 DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)   '@297be DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e14!) + 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)   '@29806 DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e14!) + 1.0), 2) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@29850 DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e14!) + 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@29894 DS:254c
    A_1b4e!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0)   '@298de DS:254c
    A_1b4e!(RT_CINT%(FX##(V_0e14!) + 1.0), 1) = A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@29926 DS:254c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@29970 DS:25b8
    V_185e! = FX##(V_185e!) + 1.0   '@2999c DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e44!) + 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)   '@299b2 DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)   '@299fa DS:254c
    A_1b4e!(RT_CINT%(FX##(V_0e44!) + 1.0), 0) = 0.0   '@29a44 DS:2548,254c
    A_1b4e!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) = A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1)   '@29a73 DS:254c
    A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1) = 0.0   '@29abd DS:2548
    A_1af2!(RT_CINT%(FX##(V_0e44!) + 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)   '@29ae8 DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e44!)), 3) = FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 2)) + V_0e20! + V_0e28!   '@29b32
    A_1af2!(RT_CINT%(FX##(V_0e44!) + 1.0), 2) = FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 2)) + V_0e20!   '@29b7e DS:254c
    RETURN   '@29bc7
L_29bd6:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@29bdb
    PRINT " Deletar Ferragem"   '@29be9 DS:2c68
    PRINT " para deletar todos: <PO> ou <NE> ou <GP> ou <GN> ou <TODOS>"   '@29bf7 DS:2c7e
    RT_LINEINPUTPV " Numero da posicao que sera Deletada *RETORNO* ", V_0dfc$   '@29c05 DS:2cbe (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@29c1f
    V_0e44! = VAL(V_0dfc$)   '@29c37
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_29c82   '@29c51
    V_0dfc$ = "RET"   '@29c66 DS:2320
    RETURN   '@29c78
L_29c82:
    L_BP1d4% = (FX##(V_185e!) + V_1866! + V_1872! + V_1876! < FX##(V_0e44!) OR V_0e44! <= 0.0)   '@29c82 DS:2548
    L_BP1d6% = V_0dfc$ <> "TODOS" AND L_BP1d4%   '@29cd6 DS:2cf2
    L_BP1d8% = V_0dfc$ <> "GN" AND L_BP1d6%   '@29cf3 DS:2cfc
    L_BP1da% = V_0dfc$ <> "GP" AND L_BP1d8%   '@29d10 DS:2d02
    L_BP1dc% = V_0dfc$ <> "NE" AND L_BP1da%   '@29d2d DS:2d08
    IF NOT ((V_0dfc$ <> "PO" AND L_BP1dc%) <> 0) THEN GOTO L_29d72   '@29d4a DS:2d0e
    BEEP   '@29d60
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29bd6   '@29d6a
L_29d72:
    LOCATE 24, 1   '@29d72
    PRINT RT_STRINGC$((65), (32))   '@29d8d
    LOCATE 24, 1   '@29da5
    PRINT " Deletar Posicao "; V_0dfc$;   '@29dc0 DS:2d14
    RT_LINEINPUTPV " SIM/*N* ", V_0e00$   '@29dd7 DS:2d2a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e00$) <> "SIM") THEN GOTO L_29e16   '@29df1 DS:2d38
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29bd6   '@29e0e
L_29e16:
    IF NOT (LEN(A_1c90$(6) + A_1c90$(7) + A_1c90$(8) + A_1c90$(9)) > 0) THEN GOTO L_29eee   '@29e16
    LOCATE 24, 40   '@29e7d
    BEEP   '@29e9b
    PRINT "<< Verifique as Notas das Armaduras >>";   '@29ea5 DS:2d40
    FOR V_0e28! = 1.0 TO 15000.0   '@29eb3 DS:254c,2d6a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@29ec0 DS:254c,2d6a
L_29eee:
    IF NOT (V_0dfc$ = "PO") THEN GOTO L_29f20   '@29eee DS:2d0e
    V_1866! = 0.0   '@29f05 DS:2548
    RETURN   '@29f16
L_29f20:
    IF NOT (V_0dfc$ = "NE") THEN GOTO L_29f52   '@29f20 DS:2d08
    V_185e! = 0.0   '@29f37 DS:2548
    RETURN   '@29f48
L_29f52:
    IF NOT (V_0dfc$ = "GP") THEN GOTO L_29f84   '@29f52 DS:2d02
    V_1876! = 0.0   '@29f69 DS:2548
    RETURN   '@29f7a
L_29f84:
    IF NOT (V_0dfc$ = "GN") THEN GOTO L_29fb6   '@29f84 DS:2cfc
    V_1872! = 0.0   '@29f9b DS:2548
    RETURN   '@29fac
L_29fb6:
    IF NOT (V_0dfc$ = "TODOS") THEN GOTO L_2a01b   '@29fb6 DS:2cf2
    V_1866! = 0.0   '@29fcd DS:2548
    V_185e! = 0.0   '@29fde DS:2548
    V_1876! = 0.0   '@29fef DS:2548
    V_1872! = 0.0   '@2a000 DS:2548
    RETURN   '@2a011
L_2a01b:
    IF NOT (FX##(V_185e!) + V_1872! < FX##(V_0e44!)) THEN GOTO L_2a05e   '@2a01b
    V_0e44! = FX##(V_0e44!) - V_185e! - V_1872!   '@2a03b
    GOTO L_2a53b   '@2a056
L_2a05e:
    IF NOT (V_0e44! > V_185e!) THEN GOTO L_2a097   '@2a05e
    V_0e44! = FX##(V_0e44!) - V_185e!   '@2a079
    GOTO L_2a2e5   '@2a08f
L_2a097:
    IF NOT (V_0e44! = V_185e!) THEN GOTO L_2a0ba   '@2a097
    GOTO L_2a2bb   '@2a0b2
L_2a0ba:
    L_BP1e0! = V_185e!   '@2a0ba
    FOR V_0e28! = FX##(V_0e44!) + 1.0 TO L_BP1e0!   '@2a0cc DS:254c
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a0d8 DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a120 DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)   '@2a16a DS:25b8
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)   '@2a1ae DS:25b8
    A_1b4e!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1b4e!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a1f8 DS:25b8
    A_1b4e!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1b4e!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a240 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2a28a DS:254c
L_2a2bb:
    V_185e! = FX##(V_185e!) - 1.0   '@2a2c0 DS:25b8
    RETURN   '@2a2d6
L_2a2e5:
    IF NOT (V_0e44! = V_1872!) THEN GOTO L_2a30d   '@2a2ea
    GOTO L_2a511   '@2a305
L_2a30d:
    L_BP1e4! = V_1872!   '@2a30d
    FOR V_0e28! = FX##(V_0e44!) + 1.0 TO L_BP1e4!   '@2a31f DS:254c
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a32c DS:25b8
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a374 DS:25b8
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 2)   '@2a3be DS:25b8
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 3)   '@2a402 DS:25b8
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 4) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 4)   '@2a44c DS:25b8
    A_1bd8!(RT_CINT%(FX##(V_0e28!) - 1.0), 5) = A_1bd8!(RT_CINT%(FX##(V_0e28!)), 5)   '@2a496 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2a4e0 DS:254c
L_2a511:
    V_1872! = FX##(V_1872!) - 1.0   '@2a516 DS:25b8
    RETURN   '@2a52c
L_2a53b:
    IF NOT (V_0e44! > V_1866!) THEN GOTO L_2a579   '@2a540
    V_0e44! = FX##(V_0e44!) - V_1866!   '@2a55b
    GOTO L_2a7c7   '@2a571
L_2a579:
    IF NOT (V_0e44! = V_1866!) THEN GOTO L_2a59c   '@2a579
    GOTO L_2a79d   '@2a594
L_2a59c:
    L_BP1e8! = V_1866!   '@2a59c
    FOR V_0e28! = FX##(V_0e44!) + 1.0 TO L_BP1e8!   '@2a5ae DS:254c
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a5ba DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a602 DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)   '@2a64c DS:25b8
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)   '@2a690 DS:25b8
    A_1b20!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1b20!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a6da DS:25b8
    A_1b20!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1b20!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a722 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2a76c DS:254c
L_2a79d:
    V_1866! = FX##(V_1866!) - 1.0   '@2a7a2 DS:25b8
    RETURN   '@2a7b8
L_2a7c7:
    IF NOT (V_0e44! = V_1876!) THEN GOTO L_2a7ef   '@2a7cc
    GOTO L_2a9f3   '@2a7e7
L_2a7ef:
    L_BP1ec! = V_1876!   '@2a7ef
    FOR V_0e28! = FX##(V_0e44!) + 1.0 TO L_BP1ec!   '@2a801 DS:254c
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 0)   '@2a80e DS:25b8
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 1)   '@2a856 DS:25b8
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 2)   '@2a8a0 DS:25b8
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 3)   '@2a8e4 DS:25b8
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 4) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 4)   '@2a92e DS:25b8
    A_1baa!(RT_CINT%(FX##(V_0e28!) - 1.0), 5) = A_1baa!(RT_CINT%(FX##(V_0e28!)), 5)   '@2a978 DS:25b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@2a9c2 DS:254c
L_2a9f3:
    V_1876! = FX##(V_1876!) - 1.0   '@2a9f8 DS:25b8
    RETURN   '@2aa0e
L_2aa1d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    RT_CLS 2   '@2aa22
    PRINT " Geracao Automatica de Porta-Estribo"   '@2aa30 DS:2d6e
    PRINT " Geracao Automatica S/N  *"; V_190a$;   '@2aa3e DS:2d96
    CALL MIXT_07f1_LimpaTeclado   '@2aa55
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "* ", V_0dfc$   '@2aa5f DS:2932 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_2aaaa   '@2aa79
    V_0dfc$ = "RET"   '@2aa8e DS:2320
    RETURN   '@2aaa0
L_2aaaa:
    V_0dfc$ = UCASE$(V_0dfc$)   '@2aaaa
    L_BP1ee% = (V_0dfc$ <> "S")   '@2aac2 DS:23fc
    IF NOT ((V_0dfc$ <> "N" AND L_BP1ee%) <> 0) THEN GOTO L_2ab10   '@2aae8 DS:24d2
    BEEP   '@2aafe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2aa1d   '@2ab08
L_2ab10:
    V_190a$ = V_0dfc$   '@2ab10
    RETURN   '@2ab22
L_2ab31:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e44! = V_0eee!) THEN GOTO L_2ab6c   '@2ab36
    V_0e44! = V_0f16!   '@2ab51
    RETURN   '@2ab62
L_2ab6c:
    IF NOT (V_0e44! = V_0ef2!) THEN GOTO L_2aba2   '@2ab6c
    V_0e44! = V_0f1a!   '@2ab87
    RETURN   '@2ab98
L_2aba2:
    IF NOT (V_0e44! = V_0ef6!) THEN GOTO L_2abd8   '@2aba2
    V_0e44! = V_0f1e!   '@2abbd
    RETURN   '@2abce
L_2abd8:
    IF NOT (V_0e44! = V_0efa!) THEN GOTO L_2ac0e   '@2abd8
    V_0e44! = V_0f22!   '@2abf3
    RETURN   '@2ac04
L_2ac0e:
    IF NOT (V_0e44! = V_0efe!) THEN GOTO L_2ac44   '@2ac0e
    V_0e44! = V_0f26!   '@2ac29
    RETURN   '@2ac3a
L_2ac44:
    IF NOT (V_0e44! = V_0f02!) THEN GOTO L_2ac7a   '@2ac44
    V_0e44! = V_0f2a!   '@2ac5f
    RETURN   '@2ac70
L_2ac7a:
    IF NOT (V_0e44! = V_0f06!) THEN GOTO L_2acb0   '@2ac7a
    V_0e44! = V_0f2e!   '@2ac95
    RETURN   '@2aca6
L_2acb0:
    IF NOT (V_0e44! = V_0f0a!) THEN GOTO L_2ace6   '@2acb0
    V_0e44! = V_0f32!   '@2accb
    RETURN   '@2acdc
L_2ace6:
    IF NOT (V_0e44! = V_0f0e!) THEN GOTO L_2ad1c   '@2ace6
    V_0e44! = V_0f36!   '@2ad01
    RETURN   '@2ad12
L_2ad1c:
    IF NOT (V_0e44! = V_0f12!) THEN GOTO L_2ad48   '@2ad1c
    V_0e44! = V_0f3a!   '@2ad37
L_2ad48:
    RETURN   '@2ad48
L_2ad57:   ' entrada vinda de 020146_FUN_2000_0146
    ' @2ad57 libera strings locais (L_BPae)
    ' @2ad61 libera strings locais (L_BP1a)
    ' @2ad6a libera strings locais (L_BP16)
    ' END SUB   '@2ad73
END SUB

SUB S_30137   ' entrada de SUB/FUNCTION (B$ENRA, locais 402 bytes) (0x30137)
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
    DIM L_BP42$
    DIM L_BP46!
    DIM L_BP4a!
    DIM L_BP4e$
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72$
    DIM L_BP74%
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP88!
    DIM L_BP8c$
    DIM L_BP90$
    DIM L_BP94!
    DIM L_BP98!
    DIM L_BP9c$
    DIM L_BPa0$
    DIM L_BPa4!
    DIM L_BPa8!
    DIM L_BPac$
    DIM L_BPb0$
    DIM L_BPb4!
    DIM L_BPb8!
    DIM L_BPbc$
    DIM L_BPc0$
    DIM L_BPc4!
    DIM L_BPc8!
    DIM L_BPcc$
    DIM L_BPd0$
    DIM L_BPd4!
    DIM L_BPd8!
    DIM L_BPdc$
    DIM L_BPe0$
    DIM L_BPe4!
    DIM L_BPe8!
    DIM L_BPec$
    DIM L_BPf0$
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc$
    ' ---- FUN_3000_0137 @0x30137  (030137_FUN_3000_0137.lift.txt; evidence_id (assembly): ev_edaf239de022d5d6cf507abe9481d8307708b9f6741e31df3d32faf32cd9af2e)
L_30153:
    RT_VIEWPRINT 23, 25   '@30158
    RT_CLS 2   '@3016a
    PRINT " Corte da Viga"   '@30178 DS:2dc0
    V_0e44! = V_18fe!   '@30186
L_3019c:
    GOSUB L_33de9   '@301a1
L_301b3:
    RT_VIEWPRINT 1, 25   '@301b8
    RT_VIEW 1, (0), (RT_CINT%(3.0 * FX##(V_0e60!) / 25.0 + 4.0)), (RT_CINT%(FX##(V_0e5c!) - 1.0)), (RT_CINT%(4.0 * FX##(V_0e60!) / 25.0 + 4.0)), (-1), (-1)   '@301ca DS:2dd2,2dd6,2dda,2dde (B$VIEW decodificado)
    RT_CLS 1   '@30221
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@3022f (sem argumentos (B$WIN0/B$VEW0))
    L_BP3a! = (FX##(L_BP1a!) - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@30239 DS:2de2
    L_BP3e! = 4.0 * FX##(V_0e60!) / 25.0 + 6.0   '@30260 DS:2dd6,2dda,2de6
    L_BP42$ = CHR$(24)   '@30279
    CALL MIXT_08c4_TextoGrafico(L_BP3a!, L_BP3e!, L_BP42$, V_17f2$)   '@3028c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @302a1 libera strings locais (L_BP42)
    LOCATE 24, 2   '@302aa
    PRINT "(vide "; CHR$(24); " acima)   Local de Corte   <S>im  <*N*>ao  <R>etorno  "; CHR$(27); "<E>  <D>"; CHR$(26);   '@302c8 DS:2dea,2df4,2e2e
    V_0dfc$ = RT_INPUT$(1)   '@30315
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@30331
    IF NOT (V_0dfc$ <> "S") THEN GOTO L_303e0   '@30349 DS:2e3a
    L_BP46! = (FX##(L_BP1a!) - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@30360 DS:2de2
    L_BP4a! = 4.0 * FX##(V_0e60!) / 25.0 + 6.0   '@30387 DS:2dd6,2dda,2de6
    L_BP4e$ = "~" + CHR$(24)   '@303a0 DS:2e40
    CALL MIXT_08c4_TextoGrafico(L_BP46!, L_BP4a!, L_BP4e$, V_17f2$)   '@303bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @303d2 libera strings locais (L_BP4e)
L_303e0:
    IF NOT (V_0dfc$ = "R") THEN GOTO L_30409   '@303e0 DS:2e46
    CALL S_38b83   '@303f7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_34ca0   '@30401
L_30409:
    IF NOT (V_0dfc$ = "E") THEN GOTO L_304c1   '@30409 DS:2e4c
    L_BP52! = A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@30420
    L_BP56! = L_BP1a! - FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0   '@3044a DS:2e52
    CALL MIXT_082a_Maior(L_BP52!, L_BP56!, L_BP5a!)   '@3047a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0) = L_BP52!   '@3048c
    L_BP1a! = L_BP5a!   '@304b0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_301b3   '@304b9
L_304c1:
    IF NOT (V_0dfc$ = "D") THEN GOTO L_30578   '@304c1 DS:2e56
    L_BP5e! = A_1a0c!(RT_CINT%(FX##(V_0e44!)), 1)   '@304d8
    L_BP62! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0 + L_BP1a!   '@30503 DS:2e52
    CALL MIXT_0877_Menor(L_BP5e!, L_BP62!, L_BP66!)   '@30530
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e44!)), 1) = L_BP5e!   '@30542
    L_BP1a! = L_BP66!   '@30567
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_301b3   '@30570
L_30578:
    IF NOT (V_0dfc$ = "S") THEN GOTO L_3070c   '@30578 DS:2e3a
    RT_GCAIXA RT_SNG!(FX##(V_0e5c!) / 8.0 - 2.0), RT_SNG!(FX##(V_0e60!) / 5.0 - 2.0), RT_SNG!(FX##(V_0e5c!) / 8.0 + 35.0 * FX##(V_0e68!) + 2.0), RT_SNG!(0.64999997615814208984375## * V_0e60! + 2.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1DD2(1): RT_GFIM   '@3058f DS:2de2,2e5c,2e60,2e64,2e68,2e6c
    GOSUB L_30752   '@30627
    RT_GPONTO RT_SNG!(FX##(V_0e5c!) / 8.0 - 2.0), RT_SNG!(FX##(V_0e60!) / 5.0 - 2.0), 0: PUT (RG_GX1, RG_GY1), A_1DD2(1), PSET: RT_GFIM   '@30634 DS:2e5c,2e60,2e64
    L_BP6a! = (FX##(L_BP1a!) - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@3068c DS:2de2
    L_BP6e! = 4.0 * FX##(V_0e60!) / 25.0 + 6.0   '@306b3 DS:2dd6,2dda,2de6
    L_BP72$ = "~" + CHR$(24)   '@306cc DS:2e40
    CALL MIXT_08c4_TextoGrafico(L_BP6a!, L_BP6e!, L_BP72$, V_17f2$)   '@306e9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @306fe libera strings locais (L_BP72)
L_3070c:
    V_0e44! = FX##(V_0e44!) + 1.0   '@3070c DS:2e70
    IF NOT (V_0e44! <= V_1902!) THEN GOTO L_30745   '@30722
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3019c   '@3073d
L_30745:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30153   '@30745
    ' ---- F_3074d @0x3074d  (03074d_F_3074d.lift.txt; evidence_id (assembly): ev_1fb45c970e30048cfcd1908afd1dfb335b4e475f10cd9f3507f229de79b7b75a)
L_30752:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    RT_VIEWPRINT 1, 25   '@30757
    L_BP74% = (V_17f2$ = "EGA")   '@30769 DS:2e5c,2e64,2e68,2e6c,2e74
    RT_VIEW 2, (RT_CINT%(FX##(V_0e5c!) / 8.0)), (RT_CINT%(FX##(V_0e60!) / 5.0)), (RT_CINT%(FX##(V_0e5c!) / 8.0 + 35.0 * FX##(V_0e68!))), (RT_CINT%(0.64999997615814208984375## * V_0e60!)), (-((V_17f2$ = "VGA" OR L_BP74%) * 4)), (2)   '@307db DS:2e7c (B$VIEW decodificado)
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@307fc (sem argumentos (B$WIN0/B$VEW0))
    RT_WINDOW 1, (0), (0), (639), (199)   '@30806 DS:2e84,2e86,2e88,2e8a,2e8c,2e8e (B$WIND decodificado)
    L_BP12! = 12.0   '@30834 DS:2e90
    L_BP16! = 5.0   '@30844 DS:2e64
    V_0e30! = 100.0   '@30854 DS:2e94
    V_0e34! = 40.0   '@30865 DS:2e98
    L_BP78! = 5.833333492279052734375## / A_1232!(RT_CINT%(FX##(V_0e44!)), 0)   '@30876 DS:2e9c
    L_BP7c! = 10.0 / FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1))   '@308a5 DS:2ea0
    CALL MIXT_0877_Menor(L_BP78!, L_BP7c!, L_BP80!)   '@308ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP80!   '@308e0
    GOSUB L_312be   '@308ea
    L_BP84! = 96.0   '@308f7 DS:2ea4
    L_BP88! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28! + 68.0   '@30909 DS:2ea8
    L_BP8c$ = "Bw=" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))), (2)) + "  Hw=" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@3093c DS:2eac,2eb4
    L_BP90$ = "CGA"   '@309cb DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BP84!, L_BP88!, L_BP8c$, L_BP90$)   '@309d9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @309f2 libera strings locais (L_BP8c)
    ' @309fc libera strings locais (L_BP90)
    IF NOT (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 2)) * A_1232!(RT_CINT%(FX##(V_0e44!)), 3) > FX##(0.0)) THEN GOTO L_30b64   '@30a06 DS:2e84
    L_BP94! = 96.0   '@30a57 DS:2ea4
    L_BP98! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28! + 76.0   '@30a69 DS:2ec6
    L_BP9c$ = "Bf=" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 2))), (2)) + "  Hf=" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e44!)), 3))), (2))   '@30a9c DS:2eca,2ed2
    L_BPa0$ = "CGA"   '@30b29 DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BP94!, L_BP98!, L_BP9c$, L_BPa0$)   '@30b37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30b50 libera strings locais (L_BP9c)
    ' @30b5a libera strings locais (L_BPa0)
L_30b64:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) > 0) THEN GOTO L_30c62   '@30b64
    L_BPa4! = 83.0   '@30b8f DS:2edc
    L_BPa8! = FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28! + 60.0   '@30ba1 DS:2ee0
    L_BPac$ = STR$(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1))   '@30bfa
    L_BPb0$ = "CGA"   '@30c27 DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BPa4!, L_BPa8!, L_BPac$, L_BPb0$)   '@30c35
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30c4e libera strings locais (L_BPac)
    ' @30c58 libera strings locais (L_BPb0)
L_30c62:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0) > 0) THEN GOTO L_30d4c   '@30c62
    L_BPb4! = 83.0   '@30c8c DS:2edc
    L_BPb8! = FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28! + 50.0   '@30c9e DS:2ee4
    L_BPbc$ = STR$(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) + CHR$(25)   '@30cd5
    L_BPc0$ = "CGA"   '@30d11 DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BPb4!, L_BPb8!, L_BPbc$, L_BPc0$)   '@30d1f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30d38 libera strings locais (L_BPbc)
    ' @30d42 libera strings locais (L_BPc0)
L_30d4c:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) > 0) THEN GOTO L_30e6f   '@30d4c
    L_BPc4! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28! + 110.0   '@30d77 DS:2ee8
    L_BPc8! = FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28! + 60.0   '@30db0 DS:2ee0
    L_BPcc$ = STR$(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3))   '@30e07
    L_BPd0$ = "CGA"   '@30e34 DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BPc4!, L_BPc8!, L_BPcc$, L_BPd0$)   '@30e42
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30e5b libera strings locais (L_BPcc)
    ' @30e65 libera strings locais (L_BPd0)
L_30e6f:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2) > 0) THEN GOTO L_30f7a   '@30e6f
    L_BPd4! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28! + 110.0   '@30e97 DS:2ee8
    L_BPd8! = FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28! + 50.0   '@30ed0 DS:2ee4
    L_BPdc$ = STR$(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) + CHR$(25)   '@30f05
    L_BPe0$ = "CGA"   '@30f3f DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BPd4!, L_BPd8!, L_BPdc$, L_BPe0$)   '@30f4d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30f66 libera strings locais (L_BPdc)
    ' @30f70 libera strings locais (L_BPe0)
L_30f7a:
    V_0e30! = 145.0   '@30f7a DS:2eec
    V_0e34! = 40.0   '@30f8b DS:2e98
    IF NOT (V_186a! = 0.0) THEN GOTO L_30fbf   '@30f9c DS:2e84
    GOTO L_3122c   '@30fb7
L_30fbf:
    GOSUB L_32a53   '@30fbf
    IF NOT (V_0e1c! = 0.0) THEN GOTO L_30fef   '@30fcc DS:2e84
    GOTO L_3122c   '@30fe7
L_30fef:
    V_0e1c! = -(A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0)   '@30fef DS:2dd2,2de2,2e64,2e70
    V_0e1c! = INT(FX##(V_0e1c!))   '@31097
    L_BPe4! = FX##(L_BP12!) * V_0e1c! * V_0e28! + 242.0   '@310af DS:2ef0
    L_BPe8! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28! / 2.0 + 54.0   '@310cf DS:2de2,2ef4
    L_BPec$ = STR$(RT_SNG!(A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!)))   '@31108 DS:2de2
    L_BPf0$ = "GCA"   '@3114d DS:2ef8
    CALL MIXT_08c4_TextoGrafico(L_BPe4!, L_BPe8!, L_BPec$, L_BPf0$)   '@3115b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @31174 libera strings locais (L_BPec)
    ' @3117e libera strings locais (L_BPf0)
    L_BPf4! = 242.0   '@31188 DS:2ef0
    L_BPf8! = 52.0   '@3119a DS:2f00
    L_BPfc$ = STR$(V_0e1c!)   '@311a5
    L_BP100$ = "CGA"   '@311bd DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BPf4!, L_BPf8!, L_BPfc$, L_BP100$)   '@311cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @311e4 libera strings locais (L_BPfc)
    ' @311ee libera strings locais (L_BP100)
    V_0e30! = 200.0   '@311f8 DS:2f04
    V_0e34! = 35.0   '@31209 DS:2e68
    GOSUB L_32077   '@3121a
L_3122c:
    RT_WINDOW 0, 0, 0, 0, 0   '@31231 (sem argumentos (B$WIN0/B$VEW0))
    RT_VIEWPRINT 23, 25   '@3123b
    RT_CLS 2   '@3124d
    PRINT " Qualquer Tecla para Continuar ";   '@3125b DS:2f08
    CALL MIXT_07f1_LimpaTeclado   '@31269
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@31273
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS 2   '@3128f
    RT_VIEWPRINT 1, 25   '@3129d
    RETURN   '@312af
L_312be:   ' sub-rotina (alvo de GOSUB)
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), 9, V_191a%, 0   '@312c3 DS:2ea0,2f2c
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@3135c DS:2ea0,2f2c
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) = 0) THEN GOTO L_31518   '@3144b
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@31476 DS:2ea0,2f2c
    GOTO L_3178c   '@31510
L_31518:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@31518 DS:2ea0,2f2c
    RT_LINE 0, 0, V_0e30!, RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28!), 8, V_191a%, 0   '@315b5 DS:2ea0
    RT_LINE V_0e30!, RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 1) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@31619 DS:2ea0,2f2c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), 8, V_191a%, 0   '@3171a DS:2ea0,2f2c
L_3178c:
    IF NOT (A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) = 0) THEN GOTO L_318b2   '@31791
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@317bc DS:2ea0,2f2c
    GOTO L_31c32   '@318aa
L_318b2:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@318b2 DS:2ea0,2f2c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 30.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28!), 8, V_191a%, 0   '@319a1 DS:2ea0,2f30
    RT_LINE RT_SNG!(FX##(V_0e30!) + 30.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1a3a%(RT_CINT%(FX##(V_0e44!)), 3) + A_1a3a%(RT_CINT%(FX##(V_0e44!)), 2)) * L_BP16! * V_0e28!), 9, V_191a%, 0   '@31a39 DS:2ea0,2f2c,2f30
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28!), 8, V_191a%, 0   '@31b96 DS:2ea0,2f2c
L_31c32:
    V_0e20! = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@31c37
    L_BP32! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@31cb1 DS:2f34
    IF NOT (V_186a! = 0.0) THEN GOTO L_31d2b   '@31d08 DS:2e84
    GOTO L_3203c   '@31d23
L_31d2b:
    L_BP104! = V_186a!   '@31d2b
    FOR V_0e1c! = 1.0 TO L_BP104!   '@31d3d DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e1c!)), 5) = L_BP32!) THEN GOTO L_31d80   '@31d44
    GOTO L_31da9   '@31d78
L_31d80:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@31d80 DS:2e70
L_31da9:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e1c!)) THEN GOTO L_31de2   '@31da9 DS:2e70
    V_0e1c! = 0.0   '@31dc9 DS:2e84
    GOTO L_3203c   '@31dda
L_31de2:
    L_BP108! = V_0e20!   '@31de2
    FOR V_0e1c! = 1.0 TO L_BP108!   '@31df4 DS:2e70
    RT_PSET RT_SNG!(FX##(V_0e30!) + 15.0 + (V_0eaa! - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * (FX##(V_0e20! = 2.0) / 3.0 + FX##(V_0e20! = 3.0) / 5.0) * (FX##(V_0e1c!) - 1.0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), 0, 0   '@31dfc DS:2dd2,2dde,2de2,2e64,2ea0,2f2c
    RT_LINE 0, 0, RT_SNG!(FX##(V_0e30!) + 15.0 + (V_0eaa! - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + (V_0e20! = 2.0) * (FX##(V_0e1c!) + 1.0) / 3.0 + (V_0e20! = 3.0) * (FX##(V_0e1c!) + 2.0) / 5.0)) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * L_BP16! * V_0e28!), 24, V_1920%, 0   '@31ed8 DS:2dd2,2de2,2e64,2e70,2ea0,2f2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@3200b DS:2e70
L_3203c:
    GOSUB L_32fac   '@32041
    GOSUB L_34175   '@3204e
    GOSUB L_32757   '@3205b
    RETURN   '@32068
L_32077:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@3207c
    L_BP22! = 1.0   '@320a6 DS:2e70
    L_BP2a! = 1.0   '@320b6 DS:2e70
    L_BP36! = 0.0   '@320c6 DS:2e84
    L_BP10c! = V_186a!   '@320d6
    FOR V_0e40! = 1.0 TO L_BP10c!   '@320e8 DS:2e70
    L_BP110! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)   '@320f0
    CALL MIXT_082a_Maior(L_BP36!, L_BP110!, L_BP114!)   '@3211b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) = L_BP110!   '@3212f
    L_BP36! = L_BP114!   '@32155
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@3215f DS:2e70
    L_BP32! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@3218b DS:2f34
L_321e7:
    L_BP118! = V_186a!   '@321ec
    FOR V_0e40! = 1.0 TO L_BP118!   '@321fe DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 5) <> L_BP32! OR A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> L_BP22!) THEN GOTO L_32280   '@32206
    GOTO L_326e2   '@32278
L_32280:
    V_0e48! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@32280
    V_0e48! = -((V_0e48! = V_0f06!) * 6 + ((V_0e48! = V_0f02!) * 5 + ((V_0e48! = V_0efe!) * 4 + ((V_0e48! = V_0efa!) * 3 + ((V_0e48! = V_0ef6!) * 2 + (V_0e48! = V_0ef2!))))))   '@322a8
    V_0dfc$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) + V_0e20!))), (2)) + " #" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e40!)), 2))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0eaa!) + V_0e1c!) * 2.0 + A_1c62%(RT_CINT%(FX##(V_0e48!)), 4))))), (2))   '@3236e DS:2de2,2f38,2f3e,2f44
    V_0e48! = 0.0   '@324a6 DS:2e84
    L_BP11c! = V_186a!   '@324b7
    FOR L_BP26! = 1.0 TO L_BP11c!   '@324c9 DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(L_BP26!)), 6) = A_1c06!(RT_CINT%(FX##(V_0e40!)), 6)) THEN GOTO L_325b3   '@324d0
    V_0e48! = (INT((FX##(A_1c06!(RT_CINT%(FX##(L_BP26!)), 1)) - A_1c06!(RT_CINT%(FX##(L_BP26!)), 0)) / A_1c06!(RT_CINT%(FX##(L_BP26!)), 3)) + 1.0) * A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) + V_0e48!   '@3251e DS:2e70
L_325b3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@325b3 DS:2e70
    V_0dfc$ = RT_MID2$((STR$(V_0e48!)), (2)) + V_0dfc$   '@325dc
    IF NOT (V_0e48! = 0.0) THEN GOTO L_32633   '@32610 DS:2e84
    GOTO L_32713   '@3262b
L_32633:
    L_BP120! = FX##(V_0e30!) + 10.0   '@32633 DS:2ea0
    L_BP124! = FX##(V_0e34!) + 13.0 + FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP16! * V_0e28! + FX##(L_BP2a!) * 10.0   '@3264a DS:2ea0,2f4c
    L_BP128$ = "CGA"   '@32691 DS:2ebe
    CALL MIXT_08c4_TextoGrafico(L_BP120!, L_BP124!, V_0dfc$, L_BP128$)   '@3269f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @326b7 libera strings locais (L_BP128)
    L_BP2a! = FX##(L_BP2a!) + 1.0   '@326c1 DS:2e70
    GOTO L_32713   '@326d5
L_326e2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@326e7 DS:2e70
L_32713:
    IF NOT (L_BP22! < L_BP36!) THEN GOTO L_32748   '@32713
    L_BP22! = FX##(L_BP22!) + 1.0   '@3272c DS:2e70
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_321e7   '@32740
L_32748:
    RETURN   '@32748
L_32757:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e44!)), 0) = 0.0) THEN GOTO L_3279a   '@3275c DS:2e84
    RETURN   '@32790
L_3279a:
    L_BP12c! = A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)   '@3279a
    FOR V_0e40! = 1.0 TO L_BP12c!   '@327c5 DS:2e70
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + (FX##(V_0eaa!) + 1.0 + FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + ((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)) + 1.0) * V_0e40! + V_0ea6!) * L_BP16! * V_0e28!), RT_SNG!(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@327cc DS:2de2,2e52,2e70,2ea0,2f2c
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 1.0 - FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) / 20.0) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + ((A_1232!(RT_CINT%(FX##(V_0e44!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 0)) + 1.0) * V_0e40! + V_0ea6!) * L_BP16! * V_0e28!), RT_SNG!(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 1)) * L_BP12! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@328e3 DS:2dde,2de2,2e52,2e70,2ea0,2f2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@32a18 DS:2e70
    RETURN   '@32a44
L_32a53:   ' sub-rotina (alvo de GOSUB)
    V_0e20! = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@32a58
    L_BP32! = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@32ad2 DS:2f34
    V_0e1c! = 0.0   '@32b29 DS:2e84
    IF NOT (V_186a! = 0.0) THEN GOTO L_32b5f   '@32b3a DS:2e84
    RETURN   '@32b55
L_32b5f:
    L_BP130! = V_186a!   '@32b5f
    FOR V_0e1c! = 1.0 TO L_BP130!   '@32b71 DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e1c!)), 5) = L_BP32!) THEN GOTO L_32bb4   '@32b78
    GOTO L_32bdd   '@32bac
L_32bb4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@32bb4 DS:2e70
L_32bdd:
    IF NOT (FX##(V_186a!) + 1.0 = FX##(V_0e1c!)) THEN GOTO L_32c18   '@32bdd DS:2e70
    V_0e1c! = 0.0   '@32bfd DS:2e84
    RETURN   '@32c0e
L_32c18:
    RT_LINE RT_SNG!(FX##(V_0e30!) + 95.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), RT_SNG!(95.0 - (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa!) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0) * L_BP12! * V_0e28! + V_0e30!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa!) * L_BP16! * V_0e28!), 25, V_1920%, 0   '@32c18 DS:2dd2,2de2,2e64,2e70,2ea0,2f50
    RT_LINE RT_SNG!(FX##(V_0e30!) + 95.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 13.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 100.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 13.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), 9, V_1920%, 0   '@32d77 DS:2e94,2f4c,2f50
    RT_LINE RT_SNG!(FX##(V_0e30!) + 98.0 + FX##(V_0eaa!) * V_0e28! * L_BP12!), RT_SNG!(FX##(V_0e34!) + 10.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e30!) + 98.0 + FX##(L_BP12!) * V_0eaa! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 15.0 + FX##(L_BP16!) * V_0eaa! * V_0e28!), 9, V_1920%, 0   '@32e2a DS:2ea0,2f2c,2f54
    V_0e1c! = -(A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!)) * ((V_0e20! = 1.0) + FX##((V_0e20! = 2.0) * 2) / 3.0 + FX##((V_0e20! = 3.0) * 3) / 5.0)   '@32edd DS:2dd2,2de2,2e64,2e70
    V_0e1c! = INT(FX##(V_0e1c!))   '@32f85
    RETURN   '@32f9d
L_32fac:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0dfc$ = "TABELA") THEN GOTO L_32fd5   '@32fb1 DS:2f58
    GOSUB L_33de9   '@32fc8
L_32fd5:
    REDIM A_13fe%(-32768 TO -32768)   '@32fd5
    REDIM A_13fe%(0 TO 20)   '@32fe3
    V_0e20! = 0.0   '@33000 DS:2e84
    IF NOT (V_185e! = 0.0) THEN GOTO L_33034   '@33011 DS:2e84
    GOTO L_33455   '@3302c
L_33034:
    L_BP134! = V_185e!   '@33034
    FOR V_0e40! = 1.0 TO L_BP134!   '@33046 DS:2e70
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP1a! OR A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP1a!) THEN GOTO L_330c5   '@3304e
    GOTO L_3341f   '@330bd
L_330c5:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_33199   '@330c5 DS:2e70
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_33194   '@330e5 DS:2dde
    GOTO L_3341f   '@3318c
L_33194:
L_33199:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_3326f   '@33199
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e44!))) AND A_1af2!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_3326a   '@331b9 DS:2e70
    GOTO L_3341f   '@33262
L_3326a:
L_3326f:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e40!)), 1)   '@3326f
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@3329a
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1af2!(RT_CINT%(FX##(V_0e40!)), 0))   '@333b5
L_3341f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@33424 DS:2e70
L_33455:
    IF NOT (2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!) * 2 <= V_0e20! OR V_1862! = 0.0) THEN GOTO L_33511   '@3345a DS:2e84
    GOTO L_33787   '@33509
L_33511:
    L_BP138! = V_1862!   '@33511
    FOR V_0e40! = 1.0 TO L_BP138!   '@33523 DS:2e70
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP1a! OR A_1b7c!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP1a!) THEN GOTO L_335a1   '@3352a
    GOTO L_33751   '@33599
L_335a1:
    V_0e20! = A_1b7c!(RT_CINT%(FX##(V_0e40!)), 1)   '@335a1
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@335cc
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1b7c!(RT_CINT%(FX##(V_0e40!)), 0))   '@336e7
L_33751:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@33756 DS:2e70
L_33787:
    FOR V_0e40! = 0.0 TO 9.0   '@3378c DS:2e70,2e84,2f62
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@3379a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@337e1 DS:2e70,2f62
    V_0e40! = 9.0   '@3380a DS:2f62
    L_BP1e! = 0.0   '@3381b DS:2e84
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_33855   '@3382b
    RETURN   '@3384b
L_33855:
L_3385a:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_338a3   '@3385f
    V_0e40! = FX##(V_0e40!) - 1.0   '@33886 DS:2dde
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3385a   '@3389c
L_338a3:
    L_BP1e! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@338a3 DS:2dd2,2dda,2de2,2de6,2e5c,2e64,2e70,2e84,2f62,2f66
    L_BP13c! = 2.0   '@33a15 DS:2de2
    L_BP140! = FX##(A_13fe%(10)) * 1.0   '@33a26 DS:2e70
    L_BP144! = FX##(L_BP1e!) / 10.0 + 2.5   '@33a4b DS:2ea0,2f6a
    L_BP148! = FX##(L_BP1e!) * 2.0 / 10.0   '@33a60 DS:2de2,2ea0
    CALL MIXT_082a_Maior(L_BP144!, L_BP148!, L_BP14c!)   '@33a74
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP150! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(L_BP1e!) / 10.0 - 6.0) / L_BP14c!) + 1   '@33a89 DS:2de2,2ea0,2f6e,2f72
    CALL MIXT_0877_Menor(L_BP140!, L_BP150!, L_BP154!)   '@33ae0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP13c!, L_BP154!, L_BP158!)   '@33af4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BP158!   '@33b09
    L_BP26! = 0.0   '@33b14 DS:2e84
    L_BP2e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 7.2600002288818359375## - FX##(L_BP1e!) * V_0e48! / 10.0) / (FX##(V_0e48!) - 1.0)   '@33b24 DS:2dde,2de2,2ea0,2f76
    L_BP15c! = A_13fe%(10)   '@33b7d
    FOR V_0e40! = 1.0 TO L_BP15c!   '@33ba2 DS:2e70
    L_BP0e! = FX##(L_BP1e!) / 20.0 + V_0eaa! + 0.62999999523162841796875## + (FX##(L_BP1e!) / 10.0 + L_BP2e!) * (FX##(V_0e40!) - 1.0 - FX##(L_BP26!) * V_0e48!)   '@33baa DS:2dde,2e52,2ea0,2f7a
    IF NOT (V_0e40! - FX##(L_BP26!) * V_0e48! > RT_CINT%(FX##(V_0e48!) / 2.0)) THEN GOTO L_33c3b   '@33bf1 DS:2de2
    L_BP0e! = FX##(L_BP0e!) + 6.0   '@33c27 DS:2de6
L_33c3b:
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_33ca8   '@33c3b
    L_BP0e! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(L_BP1e!) / 20.0   '@33c69 DS:2e52,2f7e
L_33ca8:
    L_BP160! = FX##(L_BP1e!) / 10.0 + 1.5   '@33ca8 DS:2ea0,2f82
    L_BP164! = FX##(L_BP1e!) / 5.0   '@33cc3 DS:2e64
    CALL MIXT_082a_Maior(L_BP160!, L_BP164!, L_BP168!)   '@33cd2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(L_BP0e!) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (V_0eaa! + 0.62999999523162841796875## + FX##(L_BP1e!) / 20.0 + FX##(L_BP26!) * L_BP168!) * L_BP16! * V_0e28!), RT_SNG!(FX##(L_BP1e!) * L_BP12! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@33ce7 DS:2e52,2ea0,2f2c,2f7a
    IF NOT ((FX##(L_BP26!) + 1.0) * V_0e48! = FX##(V_0e40!)) THEN GOTO L_33dae   '@33d76 DS:2e70
    L_BP26! = FX##(L_BP26!) + 1.0   '@33d9a DS:2e70
L_33dae:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@33dae DS:2e70
    RETURN   '@33dda
L_33de9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    L_BP1a! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@33dee DS:2de2
    IF NOT (V_0ddc! > 1.0 AND (V_0de4! = 0.0 AND V_0e44! = V_0ddc!) OR V_0de0! = 1.0 AND V_0e44! = 1.0) THEN GOTO L_33f17   '@33e3b DS:2e70,2e84
    L_BP1a! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@33eca DS:2dd2
L_33f17:
    IF NOT (V_0ddc! > 1.0 AND (V_0de0! = 0.0 AND V_0e44! = 1.0) OR V_0de4! = 1.0 AND V_0e44! = V_0ddc!) THEN GOTO L_33ff8   '@33f17 DS:2e70,2e84
    L_BP1a! = FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) * 2.0 / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)   '@33fa6 DS:2dd2,2de2
L_33ff8:
    IF NOT (V_0e44! < V_0ddc! AND V_0e44! > 1.0) THEN GOTO L_34166   '@33ff8 DS:2e70
    L_BP1a! = A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0) - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) >= A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) / 3.0 - FX##(A_128e!(RT_CINT%(FX##(V_0e44!) - 1.0), 4) < A_128e!(RT_CINT%(FX##(V_0e44!) + 1.0), 4)) * A_1926!(RT_CINT%(FX##(V_0e44!)), 1) * 2.0 / 3.0   '@34036 DS:2dd2,2dde,2de2,2e70
L_34166:
    RETURN   '@34166
L_34175:   ' sub-rotina (alvo de GOSUB)
    REDIM A_13fe%(-32768 TO -32768)   '@3417a
    REDIM A_13fe%(0 TO 20)   '@34188
    IF NOT (V_1866! = 0.0) THEN GOTO L_341c8   '@341a5 DS:2e84
    GOTO L_3466f   '@341c0
L_341c8:
    L_BP16c! = V_1866!   '@341c8
    FOR V_0e40! = 1.0 TO L_BP16c!   '@341da DS:2e70
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) < L_BP1a! OR A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) > L_BP1a!) THEN GOTO L_34259   '@341e2
    GOTO L_34639   '@34251
L_34259:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e44!)) THEN GOTO L_34370   '@34259 DS:2e70
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) - 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e44!) - 1.0), 1)) THEN GOTO L_3436b   '@34279 DS:2dde
    GOTO L_34639   '@34363
L_3436b:
L_34370:
    IF NOT (FX##(V_0ddc!) + V_0de4! > FX##(V_0e44!)) THEN GOTO L_34489   '@34370
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e44!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e44!) + 1.0), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e44!)))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e40!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e44!) + 1.0), 0)) THEN GOTO L_34484   '@34390 DS:2e70
    GOTO L_34639   '@3447c
L_34484:
L_34489:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e40!)), 1)   '@34489
    V_0e20! = -(V_0e20! = V_0ef2!) - (V_0e20! = V_0ef6!) * 2 - (V_0e20! = V_0efa!) * 3 - (V_0e20! = V_0efe!) * 4 - (V_0e20! = V_0f02!) * 5 - (V_0e20! = V_0f06!) * 6 - (V_0e20! = V_0f0a!) * 7 - (V_0e20! = V_0f0e!) * 8 - (V_0e20! = V_0f12!) * 9   '@344b4
    A_13fe%(RT_CINT%(FX##(V_0e20!))) = RT_CINT%(FX##(A_13fe%(RT_CINT%(FX##(V_0e20!)))) + A_1ac4!(RT_CINT%(FX##(V_0e40!)), 0))   '@345cf
L_34639:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@3463e DS:2e70
L_3466f:
    FOR V_0e40! = 0.0 TO 9.0   '@34674 DS:2e70,2e84,2f62
    A_13fe%(10) = A_13fe%(RT_CINT%(FX##(V_0e40!))) + A_13fe%(10)   '@34682
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@346c9 DS:2e70,2f62
    V_0e40! = 9.0   '@346f2 DS:2f62
    L_BP1e! = 0.0   '@34703 DS:2e84
    IF NOT (A_13fe%(10) = 0) THEN GOTO L_3473d   '@34713
    RETURN   '@34733
L_3473d:
L_34742:
    IF NOT (A_13fe%(RT_CINT%(FX##(V_0e40!))) = 0) THEN GOTO L_3478b   '@34747
    V_0e40! = FX##(V_0e40!) - 1.0   '@3476e DS:2dde
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34742   '@34784
L_3478b:
    L_BP1e! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06! - FX##(V_0e40! = 7.0) * V_0f0a! - FX##(V_0e40! = 8.0) * V_0f0e! - FX##(V_0e40! = 9.0) * V_0f12!   '@3478b DS:2dd2,2dda,2de2,2de6,2e5c,2e64,2e70,2e84,2f62,2f66
    L_BP170! = 2.0   '@348fd DS:2de2
    L_BP174! = FX##(A_13fe%(10)) * 1.0   '@3490e DS:2e70
    L_BP178! = FX##(L_BP1e!) / 10.0 + 2.5   '@34933 DS:2ea0,2f6a
    L_BP17c! = FX##(L_BP1e!) * 2.0 / 10.0   '@34948 DS:2de2,2ea0
    CALL MIXT_082a_Maior(L_BP178!, L_BP17c!, L_BP180!)   '@3495c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP184! = RT_CINT%((A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(L_BP1e!) / 10.0) / L_BP180!) + 1   '@34971 DS:2de2,2ea0,2f6e
    CALL MIXT_0877_Menor(L_BP174!, L_BP184!, L_BP188!)   '@349c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP170!, L_BP188!, L_BP18c!)   '@349d7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BP18c!   '@349ec
    L_BP26! = 0.0   '@349f7 DS:2e84
    L_BP2e! = (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) - 2.0 * FX##(V_0eaa!) - 1.2599999904632568359375## - FX##(L_BP1e!) * V_0e48! / 10.0) / (FX##(V_0e48!) - 1.0)   '@34a07 DS:2dde,2de2,2ea0,2f6e
    L_BP190! = A_13fe%(10)   '@34a60
    FOR V_0e40! = 1.0 TO L_BP190!   '@34a85 DS:2e70
    L_BP0e! = FX##(L_BP1e!) / 20.0 + V_0eaa! + 0.62999999523162841796875## + (FX##(L_BP1e!) / 10.0 + L_BP2e!) * (FX##(V_0e40!) - 1.0 - FX##(L_BP26!) * V_0e48!)   '@34a8c DS:2dde,2e52,2ea0,2f7a
    IF NOT (A_13fe%(10) = V_0e40!) THEN GOTO L_34b40   '@34ad3
    L_BP0e! = FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0)) - V_0eaa! - 0.62999999523162841796875## - FX##(L_BP1e!) / 20.0   '@34b01 DS:2e52,2f7e
L_34b40:
    L_BP194! = FX##(L_BP1e!) / 10.0 + 1.5   '@34b40 DS:2ea0,2f82
    L_BP198! = FX##(L_BP1e!) / 5.0   '@34b5b DS:2e64
    CALL MIXT_082a_Maior(L_BP194!, L_BP198!, L_BP19c!)   '@34b6a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CIRCLE RT_SNG!(FX##(V_0e30!) + 15.0 + FX##(L_BP0e!) * L_BP12! * V_0e28!), RT_SNG!(FX##(V_0e34!) + 10.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 1)) - V_0eaa! - 0.62999999523162841796875## - FX##(L_BP1e!) / 20.0 - FX##(L_BP26!) * L_BP19c!) * L_BP16! * V_0e28!), RT_SNG!(FX##(L_BP1e!) * L_BP12! * V_0e28! / 20.0), 0, 0, 0, 0, 0   '@34b7f DS:2e52,2ea0,2f2c,2f7e
    IF NOT ((FX##(L_BP26!) + 1.0) * V_0e48! = FX##(V_0e40!)) THEN GOTO L_34c65   '@34c2d DS:2e70
    L_BP26! = FX##(L_BP26!) + 1.0   '@34c51 DS:2e70
L_34c65:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@34c65 DS:2e70
    RETURN   '@34c91
L_34ca0:   ' entrada vinda de 030137_FUN_3000_0137
    ' END SUB   '@34ca0
END SUB

SUB S_34cb0   ' entrada de SUB/FUNCTION (B$ENRA, locais 108 bytes) (0x34cb0)
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
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72!
    DIM L_BP76!
    ' ---- FUN_3000_4cb0 @0x34cb0  (034cb0_FUN_3000_4cb0.lift.txt; evidence_id (assembly): ev_4f0b91b4d8596d55e9f1934d1412cee166416e95b8de42119deb2f80ccbcd0a8)
    RT_VIEWPRINT 1, 25   '@34cc2
    RT_CLS 1   '@34cd4
    LOCATE 1, 1   '@34ce2
    PRINT "VIGA-"; V_0dd4$; "   ";   '@34cf7 DS:2f86,2f90
    V_0dfc$ = RT_MID2$((STR$(A_1232!(RT_CINT%(1.0 - FX##(V_0de0!)), 0))), (2)) + "x" + RT_MID2$((STR$(A_1232!(RT_CINT%(1.0 - FX##(V_0de0!)), 1))), (2))   '@34d17 DS:2e70,2f98
    L_BP0e! = FX##(V_0ddc!) + V_0de4!   '@34daa
    FOR V_0e14! = 1.0 TO L_BP0e!   '@34dc0 DS:2e70
    V_0e00$ = RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + "x" + RT_MID2$((STR$(A_1232!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@34dc8 DS:2f98
    IF NOT (RT_INSTR%((1), (V_0dfc$), (V_0e00$)) = 0) THEN GOTO L_34e94   '@34e51
    V_0dfc$ = V_0dfc$ + "/" + V_0e00$   '@34e6e DS:2f9e
L_34e94:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@34e94 DS:2e70
    V_1836$ = V_0dfc$   '@34ebf
    PRINT V_1836$   '@34ed1
    V_0f72! = (FX##(V_0e5c!) - 1.0) / (FX##(A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) + A_1926!(RT_CINT%(FX##(V_1902!)), 0))   '@34edf DS:2dde
    IF NOT (V_18fe! > 0.0) THEN GOTO L_34fea   '@34f35 DS:2e84
    V_0f72! = (FX##(V_0e5c!) - 1.0) / (FX##(A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) + A_1926!(RT_CINT%(FX##(V_1902!)), 0) - (FX##(A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0)) - A_1926!(RT_CINT%(FX##(V_18fe!) - 1.0), 0)))   '@34f50 DS:2dde
L_34fea:
    GOSUB L_35757   '@34fea
    GOSUB L_35011   '@34ff7
    GOTO L_35a5b   '@35004
    ' ---- F_3500c @0x3500c  (03500c_F_3500c.lift.txt; evidence_id (assembly): ev_6091ab973e1c96ad535c7f44b56c5d7061b82ac75c234bd9fc7f2f82035fdbdd)
L_35011:   ' sub-rotina (alvo de GOSUB); entrada vinda de 034cb0_FUN_3000_4cb0
    RT_LINE 0.0, RT_SNG!(0.800000011920928955078125## * V_0e60!), RT_SNG!(FX##(V_0e5c!) - 1.0), RT_SNG!(0.800000011920928955078125## * V_0e60!), 9, V_191a%, 0   '@35016 DS:2dde,2e84,2fa4
    L_BP12! = V_1902!   '@35079
    FOR V_0e14! = FX##(V_18fe!) - 1.0 TO L_BP12!   '@3508a DS:2dde,2e70
    IF NOT (V_0e14! = -1.0 OR V_0e14! > V_0ddc!) THEN GOTO L_350dc   '@35096 DS:2dde
    GOTO L_3539b   '@350d4
L_350dc:
    RT_LINE RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7a!) * V_0f72!), RT_SNG!(0.800000011920928955078125## * V_0e60! - 3.0), RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7a!) * V_0f72!), RT_SNG!(0.800000011920928955078125## * V_0e60! + 3.0), 9, V_191e%, 0   '@350dc DS:2dd2,2fa4,2fa8
    RT_LINE RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - V_0f7a!) * V_0f72!), RT_SNG!(0.800000011920928955078125## * V_0e60! - 3.0), RT_SNG!((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - V_0f7a!) * V_0f72!), RT_SNG!(0.800000011920928955078125## * V_0e60! + 3.0), 9, V_191e%, 0   '@35193 DS:2dd2,2e70,2fa4,2fa8
    V_0dfc$ = RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (2))   '@35252
    V_0e30! = ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@35286 DS:2de2,2e70
    V_0e34! = 21.5 * FX##(V_0e60!) / 25.0   '@352fe DS:2dd6,2fac
    L_BP16! = 0.0   '@35319 DS:2e84
    L_BP1a! = FX##(V_0e5c!) - 2.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@3532a DS:2e60
    CALL MIXT_0877_Menor(V_0e30!, L_BP1a!, L_BP1e!)   '@3534f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP1e!, L_BP22!)   '@35360
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP22!   '@35372
    CALL MIXT_08c4_TextoGrafico(V_0e30!, V_0e34!, V_0dfc$, V_17f2$)   '@3537c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_3539b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@353a0 DS:2e70
    L_BP26! = V_1902!   '@353cb
    FOR V_0e14! = FX##(V_18fe!) - 1.0 TO L_BP26!   '@353dc DS:2dde,2e70
    IF NOT (V_0e14! = -1.0 OR V_0e14! > V_0ddc!) THEN GOTO L_3542e   '@353e8 DS:2dde
    GOTO L_35586   '@35426
L_3542e:
    V_0dfc$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 0))), (2))   '@3542e
    V_0e30! = ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@35471 DS:2de2,2e70
    V_0e34! = 0.800000011920928955078125## * V_0e60! - 2.0   '@354e9 DS:2e60,2fa4
    L_BP2a! = 0.0   '@35504 DS:2e84
    L_BP2e! = FX##(V_0e5c!) - 2.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@35515 DS:2e60
    CALL MIXT_0877_Menor(V_0e30!, L_BP2e!, L_BP32!)   '@3553a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2a!, L_BP32!, L_BP36!)   '@3554b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP36!   '@3555d
    CALL MIXT_08c4_TextoGrafico(V_0e30!, V_0e34!, V_0dfc$, V_17f2$)   '@35567
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_35586:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3558b DS:2e70
    L_BP3a! = V_1902!   '@355b6
    FOR V_0e14! = V_18fe! TO L_BP3a!   '@355c7 DS:2e70
    V_0dfc$ = RT_MID2$((STR$(A_1926!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@355ce
    V_0e30! = ((FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@35612 DS:2de2
    V_0e34! = 0.800000011920928955078125## * V_0e60! - 2.0   '@35685 DS:2e60,2fa4
    L_BP3e! = 0.0   '@356a0 DS:2e84
    L_BP42! = FX##(V_0e5c!) - 2.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@356b1 DS:2e60
    CALL MIXT_0877_Menor(V_0e30!, L_BP42!, L_BP46!)   '@356d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP3e!, L_BP46!, L_BP4a!)   '@356e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP4a!   '@356f9
    CALL MIXT_08c4_TextoGrafico(V_0e30!, V_0e34!, V_0dfc$, V_17f2$)   '@35703
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3571d DS:2e70
    RETURN   '@35748
L_35757:   ' sub-rotina (alvo de GOSUB); entrada vinda de 034cb0_FUN_3000_4cb0
    V_0f7a! = 0.0   '@3575c DS:2e84
    IF NOT (V_18fe! > 0.0) THEN GOTO L_357d5   '@3576d DS:2e84
    V_0f7a! = FX##(A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0)) - A_1926!(RT_CINT%(FX##(V_18fe!) - 1.0), 0)   '@35788 DS:2dde
L_357d5:
    L_BP4e! = V_185a!   '@357d5
    FOR V_0e14! = 0.0 TO L_BP4e!   '@357e6 DS:2e70,2e84
    IF NOT (A_1a68!(RT_CINT%(FX##(V_0e14!)), 2) < V_0f7a! OR FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) > FX##(A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) + A_1926!(RT_CINT%(FX##(V_1902!)), 0)) THEN GOTO L_3589e   '@357ee
    GOTO L_35a1c   '@35896
L_3589e:
    L_BP52! = 0.185000002384185791015625## * V_0e60!   '@3589e DS:2fb0
    L_BP56! = 0.699999988079071044921875## * V_0e60!   '@358b4 DS:2fb4
    L_BP5a! = FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f76! + V_18e6!   '@358c4
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@358f2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP52!, L_BP5e!, L_BP62!)   '@35903
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_PSET RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0f7a!) * V_0f72!), L_BP62!, 0, 0   '@35915
    L_BP66! = 0.185000002384185791015625## * V_0e60!   '@35956 DS:2fb0
    L_BP6a! = 0.699999988079071044921875## * V_0e60!   '@3596c DS:2fb4
    L_BP6e! = FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 3)) * V_0f76! + V_18e6!   '@3597c
    CALL MIXT_0877_Menor(L_BP6a!, L_BP6e!, L_BP72!)   '@359aa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP66!, L_BP72!, L_BP76!)   '@359bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE 0, 0, RT_SNG!((FX##(A_1a68!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), L_BP76!, 8, V_191a%, 0   '@359cd
L_35a1c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@35a21 DS:2e70
    RETURN   '@35a4c
L_35a5b:   ' entrada vinda de 034cb0_FUN_3000_4cb0
    ' END SUB   '@35a5b
END SUB

SUB S_35a6b   ' entrada de SUB/FUNCTION (B$ENRA, locais 260 bytes) (0x35a6b)
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
    ' ---- FUN_3000_5a6b @0x35a6b  (035a6b_FUN_3000_5a6b.lift.txt; evidence_id (assembly): ev_8035d61b0e2db6944e64a59ebd7333e08e5699231c6fe3cdbfea3ce9417fd199)
    GOSUB L_35abe   '@35a7d
    GOSUB L_36c53   '@35a8a
    GOSUB L_37e33   '@35a97
    GOSUB L_382d9   '@35aa4
    GOTO L_38b73   '@35ab1
    ' ---- F_35ab9 @0x35ab9  (035ab9_F_35ab9.lift.txt; evidence_id (assembly): ev_25d9aeef3ecc6c836b9ee099acffc12886c083dff139aa60e587ceebc3d498f5)
L_35abe:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035a6b_FUN_3000_5a6b
    REDIM A_13fe%(-32768 TO -32768)   '@35ac3
    REDIM A_13fe%(0 TO 20)   '@35ad1
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@35aee DS:2de2,2e70,2fb8
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@35afc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@35b1d DS:2de2,2fb8
    IF NOT (V_185e! = 0.0) THEN GOTO L_35b69   '@35b46 DS:2e84
    GOTO L_3652f   '@35b61
L_35b69:
    L_BP0e! = V_185e!   '@35b69
    FOR V_0e14! = 1.0 TO L_BP0e!   '@35b7a DS:2e70
    V_0e18! = 0.0   '@35b82 DS:2e84
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_35c3f   '@35b93
    GOTO L_36307   '@35c37
L_35c3f:
L_35c44:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_35d36   '@35c49 DS:2e70
    V_0e18! = FX##(V_0e18!) + 2.0   '@35d18 DS:2de2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35c44   '@35d2e
L_35d36:
    V_0e34! = 5.0 * FX##(V_0e60!) / 25.0 + 5.0 + (FX##(V_0e60!) / 50.0 + 1.0) * V_0e18!   '@35d36 DS:2dd6,2e64,2e70,2ee4
    RT_LINE RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), RT_SNG!(V_0e34! - (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) * (FX##(V_0e60!) / 25.0 - 2.0)), RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), V_0e34!, 9, V_1922%, 0   '@35d6d DS:2dd6,2e60,2e84
    RT_LINE 0, 0, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), V_0e34!, 8, V_1922%, 0   '@35e4d
    RT_LINE 0, 0, RT_SNG!((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), RT_SNG!(V_0e34! - (A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) * (FX##(V_0e60!) / 25.0 - 2.0)), 8, V_1922%, 0   '@35ea2 DS:2dd6,2e60,2e84
    GOSUB L_36344   '@35f49
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(V_0e14!)), (2)) + STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@35f56 DS:2f44,2fbc
    IF NOT ((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!) THEN GOTO L_360b9   '@36029
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_INSTR%((1), (V_0dfc$), ("C")) - 1))   '@3608d DS:2fc2
L_360b9:
    L_BP12! = 0.0   '@360b9 DS:2e84
    L_BP16! = ((FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@360ca DS:2de2
    L_BP1a! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@36135
    CALL MIXT_0877_Menor(L_BP16!, L_BP1a!, L_BP1e!)   '@36155
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP12!, L_BP1e!, L_BP22!)   '@36166
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP26! = FX##(V_0e34!) + 1.0   '@36178 DS:2e70
    CALL MIXT_08c4_TextoGrafico(L_BP22!, L_BP26!, V_0dfc$, V_17f2$)   '@36187
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@3619c
    L_BP2e! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@361c7 DS:2e70
    CALL MIXT_082a_Maior(L_BP2a!, L_BP2e!, L_BP32!)   '@361f0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP2a!   '@36202
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP32!))   '@36227
    L_BP36! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@3624d
    L_BP3a! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@36275 DS:2e70
    CALL MIXT_0877_Menor(L_BP36!, L_BP3a!, L_BP3e!)   '@362a3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP36!   '@362b5
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP3e!))   '@362d7 DS:2e70
L_36307:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3630c DS:2e70
    GOTO L_3652f   '@36337
    ' ---- F_3633f @0x3633f  (03633f_F_3633f.lift.txt; evidence_id (assembly): ev_51e44a884fba1e4abdc87f4f081888564cbb09b95838c4ac5b637748f707e11b)
L_36344:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035ab9_F_35ab9
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1)   '@36349
    IF NOT (V_190e$ = "S") THEN GOTO L_36508   '@363cd DS:2e3a
    V_0e20! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@363e4 DS:2e84,2fc8
L_36508:
    V_0e20! = INT(FX##(V_0e20!))   '@36508
    RETURN   '@36520
L_3652f:   ' entrada vinda de 035ab9_F_35ab9
    IF NOT (V_1872! = 0.0) THEN GOTO L_36559   '@36534 DS:2e84
    RETURN   '@3654f
L_36559:
    L_BP42! = V_1872!   '@36559
    FOR V_0e14! = 1.0 TO L_BP42!   '@3656a DS:2e70
    V_0e18! = 0.0   '@36572 DS:2e84
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_3662f   '@36583
    GOTO L_36c14   '@36627
L_3662f:
L_36634:
    IF NOT (A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_36726   '@36639 DS:2e70
    V_0e18! = FX##(V_0e18!) + 2.0   '@36708 DS:2de2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36634   '@3671e
L_36726:
    V_0e34! = 5.0 * FX##(V_0e60!) / 25.0 + 5.0 + (FX##(V_0e60!) / 50.0 + 1.0) * V_0e18!   '@36726 DS:2dd6,2e64,2e70,2ee4
    RT_LINE RT_SNG!((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), V_0e34!, RT_SNG!((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), V_0e34!, 9, V_1922%, 0   '@3675d
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e!))), (2)) + STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@367ef DS:2de2,2f44,2fbc
    IF NOT ((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!) THEN GOTO L_369c6   '@36936
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_INSTR%((1), (V_0dfc$), ("C")) - 1))   '@3699a DS:2fc2
L_369c6:
    L_BP46! = 0.0   '@369c6 DS:2e84
    L_BP4a! = ((FX##(A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@369d7 DS:2de2
    L_BP4e! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@36a42
    CALL MIXT_0877_Menor(L_BP4a!, L_BP4e!, L_BP52!)   '@36a62
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP46!, L_BP52!, L_BP56!)   '@36a73
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP5a! = FX##(V_0e34!) + 1.0   '@36a85 DS:2e70
    CALL MIXT_08c4_TextoGrafico(L_BP56!, L_BP5a!, V_0dfc$, V_17f2$)   '@36a94
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP5e! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3)   '@36aa9
    L_BP62! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@36ad4 DS:2e70
    CALL MIXT_082a_Maior(L_BP5e!, L_BP62!, L_BP66!)   '@36afd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP5e!   '@36b0f
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP66!))   '@36b34
    L_BP6a! = A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2)   '@36b5a
    L_BP6e! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@36b82 DS:2e70
    CALL MIXT_0877_Menor(L_BP6a!, L_BP6e!, L_BP72!)   '@36bb0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP6a!   '@36bc2
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BP72!))   '@36be4 DS:2e70
L_36c14:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@36c19 DS:2e70
    RETURN   '@36c44
L_36c53:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035a6b_FUN_3000_5a6b
    REDIM A_13fe%(-32768 TO -32768)   '@36c58
    REDIM A_13fe%(0 TO 20)   '@36c66
    FOR V_0e14! = 1.0 TO 19.0 STEP 2.0   '@36c83 DS:2de2,2e70,2fb8
    A_13fe%(RT_CINT%(FX##(V_0e14!))) = 9999   '@36c90
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@36cb1 DS:2de2,2fb8
    IF NOT (V_1866! = 0.0) THEN GOTO L_36cfd   '@36cda DS:2e84
    GOTO L_376e7   '@36cf5
L_36cfd:
    L_BP76! = V_1866!   '@36cfd
    FOR V_0e14! = 1.0 TO L_BP76!   '@36d0e DS:2e70
    V_0e18! = 0.0   '@36d16 DS:2e84
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_36dd3   '@36d27
    GOTO L_374bf   '@36dcb
L_36dd3:
L_36dd8:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_36eca   '@36ddd DS:2e70
    V_0e18! = FX##(V_0e18!) + 2.0   '@36eac DS:2de2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36dd8   '@36ec2
L_36eca:
    V_0e34! = 18.0 * FX##(V_0e60!) / 25.0 + (1.0 - (FX##(V_0e60!) / 50.0 + 1.0) * V_0e18!)   '@36eca DS:2dd6,2e70,2ee4,2fcc
    RT_LINE RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), RT_SNG!((A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0) * (FX##(V_0e60!) / 25.0 - 2.0) + V_0e34!), RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), V_0e34!, 9, V_1922%, 0   '@36f04 DS:2dd6,2e60,2e84
    RT_LINE 0, 0, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), V_0e34!, 8, V_1922%, 0   '@36fe1
    RT_LINE 0, 0, RT_SNG!((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), RT_SNG!((A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) * (FX##(V_0e60!) / 25.0 - 2.0) + V_0e34!), 8, V_1922%, 0   '@37036 DS:2dd6,2e60,2e84
    GOSUB L_374fc   '@370da
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e! + V_1872!))), (2)) + STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(V_0e20!)), (2))   '@370e7 DS:2f44,2fbc
    IF NOT ((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!) THEN GOTO L_3725b   '@371cb
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_INSTR%((1), (V_0dfc$), ("C")) - 1))   '@3722f DS:2fc2
L_3725b:
    L_BP7a! = 0.0   '@3725b DS:2e84
    L_BP7e! = ((FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@3726c DS:2de2
    L_BP82! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@372d7
    CALL MIXT_0877_Menor(L_BP7e!, L_BP82!, L_BP86!)   '@372f8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP7a!, L_BP86!, L_BP8a!)   '@3730b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8e! = FX##(V_0e34!) + 1.0   '@3731f DS:2e70
    CALL MIXT_08c4_TextoGrafico(L_BP8a!, L_BP8e!, V_0dfc$, V_17f2$)   '@3732f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP92! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@37346
    L_BP96! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@37372 DS:2e70
    CALL MIXT_082a_Maior(L_BP92!, L_BP96!, L_BP9a!)   '@3739c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP92!   '@373b1
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BP9a!))   '@373d7
    L_BP9e! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@373fe
    L_BPa2! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@37427 DS:2e70
    CALL MIXT_0877_Menor(L_BP9e!, L_BPa2!, L_BPa6!)   '@37456
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP9e!   '@3746b
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BPa6!))   '@3748e DS:2e70
L_374bf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@374c4 DS:2e70
    GOTO L_376e7   '@374ef
    ' ---- F_374f7 @0x374f7  (0374f7_F_374f7.lift.txt; evidence_id (assembly): ev_dcee8d6bcdd6c22f51bbb2e01b644322c3cdcc47f15909101ce1a55e018e8e2b)
L_374fc:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03633f_F_3633f
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e14!)), 1)   '@37501
    IF NOT (V_190e$ = "S") THEN GOTO L_376c0   '@37585 DS:2e3a
    V_0e20! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) + (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) > 0.0)) + FX##(V_0e20!)   '@3759c DS:2e84,2fc8
L_376c0:
    V_0e20! = INT(FX##(V_0e20!))   '@376c0
    RETURN   '@376d8
L_376e7:   ' entrada vinda de 03633f_F_3633f
    IF NOT (V_1876! = 0.0) THEN GOTO L_37711   '@376ec DS:2e84
    RETURN   '@37707
L_37711:
    L_BPaa! = V_1876!   '@37711
    FOR V_0e14! = 1.0 TO L_BPaa!   '@37723 DS:2e70
    V_0e18! = 0.0   '@3772a DS:2e84
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_377e7   '@3773b
    GOTO L_37df3   '@377df
L_377e7:
L_377ec:
    IF NOT (A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) >= A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) AND (A_13fe%(RT_CINT%(FX##(V_0e18!))) > 0 AND A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) <= A_13fe%(RT_CINT%(FX##(V_0e18!))))) THEN GOTO L_378de   '@377f1 DS:2e70
    V_0e18! = FX##(V_0e18!) + 2.0   '@378c0 DS:2de2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_377ec   '@378d6
L_378de:
    V_0e34! = 18.0 * FX##(V_0e60!) / 25.0 + (1.0 - (FX##(V_0e60!) / 50.0 + 1.0) * V_0e18!)   '@378de DS:2dd6,2e70,2ee4,2fcc
    RT_LINE RT_SNG!((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), V_0e34!, RT_SNG!((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), V_0e34!, 9, V_1922%, 0   '@37918
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_0e14!) + V_185e! + V_1866! + V_1872!))), (2)) + STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * 2.0 + A_1baa!(RT_CINT%(FX##(V_0e14!)), 5))))), (2))   '@379aa DS:2de2,2f44,2fbc
    IF NOT ((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!) THEN GOTO L_37b8b   '@37afb
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_INSTR%((1), (V_0dfc$), ("C")) - 1))   '@37b5f DS:2fc2
L_37b8b:
    L_BPae! = 0.0   '@37b8b DS:2e84
    L_BPb2! = ((FX##(A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@37b9d DS:2de2
    L_BPb6! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@37c09
    CALL MIXT_0877_Menor(L_BPb2!, L_BPb6!, L_BPba!)   '@37c2a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPae!, L_BPba!, L_BPbe!)   '@37c3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc2! = FX##(V_0e34!) + 1.0   '@37c53 DS:2e70
    CALL MIXT_08c4_TextoGrafico(L_BPbe!, L_BPc2!, V_0dfc$, V_17f2$)   '@37c63
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc6! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 3)   '@37c7a
    L_BPca! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!)))) * 1.0   '@37ca6 DS:2e70
    CALL MIXT_082a_Maior(L_BPc6!, L_BPca!, L_BPce!)   '@37cd0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 3) = L_BPc6!   '@37ce5
    A_13fe%(RT_CINT%(FX##(V_0e18!))) = RT_CINT%(FX##(L_BPce!))   '@37d0b
    L_BPd2! = A_1baa!(RT_CINT%(FX##(V_0e14!)), 2)   '@37d32
    L_BPd6! = FX##(A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0))) * 1.0   '@37d5b DS:2e70
    CALL MIXT_0877_Menor(L_BPd2!, L_BPd6!, L_BPda!)   '@37d8a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_0e14!)), 2) = L_BPd2!   '@37d9f
    A_13fe%(RT_CINT%(FX##(V_0e18!) + 1.0)) = RT_CINT%(FX##(L_BPda!))   '@37dc2 DS:2e70
L_37df3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@37df8 DS:2e70
    RETURN   '@37e24
L_37e33:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035a6b_FUN_3000_5a6b
    IF NOT (V_1862! = 0.0) THEN GOTO L_37e5d   '@37e38 DS:2e84
    RETURN   '@37e53
L_37e5d:
    L_BPde! = V_1862!   '@37e5d
    FOR V_0e14! = 1.0 TO L_BPde!   '@37e6f DS:2e70
    IF NOT (A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_37f22   '@37e76
    GOTO L_38299   '@37f1a
L_37f22:
    RT_LINE RT_SNG!((FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), RT_SNG!(9.0 * FX##(V_0e60!) / 25.0 + 3.0), RT_SNG!((FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), RT_SNG!(9.0 * FX##(V_0e60!) / 25.0 + 3.0), 9, V_191c%, 0   '@37f22 DS:2dd2,2dd6,2f62
    V_0dfc$ = V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1872! + V_1876! + V_0e14!))), (2)) + STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 0)) + "#" + RT_MID2$((STR$(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 1))), (2)) + " C:" + RT_MID2$((STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)))), (2))   '@37fe0 DS:2f44,2fbc
    IF NOT ((FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!) THEN GOTO L_3819b   '@3810b
    V_0dfc$ = RT_MID$((V_0dfc$), (1), (RT_INSTR%((1), (V_0dfc$), ("C")) - 1))   '@3816f DS:2fc2
L_3819b:
    L_BPe2! = 0.0   '@3819b DS:2e84
    L_BPe6! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@381ad
    L_BPea! = ((FX##(A_1b7c!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1b7c!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@381cf DS:2de2
    CALL MIXT_0877_Menor(L_BPe6!, L_BPea!, L_BPee!)   '@3823a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPe2!, L_BPee!, L_BPf2!)   '@3824e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf6! = 9.0 * FX##(V_0e60!) / 25.0 + 4.0   '@38263 DS:2dd6,2dda,2f62
    CALL MIXT_08c4_TextoGrafico(L_BPf2!, L_BPf6!, V_0dfc$, V_17f2$)   '@3827d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_38299:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3829e DS:2e70
    RETURN   '@382ca
L_382d9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035a6b_FUN_3000_5a6b
    IF NOT (V_186e! = 0.0) THEN GOTO L_38303   '@382de DS:2e84
    RETURN   '@382f9
L_38303:
    L_BPfa! = V_1902!   '@38303
    FOR V_0e14! = V_18fe! TO L_BPfa!   '@38315 DS:2e70
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_38358   '@3831c DS:2e84
    GOTO L_38b33   '@38350
L_38358:
    L_BPfe! = A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)   '@38358
    FOR V_0e28! = 1.0 TO L_BPfe!   '@38383 DS:2e70
    V_0e34! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + V_0ea6! + (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) * V_0e28!   '@3838a DS:2de2,2e70
    RT_LINE RT_SNG!((FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 2)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) * V_0f76! + V_18e6!), RT_SNG!((FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 3)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) * V_0f76! + V_18e6!), 9, V_1924%, 0   '@38410
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@384c4 DS:2e70
    RT_LINE RT_SNG!((FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a! + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0f72!), RT_SNG!((FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 + A_19b0!(RT_CINT%(FX##(V_0e14!)))) * V_0f76! + V_18e6!), RT_SNG!((FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 3.0 - V_0f7a! + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0f72!), RT_SNG!((FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f76! + FX##(V_0e60!) / 40.0 + V_18e6!), 9, V_1924%, 0   '@384f0 DS:2dd2,2de2,2e98
    V_0e20! = 0.0   '@38669 DS:2e84
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0eee!) THEN GOTO L_38905   '@3867a
    V_0e20! = -(A_1a96%(0) > 0)   '@386af
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef2!) THEN GOTO L_38900   '@386dd
    V_0e20! = FX##(V_0e20!) - (A_1a96%(1) > 0)   '@38712
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0ef6!) THEN GOTO L_388fb   '@38744
    V_0e20! = FX##(V_0e20!) - (A_1a96%(2) > 0)   '@38779
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efa!) THEN GOTO L_388f6   '@387ae
    V_0e20! = FX##(V_0e20!) - (A_1a96%(3) > 0)   '@387e3
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0efe!) THEN GOTO L_388f1   '@38818
    V_0e20! = FX##(V_0e20!) - (A_1a96%(4) > 0)   '@3884d
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) >= V_0f02!) THEN GOTO L_388ec   '@38882
    V_0e20! = FX##(V_0e20!) - (A_1a96%(5) > 0)   '@388b7
L_388ec:
L_388f1:
L_388f6:
L_388fb:
L_38900:
L_38905:
    V_0dfc$ = "2x" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(V_185e!) + V_1866! + V_1862! + V_1872! + V_1876! + V_0e20!))), (2)) + "#" + RT_MID2$((STR$(A_1c34!(RT_CINT%(FX##(V_0e14!)), 1))), (2))   '@38905 DS:2f38,2fbc,2fd0
    V_0e30! = (FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a! + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@389ee DS:2de2
    V_0e34! = (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f76! + V_18e6! + FX##(V_0e60!) / 20.0   '@38a61 DS:2e52
    L_BP102! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@38abe
    L_BP106! = 0.0   '@38ae6 DS:2e84
    CALL MIXT_082a_Maior(L_BP106!, V_0e30!, L_BP10a!)   '@38af1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP102!, L_BP10a!, L_BP10e!)   '@38b04
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_08c4_TextoGrafico(L_BP10e!, V_0e34!, V_0dfc$, V_17f2$)   '@38b18
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_38b33:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@38b38 DS:2e70
    RETURN   '@38b64
L_38b73:   ' entrada vinda de 035a6b_FUN_3000_5a6b
    ' END SUB   '@38b73
END SUB

SUB S_38b83   ' entrada de SUB/FUNCTION (B$ENRA, locais 76 bytes) (0x38b83)
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
    ' ---- FUN_3000_8b83 @0x38b83  (038b83_FUN_3000_8b83.lift.txt; evidence_id (assembly): ev_e9314996a662ee0d189f663585fa982e0e0d9521f5a9310ea3ace030c23e49e5)
    V_0e20! = FX##(V_185e!) + V_1866! + V_1862! + V_186e! + V_1872! + V_1876!   '@38b95
    IF NOT (V_186a! = 0.0) THEN GOTO L_38be2   '@38bbf DS:2e84
    GOTO L_39438   '@38bda
L_38be2:
    L_BP0e! = V_186a!   '@38be2
    FOR V_0e14! = 1.0 TO L_BP0e!   '@38bf3 DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 1) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1c06!(RT_CINT%(FX##(V_0e14!)), 0) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_38ca8   '@38bfa
    GOTO L_39403   '@38ca0
L_38ca8:
    V_0e34! = 3.0 * FX##(V_0e60!) / 25.0 + 2.0   '@38ca8 DS:2dd2,2dd6,2de2
    RT_LINE RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) - 2.0), RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) + 2.0), 9, V_1920%, 0   '@38cc8 DS:2de2,2e60
    RT_LINE RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) - 2.0), RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7a!) * V_0f72!), RT_SNG!(FX##(V_0e34!) + 2.0), 9, V_1920%, 0   '@38d73 DS:2de2,2e60
    RT_LINE RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0f7a!) * V_0f72!), V_0e34!, RT_SNG!((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7a!) * V_0f72!), V_0e34!, 9, V_1920%, 0   '@38e20
    V_0dfc$ = " " + V_18ea$ + RT_MID2$((STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 6)) + V_0e20!))), (2))   '@38eb4 DS:2f38
    V_0e00$ = "c/" + RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 3))), (2))   '@38f18 DS:2fd6
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) / A_1c06!(RT_CINT%(FX##(V_0e14!)), 3)) + 1.0))), (2)) + V_0dfc$   '@38f66 DS:2e70
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e14!)), 4) > 1.0) THEN GOTO L_39091   '@39004 DS:2e70
    V_0dfc$ = RT_MID2$((STR$(A_1c06!(RT_CINT%(FX##(V_0e14!)), 4))), (2)) + "x" + V_0dfc$   '@39039 DS:2f98
L_39091:
    L_BP12! = 0.0   '@39091 DS:2e84
    L_BP16! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@390a2
    L_BP1a! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@390c3 DS:2de2
    CALL MIXT_0877_Menor(L_BP16!, L_BP1a!, L_BP1e!)   '@3912f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP12!, L_BP1e!, L_BP22!)   '@39140
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP22!   '@39152
    L_BP26! = 2.0 * FX##(V_0e60!) / 25.0 + 1.0   '@3915c DS:2dd6,2de2,2e70
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP26!, V_0dfc$, V_17f2$)   '@3917b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a! = 0.0   '@39190 DS:2e84
    L_BP2e! = V_0e5c! - FX##(LEN(V_0e00$)) * V_0e68!   '@391a1
    L_BP32! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0e00$)) * V_0e68! / 2.0   '@391c2 DS:2de2
    CALL MIXT_0877_Menor(L_BP2e!, L_BP32!, L_BP36!)   '@3922e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2a!, L_BP36!, L_BP3a!)   '@3923f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP3a!   '@39251
    L_BP3e! = 3.0 * FX##(V_0e60!) / 25.0 + 1.0   '@3925b DS:2dd2,2dd6,2e70
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP3e!, V_0e00$, V_17f2$)   '@3927a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e14!)), 0))))), (2))   '@3928f
    L_BP42! = 0.0   '@392ff DS:2e84
    L_BP46! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@39310
    L_BP4a! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e14!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@39331 DS:2de2
    CALL MIXT_0877_Menor(L_BP46!, L_BP4a!, L_BP4e!)   '@3939d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP42!, L_BP4e!, L_BP52!)   '@393ae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP52!   '@393c0
    L_BP56! = 4.0 * FX##(V_0e60!) / 25.0 + 4.0   '@393ca DS:2dd6,2dda
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP56!, V_0dfc$, V_17f2$)   '@393e9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_39403:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@39408 DS:2e70
L_39438:
    ' END SUB   '@39438
END SUB

SUB S_40137   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x40137)
    ' ---- FUN_4000_0137 @0x40137  (040137_FUN_4000_0137.lift.txt; evidence_id (assembly): ev_49b298cb5ed4a7039391c6c68c9659343bc5d7a9ef4d8095aeaa0f60901cb4a6)
    BEEP   '@4013f
    BEEP   '@40149
    BEEP   '@40153
    RT_SCREEN 0   '@4015d
    RT_VIEWPRINT 1, 25   '@40172
    RT_CLOSE   '@40184 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_17fe!)), RT_CINT%(4.0 * FX##(V_1802!)), RT_CINT%(4.0 * FX##(V_1802!))   '@40191 DS:2fe0
    RT_CLS 0   '@401d6
    LOCATE 10, 1   '@401e3
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@401fe DS:2fe4,2fe8
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@4021e DS:2fe4,3002
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@4023e DS:2fe4,302e
L_40263:
    CALL MIXT_07f1_LimpaTeclado   '@40268
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@40272
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@4028e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40263   '@40298
END SUB

SUB S_402b4   ' entrada de SUB/FUNCTION (B$ENRA, locais 68 bytes) (0x402b4)
    DIM L_BP0c%
    DIM L_BP0e%
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
    ' ---- FUN_4000_02b4 @0x402b4  (0402b4_FUN_4000_02b4.lift.txt; evidence_id (assembly): ev_873b35e70168990b4fc9115e6d75ba06fcdf14699ef495bc4008eaf870bacfd7)
    REDIM A_1b7c!(-32768 TO -32768, -32768 TO -32768)   '@402c6
    REDIM A_1b7c!(0 TO 30, 0 TO 4)   '@402d4
    V_1862! = 0.0   '@402f5 DS:3054
    IF NOT (V_190a$ = "N") THEN GOTO L_40325   '@40306 DS:3058
    GOTO L_40d72   '@4031d
L_40325:
    L_BP1a! = V_0ddc!   '@40325
    FOR V_0e14! = 1.0 TO L_BP1a!   '@40336 DS:305e
    V_0e24! = 2.0   '@4033e DS:3062
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_403de   '@4034f
    V_0e24! = 4.0   '@40383 DS:2fe0
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) THEN GOTO L_403d9   '@40394
    V_0e24! = 6.0   '@403c8 DS:3066
L_403d9:
L_403de:
    V_0e28! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@403de
    V_0e18! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@40408
    IF NOT (V_185e! = 0.0) THEN GOTO L_40456   '@40433 DS:3054
    GOTO L_4087e   '@4044e
L_40456:
L_4045b:
    V_0e30! = V_0e28!   '@40460
    V_0e34! = V_0e18!   '@40471
    L_BP0c% = 0   '@40482
    L_BP0e% = 0   '@4048c
    L_BP12! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@40496
    L_BP16! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@404c0
    L_BP1e! = V_185e!   '@404e9
    FOR V_0e1c! = 1.0 TO L_BP1e!   '@404fa DS:305e
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) > V_0e28! AND A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) <= V_0e28!) THEN GOTO L_40677   '@40502
    L_BP0c% = RT_CINT%(FX##(L_BP0c%) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0))   '@40573
    L_BP22! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@405a6
    CALL MIXT_0877_Menor(L_BP12!, L_BP22!, L_BP26!)   '@405d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP22!   '@405e2
    L_BP12! = L_BP26!   '@40607
    IF NOT (L_BP0c% >= V_0e24!) THEN GOTO L_40672   '@40610
    V_0e28! = L_BP12!   '@4062e
    L_BP0c% = 0   '@4063e
    L_BP12! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@40648
L_40672:
L_40677:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) >= V_0e18! AND A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) < V_0e18!) THEN GOTO L_407e5   '@40677
    L_BP0e% = RT_CINT%(FX##(L_BP0e%) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0))   '@406e8
    L_BP2a! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4071b
    CALL MIXT_082a_Maior(L_BP16!, L_BP2a!, L_BP2e!)   '@40742
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP2a!   '@40754
    L_BP16! = L_BP2e!   '@40776
    IF NOT (L_BP0e% >= V_0e24!) THEN GOTO L_407e0   '@4077f
    V_0e18! = L_BP16!   '@4079d
    L_BP0e% = 0   '@407ad
    L_BP16! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@407b7
L_407e0:
L_407e5:
    IF NOT (V_0e18! <= V_0e28!) THEN GOTO L_40808   '@407e5
    GOTO L_40833   '@40800
L_40808:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@40808 DS:305e
L_40833:
    IF NOT (V_0e18! <> V_0e34! OR V_0e28! <> V_0e30!) THEN GOTO L_40879   '@40833
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4045b   '@40871
L_40879:
L_4087e:
    IF NOT (V_0e18! <= V_0e28!) THEN GOTO L_408a6   '@40883
    GOTO L_40d3d   '@4089e
L_408a6:
    V_1862! = FX##(V_1862!) + 1.0   '@408a6 DS:305e
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 0) = V_0e24!   '@408bc
    L_BP32! = -(FX##(V_18da! = 0.0) * V_0eee! + FX##(V_18da! = 1.0) * V_0ef2! + FX##(V_18da! = 2.0) * V_0ef6! + FX##(V_18da! = 3.0) * V_0efa! + FX##(V_18da! = 4.0) * V_0efe! + FX##(V_18da! = 5.0) * V_0f02! + FX##(V_18da! = 6.0) * V_0f06!)   '@408e6 DS:2fe0,3054,305e,3062,3066,306a,306e
    CALL MIXT_082a_Maior(V_0ece!, L_BP32!, L_BP36!)   '@409ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) = L_BP36!   '@409ff
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = INT(V_0e28! - (-(V_18de! < 100.0) * FX##(V_18de!) - (V_18de! > 100.0) * (FX##(V_18de!) - 100.0) * A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) / 10.0))   '@40a23 DS:3072,3076,307a
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e28!) THEN GOTO L_40bab   '@40ac8
    L_BP3a! = A_1b7c!(RT_CINT%(FX##(V_1862!)), 2)   '@40afc
    L_BP3e! = FX##(V_0e28!) - A_1926!(RT_CINT%(FX##(V_0e14!) - 1.0), 0) + V_0eaa!   '@40b24 DS:307e
    CALL MIXT_082a_Maior(L_BP3a!, L_BP3e!, L_BP42!)   '@40b56
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = L_BP3a!   '@40b68
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = L_BP42!   '@40b8a
L_40bab:
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = INT(-(V_18de! < 100.0) * FX##(V_18de!) - (V_18de! > 100.0) * (FX##(V_18de!) - 100.0) * A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) / 10.0 + V_0e18!)   '@40bab DS:3072,3076,307a
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e18!) THEN GOTO L_40d38   '@40c50
    L_BP46! = A_1b7c!(RT_CINT%(FX##(V_1862!)), 3)   '@40c85
    L_BP4a! = FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0eaa! + V_0e18!   '@40cb0
    CALL MIXT_0877_Menor(L_BP46!, L_BP4a!, L_BP4e!)   '@40cdd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = L_BP46!   '@40cef
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = L_BP4e!   '@40d14
L_40d38:
L_40d3d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@40d42 DS:305e
L_40d72:
    ' END SUB   '@40d72
END SUB

SUB S_50146   ' entrada de SUB/FUNCTION (B$ENRA, locais 158 bytes) (0x50146)
    DIM L_BP16$
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1c%
    DIM L_BP1e%
    DIM L_BP20%
    DIM L_BP22%
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e$
    DIM L_BP42$
    DIM L_BP46!
    DIM L_BP4a!
    DIM L_BP4e$
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP68%
    DIM L_BP6c!
    DIM L_BP6e%
    DIM L_BP70%
    DIM L_BP72%
    DIM L_BP74%
    DIM L_BP76%
    DIM L_BP78%
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84$
    DIM L_BP88!
    DIM L_BP8c!
    DIM L_BP90!
    DIM L_BP94!
    DIM L_BP98!
    DIM L_BP9c!
    DIM L_BP9e%
    DIM L_BPa0%
    DIM L_BPa2%
    DIM L_BPa4%
    DIM L_BPa6%
    DIM L_BPa8%
    ' ---- FUN_5000_0146 @0x50146  (050146_FUN_5000_0146.lift.txt; evidence_id (assembly): ev_053e83c2c5d141707531c63ae9bc6b414e88a67d75220767a7ac90bce62ef1b5)
    IF NOT (V_0dfc$ = "RET") THEN GOTO L_50172   '@50153 DS:3090
    GOTO L_50573   '@5016a
L_50172:
L_50177:
    RT_VIEWPRINT 23, 25   '@5017c
    RT_CLS 2   '@5018e
    PRINT " Edicao de Ferragem Transversal"   '@5019c DS:3098
    PRINT " <C>riar  <A>lterar  <I>niciar  <E>sforcos  <R>etorno  <F>im "   '@501aa DS:30bc
    PRINT " <Z>oom   <N>otas    <V>er corte ";   '@501b8 DS:30fe
    CALL MIXT_07f1_LimpaTeclado   '@501c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@501d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = RT_FRE&("")   '@501ec DS:3124
    L_BP16$ = V_0dfc$   '@50206
    IF NOT (L_BP16$ <> "C") THEN GOTO L_50241   '@50218 DS:3128
    IF NOT (L_BP16$ = "c") THEN GOTO L_5025e   '@5022f DS:312e
L_50241:
    GOSUB L_505bf   '@50241
    GOTO L_504c4   '@5024e
L_5025e:
    IF NOT (L_BP16$ <> "A") THEN GOTO L_50282   '@5025e DS:3134
    IF NOT (L_BP16$ = "a") THEN GOTO L_5029f   '@50270 DS:313a
L_50282:
    GOSUB L_51eb5   '@50282
    GOTO L_504c4   '@5028f
L_5029f:
    IF NOT (L_BP16$ <> "I") THEN GOTO L_502c3   '@5029f DS:3140
    IF NOT (L_BP16$ = "i") THEN GOTO L_50304   '@502b1 DS:3146
L_502c3:
    IF NOT (V_1826$ = "*") THEN GOTO L_502e2   '@502c3 DS:314c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@502da
L_502e2:
    V_0dfc$ = "INICIA"   '@502e2 DS:3152
    GOTO L_54417   '@502f4
L_50304:
    IF NOT (L_BP16$ <> "E") THEN GOTO L_50328   '@50304 DS:315c
    IF NOT (L_BP16$ = "e") THEN GOTO L_50369   '@50316 DS:3162
L_50328:
    IF NOT (V_1826$ = "*") THEN GOTO L_50347   '@50328 DS:314c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@5033f
L_50347:
    V_0dfc$ = "ESFORCOS"   '@50347 DS:3168
    GOTO L_54417   '@50359
L_50369:
    IF NOT (L_BP16$ <> "Z") THEN GOTO L_5038d   '@50369 DS:3174
    IF NOT (L_BP16$ = "z") THEN GOTO L_503af   '@5037b DS:317a
L_5038d:
    V_0dfc$ = "ZOOMEST"   '@5038d DS:3180
    GOTO L_54417   '@5039f
L_503af:
    IF NOT (L_BP16$ <> "V") THEN GOTO L_503d3   '@503af DS:318c
    IF NOT (L_BP16$ = "v") THEN GOTO L_503ed   '@503c1 DS:3192
L_503d3:
    CALL S_30137   '@503d3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@503dd
L_503ed:
    IF NOT (L_BP16$ <> "N") THEN GOTO L_50411   '@503ed DS:3198
    IF NOT (L_BP16$ = "n") THEN GOTO L_5042e   '@503ff DS:319e
L_50411:
    GOSUB L_5380e   '@50411
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@5041e
L_5042e:
    IF NOT (L_BP16$ <> "R") THEN GOTO L_50452   '@5042e DS:31a4
    IF NOT (L_BP16$ = "r") THEN GOTO L_50474   '@50440 DS:31aa
L_50452:
    V_0dfc$ = "RET"   '@50452 DS:3090
    GOTO L_54417   '@50464
L_50474:
    IF NOT (L_BP16$ <> "F") THEN GOTO L_50498   '@50474 DS:31b0
    IF NOT (L_BP16$ = "f") THEN GOTO L_504a8   '@50486 DS:31b6
L_50498:
    GOTO L_54417   '@50498
L_504a8:
    BEEP   '@504a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@504b2
L_504c4:
    IF NOT (V_0dfc$ = "RET") THEN GOTO L_504e8   '@504c9 DS:3090
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@504e0
L_504e8:
    RT_VIEW 2, (0), (RT_CINT%(FX##(V_0e60!) / 25.0 + 1.0)), (RT_CINT%(FX##(V_0e5c!) - 1.0)), (RT_CINT%(4.0 * FX##(V_0e60!) / 25.0 + 4.0)), (-1), (-1)   '@504e8 DS:31bc,31c0,31c4,31c8 (B$VIEW decodificado)
    RT_CLS 1   '@5053c
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@5054a (sem argumentos (B$WIN0/B$VEW0))
    RT_VIEWPRINT 1, 25   '@50554
    GOTO L_505a3   '@50566
L_50573:
    RT_VIEWPRINT 1, 25   '@50578
    CALL S_34cb0   '@5058a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_35a6b   '@50594
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_505a3:
    CALL S_38b83   '@505a8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50177   '@505b2
    ' ---- F_505ba @0x505ba  (0505ba_F_505ba.lift.txt; evidence_id (assembly): ev_7905e8f81793692dd6ef4190e102bdb61039af0de6186b8c38acf17e9b76913f)
L_505bf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050146_FUN_5000_0146
    RT_CLS 2   '@505c4
    PRINT " Criacao de Estribos"   '@505d2 DS:31cc
    LOCATE 24, 1   '@505e0
    RT_LINEINPUT " Espacamento *RETORNO* ", V_0dfc$   '@505fb DS:31e4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_50646   '@50615
    V_0dfc$ = "RET"   '@5062a DS:3090
    RETURN   '@5063c
L_50646:
L_5064b:
    LOCATE 24, 28   '@50650
    RT_LINEINPUT "Bitola da Ferragem (mm) ", V_0e00$   '@5066e DS:3200
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0e00$)   '@50688
    IF NOT (V_0e44! <> V_0f02! AND (V_0e44! <> V_0efe! AND (V_0e44! <> V_0efa! AND (V_0e44! <> V_0ef6! AND (V_0e44! <> V_0ef2! AND V_0e44! <> V_0eee!))))) THEN GOTO L_5075e   '@506a2
    BEEP   '@5074c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5064b   '@50756
L_5075e:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 3) = VAL(V_0dfc$)   '@5075e DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 2) = V_0e44!   '@50797 DS:31c0
L_507c9:
    LOCATE 24, 58   '@507ce
    RT_LINEINPUT "Localizado no Tramo ", V_0dfc$   '@507ec DS:321c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = VAL(V_0dfc$)   '@50806
    IF NOT (FX##(V_0ddc!) + V_0de4! < FX##(V_0e44!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e44!)) THEN GOTO L_5087a   '@50820 DS:31c0
    BEEP   '@50868
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_507c9   '@50872
L_5087a:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 4) = 1 - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f3e!) - (A_1232!(RT_CINT%(FX##(V_0e44!)), 0) > V_0f42!)   '@5087a DS:31c0
L_50918:
    LOCATE 25, 1   '@5091d
    PRINT " Inicio  (cm "; CHR$(26); " +) a partir da Face ";   '@50938 DS:3234,3246
    IF NOT (V_0e44! = 0.0) THEN GOTO L_5098f   '@5095e DS:3260
    PRINT "esquerda do Balanco";   '@50979 DS:3264
    GOTO L_509d2   '@50987
L_5098f:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e44!) - 1.0))), (2));   '@5098f DS:31c4,327c
L_509d2:
    RT_LINEINPUTPV " ", V_0dfc$   '@509d2 DS:328a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_50a13   '@509ec
    BEEP   '@50a01
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50918   '@50a0b
L_50a13:
    IF NOT (V_0e44! = 0.0) THEN GOTO L_50ab5   '@50a13 DS:3260
    L_BP18% = (VAL(V_0dfc$) < 0.0#)   '@50a2e DS:3290
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) OR L_BP18%) <> 0) THEN GOTO L_50ab0   '@50a7d
    BEEP   '@50a9e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50918   '@50aa8
L_50ab0:
L_50ab5:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e44!)) THEN GOTO L_50b7d   '@50ab5 DS:31c0
    L_BP1a% = (FX##(VAL(V_0dfc$)) < FX##(-A_1926!(RT_CINT%(FX##(V_0ddc!)), 0)) / 2.0)   '@50ad5 DS:3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) OR L_BP1a%) <> 0) THEN GOTO L_50b78   '@50b45
    BEEP   '@50b66
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50918   '@50b70
L_50b78:
L_50b7d:
    IF NOT (V_0e44! <= V_0ddc! AND V_0e44! >= 1.0) THEN GOTO L_50c8b   '@50b7d DS:31c0
    L_BP1c% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0e44!) - 1.0), 0)) / 2.0)   '@50bbb DS:31c4,3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e44!)), 1) OR L_BP1c%) <> 0) THEN GOTO L_50c86   '@50c53
    BEEP   '@50c74
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50918   '@50c7e
L_50c86:
L_50c8b:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)) + VAL(V_0dfc$)   '@50c8b DS:31c0
L_50ce6:
    LOCATE 25, 1   '@50ceb
    PRINT " (Inicio-"; RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0)) - A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)); ")  Termino (cm "; CHR$(26); " +) a partir da face ";   '@50d06 DS:31c0,329c,32aa,32be
    IF NOT (V_0e44! = 0.0) THEN GOTO L_50db6   '@50d85 DS:3260
    PRINT "esquerda do Balanco";   '@50da0 DS:3264
    GOTO L_50df9   '@50dae
L_50db6:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e44!) - 1.0))), (2));   '@50db6 DS:31c4,327c
L_50df9:
    RT_LINEINPUTPV " ", V_0dfc$   '@50df9 DS:328a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_50e3a   '@50e13
    BEEP   '@50e28
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ce6   '@50e32
L_50e3a:
    IF NOT (V_0e44! = 0.0) THEN GOTO L_50eff   '@50e3a DS:3260
    L_BP1e% = (VAL(V_0dfc$) <= 0.0#)   '@50e55 DS:3290,3298
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e44!)), 1) OR L_BP1e%) <> 0) THEN GOTO L_50efa   '@50ec7
    BEEP   '@50ee8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ce6   '@50ef2
L_50efa:
L_50eff:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e44!)) THEN GOTO L_50fc7   '@50eff DS:31c0
    L_BP20% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0ddc!)), 0)) / 2.0)   '@50f1f DS:3298
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 1)) OR L_BP20%) <> 0) THEN GOTO L_50fc2   '@50f8f
    BEEP   '@50fb0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ce6   '@50fba
L_50fc2:
L_50fc7:
    IF NOT (V_0e44! <= V_0ddc! AND V_0e44! >= 1.0) THEN GOTO L_510d5   '@50fc7 DS:31c0
    L_BP22% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0e44!) - 1.0), 0)) / 2.0)   '@51005 DS:31c4,3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e44!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e44!)), 1) OR L_BP22%) <> 0) THEN GOTO L_510d0   '@5109d
    BEEP   '@510be
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ce6   '@510c8
L_510d0:
L_510d5:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 1) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e44!)), 0)) + VAL(V_0dfc$)   '@510d5 DS:31c0
    V_186a! = FX##(V_186a!) + 1.0   '@5112c DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!)), 5) = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e44!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e44!)), 1) * 0.0000999999974737875163555145263671875##   '@51142 DS:32d8
    GOSUB L_511d0   '@511b4
    RETURN   '@511c1
L_511d0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 051eb0_F_51eb0
    L_BP26! = V_186a!   '@511d5
    FOR V_0e44! = 1.0 TO L_BP26!   '@511e6 DS:31c0
L_511f3:
    IF NOT (V_0e44! >= V_186a!) THEN GOTO L_5121b   '@511f8
    GOTO L_5192e   '@51213
L_5121b:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_186a!)), 0) >= A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) OR A_1c06!(RT_CINT%(FX##(V_186a!)), 1) <= A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) THEN GOTO L_512c9   '@5121b
    GOTO L_5192e   '@512c1
L_512c9:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_186a!)), 1) < A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1c06!(RT_CINT%(FX##(V_186a!)), 0) <= A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) THEN GOTO L_513bb   '@512c9
    A_1c06!(RT_CINT%(FX##(V_0e44!)), 0) = A_1c06!(RT_CINT%(FX##(V_186a!)), 1)   '@5136f
    GOTO L_5192e   '@513b3
L_513bb:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_186a!)), 0) > A_1c06!(RT_CINT%(FX##(V_0e44!)), 0) AND A_1c06!(RT_CINT%(FX##(V_186a!)), 1) >= A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) THEN GOTO L_514ad   '@513bb
    A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) = A_1c06!(RT_CINT%(FX##(V_186a!)), 0)   '@51461
    GOTO L_5192e   '@514a5
L_514ad:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_186a!)), 1) < A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) AND A_1c06!(RT_CINT%(FX##(V_186a!)), 0) > A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) THEN GOTO L_5155b   '@514ad
    GOTO L_51575   '@51553
L_5155b:
    GOSUB L_5197a   '@5155b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_511f3   '@51568
L_51575:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0) = A_1c06!(RT_CINT%(FX##(V_186a!)), 0)   '@5157a DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 1) = A_1c06!(RT_CINT%(FX##(V_186a!)), 1)   '@515c2 DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 2) = A_1c06!(RT_CINT%(FX##(V_186a!)), 2)   '@5160c DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 3) = A_1c06!(RT_CINT%(FX##(V_186a!)), 3)   '@51650 DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 4) = A_1c06!(RT_CINT%(FX##(V_186a!)), 4)   '@5169a DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 5) = A_1c06!(RT_CINT%(FX##(V_186a!)), 5)   '@516e4 DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!)), 0) = A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 1)   '@5172e DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!)), 1) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)   '@51777
    A_1c06!(RT_CINT%(FX##(V_186a!)), 2) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 2)   '@517bc
    A_1c06!(RT_CINT%(FX##(V_186a!)), 3) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 3)   '@517fb
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 4)   '@51840
    A_1c06!(RT_CINT%(FX##(V_186a!)), 5) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 5)   '@51885
    A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) = A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0)   '@518ca DS:31c0
    V_186a! = FX##(V_186a!) + 1.0   '@51913 DS:31c0
L_5192e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e44!   '@51933 DS:31c0
    GOSUB L_51ba0   '@5195e
    RETURN   '@5196b
L_5197a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 051eb0_F_51eb0
    L_BP2a! = V_186a!   '@5197f
    FOR V_0e20! = FX##(V_0e44!) + 1.0 TO L_BP2a!   '@51990 DS:31c0
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 0) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 0)   '@5199c DS:31c4
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 1) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 1)   '@519e4 DS:31c4
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 2) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 2)   '@51a2e DS:31c4
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 3) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 3)   '@51a72 DS:31c4
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 4) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 4)   '@51abc DS:31c4
    A_1c06!(RT_CINT%(FX##(V_0e20!) - 1.0), 5) = A_1c06!(RT_CINT%(FX##(V_0e20!)), 5)   '@51b06 DS:31c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e20!   '@51b50 DS:31c0
    V_186a! = FX##(V_186a!) - 1.0   '@51b7b DS:31c4
    RETURN   '@51b91
L_51ba0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 051eb0_F_51eb0
    L_BP2e! = V_186a!   '@51ba5
    FOR V_0e28! = 1.0 TO L_BP2e!   '@51bb6 DS:31c0
    A_1c06!(RT_CINT%(FX##(V_0e28!)), 6) = 0.0   '@51bbe DS:3260
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@51be9 DS:31c0
    V_0e28! = 1.0   '@51c11 DS:31c0
    V_0e20! = 0.0   '@51c22 DS:3260
L_51c38:
    V_0e20! = FX##(V_0e20!) + 1.0   '@51c3d DS:31c0
    A_1c06!(RT_CINT%(FX##(V_0e28!)), 6) = V_0e20!   '@51c53
    IF NOT (FX##(V_0e28!) + 1.0 > FX##(V_186a!)) THEN GOTO L_51ca6   '@51c7e DS:31c0
    GOTO L_51e2c   '@51c9e
L_51ca6:
    L_BP32! = V_186a!   '@51ca6
    FOR V_0e14! = FX##(V_0e28!) + 1.0 TO L_BP32!   '@51cb7 DS:31c0
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e28!)), 4) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 4) AND (A_1c06!(RT_CINT%(FX##(V_0e28!)), 2) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 2) AND A_1c06!(RT_CINT%(FX##(V_0e28!)), 5) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 5))) THEN GOTO L_51dfc   '@51cc4
    A_1c06!(RT_CINT%(FX##(V_0e14!)), 6) = A_1c06!(RT_CINT%(FX##(V_0e28!)), 6)   '@51db7
L_51dfc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@51dfc DS:31c0
L_51e2c:
    IF NOT (V_0e28! >= V_186a!) THEN GOTO L_51e56   '@51e31
    RETURN   '@51e4c
L_51e56:
    V_0e28! = FX##(V_0e28!) + 1.0   '@51e56 DS:31c0
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e28!)), 6) > 0.0) THEN GOTO L_51ea8   '@51e6c DS:3260
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_51e2c   '@51ea1
L_51ea8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_51c38   '@51ea8
    ' ---- F_51eb0 @0x51eb0  (051eb0_F_51eb0.lift.txt; evidence_id (assembly): ev_c699eff06ba2452e93989d27fb75989c88e52942324d8043a8046754ea211e6b)
L_51eb5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050146_FUN_5000_0146
    RT_CLS 2   '@51eba
    PRINT " Alteracao de Ferragem Transversal"   '@51ec8 DS:32dc
    IF NOT (V_186a! = 0.0) THEN GOTO L_51f0d   '@51ed6 DS:3260
    V_0dfc$ = "RET"   '@51ef1 DS:3090
    RETURN   '@51f03
L_51f0d:
    V_0e44! = 1.0   '@51f0d DS:31c0
L_51f23:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e44!)), 1) < A_1a0c!(RT_CINT%(FX##(V_18fe!)), 0) OR A_1c06!(RT_CINT%(FX##(V_0e44!)), 0) > A_1a0c!(RT_CINT%(FX##(V_1902!)), 1)) THEN GOTO L_51fd6   '@51f28
    GOTO L_537ba   '@51fce
L_51fd6:
    RT_VIEWPRINT 1, 25   '@51fd6
    L_BP36! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@51fe8 DS:3298
    L_BP3a! = 0.189999997615814208984375## * V_0e60!   '@5204d DS:3302
    L_BP3e$ = CHR$(24)   '@5205c
    CALL MIXT_08c4_TextoGrafico(L_BP36!, L_BP3a!, L_BP3e$, V_17f2$)   '@5206f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @52084 libera strings locais (L_BP3e)
    LOCATE 24, 1   '@5208d
    PRINT " (vide "; CHR$(24); " acima) Corrigir   <S>im  <*N*>ao  <D>eletar  <R>etorno ";   '@520a8 DS:3306,3312
    V_0dfc$ = RT_INPUT$(1)   '@520ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP42$ = V_0dfc$   '@520ea
    IF NOT (L_BP42$ <> "D") THEN GOTO L_52125   '@520fc DS:334e
    IF NOT (L_BP42$ = "d") THEN GOTO L_521db   '@52113 DS:3354
L_52125:
    LOCATE 24, 1   '@52125
    PRINT RT_STRINGC$((73), (32))   '@52140
    LOCATE 24, 1   '@52158
    RT_LINEINPUT " Deletar intervalo indicado  SIM/*N* ", V_0e00$   '@52173 DS:335a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e00$) = "SIM") THEN GOTO L_521d3   '@5218d DS:3384
    GOSUB L_5197a   '@521aa
    GOSUB L_51ba0   '@521b7
    RETURN   '@521c4
L_521d3:
    GOTO L_537b5   '@521d3
L_521db:
    IF NOT (L_BP42$ <> "R") THEN GOTO L_521ff   '@521db DS:31a4
    IF NOT (L_BP42$ = "r") THEN GOTO L_52441   '@521ed DS:31aa
L_521ff:
    L_BP46! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@521ff DS:3298
    L_BP4a! = 0.189999997615814208984375## * V_0e60!   '@52264 DS:3302
    L_BP4e$ = "~" + CHR$(24)   '@52273 DS:338c
    CALL MIXT_08c4_TextoGrafico(L_BP46!, L_BP4a!, L_BP4e$, V_17f2$)   '@52290
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @522a5 libera strings locais (L_BP4e)
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e44!)), 0))))), (2))   '@522ae
    L_BP52! = 0.0   '@5231e DS:3260
    L_BP56! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@5232f
    L_BP5a! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@52350 DS:3298
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@523bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP52!, L_BP5e!, L_BP62!)   '@523cd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP62!   '@523df
    L_BP66! = 4.0 * FX##(V_0e60!) / 25.0 + 4.0   '@523e9 DS:31bc,31c8
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP66!, V_0dfc$, V_17f2$)   '@52408
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = "RET"   '@5241d DS:3090
    RETURN   '@5242f
    ' @52439 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_537b5   '@52439
L_52441:
    IF NOT (L_BP42$ <> "S") THEN GOTO L_52465   '@52441 DS:3392
    IF NOT (L_BP42$ = "s") THEN GOTO L_5358b   '@52453 DS:3398
L_52465:
    RT_VIEWPRINT 23, 25   '@52465
    RT_CLS 2   '@52477
    PRINT " Alteracao de ferragem"   '@52485 DS:339e
L_52498:
    LOCATE 24, 1   '@5249d
    PRINT " Espacamento *"; LTRIM$(STR$(A_1c06!(RT_CINT%(FX##(V_0e44!)), 3)));   '@524b8 DS:33b8
    RT_LINEINPUT "* ", V_0dfc$   '@524f9 DS:33ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_5257a   '@52513
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 3) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 3)   '@52528 DS:31c0
    GOTO L_5261e   '@52572
L_5257a:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 3) = VAL(V_0dfc$)   '@5257a DS:31c0
    L_BP68% = (FX##(VAL(V_0dfc$)) < FX##(V_18be!))   '@525b3
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(V_18c2!) OR L_BP68%) <> 0) THEN GOTO L_52619   '@525e6
    BEEP   '@52607
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52498   '@52611
L_52619:
L_5261e:
L_52623:
    LOCATE 24, 28   '@52628
    PRINT " Bitola da Ferragem (mm) *"; LTRIM$(STR$(A_1c06!(RT_CINT%(FX##(V_0e44!)), 2)));   '@52646 DS:33d0
    RT_LINEINPUT "* ", V_0e00$   '@52684 DS:33ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e00$) = 0) THEN GOTO L_526ff   '@5269e
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 2) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 2)   '@526b3 DS:31c0
    GOTO L_52807   '@526f7
L_526ff:
    V_0e20! = VAL(V_0e00$)   '@526ff
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 2) = V_0e20!   '@52719 DS:31c0
    IF NOT (V_0e20! <> V_0f02! AND (V_0e20! <> V_0efe! AND (V_0e20! <> V_0efa! AND (V_0e20! <> V_0ef6! AND (V_0e20! <> V_0ef2! AND V_0e20! <> V_0eee!))))) THEN GOTO L_52802   '@52746
    BEEP   '@527f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52623   '@527fa
L_52802:
L_52807:
    L_BP6c! = V_1902!   '@52807
    FOR V_0e28! = V_18fe! TO L_BP6c!   '@52818 DS:31c0
    IF NOT ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) AND (FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) OR (FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - 1.0 OR FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - 1.0)) THEN GOTO L_52a69   '@52820 DS:31c0,31c4,3298
    GOTO L_52a94   '@52a61
L_52a69:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@52a69 DS:31c0
L_52a94:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 4) = A_1c06!(RT_CINT%(FX##(V_0e44!)), 4)   '@52a9e DS:31c0
L_52aed:
    LOCATE 25, 1   '@52af2
    PRINT " Inicio  (cm "; CHR$(26); " +) a partir da face ";   '@52b0d DS:3234,32be
    IF NOT (V_0e28! = 0.0) THEN GOTO L_52b64   '@52b33 DS:3260
    PRINT "esquerda do Balanco";   '@52b4e DS:3264
    GOTO L_52ba7   '@52b5c
L_52b64:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e28!) - 1.0))), (2));   '@52b64 DS:31c4,327c
L_52ba7:
    PRINT " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))));   '@52ba7 DS:33ee
    RT_LINEINPUTPV "* ", V_0dfc$   '@52c0c DS:33ca (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_52c95   '@52c26
    V_0dfc$ = STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)))   '@52c3b
L_52c95:
    IF NOT (V_0e28! = 0.0) THEN GOTO L_52d37   '@52c95 DS:3260
    L_BP6e% = (VAL(V_0dfc$) < 0.0#)   '@52cb0 DS:3290
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 1)) OR L_BP6e%) <> 0) THEN GOTO L_52d32   '@52cff
    BEEP   '@52d20
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52aed   '@52d2a
L_52d32:
L_52d37:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_52dff   '@52d37 DS:31c0
    L_BP70% = (FX##(VAL(V_0dfc$)) < FX##(-A_1926!(RT_CINT%(FX##(V_0ddc!)), 0)) / 2.0)   '@52d57 DS:3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 1)) OR L_BP70%) <> 0) THEN GOTO L_52dfa   '@52dc7
    BEEP   '@52de8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52aed   '@52df2
L_52dfa:
L_52dff:
    IF NOT (V_0e28! <= V_0ddc! AND V_0e28! >= 1.0) THEN GOTO L_52f0d   '@52dff DS:31c0
    L_BP72% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) / 2.0)   '@52e3d DS:31c4,3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e28!)), 1) OR L_BP72%) <> 0) THEN GOTO L_52f08   '@52ed5
    BEEP   '@52ef6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52aed   '@52f00
L_52f08:
L_52f0d:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + VAL(V_0dfc$)   '@52f0d DS:31c0
L_52f68:
    LOCATE 25, 1   '@52f6d
    PRINT " (Inicio"; RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)); ")  Termino (cm "; CHR$(26); " +) a partir da face ";   '@52f88 DS:31c0,32aa,32be,33f4
    IF NOT (V_0e28! = 0.0) THEN GOTO L_53038   '@53007 DS:3260
    PRINT "esquerda do Balanco";   '@53022 DS:3264
    GOTO L_5307b   '@53030
L_53038:
    PRINT "do Apoio "; RT_MID2$((A_1954$(RT_CINT%(FX##(V_0e28!) - 1.0))), (2));   '@53038 DS:31c4,327c
L_5307b:
    PRINT " *"; LTRIM$(STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0))));   '@5307b DS:33ee
    RT_LINEINPUTPV "* ", V_0dfc$   '@530e1 DS:33ca (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_5316b   '@530fb
    V_0dfc$ = STR$(RT_SNG!(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)))   '@53110
L_5316b:
    IF NOT (FX##(VAL(V_0dfc$)) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) <= FX##(A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 0))) THEN GOTO L_531e0   '@5316b DS:31c0
    BEEP   '@531ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52f68   '@531d8
L_531e0:
    IF NOT (V_0e28! = 0.0) THEN GOTO L_532a5   '@531e0 DS:3260
    L_BP74% = (VAL(V_0dfc$) <= 0.0#)   '@531fb DS:3290,3298
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e28!)), 1) OR L_BP74%) <> 0) THEN GOTO L_532a0   '@5326d
    BEEP   '@5328e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52f68   '@53298
L_532a0:
L_532a5:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_5336d   '@532a5 DS:31c0
    L_BP76% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0ddc!)), 0)) / 2.0)   '@532c5 DS:3298
    IF NOT ((FX##(VAL(V_0dfc$)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 1)) OR L_BP76%) <> 0) THEN GOTO L_53368   '@53335
    BEEP   '@53356
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52f68   '@53360
L_53368:
L_5336d:
    IF NOT (V_0e28! <= V_0ddc! AND V_0e28! >= 1.0) THEN GOTO L_5347b   '@5336d DS:31c0
    L_BP78% = (FX##(VAL(V_0dfc$)) <= FX##(-A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) / 2.0)   '@533ab DS:31c4,3298
    IF NOT ((FX##(VAL(V_0dfc$)) >= FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) / 2.0 + A_1926!(RT_CINT%(FX##(V_0e28!)), 1) OR L_BP78%) <> 0) THEN GOTO L_53476   '@53443
    BEEP   '@53464
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52f68   '@5346e
L_53476:
L_5347b:
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 1) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + VAL(V_0dfc$)   '@5347b DS:31c0
    A_1c06!(RT_CINT%(FX##(V_186a!) + 1.0), 5) = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) * 0.0000999999974737875163555145263671875##   '@534d2 DS:31c0,32d8
    V_186a! = FX##(V_186a!) + 1.0   '@53549 DS:31c0
    GOSUB L_5197a   '@5355f
    GOSUB L_511d0   '@5356c
    RETURN   '@53579
    ' @53583 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_537b5   '@53583
L_5358b:
    L_BP7c! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(V_0e68!) / 2.0   '@5358b DS:3298
    L_BP80! = 0.189999997615814208984375## * V_0e60!   '@535f0 DS:3302
    L_BP84$ = "~" + CHR$(24)   '@535ff DS:338c
    CALL MIXT_08c4_TextoGrafico(L_BP7c!, L_BP80!, L_BP84$, V_17f2$)   '@5361d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @53633 libera strings locais (L_BP84)
    V_0dfc$ = LTRIM$(STR$(RT_SNG!(INT(FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)))))   '@5363d
    L_BP88! = 0.0   '@536a5 DS:3260
    L_BP8c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@536b7
    L_BP90! = ((FX##(A_1c06!(RT_CINT%(FX##(V_0e44!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e44!)), 1)) / 2.0 - V_0f7a!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! / 2.0   '@536d9 DS:3298
    CALL MIXT_0877_Menor(L_BP8c!, L_BP90!, L_BP94!)   '@53746
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP88!, L_BP94!, L_BP98!)   '@5375a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP98!   '@5376f
    L_BP9c! = 4.0 * FX##(V_0e60!) / 25.0 + 4.0   '@5377a DS:31bc,31c8
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP9c!, V_0dfc$, V_17f2$)   '@5379a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_537b5:
L_537ba:
    V_0e44! = FX##(V_0e44!) + 1.0   '@537bf DS:31c0
    IF NOT (V_0e44! > V_186a!) THEN GOTO L_53801   '@537d5
    V_0e44! = 1.0   '@537f0 DS:31c0
L_53801:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_51f23   '@53801
    ' ---- F_53809 @0x53809  (053809_F_53809.lift.txt; evidence_id (assembly): ev_4b305d775356db01f77708e532049ee9576971fbee8d14965204ef973c0af53d)
L_5380e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050146_FUN_5000_0146
    V_0e28! = 2.0   '@53813 DS:3298
L_53829:
    RT_CLS 2   '@5382e
    PRINT " Notas de Observacao na Forma"   '@5383c DS:3400
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (3), (1)) = "") THEN GOTO L_5388b   '@5384a DS:3124
    GOTO L_53af9   '@53883
L_5388b:
    BEEP   '@5388b
    LOCATE 24, 2   '@53895
    PRINT RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (4));   '@538b3
    LOCATE 25, 1   '@538e3
    PRINT " Tramo "; RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (1), (3));   '@538fe DS:3422
    LOCATE 25, 15   '@53934
    RT_LINEINPUT " Altero a Nota S/*N* ", V_0dfc$   '@53952 DS:342e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) = "S") THEN GOTO L_53aa9   '@5396c DS:3392
    IF NOT (V_0e28! < 5.0) THEN GOTO L_53a76   '@53989 DS:3448
    V_0e20! = V_0e28!   '@539a4
L_539ba:
    IF NOT (V_0e20! >= 5.0) THEN GOTO L_53a60   '@539bb DS:3448
    A_1c90$(RT_CINT%(FX##(V_0e20!))) = A_1c90$(RT_CINT%(FX##(V_0e20!) + 1.0))   '@539d0 DS:31c0
    IF NOT (A_1c90$(RT_CINT%(FX##(V_0e20!))) = "") THEN GOTO L_53a42   '@53a0f DS:3124
    GOTO L_53a60   '@53a3a
L_53a42:
    V_0e20! = FX##(V_0e20!) + 1.0   '@53a42 DS:31c0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_539ba   '@53a58
L_53a60:
    V_0e28! = V_0e20!   '@53a60
L_53a76:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = ""   '@53a76 DS:3124
    GOTO L_53af9   '@53a9c
L_53aa9:
L_53aae:
    IF NOT (V_0e28! < 5.0) THEN GOTO L_53aec   '@53ab3 DS:3448
    V_0e28! = FX##(V_0e28!) + 1.0   '@53ace DS:31c0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53829   '@53ae4
L_53aec:
    GOTO L_53e86   '@53aec
L_53af9:
    RT_CLS 2   '@53afe
    PRINT " Notas de Observacao na Forma"   '@53b0c DS:3400
    LOCATE 24, 1   '@53b1a
    RT_LINEINPUT " Numero do Tramo em que sera colocada a Nota *NENHUM* ", V_0dfc$   '@53b35 DS:344c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_53b6c   '@53b4f
    GOTO L_53e86   '@53b64
L_53b6c:
    V_0e20! = VAL(V_0dfc$)   '@53b6c
    L_BP9e% = (FX##(V_0ddc!) + V_0de4! < FX##(V_0e20!) OR 1.0 - FX##(V_0de0!) > FX##(V_0e20!))   '@53b86 DS:31c0
    IF NOT ((INT(FX##(V_0e20!)) <> FX##(V_0e20!) OR L_BP9e%) <> 0) THEN GOTO L_53c06   '@53bd7
    BEEP   '@53bf4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53af9   '@53bfe
L_53c06:
L_53c0b:
    LOCATE 25, 1   '@53c10
    PRINT " Posicao no Tramo"; V_0e20!; "   <E>squerda  <C>entro  <D>ireita ";   '@53c2b DS:3486,349c
    V_0dfc$ = RT_INPUT$(1)   '@53c4f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@53c6b
    L_BPa0% = (V_0dfc$ <> "E")   '@53c83 DS:315c
    L_BPa2% = V_0dfc$ <> "C" AND L_BPa0%   '@53ca9 DS:3128
    IF NOT ((V_0dfc$ <> "D" AND L_BPa2%) <> 0) THEN GOTO L_53cee   '@53cc6 DS:334e
    BEEP   '@53cdc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53c0b   '@53ce6
L_53cee:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = RT_MID2$((STR$(V_0e20!)), ((V_0e20! <= 9.0) + 2)) + V_0dfc$ + "."   '@53cee DS:34c4,34c8
L_53d5c:
    LOCATE 25, 1   '@53d61
    PRINT RT_STRINGC$((80), (32));   '@53d7c
    LOCATE 25, 1   '@53d94
    RT_LINEINPUTPV " NOTA:", V_0dfc$   '@53daf DS:34ce (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@53dc9
    L_BPa4% = (LEN(V_0dfc$) = 0)   '@53de1
    IF NOT ((LEN(V_0dfc$) > 40 OR L_BPa4%) <> 0) THEN GOTO L_53e2a   '@53dff
    BEEP   '@53e18
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53d5c   '@53e22
L_53e2a:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (1), (3)) + V_0dfc$   '@53e2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53aae   '@53e79
L_53e86:
    V_0e28! = 6.0   '@53e8b DS:34d8
L_53ea1:
    RT_CLS 2   '@53ea6
    PRINT " Notas de Observacao na Armadura"   '@53eb4 DS:34dc
    IF NOT (RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (3), (1)) = "") THEN GOTO L_53f03   '@53ec2 DS:3124
    GOTO L_54173   '@53efb
L_53f03:
    BEEP   '@53f03
    LOCATE 24, 2   '@53f0d
    PRINT RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (4));   '@53f2b
    LOCATE 25, 1   '@53f5b
    PRINT " Posicao "; RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (1), (3));   '@53f76 DS:3500
    LOCATE 25, 15   '@53fac
    RT_LINEINPUT " Altero a Nota S/*N* ", V_0dfc$   '@53fca DS:342e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0dfc$) = "S") THEN GOTO L_54121   '@53fe4 DS:3392
    IF NOT (V_0e28! < 14.0) THEN GOTO L_540ee   '@54001 DS:350e
    V_0e20! = V_0e28!   '@5401c
L_54032:
    IF NOT (V_0e20! >= 14.0) THEN GOTO L_540d8   '@54033 DS:350e
    A_1c90$(RT_CINT%(FX##(V_0e20!))) = A_1c90$(RT_CINT%(FX##(V_0e20!) + 1.0))   '@54048 DS:31c0
    IF NOT (A_1c90$(RT_CINT%(FX##(V_0e20!))) = "") THEN GOTO L_540ba   '@54087 DS:3124
    GOTO L_540d8   '@540b2
L_540ba:
    V_0e20! = FX##(V_0e20!) + 1.0   '@540ba DS:31c0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54032   '@540d0
L_540d8:
    V_0e28! = V_0e20!   '@540d8
L_540ee:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = ""   '@540ee DS:3124
    GOTO L_54173   '@54114
L_54121:
L_54126:
    IF NOT (V_0e28! < 14.0) THEN GOTO L_54164   '@5412b DS:350e
    V_0e28! = FX##(V_0e28!) + 1.0   '@54146 DS:31c0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53ea1   '@5415c
L_54164:
    RETURN   '@54164
L_54173:
    RT_CLS 2   '@54178
    PRINT " Notas de Observacao na Armadura"   '@54186 DS:34dc
    LOCATE 24, 1   '@54194
    RT_LINEINPUT " Numero da Posicao em que sera colocada a Nota *RETORNO* ", V_0dfc$   '@541af DS:3512
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0dfc$) = 0) THEN GOTO L_541e8   '@541c9
    RETURN   '@541de
L_541e8:
    V_0e20! = VAL(V_0dfc$)   '@541e8
    L_BPa6% = (FX##(V_185e!) + V_1866! + V_1872! + V_1876! < FX##(V_0e20!) OR V_0e20! < 1.0)   '@54202 DS:31c0
    IF NOT ((INT(FX##(V_0e20!)) <> FX##(V_0e20!) OR L_BPa6%) <> 0) THEN GOTO L_54287   '@54258
    BEEP   '@54275
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54173   '@5427f
L_54287:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = V_18ea$ + RT_MID$((STR$(V_0e20!)), (1 - (V_0e20! > 9.0)), (2))   '@54287 DS:34c4
L_542ed:
    LOCATE 25, 1   '@542f2
    PRINT RT_STRINGC$((80), (32));   '@5430d
    LOCATE 25, 1   '@54325
    RT_LINEINPUTPV " NOTA:", V_0dfc$   '@54340 DS:34ce (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = UCASE$(V_0dfc$)   '@5435a
    L_BPa8% = (LEN(V_0dfc$) = 0)   '@54372
    IF NOT ((LEN(V_0dfc$) > 40 OR L_BPa8%) <> 0) THEN GOTO L_543bb   '@54390
    BEEP   '@543a9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_542ed   '@543b3
L_543bb:
    A_1c90$(RT_CINT%(FX##(V_0e28!))) = RT_MID$((A_1c90$(RT_CINT%(FX##(V_0e28!)))), (1), (3)) + V_0dfc$   '@543bb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54126   '@5440a
    ' ---- FUN_5000_4417 @0x54417  (054417_FUN_5000_4417.lift.txt; evidence_id (assembly): ev_c75159a4441e00b89fdf1d155251f9c21c4e6762ca6915d03fb625345becc28f)
L_54417:   ' entrada vinda de 050146_FUN_5000_0146
    ' @54417 libera strings locais (L_BP42)
    ' @54420 libera strings locais (L_BP16)
    ' END SUB   '@54429
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_DESENHO.BM'
'$INCLUDE: '../comum/MIXT.BM'
