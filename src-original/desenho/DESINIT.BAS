' ============================================================================
'  DESINIT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/DESINIT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 2e7134ae3ecc360b378e0d17668d19fd80841b7be1044d0775c43290a8c76d00
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_DESENHO.BI'

' ---- variaveis do DESINIT fora do COMMON (DS do programa)
DIM SHARED V_1e06$
DIM SHARED V_1e0a!
DIM SHARED V_1f1c$
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
DIM SHARED RG_1F1C AS STRING * 70   ' registro de GET/PUT # em DS:1F1C

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "DESINIT"
' ---- M_DESINIT @0x10030  (010030_M_DESINIT.lift.txt; evidence_id (assembly): ev_3fcf0014a726341dea46f1626f07907642bd28a7912c66c34759623c861cb50e)
' @10030 inicio do programa (B$?EVT)
GOTO L_101a2   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101a2:
L_101a7:   ' entrada vinda de 0107f1_F_107f1
ON ERROR GOTO L_10c0e
RT_ONERR = &H10c0e   '@101ac
GOSUB L_107f6   '@101bb
IF NOT (V_0e04$ = "INILONG") THEN GOTO L_10212   '@101c8 DS:1fca
CALL S_40132   '@101df
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
CALL S_338ed   '@101e9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
V_0dfc$ = "DESEDCAO"   '@101f3 DS:1fd6
GOTO L_10693   '@10205
L_10212:
IF NOT (V_0e04$ = "INITRAN") THEN GOTO L_10252   '@10212 DS:1fe2
CALL S_343be   '@10229
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
V_0dfc$ = "DESEDCAO"   '@10233 DS:1fd6
GOTO L_10693   '@10245
L_10252:
IF NOT (V_0dfc$ = "DESIMP") THEN GOTO L_10271   '@10252 DS:1fee
GOTO L_1065b   '@10269
L_10271:
IF NOT (V_0dfc$ = "DESEDCAO") THEN GOTO L_10290   '@10271 DS:1fd6
GOTO L_105be   '@10288
L_10290:
L_BP0c% = (V_180a$ <> "DESDIM")   '@10290 DS:1ff8
IF NOT ((V_180a$ <> "DESEDITA" AND L_BP0c%) <> 0) THEN GOTO L_102e9   '@102b5 DS:2002
V_0dfc$ = "DESENHO"   '@102ca DS:200e
GOTO L_10693   '@102dc
L_102e9:
V_1e06$ = V_17f2$   '@102e9
IF NOT (V_1e06$ <> "EGA") THEN GOTO L_10324   '@102fb DS:201a
IF NOT (V_1e06$ = "VGA") THEN GOTO L_103b2   '@10312 DS:2022
L_10324:
V_0e5c! = 640.0   '@10324 DS:202a
V_0e60! = 344.0   '@10335 DS:202e
V_0e64! = 35.0   '@10346 DS:2032
V_0e68! = 8.0   '@10357 DS:2036
V_191a% = 11   '@10368
V_1922% = 14   '@10373
V_1924% = 9   '@1037e
V_191c% = 12   '@10389
V_191e% = 15   '@10394
V_1920% = 10   '@1039f
GOTO L_104dd   '@103aa
L_103b2:
IF NOT (V_1e06$ = "HER") THEN GOTO L_10452   '@103b2 DS:203a
V_0e5c! = 720.0   '@103c4 DS:2042
V_0e60! = 344.0   '@103d5 DS:202e
V_0e64! = 35.0   '@103e6 DS:2032
V_0e68! = 9.0   '@103f7 DS:2046
V_191a% = 15   '@10408
V_1922% = 15   '@10413
V_1924% = 15   '@1041e
V_191c% = 15   '@10429
V_191e% = 15   '@10434
V_1920% = 15   '@1043f
GOTO L_104dd   '@1044a
L_10452:
V_0e5c! = 640.0   '@10452 DS:202a
V_0e60! = 200.0   '@10463 DS:204a
V_0e64! = 20.0   '@10474 DS:204e
V_0e68! = 8.0   '@10485 DS:2036
V_191a% = 15   '@10496
V_1922% = 15   '@104a1
V_1924% = 15   '@104ac
V_191c% = 15   '@104b7
V_191e% = 15   '@104c2
V_1920% = 15   '@104cd
L_104dd:
CALL S_30132   '@104dd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_180a$ = "DESDIM") THEN GOTO L_1057e   '@104e7 DS:1ff8
CALL S_40132   '@104fe
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
CALL S_343be   '@10508
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
CALL S_338ed   '@10512
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
FOR V_0e14! = 2.0 TO 14.0   '@1051c DS:2052,2056,205a
A_1c90$(RT_CINT%(FX##(V_0e14!))) = ""   '@1052a DS:1f70
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY no laco (B$EVCK)
NEXT V_0e14!   '@10550 DS:2056,205a
L_1057e:
IF NOT (V_184e$ = "S") THEN GOTO L_105b9   '@10588 DS:205e
V_0dfc$ = "DESEDCAO"   '@1059f DS:1fd6
GOTO L_10693   '@105b1
L_105b9:
L_105be:
L_BP0c% = (V_1846$ = "S")   '@105c3 DS:205e
IF NOT ((V_1852$ = "S" OR L_BP0c%) <> 0) THEN GOTO L_10656   '@105e8 DS:205e
V_1846$ = LCASE$(V_1846$)   '@105fd
CALL S_202b9   '@10615
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
V_1846$ = UCASE$(V_1846$)   '@1061f
V_0dfc$ = "DESIMP"   '@10637 DS:1fee
GOTO L_10693   '@10649
L_10656:
L_1065b:
CALL S_202b9   '@10660
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
V_0dfc$ = V_180a$   '@1066a
V_180a$ = "DESINIT"   '@1067c DS:2064
L_10693:
ON ERROR GOTO L_10711
RT_ONERR = &H10711   '@10698
V_0e30! = RT_FRE&("")   '@106a7 DS:1f70
L_BP0c% = (LEN(V_0dc8$) > 3)   '@106c1
CHDIR RT_ARQ$(RT_LEFT$((V_0dc8$), (LEN(V_0dc8$) + L_BP0c%)))   '@106e0
RT_CHAIN V_0dc8$ + V_0dfc$   '@106f4
L_10711:
RESUME L_10728   '@10716
L_10728:
BEEP   '@1072d
L_BP0c% = (V_0dc8$ = "A:\")   '@10737 DS:2070
IF NOT ((V_0dc8$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_107e9   '@1075c DS:2078
LOCATE 25, 1   '@10771
PRINT " Coloque o Disco "; V_0dfc$; " no Drive "; V_0dc8$; " ";   '@1078c DS:2080,2096,20a4
CALL MIXT_07f1_LimpaTeclado   '@107be
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
V_0e00$ = RT_INPUT$(1)   '@107c8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
L_107e9:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY no laco (B$EVCK)
GOTO L_10693   '@107e9
' ---- F_107f1 @0x107f1  (0107f1_F_107f1.lift.txt; evidence_id (assembly): ev_d72eea819a14fe7dab3737622f418b2348dfe9f06bbf84648e736968a0c4ea4d)
L_107f6:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_DESINIT
FOR V_1e0a! = 1.0 TO 10.0   '@107fb DS:2056,20aa
ON KEY(RT_CINT%(FX##(V_1e0a!))) GOSUB L_10a9b
RT_ONKEY RT_CINT%(FX##(V_1e0a!)), 1   '@10808
KEY(RT_CINT%(FX##(V_1e0a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e0a!)), 1   '@10822
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY no laco (B$EVCK)
NEXT V_1e0a!   '@10837 DS:2056,20aa
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@10860
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10888
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@108b0
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@108d8
FOR V_1e0a! = 15.0 TO 18.0   '@10900 DS:2056,20ae,20b2
ON KEY(RT_CINT%(FX##(V_1e0a!))) GOSUB L_10ac6
RT_ONKEY RT_CINT%(FX##(V_1e0a!)), 2   '@1090e
KEY(RT_CINT%(FX##(V_1e0a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e0a!)), 1   '@10928
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY no laco (B$EVCK)
NEXT V_1e0a!   '@1093d DS:2056,20b2
ON KEY(2) GOSUB L_10ac6
RT_ONKEY 2, 2   '@10966
KEY(2) ON
RT_KEYESTADO 2, 1   '@10979
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10987
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@109af
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@109d7
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@109ff
FOR V_1e0a! = 19.0 TO 22.0   '@10a26 DS:2056,20b6,20ba
ON KEY(RT_CINT%(FX##(V_1e0a!))) GOSUB L_10be0
RT_ONKEY RT_CINT%(FX##(V_1e0a!)), 3   '@10a34
KEY(RT_CINT%(FX##(V_1e0a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e0a!)), 1   '@10a4e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY no laco (B$EVCK)
NEXT V_1e0a!   '@10a63 DS:2056,20ba
RETURN   '@10a8c
L_10a9b:
BEEP   '@10aa0
GOSUB L_107f6   '@10aaa
RETURN   '@10ab7
L_10ac6:
RT_SCREEN 0   '@10acb
RT_VIEWPRINT 1, 25   '@10ae0
COLOR 7, 0, 0   '@10af2
RT_CLS 0   '@10b16
PRINT " Aguarde ..."   '@10b23 DS:20be
PRINT ""   '@10b31 DS:1f70
PRINT " Retorno ao Modulo Gerenciador"   '@10b3f DS:20ce
ON ERROR GOTO L_10b90
RT_ONERR = &H10b90   '@10b4d
RT_RUN RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7)) + "SISTRUT"   '@10b5c DS:20f0
L_10b90:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7))   '@10b95 DS:20fc
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@10bc3 DS:1f8e
RT_FIM   '@10bd1 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10be0:
BEEP   '@10be5
GOSUB L_107f6   '@10bef
RETURN L_101a7   '@10c06
' ---- F_10c09 @0x10c09  (010c09_F_10c09.lift.txt; evidence_id (assembly): ev_4efcb6276ea4c435603652b23ba8e97318dbb66813c8b89683db0e4c11f6fdf4)
L_10c0e:   ' entrada vinda de 010030_M_DESINIT
RESUME L_10c25   '@10c13
L_10c25:
ON ERROR GOTO L_10c0e
RT_ONERR = &H10c0e   '@10c2a
CALL S_2013c   '@10c39
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10a9b, L_10ac6, L_10be0   ' ON KEY pelo roteiro (entre comandos)
RT_FIM   ' @10c43 B$CENP (inicio/fim do modulo)
'RETRAD? @10c48 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
' ---- M_DESAUXIN @0x20030  (020030_M_DESAUXIN.lift.txt; evidence_id (assembly): ev_acb181017c314863b98aa1bc039fd1d19ad47d50062b782b96ddfdfd06141852)
' @20030 inicio do programa (B$?EVT)
GOTO L_202b1   '@20134
' ---- FUN_2000_02b1 @0x202b1  (0202b1_FUN_2000_02b1.lift.txt; evidence_id (assembly): ev_e74159c275fc451fff22d932411dfedb2fea38e3b5650eda285d6549773a63c0)
L_202b1:   ' entrada vinda de 020030_M_DESAUXIN
GOTO L_247be   '@202b1
' ---- RT_EA @0x247be  (0247be_RT_EA.lift.txt; evidence_id (assembly): ev_515784e087dc0b9323f27ce8d51a5d444a69ff3aa71b127f310adf5afc949c7a)
L_247be:   ' entrada vinda de 0202b1_FUN_2000_02b1
RT_FIM   ' @247be B$CENP (inicio/fim do modulo)
' ---- M_DESINI1 @0x30030  (030030_M_DESINI1.lift.txt; evidence_id (assembly): ev_b9e5da8a1397515c67663147be655bbea8ba669692ae0bdbe517413fa11c0a73)
' @30030 inicio do programa (B$?EVT)
GOTO L_338e5   '@3012a
' ---- FUN_3000_38e5 @0x338e5  (0338e5_FUN_3000_38e5.lift.txt; evidence_id (assembly): ev_efdf6f2f438d887add96fd89edd81a64aed7b039e8aaa48803f8a90659859923)
L_338e5:   ' entrada vinda de 030030_M_DESINI1
GOTO L_343b6   '@338e5
' ---- FUN_3000_43b6 @0x343b6  (0343b6_FUN_3000_43b6.lift.txt; evidence_id (assembly): ev_fa306219d4363ec912a664c137988c5dc814c937ba30122ba9657c1b8ebf98d6)
L_343b6:   ' entrada vinda de 0338e5_FUN_3000_38e5
GOTO L_355d5   '@343b6
' ---- RT_EA @0x355d5  (0355d5_RT_EA.lift.txt; evidence_id (assembly): ev_438e1bab57ac45594d03b1953810e157d9eaa970a5d303c4a728d790f720666e)
L_355d5:   ' entrada vinda de 0343b6_FUN_3000_43b6
RT_FIM   ' @355d5 B$CENP (inicio/fim do modulo)
' ---- M_DESINI2 @0x40030  (040030_M_DESINI2.lift.txt; evidence_id (assembly): ev_26317d777536f623b5e329ca2f419b335da3fd4c6b7ead1c763671b624cd5264)
' @40030 inicio do programa (B$?EVT)
GOTO L_4fafd   '@4012a
' ---- RT_EA @0x4fafd  (04fafd_RT_EA.lift.txt; evidence_id (assembly): ev_4657308b173a18471ed881d7542c6658c05fac9e604e08b0e1dfb84445b50f2f)
L_4fafd:   ' entrada vinda de 040030_M_DESINI2
RT_FIM   ' @4fafd B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Registro de 70 bytes em DS:1F1C (GET/PUT #): campos pelo endereco das variaveis.
SUB RT_REG_1F1C_LE (f AS INTEGER, r AS LONG)
    GET #f, r, RG_1F1C
    V_1f1c$ = MID$(RG_1F1C, 1, 10)
    V_1f26! = CVS(MID$(RG_1F1C, 11, 4))
    V_1f2a! = CVS(MID$(RG_1F1C, 15, 4))
    V_1f2e! = CVS(MID$(RG_1F1C, 19, 4))
    V_1f32! = CVS(MID$(RG_1F1C, 23, 4))
    V_1f36! = CVS(MID$(RG_1F1C, 27, 4))
    V_1f3a! = CVS(MID$(RG_1F1C, 31, 4))
    V_1f3e! = CVS(MID$(RG_1F1C, 35, 4))
    V_1f42! = CVS(MID$(RG_1F1C, 39, 4))
    V_1f46! = CVS(MID$(RG_1F1C, 43, 4))
    V_1f4a! = CVS(MID$(RG_1F1C, 47, 4))
    V_1f4e! = CVS(MID$(RG_1F1C, 51, 4))
    V_1f52! = CVS(MID$(RG_1F1C, 55, 4))
    V_1f56! = CVS(MID$(RG_1F1C, 59, 4))
    V_1f5a! = CVS(MID$(RG_1F1C, 63, 4))
    V_1f5e! = CVS(MID$(RG_1F1C, 67, 4))
END SUB
SUB RT_REG_1F1C_GRAVA (f AS INTEGER, r AS LONG)
    MID$(RG_1F1C, 1, 10) = RT_FIX$(V_1f1c$, 10)
    MID$(RG_1F1C, 11, 4) = MKS$(V_1f26!)
    MID$(RG_1F1C, 15, 4) = MKS$(V_1f2a!)
    MID$(RG_1F1C, 19, 4) = MKS$(V_1f2e!)
    MID$(RG_1F1C, 23, 4) = MKS$(V_1f32!)
    MID$(RG_1F1C, 27, 4) = MKS$(V_1f36!)
    MID$(RG_1F1C, 31, 4) = MKS$(V_1f3a!)
    MID$(RG_1F1C, 35, 4) = MKS$(V_1f3e!)
    MID$(RG_1F1C, 39, 4) = MKS$(V_1f42!)
    MID$(RG_1F1C, 43, 4) = MKS$(V_1f46!)
    MID$(RG_1F1C, 47, 4) = MKS$(V_1f4a!)
    MID$(RG_1F1C, 51, 4) = MKS$(V_1f4e!)
    MID$(RG_1F1C, 55, 4) = MKS$(V_1f52!)
    MID$(RG_1F1C, 59, 4) = MKS$(V_1f56!)
    MID$(RG_1F1C, 63, 4) = MKS$(V_1f5a!)
    MID$(RG_1F1C, 67, 4) = MKS$(V_1f5e!)
    PUT #f, r, RG_1F1C
END SUB

' Rotina em assembly do EXE em 0x60f20 (chamada por CALL SUB_60f20 no lift).
' Versao C; DS do original: inicio DS:2576, CR LF DS:2570, fim DS:2573, margem em [DS:2845], ESC L em [DS:256E].
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
    V_1e06$ = ""
    V_1e0a! = 0
    V_1f1c$ = ""
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
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_10a9b: BEEP; GOSUB L_107f6; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_10ac6: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10be0: sai da SUB (BEEP; GOSUB L_107f6; RETURN L_101a7)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H10711: ON ERROR GOTO L_10711
        CASE &H10b90: ON ERROR GOTO L_10b90
        CASE &H10c0e: ON ERROR GOTO L_10c0e
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_2013c   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x2013c)
    ' ---- FUN_2000_013c @0x2013c  (02013c_FUN_2000_013c.lift.txt; evidence_id (assembly): ev_51d3626910b52c983f368c322d971fe54d3ea90ea104cdd22dcb63e04699ab94)
    BEEP   '@20144
    BEEP   '@2014e
    BEEP   '@20158
    RT_SCREEN 0   '@20162
    RT_VIEWPRINT 1, 25   '@20177
    RT_CLOSE   '@20189 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_17fe!)), RT_CINT%(4.0 * FX##(V_1802!)), RT_CINT%(4.0 * FX##(V_1802!))   '@20196 DS:2120
    RT_CLS 0   '@201db
    LOCATE 10, 1   '@201e8
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@20203 DS:2124,2128
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@20223 DS:2124,2142
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@20243 DS:2124,216e
L_20268:
    CALL MIXT_07f1_LimpaTeclado   '@2026d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@20277
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@20293
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20268   '@2029d
END SUB

SUB S_202b9   ' entrada de SUB/FUNCTION (B$ENRA, locais 296 bytes) (0x202b9)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP18%
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
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72$
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
    DIM L_BPa2$
    DIM L_BPa6$
    DIM L_BPaa!
    DIM L_BPae!
    DIM L_BPb2$
    DIM L_BPb6$
    DIM L_BPba!
    DIM L_BPbe!
    DIM L_BPc2$
    DIM L_BPc6$
    DIM L_BPca!
    DIM L_BPce!
    DIM L_BPd2$
    DIM L_BPd6$
    DIM L_BPda!
    DIM L_BPde!
    DIM L_BPe2$
    DIM L_BPe6$
    DIM L_BPea!
    DIM L_BPee!
    DIM L_BPf2$
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe$
    REDIM L_BP2a%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_02b9 @0x202b9  (0202b9_FUN_2000_02b9.lift.txt; evidence_id (assembly): ev_f149d8dd5795198f1ad3f28c917542643af565642b968501bd98856066ede1b7)
    REDIM L_BP2a%(0 TO 10)   '@202d0
    IF NOT (V_1846$ <> "S") THEN GOTO L_2030c   '@202ed DS:2194
    GOTO L_22fe8   '@20304
L_2030c:
    RT_VIEW 1, (0), (0), (RT_CINT%(FX##(V_0e5c!) - 1.0)), (RT_CINT%(FX##(V_0e60!) - 1.0)), (-1), (-1)   '@20316 DS:219a (B$VIEW decodificado)
    RT_WINDOW 1, (0), (0), (639), (199)   '@2034a DS:219e,21a0,21a2,21a4,21a6,21a8 (B$WIND decodificado)
    IF NOT (V_0e30! > 319.0 AND V_0e34! = 0.0) THEN GOTO L_203be   '@20378 DS:219e,21aa
    GOTO L_20453   '@203b6
L_203be:
    V_0e34! = 0.0   '@203be DS:219e
    IF NOT (V_0e30! = 320.0 OR V_0e30! = 0.0) THEN GOTO L_20426   '@203cf DS:219e,21ae
    V_0e30! = 480.0   '@2040d DS:21b2
    GOTO L_20453   '@2041e
L_20426:
    RT_ROTINA_0F20   '@20426 (rotina em assembly ligada ao EXE (SUB_60f20); gerada no fim do programa)
    V_0e30! = 320.0   '@20430 DS:21ae
    RT_CLS 0   '@20441
L_20453:
    L_BP18% = 0   '@20458
    IF NOT (V_186a! = 0.0) THEN GOTO L_20485   '@20462 DS:219e
    GOTO L_2054d   '@2047d
L_20485:
    L_BP2e! = V_186a!   '@20485
    FOR V_0e14! = 1.0 TO L_BP2e!   '@20496 DS:21b6
    L_BP32! = FX##(L_BP18%) * 1.0   '@2049e DS:21b6
    L_BP36! = A_1c06!(RT_CINT%(FX##(V_0e14!)), 6)   '@204b7
    CALL MIXT_082a_Maior(L_BP32!, L_BP36!, L_BP3a!)   '@204db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e14!)), 6) = L_BP36!   '@204ed
    L_BP18% = RT_CINT%(FX##(L_BP3a!))   '@20512
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@2051d DS:21b6
L_2054d:
    L_BP16! = 1.0   '@20552 DS:21b6
    L_BP3e! = FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_186e! + V_1862! + L_BP18%   '@20562
    FOR V_0e14! = 1.0 TO L_BP3e!   '@20597 DS:21b6
    IF NOT (L_BP16! > 1.0) THEN GOTO L_205c0   '@2059e DS:21b6
    GOTO L_209fd   '@205b8
L_205c0:
    IF NOT (V_0e30! < 320.0) THEN GOTO L_205e3   '@205c0 DS:21ae
    GOTO L_206ac   '@205db
L_205e3:
    L_BP42! = FX##(L_BP16!) * 8.0   '@205e3 DS:21ba
    L_BP46$ = " " + V_18ea$ + "  #   Q  UNI TOTAL"   '@205f7 DS:21be,21c4
    L_BP4a$ = "CGA"   '@20618 DS:21da
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP42!, L_BP46$, L_BP4a$)   '@20625
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2063a libera strings locais (L_BP46)
    ' @20643 libera strings locais (L_BP4a)
    RT_LINE V_0e30!, 7.0, RT_SNG!(FX##(V_0e30!) + 159.0), 7.0, 9, V_191a%, 0   '@2064c DS:21e2,21e6
    L_BP16! = 2.0   '@20697 DS:21ea
L_206ac:
    IF NOT (V_0e30! < 320.0) THEN GOTO L_20736   '@206b1 DS:21ae
    L_BP4e! = 168.0   '@206cc DS:21ee
    L_BP52! = (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_186e! + V_1862! + (FX##(L_BP18%) - V_0e14!)) * 8.0 + 8.0   '@206dd DS:21ba
    CALL MIXT_0877_Menor(L_BP4e!, L_BP52!, L_BP56!)   '@2071a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BP56!   '@2072c
L_20736:
    IF NOT (V_0e30! > 319.0) THEN GOTO L_207bb   '@20736 DS:21aa
    L_BP5a! = 200.0   '@20751 DS:21f2
    L_BP5e! = (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_186e! + V_1862! + (FX##(L_BP18%) - V_0e14!)) * 8.0 + 16.0   '@20762 DS:21ba,21f6
    CALL MIXT_0877_Menor(L_BP5a!, L_BP5e!, L_BP62!)   '@2079f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e48! = L_BP62!   '@207b1
L_207bb:
    RT_LINE V_0e30!, 0.0, V_0e30!, V_0e48!, 9, V_191a%, 0   '@207bb DS:219e
    RT_LINE RT_SNG!(FX##(V_0e30!) + 17.0), 0.0, RT_SNG!(FX##(V_0e30!) + 17.0), V_0e48!, 9, V_191a%, 0   '@207fa DS:219e,21fa
    RT_LINE RT_SNG!(FX##(V_0e30!) + 57.0), 0.0, RT_SNG!(FX##(V_0e30!) + 57.0), V_0e48!, 9, V_191a%, 0   '@20851 DS:219e,21fe
    RT_LINE RT_SNG!(FX##(V_0e30!) + 81.0), 0.0, RT_SNG!(FX##(V_0e30!) + 81.0), V_0e48!, 9, V_191a%, 0   '@208a8 DS:219e,2202
    RT_LINE RT_SNG!(FX##(V_0e30!) + 112.0), 0.0, RT_SNG!(FX##(V_0e30!) + 112.0), V_0e48!, 9, V_191a%, 0   '@208ff DS:219e,2206
    RT_LINE RT_SNG!(FX##(V_0e30!) + 159.0), 0.0, RT_SNG!(FX##(V_0e30!) + 159.0), V_0e48!, 9, V_191a%, 0   '@20956 DS:219e,21e6
    RT_LINE V_0e30!, V_0e48!, RT_SNG!(FX##(V_0e30!) + 159.0), V_0e48!, 9, V_191a%, 0   '@209ad DS:21e6
L_209fd:
    GOSUB L_20c2c   '@20a02
    L_BP66! = 199.0   '@20a0f DS:21a6
    L_BP6a! = FX##(L_BP16!) * 8.0   '@20a20 DS:21ba
    CALL MIXT_0877_Menor(L_BP66!, L_BP6a!, L_BP6e!)   '@20a2e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP72$ = "CGA"   '@20a3f DS:21da
    CALL MIXT_08c4_TextoGrafico(V_0e30!, L_BP6e!, V_0dfc$, L_BP72$)   '@20a4c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @20a61 libera strings locais (L_BP72)
    IF NOT (V_0e30! > 319.0 AND FX##(V_0e48!) / 8.0 = FX##(L_BP16!)) THEN GOTO L_20adf   '@20a6a DS:21aa,21ba
    V_0e30! = FX##(V_0e30!) - 320.0   '@20aac DS:220a
    L_BP16! = 1.0   '@20ac2 DS:21b6
    GOTO L_20bef   '@20ad2
L_20adf:
    IF NOT (V_0e30! = 0.0 AND FX##(V_0e48!) / 8.0 = FX##(L_BP16!)) THEN GOTO L_20b4f   '@20adf DS:219e,21ba
    V_0e30! = 480.0   '@20b21 DS:21b2
    L_BP16! = 1.0   '@20b32 DS:21b6
    GOTO L_20bef   '@20b42
L_20b4f:
    IF NOT (V_0e30! = 160.0 AND FX##(V_0e48!) / 8.0 = FX##(L_BP16!)) THEN GOTO L_20bd6   '@20b4f DS:21ba,220e
    RT_ROTINA_0F20   '@20b91 (rotina em assembly ligada ao EXE (SUB_60f20); gerada no fim do programa)
    V_0e30! = 320.0   '@20b9b DS:21ae
    L_BP16! = 1.0   '@20bac DS:21b6
    RT_CLS 0   '@20bbc
    GOTO L_20bef   '@20bc9
L_20bd6:
    L_BP16! = FX##(L_BP16!) + 1.0   '@20bd6 DS:21b6
L_20bef:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@20bf4 DS:21b6
    GOTO L_22fe8   '@20c1f
    ' ---- F_20c27 @0x20c27  (020c27_F_20c27.lift.txt; evidence_id (assembly): ev_36d8ec53c77cc466cb4a06a7dcf9e95d9d18ba82229a1ade50140dd1a21c1b12)
L_20c2c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0202b9_FUN_2000_02b9, 022fe8_FUN_2000_2fe8
    IF NOT (V_0e14! = 1.0) THEN GOTO L_20c77   '@20c31 DS:21b6
    REDIM A_1cec!(-32768 TO -32768)   '@20c4c
    REDIM A_1cec!(0 TO 20)   '@20c5a
L_20c77:
    V_0dfc$ = RT_STRINGC$((21), (32))   '@20c77
    IF NOT (V_0e14! <= V_185e!) THEN GOTO L_20cb6   '@20c93
    GOTO L_210e7   '@20cae
L_20cb6:
    IF NOT (FX##(V_185e!) + V_1872! >= FX##(V_0e14!)) THEN GOTO L_20cde   '@20cb6
    GOTO L_21563   '@20cd6
L_20cde:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! >= FX##(V_0e14!)) THEN GOTO L_20d0b   '@20cde
    GOTO L_21884   '@20d03
L_20d0b:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! >= FX##(V_0e14!)) THEN GOTO L_20d3d   '@20d0b
    GOTO L_21d0a   '@20d35
L_20d3d:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_1862! >= FX##(V_0e14!)) THEN GOTO L_20d74   '@20d3d
    GOTO L_224c5   '@20d6c
L_20d74:
    IF NOT (FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_1862! + V_186e! >= FX##(V_0e14!)) THEN GOTO L_20db0   '@20d74
    GOTO L_22035   '@20da8
L_20db0:
    GOTO L_227ca   '@20db0
L_20dbd:
    IF NOT (V_0e44! = V_0eee!) THEN GOTO L_20e11   '@20dc2
    A_1cec!(5) = FX##(A_1cec!(5)) + V_0e20!   '@20ddd
L_20e11:
    IF NOT (V_0e44! = V_0ef2!) THEN GOTO L_20e60   '@20e11
    A_1cec!(6) = FX##(A_1cec!(6)) + V_0e20!   '@20e2c
L_20e60:
    IF NOT (V_0e44! = V_0ef6!) THEN GOTO L_20eaf   '@20e60
    A_1cec!(7) = FX##(A_1cec!(7)) + V_0e20!   '@20e7b
L_20eaf:
    IF NOT (V_0e44! = V_0efa!) THEN GOTO L_20efe   '@20eaf
    A_1cec!(8) = FX##(A_1cec!(8)) + V_0e20!   '@20eca
L_20efe:
    IF NOT (V_0e44! = V_0efe!) THEN GOTO L_20f4d   '@20efe
    A_1cec!(9) = FX##(A_1cec!(9)) + V_0e20!   '@20f19
L_20f4d:
    IF NOT (V_0e44! = V_0f02!) THEN GOTO L_20f9c   '@20f4d
    A_1cec!(10) = FX##(A_1cec!(10)) + V_0e20!   '@20f68
L_20f9c:
    IF NOT (V_0e44! = V_0f06!) THEN GOTO L_20feb   '@20f9c
    A_1cec!(11) = FX##(A_1cec!(11)) + V_0e20!   '@20fb7
L_20feb:
    IF NOT (V_0e44! = V_0f0a!) THEN GOTO L_2103a   '@20feb
    A_1cec!(12) = FX##(A_1cec!(12)) + V_0e20!   '@21006
L_2103a:
    IF NOT (V_0e44! = V_0f0e!) THEN GOTO L_21089   '@2103a
    A_1cec!(13) = FX##(A_1cec!(13)) + V_0e20!   '@21055
L_21089:
    IF NOT (V_0e44! = V_0f12!) THEN GOTO L_210d8   '@21089
    A_1cec!(14) = FX##(A_1cec!(14)) + V_0e20!   '@210a4
L_210d8:
    RETURN   '@210d8
L_210e7:
    V_0e44! = V_0e14!   '@210ec
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e44!)), 2) + A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0) + A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1)   '@210fd
    IF NOT (V_190e$ = "S") THEN GOTO L_212b7   '@21181 DS:2194
    V_0e20! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e44!)), 1) > 0.0) + (A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b4e!(RT_CINT%(FX##(V_0e44!)), 0) > 0.0)) + FX##(V_0e20!)   '@21198 DS:219e,2212
L_212b7:
    V_0e20! = INT(FX##(V_0e20!))   '@212b7
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@212cf DS:2216
    RT_MIDCHK ((A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5), 0: MID$(V_0dfc$, (A_1af2!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5) = RT_MID2$((STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@2131c DS:2216
    RT_MIDCHK ((A_1af2!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10), 0: MID$(V_0dfc$, (A_1af2!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10) = RT_MID2$((STR$(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@2139d DS:2216
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@2141c
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))), (2))   '@21467
    V_0e20! = FX##(A_1af2!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!   '@214fc
    V_0e44! = A_1af2!(RT_CINT%(FX##(V_0e44!)), 1)   '@2152b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@21556
L_21563:
    V_0e44! = FX##(V_0e14!) - V_185e!   '@21568
    V_0e20! = INT((FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1bd8!(RT_CINT%(FX##(V_0e44!)), 2)) * 2.0 + A_1bd8!(RT_CINT%(FX##(V_0e44!)), 5))   '@2157e DS:21ea
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@215f0 DS:2216
    RT_MIDCHK ((A_1bd8!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5), 0: MID$(V_0dfc$, (A_1bd8!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5) = RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@2163d DS:2216
    RT_MIDCHK ((A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10), 0: MID$(V_0dfc$, (A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10) = RT_MID2$((STR$(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@216be DS:2216
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@2173d
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))), (2))   '@21788
    V_0e20! = FX##(A_1bd8!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!   '@2181d
    V_0e44! = A_1bd8!(RT_CINT%(FX##(V_0e44!)), 1)   '@2184c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@21877
L_21884:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872!   '@21889
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e44!)), 2) + A_1b20!(RT_CINT%(FX##(V_0e44!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e44!)), 1)   '@218a4
    IF NOT (V_190e$ = "S") THEN GOTO L_21a5e   '@21928 DS:2194
    V_0e20! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)) * V_18ca! * 0.042920000851154327392578125##) * ((A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e44!)), 1) > 0.0) + (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > V_0efe! AND A_1b20!(RT_CINT%(FX##(V_0e44!)), 0) > 0.0)) + FX##(V_0e20!)   '@2193f DS:219e,2212
L_21a5e:
    V_0e20! = INT(FX##(V_0e20!))   '@21a5e
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@21a76 DS:2216
    RT_MIDCHK ((A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5), 0: MID$(V_0dfc$, (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5) = RT_MID2$((STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@21ac3 DS:2216
    RT_MIDCHK ((A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10), 0: MID$(V_0dfc$, (A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10) = RT_MID2$((STR$(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@21b44 DS:2216
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@21bc3
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))), (2))   '@21c0e
    V_0e20! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!   '@21ca3
    V_0e44! = A_1ac4!(RT_CINT%(FX##(V_0e44!)), 1)   '@21cd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@21cfd
L_21d0a:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866!   '@21d0f
    V_0e20! = INT((FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1baa!(RT_CINT%(FX##(V_0e44!)), 2)) * 2.0 + A_1baa!(RT_CINT%(FX##(V_0e44!)), 5))   '@21d2f DS:21ea
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@21da1 DS:2216
    RT_MIDCHK ((A_1baa!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5), 0: MID$(V_0dfc$, (A_1baa!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5) = RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@21dee DS:2216
    RT_MIDCHK ((A_1baa!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10), 0: MID$(V_0dfc$, (A_1baa!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10) = RT_MID2$((STR$(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@21e6f DS:2216
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@21eee
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))), (2))   '@21f39
    V_0e20! = FX##(A_1baa!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!   '@21fce
    V_0e44! = A_1baa!(RT_CINT%(FX##(V_0e44!)), 1)   '@21ffd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@22028
L_22035:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876! - V_1862!   '@2203a
    L_BP0e! = 0.0   '@22064 DS:219e
    FOR V_0e40! = 0.0 TO 6.0   '@22074 DS:219e,21b6,221a
    L_BP0e! = FX##(L_BP0e!) - (A_1a96%(RT_CINT%(FX##(V_0e40!))) > 0)   '@22082
    IF NOT (L_BP0e! = V_0e44!) THEN GOTO L_220de   '@220bc
    GOTO L_2210a   '@220d6
L_220de:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@220de DS:21b6,221a
L_2210a:
    L_BP0e! = -(V_0e40! = 0.0) * FX##(V_0eee!) - FX##(V_0e40! = 1.0) * V_0ef2! - FX##(V_0e40! = 2.0) * V_0ef6! - FX##(V_0e40! = 3.0) * V_0efa! - FX##(V_0e40! = 4.0) * V_0efe! - FX##(V_0e40! = 5.0) * V_0f02! - FX##(V_0e40! = 6.0) * V_0f06!   '@2210a DS:2120,219e,21b6,21ea,221a,221e,2222
    V_0e20! = 0.0   '@22210 DS:219e
    L_BP76! = FX##(V_0ddc!) + V_0de4!   '@22221
    FOR V_0e44! = 1.0 - FX##(V_0de0!) TO L_BP76!   '@22237 DS:21b6
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e44!)), 1) = L_BP0e!) THEN GOTO L_222f1   '@22244
    V_0e20! = FX##(RT_CINT%(FX##(A_1c34!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1c34!(RT_CINT%(FX##(V_0e44!)), 2))) * A_1c34!(RT_CINT%(FX##(V_0e44!)), 0) * 2.0 + V_0e20!   '@22278 DS:21ea
L_222f1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e44!   '@222f1 DS:21b6
    V_0e44! = -((V_18e2! > 100.0) * (FX##(V_18e2!) - 100.0) * L_BP0e! / 10.0 + FX##(V_18e2! < 100.0) * V_18e2!)   '@2231c DS:2226,222a,222e
    IF NOT (V_0e20! > 1000.0) THEN GOTO L_223c6   '@22381 DS:2232
    V_0e20! = FX##(RT_CINT%(FX##(V_0e20!) * V_0e44! / 1000.0)) + V_0e20!   '@2239c DS:2232
L_223c6:
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@223c6 DS:2216
    RT_MIDCHK ((L_BP0e! > 9.0) + 5), 0: MID$(V_0dfc$, (L_BP0e! > 9.0) + 5) = RT_MID2$((STR$(L_BP0e!)), (2))   '@22413 DS:2216
    RT_MIDCHK (22 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 22 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@2245d
    V_0e44! = L_BP0e!   '@224a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@224b8
L_224c5:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876!   '@224ca
    V_0e20! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 3)) - A_1b7c!(RT_CINT%(FX##(V_0e44!)), 2)   '@224ef
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@22536 DS:2216
    RT_MIDCHK ((A_1b7c!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5), 0: MID$(V_0dfc$, (A_1b7c!(RT_CINT%(FX##(V_0e44!)), 1) > 9.0) + 5) = RT_MID2$((STR$(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 1))), (2))   '@22583 DS:2216
    RT_MIDCHK ((A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10), 0: MID$(V_0dfc$, (A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0) > 9.0) + 10) = RT_MID2$((STR$(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0))), (2))   '@22604 DS:2216
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@22683
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!))), (2))   '@226ce
    V_0e20! = FX##(A_1b7c!(RT_CINT%(FX##(V_0e44!)), 0)) * V_0e20!   '@22763
    V_0e44! = A_1b7c!(RT_CINT%(FX##(V_0e44!)), 1)   '@22792
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@227bd
L_227ca:
    V_0e44! = FX##(V_0e14!) - V_185e! - V_1872! - V_1866! - V_1876! - V_1862! - V_186e!   '@227cf
    L_BP0e! = 0.0   '@227fe DS:219e
    L_BP7a! = V_186a!   '@2280e
    FOR V_0e40! = 1.0 TO L_BP7a!   '@2281f DS:21b6
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e40!)), 6) <> V_0e44!) THEN GOTO L_22863   '@22826
    GOTO L_22ddf   '@2285b
L_22863:
    L_BP7e! = FX##(V_0ddc!) + V_0de4!   '@22863
    FOR L_BP12! = 1.0 - FX##(V_0de0!) TO L_BP7e!   '@22879 DS:21b6
    IF NOT ((FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) / 2.0 < FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 1)) AND (FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) + A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) / 2.0 > FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 0)) OR (FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) < FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) > FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 0)) - 1.0 OR FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) < FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 1)) + 1.0 AND FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) > FX##(A_1a0c!(RT_CINT%(FX##(L_BP12!)), 0)) - 1.0)) THEN GOTO L_22ac9   '@22886 DS:219a,21b6,21ea
    GOTO L_22af1   '@22ac1
L_22ac9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP12!   '@22ac9 DS:21b6
L_22af1:
    V_0e20! = A_1232!(RT_CINT%(FX##(L_BP12!)), 1) - 2.0 * FX##(V_0eaa!) - (A_1232!(RT_CINT%(FX##(L_BP12!)), 0) - 2.0 * FX##(V_0eaa!)) * ((A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 1.0) + FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 2.0) * 2.0 / 3.0 + FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) = 3.0) * 3.0 / 5.0)   '@22af1 DS:21b6,21ea,221e,2222
    L_BP12! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@22c14
    L_BP12! = -((L_BP12! = V_0f02!) * 5 + ((L_BP12! = V_0efe!) * 4 + ((L_BP12! = V_0efa!) * 3 + ((L_BP12! = V_0ef6!) * 2 + (L_BP12! = V_0ef2!)))))   '@22c3b
    V_0e20! = INT(FX##(V_0e20!) * 2.0) + A_1c62%(RT_CINT%(FX##(L_BP12!)), 4)   '@22cdb DS:21ea
    L_BP0e! = (INT((FX##(A_1c06!(RT_CINT%(FX##(V_0e40!)), 1)) - A_1c06!(RT_CINT%(FX##(V_0e40!)), 0)) / A_1c06!(RT_CINT%(FX##(V_0e40!)), 3)) + 1.0) * A_1c06!(RT_CINT%(FX##(V_0e40!)), 4) + L_BP0e!   '@22d1d DS:21b6
    L_BP12! = A_1c06!(RT_CINT%(FX##(V_0e40!)), 2)   '@22db3
L_22ddf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@22de4 DS:21b6
    RT_MIDCHK ((V_0e14! > 9.0) + 2), 0: MID$(V_0dfc$, (V_0e14! > 9.0) + 2) = RT_MID2$((STR$(V_0e14!)), (2))   '@22e0f DS:2216
    RT_MIDCHK ((L_BP12! > 9.0) + 5), 0: MID$(V_0dfc$, (L_BP12! > 9.0) + 5) = RT_MID2$((STR$(L_BP12!)), (2))   '@22e5c DS:2216
    RT_MIDCHK ((L_BP0e! > 99.0) + (L_BP0e! > 9.0) + 10), 0: MID$(V_0dfc$, (L_BP0e! > 99.0) + (L_BP0e! > 9.0) + 10) = RT_MID2$((STR$(L_BP0e!)), (2))   '@22ea6 DS:2216,2236
    RT_MIDCHK (16 - LEN(STR$(V_0e20!))), 0: MID$(V_0dfc$, 16 - LEN(STR$(V_0e20!))) = RT_MID2$((STR$(V_0e20!)), (2))   '@22f0a
    RT_MIDCHK (22 - LEN(STR$(RT_SNG!(FX##(L_BP0e!) * V_0e20!)))), 0: MID$(V_0dfc$, 22 - LEN(STR$(RT_SNG!(FX##(L_BP0e!) * V_0e20!)))) = RT_MID2$((STR$(RT_SNG!(FX##(L_BP0e!) * V_0e20!))), (2))   '@22f55
    V_0e20! = FX##(L_BP0e!) * V_0e20!   '@22fb6
    V_0e44! = L_BP12!   '@22fcb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20dbd   '@22fdb
    ' ---- FUN_2000_2fe8 @0x22fe8  (022fe8_FUN_2000_2fe8.lift.txt; evidence_id (assembly): ev_3db36a205afb200bb0796efc59ff4f9e77715143abe1b2c44a1850f4736b79f5)
L_22fe8:   ' entrada vinda de 0202b9_FUN_2000_02b9
    IF NOT (V_1846$ = "S") THEN GOTO L_2300c   '@22fed DS:2194
    GOTO L_23187   '@23004
L_2300c:
    L_BP18% = 0   '@2300c
    IF NOT (V_186a! = 0.0) THEN GOTO L_23039   '@23016 DS:219e
    GOTO L_23109   '@23031
L_23039:
    L_BP82! = V_186a!   '@23039
    FOR V_0e14! = 1.0 TO L_BP82!   '@2304b DS:21b6
    L_BP86! = FX##(L_BP18%) * 1.0   '@23052 DS:21b6
    L_BP8a! = A_1c06!(RT_CINT%(FX##(V_0e14!)), 6)   '@2306c
    CALL MIXT_082a_Maior(L_BP86!, L_BP8a!, L_BP8e!)   '@23091
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c06!(RT_CINT%(FX##(V_0e14!)), 6) = L_BP8a!   '@230a6
    L_BP18% = RT_CINT%(FX##(L_BP8e!))   '@230cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@230d8 DS:21b6
L_23109:
    L_BP92! = FX##(V_185e!) + V_1872! + V_1866! + V_1876! + V_186e! + V_1862! + L_BP18%   '@2310e
    FOR V_0e14! = 1.0 TO L_BP92!   '@23144 DS:21b6
    GOSUB L_20c2c   '@2314c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@23159 DS:21b6
L_23187:
    A_1cec!(0) = A_1cbe%(RT_CINT%(FX##(V_0e58!)))   '@2318c
    L_BP96! = FX##(V_0ddc!) + V_0de4!   '@231c5
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP96!   '@231dc DS:21b6
    A_1cec!(1) = FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0)) * A_1232!(RT_CINT%(FX##(V_0e14!)), 1) * (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) / 10000.0 + A_1cec!(1)   '@231e8 DS:223a
    A_1cec!(2) = (FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * 2.0 + (FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1a3a%(RT_CINT%(FX##(V_0e14!)), 1) - A_1a3a%(RT_CINT%(FX##(V_0e14!)), 3))) * (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) / 100.0 + A_1cec!(2)   '@23290 DS:21ea,2226
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@23392 DS:21b6
    A_1cec!(1) = INT(FX##(A_1cec!(1)))   '@233be
    A_1cec!(2) = INT(FX##(A_1cec!(2)))   '@233ee
    A_1cec!(3) = V_0eba!   '@23424
    A_1cec!(4) = V_0ebe!   '@23444
    L_BP2a%(0) = RT_CINT%(FX##(A_1cec!(5)) * A_1488!(0) / 100.0)   '@23464 DS:2226
    L_BP2a%(1) = RT_CINT%(FX##(A_1cec!(6)) * A_1488!(1) / 100.0)   '@234b0 DS:2226
    L_BP2a%(2) = RT_CINT%(FX##(A_1cec!(7)) * A_1488!(2) / 100.0)   '@234f5 DS:2226
    L_BP2a%(3) = RT_CINT%(FX##(A_1cec!(8)) * A_1488!(3) / 100.0)   '@23543 DS:2226
    L_BP2a%(4) = RT_CINT%(FX##(A_1cec!(9)) * A_1488!(4) / 100.0)   '@23591 DS:2226
    L_BP2a%(5) = RT_CINT%(FX##(A_1cec!(10)) * A_1488!(5) / 100.0)   '@235df DS:2226
    L_BP2a%(6) = RT_CINT%(FX##(A_1cec!(11)) * A_1488!(6) / 100.0)   '@2362d DS:2226
    L_BP2a%(7) = RT_CINT%(FX##(A_1cec!(12)) * A_1488!(7) / 100.0)   '@2367b DS:2226
    L_BP2a%(8) = RT_CINT%(FX##(A_1cec!(13)) * A_1488!(8) / 100.0)   '@236c9 DS:2226
    L_BP2a%(9) = RT_CINT%(FX##(A_1cec!(14)) * A_1488!(9) / 100.0)   '@23717 DS:2226
    IF NOT (V_1846$ <> "S") THEN GOTO L_23784   '@23765 DS:2194
    GOTO L_24519   '@2377c
L_23784:
    L_BP9a! = FX##(V_0e30!) + 4.0   '@23784 DS:2120
    L_BP9e! = 9.0   '@2379b DS:2216
    L_BPa2$ = "COBRIMENTO" + STR$(V_0eaa!) + " CM"   '@237a6 DS:223e,224c
    L_BPa6$ = "CGA"   '@237d2 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BP9a!, L_BP9e!, L_BPa2$, L_BPa6$)   '@237e0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @237f9 libera strings locais (L_BPa2)
    ' @23803 libera strings locais (L_BPa6)
    L_BPaa! = FX##(V_0e30!) + 4.0   '@2380d DS:2120
    L_BPae! = 18.0   '@23824 DS:2254
    L_BPb2$ = "Fck" + STR$(V_0eba!) + " " + V_0eca$   '@2382f DS:21be,2258
    L_BPb6$ = "CGA"   '@23865 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPaa!, L_BPae!, L_BPb2$, L_BPb6$)   '@23873
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2388c libera strings locais (L_BPb2)
    ' @23896 libera strings locais (L_BPb6)
    L_BPba! = FX##(V_0e30!) + 4.0   '@238a0 DS:2120
    L_BPbe! = 27.0   '@238b7 DS:2260
    L_BPc2$ = "VOL. CONCR" + STR$(RT_SNG!(FX##(A_1cec!(1)) / 100.0)) + "m3"   '@238c2 DS:2226,2264,2272
    L_BPc6$ = "CGA"   '@23906 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPba!, L_BPbe!, L_BPc2$, L_BPc6$)   '@23914
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2392d libera strings locais (L_BPc2)
    ' @23937 libera strings locais (L_BPc6)
    L_BPca! = FX##(V_0e30!) + 4.0   '@23941 DS:2120
    L_BPce! = 36.0   '@23958 DS:2278
    L_BPd2$ = "AREA FORMA" + STR$(RT_SNG!(FX##(A_1cec!(2)) / 100.0)) + "m2"   '@23963 DS:2226,227c,228a
    L_BPd6$ = "CGA"   '@239aa DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPca!, L_BPce!, L_BPd2$, L_BPd6$)   '@239b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @239d1 libera strings locais (L_BPd2)
    ' @239db libera strings locais (L_BPd6)
    L_BPda! = FX##(V_0e30!) + 4.0   '@239e5 DS:2120
    L_BPde! = 45.0   '@239fc DS:2290
    L_BPe2$ = "ACO  #   TOTAL PESO"   '@23a07 DS:2294
    L_BPe6$ = "CGA"   '@23a15 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPda!, L_BPde!, L_BPe2$, L_BPe6$)   '@23a23
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @23a3c libera strings locais (L_BPe2)
    ' @23a46 libera strings locais (L_BPe6)
    L_BP16! = 0.0   '@23a50 DS:219e
    V_0e28! = 0.0   '@23a60 DS:219e
    FOR V_0e14! = 5.0 TO 14.0   '@23a71 DS:21b6,2222,22c4
    IF NOT (A_1cec!(RT_CINT%(FX##(V_0e14!))) = 0.0) THEN GOTO L_23ab7   '@23a7e DS:219e
    GOTO L_23ed4   '@23aaf
L_23ab7:
    L_BP16! = FX##(L_BP16!) + 1.0   '@23ab7 DS:21b6
    V_0e28! = FX##(L_BP2a%(RT_CINT%(FX##(V_0e14!) - 5.0))) + V_0e28!   '@23acb DS:22ac
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(10.0 * FX##(V_0ec6!) * V_0ebe!))), (2)) + V_0ec2$ + RT_STRINGC$((19), (32))   '@23b00 DS:222e
    IF NOT (FX##(V_0e14!) - 5.0 <= FX##(V_18d6!)) THEN GOTO L_23b97   '@23b59 DS:22ac
    RT_MIDCHK (1), 0: MID$(V_0dfc$, 1) = "60B"   '@23b79 DS:22b0
L_23b97:
    V_0e00$ = STR$(RT_SNG!(-(V_0e14! = 5.0) * FX##(V_0eee!) - FX##(V_0e14! = 6.0) * V_0ef2! - FX##(V_0e14! = 7.0) * V_0ef6! - FX##(V_0e14! = 8.0) * V_0efa! - FX##(V_0e14! = 9.0) * V_0efe! - FX##(V_0e14! = 10.0) * V_0f02! - FX##(V_0e14! = 11.0) * V_0f06! - FX##(V_0e14! = 12.0) * V_0f0a! - FX##(V_0e14! = 13.0) * V_0f0e! - FX##(V_0e14! = 14.0) * V_0f12!))   '@23b97 DS:21ba,21e2,2216,221a,2222,222e,22b8,22bc,22c0,22c4
    RT_MIDCHK (5), 0: MID$(V_0dfc$, 5) = RT_MID2$((V_0e00$), (2))   '@23d1c
    RT_MIDCHK (16 - LEN(STR$(RT_SNG!(INT(FX##(A_1cec!(RT_CINT%(FX##(V_0e14!))))))))), 0: MID$(V_0dfc$, 16 - LEN(STR$(RT_SNG!(INT(FX##(A_1cec!(RT_CINT%(FX##(V_0e14!))))))))) = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1cec!(RT_CINT%(FX##(V_0e14!)))))))), (2))   '@23d48
    RT_MIDCHK (20 - LEN(STR$(RT_CINT%(L_BP2a%(RT_CINT%(FX##(V_0e14!) - 5.0)) + 0.4900000095367431640625##)))), 0: MID$(V_0dfc$, 20 - LEN(STR$(RT_CINT%(L_BP2a%(RT_CINT%(FX##(V_0e14!) - 5.0)) + 0.4900000095367431640625##)))) = RT_MID2$((STR$(RT_CINT%(L_BP2a%(RT_CINT%(FX##(V_0e14!) - 5.0)) + 0.4900000095367431640625##))), (2))   '@23ddb DS:22ac,22c8
    L_BPea! = FX##(V_0e30!) + 4.0   '@23e74 DS:2120
    L_BPee! = FX##(L_BP16!) * 9.0 + 45.0   '@23e8b DS:2216,2290
    L_BPf2$ = "CGA"   '@23e9f DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPea!, L_BPee!, V_0dfc$, L_BPf2$)   '@23ead
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @23ec5 libera strings locais (L_BPf2)
L_23ed4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@23ed9 DS:21b6,22c4
    L_BPf6! = FX##(V_0e30!) + 4.0   '@23f05 DS:2120
    L_BPfa! = FX##(L_BP16!) * 9.0 + 54.0   '@23f1c DS:2216,22cc
    L_BPfe$ = "TAXA " + STR$(RT_SNG!(INT(100.0 / FX##(A_1cec!(1)) * V_0e28!))) + " kg/m3"   '@23f30 DS:2226,22d0,22da
    L_BP102$ = "CGA"   '@23f80 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BPf6!, L_BPfa!, L_BPfe$, L_BP102$)   '@23f8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @23fa7 libera strings locais (L_BPfe)
    ' @23fb1 libera strings locais (L_BP102)
    RT_LINE RT_SNG!(FX##(V_0e30!) + 1.0), 0.0, RT_SNG!(FX##(V_0e30!) + 158.0), RT_SNG!(FX##(L_BP16!) * 9.0 + 54.0), 25, V_191a%, 0   '@23fbb DS:219e,21b6,2216,22cc,22e4
    FOR V_0e28! = 9.0 TO 36.0 STEP 9.0   '@24023 DS:2216,2278
    RT_LINE RT_SNG!(FX##(V_0e30!) + 2.0), V_0e28!, RT_SNG!(FX##(V_0e30!) + 157.0), V_0e28!, 9, V_191a%, 0   '@24030 DS:21ea,22e8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@24087 DS:2216,2278
    RT_LINE RT_SNG!(FX##(V_0e30!) + 2.0), RT_SNG!(FX##(L_BP16!) * 9.0 + 45.0), RT_SNG!(FX##(V_0e30!) + 157.0), RT_SNG!(FX##(L_BP16!) * 9.0 + 45.0), 9, V_191a%, 0   '@240b0 DS:21ea,2216,2290,22e8
    L_BP106! = FX##(V_0e30!) + 4.0   '@24127 DS:2120
    L_BP10a! = FX##(L_BP16!) * 9.0 + 64.0   '@2413e DS:2216,22ec
    L_BP10e$ = "TABELA PARA 1 VIGA"   '@24152 DS:22f0
    L_BP112$ = "CGA"   '@24160 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BP106!, L_BP10a!, L_BP10e$, L_BP112$)   '@2416e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24187 libera strings locais (L_BP10e)
    ' @24191 libera strings locais (L_BP112)
    L_BP116! = FX##(V_0e30!) + 4.0   '@2419b DS:2120
    L_BP11a! = FX##(L_BP16!) * 9.0 + 73.0   '@241b2 DS:2216,2306
    L_BP11e$ = "MEDIDAS EM CM"   '@241c6 DS:230a
    L_BP122$ = "CGA"   '@241d4 DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BP116!, L_BP11a!, L_BP11e$, L_BP122$)   '@241e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @241fb libera strings locais (L_BP11e)
    ' @24205 libera strings locais (L_BP122)
    IF NOT (A_1cbe%(RT_CINT%(FX##(V_0e58!))) > 0) THEN GOTO L_242da   '@2420f
    L_BP126! = FX##(V_0e30!) + 4.0   '@24236 DS:2120
    L_BP12a! = FX##(L_BP16!) * 9.0 + 83.0   '@2424d DS:2216,231c
    L_BP12e$ = "REPETIR" + STR$(A_1cbe%(RT_CINT%(FX##(V_0e58!)))) + " VEZES"   '@24261 DS:2320,232c
    L_BP132$ = "CGA"   '@2429f DS:21da
    CALL MIXT_08c4_TextoGrafico(L_BP126!, L_BP12a!, L_BP12e$, L_BP132$)   '@242ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @242c6 libera strings locais (L_BP12e)
    ' @242d0 libera strings locais (L_BP132)
L_242da:
    RT_WINDOW 0, 0, 0, 0, 0   '@242da (sem argumentos (B$WIN0/B$VEW0))
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@242e4 (sem argumentos (B$WIN0/B$VEW0))
    RT_ROTINA_0F20   '@242ee (rotina em assembly ligada ao EXE (SUB_60f20); gerada no fim do programa)
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@242f8 DS:2124
    IF NOT (LEN(V_18f2$) > 0) THEN GOTO L_24345   '@2430b
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_18f2$: RT_LPFIM   '@24320 DS:2124
L_24345:
    IF NOT (LEN(V_18f6$) > 0) THEN GOTO L_2437f   '@24345
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_18f6$: RT_LPFIM   '@2435a DS:2124
L_2437f:
    IF NOT (LEN(V_18fa$) > 0) THEN GOTO L_243b9   '@2437f
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_18fa$: RT_LPFIM   '@24394 DS:2124
L_243b9:
    FOR V_0e40! = 0.0 TO 5.0   '@243b9 DS:219e,21b6,2222
    IF NOT (LEN(A_1c90$(RT_CINT%(FX##(V_0e40!)))) = 0) THEN GOTO L_243f7   '@243c6
    GOTO L_244d0   '@243ef
L_243f7:
    IF NOT (V_0e40! > 1.0) THEN GOTO L_24492   '@243f7 DS:21b6
    A_1c90$(RT_CINT%(FX##(V_0e40!))) = RT_MID2$((STR$(RT_SNG!(FX##(V_0e40!) - 1.0))), (2)) + ")" + RT_MID2$((A_1c90$(RT_CINT%(FX##(V_0e40!)))), (4))   '@24412 DS:219a,2336
L_24492:
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS A_1c90$(RT_CINT%(FX##(V_0e40!))): RT_LPFIM   '@24492 DS:2124
L_244d0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e40!   '@244d5 DS:21b6,2222
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@24501 DS:2124
L_24519:
    IF NOT (V_1846$ = "s") THEN GOTO L_2453d   '@2451e DS:233c
    GOTO L_247a3   '@24535
L_2453d:
    V_1f1c$ = RT_FIX$("~" + V_0dd4$, 10)   '@2453d DS:2342 (string fixa)
    V_1f26! = A_1cec!(0)   '@24562
    V_1f2a! = A_1cec!(1)   '@24581
    V_1f2e! = A_1cec!(2)   '@2459e
    V_1f32! = A_1cec!(3)   '@245be
    V_1f36! = A_1cec!(4)   '@245de
    V_1f3a! = A_1cec!(5)   '@245fe
    V_1f3e! = A_1cec!(6)   '@2461e
    V_1f42! = A_1cec!(7)   '@2463e
    V_1f46! = A_1cec!(8)   '@2465e
    V_1f4a! = A_1cec!(9)   '@2467e
    V_1f4e! = A_1cec!(10)   '@2469e
    V_1f52! = A_1cec!(11)   '@246be
    V_1f56! = A_1cec!(12)   '@246de
    V_1f5a! = A_1cec!(13)   '@246fe
    V_1f5e! = A_1cec!(14)   '@2471e
    OPEN RT_ARQ$(V_0dc0$ + V_0dd8$ + ".TAB") FOR RANDOM AS #1 LEN = 70   '@2473e DS:2348,234e
    RT_REG_1F1C_GRAVA 1, RT_CLNG&(FX##(V_0e58!))   '@2476c (registro de 70 bytes)
    RT_CLOSE   '@24791 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
L_247a3:
    ERASE L_BP2a%   '@247a8
    ' END SUB   '@247b6
END SUB

SUB S_30132   ' entrada de SUB/FUNCTION (B$ENRA, locais 128 bytes) (0x30132)
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
    ' ---- FUN_3000_0132 @0x30132  (030132_FUN_3000_0132.lift.txt; evidence_id (assembly): ev_6ae2d21109b8b78526e810fcf405852a06266c182108f855ce561c2dd9b30f91)
    REDIM A_1a0c!(-32768 TO -32768, -32768 TO -32768)   '@3013a
    REDIM A_1a0c!(0 TO 14, 0 TO 2)   '@30148
    L_BP0e! = FX##(V_0ddc!) + V_0de4!   '@3016c
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP0e!   '@30182 DS:2360
    IF NOT (V_0e14! = 0.0) THEN GOTO L_301f6   '@3018e DS:2364
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = A_1926!(RT_CINT%(FX##(V_0e14!)), 1)   '@301a9
    GOTO L_302ca   '@301ee
L_301f6:
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) - 1.0), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!) - 1.0), 0)   '@301f6 DS:2368
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 1)   '@30262
L_302ca:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@302cf DS:2360
    IF NOT (V_0de4! = 0.0) THEN GOTO L_303c5   '@302fa DS:2364
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) - 1.0), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!) - 1.0), 0)   '@30315 DS:2368
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@30381
L_303c5:
    V_0f7e! = 0.0   '@303c5 DS:2364
    V_0f82! = 0.0   '@303d6 DS:2364
    L_BP12! = FX##(V_0ddc!) + V_0de4!   '@303e7
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP12!   '@303fd DS:2360
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e14!))) < V_0f7e!) THEN GOTO L_30458   '@3040a
    V_0f7e! = A_19b0!(1)   '@3043b
L_30458:
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) > FX##(V_0f82!)) THEN GOTO L_304ee   '@30458
    V_0f82! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@304a8
L_304ee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@304ee DS:2360
    V_18e6! = 0.425000011920928955078125## * V_0e60!   '@30519 DS:236c
    V_0f76! = 0.100000001490116119384765625## / (FX##(V_0f82!) - V_0f7e!) * V_0e60!   '@3052f DS:2370
    V_18fe! = 1.0 - FX##(V_0de0!)   '@30552 DS:2360
    V_1902! = FX##(V_0ddc!) + V_0de4!   '@30568
    REDIM A_1a68!(-32768 TO -32768, -32768 TO -32768)   '@3057e
    REDIM A_1a68!(0 TO 200, 0 TO 3)   '@3058c
    V_185a! = 0.0   '@305b0 DS:2364
    GOSUB L_305e8   '@305c1
    GOSUB L_3310a   '@305ce
    GOTO L_338dd   '@305db
    ' ---- F_305e3 @0x305e3  (0305e3_F_305e3.lift.txt; evidence_id (assembly): ev_c5cf237fc6856b3a490f9980a1e0d1d214c93c3a946b6e506753d4c32d6aa255)
L_305e8:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030132_FUN_3000_0132
    IF NOT (V_18fe! > V_1902!) THEN GOTO L_30612   '@305ed
    RETURN   '@30608
L_30612:
    L_BP16! = V_1902!   '@30612
    FOR V_0e14! = FX##(V_18fe!) - 1.0 TO L_BP16!   '@30623 DS:2360,2368
    IF NOT (V_0e14! < 0.0 OR V_0e14! > V_0ddc!) THEN GOTO L_30676   '@30630 DS:2364
    GOTO L_32d3c   '@3066e
L_30676:
    IF NOT (RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (1)) = "P") THEN GOTO L_306b0   '@30676 DS:2374
    GOTO L_31477   '@306a8
L_306b0:
    IF NOT (RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (1)) = "V") THEN GOTO L_306ea   '@306b0 DS:237a
    GOTO L_31de2   '@306e2
L_306ea:
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!)), 0) = 1.0) THEN GOTO L_30730   '@306f4 DS:2360
    GOTO L_309a7   '@30728
L_30730:
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@30730
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@30774
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@307d4
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f82!) + 300.0   '@30816 DS:2380
    V_185a! = FX##(V_185a!) + 1.0   '@30846 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@3085c DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@308a4 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@3090e DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f82!) + 300.0   '@30954 DS:2380
    V_185a! = FX##(V_185a!) + 1.0   '@30984 DS:2360
    GOTO L_30df0   '@3099a
L_309a7:
    L_BP1a! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@309ac
    L_BP1e! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@309f2 DS:2360
    CALL MIXT_082a_Maior(L_BP1a!, L_BP1e!, L_BP22!)   '@30a3b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e30! = L_BP22!   '@30a4d
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@30a57
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@30a9b
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@30afb
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e30!   '@30b3d
    V_185a! = FX##(V_185a!) + 1.0   '@30b68 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@30b7e DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@30bc4 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@30c0e DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e30!   '@30c54
    V_185a! = FX##(V_185a!) + 1.0   '@30c7f DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@30c95 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@30cdb DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@30d25 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@30d6b DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@30dd5 DS:2360
L_30df0:
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_30e31   '@30df5 DS:2364
    GOTO L_31065   '@30e29
L_30e31:
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@30e31
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@30e75
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@30eb6
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f7e!) - 300.0   '@30ef8 DS:2384
    V_185a! = FX##(V_185a!) + 1.0   '@30f28 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@30f3e DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@30f86 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@30fcc DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f7e!) - 300.0   '@31012 DS:2384
    V_185a! = FX##(V_185a!) + 1.0   '@31042 DS:2360
    GOTO L_32d3c   '@31058
L_31065:
    L_BP26! = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@3106a
    L_BP2a! = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@31091 DS:2360
    CALL MIXT_0877_Menor(L_BP26!, L_BP2a!, L_BP2e!)   '@310b6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0)) = L_BP2a!   '@310c8 DS:2360
    A_19b0!(RT_CINT%(FX##(V_0e14!))) = L_BP26!   '@310ee
    V_0e30! = L_BP2e!   '@3110f
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@31119
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@3115d
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@3119e
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e30!   '@311e0
    V_185a! = FX##(V_185a!) + 1.0   '@3120b DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@31221 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@31267 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@312b1 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e30!   '@312f7
    V_185a! = FX##(V_185a!) + 1.0   '@31322 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@31338 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@3137e DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@313c8 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@3140e DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@31454 DS:2360
    GOTO L_32d3c   '@3146a
L_31477:
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@3147c
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@314c0
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@31520
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f82!) + 300.0   '@31562 DS:2380
    V_185a! = FX##(V_185a!) + 1.0   '@31592 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@315a8 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@315f0 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@3165a DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f82!) + 300.0   '@316a0 DS:2380
    V_185a! = FX##(V_185a!) + 1.0   '@316d0 DS:2360
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_31722   '@316e6 DS:2364
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31065   '@3171a
L_31722:
    L_BP32! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@31722
    L_BP36! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2)   '@3174d
    CALL MIXT_0877_Menor(L_BP32!, L_BP36!, L_BP3a!)   '@3178d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP32!   '@3179f
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = L_BP3a!   '@317c4
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@317e7
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2)   '@31828
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@31886
    V_185a! = FX##(V_185a!) + 1.0   '@318c7 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@318dd DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@31923 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2)   '@3196d
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f7e!) - 300.0   '@319cb DS:2384
    V_185a! = FX##(V_185a!) + 1.0   '@319fb DS:2360
    L_BP3e! = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@31a11 DS:2360
    L_BP42! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2) + A_1982!(RT_CINT%(FX##(V_0e14!)), 1)   '@31a40 DS:2360
    CALL MIXT_082a_Maior(L_BP3e!, L_BP42!, L_BP46!)   '@31ac1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) = L_BP3e!   '@31ad3 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = L_BP46!   '@31afc
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@31b1f DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2) + A_1982!(RT_CINT%(FX##(V_0e14!)), 1)   '@31b65 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@31c04 DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@31c4a DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@31c60 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@31ca6 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0) + A_1982!(RT_CINT%(FX##(V_0e14!)), 1) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2)   '@31cf0 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(V_0f7e!) - 300.0   '@31d8f DS:2384
    V_185a! = FX##(V_185a!) + 1.0   '@31dbf DS:2360
    GOTO L_32d3c   '@31dd5
L_31de2:
    IF NOT (V_0e14! = V_0ddc! AND V_0de4! = 0.0) THEN GOTO L_31e67   '@31de7 DS:2364
    A_19b0!(RT_CINT%(FX##(V_0ddc!) + 1.0)) = A_19b0!(RT_CINT%(FX##(V_0ddc!)))   '@31e25 DS:2360
L_31e67:
    L_BP4a! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@31e67
    L_BP4e! = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@31ead
    L_BP52! = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@31ece DS:2360
    CALL MIXT_0877_Menor(L_BP4e!, L_BP52!, L_BP56!)   '@31ef3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0)) = L_BP52!   '@31f05 DS:2360
    A_19b0!(RT_CINT%(FX##(V_0e14!))) = L_BP4e!   '@31f2b
    L_BP5a! = FX##(L_BP56!) - A_1982!(RT_CINT%(FX##(V_0e14!)), 1) + A_1982!(RT_CINT%(FX##(V_0e14!)), 0)   '@31f4c
    L_BP5e! = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@31f93 DS:2360
    CALL MIXT_082a_Maior(L_BP5a!, L_BP5e!, L_BP62!)   '@31fdc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP4a!, L_BP62!, L_BP66!)   '@31fed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e34! = L_BP66!   '@31fff
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32009 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@3206f
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@320cf DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e34!   '@32133
    V_185a! = FX##(V_185a!) + 1.0   '@3215e DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@32174 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@321ba DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@32204 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e34!   '@3224a
    V_185a! = FX##(V_185a!) + 1.0   '@32275 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@3228b DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@322d1 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@3231b DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@32361 DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@323cb DS:2360
    L_BP6a! = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@323e1
    L_BP6e! = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@32408
    L_BP72! = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@32429 DS:2360
    CALL MIXT_0877_Menor(L_BP6e!, L_BP72!, L_BP76!)   '@3244e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0)) = L_BP72!   '@32460 DS:2360
    A_19b0!(RT_CINT%(FX##(V_0e14!))) = L_BP6e!   '@32486
    L_BP7a! = FX##(L_BP76!) - A_1982!(RT_CINT%(FX##(V_0e14!)), 1)   '@324a7
    L_BP7e! = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@324d0 DS:2360
    CALL MIXT_0877_Menor(L_BP7a!, L_BP7e!, L_BP82!)   '@324f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0)) = L_BP7e!   '@32508 DS:2360
    CALL MIXT_0877_Menor(L_BP6a!, L_BP82!, L_BP86!)   '@3252d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_19b0!(RT_CINT%(FX##(V_0e14!))) = L_BP6a!   '@32541
    V_0e34! = L_BP86!   '@32562
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@3256d DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@325d3
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32614 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e34!   '@32678
    V_185a! = FX##(V_185a!) + 1.0   '@326a3 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@326b9 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@326ff DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@32749 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = V_0e34!   '@3278f
    V_185a! = FX##(V_185a!) + 1.0   '@327ba DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 2)   '@327d0 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_1a68!(RT_CINT%(FX##(V_185a!) - 1.0), 3)   '@32816 DS:2368
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)   '@32860 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@328a6 DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@328ec DS:2360
    IF NOT (V_0de0! = 0.0 AND V_0e14! = 0.0) THEN GOTO L_32948   '@32902 DS:2364
    GOTO L_32b17   '@32940
L_32948:
    FOR V_0e20! = 0.0 TO 6.0 STEP 3.0   '@32948 DS:2364,238c,2390
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32956 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0e20! / 9.0 + A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@329bc DS:2388
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a68!(RT_CINT%(FX##(V_185a!)), 0)   '@32a26
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 1)) / 9.0 + A_1a68!(RT_CINT%(FX##(V_185a!)), 1)   '@32a67 DS:2388
    V_185a! = FX##(V_185a!) + 1.0   '@32ad0 DS:2360
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e20!   '@32ae6 DS:238c,2390
L_32b17:
    IF NOT (V_0de4! = 0.0 AND V_0e14! = V_0ddc!) THEN GOTO L_32b62   '@32b1c DS:2364
    GOTO L_32d3c   '@32b5a
L_32b62:
    FOR V_0e20! = 0.0 TO 6.0 STEP 3.0   '@32b62 DS:2364,238c,2390
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32b70
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) * V_0e20! / 9.0 + A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@32bd2 DS:2360,2388
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a68!(RT_CINT%(FX##(V_185a!)), 0)   '@32c46
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) / 9.0 + A_1a68!(RT_CINT%(FX##(V_185a!)), 1)   '@32c87 DS:2360,2388
    V_185a! = FX##(V_185a!) + 1.0   '@32cf5 DS:2360
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e20!   '@32d0b DS:238c,2390
L_32d3c:
    IF NOT (V_0de0! = 0.0 AND V_0e14! = 0.0) THEN GOTO L_32f05   '@32d41 DS:2364
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32d7f DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@32de5
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32e26 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@32e8a
    V_185a! = FX##(V_185a!) + 1.0   '@32eea DS:2360
L_32f05:
    IF NOT (V_0de4! = 0.0 AND V_0e14! = V_0ddc!) THEN GOTO L_330d0   '@32f05 DS:2364
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32f43
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))   '@32fa5 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e14!)), 0)   '@32feb
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)   '@3304b DS:2360
    V_185a! = FX##(V_185a!) + 1.0   '@330b5 DS:2360
L_330d0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@330d0 DS:2360
    RETURN   '@330fb
L_3310a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030132_FUN_3000_0132
    IF NOT (V_18fe! > V_1902!) THEN GOTO L_33134   '@3310f
    RETURN   '@3312a
L_33134:
    L_BP8a! = V_1902!   '@33134
    FOR V_0e14! = V_18fe! TO L_BP8a!   '@33146 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@3314e
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@33191
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@331f1
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@33233
    V_185a! = FX##(V_185a!) + 1.0   '@33293 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@332a9
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@332ec
    IF NOT (V_0e14! = 0.0) THEN GOTO L_33350   '@3332d DS:2364
    GOTO L_33480   '@33348
L_33350:
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!) - 1.0), 1) <> 0.0 AND RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!) - 1.0))), (1)) = "P") THEN GOTO L_3347b   '@33350 DS:2364,2368,2374
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e14!) - 1.0), 0) + A_1982!(RT_CINT%(FX##(V_0e14!) - 1.0), 2) + A_1982!(RT_CINT%(FX##(V_0e14!) - 1.0), 1)   '@333cb DS:2368
L_3347b:
L_33480:
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@33485
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@334c7
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!)) THEN GOTO L_33530   '@33508 DS:2360
    GOTO L_335ca   '@33528
L_33530:
    IF NOT (RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (1)) = "P") THEN GOTO L_335c5   '@33530 DS:2374
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2)   '@33562
L_335c5:
L_335ca:
    V_185a! = FX##(V_185a!) + 1.0   '@335cf DS:2360
    IF NOT (V_0e14! = 0.0) THEN GOTO L_33740   '@335e5 DS:2364
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@33600
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@33643
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@33684
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@336c5
    V_185a! = FX##(V_185a!) + 1.0   '@33725 DS:2360
L_33740:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!)) THEN GOTO L_338a2   '@33740 DS:2360
    A_1a68!(RT_CINT%(FX##(V_185a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@33760
    A_1a68!(RT_CINT%(FX##(V_185a!)), 1) = A_19b0!(RT_CINT%(FX##(V_0e14!)))   '@337a4
    A_1a68!(RT_CINT%(FX##(V_185a!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@337e5
    A_1a68!(RT_CINT%(FX##(V_185a!)), 3) = FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1)   '@33827
    V_185a! = FX##(V_185a!) + 1.0   '@33887 DS:2360
L_338a2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@338a2 DS:2360
    RETURN   '@338ce
L_338dd:   ' entrada vinda de 030132_FUN_3000_0132
    ' END SUB   '@338dd
END SUB

SUB S_338ed   ' entrada de SUB/FUNCTION (B$ENRA, locais 68 bytes) (0x338ed)
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
    ' ---- FUN_3000_38ed @0x338ed  (0338ed_FUN_3000_38ed.lift.txt; evidence_id (assembly): ev_ae3f1c5c06a861dedece18fef26cd8a3aaf9418d5efd296d93339614a362a9c7)
    REDIM A_1b7c!(-32768 TO -32768, -32768 TO -32768)   '@338ff
    REDIM A_1b7c!(0 TO 30, 0 TO 3)   '@3390d
    V_1862! = 0.0   '@33931 DS:2364
    IF NOT (V_190a$ = "N") THEN GOTO L_33961   '@33942 DS:2394
    GOTO L_343ae   '@33959
L_33961:
    L_BP1a! = V_0ddc!   '@33961
    FOR V_0e14! = 1.0 TO L_BP1a!   '@33972 DS:2360
    V_0e24! = 2.0   '@3397a DS:239a
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_33a1a   '@3398b
    V_0e24! = 4.0   '@339bf DS:239e
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) THEN GOTO L_33a15   '@339d0
    V_0e24! = 6.0   '@33a04 DS:2390
L_33a15:
L_33a1a:
    V_0e28! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@33a1a
    V_0e18! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@33a44
    IF NOT (V_185e! = 0.0) THEN GOTO L_33a92   '@33a6f DS:2364
    GOTO L_33eba   '@33a8a
L_33a92:
L_33a97:
    V_0e30! = V_0e28!   '@33a9c
    V_0e34! = V_0e18!   '@33aad
    L_BP0c% = 0   '@33abe
    L_BP0e% = 0   '@33ac8
    L_BP12! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@33ad2
    L_BP16! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@33afc
    L_BP1e! = V_185e!   '@33b25
    FOR V_0e1c! = 1.0 TO L_BP1e!   '@33b36 DS:2360
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) > V_0e28! AND A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) <= V_0e28!) THEN GOTO L_33cb3   '@33b3e
    L_BP0c% = RT_CINT%(FX##(L_BP0c%) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0))   '@33baf
    L_BP22! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@33be2
    CALL MIXT_0877_Menor(L_BP12!, L_BP22!, L_BP26!)   '@33c0c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP22!   '@33c1e
    L_BP12! = L_BP26!   '@33c43
    IF NOT (L_BP0c% >= V_0e24!) THEN GOTO L_33cae   '@33c4c
    V_0e28! = L_BP12!   '@33c6a
    L_BP0c% = 0   '@33c7a
    L_BP12! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@33c84
L_33cae:
L_33cb3:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) >= V_0e18! AND A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) < V_0e18!) THEN GOTO L_33e21   '@33cb3
    L_BP0e% = RT_CINT%(FX##(L_BP0e%) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0))   '@33d24
    L_BP2a! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@33d57
    CALL MIXT_082a_Maior(L_BP16!, L_BP2a!, L_BP2e!)   '@33d7e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP2a!   '@33d90
    L_BP16! = L_BP2e!   '@33db2
    IF NOT (L_BP0e% >= V_0e24!) THEN GOTO L_33e1c   '@33dbb
    V_0e18! = L_BP16!   '@33dd9
    L_BP0e% = 0   '@33de9
    L_BP16! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@33df3
L_33e1c:
L_33e21:
    IF NOT (V_0e18! <= V_0e28!) THEN GOTO L_33e44   '@33e21
    GOTO L_33e6f   '@33e3c
L_33e44:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@33e44 DS:2360
L_33e6f:
    IF NOT (V_0e18! <> V_0e34! OR V_0e28! <> V_0e30!) THEN GOTO L_33eb5   '@33e6f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33a97   '@33ead
L_33eb5:
L_33eba:
    IF NOT (V_0e18! <= V_0e28!) THEN GOTO L_33ee2   '@33ebf
    GOTO L_34379   '@33eda
L_33ee2:
    V_1862! = FX##(V_1862!) + 1.0   '@33ee2 DS:2360
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 0) = V_0e24!   '@33ef8
    L_BP32! = -(FX##(V_18da! = 0.0) * V_0eee! + FX##(V_18da! = 1.0) * V_0ef2! + FX##(V_18da! = 2.0) * V_0ef6! + FX##(V_18da! = 3.0) * V_0efa! + FX##(V_18da! = 4.0) * V_0efe! + FX##(V_18da! = 5.0) * V_0f02! + FX##(V_18da! = 6.0) * V_0f06!)   '@33f22 DS:2360,2364,238c,2390,239a,239e,23a2
    CALL MIXT_082a_Maior(V_0ece!, L_BP32!, L_BP36!)   '@34029
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) = L_BP36!   '@3403b
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = INT(V_0e28! - (-(V_18de! < 100.0) * FX##(V_18de!) - (V_18de! > 100.0) * (FX##(V_18de!) - 100.0) * A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) / 10.0))   '@3405f DS:23a6,23aa,23ae
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e28!) THEN GOTO L_341e7   '@34104
    L_BP3a! = A_1b7c!(RT_CINT%(FX##(V_1862!)), 2)   '@34138
    L_BP3e! = FX##(V_0e28!) - A_1926!(RT_CINT%(FX##(V_0e14!) - 1.0), 0) + V_0eaa!   '@34160 DS:2368
    CALL MIXT_082a_Maior(L_BP3a!, L_BP3e!, L_BP42!)   '@34192
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = L_BP3a!   '@341a4
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 2) = L_BP42!   '@341c6
L_341e7:
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = INT(-(V_18de! < 100.0) * FX##(V_18de!) - (V_18de! > 100.0) * (FX##(V_18de!) - 100.0) * A_1b7c!(RT_CINT%(FX##(V_1862!)), 1) / 10.0 + V_0e18!)   '@341e7 DS:23a6,23aa,23ae
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e18!) THEN GOTO L_34374   '@3428c
    L_BP46! = A_1b7c!(RT_CINT%(FX##(V_1862!)), 3)   '@342c1
    L_BP4a! = FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0eaa! + V_0e18!   '@342ec
    CALL MIXT_0877_Menor(L_BP46!, L_BP4a!, L_BP4e!)   '@34319
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = L_BP46!   '@3432b
    A_1b7c!(RT_CINT%(FX##(V_1862!)), 3) = L_BP4e!   '@34350
L_34374:
L_34379:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@3437e DS:2360
L_343ae:
    ' END SUB   '@343ae
END SUB

SUB S_343be   ' entrada de SUB/FUNCTION (B$ENRA, locais 88 bytes) (0x343be)
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
    ' ---- FUN_3000_43be @0x343be  (0343be_FUN_3000_43be.lift.txt; evidence_id (assembly): ev_65e869167566b556d44bb4aedb6fcd9b47ab8cc5d8ed1a25a13c1c3692f9e009)
    REDIM A_1c06!(-32768 TO -32768, -32768 TO -32768)   '@343c6
    REDIM A_1c06!(0 TO 50, 0 TO 6)   '@343d4
    V_186a! = 0.0   '@343f8 DS:2364
    L_BP0e! = FX##(V_0ddc!) + V_0de4!   '@34409
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP0e!   '@3441f DS:2360
    IF NOT (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) * 100.0 <= FX##(A_19de!(RT_CINT%(FX##(V_0e14!)))) OR (V_0e14! = 0.0 OR A_1374!(RT_CINT%(FX##(V_0e14!)), 1) = 0.0)) THEN GOTO L_344de   '@3442c DS:2364,23a6
    GOTO L_348b3   '@344d6
L_344de:
    V_186a! = FX##(V_186a!) + 1.0   '@344de DS:2360
    A_1c06!(RT_CINT%(FX##(V_186a!)), 5) = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) * 0.0000999999974737875163555145263671875##   '@344f4 DS:23b2
    A_1c06!(RT_CINT%(FX##(V_186a!)), 2) = A_1374!(RT_CINT%(FX##(V_0e14!)), 0)   '@34566
    A_1c06!(RT_CINT%(FX##(V_186a!)), 3) = A_1374!(RT_CINT%(FX##(V_0e14!)), 2)   '@345a7
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 1.0   '@345e9 DS:2360
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_346d7   '@34614
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 2.0   '@34648 DS:239a
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) THEN GOTO L_346d2   '@34673
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 3.0   '@346a7 DS:238c
L_346d2:
L_346d7:
    A_1c06!(RT_CINT%(FX##(V_186a!)), 0) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@346d7
    L_BP12! = FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) * 100.0 - A_19de!(RT_CINT%(FX##(V_0e14!)))   '@3471a DS:23a6
    CALL MIXT_082a_Maior(V_18ee!, L_BP12!, L_BP16!)   '@34764
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a! = 1.0   '@34776 DS:2360
    L_BP1e! = A_1374!(RT_CINT%(FX##(V_0e14!)), 2)   '@34781
    CALL MIXT_082a_Maior(L_BP1a!, L_BP1e!, L_BP22!)   '@347a2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1374!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP1e!   '@347b4
    L_BP26! = INT(FX##(RT_CINT%(FX##(L_BP16!) / L_BP22!)) * A_1374!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@347d6
    L_BP2a! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@3482f
    CALL MIXT_0877_Menor(L_BP26!, L_BP2a!, L_BP2e!)   '@34853
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) = L_BP2a!   '@34865
    A_1c06!(RT_CINT%(FX##(V_186a!)), 1) = L_BP2e!   '@3488a
L_348b3:
    IF NOT (A_1374!(RT_CINT%(FX##(V_0e14!)), 1) = A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) THEN GOTO L_3490f   '@348b8
    GOTO L_34f09   '@34907
L_3490f:
    V_186a! = FX##(V_186a!) + 1.0   '@3490f DS:2360
    A_1c06!(RT_CINT%(FX##(V_186a!)), 5) = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) * 0.0000999999974737875163555145263671875##   '@34925 DS:23b2
    A_1c06!(RT_CINT%(FX##(V_186a!)), 2) = A_1374!(RT_CINT%(FX##(V_0e14!)), 3)   '@34997
    A_1c06!(RT_CINT%(FX##(V_186a!)), 3) = A_1374!(RT_CINT%(FX##(V_0e14!)), 5)   '@349d9
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 1.0   '@34a1e DS:2360
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_34b0c   '@34a49
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 2.0   '@34a7d DS:239a
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) THEN GOTO L_34b07   '@34aa8
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 3.0   '@34adc DS:238c
L_34b07:
L_34b0c:
    L_BP32! = A_1c06!(RT_CINT%(FX##(V_186a!) - 1.0), 1)   '@34b0c DS:2368
    L_BP36! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@34b3c
    CALL MIXT_082a_Maior(L_BP32!, L_BP36!, L_BP3a!)   '@34b5f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP36!   '@34b71
    A_1c06!(RT_CINT%(FX##(V_186a!) - 1.0), 1) = L_BP32!   '@34b95 DS:2368
    A_1c06!(RT_CINT%(FX##(V_186a!)), 0) = L_BP3a!   '@34bbf
    IF NOT (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) * 100.0 >= FX##(A_19de!(RT_CINT%(FX##(V_0e14!)))) + A_1926!(RT_CINT%(FX##(V_0e14!)), 1) OR FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) >= FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2!) THEN GOTO L_34cf8   '@34be2 DS:23a6
    A_1c06!(RT_CINT%(FX##(V_186a!)), 1) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@34cab
    GOTO L_34ea0   '@34cf0
L_34cf8:
    L_BP3e! = FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) - V_18ee!   '@34cf8
    L_BP42! = FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) * 100.0   '@34d28 DS:23a6
    CALL MIXT_0877_Menor(L_BP3e!, L_BP42!, L_BP46!)   '@34d51
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4a! = 1.0   '@34d63 DS:2360
    L_BP4e! = A_1374!(RT_CINT%(FX##(V_0e14!)), 7)   '@34d6e
    CALL MIXT_082a_Maior(L_BP4a!, L_BP4e!, L_BP52!)   '@34d92
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1374!(RT_CINT%(FX##(V_0e14!)), 7) = L_BP4e!   '@34da4
    A_1c06!(RT_CINT%(FX##(V_186a!)), 1) = A_1926!(RT_CINT%(FX##(V_0e14!)), 1) - INT(FX##(RT_CINT%((FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) - L_BP46! + A_19de!(RT_CINT%(FX##(V_0e14!)))) / L_BP52!)) * A_1374!(RT_CINT%(FX##(V_0e14!)), 7)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@34dc9
L_34ea0:
    IF NOT (A_1c06!(RT_CINT%(FX##(V_186a!)), 0) >= A_1c06!(RT_CINT%(FX##(V_186a!)), 1)) THEN GOTO L_34f04   '@34ea0
    V_186a! = FX##(V_186a!) - 1.0   '@34eee DS:2368
L_34f04:
L_34f09:
    IF NOT (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) * 100.0 >= FX##(A_19de!(RT_CINT%(FX##(V_0e14!)))) + A_1926!(RT_CINT%(FX##(V_0e14!)), 1) OR FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) = FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2!) THEN GOTO L_34fdf   '@34f0e DS:23a6
    GOTO L_352fc   '@34fd7
L_34fdf:
    V_186a! = FX##(V_186a!) + 1.0   '@34fdf DS:2360
    A_1c06!(RT_CINT%(FX##(V_186a!)), 5) = INT(FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) * 0.0000999999974737875163555145263671875##   '@34ff5 DS:23b2
    A_1c06!(RT_CINT%(FX##(V_186a!)), 2) = A_1374!(RT_CINT%(FX##(V_0e14!)), 6)   '@35067
    A_1c06!(RT_CINT%(FX##(V_186a!)), 3) = A_1374!(RT_CINT%(FX##(V_0e14!)), 7)   '@350a9
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 1.0   '@350ee DS:2360
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_351dc   '@35119
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 2.0   '@3514d DS:239a
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) THEN GOTO L_351d7   '@35178
    A_1c06!(RT_CINT%(FX##(V_186a!)), 4) = 3.0   '@351ac DS:238c
L_351d7:
L_351dc:
    L_BP56! = A_1c06!(RT_CINT%(FX##(V_186a!) - 1.0), 1)   '@351dc DS:2368
    L_BP5a! = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@3520c
    CALL MIXT_082a_Maior(L_BP56!, L_BP5a!, L_BP5e!)   '@3522f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP5a!   '@35241
    A_1c06!(RT_CINT%(FX##(V_186a!) - 1.0), 1) = L_BP56!   '@35265 DS:2368
    A_1c06!(RT_CINT%(FX##(V_186a!)), 0) = L_BP5e!   '@3528f
    A_1c06!(RT_CINT%(FX##(V_186a!)), 1) = A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@352b2
L_352fc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@35301 DS:2360
    V_0e28! = 1.0   '@3532c DS:2360
    V_0e20! = 0.0   '@3533d DS:2364
L_35353:
    V_0e20! = FX##(V_0e20!) + 1.0   '@35358 DS:2360
    A_1c06!(RT_CINT%(FX##(V_0e28!)), 6) = V_0e20!   '@3536e
    IF NOT (FX##(V_0e28!) + 1.0 > FX##(V_186a!)) THEN GOTO L_353c1   '@35399 DS:2360
    GOTO L_35546   '@353b9
L_353c1:
    L_BP62! = V_186a!   '@353c1
    FOR V_0e14! = FX##(V_0e28!) + 1.0 TO L_BP62!   '@353d2 DS:2360
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e28!)), 4) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 4) AND (A_1c06!(RT_CINT%(FX##(V_0e28!)), 2) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 2) AND A_1c06!(RT_CINT%(FX##(V_0e28!)), 5) = A_1c06!(RT_CINT%(FX##(V_0e14!)), 5))) THEN GOTO L_35516   '@353de
    A_1c06!(RT_CINT%(FX##(V_0e14!)), 6) = A_1c06!(RT_CINT%(FX##(V_0e28!)), 6)   '@354d1
L_35516:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@35516 DS:2360
L_35546:
    IF NOT (V_0e28! = V_186a!) THEN GOTO L_3556e   '@3554b
    GOTO L_355cd   '@35566
L_3556e:
    V_0e28! = FX##(V_0e28!) + 1.0   '@3556e DS:2360
    IF NOT (A_1c06!(RT_CINT%(FX##(V_0e28!)), 6) > 0.0) THEN GOTO L_355c0   '@35584 DS:2364
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35546   '@355b9
L_355c0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35353   '@355c0
L_355cd:
    ' END SUB   '@355cd
END SUB

SUB S_40132   ' entrada de SUB/FUNCTION (B$ENRA, locais 1340 bytes) (0x40132)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP18%
    DIM L_BP1c!
    DIM L_BP1e%
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
    DIM L_BP98%
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa4!
    DIM L_BPa8!
    DIM L_BPac!
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb8!
    DIM L_BPba%
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
    ' ---- FUN_4000_0132 @0x40132  (040132_FUN_4000_0132.lift.txt; evidence_id (assembly): ev_2531054e9e3c0b310ba73652e0cb5f892fc3aa96d0534f07937950b6e992a434)
    GOSUB L_401d3   '@40144
    GOSUB L_41e26   '@40151
    GOSUB L_4d11a   '@4015e
    GOSUB L_4db54   '@4016b
    GOSUB L_4e82c   '@40178
    GOSUB L_4a292   '@40185
    GOSUB L_4b484   '@40192
    GOSUB L_4ca62   '@4019f
    GOSUB L_4333d   '@401ac
    GOSUB L_47a97   '@401b9
    GOTO L_4faf5   '@401c6
    ' ---- F_401ce @0x401ce  (0401ce_F_401ce.lift.txt; evidence_id (assembly): ev_534a856bc22fac67ef1e12af3b4207015517eaa2a9c59d5564e69c9e8576ca87)
L_401d3:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    REDIM A_1af2!(-32768 TO -32768, -32768 TO -32768)   '@401d8
    REDIM A_1af2!(0 TO 60, 0 TO 3)   '@401e6
    V_185e! = 0.0   '@4020a DS:23c0
    L_BP22! = 0.0   '@4021b DS:23c0
    L_BP26! = 1.0 - FX##(V_0de0!) - V_0de8! + (A_1148!(0) < 0.0 AND V_0e74$ = "S")   '@4022c DS:23c0,23c4,23c8
    CALL MIXT_082a_Maior(V_0ddc!, L_BP26!, L_BP2a!)   '@40286
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP22!, L_BP2a!, L_BP2e!)   '@40297
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP32! = 0.0   '@402a9 DS:23c0
    L_BP36! = FX##(V_0ddc!) - 1.0 + V_0de4! + (FX##(V_0dec!) - (A_1148!(1) < 0.0 AND V_0e74$ = "S"))   '@402b4 DS:23c0,23c8,23ce
    CALL MIXT_0877_Menor(L_BP32!, L_BP36!, L_BP3a!)   '@40314
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_0ddc!, L_BP3a!, L_BP3e!)   '@40325
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP2e! > L_BP3e!) THEN GOTO L_40352   '@40337
    GOTO L_40b30   '@4034a
L_40352:
    L_BP42! = 0.0   '@40352 DS:23c0
    L_BP46! = 1.0 - FX##(V_0de0!) - V_0de8! + (A_1148!(0) < 0.0 AND V_0e74$ = "S")   '@40363 DS:23c0,23c4,23c8
    CALL MIXT_082a_Maior(V_0ddc!, L_BP46!, L_BP4a!)   '@403bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP42!, L_BP4a!, L_BP4e!)   '@403ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52! = 0.0   '@403e0 DS:23c0
    L_BP56! = FX##(V_0ddc!) - 1.0 + V_0de4! + (FX##(V_0dec!) - (A_1148!(1) < 0.0 AND V_0e74$ = "S"))   '@403eb DS:23c0,23c8,23ce
    CALL MIXT_0877_Menor(L_BP52!, L_BP56!, L_BP5a!)   '@4044b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_0ddc!, L_BP5a!, L_BP5e!)   '@4045c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP62! = L_BP5e!   '@4046e
    FOR V_0e14! = L_BP4e! TO L_BP62!   '@40478 DS:23c4
    IF NOT (FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(0.0)) THEN GOTO L_404d6   '@4047e DS:23c0
    GOTO L_40afb   '@404ce
L_404d6:
    L_BP1e% = 0   '@404d6
    L_BP66! = A_1318!(RT_CINT%(FX##(V_0e14!)), 0, 0)   '@404e0
    FOR V_0e28! = 1.0 TO L_BP66!   '@4050b DS:23c4
    V_0ee2! = FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)   '@40512
    V_0e92! = A_1260!(RT_CINT%(FX##(V_0e14!)), 0)   '@40558
    GOSUB L_4f64e   '@40582
    V_185e! = FX##(V_185e!) + 1.0   '@4058f DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = V_0e44!   '@405a5
    A_1af2!(RT_CINT%(FX##(V_185e!)), 1) = A_12bc!(RT_CINT%(FX##(V_0e14!)), 1)   '@405cf
    IF NOT (L_BP1e% >= A_12bc!(RT_CINT%(FX##(V_0e14!)), 0) AND A_12bc!(RT_CINT%(FX##(V_0e14!)), 2) > 0.0) THEN GOTO L_406ce   '@40614 DS:23c0
    A_1af2!(RT_CINT%(FX##(V_185e!)), 1) = A_12bc!(RT_CINT%(FX##(V_0e14!)), 3)   '@40689
L_406ce:
    L_BP1e% = RT_CINT%(FX##(L_BP1e%) + V_0e44!)   '@406ce
    GOSUB L_41cf5   '@406e8
    L_BP6a! = 13.0   '@406f5 DS:23d2
    CALL MIXT_0877_Menor(V_0e28!, L_BP6a!, L_BP6e!)   '@40705
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - A_19de!(RT_CINT%(FX##(V_0e14!))) + (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! - A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP6e!)), 1)) * 100.0   '@40717 DS:23d6
    IF NOT (V_0e14! = 0.0) THEN GOTO L_408ee   '@407be DS:23c0
    L_BP72! = 13.0   '@407d9 DS:23d2
    CALL MIXT_0877_Menor(V_0e28!, L_BP72!, L_BP76!)   '@407e9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = A_19de!(RT_CINT%(FX##(V_0e14!))) - FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP76!)), 1)) * 100.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@407fb DS:23d6
    IF NOT (V_0de0! = 0.0) THEN GOTO L_408e9   '@40883 DS:23c0
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - V_0e20!   '@4089e DS:23c4
L_408e9:
L_408ee:
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + V_0e20!   '@408ee
    IF NOT (V_0de4! = 1.0 OR V_0e14! < V_0ddc!) THEN GOTO L_40a2c   '@40938 DS:23c4
    L_BP7a! = 13.0   '@40976 DS:23d2
    CALL MIXT_0877_Menor(V_0e28!, L_BP7a!, L_BP7e!)   '@40986
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_19de!(RT_CINT%(FX##(V_0e14!) + 1.0)) + FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP7e!)), 2)) * 100.0   '@40998 DS:23c4,23d6
L_40a2c:
    GOSUB L_40b51   '@40a2c
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = INT(FX##(A_1af2!(RT_CINT%(FX##(V_185e!)), 2)))   '@40a39
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = INT(FX##(A_1af2!(RT_CINT%(FX##(V_185e!)), 3)))   '@40a7f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@40acb DS:23c4
L_40afb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@40b00 DS:23c4
L_40b30:
    GOSUB L_41135   '@40b35
    RETURN   '@40b42
L_40b51:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e14!))) = A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) THEN GOTO L_40bac   '@40b56 DS:23c4
    RETURN   '@40ba2
L_40bac:
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_185e!)), 0)   '@40bac DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_185e!)), 1)   '@40bf4 DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 2) = A_1af2!(RT_CINT%(FX##(V_185e!)), 2)   '@40c3e DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_185e!)), 3)   '@40c82 DS:23c4
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e14!))) < A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) THEN GOTO L_40d20   '@40ccc DS:23c4
    GOTO L_40efd   '@40d18
L_40d20:
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + V_0eaa!   '@40d20 DS:23c4
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0 AND RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (1)) = "P") THEN GOTO L_40e45   '@40d6c DS:23c0,23da
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2) + V_0eaa!   '@40ddd DS:23c4
L_40e45:
    GOSUB L_41cf5   '@40e45
    L_BP82! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) - V_0eaa!   '@40e52 DS:23c4
    L_BP86! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + V_0e20!   '@40e88 DS:23c4
    CALL MIXT_0877_Menor(L_BP82!, L_BP86!, L_BP8a!)   '@40eb6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = L_BP8a!   '@40ecb
    GOTO L_4110b   '@40ef0
L_40efd:
    GOSUB L_41cf5   '@40f02
    L_BP8e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + V_0eaa!   '@40f0f
    L_BP92! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0e20!   '@40f3f
    CALL MIXT_082a_Maior(L_BP8e!, L_BP92!, L_BP96!)   '@40f69
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!) + 1.0), 2) = L_BP96!   '@40f7e DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)   '@40fa5
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0 AND RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0e14!)))), (1)) = "P") THEN GOTO L_41106   '@4100d DS:23c0,23da
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + A_1982!(RT_CINT%(FX##(V_0e14!)), 2) + (FX##(A_1982!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0eaa!)   '@4107e
L_41106:
L_4110b:
    V_185e! = FX##(V_185e!) + 1.0   '@41110 DS:23c4
    RETURN   '@41126
L_41135:   ' sub-rotina (alvo de GOSUB)
    L_BP98% = (V_0de0! = 1.0 OR (V_0de8! = 1.0 OR V_0ddc! = 0.0))   '@4113a DS:23c0,23c4
    IF NOT ((A_1148!(0) < 0.0 AND V_0e74$ = "S" OR L_BP98%) <> 0) THEN GOTO L_411e3   '@4119a DS:23c0,23c8
    GOTO L_41587   '@411db
L_411e3:
    IF NOT (V_18b2! <= 0.0) THEN GOTO L_41206   '@411e3 DS:23c0
    GOTO L_41587   '@411fe
L_41206:
    V_185e! = FX##(V_185e!) + 1.0   '@41206 DS:23c4
    L_BP0e! = 1.0   '@4121c DS:23c4
    GOSUB L_41a0a   '@4122c
    A_1af2!(RT_CINT%(FX##(V_185e!)), 1) = V_0e44!   '@41239
    GOSUB L_4f8cf   '@41264
    L_BP0e! = V_0e44!   '@41271
    GOSUB L_41cf5   '@41281
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = INT(FX##(A_1a0c!(1, 0)) - V_0e20! + (RT_LEFT$((A_1954$(0)), (1)) = "P") * (FX##(A_1a0c!(1, 0)) - A_1982!(0, 1) - A_1982!(0, 2)))   '@4128e DS:23da
    L_BP9c! = FX##(A_1af2!(RT_CINT%(FX##(V_185e!)), 1)) * 2.0 + A_1232!(1, 1)   '@41347 DS:23e0
    CALL MIXT_082a_Maior(V_0e20!, L_BP9c!, L_BPa0!)   '@4138c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = INT(FX##(A_1a0c!(1, 0)) + L_BPa0!)   '@4139f
    L_BPa4! = (FX##(A_1232!(1, 1)) - V_0ea6!) * A_1232!(1, 0) * V_18b2! / L_BP0e!   '@413e3
    L_BPa8! = FX##(A_128e!(1, 6)) / L_BP0e!   '@41429
    CALL MIXT_0877_Menor(L_BPa4!, L_BPa8!, L_BPac!)   '@4144c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = RT_CINT%(FX##(L_BPac!))   '@41461
    L_BPb0! = A_1af2!(RT_CINT%(FX##(V_185e!)), 0)   '@4148f
    L_BPb4! = 2 - (A_1232!(1, 0) > V_0f3e!) * 2 - (A_1232!(1, 0) > V_0f42!) * 2   '@414ba
    CALL MIXT_082a_Maior(L_BPb0!, L_BPb4!, L_BPb8!)   '@41524
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = L_BPb0!   '@41539
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = L_BPb8!   '@4155e
L_41587:
    L_BPba% = (V_0de4! = 1.0 OR (V_0dec! = 1.0 OR V_0ddc! = 0.0))   '@4158c DS:23c0,23c4
    IF NOT ((A_1148!(1) < 0.0 AND V_0e74$ = "S" OR L_BPba%) <> 0) THEN GOTO L_41633   '@415ec DS:23c0,23c8
    GOTO L_419f6   '@4162b
L_41633:
    IF NOT (V_18b2! <= 0.0) THEN GOTO L_41656   '@41633 DS:23c0
    GOTO L_419f6   '@4164e
L_41656:
    V_185e! = FX##(V_185e!) + 1.0   '@41656 DS:23c4
    L_BP0e! = V_0ddc!   '@4166c
    GOSUB L_41a0a   '@4167c
    A_1af2!(RT_CINT%(FX##(V_185e!)), 1) = V_0e44!   '@41689
    GOSUB L_4f8cf   '@416b4
    L_BP0e! = V_0e44!   '@416c1
    GOSUB L_41cf5   '@416d1
    L_BPbe! = FX##(A_1af2!(RT_CINT%(FX##(V_185e!)), 1)) * 2.0 + A_1232!(RT_CINT%(FX##(V_0ddc!)), 1)   '@416de DS:23e0
    CALL MIXT_082a_Maior(V_0e20!, L_BPbe!, L_BPc2!)   '@4172d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) - L_BPc2!)   '@41741
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = INT(V_0e20! - FX##(RT_LEFT$((A_1954$(RT_CINT%(FX##(V_0ddc!)))), (1)) = "P") * A_1982!(RT_CINT%(FX##(V_0ddc!)), 2) + A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1))   '@41789 DS:23da
    L_BPc6! = (FX##(A_1232!(RT_CINT%(FX##(V_0ddc!)), 1)) - V_0ea6!) * A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) * V_18b2! / L_BP0e!   '@4182c
    L_BPca! = FX##(A_128e!(RT_CINT%(FX##(V_0ddc!)), 6)) / L_BP0e!   '@41884
    CALL MIXT_0877_Menor(L_BPc6!, L_BPca!, L_BPce!)   '@418ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = RT_CINT%(FX##(L_BPce!))   '@418c2
    L_BPd2! = A_1af2!(RT_CINT%(FX##(V_185e!)), 0)   '@418f0
    L_BPd6! = 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f42!) * 2   '@4191b
    CALL MIXT_082a_Maior(L_BPd2!, L_BPd6!, L_BPda!)   '@41993
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = L_BPd2!   '@419a8
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = L_BPda!   '@419cd
L_419f6:
    RETURN   '@419fb
L_41a0a:   ' sub-rotina (alvo de GOSUB)
    V_0e44! = V_0ece!   '@41a0f
    IF NOT (V_0f2a! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) > A_1d1a!(4)) THEN GOTO L_41a97   '@41a20 DS:23c0
    V_0e44! = V_0f02!   '@41a86
L_41a97:
    IF NOT (V_0f26! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) <= A_1d1a!(4)) THEN GOTO L_41b0e   '@41a97 DS:23c0
    V_0e44! = V_0efe!   '@41afd
L_41b0e:
    IF NOT (V_0f22! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) <= A_1d1a!(3)) THEN GOTO L_41b85   '@41b0e DS:23c0
    V_0e44! = V_0efa!   '@41b74
L_41b85:
    IF NOT (V_0f1e! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) <= A_1d1a!(2)) THEN GOTO L_41bfc   '@41b85 DS:23c0
    V_0e44! = V_0ef6!   '@41beb
L_41bfc:
    IF NOT (V_0f1a! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) <= A_1d1a!(1)) THEN GOTO L_41c70   '@41bfc DS:23c0
    V_0e44! = V_0ef2!   '@41c5f
L_41c70:
    IF NOT (V_0f16! > 0.0 AND A_1232!(RT_CINT%(FX##(L_BP0e!)), 1) <= A_1d1a!(0)) THEN GOTO L_41ce6   '@41c70 DS:23c0
    V_0e44! = V_0eee!   '@41cd5
L_41ce6:
    RETURN   '@41ce6
L_41cf5:   ' sub-rotina (alvo de GOSUB)
    L_BPde! = V_18ae!   '@41cfa
    IF NOT (L_BPde! < 0.0) THEN GOTO L_41d42   '@41d0b DS:23c0
    V_0e20! = -V_18ae!   '@41d26
    GOTO L_41e17   '@41d3a
L_41d42:
    IF NOT (L_BPde! > 100.0) THEN GOTO L_41d9a   '@41d43 DS:23d6
    V_0e20! = (FX##(V_18ae!) - 100.0) * A_1af2!(RT_CINT%(FX##(V_185e!)), 1) / 10.0   '@41d58 DS:23e4,23e8
    GOTO L_41e17   '@41d92
L_41d9a:
    V_0e20! = INT(A_1af2!(RT_CINT%(FX##(V_185e!)), 1) / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * V_18ae!)   '@41d9a DS:23ec,23f0,23f4,23f8
L_41e17:
    RETURN   '@41e17
L_41e26:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    REDIM A_1ac4!(-32768 TO -32768, -32768 TO -32768)   '@41e2b
    REDIM A_1ac4!(0 TO 60, 0 TO 3)   '@41e39
    V_1866! = 0.0   '@41e5d DS:23c0
    L_BPe2! = V_0ddc!   '@41e6e
    FOR V_0e14! = 1.0 TO L_BPe2!   '@41e80 DS:23c4
    L_BP12! = 0.0   '@41e88 DS:23c0
    L_BP1e% = 0   '@41e98
    L_BPe6! = A_12ea!(RT_CINT%(FX##(V_0e14!)), 0, 0)   '@41ea2
    FOR V_0e28! = 1.0 TO L_BPe6!   '@41ece DS:23c4
    V_0ee2! = FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)   '@41ed6
    V_0e92! = A_1232!(RT_CINT%(FX##(V_0e14!)), 0)   '@41f1c
    GOSUB L_4f64e   '@41f46
    V_1866! = FX##(V_1866!) + 1.0   '@41f53 DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 0) = V_0e44!   '@41f69
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) = A_128e!(RT_CINT%(FX##(V_0e14!)), 1)   '@41f93
    IF NOT (L_BP1e% >= A_128e!(RT_CINT%(FX##(V_0e14!)), 0) AND A_128e!(RT_CINT%(FX##(V_0e14!)), 2) > 0.0) THEN GOTO L_42092   '@41fd8 DS:23c0
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) = A_128e!(RT_CINT%(FX##(V_0e14!)), 3)   '@4204d
L_42092:
    GOSUB L_4320c   '@42092
    L_BP1e% = RT_CINT%(FX##(L_BP1e%) + V_0e44!)   '@4209f
    L_BPea! = 13.0   '@420b9 DS:23d2
    CALL MIXT_0877_Menor(V_0e28!, L_BPea!, L_BPee!)   '@420ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - A_19de!(RT_CINT%(FX##(V_0e14!))) + FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BPee!)), 1)) * 100.0   '@420de DS:23d6
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) > FX##(V_0e20!)) THEN GOTO L_421fc   '@42166
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - V_0e20!   '@421b6
L_421fc:
    L_BPf2! = 13.0   '@421fc DS:23d2
    CALL MIXT_0877_Menor(V_0e28!, L_BPf2!, L_BPf6!)   '@4220d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - A_19de!(RT_CINT%(FX##(V_0e14!))) + FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BPf6!)), 2)) * 100.0   '@42221 DS:23d6
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_1866!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) > FX##(V_0e20!)) THEN GOTO L_4234a   '@422ac
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + V_0e20!   '@42300
L_4234a:
    IF NOT (FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 6)) / 3.0 >= FX##(L_BP12!)) THEN GOTO L_424b2   '@4234a DS:23fc
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) THEN GOTO L_42414   '@42383
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) - 1.0   '@423ce DS:23ce
L_42414:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) THEN GOTO L_424ad   '@42414
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) + 1.0   '@42463 DS:23c4
L_424ad:
L_424b2:
    V_0e44! = A_1ac4!(RT_CINT%(FX##(V_1866!)), 1)   '@424b2
    GOSUB L_4f8cf   '@424dd
    L_BP12! = FX##(A_1ac4!(RT_CINT%(FX##(V_1866!)), 0)) * V_0e44! + L_BP12!   '@424ea
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = INT(FX##(A_1ac4!(RT_CINT%(FX##(V_1866!)), 2)))   '@4251c
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = INT(FX##(A_1ac4!(RT_CINT%(FX##(V_1866!)), 3)))   '@42562
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@425ae DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@425da DS:23c4
    IF NOT (V_0de4! = 0.0 AND V_0de0! = 0.0) THEN GOTO L_4264e   '@42606 DS:23c0
    RETURN   '@42644
L_4264e:
    L_BPfa! = V_1866!   '@4264e
    FOR V_0e14! = 1.0 TO L_BPfa!   '@42660 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) > 1.0 AND (V_0de4! = 1.0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1))) THEN GOTO L_42725   '@42668 DS:23c4
    GOSUB L_428ee   '@42710
    GOTO L_42751   '@4271d
L_42725:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@42725 DS:23c4
L_42751:
    IF NOT (V_0de4! = 1.0 AND V_0ddc! = 0.0) THEN GOTO L_4279c   '@42751 DS:23c0,23c4
    GOSUB L_42bd6   '@4278f
L_4279c:
    L_BPfe! = V_1866!   '@4279c
    FOR V_0e14! = 1.0 TO L_BPfe!   '@427ae DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) > 1.0 AND (V_0de0! = 1.0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_1a0c!(1, 0))) THEN GOTO L_42868   '@427b6 DS:23c4
    GOSUB L_42ddc   '@42853
    GOTO L_42894   '@42860
L_42868:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@42868 DS:23c4
L_42894:
    IF NOT (V_0de0! = 1.0 AND V_0ddc! = 0.0) THEN GOTO L_428df   '@42894 DS:23c0,23c4
    GOSUB L_43041   '@428d2
L_428df:
    RETURN   '@428df
L_428ee:   ' sub-rotina (alvo de GOSUB)
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > FX##(V_187e!) OR FX##(A_19b0!(RT_CINT%(FX##(V_0ddc!)))) + A_1232!(RT_CINT%(FX##(V_0ddc!)), 1) <> FX##(A_19b0!(RT_CINT%(FX##(V_0ddc!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) THEN GOTO L_429ef   '@428f3 DS:23c4
    GOTO L_42bd6   '@429e7
L_429ef:
    L_BP100% = (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f42!) * 2 AND (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) < V_0f02! AND A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) = A_1232!(RT_CINT%(FX##(V_0ddc!) + 1.0), 0)))   '@429ef DS:23c4,2400
    IF NOT ((VAL(A_13d0$(RT_CINT%(FX##(V_0ddc!)))) = 0.0# AND L_BP100%) <> 0) THEN GOTO L_42bd1   '@42b45
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! - 1.0)   '@42b67 DS:23c4,23ce
    RETURN   '@42bc2
L_42bd1:
L_42bd6:   ' sub-rotina (alvo de GOSUB)
    V_1866! = FX##(V_1866!) + 1.0   '@42bdb DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 0) = 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f3e!) * 2 - (A_1232!(RT_CINT%(FX##(V_0ddc!)), 0) > V_0f42!) * 2   '@42bf1
    CALL MIXT_082a_Maior(V_0ece!, V_0ef6!, L_BP104!)   '@42c88
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) = L_BP104!   '@42ca0
    L_BP108! = FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!)), 1)) + V_0eaa!   '@42cc5
    L_BP10c! = FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 0)) - RT_CINT%(FX##(V_18d2!) * V_0ece! / 10.0)   '@42cf6 DS:23c4,23e8
    CALL MIXT_082a_Maior(L_BP108!, L_BP10c!, L_BP110!)   '@42d3b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = L_BP110!   '@42d50
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = INT(FX##(A_1a0c!(RT_CINT%(FX##(V_0ddc!) + 1.0), 1)) - V_0eaa! - 1.0)   '@42d72 DS:23c4,23ce
    RETURN   '@42dcd
L_42ddc:   ' sub-rotina (alvo de GOSUB)
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(0, 0) - V_0eaa! > FX##(V_187e!) OR FX##(A_19b0!(0)) + A_1232!(0, 1) <> FX##(A_19b0!(1)) + A_1232!(1, 1)) THEN GOTO L_42e9f   '@42de1
    GOTO L_43041   '@42e97
L_42e9f:
    L_BP112% = (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = 2 - (A_1232!(0, 0) > V_0f3e!) * 2 - (A_1232!(0, 0) > V_0f42!) * 2 AND (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) < V_0f02! AND A_1232!(0, 0) = A_1232!(1, 0)))   '@42e9f DS:2400
    IF NOT ((VAL(A_13d0$(0)) = 0.0# AND L_BP112%) <> 0) THEN GOTO L_4303c   '@42fc3
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = INT(FX##(A_1a0c!(0, 0)) + V_0eaa! + 1.0)   '@42fe5 DS:23c4
    RETURN   '@4302d
L_4303c:
L_43041:   ' sub-rotina (alvo de GOSUB)
    V_1866! = FX##(V_1866!) + 1.0   '@43046 DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 0) = 2 - (A_1232!(0, 0) > V_0f3e!) * 2 - (A_1232!(0, 0) > V_0f42!) * 2   '@4305c
    CALL MIXT_082a_Maior(V_0ece!, V_0ef6!, L_BP116!)   '@430df
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) = L_BP116!   '@430f7
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = INT(FX##(A_1a0c!(0, 0)) + V_0eaa! + 1.0)   '@4311c DS:23c4
    L_BP11a! = FX##(A_1a0c!(1, 0)) - V_0eaa!   '@43164
    L_BP11e! = FX##(RT_CINT%(FX##(V_18d2!) * V_0ece! / 10.0)) + A_1a0c!(0, 1)   '@4318d DS:23e8
    CALL MIXT_0877_Menor(L_BP11a!, L_BP11e!, L_BP122!)   '@431c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = L_BP122!   '@431d8
    RETURN   '@431fd
L_4320c:   ' sub-rotina (alvo de GOSUB)
    L_BP126! = V_18aa!   '@43211
    IF NOT (L_BP126! < 0.0) THEN GOTO L_43259   '@43222 DS:23c0
    V_0e20! = -V_18aa!   '@4323d
    GOTO L_4332e   '@43251
L_43259:
    IF NOT (L_BP126! > 100.0) THEN GOTO L_432b1   '@4325a DS:23d6
    V_0e20! = (FX##(V_18aa!) - 100.0) * A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) / 10.0   '@4326f DS:23e4,23e8
    GOTO L_4332e   '@432a9
L_432b1:
    V_0e20! = INT(A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * V_18aa!)   '@432b1 DS:23ec,23f0,23f4,23f8
L_4332e:
    RETURN   '@4332e
L_4333d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    REDIM A_1b20!(-32768 TO -32768, -32768 TO -32768)   '@43342
    REDIM A_1b20!(0 TO 60, 0 TO 2)   '@43350
    L_BP12a! = V_1866!   '@43374
    FOR V_0e14! = 1.0 TO L_BP12a!   '@43386 DS:23c4
    L_BP0e! = RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)))   '@4338e
    L_BP1c! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)   '@433c2
    L_BP12e! = FX##(V_0ddc!) + V_0de4!   '@433ec
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP12e!   '@43403 DS:23c4
    V_0e20! = RT_CINT%(A_1232!(RT_CINT%(FX##(V_0e28!)), 1) - 2.0 * FX##(V_0ea6!))   '@43410 DS:23e0
    L_BP132! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), 2)) * 1.0   '@43452 DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP132!, L_BP136!)   '@43586
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = L_BP136!   '@4359a
    L_BP13a! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), 3)) * 1.0   '@435a5 DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP13a!, L_BP13e!)   '@436d9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = L_BP13e!   '@436ed
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa! AND V_0e28! = 0.0) THEN GOTO L_437e2   '@436f8 DS:23c0
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa!   '@4376d
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e44!   '@437b3
L_437e2:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa! AND FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_438da   '@437e2 DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa!   '@43860
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e44!   '@438aa
L_438da:
    IF NOT (V_0de0! = 0.0 AND V_0e28! = 1.0) THEN GOTO L_43a28   '@438da DS:23c0,23c4
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!) THEN GOTO L_43a23   '@43918 DS:23ce
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@4398b DS:23ce
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e44!   '@439f4
L_43a23:
L_43a28:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND (V_0de4! = 0.0 AND V_0e28! = V_0ddc!)) THEN GOTO L_43b72   '@43a28 DS:23c0
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@43ada
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e44!   '@43b42
L_43b72:
    IF NOT (V_0e28! = 0.0 OR V_0de0! = 0.0 AND V_0e28! = 1.0) THEN GOTO L_43bd3   '@43b72 DS:23c0,23c4
    GOTO L_43e77   '@43bcb
L_43bd3:
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) >= FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_43c6a   '@43bd3 DS:23ce
    GOTO L_43e77   '@43c62
L_43c6a:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) - 1.0), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) + 1.0 >= FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_43d5a   '@43c6a DS:23c4,23ce
    GOTO L_43e77   '@43d52
L_43d5a:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) - 1.0), 1)) + V_0eaa!) THEN GOTO L_43e72   '@43d5a DS:23ce
    L_BP142! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) + L_BP0e!   '@43db0
    L_BP146! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) - 1.0), 1)) + V_0eaa!   '@43ddd DS:23ce
    CALL MIXT_082a_Maior(L_BP142!, L_BP146!, L_BP14a!)   '@43e0c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP14a!   '@43e21
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e20!   '@43e43
L_43e72:
L_43e77:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!) OR V_0de4! = 0.0 AND V_0e28! = V_0ddc!) THEN GOTO L_43ee2   '@43e7c DS:23c0,23c4
    GOTO L_441c6   '@43eda
L_43ee2:
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) <= FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) + 1.0), 1)) THEN GOTO L_43f79   '@43ee2 DS:23c4
    GOTO L_441c6   '@43f71
L_43f79:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) + 1.0 >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) OR A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_4406d   '@43f79 DS:23c4
    GOTO L_441c6   '@44065
L_4406d:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_441c1   '@4406d
    L_BP14e! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!   '@440df
    L_BP152! = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@4410f
    CALL MIXT_0877_Menor(L_BP14e!, L_BP152!, L_BP156!)   '@44157
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP156!   '@4416c
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e20!   '@44191
L_441c1:
L_441c6:
    IF NOT (V_0e28! > 0.0) THEN GOTO L_44518   '@441cb DS:23c0
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0 AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_44513   '@441e6 DS:23e8
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) <= FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) AND 1.0 - FX##(V_0de0!) < FX##(V_0e28!) OR FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! >= FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0) THEN GOTO L_44442   '@442b2 DS:23c4,23ce,23e8
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0   '@443cd DS:23e8
    GOTO L_4450e   '@4443a
L_44442:
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@44442 DS:23ce
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0) THEN GOTO L_44509   '@444ab DS:23c0
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e20!   '@444df
L_44509:
L_4450e:
L_44513:
L_44518:
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e28!)) THEN GOTO L_4486c   '@44518 DS:23c4
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) < FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0 + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_44867   '@44538 DS:23e8
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) <= FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) + 1.0), 1) AND FX##(V_0ddc!) + V_0de4! > FX##(V_0e28!) OR FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! >= FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0) THEN GOTO L_44795   '@44609 DS:23c4,23e8
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1)) * V_18d2! / 10.0 + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@4471f DS:23e8
    GOTO L_44862   '@4478d
L_44795:
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@44795
    IF NOT (A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = 0.0) THEN GOTO L_4485d   '@447fd DS:23c0
    A_1b20!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e20!   '@44832
L_4485d:
L_44862:
L_44867:
L_4486c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4486c DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@44898 DS:23c4
    GOSUB L_448e0   '@448c4
    RETURN   '@448d1
L_448e0:   ' sub-rotina (alvo de GOSUB)
    REDIM A_1baa!(-32768 TO -32768, -32768 TO -32768)   '@448e5
    REDIM A_1baa!(0 TO 10, 0 TO 5)   '@448f3
    V_1876! = 0.0   '@44917 DS:23c0
    L_BP158% = (V_1912$ = "N")   '@44928 DS:2408
    IF NOT ((V_1916$ = "N" AND L_BP158%) <> 0) THEN GOTO L_4496e   '@4494e DS:2408
    RETURN   '@44964
L_4496e:
    L_BP15c! = V_0ddc!   '@4496e
    FOR V_0e28! = 1.0 TO L_BP15c!   '@44980 DS:23c4
    L_BP160! = A_1796!(RT_CINT%(FX##(V_0e28!)), 0) / (2.0 * FX##(V_0ec6!) * V_0ebe!) * V_0fa6! * V_0f62! * V_0f66!   '@44988 DS:23e0
    L_BP164! = FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0   '@449d4 DS:23fc
    L_BP168! = (FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0ea6!) * A_1232!(RT_CINT%(FX##(V_0e28!)), 0) * V_18a2! / 3.0   '@449ff DS:23fc
    CALL MIXT_082a_Maior(L_BP164!, L_BP168!, L_BP16c!)   '@44a51
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP160!, L_BP16c!, L_BP170!)   '@44a65
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = L_BP170!   '@44a7a
    L_BP12! = 0.0   '@44a85 DS:23c0
    L_BP0e! = 0.0   '@44a95 DS:23c0
    L_BP174! = V_1866!   '@44aa5
    FOR V_0e18! = 1.0 TO L_BP174!   '@44ab7 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_44b69   '@44abe
    GOTO L_44ed7   '@44b61
L_44b69:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) THEN GOTO L_44c78   '@44b69 DS:23ce
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) < FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - 5.0 + A_19b0!(RT_CINT%(FX##(V_0e28!)))) THEN GOTO L_44c73   '@44bd7 DS:23ce,240e
    GOTO L_44ed7   '@44c6b
L_44c73:
L_44c78:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@44c78
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@44ca3
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@44d83
    L_BP178! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@44e63
    CALL MIXT_082a_Maior(L_BP0e!, L_BP178!, L_BP17c!)   '@44e8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1) = L_BP178!   '@44ea2
    L_BP0e! = L_BP17c!   '@44ec8
L_44ed7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@44edc DS:23c4
    IF NOT (L_BP0e! <= V_0efa!) THEN GOTO L_44f2a   '@44f08
    GOTO L_4522b   '@44f22
L_44f2a:
    IF NOT (L_BP12! < V_0e44!) THEN GOTO L_44f51   '@44f2a
    GOSUB L_45b0c   '@44f44
L_44f51:
    L_BP180! = 0.3300000131130218505859375##   '@44f51 DS:2412
    L_BP184! = FX##(V_0e44!) / L_BP12!   '@44f63
    CALL MIXT_082a_Maior(L_BP180!, L_BP184!, L_BP188!)   '@44f72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * L_BP188! - L_BP0e!   '@44f87 DS:23ec,23f0,23f4,23f8
    L_BP18c! = L_BP0e! * 1.35000002384185791015625##   '@44fda DS:2416
    L_BP190! = 6.0   '@44ff0 DS:241a
    CALL MIXT_082a_Maior(L_BP18c!, L_BP190!, L_BP194!)   '@44ffb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP194!, L_BP198!)   '@4500f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP198!   '@45023
    IF NOT (FX##(L_BP16!) + L_BP0e! <= FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! AND V_1916$ = "S") THEN GOTO L_4509c   '@4502d DS:23c8,23ce
    GOSUB L_4634e   '@4508f
L_4509c:
    L_BP19a% = (FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! < FX##(L_BP16!) OR L_BP12! < V_0e44!)   '@4509c DS:23ce
    IF NOT ((V_1912$ = "S" AND L_BP19a%) <> 0) THEN GOTO L_45226   '@45104 DS:23c8
    IF NOT (V_0de0! = 1.0 AND V_0e28! = 1.0 OR V_0e28! > 1.0) THEN GOTO L_45214   '@4511a DS:23c4
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) >= FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - 5.0 + A_19b0!(RT_CINT%(FX##(V_0e28!)))) THEN GOTO L_4520f   '@45173 DS:23ce,240e
    GOTO L_4522b   '@45207
L_4520f:
L_45214:
    GOSUB L_465af   '@45214
L_45226:
L_4522b:
    L_BP19e! = A_1796!(RT_CINT%(FX##(V_0e28!)), 1) / (2.0 * FX##(V_0ec6!) * V_0ebe!) * V_0fa6! * V_0f62! * V_0f66!   '@45230 DS:23e0
    L_BP1a2! = FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0   '@4527d DS:23fc
    L_BP1a6! = (FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0ea6!) * A_1232!(RT_CINT%(FX##(V_0e28!)), 0) * V_18a2! / 3.0   '@452a8 DS:23fc
    CALL MIXT_082a_Maior(L_BP1a2!, L_BP1a6!, L_BP1aa!)   '@452fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP19e!, L_BP1aa!, L_BP1ae!)   '@4530e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = L_BP1ae!   '@45323
    L_BP12! = 0.0   '@4532e DS:23c0
    L_BP0e! = 0.0   '@4533e DS:23c0
    L_BP1b2! = V_1866!   '@4534e
    FOR V_0e18! = 1.0 TO L_BP1b2!   '@45360 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) OR A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_45415   '@45368
    GOTO L_45782   '@4540d
L_45415:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_45523   '@45415
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) > FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) + 1.0), 1) + 5.0) THEN GOTO L_4551e   '@45482 DS:23c4,241e
    GOTO L_45782   '@45516
L_4551e:
L_45523:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@45523
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@4554e
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@4562e
    L_BP1b6! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@4570e
    CALL MIXT_082a_Maior(L_BP0e!, L_BP1b6!, L_BP1ba!)   '@45739
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1) = L_BP1b6!   '@4574d
    L_BP0e! = L_BP1ba!   '@45773
L_45782:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@45787 DS:23c4
    IF NOT (L_BP0e! <= V_0efa!) THEN GOTO L_457d5   '@457b3
    GOTO L_45acc   '@457cd
L_457d5:
    IF NOT (L_BP12! < V_0e44!) THEN GOTO L_457fc   '@457d5
    GOSUB L_46ad0   '@457ef
L_457fc:
    L_BP1be! = 0.3300000131130218505859375##   '@457fc DS:2412
    L_BP1c2! = FX##(V_0e44!) / L_BP12!   '@4580e
    CALL MIXT_082a_Maior(L_BP1be!, L_BP1c2!, L_BP1c6!)   '@4581d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * L_BP1c6! - L_BP0e!   '@45832 DS:23ec,23f0,23f4,23f8
    L_BP1ca! = L_BP0e! * 1.35000002384185791015625##   '@45885 DS:2416
    L_BP1ce! = 6.0   '@4589b DS:241a
    CALL MIXT_082a_Maior(L_BP1ca!, L_BP1ce!, L_BP1d2!)   '@458a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP1d2!, L_BP1d6!)   '@458ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP1d6!   '@458ce
    IF NOT (FX##(L_BP16!) + L_BP0e! <= FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! AND V_1916$ = "S") THEN GOTO L_45942   '@458d8 DS:23c8
    GOSUB L_4730f   '@45935
L_45942:
    L_BP1d8% = (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! < FX##(L_BP16!) OR L_BP12! < V_0e44!)   '@45942
    IF NOT ((V_1912$ = "S" AND L_BP1d8%) <> 0) THEN GOTO L_45ac7   '@459a5 DS:23c8
    IF NOT (V_0de4! = 1.0 AND V_0e28! = V_0ddc! OR V_0e28! < V_0ddc!) THEN GOTO L_45ab5   '@459bb DS:23c4
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) <= FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) + 1.0), 1) + 5.0) THEN GOTO L_45ab0   '@45a14 DS:23c4,241e
    GOTO L_45acc   '@45aa8
L_45ab0:
L_45ab5:
    GOSUB L_4757c   '@45ab5
L_45ac7:
L_45acc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@45ad1 DS:23c4
    RETURN   '@45afd
L_45b0c:   ' sub-rotina (alvo de GOSUB)
    L_BP1dc! = V_1866!   '@45b11
    FOR V_0e18! = 1.0 TO L_BP1dc!   '@45b23 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) OR (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!) AND FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2)) - A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) > FX##(L_BP0e!) * 6.0)) THEN GOTO L_45c64   '@45b2a DS:23fc,241a
    GOTO L_4630e   '@45c5c
L_45c64:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) - (FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!) + A_1b20!(RT_CINT%(FX##(V_0e18!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e18!)), 1) > FX##(V_187e!) AND FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!)) THEN GOTO L_45d6a   '@45c64 DS:23ce,23fc
    GOTO L_4630e   '@45d62
L_45d6a:
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@45d6a DS:23ce
    V_0e20! = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 1) - 2.0 * FX##(V_0eaa!))   '@45dd3 DS:23e0
    L_BP1c! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@45e12
    L_BP1e0! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), (V_0e28! = 1.0) + 3)) * 1.0   '@45e3c DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP1e0!, L_BP1e4!)   '@45f89
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = L_BP1e4!   '@45f9d
    IF NOT (FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!)) THEN GOTO L_46013   '@45fa8 DS:23fc
    A_1b20!(RT_CINT%(FX##(V_0e18!)), 0) = V_0e20!   '@45fe1
    GOTO L_460fc   '@4600b
L_46013:
    L_BP1e8! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@46013 DS:23ce
    L_BP1ec! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)) * V_18d2! / 10.0)   '@46066 DS:23e8
    CALL MIXT_082a_Maior(L_BP1e8!, L_BP1ec!, L_BP1f0!)   '@460c0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) = L_BP1f0!   '@460d5
L_460fc:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@460fc
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@46127
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@46207
    IF NOT (L_BP12! >= V_0e44!) THEN GOTO L_46309   '@462e7
    GOTO L_4633f   '@46301
L_46309:
L_4630e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@46313 DS:23c4
L_4633f:
    RETURN   '@4633f
L_4634e:   ' sub-rotina (alvo de GOSUB)
    L_BP1f4! = V_1866!   '@46353
    FOR V_0e18! = 1.0 TO L_BP1f4!   '@46365 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) THEN GOTO L_46437   '@4636c DS:23ce
    GOTO L_4656f   '@4642f
L_46437:
    L_BP1f8! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2)   '@46437
    L_BP1fc! = FX##(L_BP16!) + L_BP0e!   '@46460
    L_BP200! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)) * V_18d2! / 10.0   '@4646f DS:23e8
    CALL MIXT_082a_Maior(L_BP1fc!, L_BP200!, L_BP204!)   '@4649e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP208! = A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) - INT(FX##(L_BP204!))   '@464b3
    CALL MIXT_082a_Maior(L_BP1f8!, L_BP208!, L_BP20c!)   '@464e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) = L_BP1f8!   '@464fb
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) = L_BP20c!   '@4651e
    A_1b20!(RT_CINT%(FX##(V_0e18!)), 0) = 0.0   '@46540 DS:23c0
L_4656f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@46574 DS:23c4
    RETURN   '@465a0
L_465af:   ' sub-rotina (alvo de GOSUB)
    V_1876! = FX##(V_1876!) + 1.0   '@465b4 DS:23c4
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = -(L_BP0e! <= V_0efe!) * FX##(V_0ef2!) - FX##(L_BP0e! > V_0efe! AND L_BP0e! <= V_0f06!) * V_0ef6! - FX##(L_BP0e! > V_0f06!) * V_0efa!   '@465ca
    IF NOT (V_0f1a! = 0.0 AND A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef2!) THEN GOTO L_466f5   '@46672 DS:23c0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef6!   '@466ca
L_466f5:
    IF NOT (V_0f1e! = 0.0 AND A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef6!) THEN GOTO L_46778   '@466f5 DS:23c0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0efa!   '@4674d
L_46778:
    V_0e20! = A_1baa!(RT_CINT%(FX##(V_1876!)), 1)   '@46778
    V_0e20! = -(V_0e20! = V_0ef2!) * FX##(V_0f1a!) - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22!   '@467a3
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0ec6!) * V_0eba! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ec6! * V_0ebe! * 1000.0   '@4681a DS:23ec,23f0,23f4,23f8
    L_BP210! = 1.0   '@4686a DS:23c4
    L_BP214! = (L_BP16! / (FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! + L_BP0e!) * V_0e44! - L_BP12!) / (FX##(V_0e20!) * 2.0)   '@4687c DS:23ce,23e0
    CALL MIXT_082a_Maior(L_BP210!, L_BP214!, L_BP218!)   '@468cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 0) = INT(FX##(L_BP218!))   '@468e0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@4690b DS:23ce
    L_BP21c! = FX##(RT_CINT%(FX##(A_1baa!(RT_CINT%(FX##(V_1876!)), 1)) * 7.5)) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)   '@46974 DS:2422
    L_BP220! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa!   '@469cd
    CALL MIXT_0877_Menor(L_BP21c!, L_BP220!, L_BP224!)   '@469f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 3) = L_BP224!   '@46a0c
    A_1baa!(RT_CINT%(FX##(V_1876!)), 4) = 0.0   '@46a31 DS:23c0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@46a5c DS:23e0,241e
    RETURN   '@46ac1
L_46ad0:   ' sub-rotina (alvo de GOSUB)
    L_BP228! = V_1866!   '@46ad5
    FOR V_0e18! = 1.0 TO L_BP228!   '@46ae7 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) OR FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!) AND FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) > FX##(L_BP0e!) * 6.0)) THEN GOTO L_46c32   '@46aee DS:23fc,241a
    GOTO L_472cf   '@46c2a
L_46c32:
    IF NOT (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! - A_1ac4!(RT_CINT%(FX##(V_0e18!)), 2) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) + A_1b20!(RT_CINT%(FX##(V_0e18!)), 0) + A_1b20!(RT_CINT%(FX##(V_0e18!)), 1) > FX##(V_187e!) AND FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!)) THEN GOTO L_46d2e   '@46c32 DS:23fc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4656f   '@46d26
L_46d2e:
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@46d2e
    V_0e20! = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 1) - 2.0 * FX##(V_0eaa!))   '@46d96 DS:23e0
    L_BP1c! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@46dd5
    L_BP22c! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), (V_0e28! = V_0ddc!) + 3)) * 1.0   '@46dff DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP22c!, L_BP230!)   '@46f4c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = L_BP230!   '@46f60
    IF NOT (FX##(A_128e!(RT_CINT%(FX##(V_0e28!)), 6)) / 3.0 <= FX##(L_BP12!)) THEN GOTO L_46fd7   '@46f6b DS:23fc
    A_1b20!(RT_CINT%(FX##(V_0e18!)), 1) = V_0e20!   '@46fa4
    GOTO L_470bd   '@46fcf
L_46fd7:
    L_BP234! = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@46fd7
    L_BP238! = FX##(RT_CINT%(FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)) * V_18d2! / 10.0)) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@47026 DS:23e8
    CALL MIXT_0877_Menor(L_BP234!, L_BP238!, L_BP23c!)   '@4707e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) = L_BP23c!   '@47093
L_470bd:
    V_0e20! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)   '@470bd
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@470e8
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1ac4!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@471c8
    IF NOT (L_BP12! >= V_0e44!) THEN GOTO L_472ca   '@472a8
    GOTO L_47300   '@472c2
L_472ca:
L_472cf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@472d4 DS:23c4
L_47300:
    RETURN   '@47300
L_4730f:   ' sub-rotina (alvo de GOSUB)
    L_BP240! = V_1866!   '@47314
    FOR V_0e18! = 1.0 TO L_BP240!   '@47326 DS:23c4
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_473fc   '@4732e
    GOTO L_4753c   '@473f4
L_473fc:
    L_BP244! = A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3)   '@473fc
    L_BP248! = FX##(L_BP16!) + L_BP0e!   '@47428
    L_BP24c! = FX##(A_1ac4!(RT_CINT%(FX##(V_0e18!)), 1)) * V_18d2! / 10.0   '@47437 DS:23e8
    CALL MIXT_082a_Maior(L_BP248!, L_BP24c!, L_BP250!)   '@47466
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP254! = INT(FX##(L_BP250!)) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@4747b
    CALL MIXT_0877_Menor(L_BP244!, L_BP254!, L_BP258!)   '@474ac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) = L_BP244!   '@474c1
    A_1ac4!(RT_CINT%(FX##(V_0e18!)), 3) = L_BP258!   '@474e7
    A_1b20!(RT_CINT%(FX##(V_0e18!)), 1) = 0.0   '@4750c DS:23c0
L_4753c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@47541 DS:23c4
    RETURN   '@4756d
L_4757c:   ' sub-rotina (alvo de GOSUB)
    V_1876! = FX##(V_1876!) + 1.0   '@47581 DS:23c4
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = -(L_BP0e! <= V_0efe!) * FX##(V_0ef2!) - FX##(L_BP0e! > V_0efe! AND L_BP0e! <= V_0f06!) * V_0ef6! - FX##(L_BP0e! > V_0f06!) * V_0efa!   '@47597
    IF NOT (V_0f1a! = 0.0 AND A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef2!) THEN GOTO L_476c2   '@4763f DS:23c0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef6!   '@47697
L_476c2:
    IF NOT (V_0f1e! = 0.0 AND A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0ef6!) THEN GOTO L_47745   '@476c2 DS:23c0
    A_1baa!(RT_CINT%(FX##(V_1876!)), 1) = V_0efa!   '@4771a
L_47745:
    V_0e20! = A_1baa!(RT_CINT%(FX##(V_1876!)), 1)   '@47745
    V_0e20! = -(V_0e20! = V_0ef2!) * FX##(V_0f1a!) - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22!   '@47770
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0ec6!) * V_0eba! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ec6! * V_0ebe! * 1000.0   '@477e7 DS:23ec,23f0,23f4,23f8
    L_BP25c! = 1.0   '@47837 DS:23c4
    L_BP260! = (L_BP16! / (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + L_BP0e!) * V_0e44! - L_BP12!) / (FX##(V_0e20!) * 2.0)   '@47849 DS:23e0
    CALL MIXT_082a_Maior(L_BP25c!, L_BP260!, L_BP264!)   '@47893
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 0) = INT(FX##(L_BP264!))   '@478a8
    A_1baa!(RT_CINT%(FX##(V_1876!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@478d3
    L_BP268! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - RT_CINT%(FX##(A_1baa!(RT_CINT%(FX##(V_1876!)), 1)) * 7.5)   '@4793b DS:2422
    L_BP26c! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa!   '@47998
    CALL MIXT_082a_Maior(L_BP268!, L_BP26c!, L_BP270!)   '@479c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1baa!(RT_CINT%(FX##(V_1876!)), 2) = L_BP270!   '@479d6
    A_1baa!(RT_CINT%(FX##(V_1876!)), 4) = 1.0   '@479f8 DS:23c4
    A_1baa!(RT_CINT%(FX##(V_1876!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@47a23 DS:23e0,241e
    RETURN   '@47a88
L_47a97:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    REDIM A_1b4e!(-32768 TO -32768, -32768 TO -32768)   '@47a9c
    REDIM A_1b4e!(0 TO 60, 0 TO 2)   '@47aaa
    IF NOT (V_185e! = 0.0) THEN GOTO L_47af3   '@47ace DS:23c0
    RETURN   '@47ae9
L_47af3:
    L_BP274! = V_185e!   '@47af3
    FOR V_0e14! = 1.0 TO L_BP274!   '@47b05 DS:23c4
    L_BP0e! = RT_CINT%(FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)))   '@47b0c
    L_BP1c! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 1)   '@47b40
    L_BP278! = FX##(V_0ddc!) + V_0de4!   '@47b6a
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP278!   '@47b81 DS:23c4
    V_0e20! = RT_CINT%(A_1232!(RT_CINT%(FX##(V_0e28!)), 1) - 2.0 * FX##(V_0ea6!))   '@47b8e DS:23e0
    L_BP27c! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), 0)) * 1.0   '@47bd0 DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP27c!, L_BP280!)   '@47d06
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = L_BP280!   '@47d1a
    L_BP284! = FX##(A_1c62%(-((L_BP1c! = V_0f12!) * 9 + ((L_BP1c! = V_0f0e!) * 8 + ((L_BP1c! = V_0f0a!) * 7 + ((L_BP1c! = V_0f06!) * 6 + ((L_BP1c! = V_0f02!) * 5 + ((L_BP1c! = V_0efe!) * 4 + ((L_BP1c! = V_0efa!) * 3 + ((L_BP1c! = V_0ef6!) * 2 + (L_BP1c! = V_0ef2!))))))))), 1)) * 1.0   '@47d25 DS:23c4
    CALL MIXT_0877_Menor(V_0e20!, L_BP284!, L_BP288!)   '@47e5c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e20! = L_BP288!   '@47e70
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) <= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa! AND V_0e28! = 0.0) THEN GOTO L_47f65   '@47e7b DS:23c0
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa!   '@47ef0
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e44!   '@47f36
L_47f65:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) >= FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa! AND FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_4805d   '@47f65 DS:23c4
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa!   '@47fe3
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e44!   '@4802d
L_4805d:
    IF NOT (V_0de0! = 0.0 AND V_0e28! = 1.0) THEN GOTO L_4829a   '@4805d DS:23c0,23c4
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!) THEN GOTO L_48295   '@4809b DS:23ce
    L_BP28c! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) + L_BP0e!   '@4810e
    L_BP290! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@4813b DS:23ce
    CALL MIXT_082a_Maior(L_BP28c!, L_BP290!, L_BP294!)   '@48187
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP294!   '@4819c
    L_BP296% = (V_0de8! = 0.0)   '@481be DS:23c0
    L_BP298% = (A_1148!(0) >= 0.0)   '@48211
    IF NOT (((V_0e74$ = "N" OR L_BP298%) AND L_BP296%) <> 0) THEN GOTO L_48261   '@48215 DS:2408
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e20!   '@4822f
    GOTO L_48290   '@48259
L_48261:
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e44!   '@48261
L_48290:
L_48295:
L_4829a:
    IF NOT (V_0de4! = 0.0 AND V_0e28! = V_0ddc!) THEN GOTO L_484d8   '@4829a DS:23c0
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) > FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_484d3   '@482d8
    L_BP29c! = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - L_BP0e!   '@4834a
    L_BP2a0! = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@4837a
    CALL MIXT_0877_Menor(L_BP29c!, L_BP2a0!, L_BP2a4!)   '@483c2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP2a4!   '@483d7
    L_BP2a6% = (V_0dec! = 0.0)   '@483fc DS:23c0
    L_BP2a8% = (A_1148!(1) >= 0.0)   '@4844d
    IF NOT (((V_0e74$ = "N" OR L_BP2a8%) AND L_BP2a6%) <> 0) THEN GOTO L_4849e   '@48451 DS:2408
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e20!   '@4846b
    GOTO L_484ce   '@48496
L_4849e:
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e44!   '@4849e
L_484ce:
L_484d3:
L_484d8:
    IF NOT (V_0e28! = 0.0 OR V_0de0! = 0.0 AND V_0e28! = 1.0) THEN GOTO L_48539   '@484d8 DS:23c0,23c4
    GOTO L_48791   '@48531
L_48539:
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0)) <= A_19b0!(RT_CINT%(FX##(V_0e28!)))) THEN GOTO L_4858d   '@48539 DS:23ce
    GOTO L_48791   '@48585
L_4858d:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e28!) - 1.0), 1)) THEN GOTO L_4863b   '@4858d DS:23ce
    GOTO L_48791   '@48633
L_4863b:
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) - 1.0), 1)) + V_0eaa!   '@4863b DS:23ce
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = 1.0 AND RT_MID$((A_1954$(RT_CINT%(FX##(V_0e28!) - 1.0))), (1), (1)) = "P") THEN GOTO L_48762   '@48687 DS:23c4,23ce,23da
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1982!(RT_CINT%(FX##(V_0e28!) - 1.0), 2)   '@48702 DS:23ce
L_48762:
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 0) = V_0e20!   '@48762
L_48791:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!) OR V_0de4! = 0.0 AND V_0e28! = V_0ddc!) THEN GOTO L_487fc   '@48796 DS:23c0,23c4
    GOTO L_48aae   '@487f4
L_487fc:
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!))) >= A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) THEN GOTO L_48850   '@487fc DS:23c4
    GOTO L_48aae   '@48848
L_48850:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) OR A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_48904   '@48850 DS:23c4
    GOTO L_48aae   '@488fc
L_48904:
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@48904
    IF NOT (A_1982!(RT_CINT%(FX##(V_0e28!)), 0) = 1.0 AND RT_MID$((A_1954$(RT_CINT%(FX##(V_0e28!)))), (1), (1)) = "P") THEN GOTO L_48a7e   '@4896c DS:23c4,23da
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) - (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1982!(RT_CINT%(FX##(V_0e28!)), 1) - A_1982!(RT_CINT%(FX##(V_0e28!)), 2))   '@489dd
L_48a7e:
    A_1b4e!(RT_CINT%(FX##(V_0e14!)), 1) = V_0e20!   '@48a7e
L_48aae:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@48ab3 DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@48adf DS:23c4
    GOSUB L_48b27   '@48b0b
    RETURN   '@48b18
L_48b27:   ' sub-rotina (alvo de GOSUB)
    REDIM A_1bd8!(-32768 TO -32768, -32768 TO -32768)   '@48b2c
    REDIM A_1bd8!(0 TO 10, 0 TO 5)   '@48b3a
    V_1872! = 0.0   '@48b5e DS:23c0
    IF NOT (V_1912$ = "N") THEN GOTO L_48b90   '@48b6f DS:2408
    RETURN   '@48b86
L_48b90:
    L_BP2ac! = FX##(V_0ddc!) + V_0de4!   '@48b90
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP2ac!   '@48ba7 DS:23c4
    V_0e44! = (FX##(A_1232!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0ea6!) * A_1232!(RT_CINT%(FX##(V_0e28!)), 0) * V_18b2!   '@48bb4
    IF NOT (V_0e28! = 0.0) THEN GOTO L_48c2a   '@48c07 DS:23c0
    GOTO L_49209   '@48c22
L_48c2a:
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!))) >= A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0))) THEN GOTO L_48c7e   '@48c2a DS:23ce
    GOTO L_49209   '@48c76
L_48c7e:
    L_BP12! = 0.0   '@48c7e DS:23c0
    L_BP0e! = 0.0   '@48c8e DS:23c0
    L_BP2b0! = V_185e!   '@48c9e
    FOR V_0e18! = 1.0 TO L_BP2b0!   '@48cb0 DS:23c4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR A_1af2!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_48d63   '@48cb8
    GOTO L_49084   '@48d5b
L_48d63:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e18!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) THEN GOTO L_48e25   '@48d63 DS:23ce
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!) - 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e28!)))) THEN GOTO L_48e25   '@48dd1 DS:23ce
    GOTO L_49084   '@48e1d
L_48e25:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e18!)), 1)   '@48e25
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1af2!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@48e50
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1af2!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@48f30
    L_BP2b4! = A_1af2!(RT_CINT%(FX##(V_0e18!)), 1)   '@49010
    CALL MIXT_082a_Maior(L_BP0e!, L_BP2b4!, L_BP2b8!)   '@4903b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e18!)), 1) = L_BP2b4!   '@4904f
    L_BP0e! = L_BP2b8!   '@49075
L_49084:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@49089 DS:23c4
    L_BP2bc! = 0.3300000131130218505859375##   '@490b5 DS:2412
    L_BP2c0! = FX##(V_0e44!) / L_BP12!   '@490c7
    CALL MIXT_082a_Maior(L_BP2bc!, L_BP2c0!, L_BP2c4!)   '@490d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * L_BP2c4! * 1.5 - L_BP0e!   '@490eb DS:23ec,23f0,23f4,23f8,2426
    L_BP2c8! = L_BP0e! * 1.35000002384185791015625##   '@49143 DS:2416
    L_BP2cc! = 6.0   '@49159 DS:241a
    CALL MIXT_082a_Maior(L_BP2c8!, L_BP2cc!, L_BP2d0!)   '@49164
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP2d0!, L_BP2d4!)   '@49178
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP2d4!   '@4918c
    IF NOT (FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! < FX##(L_BP16!) OR L_BP12! < V_0e44!) THEN GOTO L_49204   '@49196 DS:23ce
    GOSUB L_49856   '@491f7
L_49204:
L_49209:
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e28!)) THEN GOTO L_49236   '@4920e DS:23c4
    GOTO L_49816   '@4922e
L_49236:
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!))) >= A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) THEN GOTO L_4928a   '@49236 DS:23c4
    GOTO L_49816   '@49282
L_4928a:
    L_BP12! = 0.0   '@4928a DS:23c0
    L_BP0e! = 0.0   '@4929a DS:23c0
    L_BP2d8! = V_185e!   '@492aa
    FOR V_0e18! = 1.0 TO L_BP2d8!   '@492bc DS:23c4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e18!)), 3) <= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) OR A_1af2!(RT_CINT%(FX##(V_0e18!)), 2) >= A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) THEN GOTO L_49371   '@492c4
    GOTO L_49696   '@49369
L_49371:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e18!)), 3)) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) + A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_49437   '@49371
    IF NOT (A_19b0!(RT_CINT%(FX##(V_0e28!))) > A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) THEN GOTO L_49432   '@493de DS:23c4
    GOTO L_49696   '@4942a
L_49432:
L_49437:
    V_0e20! = A_1af2!(RT_CINT%(FX##(V_0e18!)), 1)   '@49437
    L_BP12! = (-(V_0e20! = V_0eee!) * FX##(V_0f16!) - FX##(V_0e20! = V_0ef2!) * V_0f1a! - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22! - FX##(V_0e20! = V_0efe!) * V_0f26!) * A_1af2!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@49462
    L_BP12! = (-(V_0e20! = V_0f02!) * FX##(V_0f2a!) - FX##(V_0e20! = V_0f06!) * V_0f2e! - FX##(V_0e20! = V_0f0a!) * V_0f32! - FX##(V_0e20! = V_0f0e!) * V_0f36! - FX##(V_0e20! = V_0f12!) * V_0f3a!) * A_1af2!(RT_CINT%(FX##(V_0e18!)), 0) + L_BP12!   '@49542
    L_BP2dc! = A_1af2!(RT_CINT%(FX##(V_0e18!)), 1)   '@49622
    CALL MIXT_082a_Maior(L_BP0e!, L_BP2dc!, L_BP2e0!)   '@4964d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e18!)), 1) = L_BP2dc!   '@49661
    L_BP0e! = L_BP2e0!   '@49687
L_49696:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e18!   '@4969b DS:23c4
    L_BP2e4! = 0.3300000131130218505859375##   '@496c7 DS:2412
    L_BP2e8! = FX##(V_0e44!) / L_BP12!   '@496d9
    CALL MIXT_082a_Maior(L_BP2e4!, L_BP2e8!, L_BP2ec!)   '@496e8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0eba!) * V_0ec6! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ebe! * V_0ec6! * 1000.0 * L_BP2ec! * 1.5 - L_BP0e!   '@496fd DS:23ec,23f0,23f4,23f8,2426
    L_BP2f0! = L_BP0e! * 1.35000002384185791015625##   '@49755 DS:2416
    L_BP2f4! = 6.0   '@4976b DS:241a
    CALL MIXT_082a_Maior(L_BP2f0!, L_BP2f4!, L_BP2f8!)   '@49776
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP2f8!, L_BP2fc!)   '@4978a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP2fc!   '@4979e
    IF NOT (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! < FX##(L_BP16!) OR L_BP12! < V_0e44!) THEN GOTO L_49811   '@497a8
    GOSUB L_49d77   '@49804
L_49811:
L_49816:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4981b DS:23c4
    RETURN   '@49847
L_49856:   ' sub-rotina (alvo de GOSUB)
    V_1872! = FX##(V_1872!) + 1.0   '@4985b DS:23c4
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = -(L_BP0e! <= V_0efe!) * FX##(V_0ef2!) - FX##(L_BP0e! > V_0efe! AND L_BP0e! <= V_0f06!) * V_0ef6! - FX##(L_BP0e! > V_0f06!) * V_0efa!   '@49871
    IF NOT (V_0f1a! = 0.0 AND A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef2!) THEN GOTO L_4999c   '@49919 DS:23c0
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef6!   '@49971
L_4999c:
    IF NOT (V_0f1e! = 0.0 AND A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef6!) THEN GOTO L_49a1f   '@4999c DS:23c0
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0efa!   '@499f4
L_49a1f:
    V_0e20! = A_1bd8!(RT_CINT%(FX##(V_1872!)), 1)   '@49a1f
    V_0e20! = -(V_0e20! = V_0ef2!) * FX##(V_0f1a!) - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22!   '@49a4a
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0ec6!) * V_0eba! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ec6! * V_0ebe! * 1000.0   '@49ac1 DS:23ec,23f0,23f4,23f8
    L_BP300! = 1.0   '@49b11 DS:23c4
    L_BP304! = (L_BP16! / (FX##(A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0)) - V_0eaa! + L_BP0e!) * V_0e44! - L_BP12!) / (FX##(V_0e20!) * 2.0)   '@49b23 DS:23ce,23e0
    CALL MIXT_082a_Maior(L_BP300!, L_BP304!, L_BP308!)   '@49b72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 0) = INT(FX##(L_BP308!))   '@49b87
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) + V_0eaa!   '@49bb2 DS:23ce
    L_BP30c! = FX##(RT_CINT%(FX##(A_1bd8!(RT_CINT%(FX##(V_1872!)), 1)) * 12.0)) + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)   '@49c1b DS:242a
    L_BP310! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - V_0eaa!   '@49c74
    CALL MIXT_0877_Menor(L_BP30c!, L_BP310!, L_BP314!)   '@49c9e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 3) = L_BP314!   '@49cb3
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 4) = 0.0   '@49cd8 DS:23c0
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@49d03 DS:23e0,241e
    RETURN   '@49d68
L_49d77:   ' sub-rotina (alvo de GOSUB)
    V_1872! = FX##(V_1872!) + 1.0   '@49d7c DS:23c4
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = -(L_BP0e! <= V_0efe!) * FX##(V_0ef2!) - FX##(L_BP0e! > V_0efe! AND L_BP0e! <= V_0f06!) * V_0ef6! - FX##(L_BP0e! > V_0f06!) * V_0efa!   '@49d92
    IF NOT (V_0f1a! = 0.0 AND A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef2!) THEN GOTO L_49ebd   '@49e3a DS:23c0
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef6!   '@49e92
L_49ebd:
    IF NOT (V_0f1e! = 0.0 AND A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0ef6!) THEN GOTO L_49f40   '@49ebd DS:23c0
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 1) = V_0efa!   '@49f15
L_49f40:
    V_0e20! = A_1bd8!(RT_CINT%(FX##(V_1872!)), 1)   '@49f40
    V_0e20! = -(V_0e20! = V_0ef2!) * FX##(V_0f1a!) - FX##(V_0e20! = V_0ef6!) * V_0f1e! - FX##(V_0e20! = V_0efa!) * V_0f22!   '@49f6b
    L_BP16! = L_BP0e! / (RT_POT##((FX##(V_0ec6!) * V_0eba! * 1000.0 / V_0f5e!), (0.666666686534881591796875##)) * 40.0 * V_0f66! * 0.89999997615814208984375##) * V_0ec6! * V_0ebe! * 1000.0   '@49fe2 DS:23ec,23f0,23f4,23f8
    L_BP318! = 1.0   '@4a032 DS:23c4
    L_BP31c! = (L_BP16! / (FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + L_BP0e!) * V_0e44! - L_BP12!) / (FX##(V_0e20!) * 2.0)   '@4a044 DS:23e0
    CALL MIXT_082a_Maior(L_BP318!, L_BP31c!, L_BP320!)   '@4a08e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 0) = INT(FX##(L_BP320!))   '@4a0a3
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 3) = FX##(A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) - V_0eaa! + A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)   '@4a0ce
    L_BP324! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1)) - RT_CINT%(FX##(A_1bd8!(RT_CINT%(FX##(V_1872!)), 1)) * 12.0)   '@4a136 DS:242a
    L_BP328! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) + V_0eaa!   '@4a193
    CALL MIXT_082a_Maior(L_BP324!, L_BP328!, L_BP32c!)   '@4a1bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 2) = L_BP32c!   '@4a1d1
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 4) = 1.0   '@4a1f3 DS:23c4
    A_1bd8!(RT_CINT%(FX##(V_1872!)), 5) = INT(A_1232!(RT_CINT%(FX##(V_0e28!)), 0) - 2.0 * FX##(V_0eaa!) - FX##(V_0ece!) / 5.0)   '@4a21e DS:23e0,241e
    RETURN   '@4a283
L_4a292:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    IF NOT (V_185e! = 0.0) THEN GOTO L_4a2bc   '@4a297 DS:23c0
    RETURN   '@4a2b2
L_4a2bc:
    V_0e14! = 1.0   '@4a2bc DS:23c4
L_4a2d2:
    V_0e1c! = 1.0   '@4a2d7 DS:23c4
L_4a2ed:
    L_BP330! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@4a2f2
    L_BP334! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4a31e
    CALL MIXT_082a_Maior(L_BP330!, L_BP334!, L_BP338!)   '@4a343
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP334!   '@4a358
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP330!   '@4a37e
    L_BP33c! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@4a3a4
    L_BP340! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4a3c7
    CALL MIXT_0877_Menor(L_BP33c!, L_BP340!, L_BP344!)   '@4a3e9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP340!   '@4a3fe
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP33c!   '@4a421
    IF NOT (FX##(L_BP338!) - L_BP344! > FX##(V_187e!) OR V_0e1c! = V_0e14!) THEN GOTO L_4a489   '@4a444
    GOTO L_4afb7   '@4a481
L_4a489:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 1) <> A_1af2!(RT_CINT%(FX##(V_0e1c!)), 1)) THEN GOTO L_4a4e0   '@4a489
    GOTO L_4afb7   '@4a4d8
L_4a4e0:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) THEN GOTO L_4a59c   '@4a4e0
    V_0dfc$ = "|"   '@4a582 DS:242e
    GOTO L_4ab4a   '@4a594
L_4a59c:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) OR (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) <= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) OR (FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) > FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) + 100.0 OR FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) > FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) + 100.0))) THEN GOTO L_4a788   '@4a59c DS:23d6
    GOTO L_4afb7   '@4a780
L_4a788:
    GOSUB L_4b060   '@4a788
    IF NOT (V_0dfc$ = "*") THEN GOTO L_4a7b4   '@4a795 DS:2434
    GOTO L_4afb7   '@4a7ac
L_4a7b4:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_4a809   '@4a7b4
    GOTO L_4ab4a   '@4a801
L_4a809:
    V_0e28! = V_0e14!   '@4a809
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) > A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_4a878   '@4a81a
    V_0e28! = V_0e1c!   '@4a867
L_4a878:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 0) = 1.0) THEN GOTO L_4a8b4   '@4a878 DS:23c4
    GOTO L_4afb7   '@4a8ac
L_4a8b4:
    IF NOT (V_0e28! = V_0e14!) THEN GOTO L_4a938   '@4a8b4
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)   '@4a8cf
    GOTO L_4a99e   '@4a930
L_4a938:
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)   '@4a938
L_4a99e:
    L_BP348! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@4a99e
    L_BP34c! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4a9c7
    CALL MIXT_0877_Menor(L_BP348!, L_BP34c!, L_BP350!)   '@4a9e9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP34c!   '@4a9fe
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP348!   '@4aa21
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP350!   '@4aa44
    L_BP354! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@4aa66
    L_BP358! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4aa92
    CALL MIXT_082a_Maior(L_BP354!, L_BP358!, L_BP35c!)   '@4aab7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP358!   '@4aacc
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP354!   '@4aaf2
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP35c!   '@4ab18
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a2ed   '@4ab3d
L_4ab4a:
    CALL MIXT_0877_Menor(V_0e14!, V_0e1c!, L_BP360!)   '@4ab4f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP360!   '@4ab67
    IF NOT (V_0dfc$ = "|") THEN GOTO L_4abfc   '@4ab72 DS:242e
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 0) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0)   '@4ab89
    V_0dfc$ = ""   '@4abea DS:243a
L_4abfc:
    L_BP364! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)   '@4abfc
    L_BP368! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4ac25
    CALL MIXT_0877_Menor(L_BP364!, L_BP368!, L_BP36c!)   '@4ac47
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP368!   '@4ac5c
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP364!   '@4ac7f
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP36c!   '@4aca2
    L_BP370! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@4acc4
    L_BP374! = A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4acf0
    CALL MIXT_082a_Maior(L_BP370!, L_BP374!, L_BP378!)   '@4ad15
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP374!   '@4ad2a
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP370!   '@4ad50
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP378!   '@4ad76
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP37c!)   '@4ad9b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP37c! >= V_185e!) THEN GOTO L_4add0   '@4adb3
    GOTO L_4af51   '@4adc8
L_4add0:
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP380!)   '@4add0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP384! = V_185e!   '@4ade8
    FOR V_0e28! = FX##(L_BP380!) + 1.0 TO L_BP384!   '@4adf4 DS:23c4
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)   '@4ae00 DS:23ce
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@4ae48 DS:23ce
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)   '@4ae92 DS:23ce
    A_1af2!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)   '@4aed6 DS:23ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4af20 DS:23c4
L_4af51:
    V_185e! = FX##(V_185e!) - 1.0   '@4af56 DS:23ce
    IF NOT (V_0e14! <= V_185e! AND V_0e1c! <= V_185e!) THEN GOTO L_4afb2   '@4af6c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a2ed   '@4afaa
L_4afb2:
L_4afb7:
    IF NOT (V_0e14! <= V_185e! AND V_0e1c! < V_185e!) THEN GOTO L_4b018   '@4afbc
    V_0e1c! = FX##(V_0e1c!) + 1.0   '@4affa DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a2ed   '@4b010
L_4b018:
    IF NOT (V_0e14! < V_185e!) THEN GOTO L_4b051   '@4b018
    V_0e14! = FX##(V_0e14!) + 1.0   '@4b033 DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a2d2   '@4b049
L_4b051:
    RETURN   '@4b051
L_4b060:   ' sub-rotina (alvo de GOSUB)
    V_0e28! = 0.0   '@4b065 DS:23c0
    V_0dfc$ = " "   '@4b076 DS:243e
L_4b08d:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!)), 0) AND (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!)), 0)))) THEN GOTO L_4b23e   '@4b092 DS:23c4
    V_0dfc$ = "*"   '@4b222 DS:2434
    RETURN   '@4b234
L_4b23e:
    L_BP386% = (FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!)), 0))   '@4b23e DS:23c4
    IF NOT (((A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND L_BP386% OR A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0)) - A_1926!(RT_CINT%(FX##(V_0e28!)), 0)) AND A_19b0!(RT_CINT%(FX##(V_0e28!))) <> A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) <> 0) THEN GOTO L_4b43c   '@4b3d9
    V_0dfc$ = "*"   '@4b420 DS:2434
    RETURN   '@4b432
L_4b43c:
    IF NOT (V_0e28! < V_0ddc!) THEN GOTO L_4b475   '@4b43c
    V_0e28! = FX##(V_0e28!) + 1.0   '@4b457 DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b08d   '@4b46d
L_4b475:
    RETURN   '@4b475
L_4b484:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    IF NOT (V_1866! = 0.0) THEN GOTO L_4b4ae   '@4b489 DS:23c0
    RETURN   '@4b4a4
L_4b4ae:
    V_0e14! = 1.0   '@4b4ae DS:23c4
L_4b4c4:
    V_0e1c! = 1.0   '@4b4c9 DS:23c4
L_4b4df:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 1) <> A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 1) OR V_0e1c! = V_0e14!) THEN GOTO L_4b560   '@4b4e4
    GOTO L_4c16f   '@4b558
L_4b560:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) THEN GOTO L_4b61c   '@4b560
    V_0dfc$ = "|"   '@4b602 DS:242e
    GOTO L_4bd02   '@4b614
L_4b61c:
    L_BP38a! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4b61c
    L_BP38e! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4b648
    CALL MIXT_082a_Maior(L_BP38a!, L_BP38e!, L_BP392!)   '@4b66d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP38e!   '@4b682
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP38a!   '@4b6a8
    L_BP396! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4b6ce
    L_BP39a! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4b6f1
    CALL MIXT_0877_Menor(L_BP396!, L_BP39a!, L_BP39e!)   '@4b713
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP39a!   '@4b728
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP396!   '@4b74b
    IF NOT (FX##(L_BP392!) - L_BP39e! > FX##(V_187e!)) THEN GOTO L_4b790   '@4b76e
    GOTO L_4c16f   '@4b788
L_4b790:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) <= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) >= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) OR (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) <= A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) OR (FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) > FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) + 40.0 OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) > FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) + 40.0))) THEN GOTO L_4b97c   '@4b790 DS:23f4
    GOTO L_4c16f   '@4b974
L_4b97c:
    GOSUB L_4c218   '@4b97c
    IF NOT (V_0dfc$ = "*") THEN GOTO L_4b9a8   '@4b989 DS:2434
    GOTO L_4c16f   '@4b9a0
L_4b9a8:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_4b9fd   '@4b9a8
    GOTO L_4bd02   '@4b9f5
L_4b9fd:
    V_0e28! = V_0e14!   '@4b9fd
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) > A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) THEN GOTO L_4ba6c   '@4ba0e
    V_0e28! = V_0e1c!   '@4ba5b
L_4ba6c:
    IF NOT (V_0e28! = V_0e14!) THEN GOTO L_4baf0   '@4ba6c
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)   '@4ba87
    GOTO L_4bb56   '@4bae8
L_4baf0:
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)   '@4baf0
L_4bb56:
    L_BP3a2! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4bb56
    L_BP3a6! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4bb7f
    CALL MIXT_0877_Menor(L_BP3a2!, L_BP3a6!, L_BP3aa!)   '@4bba1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP3a6!   '@4bbb6
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP3a2!   '@4bbd9
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP3aa!   '@4bbfc
    L_BP3ae! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4bc1e
    L_BP3b2! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4bc4a
    CALL MIXT_082a_Maior(L_BP3ae!, L_BP3b2!, L_BP3b6!)   '@4bc6f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP3b2!   '@4bc84
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP3ae!   '@4bcaa
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP3b6!   '@4bcd0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b4df   '@4bcf5
L_4bd02:
    CALL MIXT_0877_Menor(V_0e14!, V_0e1c!, L_BP3ba!)   '@4bd07
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e28! = L_BP3ba!   '@4bd1f
    IF NOT (V_0dfc$ = "|") THEN GOTO L_4bdb4   '@4bd2a DS:242e
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0) = FX##(A_1ac4!(RT_CINT%(FX##(V_0e14!)), 0)) + A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 0)   '@4bd41
    V_0dfc$ = ""   '@4bda2 DS:243a
L_4bdb4:
    L_BP3be! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4bdb4
    L_BP3c2! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4bddd
    CALL MIXT_0877_Menor(L_BP3be!, L_BP3c2!, L_BP3c6!)   '@4bdff
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP3c2!   '@4be14
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP3be!   '@4be37
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP3c6!   '@4be5a
    L_BP3ca! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4be7c
    L_BP3ce! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4bea8
    CALL MIXT_082a_Maior(L_BP3ca!, L_BP3ce!, L_BP3d2!)   '@4becd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP3ce!   '@4bee2
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP3ca!   '@4bf08
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP3d2!   '@4bf2e
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP3d6!)   '@4bf53
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP3d6! >= V_1866!) THEN GOTO L_4bf88   '@4bf6b
    GOTO L_4c109   '@4bf80
L_4bf88:
    CALL MIXT_082a_Maior(V_0e14!, V_0e1c!, L_BP3da!)   '@4bf88
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3de! = V_1866!   '@4bfa0
    FOR V_0e28! = FX##(L_BP3da!) + 1.0 TO L_BP3de!   '@4bfac DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 0) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)   '@4bfb8 DS:23ce
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 1) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@4c000 DS:23ce
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 2) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)   '@4c04a DS:23ce
    A_1ac4!(RT_CINT%(FX##(V_0e28!) - 1.0), 3) = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)   '@4c08e DS:23ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4c0d8 DS:23c4
L_4c109:
    V_1866! = FX##(V_1866!) - 1.0   '@4c10e DS:23ce
    IF NOT (V_0e14! <= V_1866! AND V_0e1c! <= V_1866!) THEN GOTO L_4c16a   '@4c124
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b4df   '@4c162
L_4c16a:
L_4c16f:
    IF NOT (V_0e14! <= V_1866! AND V_0e1c! < V_1866!) THEN GOTO L_4c1d0   '@4c174
    V_0e1c! = FX##(V_0e1c!) + 1.0   '@4c1b2 DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b4df   '@4c1c8
L_4c1d0:
    IF NOT (V_0e14! < V_1866!) THEN GOTO L_4c209   '@4c1d0
    V_0e14! = FX##(V_0e14!) + 1.0   '@4c1eb DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b4c4   '@4c201
L_4c209:
    RETURN   '@4c209
L_4c218:   ' sub-rotina (alvo de GOSUB)
    V_0e28! = 1.0   '@4c21d DS:23c4
    V_0dfc$ = " "   '@4c22e DS:243e
L_4c245:
    L_BP3e2! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4c24a
    L_BP3e6! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4c276
    CALL MIXT_0877_Menor(L_BP3e2!, L_BP3e6!, L_BP3ea!)   '@4c29b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP3e6!   '@4c2b0
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP3e2!   '@4c2d6
    L_BP3ee! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4c2fc
    L_BP3f2! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4c31f
    CALL MIXT_082a_Maior(L_BP3ee!, L_BP3f2!, L_BP3f6!)   '@4c341
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP3f2!   '@4c356
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP3ee!   '@4c379
    IF NOT (ABS(FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)) < FX##(L_BP3ea!) - L_BP3f6!) THEN GOTO L_4c408   '@4c39c
    V_0dfc$ = "*"   '@4c3ec DS:2434
    RETURN   '@4c3fe
L_4c408:
    L_BP3fa! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4c408
    L_BP3fe! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4c434
    CALL MIXT_0877_Menor(L_BP3fa!, L_BP3fe!, L_BP402!)   '@4c459
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP3fe!   '@4c46e
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP3fa!   '@4c494
    L_BP406! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4c4ba
    L_BP40a! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4c4dd
    CALL MIXT_082a_Maior(L_BP406!, L_BP40a!, L_BP40e!)   '@4c4ff
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP40a!   '@4c514
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP406!   '@4c537
    IF NOT (ABS(FX##(A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)) - A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)) < FX##(L_BP402!) - L_BP40e!) THEN GOTO L_4c5cc   '@4c55a
    V_0dfc$ = "*"   '@4c5b0 DS:2434
    RETURN   '@4c5c2
L_4c5cc:
    IF NOT (A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0) OR A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) < A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) AND A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) > A_1a0c!(RT_CINT%(FX##(V_0e28!)), 0)) THEN GOTO L_4c72a   '@4c5cc
    V_0dfc$ = "*"   '@4c70e DS:2434
    RETURN   '@4c720
L_4c72a:
    IF NOT (V_0e28! < V_0ddc!) THEN GOTO L_4c763   '@4c72a
    V_0e28! = FX##(V_0e28!) + 1.0   '@4c745 DS:23c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c245   '@4c75b
L_4c763:
    IF NOT (V_0ddc! = 1.0) THEN GOTO L_4c788   '@4c763 DS:23c4
    RETURN   '@4c77e
L_4c788:
    L_BP412! = FX##(V_0ddc!) - 1.0 + V_0de4!   '@4c788 DS:23ce
    FOR V_0e28! = 1.0 - FX##(V_0de0!) TO L_BP412!   '@4c7a4 DS:23c4
    IF NOT (FX##(A_19b0!(RT_CINT%(FX##(V_0e28!)))) + A_1232!(RT_CINT%(FX##(V_0e28!)), 1) = FX##(A_19b0!(RT_CINT%(FX##(V_0e28!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e28!) + 1.0), 1)) THEN GOTO L_4c847   '@4c7b0 DS:23c4
    GOTO L_4ca22   '@4c83f
L_4c847:
    L_BP416! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2)   '@4c847
    L_BP41a! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2)   '@4c870
    CALL MIXT_0877_Menor(L_BP416!, L_BP41a!, L_BP41e!)   '@4c892
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 2) = L_BP41a!   '@4c8a7
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 2) = L_BP416!   '@4c8ca
    L_BP422! = A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3)   '@4c8ed
    L_BP426! = A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3)   '@4c913
    CALL MIXT_082a_Maior(L_BP422!, L_BP426!, L_BP42a!)   '@4c938
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e1c!)), 3) = L_BP426!   '@4c94d
    A_1ac4!(RT_CINT%(FX##(V_0e14!)), 3) = L_BP422!   '@4c973
    IF NOT (A_1a0c!(RT_CINT%(FX##(V_0e28!) + 1.0), 0) < L_BP42a! AND A_1a0c!(RT_CINT%(FX##(V_0e28!)), 1) > L_BP41e!) THEN GOTO L_4ca1d   '@4c999 DS:23c4
    V_0dfc$ = "*"   '@4ca0b DS:2434
L_4ca1d:
L_4ca22:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4ca27 DS:23c4
    RETURN   '@4ca53
L_4ca62:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    IF NOT (V_185e! = 0.0) THEN GOTO L_4ca8c   '@4ca67 DS:23c0
    RETURN   '@4ca82
L_4ca8c:
    L_BP42e! = V_185e!   '@4ca8c
    FOR V_0e14! = 1.0 TO L_BP42e!   '@4ca9e DS:23c4
    V_0e28! = 70.0   '@4caa6 DS:2444
    V_0e30! = 0.0   '@4cab7 DS:23c0
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 0) = 1.0) THEN GOTO L_4cb04   '@4cac8 DS:23c4
    GOTO L_4d0da   '@4cafc
L_4cb04:
    L_BP432! = V_185e!   '@4cb04
    FOR V_0e1c! = 1.0 TO L_BP432!   '@4cb16 DS:23c4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e1c!)), 0) = 1.0 OR (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3) OR V_0e14! = V_0e1c!)) THEN GOTO L_4cbd0   '@4cb1e DS:23c4
    GOTO L_4cda3   '@4cbc8
L_4cbd0:
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) >= A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) THEN GOTO L_4cc35   '@4cbd0
    V_0e30! = 0.0   '@4cc1c DS:23c0
    GOTO L_4cdd4   '@4cc2d
L_4cc35:
    IF NOT ((FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 3)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) + 15.0 <= FX##(V_187e!) OR FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 2) + 15.0 <= FX##(V_187e!)) AND FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) <= FX##(V_0e28!)) THEN GOTO L_4cd9e   '@4cc35 DS:2448
    V_0e28! = FX##(A_1af2!(RT_CINT%(FX##(V_0e1c!)), 2)) - A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@4cd3e
    V_0e30! = V_0e1c!   '@4cd85
    GOTO L_4cdd4   '@4cd96
L_4cd9e:
L_4cda3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@4cda8 DS:23c4
L_4cdd4:
    IF NOT (V_0e30! = 0.0) THEN GOTO L_4cdf7   '@4cdd4 DS:23c0
    GOTO L_4d0da   '@4cdef
L_4cdf7:
    L_BP436& = (FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 2)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 + (8.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2))) <= FX##(V_187e!)   '@4cdf7 DS:23e0,244c
    IF NOT ((RT_CLNG&(FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 3)) - 8.0 - (FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 2)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0) AND L_BP436&) <> 0) THEN GOTO L_4cfe7   '@4ce7c DS:23e0,2450 (correcao manual)
    V_0e1c! = A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)   '@4cef6
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = (FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 2)) + A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) / 2.0 + 8.0   '@4cf21 DS:23e0,244c
    A_1af2!(RT_CINT%(FX##(V_0e30!)), 2) = (FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 2)) + V_0e1c!) / 2.0 - 8.0   '@4cf8c DS:23e0,2450
    GOTO L_4d0da   '@4cfda
L_4cfe7:
    IF NOT (15.0 - FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 2)) + A_1af2!(RT_CINT%(FX##(V_0e30!)), 2) <= FX##(V_187e!)) THEN GOTO L_4d089   '@4cfe7 DS:2448
    A_1af2!(RT_CINT%(FX##(V_0e14!)), 3) = FX##(A_1af2!(RT_CINT%(FX##(V_0e30!)), 2)) + 15.0   '@4d03a DS:2448
    GOTO L_4d0d5   '@4d081
L_4d089:
    A_1af2!(RT_CINT%(FX##(V_0e30!)), 2) = FX##(A_1af2!(RT_CINT%(FX##(V_0e14!)), 3)) - 15.0   '@4d089 DS:2454
L_4d0d5:
L_4d0da:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4d0df DS:23c4
    RETURN   '@4d10b
L_4d11a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    L_BP43a! = V_0ddc!   '@4d11f
    FOR V_0e14! = 1.0 TO L_BP43a!   '@4d131 DS:23c4
    IF NOT (VAL(A_13a2$(RT_CINT%(FX##(V_0e14!)))) = 0.0#) THEN GOTO L_4d178   '@4d138 DS:2400
    GOTO L_4db14   '@4d170
L_4d178:
    V_0e44! = VAL(RT_MID2$((A_13a2$(RT_CINT%(FX##(V_0e14!)))), (RT_INSTR%((1), (A_13a2$(RT_CINT%(FX##(V_0e14!)))), ("#")) + 1)))   '@4d178 DS:2458
    V_0e2c! = FX##(V_0e44!) / 10.0   '@4d1d4 DS:23e8
    GOSUB L_4f8cf   '@4d1ea
    V_0e20! = FX##(V_0e44!) * VAL(A_13a2$(RT_CINT%(FX##(V_0e14!))))   '@4d1f7
    V_0f7e! = INT(FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), 14, 1)) * 100.0 - A_19de!(RT_CINT%(FX##(V_0e14!))))   '@4d22a DS:23d6
    V_0f82! = RT_CINT%(FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), 14, 2)) * 100.0 - A_19de!(RT_CINT%(FX##(V_0e14!))))   '@4d280 DS:23d6
    L_BP43e! = V_185e!   '@4d2d9
    FOR V_0e28! = 1.0 TO L_BP43e!   '@4d2eb DS:23c4
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)) > A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 3.0 OR FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)) < FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) THEN GOTO L_4d3e9   '@4d2f2 DS:23fc
    GOTO L_4d954   '@4d3e1
L_4d3e9:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)) >= A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 3.0 AND FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)) <= FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 1)) / 3.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) THEN GOTO L_4d4e0   '@4d3e9 DS:23fc
    GOTO L_4d954   '@4d4d8
L_4d4e0:
    IF NOT (1.0 - FX##(V_0de0!) < FX##(V_0e14!)) THEN GOTO L_4d5b4   '@4d4e0 DS:23c4
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) < A_1a0c!(RT_CINT%(FX##(V_0e14!) - 1.0), 1) AND A_19b0!(RT_CINT%(FX##(V_0e14!) - 1.0)) > A_19b0!(RT_CINT%(FX##(V_0e14!)))) THEN GOTO L_4d5af   '@4d500 DS:23ce
    GOTO L_4d954   '@4d5a7
L_4d5af:
L_4d5b4:
    IF NOT (FX##(V_0ddc!) - 1.0 + V_0de4! > FX##(V_0e14!)) THEN GOTO L_4d68f   '@4d5b4 DS:23ce
    IF NOT (A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) > A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) AND A_19b0!(RT_CINT%(FX##(V_0e14!))) < A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) THEN GOTO L_4d68a   '@4d5d9 DS:23c4
    GOTO L_4d954   '@4d682
L_4d68a:
L_4d68f:
    V_0e44! = A_1af2!(RT_CINT%(FX##(V_0e28!)), 1)   '@4d68f
    GOSUB L_4f8cf   '@4d6ba
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44! < FX##(V_0e20!)) THEN GOTO L_4d708   '@4d6c7
    GOTO L_4d954   '@4d700
L_4d708:
    IF NOT (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)) < FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + V_0f82!) THEN GOTO L_4d857   '@4d708
    L_BP442! = A_1af2!(RT_CINT%(FX##(V_0e28!)), 3)   '@4d75b
    L_BP446! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + V_0f82! + INT(70.0 / (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44!) * V_0e2c! * V_0e20!)   '@4d787 DS:2444
    CALL MIXT_082a_Maior(L_BP442!, L_BP446!, L_BP44a!)   '@4d7ef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP442!   '@4d804
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP44a!   '@4d82a
    GOTO L_4d947   '@4d84f
L_4d857:
    L_BP44e! = A_1af2!(RT_CINT%(FX##(V_0e28!)), 2)   '@4d857
    L_BP452! = V_0f7e! - INT(70.0 / (FX##(A_1af2!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44!) * V_0e2c! * V_0e20!) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@4d880 DS:2444
    CALL MIXT_0877_Menor(L_BP44e!, L_BP452!, L_BP456!)   '@4d8e8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP44e!   '@4d8fd
    A_1af2!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP456!   '@4d920
L_4d947:
    GOTO L_4db14   '@4d947
L_4d954:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4d959 DS:23c4
    V_185e! = FX##(V_185e!) + 1.0   '@4d985 DS:23c4
    A_1af2!(RT_CINT%(FX##(V_185e!)), 0) = VAL(A_13a2$(RT_CINT%(FX##(V_0e14!))))   '@4d99b
    A_1af2!(RT_CINT%(FX##(V_185e!)), 1) = VAL(RT_MID2$((A_13a2$(RT_CINT%(FX##(V_0e14!)))), (RT_INSTR%((1), (A_13a2$(RT_CINT%(FX##(V_0e14!)))), ("#")) + 1)))   '@4d9e2 DS:2458
    A_1af2!(RT_CINT%(FX##(V_185e!)), 2) = V_0f7e! - INT(70.0 * FX##(V_0e2c!)) + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)   '@4da58 DS:2444
    A_1af2!(RT_CINT%(FX##(V_185e!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + V_0f82! + INT(70.0 * FX##(V_0e2c!))   '@4dab2 DS:2444
L_4db14:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4db19 DS:23c4
    RETURN   '@4db45
L_4db54:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    L_BP45a! = 0.0   '@4db59 DS:23c0
    L_BP45e! = 1.0 - FX##(V_0de0!) - V_0de8! + (A_1148!(0) < 0.0 AND V_0e74$ = "S")   '@4db6b DS:23c0,23c4,23c8
    CALL MIXT_082a_Maior(V_0ddc!, L_BP45e!, L_BP462!)   '@4dbc6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP45a!, L_BP462!, L_BP466!)   '@4dbd9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46a! = 0.0   '@4dbee DS:23c0
    L_BP46e! = FX##(V_0ddc!) - 1.0 + V_0de4! + (FX##(V_0dec!) - (A_1148!(1) < 0.0 AND V_0e74$ = "S"))   '@4dbfa DS:23c0,23c8,23ce
    CALL MIXT_0877_Menor(L_BP46a!, L_BP46e!, L_BP472!)   '@4dc5b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_0ddc!, L_BP472!, L_BP476!)   '@4dc6f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP466! > L_BP476!) THEN GOTO L_4dca2   '@4dc83
    RETURN   '@4dc98
L_4dca2:
    L_BP47a! = V_0ddc!   '@4dca2
    FOR V_0e14! = 0.0 TO L_BP47a!   '@4dcb4 DS:23c0,23c4
    IF NOT (VAL(A_13d0$(RT_CINT%(FX##(V_0e14!)))) = 0.0#) THEN GOTO L_4dcfc   '@4dcbc DS:2400
    GOTO L_4e7ec   '@4dcf4
L_4dcfc:
    V_0e44! = VAL(RT_MID2$((A_13d0$(RT_CINT%(FX##(V_0e14!)))), (RT_INSTR%((1), (A_13d0$(RT_CINT%(FX##(V_0e14!)))), ("#")) + 1)))   '@4dcfc DS:2458
    V_0e2c! = FX##(V_0e44!) / 10.0   '@4dd58 DS:23e8
    GOSUB L_4f8cf   '@4dd6e
    V_0e20! = FX##(V_0e44!) * VAL(A_13d0$(RT_CINT%(FX##(V_0e14!))))   '@4dd7b
    V_0f7e! = RT_CINT%(FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), 14, 1)) * 100.0)   '@4ddae DS:23d6
    V_0f82! = RT_CINT%(FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), 14, 2)) * 100.0)   '@4ddec DS:23d6
    L_BP47e! = V_1866!   '@4de2a
    FOR V_0e28! = 1.0 TO L_BP47e!   '@4de3c DS:23c4
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)) < A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)) * 8.0 OR FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)) > FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)) * 8.0 + A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) THEN GOTO L_4df40   '@4de44 DS:23c4,244c
    GOTO L_4e489   '@4df38
L_4df40:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) > FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) AND FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) < FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) THEN GOTO L_4e06b   '@4df40 DS:23c4
    GOTO L_4e489   '@4e063
L_4e06b:
    IF NOT (FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) - A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) > FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)) - A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0) AND FX##(A_19b0!(RT_CINT%(FX##(V_0e14!)))) + A_1232!(RT_CINT%(FX##(V_0e14!)), 1) > FX##(A_19b0!(RT_CINT%(FX##(V_0e14!) + 1.0))) + A_1232!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) THEN GOTO L_4e19e   '@4e06b DS:23c4
    GOTO L_4e489   '@4e196
L_4e19e:
    V_0e44! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)   '@4e19e
    GOSUB L_4f8cf   '@4e1c9
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44! < FX##(V_0e20!)) THEN GOTO L_4e217   '@4e1d6
    GOTO L_4e489   '@4e20f
L_4e217:
    IF NOT (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)) < A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1) - FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 1)) * 8.0) THEN GOTO L_4e38b   '@4e217 DS:244c
    L_BP482! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3)   '@4e28a
    L_BP486! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + V_0f82! + INT(70.0 / (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44!) * V_0e2c! * V_0e20!)   '@4e2b6 DS:23c4,2444
    CALL MIXT_082a_Maior(L_BP482!, L_BP486!, L_BP48a!)   '@4e323
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP482!   '@4e338
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 3) = L_BP48a!   '@4e35e
    GOTO L_4e47c   '@4e383
L_4e38b:
    L_BP48e! = A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2)   '@4e38b
    L_BP492! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7e! - INT(70.0 / (FX##(A_1ac4!(RT_CINT%(FX##(V_0e28!)), 0)) * V_0e44!) * V_0e2c! * V_0e20!)   '@4e3b4 DS:2444
    CALL MIXT_0877_Menor(L_BP48e!, L_BP492!, L_BP496!)   '@4e41d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP48e!   '@4e432
    A_1ac4!(RT_CINT%(FX##(V_0e28!)), 2) = L_BP496!   '@4e455
L_4e47c:
    GOTO L_4e7ec   '@4e47c
L_4e489:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@4e48e DS:23c4
    V_1866! = FX##(V_1866!) + 1.0   '@4e4ba DS:23c4
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 0) = VAL(A_13d0$(RT_CINT%(FX##(V_0e14!))))   '@4e4d0
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 1) = VAL(RT_MID2$((A_13d0$(RT_CINT%(FX##(V_0e14!)))), (RT_INSTR%((1), (A_13d0$(RT_CINT%(FX##(V_0e14!)))), ("#")) + 1)))   '@4e517 DS:2458
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1)) - V_0f7e! - INT(70.0 * FX##(V_0e2c!))   '@4e58d DS:2444
    IF NOT (V_0e14! = 0.0) THEN GOTO L_4e6af   '@4e5e8 DS:23c0
    L_BP49a! = A_1ac4!(RT_CINT%(FX##(V_1866!)), 2)   '@4e603
    L_BP49e! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0)) + V_0eaa!   '@4e62c
    CALL MIXT_082a_Maior(L_BP49a!, L_BP49e!, L_BP4a2!)   '@4e655
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = L_BP49a!   '@4e66a
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 2) = L_BP4a2!   '@4e68d
L_4e6af:
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 0)) + V_0f82! + INT(70.0 * FX##(V_0e2c!))   '@4e6af DS:23c4,2444
    IF NOT (V_0e14! = V_0ddc!) THEN GOTO L_4e7e7   '@4e711
    L_BP4a6! = A_1ac4!(RT_CINT%(FX##(V_1866!)), 3)   '@4e72c
    L_BP4aa! = FX##(A_1a0c!(RT_CINT%(FX##(V_0e14!) + 1.0), 1)) - V_0eaa!   '@4e758 DS:23c4
    CALL MIXT_0877_Menor(L_BP4a6!, L_BP4aa!, L_BP4ae!)   '@4e787
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = L_BP4a6!   '@4e79c
    A_1ac4!(RT_CINT%(FX##(V_1866!)), 3) = L_BP4ae!   '@4e7c2
L_4e7e7:
L_4e7ec:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4e7f1 DS:23c4
    RETURN   '@4e81d
L_4e82c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040132_FUN_4000_0132
    REDIM A_1c34!(-32768 TO -32768, -32768 TO -32768)   '@4e831
    REDIM A_1a96%(-32768 TO -32768)   '@4e83f
    REDIM A_1c34!(0 TO 14, 0 TO 4)   '@4e848
    REDIM A_1a96%(0 TO 6)   '@4e869
    V_186e! = 0.0   '@4e886 DS:23c0
    L_BP4b2! = FX##(V_0ddc!) + V_0de4!   '@4e897
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP4b2!   '@4e8ae DS:23c4
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) < V_18ce!) THEN GOTO L_4e8f7   '@4e8ba
    GOTO L_4f311   '@4e8ef
L_4e8f7:
    V_0e44! = FX##(A_1232!(RT_CINT%(FX##(V_0e14!)), 0)) * A_1232!(RT_CINT%(FX##(V_0e14!)), 1) * V_18b6!   '@4e8f7
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) <= A_1d48!(0) AND V_0f16! > 0.0) THEN GOTO L_4eab2   '@4e945 DS:23c0
    L_BP4b6! = 1.0   '@4e9ad DS:23c4
    L_BP4ba! = RT_CINT%(FX##(V_0e44!) / V_0f16!)   '@4e9bf
    CALL MIXT_082a_Maior(L_BP4b6!, L_BP4ba!, L_BP4be!)   '@4e9d9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4be!   '@4e9ee
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0eee!   '@4ea12
    IF NOT ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) > FX##(8.0)) THEN GOTO L_4eaad   '@4ea3d DS:23c4,23e0,244c
    GOTO L_4f11c   '@4eaa5
L_4eaad:
L_4eab2:
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) <= A_1d48!(1) AND V_0f1a! > 0.0) THEN GOTO L_4ec1d   '@4eab2 DS:23c0
    L_BP4c2! = 1.0   '@4eb18 DS:23c4
    L_BP4c6! = RT_CINT%(FX##(V_0e44!) / V_0f1a!)   '@4eb2a
    CALL MIXT_082a_Maior(L_BP4c2!, L_BP4c6!, L_BP4ca!)   '@4eb44
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4ca!   '@4eb59
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef2!   '@4eb7d
    IF NOT ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) > FX##(8.0)) THEN GOTO L_4ec18   '@4eba8 DS:23c4,23e0,244c
    GOTO L_4f11c   '@4ec10
L_4ec18:
L_4ec1d:
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) <= A_1d48!(2) AND V_0f1e! > 0.0) THEN GOTO L_4ed8b   '@4ec1d DS:23c0
    L_BP4ce! = 1.0   '@4ec86 DS:23c4
    L_BP4d2! = RT_CINT%(FX##(V_0e44!) / V_0f1e!)   '@4ec98
    CALL MIXT_082a_Maior(L_BP4ce!, L_BP4d2!, L_BP4d6!)   '@4ecb2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4d6!   '@4ecc7
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef6!   '@4eceb
    IF NOT ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) > FX##(8.0)) THEN GOTO L_4ed86   '@4ed16 DS:23c4,23e0,244c
    GOTO L_4f11c   '@4ed7e
L_4ed86:
L_4ed8b:
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) <= A_1d48!(3) AND V_0f22! > 0.0) THEN GOTO L_4eef9   '@4ed8b DS:23c0
    L_BP4da! = 1.0   '@4edf4 DS:23c4
    L_BP4de! = RT_CINT%(FX##(V_0e44!) / V_0f22!)   '@4ee06
    CALL MIXT_082a_Maior(L_BP4da!, L_BP4de!, L_BP4e2!)   '@4ee20
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4e2!   '@4ee35
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efa!   '@4ee59
    IF NOT ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) > FX##(8.0)) THEN GOTO L_4eef4   '@4ee84 DS:23c4,23e0,244c
    GOTO L_4f11c   '@4eeec
L_4eef4:
L_4eef9:
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 1) <= A_1d48!(4) AND V_0f26! > 0.0) THEN GOTO L_4f067   '@4eef9 DS:23c0
    L_BP4e6! = 1.0   '@4ef62 DS:23c4
    L_BP4ea! = RT_CINT%(FX##(V_0e44!) / V_0f26!)   '@4ef74
    CALL MIXT_082a_Maior(L_BP4e6!, L_BP4ea!, L_BP4ee!)   '@4ef8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4ee!   '@4efa3
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efe!   '@4efc7
    IF NOT ((A_1232!(RT_CINT%(FX##(V_0e14!)), 1) - 2.0 * FX##(V_0ea6!)) / (FX##(A_1c34!(RT_CINT%(FX##(V_0e14!)), 0)) + 1.0) > FX##(8.0)) THEN GOTO L_4f062   '@4eff2 DS:23c4,23e0,244c
    GOTO L_4f11c   '@4f05a
L_4f062:
L_4f067:
    IF NOT (V_0f2a! > 0.0) THEN GOTO L_4f117   '@4f067 DS:23c0
    L_BP4f2! = 1.0   '@4f082 DS:23c4
    L_BP4f6! = RT_CINT%(FX##(V_0e44!) / V_0f2a!)   '@4f094
    CALL MIXT_082a_Maior(L_BP4f2!, L_BP4f6!, L_BP4fa!)   '@4f0ae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 0) = L_BP4fa!   '@4f0c3
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0f02!   '@4f0e7
L_4f117:
L_4f11c:
    L_BP4fe! = 0.0   '@4f121 DS:23c0
    L_BP502! = FX##(V_0e14!) - 1.0   '@4f133 DS:23ce
    CALL MIXT_082a_Maior(L_BP4fe!, L_BP502!, L_BP506!)   '@4f143
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP50a! = FX##(A_1926!(RT_CINT%(FX##(L_BP506!)), 0)) / 2.0   '@4f158 DS:23e0
    L_BP50e! = 20.0   '@4f182 DS:245e
    CALL MIXT_0877_Menor(L_BP50a!, L_BP50e!, L_BP512!)   '@4f18d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 2) = INT(A_1a0c!(RT_CINT%(FX##(V_0e14!)), 0) - FX##(V_0e14! = 0.0) * V_0eaa! + FX##(V_0e14! > 0.0) * L_BP512!)   '@4f1a2 DS:23c0
    L_BP516! = FX##(A_1926!(RT_CINT%(FX##(V_0e14!)), 0)) / 2.0   '@4f22c DS:23e0
    L_BP51a! = 20.0   '@4f25c DS:245e
    CALL MIXT_0877_Menor(L_BP516!, L_BP51a!, L_BP51e!)   '@4f267
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1c34!(RT_CINT%(FX##(V_0e14!)), 3) = INT(FX##(FX##(V_0ddc!) + 1.0 = FX##(V_0e14!)) * V_0eaa! - FX##(V_0e14! <= V_0ddc!) * L_BP51e! + A_1a0c!(RT_CINT%(FX##(V_0e14!)), 1))   '@4f27c DS:23c4
L_4f311:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4f316 DS:23c4
    L_BP522! = FX##(V_0ddc!) + V_0de4!   '@4f342
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP522!   '@4f359 DS:23c4
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0eee!) THEN GOTO L_4f3c5   '@4f366
    A_1a96%(0) = A_1a96%(0) + 1   '@4f39b
L_4f3c5:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef2!) THEN GOTO L_4f41d   '@4f3c5
    A_1a96%(1) = A_1a96%(1) + 1   '@4f3fa
L_4f41d:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0ef6!) THEN GOTO L_4f47e   '@4f41d
    A_1a96%(2) = A_1a96%(2) + 1   '@4f452
L_4f47e:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efa!) THEN GOTO L_4f4df   '@4f47e
    A_1a96%(3) = A_1a96%(3) + 1   '@4f4b3
L_4f4df:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0efe!) THEN GOTO L_4f540   '@4f4df
    A_1a96%(4) = A_1a96%(4) + 1   '@4f514
L_4f540:
    IF NOT (A_1c34!(RT_CINT%(FX##(V_0e14!)), 1) = V_0f02!) THEN GOTO L_4f5a1   '@4f540
    A_1a96%(5) = A_1a96%(5) + 1   '@4f575
L_4f5a1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4f5a1 DS:23c4
    FOR V_0e14! = 0.0 TO 5.0   '@4f5cd DS:23c0,23c4,241e
    V_186e! = FX##(V_186e!) - (A_1a96%(RT_CINT%(FX##(V_0e14!))) > 0)   '@4f5da
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@4f616 DS:23c4,241e
    RETURN   '@4f63f
L_4f64e:   ' sub-rotina (alvo de GOSUB)
    L_BP18% = 0   '@4f653
    IF NOT (V_0e92! > V_0f4a!) THEN GOTO L_4f682   '@4f65d
    L_BP18% = 1   '@4f678
L_4f682:
    IF NOT (V_0e92! > V_0f4e!) THEN GOTO L_4f6a7   '@4f682
    L_BP18% = 2   '@4f69d
L_4f6a7:
    IF NOT (V_0f46! > 3.0 AND V_0e92! > V_0f52!) THEN GOTO L_4f6ef   '@4f6a7 DS:23fc
    L_BP18% = 3   '@4f6e5
L_4f6ef:
    IF NOT (V_0f46! > 4.0 AND V_0e92! > V_0f56!) THEN GOTO L_4f737   '@4f6ef DS:2462
    L_BP18% = 4   '@4f72d
L_4f737:
    IF NOT (V_0f46! > 5.0 AND V_0e92! > V_0f5a!) THEN GOTO L_4f77f   '@4f737 DS:241e
    L_BP18% = 5   '@4f775
L_4f77f:
    L_BP526! = 7.0   '@4f77f DS:2466
    L_BP52a! = FX##(V_0ee2!) - 2.0   '@4f791 DS:246a
    CALL MIXT_0877_Menor(L_BP526!, L_BP52a!, L_BP52e!)   '@4f7a1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = A_14e4%(RT_CINT%(FX##(L_BP52e!)), L_BP18%)   '@4f7b6
    L_BP532! = 7.0   '@4f7de DS:2466
    L_BP536! = FX##(V_0ee2!) - 2.0   '@4f7f0 DS:246a
    CALL MIXT_0877_Menor(L_BP532!, L_BP536!, L_BP53a!)   '@4f800
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(A_14e4%(RT_CINT%(FX##(L_BP53a!)), L_BP18%)) * V_0e28! > FX##(V_0ee2!)) THEN GOTO L_4f8c0   '@4f815
    L_BP53e! = 7.0   '@4f84c DS:2466
    L_BP542! = FX##(V_0ee2!) - 2.0   '@4f85e DS:246a
    CALL MIXT_0877_Menor(L_BP53e!, L_BP542!, L_BP546!)   '@4f86e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = V_0ee2! - (FX##(V_0e28!) - 1.0) * A_14e4%(RT_CINT%(FX##(L_BP546!)), L_BP18%)   '@4f883 DS:23ce
L_4f8c0:
    RETURN   '@4f8c0
L_4f8cf:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e44! = V_0eee!) THEN GOTO L_4f90a   '@4f8d4
    V_0e44! = V_0f16!   '@4f8ef
    RETURN   '@4f900
L_4f90a:
    IF NOT (V_0e44! = V_0ef2!) THEN GOTO L_4f940   '@4f90a
    V_0e44! = V_0f1a!   '@4f925
    RETURN   '@4f936
L_4f940:
    IF NOT (V_0e44! = V_0ef6!) THEN GOTO L_4f976   '@4f940
    V_0e44! = V_0f1e!   '@4f95b
    RETURN   '@4f96c
L_4f976:
    IF NOT (V_0e44! = V_0efa!) THEN GOTO L_4f9ac   '@4f976
    V_0e44! = V_0f22!   '@4f991
    RETURN   '@4f9a2
L_4f9ac:
    IF NOT (V_0e44! = V_0efe!) THEN GOTO L_4f9e2   '@4f9ac
    V_0e44! = V_0f26!   '@4f9c7
    RETURN   '@4f9d8
L_4f9e2:
    IF NOT (V_0e44! = V_0f02!) THEN GOTO L_4fa18   '@4f9e2
    V_0e44! = V_0f2a!   '@4f9fd
    RETURN   '@4fa0e
L_4fa18:
    IF NOT (V_0e44! = V_0f06!) THEN GOTO L_4fa4e   '@4fa18
    V_0e44! = V_0f2e!   '@4fa33
    RETURN   '@4fa44
L_4fa4e:
    IF NOT (V_0e44! = V_0f0a!) THEN GOTO L_4fa84   '@4fa4e
    V_0e44! = V_0f32!   '@4fa69
    RETURN   '@4fa7a
L_4fa84:
    IF NOT (V_0e44! = V_0f0e!) THEN GOTO L_4faba   '@4fa84
    V_0e44! = V_0f36!   '@4fa9f
    RETURN   '@4fab0
L_4faba:
    IF NOT (V_0e44! = V_0f12!) THEN GOTO L_4fae6   '@4faba
    V_0e44! = V_0f3a!   '@4fad5
L_4fae6:
    RETURN   '@4fae6
L_4faf5:   ' entrada vinda de 040132_FUN_4000_0132
    ' END SUB   '@4faf5
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_DESENHO.BM'
'$INCLUDE: '../comum/MIXT.BM'
