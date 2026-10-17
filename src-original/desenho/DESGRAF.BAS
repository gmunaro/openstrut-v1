' ============================================================================
'  DESGRAF - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/DESGRAF/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 6e6c8ce85c26f57fa512220a1512edb1a3f4b59d540506b72d9a7dae4a456d7f
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_DESENHO.BI'

' ---- variaveis do DESGRAF fora do COMMON (DS do programa)
DIM SHARED V_1e06!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "DESGRAF"
' ---- M_DESGRAF @0x10030  (010030_M_DESGRAF.lift.txt; evidence_id (assembly): ev_0084ad340cb9241e36985f83a703288dad11c62c80c67d4143c85cffdbea874c)
' @10030 inicio do programa (B$?EVT)
GOTO L_10193   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10193:
L_10198:   ' entrada vinda de 010338_F_10338
ON ERROR GOTO L_10734
RT_ONERR = &H10734   '@1019d
GOSUB L_1033d   '@101ac
CALL S_10771   '@101b9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY pelo roteiro (entre comandos)
V_0dfc$ = "DESGRAF"   '@101c3 DS:1f6a
L_101da:
ON ERROR GOTO L_10258
RT_ONERR = &H10258   '@101df
V_0e30! = RT_FRE&("")   '@101ee DS:1f10
L_BP0c% = (LEN(V_0dc8$) > 3)   '@10208
CHDIR RT_ARQ$(RT_LEFT$((V_0dc8$), (LEN(V_0dc8$) + L_BP0c%)))   '@10227
RT_CHAIN V_0dc8$ + "DESDIM"   '@1023b DS:1f76
L_10258:
RESUME L_1026f   '@1025d
L_1026f:
BEEP   '@10274
L_BP0c% = (V_0dc8$ = "A:\")   '@1027e DS:1f80
IF NOT ((V_0dc8$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_10330   '@102a3 DS:1f88
LOCATE 25, 1   '@102b8
PRINT " Coloque o Disco DESDIM no Drive "; V_0dc8$; RT_TAB$(79); ""; "";   '@102d3 DS:1f10,1f90
CALL MIXT_07f1_LimpaTeclado   '@10305
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY pelo roteiro (entre comandos)
V_0e00$ = RT_INPUT$(1)   '@1030f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY pelo roteiro (entre comandos)
L_10330:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY no laco (B$EVCK)
GOTO L_101da   '@10330
' ---- F_10338 @0x10338  (010338_F_10338.lift.txt; evidence_id (assembly): ev_21e8df590cb9740aa9c40b1065840a6f4afb9ecaccc61ea4d7c9b962409bbf43)
L_1033d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_DESGRAF
FOR V_1e06! = 1.0 TO 10.0   '@10342 DS:1fb6,1fba
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_105c1
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 1   '@10350
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@1036a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@1037f DS:1fb6,1fba
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@103a8
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@103d0
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@103f8
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10420
FOR V_1e06! = 15.0 TO 18.0   '@10448 DS:1fb6,1fbe,1fc2
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_105ec
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 2   '@10456
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@10470
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@10485 DS:1fb6,1fc2
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@104ae
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@104d6
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@104fe
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@10526
FOR V_1e06! = 19.0 TO 22.0   '@1054d DS:1fb6,1fc6,1fca
ON KEY(RT_CINT%(FX##(V_1e06!))) GOSUB L_10706
RT_ONKEY RT_CINT%(FX##(V_1e06!)), 3   '@1055a
KEY(RT_CINT%(FX##(V_1e06!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1e06!)), 1   '@10574
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY no laco (B$EVCK)
NEXT V_1e06!   '@10589 DS:1fb6,1fca
RETURN   '@105b2
L_105c1:
BEEP   '@105c6
GOSUB L_1033d   '@105d0
RETURN   '@105dd
L_105ec:
RT_SCREEN 0   '@105f1
RT_VIEWPRINT 1, 25   '@10606
COLOR 7, 0, 0   '@10618
RT_CLS 0   '@1063c
PRINT " Aguarde ..."   '@10649 DS:1fce
PRINT ""   '@10657 DS:1f10
PRINT " Retorno ao Modulo Gerenciador"   '@10665 DS:1fde
ON ERROR GOTO L_106b6
RT_ONERR = &H106b6   '@10673
RT_RUN RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7)) + "SISTRUT"   '@10682 DS:2000
L_106b6:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0dc8$), (1), (LEN(V_0dc8$) - 7))   '@106bb DS:200c
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@106e9 DS:1f2e
RT_FIM   '@106f7 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10706:
BEEP   '@1070b
GOSUB L_1033d   '@10715
RETURN L_10198   '@1072c
' ---- F_1072f @0x1072f  (01072f_F_1072f.lift.txt; evidence_id (assembly): ev_8b622e06f4e50bb5049a1cc29138da10de0a98abac79c0f36af5a911b04e0b39)
L_10734:   ' entrada vinda de 010030_M_DESGRAF
RESUME L_1074b   '@10739
L_1074b:
ON ERROR GOTO L_10734
RT_ONERR = &H10734   '@10750
CALL S_20171   '@1075f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY pelo roteiro (entre comandos)
GOTO L_19543   '@10769
' ---- FUN_1000_9543 @0x19543  (019543_FUN_1000_9543.lift.txt; evidence_id (assembly): ev_0df1080cdad18a34cac1a4eb14c8bec1e4e1e20bcd323e1c47b62c7b3e2900c1)
L_19543:   ' entrada vinda de 01072f_F_1072f
GOTO L_19a20   '@19543
' ---- FUN_1000_9a20 @0x19a20  (019a20_FUN_1000_9a20.lift.txt; evidence_id (assembly): ev_fbd5c377f44e6c30787b5debbb8155911088b66364caaf8e7b98612e536abe79)
L_19a20:   ' entrada vinda de 019543_FUN_1000_9543
GOTO L_1a4dd   '@19a20
' ---- FUN_1000_a4dd @0x1a4dd  (01a4dd_FUN_1000_a4dd.lift.txt; evidence_id (assembly): ev_3adc19064c5dbecdb94c029dd8a2c6f29cd97268eeb8f04ce28202a87b3e5c3f)
L_1a4dd:   ' entrada vinda de 019a20_FUN_1000_9a20
GOTO L_1aac0   '@1a4dd
' ---- F_1aac0 @0x1aac0  (01aac0_F_1aac0.lift.txt; evidence_id (assembly): ev_8816c2ee678d877d33541e043dd046c30302f9ebcc5a770220b9628e27dd43a2)
L_1aac0:   ' entrada vinda de 01a4dd_FUN_1000_a4dd
RT_FIM   ' @1aac0 B$CENP (inicio/fim do modulo)
'RETRAD? @1aac5 ?? 64 bytes sem caminho de entrada conhecido (dados/lixo, 30 instr.): DEC BX; ADC byte ptr [BX + DI], CH; AND SI, word ptr [BX + SI] ...
L_1ab05:
'RETRAD? @1ab05 ?? 25 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 10 instr.): XCHG AX, BP; DAA ...
L_1ab1e:
'RETRAD? @1ab1e ?? 14 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 5 instr.): XOR word ptr [BP + DI + 0x5525], AX; XOR AL, byte ptr [SI + 0xe325] ...
L_1ab2c:
'RETRAD? @1ab2c ?? 82 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 48 instr.): SUB CX, word ptr ES:[BX + SI + 0x6f]; DEC DI ...
L_1ab7e:
'RETRAD? @1ab7e ?? 36 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 17 instr.): XCHG word ptr [SI], DX; JS 0x1000:abbb ...
L_1aba2:
'RETRAD? @1aba3 ?? dado (entre trechos de dado lido como codigo): IF ?? THEN GOTO L_1abdf
'RETRAD? @1aba6 ?? 21 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 13 instr.): PUSHF; AAS ...
L_1abbb:
'RETRAD? @1abbb ?? dado (entre trechos de dado lido como codigo): V_0073% = ??valor
'RETRAD? @1abbe ?? 40 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
L_1abe6:
'RETRAD? @1abe6 ?? 14 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 7 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
L_1abf4:
'RETRAD? @1abf4 ?? 19 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 10 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
' ---- M_DESAUXGR @0x20030  (020030_M_DESAUXGR.lift.txt; evidence_id (assembly): ev_7f5ec3b01cfa568b7b6001948ac32381bc6058896a7a50ca469af7064c571544)
' @20030 inicio do programa (B$?EVT)
L_20134:
RESUME L_2014b   '@20139
L_2014b:
ON ERROR GOTO L_20134
RT_ONERR = &H20134   '@20150
CALL S_20171   '@2015f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_105c1, L_105ec, L_10706   ' ON KEY pelo roteiro (entre comandos)
GOTO L_202e6   '@20169
' ---- FUN_2000_02e6 @0x202e6  (0202e6_FUN_2000_02e6.lift.txt; evidence_id (assembly): ev_5c34c017589cc95319bb449e6b326d67e0ed7fc9a9658f3e3dba4ade03d4bd2a)
L_202e6:   ' entrada vinda de 020030_M_DESAUXGR
RT_FIM   ' @202e6 B$CENP (inicio/fim do modulo)
'RETRAD? @202eb ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x40f20 (chamada por CALL SUB_40f20 no lift).
' Versao A; DS do original: inicio DS:230E, CR LF DS:2308, fim DS:230B, margem em [DS:25FF], ESC L em [DS:2306].
SUB RT_ROTINA_0F20
    SELECT CASE RT_MODO
        CASE 9
            RT_COPIA_TELA "A", 640, 344, 0, "               ", CHR$(27) + "L" + CHR$(128) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE 3
            RT_COPIA_TELA "A", 720, 344, 0, "        ", CHR$(27) + "L" + CHR$(208) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE ELSE
            RT_COPIA_TELA "A", 640, 200, 0, "               ", CHR$(27) + "L" + CHR$(128) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
    END SELECT
END SUB

' Rotina em assembly do EXE em 0x4109c (chamada por CALL SUB_4109c no lift).
' Versao B; DS do original: inicio DS:2622, CR LF DS:261C, fim DS:261F, margem em [DS:27AA], ESC L em [DS:261A].
SUB RT_ROTINA_109C
    SELECT CASE RT_MODO
        CASE 9
            RT_COPIA_TELA "B", 640, 344, 0, "            ", CHR$(27) + "KX" + CHR$(1), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE 3
            RT_COPIA_TELA "B", 720, 344, 0, "            ", CHR$(27) + "KX" + CHR$(1), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE ELSE
            RT_COPIA_TELA "B", 640, 200, 0, "                    ", CHR$(27) + "K" + CHR$(200) + CHR$(0), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
    END SELECT
END SUB

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    V_1e06! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_105c1: BEEP; GOSUB L_1033d; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_105ec: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10706: sai da SUB (BEEP; GOSUB L_1033d; RETURN L_10198)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H10258: ON ERROR GOTO L_10258
        CASE &H106b6: ON ERROR GOTO L_106b6
        CASE &H10734: ON ERROR GOTO L_10734
        CASE &H20134: ON ERROR GOTO L_20134
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_10771   ' entrada de SUB/FUNCTION (B$ENRA, locais 372 bytes) (0x10771)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3c%
    DIM L_BP3e%
    DIM L_BP40%
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP52%
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72!
    DIM L_BP76!
    DIM L_BP78%
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP86%
    DIM L_BP88%
    DIM L_BP8c!
    DIM L_BP90!
    DIM L_BP94!
    DIM L_BP98!
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa2%
    DIM L_BPa4%
    DIM L_BPa6%
    DIM L_BPa8%
    DIM L_BPaa%
    DIM L_BPac%
    DIM L_BPae%
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
    ' ---- FUN_1000_0771 @0x10771  (010771_FUN_1000_0771.lift.txt; evidence_id (assembly): ev_31913c414ef1298bec85dad97bd763faea022ce308428af96091d5ebc89bd678)
    L_BP40% = (V_17f2$ = "CGA")   '@10788 DS:202a
    IF NOT ((V_17f2$ = "MCG" OR L_BP40%) <> 0) THEN GOTO L_1088d   '@107ad DS:2032
    V_0f6a! = VAL(V_0e80$) / (FX##(V_0fa2!) * 100.0#) * 22.6261997222900390625##   '@107c2 DS:203a,2042
    V_191e% = 7   '@107ee
    L_BP44! = 7.0   '@107f9 DS:204a
    L_BP48! = 7.0   '@10809 DS:204a
    L_BP4c! = 7.0   '@10819 DS:204a
    L_BP50! = 7.0   '@10829 DS:204a
    V_1922% = 7   '@10839
    V_0e5c! = 639.0   '@10844 DS:204e
    V_0e60! = 180.0   '@10855 DS:2052
    V_0e64! = 20.0   '@10866 DS:2056
    V_0e68! = 8.0   '@10877 DS:205a
L_1088d:
    L_BP52% = (V_17f2$ = "EGA")   '@1088d DS:205e
    IF NOT ((V_17f2$ = "VGA" OR L_BP52%) <> 0) THEN GOTO L_10992   '@108b2 DS:2066
    V_0f6a! = VAL(V_0e80$) / (FX##(V_0fa2!) * 100.0#) * 22.6261997222900390625##   '@108c7 DS:203a,2042
    V_191e% = 11   '@108f3
    L_BP44! = 10.0   '@108fe DS:1fba
    L_BP48! = 14.0   '@1090e DS:206e
    L_BP4c! = 12.0   '@1091e DS:2072
    L_BP50! = 13.0   '@1092e DS:2076
    V_1922% = 15   '@1093e
    V_0e5c! = 639.0   '@10949 DS:204e
    V_0e60! = 315.0   '@1095a DS:207a
    V_0e64! = 35.0   '@1096b DS:207e
    V_0e68! = 8.0   '@1097c DS:205a
L_10992:
    IF NOT (V_17f2$ = "HER") THEN GOTO L_10a74   '@10992 DS:2082
    V_0f6a! = VAL(V_0e80$) / (FX##(V_0fa2!) * 100.0#) * 25.4545001983642578125##   '@109a9 DS:203a,208a
    V_191e% = 7   '@109d5
    L_BP44! = 7.0   '@109e0 DS:204a
    L_BP48! = 7.0   '@109f0 DS:204a
    L_BP4c! = 7.0   '@10a00 DS:204a
    L_BP50! = 7.0   '@10a10 DS:204a
    V_1922% = 7   '@10a20
    V_0e5c! = 719.0   '@10a2b DS:2092
    V_0e60! = 315.0   '@10a3c DS:207a
    V_0e64! = 35.0   '@10a4d DS:207e
    V_0e68! = 9.0   '@10a5e DS:2096
L_10a74:
    IF NOT (VAL(V_0e80$) = 0.0#) THEN GOTO L_10b64   '@10a74 DS:209a
    V_0e1c! = 0.0   '@10a98 DS:20a2
    L_BP56! = FX##(V_0ddc!) + V_0de4!   '@10aa9
    FOR V_0e14! = 1.0 - FX##(V_0de0!) TO L_BP56!   '@10abf DS:1fb6
    V_0e1c! = FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) + V_0e1c!   '@10acc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@10af8 DS:1fb6
    V_0f6a! = V_0e1c! * 1.019999980926513671875##   '@10b20 DS:20a6
    IF NOT (V_0e80$ <> "FOTO") THEN GOTO L_10b5f   '@10b36 DS:20aa
    V_0e80$ = "VIDEO"   '@10b4d DS:20b2
L_10b5f:
L_10b64:
    A_156e!(0) = 0.0   '@10b64 DS:20a2
    IF NOT (A_1006!(0) > V_0f6a!) THEN GOTO L_10bcb   '@10b83
    A_156e!(0) = 1.0   '@10bac DS:1fb6
L_10bcb:
    A_159c!(0) = A_1006!(0)   '@10bcb
    L_BP12! = 0.0   '@10bf8 DS:20a2
    L_BP0e! = ABS(FX##(A_16de!(0)))   '@10c08
    IF NOT (A_1796!(0, 1) > L_BP0e!) THEN GOTO L_10c77   '@10c29
    L_BP0e! = A_1796!(0, 1)   '@10c55
L_10c77:
    L_BP5a! = V_0ddc!   '@10c77
    FOR V_0e14! = 1.0 TO L_BP5a!   '@10c88 DS:1fb6
    A_159c!(RT_CINT%(FX##(V_0e14!))) = FX##(A_159c!(RT_CINT%(FX##(V_0e14!) - 1.0))) + A_1006!(RT_CINT%(FX##(V_0e14!)))   '@10c90 DS:20bc
    IF NOT (A_1768!(RT_CINT%(FX##(V_0e14!))) > L_BP12!) THEN GOTO L_10d43   '@10ced
    L_BP12! = A_1768!(RT_CINT%(FX##(V_0e14!)))   '@10d1d
L_10d43:
    IF NOT (A_1796!(RT_CINT%(FX##(V_0e14!)), 0) > L_BP12!) THEN GOTO L_10d9f   '@10d43
    L_BP12! = A_1796!(RT_CINT%(FX##(V_0e14!)), 0)   '@10d76
L_10d9f:
    IF NOT (ABS(FX##(A_16de!(RT_CINT%(FX##(V_0e14!))))) > FX##(L_BP0e!)) THEN GOTO L_10dfb   '@10d9f
    L_BP0e! = ABS(FX##(A_16de!(RT_CINT%(FX##(V_0e14!)))))   '@10dd2
L_10dfb:
    IF NOT (A_1796!(RT_CINT%(FX##(V_0e14!)), 1) > L_BP0e!) THEN GOTO L_10e59   '@10dfb
    L_BP0e! = A_1796!(RT_CINT%(FX##(V_0e14!)), 1)   '@10e2f
L_10e59:
    L_BP5e! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@10e59
    FOR V_0e24! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP5e!   '@10e84 DS:1fb6
    IF NOT (A_10ec!(RT_CINT%(FX##(V_0e24!))) >= 0.0) THEN GOTO L_10efd   '@10ec4 DS:20a2
    GOTO L_1104b   '@10ef5
L_10efd:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e24!))) - 0.00999999977648258209228515625##   '@10efd DS:20c0
    CALL S_1954b   '@10f29
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0e38! < 0.0) THEN GOTO L_10f84   '@10f33 DS:20a2
    L_BP62! = ABS(FX##(V_0e38!))   '@10f4e
    CALL MIXT_082a_Maior(L_BP0e!, L_BP62!, L_BP66!)   '@10f61
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e! = L_BP66!   '@10f73
    GOTO L_10fa4   '@10f7c
L_10f84:
    CALL MIXT_082a_Maior(L_BP12!, V_0e38!, L_BP6a!)   '@10f84
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12! = L_BP6a!   '@10f9b
L_10fa4:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e24!))) + 0.00999999977648258209228515625##   '@10fa4 DS:20c4
    CALL S_1954b   '@10fd0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0e38! < 0.0) THEN GOTO L_1102b   '@10fda DS:20a2
    L_BP6e! = ABS(FX##(V_0e38!))   '@10ff5
    CALL MIXT_082a_Maior(L_BP0e!, L_BP6e!, L_BP72!)   '@11008
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e! = L_BP72!   '@1101a
    GOTO L_1104b   '@11023
L_1102b:
    CALL MIXT_082a_Maior(L_BP12!, V_0e38!, L_BP76!)   '@1102b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12! = L_BP76!   '@11042
L_1104b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e24!   '@11050 DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e14!   '@1107b DS:1fb6
    A_159c!(RT_CINT%(FX##(V_0ddc!) + 1.0)) = FX##(A_159c!(RT_CINT%(FX##(V_0ddc!)))) + A_1006!(RT_CINT%(FX##(V_0ddc!) + 1.0))   '@110a6 DS:1fb6
    IF NOT (A_1796!(RT_CINT%(FX##(V_0ddc!) + 1.0), 0) > L_BP12!) THEN GOTO L_1116e   '@11108 DS:1fb6
    L_BP12! = A_1796!(RT_CINT%(FX##(V_0ddc!) + 1.0), 0)   '@11140 DS:1fb6
L_1116e:
    L_BP0e! = FX##(L_BP0e!) * V_0fa6! * V_0fa2!   '@1116e
    L_BP12! = FX##(L_BP12!) * V_0fa6! * V_0fa2!   '@11187
    L_BP16! = 0.20000000298023223876953125##   '@111a0 DS:20c8
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(2.0)) THEN GOTO L_111de   '@111b0 DS:20cc
    L_BP16! = 0.5   '@111ce DS:20d0
L_111de:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(5.0)) THEN GOTO L_1120c   '@111de DS:20d4
    L_BP16! = 1.0   '@111fc DS:1fb6
L_1120c:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(10.0)) THEN GOTO L_1123a   '@1120c DS:1fba
    L_BP16! = 2.0   '@1122a DS:20cc
L_1123a:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(20.0)) THEN GOTO L_11268   '@1123a DS:2056
    L_BP16! = 5.0   '@11258 DS:20d4
L_11268:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(50.0)) THEN GOTO L_11296   '@11268 DS:20d8
    L_BP16! = 10.0   '@11286 DS:1fba
L_11296:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(100.0)) THEN GOTO L_112c4   '@11296 DS:20dc
    L_BP16! = 20.0   '@112b4 DS:2056
L_112c4:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(180.0)) THEN GOTO L_112f2   '@112c4 DS:2052
    L_BP16! = 40.0   '@112e2 DS:20e0
L_112f2:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(220.0)) THEN GOTO L_11320   '@112f2 DS:20e4
    L_BP16! = 60.0   '@11310 DS:20e8
L_11320:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(300.0)) THEN GOTO L_1134e   '@11320 DS:20ec
    L_BP16! = 100.0   '@1133e DS:20dc
L_1134e:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(500.0)) THEN GOTO L_1137c   '@1134e DS:20f0
    L_BP16! = 120.0   '@1136c DS:20f4
L_1137c:
    IF NOT (FX##(L_BP0e!) + L_BP12! > FX##(800.0)) THEN GOTO L_113aa   '@1137c DS:20f8
    L_BP16! = 200.0   '@1139a DS:20fc
L_113aa:
    L_BP0e! = L_BP0e! / (FX##(V_0fa6!) * V_0fa2!)   '@113aa
    L_BP12! = L_BP12! / (FX##(V_0fa6!) * V_0fa2!)   '@113c6
    L_BP16! = L_BP16! / (FX##(V_0fa6!) * V_0fa2!)   '@113e2
    IF NOT (L_BP16! > 1.0) THEN GOTO L_1143e   '@113fe DS:1fb6
    L_BP16! = RT_CLNG&(FX##(L_BP16!)) \ 1&   '@11418
L_1143e:
    V_0e20! = INT(FX##(A_159c!(RT_CINT%(FX##(V_0ddc!) + V_0de4!))) / V_0f6a!)   '@1143e
    V_0e14! = 0.0   '@11476 DS:20a2
    V_0e28! = 0.0   '@11487 DS:20a2
    IF NOT (VAL(V_0e80$) > 0.0#) THEN GOTO L_1155d   '@11498 DS:209a
    IF NOT (V_0df8! = 0.0) THEN GOTO L_11515   '@114bc DS:20a2
    RT_LPTABRE: RT_LPS CHR$(12)   '@114d7
    RT_LPTABRE: RT_LPS V_0f96$   '@114f5
    GOTO L_11558   '@1150d
L_11515:
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11515 DS:1f10
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11528 DS:1f10
    RT_LPTABRE: RT_LPS V_0f96$   '@1153b
L_11558:
L_1155d:
    IF NOT (V_0e80$ = "FOTO") THEN GOTO L_11613   '@1155d DS:20aa
    RT_LPTABRE: RT_LPS V_0f96$   '@11574
    L_BP78% = (V_0df8! = 0.0)   '@1158c DS:20a2
    IF NOT (((FX##(L_BP7c!) - 1.0) / 3.0 = RT_CLNG&(FX##(L_BP7c!) - 1.0) \ 3& AND L_BP78%) <> 0) THEN GOTO L_1160e   '@115ab DS:20bc,2100
    RT_LPTABRE: RT_LPS CHR$(12)   '@115f0
L_1160e:
L_11613:
    L_BP80! = FX##(V_0e20!) + 1.0   '@11613 DS:1fb6
    FOR V_0e24! = 1.0 TO L_BP80!   '@11629 DS:1fb6
L_11630:
    IF NOT (FX##(V_0ddc!) + V_0de4! + V_0e20! < FX##(V_0e14!)) THEN GOTO L_11673   '@11635
    V_0f7e! = 0.0   '@1165a DS:20a2
    GOTO L_11838   '@1166b
L_11673:
    IF NOT (FX##(A_159c!(RT_CINT%(FX##(V_0e14!)))) < FX##(V_0e24!) * V_0f6a!) THEN GOTO L_116ee   '@11673
    A_156e!(RT_CINT%(FX##(V_0e14!))) = 0.0   '@116a9 DS:20a2
    V_0e14! = FX##(V_0e14!) + 1.0   '@116d0 DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11630   '@116e6
L_116ee:
    L_BP84! = V_0e14!   '@116ee
    FOR V_0e44! = FX##(V_0ddc!) + V_0de4! + V_0e28! TO L_BP84! STEP -1.0   '@11700 DS:20bc
    A_159c!(RT_CINT%(FX##(V_0e44!) + 1.0)) = A_159c!(RT_CINT%(FX##(V_0e44!)))   '@11712 DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e44!   '@11754 DS:20bc
    A_159c!(RT_CINT%(FX##(V_0e14!))) = FX##(V_0e24!) * V_0f6a!   '@1177d
    A_156e!(RT_CINT%(FX##(V_0e14!))) = 1.0   '@117a9 DS:1fb6
    V_0e28! = FX##(V_0e28!) + 1.0   '@117d0 DS:1fb6
    V_0e14! = FX##(V_0e14!) + 1.0   '@117e6 DS:1fb6
    V_0f7e! = 1.0   '@117fc DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e24!   '@1180d DS:1fb6
L_11838:
    IF NOT (V_0f7e! = 1.0) THEN GOTO L_11889   '@1183d DS:1fb6
    A_156e!(RT_CINT%(FX##(V_0ddc!) + V_0de4! + V_0e20!)) = 0.0   '@11858 DS:20a2
L_11889:
    V_0f7e! = 0.0   '@11889 DS:20a2
    V_0f82! = 0.0   '@1189a DS:20a2
    V_0f86! = 0.0   '@118ab DS:20a2
    V_0e38! = 0.0   '@118bc DS:20a2
    V_0e2c! = 0.0   '@118cd DS:20a2
    L_BP1e! = 0.0   '@118de DS:20a2
    L_BP1a! = 0.0   '@118ee DS:20a2
    V_1882! = 0.0   '@118fe DS:20a2
    V_1886! = 0.0   '@1190f DS:20a2
    L_BP22! = 0.0   '@11920 DS:20a2
    L_BP26! = 0.0   '@11930 DS:20a2
    V_0f76! = (FX##(V_0e60!) - V_0e64!) / (FX##(L_BP0e!) + L_BP12!)   '@11940
    V_0f72! = FX##(V_0e5c!) / V_0f6a!   '@11961
    GOSUB L_12cc1   '@11977
    L_BP86% = (VAL(V_0e80$) <> 0.0#)   '@11984 DS:209a
    L_BP88% = (V_0e7c$ = "S")   '@119b7 DS:2104
    IF NOT (((V_0e84$ = "S" OR L_BP88%) AND L_BP86%) <> 0) THEN GOTO L_11a94   '@119d0 DS:2104
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS "OBRA - ": RT_LPS V_0dd8$: RT_LPTAB 38: RT_LPS "": RT_LPS "VIGA - ": RT_LPS V_0dd4$: RT_LPFIM   '@119ea DS:1f10,210a,2116
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS "ESCALA 1/": RT_LPS V_0e80$: RT_LPFIM   '@11a3c DS:1f10,2122
    RT_LPTABRE: RT_LPTAB 20: RT_LPS "": RT_LPS V_180e$: RT_LPFIM   '@11a6a DS:1f10
L_11a94:
    V_0e14! = 1.0   '@11a94 DS:1fb6
    CALL S_1954b   '@11aa5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e14! = 1.0 - FX##(V_0de0!)   '@11aaf DS:1fb6
    V_0e24! = 1.0 - FX##(V_0de0!)   '@11ac5 DS:1fb6
    IF NOT (V_0de0! = 0.0) THEN GOTO L_11b03   '@11adb DS:20a2
    GOSUB L_134f2   '@11af6
L_11b03:
    IF NOT (FX##(V_0ddc!) + V_0de4! + V_0e20! < FX##(V_0e24!)) THEN GOTO L_11b35   '@11b08
    GOTO L_128ac   '@11b2d
L_11b35:
    IF NOT (A_156e!(RT_CINT%(FX##(V_0e24!))) = 1.0) THEN GOTO L_11b6e   '@11b35 DS:1fb6
    GOTO L_121d1   '@11b66
L_11b6e:
    GOSUB L_15910   '@11b6e
    GOSUB L_1380c   '@11b7b
    RT_PSET RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 0, 0   '@11b88
    L_BP8c! = A_1006!(RT_CINT%(FX##(V_0e14!))) + 0.00999999977648258209228515625##   '@11bc8 DS:20c4
    L_BP90! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0   '@11bf5 DS:2056
    V_0e30! = V_0f7e!   '@11c21
    GOTO L_11ccc_v   '@11c21
L_11c28:
    GOSUB L_12f0e   '@11c28
    RT_LINE 0, 0, RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP44!)), 0   '@11c35
    V_0f82! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0 + V_0f82!   '@11c86 DS:2056
L_11ccb:
    V_0e30! = FX##(L_BP90!) + V_0e30!   '@11ccc
L_11ccc_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP90! < 0.0) THEN GOTO L_11d01   '@11cd3 DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BP8c!) THEN GOTO L_11c28   '@11ce9
    GOTO L_11d17   '@11cfe
L_11d01:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BP8c!) THEN GOTO L_11c28   '@11d02
L_11d17:
    V_0f82! = V_0f82! - (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0   '@11d17 DS:2056
    V_0e30! = V_0f7e!   '@11d50
    CALL S_1954b   '@11d61
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RT_PSET RT_SNG!(FX##(V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@11d6b
    IF NOT (A_0faa%(RT_CINT%(FX##(V_0e14!))) = 0) THEN GOTO L_11dda   '@11dab
    GOTO L_12085   '@11dd2
L_11dda:
    L_BP94! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@11dda
    FOR V_0e1c! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP94!   '@11e06 DS:1fb6
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_0e1c!)))) + V_0f7e! <= FX##(A_1006!(0)) AND V_0e14! = 0.0) THEN GOTO L_11ef1   '@11e46 DS:20a2
    V_0e30! = FX##(A_1006!(0)) - A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@11eaf
    GOTO L_11f74   '@11ee9
L_11ef1:
    IF NOT (V_0e14! = 0.0) THEN GOTO L_11f14   '@11ef1 DS:20a2
    GOTO L_12054   '@11f0c
L_11f14:
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e1c!))) <= V_0f7e!) THEN GOTO L_11f4d   '@11f14
    GOTO L_12054   '@11f45
L_11f4d:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@11f4d
L_11f74:
    CALL S_1954b   '@11f79
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@11f83
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38! - A_10ec!(RT_CINT%(FX##(V_0e1c!)))) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@11fde
L_12054:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@12059 DS:1fb6
L_12085:
    RT_LINE 0, 0, RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - A_1654!(RT_CINT%(FX##(V_0e14!)), 1)) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@1208a
    IF NOT (FX##(V_0ddc!) + 1.0 <= FX##(V_0e14!)) THEN GOTO L_1211d   '@120f5 DS:1fb6
    GOTO L_128f4   '@12115
L_1211d:
    GOSUB L_134f2   '@1211d
    RT_PSET RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 0, 0   '@1212a
    V_0f7e! = 0.0   '@1216a DS:20a2
    V_0e30! = 0.0   '@1217b DS:20a2
    V_0f86! = V_0f82!   '@1218c
    V_0e14! = FX##(V_0e14!) + 1.0   '@1219d DS:1fb6
    V_0e24! = FX##(V_0e24!) + 1.0   '@121b3 DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11b03   '@121c9
L_121d1:
    V_0f6e! = FX##(V_0f6a!) - V_0f82!   '@121d6
    GOSUB L_15910   '@121ec
    GOSUB L_14b49   '@121f9
    RT_PSET RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 0, 0   '@12206
    L_BP98! = FX##(V_0f7e!) + V_0f6e! + (0.00999999977648258209228515625## - FX##(V_0f6e!) / 20.0)   '@12246 DS:2056,20c4
    L_BP9c! = FX##(V_0f6e!) / 20.0   '@12272 DS:2056
    V_0e30! = V_0f7e!   '@12283
    GOTO L_12313_v   '@12283
L_1228a:
    GOSUB L_12f0e   '@1228a
    RT_LINE 0, 0, RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP44!)), 0   '@12297
    V_0f82! = FX##(V_0f6e!) / 20.0 + V_0f82!   '@122e8 DS:2056
L_12312:
    V_0e30! = FX##(L_BP9c!) + V_0e30!   '@12313
L_12313_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP9c! < 0.0) THEN GOTO L_12348   '@1231a DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BP98!) THEN GOTO L_1228a   '@12330
    GOTO L_1235e   '@12345
L_12348:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BP98!) THEN GOTO L_1228a   '@12349
L_1235e:
    V_0e30! = FX##(V_0f7e!) + V_0f6e!   '@1235e
    GOSUB L_12f0e   '@12374
    RT_LINE 0, 0, V_0e5c!, RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP44!)), 0   '@12381
    V_0e30! = V_0f7e!   '@123c6
    CALL S_1954b   '@123d7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RT_PSET RT_SNG!(FX##(V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@123e1
    IF NOT (A_0faa%(RT_CINT%(FX##(V_0e14!))) = 0) THEN GOTO L_1245a   '@1242b
    GOTO L_12795   '@12452
L_1245a:
    L_BPa0! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@1245a
    FOR V_0e1c! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BPa0!   '@12486 DS:1fb6
    IF NOT ((FX##(A_1006!(0)) - A_10be!(RT_CINT%(FX##(V_0e1c!))) <= FX##(V_0f7e!) + V_0f6e! OR FX##(A_10be!(RT_CINT%(FX##(V_0e1c!)))) + V_0f7e! <= FX##(A_1006!(0))) AND V_0e14! = 0.0) THEN GOTO L_125c1   '@124c6 DS:20a2
    V_0e30! = FX##(A_1006!(0)) - A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@1257a
    GOTO L_12684   '@125b4
L_125c1:
    IF NOT (V_0e14! = 0.0) THEN GOTO L_125e4   '@125c1 DS:20a2
    GOTO L_12764   '@125dc
L_125e4:
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_0e1c!)))) >= FX##(V_0f7e!) + V_0f6e! OR A_10be!(RT_CINT%(FX##(V_0e1c!))) <= V_0f7e!) THEN GOTO L_1265d   '@125e4
    GOTO L_12764   '@12655
L_1265d:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@1265d
L_12684:
    CALL S_1954b   '@12689
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@12693
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38! - A_10ec!(RT_CINT%(FX##(V_0e1c!)))) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@126ee
L_12764:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@12769 DS:1fb6
L_12795:
    V_0e30! = FX##(V_0f7e!) + V_0f6e!   '@1279a
    CALL S_1954b   '@127b0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RT_LINE 0, 0, V_0e5c!, RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP48!)), 0   '@127ba
    RT_ROTINA_109C   '@127ff (rotina em assembly ligada ao EXE (SUB_4109c); gerada no fim do programa)
    GOSUB L_12cc1   '@12809
    V_0f82! = 0.0   '@12816 DS:20a2
    V_0f86! = 0.0   '@12827 DS:20a2
    RT_PSET RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e2c!) * V_0f76! + V_0e64!), 0, 0   '@12838
    V_0f7e! = FX##(V_0f7e!) + V_0f6e!   '@12878
    V_0e24! = FX##(V_0e24!) + 1.0   '@1288e DS:1fb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_11b03   '@128a4
L_128ac:
    IF NOT (A_156e!(RT_CINT%(FX##(V_0ddc!) + V_0de4! + V_0e20!)) = 1.0) THEN GOTO L_128f4   '@128b1 DS:1fb6
    GOTO L_12c10   '@128ec
L_128f4:
    L_BPa2% = (V_17f2$ = "EGA")   '@128f9 DS:205e
    RT_LINE RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!(FX##(L_BP0e!) * V_0f76! + V_0e64!), V_0e5c!, RT_SNG!(FX##(L_BP0e!) * V_0f76! + V_0e64!), 9, (-(V_17f2$ = "VGA" OR L_BPa2%)), 0   '@12975 DS:2066
    L_BPa4% = (V_17f2$ = "EGA")   '@12993 DS:205e,20bc
    RT_LINE RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!(FX##(V_0e64!) - 1.0 + FX##(L_BP0e!) * V_0f76!), V_0e5c!, RT_SNG!(FX##(V_0e64!) - 1.0 + FX##(L_BP0e!) * V_0f76!), 9, (-(V_17f2$ = "VGA" OR L_BPa4%)), 0   '@12a1f DS:2066
    L_BPa6% = (V_17f2$ = "EGA")   '@12a3d DS:1fb6,205e
    RT_LINE RT_SNG!(FX##(V_0f82!) * V_0f72!), RT_SNG!(FX##(V_0e64!) + 1.0 + FX##(L_BP0e!) * V_0f76!), V_0e5c!, RT_SNG!(FX##(V_0e64!) + 1.0 + FX##(L_BP0e!) * V_0f76!), 9, (-(V_17f2$ = "VGA" OR L_BPa6%)), 0   '@12ac9 DS:2066
    L_BPa8% = (V_0e80$ = "VIDEO")   '@12ae7 DS:20b2
    L_BPaa% = V_0e80$ = "FOTO" OR L_BPa8%   '@12b0d DS:20aa
    IF NOT ((V_1822$ = "S" AND L_BPaa%) <> 0) THEN GOTO L_12b80   '@12b2a DS:2104
    RT_GCAIXA 0, 0, V_0e5c!, V_0e60!, 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_1DA4(1): RT_GFIM   '@12b40
L_12b80:
    IF NOT (VAL(V_0e80$) <> 0.0#) THEN GOTO L_12bbb   '@12b80 DS:209a
    RT_ROTINA_109C   '@12ba4 (rotina em assembly ligada ao EXE (SUB_4109c); gerada no fim do programa)
    GOTO L_12c88   '@12bae
L_12bbb:
    IF NOT (V_0e80$ = "FOTO") THEN GOTO L_12c10   '@12bbb DS:20aa
    L_BP7c! = FX##(L_BP7c!) + 1.0   '@12bd2 DS:1fb6
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@12be6 DS:1f10
    RT_ROTINA_0F20   '@12bf9 (rotina em assembly ligada ao EXE (SUB_40f20); gerada no fim do programa)
    GOTO L_12c88   '@12c03
L_12c10:
    IF NOT (V_1832$ = "S") THEN GOTO L_12c83   '@12c15 DS:2104
    LOCATE 25, 3   '@12c2c
    PRINT "Qualquer Tecla para Continuar ";   '@12c4a DS:2130
    CALL MIXT_07f1_LimpaTeclado   '@12c58
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@12c62
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_12c83:
L_12c88:
    LOCATE 25, 40   '@12c8d
    PRINT "Aguarde ...";   '@12cab DS:2152
    GOTO L_1953b   '@12cb9
    ' ---- F_12cc1 @0x12cc1  (012cc1_F_12cc1.lift.txt; evidence_id (assembly): ev_03b4aa81c061022e06dc6ad86cdf8015a69a08ac2eb72de83ad86e9175664b2c)
L_12cc1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    IF NOT (V_17f2$ = "HER") THEN GOTO L_12cf8   '@12cc6 DS:2082
    RT_SCREEN 3   '@12cdd
L_12cf8:
    L_BPac% = (V_17f2$ = "CGA")   '@12cf8 DS:202a
    IF NOT ((V_17f2$ = "MCG" OR L_BPac%) <> 0) THEN GOTO L_12d4c   '@12d1e DS:2032
    RT_SCREEN 2   '@12d34
L_12d4c:
    L_BPae% = (V_17f2$ = "EGA")   '@12d4c DS:205e
    IF NOT ((V_17f2$ = "VGA" OR L_BPae%) <> 0) THEN GOTO L_12db9   '@12d72 DS:2066
    RT_SCREEN 9   '@12d88
    COLOR , 1   '@12d9e
L_12db9:
    RT_CLS -1   '@12db9
    RT_LINE 0.0, RT_SNG!(FX##(L_BP0e!) * V_0f76! + V_0e64!), V_0e5c!, RT_SNG!(FX##(L_BP0e!) * V_0f76! + V_0e64!), 9, V_191e%, 0   '@12dc7 DS:20a2
    RT_LINE 0.0, RT_SNG!(FX##(V_0e64!) - 1.0 + FX##(L_BP0e!) * V_0f76!), V_0e5c!, RT_SNG!(FX##(V_0e64!) - 1.0 + FX##(L_BP0e!) * V_0f76!), 9, V_191e%, 0   '@12e26 DS:20a2,20bc
    RT_LINE 0.0, RT_SNG!(FX##(V_0e64!) + 1.0 + FX##(L_BP0e!) * V_0f76!), V_0e5c!, RT_SNG!(FX##(V_0e64!) + 1.0 + FX##(L_BP0e!) * V_0f76!), 9, V_191e%, 0   '@12e95 DS:1fb6,20a2
    RETURN   '@12f04
L_12f0e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    IF NOT (V_0e14! > 0.0) THEN GOTO L_12f36   '@12f13 DS:20a2
    GOTO L_13264   '@12f2e
L_12f36:
    V_0e2c! = 0.0   '@12f36 DS:20a2
    IF NOT (A_0faa%(0) = 0) THEN GOTO L_12f70   '@12f47
    RETURN   '@12f66
L_12f70:
    L_BPb2! = A_0faa%(0)   '@12f70
    FOR V_0e48! = 1.0 TO L_BPb2!   '@12f94 DS:1fb6
    IF NOT (A_0faa%(0) = V_0e48!) THEN GOTO L_12fe1   '@12f9c
    L_BP36! = 0.0   '@12fc9 DS:20a2
    GOTO L_1300c   '@12fd9
L_12fe1:
    L_BP36! = A_10be!(RT_CINT%(FX##(V_0e48!) + 1.0))   '@12fe1 DS:1fb6
L_1300c:
    IF NOT (FX##(A_1006!(0)) - L_BP36! < FX##(V_0e30!)) THEN GOTO L_13046   '@13011
    GOTO L_13115   '@1303e
L_13046:
    V_0e2c! = RT_POT##((A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_0e2c! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!)))   '@13046 DS:20cc
    GOTO L_13255   '@1310d
L_13115:
    V_0e2c! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP36!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_0e2c! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!))) + (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP36!) * A_1062!(RT_CINT%(FX##(V_0e48!))) * (L_BP36! - (FX##(A_1006!(0)) - V_0e30!))   '@1311a DS:20cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@13229 DS:1fb6
L_13255:
    RETURN   '@1325a
L_13264:
    V_0e2c! = -(FX##(A_1654!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0e30!) - A_15ca!(RT_CINT%(FX##(V_0e14!) - 1.0))   '@13269 DS:20bc
    L_BP36! = 0.0   '@132bb DS:20a2
    L_BPb6! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@132cb
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BPb6!   '@132f7 DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) > V_0e30!) THEN GOTO L_133ba   '@13336
    V_0e2c! = RT_POT##((FX##(V_0e30!) - L_BP36!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_0e2c!   '@13367 DS:20cc
    GOTO L_134e3   '@133ad
L_133ba:
    V_0e2c! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP36!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_0e2c! + ((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP36!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + A_10ec!(RT_CINT%(FX##(V_0e48!)))) * (FX##(V_0e30!) - A_10be!(RT_CINT%(FX##(V_0e48!))))   '@133ba DS:20cc
    L_BP36! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@13491
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@134b7 DS:1fb6
L_134e3:
    RETURN   '@134e8
L_134f2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    RT_LINE RT_SNG!(FX##(V_0f82!) * V_0f72!), V_0e64!, RT_SNG!(FX##(V_0f82!) * V_0f72!), V_0e60!, 9, V_191e%, 0   '@134f7
    L_BPba! = INT(FX##(L_BP12!) / L_BP16!) * L_BP16!   '@1354e
    L_BPbe! = L_BP16!   '@1356e
    V_0e48! = -INT(FX##(L_BP0e!) / L_BP16!) * L_BP16!   '@13579
    GOTO L_1378c_v   '@13579
L_13592:
    IF NOT (V_0e48! < L_BP16! AND -L_BP16! < V_0e48!) THEN GOTO L_135d9   '@13592
    GOTO L_13777   '@135d1
L_135d9:
    L_BPc2! = 0.0   '@135d9 DS:20a2
    L_BPc6! = FX##(V_0f82!) * V_0f72! - 4.0   '@135eb DS:2162
    CALL MIXT_082a_Maior(L_BPc2!, L_BPc6!, L_BPca!)   '@13600
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPce! = FX##(V_0f82!) * V_0f72! + 4.0   '@13614 DS:2166
    CALL MIXT_0877_Menor(V_0e5c!, L_BPce!, L_BPd2!)   '@13654
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINE L_BPca!, RT_SNG!((FX##(L_BP0e!) + V_0e48!) * V_0f76! + V_0e64!), L_BPd2!, RT_SNG!((FX##(L_BP0e!) + V_0e48!) * V_0f76! + V_0e64!), 1, 0, 0   '@13667
    IF NOT (V_0e84$ = "S") THEN GOTO L_136bd   '@1369e DS:2104
    GOTO L_13777   '@136b5
L_136bd:
    V_0dfc$ = STR$(V_0e48!)   '@136bd
    L_BPd6! = FX##(V_0f82!) * V_0f72! + V_0e68!   '@136d9
    L_BPda! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@136f5
    CALL MIXT_0877_Menor(L_BPd6!, L_BPda!, L_BPde!)   '@13716
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e3c! = L_BPde!   '@1372b
    V_0e40! = FX##(V_0e64!) + 2.0 + (FX##(L_BP0e!) + V_0e48!) * V_0f76!   '@13736 DS:20cc
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@1375d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_13777:
L_1378b:
    V_0e48! = FX##(L_BPbe!) + V_0e48!   '@1378c
L_1378c_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BPbe! < 0.0) THEN GOTO L_137c1   '@13793 DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e48! < L_BPba!) THEN GOTO L_13592   '@137a9
    GOTO L_137d7   '@137be
L_137c1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e48! > L_BPba!) THEN GOTO L_13592   '@137c2
L_137d7:
    RT_PSET RT_SNG!(FX##(V_0f82!) * V_0f72!), V_0e64!, 0, 0   '@137d7
    RETURN   '@13802
L_1380c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR (V_0e14! = 0.0 OR V_0e70$ = "N")) THEN GOTO L_13875   '@13811 DS:1fb6,20a2,216a
    RETURN   '@1386b
L_13875:
    L_BP1e! = V_0f82!   '@13875
    RT_PSET RT_SNG!(FX##(L_BP1e!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 0, 0   '@13885
    L_BPe2! = V_1882!   '@138c4
    L_BPe6! = A_1006!(RT_CINT%(FX##(V_0e14!))) + 0.00999999977648258209228515625##   '@138d5 DS:20c4
    L_BPea! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0   '@13902 DS:2056
    V_0e30! = V_0f7e!   '@1392e
    GOTO L_13aa5_v   '@1392e
L_13936:
    CALL S_19a28   '@13936
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1882! > 0.0 AND L_BPe2! > 0.0) THEN GOTO L_139ce   '@13940 DS:20a2
    RT_LINE 0, 0, RT_SNG!(FX##(L_BP1e!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@1397e
L_139ce:
    L_BP1e! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0 + L_BP1e!   '@139ce DS:2056
    L_BPe2! = V_1882!   '@13a02
    IF NOT (V_1882! > 0.0) THEN GOTO L_13a95   '@13a13 DS:20a2
    RT_PSET RT_SNG!((L_BP1e! - (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 0, 0   '@13a2e DS:2056
L_13a95:
L_13aa4:
    V_0e30! = FX##(L_BPea!) + V_0e30!   '@13aa5
L_13aa5_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BPea! < 0.0) THEN GOTO L_13ada   '@13aac DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BPe6!) THEN GOTO L_13936   '@13ac2
    GOTO L_13af0   '@13ad7
L_13ada:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BPe6!) THEN GOTO L_13936   '@13adb
L_13af0:
    L_BP1a! = V_0f82!   '@13af0
    RT_PSET RT_SNG!(FX##(L_BP1a!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 0, 0   '@13b00
    L_BPe2! = V_1886!   '@13b3f
    L_BPee! = A_1006!(RT_CINT%(FX##(V_0e14!))) + 0.00999999977648258209228515625##   '@13b50 DS:20c4
    L_BPf2! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0   '@13b7d DS:2056
    V_0e30! = V_0f7e!   '@13ba9
    GOTO L_13d1f_v   '@13ba9
L_13bb0:
    CALL S_1a4e5   '@13bb0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1886! < 0.0 AND L_BPe2! < 0.0) THEN GOTO L_13c48   '@13bba DS:20a2
    RT_LINE 0, 0, RT_SNG!(FX##(L_BP1a!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@13bf8
L_13c48:
    L_BP1a! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0 + L_BP1a!   '@13c48 DS:2056
    L_BPe2! = V_1886!   '@13c7c
    IF NOT (V_1886! < 0.0) THEN GOTO L_13d0f   '@13c8d DS:20a2
    RT_PSET RT_SNG!((L_BP1a! - (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e!) / 20.0) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 0, 0   '@13ca8 DS:2056
L_13d0f:
L_13d1e:
    V_0e30! = FX##(L_BPf2!) + V_0e30!   '@13d1f
L_13d1f_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BPf2! < 0.0) THEN GOTO L_13d54   '@13d26 DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BPee!) THEN GOTO L_13bb0   '@13d3c
    GOTO L_13d6a   '@13d51
L_13d54:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BPee!) THEN GOTO L_13bb0   '@13d55
L_13d6a:
    L_BP3e% = 0   '@13d6a
    GOSUB L_1482b   '@13d74
    L_BP22! = V_0f86!   '@13d81
    L_BP2e! = V_0f7e!   '@13d91
    V_0e30! = V_0f7e!   '@13da1
    GOSUB L_14488   '@13db2
    V_0e38! = L_BP26!   '@13dbf
    IF NOT (L_BP3e% = 1) THEN GOTO L_13dfa   '@13dcf
    GOSUB L_145d6   '@13ddd
    V_0e38! = L_BP2a!   '@13dea
L_13dfa:
    RT_PSET RT_SNG!(FX##(L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@13dfa
    L_BPf6! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@13e39
    FOR V_0e1c! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BPf6!   '@13e65 DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e1c!))) <= V_0f7e!) THEN GOTO L_13edd   '@13ea4
    GOTO L_1444d   '@13ed5
L_13edd:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@13ee2
    IF NOT (A_15f8!(RT_CINT%(FX##(V_0e14!))) <= V_0e30! AND A_15f8!(RT_CINT%(FX##(V_0e14!))) > L_BP2e!) THEN GOTO L_13f9b   '@13f09
    V_0e30! = A_15f8!(RT_CINT%(FX##(V_0e14!)))   '@13f74
L_13f9b:
    GOSUB L_14488   '@13f9b
    V_0e38! = L_BP26!   '@13fa8
    IF NOT (L_BP3e% > 0) THEN GOTO L_14007   '@13fb8
    GOSUB L_145d6   '@13fc6
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_14002   '@13fd3
    V_0e38! = L_BP2a!   '@13ff2
L_14002:
L_14007:
    IF NOT (ABS(FX##(L_BP26!)) >= ABS(FX##(L_BP2a!)) AND L_BP3e% = 1) THEN GOTO L_14143   '@14007
    V_0e30! = L_BP2e! + 0.20000000298023223876953125##   '@1403c DS:20c8
L_14051:
    GOSUB L_14488   '@14056
    GOSUB L_145d6   '@14063
    IF NOT (FX##(L_BP26!) * L_BP2a! < FX##(0.0) OR ABS(FX##(L_BP26!)) > ABS(FX##(L_BP2a!))) THEN GOTO L_140c7   '@14070 DS:20a2
    L_BP3e% = 0   '@140b5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_13edd   '@140bf
L_140c7:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - L_BP2a!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@140c7
    V_0e30! = V_0e30! + 0.20000000298023223876953125##   '@14120 DS:20c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14051   '@14136
L_14143:
    IF NOT (ABS(FX##(L_BP26!)) <= ABS(FX##(L_BP2a!)) AND L_BP3e% = 2) THEN GOTO L_1427f   '@14143
    V_0e30! = L_BP2e! + 0.20000000298023223876953125##   '@14178 DS:20c8
L_1418d:
    GOSUB L_14488   '@14192
    GOSUB L_145d6   '@1419f
    IF NOT (FX##(L_BP2a!) * L_BP26! < FX##(0.0) OR ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_14203   '@141ac DS:20a2
    L_BP3e% = 1   '@141f1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_13edd   '@141fb
L_14203:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - L_BP26!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@14203
    V_0e30! = V_0e30! + 0.20000000298023223876953125##   '@1425c DS:20c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1418d   '@14272
L_1427f:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@1427f
    L_BP2e! = V_0e30!   '@142d9
    V_0e30! = V_0e30! + 0.001000000047497451305389404296875##   '@142e9 DS:2170
    GOSUB L_14488   '@142ff
    V_0e38! = L_BP26!   '@1430c
    IF NOT (L_BP3e% > 0) THEN GOTO L_1436b   '@1431c
    GOSUB L_145d6   '@1432a
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_14366   '@14337
    V_0e38! = L_BP2a!   '@14356
L_14366:
L_1436b:
    V_0e30! = L_BP2e!   '@1436b
    RT_PSET RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@1437b
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e1c!))) > A_15f8!(RT_CINT%(FX##(V_0e14!))) AND A_15f8!(RT_CINT%(FX##(V_0e14!))) = L_BP2e!) THEN GOTO L_1444d   '@143c4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_13edd   '@14445
L_1444d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@14452 DS:1fb6
    RETURN   '@1447e
L_14488:   ' sub-rotina (alvo de GOSUB)
    CALL S_1954b   '@1448d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0e38! = FX##(-V_0e38!) * (ABS(FX##(V_0e38!)) > 0.001000000047497451305389404296875## OR A_15f8!(RT_CINT%(FX##(V_0e14!))) <> V_0e30!)   '@14497 DS:2170
    L_BP26! = V_0e38! - (V_0e38! > 0.0) * (FX##(A_1796!(RT_CINT%(FX##(V_0e14!)), 1)) - A_1654!(RT_CINT%(FX##(V_0e14!)), 1)) + (V_0e38! <= 0.0) * (FX##(A_1796!(RT_CINT%(FX##(V_0e14!)), 0)) - A_1654!(RT_CINT%(FX##(V_0e14!)), 0))   '@144fe DS:20a2
    RETURN   '@145cc
L_145d6:   ' sub-rotina (alvo de GOSUB)
    L_BP2a! = -L_BP3a!   '@145db
    L_BP36! = 0.0   '@145ed DS:20a2
    L_BPfa! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@145fd
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BPfa!   '@14629 DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) >= V_0e30!) THEN GOTO L_146f2   '@14668
    L_BP2a! = (FX##(A_1062!(RT_CINT%(FX##(V_0e48!)))) - A_1090!(RT_CINT%(FX##(V_0e48!)))) * (FX##(V_0e30!) - L_BP36!) + L_BP2a!   '@14699
    GOTO L_14821   '@146ea
L_146f2:
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) < V_0e30!) THEN GOTO L_1478a   '@146f2
    L_BP2a! = (FX##(A_1062!(RT_CINT%(FX##(V_0e48!)))) - A_1090!(RT_CINT%(FX##(V_0e48!)))) * (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP36!) + L_BP2a!   '@14723
L_1478a:
    L_BP2a! = FX##(A_10ec!(RT_CINT%(FX##(V_0e48!)))) - A_111a!(RT_CINT%(FX##(V_0e48!))) + L_BP2a!   '@1478a
    L_BP36! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@147cf
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@147f5 DS:1fb6
L_14821:
    RETURN   '@14821
L_1482b:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1796!(RT_CINT%(FX##(V_0e14!)), 3) < A_1654!(RT_CINT%(FX##(V_0e14!)), 0) AND A_1796!(RT_CINT%(FX##(V_0e14!)), 3) < 0.0) THEN GOTO L_148f6   '@14830 DS:20a2
    L_BP3e% = 1   '@148bd
    L_BP3a! = A_1796!(RT_CINT%(FX##(V_0e14!)), 3)   '@148c7
L_148f6:
    IF NOT (A_1796!(RT_CINT%(FX##(V_0e14!)), 4) < A_1654!(RT_CINT%(FX##(V_0e14!)), 1) AND A_1796!(RT_CINT%(FX##(V_0e14!)), 4) < 0.0) THEN GOTO L_14b3f   '@148f6 DS:20a2
    L_BP3e% = 2   '@14984
    L_BP3a! = 0.0   '@1498e DS:20a2
    L_BP36! = 0.0   '@1499e DS:20a2
    L_BPfe! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@149ae
    FOR V_0e1c! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BPfe!   '@149da DS:1fb6
    L_BP3a! = (FX##(A_1062!(RT_CINT%(FX##(V_0e1c!)))) - A_1090!(RT_CINT%(FX##(V_0e1c!)))) * (FX##(A_10be!(RT_CINT%(FX##(V_0e1c!)))) - L_BP36!) + L_BP3a! + (FX##(A_10ec!(RT_CINT%(FX##(V_0e1c!)))) - A_111a!(RT_CINT%(FX##(V_0e1c!))))   '@14a1a
    L_BP36! = A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@14aba
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@14ae0 DS:1fb6
    L_BP3a! = FX##(L_BP3a!) - A_1796!(RT_CINT%(FX##(V_0e14!)), 4)   '@14b0c
L_14b3f:
    RETURN   '@14b3f
L_14b49:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR (V_0e14! = 0.0 OR V_0e70$ = "N")) THEN GOTO L_14bb2   '@14b4e DS:1fb6,20a2,216a
    RETURN   '@14ba8
L_14bb2:
    L_BP1e! = V_0f82!   '@14bb2
    RT_PSET RT_SNG!(FX##(L_BP1e!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 0, 0   '@14bc2
    L_BPe2! = V_1882!   '@14c01
    L_BP102! = FX##(V_0f7e!) + V_0f6e! + (0.00999999977648258209228515625## - FX##(V_0f6e!) / 20.0)   '@14c12 DS:2056,20c4
    L_BP106! = FX##(V_0f6e!) / 20.0   '@14c3e DS:2056
    V_0e30! = V_0f7e!   '@14c4f
    GOTO L_14d8f_v   '@14c4f
L_14c56:
    CALL S_19a28   '@14c56
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1882! > 0.0 AND L_BPe2! > 0.0) THEN GOTO L_14cee   '@14c60 DS:20a2
    RT_LINE 0, 0, RT_SNG!(FX##(L_BP1e!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@14c9e
L_14cee:
    L_BP1e! = FX##(V_0f6e!) / 20.0 + L_BP1e!   '@14cee DS:2056
    L_BPe2! = V_1882!   '@14d07
    IF NOT (V_1882! > 0.0) THEN GOTO L_14d7f   '@14d18 DS:20a2
    RT_PSET RT_SNG!((L_BP1e! - FX##(V_0f6e!) / 20.0) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 0, 0   '@14d33 DS:2056
L_14d7f:
L_14d8e:
    V_0e30! = FX##(L_BP106!) + V_0e30!   '@14d8f
L_14d8f_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP106! < 0.0) THEN GOTO L_14dc4   '@14d96 DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BP102!) THEN GOTO L_14c56   '@14dac
    GOTO L_14dda   '@14dc1
L_14dc4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BP102!) THEN GOTO L_14c56   '@14dc5
L_14dda:
    V_0e30! = FX##(V_0f7e!) + V_0f6e!   '@14dda
    CALL S_19a28   '@14df0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1882! > 0.0 AND L_BPe2! > 0.0) THEN GOTO L_14e7d   '@14dfa DS:20a2
    RT_LINE 0, 0, V_0e5c!, RT_SNG!((FX##(L_BP0e!) - V_1882!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@14e38
L_14e7d:
    L_BP1a! = V_0f82!   '@14e7d
    RT_PSET RT_SNG!(FX##(L_BP1a!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 0, 0   '@14e8d
    L_BPe2! = V_1886!   '@14ecc
    L_BP10a! = FX##(V_0f7e!) + V_0f6e! + (0.00999999977648258209228515625## - FX##(V_0f6e!) / 20.0)   '@14edd DS:2056,20c4
    L_BP10e! = FX##(V_0f6e!) / 20.0   '@14f09 DS:2056
    V_0e30! = V_0f7e!   '@14f1a
    GOTO L_1505b_v   '@14f1a
L_14f22:
    CALL S_1a4e5   '@14f22
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1886! < 0.0 AND L_BPe2! < 0.0) THEN GOTO L_14fba   '@14f2c DS:20a2
    RT_LINE 0, 0, RT_SNG!(FX##(L_BP1a!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@14f6a
L_14fba:
    L_BP1a! = FX##(V_0f6e!) / 20.0 + L_BP1a!   '@14fba DS:2056
    L_BPe2! = V_1886!   '@14fd3
    IF NOT (V_1886! < 0.0) THEN GOTO L_1504b   '@14fe4 DS:20a2
    RT_PSET RT_SNG!((L_BP1a! - FX##(V_0f6e!) / 20.0) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 0, 0   '@14fff DS:2056
L_1504b:
L_1505a:
    V_0e30! = FX##(L_BP10e!) + V_0e30!   '@1505b
L_1505b_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP10e! < 0.0) THEN GOTO L_15090   '@15062 DS:20a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! < L_BP10a!) THEN GOTO L_14f22   '@15078
    GOTO L_150a6   '@1508d
L_15090:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e30! > L_BP10a!) THEN GOTO L_14f22   '@15091
L_150a6:
    V_0e30! = FX##(V_0f7e!) + V_0f6e!   '@150a6
    CALL S_1a4e5   '@150bc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_1886! < 0.0 AND L_BPe2! < 0.0) THEN GOTO L_15149   '@150c6 DS:20a2
    RT_LINE 0, 0, V_0e5c!, RT_SNG!((FX##(L_BP0e!) - V_1886!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP4c!)), 0   '@15104
L_15149:
    L_BP3e% = 0   '@15149
    GOSUB L_1482b   '@15153
    L_BP22! = V_0f86!   '@15160
    L_BP2e! = V_0f7e!   '@15170
    V_0e30! = V_0f7e!   '@15180
    GOSUB L_14488   '@15191
    V_0e38! = L_BP26!   '@1519e
    IF NOT (L_BP3e% = 1) THEN GOTO L_151d9   '@151ae
    GOSUB L_145d6   '@151bc
    V_0e38! = L_BP2a!   '@151c9
L_151d9:
    RT_PSET RT_SNG!(FX##(L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@151d9
    L_BP112! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@15218
    FOR V_0e1c! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP112!   '@15244 DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e1c!))) <= V_0f7e!) THEN GOTO L_152bd   '@15284
    GOTO L_15817   '@152b5
L_152bd:
    V_0e30! = A_10be!(RT_CINT%(FX##(V_0e1c!)))   '@152c2
    IF NOT (A_15f8!(RT_CINT%(FX##(V_0e14!))) <= V_0e30! AND A_15f8!(RT_CINT%(FX##(V_0e14!))) > L_BP2e!) THEN GOTO L_1537b   '@152e9
    V_0e30! = A_15f8!(RT_CINT%(FX##(V_0e14!)))   '@15354
L_1537b:
    IF NOT (FX##(V_0f7e!) + V_0f6e! >= FX##(V_0e30!)) THEN GOTO L_15695   '@1537b
    GOSUB L_14488   '@1539b
    V_0e38! = L_BP26!   '@153a8
    IF NOT (L_BP3e% > 0) THEN GOTO L_15407   '@153b8
    GOSUB L_145d6   '@153c6
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_15402   '@153d3
    V_0e38! = L_BP2a!   '@153f2
L_15402:
L_15407:
    IF NOT (ABS(FX##(L_BP26!)) >= ABS(FX##(L_BP2a!)) AND L_BP3e% = 1) THEN GOTO L_1551d   '@15407
    V_0e30! = L_BP2e! + 0.20000000298023223876953125##   '@1543c DS:20c8
L_15451:
    GOSUB L_14488   '@15456
    GOSUB L_145d6   '@15463
    IF NOT (ABS(FX##(L_BP26!)) > ABS(FX##(L_BP2a!))) THEN GOTO L_154a1   '@15470
    L_BP3e% = 0   '@1548f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_152bd   '@15499
L_154a1:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - L_BP2a!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@154a1
    V_0e30! = V_0e30! + 0.20000000298023223876953125##   '@154fa DS:20c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15451   '@15510
L_1551d:
    IF NOT (ABS(FX##(L_BP26!)) <= ABS(FX##(L_BP2a!)) AND L_BP3e% = 2) THEN GOTO L_15633   '@1551d
    V_0e30! = L_BP2e! + 0.20000000298023223876953125##   '@15552 DS:20c8
L_15567:
    GOSUB L_14488   '@1556c
    GOSUB L_145d6   '@15579
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_155b7   '@15586
    L_BP3e% = 1   '@155a5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_152bd   '@155af
L_155b7:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - L_BP26!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@155b7
    V_0e30! = V_0e30! + 0.20000000298023223876953125##   '@15610 DS:20c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15567   '@15626
L_15633:
    RT_LINE 0, 0, RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 8, RT_CINT%(FX##(L_BP50!)), 0   '@15633
    GOTO L_156a2   '@1568d
L_15695:
    GOTO L_15817   '@15695
L_156a2:
    L_BP2e! = V_0e30!   '@156a2
    V_0e30! = V_0e30! + 0.001000000047497451305389404296875##   '@156b2 DS:2170
    GOSUB L_14488   '@156c8
    V_0e38! = L_BP26!   '@156d5
    IF NOT (L_BP3e% > 0) THEN GOTO L_15734   '@156e5
    GOSUB L_145d6   '@156f3
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_1572f   '@15700
    V_0e38! = L_BP2a!   '@1571f
L_1572f:
L_15734:
    V_0e30! = L_BP2e!   '@15734
    RT_PSET RT_SNG!((FX##(V_0e30!) - V_0f7e! + L_BP22!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0   '@15744
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e1c!))) > A_15f8!(RT_CINT%(FX##(V_0e14!))) AND A_15f8!(RT_CINT%(FX##(V_0e14!))) = V_0e30!) THEN GOTO L_15817   '@1578d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_152bd   '@1580f
L_15817:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e1c!   '@1581c DS:1fb6
    V_0e30! = FX##(V_0f7e!) + V_0f6e!   '@15848
    GOSUB L_14488   '@1585e
    V_0e38! = L_BP26!   '@1586b
    IF NOT (L_BP3e% > 0) THEN GOTO L_158ca   '@1587b
    GOSUB L_145d6   '@15889
    IF NOT (ABS(FX##(L_BP2a!)) > ABS(FX##(L_BP26!))) THEN GOTO L_158c5   '@15896
    V_0e38! = L_BP2a!   '@158b5
L_158c5:
L_158ca:
    RT_LINE 0, 0, V_0e5c!, RT_SNG!((FX##(L_BP0e!) - V_0e38!) * V_0f76! + V_0e64!), 0, 0, 0   '@158ca
    RETURN   '@15906
L_15910:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010771_FUN_1000_0771
    IF NOT (V_0e84$ <> "S") THEN GOTO L_15936   '@15915 DS:2104
    RETURN   '@1592c
L_15936:
    GOSUB L_15b9a   '@15936
    GOSUB L_1808a   '@15943
    V_0eb2! = A_1006!(RT_CINT%(FX##(V_0e14!)))   '@15950
    V_0eb6! = V_0e14!   '@15977
    GOSUB L_17072   '@15988
    IF NOT (V_0e14! > 0.0 AND (V_0f86! = 0.0 AND V_0f7e! = 0.0 OR V_0f7e! > 0.0)) THEN GOTO L_15a16   '@15995 DS:20a2
    GOSUB L_15a95   '@15a09
L_15a16:
    IF NOT (FX##(V_0ddc!) + 1.0 > FX##(V_0e14!) AND (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! > FX##(640.0)) THEN GOTO L_15a8b   '@15a16 DS:1fb6,2174
    GOSUB L_15afa   '@15a7e
L_15a8b:
    RETURN   '@15a8b
L_15a95:   ' sub-rotina (alvo de GOSUB)
    V_0eb6! = V_0e14!   '@15a9a
    V_0e14! = FX##(V_0e14!) - 1.0   '@15aab DS:20bc
    V_0eb2! = 0.0   '@15ac1 DS:20a2
    GOSUB L_17072   '@15ad2
    V_0e14! = V_0eb6!   '@15adf
    RETURN   '@15af0
L_15afa:   ' sub-rotina (alvo de GOSUB)
    V_0eb6! = V_0e14!   '@15aff
    V_0e14! = FX##(V_0e14!) + 1.0   '@15b10 DS:1fb6
    V_0eb2! = FX##(A_1006!(RT_CINT%(FX##(V_0e14!) - 1.0))) + A_1006!(RT_CINT%(FX##(V_0e14!)))   '@15b26 DS:20bc
    GOSUB L_17072   '@15b6d
    V_0e14! = V_0eb6!   '@15b7a
    RETURN   '@15b8b
L_15b9a:   ' sub-rotina (alvo de GOSUB)
    IF NOT (FX##(V_0ddc!) + 1.0 = FX##(V_0e14!) OR V_0e14! = 0.0) THEN GOTO L_15bec   '@15b9f DS:1fb6,20a2
    RETURN   '@15be2
L_15bec:
    V_0ee2! = FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)   '@15bec
    V_0e92! = A_1232!(RT_CINT%(FX##(V_0e14!)), 0)   '@15c32
    V_0e28! = 1.0   '@15c5c DS:1fb6
    GOSUB L_1930b   '@15c6d
    L_BP116! = INT((FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44!) - ((FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44! > INT((FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44!))   '@15c7a
    L_BP11a! = 3.0   '@15d67 DS:2100
    CALL MIXT_082a_Maior(L_BP116!, L_BP11a!, L_BP11e!)   '@15d72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_18ba! = L_BP11e!   '@15d87
    L_BP36! = 1.0   '@15d92 DS:1fb6
    L_BP122! = FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)   '@15da2
    FOR V_0e28! = 1.0 TO L_BP122!   '@15de9 DS:1fb6
    V_0e34! = (L_BP12! - FX##(V_0e64!) / V_0f76!) * L_BP36! / V_18ba! + V_0e64! / (2.0 * FX##(V_0f76!))   '@15df0 DS:20cc
    V_0ee2! = FX##(A_128e!(RT_CINT%(FX##(V_0e14!)), 0)) + A_128e!(RT_CINT%(FX##(V_0e14!)), 2)   '@15e2b
    V_0e92! = A_1232!(RT_CINT%(FX##(V_0e14!)), 0)   '@15e71
    GOSUB L_1930b   '@15e9b
    V_0e92! = V_0e28!   '@15ea8
    GOSUB L_15f87   '@15eb9
    V_0e28! = V_0e92!   '@15ec6
    V_0e28! = FX##(V_0e44!) - -(V_0e44! > 0.0) + V_0e28!   '@15ed7 DS:20a2
    L_BP36! = FX##(L_BP36!) + 1.0   '@15f0e DS:1fb6
    L_BP126! = 13.0   '@15f22 DS:2076
    CALL MIXT_0877_Menor(L_BP126!, L_BP36!, L_BP12a!)   '@15f33
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP36! = L_BP12a!   '@15f47
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@15f51 DS:1fb6
    RETURN   '@15f7d
L_15f87:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e44! = 0.0) THEN GOTO L_15fb1   '@15f8c DS:20a2
    RETURN   '@15fa7
L_15fb1:
    V_0e30! = FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!   '@15fb1
    IF NOT (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! < FX##(0.0)) THEN GOTO L_16052   '@15ff5 DS:20a2
    V_0e30! = -V_0f7e! + FX##(V_0f86!)   '@16039
L_16052:
    IF NOT (V_0e30! < 0.0) THEN GOTO L_1607e   '@16052 DS:20a2
    V_0e30! = 0.0   '@1606d DS:20a2
L_1607e:
    IF NOT (FX##(V_0e30!) * V_0f72! > FX##(V_0e5c!)) THEN GOTO L_160a8   '@1607e
    RETURN   '@1609e
L_160a8:
    RT_PSET RT_SNG!(FX##(V_0e30!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!), 0, 0   '@160a8
    V_0e30! = FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! - V_0f7e! + V_0f86!   '@160e8
    IF NOT (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! > FX##(A_1006!(RT_CINT%(FX##(V_0e14!))))) THEN GOTO L_161b7   '@1612c
    V_0e30! = FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!   '@16186
L_161b7:
    IF NOT (V_0e30! < 0.0) THEN GOTO L_161dc   '@161b7 DS:20a2
    RETURN   '@161d2
L_161dc:
    RT_LINE 0, 0, RT_SNG!(-(FX##(V_0e30!) * V_0f72! < FX##(V_0e5c!)) * FX##(V_0f72!) * V_0e30! + -(FX##(V_0e30!) * V_0f72! >= FX##(V_0e5c!)) * FX##(V_0e5c!)), RT_SNG!((FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!), 8, V_1922%, 0   '@161dc
    V_0e30! = FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!   '@16275
    IF NOT (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! < FX##(0.0)) THEN GOTO L_16316   '@162b9 DS:20a2
    V_0e30! = -V_0f7e! + FX##(V_0f86!)   '@162fd
L_16316:
    IF NOT (FX##(V_0e30!) * V_0f72! <= FX##(V_0e5c!) AND (V_0e30! >= 0.0 AND FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) > 0.00999999977648258209228515625##)) THEN GOTO L_163a5   '@16316 DS:20a2,20c4
    GOSUB L_16ac6   '@16398
L_163a5:
    V_0e30! = FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! - V_0f7e! + V_0f86!   '@163a5
    IF NOT (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! > FX##(A_1006!(RT_CINT%(FX##(V_0e14!))))) THEN GOTO L_16474   '@163e9
    V_0e30! = FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!   '@16443
L_16474:
    IF NOT (FX##(V_0e30!) * V_0f72! <= FX##(V_0e5c!) AND (V_0e30! >= 0.0 AND FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! - A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2) > 0.00999999977648258209228515625##)) THEN GOTO L_16523   '@16474 DS:20a2,20c4
    GOSUB L_16d0d   '@16516
L_16523:
    V_0e30! = FX##(A_15f8!(RT_CINT%(FX##(V_0e14!))) > 0.0) * A_15f8!(RT_CINT%(FX##(V_0e14!))) * -1.0 + FX##(A_15f8!(RT_CINT%(FX##(V_0e14!))) = 0.0) * A_1006!(RT_CINT%(FX##(V_0e14!))) * -1.0 / 2.0   '@16523 DS:20a2,20bc,20cc
    IF NOT ((FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR V_0e30! < V_0f7e!) THEN GOTO L_16630   '@165db
    GOTO L_16ab7   '@16628
L_16630:
    V_0dfc$ = LTRIM$(STR$(A_128e!(RT_CINT%(FX##(V_0e14!)), 1)))   '@16630
    IF NOT (A_128e!(RT_CINT%(FX##(V_0e14!)), 0) < V_0e28!) THEN GOTO L_166dc   '@1666c
    V_0dfc$ = LTRIM$(STR$(A_128e!(RT_CINT%(FX##(V_0e14!)), 3)))   '@166a0
L_166dc:
    V_0dfc$ = RT_MID2$((STR$(V_0e44!)), (2)) + "#" + V_0dfc$   '@166dc DS:2178
    IF NOT (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) < FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! AND A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1) > 0.0) THEN GOTO L_16853   '@1671a DS:20a2
    V_0dfc$ = V_0dfc$ + "-" + LTRIM$(STR$(RT_SNG!(INT((FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) - A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) * 100.0))))   '@167bd DS:20dc,217e
L_16853:
    V_0e3c! = (FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72! - LEN(V_0dfc$) * 4   '@16853
    V_0e40! = (FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!   '@16888
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_168d3   '@168a7 DS:20a2
    V_0e3c! = 0.0   '@168c2 DS:20a2
L_168d3:
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_16928   '@168d3
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@16901
L_16928:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@16928
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0e28! > 1.0) THEN GOTO L_16965   '@16942 DS:1fb6
    GOTO L_16ab7   '@1695d
L_16965:
    V_0e3c! = (FX##(V_0e30!) - V_0f7e! + V_0f86!) * V_0f72! - FX##(LEN(A_13a2$(RT_CINT%(FX##(V_0e14!))))) * V_0e68! / 2.0   '@16965 DS:20cc
    V_0e40! = FX##(L_BP0e!) * V_0f76! + V_0e64!   '@169b4
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_169fa   '@169ce DS:20a2
    V_0e3c! = 0.0   '@169e9 DS:20a2
L_169fa:
    IF NOT (FX##(LEN(A_13a2$(RT_CINT%(FX##(V_0e14!))))) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_16a77   '@169fa
    V_0e3c! = V_0e5c! - FX##(LEN(A_13a2$(RT_CINT%(FX##(V_0e14!))))) * V_0e68!   '@16a3c
L_16a77:
    V_0dfc$ = A_13a2$(RT_CINT%(FX##(V_0e14!)))   '@16a77
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@16a9d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_16ab7:
    RETURN   '@16abc
L_16ac6:   ' sub-rotina (alvo de GOSUB)
    V_0dfc$ = STR$(RT_SNG!(INT(FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) * 100.0)))   '@16acb DS:20dc
    V_0e40! = FX##(V_0e64!) * 1.5 + (FX##(L_BP0e!) + V_0e34!) * V_0f76!   '@16b1e DS:2184
    V_0e3c! = FX##(V_0e30!) * V_0f72!   '@16b45
    IF NOT (VAL(V_0dfc$) > 1.0#) THEN GOTO L_16cbd   '@16b5b DS:2188
    V_0e3c! = FX##(V_0e30!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!   '@16b7f
    L_BP12c% = (FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) * V_0f72! / V_0fa2! < FX##(LEN(V_0dfc$)) * V_0e68!)   '@16bab
    IF NOT (((FX##(V_0e30!) - A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) * V_0f72! + FX##(LEN(V_0dfc$)) * V_0e68! <= FX##(V_0e5c!) AND L_BP12c%) <> 0) THEN GOTO L_16cb8   '@16c47
    V_0e3c! = (V_0e30! - FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2!) * V_0f72!   '@16c71
L_16cb8:
L_16cbd:
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_16ce9   '@16cbd DS:20a2
    V_0e3c! = 0.0   '@16cd8 DS:20a2
L_16ce9:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@16ce9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@16d03
L_16d0d:   ' sub-rotina (alvo de GOSUB)
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! - A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) * 100.0)))), (2))   '@16d12 DS:20dc
    V_0e3c! = FX##(V_0e30!) * V_0f72!   '@16d93
    V_0e40! = FX##(V_0e64!) * 1.5 + (FX##(L_BP0e!) + V_0e34!) * V_0f76!   '@16da9 DS:2184
    IF NOT (VAL(V_0dfc$) > 1.0#) THEN GOTO L_16f78   '@16dd0 DS:2188
    L_BP12e% = ((A_1006!(RT_CINT%(FX##(V_0e14!))) - FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2!) * V_0f72! < FX##(LEN(V_0dfc$)) * V_0e68!)   '@16df4 DS:20a2
    IF NOT (((A_1006!(RT_CINT%(FX##(V_0e14!))) - FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! + V_0e30!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! > FX##(0.0) AND L_BP12e%) <> 0) THEN GOTO L_16f78   '@16ed1
    V_0e3c! = (A_1006!(RT_CINT%(FX##(V_0e14!))) - FX##(A_12ea!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! + V_0e30!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68! - 2.0   '@16efb DS:2190
L_16f78:
    IF NOT (VAL(V_0dfc$) <= 0.0#) THEN GOTO L_16fc8   '@16f78 DS:209a
    V_0e3c! = V_0e3c! - FX##(LEN(V_0dfc$)) * V_0e68! - 2.0   '@16f9c DS:2190
L_16fc8:
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_16ff4   '@16fc8 DS:20a2
    V_0e3c! = 0.0   '@16fe3 DS:20a2
L_16ff4:
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_17049   '@16ff4
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@17022
L_17049:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@17049
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@17063
L_17072:   ' sub-rotina (alvo de GOSUB)
    L_BP132! = 0.0   '@17077 DS:20a2
    L_BP136! = 1.0 - FX##(V_0de0!) - V_0de8! + (A_1148!(0) < 0.0 AND V_0e74$ = "S")   '@17089 DS:1fb6,20a2,2104
    CALL MIXT_0877_Menor(V_0ddc!, L_BP136!, L_BP13a!)   '@170e4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP132!, L_BP13a!, L_BP13e!)   '@170f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP142! = 0.0   '@1710c DS:20a2
    L_BP146! = FX##(V_0ddc!) - 1.0 + V_0de4! + (FX##(V_0dec!) - (A_1148!(1) < 0.0 AND V_0e74$ = "S"))   '@17118 DS:20a2,20bc,2104
    CALL MIXT_082a_Maior(L_BP142!, L_BP146!, L_BP14a!)   '@17179
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_0ddc!, L_BP14a!, L_BP14e!)   '@1718d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_12bc!(RT_CINT%(FX##(V_0e14!)), 0) = 0.0 OR (V_0e14! > L_BP14e! OR V_0e14! < L_BP13e!)) THEN GOTO L_17219   '@171a1 DS:20a2
    RETURN   '@1720f
L_17219:
    V_0ee2! = FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)   '@17219
    V_0e92! = A_1260!(RT_CINT%(FX##(V_0e14!)), 0)   '@1725f
    V_0e28! = 1.0   '@17289 DS:1fb6
    GOSUB L_1930b   '@1729a
    L_BP152! = INT((FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44!) - ((FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44! > INT((FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)) / V_0e44!))   '@172a7
    L_BP156! = 3.0   '@17394 DS:2100
    CALL MIXT_082a_Maior(L_BP152!, L_BP156!, L_BP15a!)   '@1739f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_18ba! = L_BP15a!   '@173b4
    L_BP36! = 1.0   '@173bf DS:1fb6
    L_BP15e! = FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)   '@173cf
    FOR V_0e28! = 1.0 TO L_BP15e!   '@17416 DS:1fb6
    V_0e34! = (L_BP0e! - FX##(V_0e64!) / V_0f76!) * L_BP36! / V_18ba! + (FX##(V_0e14!) / 2.0 = INT(FX##(V_0e14!) / 2.0)) / (2.0 * FX##(V_0f76!)) * V_0e64! * -1.0   '@1741e DS:20bc,20cc
    V_0e34! = -V_0e34!   '@1748b
    V_0ee2! = FX##(A_12bc!(RT_CINT%(FX##(V_0e14!)), 0)) + A_12bc!(RT_CINT%(FX##(V_0e14!)), 2)   '@1749f
    V_0e92! = A_1260!(RT_CINT%(FX##(V_0e14!)), 0)   '@174e5
    GOSUB L_1930b   '@1750f
    V_0e92! = V_0e28!   '@1751c
    GOSUB L_175fb   '@1752d
    V_0e28! = V_0e92!   '@1753a
    V_0e28! = FX##(V_0e44!) - -(V_0e44! > 0.0) + V_0e28!   '@1754b DS:20a2
    L_BP36! = FX##(L_BP36!) + 1.0   '@17582 DS:1fb6
    L_BP162! = 13.0   '@17596 DS:2076
    CALL MIXT_0877_Menor(L_BP162!, L_BP36!, L_BP166!)   '@175a7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP36! = L_BP166!   '@175bb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e28!   '@175c5 DS:1fb6
    RETURN   '@175f1
L_175fb:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_0e44! = 0.0) THEN GOTO L_17625   '@17600 DS:20a2
    RETURN   '@1761b
L_17625:
    V_0e30! = V_0eb2! - FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!   '@17625
    IF NOT (FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! > FX##(V_0eb2!)) THEN GOTO L_176ce   '@17671
    V_0e30! = -V_0f7e! + FX##(V_0f86!)   '@176b5
L_176ce:
    IF NOT (V_0e30! < 0.0) THEN GOTO L_176fa   '@176ce DS:20a2
    V_0e30! = 0.0   '@176e9 DS:20a2
L_176fa:
    IF NOT (FX##(V_0e30!) * V_0f72! > FX##(V_0e5c!)) THEN GOTO L_17724   '@176fa
    RETURN   '@1771a
L_17724:
    RT_PSET RT_SNG!(FX##(V_0e30!) * V_0f72!), RT_SNG!((FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!), 0, 0   '@17724
    V_0e30! = FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! - V_0f7e! + V_0eb2! + V_0f86!   '@17764
    IF NOT (V_0e30! < 0.0) THEN GOTO L_177d2   '@177ad DS:20a2
    RETURN   '@177c8
L_177d2:
    RT_LINE 0, 0, RT_SNG!(-(FX##(V_0e30!) * V_0f72! < FX##(V_0e5c!)) * FX##(V_0f72!) * V_0e30! + -(FX##(V_0e30!) * V_0f72! >= FX##(V_0e5c!)) * FX##(V_0e5c!)), RT_SNG!((FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!), 8, V_1922%, 0   '@177d2
    V_0e30! = V_0eb2! - FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!   '@1786b
    IF NOT (FX##(V_0e30!) * V_0f72! <= FX##(V_0e5c!) AND (V_0e30! >= 0.0 AND (FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) <> FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! AND A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1) <> 0.0))) THEN GOTO L_179a2   '@178b7 DS:20a2
    GOSUB L_17e7e   '@17995
L_179a2:
    V_0e30! = FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) / V_0fa2! - V_0f7e! + V_0eb2! + V_0f86!   '@179a2
    IF NOT (FX##(V_0e30!) * V_0f72! <= FX##(V_0e5c!) AND (V_0e30! >= 0.0 AND (A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2) <> 0.0 AND FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) <> FX##(A_1006!(RT_CINT%(FX##(V_0e14!) + 1.0))) * V_0fa2!))) THEN GOTO L_17adb   '@179eb DS:1fb6,20a2
    GOSUB L_17f8b   '@17ace
L_17adb:
    IF NOT ((FX##(V_0eb2!) - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR V_0eb2! < V_0f7e!) THEN GOTO L_17b32   '@17adb
    RETURN   '@17b28
L_17b32:
    V_0dfc$ = LTRIM$(STR$(A_12bc!(RT_CINT%(FX##(V_0e14!)), 1)))   '@17b32
    IF NOT (A_12bc!(RT_CINT%(FX##(V_0e14!)), 0) < V_0e28!) THEN GOTO L_17bde   '@17b6e
    V_0dfc$ = LTRIM$(STR$(A_12bc!(RT_CINT%(FX##(V_0e14!)), 3)))   '@17ba2
L_17bde:
    V_0dfc$ = LTRIM$(STR$(V_0e44!)) + "#" + V_0dfc$   '@17bde DS:2178
    V_0e3c! = (FX##(V_0eb2!) - V_0f7e! + V_0f86!) * V_0f72! - 14.0   '@17c14 DS:2194
    V_0e40! = FX##(V_0e64!) * 1.5 + (FX##(L_BP0e!) + V_0e34!) * V_0f76!   '@17c39 DS:2184
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_17c8c   '@17c60 DS:20a2
    V_0e3c! = 0.0   '@17c7b DS:20a2
L_17c8c:
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_17ce1   '@17c8c
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@17cba
L_17ce1:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@17ce1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0e28! > 1.0) THEN GOTO L_17d20   '@17cfb DS:1fb6
    RETURN   '@17d16
L_17d20:
    V_0e3c! = (FX##(V_0eb2!) - V_0f7e! + V_0f86!) * V_0f72! - LEN(A_13d0$(RT_CINT%(FX##(V_0e14!)))) * 4   '@17d20
    V_0e40! = FX##(V_0e64!) * 1.5 + FX##(L_BP0e!) * V_0f76!   '@17d69 DS:2184
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_17db7   '@17d8b DS:20a2
    V_0e3c! = 0.0   '@17da6 DS:20a2
L_17db7:
    IF NOT (FX##(LEN(A_13d0$(RT_CINT%(FX##(V_0e14!))))) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_17e34   '@17db7
    V_0e3c! = V_0e5c! - FX##(LEN(A_13d0$(RT_CINT%(FX##(V_0e14!))))) * V_0e68!   '@17df9
L_17e34:
    V_0dfc$ = A_13d0$(RT_CINT%(FX##(V_0e14!)))   '@17e34
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@17e5a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@17e74
L_17e7e:   ' sub-rotina (alvo de GOSUB)
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 1)) * 100.0))), (2))   '@17e83 DS:20dc
    V_0e3c! = FX##(V_0e30!) * V_0f72!   '@17edd
    V_0e40! = (FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!   '@17ef3
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_17f67   '@17f12
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@17f40
L_17f67:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@17f67
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@17f81
L_17f8b:   ' sub-rotina (alvo de GOSUB)
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(FX##(A_1318!(RT_CINT%(FX##(V_0e14!)), RT_CINT%(FX##(L_BP36!)), 2)) * 100.0))), (2))   '@17f90 DS:20dc
    V_0e3c! = FX##(V_0e30!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!   '@17fea
    V_0e40! = (FX##(L_BP0e!) + V_0e34!) * V_0f76! + V_0e64!   '@18016
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_18061   '@18035 DS:20a2
    V_0e3c! = 0.0   '@18050 DS:20a2
L_18061:
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@18061
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@1807b
L_1808a:   ' sub-rotina (alvo de GOSUB)
    RT_LINE RT_SNG!((-V_0f7e! + FX##(V_0f86!)) * (-V_0f7e! + FX##(V_0f86!) >= FX##(0.0)) * -1.0 * V_0f72!), RT_SNG!(FX##(V_0e64!) / 2.0), RT_SNG!((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * ((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! <= FX##(V_0e5c!)) * V_0f72! * -1.0 + -((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!)) * FX##(V_0e5c!)), RT_SNG!(FX##(V_0e64!) / 2.0), 9, V_191e%, 0   '@1808f DS:20a2,20bc,20cc
    IF NOT ((FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) / V_0fa2! - V_0f7e! + V_0f86! < FX##(0.0) OR (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) > FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! OR A_1374!(RT_CINT%(FX##(V_0e14!)), 1) <= 0.0))) THEN GOTO L_1830e   '@181e6 DS:20a2
    GOTO L_1878e   '@18306
L_1830e:
    V_0e34! = (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72!   '@1830e
    V_0e34! = -(V_0e34! < 1.0) - -(V_0e34! > V_0e5c!) + FX##(V_0e34!)   '@1834d DS:1fb6
    RT_LINE RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 - 2.0), RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 + 2.0), 41, V_191e%, 0   '@1839b DS:20bc,20cc,2190
    V_0dfc$ = "#" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 0))), (2)) + "/" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 2))), (2))   '@18415 DS:2178,2198
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_18577   '@184a5
    V_0dfc$ = RT_MID2$((STR$((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) * -3 + -((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) <= V_0f42!) * 2))), (2)) + V_0dfc$   '@184d9
L_18577:
    V_0e3c! = (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72! - FX##(LEN(V_0dfc$)) * V_0e68!   '@18577
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_185f8   '@185cc DS:20a2
    V_0e3c! = 0.0   '@185e7 DS:20a2
L_185f8:
    IF NOT ((-V_0f7e! + FX##(V_0f86!)) * V_0f72! > FX##(V_0e3c!)) THEN GOTO L_1869d   '@185f8
    V_0e3c! = (-V_0f7e! + FX##(V_0f86!)) * V_0f72! + V_0e68!   '@18620
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_18698   '@18643
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@18671
L_18698:
L_1869d:
    IF NOT (A_1374!(RT_CINT%(FX##(V_0e14!)), 1) > 0.0) THEN GOTO L_1878e   '@1869d DS:20a2
    V_0e40! = FX##(V_0e64!) / 2.0 - 1.0   '@186d2 DS:20bc,20cc
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@186ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT(FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) * 100.0)))), (2))   '@18707 DS:20dc
    V_0e40! = V_0e64!   '@1875e
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@1876f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_1878e:
    IF NOT ((FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86! < FX##(0.0)) THEN GOTO L_18832   '@18793 DS:20a2
    GOTO L_18939   '@1882a
L_18832:
    V_0e34! = (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72!   '@18832
    V_0e34! = -(V_0e34! < 1.0) - -(V_0e34! > V_0e5c!) + FX##(V_0e34!)   '@18871 DS:1fb6
    RT_LINE RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 - 2.0), RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 + 2.0), 41, V_191e%, 0   '@188bf DS:20bc,20cc,2190
L_18939:
    IF NOT (A_1374!(RT_CINT%(FX##(V_0e14!)), 4) <= A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) THEN GOTO L_18995   '@1893e
    GOTO L_18c79   '@1898d
L_18995:
    V_0dfc$ = "#" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 3))), (2)) + "/" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 5))), (2))   '@18995 DS:2178,2198
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_18afb   '@18a29
    V_0dfc$ = RT_MID2$((STR$((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) * -3 + -((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) <= V_0f42!) * 2))), (2)) + V_0dfc$   '@18a5d
L_18afb:
    V_0e3c! = ((FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) + A_1374!(RT_CINT%(FX##(V_0e14!)), 1)) / (FX##(V_0fa2!) * 2.0) - V_0f7e! + V_0f86!) * V_0f72!   '@18afb DS:20cc
    IF NOT (V_0e3c! > V_0e5c! OR V_0e3c! < 0.0) THEN GOTO L_18ba7   '@18b61 DS:20a2
    GOTO L_18c79   '@18b9f
L_18ba7:
    V_0e3c! = FX##(V_0e3c!) - LEN(V_0dfc$) * 4   '@18ba7
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_18bf9   '@18bcd DS:20a2
    V_0e3c! = 0.0   '@18be8 DS:20a2
L_18bf9:
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_18c4e   '@18bf9
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@18c27
L_18c4e:
    V_0e40! = V_0e64!   '@18c4e
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@18c5f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_18c79:
    IF NOT ((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86! < FX##(0.0)) THEN GOTO L_18d0b   '@18c7e DS:20a2
    GOTO L_18e09   '@18d03
L_18d0b:
    V_0e34! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72!   '@18d0b
    V_0e34! = -(V_0e34! < 1.0) - -(V_0e34! > V_0e5c!) + FX##(V_0e34!)   '@18d41 DS:1fb6
    RT_LINE RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 - 2.0), RT_SNG!(FX##(V_0e34!) - 1.0), RT_SNG!(FX##(V_0e64!) / 2.0 + 2.0), 41, V_191e%, 0   '@18d8f DS:20bc,20cc,2190
L_18e09:
    IF NOT ((FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72! > FX##(V_0e5c!) OR (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86! < FX##(0.0) OR FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) >= FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2!)) THEN GOTO L_18f01   '@18e0e DS:20a2
    RETURN   '@18ef7
L_18f01:
    V_0dfc$ = "#" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 6))), (2)) + "/" + RT_MID2$((STR$(A_1374!(RT_CINT%(FX##(V_0e14!)), 7))), (2))   '@18f01 DS:2178,2198
    IF NOT (A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f3e!) THEN GOTO L_19067   '@18f95
    V_0dfc$ = RT_MID2$((STR$((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) > V_0f42!) * -3 + -((A_1232!(RT_CINT%(FX##(V_0e14!)), 0) <= V_0f42!) * 2))), (2)) + V_0dfc$   '@18fc9
L_19067:
    V_0e3c! = (FX##(A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) / V_0fa2! - V_0f7e! + V_0f86!) * V_0f72! + V_0e68!   '@19067
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! - 6.0) THEN GOTO L_19185   '@190ab DS:219e
    V_0e3c! = (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0f7e! + V_0f86!) * V_0f72! - 6.0 - FX##(LEN(V_0dfc$)) * V_0e68!   '@19103 DS:219e
    IF NOT (V_0e3c! < 0.0) THEN GOTO L_19180   '@19154 DS:20a2
    V_0e3c! = 0.0   '@1916f DS:20a2
L_19180:
L_19185:
    IF NOT (FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c! > FX##(V_0e5c!)) THEN GOTO L_191da   '@19185
    V_0e3c! = V_0e5c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@191b3
L_191da:
    V_0e40! = FX##(V_0e64!) / 2.0 - 1.0   '@191da DS:20bc,20cc
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@191f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e3c! = FX##(LEN(V_0dfc$)) * V_0e68! + V_0e3c!   '@1920f
    V_0dfc$ = RT_MID2$((STR$(RT_SNG!(INT((FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) * V_0fa2! - A_1374!(RT_CINT%(FX##(V_0e14!)), 4)) * 100.0)))), (2))   '@19233 DS:20dc
    V_0e40! = V_0e64!   '@192aa
    V_0e3c! = V_0e3c! - FX##(LEN(V_0dfc$)) * V_0e68!   '@192bb
    CALL MIXT_08c4_TextoGrafico(V_0e3c!, V_0e40!, V_0dfc$, V_17f2$)   '@192e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RETURN   '@192fc
L_1930b:   ' sub-rotina (alvo de GOSUB)
    L_BP3c% = 0   '@19310
    IF NOT (V_0e92! > V_0f4a!) THEN GOTO L_1933f   '@1931a
    L_BP3c% = 1   '@19335
L_1933f:
    IF NOT (V_0e92! > V_0f4e!) THEN GOTO L_19364   '@1933f
    L_BP3c% = 2   '@1935a
L_19364:
    IF NOT (V_0f46! > 3.0 AND V_0e92! > V_0f52!) THEN GOTO L_193ac   '@19364 DS:2100
    L_BP3c% = 3   '@193a2
L_193ac:
    IF NOT (V_0f46! > 4.0 AND V_0e92! > V_0f56!) THEN GOTO L_193f4   '@193ac DS:2166
    L_BP3c% = 4   '@193ea
L_193f4:
    IF NOT (V_0f46! > 5.0 AND V_0e92! > V_0f5a!) THEN GOTO L_1943c   '@193f4 DS:20d4
    L_BP3c% = 5   '@19432
L_1943c:
    L_BP16a! = 7.0   '@1943c DS:204a
    L_BP16e! = FX##(V_0ee2!) - 2.0   '@1944e DS:2190
    CALL MIXT_0877_Menor(L_BP16a!, L_BP16e!, L_BP172!)   '@1945e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e44! = A_14e4%(RT_CINT%(FX##(L_BP172!)), L_BP3c%)   '@19473
    L_BP176! = 7.0   '@1949b DS:204a
    L_BP17a! = FX##(V_0ee2!) - 2.0   '@194ad DS:2190
    CALL MIXT_0877_Menor(L_BP176!, L_BP17a!, L_BP17e!)   '@194bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_0e28!) - 1.0 + A_14e4%(RT_CINT%(FX##(L_BP17e!)), L_BP3c%) > FX##(V_0ee2!)) THEN GOTO L_1952c   '@194d2 DS:20bc
    V_0e44! = FX##(V_0ee2!) - V_0e28! + 1.0   '@19511 DS:1fb6
L_1952c:
    RETURN   '@1952c
L_1953b:   ' entrada vinda de 010771_FUN_1000_0771
    ' END SUB   '@1953b
END SUB

SUB S_1954b   ' entrada de SUB/FUNCTION (B$ENRA, locais 12 bytes) (0x1954b)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    ' ---- FUN_1000_954b @0x1954b  (01954b_FUN_1000_954b.lift.txt; evidence_id (assembly): ev_febc81a8e319daac6a7adf5a211f06ced2b92ff37ebee6c1eea01e05a41e3e3f)
    IF NOT (V_0e14! > 0.0) THEN GOTO L_19580   '@1955d DS:20a2
    GOTO L_197ff   '@19578
L_19580:
    V_0e38! = 0.0   '@19580 DS:20a2
    IF NOT (A_0faa%(0) = 0) THEN GOTO L_195b8   '@19591
    GOTO L_19a18   '@195b0
L_195b8:
    L_BP12! = A_0faa%(0)   '@195b8
    FOR V_0e48! = 1.0 TO L_BP12!   '@195db DS:1fb6
    L_BP0e! = 0.0   '@195e2 DS:20a2
    IF NOT (A_0faa%(0) > V_0e48!) THEN GOTO L_1964a   '@195f2
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!) + 1.0))   '@1961f DS:1fb6
L_1964a:
    IF NOT (FX##(A_1006!(0)) - L_BP0e! < FX##(V_0e30!)) THEN GOTO L_1967f   '@1964a
    GOTO L_19761   '@19677
L_1967f:
    V_0e38! = (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_1062!(RT_CINT%(FX##(V_0e48!))) + V_0e38!   '@1967f
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) = FX##(A_1006!(0)) - V_0e30!) THEN GOTO L_1972d   '@196e1
    GOTO L_197f7   '@19725
L_1972d:
    V_0e38! = FX##(A_10ec!(RT_CINT%(FX##(V_0e48!)))) + V_0e38!   '@1972d
    GOTO L_197f7   '@19759
L_19761:
    V_0e38! = (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + V_0e38! + A_10ec!(RT_CINT%(FX##(V_0e48!)))   '@19766
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@197cc DS:1fb6
L_197f7:
    GOTO L_19a18   '@197f7
L_197ff:
    V_0e38! = -A_1654!(RT_CINT%(FX##(V_0e14!)), 0)   '@19804
    L_BP0e! = 0.0   '@19831 DS:20a2
    L_BP16! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@19841
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP16!   '@1986c DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) >= V_0e30!) THEN GOTO L_1991a   '@198ac
    V_0e38! = (FX##(V_0e30!) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + V_0e38!   '@198dd
    GOTO L_19a13   '@19912
L_1991a:
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) < V_0e30!) THEN GOTO L_19996   '@1991a
    V_0e38! = (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + V_0e38!   '@1994b
L_19996:
    V_0e38! = FX##(A_10ec!(RT_CINT%(FX##(V_0e48!)))) + V_0e38!   '@19996
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@199c2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@199e8 DS:1fb6
L_19a13:
L_19a18:
    ' END SUB   '@19a18
END SUB

SUB S_19a28   ' entrada de SUB/FUNCTION (B$ENRA, locais 48 bytes) (0x19a28)
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
    ' ---- FUN_1000_9a28 @0x19a28  (019a28_FUN_1000_9a28.lift.txt; evidence_id (assembly): ev_8240c17d4e9a14cd93f77d2081f4d0e882489bff56e5faf18b5627c7e83b2407)
    IF NOT (V_0e14! > 0.0) THEN GOTO L_19a5d   '@19a3a DS:20a2
    GOTO L_19d80   '@19a55
L_19a5d:
    V_1882! = 0.0   '@19a5d DS:20a2
    IF NOT (A_0faa%(0) = 0) THEN GOTO L_19a95   '@19a6e
    GOTO L_1a4d5   '@19a8d
L_19a95:
    L_BP12! = A_0faa%(0)   '@19a95
    FOR V_0e48! = 1.0 TO L_BP12!   '@19ab8 DS:1fb6
    IF NOT (A_0faa%(0) = V_0e48!) THEN GOTO L_19b05   '@19ac0
    L_BP0e! = 0.0   '@19aed DS:20a2
    GOTO L_19b30   '@19afd
L_19b05:
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!) + 1.0))   '@19b05 DS:1fb6
L_19b30:
    IF NOT (FX##(A_1006!(0)) - L_BP0e! < FX##(V_0e30!)) THEN GOTO L_19b6a   '@19b35
    GOTO L_19c39   '@19b62
L_19b6a:
    V_1882! = RT_POT##((A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1882! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!)))   '@19b6a DS:20cc
    GOTO L_19d78   '@19c31
L_19c39:
    V_1882! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1882! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!))) + (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) * (L_BP0e! - (FX##(A_1006!(0)) - V_0e30!))   '@19c3e DS:20cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@19d4d DS:1fb6
L_19d78:
    GOTO L_1a4d5   '@19d78
L_19d80:
    V_1882! = -(FX##(A_1796!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0e30!) - A_16de!(RT_CINT%(FX##(V_0e14!) - 1.0))   '@19d85 DS:20bc
    L_BP16! = -A_1796!(RT_CINT%(FX##(V_0e14!)), 1) * (FX##(A_1006!(RT_CINT%(FX##(V_0e14!)))) - V_0e30!) - A_16de!(RT_CINT%(FX##(V_0e14!)))   '@19dd7
    L_BP1a! = -(FX##(A_1796!(RT_CINT%(FX##(V_0e14!)), 2)) * V_0e30!) - A_170c!(RT_CINT%(FX##(V_0e14!) - 1.0))   '@19e42 DS:20bc
    L_BP0e! = 0.0   '@19e91 DS:20a2
    L_BP1e! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@19ea1
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP1e!   '@19ecc DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) > V_0e30!) THEN GOTO L_19ff2   '@19f0c
    V_1882! = RT_POT##((FX##(V_0e30!) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1882!   '@19f3d DS:20cc
    L_BP1a! = (FX##(A_1062!(RT_CINT%(FX##(V_0e48!)))) - A_1090!(RT_CINT%(FX##(V_0e48!)))) * RT_POT##((FX##(V_0e30!) - L_BP0e!), (2.0)) / 2.0 + L_BP1a!   '@19f83 DS:20cc
    GOTO L_1a249   '@19fe5
L_19ff2:
    V_1882! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1882! + ((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + A_10ec!(RT_CINT%(FX##(V_0e48!)))) * (FX##(V_0e30!) - A_10be!(RT_CINT%(FX##(V_0e48!))))   '@19ff2 DS:20cc
    L_BP1a! = (FX##(A_1062!(RT_CINT%(FX##(V_0e48!)))) - A_1090!(RT_CINT%(FX##(V_0e48!)))) * RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!), (2.0)) / 2.0 + L_BP1a! + ((FX##(A_1062!(RT_CINT%(FX##(V_0e48!)))) - A_1090!(RT_CINT%(FX##(V_0e48!)))) * (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) + (FX##(A_10ec!(RT_CINT%(FX##(V_0e48!)))) - A_111a!(RT_CINT%(FX##(V_0e48!))))) * (FX##(V_0e30!) - A_10be!(RT_CINT%(FX##(V_0e48!))))   '@1a0c9 DS:20cc
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@1a1f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@1a21e DS:1fb6
L_1a249:
    L_BP0e! = 0.0   '@1a249 DS:20a2
    L_BP22! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@1a259
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP22!   '@1a284 DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) <= V_0e30!) THEN GOTO L_1a2fd   '@1a2c4
    GOTO L_1a447   '@1a2f5
L_1a2fd:
    CALL MIXT_082a_Maior(L_BP0e!, V_0e30!, L_BP26!)   '@1a2fd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, V_0e30!, L_BP2a!)   '@1a313
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, V_0e30!, L_BP2e!)   '@1a324
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, V_0e30!, L_BP32!)   '@1a335
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP26!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + L_BP16! + (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP2a!) * A_1062!(RT_CINT%(FX##(V_0e48!))) * (FX##(L_BP2e!) - V_0e30!) + (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP32!) * A_10ec!(RT_CINT%(FX##(V_0e48!)))   '@1a347 DS:20cc
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@1a421
L_1a447:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@1a44c DS:1fb6
    CALL MIXT_082a_Maior(V_1882!, L_BP16!, L_BP36!)   '@1a477
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1882! = L_BP36!   '@1a48e
    IF NOT (V_0e70$ = "S") THEN GOTO L_1a4d0   '@1a498 DS:2104
    CALL MIXT_082a_Maior(V_1882!, L_BP1a!, L_BP3a!)   '@1a4af
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1882! = L_BP3a!   '@1a4c6
L_1a4d0:
L_1a4d5:
    ' END SUB   '@1a4d5
END SUB

SUB S_1a4e5   ' entrada de SUB/FUNCTION (B$ENRA, locais 12 bytes) (0x1a4e5)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    ' ---- FUN_1000_a4e5 @0x1a4e5  (01a4e5_FUN_1000_a4e5.lift.txt; evidence_id (assembly): ev_5d96aef847a851c7763fd0a17a07720570598b5e0b4719eb77500cafde7fe303)
    IF NOT (V_0e14! > 0.0) THEN GOTO L_1a51a   '@1a4f7 DS:20a2
    GOTO L_1a83c   '@1a512
L_1a51a:
    V_1886! = 0.0   '@1a51a DS:20a2
    IF NOT (A_0faa%(0) = 0) THEN GOTO L_1a552   '@1a52b
    GOTO L_1aab8   '@1a54a
L_1a552:
    L_BP12! = A_0faa%(0)   '@1a552
    FOR V_0e48! = 1.0 TO L_BP12!   '@1a575 DS:1fb6
    IF NOT (A_0faa%(0) = V_0e48!) THEN GOTO L_1a5c1   '@1a57c
    L_BP0e! = 0.0   '@1a5a9 DS:20a2
    GOTO L_1a5ec   '@1a5b9
L_1a5c1:
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!) + 1.0))   '@1a5c1 DS:1fb6
L_1a5ec:
    IF NOT (FX##(A_1006!(0)) - L_BP0e! < FX##(V_0e30!)) THEN GOTO L_1a626   '@1a5f1
    GOTO L_1a6f5   '@1a61e
L_1a626:
    V_1886! = RT_POT##((A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1886! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!)))   '@1a626 DS:20cc
    GOTO L_1a834   '@1a6ed
L_1a6f5:
    V_1886! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1886! + (A_10be!(RT_CINT%(FX##(V_0e48!))) - (FX##(A_1006!(0)) - V_0e30!)) * A_10ec!(RT_CINT%(FX##(V_0e48!))) + (FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) * (L_BP0e! - (FX##(A_1006!(0)) - V_0e30!))   '@1a6fa DS:20cc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@1a809 DS:1fb6
L_1a834:
    GOTO L_1aab8   '@1a834
L_1a83c:
    V_1886! = -(FX##(A_17c4!(RT_CINT%(FX##(V_0e14!)), 0)) * V_0e30!) - A_17c4!(RT_CINT%(FX##(V_0e14!)), 1)   '@1a841
    L_BP0e! = 0.0   '@1a892 DS:20a2
    L_BP16! = A_0fd8%(RT_CINT%(FX##(V_0e14!)))   '@1a8a2
    FOR V_0e48! = 1 + (A_0fd8%(RT_CINT%(FX##(V_0e14!))) - A_0faa%(RT_CINT%(FX##(V_0e14!)))) TO L_BP16!   '@1a8cd DS:1fb6
    IF NOT (A_10be!(RT_CINT%(FX##(V_0e48!))) > V_0e30!) THEN GOTO L_1a98b   '@1a90c
    V_1886! = RT_POT##((FX##(V_0e30!) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1886!   '@1a93d DS:20cc
    GOTO L_1aab3   '@1a983
L_1a98b:
    V_1886! = RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!), (2.0)) * A_1062!(RT_CINT%(FX##(V_0e48!))) / 2.0 + V_1886! + ((FX##(A_10be!(RT_CINT%(FX##(V_0e48!)))) - L_BP0e!) * A_1062!(RT_CINT%(FX##(V_0e48!))) + A_10ec!(RT_CINT%(FX##(V_0e48!)))) * (FX##(V_0e30!) - A_10be!(RT_CINT%(FX##(V_0e48!))))   '@1a98b DS:20cc
    L_BP0e! = A_10be!(RT_CINT%(FX##(V_0e48!)))   '@1aa62
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0e48!   '@1aa88 DS:1fb6
L_1aab3:
L_1aab8:
    ' END SUB   '@1aab8
END SUB

SUB S_20171   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x20171)
    ' ---- FUN_2000_0171 @0x20171  (020171_FUN_2000_0171.lift.txt; evidence_id (assembly): ev_3346273b9260aaf3ed5efe7d17de92caa017e35c9a505baa8ec7955f9c48e629)
    BEEP   '@20179
    BEEP   '@20183
    BEEP   '@2018d
    RT_SCREEN 0   '@20197
    RT_VIEWPRINT 1, 25   '@201ac
    RT_CLOSE   '@201be (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_17fe!)), RT_CINT%(4.0 * FX##(V_1802!)), RT_CINT%(4.0 * FX##(V_1802!))   '@201cb DS:21b0
    RT_CLS 0   '@20210
    LOCATE 10, 1   '@2021d
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@20238 DS:21b4,21b8
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@20258 DS:21b4,21d2
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@20278 DS:21b4,21fe
L_2029d:
    CALL MIXT_07f1_LimpaTeclado   '@202a2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0dfc$ = RT_INPUT$(1)   '@202ac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@202c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2029d   '@202d2
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_DESENHO.BM'
'$INCLUDE: '../comum/MIXT.BM'
