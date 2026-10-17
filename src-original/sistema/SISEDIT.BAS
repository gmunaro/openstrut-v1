' ============================================================================
'  SISEDIT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/SISEDIT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 1688cd887c2bbea44764d6998a10d0a207c4d5eae66a92286113bd6d7f4eef74
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_SISTEMA.BI'

' ---- variaveis do SISEDIT fora do COMMON (DS do programa)
REDIM SHARED A_0dfc$(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_0dc0$
DIM SHARED V_0dc4$
DIM SHARED V_0dc8$
DIM SHARED V_0dcc$
DIM SHARED V_0dd0$
DIM SHARED V_0dd4$
DIM SHARED V_0dd8!
DIM SHARED V_0ddc!
DIM SHARED V_0de0!
DIM SHARED V_0de4!
DIM SHARED V_0de8!
DIM SHARED V_0dec!
DIM SHARED V_0df0!
DIM SHARED V_0df4!
DIM SHARED V_0df8$
DIM SHARED V_0e2a$
DIM SHARED V_0e34!
DIM SHARED V_0e38$
DIM SHARED V_0e3c!
DIM SHARED V_0e40!
DIM SHARED V_0e44!
DIM SHARED V_0e48!
DIM SHARED V_0e4c$
DIM SHARED V_0e50!
DIM SHARED V_0e54!
DIM SHARED V_0e58!
DIM SHARED V_0e5c!
DIM SHARED V_0e60$
DIM SHARED V_0e64!
DIM SHARED V_0e68!
DIM SHARED V_0e6c!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "SISEDIT"
' ---- M_SISEDIT @0x10030  (010030_M_SISEDIT.lift.txt; evidence_id (assembly): ev_413c57d629e536d68f59610c09d7c871dff26ee55ec36ad27db1f89ce8a506ce)
' @10030 inicio do programa (B$?EVT)
RT_CLEAR   '@1006c (CLEAR zera as variaveis do programa e do COMMON, nao o estado do RT45)
V_0e34! = 2000.0   '@1007e DS:0f70
V_0de4! = 1.0   '@1008f DS:0f74
V_0de8! = 1.0   '@100a0 DS:0f74
V_0df0! = 1.0   '@100b1 DS:0f74
V_0df4! = 1.0   '@100c2 DS:0f74
V_0dec! = 1.0   '@100d3 DS:0f74
REDIM A_0dfc$(-32768 TO -32768)   '@100e4
REDIM A_0dfc$(0 TO CINT(V_0e34!))   '@100f2
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@10116
GOSUB L_10664   '@10125
V_0dd8! = 1.0   '@10132 DS:0f74
L_10148:
IF NOT (ENVIRON$(RT_CINT%(FX##(V_0dd8!))) <> "") THEN GOTO L_101ea   '@10149 DS:0f78
IF NOT (RT_INSTR%((1), (ENVIRON$(RT_CINT%(FX##(V_0dd8!)))), ("COMSPEC")) > 0) THEN GOTO L_101cb   '@10167 DS:0f7c
V_0dd0$ = RT_MID$((ENVIRON$(RT_CINT%(FX##(V_0dd8!)))), (9), (1))   '@10191
GOTO L_101ea   '@101be
L_101cb:
V_0dd8! = FX##(V_0dd8!) + 1.0   '@101cb DS:0f74
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10148   '@101e1
L_101ea:
V_0dcc$ = V_0dd0$   '@101ea
L_BP0c% = (V_0dcc$ = "A")   '@101fc DS:0f88
IF NOT ((V_0dcc$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_1025a   '@10221 DS:0f8e
V_0dcc$ = V_0dcc$ + ":\"   '@10236 DS:0f94
GOTO L_1027b   '@10252
L_1025a:
V_0dcc$ = V_0dcc$ + ":\SISTRUT\EXEC40\"   '@1025a DS:0f9a
L_1027b:
V_0dc0$ = "CGA"   '@1027b DS:0fb0
V_0dd4$ = "\"   '@1028d DS:0fb8
V_0de0! = 1.0   '@1029f DS:0f74
V_0e38$ = ""   '@102b0 DS:0f78
L_102c8:
IF NOT (V_0de0! < 18.0) THEN GOTO L_10332   '@102c9 DS:0fbe
V_0e38$ = V_0e38$ + CHR$(SCREEN(4, RT_CINT%(FX##(V_0de0!))))   '@102de
V_0de0! = FX##(V_0de0!) + 1.0   '@10314 DS:0f74
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_102c8   '@1032a
L_10332:
' PROTECAO: verificacao de licenca do original desativada
V_0de0! = 1.0   '@10349 DS:0f74
V_0e38$ = ""   '@1035a DS:0f78
L_10372:
IF NOT (V_0de0! < 40.0) THEN GOTO L_103dc   '@10373 DS:0fd8
V_0e38$ = V_0e38$ + CHR$(SCREEN(5, RT_CINT%(FX##(V_0de0!))))   '@10388
V_0de0! = FX##(V_0de0!) + 1.0   '@103be DS:0f74
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10372   '@103d4
L_103dc:
V_0dcc$ = RTRIM$(RT_MID2$((V_0e38$), (17)))   '@103dc
V_0dd0$ = RT_MID$((V_0dcc$), (1), (1))   '@10402
V_0dd4$ = RT_MID2$((V_0dcc$), (3))   '@1041f
V_0dc0$ = RT_MID$((V_0e38$), (1), (3))   '@1043f
GOTO L_104a0   '@1045f
L_10467:
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_104a0:
V_0dc4$ = V_0dd0$   '@104a0
V_0dc8$ = V_0dd4$   '@104b2
L_BP0c% = (V_0dc4$ <> "A")   '@104c4 DS:0f88
IF NOT ((V_0dc4$ <> "B" AND L_BP0c%) <> 0) THEN GOTO L_1054a   '@104e9 DS:0f8e
L_BP0c% = (LEN(V_0dc8$) > 1)   '@104fe DS:1032
CHDIR RT_ARQ$(V_0dc4$ + ":" + RT_LEFT$((V_0dc8$), (LEN(V_0dc8$) + L_BP0c%)))   '@1052b
L_1054a:
ON ERROR GOTO L_105b9
RT_ONERR = &H105b9   '@1054a
V_0e3c! = 15.0   '@10559 DS:1038
V_0e40! = 1.0   '@1056a DS:0f74
V_0e44! = 15.0   '@1057b DS:1038
PCOPY 0, 1   '@1058c
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@1059d
GOTO L_10a27   '@105ac
' ---- F_105b4 @0x105b4  (0105b4_F_105b4.lift.txt; evidence_id (assembly): ev_fa5b69acf74660a2546ca7d6ce93a2a72f3c06bf550a021d3334fcdbc1b0633e)
L_105b9:   ' entrada vinda de 010030_M_SISEDIT
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@105be
V_0dc0$ = "HER"   '@105cd DS:103c
V_0e3c! = 14.0   '@105df DS:1044
V_0e40! = 0.0   '@105f0 DS:1048
V_0e44! = 9.0   '@10601 DS:104c
RESUME L_10a27   '@10612
L_10624:   ' entrada vinda de 010030_M_SISEDIT, 01065f_F_1065f, 011d2c_F_11d2c, 0134f4_F_134f4, 013602_FUN_1000_3602, 013978_F_13978
RESUME L_1063b   '@10629
L_1063b:
GOSUB L_10664   '@10640
CALL S_13bf1   '@1064d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
GOTO L_10a27   '@10657
' ---- F_1065f @0x1065f  (01065f_F_1065f.lift.txt; evidence_id (assembly): ev_2b26e63309c320da176c72fc52ec7529e5937b31c63e6d36cc31f960b5e62fa0)
L_10664:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_SISEDIT, 0105b4_F_105b4
ON KEY(1) GOSUB L_12085
RT_ONKEY 1, 1   '@10669
KEY(1) ON
RT_KEYESTADO 1, 1   '@1067c
FOR V_0e48! = 2.0 TO 10.0   '@1068a DS:0f74,1050,1054
ON KEY(RT_CINT%(FX##(V_0e48!))) GOSUB L_10909
RT_ONKEY RT_CINT%(FX##(V_0e48!)), 2   '@10698
KEY(RT_CINT%(FX##(V_0e48!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e48!)), 1   '@106b2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0e48!   '@106c7 DS:0f74,1054
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@106f0
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10718
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@10740
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10768
FOR V_0e48! = 15.0 TO 18.0   '@10790 DS:0f74,0fbe,1038
ON KEY(RT_CINT%(FX##(V_0e48!))) GOSUB L_10934
RT_ONKEY RT_CINT%(FX##(V_0e48!)), 3   '@1079e
KEY(RT_CINT%(FX##(V_0e48!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e48!)), 1   '@107b8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0e48!   '@107cd DS:0f74,0fbe
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@107f6
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1081e
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@10846
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1086e
FOR V_0e48! = 19.0 TO 22.0   '@10895 DS:0f74,1058,105c
ON KEY(RT_CINT%(FX##(V_0e48!))) GOSUB L_12a42
RT_ONKEY RT_CINT%(FX##(V_0e48!)), 4   '@108a2
KEY(RT_CINT%(FX##(V_0e48!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_0e48!)), 1   '@108bc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0e48!   '@108d1 DS:0f74,105c
RETURN   '@108fa
L_10909:
BEEP   '@1090e
GOSUB L_10664   '@10918
RETURN   '@10925
L_10934:   ' entrada vinda de 011d2c_F_11d2c
RT_VIEWPRINT 1, 25   '@10939
COLOR 7, 0, 0   '@1094b
RT_CLS 0   '@1096f
PRINT " Aguarde ..."   '@1097c DS:1060
PRINT ""   '@1098a DS:0f78
PRINT " Retorno ao Modulo Gerenciador"   '@10998 DS:1070
ON ERROR GOTO L_109e0
RT_ONERR = &H109e0   '@109a6
RT_RUN RT_MID$((V_0dcc$), (1), (11)) + "SISTRUT"   '@109b5 DS:1092
L_109e0:
PRINT " Modulo nao encontrado em "; RT_MID$((V_0dcc$), (1), (11))   '@109e5 DS:109e
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@10a0a DS:0ff6
RT_FIM   '@10a18 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10a27:   ' entrada vinda de 010030_M_SISEDIT, 0105b4_F_105b4
RT_SCREEN 0   '@10a2c
RT_VIEWPRINT 1, 25   '@10a41
COLOR 7, RT_CINT%(FX##(V_0e40!)), RT_CINT%(FX##(V_0e40!))   '@10a53
RT_CLOSE   '@10a87 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RT_CLS 0   '@10a94
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@10aa1
RT_VIEWPRINT 1, 1   '@10ab0
COLOR 4, 7   '@10abf
RT_CLS 2   '@10add
PRINT " OpenStrut - engenharia reversa independente do SISTRUT 4.0 (1991)     EDITOR";   '@10aeb DS:10bc
GOSUB L_10b13   '@10af9
GOTO L_10da2   '@10b06
' ---- F_10b0e @0x10b0e  (010b0e_F_10b0e.lift.txt; evidence_id (assembly): ev_f9c0d2d1927fb4aa86ff164bd0ba15df20b641f4b073ffb21e10770f86a308f8)
L_10b13:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01065f_F_1065f
RT_VIEWPRINT 25, 25   '@10b18
COLOR 4, 7   '@10b27
RT_CLS 2   '@10b45
PRINT " Arquivo:                                           Linha:        Coluna:";   '@10b53 DS:110e
GOSUB L_10b8a   '@10b61
GOSUB L_10c5b   '@10b6e
RETURN   '@10b7b
L_10b8a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011d2c_F_11d2c, 0134f4_F_134f4, 013602_FUN_1000_3602
RT_VIEWPRINT 25, 25   '@10b8f
COLOR -(V_0dc0$ = "HER") * 7, -(V_0dc0$ <> "HER") * 7   '@10b9e DS:103c
LOCATE 25, 11   '@10bea
PRINT V_0dc4$; ":"; V_0dc8$; V_0df8$; RT_TAB$(53); ""; "";   '@10c08 DS:0f78,1032
RETURN   '@10c4c
L_10c5b:   ' sub-rotina (alvo de GOSUB)
RT_VIEWPRINT 25, 25   '@10c60
COLOR -(V_0dc0$ = "HER") * 7, -(V_0dc0$ <> "HER") * 7   '@10c6f DS:103c
LOCATE 25, 59   '@10cbb
PRINT USING "####"; RT_PU#(V_0de4!, "####", 1);   '@10cd9 DS:115c
LOCATE 25, 74   '@10cf9
PRINT USING "####"; RT_PU#(V_0de8!, "####", 1);   '@10d17 DS:115c
RETURN   '@10d37
L_10d46:   ' sub-rotina (alvo de GOSUB)
RT_VIEWPRINT 24, 24   '@10d4b
COLOR 7, 0   '@10d5a
RT_CLS 2   '@10d77
PRINT "  <ESC>=Acesso as funcoes Ler/Salvar/Deletar/Incluir/Fim     <F1>=Informacoes";   '@10d85 DS:1164
RETURN   '@10d93
L_10da2:   ' entrada vinda de 01065f_F_1065f, 011d2c_F_11d2c
GOSUB L_10d46   '@10da7
L_10db9:
RT_VIEWPRINT 2, 23   '@10dbe
COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(FX##(V_0e40!))   '@10dd0
IF NOT (FX##(V_0df4!) + 79.0 < FX##(V_0de8!) OR (V_0de8! < V_0df4! OR (FX##(V_0df0!) + 21.0 < FX##(V_0de4!) OR V_0de4! < V_0df0!))) THEN GOTO L_10f50   '@10dfc DS:11b6,11ba
IF NOT (V_0de4! < V_0df0!) THEN GOTO L_10ea6   '@10e7a
V_0df0! = V_0de4!   '@10e95
L_10ea6:
IF NOT (FX##(V_0df0!) + 21.0 < FX##(V_0de4!)) THEN GOTO L_10edc   '@10ea6 DS:11b6
V_0df0! = FX##(V_0de4!) - 21.0   '@10ec6 DS:11be
L_10edc:
IF NOT (V_0de8! < V_0df4!) THEN GOTO L_10f08   '@10edc
V_0df4! = V_0de8!   '@10ef7
L_10f08:
IF NOT (FX##(V_0df4!) + 79.0 < FX##(V_0de8!)) THEN GOTO L_10f3e   '@10f08 DS:11ba
V_0df4! = FX##(V_0de8!) - 79.0   '@10f28 DS:11c2
L_10f3e:
GOSUB L_11d31   '@10f3e
L_10f50:
V_0ddc! = 0.0   '@10f50 DS:1048
L_10f66:
V_0e38$ = RT_INKEY$   '@10f66
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
LOCATE RT_CINT%(FX##(V_0de4!) - V_0df0! + 2.0), RT_CINT%(FX##(V_0de8!) - V_0df4! + 1.0)   '@10f7a DS:0f74,1050
IF NOT (V_0ddc! = 1.0) THEN GOTO L_11045   '@10fba DS:0f74
PRINT CHR$(95);   '@10fd5
V_0ddc! = RT_TIMER   '@10fe9
L_11004:
IF NOT (FX##(RT_TIMER) - V_0ddc! < 0.039999999105930328369140625##) THEN GOTO L_1102c   '@11005 DS:11c6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_11004   '@11024
L_1102c:
V_0ddc! = 0.0   '@1102c DS:1048
GOTO L_110d6   '@1103d
L_11045:
PRINT RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0de8!))), (1));   '@11045
V_0ddc! = RT_TIMER   '@1107c
L_11098:
IF NOT (FX##(RT_TIMER) - V_0ddc! < 0.100000001490116119384765625##) THEN GOTO L_110c0   '@11099 DS:11ca
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_11098   '@110b8
L_110c0:
V_0ddc! = 1.0   '@110c0 DS:0f74
L_110d6:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
IF NOT (V_0e38$ <> "") THEN GOTO L_10f66   '@110d6 DS:0f78
LOCATE RT_CINT%(FX##(V_0de4!) - V_0df0! + 2.0), 1   '@110ed DS:1050
IF NOT (FX##(LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!))))) - V_0df4! + 1.0 < FX##(80.0)) THEN GOTO L_111b5   '@11119 DS:0f74,11ce
PRINT RT_MID2$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0df4!)))); RT_TAB$(80); ""; " ";   '@1115b DS:0f78,11d2
GOTO L_111f1   '@111ad
L_111b5:
PRINT RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0df4!))), (80));   '@111b5
L_111f1:
LOCATE RT_CINT%(FX##(V_0de4!) - V_0df0! + 2.0), RT_CINT%(FX##(V_0de8!) - V_0df4! + 1.0)   '@111f1 DS:0f74,1050
V_0e4c$ = V_0e38$   '@11231
IF NOT (CHR$(0) + CHR$(72) = V_0e4c$) THEN GOTO L_11329   '@11243
IF NOT (V_0de4! > 1.0) THEN GOTO L_11321   '@1126f DS:0f74
V_0de4! = FX##(V_0de4!) - 1.0   '@1128a DS:11d8
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_11307   '@112a0
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@112d8
L_11307:
GOSUB L_10c5b   '@11307
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11314
L_11321:
GOTO L_11d24   '@11321
L_11329:
IF NOT (CHR$(0) + CHR$(80) = V_0e4c$) THEN GOTO L_1140a   '@11329
IF NOT (V_0de4! < V_0dec!) THEN GOTO L_11402   '@11350
V_0de4! = FX##(V_0de4!) + 1.0   '@1136b DS:0f74
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_113e8   '@11381
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@113b9
L_113e8:
GOSUB L_10c5b   '@113e8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@113f5
L_11402:
GOTO L_11d24   '@11402
L_1140a:
IF NOT (CHR$(0) + CHR$(75) = V_0e4c$) THEN GOTO L_11484   '@1140a
IF NOT (V_0de8! > 1.0) THEN GOTO L_1147c   '@11431 DS:0f74
V_0de8! = FX##(V_0de8!) - 1.0   '@1144c DS:11d8
GOSUB L_10c5b   '@11462
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@1146f
L_1147c:
GOTO L_11d24   '@1147c
L_11484:
IF NOT (CHR$(0) + CHR$(77) = V_0e4c$) THEN GOTO L_1151b   '@11484
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) >= V_0de8!) THEN GOTO L_11513   '@114ab
V_0de8! = FX##(V_0de8!) + 1.0   '@114e3 DS:0f74
GOSUB L_10c5b   '@114f9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11506
L_11513:
GOTO L_11d24   '@11513
L_1151b:
IF NOT (CHR$(0) + CHR$(73) = V_0e4c$) THEN GOTO L_115fc   '@1151b
IF NOT (V_0de4! > 10.0) THEN GOTO L_115f4   '@11542 DS:1054
V_0de4! = FX##(V_0de4!) - 10.0   '@1155d DS:11dc
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_115da   '@11573
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@115ab
L_115da:
GOSUB L_10c5b   '@115da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@115e7
L_115f4:
GOTO L_11d24   '@115f4
L_115fc:
IF NOT (CHR$(0) + CHR$(81) = V_0e4c$) THEN GOTO L_116e2   '@115fc
IF NOT (FX##(V_0de4!) + 10.0 < FX##(V_0dec!)) THEN GOTO L_116da   '@11623 DS:1054
V_0de4! = FX##(V_0de4!) + 10.0   '@11643 DS:1054
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_116c0   '@11659
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@11691
L_116c0:
GOSUB L_10c5b   '@116c0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@116cd
L_116da:
GOTO L_11d24   '@116da
L_116e2:
IF NOT (CHR$(0) + CHR$(15) = V_0e4c$) THEN GOTO L_1175c   '@116e2
IF NOT (V_0de8! > 10.0) THEN GOTO L_11754   '@11709 DS:1054
V_0de8! = FX##(V_0de8!) - 10.0   '@11724 DS:11dc
GOSUB L_10c5b   '@1173a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11747
L_11754:
GOTO L_11d24   '@11754
L_1175c:
IF NOT (CHR$(9) = V_0e4c$) THEN GOTO L_117e9   '@1175c
IF NOT (FX##(V_0de8!) + 10.0 <= LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!))))) THEN GOTO L_117e1   '@11774 DS:1054
V_0de8! = FX##(V_0de8!) + 10.0   '@117b1 DS:1054
GOSUB L_10c5b   '@117c7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@117d4
L_117e1:
GOTO L_11d24   '@117e1
L_117e9:
IF NOT (CHR$(0) + CHR$(71) = V_0e4c$) THEN GOTO L_1183e   '@117e9
V_0de8! = 1.0   '@11810 DS:0f74
GOSUB L_10c5b   '@11821
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@1182e
L_1183e:
IF NOT (CHR$(0) + CHR$(79) = V_0e4c$) THEN GOTO L_118b1   '@1183e
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@11865
GOSUB L_10c5b   '@11894
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@118a1
L_118b1:
IF NOT (CHR$(0) + CHR$(119) = V_0e4c$) THEN GOTO L_11917   '@118b1
V_0de4! = 1.0   '@118d8 DS:0f74
V_0de8! = 1.0   '@118e9 DS:0f74
GOSUB L_10c5b   '@118fa
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11907
L_11917:
IF NOT (CHR$(0) + CHR$(117) = V_0e4c$) THEN GOTO L_1197d   '@11917
V_0de4! = V_0dec!   '@1193e
V_0de8! = 1.0   '@1194f DS:0f74
GOSUB L_10c5b   '@11960
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@1196d
L_1197d:
IF NOT (CHR$(0) + CHR$(83) = V_0e4c$) THEN GOTO L_11a94   '@1197d
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) >= V_0de8!) THEN GOTO L_11a8c   '@119a4
A_0dfc$(RT_CINT%(FX##(V_0de4!))) = RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (1), (RT_CINT%(FX##(V_0de8!) - 1.0))) + RT_MID2$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0de8!) + 1.0)))   '@119dc DS:0f74,11d8
GOSUB L_11f5b   '@11a65
GOSUB L_10c5b   '@11a72
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11a7f
L_11a8c:
GOTO L_11d24   '@11a8c
L_11a94:
IF NOT (CHR$(13) = V_0e4c$) THEN GOTO L_11b95   '@11a94
IF NOT (V_0de4! >= V_0dec!) THEN GOTO L_11aee   '@11aac
V_0dec! = FX##(V_0dec!) + 1.0   '@11ac7 DS:0f74
V_0de8! = 1.0   '@11add DS:0f74
L_11aee:
GOSUB L_11f5b   '@11aee
V_0de4! = FX##(V_0de4!) + 1.0   '@11afb DS:0f74
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_11b78   '@11b11
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@11b49
L_11b78:
GOSUB L_10c5b   '@11b78
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11b85
L_11b95:
L_BP0c% = (ASC(V_0e38$) >= 32)   '@11b95
IF NOT ((ASC(V_0e38$) <= 122 AND L_BP0c%) <> 0) THEN GOTO L_11d1f   '@11bb3
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_11c4f   '@11bcb
A_0dfc$(RT_CINT%(FX##(V_0de4!))) = A_0dfc$(RT_CINT%(FX##(V_0de4!))) + V_0e38$   '@11c03
GOTO L_11ce2   '@11c47
L_11c4f:
A_0dfc$(RT_CINT%(FX##(V_0de4!))) = RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (1), (RT_CINT%(FX##(V_0de8!) - 1.0))) + V_0e38$ + RT_MID2$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0de8!))))   '@11c4f DS:11d8
L_11ce2:
V_0de8! = FX##(V_0de8!) + 1.0   '@11ce2 DS:0f74
GOSUB L_11f5b   '@11cf8
GOSUB L_10c5b   '@11d05
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11d12
L_11d1f:
L_11d24:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10db9   '@11d24
' ---- F_11d2c @0x11d2c  (011d2c_F_11d2c.lift.txt; evidence_id (assembly): ev_dae057dd287caa6e535d2f0df182f19a91978c648055822fbfebe0000188ba3c)
L_11d31:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010b0e_F_10b0e, 0134f4_F_134f4
RT_VIEWPRINT 2, 23   '@11d36
COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(FX##(V_0e40!))   '@11d48
FOR V_0dd8! = 2.0 TO 23.0   '@11d74 DS:0f74,1050,11e4
IF NOT (FX##(V_0dd8!) - 2.0 + V_0df0! > FX##(V_0dec!)) THEN GOTO L_11daf   '@11d82 DS:11e0
GOTO L_11ef3   '@11da7
L_11daf:
LOCATE RT_CINT%(FX##(V_0dd8!)), 1   '@11daf
IF NOT (FX##(LEN(A_0dfc$(RT_CINT%(FX##(V_0dd8!) - 2.0 + V_0df0!)))) - V_0df4! + 1.0 < FX##(80.0)) THEN GOTO L_11e81   '@11dd1 DS:0f74,11ce,11e0
PRINT RT_MID2$((A_0dfc$(RT_CINT%(FX##(V_0dd8!) - 2.0 + V_0df0!))), (RT_CINT%(FX##(V_0df4!)))); RT_TAB$(80); ""; " ";   '@11e1d DS:0f78,11d2,11e0
GOTO L_11ec7   '@11e79
L_11e81:
PRINT RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0dd8!) - 2.0 + V_0df0!))), (RT_CINT%(FX##(V_0df4!))), (80));   '@11e81 DS:11e0
L_11ec7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@11ec7 DS:0f74,11e4
L_11ef3:
IF NOT (V_0dd8! < 24.0) THEN GOTO L_11f4c   '@11ef3 DS:11e8
RT_VIEWPRINT RT_CINT%(FX##(V_0dd8!)), 23   '@11f0e
RT_CLS 2   '@11f27
RT_VIEWPRINT 2, 23   '@11f35
L_11f4c:
RETURN   '@11f4c
L_11f5b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010b0e_F_10b0e
RT_VIEWPRINT 2, 23   '@11f60
LOCATE RT_CINT%(FX##(V_0de4!) - V_0df0! + 2.0), 1   '@11f72 DS:1050
IF NOT (FX##(LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!))))) - V_0df4! + 1.0 < FX##(80.0)) THEN GOTO L_1203a   '@11f9e DS:0f74,11ce
PRINT RT_MID2$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0df4!)))); RT_TAB$(80); ""; " ";   '@11fe0 DS:0f78,11d2
GOTO L_12076   '@12032
L_1203a:
PRINT RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (RT_CINT%(FX##(V_0df4!))), (80));   '@1203a
L_12076:
RETURN   '@12076
L_12085:   ' entrada vinda de 01065f_F_1065f
V_0e50! = 0.0   '@1208a DS:1048
V_0e54! = 1.0   '@1209c DS:0f74
CALL MIXT_0dbe_GuardaTela(V_0e50!, V_0e54!, V_0dc0$)   '@120a7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 2, 23   '@120b8
COLOR RT_CINT%(FX##(V_0e3c!)), 3   '@120ca
LOCATE 7, 3   '@120ef
PRINT CHR$(218); RT_STRINGC$((69), (196)); CHR$(191)   '@1210d
FOR V_0dd8! = 8.0 TO 19.0   '@12143 DS:0f74,1058,11ec
LOCATE RT_CINT%(FX##(V_0dd8!)), 3   '@12150
COLOR RT_CINT%(FX##(V_0e3c!))   '@12175
PRINT CHR$(179); RT_STRINGC$((69), (32)); CHR$(179);   '@12192
COLOR 0   '@121c8
PRINT CHR$(219)   '@121dd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@121f1 DS:0f74,1058
LOCATE 20, 3   '@1221d
COLOR RT_CINT%(FX##(V_0e3c!))   '@1223b
PRINT CHR$(192); RT_STRINGC$((69), (196)); CHR$(217);   '@12258
COLOR 0   '@1228e
PRINT CHR$(219)   '@122a3
LOCATE 21, 5   '@122b7
PRINT RT_STRINGC$((70), (219))   '@122d5
COLOR 9 - (V_0dc0$ <> "HER") * 22   '@122ed DS:103c
LOCATE 8, 25   '@1231d
PRINT "TECLAS DE FUNCIONAMENTO"   '@1233b DS:11f0
COLOR 8   '@12349
LOCATE 10, 5   '@1235f
PRINT CHR$(24); " "; CHR$(25); " "; CHR$(26); " "; CHR$(27); " movimentar o cursor"   '@1237d DS:11d2,120c
LOCATE 11, 5   '@123e2
PRINT "<ESC>   acesso as funcoes Ler/Salvar/Incluir/Deletar/Fim"   '@12400 DS:1224
LOCATE 13, 5   '@1240e
PRINT "<PG UP> sobe 10            <PG DN>       desce 10"   '@1242c DS:1260
LOCATE 14, 5   '@1243a
PRINT "<HOME>  inicio da linha    <Ctrl>+<HOME> inicio do texto"   '@12458 DS:1296
LOCATE 15, 5   '@12466
PRINT "<END>   fim da linha       <Ctrl>+<END>  fim do texto"   '@12484 DS:12d2
LOCATE 16, 5   '@12492
PRINT "<TAB>   avanca na linha    <Shift>+<TAB> retorna na linha"   '@124b0 DS:130c
LOCATE 17, 5   '@124be
PRINT "<DEL>   deleta o caracter sob o cursor"   '@124dc DS:134a
LOCATE 19, 7   '@124ea
PRINT "Ao termino da edicao, salve o texto editado."   '@12508 DS:1374
COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(FX##(V_0e40!))   '@12516
CALL MIXT_07f1_LimpaTeclado   '@12542
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@1254c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
COLOR RT_CINT%(FX##(V_0e3c!)), 4   '@12568
LOCATE 6, 6   '@1258a
PRINT CHR$(218); RT_STRINGC$((69), (196)); CHR$(191)   '@125a8
FOR V_0dd8! = 7.0 TO 16.0   '@125de DS:0f74,13a4,13a8
LOCATE RT_CINT%(FX##(V_0dd8!)), 6   '@125ec
COLOR RT_CINT%(FX##(V_0e3c!))   '@12611
PRINT CHR$(179); RT_STRINGC$((69), (32)); CHR$(179);   '@1262e
COLOR 0   '@12664
PRINT CHR$(219)   '@12679
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@1268d DS:0f74,13a8
LOCATE 17, 6   '@126b9
COLOR RT_CINT%(FX##(V_0e3c!))   '@126d7
PRINT CHR$(192); RT_STRINGC$((69), (196)); CHR$(217);   '@126f4
COLOR 0   '@1272a
PRINT CHR$(219)   '@1273f
LOCATE 18, 8   '@12753
PRINT RT_STRINGC$((70), (219))   '@12771
COLOR 9 - (V_0dc0$ <> "HER") * 22   '@12789 DS:103c
LOCATE 7, 22   '@127b9
PRINT "GRAVACAO E LEITURA DOS ARQUIVOS"   '@127d7 DS:13ac
COLOR 7   '@127e5
LOCATE 9, 8   '@127fb
PRINT "Para Leitura e Gravacao dos arquivos editados, forneca o nome do"   '@12819 DS:13d0
LOCATE 10, 8   '@12827
PRINT "arquivo e sua respectiva extensao caso exista ."   '@12845 DS:1414
LOCATE 11, 8   '@12853
PRINT "Para alterar o Drive e o Diretorio, entre no nome do arquivo com"   '@12871 DS:1448
LOCATE 12, 8   '@1287f
PRINT "a rota completa.  exemplo:   C:\SISTRUT\EXEC40\PILAR.INI "   '@1289d DS:148c
LOCATE 13, 8   '@128ab
PRINT "No caso do Drive e Diretorio estarem corretos, entre somente com"   '@128c9 DS:14ca
LOCATE 14, 8   '@128d7
PRINT "o nome do arquivo.  exemplo: PILAR.INI"   '@128f5 DS:150e
LOCATE 16, 8   '@12903
PRINT "Memoria Livre disponivel"; RT_STR8$(RT_DBL#(INT(FX##(RT_FREN&(-1)) / 1024.0#))) + " "; "kb";   '@12921 DS:1538,1554,155c
COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(FX##(V_0e40!))   '@12961
CALL MIXT_07f1_LimpaTeclado   '@1298d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@12997
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e58! = 1.0   '@129b3 DS:0f74
V_0e5c! = 0.0   '@129c5 DS:1048
CALL MIXT_0dbe_GuardaTela(V_0e58!, V_0e5c!, V_0dc0$)   '@129d0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
LOCATE RT_CINT%(FX##(V_0de4!) - V_0df0! + 2.0), RT_CINT%(FX##(V_0de8!) - V_0df4! + 1.0)   '@129e1 DS:0f74,1050
V_0e38$ = ""   '@12a21 DS:0f78
RETURN   '@12a33
L_12a42:   ' entrada vinda de 01065f_F_1065f, 0134f4_F_134f4, 013602_FUN_1000_3602, 013978_F_13978
RT_VIEWPRINT 24, 24   '@12a47
COLOR 7, 0   '@12a56
RT_CLS 2   '@12a73
PRINT "  Ler    Salvar    Deletar Linha    Incluir Linha    Fim     <F1>=Informacoes";   '@12a81 DS:1562
COLOR RT_CINT%(FX##(V_0e44!)), 0   '@12a8f
LOCATE 24, 1   '@12ab3
PRINT "<L>";   '@12ace DS:15b4
LOCATE , 8   '@12adc
PRINT "<S>";   '@12af5 DS:15bc
LOCATE , 18   '@12b03
PRINT "<D>";   '@12b1c DS:15c4
LOCATE , 35   '@12b2a
PRINT "<I>";   '@12b43 DS:15cc
LOCATE , 52   '@12b51
PRINT "<F>";   '@12b6a DS:15d4
COLOR RT_CINT%(FX##(V_0e3c!)), 0   '@12b78
CALL MIXT_07f1_LimpaTeclado   '@12b9c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@12ba6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e60$ = V_0e38$   '@12bc2
IF NOT (V_0e60$ <> "L") THEN GOTO L_12bfd   '@12bd4 DS:15dc
IF NOT (V_0e60$ = "l") THEN GOTO L_12c0d   '@12beb DS:15e2
L_12bfd:
GOTO L_132b5   '@12bfd
L_12c0d:
IF NOT (V_0e60$ <> "S") THEN GOTO L_12c31   '@12c0d DS:15e8
IF NOT (V_0e60$ = "s") THEN GOTO L_12c41   '@12c1f DS:15ee
L_12c31:
GOTO L_13602   '@12c31
L_12c41:
IF NOT (V_0e60$ <> "D") THEN GOTO L_12c65   '@12c41 DS:15f4
IF NOT (V_0e60$ = "d") THEN GOTO L_12f15   '@12c53 DS:15fa
L_12c65:
IF NOT (V_0dec! = 1.0 AND V_0de4! = 1.0) THEN GOTO L_12cab   '@12c65 DS:0f74
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@12ca3
L_12cab:
RT_CLS 2   '@12cab
LOCATE 24, 1   '@12cb9
PRINT " Confirme DELETAR  "; RT_MID$((A_0dfc$(RT_CINT%(FX##(V_0de4!)))), (1), (40)); " ... ";   '@12cd4 DS:1600,1618
CALL MIXT_07f1_LimpaTeclado   '@12d13
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " N/*S* ", V_0e38$   '@12d1d DS:1622 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e38$) = "N") THEN GOTO L_12d5c   '@12d37 DS:162e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@12d54
L_12d5c:
V_0e2a$ = A_0dfc$(RT_CINT%(FX##(V_0de4!)))   '@12d5c
IF NOT (V_0de4! = V_0dec!) THEN GOTO L_12dbb   '@12d82
V_0de4! = FX##(V_0de4!) - 1.0   '@12d9d DS:11d8
GOTO L_12e47   '@12db3
L_12dbb:
V_0e64! = V_0dec!   '@12dbb
FOR V_0dd8! = FX##(V_0de4!) + 1.0 TO V_0e64!   '@12dcd DS:0f74
A_0dfc$(RT_CINT%(FX##(V_0dd8!) - 1.0)) = A_0dfc$(RT_CINT%(FX##(V_0dd8!)))   '@12dda DS:11d8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@12e19 DS:0f74
L_12e47:
RT_CLS 2   '@12e47
A_0dfc$(RT_CINT%(FX##(V_0dec!))) = ""   '@12e55 DS:0f78
V_0dec! = FX##(V_0dec!) - 1.0   '@12e7b DS:11d8
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_12ef8   '@12e91
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@12ec9
L_12ef8:
GOSUB L_11d31   '@12ef8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@12f05
L_12f15:
IF NOT (V_0e60$ <> "I") THEN GOTO L_12f39   '@12f15 DS:1634
IF NOT (V_0e60$ = "i") THEN GOTO L_131be   '@12f27 DS:163a
L_12f39:
RT_CLS 2   '@12f39
LOCATE 24, 1   '@12f47
IF NOT (LEN(V_0e2a$) = 0) THEN GOTO L_12fd6   '@12f62
PRINT " Confirme INCLUIR  N/*S* ";   '@12f77 DS:1640
CALL MIXT_07f1_LimpaTeclado   '@12f85
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e38$   '@12f8f DS:0f78 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e38$) = "N") THEN GOTO L_12fce   '@12fa9 DS:162e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@12fc6
L_12fce:
GOTO L_1305c   '@12fce
L_12fd6:
PRINT " Confirme INCLUIR  "; RT_MID$((V_0e2a$), (1), (40)); " ... ";   '@12fd6 DS:1618,165e
CALL MIXT_07f1_LimpaTeclado   '@13004
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " S/*N* ", V_0e38$   '@1300e DS:1676 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e38$) <> "S") THEN GOTO L_13057   '@13028 DS:15e8
V_0e2a$ = ""   '@13045 DS:0f78
L_13057:
L_1305c:
V_0e68! = V_0de4!   '@1305c
FOR V_0dd8! = V_0dec! TO V_0e68! STEP -1.0   '@1306e DS:11d8
A_0dfc$(RT_CINT%(FX##(V_0dd8!) + 1.0)) = A_0dfc$(RT_CINT%(FX##(V_0dd8!)))   '@13076 DS:0f74
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@130b5 DS:11d8
A_0dfc$(RT_CINT%(FX##(V_0de4!))) = V_0e2a$   '@130de
V_0e2a$ = ""   '@13104 DS:0f78
RT_CLS 2   '@13116
V_0dec! = FX##(V_0dec!) + 1.0   '@13124 DS:0f74
IF NOT (LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) < V_0de8!) THEN GOTO L_131a1   '@1313a
V_0de8! = LEN(A_0dfc$(RT_CINT%(FX##(V_0de4!)))) + 1   '@13172
L_131a1:
GOSUB L_11d31   '@131a1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@131ae
L_131be:
IF NOT (V_0e60$ <> "F") THEN GOTO L_131e2   '@131be DS:1682
IF NOT (V_0e60$ = "f") THEN GOTO L_13272   '@131d0 DS:1688
L_131e2:
RT_CLS 2   '@131e2
LOCATE 24, 1   '@131f0
PRINT " Confirme FIM  ";   '@1320b DS:168e
CALL MIXT_07f1_LimpaTeclado   '@13219
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " N/*S* ", V_0e38$   '@13223 DS:1622 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e38$) <> "N") THEN GOTO L_13262   '@1323d DS:162e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_10934   '@1325a
L_13262:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@13262
L_13272:
COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(FX##(V_0e40!))   '@13272
RETURN L_10da2   '@132a8
L_132b5:
RT_CLS 2   '@132ba
CALL MIXT_07f1_LimpaTeclado   '@132c8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " Nome do Arquivo *RETORNO* ", V_0e38$   '@132d2 DS:16a2 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e38$) = 0) THEN GOTO L_13309   '@132ec
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@13301
L_13309:
V_0df8$ = UCASE$(V_0e38$)   '@13309
GOSUB L_13a28   '@13321
RT_CLS 2   '@1332e
PRINT " Aguarde ..";   '@1333c DS:16c2
ON ERROR GOTO L_134f9
RT_ONERR = &H134f9   '@1334a
REDIM A_0dfc$(-32768 TO -32768)   '@13359
REDIM A_0dfc$(0 TO CINT(V_0e34!))   '@13367
V_0de4! = 1.0   '@1338b DS:0f74
V_0de8! = 1.0   '@1339c DS:0f74
V_0df0! = 1.0   '@133ad DS:0f74
V_0df4! = 1.0   '@133be DS:0f74
OPEN RT_ARQ$(V_0dc4$ + ":" + V_0dc8$ + V_0df8$) FOR INPUT AS #1   '@133cf DS:1032,1634
V_0dd8! = 0.0   '@13407 DS:1048
L_1341e:
V_0dd8! = FX##(V_0dd8!) + 1.0   '@1341e DS:0f74
LINE INPUT #1, A_0dfc$(RT_CINT%(FX##(V_0dd8!)))   '@13434 DS:0f78
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
IF EOF(1) <> -1 THEN GOTO L_1341e   '@1346b
RT_CLOSE   '@1347e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@1348b
V_0dec! = V_0dd8!   '@1349a
LOCATE , 30   '@134ab
PRINT "Ok leitura terminada";   '@134c4 DS:16d2
GOSUB L_10b8a   '@134d2
GOSUB L_11d31   '@134df
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@134ec
' ---- F_134f4 @0x134f4  (0134f4_F_134f4.lift.txt; evidence_id (assembly): ev_22ae88add84b61c27dadfe1c0f13e11387a6e62b09d40f930e65bc4075a4ca4d)
L_134f9:   ' entrada vinda de 011d2c_F_11d2c
RT_CLOSE   '@134fe (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
V_0dc8$ = V_0dd4$   '@1350b
V_0dc4$ = V_0dd0$   '@1351d
RESUME L_13541   '@1352f
L_13541:
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@13546
REDIM A_0dfc$(-32768 TO -32768)   '@13555
REDIM A_0dfc$(0 TO CINT(V_0e34!))   '@13563
V_0df8$ = ""   '@13587 DS:0f78
RT_CLS 2   '@13599
PRINT " Erro na leitura ....";   '@135a7 DS:16ea
CALL MIXT_07f1_LimpaTeclado   '@135b5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
GOSUB L_11d31   '@135bf
GOSUB L_10b8a   '@135cc
V_0e38$ = RT_INPUT$(1)   '@135d9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@135f5
' ---- FUN_1000_3602 @0x13602  (013602_FUN_1000_3602.lift.txt; evidence_id (assembly): ev_615eb2b033d28d1013e1ee977090e5b70705d264bf071451566a93cd43a4b0a8)
L_13602:   ' entrada vinda de 011d2c_F_11d2c
RT_CLS 2   '@13607
IF NOT (LEN(V_0df8$) = 0) THEN GOTO L_1368b   '@13615
CALL MIXT_07f1_LimpaTeclado   '@1362a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " Nome do Arquivo  *RETORNO* ", V_0e38$   '@13634 DS:1704 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e38$) = 0) THEN GOTO L_1366b   '@1364e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@13663
L_1366b:
V_0df8$ = UCASE$(V_0e38$)   '@1366b
GOTO L_1371c   '@13683
L_1368b:
PRINT " Nome do Arquivo  *"; V_0dc4$; ":"; V_0dc8$; V_0df8$; "* ";   '@1368b DS:1032,1724,173c
CALL MIXT_07f1_LimpaTeclado   '@136c6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e38$   '@136d0 DS:0f78 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e38$) > 0) THEN GOTO L_13717   '@136ea
V_0df8$ = UCASE$(V_0e38$)   '@136ff
L_13717:
L_1371c:
GOSUB L_13a28   '@1371c
L_BP0c% = RT_INSTR%((1), (V_0df8$), ("SISTRUT.DSP"))   '@13729 DS:1742
L_BP0e% = RT_INSTR%((1), (V_0df8$), ("SISTRUT.LAP")) + L_BP0c%   '@13750 DS:1752
IF NOT (RT_INSTR%((1), (V_0df8$), ("SISTRUT.PIP")) + L_BP0e% > 0) THEN GOTO L_1382a   '@13769 DS:1762
COLOR 7, 4   '@13778
RT_CLS 2   '@13793
PRINT " As parametrizacoes SISTRUT .DSP .LAP .PIP nao devem ser alteradas";   '@137a1 DS:1772
BEEP   '@137af
CALL MIXT_07f1_LimpaTeclado   '@137b9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@137c3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
PRINT " Salve com OUTRO NOME com a mesma extencao (Veja nota na parametrizacao)";   '@137df DS:17b8
BEEP   '@137ed
CALL MIXT_07f1_LimpaTeclado   '@137f7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@13801
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@1381d
L_1382a:
RT_CLS 2   '@1382a
PRINT " Aguarde ..";   '@13838 DS:16c2
ON ERROR GOTO L_1397d
RT_ONERR = &H1397d   '@13846
IF RT_DISP%(V_0dc4$ + ":" + V_0dc8$ + V_0df8$) THEN OPEN RT_ARQ$(V_0dc4$ + ":" + V_0dc8$ + V_0df8$) FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0dc4$ + ":" + V_0dc8$ + V_0df8$) FOR OUTPUT AS #1   '@13855 DS:1032,1804
V_0e6c! = V_0dec!   '@1388d
FOR V_0dd8! = 1.0 TO V_0e6c!   '@1389f DS:0f74
PRINT #1, A_0dfc$(RT_CINT%(FX##(V_0dd8!)))   '@138a6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
NEXT V_0dd8!   '@138d1 DS:0f74
RT_CLOSE   '@138fa (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@13907
LOCATE , 30   '@13916
PRINT "Ok gravacao terminada";   '@1392f DS:180a
CALL MIXT_07f1_LimpaTeclado   '@1393d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@13947
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
GOSUB L_10b8a   '@13963
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@13970
' ---- F_13978 @0x13978  (013978_F_13978.lift.txt; evidence_id (assembly): ev_6ce34152725c72a3e9fbb17241e77c38b4128633b5e320cf9b7e1b8da6375f57)
L_1397d:   ' entrada vinda de 013602_FUN_1000_3602
RT_CLOSE   '@13982 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
V_0dc8$ = V_0dd4$   '@1398f
V_0dc4$ = V_0dd0$   '@139a1
RESUME L_139c5   '@139b3
L_139c5:
ON ERROR GOTO L_10624
RT_ONERR = &H10624   '@139ca
RT_CLS 2   '@139d9
PRINT " Erro na gravacao ....";   '@139e7 DS:1824
CALL MIXT_07f1_LimpaTeclado   '@139f5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
V_0e38$ = RT_INPUT$(1)   '@139ff
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_12a42   '@13a1b
' ---- F_13a23 @0x13a23  (013a23_F_13a23.lift.txt; evidence_id (assembly): ev_7ac9826c1659fc6eef165dcb64717899de9f80765bb93b21b1428912122e19fc)
L_13a28:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011d2c_F_11d2c, 013602_FUN_1000_3602
IF NOT (INSTR(V_0df8$, ":") > 0) THEN GOTO L_13a88   '@13a2d DS:1032
V_0dc4$ = RT_MID$((V_0df8$), (1), (1))   '@13a46
V_0df8$ = RT_MID2$((V_0df8$), (3))   '@13a63
L_13a88:
IF NOT (INSTR(V_0df8$, "\") > 0) THEN GOTO L_13bdf   '@13a88 DS:0fb8
V_0e38$ = V_0dc8$   '@13aa1
V_0de0! = 1.0   '@13ab3 DS:0f74
IF NOT (INSTR(V_0df8$, "\") = 1) THEN GOTO L_13af0   '@13ac4 DS:0fb8
V_0e38$ = ""   '@13ade DS:0f78
L_13af0:
V_0ddc! = V_0de0!   '@13af0
L_13b06:
V_0dd8! = RT_INSTR%((RT_CINT%(FX##(V_0ddc!) + 1.0)), (V_0df8$), ("\"))   '@13b0b DS:0f74,0fb8
IF NOT (V_0dd8! > 0.0) THEN GOTO L_13b6c   '@13b39 DS:1048
V_0ddc! = V_0dd8!   '@13b54
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_12085, L_10909, L_10934, L_12a42   ' ON KEY no laco (B$EVCK)
GOTO L_13b06   '@13b65
L_13b6c:
V_0dc8$ = V_0e38$ + RT_MID$((V_0df8$), (RT_CINT%(FX##(V_0de0!))), (RT_CINT%(FX##(V_0ddc!) - V_0de0! + 1.0)))   '@13b6c DS:0f74
V_0df8$ = RT_MID2$((V_0df8$), (RT_CINT%(FX##(V_0ddc!) + 1.0)))   '@13bae DS:0f74
L_13bdf:
RETURN   '@13bdf
' @13be9 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_13d44   '@13be9
' ---- FUN_1000_3d44 @0x13d44  (013d44_FUN_1000_3d44.lift.txt; evidence_id (assembly): ev_98769555d00a16669cef8575bb6807b5fc41556e35ee268b5c6e580cbd559a93)
L_13d44:   ' entrada vinda de 013a23_F_13a23
RT_FIM   ' @13d44 B$CENP (inicio/fim do modulo)
'RETRAD? @13d49 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
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
    REDIM A_0dfc$(-32768 TO -32768)
    V_0dc0$ = ""
    V_0dc4$ = ""
    V_0dc8$ = ""
    V_0dcc$ = ""
    V_0dd0$ = ""
    V_0dd4$ = ""
    V_0dd8! = 0
    V_0ddc! = 0
    V_0de0! = 0
    V_0de4! = 0
    V_0de8! = 0
    V_0dec! = 0
    V_0df0! = 0
    V_0df4! = 0
    V_0df8$ = ""
    V_0e2a$ = ""
    V_0e34! = 0
    V_0e38$ = ""
    V_0e3c! = 0
    V_0e40! = 0
    V_0e44! = 0
    V_0e48! = 0
    V_0e4c$ = ""
    V_0e50! = 0
    V_0e54! = 0
    V_0e58! = 0
    V_0e5c! = 0
    V_0e60$ = ""
    V_0e64! = 0
    V_0e68! = 0
    V_0e6c! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_12085: sai da SUB (V_0e50! = 0.0; V_0e54! = 1.0; CALL MIXT_0dbe_GuardaTela(V_0e50!, V_0e54!, V_0dc0)
        CASE 2   ' L_10909: BEEP; GOSUB L_10664; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 3   ' L_10934: sai da SUB (RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; PRINT ""; PRI)
        CASE 4   ' L_12a42: sai da SUB (RT_VIEWPRINT 24, 24; COLOR 7, 0; RT_CLS 2; PRINT "  Ler    Salvar    Deletar Lin)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H105b9: ON ERROR GOTO L_105b9
        CASE &H10624: ON ERROR GOTO L_10624
        CASE &H109e0: ON ERROR GOTO L_109e0
        CASE &H134f9: ON ERROR GOTO L_134f9
        CASE &H1397d: ON ERROR GOTO L_1397d
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_13bf1   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x13bf1)
    DIM L_BP0e$
    ' ---- FUN_1000_3bf1 @0x13bf1  (013bf1_FUN_1000_3bf1.lift.txt; evidence_id (assembly): ev_3c5471f81ac55caadb1efd60f283d4572c645c7b020080999c932598cb3ef04f)
    BEEP   '@13bfe
    BEEP   '@13c08
    BEEP   '@13c12
    RT_VIEWPRINT 1, 25   '@13c1c
    RT_CLOSE   '@13c2e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0e3c!)), RT_CINT%(4.0 * FX##(V_0e40!)), RT_CINT%(4.0 * FX##(V_0e40!))   '@13c3b DS:183e
    RT_CLS 0   '@13c80
    LOCATE 10, 1   '@13c8d
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@13ca8 DS:0f78,1842
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@13cc8 DS:0f78,185c
    PRINT RT_TAB$(24); ""; "Acione <Enter> para Continuar ";   '@13ce8 DS:0f78,1888
    CALL MIXT_07f1_LimpaTeclado   '@13d08
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e$ = RT_INPUT$(1)   '@13d12
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @13d2e libera strings locais (L_BP0e)
    ' END SUB   '@13d3c
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_SISTEMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
