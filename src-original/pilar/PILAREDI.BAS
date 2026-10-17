' ============================================================================
'  PILAREDI - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/PILAREDI/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: b2f7cebe0120ee8ee55b8adaabaf53b886489e5503154e747205505b3de8d85d
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_PILAREDI.BI'

' ---- variaveis do PILAREDI fora do COMMON (DS do programa)
REDIM SHARED A_165a!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1484!
DIM SHARED V_1488$
DIM SHARED V_148c!
DIM SHARED V_1490!
DIM SHARED V_1494!
DIM SHARED V_1498!
DIM SHARED V_149c%
DIM SHARED V_149e$
DIM SHARED V_14a2$
DIM SHARED V_14a6$
DIM SHARED V_14aa!
DIM SHARED V_14ae#
DIM SHARED V_14c2%
DIM SHARED V_15d2!
DIM SHARED V_15d6!
DIM SHARED V_15da!
DIM SHARED V_15de!
DIM SHARED V_15e2!
DIM SHARED V_15e6!
DIM SHARED V_15ea$
DIM SHARED V_15ee!
DIM SHARED V_15f2!
DIM SHARED V_15f6!
DIM SHARED V_15fa!
DIM SHARED V_15fe!
DIM SHARED V_1602!
DIM SHARED V_1606!
DIM SHARED V_160a!
DIM SHARED V_160e!
DIM SHARED V_1612!
DIM SHARED V_1616!
DIM SHARED V_161a!
DIM SHARED V_161e!
DIM SHARED V_1622!
DIM SHARED V_1626!
DIM SHARED V_162a!
DIM SHARED V_162e!
DIM SHARED V_1632!
DIM SHARED V_1636!
DIM SHARED V_163a!
DIM SHARED V_163e!
DIM SHARED V_1642!
DIM SHARED V_1646!
DIM SHARED V_164a!
DIM SHARED V_164e!
DIM SHARED V_1652!
DIM SHARED V_1656!
DIM SHARED V_1688$
DIM SHARED V_168c$

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "PILAREDI"
' ---- M_PILAREDI @0x10030  (010030_M_PILAREDI.lift.txt; evidence_id (assembly): ev_0fde641094ab8e9f471428b1a296700cbb2b64b6c8001ad4558b1b6d30d71ed3)
' @10030 inicio do programa (B$?EVT)
V_0e3e% = 3   '@10143
GOTO L_1019e   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_1019e:
L_BP0c% = (V_107e$ = "VOLTA PILGEEDI")   '@1019e DS:16fa
L_BP0e% = V_107e$ = "VOLTA PIGRAEDI" OR L_BP0c%   '@101c3 DS:170c
IF NOT ((V_107e$ = "VOLTA PIPROEDI" OR L_BP0e%) <> 0) THEN GOTO L_10248   '@101de DS:171e
V_1006! = RT_FRE&("")   '@101f3 DS:16a0
V_107e$ = ""   '@1020d DS:16a0
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@1021f
GOSUB L_10406   '@1022e
GOTO L_108aa   '@1023b
L_10248:
GOSUB L_10406   '@10248
ON ERROR GOTO L_1028a
RT_ONERR = &H1028a   '@10255
CALL S_23c9a   '@10264
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@1026e
GOTO L_108aa   '@1027d
' ---- F_10285 @0x10285  (010285_F_10285.lift.txt; evidence_id (assembly): ev_77d450e74b7cb69e46210433ade3ad4516e20fc7398c7e86c976263083e7993c)
L_1028a:   ' entrada vinda de 010030_M_PILAREDI
RESUME L_102a1   '@1028f
L_102a1:
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@102a6
LOCATE 10, 1   '@102b5
COLOR RT_CINT%(FX##(V_0dc0!))   '@102d0
BEEP   '@102ed
IF NOT (V_106e$ = "NOME") THEN GOTO L_1033f   '@102f7 DS:1730
PRINT " Arquivo parametrizacao "; V_0e18$; V_0e14$; ".PIP   nao encontrado"   '@1030e DS:1738,1754
GOTO L_10369   '@10337
L_1033f:
PRINT " Erro no Arquivo parametrizacao"   '@1033f DS:176e
PRINT " ultimo dado lido "; V_106e$   '@1034d DS:1792
L_10369:
V_0e14$ = "SISTRUT"   '@10369 DS:17a8
CALL S_23c9a   '@1037b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
PRINT " Sera adotada a parametrizacao SISTRUT ";   '@10385 DS:17b4
CALL MIXT_07f1_LimpaTeclado   '@10393
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@1039d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
GOTO L_108aa   '@103b9
' ---- F_103c1 @0x103c1  (0103c1_F_103c1.lift.txt; evidence_id (assembly): ev_1fc658b0e84ae5f850d83177dbfe4612e33479e6d0a8fdeaece9d09eae7fdb0d)
L_103c6:   ' entrada vinda de 010030_M_PILAREDI, 010285_F_10285, 0108aa_FUN_1000_08aa, 0119ba_F_119ba
RESUME L_103dd   '@103cb
L_103dd:
GOSUB L_10406   '@103e2
CALL S_153de   '@103ef
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
GOTO L_108aa   '@103f9
' ---- F_10401 @0x10401  (010401_F_10401.lift.txt; evidence_id (assembly): ev_e7d565d2a58a90736a6830cd19815f8f31d6e993a61253a084d6fce5d65e12dc)
L_10406:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_PILAREDI, 0103c1_F_103c1
FOR V_1484! = 1.0 TO 10.0   '@1040b DS:17e0,17e4
ON KEY(RT_CINT%(FX##(V_1484!))) GOSUB L_106ab
RT_ONKEY RT_CINT%(FX##(V_1484!)), 1   '@10418
KEY(RT_CINT%(FX##(V_1484!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1484!)), 1   '@10432
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_1484!   '@10447 DS:17e0,17e4
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@10470
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10498
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@104c0
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@104e8
FOR V_1484! = 15.0 TO 18.0   '@10510 DS:17e0,17e8,17ec
ON KEY(RT_CINT%(FX##(V_1484!))) GOSUB L_106d6
RT_ONKEY RT_CINT%(FX##(V_1484!)), 2   '@1051e
KEY(RT_CINT%(FX##(V_1484!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1484!)), 1   '@10538
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_1484!   '@1054d DS:17e0,17ec
ON KEY(2) GOSUB L_106d6
RT_ONKEY 2, 2   '@10576
KEY(2) ON
RT_KEYESTADO 2, 1   '@10589
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10597
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@105bf
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@105e7
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1060f
FOR V_1484! = 19.0 TO 22.0   '@10636 DS:17e0,17f0,17f4
ON KEY(RT_CINT%(FX##(V_1484!))) GOSUB L_1087c
RT_ONKEY RT_CINT%(FX##(V_1484!)), 3   '@10644
KEY(RT_CINT%(FX##(V_1484!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1484!)), 1   '@1065e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_1484!   '@10673 DS:17e0,17f4
RETURN   '@1069c
L_106ab:
BEEP   '@106b0
GOSUB L_10406   '@106ba
RETURN   '@106c7
L_106d6:
RT_SCREEN 0   '@106db
RT_VIEWPRINT 1, 25   '@106f0
COLOR 7, 0, 0   '@10702
RT_CLS 0   '@10726
PRINT " Aguarde ..."   '@10733 DS:17f8
PRINT ""   '@10741 DS:16a0
PRINT " Retorno ao Modulo Basico de PILAR"   '@1074f DS:1808
REDIM A_11c8!(-32768 TO -32768)   '@1075d
REDIM A_11f6$(-32768 TO -32768)   '@1076b
REDIM A_1224%(-32768 TO -32768, -32768 TO -32768)   '@10774
REDIM A_1252$(-32768 TO -32768)   '@1077d
REDIM A_1280!(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@10786
REDIM A_12ae$(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@1078f
REDIM A_12dc!(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@10798
REDIM A_1338%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@107a1
REDIM A_130a%(-32768 TO -32768, -32768 TO -32768)   '@107af
REDIM A_1366%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@107b8
REDIM A_1394%(-32768 TO -32768)   '@107c1
REDIM A_13c2%(-32768 TO -32768)   '@107ca
REDIM A_13f0%(-32768 TO -32768, -32768 TO -32768)   '@107d3
REDIM A_141e%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@107dc
REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@107e5
REDIM A_10ec!(-32768 TO -32768, -32768 TO -32768)   '@107f3
REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@107fc
REDIM A_1148!(-32768 TO -32768, -32768 TO -32768)   '@10805
REDIM A_1176!(-32768 TO -32768, -32768 TO -32768)   '@1080e
ON ERROR GOTO L_10843
RT_ONERR = &H10843   '@10817
RT_CHAIN V_0e00$ + "PILAR"   '@10826 DS:182e
L_10843:
PRINT " Modulo nao encontrado em "; V_0e00$   '@10848 DS:1838
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@1085f DS:16be
RT_FIM   '@1086d (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_1087c:
BEEP   '@10881
GOSUB L_10406   '@1088b
RETURN L_108aa   '@108a2
' ---- FUN_1000_08aa @0x108aa  (0108aa_FUN_1000_08aa.lift.txt; evidence_id (assembly): ev_b53461f5174840d5040b10180979abef7a36b6206732fba53f3cb7afd2d94268)
L_108aa:   ' entrada vinda de 010030_M_PILAREDI, 010285_F_10285, 0103c1_F_103c1, 010401_F_10401, 0119ba_F_119ba, 013521_F_13521
RT_SCREEN 0   '@108af
RT_VIEWPRINT 1, 25   '@108c4
COLOR 7, RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@108d6
RT_CLS 0   '@1090a
RT_CLOSE   '@10917 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@10924
COLOR 11   '@10933
PRINT RT_STRINGC$((80), (219));   '@10949
PRINT "   PILARES DE CONCRETO ARMADO - CALCULO DE EDIFICIOS DE MULTIPLOS ANDARES"   '@10961 DS:1856
PRINT "   OpenStrut  eng. reversa independente do"   '@1096f DS:18a4
PRINT "   SISTRUT 4.0 (1991), sem vinculo oficial"   '@1097d DS:18d2
PRINT "   Versao 4.0   "; V_0e8a$   '@1098b DS:1900
PRINT RT_STRINGC$((80), (219));   '@109a2
COLOR 7   '@109ba
LOCATE 8, 20   '@109d0
PRINT "1  -  ";   '@109ee DS:1914
COLOR RT_CINT%(FX##(V_0dc4!))   '@109fc
PRINT "M";   '@10a19 DS:191e
COLOR 7   '@10a27
PRINT "ateriais, Concreto Aco"   '@10a3d DS:1924
LOCATE 10, 20   '@10a4b
PRINT "2  -  ";   '@10a69 DS:193e
COLOR RT_CINT%(FX##(V_0dc4!))   '@10a77
PRINT "A";   '@10a94 DS:1948
COLOR 7   '@10aa2
PRINT "rquivar dados de Colunas"   '@10ab8 DS:194e
LOCATE 12, 20   '@10ac6
PRINT "3  -  ";   '@10ae4 DS:196a
COLOR RT_CINT%(FX##(V_0dc4!))   '@10af2
PRINT "S";   '@10b0f DS:1974
COLOR 7   '@10b1d
PRINT "ecoes / Dimensionamento"   '@10b33 DS:197a
LOCATE 14, 20   '@10b41
PRINT "4  -  "; "";   '@10b5f DS:16a0,1996
COLOR RT_CINT%(FX##(V_0dc4!))   '@10b76
PRINT "P";   '@10b93 DS:19a0
COLOR 7   '@10ba1
PRINT "rocessar / Detalhar Colunas"   '@10bb7 DS:19a6
LOCATE 16, 20   '@10bc5
PRINT "5  -  ";   '@10be3 DS:19c6
COLOR RT_CINT%(FX##(V_0dc4!))   '@10bf1
PRINT "L";   '@10c0e DS:19d0
COLOR 7   '@10c1c
PRINT "ista das Colunas Arquivadas"   '@10c32 DS:19d6
LOCATE 18, 20   '@10c40
PRINT "6  -  "; "";   '@10c5e DS:16a0,19f6
COLOR RT_CINT%(FX##(V_0dc4!))   '@10c75
PRINT "G";   '@10c92 DS:1a00
COLOR 7   '@10ca0
PRINT "ravacao e Leitura"   '@10cb6 DS:1a06
LOCATE 20, 20   '@10cc4
PRINT "7  -  ";   '@10ce2 DS:1a1c
COLOR RT_CINT%(FX##(V_0dc4!))   '@10cf0
PRINT "V";   '@10d0d DS:1a26
COLOR 7   '@10d1b
PRINT "isualizar e Alterar Parametrizacoes"   '@10d31 DS:1a2c
LOCATE 24, 50   '@10d3f
COLOR RT_CINT%(FX##(V_0dc0!)), 3   '@10d5d
PRINT " <F2> = Retorno "   '@10d82 DS:1a54
L_10d95:
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@10d9a
LOCATE 22, 20   '@10dc6
PRINT "escolha opcao ";   '@10de4 DS:1a68
CALL MIXT_07f1_LimpaTeclado   '@10df2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@10dfc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_1006! = RT_FRE&("")   '@10e18 DS:16a0
COLOR 7   '@10e32
V_1488$ = V_106e$   '@10e48
IF NOT (V_1488$ <> "1") THEN GOTO L_10e95   '@10e5a DS:1a7a
IF NOT (V_1488$ <> "M") THEN GOTO L_10e95   '@10e71 DS:191e
IF NOT (V_1488$ = "m") THEN GOTO L_10ea5   '@10e83 DS:1a80
L_10e95:
GOTO L_110b2   '@10e95
L_10ea5:
IF NOT (V_1488$ <> "2") THEN GOTO L_10edb   '@10ea5 DS:1a86
IF NOT (V_1488$ <> "A") THEN GOTO L_10edb   '@10eb7 DS:1948
IF NOT (V_1488$ = "a") THEN GOTO L_10efd   '@10ec9 DS:1a8c
L_10edb:
V_106e$ = "PILGEEDI"   '@10edb DS:1a92
GOTO L_11726   '@10eed
L_10efd:
IF NOT (V_1488$ <> "3") THEN GOTO L_10f33   '@10efd DS:1a9e
IF NOT (V_1488$ <> "S") THEN GOTO L_10f33   '@10f0f DS:1974
IF NOT (V_1488$ = "s") THEN GOTO L_10f43   '@10f21 DS:1aa4
L_10f33:
GOTO L_135d2   '@10f33
L_10f43:
IF NOT (V_1488$ <> "4") THEN GOTO L_10f79   '@10f43 DS:1aaa
IF NOT (V_1488$ <> "P") THEN GOTO L_10f79   '@10f55 DS:19a0
IF NOT (V_1488$ = "p") THEN GOTO L_10fb2   '@10f67 DS:1ab0
L_10f79:
IF NOT (V_11a6% = 0) THEN GOTO L_10f90   '@10f79
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@10f88
L_10f90:
V_106e$ = "PIPROEDI"   '@10f90 DS:1ab6
GOTO L_11726   '@10fa2
L_10fb2:
IF NOT (V_1488$ <> "5") THEN GOTO L_10fe8   '@10fb2 DS:1ac2
IF NOT (V_1488$ <> "L") THEN GOTO L_10fe8   '@10fc4 DS:19d0
IF NOT (V_1488$ = "l") THEN GOTO L_10ff8   '@10fd6 DS:1ac8
L_10fe8:
GOTO L_118ca   '@10fe8
L_10ff8:
IF NOT (V_1488$ <> "6") THEN GOTO L_1102e   '@10ff8 DS:1ace
IF NOT (V_1488$ <> "G") THEN GOTO L_1102e   '@1100a DS:1a00
IF NOT (V_1488$ = "g") THEN GOTO L_11050   '@1101c DS:1ad4
L_1102e:
V_106e$ = "PIGRAEDI"   '@1102e DS:1ada
GOTO L_11726   '@11040
L_11050:
IF NOT (V_1488$ <> "7") THEN GOTO L_11086   '@11050 DS:1ae6
IF NOT (V_1488$ <> "V") THEN GOTO L_11086   '@11062 DS:1a26
IF NOT (V_1488$ = "v") THEN GOTO L_11096   '@11074 DS:1aec
L_11086:
GOTO L_12a25   '@11086
L_11096:
BEEP   '@11096
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_10d95   '@110a0
L_110b2:
RT_VIEWPRINT 1, 25   '@110b7
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@110c9
RT_CLS 2   '@110f5
PRINT RT_STRINGC$((80), (205))   '@11103
PRINT " Definicao dos Materiais e unidades de trabalho"   '@1111b DS:1af2
PRINT RT_STRINGC$((80), (205))   '@11129
L_11146:
COLOR 7   '@1114b
LOCATE 6, 1   '@11161
PRINT " Concreto Fck *";   '@1117c DS:1b26
COLOR RT_CINT%(FX##(V_0dc0!))   '@1118a
PRINT LTRIM$(STR$(V_0e66!));   '@111a7
COLOR 7   '@111c5
PRINT "* "; V_0de0$;   '@111db DS:1b3a
CALL MIXT_07f1_LimpaTeclado   '@111f2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_106e$   '@111fc DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_114ba   '@11216
IF NOT (VAL(V_106e$) <= 0.0#) THEN GOTO L_11261   '@1122b DS:1b46
BEEP   '@1124f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_11146   '@11259
L_11261:
V_0e66! = VAL(V_106e$)   '@11261
L_11280:
LOCATE 9, 1   '@11285
PRINT "  Unidade de grandeza para os valores caracteristicos do Concreto e Aco"   '@112a0 DS:1b4e
PRINT "  *";   '@112ae DS:1b9a
COLOR RT_CINT%(FX##(V_0dc0!))   '@112bc
PRINT V_0de0$;   '@112d9
COLOR 7   '@112e7
CALL MIXT_07f1_LimpaTeclado   '@112fd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_106e$   '@11307 DS:1b3a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_11383   '@11321
IF NOT (VAL(V_106e$) <> 0.0#) THEN GOTO L_1136c   '@11336 DS:1b46
BEEP   '@1135a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_11280   '@11364
L_1136c:
V_0de0$ = V_106e$   '@1136c
L_11383:
L_11388:
LOCATE 12, 1   '@1138d
PRINT "  Multiplicador de ("; V_0de0$; ") para transformar em Tonelada/Centimetro2"   '@113a8 DS:1ba2,1bba
PRINT "  *";   '@113c8 DS:1b9a
COLOR RT_CINT%(FX##(V_0dc0!))   '@113d6
PRINT LTRIM$(STR$(V_0dec!));   '@113f3
COLOR 7   '@11411
CALL MIXT_07f1_LimpaTeclado   '@11427
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_106e$   '@11431 DS:1b3a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_114b5   '@1144b
IF NOT (VAL(V_106e$) <= 0.0#) THEN GOTO L_11496   '@11460 DS:1b46
BEEP   '@11484
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_11388   '@1148e
L_11496:
V_0dec! = VAL(V_106e$)   '@11496
L_114b5:
L_114ba:
L_114bf:
LOCATE 7, 1   '@114c4
PRINT " Aco      Fyk *";   '@114df DS:1be8
COLOR RT_CINT%(FX##(V_0dc0!))   '@114ed
PRINT LTRIM$(STR$(V_0e6a!));   '@1150a
COLOR 7   '@11528
PRINT "* "; V_0de0$;   '@1153e DS:1b3a
CALL MIXT_07f1_LimpaTeclado   '@11555
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_106e$   '@1155f DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) <> 0) THEN GOTO L_115e3   '@11579
IF NOT (VAL(V_106e$) <= 0.0#) THEN GOTO L_115c4   '@1158e DS:1b46
BEEP   '@115b2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_114bf   '@115bc
L_115c4:
V_0e6a! = VAL(V_106e$)   '@115c4
L_115e3:
L_115e8:
LOCATE 7, 45   '@115ed
PRINT " Tipo de Aco  A/B *";   '@1160b DS:1bfc
COLOR RT_CINT%(FX##(V_0dc0!))   '@11619
PRINT V_0e7e$;   '@11636
COLOR 7   '@11644
CALL MIXT_07f1_LimpaTeclado   '@1165a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_106e$   '@11664 DS:1b3a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_11708   '@1167e
L_BP0c% = (UCASE$(V_106e$) <> "A")   '@11693 DS:1948
IF NOT ((UCASE$(V_106e$) <> "B" AND L_BP0c%) <> 0) THEN GOTO L_116eb   '@116ba DS:1c14
BEEP   '@116d9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_115e8   '@116e3
L_116eb:
V_0e7e$ = UCASE$(V_106e$)   '@116eb
L_11708:
V_1026! = 1.0   '@11708 DS:17e0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@11719
L_11726:
V_1002! = 0.0   '@1172b DS:1c1a
L_11741:
ON ERROR GOTO L_117bf
RT_ONERR = &H117bf   '@11746
V_1006! = RT_FRE&("")   '@11755 DS:16a0
L_BP0c% = (LEN(V_0e00$) > 3)   '@1176f
CHDIR RT_ARQ$(RT_LEFT$((V_0e00$), (LEN(V_0e00$) + L_BP0c%)))   '@1178e
RT_CHAIN V_0e00$ + V_106e$   '@117a2
L_117bf:
RESUME L_117d6   '@117c4
L_117d6:
L_BP0c% = (V_0e00$ = "A:\")   '@117db DS:1c1e
IF NOT ((V_0e00$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_11884   '@11800 DS:1c26
LOCATE 23, 1   '@11815
PRINT " Coloque o disco "; V_106e$; " no Drive "; V_0e00$   '@11830 DS:1c2e,1c44
CALL MIXT_07f1_LimpaTeclado   '@11859
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@11863
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
L_11884:
V_1002! = FX##(V_1002!) + 1.0   '@11884 DS:17e0
IF NOT (V_1002! = 4.0) THEN GOTO L_118bd   '@1189a DS:1c52
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@118b5
L_118bd:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_11741   '@118bd
L_118ca:
IF NOT (V_11a6% = 0) THEN GOTO L_118e6   '@118cf
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@118de
L_118e6:
RT_VIEWPRINT 1, 25   '@118e6
RT_CLS 2   '@118f8
V_1016! = 1.0   '@11906 DS:17e0
L_1191c:
V_101a! = FX##(V_1016!) + 16.0   '@11921 DS:1c56
IF NOT (V_11a6% < V_101a!) THEN GOTO L_11969   '@11937
V_101a! = V_11a6%   '@11955
L_11969:
GOSUB L_119bf   '@11969
IF NOT (V_11a6% = V_101a!) THEN GOTO L_1199c   '@11976
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@11994
L_1199c:
V_1016! = FX##(V_101a!) + 1.0   '@1199c DS:17e0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_1191c   '@119b2
' ---- F_119ba @0x119ba  (0119ba_F_119ba.lift.txt; evidence_id (assembly): ev_7fb80fb04bda80ce224d337a94f466daa2bda732e3b7bec295a56746f581071c)
L_119bf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0108aa_FUN_1000_08aa
COLOR 7   '@119c4
RT_CLS 2   '@119da
PRINT RT_STRINGC$((80), (205))   '@119e8
PRINT " Lista das Colunas arquivadas            Obra "; V_11be$   '@11a00 DS:1c5a
PRINT "   Coluna      inicio         termino        Carga   Secao     Armadura"   '@11a17 DS:1c8c
PRINT RT_STRINGC$((80), (205))   '@11a25
COLOR RT_CINT%(FX##(V_0dc0!))   '@11a3d
V_148c! = V_101a!   '@11a5a
FOR V_100e! = V_1016! TO V_148c!   '@11a6c DS:17e0
V_1072$ = ""   '@11a74 DS:16a0
V_1076$ = ""   '@11a86 DS:16a0
V_107a$ = ""   '@11a98 DS:16a0
V_107e$ = ""   '@11aaa DS:16a0
V_0f88! = 0.0   '@11abc DS:1c1a
V_106e$ = " ## \      \\ \ \        \ \ \ \         \######.##  \      \ \                \"   '@11acd DS:1cd8
IF NOT (V_11a8% > 0) THEN GOTO L_11baa   '@11adf
V_1490! = A_1224%(RT_CINT%(FX##(V_100e!)), 1)   '@11aee
FOR V_101e! = A_1224%(RT_CINT%(FX##(V_100e!)), 0) TO V_1490!   '@11b1e DS:17e0
V_0f88! = FX##(A_1280!(RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_101e!)), 0)) + V_0f88!   '@11b42
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@11b7c DS:17e0
L_11baa:
IF NOT (V_11aa% = 1) THEN GOTO L_12089   '@11baa
V_1494! = A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 0)) - INT(FX##(A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 0))) / 10.0) * 10.0 + 1.0   '@11bb9 DS:17e0,17e4
V_107a$ = CHR$((V_1494! = 4.0) * 4 + ((V_1494! = 3.0) * 3 + (V_1494! = 2.0) * 18 - (V_1494! = 6.0) * 10 - (V_1494! = 5.0) * 12) + 197)   '@11c50 DS:1c52,1d2c,1d30,1d34,1d38
V_1498! = INT(FX##(A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 0))) / 10.0) / 10.0 + 1.0   '@11cff DS:17e0,17e4
V_107a$ = V_107a$ + " " + CHR$((V_1498! = 4.0) * 4 + ((V_1498! = 3.0) * 3 + (V_1498! = 2.0) * 18 - (V_1498! = 6.0) * 10 - (V_1498! = 5.0) * 12) + 197)   '@11d5a DS:1b40,1c52,1d2c,1d30,1d34,1d38
V_1494! = A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 1)) - INT(FX##(A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 1))) / 10.0) * 10.0 + 1.0   '@11e1d DS:17e0,17e4
V_107e$ = CHR$((V_1494! = 4.0) * 4 + ((V_1494! = 3.0) * 3 + (V_1494! = 2.0) * 18 - (V_1494! = 6.0) * 10 - (V_1494! = 5.0) * 12) + 197)   '@11eb6 DS:1c52,1d2c,1d30,1d34,1d38
V_1498! = INT(FX##(A_130a%(RT_CINT%(FX##(V_100e!)), A_1224%(RT_CINT%(FX##(V_100e!)), 1))) / 10.0) / 10.0 + 1.0   '@11f65 DS:17e0,17e4
V_107e$ = V_107e$ + " " + CHR$((V_1498! = 4.0) * 4 + ((V_1498! = 3.0) * 3 + (V_1498! = 2.0) * 18 - (V_1498! = 6.0) * 10 - (V_1498! = 5.0) * 12) + 197)   '@11fc1 DS:1b40,1c52,1d2c,1d30,1d34,1d38
L_12089:
IF NOT (V_11ac% = 1) THEN GOTO L_12221   '@12089
IF NOT (A_1338%(RT_CINT%(FX##(V_100e!)), 0, 0) > 0) THEN GOTO L_1221c   '@12098
V_101e! = 0.0   '@120c3 DS:1c1a
L_120d9:
V_149c% = A_1338%(RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_101e!)), 6)   '@120de
IF NOT (V_149c% = 1) THEN GOTO L_12142   '@1210f
V_1072$ = V_1072$ + "R "   '@1211e DS:1d3c
GOTO L_1219e   '@1213a
L_12142:
IF NOT (V_149c% = 2) THEN GOTO L_12170   '@12142
V_1072$ = V_1072$ + "C "   '@1214c DS:1d42
GOTO L_1219e   '@12168
L_12170:
IF NOT (V_149c% = 3) THEN GOTO L_1219e   '@12170
V_1072$ = V_1072$ + "P "   '@1217a DS:1d48
GOTO L_1219e   '@12196
L_1219e:
IF NOT (A_1338%(RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_101e!)), 0) < A_1224%(RT_CINT%(FX##(V_100e!)), 1)) THEN GOTO L_12217   '@1219e
V_101e! = FX##(V_101e!) + 1.0   '@121f4 DS:17e0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_120d9   '@1220a
L_12217:
L_1221c:
L_12221:
IF NOT (V_11c4% = 1) THEN GOTO L_12474   '@12221
IF NOT (A_141e%(RT_CINT%(FX##(V_100e!)), 0, 0) > 0) THEN GOTO L_1246f   '@12230
V_1076$ = LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 1))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 2)))) + "+" + LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 3))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 4))))   '@1225b DS:1d4e,1d54
IF NOT (A_141e%(RT_CINT%(FX##(V_100e!)), 0, 2) = A_141e%(RT_CINT%(FX##(V_100e!)), 0, 4)) THEN GOTO L_1246a   '@12370
V_1076$ = LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 3) + A_141e%(RT_CINT%(FX##(V_100e!)), 0, 1))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_100e!)), 0, 2))))   '@123be DS:1d4e
L_1246a:
L_1246f:
L_12474:
PRINT USING V_106e$; RT_PU#(V_100e!, V_106e$, 1); A_1252$(RT_CINT%(FX##(V_100e!))); V_107a$; A_11f6$(A_1224%(RT_CINT%(FX##(V_100e!)), 0)); V_107e$; A_11f6$(A_1224%(RT_CINT%(FX##(V_100e!)), 1)); RT_PU#(V_0f88!, V_106e$, 2); V_1072$; V_1076$   '@12474
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@1253c DS:17e0
PRINT ""   '@12568 DS:16a0
COLOR 7   '@12576
PRINT " Qualquer Tecla para Continuar ";   '@1258c DS:1d5a
CALL MIXT_07f1_LimpaTeclado   '@1259a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@125a4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@125c0
L_125cf:   ' sub-rotina (alvo de GOSUB)
RT_VIEWPRINT 22, 25   '@125d4
RT_CLS 2   '@125e6
COLOR 7   '@125f4
PRINT " Drive que contem o Disco de Dados ";   '@1260a DS:1d7e
COLOR RT_CINT%(FX##(V_0dc0!))   '@12618
PRINT "*"; RT_MID$((V_0df8$), (1), (1)); "*";   '@12635 DS:1da6
CALL MIXT_07f1_LimpaTeclado   '@12660
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_106e$   '@1266a DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_126b1   '@12684
V_0df8$ = UCASE$(V_106e$)   '@12699
L_126b1:
COLOR 3   '@126b1
PRINT " [";   '@126c7 DS:1dac
COLOR 7   '@126d5
PRINT "\Diretorio\Subdiretorio\...\";   '@126eb DS:1db2
COLOR 3   '@126f9
PRINT "]";   '@1270f DS:1dd2
COLOR 7   '@1271d
PRINT "Subdiretorio ";   '@12733 DS:1dd8
COLOR RT_CINT%(FX##(V_0dc0!))   '@12741
PRINT "*"; V_0dfc$; "*";   '@1275e DS:1da6
COLOR 7   '@1277e
RT_LINEINPUT " ", V_106e$   '@12794 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_1282c   '@127ae
IF NOT (RT_MID$((V_106e$), (1), (1)) <> "\") THEN GOTO L_1280f   '@127c3 DS:1dea
V_0dfc$ = V_0dfc$ + UCASE$(V_106e$)   '@127e5
GOTO L_12827   '@12807
L_1280f:
V_0dfc$ = UCASE$(V_106e$)   '@1280f
L_12827:
L_1282c:
IF NOT (RT_RIGHT$((V_0dfc$), (1)) <> "\") THEN GOTO L_12869   '@1282c DS:1dea
V_0dfc$ = V_0dfc$ + "\"   '@1284d DS:1dea
L_12869:
RETURN   '@12869
' @12873 (trecho de 331 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
RT_VIEWPRINT RT_CINT%(FX##(V_101a!)), 25   '@1287d
RT_CLS 2   '@12896
COLOR 3   '@128a4
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@128ba DS:16a0,1df0
COLOR 14   '@128da
RT_VIEWPRINT RT_CINT%(FX##(V_101a!) + 1.0), 25   '@128f0 DS:17e0
ON ERROR GOTO L_129be
RT_ONERR = &H129be   '@1290e
L_BP0c% = (LEN(V_0dfc$) > 1)   '@1291d DS:1e26
CHDIR RT_ARQ$(RT_LEFT$((V_0df8$ + ":" + V_0dfc$), (LEN(V_0dfc$) + L_BP0c% + 2)))   '@12953
RT_FILES V_0df8$ + ":" + V_0dfc$ + "*" + V_149e$   '@1296a DS:1da6,1e26 (FILES: cabecalho em forma DOS (RT45))
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@129a0
RETURN   '@129af
L_129be:
IF NOT (ERR = 53) THEN GOTO L_12a04   '@129c3
PRINT " Nenhum Arquivo Encontrado"   '@129d5 DS:1e2c
V_106e$ = ""   '@129e3 DS:16a0
RESUME NEXT   '@129f5
L_12a04:
V_106e$ = "ERRPIL"   '@12a04 DS:1e4a
RESUME NEXT   '@12a16
L_12a25:   ' entrada vinda de 0108aa_FUN_1000_08aa
RT_VIEWPRINT 1, 25   '@12a2a
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@12a3c
RT_CLS 2   '@12a68
PRINT RT_STRINGC$((80), (205))   '@12a76
PRINT " Correcao de Parametros"   '@12a8e DS:1e54
PRINT RT_STRINGC$((80), (205))   '@12a9c
L_12ab9:
LOCATE 5, 1   '@12abe
COLOR 7   '@12ad9
PRINT " Parametrizacao Utilizada (.PIP)"   '@12aef DS:1e70
COLOR RT_CINT%(FX##(V_0dc0!))   '@12afd
PRINT " (P)  Parametrizacao = ";   '@12b1a DS:1e94
IF NOT (V_0e14$ = "SISTRUT") THEN GOTO L_12b55   '@12b28 DS:17a8
PRINT V_0e14$   '@12b3f
GOTO L_12b6c   '@12b4d
L_12b55:
PRINT V_0e18$; V_0e14$   '@12b55
L_12b6c:
PRINT ""   '@12b6c DS:16a0
COLOR 7   '@12b7a
PRINT " Coeficientes de Seguranca"   '@12b90 DS:1eb0
COLOR RT_CINT%(FX##(V_0dc0!))   '@12b9e
PRINT " (1)  Forcas ="; V_0e1c!; "    "   '@12bbb DS:1ece,1ee0
PRINT " (2)  Concreto ="; V_0e20!; "    "   '@12bdf DS:1ee0,1ee8
PRINT " (3)  Aco ="; V_0e24!; "    "   '@12c03 DS:1ee0,1efc
PRINT ""   '@12c27 DS:16a0
COLOR 7   '@12c35
PRINT " Coeficientes para o calculo da fluencia"   '@12c4b DS:1f0c
COLOR RT_CINT%(FX##(V_0dc0!))   '@12c59
PRINT " (4)  "; CHR$(237); " de Fluencia (0 a 2) ="; V_0e42!; "    "   '@12c76 DS:1ee0,1f38,1f42
PRINT " (5)  Mult. de  Nk  par  obter (Ngk + "; CHR$(229); " Nqk)  ="; V_0e4a!; "     "   '@12cb2 DS:1f5c,1f86,1f92
PRINT " (6)  Mult. Fluencia (1.1 a 1.25) ="; V_0e4e!; "       "   '@12cee DS:1f9c,1fc4
PRINT ""   '@12d12 DS:16a0
COLOR 7   '@12d20
PRINT " Unidades de trabalho dos esforcos solicitantes"   '@12d36 DS:1fd0
COLOR RT_CINT%(FX##(V_0dc0!))   '@12d44
PRINT " (7)  Unidade de Forca = "; V_0ddc$; "    "   '@12d61 DS:1ee0,2004
PRINT " (8)  Coef. multiplicador para transformar em toneladas ="; V_0de8!; "   "   '@12d81 DS:2022,2060
PRINT " (9)  Unidade de Medida = "; V_0dd8$; "    "   '@12da5 DS:1ee0,2068
PRINT " (10) Coef. multiplicador para transformar em metros ="; V_0de4!; "   "   '@12dc5 DS:2060,2086
L_12dee:
COLOR 7   '@12df3
LOCATE 24, 1   '@12e09
PRINT " item , Novo Valor  *NAO* "; RT_TAB$(70); "";   '@12e24 DS:16a0,20c0
LOCATE 24, 27   '@12e44
CALL MIXT_07f1_LimpaTeclado   '@12e62
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_106e$, V_1072$)   '@12e6c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) = 0) THEN GOTO L_12e9b   '@12e7e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@12e93
L_12e9b:
V_14a2$ = V_106e$   '@12e9b
IF NOT (V_14a2$ <> "P") THEN GOTO L_12ed6   '@12ead DS:19a0
IF NOT (V_14a2$ = "p") THEN GOTO L_1320e   '@12ec4 DS:1ab0
L_12ed6:
L_12edb:
RT_VIEWPRINT 5, 25   '@12ee0
RT_CLS 2   '@12ef2
LOCATE 7, 1   '@12f00
COLOR 3   '@12f1b
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@12f31 DS:16a0,1df0
COLOR 14   '@12f51
RT_VIEWPRINT 8, 25   '@12f67
ON ERROR GOTO L_13526
RT_ONERR = &H13526   '@12f79
L_BP0c% = (LEN(V_0e18$) > 3)   '@12f88
CHDIR RT_ARQ$(RT_LEFT$((V_0e18$), (LEN(V_0e18$) + L_BP0c%)))   '@12fa7
IF NOT (V_106e$ = "ERPARA") THEN GOTO L_12fda   '@12fbb DS:20de
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12ab9   '@12fd2
L_12fda:
RT_FILES V_0e18$ + "*.PIP"   '@12fda DS:20e8 (FILES: cabecalho em forma DOS (RT45))
IF NOT (V_106e$ = "ERRPARA") THEN GOTO L_13011   '@12ff2 DS:20f2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12ab9   '@13009
L_13011:
ON ERROR GOTO L_103c6
RT_ONERR = &H103c6   '@13011
RT_VIEWPRINT 5, 6   '@13020
RT_CLS 2   '@13032
COLOR 7   '@13040
PRINT " Nome do Arquivo PARAMETRIZACAO *"; V_0e14$; "* ";   '@13056 DS:1b3a,20fe
CALL MIXT_07f1_LimpaTeclado   '@13076
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1072$   '@13080 DS:16a0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_1072$) = 0) THEN GOTO L_130b7   '@1309a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12a25   '@130af
L_130b7:
IF NOT (UCASE$(V_1072$) = "D") THEN GOTO L_13199   '@130b7 DS:2124
V_1072$ = V_0df8$   '@130d4
V_1076$ = V_0dfc$   '@130e6
V_0df8$ = RT_MID$((V_0e18$), (1), (1))   '@130f8
V_0dfc$ = RT_MID2$((V_0e18$), (3))   '@13115
GOSUB L_125cf   '@13135
V_0e18$ = V_0df8$ + ":" + V_0dfc$   '@13142 DS:1e26
V_0df8$ = V_1072$   '@13168
V_0dfc$ = V_1076$   '@1317a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12edb   '@1318c
L_13199:
ON ERROR GOTO L_1359f
RT_ONERR = &H1359f   '@13199
V_0e14$ = UCASE$(V_1072$)   '@131a8
L_131c5:   ' entrada vinda de 013521_F_13521
CALL S_23c9a   '@131ca
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 5, 25   '@131d4
RT_CLS 2   '@131e6
RT_VIEWPRINT 1, 25   '@131f4
GOTO L_13519   '@13206
L_1320e:
IF NOT (V_14a2$ = "1") THEN GOTO L_13242   '@1320e DS:1a7a
V_0e1c! = VAL(V_1072$)   '@13220
GOTO L_13519   '@1323a
L_13242:
IF NOT (V_14a2$ = "2") THEN GOTO L_13276   '@13242 DS:1a86
V_0e20! = VAL(V_1072$)   '@13254
GOTO L_13519   '@1326e
L_13276:
IF NOT (V_14a2$ = "3") THEN GOTO L_132aa   '@13276 DS:1a9e
V_0e24! = VAL(V_1072$)   '@13288
GOTO L_13519   '@132a2
L_132aa:
IF NOT (V_14a2$ = "4") THEN GOTO L_13332   '@132aa DS:1aaa
L_BP0c% = (VAL(V_1072$) >= 0.0#)   '@132bc DS:1b46,212a
IF NOT ((VAL(V_1072$) <= 2.0# AND L_BP0c%) <> 0) THEN GOTO L_1332a   '@132ef
V_0e42! = VAL(V_1072$)   '@13310
L_1332a:
GOTO L_13519   '@1332a
L_13332:
IF NOT (V_14a2$ = "5") THEN GOTO L_133ba   '@13332 DS:1ac2
L_BP0c% = (VAL(V_1072$) > 0.0#)   '@13344 DS:1b46,2132
IF NOT ((VAL(V_1072$) <= 1.0# AND L_BP0c%) <> 0) THEN GOTO L_133b2   '@13377
V_0e4a! = VAL(V_1072$)   '@13398
L_133b2:
GOTO L_13519   '@133b2
L_133ba:
IF NOT (V_14a2$ = "6") THEN GOTO L_13442   '@133ba DS:1ace
L_BP0c% = (FX##(VAL(V_1072$)) >= 1.10000002384185791015625##)   '@133cc DS:213a,2142
IF NOT ((VAL(V_1072$) <= 1.25# AND L_BP0c%) <> 0) THEN GOTO L_1343a   '@133ff
V_0e4e! = VAL(V_1072$)   '@13420
L_1343a:
GOTO L_13519   '@1343a
L_13442:
IF NOT (V_14a2$ = "7") THEN GOTO L_1346e   '@13442 DS:1ae6
V_0ddc$ = V_1072$   '@13454
GOTO L_13519   '@13466
L_1346e:
IF NOT (V_14a2$ = "8") THEN GOTO L_134a2   '@1346e DS:214a
V_0de8! = VAL(V_1072$)   '@13480
GOTO L_13519   '@1349a
L_134a2:
IF NOT (V_14a2$ = "9") THEN GOTO L_134ce   '@134a2 DS:2150
V_0dd8$ = V_1072$   '@134b4
GOTO L_13519   '@134c6
L_134ce:
IF NOT (V_14a2$ = "10") THEN GOTO L_13502   '@134ce DS:2156
V_0de4! = VAL(V_1072$)   '@134e0
GOTO L_13519   '@134fa
L_13502:
BEEP   '@13502
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12dee   '@1350c
L_13519:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_12ab9   '@13519
' ---- F_13521 @0x13521  (013521_F_13521.lift.txt; evidence_id (assembly): ev_9be2a8938fe77a9beb0cb71f04b0966ff73b21dd7b88d0fd768ee9ca5cfc6d6e)
L_13526:   ' entrada vinda de 0119ba_F_119ba
IF NOT (ERR = 53) THEN GOTO L_1356c   '@1352b
PRINT " Nenhum Arquivo Encontrado"   '@1353d DS:1e2c
V_106e$ = ""   '@1354b DS:16a0
RESUME NEXT   '@1355d
L_1356c:
RT_VIEWPRINT 1, 25   '@1356c
V_106e$ = "ERRPARA"   '@1357e DS:20f2
RESUME NEXT   '@13590
L_1359f:   ' entrada vinda de 0119ba_F_119ba
BEEP   '@135a4
V_0e14$ = "SISTRUT"   '@135ae DS:17a8
RESUME L_131c5   '@135c0
L_135d2:   ' entrada vinda de 0108aa_FUN_1000_08aa
IF NOT (V_11aa% = 0 OR (V_11a8% = 0 OR V_11a6% = 0)) THEN GOTO L_13610   '@135d7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@13608
L_13610:
RT_VIEWPRINT 1, 25   '@13610
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@13622
RT_CLS 2   '@1365d
PRINT RT_STRINGC$((80), (205))   '@1366b
PRINT " Predimensionamento de Secao e Dimensionamento da Armadura"   '@13683 DS:215c
PRINT " Numero maximo de Colunas -"; V_0e34!; "       Posicionadas"; V_11a6%; "Colunas"   '@13691 DS:219a,21ba,21d2
PRINT RT_STRINGC$((80), (205))   '@136c7
RT_VIEWPRINT 6, 25   '@136df
COLOR 7   '@136f1
LOCATE 8, 20   '@13707
PRINT "1  -  ";   '@13725 DS:1914
COLOR RT_CINT%(FX##(V_0dc4!))   '@13733
PRINT "P";   '@13750 DS:19a0
COLOR 7   '@1375e
PRINT "redimensionamento de Secao"   '@13774 DS:21de
LOCATE 10, 20   '@13782
PRINT "2  -  ";   '@137a0 DS:193e
COLOR RT_CINT%(FX##(V_0dc4!))   '@137ae
PRINT "D";   '@137cb DS:2124
COLOR 7   '@137d9
PRINT "imensionamento da Armadura"   '@137ef DS:21fc
LOCATE 12, 20   '@137fd
PRINT "3  -  ";   '@1381b DS:196a
COLOR RT_CINT%(FX##(V_0dc4!))   '@13829
PRINT "R";   '@13846 DS:221a
COLOR 7   '@13854
PRINT "esumo de cargas Acumuladas"   '@1386a DS:2220
LOCATE 14, 20   '@13878
PRINT "4  -  ";   '@13896 DS:1996
COLOR RT_CINT%(FX##(V_0dc4!))   '@138a4
PRINT "M";   '@138c1 DS:191e
COLOR 7   '@138cf
PRINT "omentos e Carga Normal / Diagramas"   '@138e5 DS:223e
LOCATE 16, 20   '@138f3
PRINT "5  -  ";   '@13911 DS:19c6
COLOR RT_CINT%(FX##(V_0dc4!))   '@1391f
PRINT "V";   '@1393c DS:1a26
COLOR 7   '@1394a
PRINT "isualizar e Alterar Parametrizacoes"   '@13960 DS:1a2c
LOCATE 18, 20   '@1396e
PRINT "6  -  *Retorno ao Menu Principal*"   '@1398c DS:2264
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1399a
LOCATE 20, 20   '@139c6
PRINT "escolha opcao ";   '@139e4 DS:1a68
CALL MIXT_07f1_LimpaTeclado   '@139f2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@139fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_1006! = RT_FRE&("")   '@13a18 DS:16a0
COLOR 7   '@13a32
V_14a6$ = V_106e$   '@13a48
IF NOT (V_14a6$ <> "1") THEN GOTO L_13a95   '@13a5a DS:1a7a
IF NOT (V_14a6$ <> "P") THEN GOTO L_13a95   '@13a71 DS:19a0
IF NOT (V_14a6$ = "p") THEN GOTO L_13ab2   '@13a83 DS:1ab0
L_13a95:
V_11ae% = 1   '@13a95
CALL S_4015f   '@13aa0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
GOTO L_13c0a   '@13aaa
L_13ab2:
IF NOT (V_14a6$ <> "2") THEN GOTO L_13ae8   '@13ab2 DS:1a86
IF NOT (V_14a6$ <> "D") THEN GOTO L_13ae8   '@13ac4 DS:2124
IF NOT (V_14a6$ = "d") THEN GOTO L_13b17   '@13ad6 DS:228a
L_13ae8:
V_11ae% = 2   '@13ae8
V_106e$ = "DIMENSIONAMENTO"   '@13af3 DS:2290
CALL S_50187   '@13b05
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
GOTO L_13c0a   '@13b0f
L_13b17:
IF NOT (V_14a6$ <> "3") THEN GOTO L_13b4d   '@13b17 DS:1a9e
IF NOT (V_14a6$ <> "R") THEN GOTO L_13b4d   '@13b29 DS:221a
IF NOT (V_14a6$ = "r") THEN GOTO L_13b5d   '@13b3b DS:22a4
L_13b4d:
GOTO L_13c17   '@13b4d
L_13b5d:
IF NOT (V_14a6$ <> "4") THEN GOTO L_13b93   '@13b5d DS:1aaa
IF NOT (V_14a6$ <> "M") THEN GOTO L_13b93   '@13b6f DS:191e
IF NOT (V_14a6$ = "m") THEN GOTO L_13bb7   '@13b81 DS:1a80
L_13b93:
V_106e$ = "MOMENTOS"   '@13b93 DS:22aa
CALL S_50187   '@13ba5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
GOTO L_13c0a   '@13baf
L_13bb7:
IF NOT (V_14a6$ <> "5") THEN GOTO L_13bed   '@13bb7 DS:1ac2
IF NOT (V_14a6$ <> "V") THEN GOTO L_13bed   '@13bc9 DS:1a26
IF NOT (V_14a6$ = "v") THEN GOTO L_13bfd   '@13bdb DS:1aec
L_13bed:
GOTO L_149b5   '@13bed
L_13bfd:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_108aa   '@13bfd
L_13c0a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_135d2   '@13c0a
L_13c17:
IF NOT (V_11ac% = 0) THEN GOTO L_13c33   '@13c1c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_135d2   '@13c2b
L_13c33:
V_11ae% = 3   '@13c33
RT_VIEWPRINT 1, 25   '@13c3e
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@13c50
RT_CLS 2   '@13c7c
PRINT RT_STRINGC$((80), (205))   '@13c8a
PRINT " Resumo de Cargas acumuladas na Fundacao"   '@13ca2 DS:22b6
PRINT RT_STRINGC$((80), (205))   '@13cb0
LOCATE 6, 1   '@13cc8
COLOR 7   '@13ce3
PRINT " Parametros que influenciam as cargas na fundacao"   '@13cf9 DS:22e2
PRINT ""   '@13d07 DS:16a0
COLOR 14   '@13d15
PRINT USING "  Reduzo cargas acidentais para fundacao = \\"; V_0e9e$   '@13d2b DS:2318
PRINT USING "  Porcentagem da carga considerada acidental = ##%"; RT_PU#(V_0ea6%, "  Porcentagem da carga considerada acidental = ##%", 1)   '@13d42 DS:234a
PRINT USING "  Acrescento o peso Proprio = \\"; V_0ea8$   '@13d59 DS:2380
PRINT USING "  Densidade do Concreto (t/m3) = ##.##"; RT_PU#(V_0eac!, "  Densidade do Concreto (t/m3) = ##.##", 1)   '@13d70 DS:23a4
PRINT ""   '@13d8b DS:16a0
COLOR 7   '@13d99
PRINT " Deseja alterar os parametros S/*N* ";   '@13daf DS:23ce
CALL MIXT_07f1_LimpaTeclado   '@13dbd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_106e$   '@13dc7 DS:16a0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_13e06   '@13de1 DS:1974
GOTO L_149b5   '@13dfe
L_13e06:
CALL MIXT_07f1_LimpaTeclado   '@13e06
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " Deseja imprimir o  relatorio S/*N* ", V_1072$   '@13e10 DS:23f6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_0fe0! = -(UCASE$(V_1072$) = "S")   '@13e2a DS:1974
LOCATE 16, 1   '@13e56
COLOR RT_CINT%(FX##(V_0dc0!))   '@13e71
PRINT " <Enter> ";   '@13e8e DS:241e
COLOR 7   '@13e9c
PRINT "para seguir ";   '@13eb2 DS:242c
IF NOT (V_0fe0! = 1.0) THEN GOTO L_13f3d   '@13ec0 DS:17e0
PRINT "ou  ";   '@13edb DS:243c
COLOR RT_CINT%(FX##(V_0dc0!))   '@13ee9
PRINT "* <Enter> ";   '@13f06 DS:2444
COLOR 7   '@13f14
PRINT "para nao avancar o formulario ";   '@13f2a DS:2452
L_13f3d:
CALL MIXT_07f1_LimpaTeclado   '@13f3d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1072$   '@13f47 DS:16a0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0fe0! = 1.0) THEN GOTO L_13fe1   '@13f61 DS:17e0
IF NOT (V_1072$ <> "*") THEN GOTO L_13fac   '@13f7c DS:1da6
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@13f93
L_13fac:
RT_LPTABRE: RT_LPS V_0e08$   '@13fac
RT_LPTABRE: RT_LPS V_0e0c$   '@13fc4
L_13fe1:
RT_VIEWPRINT 1, 25   '@13fe1
COLOR RT_CINT%(FX##(V_0dc0!))   '@13ff3
RT_CLS 2   '@14010
V_1076$ = "              \  \      \  \      \  \     \   \    \   \ "   '@1401e DS:2474
V_107a$ = " \        \####.##   ####.##  #####.##  #####.#  #####.#  \     \ \           \"   '@14030 DS:24b2
PRINT " RESUMO DE CARGAS NA FUNDACAO"   '@14042 DS:2506
PRINT " Coluna     Carga      Peso    Fundacao     Mx       My    Secao       As"   '@14050 DS:2528
PRINT "          Acumulada   Proprio            fundacao fundacao          fundacao"   '@1405e DS:2576
PRINT USING V_1076$; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + V_0dd8$ + ")"; "(" + V_0ddc$ + V_0dd8$ + ")"   '@1406c DS:25c6,25cc
PRINT RT_STRINGS$((80), ("-"))   '@1411f DS:25d2
RT_VIEWPRINT 6, 25   '@14137
IF NOT (V_0fe0! = 1.0) THEN GOTO L_142f4   '@14149 DS:17e0
RT_LPTABRE: RT_LPS " RESUMO DE CARGAS NA FUNDACAO": RT_LPFIM   '@14164 DS:2506
RT_LPTABRE: RT_LPS " Obra - ": RT_LPS V_11be$: RT_LPFIM   '@14177 DS:25d8
RT_LPTABRE: RT_LPS " ": RT_LPS V_0e8a$: RT_LPFIM   '@14193 DS:1b40
RT_LPTABRE: RT_LPS " ": RT_LPS RT_DATE$: RT_LPS "    ": RT_LPS RT_TIME$: RT_LPFIM   '@141af DS:1b40,1ee0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@141e1 DS:16a0
RT_LPTABRE: RT_LPS " Coluna     Carga      Peso    Fundacao     Mx       My    Secao       As": RT_LPFIM   '@141f4 DS:2528
RT_LPTABRE: RT_LPS "          Acumulada   Proprio            fundacao fundacao          fundacao": RT_LPFIM   '@14207 DS:2576
RT_LPTABRE: PRINT #RT_LPT, USING V_1076$; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + ")"; "(" + V_0ddc$ + V_0dd8$ + ")"; "(" + V_0ddc$ + V_0dd8$ + ")": RT_LPTQUEBRA 0   '@1421a DS:25c6,25cc
RT_LPTABRE: RT_LPS RT_STRINGS$((79), ("-")): RT_LPFIM   '@142d2 DS:25d2
L_142f4:
V_14aa! = V_11a6%   '@142f4
FOR V_0fe4! = 1.0 TO V_14aa!   '@14309 DS:17e0
V_106e$ = ""   '@14310 DS:16a0
V_1072$ = ""   '@14322 DS:16a0
V_0ff0! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@14334
V_11c6% = 0   '@14362
V_106e$ = "CARGAACUMULADA"   '@1436d DS:25e4
CALL S_50187   '@1437f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_10ba! = 0.0   '@14389 DS:1c1a
IF NOT (V_0e9e$ = "S") THEN GOTO L_14515   '@1439a DS:1974
IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) - A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) = 4) THEN GOTO L_14426   '@143b1
V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.20000000298023223876953125## / 100.0   '@143fb DS:25f6,25fa
L_14426:
IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) - A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) = 5) THEN GOTO L_1449b   '@14426
V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.4000000059604644775390625## / 100.0   '@14470 DS:25fa,25fe
L_1449b:
IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) - A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) > 5) THEN GOTO L_14510   '@1449b
V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.60000002384185791015625## / 100.0   '@144e5 DS:25fa,2602
L_14510:
L_14515:
IF NOT (V_11c4% = 1) THEN GOTO L_14768   '@14515
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 0) > 0) THEN GOTO L_14763   '@14524
V_1072$ = LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 1))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 2)))) + "+" + LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 3))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 4))))   '@1454f DS:1d4e,1d54
IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 2) = A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 4)) THEN GOTO L_1475e   '@14664
V_1072$ = LTRIM$(STR$(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 1))) + "#" + LTRIM$(STR$(A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 2))))   '@146b2 DS:1d4e
L_1475e:
L_14763:
L_14768:
PRINT USING V_107a$; A_1252$(RT_CINT%(FX##(V_0fe4!))); RT_PU#(RT_SNG!(FX##(V_0f90!) - V_10ba! + V_0f88!), V_107a$, 1); RT_PU#(V_10b6!, V_107a$, 2); RT_PU#(RT_SNG!(FX##(V_0f88!) + V_0f90! + (FX##(V_10b6!) - V_10ba!)), V_107a$, 3); RT_PU#(V_10ae!, V_107a$, 4); RT_PU#(V_10b2!, V_107a$, 5); V_106e$; V_1072$   '@14768
IF NOT (V_0fe0! = 1.0) THEN GOTO L_148d8   '@14810 DS:17e0
RT_LPTABRE: PRINT #RT_LPT, USING V_107a$; A_1252$(RT_CINT%(FX##(V_0fe4!))); RT_PU#(RT_SNG!(FX##(V_0f90!) - V_10ba! + V_0f88!), V_107a$, 1); RT_PU#(V_10b6!, V_107a$, 2); RT_PU#(RT_SNG!(FX##(V_0f88!) + V_0f90! + (FX##(V_10b6!) - V_10ba!)), V_107a$, 3); RT_PU#(V_10ae!, V_107a$, 4); RT_PU#(V_10b2!, V_107a$, 5); V_106e$; V_1072$: RT_LPTQUEBRA 0   '@1482b
L_148d8:
IF NOT (FX##(V_0fe4!) / 17.0 = RT_CLNG&(FX##(V_0fe4!)) \ 17&) THEN GOTO L_1493a   '@148d8 DS:2606
CALL MIXT_07f1_LimpaTeclado   '@1490f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@14919
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
L_1493a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
NEXT V_0fe4!   '@1493a DS:17e0
PRINT ""   '@14966 DS:16a0
PRINT " Qualquer tecla para Continuar ";   '@14974 DS:260a
CALL MIXT_07f1_LimpaTeclado   '@14982
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@1498c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_135d2   '@149a8
L_149b5:
RT_VIEWPRINT 1, 25   '@149ba
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@149cc
RT_CLS 2   '@149f8
PRINT RT_STRINGC$((80), (205))   '@14a06
PRINT " Correcao de Parametros"   '@14a1e DS:1e54
PRINT RT_STRINGC$((80), (205))   '@14a2c
L_14a49:
V_11b6! = FX##(V_0e92!) * V_0e66!   '@14a4e
IF NOT (V_0e92! < 0.0) THEN GOTO L_14a93   '@14a64 DS:1c1a
V_11b6! = -V_0e92!   '@14a7f
L_14a93:
V_11ba! = FX##(V_0e96!) * V_0e66!   '@14a93
IF NOT (V_0e96! < 0.0) THEN GOTO L_14ad8   '@14aa9 DS:1c1a
V_11ba! = -V_0e96!   '@14ac4
L_14ad8:
LOCATE 6, 1   '@14ad8
COLOR 3   '@14af3
PRINT " Para os itens (1) e (2), entre com o valor do multiplicador do Fck ou"   '@14b09 DS:262e
PRINT " o valor negativo -tensao  onde tensao e o valor da maxima tensao admissivel"   '@14b17 DS:2678
COLOR 7   '@14b25
PRINT ""   '@14b3b DS:16a0
PRINT " Coeficientes de tensao maxima admissivel para Predimensionamento"   '@14b49 DS:26c8
COLOR RT_CINT%(FX##(V_0dc0!))   '@14b57
PRINT USING " (1)  Compressao = ####.### \            \"; RT_PU#(V_11b6!, " (1)  Compressao = ####.### \            \", 1); V_0de0$;   '@14b74 DS:270e
COLOR 11   '@14b9d
IF NOT (V_0e92! > 0.0) THEN GOTO L_14c03   '@14bb3 DS:1c1a
PRINT RT_TAB$(65); ""; V_0e92!; "Fck"   '@14bce DS:16a0,273c
GOTO L_14c23   '@14bfb
L_14c03:
PRINT RT_TAB$(79); ""; ""   '@14c03 DS:16a0
L_14c23:
COLOR RT_CINT%(FX##(V_0dc0!))   '@14c23
PRINT USING " (2)  Compressao + Momento = ####.### \            \"; RT_PU#(V_11ba!, " (2)  Compressao + Momento = ####.### \            \", 1); V_0de0$;   '@14c40 DS:2744
COLOR 11   '@14c69
IF NOT (V_0e96! > 0.0) THEN GOTO L_14ccf   '@14c7f DS:1c1a
PRINT RT_TAB$(65); ""; V_0e96!; "Fck"   '@14c9a DS:16a0,273c
GOTO L_14cef   '@14cc7
L_14ccf:
PRINT RT_TAB$(79); ""; ""   '@14ccf DS:16a0
L_14cef:
COLOR RT_CINT%(FX##(V_0dc0!))   '@14cef
PRINT USING " (3)  Taxa ideal de armadura = #.##%"; RT_PU#(V_0e9a!, " (3)  Taxa ideal de armadura = #.##%", 1)   '@14d0c DS:277c
PRINT ""   '@14d27 DS:16a0
PRINT USING " (4)  Cobrimento = ##.# cm"; RT_PU#(V_0e8e!, " (4)  Cobrimento = ##.# cm", 1)   '@14d35 DS:27a4
PRINT ""   '@14d50 DS:16a0
PRINT USING " (5)  Reduzo cargas acidentais para Fundacao = \\"; V_0e9e$   '@14d5e DS:27c2
PRINT USING " (6)  Reduzo cargas acidentais para Dimensionamento = \\"; V_0ea2$   '@14d75 DS:27f8
PRINT USING " (7)  Porcentagem da carga considerada acidental = ##%"; RT_PU#(V_0ea6%, " (7)  Porcentagem da carga considerada acidental = ##%", 1)   '@14d8c DS:2834
PRINT USING " (8)  Acrescento o peso Proprio = \\"; V_0ea8$   '@14da3 DS:286e
PRINT USING " (9)  Densidade do Concreto (t/m3) = ##.##"; RT_PU#(V_0eac!, " (9)  Densidade do Concreto (t/m3) = ##.##", 1)   '@14dba DS:2896
L_14dda:
COLOR 7   '@14ddf
LOCATE 22, 1   '@14df5
PRINT " item , Novo Valor  *NAO* "; RT_TAB$(70); "";   '@14e10 DS:16a0,20c0
LOCATE 22, 27   '@14e30
CALL MIXT_07f1_LimpaTeclado   '@14e4e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_106e$, V_1072$)   '@14e58
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) = 0) THEN GOTO L_14e87   '@14e6a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_135d2   '@14e7f
L_14e87:
V_14ae# = VAL(V_106e$)   '@14e87
IF NOT (V_14ae# = 1.0#) THEN GOTO L_14f74   '@14ea1 DS:2132
IF NOT (VAL(V_1072$) >= 0.0#) THEN GOTO L_14f26   '@14ebc DS:1b46
IF NOT (VAL(V_1072$) <= 100.0#) THEN GOTO L_14f1e   '@14ee0 DS:28c4
V_0e92! = VAL(V_1072$)   '@14f04
L_14f1e:
GOTO L_14f6c   '@14f1e
L_14f26:
IF NOT (FX##(-VAL(V_1072$)) <= FX##(V_0e66!)) THEN GOTO L_14f67   '@14f26
V_0e92! = VAL(V_1072$)   '@14f4d
L_14f67:
L_14f6c:
GOTO L_153ce   '@14f6c
L_14f74:
IF NOT (V_14ae# = 2.0#) THEN GOTO L_15042   '@14f75 DS:212a
IF NOT (VAL(V_1072$) >= 0.0#) THEN GOTO L_14ff4   '@14f8a DS:1b46
IF NOT (VAL(V_1072$) <= 100.0#) THEN GOTO L_14fec   '@14fae DS:28c4
V_0e96! = VAL(V_1072$)   '@14fd2
L_14fec:
GOTO L_1503a   '@14fec
L_14ff4:
IF NOT (FX##(-VAL(V_1072$)) <= FX##(V_0e66!)) THEN GOTO L_15035   '@14ff4
V_0e96! = VAL(V_1072$)   '@1501b
L_15035:
L_1503a:
GOTO L_153ce   '@1503a
L_15042:
IF NOT (V_14ae# = 3.0#) THEN GOTO L_150ce   '@15043 DS:28cc
L_BP0c% = (VAL(V_1072$) >= 0.0#)   '@15058 DS:1b46
IF NOT ((FX##(VAL(V_1072$)) <= FX##(V_0ebc!) OR L_BP0c%) <> 0) THEN GOTO L_150c6   '@1508b
V_0e9a! = VAL(V_1072$)   '@150ac
L_150c6:
GOTO L_153ce   '@150c6
L_150ce:
IF NOT (V_14ae# = 4.0#) THEN GOTO L_1512a   '@150cf DS:28d4
IF NOT (VAL(V_1072$) > 0.0#) THEN GOTO L_15122   '@150e4 DS:1b46
V_0e8e! = VAL(V_1072$)   '@15108
L_15122:
GOTO L_153ce   '@15122
L_1512a:
IF NOT (V_14ae# = 5.0#) THEN GOTO L_151a6   '@1512b DS:28dc
IF NOT (UCASE$(V_1072$) = "N") THEN GOTO L_1516f   '@15140 DS:28e4
V_0e9e$ = "N"   '@1515d DS:28e4
L_1516f:
IF NOT (UCASE$(V_1072$) = "S") THEN GOTO L_1519e   '@1516f DS:1974
V_0e9e$ = "S"   '@1518c DS:1974
L_1519e:
GOTO L_153ce   '@1519e
L_151a6:
IF NOT (V_14ae# = 6.0#) THEN GOTO L_15222   '@151a7 DS:28ea
IF NOT (UCASE$(V_1072$) = "N") THEN GOTO L_151eb   '@151bc DS:28e4
V_0ea2$ = "N"   '@151d9 DS:28e4
L_151eb:
IF NOT (UCASE$(V_1072$) = "S") THEN GOTO L_1521a   '@151eb DS:1974
V_0ea2$ = "S"   '@15208 DS:1974
L_1521a:
GOTO L_153ce   '@1521a
L_15222:
IF NOT (V_14ae# = 7.0#) THEN GOTO L_152af   '@15223 DS:28f2
L_BP0c% = (VAL(V_1072$) >= 0.0#)   '@15238 DS:1b46,28c4
IF NOT ((VAL(V_1072$) < 100.0# AND L_BP0c%) <> 0) THEN GOTO L_152a7   '@1526b
V_0ea6% = RT_CINT%(FX##(VAL(V_1072$)))   '@1528c
L_152a7:
GOTO L_153ce   '@152a7
L_152af:
IF NOT (V_14ae# = 8.0#) THEN GOTO L_1532b   '@152b0 DS:28fa
IF NOT (UCASE$(V_1072$) = "N") THEN GOTO L_152f4   '@152c5 DS:28e4
V_0ea8$ = "N"   '@152e2 DS:28e4
L_152f4:
IF NOT (UCASE$(V_1072$) = "S") THEN GOTO L_15323   '@152f4 DS:1974
V_0ea8$ = "S"   '@15311 DS:1974
L_15323:
GOTO L_153ce   '@15323
L_1532b:
IF NOT (V_14ae# = 9.0#) THEN GOTO L_153b7   '@1532c DS:2902
L_BP0c% = (VAL(V_1072$) > 0.0#)   '@15341 DS:1b46,290a
IF NOT ((VAL(V_1072$) < 15.0# AND L_BP0c%) <> 0) THEN GOTO L_153af   '@15374
V_0eac! = VAL(V_1072$)   '@15395
L_153af:
GOTO L_153ce   '@153af
L_153b7:
BEEP   '@153b7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_14dda   '@153c1
L_153ce:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_14a49   '@153ce
' ---- F_15558 @0x15558  (015558_F_15558.lift.txt; evidence_id (assembly): ev_a34aac2883b49f310eec2ed431d5ea9ad261a6f1bbe0b143bd66c6ca1f5e98f2)
RT_FIM   ' @15558 B$CENP (inicio/fim do modulo)
' ---- F_1555d @0x1555d  (01555d_F_1555d.lift.txt; evidence_id (assembly): ev_0c18435ca6eda127554260ddb37929be47a6575d7266c68549cdeafe14e2ffd6)
'RETRAD? @1555d ?? 50 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH ...
L_1558f:
'RETRAD? @1558f ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x1000:5593
L_15593:
'RETRAD? @15593 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x1000:5597
L_15597:
'RETRAD? @15597 ?? 234 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 98 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
L_15681:
'RETRAD? @15681 ?? 196 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 94 instr.): TEST word ptr [BP + SI], AX; ADD byte ptr [BX + SI], AL ...
L_15745:
'RETRAD? @15745 ?? 21 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 11 instr.): CMPSB ES:DI, SI; PUSH ES ...
' ---- M_PIAUXEDI @0x20030  (020030_M_PIAUXEDI.lift.txt; evidence_id (assembly): ev_d10bd88c65b5547ac31c85a0e9593d60dd617204f9b8e662c23d35a07ff802ac)
' @20030 inicio do programa (B$?EVT)
GOTO L_203e5   '@2013e
' ---- FUN_2000_03e5 @0x203e5  (0203e5_FUN_2000_03e5.lift.txt; evidence_id (assembly): ev_d5f7a122ce026b8b9b3da13d621247a15119e75816590119ccc20d5f4ced4f94)
L_203e5:   ' entrada vinda de 020030_M_PIAUXEDI
GOTO L_21df5   '@203e5
' ---- FUN_2000_1df5 @0x21df5  (021df5_FUN_2000_1df5.lift.txt; evidence_id (assembly): ev_f2ac53e2394363f7a955984732633710fa6630eaafcd922b2c2cf6d12e148ed2)
L_21df5:   ' entrada vinda de 0203e5_FUN_2000_03e5
GOTO L_22672   '@21df5
' ---- FUN_2000_2672 @0x22672  (022672_FUN_2000_2672.lift.txt; evidence_id (assembly): ev_4bc18cc9c66e2686f4e196a5451c00cb01f23045526d6dc1a50eebfe15dd7d61)
L_22672:   ' entrada vinda de 021df5_FUN_2000_1df5
GOTO L_23c92   '@22672
' ---- FUN_2000_3c92 @0x23c92  (023c92_FUN_2000_3c92.lift.txt; evidence_id (assembly): ev_34a31f6d2c0eb1c03d611578edeb358b49fa38b50edadf6ae4922d479e5cd3d6)
L_23c92:   ' entrada vinda de 022672_FUN_2000_2672
GOTO L_24f42   '@23c92
' ---- FUN_2000_4f42 @0x24f42  (024f42_FUN_2000_4f42.lift.txt; evidence_id (assembly): ev_42833e865c190604380c94e346eb9aa78b2a84dd4d9005ac31a6d1a41e429374)
L_24f42:   ' entrada vinda de 023c92_FUN_2000_3c92
GOTO L_25d05   '@24f42
' ---- FUN_2000_5d05 @0x25d05  (025d05_FUN_2000_5d05.lift.txt; evidence_id (assembly): ev_0fd5d128e17ef8e9bea4227ab4c139050d9328bcb860c802f23d8662577b0726)
L_25d05:   ' entrada vinda de 024f42_FUN_2000_4f42
GOTO L_26086   '@25d05
' ---- FUN_2000_6086 @0x26086  (026086_FUN_2000_6086.lift.txt; evidence_id (assembly): ev_960c82d3c2c6757f324809a1b3b0c02f5c4f2d4b7f04e8c064b76c9dd7764d26)
L_26086:   ' entrada vinda de 025d05_FUN_2000_5d05
GOTO L_26963   '@26086
' ---- RT_EA @0x26963  (026963_RT_EA.lift.txt; evidence_id (assembly): ev_5f89bc0d8e56da7250e98f4daa9b5e626beb8ec6c8057aeab3ea273469c3d8cf)
L_26963:   ' entrada vinda de 026086_FUN_2000_6086
RT_FIM   ' @26963 B$CENP (inicio/fim do modulo)
' ---- M_PILDAEDI @0x30030  (030030_M_PILDAEDI.lift.txt; evidence_id (assembly): ev_47591f0792854bdfe999e63481a8be72aff95e6a5c703edd40a32d93c8612086)
' @30030 inicio do programa (B$?EVT)
L_30143:   ' entrada vinda de 03017f_F_3017f, 0378fe_F_378fe
RESUME L_3015a   '@30148
L_3015a:
ON ERROR GOTO L_30143
RT_ONERR = &H30143   '@3015f
CALL S_153de   '@3016e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY no laco (B$EVCK)
GOTO L_3015a   '@30178
' ---- F_3017f @0x3017f  (03017f_F_3017f.lift.txt; evidence_id (assembly): ev_b7e8c6eeecf06c9a8138e8c7d933e915844b7b6f9f619705eebc2abb2eedbe60)
L_30184:   ' entrada vinda de 0378fe_F_378fe
IF NOT (ERR = 53) THEN GOTO L_301ca   '@30189
PRINT " Nenhum Arquivo Encontrado"   '@3019b DS:2c90
RESUME NEXT   '@301a9
' @301b3 (trecho de 23 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
V_106e$ = ""   '@301b3 DS:2cae
L_301ca:
V_106e$ = "ERRPIL"   '@301ca DS:2cb2
RESUME NEXT   '@301dc
L_301eb:   ' entrada vinda de 0378fe_F_378fe
ON ERROR GOTO L_30143
RT_ONERR = &H30143   '@301f0
RT_CLS 2   '@301ff
COLOR 14   '@3020d
BEEP   '@30223
BEEP   '@3022d
PRINT " ATENCAO ! .. Drive e Diretorio nao encontrados"   '@30237 DS:2cbc
COLOR 7   '@30245
CALL MIXT_07f1_LimpaTeclado   '@3025b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
PRINT " Crio o Diretorio "; V_0df8$; ":"; V_0dfc$;   '@30265 DS:2cf0,2d06
RT_LINEINPUT "    S/*N* ", V_106e$   '@3028e DS:2d0c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) <> "S") THEN GOTO L_302f8   '@302a8 DS:2d1a
V_0dfc$ = V_0df4$   '@302c5
V_0df8$ = V_0df0$   '@302d7
RESUME   '@302e9
L_302f8:
PRINT " Criando Diretorio     Aguarde ..."   '@302f8 DS:2d20
L_BP0c% = (LEN(V_0dfc$) > 1)   '@30306 DS:2d06
MKDIR RT_ARQ$(V_0df8$ + ":" + RT_LEFT$((V_0dfc$), (LEN(V_0dfc$) + L_BP0c%)))   '@30333
RESUME   '@3034d
L_3035c:   ' entrada vinda de 0378fe_F_378fe
BEEP   '@30361
COLOR 14   '@3036b
LOCATE 12, 1   '@30381
V_14c2% = ERR   '@3039c
IF NOT (V_14c2% = 53) THEN GOTO L_303ce   '@303a9
PRINT " ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ";   '@303b8 DS:2d46
GOTO L_30401   '@303c6
L_303ce:
IF NOT (V_14c2% = 61) THEN GOTO L_303ee   '@303ce
PRINT " O SEU DISCO DE DADOS ESTA LOTADO ";   '@303d8 DS:2d74
GOTO L_30401   '@303e6
L_303ee:
PRINT " VERIFIQUE O SEU DRIVE ";   '@303ee DS:2d9a
L_30401:
RT_CLOSE   '@30401 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
COLOR 7   '@3040e
CALL MIXT_07f1_LimpaTeclado   '@30424
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@3042e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_106ab, L_106d6, L_1087c   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = "ERRO"   '@3044a DS:2db6
ON ERROR GOTO L_30143
RT_ONERR = &H30143   '@3045c
RESUME NEXT   '@3046b
' @30475 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_33d72   '@30475
' ---- FUN_3000_3d72 @0x33d72  (033d72_FUN_3000_3d72.lift.txt; evidence_id (assembly): ev_da51d8b59fb84cbe2f37a647087ac20c40ec38cd46e3cf824daac5b007f18d52)
L_33d72:   ' entrada vinda de 03017f_F_3017f
GOTO L_3811e   '@33d72
' ---- F_3811e @0x3811e  (03811e_F_3811e.lift.txt; evidence_id (assembly): ev_b4e23faefcbbfc5c397d12c6bbe962b7c9326a02be81464a7fb6ffcde8217612)
L_3811e:   ' entrada vinda de 033d72_FUN_3000_3d72
RT_FIM   ' @3811e B$CENP (inicio/fim do modulo)
' ---- F_38123 @0x38123  (038123_F_38123.lift.txt; evidence_id (assembly): ev_2e58d6c01fe18323cc4a1a4a60348e0513c2f8969f38e5a328f5fb9d3e953f44)
'RETRAD? @38123 ?? 50 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH ...
L_38155:
'RETRAD? @38155 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x3000:8159
L_38159:
'RETRAD? @38159 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x3000:815d
L_3815d:
'RETRAD? @3815d ?? 368 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 158 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
L_382cd:
'RETRAD? @382cd ?? 107 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 54 instr.): ADD byte ptr [BX + SI], AL; MOV AL, byte ptr [SI] ...
L_38338:
'RETRAD? @38339 ?? 183 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 85 instr.): ADD byte ptr [BX + SI], AL; MOV SI, 0x7 ...
' ---- F_383f0 @0x383f0  (0383f0_F_383f0.lift.txt; evidence_id (assembly): ev_12fbe8ddcc2511df54e2425ee4c7622ed5469cf065ab5c754b90adb05bfc43ad)
'RETRAD? @383f3 ?? 286 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 131 instr.): IN AL, DX; OR AX, 0x0 ...
' ---- M_PILVEEDI @0x40030  (040030_M_PILVEEDI.lift.txt; evidence_id (assembly): ev_2a49bfb61c1b2fb46509a651be3e49938987d890b6bd408d1413558e49433b8f)
' @40030 inicio do programa (B$?EVT)
GOTO L_45f81   '@40157
' ---- FUN_4000_5f81 @0x45f81  (045f81_FUN_4000_5f81.lift.txt; evidence_id (assembly): ev_31719a553c1669fe5ade86f3bdf94ae826d51b34e4774af550c4d99278ad9e1c)
L_45f81:   ' entrada vinda de 040030_M_PILVEEDI
GOTO L_4ab16   '@45f81
' ---- RT_EA @0x4ab16  (04ab16_RT_EA.lift.txt; evidence_id (assembly): ev_d505054773c32b97e07fb90998c2e4ca97437a9ff5f6dc9132e4deb6b4abbd92)
L_4ab16:   ' entrada vinda de 045f81_FUN_4000_5f81
RT_FIM   ' @4ab16 B$CENP (inicio/fim do modulo)
' ---- M_PISECEDI @0x50030  (050030_M_PISECEDI.lift.txt; evidence_id (assembly): ev_30c084291c3f5f05c591a9427bb66ba642abd7a08bff6d24d4c5066c3f1241ed)
' @50030 inicio do programa (B$?EVT)
GOTO L_5b885   '@5017f
' ---- RT_EA @0x5b885  (05b885_RT_EA.lift.txt; evidence_id (assembly): ev_f980937f756f1339566ee950c2a482b7e08a6f22919c84401270b30aa687d2cf)
L_5b885:   ' entrada vinda de 050030_M_PISECEDI
RT_FIM   ' @5b885 B$CENP (inicio/fim do modulo)
' ---- M_PIMOMEDI @0x60030  (060030_M_PIMOMEDI.lift.txt; evidence_id (assembly): ev_c00115221ca64f2c1f8f47182b72ecd916cb6e64b1637be789e184b8b28f79bc)
' @60030 inicio do programa (B$?EVT)
GOTO L_633b9   '@6015c
' ---- FUN_6000_33b9 @0x633b9  (0633b9_FUN_6000_33b9.lift.txt; evidence_id (assembly): ev_dc18eaac1e9da968eaf614f28bc995151a2cee5c2c216f12c8ebca9e2fd45cee)
L_633b9:   ' entrada vinda de 060030_M_PIMOMEDI
GOTO L_63467   '@633b9
' ---- FUN_6000_3467 @0x63467  (063467_FUN_6000_3467.lift.txt; evidence_id (assembly): ev_7fed0d169e1cfc3b7de038097672ae987a15b69eacc3d3bae5f9779ddb0870a3)
L_63467:   ' entrada vinda de 0633b9_FUN_6000_33b9
GOTO L_65402   '@63467
' ---- RT_EA @0x65402  (065402_RT_EA.lift.txt; evidence_id (assembly): ev_105dbafab159e4fb56613bd5066c9c8537b6fa98dfd5650b399a0ed0c5d6d62c)
L_65402:   ' entrada vinda de 063467_FUN_6000_3467
RT_FIM   ' @65402 B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x80aea (chamada por CALL SUB_80aea no lift).
' Versao A; DS do original: inicio DS:5956, CR LF DS:5950, fim DS:5953, margem em [DS:5C47], ESC L em [DS:594E].
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
    REDIM A_165a!(-32768 TO -32768, -32768 TO -32768)
    V_1484! = 0
    V_1488$ = ""
    V_148c! = 0
    V_1490! = 0
    V_1494! = 0
    V_1498! = 0
    V_149c% = 0
    V_149e$ = ""
    V_14a2$ = ""
    V_14a6$ = ""
    V_14aa! = 0
    V_14ae# = 0
    V_14c2% = 0
    V_15d2! = 0
    V_15d6! = 0
    V_15da! = 0
    V_15de! = 0
    V_15e2! = 0
    V_15e6! = 0
    V_15ea$ = ""
    V_15ee! = 0
    V_15f2! = 0
    V_15f6! = 0
    V_15fa! = 0
    V_15fe! = 0
    V_1602! = 0
    V_1606! = 0
    V_160a! = 0
    V_160e! = 0
    V_1612! = 0
    V_1616! = 0
    V_161a! = 0
    V_161e! = 0
    V_1622! = 0
    V_1626! = 0
    V_162a! = 0
    V_162e! = 0
    V_1632! = 0
    V_1636! = 0
    V_163a! = 0
    V_163e! = 0
    V_1642! = 0
    V_1646! = 0
    V_164a! = 0
    V_164e! = 0
    V_1652! = 0
    V_1656! = 0
    V_1688$ = ""
    V_168c$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_106ab: BEEP; GOSUB L_10406; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_106d6: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_1087c: sai da SUB (BEEP; GOSUB L_10406; RETURN L_108aa)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H1028a: ON ERROR GOTO L_1028a
        CASE &H103c6: ON ERROR GOTO L_103c6
        CASE &H10843: ON ERROR GOTO L_10843
        CASE &H117bf: ON ERROR GOTO L_117bf
        CASE &H129be: ON ERROR GOTO L_129be
        CASE &H13526: ON ERROR GOTO L_13526
        CASE &H1359f: ON ERROR GOTO L_1359f
        CASE &H30143: ON ERROR GOTO L_30143
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_153de   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x153de)
    ' ---- FUN_1000_53de @0x153de  (0153de_FUN_1000_53de.lift.txt; evidence_id (assembly): ev_1c2ff44dd81f4494641795d58651add8de2b9526c2f749a0c8092d1f66f8c3ca)
    BEEP   '@153eb
    BEEP   '@153f5
    BEEP   '@153ff
    RT_SCREEN 0   '@15409
    RT_VIEWPRINT 1, 25   '@1541e
    RT_CLOSE   '@15430 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@1543d DS:1c52
    RT_CLS 0   '@15482
    LOCATE 10, 1   '@1548f
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@154aa DS:16a0,2912
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@154ca DS:16a0,292c
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@154ea DS:16a0,2958
L_1550f:
    CALL MIXT_07f1_LimpaTeclado   '@15514
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@1551e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1553a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1550f   '@15544
    ' ---- F_1554b @0x1554b  (01554b_F_1554b.lift.txt; evidence_id (assembly): ev_bf77c0f239c183c44c5e537768f32c15e54ed461fcc3fd4f6dcd98b1adcd41a3)
    ' END SUB   '@1554b
END SUB

SUB S_20146   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x20146)
    DIM L_BP0e!
    ' ---- FUN_2000_0146 @0x20146  (020146_FUN_2000_0146.lift.txt; evidence_id (assembly): ev_23ba9132a8c7abe5dcc57ccb1783e18edf4025ad9628473f604603968ade7709)
    V_109a! = 0.0   '@20158 DS:2980
    V_10a6! = 0.0   '@20169 DS:2980
    V_10aa! = 0.0   '@2017a DS:2980
    V_1002! = -100.0   '@2018b DS:2984
    L_BP0e! = A_10ec!(0, 0)   '@2019c
    FOR V_100e! = 1.0 TO L_BP0e!   '@201bc DS:2988
    V_0fb4! = A_0efa!(RT_CINT%(FX##(A_10ec!(RT_CINT%(FX##(V_100e!)), 2))))   '@201c4
    V_100a! = FX##(V_103e!) - A_1148!(RT_CINT%(FX##(V_100e!)), 1)   '@20202
    IF NOT (A_1148!(RT_CINT%(FX##(V_100e!)), 1) <> A_1148!(RT_CINT%(FX##(V_100e!) - 1.0), 1) AND V_100e! > 1.0 OR V_100e! = 1.0) THEN GOTO L_202d5   '@20232 DS:2988,298c
    CALL S_25d0d   '@202c6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_202d5:
    V_109a! = FX##(V_0fb4!) * V_0fc4! / V_0e1c! + V_109a!   '@202d5
    V_10a6! = (FX##(A_1148!(RT_CINT%(FX##(V_100e!)), 1)) - V_1042!) * V_0fb4! * V_0fc4! / V_0e1c! + V_10a6!   '@202f5
    V_10aa! = (FX##(A_1148!(RT_CINT%(FX##(V_100e!)), 0)) - V_1046!) * V_0fb4! * V_0fc4! / V_0e1c! + V_10aa!   '@20339
    IF NOT (V_0fcc! > V_1002!) THEN GOTO L_203ad   '@2037c
    V_1002! = V_0fcc!   '@20397
L_203ad:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@203ad DS:2988
    ' END SUB   '@203d8
END SUB

SUB S_203ed   ' entrada de SUB/FUNCTION (B$ENRA, locais 24 bytes) (0x203ed)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    ' ---- FUN_2000_03ed @0x203ed  (0203ed_FUN_2000_03ed.lift.txt; evidence_id (assembly): ev_23bd776d29b7d6fff3ab23d7ce3e65896ccbfc0dc08a36957303ea0527607327)
    L_BP12! = V_105a!   '@203fa
    IF NOT (L_BP12! > 10.0) THEN GOTO L_2043d   '@2040a DS:2990
    V_0fc8! = 0.00200000009499490261077880859375##   '@20424 DS:2994
    GOTO L_2045d   '@20435
L_2043d:
    V_0fc8! = FX##(V_0ffe!) * V_105a! * V_1022!   '@2043d
L_2045d:
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_21103   '@2045d DS:2988,2998
    A_1176!(0, 0) = 0.0   '@2049b DS:2980
    L_BP16! = 0.0   '@204bb DS:2980
    L_BP1a! = FX##(A_111a!(0, 0)) + 1.0   '@204cb DS:2988
    FOR V_100e! = 2.0 TO L_BP1a!   '@204f0 DS:2988,299c
    IF NOT (V_100e! = 2.0) THEN GOTO L_2063a   '@204f8 DS:299c
    IF NOT (FX##(A_111a!(2, 1)) < V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe! AND FX##(A_111a!(1, 1)) > V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!) THEN GOTO L_20635   '@20513 DS:29a0
    A_1176!(0, 0) = 1.0   '@2059a DS:2988
    A_1176!(1, 0) = A_111a!(1, 0)   '@205ba
    A_1176!(1, 1) = A_111a!(1, 1)   '@205ef
    L_BP16! = 1.0   '@20620 DS:2988
L_20635:
L_2063a:
    IF NOT (L_BP16! = 0.0 AND FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 1)) < V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!) THEN GOTO L_206ab   '@2063a DS:2980,29a0
    GOTO L_20d16   '@206a3
L_206ab:
    IF NOT (L_BP16! = 1.0) THEN GOTO L_209a2   '@206ab DS:2988
    IF NOT (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 1)) >= V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!) THEN GOTO L_207ee   '@206c5 DS:29a0
    A_1176!(0, 0) = FX##(A_1176!(0, 0)) + 1.0   '@2070c DS:2988
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 0) = A_111a!(RT_CINT%(FX##(V_100e!)), 0)   '@20740
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 1) = A_111a!(RT_CINT%(FX##(V_100e!)), 1)   '@20792
    GOTO L_2099a   '@207e6
L_207ee:
    A_1176!(0, 0) = FX##(A_1176!(0, 0)) + 1.0   '@207ee DS:2988
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 0) = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) / ((A_111a!(RT_CINT%(FX##(V_100e!)), 1) - (V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!)) / (V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe! - A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) + 1.0) + A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 0)   '@20822 DS:2988,298c,29a0
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 1) = V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!   '@20939 DS:29a0
    L_BP16! = 0.0   '@20985 DS:2980
L_2099a:
    GOTO L_20d11   '@2099a
L_209a2:
    A_1176!(0, 0) = FX##(A_1176!(0, 0)) + 2.0   '@209a2 DS:299c
    IF NOT (FX##(A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) < V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!) THEN GOTO L_20b97   '@209d6 DS:298c,29a0
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) - 1.0), 0) = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) / ((A_111a!(RT_CINT%(FX##(V_100e!)), 1) - (V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!)) / (V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe! - A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) + 1.0) + A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 0)   '@20a22 DS:2988,298c,29a0
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) - 1.0), 1) = V_103e! - 0.800000011920928955078125## * V_105a! * V_0ffe!   '@20b3e DS:298c,29a0
    GOTO L_20c56   '@20b8f
L_20b97:
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) - 1.0), 0) = A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 0)   '@20b97 DS:298c
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) - 1.0), 1) = A_111a!(RT_CINT%(FX##(V_100e!) - 1.0), 1)   '@20bf3 DS:298c
L_20c56:
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 0) = A_111a!(RT_CINT%(FX##(V_100e!)), 0)   '@20c56
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0))), 1) = A_111a!(RT_CINT%(FX##(V_100e!)), 1)   '@20ca8
    L_BP16! = 1.0   '@20cfc DS:2988
L_20d11:
L_20d16:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@20d1b DS:2988
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) + 1.0), 0) = A_1176!(1, 0)   '@20d46 DS:2988
    A_1176!(RT_CINT%(FX##(A_1176!(0, 0)) + 1.0), 1) = A_1176!(1, 1)   '@20d96 DS:2988
    V_1052! = 0.0   '@20de5 DS:2980
    V_1056! = 0.0   '@20df6 DS:2980
    V_104e! = 0.0   '@20e07 DS:2980
    L_BP1e! = A_1176!(0, 0)   '@20e18
    FOR V_100e! = 1.0 TO L_BP1e!   '@20e38 DS:2988
    V_1052! = (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 1)) + A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) * (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 0)) * A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 1) - FX##(A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * A_1176!(RT_CINT%(FX##(V_100e!)), 1)) / 6.0 + V_1052!   '@20e40 DS:2988,29a4
    V_1056! = (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 0)) + A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 0)) * A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 1) - FX##(A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * A_1176!(RT_CINT%(FX##(V_100e!)), 1)) / 6.0 + V_1056!   '@20f23 DS:2988,29a4
    V_104e! = (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 0)) + A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (FX##(A_1176!(RT_CINT%(FX##(V_100e!)), 1)) - A_1176!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) / 2.0 + V_104e!   '@21004 DS:2988,299c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@210a1 DS:2988
    V_1052! = ABS(FX##(V_1052!) / V_104e!)   '@210cc
    V_1056! = ABS(FX##(V_1056!) / V_104e!)   '@210e5
L_21103:
    IF NOT (V_102e! = 2.0) THEN GOTO L_21d11   '@21103 DS:299c
    L_BP22! = FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##   '@2111e DS:29a0
    IF NOT ((FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0 >= FX##(L_BP22!)) THEN GOTO L_2135f   '@21138 DS:299c
    V_1062! = RT_SQR##(FX##(A_111a!(1, 0)) * V_105a! * V_0ffe! * 0.800000011920928955078125## - RT_POT##((FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##), (2.0)))   '@2117e DS:299c,29a0
    V_1062! = ATN(V_1062! / (FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##)) - FX##(FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## < FX##(0.0)) * V_0e5a!   '@211d1 DS:2980,299c,29a0
    V_1066! = 0.0   '@21267 DS:2980
    V_104e! = RT_POT##((FX##(A_111a!(1, 0))), (2.0)) * (V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) / 4.0   '@21278 DS:299c,29a8
    V_1052! = FX##(A_111a!(1, 0)) / 2.0 + RT_POT##((RT_SIN##(FX##(V_1062!))), (3.0)) * A_111a!(1, 0) / ((V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) * 3.0)   '@212d2 DS:2998,299c
    GOTO L_21ce4   '@21357
L_2135f:
    IF NOT ((FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0 <= FX##(L_BP22!)) THEN GOTO L_218a5   '@21360 DS:299c
    IF NOT ((FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0 + A_111a!(1, 1) >= FX##(L_BP22!)) THEN GOTO L_218a5   '@213a1 DS:299c
    V_1062! = RT_SQR##(FX##(A_111a!(1, 0)) * V_105a! * V_0ffe! * 0.800000011920928955078125## - RT_POT##((FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##), (2.0)))   '@213f6 DS:299c,29a0
    V_1062! = ATN(V_1062! / (FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##)) - FX##(FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## < FX##(0.0)) * V_0e5a!   '@21449 DS:2980,299c,29a0
    V_1066! = RT_SQR##((FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## - (FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0) * A_111a!(1, 1) - RT_POT##((FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## - (FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0), (2.0)))   '@214df DS:299c,29a0
    V_1066! = ATN(V_1066! / (FX##(A_111a!(1, 1)) / 2.0 - (FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## - (FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0))) - FX##(FX##(A_111a!(1, 1)) / 2.0 - (FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## - (FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0) < FX##(0.0)) * V_0e5a!   '@21598 DS:2980,299c,29a0
    V_104e! = RT_POT##((FX##(A_111a!(1, 0))), (2.0)) * (V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) / 4.0 - RT_POT##((FX##(A_111a!(1, 1))), (2.0)) * (V_1066! - RT_SIN##(FX##(V_1066!)) * RT_COS##(FX##(V_1066!))) / 4.0   '@21692 DS:299c,29a8
    V_1052! = RT_POT##((FX##(A_111a!(1, 0))), (3.0)) * RT_POT##((RT_SIN##(FX##(V_1062!))), (3.0)) - RT_POT##((FX##(A_111a!(1, 1))), (3.0)) * RT_POT##((RT_SIN##(FX##(V_1066!))), (3.0))   '@2173b DS:2998
    V_1052! = V_1052! / ((RT_POT##((FX##(A_111a!(1, 0))), (2.0)) * (V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) - RT_POT##((FX##(A_111a!(1, 1))), (2.0)) * (V_1066! - RT_SIN##(FX##(V_1066!)) * RT_COS##(FX##(V_1066!)))) * 3.0)   '@217c4 DS:2998,299c
    V_1052! = FX##(A_111a!(1, 0)) / 2.0 + V_1052!   '@21870 DS:299c
    GOTO L_21ce4   '@2189d
L_218a5:
    IF NOT ((FX##(A_111a!(1, 0)) - A_111a!(1, 1)) / 2.0 + A_111a!(1, 1) <= FX##(L_BP22!)) THEN GOTO L_21c0e   '@218a6 DS:299c
    IF NOT (A_111a!(1, 0) >= L_BP22!) THEN GOTO L_21c0e   '@218fc
    V_1062! = RT_SQR##(FX##(A_111a!(1, 0)) * V_105a! * V_0ffe! * 0.800000011920928955078125## - RT_POT##((FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##), (2.0)))   '@21922 DS:299c,29a0
    V_1062! = ATN(V_1062! / (FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125##)) - FX##(FX##(A_111a!(1, 0)) / 2.0 - FX##(V_105a!) * V_0ffe! * 0.800000011920928955078125## < FX##(0.0)) * V_0e5a!   '@21975 DS:2980,299c,29a0
    V_1066! = V_0e5a!   '@21a0b
    V_104e! = RT_POT##((FX##(A_111a!(1, 0))), (2.0)) * (V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) / 4.0 - RT_POT##((FX##(A_111a!(1, 1))), (2.0)) * V_0e5a! / 4.0   '@21a1c DS:299c,29a8
    V_1052! = RT_POT##((FX##(A_111a!(1, 0))), (3.0)) * RT_POT##((RT_SIN##(FX##(V_1062!))), (3.0)) - RT_POT##((FX##(A_111a!(1, 1))), (3.0)) * RT_POT##((RT_SIN##(FX##(V_1066!))), (3.0))   '@21aa4 DS:2998
    V_1052! = V_1052! / ((RT_POT##((FX##(A_111a!(1, 0))), (2.0)) * (V_1062! - RT_SIN##(FX##(V_1062!)) * RT_COS##(FX##(V_1062!))) - RT_POT##((FX##(A_111a!(1, 1))), (2.0)) * (V_1066! - RT_SIN##(FX##(V_1066!)) * RT_COS##(FX##(V_1066!)))) * 3.0)   '@21b2d DS:2998,299c
    V_1052! = FX##(A_111a!(1, 0)) / 2.0 + V_1052!   '@21bd9 DS:299c
    GOTO L_21ce4   '@21c06
L_21c0e:
    IF NOT (A_111a!(1, 0) <= L_BP22!) THEN GOTO L_21ce4   '@21c0f
    V_1062! = V_0e5a!   '@21c35
    V_1066! = V_0e5a!   '@21c46
    V_104e! = (RT_POT##((FX##(A_111a!(1, 0))), (2.0)) - RT_POT##((FX##(A_111a!(1, 1))), (2.0))) * V_0e5a! / 4.0   '@21c57 DS:299c,29a8
    V_1052! = FX##(A_111a!(1, 0)) / 2.0   '@21cb4 DS:299c
    GOTO L_21ce4   '@21cdc
L_21ce4:
    V_1056! = FX##(A_111a!(1, 0)) / 2.0   '@21ce4 DS:299c
L_21d11:
    IF NOT (FX##(V_0fc8!) >= 0.00200000009499490261077880859375##) THEN GOTO L_21d4e   '@21d11 DS:2994
    L_BP0e! = FX##(V_0dec!) * V_0e5e! / V_0e20!   '@21d2c
    GOTO L_21d93   '@21d46
L_21d4e:
    L_BP0e! = (1.0 - RT_POT##((1.0 - V_0fc8! / 0.00200000009499490261077880859375##), (2.0))) * V_0dec! * V_0e5e! / V_0e20!   '@21d4e DS:2988,2994,299c
L_21d93:
    V_1096! = FX##(V_104e!) * V_105e! * L_BP0e! / V_0e1c!   '@21d93
    V_109e! = (FX##(V_1052!) - V_1042!) * V_1096!   '@21db2
    V_10a2! = (FX##(V_1056!) - V_1046!) * V_1096!   '@21dcd
    ' END SUB   '@21de8
END SUB

SUB S_21dfd   ' entrada de SUB/FUNCTION (B$ENRA, locais 28 bytes) (0x21dfd)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    ' ---- FUN_2000_1dfd @0x21dfd  (021dfd_FUN_2000_1dfd.lift.txt; evidence_id (assembly): ev_bb94778e56437d52d532a163d3f94a21bd03c1bd3702689e8ca8d4d755825e1a)
    IF NOT (V_102e! = 1.0) THEN GOTO L_2247a   '@21e05 DS:2988
    A_10be!(0, 0) = 4.0   '@21e20 DS:29a8
    A_10be!(1, 0) = 0.0   '@21e40 DS:2980
    A_10be!(1, 1) = 0.0   '@21e63 DS:2980
    A_10be!(2, 0) = 0.0   '@21e84 DS:2980
    A_10be!(2, 1) = ABS(FX##(V_0fbc!))   '@21ea7
    A_10be!(3, 0) = ABS(FX##(V_0fb8!))   '@21ece
    A_10be!(3, 1) = ABS(FX##(V_0fbc!))   '@21ef4
    A_10be!(4, 0) = ABS(FX##(V_0fb8!))   '@21f1b
    A_10be!(4, 1) = 0.0   '@21f41 DS:2980
    A_10be!(5, 0) = 0.0   '@21f65 DS:2980
    A_10be!(5, 1) = 0.0   '@21f88 DS:2980
    A_10be!(6, 0) = 0.0   '@21fac DS:2980
    A_10be!(6, 1) = ABS(FX##(V_0fbc!))   '@21fcf
    L_BP0e! = FX##(A_10be!(0, 0)) + 1.0   '@21ff6 DS:2988
    FOR V_1006! = 1.0 TO L_BP0e!   '@2201b DS:2988
    A_111a!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0) - RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@22022 DS:29ac
    A_111a!(RT_CINT%(FX##(V_1006!)), 1) = RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0) + RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@220b3 DS:29ac
    A_10be!(RT_CINT%(FX##(V_1006!)), 0) = A_111a!(RT_CINT%(FX##(V_1006!)), 0)   '@22145
    A_10be!(RT_CINT%(FX##(V_1006!)), 1) = A_111a!(RT_CINT%(FX##(V_1006!)), 1)   '@22188
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@221cd DS:2988
    L_BP12! = A_10be!(0, 0)   '@221f8
    FOR V_1006! = 1.0 TO L_BP12!   '@22218 DS:2988
    IF NOT (V_1006! = 1.0) THEN GOTO L_22287   '@22220 DS:2988
    V_103a! = A_10be!(1, 0)   '@2223b
    V_103e! = A_10be!(1, 1)   '@2225e
    GOTO L_22360   '@2227f
L_22287:
    L_BP16! = A_10be!(RT_CINT%(FX##(V_1006!)), 0)   '@22287
    CALL MIXT_0877_Menor(V_103a!, L_BP16!, L_BP1a!)   '@222b0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_1006!)), 0) = L_BP16!   '@222c2
    V_103a! = L_BP1a!   '@222e6
    L_BP1e! = A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@222f0
    CALL MIXT_0877_Menor(V_103e!, L_BP1e!, L_BP22!)   '@2231a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_1006!)), 1) = L_BP1e!   '@2232c
    V_103e! = L_BP22!   '@22351
L_22360:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@22360 DS:2988
    L_BP26! = FX##(A_10be!(0, 0)) + 1.0   '@2238b DS:2988
    FOR V_1006! = 1.0 TO L_BP26!   '@223b0 DS:2988
    A_10be!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@223b8
    A_10be!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@22400
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@2244a DS:2988
L_2247a:
    IF NOT (V_102e! = 2.0) THEN GOTO L_22504   '@2247a DS:299c
    A_10be!(0, 0) = 1.0   '@22495 DS:2988
    A_10be!(1, 0) = ABS(FX##(V_0fbc!))   '@224b5
    A_10be!(1, 1) = ABS(FX##(V_0fc0!))   '@224db
L_22504:
    IF NOT (V_102e! = 3.0) THEN GOTO L_22665   '@22504 DS:2998
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 0) = A_10be!(1, 0)   '@2251f DS:2988
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 1) = A_10be!(1, 1)   '@2256f DS:2988
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 2.0), 0) = A_10be!(2, 0)   '@225be DS:299c
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 2.0), 1) = A_10be!(2, 1)   '@2260e DS:299c
L_22665:
    ' END SUB   '@22665
END SUB

SUB S_2267a   ' entrada de SUB/FUNCTION (B$ENRA, locais 84 bytes) (0x2267a)
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
    ' ---- FUN_2000_267a @0x2267a  (02267a_FUN_2000_267a.lift.txt; evidence_id (assembly): ev_15b1c92a5a450c7f873e9a3752e4565dbdba41f8baeb9df8f9b9e9e86eae7ebc)
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_23647   '@22682 DS:2988,2998
    A_111a!(0, 0) = A_10be!(0, 0)   '@226c0
    L_BP0e! = FX##(A_10be!(0, 0)) + 1.0   '@226ef DS:2988
    FOR V_1006! = 1.0 TO L_BP0e!   '@22714 DS:2988
    A_111a!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0) + RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1)   '@2271c DS:29ac
    A_111a!(RT_CINT%(FX##(V_1006!)), 1) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 1) - RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(RT_CINT%(FX##(V_1006!)), 0)   '@227ad DS:29ac
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@2283f DS:2988
    IF NOT (V_11ae% = 4) THEN GOTO L_229f3   '@2286a
    L_BP12! = A_10ec!(0, 0)   '@22879
    FOR V_1006! = 1.0 TO L_BP12!   '@22899 DS:2988
    A_1148!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0) + RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1)   '@228a0 DS:29ac
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1) - RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0)   '@22931 DS:29ac
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@229c3 DS:2988
L_229f3:
    V_103a! = A_111a!(1, 0)   '@229f3
    V_103e! = A_111a!(1, 1)   '@22a16
    L_BP16! = A_111a!(0, 0)   '@22a37
    FOR V_1006! = 2.0 TO L_BP16!   '@22a57 DS:2988,299c
    L_BP1a! = A_111a!(RT_CINT%(FX##(V_1006!)), 0)   '@22a5e
    CALL MIXT_0877_Menor(V_103a!, L_BP1a!, L_BP1e!)   '@22a87
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_111a!(RT_CINT%(FX##(V_1006!)), 0) = L_BP1a!   '@22a99
    V_103a! = L_BP1e!   '@22abd
    L_BP22! = A_111a!(RT_CINT%(FX##(V_1006!)), 1)   '@22ac7
    CALL MIXT_0877_Menor(V_103e!, L_BP22!, L_BP26!)   '@22af1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_111a!(RT_CINT%(FX##(V_1006!)), 1) = L_BP22!   '@22b03
    V_103e! = L_BP26!   '@22b28
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@22b32 DS:2988
    L_BP2a! = FX##(A_111a!(0, 0)) + 1.0   '@22b5d DS:2988
    FOR V_1006! = 1.0 TO L_BP2a!   '@22b82 DS:2988
    A_111a!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@22b8a
    A_111a!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@22bd2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@22c1c DS:2988
    IF NOT (V_11ae% = 4) THEN GOTO L_22dbb   '@22c47
    V_0ffe! = 1000.0   '@22c56 DS:29b0
    L_BP2e! = A_10ec!(0, 0)   '@22c67
    FOR V_1006! = 1.0 TO L_BP2e!   '@22c87 DS:2988
    A_1148!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_1148!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@22c8e
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_1148!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@22cd6
    L_BP32! = A_1148!(RT_CINT%(FX##(V_1006!)), 1)   '@22d20
    CALL MIXT_0877_Menor(V_0ffe!, L_BP32!, L_BP36!)   '@22d4a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = L_BP32!   '@22d5c
    V_0ffe! = L_BP36!   '@22d81
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@22d8b DS:2988
L_22dbb:
    V_1042! = 0.0   '@22dbb DS:2980
    V_1046! = 0.0   '@22dcc DS:2980
    V_104a! = 0.0   '@22ddd DS:2980
    V_103e! = 0.0   '@22dee DS:2980
    V_103a! = 0.0   '@22dff DS:2980
    L_BP3a! = A_111a!(0, 0)   '@22e10
    FOR V_1006! = 1.0 TO L_BP3a!   '@22e30 DS:2988
    V_1042! = (FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 1)) + A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 1)) * (FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 0)) * A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 1) - FX##(A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 0)) * A_111a!(RT_CINT%(FX##(V_1006!)), 1)) / 6.0 + V_1042!   '@22e38 DS:2988,29a4
    V_1046! = (FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 0)) + A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 0)) * (FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 0)) * A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 1) - FX##(A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 0)) * A_111a!(RT_CINT%(FX##(V_1006!)), 1)) / 6.0 + V_1046!   '@22f1b DS:2988,29a4
    V_104a! = (FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 0)) + A_10be!(RT_CINT%(FX##(V_1006!) + 1.0), 0)) * (FX##(A_10be!(RT_CINT%(FX##(V_1006!)), 1)) - A_10be!(RT_CINT%(FX##(V_1006!) + 1.0), 1)) / 2.0 + V_104a!   '@22ffc DS:2988,299c
    L_BP3e! = A_111a!(RT_CINT%(FX##(V_1006!)), 1)   '@23099
    CALL MIXT_082a_Maior(V_103e!, L_BP3e!, L_BP42!)   '@230c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_111a!(RT_CINT%(FX##(V_1006!)), 1) = L_BP3e!   '@230d5
    V_103e! = L_BP42!   '@230fa
    L_BP46! = A_111a!(RT_CINT%(FX##(V_1006!)), 0)   '@23104
    CALL MIXT_082a_Maior(V_103a!, L_BP46!, L_BP4a!)   '@2312d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_111a!(RT_CINT%(FX##(V_1006!)), 0) = L_BP46!   '@2313f
    V_103a! = L_BP4a!   '@23163
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@2316d DS:2988
    IF NOT (V_11ae% = 4) THEN GOTO L_231c5   '@23198
    V_0ffe! = FX##(V_103e!) - V_0ffe!   '@231a7
    GOTO L_231db   '@231bd
L_231c5:
    V_0ffe! = FX##(V_103e!) - V_0e8e!   '@231c5
L_231db:
    V_1042! = ABS(FX##(V_1042!) / V_104a!)   '@231db
    V_1046! = ABS(FX##(V_1046!) / V_104a!)   '@231f4
    IF NOT (V_11ae% = 1) THEN GOTO L_2350d   '@2320d
    V_0fd8! = 0.0   '@2321c DS:2980
    L_BP4e! = A_111a!(0, 0)   '@2322d
    FOR V_100e! = 1.0 TO L_BP4e!   '@2324d DS:2988
    V_0fd8! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 1))), (3.0)) / 3.0 + RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (3.0)) / 12.0) + V_0fd8!   '@23254 DS:2988,2998,29b4
    V_0fd8! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) * (RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0 + A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)) - RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0), (2.0))) / 2.0 + V_0fd8!   '@23330 DS:2988,2998,299c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@2349a DS:2988
    V_0fd8! = ABS(FX##(V_0fd8!)) - RT_POT##((FX##(V_1042!)), (2.0)) * V_104a!   '@234c5 DS:299c
    V_100a! = FX##(V_103e!) - V_1042!   '@234f2
L_2350d:
    V_105e! = 0.85000002384185791015625##   '@2350d DS:29b8
    L_BP52! = A_111a!(0, 0)   '@2351e
    FOR V_1006! = 1.0 TO L_BP52!   '@2353e DS:2988
    IF NOT (ABS(FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 1)) - A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 1)) > 0.100000001490116119384765625##) THEN GOTO L_23617   '@23546 DS:2988,29bc
    IF NOT (FX##(A_111a!(RT_CINT%(FX##(V_1006!)), 0)) < A_111a!(RT_CINT%(FX##(V_1006!) + 1.0), 0) - 0.100000001490116119384765625##) THEN GOTO L_23612   '@235a2 DS:2988,29c0
    V_105e! = 0.800000011920928955078125##   '@235f9 DS:29a0
    GOTO L_23642   '@2360a
L_23612:
L_23617:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@23617 DS:2988
L_23642:
L_23647:
    IF NOT (V_102e! = 2.0) THEN GOTO L_23c85   '@23647 DS:299c
    A_111a!(0, 0) = A_10be!(0, 0)   '@23662
    A_111a!(1, 0) = A_10be!(1, 0)   '@23691
    A_111a!(1, 1) = A_10be!(1, 1)   '@236c6
    V_103a! = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(1, 0) / 2.0 + (RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(1, 0) / 2.0 - FX##(A_10be!(1, 0)) / 2.0)   '@236f7 DS:299c,29ac
    V_103e! = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(1, 0) / 2.0 - RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10be!(1, 0) / 2.0 - FX##(A_10be!(1, 0)) / 2.0   '@23789 DS:299c,29ac
    V_0ffe! = FX##(A_111a!(1, 0)) - V_0e8e!   '@2381b
    IF NOT (V_11ae% = 4) THEN GOTO L_23ae3   '@23843
    L_BP56! = A_10ec!(0, 0)   '@23852
    FOR V_1006! = 1.0 TO L_BP56!   '@23872 DS:2988
    A_1148!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0) + RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1)   '@2387a DS:29ac
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = RT_COS##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1) - RT_SIN##(FX##(V_0e5a!) * V_1036! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0)   '@2390b DS:29ac
    A_1148!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_1148!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@2399d
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_1148!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@239e5
    L_BP5a! = A_1148!(RT_CINT%(FX##(V_1006!)), 1)   '@23a2f
    CALL MIXT_0877_Menor(V_0ffe!, L_BP5a!, L_BP5e!)   '@23a59
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = L_BP5a!   '@23a6b
    V_0ffe! = L_BP5e!   '@23a90
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@23a9a DS:2988
    V_0ffe! = ABS(FX##(V_0fbc!)) - V_0ffe!   '@23ac5
L_23ae3:
    V_103a! = A_10be!(1, 0)   '@23ae3
    V_103e! = A_10be!(1, 0)   '@23b06
    V_104a! = (RT_POT##((FX##(A_10be!(1, 0))), (2.0)) - RT_POT##((FX##(A_10be!(1, 1))), (2.0))) * V_0e5a! / 4.0   '@23b29 DS:299c,29a8
    V_1042! = FX##(A_111a!(1, 0)) / 2.0   '@23b86 DS:299c
    V_1046! = FX##(A_111a!(1, 0)) / 2.0   '@23bae DS:299c
    IF NOT (V_11ae% = 1) THEN GOTO L_23c6f   '@23bd6
    V_0fd8! = (RT_POT##((FX##(A_10be!(1, 0))), (4.0)) - RT_POT##((FX##(A_10be!(1, 1))), (4.0))) * V_0e5a! / 64.0   '@23be5 DS:29a8,29c4
    V_100a! = FX##(A_111a!(1, 0)) / 2.0   '@23c42 DS:299c
L_23c6f:
    V_105e! = 0.800000011920928955078125##   '@23c6f DS:29a0
L_23c85:
    ' END SUB   '@23c85
END SUB

SUB S_23c9a   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x23c9a)
    ' ---- FUN_2000_3c9a @0x23c9a  (023c9a_FUN_2000_3c9a.lift.txt; evidence_id (assembly): ev_c7c93c6e75c1e1a24146d9a60127f55d6fece06f0905a899d36571dc97b4a25a)
    IF NOT (V_0e14$ = "SISTRUT") THEN GOTO L_24337   '@23ca2 DS:29c8
    V_0e92! = 0.60000002384185791015625##   '@23cb9 DS:29d4
    V_0e96! = 0.75   '@23cca DS:29d8
    V_0e9a! = 1.5   '@23cdb DS:29dc
    V_0e8e! = 2.0   '@23cec DS:299c
    V_0e9e$ = "N"   '@23cfd DS:29e0
    V_0ea2$ = "N"   '@23d0f DS:29e0
    V_0ea8$ = "S"   '@23d21 DS:29e6
    V_0eac! = 2.5   '@23d33 DS:29ec
    V_0ea6% = 10   '@23d44
    V_0eb2% = 5   '@23d4f
    V_0eb0% = 14   '@23d5a
    V_0eb4! = 0.800000011920928955078125##   '@23d65 DS:29a0
    V_0eb8! = 0.5   '@23d76 DS:29f0
    V_0ebc! = 6.0   '@23d87 DS:29a4
    V_0ec0$ = "S"   '@23d98 DS:29e6
    V_0ec4$ = "S"   '@23daa DS:29e6
    V_0ec8! = 5.0   '@23dbc DS:29f4
    REDIM A_0ecc!(-32768 TO -32768)   '@23dcd
    REDIM A_0efa!(-32768 TO -32768)   '@23ddb
    REDIM A_0efa!(0 TO 12)   '@23de4
    REDIM A_0ecc!(0 TO 12)   '@23e01
    V_106e$ = "3.2 ,4   ,5   ,6.3 ,8   ,10  ,12.5,16  ,20  ,22.2,25  ,32  ,40"   '@23e19 DS:29f8
    FOR V_1016! = 0.0 TO 12.0   '@23e2b DS:2980,2988,29b4
    A_0ecc!(RT_CINT%(FX##(V_1016!))) = VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 5.0 + 1.0))))   '@23e38 DS:2988,29f4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@23e87 DS:2988,29b4
    V_106e$ = ".08 ,.125,.2  ,.315,.5  ,.8  ,1.25,2   ,3.15,3.88,5   ,8   ,12.5"   '@23eb0 DS:2a3a
    FOR V_1016! = 0.0 TO 12.0   '@23ec2 DS:2980,2988,29b4
    A_0efa!(RT_CINT%(FX##(V_1016!))) = VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 5.0 + 1.0))))   '@23ed0 DS:2988,29f4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@23f1f DS:2988,29b4
    REDIM A_1394%(-32768 TO -32768)   '@23f48
    REDIM A_13c2%(-32768 TO -32768)   '@23f56
    REDIM A_1394%(0 TO 12)   '@23f5f
    REDIM A_13c2%(0 TO 12)   '@23f7c
    V_106e$ = "4 ,4 ,4 ,4 ,5 ,5 ,6 ,6 ,6 ,8 ,8 ,8 ,10"   '@23f94 DS:2a7e
    FOR V_1016! = 0.0 TO 12.0   '@23fa6 DS:2980,2988,29b4
    A_1394%(RT_CINT%(FX##(V_1016!))) = RT_CINT%(FX##(VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 3.0 + 1.0))))))   '@23fb4 DS:2988,2998
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@24009 DS:2988,29b4
    V_106e$ = "25 ,30 ,35 ,35 ,40 ,40 ,40 ,40 ,40 ,40 ,40 ,40 ,40"   '@24032 DS:2aa8
    FOR V_1016! = 0.0 TO 12.0   '@24044 DS:2980,2988,29b4
    A_13c2%(RT_CINT%(FX##(V_1016!))) = RT_CINT%(FX##(VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 4.0 + 1.0))))))   '@24052 DS:2988,29a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@240a7 DS:2988,29b4
    REDIM A_0f28!(-32768 TO -32768, -32768 TO -32768)   '@240d0
    REDIM A_0f28!(0 TO 3, 0 TO 3)   '@240de
    V_106e$ = ".5  ,.7  ,.7  ,2   ,.7  ,.9  ,.85 ,2   ,.7  ,.85 ,1   ,2   ,2   ,2   ,2   ,100"   '@24102 DS:2ade
    FOR V_1016! = 0.0 TO 3.0   '@24114 DS:2980,2988,2998
    FOR V_101a! = 0.0 TO 3.0   '@24122 DS:2980,2988,2998
    A_0f28!(RT_CINT%(FX##(V_1016!)), RT_CINT%(FX##(V_101a!))) = VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 20.0 + 1.0 + FX##(V_101a!) * 5.0))))   '@24130 DS:2988,29f4,2b30
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101a!   '@24197 DS:2988,2998
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@241c3 DS:2988,2998
    REDIM A_0f56%(-32768 TO -32768, -32768 TO -32768)   '@241ef
    REDIM A_0f56%(0 TO 12, 0 TO 1)   '@241fd
    V_106e$ = "0  ,0  ,0  ,0  ,0  ,63 ,63 ,63 ,63 ,80 ,80 ,80 ,80"   '@24221 DS:2b34
    V_1072$ = "0  ,0  ,0  ,0  ,0  ,120,150,150,200,250,250,300,300"   '@24233 DS:2b6a
    FOR V_1016! = 0.0 TO 12.0   '@24245 DS:2980,2988,29b4
    A_0f56%(RT_CINT%(FX##(V_1016!)), 0) = RT_CINT%(FX##(VAL(RT_MID2$((V_106e$), (RT_CINT%(FX##(V_1016!) * 4.0 + 1.0))))))   '@24252 DS:2988,29a8
    A_0f56%(RT_CINT%(FX##(V_1016!)), 1) = RT_CINT%(FX##(VAL(RT_MID2$((V_1072$), (RT_CINT%(FX##(V_1016!) * 4.0 + 1.0))))))   '@242aa DS:2988,29a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@24303 DS:2988,29b4
    GOTO L_24f35   '@2432f
L_24337:
    V_106e$ = "NOME"   '@24337 DS:2ba2
    OPEN RT_ARQ$(V_0e18$ + V_0e14$ + ".PIP") FOR INPUT AS #1   '@24349 DS:2baa,2bb0
L_2437c:
    LINE INPUT #1, V_106e$   '@2437c DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_2437c   '@2439f DS:2bbc
    LINE INPUT #1, V_106e$   '@243be DS:2bb8
    V_0e8e! = VAL(V_106e$)   '@243e1
L_24400:
    LINE INPUT #1, V_106e$   '@24400 DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_24400   '@24423 DS:2bbc
    REDIM A_0ecc!(-32768 TO -32768)   '@24442
    REDIM A_0efa!(-32768 TO -32768)   '@24450
    REDIM A_0efa!(0 TO 12)   '@24459
    REDIM A_0ecc!(0 TO 12)   '@24476
    FOR V_1016! = 0.0 TO 12.0   '@2448e DS:2980,2988,29b4
    LINE INPUT #1, V_106e$   '@2449c DS:2bb8
    A_0ecc!(RT_CINT%(FX##(V_1016!))) = VAL(RT_MID2$((V_106e$), (10)))   '@244bf
    A_0efa!(RT_CINT%(FX##(V_1016!))) = VAL(RT_MID2$((V_106e$), (25)))   '@244fd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@2453b DS:2988,29b4
L_2456c:
    LINE INPUT #1, V_106e$   '@2456c DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_2456c   '@2458f DS:2bbc
    LINE INPUT #1, V_106e$   '@245ae DS:2bb8
    V_0e92! = VAL(V_106e$)   '@245d1
    LINE INPUT #1, V_106e$   '@245eb DS:2bb8
    V_0e96! = VAL(V_106e$)   '@2460e
    LINE INPUT #1, V_106e$   '@24628 DS:2bb8
    V_0e9a! = VAL(V_106e$)   '@2464b
    LINE INPUT #1, V_106e$   '@24665 DS:2bb8
    V_0eb0% = RT_CINT%(FX##(VAL(V_106e$)))   '@24688
    LINE INPUT #1, V_106e$   '@246a3 DS:2bb8
    V_0eb2% = RT_CINT%(FX##(VAL(V_106e$)))   '@246c6
    LINE INPUT #1, V_106e$   '@246e1 DS:2bb8
    V_0ea8$ = RT_MID$((V_106e$), (1), (1))   '@24704
    LINE INPUT #1, V_106e$   '@24721 DS:2bb8
    V_0eac! = VAL(V_106e$)   '@24744
    LINE INPUT #1, V_106e$   '@2475e DS:2bb8
    V_0ea6% = RT_CINT%(FX##(VAL(V_106e$)))   '@24781
    LINE INPUT #1, V_106e$   '@2479c DS:2bb8
    V_0e9e$ = RT_MID$((V_106e$), (1), (1))   '@247bf
    LINE INPUT #1, V_106e$   '@247dc DS:2bb8
    V_0ea2$ = RT_MID$((V_106e$), (1), (1))   '@247ff
L_24822:
    LINE INPUT #1, V_106e$   '@24822 DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_24822   '@24845 DS:2bbc
    LINE INPUT #1, V_106e$   '@24864 DS:2bb8
    REDIM A_0f28!(-32768 TO -32768, -32768 TO -32768)   '@24887
    REDIM A_0f28!(0 TO 3, 0 TO 3)   '@24895
    FOR V_1016! = 0.0 TO 3.0   '@248b9 DS:2980,2988,2998
    INPUT #1, V_106e$   '@248c6
    FOR V_101a! = 0.0 TO 3.0   '@248e6 DS:2980,2988,2998
    INPUT #1, V_106e$   '@248f4
    A_0f28!(RT_CINT%(FX##(V_1016!)), RT_CINT%(FX##(V_101a!))) = VAL(V_106e$)   '@24914
    IF NOT (VAL(V_106e$) = 0.0#) THEN GOTO L_249a5   '@2494f DS:2bc2
    A_0f28!(RT_CINT%(FX##(V_1016!)), RT_CINT%(FX##(V_101a!))) = 100.0   '@24973 DS:2bca
L_249a5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101a!   '@249a5 DS:2988,2998
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@249d1 DS:2988,2998
L_24a02:
    LINE INPUT #1, V_106e$   '@24a02 DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_24a02   '@24a25 DS:2bbc
    LINE INPUT #1, V_106e$   '@24a44 DS:2bb8
    V_0eb4! = VAL(V_106e$)   '@24a67
    LINE INPUT #1, V_106e$   '@24a81 DS:2bb8
    V_0eb8! = VAL(V_106e$)   '@24aa4
    LINE INPUT #1, V_106e$   '@24abe DS:2bb8
    V_0ebc! = VAL(V_106e$)   '@24ae1
    LINE INPUT #1, V_106e$   '@24afb DS:2bb8
    V_0ec0$ = RT_MID$((V_106e$), (1), (1))   '@24b1e
    LINE INPUT #1, V_106e$   '@24b3b DS:2bb8
    V_0ec4$ = RT_MID$((V_106e$), (1), (1))   '@24b5e
    LINE INPUT #1, V_106e$   '@24b7b DS:2bb8
    V_0ec8! = VAL(V_106e$)   '@24b9e
L_24bbe:
    LINE INPUT #1, V_106e$   '@24bbe DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_24bbe   '@24be1 DS:2bbc
    REDIM A_1394%(-32768 TO -32768)   '@24c00
    REDIM A_13c2%(-32768 TO -32768)   '@24c0e
    REDIM A_1394%(0 TO 12)   '@24c17
    REDIM A_13c2%(0 TO 12)   '@24c34
    FOR V_1016! = 0.0 TO 12.0   '@24c4c DS:2980,2988,29b4
    INPUT #1, V_106e$   '@24c5a
    INPUT #1, V_106e$   '@24c7a
    INPUT #1, V_106e$   '@24c9a
    A_1394%(RT_CINT%(FX##(V_1016!))) = RT_CINT%(FX##(VAL(V_106e$)))   '@24cba
    INPUT #1, V_106e$   '@24cf0
    A_13c2%(RT_CINT%(FX##(V_1016!))) = RT_CINT%(FX##(VAL(V_106e$)))   '@24d10
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@24d46 DS:2988,29b4
L_24d78:
    LINE INPUT #1, V_106e$   '@24d78 DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF RT_MID$((V_106e$), (1), (1)) = "*" THEN GOTO L_24d78   '@24d9b DS:2bbc
    REDIM A_0f56%(-32768 TO -32768, -32768 TO -32768)   '@24dba
    REDIM A_0f56%(0 TO 12, 0 TO 1)   '@24dc8
    FOR V_1016! = 0.0 TO 12.0   '@24dec DS:2980,2988,29b4
    INPUT #1, V_106e$   '@24dfa
    INPUT #1, V_106e$   '@24e1a
    INPUT #1, V_106e$   '@24e3a
    A_0f56%(RT_CINT%(FX##(V_1016!)), 0) = RT_CINT%(FX##(VAL(V_106e$)) * 10.0#)   '@24e5a DS:2bce
    INPUT #1, V_106e$   '@24e98
    A_0f56%(RT_CINT%(FX##(V_1016!)), 1) = RT_CINT%(FX##(VAL(V_106e$)) * 10.0#)   '@24eb8 DS:2bce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@24ef7 DS:2988,29b4
    RT_CLOSE   '@24f23 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
L_24f35:
    ' END SUB   '@24f35
END SUB

SUB S_24f4a (P_BP12!, P_BP10!, P_BP0e!, P_BP0c!, P_BP0a!, P_BP08!, P_BP06!)   ' entrada de SUB/FUNCTION (B$ENRA, locais 68 bytes) (0x24f4a)
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
    ' ---- FUN_2000_4f4a @0x24f4a  (024f4a_FUN_2000_4f4a.lift.txt; evidence_id (assembly): ev_40303f2040efabb88e72ede849e67c12add0dd89bd32ae64b90d6ac004f868b9)
    L_BP0e! = FX##(V_0e5a!) / 4.0   '@24f52 DS:29a8
    L_BP12! = FX##(V_0e5a!) / 2.0   '@24f67 DS:299c
    IF NOT (P_BP10! >= P_BP0c! AND P_BP12! > P_BP0e!) THEN GOTO L_252ce   '@24f7c
    L_BP16! = ATN((FX##(P_BP10!) - P_BP0c!) / (FX##(P_BP12!) - P_BP0e!))   '@24fbe
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_250ea   '@24feb
    IF NOT ((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!) > (FX##(P_BP10!) - P_BP0c!) / (FX##(P_BP12!) - P_BP0e!)) THEN GOTO L_250a6   '@2502d
    L_BP1a! = ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@25071
    GOTO L_250e5   '@2509e
L_250a6:
    L_BP1a! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@250a6 DS:299c
L_250e5:
L_250ea:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_2519a   '@250ea
    IF NOT (P_BP0e! = P_BP0a!) THEN GOTO L_25160   '@2512c
    L_BP1a! = L_BP12!   '@25149
    GOTO L_25195   '@25158
L_25160:
    L_BP1a! = V_0e5a! - ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0e!) - P_BP0a!))   '@25160
L_25195:
L_2519a:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_2520e   '@2519a
    L_BP1a! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@251dc
L_2520e:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_252c9   '@2520e
    IF NOT (P_BP0a! = P_BP0e!) THEN GOTO L_2528a   '@25250
    L_BP1a! = 1.5 * FX##(V_0e5a!)   '@2526d DS:29dc
    GOTO L_252c4   '@25282
L_2528a:
    L_BP1a! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@2528a DS:299c
L_252c4:
L_252c9:
L_252ce:
    IF NOT (P_BP10! > P_BP0c! AND P_BP12! <= P_BP0e!) THEN GOTO L_2563e   '@252ce
    L_BP16! = ATN((FX##(P_BP0e!) - P_BP12!) / (FX##(P_BP10!) - P_BP0c!)) + L_BP12!   '@25310
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_2548e   '@25341
    L_BP1e! = 0.0000999999974737875163555145263671875##   '@25383 DS:2bd6
    L_BP22! = FX##(P_BP0e!) - P_BP0a!   '@25393
    CALL MIXT_082a_Maior(L_BP1e!, L_BP22!, L_BP26!)   '@253a5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a! = 0.0000999999974737875163555145263671875##   '@253b7 DS:2bd6
    L_BP2e! = FX##(P_BP0e!) - P_BP12!   '@253c1
    CALL MIXT_082a_Maior(L_BP2a!, L_BP2e!, L_BP32!)   '@253d3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(P_BP08!) - P_BP0c!) / L_BP26! < (FX##(P_BP10!) - P_BP0c!) / L_BP32!) THEN GOTO L_2544a   '@253e4
    L_BP1a! = V_0e5a! - ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0e!) - P_BP0a!))   '@2540d
    GOTO L_25489   '@25442
L_2544a:
    L_BP1a! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@2544a DS:29ec
L_25489:
L_2548e:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_25502   '@2548e
    L_BP1a! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@254d0
L_25502:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_255bd   '@25502
    IF NOT (P_BP0a! = P_BP0e!) THEN GOTO L_2557e   '@25544
    L_BP1a! = 1.5 * FX##(V_0e5a!)   '@25561 DS:29dc
    GOTO L_255b8   '@25576
L_2557e:
    L_BP1a! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@2557e DS:299c
L_255b8:
L_255bd:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_25639   '@255bd
    L_BP1a! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@255ff DS:299c
L_25639:
L_2563e:
    IF NOT (P_BP10! <= P_BP0c! AND P_BP12! < P_BP0e!) THEN GOTO L_2592f   '@2563e
    L_BP16! = ATN((FX##(P_BP0c!) - P_BP10!) / (FX##(P_BP0e!) - P_BP12!)) + V_0e5a!   '@25680
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_257b6   '@256b2
    IF NOT ((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!) > (FX##(P_BP0c!) - P_BP10!) / (FX##(P_BP0e!) - P_BP12!)) THEN GOTO L_25772   '@256f4
    L_BP1a! = ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!)) + V_0e5a!   '@25738
    GOTO L_257b1   '@2576a
L_25772:
    L_BP1a! = 3.0 * FX##(V_0e5a!) + ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!))   '@25772 DS:2998
L_257b1:
L_257b6:
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_25832   '@257b6
    L_BP1a! = 1.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0a!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP08!))   '@257f8 DS:29dc
L_25832:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_258ae   '@25832
    L_BP1a! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@25874 DS:299c
L_258ae:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_2592a   '@258ae
    L_BP1a! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@258f0 DS:29ec
L_2592a:
L_2592f:
    IF NOT (P_BP10! < P_BP0c! AND P_BP12! >= P_BP0e!) THEN GOTO L_25c76   '@2592f
    L_BP16! = 1.5 * FX##(V_0e5a!) + ATN((FX##(P_BP12!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP10!))   '@25971 DS:29dc
    IF NOT (P_BP08! < P_BP0c! AND P_BP0a! >= P_BP0e!) THEN GOTO L_25afd   '@259ab
    L_BP36! = 0.0000999999974737875163555145263671875##   '@259ed DS:2bd6
    L_BP3a! = FX##(P_BP0a!) - P_BP0e!   '@259fd
    CALL MIXT_082a_Maior(L_BP36!, L_BP3a!, L_BP3e!)   '@25a0f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP42! = 0.0000999999974737875163555145263671875##   '@25a21 DS:2bd6
    L_BP46! = FX##(P_BP12!) - P_BP0e!   '@25a2b
    CALL MIXT_082a_Maior(L_BP42!, L_BP46!, L_BP4a!)   '@25a3d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(P_BP0c!) - P_BP08!) / L_BP3e! < (FX##(P_BP0c!) - P_BP10!) / L_BP4a!) THEN GOTO L_25ab9   '@25a4e
    L_BP1a! = 2.0 * FX##(V_0e5a!) - ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0a!) - P_BP0e!))   '@25a77 DS:299c
    GOTO L_25af8   '@25ab1
L_25ab9:
    L_BP1a! = 3.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0a!) - P_BP0e!) / (FX##(P_BP0c!) - P_BP08!))   '@25ab9 DS:2bda
L_25af8:
L_25afd:
    IF NOT (P_BP08! >= P_BP0c! AND P_BP0a! > P_BP0e!) THEN GOTO L_25b79   '@25afd
    L_BP1a! = 2.0 * FX##(V_0e5a!) + ATN((FX##(P_BP08!) - P_BP0c!) / (FX##(P_BP0a!) - P_BP0e!))   '@25b3f DS:299c
L_25b79:
    IF NOT (P_BP08! > P_BP0c! AND P_BP0a! <= P_BP0e!) THEN GOTO L_25bf5   '@25b79
    L_BP1a! = 2.5 * FX##(V_0e5a!) + ATN((FX##(P_BP0e!) - P_BP0a!) / (FX##(P_BP08!) - P_BP0c!))   '@25bbb DS:29ec
L_25bf5:
    IF NOT (P_BP08! <= P_BP0c! AND P_BP0a! < P_BP0e!) THEN GOTO L_25c71   '@25bf5
    L_BP1a! = 3.0 * FX##(V_0e5a!) + ATN((FX##(P_BP0c!) - P_BP08!) / (FX##(P_BP0e!) - P_BP0a!))   '@25c37 DS:2998
L_25c71:
L_25c76:
    L_BP4e! = (FX##(L_BP16!) + L_BP1a!) / 2.0   '@25c76 DS:299c
    V_1006! = RT_COS##(FX##(L_BP4e!)) / RT_SIN##(FX##(L_BP4e!) - L_BP16!) * P_BP06! + P_BP0e!   '@25c8e
    V_100a! = RT_SIN##(FX##(L_BP4e!)) / RT_SIN##(FX##(L_BP4e!) - L_BP16!) * P_BP06! + P_BP0c!   '@25cc3
    ' END SUB   '@25cf8
END SUB

SUB S_25d0d   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x25d0d)
    DIM L_BP0e!
    DIM L_BP12!
    ' ---- FUN_2000_5d0d @0x25d0d  (025d0d_FUN_2000_5d0d.lift.txt; evidence_id (assembly): ev_5e990ca0a67a78d384cb126536759f3b085571c4ab0327e03df9f9eda47844b0)
    L_BP0e! = V_105a!   '@25d15
    IF NOT (L_BP0e! > 10.0) THEN GOTO L_25d58   '@25d25 DS:2990
    V_0fcc! = V_0fc8!   '@25d3f
    GOTO L_25def   '@25d50
L_25d58:
    IF NOT (FX##(V_100a!) / V_0ffe! <= FX##(L_BP0e!)) THEN GOTO L_25da5   '@25d59
    V_0fcc! = (1.0 - V_100a! / (FX##(V_105a!) * V_0ffe!)) * V_0fc8!   '@25d72 DS:2988
    GOTO L_25def   '@25d9d
L_25da5:
    IF NOT (FX##(V_100a!) / V_0ffe! > FX##(L_BP0e!)) THEN GOTO L_25def   '@25da6
    V_0fcc! = (V_100a! / (FX##(V_105a!) * V_0ffe!) - 1.0) * V_0fc8!   '@25dbf DS:298c
    GOTO L_25def   '@25de7
L_25def:
    IF NOT (V_0e7e$ = "A") THEN GOTO L_25e6c   '@25def DS:2bde
    V_0fc4! = 2100.0 * FX##(V_0fcc!)   '@25e06 DS:2be4
    IF NOT (V_0dec! / (FX##(V_0e24!) * 2100.0) * V_0e62! < FX##(V_0fcc!)) THEN GOTO L_25e64   '@25e1c DS:2be4
    V_0fc4! = FX##(V_0dec!) * V_0e62! / V_0e24!   '@25e49
L_25e64:
    GOTO L_26024   '@25e64
L_25e6c:
    L_BP12! = V_0fcc!   '@25e6c
    IF NOT (0.699999988079071044921875## / (FX##(V_0e24!) * 2100.0) * V_0e62! * V_0dec! >= FX##(L_BP12!)) THEN GOTO L_25ecb   '@25e7c DS:2be4,2be8
    V_0fc4! = FX##(V_0fcc!) * 2100.0   '@25ead DS:2be4
    GOTO L_2601f   '@25ec3
L_25ecb:
    IF NOT (V_0dec! / (FX##(V_0e24!) * 2100.0) * V_0e62! + 0.00200000009499490261077880859375## <= FX##(L_BP12!)) THEN GOTO L_25f1a   '@25ecc DS:2994,2be4
    V_0fc4! = FX##(V_0dec!) * V_0e62! / V_0e24!   '@25ef7
    GOTO L_2601f   '@25f12
L_25f1a:
    V_0fc4! = RT_POT##((0.000476190471090376377105712890625## - 1.39999997615814208984375## / (FX##(V_0e62!) * V_0dec! * 45.0) * V_0e24!), (2.0)) - RT_POT##((FX##(V_0e24!)), (2.0)) * (RT_POT##((0.699999988079071044921875##), (2.0)) / 45.0 - V_0fcc!) / (RT_POT##((FX##(V_0dec!) * V_0e62!), (2.0)) * 45.0) * 4.0   '@25f1a DS:299c,29a8,2be8,2bec,2bf0,2bf4
    V_0fc4! = (1.39999997615814208984375## / (FX##(V_0e62!) * V_0dec! * 45.0) * V_0e24! - 0.000476190471090376377105712890625## + RT_SQR##(FX##(V_0fc4!))) * RT_POT##((FX##(V_0dec!) * V_0e62!), (2.0)) / (RT_POT##((FX##(V_0e24!)), (2.0)) * 2.0) * 45.0   '@25fab DS:299c,2bf0,2bf4,2bf8
L_2601f:
L_26024:
    IF NOT (FX##(V_105a!) * V_0ffe! < FX##(V_100a!)) THEN GOTO L_26060   '@26024
    V_0fc4! = -V_0fc4!   '@26044
    GOTO L_26079   '@26058
L_26060:
    V_0fcc! = -V_0fcc!   '@26060
L_26079:
    ' END SUB   '@26079
END SUB

SUB S_2608e   ' entrada de SUB/FUNCTION (B$ENRA, locais 28 bytes) (0x2608e)
    DIM L_BP0e$
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    ' ---- FUN_2000_608e @0x2608e  (02608e_FUN_2000_608e.lift.txt; evidence_id (assembly): ev_896a88ff5fde7af8081d2c434b67c4bcdc521d956e6dea077d41571c93e9c78c)
    RT_VIEWPRINT 23, 25   '@26096
    V_1016! = 3.0   '@260a8 DS:2998
    IF NOT (A_11c8!(0) < V_1016!) THEN GOTO L_26101   '@260b9
    V_1016! = A_11c8!(0)   '@260e2
L_26101:
L_26106:
    LOCATE 23, 1   '@2610b
    COLOR 13   '@26126
    PRINT RT_TAB$(15); ""; "<"; CHR$(27); ">Anteriores      <R>etornar      Proximos<"; CHR$(26); "> "   '@2613c DS:2bb8,2bfc,2c02,2c30
    V_106e$ = "MOS"   '@2618c DS:2c36
    GOSUB L_263b1   '@2619e
    RT_VIEWPRINT 23, 25   '@261ab
    CALL MIXT_07f1_LimpaTeclado   '@261bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_261cc:
    V_106e$ = RT_INKEY$   '@261d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_106e$ = "") THEN GOTO L_26203   '@261e5 DS:2bb8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_261cc   '@261fc
L_26203:
    L_BP0e$ = V_106e$   '@26203
    IF NOT (CHR$(0) + CHR$(75) <> L_BP0e$) THEN GOTO L_26253   '@26215
    IF NOT (L_BP0e$ = "4") THEN GOTO L_2629f   '@26241 DS:2c3e
L_26253:
    L_BP12! = 1.0   '@26253 DS:2988
    L_BP16! = FX##(V_1016!) - 5.0   '@26264 DS:2c44
    CALL MIXT_082a_Maior(L_BP12!, L_BP16!, L_BP1a!)   '@26273
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1016! = L_BP1a!   '@26285
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26106   '@2628f
L_2629f:
    IF NOT (CHR$(0) + CHR$(77) <> L_BP0e$) THEN GOTO L_262d8   '@2629f
    IF NOT (L_BP0e$ = "6") THEN GOTO L_2634b   '@262c6 DS:2c48
L_262d8:
    L_BP1e! = A_11c8!(0)   '@262d8
    L_BP22! = FX##(V_1016!) + 5.0   '@262f7 DS:29f4
    CALL MIXT_0877_Menor(L_BP1e!, L_BP22!, L_BP26!)   '@26306
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_11c8!(0) = L_BP1e!   '@26318
    V_1016! = L_BP26!   '@26331
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26106   '@2633b
L_2634b:
    IF NOT (L_BP0e$ <> "R") THEN GOTO L_2636f   '@2634b DS:2c4e
    IF NOT (L_BP0e$ = "r") THEN GOTO L_26395   '@2635d DS:2c54
L_2636f:
    SOUND 2200, 2.0   '@2636f DS:299c
    GOTO L_26952   '@26385
L_26395:
    BEEP   '@26395
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_261cc   '@263a4
    ' ---- F_263ac @0x263ac  (0263ac_F_263ac.lift.txt; evidence_id (assembly): ev_90066935fb5f949e9b562417f596dc1b60cdaa3d589e455b4045ef437281b2ba)
L_263b1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 02608e_FUN_2000_608e
    RT_VIEWPRINT 24, 25   '@263b6
    RT_CLS 2   '@263c8
    IF NOT (V_1016! > 2.0) THEN GOTO L_264d6   '@263d6 DS:299c
    COLOR 11   '@263f1
    LOCATE 24, 1   '@26407
    PRINT USING " N##(###.##)"; RT_PU#(RT_SNG!(FX##(V_1016!) - 2.0), " N##(###.##)", 1); RT_PU#(A_11c8!(RT_CINT%(FX##(V_1016!) - 2.0)), " N##(###.##)", 2);   '@26422 DS:2c5a,2c6a
    COLOR 3   '@26476
    LOCATE 25, 2   '@2648c
    PRINT A_11f6$(RT_CINT%(FX##(V_1016!) - 2.0));   '@264aa DS:2c6a
L_264d6:
    IF NOT (V_1016! > 1.0) THEN GOTO L_265d9   '@264d6 DS:2988
    COLOR 11   '@264f1
    LOCATE 24, 17   '@26507
    PRINT USING " N##(###.##)"; RT_PU#(RT_SNG!(FX##(V_1016!) - 1.0), " N##(###.##)", 1); RT_PU#(A_11c8!(RT_CINT%(FX##(V_1016!) - 1.0)), " N##(###.##)", 2);   '@26525 DS:298c,2c5a
    COLOR 3   '@26579
    LOCATE 25, 18   '@2658f
    PRINT A_11f6$(RT_CINT%(FX##(V_1016!) - 1.0));   '@265ad DS:298c
L_265d9:
    COLOR 14   '@265d9
    LOCATE 24, 33   '@265ef
    PRINT USING " N##(###.##)"; RT_PU#(V_1016!, " N##(###.##)", 1); RT_PU#(A_11c8!(RT_CINT%(FX##(V_1016!))), " N##(###.##)", 2);   '@2660d DS:2c5a
    COLOR 3   '@26650
    LOCATE 25, 34   '@26666
    PRINT A_11f6$(RT_CINT%(FX##(V_1016!)));   '@26684
    IF NOT (FX##(V_1016!) + 1.0 <= FX##(A_11c8!(0))) THEN GOTO L_267bc   '@266a6 DS:2988
    COLOR 11   '@266d4
    LOCATE 24, 49   '@266ea
    PRINT USING " N##(###.##)"; RT_PU#(RT_SNG!(FX##(V_1016!) + 1.0), " N##(###.##)", 1); RT_PU#(A_11c8!(RT_CINT%(FX##(V_1016!) + 1.0)), " N##(###.##)", 2);   '@26708 DS:2988,2c5a
    COLOR 3   '@2675c
    LOCATE 25, 50   '@26772
    PRINT A_11f6$(RT_CINT%(FX##(V_1016!) + 1.0));   '@26790 DS:2988
L_267bc:
    IF NOT (FX##(V_1016!) + 2.0 <= FX##(A_11c8!(0))) THEN GOTO L_26943   '@267bc DS:299c
    V_1006! = A_11c8!(0)   '@267ea
    V_1072$ = ".."   '@26809 DS:2c6e
    IF NOT (V_106e$ = "MOS") THEN GOTO L_2685a   '@2681b DS:2c36
    V_1006! = FX##(V_1016!) + 2.0   '@26832 DS:299c
    V_1072$ = ""   '@26848 DS:2bb8
L_2685a:
    COLOR 11   '@2685a
    LOCATE 24, 64   '@26870
    PRINT V_1072$;   '@2688e
    PRINT USING "N##(###.##)"; RT_PU#(V_1006!, "N##(###.##)", 1); RT_PU#(A_11c8!(RT_CINT%(FX##(V_1006!))), "N##(###.##)", 2);   '@2689c DS:2c74
    COLOR 3   '@268df
    LOCATE 25, 64   '@268f5
    PRINT V_1072$; A_11f6$(RT_CINT%(FX##(V_1006!)));   '@26913
L_26943:
    RETURN   '@26943
L_26952:   ' entrada vinda de 02608e_FUN_2000_608e
    ' @26952 libera strings locais (L_BP0e)
    ' END SUB   '@2695b
END SUB

SUB S_3047d   ' entrada de SUB/FUNCTION (B$ENRA, locais 98 bytes) (0x3047d)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1c%
    DIM L_BP1e%
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP28%
    DIM L_BP2a%
    DIM L_BP2e!
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP44%
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
    ' ---- FUN_3000_047d @0x3047d  (03047d_FUN_3000_047d.lift.txt; evidence_id (assembly): ev_1013543b35dbdfec2db160e7cc7c64b66e0337d91f96d8280d54572e59868508)
L_3048f:
    REDIM A_10ec!(-32768 TO -32768, -32768 TO -32768)   '@30494
    REDIM A_1148!(-32768 TO -32768, -32768 TO -32768)   '@304a2
    REDIM A_10ec!(0 TO CINT(V_0e30!), 0 TO 2)   '@304ab
    REDIM A_1148!(0 TO CINT(V_0e30!), 0 TO 1)   '@304d6
    REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@30501
    REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@3050f
    REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@30518
    REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@30543
    RT_VIEWPRINT 1, 25   '@3056e
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@30580 DS:2dbe
    LOCATE 15, 3   '@305b1
    PRINT CHR$(218); RT_STRINGC$((74), (196)); CHR$(191)   '@305cf
    V_1016! = 16.0   '@30605 DS:2dc2
L_3061c:
    LOCATE RT_CINT%(FX##(V_1016!)), 3   '@3061c
    COLOR RT_CINT%(FX##(V_0dc0!))   '@30641
    PRINT CHR$(179); RT_STRINGC$((74), (32)); CHR$(179);   '@3065e
    COLOR 0   '@30694
    PRINT CHR$(219)   '@306a9
    V_1016! = FX##(V_1016!) + 1.0   '@306bd DS:2dc6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_1016! = 23.0) THEN GOTO L_3061c   '@306d3 DS:2dca
    LOCATE 23, 3   '@306ee
    COLOR RT_CINT%(FX##(V_0dc0!))   '@3070c
    PRINT CHR$(192); RT_STRINGC$((74), (196)); CHR$(217);   '@30729
    COLOR 0   '@3075f
    PRINT CHR$(219)   '@30774
    LOCATE 24, 5   '@30788
    PRINT RT_STRINGC$((75), (219))   '@307a6
    LOCATE 17, 6   '@307be
    COLOR 14   '@307dc
    L_BP1c% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6)   '@307f2
    IF NOT (L_BP1c% = 1) THEN GOTO L_30970   '@3081c
    V_102e! = 1.0   '@3082a DS:2dc6
    V_0fb8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@3083b
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@3086e
    V_106a! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 3)   '@308a1
    PRINT "Bw ="; V_0fb8!; "cm       Hw ="; V_0fbc!; "cm"   '@308d1 DS:2dce,2dd6,2de8
    IF NOT (V_106a! > 0.0) THEN GOTO L_30968   '@3090b DS:2dee
    LOCATE 17, 40   '@30926
    PRINT "Rotacao ="; V_106a!; "graus"   '@30944 DS:2df2,2e00
L_30968:
    GOTO L_30c4e   '@30968
L_30970:
    IF NOT (L_BP1c% = 2) THEN GOTO L_30a8a   '@30970
    V_102e! = 2.0   '@30979 DS:2e0a
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@3098a
    V_0fc0! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@309bd
    V_106a! = 0.0   '@309f0 DS:2dee
    PRINT "Diametro externo ="; V_0fbc!; "cm"   '@30a01 DS:2de8,2e0e
    IF NOT (V_0fc0! > 0.0) THEN GOTO L_30a82   '@30a25 DS:2dee
    LOCATE 17, 40   '@30a40
    PRINT "Diametro interno ="; V_0fc0!; "cm"   '@30a5e DS:2de8,2e24
L_30a82:
    GOTO L_30c4e   '@30a82
L_30a8a:
    IF NOT (L_BP1c% = 3) THEN GOTO L_30c4e   '@30a8a
    V_102e! = 3.0   '@30a93 DS:2e3a
    L_BP1e% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@30aa4
    A_10be!(0, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@30ace
    V_106a! = 0.0   '@30b10 DS:2dee
    L_BP22! = A_10be!(0, 0)   '@30b21
    FOR V_1012! = 0.0 TO L_BP22!   '@30b41 DS:2dc6,2dee
    A_10be!(RT_CINT%(FX##(V_1012!)), 0) = FX##(A_1366%(L_BP1e%, RT_CINT%(FX##(V_1012!)), 0)) / 10.0   '@30b48 DS:2e3e
    A_10be!(RT_CINT%(FX##(V_1012!)), 1) = FX##(A_1366%(L_BP1e%, RT_CINT%(FX##(V_1012!)), 1)) / 10.0   '@30b97 DS:2e3e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1012!   '@30be8 DS:2dc6
    PRINT "Poligonal com"; A_10be!(0, 0); "vertices"   '@30c13 DS:2e42,2e54
    GOTO L_30c4e   '@30c46
L_30c4e:
    CALL S_21dfd   '@30c4e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    LOCATE 16, 6   '@30c58
    PRINT "NIVEL ";   '@30c76 DS:2e60
    IF NOT (V_0fec! = 0.0) THEN GOTO L_30cdb   '@30c84 DS:2dee
    PRINT A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0));   '@30c9f
    GOTO L_30d24   '@30cd3
L_30cdb:
    PRINT A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0));   '@30cdb DS:2e6a
L_30d24:
    PRINT " a "; A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0));   '@30d24 DS:2e6e
    COLOR RT_CINT%(FX##(V_0dc0!))   '@30d6c
    IF NOT (V_102e! = 1.0) THEN GOTO L_32332   '@30d89 DS:2dc6
L_30da9:
    LOCATE 18, 5   '@30dae
    PRINT RT_TAB$(76); ""; " "   '@30dcc DS:2cae,2e76
    LOCATE 18, 5   '@30dec
    CALL MIXT_07f1_LimpaTeclado   '@30e0a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Bitola utilizada nos cantos da Secao *RETORNO* ", V_106e$   '@30e14 DS:2e7c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_30e5d   '@30e2e
    V_106e$ = "RETORNO"   '@30e43 DS:2eb0
    GOTO L_33d34   '@30e55
L_30e5d:
    V_1086! = VAL(V_106e$)   '@30e5d
    FOR L_BP26! = 0.0 TO 12.0   '@30e77 DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_1086!) THEN GOTO L_30ebc   '@30e84
    GOTO L_30ee2   '@30eb4
L_30ebc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@30ebc DS:2dc6,2ebc
L_30ee2:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_30f0e   '@30ee2 DS:2ebc
    BEEP   '@30efc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30da9   '@30f06
L_30f0e:
    A_10ec!(0, 0) = 4.0   '@30f0e DS:2dbe
    A_10ec!(1, 0) = FX##(V_1086!) / 20.0 + V_0e8e!   '@30f2e DS:2ec0
    A_10ec!(1, 1) = A_10ec!(1, 0)   '@30f5b
    A_10ec!(1, 2) = L_BP26!   '@30f8e
    A_10ec!(2, 0) = FX##(V_1086!) / 20.0 + V_0e8e!   '@30fae DS:2ec0
    A_10ec!(2, 1) = FX##(V_0fbc!) - V_0e8e! - FX##(V_1086!) / 20.0   '@30fdb DS:2ec0
    A_10ec!(2, 2) = L_BP26!   '@31011
    A_10ec!(3, 0) = FX##(V_0fb8!) - V_0e8e! - FX##(V_1086!) / 20.0   '@3102e DS:2ec0
    A_10ec!(3, 1) = A_10ec!(2, 1)   '@31063
    A_10ec!(3, 2) = L_BP26!   '@3109a
    A_10ec!(4, 0) = A_10ec!(3, 0)   '@310ba
    A_10ec!(4, 1) = A_10ec!(1, 1)   '@310ef
    A_10ec!(4, 2) = L_BP26!   '@31123
    V_108e! = 4.0   '@31143 DS:2dbe
    V_1086! = L_BP26!   '@31154
L_31169:
    LOCATE 19, 5   '@3116e
    PRINT RT_TAB$(76); ""; " "   '@3118c DS:2cae,2e76
    LOCATE 19, 5   '@311ac
    CALL MIXT_07f1_LimpaTeclado   '@311ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Outra Bitola utilizada nas faces da Secao *MESMA* ", V_106e$   '@311d4 DS:2ec4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_108a! = VAL(V_106e$)   '@311ee
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_31244   '@31208
    V_108a! = A_0ecc!(RT_CINT%(FX##(V_1086!)))   '@3121d
L_31244:
    FOR L_BP26! = 0.0 TO 12.0   '@31244 DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_108a!) THEN GOTO L_3128a   '@31252
    GOTO L_312b0   '@31282
L_3128a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@3128a DS:2dc6,2ebc
L_312b0:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_312dc   '@312b0 DS:2ebc
    BEEP   '@312ca
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31169   '@312d4
L_312dc:
    V_108a! = L_BP26!   '@312dc
L_312f1:
    LOCATE 20, 5   '@312f6
    PRINT " "; RT_TAB$(76); ""; " "   '@31314 DS:2cae,2e76
    LOCATE 20, 5   '@3133d
    CALL MIXT_07f1_LimpaTeclado   '@3135b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de barras (por face) internas as de canto em Bw *0* ", V_106e$   '@31365 DS:2efc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = VAL(V_106e$)   '@3137f
    L_BP28% = (L_BP16! < 0.0)   '@31398 DS:2dee
    IF NOT ((INT(FX##(L_BP16!)) <> FX##(L_BP16!) OR L_BP28%) <> 0) THEN GOTO L_313ee   '@313c0
    BEEP   '@313dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_312f1   '@313e6
L_313ee:
    IF NOT (L_BP16! = 0.0) THEN GOTO L_31410   '@313ee DS:2dee
    GOTO L_315cb   '@31408
L_31410:
    L_BP0e! = V_108a!   '@31410
    IF NOT (V_1086! <> V_108a!) THEN GOTO L_315c6   '@31420
    LOCATE 22, 5   '@3143b
    PRINT " "; RT_TAB$(76); ""; " "   '@31459 DS:2cae,2e76
    LOCATE 22, 5   '@31482
    PRINT " Bitola da Armadura  <1> "; LTRIM$(STR$(A_0ecc!(RT_CINT%(FX##(V_1086!))))); "   <*2*> "; LTRIM$(STR$(A_0ecc!(RT_CINT%(FX##(V_108a!)))));   '@314a0 DS:2f3c,2f5a
    CALL MIXT_07f1_LimpaTeclado   '@31515
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", V_106e$   '@3151f DS:2e76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 22, 5   '@31539
    PRINT " "; RT_TAB$(76); ""; " "   '@31557 DS:2cae,2e76
    IF NOT (V_106e$ = "1") THEN GOTO L_315c1   '@31580 DS:2f68
    L_BP0e! = V_1086!   '@31597
    V_108e! = FX##(L_BP16!) * 2.0 + V_108e!   '@315a7 DS:2e0a
L_315c1:
L_315c6:
L_315cb:
    LOCATE 21, 5   '@315d0
    PRINT RT_TAB$(76); ""; " "   '@315ee DS:2cae,2e76
    LOCATE 21, 5   '@3160e
    CALL MIXT_07f1_LimpaTeclado   '@3162c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de barras (por face) internas as de canto em Hw *0* ", V_106e$   '@31636 DS:2f6e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a! = VAL(V_106e$)   '@31650
    L_BP2a% = (L_BP1a! < 0.0)   '@31669 DS:2dee
    IF NOT ((INT(FX##(L_BP1a!)) <> FX##(L_BP1a!) OR L_BP2a%) <> 0) THEN GOTO L_316bf   '@31691
    BEEP   '@316ad
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_315cb   '@316b7
L_316bf:
    IF NOT (L_BP1a! = 0.0) THEN GOTO L_316e1   '@316bf DS:2dee
    GOTO L_3189c   '@316d9
L_316e1:
    L_BP12! = V_108a!   '@316e1
    IF NOT (V_1086! <> V_108a!) THEN GOTO L_31897   '@316f1
    LOCATE 22, 5   '@3170c
    PRINT " "; RT_TAB$(76); ""; " "   '@3172a DS:2cae,2e76
    LOCATE 22, 5   '@31753
    PRINT " Bitola da Armadura  <1> "; LTRIM$(STR$(A_0ecc!(RT_CINT%(FX##(V_1086!))))); "   <*2*> "; LTRIM$(STR$(A_0ecc!(RT_CINT%(FX##(V_108a!)))));   '@31771 DS:2f3c,2f5a
    CALL MIXT_07f1_LimpaTeclado   '@317e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", V_106e$   '@317f0 DS:2e76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 22, 5   '@3180a
    PRINT " "; RT_TAB$(76); ""; " "   '@31828 DS:2cae,2e76
    IF NOT (V_106e$ = "1") THEN GOTO L_31892   '@31851 DS:2f68
    L_BP12! = V_1086!   '@31868
    V_108e! = FX##(L_BP1a!) * 2.0 + V_108e!   '@31878 DS:2e0a
L_31892:
L_31897:
L_3189c:
    L_BP2e! = FX##(A_10ec!(0, 0)) + L_BP1a!   '@318a1
    FOR V_1016! = FX##(A_10ec!(0, 0)) + 1.0 TO L_BP2e!   '@318c4 DS:2dc6
    V_1006! = FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0 + V_0e8e! + (FX##(V_1016!) - A_10ec!(0, 0)) * (V_0fbc! - (FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0 + V_0e8e!) * 2.0) / (FX##(L_BP1a!) + 1.0)   '@318e0 DS:2dc6,2e0a,2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 0) = FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0 + V_0e8e!   '@3196c DS:2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 1) = V_1006!   '@319b5
    A_10ec!(RT_CINT%(FX##(V_1016!)), 2) = L_BP12!   '@319e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@31a07 DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + L_BP1a!   '@31a32
    L_BP32! = FX##(A_10ec!(0, 0)) + L_BP16!   '@31a65
    FOR V_1016! = FX##(A_10ec!(0, 0)) + 1.0 TO L_BP32!   '@31a88 DS:2dc6
    V_1006! = FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0 + V_0e8e! + (FX##(V_1016!) - A_10ec!(0, 0)) * (V_0fb8! - (FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0 + V_0e8e!) * 2.0) / (FX##(L_BP16!) + 1.0)   '@31aa4 DS:2dc6,2e0a,2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 0) = V_1006!   '@31b30
    A_10ec!(RT_CINT%(FX##(V_1016!)), 1) = FX##(V_0fbc!) - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0   '@31b5a DS:2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 2) = L_BP0e!   '@31bac
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@31bd3 DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + L_BP16!   '@31bfe
    L_BP36! = FX##(A_10ec!(0, 0)) + L_BP1a!   '@31c31
    FOR V_1016! = FX##(A_10ec!(0, 0)) + 1.0 TO L_BP36!   '@31c54 DS:2dc6
    V_1006! = FX##(V_0fbc!) - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0 - (FX##(V_1016!) - A_10ec!(0, 0)) * (V_0fbc! - (FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0 + V_0e8e!) * 2.0) / (FX##(L_BP1a!) + 1.0)   '@31c70 DS:2dc6,2e0a,2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 0) = FX##(V_0fb8!) - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP12!)))) / 20.0   '@31d04 DS:2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 1) = V_1006!   '@31d55
    A_10ec!(RT_CINT%(FX##(V_1016!)), 2) = L_BP12!   '@31d80
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@31da7 DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + L_BP1a!   '@31dd2
    L_BP3a! = FX##(A_10ec!(0, 0)) + L_BP16!   '@31e05
    FOR V_1016! = FX##(A_10ec!(0, 0)) + 1.0 TO L_BP3a!   '@31e28 DS:2dc6
    V_1006! = FX##(V_0fb8!) - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0 - (FX##(V_1016!) - A_10ec!(0, 0)) * (V_0fb8! - (FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0 + V_0e8e!) * 2.0) / (FX##(L_BP16!) + 1.0)   '@31e44 DS:2dc6,2e0a,2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 0) = V_1006!   '@31ed8
    A_10ec!(RT_CINT%(FX##(V_1016!)), 1) = FX##(A_0ecc!(RT_CINT%(FX##(L_BP0e!)))) / 20.0 + V_0e8e!   '@31f02 DS:2ec0
    A_10ec!(RT_CINT%(FX##(V_1016!)), 2) = L_BP0e!   '@31f4c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@31f73 DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + L_BP16!   '@31f9e
    IF NOT (V_1086! = V_108a!) THEN GOTO L_32025   '@31fd1
    V_108e! = A_10ec!(0, 0)   '@31fec
    V_1092! = 0.0   '@3200c DS:2dee
    GOTO L_3204a   '@3201d
L_32025:
    V_1092! = FX##(A_10ec!(0, 0)) - V_108e!   '@32025
L_3204a:
    L_BP3e! = A_10ec!(0, 0)   '@3204a
    FOR V_1006! = 1.0 TO L_BP3e!   '@3206a DS:2dc6
    A_1148!(RT_CINT%(FX##(V_1006!)), 0) = RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0) - RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1)   '@32072 DS:2fae
    A_1148!(RT_CINT%(FX##(V_1006!)), 1) = RT_SIN##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 0) + RT_COS##(FX##(V_0e5a!) * V_106a! / 180.0) * A_10ec!(RT_CINT%(FX##(V_1006!)), 1)   '@32103 DS:2fae
    A_10ec!(RT_CINT%(FX##(V_1006!)), 0) = A_1148!(RT_CINT%(FX##(V_1006!)), 0)   '@32195
    A_10ec!(RT_CINT%(FX##(V_1006!)), 1) = A_1148!(RT_CINT%(FX##(V_1006!)), 1)   '@321d8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@3221d DS:2dc6
    L_BP42! = A_10ec!(0, 0)   '@32248
    FOR V_1006! = 1.0 TO L_BP42!   '@32268 DS:2dc6
    A_10ec!(RT_CINT%(FX##(V_1006!)), 0) = FX##(A_10ec!(RT_CINT%(FX##(V_1006!)), 0)) - V_103a!   '@32270
    A_10ec!(RT_CINT%(FX##(V_1006!)), 1) = FX##(A_10ec!(RT_CINT%(FX##(V_1006!)), 1)) - V_103e!   '@322b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1006!   '@32302 DS:2dc6
L_32332:
    IF NOT (V_102e! = 2.0) THEN GOTO L_32c53   '@32332 DS:2e0a
L_32352:
    LOCATE 18, 5   '@32357
    PRINT RT_TAB$(76); ""; " "   '@32375 DS:2cae,2e76
    LOCATE 18, 5   '@32395
    CALL MIXT_07f1_LimpaTeclado   '@323b3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Bitola utilizada na periferia EXTERNA da Secao *RETORNO* ", V_106e$   '@323bd DS:2fb2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_32406   '@323d7
    V_106e$ = "RETORNO"   '@323ec DS:2eb0
    GOTO L_33d34   '@323fe
L_32406:
    V_1086! = VAL(V_106e$)   '@32406
    FOR L_BP26! = 0.0 TO 12.0   '@32420 DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_1086!) THEN GOTO L_32466   '@3242e
    GOTO L_3248c   '@3245e
L_32466:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@32466 DS:2dc6,2ebc
L_3248c:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_324b8   '@3248c DS:2ebc
    BEEP   '@324a6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32352   '@324b0
L_324b8:
L_324bd:
    LOCATE 19, 5   '@324c2
    PRINT RT_TAB$(76); ""; " "   '@324e0 DS:2cae,2e76
    LOCATE 19, 5   '@32500
    CALL MIXT_07f1_LimpaTeclado   '@3251e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de barras no perimetro EXTERNO *0* ", V_106e$   '@32528 DS:2ff0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_108e! = VAL(V_106e$)   '@32542
    L_BP44% = (V_108e! < 0.0)   '@3255c DS:2dee
    IF NOT ((INT(FX##(V_108e!)) <> FX##(V_108e!) OR L_BP44%) <> 0) THEN GOTO L_325ab   '@32587
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_324bd   '@325a3
L_325ab:
    A_10ec!(0, 0) = V_108e!   '@325ab
    L_BP48! = V_108e!   '@325cb
    FOR V_100e! = 1.0 TO L_BP48!   '@325dc DS:2dc6
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_COS##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_108e!) * (FX##(V_0fbc!) / 2.0 - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP26!)))) / 20.0) * 10.0)) / 10.0   '@325e4 DS:2e0a,2e3e,2ec0,3020
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_SIN##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_108e!) * (FX##(V_0fbc!) / 2.0 - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(L_BP26!)))) / 20.0) * 10.0)) / 10.0   '@3267e DS:2e0a,2e3e,2ec0,3020
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = L_BP26!   '@32719
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@32740 DS:2dc6
    IF NOT (V_108e! = 0.0 AND V_0fc0! = 0.0) THEN GOTO L_327bb   '@3276b DS:2dee
    BEEP   '@327a9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_324bd   '@327b3
L_327bb:
    V_1086! = L_BP26!   '@327bb
    V_108a! = V_1086!   '@327cb
    V_1092! = 0.0   '@327dc DS:2dee
    IF NOT (V_0fc0! > 0.0) THEN GOTO L_32c4e   '@327ed DS:2dee
L_3280d:
    LOCATE 20, 5   '@32812
    PRINT RT_TAB$(76); ""; " "   '@32830 DS:2cae,2e76
    LOCATE 20, 5   '@32850
    CALL MIXT_07f1_LimpaTeclado   '@3286e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Bitola utilizada na periferia INTERNA da Secao *MESMA* ", V_106e$   '@32878 DS:3024
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_108a! = VAL(V_106e$)   '@32892
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_328e8   '@328ac
    V_108a! = A_0ecc!(RT_CINT%(FX##(V_1086!)))   '@328c1
L_328e8:
    FOR L_BP26! = 0.0 TO 12.0   '@328e8 DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_108a!) THEN GOTO L_3292e   '@328f6
    GOTO L_32954   '@32926
L_3292e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@3292e DS:2dc6,2ebc
L_32954:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_32980   '@32954 DS:2ebc
    BEEP   '@3296e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3280d   '@32978
L_32980:
    LOCATE 21, 5   '@32980
    PRINT RT_TAB$(76); ""; " "   '@3299e DS:2cae,2e76
    LOCATE 21, 5   '@329be
    CALL MIXT_07f1_LimpaTeclado   '@329dc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de barras no perimetro INTERNO *0* ", V_106e$   '@329e6 DS:3060
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1092! = VAL(V_106e$)   '@32a00
    IF NOT (V_1092! < 0.0) THEN GOTO L_32a3d   '@32a1a DS:2dee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3280d   '@32a35
L_32a3d:
    L_BP4c! = FX##(A_10ec!(0, 0)) + V_1092!   '@32a3d
    FOR V_100e! = FX##(A_10ec!(0, 0)) + 1.0 TO L_BP4c!   '@32a61 DS:2dc6
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_COS##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_1092!) * (FX##(V_0fc0!) / 2.0 + V_0e8e! + FX##(A_0ecc!(RT_CINT%(FX##(L_BP26!)))) / 20.0) * 10.0)) / 10.0   '@32a7e DS:2e0a,2e3e,2ec0,3020
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_SIN##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_1092!) * (FX##(V_0fc0!) / 2.0 + V_0e8e! + FX##(A_0ecc!(RT_CINT%(FX##(L_BP26!)))) / 20.0) * 10.0)) / 10.0   '@32b18 DS:2e0a,2e3e,2ec0,3020
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = L_BP26!   '@32bb3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@32bda DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + V_1092!   '@32c05
    V_108a! = L_BP26!   '@32c39
L_32c4e:
L_32c53:
    IF NOT (V_102e! = 3.0) THEN GOTO L_33c73   '@32c53 DS:2e3a
L_32c73:
    LOCATE 18, 5   '@32c78
    PRINT RT_TAB$(76); ""; " "   '@32c96 DS:2cae,2e76
    LOCATE 18, 5   '@32cb6
    CALL MIXT_07f1_LimpaTeclado   '@32cd4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Bitola utilizada nos cantos da Poligonal *RETORNO* ", V_106e$   '@32cde DS:3090
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_32d27   '@32cf8
    V_106e$ = "RETORNO"   '@32d0d DS:2eb0
    GOTO L_33d34   '@32d1f
L_32d27:
    V_1086! = VAL(V_106e$)   '@32d27
    FOR L_BP26! = 0.0 TO 12.0   '@32d41 DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_1086!) THEN GOTO L_32d86   '@32d4e
    GOTO L_32dac   '@32d7e
L_32d86:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@32d86 DS:2dc6,2ebc
L_32dac:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_32dd8   '@32dac DS:2ebc
    BEEP   '@32dc6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32c73   '@32dd0
L_32dd8:
    A_10ec!(0, 0) = A_10be!(0, 0)   '@32dd8
    V_0fa4! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 0)   '@32e07
    V_0fa8! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 1)   '@32e40
    L_BP50! = A_10be!(0, 0)   '@32e7a
    FOR V_100e! = 1.0 TO L_BP50!   '@32e9a DS:2dc6
    L_BP54! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@32ea2
    L_BP58! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@32ecc
    L_BP5c! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@32ef1 DS:2dc6
    L_BP60! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@32f1a DS:2dc6
    L_BP64! = FX##(A_0ecc!(RT_CINT%(FX##(L_BP26!)))) / 20.0 + V_0e8e!   '@32f44 DS:2ec0
    CALL S_24f4a(V_0fa4!, V_0fa8!, L_BP54!, L_BP58!, L_BP5c!, L_BP60!, L_BP64!)   '@32f6d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BP60!   '@32f8f DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP5c!   '@32fb9 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BP58!   '@32fe2
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP54!   '@33007
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = FX##(RT_CINT%(10.0 * FX##(V_1006!))) / 10.0   '@3302a DS:2e3e
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = FX##(RT_CINT%(10.0 * FX##(V_100a!))) / 10.0   '@33068 DS:2e3e
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = L_BP26!   '@330a7
    V_0fa4! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@330ce
    V_0fa8! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@330f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@33123 DS:2dc6
    V_108e! = A_10be!(0, 0)   '@3314e
    V_1092! = 0.0   '@3316e DS:2dee
    V_1086! = L_BP26!   '@3317f
    V_108a! = V_1086!   '@3318f
    LOCATE 19, 5   '@331a0
    PRINT RT_TAB$(76); ""; " "   '@331be DS:2cae,2e76
    LOCATE 19, 5   '@331de
    CALL MIXT_07f1_LimpaTeclado   '@331fc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Crio barras nas faces laterais, intermediarias as de canto S/*N* ", V_106e$   '@33206 DS:30c8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_33c6e   '@33220 DS:2d1a
L_33242:
    LOCATE 20, 5   '@33247
    PRINT RT_TAB$(76); ""; " "   '@33265 DS:2cae,2e76
    LOCATE 20, 5   '@33285
    CALL MIXT_07f1_LimpaTeclado   '@332a3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Bitola utilizada nas faces da Poligonal *MESMA* ", V_106e$   '@332ad DS:310e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_108a! = VAL(V_106e$)   '@332c7
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_3331d   '@332e1
    V_108a! = A_0ecc!(RT_CINT%(FX##(V_1086!)))   '@332f6
L_3331d:
    FOR L_BP26! = 0.0 TO 12.0   '@3331d DS:2dc6,2dee,2ebc
    IF NOT (A_0ecc!(RT_CINT%(FX##(L_BP26!))) = V_108a!) THEN GOTO L_33362   '@3332a
    GOTO L_33388   '@3335a
L_33362:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@33362 DS:2dc6,2ebc
L_33388:
    IF NOT (L_BP26! > 12.0) THEN GOTO L_333b4   '@33388 DS:2ebc
    BEEP   '@333a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33242   '@333ac
L_333b4:
    L_BP68! = A_10be!(0, 0)   '@333b4
    FOR V_100e! = 1.0 TO L_BP68!   '@333d4 DS:2dc6
    LOCATE 21, 5   '@333dc
    PRINT RT_TAB$(76); ""; " "   '@333fa DS:2cae,2e76
    LOCATE 21, 5   '@3341a
    COLOR 7   '@33438
    PRINT USING " face## (###.##,###.##) e (###.##,###.##)"; RT_PU#(V_100e!, " face## (###.##,###.##) e (###.##,###.##)", 1); RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!)), 0), " face## (###.##,###.##) e (###.##,###.##)", 2); RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!)), 1), " face## (###.##,###.##) e (###.##,###.##)", 3); RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0), " face## (###.##,###.##) e (###.##,###.##)", 4); RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1), " face## (###.##,###.##) e (###.##,###.##)", 5);   '@3344e DS:2dc6,3144
    COLOR 7   '@33512
    PRINT USING " c =###.##cm"; RT_PU#(RT_SNG!(RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)))), " c =###.##cm", 1);   '@33528 DS:2dc6,2e0a,3172
    COLOR 14   '@335ec
    PRINT "  use Cn para Cada n"   '@33602 DS:3182
    COLOR RT_CINT%(FX##(V_0dc0!))   '@33610
    LOCATE 22, 5   '@3362d
    PRINT RT_TAB$(76); ""; " "   '@3364b DS:2cae,2e76
    LOCATE 22, 5   '@3366b
    CALL MIXT_07f1_LimpaTeclado   '@33689
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de barras *0* ", V_106e$   '@33693 DS:319a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(RT_MID$((V_106e$), (1), (1))) = "C") THEN GOTO L_338a0   '@336ad DS:31b4
    IF NOT (RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)), (2.0))) <= FX##(VAL(RT_MID2$((V_106e$), (2))))) THEN GOTO L_337be   '@336d5 DS:2dc6,2e0a
    V_106e$ = ""   '@337a4 DS:2cae
    GOTO L_3389b   '@337b6
L_337be:
    V_106e$ = STR$(RT_CINT%(RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)), (2.0))) / VAL(RT_MID2$((V_106e$), (2)))))   '@337be DS:2dc6,2e0a
L_3389b:
L_338a0:
    IF NOT (VAL(V_106e$) > 0.0#) THEN GOTO L_33c09   '@338a0 DS:31ba
    V_1032! = INT(FX##(VAL(V_106e$)))   '@338c4
    V_1006! = (FX##(A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10ec!(RT_CINT%(FX##(V_100e!)), 0)) / (FX##(V_1032!) + 1.0)   '@338e5 DS:2dc6
    V_100a! = (FX##(A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10ec!(RT_CINT%(FX##(V_100e!)), 1)) / (FX##(V_1032!) + 1.0)   '@3393f DS:2dc6
    IF NOT (A_10be!(0, 0) = V_100e!) THEN GOTO L_33a65   '@3399b
    V_1006! = (FX##(A_10ec!(1, 0)) - A_10ec!(RT_CINT%(FX##(V_100e!)), 0)) / (FX##(V_1032!) + 1.0)   '@339c5 DS:2dc6
    V_100a! = (FX##(A_10ec!(1, 1)) - A_10ec!(RT_CINT%(FX##(V_100e!)), 1)) / (FX##(V_1032!) + 1.0)   '@33a13 DS:2dc6
L_33a65:
    L_BP6c! = V_1032!   '@33a65
    FOR V_101e! = 1.0 TO L_BP6c!   '@33a76 DS:2dc6
    A_10ec!(RT_CINT%(FX##(A_10ec!(0, 0)) + V_101e!), 0) = FX##(RT_CINT%(10.0 * FX##(V_101e!) * V_1006!)) / 10.0 + A_10ec!(RT_CINT%(FX##(V_100e!)), 0)   '@33a7e DS:2e3e
    A_10ec!(RT_CINT%(FX##(A_10ec!(0, 0)) + V_101e!), 1) = FX##(RT_CINT%(10.0 * FX##(V_101e!) * V_100a!)) / 10.0 + A_10ec!(RT_CINT%(FX##(V_100e!)), 1)   '@33af3 DS:2e3e
    A_10ec!(RT_CINT%(FX##(A_10ec!(0, 0)) + V_101e!), 2) = L_BP26!   '@33b6a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@33ba5 DS:2dc6
    A_10ec!(0, 0) = FX##(A_10ec!(0, 0)) + V_1032!   '@33bd0
L_33c09:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@33c09 DS:2dc6
    V_108a! = L_BP26!   '@33c34
    V_1092! = FX##(A_10ec!(0, 0)) - V_108e!   '@33c44
L_33c6e:
L_33c73:
    LOCATE 22, 5   '@33c73
    PRINT " "; RT_TAB$(76); ""; " "   '@33c91 DS:2cae,2e76
    LOCATE 22, 5   '@33cba
    PRINT " Dados corretos N/*S* ";   '@33cd8 DS:31c2
    CALL MIXT_07f1_LimpaTeclado   '@33ce6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@33cf0 DS:2cae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_33d2f   '@33d0a DS:31dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3048f   '@33d27
L_33d2f:
L_33d34:
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@33d39
    ' END SUB   '@33d65
END SUB

SUB S_33d7a   ' entrada de SUB/FUNCTION (B$ENRA, locais 320 bytes) (0x33d7a)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP22$
    DIM L_BP26!
    DIM L_BP28%
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP30$
    DIM L_BP32%
    DIM L_BP36!
    DIM L_BP38%
    DIM L_BP3a%
    DIM L_BP3c%
    DIM L_BP3e%
    DIM L_BP42$
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
    ' ---- FUN_3000_3d7a @0x33d7a  (033d7a_FUN_3000_3d7a.lift.txt; evidence_id (assembly): ev_3b7bebce3710a8f47b4f897cf05e5f934ad192ad5810c709fb676fcd0451dbb6)
    REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@33d8c
    REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@33d9a
    REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@33da3
    REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@33dce
L_33dfe:
    RT_VIEWPRINT 8, 25   '@33e03
    COLOR 7   '@33e15
    RT_CLS 2   '@33e2b
    PRINT ""   '@33e39 DS:2cae
    PRINT "     1  -  ";   '@33e47 DS:31e2
    COLOR RT_CINT%(FX##(V_0dc4!))   '@33e55
    PRINT "R";   '@33e72 DS:31f2
    COLOR 7   '@33e80
    PRINT "etangular"   '@33e96 DS:31f8
    PRINT "     2  -  ";   '@33ea4 DS:3206
    COLOR RT_CINT%(FX##(V_0dc4!))   '@33eb2
    PRINT "C";   '@33ecf DS:31b4
    COLOR 7   '@33edd
    PRINT "ircular"   '@33ef3 DS:3216
    PRINT "     3  -  ";   '@33f01 DS:3222
    COLOR RT_CINT%(FX##(V_0dc4!))   '@33f0f
    PRINT "P";   '@33f2c DS:3232
    COLOR 7   '@33f3a
    PRINT "oligonal fechada"   '@33f50 DS:3238
    PRINT ""   '@33f5e DS:2cae
    PRINT "     4  -  ";   '@33f6c DS:324c
    COLOR RT_CINT%(FX##(V_0dc4!))   '@33f7a
    PRINT "L";   '@33f97 DS:325c
    COLOR 7   '@33fa5
    PRINT "eitura  de Secao arquivada"   '@33fbb DS:3262
    PRINT "     5  -  ";   '@33fc9 DS:3280
    COLOR RT_CINT%(FX##(V_0dc4!))   '@33fd7
    PRINT "A";   '@33ff4 DS:3290
    COLOR 7   '@34002
    PRINT "lterar Drive e Diretorio  ";   '@34018 DS:3296
    COLOR 3   '@34026
    PRINT V_0df8$; ":"; V_0dfc$   '@3403c DS:2d06
    COLOR 7   '@3405c
    PRINT ""   '@34072 DS:2cae
    PRINT "     Escolha o tipo de secao  *FIM* ";   '@34080 DS:32b4
    CALL MIXT_07f1_LimpaTeclado   '@3408e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@34098
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS 2   '@340b4
    V_11b2% = 0   '@340c2
    L_BP22$ = V_106e$   '@340cd
    IF NOT (L_BP22$ <> "1") THEN GOTO L_3411a   '@340df DS:2f68
    IF NOT (L_BP22$ <> "R") THEN GOTO L_3411a   '@340f6 DS:31f2
    IF NOT (L_BP22$ = "r") THEN GOTO L_34133   '@34108 DS:32dc
L_3411a:
    V_102e! = 1.0   '@3411a DS:2dc6
    GOTO L_344b8   '@3412b
L_34133:
    IF NOT (L_BP22$ <> "2") THEN GOTO L_34169   '@34133 DS:32e2
    IF NOT (L_BP22$ <> "C") THEN GOTO L_34169   '@34145 DS:31b4
    IF NOT (L_BP22$ = "c") THEN GOTO L_34182   '@34157 DS:32e8
L_34169:
    V_102e! = 2.0   '@34169 DS:2e0a
    GOTO L_344b8   '@3417a
L_34182:
    IF NOT (L_BP22$ <> "3") THEN GOTO L_341b8   '@34182 DS:32ee
    IF NOT (L_BP22$ <> "P") THEN GOTO L_341b8   '@34194 DS:3232
    IF NOT (L_BP22$ = "p") THEN GOTO L_341d1   '@341a6 DS:32f4
L_341b8:
    V_102e! = 3.0   '@341b8 DS:2e3a
    GOTO L_344b8   '@341c9
L_341d1:
    IF NOT (L_BP22$ <> "4") THEN GOTO L_34207   '@341d1 DS:32fa
    IF NOT (L_BP22$ <> "L") THEN GOTO L_34207   '@341e3 DS:325c
    IF NOT (L_BP22$ = "l") THEN GOTO L_34446   '@341f5 DS:3300
L_34207:
L_3420c:
    GOSUB L_37903   '@34211
    IF NOT (V_106e$ = "ERRPIL") THEN GOTO L_34242   '@3421e DS:2cb2
    GOSUB L_37a2e   '@34235
L_34242:
L_34247:
    RT_VIEWPRINT 11, 12   '@3424c
    COLOR 7   '@3425e
    RT_CLS 2   '@34274
    CALL MIXT_07f1_LimpaTeclado   '@34282
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP26! = V_101a!   '@3428c
    RT_LINEINPUT " Nome do Pilar *RETORNO* ", V_106e$   '@3429c DS:3306
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_342d3   '@342b6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33dfe   '@342cb
L_342d3:
    IF NOT (UCASE$(V_106e$) = "D") THEN GOTO L_34305   '@342d3 DS:3324
    GOSUB L_37a2e   '@342f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3420c   '@342fd
L_34305:
    L_BP28% = (VAL(V_106e$) <> 0.0#)   '@34305 DS:31ba
    IF NOT ((LEN(V_106e$) > 8 OR L_BP28%) <> 0) THEN GOTO L_3435d   '@34333
    BEEP   '@3434b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34247   '@34355
L_3435d:
    L_BP2a% = (INSTR(V_106e$, "\") > 0)   '@3435d DS:332a
    L_BP2c% = INSTR(V_106e$, ",") > 0 OR L_BP2a%   '@34382 DS:3330
    IF NOT ((INSTR(V_106e$, "*") > 0 OR L_BP2c%) <> 0) THEN GOTO L_343c6   '@3439d DS:3336
    BEEP   '@343b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34247   '@343be
L_343c6:
    L_BP30$ = V_106e$   '@343c6
    GOSUB L_37d3e   '@343d8
    IF NOT (V_106e$ = "ERRO") THEN GOTO L_34404   '@343e5 DS:2db6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34247   '@343fc
L_34404:
    RT_VIEWPRINT 12, 25   '@34404
    RT_CLS 2   '@34416
    RT_VIEWPRINT 6, 25   '@34424
    GOTO L_380fb   '@34436
L_34446:
    IF NOT (L_BP22$ <> "5") THEN GOTO L_3447c   '@34446 DS:333c
    IF NOT (L_BP22$ <> "A") THEN GOTO L_3447c   '@34458 DS:3290
    IF NOT (L_BP22$ = "a") THEN GOTO L_34499   '@3446a DS:3342
L_3447c:
    GOSUB L_37a2e   '@3447c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33dfe   '@34489
L_34499:
    V_106e$ = "FIM"   '@34499 DS:3348
    GOTO L_380fb   '@344ab
L_344b8:
L_344bd:
    RT_VIEWPRINT 8, 25   '@344c2
    V_11b2% = 0   '@344d4
    IF NOT (V_102e! = 1.0) THEN GOTO L_3479b   '@344df DS:2dc6
    COLOR 3   '@344fa
    PRINT " Entre com a Secao da Coluna no Nivel indicado ou use o codigo auxiliar"   '@34510 DS:3350
    PRINT " ?     tamanho nao determinado a ser predimensionado"   '@3451e DS:339c
    COLOR 7   '@3452c
    LOCATE 11, 1   '@34542
    PRINT " B(cm) , H(cm) [, Rotacao(*0*)] *RETORNO* ";   '@3455d DS:33d4
    CALL MIXT_07f1_LimpaTeclado   '@3456b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_00ff_Le3Campos(V_106e$, V_1072$, V_1076$)   '@34575
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_345a8   '@3458b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33dfe   '@345a0
L_345a8:
    V_0fb8! = VAL(V_106e$)   '@345a8
    IF NOT (V_106e$ = "?") THEN GOTO L_345f5   '@345c2 DS:3402
    V_0fb8! = -2.0   '@345d9 DS:3020
    V_11b2% = 1   '@345ea
L_345f5:
    IF NOT (V_0fb8! <> -2.0) THEN GOTO L_3466a   '@345f5 DS:3020
    IF NOT (2.0 * FX##(V_0e8e!) >= FX##(V_0fb8!) OR V_0fb8! < 0.0) THEN GOTO L_34665   '@34610 DS:2dee,2e0a
    BEEP   '@34653
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@3465d
L_34665:
L_3466a:
    V_0fbc! = VAL(V_1072$)   '@3466a
    IF NOT (V_1072$ = "?") THEN GOTO L_346b7   '@34684 DS:3402
    V_0fbc! = -2.0   '@3469b DS:3020
    V_11b2% = 1   '@346ac
L_346b7:
    IF NOT (V_0fbc! <> -2.0) THEN GOTO L_3472c   '@346b7 DS:3020
    IF NOT (2.0 * FX##(V_0e8e!) >= FX##(V_0fbc!) OR V_0fbc! < 0.0) THEN GOTO L_34727   '@346d2 DS:2dee,2e0a
    BEEP   '@34715
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@3471f
L_34727:
L_3472c:
    V_106a! = VAL(V_1076$)   '@3472c
    IF NOT (V_106a! > 360.0 OR V_106a! < 0.0) THEN GOTO L_34796   '@34746 DS:2dee,3408
    BEEP   '@34784
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@3478e
L_34796:
L_3479b:
    IF NOT (V_102e! = 2.0) THEN GOTO L_34a33   '@3479b DS:2e0a
    COLOR 3   '@347b6
    PRINT " Entre com a Secao da Coluna no Nivel indicado ou use o codigo auxiliar"   '@347cc DS:3350
    PRINT " ?     tamanho nao determinado a ser predimensionado"   '@347da DS:339c
    COLOR 7   '@347e8
    LOCATE 11, 1   '@347fe
    PRINT " Diametro(cm) [, Dinterno(cm) ]  *RETORNO* ";   '@34819 DS:340c
    CALL MIXT_07f1_LimpaTeclado   '@34827
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_106e$, V_1072$)   '@34831
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_34860   '@34843
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33dfe   '@34858
L_34860:
    V_0fb8! = VAL(V_106e$)   '@34860
    IF NOT (V_106e$ = "?") THEN GOTO L_348ad   '@3487a DS:3402
    V_0fb8! = -2.0   '@34891 DS:3020
    V_11b2% = 1   '@348a2
L_348ad:
    IF NOT (V_0fb8! <> -2.0) THEN GOTO L_34922   '@348ad DS:3020
    IF NOT (2.0 * FX##(V_0e8e!) >= FX##(V_0fb8!) OR V_0fb8! < 0.0) THEN GOTO L_3491d   '@348c8 DS:2dee,2e0a
    BEEP   '@3490b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@34915
L_3491d:
L_34922:
    V_0fbc! = V_0fb8!   '@34922
    V_0fc0! = VAL(V_1072$)   '@34933
    IF NOT (V_1072$ = "?") THEN GOTO L_34980   '@3494d DS:3402
    V_0fc0! = -2.0   '@34964 DS:3020
    V_11b2% = 1   '@34975
L_34980:
    IF NOT (V_0fbc! <> -2.0 AND V_0fc0! <> -2.0) THEN GOTO L_34a1d   '@34980 DS:3020
    IF NOT (2.0 * FX##(V_0e8e!) >= FX##(V_0fbc!) - V_0fc0! OR V_0fc0! < 0.0) THEN GOTO L_34a18   '@349be DS:2dee,2e0a
    BEEP   '@34a06
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@34a10
L_34a18:
L_34a1d:
    V_106a! = 0.0   '@34a1d DS:2dee
L_34a33:
    IF NOT (V_102e! = 3.0) THEN GOTO L_37842   '@34a33 DS:2e3a
    CALL MIXT_07f1_LimpaTeclado   '@34a4e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero de Vertices da poligonal *RETORNO* ", V_106e$   '@34a58 DS:343c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_34a8f   '@34a72
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33dfe   '@34a87
L_34a8f:
    L_BP32% = (FX##(VAL(V_106e$)) > FX##(V_0e2c!))   '@34a8f DS:346c
    IF NOT ((VAL(V_106e$) < 3.0# OR L_BP32%) <> 0) THEN GOTO L_34af5   '@34ac2
    BEEP   '@34ae3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@34aed
L_34af5:
    A_10be!(0, 0) = VAL(V_106e$)   '@34af5
    L_BP36! = A_10be!(0, 0)   '@34b1e
    FOR V_100e! = 1.0 TO L_BP36!   '@34b3e DS:2dc6
L_34b4b:
    RT_VIEWPRINT 13, 24   '@34b50
    RT_CLS 2   '@34b62
    COLOR 3   '@34b70
    PRINT " Faca a Poligonal no sentido horario, sempre com coordenadas positivas."   '@34b86 DS:3474
    PRINT " entre com as coordenadas da poligonal X,Y ou use os codigos auxiliares:"   '@34b94 DS:34c0
    PRINT "  A x,y             para Acrescentar na ultima coordenada dada"   '@34ba2 DS:350c
    PRINT "  P ang,comp        para acrescentar em coordenadas Polares (ang=GRAUS)"   '@34bb0 DS:354e
    PRINT "  C Xcentro,Ycentro para criar vertices sobre um Circulo/semi-Circulo"   '@34bbe DS:359a
    PRINT "  * n               para pular para o Vertice n"   '@34bcc DS:35e4
    PRINT ""   '@34bda DS:2cae
    COLOR 7   '@34be8
    PRINT " Coordenadas da Poligonal - Vertice";   '@34bfe DS:3618
    COLOR RT_CINT%(FX##(V_0dc0!))   '@34c0c
    PRINT V_100e!   '@34c29
    COLOR 7   '@34c3b
    PRINT " X , Y (cm) ";   '@34c51 DS:3640
    CALL MIXT_07f1_LimpaTeclado   '@34c5f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_106e$, V_1072$)   '@34c69
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (RT_MID$((LTRIM$(V_106e$)), (1), (1)) = "*") THEN GOTO L_34da1   '@34c7b DS:3336
    V_1006! = VAL(RT_MID2$((LTRIM$(V_106e$)), (2)))   '@34ca3
    L_BP38% = (V_1006! > 0.0 AND V_1006! <= V_100e!)   '@34cd1 DS:2dee
    IF NOT ((INT(FX##(V_1006!)) = FX##(V_1006!) AND L_BP38%) <> 0) THEN GOTO L_34d8a   '@34d17
    IF NOT (V_1006! = 1.0) THEN GOTO L_34d67   '@34d33 DS:2dc6
    V_100e! = V_1006!   '@34d4e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@34d5f
L_34d67:
    V_100e! = FX##(V_1006!) - 1.0   '@34d67 DS:2e6a
    GOTO L_35a0d   '@34d7d
L_34d8a:
    BEEP   '@34d8a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@34d94
L_34da1:
    L_BP3a% = (V_100e! = 1.0)   '@34da1 DS:2dc6
    IF NOT ((RT_MID$((LTRIM$(UCASE$(V_106e$))), (1), (1)) = "A" AND L_BP3a%) <> 0) THEN GOTO L_34e08   '@34dc6 DS:3290
    BEEP   '@34df6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@34e00
L_34e08:
    L_BP3c% = (V_100e! = 1.0)   '@34e08 DS:2dc6
    IF NOT ((RT_MID$((LTRIM$(UCASE$(V_106e$))), (1), (1)) = "P" AND L_BP3c%) <> 0) THEN GOTO L_34e6f   '@34e2d DS:3232
    BEEP   '@34e5d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@34e67
L_34e6f:
    L_BP3e% = (V_100e! = 1.0)   '@34e6f DS:2dc6
    IF NOT ((RT_MID$((LTRIM$(UCASE$(V_106e$))), (1), (1)) = "C" AND L_BP3e%) <> 0) THEN GOTO L_34ed6   '@34e94 DS:31b4
    BEEP   '@34ec4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@34ece
L_34ed6:
    L_BP1a! = 0.0   '@34ed6 DS:2dee
    L_BP42$ = RT_MID$((LTRIM$(UCASE$(V_106e$))), (1), (1))   '@34ee6
    IF NOT (L_BP42$ = "A") THEN GOTO L_34ff0   '@34f0f DS:3290
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) + VAL(RT_MID2$((LTRIM$(V_106e$)), (2)))   '@34f26 DS:2e6a
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) + VAL(V_1072$)   '@34f90 DS:2e6a
    GOTO L_3560d   '@34fe8
L_34ff0:
    IF NOT (L_BP42$ = "P") THEN GOTO L_3514c   '@34ff0 DS:3232
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = FX##(RT_CINT%(VAL(V_1072$) * RT_COS##(FX##(V_0e5a!) * VAL(RT_MID2$((LTRIM$(V_106e$)), (2))) / 180.0#) * 10.0#)) / 10.0 + A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)   '@35002 DS:2e3e,2e6a,3650,3658
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = FX##(RT_CINT%(VAL(V_1072$) * RT_SIN##(FX##(V_0e5a!) * VAL(RT_MID2$((LTRIM$(V_106e$)), (2))) / 180.0#) * 10.0#)) / 10.0 + A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)   '@350a2 DS:2e3e,2e6a,3650,3658
    GOTO L_3560d   '@35144
L_3514c:
    IF NOT (L_BP42$ = "C") THEN GOTO L_355a1   '@3514c DS:31b4
    L_BP0e! = VAL(RT_MID2$((V_106e$), (2)))   '@3515e
    L_BP12! = VAL(V_1072$)   '@35185
    LOCATE 21, 1   '@3519e
    PRINT " Numero de Vertices INTERNOS ao Circulo , Angulo (GRAUS) ";   '@351b9 DS:3660
    CALL MIXT_07f1_LimpaTeclado   '@351c7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_106e$, V_1072$)   '@351d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = VAL(V_106e$)   '@351e3
    L_BP1a! = VAL(V_1072$)   '@351fc
    IF NOT (L_BP16! < 1.0 OR L_BP1a! = 0.0) THEN GOTO L_35263   '@35215 DS:2dc6,2dee
    BEEP   '@35251
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@3525b
L_35263:
    L_BP46! = 0.0   '@35263 DS:2dee
L_35278:
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0) = L_BP0e!) THEN GOTO L_3533c   '@3527d DS:2e6a
    L_BP4a! = FX##(V_0e5a!) / 2.0 + L_BP1a! / (FX##(L_BP16!) * 180.0 + 180.0) * V_0e5a!   '@352b5 DS:2e0a,2fae
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1) < L_BP12!) THEN GOTO L_35334   '@352e7 DS:2e6a
    L_BP4a! = FX##(L_BP4a!) + V_0e5a!   '@35320
L_35334:
    GOTO L_3540e   '@35334
L_3533c:
    L_BP4a! = ATN((FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) - L_BP12!) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - L_BP0e!)) + L_BP1a! / (FX##(L_BP16!) * 180.0 + 180.0) * V_0e5a!   '@3533c DS:2e6a,2fae
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0) < L_BP0e!) THEN GOTO L_35409   '@353bd DS:2e6a
    L_BP4a! = FX##(L_BP4a!) + V_0e5a!   '@353f5
L_35409:
L_3540e:
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = RT_COS##(FX##(L_BP4a!)) * RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) - L_BP12!), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - L_BP0e!), (2.0))) + L_BP0e!   '@3540e DS:2e0a,2e6a
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = RT_SIN##(FX##(L_BP4a!)) * RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) - L_BP12!), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - L_BP0e!), (2.0))) + L_BP12!   '@354b2 DS:2e0a,2e6a
    L_BP46! = FX##(L_BP46!) + 1.0   '@35557 DS:2dc6
    IF NOT (FX##(L_BP16!) + 1.0 = FX##(L_BP46!)) THEN GOTO L_35599   '@3556b DS:2dc6
    L_BP1a! = 0.0   '@35589 DS:2dee
L_35599:
    GOTO L_3560d   '@35599
L_355a1:
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = VAL(V_106e$)   '@355a1
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = VAL(V_1072$)   '@355d4
L_3560d:
    IF NOT (V_100e! > 2.0) THEN GOTO L_35a08   '@3560d DS:2e0a
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 0) = FX##(0.0) AND FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0) = FX##(0.0)) THEN GOTO L_356ed   '@35628 DS:2dee,2e6a,3020
    GOTO L_35998   '@356e5
L_356ed:
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!)), 1) = A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 1) AND A_10be!(RT_CINT%(FX##(V_100e!)), 0) = A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 0)) THEN GOTO L_357a5   '@356ed DS:3020
    GOTO L_35998   '@3579d
L_357a5:
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 0) = FX##(0.0) OR FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0) = FX##(0.0)) THEN GOTO L_3586a   '@357a5 DS:2dee,2e6a,3020
    GOTO L_35a0d   '@35862
L_3586a:
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 1)) - A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) = (FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) - 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!) - 2.0), 0))) THEN GOTO L_35a03   '@3586a DS:2e6a,3020
L_35998:
    BEEP   '@3599d
    LOCATE 22, 1   '@359a7
    PRINT " Faces da Poligonal com mesmo alinhamento";   '@359c2 DS:369e
    CALL MIXT_07f1_LimpaTeclado   '@359d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@359da
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34b4b   '@359f6
L_35a03:
L_35a08:
L_35a0d:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@35a12
    RT_VIEWPRINT 25, 25   '@35a2f
    LOCATE 25, 1   '@35a3e
    PRINT " Vertice"; V_100e!; RT_TAB$(25); ""; "X="; A_10be!(RT_CINT%(FX##(V_100e!)), 0); "cm"; RT_TAB$(50); ""; "Y="; A_10be!(RT_CINT%(FX##(V_100e!)), 1); "cm"; RT_TAB$(78); "";   '@35a59 DS:2cae,2de8,36cc,36d8,36de
    IF NOT (L_BP1a! <> 0.0) THEN GOTO L_35b53   '@35b1b DS:2dee
    V_100e! = FX##(V_100e!) + 1.0   '@35b35 DS:2dc6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35278   '@35b4b
L_35b53:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@35b53 DS:2dc6
    RT_VIEWPRINT 11, 24   '@35b7e
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 0) = A_10be!(1, 0)   '@35b90 DS:2dc6
    A_10be!(RT_CINT%(FX##(A_10be!(0, 0)) + 1.0), 1) = A_10be!(1, 1)   '@35be0 DS:2dc6
    L_BP4e! = FX##(A_10be!(0, 0)) - 2.0   '@35c2f DS:3020
    FOR V_101e! = 1.0 TO L_BP4e!   '@35c54 DS:2dc6
    L_BP52! = FX##(V_101e! = 1.0) + A_10be!(0, 0)   '@35c5c DS:2dc6
    FOR V_100e! = FX##(V_101e!) + 2.0 TO L_BP52!   '@35c98 DS:2dc6,2e0a
    IF NOT (A_10be!(RT_CINT%(FX##(V_101e!)), 0) = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) THEN GOTO L_3628f   '@35ca4 DS:2dc6
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!)), 0) = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) THEN GOTO L_35d50   '@35cf6 DS:2dc6
    GOTO L_377b1   '@35d48
L_35d50:
    L_BP56! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@35d50
    L_BP5a! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@35d7a DS:2dc6
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@35da2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP5a!   '@35db4 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP56!   '@35ddd
    L_BP62! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@35e01
    L_BP66! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@35e25 DS:2dc6
    CALL MIXT_082a_Maior(L_BP62!, L_BP66!, L_BP6a!)   '@35e4d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP66!   '@35e5f DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP62!   '@35e88
    IF NOT (A_10be!(RT_CINT%(FX##(V_101e!)), 0) > L_BP6a! OR A_10be!(RT_CINT%(FX##(V_101e!)), 0) < L_BP5e!) THEN GOTO L_35f1e   '@35eac
    GOTO L_377b1   '@35f16
L_35f1e:
    L_BP6e! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@35f1e
    L_BP72! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)   '@35f49 DS:2dc6
    CALL MIXT_082a_Maior(L_BP6e!, L_BP72!, L_BP76!)   '@35f72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1) = L_BP72!   '@35f84 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 1) = L_BP6e!   '@35fae
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)) * (FX##(A_10be!(RT_CINT%(FX##(V_101e!)), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + A_10be!(RT_CINT%(FX##(V_100e!)), 1) > FX##(L_BP76!)) THEN GOTO L_360cf   '@35fd3 DS:2dc6
    GOTO L_377b1   '@360c7
L_360cf:
    L_BP7a! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@360cf
    L_BP7e! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)   '@360fa DS:2dc6
    CALL MIXT_0877_Menor(L_BP7a!, L_BP7e!, L_BP82!)   '@36123
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1) = L_BP7e!   '@36136 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 1) = L_BP7a!   '@36160
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)) * (FX##(A_10be!(RT_CINT%(FX##(V_101e!)), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + A_10be!(RT_CINT%(FX##(V_100e!)), 1) < FX##(L_BP82!)) THEN GOTO L_36282   '@36185 DS:2dc6
    GOTO L_377b1   '@3627a
L_36282:
    GOTO L_37859   '@36282
L_3628f:
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!)), 0) = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) THEN GOTO L_3683e   '@3628f DS:2dc6
    L_BP86! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@362e1
    L_BP8a! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@3630c DS:2dc6
    CALL MIXT_0877_Menor(L_BP86!, L_BP8a!, L_BP8e!)   '@36335
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BP8a!   '@3634a DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BP86!   '@36374
    L_BP92! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@36399
    L_BP96! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@363be DS:2dc6
    CALL MIXT_082a_Maior(L_BP92!, L_BP96!, L_BP9a!)   '@363e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BP96!   '@363fc DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BP92!   '@36426
    IF NOT (A_10be!(RT_CINT%(FX##(V_100e!)), 0) > L_BP9a! OR A_10be!(RT_CINT%(FX##(V_100e!)), 0) < L_BP8e!) THEN GOTO L_364bf   '@3644b
    GOTO L_377b1   '@364b7
L_364bf:
    L_BP9e! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@364bf
    L_BPa2! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@364eb DS:2dc6
    CALL MIXT_082a_Maior(L_BP9e!, L_BPa2!, L_BPa6!)   '@36515
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BPa2!   '@3652a DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BP9e!   '@36555
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) * (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) + A_10be!(RT_CINT%(FX##(V_101e!)), 1) > FX##(L_BPa6!)) THEN GOTO L_36678   '@3657b DS:2dc6
    GOTO L_377b1   '@36670
L_36678:
    L_BPaa! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@36678
    L_BPae! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@366a4 DS:2dc6
    CALL MIXT_0877_Menor(L_BPaa!, L_BPae!, L_BPb2!)   '@366ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BPae!   '@366e3 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BPaa!   '@3670e
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) * (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) + A_10be!(RT_CINT%(FX##(V_101e!)), 1) < FX##(L_BPb2!)) THEN GOTO L_36831   '@36734 DS:2dc6
    GOTO L_377b1   '@36829
L_36831:
    GOTO L_37859   '@36831
L_3683e:
    IF NOT ((FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) = (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0))) THEN GOTO L_3719c   '@3683e DS:2dc6
    L_BPb6! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@3695d
    L_BPba! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@36988 DS:2dc6
    CALL MIXT_082a_Maior(L_BPb6!, L_BPba!, L_BPbe!)   '@369b1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BPba!   '@369c6 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BPb6!   '@369f0
    L_BPc2! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@36a15
    L_BPc6! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@36a3a DS:2dc6
    CALL MIXT_0877_Menor(L_BPc2!, L_BPc6!, L_BPca!)   '@36a63
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BPc6!   '@36a78 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BPc2!   '@36aa2
    IF NOT (L_BPbe! < L_BPca!) THEN GOTO L_36ae4   '@36ac7
    GOTO L_377b1   '@36adc
L_36ae4:
    L_BPce! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@36ae4
    L_BPd2! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@36b0f DS:2dc6
    CALL MIXT_082a_Maior(L_BPce!, L_BPd2!, L_BPd6!)   '@36b38
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BPd2!   '@36b4d DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BPce!   '@36b77
    L_BPda! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@36b9c
    L_BPde! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@36bc1 DS:2dc6
    CALL MIXT_0877_Menor(L_BPda!, L_BPde!, L_BPe2!)   '@36bea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BPde!   '@36bff DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BPda!   '@36c29
    IF NOT (L_BPd6! < L_BPe2!) THEN GOTO L_36c6b   '@36c4e
    GOTO L_377b1   '@36c63
L_36c6b:
    IF NOT (A_10be!(RT_CINT%(FX##(V_101e!)), 0) = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) THEN GOTO L_36fe3   '@36c6b DS:2dc6
    L_BPe6! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@36cbd
    L_BPea! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)   '@36ce9 DS:2dc6
    CALL MIXT_0877_Menor(L_BPe6!, L_BPea!, L_BPee!)   '@36d13
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1) = L_BPea!   '@36d28 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 1) = L_BPe6!   '@36d53
    L_BPf2! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@36d79
    L_BPf6! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@36d9f DS:2dc6
    CALL MIXT_082a_Maior(L_BPf2!, L_BPf6!, L_BPfa!)   '@36dc9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BPf6!   '@36dde DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BPf2!   '@36e09
    L_BPfe! = A_10be!(RT_CINT%(FX##(V_101e!)), 1)   '@36e2f
    L_BP102! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)   '@36e55 DS:2dc6
    CALL MIXT_082a_Maior(L_BPfe!, L_BP102!, L_BP106!)   '@36e7f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1) = L_BP102!   '@36e94 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 1) = L_BPfe!   '@36ebf
    L_BP10a! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@36ee5
    L_BP10e! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@36f0b DS:2dc6
    CALL MIXT_0877_Menor(L_BP10a!, L_BP10e!, L_BP112!)   '@36f35
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BP10e!   '@36f4a DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BP10a!   '@36f75
    IF NOT (L_BP106! < L_BP112! OR L_BPee! > L_BPfa!) THEN GOTO L_36fdb   '@36f9b
    GOTO L_377b1   '@36fd3
L_36fdb:
    GOTO L_3718f   '@36fdb
L_36fe3:
    IF NOT (A_10be!(RT_CINT%(FX##(V_101e!)), 1) - (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) * A_10be!(RT_CINT%(FX##(V_101e!)), 0) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) <> A_10be!(RT_CINT%(FX##(V_100e!)), 1) - (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)) * A_10be!(RT_CINT%(FX##(V_100e!)), 0) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0))) THEN GOTO L_3718a   '@36fe3 DS:2dc6
    GOTO L_377b1   '@37182
L_3718a:
L_3718f:
    GOTO L_37859   '@3718f
L_3719c:
    V_1032! = FX##(A_10be!(RT_CINT%(FX##(V_101e!)), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1) + (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) * (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0))   '@3719c DS:2dc6
    V_1032! = V_1032! / ((FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_100e!)), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_100e!)), 0)) - (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_101e!)), 1)) / (FX##(A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_101e!)), 0)))   '@372af DS:2dc6
    L_BP116! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@373d4
    L_BP11a! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@373ff DS:2dc6
    CALL MIXT_0877_Menor(L_BP116!, L_BP11a!, L_BP11e!)   '@37428
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP11a!   '@3743d DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP116!   '@37467
    L_BP122! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@3748c
    L_BP126! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@374b1 DS:2dc6
    CALL MIXT_082a_Maior(L_BP122!, L_BP126!, L_BP12a!)   '@374da
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP126!   '@374ef DS:2dc6
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP122!   '@37519
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + V_1032! > FX##(L_BP12a!) OR FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + V_1032! < FX##(L_BP11e!)) THEN GOTO L_375bc   '@3753e
    GOTO L_377b1   '@375b4
L_375bc:
    L_BP12e! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@375bc
    L_BP132! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@375e7 DS:2dc6
    CALL MIXT_0877_Menor(L_BP12e!, L_BP132!, L_BP136!)   '@37610
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BP132!   '@37625 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BP12e!   '@3764f
    L_BP13a! = A_10be!(RT_CINT%(FX##(V_101e!)), 0)   '@37674
    L_BP13e! = A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0)   '@37699 DS:2dc6
    CALL MIXT_082a_Maior(L_BP13a!, L_BP13e!, L_BP142!)   '@376c2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_101e!) + 1.0), 0) = L_BP13e!   '@376d7 DS:2dc6
    A_10be!(RT_CINT%(FX##(V_101e!)), 0) = L_BP13a!   '@37701
    IF NOT (FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + V_1032! > FX##(L_BP142!) OR FX##(A_10be!(RT_CINT%(FX##(V_100e!)), 0)) + V_1032! < FX##(L_BP136!)) THEN GOTO L_377a4   '@37726
    GOTO L_377b1   '@3779c
L_377a4:
    GOTO L_37859   '@377a4
L_377b1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@377b6 DS:2dc6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@377e1 DS:2dc6
    RT_VIEWPRINT 11, 25   '@3780c
    RT_CLS 2   '@3781e
    V_106a! = 0.0   '@3782c DS:2dee
L_37842:
    GOTO L_380fb   '@3784c
L_37859:
    LOCATE 22, 1   '@3785e
    BEEP   '@37879
    PRINT " Definicao impropria da Poligonal."   '@37883 DS:36e4
    PRINT " Face"; V_101e!; "cruzando com face"; V_100e!;   '@37891 DS:370a,3714
    CALL MIXT_07f1_LimpaTeclado   '@378c2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@378cc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS 2   '@378e8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_344bd   '@378f6
    ' ---- F_378fe @0x378fe  (0378fe_F_378fe.lift.txt; evidence_id (assembly): ev_c958de8b44bd4a35181489e71b3f87c4c8bd876071a783abf104169e94d0e48d)
L_37903:   ' sub-rotina (alvo de GOSUB); entrada vinda de 033d7a_FUN_3000_3d7a
    RT_VIEWPRINT 13, 25   '@37908
    RT_CLS 2   '@3791a
    COLOR 3   '@37928
    PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@3793e DS:2cae,372a
    COLOR 14   '@3795e
    RT_VIEWPRINT 15, 25   '@37974
    ON ERROR GOTO L_30184
    RT_ONERR = &H30184   '@37986
    L_BP144% = (LEN(V_0dfc$) > 1)   '@37995 DS:2d06
    CHDIR RT_ARQ$(RT_LEFT$((V_0df8$ + ":" + V_0dfc$), (LEN(V_0dfc$) + L_BP144% + 2)))   '@379cc
    RT_FILES V_0df8$ + ":" + V_0dfc$ + "*.PIL"   '@379e4 DS:2d06,3760 (FILES: cabecalho em forma DOS (RT45))
    ON ERROR GOTO L_30143
    RT_ONERR = &H30143   '@37a10
    RETURN   '@37a1f
L_37a2e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 033d7a_FUN_3000_3d7a
    RT_VIEWPRINT 22, 25   '@37a33
    RT_CLS 2   '@37a45
    COLOR 7   '@37a53
    PRINT " Drive que contem o Disco de Dados ";   '@37a69 DS:376a
    COLOR RT_CINT%(FX##(V_0dc0!))   '@37a77
    PRINT "*"; RT_MID$((V_0df8$), (1), (1)); "*";   '@37a94 DS:3336
    CALL MIXT_07f1_LimpaTeclado   '@37abf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", V_106e$   '@37ac9 DS:2e76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) > 0) THEN GOTO L_37b10   '@37ae3
    V_0df8$ = UCASE$(V_106e$)   '@37af8
L_37b10:
    COLOR 3   '@37b10
    PRINT " [";   '@37b26 DS:3792
    COLOR 7   '@37b34
    PRINT "\Diretorio\Subdiretorio\...\";   '@37b4a DS:3798
    COLOR 3   '@37b58
    PRINT "]";   '@37b6e DS:37b8
    COLOR 7   '@37b7c
    PRINT "Subdiretorio ";   '@37b92 DS:37be
    COLOR RT_CINT%(FX##(V_0dc0!))   '@37ba0
    PRINT "*"; V_0dfc$; "*";   '@37bbd DS:3336
    COLOR 7   '@37bdd
    RT_LINEINPUT " ", V_106e$   '@37bf3 DS:2e76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) > 0) THEN GOTO L_37c8b   '@37c0d
    IF NOT (RT_MID$((V_106e$), (1), (1)) <> "\") THEN GOTO L_37c6e   '@37c22 DS:332a
    V_0dfc$ = V_0dfc$ + UCASE$(V_106e$)   '@37c44
    GOTO L_37c86   '@37c66
L_37c6e:
    V_0dfc$ = UCASE$(V_106e$)   '@37c6e
L_37c86:
L_37c8b:
    IF NOT (RT_RIGHT$((V_0dfc$), (1)) <> "\") THEN GOTO L_37cc8   '@37c8b DS:332a
    V_0dfc$ = V_0dfc$ + "\"   '@37cac DS:332a
L_37cc8:
    ON ERROR GOTO L_301eb
    RT_ONERR = &H301eb   '@37cc8
    L_BP146% = (LEN(V_0dfc$) > 1)   '@37cd7 DS:2d06
    CHDIR RT_ARQ$(V_0df8$ + ":" + RT_LEFT$((V_0dfc$), (LEN(V_0dfc$) + L_BP146%)))   '@37d05
    ON ERROR GOTO L_30143
    RT_ONERR = &H30143   '@37d20
    RETURN   '@37d2f
L_37d3e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 033d7a_FUN_3000_3d7a
    ON ERROR GOTO L_3035c
    RT_ONERR = &H3035c   '@37d43
    OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + L_BP30$ + ".PIL") FOR INPUT AS #1   '@37d52 DS:2d06,37d0,37d6
    IF NOT (V_106e$ = "ERRO") THEN GOTO L_37db5   '@37d94 DS:2db6
    RETURN   '@37dab
L_37db5:
    INPUT #1, V_102e!   '@37db5
    IF NOT (V_106e$ = "ERRO") THEN GOTO L_37df5   '@37dd4 DS:2db6
    RETURN   '@37deb
L_37df5:
    IF NOT (V_102e! = 1.0) THEN GOTO L_37e53   '@37df5 DS:2dc6
    INPUT #1, V_0fb8!   '@37e10
    INPUT #1, V_0fbc!   '@37e2f
L_37e53:
    IF NOT (V_102e! = 2.0) THEN GOTO L_37eb1   '@37e53 DS:2e0a
    INPUT #1, V_0fb8!   '@37e6e
    INPUT #1, V_0fc0!   '@37e8d
L_37eb1:
    IF NOT (V_102e! = 3.0) THEN GOTO L_37f11   '@37eb1 DS:2e3a
    INPUT #1, V_106e$   '@37ecc
    INPUT #1, V_106e$   '@37eec
L_37f11:
    INPUT #1, V_106e$   '@37f11
    INPUT #1, V_106e$   '@37f31
    INPUT #1, V_106e$   '@37f51
    INPUT #1, V_106e$   '@37f71
    INPUT #1, V_106e$   '@37f91
    INPUT #1, V_106e$   '@37fb1
    INPUT #1, A_10be!(0, 0)   '@37fd1
    L_BP14a! = FX##(A_10be!(0, 0)) + 2.0   '@37ffb DS:2e0a
    FOR V_100e! = 0.0 TO L_BP14a!   '@38021 DS:2dc6,2dee
    INPUT #1, A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@38028
    INPUT #1, A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@3805c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@38091 DS:2dc6
    CLOSE #1   '@380bd
    ON ERROR GOTO L_30143
    RT_ONERR = &H30143   '@380cc
    V_106a! = 0.0   '@380db DS:2dee
    RETURN   '@380ec
L_380fb:   ' entrada vinda de 033d7a_FUN_3000_3d7a
    ' @380fb libera strings locais (L_BP42)
    ' @38104 libera strings locais (L_BP22)
    ' @3810d libera strings locais (L_BP30)
    ' END SUB   '@38116
END SUB

SUB S_4015f   ' entrada de SUB/FUNCTION (B$ENRA, locais 336 bytes) (0x4015f)
    DIM L_BP32!
    DIM L_BP36!
    DIM L_BP3a$
    DIM L_BP3c%
    DIM L_BP3e%
    DIM L_BP40%
    DIM L_BP42%
    DIM L_BP46!
    DIM L_BP4a!
    DIM L_BP4c%
    DIM L_BP4e%
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e$
    DIM L_BP60%
    DIM L_BP62%
    DIM L_BP64%
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP70!
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
    DIM L_BP9e$
    DIM L_BPa2$
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
    REDIM L_BP1c!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP2e!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_4000_015f @0x4015f  (04015f_FUN_4000_015f.lift.txt; evidence_id (assembly): ev_6efa36cd79124ddcf43f65c34e6ef970baf9b73a27cca6adce15711f18fb8ca1)
    REDIM L_BP1c!(0 TO 3)   '@40167
    REDIM L_BP2e!(0 TO 3)   '@40184
L_401a6:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@401ab
    RT_CLS 2   '@401c8
    LOCATE 6, 1   '@401d6
    PRINT " Numero da Posicao das Colunas que serao Predimensionadas"   '@401f1 DS:37e0
    PRINT RT_TAB$(79); ""; ""   '@401ff DS:381e
    PRINT RT_TAB$(79); ""; ""   '@4021f DS:381e
    LOCATE 7, 1   '@4023f
    CALL MIXT_07f1_LimpaTeclado   '@4025a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " I/J/N a M/... /K *RETORNO* ", V_106e$   '@40264 DS:3822
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_4029b   '@4027e
    GOTO L_45f37   '@40293
L_4029b:
    L_BP3a$ = UCASE$(V_106e$)   '@4029b
    V_1016! = 1.0   '@402b3 DS:3842
L_402c9:
    L_BP3c% = (VAL(RT_MID2$((L_BP3a$), (RT_CINT%(FX##(V_1016!))))) < 1.0#)   '@402ce DS:3846
    IF NOT ((VAL(RT_MID2$((L_BP3a$), (RT_CINT%(FX##(V_1016!))))) > V_11a6% OR L_BP3c%) <> 0) THEN GOTO L_40361   '@40328
    BEEP   '@4034f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401a6   '@40359
L_40361:
    IF NOT (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("A")) > 0) THEN GOTO L_40528   '@40361 DS:384e
    L_BP3e% = RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("A"))   '@40385 DS:384e
    L_BP40% = (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("/")) > L_BP3e%)   '@403ba DS:3854
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("/")) = 0 OR L_BP40%) <> 0) THEN GOTO L_40523   '@403de DS:3854
    L_BP42% = (VAL(RT_MID2$((L_BP3a$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("A")) + 1))) = 0.0#)   '@403f5 DS:384e,385a
    IF NOT ((VAL(RT_MID2$((L_BP3a$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("A")) + 1))) > V_11a6% OR L_BP42%) <> 0) THEN GOTO L_404a6   '@40462 DS:384e
    BEEP   '@40494
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401a6   '@4049e
L_404a6:
    IF NOT (VAL(RT_MID2$((L_BP3a$), (RT_CINT%(FX##(V_1016!))))) >= VAL(RT_MID2$((L_BP3a$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP3a$), ("A")) + 1)))) THEN GOTO L_4051e   '@404a6 DS:384e
    BEEP   '@4050c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401a6   '@40516
L_4051e:
L_40523:
L_40528:
    L_BP46! = LEN(L_BP3a$)   '@40528
    FOR V_100e! = V_1016! TO L_BP46!   '@40542 DS:3842
    IF NOT (RT_MID$((L_BP3a$), (RT_CINT%(FX##(V_100e!))), (1)) = "/") THEN GOTO L_40594   '@4054a DS:3854
    V_1016! = FX##(V_100e!) + 1.0   '@40576 DS:3842
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_402c9   '@4058c
L_40594:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@40594 DS:3842
    V_11b6! = FX##(V_0e92!) * V_0e66! * V_0dec!   '@405bc
    IF NOT (V_0e92! < 0.0) THEN GOTO L_4060b   '@405d7 DS:3862
    V_11b6! = -V_0e92! * FX##(V_0dec!)   '@405f2
L_4060b:
    V_11ba! = FX##(V_0e96!) * V_0e66! * V_0dec!   '@4060b
    IF NOT (V_0e96! < 0.0) THEN GOTO L_4065a   '@40626 DS:3862
    V_11ba! = -V_0e96! * FX##(V_0dec!)   '@40641
L_4065a:
    V_0e5e! = V_0e66!   '@4065a
    V_0e62! = V_0e6a!   '@4066b
    IF NOT (V_11ac% = 0) THEN GOTO L_4072b   '@4067c
    REDIM A_1338%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@4068b
    REDIM A_1338%(0 TO CINT(V_0e34!), 0 TO V_0e3e%, 0 TO 6)   '@40699
    V_11ac% = 1   '@406c9
    V_11c2% = 0   '@406d4
    REDIM A_1366%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@406df
    REDIM A_1366%(0 TO CINT(V_0e28!), 0 TO CINT(V_0e2c!), 0 TO 1)   '@406ed
L_4072b:
    L_BP4a! = 1.0   '@4072b DS:3842
L_40740:
    V_0fe4! = VAL(RT_MID2$((L_BP3a$), (RT_CINT%(FX##(L_BP4a!)))))   '@40745
    GOSUB L_40943   '@4077d
    IF NOT (RT_INSTR%((RT_CINT%(FX##(L_BP4a!))), (L_BP3a$), ("A")) > 0) THEN GOTO L_408aa   '@4078a DS:384e
    L_BP4c% = RT_INSTR%((RT_CINT%(FX##(L_BP4a!))), (L_BP3a$), ("A"))   '@407ad DS:384e
    L_BP4e% = (RT_INSTR%((RT_CINT%(FX##(L_BP4a!))), (L_BP3a$), ("/")) > L_BP4c%)   '@407e0 DS:3854
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(L_BP4a!))), (L_BP3a$), ("/")) = 0 OR L_BP4e%) <> 0) THEN GOTO L_408a5   '@40803 DS:3854
    L_BP52! = VAL(RT_MID2$((L_BP3a$), (RT_INSTR%((RT_CINT%(FX##(L_BP4a!))), (L_BP3a$), ("A")) + 1)))   '@4081a DS:384e
L_4085c:
    V_0fe4! = FX##(V_0fe4!) + 1.0   '@4085c DS:3842
    GOSUB L_40943   '@4087c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0fe4! < L_BP52! THEN GOTO L_4085c   '@40889
L_408a5:
L_408aa:
    L_BP56! = LEN(L_BP3a$)   '@408aa
    FOR L_BP52! = L_BP4a! TO L_BP56!   '@408c4 DS:3842
    IF NOT (RT_MID$((L_BP3a$), (RT_CINT%(FX##(L_BP52!))), (1)) = "/") THEN GOTO L_40911   '@408ca DS:3854
    L_BP4a! = FX##(L_BP52!) + 1.0   '@408f5 DS:3842
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40740   '@40909
L_40911:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@40911 DS:3842
    GOTO L_45f37   '@40936
    ' ---- F_4093e @0x4093e  (04093e_F_4093e.lift.txt; evidence_id (assembly): ev_75439da60ceb8fbbcca8c8f60505040c95450598c67757ccb7f4c90710a618f0)
L_40943:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04015f_FUN_4000_015f
    V_0fe8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@40948
    V_0fec! = 0.0   '@40976 DS:3862
    V_107e$ = ""   '@40987 DS:381e
    ERASE L_BP1c!   '@40999
    ERASE L_BP2e!   '@409a7
    REDIM L_BP1c!(0 TO 3)   '@409b0
    REDIM L_BP2e!(0 TO 3)   '@409cd
L_409ea:
    RT_VIEWPRINT 6, 25   '@409ef
    RT_CLS 2   '@40a01
    COLOR RT_CINT%(FX##(V_0dc0!))   '@40a0f
    PRINT " Posicao"; V_0fe4!; RT_TAB$(20); ""; A_1252$(RT_CINT%(FX##(V_0fe4!)));   '@40a2c DS:381e,3866
    V_0f88! = 0.0   '@40a76 DS:3862
    L_BP5a! = FX##(V_0fe8!) + 1.0   '@40a87 DS:3842
    FOR V_101e! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO L_BP5a! STEP -1.0   '@40a9d DS:3872
    V_0f88! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101e!)), 0)) + V_0f88!   '@40ac2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@40afc DS:3872
    V_0fd0! = 0.0   '@40b24 DS:3862
    V_0fd4! = 0.0   '@40b35 DS:3862
    COLOR 7   '@40b46
    PRINT RT_TAB$(40); ""; "Nivel "; A_11f6$(RT_CINT%(FX##(V_0fe8!)));   '@40b5c DS:381e,3876
    IF NOT (FX##(V_0f88!) < FX##(999999.0#)) THEN GOTO L_40bce   '@40b99 DS:3880
    L_BP5e$ = "######.## "   '@40bb4 DS:3888
    GOTO L_40be0   '@40bc6
L_40bce:
    L_BP5e$ = "######### "   '@40bce DS:3896
L_40be0:
    PRINT TAB(55); "";: PRINT USING L_BP5e$; RT_PU#(V_0f88!, L_BP5e$, 1);   '@40be0 DS:381e
    PRINT V_0ddc$   '@40c12
    IF NOT (V_0fec! > 0.0) THEN GOTO L_40ca6   '@40c20 DS:3862
    COLOR 14   '@40c3b
    PRINT RT_TAB$(19); ""; STR$(V_0fec!); "a.  Variacao de Secao a partir do nivel "; A_11f6$(RT_CINT%(FX##(V_0fe8!)))   '@40c51 DS:381e,38a4
L_40ca6:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) > 0 AND V_0fec! = 0.0) THEN GOTO L_4117b   '@40ca6 DS:3862
    GOSUB L_44f71   '@40cf6
    IF NOT (V_106e$ = "NAO") THEN GOTO L_40d24   '@40d03 DS:38d0
    RETURN   '@40d1a
L_40d24:
    IF NOT (V_106e$ = "*") THEN GOTO L_41176   '@40d24 DS:38d8
    V_107e$ = "REDEFINE"   '@40d3b DS:38de
    L_BP60% = RT_CINT%(FX##(V_0fec!))   '@40d4d
    FOR V_0ff8% = 0 TO L_BP60%   '@40d5f
    REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@40d64
    REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@40d72
    REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@40d7b
    REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@40da6
    L_BP62% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6)   '@40dd1
    IF NOT (L_BP62% = 1) THEN GOTO L_40eb8   '@40dfb
    V_102e! = 1.0   '@40e09 DS:3842
    V_0fb8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@40e1a
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@40e4d
    V_106a! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 3)   '@40e80
    GOTO L_410e3   '@40eb0
L_40eb8:
    IF NOT (L_BP62% = 2) THEN GOTO L_40f51   '@40eb8
    V_102e! = 2.0   '@40ec1 DS:38ea
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@40ed2
    V_0fc0! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@40f05
    V_106a! = 0.0   '@40f38 DS:3862
    GOTO L_410e3   '@40f49
L_40f51:
    IF NOT (L_BP62% = 3) THEN GOTO L_410e3   '@40f51
    V_102e! = 3.0   '@40f5a DS:38ee
    L_BP64% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@40f6b
    A_10be!(0, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@40f95
    V_106a! = 0.0   '@40fd7 DS:3862
    L_BP68! = A_10be!(0, 0)   '@40fe8
    FOR V_1012! = 0.0 TO L_BP68!   '@41008 DS:3842,3862
    A_10be!(RT_CINT%(FX##(V_1012!)), 0) = FX##(A_1366%(L_BP64%, RT_CINT%(FX##(V_1012!)), 0)) / 10.0   '@41010 DS:38f2
    A_10be!(RT_CINT%(FX##(V_1012!)), 1) = FX##(A_1366%(L_BP64%, RT_CINT%(FX##(V_1012!)), 1)) / 10.0   '@4105f DS:38f2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1012!   '@410b0 DS:3842
    GOTO L_410e3   '@410db
L_410e3:
    CALL S_21dfd   '@410e3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1036! = 0.0   '@410ed DS:3862
    CALL S_2267a   '@410fe
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1c!(V_0ff8%) = V_1046!   '@41108
    L_BP2e!(V_0ff8%) = V_1042!   '@41128
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ff8%   '@41148
    GOSUB L_43e4d   '@4115c
    GOTO L_411d9   '@41169
L_41176:
L_4117b:
L_41180:
    CALL S_33d7a   '@41185
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_106e$ = "FIM") THEN GOTO L_411b0   '@4118f DS:38f6
    RETURN   '@411a6
L_411b0:
L_411b5:
    GOSUB L_4235f   '@411ba
    GOSUB L_436b5   '@411c7
L_411d9:
    IF NOT (V_106e$ = "R") THEN GOTO L_411fc   '@411de DS:38fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41180   '@411f5
L_411fc:
    IF NOT (V_106e$ = "C") THEN GOTO L_41262   '@411fc DS:3904
    IF NOT (V_0fec! > 0.0) THEN GOTO L_41253   '@41213 DS:3862
    A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0   '@4122e
L_41253:
    RETURN   '@41253
L_41262:
    IF NOT (V_106e$ = "I") THEN GOTO L_412a6   '@41262 DS:390a
    A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0   '@41279
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40943   '@4129e
L_412a6:
    IF NOT (V_106e$ = "ALTERADA") THEN GOTO L_412c5   '@412a6 DS:3910
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411b5   '@412bd
L_412c5:
    IF NOT (V_107e$ <> "REDEFINE") THEN GOTO L_418de   '@412c5 DS:38de
    V_1036! = 0.0   '@412dc DS:3862
    CALL S_2267a   '@412ed
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1c!(RT_CINT%(FX##(V_0fec!))) = V_1046!   '@412f7
    L_BP2e!(RT_CINT%(FX##(V_0fec!))) = V_1042!   '@4131e
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@41345
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4) = 0   '@41394
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5) = 0   '@413c4
    L_BP6c! = V_102e!   '@413f4
    IF NOT (L_BP6c! = 1.0) THEN GOTO L_41519   '@41404 DS:3842
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) = RT_CINT%(ABS(FX##(V_0fb8!)))   '@4141e
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) = RT_CINT%(ABS(FX##(V_0fbc!)))   '@4145d
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) = RT_CINT%(FX##(V_106a!))   '@4149c
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = RT_CINT%(FX##(V_102e!))   '@414d5
    GOTO L_418d9   '@41511
L_41519:
    IF NOT (L_BP6c! = 2.0) THEN GOTO L_4161d   '@4151a DS:38ea
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) = RT_CINT%(ABS(FX##(V_0fbc!)))   '@4152e
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) = RT_CINT%(ABS(FX##(V_0fc0!)))   '@4156d
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) = 0   '@415ac
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = RT_CINT%(FX##(V_102e!))   '@415d9
    GOTO L_418d9   '@41615
L_4161d:
    IF NOT (L_BP6c! = 3.0) THEN GOTO L_418d9   '@4161e DS:38ee
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) > 0 AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = 3) THEN GOTO L_416dc   '@41632
    L_BP64% = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1)   '@416a3
    GOTO L_416f5   '@416d4
L_416dc:
    V_11c2% = V_11c2% + 1   '@416dc
    L_BP64% = V_11c2%   '@416e5
L_416f5:
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) = L_BP64%   '@416f5
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) = RT_CINT%(FX##(A_10be!(0, 0)))   '@41726
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) = 0   '@41771
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = RT_CINT%(FX##(V_102e!))   '@4179e
    L_BP70! = A_10be!(0, 0)   '@417da
    FOR V_101e! = 0.0 TO L_BP70!   '@417fa DS:3842,3862
    A_1366%(L_BP64%, RT_CINT%(FX##(V_101e!)), 0) = RT_CINT%(FX##(A_10be!(RT_CINT%(FX##(V_101e!)), 0)) * 10.0)   '@41802 DS:38f2
    A_1366%(L_BP64%, RT_CINT%(FX##(V_101e!)), 1) = RT_CINT%(FX##(A_10be!(RT_CINT%(FX##(V_101e!)), 1)) * 10.0)   '@41853 DS:38f2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@418a6 DS:3842
    GOTO L_418d9   '@418d1
L_418d9:
L_418de:
    L_BP72% = (V_11c4% = 1)   '@418de
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP72%) <> 0) THEN GOTO L_41935   '@418fb DS:38de
    A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0   '@41910
L_41935:
    L_BP74% = (V_0e3e% > V_0fec!)   '@41935
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP74%) <> 0) THEN GOTO L_419aa   '@41961 DS:38de
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) = 0   '@41976 DS:3842
L_419aa:
    L_BP76% = (V_0fec! > 0.0)   '@419aa DS:3862
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP76%) <> 0) THEN GOTO L_41e6c   '@419d3 DS:38de
    RT_VIEWPRINT 20, 25   '@419e8
    COLOR 7   '@419fa
    RT_CLS 2   '@41a10
    PRINT " Entre com a distancia a PARTIR do Centro de Gravidade do Nivel inferior, ate"   '@41a1e DS:391c
    PRINT " o centro de gravidade da Secao predimensionada acima  ("; CHR$(26); " "; CHR$(24); " + cm)"   '@41a2c DS:396e,39aa,39b0
    COLOR 14   '@41a6a
    L_BP7a! = V_0fec!   '@41a80
    FOR V_101e! = 0.0 TO L_BP7a!   '@41a91 DS:3842,3862
    LOCATE RT_CINT%(25.0 - FX##(V_101e!)), 1   '@41a98 DS:39ba
    PRINT USING " NIVEL \         \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##"; A_11f6$(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101e!)), 0)); RT_PU#(L_BP1c!(RT_CINT%(FX##(V_101e!))), " NIVEL \         \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 1); RT_PU#(L_BP2e!(RT_CINT%(FX##(V_101e!))), " NIVEL \         \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 2); RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101e!)), 4)) / 100.0), " NIVEL \         \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 3); RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101e!)), 5)) / 100.0), " NIVEL \         \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 4);   '@41abf DS:39be,3a08
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@41bd6 DS:3842
    COLOR RT_CINT%(FX##(V_0dc0!))   '@41c01
    LOCATE RT_CINT%(25.0 - FX##(V_0fec!)), 52   '@41c1e DS:39ba
    PRINT "       ";   '@41c48 DS:3a0c
    LOCATE , 64   '@41c56
    PRINT "       ";   '@41c6f DS:3a0c
    LOCATE , 52   '@41c7d
    CALL MIXT_07f1_LimpaTeclado   '@41c96
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_1072$   '@41ca0 DS:381e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4) = RT_CINT%(FX##(VAL(V_1072$)) * 100.0#)   '@41cba DS:3a18
    LOCATE , 52   '@41d04
    PRINT USING "####.##"; RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4)) / 100.0), "####.##", 1);   '@41d1d DS:3a08,3a20
    LOCATE , 64   '@41d72
    CALL MIXT_07f1_LimpaTeclado   '@41d8b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_1072$   '@41d95 DS:381e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5) = RT_CINT%(FX##(VAL(V_1072$)) * 100.0#)   '@41daf DS:3a18
    LOCATE , 64   '@41df9
    PRINT USING "####.##"; RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5)) / 100.0), "####.##", 1);   '@41e12 DS:3a08,3a20
L_41e6c:
    IF NOT (V_106e$ = "V") THEN GOTO L_42350   '@41e6c DS:3a2c
L_41e88:
    RT_VIEWPRINT 20, 25   '@41e8d
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@41e9f
    RT_CLS 2   '@41ec4
    PRINT " Nivel a partir do qual (superiores) teremos uma nova secao"   '@41ed2 DS:3a32
    COLOR 3   '@41ee0
    PRINT " * <Enter>  para visualizar os Niveis definidos"   '@41ef6 DS:3a72
    COLOR 7   '@41f04
    CALL MIXT_07f1_LimpaTeclado   '@41f1a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero ou Nome *CANCELA* ", V_106e$   '@41f24 DS:3aa6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_41f5b   '@41f3e
    GOTO L_42346   '@41f53
L_41f5b:
    IF NOT (V_106e$ = "*") THEN GOTO L_41f84   '@41f5b DS:38d8
    CALL S_2608e   '@41f72
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41e88   '@41f7c
L_41f84:
    IF NOT (VAL(V_106e$) > 0.0#) THEN GOTO L_41fca   '@41f84 DS:385a
    V_101a! = VAL(V_106e$)   '@41fa8
    GOTO L_42056   '@41fc2
L_41fca:
    L_BP7e! = A_11c8!(0)   '@41fca
    FOR V_101a! = 1.0 TO L_BP7e!   '@41fe9 DS:3842
    IF NOT (UCASE$(V_106e$) = A_11f6$(RT_CINT%(FX##(V_101a!)))) THEN GOTO L_42029   '@41ff0
    GOTO L_42051   '@42021
L_42029:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101a!   '@42029 DS:3842
L_42051:
L_42056:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) <= V_101a! OR V_101a! <= V_0fe8!) THEN GOTO L_420c8   '@42056
    BEEP   '@420b6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41e88   '@420c0
L_420c8:
    L_BP32! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)))) / 10.0) * 10.0 + 1.0   '@420c8 DS:3842,38f2
    L_BP36! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)))) / 10.0) / 10.0 + 1.0   '@42140 DS:3842,38f2
    IF NOT (L_BP36! = 2.0 OR L_BP32! = 2.0) THEN GOTO L_421d9   '@4218b DS:38ea
    BEEP   '@421c7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41e88   '@421d1
L_421d9:
    LOCATE 24, 1   '@421d9
    COLOR 7   '@421f4
    PRINT " Confirme uma nova secao a partir do NIVEL"; V_101a!; " - ";   '@4220a DS:3ac4,3af2
    COLOR 14   '@4222e
    PRINT A_11f6$(RT_CINT%(FX##(V_101a!)));   '@42244
    COLOR 7   '@42266
    CALL MIXT_07f1_LimpaTeclado   '@4227c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "  N/*S* ", V_106e$   '@42286 DS:3afa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_422c5   '@422a0 DS:3b06
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41e88   '@422bd
L_422c5:
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = RT_CINT%(FX##(V_101a!))   '@422c5
    V_0fec! = FX##(V_0fec!) + 1.0   '@42300 DS:3842
    V_0fe8! = V_101a!   '@42316
    V_107e$ = ""   '@42327 DS:381e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_409ea   '@42339
L_42346:
L_42350:
    RETURN   '@42350
L_4235f:   ' sub-rotina (alvo de GOSUB)
    COLOR 14   '@42364
    LOCATE 13, 1   '@4237a
    PRINT " Aguarde .."   '@42395 DS:3b0c
    V_100a! = V_0e8e!   '@423a3
    V_105a! = 12.0   '@423b4 DS:3b1c
    V_0ffe! = V_0e8e!   '@423c5
    V_0fc8! = 0.00200000009499490261077880859375##   '@423d6 DS:3b20
    CALL S_25d0d   '@423e7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP82! = V_0f88! / ((FX##(V_0fc4!) - V_11b6!) * V_0e9a! / 100.0 + V_11b6!) * V_0de8!   '@423f1 DS:3a08
    L_BP86! = V_102e!   '@42423
    IF NOT (L_BP86! = 1.0) THEN GOTO L_426e8   '@42434 DS:3842
    IF NOT (V_0fbc! > 0.0 AND V_0fb8! = -2.0) THEN GOTO L_42525   '@4244f DS:3862,3b24
    V_0fb8! = FX##(L_BP82!) / V_0fbc!   '@4248d
    IF NOT (V_0eb0% > V_0fb8!) THEN GOTO L_424dd   '@424a3
    V_0fb8! = V_0eb0%   '@424c1
    GOTO L_4250c   '@424d5
L_424dd:
    V_0fb8! = RT_CINT%(FX##(V_0fb8!) / V_0eb2%) * V_0eb2%   '@424dd
L_4250c:
    V_0fb8! = -V_0fb8!   '@4250c
L_42525:
    IF NOT (V_0fb8! > 0.0 AND V_0fbc! = -2.0) THEN GOTO L_425fb   '@42525 DS:3862,3b24
    V_0fbc! = FX##(L_BP82!) / V_0fb8!   '@42563
    IF NOT (V_0eb0% > V_0fbc!) THEN GOTO L_425b3   '@42579
    V_0fbc! = V_0eb0%   '@42597
    GOTO L_425e2   '@425ab
L_425b3:
    V_0fbc! = RT_CINT%(FX##(V_0fbc!) / V_0eb2%) * V_0eb2%   '@425b3
L_425e2:
    V_0fbc! = -V_0fbc!   '@425e2
L_425fb:
    IF NOT (V_0fb8! = -2.0 AND V_0fbc! = -2.0) THEN GOTO L_426e0   '@425fb DS:3b24
    V_0fbc! = RT_SQR##(FX##(L_BP82!))   '@42639
    IF NOT (V_0eb0% > V_0fbc!) THEN GOTO L_42687   '@4264d
    V_0fbc! = V_0eb0%   '@4266b
    GOTO L_426b6   '@4267f
L_42687:
    V_0fbc! = RT_CINT%(FX##(V_0fbc!) / V_0eb2%) * V_0eb2%   '@42687
L_426b6:
    V_0fbc! = -V_0fbc!   '@426b6
    V_0fb8! = V_0fbc!   '@426ca
L_426e0:
    GOTO L_42a2b   '@426e0
L_426e8:
    IF NOT (L_BP86! = 2.0) THEN GOTO L_42a0d   '@426e9 DS:38ea
    IF NOT (V_0fc0! = -2.0 AND V_0fbc! = -2.0) THEN GOTO L_427e5   '@426fe DS:3b24
    V_0fbc! = -(V_0eb0% * 2)   '@4273c
    IF NOT (FX##(V_0fbc!) / V_0eb2% <> RT_IDIVL&((RT_CLNG&(FX##(V_0fbc!))), (V_0eb2%))) THEN GOTO L_427ca   '@42754
    V_0fbc! = -(INT(ABS(FX##(V_0fbc!) / V_0eb2%)) + 1.0) * V_0eb2%   '@42791 DS:3842
L_427ca:
    V_0fc0! = -V_0eb0%   '@427ca
L_427e5:
    IF NOT (V_0fc0! = -2.0 AND V_0fbc! > 0.0) THEN GOTO L_42877   '@427e5 DS:3862,3b24
    L_BP8a! = FX##(V_0fbc!) - V_0eb0% * 2   '@42823
    L_BP8e! = 0.0   '@42842 DS:3862
    CALL MIXT_082a_Maior(L_BP8a!, L_BP8e!, L_BP92!)   '@4284d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0fc0! = FX##(L_BP92!) * -1.0   '@42862 DS:3872
L_42877:
    IF NOT (V_0fc0! > 0.0 AND V_0fbc! = -2.0) THEN GOTO L_4294c   '@42877 DS:3862,3b24
    V_0fbc! = -(FX##(V_0eb0%) + V_0fc0!)   '@428b5
    IF NOT (FX##(V_0fbc!) / V_0eb2% <> RT_IDIVL&((RT_CLNG&(FX##(V_0fbc!))), (V_0eb2%))) THEN GOTO L_42947   '@428d1
    V_0fbc! = -(INT(ABS(FX##(V_0fbc!) / V_0eb2%)) + 1.0) * V_0eb2%   '@4290e DS:3842
L_42947:
L_4294c:
    IF NOT (V_0fc0! = 0.0 AND V_0fbc! = -2.0) THEN GOTO L_429a0   '@4294c DS:3862,3b24
    V_0fbc! = -V_0eb0%   '@4298a
L_429a0:
    IF NOT (V_0fbc! = 0.0 AND V_0fc0! = -2.0) THEN GOTO L_429f4   '@429a0 DS:3862,3b24
    V_0fc0! = -V_0eb0%   '@429de
L_429f4:
    V_0fb8! = V_0fbc!   '@429f4
    GOTO L_42a2b   '@42a05
L_42a0d:
    IF NOT (L_BP86! = 3.0) THEN GOTO L_42a2b   '@42a0e DS:38ee
    GOTO L_42a2b   '@42a23
L_42a2b:
L_42a30:
    L_BP96! = 0.0   '@42a35 DS:3862
    L_BP9a! = 0.0   '@42a46 DS:3862
    L_BP9e$ = ""   '@42a57 DS:381e
    L_BPa2$ = ""   '@42a6a DS:381e
    V_11c6% = 0   '@42a7d
    L_BPa6! = V_0fe8!   '@42a88
    FOR V_0ff0! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO L_BPa6! STEP -1.0   '@42a9a DS:3872
    V_1076$ = "PREDIMENSIONAMENTO"   '@42ac0 DS:3b28
    CALL S_60164   '@42ad2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1076$ = ""   '@42adc DS:381e
    V_0f88! = FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 0)   '@42aee
    V_10ba! = 0.0   '@42b28 DS:3862
    IF NOT (V_0ea2$ = "S") THEN GOTO L_42c90   '@42b39 DS:3b3e
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0ff0! = FX##(4.0)) THEN GOTO L_42bb9   '@42b50 DS:3b44
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.20000000298023223876953125## / 100.0   '@42b8e DS:3a08,3b48
L_42bb9:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0ff0! = FX##(5.0)) THEN GOTO L_42c22   '@42bb9 DS:3b4c
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.4000000059604644775390625## / 100.0   '@42bf7 DS:3a08,3b50
L_42c22:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0ff0! > FX##(5.0)) THEN GOTO L_42c8b   '@42c22 DS:3b4c
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.60000002384185791015625## / 100.0   '@42c60 DS:3a08,3b54
L_42c8b:
L_42c90:
    V_0f84! = RT_SQR##(RT_POT##((FX##(V_10ae!)), (2.0)) + RT_POT##((FX##(V_10b2!)), (2.0))) * V_0de4! * V_0de8!   '@42c9a DS:38ea
    V_1036! = 0.0   '@42cd8 DS:3862
    IF NOT (V_10b2! >= 0.0 AND V_10ae! > 0.0) THEN GOTO L_42d4e   '@42ce9 DS:3862
    V_1036! = ATN(FX##(V_10b2!) / V_10ae!) * 180.0 / V_0e5a!   '@42d27 DS:3b58
L_42d4e:
    IF NOT (V_10b2! > 0.0 AND V_10ae! <= 0.0) THEN GOTO L_42dbb   '@42d4e DS:3862
    V_1036! = ATN(-V_10ae! / FX##(V_10b2!)) * 180.0 / V_0e5a! + 90.0   '@42d8c DS:3b58,3b5c
L_42dbb:
    IF NOT (V_10b2! <= 0.0 AND V_10ae! < 0.0) THEN GOTO L_42e25   '@42dbb DS:3862
    V_1036! = ATN(FX##(V_10b2!) / V_10ae!) * 180.0 / V_0e5a! + 180.0   '@42df9 DS:3b58
L_42e25:
    IF NOT (V_10b2! < 0.0 AND V_10ae! >= 0.0) THEN GOTO L_42e95   '@42e25 DS:3862
    V_1036! = ATN(FX##(V_10ae!) / -V_10b2!) * 180.0 / V_0e5a! + 270.0   '@42e63 DS:3b58,3b60
L_42e95:
    V_1036! = FX##(V_1036!) - 90.0   '@42e95 DS:3b64
    IF NOT (V_1036! < 0.0) THEN GOTO L_42edc   '@42eab DS:3862
    V_1036! = 360.0 + FX##(V_1036!)   '@42ec6 DS:3b68
L_42edc:
    CALL S_21dfd   '@42edc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2267a   '@42ee6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPaa! = FX##(V_0e52!) / 100.0   '@42ef0 DS:3a08
    L_BPae! = -(FX##(V_103e!) / 3000.0) * (V_0e56$ = "S")   '@42f07 DS:3b3e,3b6c
    CALL MIXT_082a_Maior(L_BPaa!, L_BPae!, L_BPb2!)   '@42f35
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f84! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * L_BPb2! * V_0de8! + V_0f84!   '@42f4a
    L_BPb6! = 0.0   '@42f6e DS:3862
    L_BPba! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@42f80 DS:3a08
    CALL MIXT_082a_Maior(L_BPb6!, L_BPba!, L_BPbe!)   '@42fb1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc2! = 0.0   '@42fc6 DS:3862
    L_BPc6! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@42fd2 DS:3a08
    CALL MIXT_082a_Maior(L_BPc2!, L_BPc6!, L_BPca!)   '@43003
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_11b2% = 1 AND (FX##(L_BPca!) / V_104a! + FX##(V_0f84!) * 100.0 * V_100a! / V_0fd8! > FX##(V_11ba!) OR FX##(L_BPbe!) / V_104a! > FX##(V_11b6!))) THEN GOTO L_433ff   '@43018 DS:3a08
    L_BPce! = V_102e!   '@4307e
    IF NOT (L_BPce! = 1.0) THEN GOTO L_43216   '@4308f DS:3842
    IF NOT (V_0fb8! < 0.0) THEN GOTO L_4315c   '@430aa DS:3862
    V_0fb8! = FX##(V_0fb8!) - V_0eb2%   '@430c5
    IF NOT (FX##(V_0fb8!) / V_0eb2% <> RT_IDIVL&((RT_CLNG&(FX##(V_0fb8!))), (V_0eb2%))) THEN GOTO L_43157   '@430e1
    V_0fb8! = -(INT(ABS(FX##(V_0fb8!) / V_0eb2%)) + 1.0) * V_0eb2%   '@4311e DS:3842
L_43157:
L_4315c:
    IF NOT (V_0fbc! < 0.0) THEN GOTO L_4320e   '@4315c DS:3862
    V_0fbc! = FX##(V_0fbc!) - V_0eb2%   '@43177
    IF NOT (FX##(V_0fbc!) / V_0eb2% <> RT_IDIVL&((RT_CLNG&(FX##(V_0fbc!))), (V_0eb2%))) THEN GOTO L_43209   '@43193
    V_0fbc! = -(INT(ABS(FX##(V_0fbc!) / V_0eb2%)) + 1.0) * V_0eb2%   '@431d0 DS:3842
L_43209:
L_4320e:
    GOTO L_433e1   '@4320e
L_43216:
    IF NOT (L_BPce! = 2.0) THEN GOTO L_433c3   '@43217 DS:38ea
    IF NOT (V_0fbc! < 0.0) THEN GOTO L_432ef   '@4322c DS:3862
    V_0fbc! = FX##(V_0fbc!) - V_0eb2%   '@43247
    IF NOT (FX##(V_0fbc!) / V_0eb2% <> RT_IDIVL&((RT_CLNG&(FX##(V_0fbc!))), (V_0eb2%))) THEN GOTO L_432d9   '@43263
    V_0fbc! = -(INT(ABS(FX##(V_0fbc!) / V_0eb2%)) + 1.0) * V_0eb2%   '@432a0 DS:3842
L_432d9:
    V_0fb8! = V_0fbc!   '@432d9
L_432ef:
    IF NOT (V_0fbc! > 0.0 AND V_0fc0! < 0.0) THEN GOTO L_43372   '@432ef DS:3862
    L_BPd2! = FX##(V_0eb2%) + V_0fc0!   '@4332d
    L_BPd6! = 0.0   '@43347 DS:3862
    CALL MIXT_0877_Menor(L_BPd2!, L_BPd6!, L_BPda!)   '@43352
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0fc0! = L_BPda!   '@43367
L_43372:
    IF NOT (V_0fbc! >= 0.0 AND V_0fc0! >= 0.0) THEN GOTO L_433bb   '@43372 DS:3862
    V_11b2% = 0   '@433b0
L_433bb:
    GOTO L_433e1   '@433bb
L_433c3:
    IF NOT (L_BPce! = 3.0) THEN GOTO L_433e1   '@433c4 DS:38ee
    GOTO L_433e1   '@433d9
L_433e1:
    L_BP96! = -1.0   '@433e1 DS:3872
    GOTO L_43683   '@433f2
L_433ff:
    L_BPde! = 0.0   '@433ff DS:3862
    L_BPe2! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@43411 DS:3a08
    CALL MIXT_082a_Maior(L_BPde!, L_BPe2!, L_BPe6!)   '@43442
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BPe6!) / V_104a! >= FX##(L_BP96!)) THEN GOTO L_4350f   '@43457
    L_BPea! = 0.0   '@43471 DS:3862
    L_BPee! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@43483 DS:3a08
    CALL MIXT_082a_Maior(L_BPea!, L_BPee!, L_BPf2!)   '@434b4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP96! = FX##(L_BPf2!) / V_104a!   '@434c9
    L_BP9e$ = "NIVEL " + A_11f6$(RT_CINT%(FX##(V_0ff0!)))   '@434d9 DS:3b70
L_4350f:
    L_BPf6! = 0.0   '@4350f DS:3862
    L_BPfa! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@43521 DS:3a08
    CALL MIXT_082a_Maior(L_BPf6!, L_BPfa!, L_BPfe!)   '@43552
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BPfe!) / V_104a! + FX##(V_0f84!) * 100.0 * V_100a! / V_0fd8! >= FX##(L_BP9a!)) THEN GOTO L_4364d   '@43567 DS:3a08
    L_BP102! = 0.0   '@43598 DS:3862
    L_BP106! = (FX##(V_10b6!) - V_10ba! + V_0f88!) * V_0de8! - FX##(V_0e9a!) * V_104a! * V_0fc4! / 100.0   '@435aa DS:3a08
    CALL MIXT_082a_Maior(L_BP102!, L_BP106!, L_BP10a!)   '@435db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP9a! = FX##(L_BP10a!) / V_104a! + FX##(V_0f84!) * 100.0 * V_100a! / V_0fd8!   '@435f0 DS:3a08
    L_BPa2$ = "NIVEL " + A_11f6$(RT_CINT%(FX##(V_0ff0!)))   '@43617 DS:3b70
L_4364d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ff0!   '@43657 DS:3872
L_43683:
    IF NOT (L_BP96! = -1.0) THEN GOTO L_436a6   '@43683 DS:3872
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42a30   '@4369e
L_436a6:
    RETURN   '@436a6
L_436b5:   ' sub-rotina (alvo de GOSUB)
    RT_VIEWPRINT 8, 25   '@436ba
    RT_CLS 2   '@436cc
    RT_VIEWPRINT 6, 25   '@436da
    LOCATE 13, 1   '@436ec
    COLOR 11   '@43707
    PRINT " Compressao :";   '@4371d DS:3b7a
    COLOR 7   '@4372b
    PRINT USING "            tensao maxima admissivel  ####.### "; RT_PU#(RT_SNG!(FX##(V_11b6!) / V_0dec!), "            tensao maxima admissivel  ####.### ", 1);   '@43741 DS:3b8c
    PRINT V_0de0$   '@4376d
    COLOR RT_CINT%(FX##(V_0dc0!))   '@4377b
    PRINT "        maxima de ";   '@43798 DS:3bc0
    COLOR 4, 7   '@437a6
    PRINT USING "####.### "; RT_PU#(RT_SNG!(FX##(L_BP96!) / V_0dec!), "####.### ", 1);   '@437c4 DS:3bd6
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@437f0
    PRINT " "; V_0de0$; "  encontrada no ";   '@4381c DS:39aa,3be4
    COLOR 14   '@4383c
    PRINT L_BP9e$   '@43852
    COLOR 11   '@43861
    PRINT " Compressao + Momento :";   '@43877 DS:3bf8
    COLOR 7   '@43885
    PRINT USING "  tensao maxima admissivel  ####.### "; RT_PU#(RT_SNG!(FX##(V_11ba!) / V_0dec!), "  tensao maxima admissivel  ####.### ", 1);   '@4389b DS:3c14
    PRINT V_0de0$   '@438c7
    COLOR RT_CINT%(FX##(V_0dc0!))   '@438d5
    PRINT "        maxima de ";   '@438f2 DS:3bc0
    COLOR 4, 7   '@43900
    PRINT USING "####.### "; RT_PU#(RT_SNG!(FX##(L_BP9a!) / V_0dec!), "####.### ", 1);   '@4391e DS:3bd6
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@4394a
    PRINT " "; V_0de0$; "  encontrada no ";   '@43976 DS:39aa,3be4
    COLOR 14   '@43996
    PRINT L_BPa2$   '@439ac
    IF NOT (L_BP9a! > V_11ba! OR L_BP96! > V_11b6!) THEN GOTO L_43a7e   '@439bb
    COLOR 4, 7   '@439f9
    BEEP   '@43a17
    LOCATE 17, 50   '@43a21
    PRINT " CUIDADO "   '@43a3f DS:3c3e
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@43a4d
L_43a7e:
    IF NOT (V_102e! = 3.0) THEN GOTO L_43bd2   '@43a7e DS:38ee
    COLOR RT_CINT%(FX##(V_0dc0!))   '@43a99
    LOCATE 20, 1   '@43ab6
    PRINT " Deseja alterar as Coordenadas da Poligonal N/*S* ";   '@43ad1 DS:3c4c
    CALL MIXT_07f1_LimpaTeclado   '@43adf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@43ae9 DS:381e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 20, 1   '@43b03
    PRINT RT_TAB$(79); ""; " ";   '@43b1e DS:381e,39aa
    IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_43bcd   '@43b3e DS:3b06
    RT_VIEWPRINT 8, 25   '@43b5b
    GOSUB L_45711   '@43b6d
    RT_VIEWPRINT 13, 25   '@43b7a
    RT_CLS 2   '@43b8c
    RT_VIEWPRINT 6, 25   '@43b9a
    V_106e$ = "ALTERADA"   '@43bac DS:3910
    RETURN   '@43bbe
L_43bcd:
L_43bd2:
    COLOR 14, 4   '@43bd2
    LOCATE 11, 28   '@43bed
    PRINT " CARGA :"; RT_SNG!(INT((FX##(V_10b6!) - V_10ba! + V_0f88!) * 100.0) / 100.0); V_0ddc$; " "   '@43c0b DS:39aa,3a08,3c82
    COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@43c5a
    LOCATE 18, 1   '@43c7f
    PRINT " SECAO PROPOSTA :";   '@43c9a DS:3c8e
    COLOR RT_CINT%(FX##(V_0dc0!))   '@43ca8
    L_BP10e! = V_102e!   '@43cc5
    IF NOT (L_BP10e! = 1.0) THEN GOTO L_43d47   '@43cd6 DS:3842
    PRINT " B ="; RT_SNG!(ABS(FX##(V_0fb8!))); "cm   H ="; RT_SNG!(ABS(FX##(V_0fbc!))); "cm"   '@43cf1 DS:3ca4,3cac,3cb8
    GOTO L_43e48   '@43d3f
L_43d47:
    IF NOT (L_BP10e! = 2.0) THEN GOTO L_43df7   '@43d48 DS:38ea
    PRINT " Diametro ="; RT_SNG!(ABS(FX##(V_0fbc!))); "cm   ";   '@43d5d DS:3cbe,3cce
    IF NOT (V_0fc0! <> 0.0) THEN GOTO L_43ddc   '@43d8b DS:3862
    PRINT "Diametro interno ="; RT_SNG!(ABS(FX##(V_0fc0!))); "cm"   '@43da6 DS:3cb8,3cd8
    GOTO L_43def   '@43dd4
L_43ddc:
    PRINT ""   '@43ddc DS:381e
L_43def:
    GOTO L_43e48   '@43def
L_43df7:
    IF NOT (L_BP10e! = 3.0) THEN GOTO L_43e48   '@43df8 DS:38ee
    PRINT " Poligonal com"; A_10be!(0, 0); "vertices"   '@43e0d DS:3cee,3d00
    GOTO L_43e48   '@43e40
L_43e48:
L_43e4d:   ' sub-rotina (alvo de GOSUB)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@43e52
    LOCATE 21, 1   '@43e7e
    PRINT "   <A>";   '@43e99 DS:3d0c
    COLOR 7   '@43ea7
    PRINT "ceita a Secao proposta e passa a predimensionar a proxima Coluna"   '@43ebd DS:3d16
    COLOR RT_CINT%(FX##(V_0dc0!))   '@43ecb
    IF NOT (V_107e$ = "REDEFINE") THEN GOTO L_43f39   '@43ee8 DS:38de
    PRINT "   <M>";   '@43eff DS:3d5a
    COLOR 7   '@43f0d
    PRINT "odifica as excentricidades entre as diferentes Secoes"   '@43f23 DS:3d64
    GOTO L_43f70   '@43f31
L_43f39:
    PRINT "   <R>";   '@43f39 DS:3d9e
    COLOR 7   '@43f47
    PRINT "etorna a escolha do tipo de secao e redefine"   '@43f5d DS:3da8
L_43f70:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@43f70
    IF NOT (V_107e$ = "REDEFINE") THEN GOTO L_43fde   '@43f8d DS:38de
    PRINT "   <E>";   '@43fa4 DS:3dd8
    COLOR 7   '@43fb2
    PRINT "limina uma variacao de secao"   '@43fc8 DS:3de2
    GOTO L_44015   '@43fd6
L_43fde:
    PRINT "   <C>";   '@43fde DS:3e02
    COLOR 7   '@43fec
    PRINT "ancela o predimensionamento e passa para proxima Coluna"   '@44002 DS:3e0c
L_44015:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44015
    PRINT "   <I>";   '@44032 DS:3e48
    COLOR 7   '@44040
    PRINT "nicia novamente o predimensionamento desta Coluna"   '@44056 DS:3e52
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44064
    PRINT "   <V>";   '@44081 DS:3e88
    COLOR 7   '@4408f
    PRINT "aria a secao da Coluna entre os niveis (maximo"; V_0e3e% + 1; "secoes)";   '@440a5 DS:3e92,3ec4
    CALL MIXT_07f1_LimpaTeclado   '@440c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@440d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = UCASE$(V_106e$)   '@440ec
    IF NOT (RT_INSTR%((1), ("ARCIVME"), (V_106e$)) = 0) THEN GOTO L_44129   '@44104 DS:3ed0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@44121
L_44129:
    L_BP110% = (V_107e$ = "REDEFINE")   '@44129 DS:38de
    L_BP112% = (V_106e$ = "R")   '@4414f DS:38fe
    IF NOT (((V_106e$ = "C" OR L_BP112%) AND L_BP110%) <> 0) THEN GOTO L_44194   '@44168 DS:3904
    BEEP   '@44182
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@4418c
L_44194:
    L_BP114% = (V_107e$ <> "REDEFINE")   '@44194 DS:38de
    L_BP116% = (V_106e$ = "M")   '@441ba DS:3edc
    IF NOT (((V_106e$ = "E" OR L_BP116%) AND L_BP114%) <> 0) THEN GOTO L_441ff   '@441d3 DS:3ee2
    BEEP   '@441ed
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@441f7
L_441ff:
    L_BP118% = (V_107e$ = "REDEFINE")   '@441ff DS:38de
    L_BP11a% = (V_106e$ = "M")   '@44225 DS:3edc
    IF NOT ((V_0fec! = 0.0 AND ((V_106e$ = "E" OR L_BP11a%) AND L_BP118%)) <> 0) THEN GOTO L_44285   '@4423e DS:3862,3ee2
    BEEP   '@44273
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@4427d
L_44285:
    IF NOT (V_0e3e% = V_0fec! AND V_106e$ = "V") THEN GOTO L_4435c   '@44285 DS:3a2c
    BEEP   '@442c2
    LOCATE 25, 46   '@442cc
    COLOR 4, 7   '@442ea
    PRINT "(maximo"; V_0e3e% + 1; "secoes)";   '@44308 DS:3ec4,3ee8
    CALL MIXT_07f1_LimpaTeclado   '@44329
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@44333
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@4434f
L_4435c:
    IF NOT (V_106e$ = "M") THEN GOTO L_44975   '@4435c DS:3edc
    RT_VIEWPRINT 19, 25   '@44373
    COLOR 7   '@44385
    RT_CLS 2   '@4439b
    PRINT " Entre com a distancia a PARTIR do Centro de Gravidade da Secao do Nivel"   '@443a9 DS:3ef4
    PRINT " inferior, ate o centro de gravidade da Secao do Nivel Superior  ("; CHR$(26); " "; CHR$(24); " + cm)"   '@443b7 DS:39aa,39b0,3f40
    L_BP11c% = RT_CINT%(FX##(V_0fec!))   '@443f5
    FOR V_0ff8% = 0 TO L_BP11c%   '@44408
    LOCATE 25 - V_0ff8%, 1   '@4440e
    COLOR 14   '@4442a
    IF NOT (V_0ff8% = 0) THEN GOTO L_44465   '@44440
    COLOR 11   '@4444f
L_44465:
    PRINT USING " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##"; RT_PU#(V_0ff8% + 1, " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 1); A_11f6$(A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)); RT_PU#(L_BP1c!(V_0ff8%), " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 2); RT_PU#(L_BP2e!(V_0ff8%), " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 3); RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 4)) / 100.0), " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 4); RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 5)) / 100.0), " # NIVEL \       \  Xcg=#####.##  Ycg=#####.##  Ex=####.##  Ey=####.##", 5);   '@44465 DS:3a08,3f86
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ff8%   '@44563
L_4457d:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44582
    LOCATE 21, 1   '@4459f
    PRINT " Numero da Secao do Nivel superior que deseja alterar *FIM*"; RT_TAB$(79); "";   '@445ba DS:381e,3fd0
    LOCATE , 60   '@445da
    CALL MIXT_07f1_LimpaTeclado   '@445f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " ", V_106e$   '@445fd DS:39aa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP11e% = (LEN(V_106e$) > 0)   '@44617 DS:4010
    L_BP120% = (VAL(V_106e$) < 2.0#)   '@4463a DS:3842
    IF NOT (((FX##(VAL(V_106e$)) > FX##(V_0fec!) + 1.0 OR L_BP120%) AND L_BP11e%) <> 0) THEN GOTO L_4469d   '@44665
    BEEP   '@4468b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4457d   '@44695
L_4469d:
    IF NOT (LEN(V_106e$) > 0) THEN GOTO L_44948   '@4469d
    V_0ff8% = RT_CINT%(FX##(VAL(V_106e$)) - 1.0#)   '@446b2 DS:4018
    COLOR RT_CINT%(FX##(V_0dc0!))   '@446d2
    LOCATE 25 - V_0ff8%, 52   '@446ef
    PRINT "       ";   '@4470e DS:3a0c
    LOCATE , 52   '@4471c
    CALL MIXT_07f1_LimpaTeclado   '@44735
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_1072$   '@4473f DS:381e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_1072$) > 0) THEN GOTO L_447b1   '@44759
    A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 4) = RT_CINT%(FX##(VAL(V_1072$)) * 100.0#)   '@4476e DS:3a18
L_447b1:
    LOCATE , 52   '@447b1
    PRINT USING "####.##"; RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 4)) / 100.0), "####.##", 1);   '@447ca DS:3a08,3a20
    LOCATE , 64   '@44818
    PRINT "       ";   '@44831 DS:3a0c
    LOCATE , 64   '@4483f
    CALL MIXT_07f1_LimpaTeclado   '@44858
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_1072$   '@44862 DS:381e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_1072$) > 0) THEN GOTO L_448d4   '@4487c
    A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 5) = RT_CINT%(FX##(VAL(V_1072$)) * 100.0#)   '@44891 DS:3a18
L_448d4:
    LOCATE , 64   '@448d4
    PRINT USING "####.##"; RT_PU#(RT_SNG!(FX##(A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 5)) / 100.0), "####.##", 1);   '@448ed DS:3a08,3a20
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4457d   '@4493b
L_44948:
    RT_CLS 2   '@44948
    RT_VIEWPRINT 6, 25   '@44956
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@44968
L_44975:
    IF NOT (V_106e$ = "E") THEN GOTO L_44f62   '@44975 DS:3ee2
    RT_VIEWPRINT 20, 25   '@4498c
    COLOR 7   '@4499e
    RT_CLS 2   '@449b4
    PRINT ""   '@449c2 DS:381e
    PRINT " Eliminacao de variacao de secao"   '@449d0 DS:4020
    PRINT " Escolha a secao que deseja Eliminar  ";   '@449de DS:4044
    COLOR RT_CINT%(FX##(V_0dc0!))   '@449ec
    PRINT "<"; CHR$(24); "> <"; CHR$(25); "> "   '@44a09 DS:406e,4074,407c
    PRINT ""   '@44a47 DS:381e
    COLOR 7   '@44a55
    PRINT " Acione  ";   '@44a6b DS:4082
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44a79
    PRINT "<Enter>";   '@44a96 DS:4090
    COLOR 7   '@44aa4
    PRINT " para Eliminar,  ";   '@44aba DS:409c
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44ac8
    PRINT "<R>";   '@44ae5 DS:40b2
    COLOR 7   '@44af3
    PRINT " para Retornar ";   '@44b09 DS:40ba
    RT_VIEWPRINT 1, 25   '@44b17
    COLOR 14   '@44b29
    V_0ff8% = 1   '@44b3f
L_44b4f:
    LOCATE V_0ff8% + 10, 75   '@44b54
    COLOR 11   '@44b73
    PRINT CHR$(27); CHR$(45); CHR$(45)   '@44b89
L_44bc0:
    V_106e$ = RT_INKEY$   '@44bc0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF LEN(V_106e$) <= 0 THEN GOTO L_44bc0   '@44bd4
    LOCATE V_0ff8% + 10, 75   '@44be6
    PRINT "   "   '@44c05 DS:40ce
    L_BP124$ = V_106e$   '@44c13
    IF NOT (L_BP124$ <> "8") THEN GOTO L_44c66   '@44c26 DS:40d6
    IF NOT (CHR$(0) + CHR$(72) = L_BP124$) THEN GOTO L_44c8e   '@44c3e
L_44c66:
    IF NOT (V_0ff8% > 1) THEN GOTO L_44c7e   '@44c66
    V_0ff8% = V_0ff8% - 1   '@44c75
L_44c7e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44b4f   '@44c7e
L_44c8e:
    IF NOT (L_BP124$ <> "2") THEN GOTO L_44cc9   '@44c8e DS:40dc
    IF NOT (CHR$(0) + CHR$(80) = L_BP124$) THEN GOTO L_44d00   '@44ca1
L_44cc9:
    IF NOT (V_0ff8% < V_0fec!) THEN GOTO L_44cf0   '@44cc9
    V_0ff8% = V_0ff8% + 1   '@44ce7
L_44cf0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44b4f   '@44cf0
L_44d00:
    IF NOT (CHR$(13) = L_BP124$) THEN GOTO L_44ef0   '@44d00
    A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8% - 1, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)   '@44d19
    IF NOT (V_0ff8% < V_0fec!) THEN GOTO L_44e71   '@44d61
    L_BP128! = V_0fec!   '@44d7f
    FOR V_1002! = V_0ff8% + 1 TO L_BP128!   '@44d90 DS:3842
    FOR V_1012! = 0.0 TO 6.0   '@44d9c DS:3842,3862,40e2
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!) - 1.0), RT_CINT%(FX##(V_1012!))) = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), RT_CINT%(FX##(V_1012!)))   '@44daa DS:3872
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1012!   '@44e14 DS:3842,40e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1002!   '@44e40 DS:3842
L_44e71:
    V_0fec! = FX##(V_0fec!) - 1.0   '@44e71 DS:3872
    A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) = 0   '@44e87 DS:3842
    RT_VIEWPRINT 10, 25   '@44ebb
    RT_CLS 2   '@44ecd
    GOSUB L_451f2   '@44edb
    GOTO L_44f55   '@44ee8
L_44ef0:
    IF NOT (L_BP124$ <> "R") THEN GOTO L_44f16   '@44ef0 DS:38fe
    IF NOT (L_BP124$ = "r") THEN GOTO L_44f3e   '@44f03 DS:40e6
L_44f16:
    RT_VIEWPRINT 19, 25   '@44f16
    RT_CLS 2   '@44f28
    GOTO L_44f55   '@44f36
L_44f3e:
    BEEP   '@44f3e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44b4f   '@44f48
L_44f55:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e4d   '@44f55
L_44f62:
    RETURN   '@44f62
L_44f71:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = 0) THEN GOTO L_44fc7   '@44f76
    V_106e$ = ""   '@44fab DS:381e
    RETURN   '@44fbd
L_44fc7:
    BEEP   '@44fc7
    COLOR RT_CINT%(FX##(V_0dc0!))   '@44fd1
    PRINT ""   '@44fee DS:381e
    PRINT " Coluna ja predimensionada"   '@44ffc DS:40ec
    PRINT ""   '@4500a DS:381e
    GOSUB L_451f2   '@45018
    COLOR 3   '@45025
    LOCATE 25, 1   '@4503b
    PRINT " Acione  * <Enter>  para manter a Secao para alteracoes";   '@45056 DS:410a
    COLOR 7   '@45064
    LOCATE 24, 1   '@4507a
    CALL MIXT_07f1_LimpaTeclado   '@45095
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Predimensiono a Coluna novamente  S/*N* ", V_106e$   '@4509f DS:4146
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12a% = (UCASE$(V_106e$) <> "S")   '@450b9 DS:3b3e
    IF NOT ((V_106e$ <> "*" AND L_BP12a%) <> 0) THEN GOTO L_4510d   '@450e5 DS:38d8
    V_106e$ = "NAO"   '@450fb DS:38d0
L_4510d:
    IF NOT (V_106e$ = "*") THEN GOTO L_4513e   '@4510d DS:38d8
    RT_VIEWPRINT 19, 25   '@45124
    GOTO L_45150   '@45136
L_4513e:
    RT_VIEWPRINT 8, 25   '@4513e
L_45150:
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_451c3   '@45150 DS:3b3e
    V_0fe8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@4516d
    V_0fec! = 0.0   '@4519b DS:3862
    V_107e$ = ""   '@451ac DS:381e
L_451c3:
    RT_CLS 2   '@451c3
    RT_VIEWPRINT 6, 25   '@451d1
    RETURN   '@451e3
L_451f2:   ' sub-rotina (alvo de GOSUB)
    V_101a! = 0.0   '@451f7 DS:3862
L_4520e:
    COLOR RT_CINT%(FX##(V_0dc0!))   '@4520e
    IF NOT (V_101a! = 0.0) THEN GOTO L_4527c   '@4522b DS:3862
    V_0fe8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@45246
    GOTO L_452bf   '@45274
L_4527c:
    V_0fe8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!) - 1.0), 0)   '@4527c DS:3872
L_452bf:
    PRINT " NIVEL "; A_11f6$(RT_CINT%(FX##(V_0fe8!))); " a "; A_11f6$(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 0));   '@452bf DS:4174,4180
    COLOR 14   '@4532d
    L_BP12c% = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 6)   '@45343
    IF NOT (L_BP12c% = 1) THEN GOTO L_454d2   '@45375
    PRINT RT_TAB$(30); ""; "B ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 1); "cm"; RT_TAB$(45); ""; "H ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "cm";   '@45384 DS:381e,3cb8,4188,4190
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 3) <> 0) THEN GOTO L_454bc   '@4542d
    PRINT RT_TAB$(62); ""; "ROT ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 3); "graus"   '@45460 DS:381e,4198,41a2
    GOTO L_454ca   '@454b4
L_454bc:
    PRINT ""   '@454bc DS:381e
L_454ca:
    GOTO L_4565e   '@454ca
L_454d2:
    IF NOT (L_BP12c% = 2) THEN GOTO L_455e3   '@454d2
    PRINT RT_TAB$(30); ""; "Diametro ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 1); "cm";   '@454dc DS:381e,3cb8,41ac
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2) > 0) THEN GOTO L_455c8   '@45533
    PRINT RT_TAB$(55); ""; "Diametro interno ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "cm"   '@45569 DS:381e,3cb8,3cd8
    GOTO L_455db   '@455c0
L_455c8:
    PRINT ""   '@455c8 DS:381e
L_455db:
    GOTO L_4565e   '@455db
L_455e3:
    IF NOT (L_BP12c% = 3) THEN GOTO L_4565e   '@455e3
    PRINT RT_TAB$(30); ""; "Poligonal com"; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "vertices"   '@455ed DS:381e,3d00,41ba
    V_106e$ = "*"   '@45644 DS:38d8
    GOTO L_4565e   '@45656
L_4565e:
    V_0fec! = V_101a!   '@4565e
    V_101a! = FX##(V_101a!) + 1.0   '@4566f DS:3842
    L_BP130! = V_0e3e%   '@45685
    CALL MIXT_0877_Menor(L_BP130!, V_101a!, L_BP134!)   '@45699
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (NOT (V_0e3e% >= V_101a! AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP134!)), 0) > 0)) THEN GOTO L_4520e   '@456ad
    RETURN   '@45702
L_45711:   ' sub-rotina (alvo de GOSUB)
    L_BP138! = 0.0   '@45716 DS:3862
    L_BP13c! = 1.0   '@45728 DS:3842
    CALL MIXT_0dbe_GuardaTela(L_BP138!, L_BP13c!, V_0dcc$)   '@45733
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1016! = 1.0   '@45746 DS:3842
L_4575c:
    L_BP140! = FX##(V_1016!) + 39.0   '@45761 DS:41cc
    L_BP144! = A_10be!(0, 0)   '@45777
    CALL MIXT_0877_Menor(L_BP140!, L_BP144!, L_BP148!)   '@45792
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(0, 0) = L_BP144!   '@457a7
    V_101e! = L_BP148!   '@457c2
    GOSUB L_45861   '@457cd
    L_BP14c! = 1.0   '@457da DS:3842
    L_BP150! = 0.0   '@457ec DS:3862
    CALL MIXT_0dbe_GuardaTela(L_BP14c!, L_BP150!, V_0dcc$)   '@457f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_10be!(0, 0) = V_101e!) THEN GOTO L_4583e   '@4580a
    RETURN   '@45834
L_4583e:
    V_1016! = FX##(V_101e!) + 1.0   '@4583e DS:3842
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4575c   '@45854
    ' ---- F_4585c @0x4585c  (04585c_F_4585c.lift.txt; evidence_id (assembly): ev_f8d23988ff531d504ee208667ad7c496221c8517fef694473129247384370a60)
L_45861:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04093e_F_4093e
    V_107a$ = "*"   '@45866 DS:38d8
    LOCATE 22, 1   '@45878
    PRINT RT_TAB$(80); "";   '@45893 DS:381e
L_458af:
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@458b4 DS:3b44
    L_BP154! = V_101e!   '@458e5
    FOR V_100e! = V_1016! TO L_BP154!   '@458f7 DS:3842
    COLOR RT_CINT%(FX##(V_0dc0!))   '@458fe
    IF NOT ((FX##(V_100e!) - 1.0) / 10.0 = RT_CLNG&(FX##(V_100e!) - 1.0) \ 10&) THEN GOTO L_459e1   '@4591b DS:3872,38f2
    LOCATE 9, 19& * (RT_CLNG&(FX##(V_100e!) - V_1016!) \ 10&) + 1&   '@4595c
    PRINT CHR$(218); RT_STRINGC$((14), (196)); CHR$(191)   '@459a6
L_459e1:
    LOCATE RT_CINT%(FX##(V_100e!) - 10& * (RT_CLNG&(FX##(V_100e!) - 1.0) \ 10&) + 9.0#), 19& * (RT_CLNG&(FX##(V_100e!) - V_1016!) \ 10&) + 1&   '@459e1 DS:3872,41d0
    PRINT CHR$(179);   '@45a64
    COLOR 14   '@45a78
    PRINT USING "## "; RT_PU#(V_100e!, "## ", 1);   '@45a8e DS:41d8
    COLOR RT_CINT%(FX##(V_0dc0!))   '@45aae
    PRINT USING "###.#,###.#"; RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!)), 0), "###.#,###.#", 1); RT_PU#(A_10be!(RT_CINT%(FX##(V_100e!)), 1), "###.#,###.#", 2);   '@45acb DS:41e0
    PRINT CHR$(179);   '@45b2b
    COLOR 0   '@45b3f
    PRINT CHR$(219)   '@45b54
    IF NOT (V_107a$ = "*") THEN GOTO L_45ca2   '@45b68 DS:38d8
    LOCATE , 19& * (RT_CLNG&(FX##(V_100e!) - V_1016!) \ 10&) + 1&   '@45b7f
    COLOR RT_CINT%(FX##(V_0dc0!))   '@45bc4
    PRINT CHR$(192); RT_STRINGC$((14), (196)); CHR$(217);   '@45be1
    COLOR 0   '@45c17
    PRINT CHR$(219)   '@45c2c
    LOCATE , 19& * (RT_CLNG&(FX##(V_100e!) - V_1016!) \ 10&) + 3&   '@45c40
    PRINT RT_STRINGC$((15), (219))   '@45c85
L_45ca2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@45ca2 DS:3842
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@45cce
    V_107a$ = ""   '@45cfa DS:381e
L_45d11:
    LOCATE 22, 1   '@45d16
    PRINT " Vertice , Cood X , Cood y  *FIM* "; RT_TAB$(79); "";   '@45d31 DS:381e,41f0
    LOCATE 22, 35   '@45d51
    CALL MIXT_07f1_LimpaTeclado   '@45d6f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_00ff_Le3Campos(V_106e$, V_1072$, V_1076$)   '@45d79
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_45dae   '@45d8f
    RETURN   '@45da4
L_45dae:
    L_BP156% = (VAL(V_106e$) < 1.0#)   '@45dae DS:3846
    IF NOT ((FX##(VAL(V_106e$)) > FX##(A_10be!(0, 0)) OR L_BP156%) <> 0) THEN GOTO L_45e27   '@45df3
    BEEP   '@45e15
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d11   '@45e1f
L_45e27:
    L_BP158% = (LEN(V_1072$) > 0)   '@45e27 DS:385a
    IF NOT ((VAL(V_1072$) >= 0.0# AND L_BP158%) <> 0) THEN GOTO L_45ea8   '@45e4a
    A_10be!(RT_CINT%(FX##(VAL(V_106e$))), 0) = VAL(V_1072$)   '@45e6c
L_45ea8:
    L_BP15a% = (LEN(V_1076$) > 0)   '@45ea8 DS:385a
    IF NOT ((VAL(V_1076$) >= 0.0# AND L_BP15a%) <> 0) THEN GOTO L_45f2a   '@45ecb
    A_10be!(RT_CINT%(FX##(VAL(V_106e$))), 1) = VAL(V_1076$)   '@45eed
L_45f2a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_458af   '@45f2a
    ' ---- FUN_4000_5f37 @0x45f37  (045f37_FUN_4000_5f37.lift.txt; evidence_id (assembly): ev_c04cc328f7bc921264df8e2f77bd359e1ae202fbe122d5a7ede8280d6d12507c)
L_45f37:   ' entrada vinda de 04015f_FUN_4000_015f
    ' @45f37 libera strings locais (L_BP124)
    ' @45f41 libera strings locais (L_BPa2)
    ' @45f4b libera strings locais (L_BP9e)
    ' @45f55 libera strings locais (L_BP5e)
    ' @45f5e libera strings locais (L_BP3a)
    ERASE L_BP1c!   '@45f67
    ERASE L_BP2e!   '@45f70
    ' END SUB   '@45f79
END SUB

SUB S_45f89   ' entrada de SUB/FUNCTION (B$ENRA, locais 362 bytes) (0x45f89)
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
    DIM L_BPb6!
    DIM L_BPba!
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
    REDIM L_BPd0!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_4000_5f89 @0x45f89  (045f89_FUN_4000_5f89.lift.txt; evidence_id (assembly): ev_c6f5f5ea2879fc23086dc03138ac18cf6bf1452284c2cafe415e1e4193cd921c)
    REDIM L_BPd0!(1 TO 4, 0 TO 2)   '@45fb9
    L_BPdc! = V_0fe8!   '@45fe4
L_45ffa:
    L_BP82! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPdc!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPdc!)))) / 10.0) * 10.0 + 1.0   '@45ffa DS:3842,38f2
    IF NOT (L_BP82! <> 2.0) THEN GOTO L_46096   '@46073 DS:38ea
    GOTO L_460b4   '@4608e
L_46096:
    L_BPdc! = FX##(L_BPdc!) - 1.0   '@46096 DS:3872
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45ffa   '@460ac
L_460b4:
    L_BPe0! = V_0fe8!   '@460b4
L_460ca:
    L_BP86! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPe0!)))) / 10.0) / 10.0 + 1.0   '@460ca DS:3842,38f2
    IF NOT (L_BP86! <> 2.0) THEN GOTO L_46139   '@46116 DS:38ea
    GOTO L_46158   '@46131
L_46139:
    L_BPe0! = FX##(L_BPe0!) - 1.0   '@46139 DS:3872
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_460ca   '@4614f
L_46158:
    L_BP8a! = 0.0   '@46158 DS:3862
    L_BPd4! = V_0fe8!   '@46169
L_46180:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > L_BPd4!) THEN GOTO L_4626e   '@46181
    L_BPd4! = FX##(L_BPd4!) + 1.0   '@461b4 DS:3842
    L_BP8a! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPd4!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPd4!)))) / 10.0) * 10.0 + 1.0   '@461ca DS:3842,38f2
    IF NOT (L_BP8a! <> 2.0) THEN GOTO L_46266   '@46243 DS:38ea
    GOTO L_4626e   '@4625e
L_46266:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46180   '@46266
L_4626e:
    L_BP8e! = 0.0   '@4626e DS:3862
    L_BPd8! = V_0fe8!   '@4627f
L_46296:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > L_BPd8!) THEN GOTO L_46358   '@46297
    L_BPd8! = FX##(L_BPd8!) + 1.0   '@462ca DS:3842
    L_BP8e! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BPd8!)))) / 10.0) / 10.0 + 1.0   '@462e0 DS:3842,38f2
    IF NOT (L_BP8e! <> 2.0) THEN GOTO L_4634f   '@4632c DS:38ea
    GOTO L_46358   '@46347
L_4634f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46296   '@4634f
L_46358:
    L_BP0e! = 0.0   '@46358 DS:3862
    L_BP12! = 0.0   '@46368 DS:3862
    IF NOT (V_11c6% = 1 AND A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > V_0fe8!) THEN GOTO L_46653   '@46378
    L_BP0e! = FX##(A_11c8!(RT_CINT%(FX##(L_BPd4!)))) - A_11c8!(RT_CINT%(FX##(L_BPdc!)))   '@463c6
    L_BP12! = FX##(A_11c8!(RT_CINT%(FX##(L_BPd8!)))) - A_11c8!(RT_CINT%(FX##(L_BPe0!)))   '@46407
    L_BP82! = -(L_BP82! = 1.0) * 2 - (L_BP82! = 2.0) * 3 - (L_BP82! >= 5.0)   '@46448 DS:3842,38ea,3b4c
    L_BP8a! = -(L_BP8a! = 1.0) * 2 - (L_BP8a! = 2.0) * 3 - (L_BP8a! >= 5.0)   '@464af DS:3842,38ea,3b4c
    L_BP0e! = FX##(A_0f28!(RT_CINT%(FX##(L_BP82!)), RT_CINT%(FX##(L_BP8a!)))) * L_BP0e!   '@46516
    L_BP86! = -(L_BP86! = 1.0) * 2 - (L_BP86! = 2.0) * 3 - (L_BP86! >= 5.0)   '@4654b DS:3842,38ea,3b4c
    L_BP8e! = -(L_BP8e! = 1.0) * 2 - (L_BP8e! = 2.0) * 3 - (L_BP8e! >= 5.0)   '@465b2 DS:3842,38ea,3b4c
    L_BP12! = FX##(A_0f28!(RT_CINT%(FX##(L_BP86!)), RT_CINT%(FX##(L_BP8e!)))) * L_BP12!   '@46619
L_46653:
    L_BPec! = (FX##(V_0f88!) + V_0f90! + (FX##(V_10b6!) - V_10ba!)) * V_0de8!   '@46653
    IF NOT (V_11c6% = 0) THEN GOTO L_466ad   '@4667b
    A_1450!(0, 3) = V_10ae!   '@4668a
L_466ad:
    IF NOT (V_11c6% = 0) THEN GOTO L_466df   '@466ad
    A_1450!(0, 4) = V_10b2!   '@466bc
L_466df:
    L_BP3a! = FX##(V_10ae!) * V_0de8! * V_0de4!   '@466df
    L_BP3e! = FX##(V_10b2!) * V_0de8! * V_0de4!   '@466f9
    GOSUB L_4a348   '@46713
    A_1450!(0, 7) = L_BP1a!   '@46720
    A_1450!(0, 8) = L_BP1e!   '@46742
    IF NOT (L_BP1e! > V_0e7a! OR L_BP1a! > V_0e7a!) THEN GOTO L_46890   '@46764
    BEEP   '@467a0
    RT_VIEWPRINT 17, 25   '@467aa
    COLOR RT_CINT%(FX##(V_0dc0!))   '@467bc
    RT_CLS 2   '@467d9
    PRINT RT_TAB$(8); ""; "ESTE APLICATIVO NAO ACEITA COLUNAS PARA DIMENSIONAMENTO"   '@467e7 DS:381e,4216
    PRINT RT_TAB$(20); ""; "COM ESBELTEZ MAIOR QUE"; V_0e7a!   '@46807 DS:381e,4252
    CALL MIXT_07f1_LimpaTeclado   '@46834
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_1082$ <> "S") THEN GOTO L_46871   '@4683e DS:3b3e
    V_106e$ = RT_INPUT$(1)   '@46855
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_46871:
    V_106e$ = "LAMBDA"   '@46871 DS:426c
    GOTO L_4aaf0   '@46883
L_46890:
    IF NOT (L_BP1e! <= V_0e72! AND (L_BP1a! <= V_0e72! AND V_11c6% = 1)) THEN GOTO L_468e3   '@46890
    GOTO L_4aaf0   '@468db
L_468e3:
    RT_VIEWPRINT 17, 25   '@468e3
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@468f5
    RT_CLS 2   '@46921
    LOCATE 18, 1   '@4692f
    COLOR RT_CINT%(FX##(V_0dc0!))   '@4694a
    PRINT " Nk =";   '@46967 DS:4276
    COLOR 14   '@46975
    L_BPf0! = 1.0   '@4698b DS:3842
    L_BPf4! = LEN(STR$(RT_SNG!(INT(FX##(L_BPec!) / V_0de8!))))   '@4699d
    CALL MIXT_082a_Maior(L_BPf0!, L_BPf4!, L_BPf8!)   '@469ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_STRINGS$((RT_CINT%(FX##(L_BPf8!))), ("#")) + ".## "   '@469e3 DS:4280,4286
    PRINT USING V_106e$; RT_PU#(RT_SNG!(FX##(L_BPec!) / V_0de8!), V_106e$, 1);   '@46a0a
    COLOR 7   '@46a36
    PRINT V_0ddc$   '@46a4c
    IF NOT (V_11c6% = 0) THEN GOTO L_46a89   '@46a5a
    A_1450!(0, 2) = L_BPec!   '@46a69
L_46a89:
    IF NOT (L_BP1e! > 0.0 AND L_BP1a! > 0.0) THEN GOTO L_46b3b   '@46a89 DS:3862
    LOCATE 17, 36   '@46ac5
    PRINT "lbx ="; L_BP1a!   '@46ae3 DS:428e
    LOCATE 17, 50   '@46afc
    PRINT "lby ="; L_BP1e!   '@46b1a DS:4298
    GOTO L_46b6c   '@46b33
L_46b3b:
    LOCATE 17, 38   '@46b3b
    PRINT "Verificacao de Extremidades"   '@46b59 DS:42a2
L_46b6c:
    IF NOT (L_BP1e! > 140.0 OR L_BP1a! > 140.0) THEN GOTO L_46c2b   '@46b6c DS:42c2
    LOCATE 17, 57   '@46ba8
    COLOR 14   '@46bc6
    PRINT "Csf recomendado =";   '@46bdc DS:42c6
    CALL MIXT_082a_Maior(L_BP1a!, L_BP1e!, L_BPfc!)   '@46bf7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    PRINT RT_SNG!(INT(FX##(L_BPfc!) - 140.0) / 100.0 + 1.39999997615814208984375##)   '@46bfd DS:3a08,42dc,42e0
L_46c2b:
    LOCATE 19   '@46c2b
    COLOR 7   '@46c41
    PRINT "   Mkx atuante ........"   '@46c57 DS:42e4
    PRINT "   Mky atuante ........"   '@46c65 DS:4300
    COLOR RT_CINT%(FX##(V_0dc0!))   '@46c73
    PRINT " Mk total atuante ....."   '@46c90 DS:431c
    COLOR 7   '@46c9e
    PRINT "   Mkx resistente ....."   '@46cb4 DS:4338
    PRINT "   Mky resistente ....."   '@46cc2 DS:4354
    PRINT "   Incl ln ............"   '@46cd0 DS:4370
    COLOR RT_CINT%(FX##(V_0dc0!))   '@46cde
    PRINT " Mk total resistente ..";   '@46cfb DS:438c
    ERASE L_BPd0!   '@46d09
    REDIM L_BPd0!(1 TO 4, 0 TO 2)   '@46d18
    L_BP100$ = V_0e82$   '@46d3e
    IF NOT (L_BP100$ = "I") THEN GOTO L_47183   '@46d51 DS:390a
    IF NOT (L_BP3e! = 0.0 AND L_BP3a! = 0.0) THEN GOTO L_46ea9   '@46d69 DS:3862
    L_BPb6! = 4.0   '@46da5 DS:3b44
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_46e1c   '@46db6 DS:3842,38ea,3b3e
    L_BPb6! = 2.0   '@46e0b DS:38ea
L_46e1c:
    L_BPd0!(1, 1) = 1.0   '@46e1c DS:3842
    L_BPd0!(2, 2) = 1.0   '@46e3e DS:3842
    L_BPd0!(3, 1) = -1.0   '@46e5d DS:3872
    L_BPd0!(4, 2) = -1.0   '@46e82 DS:3872
L_46ea9:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! = 0.0) THEN GOTO L_46fcd   '@46ea9 DS:3862
    L_BPb6! = 3.0   '@46ee5 DS:38ee
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_46f5c   '@46ef6 DS:3842,38ea,3b3e
    L_BPb6! = 2.0   '@46f4b DS:38ea
L_46f5c:
    L_BPd0!(1, 2) = 1.0   '@46f5c DS:3842
    L_BPd0!(2, 1) = 1.0   '@46f7e DS:3842
    L_BPd0!(3, 1) = -1.0   '@46fa3 DS:3872
L_46fcd:
    IF NOT (L_BP3e! = 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_470e8   '@46fcd DS:3862
    L_BPb6! = 3.0   '@47009 DS:38ee
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_47080   '@4701a DS:3842,38ea,3b3e
    L_BPb6! = 2.0   '@4706f DS:38ea
L_47080:
    L_BPd0!(1, 1) = 1.0   '@47080 DS:3842
    L_BPd0!(2, 2) = 1.0   '@470a2 DS:3842
    L_BPd0!(3, 2) = -1.0   '@470c1 DS:3872
L_470e8:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_4717b   '@470e8 DS:3862
    L_BPb6! = 2.0   '@47124 DS:38ea
    L_BPd0!(1, 1) = 1.0   '@47135 DS:3842
    L_BPd0!(2, 2) = 1.0   '@47157 DS:3842
L_4717b:
    GOTO L_47682   '@4717b
L_47183:
    IF NOT (L_BP100$ = "S") THEN GOTO L_47682   '@47183 DS:3b3e
    IF NOT (L_BP3e! = 0.0 AND L_BP3a! = 0.0) THEN GOTO L_47364   '@47196 DS:3862
    L_BPb6! = 4.0   '@471d2 DS:3b44
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_47249   '@471e3 DS:3842,38ea,3b3e
    L_BPb6! = 1.0   '@47238 DS:3842
L_47249:
    L_BPd0!(1, 1) = 1.0   '@47249 DS:3842
    L_BPd0!(1, 2) = 1.0   '@4726b DS:3842
    L_BPd0!(2, 1) = 1.0   '@4728d DS:3842
    L_BPd0!(2, 2) = -1.0   '@472b2 DS:3872
    L_BPd0!(3, 1) = -1.0   '@472d1 DS:3872
    L_BPd0!(3, 2) = 1.0   '@472f6 DS:3842
    L_BPd0!(4, 1) = -1.0   '@47318 DS:3872
    L_BPd0!(4, 2) = -1.0   '@4733d DS:3872
L_47364:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! = 0.0) THEN GOTO L_474a4   '@47364 DS:3862
    L_BPb6! = 2.0   '@473a0 DS:38ea
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_47417   '@473b1 DS:3842,38ea,3b3e
    L_BPb6! = 1.0   '@47406 DS:3842
L_47417:
    L_BPd0!(1, 1) = 1.0   '@47417 DS:3842
    L_BPd0!(1, 2) = 1.0   '@47439 DS:3842
    L_BPd0!(2, 1) = -1.0   '@4745b DS:3872
    L_BPd0!(2, 2) = 1.0   '@47480 DS:3842
L_474a4:
    IF NOT (L_BP3e! = 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_475e4   '@474a4 DS:3862
    L_BPb6! = 2.0   '@474e0 DS:38ea
    IF NOT ((V_102e! = 2.0 OR V_102e! = 1.0) AND V_0e86$ = "S") THEN GOTO L_47557   '@474f1 DS:3842,38ea,3b3e
    L_BPb6! = 1.0   '@47546 DS:3842
L_47557:
    L_BPd0!(1, 1) = 1.0   '@47557 DS:3842
    L_BPd0!(1, 2) = 1.0   '@47579 DS:3842
    L_BPd0!(2, 1) = 1.0   '@4759b DS:3842
    L_BPd0!(2, 2) = -1.0   '@475c0 DS:3872
L_475e4:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_4767a   '@475e4 DS:3862
    L_BPb6! = 1.0   '@47620 DS:3842
    L_BPd0!(1, 1) = 1.0   '@47631 DS:3842
    L_BPd0!(1, 2) = 1.0   '@47653 DS:3842
L_4767a:
    GOTO L_47682   '@4767a
L_47682:
    V_106e$ = ""   '@47682 DS:381e
    IF NOT (V_11c6% = 0) THEN GOTO L_476c6   '@47694
    A_1450!(0, 10) = L_BPb6!   '@476a3
L_476c6:
    L_BP104! = L_BPb6!   '@476c6
    FOR L_BPba! = 1.0 TO L_BP104!   '@476d8 DS:3842
    GOSUB L_477c8   '@476e0
    GOSUB L_482e8   '@476ed
    IF NOT (V_106e$ = "NAO") THEN GOTO L_47779   '@476fa DS:38d0
    IF NOT (FX##(V_0ffa!) < 1.10000002384185791015625##) THEN GOTO L_4773d   '@47711 DS:43a8
    V_0ffa! = 1.10000002384185791015625##   '@4772c DS:43a8
L_4773d:
    IF NOT (L_BPba! > 1.0) THEN GOTO L_47769   '@4773d DS:3842
    V_0fd4! = -1.0   '@47758 DS:3872
L_47769:
    GOTO L_477bb   '@47769
L_47779:
    V_0fd4! = -1.0   '@47779 DS:3872
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPba!   '@4778f DS:3842
L_477bb:
    GOTO L_4aaf0   '@477bb
    ' ---- F_477c3 @0x477c3  (0477c3_F_477c3.lift.txt; evidence_id (assembly): ev_b060e10d6050546429e7b725f9b05d7a937b833c0c8ef4a4d0054cb89d603cfb)
L_477c8:   ' sub-rotina (alvo de GOSUB); entrada vinda de 045f89_FUN_4000_5f89
    LOCATE 18, 23   '@477cd
    COLOR 14   '@477eb
    PRINT "      (1)           (2)           (3)           (4)    "   '@47801 DS:43ac
    LOCATE 18, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@4780f DS:38f2,43e8
    COLOR 4, 7   '@4783e
    PRINT " caso "; LTRIM$(STR$(L_BPba!)); "/"; LTRIM$(STR$(L_BPb6!)); " "   '@4785c DS:3854,39aa,43ec
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@478ae
    LOCATE 17, 1   '@478da
    IF NOT (L_BP3e! = 0.0 AND L_BP3a! = 0.0) THEN GOTO L_4793f   '@478f5 DS:3862
    PRINT " Compressao Centrada"   '@47931 DS:43f6
L_4793f:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! = 0.0 OR L_BP3e! = 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_479bd   '@4793f DS:3862
    PRINT " Flexo Compressao"   '@479af DS:440e
L_479bd:
    IF NOT (L_BP3e! <> 0.0 AND L_BP3a! <> 0.0) THEN GOTO L_47a07   '@479bd DS:3862
    PRINT " Flexao Obliqua"   '@479f9 DS:4424
L_47a07:
    V_1036! = 90.0   '@47a07 DS:3b5c
    IF NOT (L_BP3a! >= 0.0) THEN GOTO L_47a43   '@47a18 DS:3862
    V_1036! = 270.0   '@47a32 DS:3b60
L_47a43:
    CALL S_2267a   '@47a43
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP108! = FX##(V_0e52!) / 100.0   '@47a4d DS:3a08
    L_BP10c! = -(FX##(V_103e!) / 3000.0) * (V_0e56$ = "S")   '@47a64 DS:3b3e,3b6c
    CALL MIXT_082a_Maior(L_BP108!, L_BP10c!, L_BP110!)   '@47a92
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP42! = FX##(L_BPd0!(RT_CINT%(FX##(L_BPba!)), 1)) * (RT_CLNG&(FX##(L_BP110!) * 100.0 * L_BPec!) \ 1&) / 100.0#   '@47aa7 DS:3a08,3a18
    IF NOT (L_BP3a! <> 0.0) THEN GOTO L_47b2e   '@47afa DS:3862
    L_BP42! = FX##(SGN(L_BP3a!)) * L_BP42!   '@47b14
L_47b2e:
    L_BP4a! = 0.0   '@47b2e DS:3862
    IF NOT (V_0e42! > 0.0 AND (L_BP42! <> 0.0 AND L_BP1a! > V_0e76!)) THEN GOTO L_47c5d   '@47b3e DS:3862
    L_BP114! = RT_POT##((FX##(V_0e5a!)), (2.0)) / RT_POT##((FX##(L_BP0e!) * 100.0), (2.0)) * L_BP16! * V_0fdc!   '@47b95 DS:38ea,3a08
    L_BP4a! = (FX##(L_BP3a!) + L_BP42!) * RT_POT##((2.7182819843292236328125##), (V_0e42! / (L_BP114! - FX##(V_0e4e!) * V_0e4a! * L_BPec!) * L_BPec! * V_0e4a! * V_0e4e! - 1.0))   '@47bd3 DS:3872,4438
    L_BP4a! = FX##(RT_CLNG&(FX##(L_BP4a!) * 100.0) \ 1&) / 100.0#   '@47c28 DS:3a08,3a18
L_47c5d:
    L_BP52! = FX##(L_BP3a!) + L_BP42! + L_BP4a!   '@47c5d
    LOCATE 19, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@47c74 DS:38f2,43e8
    COLOR 7   '@47ca3
    L_BP118$ = "#####.##"   '@47cb9 DS:443c
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(L_BP52! / (FX##(V_0de8!) * V_0de4!)), L_BP118$, 1)   '@47ccc
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 0) = L_BP52! / (FX##(V_0de4!) * V_0de8!)   '@47cfb
    V_1036! = 0.0   '@47d3d DS:3862
    IF NOT (L_BP3e! < 0.0) THEN GOTO L_47d79   '@47d4e DS:3862
    V_1036! = 180.0   '@47d68 DS:3b58
L_47d79:
    CALL S_2267a   '@47d79
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP11c! = FX##(V_0e52!) / 100.0   '@47d83 DS:3a08
    L_BP120! = -(FX##(V_103e!) / 3000.0) * (V_0e56$ = "S")   '@47d9a DS:3b3e,3b6c
    CALL MIXT_082a_Maior(L_BP11c!, L_BP120!, L_BP124!)   '@47dc8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46! = FX##(L_BPd0!(RT_CINT%(FX##(L_BPba!)), 2)) * (RT_CLNG&(FX##(L_BP124!) * 100.0 * L_BPec!) \ 1&) / 100.0#   '@47ddd DS:3a08,3a18
    IF NOT (L_BP3e! <> 0.0) THEN GOTO L_47e61   '@47e2d DS:3862
    L_BP46! = FX##(SGN(L_BP3e!)) * L_BP46!   '@47e47
L_47e61:
    L_BP4e! = 0.0   '@47e61 DS:3862
    IF NOT (V_0e42! > 0.0 AND (L_BP46! <> 0.0 AND L_BP1e! > V_0e76!)) THEN GOTO L_47f90   '@47e71 DS:3862
    L_BP114! = RT_POT##((FX##(V_0e5a!)), (2.0)) / RT_POT##((FX##(L_BP12!) * 100.0), (2.0)) * L_BP16! * V_0fd8!   '@47ec8 DS:38ea,3a08
    L_BP4e! = (FX##(L_BP3e!) + L_BP46!) * RT_POT##((2.7182819843292236328125##), (V_0e42! / (L_BP114! - FX##(V_0e4e!) * V_0e4a! * L_BPec!) * L_BPec! * V_0e4a! * V_0e4e! - 1.0))   '@47f06 DS:3872,4438
    L_BP4e! = FX##(RT_CLNG&(FX##(L_BP4e!) * 100.0) \ 1&) / 100.0#   '@47f5b DS:3a08,3a18
L_47f90:
    L_BP56! = FX##(L_BP3e!) + L_BP46! + L_BP4e!   '@47f90
    LOCATE 20, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@47fa7 DS:38f2,43e8
    COLOR 7   '@47fd6
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(L_BP56! / (FX##(V_0de8!) * V_0de4!)), L_BP118$, 1)   '@47fec
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 1) = L_BP56! / (FX##(V_0de4!) * V_0de8!)   '@4801b
    L_BP128! = RT_SQR##(RT_POT##((FX##(L_BP52!)), (2.0)) + RT_POT##((FX##(L_BP56!)), (2.0)))   '@4805e DS:38ea
    L_BP128! = FX##(RT_CLNG&(FX##(L_BP128!) * 100.0) \ 1&) / 100.0#   '@48090 DS:3a08,3a18
    COLOR RT_CINT%(FX##(V_0dc0!))   '@480c2
    LOCATE 21, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@480df DS:38f2,43e8
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(L_BP128! / (FX##(V_0de8!) * V_0de4!)), L_BP118$, 1)   '@4810e
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 2) = L_BP128! / (FX##(V_0de4!) * V_0de8!)   '@4813e
    IF NOT (L_BP52! >= 0.0) THEN GOTO L_48252   '@4817f DS:3862
    IF NOT (L_BP56! >= 0.0) THEN GOTO L_48216   '@48199 DS:3862
    IF NOT (L_BP52! = 0.0) THEN GOTO L_481e5   '@481b3 DS:3862
    L_BP7e! = 90.0   '@481cd DS:3b5c
    GOTO L_4820e   '@481dd
L_481e5:
    L_BP7e! = ATN(FX##(L_BP56!) / L_BP52!) * 180.0 / V_0e5a!   '@481e5 DS:3b58
L_4820e:
    GOTO L_4824a   '@4820e
L_48216:
    L_BP7e! = ATN(FX##(L_BP52!) / -L_BP56!) * 180.0 / V_0e5a! + 270.0   '@48216 DS:3b58,3b60
L_4824a:
    GOTO L_482d9   '@4824a
L_48252:
    IF NOT (L_BP56! >= 0.0) THEN GOTO L_482a6   '@48252 DS:3862
    L_BP7e! = 180.0 - ATN(FX##(L_BP56!) / -L_BP52!) * 180.0 / V_0e5a!   '@4826c DS:3b58
    GOTO L_482d4   '@4829e
L_482a6:
    L_BP7e! = ATN(FX##(L_BP56!) / L_BP52!) * 180.0 / V_0e5a! + 180.0   '@482a6 DS:3b58
L_482d4:
L_482d9:
    RETURN   '@482d9
L_482e8:   ' sub-rotina (alvo de GOSUB); entrada vinda de 045f89_FUN_4000_5f89
    L_BP66! = FX##(L_BP7e!) - 90.0   '@482ed DS:3b64
    IF NOT (L_BP66! < 0.0) THEN GOTO L_4832f   '@48301 DS:3862
    L_BP66! = FX##(L_BP66!) + 360.0   '@4831b DS:3b68
L_4832f:
    V_1036! = V_0fd4!   '@4832f
    IF NOT (V_0fd4! = -1.0) THEN GOTO L_4836b   '@48340 DS:3872
    V_1036! = L_BP66!   '@4835b
L_4836b:
    L_BP6e! = -1000.0   '@4836b DS:4448
    L_BP72! = -1000.0   '@4837b DS:4448
    L_BP76! = 1000.0   '@4838b DS:444c
    L_BP7a! = 1000.0   '@4839b DS:444c
    L_BP92! = 10.0   '@483ab DS:38f2
    CALL S_2267a   '@483bc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_483cb:
    L_BPaa! = 2.0   '@483d0 DS:38ea
L_483e6:
    L_BP12c! = L_BPaa!   '@483eb
    IF NOT (L_BP12c! = 2.0) THEN GOTO L_48468   '@483fc DS:38ea
    V_1022! = 0.013500000350177288055419921875## / V_0ffe!   '@48417 DS:4450
    V_105a! = 0.2592592537403106689453125##   '@4842d DS:4454
    L_BP96! = 0.00999999977648258209228515625##   '@4843e DS:4458
    L_BP9a! = V_105a!   '@4844f
    GOTO L_486f9   '@48460
L_48468:
    IF NOT (L_BP12c! = 3.0) THEN GOTO L_4854a   '@48469 DS:38ee
    V_1022! = ((V_0e7e$ = "B") * -0.00200000009499490261077880859375## + V_0dec! / (FX##(V_0e24!) * 2100.0) * V_0e62! + 0.0035000001080334186553955078125##) / V_0ffe!   '@4847e DS:445c,4462,4466,446a
    V_105a! = 1.0 / (((V_0e7e$ = "B") * -0.00200000009499490261077880859375## + V_0dec! / (FX##(V_0e24!) * 2100.0) * V_0e62!) / 0.0035000001080334186553955078125## + 1.0)   '@484cb DS:3842,445c,4462,4466,446a
    L_BP96! = 0.2592592537403106689453125##   '@48520 DS:4454
    L_BP9a! = V_105a!   '@48531
    GOTO L_486f9   '@48542
L_4854a:
    IF NOT (L_BP12c! = 4.0) THEN GOTO L_485f5   '@4854b DS:3b44
    V_1022! = 0.0035000001080334186553955078125## / V_0ffe!   '@48560 DS:446a
    V_105a! = 1.0   '@48576 DS:3842
    L_BP96! = 1.0 / (((V_0e7e$ = "B") * -0.00200000009499490261077880859375## + V_0dec! / (FX##(V_0e24!) * 2100.0) * V_0e62!) / 0.0035000001080334186553955078125## + 1.0)   '@48587 DS:3842,445c,4462,4466,446a
    L_BP9a! = V_105a!   '@485dc
    GOTO L_486f9   '@485ed
L_485f5:
    IF NOT (L_BP12c! = 5.0) THEN GOTO L_48661   '@485f6 DS:3b4c
    V_1022! = 0.0035000001080334186553955078125## / V_103e!   '@4860b DS:446a
    V_105a! = FX##(V_103e!) / V_0ffe!   '@48621
    L_BP96! = 1.0   '@48637 DS:3842
    L_BP9a! = V_105a!   '@48648
    GOTO L_486f9   '@48659
L_48661:
    IF NOT (L_BP12c! = 6.0) THEN GOTO L_486f9   '@48662 DS:40e2
    V_1022! = (0.00200000009499490261077880859375## / (13.0 / (V_103e! * 0.4285714328289031982421875##) * V_0ffe! - 1.0) + 0.00200000009499490261077880859375##) / (FX##(V_0ffe!) * 13.0)   '@48677 DS:3872,3b20,446e,4472
    V_105a! = 13.0   '@486b9 DS:446e
    L_BP96! = FX##(V_103e!) / V_0ffe!   '@486ca
    L_BP9a! = V_105a!   '@486e0
    GOTO L_486f9   '@486f1
L_486f9:
    L_BP5a! = (FX##(L_BP9a!) - L_BP96!) / 5.0   '@486f9 DS:3b4c
    L_BP9e! = 0.0   '@48713 DS:3862
L_48729:
    CALL S_203ed   '@4872e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20146   '@48738
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (L_BP9e! = 1.0 OR FX##(V_1096!) + V_109a! > FX##(L_BPec!)) THEN GOTO L_489ba   '@48742 DS:3842
    IF NOT (ABS(FX##(V_109a!) - L_BPec! + V_1096!) / L_BPec! > 0.004999999888241291046142578125##) THEN GOTO L_489b2   '@48785 DS:4476
    IF NOT (FX##(V_1096!) + V_109a! > FX##(L_BPec!)) THEN GOTO L_4881b   '@487b2
    V_105a! = FX##(V_105a!) - L_BP5a!   '@487d2
    IF NOT (V_105a! < L_BP96!) THEN GOTO L_48813   '@487e7
    V_105a! = L_BP96!   '@48802
L_48813:
    GOTO L_48875   '@48813
L_4881b:
    L_BP5a! = FX##(L_BP5a!) / 2.0   '@4881b DS:38ea
    V_105a! = FX##(L_BP5a!) + V_105a!   '@4882f
    IF NOT (V_105a! > L_BP9a!) THEN GOTO L_48870   '@48844
    V_105a! = L_BP9a!   '@4885f
L_48870:
L_48875:
    L_BP130! = L_BPaa!   '@48875
    IF NOT (L_BP130! = 2.0) THEN GOTO L_488cc   '@48886 DS:38ea
    V_1022! = 0.00999999977648258209228515625## / ((1.0 - FX##(V_105a!)) * V_0ffe!)   '@488a1 DS:3842,4458
    GOTO L_48994   '@488c4
L_488cc:
    IF NOT (L_BP130! <> 3.0) THEN GOTO L_4890e   '@488cd DS:38ee
    IF NOT (L_BP130! <> 4.0) THEN GOTO L_4890e   '@488e3 DS:3b44
    IF NOT (L_BP130! = 5.0) THEN GOTO L_48934   '@488f9 DS:3b4c
L_4890e:
    V_1022! = 0.0035000001080334186553955078125## / (FX##(V_105a!) * V_0ffe!)   '@4890e DS:446a
    GOTO L_48994   '@4892c
L_48934:
    IF NOT (L_BP130! = 6.0) THEN GOTO L_48994   '@48935 DS:40e2
    V_1022! = (0.00200000009499490261077880859375## / (V_0ffe! / (V_103e! * 0.4285714328289031982421875##) * V_105a! - 1.0) + 0.00200000009499490261077880859375##) / (FX##(V_105a!) * V_0ffe!)   '@4894a DS:3872,3b20,4472
    GOTO L_48994   '@4898c
L_48994:
    L_BP9e! = 1.0   '@48994 DS:3842
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48729   '@489a5
L_489b2:
    GOTO L_48a2a   '@489b2
L_489ba:
    IF NOT (L_BPaa! < 6.0) THEN GOTO L_489f8   '@489ba DS:40e2
    L_BPaa! = FX##(L_BPaa!) + 1.0   '@489d5 DS:3842
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_483e6   '@489eb
L_489f8:
    V_106e$ = "NAO"   '@489f8 DS:38d0
    V_0ffa! = 1.10000002384185791015625##   '@48a0a DS:43a8
    RETURN   '@48a1b
L_48a2a:
    L_BP9e! = 0.0035000001080334186553955078125## / (FX##(V_0ffe!) * 13.0)   '@48a2a DS:446a,446e
    L_BPa2! = V_1022!   '@48a48
    L_BPa6! = (FX##(L_BPa2!) - L_BP9e!) / 8.0   '@48a59 DS:447a
    V_1022! = L_BP9e!   '@48a74
L_48a8a:
    L_BP134! = 1.0 / ((FX##(V_0ffe!) * V_1022! - 0.00200000009499490261077880859375##) / 0.00200000009499490261077880859375## + 1.0)   '@48a8f DS:3842,3b20,4462
    L_BP138! = 1.0 / (0.00999999977648258209228515625## / (FX##(V_0ffe!) * V_1022! - 0.00999999977648258209228515625##) + 1.0)   '@48abd DS:3842,4458,447e
    CALL MIXT_082a_Maior(L_BP134!, L_BP138!, L_BP13c!)   '@48ae7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP96! = L_BP13c!   '@48afc
    L_BP140! = 0.00999999977648258209228515625##   '@48b07 DS:4458
    CALL MIXT_082a_Maior(L_BP140!, L_BP96!, L_BP144!)   '@48b18
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP96! = L_BP144!   '@48b2d
    L_BP9a! = 1.0 / ((FX##(V_0ffe!) * V_1022! - 0.0035000001080334186553955078125##) / 0.0035000001080334186553955078125## + 1.0)   '@48b38 DS:3842,446a,4482
    V_105a! = L_BP96!   '@48b65
    L_BP86! = 1.0   '@48b76 DS:3842
    L_BP5a! = (FX##(L_BP9a!) - L_BP96!) / 5.0   '@48b87 DS:3b4c
    IF NOT (FX##(L_BP5a!) < 0.00999999977648258209228515625##) THEN GOTO L_48c57   '@48ba1 DS:4458
    IF NOT (V_1022! = L_BPa2!) THEN GOTO L_48c08   '@48bbb
    V_106e$ = "NAO"   '@48bd6 DS:38d0
    V_0ffa! = 1.2000000476837158203125##   '@48be8 DS:4486
    RETURN   '@48bf9
L_48c08:
    V_1022! = FX##(L_BPa6!) + V_1022!   '@48c08
    IF NOT (V_1022! > L_BPa2!) THEN GOTO L_48c4a   '@48c1e
    V_1022! = L_BPa2!   '@48c39
L_48c4a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48a8a   '@48c4a
L_48c57:
    V_101e! = 0.0   '@48c57 DS:3862
    COLOR 14   '@48c68
    LOCATE 22, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@48c7e DS:38f2,43e8
    PRINT " Aguarde "   '@48cad DS:448a
L_48cc0:
    CALL S_203ed   '@48cc5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20146   '@48ccf
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_109a!) - L_BPec! + V_1096!) / L_BPec! > 0.004999999888241291046142578125##) THEN GOTO L_48f1d   '@48cd9 DS:4476
    IF NOT (FX##(V_1096!) + V_109a! > FX##(L_BPec!)) THEN GOTO L_48dfc   '@48d06
    IF NOT (V_105a! = L_BP96!) THEN GOTO L_48db3   '@48d26
    IF NOT (V_1022! = L_BPa2!) THEN GOTO L_48d64   '@48d41
    GOTO L_48f22   '@48d5c
L_48d64:
    V_1022! = FX##(L_BPa6!) + V_1022!   '@48d64
    IF NOT (V_1022! > L_BPa2!) THEN GOTO L_48da6   '@48d7a
    V_1022! = L_BPa2!   '@48d95
L_48da6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48a8a   '@48da6
L_48db3:
    V_105a! = FX##(V_105a!) - L_BP5a!   '@48db3
    IF NOT (V_105a! < L_BP96!) THEN GOTO L_48df4   '@48dc8
    V_105a! = L_BP96!   '@48de3
L_48df4:
    GOTO L_48f10   '@48df4
L_48dfc:
    IF NOT (V_105a! = L_BP9a!) THEN GOTO L_48e49   '@48dfc
    V_106e$ = "NAO"   '@48e17 DS:38d0
    V_0ffa! = 1.2000000476837158203125##   '@48e29 DS:4486
    RETURN   '@48e3a
L_48e49:
    IF NOT (L_BP86! = 1.0 AND V_105a! = L_BP96!) THEN GOTO L_48eb1   '@48e49 DS:3842
    V_105a! = L_BP9a!   '@48e87
    L_BP86! = 0.0   '@48e98 DS:3862
    GOTO L_48f0b   '@48ea9
L_48eb1:
    L_BP5a! = FX##(L_BP5a!) / 2.0   '@48eb1 DS:38ea
    V_105a! = FX##(L_BP5a!) + V_105a!   '@48ec5
    IF NOT (V_105a! > L_BP9a!) THEN GOTO L_48f06   '@48eda
    V_105a! = L_BP9a!   '@48ef5
L_48f06:
L_48f0b:
L_48f10:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48cc0   '@48f10
L_48f1d:
L_48f22:
    L_BP22! = (FX##(V_10a2!) + V_10aa!) * RT_COS##(FX##(V_1036!) * V_0e5a! / 180.0) - (FX##(V_109e!) + V_10a6!) * RT_SIN##(FX##(V_1036!) * V_0e5a! / 180.0)   '@48f27 DS:3b58
    L_BP26! = (FX##(V_109e!) + V_10a6!) * RT_COS##(FX##(V_1036!) * V_0e5a! / 180.0) + (FX##(V_10a2!) + V_10aa!) * RT_SIN##(FX##(V_1036!) * V_0e5a! / 180.0)   '@48f7b DS:3b58
    L_BP2a! = 0.0   '@48fcf DS:3862
    L_BP2e! = 0.0   '@48fdf DS:3862
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 9) = RT_POT##((FX##(10.0)), (3.0)) * V_1022!   '@48fef DS:38ee,38f2
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 10) = RT_POT##((FX##(10.0)), (3.0)) * V_0fc8!   '@49037 DS:38ee,38f2
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 11) = RT_POT##((FX##(10.0)), (3.0)) * V_1002!   '@4907f DS:38ee,38f2
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 12) = V_105a!   '@490c7
    IF NOT (L_BP1e! >= V_0e72! OR L_BP1a! >= V_0e72!) THEN GOTO L_49230   '@490fe
    L_BP5e! = (FX##(V_1036!) - 270.0) * V_0e5a! / 180.0   '@4913a DS:3b58,4498
    IF NOT (L_BP1a! >= V_0e72!) THEN GOTO L_491c2   '@49159
    L_BP2a! = ABS(RT_POT##((FX##(L_BP0e!) * 100.0), (2.0)) * RT_COS##(FX##(L_BP5e!)) / RT_POT##((FX##(V_0e5a!)), (2.0)) * L_BPec! * V_1022!)   '@49173 DS:38ea,3a08
L_491c2:
    IF NOT (L_BP1e! >= V_0e72!) THEN GOTO L_4922b   '@491c2
    L_BP2e! = ABS(RT_POT##((FX##(L_BP12!) * 100.0), (2.0)) * RT_SIN##(FX##(L_BP5e!)) / RT_POT##((FX##(V_0e5a!)), (2.0)) * L_BPec! * V_1022!)   '@491dc DS:38ea,3a08
L_4922b:
L_49230:
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 3) = L_BP22! / (FX##(V_0de4!) * V_0de8! * 100.0)   '@49230 DS:3a08
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 4) = L_BP2a! / (FX##(V_0de4!) * V_0de8! * 100.0)   '@49278 DS:3a08
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 5) = L_BP26! / (FX##(V_0de4!) * V_0de8! * 100.0)   '@492c0 DS:3a08
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 6) = L_BP2e! / (FX##(V_0de4!) * V_0de8! * 100.0)   '@49308 DS:3a08
    L_BP32! = FX##(L_BP22!) - L_BP2a!   '@49350
    IF NOT (L_BP22! < 0.0) THEN GOTO L_49390   '@49363 DS:3862
    L_BP32! = FX##(L_BP22!) + L_BP2a!   '@4937d
L_49390:
    L_BP36! = FX##(L_BP26!) - L_BP2e!   '@49390
    IF NOT (L_BP26! < 0.0) THEN GOTO L_493d0   '@493a3 DS:3862
    L_BP36! = FX##(L_BP26!) + L_BP2e!   '@493bd
L_493d0:
    IF NOT (L_BP36! > 0.0 AND L_BP32! >= 0.0) THEN GOTO L_49433   '@493d0 DS:3862
    L_BP62! = 2.0 * FX##(V_0e5a!) - ATN(FX##(L_BP32!) / L_BP36!)   '@4940c DS:38ea
L_49433:
    IF NOT (L_BP36! > 0.0 AND L_BP32! < 0.0) THEN GOTO L_4948c   '@49433 DS:3862
    L_BP62! = ATN(ABS(FX##(L_BP32!)) / L_BP36!)   '@4946f
L_4948c:
    IF NOT (L_BP36! <= 0.0 AND L_BP32! <= 0.0) THEN GOTO L_4952b   '@4948c DS:3862
    IF NOT (L_BP32! = 0.0) THEN GOTO L_494fa   '@494c8 DS:3862
    L_BP62! = V_0e5a!   '@494e2
    GOTO L_49526   '@494f2
L_494fa:
    L_BP62! = FX##(V_0e5a!) / 2.0 + ATN(FX##(L_BP36!) / L_BP32!)   '@494fa DS:38ea
L_49526:
L_4952b:
    IF NOT (L_BP36! <= 0.0 AND L_BP32! > 0.0) THEN GOTO L_49596   '@4952b DS:3862
    L_BP62! = 3.0 * FX##(V_0e5a!) / 2.0 - ATN(ABS(FX##(L_BP36!)) / L_BP32!)   '@49567 DS:38ea,38ee
L_49596:
    IF NOT (FX##(L_BP26!) * L_BP36! < FX##(0.0) OR FX##(L_BP22!) * L_BP32! < FX##(0.0)) THEN GOTO L_495f3   '@49596 DS:3862
    L_BP62! = FX##(L_BP66!) * V_0e5a! / 180.0   '@495da DS:3b58
L_495f3:
    L_BP62! = FX##(L_BP62!) * 180.0 / V_0e5a!   '@495f3 DS:3b58
    IF NOT (L_BP66! < 180.0 AND L_BP66! >= 0.0) THEN GOTO L_4967f   '@4960c DS:3862,3b58
    IF NOT (FX##(L_BP66!) + 180.0 < FX##(L_BP62!)) THEN GOTO L_4967a   '@49648 DS:3b58
    L_BP62! = FX##(L_BP62!) - 360.0   '@49666 DS:449c
L_4967a:
L_4967f:
    IF NOT (L_BP66! < 360.0 AND L_BP66! >= 180.0) THEN GOTO L_496f2   '@4967f DS:3b58,3b68
    IF NOT (FX##(L_BP62!) + 180.0 < FX##(L_BP66!)) THEN GOTO L_496ed   '@496bb DS:3b58
    L_BP62! = FX##(L_BP62!) + 360.0   '@496d9 DS:3b68
L_496ed:
L_496f2:
    IF NOT (ABS(FX##(L_BP62!) - L_BP66!) > FX##(2.0)) THEN GOTO L_49b27   '@496f2 DS:38ea
    IF NOT (L_BP62! > L_BP66!) THEN GOTO L_4976c   '@49713
    IF NOT (L_BP7a! > L_BP62!) THEN GOTO L_49764   '@4972c
    L_BP7a! = L_BP62!   '@49745
    L_BP76! = V_1036!   '@49754
L_49764:
    GOTO L_497a9   '@49764
L_4976c:
    IF NOT (L_BP72! < L_BP62!) THEN GOTO L_497a4   '@4976c
    L_BP72! = L_BP62!   '@49785
    L_BP6e! = V_1036!   '@49794
L_497a4:
L_497a9:
    L_BPe4! = 0.0   '@497a9 DS:3862
    IF NOT (FX##(L_BP76!) + 180.0 < FX##(L_BP6e!) AND (L_BP76! < 180.0 AND L_BP76! >= 0.0)) THEN GOTO L_49825   '@497ba DS:3862,3b58
    L_BPe4! = 360.0   '@49814 DS:3b68
L_49825:
    L_BPe8! = 0.0   '@49825 DS:3862
    IF NOT (FX##(L_BP7a!) + 180.0 < FX##(L_BP72!) AND (L_BP7a! < 180.0 AND L_BP7a! >= 0.0)) THEN GOTO L_498a1   '@49836 DS:3862,3b58
    L_BPe8! = 360.0   '@49890 DS:3b68
L_498a1:
    IF NOT (V_102e! <> 2.0 AND (ABS(L_BP7a! - (FX##(L_BP72!) - L_BPe8!)) > FX##(2.0) AND ABS(L_BP76! - (FX##(L_BP6e!) - L_BPe4!)) > FX##(1.0))) THEN GOTO L_49b22   '@498a1 DS:3842,38ea
    COLOR 11   '@49916
    LOCATE 22, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@4992c DS:38f2,43e8
    PRINT " Aguarde "   '@4995b DS:448a
    IF NOT (L_BP62! > L_BP66!) THEN GOTO L_49a2f   '@49969
    IF NOT (L_BP6e! <> -1000.0) THEN GOTO L_499b2   '@49982 DS:4448
    L_BP92! = FX##(L_BP92!) * 0.5   '@4999c DS:44a0
L_499b2:
    L_BP148! = ABS(FX##(L_BP76!) - L_BP6e!) * 0.89999997615814208984375##   '@499b2 DS:44a4
    CALL MIXT_0877_Menor(L_BP92!, L_BP148!, L_BP14c!)   '@499ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP92! = L_BP14c!   '@499e3
    L_BP150! = FX##(L_BP62!) - L_BP66!   '@499ee
    CALL MIXT_0877_Menor(L_BP92!, L_BP150!, L_BP154!)   '@49a02
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1036! = FX##(V_1036!) - L_BP154!   '@49a17
    GOTO L_49aa9   '@49a27
L_49a2f:
    L_BP158! = ABS(FX##(L_BP76!) - L_BP6e!) * 0.89999997615814208984375##   '@49a2f DS:44a4
    CALL MIXT_0877_Menor(L_BP92!, L_BP158!, L_BP15c!)   '@49a4b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP92! = L_BP15c!   '@49a60
    L_BP160! = FX##(L_BP66!) - L_BP62!   '@49a6b
    CALL MIXT_0877_Menor(L_BP92!, L_BP160!, L_BP164!)   '@49a7f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1036! = FX##(L_BP164!) + V_1036!   '@49a94
L_49aa9:
    IF NOT (V_1036! < 0.0) THEN GOTO L_49ada   '@49aa9 DS:3862
    V_1036! = 360.0 + FX##(V_1036!)   '@49ac4 DS:3b68
L_49ada:
    IF NOT (V_1036! > 360.0) THEN GOTO L_49b0b   '@49ada DS:3b68
    V_1036! = FX##(V_1036!) - 360.0   '@49af5 DS:449c
L_49b0b:
    CALL S_2267a   '@49b0b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_483cb   '@49b15
L_49b22:
L_49b27:
    IF NOT (V_1036! < 0.0) THEN GOTO L_49b62   '@49b31 DS:3862
    V_1036! = 360.0 + FX##(V_1036!)   '@49b4c DS:3b68
L_49b62:
    IF NOT (V_1036! > 360.0) THEN GOTO L_49b93   '@49b62 DS:3b68
    V_1036! = FX##(V_1036!) - 360.0   '@49b7d DS:449c
L_49b93:
    V_0fd4! = V_1036!   '@49b93
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP22!)), (2.0)) + RT_POT##((FX##(L_BP26!)), (2.0))) / 100.0 < FX##(L_BP128!)) THEN GOTO L_49cb2   '@49ba4 DS:38ea,3a08
    IF NOT (V_1022! = L_BPa2!) THEN GOTO L_49c63   '@49be5
    V_106e$ = "NAO"   '@49c00 DS:38d0
    V_0ffa! = RT_SQR##(L_BP128! / RT_SQR##(RT_POT##((FX##(L_BP22!)), (2.0)) + RT_POT##((FX##(L_BP26!)), (2.0))) * 100.0)   '@49c12 DS:38ea,3a08
    RETURN   '@49c54
L_49c63:
    V_1022! = FX##(L_BPa6!) + V_1022!   '@49c63
    IF NOT (V_1022! > L_BPa2!) THEN GOTO L_49ca5   '@49c79
    V_1022! = L_BPa2!   '@49c94
L_49ca5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48a8a   '@49ca5
L_49cb2:
    IF NOT (ABS(FX##(L_BP26!)) - ABS(FX##(L_BP2e!)) < FX##(0.0) OR (ABS(FX##(L_BP22!)) - ABS(FX##(L_BP2a!)) < FX##(0.0) OR RT_SQR##(RT_POT##((FX##(L_BP32!)), (2.0)) + RT_POT##((FX##(L_BP36!)), (2.0))) * 1.0299999713897705078125## / 100.0 < FX##(L_BP128!))) THEN GOTO L_49e9a   '@49cb2 DS:3862,38ea,3a08,44a8
    IF NOT (V_1022! < L_BPa2!) THEN GOTO L_49db8   '@49d4e
    V_1022! = FX##(L_BPa6!) + V_1022!   '@49d69
    IF NOT (V_1022! > L_BPa2!) THEN GOTO L_49dab   '@49d7f
    V_1022! = L_BPa2!   '@49d9a
L_49dab:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48a8a   '@49dab
L_49db8:
    COLOR 11   '@49db8
    LOCATE 22, RT_CINT%(FX##(L_BPba!) * 14.0 + 8.0)   '@49dce DS:43e8,447a
    PRINT " INSTABILIDADE "   '@49dfd DS:44ac
    V_106e$ = "NAO"   '@49e0b DS:38d0
    V_0ffa! = RT_SQR##(L_BP128! / ABS(RT_SQR##(RT_POT##((FX##(L_BP22!)), (2.0)) + RT_POT##((FX##(L_BP26!)), (2.0))) - RT_SQR##(RT_POT##((FX##(L_BP2a!)), (2.0)) + RT_POT##((FX##(L_BP2e!)), (2.0)))) * 100.0)   '@49e1d DS:38ea,3a08
    RETURN   '@49e8b
L_49e9a:
    COLOR 7   '@49e9a
    LOCATE 22, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@49eb0 DS:38f2,43e8
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(L_BP32! / (FX##(V_0de4!) * V_0de8! * 100.0)), L_BP118$, 1)   '@49edf DS:3a08
    LOCATE 23, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@49f13 DS:38f2,43e8
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(L_BP36! / (FX##(V_0de4!) * V_0de8! * 100.0)), L_BP118$, 1)   '@49f42 DS:3a08
    LOCATE 24, RT_CINT%(FX##(L_BPba!) * 14.0 + 12.0)   '@49f76 DS:3b1c,43e8
    PRINT USING "###.##\\"; RT_PU#(RT_SNG!(FX##(RT_CINT%(10.0 * FX##(V_1036!))) / 10.0), "###.##\\", 1); CHR$(248)   '@49fa5 DS:38f2,44c0
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 8) = V_1036!   '@49fea
    COLOR RT_CINT%(FX##(V_0dc0!))   '@4a021
    LOCATE 25, RT_CINT%(FX##(L_BPba!) * 14.0 + 10.0)   '@4a03e DS:38f2,43e8
    PRINT USING L_BP118$; RT_PU#(RT_SNG!(RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) / (FX##(V_0de4!) * V_0de8! * 100.0)), L_BP118$, 1);   '@4a06d DS:38ea,3a08
    A_1450!(RT_CINT%(V_11c6% * 4 + FX##(L_BPba!)), 7) = RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) / (FX##(V_0de4!) * V_0de8! * 100.0)   '@4a0c8 DS:38ea,3a08
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) / 100.0 >= FX##(L_BP128!)) THEN GOTO L_4a2e0   '@4a132 DS:38ea,3a08
    L_BPd0!(RT_CINT%(FX##(L_BPba!)), 0) = 1.0   '@4a173 DS:3842
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) / 100.0 >= L_BP128! * 1.0499999523162841796875##) THEN GOTO L_4a2c1   '@4a19e DS:38ea,3a08,44cc
    IF NOT (L_BPba! = 1.0) THEN GOTO L_4a22a   '@4a1e4 DS:3842
    V_106e$ = "DIMINUI"   '@4a1ff DS:44d0
    V_0ffa! = -1.0   '@4a211 DS:3872
    GOTO L_4a258   '@4a222
L_4a22a:
    IF NOT (V_106e$ <> "DIMINUI") THEN GOTO L_4a253   '@4a22a DS:44d0
    V_106e$ = ""   '@4a241 DS:381e
L_4a253:
L_4a258:
    L_BP168! = RT_SQR##(L_BP128! / RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) * 100.0)   '@4a258 DS:38ea,3a08
    CALL MIXT_082a_Maior(V_0ffa!, L_BP168!, L_BP16c!)   '@4a29a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ffa! = L_BP16c!   '@4a2ae
    GOTO L_4a2d8   '@4a2b9
L_4a2c1:
    V_106e$ = ""   '@4a2c1 DS:381e
L_4a2d8:
    GOTO L_4a339   '@4a2d8
L_4a2e0:
    V_106e$ = "NAO"   '@4a2e0 DS:38d0
    V_0ffa! = RT_SQR##(L_BP128! / RT_SQR##(RT_POT##((FX##(L_BP36!)), (2.0)) + RT_POT##((FX##(L_BP32!)), (2.0))) * 100.0)   '@4a2f2 DS:38ea,3a08
L_4a339:
    RETURN   '@4a339
L_4a348:   ' sub-rotina (alvo de GOSUB); entrada vinda de 045f89_FUN_4000_5f89
    V_11ae% = 3   '@4a34d
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_4a985   '@4a358 DS:3842,38ee
    V_1036! = 0.0   '@4a396 DS:3862
    CALL S_2267a   '@4a3a7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0fd8! = 0.0   '@4a3b1 DS:3862
    L_BP170! = A_111a!(0, 0)   '@4a3c2
    FOR V_100e! = 1.0 TO L_BP170!   '@4a3e3 DS:3842
    V_0fd8! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 1))), (3.0)) / 3.0 + RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (3.0)) / 12.0) + V_0fd8!   '@4a3ea DS:3842,38ee,3b1c
    V_0fd8! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) * (RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0 + A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)) - RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0), (2.0))) / 2.0 + V_0fd8!   '@4a4c6 DS:3842,38ea,38ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@4a630 DS:3842
    V_0fd8! = ABS(FX##(V_0fd8!)) - RT_POT##((FX##(V_1042!)), (2.0)) * V_104a!   '@4a65c DS:38ea
    V_1036! = 90.0   '@4a689 DS:3b5c
    CALL S_2267a   '@4a69a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0fdc! = 0.0   '@4a6a4 DS:3862
    L_BP174! = A_111a!(0, 0)   '@4a6b5
    FOR V_100e! = 1.0 TO L_BP174!   '@4a6d6 DS:3842
    V_0fdc! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 1))), (3.0)) / 3.0 + RT_POT##((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (3.0)) / 12.0) + V_0fdc!   '@4a6de DS:3842,38ee,3b1c
    V_0fdc! = (FX##(A_111a!(RT_CINT%(FX##(V_100e!)), 0)) - A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 0)) * (FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) * (RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0 + A_111a!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)) - RT_POT##(((FX##(A_111a!(RT_CINT%(FX##(V_100e!) + 1.0), 1)) - A_111a!(RT_CINT%(FX##(V_100e!)), 1)) / 3.0), (2.0))) / 2.0 + V_0fdc!   '@4a7ba DS:3842,38ea,38ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@4a924 DS:3842
    V_0fdc! = ABS(FX##(V_0fdc!)) - RT_POT##((FX##(V_1042!)), (2.0)) * V_104a!   '@4a950 DS:38ea
    GOTO L_4aa13   '@4a97d
L_4a985:
    V_1036! = 0.0   '@4a985 DS:3862
    CALL S_2267a   '@4a996
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0fd8! = (RT_POT##((FX##(A_10be!(1, 0))), (4.0)) - RT_POT##((FX##(A_10be!(1, 1))), (4.0))) * V_0e5a! / 64.0   '@4a9a0 DS:3b44,44dc
    V_0fdc! = V_0fd8!   '@4a9fd
L_4aa13:
    V_11ae% = 4   '@4aa13
    L_BP1a! = RT_CINT%(L_BP0e! / RT_SQR##(FX##(V_0fdc!) / V_104a!) * 100.0)   '@4aa1e DS:3a08
    L_BP1e! = RT_CINT%(L_BP12! / RT_SQR##(FX##(V_0fd8!) / V_104a!) * 100.0)   '@4aa4c DS:3a08
    L_BP16! = RT_SQR##(FX##(V_0dec!) * V_0e5e! * 1000.0 + 35.0) * V_0e46! * 21.0   '@4aa7a DS:444c,44e0,44e4
    V_0e6e! = RT_SQR##(RT_POT##((FX##(V_0e5a!)), (2.0)) / (FX##(V_0dec!) * V_0e5e! * 0.85000002384185791015625##) * L_BP16! * V_0e20!)   '@4aaa6 DS:38ea,44e8
    RETURN   '@4aae1
L_4aaf0:   ' entrada vinda de 045f89_FUN_4000_5f89
    ' @4aaf0 libera strings locais (L_BP100)
    ERASE L_BPd0!   '@4aafa
    ' @4ab04 libera strings locais (L_BP118)
    ' END SUB   '@4ab0e
END SUB

SUB S_50187   ' entrada de SUB/FUNCTION (B$ENRA, locais 446 bytes) (0x50187)
    DIM L_BP0e$
    DIM L_BP12$
    DIM L_BP14%
    DIM L_BP16%
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1e!
    DIM L_BP20%
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP2e%
    DIM L_BP30%
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP3e%
    DIM L_BP42!
    DIM L_BP46!
    DIM L_BP48%
    DIM L_BP4a%
    DIM L_BP4e!
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP58%
    DIM L_BP5c!
    DIM L_BP5e%
    DIM L_BP60%
    DIM L_BP64$
    DIM L_BP68!
    DIM L_BP6a%
    DIM L_BP6c%
    DIM L_BP6e%
    DIM L_BP72$
    DIM L_BP76$
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP82!
    DIM L_BP86!
    DIM L_BP8a!
    DIM L_BP8e!
    DIM L_BP92!
    DIM L_BP94%
    DIM L_BP96%
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
    DIM L_BPc4%
    DIM L_BPc6%
    DIM L_BPc8%
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
    ' ---- FUN_5000_0187 @0x50187  (050187_FUN_5000_0187.lift.txt; evidence_id (assembly): ev_b71dba7c51d381d5d64768f02e38d9a0395e4295e3fa66a0cf48585de64c048f)
    L_BP0e$ = V_106e$   '@5018f
    IF NOT (L_BP0e$ = "DIMENSIONAMENTO") THEN GOTO L_501c8   '@501a1 DS:44f0
    GOTO L_50260   '@501b8
L_501c8:
    IF NOT (L_BP0e$ = "CARGAACUMULADA") THEN GOTO L_50220   '@501c8 DS:4504
    V_106e$ = ""   '@501da DS:4516
    CALL S_60164   '@501ec
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_10ae! = V_1632!   '@501f6
    V_10b2! = V_1636!   '@50207
    GOTO L_50249   '@50218
L_50220:
    IF NOT (L_BP0e$ = "MOMENTOS") THEN GOTO L_50244   '@50220 DS:451a
    CALL S_6346f   '@50232
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_50249   '@5023c
L_50244:
L_50249:
L_5024e:
    GOTO L_5b846   '@50253
L_50260:
    IF NOT (V_11ac% = 0) THEN GOTO L_5027b   '@50265
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5024e   '@50274
L_5027b:
    RT_CLS 2   '@5027b
    LOCATE 6, 1   '@50289
    PRINT " Numero da Posicao das Colunas que serao Dimensionadas"   '@502a4 DS:4526
    PRINT RT_TAB$(79); ""; ""   '@502b2 DS:4516
    PRINT RT_TAB$(79); ""; ""   '@502d2 DS:4516
    LOCATE 7, 1   '@502f2
    CALL MIXT_07f1_LimpaTeclado   '@5030d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " I/J/N a M/... /K *RETORNO* ", V_106e$   '@50317 DS:4560
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_5034e   '@50331
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5024e   '@50346
L_5034e:
    L_BP12$ = UCASE$(V_106e$)   '@5034e
    V_1016! = 1.0   '@50366 DS:4580
L_5037c:
    L_BP14% = (VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) < 1.0#)   '@50381 DS:4584
    IF NOT ((VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) > V_11a6% OR L_BP14%) <> 0) THEN GOTO L_50414   '@503db
    BEEP   '@50402
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50260   '@5040c
L_50414:
    IF NOT (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) > 0) THEN GOTO L_505db   '@50414 DS:458c
    L_BP16% = RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A"))   '@50438 DS:458c
    L_BP18% = (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("/")) > L_BP16%)   '@5046d DS:4592
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("/")) = 0 OR L_BP18%) <> 0) THEN GOTO L_505d6   '@50491 DS:4592
    L_BP1a% = (VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1))) = 0.0#)   '@504a8 DS:458c,4598
    IF NOT ((VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1))) > V_11a6% OR L_BP1a%) <> 0) THEN GOTO L_50559   '@50515 DS:458c
    BEEP   '@50547
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50260   '@50551
L_50559:
    IF NOT (VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) >= VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1)))) THEN GOTO L_505d1   '@50559 DS:458c
    BEEP   '@505bf
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50260   '@505c9
L_505d1:
L_505d6:
L_505db:
    L_BP1e! = LEN(L_BP12$)   '@505db
    FOR V_100e! = V_1016! TO L_BP1e!   '@505f5 DS:4580
    IF NOT (RT_MID$((L_BP12$), (RT_CINT%(FX##(V_100e!))), (1)) = "/") THEN GOTO L_50646   '@505fc DS:4592
    V_1016! = FX##(V_100e!) + 1.0   '@50628 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5037c   '@5063e
L_50646:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@50646 DS:4580
    LOCATE 9, 1   '@5066e
    PRINT " Vario a Armadura ao Longo da Coluna em trecho de Secao Constante  S/*N* ";   '@50689 DS:45a0
    CALL MIXT_07f1_LimpaTeclado   '@50697
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@506a1 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_168c$ = "0"   '@506bb DS:45ee
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_507fd   '@506cd DS:45f4
L_506ef:
    LOCATE 10, 1   '@506f4
    PRINT " De quantos em quantos Niveis *2* ";   '@5070f DS:45fa
    CALL MIXT_07f1_LimpaTeclado   '@5071d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@50727 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_50770   '@50741
    V_168c$ = "2"   '@50756 DS:4620
    GOTO L_50782   '@50768
L_50770:
    V_168c$ = V_106e$   '@50770
L_50782:
    L_BP20% = (VAL(V_168c$) < 1.0#)   '@50782 DS:4584
    IF NOT ((FX##(VAL(V_168c$)) <> INT(FX##(VAL(V_168c$))) OR L_BP20%) <> 0) THEN GOTO L_507f8   '@507b0
    BEEP   '@507e6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_506ef   '@507f0
L_507f8:
L_507fd:
    PRINT " Paro para Visualizacao a cada Trecho Dimensionado  S/*N* ";   '@507fd DS:4626
    CALL MIXT_07f1_LimpaTeclado   '@5080b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@50815 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1688$ = UCASE$(V_106e$)   '@5082f
    V_1082$ = "N"   '@50847 DS:4664
    IF NOT (V_1688$ <> "S") THEN GOTO L_508e8   '@50859 DS:45f4
    PRINT " Dimensiona as Colunas continuamente sem possibilidade de alteracoes S/*N* ";   '@50870 DS:466a
    CALL MIXT_07f1_LimpaTeclado   '@5087e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@50888 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1082$ = "N"   '@508a2 DS:4664
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_508e3   '@508b4 DS:45f4
    V_1082$ = "S"   '@508d1 DS:45f4
L_508e3:
L_508e8:
    PRINT " Imprimo Relatorio da armacao das Colunas  S/*N* ";   '@508e8 DS:46ba
    CALL MIXT_07f1_LimpaTeclado   '@508f6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@50900 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_144c! = 0.0   '@5091a DS:46f0
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_50959   '@5092b DS:45f4
    V_144c! = 1.0   '@50948 DS:4580
L_50959:
    CALL MIXT_07f1_LimpaTeclado   '@50959
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Dados Corretos  N/*S* ", V_106e$   '@50963 DS:46f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_509a2   '@5097d DS:4664
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50260   '@5099a
L_509a2:
    IF NOT (V_11c4% = 0) THEN GOTO L_50aca   '@509a2
    REDIM A_141e%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@509b1
    REDIM A_141e%(0 TO CINT(V_0e34!), 0 TO V_0e3c%, 0 TO 7)   '@509bf
    REDIM A_13f0%(-32768 TO -32768, -32768 TO -32768)   '@509ef
    L_BP24! = INT((FX##(RT_FREN&(-1) + -50000&) / 6.0# - 1.0#) / (FX##(V_0e34!) * V_0e3c%))   '@509fd DS:4710,4718
    L_BP28! = 32760.0 / (FX##(V_0e3c%) * V_0e34!)   '@50a40 DS:4720
    CALL MIXT_0877_Menor(L_BP28!, L_BP24!, L_BP2c!)   '@50a60
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24! = L_BP2c!   '@50a72
    REDIM A_13f0%(0 TO CINT(V_0e3c% * V_0e34! * L_BP24!), 0 TO 2)   '@50a7b
    V_0e40% = 0   '@50aaf
    V_11c4% = 1   '@50aba
L_50aca:
    V_0e5e! = V_0e66!   '@50aca
    V_0e62! = V_0e6a!   '@50adb
    L_BP24! = 1.0   '@50aec DS:4580
L_50b01:
    V_0fe4! = VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(L_BP24!)))))   '@50b06
    GOSUB L_50cef   '@50b34
    IF NOT (RT_INSTR%((RT_CINT%(FX##(L_BP24!))), (L_BP12$), ("A")) > 0) THEN GOTO L_50c56   '@50b41 DS:458c
    L_BP2e% = RT_INSTR%((RT_CINT%(FX##(L_BP24!))), (L_BP12$), ("A"))   '@50b64 DS:458c
    L_BP30% = (RT_INSTR%((RT_CINT%(FX##(L_BP24!))), (L_BP12$), ("/")) > L_BP2e%)   '@50b97 DS:4592
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(L_BP24!))), (L_BP12$), ("/")) = 0 OR L_BP30%) <> 0) THEN GOTO L_50c51   '@50bba DS:4592
    L_BP34! = VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(L_BP24!))), (L_BP12$), ("A")) + 1)))   '@50bd1 DS:458c
L_50c12:
    V_0fe4! = FX##(V_0fe4!) + 1.0   '@50c12 DS:4580
    GOSUB L_50cef   '@50c28
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0fe4! < L_BP34! THEN GOTO L_50c12   '@50c35
L_50c51:
L_50c56:
    L_BP38! = LEN(L_BP12$)   '@50c56
    FOR L_BP34! = L_BP24! TO L_BP38!   '@50c70 DS:4580
    IF NOT (RT_MID$((L_BP12$), (RT_CINT%(FX##(L_BP34!))), (1)) = "/") THEN GOTO L_50cbd   '@50c76 DS:4592
    L_BP24! = FX##(L_BP34!) + 1.0   '@50ca1 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50b01   '@50cb5
L_50cbd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP34!   '@50cbd DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5024e   '@50ce2
    ' ---- F_50cea @0x50cea  (050cea_F_50cea.lift.txt; evidence_id (assembly): ev_0b5f0bcb4f8a133a8afb59b14e50fe7f04dcb63b410aeeef0ca86f2eb08f050b)
L_50cef:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050187_FUN_5000_0187
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0) THEN GOTO L_50d29   '@50cf4
    RETURN   '@50d1f
L_50d29:
    V_0fe8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@50d29
    V_0fec! = 0.0   '@50d57 DS:46f0
    V_0ff4! = A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0)   '@50d68
    L_BP3c! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@50d97
    V_107e$ = ""   '@50dc4 DS:4516
L_50ddb:
    RT_VIEWPRINT 6, 25   '@50de0
    RT_CLS 2   '@50df2
    COLOR RT_CINT%(FX##(V_0dc0!))   '@50e00
    PRINT " Posicao"; V_0fe4!; RT_TAB$(20); ""; A_1252$(RT_CINT%(FX##(V_0fe4!)))   '@50e1d DS:4516,4724
L_50e6c:
    V_101e! = 0.0   '@50e71 DS:46f0
L_50e87:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101e!)), 0) <= V_0fe8!) THEN GOTO L_50eec   '@50e8c
    V_101e! = FX##(V_101e!) + 1.0   '@50ecf DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50e87   '@50ee5
L_50eec:
    L_BP3e% = (V_107e$ = "VARIA")   '@50eec DS:4730
    IF NOT ((V_107e$ = "REDEFINE" OR L_BP3e%) <> 0) THEN GOTO L_50f40   '@50f11 DS:473a
    RT_VIEWPRINT 10, 25   '@50f26
    GOTO L_50f68   '@50f38
L_50f40:
    RT_VIEWPRINT RT_CINT%(FX##(V_101e!) * 2.0 + 8.0), 25   '@50f40 DS:4746,474a
L_50f68:
    RT_CLS 2   '@50f68
    COLOR RT_CINT%(FX##(V_0dc0!))   '@50f76
    V_0f88! = 0.0   '@50f93 DS:46f0
    L_BP42! = FX##(V_0fe8!) + 1.0   '@50fa4 DS:4580
    FOR V_1016! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO L_BP42! STEP -1.0   '@50fba DS:474e
    V_0f88! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0)) + V_0f88!   '@50fe0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@5101a DS:474e
    COLOR 14   '@51042
    PRINT RT_TAB$(3); ""; "Nivel "; A_11f6$(RT_CINT%(FX##(V_0fe8!)));   '@51058 DS:4516,4752
    PRINT TAB(20); "";: PRINT USING "######.## "; RT_PU#(V_0f88!, "######.## ", 1);   '@51095 DS:4516,475c
    PRINT V_0ddc$;   '@510c7
    IF NOT (V_101e! > 0.0) THEN GOTO L_5113e   '@510d5 DS:46f0
    COLOR 7   '@510f0
    PRINT RT_TAB$(40); ""; STR$(V_101e!); "a.  Variacao de Secao";   '@51106 DS:4516,476a
L_5113e:
    PRINT ""   '@5113e DS:4516
    IF NOT (V_107e$ = "REDEFINE") THEN GOTO L_5116b   '@5114c DS:473a
    GOTO L_5147d   '@51163
L_5116b:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) < V_0fe8! AND V_0fec! = 0.0) THEN GOTO L_511d2   '@5116b DS:46f0
    GOTO L_5147d   '@511ca
L_511d2:
    IF NOT (V_0fec! = 0.0) THEN GOTO L_51478   '@511d2 DS:46f0
    GOSUB L_597a3   '@511ed
    IF NOT (V_106e$ = "NAO") THEN GOTO L_5121b   '@511fa DS:4784
    RETURN   '@51211
L_5121b:
    IF NOT (V_106e$ = "*") THEN GOTO L_5128d   '@5121b DS:478c
    RT_CLS 2   '@51232
    V_15de! = 0.0   '@51240 DS:46f0
    V_15e2! = 18.0   '@51251 DS:4792
    V_15e6! = 8.0   '@51262 DS:474a
    GOSUB L_58b47   '@51273
    GOTO L_5368c   '@51280
L_5128d:
    L_BP46! = V_0e3c%   '@5128d
    FOR V_1016! = 0.0 TO L_BP46!   '@512a1 DS:4580,46f0
    V_15d2! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 7)   '@512a8
    V_15d6! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 1) + 1   '@512e2
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0) > 0) THEN GOTO L_51387   '@51345
    GOSUB L_56466   '@5137a
L_51387:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 7) = 0   '@51387
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@513b7 DS:4580
    V_1016! = 0.0   '@513e2 DS:46f0
L_513f8:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0) = 0   '@513f8
    V_1016! = FX##(V_1016!) + 1.0   '@51427 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e3c% >= V_1016! THEN GOTO L_513f8   '@5143d
    LOCATE 9, 1   '@51458
L_51478:
L_5147d:
    COLOR 3   '@51482
    PRINT RT_TAB$(7); ""; "Aguarde ...";   '@51498 DS:4516,4796
    LOCATE , 1   '@514b8
    V_11c6% = 0   '@514ce
    V_0fd0! = 0.0   '@514d9 DS:46f0
    REDIM A_1450!(-32768 TO -32768, -32768 TO -32768)   '@514ea
    REDIM A_1450!(0 TO 8, 0 TO 12)   '@514f8
L_51521:
    GOSUB L_5675c   '@51526
    L_BP48% = (V_106e$ = "NAO")   '@51533 DS:4784
    IF NOT ((V_107e$ = "REDEFINE" AND L_BP48%) <> 0) THEN GOTO L_515da   '@51558 DS:473a
    RT_VIEWPRINT 8, 25   '@5156d
    RT_CLS 2   '@5157f
    V_15de! = 0.0   '@5158d DS:46f0
    V_15e2! = 18.0   '@5159e DS:4792
    V_15e6! = 8.0   '@515af DS:474a
    GOSUB L_58b47   '@515c0
    GOTO L_548ff   '@515cd
L_515da:
    IF NOT (V_106e$ = "NAO") THEN GOTO L_515f9   '@515da DS:4784
    GOTO L_5368c   '@515f1
L_515f9:
    L_BP4a% = (V_106e$ = "NAOSUPORTA")   '@515f9 DS:47a6
    IF NOT ((V_106e$ = "LAMBDA" OR L_BP4a%) <> 0) THEN GOTO L_5163d   '@5161e DS:47b4
    RETURN   '@51633
L_5163d:
    IF NOT (V_106e$ = "NAOBARRA") THEN GOTO L_518c0   '@5163d DS:47be
    RT_CLS 2   '@51654
    BEEP   '@51662
    PRINT " NUMERO MAXIMO DE BARRAS CONFIGURADO E INSUFICIENTE PARA A ARMADURA NECESSARIA,"   '@5166c DS:47ca
    PRINT " OU O PERIMETRO DA SECAO E INSUFICIENTE PARA A QUANTIDADE DE ARMADURA DENTRO "   '@5167a DS:481e
    PRINT " DOS ESPACAMENTOS MINIMOS ENTRE BARRAS CONFIGURADO."   '@51688 DS:4870
    PRINT " AUMENTE O NUMERO MAXIMO DE BARRAS OU DIMINUA O ESPACAMENTO MINIMO ENTRE ELAS."   '@51696 DS:48a8
    IF NOT (V_1082$ = "N") THEN GOTO L_516e1   '@516a4 DS:4664
    CALL MIXT_07f1_LimpaTeclado   '@516bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_107a$ = RT_INPUT$(1)   '@516c5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_516e1:
    IF NOT (V_107e$ <> "VARIA") THEN GOTO L_51702   '@516e1 DS:4730
    RETURN   '@516f8
L_51702:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0)   '@51702 DS:474e
    L_BP4e! = V_0e3c% - 1   '@5175c
    FOR V_1016! = V_0fec! TO L_BP4e!   '@51771 DS:4580
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!) + 1.0), 0) = 0) THEN GOTO L_517ba   '@51778 DS:4580
    GOTO L_51884   '@517b2
L_517ba:
    FOR L_BP52! = 0.0 TO 7.0   '@517ba DS:4580,46f0,48fa
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), RT_CINT%(FX##(L_BP52!))) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!) + 1.0), RT_CINT%(FX##(L_BP52!)))   '@517c8 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@51830 DS:4580,48fa
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@51859 DS:4580
L_51884:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0) = 0   '@51884
    GOTO L_53622   '@518b3
L_518c0:
    IF NOT (V_11c6% = 0) THEN GOTO L_51936   '@518c0
    V_0fd0! = FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!   '@518cf
    V_11c6% = 1   '@5191e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_51521   '@51929
L_51936:
    IF NOT (V_107e$ = "REDEFINE") THEN GOTO L_519fc   '@51936 DS:473a
    V_15d2! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7)   '@5194d
    V_15d6! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) + 1   '@51987
    GOSUB L_56466   '@519ea
L_519fc:
    L_BP56! = A_10ec!(0, 0)   '@519fc
    FOR L_BP52! = 0.0 TO L_BP56!   '@51a1c DS:4580,46f0
    FOR V_100e! = 0.0 TO 2.0   '@51a24 DS:4580,46f0,4746
    A_13f0%(RT_CINT%(V_0e40% + 1 + FX##(L_BP52!)), RT_CINT%(FX##(V_100e!))) = RT_CINT%(FX##(A_10ec!(RT_CINT%(FX##(L_BP52!)), RT_CINT%(FX##(V_100e!)))) * 10.0)   '@51a32 DS:48fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@51a9a DS:4580,4746
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@51ac6 DS:4580
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = RT_CINT%(FX##(V_0ff4!))   '@51aee
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) = RT_CINT%(FX##(V_108e!))   '@51b29
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2) = RT_CINT%(FX##(V_1086!))   '@51b65
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) = RT_CINT%(FX##(V_1092!))   '@51ba1
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4) = RT_CINT%(FX##(V_108a!))   '@51bda
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5) = A_0f56%(RT_CINT%(FX##(V_1086!)), 0)   '@51c16
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = A_0f56%(RT_CINT%(FX##(V_1086!)), 1)   '@51c65
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7) = V_0e40% + 1   '@51cb5
    L_BP58% = (V_0fec! > 0.0)   '@51ceb DS:46f0
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP58%) <> 0) THEN GOTO L_51d68   '@51d14 DS:473a
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0) = RT_CINT%(FX##(L_BP5c!))   '@51d29 DS:474e
L_51d68:
    V_0e40% = RT_CINT%(V_0e40% + 1 + FX##(A_10ec!(0, 0)))   '@51d68
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6) = 1) THEN GOTO L_51fab   '@51d92
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1) < A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)) THEN GOTO L_51edd   '@51dc1
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1) < FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0) THEN GOTO L_51ed5   '@51e11 DS:48fe
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1) * 10   '@51e7c
L_51ed5:
    GOTO L_51fa6   '@51ed5
L_51edd:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2) < FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0) THEN GOTO L_51fa1   '@51edd DS:48fe
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2) * 10   '@51f48
L_51fa1:
L_51fa6:
L_51fab:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6) = 2) THEN GOTO L_520ef   '@51fab
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1) - A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2) < FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0) THEN GOTO L_520ea   '@51fda DS:48fe
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6) = (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1) - A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)) * 10   '@5206b
L_520ea:
L_520ef:
    A_1450!(0, 5) = FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5)) / 10.0   '@520ef DS:48fe
    A_1450!(0, 6) = FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0   '@52140 DS:48fe
    IF NOT (V_0e3c% > V_0fec!) THEN GOTO L_52222   '@52191
    L_BP5e% = (V_107e$ <> "VARIA")   '@521af DS:4730
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP5e%) <> 0) THEN GOTO L_5221d   '@521d4 DS:473a
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) = 0   '@521e9 DS:4580
L_5221d:
L_52222:
    L_BP60% = (V_107e$ <> "REDEFINE")   '@52222 DS:473a
    IF NOT ((V_107e$ <> "VARIA" AND L_BP60%) <> 0) THEN GOTO L_5229c   '@52247 DS:4730
    RT_VIEWPRINT V_0ff8% * 2 + 8, 25   '@5225c
    LOCATE V_0ff8% * 2 + 9, 40   '@52273
    GOTO L_522d1   '@52294
L_5229c:
    RT_VIEWPRINT 10, 25   '@5229c
    LOCATE 11, 40   '@522ae
L_522d1:
    SOUND 500, 2.0   '@522d1 DS:4746
    COLOR RT_CINT%(FX##(V_0dc0!))   '@522e7
    IF NOT (V_1086! = V_108a!) THEN GOTO L_523f8   '@52304
    PRINT RT_SNG!(FX##(V_108e!) + V_1092!); "#"; A_0ecc!(RT_CINT%(FX##(V_1086!)));   '@5231f DS:4902
    V_101e! = INT((FX##(V_108e!) + V_1092!) * A_0efa!(RT_CINT%(FX##(V_1086!))) * 10000.0 / V_104a!) / 100.0   '@52369 DS:4908,490c
    A_1450!(0, 0) = (FX##(V_108e!) + V_1092!) * A_0efa!(RT_CINT%(FX##(V_1086!)))   '@523b0
    GOTO L_52540   '@523f0
L_523f8:
    PRINT V_108e!; "#"; A_0ecc!(RT_CINT%(FX##(V_1086!))); "+"; V_1092!; "#"; A_0ecc!(RT_CINT%(FX##(V_108a!)));   '@523f8 DS:4902,4910
    V_101e! = INT((FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!) * 10000.0 / V_104a!) / 100.0   '@52478 DS:4908,490c
    A_1450!(0, 0) = FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!   '@524dd
L_52540:
    COLOR 7   '@52540
    PRINT TAB(68); "";: PRINT USING "(##.## %)"; RT_PU#(V_101e!, "(##.## %)", 1)   '@52556 DS:4516,4916
    A_1450!(0, 1) = V_101e!   '@52583
    IF NOT (V_144c! = 1.0) THEN GOTO L_5322f   '@525a6 DS:4580
    RT_LPTABRE: RT_LPS V_0e08$   '@525c1
    RT_LPTABRE: RT_LPS V_0e0c$: RT_LPFIM   '@525d9
    RT_LPTABRE: RT_LPS " OBRA   - ": RT_LPS V_11be$: RT_LPFIM   '@525ec DS:4924
    RT_LPTABRE: RT_LPS " COLUNA - ": RT_LPS A_1252$(RT_CINT%(FX##(V_0fe4!))): RT_LPTAB 30: RT_LPS ""   '@52608 DS:4516,4932
    RT_LPTABRE: PRINT #RT_LPT, USING "Nivel \       \(###.##) ao \       \(###.##)"; A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)); RT_PU#(A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)), "Nivel \       \(###.##) ao \       \(###.##)", 1); A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)); RT_PU#(A_11c8!(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)), "Nivel \       \(###.##) ao \       \(###.##)", 2): RT_LPTQUEBRA 0   '@5264f DS:4940
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@5272c DS:4516
    RT_LPTABRE: PRINT #RT_LPT, USING "    Nivel Dimensionado \       \(###.##) "; A_11f6$(RT_CINT%(FX##(V_0fe8!))); RT_PU#(A_11c8!(RT_CINT%(FX##(V_0fe8!))), "    Nivel Dimensionado \       \(###.##) ", 1);: RT_LPTQUEBRA 0   '@5273f DS:4970
    RT_LPTABRE: PRINT #RT_LPT, USING "        Lbx=###      Lby=###"; RT_PU#(A_1450!(0, 7), "        Lbx=###      Lby=###", 1); RT_PU#(A_1450!(0, 8), "        Lbx=###      Lby=###", 2): RT_LPTQUEBRA 0   '@52797 DS:499e
    IF NOT (FX##(A_1450!(0, 2)) / V_0de8! < FX##(99999.0#)) THEN GOTO L_52831   '@527e8 DS:49be
    L_BP64$ = "    Nk =#####.## \  \"   '@52817 DS:49c6
    GOTO L_52843   '@52829
L_52831:
    L_BP64$ = "    Nk =######## \  \"   '@52831 DS:49e0
L_52843:
    RT_LPTABRE: PRINT #RT_LPT, USING L_BP64$; RT_PU#(RT_SNG!(FX##(A_1450!(0, 2)) / V_0de8!), L_BP64$, 1); V_0ddc$;: RT_LPTQUEBRA 0   '@52843
    IF NOT (A_1450!(0, 4) < -999.0 OR (A_1450!(0, 4) > 9999.0 OR (A_1450!(0, 3) > 9999.0 OR A_1450!(0, 3) < -999.0))) THEN GOTO L_52968   '@5288c DS:49fa,49fe
    L_BP64$ = "     Mkx i =####### \    \ Mky i =####### \    \"   '@5294e DS:4a02
    GOTO L_5297a   '@52960
L_52968:
    L_BP64$ = "     Mkx i =####.## \    \ Mky i =####.## \    \"   '@52968 DS:4a36
L_5297a:
    RT_LPTABRE: PRINT #RT_LPT, USING L_BP64$; RT_PU#(A_1450!(0, 3), L_BP64$, 1); V_0ddc$ + V_0dd8$; RT_PU#(A_1450!(0, 4), L_BP64$, 2); V_0ddc$ + V_0dd8$: RT_LPTQUEBRA 0   '@5297a
    RT_LPTABRE: PRINT #RT_LPT, USING "    Fck ####.### \     \  Fyk ####.### \     \  ACO \\   Cobrimento ##.# cm"; RT_PU#(V_0e5e!, "    Fck ####.### \     \  Fyk ####.### \     \  ACO \\   Cobrimento ##.# cm", 1); V_0de0$; RT_PU#(V_0e62!, "    Fck ####.### \     \  Fyk ####.### \     \  ACO \\   Cobrimento ##.# cm", 2); V_0de0$; V_0e7e$; RT_PU#(V_0e8e!, "    Fck ####.### \     \  Fyk ####.### \     \  ACO \\   Cobrimento ##.# cm", 3): RT_LPTQUEBRA 0   '@529f1 DS:4a6a
    RT_LPTABRE: RT_LPS CHR$(15): RT_LPFIM   '@52a46
    RT_LPTLARGURA 132   '@52a5f
    RT_LPTABRE: RT_LPS "         ------- Atuante -----------   ------------------- Resistente ----------------    --------------- Situacao ---------------": RT_LPFIM   '@52a6d DS:4aba
    RT_LPTABRE: RT_LPS "    caso    Mkx       Mky     Mk tot    Mkx 1a    Mkx 2a    Mky 1a    Mky 2a    Mk tot    Inc ln     1/r    x/d   Def con  Def aco": RT_LPFIM   '@52a80 DS:4b40
    V_106e$ = "    #\\ ######.## ######.## ######.## ######.## ######.## ######.## ######.## ######.##    ###.#  ##.####  ##.##  ##.####  ##.####"   '@52a93 DS:4bc6
    V_1072$ = "     \\ ######.## ######.## ######.## ######.## ######.## ######.## ######.## ######.##    ###.#  ##.####  ##.##  ##.####  ##.####"   '@52aa5 DS:4c4c
    RT_LPTABRE: RT_LPS "    ": RT_LPS RT_STRINGS$((126), (".")): RT_LPFIM   '@52ab7 DS:4cd2,4cda
    L_BP68! = A_1450!(0, 10)   '@52add
    FOR V_1016! = 1.0 TO L_BP68!   '@52b00 DS:4580
    RT_LPTABRE: PRINT #RT_LPT, USING V_106e$; RT_PU#(V_1016!, V_106e$, 1); "e"; RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 0), V_106e$, 2); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 1), V_106e$, 3); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 2), V_106e$, 4); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 3), V_106e$, 5); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 4), V_106e$, 6); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 5), V_106e$, 7); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 6), V_106e$, 8); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 7), V_106e$, 9); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 8), V_106e$, 10); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 9), V_106e$, 11); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 12), V_106e$, 12); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 10), V_106e$, 13); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 11), V_106e$, 14): RT_LPTQUEBRA 0   '@52b08 DS:4ce0
    IF NOT (A_1450!(0, 8) > V_0e72! OR A_1450!(0, 7) > V_0e72!) THEN GOTO L_52fd0   '@52d28
    V_1016! = FX##(V_1016!) + 4.0   '@52d8c DS:4ce6
    RT_LPTABRE: PRINT #RT_LPT, USING V_1072$; "f"; RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 0), V_1072$, 1); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 1), V_1072$, 2); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 2), V_1072$, 3); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 3), V_1072$, 4); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 4), V_1072$, 5); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 5), V_1072$, 6); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 6), V_1072$, 7); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 7), V_1072$, 8); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 8), V_1072$, 9); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 9), V_1072$, 10); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 12), V_1072$, 11); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 10), V_1072$, 12); RT_PU#(A_1450!(RT_CINT%(FX##(V_1016!)), 11), V_1072$, 13): RT_LPTQUEBRA 0   '@52da2 DS:4cea
    V_1016! = FX##(V_1016!) - 4.0   '@52fb5 DS:4cf0
L_52fd0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@52fd0 DS:4580
    RT_LPTLARGURA 80   '@52ffb
    RT_LPTABRE: RT_LPS CHR$(18): RT_LPFIM   '@53009
    RT_LPTABRE: RT_LPS "    ": RT_LPS V_15ea$: RT_LPFIM   '@53022 DS:4cd2
    RT_LPTABRE: PRINT #RT_LPT, USING "    As ####.## cm2   Taxa ###.##%  "; RT_PU#(A_1450!(0, 0), "    As ####.## cm2   Taxa ###.##%  ", 1); RT_PU#(A_1450!(0, 1), "    As ####.## cm2   Taxa ###.##%  ", 2);: RT_LPTQUEBRA 0   '@5303e DS:4cf4
    IF NOT (V_1086! = V_108a!) THEN GOTO L_53108   '@53091
    RT_LPTABRE: RT_LPS STR$(RT_SNG!(FX##(V_108e!) + V_1092!)) + " ": RT_LPS "#": RT_LPS STR$(A_0ecc!(RT_CINT%(FX##(V_1086!)))) + " "   '@530ac DS:4902
    GOTO L_53197   '@53100
L_53108:
    RT_LPTABRE: RT_LPS STR$(V_108e!) + " ": RT_LPS "#": RT_LPS STR$(A_0ecc!(RT_CINT%(FX##(V_1086!)))) + " ": RT_LPS "+": RT_LPS STR$(V_1092!) + " ": RT_LPS "#": RT_LPS STR$(A_0ecc!(RT_CINT%(FX##(V_108a!)))) + " "   '@53108 DS:4902,4910
L_53197:
    RT_LPTABRE: RT_LPS "      #": RT_LPS STR$(A_1450!(0, 5)) + " ": RT_LPS "c/": RT_LPS STR$(A_1450!(0, 6)) + " ": RT_LPFIM   '@53197 DS:4d1c,4d28
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@531f1 DS:4516
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@53204 DS:4516
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@53217 DS:4516
L_5322f:
    IF NOT (V_1688$ = "S") THEN GOTO L_532b3   '@5322f DS:45f4
    COLOR 27   '@53246
    LOCATE 16, 25   '@5325c
    PRINT "Continua .."   '@5327a DS:4d2e
    CALL MIXT_07f1_LimpaTeclado   '@53288
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@53292
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_532b3:
    L_BP6a% = (V_0fe8! < V_0ff4!)   '@532b3
    IF NOT ((V_168c$ <> "0" AND L_BP6a%) <> 0) THEN GOTO L_534c7   '@532dc DS:45ee
    V_0fe8! = V_0fe8! + (FX##(VAL(V_168c$)) - 1.0#)   '@532f1 DS:4718
L_5331d:
    V_0fe8! = FX##(V_0fe8!) + 1.0   '@53322 DS:4580
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) * 10.0 + 1.0   '@53338 DS:4580,48fe
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) / 10.0 + 1.0   '@533b1 DS:4580,48fe
    IF NOT (V_1606! = 2.0 AND V_1602! = 2.0) THEN GOTO L_53443   '@533fd DS:4746
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5331d   '@5343b
L_53443:
    IF NOT (V_0ff8% + V_0e3c% - V_0e3e% > V_0fec! AND V_0fe8! < V_0ff4!) THEN GOTO L_534c2   '@53443
    L_BP5c! = V_0fe8!   '@5348f
    V_0fec! = FX##(V_0fec!) + 1.0   '@5349f DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50e6c   '@534b5
L_534c2:
L_534c7:
    L_BP6c% = (A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0) < A_1224%(RT_CINT%(FX##(V_0fe4!)), 1))   '@534c7
    L_BP6e% = V_107e$ <> "VARIA" AND L_BP6c%   '@53524 DS:4730
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP6e%) <> 0) THEN GOTO L_5361d   '@5353f DS:473a
    V_0fe8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)   '@53554
    L_BP3c! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)   '@53586
    V_0ff4! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8% + 1, 0)   '@535b7
    L_BP5c! = V_0fe8!   '@535ea
    V_0fec! = FX##(V_0fec!) + 1.0   '@535fa DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50e6c   '@53610
L_5361d:
L_53622:
    RT_VIEWPRINT 8, 25   '@53627
    RT_CLS 2   '@53639
    V_15de! = 0.0   '@53647 DS:46f0
    V_15e2! = 18.0   '@53658 DS:4792
    V_15e6! = 8.0   '@53669 DS:474a
    GOSUB L_58b47   '@5367a
L_5368c:
    IF NOT (V_1082$ = "S") THEN GOTO L_536b2   '@53691 DS:45f4
    RETURN   '@536a8
L_536b2:
    V_0fec! = -1.0   '@536b2 DS:474e
L_536c8:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) > 0) THEN GOTO L_53747   '@536cd DS:4580
    V_0fec! = FX##(V_0fec!) + 1.0   '@53707 DS:4580
    IF NOT (V_0e3c% > V_0fec!) THEN GOTO L_53742   '@5371d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_536c8   '@5373b
L_53742:
L_53747:
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@53747
    LOCATE 20, 1   '@53773
    PRINT "   <A>";   '@5378e DS:4d3e
    COLOR 7   '@5379c
    PRINT "ceita a Armadura proposta e passa a Dimensionar a proxima Coluna"   '@537b2 DS:4d48
    COLOR RT_CINT%(FX##(V_0dc0!))   '@537c0
    PRINT "   <R>";   '@537dd DS:4d8c
    COLOR 7   '@537eb
    PRINT "edefine manualmente a Armadura  ou  ";   '@53801 DS:4d96
    COLOR RT_CINT%(FX##(V_0dc0!))   '@5380f
    PRINT "<E>";   '@5382c DS:4dbe
    COLOR 7   '@5383a
    PRINT "limina uma Variacao"   '@53850 DS:4dc6
    COLOR RT_CINT%(FX##(V_0dc0!))   '@5385e
    PRINT "   <C>";   '@5387b DS:4dde
    COLOR 7   '@53889
    PRINT "ancela o Dimensionamento e passa para proxima Coluna"   '@5389f DS:4de8
    COLOR RT_CINT%(FX##(V_0dc0!))   '@538ad
    PRINT "   <I>";   '@538ca DS:4e20
    COLOR 7   '@538d8
    PRINT "nicia novamente o Dimensionamento desta Coluna"   '@538ee DS:4e2a
    COLOR RT_CINT%(FX##(V_0dc0!))   '@538fc
    PRINT "   <D>";   '@53919 DS:4e5c
    COLOR 7   '@53927
    PRINT "esenha as Secoes da Coluna com Armadura disposta"   '@5393d DS:4e66
    COLOR RT_CINT%(FX##(V_0dc0!))   '@5394b
    PRINT "   <V>";   '@53968 DS:4e9a
    COLOR 7   '@53976
    PRINT "aria a Armadura da Coluna entre os niveis (maximo"; V_0e3c% + 1; "arranjos)";   '@5398c DS:4ea4,4eda
    CALL MIXT_07f1_LimpaTeclado   '@539ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_539bc:
    V_106e$ = RT_INKEY$   '@539bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF LEN(V_106e$) <= 0 THEN GOTO L_539bc   '@539d0
    RT_VIEWPRINT 19, 25   '@539e2
    L_BP72$ = V_106e$   '@539f4
    IF NOT (L_BP72$ <> "A") THEN GOTO L_53a2f   '@53a06 DS:458c
    IF NOT (L_BP72$ = "a") THEN GOTO L_53a41   '@53a1d DS:4ee8
L_53a2f:
    RETURN   '@53a2f
    ' @53a39 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_56461   '@53a39
L_53a41:
    IF NOT (L_BP72$ <> "8") THEN GOTO L_53a7a   '@53a41 DS:4eee
    IF NOT (CHR$(0) + CHR$(72) = L_BP72$) THEN GOTO L_53b13   '@53a53
L_53a7a:
    IF NOT (V_15de! > 0.0) THEN GOTO L_53af1   '@53a7a DS:46f0
    RT_VIEWPRINT 6, 25   '@53a95
    V_15e6! = 8.0   '@53aa7 DS:474a
    V_15e2! = 18.0   '@53ab8 DS:4792
    V_15de! = FX##(V_15de!) - 1.0   '@53ac9 DS:474e
    GOSUB L_58b47   '@53adf
L_53af1:
    RT_VIEWPRINT 19, 25   '@53af1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@53b03
L_53b13:
    IF NOT (L_BP72$ <> "2") THEN GOTO L_53b4c   '@53b13 DS:4620
    IF NOT (CHR$(0) + CHR$(80) = L_BP72$) THEN GOTO L_53c75   '@53b25
L_53b4c:
    V_0ff8% = 0   '@53b4c
L_53b5c:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_53bc6   '@53b61
    V_0ff8% = V_0ff8% + 1   '@53bb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53b5c   '@53bbf
L_53bc6:
    IF NOT (V_0ff8% + 1 + (FX##(V_0fec!) + 1.0 - V_15de!) > FX##(11.0)) THEN GOTO L_53c53   '@53bc6 DS:4580,4ef4
    RT_VIEWPRINT 6, 25   '@53bf7
    V_15e6! = 8.0   '@53c09 DS:474a
    V_15e2! = 18.0   '@53c1a DS:4792
    V_15de! = FX##(V_15de!) + 1.0   '@53c2b DS:4580
    GOSUB L_58b47   '@53c41
L_53c53:
    RT_VIEWPRINT 19, 25   '@53c53
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@53c65
L_53c75:
    IF NOT (L_BP72$ <> "R") THEN GOTO L_53cbd   '@53c75 DS:4ef8
    IF NOT (L_BP72$ <> "r") THEN GOTO L_53cbd   '@53c87 DS:4efe
    IF NOT (L_BP72$ <> "E") THEN GOTO L_53cbd   '@53c99 DS:4f04
    IF NOT (L_BP72$ = "e") THEN GOTO L_54bd9   '@53cab DS:4ce0
L_53cbd:
    RT_CLS 2   '@53cbd
    RT_VIEWPRINT 21, 25   '@53ccb
    COLOR 7   '@53cdd
    PRINT ""   '@53cf3 DS:4516
    PRINT " Redefinicao manual da Armadura"   '@53d01 DS:4f0a
    PRINT " Escolha o arranjo da armadura que deseja Alterar ou Eliminar  ";   '@53d0f DS:4f2e
    COLOR RT_CINT%(FX##(V_0dc0!))   '@53d1d
    PRINT "<"; CHR$(24); "> <"; CHR$(25); "> "   '@53d3a DS:4f72,4f78,4f80
    PRINT ""   '@53d78 DS:4516
    COLOR 7   '@53d86
    PRINT " Acione  ";   '@53d9c DS:4f86
    COLOR RT_CINT%(FX##(V_0dc0!))   '@53daa
    PRINT "<Enter>";   '@53dc7 DS:4f94
    COLOR 7   '@53dd5
    PRINT " para Alterar,  ";   '@53deb DS:4fa0
    COLOR RT_CINT%(FX##(V_0dc0!))   '@53df9
    PRINT "<R>";   '@53e16 DS:4fb4
    COLOR 7   '@53e24
    PRINT "etornar  ou  ";   '@53e3a DS:4fbc
    COLOR RT_CINT%(FX##(V_0dc0!))   '@53e48
    PRINT "<E>";   '@53e65 DS:4dbe
    COLOR 7   '@53e73
    PRINT "liminar o Arranjo escolhido";   '@53e89 DS:4fce
    RT_VIEWPRINT 1, 25   '@53e97
    COLOR 14   '@53ea9
    V_15e6! = 8.0   '@53ebf DS:474a
    V_15e2! = 18.0   '@53ed0 DS:4792
    V_0ff8% = 0   '@53ee1
    V_0fec! = 0.0   '@53eec DS:46f0
    IF NOT (V_15de! > 0.0) THEN GOTO L_54002   '@53efd DS:46f0
L_53f1d:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_53f87   '@53f22
    V_0ff8% = V_0ff8% + 1   '@53f77
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@53f80
L_53f87:
    IF NOT (V_0ff8% + 1 + FX##(V_0fec!) = FX##(V_15de!)) THEN GOTO L_53fb3   '@53f87
    GOTO L_54007   '@53fab
L_53fb3:
    IF NOT (V_0ff8% + 1 + (FX##(V_0fec!) + 1.0) <= FX##(V_15de!)) THEN GOTO L_53ffd   '@53fb3 DS:4580
    V_0fec! = FX##(V_0fec!) + 1.0   '@53fdf DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@53ff5
L_53ffd:
L_54002:
L_54007:
    LOCATE RT_CINT%(FX##(V_0fec!) + 8.0 + (1 + V_0ff8% - FX##(V_15de!))), 75   '@5400c DS:474a
    COLOR 11   '@54047
    PRINT CHR$(27); CHR$(45); CHR$(45)   '@5405d
L_54094:
    V_106e$ = RT_INKEY$   '@54094
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF LEN(V_106e$) <= 0 THEN GOTO L_54094   '@540a8
    LOCATE RT_CINT%(FX##(V_0fec!) + 8.0 + (1 + V_0ff8% - FX##(V_15de!))), 75   '@540ba DS:474a
    PRINT "   "   '@540f5 DS:4fee
    L_BP76$ = V_106e$   '@54103
    IF NOT (L_BP76$ <> "8") THEN GOTO L_54153   '@54115 DS:4eee
    IF NOT (CHR$(0) + CHR$(72) = L_BP76$) THEN GOTO L_542b2   '@5412c
L_54153:
    IF NOT (V_0fec! > 0.0) THEN GOTO L_54259   '@54153 DS:46f0
    V_0fec! = FX##(V_0fec!) - 1.0   '@5416e DS:474e
    V_0ff8% = 0   '@54184
L_54194:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_541fe   '@54199
    V_0ff8% = V_0ff8% + 1   '@541ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54194   '@541f7
L_541fe:
    IF NOT (V_0ff8% + 1 + (FX##(V_0fec!) + 1.0) <= FX##(V_15de!)) THEN GOTO L_54251   '@541fe DS:4580
    V_15de! = V_0ff8% + 1 + FX##(V_0fec!)   '@5422a
    GOSUB L_58b47   '@54244
L_54251:
    GOTO L_54297   '@54251
L_54259:
    IF NOT (V_15de! = 1.0) THEN GOTO L_54292   '@54259 DS:4580
    V_15de! = 0.0   '@54274 DS:46f0
    GOSUB L_58b47   '@54285
L_54292:
L_54297:
    V_0ff8% = 0   '@54297
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@542a2
L_542b2:
    IF NOT (L_BP76$ <> "2") THEN GOTO L_542eb   '@542b2 DS:4620
    IF NOT (CHR$(0) + CHR$(80) = L_BP76$) THEN GOTO L_54455   '@542c4
L_542eb:
    IF NOT (V_0e3c% > V_0fec!) THEN GOTO L_5443a   '@542eb
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) > 0) THEN GOTO L_54359   '@54309 DS:4580
    V_0fec! = FX##(V_0fec!) + 1.0   '@54343 DS:4580
L_54359:
    V_0ff8% = 0   '@54359
L_54369:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_543d3   '@5436e
    V_0ff8% = V_0ff8% + 1   '@543c3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54369   '@543cc
L_543d3:
    IF NOT (FX##(V_0fec!) + 8.0 + (V_0ff8% + 1 - FX##(V_15de!)) > FX##(18.0)) THEN GOTO L_54435   '@543d3 DS:474a,4792
    V_15de! = FX##(V_0fec!) + 1.0 + (V_0ff8% - 10)   '@54404 DS:4580
    GOSUB L_58b47   '@54428
L_54435:
L_5443a:
    V_0ff8% = 0   '@5443a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@54445
L_54455:
    IF NOT (CHR$(13) = L_BP76$) THEN GOTO L_54475   '@54455
    GOTO L_548fa   '@5446d
L_54475:
    IF NOT (L_BP76$ <> "R") THEN GOTO L_54499   '@54475 DS:4ef8
    IF NOT (L_BP76$ = "r") THEN GOTO L_544c9   '@54487 DS:4efe
L_54499:
    RT_VIEWPRINT 19, 25   '@54499
    RT_CLS 2   '@544ab
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@544b9
L_544c9:
    IF NOT (L_BP76$ <> "E") THEN GOTO L_544ed   '@544c9 DS:4f04
    IF NOT (L_BP76$ = "e") THEN GOTO L_548ed   '@544db DS:4ce0
L_544ed:
    IF NOT (V_0fec! = 0.0) THEN GOTO L_54522   '@544ed DS:46f0
    BEEP   '@54508
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@54512
L_54522:
    V_101a! = 0.0   '@54522 DS:46f0
L_54538:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 0)) THEN GOTO L_545b5   '@5453d DS:474e
    BEEP   '@5459e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@545a8
L_545b5:
    V_101a! = FX##(V_101a!) + 1.0   '@545b5 DS:4580
    L_BP7a! = V_0e3e%   '@545cb
    CALL MIXT_0877_Menor(L_BP7a!, V_101a!, L_BP7e!)   '@545de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0e3e% >= V_101a! AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP7e!)), 0) > 0) THEN GOTO L_5464c   '@545f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54538   '@54644
L_5464c:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0)   '@54651 DS:474e
    V_15d2! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7)   '@546ab
    V_15d6! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) + 1   '@546e5
L_5474d:
    IF NOT (V_0e3c% > V_0fec!) THEN GOTO L_54871   '@54752
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), 0) > 0) THEN GOTO L_5486c   '@54770 DS:4580
    FOR L_BP52! = 0.0 TO 7.0   '@547aa DS:4580,46f0,48fa
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), RT_CINT%(FX##(L_BP52!))) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) + 1.0), RT_CINT%(FX##(L_BP52!)))   '@547b8 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@54820 DS:4580,48fa
    V_0fec! = FX##(V_0fec!) + 1.0   '@54849 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5474d   '@5485f
L_5486c:
L_54871:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = 0   '@54871
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7) = 0   '@548a0
    GOSUB L_56466   '@548d0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53622   '@548dd
L_548ed:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53f1d   '@548ed
L_548fa:
L_548ff:
    CALL S_3047d   '@54904
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_106e$ = "RETORNO") THEN GOTO L_5492d   '@5490e DS:4ff6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53622   '@54925
L_5492d:
    V_107e$ = "REDEFINE"   '@5492d DS:473a
    IF NOT (V_0fec! = 0.0) THEN GOTO L_54990   '@5493f DS:46f0
    V_0fe8! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@5495a
    GOTO L_549d3   '@54988
L_54990:
    V_0fe8! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0)   '@54990 DS:474e
L_549d3:
L_549d8:
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) * 10.0 + 1.0   '@549dd DS:4580,48fe
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) / 10.0 + 1.0   '@54a56 DS:4580,48fe
    IF NOT (V_1606! = 2.0 OR V_1602! = 2.0) THEN GOTO L_54afe   '@54aa2 DS:4746
    V_0fe8! = FX##(V_0fe8!) - 1.0   '@54ae0 DS:474e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_549d8   '@54af6
L_54afe:
    V_0ff4! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0)   '@54afe
    IF NOT (V_0fec! = 0.0) THEN GOTO L_54b87   '@54b37 DS:46f0
    L_BP3c! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@54b52
    GOTO L_54bc9   '@54b7f
L_54b87:
    L_BP3c! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0)   '@54b87 DS:474e
L_54bc9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ddb   '@54bc9
L_54bd9:
    IF NOT (L_BP72$ <> "C") THEN GOTO L_54bfd   '@54bd9 DS:5002
    IF NOT (L_BP72$ = "c") THEN GOTO L_54e88   '@54beb DS:5008
L_54bfd:
    RT_CLS 2   '@54bfd
    RT_VIEWPRINT 21, 25   '@54c0b
    PRINT " Confirme CANCELAR o dimensionamento da Coluna  SIM/*N* ";   '@54c1d DS:500e
    CALL MIXT_07f1_LimpaTeclado   '@54c2b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@54c35 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS -1   '@54c4f
    RT_VIEWPRINT 8, 25   '@54c5d
    IF NOT (UCASE$(V_106e$) <> "SIM") THEN GOTO L_54c94   '@54c6f DS:504a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@54c8c
L_54c94:
    V_0fec! = 0.0   '@54c94 DS:46f0
L_54caa:   ' sub-rotina (alvo de GOSUB)
    V_15d2! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7)   '@54caf
    V_15d6! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) + 1   '@54ce9
    GOSUB L_56466   '@54d4c
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7) = 0   '@54d59
    V_0fec! = FX##(V_0fec!) + 1.0   '@54d89 DS:4580
    IF NOT (V_0e3c% >= V_0fec!) THEN GOTO L_54dff   '@54d9f
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > 0) THEN GOTO L_54dfa   '@54dbd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_54caa   '@54df2
L_54dfa:
L_54dff:
    V_0fec! = 0.0   '@54dff DS:46f0
L_54e16:
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = 0   '@54e16
    V_0fec! = FX##(V_0fec!) + 1.0   '@54e45 DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e3c% >= V_0fec! THEN GOTO L_54e16   '@54e5b
    RETURN   '@54e76
    ' @54e80 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_56461   '@54e80
L_54e88:
    IF NOT (L_BP72$ <> "I") THEN GOTO L_54eac   '@54e88 DS:5052
    IF NOT (L_BP72$ = "i") THEN GOTO L_54f71   '@54e9a DS:5058
L_54eac:
    RT_CLS 2   '@54eac
    RT_VIEWPRINT 21, 25   '@54eba
    PRINT " Confirme INICIAR o dimensionamento da Coluna  SIM/*N* ";   '@54ecc DS:505e
    CALL MIXT_07f1_LimpaTeclado   '@54eda
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@54ee4 DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS -1   '@54efe
    RT_VIEWPRINT 8, 25   '@54f0c
    IF NOT (UCASE$(V_106e$) <> "SIM") THEN GOTO L_54f43   '@54f1e DS:504a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@54f3b
L_54f43:
    V_0fec! = 0.0   '@54f43 DS:46f0
    GOSUB L_54caa   '@54f54
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50cef   '@54f61
L_54f71:
    IF NOT (L_BP72$ <> "V") THEN GOTO L_54f95   '@54f71 DS:509a
    IF NOT (L_BP72$ = "v") THEN GOTO L_55a3e   '@54f83 DS:50a0
L_54f95:
    IF NOT (V_0e3c% = V_0fec!) THEN GOTO L_5504d   '@54f95
    BEEP   '@54fb3
    LOCATE 25, 49   '@54fbd
    COLOR 4, 7   '@54fdb
    PRINT "(maximo"; V_0e3c% + 1; "arranjos)";   '@54ff9 DS:4eda,50a6
    CALL MIXT_07f1_LimpaTeclado   '@5501a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@55024
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@55040
L_5504d:
L_55052:
    RT_VIEWPRINT 19, 25   '@55057
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@55069
    RT_CLS 2   '@55095
    RT_VIEWPRINT 21, 25   '@550a3
    PRINT " Nivel a partir do qual (superiores) teremos uma nova armadura"   '@550b5 DS:50b2
    COLOR 3   '@550c3
    PRINT " * <Enter>  para visualizar os Niveis definidos"   '@550d9 DS:50f4
    COLOR RT_CINT%(FX##(V_0dc0!))   '@550e7
    CALL MIXT_07f1_LimpaTeclado   '@55104
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Numero ou Nome *CANCELA* ", V_106e$   '@5510e DS:5128
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_VIEWPRINT 19, 25   '@55128
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_55157   '@5513a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@5514f
L_55157:
    IF NOT (V_106e$ = "*") THEN GOTO L_55180   '@55157 DS:478c
    CALL S_2608e   '@5516e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55052   '@55178
L_55180:
    IF NOT (VAL(V_106e$) > 0.0#) THEN GOTO L_551c6   '@55180 DS:4598
    V_101a! = VAL(V_106e$)   '@551a4
    GOTO L_55255   '@551be
L_551c6:
    L_BP82! = A_11c8!(0)   '@551c6
    FOR V_101a! = 1.0 TO L_BP82!   '@551e6 DS:4580
    IF NOT (UCASE$(V_106e$) = A_11f6$(RT_CINT%(FX##(V_101a!)))) THEN GOTO L_55227   '@551ee
    GOTO L_55250   '@5521f
L_55227:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101a!   '@55227 DS:4580
L_55250:
L_55255:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) <= V_101a! OR A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) >= V_101a!) THEN GOTO L_552e4   '@55255
    BEEP   '@552d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55052   '@552dc
L_552e4:
    L_BP86! = V_0fec!   '@552e4
    FOR V_1016! = 0.0 TO L_BP86!   '@552f6 DS:4580,46f0
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0) = V_101a!) THEN GOTO L_55353   '@552fe
    BEEP   '@55341
    GOTO L_5537c   '@5534b
L_55353:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@55353 DS:4580
L_5537c:
    IF NOT (FX##(V_0fec!) + 1.0 > FX##(V_1016!)) THEN GOTO L_553a4   '@5537c DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55052   '@5539c
L_553a4:
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)))) / 10.0) * 10.0 + 1.0   '@553a4 DS:4580,48fe
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)))) / 10.0) / 10.0 + 1.0   '@5541d DS:4580,48fe
    IF NOT (V_1606! = 2.0 OR V_1602! = 2.0) THEN GOTO L_554b9   '@55469 DS:4746
    BEEP   '@554a7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55052   '@554b1
L_554b9:
    LOCATE 24, 1   '@554b9
    COLOR 7   '@554d4
    PRINT " Confirme uma nova armadura a partir do NIVEL"; V_101a!; " - ";   '@554ea DS:5146,5178
    COLOR 14   '@5550e
    PRINT A_11f6$(RT_CINT%(FX##(V_101a!)));   '@55524
    COLOR 7   '@55546
    CALL MIXT_07f1_LimpaTeclado   '@5555c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "  N/*S* ", V_106e$   '@55566 DS:5180
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_555a5   '@55580 DS:4664
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55052   '@5559d
L_555a5:
    FOR V_1016! = V_0fec! TO 0.0 STEP -1.0   '@555a5 DS:46f0,474e
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), 0) > V_101a!) THEN GOTO L_559f0   '@555b2
    L_BP8a! = 0.0   '@555f5 DS:46f0
    L_BP8e! = FX##(V_1016!) - 1.0   '@55607 DS:474e
    CALL MIXT_082a_Maior(L_BP8a!, L_BP8e!, L_BP92!)   '@55617
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_1016! > 0.0 AND A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP92!)), 0) > V_101a!) THEN GOTO L_55733   '@5562c DS:46f0
    FOR L_BP52! = 0.0 TO 7.0   '@5568c DS:4580,46f0,48fa
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!) + 1.0), RT_CINT%(FX##(L_BP52!))) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1016!)), RT_CINT%(FX##(L_BP52!)))   '@5569a DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@55702 DS:4580,48fa
    GOTO L_559eb   '@5572b
L_55733:
    V_0fec! = FX##(V_1016!) + 1.0   '@55733 DS:4580
    IF NOT (V_168c$ <> "0") THEN GOTO L_557a7   '@55749 DS:45ee
    V_0fe8! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0) - 1   '@55760 DS:474e
    GOTO L_557bd   '@5579f
L_557a7:
    V_0fe8! = V_101a!   '@557a7
L_557bd:
L_557c2:
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) * 10.0 + 1.0   '@557c7 DS:4580,48fe
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)))) / 10.0) / 10.0 + 1.0   '@55840 DS:4580,48fe
    IF NOT (V_1606! = 2.0 OR V_1602! = 2.0) THEN GOTO L_558e8   '@5588c DS:4746
    V_0fe8! = FX##(V_0fe8!) - 1.0   '@558ca DS:474e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_557c2   '@558e0
L_558e8:
    V_0ff4! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0)   '@558e8 DS:474e
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) = RT_CINT%(FX##(V_0ff4!))   '@55926
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1) = 0   '@55961
    A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3) = 0   '@55991
    L_BP5c! = V_101a!   '@559be
    L_BP3c! = V_101a!   '@559ce
    GOTO L_55a1c   '@559de
L_559eb:
L_559f0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@559f0 DS:46f0,474e
L_55a1c:
    V_107e$ = "VARIA"   '@55a1c DS:4730
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_50ddb   '@55a2e
L_55a3e:
    IF NOT (L_BP72$ <> "D") THEN GOTO L_55a62   '@55a3e DS:518c
    IF NOT (L_BP72$ = "d") THEN GOTO L_56454   '@55a50 DS:5192
L_55a62:
    RT_VIEWPRINT 19, 25   '@55a62
    COLOR RT_CINT%(FX##(V_0dc0!))   '@55a74
    RT_CLS 2   '@55a91
    RT_VIEWPRINT 21, 25   '@55a9f
    V_0fe0! = 0.0   '@55ab1 DS:46f0
    CALL MIXT_07f1_LimpaTeclado   '@55ac2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Imprimo o desenho das Secoes S/*N* ", V_106e$   '@55acc DS:5198
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "S") THEN GOTO L_55b4b   '@55ae6 DS:45f4
    V_0fe0! = 1.0   '@55b03 DS:4580
    PRINT " Ajuste a Impressora e acione <Enter> para proseguir ";   '@55b14 DS:51c0
    CALL MIXT_07f1_LimpaTeclado   '@55b22
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@55b2c DS:4516
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_55b4b:
    V_0fec! = 0.0   '@55b4b DS:46f0
L_55b61:
    V_0ff8% = 0   '@55b66
L_55b76:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 0)) THEN GOTO L_55be0   '@55b7b
    V_0ff8% = V_0ff8% + 1   '@55bd0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55b76   '@55bd9
L_55be0:
    REDIM A_10ec!(-32768 TO -32768, -32768 TO -32768)   '@55be0
    REDIM A_1148!(-32768 TO -32768, -32768 TO -32768)   '@55bee
    REDIM A_10ec!(0 TO CINT(V_0e30!), 0 TO 2)   '@55bf7
    REDIM A_1148!(0 TO CINT(V_0e30!), 0 TO 1)   '@55c22
    REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@55c4d
    REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@55c5b
    REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@55c64
    REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@55c8f
    L_BP94% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 6)   '@55cba
    IF NOT (L_BP94% = 1) THEN GOTO L_55da3   '@55ce5
    V_102e! = 1.0   '@55cf4 DS:4580
    V_0fb8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@55d05
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@55d38
    V_106a! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 3)   '@55d6b
    GOTO L_55fd4   '@55d9b
L_55da3:
    IF NOT (L_BP94% = 2) THEN GOTO L_55e3d   '@55da3
    V_102e! = 2.0   '@55dad DS:4746
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@55dbe
    V_0fc0! = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@55df1
    V_106a! = 0.0   '@55e24 DS:46f0
    GOTO L_55fd4   '@55e35
L_55e3d:
    IF NOT (L_BP94% = 3) THEN GOTO L_55fd4   '@55e3d
    V_102e! = 3.0   '@55e47 DS:51fa
    L_BP96% = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 1)   '@55e58
    A_10be!(0, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), V_0ff8%, 2)   '@55e83
    V_106a! = 0.0   '@55ec5 DS:46f0
    L_BP9a! = A_10be!(0, 0)   '@55ed6
    FOR V_1012! = 0.0 TO L_BP9a!   '@55ef7 DS:4580,46f0
    A_10be!(RT_CINT%(FX##(V_1012!)), 0) = FX##(A_1366%(L_BP96%, RT_CINT%(FX##(V_1012!)), 0)) / 10.0   '@55efe DS:48fe
    A_10be!(RT_CINT%(FX##(V_1012!)), 1) = FX##(A_1366%(L_BP96%, RT_CINT%(FX##(V_1012!)), 1)) / 10.0   '@55f4e DS:48fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1012!   '@55fa0 DS:4580
    GOTO L_55fd4   '@55fcc
L_55fd4:
    V_108e! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 1)   '@55fd4
    V_1086! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 2)   '@5600e
    V_1092! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 3)   '@56048
    V_108a! = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 4)   '@5607f
    CALL S_21dfd   '@560b9
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_10ec!(0, 0) = FX##(A_13f0%(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7), 0)) / 10.0   '@560c3 DS:48fe
    L_BP9e! = A_10ec!(0, 0)   '@56123
    FOR L_BP52! = 0.0 TO L_BP9e!   '@56144 DS:4580,46f0
    FOR V_100e! = 0.0 TO 2.0   '@5614c DS:4580,46f0,4746
    A_10ec!(RT_CINT%(FX##(L_BP52!)), RT_CINT%(FX##(V_100e!))) = FX##(A_13f0%(RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 7)) + L_BP52!), RT_CINT%(FX##(V_100e!)))) / 10.0   '@5615a DS:48fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@561e2 DS:4580,4746
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP52!   '@5620e DS:4580
    GOSUB L_5997f   '@56237
    CALL MIXT_07f1_LimpaTeclado   '@56244
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0fe0! = 0.0) THEN GOTO L_56285   '@5624e DS:46f0
    V_106e$ = RT_INPUT$(1)   '@56269
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_56285:
    V_0fec! = FX##(V_0fec!) + 1.0   '@56285 DS:4580
    IF NOT (V_0e3c% >= V_0fec!) THEN GOTO L_562fb   '@5629b
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0) > 0) THEN GOTO L_562f6   '@562b9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_55b61   '@562ee
L_562f6:
L_562fb:
    RT_SCREEN 0   '@562fb
    RT_VIEWPRINT 1, 25   '@56310
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@56322
    RT_CLS 2   '@5635d
    PRINT RT_STRINGC$((80), (205))   '@5636b
    PRINT " Predimensionamento de Secao e Dimensionamento da Armadura"   '@56383 DS:51fe
    PRINT " Numero maximo de Colunas -"; V_0e34!; "       Posicionadas"; V_11a6%; "Colunas"   '@56391 DS:523c,525c,5274
    PRINT RT_STRINGC$((80), (205))   '@563c7
    LOCATE 6, 1   '@563df
    PRINT " Posicao"; V_0fe4!; RT_TAB$(20); ""; A_1252$(RT_CINT%(FX##(V_0fe4!)))   '@563fa DS:4516,4724
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_53622   '@56444
L_56454:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5368c   '@56454
L_56461:
L_56466:   ' sub-rotina (alvo de GOSUB)
    IF NOT (FX##(V_15d2!) + V_15d6! < V_0e40%) THEN GOTO L_565ab   '@5646b
    L_BPa2! = V_0e40%   '@5648e
    FOR V_15da! = FX##(V_15d2!) + V_15d6! TO L_BPa2!   '@564a3 DS:4580
    A_13f0%(RT_CINT%(FX##(V_15da!) - V_15d6!), 0) = A_13f0%(RT_CINT%(FX##(V_15da!)), 0)   '@564b0
    A_13f0%(RT_CINT%(FX##(V_15da!) - V_15d6!), 1) = A_13f0%(RT_CINT%(FX##(V_15da!)), 1)   '@564f4
    A_13f0%(RT_CINT%(FX##(V_15da!) - V_15d6!), 2) = A_13f0%(RT_CINT%(FX##(V_15da!)), 2)   '@5653a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15da!   '@5657a DS:4580
L_565ab:
    V_0e40% = RT_CINT%(FX##(V_0e40%) - V_15d6!)   '@565ab
    L_BPa6! = V_11a6%   '@565c5
    FOR V_15da! = 1.0 TO L_BPa6!   '@565da DS:4580
    L_BPaa! = 0.0   '@565e2 DS:46f0
L_565f8:
    IF NOT (A_141e%(RT_CINT%(FX##(V_15da!)), RT_CINT%(FX##(L_BPaa!)), 7) > V_15d2!) THEN GOTO L_566ab   '@565fd
    A_141e%(RT_CINT%(FX##(V_15da!)), RT_CINT%(FX##(L_BPaa!)), 7) = RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_15da!)), RT_CINT%(FX##(L_BPaa!)), 7)) - V_15d6!)   '@56641
L_566ab:
    L_BPaa! = FX##(L_BPaa!) + 1.0   '@566ab DS:4580
    IF NOT (V_0e3c% >= L_BPaa!) THEN GOTO L_56721   '@566c1
    IF NOT (A_141e%(RT_CINT%(FX##(V_15da!)), RT_CINT%(FX##(L_BPaa!)), 0) > 0) THEN GOTO L_5671c   '@566df
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_565f8   '@56714
L_5671c:
L_56721:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15da!   '@56721 DS:4580
    RETURN   '@5674d
L_5675c:   ' sub-rotina (alvo de GOSUB)
    V_0ff0! = V_0fe8!   '@56761
    CALL S_60164   '@56772
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f88! = FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fe8!)), 0)   '@5677c
    V_0fd4! = -1.0   '@567b6 DS:474e
    V_10ba! = 0.0   '@567c7 DS:46f0
    IF NOT (V_0ea2$ = "S") THEN GOTO L_5692f   '@567d8 DS:45f4
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0fe8! = FX##(4.0)) THEN GOTO L_56858   '@567ef DS:4ce6
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.20000000298023223876953125## / 100.0   '@5682d DS:490c,5280
L_56858:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0fe8! = FX##(5.0)) THEN GOTO L_568c1   '@56858 DS:5284
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.4000000059604644775390625## / 100.0   '@56896 DS:490c,5288
L_568c1:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_0fe8! > FX##(5.0)) THEN GOTO L_5692a   '@568c1 DS:5284
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.60000002384185791015625## / 100.0   '@568ff DS:490c,528c
L_5692a:
L_5692f:
    IF NOT (V_11c6% = 1) THEN GOTO L_56958   '@5692f
    V_1076$ = ""   '@5693e DS:4516
    GOTO L_586b0   '@56950
L_56958:
    COLOR 7   '@56958
    L_BPae! = V_102e!   '@5696e
    IF NOT (L_BPae! = 1.0) THEN GOTO L_56ab3   '@5697f DS:4580
    PRINT RT_TAB$(6); ""; "Bw ="; V_0fb8!; RT_TAB$(18); ""; "Hw ="; V_0fbc!;   '@5699a DS:4516,5290,5298
    V_15ea$ = "Bw =" + STR$(V_0fb8!) + "     Hw =" + STR$(V_0fbc!)   '@569ef DS:5290,52a0
    IF NOT (V_106a! <> 0.0) THEN GOTO L_56aab   '@56a33 DS:46f0
    PRINT RT_TAB$(30); ""; "rot ="; V_106a!;   '@56a4e DS:4516,52ae
    V_15ea$ = V_15ea$ + "   rot =" + STR$(V_106a!)   '@56a7b DS:52b8
L_56aab:
    GOTO L_56c3e   '@56aab
L_56ab3:
    IF NOT (L_BPae! = 2.0) THEN GOTO L_56b9c   '@56ab4 DS:4746
    PRINT RT_TAB$(6); ""; "Dexterno ="; V_0fbc!;   '@56ac9 DS:4516,52c4
    V_15ea$ = "Dexterno =" + STR$(V_0fbc!)   '@56af6 DS:52c4
    IF NOT (V_0fc0! > 0.0) THEN GOTO L_56b94   '@56b1c DS:46f0
    PRINT RT_TAB$(25); ""; "Dinterno ="; V_0fc0!;   '@56b37 DS:4516,52d2
    V_15ea$ = V_15ea$ + "    Dinterno =" + STR$(V_0fc0!)   '@56b64 DS:52e0
L_56b94:
    GOTO L_56c3e   '@56b94
L_56b9c:
    IF NOT (L_BPae! = 3.0) THEN GOTO L_56c3e   '@56b9d DS:51fa
    PRINT RT_TAB$(6); ""; "Poligonal com"; A_10be!(0, 0); "vertices";   '@56bb2 DS:4516,52f2,5304
    V_15ea$ = "Poligonal com" + STR$(A_10be!(0, 0)) + " vertices"   '@56bf7 DS:52f2,5310
    GOTO L_56c3e   '@56c36
L_56c3e:
    IF NOT (V_107e$ = "REDEFINE") THEN GOTO L_56c5d   '@56c3e DS:473a
    GOTO L_586b0   '@56c55
L_56c5d:
    V_1022! = 0.0   '@56c5d DS:46f0
    V_105a! = 12.0   '@56c6e DS:531e
    V_100a! = V_0e8e!   '@56c7f
    CALL S_203ed   '@56c90
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_25d0d   '@56c9a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPb2! = ((FX##(V_0f88!) + V_0f90! + (FX##(V_10b6!) - V_10ba!)) * V_0e1c! * V_0de8! - V_1096!) * 1.2000000476837158203125## / V_0fc4!   '@56ca4 DS:5322
    L_BPb6! = (FX##(V_0f88!) + V_0f90! + (FX##(V_10b6!) - V_10ba!)) / (FX##(V_0e5e!) * V_0dec! * V_105e! * 100.0) * V_0e1c! * V_0de8! * V_0e20! * V_0eb4!   '@56ce0 DS:490c
    CALL MIXT_082a_Maior(L_BPb2!, L_BPb6!, L_BPba!)   '@56d2e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb2! = L_BPba!   '@56d43
    L_BPbe! = FX##(V_104a!) * V_0eb8! / 100.0   '@56d4e DS:490c
    CALL MIXT_082a_Maior(L_BPb2!, L_BPbe!, L_BPc2!)   '@56d69
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb2! = L_BPc2!   '@56d7e
    V_1086! = V_0ec8!   '@56d89
    V_1076$ = ""   '@56d9a DS:4516
L_56db1:
    L_BPc4% = -(V_0ec0$ = "S") * 2   '@56db6 DS:45f4
    L_BPc6% = (V_104a! / (FX##(-((V_0ec0$ = "N") - L_BPc4%)) * 100.0) * V_0ebc! < FX##(L_BPb2!))   '@56dea DS:4664,490c
    IF NOT ((V_1076$ = "ESGOTADO" AND L_BPc6%) <> 0) THEN GOTO L_56f1b   '@56e28 DS:5326
    RT_VIEWPRINT 17, 25   '@56e3e
    RT_CLS -1   '@56e50
    BEEP   '@56e5e
    COLOR RT_CINT%(FX##(V_0dc0!))   '@56e68
    PRINT " ATENCAO !!!"   '@56e85 DS:5332
    PRINT " ESTA SECAO NAO SUPORTA OS ESFORCOS ATUANTES COM A MAXIMA TAXA DE ARMADURA"   '@56e93 DS:5342
    PRINT " PERMITIDA NA CONFIGURACAO."   '@56ea1 DS:5390
    PRINT " ASSIM, ALTERE A SECAO DA COLUNA E RETORNE AO DIMENSIONAMENTO DA ARMADURA."   '@56eaf DS:53b0
    CALL MIXT_07f1_LimpaTeclado   '@56ebd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_1082$ <> "S") THEN GOTO L_56efa   '@56ec7 DS:45f4
    V_106e$ = RT_INPUT$(1)   '@56ede
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_56efa:
    V_106e$ = "NAOSUPORTA"   '@56efa DS:47a6
    RETURN   '@56f0c
L_56f1b:
    V_108a! = V_1086!   '@56f1b
    IF NOT (V_0ec4$ = "S") THEN GOTO L_56fde   '@56f2c DS:45f4
    IF NOT (V_1086! > V_0ec8!) THEN GOTO L_56f74   '@56f43
    V_108a! = FX##(V_1086!) - 1.0   '@56f5e DS:474e
L_56f74:
    IF NOT (V_102e! = 2.0 OR A_0efa!(RT_CINT%(FX##(V_108a!))) = 0.0) THEN GOTO L_56fd9   '@56f74 DS:46f0,4746
    V_108a! = V_1086!   '@56fc8
L_56fd9:
L_56fde:
L_56fe3:
    REDIM A_10ec!(-32768 TO -32768, -32768 TO -32768)   '@56fe8
    REDIM A_1148!(-32768 TO -32768, -32768 TO -32768)   '@56ff6
    REDIM A_10ec!(0 TO CINT(V_0e30!), 0 TO 2)   '@56fff
    REDIM A_1148!(0 TO CINT(V_0e30!), 0 TO 1)   '@5702a
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_57ee5   '@57055 DS:4580,51fa
    V_108e! = A_10be!(0, 0)   '@57093
    V_1092! = 0.0   '@570b3 DS:46f0
    IF NOT (FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! < FX##(L_BPb2!)) THEN GOTO L_57238   '@570c4
    V_1092! = INT((L_BPb2! - FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e!) / A_0efa!(RT_CINT%(FX##(V_108a!))))   '@570fa
    IF NOT (FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092! < FX##(L_BPb2!)) THEN GOTO L_571bf   '@57150
    V_1092! = FX##(V_1092!) + 1.0   '@571a9 DS:4580
L_571bf:
    L_BPc8% = (V_102e! = 1.0)   '@571bf DS:4580
    IF NOT ((FX##(V_1092!) / 2.0 <> RT_CLNG&(FX##(V_1092!)) \ 2& AND L_BPc8%) <> 0) THEN GOTO L_57233   '@571df DS:4746
    V_1092! = FX##(V_1092!) + 1.0   '@5721d DS:4580
L_57233:
L_57238:
    IF NOT (FX##(V_108e!) + V_1092! > FX##(V_0e30!)) THEN GOTO L_57329   '@57238
    IF NOT (V_108a! < V_1086!) THEN GOTO L_5728c   '@57258
    V_108a! = V_1086!   '@57273
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56fe3   '@57284
L_5728c:
L_57291:
    V_1086! = FX##(V_1086!) + 1.0   '@57296 DS:4580
    IF NOT (V_1086! > 12.0) THEN GOTO L_572e3   '@572ac DS:531e
    V_106e$ = "NAOBARRA"   '@572c7 DS:47be
    RETURN   '@572d9
L_572e3:
    IF NOT (A_0efa!(RT_CINT%(FX##(V_1086!))) = 0.0) THEN GOTO L_5731c   '@572e3 DS:46f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_57291   '@57314
L_5731c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@5731c
L_57329:
    V_0fa4! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 0)   '@57329
    V_0fa8! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 1)   '@57362
    L_BPcc! = A_10be!(0, 0)   '@5739c
    FOR V_100e! = 1.0 TO L_BPcc!   '@573bd DS:4580
    L_BPd0! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@573c4
    L_BPd4! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@573ef
    L_BPd8! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@57415 DS:4580
    L_BPdc! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@5743f DS:4580
    L_BPe0! = FX##(A_0ecc!(RT_CINT%(FX##(V_1086!)))) / 20.0 + V_0e8e!   '@5746a DS:53fe
    CALL S_24f4a(V_0fa4!, V_0fa8!, L_BPd0!, L_BPd4!, L_BPd8!, L_BPdc!, L_BPe0!)   '@57495
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BPdc!   '@574bc DS:4580
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BPd8!   '@574e7 DS:4580
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BPd4!   '@57511
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BPd0!   '@57537
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = V_1006!   '@5755b
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = V_100a!   '@57585
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = V_1086!   '@575b0
    V_0fa4! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@575d8
    V_0fa8! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@57602
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@5762d DS:4580
    IF NOT (V_1092! > 0.0) THEN GOTO L_57ee0   '@57659 DS:46f0
    V_101e! = 0.0   '@57674 DS:46f0
    V_1002! = 0.0   '@57685 DS:46f0
    L_BPe4! = A_10be!(0, 0)   '@57696
    FOR V_100e! = 1.0 TO L_BPe4!   '@576b7 DS:4580
    V_0fa4! = A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@576be DS:4580
    V_0fa8! = A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@576ed DS:4580
    IF NOT (A_10be!(0, 0) = V_100e!) THEN GOTO L_5778b   '@5771d
    V_0fa4! = A_10ec!(1, 0)   '@57747
    V_0fa8! = A_10ec!(1, 1)   '@5776a
L_5778b:
    V_1012! = RT_SQR##(RT_POT##((FX##(V_0fa4!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 0)), (2.0)) + RT_POT##((FX##(V_0fa8!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)))   '@5778b DS:4746
    IF NOT (A_1394%(RT_CINT%(FX##(V_108a!))) * 2 <= V_1012!) THEN GOTO L_5785f   '@577fc
    V_101e! = FX##(V_101e!) + V_1012!   '@57833
    V_1002! = FX##(V_1002!) + 1.0   '@57849 DS:4580
L_5785f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@5785f DS:4580
    IF NOT (V_101e! / (FX##(V_1092!) + V_1002!) < A_1394%(RT_CINT%(FX##(V_108a!))) OR V_101e! = 0.0) THEN GOTO L_579c5   '@5788b DS:46f0
    IF NOT (V_108a! < V_1086!) THEN GOTO L_57928   '@578f4
    V_108a! = V_1086!   '@5790f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56fe3   '@57920
L_57928:
L_5792d:
    V_1086! = FX##(V_1086!) + 1.0   '@57932 DS:4580
    IF NOT (V_1086! > 12.0) THEN GOTO L_5797f   '@57948 DS:531e
    V_106e$ = "NAOBARRA"   '@57963 DS:47be
    RETURN   '@57975
L_5797f:
    IF NOT (A_0efa!(RT_CINT%(FX##(V_1086!))) = 0.0) THEN GOTO L_579b8   '@5797f DS:46f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5792d   '@579b0
L_579b8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@579b8
L_579c5:
    L_BPe8! = V_101e! / (FX##(V_1092!) + V_1002!)   '@579c5
L_579e8:
    V_101e! = 0.0   '@579ed DS:46f0
    L_BPec! = A_10be!(0, 0)   '@579fe
    FOR V_100e! = 1.0 TO L_BPec!   '@57a1f DS:4580
    V_0fa4! = A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@57a26 DS:4580
    V_0fa8! = A_10ec!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@57a55 DS:4580
    IF NOT (A_10be!(0, 0) = V_100e!) THEN GOTO L_57af3   '@57a85
    V_0fa4! = A_10ec!(1, 0)   '@57aaf
    V_0fa8! = A_10ec!(1, 1)   '@57ad2
L_57af3:
    V_1012! = RT_SQR##(RT_POT##((FX##(V_0fa8!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 1)), (2.0)) + RT_POT##((FX##(V_0fa4!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 0)), (2.0)))   '@57af3 DS:4746
    IF NOT (A_1394%(RT_CINT%(FX##(V_108a!))) * 2 <= V_1012!) THEN GOTO L_57e76   '@57b64
    L_BPf0! = FX##(V_1012!) / L_BPe8! - 1.0   '@57b9b DS:474e
    L_BPf4! = FX##(V_1092!) - V_101e!   '@57bb7
    CALL MIXT_0877_Menor(L_BPf0!, L_BPf4!, L_BPf8!)   '@57bc7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1002! = INT(FX##(L_BPf8!))   '@57bdc
    IF NOT (V_100e! = 2.0 AND V_102e! = 1.0) THEN GOTO L_57c61   '@57bee DS:4580,4746
    V_1002! = RT_CLNG&(V_1092! - 2.0 * FX##(V_101e!)) \ 2&   '@57c2c DS:4746
L_57c61:
    IF NOT (V_1002! < 0.0) THEN GOTO L_57c8d   '@57c61 DS:46f0
    V_1002! = 0.0   '@57c7c DS:46f0
L_57c8d:
    V_0fa4! = FX##(V_0fa4!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 0)   '@57c8d
    V_0fa8! = FX##(V_0fa8!) - A_10ec!(RT_CINT%(FX##(V_100e!)), 1)   '@57cbc
    L_BPfc! = V_1002!   '@57cec
    FOR V_1022! = 1.0 TO L_BPfc!   '@57cfe DS:4580
    A_10ec!(RT_CINT%(FX##(A_10be!(0, 0)) + V_101e! + V_1022!), 0) = V_1022! / (FX##(V_1002!) + 1.0) * V_0fa4! + A_10ec!(RT_CINT%(FX##(V_100e!)), 0)   '@57d06 DS:4580
    A_10ec!(RT_CINT%(FX##(A_10be!(0, 0)) + V_101e! + V_1022!), 1) = V_1022! / (FX##(V_1002!) + 1.0) * V_0fa8! + A_10ec!(RT_CINT%(FX##(V_100e!)), 1)   '@57d79 DS:4580
    A_10ec!(RT_CINT%(FX##(A_10be!(0, 0)) + V_101e! + V_1022!), 2) = V_108a!   '@57dee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1022!   '@57e2f DS:4580
    V_101e! = FX##(V_101e!) + V_1002!   '@57e5b
L_57e76:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@57e76 DS:4580
    IF NOT (V_101e! < V_1092!) THEN GOTO L_57edb   '@57ea2
    L_BPe8! = L_BPe8! - 0.004999999888241291046142578125##   '@57ebd DS:5402
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_579e8   '@57ed3
L_57edb:
L_57ee0:
L_57ee5:
    IF NOT (V_102e! = 2.0) THEN GOTO L_58686   '@57ee5 DS:4746
    V_108e! = INT(((V_0fc0! > 0.0) * 0.300000011920928955078125## + 1.0) / A_0efa!(RT_CINT%(FX##(V_1086!))) * L_BPb2!) + 1.0   '@57f00 DS:4580,46f0,5406
    V_1092! = 0.0   '@57f5e DS:46f0
    IF NOT (V_0fc0! > 0.0) THEN GOTO L_57fc7   '@57f6f DS:46f0
    V_1092! = INT(FX##(L_BPb2!) / A_0efa!(RT_CINT%(FX##(V_108a!))) * 0.300000011920928955078125##) + 1.0   '@57f8a DS:4580,5406
L_57fc7:
    IF NOT (FX##(V_108e!) + V_1092! > FX##(V_0e30!)) THEN GOTO L_580b8   '@57fc7
    IF NOT (V_108a! < V_1086!) THEN GOTO L_5801b   '@57fe7
    V_108a! = V_1086!   '@58002
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56fe3   '@58013
L_5801b:
L_58020:
    V_1086! = FX##(V_1086!) + 1.0   '@58025 DS:4580
    IF NOT (V_1086! > 12.0) THEN GOTO L_58072   '@5803b DS:531e
    V_106e$ = "NAOBARRA"   '@58056 DS:47be
    RETURN   '@58068
L_58072:
    IF NOT (A_0efa!(RT_CINT%(FX##(V_1086!))) = 0.0) THEN GOTO L_580ab   '@58072 DS:46f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_58020   '@580a3
L_580ab:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@580ab
L_580b8:
    IF NOT (V_0fec! > 0.0) THEN GOTO L_581f0   '@580b8 DS:46f0
    IF NOT (FX##(V_108e!) + V_1092! > A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 1)) THEN GOTO L_581eb   '@580d3 DS:474e
L_58153:
    V_1086! = FX##(V_1086!) + 1.0   '@58158 DS:4580
    IF NOT (V_1086! > 12.0) THEN GOTO L_581a5   '@5816e DS:531e
    V_106e$ = "NAOBARRA"   '@58189 DS:47be
    RETURN   '@5819b
L_581a5:
    IF NOT (A_0efa!(RT_CINT%(FX##(V_1086!))) = 0.0) THEN GOTO L_581de   '@581a5 DS:46f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_58153   '@581d6
L_581de:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@581de
L_581eb:
L_581f0:
    L_BP100! = V_108e!   '@581f0
    FOR V_100e! = 1.0 TO L_BP100!   '@58202 DS:4580
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_COS##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_108e!) * (FX##(V_0fbc!) / 2.0 - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(V_1086!)))) / 20.0) * 10.0)) / 10.0   '@5820a DS:4746,48fe,53fe,540a
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_SIN##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_108e!) * (FX##(V_0fbc!) / 2.0 - V_0e8e! - FX##(A_0ecc!(RT_CINT%(FX##(V_1086!)))) / 20.0) * 10.0)) / 10.0   '@582a5 DS:4746,48fe,53fe,540a
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = V_1086!   '@58341
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@58369 DS:4580
    IF NOT (V_1092! > 0.0) THEN GOTO L_58564   '@58395 DS:46f0
    L_BP104! = FX##(V_108e!) + V_1092!   '@583b0
    FOR V_100e! = FX##(V_108e!) + 1.0 TO L_BP104!   '@583c7 DS:4580
    A_10ec!(RT_CINT%(FX##(V_100e!)), 0) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_COS##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_1092!) * (FX##(V_0fc0!) / 2.0 + V_0e8e! + FX##(A_0ecc!(RT_CINT%(FX##(V_108a!)))) / 20.0) * 10.0)) / 10.0   '@583d4 DS:4746,48fe,53fe,540a
    A_10ec!(RT_CINT%(FX##(V_100e!)), 1) = FX##(V_0fbc!) / 2.0 + FX##(RT_CINT%(RT_SIN##((FX##(V_100e!) * 2.0 - 2.0) * V_0e5a! / V_1092!) * (FX##(V_0fc0!) / 2.0 + V_0e8e! + FX##(A_0ecc!(RT_CINT%(FX##(V_108a!)))) / 20.0) * 10.0)) / 10.0   '@5846f DS:4746,48fe,53fe,540a
    A_10ec!(RT_CINT%(FX##(V_100e!)), 2) = V_108a!   '@5850b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@58533 DS:4580
L_58564:
    IF NOT ((V_0fbc! - 2.0 * FX##(V_0e8e!)) * V_0e5a! / V_108e! < A_1394%(RT_CINT%(FX##(V_1086!)))) THEN GOTO L_58681   '@58564 DS:4746
    IF NOT (V_108a! < V_1086!) THEN GOTO L_585e4   '@585b0
    V_108a! = V_1086!   '@585cb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56fe3   '@585dc
L_585e4:
L_585e9:
    V_1086! = FX##(V_1086!) + 1.0   '@585ee DS:4580
    IF NOT (V_1086! > 12.0) THEN GOTO L_5863b   '@58604 DS:531e
    V_106e$ = "NAOBARRA"   '@5861f DS:47be
    RETURN   '@58631
L_5863b:
    IF NOT (A_0efa!(RT_CINT%(FX##(V_1086!))) = 0.0) THEN GOTO L_58674   '@5863b DS:46f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_585e9   '@5866c
L_58674:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@58674
L_58681:
L_58686:
    A_10ec!(0, 0) = FX##(V_108e!) + V_1092!   '@58686
L_586b0:
    CALL S_45f89   '@586b5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_11ae% = 2   '@586bf
    L_BP106% = (V_106e$ = "NAO")   '@586ca DS:4784
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP106%) <> 0) THEN GOTO L_588db   '@586f0 DS:473a
    L_BP10a! = 1.60000002384185791015625##   '@58706 DS:540e
    CALL MIXT_0877_Menor(V_0ffa!, L_BP10a!, L_BP10e!)   '@58717
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb2! = (FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!) * L_BP10e!   '@5872b
    L_BP110% = -(V_0ec0$ = "S") * 2   '@58779 DS:45f4
    L_BP112% = (V_104a! / (FX##(-((V_0ec0$ = "N") - L_BP110%)) * 100.0) * V_0ebc! < FX##(L_BPb2!))   '@587ad DS:4664,490c
    IF NOT ((V_1076$ <> "ESGOTADO" AND L_BP112%) <> 0) THEN GOTO L_58876   '@587eb DS:5326
    L_BP114% = -(V_0ec0$ = "S") * 2   '@58801 DS:45f4
    L_BPb2! = V_104a! / (FX##(-((V_0ec0$ = "N") - L_BP114%)) * 100.0) * V_0ebc! - 0.100000001490116119384765625##   '@58830 DS:4664,490c,5412
    V_1076$ = "ESGOTADO"   '@5885f DS:5326
L_58876:
    L_BP116% = (FX##(V_0ffa!) < 1.60000002384185791015625##)   '@58876 DS:540e
    IF NOT ((RT_INSTR%((1), (V_1076$), ("JADIMINUIU")) > 0 AND L_BP116%) <> 0) THEN GOTO L_588ce   '@588a4 DS:5416
    V_1076$ = "JADIMINUIU****"   '@588bc DS:5424
L_588ce:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@588ce
L_588db:
    L_BP118% = (V_106e$ = "DIMINUI")   '@588db DS:5436
    IF NOT ((V_107e$ <> "REDEFINE" AND L_BP118%) <> 0) THEN GOTO L_58b38   '@58901 DS:473a
    L_BP11a% = (FX##(V_0ffa!) < 0.976000010967254638671875##)   '@58917 DS:5442
    IF NOT ((1.0299999713897705078125## * V_0fd0! < FX##(L_BPb2!) AND (1.0299999713897705078125## * V_104a! * V_0eb8! / 100.0 < FX##(L_BPb2!) AND (RT_INSTR%((1), (V_1076$), ("****")) = 0 AND L_BP11a%))) <> 0) THEN GOTO L_58b1c   '@58945 DS:490c,5446,544e
    L_BP11e! = 0.699999988079071044921875##   '@589a5 DS:5452
    CALL MIXT_082a_Maior(V_0ffa!, L_BP11e!, L_BP122!)   '@589b6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb2! = (FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!) * L_BP122!   '@589ca
    IF NOT (FX##(V_104a!) * V_0eb8! / 100.0 > FX##(L_BPb2!)) THEN GOTO L_58a6f   '@58a18 DS:490c
    L_BPb2! = FX##(V_104a!) * V_0eb8! / 100.0   '@58a3d DS:490c
    V_1076$ = "JADIMINUIU***"   '@58a58 DS:5456
L_58a6f:
    IF NOT (L_BPb2! < V_0fd0!) THEN GOTO L_58a9b   '@58a6f
    L_BPb2! = V_0fd0!   '@58a8a
L_58a9b:
    IF NOT (RT_MID$((V_1076$), (1), (4)) = "JADI") THEN GOTO L_58ae4   '@58a9b DS:5468
    V_1076$ = V_1076$ + "*"   '@58ac0 DS:478c
    GOTO L_58afb   '@58adc
L_58ae4:
    V_1076$ = "JADIMINUIU"   '@58ae4 DS:5416
L_58afb:
    V_1086! = V_0ec8!   '@58afb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56db1   '@58b0c
L_58b1c:
    V_106e$ = ""   '@58b1c DS:4516
L_58b38:
    RETURN   '@58b38
L_58b47:   ' sub-rotina (alvo de GOSUB)
    LOCATE RT_CINT%(FX##(V_15e6!)), 1   '@58b4c
    V_101a! = 0.0   '@58b6e DS:46f0
    V_1002! = 0.0   '@58b7f DS:46f0
    V_1022! = 1.0   '@58b90 DS:4580
L_58ba6:
    IF NOT (V_1022! > V_15de!) THEN GOTO L_58fe7   '@58ba6
    COLOR 7   '@58bc1
    PRINT " NIVEL ";   '@58bd7 DS:5470
    IF NOT (V_101a! = 0.0) THEN GOTO L_58c3c   '@58be5 DS:46f0
    PRINT A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0));   '@58c00
    GOTO L_58c85   '@58c34
L_58c3c:
    PRINT A_11f6$(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!) - 1.0), 0));   '@58c3c DS:474e
L_58c85:
    PRINT " a "; A_11f6$(A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 0));   '@58c85 DS:547c
    COLOR RT_CINT%(FX##(V_0dc0!))   '@58ccd
    L_BP124% = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 6)   '@58cea
    IF NOT (L_BP124% = 1) THEN GOTO L_58e63   '@58d1c
    PRINT RT_TAB$(30); ""; "B ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 1); "cm"; RT_TAB$(45); ""; "H ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "cm";   '@58d2b DS:4516,5484,548c,5492
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 3) <> 0) THEN GOTO L_58e5b   '@58dd4
    PRINT RT_TAB$(60); ""; "ROT ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 3); "graus";   '@58e07 DS:4516,549a,54a4
L_58e5b:
    GOTO L_58fc2   '@58e5b
L_58e63:
    IF NOT (L_BP124% = 2) THEN GOTO L_58f59   '@58e63
    PRINT RT_TAB$(30); ""; "Diametro ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 1); "cm";   '@58e6d DS:4516,548c,54ae
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2) > 0) THEN GOTO L_58f51   '@58ec4
    PRINT RT_TAB$(50); ""; "Diametro interno ="; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "cm";   '@58efa DS:4516,548c,54bc
L_58f51:
    GOTO L_58fc2   '@58f51
L_58f59:
    IF NOT (L_BP124% = 3) THEN GOTO L_58fc2   '@58f59
    PRINT RT_TAB$(30); ""; "Poligonal com"; A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 2); "vertices";   '@58f63 DS:4516,52f2,5304
    GOTO L_58fc2   '@58fba
L_58fc2:
    PRINT RT_TAB$(80); ""; " "   '@58fc2 DS:4516,54d2
L_58fe7:
    IF NOT (FX##(V_1022!) - V_15de! >= FX##(V_15e2!) - V_15e6! + 1.0) THEN GOTO L_59019   '@58fe7 DS:4580
    GOTO L_595d8   '@59011
L_59019:
    V_1022! = FX##(V_1022!) + 1.0   '@59019 DS:4580
L_59034:
    COLOR 14   '@59039
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 0) > 0 AND A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 0) <= A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_101a!)), 0)) THEN GOTO L_59520   '@5904f
    IF NOT (V_1022! <= V_15de!) THEN GOTO L_59109   '@590e6
    GOTO L_59492   '@59101
L_59109:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 2) = A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 4)) THEN GOTO L_59230   '@59109
    PRINT " "; RT_TAB$(33); ""; A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 3) + A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 1); "#"; A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 2));   '@59167 DS:4516,4902,54d2
    GOTO L_5934b   '@59228
L_59230:
    PRINT " "; RT_TAB$(33); ""; A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 1); "#"; A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 2)); "+"; A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 3); "#"; A_0ecc!(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 4));   '@59230 DS:4516,4902,4910,54d2
L_5934b:
    COLOR 3   '@5934b
    PRINT RT_TAB$(55); ""; "(";   '@59361 DS:4516,54d8
    IF NOT (V_1002! = 0.0) THEN GOTO L_593d8   '@59381 DS:46f0
    PRINT A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0));   '@5939c
    GOTO L_59421   '@593d0
L_593d8:
    PRINT A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!) - 1.0), 0));   '@593d8 DS:474e
L_59421:
    PRINT " a "; A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 0)); ")"; RT_TAB$(80); ""; " "   '@59421 DS:4516,547c,54d2,54de
L_59492:
    IF NOT (FX##(V_1022!) - V_15de! >= FX##(V_15e2!) - V_15e6! + 1.0) THEN GOTO L_594c9   '@59497 DS:4580
    GOTO L_595d8   '@594c1
L_594c9:
    V_1022! = FX##(V_1022!) + 1.0   '@594c9 DS:4580
    V_1002! = FX##(V_1002!) + 1.0   '@594df DS:4580
    IF NOT (V_0e3c% >= V_1002!) THEN GOTO L_5951b   '@594f5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_59034   '@59513
L_5951b:
L_59520:
    V_101a! = FX##(V_101a!) + 1.0   '@59520 DS:4580
    L_BP128! = V_0e3e%   '@59536
    CALL MIXT_0877_Menor(L_BP128!, V_101a!, L_BP12c!)   '@5954a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP12e% = (V_0e3e% >= V_101a! AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP12c!)), 0) > 0)   '@5955e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT ((CSRLIN <= V_15e2! AND L_BP12e%) = 0) THEN GOTO L_58ba6   '@595b5
L_595d8:
    IF NOT (V_15de! > 0.0) THEN GOTO L_59659   '@595d8 DS:46f0
    COLOR 25   '@595f3
    LOCATE RT_CINT%(FX##(V_15e6!)), 78   '@59609
    PRINT "<"; CHR$(24); ">"   '@5962e DS:4f72,54e4
L_59659:
    IF NOT (V_0e3c% < V_1002!) THEN GOTO L_5968b   '@59659
    V_1002! = V_0e3c%   '@59677
L_5968b:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 0) > 0 AND A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1002!)), 0) < A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) THEN GOTO L_59782   '@5968b
    COLOR 25   '@5971c
    LOCATE RT_CINT%(FX##(V_15e2!)), 78   '@59732
    PRINT "<"; CHR$(25); ">"   '@59757 DS:4f72,54e4
L_59782:
    RT_VIEWPRINT 6, 25   '@59782
    RETURN   '@59794
L_597a3:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0) THEN GOTO L_597ef   '@597a8
    V_106e$ = ""   '@597d3 DS:4516
    RETURN   '@597e5
L_597ef:
    BEEP   '@597ef
    COLOR RT_CINT%(FX##(V_0dc0!))   '@597f9
    V_15de! = 0.0   '@59816 DS:46f0
    V_15e2! = 22.0   '@59827 DS:54ea
    V_15e6! = 10.0   '@59838 DS:48fe
    GOSUB L_58b47   '@59849
    COLOR 3   '@59856
    LOCATE 25, 1   '@5986c
    PRINT " Acione  * <Enter>  para manter a Armadura para alteracoes";   '@59887 DS:54ee
    COLOR 7   '@59895
    LOCATE 24, 1   '@598ab
    CALL MIXT_07f1_LimpaTeclado   '@598c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " Dimensiono a Coluna novamente  S/*N* ", V_106e$   '@598d0 DS:552c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP130% = (UCASE$(V_106e$) <> "S")   '@598ea DS:45f4
    IF NOT ((V_106e$ <> "*" AND L_BP130%) <> 0) THEN GOTO L_5993e   '@59916 DS:478c
    V_106e$ = "NAO"   '@5992c DS:4784
L_5993e:
    RT_VIEWPRINT 9, 25   '@5993e
    RT_CLS 2   '@59950
    RT_VIEWPRINT 8, 25   '@5995e
    RETURN   '@59970
L_5997f:   ' sub-rotina (alvo de GOSUB)
    L_BP134$ = V_0dcc$   '@59984
    IF NOT (L_BP134$ = "HER") THEN GOTO L_59a11   '@59997 DS:5556
    RT_SCREEN 3   '@599af
    V_0f94! = 7.0   '@599c5 DS:48fa
    V_0f98! = 7.0   '@599d6 DS:48fa
    V_0f9c! = 7.0   '@599e7 DS:48fa
    V_0fa0! = 7.0   '@599f8 DS:48fa
    GOTO L_59b0b   '@59a09
L_59a11:
    IF NOT (L_BP134$ <> "EGA") THEN GOTO L_59a37   '@59a11 DS:555e
    IF NOT (L_BP134$ = "VGA") THEN GOTO L_59aaf   '@59a24 DS:5566
L_59a37:
    RT_SCREEN 9   '@59a37
    COLOR , 1   '@59a4d
    V_0f94! = 11.0   '@59a63 DS:4ef4
    V_0f98! = 14.0   '@59a74 DS:556e
    V_0f9c! = 12.0   '@59a85 DS:531e
    V_0fa0! = 15.0   '@59a96 DS:5572
    GOTO L_59b0b   '@59aa7
L_59aaf:
    RT_SCREEN 2   '@59aaf
    V_0f94! = 15.0   '@59ac2 DS:5572
    V_0f98! = 15.0   '@59ad3 DS:5572
    V_0f9c! = 15.0   '@59ae4 DS:5572
    V_0fa0! = 15.0   '@59af5 DS:5572
L_59b0b:
    RT_WINDOW 1, (0), (0), (639), (199)   '@59b0b DS:46f0,46f2,5576,5578,557a,557c (B$WIND decodificado)
    RT_CLS -1   '@59b39
    PRINT A_1252$(RT_CINT%(FX##(V_0fe4!))); "   NIVEL ";   '@59b47 DS:557e
    IF NOT (V_0fec! = 0.0) THEN GOTO L_59bc9   '@59b72 DS:46f0
    PRINT A_11f6$(A_1224%(RT_CINT%(FX##(V_0fe4!)), 0));   '@59b8d
    GOTO L_59c12   '@59bc1
L_59bc9:
    PRINT A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!) - 1.0), 0));   '@59bc9 DS:474e
L_59c12:
    PRINT " a "; A_11f6$(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 0))   '@59c12 DS:547c
    LOCATE 1, 50   '@59c5a
    IF NOT (V_1086! = V_108a!) THEN GOTO L_59d10   '@59c72
    PRINT RT_SNG!(FX##(V_108e!) + V_1092!); "#"; A_0ecc!(RT_CINT%(FX##(V_1086!)))   '@59c8d DS:4902
    L_BPb2! = (FX##(V_108e!) + V_1092!) * A_0efa!(RT_CINT%(FX##(V_1086!)))   '@59cd7
    GOTO L_59e04   '@59d08
L_59d10:
    PRINT V_108e!; "#"; A_0ecc!(RT_CINT%(FX##(V_1086!)));   '@59d10 DS:4902
    IF NOT (V_1092! > 0.0) THEN GOTO L_59db0   '@59d4e DS:46f0
    PRINT " + "; V_1092!; "#"; A_0ecc!(RT_CINT%(FX##(V_108a!)))   '@59d69 DS:4902,558c
L_59db0:
    L_BPb2! = FX##(A_0efa!(RT_CINT%(FX##(V_1086!)))) * V_108e! + FX##(A_0efa!(RT_CINT%(FX##(V_108a!)))) * V_1092!   '@59db0
L_59e04:
    IF NOT (A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5) > 0) THEN GOTO L_59ef8   '@59e04
    LOCATE 2, 50   '@59e3a
    PRINT " #"; RT_SNG!(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 5)) / 10.0); "c/"; RT_SNG!(FX##(A_141e%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0fec!)), 6)) / 10.0)   '@59e58 DS:48fe,4d28,5594
L_59ef8:
    V_104a! = 0.0   '@59ef8 DS:46f0
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_5a141   '@59f09 DS:4580,51fa
    V_1006! = 0.0   '@59f47 DS:46f0
    V_100a! = 0.0   '@59f58 DS:46f0
    L_BP138! = A_10be!(0, 0)   '@59f69
    FOR V_1016! = 1.0 TO L_BP138!   '@59f8a DS:4580
    L_BP13c! = A_10be!(RT_CINT%(FX##(V_1016!)), 1)   '@59f92
    CALL MIXT_082a_Maior(V_100a!, L_BP13c!, L_BP140!)   '@59fbd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_1016!)), 1) = L_BP13c!   '@59fd1
    V_100a! = L_BP140!   '@59ff7
    L_BP144! = A_10be!(RT_CINT%(FX##(V_1016!)), 0)   '@5a002
    CALL MIXT_082a_Maior(V_1006!, L_BP144!, L_BP148!)   '@5a02c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_10be!(RT_CINT%(FX##(V_1016!)), 0) = L_BP144!   '@5a040
    V_1006! = L_BP148!   '@5a065
    V_104a! = (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) + A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) * (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) / 2.0 + V_104a!   '@5a070 DS:4580,4746
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@5a10d DS:4580
    GOTO L_5a1e9   '@5a139
L_5a141:
    V_100a! = A_10be!(1, 0)   '@5a141
    V_1006! = A_10be!(1, 0)   '@5a164
    V_104a! = (RT_POT##((FX##(A_10be!(1, 0))), (2.0)) - RT_POT##((FX##(A_10be!(1, 1))), (2.0))) * V_0e5a! / 4.0   '@5a187 DS:4746,4ce6
L_5a1e9:
    LOCATE 3, 50   '@5a1e9
    PRINT USING " As####.## cm2  Taxa##.##%"; RT_PU#(L_BPb2!, " As####.## cm2  Taxa##.##%", 1); RT_PU#(RT_SNG!(FX##(L_BPb2!) * 100.0 / V_104a!), " As####.## cm2  Taxa##.##%", 2)   '@5a207 DS:490c,559a
    V_1002! = 140.0 / FX##(V_100a!)   '@5a240 DS:55b8
    V_0f84! = 500.0 / FX##(V_1006!)   '@5a256 DS:55bc
    IF NOT (FX##(V_0f84!) / V_1002! > 2.3863999843597412109375##) THEN GOTO L_5a2aa   '@5a26c DS:55c0
    V_0f84! = V_1002! * 2.3863999843597412109375##   '@5a28c DS:55c0
    GOTO L_5a2c5   '@5a2a2
L_5a2aa:
    V_1002! = V_0f84! / 2.3863999843597412109375##   '@5a2aa DS:55c0
L_5a2c5:
    L_BP14c! = 320.0 - FX##(V_1006!) * V_0f84! / 2.0   '@5a2c5 DS:4746,55c4
    L_BP150! = FX##(V_100a!) * V_1002! / 2.0 + 100.0   '@5a2e8 DS:4746,490c
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_5a4a2   '@5a308 DS:4580,51fa
    L_BP154! = A_10be!(0, 0)   '@5a346
    FOR V_1016! = 1.0 TO L_BP154!   '@5a367 DS:4580
    RT_LINE RT_SNG!(FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) * V_0f84! + L_BP14c!), RT_SNG!(L_BP150! - FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) * V_1002!), RT_SNG!(FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) * V_0f84! + L_BP14c!), RT_SNG!(L_BP150! - FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) * V_1002!), 9, RT_CINT%(FX##(V_0f94!)), 0   '@5a36e DS:4580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@5a46e DS:4580
    GOTO L_5a56a   '@5a49a
L_5a4a2:
    RT_CIRCLE 320, 100, RT_SNG!(FX##(A_10be!(1, 0)) * V_0f84! / 2.0), 8, RT_CINT%(FX##(V_0f94!)), 0, 0, 0   '@5a4a2 DS:4746
    IF NOT (A_10be!(1, 1) > 0.0) THEN GOTO L_5a565   '@5a4ef DS:46f0
    RT_CIRCLE 320, 100, RT_SNG!(FX##(A_10be!(1, 1)) * V_0f84! / 2.0), 8, RT_CINT%(FX##(V_0f94!)), 0, 0, 0   '@5a51a DS:4746
L_5a565:
L_5a56a:
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_5a961   '@5a56a DS:4580,51fa
    V_1016! = 0.0   '@5a5a8 DS:46f0
L_5a5be:
    V_0fa4! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 0)   '@5a5be
    V_0fa8! = A_10be!(RT_CINT%(FX##(A_10be!(0, 0))), 1)   '@5a5f7
    L_BP158! = FX##(A_10be!(0, 0)) + 1.0   '@5a631 DS:4580
    FOR V_100e! = 1.0 TO L_BP158!   '@5a657 DS:4580
    L_BP15c! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@5a65e
    L_BP160! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@5a689
    L_BP164! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0)   '@5a6af DS:4580
    L_BP168! = A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1)   '@5a6d9 DS:4580
    L_BP16c! = FX##(V_0e8e!) - V_1016!   '@5a704
    CALL S_24f4a(V_0fa4!, V_0fa8!, L_BP15c!, L_BP160!, L_BP164!, L_BP168!, L_BP16c!)   '@5a714
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 1) = L_BP168!   '@5a73b DS:4580
    A_10be!(RT_CINT%(FX##(V_100e!) + 1.0), 0) = L_BP164!   '@5a766 DS:4580
    A_10be!(RT_CINT%(FX##(V_100e!)), 1) = L_BP160!   '@5a790
    A_10be!(RT_CINT%(FX##(V_100e!)), 0) = L_BP15c!   '@5a7b6
    IF NOT (V_100e! = 1.0) THEN GOTO L_5a84c   '@5a7da DS:4580
    RT_PSET RT_SNG!(FX##(V_1006!) * V_0f84! + L_BP14c!), RT_SNG!(L_BP150! - FX##(V_100a!) * V_1002!), 0, 0   '@5a7f5
    GOTO L_5a8a7   '@5a844
L_5a84c:
    RT_LINE 0, 0, RT_SNG!(FX##(V_1006!) * V_0f84! + L_BP14c!), RT_SNG!(L_BP150! - FX##(V_100a!) * V_1002!), 8, RT_CINT%(FX##(V_0f98!)), 0   '@5a84c
L_5a8a7:
    V_0fa4! = A_10be!(RT_CINT%(FX##(V_100e!)), 0)   '@5a8a7
    V_0fa8! = A_10be!(RT_CINT%(FX##(V_100e!)), 1)   '@5a8d1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@5a8fc DS:4580
    V_1016! = V_1016! + 0.62999999523162841796875##   '@5a928 DS:55c8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_1016! >= 1.0) THEN GOTO L_5a5be   '@5a93e DS:4580
    GOTO L_5aab7   '@5a959
L_5a961:
    RT_CIRCLE 320, 100, RT_SNG!((FX##(A_10be!(1, 0)) / 2.0 - V_0e8e!) * V_0f84!), 8, RT_CINT%(FX##(V_0f98!)), 0, 0, 0   '@5a961 DS:4746
    RT_CIRCLE 320, 100, RT_SNG!((FX##(A_10be!(1, 0)) / 2.0 - V_0e8e! + 0.62999999523162841796875##) * V_0f84!), 8, RT_CINT%(FX##(V_0f98!)), 0, 0, 0   '@5a9b3 DS:4746,55c8
    IF NOT (V_0fc0! > 0.0) THEN GOTO L_5aab2   '@5aa0a DS:46f0
    RT_CIRCLE 320, 100, RT_SNG!((FX##(V_0fc0!) / 2.0 + V_0e8e!) * V_0f84!), 8, RT_CINT%(FX##(V_0f98!)), 0, 0, 0   '@5aa25 DS:4746
    RT_CIRCLE 320, 100, RT_SNG!((FX##(V_0fc0!) / 2.0 + (V_0e8e! - 0.62999999523162841796875##)) * V_0f84!), 8, RT_CINT%(FX##(V_0f98!)), 0, 0, 0   '@5aa65 DS:4746,55cc
L_5aab2:
L_5aab7:
    L_BP170! = A_10ec!(0, 0)   '@5aab7
    FOR V_1016! = 1.0 TO L_BP170!   '@5aad8 DS:4580
    V_1006! = FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 0)) * V_0f84! + L_BP14c!   '@5aae0
    V_100a! = L_BP150! - FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 1)) * V_1002!   '@5ab14
    RT_CIRCLE V_1006!, V_100a!, RT_SNG!(FX##(A_0ecc!(RT_CINT%(FX##(A_10ec!(RT_CINT%(FX##(V_1016!)), 2))))) * V_0f84! / 20.0), 8, RT_CINT%(FX##(V_0f9c!)), 0, 0, 0   '@5ab4c DS:53fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@5abbc DS:4580
    IF NOT (V_102e! = 3.0 OR V_102e! = 1.0) THEN GOTO L_5b4b4   '@5abe8 DS:4580,51fa
    L_BP174! = A_10be!(0, 0)   '@5ac26
    FOR V_1016! = 1.0 TO L_BP174!   '@5ac47 DS:4580
    V_106e$ = LTRIM$(STR$(RT_SNG!(INT(RT_SQR##(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) + RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0))) * 10.0 + 0.00999999977648258209228515625##) / 10.0)))   '@5ac4e DS:4580,4746,48fe,55d0
    V_1006! = FX##(L_BP14c!) + 4.0 + (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) + A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) * V_0f84! / 2.0   '@5ad2a DS:4580,4746,4ce6
    IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1) AND A_10be!(RT_CINT%(FX##(V_1016!)), 0) <= A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) THEN GOTO L_5ae6b   '@5ad8e DS:4580
    V_1006! = FX##(V_1006!) - LEN(V_106e$) * 8 - 8.0   '@5ae3e DS:55d4
L_5ae6b:
    IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1) AND A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) THEN GOTO L_5af48   '@5ae6b DS:4580
    V_1006! = FX##(V_1006!) - LEN(V_106e$) * 8 - 8.0   '@5af1b DS:55d4
L_5af48:
    V_100a! = L_BP150! - (FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) + A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) * V_1002! / 2.0   '@5af48 DS:4580,4746
    IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0) AND A_10be!(RT_CINT%(FX##(V_1016!)), 1) >= A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) THEN GOTO L_5b06f   '@5afa9 DS:4580
    V_100a! = FX##(V_100a!) + 10.0   '@5b059 DS:48fe
L_5b06f:
    IF NOT (A_10be!(RT_CINT%(FX##(V_1016!)), 0) > A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0) AND A_10be!(RT_CINT%(FX##(V_1016!)), 1) < A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) THEN GOTO L_5b135   '@5b06f DS:4580
    V_100a! = FX##(V_100a!) + 10.0   '@5b11f DS:48fe
L_5b135:
    IF NOT (V_102e! = 3.0 AND V_1016! > 1.0) THEN GOTO L_5b443   '@5b135 DS:4580,51fa
    IF NOT (ABS(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) - 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) + (RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) - 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!)), 1)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!)), 0)), (2.0)))) < 0.100000001490116119384765625##) THEN GOTO L_5b43e   '@5b173 DS:4580,4746,474e,55d8
    IF NOT (ABS(RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 1)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)), (2.0)) + (RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!)), 0)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 2.0), 1)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 1)), (2.0)) - RT_POT##((FX##(A_10be!(RT_CINT%(FX##(V_1016!) + 2.0), 0)) - A_10be!(RT_CINT%(FX##(V_1016!) + 1.0), 0)), (2.0)))) < 0.100000001490116119384765625##) THEN GOTO L_5b439   '@5b2cd DS:4580,4746,55d8
    GOTO L_5b47b   '@5b431
L_5b439:
L_5b43e:
L_5b443:
    L_BP178$ = "CGA"   '@5b443 DS:55dc
    CALL MIXT_08c4_TextoGrafico(V_1006!, V_100a!, V_106e$, L_BP178$)   '@5b456
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b46c libera strings locais (L_BP178)
L_5b47b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1016!   '@5b480 DS:4580
    GOTO L_5b7e7   '@5b4ac
L_5b4b4:
    L_BP17c! = 312.0 - FX##(A_10be!(1, 0)) * V_0f84! / 2.0   '@5b4b4 DS:4746,55e4
    L_BP180! = 104.0   '@5b4ea DS:55e8
    L_BP184$ = CHR$(26)   '@5b4f5
    L_BP188$ = "CGA"   '@5b509 DS:55dc
    CALL MIXT_08c4_TextoGrafico(L_BP17c!, L_BP180!, L_BP184$, L_BP188$)   '@5b517
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b530 libera strings locais (L_BP184)
    ' @5b53a libera strings locais (L_BP188)
    L_BP18c! = FX##(A_10be!(1, 0)) * V_0f84! / 2.0 + 320.0   '@5b544 DS:4746,55c4
    L_BP190! = 104.0   '@5b577 DS:55e8
    L_BP194$ = CHR$(27) + STR$(A_10be!(1, 0))   '@5b582
    L_BP198$ = "CGA"   '@5b5bc DS:55dc
    CALL MIXT_08c4_TextoGrafico(L_BP18c!, L_BP190!, L_BP194$, L_BP198$)   '@5b5ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b5e3 libera strings locais (L_BP194)
    ' @5b5ed libera strings locais (L_BP198)
    IF NOT (A_10be!(1, 1) > 0.0) THEN GOTO L_5b7e2   '@5b5f7 DS:46f0
    L_BP19c! = 316.0   '@5b622 DS:55ec
    L_BP1a0! = 108.0 - FX##(A_10be!(1, 1)) * V_1002! / 2.0   '@5b634 DS:4746,55f0
    L_BP1a4$ = CHR$(24)   '@5b661
    L_BP1a8$ = "CGA"   '@5b675 DS:55dc
    CALL MIXT_08c4_TextoGrafico(L_BP19c!, L_BP1a0!, L_BP1a4$, L_BP1a8$)   '@5b683
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b69c libera strings locais (L_BP1a4)
    ' @5b6a6 libera strings locais (L_BP1a8)
    L_BP1ac! = 306.0   '@5b6b0 DS:55f4
    L_BP1b0! = 118.0 - FX##(A_10be!(1, 1)) * V_1002! / 2.0   '@5b6c2 DS:4746,55f8
    L_BP1b4$ = STR$(A_10be!(1, 1))   '@5b6ef
    L_BP1b8$ = "CGA"   '@5b717 DS:55dc
    CALL MIXT_08c4_TextoGrafico(L_BP1ac!, L_BP1b0!, L_BP1b4$, L_BP1b8$)   '@5b725
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b73e libera strings locais (L_BP1b4)
    ' @5b748 libera strings locais (L_BP1b8)
    L_BP1bc! = 316.0   '@5b752 DS:55ec
    L_BP1c0! = FX##(A_10be!(1, 1)) * V_1002! / 2.0 + 100.0   '@5b763 DS:4746,490c
    L_BP1c4$ = CHR$(25)   '@5b78e
    L_BP1c8$ = "CGA"   '@5b7a2 DS:55dc
    CALL MIXT_08c4_TextoGrafico(L_BP1bc!, L_BP1c0!, L_BP1c4$, L_BP1c8$)   '@5b7b0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @5b7c9 libera strings locais (L_BP1c4)
    ' @5b7d3 libera strings locais (L_BP1c8)
L_5b7e2:
L_5b7e7:
    IF NOT (V_0fe0! = 1.0) THEN GOTO L_5b837   '@5b7e7 DS:4580
    RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@5b802
    RT_ROTINA_0AEA   '@5b815 (rotina em assembly ligada ao EXE (SUB_80aea); gerada no fim do programa)
    RT_LPTABRE: RT_LPS V_0e04$: RT_LPFIM   '@5b81f
L_5b837:
    RETURN   '@5b837
L_5b846:   ' entrada vinda de 050187_FUN_5000_0187
    ' @5b846 libera strings locais (L_BP134)
    ' @5b850 libera strings locais (L_BP76)
    ' @5b859 libera strings locais (L_BP72)
    ' @5b862 libera strings locais (L_BP0e)
    ' @5b86b libera strings locais (L_BP64)
    ' @5b874 libera strings locais (L_BP12)
    ' END SUB   '@5b87d
END SUB

SUB S_60164   ' entrada de SUB/FUNCTION (B$ENRA, locais 108 bytes) (0x60164)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a$
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2c%
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3a%
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
    DIM L_BP70%
    DIM L_BP72%
    DIM L_BP76!
    ' ---- FUN_6000_0164 @0x60164  (060164_FUN_6000_0164.lift.txt; evidence_id (assembly): ev_556573beb6d1032604f9da7f77af253643a7fd1d61e4dfea1c5d283e8dc3679f)
    V_0f88! = 0.0   '@60176 DS:5600
    V_10b6! = 0.0   '@60187 DS:5600
    REDIM A_165a!(-32768 TO -32768, -32768 TO -32768)   '@60198
    REDIM A_165a!(0 TO CINT(A_11c8!(0)), 0 TO 3)   '@601a6
    V_10ae! = 0.0   '@601dd DS:5600
    V_10b2! = 0.0   '@601ee DS:5600
    V_0ff8% = -1   '@601ff
    L_BP26! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@6020a
    FOR L_BP2a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO L_BP26! STEP -1.0   '@60238 DS:5626
    IF NOT (L_BP2a! >= V_0ff0!) THEN GOTO L_602b1   '@6025e
    V_0f88! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), 0)) + V_0f88!   '@60278
L_602b1:
    V_10ae! = 0.0   '@602b1 DS:5600
    V_10b2! = 0.0   '@602c2 DS:5600
    V_162a! = 0.0   '@602d3 DS:5600
    V_162e! = 0.0   '@602e4 DS:5600
    V_1632! = 0.0   '@602f5 DS:5600
    V_1636! = 0.0   '@60306 DS:5600
    L_BP2c% = (A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) > 0)   '@60317
    IF NOT ((V_1076$ = "PREDIMENSIONAMENTO" OR L_BP2c%) <> 0) THEN GOTO L_61a7f   '@60350 DS:5604
    V_164a! = 0.0   '@60365 DS:5600
    V_164e! = 0.0   '@60376 DS:5600
    V_1652! = 0.0   '@60387 DS:5600
    V_1656! = 0.0   '@60398 DS:5600
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)))) / 10.0) * 10.0 + 1.0   '@603a9 DS:561a,561e
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)))) / 10.0) / 10.0 + 1.0   '@60420 DS:561a,561e
    V_161a! = FX##(L_BP2a!) + 1.0   '@6046b DS:561e
L_60485:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) < V_161a!) THEN GOTO L_604f2   '@6048a
    V_161a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@604c3
L_604f2:
    V_160a! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161a!)))) / 10.0) * 10.0 + 1.0   '@604f2 DS:561a,561e
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > V_161a!) THEN GOTO L_605e2   '@6056b
    IF NOT (V_160a! = 2.0) THEN GOTO L_605dd   '@605a4 DS:5622
    V_161a! = FX##(V_161a!) + 1.0   '@605bf DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_60485   '@605d5
L_605dd:
L_605e2:
    V_161e! = FX##(L_BP2a!) + 1.0   '@605e2 DS:561e
L_605fc:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) < V_161e!) THEN GOTO L_60669   '@60601
    V_161e! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@6063a
L_60669:
    V_160e! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161e!)))) / 10.0) / 10.0 + 1.0   '@60669 DS:561a,561e
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > V_161e!) THEN GOTO L_6072c   '@606b5
    IF NOT (V_160e! = 2.0) THEN GOTO L_60727   '@606ee DS:5622
    V_161e! = FX##(V_161e!) + 1.0   '@60709 DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_605fc   '@6071f
L_60727:
L_6072c:
    V_1622! = FX##(L_BP2a!) - 1.0   '@6072c DS:5626
L_60746:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) > V_1622!) THEN GOTO L_607b1   '@6074b
    V_1622! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@60783
L_607b1:
    V_1612! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1622!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1622!)))) / 10.0) * 10.0 + 1.0   '@607b1 DS:561a,561e
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) < V_1622!) THEN GOTO L_608a0   '@6082a
    IF NOT (V_1612! = 2.0) THEN GOTO L_6089b   '@60862 DS:5622
    V_1622! = FX##(V_1622!) - 1.0   '@6087d DS:5626
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_60746   '@60893
L_6089b:
L_608a0:
    V_1626! = FX##(L_BP2a!) - 1.0   '@608a0 DS:5626
L_608ba:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) > V_1626!) THEN GOTO L_60925   '@608bf
    V_1626! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@608f7
L_60925:
    V_1616! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_1626!)))) / 10.0) / 10.0 + 1.0   '@60925 DS:561a,561e
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) < V_1626!) THEN GOTO L_609e7   '@60971
    IF NOT (V_1616! = 2.0) THEN GOTO L_609e2   '@609a9 DS:5622
    V_1626! = FX##(V_1626!) - 1.0   '@609c4 DS:5626
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_608ba   '@609da
L_609e2:
L_609e7:
    IF NOT (L_BP2a! = V_0ff0!) THEN GOTO L_60a8c   '@609e7
    A_165a!(0, 0) = V_161a!   '@60a01
    A_165a!(0, 2) = V_1622!   '@60a21
    A_165a!(0, 1) = V_161e!   '@60a41
    A_165a!(0, 3) = V_1626!   '@60a64
L_60a8c:
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > L_BP2a! AND (V_1606! = 2.0 AND V_1602! = 2.0)) THEN GOTO L_60b0e   '@60a8c DS:5622
    GOTO L_61a84   '@60b06
L_60b0e:
    IF NOT (V_1076$ = "PREDIMENSIONAMENTO") THEN GOTO L_60b2d   '@60b0e DS:5604
    GOTO L_60e56   '@60b25
L_60b2d:
    L_BP30! = 0.0   '@60b2d DS:5600
L_60b42:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 0) < A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 0) <= L_BP2a!) THEN GOTO L_60c03   '@60b47
    L_BP30! = FX##(L_BP30!) + 1.0   '@60be7 DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_60b42   '@60bfb
L_60c03:
    IF NOT (V_0ff8% <> L_BP30!) THEN GOTO L_60e85   '@60c03
    L_BP1a$ = "*"   '@60c20 DS:562a
    GOSUB L_62f18   '@60c32
    L_BP1a$ = ""   '@60c3f DS:5630
    IF NOT (V_0ff8% <> -1 AND V_0e3e% > L_BP30!) THEN GOTO L_60e40   '@60c51
    A_165a!(RT_CINT%(FX##(V_161a!)), 1) = A_165a!(RT_CINT%(FX##(V_161a!)), 1) - (FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), 0) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!) + 1.0), 0)) * A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!) + 1.0), 4) / 10000.0   '@60c83 DS:561e,5634
    A_165a!(RT_CINT%(FX##(V_161e!)), 3) = A_165a!(RT_CINT%(FX##(V_161e!)), 3) - (FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), 0) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!) + 1.0), 0)) * A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!) + 1.0), 5) / 10000.0   '@60d5f DS:561e,5634
L_60e40:
    V_0ff8% = RT_CINT%(FX##(L_BP30!))   '@60e40
L_60e56:
    CALL S_21dfd   '@60e5b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1036! = 270.0   '@60e65 DS:5638
    CALL S_2267a   '@60e76
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_60e85:
    FOR V_101e! = 1.0 TO 13.0 STEP 4.0   '@60e85 DS:561e,5650,5654
    IF NOT (A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!))) = 0.0) THEN GOTO L_60ee0   '@60e92 DS:5600
    GOTO L_61897   '@60ed8
L_60ee0:
    V_1036! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0))) - 90.0   '@60ee0 DS:561e,563c
    IF NOT (V_1036! < 0.0) THEN GOTO L_60f57   '@60f26 DS:5600
    V_1036! = 360.0 + FX##(V_1036!)   '@60f41 DS:5640
L_60f57:
    L_BP30! = V_11ae%   '@60f57
    V_11ae% = 1   '@60f6a
    CALL S_2267a   '@60f75
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_11ae% = RT_CINT%(FX##(L_BP30!))   '@60f7f
    L_BP0e! = V_161a!   '@60f90
    IF NOT (V_161a! <> V_161e!) THEN GOTO L_61080   '@60fa0
    L_BP0e! = V_161e!   '@60fbb
    IF NOT (A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 180.0 OR A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 0.0) THEN GOTO L_6107b   '@60fcb DS:5600,561e,5644
    L_BP0e! = V_161a!   '@6106b
L_6107b:
L_61080:
    L_BP34! = 0.0   '@61080 DS:5600
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > L_BP2a!) THEN GOTO L_61119   '@61090
    L_BP34! = V_0fd8! / ((FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(L_BP2a!)))) * V_0de4!)   '@610c8
L_61119:
    IF NOT ((A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 180.0 OR A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 0.0) AND V_160a! = 2.0) THEN GOTO L_611e6   '@61119 DS:5600,561e,5622,5644
    L_BP34! = 0.0   '@611d6 DS:5600
L_611e6:
    IF NOT ((A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 270.0 OR A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 90.0) AND V_160e! = 2.0) THEN GOTO L_612b3   '@611e6 DS:561e,5622,5638,5648
    L_BP34! = 0.0   '@612a3 DS:5600
L_612b3:
    L_BP12! = V_1622!   '@612b3
    IF NOT (V_1622! <> V_1626!) THEN GOTO L_613a3   '@612c3
    L_BP12! = V_1626!   '@612de
    IF NOT (A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 180.0 OR A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0)) = 0.0) THEN GOTO L_6139e   '@612ee DS:5600,561e,5644
    L_BP12! = V_1622!   '@6138e
L_6139e:
L_613a3:
    L_BP38! = 0.0   '@613a3 DS:5600
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 0) < L_BP2a!) THEN GOTO L_6158a   '@613b3
    L_BP3a% = (A_1338%(RT_CINT%(FX##(V_0fe4!)), (V_0ff8% - 1) * -(V_0ff8% > 0), 0) < L_BP2a! OR V_0ff8% = 0)   '@613ea
    IF NOT ((V_1076$ = "PREDIMENSIONAMENTO" OR L_BP3a%) <> 0) THEN GOTO L_614bf   '@61456 DS:5604
    L_BP38! = V_0fd8! / ((FX##(A_11c8!(RT_CINT%(FX##(L_BP2a!)))) - A_11c8!(RT_CINT%(FX##(L_BP12!)))) * V_0de4!)   '@6146b
    GOTO L_61585   '@614b7
L_614bf:
    V_0ff8% = V_0ff8% - 1   '@614bf
    L_BP30! = V_0ff8%   '@614c8
    GOSUB L_62f18   '@614db
    CALL S_21dfd   '@614e8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP30! = V_11ae%   '@614f2
    V_11ae% = 1   '@61505
    CALL S_2267a   '@61510
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_11ae% = RT_CINT%(FX##(L_BP30!))   '@6151a
    V_0ff8% = V_0ff8% + 1   '@6152b
    L_BP38! = V_0fd8! / ((FX##(A_11c8!(RT_CINT%(FX##(L_BP2a!)))) - A_11c8!(RT_CINT%(FX##(L_BP12!)))) * V_0de4!)   '@61534
L_61585:
L_6158a:
    L_BP3e! = 0.0   '@6158a DS:5600
    IF NOT (A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 2.0)) > 0.0) THEN GOTO L_6165a   '@6159a DS:5600,5622
    L_BP3e! = FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 3.0))) / A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 2.0))   '@615e5 DS:5622,564c
L_6165a:
    V_163a! = A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!))) / (FX##(L_BP34!) + L_BP38! + L_BP3e!) * L_BP34!   '@6165a
    V_163e! = -A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!))) / (FX##(L_BP34!) + L_BP38! + L_BP3e!) * L_BP38!   '@616a9
    V_164a! = RT_COS##(FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0))) * V_0e5a! / 180.0) * V_163a! + V_164a!   '@616fb DS:561e,5644
    V_164e! = RT_SIN##(FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0))) * V_0e5a! / 180.0) * V_163a! + V_164e!   '@61757 DS:561e,5644
    V_1652! = RT_COS##(FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0))) * V_0e5a! / 180.0) * V_163e! + V_1652!   '@617b3 DS:561e,5644
    V_1656! = RT_SIN##(FX##(A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_101e!) + 1.0))) * V_0e5a! / 180.0) * V_163e! + V_1656!   '@6180f DS:561e,5644
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101e!   '@6186b DS:5650,5654
L_61897:
    A_165a!(RT_CINT%(FX##(L_BP2a!)), 0) = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 0)) + V_164a!   '@61897
    A_165a!(RT_CINT%(FX##(L_BP2a!)), 1) = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 1)) + V_1652!   '@618dd
    A_165a!(RT_CINT%(FX##(L_BP2a!)), 2) = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 2)) + V_164e!   '@61925
    A_165a!(RT_CINT%(FX##(L_BP2a!)), 3) = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 3)) + V_1656!   '@61967
    IF NOT (L_BP2a! >= V_0ff0! AND V_0ea8$ = "S") THEN GOTO L_61a7a   '@619af DS:5658
    CALL MIXT_0877_Menor(V_161a!, V_161e!, L_BP42!)   '@619e8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e! = L_BP42!   '@619ff
    V_10b6! = (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(L_BP2a!)))) / (RT_POT##((FX##(100.0)), (2.0)) * V_0de8!) * V_0de4! * V_104a! * V_0eac! + V_10b6!   '@61a08 DS:5622,565e
L_61a7a:
L_61a7f:
L_61a84:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2a!   '@61a89 DS:5626
    IF NOT (V_1076$ <> "PREDIMENSIONAMENTO") THEN GOTO L_61c05   '@61ab1 DS:5604
    L_BP30! = 0.0   '@61ac8 DS:5600
L_61add:
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 0) < A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) AND A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 0) <= V_0ff0!) THEN GOTO L_61b9f   '@61ae2
    L_BP30! = FX##(L_BP30!) + 1.0   '@61b83 DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_61add   '@61b97
L_61b9f:
    V_0ff8% = RT_CINT%(FX##(L_BP30!))   '@61b9f
    GOSUB L_62f18   '@61bb0
    CALL S_21dfd   '@61bbd
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP30! = V_11ae%   '@61bc7
    V_11ae% = 1   '@61bda
    CALL S_2267a   '@61be5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_11ae% = RT_CINT%(FX##(L_BP30!))   '@61bef
L_61c05:
    V_1642! = 0.0   '@61c05 DS:5600
    L_BP46! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@61c16
    FOR L_BP2a! = FX##(V_0ff0!) + 1.0 TO L_BP46!   '@61c45 DS:561e
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)))) / 10.0) * 10.0 + 1.0   '@61c52 DS:561a,561e
    V_1642! = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 1)) + V_1642!   '@61cc9
    IF NOT (V_1602! <> 2.0) THEN GOTO L_61d1b   '@61cf8 DS:5622
    GOTO L_61d43   '@61d13
L_61d1b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2a!   '@61d1b DS:561e
L_61d43:
    V_1646! = 0.0   '@61d43 DS:5600
    L_BP4a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)   '@61d54
    FOR L_BP2a! = FX##(V_0ff0!) + 1.0 TO L_BP4a!   '@61d83 DS:561e
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP2a!)))) / 10.0) / 10.0 + 1.0   '@61d90 DS:561a,561e
    V_1646! = FX##(A_165a!(RT_CINT%(FX##(L_BP2a!)), 3)) + V_1646!   '@61ddb
    IF NOT (V_1606! <> 2.0) THEN GOTO L_61e2d   '@61e0a DS:5622
    GOTO L_61e55   '@61e25
L_61e2d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2a!   '@61e2d DS:561e
L_61e55:
    V_161a! = A_165a!(0, 0)   '@61e55
    V_161e! = A_165a!(0, 1)   '@61e75
    V_1622! = A_165a!(0, 2)   '@61e98
    V_1626! = A_165a!(0, 3)   '@61eb8
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)))) / 10.0) * 10.0 + 1.0   '@61edb DS:561a,561e
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)))) / 10.0) / 10.0 + 1.0   '@61f54 DS:561a,561e
    V_160a! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161a!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161a!)))) / 10.0) * 10.0 + 1.0   '@61fa0 DS:561a,561e
    V_160e! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_161e!)))) / 10.0) / 10.0 + 1.0   '@62019 DS:561a,561e
    IF NOT (V_1602! <> 2.0) THEN GOTO L_620b2   '@62065 DS:5622
    V_164a! = A_165a!(RT_CINT%(FX##(V_0ff0!)), 0)   '@62080
    GOTO L_620dc   '@620aa
L_620b2:
    V_164a! = A_165a!(RT_CINT%(FX##(V_1622!)), 0)   '@620b2
L_620dc:
    IF NOT (V_1606! <> 2.0) THEN GOTO L_62127   '@620dc DS:5622
    V_164e! = A_165a!(RT_CINT%(FX##(V_0ff0!)), 2)   '@620f7
    GOTO L_6214f   '@6211f
L_62127:
    V_164e! = A_165a!(RT_CINT%(FX##(V_1626!)), 2)   '@62127
L_6214f:
    V_1632! = (-(V_160a! = 2.0) + FX##(V_160a! <> 2.0) / 2.0) * V_1642! + V_164a!   '@6214f DS:5622
    V_162a! = FX##(V_160a! <> 2.0) * V_164a! / 2.0 + V_1642!   '@621a7 DS:5622
    V_1636! = (-(V_160e! = 2.0) + FX##(V_160e! <> 2.0) / 2.0) * V_1646! + V_164e!   '@621de DS:5622
    V_162e! = FX##(V_160e! <> 2.0) * V_164e! / 2.0 + V_1646!   '@62236 DS:5622
    IF NOT (V_160a! <> 2.0 AND V_1602! = 2.0) THEN GOTO L_6233d   '@6226d DS:5622
    V_1632! = (FX##(V_162a!) - V_1632!) * (FX##(A_11c8!(RT_CINT%(FX##(V_0ff0!)))) - A_11c8!(RT_CINT%(FX##(V_1622!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161a!)))) - A_11c8!(RT_CINT%(FX##(V_1622!)))) + V_1632!   '@622ab
L_6233d:
    IF NOT (V_160e! <> 2.0 AND V_1606! = 2.0) THEN GOTO L_6240d   '@6233d DS:5622
    V_1636! = (FX##(V_162e!) - V_1636!) * (FX##(A_11c8!(RT_CINT%(FX##(V_0ff0!)))) - A_11c8!(RT_CINT%(FX##(V_1626!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161e!)))) - A_11c8!(RT_CINT%(FX##(V_1626!)))) + V_1636!   '@6237b
L_6240d:
    L_BP1e! = V_162a!   '@6240d
    L_BP22! = V_162e!   '@6241d
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) > V_0ff0!) THEN GOTO L_6274f   '@6242d
    CALL MIXT_0877_Menor(V_161a!, V_161e!, L_BP4e!)   '@62466
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP16! = L_BP4e!   '@6247d
    IF NOT (V_161a! > L_BP16!) THEN GOTO L_625e8   '@62486
    IF NOT (V_1602! = 2.0) THEN GOTO L_62552   '@624a0 DS:5622
    V_162a! = V_162a! - (FX##(V_162a!) - V_1632!) * (FX##(A_11c8!(RT_CINT%(FX##(V_161a!)))) - A_11c8!(RT_CINT%(FX##(L_BP16!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161a!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!))))   '@624bb
    GOTO L_625e3   '@6254a
L_62552:
    V_162a! = (FX##(V_162a!) - V_1632!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP16!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161a!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!)))) + V_1632!   '@62552
L_625e3:
L_625e8:
    IF NOT (V_161e! > L_BP16!) THEN GOTO L_6274a   '@625e8
    IF NOT (V_1606! = 2.0) THEN GOTO L_626b4   '@62602 DS:5622
    V_162e! = V_162e! - (FX##(V_162e!) - V_1636!) * (FX##(A_11c8!(RT_CINT%(FX##(V_161e!)))) - A_11c8!(RT_CINT%(FX##(L_BP16!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161e!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!))))   '@6261d
    GOTO L_62745   '@626ac
L_626b4:
    V_162e! = (FX##(V_162e!) - V_1636!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP16!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!)))) / (FX##(A_11c8!(RT_CINT%(FX##(V_161e!)))) - A_11c8!(RT_CINT%(FX##(V_0ff0!)))) + V_1636!   '@626b4
L_62745:
L_6274a:
L_6274f:
    V_0f90! = 0.0   '@6274f DS:5600
    IF NOT (A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 3) <> 0.0 OR (A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 1) <> 0.0 OR A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 0) <> 0.0)) THEN GOTO L_62a8e   '@62760 DS:5600
    V_0f90! = A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 0)   '@62828
    V_10ae! = RT_COS##(FX##(A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 2)) * V_0e5a! / 180.0) * A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 1) + RT_COS##(FX##(A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 4)) * V_0e5a! / 180.0) * A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 3)   '@6285d DS:5644
    V_10b2! = RT_SIN##(FX##(A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 2)) * V_0e5a! / 180.0) * A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 1) + RT_SIN##(FX##(A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 4)) * V_0e5a! / 180.0) * A_12dc!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 3)   '@62933 DS:5644
    V_1632! = FX##(V_1632!) + V_10ae!   '@62a09
    V_1636! = FX##(V_1636!) + V_10b2!   '@62a1f
    V_162a! = FX##(V_162a!) + V_10ae!   '@62a35
    V_162e! = FX##(V_162e!) + V_10b2!   '@62a4b
    L_BP1e! = FX##(L_BP1e!) + V_10ae!   '@62a61
    L_BP22! = FX##(L_BP22!) + V_10b2!   '@62a75
L_62a8e:
    IF NOT (V_11c6% = 0) THEN GOTO L_62c11   '@62a8e
    V_10ae! = V_162a!   '@62a9d
    V_10b2! = V_162e!   '@62aae
    IF NOT (RT_POT##((FX##(V_10ae!)), (2.0)) + RT_POT##((FX##(V_10b2!)), (2.0)) < RT_POT##((FX##(V_1632!)), (2.0)) + RT_POT##((FX##(V_1636!)), (2.0))) THEN GOTO L_62b41   '@62abf DS:5622
    V_10ae! = V_1632!   '@62b1a
    V_10b2! = V_1636!   '@62b2b
L_62b41:
    CALL MIXT_082a_Maior(V_162a!, V_1632!, L_BP52!)   '@62b41
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_15ee!, L_BP52!, L_BP56!)   '@62b57
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_15ee! = L_BP56!   '@62b69
    CALL MIXT_0877_Menor(V_162a!, V_1632!, L_BP5a!)   '@62b73
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_15f2!, L_BP5a!, L_BP5e!)   '@62b89
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_15f2! = L_BP5e!   '@62b9b
    CALL MIXT_082a_Maior(V_162e!, V_1636!, L_BP62!)   '@62ba5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_15f6!, L_BP62!, L_BP66!)   '@62bbb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_15f6! = L_BP66!   '@62bcd
    CALL MIXT_0877_Menor(V_162e!, V_1636!, L_BP6a!)   '@62bd7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_15fa!, L_BP6a!, L_BP6e!)   '@62bed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_15fa! = L_BP6e!   '@62bff
    GOTO L_62df1   '@62c09
L_62c11:
    IF NOT (RT_POT##((FX##(L_BP1e!)), (2.0)) + RT_POT##((FX##(L_BP22!)), (2.0)) > RT_POT##((FX##(V_1632!)), (2.0)) + RT_POT##((FX##(V_1636!)), (2.0))) THEN GOTO L_62d2a   '@62c11 DS:5622
    V_10ae! = L_BP1e! * 0.60000002384185791015625## + 0.4000000059604644775390625## * V_1632!   '@62c6a DS:5662,5666
    IF NOT (ABS(FX##(V_10ae!)) < ABS(L_BP1e! * 0.4000000059604644775390625##)) THEN GOTO L_62cc6   '@62c8c DS:5666
    V_10ae! = L_BP1e! * 0.4000000059604644775390625##   '@62cb1 DS:5666
L_62cc6:
    V_10b2! = L_BP22! * 0.60000002384185791015625## + 0.4000000059604644775390625## * V_1636!   '@62cc6 DS:5662,5666
    IF NOT (ABS(FX##(V_10b2!)) < ABS(L_BP22! * 0.4000000059604644775390625##)) THEN GOTO L_62d22   '@62ce8 DS:5666
    V_10b2! = L_BP22! * 0.4000000059604644775390625##   '@62d0d DS:5666
L_62d22:
    GOTO L_62dec   '@62d22
L_62d2a:
    V_10ae! = 0.60000002384185791015625## * V_1632! + 0.4000000059604644775390625## * V_162a!   '@62d2a DS:5662,5666
    IF NOT (ABS(FX##(V_10ae!)) < ABS(0.4000000059604644775390625## * V_1632!)) THEN GOTO L_62d89   '@62d4d DS:5666
    V_10ae! = 0.4000000059604644775390625## * V_1632!   '@62d73 DS:5666
L_62d89:
    V_10b2! = 0.60000002384185791015625## * V_1636! + L_BP22! * 0.4000000059604644775390625##   '@62d89 DS:5662,5666
    IF NOT (ABS(FX##(V_10b2!)) < ABS(0.4000000059604644775390625## * V_1636!)) THEN GOTO L_62de7   '@62dab DS:5666
    V_10b2! = 0.4000000059604644775390625## * V_1636!   '@62dd1 DS:5666
L_62de7:
L_62dec:
L_62df1:
    IF NOT (ABS(FX##(V_10ae!)) < 0.00999999977648258209228515625##) THEN GOTO L_62e20   '@62df1 DS:566a
    V_10ae! = 0.0   '@62e0f DS:5600
L_62e20:
    IF NOT (ABS(FX##(V_10b2!)) < 0.00999999977648258209228515625##) THEN GOTO L_62e4f   '@62e20 DS:566a
    V_10b2! = 0.0   '@62e3e DS:5600
L_62e4f:
    IF NOT (ABS(FX##(V_162a!)) < 0.00999999977648258209228515625##) THEN GOTO L_62e7e   '@62e4f DS:566a
    V_162a! = 0.0   '@62e6d DS:5600
L_62e7e:
    IF NOT (ABS(FX##(V_162e!)) < 0.00999999977648258209228515625##) THEN GOTO L_62ead   '@62e7e DS:566a
    V_162e! = 0.0   '@62e9c DS:5600
L_62ead:
    IF NOT (ABS(FX##(V_1632!)) < 0.00999999977648258209228515625##) THEN GOTO L_62edc   '@62ead DS:566a
    V_1632! = 0.0   '@62ecb DS:5600
L_62edc:
    IF NOT (ABS(FX##(V_1636!)) < 0.00999999977648258209228515625##) THEN GOTO L_62f0b   '@62edc DS:566a
    V_1636! = 0.0   '@62efa DS:5600
L_62f0b:
    GOTO L_633a8   '@62f0b
    ' ---- F_62f13 @0x62f13  (062f13_F_62f13.lift.txt; evidence_id (assembly): ev_7ead23e836367fea86c8a9546b61b92067ce80b78a37afff5779e6209fa92148)
L_62f18:   ' sub-rotina (alvo de GOSUB); entrada vinda de 060164_FUN_6000_0164
    REDIM A_10be!(-32768 TO -32768, -32768 TO -32768)   '@62f1d
    REDIM A_111a!(-32768 TO -32768, -32768 TO -32768)   '@62f2b
    REDIM A_1176!(-32768 TO -32768, -32768 TO -32768)   '@62f34
    REDIM A_10be!(0 TO CINT(V_0e2c!), 0 TO 1)   '@62f3d
    REDIM A_111a!(0 TO CINT(V_0e2c!), 0 TO 1)   '@62f68
    REDIM A_1176!(0 TO CINT(V_0e2c!), 0 TO 1)   '@62f93
    L_BP70% = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 6)   '@62fbe
    IF NOT (L_BP70% = 1) THEN GOTO L_630f0   '@62fee
    V_102e! = 1.0   '@62ffc DS:561e
    IF NOT (L_BP1a$ = "*") THEN GOTO L_63040   '@6300d DS:562a
    V_106e$ = "R " + V_106e$   '@63024 DS:566e
L_63040:
    V_0fb8! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 1)   '@63040
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 2)   '@63079
    V_106a! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 3)   '@630b2
    GOTO L_63399   '@630e8
L_630f0:
    IF NOT (L_BP70% = 2) THEN GOTO L_631c8   '@630f0
    V_102e! = 2.0   '@630f9 DS:5622
    IF NOT (L_BP1a$ = "*") THEN GOTO L_6313d   '@6310a DS:562a
    V_106e$ = "C " + V_106e$   '@63121 DS:5674
L_6313d:
    V_0fbc! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 1)   '@6313d
    V_0fc0! = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 2)   '@63176
    V_106a! = 0.0   '@631af DS:5600
    GOTO L_63399   '@631c0
L_631c8:
    IF NOT (L_BP70% = 3) THEN GOTO L_63399   '@631c8
    V_102e! = 3.0   '@631d1 DS:564c
    IF NOT (L_BP1a$ = "*") THEN GOTO L_63215   '@631e2 DS:562a
    V_106e$ = "P " + V_106e$   '@631f9 DS:567a
L_63215:
    L_BP72% = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 1)   '@63215
    A_10be!(0, 0) = A_1338%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(L_BP30!)), 2)   '@63245
    V_106a! = 0.0   '@6328d DS:5600
    L_BP76! = A_10be!(0, 0)   '@6329e
    FOR V_1012! = 0.0 TO L_BP76!   '@632be DS:5600,561e
    A_10be!(RT_CINT%(FX##(V_1012!)), 0) = FX##(A_1366%(L_BP72%, RT_CINT%(FX##(V_1012!)), 0)) / 10.0   '@632c6 DS:561a
    A_10be!(RT_CINT%(FX##(V_1012!)), 1) = FX##(A_1366%(L_BP72%, RT_CINT%(FX##(V_1012!)), 1)) / 10.0   '@63315 DS:561a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1012!   '@63366 DS:561e
    GOTO L_63399   '@63391
L_63399:
    RETURN   '@63399
L_633a8:   ' entrada vinda de 060164_FUN_6000_0164
    ' @633a8 libera strings locais (L_BP1a)
    ' END SUB   '@633b1
END SUB

FUNCTION S_633c1$ (P_BP06!)   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x633c1)
    DIM L_BP0e$
    DIM L_BP12$
    ' ---- FUN_6000_33c1 @0x633c1  (0633c1_FUN_6000_33c1.lift.txt; evidence_id (assembly): ev_c2663faf275445c356e390df3d49a0c01e899ea0c06f006465628bd604d2f67c)
    L_BP0e$ = LTRIM$(STR$(P_BP06!))   '@633ce
    IF NOT (INSTR(L_BP0e$, ".") > 0) THEN GOTO L_63436   '@633f0 DS:5680
    L_BP0e$ = RT_MID$((L_BP0e$), (1), (INSTR(L_BP0e$, ".") + 2))   '@63409 DS:5680
L_63436:
    L_BP12$ = L_BP0e$   '@63436
    ' @63448 libera strings locais (L_BP0e)
    S_633c1$ = L_BP12$: ' END FUNCTION   '@63456
END FUNCTION

SUB S_6346f   ' entrada de SUB/FUNCTION (B$ENRA, locais 240 bytes) (0x6346f)
    DIM L_BP0e!
    DIM L_BP12$
    DIM L_BP14%
    DIM L_BP16%
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP26%
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
    DIM L_BP52$
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e$
    DIM L_BP72!
    DIM L_BP76!
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP82$
    DIM L_BP86!
    DIM L_BP8a!
    DIM L_BP8e!
    DIM L_BP92!
    DIM L_BP96$
    DIM L_BP9a$
    DIM L_BP9e!
    DIM L_BPa2!
    DIM L_BPa6!
    DIM L_BPaa!
    DIM L_BPae$
    DIM L_BPb2$
    DIM L_BPb6!
    DIM L_BPba!
    DIM L_BPbe!
    DIM L_BPc2!
    DIM L_BPc6$
    DIM L_BPca$
    DIM L_BPce!
    DIM L_BPd2!
    DIM L_BPd6!
    DIM L_BPda!
    DIM L_BPde$
    DIM L_BPe2!
    DIM L_BPe6$
    DIM L_BPea!
    DIM L_BPee!
    DIM L_BPf2$
    DIM L_BPf6!
    DIM L_BPfa$
    ' ---- FUN_6000_346f @0x6346f  (06346f_FUN_6000_346f.lift.txt; evidence_id (assembly): ev_8658c515c0c629ff9092cd3c419722ff5bf567765d8b23de5d1e4cd57a556600)
    IF NOT (V_11ac% = 0) THEN GOTO L_63493   '@6347c
    GOTO L_653b6   '@6348b
L_63493:
L_63498:
    RT_CLS 2   '@6349d
    LOCATE 6, 1   '@634ab
    PRINT " Numero da Posicao das Colunas que serao Listadas"   '@634c6 DS:5686
    PRINT RT_TAB$(79); ""; ""   '@634d4 DS:5630
    PRINT RT_TAB$(79); ""; ""   '@634f4 DS:5630
    LOCATE 7, 1   '@63514
    CALL MIXT_07f1_LimpaTeclado   '@6352f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT " I/J/N a M/... /K *RETORNO* ", V_106e$   '@63539 DS:56bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_106e$) = 0) THEN GOTO L_63570   '@63553
    GOTO L_653b6   '@63568
L_63570:
    L_BP12$ = UCASE$(V_106e$)   '@63570
    V_1016! = 1.0   '@63588 DS:561e
L_6359e:
    L_BP14% = (VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) < 1.0#)   '@635a3 DS:56dc
    IF NOT ((VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) > V_11a6% OR L_BP14%) <> 0) THEN GOTO L_63636   '@635fd
    BEEP   '@63624
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_63498   '@6362e
L_63636:
    IF NOT (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) > 0) THEN GOTO L_637fd   '@63636 DS:56e4
    L_BP16% = RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A"))   '@6365a DS:56e4
    L_BP18% = (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("/")) > L_BP16%)   '@6368f DS:56ea
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("/")) = 0 OR L_BP18%) <> 0) THEN GOTO L_637f8   '@636b3 DS:56ea
    L_BP1a% = (VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1))) = 0.0#)   '@636ca DS:56e4,56f0
    IF NOT ((VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1))) > V_11a6% OR L_BP1a%) <> 0) THEN GOTO L_6377b   '@63737 DS:56e4
    BEEP   '@63769
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_63498   '@63773
L_6377b:
    IF NOT (VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(V_1016!))))) >= VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(V_1016!))), (L_BP12$), ("A")) + 1)))) THEN GOTO L_637f3   '@6377b DS:56e4
    BEEP   '@637e1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_63498   '@637eb
L_637f3:
L_637f8:
L_637fd:
    L_BP1e! = LEN(L_BP12$)   '@637fd
    FOR V_100e! = V_1016! TO L_BP1e!   '@63817 DS:561e
    IF NOT (RT_MID$((L_BP12$), (RT_CINT%(FX##(V_100e!))), (1)) = "/") THEN GOTO L_63868   '@6381e DS:56ea
    V_1016! = FX##(V_100e!) + 1.0   '@6384a DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_6359e   '@63860
L_63868:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_100e!   '@63868 DS:561e
    LOCATE 9, 1   '@63890
    PRINT " Dados Corretos N/*S* ";   '@638ab DS:56f8
    CALL MIXT_07f1_LimpaTeclado   '@638b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@638c3 DS:5630
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_63902   '@638dd DS:5712
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_63498   '@638fa
L_63902:
    PRINT " Ajuste a Impressora e Acione <Enter> para seguir ou";   '@63902 DS:5718
    PRINT " * <Enter> para anular o avanco inicial do formulario ";   '@63910 DS:5750
    CALL MIXT_07f1_LimpaTeclado   '@6391e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_106e$   '@63928 DS:5630
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP22! = 1.0   '@63942 DS:561e
L_63957:
    V_0fe4! = VAL(RT_MID2$((L_BP12$), (RT_CINT%(FX##(L_BP22!)))))   '@6395c
    GOSUB L_63b5a   '@6398a
    IF NOT (RT_INSTR%((RT_CINT%(FX##(L_BP22!))), (L_BP12$), ("A")) > 0) THEN GOTO L_63aac   '@63997 DS:56e4
    L_BP24% = RT_INSTR%((RT_CINT%(FX##(L_BP22!))), (L_BP12$), ("A"))   '@639ba DS:56e4
    L_BP26% = (RT_INSTR%((RT_CINT%(FX##(L_BP22!))), (L_BP12$), ("/")) > L_BP24%)   '@639ed DS:56ea
    IF NOT ((RT_INSTR%((RT_CINT%(FX##(L_BP22!))), (L_BP12$), ("/")) = 0 OR L_BP26%) <> 0) THEN GOTO L_63aa7   '@63a10 DS:56ea
    L_BP2a! = VAL(RT_MID2$((L_BP12$), (RT_INSTR%((RT_CINT%(FX##(L_BP22!))), (L_BP12$), ("A")) + 1)))   '@63a27 DS:56e4
L_63a68:
    V_0fe4! = FX##(V_0fe4!) + 1.0   '@63a68 DS:561e
    GOSUB L_63b5a   '@63a7e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0fe4! < L_BP2a! THEN GOTO L_63a68   '@63a8b
L_63aa7:
L_63aac:
    L_BP2e! = LEN(L_BP12$)   '@63aac
    FOR L_BP2a! = L_BP22! TO L_BP2e!   '@63ac6 DS:561e
    IF NOT (RT_MID$((L_BP12$), (RT_CINT%(FX##(L_BP2a!))), (1)) = "/") THEN GOTO L_63b13   '@63acc DS:56ea
    L_BP22! = FX##(L_BP2a!) + 1.0   '@63af7 DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_63957   '@63b0b
L_63b13:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2a!   '@63b13 DS:561e
    RT_SCREEN 0   '@63b38
    GOTO L_653b6   '@63b4d
    ' ---- F_63b55 @0x63b55  (063b55_F_63b55.lift.txt; evidence_id (assembly): ev_757ade1f06e18d3552381e841838c8bcf33ceb8b5895853184a93b1efeed8236)
L_63b5a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 06346f_FUN_6000_346f
    IF NOT (A_1338%(RT_CINT%(FX##(V_0fe4!)), 0, 0) = 0) THEN GOTO L_63b94   '@63b5f
    RETURN   '@63b8a
L_63b94:
    IF NOT (V_106e$ <> "*") THEN GOTO L_63bc4   '@63b94 DS:562a
    RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@63bab
L_63bc4:
    RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@63bc4
    RT_LPTABRE: RT_LPTAB 30: RT_LPS "": RT_LPS "#####################": RT_LPFIM   '@63bd7 DS:5630,578a
    RT_LPTABRE: RT_LPTAB RT_CINT%(40.0 - FX##(LEN(V_11be$)) / 2.0): RT_LPS "": RT_LPS V_11be$: RT_LPFIM   '@63bfc DS:5622,5630,57a4
    RT_LPTABRE: RT_LPTAB RT_CINT%(40.0 - FX##(LEN(A_1252$(RT_CINT%(FX##(V_0fe4!))))) / 2.0): RT_LPS "": RT_LPS A_1252$(RT_CINT%(FX##(V_0fe4!))): RT_LPFIM   '@63c3e DS:5622,5630,57a4
    RT_LPTABRE: RT_LPTAB 30: RT_LPS "": RT_LPS "#####################": RT_LPFIM   '@63ca8 DS:5630,578a
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@63ccd DS:5630
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@63ce0 DS:5630
    RT_LPTABRE: RT_LPTAB 18: RT_LPS "": RT_LPS "Nk": RT_LPTAB 40: RT_LPS "": RT_LPS "Mkx": RT_LPTAB 58: RT_LPS "": RT_LPS "Mky": RT_LPFIM   '@63cf3 DS:5630,57a8,57ae,57b6
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@63d4e DS:5630
    V_15ee! = -20000.0   '@63d61 DS:57be
    V_15f2! = 20000.0   '@63d72 DS:57c2
    V_15f6! = -20000.0   '@63d83 DS:57be
    V_15fa! = 20000.0   '@63d94 DS:57c2
    V_11c6% = 0   '@63da5
    V_0ff0! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@63db0
L_63de4:
    CALL S_60164   '@63de4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0ff0! = FX##(V_0ff0!) + 1.0   '@63dee DS:561e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) >= V_0ff0! THEN GOTO L_63de4   '@63e04
    L_BP32! = 1.0   '@63e3a DS:561e
    CALL MIXT_082a_Maior(L_BP32!, V_15ee!, L_BP36!)   '@63e4a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3a! = ABS(FX##(V_15f2!))   '@63e5c
    CALL MIXT_082a_Maior(L_BP36!, L_BP3a!, L_BP3e!)   '@63e69
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0fac! = 97.0 / FX##(L_BP3e!)   '@63e7b DS:57c6
    L_BP42! = 1.0   '@63e8a DS:561e
    CALL MIXT_082a_Maior(L_BP42!, V_15f6!, L_BP46!)   '@63e9a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4a! = ABS(FX##(V_15fa!))   '@63eac
    CALL MIXT_082a_Maior(L_BP46!, L_BP4a!, L_BP4e!)   '@63eb9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0fb0! = 97.0 / FX##(L_BP4e!)   '@63ecb DS:57c6
    L_BP52$ = V_0dcc$   '@63eda
    IF NOT (L_BP52$ = "HER") THEN GOTO L_63f75   '@63eec DS:57ca
    RT_SCREEN 3   '@63f03
    V_0f94! = 7.0   '@63f19 DS:57d2
    V_0f98! = 7.0   '@63f2a DS:57d2
    V_0f9c! = 7.0   '@63f3b DS:57d2
    V_0fa0! = 7.0   '@63f4c DS:57d2
    L_BP56! = 16.19797515869140625##   '@63f5d DS:57d6
    GOTO L_6408d   '@63f6d
L_63f75:
    IF NOT (L_BP52$ <> "EGA") THEN GOTO L_63f99   '@63f75 DS:57da
    IF NOT (L_BP52$ = "VGA") THEN GOTO L_64021   '@63f87 DS:57e2
L_63f99:
    RT_SCREEN 9   '@63f99
    COLOR , 1   '@63faf
    V_0f94! = 11.0   '@63fc5 DS:57ea
    V_0f98! = 14.0   '@63fd6 DS:57ee
    V_0f9c! = 12.0   '@63fe7 DS:57f2
    V_0fa0! = 15.0   '@63ff8 DS:57f6
    L_BP56! = 16.19797515869140625##   '@64009 DS:57d6
    GOTO L_6408d   '@64019
L_64021:
    RT_SCREEN 2   '@64021
    V_0f94! = 15.0   '@64034 DS:57f6
    V_0f98! = 15.0   '@64045 DS:57f6
    V_0f9c! = 15.0   '@64056 DS:57f6
    V_0fa0! = 15.0   '@64067 DS:57f6
    L_BP56! = 28.3464565277099609375##   '@64078 DS:57fa
L_6408d:
    RT_WINDOW 1, (0), (0), (639), (199)   '@6408d DS:5600,5602,57fe,5800,5802,5804 (B$WIND decodificado)
    L_BP5a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 0)   '@640bb
    FOR V_101a! = A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) TO L_BP5a! STEP -1.0   '@640e9 DS:5626
    V_0ff0! = V_101a!   '@6410e
    CALL S_60164   '@6411f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f88! = FX##(V_0f88!) - A_1280!(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)), 0)   '@64129
    V_10ba! = 0.0   '@64163 DS:5600
    IF NOT (V_0ea2$ = "S") THEN GOTO L_642cb   '@64174 DS:5658
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_101a! = FX##(4.0)) THEN GOTO L_641f4   '@6418b DS:5650
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.20000000298023223876953125## / 100.0   '@641c9 DS:565e,5806
L_641f4:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_101a! = FX##(5.0)) THEN GOTO L_6425d   '@641f4 DS:580a
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.4000000059604644775390625## / 100.0   '@64232 DS:565e,5666
L_6425d:
    IF NOT (FX##(A_1224%(RT_CINT%(FX##(V_0fe4!)), 1)) - V_101a! > FX##(5.0)) THEN GOTO L_642c6   '@6425d DS:580a
    V_10ba! = (FX##(V_0f88!) + V_10b6!) * V_0ea6% * 0.60000002384185791015625## / 100.0   '@6429b DS:565e,5662
L_642c6:
L_642cb:
    CALL MIXT_0877_Menor(V_161a!, V_161e!, L_BP5e!)   '@642cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_15fe! = A_11c8!(RT_CINT%(FX##(L_BP5e!)))   '@642e2
    CALL MIXT_0877_Menor(V_161a!, V_161e!, L_BP62!)   '@64302
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0e! = L_BP62!   '@64319
    V_1602! = A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!))) - INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)))) / 10.0) * 10.0 + 1.0   '@64322 DS:561a,561e
    V_1606! = INT(FX##(A_130a%(RT_CINT%(FX##(V_0fe4!)), RT_CINT%(FX##(V_0ff0!)))) / 10.0) / 10.0 + 1.0   '@6439b DS:561a,561e
    IF NOT (A_1224%(RT_CINT%(FX##(V_0fe4!)), 1) = V_101a!) THEN GOTO L_64627   '@643e7
    RT_CLS -1   '@64420
    RT_LINE 0, 10, 80, 10, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@6442e
    IF NOT (V_1602! <> 2.0) THEN GOTO L_644b4   '@64463 DS:5622
    RT_LINE 200, 10, 400, 10, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@6447e
L_644b4:
    IF NOT (V_1606! <> 2.0) THEN GOTO L_64505   '@644b4 DS:5622
    RT_LINE 420, 10, 620, 10, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@644cf
L_64505:
    V_106e$ = CHR$(25) + " (" + LTRIM$(RT_MID$((STR$(A_11c8!(RT_CINT%(FX##(V_101a!))))), (1), (LEN(STR$(RT_SNG!(INT(FX##(A_11c8!(RT_CINT%(FX##(V_101a!)))))))) + 2))) + ") " + A_11f6$(RT_CINT%(FX##(V_101a!)))   '@64505 DS:580e,5814
    L_BP66! = 40.0   '@645c4 DS:57a4
    L_BP6a! = 10.0   '@645d5 DS:561a
    L_BP6e$ = "CGA"   '@645df DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BP66!, L_BP6a!, V_106e$, L_BP6e$)   '@645ec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @64601 libera strings locais (L_BP6e)
    L_BP72! = 10.0   '@6460a DS:561a
    GOTO L_6536d   '@6461a
L_64627:
    IF NOT (V_1606! = 2.0 AND V_1602! = 2.0) THEN GOTO L_6466d   '@64627 DS:5622
    GOTO L_6536d   '@64665
L_6466d:
    L_BP76! = L_BP72!   '@6466d
    L_BP7a! = (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(V_101a!)))) * L_BP56! + L_BP72!   '@6467c
    V_100e! = 0.0   '@646c4 DS:5600
L_646da:
    L_BP7e! = L_BP7a! - FX##(V_100e!) * 200.0   '@646df DS:5822
    IF NOT (L_BP7a! - FX##(V_100e!) * 200.0 > FX##(199.0)) THEN GOTO L_64737   '@646fb DS:5802,5822
    L_BP7e! = 199.0   '@64722 DS:5802
L_64737:
    RT_LINE 300.0, L_BP76!, 300.0, L_BP7e!, 9, RT_CINT%(FX##(V_0f9c!)), 0   '@64737 DS:5826
    RT_LINE 520.0, L_BP76!, 520.0, L_BP7e!, 9, RT_CINT%(FX##(V_0f9c!)), 0   '@64779 DS:582a
    IF NOT (A_11c8!(RT_CINT%(FX##(L_BP0e!))) <= V_15fe!) THEN GOTO L_648fa   '@647bb
    V_10ae! = V_162a!   '@647eb
    L_BP82$ = S_633c1$(V_162a!)   '@647fc
    V_106e$ = L_BP82$   '@64815
    IF NOT (L_BP0e! = V_161a! AND V_162a! <> 0.0) THEN GOTO L_648f2   '@64823 DS:5600
    L_BP86! = -((V_162a! > 0.0) * 140 - 200)   '@64860 DS:5600
    L_BP8a! = 198.0   '@64893 DS:582e
    L_BP8e! = FX##(L_BP76!) + 10.0   '@6489f DS:561a
    CALL MIXT_0877_Menor(L_BP8a!, L_BP8e!, L_BP92!)   '@648ae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP96$ = "CGA"   '@648c2 DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BP86!, L_BP92!, V_106e$, L_BP96$)   '@648d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @648e8 libera strings locais (L_BP96)
L_648f2:
    GOTO L_64977   '@648f2
L_648fa:
    V_10ae! = V_162a! - (FX##(V_162a!) - V_1632!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - V_15fe!) / (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(V_101a!))))   '@648fa
L_64977:
    IF NOT (L_BP7e! < 199.0) THEN GOTO L_64a7e   '@64977 DS:5802
    V_10b2! = V_1632!   '@64991
    L_BP9a$ = S_633c1$(V_1632!)   '@649a2
    V_106e$ = L_BP9a$   '@649bb
    IF NOT (V_1632! <> 0.0) THEN GOTO L_64a76   '@649c9 DS:5600
    L_BP9e! = -((V_1632! > 0.0) * 140 - 210)   '@649e4 DS:5600
    L_BPa2! = 10.0   '@64a17 DS:561a
    L_BPa6! = FX##(L_BP7e!) - 2.0   '@64a23 DS:5832
    CALL MIXT_082a_Maior(L_BPa2!, L_BPa6!, L_BPaa!)   '@64a32
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPae$ = "CGA"   '@64a46 DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BP9e!, L_BPaa!, V_106e$, L_BPae$)   '@64a54
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @64a6c libera strings locais (L_BPae)
L_64a76:
    GOTO L_64b0a   '@64a76
L_64a7e:
    V_10b2! = V_162a! - (FX##(V_162a!) - V_1632!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - V_15fe! + (FX##(L_BP7e!) - L_BP76!) / L_BP56!) / (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(V_101a!))))   '@64a7e
L_64b0a:
    RT_LINE RT_SNG!(FX##(V_0fac!) * V_10ae! + 300.0), L_BP76!, RT_SNG!(FX##(V_0fac!) * V_10b2! + 300.0), L_BP7e!, 9, RT_CINT%(FX##(V_0f98!)), 0   '@64b0a DS:5826
    IF NOT (A_11c8!(RT_CINT%(FX##(V_161e!))) <= V_15fe!) THEN GOTO L_64cae   '@64b6e
    V_10ae! = V_162e!   '@64b9f
    L_BPb2$ = S_633c1$(V_162e!)   '@64bb0
    V_106e$ = L_BPb2$   '@64bc9
    IF NOT (L_BP0e! = V_161e! AND V_162e! <> 0.0) THEN GOTO L_64ca6   '@64bd7 DS:5600
    L_BPb6! = -((V_162e! > 0.0) * 140 - 430)   '@64c14 DS:5600
    L_BPba! = 198.0   '@64c47 DS:582e
    L_BPbe! = FX##(L_BP76!) + 10.0   '@64c53 DS:561a
    CALL MIXT_0877_Menor(L_BPba!, L_BPbe!, L_BPc2!)   '@64c62
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc6$ = "CGA"   '@64c76 DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BPb6!, L_BPc2!, V_106e$, L_BPc6$)   '@64c84
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @64c9c libera strings locais (L_BPc6)
L_64ca6:
    GOTO L_64d2b   '@64ca6
L_64cae:
    V_10ae! = V_162e! - (FX##(V_162e!) - V_1636!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - V_15fe!) / (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(V_101a!))))   '@64cae
L_64d2b:
    IF NOT (L_BP7e! < 199.0) THEN GOTO L_64e32   '@64d2b DS:5802
    V_10b2! = V_1636!   '@64d45
    L_BPca$ = S_633c1$(V_1636!)   '@64d56
    V_106e$ = L_BPca$   '@64d6f
    IF NOT (V_1636! <> 0.0) THEN GOTO L_64e2a   '@64d7d DS:5600
    L_BPce! = -((V_1636! > 0.0) * 140 - 430)   '@64d98 DS:5600
    L_BPd2! = 10.0   '@64dcb DS:561a
    L_BPd6! = FX##(L_BP7e!) - 2.0   '@64dd7 DS:5832
    CALL MIXT_082a_Maior(L_BPd2!, L_BPd6!, L_BPda!)   '@64de6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPde$ = "CGA"   '@64dfa DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BPce!, L_BPda!, V_106e$, L_BPde$)   '@64e08
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @64e20 libera strings locais (L_BPde)
L_64e2a:
    GOTO L_64ebe   '@64e2a
L_64e32:
    V_10b2! = V_162e! - (FX##(V_162e!) - V_1636!) * (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - V_15fe! + (FX##(L_BP7e!) - L_BP76!) / L_BP56!) / (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) - A_11c8!(RT_CINT%(FX##(V_101a!))))   '@64e32
L_64ebe:
    RT_LINE RT_SNG!(FX##(V_0fb0!) * V_10ae! + 520.0), L_BP76!, RT_SNG!(FX##(V_0fb0!) * V_10b2! + 520.0), L_BP7e!, 9, RT_CINT%(FX##(V_0f98!)), 0   '@64ebe DS:582a
    IF NOT ((FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) + A_11c8!(RT_CINT%(FX##(V_101a!)))) / 2.0 > V_15fe! - (FX##(L_BP7e!) - L_BP76!) / L_BP56! AND (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) + A_11c8!(RT_CINT%(FX##(V_101a!)))) / 2.0 <= FX##(V_15fe!)) THEN GOTO L_650bf   '@64f2c DS:5622
    L_BPe2! = FX##(V_10b6!) - V_10ba! + V_0f88! + V_0f90!   '@64fe5
    L_BPe6$ = S_633c1$(L_BPe2!)   '@65005
    V_106e$ = L_BPe6$   '@6501a
    L_BPea! = 50.0   '@65028 DS:5836
    L_BPee! = (V_15fe! - (FX##(A_11c8!(RT_CINT%(FX##(L_BP0e!)))) + A_11c8!(RT_CINT%(FX##(V_101a!)))) / 2.0) * L_BP56! + L_BP76!   '@6503a DS:5622
    L_BPf2$ = "CGA"   '@6508a DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BPea!, L_BPee!, V_106e$, L_BPf2$)   '@65098
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @650b0 libera strings locais (L_BPf2)
L_650bf:
    IF NOT (L_BP7a! - FX##(V_100e!) * 200.0 > FX##(199.0)) THEN GOTO L_65151   '@650bf DS:5802,5822
    RT_ROTINA_0AEA   '@650e6 (rotina em assembly ligada ao EXE (SUB_80aea); gerada no fim do programa)
    V_15fe! = V_15fe! - (FX##(L_BP7e!) - L_BP76!) / L_BP56!   '@650f0
    L_BP76! = 0.0   '@65110 DS:5600
    V_100e! = FX##(V_100e!) + 1.0   '@65120 DS:561e
    RT_CLS -1   '@65136
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_646da   '@65144
L_65151:
    RT_LINE 0.0, L_BP7e!, 80.0, L_BP7e!, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@65151 DS:5600,583a
    IF NOT (V_1602! <> 2.0) THEN GOTO L_651f0   '@65193 DS:5622
    RT_LINE 200.0, L_BP7e!, 400.0, L_BP7e!, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@651ae DS:5822,583e
L_651f0:
    IF NOT (V_1606! <> 2.0) THEN GOTO L_6524d   '@651f0 DS:5622
    RT_LINE 420.0, L_BP7e!, 620.0, L_BP7e!, 9, RT_CINT%(FX##(V_0fa0!)), 0   '@6520b DS:5842,5846
L_6524d:
    V_106e$ = CHR$(25) + " (" + LTRIM$(RT_MID$((STR$(A_11c8!(RT_CINT%(FX##(V_101a!))))), (1), (LEN(STR$(RT_SNG!(INT(FX##(A_11c8!(RT_CINT%(FX##(V_101a!)))))))) + 2))) + ") " + A_11f6$(RT_CINT%(FX##(V_101a!)))   '@6524d DS:580e,5814
    L_BPf6! = 40.0   '@6530c DS:57a4
    L_BPfa$ = "CGA"   '@6531d DS:581a
    CALL MIXT_08c4_TextoGrafico(L_BPf6!, L_BP7e!, V_106e$, L_BPfa$)   '@6532b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @65342 libera strings locais (L_BPfa)
    L_BP72! = L_BP7a! - FX##(V_100e!) * 200.0   '@6534c DS:5822
L_6536d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_101a!   '@65372 DS:5626
    RT_ROTINA_0AEA   '@6539d (rotina em assembly ligada ao EXE (SUB_80aea); gerada no fim do programa)
    RETURN   '@653a7
L_653b6:   ' entrada vinda de 06346f_FUN_6000_346f
    ' @653b6 libera strings locais (L_BPe6)
    ' @653c0 libera strings locais (L_BPca)
    ' @653ca libera strings locais (L_BPb2)
    ' @653d4 libera strings locais (L_BP9a)
    ' @653de libera strings locais (L_BP82)
    ' @653e8 libera strings locais (L_BP52)
    ' @653f1 libera strings locais (L_BP12)
    ' END SUB   '@653fa
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_PILAREDI.BM'
'$INCLUDE: '../comum/MIXT.BM'
