' ============================================================================
'  PIPROEDI - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/PIPROEDI/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: c15f1ec730d524ea1d813c4f8f6298495dea191ef0e9eacf393b55ba2e86208f
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_PILAREDI.BI'

' ---- variaveis do PIPROEDI fora do COMMON (DS do programa)
DIM SHARED V_1484!
DIM SHARED V_1488!
DIM SHARED V_148c!
DIM SHARED V_1490!
DIM SHARED V_1494!
DIM SHARED V_1498!
DIM SHARED V_149c!
DIM SHARED V_14a0!
DIM SHARED V_14a4!
DIM SHARED V_14a8$
DIM SHARED V_14ac!
DIM SHARED V_14b0!
DIM SHARED V_14b4!
DIM SHARED V_14b8!
DIM SHARED V_14bc!
DIM SHARED V_14c0$
DIM SHARED V_14c4!
DIM SHARED V_14c8!
DIM SHARED V_14cc!
DIM SHARED V_14d0!
DIM SHARED V_14d4$
DIM SHARED V_14d8!
DIM SHARED V_14dc!
DIM SHARED V_14e0!
DIM SHARED V_14e4$
DIM SHARED V_14e8!
DIM SHARED V_14ec!
DIM SHARED V_14f0!
DIM SHARED V_14f4!
DIM SHARED V_14f8!
DIM SHARED V_14fc$
DIM SHARED V_1500!
DIM SHARED V_1504!
DIM SHARED V_1508$
DIM SHARED V_150c!
DIM SHARED V_1510!
DIM SHARED V_1514!
DIM SHARED V_1518$
DIM SHARED V_151c!
DIM SHARED V_1520!
DIM SHARED V_1524!
DIM SHARED V_1528!
DIM SHARED V_152c$
DIM SHARED V_1530!
DIM SHARED V_1534!
DIM SHARED V_1538$
DIM SHARED V_153c!
DIM SHARED V_1540$
DIM SHARED V_1544!
DIM SHARED V_1548!
DIM SHARED V_154c!
DIM SHARED V_1550!
DIM SHARED V_1554!
DIM SHARED V_1558!
DIM SHARED V_155c!
DIM SHARED V_1560!
DIM SHARED V_1564!
DIM SHARED V_1568$
DIM SHARED V_156c!
DIM SHARED V_1570!
DIM SHARED V_1574$
DIM SHARED V_1578$
DIM SHARED V_157c!
DIM SHARED V_1580!
DIM SHARED V_1584$
DIM SHARED V_1588$
DIM SHARED V_158c!
DIM SHARED V_1590!
DIM SHARED V_1594$
DIM SHARED V_1598$
DIM SHARED V_159c!
DIM SHARED V_15a0!
DIM SHARED V_15a4$
DIM SHARED V_15a8$
DIM SHARED V_15ac%
DIM SHARED V_15ae%
DIM SHARED V_15b0!
DIM SHARED V_15b4!
DIM SHARED V_15b8!
DIM SHARED V_15bc!
DIM SHARED V_15c0!
DIM SHARED V_15c4!
DIM SHARED V_15c8!
DIM SHARED V_15cc!
DIM SHARED V_15d0!
DIM SHARED V_15d4!
DIM SHARED V_15d8!
DIM SHARED V_15dc!
DIM SHARED V_15e0!
DIM SHARED V_15e4!
DIM SHARED V_15e8!
DIM SHARED V_15ec!
DIM SHARED V_15f0!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "PIPROEDI"
' ---- M_PIPROEDI @0x10030  (010030_M_PIPROEDI.lift.txt; evidence_id (assembly): ev_3a22f8e8a62d8ecf29db2c5026626fd7ce70dd010bab6c86e7adcc7e45bc7814)
' @10030 inicio do programa (B$?EVT)
GOTO L_10198   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10198:
GOSUB L_10201   '@10198
ON ERROR GOTO L_101c1
RT_ONERR = &H101c1   '@101a5
GOTO L_105fe   '@101b4
' ---- F_101bc @0x101bc  (0101bc_F_101bc.lift.txt; evidence_id (assembly): ev_88e40412c8e4e931507e1a4aff23ac8aa215a559278f0704a2d2dc799d858278)
L_101c1:   ' entrada vinda de 010030_M_PIPROEDI
RESUME L_101d8   '@101c6
L_101d8:
GOSUB L_10201   '@101dd
CALL S_1540a   '@101ea
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
GOTO L_105fe   '@101f4
' ---- F_101fc @0x101fc  (0101fc_F_101fc.lift.txt; evidence_id (assembly): ev_5a661eb3e3aaec797f275662afa585e480fab05fc5127c527ce73bd0e86fb307)
L_10201:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_PIPROEDI, 0101bc_F_101bc
FOR V_14a4! = 1.0 TO 10.0   '@10206 DS:174a,174e
ON KEY(RT_CINT%(FX##(V_14a4!))) GOSUB L_104a7
RT_ONKEY RT_CINT%(FX##(V_14a4!)), 1   '@10214
KEY(RT_CINT%(FX##(V_14a4!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a4!)), 1   '@1022e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_14a4!   '@10243 DS:174a,174e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1026c
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10294
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@102bc
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@102e4
FOR V_14a4! = 15.0 TO 18.0   '@1030c DS:174a,1752,1756
ON KEY(RT_CINT%(FX##(V_14a4!))) GOSUB L_104d2
RT_ONKEY RT_CINT%(FX##(V_14a4!)), 2   '@1031a
KEY(RT_CINT%(FX##(V_14a4!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a4!)), 1   '@10334
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_14a4!   '@10349 DS:174a,1756
ON KEY(2) GOSUB L_104d2
RT_ONKEY 2, 2   '@10372
KEY(2) ON
RT_KEYESTADO 2, 1   '@10385
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10393
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@103bb
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@103e3
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1040b
FOR V_14a4! = 19.0 TO 22.0   '@10432 DS:174a,175a,175e
ON KEY(RT_CINT%(FX##(V_14a4!))) GOSUB L_105d0
RT_ONKEY RT_CINT%(FX##(V_14a4!)), 3   '@10440
KEY(RT_CINT%(FX##(V_14a4!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_14a4!)), 1   '@1045a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_14a4!   '@1046f DS:174a,175e
RETURN   '@10498
L_104a7:
BEEP   '@104ac
GOSUB L_10201   '@104b6
RETURN   '@104c3
L_104d2:
RT_SCREEN 0   '@104d7
RT_VIEWPRINT 1, 25   '@104ec
COLOR 7, 0, 0   '@104fe
RT_CLS 0   '@10522
PRINT " Aguarde ..."   '@1052f DS:1762
PRINT ""   '@1053d DS:16f0
PRINT " Retorno ao Modulo Basico de PILAREDI"   '@1054b DS:1772
ON ERROR GOTO L_10597
RT_ONERR = &H10597   '@10559
V_107e$ = "VOLTA PIPROEDI"   '@10568 DS:179c
RT_CHAIN V_0e00$ + "PILAREDI"   '@1057a DS:17ae
L_10597:
PRINT " Modulo nao encontrado em "; V_0e00$   '@1059c DS:17ba
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@105b3 DS:170e
RT_FIM   '@105c1 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_105d0:
BEEP   '@105d5
GOSUB L_10201   '@105df
RETURN L_105fe   '@105f6
' ---- FUN_1000_05fe @0x105fe  (0105fe_FUN_1000_05fe.lift.txt; evidence_id (assembly): ev_b11b9fda7af300eeea54a599e97986dcd34c6246e7f622a76fe689f553121b3e)
L_105fe:   ' entrada vinda de 010030_M_PIPROEDI, 0101bc_F_101bc, 0101fc_F_101fc
RT_VIEWPRINT 1, 25   '@1060d
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1061f
RT_CLS 2   '@1064b
PRINT RT_STRINGC$((80), (205))   '@10659
PRINT " Processamento de Colunas Arquivadas"   '@10671 DS:17d8
PRINT " Posicionadas"; V_11a6%; " Colunas"   '@1067f DS:1800,1812
PRINT RT_STRINGC$((80), (205))   '@1069f
L_106b7:
RT_VIEWPRINT 6, 25   '@106bc
RT_CLS 2   '@106ce
COLOR 7   '@106dc
CALL MIXT_07f1_LimpaTeclado   '@106f2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Processar posicoes I/J/N a M/.../K *RETORNO* ", V_106e$   '@106fc DS:181e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) = 0) THEN GOTO L_10733   '@10716
GOTO L_10cbe   '@1072b
L_10733:
V_14a8$ = UCASE$(V_106e$)   '@10733
V_1016! = 1.0   '@1074b DS:174a
L_10761:
L_BP0c% = (VAL(RT_MID2$((V_14a8$), (RT_CINT%(FX##(V_1016!))))) < 1.0#)   '@10766 DS:1850
IF NOT ((VAL(RT_MID2$((V_14a8$), (RT_CINT%(FX##(V_1016!))))) > V_11a6% OR L_BP0c%) <> 0) THEN GOTO L_107f9   '@107c0
BEEP   '@107e7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_106b7   '@107f1
L_107f9:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("A")) > 0) THEN GOTO L_109c0   '@107f9 DS:1858
L_BP0c% = RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("A"))   '@1081d DS:1858
L_BP0e% = (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("/")) > L_BP0c%)   '@10852 DS:185e
IF NOT ((RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("/")) = 0 OR L_BP0e%) <> 0) THEN GOTO L_109bb   '@10876 DS:185e
L_BP0c% = (VAL(RT_MID2$((V_14a8$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("A")) + 1))) = 0.0#)   '@1088d DS:1858,1864
IF NOT ((VAL(RT_MID2$((V_14a8$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("A")) + 1))) > V_11a6% OR L_BP0c%) <> 0) THEN GOTO L_1093e   '@108fa DS:1858
BEEP   '@1092c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_106b7   '@10936
L_1093e:
IF NOT (VAL(RT_MID2$((V_14a8$), (RT_CINT%(FX##(V_1016!))))) >= VAL(RT_MID2$((V_14a8$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (V_14a8$), ("A")) + 1)))) THEN GOTO L_109b6   '@1093e DS:1858
BEEP   '@109a4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_106b7   '@109ae
L_109b6:
L_109bb:
L_109c0:
V_14ac! = LEN(V_14a8$)   '@109c0
FOR V_100e! = V_1016! TO V_14ac!   '@109db DS:174a
IF NOT (RT_MID$((V_14a8$), (RT_CINT%(FX##(V_100e!))), (1)) = "/") THEN GOTO L_10a2c   '@109e2 DS:185e
V_1016! = FX##(V_100e!) + 1.0   '@10a0e DS:174a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_10761   '@10a24
L_10a2c:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@10a2c DS:174a
LOCATE 9, 1   '@10a55
PRINT " Ajuste a Impressora "   '@10a70 DS:186c
PRINT " Acione <Enter> para seguir ou *<Enter> para anular o avanco do formulario ";   '@10a7e DS:1886
CALL MIXT_07f1_LimpaTeclado   '@10a8c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_106e$   '@10a96 DS:16f0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
V_14b0! = 1.0   '@10ab0 DS:174a
L_10ac6:
V_0fe4! = VAL(RT_MID2$((V_14a8$), (RT_CINT%(FX##(V_14b0!)))))   '@10acb
GOSUB L_10e11   '@10afa
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_14b0!))), (V_14a8$), ("A")) > 0) THEN GOTO L_10c23   '@10b07 DS:1858
L_BP0c% = RT_INSTR%((RT_CINT%(FX##(V_14b0!))), (V_14a8$), ("A"))   '@10b2b DS:1858
L_BP0e% = (RT_INSTR%((RT_CINT%(FX##(V_14b0!))), (V_14a8$), ("/")) > L_BP0c%)   '@10b60 DS:185e
IF NOT ((RT_INSTR%((RT_CINT%(FX##(V_14b0!))), (V_14a8$), ("/")) = 0 OR L_BP0e%) <> 0) THEN GOTO L_10c1e   '@10b84 DS:185e
V_14b4! = VAL(RT_MID2$((V_14a8$), (RT_INSTR%((RT_CINT%(FX##(V_14b0!))), (V_14a8$), ("A")) + 1)))   '@10b9b DS:1858
L_10bde:
V_0fe4! = FX##(V_0fe4!) + 1.0   '@10bde DS:174a
GOSUB L_10e11   '@10bf4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
IF V_0fe4! < V_14b4! THEN GOTO L_10bde   '@10c01
L_10c1e:
L_10c23:
V_14b8! = LEN(V_14a8$)   '@10c23
FOR V_14b4! = V_14b0! TO V_14b8!   '@10c3e DS:174a
IF NOT (RT_MID$((V_14a8$), (RT_CINT%(FX##(V_14b4!))), (1)) = "/") THEN GOTO L_10c90   '@10c46 DS:185e
V_14b0! = FX##(V_14b4!) + 1.0   '@10c72 DS:174a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_10ac6   '@10c88
L_10c90:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_14b4!   '@10c90 DS:174a
L_10cbe:
V_107e$ = "VOLTA PIPROEDI"   '@10cc3 DS:179c
ON ERROR GOTO L_10d4e
RT_ONERR = &H10d4e   '@10cd5
V_1006! = RT_FRE&("")   '@10ce4 DS:16f0
L_BP0c% = (LEN(V_0e00$) > 3)   '@10cfe
CHDIR RT_ARQ$(RT_LEFT$((V_0e00$), (LEN(V_0e00$) + L_BP0c%)))   '@10d1d
RT_CHAIN V_0e00$ + "PILAREDI"   '@10d31 DS:17ae
L_10d4e:
RESUME L_10d65   '@10d53
L_10d65:
L_BP0c% = (V_0e00$ = "A:\")   '@10d6a DS:18d6
IF NOT ((V_0e00$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_10e04   '@10d8f DS:18de
LOCATE 23, 10   '@10da4
PRINT " Coloque o Disco PILAREDI no Drive "; V_0e00$   '@10dc2 DS:18e6
CALL MIXT_07f1_LimpaTeclado   '@10dd9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@10de3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
L_10e04:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_10cbe   '@10e04
' ---- F_10e0c @0x10e0c  (010e0c_F_10e0c.lift.txt; evidence_id (assembly): ev_19f394ea227dfb65834534cf6830bb751c80ae6983ebb8504192ab35e1f8df49)
L_10e11:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0105fe_FUN_1000_05fe
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0) THEN GOTO L_10e4b   '@10e16
RETURN   '@10e41
L_10e4b:
V_0ff8% = 0   '@10e4b
V_0fec! = 0.0   '@10e56 DS:190e
V_14bc! = 0.0   '@10e67 DS:190e
V_0f84! = 0.0   '@10e78 DS:190e
V_1002! = 0.0   '@10e89 DS:190e
V_14c0$ = V_0dcc$   '@10e9a
IF NOT (V_14c0$ = "HER") THEN GOTO L_10edc   '@10eac DS:1912
V_14c4! = 16.19797515869140625##   '@10ec3 DS:191a
GOTO L_10f2f   '@10ed4
L_10edc:
IF NOT (V_14c0$ <> "EGA") THEN GOTO L_10f00   '@10edc DS:191e
IF NOT (V_14c0$ = "VGA") THEN GOTO L_10f19   '@10eee DS:1926
L_10f00:
V_14c4! = 16.19797515869140625##   '@10f00 DS:191a
GOTO L_10f2f   '@10f11
L_10f19:
V_14c4! = 28.3464565277099609375##   '@10f19 DS:192e
L_10f2f:
L_10f34:
IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0) > 0) THEN GOTO L_112af   '@10f39
L_10f6c:
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) <= A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_11283   '@10f71
GOSUB L_13ee3   '@10fc6
V_149c! = A_11c8!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0))   '@10fd3
IF NOT (V_0fec! = 0.0) THEN GOTO L_11073   '@11017 DS:190e
V_14a0! = A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0))   '@11032
GOTO L_110c1   '@1106b
L_11073:
V_14a0! = A_11c8!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0))   '@11073 DS:1932
L_110c1:
V_149c! = FX##(V_149c!) * V_14c4!   '@110c1
V_14a0! = FX##(V_14a0!) * V_14c4!   '@110d7
V_14c8! = (FX##(V_149c!) - V_14a0!) * 0.800000011920928955078125##   '@110ed DS:1936
V_14cc! = 180.0   '@11109 DS:193a
CALL MIXT_0877_Menor(V_14c8!, V_14cc!, V_14d0!)   '@11114
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
V_100e! = FX##(V_14d0!) / V_100a!   '@11126
V_101a! = 300.0 / FX##(V_1006!)   '@11136 DS:193e
IF NOT (FX##(V_101a!) / V_100e! > 1.66600000858306884765625##) THEN GOTO L_1118a   '@1114c DS:1942
V_101a! = V_100e! * 1.66600000858306884765625##   '@1116c DS:1942
GOTO L_111a5   '@11182
L_1118a:
V_100e! = V_101a! / 1.66600000858306884765625##   '@1118a DS:1942
L_111a5:
IF NOT (V_0f84! = 0.0 OR V_100e! < V_1002!) THEN GOTO L_11205   '@111a5 DS:190e
V_0f84! = V_101a!   '@111e3
V_1002! = V_100e!   '@111f4
L_11205:
IF NOT (V_0e3c% > V_0fec!) THEN GOTO L_1127b   '@11205
V_0fec! = FX##(V_0fec!) + 1.0   '@11223 DS:174a
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > 0) THEN GOTO L_11276   '@11239
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_10f6c   '@1126e
L_11276:
L_1127b:
GOTO L_112aa   '@1127b
L_11283:
IF NOT (V_0e3e% > V_0ff8%) THEN GOTO L_112a5   '@11283
V_0ff8% = V_0ff8% + 1   '@11294
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_10f34   '@1129d
L_112a5:
L_112aa:
L_112af:
IF NOT (V_106e$ <> "*") THEN GOTO L_112df   '@112af DS:1946
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@112c6
L_112df:
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@112df
RT_LPTABRE: RT_LPTAB 30: RT_LPS "": RT_LPS "#####################": RT_LPFIM   '@112f2 DS:16f0,194c
RT_LPTABRE: RT_LPTAB RT_CINT%(40.0 - FX##(LEN(V_11be$)) / 2.0): RT_LPS "": RT_LPS V_11be$: RT_LPFIM   '@11317 DS:16f0,1966,196a
RT_LPTABRE: RT_LPTAB RT_CINT%(40.0 - FX##(LEN(A_1252$(RT_CINT%(FX##(V_0fe4!))))) / 2.0): RT_LPS "": RT_LPS A_1252$(RT_CINT%(FX##(V_0fe4!))): RT_LPFIM   '@11359 DS:16f0,1966,196a
RT_LPTABRE: RT_LPTAB 30: RT_LPS "": RT_LPS "#####################": RT_LPFIM   '@113c3 DS:16f0,194c
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@113e8 DS:16f0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@113fb DS:16f0
V_14d4$ = V_0dcc$   '@1140e
IF NOT (V_14d4$ = "HER") THEN GOTO L_114aa   '@11420 DS:1912
RT_SCREEN 3   '@11437
V_0f94! = 7.0   '@1144d DS:196e
V_0f98! = 7.0   '@1145e DS:196e
V_0f9c! = 7.0   '@1146f DS:196e
V_0fa0! = 7.0   '@11480 DS:196e
V_14c4! = 16.19797515869140625##   '@11491 DS:191a
GOTO L_115c4   '@114a2
L_114aa:
IF NOT (V_14d4$ <> "EGA") THEN GOTO L_114ce   '@114aa DS:191e
IF NOT (V_14d4$ = "VGA") THEN GOTO L_11557   '@114bc DS:1926
L_114ce:
RT_SCREEN 9   '@114ce
COLOR , 1   '@114e4
V_0f94! = 11.0   '@114fa DS:1972
V_0f98! = 14.0   '@1150b DS:1976
V_0f9c! = 12.0   '@1151c DS:197a
V_0fa0! = 15.0   '@1152d DS:1752
V_14c4! = 16.19797515869140625##   '@1153e DS:191a
GOTO L_115c4   '@1154f
L_11557:
RT_SCREEN 2   '@11557
V_0f94! = 15.0   '@1156a DS:1752
V_0f98! = 15.0   '@1157b DS:1752
V_0f9c! = 15.0   '@1158c DS:1752
V_0fa0! = 15.0   '@1159d DS:1752
V_14c4! = 28.3464565277099609375##   '@115ae DS:192e
L_115c4:
RT_WINDOW 1, (0), (0), (639), (199)   '@115c4 DS:190e,1910,197e,1980,1982,1984 (B$WIND decodificado)
V_14d8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@115f2
FOR V_101a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) - 1 TO V_14d8! STEP -1.0   '@11621 DS:1932
V_0ff8% = 0   '@11648
L_11658:
IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0) <= V_101a!) THEN GOTO L_116a9   '@1165d
V_0ff8% = V_0ff8% + 1   '@11699
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_11658   '@116a2
L_116a9:
V_0fec! = 0.0   '@116a9 DS:190e
L_116bf:
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) <= V_101a!) THEN GOTO L_11724   '@116c4
V_0fec! = FX##(V_0fec!) + 1.0   '@11707 DS:174a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_116bf   '@1171d
L_11724:
IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) - 1 = V_101a!) THEN GOTO L_118cd   '@11724
RT_CLS -1   '@1175e
RT_LINE 0, 10, 80, 10, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@1176c
V_106e$ = CHR$(25) + " (" + LTRIM$(RT_MID$((STR$(A_11c8!(RT_CINT%(FX##(V_101a!) + 1.0)))), (1), (LEN(STR$(RT_SNG!(INT(FX##(A_11c8!(RT_CINT%(FX##(V_101a!) + 1.0))))))) + 2))) + ") " + A_11f6$(RT_CINT%(FX##(V_101a!) + 1.0))   '@117a1 DS:174a,1986,198c
V_14dc! = 76.0   '@1186f DS:1992
V_14e0! = 10.0   '@11881 DS:174e
V_14e4$ = "CGA"   '@1188c DS:1996
CALL MIXT_08c4_TextoGrafico(V_14dc!, V_14e0!, V_106e$, V_14e4$)   '@11899
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @118ae libera strings locais (V_14e4)
V_148c! = 10.0   '@118b7 DS:174e
L_118cd:
V_1490! = V_148c!   '@118cd
V_1494! = (FX##(A_11c8!(RT_CINT%(FX##(V_101a!) + 1.0))) - A_11c8!(RT_CINT%(FX##(V_101a!)))) * V_14c4! + V_148c!   '@118de DS:174a
V_100e! = 0.0   '@1192f DS:190e
L_11945:
V_1498! = V_1494! - FX##(V_100e!) * 200.0   '@1194a DS:199e
IF NOT (V_1494! - FX##(V_100e!) * 200.0 > FX##(199.0)) THEN GOTO L_119a1   '@11968 DS:1982,199e
V_1498! = 199.0   '@11990 DS:1982
L_119a1:
RT_LINE (24 - (FX##(V_0fec!) / 2.0 = RT_CLNG&(FX##(V_0fec!)) \ 2&) * 24), V_1490!, (24 - (FX##(V_0fec!) / 2.0 = RT_CLNG&(FX##(V_0fec!)) \ 2&) * 24), V_1498!, 9, RT_CINT%(FX##(V_0f98!)), 0   '@119a1 DS:196a
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) <> A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4)) THEN GOTO L_11b9e   '@11a6d
RT_LINE (-((FX##(V_0fec!) / 2.0 = RT_CLNG&(FX##(V_0fec!)) \ 2&) * 12 - 30)), V_1490!, (-((FX##(V_0fec!) / 2.0 = RT_CLNG&(FX##(V_0fec!)) \ 2&) * 12 - 30)), V_1498!, 9, RT_CINT%(FX##(V_0f98!)), 0   '@11acb DS:196a
L_11b9e:
V_14e8! = 0.0   '@11b9e DS:190e
V_14ec! = FX##(V_0fec!) - 1.0   '@11bb0 DS:1932
CALL MIXT_082a_Maior(V_14e8!, V_14ec!, V_14f0!)   '@11bc0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
L_BP0c% = (V_0fec! > 0.0)   '@11bd2 DS:190e
IF NOT ((A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_14f0!)), 0) = V_101a! AND L_BP0c% OR A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) = V_101a! AND V_0fec! = 0.0) <> 0) THEN GOTO L_124a8   '@11c71
IF NOT ((FX##(V_1494!) + V_148c!) / 2.0 - FX##(V_100e!) * 200.0 >= FX##(0.0) AND (FX##(V_1494!) + V_148c!) / 2.0 - FX##(V_100e!) * 200.0 - 1.0 <= FX##(V_1498!)) THEN GOTO L_12496   '@11c8f DS:190e,1932,196a,199e
V_14f4! = (FX##(V_1494!) + V_148c!) / 2.0 - FX##(V_100e!) * 200.0   '@11d00 DS:196a,199e
IF NOT (V_14f4! < 12.0) THEN GOTO L_11d54   '@11d28 DS:197a
V_14f4! = 12.0   '@11d43 DS:197a
L_11d54:
IF NOT (V_14f4! > 186.0) THEN GOTO L_11d80   '@11d54 DS:19a2
V_14f4! = 186.0   '@11d6f DS:19a2
L_11d80:
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4)) THEN GOTO L_11e9e   '@11d80
V_106e$ = STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1)) + " #" + STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2)))   '@11dde DS:19a6
GOTO L_11fc0   '@11e96
L_11e9e:
V_106e$ = STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1)) + " #" + STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2))) + " +" + STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3)) + " #" + STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4)))   '@11e9e DS:19a6,19ac
L_11fc0:
V_14f8! = 110.0   '@11fc0 DS:19b2
V_14fc$ = "CGA"   '@11fd1 DS:1996
CALL MIXT_08c4_TextoGrafico(V_14f8!, V_14f4!, V_106e$, V_14fc$)   '@11fde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @11ff3 libera strings locais (V_14fc)
V_106e$ = " #" + STR$(RT_SNG!(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5)) / 10.0)) + " c/" + STR$(RT_SNG!(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0))   '@11ffc DS:174e,19a6,19b6
V_1500! = 110.0   '@120aa DS:19b2
V_1504! = FX##(V_14f4!) + 8.0   '@120bc DS:19be
V_1508$ = "CGA"   '@120cc DS:1996
CALL MIXT_08c4_TextoGrafico(V_1500!, V_1504!, V_106e$, V_1508$)   '@120d9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @120ee libera strings locais (V_1508)
V_0ff0! = V_101a!   '@120f7
V_11c6% = 0   '@12108
V_150c! = V_100e!   '@12113
GOSUB L_14646   '@12124
V_0f88! = FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 0)   '@12131
V_100e! = V_150c!   '@1216b
V_106e$ = "Nk" + STR$(RT_SNG!(INT(FX##(V_0f88!) + V_10b6!))) + " " + V_0ddc$   '@1217c DS:19c2,19c8
V_1510! = 1.0   '@121c9 DS:174a
V_1514! = FX##(V_14f4!) - 4.0   '@121db DS:19ce
V_1518$ = "CGA"   '@121eb DS:1996
CALL MIXT_08c4_TextoGrafico(V_1510!, V_1514!, V_106e$, V_1518$)   '@121f8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @1220d libera strings locais (V_1518)
GOSUB L_13ee3   '@12216
V_150c! = 0.0   '@12223 DS:190e
V_151c! = A_10ec!(0, 0)   '@12234
FOR V_1520! = 0.0 TO V_151c!   '@12255 DS:174a,190e
V_150c! = FX##(A_0efa!(RT_CINT%(FX##(A_10ec!(RT_CINT%(FX##(V_1520!)), 2))))) + V_150c!   '@1225c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1520!   '@1229f DS:174a
V_106e$ = STR$(V_150c!)   '@122c8
IF NOT (INSTR(V_106e$, ".") > 0) THEN GOTO L_12329   '@122e4 DS:19d2
V_106e$ = RT_MID$((V_106e$), (1), (RT_INSTR%((1), (V_106e$), (".")) + 1))   '@122fd DS:19d2
L_12329:
V_106e$ = "As" + V_106e$ + " cm" + CHR$(253)   '@12329 DS:19d8,19de
V_1524! = 1.0   '@1235f DS:174a
V_1528! = FX##(V_14f4!) + 4.0   '@12371 DS:19e6
V_152c$ = "CGA"   '@12381 DS:1996
CALL MIXT_08c4_TextoGrafico(V_1524!, V_1528!, V_106e$, V_152c$)   '@1238e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @123a3 libera strings locais (V_152c)
V_106e$ = STR$(RT_SNG!(100.0 * FX##(V_150c!) / V_104a!))   '@123ac DS:19ea
IF NOT (INSTR(V_106e$, ".") > 0) THEN GOTO L_1241e   '@123d9 DS:19d2
V_106e$ = RT_MID$((V_106e$), (1), (RT_INSTR%((1), (V_106e$), (".")) + 1))   '@123f2 DS:19d2
L_1241e:
V_106e$ = "Tx" + V_106e$ + "%"   '@1241e DS:19ee,19f4
V_1530! = 1.0   '@12444 DS:174a
V_1534! = FX##(V_14f4!) + 12.0   '@12456 DS:197a
V_1538$ = "CGA"   '@12466 DS:1996
CALL MIXT_08c4_TextoGrafico(V_1530!, V_1534!, V_106e$, V_1538$)   '@12473
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @12488 libera strings locais (V_1538)
L_12496:
GOSUB L_126e3   '@12496
L_124a8:
IF NOT (V_1494! - FX##(V_100e!) * 200.0 > FX##(199.0)) THEN GOTO L_1253f   '@124a8 DS:1982,199e
GOSUB L_126e3   '@124d0
RT_ROTINA_0AEA   '@124dd (rotina em assembly ligada ao EXE (SUB_30aea); gerada no fim do programa)
V_1490! = 0.0   '@124e7 DS:190e
V_100e! = FX##(V_100e!) + 1.0   '@124f8 DS:174a
V_14bc! = FX##(V_14bc!) + 1.0   '@1250e DS:174a
RT_CLS -1   '@12524
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_11945   '@12532
L_1253f:
RT_LINE 0.0, V_1498!, 80.0, V_1498!, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@1253f DS:190e,19fa
V_106e$ = CHR$(25) + " (" + LTRIM$(RT_MID$((STR$(A_11c8!(RT_CINT%(FX##(V_101a!))))), (1), (LEN(STR$(RT_SNG!(INT(FX##(A_11c8!(RT_CINT%(FX##(V_101a!)))))))) + 2))) + ") " + A_11f6$(RT_CINT%(FX##(V_101a!)))   '@12585 DS:1986,198c
V_153c! = 76.0   '@12644 DS:1992
V_1540$ = "CGA"   '@12655 DS:1996
CALL MIXT_08c4_TextoGrafico(V_153c!, V_1498!, V_106e$, V_1540$)   '@12662
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @12677 libera strings locais (V_1540)
V_148c! = V_1494! - FX##(V_100e!) * 200.0   '@12680 DS:199e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_101a!   '@1269e DS:1932
RT_ROTINA_0AEA   '@126ca (rotina em assembly ligada ao EXE (SUB_30aea); gerada no fim do programa)
RETURN   '@126d4
L_126e3:   ' sub-rotina (alvo de GOSUB)
GOSUB L_13ee3   '@126e8
V_149c! = FX##(A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1))) - A_11c8!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0))   '@126f5
IF NOT (V_0fec! = 0.0) THEN GOTO L_127f1   '@12767 DS:190e
V_14a0! = FX##(A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1))) - A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0))   '@12782
GOTO L_1286d   '@127e9
L_127f1:
V_14a0! = FX##(A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1))) - A_11c8!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0))   '@127f1 DS:1932
L_1286d:
V_149c! = FX##(V_149c!) * V_14c4! - FX##(V_14bc!) * 200.0 + 10.0   '@1286d DS:174e,199e
V_14a0! = FX##(V_14a0!) * V_14c4! - FX##(V_14bc!) * 200.0 + 10.0   '@12895 DS:174e,199e
V_1484! = 460.0 - FX##(V_1006!) * V_0f84! / 2.0   '@128bd DS:196a,19fe
V_1488! = (FX##(V_149c!) + V_14a0!) / 2.0 + FX##(V_100a!) * V_1002! / 2.0   '@128e0 DS:196a
IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_12aa8   '@1290d DS:174a,1a02
V_1544! = A_10be!(0, 0)   '@1294b
FOR V_1016! = 1.0 TO V_1544!   '@1296c DS:174a
RT_LINE RT_SNG!(FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) * V_0f84! + V_1484!), RT_SNG!(V_1488! - FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) * V_1002!), RT_SNG!(FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) * V_0f84! + V_1484!), RT_SNG!(V_1488! - FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) * V_1002!), 9, RT_CINT%(FX##(V_0f94!)), 0   '@12974 DS:174a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1016!   '@12a74 DS:174a
GOTO L_12bd4   '@12aa0
L_12aa8:
' @12aa8 CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!(FX##(A_10be!(1, 0)) * V_0f84! / 2.0), 1032, RT_CINT%(FX##(V_0f94!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@12aec DS:196a
IF NOT (A_10be!(1, 1) > 0.0) THEN GOTO L_12bcf   '@12b27 DS:190e
' @12b52 CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!(FX##(A_10be!(1, 1)) * V_0f84! / 2.0), 1032, RT_CINT%(FX##(V_0f94!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@12b96 DS:196a
L_12bcf:
L_12bd4:
IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_12fc6   '@12bd4 DS:174a,1a02
V_1016! = 0.0   '@12c12 DS:190e
L_12c28:
V_0fa4! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 0)   '@12c28
V_0fa8! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 1)   '@12c61
V_1548! = FX##(A_10be!(0, 0)) + 1.0   '@12c9b DS:174a
FOR V_101e! = 1.0 TO V_1548!   '@12cc1 DS:174a
V_154c! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@12cc8
V_1550! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@12cf3
V_1554! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@12d19 DS:174a
V_1558! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)   '@12d43 DS:174a
V_155c! = FX##(V_0e8e!) - V_1016!   '@12d6e
CALL S_15587(V_0fa4!, V_0fa8!, V_154c!, V_1550!, V_1554!, V_1558!, V_155c!)   '@12d7e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1) = V_1558!   '@12da0 DS:174a
A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = V_1554!   '@12dcb DS:174a
A_10be!(RT_CINT%(FX##(V_101e!)), 1) = V_1550!   '@12df5
A_10be!(RT_CINT%(FX##(V_101e!)), 0) = V_154c!   '@12e1b
IF NOT (V_101e! = 1.0) THEN GOTO L_12eb1   '@12e3f DS:174a
RT_PSET RT_SNG!(FX##(V_1006!) * V_0f84! + V_1484!), RT_SNG!(V_1488! - FX##(V_100a!) * V_1002!), 0, 0   '@12e5a
GOTO L_12f0c   '@12ea9
L_12eb1:
RT_LINE 0, 0, RT_SNG!(FX##(V_1006!) * V_0f84! + V_1484!), RT_SNG!(V_1488! - FX##(V_100a!) * V_1002!), 8, RT_CINT%(FX##(V_0f98!)), 0   '@12eb1
L_12f0c:
V_0fa4! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@12f0c
V_0fa8! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@12f36
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@12f61 DS:174a
V_1016! = V_1016! + 0.62999999523162841796875##   '@12f8d DS:1a0a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
IF NOT (V_1016! >= 1.0) THEN GOTO L_12c28   '@12fa3 DS:174a
GOTO L_131e4   '@12fbe
L_12fc6:
' @12fc6 CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!((FX##(A_10be!(1, 0)) / 2.0 - V_0e8e!) * V_0f84!), 1032, RT_CINT%(FX##(V_0f98!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@1300a DS:196a
' @1304a CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!((FX##(A_10be!(1, 0)) / 2.0 - V_0e8e! + 0.62999999523162841796875##) * V_0f84!), 1032, RT_CINT%(FX##(V_0f98!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@1308e DS:196a,1a0a
IF NOT (V_0fc0! > 0.0) THEN GOTO L_131df   '@130d3 DS:190e
' @130ee CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!((FX##(V_0fc0!) / 2.0 + V_0e8e!) * V_0f84!), 1032, RT_CINT%(FX##(V_0f98!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@13133 DS:196a
' @13160 CIRCLE aspecto 16.438356 / V_14c4!   ' DS:196a,19fe,1a06
RT_CIRCLE 460.0, RT_SNG!((FX##(V_149c!) + V_14a0!) / 2.0), RT_SNG!((FX##(V_0fc0!) / 2.0 + (V_0e8e! - 0.62999999523162841796875##)) * V_0f84!), 1032, RT_CINT%(FX##(V_0f98!)), 0, 0, RT_SNG!(16.4383563995361328125## / V_14c4!)   '@131a5 DS:196a,1a0e
L_131df:
L_131e4:
V_1560! = A_10ec!(0, 0)   '@131e4
FOR V_1016! = 1.0 TO V_1560!   '@13205 DS:174a
V_1006! = FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 0)) * V_0f84! + V_1484!   '@1320c
V_100a! = V_1488! - FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 1)) * V_1002!   '@13240
RT_CIRCLE V_1006!, V_100a!, RT_SNG!(FX##(A_0ecc!(RT_CINT%(FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 2))))) * V_0f84! / 20.0), 8, RT_CINT%(FX##(V_0f9c!)), 0, 0, 0   '@13278 DS:1a12
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1016!   '@132e8 DS:174a
IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_13bdd   '@13314 DS:174a,1a02
V_1564! = A_10be!(0, 0)   '@13352
FOR V_1016! = 1.0 TO V_1564!   '@13373 DS:174a
V_106e$ = LTRIM$(STR$(RT_SNG!(INT(RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0))) * 10.0 + 0.00999999977648258209228515625##) / 10.0)))   '@1337a DS:174a,174e,196a,1a16
V_1006! = FX##(V_1484!) + 4.0 + (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) + A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) * V_0f84! / 2.0   '@13456 DS:174a,196a,19e6
IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1) AND A_10be!(RT_CINT%(FX##(V_1016!)), 0) <= A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) THEN GOTO L_13597   '@134ba DS:174a
V_1006! = FX##(V_1006!) - LEN(V_106e$) * 8 - 8.0   '@1356a DS:1a1a
L_13597:
IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1) AND A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) THEN GOTO L_13674   '@13597 DS:174a
V_1006! = FX##(V_1006!) - LEN(V_106e$) * 8 - 8.0   '@13647 DS:1a1a
L_13674:
V_100a! = V_1488! - (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) + A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) * V_1002! / 2.0   '@13674 DS:174a,196a
IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0) AND A_10be!(RT_CINT%(FX##(V_1016!)), 1) >= A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) THEN GOTO L_1379b   '@136d5 DS:174a
V_100a! = FX##(V_100a!) + 10.0   '@13785 DS:174e
L_1379b:
IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0) AND A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) THEN GOTO L_13861   '@1379b DS:174a
V_100a! = FX##(V_100a!) + 10.0   '@1384b DS:174e
L_13861:
IF NOT (V_102e! = 3.0 AND V_1016! > 1.0) THEN GOTO L_13b6f   '@13861 DS:174a,1a02
IF NOT (ABS(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) - 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) + (RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) - 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0)))) < 0.100000001490116119384765625##) THEN GOTO L_13b6a   '@1389f DS:174a,1932,196a,1a1e
IF NOT (ABS(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)), (2.0)) + (RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 2.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 2.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)), (2.0)))) < 0.100000001490116119384765625##) THEN GOTO L_13b65   '@139f9 DS:174a,196a,1a1e
GOTO L_13ba4   '@13b5d
L_13b65:
L_13b6a:
L_13b6f:
V_1568$ = "CGA"   '@13b6f DS:1996
CALL MIXT_08c4_TextoGrafico(V_1006!, V_100a!, V_106e$, V_1568$)   '@13b81
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @13b96 libera strings locais (V_1568)
L_13ba4:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1016!   '@13ba9 DS:174a
GOTO L_13ed4   '@13bd5
L_13bdd:
V_156c! = 452.0 - FX##(A_10be!(1, 0)) * V_0f84! / 2.0   '@13bdd DS:196a,1a22
V_1570! = (FX##(V_149c!) + V_14a0!) / 2.0 + 4.0   '@13c13 DS:196a,19e6
V_1574$ = CHR$(26)   '@13c2d
V_1578$ = "CGA"   '@13c40 DS:1996
CALL MIXT_08c4_TextoGrafico(V_156c!, V_1570!, V_1574$, V_1578$)   '@13c4d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @13c62 libera strings locais (V_1574)
' @13c6b libera strings locais (V_1578)
V_157c! = FX##(A_10be!(1, 0)) * V_0f84! / 2.0 + 460.0   '@13c74 DS:196a,19fe
V_1580! = (FX##(V_149c!) + V_14a0!) / 2.0 + 4.0   '@13ca7 DS:196a,19e6
V_1584$ = CHR$(27) + STR$(A_10be!(1, 0))   '@13cc1
V_1588$ = "CGA"   '@13cfa DS:1996
CALL MIXT_08c4_TextoGrafico(V_157c!, V_1580!, V_1584$, V_1588$)   '@13d07
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @13d1c libera strings locais (V_1584)
' @13d25 libera strings locais (V_1588)
IF NOT (A_10be!(1, 1) > 0.0) THEN GOTO L_13e12   '@13d2e DS:190e
V_158c! = 460.0 - FX##(A_10be!(1, 1)) * V_0f84! / 2.0   '@13d59 DS:196a,19fe
V_1590! = (FX##(V_149c!) + V_14a0!) / 2.0 + 4.0   '@13d8d DS:196a,19e6
V_1594$ = CHR$(27) + STR$(A_10be!(1, 1))   '@13da7
V_1598$ = "CGA"   '@13dde DS:1996
CALL MIXT_08c4_TextoGrafico(V_158c!, V_1590!, V_1594$, V_1598$)   '@13deb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @13e00 libera strings locais (V_1594)
' @13e09 libera strings locais (V_1598)
L_13e12:
IF NOT (A_10be!(1, 1) > 0.0) THEN GOTO L_13ecf   '@13e12 DS:190e
V_159c! = FX##(A_10be!(1, 1)) * V_0f84! / 2.0 + 452.0   '@13e3d DS:196a,1a22
V_15a0! = (FX##(V_149c!) + V_14a0!) / 2.0 + 4.0   '@13e6e DS:196a,19e6
V_15a4$ = CHR$(26)   '@13e88
V_15a8$ = "CGA"   '@13e9b DS:1996
CALL MIXT_08c4_TextoGrafico(V_159c!, V_15a0!, V_15a4$, V_15a8$)   '@13ea8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
' @13ebd libera strings locais (V_15a4)
' @13ec6 libera strings locais (V_15a8)
L_13ecf:
L_13ed4:
RETURN   '@13ed4
L_13ee3:   ' sub-rotina (alvo de GOSUB)
REDIM A_10ec!(-32768 TO -32768, -32768 TO -32768)   '@13ee8
REDIM A_10ec!(0 TO CINT(V_0e30!), 0 TO 2)   '@13ef6
L_13f26:   ' sub-rotina (alvo de GOSUB)
REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@13f2b
REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@13f39
REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@13f42
REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@13f6d
V_15ac% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6)   '@13f98
IF NOT (V_15ac% = 1) THEN GOTO L_14080   '@13fc2
V_102e! = 1.0   '@13fd1 DS:174a
V_0fb8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@13fe2
V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@14015
V_106a! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 3)   '@14048
GOTO L_142b0   '@14078
L_14080:
IF NOT (V_15ac% = 2) THEN GOTO L_1411a   '@14080
V_102e! = 2.0   '@1408a DS:196a
V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@1409b
V_0fc0! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@140ce
V_106a! = 0.0   '@14101 DS:190e
GOTO L_142b0   '@14112
L_1411a:
IF NOT (V_15ac% = 3) THEN GOTO L_142b0   '@1411a
V_102e! = 3.0   '@14124 DS:1a02
V_15ae% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@14135
A_10be!(0, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@1415f
V_106a! = 0.0   '@141a1 DS:190e
V_15b0! = A_10be!(0, 0)   '@141b2
FOR V_1012! = 0.0 TO V_15b0!   '@141d3 DS:174a,190e
A_10be!(RT_CINT%(FX##(V_1012!)), 0) = FX##(A_1366%(V_15ae%, RT_CINT%(FX##(V_1012!)), 0)) / 10.0   '@141da DS:174e
A_10be!(RT_CINT%(FX##(V_1012!)), 1) = FX##(A_1366%(V_15ae%, RT_CINT%(FX##(V_1012!)), 1)) / 10.0   '@1422a DS:174e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1012!   '@1427c DS:174a
GOTO L_142b0   '@142a8
L_142b0:
IF NOT (V_106e$ = "SOSECAO") THEN GOTO L_142d1   '@142b0 DS:1a26
RETURN   '@142c7
L_142d1:
GOSUB L_14b86   '@142d1
A_10ec!(0, 0) = FX##(A_13f0%(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7), 0)) / 10.0   '@142de DS:174e
V_15b4! = A_10ec!(0, 0)   '@1433e
FOR V_1520! = 0.0 TO V_15b4!   '@1435f DS:174a,190e
FOR V_1016! = 0.0 TO 2.0   '@14366 DS:174a,190e,196a
A_10ec!(RT_CINT%(FX##(V_1520!)), RT_CINT%(FX##(V_1016!))) = FX##(A_13f0%(RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7)) + V_1520!), RT_CINT%(FX##(V_1016!)))) / 10.0   '@14374 DS:174e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1016!   '@143fe DS:174a,196a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1520!   '@1442a DS:174a
IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_145ec   '@14456 DS:174a,1a02
V_1006! = 0.0   '@14494 DS:190e
V_100a! = 0.0   '@144a5 DS:190e
V_15b8! = A_10be!(0, 0)   '@144b6
FOR V_1016! = 1.0 TO V_15b8!   '@144d7 DS:174a
V_15bc! = A_10be!(RT_CINT%(FX##(V_1016!)), 1)   '@144de
CALL MIXT_082a_Maior(V_100a!, V_15bc!, V_15c0!)   '@14509
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
A_10be!(RT_CINT%(FX##(V_1016!)), 1) = V_15bc!   '@1451b
V_100a! = V_15c0!   '@14541
V_15c4! = A_10be!(RT_CINT%(FX##(V_1016!)), 0)   '@1454c
CALL MIXT_082a_Maior(V_1006!, V_15c4!, V_15c8!)   '@14576
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
A_10be!(RT_CINT%(FX##(V_1016!)), 0) = V_15c4!   '@14588
V_1006! = V_15c8!   '@145ad
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1016!   '@145b8 DS:174a
GOTO L_14637   '@145e4
L_145ec:
V_100a! = A_10be!(1, 0)   '@145ec
V_1006! = A_10be!(1, 0)   '@1460f
L_14637:
RETURN   '@14637
L_14646:   ' sub-rotina (alvo de GOSUB)
V_0f88! = 0.0   '@1464b DS:190e
V_10b6! = 0.0   '@1465c DS:190e
V_101e! = -1.0   '@1466d DS:1932
V_15cc! = V_0ff0!   '@1467e
FOR V_1520! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO V_15cc! STEP -1.0   '@14690 DS:1932
V_0f88! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1520!)), 0)) + V_0f88!   '@146b6
IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) > 0) THEN GOTO L_14975   '@146f0
V_0ff8% = 0   '@1471b
L_1472b:
IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0) < A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) AND A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0) <= V_1520!) THEN GOTO L_147d6   '@14730
V_0ff8% = V_0ff8% + 1   '@147c5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
GOTO L_1472b   '@147ce
L_147d6:
IF NOT (V_0ff8% <> V_101e!) THEN GOTO L_14858   '@147d6
V_106e$ = "SOSECAO"   '@147f4 DS:1a26
GOSUB L_13f26   '@14806
V_106e$ = ""   '@14813 DS:16f0
GOSUB L_14b86   '@14825
GOSUB L_149b0   '@14832
V_101e! = V_0ff8%   '@1483f
L_14858:
V_15d0! = FX##(V_1520!) + 1.0   '@14858 DS:174a
IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) < V_15d0!) THEN GOTO L_148d6   '@1486e
V_15d0! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@148a7
L_148d6:
IF NOT (V_0ea8$ = "S") THEN GOTO L_14970   '@148d6 DS:1a32
V_10b6! = (FX##(A_11c8!(RT_CINT%(FX##(V_15d0!)))) - A_11c8!(RT_CINT%(FX##(V_1520!)))) / (RT_POT##((FX##(100.0)), (2.0)) * RT_POT##((FX##(V_0de4!)), (3.0)) * V_0de8!) * V_104a! * V_0eac! + V_10b6!   '@148ed DS:196a,19ea,1a02
L_14970:
L_14975:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1520!   '@14975 DS:1932
RETURN   '@149a1
L_149b0:   ' sub-rotina (alvo de GOSUB)
IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_14afa   '@149b5 DS:174a,1a02
V_104a! = 0.0   '@149f3 DS:190e
V_15d4! = A_10be!(0, 0)   '@14a04
FOR V_1006! = 1.0 TO V_15d4!   '@14a25 DS:174a
V_104a! = (FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 0)) + A_10be!(RT_CINT%(FX##(V_1006!) + 1.0), 0)) * (FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 1)) - A_10be!(RT_CINT%(FX##(V_1006!) + 1.0), 1)) / 2.0 + V_104a!   '@14a2c DS:174a,196a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1006!   '@14ac9 DS:174a
L_14afa:
IF NOT (V_102e! = 2.0) THEN GOTO L_14b77   '@14afa DS:196a
V_104a! = (RT_POT##((FX##(A_10be!(1, 0))), (2.0)) - RT_POT##((FX##(A_10be!(1, 1))), (2.0))) * V_0e5a! / 4.0   '@14b15 DS:196a,19e6
L_14b77:
RETURN   '@14b77
L_14b86:   ' sub-rotina (alvo de GOSUB)
IF NOT (V_102e! = 1.0) THEN GOTO L_1520d   '@14b8b DS:174a
A_10be!(0, 0) = 4.0   '@14ba6 DS:19e6
A_10be!(1, 0) = 0.0   '@14bc6 DS:190e
A_10be!(1, 1) = 0.0   '@14be9 DS:190e
A_10be!(2, 0) = 0.0   '@14c0a DS:190e
A_10be!(2, 1) = ABS(FX##(V_0fbc!))   '@14c2d
A_10be!(3, 0) = ABS(FX##(V_0fb8!))   '@14c54
A_10be!(3, 1) = ABS(FX##(V_0fbc!))   '@14c7a
A_10be!(4, 0) = ABS(FX##(V_0fb8!))   '@14ca1
A_10be!(4, 1) = 0.0   '@14cc7 DS:190e
A_10be!(5, 0) = 0.0   '@14ceb DS:190e
A_10be!(5, 1) = 0.0   '@14d0e DS:190e
A_10be!(6, 0) = 0.0   '@14d32 DS:190e
A_10be!(6, 1) = ABS(FX##(V_0fbc!))   '@14d55
V_15d8! = FX##(A_10be!(0, 0)) + 1.0   '@14d7c DS:174a
FOR V_1006! = 1.0 TO V_15d8!   '@14da2 DS:174a
A_111a!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0) - RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@14daa DS:193a
A_111a!(RT_CINT%(FX##(V_1006!)), 1) = RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0) + RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@14e3b DS:193a
A_10be!(RT_CINT%(FX##(V_1006!)), 0) = A_111a!(RT_CINT%(FX##(V_1006!)), 0)   '@14ecd
A_10be!(RT_CINT%(FX##(V_1006!)), 1) = A_111a!(RT_CINT%(FX##(V_1006!)), 1)   '@14f10
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1006!   '@14f55 DS:174a
V_15dc! = A_10be!(0, 0)   '@14f81
FOR V_1006! = 1.0 TO V_15dc!   '@14fa2 DS:174a
IF NOT (V_1006! = 1.0) THEN GOTO L_15011   '@14faa DS:174a
V_103a! = A_10be!(1, 0)   '@14fc5
V_103e! = A_10be!(1, 1)   '@14fe8
GOTO L_150f0   '@15009
L_15011:
V_15e0! = A_10be!(RT_CINT%(FX##(V_1006!)), 0)   '@15011
CALL MIXT_0877_Menor(V_103a!, V_15e0!, V_15e4!)   '@1503b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
A_10be!(RT_CINT%(FX##(V_1006!)), 0) = V_15e0!   '@1504d
V_103a! = V_15e4!   '@15072
V_15e8! = A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@1507d
CALL MIXT_0877_Menor(V_103e!, V_15e8!, V_15ec!)   '@150a8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY pelo roteiro (entre comandos)
A_10be!(RT_CINT%(FX##(V_1006!)), 1) = V_15e8!   '@150ba
V_103e! = V_15ec!   '@150e0
L_150f0:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1006!   '@150f0 DS:174a
V_15f0! = FX##(A_10be!(0, 0)) + 1.0   '@1511c DS:174a
FOR V_1006! = 1.0 TO V_15f0!   '@15142 DS:174a
A_10be!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@1514a
A_10be!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@15192
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104a7, L_104d2, L_105d0   ' ON KEY no laco (B$EVCK)
NEXT V_1006!   '@151dc DS:174a
L_1520d:
IF NOT (V_102e! = 2.0) THEN GOTO L_15297   '@1520d DS:196a
A_10be!(0, 0) = 1.0   '@15228 DS:174a
A_10be!(1, 0) = ABS(FX##(V_0fbc!))   '@15248
A_10be!(1, 1) = ABS(FX##(V_0fc0!))   '@1526e
L_15297:
IF NOT (V_102e! = 3.0) THEN GOTO L_153f8   '@15297 DS:1a02
A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 0) = A_10be!(1, 0)   '@152b2 DS:174a
A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 1) = A_10be!(1, 1)   '@15302 DS:174a
A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 2.0), 0) = A_10be!(2, 0)   '@15351 DS:196a
A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 2.0), 1) = A_10be!(2, 1)   '@153a1 DS:196a
L_153f8:
RETURN   '@153f8
' @15402 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_1557f   '@15402
' ---- FUN_1000_557f @0x1557f  (01557f_FUN_1000_557f.lift.txt; evidence_id (assembly): ev_44960569533cae73dda9691a3e190176430330a1cc7a7b1864c63a99d29505b8)
L_1557f:   ' entrada vinda de 010e0c_F_10e0c
GOTO L_16327   '@1557f
' ---- F_16327 @0x16327  (016327_F_16327.lift.txt; evidence_id (assembly): ev_ec2abc4410c9277b466ac8579095ff6b5e443f0f29040c8c006efe319eee1621)
L_16327:   ' entrada vinda de 01557f_FUN_1000_557f
RT_FIM   ' @16327 B$CENP (inicio/fim do modulo)
'RETRAD? @1632c ?? 38 bytes sem caminho de entrada conhecido (dados/lixo, 19 instr.): MOV BH, 0x6; MOV CX, 0xb; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x30aea (chamada por CALL SUB_30aea no lift).
' Versao A; DS do original: inicio DS:1B62, CR LF DS:1B5C, fim DS:1B5F, margem em [DS:1E53], ESC L em [DS:1B5A].
SUB RT_ROTINA_0AEA
    SELECT CASE RT_MODO
        CASE 9
            RT_COPIA_TELA "A", 640, 344, 0, "               ", CHR$(27) + "L" + CHR$(128) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE 3
            RT_COPIA_TELA "A", 720, 344, 0, "        ", CHR$(27) + "L" + CHR$(208) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
        CASE ELSE
            RT_COPIA_TELA "A", 640, 200, 0, "               ", CHR$(27) + "L" + CHR$(128) + CHR$(2), CHR$(27) + "3" + CHR$(24), CHR$(13) + CHR$(10), CHR$(27) + "2"
    END SELECT
END SUB

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    V_1484! = 0
    V_1488! = 0
    V_148c! = 0
    V_1490! = 0
    V_1494! = 0
    V_1498! = 0
    V_149c! = 0
    V_14a0! = 0
    V_14a4! = 0
    V_14a8$ = ""
    V_14ac! = 0
    V_14b0! = 0
    V_14b4! = 0
    V_14b8! = 0
    V_14bc! = 0
    V_14c0$ = ""
    V_14c4! = 0
    V_14c8! = 0
    V_14cc! = 0
    V_14d0! = 0
    V_14d4$ = ""
    V_14d8! = 0
    V_14dc! = 0
    V_14e0! = 0
    V_14e4$ = ""
    V_14e8! = 0
    V_14ec! = 0
    V_14f0! = 0
    V_14f4! = 0
    V_14f8! = 0
    V_14fc$ = ""
    V_1500! = 0
    V_1504! = 0
    V_1508$ = ""
    V_150c! = 0
    V_1510! = 0
    V_1514! = 0
    V_1518$ = ""
    V_151c! = 0
    V_1520! = 0
    V_1524! = 0
    V_1528! = 0
    V_152c$ = ""
    V_1530! = 0
    V_1534! = 0
    V_1538$ = ""
    V_153c! = 0
    V_1540$ = ""
    V_1544! = 0
    V_1548! = 0
    V_154c! = 0
    V_1550! = 0
    V_1554! = 0
    V_1558! = 0
    V_155c! = 0
    V_1560! = 0
    V_1564! = 0
    V_1568$ = ""
    V_156c! = 0
    V_1570! = 0
    V_1574$ = ""
    V_1578$ = ""
    V_157c! = 0
    V_1580! = 0
    V_1584$ = ""
    V_1588$ = ""
    V_158c! = 0
    V_1590! = 0
    V_1594$ = ""
    V_1598$ = ""
    V_159c! = 0
    V_15a0! = 0
    V_15a4$ = ""
    V_15a8$ = ""
    V_15ac% = 0
    V_15ae% = 0
    V_15b0! = 0
    V_15b4! = 0
    V_15b8! = 0
    V_15bc! = 0
    V_15c0! = 0
    V_15c4! = 0
    V_15c8! = 0
    V_15cc! = 0
    V_15d0! = 0
    V_15d4! = 0
    V_15d8! = 0
    V_15dc! = 0
    V_15e0! = 0
    V_15e4! = 0
    V_15e8! = 0
    V_15ec! = 0
    V_15f0! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_104a7: BEEP; GOSUB L_10201; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_104d2: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_105d0: sai da SUB (BEEP; GOSUB L_10201; RETURN L_105fe)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H101c1: ON ERROR GOTO L_101c1
        CASE &H10597: ON ERROR GOTO L_10597
        CASE &H10d4e: ON ERROR GOTO L_10d4e
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_1540a   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1540a)
    ' ---- FUN_1000_540a @0x1540a  (01540a_FUN_1000_540a.lift.txt; evidence_id (assembly): ev_17174816e7c2ce60a6f2b1bd63d8f3b53930614eabdab7fd33224d3242986586)
    BEEP   '@15412
    BEEP   '@1541c
    BEEP   '@15426
    RT_SCREEN 0   '@15430
    RT_VIEWPRINT 1, 25   '@15445
    RT_CLOSE   '@15457 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@15464 DS:19e6
    RT_CLS 0   '@154a9
    LOCATE 10, 1   '@154b6
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@154d1 DS:16f0,1a38
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@154f1 DS:16f0,1a52
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@15511 DS:16f0,1a7e
L_15536:
    CALL MIXT_07f1_LimpaTeclado   '@1553b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@15545
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@15561
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15536   '@1556b
    ' ---- F_15572 @0x15572  (015572_F_15572.lift.txt; evidence_id (assembly): ev_68a3a2f7949910dba36339efb44f875951458a4b7e0d7f2f9e9560c69ae9b070)
    ' END SUB   '@15572
END SUB

SUB S_15587 (P_BP12!, P_BP10!, P_BP0e!, P_BP0c!, P_BP0a!, P_BP08!, P_BP06!)   ' entrada de SUB/FUNCTION (B$ENRA, locais 60 bytes) (0x15587)
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
    ' ---- FUN_1000_5587 @0x15587  (015587_FUN_1000_5587.lift.txt; evidence_id (assembly): ev_43aec314e383e2d392eb4f30479e4893162ab74cbca6f37d99523cd055b25a51)
    IF NOT (P_BP10! >= P_BP0c! AND P_BP12! > P_BP0e!) THEN GOTO L_158e7   '@1558f
    L_BP0e! = ATN((FX##(P_BP10!) - P_BP0c!) / (FX##(P_BP12!) - P_BP0e!))   '@155d1
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_156fd   '@155fe
    IF NOT ((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!) > (FX##(P_BP10!) - P_BP0c!) / (FX##(P_BP12!) - P_BP0e!)) THEN GOTO L_156b9   '@15640
    L_BP12! = ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@15684
    GOTO L_156f8   '@156b1
L_156b9:
    L_BP12! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@156b9 DS:196a
L_156f8:
L_156fd:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_157b3   '@156fd
    IF NOT (P_BP0e! = P_BP0a!) THEN GOTO L_15779   '@1573f
    L_BP12! = FX##(V_0e5a!) / 2.0   '@1575c DS:196a
    GOTO L_157ae   '@15771
L_15779:
    L_BP12! = V_0e5a! - ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0e!) - P_BP0a!))   '@15779
L_157ae:
L_157b3:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_15827   '@157b3
    L_BP12! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@157f5
L_15827:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_158e2   '@15827
    IF NOT (P_BP0a! = P_BP0e!) THEN GOTO L_158a3   '@15869
    L_BP12! = 1.5 * FX##(V_0e5a!)   '@15886 DS:1aa4
    GOTO L_158dd   '@1589b
L_158a3:
    L_BP12! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@158a3 DS:196a
L_158dd:
L_158e2:
L_158e7:
    IF NOT (P_BP10! > P_BP0c! AND P_BP12! <= P_BP0e!) THEN GOTO L_15c60   '@158e7
    L_BP0e! = FX##(V_0e5a!) / 2.0 + ATN((FX##(P_BP0e!) - P_BP12!) / (FX##(P_BP10!) - P_BP0c!))   '@15929 DS:196a
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_15ab0   '@15963
    L_BP16! = 0.0000999999974737875163555145263671875##   '@159a5 DS:1aa8
    L_BP1a! = FX##(P_BP0e!) - P_BP0a!   '@159b5
    CALL MIXT_082a_Maior(L_BP16!, L_BP1a!, L_BP1e!)   '@159c7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP22! = 0.0000999999974737875163555145263671875##   '@159d9 DS:1aa8
    L_BP26! = FX##(P_BP0e!) - P_BP12!   '@159e3
    CALL MIXT_082a_Maior(L_BP22!, L_BP26!, L_BP2a!)   '@159f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(P_BP08!) - P_BP0c!) / L_BP1e! < (FX##(P_BP10!) - P_BP0c!) / L_BP2a!) THEN GOTO L_15a6c   '@15a06
    L_BP12! = V_0e5a! - ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0e!) - P_BP0a!))   '@15a2f
    GOTO L_15aab   '@15a64
L_15a6c:
    L_BP12! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@15a6c DS:1aac
L_15aab:
L_15ab0:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_15b24   '@15ab0
    L_BP12! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@15af2
L_15b24:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_15bdf   '@15b24
    IF NOT (P_BP0a! = P_BP0e!) THEN GOTO L_15ba0   '@15b66
    L_BP12! = 1.5 * FX##(V_0e5a!)   '@15b83 DS:1aa4
    GOTO L_15bda   '@15b98
L_15ba0:
    L_BP12! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@15ba0 DS:196a
L_15bda:
L_15bdf:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_15c5b   '@15bdf
    L_BP12! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@15c21 DS:196a
L_15c5b:
L_15c60:
    IF NOT (P_BP10! <= P_BP0c! AND P_BP12! < P_BP0e!) THEN GOTO L_15f51   '@15c60
    L_BP0e! = ATN((FX##(P_BP0c!) - P_BP10!) / (FX##(P_BP0e!) - P_BP12!)) + V_0e5a!   '@15ca2
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_15dd8   '@15cd4
    IF NOT ((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!) > (FX##(P_BP0c!) - P_BP10!) / (FX##(P_BP0e!) - P_BP12!)) THEN GOTO L_15d94   '@15d16
    L_BP12! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@15d5a
    GOTO L_15dd3   '@15d8c
L_15d94:
    L_BP12! = 3.0 * FX##(V_0e5a!) + ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!))   '@15d94 DS:1a02
L_15dd3:
L_15dd8:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_15e54   '@15dd8
    L_BP12! = 1.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0a!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP08!))   '@15e1a DS:1aa4
L_15e54:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_15ed0   '@15e54
    L_BP12! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@15e96 DS:196a
L_15ed0:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_15f4c   '@15ed0
    L_BP12! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@15f12 DS:1aac
L_15f4c:
L_15f51:
    IF NOT (P_BP10! < P_BP0c! AND P_BP12! >= P_BP0e!) THEN GOTO L_16298   '@15f51
    L_BP0e! = 1.5 * FX##(V_0e5a!) + ATN((FX##(P_BP12!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP10!))   '@15f93 DS:1aa4
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_1611f   '@15fcd
    L_BP2e! = 0.0000999999974737875163555145263671875##   '@1600f DS:1aa8
    L_BP32! = FX##(P_BP0a!) - P_BP0e!   '@1601f
    CALL MIXT_082a_Maior(L_BP2e!, L_BP32!, L_BP36!)   '@16031
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3a! = 0.0000999999974737875163555145263671875##   '@16043 DS:1aa8
    L_BP3e! = FX##(P_BP12!) - P_BP0e!   '@1604d
    CALL MIXT_082a_Maior(L_BP3a!, L_BP3e!, L_BP42!)   '@1605f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(P_BP0c!) - P_BP08!) / L_BP36! < (FX##(P_BP0c!) - P_BP10!) / L_BP42!) THEN GOTO L_160db   '@16070
    L_BP12! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@16099 DS:196a
    GOTO L_1611a   '@160d3
L_160db:
    L_BP12! = 3.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0a!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP08!))   '@160db DS:1ab0
L_1611a:
L_1611f:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_1619b   '@1611f
    L_BP12! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@16161 DS:196a
L_1619b:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_16217   '@1619b
    L_BP12! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@161dd DS:1aac
L_16217:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_16293   '@16217
    L_BP12! = 3.0 * FX##(V_0e5a!) + ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!))   '@16259 DS:1a02
L_16293:
L_16298:
    L_BP46! = (FX##(L_BP0e!) + L_BP12!) / 2.0   '@16298 DS:196a
    V_1006! = RT_COS##(FX##(L_BP46!)) / RT_SIN##(FX##(L_BP46!) - L_BP0e!) * P_BP06! + P_BP0e!   '@162b0
    V_100a! = RT_SIN##(FX##(L_BP46!)) / RT_SIN##(FX##(L_BP46!) - L_BP0e!) * P_BP06! + P_BP0c!   '@162e5
    ' END SUB   '@1631a
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_PILAREDI.BM'
'$INCLUDE: '../comum/MIXT.BM'
