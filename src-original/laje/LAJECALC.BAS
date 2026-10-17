' ============================================================================
'  LAJECALC - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/LAJECALC/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: ecd04724a7da0886ce1e8cee8b6f4415b052386796417aa91819abf88fd0f121
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_LAJE.BI'

' ---- variaveis do LAJECALC fora do COMMON (DS do programa)
REDIM SHARED A_1342%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_15b0!(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_15de!(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_160c!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_163a!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1376!
DIM SHARED V_137a!
DIM SHARED V_137e!
DIM SHARED V_1382!
DIM SHARED V_1386!
DIM SHARED V_138a%
DIM SHARED V_138c%
DIM SHARED V_138e%
DIM SHARED V_1390$
DIM SHARED V_1394!
DIM SHARED V_1398!
DIM SHARED V_139c!
DIM SHARED V_13a0!
DIM SHARED V_13a4!
DIM SHARED V_13a8!
DIM SHARED V_13ac!
DIM SHARED V_13b0!
DIM SHARED V_13b4%
DIM SHARED V_13b6%
DIM SHARED V_13b8!
DIM SHARED V_13bc!
DIM SHARED V_13c0!
DIM SHARED V_13c4!
DIM SHARED V_13c8!
DIM SHARED V_13cc!
DIM SHARED V_13d0!
DIM SHARED V_13d4$
DIM SHARED V_13d8$
DIM SHARED V_13dc$
DIM SHARED V_13e0!
DIM SHARED V_13e4#
DIM SHARED V_13ec!
DIM SHARED V_13f0!
DIM SHARED V_13f4!
DIM SHARED V_13f8!
DIM SHARED V_13fc!
DIM SHARED V_1400!
DIM SHARED V_1404#
DIM SHARED V_140c#
DIM SHARED V_1414!
DIM SHARED V_1418!
DIM SHARED V_141c!
DIM SHARED V_1420!
DIM SHARED V_1424!
DIM SHARED V_1428$
DIM SHARED V_142c!
DIM SHARED V_1430!
DIM SHARED V_1434!
DIM SHARED V_1438!
DIM SHARED V_143c$
DIM SHARED V_1440!
DIM SHARED V_1444!
DIM SHARED V_1448$
DIM SHARED V_144c!
DIM SHARED V_1450$
DIM SHARED V_1454!
DIM SHARED V_1458!
DIM SHARED V_145c!
DIM SHARED V_1460!
DIM SHARED V_1464!
DIM SHARED V_1468$
DIM SHARED V_146c!
DIM SHARED V_1470!
DIM SHARED V_1474$
DIM SHARED V_1478!
DIM SHARED V_147c!
DIM SHARED V_1480$
DIM SHARED V_1484!
DIM SHARED V_1488!
DIM SHARED V_148c!
DIM SHARED V_1490!
DIM SHARED V_1494!
DIM SHARED V_1498$
DIM SHARED V_1670#
DIM SHARED V_1678#
DIM SHARED V_1680#
DIM SHARED V_1688#
DIM SHARED V_1690#
DIM SHARED V_1698#
DIM SHARED V_16a0#
DIM SHARED V_16a8#
DIM SHARED V_16b0#
DIM SHARED V_16b8!
DIM SHARED V_16bc!
DIM SHARED V_16c0!
DIM SHARED V_16c4!
DIM SHARED V_16cc!
DIM SHARED V_16d0#
DIM SHARED V_16d8#
DIM SHARED V_16e0#
DIM SHARED V_16e8#
DIM SHARED V_16f0#
DIM SHARED V_16f8#
DIM SHARED V_1700#
DIM SHARED V_1708#
DIM SHARED V_1710#
DIM SHARED V_1718#
DIM SHARED V_1720#
DIM SHARED V_1728#
DIM SHARED V_1730#
DIM SHARED V_1738#
DIM SHARED V_1740#
DIM SHARED V_1748#
DIM SHARED V_1750!
DIM SHARED V_1754!
DIM SHARED V_1758!
DIM SHARED V_175c!
DIM SHARED V_1760!
DIM SHARED V_1764!
DIM SHARED V_1768#
DIM SHARED V_1770#
DIM SHARED V_1778!
DIM SHARED V_177c!
DIM SHARED V_1780!
DIM SHARED V_1784!
DIM SHARED V_1788!
DIM SHARED V_178c!
DIM SHARED V_1790!
DIM SHARED V_1794!
DIM SHARED V_1798!
DIM SHARED V_179c!
DIM SHARED V_17a0!
DIM SHARED V_17a4!
DIM SHARED V_17a8!
DIM SHARED V_17ac!
DIM SHARED V_17e0#
DIM SHARED V_17e8#
DIM SHARED V_17f0#
DIM SHARED V_17f8#
DIM SHARED V_1800!
DIM SHARED V_1804!
DIM SHARED V_1808!
DIM SHARED V_180c!
DIM SHARED V_1810!
DIM SHARED V_1814!
DIM SHARED V_1818!
DIM SHARED V_181c!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "LAJECALC"
' ---- M_LAJECALC @0x10030  (010030_M_LAJECALC.lift.txt; evidence_id (assembly): ev_af5dd49c57313a8e841b692de2d72ee88b3c2f5f219d84831300129ae2623cbf)
' @10030 inicio do programa (B$?EVT)
GOTO L_10206   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10206:
GOSUB L_10284   '@10206
ON ERROR GOTO L_1022f
RT_ONERR = &H1022f   '@10213
GOTO L_10695   '@10222
' ---- F_1022a @0x1022a  (01022a_F_1022a.lift.txt; evidence_id (assembly): ev_4e1fcc2043e49b42b34af4b1e5ef37e1bca36500927d8c4b7a8516b006aeb281)
L_1022f:   ' entrada vinda de 010030_M_LAJECALC, 010695_FUN_1000_0695
RESUME L_10246   '@10234
L_10246:
GOSUB L_10284   '@1024b
CALL S_1d177   '@10258
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_SCREEN 0   '@10262
GOTO L_10695   '@10277
' ---- F_1027f @0x1027f  (01027f_F_1027f.lift.txt; evidence_id (assembly): ev_3675e22b1193ec7d4663ab8dd98182659ce57d84550cc1b6aebc7fd27db85fe0)
L_10284:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJECALC, 01022a_F_1022a
FOR V_13d0! = 1.0 TO 10.0   '@10289 DS:187a,187e
ON KEY(RT_CINT%(FX##(V_13d0!))) GOSUB L_10529
RT_ONKEY RT_CINT%(FX##(V_13d0!)), 1   '@10296
KEY(RT_CINT%(FX##(V_13d0!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_13d0!)), 1   '@102b0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_13d0!   '@102c5 DS:187a,187e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@102ee
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10316
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1033e
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10366
FOR V_13d0! = 15.0 TO 18.0   '@1038e DS:187a,1882,1886
ON KEY(RT_CINT%(FX##(V_13d0!))) GOSUB L_10554
RT_ONKEY RT_CINT%(FX##(V_13d0!)), 2   '@1039c
KEY(RT_CINT%(FX##(V_13d0!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_13d0!)), 1   '@103b6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_13d0!   '@103cb DS:187a,1886
ON KEY(2) GOSUB L_10554
RT_ONKEY 2, 2   '@103f4
KEY(2) ON
RT_KEYESTADO 2, 1   '@10407
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10415
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1043d
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@10465
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1048d
FOR V_13d0! = 19.0 TO 22.0   '@104b4 DS:187a,188a,188e
ON KEY(RT_CINT%(FX##(V_13d0!))) GOSUB L_10652
RT_ONKEY RT_CINT%(FX##(V_13d0!)), 3   '@104c2
KEY(RT_CINT%(FX##(V_13d0!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_13d0!)), 1   '@104dc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_13d0!   '@104f1 DS:187a,188e
RETURN   '@1051a
L_10529:
BEEP   '@1052e
GOSUB L_10284   '@10538
RETURN   '@10545
L_10554:
RT_SCREEN 0   '@10559
RT_VIEWPRINT 1, 25   '@1056e
COLOR 7, 0, 0   '@10580
RT_CLS 0   '@105a4
PRINT " Aguarde ..."   '@105b1 DS:1892
PRINT ""   '@105bf DS:1820
PRINT " Retorno ao Modulo Basico de LAJE"   '@105cd DS:18a2
ON ERROR GOTO L_10619
RT_ONERR = &H10619   '@105db
V_0f28_volta$ = "VOLTA LAJECALC"   '@105ea DS:18c8
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@105fc DS:18da
L_10619:
PRINT " Modulo nao encontrado em "; V_0e04_direxe$   '@1061e DS:18e2
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@10635 DS:183e
RT_FIM   '@10643 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10652:
BEEP   '@10657
GOSUB L_10284   '@10661
RT_SCREEN 0   '@1066e
RETURN L_10695   '@1068d
' ---- FUN_1000_0695 @0x10695  (010695_FUN_1000_0695.lift.txt; evidence_id (assembly): ev_c0183f9b11c7a592a5703da371ff4650156c8bf64072d475aba7df3bc7d2bd30)
L_10695:   ' entrada vinda de 010030_M_LAJECALC, 01022a_F_1022a, 01027f_F_1027f, 011e6d_F_11e6d, 016337_FUN_1000_6337, 017486_F_17486, 01c1b7_FUN_1000_c1b7
ON ERROR GOTO L_1022f
RT_ONERR = &H1022f   '@1069a
RT_VIEWPRINT 1, 25   '@106a9
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@106bb
RT_CLS 2   '@106f6
PRINT RT_STRINGC$((80), (205))   '@10704
PRINT " Calculo e Detalhamento de Painel / Lajes de um Edificio"   '@1071c DS:1900
PRINT RT_STRINGC$((80), (205))   '@1072a
RT_VIEWPRINT 6, 25   '@10742
V_0ef4# = RT_FRE&("")   '@10754 DS:1820
V_0ef4# = INT(FX##(RT_FREN&(-1)) / 1024.0#)   '@1076e DS:193c
COLOR 7   '@10794
LOCATE 6, 20   '@107aa
PRINT "1  -  ";   '@107c8 DS:1944
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@107d6
PRINT "C";   '@107f3 DS:194e
COLOR 7   '@10801
PRINT "ontinuidade e Engastes"   '@10817 DS:1954
LOCATE 8, 20   '@10825
PRINT "2  -  ";   '@10843 DS:196e
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10851
PRINT "D";   '@1086e DS:1978
COLOR 7   '@1087c
PRINT "irecoes Principais das Armaduras"   '@10892 DS:197e
LOCATE 10, 20   '@108a0
PRINT "3  -  ";   '@108be DS:19a2
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@108cc
PRINT "E";   '@108e9 DS:19ac
COLOR 7   '@108f7
PRINT "spessuras Minimas"   '@1090d DS:19b2
LOCATE 12, 20   '@1091b
PRINT "4  -  ";   '@10939 DS:19c8
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10947
PRINT "I";   '@10964 DS:19d2
COLOR 7   '@10972
PRINT "mposicao de Espessuras"   '@10988 DS:19d8
LOCATE 14, 20   '@10996
PRINT "5  -  ";   '@109b4 DS:19f2
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@109c2
PRINT "M";   '@109df DS:19fc
COLOR 7   '@109ed
PRINT "omentos e ";   '@10a03 DS:1a02
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10a11
PRINT "A";   '@10a2e DS:1a10
COLOR 7   '@10a3c
PRINT "rmadura necessaria"   '@10a52 DS:1a16
LOCATE 16, 20   '@10a60
PRINT "6  -  ";   '@10a7e DS:1a2c
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10a8c
PRINT "O";   '@10aa9 DS:1a36
COLOR 7   '@10ab7
PRINT "timizacao dos Negativos"   '@10acd DS:1a3c
LOCATE 18, 20   '@10adb
PRINT "7  -  ";   '@10af9 DS:1a58
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10b07
PRINT "V";   '@10b24 DS:1a62
COLOR 7   '@10b32
PRINT "isualizar e Alterar Parametrizacoes"   '@10b48 DS:1a68
LOCATE 20, 20   '@10b56
PRINT "8  -  ";   '@10b74 DS:1a90
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10b82
PRINT "R";   '@10b9f DS:1a9a
COLOR 7   '@10bad
PRINT "etorno ao Menu Principal"   '@10bc3 DS:1aa0
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@10bd1
LOCATE 22, 20   '@10bfd
PRINT "escolha opcao ";   '@10c1b DS:1abc
CALL MIXT_07f1_LimpaTeclado   '@10c29
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10c33
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@10c4f
V_13d4$ = V_0f18$   '@10c65
IF NOT (V_13d4$ <> "1") THEN GOTO L_10cb2   '@10c77 DS:1ace
IF NOT (V_13d4$ <> "C") THEN GOTO L_10cb2   '@10c8e DS:194e
IF NOT (V_13d4$ = "c") THEN GOTO L_10ccc   '@10ca0 DS:1ad4
L_10cb2:
CALL S_30182   '@10cb2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@10cbc
L_10ccc:
IF NOT (V_13d4$ <> "2") THEN GOTO L_10d02   '@10ccc DS:1ada
IF NOT (V_13d4$ <> "D") THEN GOTO L_10d02   '@10cde DS:1978
IF NOT (V_13d4$ = "d") THEN GOTO L_10d1c   '@10cf0 DS:1ae0
L_10d02:
CALL S_35423   '@10d02
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@10d0c
L_10d1c:
IF NOT (V_13d4$ <> "3") THEN GOTO L_10d52   '@10d1c DS:1ae6
IF NOT (V_13d4$ <> "E") THEN GOTO L_10d52   '@10d2e DS:19ac
IF NOT (V_13d4$ = "e") THEN GOTO L_10d62   '@10d40 DS:1aec
L_10d52:
GOTO L_11041   '@10d52
L_10d62:
IF NOT (V_13d4$ <> "4") THEN GOTO L_10d98   '@10d62 DS:1af2
IF NOT (V_13d4$ <> "I") THEN GOTO L_10d98   '@10d74 DS:19d2
IF NOT (V_13d4$ = "i") THEN GOTO L_10da8   '@10d86 DS:1af8
L_10d98:
GOTO L_154ad   '@10d98
L_10da8:
IF NOT (V_13d4$ <> "5") THEN GOTO L_10e02   '@10da8 DS:1afe
IF NOT (V_13d4$ <> "M") THEN GOTO L_10e02   '@10dba DS:19fc
IF NOT (V_13d4$ <> "m") THEN GOTO L_10e02   '@10dcc DS:1b04
IF NOT (V_13d4$ <> "A") THEN GOTO L_10e02   '@10dde DS:1a10
IF NOT (V_13d4$ = "a") THEN GOTO L_10e12   '@10df0 DS:1b0a
L_10e02:
GOTO L_16337   '@10e02
L_10e12:
IF NOT (V_13d4$ <> "6") THEN GOTO L_10e48   '@10e12 DS:1b10
IF NOT (V_13d4$ <> "O") THEN GOTO L_10e48   '@10e24 DS:1a36
IF NOT (V_13d4$ = "o") THEN GOTO L_10e58   '@10e36 DS:1b16
L_10e48:
GOTO L_1a28c   '@10e48
L_10e58:
IF NOT (V_13d4$ <> "7") THEN GOTO L_10e8e   '@10e58 DS:1b1c
IF NOT (V_13d4$ <> "V") THEN GOTO L_10e8e   '@10e6a DS:1a62
IF NOT (V_13d4$ = "v") THEN GOTO L_10e9e   '@10e7c DS:1b22
L_10e8e:
GOTO L_1c1b7   '@10e8e
L_10e9e:
IF NOT (V_13d4$ <> "8") THEN GOTO L_10ed4   '@10e9e DS:1b28
IF NOT (V_13d4$ <> "R") THEN GOTO L_10ed4   '@10eb0 DS:1a9a
IF NOT (V_13d4$ = "r") THEN GOTO L_10edc   '@10ec2 DS:1b2e
L_10ed4:
GOTO L_10ee9   '@10ed4
L_10edc:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@10edc
L_10ee9:
L_10eee:
V_0f28_volta$ = "VOLTA LAJECALC"   '@10ef3 DS:18c8
ON ERROR GOTO L_10f7e
RT_ONERR = &H10f7e   '@10f05
V_0ef4# = RT_FRE&("")   '@10f14 DS:1820
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@10f2e
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@10f4d
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@10f61 DS:18da
L_10f7e:
RESUME L_10f95   '@10f83
L_10f95:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@10f9a DS:1b34
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_11034   '@10fbf DS:1b3c
LOCATE 23, 10   '@10fd4
PRINT " Coloque o Disco LAJE no Drive "; V_0e04_direxe$   '@10ff2 DS:1b44
CALL MIXT_07f1_LimpaTeclado   '@11009
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@11013
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_11034:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10eee   '@11034
L_11041:
IF NOT (V_120e% = 0 OR V_126c% = 0) THEN GOTO L_11072   '@11046
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1106a
L_11072:
V_138e% = 1   '@11072
RT_VIEWPRINT 1, 25   '@1107d
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1108f
RT_CLS 2   '@110bb
PRINT RT_STRINGC$((80), (205))   '@110c9
PRINT " Calculo de Espessuras Minimas"   '@110e1 DS:1b68
PRINT RT_STRINGC$((80), (205))   '@110ef
V_138a% = 1   '@11107
V_138c% = 0   '@11112
L_11122:
IF NOT (A_10cc!(V_138a%, 1) = 2.0) THEN GOTO L_11159   '@11122 DS:1b8a
V_138c% = V_138c% + 1   '@11150
L_11159:
V_138a% = V_138a% + 1   '@11159
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_138a% THEN GOTO L_11122   '@11162
V_138a% = A_109e%(0, 0) - V_138c%   '@11180
L_111a4:
RT_VIEWPRINT 6, 25   '@111a9
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@111bb
RT_CLS 2   '@111d8
PRINT " Arquivadas"; V_138a%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@111e6 DS:187a,1b8e,1b9e
IF NOT (V_138a% > 1) THEN GOTO L_11282   '@11234
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)));   '@11243 DS:1bac
L_11282:
PRINT " )"   '@11282 DS:1bb4
COLOR 7   '@11290
PRINT " Numero das Lajes que serao Pesquisadas as Espessuras Minimas"   '@112a6 DS:1bba
PRINT " I/J/N a M/.../K  *TODAS* ";   '@112b4 DS:1bfc
CALL MIXT_07f1_LimpaTeclado   '@112c2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@112cc DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_11385   '@112e6
V_1390$ = LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)))   '@112fb DS:187a
IF NOT (V_138a% > 1) THEN GOTO L_1137d   '@11329
V_1390$ = V_1390$ + " A " + LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)))   '@11338 DS:1c1a
L_1137d:
GOTO L_113a2   '@1137d
L_11385:
V_1390$ = UCASE$(V_0f18$)   '@11385
L_113a2:
V_137e! = 1.0   '@113a2 DS:187a
L_113b8:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@113b8 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_1141c   '@113e6 DS:1c28
V_1382! = LEN(V_1390$) + 1   '@11401
L_1141c:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@1141c
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@1144f
IF NOT ((FX##(VAL(V_0f18$)) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_114c5   '@1148a
V_0f18$ = "*"   '@114ab DS:1c2c
GOTO L_1161c   '@114bd
L_114c5:
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_115e2   '@114c5 DS:1a10
L_BP0c% = (FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) <= FX##(V_0e54_nivellaje!))   '@114de DS:1a10
IF NOT ((FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_11580   '@11534 DS:1a10
V_0f18$ = "*"   '@11566 DS:1c2c
GOTO L_1161c   '@11578
L_11580:
IF NOT (VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1))) <= VAL(V_0f18$)) THEN GOTO L_115dd   '@11580 DS:1a10
V_0f18$ = "*"   '@115c3 DS:1c2c
GOTO L_1161c   '@115d5
L_115dd:
L_115e2:
V_137e! = FX##(V_1382!) + 1.0   '@115e2 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_113b8   '@115f8
L_1161c:
IF NOT (V_0f18$ = "*") THEN GOTO L_11645   '@1161c DS:1c2c
BEEP   '@11633
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_111a4   '@1163d
L_11645:
LOCATE 9, 1   '@11645
PRINT " Imprimo Relatorio com Espessuras Minimas  S/*N* ";   '@11660 DS:1c32
CALL MIXT_07f1_LimpaTeclado   '@1166e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@11678 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13d8$ = "N"   '@11692 DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_116d3   '@116a4 DS:1c6e
V_13d8$ = "S"   '@116c1 DS:1c6e
L_116d3:
LOCATE 10, 1   '@116d3
PRINT " Visualizo todo o painel com as Espessuras Minimas  S/*N* ";   '@116ee DS:1c74
CALL MIXT_07f1_LimpaTeclado   '@116fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@11706 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13dc$ = "N"   '@11720 DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_11761   '@11732 DS:1c6e
V_13dc$ = "S"   '@1174f DS:1c6e
L_11761:
PRINT " Dados Corretos N/*S* ";   '@11761 DS:1cb2
CALL MIXT_07f1_LimpaTeclado   '@1176f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@11779 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_117b8   '@11793 DS:1c68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@117b0
L_117b8:
IF NOT (V_13d8$ = "S") THEN GOTO L_11806   '@117b8 DS:1c6e
PRINT " Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario ";   '@117cf DS:1ccc
CALL MIXT_07f1_LimpaTeclado   '@117dd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@117e7 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_11806:
IF NOT (V_12f8% = 0) THEN GOTO L_1185a   '@11806
REDIM A_12ca%(-32768 TO -32768)   '@11815
REDIM A_12ca%(0 TO A_109e%(0, 0))   '@11823
V_12f8% = 1   '@1184a
L_1185a:
L_1185f:   ' entrada vinda de 011e6d_F_11e6d
RT_VIEWPRINT 1, 25   '@11864
RT_CLS 2   '@11876
PRINT ""   '@11884 DS:1820
IF NOT (V_138e% = 1) THEN GOTO L_118c5   '@11892
PRINT " CALCULO DAS ESPESSURAS MINIMAS DAS LAJES"   '@118a1 DS:1d1a
PRINT " Laje    H min   x/d    L/f        As        Perm.    Acid.   P Prop.   Total"   '@118af DS:1d48
GOTO L_118e6   '@118bd
L_118c5:
PRINT " IMPOSICAO DAS ESPESSURAS NAS LAJES"   '@118c5 DS:1d9a
PRINT " Laje     H      x/d    L/f        As        Perm.    Acid.   P Prop.   Total"   '@118d3 DS:1dc2
L_118e6:
PRINT RT_STRINGC$((80), (95))   '@118e6
LOCATE 24, 1   '@118fe
COLOR 3   '@11919
PRINT "    Fck"; V_0e70!; V_0de4$; "     Fyk"; V_0e74!; V_0de4$; " tipo "; V_0e80_tipoaco$; "             Cobrimento"; V_0e84!; "cm"   '@1192f DS:1e14,1e20,1e2c,1e36,1e52
PRINT "    CSE"; V_0e28!; "      CSC"; V_0e2c!; "      CSA"; V_0e30!;   '@119a3 DS:1e58,1e64,1e72
RT_VIEWPRINT 6, 22   '@119ea
IF NOT (V_13d8$ = "S") THEN GOTO L_11b22   '@119fc DS:1c6e
IF NOT (V_0f18$ <> "*") THEN GOTO L_11a43   '@11a13 DS:1c2c
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@11a2a
L_11a43:
RT_LPTABRE: RT_LPS V_0e0c$: RT_LPFIM   '@11a43
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@11a56
RT_LPTABRE: RT_LPS " ": RT_LPS V_0dd8$: RT_LPFIM   '@11a69 DS:1e80
IF NOT (V_138e% = 1) THEN GOTO L_11ac2   '@11a85
RT_LPTABRE: RT_LPS " CALCULO DAS ESPESSURAS MINIMAS DAS LAJES": RT_LPFIM   '@11a94 DS:1d1a
RT_LPTABRE: RT_LPS " Laje    H min   x/d    L/f        As        Perm.    Acid.   P Prop.   Total": RT_LPFIM   '@11aa7 DS:1d48
GOTO L_11aed   '@11aba
L_11ac2:
RT_LPTABRE: RT_LPS " IMPOSICAO DAS ESPESSURAS NAS LAJES": RT_LPFIM   '@11ac2 DS:1d9a
RT_LPTABRE: RT_LPS " Laje     H      x/d    L/f        As        Perm.    Acid.   P Prop.   Total": RT_LPFIM   '@11ad5 DS:1dc2
L_11aed:
RT_LPTABRE: RT_LPS RT_STRINGC$((80), (95)): RT_LPFIM   '@11aed
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11b0a DS:1820
L_11b22:
V_137e! = 1.0   '@11b22 DS:187a
L_11b38:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@11b38 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_11b9c   '@11b66 DS:1c28
V_1382! = LEN(V_1390$) + 1   '@11b81
L_11b9c:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@11b9c
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@11bcf
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@11bf1
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_11c64   '@11c13 DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@11c2c DS:1a10
L_11c64:
GOSUB L_11e72   '@11c64
V_137e! = FX##(V_1382!) + 1.0   '@11c71 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_11b38   '@11c87
IF NOT (V_13d8$ = "N") THEN GOTO L_11d0c   '@11cab DS:1c68
PRINT ""   '@11cc2 DS:1820
PRINT " Qualquer Tecla para Continuar ";   '@11cd0 DS:1e86
CALL MIXT_07f1_LimpaTeclado   '@11cde
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@11ce8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
GOTO L_11e41   '@11d04
L_11d0c:
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11d0c DS:1820
RT_LPTABRE: RT_LPS " Fck": RT_LPS STR$(V_0e70!) + " ": RT_LPS V_0de4$: RT_LPS "     Fyk": RT_LPS STR$(V_0e74!) + " ": RT_LPS V_0de4$: RT_LPS " tipo ": RT_LPS V_0e80_tipoaco$: RT_LPS "   Cobrimento": RT_LPS STR$(V_0e84!) + " ": RT_LPS "cm": RT_LPFIM   '@11d1f DS:1e20,1e2c,1e52,1eaa,1eb2
RT_LPTABRE: RT_LPS " CSE": RT_LPS STR$(V_0e28!) + " ": RT_LPS "  CSC": RT_LPS STR$(V_0e2c!) + " ": RT_LPS "  CSA": RT_LPS STR$(V_0e30!) + " "   '@11d98 DS:1ec4,1ecc,1ed6
RT_LPTABRE: RT_LPS "     ": RT_LPS RT_DATE$: RT_LPS "     ": RT_LPS RT_MID$((RT_TIME$), (1), (5)): RT_LPFIM   '@11de9 DS:1ee0
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@11e29
L_11e41:
IF NOT (V_13dc$ = "S") THEN GOTO L_11e65   '@11e41 DS:1c6e
GOSUB L_148c2   '@11e58
L_11e65:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@11e65
' ---- F_11e6d @0x11e6d  (011e6d_F_11e6d.lift.txt; evidence_id (assembly): ev_8ecfa1b3b014caaa5c2c21bb649e8b7ce3c4b2d542958ecf8cc6b0f777f41408)
L_11e72:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010695_FUN_1000_0695, 016337_FUN_1000_6337
V_1386! = V_1376!   '@11e77
L_11e8e:
IF NOT (V_1386! <= V_137a!) THEN GOTO L_13806   '@11e8f
COLOR 3   '@11ea4
LOCATE , 1   '@11eba
PRINT " Aguarde ..";   '@11ed0 DS:1eea
LOCATE , 1   '@11ede
V_0f0c! = 0.0   '@11ef4 DS:1c28
V_138c% = 0   '@11f05
L_11f16:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@11f16 DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_11f6a   '@11f2c DS:1b8a
V_138c% = V_138c% + 1   '@11f61
L_11f6a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF FX##(V_0f0c!) - V_138c% < FX##(V_1386!) THEN GOTO L_11f16   '@11f6a
IF NOT (V_138e% <> 1) THEN GOTO L_11fdd   '@11f8d
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0) = 0.0) THEN GOTO L_11fd8   '@11f9c DS:1c28
GOTO L_137e2   '@11fd0
L_11fd8:
L_11fdd:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_1201a   '@11fdd DS:187a
GOTO L_137e2   '@12012
L_1201a:
CALL S_50187   '@1201a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_4019b   '@12024
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_578ad   '@1202e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
GOSUB L_1382b   '@12038
IF NOT (V_138e% = 4 OR V_138e% = 3) THEN GOTO L_12f5b   '@12045
COLOR 7   '@12069
V_0f1c$ = " \     \ ##.#  "   '@1207f DS:1efa
PRINT USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); RT_PU#(V_13e0!, V_0f1c$, 1);   '@12091
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@120e0
IF NOT (V_13d8$ = "S") THEN GOTO L_12168   '@120fd DS:1c6e
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); RT_PU#(V_13e0!, V_0f1c$, 1);: RT_LPTQUEBRA 0   '@12114
L_12168:
V_0f1c$ = "   ######.##        ######.##    ######.##     ######.##"   '@12168 DS:1f0e
V_1750! = 0.0   '@1217a DS:1c28
V_1758! = -1.0   '@1218b DS:1f4a
V_13e4# = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@1219c
FOR V_0efc# = 1.0# TO V_13e4#   '@121cc DS:1f4e
IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) > 2) THEN GOTO L_1239f   '@121d4
GOSUB L_19c3d   '@12205
IF NOT (FX##(V_1750!) < FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#) THEN GOTO L_122a7   '@12212 DS:1f56
V_1750! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@1225f DS:1f56
L_122a7:
IF NOT (V_1758! = -1.0) THEN GOTO L_12305   '@122a7 DS:1f4a
V_1758! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@122c2 DS:1f56
L_12305:
IF NOT (FX##(V_1758!) > FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#) THEN GOTO L_1239a   '@12305 DS:1f56
V_1758! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@12352 DS:1f56
L_1239a:
L_1239f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0efc#   '@1239f DS:1f4e
IF NOT (V_1758! = -1.0) THEN GOTO L_123f7   '@123cb DS:1f4a
V_1758! = 0.0   '@123e6 DS:1c28
L_123f7:
IF NOT (V_138e% = 3) THEN GOTO L_12923   '@123f7
V_0efc# = 0.0#   '@12406 DS:1f5e
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_12477   '@12417 DS:1c28
V_0efc# = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@1244c
L_12477:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) <= 1.0) THEN GOTO L_126e2   '@12477 DS:187a
PRINT USING V_0f1c$; RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * 100.0#)), V_0f1c$, 1); RT_PU#(RT_DBL#(A_1210!(RT_CINT%(FX##(V_177c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0#) * V_0efc#), V_0f1c$, 2); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1750!), V_0f1c$, 3); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1758!), V_0f1c$, 4)   '@124ac DS:1f66,1f6e
IF NOT (V_13d8$ = "S") THEN GOTO L_126da   '@125b5 DS:1c6e
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * 100.0#)), V_0f1c$, 1); RT_PU#(RT_DBL#(A_1210!(RT_CINT%(FX##(V_177c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0#) * V_0efc#), V_0f1c$, 2); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1750!), V_0f1c$, 3); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1758!), V_0f1c$, 4): RT_LPTQUEBRA 0   '@125cc DS:1f66,1f6e
L_126da:
GOTO L_1291b   '@126da
L_126e2:
PRINT USING V_0f1c$; RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * 100.0#)), V_0f1c$, 1); RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * A_1210!(RT_CINT%(FX##(V_177c!)), 1) * 100.0#)), V_0f1c$, 2); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1750!), V_0f1c$, 3); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1758!), V_0f1c$, 4)   '@126e2 DS:1f66,1f6e
IF NOT (V_13d8$ = "S") THEN GOTO L_12916   '@127ee DS:1c6e
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * 100.0#)), V_0f1c$, 1); RT_PU#(RT_DBL#(V_0efc# / (FX##(V_0dec!) * V_0de8! * A_1210!(RT_CINT%(FX##(V_177c!)), 1) * 100.0#)), V_0f1c$, 2); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1750!), V_0f1c$, 3); RT_PU#(RT_SNG!(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8! * 100.0) * V_1758!), V_0f1c$, 4): RT_LPTQUEBRA 0   '@12805 DS:1f66,1f6e
L_12916:
L_1291b:
GOTO L_12f4e   '@1291b
L_12923:
V_13b4% = 0   '@12923
V_13ec! = 0.0   '@1292e DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_1299f   '@1293f DS:1c28
V_13ec! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@12974
L_1299f:
GOSUB L_14312   '@1299f
IF NOT (V_13f0! >= 0.0) THEN GOTO L_129ef   '@129ac DS:1c28
A_12fc!(0, 0) = V_1398!   '@129c7
GOTO L_12a0f   '@129e7
L_129ef:
A_12fc!(0, 0) = -1.0   '@129ef DS:1f4a
L_12a0f:
V_13b4% = 1   '@12a0f
A_12fc!(0, 2) = 0.0   '@12a1a DS:1c28
V_13ec! = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) * V_1750!   '@12a3a
IF NOT (V_13ec! > 0.0) THEN GOTO L_12afd   '@12a6d DS:1c28
GOSUB L_14312   '@12a88
IF NOT (V_13f0! > 0.0) THEN GOTO L_12ad8   '@12a95 DS:1c28
A_12fc!(0, 2) = V_1398!   '@12ab0
GOTO L_12af8   '@12ad0
L_12ad8:
A_12fc!(0, 2) = -1.0   '@12ad8 DS:1f4a
L_12af8:
L_12afd:
V_1754! = 0.0   '@12afd DS:1c28
V_13ec! = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) * V_1758!   '@12b0e
IF NOT (V_13ec! > 0.0) THEN GOTO L_12bb3   '@12b41 DS:1c28
GOSUB L_14312   '@12b5c
IF NOT (V_13f0! > 0.0) THEN GOTO L_12b9d   '@12b69 DS:1c28
V_1754! = V_1398!   '@12b84
GOTO L_12bae   '@12b95
L_12b9d:
V_1754! = -1.0   '@12b9d DS:1f4a
L_12bae:
L_12bb3:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) <= 1.0) THEN GOTO L_12d1a   '@12bb3 DS:187a
V_13b4% = 0   '@12be8
V_13ec! = 0.0   '@12bf3 DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_12c9c   '@12c04 DS:1c28
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@12c39
L_12c9c:
GOSUB L_14312   '@12c9c
IF NOT (V_13f0! > 0.0) THEN GOTO L_12cef   '@12ca9 DS:1c28
A_12fc!(0, 1) = V_1398!   '@12cc4
GOTO L_12d12   '@12ce7
L_12cef:
A_12fc!(0, 1) = -1.0   '@12cef DS:1f4a
L_12d12:
GOTO L_12e49   '@12d12
L_12d1a:
V_13b4% = 0   '@12d1a
V_13ec! = 0.0   '@12d25 DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_12dce   '@12d36 DS:1c28
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@12d6b
L_12dce:
GOSUB L_14312   '@12dce
IF NOT (V_13f0! > 0.0) THEN GOTO L_12e21   '@12ddb DS:1c28
A_12fc!(0, 1) = V_1398!   '@12df6
GOTO L_12e44   '@12e19
L_12e21:
A_12fc!(0, 1) = -1.0   '@12e21 DS:1f4a
L_12e44:
L_12e49:
PRINT USING V_0f1c$; RT_PU#(A_12fc!(0, 0), V_0f1c$, 1); RT_PU#(A_12fc!(0, 1), V_0f1c$, 2); RT_PU#(A_12fc!(0, 2), V_0f1c$, 3); RT_PU#(V_1754!, V_0f1c$, 4)   '@12e49
IF NOT (V_13d8$ = "S") THEN GOTO L_12f49   '@12ebb DS:1c6e
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(A_12fc!(0, 0), V_0f1c$, 1); RT_PU#(A_12fc!(0, 1), V_0f1c$, 2); RT_PU#(A_12fc!(0, 2), V_0f1c$, 3); RT_PU#(V_1754!, V_0f1c$, 4): RT_LPTQUEBRA 0   '@12ed2
L_12f49:
L_12f4e:
GOTO L_137e2   '@12f4e
L_12f5b:
IF NOT (V_138e% = 2 OR V_13e0! <= V_0f30! AND V_138e% = 1) THEN GOTO L_136b1   '@12f5b
IF NOT (V_138e% = 1) THEN GOTO L_12fd6   '@12f9a
A_12ca%(RT_CINT%(FX##(V_0f0c!))) = RT_CINT%(FX##(V_13e0!))   '@12fa9
L_12fd6:
COLOR 7   '@12fd6
V_0f1c$ = " \     \ "   '@12fec DS:1f72
PRINT USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!)));   '@12ffe
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@13040
V_0f1c$ = "##.#  "   '@1305d DS:1f80
PRINT USING V_0f1c$; RT_PU#(V_13e0!, V_0f1c$, 1);   '@1306f
COLOR 7   '@1308f
IF NOT (V_13f0! > 0.0) THEN GOTO L_13106   '@130a5 DS:1c28
V_0f1c$ = " #.### "   '@130c0 DS:1f8a
PRINT USING V_0f1c$; RT_PU#(RT_SNG!(FX##(V_13f0!) / V_0eec!), V_0f1c$, 1);   '@130d2
GOTO L_13119   '@130fe
L_13106:
PRINT "       ";   '@13106 DS:1f96
L_13119:
V_0f1c$ = "#####   "   '@13119 DS:1fa2
PRINT USING V_0f1c$; RT_PU#(V_13f4!, V_0f1c$, 1);   '@1312b
IF NOT (V_0f18$ <> "NAO") THEN GOTO L_131e3   '@1314b DS:1fae
COLOR 14   '@13162
PRINT "#";   '@13178 DS:1fb6
V_0f1c$ = "##.# c/##.#"   '@13186 DS:1fbc
PRINT USING V_0f1c$; RT_PU#(A_0e8c_bitola!(RT_CINT%(FX##(V_139c!))), V_0f1c$, 1); RT_PU#(V_13f8!, V_0f1c$, 2);   '@13198
GOTO L_13220   '@131db
L_131e3:
IF NOT (V_138e% = 1) THEN GOTO L_13208   '@131e3
PRINT "espac/bitola";   '@131f2 DS:1fcc
GOTO L_1321b   '@13200
L_13208:
PRINT "            ";   '@13208 DS:1fdc
L_1321b:
L_13220:
COLOR 7   '@13220
V_0f1c$ = " ###.##  ####.##  ####.##  ####.##"   '@13236 DS:1fec
PRINT USING V_0f1c$; RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4), V_0f1c$, 1); RT_PU#(RT_SNG!(FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)), V_0f1c$, 2); RT_PU#(RT_SNG!(RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e!), V_0f1c$, 3); RT_PU#(RT_SNG!(FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)), V_0f1c$, 4)   '@13248 DS:1b8a,1f6e
IF NOT (V_13d8$ = "S") THEN GOTO L_136a9   '@1335e DS:1c6e
V_0f1c$ = " \     \ ##.# "   '@13375 DS:2012
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); RT_PU#(V_13e0!, V_0f1c$, 1);: RT_LPTQUEBRA 0   '@13387
IF NOT (V_13f0! > 0.0) THEN GOTO L_13441   '@133db DS:1c28
V_0f1c$ = "  #.### "   '@133f6 DS:2024
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(RT_SNG!(FX##(V_13f0!) / V_0eec!), V_0f1c$, 1);: RT_LPTQUEBRA 0   '@13408
GOTO L_1345e   '@13439
L_13441:
RT_LPTABRE: RT_LPS "       "   '@13441 DS:1f96
L_1345e:
V_0f1c$ = "#####   "   '@1345e DS:1fa2
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(V_13f4!, V_0f1c$, 1);: RT_LPTQUEBRA 0   '@13470
IF NOT (V_0f18$ <> "NAO") THEN GOTO L_13526   '@13495 DS:1fae
RT_LPTABRE: RT_LPS "#"   '@134ac DS:1fb6
V_0f1c$ = "##.# c/##.#"   '@134c4 DS:1fbc
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(A_0e8c_bitola!(RT_CINT%(FX##(V_139c!))), V_0f1c$, 1); RT_PU#(V_13f8!, V_0f1c$, 2);: RT_LPTQUEBRA 0   '@134d6
GOTO L_13577   '@1351e
L_13526:
IF NOT (V_138e% = 1) THEN GOTO L_13555   '@13526
RT_LPTABRE: RT_LPS "espac/bitola"   '@13535 DS:1fcc
GOTO L_13572   '@1354d
L_13555:
RT_LPTABRE: RT_LPS "            "   '@13555 DS:1fdc
L_13572:
L_13577:
V_0f1c$ = " ###.##  ####.##  ####.##  ####.##"   '@13577 DS:1fec
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4), V_0f1c$, 1); RT_PU#(RT_SNG!(FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)), V_0f1c$, 2); RT_PU#(RT_SNG!(RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e!), V_0f1c$, 3); RT_PU#(RT_SNG!(FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)), V_0f1c$, 4): RT_LPTQUEBRA 0   '@13589 DS:1b8a,1f6e
L_136a9:
GOTO L_137dd   '@136a9
L_136b1:
IF NOT (V_138e% = 1) THEN GOTO L_136e1   '@136b1
A_12ca%(RT_CINT%(FX##(V_0f0c!))) = -1   '@136c0
L_136e1:
COLOR 7   '@136e1
V_0f1c$ = " \     \ "   '@136f7 DS:1f72
PRINT USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!)));   '@13709
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1374b
PRINT "   H necessario  >  H maximo configurado"   '@13768 DS:2030
IF NOT (V_13d8$ = "S") THEN GOTO L_137d8   '@13776 DS:1c6e
RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); "   H necessario  >  H maximo configurado": RT_LPTQUEBRA 0   '@1378d DS:2030
L_137d8:
L_137dd:
L_137e2:
V_1386! = FX##(V_1386!) + 1.0   '@137e7 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_11e8e   '@137fd
L_13806:
COLOR 7   '@13806
RETURN   '@1381c
L_1382b:   ' sub-rotina (alvo de GOSUB)
V_1394! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@13830 DS:187a,205c,2060,2066,206a
IF NOT (V_138e% = 1) THEN GOTO L_13d43   '@1388a
V_13fc! = V_0f30!   '@13899
FOR V_13e0! = V_0f2c! TO V_13fc!   '@138ab DS:187a
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@138b2
V_1400! = (FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) / A_1210!(0, 1)   '@138cd DS:1b8a,1f6e
V_1750! = 0.0   '@1395b DS:1c28
V_1404# = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@1396c
FOR V_0efc# = 1.0# TO V_1404#   '@1399c DS:1f4e
IF NOT (A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) > 2) THEN GOTO L_13ac7   '@139a4
GOSUB L_19c3d   '@139ee
IF NOT (FX##(V_1750!) < FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#) THEN GOTO L_13ac2   '@139fb DS:1f56
V_1750! = FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@13a61 DS:1f56
L_13ac2:
L_13ac7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0efc#   '@13ac7 DS:1f4e
V_16d0# = 0.0#   '@13af3 DS:1f5e
V_16e0# = 0.0#   '@13b04 DS:1f5e
V_16d8# = 0.0#   '@13b15 DS:1f5e
IF NOT (V_1750! > 0.0) THEN GOTO L_13c29   '@13b26 DS:1c28
IF NOT (V_1400! > 0.0) THEN GOTO L_13b89   '@13b41 DS:1c28
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8! * V_1750!   '@13b5c DS:1f6e
GOTO L_13bb6   '@13b81
L_13b89:
V_13ec! = ABS(FX##(V_1400!)) * 100.0 * V_0dec! * V_0de8! * V_1750!   '@13b89 DS:1f6e
L_13bb6:
V_13b4% = 1   '@13bb6
GOSUB L_14312   '@13bc1
IF NOT (V_13f0! = -1.0) THEN GOTO L_13bf1   '@13bce DS:1f4a
GOTO L_13d0d   '@13be9
L_13bf1:
V_16d0# = V_13f0!   '@13bf1
V_16e0# = V_139c!   '@13c02
V_16d8# = V_13f8!   '@13c13
L_13c29:
V_13ec! = 0.0   '@13c29 DS:1c28
IF NOT (V_1400! > 0.0) THEN GOTO L_13c75   '@13c3a DS:1c28
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8!   '@13c55 DS:1f6e
L_13c75:
V_13b4% = 0   '@13c75
GOSUB L_14312   '@13c80
IF NOT (V_13f0! <> -1.0) THEN GOTO L_13d08   '@13c8d DS:1f4a
IF NOT (FX##(V_13f0!) < FX##(V_16d0#)) THEN GOTO L_13cfb   '@13ca8
V_13f0! = V_16d0#   '@13cc3
V_139c! = V_16e0#   '@13cd4
V_13f8! = V_16d8#   '@13ce5
L_13cfb:
GOTO L_13d3e   '@13cfb
L_13d08:
L_13d0d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_13e0!   '@13d12 DS:187a
L_13d3e:
L_13d43:
IF NOT (V_138e% = 4 OR (V_138e% = 3 OR V_138e% = 2)) THEN GOTO L_14303   '@13d43
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@13d74
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@13d9e
V_1400! = (FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) / A_1210!(0, 1)   '@13db9 DS:1b8a,1f6e
V_13ec! = 0.0   '@13e47 DS:1c28
IF NOT (V_1400! > 0.0) THEN GOTO L_13e93   '@13e58 DS:1c28
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8!   '@13e73 DS:1f6e
L_13e93:
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8!   '@13e93 DS:1f6e
IF NOT (V_138e% = 4 OR V_138e% = 3) THEN GOTO L_13efb   '@13ecd
RETURN   '@13ef1
L_13efb:
V_13b4% = 0   '@13efb
GOSUB L_14312   '@13f06
V_16d0# = 0.0#   '@13f13 DS:1f5e
V_16e0# = 0.0#   '@13f24 DS:1f5e
V_16d8# = 0.0#   '@13f35 DS:1f5e
IF NOT (V_1400! > 0.0 AND V_13f0! <= 0.0) THEN GOTO L_13fcd   '@13f46 DS:1c28
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 0.0   '@13f84 DS:1c28
V_0f18$ = "NAO"   '@13fac DS:1fae
RETURN   '@13fbe
L_13fcd:
V_16d0# = V_13f0!   '@13fcd
V_16e0# = V_139c!   '@13fde
V_16d8# = V_13f8!   '@13fef
V_1750! = 0.0   '@14000 DS:1c28
V_140c# = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@14011
FOR V_0efc# = 1.0# TO V_140c#   '@14041 DS:1f4e
IF NOT (A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) > 2) THEN GOTO L_1416b   '@14048
GOSUB L_19c3d   '@14092
IF NOT (FX##(V_1750!) < FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#) THEN GOTO L_14166   '@1409f DS:1f56
V_1750! = FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@14105 DS:1f56
L_14166:
L_1416b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0efc#   '@1416b DS:1f4e
IF NOT (V_1750! > 0.0) THEN GOTO L_142fe   '@14197 DS:1c28
IF NOT (V_1400! > 0.0) THEN GOTO L_141fa   '@141b2 DS:1c28
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8! * V_1750!   '@141cd DS:1f6e
GOTO L_14227   '@141f2
L_141fa:
V_13ec! = ABS(FX##(V_1400!)) * 100.0 * V_0dec! * V_0de8! * V_1750!   '@141fa DS:1f6e
L_14227:
V_13b4% = 1   '@14227
GOSUB L_14312   '@14232
IF NOT (V_13f0! = -1.0) THEN GOTO L_142a6   '@1423f DS:1f4a
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0   '@1425a DS:1c28
V_0f18$ = "NAO"   '@14285 DS:1fae
RETURN   '@14297
L_142a6:
IF NOT (FX##(V_13f0!) < FX##(V_16d0#)) THEN GOTO L_142f9   '@142a6
V_13f0! = V_16d0#   '@142c1
V_139c! = V_16e0#   '@142d2
V_13f8! = V_16d8#   '@142e3
L_142f9:
L_142fe:
L_14303:
RETURN   '@14303
L_14312:   ' sub-rotina (alvo de GOSUB); entrada vinda de 017486_F_17486
IF NOT (RT_POT##((80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c!), (2.0)) < 108.8000030517578125## * V_0df0! * V_0e70! * V_13ec! * V_0e28! / V_0e2c!) THEN GOTO L_1438b   '@14317 DS:1b8a,206e,2072,2076
V_13f0! = -1.0   '@14370 DS:1f4a
RETURN   '@14381
L_1438b:
V_13f0! = (80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c! - RT_SQR##(RT_POT##((80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c!), (2.0)) - 108.8000030517578125## * V_0df0! * V_0e70! * V_13ec! * V_0e28! / V_0e2c!)) / (FX##(V_0e70!) * V_0df0! * 54.40000152587890625##) * V_0e2c!   '@1438b DS:1b8a,206e,2072,2076,207a
IF NOT (FX##(V_13f0!) / V_0eec! > FX##(V_1394!)) THEN GOTO L_14458   '@1441d
V_13f0! = -1.0   '@1443d DS:1f4a
RETURN   '@1444e
L_14458:
V_1398! = 80.0 / (FX##(V_0e2c!) * V_0df0! * V_0e74!) * V_13f0! * 0.85000002384185791015625## * V_0df0! * V_0e70! * V_0e30!   '@14458 DS:2072,2076
IF NOT (V_13b4% = 0) THEN GOTO L_144d6   '@14494
V_1414! = FX##(V_0f72!) * V_13e0!   '@144a3
CALL MIXT_082a_Maior(V_1398!, V_1414!, V_1418!)   '@144b9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_1398! = V_1418!   '@144cb
L_144d6:
IF NOT (V_13b4% = 1) THEN GOTO L_1454e   '@144d6
IF NOT (V_0f86! < 1.0) THEN GOTO L_14516   '@144e5 DS:187a
V_1398! = FX##(V_1398!) / V_0f86!   '@14500
L_14516:
V_141c! = FX##(V_0f76!) * V_13e0!   '@14516
CALL MIXT_082a_Maior(V_1398!, V_141c!, V_1420!)   '@1452c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_1398! = V_1420!   '@1453e
L_1454e:
V_0f18$ = ""   '@1454e DS:1820
IF NOT (V_138e% = 4) THEN GOTO L_14579   '@14560
RETURN   '@1456f
L_14579:
V_1424! = A_126e!(0, 0)   '@14579
FOR V_0f04! = 1.0 TO V_1424!   '@1459a DS:187a
V_139c! = A_126e!(RT_CINT%(FX##(V_0f04!)), 1)   '@145a2
IF NOT (A_126e!(RT_CINT%(FX##(V_0f04!)), 0) >= V_13e0!) THEN GOTO L_14609   '@145cd
GOTO L_14635   '@14601
L_14609:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@14609 DS:187a
L_14635:
L_1463a:
FOR V_0f04! = A_129c_espacamento!(0) TO 1.0 STEP -1.0   '@1463f DS:187a,1f4a
V_1778! = 0.0   '@1465a DS:1c28
L_14670:
IF NOT (A_0f34!(RT_CINT%(FX##(V_1778!)), 0) < V_13e0!) THEN GOTO L_146bc   '@14671
V_1778! = FX##(V_1778!) + 1.0   '@1469f DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_14670   '@146b5
L_146bc:
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0f04!))) < A_0f34!(RT_CINT%(FX##(V_1778!)), 1)) THEN GOTO L_14720   '@146bc
V_0f04! = 0.0   '@14707 DS:1c28
GOTO L_14848   '@14718
L_14720:
IF NOT (FX##(A_0eba_areabarra!(RT_CINT%(FX##(V_139c!)))) / A_129c_espacamento!(RT_CINT%(FX##(V_0f04!))) * 100.0 >= FX##(V_1398!)) THEN GOTO L_1481c   '@14720 DS:1f6e
L_BP0c% = (V_0f66$ = "N")   '@14771 DS:1c68
IF NOT ((FX##(A_129c_espacamento!(RT_CINT%(FX##(V_0f04!)))) <= 2.0 * FX##(V_13e0!) AND V_0f66$ = "S" OR L_BP0c%) <> 0) THEN GOTO L_14817   '@14796 DS:1b8a,1c6e
V_13f8! = A_129c_espacamento!(RT_CINT%(FX##(V_0f04!)))   '@147e3
GOTO L_14848   '@1480a
L_14817:
L_1481c:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@1481c DS:187a,1f4a
L_14848:
IF NOT (V_0f04! = 0.0) THEN GOTO L_148b3   '@14848 DS:1c28
V_139c! = FX##(V_139c!) + 1.0   '@14863 DS:187a
IF NOT (V_139c! < 10.0) THEN GOTO L_1489c   '@14879 DS:187e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1463a   '@14894
L_1489c:
V_0f18$ = "NAO"   '@1489c DS:1fae
L_148b3:
RETURN   '@148b3
L_148c2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010695_FUN_1000_0695
RT_VIEWPRINT 1, 25   '@148c7
V_1428$ = V_0dcc_placa$   '@148d9
IF NOT (V_1428$ = "HER") THEN GOTO L_14975   '@148eb DS:207e
RT_SCREEN 3   '@14902
V_13a8! = 7.0   '@14918 DS:2086
V_13ac! = 7.0   '@14929 DS:2086
V_13b0! = 0.0   '@1493a DS:1c28
V_13a0! = 4.5   '@1494b DS:208a
V_13a4! = 4.0   '@1495c DS:208e
GOTO L_14ab6   '@1496d
L_14975:
IF NOT (V_1428$ <> "CGA") THEN GOTO L_14999   '@14975 DS:2092
IF NOT (V_1428$ = "MCG") THEN GOTO L_14a09   '@14987 DS:209a
L_14999:
RT_SCREEN 2   '@14999
V_13a8! = 15.0   '@149ac DS:1882
V_13ac! = 15.0   '@149bd DS:1882
V_13b0! = 0.0   '@149ce DS:1c28
V_13a0! = 4.0   '@149df DS:208e
V_13a4! = 4.0   '@149f0 DS:208e
GOTO L_14ab6   '@14a01
L_14a09:
IF NOT (V_1428$ <> "EGA") THEN GOTO L_14a2d   '@14a09 DS:20a2
IF NOT (V_1428$ = "VGA") THEN GOTO L_14ab6   '@14a1b DS:20aa
L_14a2d:
RT_SCREEN 9   '@14a2d
COLOR , 1   '@14a43
V_13a8! = 14.0   '@14a59 DS:20b2
V_13ac! = 15.0   '@14a6a DS:1882
V_13b0! = 1.0   '@14a7b DS:187a
V_13a0! = 4.0   '@14a8c DS:208e
V_13a4! = 4.0   '@14a9d DS:208e
GOTO L_14ab6   '@14aae
L_14ab6:
V_1808! = A_0f8a!(1, 1)   '@14ab6
V_180c! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@14ad7
V_1810! = A_0f8a!(1, 0)   '@14b14
V_1814! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@14b37
V_1818! = 560.0 / (FX##(V_180c!) - V_1808!)   '@14b70 DS:20b6
V_181c! = 145.0 / (FX##(V_1814!) - V_1810!)   '@14b8e DS:20ba
IF NOT (FX##(V_181c!) / V_1818! > 0.41670000553131103515625##) THEN GOTO L_14bea   '@14bac DS:20be
V_181c! = V_1818! * 0.41670000553131103515625##   '@14bcc DS:20be
GOTO L_14c05   '@14be2
L_14bea:
V_1818! = V_181c! / 0.41670000553131103515625##   '@14bea DS:20be
L_14c05:
RT_CLS -1   '@14c05
RT_WINDOW 1, (0), (0), (639), (199)   '@14c13 DS:1c28,1c2a,20c2,20c4,20c6,20c8 (B$WIND decodificado)
V_1800! = 45.0   '@14c41 DS:20ca
V_1804! = 10.0   '@14c52 DS:187e
V_142c! = A_0fb8!(0, 0)   '@14c63
FOR V_0f10! = 1.0 TO V_142c!   '@14c84 DS:187a
RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@14c8c DS:20ce
RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 72, RT_CINT%(FX##(V_13a8!)), 17476   '@14d12 DS:20ce
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f10!   '@14da8 DS:187a
V_1430! = A_1042!(0, 0)   '@14dd4
FOR V_0f10! = 1.0 TO V_1430!   '@14df5 DS:187a
RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@14dfc DS:20ce
RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(V_13ac!)), 0   '@14e82 DS:20ce
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f10!   '@14f18 DS:187a
V_138a% = 1   '@14f44
V_138c% = 0   '@14f4f
L_14f60:
IF NOT (A_10cc!(V_138a%, 1) = 2.0) THEN GOTO L_14f9f   '@14f60 DS:1b8a
V_138c% = V_138c% + 1   '@14f8e
GOTO L_152f4   '@14f97
L_14f9f:
V_0ef4# = A_10cc!(V_138a%, 6)   '@14f9f
V_0efc# = A_10cc!(V_138a%, 7)   '@14fc3
V_0f18$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(V_138a% - V_138c% + FX##(V_0e54_nivellaje!))))   '@14fe7
V_1434! = V_1800! - FX##(LEN(V_0f18$)) * V_13a0! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@15026
V_1438! = FX##(V_13a4!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@15066 DS:20d2
V_143c$ = "CGA"   '@15093 DS:2092
CALL MIXT_08c4_TextoGrafico(V_1434!, V_1438!, V_0f18$, V_143c$)   '@150a0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
' @150b5 libera strings locais (V_143c)
V_0f18$ = ""   '@150be DS:1820
IF NOT (A_12ca%(V_138a%) > 0 AND V_138e% = 1) THEN GOTO L_15136   '@150d0
V_0f18$ = LTRIM$(STR$(A_12ca%(V_138a%)))   '@15109
L_15136:
IF NOT (V_138e% = 2) THEN GOTO L_151ab   '@15136
IF NOT (A_12fc!(V_138a%, 0) > 0.0) THEN GOTO L_151a6   '@15145 DS:1c28
V_0f18$ = LTRIM$(STR$(A_12fc!(V_138a%, 0)))   '@15172
L_151a6:
L_151ab:
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@151ab DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_151fb   '@151d0 DS:20aa
COLOR 14   '@151e5
L_151fb:
V_1440! = V_1800! - FX##(LEN(V_0f18$)) * V_13a0! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@151fb
V_1444! = 2.5 * FX##(V_13a4!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@1523b DS:20d2,20da
V_1448$ = "CGA"   '@1526d DS:2092
CALL MIXT_08c4_TextoGrafico(V_1440!, V_1444!, V_0f18$, V_1448$)   '@1527a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
' @1528f libera strings locais (V_1448)
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@15298 DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_152ef   '@152bd DS:20aa
COLOR RT_CINT%(FX##(V_13ac!))   '@152d2
L_152ef:
L_152f4:
V_138a% = V_138a% + 1   '@152f4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (A_109e%(0, 0) < V_138a%) THEN GOTO L_14f60   '@152fd
LOCATE 22, 1   '@1531e
PRINT " "; V_0dd8$   '@15339 DS:1e80
IF NOT (V_138e% = 1) THEN GOTO L_1536d   '@15350
PRINT " ESPESSURAS MINIMAS"   '@1535f DS:20de
L_1536d:
IF NOT (V_138e% = 2) THEN GOTO L_1538a   '@1536d
PRINT " ESPESSURAS IMPOSTAS"   '@1537c DS:20f6
L_1538a:
PRINT " OBRA "; V_0e24$;   '@1538a DS:210e
IF NOT (V_13d8$ = "S") THEN GOTO L_15403   '@153a1 DS:1c6e
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@153b8
RT_ROTINA_0AEA   '@153cb (rotina em assembly ligada ao EXE (SUB_70aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@153d5 DS:1820
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@153e8
GOTO L_1542e   '@153fb
L_15403:
CALL MIXT_07f1_LimpaTeclado   '@15403
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1540d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_1542e:
RT_SCREEN 0   '@1542e
RT_VIEWPRINT 1, 25   '@15443
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@15455
RT_CLS 2   '@15490
RETURN   '@1549e
L_154ad:   ' entrada vinda de 010695_FUN_1000_0695
IF NOT (V_12f8% = 0) THEN GOTO L_154c9   '@154b2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@154c1
L_154c9:
V_138e% = 2   '@154c9
RT_VIEWPRINT 1, 25   '@154d4
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@154e6
RT_CLS 2   '@15512
PRINT RT_STRINGC$((80), (205))   '@15520
PRINT " Imposicao das Espessuras das Lajes"   '@15538 DS:2118
PRINT RT_STRINGC$((80), (205))   '@15546
IF NOT (V_12fa% = 0) THEN GOTO L_155bc   '@1555e
REDIM A_12fc!(-32768 TO -32768, -32768 TO -32768)   '@1556d
REDIM A_12fc!(0 TO A_109e%(0, 0), 0 TO 3)   '@1557b
V_12fa% = 1   '@155ac
L_155bc:
V_138a% = 1   '@155bc
V_138c% = 0   '@155c7
L_155d8:
IF NOT (A_10cc!(V_138a%, 1) = 2.0) THEN GOTO L_1560f   '@155d8 DS:1b8a
V_138c% = V_138c% + 1   '@15606
L_1560f:
V_138a% = V_138a% + 1   '@1560f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_138a% THEN GOTO L_155d8   '@15618
V_138a% = A_109e%(0, 0) - V_138c%   '@15636
RT_VIEWPRINT 6, 25   '@1565f
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@15671
RT_CLS 2   '@1568e
PRINT " Arquivadas"; V_138a%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@1569c DS:187a,1b8e,1b9e
IF NOT (V_138a% > 1) THEN GOTO L_15738   '@156ea
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)));   '@156f9 DS:1bac
L_15738:
PRINT " )"   '@15738 DS:1bb4
V_1390$ = ""   '@15746 DS:1820
L_1575d:
COLOR 7   '@15762
RT_VIEWPRINT 8, 20   '@15778
RT_CLS 2   '@1578a
PRINT " Espessura a ser Imposta em um grupo de Lajes (H em cm) *FIM* ";   '@15798 DS:2140
CALL MIXT_07f1_LimpaTeclado   '@157a6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@157b0 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_157e7   '@157ca
GOTO L_1604a   '@157df
L_157e7:
V_13e0! = VAL(V_0f18$)   '@157e7
L_BP0c% = (V_13e0! > V_0f30! OR V_13e0! < V_0f2c!)   '@15801
IF NOT ((INT(FX##(V_13e0!)) <> FX##(V_13e0!) OR L_BP0c%) <> 0) THEN GOTO L_15875   '@15847
BEEP   '@15863
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1575d   '@1586d
L_15875:
L_1587a:
RT_VIEWPRINT 10, 20   '@1587f
RT_CLS 2   '@15891
COLOR 7   '@1589f
PRINT " Numero das Lajes que serao Impostas as Espessuras"   '@158b5 DS:2182
PRINT " I/J/N a M/.../K  *RETORNA* ";   '@158c3 DS:21b8
CALL MIXT_07f1_LimpaTeclado   '@158d1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@158db DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_15912   '@158f5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1575d   '@1590a
L_15912:
V_0f20$ = UCASE$(V_0f18$)   '@15912
V_137e! = 1.0   '@1592a DS:187a
L_15940:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_0f20$), ("/"))   '@15940 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_159a4   '@1596e DS:1c28
V_1382! = LEN(V_0f20$) + 1   '@15989
L_159a4:
V_0f18$ = RT_MID$((V_0f20$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@159a4
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@159d7
IF NOT ((FX##(VAL(V_0f18$)) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_15a4d   '@15a12
V_0f18$ = "*"   '@15a33 DS:1c2c
GOTO L_15ba4   '@15a45
L_15a4d:
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_15b6a   '@15a4d DS:1a10
L_BP0c% = (FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) <= FX##(V_0e54_nivellaje!))   '@15a66 DS:1a10
IF NOT ((FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_15b08   '@15abc DS:1a10
V_0f18$ = "*"   '@15aee DS:1c2c
GOTO L_15ba4   '@15b00
L_15b08:
IF NOT (VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1))) <= VAL(V_0f18$)) THEN GOTO L_15b65   '@15b08 DS:1a10
V_0f18$ = "*"   '@15b4b DS:1c2c
GOTO L_15ba4   '@15b5d
L_15b65:
L_15b6a:
V_137e! = FX##(V_1382!) + 1.0   '@15b6a DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_0f20$) <= V_1382!) THEN GOTO L_15940   '@15b80
L_15ba4:
IF NOT (V_0f18$ = "*") THEN GOTO L_15bcd   '@15ba4 DS:1c2c
BEEP   '@15bbb
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1587a   '@15bc5
L_15bcd:
V_137e! = 1.0   '@15bcd DS:187a
L_15be4:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_0f20$), ("/"))   '@15be4 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_15c48   '@15c12 DS:1c28
V_1382! = LEN(V_0f20$) + 1   '@15c2d
L_15c48:
V_0f18$ = RT_MID$((V_0f20$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@15c48
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@15c7b
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@15c9d
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_15d10   '@15cbf DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@15cd8 DS:1a10
L_15d10:
V_144c! = V_137a!   '@15d10
FOR V_1778! = V_1376! TO V_144c!   '@15d22 DS:187a
V_0f0c! = 0.0   '@15d2a DS:1c28
V_138c% = 0   '@15d3b
L_15d4c:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@15d4c DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_15da0   '@15d62 DS:1b8a
V_138c% = V_138c% + 1   '@15d97
L_15da0:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF FX##(V_0f0c!) - V_138c% < FX##(V_1778!) THEN GOTO L_15d4c   '@15da0
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 3.0 OR A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0) THEN GOTO L_15f32   '@15dc3 DS:1c28,21d8
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0) = V_13e0!   '@15e37
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0   '@15e61 DS:1c28
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 0.0   '@15e8c DS:1c28
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 0.0   '@15eb4 DS:1c28
A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5) = RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e!   '@15edf DS:1b8a,1f6e
L_15f32:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_1778!   '@15f32 DS:187a
V_137e! = FX##(V_1382!) + 1.0   '@15f5e DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_0f20$) <= V_1382!) THEN GOTO L_15be4   '@15f74
RT_VIEWPRINT 20, 25   '@15f98
COLOR 3   '@15faa
RT_CLS 2   '@15fc0
PRINT " Ultima Espessura Fornecida"   '@15fce DS:21dc
PRINT " H ="; V_13e0!; "cm"   '@15fdc DS:1e52,21fc
PRINT " Lajes "; V_0f20$   '@16000 DS:2204
V_1390$ = V_1390$ + V_0f20$ + "/"   '@16017 DS:1c22
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1575d   '@1603d
L_1604a:
IF NOT (LEN(V_1390$) = 0) THEN GOTO L_160eb   '@1604f
V_1390$ = LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)))   '@16064 DS:187a
IF NOT (V_138a% > 1) THEN GOTO L_160e6   '@16092
V_1390$ = V_1390$ + " A " + LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)))   '@160a1 DS:1c1a
L_160e6:
L_160eb:
RT_VIEWPRINT 8, 25   '@160eb
COLOR 7   '@160fd
RT_CLS 2   '@16113
LOCATE 9, 1   '@16121
PRINT " Imprimo Relatorio com Espessuras Impostas  S/*N* ";   '@1613c DS:2210
CALL MIXT_07f1_LimpaTeclado   '@1614a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@16154 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13d8$ = "N"   '@1616e DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_161af   '@16180 DS:1c6e
V_13d8$ = "S"   '@1619d DS:1c6e
L_161af:
LOCATE 10, 1   '@161af
PRINT " Visualizo todo o painel com as Espessuras Impostas  S/*N* ";   '@161ca DS:2246
CALL MIXT_07f1_LimpaTeclado   '@161d8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@161e2 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13dc$ = "N"   '@161fc DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_1623d   '@1620e DS:1c6e
V_13dc$ = "S"   '@1622b DS:1c6e
L_1623d:
PRINT " Dados Corretos N/*S* ";   '@1623d DS:1cb2
CALL MIXT_07f1_LimpaTeclado   '@1624b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@16255 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_16294   '@1626f DS:1c68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1628c
L_16294:
IF NOT (V_13d8$ = "S") THEN GOTO L_162e2   '@16294 DS:1c6e
PRINT " Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario ";   '@162ab DS:1ccc
CALL MIXT_07f1_LimpaTeclado   '@162b9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@162c3 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_162e2:
IF NOT (RT_RIGHT$((V_1390$), (1)) = "/") THEN GOTO L_1632a   '@162e2 DS:1c22
V_1390$ = RT_MID$((V_1390$), (1), (LEN(V_1390$) - 1))   '@16303
L_1632a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1185f   '@1632a
' ---- FUN_1000_6337 @0x16337  (016337_FUN_1000_6337.lift.txt; evidence_id (assembly): ev_992a37a48b3d3eac9f18e5bb5ea323f1485e65aecbb0fd303f7b9f7d86d96e9d)
L_16337:   ' entrada vinda de 010695_FUN_1000_0695
IF NOT (V_12fa% = 0) THEN GOTO L_16353   '@1633c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1634b
L_16353:
RT_VIEWPRINT 1, 25   '@16353
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@16365
RT_CLS 2   '@16391
PRINT RT_STRINGC$((80), (205))   '@1639f
PRINT " Momentos Atuantes e Armadura Necessaria nas Lajes"   '@163b7 DS:2286
PRINT RT_STRINGC$((80), (205))   '@163c5
V_138a% = 1   '@163dd
V_138c% = 0   '@163e8
L_163f8:
IF NOT (A_10cc!(V_138a%, 1) = 2.0) THEN GOTO L_1642f   '@163f8 DS:1b8a
V_138c% = V_138c% + 1   '@16426
L_1642f:
V_138a% = V_138a% + 1   '@1642f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_138a% THEN GOTO L_163f8   '@16438
V_138a% = A_109e%(0, 0) - V_138c%   '@16456
L_1647a:
RT_VIEWPRINT 6, 25   '@1647f
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@16491
RT_CLS 2   '@164ae
PRINT " Arquivadas"; V_138a%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@164bc DS:187a,1b8e,1b9e
IF NOT (V_138a% > 1) THEN GOTO L_16558   '@1650a
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)));   '@16519 DS:1bac
L_16558:
PRINT " )"   '@16558 DS:1bb4
COLOR 7   '@16566
PRINT " Numero das Lajes que serao Listados os Momentos/Armaduras"   '@1657c DS:22bc
PRINT " I/J/N a M/.../K  *TODAS* ";   '@1658a DS:1bfc
CALL MIXT_07f1_LimpaTeclado   '@16598
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@165a2 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_1665b   '@165bc
V_1390$ = LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)))   '@165d1 DS:187a
IF NOT (V_138a% > 1) THEN GOTO L_16653   '@165ff
V_1390$ = V_1390$ + " A " + LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)))   '@1660e DS:1c1a
L_16653:
GOTO L_16678   '@16653
L_1665b:
V_1390$ = UCASE$(V_0f18$)   '@1665b
L_16678:
V_137e! = 1.0   '@16678 DS:187a
L_1668e:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@1668e DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_166f2   '@166bc DS:1c28
V_1382! = LEN(V_1390$) + 1   '@166d7
L_166f2:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@166f2
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@16725
IF NOT ((FX##(VAL(V_0f18$)) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_1679b   '@16760
V_0f18$ = "*"   '@16781 DS:1c2c
GOTO L_168f2   '@16793
L_1679b:
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_168b8   '@1679b DS:1a10
L_BP0c% = (FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) <= FX##(V_0e54_nivellaje!))   '@167b4 DS:1a10
IF NOT ((FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_16856   '@1680a DS:1a10
V_0f18$ = "*"   '@1683c DS:1c2c
GOTO L_168f2   '@1684e
L_16856:
IF NOT (VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1))) <= VAL(V_0f18$)) THEN GOTO L_168b3   '@16856 DS:1a10
V_0f18$ = "*"   '@16899 DS:1c2c
GOTO L_168f2   '@168ab
L_168b3:
L_168b8:
V_137e! = FX##(V_1382!) + 1.0   '@168b8 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_1668e   '@168ce
L_168f2:
IF NOT (V_0f18$ = "*") THEN GOTO L_1691b   '@168f2 DS:1c2c
BEEP   '@16909
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1647a   '@16913
L_1691b:
LOCATE 9, 1   '@1691b
PRINT " Imprimo Relatorio com Momentos/Armaduras  S/*N* ";   '@16936 DS:22fa
CALL MIXT_07f1_LimpaTeclado   '@16944
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@1694e DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13d8$ = "N"   '@16968 DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_169a9   '@1697a DS:1c6e
V_13d8$ = "S"   '@16997 DS:1c6e
L_169a9:
LOCATE 10, 1   '@169a9
PRINT " Visualizo todo o painel com os Momentos/Armaduras  S/*N* ";   '@169c4 DS:2330
CALL MIXT_07f1_LimpaTeclado   '@169d2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@169dc DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13dc$ = "N"   '@169f6 DS:1c68
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_16ab8   '@16a08 DS:1c6e
LOCATE 11, 1   '@16a25
PRINT " Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada ";   '@16a40 DS:236e
CALL MIXT_07f1_LimpaTeclado   '@16a4e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@16a58 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13dc$ = "ST"   '@16a72 DS:23aa
IF NOT (UCASE$(V_0f18$) = "I") THEN GOTO L_16ab3   '@16a84 DS:19d2
V_13dc$ = "SI"   '@16aa1 DS:23b0
L_16ab3:
L_16ab8:
LOCATE 13, 1   '@16ab8
PRINT " "   '@16ad3 DS:1e80
PRINT " Deseja Visualizar  <*1*> Momentos e Armaduras   <2> Momentos   <3> Armaduras "   '@16ae1 DS:23b6
CALL MIXT_07f1_LimpaTeclado   '@16aef
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@16af9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_BP0c% = (V_0f18$ <> "2")   '@16b15 DS:1ada
IF NOT ((V_0f18$ <> "3" AND L_BP0c%) <> 0) THEN GOTO L_16b61   '@16b3a DS:1ae6
V_0f18$ = "1"   '@16b4f DS:1ace
L_16b61:
V_13b6% = RT_CINT%(FX##(VAL(V_0f18$)))   '@16b61
PRINT " Dados Corretos N/*S* ";   '@16b7c DS:1cb2
CALL MIXT_07f1_LimpaTeclado   '@16b8a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@16b94 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_16bd3   '@16bae DS:1c68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@16bcb
L_16bd3:
IF NOT (V_13d8$ = "S") THEN GOTO L_16c21   '@16bd3 DS:1c6e
PRINT " Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario ";   '@16bea DS:1ccc
CALL MIXT_07f1_LimpaTeclado   '@16bf8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@16c02 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_16c21:
V_138e% = 3   '@16c21
IF NOT (V_13b6% = 3) THEN GOTO L_16c46   '@16c2c
V_138e% = 4   '@16c3b
L_16c46:
L_16c4b:
IF NOT (V_138e% = 3) THEN GOTO L_16eab   '@16c50
RT_VIEWPRINT 1, 25   '@16c5f
RT_CLS 2   '@16c71
PRINT ""   '@16c7f DS:1820
PRINT " MOMENTOS ATUANTES NAS LAJES"   '@16c8d DS:2408
PRINT " Laje     H       M+ principal    M+ secundario    M- maior      M- menor"   '@16c9b DS:2428
PRINT RT_STRINGC$((80), (95))   '@16ca9
LOCATE 24, 1   '@16cc1
COLOR 3   '@16cdc
PRINT "    Fck"; V_0e70!; V_0de4$; "     Fyk"; V_0e74!; V_0de4$; " tipo "; V_0e80_tipoaco$; "             Cobrimento"; V_0e84!; "cm"   '@16cf2 DS:1e14,1e20,1e2c,1e36,1e52
PRINT "    CSE"; V_0e28!; "      CSC"; V_0e2c!; "      CSA"; V_0e30!;   '@16d66 DS:1e58,1e64,1e72
RT_VIEWPRINT 6, 22   '@16dad
IF NOT (V_13d8$ = "S") THEN GOTO L_16ea3   '@16dbf DS:1c6e
IF NOT (V_0f18$ <> "*") THEN GOTO L_16e06   '@16dd6 DS:1c2c
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@16ded
L_16e06:
RT_LPTABRE: RT_LPS V_0e0c$: RT_LPFIM   '@16e06
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@16e19
RT_LPTABRE: RT_LPS " ": RT_LPS V_0dd8$: RT_LPFIM   '@16e2c DS:1e80
RT_LPTABRE: RT_LPS " MOMENTOS ATUANTES NAS LAJES": RT_LPFIM   '@16e48 DS:2408
RT_LPTABRE: RT_LPS " Laje     H       M+ principal    M+ secundario    M- maior      M- menor": RT_LPFIM   '@16e5b DS:2428
RT_LPTABRE: RT_LPS RT_STRINGC$((80), (95)): RT_LPFIM   '@16e6e
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@16e8b DS:1820
L_16ea3:
GOTO L_170f4   '@16ea3
L_16eab:
RT_VIEWPRINT 1, 25   '@16eab
RT_CLS 2   '@16ebd
PRINT ""   '@16ecb DS:1820
PRINT " ARMADURAS NAS LAJES"   '@16ed9 DS:2476
PRINT " Laje     H      As+ principal   As+ secundario   As- maior     As- menor"   '@16ee7 DS:248e
PRINT RT_STRINGC$((80), (95))   '@16ef5
LOCATE 24, 1   '@16f0d
COLOR 3   '@16f28
PRINT "    Fck"; V_0e70!; V_0de4$; "     Fyk"; V_0e74!; V_0de4$; " tipo "; V_0e80_tipoaco$; "             Cobrimento"; V_0e84!; "cm"   '@16f3e DS:1e14,1e20,1e2c,1e36,1e52
PRINT "    CSE"; V_0e28!; "      CSC"; V_0e2c!; "      CSA"; V_0e30!;   '@16fb2 DS:1e58,1e64,1e72
RT_VIEWPRINT 6, 22   '@16ff9
IF NOT (V_13d8$ = "S") THEN GOTO L_170ef   '@1700b DS:1c6e
IF NOT (V_0f18$ <> "*") THEN GOTO L_17052   '@17022 DS:1c2c
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@17039
L_17052:
RT_LPTABRE: RT_LPS V_0e0c$: RT_LPFIM   '@17052
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@17065
RT_LPTABRE: RT_LPS " ": RT_LPS V_0dd8$: RT_LPFIM   '@17078 DS:1e80
RT_LPTABRE: RT_LPS " ARMADURAS NAS LAJES": RT_LPFIM   '@17094 DS:2476
RT_LPTABRE: RT_LPS " Laje     H      As+ principal   As+ secundario   As- maior     As- menor": RT_LPFIM   '@170a7 DS:248e
RT_LPTABRE: RT_LPS RT_STRINGC$((80), (95)): RT_LPFIM   '@170ba
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@170d7 DS:1820
L_170ef:
L_170f4:
V_137e! = 1.0   '@170f4 DS:187a
L_1710a:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@1710a DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_1716e   '@17138 DS:1c28
V_1382! = LEN(V_1390$) + 1   '@17153
L_1716e:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@1716e
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@171a1
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@171c3
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_17236   '@171e5 DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@171fe DS:1a10
L_17236:
GOSUB L_11e72   '@17236
V_137e! = FX##(V_1382!) + 1.0   '@17243 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_1710a   '@17259
IF NOT (V_13d8$ = "N") THEN GOTO L_172de   '@1727d DS:1c68
PRINT ""   '@17294 DS:1820
PRINT " Qualquer Tecla para Continuar ";   '@172a2 DS:1e86
CALL MIXT_07f1_LimpaTeclado   '@172b0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@172ba
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
GOTO L_17413   '@172d6
L_172de:
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@172de DS:1820
RT_LPTABRE: RT_LPS " Fck": RT_LPS STR$(V_0e70!) + " ": RT_LPS V_0de4$: RT_LPS "     Fyk": RT_LPS STR$(V_0e74!) + " ": RT_LPS V_0de4$: RT_LPS " tipo ": RT_LPS V_0e80_tipoaco$: RT_LPS "   Cobrimento": RT_LPS STR$(V_0e84!) + " ": RT_LPS "cm": RT_LPFIM   '@172f1 DS:1e20,1e2c,1e52,1eaa,1eb2
RT_LPTABRE: RT_LPS " CSE": RT_LPS STR$(V_0e28!) + " ": RT_LPS "  CSC": RT_LPS STR$(V_0e2c!) + " ": RT_LPS "  CSA": RT_LPS STR$(V_0e30!) + " "   '@1736a DS:1ec4,1ecc,1ed6
RT_LPTABRE: RT_LPS "     ": RT_LPS RT_DATE$: RT_LPS "     ": RT_LPS RT_MID$((RT_TIME$), (1), (5)): RT_LPFIM   '@173bb DS:1ee0
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@173fb
L_17413:
IF NOT (RT_MID$((V_13dc$), (1), (1)) = "S") THEN GOTO L_17442   '@17413 DS:1c6e
GOSUB L_1748b   '@17435
L_17442:
IF NOT (V_13b6% = 1 AND V_138e% = 3) THEN GOTO L_1747e   '@17442
V_138e% = 4   '@17466
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_16c4b   '@17471
L_1747e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1747e
' ---- F_17486 @0x17486  (017486_F_17486.lift.txt; evidence_id (assembly): ev_0ff6f2a339c5decf7d1d6bab2733a6563b7a69cc1d1c57e95a79793b8136c605)
L_1748b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 016337_FUN_1000_6337
RT_VIEWPRINT 1, 25   '@17490
V_1450$ = V_0dcc_placa$   '@174a2
IF NOT (V_1450$ = "HER") THEN GOTO L_1753e   '@174b4 DS:207e
RT_SCREEN 3   '@174cb
V_13a8! = 7.0   '@174e1 DS:2086
V_13ac! = 7.0   '@174f2 DS:2086
V_13b0! = 0.0   '@17503 DS:1c28
V_13a0! = 4.5   '@17514 DS:208a
V_13a4! = 4.0   '@17525 DS:208e
GOTO L_1767f   '@17536
L_1753e:
IF NOT (V_1450$ <> "CGA") THEN GOTO L_17562   '@1753e DS:2092
IF NOT (V_1450$ = "MCG") THEN GOTO L_175d2   '@17550 DS:209a
L_17562:
RT_SCREEN 2   '@17562
V_13a8! = 15.0   '@17575 DS:1882
V_13ac! = 15.0   '@17586 DS:1882
V_13b0! = 0.0   '@17597 DS:1c28
V_13a0! = 4.0   '@175a8 DS:208e
V_13a4! = 4.0   '@175b9 DS:208e
GOTO L_1767f   '@175ca
L_175d2:
IF NOT (V_1450$ <> "EGA") THEN GOTO L_175f6   '@175d2 DS:20a2
IF NOT (V_1450$ = "VGA") THEN GOTO L_1767f   '@175e4 DS:20aa
L_175f6:
RT_SCREEN 9   '@175f6
COLOR , 1   '@1760c
V_13a8! = 14.0   '@17622 DS:20b2
V_13ac! = 15.0   '@17633 DS:1882
V_13b0! = 1.0   '@17644 DS:187a
V_13a0! = 4.0   '@17655 DS:208e
V_13a4! = 4.0   '@17666 DS:208e
GOTO L_1767f   '@17677
L_1767f:
IF NOT (V_13dc$ = "ST") THEN GOTO L_180b3   '@1767f DS:23aa
V_1808! = 1000.0   '@17696 DS:24dc
V_180c! = 0.0   '@176a7 DS:1c28
V_1810! = 1000.0   '@176b8 DS:24dc
V_1814! = 0.0   '@176c9 DS:1c28
V_137e! = 1.0   '@176da DS:187a
L_176f0:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@176f0 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_17754   '@1771e DS:1c28
V_1382! = LEN(V_1390$) + 1   '@17739
L_17754:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@17754
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@17787
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@177a9
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_1781c   '@177cb DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@177e4 DS:1a10
L_1781c:
V_138c% = 0   '@1781c
V_0f0c! = 0.0   '@17827 DS:1c28
L_1783e:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@1783e DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_17892   '@17854 DS:1b8a
V_138c% = V_138c% + 1   '@17889
L_17892:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_138c% > FX##(V_137a!) OR FX##(V_0f0c!) - V_138c% < FX##(V_1376!))) THEN GOTO L_17925   '@17892 DS:1c28
GOTO L_17c03   '@1791d
L_17925:
V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@17925
V_1454! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@1794f
FOR V_0f04! = 1.0 TO V_1454!   '@1797e DS:187a
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0) < V_1808!) THEN GOTO L_17a18   '@17986
V_1808! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@179d4
L_17a18:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0) > V_180c!) THEN GOTO L_17aaa   '@17a18
V_180c! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@17a66
L_17aaa:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1) < V_1810!) THEN GOTO L_17b3e   '@17aaa
V_1810! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@17af9
L_17b3e:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1) > V_1814!) THEN GOTO L_17bd2   '@17b3e
V_1814! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@17b8d
L_17bd2:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@17bd2 DS:187a
L_17c03:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_138c% > FX##(V_137a!)) THEN GOTO L_1783e   '@17c08
V_137e! = FX##(V_1382!) + 1.0   '@17c2e DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_176f0   '@17c44
V_1818! = 560.0 / (FX##(V_180c!) - V_1808!)   '@17c68 DS:20b6
V_181c! = 145.0 / (FX##(V_1814!) - V_1810!)   '@17c86 DS:20ba
IF NOT (FX##(V_181c!) / V_1818! > 0.41670000553131103515625##) THEN GOTO L_17ce2   '@17ca4 DS:20be
V_181c! = V_1818! * 0.41670000553131103515625##   '@17cc4 DS:20be
GOTO L_17cfd   '@17cda
L_17ce2:
V_1818! = V_181c! / 0.41670000553131103515625##   '@17ce2 DS:20be
L_17cfd:
RT_CLS -1   '@17cfd
RT_WINDOW 1, (0), (0), (639), (199)   '@17d0b DS:1c28,1c2a,20c2,20c4,20c6,20c8 (B$WIND decodificado)
V_1800! = 45.0   '@17d39 DS:20ca
V_1804! = 10.0   '@17d4a DS:187e
V_137e! = 1.0   '@17d5b DS:187a
L_17d72:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@17d72 DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_17dd6   '@17da0 DS:1c28
V_1382! = LEN(V_1390$) + 1   '@17dbb
L_17dd6:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@17dd6
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@17e09
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@17e2b
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_17e9e   '@17e4d DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@17e66 DS:1a10
L_17e9e:
V_138c% = 0   '@17e9e
V_0f0c! = 0.0   '@17ea9 DS:1c28
L_17ec0:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@17ec0 DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_17f14   '@17ed6 DS:1b8a
V_138c% = V_138c% + 1   '@17f0b
L_17f14:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_138c% > FX##(V_137a!) OR FX##(V_0f0c!) - V_138c% < FX##(V_1376!))) THEN GOTO L_17fa7   '@17f14 DS:1c28
GOTO L_17fb9   '@17f9f
L_17fa7:
GOSUB L_18949   '@17fa7
L_17fb9:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_138c% > FX##(V_137a!)) THEN GOTO L_17ec0   '@17fbe
V_137e! = FX##(V_1382!) + 1.0   '@17fe4 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_17d72   '@17ffa
IF NOT (V_13d8$ = "S") THEN GOTO L_18080   '@1801e DS:1c6e
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@18035
RT_ROTINA_0AEA   '@18048 (rotina em assembly ligada ao EXE (SUB_70aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@18052 DS:1820
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@18065
GOTO L_180ab   '@18078
L_18080:
CALL MIXT_07f1_LimpaTeclado   '@18080
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1808a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_180ab:
GOTO L_188ca   '@180ab
L_180b3:
V_137e! = 1.0   '@180b3 DS:187a
L_180ca:
V_1382! = RT_INSTR%((RT_CINT%(FX##(V_137e!) + 1.0)), (V_1390$), ("/"))   '@180ca DS:187a,1c22
IF NOT (V_1382! = 0.0) THEN GOTO L_1812e   '@180f8 DS:1c28
V_1382! = LEN(V_1390$) + 1   '@18113
L_1812e:
V_0f18$ = RT_MID$((V_1390$), (RT_CINT%(FX##(V_137e!))), (RT_CINT%(FX##(V_1382!) - V_137e!)))   '@1812e
V_1376! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@18161
V_137a! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@18183
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_181f6   '@181a5 DS:1a10
V_137a! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@181be DS:1a10
L_181f6:
V_138c% = 0   '@181f6
V_0f0c! = 0.0   '@18201 DS:1c28
L_18218:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@18218 DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_1826c   '@1822e DS:1b8a
V_138c% = V_138c% + 1   '@18263
L_1826c:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_138c% > FX##(V_137a!) OR FX##(V_0f0c!) - V_138c% < FX##(V_1376!))) THEN GOTO L_182ff   '@1826c DS:1c28
GOTO L_18860   '@182f7
L_182ff:
V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@182ff
V_1808! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), 1), 0)   '@18329
V_180c! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), 1), 0)   '@18366
V_1810! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), 1), 1)   '@183a3
V_1814! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), 1), 1)   '@183e1
V_1458! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@1841f
FOR V_0f04! = 2.0 TO V_1458!   '@1844e DS:187a,1b8a
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0) < V_1808!) THEN GOTO L_184e8   '@18456
V_1808! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@184a4
L_184e8:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0) > V_180c!) THEN GOTO L_1857a   '@184e8
V_180c! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@18536
L_1857a:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1) < V_1810!) THEN GOTO L_1860e   '@1857a
V_1810! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@185c9
L_1860e:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1) > V_1814!) THEN GOTO L_186a2   '@1860e
V_1814! = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@1865d
L_186a2:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@186a2 DS:187a
V_1818! = 560.0 / (FX##(V_180c!) - V_1808!)   '@186ce DS:20b6
V_181c! = 145.0 / (FX##(V_1814!) - V_1810!)   '@186ec DS:20ba
IF NOT (FX##(V_181c!) / V_1818! > 0.41670000553131103515625##) THEN GOTO L_18748   '@1870a DS:20be
V_181c! = V_1818! * 0.41670000553131103515625##   '@1872a DS:20be
GOTO L_18763   '@18740
L_18748:
V_1818! = V_181c! / 0.41670000553131103515625##   '@18748 DS:20be
L_18763:
RT_CLS -1   '@18763
RT_WINDOW 1, (0), (0), (639), (199)   '@18771 DS:1c28,1c2a,20c2,20c4,20c6,20c8 (B$WIND decodificado)
V_1800! = 45.0   '@1879f DS:20ca
V_1804! = 10.0   '@187b0 DS:187e
GOSUB L_18949   '@187c1
IF NOT (V_13d8$ = "S") THEN GOTO L_18830   '@187ce DS:1c6e
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@187e5
RT_ROTINA_0AEA   '@187f8 (rotina em assembly ligada ao EXE (SUB_70aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@18802 DS:1820
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@18815
GOTO L_1885b   '@18828
L_18830:
CALL MIXT_07f1_LimpaTeclado   '@18830
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1883a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
L_1885b:
L_18860:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_138c% > FX##(V_137a!)) THEN GOTO L_18218   '@18865
V_137e! = FX##(V_1382!) + 1.0   '@1888b DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1390$) <= V_1382!) THEN GOTO L_180ca   '@188a1
L_188ca:
RT_SCREEN 0   '@188ca
RT_VIEWPRINT 1, 25   '@188df
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@188f1
RT_CLS 2   '@1892c
RETURN   '@1893a
L_18949:   ' sub-rotina (alvo de GOSUB)
V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1894e
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@18978
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@189a2
V_145c! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@189bd
FOR V_0f04! = 1.0 TO V_145c!   '@189ed DS:187a
V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@189f4
V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@18a38
RT_PSET RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_0efc#) - V_1810!) * V_181c!), 0, 0   '@18a7d DS:20ce
V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 0)   '@18adf DS:187a
V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 1)   '@18b28 DS:187a
IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = 1) THEN GOTO L_18c20   '@18b72
RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_0efc#) - V_1810!) * V_181c!), 72, RT_CINT%(FX##(V_13a8!)), 17476   '@18ba4 DS:20ce
GOTO L_19303   '@18c18
L_18c20:
RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_0efc#) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(V_13ac!)), 0   '@18c20 DS:20ce
V_0f1c$ = ""   '@18c94 DS:1820
IF NOT (V_138e% = 3 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) > 2) THEN GOTO L_18db6   '@18ca6
V_0efc# = V_0f04!   '@18cec
GOSUB L_19c3d   '@18cfd
V_1750! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) * V_0ef4# / 10.0#   '@18d0a DS:1f56
V_0f1c$ = LTRIM$(STR$(RT_SNG!(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) / (FX##(V_0dec!) * V_0de8!) * V_1750!) / 100.0)))   '@18d4d DS:1f6e
L_18db6:
IF NOT (V_138e% = 4 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) > 2) THEN GOTO L_18f0e   '@18db6
V_0efc# = V_0f04!   '@18dfc
GOSUB L_19c3d   '@18e0d
V_13ec! = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) * (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) * V_0ef4# / 10.0#   '@18e1a DS:1f56
V_13b4% = 1   '@18e82
GOSUB L_14312   '@18e8d
IF NOT (V_13f0! > 0.0) THEN GOTO L_18ef7   '@18e9a DS:1c28
V_0f1c$ = LTRIM$(STR$(RT_SNG!(INT(FX##(V_1398!) * 100.0) / 100.0)))   '@18eb5 DS:1f6e
GOTO L_18f09   '@18eef
L_18ef7:
V_0f1c$ = "*"   '@18ef7 DS:1c2c
L_18f09:
L_18f0e:
IF NOT (LEN(V_0f1c$) > 0) THEN GOTO L_192fe   '@18f0e
V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@18f23
V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 0)   '@18f67 DS:187a
V_0ef4# = (FX##(V_17e0#) + V_17e8#) / 2.0#   '@18fb0 DS:24e0
V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@18fcb
V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 1)   '@19010 DS:187a
V_0efc# = (FX##(V_17f0#) + V_17f8#) / 2.0#   '@1905a DS:24e0
V_1750! = 1.0   '@19075 DS:187a
V_1754! = -V_13a4! * 0.20000000298023223876953125##   '@19086 DS:24e8
IF NOT (V_17f0# > V_17f8# AND V_17e0# > V_17e8# OR V_17f0# > V_17f8# AND V_17e0# <= V_17e8#) THEN GOTO L_19132   '@1909f
V_1750! = -(LEN(V_0f1c$) * 2) - 1   '@19113
L_19132:
IF NOT (V_17f0# = V_17f8#) THEN GOTO L_19169   '@19132
V_1750! = -LEN(V_0f1c$)   '@1914d
L_19169:
IF NOT (V_17e0# < V_17e8#) THEN GOTO L_1919a   '@19169
V_1754! = 2.400000095367431640625## * V_13a4!   '@19184 DS:24ec
L_1919a:
IF NOT (V_17e0# = V_17e8#) THEN GOTO L_191c6   '@1919a
V_1754! = V_13a4!   '@191b5
L_191c6:
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@191c6 DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_19216   '@191eb DS:20aa
COLOR 10   '@19200
L_19216:
V_1460! = FX##(V_1750!) * V_13a0! + V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@19216
V_1464! = FX##(V_1754!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@1924a DS:20d2
V_1468$ = "CGA"   '@19277 DS:2092
CALL MIXT_08c4_TextoGrafico(V_1460!, V_1464!, V_0f1c$, V_1468$)   '@19284
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
' @19299 libera strings locais (V_1468)
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@192a2 DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_192f9   '@192c7 DS:20aa
COLOR RT_CINT%(FX##(V_13ac!))   '@192dc
L_192f9:
L_192fe:
L_19303:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@19303 DS:187a
V_0ef4# = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 6)   '@1932f
V_0efc# = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 7)   '@1935a
V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0f0c!) - V_138c% + V_0e54_nivellaje!)))   '@19385
V_146c! = V_1800! - FX##(LEN(V_0f1c$)) * V_13a0! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@193c8
V_1470! = FX##(V_13a4!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@19408 DS:20d2
V_1474$ = "CGA"   '@19435 DS:2092
CALL MIXT_08c4_TextoGrafico(V_146c!, V_1470!, V_0f1c$, V_1474$)   '@19442
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
' @19457 libera strings locais (V_1474)
IF NOT (V_138e% = 3) THEN GOTO L_196a2   '@19460
V_0f1c$ = ""   '@1946f DS:1820
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_19512   '@19481 DS:1c28
V_0f1c$ = LTRIM$(STR$(RT_SNG!(INT(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8!)) / 100.0)))   '@194b6 DS:1f6e
L_19512:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) < 1.0) THEN GOTO L_195d6   '@19512 DS:187a
V_0f1c$ = V_0f1c$ + "/" + LTRIM$(STR$(RT_SNG!(INT(FX##(A_1210!(RT_CINT%(FX##(V_177c!)), 1)) * A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(V_0dec!) * V_0de8!)) / 100.0)))   '@19547 DS:1c22,1f6e
L_195d6:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) > 1.0) THEN GOTO L_1969a   '@195d6 DS:187a
V_0f1c$ = V_0f1c$ + "/" + LTRIM$(STR$(RT_SNG!(INT(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) / (FX##(A_1210!(RT_CINT%(FX##(V_177c!)), 1)) * V_0dec! * V_0de8!)) / 100.0)))   '@1960b DS:1c22,1f6e
L_1969a:
GOTO L_19a67   '@1969a
L_196a2:
V_13b4% = 0   '@196a2
V_13ec! = 0.0   '@196ad DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_1971e   '@196be DS:1c28
V_13ec! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@196f3
L_1971e:
GOSUB L_14312   '@1971e
IF NOT (V_13f0! > 0.0) THEN GOTO L_19788   '@1972b DS:1c28
V_0f1c$ = LTRIM$(STR$(RT_SNG!(INT(FX##(V_1398!) * 100.0) / 100.0)))   '@19746 DS:1f6e
GOTO L_1979a   '@19780
L_19788:
V_0f1c$ = "*"   '@19788 DS:1c2c
L_1979a:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) < 1.0) THEN GOTO L_198fe   '@1979a DS:187a
V_13ec! = 0.0   '@197cf DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_1985f   '@197e0 DS:1c28
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * A_1210!(RT_CINT%(FX##(V_177c!)), 1)   '@19815
L_1985f:
GOSUB L_14312   '@1985f
IF NOT (V_13f0! > 0.0) THEN GOTO L_198dd   '@1986c DS:1c28
V_0f1c$ = V_0f1c$ + "/" + LTRIM$(STR$(RT_SNG!(INT(FX##(V_1398!) * 100.0) / 100.0)))   '@19887 DS:1c22,1f6e
GOTO L_198f9   '@198d5
L_198dd:
V_0f1c$ = V_0f1c$ + "/*"   '@198dd DS:24f0
L_198f9:
L_198fe:
IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) > 1.0) THEN GOTO L_19a62   '@198fe DS:187a
V_13ec! = 0.0   '@19933 DS:1c28
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_199c3   '@19944 DS:1c28
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) / A_1210!(RT_CINT%(FX##(V_177c!)), 1)   '@19979
L_199c3:
GOSUB L_14312   '@199c3
IF NOT (V_13f0! > 0.0) THEN GOTO L_19a41   '@199d0 DS:1c28
V_0f1c$ = V_0f1c$ + "/" + LTRIM$(STR$(RT_SNG!(INT(FX##(V_1398!) * 100.0) / 100.0)))   '@199eb DS:1c22,1f6e
GOTO L_19a5d   '@19a39
L_19a41:
V_0f1c$ = V_0f1c$ + "/*"   '@19a41 DS:24f0
L_19a5d:
L_19a62:
L_19a67:
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@19a67 DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_19ab7   '@19a8c DS:20aa
COLOR 14   '@19aa1
L_19ab7:
V_1478! = V_1800! - FX##(LEN(V_0f1c$)) * V_13a0! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@19ab7
V_147c! = 3.0 * FX##(V_13a4!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@19af7 DS:20d2,21d8
V_1480$ = "CGA"   '@19b29 DS:2092
CALL MIXT_08c4_TextoGrafico(V_1478!, V_147c!, V_0f1c$, V_1480$)   '@19b36
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
' @19b4b libera strings locais (V_1480)
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@19b54 DS:20a2
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_19bab   '@19b79 DS:20aa
COLOR RT_CINT%(FX##(V_13ac!))   '@19b8e
L_19bab:
LOCATE 22, 1   '@19bab
PRINT " "; V_0dd8$   '@19bc6 DS:1e80
IF NOT (V_138e% = 3) THEN GOTO L_19bfa   '@19bdd
PRINT " MOMENTOS ATUANTES"   '@19bec DS:24f6
L_19bfa:
IF NOT (V_138e% = 4) THEN GOTO L_19c17   '@19bfa
PRINT " ARMADURAS NAS LAJES"   '@19c09 DS:2476
L_19c17:
PRINT " OBRA "; V_0e24$;   '@19c17 DS:210e
RETURN   '@19c2e
L_19c3d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011e6d_F_11e6d
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) = 1.0) THEN GOTO L_19cab   '@19c42 DS:187a
V_0ef4# = 1.0#   '@19c90 DS:1f4e
RETURN   '@19ca1
L_19cab:
V_16a0# = FX##(A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 0)) * V_0e68_pi# / 180.0#   '@19cab DS:250c
V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 0) * RT_COS##(FX##(V_16a0#)) - A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 1) * RT_SIN##(FX##(V_16a0#))   '@19cf8
V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 0) * RT_SIN##(FX##(V_16a0#)) + A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 1) * RT_COS##(FX##(V_16a0#))   '@19dc8
V_0ef4# = FX##(V_0efc#) + 1.0#   '@19e98 DS:1f4e
IF NOT (A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 0) = V_0ef4#) THEN GOTO L_19f10   '@19eae
V_0ef4# = 1.0#   '@19eff DS:1f4e
L_19f10:
V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 0) * RT_COS##(FX##(V_16a0#)) - A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 1) * RT_SIN##(FX##(V_16a0#))   '@19f10
V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 0) * RT_SIN##(FX##(V_16a0#)) + A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 1) * RT_COS##(FX##(V_16a0#))   '@19fe0
V_16a8# = ABS(FX##(V_17e8#) - V_17e0#) / RT_SQR##(RT_POT##((FX##(V_17f8#) - V_17f0#), (2.0#)) + RT_POT##((FX##(V_17e8#) - V_17e0#), (2.0#)))   '@1a0b0 DS:24e0
V_16b0# = ABS(FX##(V_17f8#) - V_17f0#) / RT_SQR##(RT_POT##((FX##(V_17f8#) - V_17f0#), (2.0#)) + RT_POT##((FX##(V_17e8#) - V_17e0#), (2.0#)))   '@1a0fe DS:24e0
SWAP V_16a8#, V_16b0#   '@1a159 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) < 1.0) THEN GOTO L_1a21f   '@1a178 DS:187a
V_0ef4# = ABS(FX##(A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)) * V_16b0# + V_16a8#)   '@1a1c6
GOTO L_1a27d   '@1a217
L_1a21f:
V_0ef4# = ABS(FX##(V_16a8#) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) * 1.0# + V_16b0#)   '@1a21f DS:1f4e
L_1a27d:
RETURN   '@1a27d
L_1a28c:   ' entrada vinda de 010695_FUN_1000_0695
IF NOT (V_12fa% = 0) THEN GOTO L_1a2a8   '@1a291
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1a2a0
L_1a2a8:
RT_VIEWPRINT 1, 25   '@1a2a8
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1a2ba
RT_CLS 2   '@1a2e6
PRINT RT_STRINGC$((80), (205))   '@1a2f4
PRINT " Otimizacao dos Momentos Negativos"   '@1a30c DS:2514
PRINT RT_STRINGC$((80), (205))   '@1a31a
V_138a% = 1   '@1a332
V_138c% = 0   '@1a33d
L_1a34e:
IF NOT (A_10cc!(V_138a%, 1) = 2.0) THEN GOTO L_1a385   '@1a34e DS:1b8a
V_138c% = V_138c% + 1   '@1a37c
L_1a385:
V_138a% = V_138a% + 1   '@1a385
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_138a% THEN GOTO L_1a34e   '@1a38e
V_138a% = A_109e%(0, 0) - V_138c%   '@1a3ac
RT_VIEWPRINT 6, 25   '@1a3d5
COLOR 2   '@1a3e7
RT_CLS 2   '@1a3fa
PRINT " A Otimizacao dos Momentos Negativos consiste  em  Equilibrar  os  momentos"   '@1a408 DS:253a
PRINT " oriundos de Lajes Adjacentes.   Este processo podera ser feito manualmente"   '@1a416 DS:258a
PRINT " pelas rotinas de  CONTINUIDADE - IMPOSICAO DE ARMADURA  ou  atraves  deste"   '@1a424 DS:25da
PRINT " procedimento automatizado."   '@1a432 DS:262a
PRINT " Caso tenha sido Imposta Armadura nos trechos de Continuidade, tambem serao"   '@1a440 DS:264a
PRINT " Verificadas as Armaduras Necessarias e Impostas."   '@1a44e DS:269a
PRINT ""   '@1a45c DS:1820
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1a46a
PRINT " Arquivadas"; V_138a%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@1a487 DS:187a,1b8e,1b9e
IF NOT (V_138a% > 1) THEN GOTO L_1a523   '@1a4d5
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_138a%) + V_0e54_nivellaje!)));   '@1a4e4 DS:1bac
L_1a523:
PRINT " )"   '@1a523 DS:1bb4
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1a531
LOCATE 15, 1   '@1a54e
PRINT " Deseja <E>scolher as lajes  ou  <*T*>odas serao equilibradas ";   '@1a569 DS:26d0
CALL MIXT_07f1_LimpaTeclado   '@1a577
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f20$   '@1a581 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f20$ = UCASE$(V_0f20$)   '@1a59b
V_138e% = 4   '@1a5b3
V_1386! = 1.0   '@1a5be DS:187a
L_1a5d4:
RT_VIEWPRINT 15, 25   '@1a5d4
COLOR 7   '@1a5e6
RT_CLS 2   '@1a5fc
IF NOT (V_0f20$ = "E") THEN GOTO L_1a868   '@1a60a DS:19ac
LOCATE 16, 1   '@1a621
COLOR 3   '@1a63c
PRINT " Acione  *<Enter> para Interromper"   '@1a652 DS:2712
L_1a665:
COLOR 7   '@1a66a
LOCATE 15, 1   '@1a680
PRINT " "; RT_TAB$(79); ""; " "   '@1a69b DS:1820,1e80
LOCATE 15, 1   '@1a6c4
PRINT " Laje que sera Equilibrada *"; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); "* ";   '@1a6df DS:2738,2758
CALL MIXT_07f1_LimpaTeclado   '@1a71b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@1a725 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_1a77c   '@1a73f
V_0f18$ = STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))   '@1a754
L_1a77c:
IF NOT (V_0f18$ = "*") THEN GOTO L_1a79b   '@1a77c DS:1c2c
GOTO L_1c1aa   '@1a793
L_1a79b:
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@1a79b
L_BP0e% = FX##(VAL(V_0f18$)) > FX##(V_138a%) + V_0e54_nivellaje! OR L_BP0c%   '@1a7d6
IF NOT ((FX##(VAL(V_0f18$)) <> INT(FX##(VAL(V_0f18$))) OR L_BP0e%) <> 0) THEN GOTO L_1a841   '@1a7f9
BEEP   '@1a82f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1a665   '@1a839
L_1a841:
V_1386! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@1a841
L_1a868:
V_0f0c! = 0.0   '@1a868 DS:1c28
V_138c% = 0   '@1a879
L_1a88a:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@1a88a DS:187a
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_1a8de   '@1a8a0 DS:1b8a
V_138c% = V_138c% + 1   '@1a8d5
L_1a8de:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF FX##(V_0f0c!) - V_138c% < FX##(V_1386!) THEN GOTO L_1a88a   '@1a8de
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) <= 0.0 OR A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0) = 0.0) THEN GOTO L_1a97c   '@1a901 DS:1c28
GOTO L_1c170   '@1a974
L_1a97c:
V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1a97c
V_1484! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@1a9a6
FOR V_0f04! = 1.0 TO V_1484!   '@1a9d6 DS:187a
L_1a9e3:
IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) > 2) THEN GOTO L_1c13f   '@1a9e8
V_1376! = 1.0   '@1aa19 DS:187a
L_1aa30:
L_BP0c% = (A_11e0%(RT_CINT%(FX##(V_1376!)), 2) = V_0f0c!)   '@1aa30
IF NOT ((A_11e0%(RT_CINT%(FX##(V_1376!)), 3) = V_0f04! AND L_BP0c% OR A_11e0%(RT_CINT%(FX##(V_1376!)), 1) = V_0f04! AND A_11e0%(RT_CINT%(FX##(V_1376!)), 0) = V_0f0c!) <> 0) THEN GOTO L_1ab2e   '@1ab08
GOTO L_1ab4c   '@1ab26
L_1ab2e:
V_1376! = FX##(V_1376!) + 1.0   '@1ab2e DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1aa30   '@1ab44
L_1ab4c:
IF NOT (A_11e0%(RT_CINT%(FX##(V_1376!)), 1) = V_0f04! AND A_11e0%(RT_CINT%(FX##(V_1376!)), 0) = V_0f0c!) THEN GOTO L_1ac2c   '@1ab4c
V_137a! = A_11e0%(RT_CINT%(FX##(V_1376!)), 2)   '@1abc9
V_1488! = A_11e0%(RT_CINT%(FX##(V_1376!)), 3)   '@1abf5
GOTO L_1ac8e   '@1ac24
L_1ac2c:
V_137a! = A_11e0%(RT_CINT%(FX##(V_1376!)), 0)   '@1ac2c
V_1488! = A_11e0%(RT_CINT%(FX##(V_1376!)), 1)   '@1ac5a
L_1ac8e:
V_0efc# = V_0f04!   '@1ac8e
GOSUB L_19c3d   '@1ac9f
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) * V_0ef4# / 10.0#   '@1acac DS:1f56
V_1750! = V_13ec!   '@1ad11
V_1754! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) / 10.0   '@1ad22 DS:187e
V_13b4% = 1   '@1ad60
V_1394! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@1ad6b DS:187a,205c,2060,2066,206a
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1adc5
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@1adef
GOSUB L_14312   '@1ae0a
IF NOT (V_13f0! = -1.0) THEN GOTO L_1ae43   '@1ae17 DS:1f4a
V_1398! = -1.0   '@1ae32 DS:1f4a
L_1ae43:
COLOR 7   '@1ae43
RT_CLS 2   '@1ae59
PRINT " Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); "              "   '@1ae67 DS:275e,2768
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1aeac
PRINT USING "  M =#####.##      As =####.##    Mneg/Mpos = ##.##"; RT_PU#(RT_SNG!(V_13ec! / (FX##(V_0dec!) * V_0de8! * 100.0)), "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 1); RT_PU#(V_1398!, "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 2); RT_PU#(V_1754!, "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 3);   '@1aec9 DS:1f6e,277a
PRINT " "; RT_TAB$(79); ""; " "   '@1af1c DS:1820,1e80
IF NOT (V_1398! = -1.0) THEN GOTO L_1af6a   '@1af45 DS:1f4a
BEEP   '@1af60
L_1af6a:
V_13b8! = V_177c!   '@1af6a
V_13bc! = V_0f04!   '@1af7b
V_13c0! = V_0f0c!   '@1af8c
IF NOT (V_137a! <> -1.0) THEN GOTO L_1b972   '@1af9d DS:1f4a
V_0f0c! = V_137a!   '@1afb8
V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1afc9
V_0f04! = V_1488!   '@1aff3
V_13c4! = V_177c!   '@1b004
V_13c8! = V_0f04!   '@1b015
V_13cc! = V_0f0c!   '@1b026
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0 AND A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0) > 0.0) THEN GOTO L_1b930   '@1b037 DS:1c28
V_0efc# = V_0f04!   '@1b0aa
GOSUB L_19c3d   '@1b0bb
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) * V_0ef4# / 10.0#   '@1b0c8 DS:1f56
V_1758! = V_13ec!   '@1b12d
V_175c! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) / 10.0   '@1b13e DS:187e
V_13b4% = 1   '@1b17c
V_1394! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@1b187 DS:187a,205c,2060,2066,206a
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1b1e1
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@1b20b
GOSUB L_14312   '@1b226
IF NOT (V_13f0! = -1.0) THEN GOTO L_1b25f   '@1b233 DS:1f4a
V_1398! = -1.0   '@1b24e DS:1f4a
L_1b25f:
V_0f08! = 0.0   '@1b25f DS:1c28
V_138c% = 1   '@1b270
L_1b280:
IF NOT (A_10cc!(V_138c%, 1) <> 2.0) THEN GOTO L_1b2c4   '@1b280 DS:1b8a
V_0f08! = FX##(V_0f08!) + 1.0   '@1b2ae DS:187a
L_1b2c4:
V_138c% = V_138c% + 1   '@1b2c4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF V_138c% <= V_137a! THEN GOTO L_1b280   '@1b2cd
LOCATE 18, 1   '@1b2e8
COLOR 7   '@1b303
PRINT " Continuidade com a Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_0f08!))); "              "   '@1b319 DS:2768,27b2
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1b35e
PRINT USING "  M =#####.##      As =####.##    Mneg/Mpos = ##.##"; RT_PU#(RT_SNG!(V_13ec! / (FX##(V_0dec!) * V_0de8! * 100.0)), "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 1); RT_PU#(V_1398!, "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 2); RT_PU#(V_175c!, "  M =#####.##      As =####.##    Mneg/Mpos = ##.##", 3);   '@1b37b DS:1f6e,277a
PRINT " "; RT_TAB$(79); ""; " "   '@1b3ce DS:1820,1e80
IF NOT (V_1398! = -1.0) THEN GOTO L_1b41c   '@1b3f7 DS:1f4a
BEEP   '@1b412
L_1b41c:
IF NOT (V_1750! = V_1758!) THEN GOTO L_1b43f   '@1b41c
GOTO L_1b935   '@1b437
L_1b43f:
IF NOT (V_1750! > V_1758!) THEN GOTO L_1b60b   '@1b43f
IF NOT ((FX##(V_1750!) - V_1758!) / V_1750! < 0.100000001490116119384765625##) THEN GOTO L_1b487   '@1b45a DS:27d0
GOTO L_1b935   '@1b47f
L_1b487:
IF NOT (V_1754! = V_0f7a!) THEN GOTO L_1b4aa   '@1b487
GOTO L_1b935   '@1b4a2
L_1b4aa:
V_1754! = INT(100.0 * FX##(V_1754!) * V_1758! / V_1750!) / 100.0   '@1b4aa DS:1f6e
IF NOT (V_1754! < V_0f7a!) THEN GOTO L_1b502   '@1b4d6
V_1754! = V_0f7a!   '@1b4f1
L_1b502:
COLOR 14   '@1b502
LOCATE 21, 1   '@1b518
PRINT " Relacao Mneg/Mpos da Laje  "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); "  alterada para "; V_1754!; "   .. Aguarde"   '@1b533 DS:27d4,27f4,2808
V_177c! = V_13b8!   '@1b58e
V_0f04! = V_13bc!   '@1b59f
V_0f0c! = V_13c0!   '@1b5b0
A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_1754!) * 10.0 + 2.0)   '@1b5c1 DS:187e,1b8a
GOTO L_1b7b9   '@1b603
L_1b60b:
IF NOT ((FX##(V_1758!) - V_1750!) / V_1758! < 0.100000001490116119384765625##) THEN GOTO L_1b638   '@1b60b DS:27d0
GOTO L_1b935   '@1b630
L_1b638:
IF NOT (V_175c! = V_0f7a!) THEN GOTO L_1b65b   '@1b638
GOTO L_1b935   '@1b653
L_1b65b:
V_175c! = INT(100.0 * FX##(V_175c!) * V_1750! / V_1758!) / 100.0   '@1b65b DS:1f6e
IF NOT (V_175c! < V_0f7a!) THEN GOTO L_1b6b3   '@1b687
V_175c! = V_0f7a!   '@1b6a2
L_1b6b3:
COLOR 14   '@1b6b3
LOCATE 21, 1   '@1b6c9
PRINT " Relacao Mneg/Mpos da Laje  "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_0f08!))); "  alterada para "; V_175c!; "   .. Aguarde"   '@1b6e4 DS:27d4,27f4,2808
V_177c! = V_13c4!   '@1b73f
V_0f04! = V_13c8!   '@1b750
V_0f0c! = V_13cc!   '@1b761
A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_175c!) * 10.0 + 2.0)   '@1b772 DS:187e,1b8a
L_1b7b9:
COLOR 7   '@1b7b9
CALL S_50187   '@1b7cf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_4019b   '@1b7d9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_578ad   '@1b7e3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1b7ed
V_1400! = (FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) / A_1210!(0, 1)   '@1b817 DS:1b8a,1f6e
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8!   '@1b8a5 DS:1f6e
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = V_13ec!   '@1b8c5
V_177c! = V_13b8!   '@1b8f0
V_0f04! = V_13bc!   '@1b901
V_0f0c! = V_13c0!   '@1b912
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1a9e3   '@1b923
L_1b930:
L_1b935:
V_177c! = V_13b8!   '@1b93a
V_0f04! = V_13bc!   '@1b94b
V_0f0c! = V_13c0!   '@1b95c
L_1b972:
IF NOT (A_11e0%(RT_CINT%(FX##(V_1376!)), 4) > 0) THEN GOTO L_1c13a   '@1b972
V_137a! = A_0eba_areabarra!(RT_CINT%(INT(FX##(A_11e0%(RT_CINT%(FX##(V_1376!)), 4)) / 1000.0))) / (A_11e0%(RT_CINT%(FX##(V_1376!)), 4) - INT(FX##(A_11e0%(RT_CINT%(FX##(V_1376!)), 4)) / 1000.0) * 1000.0) * 100.0   '@1b99d DS:1f6e,24dc
V_1390$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(FX##(A_11e0%(RT_CINT%(FX##(V_1376!)), 4)) / 1000.0))))) + "/" + LTRIM$(STR$(RT_SNG!(A_11e0%(RT_CINT%(FX##(V_1376!)), 4) - INT(FX##(A_11e0%(RT_CINT%(FX##(V_1376!)), 4)) / 1000.0) * 1000.0)))   '@1ba50 DS:1c22,1fb6,24dc
LOCATE 21, 1   '@1bb3c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1bb57
PRINT USING " Armadura Imposta   \           \  As =###.## cm2/m"; V_1390$; RT_PU#(V_137a!, " Armadura Imposta   \           \  As =###.## cm2/m", 1);   '@1bb74 DS:281a
PRINT " "; RT_TAB$(79); ""; " "   '@1bb9d DS:1820,1e80
V_1390$ = ""   '@1bbc6 DS:1820
L_1bbdd:
V_0efc# = V_0f04!   '@1bbe2
GOSUB L_19c3d   '@1bbf3
V_13ec! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) * V_0ef4# / 10.0#   '@1bc00 DS:1f56
V_1754! = FX##(A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) - 2) / 10.0   '@1bc65 DS:187e
V_13b4% = 1   '@1bca3
V_1394! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@1bcae DS:187a,205c,2060,2066,206a
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1bd08
V_0eec! = FX##(V_13e0!) - V_0e84! - V_0e88!   '@1bd32
GOSUB L_14312   '@1bd4d
IF NOT (V_13f0! = -1.0) THEN GOTO L_1bd86   '@1bd5a DS:1f4a
V_1398! = 0.0   '@1bd75 DS:1c28
L_1bd86:
LOCATE 22, 1   '@1bd86
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1bda1
PRINT USING " Armadura Necessaria               As =###.## cm2/m"; RT_PU#(V_1398!, " Armadura Necessaria               As =###.## cm2/m", 1);   '@1bdbe DS:2852
PRINT " "; RT_TAB$(79); ""; " "   '@1bdde DS:1820,1e80
IF NOT (1.0299999713897705078125## * V_137a! < FX##(V_1398!)) THEN GOTO L_1c10c   '@1be07 DS:288a
IF NOT (V_1754! = V_0f7a!) THEN GOTO L_1be4a   '@1be27
GOTO L_1c130   '@1be42
L_1be4a:
V_148c! = FX##(V_137a!) / V_1398!   '@1be4a
V_1490! = 0.85000002384185791015625##   '@1be61 DS:2076
CALL MIXT_082a_Maior(V_148c!, V_1490!, V_1494!)   '@1be6c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_1754! = INT(100.0 * FX##(V_1754!) * V_1494!) / 100.0   '@1be7e DS:1f6e
IF NOT (V_1754! < V_0f7a!) THEN GOTO L_1becb   '@1be9f
V_1754! = V_0f7a!   '@1beba
L_1becb:
COLOR 14   '@1becb
LOCATE 24, 1   '@1bee1
PRINT " Relacao Mneg/Mpos da Laje  "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1386!))); "  alterada para "; V_1754!; "   .. Aguarde"   '@1befc DS:27d4,27f4,2808
A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_1754!) * 10.0 + 2.0)   '@1bf57 DS:187e,1b8a
CALL S_50187   '@1bf99
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_4019b   '@1bfa3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
CALL S_578ad   '@1bfad
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_13e0! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1bfb7
V_1400! = (FX##(V_0ef0!) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2) + RT_POT##((FX##(V_0de8!)), (2.0)) / (100.0 * FX##(V_0dec!)) * V_13e0! * V_0f6e! + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) / A_1210!(0, 1)   '@1bfe1 DS:1b8a,1f6e
V_13ec! = 100.0 * FX##(V_1400!) * V_0dec! * V_0de8!   '@1c06f DS:1f6e
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = V_13ec!   '@1c08f
V_177c! = V_13b8!   '@1c0ba
V_0f04! = V_13bc!   '@1c0cb
V_0f0c! = V_13c0!   '@1c0dc
V_1390$ = "*"   '@1c0ed DS:1c2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1bbdd   '@1c0ff
L_1c10c:
IF NOT (V_1390$ = "*") THEN GOTO L_1c12b   '@1c10c DS:1c2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1a9e3   '@1c123
L_1c12b:
L_1c130:
L_1c13a:
L_1c13f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@1c13f DS:187a
L_1c170:
V_1386! = FX##(V_1386!) + 1.0   '@1c175 DS:187a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
IF NOT (V_138a% < V_1386!) THEN GOTO L_1a5d4   '@1c18b
L_1c1aa:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1c1aa
' ---- FUN_1000_c1b7 @0x1c1b7  (01c1b7_FUN_1000_c1b7.lift.txt; evidence_id (assembly): ev_552cab10c42a506138ea90d2f47117769cfc732cf96b3de1de4b6f65d8776b50)
L_1c1b7:   ' entrada vinda de 010695_FUN_1000_0695
RT_VIEWPRINT 1, 25   '@1c1bc
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1c1ce
RT_CLS 2   '@1c1fa
PRINT RT_STRINGC$((80), (205))   '@1c208
PRINT " Correcao de Parametros"   '@1c220 DS:288e
PRINT RT_STRINGC$((80), (205))   '@1c22e
L_1c24b:
RT_VIEWPRINT 1, 25   '@1c250
COLOR 7   '@1c262
LOCATE 5, 20   '@1c278
PRINT "1  -  ";   '@1c296 DS:1944
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c2a4
PRINT "E";   '@1c2c1 DS:19ac
COLOR 7   '@1c2cf
PRINT "ficiencia da Armadura Negativa"; RT_SNG!(FX##(V_0f86!) * 100.0); "%     "   '@1c2e5 DS:1f6e,28aa,28cc
COLOR 7   '@1c315
LOCATE 7, 20   '@1c32b
PRINT "2  -  ";   '@1c349 DS:196e
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c357
PRINT "C";   '@1c374 DS:194e
COLOR 7   '@1c382
PRINT "obrimento da Armadura"; V_0e84!; "cm       "   '@1c398 DS:28d6,28f0
COLOR 7   '@1c3bc
LOCATE 9, 20   '@1c3d2
PRINT "3  -  ";   '@1c3f0 DS:19a2
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c3fe
PRINT "L";   '@1c41b DS:28fe
COLOR 7   '@1c429
PRINT "imita Linha Neutra (dominio 3/4)"; RT_SNG!(FX##(V_0f6a!) * 100.0); "%       "   '@1c43f DS:1f6e,2904,2928
COLOR 7   '@1c46f
LOCATE 11, 20   '@1c485
PRINT "4  -  ";   '@1c4a3 DS:19c8
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c4b1
PRINT "D";   '@1c4ce DS:1978
COLOR 7   '@1c4dc
PRINT "ensidade do Concreto"; V_0f6e!; "t/m2       "   '@1c4f2 DS:2934,294c
COLOR 7   '@1c516
LOCATE 13, 18   '@1c52c
COLOR 3   '@1c54a
PRINT "Coeficientes para Relacao dos Momentos Negativos"   '@1c560 DS:295c
COLOR 7   '@1c56e
LOCATE 15, 20   '@1c584
PRINT "5  -  ";   '@1c5a2 DS:19f2
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c5b0
PRINT "M";   '@1c5cd DS:19fc
COLOR 7   '@1c5db
PRINT "axima Relacao      Mneg/Mpos ";   '@1c5f1 DS:2990
PRINT USING "#.##"; RT_PU#(V_0f7e!, "#.##", 1);   '@1c5ff DS:29b2
PRINT "       "   '@1c61f DS:1f96
COLOR 7   '@1c62d
LOCATE 17, 20   '@1c643
PRINT "6  -  M";   '@1c661 DS:29ba
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c66f
PRINT "i";   '@1c68c DS:1af8
COLOR 7   '@1c69a
PRINT "nima Relacao      Mneg/Mpos ";   '@1c6b0 DS:29c6
PRINT USING "#.##"; RT_PU#(V_0f7a!, "#.##", 1);   '@1c6be DS:29b2
PRINT "       "   '@1c6de DS:1f96
COLOR 7   '@1c6ec
LOCATE 19, 20   '@1c702
PRINT "7  -  Cantos ";   '@1c720 DS:29e6
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1c72e
PRINT "R";   '@1c74b DS:1a9a
COLOR 7   '@1c759
PRINT "eentrantes  Mneg/Mpos ";   '@1c76f DS:29f8
PRINT USING "#.##"; RT_PU#(V_0f82!, "#.##", 1);   '@1c77d DS:29b2
PRINT "       "   '@1c79d DS:1f96
COLOR 7   '@1c7ab
LOCATE 21, 20   '@1c7c1
PRINT "8  -  *Retorno ao Menu Principal*"   '@1c7df DS:2a12
L_1c7f2:
RT_VIEWPRINT 23, 25   '@1c7f7
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1c809
RT_CLS 2   '@1c835
LOCATE 23, 20   '@1c843
PRINT "escolha opcao ";   '@1c861 DS:1abc
CALL MIXT_07f1_LimpaTeclado   '@1c86f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1c879
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@1c895
L_1c8b0:
RT_CLS 2   '@1c8b5
V_1498$ = V_0f18$   '@1c8c3
IF NOT (V_1498$ <> "1") THEN GOTO L_1c910   '@1c8d5 DS:1ace
IF NOT (V_1498$ <> "E") THEN GOTO L_1c910   '@1c8ec DS:19ac
IF NOT (V_1498$ = "e") THEN GOTO L_1ca15   '@1c8fe DS:1aec
L_1c910:
PRINT "   Eficiencia da Armadura *"; LTRIM$(STR$(RT_SNG!(FX##(V_0f86!) * 100.0))); "* % ";   '@1c910 DS:1f6e,2a38,2a58
CALL MIXT_07f1_LimpaTeclado   '@1c94c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1c956 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1c98d   '@1c970
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1c985
L_1c98d:
V_0ef4# = VAL(V_0f1c$)   '@1c98d
IF NOT (V_0ef4# > 100.0# OR V_0ef4# < 60.0#) THEN GOTO L_1c9f7   '@1c9a7 DS:1f66,2a60
BEEP   '@1c9e5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1c9ef
L_1c9f7:
V_0f86! = FX##(V_0ef4#) / 100.0#   '@1c9f7 DS:1f66
GOTO L_1d167   '@1ca0d
L_1ca15:
IF NOT (V_1498$ <> "2") THEN GOTO L_1ca4b   '@1ca15 DS:1ada
IF NOT (V_1498$ <> "C") THEN GOTO L_1ca4b   '@1ca27 DS:194e
IF NOT (V_1498$ = "c") THEN GOTO L_1cb3f   '@1ca39 DS:1ad4
L_1ca4b:
PRINT "   Cobrimento da Armadura *"; LTRIM$(STR$(V_0e84!)); "* cm ";   '@1ca4b DS:2a68,2a88
CALL MIXT_07f1_LimpaTeclado   '@1ca7b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1ca85 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1cabc   '@1ca9f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1cab4
L_1cabc:
V_0ef4# = VAL(V_0f1c$)   '@1cabc
IF NOT (V_0ef4# > 20.0# OR V_0ef4# < 0.5#) THEN GOTO L_1cb26   '@1cad6 DS:2a92,2a9a
BEEP   '@1cb14
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1cb1e
L_1cb26:
V_0e84! = V_0ef4#   '@1cb26
GOTO L_1d167   '@1cb37
L_1cb3f:
IF NOT (V_1498$ <> "3") THEN GOTO L_1cb75   '@1cb3f DS:1ae6
IF NOT (V_1498$ <> "L") THEN GOTO L_1cb75   '@1cb51 DS:28fe
IF NOT (V_1498$ = "l") THEN GOTO L_1cc88   '@1cb63 DS:2aa2
L_1cb75:
PRINT "   Limite da Linha Neutra em relacao ao Dominio 3/4"   '@1cb75 DS:2aa8
PRINT "   Relacao Limite *"; LTRIM$(STR$(RT_SNG!(FX##(V_0f6a!) * 100.0))); "* % ";   '@1cb83 DS:1f6e,2a58,2ae0
CALL MIXT_07f1_LimpaTeclado   '@1cbbf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1cbc9 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1cc00   '@1cbe3
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1cbf8
L_1cc00:
V_0ef4# = VAL(V_0f1c$)   '@1cc00
IF NOT (V_0ef4# > 100.0# OR V_0ef4# < 50.0#) THEN GOTO L_1cc6a   '@1cc1a DS:1f66,2af8
BEEP   '@1cc58
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1cc62
L_1cc6a:
V_0f6a! = FX##(V_0ef4#) / 100.0#   '@1cc6a DS:1f66
GOTO L_1d167   '@1cc80
L_1cc88:
IF NOT (V_1498$ <> "4") THEN GOTO L_1ccbe   '@1cc88 DS:1af2
IF NOT (V_1498$ <> "D") THEN GOTO L_1ccbe   '@1cc9a DS:1978
IF NOT (V_1498$ = "d") THEN GOTO L_1cdb2   '@1ccac DS:1ae0
L_1ccbe:
PRINT "   Densidade do Concreto *"; LTRIM$(STR$(V_0f6e!)); "* t/cm2 ";   '@1ccbe DS:2b00,2b1e
CALL MIXT_07f1_LimpaTeclado   '@1ccee
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1ccf8 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1cd2f   '@1cd12
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1cd27
L_1cd2f:
V_0ef4# = VAL(V_0f1c$)   '@1cd2f
IF NOT (V_0ef4# > 5.0# OR V_0ef4# < 1.0#) THEN GOTO L_1cd99   '@1cd49 DS:1f4e,2b2a
BEEP   '@1cd87
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1cd91
L_1cd99:
V_0f6e! = V_0ef4#   '@1cd99
GOTO L_1d167   '@1cdaa
L_1cdb2:
IF NOT (V_1498$ <> "5") THEN GOTO L_1cde8   '@1cdb2 DS:1afe
IF NOT (V_1498$ <> "M") THEN GOTO L_1cde8   '@1cdc4 DS:19fc
IF NOT (V_1498$ = "m") THEN GOTO L_1ceea   '@1cdd6 DS:1b04
L_1cde8:
PRINT "   Maxima Relacao entre Momentos Negativos e Positivos em Lados Engastados"   '@1cde8 DS:2b32
PRINT "   Maxima Relacao *"; LTRIM$(STR$(V_0f7e!)); "* ";   '@1cdf6 DS:2758,2b80
CALL MIXT_07f1_LimpaTeclado   '@1ce26
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1ce30 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1ce67   '@1ce4a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1ce5f
L_1ce67:
V_0ef4# = VAL(V_0f1c$)   '@1ce67
IF NOT (V_0ef4# > 3.0# OR FX##(V_0f7a!) >= FX##(V_0ef4#)) THEN GOTO L_1ced1   '@1ce81 DS:2b98
BEEP   '@1cebf
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1cec9
L_1ced1:
V_0f7e! = V_0ef4#   '@1ced1
GOTO L_1d167   '@1cee2
L_1ceea:
IF NOT (V_1498$ <> "6") THEN GOTO L_1cf20   '@1ceea DS:1b10
IF NOT (V_1498$ <> "I") THEN GOTO L_1cf20   '@1cefc DS:19d2
IF NOT (V_1498$ = "i") THEN GOTO L_1d022   '@1cf0e DS:1af8
L_1cf20:
PRINT "   Minima Relacao entre Momentos Negativos e Positivos em Lados Engastados"   '@1cf20 DS:2ba0
PRINT "   Minima Relacao *"; LTRIM$(STR$(V_0f7a!)); "* ";   '@1cf2e DS:2758,2bee
CALL MIXT_07f1_LimpaTeclado   '@1cf5e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1cf68 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1cf9f   '@1cf82
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1cf97
L_1cf9f:
V_0ef4# = VAL(V_0f1c$)   '@1cf9f
IF NOT (FX##(V_0f7e!) <= FX##(V_0ef4#) OR V_0ef4# < 0.0#) THEN GOTO L_1d009   '@1cfb9 DS:1f5e
BEEP   '@1cff7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1d001
L_1d009:
V_0f7a! = V_0ef4#   '@1d009
GOTO L_1d167   '@1d01a
L_1d022:
IF NOT (V_1498$ <> "7") THEN GOTO L_1d058   '@1d022 DS:1b1c
IF NOT (V_1498$ <> "R") THEN GOTO L_1d058   '@1d034 DS:1a9a
IF NOT (V_1498$ = "r") THEN GOTO L_1d15a   '@1d046 DS:1b2e
L_1d058:
PRINT "   Relacao FIXA entre Momentos Negativos e Positivos em Cantos Reentrantes"   '@1d058 DS:2c06
PRINT "   Relacao para Cantos Reentrantes *"; LTRIM$(STR$(V_0f82!)); "*  ";   '@1d066 DS:2c54,2c7c
CALL MIXT_07f1_LimpaTeclado   '@1d096
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f1c$   '@1d0a0 DS:1820
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f1c$) = 0) THEN GOTO L_1d0d7   '@1d0ba
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c7f2   '@1d0cf
L_1d0d7:
V_0ef4# = VAL(V_0f1c$)   '@1d0d7
IF NOT (V_0ef4# >= 1.0# OR V_0ef4# < 0.0#) THEN GOTO L_1d141   '@1d0f1 DS:1f4e,1f5e
BEEP   '@1d12f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c8b0   '@1d139
L_1d141:
V_0f82! = V_0ef4#   '@1d141
GOTO L_1d167   '@1d152
L_1d15a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_10695   '@1d15a
L_1d167:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10529, L_10554, L_10652   ' ON KEY no laco (B$EVCK)
GOTO L_1c24b   '@1d167
' ---- M_LAJECHAR @0x20030  (020030_M_LAJECHAR.lift.txt; evidence_id (assembly): ev_cfe6f4de3491b37176831d21e50ea08d5103460195eba383bfa899cb24d120ba)
' @20030 inicio do programa (B$?EVT)
GOTO L_21755   '@20184
' ---- FUN_2000_1755 @0x21755  (021755_FUN_2000_1755.lift.txt; evidence_id (assembly): ev_b0934ae2342ab17c0e7bb99030c037dc32c9263be8a8fce0f2ef7607725fad47)
L_21755:   ' entrada vinda de 020030_M_LAJECHAR
GOTO L_21e55   '@21755
' ---- FUN_2000_1e55 @0x21e55  (021e55_FUN_2000_1e55.lift.txt; evidence_id (assembly): ev_9e1fe855e6d0fafd036b04882297966b045f5a85c25bccb7e5e017201459075e)
L_21e55:   ' entrada vinda de 021755_FUN_2000_1755
GOTO L_23339   '@21e55
' ---- FUN_2000_3339 @0x23339  (023339_FUN_2000_3339.lift.txt; evidence_id (assembly): ev_fab3299bc12fd8d4e7eb82b5618393761c1206c454f91809c645115c6c505332)
L_23339:   ' entrada vinda de 021e55_FUN_2000_1e55
GOTO L_23940   '@23339
' ---- FUN_2000_3940 @0x23940  (023940_FUN_2000_3940.lift.txt; evidence_id (assembly): ev_b45ed64f6e788fffd5bacce60f2be7b34fbba2398e2abf9f8e3a15ba5547b35a)
L_23940:   ' entrada vinda de 023339_FUN_2000_3339
GOTO L_23e69   '@23940
' ---- RT_EA @0x23e69  (023e69_RT_EA.lift.txt; evidence_id (assembly): ev_d5cd8b5ee3ae0de29db6c587654e02f13d3cfc240c66127153c182ad95944a39)
L_23e69:   ' entrada vinda de 023940_FUN_2000_3940
RT_FIM   ' @23e69 B$CENP (inicio/fim do modulo)
' ---- M_LAGEOCAL @0x30030  (030030_M_LAGEOCAL.lift.txt; evidence_id (assembly): ev_bab81f6b54547451664be5f38fb5bbd64ce145d8bf2bfeee8c56075fc2346c5a)
' @30030 inicio do programa (B$?EVT)
GOTO L_3541b   '@3017a
' ---- FUN_3000_541b @0x3541b  (03541b_FUN_3000_541b.lift.txt; evidence_id (assembly): ev_d273d8c8c26c88e4e6da3edcf70346102c520ff9296952f120f08e95dd2289af)
L_3541b:   ' entrada vinda de 030030_M_LAGEOCAL
GOTO L_38a15   '@3541b
' ---- RT_EA @0x38a15  (038a15_RT_EA.lift.txt; evidence_id (assembly): ev_11a57922319ab959d483394504fee90904900cc458d1ff248f41216f918ecc79)
L_38a15:   ' entrada vinda de 03541b_FUN_3000_541b
RT_FIM   ' @38a15 B$CENP (inicio/fim do modulo)
' ---- M_LAMONTLB @0x40030  (040030_M_LAMONTLB.lift.txt; evidence_id (assembly): ev_a53461098c6b8697fd5a06973d13bb54657994d0ddbf450e19c87bad745b0ba0)
' @40030 inicio do programa (B$?EVT)
GOTO L_4e6d4   '@40193
' ---- RT_EA @0x4e6d4  (04e6d4_RT_EA.lift.txt; evidence_id (assembly): ev_acdb564de0fbe4d88931b239e9583f2b3ffca5c280c43bdfd5112cae9615ac40)
L_4e6d4:   ' entrada vinda de 040030_M_LAMONTLB
RT_FIM   ' @4e6d4 B$CENP (inicio/fim do modulo)
' ---- M_LACALCU @0x50030  (050030_M_LACALCU.lift.txt; evidence_id (assembly): ev_c04d174d167f7c79b43ae0c69d550cfa87113337c0cc8503cb6de8c96bf6b2e5)
' @50030 inicio do programa (B$?EVT)
GOTO L_578a5   '@5017f
' ---- FUN_5000_78a5 @0x578a5  (0578a5_FUN_5000_78a5.lift.txt; evidence_id (assembly): ev_552571864c248a5b83bb65d207efd3529c929005520b84d1649988c34a2d1b15)
L_578a5:   ' entrada vinda de 050030_M_LACALCU
GOTO L_5ce99   '@578a5
' ---- RT_EA @0x5ce99  (05ce99_RT_EA.lift.txt; evidence_id (assembly): ev_28c5c6917d068582a1e801aaa48a3d681985dd19e07104b9e5e5713cfcba6b12)
L_5ce99:   ' entrada vinda de 0578a5_FUN_5000_78a5
RT_FIM   ' @5ce99 B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x70aea (chamada por CALL SUB_70aea no lift).
' Versao A; DS do original: inicio DS:34E2, CR LF DS:34DC, fim DS:34DF, margem em [DS:37D3], ESC L em [DS:34DA].
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
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)
    REDIM A_15b0!(-32768 TO -32768)
    REDIM A_15de!(-32768 TO -32768)
    REDIM A_160c!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_163a!(-32768 TO -32768, -32768 TO -32768)
    V_1376! = 0
    V_137a! = 0
    V_137e! = 0
    V_1382! = 0
    V_1386! = 0
    V_138a% = 0
    V_138c% = 0
    V_138e% = 0
    V_1390$ = ""
    V_1394! = 0
    V_1398! = 0
    V_139c! = 0
    V_13a0! = 0
    V_13a4! = 0
    V_13a8! = 0
    V_13ac! = 0
    V_13b0! = 0
    V_13b4% = 0
    V_13b6% = 0
    V_13b8! = 0
    V_13bc! = 0
    V_13c0! = 0
    V_13c4! = 0
    V_13c8! = 0
    V_13cc! = 0
    V_13d0! = 0
    V_13d4$ = ""
    V_13d8$ = ""
    V_13dc$ = ""
    V_13e0! = 0
    V_13e4# = 0
    V_13ec! = 0
    V_13f0! = 0
    V_13f4! = 0
    V_13f8! = 0
    V_13fc! = 0
    V_1400! = 0
    V_1404# = 0
    V_140c# = 0
    V_1414! = 0
    V_1418! = 0
    V_141c! = 0
    V_1420! = 0
    V_1424! = 0
    V_1428$ = ""
    V_142c! = 0
    V_1430! = 0
    V_1434! = 0
    V_1438! = 0
    V_143c$ = ""
    V_1440! = 0
    V_1444! = 0
    V_1448$ = ""
    V_144c! = 0
    V_1450$ = ""
    V_1454! = 0
    V_1458! = 0
    V_145c! = 0
    V_1460! = 0
    V_1464! = 0
    V_1468$ = ""
    V_146c! = 0
    V_1470! = 0
    V_1474$ = ""
    V_1478! = 0
    V_147c! = 0
    V_1480$ = ""
    V_1484! = 0
    V_1488! = 0
    V_148c! = 0
    V_1490! = 0
    V_1494! = 0
    V_1498$ = ""
    V_1670# = 0
    V_1678# = 0
    V_1680# = 0
    V_1688# = 0
    V_1690# = 0
    V_1698# = 0
    V_16a0# = 0
    V_16a8# = 0
    V_16b0# = 0
    V_16b8! = 0
    V_16bc! = 0
    V_16c0! = 0
    V_16c4! = 0
    V_16cc! = 0
    V_16d0# = 0
    V_16d8# = 0
    V_16e0# = 0
    V_16e8# = 0
    V_16f0# = 0
    V_16f8# = 0
    V_1700# = 0
    V_1708# = 0
    V_1710# = 0
    V_1718# = 0
    V_1720# = 0
    V_1728# = 0
    V_1730# = 0
    V_1738# = 0
    V_1740# = 0
    V_1748# = 0
    V_1750! = 0
    V_1754! = 0
    V_1758! = 0
    V_175c! = 0
    V_1760! = 0
    V_1764! = 0
    V_1768# = 0
    V_1770# = 0
    V_1778! = 0
    V_177c! = 0
    V_1780! = 0
    V_1784! = 0
    V_1788! = 0
    V_178c! = 0
    V_1790! = 0
    V_1794! = 0
    V_1798! = 0
    V_179c! = 0
    V_17a0! = 0
    V_17a4! = 0
    V_17a8! = 0
    V_17ac! = 0
    V_17e0# = 0
    V_17e8# = 0
    V_17f0# = 0
    V_17f8# = 0
    V_1800! = 0
    V_1804! = 0
    V_1808! = 0
    V_180c! = 0
    V_1810! = 0
    V_1814! = 0
    V_1818! = 0
    V_181c! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_10529: BEEP; GOSUB L_10284; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_10554: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10652: sai da SUB (BEEP; GOSUB L_10284; RT_SCREEN 0; RETURN L_10695)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H1022f: ON ERROR GOTO L_1022f
        CASE &H10619: ON ERROR GOTO L_10619
        CASE &H10f7e: ON ERROR GOTO L_10f7e
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_1d177   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1d177)
    ' ---- FUN_1000_d177 @0x1d177  (01d177_FUN_1000_d177.lift.txt; evidence_id (assembly): ev_f0602fb01432d6164c0b8b02372762367d71ed3c5a51999ca1478897331d6177)
    BEEP   '@1d184
    BEEP   '@1d18e
    BEEP   '@1d198
    RT_SCREEN 0   '@1d1a2
    RT_VIEWPRINT 1, 25   '@1d1b7
    RT_CLOSE   '@1d1c9 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!))   '@1d1d6 DS:208e
    RT_CLS 0   '@1d21b
    LOCATE 10, 1   '@1d228
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1d243 DS:1820,2c84
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@1d263 DS:1820,2c9e
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@1d283 DS:1820,2cca
L_1d2a8:
    CALL MIXT_07f1_LimpaTeclado   '@1d2ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@1d2b7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1d2d3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1d2a8   '@1d2dd
    ' ---- F_1d2e4 @0x1d2e4  (01d2e4_F_1d2e4.lift.txt; evidence_id (assembly): ev_d5986bf930f0fbfd7dbe5814384769c6df4fd06ae3111f6f14b819b4aa24b930)
    ' END SUB   '@1d2e4
END SUB

SUB S_2018c   ' entrada de SUB/FUNCTION (B$ENRA, locais 688 bytes) (0x2018c)
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
    ' ---- FUN_2000_018c @0x2018c  (02018c_FUN_2000_018c.lift.txt; evidence_id (assembly): ev_344eeabd40b47387ded7cd035ecd235ce52ccef0658f148255d55b85ea5efb5a)
    V_0f1c$ = ""   '@20194 DS:2cf0
    V_0ef4# = 10000000000.0#   '@201a6 DS:2cf4
    V_0efc# = 10000000000.0#   '@201b7 DS:2cf4
    L_BP0e! = FX##(V_16f0#) / 1.0#   '@201c8 DS:2cfc
    L_BP12! = FX##(V_1700#) / 1.0#   '@201de DS:2cfc
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP16!)   '@201ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a! = FX##(V_16d0#) / 1.0#   '@201ff DS:2cfc
    L_BP1e! = FX##(V_16e0#) / 1.0#   '@2020f DS:2cfc
    CALL MIXT_0877_Menor(L_BP1a!, L_BP1e!, L_BP22!)   '@2021e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP26! = FX##(V_16f0#) / 1.0#   '@20230 DS:2cfc
    L_BP2a! = FX##(V_1700#) / 1.0#   '@20240 DS:2cfc
    CALL MIXT_0877_Menor(L_BP26!, L_BP2a!, L_BP2e!)   '@2024f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP32! = FX##(V_16d0#) / 1.0#   '@20261 DS:2cfc
    L_BP36! = FX##(V_16e0#) / 1.0#   '@20271 DS:2cfc
    CALL MIXT_082a_Maior(L_BP32!, L_BP36!, L_BP3a!)   '@20280
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP2e! > L_BP3a! OR L_BP16! < L_BP22!) THEN GOTO L_202ce   '@20292
    GOTO L_21731   '@202c6
L_202ce:
    L_BP3e! = FX##(V_16f8#) / 1.0#   '@202ce DS:2cfc
    L_BP42! = FX##(V_1708#) / 1.0#   '@202e4 DS:2cfc
    CALL MIXT_082a_Maior(L_BP3e!, L_BP42!, L_BP46!)   '@202f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4a! = FX##(V_16d8#) / 1.0#   '@20305 DS:2cfc
    L_BP4e! = FX##(V_16e8#) / 1.0#   '@20315 DS:2cfc
    CALL MIXT_0877_Menor(L_BP4a!, L_BP4e!, L_BP52!)   '@20324
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP56! = FX##(V_16f8#) / 1.0#   '@20336 DS:2cfc
    L_BP5a! = FX##(V_1708#) / 1.0#   '@20346 DS:2cfc
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@20355
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP62! = FX##(V_16d8#) / 1.0#   '@20367 DS:2cfc
    L_BP66! = FX##(V_16e8#) / 1.0#   '@20377 DS:2cfc
    CALL MIXT_082a_Maior(L_BP62!, L_BP66!, L_BP6a!)   '@20386
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP5e! > L_BP6a! OR L_BP46! < L_BP52!) THEN GOTO L_203d4   '@20398
    GOTO L_21731   '@203cc
L_203d4:
    IF NOT (V_16d8# = V_16e8# AND V_16f8# = V_1708#) THEN GOTO L_2052b   '@203d4
    L_BP6e! = FX##(V_16f0#) / 1.0#   '@20412 DS:2cfc
    L_BP72! = FX##(V_1700#) / 1.0#   '@20428 DS:2cfc
    CALL MIXT_082a_Maior(L_BP6e!, L_BP72!, L_BP76!)   '@20437
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a! = FX##(V_16d0#) / 1.0#   '@20449 DS:2cfc
    L_BP7e! = FX##(V_16e0#) / 1.0#   '@20459 DS:2cfc
    CALL MIXT_0877_Menor(L_BP7a!, L_BP7e!, L_BP82!)   '@20468
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP86! = FX##(V_16d0#) / 1.0#   '@2047b DS:2cfc
    L_BP8a! = FX##(V_16e0#) / 1.0#   '@2048c DS:2cfc
    CALL MIXT_082a_Maior(L_BP86!, L_BP8a!, L_BP8e!)   '@2049c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP92! = FX##(V_16f0#) / 1.0#   '@204b1 DS:2cfc
    L_BP96! = FX##(V_1700#) / 1.0#   '@204c2 DS:2cfc
    CALL MIXT_0877_Menor(L_BP92!, L_BP96!, L_BP9a!)   '@204d2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP8e! < L_BP9a! OR L_BP76! < L_BP82!) THEN GOTO L_20526   '@204e7
    GOTO L_21731   '@2051e
L_20526:
L_2052b:
    IF NOT (V_16f8# = V_1708#) THEN GOTO L_2055f   '@2052b
    V_0efc# = V_16f8#   '@20546
    GOTO L_20d59   '@20557
L_2055f:
    IF NOT (V_16d8# = V_16e8#) THEN GOTO L_20593   '@2055f
    V_0efc# = V_16d8#   '@2057a
    GOTO L_20d59   '@2058b
L_20593:
    IF NOT (ABS((FX##(V_1700#) - V_16f0#) / (FX##(V_1708#) - V_16f8#) - (FX##(V_16e0#) - V_16d0#) / (FX##(V_16e8#) - V_16d8#)) < FX##(V_133a!)) THEN GOTO L_20bfc   '@20593
    L_BP9e! = FX##(V_16f8#) / 1.0#   '@205dd DS:2cfc
    L_BPa2! = FX##(V_1708#) / 1.0#   '@205f4 DS:2cfc
    CALL MIXT_082a_Maior(L_BP9e!, L_BPa2!, L_BPa6!)   '@20604
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPaa! = FX##(V_16d8#) / 1.0#   '@20619 DS:2cfc
    L_BPae! = FX##(V_16e8#) / 1.0#   '@2062a DS:2cfc
    CALL MIXT_0877_Menor(L_BPaa!, L_BPae!, L_BPb2!)   '@2063a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb6! = FX##(V_16d8#) / 1.0#   '@2064f DS:2cfc
    L_BPba! = FX##(V_16e8#) / 1.0#   '@20660 DS:2cfc
    CALL MIXT_082a_Maior(L_BPb6!, L_BPba!, L_BPbe!)   '@20670
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc2! = FX##(V_16f8#) / 1.0#   '@20685 DS:2cfc
    L_BPc6! = FX##(V_1708#) / 1.0#   '@20696 DS:2cfc
    CALL MIXT_0877_Menor(L_BPc2!, L_BPc6!, L_BPca!)   '@206a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPbe! < L_BPca! OR L_BPa6! < L_BPb2!) THEN GOTO L_206fb   '@206bb
    GOTO L_21731   '@206f3
L_206fb:
    IF NOT (ABS(V_16d0# - (FX##(V_16e0#) - V_16d0#) / (FX##(V_16e8#) - V_16d8#) * V_16d8# - (V_16f0# - (FX##(V_1700#) - V_16f0#) / (FX##(V_1708#) - V_16f8#) * V_16f8#)) > FX##(V_133a!)) THEN GOTO L_20767   '@206fb
    GOTO L_21731   '@2075f
L_20767:
    L_BPce! = FX##(V_16f8#) / 1.0#   '@20767 DS:2cfc
    L_BPd2! = FX##(V_1708#) / 1.0#   '@2077e DS:2cfc
    CALL MIXT_082a_Maior(L_BPce!, L_BPd2!, L_BPd6!)   '@2078e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPda! = FX##(V_16d8#) / 1.0#   '@207a3 DS:2cfc
    L_BPde! = FX##(V_16e8#) / 1.0#   '@207b4 DS:2cfc
    CALL MIXT_082a_Maior(L_BPda!, L_BPde!, L_BPe2!)   '@207c4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe6! = FX##(V_16f8#) / 1.0#   '@207d9 DS:2cfc
    L_BPea! = FX##(V_1708#) / 1.0#   '@207ea DS:2cfc
    CALL MIXT_0877_Menor(L_BPe6!, L_BPea!, L_BPee!)   '@207fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf2! = FX##(V_16d8#) / 1.0#   '@2080f DS:2cfc
    L_BPf6! = FX##(V_16e8#) / 1.0#   '@20820 DS:2cfc
    CALL MIXT_082a_Maior(L_BPf2!, L_BPf6!, L_BPfa!)   '@20830
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPee! < L_BPfa! AND L_BPd6! >= L_BPe2!) THEN GOTO L_209ab   '@20845
    L_BPfe! = FX##(V_16d8#) / 1.0#   '@2087d DS:2cfc
    L_BP102! = FX##(V_16e8#) / 1.0#   '@20894 DS:2cfc
    CALL MIXT_082a_Maior(L_BPfe!, L_BP102!, L_BP106!)   '@208a4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP106!   '@208b9
    L_BP10a! = FX##(V_16f8#) / 1.0#   '@208c4 DS:2cfc
    L_BP10e! = FX##(V_1708#) / 1.0#   '@208db DS:2cfc
    CALL MIXT_082a_Maior(L_BP10a!, L_BP10e!, L_BP112!)   '@208eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP112!) = FX##(V_0efc#)) THEN GOTO L_209a6   '@20900
    L_BP116! = FX##(V_16d8#) / 1.0#   '@20915 DS:2cfc
    L_BP11a! = FX##(V_16e8#) / 1.0#   '@2092c DS:2cfc
    CALL MIXT_0877_Menor(L_BP116!, L_BP11a!, L_BP11e!)   '@2093c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP122! = FX##(V_16f8#) / 1.0#   '@20951 DS:2cfc
    L_BP126! = FX##(V_1708#) / 1.0#   '@20962 DS:2cfc
    CALL MIXT_0877_Menor(L_BP122!, L_BP126!, L_BP12a!)   '@20972
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP11e!, L_BP12a!, L_BP12e!)   '@20986
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP12e!   '@2099b
L_209a6:
L_209ab:
    L_BP132! = FX##(V_16d8#) / 1.0#   '@209ab DS:2cfc
    L_BP136! = FX##(V_16e8#) / 1.0#   '@209c2 DS:2cfc
    CALL MIXT_082a_Maior(L_BP132!, L_BP136!, L_BP13a!)   '@209d2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP13e! = FX##(V_16f8#) / 1.0#   '@209e7 DS:2cfc
    L_BP142! = FX##(V_1708#) / 1.0#   '@209f8 DS:2cfc
    CALL MIXT_082a_Maior(L_BP13e!, L_BP142!, L_BP146!)   '@20a08
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP14a! = FX##(V_16d8#) / 1.0#   '@20a1d DS:2cfc
    L_BP14e! = FX##(V_16e8#) / 1.0#   '@20a2e DS:2cfc
    CALL MIXT_0877_Menor(L_BP14a!, L_BP14e!, L_BP152!)   '@20a3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP156! = FX##(V_16f8#) / 1.0#   '@20a53 DS:2cfc
    L_BP15a! = FX##(V_1708#) / 1.0#   '@20a64 DS:2cfc
    CALL MIXT_082a_Maior(L_BP156!, L_BP15a!, L_BP15e!)   '@20a74
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP152! < L_BP15e! AND L_BP13a! >= L_BP146!) THEN GOTO L_20bef   '@20a89
    L_BP162! = FX##(V_16f8#) / 1.0#   '@20ac1 DS:2cfc
    L_BP166! = FX##(V_1708#) / 1.0#   '@20ad8 DS:2cfc
    CALL MIXT_082a_Maior(L_BP162!, L_BP166!, L_BP16a!)   '@20ae8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP16a!   '@20afd
    L_BP16e! = FX##(V_16d8#) / 1.0#   '@20b08 DS:2cfc
    L_BP172! = FX##(V_16e8#) / 1.0#   '@20b1f DS:2cfc
    CALL MIXT_082a_Maior(L_BP16e!, L_BP172!, L_BP176!)   '@20b2f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP176!) = FX##(V_0efc#)) THEN GOTO L_20bea   '@20b44
    L_BP17a! = FX##(V_16f8#) / 1.0#   '@20b59 DS:2cfc
    L_BP17e! = FX##(V_1708#) / 1.0#   '@20b70 DS:2cfc
    CALL MIXT_0877_Menor(L_BP17a!, L_BP17e!, L_BP182!)   '@20b80
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP186! = FX##(V_16d8#) / 1.0#   '@20b95 DS:2cfc
    L_BP18a! = FX##(V_16e8#) / 1.0#   '@20ba6 DS:2cfc
    CALL MIXT_0877_Menor(L_BP186!, L_BP18a!, L_BP18e!)   '@20bb6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP182!, L_BP18e!, L_BP192!)   '@20bca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP192!   '@20bdf
L_20bea:
L_20bef:
    GOTO L_20d59   '@20bef
L_20bfc:
    V_0efc# = (FX##(V_1700#) - V_16e0# + ((FX##(V_16e0#) - V_16d0#) / (FX##(V_16e8#) - V_16d8#) * V_16e8# - (FX##(V_1700#) - V_16f0#) / (FX##(V_1708#) - V_16f8#) * V_1708#)) / ((FX##(V_16e0#) - V_16d0#) / (FX##(V_16e8#) - V_16d8#) - (FX##(V_1700#) - V_16f0#) / (FX##(V_1708#) - V_16f8#))   '@20bfc
    IF NOT (ABS(FX##(V_16f8#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_20cb8   '@20c84
    V_0efc# = V_16f8#   '@20ca7
L_20cb8:
    IF NOT (ABS(FX##(V_1708#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_20cec   '@20cb8
    V_0efc# = V_1708#   '@20cdb
L_20cec:
    IF NOT (ABS(FX##(V_16d8#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_20d20   '@20cec
    V_0efc# = V_16d8#   '@20d0f
L_20d20:
    IF NOT (ABS(FX##(V_16e8#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_20d54   '@20d20
    V_0efc# = V_16e8#   '@20d43
L_20d54:
L_20d59:
    L_BP196! = FX##(V_16f8#) / 1.0#   '@20d5e DS:2cfc
    L_BP19a! = FX##(V_1708#) / 1.0#   '@20d75 DS:2cfc
    CALL MIXT_082a_Maior(L_BP196!, L_BP19a!, L_BP19e!)   '@20d85
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a2! = FX##(V_16f8#) / 1.0#   '@20d9a DS:2cfc
    L_BP1a6! = FX##(V_1708#) / 1.0#   '@20dab DS:2cfc
    CALL MIXT_0877_Menor(L_BP1a2!, L_BP1a6!, L_BP1aa!)   '@20dbb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ae! = FX##(V_16d8#) / 1.0#   '@20dd0 DS:2cfc
    L_BP1b2! = FX##(V_16e8#) / 1.0#   '@20de1 DS:2cfc
    CALL MIXT_082a_Maior(L_BP1ae!, L_BP1b2!, L_BP1b6!)   '@20df1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ba! = FX##(V_16d8#) / 1.0#   '@20e06 DS:2cfc
    L_BP1be! = FX##(V_16e8#) / 1.0#   '@20e17 DS:2cfc
    CALL MIXT_0877_Menor(L_BP1ba!, L_BP1be!, L_BP1c2!)   '@20e27
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_16d8# <> V_16e8# AND (FX##(V_133a!) + V_0efc# < FX##(L_BP1c2!) OR FX##(V_0efc#) - V_133a! > FX##(L_BP1b6!)) OR V_16f8# <> V_1708# AND (FX##(V_133a!) + V_0efc# < FX##(L_BP1aa!) OR FX##(V_0efc#) - V_133a! > FX##(L_BP19e!))) THEN GOTO L_20f02   '@20e3c
    GOTO L_21731   '@20efa
L_20f02:
    IF NOT (V_16f0# = V_1700#) THEN GOTO L_20f36   '@20f02
    V_0ef4# = V_16f0#   '@20f1d
    GOTO L_21580   '@20f2e
L_20f36:
    IF NOT (V_16d8# = V_16e8# AND V_16f8# = V_1708#) THEN GOTO L_21409   '@20f36
    L_BP1c6! = FX##(V_16f0#) / 1.0#   '@20f74 DS:2cfc
    L_BP1ca! = FX##(V_1700#) / 1.0#   '@20f8b DS:2cfc
    CALL MIXT_082a_Maior(L_BP1c6!, L_BP1ca!, L_BP1ce!)   '@20f9b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d2! = FX##(V_16d0#) / 1.0#   '@20fb0 DS:2cfc
    L_BP1d6! = FX##(V_16e0#) / 1.0#   '@20fc1 DS:2cfc
    CALL MIXT_0877_Menor(L_BP1d2!, L_BP1d6!, L_BP1da!)   '@20fd1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1de! = FX##(V_16f0#) / 1.0#   '@20fe6 DS:2cfc
    L_BP1e2! = FX##(V_1700#) / 1.0#   '@20ff7 DS:2cfc
    CALL MIXT_082a_Maior(L_BP1de!, L_BP1e2!, L_BP1e6!)   '@21007
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ea! = FX##(V_16d0#) / 1.0#   '@2101c DS:2cfc
    L_BP1ee! = FX##(V_16e0#) / 1.0#   '@2102d DS:2cfc
    CALL MIXT_082a_Maior(L_BP1ea!, L_BP1ee!, L_BP1f2!)   '@2103d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1e6! <= L_BP1f2! AND L_BP1ce! >= L_BP1da!) THEN GOTO L_211b8   '@21052
    L_BP1f6! = FX##(V_16f0#) / 1.0#   '@2108a DS:2cfc
    L_BP1fa! = FX##(V_1700#) / 1.0#   '@210a1 DS:2cfc
    CALL MIXT_082a_Maior(L_BP1f6!, L_BP1fa!, L_BP1fe!)   '@210b1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP1fe!   '@210c6
    L_BP202! = FX##(V_16d0#) / 1.0#   '@210d1 DS:2cfc
    L_BP206! = FX##(V_16e0#) / 1.0#   '@210e8 DS:2cfc
    CALL MIXT_082a_Maior(L_BP202!, L_BP206!, L_BP20a!)   '@210f8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP20a!) = FX##(V_0ef4#)) THEN GOTO L_211b3   '@2110d
    L_BP20e! = FX##(V_16f0#) / 1.0#   '@21122 DS:2cfc
    L_BP212! = FX##(V_1700#) / 1.0#   '@21139 DS:2cfc
    CALL MIXT_0877_Menor(L_BP20e!, L_BP212!, L_BP216!)   '@21149
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP21a! = FX##(V_16d0#) / 1.0#   '@2115e DS:2cfc
    L_BP21e! = FX##(V_16e0#) / 1.0#   '@2116f DS:2cfc
    CALL MIXT_0877_Menor(L_BP21a!, L_BP21e!, L_BP222!)   '@2117f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP216!, L_BP222!, L_BP226!)   '@21193
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP226!   '@211a8
L_211b3:
L_211b8:
    L_BP22a! = FX##(V_16d0#) / 1.0#   '@211b8 DS:2cfc
    L_BP22e! = FX##(V_16e0#) / 1.0#   '@211cf DS:2cfc
    CALL MIXT_082a_Maior(L_BP22a!, L_BP22e!, L_BP232!)   '@211df
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP236! = FX##(V_16f0#) / 1.0#   '@211f4 DS:2cfc
    L_BP23a! = FX##(V_1700#) / 1.0#   '@21205 DS:2cfc
    CALL MIXT_0877_Menor(L_BP236!, L_BP23a!, L_BP23e!)   '@21215
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP242! = FX##(V_16d0#) / 1.0#   '@2122a DS:2cfc
    L_BP246! = FX##(V_16e0#) / 1.0#   '@2123b DS:2cfc
    CALL MIXT_082a_Maior(L_BP242!, L_BP246!, L_BP24a!)   '@2124b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24e! = FX##(V_16f0#) / 1.0#   '@21260 DS:2cfc
    L_BP252! = FX##(V_1700#) / 1.0#   '@21271 DS:2cfc
    CALL MIXT_082a_Maior(L_BP24e!, L_BP252!, L_BP256!)   '@21281
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP24a! <= L_BP256! AND L_BP232! >= L_BP23e!) THEN GOTO L_213fc   '@21296
    L_BP25a! = FX##(V_16d0#) / 1.0#   '@212ce DS:2cfc
    L_BP25e! = FX##(V_16e0#) / 1.0#   '@212e5 DS:2cfc
    CALL MIXT_082a_Maior(L_BP25a!, L_BP25e!, L_BP262!)   '@212f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP262!   '@2130a
    L_BP266! = FX##(V_16f0#) / 1.0#   '@21315 DS:2cfc
    L_BP26a! = FX##(V_1700#) / 1.0#   '@2132c DS:2cfc
    CALL MIXT_082a_Maior(L_BP266!, L_BP26a!, L_BP26e!)   '@2133c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP26e!) = FX##(V_0ef4#)) THEN GOTO L_213f7   '@21351
    L_BP272! = FX##(V_16d0#) / 1.0#   '@21366 DS:2cfc
    L_BP276! = FX##(V_16e0#) / 1.0#   '@2137d DS:2cfc
    CALL MIXT_0877_Menor(L_BP272!, L_BP276!, L_BP27a!)   '@2138d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP27e! = FX##(V_16f0#) / 1.0#   '@213a2 DS:2cfc
    L_BP282! = FX##(V_1700#) / 1.0#   '@213b3 DS:2cfc
    CALL MIXT_0877_Menor(L_BP27e!, L_BP282!, L_BP286!)   '@213c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP27a!, L_BP286!, L_BP28a!)   '@213d7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP28a!   '@213ec
L_213f7:
L_213fc:
    GOTO L_21576   '@213fc
L_21409:
    IF NOT (V_16f8# <> V_1708#) THEN GOTO L_21464   '@21409
    V_0ef4# = V_1700# - (FX##(V_1708#) - V_0efc#) * (FX##(V_1700#) - V_16f0#) / (FX##(V_1708#) - V_16f8#)   '@21424
    GOTO L_214a1   '@2145c
L_21464:
    V_0ef4# = V_16e0# - (FX##(V_16e8#) - V_0efc#) * (FX##(V_16e0#) - V_16d0#) / (FX##(V_16e8#) - V_16d8#)   '@21464
L_214a1:
    IF NOT (ABS(FX##(V_16f0#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_214d5   '@214a1
    V_0ef4# = V_16f0#   '@214c4
L_214d5:
    IF NOT (ABS(FX##(V_1700#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_21509   '@214d5
    V_0ef4# = V_1700#   '@214f8
L_21509:
    IF NOT (ABS(FX##(V_16d0#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_2153d   '@21509
    V_0ef4# = V_16d0#   '@2152c
L_2153d:
    IF NOT (ABS(FX##(V_16e0#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_21571   '@2153d
    V_0ef4# = V_16e0#   '@21560
L_21571:
L_21576:
L_21580:
    L_BP28e! = FX##(V_16f0#) / 1.0#   '@21580 DS:2cfc
    L_BP292! = FX##(V_1700#) / 1.0#   '@21597 DS:2cfc
    CALL MIXT_082a_Maior(L_BP28e!, L_BP292!, L_BP296!)   '@215a7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP29a! = FX##(V_16f0#) / 1.0#   '@215bc DS:2cfc
    L_BP29e! = FX##(V_1700#) / 1.0#   '@215cd DS:2cfc
    CALL MIXT_0877_Menor(L_BP29a!, L_BP29e!, L_BP2a2!)   '@215dd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a6! = FX##(V_16d0#) / 1.0#   '@215f2 DS:2cfc
    L_BP2aa! = FX##(V_16e0#) / 1.0#   '@21603 DS:2cfc
    CALL MIXT_082a_Maior(L_BP2a6!, L_BP2aa!, L_BP2ae!)   '@21613
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2b2! = FX##(V_16d0#) / 1.0#   '@21628 DS:2cfc
    L_BP2b6! = FX##(V_16e0#) / 1.0#   '@21639 DS:2cfc
    CALL MIXT_0877_Menor(L_BP2b2!, L_BP2b6!, L_BP2ba!)   '@21649
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_16d0# <> V_16e0# AND (FX##(V_133a!) + V_0ef4# < FX##(L_BP2ba!) OR FX##(V_0ef4#) - V_133a! > FX##(L_BP2ae!)) OR V_16f0# <> V_1700# AND (FX##(V_133a!) + V_0ef4# < FX##(L_BP2a2!) OR FX##(V_0ef4#) - V_133a! > FX##(L_BP296!))) THEN GOTO L_21724   '@2165e
    GOTO L_21731   '@2171c
L_21724:
    GOTO L_2174d   '@21724
L_21731:
    V_0f1c$ = "NAO"   '@21736 DS:2d04
L_2174d:
    ' END SUB   '@2174d
END SUB

SUB S_2175d   ' entrada de SUB/FUNCTION (B$ENRA, locais 54 bytes) (0x2175d)
    DIM L_BP0c%
    DIM L_BP10!
    DIM L_BP14!
    DIM L_BP18!
    DIM L_BP1c!
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP40!
    ' ---- FUN_2000_175d @0x2175d  (02175d_FUN_2000_175d.lift.txt; evidence_id (assembly): ev_260499d33e31866f4fbeea290b841fcc32dde366f9f8a2913b3805317f6b4865)
    L_BP0c% = (V_0f18$ = "NAO")   '@21765 DS:2d04
    IF NOT ((V_0f20$ = "NAO" OR L_BP0c%) <> 0) THEN GOTO L_217a7   '@2178a DS:2d04
    GOTO L_21e4d   '@2179f
L_217a7:
    V_178c! = 0.0   '@217ac DS:2d0c
    L_BP20! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@217bd
    FOR V_1778! = 1.0 TO L_BP20!   '@217ec DS:2d10
    IF NOT (A_163a!(RT_CINT%(FX##(V_1778!)), 0) = -100.0) THEN GOTO L_21830   '@217f4 DS:2d14
    GOTO L_21dcf   '@21828
L_21830:
    L_BP10! = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@21830
    L_BP14! = A_15de!(RT_CINT%(FX##(V_1778!)))   '@21856
    L_BP1c! = FX##(V_1778!) + 1.0   '@2187c DS:2d10
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP1c!) THEN GOTO L_218d8   '@21891
    L_BP1c! = 1.0   '@218c8 DS:2d10
L_218d8:
L_218dd:
    IF NOT (A_163a!(RT_CINT%(FX##(L_BP1c!)), 0) = -100.0) THEN GOTO L_2197d   '@218e2 DS:2d14
    L_BP1c! = FX##(L_BP1c!) + 1.0   '@21915 DS:2d10
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP1c!) THEN GOTO L_21970   '@21929
    L_BP1c! = 1.0   '@21960 DS:2d10
L_21970:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_218dd   '@21970
L_2197d:
    L_BP18! = A_15b0!(RT_CINT%(FX##(L_BP1c!)))   '@2197d
    L_BP1c! = A_15de!(RT_CINT%(FX##(L_BP1c!)))   '@219a2
    IF NOT (ABS(FX##(V_0efc#) - L_BP1c!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP18!) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BP14!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP10!) < FX##(V_133a!)) THEN GOTO L_21a7c   '@219c7
    V_178c! = 1.0   '@21a63 DS:2d10
    GOTO L_21dff   '@21a74
L_21a7c:
    CALL MIXT_0877_Menor(L_BP10!, L_BP18!, L_BP24!)   '@21a7c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP24!) > FX##(V_133a!) + V_0ef4#) THEN GOTO L_21ab4   '@21a93
    GOTO L_21dcf   '@21aac
L_21ab4:
    CALL MIXT_0877_Menor(L_BP14!, L_BP1c!, L_BP28!)   '@21ab4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP14!, L_BP1c!, L_BP2c!)   '@21aca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP2c!) < FX##(V_0efc#) OR FX##(L_BP28!) > FX##(V_0efc#)) THEN GOTO L_21b1a   '@21adc
    GOTO L_21dcf   '@21b12
L_21b1a:
    CALL MIXT_082a_Maior(L_BP10!, L_BP18!, L_BP30!)   '@21b1a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(V_0ef4#) - V_133a! > FX##(L_BP30!) OR FX##(L_BP14!) <> FX##(V_0efc#)) AND L_BP14! = L_BP1c!) THEN GOTO L_21b90   '@21b31
    GOTO L_21dcf   '@21b88
L_21b90:
    CALL MIXT_082a_Maior(L_BP14!, L_BP1c!, L_BP34!)   '@21b90
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP14!, L_BP1c!, L_BP38!)   '@21ba6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP10!, L_BP18!, L_BP3c!)   '@21bb7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP3c!) <= FX##(V_0ef4#) AND (FX##(L_BP38!) <= FX##(V_0efc#) AND FX##(L_BP34!) > FX##(V_0efc#))) THEN GOTO L_21ca3   '@21bc9
    V_178c! = FX##(V_178c!) + 1.0   '@21c19 DS:2d10
    IF NOT (ABS(FX##(V_0ef4#) - L_BP10!) < FX##(V_133a!) AND ABS(FX##(L_BP10!) - L_BP18!) < FX##(V_133a!)) THEN GOTO L_21c96   '@21c2f
    V_178c! = 1.0   '@21c7d DS:2d10
    GOTO L_21dff   '@21c8e
L_21c96:
    GOTO L_21dcf   '@21c96
L_21ca3:
    IF NOT (L_BP14! = L_BP1c!) THEN GOTO L_21cd5   '@21ca3
    V_178c! = 1.0   '@21cbc DS:2d10
    GOTO L_21dff   '@21ccd
L_21cd5:
    CALL MIXT_082a_Maior(L_BP14!, L_BP1c!, L_BP40!)   '@21cd5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP40!) = FX##(V_0efc#)) THEN GOTO L_21d08   '@21cec
    GOTO L_21dcf   '@21d00
L_21d08:
    IF NOT (FX##(V_133a!) + V_0ef4# >= L_BP10! + (FX##(V_0efc#) - L_BP14!) * (FX##(L_BP18!) - L_BP10!) / (FX##(L_BP1c!) - L_BP14!)) THEN GOTO L_21dca   '@21d08
    V_178c! = FX##(V_178c!) + 1.0   '@21d4c DS:2d10
    IF NOT (ABS(V_0ef4# - (L_BP10! + (FX##(V_0efc#) - L_BP14!) * (FX##(L_BP18!) - L_BP10!) / (FX##(L_BP1c!) - L_BP14!))) < FX##(V_133a!)) THEN GOTO L_21dc5   '@21d62
    V_178c! = 1.0   '@21dac DS:2d10
    GOTO L_21dff   '@21dbd
L_21dc5:
L_21dca:
L_21dcf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@21dd4 DS:2d10
L_21dff:
    IF NOT (FX##(V_178c!) / 2.0 = RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_21e48   '@21dff DS:2d18
    V_0f18$ = "NAO"   '@21e36 DS:2d04
L_21e48:
L_21e4d:
    ' END SUB   '@21e4d
END SUB

SUB S_21e5d   ' entrada de SUB/FUNCTION (B$ENRA, locais 32 bytes) (0x21e5d)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    ' ---- FUN_2000_1e5d @0x21e5d  (021e5d_FUN_2000_1e5d.lift.txt; evidence_id (assembly): ev_122daffb94e40083f15cf95494500bdccd6bc14f0f3849276e948dee3d987c6f)
    V_1730# = A_15b0!(RT_CINT%(FX##(V_1790!)))   '@21e6a
    V_1738# = A_15de!(RT_CINT%(FX##(V_1790!)))   '@21e91
    V_1768# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@21eb8
    V_1770# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@21edf
    IF NOT (V_1730# = V_1768#) THEN GOTO L_21f75   '@21f06
    V_16a8# = FX##(V_0e68_pi#) / 2.0#   '@21f21 DS:2d1c
    IF NOT (V_1738# < V_1770#) THEN GOTO L_21f6d   '@21f37
    V_16a8# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@21f52 DS:2d1c,2d24
L_21f6d:
    GOTO L_22134   '@21f6d
L_21f75:
    IF NOT (V_1738# <= V_1770# AND V_1730# < V_1768#) THEN GOTO L_21fe2   '@21f75
    V_16a8# = ATN((FX##(V_1770#) - V_1738#) / (FX##(V_1768#) - V_1730#)) + V_0e68_pi#   '@21fb3
L_21fe2:
    IF NOT (V_1738# >= V_1770# AND V_1730# > V_1768#) THEN GOTO L_2204a   '@21fe2
    V_16a8# = ATN((FX##(V_1738#) - V_1770#) / (FX##(V_1730#) - V_1768#))   '@22020
L_2204a:
    IF NOT (V_1738# < V_1770# AND V_1730# > V_1768#) THEN GOTO L_220bf   '@2204a
    V_16a8# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_1770#) - V_1738#) / (FX##(V_1730#) - V_1768#))   '@22088 DS:2d1c
L_220bf:
    IF NOT (V_1738# > V_1770# AND V_1730# < V_1768#) THEN GOTO L_2212f   '@220bf
    V_16a8# = V_0e68_pi# - ATN((FX##(V_1738#) - V_1770#) / (FX##(V_1768#) - V_1730#))   '@220fd
L_2212f:
L_22134:
    V_1768# = A_15b0!(RT_CINT%(FX##(V_1798!)))   '@22134
    V_1770# = A_15de!(RT_CINT%(FX##(V_1798!)))   '@2215b
    V_1740# = A_15b0!(RT_CINT%(FX##(V_179c!)))   '@22182
    V_1748# = A_15de!(RT_CINT%(FX##(V_179c!)))   '@221a9
    IF NOT (V_1740# = V_1768#) THEN GOTO L_2223f   '@221d0
    V_16b0# = FX##(V_0e68_pi#) / 2.0#   '@221eb DS:2d1c
    IF NOT (V_1748# < V_1770#) THEN GOTO L_22237   '@22201
    V_16b0# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@2221c DS:2d1c,2d24
L_22237:
    GOTO L_223fe   '@22237
L_2223f:
    IF NOT (V_1748# <= V_1770# AND V_1740# < V_1768#) THEN GOTO L_222ac   '@2223f
    V_16b0# = ATN((FX##(V_1770#) - V_1748#) / (FX##(V_1768#) - V_1740#)) + V_0e68_pi#   '@2227d
L_222ac:
    IF NOT (V_1748# >= V_1770# AND V_1740# > V_1768#) THEN GOTO L_22314   '@222ac
    V_16b0# = ATN((FX##(V_1748#) - V_1770#) / (FX##(V_1740#) - V_1768#))   '@222ea
L_22314:
    IF NOT (V_1748# < V_1770# AND V_1740# > V_1768#) THEN GOTO L_22389   '@22314
    V_16b0# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_1770#) - V_1748#) / (FX##(V_1740#) - V_1768#))   '@22352 DS:2d1c
L_22389:
    IF NOT (V_1748# > V_1770# AND V_1740# < V_1768#) THEN GOTO L_223f9   '@22389
    V_16b0# = V_0e68_pi# - ATN((FX##(V_1748#) - V_1770#) / (FX##(V_1768#) - V_1740#))   '@223c7
L_223f9:
L_223fe:
    IF NOT (V_16a8# <= V_16b0#) THEN GOTO L_228a6   '@223fe
    V_16a0# = (FX##(V_16a8#) + V_16b0#) / 2.0#   '@22419 DS:2d1c
    IF NOT (ABS(FX##(V_16b0#) - V_0e68_pi# - V_16a8#) >= FX##(V_133e!) AND (ABS(FX##(V_16a8#) - V_0e68_pi# - V_16b0#) >= FX##(V_133e!) AND ABS(FX##(V_16a8#) - V_16b0#) >= FX##(V_133e!))) THEN GOTO L_2289e   '@22434
    L_BP1e! = V_1790!   '@224af
    GOSUB L_22e0f   '@224bf
    L_BP26! = L_BP22!   '@224cc
    L_BP1e! = V_1798!   '@224db
    GOSUB L_22e0f   '@224eb
    L_BP2a! = L_BP22!   '@224f8
    IF NOT (L_BP26! > L_BP2a! AND (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) <> 1 AND (L_BP2a! > 0.0 OR L_BP26! > 0.0))) THEN GOTO L_22697   '@22507 DS:2d0c
    IF NOT (ABS(RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP26!) + 1.0)) + RT_COS##(FX##(V_16b0#) - V_16a8#)) < FX##(V_133e!)) THEN GOTO L_225f3   '@22590 DS:2d10
    V_16a0# = FX##(V_0e68_pi#) / 2.0#   '@225d5 DS:2d1c
    GOTO L_2267c   '@225eb
L_225f3:
    V_16a0# = ATN(RT_SIN##(FX##(V_16b0#) - V_16a8#) / (RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP26!) + 1.0)) + RT_COS##(FX##(V_16b0#) - V_16a8#)))   '@225f3 DS:2d10
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_22677   '@22646 DS:2d2c
    V_16a0# = FX##(V_0e68_pi#) + V_16a0#   '@22661
L_22677:
L_2267c:
    V_16a0# = FX##(V_16a8#) + V_16a0#   '@2267c
L_22697:
    IF NOT (L_BP2a! > L_BP26! AND ((L_BP2a! > 0.0 OR L_BP26! > 0.0) AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) <> 1)) THEN GOTO L_22825   '@22697 DS:2d0c
    IF NOT (ABS(RT_SQR##((FX##(L_BP26!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(FX##(V_16b0#) - V_16a8#)) < FX##(V_133e!)) THEN GOTO L_22781   '@2271e DS:2d10
    V_16a0# = FX##(V_0e68_pi#) / 2.0#   '@22763 DS:2d1c
    GOTO L_2280a   '@22779
L_22781:
    V_16a0# = ATN(RT_SIN##(FX##(V_16b0#) - V_16a8#) / (RT_SQR##((FX##(L_BP26!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(FX##(V_16b0#) - V_16a8#)))   '@22781 DS:2d10
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_22805   '@227d4 DS:2d2c
    V_16a0# = FX##(V_0e68_pi#) + V_16a0#   '@227ef
L_22805:
L_2280a:
    V_16a0# = FX##(V_16b0#) - V_16a0#   '@2280a
L_22825:
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_2285b   '@22825 DS:2d2c
    V_16a0# = 2.0# * FX##(V_0e68_pi#) + V_16a0#   '@22840 DS:2d1c
L_2285b:
    IF NOT (2.0# * FX##(V_0e68_pi#) <= FX##(V_16a0#)) THEN GOTO L_22899   '@2285b DS:2d1c
    V_16a0# = V_16a0# - 2.0# * FX##(V_0e68_pi#)   '@2287b DS:2d1c
L_22899:
L_2289e:
    GOTO L_22d71   '@2289e
L_228a6:
    V_16a0# = (FX##(V_16a8#) + V_16b0#) / 2.0# + V_0e68_pi#   '@228a6 DS:2d1c
    IF NOT (ABS(FX##(V_16b0#) - V_0e68_pi# - V_16a8#) >= FX##(V_133e!) AND (ABS(FX##(V_16a8#) - V_0e68_pi# - V_16b0#) >= FX##(V_133e!) AND ABS(FX##(V_16a8#) - V_16b0#) >= FX##(V_133e!))) THEN GOTO L_22d2e   '@228c6
    L_BP1e! = V_1790!   '@22941
    GOSUB L_22e0f   '@22951
    L_BP26! = L_BP22!   '@2295e
    L_BP1e! = V_1798!   '@2296d
    GOSUB L_22e0f   '@2297d
    L_BP2a! = L_BP22!   '@2298a
    IF NOT (L_BP26! > L_BP2a! AND (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) <> 1 AND (L_BP2a! > 0.0 OR L_BP26! > 0.0))) THEN GOTO L_22b47   '@22999 DS:2d0c
    IF NOT (ABS(RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP26!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#)) < FX##(V_133e!)) THEN GOTO L_22a8f   '@22a22 DS:2d10,2d1c
    V_16a0# = FX##(V_0e68_pi#) / 2.0#   '@22a71 DS:2d1c
    GOTO L_22b2c   '@22a87
L_22a8f:
    V_16a0# = ATN(RT_SIN##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#) / (RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP26!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#)))   '@22a8f DS:2d10,2d1c
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_22b27   '@22af6 DS:2d2c
    V_16a0# = FX##(V_0e68_pi#) + V_16a0#   '@22b11
L_22b27:
L_22b2c:
    V_16a0# = FX##(V_16a8#) + V_16a0#   '@22b2c
L_22b47:
    IF NOT (L_BP2a! > L_BP26! AND ((L_BP2a! > 0.0 OR L_BP26! > 0.0) AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) <> 1)) THEN GOTO L_22cf3   '@22b47 DS:2d0c
    IF NOT (ABS(RT_SQR##((FX##(L_BP26!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#)) < FX##(V_133e!)) THEN GOTO L_22c3b   '@22bce DS:2d10,2d1c
    V_16a0# = FX##(V_0e68_pi#) / 2.0#   '@22c1d DS:2d1c
    GOTO L_22cd8   '@22c33
L_22c3b:
    V_16a0# = ATN(RT_SIN##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#) / (RT_SQR##((FX##(L_BP26!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_16a8# + V_16b0#)))   '@22c3b DS:2d10,2d1c
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_22cd3   '@22ca2 DS:2d2c
    V_16a0# = FX##(V_0e68_pi#) + V_16a0#   '@22cbd
L_22cd3:
L_22cd8:
    V_16a0# = FX##(V_16b0#) - V_16a0#   '@22cd8
L_22cf3:
    IF NOT (V_16a0# < 0.0#) THEN GOTO L_22d29   '@22cf3 DS:2d2c
    V_16a0# = 2.0# * FX##(V_0e68_pi#) + V_16a0#   '@22d0e DS:2d1c
L_22d29:
L_22d2e:
    IF NOT (2.0# * FX##(V_0e68_pi#) <= FX##(V_16a0#)) THEN GOTO L_22d6c   '@22d2e DS:2d1c
    V_16a0# = V_16a0# - 2.0# * FX##(V_0e68_pi#)   '@22d4e DS:2d1c
L_22d6c:
L_22d71:
    IF NOT (ABS(FX##(V_16a8#) - V_16b0#) < FX##(V_133e!)) THEN GOTO L_22e02   '@22d71
    IF NOT (ABS(FX##(V_1748#) - V_1738# + (FX##(V_1740#) - V_1730#) * V_16a8#) > FX##(V_133e!) AND V_1794! <> V_1798!) THEN GOTO L_22dfd   '@22d94
    V_16a0# = V_16a8#   '@22dec
L_22dfd:
L_22e02:
    GOTO L_23331   '@22e02
    ' ---- F_22e0a @0x22e0a  (022e0a_F_22e0a.lift.txt; evidence_id (assembly): ev_02cee4a8ae6ba71db66e4e556038daddf98968d54bdd6b27955f04a12d8862d0)
L_22e0f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 021e5d_FUN_2000_1e5d
    L_BP0e! = L_BP1e!   '@22e14
    L_BP22! = 0.0   '@22e23 DS:2d0c
L_22e38:
    L_BP12! = FX##(L_BP0e!) + 1.0   '@22e38 DS:2d10
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP12!) THEN GOTO L_22e93   '@22e4c
    L_BP12! = 1.0   '@22e83 DS:2d10
L_22e93:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) > 2) THEN GOTO L_22f8c   '@22e93
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) - 2) * RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP0e!)))) - A_15b0!(RT_CINT%(FX##(L_BP12!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP0e!)))) - A_15de!(RT_CINT%(FX##(L_BP12!)))), (2.0))) / 10.0 + L_BP22!   '@22ec3 DS:2d18,2d34
L_22f8c:
    L_BP16! = L_BP0e!   '@22f8c
    IF NOT (A_163a!(RT_CINT%(FX##(L_BP0e!)), 0) = -100.0) THEN GOTO L_23032   '@22f9b DS:2d14
    L_BP0e! = FX##(L_BP0e!) - 1.0   '@22fce DS:2d38
    IF NOT (L_BP0e! = 0.0) THEN GOTO L_2302a   '@22fe2 DS:2d0c
    L_BP0e! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@22ffc
L_2302a:
    GOTO L_2303f   '@2302a
L_23032:
    GOTO L_23048   '@23032
L_2303f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22e38   '@2303f
L_23048:
    L_BP0e! = L_BP1e!   '@23048
L_2305c:
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@2305c DS:2d10
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP0e!) THEN GOTO L_230b7   '@23070
    L_BP0e! = 1.0   '@230a7 DS:2d10
L_230b7:
    L_BP1a! = L_BP0e!   '@230b7
    IF NOT (A_163a!(RT_CINT%(FX##(L_BP0e!)), 0) = -100.0) THEN GOTO L_2315c   '@230c6 DS:2d14
    L_BP12! = FX##(L_BP0e!) + 1.0   '@230f9 DS:2d10
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP12!) THEN GOTO L_23154   '@2310d
    L_BP12! = 1.0   '@23144 DS:2d10
L_23154:
    GOTO L_23169   '@23154
L_2315c:
    GOTO L_2326a   '@2315c
L_23169:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) > 2) THEN GOTO L_23262   '@23169
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) - 2) * RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP0e!)))) - A_15b0!(RT_CINT%(FX##(L_BP12!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP0e!)))) - A_15de!(RT_CINT%(FX##(L_BP12!)))), (2.0))) / 10.0 + L_BP22!   '@23199 DS:2d18,2d34
L_23262:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2305c   '@23262
L_2326a:
    L_BP22! = L_BP22! / RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP16!)))) - A_15b0!(RT_CINT%(FX##(L_BP1a!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP16!)))) - A_15de!(RT_CINT%(FX##(L_BP1a!)))), (2.0)))   '@2326a DS:2d18
    L_BP22! = INT(FX##(L_BP22!) * 100.0) / 100.0   '@23302 DS:2d3c
    RETURN   '@23322
L_23331:   ' entrada vinda de 021e5d_FUN_2000_1e5d
    ' END SUB   '@23331
END SUB

SUB S_23341   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x23341)
    ' ---- FUN_2000_3341 @0x23341  (023341_FUN_2000_3341.lift.txt; evidence_id (assembly): ev_630d75b2d6e6f4cb3259b83fd55a48479af3caabe4b7848e17f05a4e81adc922)
    V_0f18$ = ""   '@23349 DS:2cf0
    IF NOT (ABS(FX##(V_1678#) - V_1680# + V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_0e68_pi#) - V_1680# + V_1678#) < FX##(V_133e!) OR (ABS(FX##(V_1678#) - V_1680# - V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_1678#) - V_0e68_pi# - V_1680#) < FX##(V_133e!) OR ABS(FX##(V_1678#) - V_1680#) < FX##(V_133e!))))) THEN GOTO L_23467   '@2335b
    V_0ef4# = 10000000000.0#   '@23426 DS:2cf4
    V_0efc# = 10000000000.0#   '@23437 DS:2cf4
    V_0f18$ = "NAO"   '@23448 DS:2d04
    GOTO L_23924   '@2345a
L_23467:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_1678#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_1678#)) THEN GOTO L_23555   '@23467 DS:2d1c,2d24
    V_0ef4# = V_17e0#   '@234b4
    V_0efc# = RT_TAN##(FX##(V_1680#)) * V_0ef4# + (V_17f8# - RT_SIN##(FX##(V_1680#)) / RT_COS##(FX##(V_1680#)) * V_17e8#)   '@234c5
    IF NOT (ABS(RT_SIN##(FX##(V_1680#))) < FX##(V_133e!) / 100.0) THEN GOTO L_23548   '@2350d DS:2d3c
    V_0efc# = V_17f8#   '@23537
L_23548:
    GOTO L_23924   '@23548
L_23555:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_1680#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_1680#)) THEN GOTO L_23643   '@23555 DS:2d1c,2d24
    V_0ef4# = V_17e8#   '@235a2
    V_0efc# = RT_TAN##(FX##(V_1678#)) * V_0ef4# + (V_17f0# - RT_SIN##(FX##(V_1678#)) / RT_COS##(FX##(V_1678#)) * V_17e0#)   '@235b3
    IF NOT (ABS(RT_SIN##(FX##(V_1678#))) < FX##(V_133e!) / 100.0) THEN GOTO L_23636   '@235fb DS:2d3c
    V_0efc# = V_17f0#   '@23625
L_23636:
    GOTO L_23924   '@23636
L_23643:
    IF NOT (V_1678# = V_0e68_pi# OR V_1678# = 0.0#) THEN GOTO L_23725   '@23643 DS:2d2c
    V_0efc# = V_17f0#   '@23681
    V_0ef4# = (V_0efc# - (V_17f8# - RT_SIN##(FX##(V_1680#)) / RT_COS##(FX##(V_1680#)) * V_17e8#)) / RT_TAN##(FX##(V_1680#))   '@23692
    IF NOT (ABS(RT_COS##(FX##(V_1680#))) < FX##(V_133e!) / 100.0) THEN GOTO L_23718   '@236dd DS:2d3c
    V_0ef4# = V_17e8#   '@23707
L_23718:
    GOTO L_23924   '@23718
L_23725:
    IF NOT (V_1680# = V_0e68_pi# OR V_1680# = 0.0#) THEN GOTO L_23807   '@23725 DS:2d2c
    V_0efc# = V_17f8#   '@23763
    V_0ef4# = (V_0efc# - (V_17f0# - RT_SIN##(FX##(V_1678#)) / RT_COS##(FX##(V_1678#)) * V_17e0#)) / RT_TAN##(FX##(V_1678#))   '@23774
    IF NOT (ABS(RT_COS##(FX##(V_1678#))) < FX##(V_133e!) / 100.0) THEN GOTO L_237fa   '@237bf DS:2d3c
    V_0ef4# = V_17e0#   '@237e9
L_237fa:
    GOTO L_23924   '@237fa
L_23807:
    V_0efc# = (RT_TAN##(FX##(V_1680#)) * (V_17f0# - RT_SIN##(FX##(V_1678#)) / RT_COS##(FX##(V_1678#)) * V_17e0#) - RT_TAN##(FX##(V_1678#)) * (V_17f8# - RT_SIN##(FX##(V_1680#)) / RT_COS##(FX##(V_1680#)) * V_17e8#)) / (RT_TAN##(FX##(V_1680#)) - RT_TAN##(FX##(V_1678#)))   '@23807
    V_0ef4# = (V_17f8# - RT_SIN##(FX##(V_1680#)) / RT_COS##(FX##(V_1680#)) * V_17e8# - (V_17f0# - RT_SIN##(FX##(V_1678#)) / RT_COS##(FX##(V_1678#)) * V_17e0#)) / (RT_TAN##(FX##(V_1678#)) - RT_TAN##(FX##(V_1680#)))   '@238a2
L_23924:
    CALL S_2175d   '@23929
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    ' END SUB   '@23933
END SUB

SUB S_23948   ' entrada de SUB/FUNCTION (B$ENRA, locais 2 bytes) (0x23948)
    DIM L_BP0c%
    ' ---- FUN_2000_3948 @0x23948  (023948_FUN_2000_3948.lift.txt; evidence_id (assembly): ev_8d93c905a2d23dac3ca47b902455b5608f0f46f422d306bb8731a1f993ecc9bb)
    V_1778! = FX##(V_16b8!) + 1.0   '@23950 DS:2d10
    V_0f1c$ = "NAO"   '@23966 DS:2d04
L_2397e:
    IF NOT (A_160c!(0, 0) >= V_1778!) THEN GOTO L_23bfa   '@2397f
    IF NOT (A_160c!(RT_CINT%(FX##(V_1778!)), 0) >= 0.0) THEN GOTO L_23a34   '@239a3 DS:2d0c
    V_16d0# = A_160c!(RT_CINT%(FX##(V_1778!)), 0)   '@239d7
    V_16d8# = A_160c!(RT_CINT%(FX##(V_1778!)), 1)   '@23a01
    GOTO L_23abf   '@23a2c
L_23a34:
    V_16d0# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 0)))))   '@23a34
    V_16d8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 0)))))   '@23a77
L_23abf:
    V_16e0# = A_160c!(RT_CINT%(FX##(V_1778!)), 2)   '@23abf
    V_16e8# = A_160c!(RT_CINT%(FX##(V_1778!)), 3)   '@23ae7
    CALL S_2018c   '@23b12
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = V_16f8# AND V_0ef4# = V_16f0#) THEN GOTO L_23b6c   '@23b1c
    V_0f1c$ = "NAO"   '@23b5a DS:2d04
L_23b6c:
    IF NOT (V_0efc# = V_1708# AND V_0ef4# = V_1700#) THEN GOTO L_23bbc   '@23b6c
    V_0f1c$ = ""   '@23baa DS:2cf0
L_23bbc:
    IF NOT (V_0f1c$ = "") THEN GOTO L_23bdb   '@23bbc DS:2cf0
    GOTO L_23bfa   '@23bd3
L_23bdb:
    V_1778! = FX##(V_1778!) + 1.0   '@23bdb DS:2d10
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2397e   '@23bf1
L_23bfa:
    L_BP0c% = (V_16cc! = -1.0)   '@23bfa DS:2d38
    IF NOT ((V_0f1c$ = "" OR L_BP0c%) <> 0) THEN GOTO L_23c40   '@23c23 DS:2cf0
    GOTO L_23e61   '@23c38
L_23c40:
    V_1778! = 1.0   '@23c40 DS:2d10
L_23c56:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1 >= V_1778!) THEN GOTO L_23e5c   '@23c57
    V_16d0# = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@23c8a
    V_16d8# = A_15de!(RT_CINT%(FX##(V_1778!)))   '@23cb1
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_1778!) + 1.0))   '@23cd8 DS:2d10
    V_16e8# = A_15de!(RT_CINT%(FX##(V_1778!) + 1.0))   '@23d04 DS:2d10
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1778!))) = 1) THEN GOTO L_23d6a   '@23d30
    GOTO L_23e38   '@23d62
L_23d6a:
    CALL S_2018c   '@23d6a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = V_16f8# AND V_0ef4# = V_16f0#) THEN GOTO L_23dc4   '@23d74
    V_0f1c$ = "NAO"   '@23db2 DS:2d04
L_23dc4:
    IF NOT (V_0efc# = V_1708# AND V_0ef4# = V_1700#) THEN GOTO L_23e14   '@23dc4
    V_0f1c$ = "NAO"   '@23e02 DS:2d04
L_23e14:
    IF NOT (V_0f1c$ = "") THEN GOTO L_23e33   '@23e14 DS:2cf0
    GOTO L_23e5c   '@23e2b
L_23e33:
L_23e38:
    V_1778! = FX##(V_1778!) + 1.0   '@23e3d DS:2d10
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23c56   '@23e53
L_23e5c:
L_23e61:
    ' END SUB   '@23e61
END SUB

SUB S_30182   ' entrada de SUB/FUNCTION (B$ENRA, locais 252 bytes) (0x30182)
    DIM L_BP0c%
    DIM L_BP0e%
    DIM L_BP2a!
    DIM L_BP36!
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP58!
    DIM L_BP5c$
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP68$
    DIM L_BP6c!
    DIM L_BP70!
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP82%
    DIM L_BP84%
    DIM L_BP88!
    DIM L_BP8c$
    DIM L_BP90$
    DIM L_BP92%
    DIM L_BP96!
    DIM L_BP9a$
    DIM L_BP9e!
    DIM L_BPa2!
    DIM L_BPa6!
    DIM L_BPaa!
    DIM L_BPac%
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb6%
    DIM L_BPba!
    DIM L_BPbe!
    DIM L_BPc2$
    DIM L_BPc6$
    DIM L_BPc8%
    DIM L_BPca%
    DIM L_BPcc%
    DIM L_BPd0!
    DIM L_BPd4!
    DIM L_BPd8!
    DIM L_BPda%
    DIM L_BPde!
    DIM L_BPe2!
    DIM L_BPe4%
    DIM L_BPe6%
    DIM L_BPe8%
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4$
    DIM L_BPf8!
    DIM L_BPfc!
    ' ---- FUN_3000_0182 @0x30182  (030182_FUN_3000_0182.lift.txt; evidence_id (assembly): ev_5e0caef8fa08b23ada7e8c2f763f8256a971227f173a106a496979dad6f5b6e7)
    IF NOT (V_0e3e% = 0 OR V_0e3c% = 0) THEN GOTO L_301cf   '@301a3
    GOTO L_353d8   '@301c7
L_301cf:
L_301d4:   ' entrada vinda de 033d93_F_33d93
    L_BP5c$ = V_0dcc_placa$   '@301d9
    IF NOT (L_BP5c$ = "HER") THEN GOTO L_30280   '@301eb DS:2d40
    RT_SCREEN 3   '@30202
    L_BP4c! = 7.0   '@30218 DS:2d48
    L_BP50! = 7.0   '@30228 DS:2d48
    L_BP54! = 7.0   '@30238 DS:2d48
    L_BP58! = 0.0   '@30248 DS:2d4c
    L_BP44! = 4.5   '@30258 DS:2d50
    L_BP48! = 4.0   '@30268 DS:2d54
    GOTO L_303d7   '@30278
L_30280:
    IF NOT (L_BP5c$ <> "CGA") THEN GOTO L_302a4   '@30280 DS:2d58
    IF NOT (L_BP5c$ = "MCG") THEN GOTO L_3031f   '@30292 DS:2d60
L_302a4:
    RT_SCREEN 2   '@302a4
    L_BP4c! = 15.0   '@302b7 DS:2d68
    L_BP50! = 15.0   '@302c7 DS:2d68
    L_BP54! = 15.0   '@302d7 DS:2d68
    L_BP58! = 0.0   '@302e7 DS:2d4c
    L_BP44! = 4.0   '@302f7 DS:2d54
    L_BP48! = 4.0   '@30307 DS:2d54
    GOTO L_303d7   '@30317
L_3031f:
    IF NOT (L_BP5c$ <> "EGA") THEN GOTO L_30343   '@3031f DS:2d6c
    IF NOT (L_BP5c$ = "VGA") THEN GOTO L_303d7   '@30331 DS:2d74
L_30343:
    RT_SCREEN 9   '@30343
    COLOR , 1   '@30359
    L_BP4c! = 14.0   '@3036f DS:2d7c
    L_BP50! = 13.0   '@3037f DS:2d80
    L_BP54! = 15.0   '@3038f DS:2d68
    L_BP58! = 1.0   '@3039f DS:2d84
    L_BP44! = 4.0   '@303af DS:2d54
    L_BP48! = 4.0   '@303bf DS:2d54
    GOTO L_303d7   '@303cf
L_303d7:
    V_1808! = A_0f8a!(1, 1)   '@303d7
    V_180c! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@303f8
    V_1810! = A_0f8a!(1, 0)   '@30435
    V_1814! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@30458
    V_1818! = 560.0 / (FX##(V_180c!) - V_1808!)   '@30491 DS:2d88
    V_181c! = 145.0 / (FX##(V_1814!) - V_1810!)   '@304af DS:2d8c
    IF NOT (FX##(V_181c!) / V_1818! > 0.41670000553131103515625##) THEN GOTO L_3050b   '@304cd DS:2d90
    V_181c! = V_1818! * 0.41670000553131103515625##   '@304ed DS:2d90
    GOTO L_30526   '@30503
L_3050b:
    V_1818! = V_181c! / 0.41670000553131103515625##   '@3050b DS:2d90
L_30526:
    RT_CLS -1   '@30526
    RT_WINDOW 1, (0), (0), (639), (199)   '@30534 DS:2d4c,2d4e,2d94,2d96,2d98,2d9a (B$WIND decodificado)
    V_1800! = 45.0   '@30562 DS:2d9c
    V_1804! = 10.0   '@30573 DS:2da0
    GOSUB L_33da5   '@30584
    GOSUB L_33f28   '@30591
    L_BP0c% = 1   '@3059e
    L_BP0e% = 0   '@305a8
L_305b8:
    IF NOT (A_10cc!(L_BP0c%, 1) = 2.0) THEN GOTO L_305f5   '@305b8 DS:2da4
    L_BP0e% = L_BP0e% + 1   '@305e5
    GOTO L_30712   '@305ed
L_305f5:
    V_0ef4# = A_10cc!(L_BP0c%, 6)   '@305f5
    V_0efc# = A_10cc!(L_BP0c%, 7)   '@30618
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0c% - L_BP0e% + FX##(V_0e54_nivellaje!))))   '@3063b
    L_BP60! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP44! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@30679
    L_BP64! = FX##(L_BP48!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@306b7 DS:2da8
    L_BP68$ = "CGA"   '@306e2 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BP60!, L_BP64!, V_0f1c$, L_BP68$)   '@306ef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @30704 libera strings locais (L_BP68)
L_30712:
    L_BP0c% = L_BP0c% + 1   '@30712
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0c%) THEN GOTO L_305b8   '@3071a
    LOCATE 22, 1   '@3073a
    PRINT RT_STRINGC$((26), (95)); "  C O N T I N U I D A D E  "; RT_STRINGC$((27), (95));   '@30755 DS:2db0
    IF NOT (V_120e% = 0) THEN GOTO L_30f34   '@30789
    LOCATE 24, 1   '@30798
    PRINT " Aguarde ..";   '@307b3 DS:2dd0
    REDIM A_11e0%(-32768 TO -32768, -32768 TO -32768)   '@307c1
    L_BP6c! = 50.0   '@307cf DS:2de0
    L_BP70! = A_109e%(0, 0) * 5   '@307df
    CALL MIXT_082a_Maior(L_BP6c!, L_BP70!, L_BP74!)   '@30802
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP0c% = RT_CINT%(FX##(L_BP74!))   '@30814
    REDIM A_11e0%(0 TO L_BP0c%, 0 TO 4)   '@3081f
    L_BP0c% = 1   '@30840
L_30850:
    IF NOT (A_109e%(0, 0) >= L_BP0c%) THEN GOTO L_3098e   '@30850
    IF NOT (A_10cc!(L_BP0c%, 1) = 0.0) THEN GOTO L_3097e   '@3086b DS:2d4c
    V_177c! = A_10cc!(L_BP0c%, 0)   '@30898
    L_BP78! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@308ba
    FOR V_0f04! = 1.0 TO L_BP78!   '@308e9 DS:2d84
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) <> 1) THEN GOTO L_3094e   '@308f0
    A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = 0   '@30922
L_3094e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@3094e DS:2d84
L_3097e:
    L_BP0c% = L_BP0c% + 1   '@3097e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30850   '@30986
L_3098e:
    L_BP0c% = 1   '@3098e
L_3099e:
    IF NOT (A_109e%(0, 0) >= L_BP0c%) THEN GOTO L_30f0e   '@3099e
    IF NOT (A_10cc!(L_BP0c%, 1) = 0.0) THEN GOTO L_30efd   '@309b9 DS:2d4c
    V_177c! = A_10cc!(L_BP0c%, 0)   '@309e6
    L_BP0e% = L_BP0c% + 1   '@30a08
L_30a1a:
    IF NOT (A_109e%(0, 0) >= L_BP0e%) THEN GOTO L_30ef8   '@30a1a
    L_BP2a! = A_10cc!(L_BP0e%, 0)   '@30a35
    IF NOT (A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_30ee8   '@30a56 DS:2d4c
    IF NOT (A_10cc!(L_BP0c%, 3) = A_10cc!(L_BP0e%, 3)) THEN GOTO L_30ee3   '@30a83
    L_BP7c! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@30ac2
    FOR V_0f04! = 1.0 TO L_BP7c!   '@30af1 DS:2d84
    L_BP80! = A_109e%(RT_CINT%(FX##(L_BP2a!)), 0) - 1   '@30af8
    FOR V_1778! = 1.0 TO L_BP80!   '@30b26 DS:2d84
    L_BP82% = (A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!))))   '@30b2e DS:2d84
    L_BP84% = A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!) + 1.0)) AND L_BP82%   '@30c0e DS:2d84
    IF NOT (((A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!) + 1.0)) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!))) AND A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!) + 1.0)) OR L_BP84%) AND (A_10fa%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!))) <> 1 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) <> 1)) <> 0) THEN GOTO L_30e88   '@30c6e DS:2d84
    A_11e0%(0, 0) = A_11e0%(0, 0) + 1   '@30d0d
    A_11e0%(A_11e0%(0, 0), 0) = L_BP0c%   '@30d39
    A_11e0%(A_11e0%(0, 0), 1) = RT_CINT%(FX##(V_0f04!))   '@30d66
    A_11e0%(A_11e0%(0, 0), 2) = L_BP0e%   '@30d9f
    A_11e0%(A_11e0%(0, 0), 3) = RT_CINT%(FX##(V_1778!))   '@30dc7
    A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_0f7e!) * 10.0 + 2.0)   '@30e00 DS:2da0,2da4
    A_10fa%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!))) = RT_CINT%(FX##(V_0f7e!) * 10.0 + 2.0)   '@30e42 DS:2da0,2da4
L_30e88:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@30e88 DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@30eb3 DS:2d84
L_30ee3:
L_30ee8:
    L_BP0e% = L_BP0e% + 1   '@30ee8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a1a   '@30ef0
L_30ef8:
L_30efd:
    L_BP0c% = L_BP0c% + 1   '@30efd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3099e   '@30f05
L_30f0e:
    V_120e% = 1   '@30f0e
    V_126c% = 0   '@30f19
    V_12f8% = 0   '@30f24
L_30f34:
    IF NOT (A_11e0%(0, 0) > 0) THEN GOTO L_30fcb   '@30f34
    L_BP88! = A_11e0%(0, 0)   '@30f54
    FOR V_0f10! = 1.0 TO L_BP88!   '@30f79 DS:2d84
    V_0ee8! = L_BP50!   '@30f80
    GOSUB L_340ac   '@30f90
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@30f9d DS:2d84
L_30fcb:
    RT_VIEWPRINT 23, 25   '@30fcb
    RT_CLS 2   '@30fdd
L_30ff0:
    RT_VIEWPRINT 1, 25   '@30ff5
    LOCATE 24, 1   '@31007
    PRINT "  <E>limina Continuidade   <I>mpoe Engastamento   <A>tribui Armadura   <F>im"; RT_TAB$(79); ""; " "   '@31022 DS:2de4,2e34,2e38
    PRINT " "; RT_TAB$(79); ""; " ";   '@3104b DS:2e34,2e38
    CALL MIXT_07f1_LimpaTeclado   '@31074
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_31083:
    V_0f18$ = ""   '@31088 DS:2e34
L_310a0:
    V_0f18$ = RT_INKEY$   '@310a0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_310a0   '@310b4 DS:2e34
    L_BP8c$ = V_0f18$   '@310c8
    IF NOT (L_BP8c$ <> "E") THEN GOTO L_31106   '@310db DS:2e3e
    IF NOT (L_BP8c$ = "e") THEN GOTO L_31a97   '@310f3 DS:2e44
L_31106:
    RT_VIEWPRINT 1, 25   '@31106
    LOCATE 24, 1   '@31118
    PRINT "          <T>oda continuidade   <E>scolher o trecho   <*R*>etorno"; RT_TAB$(79); ""; ""   '@31133 DS:2e34,2e4a
    PRINT " "; RT_TAB$(79); ""; "";   '@3115c DS:2e34,2e38
    CALL MIXT_07f1_LimpaTeclado   '@3118f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@31199
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP90$ = V_0f18$   '@311b5
    IF NOT (L_BP90$ <> "T") THEN GOTO L_311f3   '@311c8 DS:2e90
    IF NOT (L_BP90$ = "t") THEN GOTO L_313a9   '@311e0 DS:2e96
L_311f3:
    REDIM A_11e0%(-32768 TO -32768, -32768 TO -32768)   '@311f3
    REDIM A_11e0%(0 TO A_109e%(0, 0) * 5, 0 TO 4)   '@31201
    L_BP92% = A_109e%(0, 0)   '@31238
    FOR L_BP0c% = 1 TO L_BP92%   '@31254
    IF NOT (A_10cc!(L_BP0c%, 1) = 0.0) THEN GOTO L_3136e   '@3125a DS:2d4c
    V_177c! = A_10cc!(L_BP0c%, 0)   '@31287
    L_BP96! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@312a9
    FOR V_0f04! = 1.0 TO L_BP96!   '@312d9 DS:2d84
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) >= 2) THEN GOTO L_3133d   '@312e0
    A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f04!))) = 0   '@31311
L_3133d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@3133d DS:2d84
L_3136e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0c%   '@3136e
    V_120e% = 1   '@31383
    V_12f8% = 0   '@3138e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_301d4   '@31399
L_313a9:
    IF NOT (L_BP90$ <> "E") THEN GOTO L_313cf   '@313a9 DS:2e3e
    IF NOT (L_BP90$ = "e") THEN GOTO L_31a82   '@313bc DS:2e44
L_313cf:
    LOCATE 24, 1   '@313cf
    PRINT " Escolha o trecho a Eliminar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@313ea DS:2e34,2e9c
L_31418:
    V_0f18$ = "NENHUM"   '@3141d DS:2eea
    FOR V_0f10! = A_11e0%(0, 0) TO 1.0 STEP -1.0   '@3142f DS:2d84,2f04
    V_0f18$ = ""   '@31450 DS:2e34
L_31468:
    V_0ee8! = L_BP58!   '@31468
    GOSUB L_340ac   '@31478
    V_0ee8! = RT_TIMER   '@31485
L_314a0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_314a0   '@314a0 DS:2ef4
    V_0ee8! = L_BP50!   '@314c2
    GOSUB L_340ac   '@314d2
    V_0ee8! = RT_TIMER   '@314df
L_314fa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_314fa   '@314fa DS:2ef4
    V_0f18$ = RT_INKEY$   '@3151c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_31468   '@31530 DS:2e34
    L_BP9a$ = V_0f18$   '@31547
    IF NOT (L_BP9a$ <> "S") THEN GOTO L_31585   '@3155a DS:2ef8
    IF NOT (L_BP9a$ = "s") THEN GOTO L_3193f   '@31572 DS:2efe
L_31585:
    V_0ee8! = L_BP58!   '@31585
    GOSUB L_340ac   '@31595
    A_10fa%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 1)) = 0   '@315a2
    IF NOT (V_12fa% = 1) THEN GOTO L_316d1   '@31609
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 1), 1) = 0.0   '@31618 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 1), 2) = 0.0   '@31656 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 1), 3) = 0.0   '@3168e DS:2d4c
L_316d1:
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) <> -1) THEN GOTO L_31822   '@316d1
    A_10fa%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 3)) = 0   '@316f9
    IF NOT (V_12fa% = 1) THEN GOTO L_3181d   '@3175e
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 1) = 0.0   '@3176d DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 2) = 0.0   '@317a8 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 3) = 0.0   '@317dd DS:2d4c
L_3181d:
L_31822:
    L_BP9e! = A_11e0%(0, 0)   '@31822
    FOR V_0f14! = FX##(V_0f10!) + 1.0 TO L_BP9e!   '@31847 DS:2d84
    FOR V_0f04! = 0.0 TO 4.0   '@31854 DS:2d4c,2d54,2d84
    A_11e0%(RT_CINT%(FX##(V_0f14!) - 1.0), RT_CINT%(FX##(V_0f04!))) = A_11e0%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!)))   '@31862 DS:2f04
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@318b6 DS:2d54,2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@318df DS:2d84
    A_11e0%(0, 0) = A_11e0%(0, 0) - 1   '@3190b
    GOTO L_319fe   '@31937
L_3193f:
    IF NOT (L_BP9a$ <> "F") THEN GOTO L_31965   '@3193f DS:2f08
    IF NOT (L_BP9a$ = "f") THEN GOTO L_31975   '@31952 DS:2f0e
L_31965:
    GOTO L_31a2a   '@31965
L_31975:
    IF NOT (L_BP9a$ <> "R") THEN GOTO L_3199b   '@31975 DS:2f14
    IF NOT (L_BP9a$ = "r") THEN GOTO L_319f9   '@31988 DS:2f1a
L_3199b:
    L_BPa2! = FX##(V_0f10!) + 2.0   '@3199b DS:2da4
    L_BPa6! = A_11e0%(0, 0) + 1   '@319b1
    CALL MIXT_0877_Menor(L_BPa2!, L_BPa6!, L_BPaa!)   '@319d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BPaa!   '@319e6
    GOTO L_319fe   '@319f1
L_319f9:
L_319fe:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@319fe DS:2d84,2f04
L_31a2a:
    L_BPac% = (V_0f10! = 0.0)   '@31a2a DS:2d4c
    IF NOT ((V_0f18$ <> "NENHUM" AND L_BPac%) <> 0) THEN GOTO L_31a72   '@31a54 DS:2eea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31418   '@31a6a
L_31a72:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30ff0   '@31a72
L_31a82:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30ff0   '@31a82
L_31a97:
    IF NOT (L_BP8c$ <> "I") THEN GOTO L_31abd   '@31a97 DS:2f20
    IF NOT (L_BP8c$ = "i") THEN GOTO L_32abd   '@31aaa DS:2f26
L_31abd:
L_31ac2:
    RT_VIEWPRINT 23, 25   '@31ac7
    RT_CLS 2   '@31ad9
    RT_VIEWPRINT 1, 25   '@31ae7
    LOCATE 24, 1   '@31af9
    PRINT " Numero da Laje para Imposicao de Engastamento *FIM* ";   '@31b14 DS:2f2c
    CALL MIXT_07f1_LimpaTeclado   '@31b22
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@31b2c DS:2e34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_31b63   '@31b46
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30ff0   '@31b5b
L_31b63:
    V_0f0c! = VAL(V_0f18$)   '@31b63
    IF NOT (FX##(V_0e52%) + V_0e54_nivellaje! < FX##(V_0f0c!) OR 1.0 + FX##(V_0e54_nivellaje!) > FX##(V_0f0c!)) THEN GOTO L_31bda   '@31b7d DS:2d84
    BEEP   '@31bc8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31ac2   '@31bd2
L_31bda:
    V_0f0c! = FX##(V_0f0c!) - V_0e54_nivellaje!   '@31bda
    L_BP0c% = 0   '@31bf0
    V_0ef0! = 0.0   '@31bfa DS:2d4c
L_31c10:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@31c10 DS:2d84
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_31c63   '@31c26 DS:2da4
    L_BP0c% = L_BP0c% + 1   '@31c5b
L_31c63:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF L_BP0c% < V_0f0c! THEN GOTO L_31c10   '@31c63
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 0.0) THEN GOTO L_31cc5   '@31c7e DS:2d4c
    BEEP   '@31cb3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31ac2   '@31cbd
L_31cc5:
    V_177c! = A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0)   '@31cc5
    L_BPb0! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@31cef
    FOR V_0f08! = 1.0 TO L_BPb0!   '@31d1f DS:2d84
    V_0f04! = 0.0   '@31d26 DS:2d4c
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!))) = 0) THEN GOTO L_31ec7   '@31d37
    L_BPb4! = A_11e0%(0, 0)   '@31d69
    FOR V_0f04! = 1.0 TO L_BPb4!   '@31d8e DS:2d84
    L_BPb6% = (A_11e0%(RT_CINT%(FX##(V_0f04!)), 2) = V_0ef0!)   '@31d96
    IF NOT ((A_11e0%(RT_CINT%(FX##(V_0f04!)), 3) = V_0f08! AND L_BPb6% OR A_11e0%(RT_CINT%(FX##(V_0f04!)), 1) = V_0f08! AND A_11e0%(RT_CINT%(FX##(V_0f04!)), 0) = V_0ef0!) <> 0) THEN GOTO L_31e96   '@31e6f
    GOTO L_31ec2   '@31e8e
L_31e96:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@31e96 DS:2d84
L_31ec2:
L_31ec7:
    IF NOT (A_11e0%(0, 0) < V_0f04!) THEN GOTO L_32a81   '@31ec7
    V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!))), 0)   '@31ef5
    V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!))), 1)   '@31f39
    V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!) + 1.0)), 0)   '@31f7e DS:2d84
    V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!) + 1.0)), 1)   '@31fc7 DS:2d84
    LOCATE 24, 1   '@32011
    PRINT " Considero este trecho Engastado  S/*PROXIMO* "; RT_TAB$(79); ""; "";   '@3202c DS:2e34,2f66
    LOCATE 24, 45   '@32055
    CALL MIXT_07f1_LimpaTeclado   '@32073
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = ""   '@3207d DS:2e34
L_32094:
    RT_PSET RT_SNG!(V_1800! + (FX##(V_17e0#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_1810!) * V_181c!), 0, 0   '@32094 DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_17e8#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(L_BP58!)), 0   '@320f6 DS:2f98
    V_0ee8! = RT_TIMER   '@32169
L_32184:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_32184   '@32184 DS:2ef4
    RT_PSET RT_SNG!(V_1800! + (FX##(V_17e0#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_1810!) * V_181c!), 0, 0   '@321a6 DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_17e8#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(L_BP54!)), 0   '@32208 DS:2f98
    V_0ee8! = RT_TIMER   '@3227b
L_32296:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_32296   '@32296 DS:2ef4
    V_0f18$ = RT_INKEY$   '@322b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_32094   '@322cc DS:2e34
    IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_32a7c   '@322e3 DS:2ef8
    A_11e0%(0, 0) = A_11e0%(0, 0) + 1   '@32300
    A_11e0%(A_11e0%(0, 0), 0) = RT_CINT%(FX##(V_0ef0!))   '@3232c
    A_11e0%(A_11e0%(0, 0), 1) = RT_CINT%(FX##(V_0f08!))   '@32364
    A_11e0%(A_11e0%(0, 0), 2) = -1   '@3239d
    A_11e0%(A_11e0%(0, 0), 3) = 0   '@323c4
    A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0))), RT_CINT%(FX##(V_0f08!))) = RT_CINT%(FX##(V_0f7e!) * 10.0 + 2.0)   '@323f1 DS:2da0,2da4
    IF NOT (V_12fa% = 1) THEN GOTO L_324de   '@3244c
    A_12fc!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@3245b DS:2d4c
    A_12fc!(RT_CINT%(FX##(V_0ef0!)), 2) = 0.0   '@32486 DS:2d4c
    A_12fc!(RT_CINT%(FX##(V_0ef0!)), 3) = 0.0   '@324ae DS:2d4c
L_324de:
    LOCATE 25, 1   '@324de
    PRINT " Aguarde ..";   '@324f9 DS:2dd0
    L_BP0e% = 1   '@32507
    L_BP36! = 0.0   '@32511 DS:2d4c
L_32526:
    IF NOT (A_109e%(0, 0) >= L_BP0e%) THEN GOTO L_329f2   '@32526
    L_BP2a! = A_10cc!(L_BP0e%, 0)   '@32541
    IF NOT (A_10cc!(L_BP0e%, 1) <> 2.0) THEN GOTO L_325a3   '@32562 DS:2da4
    L_BP36! = FX##(L_BP36!) + 1.0   '@3258f DS:2d84
L_325a3:
    IF NOT (L_BP0e% <> V_0ef0! AND A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_329e2   '@325a3 DS:2d4c
    L_BPba! = A_109e%(RT_CINT%(FX##(L_BP2a!)), 0) - 1   '@325f6
    FOR V_1778! = 1.0 TO L_BPba!   '@32625 DS:2d84
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!) + 1.0)) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!))) AND A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!))) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!) + 1.0)) OR A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!) + 1.0)) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!) + 1.0)) AND A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f08!))) = A_109e%(RT_CINT%(FX##(L_BP2a!)), RT_CINT%(FX##(V_1778!)))) THEN GOTO L_329b1   '@3262c DS:2d84
    LOCATE 25, 1   '@3279e
    PRINT " Considero a Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_0f0c!)));   '@327b9 DS:2f9c
    PRINT " continua com a Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(L_BP36!) + V_0e54_nivellaje!)));   '@327f5 DS:2fb2
    CALL MIXT_07f1_LimpaTeclado   '@32830
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " S/*N* ", V_0f18$   '@3283a DS:2fcc (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_329a4   '@32854 DS:2ef8
    A_11e0%(A_11e0%(0, 0), 2) = L_BP0e%   '@32871
    A_11e0%(A_11e0%(0, 0), 3) = RT_CINT%(FX##(V_1778!))   '@32899
    A_10fa%(RT_CINT%(FX##(A_10cc!(L_BP0e%, 0))), RT_CINT%(FX##(V_1778!))) = RT_CINT%(FX##(V_0f7e!) * 10.0 + 2.0)   '@328d2 DS:2da0,2da4
    IF NOT (V_12fa% = 1) THEN GOTO L_3299f   '@32925
    A_12fc!(L_BP0e%, 1) = 0.0   '@32934 DS:2d4c
    A_12fc!(L_BP0e%, 2) = 0.0   '@32957 DS:2d4c
    A_12fc!(L_BP0e%, 3) = 0.0   '@32977 DS:2d4c
L_3299f:
L_329a4:
    GOTO L_329dd   '@329a4
L_329b1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@329b1 DS:2d84
L_329dd:
L_329e2:
    L_BP0e% = L_BP0e% + 1   '@329e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32526   '@329ea
L_329f2:
    LOCATE 25, 1   '@329f2
    PRINT " "; RT_TAB$(79); ""; "";   '@32a0d DS:2e34,2e38
    V_0f10! = A_11e0%(0, 0)   '@32a36
    V_0ee8! = L_BP50!   '@32a5a
    GOSUB L_340ac   '@32a6a
L_32a7c:
L_32a81:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f08!   '@32a81 DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31ac2   '@32aad
L_32abd:
    IF NOT (L_BP8c$ <> "A") THEN GOTO L_32ae3   '@32abd DS:2fd8
    IF NOT (L_BP8c$ = "a") THEN GOTO L_33d40   '@32ad0 DS:2fde
L_32ae3:
    RT_VIEWPRINT 1, 25   '@32ae3
    L_BPbe! = A_11e0%(0, 0)   '@32af5
    FOR V_0f10! = 1.0 TO L_BPbe!   '@32b1a DS:2d84
    V_1778! = 0.0   '@32b22 DS:2d4c
    V_0ee8! = 1.0   '@32b33 DS:2d84
L_32b49:
    GOSUB L_34b8d   '@32b4e
    IF NOT (V_1778! = 0.0) THEN GOTO L_32bf2   '@32b5b DS:2d4c
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) <= 0 AND A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) <> -1) THEN GOTO L_32bed   '@32b76
    V_1778! = 2.0   '@32bcf DS:2da4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32b49   '@32be0
L_32bed:
L_32bf2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@32bf2 DS:2d84
    LOCATE 24, 1   '@32c1e
    PRINT " Escolha o trecho a Alterar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@32c39 DS:2e34,2fe4
L_32c67:
    V_0f18$ = "NENHUM"   '@32c6c DS:2eea
    FOR V_0f10! = A_11e0%(0, 0) TO 1.0 STEP -1.0   '@32c7e DS:2d84,2f04
    V_0f18$ = ""   '@32c9e DS:2e34
L_32cb6:
    V_0ee8! = L_BP58!   '@32cb6
    GOSUB L_340ac   '@32cc6
    V_0ee8! = RT_TIMER   '@32cd3
L_32cee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_32cee   '@32cee DS:2ef4
    V_0ee8! = L_BP50!   '@32d10
    GOSUB L_340ac   '@32d20
    V_0ee8! = RT_TIMER   '@32d2d
L_32d48:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - V_0ee8! < 0.100000001490116119384765625## THEN GOTO L_32d48   '@32d48 DS:2ef4
    V_0f18$ = RT_INKEY$   '@32d6a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_32cb6   '@32d7e DS:2e34
    L_BPc2$ = V_0f18$   '@32d95
    IF NOT (L_BPc2$ <> "S") THEN GOTO L_32dd3   '@32da8 DS:2ef8
    IF NOT (L_BPc2$ = "s") THEN GOTO L_33bb2   '@32dc0 DS:2efe
L_32dd3:
    LOCATE 24, 1   '@32dd3
    PRINT " Altere o Coeficiente de Engastamento (M-/M+) ";   '@32dee DS:3030
    PRINT V_0f7a!; "=< Coef <="; V_0f7e!; " ou"; RT_TAB$(79); ""; ""   '@32dfc DS:2e34,3062,3070
    PRINT " Escolha armadura na forma  #bit/esp  com bit=Bitola(mm) e esp=Espacamento(cm)";   '@32e48 DS:3078
    V_1778! = 0.0   '@32e56 DS:2d4c
    V_0f20$ = ""   '@32e67 DS:2e34
L_32e7e:
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) > 0) THEN GOTO L_32fa3   '@32e83
    L_BPc6$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(FX##(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4)) / 1000.0))))) + "/" + LTRIM$(STR$(RT_SNG!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) - INT(FX##(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4)) / 1000.0) * 1000.0)))   '@32eae DS:30ca,30d0,30d4
    GOTO L_3313f   '@32f9b
L_32fa3:
    L_BP0c% = 0   '@32fa3
    V_0ef0! = 0.0   '@32fad DS:2d4c
L_32fc4:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@32fc4 DS:2d84
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_33017   '@32fda DS:2da4
    L_BP0c% = L_BP0c% + 1   '@3300f
L_33017:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))) <= V_0ef0!) THEN GOTO L_32fc4   '@33017
    L_BPc6$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(L_BP0c%) + V_0e54_nivellaje!))) + " " + LTRIM$(STR$(RT_SNG!(FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0))) - 2) / 10.0)))   '@33057 DS:2d84,2da0,2e38
L_3313f:
L_33144:
    LOCATE 23, 1   '@33149
    PRINT " "; RT_TAB$(79); ""; " ";   '@33164 DS:2e34,2e38
    LOCATE 23, 1   '@3318d
    PRINT " Novo  Coeficiente/Armadura *"; L_BPc6$; "* ";   '@331a8 DS:30da,30fc
    CALL MIXT_07f1_LimpaTeclado   '@331c9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@331d3 DS:2e34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_3329c   '@331ed
    IF NOT (V_1778! = 2.0 OR (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) = -1 OR A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) > 0)) THEN GOTO L_3327e   '@33202 DS:2da4
    GOTO L_33b2f   '@33276
L_3327e:
    V_1778! = 2.0   '@3327e DS:2da4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32e7e   '@3328f
L_3329c:
    IF NOT (VAL(V_0f18$) > 0.0#) THEN GOTO L_335c0   '@3329c DS:3102
    V_0ef0! = VAL(V_0f18$)   '@332c0
    IF NOT (V_0ef0! > V_0f7e! OR V_0ef0! < V_0f7a!) THEN GOTO L_3332a   '@332da
    BEEP   '@33318
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33144   '@33322
L_3332a:
    V_0ee8! = 0.0   '@3332a DS:2d4c
    IF NOT (V_0f20$ = "") THEN GOTO L_3335f   '@3333b DS:2e34
    GOSUB L_34b8d   '@33352
L_3335f:
    A_10fa%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0))) = RT_CINT%(10.0 * FX##(V_0ef0!) + 2.0)   '@3335f DS:2d84,2da0,2da4
    IF NOT (V_12fa% = 1) THEN GOTO L_334cd   '@333f0
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 1) = 0.0   '@333ff DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 2) = 0.0   '@33444 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 3) = 0.0   '@33483 DS:2d4c
L_334cd:
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) > 0) THEN GOTO L_3350a   '@334cd
    V_0f20$ = "*"   '@334f8 DS:310a
L_3350a:
    A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) = 0   '@3350a
    V_0ee8! = 1.0   '@3352f DS:2d84
    GOSUB L_34b8d   '@33540
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) = -1 OR V_1778! = 2.0) THEN GOTO L_335a2   '@3354d DS:2da4
    GOTO L_33b2f   '@3359a
L_335a2:
    V_1778! = 2.0   '@335a2 DS:2da4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32e7e   '@335b3
L_335c0:
    L_BPc8% = (V_1778! = 2.0)   '@335c0 DS:2da4,3102
    L_BPca% = VAL(V_0f18$) < 0.0# OR L_BPc8%   '@335eb
    L_BPcc% = INSTR(V_0f18$, "#") <> 1 OR L_BPca%   '@33614 DS:30ca
    IF NOT ((INSTR(V_0f18$, "/") < 3 OR L_BPcc%) <> 0) THEN GOTO L_3365d   '@33632 DS:30d4
    BEEP   '@3364b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33144   '@33655
L_3365d:
    V_0ef0! = VAL(RT_MID2$((V_0f18$), (2)))   '@3365d
    L_BP36! = 0.0   '@33685 DS:2d4c
L_3369a:
    IF NOT (A_0e8c_bitola!(RT_CINT%(FX##(L_BP36!))) = V_0ef0!) THEN GOTO L_336d2   '@3369a
    GOTO L_336fe   '@336ca
L_336d2:
    L_BP36! = FX##(L_BP36!) + 1.0   '@336d2 DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF L_BP36! <= 9.0 THEN GOTO L_3369a   '@336e6 DS:3110
L_336fe:
    IF NOT (L_BP36! > 9.0) THEN GOTO L_3372a   '@336fe DS:3110
    BEEP   '@33718
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33144   '@33722
L_3372a:
    IF NOT (A_0eba_areabarra!(RT_CINT%(FX##(L_BP36!))) = 0.0) THEN GOTO L_3376c   '@3372a DS:2d4c
    BEEP   '@3375a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33144   '@33764
L_3376c:
    V_0f04! = VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "/") + 1)))   '@3376c DS:30d4
    V_0f08! = 1.0   '@3379c DS:2d84
L_337b2:
    IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0f08!))) = V_0f04!) THEN GOTO L_337eb   '@337b2
    GOTO L_33828   '@337e3
L_337eb:
    V_0f08! = FX##(V_0f08!) + 1.0   '@337eb DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF A_129c_espacamento!(0) >= V_0f08! THEN GOTO L_337b2   '@33801
L_33828:
    IF NOT (A_129c_espacamento!(0) < V_0f08!) THEN GOTO L_33863   '@33828
    BEEP   '@33851
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33144   '@3385b
L_33863:
    V_0ee8! = 0.0   '@33863 DS:2d4c
    V_1778! = 0.0   '@33874 DS:2d4c
    GOSUB L_34b8d   '@33885
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) <> -1 AND A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) <= 0) THEN GOTO L_3390e   '@33892
    V_1778! = 2.0   '@338eb DS:2da4
    GOSUB L_34b8d   '@338fc
L_3390e:
    A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) = RT_CINT%(FX##(L_BP36!) * 1000.0 + A_129c_espacamento!(RT_CINT%(FX##(V_0f08!))))   '@3390e DS:30d0
    V_1778! = 0.0   '@3395e DS:2d4c
    V_0ee8! = 1.0   '@3396f DS:2d84
    GOSUB L_34b8d   '@33980
    IF NOT (V_12fa% = 1) THEN GOTO L_33b2a   '@3398d
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 1) = 0.0   '@3399c DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 2) = 0.0   '@339d9 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 3) = 0.0   '@33a10 DS:2d4c
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) <> -1) THEN GOTO L_33b25   '@33a4d
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 1) = 0.0   '@33a75 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 2) = 0.0   '@33ab0 DS:2d4c
    A_12fc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 3) = 0.0   '@33ae5 DS:2d4c
L_33b25:
L_33b2a:
L_33b2f:
    RT_VIEWPRINT 23, 25   '@33b34
    RT_CLS 2   '@33b46
    RT_VIEWPRINT 1, 25   '@33b54
    LOCATE 24, 1   '@33b66
    PRINT " Escolha o trecho a Alterar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@33b81 DS:2e34,2fe4
    GOTO L_33c83   '@33baa
L_33bb2:
    IF NOT (L_BPc2$ <> "F") THEN GOTO L_33bd8   '@33bb2 DS:2f08
    IF NOT (L_BPc2$ = "f") THEN GOTO L_33bfa   '@33bc5 DS:2f0e
L_33bd8:
    V_0f18$ = "FIM"   '@33bd8 DS:3114
    GOTO L_33caf   '@33bea
L_33bfa:
    IF NOT (L_BPc2$ <> "R") THEN GOTO L_33c20   '@33bfa DS:2f14
    IF NOT (L_BPc2$ = "r") THEN GOTO L_33c7e   '@33c0d DS:2f1a
L_33c20:
    L_BPd0! = FX##(V_0f10!) + 2.0   '@33c20 DS:2da4
    L_BPd4! = A_11e0%(0, 0) + 1   '@33c36
    CALL MIXT_0877_Menor(L_BPd0!, L_BPd4!, L_BPd8!)   '@33c56
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BPd8!   '@33c6b
    GOTO L_33c83   '@33c76
L_33c7e:
L_33c83:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@33c83 DS:2d84,2f04
L_33caf:
    IF NOT (V_0f18$ = "FIM") THEN GOTO L_33ce8   '@33caf DS:3114
    RT_SCREEN 0   '@33cc6
    GOTO L_353d8   '@33cdb
L_33ce8:
    L_BPda% = (V_0f10! = 0.0)   '@33ce8 DS:2d4c
    IF NOT ((V_0f18$ <> "NENHUM" AND L_BPda%) <> 0) THEN GOTO L_33d30   '@33d12 DS:2eea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32c67   '@33d28
L_33d30:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30ff0   '@33d30
L_33d40:
    IF NOT (L_BP8c$ <> "F") THEN GOTO L_33d66   '@33d40 DS:2f08
    IF NOT (L_BP8c$ = "f") THEN GOTO L_33d8b   '@33d53 DS:2f0e
L_33d66:
    RT_SCREEN 0   '@33d66
    GOTO L_353d8   '@33d7b
L_33d8b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_31083   '@33d8b
    ' ---- F_33d93 @0x33d93  (033d93_F_33d93.lift.txt; evidence_id (assembly): ev_8a93848931eb68cc3d17dc4b3e36ab0597b599ffc98604c89ceb65186feb441b)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_301d4   '@33d98
    ' ---- F_33da0 @0x33da0  (033da0_F_33da0.lift.txt; evidence_id (assembly): ev_57e1ff4d4c30c1c2bf4a31755b79fb071154011b036071507798381e4e461048)
L_33da5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    L_BPde! = A_0fb8!(0, 0)   '@33daa
    FOR V_0f10! = 1.0 TO L_BPde!   '@33dcb DS:2d84
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@33dd2 DS:2f98
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 72, RT_CINT%(FX##(L_BP4c!)), 17476   '@33e58 DS:2f98
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@33eed DS:2d84
    RETURN   '@33f19
L_33f28:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    L_BPe2! = A_1042!(0, 0)   '@33f2d
    FOR V_0f10! = 1.0 TO L_BPe2!   '@33f4e DS:2d84
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@33f56 DS:2f98
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(L_BP54!)), 0   '@33fdc DS:2f98
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@34071 DS:2d84
    RETURN   '@3409d
L_340ac:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 1)), 0)   '@340b1
    V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 1)), 1)   '@34130
    V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 1) + 1), 0)   '@341b0
    V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 0), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 1) + 1), 1)   '@34231
    IF NOT (V_17e0# = V_17e8#) THEN GOTO L_34322   '@342b3
    V_0f14! = FX##(V_0e68_pi#) / 2.0#   '@342ce DS:311c
    IF NOT (V_17f0# > V_17f8#) THEN GOTO L_3431a   '@342e4
    V_0f14! = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@342ff DS:311c,3124
L_3431a:
    GOTO L_344e1   '@3431a
L_34322:
    IF NOT (V_17f0# <= V_17f8# AND V_17e0# < V_17e8#) THEN GOTO L_3438a   '@34322
    V_0f14! = ATN((FX##(V_17f8#) - V_17f0#) / (FX##(V_17e8#) - V_17e0#))   '@34360
L_3438a:
    IF NOT (V_17f0# <= V_17f8# AND V_17e0# > V_17e8#) THEN GOTO L_343fa   '@3438a
    V_0f14! = V_0e68_pi# - ATN((FX##(V_17f8#) - V_17f0#) / (FX##(V_17e0#) - V_17e8#))   '@343c8
L_343fa:
    IF NOT (V_17f0# > V_17f8# AND V_17e0# > V_17e8#) THEN GOTO L_34467   '@343fa
    V_0f14! = ATN((FX##(V_17f0#) - V_17f8#) / (FX##(V_17e0#) - V_17e8#)) + V_0e68_pi#   '@34438
L_34467:
    IF NOT (V_17f0# > V_17f8# AND V_17e0# < V_17e8#) THEN GOTO L_344dc   '@34467
    V_0f14! = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_17f0#) - V_17f8#) / (FX##(V_17e8#) - V_17e0#))   '@344a5 DS:311c
L_344dc:
L_344e1:
    V_0ef4# = RT_SIN##(FX##(V_0f14!)) * 0.180000007152557373046875##   '@344e1 DS:312c
    V_0efc# = RT_COS##(FX##(V_0f14!)) * 0.25   '@344fe DS:3130
    RT_PSET RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808! + V_17e0#) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_0efc# - V_1810!) * V_181c!), 0, 0   '@3451b DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808! + V_17e8#) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_0efc# - V_1810!) * V_181c!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@34587 DS:2f98
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 2) <> -1) THEN GOTO L_34b7e   '@34605
    V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 3)), 0)   '@3462d
    V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 3)), 1)   '@346aa
    V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 3) + 1), 0)   '@34728
    V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 2), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), 3) + 1), 1)   '@347a7
    IF NOT (V_17e0# = V_17e8#) THEN GOTO L_34896   '@34827
    V_0f14! = FX##(V_0e68_pi#) / 2.0#   '@34842 DS:311c
    IF NOT (V_17f0# > V_17f8#) THEN GOTO L_3488e   '@34858
    V_0f14! = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@34873 DS:311c,3124
L_3488e:
    GOTO L_34a55   '@3488e
L_34896:
    IF NOT (V_17f0# <= V_17f8# AND V_17e0# < V_17e8#) THEN GOTO L_348fe   '@34896
    V_0f14! = ATN((FX##(V_17f8#) - V_17f0#) / (FX##(V_17e8#) - V_17e0#))   '@348d4
L_348fe:
    IF NOT (V_17f0# <= V_17f8# AND V_17e0# > V_17e8#) THEN GOTO L_3496e   '@348fe
    V_0f14! = V_0e68_pi# - ATN((FX##(V_17f8#) - V_17f0#) / (FX##(V_17e0#) - V_17e8#))   '@3493c
L_3496e:
    IF NOT (V_17f0# > V_17f8# AND V_17e0# > V_17e8#) THEN GOTO L_349db   '@3496e
    V_0f14! = ATN((FX##(V_17f0#) - V_17f8#) / (FX##(V_17e0#) - V_17e8#)) + V_0e68_pi#   '@349ac
L_349db:
    IF NOT (V_17f0# > V_17f8# AND V_17e0# < V_17e8#) THEN GOTO L_34a50   '@349db
    V_0f14! = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_17f0#) - V_17f8#) / (FX##(V_17e8#) - V_17e0#))   '@34a19 DS:311c
L_34a50:
L_34a55:
    V_0ef4# = RT_SIN##(FX##(V_0f14!)) * 0.180000007152557373046875##   '@34a55 DS:312c
    V_0efc# = RT_COS##(FX##(V_0f14!)) * 0.25   '@34a72 DS:3130
    RT_PSET RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808! + V_17e0#) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_0efc# - V_1810!) * V_181c!), 0, 0   '@34a8f DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_0ef4#) - V_1808! + V_17e8#) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_0efc# - V_1810!) * V_181c!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@34afb DS:2f98
L_34b7e:
    RETURN   '@34b7e
L_34b8d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    V_17e0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0))), 0)   '@34b92 DS:2d84
    V_17f0# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0))), 1)   '@34c25 DS:2d84
    V_17e8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0)) + 1), 0)   '@34cb9 DS:2d84
    V_17f8# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0)) + 1), 1)   '@34d4e DS:2d84
    IF NOT (A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) > 0) THEN GOTO L_34f03   '@34de4
    V_0f1c$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(FX##(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4)) / 1000.0))))) + "/" + LTRIM$(STR$(RT_SNG!(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) - INT(FX##(A_11e0%(RT_CINT%(FX##(V_0f10!)), 4)) / 1000.0) * 1000.0)))   '@34e0f DS:30ca,30d0,30d4
    GOTO L_34fad   '@34efb
L_34f03:
    V_0f1c$ = LTRIM$(STR$(RT_SNG!(FX##(A_10fa%(RT_CINT%(FX##(A_10cc!(A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!))), 0))), A_11e0%(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_1778!) + 1.0))) - 2) / 10.0)))   '@34f03 DS:2d84,2da0
L_34fad:
    V_0ef4# = (FX##(V_17e0#) + V_17e8#) / 2.0#   '@34fad DS:311c
    V_0efc# = (FX##(V_17f0#) + V_17f8#) / 2.0#   '@34fc8 DS:311c
    V_1750! = 1.0   '@34fe3 DS:2d84
    V_1754! = -L_BP48! * 0.20000000298023223876953125##   '@34ff4 DS:3134
    IF NOT (V_17f0# > V_17f8# AND V_17e0# > V_17e8# OR V_17f0# > V_17f8# AND V_17e0# <= V_17e8#) THEN GOTO L_3509f   '@3500c
    V_1750! = -(LEN(V_0f1c$) * 2) - 1   '@35080
L_3509f:
    IF NOT (V_17f0# = V_17f8#) THEN GOTO L_350d6   '@3509f
    V_1750! = -LEN(V_0f1c$)   '@350ba
L_350d6:
    IF NOT (V_17e0# < V_17e8#) THEN GOTO L_35106   '@350d6
    V_1754! = L_BP48! * 2.400000095367431640625##   '@350f1 DS:3138
L_35106:
    IF NOT (V_17e0# = V_17e8#) THEN GOTO L_35131   '@35106
    V_1754! = L_BP48!   '@35121
L_35131:
    L_BPe4% = (V_0dcc_placa$ = "EGA")   '@35131 DS:2d6c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPe4%) <> 0) THEN GOTO L_35183   '@35157 DS:2d74
    COLOR 14   '@3516d
L_35183:
    L_BPe6% = (A_11e0%(RT_CINT%(FX##(V_0f10!)), 4) > 0)   '@35183
    L_BPe8% = V_0dcc_placa$ = "EGA" AND L_BPe6%   '@351bd DS:2d6c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPe8%) <> 0) THEN GOTO L_35206   '@351da DS:2d74
    COLOR 10   '@351f0
L_35206:
    IF NOT (V_0ee8! = 1.0) THEN GOTO L_352b9   '@35206 DS:2d84
    L_BPec! = FX##(L_BP44!) * V_1750! + V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@35221
    L_BPf0! = FX##(V_1754!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@35254 DS:2da8
    L_BPf4$ = "CGA"   '@35281 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BPec!, L_BPf0!, V_0f1c$, L_BPf4$)   '@3528f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @352a7 libera strings locais (L_BPf4)
    GOTO L_35371   '@352b1
L_352b9:
    L_BPf8! = FX##(L_BP44!) * V_1750! + V_1800! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@352b9
    L_BPfc! = FX##(V_1754!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@352ec DS:2da8
    L_BP100$ = "~" + V_0f1c$   '@35319 DS:313c
    L_BP104$ = "CGA"   '@35331 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BPf8!, L_BPfc!, L_BP100$, L_BP104$)   '@3533f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35358 libera strings locais (L_BP100)
    ' @35362 libera strings locais (L_BP104)
L_35371:
    L_BP106% = (V_0dcc_placa$ = "EGA")   '@35371 DS:2d6c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP106%) <> 0) THEN GOTO L_353c9   '@35397 DS:2d74
    COLOR RT_CINT%(FX##(L_BP54!))   '@353ad
L_353c9:
    RETURN   '@353c9
L_353d8:   ' entrada vinda de 030182_FUN_3000_0182
    ' @353d8 libera strings locais (L_BPc2)
    ' @353e2 libera strings locais (L_BP9a)
    ' @353ec libera strings locais (L_BP90)
    ' @353f6 libera strings locais (L_BP8c)
    ' @35400 libera strings locais (L_BP5c)
    ' @35409 libera strings locais (L_BPc6)
    ' END SUB   '@35413
END SUB

SUB S_35423   ' entrada de SUB/FUNCTION (B$ENRA, locais 272 bytes) (0x35423)
    DIM L_BP0c%
    DIM L_BP0e%
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP28%
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP60$
    DIM L_BP64!
    DIM L_BP68!
    DIM L_BP6c$
    DIM L_BP6e%
    DIM L_BP70%
    DIM L_BP72%
    DIM L_BP76$
    DIM L_BP78%
    DIM L_BP7a%
    DIM L_BP7e!
    DIM L_BP82!
    DIM L_BP86$
    DIM L_BP88%
    DIM L_BP8a%
    DIM L_BP8e!
    DIM L_BP92!
    DIM L_BP96$
    DIM L_BP9a!
    DIM L_BP9e!
    DIM L_BPa0%
    DIM L_BPa4!
    DIM L_BPa8!
    DIM L_BPac$
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb8$
    DIM L_BPbc$
    DIM L_BPbe%
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
    REDIM L_BP46!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP5c!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_3000_5423 @0x35423  (035423_FUN_3000_5423.lift.txt; evidence_id (assembly): ev_effdf2c5b1147977299d2eede5d9e2ac8afb5718fc46895ef55bb38952bae009)
    IF NOT (V_120e% = 0) THEN GOTO L_35442   '@3542b
    GOTO L_389e9   '@3543a
L_35442:
    REDIM L_BP46!(0 TO 1)   '@35451
    REDIM L_BP5c!(0 TO 1, 0 TO 7)   '@3546e
    L_BP60$ = V_0dcc_placa$   '@3549c
    IF NOT (L_BP60$ = "HER") THEN GOTO L_35543   '@354ae DS:2d40
    RT_SCREEN 3   '@354c5
    L_BP12! = 7.0   '@354db DS:2d48
    L_BP16! = 7.0   '@354eb DS:2d48
    L_BP1a! = 7.0   '@354fb DS:2d48
    L_BP1e! = 0.0   '@3550b DS:2d4c
    L_BP22! = 4.5   '@3551b DS:2d50
    L_BP26! = 4.0   '@3552b DS:2d54
    GOTO L_3569a   '@3553b
L_35543:
    IF NOT (L_BP60$ <> "CGA") THEN GOTO L_35567   '@35543 DS:2d58
    IF NOT (L_BP60$ = "MCG") THEN GOTO L_355e2   '@35555 DS:2d60
L_35567:
    RT_SCREEN 2   '@35567
    L_BP12! = 15.0   '@3557a DS:2d68
    L_BP16! = 15.0   '@3558a DS:2d68
    L_BP1a! = 15.0   '@3559a DS:2d68
    L_BP1e! = 0.0   '@355aa DS:2d4c
    L_BP22! = 4.0   '@355ba DS:2d54
    L_BP26! = 4.0   '@355ca DS:2d54
    GOTO L_3569a   '@355da
L_355e2:
    IF NOT (L_BP60$ <> "EGA") THEN GOTO L_35606   '@355e2 DS:2d6c
    IF NOT (L_BP60$ = "VGA") THEN GOTO L_3569a   '@355f4 DS:2d74
L_35606:
    RT_SCREEN 9   '@35606
    COLOR , 1   '@3561c
    L_BP12! = 4.0   '@35632 DS:2d54
    L_BP16! = 14.0   '@35642 DS:2d7c
    L_BP1a! = 15.0   '@35652 DS:2d68
    L_BP1e! = 1.0   '@35662 DS:2d84
    L_BP22! = 4.0   '@35672 DS:2d54
    L_BP26! = 4.0   '@35682 DS:2d54
    GOTO L_3569a   '@35692
L_3569a:
    V_1808! = A_0f8a!(1, 1)   '@3569a
    V_180c! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@356bb
    V_1810! = A_0f8a!(1, 0)   '@356f8
    V_1814! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@3571b
    V_1818! = 560.0 / (FX##(V_180c!) - V_1808!)   '@35754 DS:2d88
    V_181c! = 145.0 / (FX##(V_1814!) - V_1810!)   '@35772 DS:2d8c
    IF NOT (FX##(V_181c!) / V_1818! > 0.41670000553131103515625##) THEN GOTO L_357ce   '@35790 DS:2d90
    V_181c! = V_1818! * 0.41670000553131103515625##   '@357b0 DS:2d90
    GOTO L_357e9   '@357c6
L_357ce:
    V_1818! = V_181c! / 0.41670000553131103515625##   '@357ce DS:2d90
L_357e9:
    RT_CLS -1   '@357e9
    RT_WINDOW 1, (0), (0), (639), (199)   '@357f7 DS:2d4c,2d4e,2d94,2d96,2d98,2d9a (B$WIND decodificado)
    V_1800! = 45.0   '@35825 DS:2d9c
    V_1804! = 10.0   '@35836 DS:2da0
    GOSUB L_36b27   '@35847
    GOSUB L_36caa   '@35854
    L_BP0e% = 1   '@35861
    L_BP0c% = 0   '@3586b
L_3587a:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_358b7   '@3587a DS:2da4
    L_BP0c% = L_BP0c% + 1   '@358a7
    GOTO L_359d4   '@358af
L_358b7:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@358b7
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@358da
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP0c% + FX##(V_0e54_nivellaje!))))   '@358fd
    L_BP64! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP22! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@3593b
    L_BP68! = FX##(L_BP26!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@35979 DS:2da8
    L_BP6c$ = "CGA"   '@359a4 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BP64!, L_BP68!, V_0f1c$, L_BP6c$)   '@359b1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @359c6 libera strings locais (L_BP6c)
L_359d4:
    L_BP0e% = L_BP0e% + 1   '@359d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_3587a   '@359dc
    LOCATE 22, 1   '@359fc
    PRINT RT_STRINGC$((19), (95)); "  D I R E C A O   D A   A R M A D U R A  "; RT_STRINGC$((20), (95));   '@35a17 DS:3142
    IF NOT (V_126c% = 0) THEN GOTO L_35bac   '@35a4b
L_35a5f:
    LOCATE 24, 1   '@35a64
    PRINT "  Uma das Direcoes Principais Predominante da Armadura  180 "; CHR$(27); "a"; CHR$(26); " *0* ";   '@35a7f DS:2fde,3170,31b0
    CALL MIXT_07f1_LimpaTeclado   '@35abd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@35ac7 DS:2e34 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP6e% = (VAL(V_0f18$) < 0.0#)   '@35ae1 DS:3102,31ba
    IF NOT ((VAL(V_0f18$) >= 180.0# OR L_BP6e%) <> 0) THEN GOTO L_35b47   '@35b14
    BEEP   '@35b35
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35a5f   '@35b3f
L_35b47:
    V_1760! = VAL(V_0f18$)   '@35b47
    REDIM A_1210!(-32768 TO -32768, -32768 TO -32768)   '@35b61
    REDIM A_1210!(0 TO V_0e50%, 0 TO 1)   '@35b6f
    V_12f8% = 0   '@35b91
    V_12fa% = 0   '@35b9c
L_35bac:
    ERASE L_BP5c!   '@35bac
    REDIM L_BP5c!(0 TO V_0e50%, 0 TO 7)   '@35bba
    LOCATE 24, 1   '@35bdc
    PRINT " Aguarde .."; RT_TAB$(79); ""; "";   '@35bf7 DS:2dd0,2e34
    L_BP70% = A_109e%(0, 0)   '@35c20
    FOR L_BP0e% = 1 TO L_BP70%   '@35c3b
    V_177c! = A_10cc!(L_BP0e%, 0)   '@35c42
    IF NOT (A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_35d19   '@35c64 DS:2d4c
    IF NOT (V_126c% = 0) THEN GOTO L_35cca   '@35c91
    A_1210!(RT_CINT%(FX##(V_177c!)), 0) = V_1760!   '@35ca0
L_35cca:
    GOSUB L_3744e   '@35cca
    IF NOT (V_126c% = 0) THEN GOTO L_35d11   '@35cd7
    A_1210!(RT_CINT%(FX##(V_177c!)), 1) = V_1778!   '@35ce6
L_35d11:
    GOTO L_35d57   '@35d11
L_35d19:
    IF NOT (V_126c% = 0) THEN GOTO L_35d52   '@35d19
    A_1210!(RT_CINT%(FX##(V_177c!)), 0) = -1.0   '@35d28 DS:2f04
L_35d52:
L_35d57:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e%   '@35d57
    V_126c% = 1   '@35d6b
    L_BP72% = A_109e%(0, 0)   '@35d76
    FOR L_BP0e% = 1 TO L_BP72%   '@35d91
    IF NOT (A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_35e09   '@35d98 DS:2d4c
    V_177c! = A_10cc!(L_BP0e%, 0)   '@35dc5
    V_0ee8! = L_BP12!   '@35de7
    GOSUB L_36e2e   '@35df7
L_35e09:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e%   '@35e09
    RT_VIEWPRINT 23, 25   '@35e1d
    RT_CLS 2   '@35e2f
L_35e42:
    RT_VIEWPRINT 1, 25   '@35e47
    LOCATE 24, 1   '@35e59
    PRINT "  <D>irecao principal da Armadura    <R>elacao entre Esforcos    <F>im"; RT_TAB$(79); ""; " "   '@35e74 DS:2e34,2e38,31c2
    PRINT " "; RT_TAB$(79); ""; " ";   '@35e9d DS:2e34,2e38
    CALL MIXT_07f1_LimpaTeclado   '@35ec6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_35ed5:
    V_0f18$ = ""   '@35eda DS:2e34
L_35ef2:
    V_0f18$ = RT_INKEY$   '@35ef2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_35ef2   '@35f06 DS:2e34
    L_BP76$ = V_0f18$   '@35f1a
    IF NOT (L_BP76$ <> "D") THEN GOTO L_35f55   '@35f2c DS:320c
    IF NOT (L_BP76$ = "d") THEN GOTO L_3651d   '@35f43 DS:3212
L_35f55:
    RT_VIEWPRINT 23, 25   '@35f55
    RT_CLS 2   '@35f67
L_35f7a:
    LOCATE 24, 1   '@35f7f
    PRINT " Laje que deseja Alterar a Direcao Principal da Armadura *RETORNO* ";   '@35f9a DS:3218
    CALL MIXT_07f1_LimpaTeclado   '@35fa8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@35fb2 DS:2e34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_35ff7   '@35fcc
    RT_CLS 2   '@35fe1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35e42   '@35fef
L_35ff7:
    L_BP78% = (FX##(VAL(V_0f18$)) - V_0e54_nivellaje! <= FX##(0.0#))   '@35ff7 DS:3102
    IF NOT ((FX##(VAL(V_0f18$)) - V_0e54_nivellaje! > A_109e%(0, 0) OR L_BP78%) <> 0) THEN GOTO L_36084   '@36049
    BEEP   '@36072
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35f7a   '@3607c
L_36084:
    L_BP0e% = 1   '@36084
    L_BP0c% = 0   '@3608e
L_3609e:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_360d3   '@3609e DS:2da4
    L_BP0c% = L_BP0c% + 1   '@360cb
L_360d3:
    IF NOT (L_BP0e% - L_BP0c% + FX##(V_0e54_nivellaje!) = FX##(VAL(V_0f18$))) THEN GOTO L_3610a   '@360d3
    GOTO L_36132   '@36102
L_3610a:
    L_BP0e% = L_BP0e% + 1   '@3610a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_3609e   '@36112
L_36132:
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_36164   '@36132
    BEEP   '@36152
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35f7a   '@3615c
L_36164:
L_36169:
    LOCATE 25, 1   '@3616e
    V_177c! = A_10cc!(L_BP0e%, 0)   '@36189
    PRINT " Nova Direcao Principal *"; LTRIM$(STR$(A_1210!(RT_CINT%(FX##(V_177c!)), 0))); "* ";   '@361ab DS:30fc,3260
    CALL MIXT_07f1_LimpaTeclado   '@361f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@361fe DS:2e34 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_36243   '@36218
    RT_CLS 2   '@3622d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35f7a   '@3623b
L_36243:
    L_BP7a% = (VAL(V_0f18$) < 0.0#)   '@36243 DS:3102,31ba
    IF NOT ((VAL(V_0f18$) >= 180.0# OR L_BP7a%) <> 0) THEN GOTO L_362a9   '@36276
    BEEP   '@36297
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36169   '@362a1
L_362a9:
    V_0ee8! = L_BP1e!   '@362a9
    GOSUB L_36e2e   '@362b9
    A_1210!(RT_CINT%(FX##(V_177c!)), 0) = VAL(V_0f18$)   '@362c6
    IF NOT (V_12fa% = 1) THEN GOTO L_3636e   '@362f9
    A_12fc!(L_BP0e%, 1) = 0.0   '@36308 DS:2d4c
    A_12fc!(L_BP0e%, 2) = 0.0   '@3632b DS:2d4c
    A_12fc!(L_BP0e%, 3) = 0.0   '@3634b DS:2d4c
L_3636e:
    GOSUB L_36caa   '@3636e
    GOSUB L_3744e   '@3637b
    A_1210!(RT_CINT%(FX##(V_177c!)), 1) = V_1778!   '@36388
    V_0ee8! = L_BP12!   '@363b3
    GOSUB L_36e2e   '@363c3
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@363d0
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@363f3
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP0c% + FX##(V_0e54_nivellaje!))))   '@36416
    L_BP7e! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP22! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@36454
    L_BP82! = FX##(L_BP26!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@36492 DS:2da8
    L_BP86$ = "CGA"   '@364be DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BP7e!, L_BP82!, V_0f1c$, L_BP86$)   '@364cc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @364e3 libera strings locais (L_BP86)
    RT_VIEWPRINT 23, 25   '@364ed
    RT_CLS 2   '@364ff
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35f7a   '@3650d
L_3651d:
    IF NOT (L_BP76$ <> "R") THEN GOTO L_36541   '@3651d DS:2f14
    IF NOT (L_BP76$ = "r") THEN GOTO L_36acc   '@3652f DS:2f1a
L_36541:
    RT_VIEWPRINT 23, 25   '@36541
    RT_CLS 2   '@36553
L_36566:
    LOCATE 24, 1   '@3656b
    PRINT " Laje que deseja Alterar a Relacao entre Esforcos *RETORNO* ";   '@36586 DS:327e
    CALL MIXT_07f1_LimpaTeclado   '@36594
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@3659e DS:2e34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_365e3   '@365b8
    RT_CLS 2   '@365cd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35e42   '@365db
L_365e3:
    L_BP88% = (FX##(VAL(V_0f18$)) - V_0e54_nivellaje! <= FX##(0.0#))   '@365e3 DS:3102
    IF NOT ((FX##(VAL(V_0f18$)) - V_0e54_nivellaje! > A_109e%(0, 0) OR L_BP88%) <> 0) THEN GOTO L_36672   '@36636
    BEEP   '@36660
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36566   '@3666a
L_36672:
    L_BP0e% = 1   '@36672
    L_BP0c% = 0   '@3667c
L_3668c:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_366c1   '@3668c DS:2da4
    L_BP0c% = L_BP0c% + 1   '@366b9
L_366c1:
    IF NOT (L_BP0e% - L_BP0c% + FX##(V_0e54_nivellaje!) = FX##(VAL(V_0f18$))) THEN GOTO L_366f8   '@366c1
    GOTO L_36720   '@366f0
L_366f8:
    L_BP0e% = L_BP0e% + 1   '@366f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_3668c   '@36700
L_36720:
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_36752   '@36720
    BEEP   '@36740
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36566   '@3674a
L_36752:
L_36757:
    LOCATE 25, 1   '@3675c
    V_177c! = A_10cc!(L_BP0e%, 0)   '@36777
    PRINT " Nova Relacao *"; LTRIM$(STR$(A_1210!(RT_CINT%(FX##(V_177c!)), 1))); "* ";   '@36799 DS:30fc,32be
    CALL MIXT_07f1_LimpaTeclado   '@367e3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@367ed DS:2e34 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_36832   '@36807
    RT_CLS 2   '@3681c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36566   '@3682a
L_36832:
    L_BP8a% = (VAL(V_0f18$) < 0.0#)   '@36832 DS:3102,31ba
    IF NOT ((VAL(V_0f18$) > 180.0# OR L_BP8a%) <> 0) THEN GOTO L_3689a   '@36866
    BEEP   '@36888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36757   '@36892
L_3689a:
    V_0ee8! = L_BP1e!   '@3689a
    GOSUB L_36e2e   '@368aa
    A_1210!(RT_CINT%(FX##(V_177c!)), 1) = VAL(V_0f18$)   '@368b7
    IF NOT (V_12fa% = 1) THEN GOTO L_36960   '@368eb
    A_12fc!(L_BP0e%, 1) = 0.0   '@368fa DS:2d4c
    A_12fc!(L_BP0e%, 2) = 0.0   '@3691d DS:2d4c
    A_12fc!(L_BP0e%, 3) = 0.0   '@3693d DS:2d4c
L_36960:
    V_0ee8! = L_BP12!   '@36960
    GOSUB L_36e2e   '@36970
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@3697d
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@369a0
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP0c% + FX##(V_0e54_nivellaje!))))   '@369c3
    L_BP8e! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP22! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@36a01
    L_BP92! = FX##(L_BP26!) - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@36a40 DS:2da8
    L_BP96$ = "CGA"   '@36a6c DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BP8e!, L_BP92!, V_0f1c$, L_BP96$)   '@36a7a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @36a92 libera strings locais (L_BP96)
    RT_VIEWPRINT 23, 25   '@36a9c
    RT_CLS 2   '@36aae
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_36566   '@36abc
L_36acc:
    IF NOT (L_BP76$ <> "F") THEN GOTO L_36af0   '@36acc DS:2f08
    IF NOT (L_BP76$ = "f") THEN GOTO L_36b15   '@36ade DS:2f0e
L_36af0:
    RT_SCREEN 0   '@36af0
    GOTO L_389e9   '@36b05
L_36b15:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35ed5   '@36b15
    ' ---- F_36b1d @0x36b1d  (036b1d_F_36b1d.lift.txt; evidence_id (assembly): ev_edc933c16eb8b114bb11aae64d3dd41dcb4f260b7432de68ca21ba2562427167)
L_36b27:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035423_FUN_3000_5423
    L_BP9a! = A_0fb8!(0, 0)   '@36b2c
    FOR V_0f10! = 1.0 TO L_BP9a!   '@36b4d DS:2d84
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@36b54 DS:2f98
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 72, RT_CINT%(FX##(L_BP16!)), 17476   '@36bda DS:2f98
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@36c6f DS:2d84
    RETURN   '@36c9b
L_36caa:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035423_FUN_3000_5423
    L_BP9e! = A_1042!(0, 0)   '@36caf
    FOR V_0f10! = 1.0 TO L_BP9e!   '@36cd0 DS:2d84
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_1810!) * V_181c!), 0, 0   '@36cd8 DS:2f98
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_1808!) * V_1818! + V_1800!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(L_BP1a!)), 0   '@36d5e DS:2f98
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@36df3 DS:2d84
    RETURN   '@36e1f
L_36e2e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035423_FUN_3000_5423
    RT_VIEWPRINT 1, 25   '@36e33
    IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) > 0.0) THEN GOTO L_3713f   '@36e45 DS:2d4c
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@36e7a
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@36e9d
    V_0f1c$ = "1:" + LTRIM$(STR$(A_1210!(RT_CINT%(FX##(V_177c!)), 1)))   '@36ec0 DS:32d2
    L_BPa0% = (V_0dcc_placa$ = "EGA")   '@36f06 DS:2d6c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPa0%) <> 0) THEN GOTO L_36f58   '@36f2c DS:2d74
    COLOR 14   '@36f42
L_36f58:
    IF NOT (V_0ee8! <> L_BP1e!) THEN GOTO L_3701a   '@36f58
    L_BPa4! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP22! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@36f72
    L_BPa8! = FX##(L_BP26!) * 2.5 - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@36fb1 DS:2da8,32d8
    L_BPac$ = "CGA"   '@36fe2 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BPa4!, L_BPa8!, V_0f1c$, L_BPac$)   '@36ff0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @37008 libera strings locais (L_BPac)
    GOTO L_370e2   '@37012
L_3701a:
    L_BPb0! = V_1800! - FX##(LEN(V_0f1c$)) * L_BP22! + (FX##(V_0ef4#) - V_1808!) * V_1818!   '@3701a
    L_BPb4! = FX##(L_BP26!) * 2.5 - V_1804! - (FX##(V_0efc#) - V_1810!) * V_181c! + 165.0#   '@37059 DS:2da8,32d8
    L_BPb8$ = "~" + V_0f1c$   '@3708a DS:313c
    L_BPbc$ = "CGA"   '@370a2 DS:2d58
    CALL MIXT_08c4_TextoGrafico(L_BPb0!, L_BPb4!, L_BPb8$, L_BPbc$)   '@370b0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @370c9 libera strings locais (L_BPb8)
    ' @370d3 libera strings locais (L_BPbc)
L_370e2:
    L_BPbe% = (V_0dcc_placa$ = "EGA")   '@370e2 DS:2d6c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPbe%) <> 0) THEN GOTO L_3713a   '@37108 DS:2d74
    COLOR RT_CINT%(FX##(L_BP1a!))   '@3711e
L_3713a:
L_3713f:
    V_17e0# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 0)   '@3713f
    V_17f0# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 1)   '@37169
    V_17e8# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 2)   '@37194
    V_17f8# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 3)   '@371bc
    RT_PSET RT_SNG!(V_1800! + (FX##(V_17e0#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_1810!) * V_181c!), 0, 0   '@371e7 DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_17e8#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_1810!) * V_181c!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@37249 DS:2f98
    V_17e0# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 4)   '@372bd
    V_17f0# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 5)   '@372e8
    V_17e8# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 6)   '@37313
    V_17f8# = L_BP5c!(RT_CINT%(FX##(V_177c!)), 7)   '@3733e
    RT_PSET RT_SNG!(V_1800! + (FX##(V_17e0#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f0#) - V_1810!) * V_181c!), 0, 0   '@37369 DS:2f98
    RT_LINE 0, 0, RT_SNG!(V_1800! + (FX##(V_17e8#) - V_1808!) * V_1818!), RT_SNG!(165.0 - FX##(V_1804!) - (FX##(V_17f8#) - V_1810!) * V_181c!), 72, RT_CINT%(FX##(V_0ee8!)), 4369   '@373cb DS:2f98
    RETURN   '@3743f
L_3744e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 035423_FUN_3000_5423
    REDIM A_15b0!(-32768 TO -32768)   '@37453
    REDIM A_15de!(-32768 TO -32768)   '@37461
    REDIM A_15b0!(0 TO A_109e%(CINT(V_177c!), 0))   '@3746a
    REDIM A_15de!(0 TO A_109e%(CINT(V_177c!), 0))   '@374a0
    L_BPc2! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@374d1
    FOR V_0f10! = 1.0 TO L_BPc2!   '@37500 DS:2d84
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@37508
    A_15de!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@37562
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@375bd DS:2d84
    L_BP28% = 0   '@375e9
    V_1778! = A_1210!(RT_CINT%(FX##(V_177c!)), 0)   '@375f3
    V_1758! = 0.0   '@3761d DS:2d4c
    V_175c! = 0.0   '@3762e DS:2d4c
L_37644:
    IF NOT (V_1778! = 270.0 OR V_1778! = 90.0) THEN GOTO L_377fe   '@37649 DS:32dc,32e0
    L_BPc6! = 0.0   '@37687 DS:2d4c
    L_BPca! = 0.0   '@37698 DS:2d4c
    L_BPce! = A_15b0!(1)   '@376a9
    L_BPd2! = A_15b0!(1)   '@376c6
    L_BPd6! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@376e3
    FOR V_0f10! = 2.0 TO L_BPd6!   '@37712 DS:2d84,2da4
    IF NOT (A_15b0!(RT_CINT%(FX##(V_0f10!))) < L_BPce!) THEN GOTO L_37772   '@3771a
    L_BPce! = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@3774b
L_37772:
    IF NOT (A_15b0!(RT_CINT%(FX##(V_0f10!))) > L_BPd2!) THEN GOTO L_377ca   '@37772
    L_BPd2! = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@377a3
L_377ca:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@377ca DS:2d84
    GOTO L_37aa7   '@377f6
L_377fe:
    L_BPc6! = A_15de!(1) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(1)   '@377fe DS:31ba
    L_BPca! = A_15de!(1) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(1)   '@37848 DS:31ba
    L_BPce! = 0.0   '@37892 DS:2d4c
    L_BPd2! = 0.0   '@378a3 DS:2d4c
    L_BPda! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@378b4
    FOR V_0f10! = 2.0 TO L_BPda!   '@378e3 DS:2d84,2da4
    IF NOT (A_15de!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(RT_CINT%(FX##(V_0f10!))) < FX##(L_BPc6!)) THEN GOTO L_379b0   '@378ea DS:31ba
    L_BPc6! = A_15de!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@37952 DS:31ba
L_379b0:
    IF NOT (A_15de!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(RT_CINT%(FX##(V_0f10!))) > FX##(L_BPca!)) THEN GOTO L_37a76   '@379b0 DS:31ba
    L_BPca! = A_15de!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(V_1778!) * V_0e68_pi# / 180.0#) * A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@37a18 DS:31ba
L_37a76:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@37a76 DS:2d84
L_37aa7:
    L_BP2c! = (FX##(L_BPd2!) - L_BPce!) / 10.0   '@37aa7 DS:2da0
    L_BP30! = (FX##(L_BPca!) - L_BPc6!) / 10.0   '@37ac1 DS:2da0
    V_1750! = FX##(L_BPce!) + L_BP2c!   '@37adb
    V_1754! = FX##(L_BPc6!) + L_BP30!   '@37af0
    V_0f0c! = 1.0   '@37b05 DS:2d84
L_37b1c:
    V_17e0# = V_1750!   '@37b1c
    V_17f0# = V_1754!   '@37b2d
    V_1678# = FX##(V_1778!) * V_0e68_pi# / 180.0#   '@37b3e DS:31ba
    L_BP34! = 0.0   '@37b59 DS:2d4c
    ERASE L_BP46!   '@37b69
    REDIM L_BP46!(0 TO 20)   '@37b77
    L_BPde! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@37b94
    FOR V_0f10! = 1.0 TO L_BPde!   '@37bc4 DS:2d84
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@37bcc
    V_17f8# = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@37bf3
    IF NOT (A_15b0!(RT_CINT%(FX##(V_0f10!))) = A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0))) THEN GOTO L_37c84   '@37c1a DS:2d84
    V_1680# = FX##(V_0e68_pi#) / 2.0#   '@37c66 DS:311c
    GOTO L_37d15   '@37c7c
L_37c84:
    V_1680# = ATN((FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) - A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0))) / (FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) - A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0))))   '@37c84 DS:2d84
L_37d15:
    V_0f20$ = "NAO"   '@37d15 DS:32e4
    CALL S_23341   '@37d27
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f20$ = ""   '@37d31 DS:2e34
    L_BPe2! = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@37d43
    L_BPe6! = A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@37d6b DS:2d84
    CALL MIXT_0877_Menor(L_BPe2!, L_BPe6!, L_BPea!)   '@37d91
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BPe6!   '@37da6 DS:2d84
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = L_BPe2!   '@37dcd
    L_BPee! = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@37def
    L_BPf2! = A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@37e11 DS:2d84
    CALL MIXT_082a_Maior(L_BPee!, L_BPf2!, L_BPf6!)   '@37e37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BPf2!   '@37e4c DS:2d84
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = L_BPee!   '@37e73
    IF NOT (FX##(L_BPf6!) >= FX##(V_0ef4#) AND FX##(L_BPea!) <= FX##(V_0ef4#)) THEN GOTO L_381b1   '@37e95
    L_BPfa! = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@37ecd
    L_BPfe! = A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@37ef5 DS:2d84
    CALL MIXT_0877_Menor(L_BPfa!, L_BPfe!, L_BP102!)   '@37f1b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BPfe!   '@37f30 DS:2d84
    A_15de!(RT_CINT%(FX##(V_0f10!))) = L_BPfa!   '@37f57
    L_BP106! = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@37f79
    L_BP10a! = A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@37f9b DS:2d84
    CALL MIXT_082a_Maior(L_BP106!, L_BP10a!, L_BP10e!)   '@37fc1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BP10a!   '@37fd6 DS:2d84
    A_15de!(RT_CINT%(FX##(V_0f10!))) = L_BP106!   '@37ffd
    IF NOT (FX##(L_BP10e!) >= FX##(V_0efc#) AND FX##(L_BP102!) <= FX##(V_0efc#)) THEN GOTO L_381ac   '@3801f
    IF NOT (FX##(A_15de!(RT_CINT%(FX##(V_0f10!) + 1.0))) = FX##(V_0efc#) AND FX##(A_15b0!(RT_CINT%(FX##(V_0f10!) + 1.0))) = FX##(V_0ef4#) OR FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) = FX##(V_0efc#) AND FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) = FX##(V_0ef4#)) THEN GOTO L_3813b   '@38057 DS:2d84
    GOTO L_381a7   '@38133
L_3813b:
    L_BP34! = FX##(L_BP34!) + 1.0   '@3813b DS:2d84
    L_BP46!(RT_CINT%(FX##(L_BP34!))) = RT_SQR##(RT_POT##((FX##(V_0ef4#) - V_17e0#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_17f0#), (2.0#)))   '@3814f DS:311c
L_381a7:
L_381ac:
L_381b1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@381b1 DS:2d84
    L_BP112! = FX##(L_BP34!) - 1.0   '@381dd DS:2f04
    FOR V_0f10! = 1.0 TO L_BP112!   '@381f3 DS:2d84
    L_BP116! = L_BP34!   '@381fa
    FOR V_0f04! = FX##(V_0f10!) + 1.0 TO L_BP116!   '@3820b DS:2d84
    IF NOT (L_BP46!(RT_CINT%(FX##(V_0f10!))) > L_BP46!(RT_CINT%(FX##(V_0f04!)))) THEN GOTO L_3829b   '@38218
    SWAP L_BP46!(RT_CINT%(FX##(V_0f10!))), L_BP46!(RT_CINT%(FX##(V_0f04!)))   '@3825f
L_3829b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@3829b DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@382c7 DS:2d84
    V_0f04! = 0.0   '@382f3 DS:2d4c
    L_BP11a! = L_BP34!   '@38304
    FOR V_0f10! = 1.0 TO L_BP11a! STEP 2.0   '@38315 DS:2d84,2da4
    IF NOT (FX##(L_BP46!(RT_CINT%(FX##(V_0f10!) + 1.0))) - L_BP46!(RT_CINT%(FX##(V_0f10!))) > FX##(V_0f04!)) THEN GOTO L_3858f   '@3831c DS:2d84
    V_0f04! = FX##(L_BP46!(RT_CINT%(FX##(V_0f10!) + 1.0))) - L_BP46!(RT_CINT%(FX##(V_0f10!)))   '@3836d DS:2d84
    L_BP5c!(0, 0) = ABS(RT_COS##(FX##(V_1678#)) * L_BP46!(RT_CINT%(FX##(V_0f10!)))) + V_17e0#   '@383b4
    L_BP5c!(0, 1) = RT_SIN##(FX##(V_1678#)) * L_BP46!(RT_CINT%(FX##(V_0f10!))) * ((3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(V_1678#) AND FX##(V_0e68_pi#) / 2.0# < FX##(V_1678#)) * 2 + 1) + V_17f0#   '@38401 DS:311c,3124
    L_BP5c!(0, 2) = ABS(RT_COS##(FX##(V_1678#)) * L_BP46!(RT_CINT%(FX##(V_0f10!) + 1.0))) + V_17e0#   '@3849a DS:2d84
    L_BP5c!(0, 3) = RT_SIN##(FX##(V_1678#)) * L_BP46!(RT_CINT%(FX##(V_0f10!) + 1.0)) * ((3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(V_1678#) AND FX##(V_0e68_pi#) / 2.0# < FX##(V_1678#)) * 2 + 1) + V_17f0#   '@384ec DS:2d84,311c,3124
L_3858f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3858f DS:2da4
    IF NOT (L_BP28% = 0) THEN GOTO L_386ec   '@385bb
    IF NOT (V_0f04! > V_1758!) THEN GOTO L_386e4   '@385c9
    V_1758! = V_0f04!   '@385e4
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 0) = L_BP5c!(0, 0)   '@385f5
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 1) = L_BP5c!(0, 1)   '@3862e
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 2) = L_BP5c!(0, 2)   '@3866b
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 3) = L_BP5c!(0, 3)   '@386a2
L_386e4:
    GOTO L_38810   '@386e4
L_386ec:
    IF NOT (V_0f04! > V_175c!) THEN GOTO L_3880b   '@386ec
    V_175c! = V_0f04!   '@38707
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 4) = L_BP5c!(0, 0)   '@38718
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 5) = L_BP5c!(0, 1)   '@38752
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 6) = L_BP5c!(0, 2)   '@3878f
    L_BP5c!(RT_CINT%(FX##(V_177c!)), 7) = L_BP5c!(0, 3)   '@387c9
L_3880b:
L_38810:
    V_1754! = FX##(L_BP30!) + V_1754!   '@38810
    V_1750! = FX##(L_BP2c!) + V_1750!   '@38825
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@3883a DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f0c! >= 10.0) THEN GOTO L_37b1c   '@38850 DS:2da0
    IF NOT (L_BP28% = 0) THEN GOTO L_388d7   '@3886b
    L_BP28% = 1   '@38879
    V_1778! = FX##(V_1778!) + 90.0   '@38883 DS:32dc
    IF NOT (V_1778! > 360.0) THEN GOTO L_388ca   '@38899 DS:32ec
    V_1778! = FX##(V_1778!) - 360.0   '@388b4 DS:32f0
L_388ca:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37644   '@388ca
L_388d7:
    L_BP34! = FX##(V_1758!) / V_175c!   '@388d7
    V_1778! = A_123e!(1, 1)   '@388ec
    V_0f0c! = 2.0   '@3890d DS:2da4
L_38924:
    IF NOT (A_123e!(0, 0) >= V_0f0c!) THEN GOTO L_389da   '@38925
    IF NOT (A_123e!(RT_CINT%(FX##(V_0f0c!)), 0) < L_BP34!) THEN GOTO L_389af   '@38949
    V_1778! = A_123e!(RT_CINT%(FX##(V_0f0c!)), 1)   '@3897c
    GOTO L_389bc   '@389a7
L_389af:
    GOTO L_389da   '@389af
L_389bc:
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@389bc DS:2d84
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_38924   '@389d2
L_389da:
    RETURN   '@389da
L_389e9:   ' entrada vinda de 035423_FUN_3000_5423
    ' @389e9 libera strings locais (L_BP76)
    ' @389f2 libera strings locais (L_BP60)
    ERASE L_BP46!   '@389fb
    ERASE L_BP5c!   '@38a04
    ' END SUB   '@38a0d
END SUB

SUB S_4019b   ' entrada de SUB/FUNCTION (B$ENRA, locais 540 bytes) (0x4019b)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
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
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP88!
    DIM L_BP8c!
    DIM L_BP90!
    DIM L_BP92%
    DIM L_BP96$
    DIM L_BP98%
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
    DIM L_BPee%
    DIM L_BPf0%
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc!
    REDIM L_BP40!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_4000_019b @0x4019b  (04019b_FUN_4000_019b.lift.txt; evidence_id (assembly): ev_75d5ab4600a8f444ff729eaaf47483840202afd93f1a3b12abad2a9f4713fd94)
    REDIM L_BP40!(0 TO 20, 0 TO 2)   '@401a8
    V_177c! = RT_FRE&("")   '@401cc DS:3300
    V_177c! = 0.0   '@401e6 DS:3304
    V_0f10! = 1.0   '@401f7 DS:3308
L_4020e:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f10!)), 1) <> 2.0) THEN GOTO L_40259   '@4020e DS:330c
    V_177c! = FX##(V_177c!) + 1.0   '@40243 DS:3308
L_40259:
    V_0f10! = FX##(V_0f10!) + 1.0   '@40259 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f10! <= V_0f0c! THEN GOTO L_4020e   '@4026f
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@40287
    REDIM A_160c!(-32768 TO -32768, -32768 TO -32768)   '@40295
    REDIM A_163a!(-32768 TO -32768, -32768 TO -32768)   '@4029e
    REDIM A_1342%(0 TO V_0e50%, 0 TO 30)   '@402a7
    REDIM A_160c!(0 TO 100, 0 TO 3)   '@402c9
    REDIM A_163a!(0 TO 30, 0 TO 2)   '@402ed
    V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@40311
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_40378   '@4033b DS:330c
    GOTO L_4e6af   '@40370
L_40378:
    V_16cc! = 1.0   '@40378 DS:3308
    L_BP44! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@40389
    FOR V_0f10! = 1.0 TO L_BP44!   '@403b8 DS:3308
    V_1780! = V_0f10!   '@403c0
    V_1784! = FX##(V_0f10!) - 1.0   '@403d1 DS:3310
    V_1788! = FX##(V_0f10!) + 1.0   '@403e7 DS:3308
    IF NOT (V_1784! = 0.0) THEN GOTO L_40447   '@403fd DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@40418
L_40447:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_40490   '@40447
    V_1788! = 1.0   '@4047f DS:3308
L_40490:
    V_16bc! = 1.0   '@40490 DS:3308
    V_1790! = V_1784!   '@404a1
    V_1794! = V_1780!   '@404b2
    V_1798! = V_1780!   '@404c3
    V_179c! = V_1788!   '@404d4
    CALL S_21e5d   '@404e5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP48! = FX##(V_16a8#) / 1.0#   '@404ef DS:3314
    L_BP4c! = FX##(V_16b0#) / 1.0#   '@40505 DS:3314
    CALL MIXT_082a_Maior(L_BP48!, L_BP4c!, L_BP50!)   '@40514
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP54! = FX##(V_16a8#) / 1.0#   '@40526 DS:3314
    L_BP58! = FX##(V_16b0#) / 1.0#   '@40536 DS:3314
    CALL MIXT_0877_Menor(L_BP54!, L_BP58!, L_BP5c!)   '@40545
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP50!) - L_BP5c! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_405a6   '@40557
    A_163a!(RT_CINT%(FX##(V_1780!)), 0) = -100.0   '@40577 DS:331c
L_405a6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@405a6 DS:3308
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@405d1
    REDIM A_1342%(0 TO A_109e%(CINT(V_177c!), 0), 0 TO 0)   '@405df
    V_16cc! = 1.0   '@40619 DS:3308
    L_BP60! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4062a
    FOR V_0f10! = 1.0 TO L_BP60!   '@40659 DS:3308
    V_1780! = V_0f10!   '@40660
    V_1784! = FX##(V_0f10!) - 1.0   '@40671 DS:3310
    V_1788! = FX##(V_0f10!) + 1.0   '@40687 DS:3308
    IF NOT (V_1784! = 0.0) THEN GOTO L_406e7   '@4069d DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@406b8
L_406e7:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_40730   '@406e7
    V_1788! = 1.0   '@4071f DS:3308
L_40730:
    V_1760! = A_15b0!(RT_CINT%(FX##(V_1780!)))   '@40730
    V_1764! = A_15de!(RT_CINT%(FX##(V_1780!)))   '@40757
    V_1750! = A_15b0!(RT_CINT%(FX##(V_1784!)))   '@4077e
    V_1754! = A_15de!(RT_CINT%(FX##(V_1784!)))   '@407a5
    V_1758! = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@407cc
    V_175c! = A_15de!(RT_CINT%(FX##(V_1788!)))   '@407f3
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1) THEN GOTO L_40a3b   '@4081a
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4084c DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1780!   '@40880
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = (FX##(V_1760!) + V_1758!) / 2.0   '@408bc DS:330c
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = (FX##(V_1764!) + V_175c!) / 2.0   '@408fd DS:330c
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@40941 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1788!   '@40975
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = (FX##(V_1760!) + V_1758!) / 2.0   '@409b1 DS:330c
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = (FX##(V_1764!) + V_175c!) / 2.0   '@409f2 DS:330c
L_40a3b:
    V_16bc! = 1.0   '@40a3b DS:3308
    V_1790! = V_1784!   '@40a4c
    V_1794! = V_1780!   '@40a5d
    V_1798! = V_1780!   '@40a6e
    V_179c! = V_1788!   '@40a7f
    CALL S_21e5d   '@40a90
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f1c$ = ""   '@40a9a DS:3300
    L_BP64! = FX##(V_16a8#) / 1.0#   '@40aac DS:3314
    L_BP68! = FX##(V_16b0#) / 1.0#   '@40ac2 DS:3314
    CALL MIXT_082a_Maior(L_BP64!, L_BP68!, L_BP6c!)   '@40ad1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP70! = FX##(V_16a8#) / 1.0#   '@40ae3 DS:3314
    L_BP74! = FX##(V_16b0#) / 1.0#   '@40af3 DS:3314
    CALL MIXT_0877_Menor(L_BP70!, L_BP74!, L_BP78!)   '@40b02
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP6c!) - L_BP78! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_40b4b   '@40b14
    V_0f1c$ = "NAO"   '@40b34 DS:3320
L_40b4b:
    V_1688# = V_16a0#   '@40b4b
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_40bd8   '@40b5c
    V_0f1c$ = "NAO"   '@40bc6 DS:3320
L_40bd8:
L_40bdd:
    V_16c4! = 1.0   '@40be2 DS:3308
    V_1790! = FX##(V_1788!) - 1.0   '@40bf3 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_40c53   '@40c09 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@40c24
L_40c53:
    V_1794! = V_1788!   '@40c53
    V_1798! = V_1788!   '@40c64
    V_179c! = FX##(V_1788!) + 1.0   '@40c75 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_40cd4   '@40c8b
    V_179c! = 1.0   '@40cc3 DS:3308
L_40cd4:
    CALL S_21e5d   '@40cd4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP7c! = FX##(V_16a8#) / 1.0#   '@40cde DS:3314
    L_BP80! = FX##(V_16b0#) / 1.0#   '@40cf4 DS:3314
    CALL MIXT_082a_Maior(L_BP7c!, L_BP80!, L_BP84!)   '@40d03
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP88! = FX##(V_16a8#) / 1.0#   '@40d16 DS:3314
    L_BP8c! = FX##(V_16b0#) / 1.0#   '@40d27 DS:3314
    CALL MIXT_0877_Menor(L_BP88!, L_BP8c!, L_BP90!)   '@40d37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP84!) - L_BP90! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_40e7f   '@40d4c
    V_1788! = FX##(V_1788!) + 1.0   '@40d6e DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_40dcd   '@40d84
    V_1788! = 1.0   '@40dbc DS:3308
L_40dcd:
    L_BP92% = (V_1788! <> V_1780!)   '@40dcd
    IF NOT ((V_0f1c$ <> "NAO" AND L_BP92%) <> 0) THEN GOTO L_40e68   '@40df7 DS:3320
    V_1758! = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@40e0d
    V_175c! = A_15de!(RT_CINT%(FX##(V_1788!)))   '@40e34
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40bdd   '@40e5b
L_40e68:
    V_0f1c$ = "NAO"   '@40e68 DS:3320
L_40e7f:
    V_1690# = V_16a0#   '@40e7f
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_40f0c   '@40e90
    V_0f1c$ = "NAO"   '@40efa DS:3320
L_40f0c:
    V_17e0# = V_1760!   '@40f0c
    V_17f0# = V_1764!   '@40f1d
    V_1678# = V_1688#   '@40f2e
    V_17e8# = V_1758!   '@40f3f
    V_17f8# = V_175c!   '@40f50
    V_1680# = V_1690#   '@40f61
    CALL S_23341   '@40f72
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP96$ = V_0f18$   '@40f7c
    V_1710# = V_0ef4#   '@40f8f
    V_1718# = V_0efc#   '@40fa0
    L_BP98% = (L_BP96$ <> "NAO")   '@40fb1 DS:3320
    IF NOT ((V_0f1c$ <> "NAO" AND L_BP98%) <> 0) THEN GOTO L_41233   '@40fd8 DS:3320
    A_163a!(RT_CINT%(FX##(V_1780!)), 0) = V_1710#   '@40fee
    A_163a!(RT_CINT%(FX##(V_1780!)), 1) = V_1718#   '@41018
    V_1790! = V_1784!   '@41043
    V_1794! = V_1780!   '@41054
    V_1798! = V_1788!   '@41065
    V_179c! = FX##(V_1788!) + 1.0   '@41076 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_410d5   '@4108c
    V_179c! = 1.0   '@410c4 DS:3308
L_410d5:
    CALL S_21e5d   '@410d5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = V_16a0#   '@410df
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) <> 1 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_41199   '@41107
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = V_16a8#   '@41171
L_41199:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) <> 1 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1) THEN GOTO L_4122b   '@41199
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = V_16b0#   '@41203
L_4122b:
    GOTO L_41260   '@4122b
L_41233:
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = 100.0   '@41233 DS:3328
L_41260:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41260 DS:3308
    L_BP9c! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4128b
    FOR V_0f10! = 1.0 TO L_BP9c!   '@412bb DS:3308
    V_1780! = V_0f10!   '@412c2
    V_1784! = FX##(V_0f10!) - 1.0   '@412d3 DS:3310
    V_1788! = FX##(V_0f10!) + 1.0   '@412e9 DS:3308
    IF NOT (V_1784! = 0.0) THEN GOTO L_41349   '@412ff DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4131a
L_41349:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_41392   '@41349
    V_1788! = 1.0   '@41381 DS:3308
L_41392:
    V_1760! = A_15b0!(RT_CINT%(FX##(V_1780!)))   '@41392
    V_1764! = A_15de!(RT_CINT%(FX##(V_1780!)))   '@413b9
L_413e5:
    V_1758! = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@413ea
    V_175c! = A_15de!(RT_CINT%(FX##(V_1788!)))   '@41411
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 2) = 100.0) THEN GOTO L_4160c   '@41438 DS:3328
    V_1790! = FX##(V_1788!) - 1.0   '@4146a DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_414ca   '@41480 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4149b
L_414ca:
    V_1794! = V_1788!   '@414ca
    V_1798! = V_1788!   '@414db
    V_179c! = FX##(V_1788!) + 1.0   '@414ec DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_4154b   '@41502
    V_179c! = 1.0   '@4153a DS:3308
L_4154b:
    CALL S_21e5d   '@4154b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPa0! = FX##(V_16a8#) / 1.0#   '@41555 DS:3314
    L_BPa4! = FX##(V_16b0#) / 1.0#   '@4156c DS:3314
    CALL MIXT_082a_Maior(L_BPa0!, L_BPa4!, L_BPa8!)   '@4157c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPac! = FX##(V_16a8#) / 1.0#   '@41591 DS:3314
    L_BPb0! = FX##(V_16b0#) / 1.0#   '@415a2 DS:3314
    CALL MIXT_0877_Menor(L_BPac!, L_BPb0!, L_BPb4!)   '@415b2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPa8!) - L_BPb4! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_41607   '@415c7
    V_1788! = V_179c!   '@415e9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_413e5   '@415fa
L_41607:
L_4160c:
L_41611:
    V_1750! = A_15b0!(RT_CINT%(FX##(V_1784!)))   '@41616
    V_1754! = A_15de!(RT_CINT%(FX##(V_1784!)))   '@4163d
    IF NOT (A_163a!(RT_CINT%(FX##(V_1784!)), 2) = 100.0) THEN GOTO L_41849   '@41664 DS:3328
    V_16c0! = 1.0   '@41696 DS:3308
    V_1790! = FX##(V_1784!) - 1.0   '@416a7 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_41707   '@416bd DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@416d8
L_41707:
    V_1794! = V_1784!   '@41707
    V_1798! = V_1784!   '@41718
    V_179c! = FX##(V_1784!) + 1.0   '@41729 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_41788   '@4173f
    V_179c! = 1.0   '@41777 DS:3308
L_41788:
    CALL S_21e5d   '@41788
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPb8! = FX##(V_16a8#) / 1.0#   '@41792 DS:3314
    L_BPbc! = FX##(V_16b0#) / 1.0#   '@417a9 DS:3314
    CALL MIXT_082a_Maior(L_BPb8!, L_BPbc!, L_BPc0!)   '@417b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc4! = FX##(V_16a8#) / 1.0#   '@417ce DS:3314
    L_BPc8! = FX##(V_16b0#) / 1.0#   '@417df DS:3314
    CALL MIXT_0877_Menor(L_BPc4!, L_BPc8!, L_BPcc!)   '@417ef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPc0!) - L_BPcc! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_41844   '@41804
    V_1784! = V_1790!   '@41826
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41611   '@41837
L_41844:
L_41849:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 2) <> 100.0) THEN GOTO L_41aea   '@41849 DS:3328
    IF NOT (A_163a!(RT_CINT%(FX##(V_1784!)), 2) <> 100.0) THEN GOTO L_419b0   '@4187b DS:3328
    IF NOT (RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 0)) - V_1760!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 1)) - V_1764!), (2.0)) >= RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1784!)), 0)) - V_1760!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1784!)), 1)) - V_1764!), (2.0))) THEN GOTO L_419ab   '@418ad DS:330c
    A_1342%(RT_CINT%(FX##(V_1780!)), 0) = 100   '@41982
L_419ab:
L_419b0:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 2) <> 100.0) THEN GOTO L_41ae5   '@419b0 DS:3328
    IF NOT (RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 0)) - V_1758!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 1)) - V_175c!), (2.0)) >= RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1788!)), 0)) - V_1758!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1788!)), 1)) - V_175c!), (2.0))) THEN GOTO L_41ae0   '@419e2 DS:330c
    A_1342%(RT_CINT%(FX##(V_1780!)), 0) = 100   '@41ab7
L_41ae0:
L_41ae5:
L_41aea:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41aea DS:3308
    L_BPd0! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@41b16
    FOR V_0f10! = 1.0 TO L_BPd0!   '@41b46 DS:3308
    IF NOT (A_1342%(RT_CINT%(FX##(V_0f10!)), 0) = 100) THEN GOTO L_41ba0   '@41b4e
    A_163a!(RT_CINT%(FX##(V_0f10!)), 2) = 100.0   '@41b78 DS:3328
L_41ba0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41ba0 DS:3308
    V_0f10! = 1.0   '@41bc9 DS:3308
L_41be0:
    V_1780! = V_0f10!   '@41be0
    V_0ef4# = 0.0#   '@41bf1 DS:332c
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 2) <> 100.0) THEN GOTO L_41f37   '@41c02 DS:3328
    V_1788! = FX##(V_0f10!) + 1.0   '@41c34 DS:3308
L_41c4f:
    V_0ef4# = FX##(V_0ef4#) + 1.0#   '@41c54 DS:3314
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_41cb3   '@41c6a
    V_1788! = 1.0   '@41ca2 DS:3308
L_41cb3:
    V_1790! = FX##(V_1788!) - 1.0   '@41cb3 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_41d13   '@41cc9 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@41ce4
L_41d13:
    V_1794! = V_1788!   '@41d13
    V_1798! = V_1788!   '@41d24
    V_179c! = FX##(V_1788!) + 1.0   '@41d35 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_41d94   '@41d4b
    V_179c! = 1.0   '@41d83 DS:3308
L_41d94:
    CALL S_21e5d   '@41d94
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPd4! = FX##(V_16a8#) / 1.0#   '@41d9e DS:3314
    L_BPd8! = FX##(V_16b0#) / 1.0#   '@41db5 DS:3314
    CALL MIXT_082a_Maior(L_BPd4!, L_BPd8!, L_BPdc!)   '@41dc5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe0! = FX##(V_16a8#) / 1.0#   '@41dda DS:3314
    L_BPe4! = FX##(V_16b0#) / 1.0#   '@41deb DS:3314
    CALL MIXT_0877_Menor(L_BPe0!, L_BPe4!, L_BPe8!)   '@41dfb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPdc!) - L_BPe8! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_41e55   '@41e10
    V_1788! = FX##(V_1788!) + 1.0   '@41e32 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41c4f   '@41e48
L_41e55:
    A_163a!(RT_CINT%(FX##(V_1788!)), 0) = A_163a!(RT_CINT%(FX##(V_1780!)), 0)   '@41e55
    A_163a!(RT_CINT%(FX##(V_1788!)), 1) = A_163a!(RT_CINT%(FX##(V_1780!)), 1)   '@41e98
    A_163a!(RT_CINT%(FX##(V_1788!)), 2) = A_163a!(RT_CINT%(FX##(V_1780!)), 2)   '@41edd
    V_0f10! = FX##(V_0f10!) + V_0ef4#   '@41f1c
L_41f37:
    V_0f10! = FX##(V_0f10!) + 1.0   '@41f37 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1 < V_0f10!) THEN GOTO L_41be0   '@41f4d
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@41f86
    REDIM A_1342%(0 TO V_0e50%, 0 TO 30)   '@41f94
    L_BPec! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@41fb6
    FOR V_0f10! = 1.0 TO L_BPec!   '@41fe6 DS:3308
    V_1794! = V_0f10!   '@41fee
    V_1798! = V_0f10!   '@41fff
    V_1790! = FX##(V_0f10!) - 1.0   '@42010 DS:3310
    V_179c! = FX##(V_0f10!) + 1.0   '@42026 DS:3308
    IF NOT (V_1790! = 0.0) THEN GOTO L_42086   '@4203c DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@42057
L_42086:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_420cf   '@42086
    V_179c! = 1.0   '@420be DS:3308
L_420cf:
    CALL S_21e5d   '@420cf
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f1c$ = ""   '@420d9 DS:3300
    IF NOT (V_16a8# < V_16b0#) THEN GOTO L_42140   '@420eb
    IF NOT (FX##(V_16a8#) + V_0e68_pi# < FX##(V_16b0#)) THEN GOTO L_42138   '@42106
    V_0f1c$ = "NAO"   '@42126 DS:3320
L_42138:
    GOTO L_42177   '@42138
L_42140:
    IF NOT (FX##(V_16b0#) + V_0e68_pi# > FX##(V_16a8#)) THEN GOTO L_42172   '@42140
    V_0f1c$ = "NAO"   '@42160 DS:3320
L_42172:
L_42177:
    IF NOT (A_163a!(RT_CINT%(FX##(V_0f10!)), 2) <> 100.0 AND V_0f1c$ = "NAO") THEN GOTO L_42b3d   '@42177 DS:3320,3328
    V_1790! = V_0f10!   '@421ca
    V_17e0# = A_163a!(RT_CINT%(FX##(V_1790!)), 0)   '@421db
    V_17f0# = A_163a!(RT_CINT%(FX##(V_1790!)), 1)   '@42205
    V_1678# = A_163a!(RT_CINT%(FX##(V_1790!)), 2)   '@42230
    V_1794! = V_1790!   '@42258
L_4226e:
    V_1794! = FX##(V_1794!) + 1.0   '@4226e DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1794!) THEN GOTO L_422cd   '@42284
    V_1794! = 1.0   '@422bc DS:3308
L_422cd:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = A_163a!(RT_CINT%(FX##(V_1790!)), 2) AND (A_163a!(RT_CINT%(FX##(V_1794!)), 1) = A_163a!(RT_CINT%(FX##(V_1790!)), 1) AND A_163a!(RT_CINT%(FX##(V_1794!)), 0) = A_163a!(RT_CINT%(FX##(V_1790!)), 0))) THEN GOTO L_423c6   '@422cd
    GOTO L_423ce   '@423be
L_423c6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4226e   '@423c6
L_423ce:
    V_1798! = V_1790!   '@423ce
L_423e4:
    V_1798! = FX##(V_1798!) + 1.0   '@423e4 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1798!) THEN GOTO L_42443   '@423fa
    V_1798! = 1.0   '@42432 DS:3308
L_42443:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1798!)), 2) <> A_163a!(RT_CINT%(FX##(V_1790!)), 2) OR (A_163a!(RT_CINT%(FX##(V_1798!)), 1) <> A_163a!(RT_CINT%(FX##(V_1790!)), 1) OR A_163a!(RT_CINT%(FX##(V_1798!)), 0) <> A_163a!(RT_CINT%(FX##(V_1790!)), 0))) THEN GOTO L_4253c   '@42443
    GOTO L_42544   '@42534
L_4253c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_423e4   '@4253c
L_42544:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1798!)), 2) <> 100.0) THEN GOTO L_42786   '@42544 DS:3328
    V_17e8# = A_163a!(RT_CINT%(FX##(V_1798!)), 0)   '@42576
    V_17f8# = A_163a!(RT_CINT%(FX##(V_1798!)), 1)   '@425a0
    V_1680# = A_163a!(RT_CINT%(FX##(V_1798!)), 2)   '@425cb
    CALL S_23341   '@425f3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPee% = (V_0f18$ = "")   '@425fd DS:3300,330c
    IF NOT ((RT_POT##((FX##(V_0ef4#) - A_15b0!(RT_CINT%(FX##(V_1790!)))), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_15de!(RT_CINT%(FX##(V_1790!)))), (2.0#)) < RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1790!)), 0)) - A_15b0!(RT_CINT%(FX##(V_1790!)))), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1790!)), 1)) - A_15de!(RT_CINT%(FX##(V_1790!)))), (2.0)) AND L_BPee%) <> 0) THEN GOTO L_42781   '@4265d DS:330c,3334
    A_163a!(RT_CINT%(FX##(V_1790!)), 2) = 100.0   '@42724 DS:3328
    A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0   '@4274c DS:3328
    GOTO L_42b42   '@42774
L_42781:
L_42786:
    V_1798! = V_1790!   '@42786
L_4279c:
    V_1798! = FX##(V_1798!) - 1.0   '@4279c DS:3310
    IF NOT (V_1798! = 0.0) THEN GOTO L_427fc   '@427b2 DS:3304
    V_1798! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@427cd
L_427fc:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1798!)), 2) <> A_163a!(RT_CINT%(FX##(V_1790!)), 2) OR (A_163a!(RT_CINT%(FX##(V_1798!)), 1) <> A_163a!(RT_CINT%(FX##(V_1790!)), 1) OR A_163a!(RT_CINT%(FX##(V_1798!)), 0) <> A_163a!(RT_CINT%(FX##(V_1790!)), 0))) THEN GOTO L_428f5   '@427fc
    GOTO L_428fe   '@428ed
L_428f5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4279c   '@428f5
L_428fe:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1798!)), 2) <> 100.0) THEN GOTO L_42b38   '@428fe DS:3328
    V_17e8# = A_163a!(RT_CINT%(FX##(V_1798!)), 0)   '@42930
    V_17f8# = A_163a!(RT_CINT%(FX##(V_1798!)), 1)   '@4295a
    V_1680# = A_163a!(RT_CINT%(FX##(V_1798!)), 2)   '@42985
    CALL S_23341   '@429ad
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPf0% = (V_0f18$ = "")   '@429b7 DS:3300,330c
    IF NOT ((RT_POT##((FX##(V_0ef4#) - A_15b0!(RT_CINT%(FX##(V_1790!)))), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_15de!(RT_CINT%(FX##(V_1790!)))), (2.0#)) < RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1790!)), 0)) - A_15b0!(RT_CINT%(FX##(V_1790!)))), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1790!)), 1)) - A_15de!(RT_CINT%(FX##(V_1790!)))), (2.0)) AND L_BPf0%) <> 0) THEN GOTO L_42b33   '@42a17 DS:330c,3334
    A_163a!(RT_CINT%(FX##(V_1790!)), 2) = 100.0   '@42ade DS:3328
    A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0   '@42b06 DS:3328
L_42b33:
L_42b38:
L_42b3d:
L_42b42:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@42b47 DS:3308
    L_BPf4! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@42b73
    FOR V_0f10! = 1.0 TO L_BPf4!   '@42ba3 DS:3308
    V_1780! = V_0f10!   '@42baa
    V_1784! = FX##(V_0f10!) - 1.0   '@42bbb DS:3310
    V_1788! = FX##(V_0f10!) + 1.0   '@42bd1 DS:3308
    IF NOT (V_1784! = 0.0) THEN GOTO L_42c31   '@42be7 DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@42c02
L_42c31:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_42c7a   '@42c31
    V_1788! = 1.0   '@42c69 DS:3308
L_42c7a:
    V_16bc! = 1.0   '@42c7a DS:3308
    V_1760! = A_15b0!(RT_CINT%(FX##(V_1780!)))   '@42c8b
    V_1764! = A_15de!(RT_CINT%(FX##(V_1780!)))   '@42cb2
    V_16b8! = A_160c!(0, 0)   '@42cd9
    V_1790! = V_1784!   '@42cf9
    V_1794! = V_1780!   '@42d0a
    V_1798! = V_1780!   '@42d1b
    V_179c! = V_1788!   '@42d2c
L_42d42:
    CALL S_21e5d   '@42d47
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPf8! = FX##(V_16a8#) / 1.0#   '@42d51 DS:3314
    L_BPfc! = FX##(V_16b0#) / 1.0#   '@42d68 DS:3314
    CALL MIXT_082a_Maior(L_BPf8!, L_BPfc!, L_BP100!)   '@42d78
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP104! = FX##(V_16a8#) / 1.0#   '@42d8d DS:3314
    L_BP108! = FX##(V_16b0#) / 1.0#   '@42d9e DS:3314
    CALL MIXT_0877_Menor(L_BP104!, L_BP108!, L_BP10c!)   '@42dae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP100!) - L_BP10c! - V_0e68_pi#) < FX##(V_133e!) AND V_1794! = V_1798!) THEN GOTO L_42e10   '@42dc3
    GOTO L_4888c   '@42e08
L_42e10:
    V_1688# = V_16a0#   '@42e10
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 AND (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1 AND V_16bc! = 1.0)) THEN GOTO L_42eb0   '@42e21 DS:3308
    GOTO L_4888c   '@42ea8
L_42eb0:
    IF NOT ((A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) AND V_16bc! = 1.0) THEN GOTO L_43147   '@42eb0 DS:3308
    GOSUB L_4cca5   '@42f37
    IF NOT (V_0f18$ = "NAO") THEN GOTO L_430fe   '@42f44 DS:3320
    IF NOT (RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_1790!)))) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_1790!)))) - V_0efc#), (2.0#)) < RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_1794!)))) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_1794!)))) - V_0efc#), (2.0#))) THEN GOTO L_4302a   '@42f5b DS:3334
    GOTO L_4888c   '@43022
L_4302a:
    IF NOT (RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_179c!)))) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_179c!)))) - V_0efc#), (2.0#)) < RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_1798!)))) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_1798!)))) - V_0efc#), (2.0#))) THEN GOTO L_430f9   '@4302a DS:3334
    GOTO L_4888c   '@430f1
L_430f9:
L_430fe:
    V_16bc! = 2.0   '@430fe DS:330c
    V_1760! = V_0ef4#   '@4310f
    V_1764! = V_0efc#   '@43120
    V_1688# = V_1670#   '@43131
L_43147:
    V_16c0! = 0.0   '@43147 DS:3304
    V_16c4! = 0.0   '@43158 DS:3304
    L_BP110$ = ""   '@43169 DS:3300
L_43181:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 1) = A_163a!(RT_CINT%(FX##(V_1784!)), 1) AND A_163a!(RT_CINT%(FX##(V_1780!)), 0) = A_163a!(RT_CINT%(FX##(V_1784!)), 0) OR A_163a!(RT_CINT%(FX##(V_1784!)), 2) = 100.0) THEN GOTO L_4369e   '@43186 DS:3328
L_43265:
    V_16c0! = 1.0   '@4326a DS:3308
    V_1790! = FX##(V_1784!) - 1.0   '@4327b DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_432db   '@43291 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@432ac
L_432db:
    V_1794! = V_1784!   '@432db
    V_1798! = V_1784!   '@432ec
    V_179c! = FX##(V_1784!) + 1.0   '@432fd DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_4335c   '@43313
    V_179c! = 1.0   '@4334b DS:3308
L_4335c:
    CALL S_21e5d   '@4335c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP114! = FX##(V_16a8#) / 1.0#   '@43366 DS:3314
    L_BP118! = FX##(V_16b0#) / 1.0#   '@4337d DS:3314
    CALL MIXT_082a_Maior(L_BP114!, L_BP118!, L_BP11c!)   '@4338d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP120! = FX##(V_16a8#) / 1.0#   '@433a2 DS:3314
    L_BP124! = FX##(V_16b0#) / 1.0#   '@433b3 DS:3314
    CALL MIXT_0877_Menor(L_BP120!, L_BP124!, L_BP128!)   '@433c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) <> 1 AND ABS(FX##(L_BP11c!) - L_BP128! - V_0e68_pi#) < FX##(V_133e!) OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1) THEN GOTO L_434d3   '@433d8
    V_1784! = FX##(V_1784!) - 1.0   '@43466 DS:3310
    IF NOT (V_1784! = 0.0) THEN GOTO L_434c6   '@4347c DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@43497
L_434c6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43181   '@434c6
L_434d3:
    V_1750! = A_15b0!(RT_CINT%(FX##(V_1784!)))   '@434d3
    V_1754! = A_15de!(RT_CINT%(FX##(V_1784!)))   '@434fa
    V_1698# = V_16a0#   '@43521
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1) THEN GOTO L_435af   '@43532
    L_BP110$ = "NAO"   '@4359c DS:3320
L_435af:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_43696   '@435af
    GOSUB L_4cca5   '@43619
    V_16c0! = 3.0   '@43626 DS:333c
    V_1750! = V_0ef4#   '@43637
    V_1754! = V_0efc#   '@43648
    V_1698# = V_1670#   '@43659
    V_17a8! = FX##(V_1784!) - V_1794!   '@4366a
    V_1784! = V_1794!   '@43680
L_43696:
    GOTO L_43b1c   '@43696
L_4369e:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4369e DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1784!   '@436d2
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_163a!(RT_CINT%(FX##(V_1784!)), 0)   '@4370e
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_163a!(RT_CINT%(FX##(V_1784!)), 1)   '@4375e
    V_17a8! = V_1784!   '@437b2
L_437c8:
    V_1784! = FX##(V_1784!) - 1.0   '@437cd DS:3310
    IF NOT (V_1784! = 0.0) THEN GOTO L_4382d   '@437e3 DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@437fe
L_4382d:
    IF NOT (V_1784! = V_1780!) THEN GOTO L_43895   '@4382d
    V_1784! = V_17a8!   '@43848
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@43859 DS:3310
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43265   '@4388d
L_43895:
    IF NOT (A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) <> A_163a!(RT_CINT%(FX##(V_1784!)), 1) OR A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) <> A_163a!(RT_CINT%(FX##(V_1784!)), 0)) THEN GOTO L_4395f   '@43895
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_437c8   '@43957
L_4395f:
    V_17a8! = FX##(V_17a8!) - V_1784!   '@4395f
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@43975 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1784!   '@439a9
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_163a!(RT_CINT%(FX##(V_1784!)), 0)   '@439e5
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_163a!(RT_CINT%(FX##(V_1784!)), 1)   '@43a35
    V_1750! = A_163a!(RT_CINT%(FX##(V_1784!)), 0)   '@43a89
    V_1754! = A_163a!(RT_CINT%(FX##(V_1784!)), 1)   '@43ab3
    V_1698# = A_163a!(RT_CINT%(FX##(V_1784!)), 2)   '@43ade
    V_16c0! = 2.0   '@43b06 DS:330c
L_43b1c:
    IF NOT (V_16c4! <> 0.0) THEN GOTO L_43b3f   '@43b1c DS:3304
    GOTO L_444f5   '@43b37
L_43b3f:
    L_BP96$ = ""   '@43b3f DS:3300
L_43b57:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 1) = A_163a!(RT_CINT%(FX##(V_1788!)), 1) AND A_163a!(RT_CINT%(FX##(V_1780!)), 0) = A_163a!(RT_CINT%(FX##(V_1788!)), 0) OR A_163a!(RT_CINT%(FX##(V_1788!)), 2) = 100.0) THEN GOTO L_44073   '@43b5c DS:3328
L_43c3b:
    V_16c4! = 1.0   '@43c40 DS:3308
    V_1790! = FX##(V_1788!) - 1.0   '@43c51 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_43cb1   '@43c67 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@43c82
L_43cb1:
    V_1794! = V_1788!   '@43cb1
    V_1798! = V_1788!   '@43cc2
    V_179c! = FX##(V_1788!) + 1.0   '@43cd3 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_43d32   '@43ce9
    V_179c! = 1.0   '@43d21 DS:3308
L_43d32:
    CALL S_21e5d   '@43d32
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP12c! = FX##(V_16a8#) / 1.0#   '@43d3c DS:3314
    L_BP130! = FX##(V_16b0#) / 1.0#   '@43d53 DS:3314
    CALL MIXT_082a_Maior(L_BP12c!, L_BP130!, L_BP134!)   '@43d63
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP138! = FX##(V_16a8#) / 1.0#   '@43d78 DS:3314
    L_BP13c! = FX##(V_16b0#) / 1.0#   '@43d89 DS:3314
    CALL MIXT_0877_Menor(L_BP138!, L_BP13c!, L_BP140!)   '@43d99
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) <> 1 AND ABS(FX##(L_BP134!) - L_BP140! - V_0e68_pi#) < FX##(V_133e!) OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_43ea8   '@43dae
    V_1788! = FX##(V_1788!) + 1.0   '@43e3c DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_43e9b   '@43e52
    V_1788! = 1.0   '@43e8a DS:3308
L_43e9b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43b57   '@43e9b
L_43ea8:
    V_1758! = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@43ea8
    V_175c! = A_15de!(RT_CINT%(FX##(V_1788!)))   '@43ecf
    V_1690# = V_16a0#   '@43ef6
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1 AND A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1) THEN GOTO L_43f84   '@43f07
    L_BP96$ = "NAO"   '@43f71 DS:3320
L_43f84:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_4406b   '@43f84
    GOSUB L_4cca5   '@43fee
    V_16c4! = 3.0   '@43ffb DS:333c
    V_1758! = V_0ef4#   '@4400c
    V_175c! = V_0efc#   '@4401d
    V_1690# = V_1670#   '@4402e
    V_17ac! = FX##(V_1798!) - V_1788!   '@4403f
    V_1788! = V_1798!   '@44055
L_4406b:
    GOTO L_444f0   '@4406b
L_44073:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@44073 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1788!   '@440a7
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_163a!(RT_CINT%(FX##(V_1788!)), 0)   '@440e3
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_163a!(RT_CINT%(FX##(V_1788!)), 1)   '@44133
    V_17ac! = V_1788!   '@44187
L_4419d:
    V_1788! = FX##(V_1788!) + 1.0   '@441a2 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_44201   '@441b8
    V_1788! = 1.0   '@441f0 DS:3308
L_44201:
    IF NOT (V_1788! = V_1780!) THEN GOTO L_44269   '@44201
    V_1788! = V_17ac!   '@4421c
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@4422d DS:3310
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43c3b   '@44261
L_44269:
    IF NOT (A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) <> A_163a!(RT_CINT%(FX##(V_1788!)), 1) OR A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) <> A_163a!(RT_CINT%(FX##(V_1788!)), 0)) THEN GOTO L_44333   '@44269
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4419d   '@4432b
L_44333:
    V_17ac! = FX##(V_1788!) - V_17ac!   '@44333
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@44349 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1788!   '@4437d
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_163a!(RT_CINT%(FX##(V_1788!)), 0)   '@443b9
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_163a!(RT_CINT%(FX##(V_1788!)), 1)   '@44409
    V_1758! = A_163a!(RT_CINT%(FX##(V_1788!)), 0)   '@4445d
    V_175c! = A_163a!(RT_CINT%(FX##(V_1788!)), 1)   '@44487
    V_1690# = A_163a!(RT_CINT%(FX##(V_1788!)), 2)   '@444b2
    V_16c4! = 2.0   '@444da DS:330c
L_444f0:
L_444f5:
    IF NOT (V_1784! >= V_1788! AND (V_1780! >= V_1788! AND V_1780! <= V_1784!) OR (V_1784! <= V_1788! AND (V_1780! >= V_1788! AND V_1780! >= V_1784!) OR V_1784! <= V_1788! AND (V_1780! <= V_1788! AND V_1780! <= V_1784!))) THEN GOTO L_445fd   '@444fa
    GOTO L_481ea   '@445f5
L_445fd:
    IF NOT (L_BP96$ = "NAO") THEN GOTO L_4461d   '@445fd DS:3320
    GOTO L_452db   '@44615
L_4461d:
    V_17e0# = V_1760!   '@4461d
    V_17f0# = V_1764!   '@4462e
    V_1678# = V_1688#   '@4463f
    V_17e8# = V_1758!   '@44650
    V_17f8# = V_175c!   '@44661
    V_1680# = V_1690#   '@44672
    CALL S_23341   '@44683
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP96$ = V_0f18$   '@4468d
    V_1710# = V_0ef4#   '@446a0
    V_1718# = V_0efc#   '@446b1
    IF NOT (L_BP96$ <> "NAO") THEN GOTO L_452d6   '@446c2 DS:3320
    IF NOT (V_16c4! = 2.0 AND A_163a!(RT_CINT%(FX##(V_1788!)), 2) <> 100.0) THEN GOTO L_44939   '@446da DS:330c,3328
    V_16f0# = V_1760!   '@4472f
    V_16f8# = V_1764!   '@44740
    V_1700# = V_1710#   '@44751
    V_1708# = V_1718#   '@44762
    V_16d0# = V_1758!   '@44773
    V_16d8# = V_175c!   '@44784
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_1788!) - V_17ac!))   '@44795
    V_16e8# = A_15de!(RT_CINT%(FX##(V_1788!) - V_17ac!))   '@447c1
    CALL S_2018c   '@447ed
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_16f8#) - V_1708#) < FX##(V_133a!) AND ABS(FX##(V_16f0#) - V_1700#) < FX##(V_133a!) OR V_0f1c$ = "") THEN GOTO L_448bd   '@447f7 DS:3300
L_44861:
    V_1788! = FX##(V_1788!) - V_17ac!   '@44866
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@4487c DS:3340
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43c3b   '@448b0
L_448bd:
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@448bd
    V_16e8# = A_15de!(RT_CINT%(FX##(V_1788!)))   '@448e4
    CALL S_2018c   '@4490b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_44934   '@44915 DS:3300
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44861   '@4492c
L_44934:
L_44939:
    V_1794! = FX##(V_1788!) + 1.0   '@44939 DS:3308
L_44954:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1794!) THEN GOTO L_4499d   '@44954
    V_1794! = 1.0   '@4498c DS:3308
L_4499d:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 0) <> -100.0 OR A_163a!(RT_CINT%(FX##(V_1794!)), 2) <> 100.0) THEN GOTO L_44a15   '@4499d DS:331c,3328
    GOTO L_44a34   '@44a0d
L_44a15:
    V_1794! = FX##(V_1794!) + 1.0   '@44a15 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44954   '@44a2b
L_44a34:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_44be1   '@44a34 DS:3328
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1794!))) = 1) THEN GOTO L_44aa0   '@44a66
    GOTO L_452db   '@44a98
L_44aa0:
    V_1790! = FX##(V_1794!) - 1.0   '@44aa0 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_44b00   '@44ab6 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@44ad1
L_44b00:
    V_1798! = V_1794!   '@44b00
    V_179c! = FX##(V_1794!) + 1.0   '@44b11 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_44b70   '@44b27
    V_179c! = 1.0   '@44b5f DS:3308
L_44b70:
    CALL S_21e5d   '@44b70
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@44b7a
    V_17f0# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@44ba1
    V_1678# = V_16a0#   '@44bc8
    GOTO L_44c63   '@44bd9
L_44be1:
    V_17e0# = A_163a!(RT_CINT%(FX##(V_1794!)), 0)   '@44be1
    V_17f0# = A_163a!(RT_CINT%(FX##(V_1794!)), 1)   '@44c0b
    V_1678# = A_163a!(RT_CINT%(FX##(V_1794!)), 2)   '@44c36
L_44c63:
    CALL S_23341   '@44c63
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_1758!), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_175c!), (2.0#)) + V_133a! < RT_POT##((FX##(V_1710#) - V_1758!), (2.0#)) + RT_POT##((FX##(V_1718#) - V_175c!), (2.0#))) THEN GOTO L_452d1   '@44c6d DS:3334
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_1710#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1718#), (2.0#)) < RT_POT##((FX##(V_1758!) - V_1710#), (2.0#)) + RT_POT##((FX##(V_175c!) - V_1718#), (2.0#))) THEN GOTO L_452cc   '@44cf0 DS:3334
    V_16d0# = V_0ef4#   '@44d5f
    V_16d8# = V_0efc#   '@44d70
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_44dd1   '@44d81 DS:3328
    V_1794! = FX##(V_1794!) + 1.0   '@44db3 DS:3308
    GOTO L_44f19   '@44dc9
L_44dd1:
    V_1790! = V_1794!   '@44dd1
L_44de8:
    V_1790! = FX##(V_1790!) + 1.0   '@44de8 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1790!) THEN GOTO L_44e47   '@44dfe
    V_1790! = 1.0   '@44e36 DS:3308
L_44e47:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1790!)), 1) = A_163a!(RT_CINT%(FX##(V_1794!)), 1) AND A_163a!(RT_CINT%(FX##(V_1790!)), 0) = A_163a!(RT_CINT%(FX##(V_1794!)), 0)) THEN GOTO L_44f0b   '@44e47
    V_1794! = FX##(V_1790!) + 1.0   '@44eed DS:3308
    GOTO L_44f14   '@44f03
L_44f0b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44de8   '@44f0b
L_44f14:
L_44f19:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1794!) THEN GOTO L_44f62   '@44f19
    V_1794! = 1.0   '@44f51 DS:3308
L_44f62:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_45122   '@44f62 DS:3328
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1794!))) = 1) THEN GOTO L_44fe1   '@44f94
    L_BP96$ = "NAO"   '@44fc6 DS:3320
    GOTO L_452db   '@44fd9
L_44fe1:
    V_1790! = FX##(V_1794!) - 1.0   '@44fe1 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_45041   '@44ff7 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@45012
L_45041:
    V_1798! = V_1794!   '@45041
    V_179c! = FX##(V_1794!) + 1.0   '@45052 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_450b1   '@45068
    V_179c! = 1.0   '@450a0 DS:3308
L_450b1:
    CALL S_21e5d   '@450b1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@450bb
    V_17f8# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@450e2
    V_1680# = V_16a0#   '@45109
    GOTO L_451a4   '@4511a
L_45122:
    V_17e8# = A_163a!(RT_CINT%(FX##(V_1794!)), 0)   '@45122
    V_17f8# = A_163a!(RT_CINT%(FX##(V_1794!)), 1)   '@4514c
    V_1680# = A_163a!(RT_CINT%(FX##(V_1794!)), 2)   '@45177
L_451a4:
    CALL S_23341   '@451a4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_17e0#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_17f0#), (2.0#)) + V_133a! >= RT_POT##((FX##(V_16d0#) - V_17e0#), (2.0#)) + RT_POT##((FX##(V_16d8#) - V_17f0#), (2.0#))) THEN GOTO L_45240   '@451ae DS:3334
    L_BP96$ = "NAO"   '@45225 DS:3320
    GOTO L_452c7   '@45238
L_45240:
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_16d0#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_16d8#), (2.0#)) > RT_POT##((FX##(V_17e0#) - V_16d0#), (2.0#)) + RT_POT##((FX##(V_17f0#) - V_16d8#), (2.0#))) THEN GOTO L_452c2   '@45240 DS:3334
    L_BP96$ = "NAO"   '@452af DS:3320
L_452c2:
L_452c7:
L_452cc:
L_452d1:
L_452d6:
L_452db:
    IF NOT (L_BP110$ = "NAO") THEN GOTO L_45300   '@452e0 DS:3320
    GOTO L_45fe8   '@452f8
L_45300:
    V_17e0# = V_1750!   '@45300
    V_17f0# = V_1754!   '@45311
    V_1678# = V_1698#   '@45322
    V_17e8# = V_1760!   '@45333
    V_17f8# = V_1764!   '@45344
    V_1680# = V_1688#   '@45355
    CALL S_23341   '@45366
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP110$ = V_0f18$   '@45370
    V_1720# = V_0ef4#   '@45383
    V_1728# = V_0efc#   '@45394
    IF NOT (L_BP110$ <> "NAO") THEN GOTO L_45fe3   '@453a5 DS:3320
    IF NOT (V_16c0! = 2.0 AND A_163a!(RT_CINT%(FX##(V_1784!)), 2) <> 100.0) THEN GOTO L_45644   '@453bd DS:330c,3328
    V_16f0# = V_1760!   '@45412
    V_16f8# = V_1764!   '@45423
    V_1700# = V_1720#   '@45434
    V_1708# = V_1728#   '@45445
    V_16d0# = V_1750!   '@45456
    V_16d8# = V_1754!   '@45467
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_1784!) + V_17a8!))   '@45478
    V_16e8# = A_15de!(RT_CINT%(FX##(V_1784!) + V_17a8!))   '@454a4
    CALL S_2018c   '@454d0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_16f8#) - V_1708#) < FX##(V_133a!) AND ABS(FX##(V_16f0#) - V_1700#) < FX##(V_133a!) OR V_0f1c$ = "") THEN GOTO L_455c8   '@454da DS:3300
L_45544:
    V_1784! = FX##(V_1784!) + V_17a8!   '@45549
    IF NOT (V_16c4! = 2.0) THEN GOTO L_45587   '@4555f DS:330c
    GOSUB L_4d55e   '@4557a
L_45587:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@45587 DS:3340
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43265   '@455bb
L_455c8:
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_1784!)))   '@455c8
    V_16e8# = A_15de!(RT_CINT%(FX##(V_1784!)))   '@455ef
    CALL S_2018c   '@45616
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4563f   '@45620 DS:3300
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45544   '@45637
L_4563f:
L_45644:
    V_1794! = FX##(V_1784!) - 1.0   '@45644 DS:3310
L_45660:
    IF NOT (V_1794! = 0.0) THEN GOTO L_456aa   '@45660 DS:3304
    V_1794! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4567b
L_456aa:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 0) <> -100.0 OR A_163a!(RT_CINT%(FX##(V_1794!)), 2) <> 100.0) THEN GOTO L_45722   '@456aa DS:331c,3328
    GOTO L_45740   '@4571a
L_45722:
    V_1794! = FX##(V_1794!) - 1.0   '@45722 DS:3310
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45660   '@45738
L_45740:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_458ed   '@45740 DS:3328
    V_1790! = FX##(V_1794!) - 1.0   '@45772 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_457d2   '@45788 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@457a3
L_457d2:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_4580c   '@457d2
    GOTO L_45fe8   '@45804
L_4580c:
    V_1798! = V_1794!   '@4580c
    V_179c! = FX##(V_1794!) + 1.0   '@4581d DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_4587c   '@45833
    V_179c! = 1.0   '@4586b DS:3308
L_4587c:
    CALL S_21e5d   '@4587c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@45886
    V_17f8# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@458ad
    V_1680# = V_16a0#   '@458d4
    GOTO L_4596f   '@458e5
L_458ed:
    V_17e8# = A_163a!(RT_CINT%(FX##(V_1794!)), 0)   '@458ed
    V_17f8# = A_163a!(RT_CINT%(FX##(V_1794!)), 1)   '@45917
    V_1680# = A_163a!(RT_CINT%(FX##(V_1794!)), 2)   '@45942
L_4596f:
    CALL S_23341   '@4596f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_1750!), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1754!), (2.0#)) + V_133a! < RT_POT##((FX##(V_1720#) - V_1750!), (2.0#)) + RT_POT##((FX##(V_1728#) - V_1754!), (2.0#))) THEN GOTO L_45fde   '@45979 DS:3334
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_1720#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1728#), (2.0#)) < RT_POT##((FX##(V_1750!) - V_1720#), (2.0#)) + RT_POT##((FX##(V_1754!) - V_1728#), (2.0#))) THEN GOTO L_45fd9   '@459fc DS:3334
    V_16d0# = V_0ef4#   '@45a6b
    V_16d8# = V_0efc#   '@45a7c
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_45add   '@45a8d DS:3328
    V_1794! = FX##(V_1794!) - 1.0   '@45abf DS:3310
    GOTO L_45c25   '@45ad5
L_45add:
    V_1790! = V_1794!   '@45add
L_45af4:
    V_1790! = FX##(V_1790!) - 1.0   '@45af4 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_45b54   '@45b0a DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@45b25
L_45b54:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1790!)), 1) = A_163a!(RT_CINT%(FX##(V_1794!)), 1) AND A_163a!(RT_CINT%(FX##(V_1790!)), 0) = A_163a!(RT_CINT%(FX##(V_1794!)), 0)) THEN GOTO L_45c18   '@45b54
    V_1794! = FX##(V_1790!) - 1.0   '@45bfa DS:3310
    GOTO L_45c20   '@45c10
L_45c18:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45af4   '@45c18
L_45c20:
L_45c25:
    IF NOT (V_1794! = 0.0) THEN GOTO L_45c6f   '@45c25 DS:3304
    V_1794! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@45c40
L_45c6f:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1794!)), 2) = 100.0) THEN GOTO L_45e2f   '@45c6f DS:3328
    V_1790! = FX##(V_1794!) - 1.0   '@45ca1 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_45d01   '@45cb7 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@45cd2
L_45d01:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_45d4e   '@45d01
    L_BP110$ = "NAO"   '@45d33 DS:3320
    GOTO L_45fe8   '@45d46
L_45d4e:
    V_1798! = V_1794!   '@45d4e
    V_179c! = FX##(V_1794!) + 1.0   '@45d5f DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_45dbe   '@45d75
    V_179c! = 1.0   '@45dad DS:3308
L_45dbe:
    CALL S_21e5d   '@45dbe
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@45dc8
    V_17f0# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@45def
    V_1678# = V_16a0#   '@45e16
    GOTO L_45eb1   '@45e27
L_45e2f:
    V_17e0# = A_163a!(RT_CINT%(FX##(V_1794!)), 0)   '@45e2f
    V_17f0# = A_163a!(RT_CINT%(FX##(V_1794!)), 1)   '@45e59
    V_1678# = A_163a!(RT_CINT%(FX##(V_1794!)), 2)   '@45e84
L_45eb1:
    CALL S_23341   '@45eb1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_17e8#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_17f8#), (2.0#)) + V_133a! >= RT_POT##((FX##(V_16d0#) - V_17e8#), (2.0#)) + RT_POT##((FX##(V_16d8#) - V_17f8#), (2.0#))) THEN GOTO L_45f4d   '@45ebb DS:3334
    L_BP110$ = "NAO"   '@45f32 DS:3320
    GOTO L_45fd4   '@45f45
L_45f4d:
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_16d0#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_16d8#), (2.0#)) > RT_POT##((FX##(V_17e8#) - V_16d0#), (2.0#)) + RT_POT##((FX##(V_17f8#) - V_16d8#), (2.0#))) THEN GOTO L_45fcf   '@45f4d DS:3334
    L_BP110$ = "NAO"   '@45fbc DS:3320
L_45fcf:
L_45fd4:
L_45fd9:
L_45fde:
L_45fe3:
L_45fe8:
    L_BP142% = (L_BP110$ = "NAO")   '@45fed DS:3320
    IF NOT ((L_BP96$ = "NAO" AND L_BP142%) <> 0) THEN GOTO L_46033   '@46015 DS:3320
    GOTO L_481ea   '@4602b
L_46033:
    IF NOT (A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1 AND V_16bc! = 1.0) THEN GOTO L_4630d   '@46033 DS:3308
    V_1778! = 1.0   '@4608a DS:3308
L_460a0:
    IF NOT (A_160c!(RT_CINT%(FX##(V_1778!)), 0) = -V_1780!) THEN GOTO L_46296   '@460a0
    L_BP144% = (RT_POT##((FX##(V_1710#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1718#) - V_1764!), (2.0#)) + V_133a! >= RT_POT##((FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 2)) - V_1760!), (2.0)) + RT_POT##((FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 3)) - V_1764!), (2.0)))   '@460d7 DS:330c,3334
    IF NOT ((L_BP96$ = "NAO" OR L_BP144%) <> 0) THEN GOTO L_46291   '@46195 DS:3320
    L_BP146% = (RT_POT##((FX##(V_1720#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1728#) - V_1764!), (2.0#)) + V_133a! >= RT_POT##((FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 2)) - V_1760!), (2.0)) + RT_POT##((FX##(A_160c!(RT_CINT%(FX##(V_1778!)), 3)) - V_1764!), (2.0)))   '@461ab DS:330c,3334
    IF NOT ((L_BP110$ = "NAO" OR L_BP146%) <> 0) THEN GOTO L_4628c   '@46269 DS:3320
    GOTO L_462d6   '@4627f
L_4628c:
L_46291:
L_46296:
    V_1778! = FX##(V_1778!) + 1.0   '@46296 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_1778!) THEN GOTO L_460a0   '@462ac
L_462d6:
    IF NOT (A_160c!(0, 0) >= V_1778!) THEN GOTO L_46308   '@462d6
    GOTO L_4888c   '@46300
L_46308:
L_4630d:
    L_BP148% = (ABS(FX##(V_1718#) - V_1728#) < FX##(V_133a!) AND ABS(FX##(V_1710#) - V_1720#) < FX##(V_133a!))   '@4630d
    L_BP14a% = L_BP110$ <> "NAO" AND L_BP148%   '@46363 DS:3320
    IF NOT ((L_BP96$ <> "NAO" AND L_BP14a%) <> 0) THEN GOTO L_46af2   '@46381 DS:3320
    V_16f0# = V_1758!   '@46397
    V_16f8# = V_175c!   '@463a8
    V_1700# = V_1710#   '@463b9
    V_1708# = V_1718#   '@463ca
    CALL S_23948   '@463db
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_46404   '@463e5 DS:3300
    GOTO L_4888c   '@463fc
L_46404:
    V_16f0# = V_1750!   '@46404
    V_16f8# = V_1754!   '@46415
    V_1700# = V_1710#   '@46426
    V_1708# = V_1718#   '@46437
    CALL S_23948   '@46448
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_46471   '@46452 DS:3300
    GOTO L_4888c   '@46469
L_46471:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@46471 DS:3308
    IF NOT (V_16c4! = 1.0) THEN GOTO L_46530   '@464a5 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1788!   '@464c0
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1788!))) = 1   '@464fc
    GOTO L_465a8   '@46528
L_46530:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1758!   '@46530
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_175c!   '@46569
L_465a8:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1710#   '@465a8
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1718#   '@465df
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@46619 DS:3308
    IF NOT (V_16c0! = 1.0) THEN GOTO L_466d8   '@4664d DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1784!   '@46668
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1784!))) = 1   '@466a4
    GOTO L_46750   '@466d0
L_466d8:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1750!   '@466d8
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1754!   '@46711
L_46750:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1710#   '@46750
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1718#   '@46787
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@467c1 DS:3308
    IF NOT (V_16bc! = 1.0) THEN GOTO L_46891   '@467f5 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1780!   '@46810
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1   '@4684c
    V_16bc! = 2.0   '@46878 DS:330c
    GOTO L_46909   '@46889
L_46891:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1760!   '@46891
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1764!   '@468ca
L_46909:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1710#   '@46909
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1718#   '@46940
    V_1760! = V_1710#   '@4697a
    V_1764! = V_1718#   '@4698b
    V_1794! = V_1784!   '@4699c
    V_1784! = FX##(V_1784!) - 1.0   '@469ad DS:3310
    IF NOT (V_1784! = 0.0) THEN GOTO L_46a0d   '@469c3 DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@469de
L_46a0d:
    V_1790! = V_1784!   '@46a0d
    IF NOT (V_1788! = V_1784!) THEN GOTO L_46a41   '@46a1e
    GOTO L_4888c   '@46a39
L_46a41:
    V_1798! = V_1788!   '@46a41
    V_1788! = FX##(V_1788!) + 1.0   '@46a52 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_46ab1   '@46a68
    V_1788! = 1.0   '@46aa0 DS:3308
L_46ab1:
    V_179c! = V_1788!   '@46ab1
    IF NOT (V_1788! = V_1784!) THEN GOTO L_46ae5   '@46ac2
    GOTO L_4888c   '@46add
L_46ae5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42d42   '@46ae5
L_46af2:
L_46af7:
    L_BP14c% = (L_BP96$ <> "NAO")   '@46afc DS:3320,3334
    L_BP14e% = (RT_POT##((FX##(V_1710#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1718#) - V_1764!), (2.0#)) <= RT_POT##((FX##(V_1720#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1728#) - V_1764!), (2.0#)))   '@46b2d DS:3334
    IF NOT (((L_BP110$ = "NAO" OR L_BP14e%) AND L_BP14c%) <> 0) THEN GOTO L_47681   '@46b9f DS:3320
    IF NOT (ABS(FX##(V_1764!) - V_1718#) < FX##(V_133a!) AND ABS(FX##(V_1760!) - V_1710#) < FX##(V_133a!)) THEN GOTO L_46c0f   '@46bb9
    GOTO L_46d9e   '@46c07
L_46c0f:
    V_16f0# = V_1760!   '@46c0f
    V_16f8# = V_1764!   '@46c20
    V_1700# = V_1710#   '@46c31
    V_1708# = V_1718#   '@46c42
    CALL S_23948   '@46c53
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP150% = (V_0f1c$ = "")   '@46c5d DS:3300
    IF NOT ((L_BP110$ <> "NAO" AND L_BP150%) <> 0) THEN GOTO L_46cb5   '@46c84 DS:3320
    L_BP96$ = "NAO"   '@46c9a DS:3320
    GOTO L_47686   '@46cad
L_46cb5:
    IF NOT (V_0f1c$ = "") THEN GOTO L_46cd4   '@46cb5 DS:3300
    GOTO L_4888c   '@46ccc
L_46cd4:
    V_16f0# = V_1758!   '@46cd4
    V_16f8# = V_175c!   '@46ce5
    V_1700# = V_1710#   '@46cf6
    V_1708# = V_1718#   '@46d07
    CALL S_23948   '@46d18
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP152% = (V_0f1c$ = "")   '@46d22 DS:3300
    IF NOT ((L_BP110$ <> "NAO" AND L_BP152%) <> 0) THEN GOTO L_46d7a   '@46d49 DS:3320
    L_BP96$ = "NAO"   '@46d5f DS:3320
    GOTO L_47686   '@46d72
L_46d7a:
    IF NOT (V_0f1c$ = "") THEN GOTO L_46d99   '@46d7a DS:3300
    GOTO L_4888c   '@46d91
L_46d99:
L_46d9e:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1784!)), 2) <> 100.0 AND V_16c0! <> 1.0) THEN GOTO L_46e5b   '@46da3 DS:3308,3328
    IF NOT (V_16c4! = 2.0) THEN GOTO L_46e22   '@46dfa DS:330c
    GOSUB L_4d55e   '@46e15
L_46e22:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@46e22 DS:3340
L_46e5b:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 2) <> 100.0 AND V_16bc! = 1.0) THEN GOTO L_47130   '@46e5b DS:3308,3328
    IF NOT (RT_POT##((FX##(V_1710#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1718#) - V_1764!), (2.0#)) + V_133a! < RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 0)) - V_1760!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 1)) - V_1764!), (2.0))) THEN GOTO L_4712b   '@46eb2 DS:330c,3334
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = 100.0   '@46f62 DS:3328
    IF NOT (A_163a!(RT_CINT%(FX##(V_1784!)), 1) = A_163a!(RT_CINT%(FX##(V_1780!)), 1) AND A_163a!(RT_CINT%(FX##(V_1784!)), 0) = A_163a!(RT_CINT%(FX##(V_1780!)), 0)) THEN GOTO L_47058   '@46f8a
    A_163a!(RT_CINT%(FX##(V_1784!)), 2) = 100.0   '@47030 DS:3328
L_47058:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 1) = A_163a!(RT_CINT%(FX##(V_1780!)), 1) AND A_163a!(RT_CINT%(FX##(V_1788!)), 0) = A_163a!(RT_CINT%(FX##(V_1780!)), 0)) THEN GOTO L_47126   '@47058
    A_163a!(RT_CINT%(FX##(V_1788!)), 2) = 100.0   '@470fe DS:3328
L_47126:
L_4712b:
L_47130:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@47130 DS:3308
    IF NOT (V_16c4! = 1.0) THEN GOTO L_471ef   '@47164 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1788!   '@4717f
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1788!))) = 1   '@471bb
    GOTO L_47267   '@471e7
L_471ef:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1758!   '@471ef
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_175c!   '@47228
L_47267:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1710#   '@47267
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1718#   '@4729e
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@472d8 DS:3308
    IF NOT (V_16bc! = 1.0) THEN GOTO L_473a8   '@4730c DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1780!   '@47327
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1   '@47363
    V_16bc! = 2.0   '@4738f DS:330c
    GOTO L_47420   '@473a0
L_473a8:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1760!   '@473a8
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1764!   '@473e1
L_47420:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1710#   '@47420
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1718#   '@47457
    IF NOT (FX##(V_1764!) = FX##(V_1718#) AND FX##(V_1760!) = FX##(V_1710#)) THEN GOTO L_47503   '@47491
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@474cf DS:3310
L_47503:
    V_1760! = V_1710#   '@47503
    V_1764! = V_1718#   '@47514
    IF NOT (V_16c0! <> 1.0) THEN GOTO L_47556   '@47525 DS:3308
    V_1784! = FX##(V_1784!) + V_17a8!   '@47540
L_47556:
    V_1790! = V_1784!   '@47560
    V_1794! = FX##(V_1784!) + 1.0   '@47571 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1794!) THEN GOTO L_475d0   '@47587
    V_1794! = 1.0   '@475bf DS:3308
L_475d0:
    V_1798! = V_1788!   '@475d0
    V_1788! = FX##(V_1788!) + 1.0   '@475e1 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_47640   '@475f7
    V_1788! = 1.0   '@4762f DS:3308
L_47640:
    V_179c! = V_1788!   '@47640
    IF NOT (V_1788! = V_1784!) THEN GOTO L_47674   '@47651
    GOTO L_4888c   '@4766c
L_47674:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42d42   '@47674
L_47681:
L_47686:
    L_BP154% = (L_BP110$ <> "NAO")   '@4768b DS:3320,3334
    L_BP156% = (RT_POT##((FX##(V_1710#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1718#) - V_1764!), (2.0#)) > RT_POT##((FX##(V_1720#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1728#) - V_1764!), (2.0#)))   '@476bc DS:3334
    IF NOT (((L_BP96$ = "NAO" OR L_BP156%) AND L_BP154%) <> 0) THEN GOTO L_481e5   '@4772e DS:3320
    IF NOT (ABS(FX##(V_1764!) - V_1728#) < FX##(V_133a!) AND ABS(FX##(V_1760!) - V_1720#) < FX##(V_133a!)) THEN GOTO L_4779e   '@47748
    GOTO L_4792d   '@47796
L_4779e:
    V_16f0# = V_1760!   '@4779e
    V_16f8# = V_1764!   '@477af
    V_1700# = V_1720#   '@477c0
    V_1708# = V_1728#   '@477d1
    CALL S_23948   '@477e2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP158% = (V_0f1c$ = "")   '@477ec DS:3300
    IF NOT ((L_BP96$ <> "NAO" AND L_BP158%) <> 0) THEN GOTO L_47844   '@47813 DS:3320
    L_BP110$ = "NAO"   '@47829 DS:3320
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46af7   '@4783c
L_47844:
    IF NOT (V_0f1c$ = "") THEN GOTO L_47863   '@47844 DS:3300
    GOTO L_4888c   '@4785b
L_47863:
    V_16f0# = V_1750!   '@47863
    V_16f8# = V_1754!   '@47874
    V_1700# = V_1720#   '@47885
    V_1708# = V_1728#   '@47896
    CALL S_23948   '@478a7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP15a% = (V_0f1c$ = "")   '@478b1 DS:3300
    IF NOT ((L_BP96$ <> "NAO" AND L_BP15a%) <> 0) THEN GOTO L_47909   '@478d8 DS:3320
    L_BP110$ = "NAO"   '@478ee DS:3320
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46af7   '@47901
L_47909:
    IF NOT (V_0f1c$ = "") THEN GOTO L_47928   '@47909 DS:3300
    GOTO L_4888c   '@47920
L_47928:
L_4792d:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 2) <> 100.0 AND V_16c4! <> 1.0) THEN GOTO L_479bd   '@47932 DS:3308,3328
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@47989 DS:3340
L_479bd:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1780!)), 2) <> 100.0 AND V_16bc! = 1.0) THEN GOTO L_47c92   '@479bd DS:3308,3328
    IF NOT (RT_POT##((FX##(V_1720#) - V_1760!), (2.0#)) + RT_POT##((FX##(V_1728#) - V_1764!), (2.0#)) + V_133a! < RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 0)) - V_1760!), (2.0)) + RT_POT##((FX##(A_163a!(RT_CINT%(FX##(V_1780!)), 1)) - V_1764!), (2.0))) THEN GOTO L_47c8d   '@47a14 DS:330c,3334
    A_163a!(RT_CINT%(FX##(V_1780!)), 2) = 100.0   '@47ac4 DS:3328
    IF NOT (A_163a!(RT_CINT%(FX##(V_1784!)), 1) = A_163a!(RT_CINT%(FX##(V_1780!)), 1) AND A_163a!(RT_CINT%(FX##(V_1784!)), 0) = A_163a!(RT_CINT%(FX##(V_1780!)), 0)) THEN GOTO L_47bba   '@47aec
    A_163a!(RT_CINT%(FX##(V_1784!)), 2) = 100.0   '@47b92 DS:3328
L_47bba:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 1) = A_163a!(RT_CINT%(FX##(V_1780!)), 1) AND A_163a!(RT_CINT%(FX##(V_1788!)), 0) = A_163a!(RT_CINT%(FX##(V_1780!)), 0)) THEN GOTO L_47c88   '@47bba
    A_163a!(RT_CINT%(FX##(V_1788!)), 2) = 100.0   '@47c60 DS:3328
L_47c88:
L_47c8d:
L_47c92:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@47c92 DS:3308
    IF NOT (V_16c0! = 1.0) THEN GOTO L_47d51   '@47cc6 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1784!   '@47ce1
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1784!))) = 1   '@47d1d
    GOTO L_47dc9   '@47d49
L_47d51:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1750!   '@47d51
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1754!   '@47d8a
L_47dc9:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1720#   '@47dc9
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1728#   '@47e00
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@47e3a DS:3308
    IF NOT (V_16bc! = 1.0) THEN GOTO L_47f0a   '@47e6e DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1780!   '@47e89
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1   '@47ec5
    V_16bc! = 2.0   '@47ef1 DS:330c
    GOTO L_47f82   '@47f02
L_47f0a:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1760!   '@47f0a
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1764!   '@47f43
L_47f82:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1720#   '@47f82
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1728#   '@47fb9
    IF NOT (FX##(V_1764!) = FX##(V_1728#) AND FX##(V_1760!) = FX##(V_1720#)) THEN GOTO L_48065   '@47ff3
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@48031 DS:3310
L_48065:
    V_1760! = V_1720#   '@48065
    V_1764! = V_1728#   '@48076
    IF NOT (V_16c4! <> 1.0) THEN GOTO L_480b8   '@48087 DS:3308
    V_1788! = FX##(V_1788!) - V_17ac!   '@480a2
L_480b8:
    V_1794! = V_1784!   '@480c2
    V_1784! = FX##(V_1784!) - 1.0   '@480d3 DS:3310
    IF NOT (V_1784! = 0.0) THEN GOTO L_48133   '@480e9 DS:3304
    V_1784! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@48104
L_48133:
    V_1790! = V_1784!   '@48133
    V_1798! = FX##(V_1788!) - 1.0   '@48144 DS:3310
    IF NOT (V_1798! = 0.0) THEN GOTO L_481a4   '@4815a DS:3304
    V_1798! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@48175
L_481a4:
    V_179c! = V_1788!   '@481a4
    IF NOT (V_1788! = V_1784!) THEN GOTO L_481d8   '@481b5
    GOTO L_4888c   '@481d0
L_481d8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42d42   '@481d8
L_481e5:
L_481ea:
    IF NOT (V_16c0! <> 1.0) THEN GOTO L_48220   '@481ef DS:3308
    V_1784! = FX##(V_1784!) + V_17a8!   '@4820a
L_48220:
    IF NOT (V_16c4! <> 1.0) THEN GOTO L_48251   '@48220 DS:3308
    V_1788! = FX##(V_1788!) - V_17ac!   '@4823b
L_48251:
    IF NOT (V_16c0! = 2.0) THEN GOTO L_482a0   '@48251 DS:330c
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@4826c DS:3340
L_482a0:
    IF NOT (V_16c4! = 2.0) THEN GOTO L_482ef   '@482a0 DS:330c
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 2.0   '@482bb DS:3340
L_482ef:
    IF NOT (V_1780! = V_1788! OR (V_1780! = V_1784! OR (V_1784! >= V_1788! AND (V_1780! > V_1788! AND V_1780! < V_1784!) OR (V_1784! <= V_1788! AND (V_1780! > V_1788! AND V_1780! > V_1784!) OR V_1784! <= V_1788! AND (V_1780! < V_1788! AND V_1780! < V_1784!))))) THEN GOTO L_48428   '@482ef
    GOTO L_4888c   '@48420
L_48428:
    V_0f18$ = ""   '@48428 DS:3300
    V_1790! = V_1788!   '@4843a
L_48450:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) <> 1) THEN GOTO L_48494   '@48450
    V_0f18$ = "*"   '@48482 DS:3344
L_48494:
    IF NOT (V_0f18$ = "*") THEN GOTO L_484b3   '@48494 DS:3344
    GOTO L_4852e   '@484ab
L_484b3:
    V_1790! = FX##(V_1790!) + 1.0   '@484b3 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1790!) THEN GOTO L_48512   '@484c9
    V_1790! = 1.0   '@48501 DS:3308
L_48512:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_1790! = V_1784!) THEN GOTO L_48450   '@48512
L_4852e:
    IF NOT (V_0f18$ = "") THEN GOTO L_48784   '@4852e DS:3300
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@48545 DS:3308
    IF NOT (V_16bc! = 1.0) THEN GOTO L_48615   '@48579 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_1780!   '@48594
    A_1342%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1780!))) = 1   '@485d0
    V_16bc! = 2.0   '@485fc DS:330c
    GOTO L_4868d   '@4860d
L_48615:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_1760!   '@48615
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_1764!   '@4864e
L_4868d:
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1760! + RT_COS##(FX##(V_1688#)) * -(ABS(RT_COS##(FX##(V_1688#))) > FX##(V_133e!)) * 1000.0#   '@4868d DS:334a
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1764! + RT_SIN##(FX##(V_1688#)) * -(ABS(RT_SIN##(FX##(V_1688#))) > FX##(V_133e!)) * 1000.0#   '@48703 DS:334a
    GOTO L_48887   '@4877c
L_48784:
    IF NOT (V_16bc! > 1.0) THEN GOTO L_48882   '@48784 DS:3308
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) + 1.0   '@4879f DS:3308
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0) = V_1760!   '@487d3
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1) = V_1764!   '@4880c
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2) = V_1688#   '@48846
L_48882:
L_48887:
L_4888c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@48891 DS:3308
    V_16cc! = -1.0   '@488bd DS:3310
    V_0ef0! = 1.0   '@488ce DS:3308
L_488e4:
    V_1790! = FX##(V_0ef0!) - 1.0   '@488e4 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_48944   '@488fa DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@48915
L_48944:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_48efa   '@48944 DS:3304
    V_1790! = ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))   '@48978
    V_1794! = ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0))) - 1.0   '@489a5 DS:3310
    IF NOT (V_1794! = 0.0) THEN GOTO L_48a21   '@489d7 DS:3304
    V_1794! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@489f2
L_48a21:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1794!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_48a93   '@48a21
    GOTO L_48eff   '@48a8b
L_48a93:
L_48a98:
    IF NOT (A_160c!(0, 0) <= V_0ef0!) THEN GOTO L_48acf   '@48a9d
    GOTO L_48f44   '@48ac7
L_48acf:
    V_0f14! = FX##(V_0ef0!) + 1.0   '@48acf DS:3308
L_48aea:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0f14!)), 0) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)) THEN GOTO L_48e92   '@48aea
    V_0ef4# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@48b37
    V_0efc# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@48b7a
    V_17e0# = RT_POT##((FX##(V_0ef4#) - A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)), (2.0#))   '@48bbd DS:3334
    V_17f0# = RT_POT##((FX##(V_0ef4#) - A_160c!(RT_CINT%(FX##(V_0f14!)), 2)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_160c!(RT_CINT%(FX##(V_0f14!)), 3)), (2.0#))   '@48c2f DS:3334
    IF NOT (V_17e0# > V_17f0#) THEN GOTO L_48d4a   '@48ca1
    FOR V_1778! = 0.0 TO 3.0   '@48cbc DS:3304,3308,333c
    SWAP A_160c!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_1778!))), A_160c!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_1778!)))   '@48cca
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@48d1c DS:3308,333c
L_48d4a:
    L_BP162# = FX##(A_160c!(0, 0)) - 1.0   '@48d4a DS:3310
    FOR V_0ef4# = V_0f14! TO L_BP162#   '@48d70 DS:3314
    FOR V_0efc# = 0.0# TO 3.0#   '@48d78 DS:3314,332c,3352
    A_160c!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_160c!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@48d86 DS:3314
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@48dde DS:3314,3352
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@48e0a DS:3314
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@48e36 DS:3310
    V_0f14! = 0.0   '@48e6a DS:3304
    GOTO L_48ed2   '@48e7b
L_48e92:
    V_0f14! = FX##(V_0f14!) + 1.0   '@48e92 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0f14!) THEN GOTO L_48aea   '@48ea8
L_48ed2:
    IF NOT (V_0f14! = 0.0) THEN GOTO L_48ef5   '@48ed2 DS:3304
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48a98   '@48eed
L_48ef5:
L_48efa:
L_48eff:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@48f04 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) <= V_0ef0!) THEN GOTO L_488e4   '@48f1a
L_48f44:
    V_0ef0! = 1.0   '@48f44 DS:3308
L_48f5a:
    V_16f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@48f5a
    V_16f8# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@48f84
    V_1700# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@48faf
    V_1708# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@48fd7
    IF NOT (ABS(FX##(V_16f0#) - V_1700#) < FX##(V_133a!)) THEN GOTO L_49077   '@49002
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 2) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@49025
    V_1700# = V_16f0#   '@49066
L_49077:
    IF NOT (ABS(FX##(V_16f8#) - V_1708#) < FX##(V_133a!)) THEN GOTO L_490f0   '@49077
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 3) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4909a
    V_1708# = V_16f8#   '@490df
L_490f0:
    V_0f14! = FX##(V_0ef0!) + 1.0   '@490f0 DS:3308
L_4910c:
    IF NOT (A_160c!(0, 0) >= V_0f14!) THEN GOTO L_49528   '@4910d
    V_16d0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 0)   '@49131
    V_16d8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 1)   '@4915b
    V_16e0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 2)   '@49186
    V_16e8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 3)   '@491ae
    IF NOT (ABS(FX##(V_16f0#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_4923f   '@491d9
    A_160c!(RT_CINT%(FX##(V_0f14!)), 0) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@491fc
L_4923f:
    IF NOT (ABS(FX##(V_16f0#) - V_16e0#) < FX##(V_133a!)) THEN GOTO L_492a3   '@4923f
    A_160c!(RT_CINT%(FX##(V_0f14!)), 2) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@49262
L_492a3:
    IF NOT (ABS(FX##(V_1700#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_49307   '@492a3
    A_160c!(RT_CINT%(FX##(V_0f14!)), 0) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@492c6
L_49307:
    IF NOT (ABS(FX##(V_1700#) - V_16e0#) < FX##(V_133a!)) THEN GOTO L_49369   '@49307
    A_160c!(RT_CINT%(FX##(V_0f14!)), 2) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4932a
L_49369:
    IF NOT (ABS(FX##(V_16f8#) - V_16d8#) < FX##(V_133a!)) THEN GOTO L_493d1   '@49369
    A_160c!(RT_CINT%(FX##(V_0f14!)), 1) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4938c
L_493d1:
    IF NOT (ABS(FX##(V_16f8#) - V_16e8#) < FX##(V_133a!)) THEN GOTO L_49439   '@493d1
    A_160c!(RT_CINT%(FX##(V_0f14!)), 3) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@493f4
L_49439:
    IF NOT (ABS(FX##(V_1708#) - V_16d8#) < FX##(V_133a!)) THEN GOTO L_494a1   '@49439
    A_160c!(RT_CINT%(FX##(V_0f14!)), 1) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4945c
L_494a1:
    IF NOT (ABS(FX##(V_1708#) - V_16e8#) < FX##(V_133a!)) THEN GOTO L_49509   '@494a1
    A_160c!(RT_CINT%(FX##(V_0f14!)), 3) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@494c4
L_49509:
    V_0f14! = FX##(V_0f14!) + 1.0   '@49509 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4910c   '@4951f
L_49528:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@49528 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_48f5a   '@4953e
L_4956d:
    V_0ef0! = 1.0   '@49572 DS:3308
L_49588:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_49619   '@49588 DS:3304
    V_16f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@495bc
    V_16f8# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@495e6
    GOTO L_496a4   '@49611
L_49619:
    V_16f0# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@49619
    V_16f8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@4965c
L_496a4:
    V_1700# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@496a4
    V_1708# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@496cc
    V_0f14! = FX##(V_0ef0!) + 1.0   '@496f7 DS:3308
L_49712:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_497a3   '@49712 DS:3304
    V_16d0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 0)   '@49746
    V_16d8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 1)   '@49770
    GOTO L_498bc   '@4979b
L_497a3:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_49831   '@497a3 DS:3304
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) <> A_160c!(RT_CINT%(FX##(V_0f14!)), 0)) THEN GOTO L_4982c   '@497d7
    GOTO L_4a70c   '@49824
L_4982c:
L_49831:
    V_16d0# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@49831
    V_16d8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@49874
L_498bc:
    V_16e0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 2)   '@498bc
    V_16e8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 3)   '@498e4
    L_BP166! = FX##(V_16f0#) / 1.0#   '@4990f DS:3314
    L_BP16a! = FX##(V_1700#) / 1.0#   '@49926 DS:3314
    CALL MIXT_082a_Maior(L_BP166!, L_BP16a!, L_BP16e!)   '@49936
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP172! = FX##(V_16d0#) / 1.0#   '@4994b DS:3314
    L_BP176! = FX##(V_16e0#) / 1.0#   '@4995c DS:3314
    CALL MIXT_0877_Menor(L_BP172!, L_BP176!, L_BP17a!)   '@4996c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP17e! = FX##(V_16f0#) / 1.0#   '@49981 DS:3314
    L_BP182! = FX##(V_1700#) / 1.0#   '@49992 DS:3314
    CALL MIXT_0877_Menor(L_BP17e!, L_BP182!, L_BP186!)   '@499a2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP18a! = FX##(V_16d0#) / 1.0#   '@499b7 DS:3314
    L_BP18e! = FX##(V_16e0#) / 1.0#   '@499c8 DS:3314
    CALL MIXT_082a_Maior(L_BP18a!, L_BP18e!, L_BP192!)   '@499d8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP186! > L_BP192! OR L_BP16e! < L_BP17a!) THEN GOTO L_49a2d   '@499ed
    GOTO L_4a70c   '@49a25
L_49a2d:
    L_BP196! = FX##(V_16f8#) / 1.0#   '@49a2d DS:3314
    L_BP19a! = FX##(V_1708#) / 1.0#   '@49a44 DS:3314
    CALL MIXT_082a_Maior(L_BP196!, L_BP19a!, L_BP19e!)   '@49a54
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a2! = FX##(V_16d8#) / 1.0#   '@49a69 DS:3314
    L_BP1a6! = FX##(V_16e8#) / 1.0#   '@49a7a DS:3314
    CALL MIXT_0877_Menor(L_BP1a2!, L_BP1a6!, L_BP1aa!)   '@49a8a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ae! = FX##(V_16f8#) / 1.0#   '@49a9f DS:3314
    L_BP1b2! = FX##(V_1708#) / 1.0#   '@49ab0 DS:3314
    CALL MIXT_0877_Menor(L_BP1ae!, L_BP1b2!, L_BP1b6!)   '@49ac0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ba! = FX##(V_16d8#) / 1.0#   '@49ad5 DS:3314
    L_BP1be! = FX##(V_16e8#) / 1.0#   '@49ae6 DS:3314
    CALL MIXT_082a_Maior(L_BP1ba!, L_BP1be!, L_BP1c2!)   '@49af6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1b6! > L_BP1c2! OR L_BP19e! < L_BP1aa!) THEN GOTO L_49b4b   '@49b0b
    GOTO L_4a70c   '@49b43
L_49b4b:
    IF NOT (V_16f0# <> V_1700# AND V_16d0# = V_16e0# OR V_16d0# <> V_16e0# AND V_16f0# = V_1700#) THEN GOTO L_49bc7   '@49b4b
    GOTO L_4a70c   '@49bbf
L_49bc7:
    IF NOT (V_16f0# <> V_16e0# AND (V_16d0# = V_16e0# AND V_16f0# = V_1700#)) THEN GOTO L_49c28   '@49bc7
    GOTO L_4a70c   '@49c20
L_49c28:
    IF NOT (V_16f0# = V_1700#) THEN GOTO L_49d94   '@49c28
    V_17e0# = V_16f0#   '@49c43
    V_17e8# = V_1700#   '@49c54
    L_BP1c6! = FX##(V_16f8#) / 1.0#   '@49c65 DS:3314
    L_BP1ca! = FX##(V_1708#) / 1.0#   '@49c7c DS:3314
    CALL MIXT_0877_Menor(L_BP1c6!, L_BP1ca!, L_BP1ce!)   '@49c8c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d2! = FX##(V_16d8#) / 1.0#   '@49ca1 DS:3314
    L_BP1d6! = FX##(V_16e8#) / 1.0#   '@49cb2 DS:3314
    CALL MIXT_0877_Menor(L_BP1d2!, L_BP1d6!, L_BP1da!)   '@49cc2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1ce!, L_BP1da!, L_BP1de!)   '@49cd6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_17f0# = L_BP1de!   '@49ceb
    L_BP1e2! = FX##(V_16f8#) / 1.0#   '@49cf6 DS:3314
    L_BP1e6! = FX##(V_1708#) / 1.0#   '@49d0d DS:3314
    CALL MIXT_082a_Maior(L_BP1e2!, L_BP1e6!, L_BP1ea!)   '@49d1d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ee! = FX##(V_16d8#) / 1.0#   '@49d32 DS:3314
    L_BP1f2! = FX##(V_16e8#) / 1.0#   '@49d43 DS:3314
    CALL MIXT_082a_Maior(L_BP1ee!, L_BP1f2!, L_BP1f6!)   '@49d53
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP1ea!, L_BP1f6!, L_BP1fa!)   '@49d67
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_17f8# = L_BP1fa!   '@49d7c
    GOTO L_4a104   '@49d87
L_49d94:
    IF NOT (ABS((FX##(V_1708#) - V_16f8#) / (FX##(V_1700#) - V_16f0#) - (FX##(V_16e8#) - V_16d8#) / (FX##(V_16e0#) - V_16d0#)) > FX##(V_133a!)) THEN GOTO L_49de6   '@49d94
    GOTO L_4a70c   '@49dde
L_49de6:
    IF NOT (V_1708# = V_16e8# AND V_1700# = V_16e0# OR (V_1708# = V_16d8# AND V_1700# = V_16d0# OR (V_16f8# = V_16e8# AND V_16f0# = V_16e0# OR V_16f8# = V_16d8# AND V_16f0# = V_16d0#))) THEN GOTO L_49ece   '@49de6
    GOTO L_49f48   '@49ec6
L_49ece:
    IF NOT (V_16e0# = V_16f0#) THEN GOTO L_49ef1   '@49ece
    GOTO L_4a70c   '@49ee9
L_49ef1:
    IF NOT (ABS((FX##(V_1708#) - V_16f8#) / (FX##(V_1700#) - V_16f0#) - (FX##(V_16e8#) - V_16f8#) / (FX##(V_16e0#) - V_16f0#)) > FX##(V_133a!)) THEN GOTO L_49f43   '@49ef1
    GOTO L_4a70c   '@49f3b
L_49f43:
L_49f48:
    V_17e0# = V_16f0#   '@49f4d
    V_17f0# = V_16f8#   '@49f5e
    IF NOT (V_1700# < V_17e0#) THEN GOTO L_49fac   '@49f6f
    V_17e0# = V_1700#   '@49f8a
    V_17f0# = V_1708#   '@49f9b
L_49fac:
    IF NOT (V_16d0# < V_17e0#) THEN GOTO L_49fe9   '@49fac
    V_17e0# = V_16d0#   '@49fc7
    V_17f0# = V_16d8#   '@49fd8
L_49fe9:
    IF NOT (V_16e0# < V_17e0#) THEN GOTO L_4a026   '@49fe9
    V_17e0# = V_16e0#   '@4a004
    V_17f0# = V_16e8#   '@4a015
L_4a026:
    V_17e8# = V_16f0#   '@4a026
    V_17f8# = V_16f8#   '@4a037
    IF NOT (V_1700# > V_17e8#) THEN GOTO L_4a085   '@4a048
    V_17e8# = V_1700#   '@4a063
    V_17f8# = V_1708#   '@4a074
L_4a085:
    IF NOT (V_16d0# > V_17e8#) THEN GOTO L_4a0c2   '@4a085
    V_17e8# = V_16d0#   '@4a0a0
    V_17f8# = V_16d8#   '@4a0b1
L_4a0c2:
    IF NOT (V_16e0# > V_17e8#) THEN GOTO L_4a0ff   '@4a0c2
    V_17e8# = V_16e0#   '@4a0dd
    V_17f8# = V_16e8#   '@4a0ee
L_4a0ff:
L_4a104:
    V_1780! = 0.0   '@4a109 DS:3304
    L_BP1fe! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@4a11a
    FOR V_1778! = 1.0 TO L_BP1fe!   '@4a149 DS:3308
    IF NOT (FX##(A_15de!(RT_CINT%(FX##(V_1778!)))) = FX##(V_17f0#) AND FX##(A_15b0!(RT_CINT%(FX##(V_1778!)))) = FX##(V_17e0#)) THEN GOTO L_4a1da   '@4a150
    V_1780! = V_1778!   '@4a1bc
    GOTO L_4a206   '@4a1cd
L_4a1da:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@4a1da DS:3308
L_4a206:
    IF NOT (V_1780! <> 0.0) THEN GOTO L_4a2d9   '@4a206 DS:3304
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_1780!   '@4a221
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@4a24e DS:3304
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 2) = V_17e8#   '@4a279
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 3) = V_17f8#   '@4a2a1
    GOTO L_4a5c9   '@4a2cc
L_4a2d9:
    V_1780! = 0.0   '@4a2d9 DS:3304
    L_BP202! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@4a2ea
    FOR V_1778! = 1.0 TO L_BP202!   '@4a319 DS:3308
    IF NOT (FX##(A_15de!(RT_CINT%(FX##(V_1778!)))) = FX##(V_17f8#) AND FX##(A_15b0!(RT_CINT%(FX##(V_1778!)))) = FX##(V_17e8#)) THEN GOTO L_4a3aa   '@4a320
    V_1780! = V_1778!   '@4a38c
    GOTO L_4a3d6   '@4a39d
L_4a3aa:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@4a3aa DS:3308
L_4a3d6:
    IF NOT (V_1780! <> 0.0) THEN GOTO L_4a4a9   '@4a3d6 DS:3304
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_1780!   '@4a3f1
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@4a41e DS:3304
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 2) = V_17e0#   '@4a449
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 3) = V_17f0#   '@4a471
    GOTO L_4a5c9   '@4a49c
L_4a4a9:
    IF NOT (V_17e0# < 0.0#) THEN GOTO L_4a51c   '@4a4a9 DS:332c
    SWAP V_17e0#, V_17e8#   '@4a4d1 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
    SWAP V_17f0#, V_17f8#   '@4a4fd (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
L_4a51c:
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) = V_17e0#   '@4a51c
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 1) = V_17f0#   '@4a546
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 2) = V_17e8#   '@4a571
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 3) = V_17f8#   '@4a599
L_4a5c9:
    L_BP20a# = FX##(A_160c!(0, 0)) - 1.0   '@4a5ce DS:3310
    FOR V_0ef4# = V_0f14! TO L_BP20a#   '@4a5f4 DS:3314
    FOR V_0efc# = 0.0# TO 3.0#   '@4a5fc DS:3314,332c,3352
    A_160c!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_160c!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@4a60a DS:3314
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@4a662 DS:3314,3352
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@4a68e DS:3314
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@4a6ba DS:3310
    V_0ef0! = 0.0   '@4a6ee DS:3304
    GOTO L_4a752   '@4a6ff
L_4a70c:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4a711 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0f14!) THEN GOTO L_49712   '@4a727
L_4a752:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4a752 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) <= V_0ef0!) THEN GOTO L_49588   '@4a768
    L_BP20e! = 0.0   '@4a792 DS:3304
L_4a7a8:
    V_0ef0! = 1.0   '@4a7ad DS:3308
L_4a7c4:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_4a855   '@4a7c4 DS:3304
    V_16f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4a7f8
    V_16f8# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4a822
    GOTO L_4a8e0   '@4a84d
L_4a855:
    V_16f0# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@4a855
    V_16f8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@4a898
L_4a8e0:
    V_1700# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4a8e0
    V_1708# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4a908
    V_0f14! = FX##(V_0ef0!) + 1.0   '@4a933 DS:3308
L_4a94e:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_4a9df   '@4a94e DS:3304
    V_16d0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 0)   '@4a982
    V_16d8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 1)   '@4a9ac
    GOTO L_4aa6a   '@4a9d7
L_4a9df:
    V_16d0# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@4a9df
    V_16d8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@4aa22
L_4aa6a:
    V_16e0# = A_160c!(RT_CINT%(FX##(V_0f14!)), 2)   '@4aa6a
    V_16e8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 3)   '@4aa92
    CALL S_2018c   '@4aabd
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "NAO") THEN GOTO L_4aae6   '@4aac7 DS:3320
    GOTO L_4af87   '@4aade
L_4aae6:
    IF NOT (ABS(FX##(V_0efc#) - V_1708#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_1700#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16f8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16f0#) < FX##(V_133a!)) THEN GOTO L_4ab82   '@4aae6
    GOTO L_4ad45   '@4ab7a
L_4ab82:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4ab82 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_0ef4#   '@4abb6
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_0efc#   '@4abef
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4ac29
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4ac77
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 2) = V_0ef4#   '@4accb
    A_160c!(RT_CINT%(FX##(V_0ef0!)), 3) = V_0efc#   '@4acf3
    V_1700# = V_0ef4#   '@4ad1e
    V_1708# = V_0efc#   '@4ad2f
L_4ad45:
    IF NOT (ABS(FX##(V_0efc#) - V_16e8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16e0#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16d8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_4ade6   '@4ad4a
    GOTO L_4af87   '@4adde
L_4ade6:
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4ade6 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_0ef4#   '@4ae1a
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_0efc#   '@4ae53
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = A_160c!(RT_CINT%(FX##(V_0f14!)), 2)   '@4ae8d
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = A_160c!(RT_CINT%(FX##(V_0f14!)), 3)   '@4aedb
    A_160c!(RT_CINT%(FX##(V_0f14!)), 2) = V_0ef4#   '@4af2f
    A_160c!(RT_CINT%(FX##(V_0f14!)), 3) = V_0efc#   '@4af57
L_4af87:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4af8c DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0f14!) THEN GOTO L_4a94e   '@4afa2
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4afcc DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) <= V_0ef0!) THEN GOTO L_4a7c4   '@4afe2
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_4b049   '@4b00c DS:3308
    GOTO L_4cc93   '@4b041
L_4b049:
    V_0ef0! = 1.0   '@4b049 DS:3308
L_4b060:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_4b413   '@4b060 DS:3304
    V_1778! = 2.0   '@4b094 DS:330c
    V_17e0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4b0a5
    V_17f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4b0cf
    L_BP212! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4b0fa
    FOR V_0f14! = 1.0 TO L_BP212!   '@4b12a DS:3308
    IF NOT (ABS(FX##(A_15de!(RT_CINT%(FX##(V_0f14!)))) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(A_15b0!(RT_CINT%(FX##(V_0f14!)))) - V_17e0#) < FX##(V_133a!)) THEN GOTO L_4b1b6   '@4b132
    GOTO L_4b1e2   '@4b1ae
L_4b1b6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@4b1b6 DS:3308
L_4b1e2:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) > V_0f14!) THEN GOTO L_4b222   '@4b1e2
    GOTO L_4b418   '@4b21a
L_4b222:
    GOSUB L_4ddb1   '@4b222
    IF NOT (V_0ef0! = 0.0) THEN GOTO L_4b252   '@4b22f DS:3304
    GOTO L_4b45e   '@4b24a
L_4b252:
    V_1778! = 0.0   '@4b252 DS:3304
    V_17e0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4b263
    V_17f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4b28b
    L_BP216! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4b2b6
    FOR V_0f14! = 1.0 TO L_BP216!   '@4b2e6 DS:3308
    IF NOT (ABS(FX##(A_15de!(RT_CINT%(FX##(V_0f14!)))) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(A_15b0!(RT_CINT%(FX##(V_0f14!)))) - V_17e0#) < FX##(V_133a!)) THEN GOTO L_4b372   '@4b2ee
    GOTO L_4b39e   '@4b36a
L_4b372:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@4b372 DS:3308
L_4b39e:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) > V_0f14!) THEN GOTO L_4b3de   '@4b39e
    GOTO L_4b418   '@4b3d6
L_4b3de:
    GOSUB L_4ddb1   '@4b3de
    IF NOT (V_0ef0! = 0.0) THEN GOTO L_4b40e   '@4b3eb DS:3304
    GOTO L_4b45e   '@4b406
L_4b40e:
L_4b413:
L_4b418:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4b41d DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_4b060   '@4b433
L_4b45e:
    IF NOT (A_160c!(0, 0) > A_109e%(RT_CINT%(FX##(V_177c!)), 0) AND V_0ef0! = 0.0) THEN GOTO L_4b4d4   '@4b45e DS:3304
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4956d   '@4b4cc
L_4b4d4:
L_4b4d9:
    V_0ef0! = 1.0   '@4b4de DS:3308
L_4b4f4:
    IF NOT (ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)) - A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)) - A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!)) THEN GOTO L_4b791   '@4b4f4
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@4b5a8 DS:3310
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_4b60e   '@4b5dc
    GOTO L_4b7d2   '@4b606
L_4b60e:
    V_0f14! = V_0ef0!   '@4b60e
L_4b624:
    A_160c!(RT_CINT%(FX##(V_0f14!)), 0) = A_160c!(RT_CINT%(FX##(V_0f14!) + 1.0), 0)   '@4b624 DS:3308
    A_160c!(RT_CINT%(FX##(V_0f14!)), 1) = A_160c!(RT_CINT%(FX##(V_0f14!) + 1.0), 1)   '@4b66c DS:3308
    A_160c!(RT_CINT%(FX##(V_0f14!)), 2) = A_160c!(RT_CINT%(FX##(V_0f14!) + 1.0), 2)   '@4b6b6 DS:3308
    A_160c!(RT_CINT%(FX##(V_0f14!)), 3) = A_160c!(RT_CINT%(FX##(V_0f14!) + 1.0), 3)   '@4b6fa DS:3308
    V_0f14! = FX##(V_0f14!) + 1.0   '@4b744 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0f14!) THEN GOTO L_4b624   '@4b75a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b4d9   '@4b784
L_4b791:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4b791 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_4b4f4   '@4b7a7
L_4b7d2:
    IF NOT (L_BP20e! = 1.0) THEN GOTO L_4b7f5   '@4b7d2 DS:3308
    GOTO L_4cc89   '@4b7ed
L_4b7f5:
    IF NOT (L_BP20e! = 2.0) THEN GOTO L_4b818   '@4b7f5 DS:330c
    GOTO L_4cc93   '@4b810
L_4b818:
    V_0ef0! = 1.0   '@4b818 DS:3308
L_4b82e:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4bc3a   '@4b82f
    V_1778! = 0.0   '@4b853 DS:3304
    L_BP21a! = A_160c!(0, 0)   '@4b864
    FOR V_0f10! = 1.0 TO L_BP21a!   '@4b885 DS:3308
    IF NOT (A_160c!(RT_CINT%(FX##(V_0f10!)), 0) > 0.0) THEN GOTO L_4b98c   '@4b88c DS:3304
    IF NOT (ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f10!)), 1)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f10!)), 0)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_4b987   '@4b8c0
    V_1778! = 1.0   '@4b976 DS:3308
L_4b987:
L_4b98c:
    IF NOT (ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f10!)), 3)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f10!)), 2)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_4ba51   '@4b98c
    V_1778! = 1.0   '@4ba40 DS:3308
L_4ba51:
    IF NOT (V_1778! = 1.0) THEN GOTO L_4ba74   '@4ba51 DS:3308
    GOTO L_4baa0   '@4ba6c
L_4ba74:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4ba74 DS:3308
L_4baa0:
    IF NOT (V_1778! = 1.0) THEN GOTO L_4bad9   '@4baa0 DS:3308
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4babb DS:3308
    GOTO L_4bc32   '@4bad1
L_4bad9:
    IF NOT (L_BP40!(0, 0) > V_0ef0!) THEN GOTO L_4bbf9   '@4bad9
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0)   '@4bb03
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1)   '@4bb54
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2)   '@4bba7
L_4bbf9:
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) - 1.0   '@4bbf9 DS:3310
L_4bc32:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b82e   '@4bc32
L_4bc3a:
    V_0ef0! = 1.0   '@4bc3a DS:3308
L_4bc50:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4bf08   '@4bc51
    V_1778! = FX##(V_0ef0!) + 1.0   '@4bc75 DS:3308
L_4bc90:
    IF NOT (L_BP40!(0, 0) >= V_1778!) THEN GOTO L_4beea   '@4bc91
    IF NOT (ABS(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BP40!(RT_CINT%(FX##(V_1778!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BP40!(RT_CINT%(FX##(V_1778!)), 0)) < FX##(V_133a!)) THEN GOTO L_4bec7   '@4bcb5
    IF NOT (L_BP40!(0, 0) > V_1778!) THEN GOTO L_4be8b   '@4bd6b
    SWAP L_BP40!(RT_CINT%(FX##(V_1778!)), 0), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0)   '@4bd95
    SWAP L_BP40!(RT_CINT%(FX##(V_1778!)), 1), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1)   '@4bde6
    SWAP L_BP40!(RT_CINT%(FX##(V_1778!)), 2), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2)   '@4be39
L_4be8b:
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) - 1.0   '@4be8b DS:3310
    GOTO L_4bee2   '@4bebf
L_4bec7:
    V_1778! = FX##(V_1778!) + 1.0   '@4bec7 DS:3308
L_4bee2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4bc90   '@4bee2
L_4beea:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4beea DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4bc50   '@4bf00
L_4bf08:
    V_0ef0! = 1.0   '@4bf08 DS:3308
L_4bf1e:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4c530   '@4bf1f
    V_16f0# = L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4bf43
    V_16f8# = L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4bf6d
    V_1700# = RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2))) * -(ABS(RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4bf98 DS:335a
    V_1708# = RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2))) * -(ABS(RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4c02c DS:335a
    V_1778! = 0.0   '@4c0c1 DS:3304
    V_0f14! = 1.0   '@4c0d2 DS:3308
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4c114   '@4c0e3
    V_0f14! = FX##(V_0f14!) + 1.0   '@4c0fe DS:3308
L_4c114:
L_4c11a:
    IF NOT (L_BP40!(0, 0) >= V_0f14!) THEN GOTO L_4c3da   '@4c11b
    V_16d0# = L_BP40!(RT_CINT%(FX##(V_0f14!)), 0)   '@4c13f
    V_16d8# = L_BP40!(RT_CINT%(FX##(V_0f14!)), 1)   '@4c169
    V_16e0# = RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2))) * -(ABS(RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0f14!)), 0)   '@4c194 DS:335a
    V_16e8# = RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2))) * -(ABS(RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0f14!)), 1)   '@4c228 DS:335a
    CALL S_2018c   '@4c2bd
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4c38a   '@4c2c7 DS:3300
    IF NOT (RT_POT##((FX##(V_1700#) - V_16f0#), (2.0#)) + RT_POT##((FX##(V_1708#) - V_16f8#), (2.0#)) > RT_POT##((FX##(V_0ef4#) - V_16f0#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_16f8#), (2.0#))) THEN GOTO L_4c385   '@4c2de DS:3334
    V_1700# = V_0ef4#   '@4c34d
    V_1708# = V_0efc#   '@4c35e
    V_1778! = 1.0   '@4c36f DS:3308
L_4c385:
L_4c38a:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4c38a DS:3308
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4c3d1   '@4c3a0
    V_0f14! = FX##(V_0f14!) + 1.0   '@4c3bb DS:3308
L_4c3d1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c11a   '@4c3d1
L_4c3da:
    IF NOT (V_1778! = 1.0) THEN GOTO L_4c512   '@4c3da DS:3308
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4c3f5 DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = V_16f0#   '@4c429
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1) = V_16f8#   '@4c462
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_1700#   '@4c49c
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_1708#   '@4c4d3
L_4c512:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4c512 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4bf1e   '@4c528
L_4c530:
    L_BP40!(0, 0) = 0.0   '@4c530 DS:3304
    L_BP21e! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4c550
    FOR V_0f10! = 1.0 TO L_BP21e!   '@4c580 DS:3308
    IF NOT (A_163a!(RT_CINT%(FX##(V_0f10!)), 0) = -100.0) THEN GOTO L_4c5c4   '@4c588 DS:331c
    GOTO L_4cc30   '@4c5bc
L_4c5c4:
    V_0ef0! = 1.0   '@4c5c4 DS:3308
L_4c5da:
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_4c655   '@4c5da DS:3304
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_0f10!) THEN GOTO L_4c64d   '@4c60e
    GOTO L_4c806   '@4c645
L_4c64d:
    GOTO L_4c711   '@4c64d
L_4c655:
    IF NOT (ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)) - A_15de!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_133a!) AND ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)) - A_15b0!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_133a!)) THEN GOTO L_4c70c   '@4c655
    GOTO L_4c806   '@4c704
L_4c70c:
L_4c711:
    IF NOT (ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)) - A_15de!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_133a!) AND ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)) - A_15b0!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_133a!)) THEN GOTO L_4c7c6   '@4c711
    GOTO L_4c806   '@4c7be
L_4c7c6:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4c7c6 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_4c5da   '@4c7dc
L_4c806:
    IF NOT (A_160c!(0, 0) < V_0ef0!) THEN GOTO L_4cc2b   '@4c806
    V_1780! = 0.0   '@4c830 DS:3304
    V_1790! = FX##(V_0f10!) - 1.0   '@4c841 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_4c8a1   '@4c857 DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4c872
L_4c8a1:
    V_1794! = V_0f10!   '@4c8a1
    V_1798! = V_0f10!   '@4c8b2
    V_179c! = FX##(V_0f10!) + 1.0   '@4c8c3 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_4c922   '@4c8d9
    V_179c! = 1.0   '@4c911 DS:3308
L_4c922:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_4c994   '@4c922
    GOTO L_4cc30   '@4c98c
L_4c994:
    CALL S_21e5d   '@4c994
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) + 1.0   '@4c99e DS:3308
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0) = -V_0f10!   '@4c9d2
    V_16f0# = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@4ca0e
    V_16f8# = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@4ca35
    V_1700# = A_15b0!(RT_CINT%(FX##(V_0f10!))) + RT_COS##(FX##(V_16a0#)) * -(ABS(RT_COS##(FX##(V_16a0#))) > FX##(V_133e!)) * 1000.0#   '@4ca5c DS:334a
    V_1708# = A_15de!(RT_CINT%(FX##(V_0f10!))) + RT_SIN##(FX##(V_16a0#)) * -(ABS(RT_SIN##(FX##(V_16a0#))) > FX##(V_133e!)) * 1000.0#   '@4cac2 DS:334a
    V_16b8! = 0.0   '@4cb28 DS:3304
    L_BP20e! = 1.0   '@4cb39 DS:3308
L_4cb4f:
    CALL S_23948   '@4cb54
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4cc26   '@4cb5e DS:3300
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2) = V_0ef4#   '@4cb75
    A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3) = V_0efc#   '@4cbac
    V_1700# = V_0ef4#   '@4cbe6
    V_1708# = V_0efc#   '@4cbf7
    V_16b8! = V_1778!   '@4cc08
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4cb4f   '@4cc19
L_4cc26:
L_4cc2b:
L_4cc30:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4cc35 DS:3308
    IF NOT (L_BP20e! = 1.0) THEN GOTO L_4cc84   '@4cc61 DS:3308
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a7a8   '@4cc7c
L_4cc84:
L_4cc89:
L_4cc93:
    GOTO L_4e6af   '@4cc98
    ' ---- F_4cca0 @0x4cca0  (04cca0_F_4cca0.lift.txt; evidence_id (assembly): ev_60a0db88a97a335c22afc3c44befff3539c35523e09caddabda363791fce7fb8)
L_4cca5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04019b_FUN_4000_019b
L_4ccaf:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1790!))) = 1) THEN GOTO L_4cd64   '@4ccb4
    V_1794! = V_1790!   '@4cce6
    V_1790! = FX##(V_1790!) - 1.0   '@4ccf7 DS:3310
    IF NOT (V_1790! = 0.0) THEN GOTO L_4cd57   '@4cd0d DS:3304
    V_1790! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4cd28
L_4cd57:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4ccaf   '@4cd57
L_4cd64:
L_4cd69:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1798!))) = 1) THEN GOTO L_4ce6b   '@4cd6e
    V_1798! = FX##(V_1798!) + 1.0   '@4cda0 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1798!) THEN GOTO L_4cdff   '@4cdb6
    V_1798! = 1.0   '@4cdee DS:3308
L_4cdff:
    V_179c! = FX##(V_1798!) + 1.0   '@4cdff DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_179c!) THEN GOTO L_4ce5e   '@4ce15
    V_179c! = 1.0   '@4ce4d DS:3308
L_4ce5e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4cd69   '@4ce5e
L_4ce6b:
    CALL S_21e5d   '@4ce6b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1670# = V_16a0#   '@4ce75
    V_1678# = V_16a8#   '@4ce86
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_1794!)))   '@4ce97
    V_17f0# = A_15de!(RT_CINT%(FX##(V_1794!)))   '@4cebe
    V_1680# = V_16b0#   '@4cee5
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_1798!)))   '@4cef6
    V_17f8# = A_15de!(RT_CINT%(FX##(V_1798!)))   '@4cf1d
    CALL S_23341   '@4cf44
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = 10000000000.0# AND (V_0ef4# = 10000000000.0# AND V_0f18$ = "NAO")) THEN GOTO L_4d272   '@4cf4e DS:3320,335e
    V_0ef4# = (FX##(V_17e0#) + V_17e8#) / 2.0#   '@4cfa3 DS:3334
    V_0efc# = (FX##(V_17f0#) + V_17f8#) / 2.0#   '@4cfbe DS:3334
    L_BP1e! = V_1790!   '@4cfd9
    GOSUB L_4d8ae   '@4cfe9
    L_BP26! = L_BP22!   '@4cff6
    L_BP1e! = V_1798!   '@4d005
    GOSUB L_4d8ae   '@4d015
    L_BP2a! = L_BP22!   '@4d022
    IF NOT (L_BP26! <> L_BP2a!) THEN GOTO L_4d26d   '@4d031
    V_1678# = RT_SIN##(FX##(V_0e68_pi#) / 2.0#) / (RT_SQR##(1.0 / (FX##(L_BP26!) + 1.0)) + RT_COS##(FX##(V_0e68_pi#) / 2.0#))   '@4d04a DS:3308,3334
    V_1680# = RT_SIN##(FX##(V_0e68_pi#) / 2.0#) / (RT_SQR##(1.0 / (FX##(L_BP2a!) + 1.0)) + RT_COS##(FX##(V_0e68_pi#) / 2.0#))   '@4d092 DS:3308,3334
    IF NOT (L_BP26! > L_BP2a!) THEN GOTO L_4d11d   '@4d0da
    L_BP1e! = 1.0# / (FX##(V_1680#) / V_1678# + 1.0#)   '@4d0f3 DS:3314
    GOTO L_4d14c   '@4d115
L_4d11d:
    L_BP1e! = 1.0# - 1.0# / (FX##(V_1678#) / V_1680# + 1.0#)   '@4d11d DS:3314
L_4d14c:
    V_0ef4# = V_17e0#   '@4d14c
    IF NOT (V_17e0# > V_17e8#) THEN GOTO L_4d19d   '@4d15d
    V_0ef4# = V_17e0# - L_BP1e! * (FX##(V_17e0#) - V_17e8#)   '@4d178
L_4d19d:
    IF NOT (V_17e0# < V_17e8#) THEN GOTO L_4d1da   '@4d19d
    V_0ef4# = L_BP1e! * (FX##(V_17e8#) - V_17e0#) + V_17e0#   '@4d1b8
L_4d1da:
    V_0efc# = V_17f0#   '@4d1da
    IF NOT (V_17f0# > V_17f8#) THEN GOTO L_4d22b   '@4d1eb
    V_0efc# = V_17f0# - L_BP1e! * (FX##(V_17f0#) - V_17f8#)   '@4d206
L_4d22b:
    IF NOT (V_17f0# < V_17f8#) THEN GOTO L_4d268   '@4d22b
    V_0efc# = L_BP1e! * (FX##(V_17f8#) - V_17f0#) + V_17f0#   '@4d246
L_4d268:
L_4d26d:
L_4d272:
    V_16f0# = V_0ef4# - RT_COS##(FX##(V_16a0#)) * -(ABS(RT_COS##(FX##(V_1670#))) > FX##(V_133e!)) * 1000.0#   '@4d272 DS:334a
    V_16f8# = V_0efc# - RT_SIN##(FX##(V_16a0#)) * -(ABS(RT_SIN##(FX##(V_1670#))) > FX##(V_133e!)) * 1000.0#   '@4d2c2 DS:334a
    V_1700# = RT_COS##(FX##(V_16a0#)) * -(ABS(RT_COS##(FX##(V_1670#))) > FX##(V_133e!)) * 1000.0# + V_0ef4#   '@4d312 DS:334a
    V_1708# = RT_SIN##(FX##(V_16a0#)) * -(ABS(RT_SIN##(FX##(V_1670#))) > FX##(V_133e!)) * 1000.0# + V_0efc#   '@4d35f DS:334a
    V_17a0! = V_1794!   '@4d3ac
L_4d3c2:
    V_16d0# = A_15b0!(RT_CINT%(FX##(V_17a0!)))   '@4d3c7
    V_16d8# = A_15de!(RT_CINT%(FX##(V_17a0!)))   '@4d3ee
    V_17a4! = FX##(V_17a0!) + 1.0   '@4d415 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_17a4!) THEN GOTO L_4d474   '@4d42b
    V_17a4! = 1.0   '@4d463 DS:3308
L_4d474:
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_17a4!)))   '@4d474
    V_16e8# = A_15de!(RT_CINT%(FX##(V_17a4!)))   '@4d49b
    CALL S_2018c   '@4d4c2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "NAO") THEN GOTO L_4d54f   '@4d4cc DS:3320
    V_17a0! = FX##(V_17a0!) + 1.0   '@4d4e3 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_17a0!) THEN GOTO L_4d542   '@4d4f9
    V_17a0! = 1.0   '@4d531 DS:3308
L_4d542:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4d3c2   '@4d542
L_4d54f:
    RETURN   '@4d54f
L_4d55e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04019b_FUN_4000_019b
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 0), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 2.0), 0)   '@4d563 DS:3340
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 1), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 2.0), 1)   '@4d5c8 DS:3340
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 2), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 2.0), 2)   '@4d62f DS:3340
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0))), 3), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 2.0), 3)   '@4d690 DS:3340
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 1.0), 0), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 3.0), 0)   '@4d6f7 DS:3310,3366
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 1.0), 1), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 3.0), 1)   '@4d761 DS:3310,3366
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 1.0), 2), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 3.0), 2)   '@4d7cd DS:3310,3366
    SWAP A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 1.0), 3), A_160c!(RT_CINT%(FX##(A_160c!(0, 0)) - 3.0), 3)   '@4d833 DS:3310,3366
    RETURN   '@4d89f
L_4d8ae:   ' sub-rotina (alvo de GOSUB)
    L_BP0e! = L_BP1e!   '@4d8b3
    L_BP22! = 0.0   '@4d8c2 DS:3304
L_4d8d8:
    L_BP12! = FX##(L_BP0e!) + 1.0   '@4d8d8 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP12!) THEN GOTO L_4d933   '@4d8ec
    L_BP12! = 1.0   '@4d923 DS:3308
L_4d933:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) > 2) THEN GOTO L_4da2c   '@4d933
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) - 2) * RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP0e!)))) - A_15b0!(RT_CINT%(FX##(L_BP12!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP0e!)))) - A_15de!(RT_CINT%(FX##(L_BP12!)))), (2.0))) / 10.0 + L_BP22!   '@4d963 DS:330c,336a
L_4da2c:
    L_BP1a! = L_BP0e!   '@4da2c
    IF NOT (A_163a!(RT_CINT%(FX##(L_BP0e!)), 0) = -100.0) THEN GOTO L_4dad2   '@4da3b DS:331c
    L_BP0e! = FX##(L_BP0e!) - 1.0   '@4da6e DS:3310
    IF NOT (L_BP0e! = 0.0) THEN GOTO L_4daca   '@4da82 DS:3304
    L_BP0e! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@4da9c
L_4daca:
    GOTO L_4dadf   '@4daca
L_4dad2:
    GOTO L_4dae8   '@4dad2
L_4dadf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4d8d8   '@4dadf
L_4dae8:
    L_BP0e! = L_BP1e!   '@4dae8
L_4dafc:
    L_BP0e! = FX##(L_BP0e!) + 1.0   '@4dafc DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP0e!) THEN GOTO L_4db57   '@4db10
    L_BP0e! = 1.0   '@4db47 DS:3308
L_4db57:
    L_BP16! = L_BP0e!   '@4db57
    IF NOT (A_163a!(RT_CINT%(FX##(L_BP0e!)), 0) = -100.0) THEN GOTO L_4dbfc   '@4db66 DS:331c
    L_BP12! = FX##(L_BP0e!) + 1.0   '@4db99 DS:3308
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = L_BP12!) THEN GOTO L_4dbf4   '@4dbad
    L_BP12! = 1.0   '@4dbe4 DS:3308
L_4dbf4:
    GOTO L_4dc09   '@4dbf4
L_4dbfc:
    GOTO L_4dd0a   '@4dbfc
L_4dc09:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) > 2) THEN GOTO L_4dd02   '@4dc09
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(L_BP0e!))) - 2) * RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP0e!)))) - A_15b0!(RT_CINT%(FX##(L_BP12!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP0e!)))) - A_15de!(RT_CINT%(FX##(L_BP12!)))), (2.0))) / 10.0 + L_BP22!   '@4dc39 DS:330c,336a
L_4dd02:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4dafc   '@4dd02
L_4dd0a:
    L_BP22! = L_BP22! / RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(L_BP1a!)))) - A_15b0!(RT_CINT%(FX##(L_BP16!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(L_BP1a!)))) - A_15de!(RT_CINT%(FX##(L_BP16!)))), (2.0)))   '@4dd0a DS:330c
    RETURN   '@4dda2
L_4ddb1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04019b_FUN_4000_019b
    V_1780! = 1.0   '@4ddb6 DS:3308
    V_0f14! = 1.0   '@4ddc7 DS:3308
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4de09   '@4ddd8
    V_0f14! = FX##(V_0f14!) + 1.0   '@4ddf3 DS:3308
L_4de09:
L_4de0e:
    IF NOT (A_160c!(0, 0) >= V_0f14!) THEN GOTO L_4e0dc   '@4de0f
    IF NOT (A_160c!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_4dec4   '@4de33 DS:3304
    V_17e8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 0)   '@4de67
    V_17f8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 1)   '@4de91
    GOTO L_4df4f   '@4debc
L_4dec4:
    V_17e8# = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@4dec4
    V_17f8# = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0f14!)), 0)))))   '@4df07
L_4df4f:
    IF NOT (ABS(FX##(V_17f0#) - V_17f8#) < FX##(V_133a!) AND ABS(FX##(V_17e0#) - V_17e8#) < FX##(V_133a!)) THEN GOTO L_4dfb3   '@4df4f
    V_1780! = FX##(V_1780!) + 1.0   '@4df9d DS:3308
L_4dfb3:
    V_17e8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 2)   '@4dfb3
    V_17f8# = A_160c!(RT_CINT%(FX##(V_0f14!)), 3)   '@4dfdb
    IF NOT (ABS(FX##(V_17f0#) - V_17f8#) < FX##(V_133a!) AND ABS(FX##(V_17e0#) - V_17e8#) < FX##(V_133a!)) THEN GOTO L_4e06a   '@4e006
    V_1780! = FX##(V_1780!) + 1.0   '@4e054 DS:3308
L_4e06a:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4e06a DS:3308
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4e0b1   '@4e080
    V_0f14! = FX##(V_0f14!) + 1.0   '@4e09b DS:3308
L_4e0b1:
    IF NOT (V_1780! >= 2.0) THEN GOTO L_4e0d4   '@4e0b1 DS:330c
    GOTO L_4e0dc   '@4e0cc
L_4e0d4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4de0e   '@4e0d4
L_4e0dc:
    IF NOT (V_1780! < 2.0) THEN GOTO L_4e6a0   '@4e0dc DS:330c
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) + 1.0   '@4e0f7 DS:3308
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0) = A_160c!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_1778!)))   '@4e12b
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1) = A_160c!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_1778!) + 1.0))   '@4e185 DS:3308
    V_16f0# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4e1e5
    V_16f8# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4e20f
    V_1700# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4e23a
    V_1708# = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4e262
    IF NOT (V_1778! = 2.0) THEN GOTO L_4e305   '@4e28d DS:330c
    SWAP V_16f0#, V_1700#   '@4e2b5 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
    SWAP V_16f8#, V_1708#   '@4e2e1 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
L_4e305:
    IF NOT (V_1700# = V_16f0#) THEN GOTO L_4e374   '@4e305
    V_1688# = FX##(V_0e68_pi#) / 2.0#   '@4e320 DS:3334
    IF NOT (V_1708# < V_16f8#) THEN GOTO L_4e36c   '@4e336
    V_1688# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@4e351 DS:3334,3352
L_4e36c:
    GOTO L_4e533   '@4e36c
L_4e374:
    IF NOT (V_1708# <= V_16f8# AND V_1700# < V_16f0#) THEN GOTO L_4e3e1   '@4e374
    V_1688# = ATN((FX##(V_16f8#) - V_1708#) / (FX##(V_16f0#) - V_1700#)) + V_0e68_pi#   '@4e3b2
L_4e3e1:
    IF NOT (V_1708# >= V_16f8# AND V_1700# > V_16f0#) THEN GOTO L_4e449   '@4e3e1
    V_1688# = ATN((FX##(V_1708#) - V_16f8#) / (FX##(V_1700#) - V_16f0#))   '@4e41f
L_4e449:
    IF NOT (V_1708# < V_16f8# AND V_1700# > V_16f0#) THEN GOTO L_4e4be   '@4e449
    V_1688# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_16f8#) - V_1708#) / (FX##(V_1700#) - V_16f0#))   '@4e487 DS:3334
L_4e4be:
    IF NOT (V_1708# > V_16f8# AND V_1700# < V_16f0#) THEN GOTO L_4e52e   '@4e4be
    V_1688# = V_0e68_pi# - ATN((FX##(V_1708#) - V_16f8#) / (FX##(V_16f0#) - V_1700#))   '@4e4fc
L_4e52e:
L_4e533:
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2) = V_1688#   '@4e533
    L_BP226# = FX##(A_160c!(0, 0)) - 1.0   '@4e56a DS:3310
    FOR V_0ef4# = V_0ef0! TO L_BP226#   '@4e590 DS:3314
    FOR V_0efc# = 0.0# TO 3.0#   '@4e598 DS:3314,332c,3352
    A_160c!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_160c!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@4e5a6 DS:3314
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@4e5fe DS:3314,3352
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@4e62a DS:3314
    A_160c!(0, 0) = FX##(A_160c!(0, 0)) - 1.0   '@4e656 DS:3310
    V_0ef0! = 0.0   '@4e68a DS:3304
L_4e6a0:
    RETURN   '@4e6a0
L_4e6af:   ' entrada vinda de 04019b_FUN_4000_019b
    ' @4e6af libera strings locais (L_BP110)
    ' @4e6b9 libera strings locais (L_BP96)
    ERASE L_BP40!   '@4e6c3
    ' END SUB   '@4e6cc
END SUB

SUB S_50187   ' entrada de SUB/FUNCTION (B$ENRA, locais 798 bytes) (0x50187)
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
    DIM L_BP52#
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62%
    DIM L_BP64%
    DIM L_BP68!
    DIM L_BPdc!
    DIM L_BPe0!
    DIM L_BPe4!
    DIM L_BPe8!
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc!
    REDIM L_BP7a!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP8c!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP9e%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BPb4!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BPc6!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BPd8!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_5000_0187 @0x50187  (050187_FUN_5000_0187.lift.txt; evidence_id (assembly): ev_c5f6ce7d3333bebc9683f2b73f991fd376a2520a0b26296e03cb0b865f4d4673)
    REDIM L_BP7a!(0 TO 1)   '@501a8
    REDIM L_BP8c!(0 TO 1)   '@501c5
    REDIM L_BP9e%(0 TO 1)   '@501de
    REDIM L_BPb4!(0 TO 1, 0 TO 1)   '@501fc
    REDIM L_BPc6!(0 TO 20)   '@5021c
    REDIM L_BPd8!(0 TO 20)   '@5023a
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_50290   '@50253 DS:3370
    GOTO L_57862   '@50288
L_50290:
    V_177c! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@50290
    REDIM A_15b0!(-32768 TO -32768)   '@502ba
    REDIM A_15de!(-32768 TO -32768)   '@502c8
    REDIM A_15b0!(0 TO 50)   '@502d1
    REDIM A_15de!(0 TO 50)   '@502ee
    A_15b0!(0) = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@50306
    L_BPdc! = A_109e%(RT_CINT%(FX##(V_177c!)), 0)   '@50342
    FOR V_0f10! = 1.0 TO L_BPdc!   '@50371 DS:3374
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@50378
    A_15de!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@503d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@5042d DS:3374
    L_BP42! = 0.0   '@50459 DS:3378
    L_BPe0! = FX##(A_15b0!(0)) - 1.0   '@50469 DS:337c
    FOR V_0f04! = 1.0 TO L_BPe0!   '@5048e DS:3374
    L_BP42! = L_BP42! - (FX##(A_15b0!(RT_CINT%(FX##(V_0f04!)))) + A_15b0!(RT_CINT%(FX##(V_0f04!) + 1.0))) * (FX##(A_15de!(RT_CINT%(FX##(V_0f04!)))) - A_15de!(RT_CINT%(FX##(V_0f04!) + 1.0))) / 2.0   '@50496 DS:3370,3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@50526 DS:3374
    GOSUB L_50dff   '@50552
    GOSUB L_5312e   '@5055f
    A_10cc!(0, 2) = L_BP56!   '@5056c
    A_10cc!(0, 3) = L_BP5a!   '@5058b
    A_10cc!(0, 4) = L_BP5e!   '@505ad
    ERASE L_BP7a!   '@505cf
    ERASE L_BP8c!   '@505dd
    ERASE L_BPc6!   '@505e7
    ERASE L_BPd8!   '@505f1
    ERASE L_BP9e%   '@505fb
    ERASE L_BPb4!   '@50605
    IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 0) <> 0.0) THEN GOTO L_50a17   '@5060f DS:3378
    L_BP52# = FX##(A_1210!(RT_CINT%(FX##(V_177c!)), 0)) * V_0e68_pi# / 180.0#   '@50643 DS:3380
    L_BPe4! = A_15b0!(0)   '@50676
    FOR V_0f10! = 1.0 TO L_BPe4!   '@50696 DS:3374
    V_0ef4# = A_15b0!(RT_CINT%(FX##(V_0f10!))) * RT_COS##(FX##(L_BP52#)) - A_15de!(RT_CINT%(FX##(V_0f10!))) * RT_SIN##(FX##(L_BP52#))   '@5069e
    V_0efc# = A_15b0!(RT_CINT%(FX##(V_0f10!))) * RT_SIN##(FX##(L_BP52#)) + A_15de!(RT_CINT%(FX##(V_0f10!))) * RT_COS##(FX##(L_BP52#))   '@506ff
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = INT(100.0# * FX##(V_0ef4#)) / 100.0#   '@50760 DS:3388
    A_15de!(RT_CINT%(FX##(V_0f10!))) = INT(100.0# * FX##(V_0efc#)) / 100.0#   '@50798 DS:3388
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@507d0 DS:3374
    V_0ef4# = A_15b0!(1)   '@507fc
    V_0efc# = A_15de!(1)   '@50819
    L_BPe8! = A_15b0!(0)   '@50836
    FOR V_0f10! = 1.0 TO L_BPe8!   '@50856 DS:3374
    IF NOT (FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_0ef4#)) THEN GOTO L_508b6   '@5085e
    V_0ef4# = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@5088f
L_508b6:
    IF NOT (FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_0efc#)) THEN GOTO L_5090e   '@508b6
    V_0efc# = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@508e7
L_5090e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@5090e DS:3374
    L_BPec! = A_15b0!(0)   '@5093a
    FOR V_0f10! = 1.0 TO L_BPec!   '@5095a DS:3374
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) - V_0ef4#   '@50962
    A_15de!(RT_CINT%(FX##(V_0f10!))) = FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) - V_0efc#   '@509a4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@509e6 DS:3374
L_50a17:
    IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) <> 1.0) THEN GOTO L_50df2   '@50a17 DS:3374
    IF NOT (A_1210!(RT_CINT%(FX##(V_177c!)), 1) < 1.0) THEN GOTO L_50c36   '@50a4c DS:3374
    V_0efc# = A_15de!(1)   '@50a81
    L_BPf0! = A_15b0!(0)   '@50a9e
    FOR V_0f10! = 1.0 TO L_BPf0!   '@50abe DS:3374
    IF NOT (FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_0efc#)) THEN GOTO L_50b1e   '@50ac6
    V_0efc# = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@50af7
L_50b1e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@50b1e DS:3374
    L_BP52# = 1.0 / RT_SQR##(FX##(A_1210!(RT_CINT%(FX##(V_177c!)), 1)))   '@50b4a DS:3374
    L_BPf4! = A_15b0!(0)   '@50b7f
    FOR V_0f10! = 1.0 TO L_BPf4!   '@50b9f DS:3374
    A_15de!(RT_CINT%(FX##(V_0f10!))) = INT((FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) - V_0efc#) * 100.0# * L_BP52#) / 100.0# + V_0efc#   '@50ba6 DS:3388
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@50c02 DS:3374
    GOTO L_50ded   '@50c2e
L_50c36:
    V_0ef4# = A_15b0!(1)   '@50c36
    L_BPf8! = A_15b0!(0)   '@50c53
    FOR V_0f10! = 1.0 TO L_BPf8!   '@50c73 DS:3374
    IF NOT (FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) < FX##(V_0ef4#)) THEN GOTO L_50cd2   '@50c7a
    V_0ef4# = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@50cab
L_50cd2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@50cd2 DS:3374
    L_BP52# = 1.0 / RT_SQR##(1.0 / FX##(A_1210!(RT_CINT%(FX##(V_177c!)), 1)))   '@50cfe DS:3374
    L_BPfc! = A_15b0!(0)   '@50d38
    FOR V_0f10! = 1.0 TO L_BPfc!   '@50d58 DS:3374
    A_15b0!(RT_CINT%(FX##(V_0f10!))) = INT((FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) - V_0ef4#) * 100.0# * L_BP52#) / 100.0# + V_0ef4#   '@50d60 DS:3388
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@50dbc DS:3374
L_50ded:
L_50df2:
    GOTO L_57862   '@50df2
    ' ---- F_50dfa @0x50dfa  (050dfa_F_50dfa.lift.txt; evidence_id (assembly): ev_9b183634bc7158f76dcb0e40a495adb5c67ab4b95c764ccb6cec8c543e48a929)
L_50dff:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050187_FUN_5000_0187
    L_BP62% = 0   '@50e04
    L_BP1e! = A_15b0!(1)   '@50e0e
    L_BP22! = A_15de!(1)   '@50e2a
    L_BP26! = A_15b0!(1)   '@50e46
    L_BP2a! = A_15de!(1)   '@50e62
    L_BP100! = FX##(A_15b0!(0)) - 1.0   '@50e7e DS:337c
    FOR V_1778! = 2.0 TO L_BP100!   '@50ea3 DS:3370,3374
    L_BP104! = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@50eaa
    CALL MIXT_0877_Menor(L_BP1e!, L_BP104!, L_BP108!)   '@50ed1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15b0!(RT_CINT%(FX##(V_1778!))) = L_BP104!   '@50ee5
    L_BP1e! = L_BP108!   '@50f07
    L_BP10c! = A_15de!(RT_CINT%(FX##(V_1778!)))   '@50f11
    CALL MIXT_0877_Menor(L_BP22!, L_BP10c!, L_BP110!)   '@50f38
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15de!(RT_CINT%(FX##(V_1778!))) = L_BP10c!   '@50f4c
    L_BP22! = L_BP110!   '@50f6e
    L_BP114! = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@50f78
    CALL MIXT_082a_Maior(L_BP26!, L_BP114!, L_BP118!)   '@50f9f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15b0!(RT_CINT%(FX##(V_1778!))) = L_BP114!   '@50fb3
    L_BP26! = L_BP118!   '@50fd5
    L_BP11c! = A_15de!(RT_CINT%(FX##(V_1778!)))   '@50fdf
    CALL MIXT_082a_Maior(L_BP2a!, L_BP11c!, L_BP120!)   '@51006
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_15de!(RT_CINT%(FX##(V_1778!))) = L_BP11c!   '@5101a
    L_BP2a! = L_BP120!   '@5103c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@51046 DS:3374
    L_BP56! = 0.0   '@51072 DS:3378
    L_BP124! = A_0fe6!(0, 0)   '@51082
    FOR V_0f04! = 1.0 TO L_BP124!   '@510a3 DS:3374
    V_16d0# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 0)   '@510aa
    V_16d8# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 1)   '@510d4
    V_16e0# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 2)   '@510ff
    V_16e8# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 3)   '@51127
    L_BP128! = FX##(V_16d0#) / 1.0#   '@51152 DS:3390
    L_BP12c! = FX##(V_16e0#) / 1.0#   '@51169 DS:3390
    CALL MIXT_0877_Menor(L_BP128!, L_BP12c!, L_BP130!)   '@51179
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP134! = FX##(V_16d0#) / 1.0#   '@5118e DS:3390
    L_BP138! = FX##(V_16e0#) / 1.0#   '@5119f DS:3390
    CALL MIXT_082a_Maior(L_BP134!, L_BP138!, L_BP13c!)   '@511af
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP13c! < L_BP1e! OR L_BP130! > L_BP26!) THEN GOTO L_51202   '@511c4
    GOTO L_52048   '@511fa
L_51202:
    L_BP140! = FX##(V_16d8#) / 1.0#   '@51202 DS:3390
    L_BP144! = FX##(V_16e8#) / 1.0#   '@51219 DS:3390
    CALL MIXT_0877_Menor(L_BP140!, L_BP144!, L_BP148!)   '@51229
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP14c! = FX##(V_16d8#) / 1.0#   '@5123e DS:3390
    L_BP150! = FX##(V_16e8#) / 1.0#   '@5124f DS:3390
    CALL MIXT_082a_Maior(L_BP14c!, L_BP150!, L_BP154!)   '@5125f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP154! < L_BP22! OR L_BP148! > L_BP2a!) THEN GOTO L_512b2   '@51274
    GOTO L_52048   '@512aa
L_512b2:
    L_BPc6!(0) = 1.0   '@512b2 DS:3374
    V_0ef4# = V_16d0#   '@512d2
    V_0efc# = V_16d8#   '@512e3
    V_1784! = 1.0   '@512f4 DS:3374
    L_BP158! = 0.0   '@51305 DS:3378
    GOSUB L_5209d   '@51316
    IF NOT (FX##(V_178c!) / 2.0 = RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_51373   '@51323 DS:3370
    V_1784! = 0.0   '@5135a DS:3378
    GOTO L_5141a   '@5136b
L_51373:
    L_BPc6!(RT_CINT%(FX##(L_BPc6!(0)))) = V_16d0#   '@51373
    L_BPd8!(RT_CINT%(FX##(L_BPc6!(0)))) = V_16d8#   '@513aa
    L_BPc6!(0) = FX##(L_BPc6!(0)) + 1.0   '@513e1 DS:3374
L_5141a:
    V_0ef4# = V_16e0#   '@5141a
    V_0efc# = V_16e8#   '@5142b
    V_1788! = 1.0   '@5143c DS:3374
    GOSUB L_5209d   '@5144d
    IF NOT (FX##(V_178c!) / 2.0 = RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_514aa   '@5145a DS:3370
    V_1788! = 0.0   '@51491 DS:3378
    GOTO L_51551   '@514a2
L_514aa:
    L_BPc6!(RT_CINT%(FX##(L_BPc6!(0)))) = V_16e0#   '@514aa
    L_BPd8!(RT_CINT%(FX##(L_BPc6!(0)))) = V_16e8#   '@514e1
    L_BPc6!(0) = FX##(L_BPc6!(0)) + 1.0   '@51518 DS:3374
L_51551:
    L_BP15c! = FX##(A_15b0!(0)) - 1.0   '@51551 DS:337c
    FOR V_0f14! = 1.0 TO L_BP15c!   '@51576 DS:3374
    V_16f0# = A_15b0!(RT_CINT%(FX##(V_0f14!)))   '@5157e
    V_16f8# = A_15de!(RT_CINT%(FX##(V_0f14!)))   '@515a5
    V_1708# = FX##(V_0f14!) + 1.0   '@515cc DS:3374
    IF NOT (FX##(A_15b0!(0)) = FX##(V_1708#)) THEN GOTO L_5161c   '@515e2
    V_1708# = 1.0#   '@5160b DS:3390
L_5161c:
    V_1700# = A_15b0!(RT_CINT%(FX##(V_1708#)))   '@5161c
    V_1708# = A_15de!(RT_CINT%(FX##(V_1708#)))   '@51643
    CALL S_2018c   '@5166a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ <> "NAO") THEN GOTO L_51732   '@51674 DS:3398
    L_BPc6!(RT_CINT%(FX##(L_BPc6!(0)))) = V_0ef4#   '@5168b
    L_BPd8!(RT_CINT%(FX##(L_BPc6!(0)))) = V_0efc#   '@516c2
    L_BPc6!(0) = FX##(L_BPc6!(0)) + 1.0   '@516f9 DS:3374
L_51732:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@51732 DS:3374
    L_BPc6!(0) = FX##(L_BPc6!(0)) - 1.0   '@5175e DS:337c
    IF NOT (L_BPc6!(0) < 2.0) THEN GOTO L_517c4   '@51792 DS:3370
    GOTO L_52048   '@517bc
L_517c4:
    IF NOT (FX##(L_BPc6!(0)) > FX##(V_1784!) + V_1788!) THEN GOTO L_51aa9   '@517c4
    V_1778! = 1.0   '@517f3 DS:3374
L_5180a:
    V_0f14! = FX##(V_1778!) + 1.0   '@5180a DS:3374
L_51826:
    IF NOT (ABS(FX##(L_BPd8!(RT_CINT%(FX##(V_1778!)))) - L_BPd8!(RT_CINT%(FX##(V_0f14!)))) < FX##(V_133a!) AND ABS(FX##(L_BPc6!(RT_CINT%(FX##(V_1778!)))) - L_BPc6!(RT_CINT%(FX##(V_0f14!)))) < FX##(V_133a!)) THEN GOTO L_51a1f   '@51826
    IF NOT (L_BPc6!(0) > V_0f14!) THEN GOTO L_519e3   '@518d2
    L_BP164# = FX##(L_BPc6!(0)) - 1.0   '@518fc DS:337c
    FOR V_0ef4# = V_0f14! TO L_BP164#   '@51922 DS:3390
    L_BPc6!(RT_CINT%(FX##(V_0ef4#))) = L_BPc6!(RT_CINT%(FX##(V_0ef4#) + 1.0#))   '@5192a DS:3390
    L_BPd8!(RT_CINT%(FX##(V_0ef4#))) = L_BPd8!(RT_CINT%(FX##(V_0ef4#) + 1.0#))   '@5196e DS:3390
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@519b2 DS:3390
L_519e3:
    L_BPc6!(0) = FX##(L_BPc6!(0)) - 1.0   '@519e3 DS:337c
    GOTO L_51a3a   '@51a17
L_51a1f:
    V_0f14! = FX##(V_0f14!) + 1.0   '@51a1f DS:3374
L_51a3a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPc6!(0) < V_0f14!) THEN GOTO L_51826   '@51a3a
    V_1778! = FX##(V_1778!) + 1.0   '@51a64 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPc6!(0) <= V_1778!) THEN GOTO L_5180a   '@51a7a
L_51aa9:
    IF NOT (L_BPc6!(0) >= 2.0) THEN GOTO L_52043   '@51aa9 DS:3370
    IF NOT (L_BPc6!(1) = L_BPc6!(2)) THEN GOTO L_51c8e   '@51ad3
    L_BP168! = FX##(L_BPc6!(0)) - 1.0   '@51b08 DS:337c
    FOR V_1778! = 1.0 TO L_BP168!   '@51b2e DS:3374
    L_BP16c! = L_BPc6!(0)   '@51b36
    FOR V_0ef0! = FX##(V_1778!) + 1.0 TO L_BP16c!   '@51b57 DS:3374
    IF NOT (L_BPd8!(RT_CINT%(FX##(V_1778!))) > L_BPd8!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_51c2e   '@51b64
    SWAP L_BPc6!(RT_CINT%(FX##(V_1778!))), L_BPc6!(RT_CINT%(FX##(V_0ef0!)))   '@51bad
    SWAP L_BPd8!(RT_CINT%(FX##(V_1778!))), L_BPd8!(RT_CINT%(FX##(V_0ef0!)))   '@51beb
L_51c2e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@51c2e DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@51c5a DS:3374
    GOTO L_51e11   '@51c86
L_51c8e:
    L_BP170! = FX##(L_BPc6!(0)) - 1.0   '@51c8e DS:337c
    FOR V_1778! = 1.0 TO L_BP170!   '@51cb4 DS:3374
    L_BP174! = L_BPc6!(0)   '@51cbc
    FOR V_0ef0! = FX##(V_1778!) + 1.0 TO L_BP174!   '@51cdd DS:3374
    IF NOT (L_BPc6!(RT_CINT%(FX##(V_1778!))) > L_BPc6!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_51db4   '@51cea
    SWAP L_BPc6!(RT_CINT%(FX##(V_1778!))), L_BPc6!(RT_CINT%(FX##(V_0ef0!)))   '@51d33
    SWAP L_BPd8!(RT_CINT%(FX##(V_1778!))), L_BPd8!(RT_CINT%(FX##(V_0ef0!)))   '@51d71
L_51db4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@51db4 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@51de0 DS:3374
L_51e11:
    V_0f14! = 1.0   '@51e11 DS:3374
L_51e27:
    IF NOT (FX##(V_0f14!) + 1.0 > FX##(L_BPc6!(0))) THEN GOTO L_51e63   '@51e2c DS:3374
    GOTO L_52048   '@51e5b
L_51e63:
    V_16d0# = L_BPc6!(RT_CINT%(FX##(V_0f14!)))   '@51e63
    V_16d8# = L_BPd8!(RT_CINT%(FX##(V_0f14!)))   '@51e8b
    V_16e0# = L_BPc6!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@51eb3 DS:3374
    V_16e8# = L_BPd8!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@51ee0 DS:3374
    L_BP178! = 1.0   '@51f0d DS:3374
    GOSUB L_5261b   '@51f1e
    IF NOT (L_BP3e! <> -1.0) THEN GOTO L_51f55   '@51f2b DS:337c
    L_BP178! = L_BP3e!   '@51f45
L_51f55:
    L_BP56! = RT_SQR##(RT_POT##((FX##(L_BPc6!(RT_CINT%(FX##(V_0f14!)))) - L_BPc6!(RT_CINT%(FX##(V_0f14!) + 1.0))), (2.0)) + RT_POT##((FX##(L_BPd8!(RT_CINT%(FX##(V_0f14!)))) - L_BPd8!(RT_CINT%(FX##(V_0f14!) + 1.0))), (2.0))) * A_0fe6!(RT_CINT%(FX##(V_0f04!)), 4) * L_BP178! + L_BP56!   '@51f55 DS:3370,3374
    V_0f14! = FX##(V_0f14!) + 1.0   '@52020 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_51e27   '@52036
L_52043:
L_52048:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@5204d DS:3374
    L_BP17c! = FX##(L_BP17c!) + L_BP56!   '@52079
    RETURN   '@5208e
L_5209d:   ' sub-rotina (alvo de GOSUB)
    V_178c! = 0.0   '@520a2 DS:3378
    L_BP180! = FX##(A_15b0!(0)) - 1.0   '@520b3 DS:337c
    FOR V_1778! = 1.0 TO L_BP180!   '@520d8 DS:3374
    L_BP0e! = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@520e0
    L_BP12! = A_15de!(RT_CINT%(FX##(V_1778!)))   '@52106
    L_BP1a! = FX##(V_1778!) + 1.0   '@5212c DS:3374
    IF NOT (A_15b0!(0) = L_BP1a!) THEN GOTO L_52179   '@52141
    L_BP1a! = 1.0   '@52169 DS:3374
L_52179:
    L_BP16! = A_15b0!(RT_CINT%(FX##(L_BP1a!)))   '@52179
    L_BP1a! = A_15de!(RT_CINT%(FX##(L_BP1a!)))   '@5219e
    IF NOT (ABS(FX##(V_0efc#) - L_BP1a!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP16!) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BP12!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP0e!) < FX##(V_133a!)) THEN GOTO L_52278   '@521c3
    V_178c! = L_BP158!   '@5225f
    GOTO L_5260c   '@52270
L_52278:
    CALL MIXT_0877_Menor(L_BP0e!, L_BP16!, L_BP184!)   '@52278
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP184!) > FX##(V_133a!) + V_0ef4#) THEN GOTO L_522b2   '@52290
    GOTO L_525db   '@522aa
L_522b2:
    CALL MIXT_0877_Menor(L_BP12!, L_BP1a!, L_BP188!)   '@522b2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP18c!)   '@522c9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP18c!) < FX##(V_0efc#) OR FX##(L_BP188!) > FX##(V_0efc#)) THEN GOTO L_5231c   '@522dc
    GOTO L_525db   '@52314
L_5231c:
    CALL MIXT_082a_Maior(L_BP0e!, L_BP16!, L_BP190!)   '@5231c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(V_0ef4#) - V_133a! > FX##(L_BP190!) OR FX##(L_BP12!) <> FX##(V_0efc#)) AND L_BP12! = L_BP1a!) THEN GOTO L_52394   '@52334
    GOTO L_525db   '@5238c
L_52394:
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP194!)   '@52394
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP12!, L_BP1a!, L_BP198!)   '@523ab
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, L_BP16!, L_BP19c!)   '@523bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP19c!) <= FX##(V_0ef4#) AND (FX##(L_BP198!) <= FX##(V_0efc#) AND FX##(L_BP194!) > FX##(V_0efc#))) THEN GOTO L_524ad   '@523d0
    V_178c! = FX##(V_178c!) + 1.0   '@52423 DS:3374
    IF NOT (ABS(FX##(V_0ef4#) - L_BP0e!) < FX##(V_133a!) AND ABS(FX##(L_BP0e!) - L_BP16!) < FX##(V_133a!)) THEN GOTO L_524a0   '@52439
    V_178c! = L_BP158!   '@52487
    GOTO L_5260c   '@52498
L_524a0:
    GOTO L_525db   '@524a0
L_524ad:
    IF NOT (L_BP12! = L_BP1a!) THEN GOTO L_524df   '@524ad
    V_178c! = L_BP158!   '@524c6
    GOTO L_5260c   '@524d7
L_524df:
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP1a0!)   '@524df
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP1a0!) = FX##(V_0efc#)) THEN GOTO L_52514   '@524f7
    GOTO L_525db   '@5250c
L_52514:
    IF NOT (FX##(V_133a!) + V_0ef4# >= L_BP0e! + (FX##(V_0efc#) - L_BP12!) * (FX##(L_BP16!) - L_BP0e!) / (FX##(L_BP1a!) - L_BP12!)) THEN GOTO L_525d6   '@52514
    V_178c! = FX##(V_178c!) + 1.0   '@52558 DS:3374
    IF NOT (ABS(V_0ef4# - (L_BP0e! + (FX##(V_0efc#) - L_BP12!) * (FX##(L_BP16!) - L_BP0e!) / (FX##(L_BP1a!) - L_BP12!))) < FX##(V_133a!)) THEN GOTO L_525d1   '@5256e
    V_178c! = L_BP158!   '@525b8
    GOTO L_5260c   '@525c9
L_525d1:
L_525d6:
L_525db:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@525e0 DS:3374
L_5260c:
    RETURN   '@5260c
L_5261b:   ' sub-rotina (alvo de GOSUB)
    L_BP3e! = -1.0   '@52620 DS:337c
    IF NOT (L_BP62% = 1) THEN GOTO L_52648   '@52630
    RETURN   '@5263e
L_52648:
    L_BP1a4! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@52648
    FOR V_1778! = 1.0 TO L_BP1a4!   '@52678 DS:3374
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@52680
    V_17f0# = A_15de!(RT_CINT%(FX##(V_1778!)))   '@526a7
    V_17f8# = FX##(V_1778!) + 1.0   '@526ce DS:3374
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_17f8#) THEN GOTO L_5272d   '@526e4
    V_17f8# = 1.0#   '@5271c DS:3390
L_5272d:
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_17f8#)))   '@5272d
    V_17f8# = A_15de!(RT_CINT%(FX##(V_17f8#)))   '@52754
    L_BP64% = 1   '@5277b
    GOSUB L_529d0   '@52785
    IF NOT (L_BP3e! <> -1.0) THEN GOTO L_527b4   '@52792 DS:337c
    GOTO L_527e0   '@527ac
L_527b4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@527b4 DS:3374
L_527e0:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0 OR L_BP3e! <> -1.0) THEN GOTO L_52843   '@527e0 DS:3374,337c
    RETURN   '@52839
L_52843:
    L_BP1a8! = FX##(A_15b0!(0)) - 1.0   '@52843 DS:337c
    FOR V_1778! = 1.0 TO L_BP1a8!   '@52868 DS:3374
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_1778!)))   '@52870
    V_17f0# = A_15de!(RT_CINT%(FX##(V_1778!)))   '@52897
    V_17f8# = FX##(V_1778!) + 1.0   '@528be DS:3374
    IF NOT (FX##(A_15b0!(0)) = FX##(V_17f8#)) THEN GOTO L_5290e   '@528d4
    V_17f8# = 1.0#   '@528fd DS:3390
L_5290e:
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_17f8#)))   '@5290e
    V_17f8# = A_15de!(RT_CINT%(FX##(V_17f8#)))   '@52935
    L_BP64% = 2   '@5295c
    GOSUB L_529d0   '@52966
    IF NOT (L_BP3e! <> -1.0) THEN GOTO L_52995   '@52973 DS:337c
    GOTO L_529c1   '@5298d
L_52995:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@52995 DS:3374
L_529c1:
    RETURN   '@529c1
L_529d0:   ' sub-rotina (alvo de GOSUB)
    L_BP1ac! = FX##(V_17e0#) / 1.0#   '@529d5 DS:3390
    L_BP1b0! = FX##(V_17e8#) / 1.0#   '@529ec DS:3390
    CALL MIXT_082a_Maior(L_BP1ac!, L_BP1b0!, L_BP1b4!)   '@529fc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1b8! = FX##(V_16d0#) / 1.0#   '@52a11 DS:3390
    L_BP1bc! = FX##(V_16e0#) / 1.0#   '@52a22 DS:3390
    CALL MIXT_0877_Menor(L_BP1b8!, L_BP1bc!, L_BP1c0!)   '@52a32
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1c4! = FX##(V_17e0#) / 1.0#   '@52a47 DS:3390
    L_BP1c8! = FX##(V_17e8#) / 1.0#   '@52a58 DS:3390
    CALL MIXT_0877_Menor(L_BP1c4!, L_BP1c8!, L_BP1cc!)   '@52a68
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d0! = FX##(V_16d0#) / 1.0#   '@52a7d DS:3390
    L_BP1d4! = FX##(V_16e0#) / 1.0#   '@52a8e DS:3390
    CALL MIXT_082a_Maior(L_BP1d0!, L_BP1d4!, L_BP1d8!)   '@52a9e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1cc! > L_BP1d8! OR L_BP1b4! < L_BP1c0!) THEN GOTO L_52af5   '@52ab3
    RETURN   '@52aeb
L_52af5:
    L_BP1dc! = FX##(V_17f0#) / 1.0#   '@52af5 DS:3390
    L_BP1e0! = FX##(V_17f8#) / 1.0#   '@52b0c DS:3390
    CALL MIXT_082a_Maior(L_BP1dc!, L_BP1e0!, L_BP1e4!)   '@52b1c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1e8! = FX##(V_16d8#) / 1.0#   '@52b31 DS:3390
    L_BP1ec! = FX##(V_16e8#) / 1.0#   '@52b42 DS:3390
    CALL MIXT_0877_Menor(L_BP1e8!, L_BP1ec!, L_BP1f0!)   '@52b52
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1f4! = FX##(V_17f0#) / 1.0#   '@52b67 DS:3390
    L_BP1f8! = FX##(V_17f8#) / 1.0#   '@52b78 DS:3390
    CALL MIXT_0877_Menor(L_BP1f4!, L_BP1f8!, L_BP1fc!)   '@52b88
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP200! = FX##(V_16d8#) / 1.0#   '@52b9d DS:3390
    L_BP204! = FX##(V_16e8#) / 1.0#   '@52bae DS:3390
    CALL MIXT_082a_Maior(L_BP200!, L_BP204!, L_BP208!)   '@52bbe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1fc! > L_BP208! OR L_BP1e4! < L_BP1f0!) THEN GOTO L_52c15   '@52bd3
    RETURN   '@52c0b
L_52c15:
    IF NOT (V_17e0# = V_17e8#) THEN GOTO L_52e92   '@52c15
    IF NOT (V_16d0# <> V_16e0#) THEN GOTO L_52c55   '@52c30
    RETURN   '@52c4b
L_52c55:
    L_BP20c! = FX##(V_17f0#) / 1.0#   '@52c55 DS:3390
    L_BP210! = FX##(V_17f8#) / 1.0#   '@52c6c DS:3390
    CALL MIXT_082a_Maior(L_BP20c!, L_BP210!, L_BP214!)   '@52c7c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP218! = FX##(V_16d8#) / 1.0#   '@52c91 DS:3390
    L_BP21c! = FX##(V_16e8#) / 1.0#   '@52ca2 DS:3390
    CALL MIXT_0877_Menor(L_BP218!, L_BP21c!, L_BP220!)   '@52cb2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP224! = FX##(V_17f0#) / 1.0#   '@52cc7 DS:3390
    L_BP228! = FX##(V_17f8#) / 1.0#   '@52cd8 DS:3390
    CALL MIXT_0877_Menor(L_BP224!, L_BP228!, L_BP22c!)   '@52ce8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP230! = FX##(V_16d8#) / 1.0#   '@52cfd DS:3390
    L_BP234! = FX##(V_16e8#) / 1.0#   '@52d0e DS:3390
    CALL MIXT_082a_Maior(L_BP230!, L_BP234!, L_BP238!)   '@52d1e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP22c! = L_BP238! OR L_BP214! = L_BP220!) THEN GOTO L_52d75   '@52d33
    RETURN   '@52d6b
L_52d75:
L_52d7a:
    IF NOT (L_BP64% = 1) THEN GOTO L_52e6b   '@52d7f
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_52dda   '@52d8d DS:3374
    L_BP3e! = 0.0   '@52dc2 DS:3378
    GOTO L_52e63   '@52dd2
L_52dda:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1778!))) <> 1) THEN GOTO L_52e1c   '@52dda
    L_BP3e! = 0.0   '@52e0c DS:3378
L_52e1c:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1778!))) = 1) THEN GOTO L_52e5e   '@52e1c
    L_BP3e! = 1.0   '@52e4e DS:3374
L_52e5e:
L_52e63:
    GOTO L_52e80   '@52e63
L_52e6b:
    L_BP3e! = 0.5   '@52e6b DS:33a0
L_52e80:
    RETURN   '@52e80
    ' @52e8a (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_5311f   '@52e8a
L_52e92:
    IF NOT (V_16d0# = V_16e0#) THEN GOTO L_52eb7   '@52e92
    RETURN   '@52ead
L_52eb7:
    L_BP23c! = FX##(V_17e0#) / 1.0#   '@52eb7 DS:3390
    L_BP240! = FX##(V_17e8#) / 1.0#   '@52ece DS:3390
    CALL MIXT_082a_Maior(L_BP23c!, L_BP240!, L_BP244!)   '@52ede
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP248! = FX##(V_16d0#) / 1.0#   '@52ef3 DS:3390
    L_BP24c! = FX##(V_16e0#) / 1.0#   '@52f04 DS:3390
    CALL MIXT_0877_Menor(L_BP248!, L_BP24c!, L_BP250!)   '@52f14
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP254! = FX##(V_17e0#) / 1.0#   '@52f29 DS:3390
    L_BP258! = FX##(V_17e8#) / 1.0#   '@52f3a DS:3390
    CALL MIXT_0877_Menor(L_BP254!, L_BP258!, L_BP25c!)   '@52f4a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP260! = FX##(V_16d0#) / 1.0#   '@52f5f DS:3390
    L_BP264! = FX##(V_16e0#) / 1.0#   '@52f70 DS:3390
    CALL MIXT_082a_Maior(L_BP260!, L_BP264!, L_BP268!)   '@52f80
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP25c! = L_BP268! OR L_BP244! = L_BP250!) THEN GOTO L_52fd7   '@52f95
    RETURN   '@52fcd
L_52fd7:
    IF NOT (ABS((FX##(V_16e8#) - V_16d8#) / (FX##(V_16e0#) - V_16d0#) - (FX##(V_17f8#) - V_17f0#) / (FX##(V_17e8#) - V_17e0#)) > FX##(V_133e!)) THEN GOTO L_5302b   '@52fd7
    RETURN   '@53021
L_5302b:
    IF NOT (V_17e0# <> V_16e0# AND V_17e0# <> V_16d0#) THEN GOTO L_530c5   '@5302b
    IF NOT (ABS((FX##(V_16e8#) - V_17f0#) / (FX##(V_16e0#) - V_17e0#) - (FX##(V_17f0#) - V_16d8#) / (FX##(V_17e0#) - V_16d0#)) > FX##(V_133e!)) THEN GOTO L_530bd   '@53069
    RETURN   '@530b3
L_530bd:
    GOTO L_53112   '@530bd
L_530c5:
    IF NOT (V_17f0# <> V_16e8# AND V_17f0# <> V_16d8#) THEN GOTO L_5310d   '@530c5
    RETURN   '@53103
L_5310d:
L_53112:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_52d7a   '@53112
L_5311f:
    RETURN   '@5311f
L_5312e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 050187_FUN_5000_0187
    L_BP5a! = 0.0   '@53133 DS:3378
    L_BP5e! = 0.0   '@53143 DS:3378
    IF NOT (A_1014!(0, 1) = 0.0) THEN GOTO L_5318a   '@53153 DS:3378
    RETURN   '@53180
L_5318a:
    V_0f14! = 1.0   '@5318a DS:3374
    L_BP26c! = A_1014!(0, 1)   '@5319b
    FOR V_0f04! = 1.0 TO L_BP26c!   '@531bf DS:3374
    ERASE L_BP7a!   '@531c6
    ERASE L_BP8c!   '@531d4
    REDIM L_BP7a!(0 TO 50)   '@531de
    REDIM L_BP8c!(0 TO 50)   '@531fb
    L_BP7a!(0) = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + 1.0   '@53214 DS:3374
    L_BP270! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@53251
    FOR V_1778! = 1.0 TO L_BP270!   '@5327c DS:3374
    L_BP7a!(RT_CINT%(FX##(V_1778!))) = A_1014!(RT_CINT%(FX##(V_0f14!) + V_1778! + 1.0), 0)   '@53284 DS:3374
    L_BP8c!(RT_CINT%(FX##(V_1778!))) = A_1014!(RT_CINT%(FX##(V_0f14!) + V_1778! + 1.0), 1)   '@532ce DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@5331a DS:3374
    L_BP7a!(RT_CINT%(FX##(V_1778!))) = L_BP7a!(1)   '@53346
    L_BP8c!(RT_CINT%(FX##(V_1778!))) = L_BP8c!(1)   '@53379
    L_BP46! = 0.0   '@533ae DS:3378
    L_BP274! = FX##(L_BP7a!(0)) - 1.0   '@533be DS:337c
    FOR V_1778! = 1.0 TO L_BP274!   '@533e3 DS:3374
    L_BP46! = (FX##(L_BP7a!(RT_CINT%(FX##(V_1778!)))) + L_BP7a!(RT_CINT%(FX##(V_1778!) + 1.0))) * (FX##(L_BP8c!(RT_CINT%(FX##(V_1778!)))) - L_BP8c!(RT_CINT%(FX##(V_1778!) + 1.0))) / 2.0 + L_BP46!   '@533ea DS:3370,3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@53479 DS:3374
    L_BP46! = ABS(FX##(L_BP46!))   '@534a5
    GOSUB L_53607   '@534b7
    IF NOT (ABS(FX##(L_BP278!)) > FX##(0.0)) THEN GOTO L_53598   '@534c4 DS:3378
    L_BP5a! = ABS(FX##(L_BP278!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) + L_BP5a!   '@534e2 DS:3374
    L_BP5e! = ABS(FX##(L_BP278!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 1) + L_BP5e!   '@5351c DS:3374
    L_BP27c! = ABS(FX##(L_BP278!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) + L_BP27c!   '@53557 DS:3374
L_53598:
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@53598 DS:3370
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@535cc DS:3374
    RETURN   '@535f8
L_53607:   ' sub-rotina (alvo de GOSUB)
    L_BP2e! = FX##(L_BP7a!(1)) + V_133a!   '@5360c
    L_BP32! = FX##(L_BP8c!(1)) + V_133a!   '@5362d
    L_BP36! = FX##(L_BP7a!(1)) - V_133a!   '@5364f
    L_BP3a! = FX##(L_BP8c!(1)) - V_133a!   '@53670
    L_BP280! = FX##(L_BP7a!(0)) - 1.0   '@53692 DS:337c
    FOR V_1778! = 2.0 TO L_BP280!   '@536b7 DS:3370,3374
    L_BP284! = FX##(L_BP2e!) + V_133a!   '@536be
    L_BP288! = L_BP7a!(RT_CINT%(FX##(V_1778!)))   '@536d4
    CALL MIXT_0877_Menor(L_BP284!, L_BP288!, L_BP28c!)   '@536f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(RT_CINT%(FX##(V_1778!))) = L_BP288!   '@5370a
    L_BP2e! = L_BP28c!   '@5372c
    L_BP290! = FX##(L_BP32!) + V_133a!   '@53736
    L_BP294! = L_BP8c!(RT_CINT%(FX##(V_1778!)))   '@5374c
    CALL MIXT_0877_Menor(L_BP290!, L_BP294!, L_BP298!)   '@5376e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8c!(RT_CINT%(FX##(V_1778!))) = L_BP294!   '@53783
    L_BP32! = L_BP298!   '@537a6
    L_BP29c! = FX##(L_BP36!) - V_133a!   '@537b0
    L_BP2a0! = L_BP7a!(RT_CINT%(FX##(V_1778!)))   '@537c6
    CALL MIXT_082a_Maior(L_BP29c!, L_BP2a0!, L_BP2a4!)   '@537e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(RT_CINT%(FX##(V_1778!))) = L_BP2a0!   '@537fc
    L_BP36! = L_BP2a4!   '@5381e
    L_BP2a8! = FX##(L_BP3a!) - V_133a!   '@53828
    L_BP2ac! = L_BP8c!(RT_CINT%(FX##(V_1778!)))   '@5383e
    CALL MIXT_082a_Maior(L_BP2a8!, L_BP2ac!, L_BP2b0!)   '@53860
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8c!(RT_CINT%(FX##(V_1778!))) = L_BP2ac!   '@53875
    L_BP3a! = L_BP2b0!   '@53898
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_1778!   '@538a2 DS:3374
    L_BP278! = 0.0   '@538ce DS:3378
    IF NOT (L_BP36! <= L_BP1e! OR (L_BP2e! >= L_BP26! OR (L_BP3a! <= L_BP22! OR L_BP32! >= L_BP2a!))) THEN GOTO L_53955   '@538df
    RETURN   '@5394b
L_53955:
    ERASE L_BP9e%   '@53955
    REDIM L_BP9e%(0 TO 50)   '@53964
    L_BP158! = 1.0   '@53982 DS:3374
    L_BP2b4! = FX##(L_BP7a!(0)) - 1.0   '@53993 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2b4!   '@539b8 DS:3374
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@539c0
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@539e7
    GOSUB L_5209d   '@53a0f
    IF NOT (FX##(V_178c!) / 2.0 <> RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_53a73   '@53a1c DS:3370
    L_BP9e%(RT_CINT%(FX##(V_0ef0!))) = 1   '@53a53
L_53a73:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@53a73 DS:3374
    ERASE L_BPb4!   '@53a9f
    REDIM L_BPb4!(0 TO 1, 0 TO 1)   '@53aae
    L_BP2b8! = FX##(A_15b0!(0)) - 1.0   '@53ad3 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2b8!   '@53af8 DS:3374
    V_16d0# = A_15b0!(RT_CINT%(FX##(V_0ef0!)))   '@53b00
    V_16d8# = A_15de!(RT_CINT%(FX##(V_0ef0!)))   '@53b27
    V_16e0# = A_15b0!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@53b4e DS:3374
    V_16e8# = A_15de!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@53b7a DS:3374
    L_BP2bc! = FX##(L_BP7a!(0)) - 1.0   '@53ba6 DS:337c
    FOR L_BP68! = 1.0 TO L_BP2bc!   '@53bcb DS:3374
    V_16f0# = L_BP7a!(RT_CINT%(FX##(L_BP68!)))   '@53bd2
    V_16f8# = L_BP8c!(RT_CINT%(FX##(L_BP68!)))   '@53bf8
    V_1700# = L_BP7a!(RT_CINT%(FX##(L_BP68!) + 1.0))   '@53c1f DS:3374
    V_1708# = L_BP8c!(RT_CINT%(FX##(L_BP68!) + 1.0))   '@53c4a DS:3374
    CALL S_2018c   '@53c76
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_16e8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16e0#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16d8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_53d26   '@53c80
    V_0f1c$ = "NAO"   '@53d14 DS:3398
L_53d26:
    IF NOT (ABS(FX##(V_0efc#) - V_1708#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_1700#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16f8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16f0#) < FX##(V_133a!)) THEN GOTO L_53dcc   '@53d26
    V_0f1c$ = "NAO"   '@53dba DS:3398
L_53dcc:
    IF NOT (V_0f1c$ = "") THEN GOTO L_53ea3   '@53dcc DS:33a4
    V_17e0# = V_16f0#   '@53de3
    V_17f0# = V_16f8#   '@53df4
    V_17e8# = V_1700#   '@53e05
    V_17f8# = V_1708#   '@53e16
    L_BP64% = 2   '@53e27
    L_BP3e! = 1.0   '@53e31 DS:3374
    GOSUB L_529d0   '@53e41
    IF NOT (L_BP3e! = 1.0) THEN GOTO L_53e9e   '@53e4e DS:3374
    L_BPb4!(0, 0) = FX##(L_BPb4!(0, 0)) + 1.0   '@53e68 DS:3374
L_53e9e:
L_53ea3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP68!   '@53ea3 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@53ecc DS:3374
    L_BP2c0! = FX##(L_BP7a!(0)) - 1.0   '@53ef8 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2c0!   '@53f1d DS:3374
    L_BPb4!(0, 1) = FX##(L_BP9e%(RT_CINT%(FX##(V_0ef0!)))) + L_BPb4!(0, 1)   '@53f24
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@53f7b DS:3374
    IF NOT (L_BPb4!(0, 0) = 0.0 AND FX##(L_BPb4!(0, 1)) = FX##(L_BP7a!(0)) - 1.0) THEN GOTO L_54039   '@53fa4 DS:3378,337c
    L_BP278! = L_BP46!   '@5401a
    RETURN   '@5402a
L_54039:
    IF NOT (L_BPb4!(0, 0) = 0.0) THEN GOTO L_54484   '@54039 DS:3378
    L_BP2c4! = A_15b0!(0)   '@54064
    L_BP2c8! = L_BP7a!(0)   '@54083
    CALL MIXT_082a_Maior(L_BP2c4!, L_BP2c8!, L_BP2cc!)   '@5409d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(0) = L_BP2c8!   '@540b2
    A_15b0!(0) = L_BP2c4!   '@540cc
    L_BP2d0! = L_BP2cc!   '@540e6
    FOR V_0ef0! = 0.0 TO L_BP2d0!   '@540f2 DS:3374,3378
    SWAP A_15b0!(RT_CINT%(FX##(V_0ef0!))), L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@540fa
    SWAP A_15de!(RT_CINT%(FX##(V_0ef0!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@54136
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@54173 DS:3374
    ERASE L_BP9e%   '@5419f
    REDIM L_BP9e%(0 TO 1)   '@541ae
    L_BP158! = 1.0   '@541cc DS:3374
    L_BP2d4! = FX##(L_BP7a!(0)) - 1.0   '@541dd DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2d4!   '@54202 DS:3374
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@5420a
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@54231
    GOSUB L_5209d   '@54259
    IF NOT (FX##(V_178c!) / 2.0 <> RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_542c2   '@54266 DS:3370
    L_BP9e%(1) = L_BP9e%(1) + 1   '@5429d
L_542c2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@542c2 DS:3374
    IF NOT (L_BP9e%(1) = FX##(L_BP7a!(0)) - 1.0) THEN GOTO L_5433a   '@542ee DS:337c
    L_BP278! = L_BP42!   '@5432a
L_5433a:
    L_BP2d8! = A_15b0!(0)   '@5433a
    L_BP2dc! = L_BP7a!(0)   '@54359
    CALL MIXT_082a_Maior(L_BP2d8!, L_BP2dc!, L_BP2e0!)   '@54373
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(0) = L_BP2dc!   '@54388
    A_15b0!(0) = L_BP2d8!   '@543a2
    L_BP2e4! = L_BP2e0!   '@543bc
    FOR V_0ef0! = 0.0 TO L_BP2e4!   '@543c8 DS:3374,3378
    SWAP A_15b0!(RT_CINT%(FX##(V_0ef0!))), L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@543d0
    SWAP A_15de!(RT_CINT%(FX##(V_0ef0!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@5440c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@54449 DS:3374
    RETURN   '@54475
L_54484:
    ERASE L_BPb4!   '@54484
    REDIM L_BPb4!(0 TO 50, 0 TO 3)   '@54493
    L_BPb4!(0, 0) = FX##(A_15b0!(0)) - 1.0   '@544b8 DS:337c
    L_BP2e8! = FX##(A_15b0!(0)) - 1.0   '@544ec DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2e8!   '@54511 DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0) = A_15b0!(RT_CINT%(FX##(V_0ef0!)))   '@54518
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1) = A_15de!(RT_CINT%(FX##(V_0ef0!)))   '@54559
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2) = A_15b0!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@5459b DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3) = A_15de!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@545df DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@54626 DS:3374
    L_BPb4!(0, 0) = FX##(L_BP7a!(0)) - 1.0 + L_BPb4!(0, 0)   '@54652 DS:337c
    L_BP2ec! = FX##(L_BP7a!(0)) - 1.0   '@5469b DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2ec!   '@546c0 DS:3374
    L_BPb4!(RT_CINT%(FX##(A_15b0!(0)) - 1.0 + V_0ef0!), 0) = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@546c8 DS:337c
    L_BPb4!(RT_CINT%(FX##(A_15b0!(0)) - 1.0 + V_0ef0!), 1) = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@54721 DS:337c
    L_BPb4!(RT_CINT%(FX##(A_15b0!(0)) - 1.0 + V_0ef0!), 2) = L_BP7a!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@5477c DS:3374,337c
    L_BPb4!(RT_CINT%(FX##(A_15b0!(0)) - 1.0 + V_0ef0!), 3) = L_BP8c!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@547d8 DS:3374,337c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@54838 DS:3374
    V_0ef0! = 1.0   '@54864 DS:3374
L_5487a:
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)   '@5487a
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)   '@548a5
    V_16e0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)   '@548d1
    V_16e8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)   '@548fa
    L_BP68! = FX##(V_0ef0!) + 1.0   '@54926 DS:3374
L_54940:
    V_16f0# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)   '@54940
    V_16f8# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)   '@5496a
    V_1700# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)   '@54995
    V_1708# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)   '@549bd
    CALL S_2018c   '@549e8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_16e8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16e0#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16d8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_54b31   '@549f2
    IF NOT (ABS(FX##(V_0efc#) - V_1708#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_1700#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_16f8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_16f0#) < FX##(V_133a!)) THEN GOTO L_54b2c   '@54a86
    V_0f1c$ = "NAO"   '@54b1a DS:3398
L_54b2c:
L_54b31:
    IF NOT (V_0f1c$ = "") THEN GOTO L_5507b   '@54b31 DS:33a4
    V_17e0# = V_16f0#   '@54b48
    V_17f0# = V_16f8#   '@54b59
    V_17e8# = V_1700#   '@54b6a
    V_17f8# = V_1708#   '@54b7b
    L_BP64% = 2   '@54b8c
    L_BP3e! = 1.0   '@54b96 DS:3374
    GOSUB L_529d0   '@54ba6
    IF NOT (L_BP3e! = 1.0) THEN GOTO L_55076   '@54bb3 DS:3374
    IF NOT ((ABS(FX##(V_0efc#) - V_16e8#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_16e0#) > FX##(V_133a!)) AND (ABS(FX##(V_0efc#) - V_16d8#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_16d0#) > FX##(V_133a!))) THEN GOTO L_54e32   '@54bcd
    L_BPb4!(0, 0) = FX##(L_BPb4!(0, 0)) + 1.0   '@54c61 DS:3374
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 0) = V_0ef4#   '@54c97
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 1) = V_0efc#   '@54cd2
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 2) = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)   '@54d0e
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 3) = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)   '@54d5f
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2) = V_0ef4#   '@54db6
    L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3) = V_0efc#   '@54ddf
    V_16e0# = V_0ef4#   '@54e0b
    V_16e8# = V_0efc#   '@54e1c
L_54e32:
    IF NOT ((ABS(FX##(V_0efc#) - V_1708#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_1700#) > FX##(V_133a!)) AND (ABS(FX##(V_0efc#) - V_16f8#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_16f0#) > FX##(V_133a!))) THEN GOTO L_55071   '@54e32
    L_BPb4!(0, 0) = FX##(L_BPb4!(0, 0)) + 1.0   '@54ec6 DS:3374
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 0) = V_0ef4#   '@54efc
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 1) = V_0efc#   '@54f37
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 2) = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)   '@54f73
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0))), 3) = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)   '@54fc3
    L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2) = V_0ef4#   '@55019
    L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3) = V_0efc#   '@55041
L_55071:
L_55076:
L_5507b:
    L_BP68! = FX##(L_BP68!) + 1.0   '@5507b DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < L_BP68!) THEN GOTO L_54940   '@5508f
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@550b9 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) <= V_0ef0!) THEN GOTO L_5487a   '@550cf
    ERASE L_BP9e%   '@550fa
    REDIM L_BP9e%(0 TO 50)   '@55109
    L_BP158! = 1.0   '@55127 DS:3374
    L_BP2f0! = FX##(L_BP7a!(0)) - 1.0   '@55138 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2f0!   '@5515d DS:3374
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@55164
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@5518b
    GOSUB L_5209d   '@551b3
    IF NOT (FX##(V_178c!) / 2.0 <> RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_55217   '@551c0 DS:3370
    L_BP9e%(RT_CINT%(FX##(V_0ef0!))) = 1   '@551f7
L_55217:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@55217 DS:3374
    L_BP2f4! = FX##(L_BP7a!(0)) - 1.0   '@55243 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP2f4!   '@55268 DS:3374
    IF NOT (L_BP9e%(RT_CINT%(FX##(V_0ef0!))) = 0) THEN GOTO L_55463   '@55270
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@55298
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@552bf
    L_BP68! = 1.0   '@552e7 DS:3374
L_552fc:
    IF NOT (ABS(FX##(V_0efc#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) < FX##(V_133a!)) THEN GOTO L_5541b   '@552fc
    GOSUB L_57667   '@55406
    GOTO L_55434   '@55413
L_5541b:
    L_BP68! = FX##(L_BP68!) + 1.0   '@5541b DS:3374
L_55434:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < L_BP68!) THEN GOTO L_552fc   '@55434
L_55463:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@55463 DS:3374
    L_BP2f8! = A_15b0!(0)   '@5548f
    L_BP2fc! = L_BP7a!(0)   '@554ae
    CALL MIXT_082a_Maior(L_BP2f8!, L_BP2fc!, L_BP300!)   '@554c8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(0) = L_BP2fc!   '@554dd
    A_15b0!(0) = L_BP2f8!   '@554f7
    L_BP304! = L_BP300!   '@55511
    FOR V_0ef0! = 0.0 TO L_BP304!   '@5551d DS:3374,3378
    SWAP A_15b0!(RT_CINT%(FX##(V_0ef0!))), L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@55524
    SWAP A_15de!(RT_CINT%(FX##(V_0ef0!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@55560
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@5559d DS:3374
    ERASE L_BP9e%   '@555c9
    REDIM L_BP9e%(0 TO 50)   '@555d8
    L_BP158! = 1.0   '@555f6 DS:3374
    L_BP308! = FX##(L_BP7a!(0)) - 1.0   '@55607 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP308!   '@5562c DS:3374
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@55634
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@5565b
    GOSUB L_5209d   '@55683
    IF NOT (FX##(V_178c!) / 2.0 <> RT_CLNG&(FX##(V_178c!)) \ 2&) THEN GOTO L_556e7   '@55690 DS:3370
    L_BP9e%(RT_CINT%(FX##(V_0ef0!))) = 1   '@556c7
L_556e7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@556e7 DS:3374
    L_BP30c! = FX##(L_BP7a!(0)) - 1.0   '@55713 DS:337c
    FOR V_0ef0! = 1.0 TO L_BP30c!   '@55738 DS:3374
    IF NOT (L_BP9e%(RT_CINT%(FX##(V_0ef0!))) = 0) THEN GOTO L_55933   '@55740
    V_0ef4# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@55768
    V_0efc# = L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@5578f
    L_BP68! = 1.0   '@557b7 DS:3374
L_557cc:
    IF NOT (ABS(FX##(V_0efc#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) < FX##(V_133a!)) THEN GOTO L_558eb   '@557cc
    GOSUB L_57667   '@558d6
    GOTO L_55904   '@558e3
L_558eb:
    L_BP68! = FX##(L_BP68!) + 1.0   '@558eb DS:3374
L_55904:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < L_BP68!) THEN GOTO L_557cc   '@55904
L_55933:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@55933 DS:3374
    L_BP310! = A_15b0!(0)   '@5595f
    L_BP314! = L_BP7a!(0)   '@5597e
    CALL MIXT_082a_Maior(L_BP310!, L_BP314!, L_BP318!)   '@55998
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a!(0) = L_BP314!   '@559ad
    A_15b0!(0) = L_BP310!   '@559c7
    L_BP31c! = L_BP318!   '@559e1
    FOR V_0ef0! = 0.0 TO L_BP31c!   '@559ed DS:3374,3378
    SWAP A_15b0!(RT_CINT%(FX##(V_0ef0!))), L_BP7a!(RT_CINT%(FX##(V_0ef0!)))   '@559f4
    SWAP A_15de!(RT_CINT%(FX##(V_0ef0!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@55a30
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@55a6d DS:3374
    V_0ef0! = 1.0   '@55a99 DS:3374
L_55ab0:
    L_BP68! = FX##(V_0ef0!) + 1.0   '@55ab0 DS:3374
L_55aca:
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!) AND (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) < FX##(V_133a!)))) THEN GOTO L_55c38   '@55aca
    GOTO L_55db3   '@55c30
L_55c38:
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) < FX##(V_133a!) AND (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) < FX##(V_133a!) AND (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!)))) THEN GOTO L_55da6   '@55c38
    GOTO L_55db3   '@55d9e
L_55da6:
    GOTO L_55dca   '@55da6
L_55db3:
    GOSUB L_57667   '@55db8
L_55dca:
    L_BP68! = FX##(L_BP68!) + 1.0   '@55dcf DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < L_BP68!) THEN GOTO L_55aca   '@55de3
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@55e0d DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) <= V_0ef0!) THEN GOTO L_55ab0   '@55e23
    L_BP68! = 1.0   '@55e4e DS:3374
L_55e64:
    V_1784! = 0.0   '@55e64 DS:3378
    V_1788! = 0.0   '@55e75 DS:3378
    V_0ef0! = 1.0   '@55e86 DS:3374
L_55e9c:
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_5601f   '@55e9c
    V_1784! = FX##(V_1784!) + 1.0   '@56004 DS:3374
L_5601f:
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_5619e   '@5601f
    V_1788! = FX##(V_1788!) + 1.0   '@56183 DS:3374
L_5619e:
    IF NOT (V_1788! > 2.0 AND V_1784! > 2.0) THEN GOTO L_561e4   '@5619e DS:3370
    GOTO L_56226   '@561dc
L_561e4:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@561e4 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < V_0ef0!) THEN GOTO L_55e9c   '@561fa
L_56226:
    IF NOT (V_1788! = 1.0 OR (V_1784! = 1.0 OR V_1788! > 2.0 AND V_1784! > 2.0)) THEN GOTO L_56d8f   '@56226 DS:3370,3374
    IF NOT ((ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) >= FX##(V_133a!) OR ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) >= FX##(V_133a!)) AND (V_1788! > 2.0 AND V_1784! > 2.0)) THEN GOTO L_56d7a   '@5629a DS:3370
    V_1778! = 1.0   '@56386 DS:3374
    V_16f0# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)   '@56397
    V_16f8# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)   '@563c1
    V_1700# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)   '@563ec
    V_1708# = L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)   '@56414
L_56444:
    IF NOT (V_1778! <> L_BP68!) THEN GOTO L_566dc   '@56444
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 1)) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(L_BP68!)), 0)) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 0)) < FX##(V_133a!)) THEN GOTO L_566d7   '@5645e
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 0)   '@565c6
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 1)   '@565f1
    V_16e0# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 2)   '@5661d
    V_16e8# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 3)   '@56646
    CALL S_2018c   '@56672
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_16f8#) >= FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_16f0#) >= FX##(V_133a!)) THEN GOTO L_566d2   '@5667c
    GOTO L_5671e   '@566ca
L_566d2:
L_566d7:
L_566dc:
    V_1778! = FX##(V_1778!) + 1.0   '@566dc DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < V_1778!) THEN GOTO L_56444   '@566f2
L_5671e:
    IF NOT (L_BPb4!(0, 0) < V_1778!) THEN GOTO L_56d75   '@5671e
    V_1778! = 1.0   '@56749 DS:3374
L_56760:
    IF NOT (ABS(FX##(V_16f8#) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_16f0#) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_16f0#) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 0)) < FX##(V_133a!) AND (ABS(FX##(V_16f8#) - L_BPb4!(RT_CINT%(FX##(V_1778!)), 1)) < FX##(V_133a!) AND V_1778! <> L_BP68!)) THEN GOTO L_56d05   '@56760
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 0)   '@5688a
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 1)   '@568b5
    IF NOT (ABS(FX##(V_16f8#) - V_16d8#) < FX##(V_133a!) AND ABS(FX##(V_16f0#) - V_16d0#) < FX##(V_133a!)) THEN GOTO L_56989   '@568e1
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 2)   '@5692f
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_1778!)), 3)   '@56958
L_56989:
    V_0ef0! = 1.0   '@56989 DS:3374
L_569a0:
    IF NOT (ABS(FX##(V_1708#) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_1700#) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_1700#) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!) AND (ABS(FX##(V_1708#) - L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND (V_0ef0! <> L_BP68! AND V_0ef0! <> V_1778!))) THEN GOTO L_56cbf   '@569a0
    V_16e0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)   '@56ae5
    V_16e8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)   '@56b10
    IF NOT (ABS(FX##(V_1708#) - V_16e8#) < FX##(V_133a!) AND ABS(FX##(V_1700#) - V_16e0#) < FX##(V_133a!)) THEN GOTO L_56be4   '@56b3c
    V_16e0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)   '@56b8a
    V_16e8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)   '@56bb3
L_56be4:
    IF NOT (ABS(FX##(V_16d8#) - V_16e8#) < FX##(V_133a!) AND ABS(FX##(V_16d0#) - V_16e0#) < FX##(V_133a!)) THEN GOTO L_56cba   '@56be4
    L_BP68! = V_1778!   '@56c32
    GOSUB L_57667   '@56c42
    IF NOT (V_0ef0! > V_1778!) THEN GOTO L_56c80   '@56c4f
    V_0ef0! = FX##(V_0ef0!) - 1.0   '@56c6a DS:337c
L_56c80:
    L_BP68! = V_0ef0!   '@56c80
    GOSUB L_57667   '@56c90
    L_BP68! = 0.0   '@56c9d DS:3378
    GOTO L_56d00   '@56cad
L_56cba:
L_56cbf:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@56cbf DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < V_0ef0!) THEN GOTO L_569a0   '@56cd5
L_56d00:
L_56d05:
    IF NOT (L_BP68! = 0.0) THEN GOTO L_56d27   '@56d05 DS:3378
    GOTO L_56d68   '@56d1f
L_56d27:
    V_1778! = FX##(V_1778!) + 1.0   '@56d27 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < V_1778!) THEN GOTO L_56760   '@56d3d
L_56d68:
    GOTO L_56d94   '@56d68
L_56d75:
L_56d7a:
    GOSUB L_57667   '@56d7a
    GOTO L_56db2   '@56d87
L_56d8f:
L_56d94:
    L_BP68! = FX##(L_BP68!) + 1.0   '@56d99 DS:3374
L_56db2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPb4!(0, 0) < L_BP68!) THEN GOTO L_55e64   '@56db2
    L_BP68! = 1.0   '@56ddc DS:3374
L_56df1:
    V_0ee8! = 0.0   '@56df6 DS:3378
    L_BP320! = L_BPb4!(0, 0)   '@56e07
    FOR V_0ef0! = FX##(L_BP68!) + 1.0 TO L_BP320!   '@56e29 DS:3374
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!)) THEN GOTO L_56ef7   '@56e34
    GOTO L_5704d   '@56eea
L_56ef7:
    IF NOT (ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BPb4!(RT_CINT%(FX##(L_BP68!)), 2)) < FX##(V_133a!)) THEN GOTO L_57040   '@56ef7
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0), L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)   '@56fab
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1), L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)   '@56fed
    GOTO L_5704d   '@57033
L_57040:
    GOTO L_571c0   '@57040
L_5704d:
    IF NOT (FX##(L_BP68!) + 1.0 < FX##(V_0ef0!)) THEN GOTO L_57196   '@57052 DS:3374
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0), L_BPb4!(RT_CINT%(FX##(L_BP68!) + 1.0), 0)   '@57071 DS:3374
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1), L_BPb4!(RT_CINT%(FX##(L_BP68!) + 1.0), 1)   '@570b9 DS:3374
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2), L_BPb4!(RT_CINT%(FX##(L_BP68!) + 1.0), 2)   '@57103 DS:3374
    SWAP L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3), L_BPb4!(RT_CINT%(FX##(L_BP68!) + 1.0), 3)   '@57147 DS:3374
L_57196:
    V_0ee8! = 1.0   '@57196 DS:3374
    L_BP68! = FX##(L_BP68!) + 1.0   '@571a7 DS:3374
L_571c0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@571c5 DS:3374
    IF NOT (L_BPb4!(0, 0) > L_BP68!) THEN GOTO L_57257   '@571f1
    IF NOT (V_0ee8! = 0.0) THEN GOTO L_5724a   '@5721b DS:3378
    L_BP68! = FX##(L_BP68!) + 1.0   '@57236 DS:3374
L_5724a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_56df1   '@5724a
L_57257:
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0)) + 1.0), 0) = L_BPb4!(1, 0)   '@57257 DS:3374
    L_BPb4!(RT_CINT%(FX##(L_BPb4!(0, 0)) + 1.0), 1) = L_BPb4!(1, 1)   '@572aa DS:3374
    L_BP278! = 0.0   '@572fc DS:3378
    V_0ee8! = 1.0   '@5730d DS:3374
    L_BP68! = 0.0   '@5731e DS:3378
    L_BP324! = L_BPb4!(0, 0)   '@5732e
    FOR V_0ef0! = 1.0 TO L_BP324!   '@57350 DS:3374
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!) + 1.0), 0)   '@57358 DS:3374
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!) + 1.0), 1)   '@57388 DS:3374
    IF NOT (L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3) <> L_BPb4!(RT_CINT%(FX##(V_0ef0!) + 1.0), 1) OR L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2) <> L_BPb4!(RT_CINT%(FX##(V_0ef0!) + 1.0), 0)) THEN GOTO L_574c5   '@573b9 DS:3374
    V_16d0# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2)   '@5746b
    V_16d8# = L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3)   '@57494
L_574c5:
    L_BP68! = L_BP68! + (FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 0)) + V_16d0#) * (FX##(L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 1)) - V_16d8#) / 2.0#   '@574c5 DS:33a8
    IF NOT (L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 3) = L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 1) AND L_BPb4!(RT_CINT%(FX##(V_0ef0!)), 2) = L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 0)) THEN GOTO L_57613   '@57528
    L_BP278! = ABS(FX##(L_BP68!)) + L_BP278!   '@575d0
    L_BP68! = 0.0   '@575e8 DS:3378
    V_0ee8! = FX##(V_0ef0!) + 1.0   '@575f8 DS:3374
L_57613:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@57613 DS:3374
    ERASE L_BPb4!   '@5763f
    ERASE L_BP9e%   '@5764e
    RETURN   '@57658
L_57667:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BPb4!(0, 0) > L_BP68!) THEN GOTO L_5781d   '@5766c
    L_BP328! = FX##(L_BPb4!(0, 0)) - 1.0   '@57696 DS:337c
    FOR V_0ee8! = L_BP68! TO L_BP328!   '@576bd DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 0) = L_BPb4!(RT_CINT%(FX##(V_0ee8!) + 1.0), 0)   '@576c4 DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 1) = L_BPb4!(RT_CINT%(FX##(V_0ee8!) + 1.0), 1)   '@5770e DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 2) = L_BPb4!(RT_CINT%(FX##(V_0ee8!) + 1.0), 2)   '@5775a DS:3374
    L_BPb4!(RT_CINT%(FX##(V_0ee8!)), 3) = L_BPb4!(RT_CINT%(FX##(V_0ee8!) + 1.0), 3)   '@577a0 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ee8!   '@577ec DS:3374
L_5781d:
    L_BPb4!(0, 0) = FX##(L_BPb4!(0, 0)) - 1.0   '@5781d DS:337c
    RETURN   '@57853
L_57862:   ' entrada vinda de 050187_FUN_5000_0187
    ERASE L_BPb4!   '@57862
    ERASE L_BP9e%   '@5786c
    ERASE L_BP7a!   '@57876
    ERASE L_BP8c!   '@5787f
    ERASE L_BPc6!   '@57889
    ERASE L_BPd8!   '@57893
    ' END SUB   '@5789d
END SUB

SUB S_578ad   ' entrada de SUB/FUNCTION (B$ENRA, locais 320 bytes) (0x578ad)
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
    REDIM L_BP64!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP76!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP88!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP9a!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BPac%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BPc2!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_5000_78ad @0x578ad  (0578ad_FUN_5000_78ad.lift.txt; evidence_id (assembly): ev_ed36485459ddfe23e0a03a1ae3ea5b3b5180baa17005ee8880c597c1926ee378)
    REDIM L_BP64!(0 TO 1)   '@578c4
    REDIM L_BP76!(0 TO 1)   '@578e1
    REDIM L_BP88!(0 TO 1)   '@578f9
    REDIM L_BP9a!(0 TO 1)   '@57917
    REDIM L_BPac%(0 TO 1)   '@57930
    REDIM L_BPc2!(0 TO 1, 0 TO 1)   '@5794e
    L_BP0e! = A_10cc!(0, 2)   '@5796e
    L_BP12! = A_10cc!(0, 3)   '@5798d
    L_BP16! = A_10cc!(0, 4)   '@579af
    ERASE L_BP64!   '@579d1
    ERASE L_BP76!   '@579df
    REDIM L_BP64!(0 TO CINT(A_160c!(0, 0) * 2.0 + 2.0))   '@579e8 DS:3370
    REDIM L_BP76!(0 TO CINT(A_160c!(0, 0) * 2.0 + 2.0))   '@57a23 DS:3370
    L_BP64!(0) = FX##(A_160c!(0, 0)) * 2.0   '@57a59 DS:3370
    L_BPc6! = A_160c!(0, 0)   '@57a8c
    FOR V_0ef0! = 1.0 TO L_BPc6!   '@57aad DS:3374
    V_0f04! = 2.0 * FX##(V_0ef0!) - 1.0   '@57ab4 DS:3370,337c
    IF NOT (A_160c!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_57bbd   '@57acf DS:3378
    L_BP64!(RT_CINT%(FX##(V_0f04!))) = A_15b0!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@57b03
    L_BP76!(RT_CINT%(FX##(V_0f04!))) = A_15de!(RT_CINT%(ABS(FX##(A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)))))   '@57b5c
    GOTO L_57c43   '@57bb5
L_57bbd:
    L_BP64!(RT_CINT%(FX##(V_0f04!))) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 0)   '@57bbd
    L_BP76!(RT_CINT%(FX##(V_0f04!))) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 1)   '@57bfd
L_57c43:
    L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 2)   '@57c43 DS:3374
    L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0)) = A_160c!(RT_CINT%(FX##(V_0ef0!)), 3)   '@57c86 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@57ccc DS:3374
    ERASE L_BPac%   '@57cf8
    REDIM L_BPac%(0 TO CINT(A_160c!(0, 0)))   '@57d07
    L_BPca! = FX##(A_15b0!(0)) - 1.0   '@57d39 DS:337c
    FOR V_0ef0! = 1.0 TO L_BPca!   '@57d5e DS:3374
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0ef0!))) = 1) THEN GOTO L_58a79   '@57d66
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_0ef0!)))   '@57d98
    V_17f0# = A_15de!(RT_CINT%(FX##(V_0ef0!)))   '@57dbf
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@57de6 DS:3374
    V_17f8# = A_15de!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@57e12 DS:3374
    IF NOT (ABS(FX##(V_17e0#) - V_17e8#) < FX##(V_133a!)) THEN GOTO L_57e7f   '@57e3e
    V_1678# = FX##(V_0e68_pi#) / 2.0#   '@57e61 DS:33a8
    GOTO L_57eae   '@57e77
L_57e7f:
    V_1678# = ATN((FX##(V_17f8#) - V_17f0#) / (FX##(V_17e8#) - V_17e0#))   '@57e7f
L_57eae:
    L_BPce! = L_BP64!(0)   '@57eae
    FOR V_0f04! = 1.0 TO L_BPce! STEP 2.0   '@57ece DS:3370,3374
    IF NOT (L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1) THEN GOTO L_57f18   '@57ed6
    GOTO L_58a43   '@57f10
L_57f18:
    IF NOT (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0))) - V_17f8#) < FX##(V_133a!) AND (ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))) - V_17e8#) < FX##(V_133a!) AND (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!)))) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!)))) - V_17e0#) < FX##(V_133a!)))) THEN GOTO L_5804f   '@57f18 DS:3374
    L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1   '@58014
    GOTO L_58a43   '@58047
L_5804f:
    IF NOT (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0))) - V_17f0#) < FX##(V_133a!) AND (ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))) - V_17e0#) < FX##(V_133a!) AND (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!)))) - V_17f8#) < FX##(V_133a!) AND ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!)))) - V_17e8#) < FX##(V_133a!)))) THEN GOTO L_58186   '@5804f DS:3374
    L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1   '@5814b
    GOTO L_58a43   '@5817e
L_58186:
    IF NOT (ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!)))) - L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_581f8   '@58186 DS:3374
    V_1680# = FX##(V_0e68_pi#) / 2.0#   '@581da DS:33a8
    GOTO L_58289   '@581f0
L_581f8:
    V_1680# = ATN((FX##(L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP76!(RT_CINT%(FX##(V_0f04!)))) / (FX##(L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP64!(RT_CINT%(FX##(V_0f04!)))))   '@581f8 DS:3374
L_58289:
    IF NOT (ABS(FX##(V_1678#) - V_1680#) > FX##(V_133e!)) THEN GOTO L_582b4   '@58289
    GOTO L_58a43   '@582ac
L_582b4:
    L_BPd2! = FX##(V_17f0#) / 1.0#   '@582b4 DS:3390
    L_BPd6! = FX##(V_17f8#) / 1.0#   '@582cb DS:3390
    CALL MIXT_082a_Maior(L_BPd2!, L_BPd6!, L_BPda!)   '@582db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPde! = FX##(V_17f0#) / 1.0#   '@582f0 DS:3390
    L_BPe2! = FX##(V_17f8#) / 1.0#   '@58301 DS:3390
    CALL MIXT_0877_Menor(L_BPde!, L_BPe2!, L_BPe6!)   '@58311
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP76!(RT_CINT%(FX##(V_0f04!))) <= L_BPda! AND (L_BP76!(RT_CINT%(FX##(V_0f04!))) >= L_BPe6! AND (ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!)))) - V_17e0#) < FX##(V_133a!) AND ABS(FX##(V_17e0#) - V_17e8#) < FX##(V_133a!)))) THEN GOTO L_58427   '@58326
    L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1   '@583ec
    GOTO L_58a43   '@5841f
L_58427:
    L_BPea! = FX##(V_17e0#) / 1.0#   '@58427 DS:3390
    L_BPee! = FX##(V_17e8#) / 1.0#   '@5843e DS:3390
    CALL MIXT_082a_Maior(L_BPea!, L_BPee!, L_BPf2!)   '@5844e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf6! = FX##(V_17e0#) / 1.0#   '@58463 DS:3390
    L_BPfa! = FX##(V_17e8#) / 1.0#   '@58474 DS:3390
    CALL MIXT_0877_Menor(L_BPf6!, L_BPfa!, L_BPfe!)   '@58484
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP64!(RT_CINT%(FX##(V_0f04!))) <= L_BPf2! AND (L_BP64!(RT_CINT%(FX##(V_0f04!))) >= L_BPfe! AND (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!)))) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(V_17f0#) - V_17f8#) < FX##(V_133a!)))) THEN GOTO L_5859a   '@58499
    L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1   '@5855f
    GOTO L_58a43   '@58592
L_5859a:
    IF NOT (ABS(FX##(V_17f0#) - V_17f8#) < FX##(V_133a!) OR ABS(FX##(V_17e0#) - V_17e8#) < FX##(V_133a!)) THEN GOTO L_585f0   '@5859a
    GOTO L_58a43   '@585e8
L_585f0:
    L_BP102! = FX##(V_17e0#) / 1.0#   '@585f0 DS:3390
    L_BP106! = FX##(V_17e8#) / 1.0#   '@58607 DS:3390
    CALL MIXT_082a_Maior(L_BP102!, L_BP106!, L_BP10a!)   '@58617
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP10e! = FX##(V_17e0#) / 1.0#   '@5862c DS:3390
    L_BP112! = FX##(V_17e8#) / 1.0#   '@5863d DS:3390
    CALL MIXT_0877_Menor(L_BP10e!, L_BP112!, L_BP116!)   '@5864d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) < L_BP64!(RT_CINT%(FX##(V_0f04!))) AND L_BP64!(RT_CINT%(FX##(V_0f04!))) = L_BP116! OR L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) > L_BP64!(RT_CINT%(FX##(V_0f04!))) AND L_BP64!(RT_CINT%(FX##(V_0f04!))) = L_BP10a!) THEN GOTO L_5876c   '@58662 DS:3374
    GOTO L_58a43   '@58764
L_5876c:
    L_BP11a! = FX##(V_17e0#) / 1.0#   '@5876c DS:3390
    L_BP11e! = FX##(V_17e8#) / 1.0#   '@58783 DS:3390
    CALL MIXT_082a_Maior(L_BP11a!, L_BP11e!, L_BP122!)   '@58793
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP126! = FX##(V_17e0#) / 1.0#   '@587a8 DS:3390
    L_BP12a! = FX##(V_17e8#) / 1.0#   '@587b9 DS:3390
    CALL MIXT_0877_Menor(L_BP126!, L_BP12a!, L_BP12e!)   '@587c9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP64!(RT_CINT%(FX##(V_0f04!))) < L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) AND L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) = L_BP12e! OR L_BP64!(RT_CINT%(FX##(V_0f04!))) > L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) AND L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0)) = L_BP122!) THEN GOTO L_588f2   '@587de DS:3374
    GOTO L_58a43   '@588ea
L_588f2:
    IF NOT (FX##(L_BP64!(RT_CINT%(FX##(V_0f04!)))) <> FX##(V_17e8#)) THEN GOTO L_58987   '@588f2
    V_16a0# = ATN((FX##(V_17f8#) - L_BP76!(RT_CINT%(FX##(V_0f04!)))) / (FX##(V_17e8#) - L_BP64!(RT_CINT%(FX##(V_0f04!)))))   '@58923
    GOTO L_589e8   '@5897f
L_58987:
    V_16a0# = ATN((FX##(V_17f0#) - L_BP76!(RT_CINT%(FX##(V_0f04!)))) / (FX##(V_17e0#) - L_BP64!(RT_CINT%(FX##(V_0f04!)))))   '@58987
L_589e8:
    IF NOT (ABS(FX##(V_1678#) - V_16a0#) < FX##(V_133e!)) THEN GOTO L_58a3e   '@589e8
    L_BPac%(RT_CLNG&(FX##(V_0f04!)) \ 2& + 1&) = 1   '@58a0b
L_58a3e:
L_58a43:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@58a48 DS:3370
L_58a79:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@58a79 DS:3374
    L_BP1a! = 0.0   '@58aa5 DS:3378
    L_BP1e! = 0.0   '@58ab5 DS:3378
    L_BP22! = 0.0   '@58ac5 DS:3378
    L_BP26! = 0.0   '@58ad5 DS:3378
    L_BP2a! = 0.0   '@58ae5 DS:3378
    L_BP2e! = 0.0   '@58af5 DS:3378
    L_BP32! = 0.0   '@58b05 DS:3378
    L_BP132! = A_109e%(RT_CINT%(FX##(V_177c!)), 0) - 1   '@58b15
    FOR V_0f10! = 1.0 TO L_BP132!   '@58b45 DS:3374
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_0f10!))) = 1) THEN GOTO L_58b86   '@58b4c
    GOTO L_592cc   '@58b7e
L_58b86:
    IF NOT (A_163a!(RT_CINT%(FX##(V_0f10!)), 0) = -100.0) THEN GOTO L_58bc2   '@58b86 DS:33b0
    GOTO L_592cc   '@58bba
L_58bc2:
    V_17e0# = A_15b0!(RT_CINT%(FX##(V_0f10!)))   '@58bc2
    V_17f0# = A_15de!(RT_CINT%(FX##(V_0f10!)))   '@58be9
    V_1788! = FX##(V_0f10!) + 1.0   '@58c10 DS:3374
L_58c2b:
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1788!) THEN GOTO L_58c79   '@58c30
    V_1788! = 1.0   '@58c68 DS:3374
L_58c79:
    IF NOT (A_163a!(RT_CINT%(FX##(V_1788!)), 0) = -100.0) THEN GOTO L_58ccb   '@58c79 DS:33b0
    V_1788! = FX##(V_1788!) + 1.0   '@58cad DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_58c2b   '@58cc3
L_58ccb:
    V_17e8# = A_15b0!(RT_CINT%(FX##(V_1788!)))   '@58ccb
    V_17f8# = A_15de!(RT_CINT%(FX##(V_1788!)))   '@58cf2
    GOSUB L_5941c   '@58d19
    GOSUB L_5adfd   '@58d26
    IF NOT (L_BPc2!(1, 0) = 0.0 AND L_BP88!(1) < L_BP88!(2)) THEN GOTO L_58db3   '@58d33 DS:3378
    L_BP1a! = FX##(L_BP1a!) + L_BP36!   '@58da0
L_58db3:
    IF NOT (L_BPc2!(RT_CINT%(FX##(V_0ef0!) - 1.0), 0) = 0.0 AND L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0)) < L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_58e58   '@58db3 DS:3378,337c
    L_BP1a! = FX##(L_BP1a!) + L_BP3a!   '@58e45
L_58e58:
    L_BP1a! = FX##(L_BP1a!) + L_BP3e!   '@58e58
    IF NOT (L_BP88!(1) < L_BP88!(2)) THEN GOTO L_58ec8   '@58e6b
    L_BP1e! = RT_POT##((FX##(L_BP46!)), (2.0)) * L_BP36! / 2.0 + L_BP1e!   '@58ea0 DS:3370
L_58ec8:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0)) < L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_58f3e   '@58ec8 DS:337c
    L_BP1e! = RT_POT##((FX##(L_BP4a!)), (2.0)) * L_BP3a! / 2.0 + L_BP1e!   '@58f16 DS:3370
L_58f3e:
    IF NOT (L_BP42! > 0.0) THEN GOTO L_58f70   '@58f3e DS:3378
    L_BP1e! = FX##(L_BP42!) / 2.0 + L_BP1e!   '@58f58 DS:3370
L_58f70:
    L_BP2a! = FX##(L_BP2a!) + L_BP4e!   '@58f70
    L_BP2e! = FX##(L_BP2e!) + L_BP52!   '@58f83
    IF NOT (L_BP88!(2) > L_BP88!(1)) THEN GOTO L_59037   '@58f96
    V_16a0# = ATN((FX##(L_BP9a!(1)) - L_BP9a!(2)) / (FX##(L_BP88!(2)) - L_BP88!(1)))   '@58fce
    GOTO L_590aa   '@5902f
L_59037:
    V_16a0# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(1)) - L_BP88!(2)) / (FX##(L_BP9a!(1)) - L_BP9a!(2)))   '@59037 DS:33a8
L_590aa:
    IF NOT (L_BPc2!(1, 0) = 0.0 AND L_BP88!(1) < L_BP88!(2)) THEN GOTO L_59178   '@590aa DS:3378
    L_BP22! = L_BP22! + (FX##(L_BP88!(2)) - L_BP88!(1)) * (1.0# - RT_SIN##(FX##(V_16a0#))) / (RT_SIN##(FX##(V_16a0#)) + 1.13999998569488525390625##)   '@59117 DS:3390,33b4
L_59178:
    IF NOT (L_BP88!(1) < L_BP88!(2)) THEN GOTO L_59226   '@59178
    L_BP26! = L_BP26! + (FX##(L_BP88!(2)) - L_BP88!(1)) * RT_POT##((FX##(L_BP46!)), (2.0)) * (1.0# - RT_SIN##(FX##(V_16a0#))) / (RT_SIN##(FX##(V_16a0#)) * 5.0# + 1.13999998569488525390625##)   '@591ad DS:3370,3390,33b4,33bc
L_59226:
    L_BP32! = L_BP32! + RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) - A_15b0!(RT_CINT%(FX##(V_1788!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) - A_15de!(RT_CINT%(FX##(V_1788!)))), (2.0))) * V_0ef4#   '@59226 DS:3370
L_592cc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@592d1 DS:3374
    V_0ef0! = FX##(L_BP0e!) + L_BP12!   '@592fd
    A_10cc!(0, 2) = 0.0   '@59311 DS:3378
    IF NOT (L_BP2e! < 0.0) THEN GOTO L_5935b   '@59331 DS:3378
    L_BP2e! = 0.0   '@5934b DS:3378
L_5935b:
    A_1210!(0, 1) = (FX##(L_BP1a!) + L_BP32! + ((1.0 + FX##(V_0f82!)) * L_BP2a! - FX##(L_BP22!) * 2.0)) / (FX##(L_BP1e!) / 3.0 + (L_BP2e! - FX##(L_BP26!) / 3.0))   '@5935b DS:3370,3374,33c4
    IF NOT (L_BP1a! = 0.0) THEN GOTO L_5940f   '@593bd DS:3378
    A_1210!(0, 1) = -A_1210!(0, 1)   '@593d7
L_5940f:
    GOTO L_5ce57   '@5940f
    ' ---- F_59417 @0x59417  (059417_F_59417.lift.txt; evidence_id (assembly): ev_aa7facd215f35273ae72e48334ffe81a27197cfc2d0768b369dbfbd3f00db45b)
L_5941c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0578ad_FUN_5000_78ad
    L_BP136! = L_BP64!(0)   '@59421
    FOR V_0f14! = 1.0 TO L_BP136! STEP 2.0   '@59441 DS:3370,3374
    IF NOT (-A_160c!(RT_CINT%((FX##(V_0f14!) + 1.0) / 2.0), 0) = V_0f10!) THEN GOTO L_594ee   '@59448 DS:3370,3374
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@59489 DS:3374
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@594b5 DS:3374
    GOTO L_5951a   '@594e1
L_594ee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@594ee DS:3370
L_5951a:
    IF NOT (L_BP64!(0) < V_0f14!) THEN GOTO L_5979d   '@5951a
    L_BP13a! = L_BP64!(0)   '@59543
    FOR V_0f14! = 1.0 TO L_BP13a! STEP 2.0   '@59563 DS:3370,3374
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f14!)))   '@5956a
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f14!)))   '@59591
    IF NOT (ABS(FX##(V_0efc#) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_17e0#) < FX##(V_133a!)) THEN GOTO L_5966b   '@595b8
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@59606 DS:3374
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@59632 DS:3374
    GOTO L_59798   '@5965e
L_5966b:
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@5966b DS:3374
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@59697 DS:3374
    IF NOT (ABS(FX##(V_0efc#) - V_17f0#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_17e0#) < FX##(V_133a!)) THEN GOTO L_5976c   '@596c3
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f14!)))   '@59711
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f14!)))   '@59738
    GOTO L_59798   '@5975f
L_5976c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@5976c DS:3370
L_59798:
L_5979d:
    ERASE L_BP88!   '@5979d
    ERASE L_BP9a!   '@597ac
    REDIM L_BP88!(0 TO 50)   '@597b6
    REDIM L_BP9a!(0 TO 50)   '@597d4
    ERASE L_BPc2!   '@597ed
    REDIM L_BPc2!(0 TO 50, 0 TO 0)   '@597fc
    L_BP88!(0) = 2.0   '@5981e DS:3370
    L_BP88!(1) = V_17e0#   '@5983e
    L_BP9a!(1) = V_17f0#   '@5985c
    L_BP88!(2) = V_0ef4#   '@5987a
    L_BP9a!(2) = V_0efc#   '@5989b
    IF NOT (L_BPac%(RT_CLNG&(FX##(V_0f14!)) \ 2& + 1&) = 1) THEN GOTO L_5991a   '@598bc
    L_BPc2!(1, 0) = 1.0   '@598f6 DS:3374
L_5991a:
    V_1778! = 1.0   '@5991a DS:3374
L_59930:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_1778!))) = L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) THEN GOTO L_59a0a   '@59935 DS:3374
    V_16a8# = FX##(V_0e68_pi#) / 2.0#   '@59983 DS:33a8
    IF NOT (L_BP9a!(RT_CINT%(FX##(V_1778!))) > L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) THEN GOTO L_59a02   '@59999 DS:3374
    V_16a8# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@599e7 DS:33a8,33c8
L_59a02:
    GOTO L_59f0b   '@59a02
L_59a0a:
    IF NOT (L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0)) >= L_BP9a!(RT_CINT%(FX##(V_1778!))) AND L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)) > L_BP88!(RT_CINT%(FX##(V_1778!)))) THEN GOTO L_59b40   '@59a0a DS:3374
    V_16a8# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP88!(RT_CINT%(FX##(V_1778!)))))   '@59ab0 DS:3374
L_59b40:
    IF NOT (L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0)) > L_BP9a!(RT_CINT%(FX##(V_1778!))) AND L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)) < L_BP88!(RT_CINT%(FX##(V_1778!)))) THEN GOTO L_59c83   '@59b40 DS:3374
    V_16a8# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) / (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))))   '@59be6 DS:3374,33a8
L_59c83:
    IF NOT (L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0)) <= L_BP9a!(RT_CINT%(FX##(V_1778!))) AND L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)) < L_BP88!(RT_CINT%(FX##(V_1778!)))) THEN GOTO L_59dbe   '@59c83 DS:3374
    V_16a8# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)))) + V_0e68_pi#   '@59d29 DS:3374
L_59dbe:
    IF NOT (L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0)) < L_BP9a!(RT_CINT%(FX##(V_1778!))) AND L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)) > L_BP88!(RT_CINT%(FX##(V_1778!)))) THEN GOTO L_59f06   '@59dbe DS:3374
    V_16a8# = 3.0# * FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP88!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))))   '@59e64 DS:3374,33a8,33c8
L_59f06:
L_59f0b:
    L_BP13e! = -1.0   '@59f0b DS:337c
    L_BP142! = L_BP64!(0)   '@59f1c
    FOR V_0f04! = 1.0 TO L_BP142! STEP 2.0   '@59f3c DS:3370,3374
    IF NOT (V_0f04! = V_0f14!) THEN GOTO L_59f67   '@59f44
    GOTO L_5aba3   '@59f5f
L_59f67:
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f04!)))   '@59f67
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f04!)))   '@59f8e
    IF NOT (ABS(FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_5a04b   '@59fb5 DS:3374
    GOTO L_5a11e   '@5a043
L_5a04b:
    IF NOT (ABS(FX##(L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_5a111   '@5a04b DS:3374
    GOTO L_5a11e   '@5a109
L_5a111:
    GOTO L_5aba3   '@5a111
L_5a11e:
    IF NOT (ABS(FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_5a20e   '@5a123 DS:3374
    V_0ef4# = L_BP64!(RT_CINT%(FX##(V_0f04!) + 1.0))   '@5a1b1 DS:3374
    V_0efc# = L_BP76!(RT_CINT%(FX##(V_0f04!) + 1.0))   '@5a1dd DS:3374
L_5a20e:
    IF NOT (ABS(FX##(V_0efc#) - V_17f8#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_17e8#) < FX##(V_133a!)) THEN GOTO L_5a29c   '@5a20e
    V_16d0# = V_17e8#   '@5a25c
    V_16d8# = V_17f8#   '@5a26d
    L_BP13e! = V_0f04!   '@5a27e
    GOTO L_5abd4   '@5a28f
L_5a29c:
    IF NOT (FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) = FX##(V_0ef4#)) THEN GOTO L_5a343   '@5a29c DS:3374
    V_16b0# = FX##(V_0e68_pi#) / 2.0#   '@5a2d3 DS:33a8
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) > FX##(V_0efc#)) THEN GOTO L_5a33b   '@5a2e9 DS:3374
    V_16b0# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@5a320 DS:33a8,33c8
L_5a33b:
    GOTO L_5a6e0   '@5a33b
L_5a343:
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) <= FX##(V_0efc#) AND FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_0ef4#)) THEN GOTO L_5a423   '@5a343 DS:3374
    V_16b0# = ATN((FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) / (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))))   '@5a3bb DS:3374
L_5a423:
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_0efc#) AND FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) > FX##(V_0ef4#)) THEN GOTO L_5a50d   '@5a423 DS:3374
    V_16b0# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) - V_0ef4#) / (FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))))   '@5a49b DS:3374,33a8
L_5a50d:
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) >= FX##(V_0efc#) AND FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) > FX##(V_0ef4#)) THEN GOTO L_5a5ec   '@5a50d DS:3374
    V_16b0# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) - V_0efc#) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) - V_0ef4#)) + V_0e68_pi#   '@5a585 DS:3374
L_5a5ec:
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) > FX##(V_0efc#) AND FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) < FX##(V_0ef4#)) THEN GOTO L_5a6db   '@5a5ec DS:3374
    V_16b0# = 3.0# * FX##(V_0e68_pi#) / 2.0# + ATN((FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) / (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) - V_0efc#))   '@5a664 DS:3374,33a8,33c8
L_5a6db:
L_5a6e0:
    IF NOT (FX##(V_0e68_pi#) / 2.0# > FX##(V_16a8#) AND V_16a8# >= 0.0#) THEN GOTO L_5a7b1   '@5a6e0 DS:33a8,33d0
    IF NOT (FX##(V_0e68_pi#) + V_16a8# > FX##(V_16b0#) AND V_16b0# >= 0.0#) THEN GOTO L_5a789   '@5a723 DS:33d0
    L_BP146! = FX##(V_0e68_pi#) - V_16a8# + V_16b0#   '@5a766
    GOTO L_5a7ac   '@5a781
L_5a789:
    L_BP146! = V_16b0# - (FX##(V_16a8#) + V_0e68_pi#)   '@5a789
L_5a7ac:
L_5a7b1:
    IF NOT (V_16a8# < V_0e68_pi# AND FX##(V_0e68_pi#) / 2.0# <= FX##(V_16a8#)) THEN GOTO L_5a882   '@5a7b1 DS:33a8
    IF NOT (FX##(V_0e68_pi#) + V_16a8# > FX##(V_16b0#) AND V_16b0# >= 0.0#) THEN GOTO L_5a85a   '@5a7f4 DS:33d0
    L_BP146! = FX##(V_0e68_pi#) - V_16a8# + V_16b0#   '@5a837
    GOTO L_5a87d   '@5a852
L_5a85a:
    L_BP146! = V_16b0# - (FX##(V_16a8#) + V_0e68_pi#)   '@5a85a
L_5a87d:
L_5a882:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(V_16a8#) AND V_16a8# >= V_0e68_pi#) THEN GOTO L_5a96a   '@5a882 DS:33a8,33c8
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(V_16b0#) AND FX##(V_16a8#) - V_0e68_pi# <= FX##(V_16b0#)) THEN GOTO L_5a938   '@5a8ca DS:33a8
    L_BP146! = V_16b0# - (FX##(V_16a8#) - V_0e68_pi#)   '@5a912
    GOTO L_5a965   '@5a930
L_5a938:
    L_BP146! = 2.0# * FX##(V_0e68_pi#) - (FX##(V_16a8#) - V_0e68_pi#) + V_16b0#   '@5a938 DS:33a8
L_5a965:
L_5a96a:
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(V_16a8#) AND 3.0# * FX##(V_0e68_pi#) / 2.0# <= FX##(V_16a8#)) THEN GOTO L_5aa57   '@5a96a DS:33a8,33c8
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(V_16b0#) AND FX##(V_16a8#) - V_0e68_pi# <= FX##(V_16b0#)) THEN GOTO L_5aa25   '@5a9b7 DS:33a8
    L_BP146! = V_16b0# - (FX##(V_16a8#) - V_0e68_pi#)   '@5a9ff
    GOTO L_5aa52   '@5aa1d
L_5aa25:
    L_BP146! = 2.0# * FX##(V_0e68_pi#) - (FX##(V_16a8#) - V_0e68_pi# - V_16b0#)   '@5aa25 DS:33a8
L_5aa52:
L_5aa57:
    IF NOT (ABS(FX##(V_16b0#) - V_16a8# - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_5aa90   '@5aa57
    L_BP146! = V_0e68_pi#   '@5aa7f
L_5aa90:
    IF NOT (FX##(L_BP146!) >= 2.0# * FX##(V_0e68_pi#)) THEN GOTO L_5aace   '@5aa90 DS:33a8
    L_BP146! = L_BP146! - 2.0# * FX##(V_0e68_pi#)   '@5aab0 DS:33a8
L_5aace:
    IF NOT (L_BP13e! = -1.0) THEN GOTO L_5ab35   '@5aace DS:337c
    V_16d0# = V_0ef4#   '@5aae9
    V_16d8# = V_0efc#   '@5aafa
    V_16a0# = L_BP146!   '@5ab0b
    L_BP13e! = V_0f04!   '@5ab1c
    GOTO L_5ab9e   '@5ab2d
L_5ab35:
    IF NOT (FX##(L_BP146!) > FX##(V_16a0#)) THEN GOTO L_5ab99   '@5ab35
    V_16d0# = V_0ef4#   '@5ab50
    V_16d8# = V_0efc#   '@5ab61
    V_16a0# = L_BP146!   '@5ab72
    L_BP13e! = V_0f04!   '@5ab83
L_5ab99:
L_5ab9e:
L_5aba3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@5aba8 DS:3370
L_5abd4:
    L_BP88!(RT_CINT%(FX##(V_1778!) + 2.0)) = V_16d0#   '@5abd4 DS:3370
    L_BP9a!(RT_CINT%(FX##(V_1778!) + 2.0)) = V_16d8#   '@5ac01 DS:3370
    IF NOT (L_BPac%(RT_CLNG&(FX##(L_BP13e!)) \ 2& + 1&) = 1) THEN GOTO L_5ac98   '@5ac2e
    L_BPc2!(RT_CINT%(FX##(V_1778!) + 1.0), 0) = 1.0   '@5ac68 DS:3374
L_5ac98:
    L_BP88!(0) = FX##(L_BP88!(0)) + 1.0   '@5ac98 DS:3374
    IF NOT (V_16d8# = V_17f8# AND V_16d0# = V_17e8#) THEN GOTO L_5adba   '@5accc
    L_BP88!(RT_CINT%(FX##(V_1778!) + 3.0)) = L_BP88!(1)   '@5ad0a DS:33c4
    L_BP9a!(RT_CINT%(FX##(V_1778!) + 3.0)) = L_BP9a!(1)   '@5ad44 DS:33c4
    L_BP88!(0) = FX##(L_BP88!(0)) + 1.0   '@5ad7e DS:3374
    GOTO L_5adee   '@5adb2
L_5adba:
    V_1778! = FX##(V_1778!) + 1.0   '@5adba DS:3374
    V_0f14! = L_BP13e!   '@5add0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_59930   '@5ade1
L_5adee:
    RETURN   '@5adee
L_5adfd:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0578ad_FUN_5000_78ad
    V_0ef0! = FX##(L_BP88!(0)) - 1.0   '@5ae02 DS:337c
    IF NOT (L_BP9a!(1) <= L_BP9a!(RT_CINT%(FX##(V_0ef0!))) AND L_BP88!(1) < L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5af15   '@5ae27
    V_16a0# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(1)) / (FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(1)))   '@5aea9
L_5af15:
    IF NOT (L_BP9a!(1) < L_BP9a!(RT_CINT%(FX##(V_0ef0!))) AND L_BP88!(1) >= L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5b013   '@5af15
    V_16a0# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_0ef0!)))) / (FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(1)))   '@5af97 DS:33a8
L_5b013:
    IF NOT (L_BP9a!(1) >= L_BP9a!(RT_CINT%(FX##(V_0ef0!))) AND L_BP88!(1) > L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5b109   '@5b013
    V_16a0# = ATN((FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) / (FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_0ef0!))))) + V_0e68_pi#   '@5b095
L_5b109:
    IF NOT (L_BP9a!(1) > L_BP9a!(RT_CINT%(FX##(V_0ef0!))) AND L_BP88!(1) <= L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5b209   '@5b109
    V_16a0# = 3.0# * FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(1)) / (FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_0ef0!)))))   '@5b18b DS:33a8,33c8
L_5b209:
    L_BP14a! = L_BP88!(0)   '@5b209
    FOR V_0f04! = 1.0 TO L_BP14a!   '@5b22a DS:3374
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0f04!))) * RT_COS##(FX##(-V_16a0#)) - L_BP9a!(RT_CINT%(FX##(V_0f04!))) * RT_SIN##(FX##(-V_16a0#))   '@5b232
    V_0efc# = L_BP88!(RT_CINT%(FX##(V_0f04!))) * RT_SIN##(FX##(-V_16a0#)) + L_BP9a!(RT_CINT%(FX##(V_0f04!))) * RT_COS##(FX##(-V_16a0#))   '@5b29d
    L_BP88!(RT_CINT%(FX##(V_0f04!))) = V_0ef4#   '@5b308
    L_BP9a!(RT_CINT%(FX##(V_0f04!))) = V_0efc#   '@5b330
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@5b358 DS:3374
    L_BP36! = FX##(L_BP88!(2)) - L_BP88!(1)   '@5b384
    L_BP46! = FX##(L_BP9a!(1)) - L_BP9a!(2)   '@5b3b3
    IF NOT (L_BP88!(2) > L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5b4e9   '@5b3e5
    L_BP36! = FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(1)   '@5b427
    L_BP46! = (FX##(L_BP9a!(1)) - L_BP9a!(2)) * (FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_0ef0!)))) / (FX##(L_BP88!(1)) - L_BP88!(2))   '@5b45d
L_5b4e9:
    L_BP3a! = FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0))   '@5b4e9 DS:337c
    L_BP4a! = FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(RT_CINT%(FX##(V_0ef0!) - 1.0))   '@5b531 DS:337c
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0)) < L_BP88!(1)) THEN GOTO L_5b6b1   '@5b579 DS:337c
    L_BP3a! = FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(1)   '@5b5bd
    L_BP4a! = (FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_0ef0!)))) * (FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(RT_CINT%(FX##(V_0ef0!) - 1.0))) / (FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0))) - L_BP88!(RT_CINT%(FX##(V_0ef0!))))   '@5b5f3 DS:337c
L_5b6b1:
    V_0f04! = 2.0   '@5b6b1 DS:3370
    L_BP3e! = 0.0   '@5b6c2 DS:3378
    L_BP42! = 0.0   '@5b6d2 DS:3378
    L_BP4e! = 0.0   '@5b6e2 DS:3378
    L_BP52! = 0.0   '@5b6f2 DS:3378
L_5b708:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0f04!))) < L_BP88!(1)) THEN GOTO L_5b760   '@5b708
    V_0f04! = FX##(V_0f04!) + 1.0   '@5b742 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5b708   '@5b758
L_5b760:
    IF NOT (V_0f04! < V_0ef0! AND V_0f04! > 2.0) THEN GOTO L_5bb35   '@5b760 DS:3370
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0f04!))) <= L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5b83f   '@5b79e
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0f04!)))   '@5b7e7
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_0f04!)))   '@5b80f
    GOTO L_5b956   '@5b837
L_5b83f:
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0ef0!)))   '@5b83f
    V_0efc# = (FX##(L_BP9a!(RT_CINT%(FX##(V_0f04!) - 1.0))) - L_BP9a!(RT_CINT%(FX##(V_0f04!)))) * (FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) - L_BP88!(RT_CINT%(FX##(V_0f04!) - 1.0))) / (FX##(L_BP88!(RT_CINT%(FX##(V_0f04!)))) - L_BP88!(RT_CINT%(FX##(V_0f04!) - 1.0))) + L_BP9a!(RT_CINT%(FX##(V_0f04!) - 1.0))   '@5b867 DS:337c
L_5b956:
    V_17f0# = (FX##(L_BP9a!(RT_CINT%(FX##(V_0f04!) - 1.0))) - L_BP9a!(RT_CINT%(FX##(V_0f04!)))) * (FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_0f04!) - 1.0))) / (FX##(L_BP88!(RT_CINT%(FX##(V_0f04!)))) - L_BP88!(RT_CINT%(FX##(V_0f04!) - 1.0))) + L_BP9a!(RT_CINT%(FX##(V_0f04!) - 1.0))   '@5b956 DS:337c
    IF NOT (L_BPc2!(1, 0) = 0.0) THEN GOTO L_5ba8d   '@5ba33 DS:3378
    L_BP3e! = L_BP3e! + (FX##(V_0ef4#) - L_BP88!(1))   '@5ba61
L_5ba8d:
    L_BP42! = L_BP42! + (FX##(V_0ef4#) - L_BP88!(1)) * (RT_POT##((FX##(L_BP9a!(1)) - V_17f0#), (2.0#)) + (FX##(L_BP9a!(1)) - V_0efc#) * (FX##(L_BP9a!(1)) - V_17f0#) + RT_POT##((FX##(L_BP9a!(1)) - V_0efc#), (2.0#)))   '@5ba8d DS:33a8
L_5bb35:
    IF NOT (V_0f04! > 2.0) THEN GOTO L_5c13f   '@5bb35 DS:3370
    V_1778! = 2.0   '@5bb50 DS:3370
L_5bb66:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0)) < L_BP88!(1)) THEN GOTO L_5bc0c   '@5bb66 DS:3374
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))   '@5bbaa DS:3374
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))   '@5bbd7 DS:3374
    GOTO L_5bcfe   '@5bc04
L_5bc0c:
    V_0ef4# = L_BP88!(1)   '@5bc0c
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_1778!))) + (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!) + 1.0))) - L_BP88!(RT_CINT%(FX##(V_1778!)))) * (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!))))   '@5bc2a DS:3374
L_5bcfe:
    IF NOT (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) <> FX##(V_0ef4#)) THEN GOTO L_5be33   '@5bcfe
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) > FX##(V_0efc#)) THEN GOTO L_5bdc8   '@5bd30
    V_16a0# = -ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) - V_0efc#) / (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!)))))   '@5bd62
    GOTO L_5be2b   '@5bdc0
L_5bdc8:
    V_16a0# = ATN((FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!)))))   '@5bdc8
L_5be2b:
    GOTO L_5be49   '@5be2b
L_5be33:
    V_16a0# = 0.0#   '@5be33 DS:33d0
L_5be49:
    V_16a8# = ATN((FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(1)) - L_BP88!(RT_CINT%(FX##(V_1778!)))))   '@5be49
    IF NOT (L_BPc2!(1, 0) = 0.0 AND V_1778! = 2.0) THEN GOTO L_5bf5a   '@5beb8 DS:3370,3378
    L_BP4e! = L_BP4e! + (FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / RT_TAN##(FX##(V_16a8#))   '@5bf0b
L_5bf5a:
    L_BP52! = L_BP52! + RT_POT##((FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_1778!)))), (3.0)) / 6.0 * (1.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16a8#))) * (2.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16a8#))) / RT_TAN##(FX##(V_16a8#))   '@5bf5a DS:3390,33a8,33c4,33d8
    IF NOT (FX##(L_BP88!(1)) > FX##(V_0ef4#)) THEN GOTO L_5c109   '@5c006
    V_16b0# = ATN((FX##(L_BP9a!(1)) - V_0efc#) / (FX##(L_BP88!(1)) - V_0ef4#))   '@5c02e
    L_BP52! = L_BP52! - RT_POT##((FX##(L_BP9a!(1)) - V_0efc#), (3.0#)) * (1.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16b0#))) * (2.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16b0#))) / (RT_TAN##(FX##(V_16b0#)) * 6.0#)   '@5c06f DS:3390,33a8,33c8,33dc
L_5c109:
    V_1778! = FX##(V_1778!) + 1.0   '@5c109 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_1778! >= V_0f04!) THEN GOTO L_5bb66   '@5c11f
L_5c13f:
L_5c144:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0f04!))) < L_BP88!(RT_CINT%(FX##(V_0ef0!))) AND FX##(V_0f04!) + 1.0 <= FX##(V_0ef0!) - 1.0) THEN GOTO L_5c4c8   '@5c145 DS:3374,337c
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0f04!) + 1.0)) < L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5c267   '@5c1b7 DS:3374
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0f04!) + 1.0))   '@5c205 DS:3374
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_0f04!) + 1.0))   '@5c232 DS:3374
    GOTO L_5c363   '@5c25f
L_5c267:
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0ef0!)))   '@5c267
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_0f04!))) + (FX##(L_BP9a!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP9a!(RT_CINT%(FX##(V_0f04!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP88!(RT_CINT%(FX##(V_0f04!)))) * (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_0f04!))))   '@5c28f DS:3374
L_5c363:
    IF NOT (L_BPc2!(RT_CINT%(FX##(V_0f04!)), 0) = 0.0) THEN GOTO L_5c3ce   '@5c363 DS:3378
    L_BP3e! = L_BP3e! + (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_0f04!))))   '@5c398
L_5c3ce:
    L_BP42! = L_BP42! + (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_0f04!)))) * (RT_POT##((FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_0f04!)))), (2.0)) + (FX##(L_BP9a!(1)) - L_BP9a!(RT_CINT%(FX##(V_0f04!)))) * (FX##(L_BP9a!(1)) - V_0efc#) + RT_POT##((FX##(L_BP9a!(1)) - V_0efc#), (2.0#)))   '@5c3ce DS:3370,33a8
    V_0f04! = FX##(V_0f04!) + 1.0   '@5c4a9 DS:3374
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5c144   '@5c4bf
L_5c4c8:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_0ef0!))) < L_BP88!(RT_CINT%(FX##(V_0ef0!) - 1.0))) THEN GOTO L_5cbb1   '@5c4c8 DS:337c
    V_1778! = FX##(V_0ef0!) - 1.0   '@5c516 DS:337c
L_5c532:
    IF NOT (L_BP88!(RT_CINT%(FX##(V_1778!) - 1.0)) >= L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5c5e2   '@5c532 DS:337c
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_1778!) - 1.0))   '@5c580 DS:337c
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_1778!) - 1.0))   '@5c5ad DS:337c
    GOTO L_5c6de   '@5c5da
L_5c5e2:
    V_0ef4# = L_BP88!(RT_CINT%(FX##(V_0ef0!)))   '@5c5e2
    V_0efc# = L_BP9a!(RT_CINT%(FX##(V_1778!))) + (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!) - 1.0))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!) - 1.0))) - L_BP88!(RT_CINT%(FX##(V_1778!)))) * (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_1778!))))   '@5c60a DS:337c
L_5c6de:
    IF NOT (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) <> FX##(V_0ef4#)) THEN GOTO L_5c80d   '@5c6de
    IF NOT (FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) > FX##(V_0efc#)) THEN GOTO L_5c7a5   '@5c710
    V_16a0# = -ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_1778!)))) - V_0efc#) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) - V_0ef4#))   '@5c742
    GOTO L_5c805   '@5c79d
L_5c7a5:
    V_16a0# = ATN((FX##(V_0efc#) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) - V_0ef4#))   '@5c7a5
L_5c805:
    GOTO L_5c823   '@5c805
L_5c80d:
    V_16a0# = 0.0#   '@5c80d DS:33d0
L_5c823:
    V_16a8# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / (FX##(L_BP88!(RT_CINT%(FX##(V_1778!)))) - L_BP88!(RT_CINT%(FX##(V_0ef0!)))))   '@5c823
    IF NOT (L_BPc2!(RT_CINT%(FX##(V_0ef0!) - 1.0), 0) = 0.0 AND FX##(V_0ef0!) - 1.0 = FX##(V_1778!)) THEN GOTO L_5c966   '@5c8a9 DS:3378,337c
    L_BP4e! = L_BP4e! + (FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))) / RT_TAN##(FX##(V_16a8#))   '@5c90d
L_5c966:
    L_BP52! = L_BP52! + RT_POT##((FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - L_BP9a!(RT_CINT%(FX##(V_1778!)))), (3.0)) / 6.0 * (1.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16a8#))) * (2.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16a8#))) / RT_TAN##(FX##(V_16a8#))   '@5c966 DS:3390,33a8,33c4,33d8
    IF NOT (FX##(L_BP88!(RT_CINT%(FX##(V_0ef0!)))) < FX##(V_0ef4#)) THEN GOTO L_5cb4d   '@5ca1c
    V_16b0# = ATN((FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - V_0efc#) / (FX##(V_0ef4#) - L_BP88!(RT_CINT%(FX##(V_0ef0!)))))   '@5ca4e
    L_BP52! = L_BP52! - RT_POT##((FX##(L_BP9a!(RT_CINT%(FX##(V_0ef0!)))) - V_0efc#), (3.0#)) * (1.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16b0#))) * (2.0# - RT_TAN##(FX##(V_16a0#)) / RT_TAN##(FX##(V_16b0#))) / (RT_TAN##(FX##(V_16b0#)) * 6.0#)   '@5caa9 DS:3390,33a8,33c8,33dc
L_5cb4d:
    V_1778! = FX##(V_1778!) - 1.0   '@5cb4d DS:337c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP88!(RT_CINT%(FX##(V_1778!))) <= L_BP88!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_5c532   '@5cb63
L_5cbb1:
    V_1778! = V_0f10!   '@5cbb1
    V_0ef4# = 0.0#   '@5cbc2 DS:33d0
L_5cbd8:
    IF NOT (V_1778! <> V_1788!) THEN GOTO L_5ce48   '@5cbd9
    V_0f04! = FX##(V_1778!) + 1.0   '@5cbee DS:3374
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_0f04!) THEN GOTO L_5cc4d   '@5cc04
    V_0f04! = 1.0   '@5cc3c DS:3374
L_5cc4d:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1778!))) > 2) THEN GOTO L_5cde0   '@5cc4d
    V_0ef4# = (A_10fa%(RT_CINT%(FX##(V_177c!)), RT_CINT%(FX##(V_1778!))) - 2) * RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_1778!)))) - A_15b0!(RT_CINT%(FX##(V_0f04!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_1778!)))) - A_15de!(RT_CINT%(FX##(V_0f04!)))), (2.0))) / (RT_SQR##(RT_POT##((FX##(A_15b0!(RT_CINT%(FX##(V_0f10!)))) - A_15b0!(RT_CINT%(FX##(V_1788!)))), (2.0)) + RT_POT##((FX##(A_15de!(RT_CINT%(FX##(V_0f10!)))) - A_15de!(RT_CINT%(FX##(V_1788!)))), (2.0))) * 10.0) + V_0ef4#   '@5cc7e DS:3370,33e4
L_5cde0:
    V_1778! = FX##(V_1778!) + 1.0   '@5cde0 DS:3374
    IF NOT (A_109e%(RT_CINT%(FX##(V_177c!)), 0) = V_1778!) THEN GOTO L_5ce3f   '@5cdf6
    V_1778! = 1.0   '@5ce2e DS:3374
L_5ce3f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_5cbd8   '@5ce3f
L_5ce48:
    RETURN   '@5ce48
L_5ce57:   ' entrada vinda de 0578ad_FUN_5000_78ad
    ERASE L_BPc2!   '@5ce57
    ERASE L_BPac%   '@5ce61
    ERASE L_BP88!   '@5ce6b
    ERASE L_BP64!   '@5ce75
    ERASE L_BP9a!   '@5ce7e
    ERASE L_BP76!   '@5ce88
    ' END SUB   '@5ce91
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_LAJE.BM'
'$INCLUDE: '../comum/MIXT.BM'
