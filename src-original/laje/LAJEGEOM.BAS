' ============================================================================
'  LAJEGEOM - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/LAJEGEOM/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: c1d7e550cd79aded444d4c5e3d2a1e97dde484a980f9e8342f32306bc82503c6
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_LAJE.BI'

' ---- variaveis do LAJEGEOM fora do COMMON (DS do programa)
REDIM SHARED A_14fa%(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_134c!
DIM SHARED V_1350$
DIM SHARED V_1354$
DIM SHARED V_1358!
DIM SHARED V_135c!
DIM SHARED V_1360!
DIM SHARED V_1364!
DIM SHARED V_1368$
DIM SHARED V_136c$
DIM SHARED V_1370!
DIM SHARED V_1374!
DIM SHARED V_1378!
DIM SHARED V_137c!
DIM SHARED V_1380!
DIM SHARED V_1384!
DIM SHARED V_1388!
DIM SHARED V_138c!
DIM SHARED V_1390!
DIM SHARED V_1394!
DIM SHARED V_1398!
DIM SHARED V_139c!
DIM SHARED V_13a0!
DIM SHARED V_13a4$
DIM SHARED V_14b6!
DIM SHARED V_14ba!
DIM SHARED V_14be!
DIM SHARED V_14c2%
DIM SHARED V_14c4!
DIM SHARED V_14c8!
DIM SHARED V_14cc!
DIM SHARED V_14d0!
DIM SHARED V_14d4!
DIM SHARED V_14d8!
DIM SHARED V_14dc!
DIM SHARED V_14e0!
DIM SHARED V_14e4!
DIM SHARED V_14e8!
DIM SHARED V_14ec!
DIM SHARED V_14f0!
DIM SHARED V_14f4%
DIM SHARED V_14f6!
DIM SHARED V_1528$

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "LAJEGEOM"
' ---- M_LAJEGEOM @0x10030  (010030_M_LAJEGEOM.lift.txt; evidence_id (assembly): ev_0308aca7811f3304c8af4b26fcf8a9a0272a4b0753d14ce6ac8b5fa526b9fded)
' @10030 inicio do programa (B$?EVT)
GOTO L_101ac   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101ac:
L_101b1:   ' entrada vinda de 010234_F_10234, 01064b_FUN_1000_064b
ON ERROR GOTO L_101f9
RT_ONERR = &H101f9   '@101b6
V_0ef4# = RT_FRE&("")   '@101c5 DS:1530
GOSUB L_10239   '@101df
GOTO L_1064b   '@101ec
' ---- F_101f4 @0x101f4  (0101f4_F_101f4.lift.txt; evidence_id (assembly): ev_5a62ebb8c45b310e95e6cb2ee54aae036659b0626f6ab798983f0c7a7768a939)
L_101f9:   ' entrada vinda de 010030_M_LAJEGEOM, 01297b_F_1297b
RESUME L_10210   '@101fe
L_10210:
GOSUB L_10239   '@10215
CALL S_28786   '@10222
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1064b   '@1022c
' ---- F_10234 @0x10234  (010234_F_10234.lift.txt; evidence_id (assembly): ev_54cf3990c69bb1f07e6dd67fd42c37d9b3e339468ccc0b09c786a0de72406877)
L_10239:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJEGEOM, 0101f4_F_101f4
FOR V_134c! = 1.0 TO 10.0   '@1023e DS:158a,158e
ON KEY(RT_CINT%(FX##(V_134c!))) GOSUB L_104df
RT_ONKEY RT_CINT%(FX##(V_134c!)), 1   '@1024c
KEY(RT_CINT%(FX##(V_134c!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_134c!)), 1   '@10266
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_134c!   '@1027b DS:158a,158e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@102a4
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@102cc
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@102f4
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@1031c
FOR V_134c! = 15.0 TO 18.0   '@10344 DS:158a,1592,1596
ON KEY(RT_CINT%(FX##(V_134c!))) GOSUB L_1050a
RT_ONKEY RT_CINT%(FX##(V_134c!)), 2   '@10352
KEY(RT_CINT%(FX##(V_134c!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_134c!)), 1   '@1036c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_134c!   '@10381 DS:158a,1596
ON KEY(2) GOSUB L_1050a
RT_ONKEY 2, 2   '@103aa
KEY(2) ON
RT_KEYESTADO 2, 1   '@103bd
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@103cb
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@103f3
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@1041b
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@10443
FOR V_134c! = 19.0 TO 22.0   '@1046a DS:158a,159a,159e
ON KEY(RT_CINT%(FX##(V_134c!))) GOSUB L_10608
RT_ONKEY RT_CINT%(FX##(V_134c!)), 3   '@10478
KEY(RT_CINT%(FX##(V_134c!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_134c!)), 1   '@10492
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_134c!   '@104a7 DS:158a,159e
RETURN   '@104d0
L_104df:
BEEP   '@104e4
GOSUB L_10239   '@104ee
RETURN   '@104fb
L_1050a:
RT_SCREEN 0   '@1050f
RT_VIEWPRINT 1, 25   '@10524
COLOR 7, 0, 0   '@10536
RT_CLS 0   '@1055a
PRINT " Aguarde ..."   '@10567 DS:15a2
PRINT ""   '@10575 DS:1530
PRINT " Retorno ao Modulo Basico de LAJE"   '@10583 DS:15b2
ON ERROR GOTO L_105cf
RT_ONERR = &H105cf   '@10591
V_0f28_volta$ = "VOLTA LAJEGEOM"   '@105a0 DS:15d8
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@105b2 DS:15ea
L_105cf:
PRINT " Modulo nao encontrado em "; V_0e04_direxe$   '@105d4 DS:15f2
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@105eb DS:154e
RT_FIM   '@105f9 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_10608:
BEEP   '@1060d
GOSUB L_10239   '@10617
RT_SCREEN 0   '@10624
RETURN L_101b1   '@10643
' ---- FUN_1000_064b @0x1064b  (01064b_FUN_1000_064b.lift.txt; evidence_id (assembly): ev_74edb1ed12abdb65af4568aa61b72457522e8060be34c627d3e3f7eeff71bfe4)
L_1064b:   ' entrada vinda de 010030_M_LAJEGEOM, 0101f4_F_101f4, 01297b_F_1297b
V_1528$ = ""   '@10650 DS:1530
RT_SCREEN 0   '@10662
RT_VIEWPRINT 1, 25   '@10677
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@10689
RT_CLS 2   '@106c4
PRINT RT_STRINGC$((80), (205))   '@106d2
PRINT " Definicao dos dados de Geometria do Painel"   '@106ea DS:1610
PRINT " Numero maximo de Lajes -"; V_0e50%;   '@106f8 DS:1640
IF NOT (V_0e52% = 0) THEN GOTO L_10734   '@1070f
PRINT ""   '@1071e DS:1530
GOTO L_10754   '@1072c
L_10734:
PRINT "       Posicionadas"; V_0e52%; "Lajes"   '@10734 DS:165e,1676
L_10754:
PRINT RT_STRINGC$((80), (205))   '@10754
RT_VIEWPRINT 6, 25   '@1076c
COLOR 7   '@1077e
LOCATE 6, 18   '@10794
PRINT "1  -  Ei";   '@107b2 DS:1680
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@107c0
PRINT "x";   '@107dd DS:168c
COLOR 7   '@107eb
PRINT "os de Auxilio"   '@10801 DS:1692
LOCATE 8, 18   '@1080f
PRINT "2  -  ";   '@1082d DS:16a4
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1083b
PRINT "A";   '@10858 DS:16ae
COLOR 7   '@10866
PRINT "rquitetura, definicoes de contorno"   '@1087c DS:16b4
LOCATE 10, 18   '@1088a
PRINT "3  -  ";   '@108a8 DS:16da
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@108b6
PRINT "O";   '@108d3 DS:16e4
COLOR 7   '@108e1
PRINT "cupacao / Cargas de Arquitetura"   '@108f7 DS:16ea
LOCATE 12, 18   '@10905
PRINT "4  -  ";   '@10923 DS:170e
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10931
PRINT "E";   '@1094e DS:1718
COLOR 7   '@1095c
PRINT "strutura / Lancamento"   '@10972 DS:171e
LOCATE 14, 18   '@10980
PRINT "5  -  ";   '@1099e DS:1738
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@109ac
PRINT "P";   '@109c9 DS:1742
COLOR 7   '@109d7
PRINT "ilares"   '@109ed DS:1748
LOCATE 16, 18   '@109fb
PRINT "6  -  ";   '@10a19 DS:1752
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10a27
PRINT "L";   '@10a44 DS:175c
COLOR 7   '@10a52
PRINT "ajes / ";   '@10a68 DS:1762
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10a76
PRINT "C";   '@10a93 DS:176e
COLOR 7   '@10aa1
PRINT "argas de Estrutura"   '@10ab7 DS:1774
LOCATE 18, 18   '@10ac5
PRINT "7  -  ";   '@10ae3 DS:178a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10af1
PRINT "V";   '@10b0e DS:1794
COLOR 7   '@10b1c
PRINT "igas / Geracao de Arquivos (.VIG e .RLP)"   '@10b32 DS:179a
LOCATE 20, 18   '@10b40
PRINT "8  -  ";   '@10b5e DS:17c6
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10b6c
PRINT "I";   '@10b89 DS:17d0
COLOR 7   '@10b97
PRINT "mpressao de Relatorios"   '@10bad DS:17d6
LOCATE 22, 18   '@10bbb
PRINT "9  -  ";   '@10bd9 DS:17f0
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10be7
PRINT "R";   '@10c04 DS:17fa
COLOR 7   '@10c12
PRINT "etorno ao Menu Principal"   '@10c28 DS:1800
L_10c3b:
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@10c40
LOCATE 24, 18   '@10c6c
PRINT "escolha opcao ";   '@10c8a DS:181c
CALL MIXT_07f1_LimpaTeclado   '@10c98
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10ca2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_0ef4# = RT_FRE&("")   '@10cbe DS:1530
COLOR 7   '@10cd8
V_1350$ = V_0f18$   '@10cee
IF NOT (V_1350$ <> "1") THEN GOTO L_10d3b   '@10d00 DS:182e
IF NOT (V_1350$ <> "X") THEN GOTO L_10d3b   '@10d17 DS:1834
IF NOT (V_1350$ = "x") THEN GOTO L_10d4b   '@10d29 DS:168c
L_10d3b:
GOTO L_11361   '@10d3b
L_10d4b:
IF NOT (V_1350$ <> "2") THEN GOTO L_10d81   '@10d4b DS:183a
IF NOT (V_1350$ <> "A") THEN GOTO L_10d81   '@10d5d DS:16ae
IF NOT (V_1350$ = "a") THEN GOTO L_10daf   '@10d6f DS:1840
L_10d81:
IF NOT (V_0e34% = 1) THEN GOTO L_10d9f   '@10d81
CALL S_15706   '@10d90
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
L_10d9f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10d9f
L_10daf:
IF NOT (V_1350$ <> "3") THEN GOTO L_10de5   '@10daf DS:1846
IF NOT (V_1350$ <> "O") THEN GOTO L_10de5   '@10dc1 DS:16e4
IF NOT (V_1350$ = "o") THEN GOTO L_10dff   '@10dd3 DS:184c
L_10de5:
CALL S_40137   '@10de5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10def
L_10dff:
IF NOT (V_1350$ <> "4") THEN GOTO L_10e35   '@10dff DS:1852
IF NOT (V_1350$ <> "E") THEN GOTO L_10e35   '@10e11 DS:1718
IF NOT (V_1350$ = "e") THEN GOTO L_10e4f   '@10e23 DS:1858
L_10e35:
CALL S_288d3   '@10e35
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10e3f
L_10e4f:
IF NOT (V_1350$ <> "5") THEN GOTO L_10e85   '@10e4f DS:185e
IF NOT (V_1350$ <> "P") THEN GOTO L_10e85   '@10e61 DS:1742
IF NOT (V_1350$ = "p") THEN GOTO L_10e9f   '@10e73 DS:1864
L_10e85:
CALL S_30137   '@10e85
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10e8f
L_10e9f:
IF NOT (V_1350$ <> "6") THEN GOTO L_10ef9   '@10e9f DS:186a
IF NOT (V_1350$ <> "L") THEN GOTO L_10ef9   '@10eb1 DS:175c
IF NOT (V_1350$ <> "l") THEN GOTO L_10ef9   '@10ec3 DS:1870
IF NOT (V_1350$ <> "C") THEN GOTO L_10ef9   '@10ed5 DS:176e
IF NOT (V_1350$ = "c") THEN GOTO L_10f13   '@10ee7 DS:1876
L_10ef9:
CALL S_20137   '@10ef9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10f03
L_10f13:
IF NOT (V_1350$ <> "7") THEN GOTO L_10f49   '@10f13 DS:187c
IF NOT (V_1350$ <> "V") THEN GOTO L_10f49   '@10f25 DS:1794
IF NOT (V_1350$ = "v") THEN GOTO L_11161   '@10f37 DS:1882
L_10f49:
CALL S_36ea2   '@10f49
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0f18$ = "FIM") THEN GOTO L_10f72   '@10f53 DS:1888
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@10f6a
L_10f72:
V_0ef0! = 0.0   '@10f72 DS:1890
L_10f88:
IF NOT (V_0ef0! = 3.0) THEN GOTO L_10fb0   '@10f8d DS:1894
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_101b1   '@10fa8
L_10fb0:
ON ERROR GOTO L_11029
RT_ONERR = &H11029   '@10fb0
V_0ef4# = RT_FRE&("")   '@10fbf DS:1530
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@10fd9
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@10ff8
RT_CHAIN V_0e04_direxe$ + "LAJEMONT"   '@1100c DS:1898
L_11029:
RESUME L_11040   '@1102e
L_11040:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@11045 DS:158a
L_BP0c% = (RT_MID$((V_0e04_direxe$), (1), (1)) = "A")   '@1105b DS:16ae
IF NOT ((RT_MID$((V_0e04_direxe$), (1), (1)) = "B" OR L_BP0c%) <> 0) THEN GOTO L_11151   '@1108c DS:18a4
LOCATE 25, 1   '@110ab
PRINT " Coloque o Disco Contendo o modulo LAJEMONT no Drive "; RT_MID$((V_0e04_direxe$), (1), (2));   '@110c6 DS:18aa
CALL MIXT_07f1_LimpaTeclado   '@110eb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@110f5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@11111
PRINT RT_TAB$(79); ""; " ";   '@1112c DS:1530,18e4
L_11151:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_10f88   '@11151
L_11161:
IF NOT (V_1350$ <> "8") THEN GOTO L_11197   '@11161 DS:18ea
IF NOT (V_1350$ <> "I") THEN GOTO L_11197   '@11173 DS:17d0
IF NOT (V_1350$ = "i") THEN GOTO L_111be   '@11185 DS:18f0
L_11197:
IF NOT (V_0e36% = 0) THEN GOTO L_111ae   '@11197
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_10c3b   '@111a6
L_111ae:
GOTO L_1371e   '@111ae
L_111be:
IF NOT (V_1350$ <> "9") THEN GOTO L_111f4   '@111be DS:18f6
IF NOT (V_1350$ <> "R") THEN GOTO L_111f4   '@111d0 DS:17fa
IF NOT (V_1350$ = "r") THEN GOTO L_111fc   '@111e2 DS:18fc
L_111f4:
GOTO L_11209   '@111f4
L_111fc:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_10c3b   '@111fc
L_11209:
L_1120e:
V_0f28_volta$ = "VOLTA LAJEGEOM"   '@11213 DS:15d8
ON ERROR GOTO L_1129e
RT_ONERR = &H1129e   '@11225
V_0ef4# = RT_FRE&("")   '@11234 DS:1530
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@1124e
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@1126d
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@11281 DS:15ea
L_1129e:
RESUME L_112b5   '@112a3
L_112b5:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@112ba DS:1902
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_11354   '@112df DS:190a
LOCATE 23, 10   '@112f4
PRINT " Coloque o Disco LAJE no Drive "; V_0e04_direxe$   '@11312 DS:1912
CALL MIXT_07f1_LimpaTeclado   '@11329
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@11333
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
L_11354:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1120e   '@11354
L_11361:
RT_VIEWPRINT 1, 25   '@11366
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@11378
RT_CLS 2   '@113a4
PRINT RT_STRINGC$((80), (205))   '@113b2
PRINT " Definicao dos Eixos de Auxilio"   '@113ca DS:1936
PRINT " Numero maximo de Eixos - "; V_0e42%   '@113d8 DS:195a
PRINT RT_STRINGC$((80), (205))   '@113ef
RT_VIEWPRINT 6, 25   '@11407
COLOR 3   '@11419
RT_CLS 2   '@1142f
CALL MIXT_07f1_LimpaTeclado   '@1143d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
PRINT " Entre com o valor da Cota dos Eixos em  ["; V_0ddc$; "]  ou use os codigos auxiliares"   '@11447 DS:1978,19a6
PRINT ""   '@11467 DS:1530
PRINT "     H          Solicita a entrada dos eixos Horizontais"   '@11475 DS:19ca
PRINT "     V          Solicita a entrada dos eixos Verticais"   '@11483 DS:1a06
PRINT "     * n        para pular para o Eixo n"   '@11491 DS:1a40
PRINT "     A x        para Acrescentar no ultimo Eixo o valor x"   '@1149f DS:1a6c
PRINT "     R x,y      para Repetir o Acrescimo  x  por  y  vezes"   '@114ad DS:1aaa
PRINT "     C          Cancela todos os anteriores"   '@114bb DS:1ae8
PRINT "     I x        Inclui um novo Eixo na cota  x  antes do indicado"   '@114c9 DS:1b18
PRINT "     S x        Soma  x  em todos os Eixos superiores a partir do indicado"   '@114d7 DS:1b5e
PRINT "     D          Deleta o Eixo indicado"   '@114e5 DS:1bac
COLOR 12   '@114f3
LOCATE 21, 34   '@11509
PRINT "HORIZONTAIS"   '@11527 DS:1bd6
LOCATE 24, 35   '@11535
PRINT "VERTICAIS"   '@11553 DS:1be6
IF NOT (V_0e34% = 0) THEN GOTO L_115b0   '@11561
REDIM A_0f8a!(-32768 TO -32768, -32768 TO -32768)   '@11570
REDIM A_0f8a!(0 TO V_0e42%, 0 TO 1)   '@1157e
V_0e34% = 1   '@115a0
L_115b0:
IF NOT (A_0f8a!(0, 1) > 0.0) THEN GOTO L_11623   '@115b0 DS:1890
V_0f10! = 1.0   '@115dd DS:158a
V_0f0c! = A_0f8a!(0, 1)   '@115ee
GOSUB L_12980   '@11611
L_11623:
V_0f10! = 0.0   '@11623 DS:1890
L_11639:
V_0f0c! = FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))) + 1.0   '@1163e DS:158a
IF NOT (A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) > 0.0) THEN GOTO L_116d8   '@1166d DS:1890
V_0f0c! = A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))   '@116a1
GOTO L_12929   '@116cb
L_116d8:
L_116dd:
RT_VIEWPRINT 18, 20   '@116e2
COLOR 7   '@116f4
RT_CLS 2   '@1170a
IF NOT (V_0f10! = 0.0) THEN GOTO L_11784   '@11718 DS:1890
PRINT " Eixo HORIZONTAL (";   '@11733 DS:1bf4
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@11741
PRINT LTRIM$(STR$(V_0f0c!));   '@1175e
GOTO L_11850   '@1177c
L_11784:
PRINT " Eixo  VERTICAL  (";   '@11784 DS:1c0a
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@11792
PRINT LTRIM$(CHR$(RT_CINT%(FX##(V_0f0c!) + 26& * ((RT_CLNG&(FX##(V_0f0c!)) \ 26&) * (V_0f0c! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!) - 1.0) \ 26&), ("'")));   '@117af DS:1c20,1c24,1c2c,1c30
L_11850:
COLOR 7   '@11850
PRINT ")  *FIM* ";   '@11866 DS:1c36
CALL MIXT_07f1_LimpaTeclado   '@11874
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@1187e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_1354$ = RT_MID$((V_0f18$), (1), (1))   '@11890
IF NOT (V_1354$ <> "H") THEN GOTO L_118d6   '@118ad DS:1c44
IF NOT (V_1354$ = "h") THEN GOTO L_118f7   '@118c4 DS:1c4a
L_118d6:
V_0f10! = 0.0   '@118d6 DS:1890
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11639   '@118e7
L_118f7:
IF NOT (V_1354$ <> "V") THEN GOTO L_1191b   '@118f7 DS:1794
IF NOT (V_1354$ = "v") THEN GOTO L_1193c   '@11909 DS:1882
L_1191b:
V_0f10! = 1.0   '@1191b DS:158a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11639   '@1192c
L_1193c:
IF NOT (V_1354$ = "*") THEN GOTO L_11b6f   '@1193c DS:1c50
IF NOT (LEN(V_0f18$) > 1) THEN GOTO L_11b67   '@1194e
IF NOT (V_0f10! = 1.0) THEN GOTO L_11a81   '@11964 DS:158a
V_0f14! = 0.0   '@1197f DS:1890
V_0f04! = 1.0   '@11990 DS:158a
L_119a6:
V_0f04! = RT_INSTR%((RT_CINT%(FX##(V_0f04!))), (V_0f18$), ("'"))   '@119ab DS:1c30
IF NOT (V_0f04! > 0.0) THEN GOTO L_11a22   '@119d4 DS:1890
V_0f14! = FX##(V_0f14!) + 1.0   '@119ef DS:158a
V_0f04! = FX##(V_0f04!) + 1.0   '@11a05 DS:158a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_119a6   '@11a1b
L_11a22:
V_0f18$ = "*" + STR$(RT_SNG!(ASC(RT_MID$((UCASE$(V_0f18$)), (2), (1))) - 64 + FX##(V_0f14!) * 26.0))   '@11a22 DS:1c20,1c50
L_11a81:
L_BP0c% = (VAL(RT_MID2$((V_0f18$), (2))) > 0.0#)   '@11a81 DS:158a,1c56
IF NOT ((FX##(VAL(RT_MID2$((V_0f18$), (2)))) <= FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))) + 1.0 AND L_BP0c%) <> 0) THEN GOTO L_11b41   '@11aea
V_0f0c! = VAL(RT_MID2$((V_0f18$), (2)))   '@11b11
GOTO L_11b62   '@11b39
L_11b41:
L_11b46:
BEEP   '@11b4b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_116dd   '@11b55
L_11b62:
L_11b67:
GOTO L_12898   '@11b67
L_11b6f:
IF NOT (V_1354$ <> "A") THEN GOTO L_11b93   '@11b6f DS:16ae
IF NOT (V_1354$ = "a") THEN GOTO L_11d41   '@11b81 DS:1840
L_11b93:
L_BP0c% = (V_0f0c! > 1.0)   '@11b93 DS:158a,1c56
IF NOT ((VAL(RT_MID2$((V_0f18$), (2))) > 0.0# AND L_BP0c%) <> 0) THEN GOTO L_11d2c   '@11bc5
IF NOT (A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) > V_0f0c!) THEN GOTO L_11cb0   '@11bec
IF NOT (FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!)))) + VAL(RT_MID2$((V_0f18$), (2))) >= FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) + 1.0), RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_11cab   '@11c20 DS:158a,1c2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@11ca3
L_11cab:
L_11cb0:
A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!)))) + VAL(RT_MID2$((V_0f18$), (2)))   '@11cb0 DS:1c2c
GOTO L_11d39   '@11d24
L_11d2c:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@11d2c
L_11d39:
GOTO L_12898   '@11d39
L_11d41:
IF NOT (V_1354$ <> "R") THEN GOTO L_11d65   '@11d41 DS:17fa
IF NOT (V_1354$ = "r") THEN GOTO L_12042   '@11d53 DS:18fc
L_11d65:
L_BP0c% = (V_0f0c! > 1.0)   '@11d65 DS:158a,1c56
L_BP0e% = VAL(RT_MID2$((V_0f18$), (2))) > 0.0# AND L_BP0c%   '@11d97 DS:1c56
L_BP10% = VAL(V_0f1c$) > 0.0# AND L_BP0e%   '@11dc5
IF NOT ((V_0f0c! + (FX##(VAL(V_0f1c$)) - 1.0#) < V_0e42% AND L_BP10%) <> 0) THEN GOTO L_1202d   '@11df5 DS:1c5e
IF NOT (V_0f0c! + (FX##(VAL(V_0f1c$)) - 1.0#) < FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_11f1a   '@11e1e DS:1c5e
IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!))) + FX##(VAL(V_0f1c$)) * VAL(RT_MID2$((V_0f18$), (2))) >= FX##(A_0f8a!(RT_CINT%(V_0f0c! + (FX##(VAL(V_0f1c$)) - 1.0#)), RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_11f15   '@11e68 DS:1c2c,1c5e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@11f0d
L_11f15:
L_11f1a:
V_1358! = V_0f0c! + (FX##(VAL(V_0f1c$)) - 1.0#)   '@11f1a DS:1c5e
FOR V_0f04! = V_0f0c! TO V_1358!   '@11f42 DS:158a
A_0f8a!(RT_CINT%(FX##(V_0f04!)), RT_CINT%(FX##(V_0f10!))) = FX##(RT_CINT%(FX##(VAL(RT_MID2$((V_0f18$), (2)))) * 1000.0#)) / 1000.0 + A_0f8a!(RT_CINT%(FX##(V_0f04!) - 1.0), RT_CINT%(FX##(V_0f10!)))   '@11f4a DS:1c2c,1c66,1c6e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@11fd2 DS:158a
V_0f0c! = V_0f0c! + (FX##(VAL(V_0f1c$)) - 1.0#)   '@11ffe DS:1c5e
GOTO L_1203a   '@12025
L_1202d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@1202d
L_1203a:
GOTO L_12898   '@1203a
L_12042:
IF NOT (V_1354$ <> "C") THEN GOTO L_12066   '@12042 DS:176e
IF NOT (V_1354$ = "c") THEN GOTO L_120d8   '@12054 DS:1876
L_12066:
PRINT " Confirme CANCELAR os dados dos Eixos S/*N* ";   '@12066 DS:1c72
CALL MIXT_07f1_LimpaTeclado   '@12074
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@1207e DS:1530
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_120c8   '@12098 DS:1ca2
V_0e34% = 0   '@120b5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11361   '@120c0
L_120c8:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_116dd   '@120c8
L_120d8:
IF NOT (V_1354$ <> "I") THEN GOTO L_120fc   '@120d8 DS:17d0
IF NOT (V_1354$ = "i") THEN GOTO L_1231f   '@120ea DS:18f0
L_120fc:
V_0f04! = VAL(RT_MID2$((V_0f18$), (2)))   '@120fc
IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) <= V_0f04! OR A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!))) >= V_0f04! AND V_0f0c! > 1.0) THEN GOTO L_121d0   '@12124 DS:158a,1c2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@121c8
L_121d0:
V_135c! = V_0f0c!   '@121d0
FOR V_0f04! = A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) TO V_135c! STEP -1.0   '@121e1 DS:1c2c
A_0f8a!(RT_CINT%(FX##(V_0f04!) + 1.0), RT_CINT%(FX##(V_0f10!))) = A_0f8a!(RT_CINT%(FX##(V_0f04!)), RT_CINT%(FX##(V_0f10!)))   '@12202 DS:158a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@1225a DS:1c2c
A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) = FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))) + 1.0   '@12286 DS:158a
A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = VAL(RT_MID2$((V_0f18$), (2)))   '@122ce
GOTO L_12898   '@12317
L_1231f:
IF NOT (V_1354$ <> "S") THEN GOTO L_12343   '@1231f DS:1ca2
IF NOT (V_1354$ = "s") THEN GOTO L_124ee   '@12331 DS:1ca8
L_12343:
V_0f04! = VAL(RT_MID2$((V_0f18$), (2)))   '@12343
IF NOT (V_0f04! = 0.0) THEN GOTO L_1238e   '@1236b DS:1890
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@12386
L_1238e:
IF NOT (V_0f0c! > 1.0) THEN GOTO L_1241d   '@1238e DS:158a
IF NOT (FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) + V_0f04! <= FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_12418   '@123a9 DS:1c2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@12410
L_12418:
L_1241d:
V_1360! = A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))   '@1241d
FOR V_0f14! = V_0f0c! TO V_1360!   '@12448 DS:158a
A_0f8a!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!))) = FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!)))) + V_0f04!   '@12450
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f14!   '@124a8 DS:158a
V_0f18$ = "*"   '@124d4 DS:1c50
GOTO L_12898   '@124e6
L_124ee:
IF NOT (V_1354$ <> "D") THEN GOTO L_12512   '@124ee DS:1cae
IF NOT (V_1354$ = "d") THEN GOTO L_1267c   '@12500 DS:1cb4
L_12512:
V_1364! = FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))) - 1.0   '@12512 DS:1c2c
FOR V_0f04! = V_0f0c! TO V_1364!   '@12542 DS:158a
A_0f8a!(RT_CINT%(FX##(V_0f04!)), RT_CINT%(FX##(V_0f10!))) = A_0f8a!(RT_CINT%(FX##(V_0f04!) + 1.0), RT_CINT%(FX##(V_0f10!)))   '@1254a DS:158a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@125a2 DS:158a
A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) = FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))) - 1.0   '@125ce DS:1c2c
IF NOT (A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) < V_0f0c!) THEN GOTO L_12674   '@12616
V_0f0c! = A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))   '@1264a
L_12674:
GOTO L_12898   '@12674
L_1267c:
L_BP0c% = (LEN(V_0f18$) = 0)   '@1267c
IF NOT ((LEN(V_0f1c$) = 0 AND L_BP0c%) <> 0) THEN GOTO L_126b8   '@12699
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@126b0
L_126b8:
L_BP0c% = (VAL(V_0f18$) > 0.0#)   '@126b8 DS:1c56
L_BP0e% = (VAL(V_0f18$) = 0.0#)   '@126eb
IF NOT ((RT_MID$((V_0f18$), (1), (1)) = "0" AND L_BP0e% OR L_BP0c%) <> 0) THEN GOTO L_12886   '@12710 DS:1cba
IF NOT (V_0f0c! > 1.0) THEN GOTO L_127ae   '@12732 DS:158a
IF NOT (FX##(VAL(V_0f18$)) <= FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_127a9   '@1274d DS:1c2c
BEEP   '@12797
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_116dd   '@127a1
L_127a9:
L_127ae:
IF NOT (A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) > V_0f0c!) THEN GOTO L_12843   '@127ae
IF NOT (FX##(VAL(V_0f18$)) >= FX##(A_0f8a!(RT_CINT%(FX##(V_0f0c!) + 1.0), RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_1283e   '@127e2 DS:158a
BEEP   '@1282c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_116dd   '@12836
L_1283e:
L_12843:
A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = VAL(V_0f18$)   '@12843
GOTO L_12893   '@1287e
L_12886:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_11b46   '@12886
L_12893:
L_12898:
L_BP0c% = (A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) < V_0f0c!)   '@12898
IF NOT ((RT_MID$((V_0f18$), (1), (1)) <> "*" AND L_BP0c%) <> 0) THEN GOTO L_12924   '@128db DS:1c50
A_0f8a!(0, RT_CINT%(FX##(V_0f10!))) = V_0f0c!   '@128fa
L_12924:
L_12929:
GOSUB L_12980   '@1292e
IF NOT (RT_MID$((V_0f18$), (1), (1)) <> "*") THEN GOTO L_12973   '@1293b DS:1c50
V_0f0c! = FX##(V_0f0c!) + 1.0   '@1295d DS:158a
L_12973:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_116dd   '@12973
' ---- F_1297b @0x1297b  (01297b_F_1297b.lift.txt; evidence_id (assembly): ev_819afb419e26f192aea2f00eaaf195ba15293ea46a02d3f9f9f3a47a8409f866)
L_12980:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01064b_FUN_1000_064b
IF NOT (V_0f10! = 0.0) THEN GOTO L_129b9   '@12985 DS:1890
V_0f14! = 22.0   '@129a0 DS:159e
GOTO L_129ca   '@129b1
L_129b9:
V_0f14! = 25.0   '@129b9 DS:1cc0
L_129ca:
RT_VIEWPRINT RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f14!))   '@129ca
RT_CLS 2   '@129ea
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@129f8
IF NOT (V_0f0c! > 2.0) THEN GOTO L_12bbf   '@12a15 DS:1cc4
COLOR 11   '@12a30
LOCATE RT_CINT%(FX##(V_0f14!)), 1   '@12a46
IF NOT (V_0f10! = 0.0) THEN GOTO L_12ab3   '@12a68 DS:1890
V_0f20$ = STR$(RT_SNG!(FX##(V_0f0c!) - 2.0))   '@12a83 DS:1cc8
GOTO L_12b6b   '@12aab
L_12ab3:
V_0f20$ = " " + CHR$(RT_CINT%(FX##(V_0f0c!) - 2.0 + 26& * ((RT_CLNG&(FX##(V_0f0c!) - 2.0) \ 26&) * (FX##(V_0f0c!) - 2.0 > FX##(26.0))) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!) - 3.0) \ 26&), ("'"))   '@12ab3 DS:18e4,1c20,1c24,1c30,1cc8,1ccc
L_12b6b:
PRINT USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 2.0), RT_CINT%(FX##(V_0f10!))), " \ \(###.##)", 1);   '@12b6b DS:1cc8,1cd0
L_12bbf:
IF NOT (V_0f0c! > 1.0) THEN GOTO L_12d6c   '@12bbf DS:158a
COLOR 11   '@12bda
LOCATE RT_CINT%(FX##(V_0f14!)), 17   '@12bf0
IF NOT (V_0f10! = 0.0) THEN GOTO L_12c60   '@12c15 DS:1890
V_0f20$ = STR$(RT_SNG!(FX##(V_0f0c!) - 1.0))   '@12c30 DS:1c2c
GOTO L_12d18   '@12c58
L_12c60:
V_0f20$ = " " + CHR$(RT_CINT%(FX##(V_0f0c!) - 1.0 + 26& * ((RT_CLNG&(FX##(V_0f0c!) - 1.0) \ 26&) * (FX##(V_0f0c!) - 1.0 > FX##(26.0))) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!) - 2.0) \ 26&), ("'"))   '@12c60 DS:18e4,1c20,1c24,1c2c,1c30,1cc8
L_12d18:
PRINT USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!) - 1.0), RT_CINT%(FX##(V_0f10!))), " \ \(###.##)", 1);   '@12d18 DS:1c2c,1cd0
L_12d6c:
COLOR 14   '@12d6c
LOCATE RT_CINT%(FX##(V_0f14!)), 33   '@12d82
IF NOT (V_0f10! = 0.0) THEN GOTO L_12de6   '@12da7 DS:1890
V_0f20$ = STR$(V_0f0c!)   '@12dc2
GOTO L_12e8f   '@12dde
L_12de6:
V_0f20$ = " " + CHR$(RT_CINT%(FX##(V_0f0c!) + 26& * ((RT_CLNG&(FX##(V_0f0c!)) \ 26&) * (V_0f0c! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!) - 1.0) \ 26&), ("'"))   '@12de6 DS:18e4,1c20,1c24,1c2c,1c30
L_12e8f:
PRINT USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), " \ \(###.##)", 1);   '@12e8f DS:1cd0
IF NOT (FX##(V_0f0c!) + 1.0 <= FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_1309f   '@12ed9 DS:158a
COLOR 11   '@12f12
LOCATE RT_CINT%(FX##(V_0f14!)), 49   '@12f28
IF NOT (V_0f10! = 0.0) THEN GOTO L_12f98   '@12f4d DS:1890
V_0f20$ = STR$(RT_SNG!(FX##(V_0f0c!) + 1.0))   '@12f68 DS:158a
GOTO L_1304b   '@12f90
L_12f98:
V_0f20$ = " " + CHR$(RT_CINT%(FX##(V_0f0c!) + 1.0 + 26& * ((RT_CLNG&(FX##(V_0f0c!) + 1.0) \ 26&) * (FX##(V_0f0c!) + 1.0 > FX##(26.0))) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!)) \ 26&), ("'"))   '@12f98 DS:158a,18e4,1c20,1c24,1c30
L_1304b:
PRINT USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!) + 1.0), RT_CINT%(FX##(V_0f10!))), " \ \(###.##)", 1);   '@1304b DS:158a,1cd0
L_1309f:
IF NOT (FX##(V_0f0c!) + 2.0 <= FX##(A_0f8a!(0, RT_CINT%(FX##(V_0f10!))))) THEN GOTO L_132d6   '@1309f DS:1cc4
V_0ef4# = A_0f8a!(0, RT_CINT%(FX##(V_0f10!)))   '@130d8
V_0f1c$ = ".."   '@13102 DS:1ce0
IF NOT (V_0f18$ = "MOS") THEN GOTO L_13153   '@13114 DS:1ce6
V_0ef4# = FX##(V_0f0c!) + 2.0   '@1312b DS:1cc4
V_0f1c$ = ""   '@13141 DS:1530
L_13153:
COLOR 11   '@13153
LOCATE RT_CINT%(FX##(V_0f14!)), 64   '@13169
IF NOT (V_0f10! = 0.0) THEN GOTO L_131d3   '@1318e DS:1890
V_0f20$ = RT_STR8$(V_0ef4#)   '@131a9
GOTO L_13279   '@131cb
L_131d3:
V_0f20$ = " " + CHR$(RT_CINT%(26& * ((RT_CLNG&(FX##(V_0ef4#)) \ 26&) * (V_0ef4# > 26.0#)) + FX##(V_0ef4#) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0ef4#) - 1.0#) \ 26&), ("'"))   '@131d3 DS:18e4,1c24,1c30,1c5e,1cee
L_13279:
PRINT V_0f1c$;   '@13279
PRINT USING "\ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0f10!))), "\ \(###.##)", 1);   '@13287 DS:1cf6
L_132d6:
RETURN   '@132d6
' @132e0 (trecho de 302 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
RT_VIEWPRINT 11, 25   '@132ea
RT_CLS 2   '@132fc
COLOR 3   '@1330a
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@13320 DS:1530,1d06
COLOR 14   '@13340
RT_VIEWPRINT 12, 25   '@13356
ON ERROR GOTO L_1340e
RT_ONERR = &H1340e   '@13368
L_BP0c% = (LEN(V_0e00$) > 1)   '@13377 DS:1d3c
CHDIR RT_ARQ$(RT_LEFT$((V_0dfc$ + ":" + V_0e00$), (LEN(V_0e00$) + L_BP0c% + 2)))   '@133ad
RT_FILES V_0dfc$ + ":" + V_0e00$ + "*.REP"   '@133c4 DS:1d3c,1d42 (FILES: cabecalho em forma DOS (RT45))
ON ERROR GOTO L_101f9
RT_ONERR = &H101f9   '@133f0
RETURN   '@133ff
L_1340e:
IF NOT (ERR = 53) THEN GOTO L_13454   '@13413
PRINT " Nenhum Arquivo Encontrado"   '@13425 DS:1d4c
RESUME NEXT   '@13433
' @1343d (trecho de 23 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
V_0f18$ = ""   '@1343d DS:1530
L_13454:
V_0f18$ = "ERRREP"   '@13454 DS:1d6a
RESUME NEXT   '@13466
' @13470 (trecho de 231 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
RT_VIEWPRINT 22, 25   '@1347a
RT_CLS 2   '@1348c
COLOR 7   '@1349a
PRINT " Drive que contem o Disco de Dados ";   '@134b0 DS:1d74
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@134be
PRINT "*"; RT_MID$((V_0dfc$), (1), (1)); "*";   '@134db DS:1c50
CALL MIXT_07f1_LimpaTeclado   '@13506
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_0f18$   '@13510 DS:18e4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_13557   '@1352a
V_0dfc$ = UCASE$(V_0f18$)   '@1353f
L_13557:
COLOR 3   '@13557
PRINT " [";   '@1356d DS:1d9c
COLOR 7   '@1357b
PRINT "\Diretorio\Subdiretorio\...\";   '@13591 DS:1da2
COLOR 3   '@1359f
PRINT "]";   '@135b5 DS:1dc2
COLOR 7   '@135c3
PRINT "Subdiretorio ";   '@135d9 DS:1dc8
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@135e7
PRINT "*"; V_0e00$; "*";   '@13604 DS:1c50
COLOR 7   '@13624
RT_LINEINPUT " ", V_0f18$   '@1363a DS:18e4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_136d2   '@13654
IF NOT (RT_MID$((V_0f18$), (1), (1)) <> "\") THEN GOTO L_136b5   '@13669 DS:1dda
V_0e00$ = V_0e00$ + UCASE$(V_0f18$)   '@1368b
GOTO L_136cd   '@136ad
L_136b5:
V_0e00$ = UCASE$(V_0f18$)   '@136b5
L_136cd:
L_136d2:
IF NOT (RT_RIGHT$((V_0e00$), (1)) <> "\") THEN GOTO L_1370f   '@136d2 DS:1dda
V_0e00$ = V_0e00$ + "\"   '@136f3 DS:1dda
L_1370f:
RETURN   '@1370f
L_1371e:   ' entrada vinda de 01064b_FUN_1000_064b
RT_CLS 2   '@13723
PRINT " Obra "; V_0e24$   '@13731 DS:1de0
PRINT ""   '@13748 DS:1530
PRINT " Descricao do Pavimento ";   '@13756 DS:1dea
CALL MIXT_07f1_LimpaTeclado   '@13764
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1368$   '@1376e DS:1530
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
PRINT " Dados Corretos para inicio da Impressao S/*N* ";   '@13788 DS:1e06
CALL MIXT_07f1_LimpaTeclado   '@13796
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@137a0 DS:1530
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) <> "S") THEN GOTO L_137df   '@137ba DS:1ca2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@137d7
L_137df:
PRINT ""   '@137df DS:1530
PRINT " Ligue a Impressora."   '@137ed DS:1e3a
PRINT " Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario ";   '@137fb DS:1e52
CALL MIXT_07f1_LimpaTeclado   '@13809
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_136c$   '@13813 DS:1530
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
V_1528$ = "S"   '@1382d DS:1ca2
IF NOT (V_136c$ <> "*") THEN GOTO L_13874   '@1383f DS:1c50
RT_LPTABRE: RT_LPS CHR$(12)   '@13856
L_13874:
RT_LPTABRE: RT_LPS V_0e0c$   '@13874
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@1388c
RT_LPTABRE: RT_LPS RT_STRINGC$((75), (45)): RT_LPFIM   '@1389f
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@138bc DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@138e1 DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@1390f DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS RT_DATE$: RT_LPS "   ": RT_LPS RT_MID$((RT_TIME$), (1), (5)): RT_LPFIM   '@13934 DS:1530,1eaa
RT_LPTABRE: RT_LPS RT_STRINGC$((75), (45)): RT_LPFIM   '@1397d
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@1399a DS:1530
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@139ad DS:1530
V_14f4% = 0   '@139c0
IF NOT (V_0e36% = 1) THEN GOTO L_13f3f   '@139cb
CALL S_15706   '@139da
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@139e4
RT_ROTINA_0AEA   '@139f7 (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13a01 DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@13a14
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@13a2c
RT_LPTABRE: RT_LPS "   Eixos Horizontais": RT_LPFIM   '@13a3f DS:1eb2
V_1370! = A_0f8a!(0, 0)   '@13a52
FOR V_0f0c! = 1.0 TO V_1370!   '@13a73 DS:158a
V_0f20$ = STR$(V_0f0c!)   '@13a7a
RT_LPTABRE: PRINT #RT_LPT, USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!)), 0), " \ \(###.##)", 1);: RT_LPTQUEBRA 0   '@13a96 DS:1cd0
IF NOT (A_0f8a!(0, 0) = V_0f0c! OR FX##(V_0f0c!) / 6.0 = RT_CLNG&(FX##(V_0f0c!)) \ 6&) THEN GOTO L_13b5b   '@13add DS:1eca
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13b48 DS:1530
L_13b5b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@13b5b DS:158a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13b87 DS:1530
RT_LPTABRE: RT_LPS "   Eixos Verticais": RT_LPFIM   '@13b9a DS:1ece
V_1374! = A_0f8a!(0, 1)   '@13bad
FOR V_0f0c! = 1.0 TO V_1374!   '@13bd1 DS:158a
V_0f20$ = " " + CHR$(RT_CINT%(FX##(V_0f0c!) + 26& * ((RT_CLNG&(FX##(V_0f0c!)) \ 26&) * (V_0f0c! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f0c!) - 1.0) \ 26&), ("'"))   '@13bd8 DS:18e4,1c20,1c24,1c2c,1c30
RT_LPTABRE: PRINT #RT_LPT, USING " \ \(###.##)"; V_0f20$; RT_PU#(A_0f8a!(RT_CINT%(FX##(V_0f0c!)), 1), " \ \(###.##)", 1);: RT_LPTQUEBRA 0   '@13c7c DS:1cd0
IF NOT (A_0f8a!(0, 1) = V_0f0c! OR FX##(V_0f0c!) / 6.0 = RT_CLNG&(FX##(V_0f0c!)) \ 6&) THEN GOTO L_13d45   '@13cc4 DS:1eca
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13d32 DS:1530
L_13d45:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@13d45 DS:158a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13d71 DS:1530
RT_LPTABRE: RT_LPS "   Contorno da Arquitetura": RT_LPFIM   '@13d84 DS:1ee4
V_1378! = A_0fb8!(0, 0)   '@13d97
FOR V_0f0c! = 1.0 TO V_1378!   '@13db8 DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING " ### (###.##,###.##  ###.##,###.##)"; RT_PU#(V_0f0c!, " ### (###.##,###.##  ###.##,###.##)", 1); RT_PU#(A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 0), " ### (###.##,###.##  ###.##,###.##)", 2); RT_PU#(A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 1), " ### (###.##,###.##  ###.##,###.##)", 3); RT_PU#(A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 2), " ### (###.##,###.##  ###.##,###.##)", 4); RT_PU#(A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 3), " ### (###.##,###.##  ###.##,###.##)", 5);: RT_LPTQUEBRA 0   '@13dc0 DS:1f02
IF NOT (A_0fb8!(0, 0) = V_0f0c! OR FX##(V_0f0c!) / 2.0 = RT_CLNG&(FX##(V_0f0c!)) \ 2&) THEN GOTO L_13efb   '@13e7d DS:1cc4
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13ee8 DS:1530
L_13efb:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@13efb DS:158a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@13f27 DS:1530
L_13f3f:
IF NOT (V_0e38% = 1) THEN GOTO L_14885   '@13f3f
IF NOT (V_136c$ <> "*") THEN GOTO L_13ffb   '@13f4e DS:1c50
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@13f65
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@13f7e DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@13fa3 DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@13fd1 DS:1530
L_13ffb:
CALL S_40137   '@13ffb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@14005
RT_ROTINA_0AEA   '@14018 (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14022 DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@14035
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@1404d
IF NOT (A_0fe6!(0, 0) > 0.0) THEN GOTO L_14385   '@14060 DS:1890
RT_LPTABRE: RT_LPTAB 55: RT_LPS "": RT_LPS "unidades ": RT_LPS V_0de0$: RT_LPS "/": RT_LPS V_0ddc$: RT_LPFIM   '@1408a DS:1530,1f2a,1f38
RT_LPTABRE: RT_LPS "   Carga Linear         Coordenadas           Comprimento     Carga   Total": RT_LPFIM   '@140ca DS:1f3e
V_0f20$ = "   \  \       (###.##,###.##  ###.##,###.##)    ###.##       ###.## ####.##"   '@140dd DS:1f8e
V_0f14! = 0.0   '@140ef DS:1890
V_137c! = A_0fe6!(0, 0)   '@14100
FOR V_0f0c! = 1.0 TO V_137c!   '@14121 DS:158a
V_0ef0! = RT_SQR##(RT_POT##((FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 0)) - A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 2)), (2.0)) + RT_POT##((FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 1)) - A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 3)), (2.0)))   '@14128 DS:1cc4
RT_LPTABRE: PRINT #RT_LPT, USING V_0f20$; "L" + LTRIM$(STR$(V_0f0c!)); RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 0), V_0f20$, 1); RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 1), V_0f20$, 2); RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 2), V_0f20$, 3); RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 3), V_0f20$, 4); RT_PU#(V_0ef0!, V_0f20$, 5); RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 4), V_0f20$, 6); RT_PU#(RT_SNG!(FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 4)) * V_0ef0!), V_0f20$, 7): RT_LPTQUEBRA 0   '@141ca DS:175c
V_0f14! = FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 4)) * V_0ef0! + V_0f14!   '@142ff
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@14334 DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING "   total de Carga Linear #####.##"; RT_PU#(V_0f14!, "   total de Carga Linear #####.##", 1): RT_LPTQUEBRA 0   '@14360 DS:1fde
L_14385:
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14385 DS:1530
IF NOT (A_1014!(0, 1) > 0.0) THEN GOTO L_14880   '@14398 DS:1890
RT_LPTABRE: RT_LPTAB 55: RT_LPS "": RT_LPS "unidades ": RT_LPS V_0de0$: RT_LPS "/": RT_LPS V_0ddc$: RT_LPFIM   '@143c5 DS:1530,1f2a,1f38
RT_LPTABRE: RT_LPS "   Carga Area      Area      Carga        Parcela Acidental     Total": RT_LPFIM   '@14405 DS:2004
V_0f20$ = "      \  \      #####.##    #####.##          #####.##       #####.##"   '@14418 DS:204e
V_1380! = 0.0   '@1442a DS:1890
V_0f14! = 1.0   '@1443b DS:158a
V_1384! = A_1014!(0, 1)   '@1444c
FOR V_0f0c! = 1.0 TO V_1384!   '@14470 DS:158a
V_1388! = 0.0   '@14478 DS:1890
V_138c! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@14489
FOR V_0f04! = 1.0 TO V_138c!   '@144b4 DS:158a
V_1390! = -(A_1014!(RT_CINT%(FX##(V_0f14!)), 0) > V_0f04!) * FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + V_0f04! + 2.0), 0)) + A_1014!(RT_CINT%(FX##(V_0f14!) + V_0f04! + 1.0), 0) + -(A_1014!(RT_CINT%(FX##(V_0f14!)), 0) = V_0f04!) * FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 0))   '@144bc DS:158a,1cc4
V_1388! = (A_1014!(RT_CINT%(FX##(V_0f14!) + V_0f04! + 1.0), 1) - -(A_1014!(RT_CINT%(FX##(V_0f14!)), 0) > V_0f04!) * FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + V_0f04! + 2.0), 1)) - -(A_1014!(RT_CINT%(FX##(V_0f14!)), 0) = V_0f04!) * FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 1))) * V_1390! / 2.0 + V_1388!   '@145ac DS:158a,1cc4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@146b1 DS:158a
V_1388! = ABS(FX##(V_1388!))   '@146dd
RT_LPTABRE: PRINT #RT_LPT, USING V_0f20$; "A" + LTRIM$(STR$(V_0f0c!)); RT_PU#(V_1388!, V_0f20$, 1); RT_PU#(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0), V_0f20$, 2); RT_PU#(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 1), V_0f20$, 3); RT_PU#(RT_SNG!(FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0)) * V_1388!), V_0f20$, 4): RT_LPTQUEBRA 0   '@146f1 DS:158a,16ae
V_1380! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0)) * V_1388! + V_1380!   '@147c2 DS:158a
V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@147fb DS:1cc4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@1482f DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING "   total de Carga Area #####.##"; RT_PU#(V_1380!, "   total de Carga Area #####.##", 1): RT_LPTQUEBRA 0   '@1485b DS:2098
L_14880:
L_14885:
IF NOT (V_0e3a% = 1) THEN GOTO L_14b61   '@14885
IF NOT (V_136c$ <> "*") THEN GOTO L_14941   '@14894 DS:1c50
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@148ab
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@148c4 DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@148e9 DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@14917 DS:1530
L_14941:
CALL S_288d3   '@14941
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@1494b
RT_ROTINA_0AEA   '@1495e (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14968 DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@1497b
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@14993
RT_LPTABRE: RT_LPS "   Tracos de Estrutura": RT_LPFIM   '@149a6 DS:20bc
V_1394! = A_1042!(0, 0)   '@149b9
FOR V_0f0c! = 1.0 TO V_1394!   '@149da DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING " ### (###.##,###.##  ###.##,###.##)"; RT_PU#(V_0f0c!, " ### (###.##,###.##  ###.##,###.##)", 1); RT_PU#(A_1042!(RT_CINT%(FX##(V_0f0c!)), 0), " ### (###.##,###.##  ###.##,###.##)", 2); RT_PU#(A_1042!(RT_CINT%(FX##(V_0f0c!)), 1), " ### (###.##,###.##  ###.##,###.##)", 3); RT_PU#(A_1042!(RT_CINT%(FX##(V_0f0c!)), 2), " ### (###.##,###.##  ###.##,###.##)", 4); RT_PU#(A_1042!(RT_CINT%(FX##(V_0f0c!)), 3), " ### (###.##,###.##  ###.##,###.##)", 5);: RT_LPTQUEBRA 0   '@149e2 DS:1f02
IF NOT (A_1042!(0, 0) = V_0f0c! OR FX##(V_0f0c!) / 2.0 = RT_CLNG&(FX##(V_0f0c!)) \ 2&) THEN GOTO L_14b1d   '@14a9f DS:1cc4
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14b0a DS:1530
L_14b1d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@14b1d DS:158a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14b49 DS:1530
L_14b61:
IF NOT (V_0e3e% = 1) THEN GOTO L_14ec7   '@14b61
IF NOT (V_136c$ <> "*") THEN GOTO L_14c1d   '@14b70 DS:1c50
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@14b87
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@14ba0 DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@14bc5 DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@14bf3 DS:1530
L_14c1d:
CALL S_30137   '@14c1d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@14c27
RT_ROTINA_0AEA   '@14c3a (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14c44 DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@14c57
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@14c6f
RT_LPTABRE: RT_LPS "   Pilares": RT_LPFIM   '@14c82 DS:20d6
V_1398! = A_1156!(0, 0)   '@14c95
FOR V_0f0c! = 1.0 TO V_1398!   '@14cb6 DS:158a
V_0f20$ = A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@14cbe
IF NOT (VAL(A_1128$(RT_CINT%(FX##(V_0f0c!)))) > 0.0#) THEN GOTO L_14d4c   '@14ce4 DS:1c56
V_0f20$ = "P" + A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@14d1c DS:1742
L_14d4c:
RT_LPTABRE: PRINT #RT_LPT, USING " \   \ (###.##,###.##  ###.##,###.##)"; V_0f20$; RT_PU#(A_1156!(RT_CINT%(FX##(V_0f0c!)), 0), " \   \ (###.##,###.##  ###.##,###.##)", 1); RT_PU#(A_1156!(RT_CINT%(FX##(V_0f0c!)), 1), " \   \ (###.##,###.##  ###.##,###.##)", 2); RT_PU#(A_1156!(RT_CINT%(FX##(V_0f0c!)), 2), " \   \ (###.##,###.##  ###.##,###.##)", 3); RT_PU#(A_1156!(RT_CINT%(FX##(V_0f0c!)), 3), " \   \ (###.##,###.##  ###.##,###.##)", 4);: RT_LPTQUEBRA 0   '@14d4c DS:20e4
IF NOT (A_1156!(0, 0) = V_0f0c! OR FX##(V_0f0c!) / 2.0 = RT_CLNG&(FX##(V_0f0c!)) \ 2&) THEN GOTO L_14e83   '@14e05 DS:1cc4
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14e70 DS:1530
L_14e83:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@14e83 DS:158a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14eaf DS:1530
L_14ec7:
IF NOT (V_0e3c% = 1) THEN GOTO L_15595   '@14ec7
IF NOT (V_136c$ <> "*") THEN GOTO L_14f83   '@14ed6 DS:1c50
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@14eed
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@14f06 DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@14f2b DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@14f59 DS:1530
L_14f83:
CALL S_20137   '@14f83
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@14f8d
RT_ROTINA_0AEA   '@14fa0 (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@14faa DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@14fbd
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@14fd5
RT_LPTABRE: RT_LPTAB 55: RT_LPS "": RT_LPS "unidades ": RT_LPS V_0de0$: RT_LPS "/": RT_LPS V_0ddc$: RT_LPFIM   '@14fe8 DS:1530,1f2a,1f38
RT_LPTABRE: RT_LPS "   Laje     Tipo    Area        Cota       Carga    Peso Proprio  Inclinacao": RT_LPFIM   '@15028 DS:210e
V_0f20$ = "   \     \   \ \  #####.##     ###.##     ####.##      ####.##"   '@1503b DS:215e
V_0f24$ = "   \     \   PRE  #####.##                ####.##                   ###.##"   '@1504d DS:21a0
V_0f14! = 0.0   '@1505f DS:1890
V_1390! = 0.0   '@15070 DS:1890
V_139c! = 0.0   '@15081 DS:1890
V_1380! = 1.0   '@15092 DS:158a
V_13a0! = A_109e%(0, 0)   '@150a3
FOR V_0f0c! = 1.0 TO V_13a0!   '@150c8 DS:158a
V_0f28_volta$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_1380!)))   '@150d0
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_15249   '@15108 DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING V_0f24$; V_0f28_volta$; RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2), V_0f24$, 1); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4), V_0f24$, 2); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5), V_0f24$, 3): RT_LPTQUEBRA 0   '@1513d
V_0f14! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) + V_0f14!   '@151cb
V_1390! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) * A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4) + V_1390!   '@151f8
L_15249:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 3.0 OR A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0) THEN GOTO L_154a6   '@15249 DS:1890,1894
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0) THEN GOTO L_1530c   '@152bd DS:1890
V_13a4$ = "MA"   '@152f2 DS:21ee
GOTO L_1531e   '@15304
L_1530c:
V_13a4$ = "MAn"   '@1530c DS:21f4
L_1531e:
RT_LPTABRE: PRINT #RT_LPT, USING V_0f20$; V_0f28_volta$; V_13a4$; RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2), V_0f20$, 1); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 3), V_0f20$, 2); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4), V_0f20$, 3); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5), V_0f20$, 4): RT_LPTQUEBRA 0   '@1531e
V_0f14! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) + V_0f14!   '@153dc
V_1390! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) * A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4) + V_1390!   '@15409
V_139c! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) * A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5) + V_139c!   '@15455
L_154a6:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 2.0) THEN GOTO L_154f1   '@154a6 DS:1cc4
V_1380! = FX##(V_1380!) + 1.0   '@154db DS:158a
L_154f1:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@154f1 DS:158a
RT_LPTABRE: PRINT #RT_LPT, USING "   Area total das Lajes        ######.##"; RT_PU#(V_0f14!, "   Area total das Lajes        ######.##", 1): RT_LPTQUEBRA 0   '@1551d DS:21fc
RT_LPTABRE: PRINT #RT_LPT, USING "   Carga total de Peso Proprio ######.##"; RT_PU#(V_139c!, "   Carga total de Peso Proprio ######.##", 1): RT_LPTQUEBRA 0   '@1553d DS:2228
RT_LPTABRE: PRINT #RT_LPT, USING "   Carga total de Estrutura    ######.##"; RT_PU#(V_1390!, "   Carga total de Estrutura    ######.##", 1): RT_LPTQUEBRA 0   '@1555d DS:2254
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@1557d DS:1530
L_15595:
IF NOT (V_0e40% = 1) THEN GOTO L_156ce   '@15595
IF NOT (V_136c$ <> "*") THEN GOTO L_15651   '@155a4 DS:1c50
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@155bb
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_0dd8$: RT_LPFIM   '@155d4 DS:1530
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS "OBRA ": RT_LPS V_0e24$: RT_LPFIM   '@155f9 DS:1530,1ea0
RT_LPTABRE: RT_LPTAB 10: RT_LPS "": RT_LPS V_1368$: RT_LPFIM   '@15627 DS:1530
L_15651:
CALL S_36ea2   '@15651
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY pelo roteiro (entre comandos)
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@1565b
RT_ROTINA_0AEA   '@1566e (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@15678 DS:1530
RT_LPTABRE: RT_LPS V_0e0c$   '@1568b
RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@156a3
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@156b6 DS:1530
L_156ce:
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@156ce
RT_SCREEN 0   '@156e1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_104df, L_1050a, L_10608   ' ON KEY no laco (B$EVCK)
GOTO L_1064b   '@156f6
' ---- F_1c735 @0x1c735  (01c735_F_1c735.lift.txt; evidence_id (assembly): ev_92ad85f82136084ecf90acfc440cd80f5e80333f2f33c7b94e24484ef9577340)
RT_FIM   ' @1c735 B$CENP (inicio/fim do modulo)
' ---- F_1c73a @0x1c73a  (01c73a_F_1c73a.lift.txt; evidence_id (assembly): ev_ae26c6f4296fd8773834db6d89b7fdd081b73024799cc73fbc15ca4ce097e22e)
'RETRAD? @1c73a ?? 50 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH ...
L_1c76c:
'RETRAD? @1c76c ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x1000:c770
L_1c770:
'RETRAD? @1c770 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x1000:c774
L_1c774:
'RETRAD? @1c774 ?? 360 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 157 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
' ---- M_LAJEGAUX @0x20030  (020030_M_LAJEGAUX.lift.txt; evidence_id (assembly): ev_2f4badde0ee5bee1153884a1174eb7eb1a0f779ab5dab6bc2075f09644744a25)
' @20030 inicio do programa (B$?EVT)
GOTO L_2877e   '@2012f
' ---- FUN_2000_877e @0x2877e  (02877e_FUN_2000_877e.lift.txt; evidence_id (assembly): ev_5081d90eb3f33df7f01a54d9f09a6b182f057571524aba4873614dcff708ecda)
L_2877e:   ' entrada vinda de 020030_M_LAJEGAUX
GOTO L_288cb   '@2877e
' ---- FUN_2000_88cb @0x288cb  (0288cb_FUN_2000_88cb.lift.txt; evidence_id (assembly): ev_6a33d3a58421c3a6e6ea114b67e6ea1494e8dfc197865d66aca842a52611a14f)
L_288cb:   ' entrada vinda de 02877e_FUN_2000_877e
GOTO L_2fe97   '@288cb
' ---- RT_EA @0x2fe97  (02fe97_RT_EA.lift.txt; evidence_id (assembly): ev_6e2a039153d8f058d3c784a25acf25884501e94daa79971b96ad3f49d99f085a)
L_2fe97:   ' entrada vinda de 0288cb_FUN_2000_88cb
RT_FIM   ' @2fe97 B$CENP (inicio/fim do modulo)
' ---- M_LAJEPIVI @0x30030  (030030_M_LAJEPIVI.lift.txt; evidence_id (assembly): ev_f056db30fbb53c537c16f8a17066b1772ac8154d5a83d3f6b6f22ad49a1d9a66)
' @30030 inicio do programa (B$?EVT)
GOTO L_36e9a   '@3012f
' ---- FUN_3000_6e9a @0x36e9a  (036e9a_FUN_3000_6e9a.lift.txt; evidence_id (assembly): ev_bf953eb6dbb543bd3c2513f14add6d71aa738760baf2d0664eb6c419f7ac2790)
L_36e9a:   ' entrada vinda de 030030_M_LAJEPIVI
GOTO L_3c99a   '@36e9a
' ---- RT_EA @0x3c99a  (03c99a_RT_EA.lift.txt; evidence_id (assembly): ev_f2c3627611d15587923fd80888c13545a056887ef4ed0afb3f7fc842b69c553c)
L_3c99a:   ' entrada vinda de 036e9a_FUN_3000_6e9a
RT_FIM   ' @3c99a B$CENP (inicio/fim do modulo)
' ---- M_LAJEOCUP @0x40030  (040030_M_LAJEOCUP.lift.txt; evidence_id (assembly): ev_8eaad38e49449512e7806be9635423bcd3e6bb0764434ca34f092f3d587400c4)
' @40030 inicio do programa (B$?EVT)
GOTO L_49543   '@4012f
' ---- FUN_4000_9543 @0x49543  (049543_FUN_4000_9543.lift.txt; evidence_id (assembly): ev_9c96d48ca9ab265c043bceb8a0814ec8d8496969d17f16be9df1c25bef7363fb)
L_49543:   ' entrada vinda de 040030_M_LAJEOCUP
GOTO L_4aaa2   '@49543
' ---- RT_EA @0x4aaa2  (04aaa2_RT_EA.lift.txt; evidence_id (assembly): ev_3b53ed3b363c2498dc58483ae5d868ded06faf53f9355890148be9c8bfec464e)
L_4aaa2:   ' entrada vinda de 049543_FUN_4000_9543
RT_FIM   ' @4aaa2 B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x60aea (chamada por CALL SUB_60aea no lift).
' Versao A; DS do original: inicio DS:415E, CR LF DS:4158, fim DS:415B, margem em [DS:444F], ESC L em [DS:4156].
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
    REDIM A_14fa%(-32768 TO -32768)
    V_134c! = 0
    V_1350$ = ""
    V_1354$ = ""
    V_1358! = 0
    V_135c! = 0
    V_1360! = 0
    V_1364! = 0
    V_1368$ = ""
    V_136c$ = ""
    V_1370! = 0
    V_1374! = 0
    V_1378! = 0
    V_137c! = 0
    V_1380! = 0
    V_1384! = 0
    V_1388! = 0
    V_138c! = 0
    V_1390! = 0
    V_1394! = 0
    V_1398! = 0
    V_139c! = 0
    V_13a0! = 0
    V_13a4$ = ""
    V_14b6! = 0
    V_14ba! = 0
    V_14be! = 0
    V_14c2% = 0
    V_14c4! = 0
    V_14c8! = 0
    V_14cc! = 0
    V_14d0! = 0
    V_14d4! = 0
    V_14d8! = 0
    V_14dc! = 0
    V_14e0! = 0
    V_14e4! = 0
    V_14e8! = 0
    V_14ec! = 0
    V_14f0! = 0
    V_14f4% = 0
    V_14f6! = 0
    V_1528$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_104df: BEEP; GOSUB L_10239; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_1050a: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_10608: sai da SUB (BEEP; GOSUB L_10239; RT_SCREEN 0; RETURN L_101b1)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H101f9: ON ERROR GOTO L_101f9
        CASE &H105cf: ON ERROR GOTO L_105cf
        CASE &H11029: ON ERROR GOTO L_11029
        CASE &H1129e: ON ERROR GOTO L_1129e
        CASE &H1340e: ON ERROR GOTO L_1340e
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_15706   ' entrada de SUB/FUNCTION (B$ENRA, locais 526 bytes) (0x15706)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16$
    DIM L_BP18%
    DIM L_BP1a%
    DIM L_BP1e$
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
    ' ---- FUN_1000_5706 @0x15706  (015706_FUN_1000_5706.lift.txt; evidence_id (assembly): ev_b68478cbe934b9a8bbe21abb2bfb72985697b4860cd87f46c3485eef723c24c4)
    REDIM A_14fa%(-32768 TO -32768)   '@15713
    REDIM A_14fa%(0 TO 480)   '@15721
    IF NOT (A_0f8a!(0, 1) < 2.0 OR A_0f8a!(0, 0) < 2.0) THEN GOTO L_157a7   '@1573e DS:1cc4
    GOTO L_1b29f   '@1579f
L_157a7:
    IF NOT (V_0e36% = 0) THEN GOTO L_157f6   '@157a7
    REDIM A_0fb8!(-32768 TO -32768, -32768 TO -32768)   '@157b6
    REDIM A_0fb8!(0 TO V_0e44%, 0 TO 3)   '@157c4
    V_0e36% = 1   '@157e6
L_157f6:
    L_BP16$ = V_0dcc_placa$   '@157f6
    IF NOT (L_BP16$ = "HER") THEN GOTO L_1586e   '@15808 DS:2280
    RT_SCREEN 3   '@1581f
    L_BP12! = 7.0   '@15835 DS:2288
    L_BP0e! = 7.0   '@15845 DS:2288
    V_14be! = 0.0   '@15855 DS:1890
    GOTO L_15967   '@15866
L_1586e:
    IF NOT (L_BP16$ <> "CGA") THEN GOTO L_15892   '@1586e DS:228c
    IF NOT (L_BP16$ = "MCG") THEN GOTO L_158de   '@15880 DS:2294
L_15892:
    RT_SCREEN 2   '@15892
    L_BP12! = 15.0   '@158a5 DS:1592
    L_BP0e! = 15.0   '@158b5 DS:1592
    V_14be! = 0.0   '@158c5 DS:1890
    GOTO L_15967   '@158d6
L_158de:
    IF NOT (L_BP16$ <> "EGA") THEN GOTO L_15902   '@158de DS:229c
    IF NOT (L_BP16$ = "VGA") THEN GOTO L_15967   '@158f0 DS:22a4
L_15902:
    RT_SCREEN 9   '@15902
    COLOR , 1   '@15918
    L_BP12! = 9.0   '@1592e DS:22ac
    L_BP0e! = 14.0   '@1593e DS:22b0
    V_14be! = 1.0   '@1594e DS:158a
    GOTO L_15967   '@1595f
L_15967:
    V_14c2% = 0   '@15967
    IF NOT (V_14f4% = 1) THEN GOTO L_15989   '@15972
    GOTO L_15a6e   '@15981
L_15989:
    V_14f6! = 2.0   '@15989 DS:1cc4
L_1599f:
    V_14e4! = A_0f8a!(1, 1)   '@159a4
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@159c5
    V_14e8! = A_0f8a!(1, 0)   '@15a02
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@15a25
    V_14f4% = 1   '@15a5e
L_15a6e:
    V_14cc! = V_14e4!   '@15a73
    V_14d0! = V_14e8!   '@15a84
    V_14c4! = V_14e4!   '@15a95
    V_14c8! = V_14e8!   '@15aa6
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@15ab7 DS:22b4
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@15ad5 DS:22b8
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_15b31   '@15af3 DS:22bc
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@15b13 DS:22bc
    GOTO L_15b4c   '@15b29
L_15b31:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@15b31 DS:22bc
L_15b4c:
L_15b51:
    RT_CLS -1   '@15b56
    RT_WINDOW 1, (0), (0), (639), (199)   '@15b64 DS:1890,1892,22c0,22c2,22c4,22c6 (B$WIND decodificado)
    V_14d4! = 45.0   '@15b92 DS:22c8
    V_14d8! = 10.0   '@15ba3 DS:158e
    GOSUB L_1a29d   '@15bb4
    IF NOT (A_0fb8!(0, 0) > 0.0) THEN GOTO L_15dff   '@15bc1 DS:1890
    GOSUB L_1b0d1   '@15beb
    IF NOT (A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 3) <= V_14f0! AND (A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 3) >= V_14e8! AND (A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 2) <= V_14ec! AND A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 2) >= V_14e4!))) THEN GOTO L_15df7   '@15bf8
    V_14cc! = A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 2)   '@15d10
    V_14d0! = A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 3)   '@15d47
    V_14c4! = A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 2)   '@15d81
    V_14c8! = A_0fb8!(RT_CINT%(FX##(A_0fb8!(0, 0))), 3)   '@15db8
L_15df7:
    GOTO L_15f24   '@15df7
L_15dff:
    IF NOT (LEN(V_0e24$) = 0) THEN GOTO L_15f1f   '@15dff
    RT_VIEWPRINT 23, 25   '@15e14
L_15e2b:
    RT_CLS 2   '@15e30
    PRINT " Defina o Nome da Obra ou Pavimento para Gravacao-Arquivo"   '@15e3e DS:22cc
    PRINT " Obra ";   '@15e4c DS:1de0
    CALL MIXT_07f1_LimpaTeclado   '@15e5a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@15e64 DS:1530 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP18% = (LEN(V_0f18$) = 0)   '@15e7e DS:1c56
    L_BP1a% = VAL(V_0f18$) > 0.0# OR L_BP18%   '@15ea0
    IF NOT ((INSTR(V_0f18$, ".") > 0 OR L_BP1a%) <> 0) THEN GOTO L_15ef0   '@15ec7 DS:230a
    BEEP   '@15ede
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15e2b   '@15ee8
L_15ef0:
    V_0e24$ = UCASE$(V_0f18$)   '@15ef0
    RT_VIEWPRINT 1, 25   '@15f08
L_15f1f:
L_15f24:
    IF NOT (V_1528$ = "S") THEN GOTO L_15f43   '@15f24 DS:1ca2
    GOTO L_1b29f   '@15f3b
L_15f43:
    V_14dc! = V_14c4!   '@15f43
    V_14e0! = V_14c8!   '@15f54
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@15f65 DS:2310
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@15fd8 DS:2310
    GOSUB L_1adbb   '@1604b
    GOSUB L_1af3e   '@16058
L_1606a:
    RT_VIEWPRINT 23, 25   '@1606f
    LOCATE 23, 1   '@16081
    PRINT " <"; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " *> Movimenta";   '@1609c DS:2314,231a
    IF NOT (V_14c2% = 0) THEN GOTO L_16181   '@160ef
    PRINT " por Eixo"; RT_TAB$(79); ""; ""   '@160fe DS:1530,232c
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <C>oordenada  <F>im"; RT_TAB$(79); ""; ""   '@16127 DS:1530,233a
    PRINT ""; RT_TAB$(79); ""; "";   '@16150 DS:1530
    GOTO L_16201   '@16179
L_16181:
    PRINT " por Coordenada"; RT_TAB$(79); ""; ""   '@16181 DS:1530,238c
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <E>ixo        <F>im"; RT_TAB$(79); ""; ""   '@161aa DS:1530,23a0
    PRINT "                      <+ -> <P>asso do cursor      <C>oordenada absoluta"; RT_TAB$(79); ""; "";   '@161d3 DS:1530,23f2
L_16201:
    LOCATE 24, 11   '@16201
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@1621f DS:243e
    RT_VIEWPRINT 1, 25   '@1624c
    LOCATE 22, 1   '@1625e
    PRINT RT_STRINGC$((27), (95)); "  A R Q U I T E T U R A  "; RT_STRINGC$((28), (95));   '@16279 DS:2452
L_162b2:
    V_0f18$ = ""   '@162b7 DS:1530
L_162ce:
    V_0f18$ = RT_INKEY$   '@162ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_162ce   '@162e2 DS:1530
    L_BP1e$ = V_0f18$   '@162f6
    IF NOT (L_BP1e$ <> "4") THEN GOTO L_16346   '@16308 DS:1852
    IF NOT (CHR$(0) + CHR$(75) = L_BP1e$) THEN GOTO L_16a27   '@1631f
L_16346:
    IF NOT (V_14c2% = 0) THEN GOTO L_169e9   '@16346
    FOR V_0f10! = A_0f8a!(0, 1) TO 1.0 STEP -1.0   '@16355 DS:158a,1c2c
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) < V_14cc!) THEN GOTO L_169b5   '@16374
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) >= V_14e4!) THEN GOTO L_16409   '@163a9
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@163de
L_16409:
    V_0f14! = 1.0   '@16409 DS:158a
    V_0ef4# = V_14c4!   '@1641a
L_16430:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_1697c   '@16431
    L_BP22! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@16455
    L_BP26! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@16480
    CALL MIXT_0877_Menor(L_BP22!, L_BP26!, L_BP2a!)   '@164a4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP26!   '@164b6
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP22!   '@164db
    IF NOT (L_BP2a! > V_14d0!) THEN GOTO L_1651c   '@16500
    GOTO L_16958   '@16514
L_1651c:
    L_BP2e! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@1651c
    L_BP32! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@16547
    CALL MIXT_082a_Maior(L_BP2e!, L_BP32!, L_BP36!)   '@1656b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP32!   '@1657d
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP2e!   '@165a2
    IF NOT (L_BP36! < V_14d0!) THEN GOTO L_165e3   '@165c7
    GOTO L_16958   '@165db
L_165e3:
    L_BP3a! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@165e3
    L_BP3e! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@1660d
    CALL MIXT_0877_Menor(L_BP3a!, L_BP3e!, L_BP42!)   '@1662e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP3e!   '@16640
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP3a!   '@16662
    IF NOT (L_BP42! > V_14cc!) THEN GOTO L_166a2   '@16686
    GOTO L_16958   '@1669a
L_166a2:
    L_BP46! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@166a2
    L_BP4a! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@166cc
    CALL MIXT_082a_Maior(L_BP46!, L_BP4a!, L_BP4e!)   '@166ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP4a!   '@166ff
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP46!   '@16721
    IF NOT (L_BP4e! < V_14c4!) THEN GOTO L_16761   '@16745
    GOTO L_16958   '@16759
L_16761:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_167b8   '@16761
    GOTO L_16958   '@167b0
L_167b8:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_16835   '@167b8
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@16803
    GOTO L_16907   '@1682d
L_16835:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@16835
L_16907:
    IF NOT (FX##(V_14cc!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_16953   '@16907
    IF NOT (FX##(V_0f04!) > FX##(V_0ef4#)) THEN GOTO L_16953   '@16927
    V_0ef4# = V_0f04!   '@16942
L_16953:
L_16958:
    V_0f14! = FX##(V_0f14!) + 1.0   '@1695d DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16430   '@16973
L_1697c:
    IF NOT (FX##(V_14c4!) < FX##(V_0ef4#)) THEN GOTO L_169a8   '@1697c
    V_14c4! = V_0ef4#   '@16997
L_169a8:
    GOTO L_169e1   '@169a8
L_169b5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@169b5 DS:158a,1c2c
L_169e1:
    GOTO L_16a1f   '@169e1
L_169e9:
    L_BP52! = FX##(V_14cc!) - V_14f6!   '@169e9
    CALL MIXT_082a_Maior(V_14e4!, L_BP52!, L_BP56!)   '@169fe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP56!   '@16a10
L_16a1f:
    GOTO L_1a006   '@16a1f
L_16a27:
    IF NOT (L_BP1e$ <> "6") THEN GOTO L_16a60   '@16a27 DS:186a
    IF NOT (CHR$(0) + CHR$(77) = L_BP1e$) THEN GOTO L_17158   '@16a39
L_16a60:
    IF NOT (V_14c2% = 0) THEN GOTO L_17116   '@16a60
    L_BP5a! = A_0f8a!(0, 1)   '@16a6f
    FOR V_0f10! = 1.0 TO L_BP5a!   '@16a92 DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) > V_14cc!) THEN GOTO L_170e3   '@16a9a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) <= V_14ec!) THEN GOTO L_16b2f   '@16acf
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@16b04
L_16b2f:
    V_0f14! = 1.0   '@16b2f DS:158a
    V_0ef4# = V_14c4!   '@16b40
L_16b56:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_170aa   '@16b57
    L_BP5e! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@16b7b
    L_BP62! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@16ba6
    CALL MIXT_0877_Menor(L_BP5e!, L_BP62!, L_BP66!)   '@16bca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP62!   '@16bdc
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP5e!   '@16c01
    IF NOT (L_BP66! > V_14d0!) THEN GOTO L_16c42   '@16c26
    GOTO L_17086   '@16c3a
L_16c42:
    L_BP6a! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@16c42
    L_BP6e! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@16c6d
    CALL MIXT_082a_Maior(L_BP6a!, L_BP6e!, L_BP72!)   '@16c91
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP6e!   '@16ca3
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP6a!   '@16cc8
    IF NOT (L_BP72! < V_14d0!) THEN GOTO L_16d09   '@16ced
    GOTO L_17086   '@16d01
L_16d09:
    L_BP76! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@16d09
    L_BP7a! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@16d33
    CALL MIXT_0877_Menor(L_BP76!, L_BP7a!, L_BP7e!)   '@16d54
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP7a!   '@16d66
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP76!   '@16d88
    IF NOT (L_BP7e! > V_14c4!) THEN GOTO L_16dc8   '@16dac
    GOTO L_17086   '@16dc0
L_16dc8:
    L_BP82! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@16dc8
    L_BP86! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@16df3
    CALL MIXT_082a_Maior(L_BP82!, L_BP86!, L_BP8a!)   '@16e15
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP86!   '@16e2a
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP82!   '@16e4d
    IF NOT (L_BP8a! < V_14cc!) THEN GOTO L_16e8f   '@16e72
    GOTO L_17086   '@16e87
L_16e8f:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_16ee6   '@16e8f
    GOTO L_17086   '@16ede
L_16ee6:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_16f63   '@16ee6
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@16f31
    GOTO L_17035   '@16f5b
L_16f63:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@16f63
L_17035:
    IF NOT (FX##(V_14cc!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_17081   '@17035
    IF NOT (FX##(V_0f04!) < FX##(V_0ef4#)) THEN GOTO L_17081   '@17055
    V_0ef4# = V_0f04!   '@17070
L_17081:
L_17086:
    V_0f14! = FX##(V_0f14!) + 1.0   '@1708b DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16b56   '@170a1
L_170aa:
    IF NOT (FX##(V_14c4!) > FX##(V_0ef4#)) THEN GOTO L_170d6   '@170aa
    V_14c4! = V_0ef4#   '@170c5
L_170d6:
    GOTO L_1710e   '@170d6
L_170e3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@170e3 DS:158a
L_1710e:
    GOTO L_17150   '@1710e
L_17116:
    L_BP8e! = FX##(V_14cc!) + V_14f6!   '@17116
    CALL MIXT_0877_Menor(V_14ec!, L_BP8e!, L_BP92!)   '@1712c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP92!   '@17140
L_17150:
    GOTO L_1a006   '@17150
L_17158:
    IF NOT (L_BP1e$ <> "8") THEN GOTO L_17191   '@17158 DS:18ea
    IF NOT (CHR$(0) + CHR$(72) = L_BP1e$) THEN GOTO L_1789d   '@1716a
L_17191:
    IF NOT (V_14c2% = 0) THEN GOTO L_1785b   '@17191
    L_BP96! = A_0f8a!(0, 0)   '@171a0
    FOR V_0f10! = 1.0 TO L_BP96!   '@171c1 DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) > V_14d0!) THEN GOTO L_17827   '@171c8
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) <= V_14f0!) THEN GOTO L_1725a   '@171fc
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@17230
L_1725a:
    V_0f14! = 1.0   '@1725a DS:158a
    V_0efc# = V_14c8!   '@1726b
L_17282:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_177ee   '@17283
    L_BP9a! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@172a7
    L_BP9e! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@172d2
    CALL MIXT_0877_Menor(L_BP9a!, L_BP9e!, L_BPa2!)   '@172f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP9e!   '@17309
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP9a!   '@1732c
    IF NOT (L_BPa2! > V_14cc!) THEN GOTO L_1736e   '@17351
    GOTO L_177cb   '@17366
L_1736e:
    L_BPa6! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@1736e
    L_BPaa! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@17399
    CALL MIXT_082a_Maior(L_BPa6!, L_BPaa!, L_BPae!)   '@173bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPaa!   '@173d0
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPa6!   '@173f3
    IF NOT (L_BPae! < V_14cc!) THEN GOTO L_17435   '@17418
    GOTO L_177cb   '@1742d
L_17435:
    L_BPb2! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17435
    L_BPb6! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@17461
    CALL MIXT_0877_Menor(L_BPb2!, L_BPb6!, L_BPba!)   '@17486
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPb6!   '@1749b
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPb2!   '@174c1
    IF NOT (L_BPba! > V_14c8!) THEN GOTO L_17504   '@174e7
    GOTO L_177cb   '@174fc
L_17504:
    L_BPbe! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17504
    L_BPc2! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@17530
    CALL MIXT_082a_Maior(L_BPbe!, L_BPc2!, L_BPc6!)   '@17555
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPc2!   '@1756a
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPbe!   '@17590
    IF NOT (L_BPc6! < V_14d0!) THEN GOTO L_175d3   '@175b6
    GOTO L_177cb   '@175cb
L_175d3:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_17626   '@175d3
    GOTO L_177cb   '@1761e
L_17626:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_176a8   '@17626
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17675
    GOTO L_1777a   '@176a0
L_176a8:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@176a8
L_1777a:
    IF NOT (FX##(V_14d0!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_177c6   '@1777a
    IF NOT (FX##(V_0f04!) < FX##(V_0efc#)) THEN GOTO L_177c6   '@1779a
    V_0efc# = V_0f04!   '@177b5
L_177c6:
L_177cb:
    V_0f14! = FX##(V_0f14!) + 1.0   '@177d0 DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17282   '@177e6
L_177ee:
    IF NOT (FX##(V_14c8!) > FX##(V_0efc#)) THEN GOTO L_1781a   '@177ee
    V_14c8! = V_0efc#   '@17809
L_1781a:
    GOTO L_17853   '@1781a
L_17827:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@17827 DS:158a
L_17853:
    GOTO L_17895   '@17853
L_1785b:
    L_BPca! = FX##(V_14d0!) + V_14f6!   '@1785b
    CALL MIXT_0877_Menor(V_14f0!, L_BPca!, L_BPce!)   '@17871
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BPce!   '@17885
L_17895:
    GOTO L_1a006   '@17895
L_1789d:
    IF NOT (L_BP1e$ <> "2") THEN GOTO L_178d6   '@1789d DS:183a
    IF NOT (CHR$(0) + CHR$(80) = L_BP1e$) THEN GOTO L_17fd7   '@178af
L_178d6:
    IF NOT (V_14c2% = 0) THEN GOTO L_17f95   '@178d6
    FOR V_0f10! = A_0f8a!(0, 0) TO 1.0 STEP -1.0   '@178e5 DS:158a,1c2c
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) < V_14d0!) THEN GOTO L_17f61   '@17902
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) >= V_14e8!) THEN GOTO L_17994   '@17936
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@1796a
L_17994:
    V_0f14! = 1.0   '@17994 DS:158a
    V_0efc# = V_14c8!   '@179a5
L_179bc:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_17f28   '@179bd
    L_BPd2! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@179e1
    L_BPd6! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@17a0c
    CALL MIXT_0877_Menor(L_BPd2!, L_BPd6!, L_BPda!)   '@17a2e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPd6!   '@17a43
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPd2!   '@17a66
    IF NOT (L_BPda! > V_14cc!) THEN GOTO L_17aa8   '@17a8b
    GOTO L_17f05   '@17aa0
L_17aa8:
    L_BPde! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@17aa8
    L_BPe2! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@17ad3
    CALL MIXT_082a_Maior(L_BPde!, L_BPe2!, L_BPe6!)   '@17af5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPe2!   '@17b0a
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPde!   '@17b2d
    IF NOT (L_BPe6! < V_14cc!) THEN GOTO L_17b6f   '@17b52
    GOTO L_17f05   '@17b67
L_17b6f:
    L_BPea! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17b6f
    L_BPee! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@17b9b
    CALL MIXT_0877_Menor(L_BPea!, L_BPee!, L_BPf2!)   '@17bc0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPee!   '@17bd5
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPea!   '@17bfb
    IF NOT (L_BPf2! > V_14d0!) THEN GOTO L_17c3e   '@17c21
    GOTO L_17f05   '@17c36
L_17c3e:
    L_BPf6! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17c3e
    L_BPfa! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@17c6a
    CALL MIXT_082a_Maior(L_BPf6!, L_BPfa!, L_BPfe!)   '@17c8f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPfa!   '@17ca4
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPf6!   '@17cca
    IF NOT (L_BPfe! < V_14c8!) THEN GOTO L_17d0d   '@17cf0
    GOTO L_17f05   '@17d05
L_17d0d:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_17d60   '@17d0d
    GOTO L_17f05   '@17d58
L_17d60:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_17de2   '@17d60
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@17daf
    GOTO L_17eb4   '@17dda
L_17de2:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@17de2
L_17eb4:
    IF NOT (FX##(V_14d0!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_17f00   '@17eb4
    IF NOT (FX##(V_0f04!) > FX##(V_0efc#)) THEN GOTO L_17f00   '@17ed4
    V_0efc# = V_0f04!   '@17eef
L_17f00:
L_17f05:
    V_0f14! = FX##(V_0f14!) + 1.0   '@17f0a DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_179bc   '@17f20
L_17f28:
    IF NOT (FX##(V_14c8!) < FX##(V_0efc#)) THEN GOTO L_17f54   '@17f28
    V_14c8! = V_0efc#   '@17f43
L_17f54:
    GOTO L_17f8d   '@17f54
L_17f61:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@17f61 DS:158a,1c2c
L_17f8d:
    GOTO L_17fcf   '@17f8d
L_17f95:
    L_BP102! = FX##(V_14d0!) - V_14f6!   '@17f95
    CALL MIXT_082a_Maior(V_14e8!, L_BP102!, L_BP106!)   '@17fab
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP106!   '@17fbf
L_17fcf:
    GOTO L_1a006   '@17fcf
L_17fd7:
    IF NOT (L_BP1e$ = "*") THEN GOTO L_1800d   '@17fd7 DS:1c50
    V_0f18$ = "A"   '@17fe9 DS:16ae
    CALL S_1b2df   '@17ffb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_1a006   '@18005
L_1800d:
    IF NOT (CHR$(13) = L_BP1e$) THEN GOTO L_18485   '@1800d
    IF NOT (V_14e0! = V_14c8! AND V_14dc! = V_14c4!) THEN GOTO L_1807a   '@18025
    BEEP   '@18063
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@1806d
L_1807a:
    V_0f10! = FX##(A_0fb8!(0, 0)) + 1.0   '@1807a DS:158a
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0) = V_14dc!   '@1809f
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1) = V_14e0!   '@180c9
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2) = V_14c4!   '@180f4
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3) = V_14c8!   '@1811c
    A_0fb8!(0, 0) = FX##(A_0fb8!(0, 0)) + 1.0   '@18147 DS:158a
    GOSUB L_1b254   '@1817b
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@18188 DS:2470
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@181f2 DS:2470,2474
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@18267 DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP0e!)), 0   '@182ed DS:2478
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@18382 DS:2310
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@183f5 DS:2310
    GOSUB L_1adbb   '@18468
    GOTO L_184ae   '@18475
L_18485:
    IF NOT (L_BP1e$ <> "I") THEN GOTO L_184a9   '@18485 DS:17d0
    IF NOT (L_BP1e$ = "i") THEN GOTO L_1853d   '@18497 DS:18f0
L_184a9:
L_184ae:
    GOSUB L_1af3e   '@184b3
    V_14dc! = V_14c4!   '@184c0
    V_14e0! = V_14c8!   '@184d1
    LOCATE 24, 11   '@184e2
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@18500 DS:243e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@1852d
L_1853d:
    IF NOT (L_BP1e$ <> "D") THEN GOTO L_18561   '@1853d DS:1cae
    IF NOT (L_BP1e$ = "d") THEN GOTO L_19909   '@1854f DS:1cb4
L_18561:
    RT_VIEWPRINT 23, 25   '@18561
    RT_CLS 2   '@18573
    RT_VIEWPRINT 1, 25   '@18581
    LOCATE 24, 1   '@18593
    PRINT " <T>odo o contorno   <U>ltimo trecho   <E>scolher o trecho  <*R*>etorno";   '@185ae DS:247c
    CALL MIXT_07f1_LimpaTeclado   '@185c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@185d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP10a$ = V_0f18$   '@185ec
    IF NOT (L_BP10a$ <> "T") THEN GOTO L_1862a   '@185ff DS:24c8
    IF NOT (L_BP10a$ = "t") THEN GOTO L_18677   '@18617 DS:24ce
L_1862a:
    REDIM A_0fb8!(-32768 TO -32768, -32768 TO -32768)   '@1862a
    REDIM A_0fb8!(0 TO V_0e44%, 0 TO 3)   '@18638
    GOSUB L_1b254   '@1865a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15b51   '@18667
L_18677:
    IF NOT (L_BP10a$ <> "U") THEN GOTO L_1869d   '@18677 DS:24d4
    IF NOT (L_BP10a$ = "u") THEN GOTO L_18aee   '@1868a DS:24da
L_1869d:
    V_0f10! = A_0fb8!(0, 0)   '@1869d
    IF NOT (V_0f10! = 0.0) THEN GOTO L_186ef   '@186bd DS:1890
    BEEP   '@186d8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@186e2
L_186ef:
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@186ef DS:2470
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@18759 DS:2470,2474
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@187ce DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@18854 DS:2478
    A_0fb8!(0, 0) = FX##(A_0fb8!(0, 0)) - 1.0   '@188ea DS:1c2c
    GOSUB L_1a812   '@1891e
    GOSUB L_1b0d1   '@1892b
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@18938 DS:2310
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@189ab DS:2310
    V_14c4! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@18a1e
    V_14c8! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@18a48
    GOSUB L_1b254   '@18a73
    GOSUB L_1af3e   '@18a80
    GOSUB L_1adbb   '@18a8d
    V_14cc! = V_14c4!   '@18a9a
    V_14d0! = V_14c8!   '@18aab
    V_14dc! = V_14c4!   '@18abc
    V_14e0! = V_14c8!   '@18acd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@18ade
L_18aee:
    IF NOT (L_BP10a$ <> "E") THEN GOTO L_18b14   '@18aee DS:1718
    IF NOT (L_BP10a$ = "e") THEN GOTO L_198f4   '@18b01 DS:1858
L_18b14:
    LOCATE 24, 1   '@18b14
    PRINT " Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@18b2f DS:1530,24e0
L_18b5d:
    V_0f18$ = "NENHUM"   '@18b62 DS:252c
    FOR V_0f10! = A_0fb8!(0, 0) TO 1.0 STEP -1.0   '@18b74 DS:158a,1c2c
    L_BP10e! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@18b90
    L_BP112! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)   '@18bbb
    CALL MIXT_0877_Menor(L_BP10e!, L_BP112!, L_BP116!)   '@18bdd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP112!   '@18bf2
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP10e!   '@18c15
    L_BP11a! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@18c3a
    L_BP11e! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)   '@18c5f
    CALL MIXT_082a_Maior(L_BP11a!, L_BP11e!, L_BP122!)   '@18c81
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP11e!   '@18c96
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP11a!   '@18cb9
    L_BP126! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@18cde
    L_BP12a! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)   '@18d04
    CALL MIXT_0877_Menor(L_BP126!, L_BP12a!, L_BP12e!)   '@18d29
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP12a!   '@18d3e
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP126!   '@18d64
    L_BP132! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@18d8a
    L_BP136! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)   '@18db0
    CALL MIXT_082a_Maior(L_BP132!, L_BP136!, L_BP13a!)   '@18dd5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP136!   '@18dea
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP132!   '@18e10
    IF NOT (L_BP13a! <= V_14f0! AND (L_BP12e! >= V_14e8! AND (L_BP122! <= V_14ec! AND L_BP116! >= V_14e4!))) THEN GOTO L_19844   '@18e36
L_18eaa:
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@18eaa DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@18f30 DS:2478
    L_BP13e! = RT_TIMER   '@18fc6
L_18fe2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP13e! < 0.100000001490116119384765625## THEN GOTO L_18fe2   '@18fe2 DS:2536
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@19004 DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP0e!)), 0   '@1908a DS:2478
    L_BP13e! = RT_TIMER   '@1911f
L_1913a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP13e! < 0.100000001490116119384765625## THEN GOTO L_1913a   '@1913a DS:2536
    V_0f18$ = RT_INKEY$   '@1915c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_18eaa   '@19170 DS:1530
    L_BP142$ = V_0f18$   '@19187
    IF NOT (L_BP142$ <> "S") THEN GOTO L_191c5   '@1919a DS:1ca2
    IF NOT (L_BP142$ = "s") THEN GOTO L_19780   '@191b2 DS:1ca8
L_191c5:
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@191c5 DS:2470
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@1922f DS:2470,2474
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@192a4 DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@1932a DS:2478
    GOSUB L_1a812   '@193c0
    L_BP146! = A_0fb8!(0, 0)   '@193cd
    FOR V_0f14! = FX##(V_0f10!) + 1.0 TO L_BP146!   '@193ee DS:158a
    FOR V_0f04! = 0.0 TO 3.0   '@193fa DS:158a,1890,1894
    A_0fb8!(RT_CINT%(FX##(V_0f14!) - 1.0), RT_CINT%(FX##(V_0f04!))) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!)))   '@19408 DS:1c2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@19460 DS:158a,1894
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@1948c DS:158a
    IF NOT (V_0f10! > 1.0 AND A_0fb8!(0, 0) > V_0f10!) THEN GOTO L_1951b   '@194b8 DS:158a
    V_0f10! = FX##(V_0f10!) + 1.0   '@19505 DS:158a
L_1951b:
    A_0fb8!(0, 0) = FX##(A_0fb8!(0, 0)) - 1.0   '@1951b DS:1c2c
    GOSUB L_1b254   '@1954f
    GOSUB L_1b0d1   '@1955c
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@19569 DS:2310
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@195dc DS:2310
    L_BP14a! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@1964f DS:2474
    L_BP14e! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@19675 DS:2310
    L_BP152$ = CHR$(26)   '@19697
    L_BP156$ = "CGA"   '@196ab DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP14a!, L_BP14e!, L_BP152$, L_BP156$)   '@196b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @196d2 libera strings locais (L_BP152)
    ' @196dc libera strings locais (L_BP156)
    L_BP15a! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@196e6
    L_BP15e! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@19707 DS:2310
    L_BP162$ = CHR$(27)   '@19729
    L_BP166$ = "CGA"   '@1973d DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP15a!, L_BP15e!, L_BP162$, L_BP166$)   '@1974b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @19764 libera strings locais (L_BP162)
    ' @1976e libera strings locais (L_BP166)
    GOTO L_1983f   '@19778
L_19780:
    IF NOT (L_BP142$ <> "F") THEN GOTO L_197a6   '@19780 DS:253a
    IF NOT (L_BP142$ = "f") THEN GOTO L_197b6   '@19793 DS:2540
L_197a6:
    GOTO L_19870   '@197a6
L_197b6:
    IF NOT (L_BP142$ <> "R") THEN GOTO L_197dc   '@197b6 DS:17fa
    IF NOT (L_BP142$ = "r") THEN GOTO L_1983a   '@197c9 DS:18fc
L_197dc:
    L_BP16a! = FX##(V_0f10!) + 2.0   '@197dc DS:1cc4
    L_BP16e! = FX##(A_0fb8!(0, 0)) + 1.0   '@197f2 DS:158a
    CALL MIXT_0877_Menor(L_BP16a!, L_BP16e!, L_BP172!)   '@19812
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BP172!   '@19827
    GOTO L_1983f   '@19832
L_1983a:
L_1983f:
L_19844:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@19844 DS:158a,1c2c
L_19870:
    L_BP174% = (V_0f10! = 0.0)   '@19870 DS:1890
    IF NOT ((A_0fb8!(0, 0) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP174%)) <> 0) THEN GOTO L_198e4   '@1989a DS:1890,252c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_18b5d   '@198dc
L_198e4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@198e4
L_198f4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@198f4
L_19909:
    IF NOT (L_BP1e$ <> "R") THEN GOTO L_1992d   '@19909 DS:17fa
    IF NOT (L_BP1e$ = "r") THEN GOTO L_1994a   '@1991b DS:18fc
L_1992d:
    GOSUB L_1b0d1   '@1992d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@1993a
L_1994a:
    IF NOT (L_BP1e$ <> "Z") THEN GOTO L_1996e   '@1994a DS:2546
    IF NOT (L_BP1e$ = "z") THEN GOTO L_19abb   '@1995c DS:254c
L_1996e:
L_19973:
    RT_VIEWPRINT 23, 25   '@19978
    RT_CLS 2   '@1998a
    RT_VIEWPRINT 1, 25   '@19998
    LOCATE 24, 1   '@199aa
    PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@199c5 DS:2552
    CALL MIXT_07f1_LimpaTeclado   '@199d3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@199dd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP178$ = V_0f18$   '@199f9
    IF NOT (L_BP178$ <> "D") THEN GOTO L_19a37   '@19a0c DS:1cae
    IF NOT (L_BP178$ = "d") THEN GOTO L_19a70   '@19a24 DS:1cb4
L_19a37:
    CALL S_4954b   '@19a37
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f18$ = "FIM") THEN GOTO L_19a60   '@19a41 DS:1888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19973   '@19a58
L_19a60:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15a6e   '@19a60
L_19a70:
    IF NOT (L_BP178$ <> "T") THEN GOTO L_19a96   '@19a70 DS:24c8
    IF NOT (L_BP178$ = "t") THEN GOTO L_19aa6   '@19a83 DS:24ce
L_19a96:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1599f   '@19a96
L_19aa6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19aa6
L_19abb:
    IF NOT (L_BP1e$ <> "C") THEN GOTO L_19adf   '@19abb DS:176e
    IF NOT (L_BP1e$ = "c") THEN GOTO L_19d79   '@19acd DS:1876
L_19adf:
    IF NOT (V_14c2% = 0) THEN GOTO L_19b09   '@19adf
    V_14c2% = 1   '@19aee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19af9
L_19b09:
    RT_VIEWPRINT 23, 25   '@19b09
    RT_CLS 2   '@19b1b
    RT_VIEWPRINT 1, 25   '@19b29
    LOCATE 23, 1   '@19b3b
    PRINT USING " Movimente o cursor ate a Coordenada *###.###,###.###* "; RT_PU#(V_14c4!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 1); RT_PU#(V_14c8!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 2);   '@19b56 DS:25a0
    CALL MIXT_07f1_LimpaTeclado   '@19b83
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@19b8d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP17a% = (LEN(V_0f18$) = 0)   '@19b9f
    IF NOT ((LEN(V_0f1c$) = 0 AND L_BP17a%) <> 0) THEN GOTO L_19bdd   '@19bbd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19bd5
L_19bdd:
    L_BP17c% = (LEN(V_0f18$) > 0)   '@19bdd
    L_BP17e% = FX##(VAL(V_0f18$)) >= FX##(V_14e4!) AND L_BP17c%   '@19c00
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_14ec!) AND L_BP17e%) <> 0) THEN GOTO L_19c66   '@19c2a
    V_14c4! = VAL(V_0f18$)   '@19c4c
L_19c66:
    L_BP180% = (LEN(V_0f1c$) > 0)   '@19c66
    L_BP182% = FX##(VAL(V_0f1c$)) >= FX##(V_14e8!) AND L_BP180%   '@19c89
    IF NOT ((FX##(VAL(V_0f1c$)) <= FX##(V_14f0!) AND L_BP182%) <> 0) THEN GOTO L_19cef   '@19cb3
    V_14c8! = VAL(V_0f1c$)   '@19cd5
L_19cef:
    GOSUB L_1adbb   '@19cef
    LOCATE 23, 40   '@19cfc
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14c4!, "(###.##,###.##)", 1); RT_PU#(V_14c8!, "(###.##,###.##)", 2)   '@19d1a DS:243e
    V_14cc! = V_14c4!   '@19d42
    V_14d0! = V_14c8!   '@19d53
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19d64
L_19d79:
    IF NOT (L_BP1e$ <> "E") THEN GOTO L_19d9d   '@19d79 DS:1718
    IF NOT (L_BP1e$ = "e") THEN GOTO L_19dc7   '@19d8b DS:1858
L_19d9d:
    IF NOT (V_14c2% = 1) THEN GOTO L_19dbf   '@19d9d
    V_14c2% = 0   '@19dac
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19db7
L_19dbf:
    GOTO L_1a006   '@19dbf
L_19dc7:
    IF NOT (L_BP1e$ = "+") THEN GOTO L_19e06   '@19dc7 DS:25dc
    IF NOT (V_14c2% = 1) THEN GOTO L_19dfe   '@19dd9
    V_14f6! = FX##(V_14f6!) * 2.0   '@19de8 DS:1cc4
L_19dfe:
    GOTO L_1a006   '@19dfe
L_19e06:
    IF NOT (L_BP1e$ = "-") THEN GOTO L_19e45   '@19e06 DS:25e2
    IF NOT (V_14c2% = 1) THEN GOTO L_19e3d   '@19e18
    V_14f6! = FX##(V_14f6!) / 2.0   '@19e27 DS:1cc4
L_19e3d:
    GOTO L_1a006   '@19e3d
L_19e45:
    IF NOT (L_BP1e$ <> "P") THEN GOTO L_19e69   '@19e45 DS:1742
    IF NOT (L_BP1e$ = "p") THEN GOTO L_19fb0   '@19e57 DS:1864
L_19e69:
    IF NOT (V_14c2% = 0) THEN GOTO L_19e80   '@19e69
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@19e78
L_19e80:
    RT_VIEWPRINT 23, 25   '@19e80
    RT_CLS 2   '@19e92
    RT_VIEWPRINT 1, 25   '@19ea0
    LOCATE 23, 1   '@19eb2
    PRINT USING " Passo de movimentacao *###.####* "; RT_PU#(V_14f6!, " Passo de movimentacao *###.####* ", 1);   '@19ecd DS:25e8
    CALL MIXT_07f1_LimpaTeclado   '@19eed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@19ef7 DS:1530
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_19fa0   '@19f11
    L_BP184% = (VAL(V_0f18$) > 0.0#)   '@19f26 DS:1c56,260e
    IF NOT ((FX##(VAL(V_0f18$)) < 50.0 * FX##(V_14f6!) AND L_BP184%) <> 0) THEN GOTO L_19f9b   '@19f5f
    V_14f6! = VAL(V_0f18$)   '@19f81
L_19f9b:
L_19fa0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1606a   '@19fa0
L_19fb0:
    IF NOT (L_BP1e$ <> "F") THEN GOTO L_19fd4   '@19fb0 DS:253a
    IF NOT (L_BP1e$ = "f") THEN GOTO L_19ff9   '@19fc2 DS:2540
L_19fd4:
    RT_SCREEN 0   '@19fd4
    GOTO L_1b29f   '@19fe9
L_19ff9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@19ff9
L_1a006:
    GOSUB L_1adbb   '@1a006
    LOCATE 23, 60   '@1a013
    V_0f18$ = ""   '@1a031 DS:1530
    IF NOT (V_14c2% = 0) THEN GOTO L_1a23d   '@1a043
    L_BP188! = A_0f8a!(0, 1)   '@1a052
    FOR V_0f10! = 1.0 TO L_BP188!   '@1a076 DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) = V_14c4!) THEN GOTO L_1a155   '@1a07e
    V_0f18$ = CHR$(RT_CINT%(FX##(V_0f10!) + 26& * ((RT_CLNG&(FX##(V_0f10!)) \ 26&) * (V_0f10! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f10!) - 1.0) \ 26&), ("'"))   '@1a0b3 DS:1c20,1c24,1c2c,1c30
    GOTO L_1a181   '@1a14d
L_1a155:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1a155 DS:158a
L_1a181:
    L_BP18c! = A_0f8a!(0, 0)   '@1a181
    FOR V_0f10! = 1.0 TO L_BP18c!   '@1a1a2 DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) = V_14c8!) THEN GOTO L_1a20c   '@1a1aa
    V_0f18$ = V_0f18$ + STR$(V_0f10!)   '@1a1de
    GOTO L_1a238   '@1a204
L_1a20c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1a20c DS:158a
L_1a238:
L_1a23d:
    PRINT USING "(###.##,###.##) \   \ "; RT_PU#(V_14c4!, "(###.##,###.##) \   \ ", 1); RT_PU#(V_14c8!, "(###.##,###.##) \   \ ", 2); V_0f18$   '@1a23d DS:2612
    V_14cc! = V_14c4!   '@1a26e
    V_14d0! = V_14c8!   '@1a27f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_162b2   '@1a290
    ' ---- F_1a298 @0x1a298  (01a298_F_1a298.lift.txt; evidence_id (assembly): ev_13029357b3841f33dcc91e5ecc9ddb20c898724fea9b2db2677939e3daa7dfe9)
L_1a29d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    L_BP18e% = (V_0dcc_placa$ = "EGA")   '@1a2a2 DS:229c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP18e%) <> 0) THEN GOTO L_1a2f4   '@1a2c8 DS:22a4
    COLOR 10   '@1a2de
L_1a2f4:
    L_BP192! = A_0f8a!(0, 0)   '@1a2f4
    FOR V_0f14! = 1.0 TO L_BP192!   '@1a315 DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_1a4ec   '@1a31c
    RT_LINE 30.0, RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 620.0, RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 73, RT_CINT%(FX##(L_BP12!)), 4112   '@1a38e DS:2478,262c,2630
    L_BP196! = 2.0   '@1a441 DS:1cc4
    L_BP19a! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@1a453 DS:2310
    L_BP19e$ = LTRIM$(STR$(V_0f14!))   '@1a48e
    L_BP1a2$ = "CGA"   '@1a4ac DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP196!, L_BP19a!, L_BP19e$, L_BP1a2$)   '@1a4ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1a4d3 libera strings locais (L_BP19e)
    ' @1a4dd libera strings locais (L_BP1a2)
L_1a4ec:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@1a4ec DS:158a
    L_BP1a6! = A_0f8a!(0, 1)   '@1a518
    FOR V_0f14! = 1.0 TO L_BP1a6!   '@1a53c DS:158a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) >= V_14e4!) THEN GOTO L_1a77e   '@1a544
    RT_LINE RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), 5.0, RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), 157.0, 73, RT_CINT%(FX##(L_BP12!)), 4369   '@1a5b8 DS:2634,2638
    L_BP1aa! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@1a65d DS:1ccc
    L_BP1ae! = 165.0   '@1a69d DS:2478
    L_BP1b2$ = CHR$(RT_CINT%(FX##(V_0f14!) + 26& * ((RT_CLNG&(FX##(V_0f14!)) \ 26&) * (V_0f14! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f14!) - 1.0) \ 26&), ("'"))   '@1a6a9 DS:1c20,1c24,1c2c,1c30
    L_BP1b6$ = "CGA"   '@1a73e DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP1aa!, L_BP1ae!, L_BP1b2$, L_BP1b6$)   '@1a74c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1a765 libera strings locais (L_BP1b2)
    ' @1a76f libera strings locais (L_BP1b6)
L_1a77e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@1a77e DS:158a
    L_BP1b8% = (V_0dcc_placa$ = "EGA")   '@1a7aa DS:229c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP1b8%) <> 0) THEN GOTO L_1a803   '@1a7d0 DS:22a4
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1a7e6
L_1a803:
    RETURN   '@1a803
L_1a812:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    L_BP1bc! = A_0f8a!(0, 0)   '@1a817
    FOR V_0f14! = 1.0 TO L_BP1bc!   '@1a838 DS:158a
    L_BP1c0! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@1a840
    L_BP1c4! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)   '@1a86c
    CALL MIXT_082a_Maior(L_BP1c0!, L_BP1c4!, L_BP1c8!)   '@1a891
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP1c4!   '@1a8a6
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP1c0!   '@1a8cc
    L_BP1cc! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@1a8f2
    L_BP1d0! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)   '@1a918
    CALL MIXT_0877_Menor(L_BP1cc!, L_BP1d0!, L_BP1d4!)   '@1a93d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP1d0!   '@1a952
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP1cc!   '@1a978
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= L_BP1d4! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= L_BP1c8!) THEN GOTO L_1aac2   '@1a99e
    RT_LINE 30.0, RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 620.0, RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 73, RT_CINT%(FX##(L_BP12!)), 4112   '@1aa0a DS:2478,262c,2630
L_1aac2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@1aac2 DS:158a
    L_BP1d8! = A_0f8a!(0, 1)   '@1aaee
    FOR V_0f14! = 1.0 TO L_BP1d8!   '@1ab12 DS:158a
    L_BP1dc! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@1ab1a
    L_BP1e0! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)   '@1ab45
    CALL MIXT_082a_Maior(L_BP1dc!, L_BP1e0!, L_BP1e4!)   '@1ab67
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP1e0!   '@1ab7c
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP1dc!   '@1ab9f
    L_BP1e8! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@1abc4
    L_BP1ec! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)   '@1abe9
    CALL MIXT_0877_Menor(L_BP1e8!, L_BP1ec!, L_BP1f0!)   '@1ac0b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP1ec!   '@1ac20
    A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP1e8!   '@1ac43
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) >= L_BP1f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) <= L_BP1e4!) THEN GOTO L_1ad80   '@1ac68
    RT_LINE RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), 5.0, RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), 157.0, 73, RT_CINT%(FX##(L_BP12!)), 4369   '@1acd6 DS:2634,2638
L_1ad80:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@1ad80 DS:158a
    RETURN   '@1adac
L_1adbb:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    RT_GPONTO RT_SNG!((FX##(V_14cc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14d0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@1adc0 DS:2470
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@1ae2a DS:2310
    L_BP1f4! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@1ae9d
    L_BP1f8! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@1aebe DS:2310
    L_BP1fc$ = CHR$(27)   '@1aee0
    L_BP200$ = "CGA"   '@1aef4 DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP1f4!, L_BP1f8!, L_BP1fc$, L_BP200$)   '@1af02
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1af1b libera strings locais (L_BP1fc)
    ' @1af25 libera strings locais (L_BP200)
    RETURN   '@1af2f
L_1af3e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@1af43 DS:2470,2474
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@1afb8 DS:2310
    L_BP204! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@1b02b DS:2474
    L_BP208! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@1b051 DS:2310
    L_BP20c$ = CHR$(26)   '@1b073
    L_BP210$ = "CGA"   '@1b087 DS:228c
    CALL MIXT_08c4_TextoGrafico(L_BP204!, L_BP208!, L_BP20c$, L_BP210$)   '@1b095
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @1b0ae libera strings locais (L_BP20c)
    ' @1b0b8 libera strings locais (L_BP210)
    RETURN   '@1b0c2
L_1b0d1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    L_BP214! = A_0fb8!(0, 0)   '@1b0d6
    FOR L_BP218! = 1.0 TO L_BP214!   '@1b0f7 DS:158a
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP218!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP218!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@1b0fe DS:2478
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP218!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP218!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP0e!)), 0   '@1b184 DS:2478
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP218!   '@1b219 DS:158a
    RETURN   '@1b245
L_1b254:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015706_FUN_1000_5706
    V_0e3c% = 0   '@1b259
    V_120e% = 0   '@1b264
    V_126c% = 0   '@1b26f
    V_12f8% = 0   '@1b27a
    V_12fa% = 0   '@1b285
    RETURN   '@1b290
L_1b29f:   ' entrada vinda de 015706_FUN_1000_5706
    ' @1b29f libera strings locais (L_BP178)
    ' @1b2a9 libera strings locais (L_BP142)
    ' @1b2b3 libera strings locais (L_BP10a)
    ' @1b2bd libera strings locais (L_BP1e)
    ' @1b2c6 libera strings locais (L_BP16)
    ' END SUB   '@1b2cf
END SUB

SUB S_1b2df   ' entrada de SUB/FUNCTION (B$ENRA, locais 84 bytes) (0x1b2df)
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
    ' ---- FUN_1000_b2df @0x1b2df  (01b2df_FUN_1000_b2df.lift.txt; evidence_id (assembly): ev_be9303ee30ce4fc51e5c215441431e32d6a519c31d7f33d5241c7840212dd6c0)
    V_0ef4# = 100000.0#   '@1b2ec DS:263c
    V_0efc# = 100000.0#   '@1b2fd DS:263c
    IF NOT (V_0f18$ = "A") THEN GOTO L_1b55b   '@1b30e DS:16ae
    IF NOT (A_0fb8!(0, 0) = 0.0) THEN GOTO L_1b357   '@1b325 DS:1890
    GOTO L_1bcd6   '@1b34f
L_1b357:
    L_BP1e! = A_0fb8!(0, 0)   '@1b357
    FOR L_BP0e! = 1.0 TO L_BP1e!   '@1b377 DS:158a
    L_BP22! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 0)   '@1b37e
    L_BP26! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 1)   '@1b3a6
    L_BP2a! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 2)   '@1b3cf
    L_BP2e! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 3)   '@1b3f5
    GOSUB L_1bd63   '@1b41e
    L_BP32! = A_0fb8!(0, 0)   '@1b42b
    FOR L_BP12! = FX##(L_BP0e!) + 1.0 TO L_BP32!   '@1b44b DS:158a
    L_BP36! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 0)   '@1b456
    L_BP3a! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 1)   '@1b47e
    L_BP3e! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 2)   '@1b4a7
    L_BP42! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 3)   '@1b4cd
    GOSUB L_1bf3d   '@1b4f6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP12!   '@1b503 DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e!   '@1b52b DS:158a
    GOTO L_1bcd1   '@1b553
L_1b55b:
    L_BP46! = A_0fb8!(0, 0)   '@1b55b
    FOR L_BP0e! = 1.0 TO L_BP46!   '@1b57b DS:158a
    L_BP22! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 0)   '@1b582
    L_BP26! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 1)   '@1b5aa
    L_BP2a! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 2)   '@1b5d3
    L_BP2e! = A_0fb8!(RT_CINT%(FX##(L_BP0e!)), 3)   '@1b5f9
    GOSUB L_1bd63   '@1b622
    L_BP4a! = A_0fb8!(0, 0)   '@1b62f
    FOR L_BP12! = FX##(L_BP0e!) + 1.0 TO L_BP4a!   '@1b64f DS:158a
    L_BP36! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 0)   '@1b65a
    L_BP3a! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 1)   '@1b682
    L_BP3e! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 2)   '@1b6ab
    L_BP42! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 3)   '@1b6d1
    GOSUB L_1bf3d   '@1b6fa
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP12!   '@1b707 DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e!   '@1b72f DS:158a
    IF NOT (A_1042!(0, 0) = 0.0) THEN GOTO L_1b789   '@1b757 DS:1890
    GOTO L_1bcd6   '@1b781
L_1b789:
    L_BP4e! = A_1042!(0, 0)   '@1b789
    FOR L_BP0e! = 1.0 TO L_BP4e!   '@1b7a9 DS:158a
    L_BP22! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 0)   '@1b7b0
    L_BP26! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 1)   '@1b7d8
    L_BP2a! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 2)   '@1b801
    L_BP2e! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 3)   '@1b827
    GOSUB L_1bd63   '@1b850
    L_BP52! = A_1042!(0, 0)   '@1b85d
    FOR L_BP12! = FX##(L_BP0e!) + 1.0 TO L_BP52!   '@1b87d DS:158a
    L_BP36! = A_1042!(RT_CINT%(FX##(L_BP12!)), 0)   '@1b888
    L_BP3a! = A_1042!(RT_CINT%(FX##(L_BP12!)), 1)   '@1b8b0
    L_BP3e! = A_1042!(RT_CINT%(FX##(L_BP12!)), 2)   '@1b8d9
    L_BP42! = A_1042!(RT_CINT%(FX##(L_BP12!)), 3)   '@1b8ff
    GOSUB L_1bf3d   '@1b928
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP12!   '@1b935 DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e!   '@1b95d DS:158a
    L_BP56! = A_1042!(0, 0)   '@1b985
    FOR L_BP0e! = 1.0 TO L_BP56!   '@1b9a5 DS:158a
    L_BP22! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 0)   '@1b9ac
    L_BP26! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 1)   '@1b9d4
    L_BP2a! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 2)   '@1b9fd
    L_BP2e! = A_1042!(RT_CINT%(FX##(L_BP0e!)), 3)   '@1ba23
    GOSUB L_1bd63   '@1ba4c
    L_BP5a! = A_0fb8!(0, 0)   '@1ba59
    FOR L_BP12! = FX##(L_BP0e!) + 1.0 TO L_BP5a!   '@1ba79 DS:158a
    L_BP36! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 0)   '@1ba84
    L_BP3a! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 1)   '@1baac
    L_BP3e! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 2)   '@1bad5
    L_BP42! = A_0fb8!(RT_CINT%(FX##(L_BP12!)), 3)   '@1bafb
    GOSUB L_1bf3d   '@1bb24
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP12!   '@1bb31 DS:158a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e!   '@1bb59 DS:158a
    IF NOT (V_0f18$ = "P") THEN GOTO L_1bccc   '@1bb81 DS:1742
    IF NOT (A_1156!(0, 0) = 0.0) THEN GOTO L_1bbca   '@1bb98 DS:1890
    GOTO L_1bcd6   '@1bbc2
L_1bbca:
    L_BP5e! = A_1156!(0, 0)   '@1bbca
    FOR L_BP0e! = 1.0 TO L_BP5e!   '@1bbea DS:158a
    L_BP22! = A_1156!(RT_CINT%(FX##(L_BP0e!)), 0)   '@1bbf2
    L_BP26! = A_1156!(RT_CINT%(FX##(L_BP0e!)), 1)   '@1bc1a
    L_BP2a! = A_1156!(RT_CINT%(FX##(L_BP0e!)), 2)   '@1bc43
    L_BP2e! = A_1156!(RT_CINT%(FX##(L_BP0e!)), 3)   '@1bc69
    GOSUB L_1bd63   '@1bc92
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP0e!   '@1bc9f DS:158a
L_1bccc:
L_1bcd1:
L_1bcd6:
    IF NOT (V_0efc# <> 100000.0# AND V_0ef4# <> 100000.0#) THEN GOTO L_1bd56   '@1bcdb DS:263c
    SOUND 4000, 5.0   '@1bd19 DS:2634
    V_14c4! = V_0ef4#   '@1bd2f
    V_14c8! = V_0efc#   '@1bd40
L_1bd56:
    GOTO L_1c72d   '@1bd56
    ' ---- F_1bd5e @0x1bd5e  (01bd5e_F_1bd5e.lift.txt; evidence_id (assembly): ev_dc61b1c8b1ecd63d48624d837732f2743561f3f031f0804db128b5ca13269862)
L_1bd63:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01b2df_FUN_1000_b2df
    IF NOT (RT_POT##((FX##(V_14c4!) - L_BP22!), (2.0)) + RT_POT##((FX##(V_14c8!) - L_BP26!), (2.0)) < RT_POT##((FX##(V_14c4!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(V_14c8!) - V_0efc#), (2.0#))) THEN GOTO L_1be4b   '@1bd68 DS:1cc4,2644
    IF NOT (ABS(FX##(L_BP26!) - V_14c8!) > FX##(V_133a!) OR ABS(FX##(L_BP22!) - V_14c4!) > FX##(V_133a!)) THEN GOTO L_1be46   '@1bdd5
    V_0ef4# = L_BP22!   '@1be21
    V_0efc# = L_BP26!   '@1be31
L_1be46:
L_1be4b:
    IF NOT (RT_POT##((FX##(V_14c4!) - L_BP2a!), (2.0)) + RT_POT##((FX##(V_14c8!) - L_BP2e!), (2.0)) < RT_POT##((FX##(V_14c4!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(V_14c8!) - V_0efc#), (2.0#))) THEN GOTO L_1bf2e   '@1be4b DS:1cc4,2644
    IF NOT (ABS(FX##(L_BP2e!) - V_14c8!) > FX##(V_133a!) OR ABS(FX##(L_BP2a!) - V_14c4!) > FX##(V_133a!)) THEN GOTO L_1bf29   '@1beb8
    V_0ef4# = L_BP2a!   '@1bf04
    V_0efc# = L_BP2e!   '@1bf14
L_1bf29:
L_1bf2e:
    RETURN   '@1bf2e
L_1bf3d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01b2df_FUN_1000_b2df
    IF NOT (L_BP2a! < L_BP3e! AND (L_BP2a! < L_BP36! AND (L_BP22! < L_BP3e! AND L_BP22! < L_BP36!))) THEN GOTO L_1bfb8   '@1bf42
    RETURN   '@1bfae
L_1bfb8:
    IF NOT (L_BP3e! < L_BP2a! AND (L_BP3e! < L_BP22! AND (L_BP36! < L_BP2a! AND L_BP36! < L_BP22!))) THEN GOTO L_1c02e   '@1bfb8
    RETURN   '@1c024
L_1c02e:
    IF NOT (L_BP2e! < L_BP42! AND (L_BP2e! < L_BP3a! AND (L_BP26! < L_BP42! AND L_BP26! < L_BP3a!))) THEN GOTO L_1c0a4   '@1c02e
    RETURN   '@1c09a
L_1c0a4:
    IF NOT (L_BP42! < L_BP2e! AND (L_BP42! < L_BP26! AND (L_BP3a! < L_BP2e! AND L_BP3a! < L_BP26!))) THEN GOTO L_1c11a   '@1c0a4
    RETURN   '@1c110
L_1c11a:
    IF NOT (L_BP26! = L_BP3a! AND (L_BP3a! = L_BP42! AND L_BP26! = L_BP2e!)) THEN GOTO L_1c177   '@1c11a
    RETURN   '@1c16d
L_1c177:
    IF NOT (L_BP22! = L_BP36! AND (L_BP36! = L_BP3e! AND L_BP22! = L_BP2a!)) THEN GOTO L_1c1d4   '@1c177
    RETURN   '@1c1ca
L_1c1d4:
    IF NOT (L_BP26! <> L_BP2e! AND L_BP3a! <> L_BP42!) THEN GOTO L_1c25f   '@1c1d4
    IF NOT (ABS((FX##(L_BP3e!) - L_BP36!) / (FX##(L_BP42!) - L_BP3a!) - (FX##(L_BP2a!) - L_BP22!) / (FX##(L_BP2e!) - L_BP26!)) < FX##(V_133e!)) THEN GOTO L_1c25a   '@1c20e
    RETURN   '@1c250
L_1c25a:
L_1c25f:
    IF NOT (L_BP3a! = L_BP42! OR L_BP26! = L_BP2e!) THEN GOTO L_1c2d8   '@1c25f
    L_BP1a! = L_BP26!   '@1c299
    IF NOT (L_BP3a! = L_BP42!) THEN GOTO L_1c2d0   '@1c2a8
    L_BP1a! = L_BP3a!   '@1c2c1
L_1c2d0:
    GOTO L_1c35f   '@1c2d0
L_1c2d8:
    L_BP1a! = FX##(L_BP2a!) - L_BP3e! + ((FX##(L_BP3e!) - L_BP36!) / (FX##(L_BP42!) - L_BP3a!) * L_BP42! - (FX##(L_BP2a!) - L_BP22!) / (FX##(L_BP2e!) - L_BP26!) * L_BP2e!)   '@1c2d8
    L_BP1a! = L_BP1a! / ((FX##(L_BP3e!) - L_BP36!) / (FX##(L_BP42!) - L_BP3a!) - (FX##(L_BP2a!) - L_BP22!) / (FX##(L_BP2e!) - L_BP26!))   '@1c31f
L_1c35f:
    IF NOT (L_BP36! = L_BP3e! OR L_BP22! = L_BP2a!) THEN GOTO L_1c3d8   '@1c35f
    L_BP16! = L_BP22!   '@1c399
    IF NOT (L_BP36! = L_BP3e!) THEN GOTO L_1c3d0   '@1c3a8
    L_BP16! = L_BP36!   '@1c3c1
L_1c3d0:
    GOTO L_1c463   '@1c3d0
L_1c3d8:
    IF NOT (L_BP26! = L_BP2e!) THEN GOTO L_1c429   '@1c3d8
    L_BP16! = L_BP3e! - (FX##(L_BP42!) - L_BP1a!) * (FX##(L_BP3e!) - L_BP36!) / (FX##(L_BP42!) - L_BP3a!)   '@1c3f1
    GOTO L_1c45e   '@1c421
L_1c429:
    L_BP16! = L_BP2a! - (FX##(L_BP2e!) - L_BP1a!) * (FX##(L_BP2a!) - L_BP22!) / (FX##(L_BP2e!) - L_BP26!)   '@1c429
L_1c45e:
L_1c463:
    IF NOT (L_BP16! < L_BP3e! AND L_BP16! < L_BP36! OR L_BP16! < L_BP2a! AND L_BP16! < L_BP22!) THEN GOTO L_1c4d9   '@1c463
    RETURN   '@1c4cf
L_1c4d9:
    IF NOT (L_BP16! > L_BP3e! AND L_BP16! > L_BP36! OR L_BP16! > L_BP2a! AND L_BP16! > L_BP22!) THEN GOTO L_1c54f   '@1c4d9
    RETURN   '@1c545
L_1c54f:
    IF NOT (L_BP1a! < L_BP42! AND L_BP1a! < L_BP3a! OR L_BP1a! < L_BP2e! AND L_BP1a! < L_BP26!) THEN GOTO L_1c5c5   '@1c54f
    RETURN   '@1c5bb
L_1c5c5:
    IF NOT (L_BP1a! > L_BP42! AND L_BP1a! > L_BP3a! OR L_BP1a! > L_BP2e! AND L_BP1a! > L_BP26!) THEN GOTO L_1c63b   '@1c5c5
    RETURN   '@1c631
L_1c63b:
    IF NOT (RT_POT##((FX##(V_14c4!) - L_BP16!), (2.0)) + RT_POT##((FX##(V_14c8!) - L_BP1a!), (2.0)) < RT_POT##((FX##(V_14c4!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(V_14c8!) - V_0efc#), (2.0#))) THEN GOTO L_1c71e   '@1c63b DS:1cc4,2644
    IF NOT (ABS(FX##(L_BP1a!) - V_14c8!) > FX##(V_133a!) OR ABS(FX##(L_BP16!) - V_14c4!) > FX##(V_133a!)) THEN GOTO L_1c719   '@1c6a8
    V_0ef4# = L_BP16!   '@1c6f4
    V_0efc# = L_BP1a!   '@1c704
L_1c719:
L_1c71e:
    RETURN   '@1c71e
L_1c72d:   ' entrada vinda de 01b2df_FUN_1000_b2df
    ' END SUB   '@1c72d
END SUB

SUB S_20137   ' entrada de SUB/FUNCTION (B$ENRA, locais 598 bytes) (0x20137)
    DIM L_BP0e%
    DIM L_BP10%
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
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP56%
    DIM L_BP58%
    DIM L_BP5a%
    DIM L_BP5c%
    DIM L_BP5e%
    DIM L_BP62$
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e!
    DIM L_BP72!
    DIM L_BP76!
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP80%
    DIM L_BP84!
    DIM L_BP88!
    DIM L_BP8c!
    DIM L_BP90$
    DIM L_BP94$
    DIM L_BP98!
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa4$
    DIM L_BPa8$
    DIM L_BPaa%
    DIM L_BPae!
    DIM L_BPb2!
    DIM L_BPb6!
    DIM L_BPba!
    DIM L_BPbe$
    DIM L_BPc2$
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
    ' ---- FUN_2000_0137 @0x20137  (020137_FUN_2000_0137.lift.txt; evidence_id (assembly): ev_1a807ca0e4bbaafe75debd81e0e881241e83e31f9a6f412d0eef7b00370d580f)
    IF NOT (V_0e3e% = 0 OR V_0e3a% = 0) THEN GOTO L_2017f   '@20153
    GOTO L_28759   '@20177
L_2017f:
    IF NOT (V_0e3c% = 0) THEN GOTO L_2028d   '@2017f
    REDIM A_109e%(-32768 TO -32768, -32768 TO -32768)   '@2018e
    REDIM A_109e%(0 TO V_0e50%, 0 TO 50)   '@2019c
    REDIM A_10fa%(-32768 TO -32768, -32768 TO -32768)   '@201be
    REDIM A_10fa%(0 TO V_0e50%, 0 TO 50)   '@201cc
    REDIM A_10cc!(-32768 TO -32768, -32768 TO -32768)   '@201ee
    REDIM A_10cc!(0 TO V_0e50%, 0 TO 8)   '@201fc
    REDIM A_1070!(-32768 TO -32768, -32768 TO -32768)   '@2021e
    REDIM A_1070!(0 TO V_0e4a% * 2, 0 TO 1)   '@2022c
    V_0e40% = 0   '@20251
    V_120e% = 0   '@2025c
    V_126c% = 0   '@20267
    V_12f8% = 0   '@20272
    V_12fa% = 0   '@2027d
L_2028d:
    L_BP62$ = V_0dcc_placa$   '@2028d
    IF NOT (L_BP62$ = "HER") THEN GOTO L_20355   '@2029f DS:2650
    RT_SCREEN 3   '@202b6
    L_BP66! = 7.0   '@202cc DS:2658
    L_BP6a! = 7.0   '@202dc DS:2658
    L_BP6e! = 7.0   '@202ec DS:2658
    L_BP72! = 7.0   '@202fc DS:2658
    L_BP76! = 7.0   '@2030c DS:2658
    V_14be! = 0.0   '@2031c DS:265c
    L_BP7a! = 4.5   '@2032d DS:2660
    L_BP7e! = 4.0   '@2033d DS:2664
    GOTO L_204ee   '@2034d
L_20355:
    IF NOT (L_BP62$ <> "CGA") THEN GOTO L_20379   '@20355 DS:2668
    IF NOT (L_BP62$ = "MCG") THEN GOTO L_20415   '@20367 DS:2670
L_20379:
    RT_SCREEN 2   '@20379
    L_BP66! = 15.0   '@2038c DS:2678
    L_BP6a! = 15.0   '@2039c DS:2678
    L_BP6e! = 15.0   '@203ac DS:2678
    L_BP72! = 15.0   '@203bc DS:2678
    L_BP76! = 15.0   '@203cc DS:2678
    V_14be! = 0.0   '@203dc DS:265c
    L_BP7a! = 4.0   '@203ed DS:2664
    L_BP7e! = 4.0   '@203fd DS:2664
    GOTO L_204ee   '@2040d
L_20415:
    IF NOT (L_BP62$ <> "EGA") THEN GOTO L_20439   '@20415 DS:267c
    IF NOT (L_BP62$ = "VGA") THEN GOTO L_204ee   '@20427 DS:2684
L_20439:
    RT_SCREEN 9   '@20439
    COLOR , 1   '@2044f
    L_BP66! = 9.0   '@20465 DS:268c
    L_BP6a! = 14.0   '@20475 DS:2690
    L_BP6e! = 12.0   '@20485 DS:2694
    L_BP72! = 13.0   '@20495 DS:2698
    L_BP76! = 16.0   '@204a5 DS:269c
    V_14be! = 1.0   '@204b5 DS:26a0
    L_BP7a! = 4.0   '@204c6 DS:2664
    L_BP7e! = 4.0   '@204d6 DS:2664
    GOTO L_204ee   '@204e6
L_204ee:
    V_14e4! = A_0f8a!(1, 1)   '@204ee
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@2050f
    V_14e8! = A_0f8a!(1, 0)   '@2054c
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@2056f
    V_14cc! = V_14e4!   '@205a8
    V_14d0! = V_14e8!   '@205b9
    V_14c4! = V_14e4!   '@205ca
    V_14c8! = V_14e8!   '@205db
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@205ec DS:26a4
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@2060a DS:26a8
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_20666   '@20628 DS:26ac
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@20648 DS:26ac
    GOTO L_20681   '@2065e
L_20666:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@20666 DS:26ac
L_20681:
    RT_CLS -1   '@20681
    RT_WINDOW 1, (0), (0), (639), (199)   '@2068f DS:265c,265e,26b0,26b2,26b4,26b6 (B$WIND decodificado)
    V_14d4! = 45.0   '@206bd DS:26b8
    V_14d8! = 10.0   '@206ce DS:26bc
    GOSUB L_20775   '@206df
    GOSUB L_20c7f   '@206ec
    GOSUB L_20e02   '@206f9
    LOCATE 25, 1   '@20706
    PRINT " Aguarde ...";   '@20721 DS:26c0
    GOSUB L_20f86   '@2072f
    IF NOT (V_1528$ = "") THEN GOTO L_20768   '@2073c DS:26d0
    RT_SCREEN 0   '@20753
L_20768:
    GOTO L_28759   '@20768
    ' ---- F_20770 @0x20770  (020770_F_20770.lift.txt; evidence_id (assembly): ev_591b73e61b8c9836bf8ce0ee45184b5789c8527b1ebcfb99ebb9504084124667)
L_20775:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020137_FUN_2000_0137
    V_0f18$ = ""   '@2077a DS:26d0
    V_0f1c$ = ""   '@2078c DS:26d0
    L_BP80% = (V_0dcc_placa$ = "EGA")   '@2079e DS:267c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP80%) <> 0) THEN GOTO L_207ee   '@207c3 DS:2684
    COLOR 10   '@207d8
L_207ee:
    L_BP84! = A_0f8a!(0, 0)   '@207ee
    FOR V_0f14! = 1.0 TO L_BP84!   '@2080f DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_20beb   '@20816
    L_BP88! = 2.0   '@20888 DS:26d4
    L_BP8c! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@2089a DS:26d8
    L_BP90$ = LTRIM$(STR$(V_0f14!))   '@208d5
    L_BP94$ = "CGA"   '@208f3 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP88!, L_BP8c!, L_BP90$, L_BP94$)   '@20901
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2091a libera strings locais (L_BP90)
    ' @20924 libera strings locais (L_BP94)
    L_BP98! = A_0f8a!(0, 1)   '@2092e
    FOR V_0f04! = 1.0 TO L_BP98!   '@20952 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_20ba8   '@2095a
    IF NOT (V_0f18$ = "") THEN GOTO L_20b13   '@209ce DS:26d0
    L_BP9c! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@209e5 DS:26dc
    L_BPa0! = 165.0   '@20a25 DS:26e0
    L_BPa4$ = CHR$(RT_CINT%(FX##(V_0f04!) + 26& * ((RT_CLNG&(FX##(V_0f04!)) \ 26&) * (V_0f04! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f04!) - 1.0) \ 26&), ("'"))   '@20a31 DS:26e4,26e8,26f0,26f4
    L_BPa8$ = "CGA"   '@20ac6 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP9c!, L_BPa0!, L_BPa4$, L_BPa8$)   '@20ad4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @20aed libera strings locais (L_BPa4)
    ' @20af7 libera strings locais (L_BPa8)
    V_0f1c$ = "*"   '@20b01 DS:26fa
L_20b13:
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@20b13 DS:26e0
L_20ba8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@20ba8 DS:26a0
    V_0f18$ = V_0f1c$   '@20bd4
L_20beb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@20beb DS:26a0
    L_BPaa% = (V_0dcc_placa$ = "EGA")   '@20c17 DS:267c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPaa%) <> 0) THEN GOTO L_20c70   '@20c3d DS:2684
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@20c53
L_20c70:
    RETURN   '@20c70
L_20c7f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020137_FUN_2000_0137
    L_BPae! = A_0fb8!(0, 0)   '@20c84
    FOR V_0f10! = 1.0 TO L_BPae!   '@20ca5 DS:26a0
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@20cac DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(L_BP6a!)), 17476   '@20d32 DS:26e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@20dc7 DS:26a0
    RETURN   '@20df3
L_20e02:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020137_FUN_2000_0137
    L_BPb2! = A_1042!(0, 0)   '@20e07
    FOR V_0f10! = 1.0 TO L_BPb2!   '@20e28 DS:26a0
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@20e30 DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP76!)), 0   '@20eb6 DS:26e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@20f4b DS:26a0
    RETURN   '@20f77
L_20f86:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020137_FUN_2000_0137
    IF NOT (V_0e3c% = 0) THEN GOTO L_21067   '@20f8b
    LOCATE 25, 1   '@20f9a
    PRINT "  Interseccoes...";   '@20fb5 DS:2700
    GOSUB L_212a0   '@20fc3
    LOCATE 25, 1   '@20fd0
    PRINT "  Contornos de Laje...";   '@20feb DS:2716
    GOSUB L_2274f   '@20ff9
    LOCATE 25, 1   '@21006
    PRINT "  Ordenacao... "; RT_TAB$(30); ""; "";   '@21021 DS:26d0,2730
    GOSUB L_24550   '@2104a
    V_0e3c% = 1   '@21057
L_21067:
    L_BP0e% = 1   '@21067
    L_BP10% = 0   '@21071
L_21080:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_210bd   '@21080 DS:26d4
    L_BP10% = L_BP10% + 1   '@210ad
    GOTO L_21204   '@210b5
L_210bd:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@210bd
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@210e0
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0e54_nivellaje!))))   '@21103
    L_BPb6! = V_14d4! - FX##(LEN(V_0f1c$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@21141
    L_BPba! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@21180 DS:2744
    L_BPbe$ = "~" + V_0f1c$   '@211ac DS:274c
    L_BPc2$ = "CGA"   '@211c4 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BPb6!, L_BPba!, L_BPbe$, L_BPc2$)   '@211d2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @211eb libera strings locais (L_BPbe)
    ' @211f5 libera strings locais (L_BPc2)
L_21204:
    L_BP0e% = L_BP0e% + 1   '@21204
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_21080   '@2120c
    IF NOT (V_1528$ = "S") THEN GOTO L_21284   '@2122c DS:2752
    RT_VIEWPRINT 23, 25   '@21243
    RT_CLS 2   '@21255
    RT_VIEWPRINT 1, 25   '@21263
    RETURN   '@21275
L_21284:
    GOSUB L_25e37   '@21284
    RETURN   '@21291
L_212a0:   ' sub-rotina (alvo de GOSUB)
    A_1070!(0, 0) = 0.0   '@212a5 DS:265c
    L_BP5a% = 0   '@212c5
L_212d4:
    IF NOT (L_BP5a% = 2 OR L_BP5a% = 0) THEN GOTO L_21323   '@212d9
    L_BPc6! = A_1042!(0, 0)   '@212fb
    GOTO L_21343   '@2131b
L_21323:
    L_BPc6! = A_0fb8!(0, 0)   '@21323
L_21343:
    L_BPca! = L_BPc6!   '@21343
    FOR V_0f0c! = 1.0 TO L_BPca!   '@21355 DS:26a0
    IF NOT (L_BP5a% = 2 OR L_BP5a% = 0) THEN GOTO L_2142c   '@2135c
    L_BP18! = A_1042!(RT_CINT%(FX##(V_0f0c!)), 0)   '@2137e
    L_BP20! = A_1042!(RT_CINT%(FX##(V_0f0c!)), 1)   '@213a7
    L_BPce! = A_1042!(RT_CINT%(FX##(V_0f0c!)), 2)   '@213d1
    L_BPd2! = A_1042!(RT_CINT%(FX##(V_0f0c!)), 3)   '@213f9
    GOTO L_214d7   '@21424
L_2142c:
    L_BP18! = A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 0)   '@2142c
    L_BP20! = A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 1)   '@21455
    L_BPce! = A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 2)   '@2147f
    L_BPd2! = A_0fb8!(RT_CINT%(FX##(V_0f0c!)), 3)   '@214a7
L_214d7:
    IF NOT (L_BP5a% = 0) THEN GOTO L_21636   '@214d7
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@214e5 DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = L_BP18!   '@21519
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = L_BP20!   '@21551
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@2158a DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = L_BPce!   '@215be
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = L_BPd2!   '@215f7
L_21636:
    IF NOT (L_BP5a% = 1 OR L_BP5a% = 0) THEN GOTO L_21676   '@21636
    V_0f14! = FX##(V_0f0c!) + 1.0   '@21658 DS:26a0
    GOTO L_21687   '@2166e
L_21676:
    V_0f14! = 1.0   '@21676 DS:26a0
L_21687:
    IF NOT (L_BP5a% = 1 OR L_BP5a% = 0) THEN GOTO L_216c2   '@21687
    V_0ef0! = L_BPc6!   '@216a9
    GOTO L_216e2   '@216ba
L_216c2:
    V_0ef0! = A_0fb8!(0, 0)   '@216c2
L_216e2:
    L_BPd6! = V_0ef0!   '@216e2
    FOR V_0f04! = V_0f14! TO L_BPd6!   '@216f4 DS:26a0
    IF NOT (L_BP5a% = 0) THEN GOTO L_217b6   '@216fc
    L_BP2c! = A_1042!(RT_CINT%(FX##(V_0f04!)), 0)   '@2170a
    L_BP30! = A_1042!(RT_CINT%(FX##(V_0f04!)), 1)   '@21733
    L_BP34! = A_1042!(RT_CINT%(FX##(V_0f04!)), 2)   '@2175d
    L_BP38! = A_1042!(RT_CINT%(FX##(V_0f04!)), 3)   '@21784
    GOTO L_2185f   '@217ae
L_217b6:
    L_BP2c! = A_0fb8!(RT_CINT%(FX##(V_0f04!)), 0)   '@217b6
    L_BP30! = A_0fb8!(RT_CINT%(FX##(V_0f04!)), 1)   '@217df
    L_BP34! = A_0fb8!(RT_CINT%(FX##(V_0f04!)), 2)   '@21809
    L_BP38! = A_0fb8!(RT_CINT%(FX##(V_0f04!)), 3)   '@21830
L_2185f:
    CALL MIXT_082a_Maior(L_BP2c!, L_BP34!, L_BPda!)   '@2185f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP18!, L_BPce!, L_BPde!)   '@21876
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPda! < L_BPde!) THEN GOTO L_218a7   '@2188a
    GOTO L_220e9   '@2189f
L_218a7:
    CALL MIXT_0877_Menor(L_BP2c!, L_BP34!, L_BPe2!)   '@218a7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP18!, L_BPce!, L_BPe6!)   '@218be
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPe2! > L_BPe6!) THEN GOTO L_218ef   '@218d2
    GOTO L_220e9   '@218e7
L_218ef:
    CALL MIXT_082a_Maior(L_BP30!, L_BP38!, L_BPea!)   '@218ef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP20!, L_BPd2!, L_BPee!)   '@21906
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPea! < L_BPee!) THEN GOTO L_21937   '@2191a
    GOTO L_220e9   '@2192f
L_21937:
    CALL MIXT_0877_Menor(L_BP30!, L_BP38!, L_BPf2!)   '@21937
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP20!, L_BPd2!, L_BPf6!)   '@2194e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPf2! > L_BPf6!) THEN GOTO L_2197f   '@21962
    GOTO L_220e9   '@21977
L_2197f:
    IF NOT (L_BP18! = L_BPce! AND L_BP2c! = L_BP34!) THEN GOTO L_219c2   '@2197f
    GOTO L_220e9   '@219ba
L_219c2:
    IF NOT (L_BP20! = L_BPd2! AND L_BP30! = L_BP38!) THEN GOTO L_21a05   '@219c2
    GOTO L_220e9   '@219fd
L_21a05:
    IF NOT (L_BPce! <> L_BP18! AND L_BP34! <> L_BP2c!) THEN GOTO L_21a91   '@21a05
    IF NOT (ABS((FX##(L_BP38!) - L_BP30!) / (FX##(L_BP34!) - L_BP2c!) - (FX##(L_BPd2!) - L_BP20!) / (FX##(L_BPce!) - L_BP18!)) < FX##(V_133e!)) THEN GOTO L_21a8c   '@21a40
    GOTO L_220e9   '@21a84
L_21a8c:
L_21a91:
    IF NOT (L_BP20! = L_BPd2! OR L_BP30! = L_BP38!) THEN GOTO L_21b0e   '@21a91
    V_0efc# = L_BP30!   '@21acc
    IF NOT (L_BP20! = L_BPd2!) THEN GOTO L_21b06   '@21adc
    V_0efc# = L_BP20!   '@21af6
L_21b06:
    GOTO L_21b99   '@21b06
L_21b0e:
    V_0efc# = (FX##(L_BPce!) - L_BP18!) / (FX##(L_BPd2!) - L_BP20!) * L_BP20! - L_BP18! - (FX##(L_BP34!) - L_BP2c!) / (FX##(L_BP38!) - L_BP30!) * L_BP30! + L_BP2c!   '@21b0e
    V_0efc# = V_0efc# / ((FX##(L_BPce!) - L_BP18!) / (FX##(L_BPd2!) - L_BP20!) - (FX##(L_BP34!) - L_BP2c!) / (FX##(L_BP38!) - L_BP30!))   '@21b55
L_21b99:
    IF NOT (L_BP18! = L_BPce! OR L_BP2c! = L_BP34!) THEN GOTO L_21c16   '@21b99
    V_0ef4# = L_BP2c!   '@21bd4
    IF NOT (L_BP18! = L_BPce!) THEN GOTO L_21c0e   '@21be4
    V_0ef4# = L_BP18!   '@21bfe
L_21c0e:
    GOTO L_21cad   '@21c0e
L_21c16:
    IF NOT (L_BP30! = L_BP38!) THEN GOTO L_21c6e   '@21c16
    V_0ef4# = (FX##(L_BPce!) - L_BP18!) / (FX##(L_BPd2!) - L_BP20!) * (FX##(V_0efc#) - L_BP20!) + L_BP18!   '@21c2f
    GOTO L_21ca8   '@21c66
L_21c6e:
    V_0ef4# = (FX##(L_BP34!) - L_BP2c!) / (FX##(L_BP38!) - L_BP30!) * (FX##(V_0efc#) - L_BP30!) + L_BP2c!   '@21c6e
L_21ca8:
L_21cad:
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP2c!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(L_BP30!) - V_0efc#), (2.0#))) < FX##(V_133a!)) THEN GOTO L_21d18   '@21cad DS:2758
    V_0ef4# = L_BP2c!   '@21cf3
    V_0efc# = L_BP30!   '@21d03
L_21d18:
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP34!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(L_BP38!) - V_0efc#), (2.0#))) < FX##(V_133a!)) THEN GOTO L_21d83   '@21d18 DS:2758
    V_0ef4# = L_BP34!   '@21d5e
    V_0efc# = L_BP38!   '@21d6e
L_21d83:
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BP18!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(L_BP20!) - V_0efc#), (2.0#))) < FX##(V_133a!)) THEN GOTO L_21dee   '@21d83 DS:2758
    V_0ef4# = L_BP18!   '@21dc9
    V_0efc# = L_BP20!   '@21dd9
L_21dee:
    IF NOT (RT_SQR##(RT_POT##((FX##(L_BPce!) - V_0ef4#), (2.0#)) + RT_POT##((FX##(L_BPd2!) - V_0efc#), (2.0#))) < FX##(V_133a!)) THEN GOTO L_21e5d   '@21dee DS:2758
    V_0ef4# = L_BPce!   '@21e36
    V_0efc# = L_BPd2!   '@21e47
L_21e5d:
    CALL MIXT_0877_Menor(L_BP18!, L_BPce!, L_BPfa!)   '@21e5d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP2c!, L_BP34!, L_BPfe!)   '@21e75
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_133a!) + V_0ef4# < FX##(L_BPfe!) OR FX##(V_133a!) + V_0ef4# < FX##(L_BPfa!)) THEN GOTO L_21ed2   '@21e88
    GOTO L_220e9   '@21eca
L_21ed2:
    CALL MIXT_082a_Maior(L_BP18!, L_BPce!, L_BP102!)   '@21ed2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2c!, L_BP34!, L_BP106!)   '@21eea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_0ef4#) - V_133a! > FX##(L_BP106!) OR FX##(V_0ef4#) - V_133a! > FX##(L_BP102!)) THEN GOTO L_21f4d   '@21efd
    GOTO L_220e9   '@21f45
L_21f4d:
    CALL MIXT_0877_Menor(L_BP20!, L_BPd2!, L_BP10a!)   '@21f4d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP30!, L_BP38!, L_BP10e!)   '@21f65
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_133a!) + V_0efc# < FX##(L_BP10e!) OR FX##(V_133a!) + V_0efc# < FX##(L_BP10a!)) THEN GOTO L_21fc2   '@21f78
    GOTO L_220e9   '@21fba
L_21fc2:
    CALL MIXT_082a_Maior(L_BP20!, L_BPd2!, L_BP112!)   '@21fc2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP30!, L_BP38!, L_BP116!)   '@21fda
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_0efc#) - V_133a! > FX##(L_BP116!) OR FX##(V_0efc#) - V_133a! > FX##(L_BP112!)) THEN GOTO L_2203d   '@21fed
    GOTO L_220e9   '@22035
L_2203d:
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@2203d DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = V_0ef4#   '@22071
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = V_0efc#   '@220aa
L_220e9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@220ee DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2211a DS:26a0
    IF NOT (L_BP5a% = 0) THEN GOTO L_22166   '@22146
    L_BP5a% = 1   '@22154
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_212d4   '@2215e
L_22166:
    IF NOT (L_BP5a% = 1) THEN GOTO L_22186   '@22166
    L_BP5a% = 2   '@22174
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_212d4   '@2217e
L_22186:
    IF NOT (V_0e3e% = 1) THEN GOTO L_2244a   '@22186
    L_BP11a! = A_1156!(0, 0)   '@22195
    FOR V_0f10! = 1.0 TO L_BP11a!   '@221b6 DS:26a0
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@221be DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 0)   '@221f2
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = A_1156!(RT_CINT%(FX##(V_0f10!)), 1)   '@22244
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f10!)), 1) <> A_1156!(RT_CINT%(FX##(V_0f10!)), 3) OR A_1156!(RT_CINT%(FX##(V_0f10!)), 0) <> A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_22419   '@22298
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@2233c DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)   '@22370
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = A_1156!(RT_CINT%(FX##(V_0f10!)), 3)   '@223c0
L_22419:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@22419 DS:26a0
L_2244a:
    L_BP11e! = A_1070!(0, 0)   '@2244a
    FOR V_0f0c! = 1.0 TO L_BP11e!   '@2246b DS:26a0
    V_0ef0! = FX##(V_0f0c!) + 1.0   '@22472 DS:26a0
L_2248d:
    L_BP122! = A_1070!(0, 0)   '@22492
    FOR V_0f04! = V_0ef0! TO L_BP122!   '@224b3 DS:26a0
    IF NOT (ABS(FX##(A_1070!(RT_CINT%(FX##(V_0f0c!)), 1)) - A_1070!(RT_CINT%(FX##(V_0f04!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_1070!(RT_CINT%(FX##(V_0f0c!)), 0)) - A_1070!(RT_CINT%(FX##(V_0f04!)), 0)) < FX##(V_133a!)) THEN GOTO L_226b1   '@224ba
    L_BP126! = A_1070!(0, 0)   '@22570
    FOR V_0f14! = FX##(V_0f04!) + 1.0 TO L_BP126!   '@22591 DS:26a0
    A_1070!(RT_CINT%(FX##(V_0f14!) - 1.0), 0) = A_1070!(RT_CINT%(FX##(V_0f14!)), 0)   '@2259e DS:26f0
    A_1070!(RT_CINT%(FX##(V_0f14!) - 1.0), 1) = A_1070!(RT_CINT%(FX##(V_0f14!)), 1)   '@225e6 DS:26f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@22630 DS:26a0
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) - 1.0   '@2265c DS:26f0
    V_0f04! = -V_0f04!   '@22690
    GOTO L_226dd   '@226a4
L_226b1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@226b1 DS:26a0
L_226dd:
    IF NOT (V_0f04! < 0.0) THEN GOTO L_22714   '@226dd DS:265c
    V_0ef0! = ABS(FX##(V_0f04!))   '@226f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2248d   '@2270c
L_22714:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@22714 DS:26a0
    RETURN   '@22740
L_2274f:   ' sub-rotina (alvo de GOSUB)
    L_BP0e% = 1   '@22754
    L_BP12a! = A_1070!(0, 0)   '@2275e
    FOR V_0f0c! = 1.0 TO L_BP12a!   '@2277f DS:26a0
    L_BP5a% = 0   '@22786
L_22795:
    L_BP5c% = -1   '@2279a
    L_BP5e% = -1   '@227a4
    IF NOT (L_BP5a% = 0) THEN GOTO L_227e4   '@227ae
    L_BPc6! = A_1042!(0, 0)   '@227bc
    GOTO L_22804   '@227dc
L_227e4:
    L_BPc6! = A_0fb8!(0, 0)   '@227e4
L_22804:
    L_BP12e! = L_BPc6!   '@22804
    FOR V_0f10! = 1.0 TO L_BP12e!   '@22816 DS:26a0
    L_BP14! = A_1070!(RT_CINT%(FX##(V_0f0c!)), 0)   '@2281e
    L_BP1c! = A_1070!(RT_CINT%(FX##(V_0f0c!)), 1)   '@22847
    IF NOT (L_BP5a% = 0) THEN GOTO L_2292d   '@22871
    L_BP18! = A_1042!(RT_CINT%(FX##(V_0f10!)), 0)   '@2287f
    L_BP20! = A_1042!(RT_CINT%(FX##(V_0f10!)), 1)   '@228a8
    L_BPce! = A_1042!(RT_CINT%(FX##(V_0f10!)), 2)   '@228d2
    L_BPd2! = A_1042!(RT_CINT%(FX##(V_0f10!)), 3)   '@228fa
    GOTO L_229d8   '@22925
L_2292d:
    L_BP18! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)   '@2292d
    L_BP20! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)   '@22956
    L_BPce! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)   '@22980
    L_BPd2! = A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)   '@229a8
L_229d8:
    L_BP56% = 1   '@229d8
    CALL MIXT_082a_Maior(L_BP18!, L_BPce!, L_BP132!)   '@229e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP18!, L_BPce!, L_BP136!)   '@229fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP14!) + V_133a! < FX##(L_BP136!) OR FX##(L_BP14!) - V_133a! > FX##(L_BP132!)) THEN GOTO L_22a56   '@22a0e
    GOTO L_2401e   '@22a4e
L_22a56:
    CALL MIXT_082a_Maior(L_BP20!, L_BPd2!, L_BP13a!)   '@22a56
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP20!, L_BPd2!, L_BP13e!)   '@22a6e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP1c!) + V_133a! < FX##(L_BP13e!) OR FX##(L_BP1c!) - V_133a! > FX##(L_BP13a!)) THEN GOTO L_22aca   '@22a82
    GOTO L_2401e   '@22ac2
L_22aca:
    L_BP140% = (RT_SQR##(RT_POT##((FX##(L_BP14!) - L_BP18!), (2.0)) + RT_POT##((FX##(L_BP1c!) - L_BP20!), (2.0))) < FX##(V_133a!))   '@22aca DS:26d4
    IF NOT ((RT_SQR##(RT_POT##((FX##(L_BP14!) - L_BPce!), (2.0)) + RT_POT##((FX##(L_BP1c!) - L_BPd2!), (2.0))) < FX##(V_133a!) OR L_BP140%) <> 0) THEN GOTO L_22be0   '@22b28 DS:26d4
    L_BP56% = 2   '@22b60
    IF NOT (L_BP1c! = L_BP20! AND L_BP14! = L_BP18!) THEN GOTO L_22bdb   '@22b6a
    SWAP L_BP18!, L_BPce!   '@22baf (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 14 bytes)
    SWAP L_BP20!, L_BPd2!   '@22bc8 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 14 bytes)
L_22bdb:
L_22be0:
L_22be5:
    A_109e%(L_BP0e%, 0) = 1   '@22bea
    A_109e%(L_BP0e%, 1) = RT_CINT%(FX##(V_0f0c!))   '@22c06
    A_10fa%(L_BP0e%, 1) = L_BP5a%   '@22c2f
    L_BP10% = 1   '@22c4d
    IF NOT (L_BP18! <> L_BPce!) THEN GOTO L_22dc3   '@22c57
    IF NOT (L_BP14! = L_BP18!) THEN GOTO L_22c92   '@22c71
    GOTO L_2401e   '@22c8a
L_22c92:
    IF NOT (ABS((FX##(L_BPd2!) - L_BP20!) / (FX##(L_BPce!) - L_BP18!) - (FX##(L_BP1c!) - L_BP20!) / (FX##(L_BP14!) - L_BP18!)) > FX##(V_133e!)) THEN GOTO L_22cde   '@22c92
    GOTO L_2401e   '@22cd6
L_22cde:
    L_BP3c! = ATN((FX##(L_BP1c!) - L_BP20!) / (FX##(L_BP14!) - L_BP18!))   '@22cde
    IF NOT (L_BP3c! >= 0.0) THEN GOTO L_22d6b   '@22d03 DS:265c
    L_BP3c! = FX##(L_BP3c!) * 180.0 / V_0e68_pi#   '@22d1d DS:2760
    IF NOT (L_BP18! < L_BP14!) THEN GOTO L_22d63   '@22d36
    L_BP3c! = FX##(L_BP3c!) + 180.0   '@22d4f DS:2760
L_22d63:
    GOTO L_22dbb   '@22d63
L_22d6b:
    L_BP3c! = FX##(L_BP3c!) * 180.0 / V_0e68_pi# + 360.0#   '@22d6b DS:2760,2764
    IF NOT (L_BP18! < L_BP14!) THEN GOTO L_22db6   '@22d89
    L_BP3c! = FX##(L_BP3c!) - 180.0   '@22da2 DS:276c
L_22db6:
L_22dbb:
    GOTO L_22e01   '@22dbb
L_22dc3:
    L_BP3c! = 90.0   '@22dc3 DS:2770
    IF NOT (L_BP1c! > L_BP20!) THEN GOTO L_22dfc   '@22dd3
    L_BP3c! = 270.0   '@22dec DS:2774
L_22dfc:
L_22e01:
    L_BP4c! = V_0f10!   '@22e01
    L_BP48! = V_0f0c!   '@22e11
    L_BP24! = L_BP14!   '@22e21
    L_BP28! = L_BP1c!   '@22e30
    L_BP2c! = L_BP18!   '@22e3f
    L_BP30! = L_BP20!   '@22e4e
L_22e62:
    L_BP144! = -1.0   '@22e67 DS:26f0
    L_BP148! = A_1070!(0, 0)   '@22e78
    FOR V_0f14! = 1.0 TO L_BP148!   '@22e99 DS:26a0
    IF NOT (V_0f14! = L_BP48!) THEN GOTO L_22ec2   '@22ea0
    GOTO L_2331b   '@22eba
L_22ec2:
    CALL MIXT_082a_Maior(L_BP24!, L_BP2c!, L_BP14c!)   '@22ec2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP24!, L_BP2c!, L_BP150!)   '@22ed9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) + V_133a! < FX##(L_BP150!) OR FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - V_133a! > FX##(L_BP14c!)) THEN GOTO L_22f6a   '@22eec
    GOTO L_2331b   '@22f62
L_22f6a:
    CALL MIXT_082a_Maior(L_BP28!, L_BP30!, L_BP154!)   '@22f6a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP28!, L_BP30!, L_BP158!)   '@22f81
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) + V_133a! < FX##(L_BP158!) OR FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - V_133a! > FX##(L_BP154!)) THEN GOTO L_23014   '@22f94
    GOTO L_2331b   '@2300c
L_23014:
    IF NOT (L_BP24! <> L_BP2c! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = A_1070!(RT_CINT%(FX##(L_BP48!)), 0)) THEN GOTO L_23089   '@23014
    GOTO L_2331b   '@23081
L_23089:
    IF NOT (L_BP2c! <> L_BP24!) THEN GOTO L_23159   '@23089
    IF NOT (ABS((FX##(L_BP30!) - L_BP28!) / (FX##(L_BP2c!) - L_BP24!) - (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 1)) / (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 0))) > FX##(V_133e!)) THEN GOTO L_23154   '@230a2
    GOTO L_2331b   '@2314c
L_23154:
L_23159:
    IF NOT (L_BP144! = -1.0) THEN GOTO L_2322e   '@23159 DS:26f0
    L_BP44! = V_0f14!   '@23174
    L_BP144! = RT_SQR##(RT_POT##((FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 0)), (2.0)) + RT_POT##((FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 1)), (2.0)))   '@23184 DS:26d4
    GOTO L_23316   '@23226
L_2322e:
    V_0eec! = RT_SQR##(RT_POT##((FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 0)), (2.0)) + RT_POT##((FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - A_1070!(RT_CINT%(FX##(L_BP48!)), 1)), (2.0)))   '@2322e DS:26d4
    IF NOT (V_0eec! < L_BP144!) THEN GOTO L_23311   '@232d0
    L_BP44! = V_0f14!   '@232eb
    L_BP144! = V_0eec!   '@232fb
L_23311:
L_23316:
L_2331b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@23320 DS:26a0
    IF NOT (L_BP144! = -1.0) THEN GOTO L_2336f   '@2334c DS:26f0
    GOTO L_23fbd   '@23367
L_2336f:
    IF NOT (L_BP10% = 50 OR A_109e%(L_BP0e%, 1) > L_BP44!) THEN GOTO L_233bb   '@2336f
    GOTO L_23fbd   '@233b3
L_233bb:
    IF NOT (L_BP10% > 1) THEN GOTO L_23496   '@233bb
    L_BP15c! = L_BP10%   '@233c9
    FOR V_0f14! = 2.0 TO L_BP15c!   '@233de DS:26a0,26d4
    IF NOT (A_109e%(L_BP0e%, RT_CINT%(FX##(V_0f14!))) = L_BP44!) THEN GOTO L_23425   '@233e6
    GOTO L_2344e   '@2341d
L_23425:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@23425 DS:26a0
L_2344e:
    IF NOT (L_BP10% >= V_0f14!) THEN GOTO L_23474   '@2344e
    GOTO L_23fbd   '@2346c
L_23474:
    A_10fa%(L_BP0e%, L_BP10%) = L_BP5e%   '@23474
L_23496:
    L_BP10% = L_BP10% + 1   '@23496
    A_109e%(L_BP0e%, L_BP10%) = RT_CINT%(FX##(L_BP44!))   '@2349e
    A_109e%(L_BP0e%, 0) = A_109e%(L_BP0e%, 0) + 1   '@234c5
    IF NOT (A_109e%(L_BP0e%, 1) = A_109e%(L_BP0e%, L_BP10%)) THEN GOTO L_23543   '@234f5
    GOSUB L_240aa   '@23529
    GOTO L_23fbd   '@23536
L_23543:
    L_BP5c% = 0   '@23543
    L_BP54! = -1.0   '@2354d DS:26f0
L_23562:
    IF NOT (L_BP5c% = 0) THEN GOTO L_2359d   '@23567
    V_0f14! = A_1042!(0, 0)   '@23575
    GOTO L_235bd   '@23595
L_2359d:
    V_0f14! = A_0fb8!(0, 0)   '@2359d
L_235bd:
    L_BP160! = V_0f14!   '@235bd
    FOR V_0ef0! = 1.0 TO L_BP160!   '@235cf DS:26a0
    L_BP24! = A_1070!(RT_CINT%(FX##(L_BP44!)), 0)   '@235d6
    L_BP28! = A_1070!(RT_CINT%(FX##(L_BP44!)), 1)   '@235fe
    IF NOT (L_BP5c% = 0) THEN GOTO L_236e1   '@23627
    L_BP2c! = A_1042!(RT_CINT%(FX##(V_0ef0!)), 0)   '@23635
    L_BP30! = A_1042!(RT_CINT%(FX##(V_0ef0!)), 1)   '@2365e
    L_BP34! = A_1042!(RT_CINT%(FX##(V_0ef0!)), 2)   '@23688
    L_BP38! = A_1042!(RT_CINT%(FX##(V_0ef0!)), 3)   '@236af
    GOTO L_2378a   '@236d9
L_236e1:
    L_BP2c! = A_0fb8!(RT_CINT%(FX##(V_0ef0!)), 0)   '@236e1
    L_BP30! = A_0fb8!(RT_CINT%(FX##(V_0ef0!)), 1)   '@2370a
    L_BP34! = A_0fb8!(RT_CINT%(FX##(V_0ef0!)), 2)   '@23734
    L_BP38! = A_0fb8!(RT_CINT%(FX##(V_0ef0!)), 3)   '@2375b
L_2378a:
    L_BP58% = 1   '@2378a
    CALL MIXT_082a_Maior(L_BP2c!, L_BP34!, L_BP164!)   '@23794
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP2c!, L_BP34!, L_BP168!)   '@237ab
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP24!) + V_133a! < FX##(L_BP168!) OR FX##(L_BP24!) - V_133a! > FX##(L_BP164!)) THEN GOTO L_23806   '@237be
    GOTO L_23ed0   '@237fe
L_23806:
    CALL MIXT_082a_Maior(L_BP30!, L_BP38!, L_BP16c!)   '@23806
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP30!, L_BP38!, L_BP170!)   '@2381d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP28!) + V_133a! < FX##(L_BP170!) OR FX##(L_BP28!) - V_133a! > FX##(L_BP16c!)) THEN GOTO L_23878   '@23830
    GOTO L_23ed0   '@23870
L_23878:
    L_BP172% = (RT_SQR##(RT_POT##((FX##(L_BP24!) - L_BP2c!), (2.0)) + RT_POT##((FX##(L_BP28!) - L_BP30!), (2.0))) < FX##(V_133a!))   '@23878 DS:26d4
    IF NOT ((RT_SQR##(RT_POT##((FX##(L_BP24!) - L_BP34!), (2.0)) + RT_POT##((FX##(L_BP28!) - L_BP38!), (2.0))) < FX##(V_133a!) OR L_BP172%) <> 0) THEN GOTO L_23988   '@238d5 DS:26d4
    L_BP58% = 2   '@2390c
    IF NOT (L_BP28! = L_BP30! AND L_BP24! = L_BP2c!) THEN GOTO L_23983   '@23916
    SWAP L_BP2c!, L_BP34!   '@2395b (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP30!, L_BP38!   '@23972 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
L_23983:
L_23988:
L_2398d:
    IF NOT (L_BP24! <> L_BP2c!) THEN GOTO L_23ae4   '@23992
    IF NOT (ABS((FX##(L_BP38!) - L_BP30!) / (FX##(L_BP34!) - L_BP2c!) - (FX##(L_BP28!) - L_BP30!) / (FX##(L_BP24!) - L_BP2c!)) > FX##(V_133e!)) THEN GOTO L_239f5   '@239ab
    GOTO L_23ed0   '@239ed
L_239f5:
    L_BP176! = ATN((FX##(L_BP28!) - L_BP30!) / (FX##(L_BP24!) - L_BP2c!))   '@239f5
    IF NOT (L_BP176! >= 0.0) THEN GOTO L_23a88   '@23a1b DS:265c
    L_BP176! = FX##(L_BP176!) * 180.0 / V_0e68_pi#   '@23a36 DS:2760
    IF NOT (L_BP2c! < L_BP24!) THEN GOTO L_23a80   '@23a51
    L_BP176! = FX##(L_BP176!) + 180.0   '@23a6a DS:2760
L_23a80:
    GOTO L_23adc   '@23a80
L_23a88:
    L_BP176! = FX##(L_BP176!) * 180.0 / V_0e68_pi# + 360.0#   '@23a88 DS:2760,2764
    IF NOT (L_BP2c! < L_BP24!) THEN GOTO L_23ad7   '@23aa8
    L_BP176! = FX##(L_BP176!) - 180.0   '@23ac1 DS:276c
L_23ad7:
L_23adc:
    GOTO L_23b45   '@23adc
L_23ae4:
    IF NOT (L_BP2c! <> L_BP34!) THEN GOTO L_23b05   '@23ae4
    GOTO L_23ed0   '@23afd
L_23b05:
    L_BP176! = 90.0   '@23b05 DS:2770
    IF NOT (L_BP28! > L_BP30!) THEN GOTO L_23b40   '@23b16
    L_BP176! = 270.0   '@23b2f DS:2774
L_23b40:
L_23b45:
    V_0eec! = 180.0 - FX##(L_BP3c!) + L_BP176!   '@23b45 DS:2760
    IF NOT (FX##(L_BP3c!) + 180.0 < FX##(L_BP176!) AND (L_BP3c! < 180.0 AND L_BP3c! >= 90.0) OR FX##(L_BP3c!) + 180.0 < FX##(L_BP176!) AND (L_BP3c! < 90.0 AND L_BP3c! >= 0.0)) THEN GOTO L_23c2c   '@23b5f DS:265c,2760,2770
    V_0eec! = FX##(L_BP176!) - 180.0 - L_BP3c!   '@23c0d DS:276c
L_23c2c:
    IF NOT (FX##(L_BP3c!) - 180.0 > FX##(L_BP176!) AND (L_BP3c! <= 360.0 AND L_BP3c! > 270.0) OR FX##(L_BP3c!) - 180.0 > FX##(L_BP176!) AND (L_BP3c! <= 270.0 AND L_BP3c! > 180.0)) THEN GOTO L_23cf9   '@23c2c DS:2760,276c,2774,2778
    V_0eec! = FX##(L_BP176!) - L_BP3c! + 540.0   '@23cda DS:277c
L_23cf9:
    IF NOT (V_0eec! < 360.0 AND V_0eec! > 1.0) THEN GOTO L_23e78   '@23cf9 DS:26a0,2778
    IF NOT (L_BP54! = -1.0) THEN GOTO L_23dd4   '@23d37 DS:26f0
    L_BP50! = V_0ef0!   '@23d51
    L_BP54! = V_0eec!   '@23d61
    L_BP40! = L_BP176!   '@23d71
    L_BP5e% = L_BP5c%   '@23d81
    L_BP17a! = L_BP2c!   '@23d8c
    L_BP17e! = L_BP34!   '@23d9c
    L_BP182! = L_BP30!   '@23dac
    L_BP186! = L_BP38!   '@23dbc
    GOTO L_23e73   '@23dcc
L_23dd4:
    IF NOT (V_0eec! < L_BP54!) THEN GOTO L_23e6e   '@23dd4
    L_BP50! = V_0ef0!   '@23dee
    L_BP54! = V_0eec!   '@23dfe
    L_BP40! = L_BP176!   '@23e0e
    L_BP5e% = L_BP5c%   '@23e1e
    L_BP17a! = L_BP2c!   '@23e29
    L_BP17e! = L_BP34!   '@23e39
    L_BP182! = L_BP30!   '@23e49
    L_BP186! = L_BP38!   '@23e59
L_23e6e:
L_23e73:
L_23e78:
    IF NOT (L_BP58% = 1) THEN GOTO L_23ecb   '@23e78
    L_BP58% = 2   '@23e86
    SWAP L_BP2c!, L_BP34!   '@23e9b (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP30!, L_BP38!   '@23eb2 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2398d   '@23ebe
L_23ecb:
L_23ed0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@23ed5 DS:26a0
    IF NOT (L_BP5c% = 0) THEN GOTO L_23f21   '@23f01
    L_BP5c% = 1   '@23f0f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23562   '@23f19
L_23f21:
    IF NOT (L_BP54! = -1.0) THEN GOTO L_23f43   '@23f21 DS:26f0
    GOTO L_23fbd   '@23f3b
L_23f43:
    L_BP48! = L_BP44!   '@23f43
    L_BP3c! = L_BP40!   '@23f52
    L_BP4c! = L_BP50!   '@23f61
    L_BP2c! = L_BP17a!   '@23f70
    L_BP30! = L_BP182!   '@23f80
    L_BP34! = L_BP17e!   '@23f90
    L_BP38! = L_BP186!   '@23fa0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22e62   '@23fb0
L_23fbd:
    IF NOT (L_BP56% = 1) THEN GOTO L_24019   '@23fc2
    L_BP56% = 2   '@23fd0
    SWAP L_BP18!, L_BPce!   '@23fe5 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 14 bytes)
    SWAP L_BP20!, L_BPd2!   '@23ffe (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 14 bytes)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22be5   '@2400c
L_24019:
L_2401e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@24023 DS:26a0
    IF NOT (L_BP5a% = 0) THEN GOTO L_2406f   '@2404f
    L_BP5a% = 1   '@2405d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_22795   '@24067
L_2406f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2406f DS:26a0
    RETURN   '@2409b
L_240aa:   ' sub-rotina (alvo de GOSUB)
    L_BP18a! = 0.0   '@240af DS:265c
    L_BP18e! = A_109e%(L_BP0e%, 0) - 1   '@240c0
    FOR L_BP192! = 1.0 TO L_BP18e!   '@240e8 DS:26a0
    L_BP18a! = (FX##(A_1070!(A_109e%(L_BP0e%, RT_CINT%(FX##(L_BP192!))), 0)) + A_1070!(A_109e%(L_BP0e%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) * (FX##(A_1070!(A_109e%(L_BP0e%, RT_CINT%(FX##(L_BP192!))), 1)) - A_1070!(A_109e%(L_BP0e%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)) / 2.0 + L_BP18a!   '@240f0 DS:26a0,26d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP192!   '@241d5 DS:26a0
    IF NOT (L_BP18a! <= 0.0) THEN GOTO L_24226   '@24201 DS:265c
    RETURN   '@2421c
L_24226:
    IF NOT (L_BP0e% > 1) THEN GOTO L_244d4   '@24226
    L_BP196! = L_BP0e% - 1   '@24234
    FOR L_BP19a! = 1.0 TO L_BP196!   '@2424a DS:26a0
    IF NOT (A_109e%(L_BP0e%, 0) = A_109e%(RT_CINT%(FX##(L_BP19a!)), 0)) THEN GOTO L_24414   '@24252
    L_BP19e! = A_109e%(RT_CINT%(FX##(L_BP19a!)), 0)   '@24290
    FOR V_0f04! = 1.0 TO L_BP19e!   '@242bf DS:26a0
    L_BP1a2! = A_109e%(L_BP0e%, 0)   '@242c6
    FOR L_BP192! = 1.0 TO L_BP1a2!   '@242ed DS:26a0
    IF NOT (A_109e%(RT_CINT%(FX##(L_BP19a!)), RT_CINT%(FX##(V_0f04!))) = A_109e%(L_BP0e%, RT_CINT%(FX##(L_BP192!)))) THEN GOTO L_2434a   '@242f4
    GOTO L_24373   '@24342
L_2434a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP192!   '@2434a DS:26a0
L_24373:
    IF NOT (A_109e%(L_BP0e%, 0) < L_BP192!) THEN GOTO L_243ab   '@24373
    GOTO L_243d7   '@243a3
L_243ab:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@243ab DS:26a0
L_243d7:
    IF NOT (A_109e%(L_BP0e%, 0) >= L_BP192!) THEN GOTO L_2440f   '@243d7
    GOTO L_24440   '@24407
L_2440f:
L_24414:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP19a!   '@24414 DS:26a0
L_24440:
    IF NOT (L_BP0e% - 1 < L_BP19a!) THEN GOTO L_244cc   '@24440
    A_109e%(0, 0) = L_BP0e%   '@2445f
    V_0e52% = L_BP0e%   '@2447a
    LOCATE 25, 25   '@24485
    PRINT USING "####"; RT_PU#(V_0e52%, "####", 1);   '@244a3 DS:2780
    L_BP0e% = L_BP0e% + 1   '@244bf
L_244cc:
    GOTO L_24541   '@244cc
L_244d4:
    A_109e%(0, 0) = L_BP0e%   '@244d4
    V_0e52% = L_BP0e%   '@244ef
    LOCATE 25, 25   '@244fa
    PRINT USING "####"; RT_PU#(V_0e52%, "####", 1);   '@24518 DS:2780
    L_BP0e% = L_BP0e% + 1   '@24534
L_24541:
    RETURN   '@24541
L_24550:   ' sub-rotina (alvo de GOSUB)
    L_BP0e% = 1   '@24555
L_24564:
    V_0ef4# = -1.0#   '@24564 DS:2788
    V_0efc# = -1.0#   '@24575 DS:2788
    L_BP10% = 0   '@24586
    L_BP1a6! = A_109e%(0, 0)   '@24590
    FOR V_0f14! = 1.0 TO L_BP1a6!   '@245b5 DS:26a0
    V_0ef0! = 1.0   '@245bc DS:26a0
L_245d2:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0) = V_0f14!) THEN GOTO L_2460e   '@245d2
    GOTO L_24a85   '@24606
L_2460e:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@2460e DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF A_109e%(0, 0) >= V_0ef0! THEN GOTO L_245d2   '@24624
    L_BP14! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), 1), 0)   '@2464f
    L_BP1c! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), 1), 1)   '@2468b
    L_BP1aa! = A_109e%(RT_CINT%(FX##(V_0f14!)), 0) - 1   '@246c8
    FOR L_BP192! = 2.0 TO L_BP1aa!   '@246f8 DS:26a0,26d4
    IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 1) >= L_BP1c!) THEN GOTO L_2490e   '@24700
    IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 1) = L_BP1c!) THEN GOTO L_2487d   '@2474e
    IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 0) < L_BP14!) THEN GOTO L_24875   '@2479c
    L_BP14! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 0)   '@247e9
    L_BP1c! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 1)   '@2482c
L_24875:
    GOTO L_24909   '@24875
L_2487d:
    L_BP14! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 0)   '@2487d
    L_BP1c! = A_1070!(A_109e%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP192!))), 1)   '@248c0
L_24909:
L_2490e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP192!   '@2490e DS:26a0
    IF NOT (V_0efc# = -1.0# AND V_0ef4# = -1.0#) THEN GOTO L_249b2   '@2493a DS:2788
    L_BP10% = RT_CINT%(FX##(V_0f14!))   '@24978
    V_0ef4# = L_BP14!   '@2498a
    V_0efc# = L_BP1c!   '@2499a
    GOTO L_24a80   '@249aa
L_249b2:
    IF NOT (FX##(L_BP1c!) >= FX##(V_0efc#)) THEN GOTO L_24a7b   '@249b2
    IF NOT (FX##(L_BP1c!) = FX##(V_0efc#)) THEN GOTO L_24a3f   '@249cc
    IF NOT (FX##(L_BP14!) < FX##(V_0ef4#)) THEN GOTO L_24a37   '@249e6
    L_BP10% = RT_CINT%(FX##(V_0f14!))   '@24a00
    V_0ef4# = L_BP14!   '@24a12
    V_0efc# = L_BP1c!   '@24a22
L_24a37:
    GOTO L_24a76   '@24a37
L_24a3f:
    L_BP10% = RT_CINT%(FX##(V_0f14!))   '@24a3f
    V_0ef4# = L_BP14!   '@24a51
    V_0efc# = L_BP1c!   '@24a61
L_24a76:
L_24a7b:
L_24a80:
L_24a85:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@24a8a DS:26a0
    L_BP18a! = 0.0   '@24ab6 DS:265c
    L_BP1ae! = 0.0   '@24ac7 DS:265c
    L_BP1b2! = 0.0   '@24ad8 DS:265c
    L_BP1b6! = A_1070!(A_109e%(L_BP10%, 1), 1)   '@24ae9
    L_BP1ba! = A_1070!(A_109e%(L_BP10%, 1), 1)   '@24b1f
    L_BP192! = 1.0   '@24b55 DS:26a0
L_24b6c:
    L_BP18a! = (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)) + A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) * (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) - A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)) / 2.0 + L_BP18a!   '@24b6c DS:26a0,26d4
    L_BP1ae! = (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)) + A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) * (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)) * A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) - FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) * A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) / 6.0 + L_BP1ae!   '@24c51 DS:26a0,2790
    L_BP1b2! = (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) + A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)) * (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)) * A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) - FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) * A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) / 6.0 + L_BP1b2!   '@24d9e DS:26a0,2790
    L_BP1be! = A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)   '@24eed DS:26a0
    CALL MIXT_0877_Menor(L_BP1b6!, L_BP1be!, L_BP1c2!)   '@24f2f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) = L_BP1be!   '@24f44 DS:26a0
    L_BP1b6! = L_BP1c2!   '@24f81
    L_BP1c6! = A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)   '@24f8c DS:26a0
    CALL MIXT_082a_Maior(L_BP1ba!, L_BP1c6!, L_BP1ca!)   '@24fce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) = L_BP1c6!   '@24fe3 DS:26a0
    L_BP1ba! = L_BP1ca!   '@25020
    L_BP192! = FX##(L_BP192!) + 1.0   '@2502b DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(L_BP10%, 0) - 1 < L_BP192!) THEN GOTO L_24b6c   '@25041
    L_BP1ae! = ABS(FX##(L_BP1ae!) / L_BP18a!) - V_133a!   '@25072
    L_BP1b2! = ABS(FX##(L_BP1b2!) / L_BP18a!) - V_133a!   '@25090
    V_0ef0! = 0.0   '@250ae DS:265c
    L_BP1c! = 0.0   '@250bf DS:265c
L_250d4:
    V_0f14! = 0.0   '@250d9 DS:265c
    L_BP192! = 1.0   '@250ea DS:26a0
L_25100:
    IF NOT (A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0) > L_BP1ae! AND A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0) > L_BP1ae!) THEN GOTO L_251a3   '@25100 DS:26a0
    GOTO L_255e4   '@2519b
L_251a3:
    IF NOT (A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) > L_BP1b2! AND A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1) > L_BP1b2!) THEN GOTO L_25248   '@251a3 DS:26a0
    GOTO L_255e4   '@25240
L_25248:
    IF NOT (A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1) < L_BP1b2! AND A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1) < L_BP1b2!) THEN GOTO L_252ed   '@25248 DS:26a0
    GOTO L_255e4   '@252e5
L_252ed:
    IF NOT (A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0) < L_BP1ae! AND A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0) < L_BP1ae!) THEN GOTO L_253ab   '@252ed DS:26a0
    V_0f14! = FX##(V_0f14!) + 1.0   '@25388 DS:26a0
    GOTO L_255e4   '@2539e
L_253ab:
    IF NOT (A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0) = A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) THEN GOTO L_25465   '@253ab DS:26a0
    V_0f04! = A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)   '@25421
    GOTO L_255ae   '@2545d
L_25465:
    V_0f04! = (FX##(L_BP1b2!) - A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) * (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 0)) - A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)) / (FX##(A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!) + 1.0)), 1)) - A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 1)) + A_1070!(A_109e%(L_BP10%, RT_CINT%(FX##(L_BP192!))), 0)   '@25465 DS:26a0
L_255ae:
    IF NOT (V_0f04! < L_BP1ae!) THEN GOTO L_255df   '@255ae
    V_0f14! = FX##(V_0f14!) + 1.0   '@255c9 DS:26a0
L_255df:
L_255e4:
    L_BP192! = FX##(L_BP192!) + 1.0   '@255e9 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(L_BP10%, 0) - 1 < L_BP192!) THEN GOTO L_25100   '@255ff
    IF NOT (V_0ef0! = 0.0 AND FX##(V_0f14!) / 2.0 <> RT_CLNG&(FX##(V_0f14!)) \ 2&) THEN GOTO L_25692   '@25630 DS:265c,26d4
    GOTO L_25842   '@2568a
L_25692:
    IF NOT (V_0ef0! = 0.0) THEN GOTO L_256e1   '@25692 DS:265c
    L_BP1b2! = L_BP1ba! - 0.300000011920928955078125##   '@256ad DS:2794
    V_0ef0! = 1.0   '@256c3 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_250d4   '@256d4
L_256e1:
    IF NOT (V_0ef0! = 1.0 AND FX##(V_0f14!) / 2.0 = RT_CLNG&(FX##(V_0f14!)) \ 2&) THEN GOTO L_2575e   '@256e1 DS:26a0,26d4
    L_BP1b2! = L_BP1b2! - 0.300000011920928955078125##   '@2573b DS:2794
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_250d4   '@25751
L_2575e:
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_257a0   '@2575e DS:26a0
    L_BP1ba! = L_BP1b2!   '@25779
    V_0ef0! = 2.0   '@2578a DS:26d4
L_257a0:
    IF NOT (V_0ef0! = 2.0 AND FX##(V_0f14!) / 2.0 <> RT_CLNG&(FX##(V_0f14!)) \ 2&) THEN GOTO L_2581d   '@257a0 DS:26d4
    L_BP1b2! = L_BP1b2! - 0.300000011920928955078125##   '@257fa DS:2794
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_250d4   '@25810
L_2581d:
    L_BP1b2! = (L_BP1b2! + 0.100000001490116119384765625## + L_BP1ba!) / 2.0   '@2581d DS:26d4,2798
L_25842:
    A_10cc!(L_BP0e%, 0) = L_BP10%   '@25847
    A_10cc!(L_BP0e%, 2) = L_BP18a!   '@2586c
    A_10cc!(L_BP0e%, 6) = L_BP1ae!   '@2588c
    A_10cc!(L_BP0e%, 7) = L_BP1b2!   '@258af
    L_BP0e% = L_BP0e% + 1   '@258d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_24564   '@258da
    IF NOT (V_0e3e% = 1) THEN GOTO L_25e28   '@258fa
    L_BP1ce! = A_1156!(0, 0)   '@25909
    FOR V_0f14! = 1.0 TO L_BP1ce!   '@2592a DS:26a0
    L_BP1d2! = A_1070!(0, 0)   '@25932
    FOR V_0f0c! = 1.0 TO L_BP1d2!   '@25953 DS:26a0
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f0c!)), 1) = A_1156!(RT_CINT%(FX##(V_0f14!)), 1) AND A_1070!(RT_CINT%(FX##(V_0f0c!)), 0) = A_1156!(RT_CINT%(FX##(V_0f14!)), 0)) THEN GOTO L_25a08   '@2595a
    GOTO L_25a34   '@25a00
L_25a08:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@25a08 DS:26a0
L_25a34:
    IF NOT (FX##(A_1070!(0, 0)) + 1.0 = FX##(V_0f0c!)) THEN GOTO L_25b42   '@25a34 DS:26a0
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@25a63 DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = A_1156!(RT_CINT%(FX##(V_0f14!)), 0)   '@25a97
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = A_1156!(RT_CINT%(FX##(V_0f14!)), 1)   '@25ae9
L_25b42:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f14!)), 1) <> A_1156!(RT_CINT%(FX##(V_0f14!)), 3) OR A_1156!(RT_CINT%(FX##(V_0f14!)), 0) <> A_1156!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_25df7   '@25b42
    L_BP1d6! = A_1070!(0, 0)   '@25be6
    FOR V_0f0c! = 1.0 TO L_BP1d6!   '@25c07 DS:26a0
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f0c!)), 1) = A_1156!(RT_CINT%(FX##(V_0f14!)), 3) AND A_1070!(RT_CINT%(FX##(V_0f0c!)), 0) = A_1156!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_25cba   '@25c0e
    GOTO L_25ce6   '@25cb2
L_25cba:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@25cba DS:26a0
L_25ce6:
    IF NOT (FX##(A_1070!(0, 0)) + 1.0 = FX##(V_0f0c!)) THEN GOTO L_25df2   '@25ce6 DS:26a0
    A_1070!(0, 0) = FX##(A_1070!(0, 0)) + 1.0   '@25d15 DS:26a0
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 0) = A_1156!(RT_CINT%(FX##(V_0f14!)), 2)   '@25d49
    A_1070!(RT_CINT%(FX##(A_1070!(0, 0))), 1) = A_1156!(RT_CINT%(FX##(V_0f14!)), 3)   '@25d99
L_25df2:
L_25df7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@25df7 DS:26a0
L_25e28:
    RETURN   '@25e28
L_25e37:   ' sub-rotina (alvo de GOSUB)
    RT_VIEWPRINT 22, 25   '@25e3c
    RT_CLS 2   '@25e4e
    RT_VIEWPRINT 1, 25   '@25e5c
    LOCATE 22, 1   '@25e6e
    PRINT RT_STRINGC$((24), (95)); "  C A R G A S   D E   L A J E  "; RT_STRINGC$((25), (95))   '@25e89 DS:279c
L_25ec2:
    RT_VIEWPRINT 23, 25   '@25ec7
    RT_CLS 2   '@25ed9
    RT_VIEWPRINT 1, 25   '@25ee7
    LOCATE 24, 1   '@25ef9
    PRINT "  <N>ivel   <B>uracos   <T>ipo   <C>argas nas lajes   <A>linhamento   <F>im"   '@25f14 DS:27c0
L_25f27:
    CALL MIXT_07f1_LimpaTeclado   '@25f2c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@25f36
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1da$ = V_0f18$   '@25f52
    IF NOT (L_BP1da$ <> "C") THEN GOTO L_25f90   '@25f65 DS:2810
    IF NOT (L_BP1da$ = "c") THEN GOTO L_26a41   '@25f7d DS:2816
L_25f90:
L_25f95:
    RT_VIEWPRINT 23, 25   '@25f9a
    RT_CLS 2   '@25fac
    RT_VIEWPRINT 1, 25   '@25fba
    LOCATE 25, 1   '@25fcc
    PRINT " Acione  T <Enter>  para imposicao de cargas em Todas as Lajes";   '@25fe7 DS:281c
    LOCATE 23, 1   '@25ff5
    PRINT " Numero da Laje para alteracao das Cargas *RETORNO* ";   '@26010 DS:285e
    CALL MIXT_07f1_LimpaTeclado   '@2601e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@26028 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 25, 1   '@26042
    PRINT RT_TAB$(80); ""; "";   '@2605d DS:26d0
    IF NOT (UCASE$(V_0f18$) = "T") THEN GOTO L_264f8   '@2607d DS:2896
    LOCATE 24, 1   '@2609a
    PRINT " Carga permanente (" + V_0de0$ + "/" + V_0ddc$ + "2) *NAO* ";   '@260b5 DS:289c,28b4,28ba
    PRINT RT_TAB$(40); ""; " Peso proprio (" + V_0de0$ + "/" + V_0ddc$ + "2) *NAO* "   '@260eb DS:26d0,28b4,28ba,28c8
    LOCATE 25, 1   '@26133
    PRINT " (revestimento + enchimento)";   '@2614e DS:28dc
    LOCATE 24, LEN(V_0de0$ + V_0ddc$) + 30   '@2615c
    CALL MIXT_07f1_LimpaTeclado   '@2618d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@26197 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1dc% = (VAL(V_0f18$) > 0.0#)   '@261b1 DS:28fc
    IF NOT ((V_0f18$ = "0" OR L_BP1dc%) <> 0) THEN GOTO L_262c0   '@261e4 DS:2904
    L_BP1e0! = A_109e%(0, 0)   '@261fa
    FOR V_0ef0! = 1.0 TO L_BP1e0!   '@2621f DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_2628f   '@26226 DS:26d4
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4) = VAL(V_0f18$)   '@2625b
L_2628f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@2628f DS:26a0
L_262c0:
    LOCATE 24, LEN(V_0de0$ + V_0ddc$) + 65   '@262c0
    CALL MIXT_07f1_LimpaTeclado   '@262f1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@262fb DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1e2% = (VAL(V_0f18$) > 0.0#)   '@26315 DS:28fc
    IF NOT ((V_0f18$ = "0" OR L_BP1e2%) <> 0) THEN GOTO L_264eb   '@26348 DS:2904
    L_BP1e6! = A_109e%(0, 0)   '@2635e
    FOR V_0ef0! = 1.0 TO L_BP1e6!   '@26383 DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 1.0 AND A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_26432   '@2638a DS:26a0,26d4
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = VAL(V_0f18$)   '@263fe
L_26432:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0) THEN GOTO L_264ba   '@26432 DS:26a0
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4) = FX##(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4)) + VAL(V_0f18$)   '@26467
L_264ba:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@264ba DS:26a0
L_264eb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25f95   '@264eb
L_264f8:
    L_BP1e8% = (FX##(VAL(V_0f18$)) >= 1.0 + FX##(V_0e54_nivellaje!))   '@264f8 DS:26a0
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_0e52%) + V_0e54_nivellaje! AND L_BP1e8%) <> 0) THEN GOTO L_26a39   '@26539
    L_BP0e% = 0   '@2655b
    V_0ef0! = 0.0   '@26565 DS:265c
L_2657c:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@2657c DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_265cf   '@26592 DS:26d4
    L_BP0e% = L_BP0e% + 1   '@265c7
L_265cf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(L_BP0e%) + V_0e54_nivellaje! < FX##(VAL(V_0f18$)) THEN GOTO L_2657c   '@265cf
    V_0f18$ = " Carga permanente (" + V_0de0$ + "/" + V_0ddc$ + "2) *" + LTRIM$(STR$(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4))) + "*"   '@265f8 DS:26fa,289c,28b4,290a
    V_0f1c$ = " Peso proprio (" + V_0de0$ + "/" + V_0ddc$ + "2) *" + LTRIM$(STR$(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5))) + "*"   '@26670 DS:26fa,28b4,28c8,290a
    LOCATE 24, 1   '@266e8
    PRINT V_0f18$;   '@26703
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 1.0) THEN GOTO L_26766   '@26711 DS:26a0
    PRINT RT_TAB$(40); ""; V_0f1c$;   '@26746 DS:26d0
L_26766:
    LOCATE 25, 1   '@26766
    PRINT " (revestimento + enchimento";   '@26781 DS:2912
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0) THEN GOTO L_267da   '@2678f DS:26a0
    PRINT " + PESO)";   '@267c4 DS:2932
    GOTO L_267e8   '@267d2
L_267da:
    PRINT ")";   '@267da DS:293e
L_267e8:
    LOCATE 24, LEN(V_0de0$ + V_0ddc$ + STR$(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4))) + 26   '@267e8
    CALL MIXT_07f1_LimpaTeclado   '@26847
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@26851 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ea% = (VAL(V_0f18$) > 0.0#)   '@2686b DS:28fc
    IF NOT ((V_0f18$ = "0" OR L_BP1ea%) <> 0) THEN GOTO L_268ed   '@2689e DS:2904
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 4) = VAL(V_0f18$)   '@268b4
L_268ed:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 1.0) THEN GOTO L_26a2c   '@268ed DS:26a0
    LOCATE 24, LEN(V_0de0$ + V_0ddc$ + STR$(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5))) + 61   '@26922
    CALL MIXT_07f1_LimpaTeclado   '@26981
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@2698b DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ec% = (VAL(V_0f18$) > 0.0#)   '@269a5 DS:28fc
    IF NOT ((V_0f18$ = "0" OR L_BP1ec%) <> 0) THEN GOTO L_26a27   '@269d8 DS:2904
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = VAL(V_0f18$)   '@269ee
L_26a27:
L_26a2c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25f95   '@26a2c
L_26a39:
    GOTO L_2874c   '@26a39
L_26a41:
    IF NOT (L_BP1da$ <> "T") THEN GOTO L_26a67   '@26a41 DS:2896
    IF NOT (L_BP1da$ = "t") THEN GOTO L_27305   '@26a54 DS:2944
L_26a67:
L_26a6c:
    RT_VIEWPRINT 23, 25   '@26a71
    RT_CLS 2   '@26a83
    RT_VIEWPRINT 1, 25   '@26a91
    LOCATE 25, 1   '@26aa3
    PRINT " Acione  M <Enter>  para considerar todas as lajes Macicas";   '@26abe DS:294a
    LOCATE 23, 1   '@26acc
    PRINT " Numero da Laje para alteracao do Tipo *RETORNA* ";   '@26ae7 DS:2988
    CALL MIXT_07f1_LimpaTeclado   '@26af5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@26aff DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "M") THEN GOTO L_26c10   '@26b19 DS:29be
    L_BP0e% = 1   '@26b36
L_26b46:
    IF NOT (A_10cc!(L_BP0e%, 1) <> 2.0) THEN GOTO L_26beb   '@26b46 DS:26d4
    IF NOT (A_10cc!(L_BP0e%, 1) = 1.0) THEN GOTO L_26bc3   '@26b73 DS:26a0
    A_10cc!(L_BP0e%, 5) = 0.0   '@26ba0 DS:265c
L_26bc3:
    A_10cc!(L_BP0e%, 1) = 0.0   '@26bc3 DS:265c
L_26beb:
    L_BP0e% = L_BP0e% + 1   '@26beb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0e52% < L_BP0e%) THEN GOTO L_26b46   '@26bf3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26a6c   '@26c03
L_26c10:
    L_BP1ee% = (FX##(VAL(V_0f18$)) >= 1.0 + FX##(V_0e54_nivellaje!))   '@26c10 DS:26a0
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_0e52%) + V_0e54_nivellaje! AND L_BP1ee%) <> 0) THEN GOTO L_272fd   '@26c51
    L_BP0e% = 0   '@26c73
    V_0ef0! = 0.0   '@26c7d DS:265c
L_26c94:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@26c94 DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_26ce7   '@26caa DS:26d4
    L_BP0e% = L_BP0e% + 1   '@26cdf
L_26ce7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(L_BP0e%) + V_0e54_nivellaje! < FX##(VAL(V_0f18$)) THEN GOTO L_26c94   '@26ce7
L_26d15:
    LOCATE 25, 1   '@26d1a
    PRINT RT_TAB$(80); ""; "";   '@26d35 DS:26d0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0) THEN GOTO L_26d9c   '@26d55 DS:265c
    V_0f18$ = " Laje  <*M*>acica  <P>remoldada  <L>aje comum nao calculada "   '@26d8a DS:29c4
L_26d9c:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0) THEN GOTO L_26de3   '@26d9c DS:26a0
    V_0f18$ = " Laje  <M>acica  <*P*>remoldada  <L>aje comum nao calculada "   '@26dd1 DS:2a04
L_26de3:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 3.0) THEN GOTO L_26e2a   '@26de3 DS:2a44
    V_0f18$ = " Laje  <M>acica  <P>remoldada  <*L*>aje comum nao calculada "   '@26e18 DS:2a48
L_26e2a:
    LOCATE 24, 1   '@26e2a
    PRINT V_0f18$;   '@26e45
    CALL MIXT_07f1_LimpaTeclado   '@26e53
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@26e5d DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1f2$ = V_0f18$   '@26e77
    IF NOT (L_BP1f2$ <> "P") THEN GOTO L_26eb5   '@26e8a DS:2a88
    IF NOT (L_BP1f2$ = "p") THEN GOTO L_27179   '@26ea2 DS:2a8e
L_26eb5:
    L_BP1f6! = A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0))), 0) - 1   '@26eb5
    FOR L_BP1fa! = 1.0 TO L_BP1f6!   '@26efe DS:26a0
    IF NOT (A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0))), RT_CINT%(FX##(L_BP1fa!))) = 1) THEN GOTO L_26f59   '@26f06
    GOTO L_26f82   '@26f51
L_26f59:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1fa!   '@26f59 DS:26a0
L_26f82:
    IF NOT (A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 0))), 0) - 1 >= L_BP1fa!) THEN GOTO L_26feb   '@26f82
    BEEP   '@26fd4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26d15   '@26fde
L_26feb:
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0   '@26feb DS:26a0
    LOCATE 25, 1   '@27016
    PRINT " Inclinacao do fluxo das cargas na laje  (180 "; CHR$(27); CHR$(26); " a *0*) ";   '@27031 DS:2a94,2ac6
    CALL MIXT_07f1_LimpaTeclado   '@27066
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@27070 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_270ca   '@2708a
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = 0.0   '@2709f DS:265c
L_270ca:
    L_BP1fc% = (VAL(V_0f18$) > 0.0#)   '@270ca DS:28fc,2ad2
    L_BP1fe% = VAL(V_0f18$) < 180.0# AND L_BP1fc%   '@270fe
    IF NOT ((V_0f18$ = "0" OR L_BP1fe%) <> 0) THEN GOTO L_27171   '@27127 DS:2904
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = VAL(V_0f18$)   '@2713d
L_27171:
    GOTO L_272f0   '@27171
L_27179:
    IF NOT (L_BP1f2$ <> "M") THEN GOTO L_2719f   '@27179 DS:29be
    IF NOT (L_BP1f2$ = "m") THEN GOTO L_27232   '@2718c DS:2ada
L_2719f:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0) THEN GOTO L_271ff   '@2719f DS:26a0
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = 0.0   '@271d4 DS:265c
L_271ff:
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@271ff DS:265c
    GOTO L_272f0   '@2722a
L_27232:
    IF NOT (L_BP1f2$ <> "L") THEN GOTO L_27258   '@27232 DS:2ae0
    IF NOT (L_BP1f2$ = "l") THEN GOTO L_272eb   '@27245 DS:2ae6
L_27258:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 1.0) THEN GOTO L_272b8   '@27258 DS:26a0
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 5) = 0.0   '@2728d DS:265c
L_272b8:
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 3.0   '@272b8 DS:2a44
    GOTO L_272f0   '@272e3
L_272eb:
L_272f0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26a6c   '@272f0
L_272fd:
    GOTO L_2874c   '@272fd
L_27305:
    IF NOT (L_BP1da$ <> "A") THEN GOTO L_2732b   '@27305 DS:2aec
    IF NOT (L_BP1da$ = "a") THEN GOTO L_27891   '@27318 DS:2af2
L_2732b:
L_27330:
    RT_VIEWPRINT 23, 25   '@27335
    RT_CLS 2   '@27347
    RT_VIEWPRINT 1, 25   '@27355
    LOCATE 25, 1   '@27367
    PRINT " Acione  S <Enter>  Alinha pela face Superior ou  I <Enter>  pela face Inferior";   '@27382 DS:2af8
    LOCATE 23, 1   '@27390
    PRINT " Numero da Laje para alteracao do Alinhamento *RETORNA* ";   '@273ab DS:2b4c
    CALL MIXT_07f1_LimpaTeclado   '@273b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@273c3 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_2745f   '@273dd DS:2752
    L_BP0e% = 1   '@273fa
L_2740a:
    A_10cc!(L_BP0e%, 3) = 0.0   '@2740a DS:265c
    L_BP0e% = L_BP0e% + 1   '@2742d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF A_109e%(0, 0) >= L_BP0e% THEN GOTO L_2740a   '@27435
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_27330   '@27452
L_2745f:
    IF NOT (UCASE$(V_0f18$) = "I") THEN GOTO L_27618   '@2745f DS:2b88
    IF NOT (V_12fa% = 0) THEN GOTO L_274a2   '@2747c
    BEEP   '@2748b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_27330   '@27495
L_274a2:
    L_BP202! = 0.0   '@274a2 DS:265c
    L_BP0e% = 1   '@274b3
L_274c2:
    IF NOT (A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_27544   '@274c2 DS:265c
    IF NOT (A_12fc!(L_BP0e%, 1) > L_BP202!) THEN GOTO L_2753f   '@274ef
    L_BP202! = A_12fc!(L_BP0e%, 1)   '@2751c
L_2753f:
L_27544:
    L_BP0e% = L_BP0e% + 1   '@27544
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_274c2   '@2754c
    L_BP0e% = 1   '@2756c
L_2757c:
    IF NOT (A_10cc!(L_BP0e%, 1) = 0.0) THEN GOTO L_275eb   '@2757c DS:265c
    A_10cc!(L_BP0e%, 3) = -(FX##(L_BP202!) - A_12fc!(L_BP0e%, 1))   '@275a9
L_275eb:
    L_BP0e% = L_BP0e% + 1   '@275eb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_2757c   '@275f3
L_27618:
    L_BP204% = (FX##(VAL(V_0f18$)) >= 1.0 + FX##(V_0e54_nivellaje!))   '@27618 DS:26a0
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_0e52%) + V_0e54_nivellaje! AND L_BP204%) <> 0) THEN GOTO L_27889   '@27659
    L_BP0e% = 0   '@2767b
    V_0ef0! = 0.0   '@27685 DS:265c
L_2769c:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@2769c DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_276ef   '@276b2 DS:26d4
    L_BP0e% = L_BP0e% + 1   '@276e7
L_276ef:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(L_BP0e%) + V_0e54_nivellaje! < FX##(VAL(V_0f18$)) THEN GOTO L_2769c   '@276ef
    LOCATE 25, 1   '@27718
    PRINT RT_TAB$(80); ""; "";   '@27733 DS:26d0
    LOCATE 24, 1   '@27753
    PRINT " Alinhamento da Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(L_BP0e%) + V_0e54_nivellaje!))); "  ("; CHR$(24); "+ cm) *"; LTRIM$(STR$(A_10cc!(RT_CINT%(FX##(V_0ef0!)), 3))); "* ";   '@2776e DS:2b8e,2ba8,2bb0,2bbc
    CALL MIXT_07f1_LimpaTeclado   '@2780a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@27814 DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_2787c   '@2782e
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 3) = VAL(V_0f18$)   '@27843
L_2787c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_27330   '@2787c
L_27889:
    GOTO L_2874c   '@27889
L_27891:
    IF NOT (L_BP1da$ <> "B") THEN GOTO L_278b7   '@27891 DS:2bc2
    IF NOT (L_BP1da$ = "b") THEN GOTO L_2823f   '@278a4 DS:2bc8
L_278b7:
L_278bc:
    RT_VIEWPRINT 23, 25   '@278c1
    RT_CLS 2   '@278d3
    RT_VIEWPRINT 1, 25   '@278e1
    LOCATE 25, 1   '@278f3
    PRINT " Acione   A <Enter>  para Anular todos os Buracos definidos";   '@2790e DS:2bce
    LOCATE 23, 1   '@2791c
    PRINT " Numero da Laje para consideracao de Buraco *RETORNA* ";   '@27937 DS:2c0e
    CALL MIXT_07f1_LimpaTeclado   '@27945
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@2794f DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "A") THEN GOTO L_27d3b   '@27969 DS:2aec
    L_BP0e% = 1   '@27986
    L_BP10% = 0   '@27990
L_279a0:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_279dd   '@279a0 DS:26d4
    L_BP10% = L_BP10% + 1   '@279cd
    GOTO L_27b24   '@279d5
L_279dd:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@279dd
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@27a00
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0e54_nivellaje!))))   '@27a23
    L_BP208! = V_14d4! - FX##(LEN(V_0f1c$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@27a61
    L_BP20c! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@27aa0 DS:2744
    L_BP210$ = "~" + V_0f1c$   '@27acc DS:274c
    L_BP214$ = "CGA"   '@27ae4 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP208!, L_BP20c!, L_BP210$, L_BP214$)   '@27af2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @27b0b libera strings locais (L_BP210)
    ' @27b15 libera strings locais (L_BP214)
L_27b24:
    L_BP0e% = L_BP0e% + 1   '@27b24
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_279a0   '@27b2c
    L_BP0e% = 1   '@27b4c
L_27b5c:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_27bac   '@27b5c DS:26d4
    A_10cc!(L_BP0e%, 1) = 0.0   '@27b89 DS:265c
L_27bac:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@27bac
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@27bcf
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(L_BP0e%) + V_0e54_nivellaje!)))   '@27bf2
    L_BP218! = V_14d4! - FX##(LEN(V_0f1c$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@27c2d
    L_BP21c! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@27c6c DS:2744
    L_BP220$ = "~" + V_0f1c$   '@27c98 DS:274c
    L_BP224$ = "CGA"   '@27cb0 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP218!, L_BP21c!, L_BP220$, L_BP224$)   '@27cbe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @27cd7 libera strings locais (L_BP220)
    ' @27ce1 libera strings locais (L_BP224)
    L_BP0e% = L_BP0e% + 1   '@27ceb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_27b5c   '@27cf3
    V_0e52% = A_109e%(0, 0)   '@27d13
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_278bc   '@27d2e
L_27d3b:
    L_BP226% = (FX##(VAL(V_0f18$)) >= 1.0 + FX##(V_0e54_nivellaje!))   '@27d3b DS:26a0
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_0e52%) + V_0e54_nivellaje! AND L_BP226%) <> 0) THEN GOTO L_28237   '@27d7c
    L_BP0e% = 0   '@27d9e
    V_0ef0! = 0.0   '@27da8 DS:265c
L_27dbe:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@27dbe DS:26a0
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) <> 2.0) THEN GOTO L_27e11   '@27dd4 DS:26d4
    L_BP0e% = L_BP0e% + 1   '@27e09
L_27e11:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(L_BP0e%) + V_0e54_nivellaje! < FX##(VAL(V_0f18$)) THEN GOTO L_27dbe   '@27e11
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 2.0) THEN GOTO L_27e81   '@27e3a DS:26d4
    BEEP   '@27e6f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_278bc   '@27e79
L_27e81:
    L_BP0e% = 1   '@27e81
    L_BP10% = 0   '@27e8b
L_27e9a:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_27ed7   '@27e9a DS:26d4
    L_BP10% = L_BP10% + 1   '@27ec7
    GOTO L_2801e   '@27ecf
L_27ed7:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@27ed7
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@27efa
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0e54_nivellaje!))))   '@27f1d
    L_BP22a! = V_14d4! - FX##(LEN(V_0f1c$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@27f5b
    L_BP22e! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@27f9a DS:2744
    L_BP232$ = "~" + V_0f1c$   '@27fc6 DS:274c
    L_BP236$ = "CGA"   '@27fde DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP22a!, L_BP22e!, L_BP232$, L_BP236$)   '@27fec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @28005 libera strings locais (L_BP232)
    ' @2800f libera strings locais (L_BP236)
L_2801e:
    L_BP0e% = L_BP0e% + 1   '@2801e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_27e9a   '@28026
    A_10cc!(RT_CINT%(FX##(V_0ef0!)), 1) = 2.0   '@28046 DS:26d4
    V_0e52% = V_0e52% - 1   '@28071
    L_BP0e% = 1   '@2807a
    L_BP10% = 0   '@28084
L_28094:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_280d1   '@28094 DS:26d4
    L_BP10% = L_BP10% + 1   '@280c1
    GOTO L_281f5   '@280c9
L_280d1:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@280d1
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@280f4
    V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0e54_nivellaje!))))   '@28117
    L_BP23a! = V_14d4! - FX##(LEN(V_0f1c$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@28155
    L_BP23e! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@28194 DS:2744
    L_BP242$ = "CGA"   '@281c0 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP23a!, L_BP23e!, V_0f1c$, L_BP242$)   '@281ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @281e6 libera strings locais (L_BP242)
L_281f5:
    L_BP0e% = L_BP0e% + 1   '@281f5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_28094   '@281fd
    GOSUB L_20e02   '@2821d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_278bc   '@2822a
L_28237:
    GOTO L_2874c   '@28237
L_2823f:
    IF NOT (L_BP1da$ <> "N") THEN GOTO L_28265   '@2823f DS:2c48
    IF NOT (L_BP1da$ = "n") THEN GOTO L_28707   '@28252 DS:2c4e
L_28265:
    V_0f14! = 0.0   '@28265 DS:265c
    RT_VIEWPRINT 23, 25   '@28276
    RT_CLS 2   '@28288
    RT_VIEWPRINT 1, 25   '@28296
    LOCATE 24, 1   '@282a8
    PRINT " Nivel das Lajes para numeracao *"; LTRIM$(STR$(V_0e54_nivellaje!)); "* ";   '@282c3 DS:2bbc,2c54
    CALL MIXT_07f1_LimpaTeclado   '@282f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@282fd DS:26d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef0! = V_0e54_nivellaje!   '@28317
    L_BP244% = (VAL(V_0f18$) > 0.0#)   '@28328 DS:28fc
    IF NOT ((V_0f18$ = "0" OR L_BP244%) <> 0) THEN GOTO L_283a1   '@2835b DS:2904
    V_0e54_nivellaje! = VAL(V_0f18$)   '@28371
    V_0f14! = 1.0   '@2838b DS:26a0
L_283a1:
    PRINT " Denominacao utilizada *"; V_0e58_prefixolaje$; "* ";   '@283a1 DS:2bbc,2c7a
    CALL MIXT_07f1_LimpaTeclado   '@283c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@283cb DS:26d0 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f1c$ = V_0e58_prefixolaje$   '@283e5
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_28434   '@283f7
    V_0e58_prefixolaje$ = V_0f18$   '@2840c
    V_0f14! = 1.0   '@2841e DS:26a0
L_28434:
    IF NOT (V_0f14! = 1.0) THEN GOTO L_286ff   '@28434 DS:26a0
    L_BP0e% = 1   '@2844f
    L_BP10% = 0   '@28459
L_28468:
    IF NOT (A_10cc!(L_BP0e%, 1) = 2.0) THEN GOTO L_284a5   '@28468 DS:26d4
    L_BP10% = L_BP10% + 1   '@28495
    GOTO L_286c5   '@2849d
L_284a5:
    V_0ef4# = A_10cc!(L_BP0e%, 6)   '@284a5
    V_0efc# = A_10cc!(L_BP0e%, 7)   '@284c8
    V_0f20$ = V_0f1c$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0ef0!))))   '@284eb
    L_BP248! = V_14d4! - FX##(LEN(V_0f20$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@28529
    L_BP24c! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@28568 DS:2744
    L_BP250$ = "~" + V_0f20$   '@28594 DS:274c
    L_BP254$ = "CGA"   '@285ac DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP248!, L_BP24c!, L_BP250$, L_BP254$)   '@285ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @285d3 libera strings locais (L_BP250)
    ' @285dd libera strings locais (L_BP254)
    V_0f20$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(L_BP0e% - L_BP10% + FX##(V_0e54_nivellaje!))))   '@285e7
    L_BP258! = V_14d4! - FX##(LEN(V_0f20$)) * L_BP7a! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@28625
    L_BP25c! = FX##(L_BP7e!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@28664 DS:2744
    L_BP260$ = "CGA"   '@28690 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP258!, L_BP25c!, V_0f20$, L_BP260$)   '@2869e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @286b6 libera strings locais (L_BP260)
L_286c5:
    L_BP0e% = L_BP0e% + 1   '@286c5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP0e%) THEN GOTO L_28468   '@286cd
    GOSUB L_20e02   '@286ed
L_286ff:
    GOTO L_2874c   '@286ff
L_28707:
    IF NOT (L_BP1da$ <> "F") THEN GOTO L_2872d   '@28707 DS:2c96
    IF NOT (L_BP1da$ = "f") THEN GOTO L_2873f   '@2871a DS:2c9c
L_2872d:
    RETURN   '@2872d
    ' @28737 (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_2874c   '@28737
L_2873f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25f27   '@2873f
L_2874c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25ec2   '@2874c
    ' ---- FUN_2000_8759 @0x28759  (028759_FUN_2000_8759.lift.txt; evidence_id (assembly): ev_3518067f614da4e2d77fb0bc9f7d39114e7a38e46c6a4c154c06818d6cb20969)
L_28759:   ' entrada vinda de 020137_FUN_2000_0137
    ' @28759 libera strings locais (L_BP1f2)
    ' @28763 libera strings locais (L_BP1da)
    ' @2876d libera strings locais (L_BP62)
    ' END SUB   '@28776
END SUB

SUB S_28786   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x28786)
    ' ---- FUN_2000_8786 @0x28786  (028786_FUN_2000_8786.lift.txt; evidence_id (assembly): ev_049d0b009f399fef947b7d92fa4a746eb8c69d334393f4807880641435823f1c)
    BEEP   '@2878e
    BEEP   '@28798
    BEEP   '@287a2
    RT_SCREEN 0   '@287ac
    RT_VIEWPRINT 1, 25   '@287c1
    RT_CLOSE   '@287d3 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!))   '@287e0 DS:2664
    RT_CLS 0   '@28825
    LOCATE 10, 1   '@28832
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@2884d DS:26d0,2ca2
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@2886d DS:26d0,2cbc
    PRINT RT_TAB$(24); ""; "Acione <ESC> para Continuar ";   '@2888d DS:26d0,2ce8
L_288b2:
    RT_ESPERA_EVENTO   ' laco sem leitura: so o ON KEY sai dele
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    GOTO L_288b2   '@288b7
END SUB

SUB S_288d3   ' entrada de SUB/FUNCTION (B$ENRA, locais 752 bytes) (0x288d3)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP20%
    DIM L_BP24$
    DIM L_BP28$
    DIM L_BP2c!
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
    ' ---- FUN_2000_88d3 @0x288d3  (0288d3_FUN_2000_88d3.lift.txt; evidence_id (assembly): ev_a80c9adf72bfb381cc2fdad7a1de09287fbe460583f8434965641e37feb23ac4)
    IF NOT (V_0e38% = 0) THEN GOTO L_288f7   '@288e0
    GOTO L_2fe5f   '@288ef
L_288f7:
    REDIM A_14fa%(-32768 TO -32768)   '@288f7
    REDIM A_14fa%(0 TO 480)   '@28905
    IF NOT (V_0e3a% = 0) THEN GOTO L_28971   '@28922
    REDIM A_1042!(-32768 TO -32768, -32768 TO -32768)   '@28931
    REDIM A_1042!(0 TO V_0e4a%, 0 TO 3)   '@2893f
    V_0e3a% = 1   '@28961
L_28971:
    L_BP24$ = V_0dcc_placa$   '@28971
    IF NOT (L_BP24$ = "HER") THEN GOTO L_28a19   '@28983 DS:2650
    RT_SCREEN 3   '@2899a
    L_BP12! = 7.0   '@289b0 DS:2658
    L_BP0e! = 7.0   '@289c0 DS:2658
    L_BP16! = 7.0   '@289d0 DS:2658
    L_BP1a! = 7.0   '@289e0 DS:2658
    L_BP1e! = 7.0   '@289f0 DS:2658
    V_14be! = 0.0   '@28a00 DS:265c
    GOTO L_28b72   '@28a11
L_28a19:
    IF NOT (L_BP24$ <> "CGA") THEN GOTO L_28a3d   '@28a19 DS:2668
    IF NOT (L_BP24$ = "MCG") THEN GOTO L_28ab9   '@28a2b DS:2670
L_28a3d:
    RT_SCREEN 2   '@28a3d
    L_BP12! = 15.0   '@28a50 DS:2678
    L_BP0e! = 15.0   '@28a60 DS:2678
    L_BP16! = 15.0   '@28a70 DS:2678
    L_BP1a! = 15.0   '@28a80 DS:2678
    L_BP1e! = 15.0   '@28a90 DS:2678
    V_14be! = 0.0   '@28aa0 DS:265c
    GOTO L_28b72   '@28ab1
L_28ab9:
    IF NOT (L_BP24$ <> "EGA") THEN GOTO L_28add   '@28ab9 DS:267c
    IF NOT (L_BP24$ = "VGA") THEN GOTO L_28b72   '@28acb DS:2684
L_28add:
    RT_SCREEN 9   '@28add
    COLOR , 1   '@28af3
    L_BP12! = 9.0   '@28b09 DS:268c
    L_BP0e! = 14.0   '@28b19 DS:2690
    L_BP16! = 12.0   '@28b29 DS:2694
    L_BP1a! = 13.0   '@28b39 DS:2698
    L_BP1e! = 16.0   '@28b49 DS:269c
    V_14be! = 1.0   '@28b59 DS:26a0
    GOTO L_28b72   '@28b6a
L_28b72:
    V_14c2% = 0   '@28b72
    L_BP20% = 0   '@28b7d
    IF NOT (V_14f4% = 1) THEN GOTO L_28b9e   '@28b87
    GOTO L_28c83   '@28b96
L_28b9e:
    V_14f6! = 2.0   '@28b9e DS:26d4
L_28bb4:
    V_14e4! = A_0f8a!(1, 1)   '@28bb9
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@28bda
    V_14e8! = A_0f8a!(1, 0)   '@28c17
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@28c3a
    V_14f4% = 1   '@28c73
L_28c83:
    V_14cc! = V_14e4!   '@28c88
    V_14d0! = V_14e8!   '@28c99
    V_14c4! = V_14e4!   '@28caa
    V_14c8! = V_14e8!   '@28cbb
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@28ccc DS:26a4
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@28cea DS:26a8
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_28d46   '@28d08 DS:26ac
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@28d28 DS:26ac
    GOTO L_28d61   '@28d3e
L_28d46:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@28d46 DS:26ac
L_28d61:
L_28d66:
    RT_CLS -1   '@28d6b
    RT_WINDOW 1, (0), (0), (639), (199)   '@28d79 DS:265c,265e,26b0,26b2,26b4,26b6 (B$WIND decodificado)
    V_14d4! = 45.0   '@28da7 DS:26b8
    V_14d8! = 10.0   '@28db8 DS:26bc
    GOSUB L_2ea95   '@28dc9
    GOSUB L_2f4f7   '@28dd6
    IF NOT (L_BP20% = 1) THEN GOTO L_28dfe   '@28de3
    GOSUB L_2f67a   '@28df1
L_28dfe:
    IF NOT (A_1042!(0, 0) > 0.0) THEN GOTO L_29039   '@28dfe DS:265c
    GOSUB L_2fc90   '@28e28
    IF NOT (A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 3) <= V_14f0! AND (A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 3) >= V_14e8! AND (A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 2) <= V_14ec! AND A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 2) >= V_14e4!))) THEN GOTO L_29034   '@28e35
    V_14cc! = A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 2)   '@28f4d
    V_14d0! = A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 3)   '@28f84
    V_14c4! = A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 2)   '@28fbe
    V_14c8! = A_1042!(RT_CINT%(FX##(A_1042!(0, 0))), 3)   '@28ff5
L_29034:
L_29039:
    IF NOT (V_1528$ = "S") THEN GOTO L_29058   '@29039 DS:2752
    GOTO L_2fe5f   '@29050
L_29058:
    V_14dc! = V_14c4!   '@29058
    V_14e0! = V_14c8!   '@29069
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@2907a DS:26d8
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@290ed DS:26d8
    GOSUB L_2f1e1   '@29160
    GOSUB L_2f364   '@2916d
L_2917f:
    RT_VIEWPRINT 23, 25   '@29184
    LOCATE 23, 1   '@29196
    PRINT " <"; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " *> Movimenta";   '@291b1 DS:2d08,2d0e
    IF NOT (V_14c2% = 0) THEN GOTO L_29296   '@29204
    PRINT " por Eixo"; RT_TAB$(79); ""; ""   '@29213 DS:26d0,2d20
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <C>oordenada  <F>im"; RT_TAB$(79); ""; ""   '@2923c DS:26d0,2d2e
    PRINT " <A>lvenaria"; RT_TAB$(79); ""; "";   '@29265 DS:26d0,2d80
    GOTO L_29316   '@2928e
L_29296:
    PRINT " por Coordenada"; RT_TAB$(79); ""; ""   '@29296 DS:26d0,2d90
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <E>ixo        <F>im"; RT_TAB$(79); ""; ""   '@292bf DS:26d0,2da4
    PRINT " <A>lvenaria          <+ -> <P>asso do cursor      <C>oordenada absoluta  "; RT_TAB$(79); ""; "";   '@292e8 DS:26d0,2df6
L_29316:
    LOCATE 24, 11   '@29316
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@29334 DS:2e44
    RT_VIEWPRINT 1, 25   '@29361
    LOCATE 22, 1   '@29373
    PRINT RT_STRINGC$((29), (95)); "  E S T R U T U R A  "; RT_STRINGC$((30), (95));   '@2938e DS:2e58
L_293c7:
    V_0f18$ = ""   '@293cc DS:26d0
L_293e4:
    V_0f18$ = RT_INKEY$   '@293e4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_293e4   '@293f8 DS:26d0
    L_BP28$ = V_0f18$   '@2940c
    IF NOT (L_BP28$ <> "4") THEN GOTO L_2945c   '@2941e DS:2e72
    IF NOT (CHR$(0) + CHR$(75) = L_BP28$) THEN GOTO L_2a0a7   '@29435
L_2945c:
    IF NOT (V_14c2% = 0) THEN GOTO L_2a065   '@2945c
    FOR V_0f10! = A_0f8a!(0, 1) TO 1.0 STEP -1.0   '@2946b DS:26a0,26f0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) < V_14cc!) THEN GOTO L_2a031   '@2948a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) >= V_14e4!) THEN GOTO L_2951f   '@294bf
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@294f4
L_2951f:
    V_0f14! = 1.0   '@2951f DS:26a0
    V_0ef4# = V_14c4!   '@29530
L_29546:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_29a92   '@29547
    L_BP2c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2956b
    L_BP30! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@29596
    CALL MIXT_0877_Menor(L_BP2c!, L_BP30!, L_BP34!)   '@295ba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP30!   '@295cc
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP2c!   '@295f1
    IF NOT (L_BP34! > V_14d0!) THEN GOTO L_29632   '@29616
    GOTO L_29a6e   '@2962a
L_29632:
    L_BP38! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@29632
    L_BP3c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2965d
    CALL MIXT_082a_Maior(L_BP38!, L_BP3c!, L_BP40!)   '@29681
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP3c!   '@29693
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP38!   '@296b8
    IF NOT (L_BP40! < V_14d0!) THEN GOTO L_296f9   '@296dd
    GOTO L_29a6e   '@296f1
L_296f9:
    L_BP44! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@296f9
    L_BP48! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@29723
    CALL MIXT_0877_Menor(L_BP44!, L_BP48!, L_BP4c!)   '@29744
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP48!   '@29756
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP44!   '@29778
    IF NOT (L_BP4c! > V_14cc!) THEN GOTO L_297b8   '@2979c
    GOTO L_29a6e   '@297b0
L_297b8:
    L_BP50! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@297b8
    L_BP54! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@297e2
    CALL MIXT_082a_Maior(L_BP50!, L_BP54!, L_BP58!)   '@29803
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP54!   '@29815
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP50!   '@29837
    IF NOT (L_BP58! < V_14c4!) THEN GOTO L_29877   '@2985b
    GOTO L_29a6e   '@2986f
L_29877:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_298ce   '@29877
    GOTO L_29a6e   '@298c6
L_298ce:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2994b   '@298ce
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@29919
    GOTO L_29a1d   '@29943
L_2994b:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1))   '@2994b
L_29a1d:
    IF NOT (FX##(V_14cc!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_29a69   '@29a1d
    IF NOT (FX##(V_0f04!) > FX##(V_0ef4#)) THEN GOTO L_29a69   '@29a3d
    V_0ef4# = V_0f04!   '@29a58
L_29a69:
L_29a6e:
    V_0f14! = FX##(V_0f14!) + 1.0   '@29a73 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29546   '@29a89
L_29a92:
    V_0f14! = 1.0   '@29a92 DS:26a0
L_29aa8:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_29ff8   '@29aa9
    L_BP5c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@29acd
    L_BP60! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@29af8
    CALL MIXT_0877_Menor(L_BP5c!, L_BP60!, L_BP64!)   '@29b1c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP60!   '@29b2e
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP5c!   '@29b53
    IF NOT (L_BP64! > V_14d0!) THEN GOTO L_29b94   '@29b78
    GOTO L_29fd5   '@29b8c
L_29b94:
    L_BP68! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@29b94
    L_BP6c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@29bbf
    CALL MIXT_082a_Maior(L_BP68!, L_BP6c!, L_BP70!)   '@29be3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP6c!   '@29bf5
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP68!   '@29c1a
    IF NOT (L_BP70! < V_14d0!) THEN GOTO L_29c5b   '@29c3f
    GOTO L_29fd5   '@29c53
L_29c5b:
    L_BP74! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@29c5b
    L_BP78! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@29c85
    CALL MIXT_0877_Menor(L_BP74!, L_BP78!, L_BP7c!)   '@29ca6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP78!   '@29cb8
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP74!   '@29cda
    IF NOT (L_BP7c! > V_14cc!) THEN GOTO L_29d1a   '@29cfe
    GOTO L_29fd5   '@29d12
L_29d1a:
    L_BP80! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@29d1a
    L_BP84! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@29d44
    CALL MIXT_082a_Maior(L_BP80!, L_BP84!, L_BP88!)   '@29d66
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP84!   '@29d7a
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP80!   '@29d9d
    IF NOT (L_BP88! < V_14c4!) THEN GOTO L_29dde   '@29dc1
    GOTO L_29fd5   '@29dd6
L_29dde:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_29e35   '@29dde
    GOTO L_29fd5   '@29e2d
L_29e35:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_29eb2   '@29e35
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@29e80
    GOTO L_29f84   '@29eaa
L_29eb2:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@29eb2
L_29f84:
    IF NOT (FX##(V_14cc!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_29fd0   '@29f84
    IF NOT (FX##(V_0f04!) > FX##(V_0ef4#)) THEN GOTO L_29fd0   '@29fa4
    V_0ef4# = V_0f04!   '@29fbf
L_29fd0:
L_29fd5:
    V_0f14! = FX##(V_0f14!) + 1.0   '@29fda DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_29aa8   '@29ff0
L_29ff8:
    IF NOT (FX##(V_14c4!) < FX##(V_0ef4#)) THEN GOTO L_2a024   '@29ff8
    V_14c4! = V_0ef4#   '@2a013
L_2a024:
    GOTO L_2a05d   '@2a024
L_2a031:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2a031 DS:26a0,26f0
L_2a05d:
    GOTO L_2a09f   '@2a05d
L_2a065:
    L_BP8c! = FX##(V_14cc!) - V_14f6!   '@2a065
    CALL MIXT_082a_Maior(V_14e4!, L_BP8c!, L_BP90!)   '@2a07b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP90!   '@2a08f
L_2a09f:
    GOTO L_2e7ff   '@2a09f
L_2a0a7:
    IF NOT (L_BP28$ <> "6") THEN GOTO L_2a0e0   '@2a0a7 DS:2e78
    IF NOT (CHR$(0) + CHR$(77) = L_BP28$) THEN GOTO L_2ad73   '@2a0b9
L_2a0e0:
    IF NOT (V_14c2% = 0) THEN GOTO L_2ad31   '@2a0e0
    L_BP94! = A_0f8a!(0, 1)   '@2a0ef
    FOR V_0f10! = 1.0 TO L_BP94!   '@2a113 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) > V_14cc!) THEN GOTO L_2acfd   '@2a11a
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) <= V_14ec!) THEN GOTO L_2a1af   '@2a14f
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@2a184
L_2a1af:
    V_0f14! = 1.0   '@2a1af DS:26a0
    V_0ef4# = V_14c4!   '@2a1c0
L_2a1d6:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_2a742   '@2a1d7
    L_BP98! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2a1fb
    L_BP9c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2a227
    CALL MIXT_0877_Menor(L_BP98!, L_BP9c!, L_BPa0!)   '@2a24c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP9c!   '@2a261
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP98!   '@2a287
    IF NOT (L_BPa0! > V_14d0!) THEN GOTO L_2a2ca   '@2a2ad
    GOTO L_2a71e   '@2a2c2
L_2a2ca:
    L_BPa4! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2a2ca
    L_BPa8! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2a2f6
    CALL MIXT_082a_Maior(L_BPa4!, L_BPa8!, L_BPac!)   '@2a31b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPa8!   '@2a330
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPa4!   '@2a356
    IF NOT (L_BPac! < V_14d0!) THEN GOTO L_2a399   '@2a37c
    GOTO L_2a71e   '@2a391
L_2a399:
    L_BPb0! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2a399
    L_BPb4! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2a3c4
    CALL MIXT_0877_Menor(L_BPb0!, L_BPb4!, L_BPb8!)   '@2a3e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPb4!   '@2a3fb
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPb0!   '@2a41e
    IF NOT (L_BPb8! > V_14c4!) THEN GOTO L_2a460   '@2a443
    GOTO L_2a71e   '@2a458
L_2a460:
    L_BPbc! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2a460
    L_BPc0! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2a48b
    CALL MIXT_082a_Maior(L_BPbc!, L_BPc0!, L_BPc4!)   '@2a4ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPc0!   '@2a4c2
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPbc!   '@2a4e5
    IF NOT (L_BPc4! < V_14cc!) THEN GOTO L_2a527   '@2a50a
    GOTO L_2a71e   '@2a51f
L_2a527:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2a57e   '@2a527
    GOTO L_2a71e   '@2a576
L_2a57e:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2a5fb   '@2a57e
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2a5c9
    GOTO L_2a6cd   '@2a5f3
L_2a5fb:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1))   '@2a5fb
L_2a6cd:
    IF NOT (FX##(V_14cc!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_2a719   '@2a6cd
    IF NOT (FX##(V_0f04!) < FX##(V_0ef4#)) THEN GOTO L_2a719   '@2a6ed
    V_0ef4# = V_0f04!   '@2a708
L_2a719:
L_2a71e:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2a723 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2a1d6   '@2a739
L_2a742:
    V_0f14! = 1.0   '@2a742 DS:26a0
L_2a758:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_2acc4   '@2a759
    L_BPc8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2a77d
    L_BPcc! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2a7a9
    CALL MIXT_0877_Menor(L_BPc8!, L_BPcc!, L_BPd0!)   '@2a7ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPcc!   '@2a7e3
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPc8!   '@2a809
    IF NOT (L_BPd0! > V_14d0!) THEN GOTO L_2a84c   '@2a82f
    GOTO L_2aca0   '@2a844
L_2a84c:
    L_BPd4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2a84c
    L_BPd8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2a878
    CALL MIXT_082a_Maior(L_BPd4!, L_BPd8!, L_BPdc!)   '@2a89d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPd8!   '@2a8b2
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPd4!   '@2a8d8
    IF NOT (L_BPdc! < V_14d0!) THEN GOTO L_2a91b   '@2a8fe
    GOTO L_2aca0   '@2a913
L_2a91b:
    L_BPe0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2a91b
    L_BPe4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2a946
    CALL MIXT_0877_Menor(L_BPe0!, L_BPe4!, L_BPe8!)   '@2a968
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPe4!   '@2a97d
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPe0!   '@2a9a0
    IF NOT (L_BPe8! > V_14c4!) THEN GOTO L_2a9e2   '@2a9c5
    GOTO L_2aca0   '@2a9da
L_2a9e2:
    L_BPec! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2a9e2
    L_BPf0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2aa0d
    CALL MIXT_082a_Maior(L_BPec!, L_BPf0!, L_BPf4!)   '@2aa2f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPf0!   '@2aa44
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPec!   '@2aa67
    IF NOT (L_BPf4! < V_14cc!) THEN GOTO L_2aaa9   '@2aa8c
    GOTO L_2aca0   '@2aaa1
L_2aaa9:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2ab00   '@2aaa9
    GOTO L_2aca0   '@2aaf8
L_2ab00:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2ab7d   '@2ab00
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2ab4b
    GOTO L_2ac4f   '@2ab75
L_2ab7d:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@2ab7d
L_2ac4f:
    IF NOT (FX##(V_14cc!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_2ac9b   '@2ac4f
    IF NOT (FX##(V_0f04!) < FX##(V_0ef4#)) THEN GOTO L_2ac9b   '@2ac6f
    V_0ef4# = V_0f04!   '@2ac8a
L_2ac9b:
L_2aca0:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2aca5 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2a758   '@2acbb
L_2acc4:
    IF NOT (FX##(V_14c4!) > FX##(V_0ef4#)) THEN GOTO L_2acf0   '@2acc4
    V_14c4! = V_0ef4#   '@2acdf
L_2acf0:
    GOTO L_2ad29   '@2acf0
L_2acfd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2acfd DS:26a0
L_2ad29:
    GOTO L_2ad6b   '@2ad29
L_2ad31:
    L_BPf8! = FX##(V_14cc!) + V_14f6!   '@2ad31
    CALL MIXT_0877_Menor(V_14ec!, L_BPf8!, L_BPfc!)   '@2ad47
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BPfc!   '@2ad5b
L_2ad6b:
    GOTO L_2e7ff   '@2ad6b
L_2ad73:
    IF NOT (L_BP28$ <> "8") THEN GOTO L_2adac   '@2ad73 DS:2e7e
    IF NOT (CHR$(0) + CHR$(72) = L_BP28$) THEN GOTO L_2ba3b   '@2ad85
L_2adac:
    IF NOT (V_14c2% = 0) THEN GOTO L_2b9f9   '@2adac
    L_BP100! = A_0f8a!(0, 0)   '@2adbb
    FOR V_0f10! = 1.0 TO L_BP100!   '@2addc DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) > V_14d0!) THEN GOTO L_2b9c5   '@2ade4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) <= V_14f0!) THEN GOTO L_2ae76   '@2ae18
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@2ae4c
L_2ae76:
    V_0f14! = 1.0   '@2ae76 DS:26a0
    V_0efc# = V_14c8!   '@2ae87
L_2ae9e:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_2b40a   '@2ae9f
    L_BP104! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2aec3
    L_BP108! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2aeee
    CALL MIXT_0877_Menor(L_BP104!, L_BP108!, L_BP10c!)   '@2af10
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP108!   '@2af25
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP104!   '@2af48
    IF NOT (L_BP10c! > V_14cc!) THEN GOTO L_2af8a   '@2af6d
    GOTO L_2b3e7   '@2af82
L_2af8a:
    L_BP110! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2af8a
    L_BP114! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2afb5
    CALL MIXT_082a_Maior(L_BP110!, L_BP114!, L_BP118!)   '@2afd7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP114!   '@2afec
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP110!   '@2b00f
    IF NOT (L_BP118! < V_14cc!) THEN GOTO L_2b051   '@2b034
    GOTO L_2b3e7   '@2b049
L_2b051:
    L_BP11c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b051
    L_BP120! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2b07d
    CALL MIXT_0877_Menor(L_BP11c!, L_BP120!, L_BP124!)   '@2b0a2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP120!   '@2b0b7
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP11c!   '@2b0dd
    IF NOT (L_BP124! > V_14c8!) THEN GOTO L_2b120   '@2b103
    GOTO L_2b3e7   '@2b118
L_2b120:
    L_BP128! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b120
    L_BP12c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2b14c
    CALL MIXT_082a_Maior(L_BP128!, L_BP12c!, L_BP130!)   '@2b171
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP12c!   '@2b186
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP128!   '@2b1ac
    IF NOT (L_BP130! < V_14d0!) THEN GOTO L_2b1ef   '@2b1d2
    GOTO L_2b3e7   '@2b1e7
L_2b1ef:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2b242   '@2b1ef
    GOTO L_2b3e7   '@2b23a
L_2b242:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2b2c4   '@2b242
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b291
    GOTO L_2b396   '@2b2bc
L_2b2c4:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0))   '@2b2c4
L_2b396:
    IF NOT (FX##(V_14d0!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_2b3e2   '@2b396
    IF NOT (FX##(V_0f04!) < FX##(V_0efc#)) THEN GOTO L_2b3e2   '@2b3b6
    V_0efc# = V_0f04!   '@2b3d1
L_2b3e2:
L_2b3e7:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2b3ec DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2ae9e   '@2b402
L_2b40a:
    V_0f14! = 1.0   '@2b40a DS:26a0
L_2b420:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_2b98c   '@2b421
    L_BP134! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2b445
    L_BP138! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2b470
    CALL MIXT_0877_Menor(L_BP134!, L_BP138!, L_BP13c!)   '@2b492
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP138!   '@2b4a7
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP134!   '@2b4ca
    IF NOT (L_BP13c! > V_14cc!) THEN GOTO L_2b50c   '@2b4ef
    GOTO L_2b969   '@2b504
L_2b50c:
    L_BP140! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2b50c
    L_BP144! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2b537
    CALL MIXT_082a_Maior(L_BP140!, L_BP144!, L_BP148!)   '@2b559
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP144!   '@2b56e
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP140!   '@2b591
    IF NOT (L_BP148! < V_14cc!) THEN GOTO L_2b5d3   '@2b5b6
    GOTO L_2b969   '@2b5cb
L_2b5d3:
    L_BP14c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b5d3
    L_BP150! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2b5ff
    CALL MIXT_0877_Menor(L_BP14c!, L_BP150!, L_BP154!)   '@2b624
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP150!   '@2b639
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP14c!   '@2b65f
    IF NOT (L_BP154! > V_14c8!) THEN GOTO L_2b6a2   '@2b685
    GOTO L_2b969   '@2b69a
L_2b6a2:
    L_BP158! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b6a2
    L_BP15c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2b6ce
    CALL MIXT_082a_Maior(L_BP158!, L_BP15c!, L_BP160!)   '@2b6f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP15c!   '@2b708
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP158!   '@2b72e
    IF NOT (L_BP160! < V_14d0!) THEN GOTO L_2b771   '@2b754
    GOTO L_2b969   '@2b769
L_2b771:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2b7c4   '@2b771
    GOTO L_2b969   '@2b7bc
L_2b7c4:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2b846   '@2b7c4
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2b813
    GOTO L_2b918   '@2b83e
L_2b846:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@2b846
L_2b918:
    IF NOT (FX##(V_14d0!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_2b964   '@2b918
    IF NOT (FX##(V_0f04!) < FX##(V_0efc#)) THEN GOTO L_2b964   '@2b938
    V_0efc# = V_0f04!   '@2b953
L_2b964:
L_2b969:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2b96e DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2b420   '@2b984
L_2b98c:
    IF NOT (FX##(V_14c8!) > FX##(V_0efc#)) THEN GOTO L_2b9b8   '@2b98c
    V_14c8! = V_0efc#   '@2b9a7
L_2b9b8:
    GOTO L_2b9f1   '@2b9b8
L_2b9c5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2b9c5 DS:26a0
L_2b9f1:
    GOTO L_2ba33   '@2b9f1
L_2b9f9:
    L_BP164! = FX##(V_14d0!) + V_14f6!   '@2b9f9
    CALL MIXT_0877_Menor(V_14f0!, L_BP164!, L_BP168!)   '@2ba0f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP168!   '@2ba23
L_2ba33:
    GOTO L_2e7ff   '@2ba33
L_2ba3b:
    IF NOT (L_BP28$ <> "2") THEN GOTO L_2ba74   '@2ba3b DS:2e84
    IF NOT (CHR$(0) + CHR$(80) = L_BP28$) THEN GOTO L_2c6f7   '@2ba4d
L_2ba74:
    IF NOT (V_14c2% = 0) THEN GOTO L_2c6b5   '@2ba74
    FOR V_0f10! = A_0f8a!(0, 0) TO 1.0 STEP -1.0   '@2ba83 DS:26a0,26f0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) < V_14d0!) THEN GOTO L_2c681   '@2baa0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) >= V_14e8!) THEN GOTO L_2bb32   '@2bad4
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@2bb08
L_2bb32:
    V_0f14! = 1.0   '@2bb32 DS:26a0
    V_0efc# = V_14c8!   '@2bb43
L_2bb5a:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_2c0c6   '@2bb5b
    L_BP16c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2bb7f
    L_BP170! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2bbaa
    CALL MIXT_0877_Menor(L_BP16c!, L_BP170!, L_BP174!)   '@2bbcc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP170!   '@2bbe1
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP16c!   '@2bc04
    IF NOT (L_BP174! > V_14cc!) THEN GOTO L_2bc46   '@2bc29
    GOTO L_2c0a3   '@2bc3e
L_2bc46:
    L_BP178! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@2bc46
    L_BP17c! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@2bc71
    CALL MIXT_082a_Maior(L_BP178!, L_BP17c!, L_BP180!)   '@2bc93
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP17c!   '@2bca8
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP178!   '@2bccb
    IF NOT (L_BP180! < V_14cc!) THEN GOTO L_2bd0d   '@2bcf0
    GOTO L_2c0a3   '@2bd05
L_2bd0d:
    L_BP184! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2bd0d
    L_BP188! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2bd39
    CALL MIXT_0877_Menor(L_BP184!, L_BP188!, L_BP18c!)   '@2bd5e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP188!   '@2bd73
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP184!   '@2bd99
    IF NOT (L_BP18c! > V_14d0!) THEN GOTO L_2bddc   '@2bdbf
    GOTO L_2c0a3   '@2bdd4
L_2bddc:
    L_BP190! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2bddc
    L_BP194! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@2be08
    CALL MIXT_082a_Maior(L_BP190!, L_BP194!, L_BP198!)   '@2be2d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP194!   '@2be42
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP190!   '@2be68
    IF NOT (L_BP198! < V_14c8!) THEN GOTO L_2beab   '@2be8e
    GOTO L_2c0a3   '@2bea3
L_2beab:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2befe   '@2beab
    GOTO L_2c0a3   '@2bef6
L_2befe:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2bf80   '@2befe
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@2bf4d
    GOTO L_2c052   '@2bf78
L_2bf80:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0))   '@2bf80
L_2c052:
    IF NOT (FX##(V_14d0!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_2c09e   '@2c052
    IF NOT (FX##(V_0f04!) > FX##(V_0efc#)) THEN GOTO L_2c09e   '@2c072
    V_0efc# = V_0f04!   '@2c08d
L_2c09e:
L_2c0a3:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2c0a8 DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2bb5a   '@2c0be
L_2c0c6:
    V_0f14! = 1.0   '@2c0c6 DS:26a0
L_2c0dc:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_2c648   '@2c0dd
    L_BP19c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2c101
    L_BP1a0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2c12c
    CALL MIXT_0877_Menor(L_BP19c!, L_BP1a0!, L_BP1a4!)   '@2c14e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP1a0!   '@2c163
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP19c!   '@2c186
    IF NOT (L_BP1a4! > V_14cc!) THEN GOTO L_2c1c8   '@2c1ab
    GOTO L_2c625   '@2c1c0
L_2c1c8:
    L_BP1a8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@2c1c8
    L_BP1ac! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@2c1f3
    CALL MIXT_082a_Maior(L_BP1a8!, L_BP1ac!, L_BP1b0!)   '@2c215
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP1ac!   '@2c22a
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP1a8!   '@2c24d
    IF NOT (L_BP1b0! < V_14cc!) THEN GOTO L_2c28f   '@2c272
    GOTO L_2c625   '@2c287
L_2c28f:
    L_BP1b4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2c28f
    L_BP1b8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2c2bb
    CALL MIXT_0877_Menor(L_BP1b4!, L_BP1b8!, L_BP1bc!)   '@2c2e0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP1b8!   '@2c2f5
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP1b4!   '@2c31b
    IF NOT (L_BP1bc! > V_14d0!) THEN GOTO L_2c35e   '@2c341
    GOTO L_2c625   '@2c356
L_2c35e:
    L_BP1c0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2c35e
    L_BP1c4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@2c38a
    CALL MIXT_082a_Maior(L_BP1c0!, L_BP1c4!, L_BP1c8!)   '@2c3af
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP1c4!   '@2c3c4
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP1c0!   '@2c3ea
    IF NOT (L_BP1c8! < V_14c8!) THEN GOTO L_2c42d   '@2c410
    GOTO L_2c625   '@2c425
L_2c42d:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_2c480   '@2c42d
    GOTO L_2c625   '@2c478
L_2c480:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_2c502   '@2c480
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@2c4cf
    GOTO L_2c5d4   '@2c4fa
L_2c502:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@2c502
L_2c5d4:
    IF NOT (FX##(V_14d0!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_2c620   '@2c5d4
    IF NOT (FX##(V_0f04!) > FX##(V_0efc#)) THEN GOTO L_2c620   '@2c5f4
    V_0efc# = V_0f04!   '@2c60f
L_2c620:
L_2c625:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2c62a DS:26a0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2c0dc   '@2c640
L_2c648:
    IF NOT (FX##(V_14c8!) < FX##(V_0efc#)) THEN GOTO L_2c674   '@2c648
    V_14c8! = V_0efc#   '@2c663
L_2c674:
    GOTO L_2c6ad   '@2c674
L_2c681:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2c681 DS:26a0,26f0
L_2c6ad:
    GOTO L_2c6ef   '@2c6ad
L_2c6b5:
    L_BP1cc! = FX##(V_14d0!) - V_14f6!   '@2c6b5
    CALL MIXT_082a_Maior(V_14e8!, L_BP1cc!, L_BP1d0!)   '@2c6cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP1d0!   '@2c6df
L_2c6ef:
    GOTO L_2e7ff   '@2c6ef
L_2c6f7:
    IF NOT (L_BP28$ = "*") THEN GOTO L_2c72d   '@2c6f7 DS:26fa
    V_0f18$ = "E"   '@2c709 DS:2e8a
    CALL S_1b2df   '@2c71b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_2e7ff   '@2c725
L_2c72d:
    IF NOT (CHR$(13) = L_BP28$) THEN GOTO L_2cba5   '@2c72d
    IF NOT (V_14e0! = V_14c8! AND V_14dc! = V_14c4!) THEN GOTO L_2c79a   '@2c745
    BEEP   '@2c783
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2c78d
L_2c79a:
    V_0f10! = FX##(A_1042!(0, 0)) + 1.0   '@2c79a DS:26a0
    A_1042!(RT_CINT%(FX##(V_0f10!)), 0) = V_14dc!   '@2c7bf
    A_1042!(RT_CINT%(FX##(V_0f10!)), 1) = V_14e0!   '@2c7e9
    A_1042!(RT_CINT%(FX##(V_0f10!)), 2) = V_14c4!   '@2c814
    A_1042!(RT_CINT%(FX##(V_0f10!)), 3) = V_14c8!   '@2c83c
    A_1042!(0, 0) = FX##(A_1042!(0, 0)) + 1.0   '@2c867 DS:26a0
    GOSUB L_2fe14   '@2c89b
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@2c8a8 DS:2e90
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@2c912 DS:2e90,2e94
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2c987 DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP1e!)), 0   '@2ca0d DS:26e0
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@2caa2 DS:26d8
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@2cb15 DS:26d8
    GOSUB L_2f1e1   '@2cb88
    GOTO L_2cbce   '@2cb95
L_2cba5:
    IF NOT (L_BP28$ <> "I") THEN GOTO L_2cbc9   '@2cba5 DS:2b88
    IF NOT (L_BP28$ = "i") THEN GOTO L_2cc5d   '@2cbb7 DS:2e98
L_2cbc9:
L_2cbce:
    GOSUB L_2f364   '@2cbd3
    V_14dc! = V_14c4!   '@2cbe0
    V_14e0! = V_14c8!   '@2cbf1
    LOCATE 24, 11   '@2cc02
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@2cc20 DS:2e44
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2cc4d
L_2cc5d:
    IF NOT (L_BP28$ <> "D") THEN GOTO L_2cc81   '@2cc5d DS:2e9e
    IF NOT (L_BP28$ = "d") THEN GOTO L_2e05e   '@2cc6f DS:2ea4
L_2cc81:
    RT_VIEWPRINT 23, 25   '@2cc81
    RT_CLS 2   '@2cc93
    RT_VIEWPRINT 1, 25   '@2cca1
    LOCATE 24, 1   '@2ccb3
    PRINT " <T>odas as linhas   <U>ltima linhas   <E>scolher a linha   <*R*>etorno";   '@2ccce DS:2eaa
    CALL MIXT_07f1_LimpaTeclado   '@2cce6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@2ccf0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d4$ = V_0f18$   '@2cd0c
    IF NOT (L_BP1d4$ <> "T") THEN GOTO L_2cd4a   '@2cd1f DS:2896
    IF NOT (L_BP1d4$ = "t") THEN GOTO L_2cd97   '@2cd37 DS:2944
L_2cd4a:
    REDIM A_1042!(-32768 TO -32768, -32768 TO -32768)   '@2cd4a
    REDIM A_1042!(0 TO V_0e44%, 0 TO 3)   '@2cd58
    GOSUB L_2fe14   '@2cd7a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28d66   '@2cd87
L_2cd97:
    IF NOT (L_BP1d4$ <> "U") THEN GOTO L_2cdbd   '@2cd97 DS:2ef6
    IF NOT (L_BP1d4$ = "u") THEN GOTO L_2d236   '@2cdaa DS:2efc
L_2cdbd:
    V_0f10! = A_1042!(0, 0)   '@2cdbd
    IF NOT (V_0f10! = 0.0) THEN GOTO L_2ce0f   '@2cddd DS:265c
    BEEP   '@2cdf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2ce02
L_2ce0f:
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@2ce0f DS:2e90
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@2ce79 DS:2e90,2e94
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2ceee DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@2cf74 DS:26e0
    A_1042!(0, 0) = FX##(A_1042!(0, 0)) - 1.0   '@2d00a DS:26f0
    GOSUB L_2fe14   '@2d03e
    GOSUB L_2efa1   '@2d04b
    GOSUB L_2f4f7   '@2d058
    IF NOT (L_BP20% = 1) THEN GOTO L_2d080   '@2d065
    GOSUB L_2f67a   '@2d073
L_2d080:
    GOSUB L_2fc90   '@2d080
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@2d08d DS:26d8
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@2d100 DS:26d8
    V_14c4! = A_1042!(RT_CINT%(FX##(V_0f10!)), 0)   '@2d173
    V_14c8! = A_1042!(RT_CINT%(FX##(V_0f10!)), 1)   '@2d19d
    GOSUB L_2f364   '@2d1c8
    GOSUB L_2f1e1   '@2d1d5
    V_14cc! = V_14c4!   '@2d1e2
    V_14d0! = V_14c8!   '@2d1f3
    V_14dc! = V_14c4!   '@2d204
    V_14e0! = V_14c8!   '@2d215
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2d226
L_2d236:
    IF NOT (L_BP1d4$ <> "E") THEN GOTO L_2d25c   '@2d236 DS:2e8a
    IF NOT (L_BP1d4$ = "e") THEN GOTO L_2e049   '@2d249 DS:2f02
L_2d25c:
    LOCATE 24, 1   '@2d25c
    PRINT " Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@2d277 DS:26d0,2f08
L_2d2a5:
    V_0f18$ = "NENHUM"   '@2d2aa DS:2f54
    FOR V_0f10! = A_1042!(0, 0) TO 1.0 STEP -1.0   '@2d2bc DS:26a0,26f0
    L_BP1d8! = A_1042!(RT_CINT%(FX##(V_0f10!)), 0)   '@2d2d8
    L_BP1dc! = A_1042!(RT_CINT%(FX##(V_0f10!)), 2)   '@2d303
    CALL MIXT_0877_Menor(L_BP1d8!, L_BP1dc!, L_BP1e0!)   '@2d325
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP1dc!   '@2d33a
    A_1042!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP1d8!   '@2d35d
    L_BP1e4! = A_1042!(RT_CINT%(FX##(V_0f10!)), 0)   '@2d382
    L_BP1e8! = A_1042!(RT_CINT%(FX##(V_0f10!)), 2)   '@2d3a7
    CALL MIXT_082a_Maior(L_BP1e4!, L_BP1e8!, L_BP1ec!)   '@2d3c9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP1e8!   '@2d3de
    A_1042!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP1e4!   '@2d401
    L_BP1f0! = A_1042!(RT_CINT%(FX##(V_0f10!)), 1)   '@2d426
    L_BP1f4! = A_1042!(RT_CINT%(FX##(V_0f10!)), 3)   '@2d44c
    CALL MIXT_0877_Menor(L_BP1f0!, L_BP1f4!, L_BP1f8!)   '@2d471
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP1f4!   '@2d486
    A_1042!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP1f0!   '@2d4ac
    L_BP1fc! = A_1042!(RT_CINT%(FX##(V_0f10!)), 1)   '@2d4d2
    L_BP200! = A_1042!(RT_CINT%(FX##(V_0f10!)), 3)   '@2d4f8
    CALL MIXT_082a_Maior(L_BP1fc!, L_BP200!, L_BP204!)   '@2d51d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP200!   '@2d532
    A_1042!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP1fc!   '@2d558
    IF NOT (L_BP204! <= V_14f0! AND (L_BP1f8! >= V_14e8! AND (L_BP1ec! <= V_14ec! AND L_BP1e0! >= V_14e4!))) THEN GOTO L_2df99   '@2d57e
L_2d5f2:
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2d5f2 DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@2d678 DS:26e0
    L_BP208! = RT_TIMER   '@2d70e
L_2d72a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP208! < 0.100000001490116119384765625## THEN GOTO L_2d72a   '@2d72a DS:2798
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2d74c DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP1e!)), 0   '@2d7d2 DS:26e0
    L_BP208! = RT_TIMER   '@2d867
L_2d882:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP208! < 0.100000001490116119384765625## THEN GOTO L_2d882   '@2d882 DS:2798
    V_0f18$ = RT_INKEY$   '@2d8a4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_2d5f2   '@2d8b8 DS:26d0
    L_BP20c$ = V_0f18$   '@2d8cf
    IF NOT (L_BP20c$ <> "S") THEN GOTO L_2d90d   '@2d8e2 DS:2752
    IF NOT (L_BP20c$ = "s") THEN GOTO L_2ded5   '@2d8fa DS:2f5e
L_2d90d:
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@2d90d DS:2e90
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@2d977 DS:2e90,2e94
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2d9ec DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_14be!)), 0   '@2da72 DS:26e0
    GOSUB L_2efa1   '@2db08
    L_BP210! = A_1042!(0, 0)   '@2db15
    FOR V_0f14! = FX##(V_0f10!) + 1.0 TO L_BP210!   '@2db36 DS:26a0
    FOR V_0f04! = 0.0 TO 3.0   '@2db42 DS:265c,26a0,2a44
    A_1042!(RT_CINT%(FX##(V_0f14!) - 1.0), RT_CINT%(FX##(V_0f04!))) = A_1042!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!)))   '@2db50 DS:26f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2dba8 DS:26a0,2a44
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2dbd4 DS:26a0
    IF NOT (V_0f10! > 1.0 AND A_1042!(0, 0) > V_0f10!) THEN GOTO L_2dc63   '@2dc00 DS:26a0
    V_0f10! = FX##(V_0f10!) + 1.0   '@2dc4d DS:26a0
L_2dc63:
    A_1042!(0, 0) = FX##(A_1042!(0, 0)) - 1.0   '@2dc63 DS:26f0
    GOSUB L_2fe14   '@2dc97
    GOSUB L_2f4f7   '@2dca4
    GOSUB L_2fc90   '@2dcb1
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@2dcbe DS:26d8
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@2dd31 DS:26d8
    L_BP214! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@2dda4
    L_BP218! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@2ddc5 DS:26d8
    L_BP21c$ = CHR$(27)   '@2dde7
    L_BP220$ = "CGA"   '@2ddfb DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP214!, L_BP218!, L_BP21c$, L_BP220$)   '@2de09
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2de22 libera strings locais (L_BP21c)
    ' @2de2c libera strings locais (L_BP220)
    L_BP224! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@2de36 DS:2e94
    L_BP228! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@2de5c DS:26d8
    L_BP22c$ = CHR$(26)   '@2de7e
    L_BP230$ = "CGA"   '@2de92 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP224!, L_BP228!, L_BP22c$, L_BP230$)   '@2dea0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2deb9 libera strings locais (L_BP22c)
    ' @2dec3 libera strings locais (L_BP230)
    GOTO L_2df94   '@2decd
L_2ded5:
    IF NOT (L_BP20c$ <> "F") THEN GOTO L_2defb   '@2ded5 DS:2c96
    IF NOT (L_BP20c$ = "f") THEN GOTO L_2df0b   '@2dee8 DS:2c9c
L_2defb:
    GOTO L_2dfc5   '@2defb
L_2df0b:
    IF NOT (L_BP20c$ <> "R") THEN GOTO L_2df31   '@2df0b DS:2f64
    IF NOT (L_BP20c$ = "r") THEN GOTO L_2df8f   '@2df1e DS:2f6a
L_2df31:
    L_BP234! = FX##(V_0f10!) + 2.0   '@2df31 DS:26d4
    L_BP238! = FX##(A_1042!(0, 0)) + 1.0   '@2df47 DS:26a0
    CALL MIXT_0877_Menor(L_BP234!, L_BP238!, L_BP23c!)   '@2df67
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BP23c!   '@2df7c
    GOTO L_2df94   '@2df87
L_2df8f:
L_2df94:
L_2df99:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2df99 DS:26a0,26f0
L_2dfc5:
    L_BP23e% = (V_0f10! = 0.0)   '@2dfc5 DS:265c
    IF NOT ((A_1042!(0, 0) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP23e%)) <> 0) THEN GOTO L_2e039   '@2dfef DS:265c,2f54
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2d2a5   '@2e031
L_2e039:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e039
L_2e049:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e049
L_2e05e:
    IF NOT (L_BP28$ <> "R") THEN GOTO L_2e082   '@2e05e DS:2f64
    IF NOT (L_BP28$ = "r") THEN GOTO L_2e09f   '@2e070 DS:2f6a
L_2e082:
    GOSUB L_2fc90   '@2e082
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2e08f
L_2e09f:
    IF NOT (L_BP28$ <> "Z") THEN GOTO L_2e0c3   '@2e09f DS:2f70
    IF NOT (L_BP28$ = "z") THEN GOTO L_2e210   '@2e0b1 DS:2f76
L_2e0c3:
L_2e0c8:
    RT_VIEWPRINT 23, 25   '@2e0cd
    RT_CLS 2   '@2e0df
    RT_VIEWPRINT 1, 25   '@2e0ed
    LOCATE 24, 1   '@2e0ff
    PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@2e11a DS:2f7c
    CALL MIXT_07f1_LimpaTeclado   '@2e128
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@2e132
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP242$ = V_0f18$   '@2e14e
    IF NOT (L_BP242$ <> "D") THEN GOTO L_2e18c   '@2e161 DS:2e9e
    IF NOT (L_BP242$ = "d") THEN GOTO L_2e1c5   '@2e179 DS:2ea4
L_2e18c:
    CALL S_4954b   '@2e18c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f18$ = "FIM") THEN GOTO L_2e1b5   '@2e196 DS:2fca
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2e0c8   '@2e1ad
L_2e1b5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28c83   '@2e1b5
L_2e1c5:
    IF NOT (L_BP242$ <> "T") THEN GOTO L_2e1eb   '@2e1c5 DS:2896
    IF NOT (L_BP242$ = "t") THEN GOTO L_2e1fb   '@2e1d8 DS:2944
L_2e1eb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28bb4   '@2e1eb
L_2e1fb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e1fb
L_2e210:
    IF NOT (L_BP28$ <> "C") THEN GOTO L_2e234   '@2e210 DS:2810
    IF NOT (L_BP28$ = "c") THEN GOTO L_2e4ce   '@2e222 DS:2816
L_2e234:
    IF NOT (V_14c2% = 0) THEN GOTO L_2e25e   '@2e234
    V_14c2% = 1   '@2e243
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e24e
L_2e25e:
    RT_VIEWPRINT 23, 25   '@2e25e
    RT_CLS 2   '@2e270
    RT_VIEWPRINT 1, 25   '@2e27e
    LOCATE 23, 1   '@2e290
    PRINT USING " Movimente o cursor ate a Coordenada *###.###,###.###* "; RT_PU#(V_14c4!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 1); RT_PU#(V_14c8!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 2);   '@2e2ab DS:2fd2
    CALL MIXT_07f1_LimpaTeclado   '@2e2d8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@2e2e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP244% = (LEN(V_0f18$) = 0)   '@2e2f4
    IF NOT ((LEN(V_0f1c$) = 0 AND L_BP244%) <> 0) THEN GOTO L_2e332   '@2e312
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e32a
L_2e332:
    L_BP246% = (LEN(V_0f18$) > 0)   '@2e332
    L_BP248% = FX##(VAL(V_0f18$)) >= FX##(V_14e4!) AND L_BP246%   '@2e355
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_14ec!) AND L_BP248%) <> 0) THEN GOTO L_2e3bb   '@2e37f
    V_14c4! = VAL(V_0f18$)   '@2e3a1
L_2e3bb:
    L_BP24a% = (LEN(V_0f1c$) > 0)   '@2e3bb
    L_BP24c% = FX##(VAL(V_0f1c$)) >= FX##(V_14e8!) AND L_BP24a%   '@2e3de
    IF NOT ((FX##(VAL(V_0f1c$)) <= FX##(V_14f0!) AND L_BP24c%) <> 0) THEN GOTO L_2e444   '@2e408
    V_14c8! = VAL(V_0f1c$)   '@2e42a
L_2e444:
    GOSUB L_2f1e1   '@2e444
    LOCATE 23, 40   '@2e451
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14c4!, "(###.##,###.##)", 1); RT_PU#(V_14c8!, "(###.##,###.##)", 2)   '@2e46f DS:2e44
    V_14cc! = V_14c4!   '@2e497
    V_14d0! = V_14c8!   '@2e4a8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e4b9
L_2e4ce:
    IF NOT (L_BP28$ <> "E") THEN GOTO L_2e4f2   '@2e4ce DS:2e8a
    IF NOT (L_BP28$ = "e") THEN GOTO L_2e51c   '@2e4e0 DS:2f02
L_2e4f2:
    IF NOT (V_14c2% = 1) THEN GOTO L_2e514   '@2e4f2
    V_14c2% = 0   '@2e501
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e50c
L_2e514:
    GOTO L_2e7ff   '@2e514
L_2e51c:
    IF NOT (L_BP28$ = "+") THEN GOTO L_2e55b   '@2e51c DS:300e
    IF NOT (V_14c2% = 1) THEN GOTO L_2e553   '@2e52e
    V_14f6! = FX##(V_14f6!) * 2.0   '@2e53d DS:26d4
L_2e553:
    GOTO L_2e7ff   '@2e553
L_2e55b:
    IF NOT (L_BP28$ = "-") THEN GOTO L_2e59a   '@2e55b DS:3014
    IF NOT (V_14c2% = 1) THEN GOTO L_2e592   '@2e56d
    V_14f6! = FX##(V_14f6!) / 2.0   '@2e57c DS:26d4
L_2e592:
    GOTO L_2e7ff   '@2e592
L_2e59a:
    IF NOT (L_BP28$ <> "P") THEN GOTO L_2e5be   '@2e59a DS:2a88
    IF NOT (L_BP28$ = "p") THEN GOTO L_2e705   '@2e5ac DS:2a8e
L_2e5be:
    IF NOT (V_14c2% = 0) THEN GOTO L_2e5d5   '@2e5be
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2e5cd
L_2e5d5:
    RT_VIEWPRINT 23, 25   '@2e5d5
    RT_CLS 2   '@2e5e7
    RT_VIEWPRINT 1, 25   '@2e5f5
    LOCATE 23, 1   '@2e607
    PRINT USING " Passo de movimentacao *###.####* "; RT_PU#(V_14f6!, " Passo de movimentacao *###.####* ", 1);   '@2e622 DS:301a
    CALL MIXT_07f1_LimpaTeclado   '@2e642
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@2e64c DS:26d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_2e6f5   '@2e666
    L_BP24e% = (VAL(V_0f18$) > 0.0#)   '@2e67b DS:28fc,3040
    IF NOT ((FX##(VAL(V_0f18$)) < 50.0 * FX##(V_14f6!) AND L_BP24e%) <> 0) THEN GOTO L_2e6f0   '@2e6b4
    V_14f6! = VAL(V_0f18$)   '@2e6d6
L_2e6f0:
L_2e6f5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e6f5
L_2e705:
    IF NOT (L_BP28$ <> "A") THEN GOTO L_2e729   '@2e705 DS:2aec
    IF NOT (L_BP28$ = "a") THEN GOTO L_2e7a9   '@2e717 DS:2af2
L_2e729:
    IF NOT (L_BP20% = 0) THEN GOTO L_2e756   '@2e729
    L_BP20% = 1   '@2e737
    GOSUB L_2f67a   '@2e741
    GOTO L_2e799   '@2e74e
L_2e756:
    L_BP20% = 0   '@2e756
    GOSUB L_2f67a   '@2e760
    GOSUB L_2efa1   '@2e76d
    GOSUB L_2f4f7   '@2e77a
    GOSUB L_2fc90   '@2e787
L_2e799:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2917f   '@2e799
L_2e7a9:
    IF NOT (L_BP28$ <> "F") THEN GOTO L_2e7cd   '@2e7a9 DS:2c96
    IF NOT (L_BP28$ = "f") THEN GOTO L_2e7f2   '@2e7bb DS:2c9c
L_2e7cd:
    RT_SCREEN 0   '@2e7cd
    GOTO L_2fe5f   '@2e7e2
L_2e7f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2e7f2
L_2e7ff:
    GOSUB L_2f1e1   '@2e7ff
    LOCATE 23, 60   '@2e80c
    V_0f18$ = ""   '@2e82a DS:26d0
    IF NOT (V_14c2% = 0) THEN GOTO L_2ea35   '@2e83c
    L_BP252! = A_0f8a!(0, 1)   '@2e84b
    FOR V_0f10! = 1.0 TO L_BP252!   '@2e86f DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) = V_14c4!) THEN GOTO L_2e94d   '@2e876
    V_0f18$ = CHR$(RT_CINT%(FX##(V_0f10!) + 26& * ((RT_CLNG&(FX##(V_0f10!)) \ 26&) * (V_0f10! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f10!) - 1.0) \ 26&), ("'"))   '@2e8ab DS:26e4,26e8,26f0,26f4
    GOTO L_2e979   '@2e945
L_2e94d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2e94d DS:26a0
L_2e979:
    L_BP256! = A_0f8a!(0, 0)   '@2e979
    FOR V_0f10! = 1.0 TO L_BP256!   '@2e99a DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) = V_14c8!) THEN GOTO L_2ea04   '@2e9a2
    V_0f18$ = V_0f18$ + STR$(V_0f10!)   '@2e9d6
    GOTO L_2ea30   '@2e9fc
L_2ea04:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2ea04 DS:26a0
L_2ea30:
L_2ea35:
    PRINT USING "(###.##,###.##) \   \ "; RT_PU#(V_14c4!, "(###.##,###.##) \   \ ", 1); RT_PU#(V_14c8!, "(###.##,###.##) \   \ ", 2); V_0f18$   '@2ea35 DS:3044
    V_14cc! = V_14c4!   '@2ea66
    V_14d0! = V_14c8!   '@2ea77
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_293c7   '@2ea88
    ' ---- F_2ea90 @0x2ea90  (02ea90_F_2ea90.lift.txt; evidence_id (assembly): ev_1dc3b3e6dee797b1a3b66bf41aa70a74ab1e17652b25288d0c9c0c5ec10299bd)
L_2ea95:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    V_0f18$ = ""   '@2ea9a DS:26d0
    V_0f1c$ = ""   '@2eaac DS:26d0
    L_BP258% = (V_0dcc_placa$ = "EGA")   '@2eabe DS:267c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP258%) <> 0) THEN GOTO L_2eb10   '@2eae4 DS:2684
    COLOR 10   '@2eafa
L_2eb10:
    L_BP25c! = A_0f8a!(0, 0)   '@2eb10
    FOR V_0f14! = 1.0 TO L_BP25c!   '@2eb31 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_2ef0d   '@2eb38
    L_BP260! = 2.0   '@2ebaa DS:26d4
    L_BP264! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@2ebbc DS:26d8
    L_BP268$ = LTRIM$(STR$(V_0f14!))   '@2ebf7
    L_BP26c$ = "CGA"   '@2ec15 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP260!, L_BP264!, L_BP268$, L_BP26c$)   '@2ec23
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2ec3c libera strings locais (L_BP268)
    ' @2ec46 libera strings locais (L_BP26c)
    L_BP270! = A_0f8a!(0, 1)   '@2ec50
    FOR V_0f04! = 1.0 TO L_BP270!   '@2ec74 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_2eeca   '@2ec7c
    IF NOT (V_0f18$ = "") THEN GOTO L_2ee35   '@2ecf0 DS:26d0
    L_BP274! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@2ed07 DS:26dc
    L_BP278! = 165.0   '@2ed47 DS:26e0
    L_BP27c$ = CHR$(RT_CINT%(FX##(V_0f04!) + 26& * ((RT_CLNG&(FX##(V_0f04!)) \ 26&) * (V_0f04! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f04!) - 1.0) \ 26&), ("'"))   '@2ed53 DS:26e4,26e8,26f0,26f4
    L_BP280$ = "CGA"   '@2ede8 DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP274!, L_BP278!, L_BP27c$, L_BP280$)   '@2edf6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2ee0f libera strings locais (L_BP27c)
    ' @2ee19 libera strings locais (L_BP280)
    V_0f1c$ = "*"   '@2ee23 DS:26fa
L_2ee35:
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@2ee35 DS:26e0
L_2eeca:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2eeca DS:26a0
    V_0f18$ = V_0f1c$   '@2eef6
L_2ef0d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2ef0d DS:26a0
    L_BP282% = (V_0dcc_placa$ = "EGA")   '@2ef39 DS:267c
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP282%) <> 0) THEN GOTO L_2ef92   '@2ef5f DS:2684
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@2ef75
L_2ef92:
    RETURN   '@2ef92
L_2efa1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    L_BP286! = A_0f8a!(0, 0)   '@2efa6
    FOR V_0f14! = 1.0 TO L_BP286!   '@2efc7 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_2f1a6   '@2efce
    L_BP28a! = A_0f8a!(0, 1)   '@2f040
    FOR V_0f04! = 1.0 TO L_BP28a!   '@2f064 DS:26a0
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_2f175   '@2f06c
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@2f0e0 DS:26e0
L_2f175:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2f175 DS:26a0
L_2f1a6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2f1a6 DS:26a0
    RETURN   '@2f1d2
L_2f1e1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    RT_GPONTO RT_SNG!((FX##(V_14cc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14d0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@2f1e6 DS:2e90
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@2f250 DS:26d8
    L_BP28e! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@2f2c3
    L_BP292! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@2f2e4 DS:26d8
    L_BP296$ = CHR$(27)   '@2f306
    L_BP29a$ = "CGA"   '@2f31a DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP28e!, L_BP292!, L_BP296$, L_BP29a$)   '@2f328
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2f341 libera strings locais (L_BP296)
    ' @2f34b libera strings locais (L_BP29a)
    RETURN   '@2f355
L_2f364:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@2f369 DS:2e90,2e94
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@2f3de DS:26d8
    L_BP29e! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@2f451 DS:2e94
    L_BP2a2! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@2f477 DS:26d8
    L_BP2a6$ = CHR$(26)   '@2f499
    L_BP2aa$ = "CGA"   '@2f4ad DS:2668
    CALL MIXT_08c4_TextoGrafico(L_BP29e!, L_BP2a2!, L_BP2a6$, L_BP2aa$)   '@2f4bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @2f4d4 libera strings locais (L_BP2a6)
    ' @2f4de libera strings locais (L_BP2aa)
    RETURN   '@2f4e8
L_2f4f7:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    L_BP2ae! = A_0fb8!(0, 0)   '@2f4fc
    FOR L_BP2b2! = 1.0 TO L_BP2ae!   '@2f51d DS:26a0
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP2b2!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP2b2!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2f524 DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP2b2!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP2b2!)), 3)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(L_BP0e!)), 17476   '@2f5aa DS:26e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2b2!   '@2f63f DS:26a0
    RETURN   '@2f66b
L_2f67a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    L_BP2b6! = A_0fe6!(0, 0)   '@2f67f
    FOR L_BP2b2! = 1.0 TO L_BP2b6!   '@2f6a0 DS:26a0
    L_BP2ba! = (FX##(A_0fe6!(RT_CINT%(FX##(L_BP2b2!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@2f6a8
    L_BP2be! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(L_BP2b2!)), 1)) - V_14e8!) * V_14ba!   '@2f6e1 DS:26e0
    L_BP2c2! = (FX##(A_0fe6!(RT_CINT%(FX##(L_BP2b2!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@2f723
    L_BP2c6! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(L_BP2b2!)), 3)) - V_14e8!) * V_14ba!   '@2f75a DS:26e0
    IF NOT (L_BP20% = 1) THEN GOTO L_2f7c2   '@2f79c
    V_0ee8! = L_BP16!   '@2f7aa
    GOTO L_2f7d3   '@2f7ba
L_2f7c2:
    V_0ee8! = V_14be!   '@2f7c2
L_2f7d3:
    GOSUB L_2f81b   '@2f7d3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2b2!   '@2f7e0 DS:26a0
    RETURN   '@2f80c
L_2f81b:   ' sub-rotina (alvo de GOSUB)
    CALL MIXT_0877_Menor(L_BP2ba!, L_BP2c2!, L_BP2ca!)   '@2f820
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2ba!, L_BP2c2!, L_BP2ce!)   '@2f839
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP2be!, L_BP2c6!, L_BP2d2!)   '@2f84d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2be!, L_BP2c6!, L_BP2d6!)   '@2f861
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP2d6! < 0.0 OR (L_BP2d2! > 175.0 OR (L_BP2ce! < 0.0 OR L_BP2ca! > 639.0))) THEN GOTO L_2f8ee   '@2f876 DS:265c,26b0,305e
    RETURN   '@2f8e4
L_2f8ee:
    IF NOT (L_BP2ba! <> L_BP2c2!) THEN GOTO L_2fa45   '@2f8ee
    L_BP2da! = ATN(ABS((FX##(L_BP2c6!) - L_BP2be!) / (FX##(L_BP2c2!) - L_BP2ba!)))   '@2f909
    IF NOT (L_BP2c6! <= L_BP2be! AND L_BP2c2! < L_BP2ba!) THEN GOTO L_2f98d   '@2f936
    L_BP2da! = FX##(V_0e68_pi#) - L_BP2da!   '@2f974
L_2f98d:
    IF NOT (L_BP2c6! > L_BP2be! AND L_BP2c2! < L_BP2ba!) THEN GOTO L_2f9e1   '@2f98d
    L_BP2da! = FX##(L_BP2da!) + V_0e68_pi#   '@2f9cb
L_2f9e1:
    IF NOT (L_BP2c6! > L_BP2be! AND L_BP2c2! > L_BP2ba!) THEN GOTO L_2fa3d   '@2f9e1
    L_BP2da! = 2.0# * FX##(V_0e68_pi#) - L_BP2da!   '@2fa1f DS:2758
L_2fa3d:
    GOTO L_2fa96   '@2fa3d
L_2fa45:
    L_BP2da! = FX##(V_0e68_pi#) / 2.0#   '@2fa45 DS:2758
    IF NOT (L_BP2c6! > L_BP2be!) THEN GOTO L_2fa91   '@2fa5b
    L_BP2da! = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@2fa76 DS:2758,3062
L_2fa91:
L_2fa96:
    L_BP2de! = RT_SIN##(FX##(L_BP2da!)) * 3.0   '@2fa96 DS:2a44
    L_BP2e2! = RT_COS##(FX##(L_BP2da!)) * 1.25   '@2fab3 DS:306a
    L_BP2e6! = RT_SQR##(RT_POT##((FX##(L_BP2c6!) - L_BP2be!), (2.0)) + RT_POT##((FX##(L_BP2c2!) - L_BP2ba!), (2.0)))   '@2fad0 DS:26d4
    L_BP2ea! = 6.0 - ABS(RT_SIN##(FX##(L_BP2da!))) * 4.0   '@2fb0e DS:2664,2790
    L_BP2ee! = L_BP2e6!   '@2fb36
    L_BP2f2! = L_BP2ea!   '@2fb48
    L_BP2f6! = 1.0   '@2fb54 DS:26a0
    GOTO L_2fc36_v   '@2fb54
L_2fb5c:
    RT_PSET RT_SNG!(RT_COS##(FX##(L_BP2da!)) * L_BP2f6! - L_BP2de! + L_BP2ba!), RT_SNG!(L_BP2be! - RT_SIN##(FX##(L_BP2da!)) * L_BP2f6! - L_BP2e2!), 0, 0   '@2fb5c
    RT_LINE 0, 0, RT_SNG!(RT_COS##(FX##(L_BP2da!)) * L_BP2f6! + L_BP2ba! + L_BP2de!), RT_SNG!(L_BP2be! - RT_SIN##(FX##(L_BP2da!)) * L_BP2f6! + L_BP2e2!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@2fbb8
L_2fc35:
    L_BP2f6! = FX##(L_BP2f6!) + L_BP2f2!   '@2fc36
L_2fc36_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP2f2! < 0.0) THEN GOTO L_2fc6b   '@2fc3d DS:265c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP2f6! < L_BP2ee!) THEN GOTO L_2fb5c   '@2fc53
    GOTO L_2fc81   '@2fc68
L_2fc6b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP2f6! > L_BP2ee!) THEN GOTO L_2fb5c   '@2fc6c
L_2fc81:
    RETURN   '@2fc81
L_2fc90:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    L_BP2fa! = A_1042!(0, 0)   '@2fc95
    FOR L_BP2b2! = 1.0 TO L_BP2fa!   '@2fcb6 DS:26a0
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(L_BP2b2!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(L_BP2b2!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@2fcbe DS:26e0
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(L_BP2b2!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(L_BP2b2!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP1e!)), 0   '@2fd44 DS:26e0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2b2!   '@2fdd9 DS:26a0
    RETURN   '@2fe05
L_2fe14:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0288d3_FUN_2000_88d3
    V_0e3c% = 0   '@2fe19
    V_120e% = 0   '@2fe24
    V_126c% = 0   '@2fe2f
    V_12f8% = 0   '@2fe3a
    V_12fa% = 0   '@2fe45
    RETURN   '@2fe50
L_2fe5f:   ' entrada vinda de 0288d3_FUN_2000_88d3
    ' @2fe5f libera strings locais (L_BP242)
    ' @2fe69 libera strings locais (L_BP20c)
    ' @2fe73 libera strings locais (L_BP1d4)
    ' @2fe7d libera strings locais (L_BP28)
    ' @2fe86 libera strings locais (L_BP24)
    ' END SUB   '@2fe8f
END SUB

SUB S_30137   ' entrada de SUB/FUNCTION (B$ENRA, locais 582 bytes) (0x30137)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e$
    DIM L_BP22$
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
    ' ---- FUN_3000_0137 @0x30137  (030137_FUN_3000_0137.lift.txt; evidence_id (assembly): ev_fd4c3051b43378a84375a4e553b74297ab8ec156eea56a650a419b2dc9765f1c)
    IF NOT (V_0e3a% = 0) THEN GOTO L_3015b   '@30144
    GOTO L_36e62   '@30153
L_3015b:
    REDIM A_14fa%(-32768 TO -32768)   '@3015b
    REDIM A_14fa%(0 TO 480)   '@30169
    IF NOT (V_0e3e% = 0) THEN GOTO L_30206   '@30186
    REDIM A_1128$(-32768 TO -32768)   '@30195
    REDIM A_1156!(-32768 TO -32768, -32768 TO -32768)   '@301a3
    REDIM A_1128$(0 TO V_0e4c%)   '@301ac
    REDIM A_1156!(0 TO V_0e4c%, 0 TO 3)   '@301c9
    V_0e3e% = 1   '@301eb
    V_0e40% = 0   '@301f6
L_30206:
    L_BP1e$ = V_0dcc_placa$   '@30206
    IF NOT (L_BP1e$ = "HER") THEN GOTO L_3029e   '@30218 DS:3070
    RT_SCREEN 3   '@3022f
    L_BP12! = 7.0   '@30245 DS:3078
    L_BP0e! = 7.0   '@30255 DS:3078
    L_BP16! = 7.0   '@30265 DS:3078
    L_BP1a! = 7.0   '@30275 DS:3078
    V_14be! = 0.0   '@30285 DS:307c
    GOTO L_303d7   '@30296
L_3029e:
    IF NOT (L_BP1e$ <> "CGA") THEN GOTO L_302c2   '@3029e DS:3080
    IF NOT (L_BP1e$ = "MCG") THEN GOTO L_3032e   '@302b0 DS:3088
L_302c2:
    RT_SCREEN 2   '@302c2
    L_BP12! = 15.0   '@302d5 DS:3090
    L_BP0e! = 15.0   '@302e5 DS:3090
    L_BP16! = 15.0   '@302f5 DS:3090
    L_BP1a! = 15.0   '@30305 DS:3090
    V_14be! = 0.0   '@30315 DS:307c
    GOTO L_303d7   '@30326
L_3032e:
    IF NOT (L_BP1e$ <> "EGA") THEN GOTO L_30352   '@3032e DS:3094
    IF NOT (L_BP1e$ = "VGA") THEN GOTO L_303d7   '@30340 DS:309c
L_30352:
    RT_SCREEN 9   '@30352
    COLOR , 1   '@30368
    L_BP12! = 9.0   '@3037e DS:30a4
    L_BP0e! = 14.0   '@3038e DS:30a8
    L_BP16! = 16.0   '@3039e DS:30ac
    L_BP1a! = 12.0   '@303ae DS:30b0
    V_14be! = 1.0   '@303be DS:30b4
    GOTO L_303d7   '@303cf
L_303d7:
    V_14c2% = 0   '@303d7
    IF NOT (V_14f4% = 1) THEN GOTO L_303f9   '@303e2
    GOTO L_304de   '@303f1
L_303f9:
    V_14f6! = 2.0   '@303f9 DS:30b8
L_3040f:
    V_14e4! = A_0f8a!(1, 1)   '@30414
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@30435
    V_14e8! = A_0f8a!(1, 0)   '@30472
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@30495
    V_14f4% = 1   '@304ce
L_304de:
    V_14cc! = V_14e4!   '@304e3
    V_14d0! = V_14e8!   '@304f4
    V_14c4! = V_14e4!   '@30505
    V_14c8! = V_14e8!   '@30516
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@30527 DS:30bc
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@30545 DS:30c0
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_305a1   '@30563 DS:30c4
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@30583 DS:30c4
    GOTO L_305bc   '@30599
L_305a1:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@305a1 DS:30c4
L_305bc:
L_305c1:
    RT_CLS -1   '@305c6
    RT_WINDOW 1, (0), (0), (639), (199)   '@305d4 DS:307c,307e,30c8,30ca,30cc,30ce (B$WIND decodificado)
    V_14d4! = 45.0   '@30602 DS:30d0
    V_14d8! = 10.0   '@30613 DS:30d4
    GOSUB L_3545d   '@30624
    GOSUB L_35ebf   '@30631
    GOSUB L_36042   '@3063e
    IF NOT (A_1156!(0, 0) > 0.0) THEN GOTO L_30687   '@3064b DS:307c
    GOSUB L_361c6   '@30675
L_30687:
    IF NOT (V_1528$ = "S") THEN GOTO L_306a6   '@30687 DS:30d8
    GOTO L_36e62   '@3069e
L_306a6:
    V_14dc! = V_14c4!   '@306a6
    V_14e0! = V_14c8!   '@306b7
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@306c8 DS:30de
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@3073b DS:30de
    GOSUB L_35ba9   '@307ae
    GOSUB L_35d2c   '@307bb
L_307cd:
    RT_VIEWPRINT 1, 25   '@307d2
    LOCATE 23, 1   '@307e4
    PRINT " <"; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " *> Movimenta";   '@307ff DS:30e2,30e8
    IF NOT (V_14c2% = 0) THEN GOTO L_308e4   '@30852
    PRINT " por Eixo"; RT_TAB$(79); ""; ""   '@30861 DS:30fa,3108
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <C>oordenada  <F>im"; RT_TAB$(79); ""; ""   '@3088a DS:3108,310c
    PRINT ""; RT_TAB$(79); ""; "";   '@308b3 DS:3108
    GOTO L_30964   '@308dc
L_308e4:
    PRINT " por Coordenada"; RT_TAB$(79); ""; ""   '@308e4 DS:3108,315e
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <E>ixo        <F>im"; RT_TAB$(79); ""; ""   '@3090d DS:3108,3172
    PRINT "                      <+ -> <P>asso do cursor      <C>oordenada absoluta  "; RT_TAB$(79); ""; "";   '@30936 DS:3108,31c4
L_30964:
    LOCATE 24, 11   '@30964
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@30982 DS:3212
    LOCATE 22, 1   '@309af
    PRINT RT_STRINGC$((32), (95)); "  P I L A R E S  "; RT_STRINGC$((31), (95));   '@309ca DS:3226
L_30a03:
    V_0f18$ = ""   '@30a08 DS:3108
L_30a20:
    V_0f18$ = RT_INKEY$   '@30a20
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_30a20   '@30a34 DS:3108
    L_BP22$ = V_0f18$   '@30a48
    IF NOT (L_BP22$ <> "4") THEN GOTO L_30a98   '@30a5a DS:323c
    IF NOT (CHR$(0) + CHR$(75) = L_BP22$) THEN GOTO L_31179   '@30a71
L_30a98:
    IF NOT (V_14c2% = 0) THEN GOTO L_3113b   '@30a98
    FOR V_0f10! = A_0f8a!(0, 1) TO 1.0 STEP -1.0   '@30aa7 DS:30b4,3242
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) < V_14cc!) THEN GOTO L_31107   '@30ac6
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) >= V_14e4!) THEN GOTO L_30b5b   '@30afb
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@30b30
L_30b5b:
    V_0f14! = 1.0   '@30b5b DS:30b4
    V_0ef4# = V_14c4!   '@30b6c
L_30b82:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_310ce   '@30b83
    L_BP26! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@30ba7
    L_BP2a! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@30bd2
    CALL MIXT_0877_Menor(L_BP26!, L_BP2a!, L_BP2e!)   '@30bf6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP2a!   '@30c08
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP26!   '@30c2d
    IF NOT (L_BP2e! > V_14d0!) THEN GOTO L_30c6e   '@30c52
    GOTO L_310aa   '@30c66
L_30c6e:
    L_BP32! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@30c6e
    L_BP36! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@30c99
    CALL MIXT_082a_Maior(L_BP32!, L_BP36!, L_BP3a!)   '@30cbd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP36!   '@30ccf
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP32!   '@30cf4
    IF NOT (L_BP3a! < V_14d0!) THEN GOTO L_30d35   '@30d19
    GOTO L_310aa   '@30d2d
L_30d35:
    L_BP3e! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@30d35
    L_BP42! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@30d5f
    CALL MIXT_0877_Menor(L_BP3e!, L_BP42!, L_BP46!)   '@30d80
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP42!   '@30d92
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP3e!   '@30db4
    IF NOT (L_BP46! > V_14cc!) THEN GOTO L_30df4   '@30dd8
    GOTO L_310aa   '@30dec
L_30df4:
    L_BP4a! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@30df4
    L_BP4e! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@30e1e
    CALL MIXT_082a_Maior(L_BP4a!, L_BP4e!, L_BP52!)   '@30e3f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP4e!   '@30e51
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP4a!   '@30e73
    IF NOT (L_BP52! < V_14c4!) THEN GOTO L_30eb3   '@30e97
    GOTO L_310aa   '@30eab
L_30eb3:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_30f0a   '@30eb3
    GOTO L_310aa   '@30f02
L_30f0a:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_30f87   '@30f0a
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@30f55
    GOTO L_31059   '@30f7f
L_30f87:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1))   '@30f87
L_31059:
    IF NOT (FX##(V_14cc!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_310a5   '@31059
    IF NOT (FX##(V_0f04!) > FX##(V_0ef4#)) THEN GOTO L_310a5   '@31079
    V_0ef4# = V_0f04!   '@31094
L_310a5:
L_310aa:
    V_0f14! = FX##(V_0f14!) + 1.0   '@310af DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30b82   '@310c5
L_310ce:
    IF NOT (FX##(V_14c4!) < FX##(V_0ef4#)) THEN GOTO L_310fa   '@310ce
    V_14c4! = V_0ef4#   '@310e9
L_310fa:
    GOTO L_31133   '@310fa
L_31107:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@31107 DS:30b4,3242
L_31133:
    GOTO L_31171   '@31133
L_3113b:
    L_BP56! = FX##(V_14cc!) - V_14f6!   '@3113b
    CALL MIXT_082a_Maior(V_14e4!, L_BP56!, L_BP5a!)   '@31150
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP5a!   '@31162
L_31171:
    GOTO L_343eb   '@31171
L_31179:
    IF NOT (L_BP22$ <> "6") THEN GOTO L_311b2   '@31179 DS:3246
    IF NOT (CHR$(0) + CHR$(77) = L_BP22$) THEN GOTO L_318ac   '@3118b
L_311b2:
    IF NOT (V_14c2% = 0) THEN GOTO L_3186a   '@311b2
    L_BP5e! = A_0f8a!(0, 1)   '@311c1
    FOR V_0f10! = 1.0 TO L_BP5e!   '@311e4 DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) > V_14cc!) THEN GOTO L_31837   '@311ec
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) <= V_14ec!) THEN GOTO L_31281   '@31221
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@31256
L_31281:
    V_0f14! = 1.0   '@31281 DS:30b4
    V_0ef4# = V_14c4!   '@31292
L_312a8:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_317fe   '@312a9
    L_BP62! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@312cd
    L_BP66! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@312f8
    CALL MIXT_0877_Menor(L_BP62!, L_BP66!, L_BP6a!)   '@3131c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP66!   '@3132e
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP62!   '@31353
    IF NOT (L_BP6a! > V_14d0!) THEN GOTO L_31394   '@31378
    GOTO L_317da   '@3138c
L_31394:
    L_BP6e! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@31394
    L_BP72! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@313bf
    CALL MIXT_082a_Maior(L_BP6e!, L_BP72!, L_BP76!)   '@313e3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP72!   '@313f5
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP6e!   '@3141a
    IF NOT (L_BP76! < V_14d0!) THEN GOTO L_3145b   '@3143f
    GOTO L_317da   '@31453
L_3145b:
    L_BP7a! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@3145b
    L_BP7e! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@31485
    CALL MIXT_0877_Menor(L_BP7a!, L_BP7e!, L_BP82!)   '@314a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP7e!   '@314b9
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP7a!   '@314db
    IF NOT (L_BP82! > V_14c4!) THEN GOTO L_3151c   '@314ff
    GOTO L_317da   '@31514
L_3151c:
    L_BP86! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@3151c
    L_BP8a! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@31547
    CALL MIXT_082a_Maior(L_BP86!, L_BP8a!, L_BP8e!)   '@31569
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP8a!   '@3157e
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP86!   '@315a1
    IF NOT (L_BP8e! < V_14cc!) THEN GOTO L_315e3   '@315c6
    GOTO L_317da   '@315db
L_315e3:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_3163a   '@315e3
    GOTO L_317da   '@31632
L_3163a:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_316b7   '@3163a
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@31685
    GOTO L_31789   '@316af
L_316b7:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1))   '@316b7
L_31789:
    IF NOT (FX##(V_14cc!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_317d5   '@31789
    IF NOT (FX##(V_0f04!) < FX##(V_0ef4#)) THEN GOTO L_317d5   '@317a9
    V_0ef4# = V_0f04!   '@317c4
L_317d5:
L_317da:
    V_0f14! = FX##(V_0f14!) + 1.0   '@317df DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_312a8   '@317f5
L_317fe:
    IF NOT (FX##(V_14c4!) > FX##(V_0ef4#)) THEN GOTO L_3182a   '@317fe
    V_14c4! = V_0ef4#   '@31819
L_3182a:
    GOTO L_31862   '@3182a
L_31837:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@31837 DS:30b4
L_31862:
    GOTO L_318a4   '@31862
L_3186a:
    L_BP92! = FX##(V_14cc!) + V_14f6!   '@3186a
    CALL MIXT_0877_Menor(V_14ec!, L_BP92!, L_BP96!)   '@31880
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP96!   '@31894
L_318a4:
    GOTO L_343eb   '@318a4
L_318ac:
    IF NOT (L_BP22$ <> "8") THEN GOTO L_318e5   '@318ac DS:324c
    IF NOT (CHR$(0) + CHR$(72) = L_BP22$) THEN GOTO L_31ff1   '@318be
L_318e5:
    IF NOT (V_14c2% = 0) THEN GOTO L_31faf   '@318e5
    L_BP9a! = A_0f8a!(0, 0)   '@318f4
    FOR V_0f10! = 1.0 TO L_BP9a!   '@31915 DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) > V_14d0!) THEN GOTO L_31f7b   '@3191c
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) <= V_14f0!) THEN GOTO L_319ae   '@31950
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@31984
L_319ae:
    V_0f14! = 1.0   '@319ae DS:30b4
    V_0efc# = V_14c8!   '@319bf
L_319d6:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_31f42   '@319d7
    L_BP9e! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@319fb
    L_BPa2! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@31a26
    CALL MIXT_0877_Menor(L_BP9e!, L_BPa2!, L_BPa6!)   '@31a48
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPa2!   '@31a5d
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP9e!   '@31a80
    IF NOT (L_BPa6! > V_14cc!) THEN GOTO L_31ac2   '@31aa5
    GOTO L_31f1f   '@31aba
L_31ac2:
    L_BPaa! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@31ac2
    L_BPae! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@31aed
    CALL MIXT_082a_Maior(L_BPaa!, L_BPae!, L_BPb2!)   '@31b0f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPae!   '@31b24
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPaa!   '@31b47
    IF NOT (L_BPb2! < V_14cc!) THEN GOTO L_31b89   '@31b6c
    GOTO L_31f1f   '@31b81
L_31b89:
    L_BPb6! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@31b89
    L_BPba! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@31bb5
    CALL MIXT_0877_Menor(L_BPb6!, L_BPba!, L_BPbe!)   '@31bda
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPba!   '@31bef
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPb6!   '@31c15
    IF NOT (L_BPbe! > V_14c8!) THEN GOTO L_31c58   '@31c3b
    GOTO L_31f1f   '@31c50
L_31c58:
    L_BPc2! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@31c58
    L_BPc6! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@31c84
    CALL MIXT_082a_Maior(L_BPc2!, L_BPc6!, L_BPca!)   '@31ca9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPc6!   '@31cbe
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPc2!   '@31ce4
    IF NOT (L_BPca! < V_14d0!) THEN GOTO L_31d27   '@31d0a
    GOTO L_31f1f   '@31d1f
L_31d27:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_31d7a   '@31d27
    GOTO L_31f1f   '@31d72
L_31d7a:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_31dfc   '@31d7a
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@31dc9
    GOTO L_31ece   '@31df4
L_31dfc:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0))   '@31dfc
L_31ece:
    IF NOT (FX##(V_14d0!) + V_133a! < FX##(V_0f04!)) THEN GOTO L_31f1a   '@31ece
    IF NOT (FX##(V_0f04!) < FX##(V_0efc#)) THEN GOTO L_31f1a   '@31eee
    V_0efc# = V_0f04!   '@31f09
L_31f1a:
L_31f1f:
    V_0f14! = FX##(V_0f14!) + 1.0   '@31f24 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_319d6   '@31f3a
L_31f42:
    IF NOT (FX##(V_14c8!) > FX##(V_0efc#)) THEN GOTO L_31f6e   '@31f42
    V_14c8! = V_0efc#   '@31f5d
L_31f6e:
    GOTO L_31fa7   '@31f6e
L_31f7b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@31f7b DS:30b4
L_31fa7:
    GOTO L_31fe9   '@31fa7
L_31faf:
    L_BPce! = FX##(V_14d0!) + V_14f6!   '@31faf
    CALL MIXT_0877_Menor(V_14f0!, L_BPce!, L_BPd2!)   '@31fc5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BPd2!   '@31fd9
L_31fe9:
    GOTO L_343eb   '@31fe9
L_31ff1:
    IF NOT (L_BP22$ <> "2") THEN GOTO L_3202a   '@31ff1 DS:3252
    IF NOT (CHR$(0) + CHR$(80) = L_BP22$) THEN GOTO L_3272b   '@32003
L_3202a:
    IF NOT (V_14c2% = 0) THEN GOTO L_326e9   '@3202a
    FOR V_0f10! = A_0f8a!(0, 0) TO 1.0 STEP -1.0   '@32039 DS:30b4,3242
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) < V_14d0!) THEN GOTO L_326b5   '@32056
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) >= V_14e8!) THEN GOTO L_320e8   '@3208a
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@320be
L_320e8:
    V_0f14! = 1.0   '@320e8 DS:30b4
    V_0efc# = V_14c8!   '@320f9
L_32110:
    IF NOT (A_1042!(0, 0) >= V_0f14!) THEN GOTO L_3267c   '@32111
    L_BPd6! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@32135
    L_BPda! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@32160
    CALL MIXT_0877_Menor(L_BPd6!, L_BPda!, L_BPde!)   '@32182
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPda!   '@32197
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPd6!   '@321ba
    IF NOT (L_BPde! > V_14cc!) THEN GOTO L_321fc   '@321df
    GOTO L_32659   '@321f4
L_321fc:
    L_BPe2! = A_1042!(RT_CINT%(FX##(V_0f14!)), 0)   '@321fc
    L_BPe6! = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)   '@32227
    CALL MIXT_082a_Maior(L_BPe2!, L_BPe6!, L_BPea!)   '@32249
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPe6!   '@3225e
    A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPe2!   '@32281
    IF NOT (L_BPea! < V_14cc!) THEN GOTO L_322c3   '@322a6
    GOTO L_32659   '@322bb
L_322c3:
    L_BPee! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@322c3
    L_BPf2! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@322ef
    CALL MIXT_0877_Menor(L_BPee!, L_BPf2!, L_BPf6!)   '@32314
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPf2!   '@32329
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPee!   '@3234f
    IF NOT (L_BPf6! > V_14d0!) THEN GOTO L_32392   '@32375
    GOTO L_32659   '@3238a
L_32392:
    L_BPfa! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@32392
    L_BPfe! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)   '@323be
    CALL MIXT_082a_Maior(L_BPfa!, L_BPfe!, L_BP102!)   '@323e3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1042!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPfe!   '@323f8
    A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPfa!   '@3241e
    IF NOT (L_BP102! < V_14c8!) THEN GOTO L_32461   '@32444
    GOTO L_32659   '@32459
L_32461:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_324b4   '@32461
    GOTO L_32659   '@324ac
L_324b4:
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_32536   '@324b4
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 1)   '@32503
    GOTO L_32608   '@3252e
L_32536:
    V_0f04! = A_1042!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 3)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_1042!(RT_CINT%(FX##(V_0f14!)), 2)) - A_1042!(RT_CINT%(FX##(V_0f14!)), 0))   '@32536
L_32608:
    IF NOT (FX##(V_14d0!) - V_133a! > FX##(V_0f04!)) THEN GOTO L_32654   '@32608
    IF NOT (FX##(V_0f04!) > FX##(V_0efc#)) THEN GOTO L_32654   '@32628
    V_0efc# = V_0f04!   '@32643
L_32654:
L_32659:
    V_0f14! = FX##(V_0f14!) + 1.0   '@3265e DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32110   '@32674
L_3267c:
    IF NOT (FX##(V_14c8!) < FX##(V_0efc#)) THEN GOTO L_326a8   '@3267c
    V_14c8! = V_0efc#   '@32697
L_326a8:
    GOTO L_326e1   '@326a8
L_326b5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@326b5 DS:30b4,3242
L_326e1:
    GOTO L_32723   '@326e1
L_326e9:
    L_BP106! = FX##(V_14d0!) - V_14f6!   '@326e9
    CALL MIXT_082a_Maior(V_14e8!, L_BP106!, L_BP10a!)   '@326ff
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP10a!   '@32713
L_32723:
    GOTO L_343eb   '@32723
L_3272b:
    IF NOT (L_BP22$ = "*") THEN GOTO L_32761   '@3272b DS:3258
    V_0f18$ = "P"   '@3273d DS:325e
    CALL S_1b2df   '@3274f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_343eb   '@32759
L_32761:
    IF NOT (CHR$(13) = L_BP22$) THEN GOTO L_332f1   '@32761
    V_0f10! = FX##(A_1156!(0, 0)) + 1.0   '@32779 DS:30b4
    A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = V_14dc!   '@3279e
    A_1156!(RT_CINT%(FX##(V_0f10!)), 1) = V_14e0!   '@327c8
    A_1156!(RT_CINT%(FX##(V_0f10!)), 2) = V_14c4!   '@327f3
    A_1156!(RT_CINT%(FX##(V_0f10!)), 3) = V_14c8!   '@3281b
    A_1156!(0, 0) = FX##(A_1156!(0, 0)) + 1.0   '@32846 DS:30b4
    IF NOT (L_BP10c% = 0) THEN GOTO L_33072   '@3287a
L_3288e:
    V_0ee8! = 1.0   '@32893 DS:30b4
    L_BP110! = 1.0   '@328a4 DS:30b4
L_328ba:
    IF NOT (FX##(A_1156!(0, 0)) - 1.0 >= FX##(L_BP110!)) THEN GOTO L_32966   '@328bb DS:3242
    IF NOT (FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) = FX##(V_0ee8!)) THEN GOTO L_32948   '@328e4
    V_0ee8! = FX##(V_0ee8!) + 1.0   '@3291c DS:30b4
    L_BP110! = 0.0   '@32932 DS:307c
L_32948:
    L_BP110! = FX##(L_BP110!) + 1.0   '@32948 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_328ba   '@3295e
L_32966:
    RT_VIEWPRINT 23, 25   '@32966
    RT_CLS 2   '@32978
    RT_VIEWPRINT 1, 25   '@32986
    LOCATE 24, 1   '@32998
    PRINT " Numero ou Nome do Pilar P*"; LTRIM$(STR$(V_0ee8!)); "* ";   '@329b3 DS:3264,3284
    CALL MIXT_07f1_LimpaTeclado   '@329e3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@329ed DS:3108 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_32a94   '@32a07
    A_1128$(RT_CINT%(FX##(V_0f10!))) = LTRIM$(STR$(V_0ee8!))   '@32a1c
    A_1156!(0, 1) = FX##(A_1156!(0, 1)) + 1.0   '@32a52 DS:30b4
    GOTO L_3305f   '@32a8c
L_32a94:
    A_1128$(RT_CINT%(FX##(V_0f10!))) = V_0f18$   '@32a94
    IF NOT (VAL(V_0f18$) > 0.0#) THEN GOTO L_3305a   '@32aba DS:328a
    V_0ee8! = VAL(V_0f18$)   '@32ade
    L_BP110! = 1.0   '@32af8 DS:30b4
L_32b0e:
    IF NOT (FX##(A_1156!(0, 0)) - 1.0 >= FX##(L_BP110!)) THEN GOTO L_32ff8   '@32b0f DS:3242
    IF NOT (FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) = FX##(V_0ee8!)) THEN GOTO L_32fd9   '@32b38
    BEEP   '@32b70
    LOCATE 25, 1   '@32b7a
    PRINT " Pilar"; V_0ee8!; "ja existe.  Renumero para Cima e Incluo N/*S* ";   '@32b95 DS:3292,329c
    CALL MIXT_07f1_LimpaTeclado   '@32bb9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@32bc3 DS:3108 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_32c13   '@32bdd DS:32ce
    V_0ee8! = 0.0   '@32bfa DS:307c
    GOTO L_32fcc   '@32c0b
L_32c13:
    V_0f1c$ = ""   '@32c13 DS:3108
    L_BP114! = FX##(A_1156!(0, 0)) - 1.0   '@32c25 DS:3242
    FOR L_BP110! = 1.0 TO L_BP114!   '@32c4b DS:30b4
    IF NOT (FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) >= FX##(V_0ee8!)) THEN GOTO L_32f9b   '@32c52
    IF NOT (LTRIM$(A_1128$(RT_CINT%(FX##(L_BP110!)))) <> V_0f1c$) THEN GOTO L_32f06   '@32c8a
    V_0f18$ = "~P" + LTRIM$(A_1128$(RT_CINT%(FX##(L_BP110!))))   '@32cbb DS:32d4
    L_BP118! = (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@32cf1
    L_BP11c! = 163.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 1)) - V_14e8!) * V_14ba!   '@32d2b DS:32da
    L_BP120$ = "CGA"   '@32d67 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP118!, L_BP11c!, V_0f18$, L_BP120$)   '@32d75
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @32d8d libera strings locais (L_BP120)
    V_0f1c$ = LTRIM$(A_1128$(RT_CINT%(FX##(L_BP110!))))   '@32d97
    A_1128$(RT_CINT%(FX##(L_BP110!))) = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) + 1.0#)))   '@32dc3 DS:32de
    V_0f18$ = "P" + LTRIM$(A_1128$(RT_CINT%(FX##(L_BP110!))))   '@32e22 DS:325e
    L_BP124! = (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@32e58
    L_BP128! = 163.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 1)) - V_14e8!) * V_14ba!   '@32e92 DS:32da
    L_BP12c$ = "CGA"   '@32ece DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP124!, L_BP128!, V_0f18$, L_BP12c$)   '@32edc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @32ef4 libera strings locais (L_BP12c)
    GOTO L_32f96   '@32efe
L_32f06:
    V_0f1c$ = LTRIM$(A_1128$(RT_CINT%(FX##(L_BP110!))))   '@32f06
    A_1128$(RT_CINT%(FX##(L_BP110!))) = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) + 1.0#)))   '@32f32 DS:32de
L_32f96:
L_32f9b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP110!   '@32f9b DS:30b4
L_32fcc:
    GOTO L_32ff8   '@32fcc
L_32fd9:
    L_BP110! = FX##(L_BP110!) + 1.0   '@32fd9 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32b0e   '@32fef
L_32ff8:
    IF NOT (V_0ee8! = 0.0) THEN GOTO L_3301b   '@32ff8 DS:307c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3288e   '@33013
L_3301b:
    A_1156!(0, 1) = FX##(A_1156!(0, 1)) + 1.0   '@3301b DS:30b4
L_3305a:
L_3305f:
    L_BP10c% = 1   '@3305f
    GOTO L_330b6   '@3306a
L_33072:
    A_1128$(RT_CINT%(FX##(V_0f10!))) = A_1128$(RT_CINT%(FX##(V_0f10!) - 1.0))   '@33072 DS:3242
L_330b6:
    V_0ee8! = L_BP1a!   '@330b6
    GOSUB L_36e0c   '@330c6
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@330d3 DS:32e6
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@3313d DS:32e6,32ea
    GOSUB L_36249   '@331b2
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@331bf DS:30de
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@33232 DS:30de
    GOSUB L_35ba9   '@332a5
    GOSUB L_35d2c   '@332b2
    V_14dc! = V_14c4!   '@332bf
    V_14e0! = V_14c8!   '@332d0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@332e1
L_332f1:
    IF NOT (L_BP22$ <> "I") THEN GOTO L_33315   '@332f1 DS:32ee
    IF NOT (L_BP22$ = "i") THEN GOTO L_333b4   '@33303 DS:32f4
L_33315:
    L_BP10c% = 0   '@33315
    GOSUB L_35d2c   '@3332a
    V_14dc! = V_14c4!   '@33337
    V_14e0! = V_14c8!   '@33348
    LOCATE 24, 11   '@33359
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@33377 DS:3212
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a03   '@333a4
L_333b4:
    IF NOT (L_BP22$ <> "D") THEN GOTO L_333d8   '@333b4 DS:32fa
    IF NOT (L_BP22$ = "d") THEN GOTO L_33ce1   '@333c6 DS:3300
L_333d8:
    RT_VIEWPRINT 23, 25   '@333d8
    RT_CLS 2   '@333ea
    RT_VIEWPRINT 1, 25   '@333f8
    LOCATE 24, 1   '@3340a
    PRINT " <T>odas os Pilares   <U>ltimo Pilar   <E>scolher o Pilar   <*R*>etorno";   '@33425 DS:3306
    CALL MIXT_07f1_LimpaTeclado   '@3343d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@33447
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP130$ = V_0f18$   '@33463
    IF NOT (L_BP130$ <> "T") THEN GOTO L_334a1   '@33476 DS:3352
    IF NOT (L_BP130$ = "t") THEN GOTO L_3351f   '@3348e DS:3358
L_334a1:
    REDIM A_1128$(-32768 TO -32768)   '@334a1
    REDIM A_1156!(-32768 TO -32768, -32768 TO -32768)   '@334af
    REDIM A_1128$(0 TO V_0e4c%)   '@334b8
    REDIM A_1156!(0 TO V_0e4c%, 0 TO 3)   '@334d5
    GOSUB L_36e0c   '@334f7
    L_BP10c% = 0   '@33504
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_305c1   '@3350f
L_3351f:
    IF NOT (L_BP130$ <> "U") THEN GOTO L_33545   '@3351f DS:335e
    IF NOT (L_BP130$ = "u") THEN GOTO L_33667   '@33532 DS:3364
L_33545:
    V_0f10! = A_1156!(0, 0)   '@33545
    IF NOT (V_0f10! = 0.0) THEN GOTO L_33597   '@33565 DS:307c
    BEEP   '@33580
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@3358a
L_33597:
    GOSUB L_34681   '@33597
    V_14c4! = A_1156!(RT_CINT%(FX##(V_0f10!)), 0)   '@335a4
    V_14c8! = A_1156!(RT_CINT%(FX##(V_0f10!)), 1)   '@335ce
    GOSUB L_35d2c   '@335f9
    GOSUB L_35ba9   '@33606
    V_14cc! = V_14c4!   '@33613
    V_14d0! = V_14c8!   '@33624
    V_14dc! = V_14c4!   '@33635
    V_14e0! = V_14c8!   '@33646
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33657
L_33667:
    IF NOT (L_BP130$ <> "E") THEN GOTO L_3368d   '@33667 DS:336a
    IF NOT (L_BP130$ = "e") THEN GOTO L_33ccc   '@3367a DS:3370
L_3368d:
    LOCATE 24, 1   '@3368d
    PRINT " Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@336a8 DS:3108,3376
L_336d6:
    V_0f18$ = "NENHUM"   '@336db DS:33c2
    FOR V_0f10! = A_1156!(0, 0) TO 1.0 STEP -1.0   '@336ed DS:30b4,3242
    L_BP134! = A_1156!(RT_CINT%(FX##(V_0f10!)), 0)   '@3370a
    L_BP138! = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)   '@33735
    CALL MIXT_0877_Menor(L_BP134!, L_BP138!, L_BP13c!)   '@33757
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP138!   '@3376c
    A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP134!   '@3378f
    L_BP140! = A_1156!(RT_CINT%(FX##(V_0f10!)), 0)   '@337b4
    L_BP144! = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)   '@337d9
    CALL MIXT_082a_Maior(L_BP140!, L_BP144!, L_BP148!)   '@337fb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP144!   '@33810
    A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP140!   '@33833
    L_BP14c! = A_1156!(RT_CINT%(FX##(V_0f10!)), 1)   '@33858
    L_BP150! = A_1156!(RT_CINT%(FX##(V_0f10!)), 3)   '@3387e
    CALL MIXT_0877_Menor(L_BP14c!, L_BP150!, L_BP154!)   '@338a3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP150!   '@338b8
    A_1156!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP14c!   '@338de
    L_BP158! = A_1156!(RT_CINT%(FX##(V_0f10!)), 1)   '@33904
    L_BP15c! = A_1156!(RT_CINT%(FX##(V_0f10!)), 3)   '@3392a
    CALL MIXT_082a_Maior(L_BP158!, L_BP15c!, L_BP160!)   '@3394f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP15c!   '@33964
    A_1156!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP158!   '@3398a
    IF NOT (L_BP160! <= V_14f0! AND (L_BP154! >= V_14e8! AND (L_BP148! <= V_14ec! AND L_BP13c! >= V_14e4!))) THEN GOTO L_33c1c   '@339b0
L_33a24:
    V_0ee8! = V_14be!   '@33a24
    GOSUB L_36249   '@33a35
    L_BP164! = RT_TIMER   '@33a42
L_33a5e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP164! < 0.100000001490116119384765625## THEN GOTO L_33a5e   '@33a5e DS:33cc
    V_0ee8! = L_BP1a!   '@33a80
    GOSUB L_36249   '@33a90
    L_BP164! = RT_TIMER   '@33a9d
L_33ab8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP164! < 0.100000001490116119384765625## THEN GOTO L_33ab8   '@33ab8 DS:33cc
    V_0f18$ = RT_INKEY$   '@33ada
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_33a24   '@33aee DS:3108
    L_BP168$ = V_0f18$   '@33b05
    IF NOT (L_BP168$ <> "S") THEN GOTO L_33b43   '@33b18 DS:30d8
    IF NOT (L_BP168$ = "s") THEN GOTO L_33b58   '@33b30 DS:33d0
L_33b43:
    GOSUB L_34681   '@33b43
    GOTO L_33c17   '@33b50
L_33b58:
    IF NOT (L_BP168$ <> "F") THEN GOTO L_33b7e   '@33b58 DS:33d6
    IF NOT (L_BP168$ = "f") THEN GOTO L_33b8e   '@33b6b DS:33dc
L_33b7e:
    GOTO L_33c48   '@33b7e
L_33b8e:
    IF NOT (L_BP168$ <> "R") THEN GOTO L_33bb4   '@33b8e DS:33e2
    IF NOT (L_BP168$ = "r") THEN GOTO L_33c12   '@33ba1 DS:33e8
L_33bb4:
    L_BP16c! = FX##(V_0f10!) + 2.0   '@33bb4 DS:30b8
    L_BP170! = FX##(A_1156!(0, 0)) + 1.0   '@33bca DS:30b4
    CALL MIXT_0877_Menor(L_BP16c!, L_BP170!, L_BP174!)   '@33bea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BP174!   '@33bff
    GOTO L_33c17   '@33c0a
L_33c12:
L_33c17:
L_33c1c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@33c1c DS:30b4,3242
L_33c48:
    L_BP176% = (V_0f10! = 0.0)   '@33c48 DS:307c
    IF NOT ((A_1156!(0, 0) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP176%)) <> 0) THEN GOTO L_33cbc   '@33c72 DS:307c,33c2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_336d6   '@33cb4
L_33cbc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33cbc
L_33ccc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33ccc
L_33ce1:
    IF NOT (L_BP22$ <> "R") THEN GOTO L_33d05   '@33ce1 DS:33e2
    IF NOT (L_BP22$ = "r") THEN GOTO L_33d2f   '@33cf3 DS:33e8
L_33d05:
    GOSUB L_36042   '@33d05
    GOSUB L_361c6   '@33d12
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a03   '@33d1f
L_33d2f:
    IF NOT (L_BP22$ <> "Z") THEN GOTO L_33d53   '@33d2f DS:33ee
    IF NOT (L_BP22$ = "z") THEN GOTO L_33ea0   '@33d41 DS:33f4
L_33d53:
L_33d58:
    RT_VIEWPRINT 23, 25   '@33d5d
    RT_CLS 2   '@33d6f
    RT_VIEWPRINT 1, 25   '@33d7d
    LOCATE 24, 1   '@33d8f
    PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@33daa DS:33fa
    CALL MIXT_07f1_LimpaTeclado   '@33db8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@33dc2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP17a$ = V_0f18$   '@33dde
    IF NOT (L_BP17a$ <> "D") THEN GOTO L_33e1c   '@33df1 DS:32fa
    IF NOT (L_BP17a$ = "d") THEN GOTO L_33e55   '@33e09 DS:3300
L_33e1c:
    CALL S_4954b   '@33e1c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f18$ = "FIM") THEN GOTO L_33e45   '@33e26 DS:3448
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33d58   '@33e3d
L_33e45:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_304de   '@33e45
L_33e55:
    IF NOT (L_BP17a$ <> "T") THEN GOTO L_33e7b   '@33e55 DS:3352
    IF NOT (L_BP17a$ = "t") THEN GOTO L_33e8b   '@33e68 DS:3358
L_33e7b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3040f   '@33e7b
L_33e8b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33e8b
L_33ea0:
    IF NOT (L_BP22$ <> "C") THEN GOTO L_33ec4   '@33ea0 DS:3450
    IF NOT (L_BP22$ = "c") THEN GOTO L_3415e   '@33eb2 DS:3456
L_33ec4:
    IF NOT (V_14c2% = 0) THEN GOTO L_33eee   '@33ec4
    V_14c2% = 1   '@33ed3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33ede
L_33eee:
    RT_VIEWPRINT 23, 25   '@33eee
    RT_CLS 2   '@33f00
    RT_VIEWPRINT 1, 25   '@33f0e
    LOCATE 23, 1   '@33f20
    PRINT USING " Movimente o cursor ate a Coordenada *###.###,###.###* "; RT_PU#(V_14c4!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 1); RT_PU#(V_14c8!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 2);   '@33f3b DS:345c
    CALL MIXT_07f1_LimpaTeclado   '@33f68
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@33f72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP17c% = (LEN(V_0f18$) = 0)   '@33f84
    IF NOT ((LEN(V_0f1c$) = 0 AND L_BP17c%) <> 0) THEN GOTO L_33fc2   '@33fa2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@33fba
L_33fc2:
    L_BP17e% = (LEN(V_0f18$) > 0)   '@33fc2
    L_BP180% = FX##(VAL(V_0f18$)) >= FX##(V_14e4!) AND L_BP17e%   '@33fe5
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_14ec!) AND L_BP180%) <> 0) THEN GOTO L_3404b   '@3400f
    V_14c4! = VAL(V_0f18$)   '@34031
L_3404b:
    L_BP182% = (LEN(V_0f1c$) > 0)   '@3404b
    L_BP184% = FX##(VAL(V_0f1c$)) >= FX##(V_14e8!) AND L_BP182%   '@3406e
    IF NOT ((FX##(VAL(V_0f1c$)) <= FX##(V_14f0!) AND L_BP184%) <> 0) THEN GOTO L_340d4   '@34098
    V_14c8! = VAL(V_0f1c$)   '@340ba
L_340d4:
    GOSUB L_35ba9   '@340d4
    LOCATE 23, 40   '@340e1
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14c4!, "(###.##,###.##)", 1); RT_PU#(V_14c8!, "(###.##,###.##)", 2)   '@340ff DS:3212
    V_14cc! = V_14c4!   '@34127
    V_14d0! = V_14c8!   '@34138
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@34149
L_3415e:
    IF NOT (L_BP22$ <> "E") THEN GOTO L_34182   '@3415e DS:336a
    IF NOT (L_BP22$ = "e") THEN GOTO L_341ac   '@34170 DS:3370
L_34182:
    IF NOT (V_14c2% = 1) THEN GOTO L_341a4   '@34182
    V_14c2% = 0   '@34191
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@3419c
L_341a4:
    GOTO L_343eb   '@341a4
L_341ac:
    IF NOT (L_BP22$ = "+") THEN GOTO L_341eb   '@341ac DS:3498
    IF NOT (V_14c2% = 1) THEN GOTO L_341e3   '@341be
    V_14f6! = FX##(V_14f6!) * 2.0   '@341cd DS:30b8
L_341e3:
    GOTO L_343eb   '@341e3
L_341eb:
    IF NOT (L_BP22$ = "-") THEN GOTO L_3422a   '@341eb DS:349e
    IF NOT (V_14c2% = 1) THEN GOTO L_34222   '@341fd
    V_14f6! = FX##(V_14f6!) / 2.0   '@3420c DS:30b8
L_34222:
    GOTO L_343eb   '@34222
L_3422a:
    IF NOT (L_BP22$ <> "P") THEN GOTO L_3424e   '@3422a DS:325e
    IF NOT (L_BP22$ = "p") THEN GOTO L_34395   '@3423c DS:34a4
L_3424e:
    IF NOT (V_14c2% = 0) THEN GOTO L_34265   '@3424e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a03   '@3425d
L_34265:
    RT_VIEWPRINT 23, 25   '@34265
    RT_CLS 2   '@34277
    RT_VIEWPRINT 1, 25   '@34285
    LOCATE 23, 1   '@34297
    PRINT USING " Passo de movimentacao *###.####* "; RT_PU#(V_14f6!, " Passo de movimentacao *###.####* ", 1);   '@342b2 DS:34aa
    CALL MIXT_07f1_LimpaTeclado   '@342d2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@342dc DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_34385   '@342f6
    L_BP186% = (VAL(V_0f18$) > 0.0#)   '@3430b DS:328a,34d0
    IF NOT ((FX##(VAL(V_0f18$)) < 50.0 * FX##(V_14f6!) AND L_BP186%) <> 0) THEN GOTO L_34380   '@34344
    V_14f6! = VAL(V_0f18$)   '@34366
L_34380:
L_34385:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_307cd   '@34385
L_34395:
    IF NOT (L_BP22$ <> "F") THEN GOTO L_343b9   '@34395 DS:33d6
    IF NOT (L_BP22$ = "f") THEN GOTO L_343de   '@343a7 DS:33dc
L_343b9:
    RT_SCREEN 0   '@343b9
    GOTO L_36e62   '@343ce
L_343de:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a03   '@343de
L_343eb:
    GOSUB L_35ba9   '@343eb
    LOCATE 23, 60   '@343f8
    V_0f18$ = ""   '@34416 DS:3108
    IF NOT (V_14c2% = 0) THEN GOTO L_34621   '@34428
    L_BP18a! = A_0f8a!(0, 1)   '@34437
    FOR V_0f10! = 1.0 TO L_BP18a!   '@3445b DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) = V_14c4!) THEN GOTO L_34539   '@34462
    V_0f18$ = CHR$(RT_CINT%(FX##(V_0f10!) + 26& * ((RT_CLNG&(FX##(V_0f10!)) \ 26&) * (V_0f10! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f10!) - 1.0) \ 26&), ("'"))   '@34497 DS:3242,34d4,34d8,34e0
    GOTO L_34565   '@34531
L_34539:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@34539 DS:30b4
L_34565:
    L_BP18e! = A_0f8a!(0, 0)   '@34565
    FOR V_0f10! = 1.0 TO L_BP18e!   '@34586 DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) = V_14c8!) THEN GOTO L_345f0   '@3458e
    V_0f18$ = V_0f18$ + STR$(V_0f10!)   '@345c2
    GOTO L_3461c   '@345e8
L_345f0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@345f0 DS:30b4
L_3461c:
L_34621:
    PRINT USING "(###.##,###.##) \   \ "; RT_PU#(V_14c4!, "(###.##,###.##) \   \ ", 1); RT_PU#(V_14c8!, "(###.##,###.##) \   \ ", 2); V_0f18$   '@34621 DS:34e6
    V_14cc! = V_14c4!   '@34652
    V_14d0! = V_14c8!   '@34663
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30a03   '@34674
    ' ---- F_3467c @0x3467c  (03467c_F_3467c.lift.txt; evidence_id (assembly): ev_1cc6d9294db7bcde7edad70d422786ec1b3d0383c487e4c5982e601160ccef68)
L_34681:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    V_0f20$ = "S"   '@34686 DS:30d8
    L_BP192! = V_0f10!   '@34698
    IF NOT (L_BP192! = 1.0) THEN GOTO L_3470c   '@346a9 DS:30b4
    IF NOT (A_1128$(1) = A_1128$(2)) THEN GOTO L_34704   '@346c4
    V_0f20$ = "N"   '@346f2 DS:32ce
L_34704:
    GOTO L_3485c   '@34704
L_3470c:
    IF NOT (A_1156!(0, 0) = L_BP192!) THEN GOTO L_347ad   '@3470d
    IF NOT (A_1128$(RT_CINT%(FX##(A_1156!(0, 0)))) = A_1128$(RT_CINT%(FX##(A_1156!(0, 0)) - 1.0))) THEN GOTO L_347a5   '@34731 DS:3242
    V_0f20$ = "N"   '@34793 DS:32ce
L_347a5:
    GOTO L_3485c   '@347a5
L_347ad:
    L_BP194% = (A_1128$(RT_CINT%(FX##(V_0f10!))) = A_1128$(RT_CINT%(FX##(V_0f10!) - 1.0)))   '@347ad DS:30b4,3242
    IF NOT ((A_1128$(RT_CINT%(FX##(V_0f10!))) = A_1128$(RT_CINT%(FX##(V_0f10!) + 1.0)) OR L_BP194%) <> 0) THEN GOTO L_34857   '@3482f
    V_0f20$ = "N"   '@34845 DS:32ce
L_34857:
L_3485c:
    L_BP196% = (VAL(A_1128$(RT_CINT%(FX##(V_0f10!)))) > 0.0#)   '@3485c DS:328a
    IF NOT ((V_0f20$ = "S" AND L_BP196%) <> 0) THEN GOTO L_3490e   '@348a3 DS:30d8
    LOCATE 25, 1   '@348b9
    PRINT " Renumero os Pilares S/*N* ";   '@348d4 DS:3500
    CALL MIXT_07f1_LimpaTeclado   '@348e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f20$   '@348ec DS:3108 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    GOTO L_34925   '@34906
L_3490e:
    V_0f20$ = "N"   '@3490e DS:32ce
L_34925:
    LOCATE 25, 1   '@34925
    PRINT " "; RT_TAB$(79); ""; " ";   '@34940 DS:3108,3520
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@34969 DS:32e6
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@349d3 DS:32e6,32ea
    V_0ee8! = V_14be!   '@34a48
    GOSUB L_36249   '@34a59
    V_0ef0! = VAL(A_1128$(RT_CINT%(FX##(V_0f10!))))   '@34a66
    L_BP19a! = A_1156!(0, 0)   '@34a94
    FOR V_0f14! = FX##(V_0f10!) + 1.0 TO L_BP19a!   '@34ab5 DS:30b4
    A_1128$(RT_CINT%(FX##(V_0f14!) - 1.0)) = A_1128$(RT_CINT%(FX##(V_0f14!)))   '@34ac2 DS:3242
    FOR V_0f04! = 0.0 TO 3.0   '@34b01 DS:307c,30b4,3526
    A_1156!(RT_CINT%(FX##(V_0f14!) - 1.0), RT_CINT%(FX##(V_0f04!))) = A_1156!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!)))   '@34b0e DS:3242
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@34b66 DS:30b4,3526
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@34b92 DS:30b4
    A_1128$(RT_CINT%(FX##(A_1156!(0, 0)))) = ""   '@34bbe DS:3108
    A_1156!(0, 0) = FX##(A_1156!(0, 0)) - 1.0   '@34bf3 DS:3242
    L_BP19c% = (V_0ef0! > 0.0)   '@34c27 DS:307c
    L_BP19e% = FX##(VAL(A_1128$(RT_CINT%(FX##(V_0f10!))))) <> FX##(V_0ef0!) AND L_BP19c%   '@34c68 DS:3242
    IF NOT ((FX##(VAL(A_1128$(RT_CINT%(FX##(V_0f10!) - 1.0)))) <> FX##(V_0ef0!) AND L_BP19e%) <> 0) THEN GOTO L_34e41   '@34cad
    IF NOT (UCASE$(V_0f20$) = "S") THEN GOTO L_34e39   '@34ccf DS:30d8
    A_1156!(0, 1) = FX##(A_1156!(0, 1)) - 1.0   '@34cec DS:3242
    L_BP1a2! = A_1156!(0, 0)   '@34d26
    FOR V_0f14! = 1.0 TO L_BP1a2!   '@34d47 DS:30b4
    IF NOT (V_0ef0! > 0.0 AND FX##(VAL(A_1128$(RT_CINT%(FX##(V_0f14!))))) > FX##(V_0ef0!)) THEN GOTO L_34e08   '@34d4e DS:307c
    A_1128$(RT_CINT%(FX##(V_0f14!))) = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1128$(RT_CINT%(FX##(V_0f14!))))) - 1.0#)))   '@34da9 DS:352a
L_34e08:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@34e08 DS:30b4
L_34e39:
    GOTO L_34e57   '@34e39
L_34e41:
    V_0ef0! = 0.0   '@34e41 DS:307c
L_34e57:
    L_BP1a4% = (V_0ef0! > 0.0)   '@34e57 DS:307c
    IF NOT ((UCASE$(V_0f20$) = "S" AND L_BP1a4%) <> 0) THEN GOTO L_35169   '@34e7d DS:30d8
    L_BP110! = 1.0   '@34e9d DS:30b4
L_34eb4:
    IF NOT (A_1156!(0, 0) >= L_BP110!) THEN GOTO L_35164   '@34eb5
    IF NOT (FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) >= FX##(V_0ef0!)) THEN GOTO L_35146   '@34ed9
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(L_BP110!)))) <> VAL(A_1128$(RT_CINT%(FX##(L_BP110!) - 1.0)))) THEN GOTO L_35141   '@34f11 DS:3242
    V_0f18$ = "~P" + LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP110!))))) + 1.0#)))   '@34f6b DS:32d4,32de
    L_BP1a8! = (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@34fc0
    L_BP1ac! = 163.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 1)) - V_14e8!) * V_14ba!   '@34ffa DS:32da
    L_BP1b0$ = "CGA"   '@35036 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1a8!, L_BP1ac!, V_0f18$, L_BP1b0$)   '@35044
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3505c libera strings locais (L_BP1b0)
    V_0f18$ = "P" + A_1128$(RT_CINT%(FX##(L_BP110!)))   '@35066 DS:325e
    L_BP1b4! = (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@35096
    L_BP1b8! = 163.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(L_BP110!)), 1)) - V_14e8!) * V_14ba!   '@350d0 DS:32da
    L_BP1bc$ = "CGA"   '@3510c DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1b4!, L_BP1b8!, V_0f18$, L_BP1bc$)   '@3511a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35132 libera strings locais (L_BP1bc)
L_35141:
L_35146:
    L_BP110! = FX##(L_BP110!) + 1.0   '@35146 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_34eb4   '@3515c
L_35164:
L_35169:
    GOSUB L_35969   '@35169
    GOSUB L_35ebf   '@35176
    GOSUB L_36042   '@35183
    L_BP1c0! = V_0f10!   '@35190
    GOSUB L_361c6   '@351a1
    V_0f10! = L_BP1c0!   '@351ae
    IF NOT (V_0f10! > 1.0 AND FX##(A_1156!(0, 0)) + 1.0 > FX##(V_0f10!)) THEN GOTO L_35227   '@351bf DS:30b4
    V_0f10! = FX##(V_0f10!) + 1.0   '@35211 DS:30b4
L_35227:
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@35227 DS:30de
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@3529a DS:30de
    L_BP1c4! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@3530d
    L_BP1c8! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@3532e DS:30de
    L_BP1cc$ = CHR$(27)   '@35350
    L_BP1d0$ = "CGA"   '@35364 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1c4!, L_BP1c8!, L_BP1cc$, L_BP1d0$)   '@35372
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3538b libera strings locais (L_BP1cc)
    ' @35395 libera strings locais (L_BP1d0)
    L_BP1d4! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@3539f DS:32ea
    L_BP1d8! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@353c5 DS:30de
    L_BP1dc$ = CHR$(26)   '@353e7
    L_BP1e0$ = "CGA"   '@353fb DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1d4!, L_BP1d8!, L_BP1dc$, L_BP1e0$)   '@35409
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35422 libera strings locais (L_BP1dc)
    ' @3542c libera strings locais (L_BP1e0)
    GOSUB L_36e0c   '@35436
    L_BP10c% = 0   '@35443
    RETURN   '@3544e
L_3545d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    V_0f18$ = ""   '@35462 DS:3108
    V_0f1c$ = ""   '@35474 DS:3108
    L_BP1e2% = (V_0dcc_placa$ = "EGA")   '@35486 DS:3094
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP1e2%) <> 0) THEN GOTO L_354d8   '@354ac DS:309c
    COLOR 10   '@354c2
L_354d8:
    L_BP1e6! = A_0f8a!(0, 0)   '@354d8
    FOR V_0f14! = 1.0 TO L_BP1e6!   '@354f9 DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_358d5   '@35500
    L_BP1ea! = 2.0   '@35572 DS:30b8
    L_BP1ee! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@35584 DS:30de
    L_BP1f2$ = LTRIM$(STR$(V_0f14!))   '@355bf
    L_BP1f6$ = "CGA"   '@355dd DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1ea!, L_BP1ee!, L_BP1f2$, L_BP1f6$)   '@355eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35604 libera strings locais (L_BP1f2)
    ' @3560e libera strings locais (L_BP1f6)
    L_BP1fa! = A_0f8a!(0, 1)   '@35618
    FOR V_0f04! = 1.0 TO L_BP1fa!   '@3563c DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_35892   '@35644
    IF NOT (V_0f18$ = "") THEN GOTO L_357fd   '@356b8 DS:3108
    L_BP1fe! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@356cf DS:3532
    L_BP202! = 165.0   '@3570f DS:3536
    L_BP206$ = CHR$(RT_CINT%(FX##(V_0f04!) + 26& * ((RT_CLNG&(FX##(V_0f04!)) \ 26&) * (V_0f04! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f04!) - 1.0) \ 26&), ("'"))   '@3571b DS:3242,34d4,34d8,34e0
    L_BP20a$ = "CGA"   '@357b0 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP1fe!, L_BP202!, L_BP206$, L_BP20a$)   '@357be
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @357d7 libera strings locais (L_BP206)
    ' @357e1 libera strings locais (L_BP20a)
    V_0f1c$ = "*"   '@357eb DS:3258
L_357fd:
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@357fd DS:3536
L_35892:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@35892 DS:30b4
    V_0f18$ = V_0f1c$   '@358be
L_358d5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@358d5 DS:30b4
    L_BP20c% = (V_0dcc_placa$ = "EGA")   '@35901 DS:3094
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP20c%) <> 0) THEN GOTO L_3595a   '@35927 DS:309c
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@3593d
L_3595a:
    RETURN   '@3595a
L_35969:   ' sub-rotina (alvo de GOSUB)
    L_BP210! = A_0f8a!(0, 0)   '@3596e
    FOR V_0f14! = 1.0 TO L_BP210!   '@3598f DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_35b6e   '@35996
    L_BP214! = A_0f8a!(0, 1)   '@35a08
    FOR V_0f04! = 1.0 TO L_BP214!   '@35a2c DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_35b3d   '@35a34
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@35aa8 DS:3536
L_35b3d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@35b3d DS:30b4
L_35b6e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@35b6e DS:30b4
    RETURN   '@35b9a
L_35ba9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    RT_GPONTO RT_SNG!((FX##(V_14cc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14d0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@35bae DS:32e6
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@35c18 DS:30de
    L_BP218! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@35c8b
    L_BP21c! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@35cac DS:30de
    L_BP220$ = CHR$(27)   '@35cce
    L_BP224$ = "CGA"   '@35ce2 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP218!, L_BP21c!, L_BP220$, L_BP224$)   '@35cf0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35d09 libera strings locais (L_BP220)
    ' @35d13 libera strings locais (L_BP224)
    RETURN   '@35d1d
L_35d2c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@35d31 DS:32e6,32ea
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@35da6 DS:30de
    L_BP228! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@35e19 DS:32ea
    L_BP22c! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@35e3f DS:30de
    L_BP230$ = CHR$(26)   '@35e61
    L_BP234$ = "CGA"   '@35e75 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP228!, L_BP22c!, L_BP230$, L_BP234$)   '@35e83
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @35e9c libera strings locais (L_BP230)
    ' @35ea6 libera strings locais (L_BP234)
    RETURN   '@35eb0
L_35ebf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    L_BP238! = A_0fb8!(0, 0)   '@35ec4
    FOR L_BP1c0! = 1.0 TO L_BP238!   '@35ee5 DS:30b4
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP1c0!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP1c0!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@35eec DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP1c0!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP1c0!)), 3)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(L_BP0e!)), 17476   '@35f72 DS:3536
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1c0!   '@36007 DS:30b4
    RETURN   '@36033
L_36042:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    L_BP23c! = A_1042!(0, 0)   '@36047
    FOR L_BP1c0! = 1.0 TO L_BP23c!   '@36068 DS:30b4
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(L_BP1c0!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(L_BP1c0!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@36070 DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(L_BP1c0!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(L_BP1c0!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP16!)), 0   '@360f6 DS:3536
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1c0!   '@3618b DS:30b4
    RETURN   '@361b7
L_361c6:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    V_0ee8! = L_BP1a!   '@361cb
    L_BP240! = A_1156!(0, 0)   '@361db
    FOR V_0f10! = 1.0 TO L_BP240!   '@361fc DS:30b4
    GOSUB L_36249   '@36204
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@36211 DS:30b4
    RETURN   '@3623a
L_36249:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f10!)), 1) = A_1156!(RT_CINT%(FX##(V_0f10!)), 3) AND A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_3642c   '@3624e
    RT_PSET RT_SNG!(FX##(V_14d4!) - 1.0 + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(164.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@362f2 DS:3242,353a
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) + 1.0 + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(1.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0), 40, RT_CINT%(FX##(V_0ee8!)), 0   '@36380 DS:30b4,3536
    GOTO L_36c25   '@36424
L_3642c:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_364a1   '@3642c
    V_0ef4# = 0.5#   '@36477 DS:353e
    V_0efc# = 0.0#   '@36488 DS:328a
    GOTO L_365da   '@36499
L_364a1:
    V_0ef4# = RT_SIN##(ATN((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) / (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 0)))) * 0.300000011920928955078125##   '@364a1 DS:3546
    V_0efc# = RT_COS##(ATN((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) / (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 0)))) * 0.300000011920928955078125##   '@3653b DS:3546
L_365da:
    RT_PSET RT_SNG!(V_14d4! - 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba! + 165.0#), 0, 0   '@365da DS:354a,3552
    RT_LINE 0, 0, RT_SNG!(V_14d4! - 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0#), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3667d DS:354a,3552
    RT_PSET RT_SNG!(FX##(V_14d4!) - V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba! + 165.0#), 0, 0   '@36730 DS:3552
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) - V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0#), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@367c6 DS:3552
    RT_PSET RT_SNG!((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@3686c DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@368f2 DS:3536
    RT_PSET RT_SNG!(FX##(V_14d4!) + V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@36988 DS:3552
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) + V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@36a1e DS:3552
    RT_PSET RT_SNG!(V_14d4! + 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - 2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@36ac4 DS:354a,3552
    RT_LINE 0, 0, RT_SNG!(V_14d4! + 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - 2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@36b6a DS:354a,3552
L_36c25:
    L_BP242% = (V_0f10! = 1.0)   '@36c25 DS:30b4,3242
    L_BP244% = (V_0f10! > 1.0)   '@36c97
    IF NOT ((A_1128$(RT_CINT%(FX##(V_0f10!))) <> A_1128$(RT_CINT%(FX##(V_0f10!) - 1.0)) AND L_BP244% OR L_BP242%) <> 0) THEN GOTO L_36dfd   '@36c9b
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f10!)))   '@36cb5
    IF NOT (VAL(V_0f18$) > 0.0#) THEN GOTO L_36d1b   '@36cdb DS:328a
    V_0f18$ = "P" + V_0f18$   '@36cff DS:325e
L_36d1b:
    IF NOT (V_0ee8! = V_14be!) THEN GOTO L_36d52   '@36d1b
    V_0f18$ = "~" + V_0f18$   '@36d36 DS:355a
L_36d52:
    L_BP248! = (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@36d52
    L_BP24c! = 163.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!   '@36d8c DS:32da
    L_BP250$ = "CGA"   '@36dc8 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP248!, L_BP24c!, V_0f18$, L_BP250$)   '@36dd6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @36dee libera strings locais (L_BP250)
L_36dfd:
    RETURN   '@36dfd
L_36e0c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030137_FUN_3000_0137
    V_0e40% = 0   '@36e11
    V_0e3c% = 0   '@36e1c
    V_120e% = 0   '@36e27
    V_126c% = 0   '@36e32
    V_12f8% = 0   '@36e3d
    V_12fa% = 0   '@36e48
    RETURN   '@36e53
L_36e62:   ' entrada vinda de 030137_FUN_3000_0137
    ' @36e62 libera strings locais (L_BP17a)
    ' @36e6c libera strings locais (L_BP168)
    ' @36e76 libera strings locais (L_BP130)
    ' @36e80 libera strings locais (L_BP22)
    ' @36e89 libera strings locais (L_BP1e)
    ' END SUB   '@36e92
END SUB

SUB S_36ea2   ' entrada de SUB/FUNCTION (B$ENRA, locais 340 bytes) (0x36ea2)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    DIM L_BP32$
    DIM L_BP36!
    DIM L_BP3a$
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
    DIM L_BP7e$
    DIM L_BP82$
    DIM L_BP86!
    DIM L_BP8a!
    DIM L_BP8c%
    DIM L_BP90!
    DIM L_BP94!
    DIM L_BP96%
    DIM L_BP98%
    DIM L_BP9c!
    DIM L_BPa0!
    DIM L_BPa4!
    DIM L_BPa8$
    DIM L_BPac$
    DIM L_BPb0!
    DIM L_BPb4!
    DIM L_BPb8!
    DIM L_BPbc$
    DIM L_BPc0$
    DIM L_BPc2%
    DIM L_BPc6!
    DIM L_BPca!
    DIM L_BPce!
    DIM L_BPd2!
    DIM L_BPd4%
    DIM L_BPd8!
    DIM L_BPdc!
    DIM L_BPe0$
    DIM L_BPe4!
    DIM L_BPe8!
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc!
    ' ---- FUN_3000_6ea2 @0x36ea2  (036ea2_FUN_3000_6ea2.lift.txt; evidence_id (assembly): ev_5f8fa4c47d4962210600416f913e5a193d33787c22211d8384db1ae75cbceca8)
    REDIM A_14fa%(-32768 TO -32768)   '@36eb4
    REDIM A_14fa%(0 TO 480)   '@36ec2
    IF NOT (V_0e3c% = 0 OR (V_0e3e% = 0 OR V_0e3a% = 0)) THEN GOTO L_36f2f   '@36edf
    V_0f18$ = "FIM"   '@36f10 DS:3448
    GOTO L_3c976   '@36f22
L_36f2f:
    IF NOT (V_0e40% = 0) THEN GOTO L_36f99   '@36f2f
    REDIM A_1184$(-32768 TO -32768)   '@36f3e
    REDIM A_11b2%(-32768 TO -32768, -32768 TO -32768)   '@36f4c
    REDIM A_1184$(0 TO V_0e4e%)   '@36f55
    REDIM A_11b2%(0 TO V_0e4e%, 0 TO 50)   '@36f72
L_36f99:
    L_BP32$ = V_0dcc_placa$   '@36f99
    IF NOT (L_BP32$ = "HER") THEN GOTO L_37041   '@36fab DS:3070
    RT_SCREEN 3   '@36fc2
    L_BP22! = 7.0   '@36fd8 DS:3078
    L_BP1e! = 7.0   '@36fe8 DS:3078
    L_BP26! = 7.0   '@36ff8 DS:3078
    L_BP2a! = 7.0   '@37008 DS:3078
    L_BP2e! = 7.0   '@37018 DS:3078
    V_14be! = 0.0   '@37028 DS:307c
    GOTO L_3719a   '@37039
L_37041:
    IF NOT (L_BP32$ <> "CGA") THEN GOTO L_37065   '@37041 DS:3080
    IF NOT (L_BP32$ = "MCG") THEN GOTO L_370e1   '@37053 DS:3088
L_37065:
    RT_SCREEN 2   '@37065
    L_BP22! = 15.0   '@37078 DS:3090
    L_BP1e! = 15.0   '@37088 DS:3090
    L_BP26! = 15.0   '@37098 DS:3090
    L_BP2a! = 15.0   '@370a8 DS:3090
    L_BP2e! = 15.0   '@370b8 DS:3090
    V_14be! = 0.0   '@370c8 DS:307c
    GOTO L_3719a   '@370d9
L_370e1:
    IF NOT (L_BP32$ <> "EGA") THEN GOTO L_37105   '@370e1 DS:3094
    IF NOT (L_BP32$ = "VGA") THEN GOTO L_3719a   '@370f3 DS:309c
L_37105:
    RT_SCREEN 9   '@37105
    COLOR , 1   '@3711b
    L_BP22! = 9.0   '@37131 DS:30a4
    L_BP1e! = 14.0   '@37141 DS:30a8
    L_BP26! = 16.0   '@37151 DS:30ac
    L_BP2a! = 12.0   '@37161 DS:30b0
    L_BP2e! = 15.0   '@37171 DS:3090
    V_14be! = 1.0   '@37181 DS:30b4
    GOTO L_3719a   '@37192
L_3719a:
    V_14e4! = A_0f8a!(1, 1)   '@371a4
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@371c5
    V_14e8! = A_0f8a!(1, 0)   '@37202
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@37225
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@3725e DS:30bc
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@3727c DS:30c0
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_372d8   '@3729a DS:30c4
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@372ba DS:30c4
    GOTO L_372f3   '@372d0
L_372d8:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@372d8 DS:30c4
L_372f3:
    RT_CLS -1   '@372fd
    RT_WINDOW 1, (0), (0), (639), (199)   '@3730b DS:307c,307e,30c8,30ca,30cc,30ce (B$WIND decodificado)
    V_14d4! = 45.0   '@37339 DS:30d0
    V_14d8! = 10.0   '@3734a DS:30d4
    GOSUB L_39880   '@3735b
    GOSUB L_39d8d   '@37368
    GOSUB L_39f10   '@37375
    GOSUB L_3a094   '@37382
    IF NOT (V_0e40% = 1) THEN GOTO L_374ab   '@3738f
    L_BP36! = A_11b2%(0, 0)   '@3739e
    FOR V_0f10! = 1.0 TO L_BP36!   '@373c2 DS:30b4
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0f10!)), 0) > 2) THEN GOTO L_3746e   '@373ca
    A_11b2%(RT_CINT%(FX##(V_0f10!)), 2) = A_11b2%(RT_CINT%(FX##(V_0f10!)), A_11b2%(RT_CINT%(FX##(V_0f10!)), 0))   '@373f3
    A_11b2%(RT_CINT%(FX##(V_0f10!)), 0) = 2   '@37447
L_3746e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3746e DS:30b4
    GOSUB L_3ab02   '@37499
L_374ab:
    IF NOT (V_1528$ = "S") THEN GOTO L_374ca   '@374ab DS:30d8
    GOTO L_3c976   '@374c2
L_374ca:
L_374cf:
    RT_VIEWPRINT 23, 25   '@374d4
    RT_CLS 2   '@374e6
    RT_VIEWPRINT 1, 25   '@374f4
    LOCATE 22, 1   '@37506
    PRINT RT_STRINGC$((34), (95)); "  V I G A S  "; RT_STRINGC$((33), (95));   '@37521 DS:3560
    IF NOT (V_0e40% = 0) THEN GOTO L_375b7   '@37555
    LOCATE 24, 1   '@37564
    PRINT " Aguarde ..."   '@3757f DS:3572
    GOSUB L_3af87   '@3758d
    GOSUB L_3ab02   '@3759a
    V_0e40% = 1   '@375a7
L_375b7:
    LOCATE 24, 1   '@375b7
    PRINT "  <N>ivel   <J>untar   <S>eparar   <R>edesenhar   <G>eracao .VIG .RLP    <F>im";   '@375d2 DS:3582
L_375e5:   ' entrada vinda de 03986e_F_3986e
    CALL MIXT_07f1_LimpaTeclado   '@375ea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@375f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP3a$ = V_0f18$   '@37610
    IF NOT (L_BP3a$ <> "J") THEN GOTO L_3764b   '@37622 DS:35d4
    IF NOT (L_BP3a$ = "j") THEN GOTO L_3833d   '@37639 DS:35da
L_3764b:
L_37650:
    RT_VIEWPRINT 23, 25   '@37655
    RT_CLS 2   '@37667
    RT_VIEWPRINT 1, 25   '@37675
    LOCATE 24, 1   '@37687
    PRINT " Numero da primeira Viga *FIM* ";   '@376a2 DS:35e0
    CALL MIXT_07f1_LimpaTeclado   '@376b0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@376ba DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_376f1   '@376d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_374cf   '@376e9
L_376f1:
    V_0ef0! = VAL(V_0f18$)   '@376f1
    IF NOT (FX##(A_11b2%(0, 0)) + V_0e5c! < FX##(V_0ef0!) OR V_0ef0! <= V_0e5c!) THEN GOTO L_37777   '@3770b
    BEEP   '@37765
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@3776f
L_37777:
    V_0ef0! = FX##(V_0ef0!) - V_0e5c!   '@37777
L_37792:
    LOCATE 24, 42   '@37797
    PRINT "Numero da segunda Viga *RETORNA* ";   '@377b5 DS:3604
    CALL MIXT_07f1_LimpaTeclado   '@377c3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@377cd DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_37804   '@377e7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@377fc
L_37804:
    L_BP3e! = VAL(V_0f18$)   '@37804
    IF NOT (L_BP3e! = V_0ef0! OR (FX##(A_11b2%(0, 0)) + V_0e5c! < FX##(L_BP3e!) OR L_BP3e! <= V_0e5c!)) THEN GOTO L_378a1   '@3781d
    BEEP   '@3788f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37792   '@37899
L_378a1:
    L_BP3e! = FX##(L_BP3e!) - V_0e5c!   '@378a1
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2) <> A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1) AND A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1) <> A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2)) THEN GOTO L_3795a   '@378b5
    BEEP   '@37943
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@3794d
L_3795a:
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 0) <> A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 0) AND A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 0) = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 0)) THEN GOTO L_37a54   '@3795a
    BEEP   '@37a42
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@37a4c
L_37a54:
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 0) <> A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 0) AND A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 0) = A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 0)) THEN GOTO L_37b4e   '@37a54
    BEEP   '@37b3c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@37b46
L_37b4e:
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 1) <> A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 1) AND A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 1) = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 1)) THEN GOTO L_37c4c   '@37b4e
    BEEP   '@37c3a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@37c44
L_37c4c:
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 1) <> A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 1) AND A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 1) = A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 1)) THEN GOTO L_37d4a   '@37c4c
    BEEP   '@37d38
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@37d42
L_37d4a:
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 0) <> A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 0) AND A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 0) <> A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 0)) THEN GOTO L_38015   '@37d4a
    V_0ef4# = (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 1)) - A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 1)) / (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 0)) - A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 0))   '@37e32
    V_0efc# = (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 1)) - A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 1)) / (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2), 0)) - A_1070!(A_11b2%(RT_CINT%(FX##(L_BP3e!)), 1), 0))   '@37f01
    IF NOT (ABS(FX##(V_0ef4#) - V_0efc#) * 180.0# / V_0e68_pi# > FX##(3.0#)) THEN GOTO L_38010   '@37fcc DS:362a,3632
    BEEP   '@37ff9
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@38003
L_38010:
L_38015:
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1) = A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2)) THEN GOTO L_38072   '@38015
    V_0f14! = V_0ef0!   '@38059
    GOTO L_38087   '@3806a
L_38072:
    V_0f14! = L_BP3e!   '@38072
L_38087:
    V_0ee8! = V_14be!   '@38087
    CALL MIXT_0877_Menor(V_0ef0!, L_BP3e!, L_BP42!)   '@38098
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46! = A_11b2%(0, 0)   '@380ae
    FOR V_0f10! = L_BP42! TO L_BP46!   '@380cd DS:30b4
    GOSUB L_3ab89   '@380d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@380e1 DS:30b4
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_38166   '@38109
    A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2) = A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2)   '@38124
    GOTO L_381a0   '@3815e
L_38166:
    A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2) = A_11b2%(RT_CINT%(FX##(L_BP3e!)), 2)   '@38166
L_381a0:
    L_BP4a! = A_11b2%(0, 0)   '@381a0
    FOR V_0f0c! = FX##(V_0f14!) + 1.0 TO L_BP4a!   '@381c4 DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0f0c!) - 1.0), 1) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1)   '@381d0 DS:3242
    A_11b2%(RT_CINT%(FX##(V_0f0c!) - 1.0), 2) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 2)   '@38216 DS:3242
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@38256 DS:30b4
    A_11b2%(0, 0) = A_11b2%(0, 0) - 1   '@38281
    V_0ee8! = L_BP2e!   '@382ad
    CALL MIXT_0877_Menor(V_0ef0!, L_BP3e!, L_BP4e!)   '@382bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52! = A_11b2%(0, 0)   '@382d3
    FOR V_0f10! = L_BP4e! TO L_BP52!   '@382f2 DS:30b4
    GOSUB L_3ab89   '@382f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@38305 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_37650   '@3832d
L_3833d:
    IF NOT (L_BP3a$ <> "S") THEN GOTO L_38361   '@3833d DS:30d8
    IF NOT (L_BP3a$ = "s") THEN GOTO L_39132   '@3834f DS:33d0
L_38361:
L_38366:
    RT_VIEWPRINT 23, 25   '@3836b
    RT_CLS 2   '@3837d
    RT_VIEWPRINT 1, 25   '@3838b
    LOCATE 24, 1   '@3839d
    PRINT " Numero da Viga que sera Separada *FIM* ";   '@383b8 DS:363a
    CALL MIXT_07f1_LimpaTeclado   '@383c6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@383d0 DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_38407   '@383ea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_374cf   '@383ff
L_38407:
    V_0ef0! = VAL(V_0f18$)   '@38407
    IF NOT (FX##(A_11b2%(0, 0)) + V_0e5c! < FX##(V_0ef0!) OR V_0ef0! <= V_0e5c!) THEN GOTO L_3848d   '@38421
    BEEP   '@3847b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_38366   '@38485
L_3848d:
    V_0ef0! = FX##(V_0ef0!) - V_0e5c!   '@3848d
    L_BP0e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 0)   '@384a3
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 1), 1)   '@384df
    L_BP12! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 0)   '@3851c
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2), 1)   '@38555
    L_BP3e! = 0.0   '@3858f DS:307c
    V_0f14! = 1.0   '@3859f DS:30b4
L_385b5:
L_385c0:
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP0e! AND L_BP0e! = L_BP12!) THEN GOTO L_38704   '@385c0
    CALL MIXT_0877_Menor(L_BP16!, L_BP1a!, L_BP56!)   '@38616
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP16!, L_BP1a!, L_BP5a!)   '@3862c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) < L_BP5a! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 1) > L_BP56!) THEN GOTO L_386ff   '@3863e
    L_BP3e! = 1.0   '@386aa DS:30b4
    L_BP5e! = 9.0   '@386ba DS:30a4
    L_BP62! = 0.0   '@386ca DS:307c
    V_0f1c$ = CHR$(26)   '@386da
    GOTO L_38ad4   '@386f2
L_386ff:
L_38704:
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP16! AND L_BP16! = L_BP1a!) THEN GOTO L_38847   '@38704
    CALL MIXT_0877_Menor(L_BP0e!, L_BP12!, L_BP66!)   '@3875b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP6a!)   '@38771
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) < L_BP6a! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) > L_BP66!) THEN GOTO L_38842   '@38783
    L_BP3e! = 1.0   '@387ed DS:30b4
    L_BP5e! = 4.0   '@387fd DS:3666
    L_BP62! = 4.0   '@3880d DS:3666
    V_0f1c$ = CHR$(25)   '@3881d
    GOTO L_38ad4   '@38835
L_38842:
L_38847:
    IF NOT (L_BP16! <> L_BP1a! AND L_BP0e! <> L_BP12!) THEN GOTO L_38a93   '@38847
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) <> L_BP12! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) <> L_BP0e!) THEN GOTO L_38a8e   '@38881
    IF NOT (ABS((FX##(L_BP1a!) - A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(L_BP12!) - A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - L_BP16!) / (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - L_BP0e!)) < FX##(V_133e!)) THEN GOTO L_38a89   '@388f1
    CALL MIXT_0877_Menor(L_BP0e!, L_BP12!, L_BP6e!)   '@3899d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP72!)   '@389b3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) < L_BP72! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) > L_BP6e!) THEN GOTO L_38a84   '@389c5
    L_BP3e! = 1.0   '@38a2f DS:30b4
    L_BP5e! = 4.0   '@38a3f DS:3666
    L_BP62! = 4.0   '@38a4f DS:3666
    V_0f1c$ = CHR$(25)   '@38a5f
    GOTO L_38ad4   '@38a77
L_38a84:
L_38a89:
L_38a8e:
L_38a93:
    V_0f14! = FX##(V_0f14!) + 1.0   '@38a93 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1070!(0, 0) < V_0f14!) THEN GOTO L_385c0   '@38aa9
L_38ad4:
    IF NOT (L_BP3e! = 0.0) THEN GOTO L_38b00   '@38ad4 DS:307c
    BEEP   '@38aee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_38366   '@38af8
L_38b00:
    IF NOT (A_1070!(0, 0) < V_0f14!) THEN GOTO L_38b43   '@38b00
    V_0f14! = 1.0   '@38b2a DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_385b5   '@38b3b
L_38b43:
    V_0ef4# = A_1070!(RT_CINT%(FX##(V_0f14!)), 0)   '@38b43
    V_0efc# = A_1070!(RT_CINT%(FX##(V_0f14!)), 1)   '@38b6d
    LOCATE 25, 1   '@38b98
    PRINT " Separo neste Local  <S>im  <*P*>roximo  <F>im";   '@38bb3 DS:366a
    CALL MIXT_07f1_LimpaTeclado   '@38bc1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GCAIXA RT_SNG!(FX##(V_14d4!) - L_BP5e! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!), RT_SNG!(169.0 - FX##(L_BP62!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@38bcb DS:30de
    L_BP76! = FX##(V_14d4!) - L_BP5e! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@38c55
    L_BP7a! = 169.0 - FX##(L_BP62!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba!   '@38c82 DS:30de
    L_BP7e$ = "CGA"   '@38cad DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BP76!, L_BP7a!, V_0f1c$, L_BP7e$)   '@38cba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @38ccf libera strings locais (L_BP7e)
    V_0f18$ = RT_INPUT$(1)   '@38cd8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - L_BP5e! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(L_BP62!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@38cf4 DS:32e6
    L_BP82$ = V_0f18$   '@38d75
    IF NOT (L_BP82$ <> "S") THEN GOTO L_38db3   '@38d88 DS:30d8
    IF NOT (L_BP82$ = "s") THEN GOTO L_39096   '@38da0 DS:33d0
L_38db3:
    L_BP86! = V_0ef0!   '@38db3
    FOR V_0f10! = A_11b2%(0, 0) TO L_BP86! STEP -1.0   '@38dc4 DS:3242
    V_0ee8! = V_14be!   '@38de0
    GOSUB L_3ab89   '@38df1
    IF NOT (V_0f10! > V_0ef0!) THEN GOTO L_38ea4   '@38dfe
    A_11b2%(RT_CINT%(FX##(V_0f10!) + 1.0), 1) = A_11b2%(RT_CINT%(FX##(V_0f10!)), 1)   '@38e19 DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0f10!) + 1.0), 2) = A_11b2%(RT_CINT%(FX##(V_0f10!)), 2)   '@38e5f DS:30b4
L_38ea4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@38ea4 DS:3242
    A_11b2%(0, 0) = A_11b2%(0, 0) + 1   '@38ed0
    A_1184$(A_11b2%(0, 0)) = LTRIM$(STR$(A_11b2%(0, 0)))   '@38efc
    A_11b2%(A_11b2%(0, 0), 0) = 2   '@38f45
    A_11b2%(RT_CINT%(FX##(V_0ef0!) + 1.0), 2) = A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2)   '@38f6f DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0ef0!)), 2) = RT_CINT%(FX##(V_0f14!))   '@38faf
    A_11b2%(RT_CINT%(FX##(V_0ef0!) + 1.0), 1) = RT_CINT%(FX##(V_0f14!))   '@38fdd DS:30b4
    L_BP8a! = A_11b2%(0, 0)   '@39013
    FOR V_0f10! = V_0ef0! TO L_BP8a!   '@39038 DS:30b4
    V_0ee8! = L_BP2e!   '@39040
    GOSUB L_3ab89   '@39050
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3905d DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_38366   '@39086
L_39096:
    IF NOT (L_BP82$ <> "F") THEN GOTO L_390bc   '@39096 DS:33d6
    IF NOT (L_BP82$ = "f") THEN GOTO L_390cc   '@390a9 DS:33dc
L_390bc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_38366   '@390bc
L_390cc:
    V_0f14! = FX##(V_0f14!) + 1.0   '@390d1 DS:30b4
    IF NOT (A_1070!(0, 0) < V_0f14!) THEN GOTO L_39122   '@390e7
    V_0f14! = 1.0   '@39111 DS:30b4
L_39122:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_385b5   '@39122
L_39132:
    IF NOT (L_BP3a$ <> "N") THEN GOTO L_39156   '@39132 DS:32ce
    IF NOT (L_BP3a$ = "n") THEN GOTO L_3943e   '@39144 DS:369c
L_39156:
    V_0f14! = 0.0   '@39156 DS:307c
    RT_VIEWPRINT 23, 25   '@39167
    RT_CLS 2   '@39179
    RT_VIEWPRINT 1, 25   '@39187
    LOCATE 24, 1   '@39199
    PRINT " Nivel das Vigas para numeracao *"; LTRIM$(STR$(V_0e5c!)); "* ";   '@391b4 DS:3284,36a2
    CALL MIXT_07f1_LimpaTeclado   '@391e4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@391ee DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef0! = V_0e5c!   '@39208
    L_BP8c% = (VAL(V_0f18$) > 0.0#)   '@39219 DS:328a
    IF NOT ((V_0f18$ = "0" OR L_BP8c%) <> 0) THEN GOTO L_39292   '@3924c DS:36c8
    V_0ef0! = VAL(V_0f18$)   '@39262
    V_0f14! = 1.0   '@3927c DS:30b4
L_39292:
    PRINT " Denominacao utilizada *"; V_0e60$; "* ";   '@39292 DS:3284,36ce
    CALL MIXT_07f1_LimpaTeclado   '@392b2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@392bc DS:3108 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f1c$ = V_0e60$   '@392d6
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_39325   '@392e8
    V_0f1c$ = V_0f18$   '@392fd
    V_0f14! = 1.0   '@3930f DS:30b4
L_39325:
    L_BP90! = A_11b2%(0, 0)   '@39325
    FOR V_0f10! = 1.0 TO L_BP90!   '@3934a DS:30b4
    V_0ee8! = V_14be!   '@39352
    GOSUB L_3ab89   '@39363
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@39370 DS:30b4
    V_0e5c! = V_0ef0!   '@39399
    V_0e60$ = V_0f1c$   '@393aa
    L_BP94! = A_11b2%(0, 0)   '@393bc
    FOR V_0f10! = 1.0 TO L_BP94!   '@393e1 DS:30b4
    V_0ee8! = L_BP2e!   '@393e8
    GOSUB L_3ab89   '@393f8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@39405 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_374cf   '@3942e
L_3943e:
    IF NOT (L_BP3a$ <> "R") THEN GOTO L_39462   '@3943e DS:33e2
    IF NOT (L_BP3a$ = "r") THEN GOTO L_394a4   '@39450 DS:33e8
L_39462:
    L_BP96% = 0   '@39462
    GOSUB L_39f10   '@3946d
    GOSUB L_3a094   '@3947a
    GOSUB L_3ab02   '@39487
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_375e5   '@39494
L_394a4:
    IF NOT (L_BP3a$ <> "G") THEN GOTO L_394c8   '@394a4 DS:36ea
    IF NOT (L_BP3a$ = "g") THEN GOTO L_3980b   '@394b6 DS:36f0
L_394c8:
    RT_VIEWPRINT 23, 25   '@394c8
    RT_CLS 2   '@394da
    RT_VIEWPRINT 1, 25   '@394e8
    V_0ef0! = 0.0   '@394fa DS:307c
    L_BP3e! = 1.0   '@3950b DS:30b4
L_39520:
    IF NOT (A_10cc!(RT_CINT%(FX##(L_BP3e!)), 5) = 0.0 AND (A_10cc!(RT_CINT%(FX##(L_BP3e!)), 1) = 3.0 OR A_10cc!(RT_CINT%(FX##(L_BP3e!)), 1) = 0.0)) THEN GOTO L_395d9   '@39520 DS:307c,3526
    V_0ef0! = 1.0   '@395c8 DS:30b4
L_395d9:
    L_BP3e! = FX##(L_BP3e!) + 1.0   '@395d9 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(0, 0) < L_BP3e!) THEN GOTO L_39520   '@395ed
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_396ac   '@3961a DS:30b4
    LOCATE 24, 1   '@39635
    PRINT " Existem Lajes a serem calculadas sem peso proprio.  Continuo  N/*S* ";   '@39650 DS:36f6
    CALL MIXT_07f1_LimpaTeclado   '@3965e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@39668 DS:3108
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_396a7   '@39682 DS:32ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_374cf   '@3969f
L_396a7:
L_396ac:
    IF NOT (V_120e% = 0) THEN GOTO L_3971c   '@396ac
    LOCATE 23, 1   '@396bb
    PRINT " ATENCAO !     Caso o arquivo de Vigas seja Gerado apos as consideracoes de "   '@396d6 DS:3740
    PRINT "               Continuidade,  a Distribuicao de Cargas sera Alterada ."; RT_TAB$(79); ""; " "   '@396e4 DS:3108,3520,3790
    BEEP   '@3970d
L_3971c:
    LOCATE 25, 1   '@3971c
    PRINT " Confirme prosseguir para montagem dos arquivos .VIG e .RLP  N/*S* ";   '@39737 DS:37da
    CALL MIXT_07f1_LimpaTeclado   '@39745
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@3974f DS:3108 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_3978e   '@39769 DS:32ce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_374cf   '@39786
L_3978e:
    V_0f18$ = "MONTAGEM"   '@3978e DS:3822
    RT_VIEWPRINT 23, 25   '@397a0
    RT_CLS 2   '@397b2
    RT_VIEWPRINT 1, 25   '@397c0
    LOCATE 24, 1   '@397d2
    PRINT " Aguarde .."   '@397ed DS:382e
    GOTO L_3c976   '@397fb
L_3980b:
    IF NOT (L_BP3a$ <> "F") THEN GOTO L_3982f   '@3980b DS:33d6
    IF NOT (L_BP3a$ = "f") THEN GOTO L_39866   '@3981d DS:33dc
L_3982f:
    RT_SCREEN 0   '@3982f
    V_0f18$ = "FIM"   '@39844 DS:3448
    GOTO L_3c976   '@39856
L_39866:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_375e5   '@39866
    ' ---- F_3986e @0x3986e  (03986e_F_3986e.lift.txt; evidence_id (assembly): ev_970ce6c1570321e4bc1ba28bcd59d969cee1006102de85920b57571b507b6040)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_375e5   '@39873
    ' ---- F_3987b @0x3987b  (03987b_F_3987b.lift.txt; evidence_id (assembly): ev_7d239725d62a7da162d1eb8a1bbff5d8c15cd5c76c508bb98e01bf12a62c05a3)
L_39880:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    V_0f18$ = ""   '@39885 DS:3108
    V_0f1c$ = ""   '@39897 DS:3108
    L_BP98% = (V_0dcc_placa$ = "EGA")   '@398a9 DS:3094
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP98%) <> 0) THEN GOTO L_398fb   '@398cf DS:309c
    COLOR 10   '@398e5
L_398fb:
    L_BP9c! = A_0f8a!(0, 0)   '@398fb
    FOR V_0f14! = 1.0 TO L_BP9c!   '@3991c DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_39cf9   '@39924
    L_BPa0! = 2.0   '@39996 DS:30b8
    L_BPa4! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@399a8 DS:30de
    L_BPa8$ = LTRIM$(STR$(V_0f14!))   '@399e3
    L_BPac$ = "CGA"   '@39a01 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BPa0!, L_BPa4!, L_BPa8$, L_BPac$)   '@39a0f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @39a28 libera strings locais (L_BPa8)
    ' @39a32 libera strings locais (L_BPac)
    L_BPb0! = A_0f8a!(0, 1)   '@39a3c
    FOR V_0f04! = 1.0 TO L_BPb0!   '@39a60 DS:30b4
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_39cb6   '@39a68
    IF NOT (V_0f18$ = "") THEN GOTO L_39c21   '@39adc DS:3108
    L_BPb4! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@39af3 DS:3532
    L_BPb8! = 165.0   '@39b33 DS:3536
    L_BPbc$ = CHR$(RT_CINT%(FX##(V_0f04!) + 26& * ((RT_CLNG&(FX##(V_0f04!)) \ 26&) * (V_0f04! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f04!) - 1.0) \ 26&), ("'"))   '@39b3f DS:3242,34d4,34d8,34e0
    L_BPc0$ = "CGA"   '@39bd4 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BPb4!, L_BPb8!, L_BPbc$, L_BPc0$)   '@39be2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @39bfb libera strings locais (L_BPbc)
    ' @39c05 libera strings locais (L_BPc0)
    V_0f1c$ = "*"   '@39c0f DS:3258
L_39c21:
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@39c21 DS:3536
L_39cb6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@39cb6 DS:30b4
    V_0f18$ = V_0f1c$   '@39ce2
L_39cf9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@39cf9 DS:30b4
    L_BPc2% = (V_0dcc_placa$ = "EGA")   '@39d25 DS:3094
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPc2%) <> 0) THEN GOTO L_39d7e   '@39d4b DS:309c
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@39d61
L_39d7e:
    RETURN   '@39d7e
L_39d8d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    L_BPc6! = A_0fb8!(0, 0)   '@39d92
    FOR V_0f10! = 1.0 TO L_BPc6!   '@39db3 DS:30b4
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@39dba DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(L_BP1e!)), 17476   '@39e40 DS:3536
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@39ed5 DS:30b4
    RETURN   '@39f01
L_39f10:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    L_BPca! = A_1042!(0, 0)   '@39f15
    FOR V_0f10! = 1.0 TO L_BPca!   '@39f36 DS:30b4
    RT_PSET RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@39f3e DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP26!)), 0   '@39fc4 DS:3536
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3a059 DS:30b4
    RETURN   '@3a085
L_3a094:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    V_0ee8! = L_BP2a!   '@3a099
    L_BPce! = A_1156!(0, 0)   '@3a0a9
    FOR V_0f10! = 1.0 TO L_BPce!   '@3a0ca DS:30b4
    GOSUB L_3a117   '@3a0d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3a0df DS:30b4
    RETURN   '@3a108
L_3a117:   ' sub-rotina (alvo de GOSUB)
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f10!)), 1) = A_1156!(RT_CINT%(FX##(V_0f10!)), 3) AND A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_3a2fa   '@3a11c
    RT_PSET RT_SNG!(FX##(V_14d4!) - 1.0 + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(164.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@3a1c0 DS:3242,353a
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) + 1.0 + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(1.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0), 40, RT_CINT%(FX##(V_0ee8!)), 0   '@3a24e DS:30b4,3536
    GOTO L_3aaf3   '@3a2f2
L_3a2fa:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f10!)), 0) = A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_3a36f   '@3a2fa
    V_0ef4# = 0.5#   '@3a345 DS:353e
    V_0efc# = 0.0#   '@3a356 DS:328a
    GOTO L_3a4a8   '@3a367
L_3a36f:
    V_0ef4# = RT_SIN##(ATN((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) / (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 0)))) * 0.300000011920928955078125##   '@3a36f DS:3546
    V_0efc# = RT_COS##(ATN((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) / (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - A_1156!(RT_CINT%(FX##(V_0f10!)), 0)))) * 0.300000011920928955078125##   '@3a409 DS:3546
L_3a4a8:
    RT_PSET RT_SNG!(V_14d4! - 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba! + 165.0#), 0, 0   '@3a4a8 DS:354a,3552
    RT_LINE 0, 0, RT_SNG!(V_14d4! - 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0#), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3a54b DS:354a,3552
    RT_PSET RT_SNG!(FX##(V_14d4!) - V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba! + 165.0#), 0, 0   '@3a5fe DS:3552
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) - V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba! + 165.0#), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3a694 DS:3552
    RT_PSET RT_SNG!((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@3a73a DS:3536
    RT_LINE 0, 0, RT_SNG!((FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3a7c0 DS:3536
    RT_PSET RT_SNG!(FX##(V_14d4!) + V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@3a856 DS:3552
    RT_LINE 0, 0, RT_SNG!(FX##(V_14d4!) + V_0ef4# + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3a8ec DS:3552
    RT_PSET RT_SNG!(V_14d4! + 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - 2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@3a992 DS:354a,3552
    RT_LINE 0, 0, RT_SNG!(V_14d4! + 2.0# * FX##(V_0ef4#) + (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6!), RT_SNG!(165.0# - 2.0# * FX##(V_0efc#) - V_14d8! - (FX##(A_1156!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@3aa38 DS:354a,3552
L_3aaf3:
    RETURN   '@3aaf3
L_3ab02:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    V_0ee8! = L_BP2e!   '@3ab07
    L_BPd2! = A_11b2%(0, 0)   '@3ab17
    FOR V_0f10! = 1.0 TO L_BPd2!   '@3ab3c DS:30b4
    GOSUB L_3ab89   '@3ab44
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3ab51 DS:30b4
    RETURN   '@3ab7a
L_3ab89:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    V_0f18$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1184$(RT_CINT%(FX##(V_0f10!))))) + V_0e5c!)))   '@3ab8e
    IF NOT (VAL(V_0f18$) > 0.0#) THEN GOTO L_3ac1c   '@3abdc DS:328a
    V_0f18$ = V_0e60$ + V_0f18$   '@3ac00
L_3ac1c:
    IF NOT (V_0ee8! = V_14be!) THEN GOTO L_3ac53   '@3ac1c
    V_0f18$ = "~" + V_0f18$   '@3ac37 DS:355a
L_3ac53:
    L_BP0e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3ac53
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3ac8f
    L_BP12! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 0)   '@3accc
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 1)   '@3ad05
    L_BP62! = 0.0   '@3ad3f DS:307c
    IF NOT (L_BP0e! = L_BP12!) THEN GOTO L_3adb6   '@3ad4f
    V_0ef4# = L_BP0e!   '@3ad68
    V_0efc# = (FX##(L_BP16!) + L_BP1a!) / 2.0   '@3ad78 DS:30b8
    L_BP62! = 4.0   '@3ad91 DS:3666
    L_BP5e! = 3.0   '@3ada1 DS:3526
L_3adb6:
    IF NOT (L_BP16! = L_BP1a!) THEN GOTO L_3ae44   '@3adb6
    V_0ef4# = (FX##(L_BP0e!) + L_BP12!) / 2.0   '@3adcf DS:30b8
    V_0efc# = L_BP16!   '@3ade8
    L_BPd4% = (RT_MID$((V_0f18$), (1), (1)) = "~")   '@3adf8 DS:355a
    L_BP5e! = -(LEN(V_0f18$) + L_BPd4%) * 4   '@3ae25
L_3ae44:
    IF NOT (L_BP16! <> L_BP1a! AND L_BP0e! <> L_BP12!) THEN GOTO L_3aeee   '@3ae44
    V_0ef4# = (FX##(L_BP0e!) + L_BP12!) / 2.0   '@3ae7e DS:30b8
    V_0efc# = (FX##(L_BP16!) + L_BP1a!) / 2.0   '@3ae97 DS:30b8
    IF NOT (L_BP16! < L_BP1a!) THEN GOTO L_3aed9   '@3aeb0
    L_BP62! = 4.0   '@3aec9 DS:3666
L_3aed9:
    L_BP5e! = 3.0   '@3aed9 DS:3526
L_3aeee:
    L_BPd8! = FX##(L_BP5e!) + V_14d4! + (FX##(V_0ef4#) - V_14e4!) * V_14b6!   '@3aeee
    L_BPdc! = FX##(L_BP62!) - V_14d8! - (FX##(V_0efc#) - V_14e8!) * V_14ba! + 165.0#   '@3af1c DS:3552
    L_BPe0$ = "CGA"   '@3af48 DS:3080
    CALL MIXT_08c4_TextoGrafico(L_BPd8!, L_BPdc!, V_0f18$, L_BPe0$)   '@3af56
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3af6e libera strings locais (L_BPe0)
    RETURN   '@3af78
L_3af87:   ' sub-rotina (alvo de GOSUB); entrada vinda de 036ea2_FUN_3000_6ea2
    L_BPe4! = A_1042!(0, 0)   '@3af8c
    FOR V_0f10! = 1.0 TO L_BPe4!   '@3afad DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0f10!)), 0) = 2   '@3afb4
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f10!)), 0) = A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_3b0ba   '@3afd6
    V_0f0c! = 0.0   '@3b021 DS:307c
    L_BP3e! = 2.0   '@3b032 DS:30b8
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f10!)), 1) > A_1042!(RT_CINT%(FX##(V_0f10!)), 3)) THEN GOTO L_3b0b2   '@3b042
    V_0f0c! = 2.0   '@3b091 DS:30b8
    L_BP3e! = 0.0   '@3b0a2 DS:307c
L_3b0b2:
    GOTO L_3b14c   '@3b0b2
L_3b0ba:
    V_0f0c! = 0.0   '@3b0ba DS:307c
    L_BP3e! = 2.0   '@3b0cb DS:30b8
    IF NOT (A_1042!(RT_CINT%(FX##(V_0f10!)), 0) > A_1042!(RT_CINT%(FX##(V_0f10!)), 2)) THEN GOTO L_3b147   '@3b0db
    V_0f0c! = 2.0   '@3b126 DS:30b8
    L_BP3e! = 0.0   '@3b137 DS:307c
L_3b147:
L_3b14c:
    L_BPe8! = A_1070!(0, 0)   '@3b14c
    FOR V_0f14! = 1.0 TO L_BPe8!   '@3b16d DS:30b4
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_0f0c!) + 1.0)) AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(V_0f0c!)))) THEN GOTO L_3b26c   '@3b174 DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0f10!)), 1) = RT_CINT%(FX##(V_0f14!))   '@3b22e
    GOTO L_3b298   '@3b25f
L_3b26c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@3b26c DS:30b4
L_3b298:
    L_BPec! = A_1070!(0, 0)   '@3b298
    FOR V_0f14! = 1.0 TO L_BPec!   '@3b2b9 DS:30b4
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) = A_1042!(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(L_BP3e!) + 1.0)) AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = A_1042!(RT_CINT%(FX##(V_0f10!)), RT_CINT%(FX##(L_BP3e!)))) THEN GOTO L_3b3b3   '@3b2c0 DS:30b4
    A_11b2%(RT_CINT%(FX##(V_0f10!)), 2) = RT_CINT%(FX##(V_0f14!))   '@3b378
    GOTO L_3b3df   '@3b3a6
L_3b3b3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@3b3b3 DS:30b4
L_3b3df:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3b3df DS:30b4
    A_11b2%(0, 0) = RT_CINT%(FX##(A_1042!(0, 0)))   '@3b40b
    V_0f10! = 1.0   '@3b440 DS:30b4
L_3b456:
L_3b45b:
    L_BP0e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3b460
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3b49c
    L_BP12! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 0)   '@3b4d9
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 1)   '@3b512
    L_BPf0! = A_1156!(0, 0)   '@3b54c
    FOR V_0f0c! = 1.0 TO L_BPf0!   '@3b56d DS:30b4
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = L_BP0e! AND (A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) AND L_BP0e! = L_BP12!)) THEN GOTO L_3b7f0   '@3b574
    CALL MIXT_0877_Menor(L_BP16!, L_BP1a!, L_BPf4!)   '@3b617
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf8! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 1)   '@3b62f
    L_BPfc! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 3)   '@3b655
    CALL MIXT_0877_Menor(L_BPf8!, L_BPfc!, L_BP100!)   '@3b67a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 3) = L_BPfc!   '@3b68f
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 1) = L_BPf8!   '@3b6b5
    CALL MIXT_082a_Maior(L_BP16!, L_BP1a!, L_BP104!)   '@3b6da
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP108! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 1)   '@3b6ed
    L_BP10c! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 3)   '@3b713
    CALL MIXT_082a_Maior(L_BP108!, L_BP10c!, L_BP110!)   '@3b738
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 3) = L_BP10c!   '@3b74d
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 1) = L_BP108!   '@3b773
    IF NOT (L_BP104! <= L_BP110! AND L_BPf4! >= L_BP100!) THEN GOTO L_3b7eb   '@3b799
    GOSUB L_3c7f8   '@3b7d1
    GOTO L_3be84   '@3b7de
L_3b7eb:
L_3b7f0:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f0c!)), 1) = L_BP16! AND (A_1156!(RT_CINT%(FX##(V_0f0c!)), 1) = A_1156!(RT_CINT%(FX##(V_0f0c!)), 3) AND L_BP16! = L_BP1a!)) THEN GOTO L_3ba61   '@3b7f0
    CALL MIXT_0877_Menor(L_BP0e!, L_BP12!, L_BP114!)   '@3b898
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP118! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)   '@3b8b0
    L_BP11c! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3b8d5
    CALL MIXT_0877_Menor(L_BP118!, L_BP11c!, L_BP120!)   '@3b8f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) = L_BP11c!   '@3b90c
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = L_BP118!   '@3b92f
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP124!)   '@3b953
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP128! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)   '@3b966
    L_BP12c! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3b98b
    CALL MIXT_082a_Maior(L_BP128!, L_BP12c!, L_BP130!)   '@3b9ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) = L_BP12c!   '@3b9c2
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = L_BP128!   '@3b9e5
    IF NOT (L_BP124! <= L_BP130! AND L_BP114! >= L_BP120!) THEN GOTO L_3ba5c   '@3ba0a
    GOSUB L_3c7f8   '@3ba42
    GOTO L_3be84   '@3ba4f
L_3ba5c:
L_3ba61:
    IF NOT (L_BP16! <> L_BP1a! AND (A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) <> A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) AND L_BP0e! <> L_BP12!)) THEN GOTO L_3be58   '@3ba61
    IF NOT (ABS((FX##(L_BP1a!) - L_BP16!) / (FX##(L_BP12!) - L_BP0e!) - (FX##(A_1156!(RT_CINT%(FX##(V_0f0c!)), 3)) - A_1156!(RT_CINT%(FX##(V_0f0c!)), 1)) / (FX##(A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)) - A_1156!(RT_CINT%(FX##(V_0f0c!)), 0))) < FX##(V_133e!)) THEN GOTO L_3be53   '@3bae8
    V_0ef4# = L_BP12!   '@3bb92
    V_0efc# = L_BP1a!   '@3bba2
    IF NOT (FX##(A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)) = FX##(V_0ef4#)) THEN GOTO L_3bc06   '@3bbb2
    V_0ef4# = L_BP0e!   '@3bbe6
    V_0efc# = L_BP16!   '@3bbf6
L_3bc06:
    IF NOT (ABS((FX##(L_BP1a!) - L_BP16!) / (FX##(L_BP12!) - L_BP0e!) - (FX##(V_0efc#) - A_1156!(RT_CINT%(FX##(V_0f0c!)), 1)) / (FX##(V_0ef4#) - A_1156!(RT_CINT%(FX##(V_0f0c!)), 0))) < FX##(V_133e!)) THEN GOTO L_3be4e   '@3bc06
    CALL MIXT_0877_Menor(L_BP0e!, L_BP12!, L_BP134!)   '@3bc85
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP138! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)   '@3bc9d
    L_BP13c! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3bcc2
    CALL MIXT_0877_Menor(L_BP138!, L_BP13c!, L_BP140!)   '@3bce4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) = L_BP13c!   '@3bcf9
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = L_BP138!   '@3bd1c
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP144!)   '@3bd40
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP148! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)   '@3bd53
    L_BP14c! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3bd78
    CALL MIXT_082a_Maior(L_BP148!, L_BP14c!, L_BP150!)   '@3bd9a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 2) = L_BP14c!   '@3bdaf
    A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = L_BP148!   '@3bdd2
    IF NOT (L_BP144! <= L_BP150! AND L_BP134! >= L_BP140!) THEN GOTO L_3be49   '@3bdf7
    GOSUB L_3c7f8   '@3be2f
    GOTO L_3be84   '@3be3c
L_3be49:
L_3be4e:
L_3be53:
L_3be58:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@3be58 DS:30b4
L_3be84:
    IF NOT (FX##(A_1156!(0, 0)) + 1.0 > FX##(V_0f0c!) AND A_11b2%(0, 0) > 0) THEN GOTO L_3bee1   '@3be84 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b45b   '@3bed9
L_3bee1:
    V_0f10! = FX##(V_0f10!) + 1.0   '@3bee1 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_11b2%(0, 0) < V_0f10!) THEN GOTO L_3b456   '@3bef7
    L_BP152% = 1   '@3bf25
L_3bf35:
    V_0efc# = -1.0#   '@3bf3a DS:352a
    V_0ef4# = -1.0#   '@3bf4b DS:352a
    V_0f14! = -1.0   '@3bf5c DS:3242
    L_BP156! = A_11b2%(0, 0)   '@3bf6d
    FOR V_0f10! = L_BP152% TO L_BP156!   '@3bf91 DS:30b4
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1) = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 1)) THEN GOTO L_3c236   '@3bf9e
    IF NOT (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)) = FX##(V_0efc#)) THEN GOTO L_3c135   '@3c010
    IF NOT (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)) < FX##(V_0ef4#)) THEN GOTO L_3c130   '@3c058
    V_0f14! = V_0f10!   '@3c09f
    V_0ef4# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3c0b0
    V_0efc# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3c0ed
L_3c130:
L_3c135:
    IF NOT (V_0efc# = -1.0# OR FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)) > FX##(V_0efc#)) THEN GOTO L_3c231   '@3c135 DS:352a
    V_0f14! = V_0f10!   '@3c1a0
    V_0ef4# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3c1b1
    V_0efc# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3c1ee
L_3c231:
L_3c236:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3c236 DS:30b4
    IF NOT (V_0f14! <> -1.0) THEN GOTO L_3c349   '@3c262 DS:3242
    IF NOT (L_BP152% < V_0f14!) THEN GOTO L_3c312   '@3c27d
    SWAP A_11b2%(RT_CINT%(FX##(V_0f14!)), 1), A_11b2%(L_BP152%, 1)   '@3c29c
    SWAP A_11b2%(RT_CINT%(FX##(V_0f14!)), 2), A_11b2%(L_BP152%, 2)   '@3c2d9
L_3c312:
    L_BP152% = L_BP152% + 1   '@3c312
    IF NOT (A_11b2%(0, 0) >= L_BP152%) THEN GOTO L_3c344   '@3c31b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3bf35   '@3c33c
L_3c344:
L_3c349:
L_3c34e:
    V_0efc# = -1.0#   '@3c353 DS:352a
    V_0ef4# = -1.0#   '@3c364 DS:352a
    V_0f14! = -1.0   '@3c375 DS:3242
    L_BP15a! = A_11b2%(0, 0)   '@3c386
    FOR V_0f10! = L_BP152% TO L_BP15a!   '@3c3aa DS:30b4
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0) = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 2), 0)) THEN GOTO L_3c64b   '@3c3b6
    IF NOT (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)) = FX##(V_0ef4#)) THEN GOTO L_3c54b   '@3c426
    IF NOT (FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)) < FX##(V_0efc#)) THEN GOTO L_3c546   '@3c46d
    V_0f14! = V_0f10!   '@3c4b5
    V_0ef4# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3c4c6
    V_0efc# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3c503
L_3c546:
L_3c54b:
    IF NOT (V_0ef4# = -1.0# OR FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)) < FX##(V_0ef4#)) THEN GOTO L_3c646   '@3c54b DS:352a
    V_0f14! = V_0f10!   '@3c5b5
    V_0ef4# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@3c5c6
    V_0efc# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@3c603
L_3c646:
L_3c64b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3c64b DS:30b4
    IF NOT (V_0f14! <> -1.0) THEN GOTO L_3c75e   '@3c677 DS:3242
    IF NOT (L_BP152% < V_0f14!) THEN GOTO L_3c727   '@3c692
    SWAP A_11b2%(RT_CINT%(FX##(V_0f14!)), 1), A_11b2%(L_BP152%, 1)   '@3c6b1
    SWAP A_11b2%(RT_CINT%(FX##(V_0f14!)), 2), A_11b2%(L_BP152%, 2)   '@3c6ee
L_3c727:
    L_BP152% = L_BP152% + 1   '@3c727
    IF NOT (A_11b2%(0, 0) >= L_BP152%) THEN GOTO L_3c759   '@3c730
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3c34e   '@3c751
L_3c759:
L_3c75e:
    L_BP15e! = A_11b2%(0, 0)   '@3c75e
    FOR V_0f10! = 1.0 TO L_BP15e!   '@3c783 DS:30b4
    A_1184$(RT_CINT%(FX##(V_0f10!))) = LTRIM$(STR$(V_0f10!))   '@3c78a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@3c7c0 DS:30b4
    RETURN   '@3c7e9
L_3c7f8:   ' sub-rotina (alvo de GOSUB)
    V_0f0c! = FX##(V_0f10!) + 1.0   '@3c7fd DS:30b4
L_3c818:
    IF NOT (A_11b2%(0, 0) >= V_0f0c!) THEN GOTO L_3c8e6   '@3c819
    A_11b2%(RT_CINT%(FX##(V_0f0c!) - 1.0), 1) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1)   '@3c841 DS:3242
    A_11b2%(RT_CINT%(FX##(V_0f0c!) - 1.0), 2) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 2)   '@3c887 DS:3242
    V_0f0c! = FX##(V_0f0c!) + 1.0   '@3c8c7 DS:30b4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3c818   '@3c8dd
L_3c8e6:
    IF NOT (A_11b2%(0, 0) = V_0f10!) THEN GOTO L_3c92a   '@3c8e6
    V_0f10! = FX##(V_0f10!) - 1.0   '@3c914 DS:3242
L_3c92a:
    A_11b2%(0, 0) = A_11b2%(0, 0) - 1   '@3c92a
    V_0f0c! = 0.0   '@3c956 DS:307c
    RETURN   '@3c967
L_3c976:   ' entrada vinda de 036ea2_FUN_3000_6ea2
    ' @3c976 libera strings locais (L_BP82)
    ' @3c980 libera strings locais (L_BP3a)
    ' @3c989 libera strings locais (L_BP32)
    ' END SUB   '@3c992
END SUB

SUB S_40137   ' entrada de SUB/FUNCTION (B$ENRA, locais 824 bytes) (0x40137)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1c%
    DIM L_BP20!
    DIM L_BP24$
    DIM L_BP28$
    DIM L_BP2c!
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
    ' ---- FUN_4000_0137 @0x40137  (040137_FUN_4000_0137.lift.txt; evidence_id (assembly): ev_19a15bd382107a4d3fb01989969cc73a77ead43c2735f966097aafc79ddb3c5c)
    IF NOT (V_0e36% = 0) THEN GOTO L_40160   '@40149
    GOTO L_494ed   '@40158
L_40160:
    IF NOT (A_0fb8!(0, 0) = 0.0) THEN GOTO L_40192   '@40160 DS:3840
    GOTO L_494ed   '@4018a
L_40192:
    REDIM A_14fa%(-32768 TO -32768)   '@40192
    REDIM A_14fa%(0 TO 480)   '@401a0
    IF NOT (V_0e38% = 0) THEN GOTO L_40254   '@401bd
    REDIM A_0fe6!(-32768 TO -32768, -32768 TO -32768)   '@401cc
    REDIM A_1014!(-32768 TO -32768, -32768 TO -32768)   '@401da
    REDIM A_0fe6!(0 TO V_0e46%, 0 TO 4)   '@401e3
    REDIM A_1014!(0 TO V_0e48%, 0 TO 1)   '@40202
    A_1014!(0, 0) = 1.0   '@40224 DS:3844
    V_0e38% = 1   '@40244
L_40254:
    L_BP24$ = V_0dcc_placa$   '@40254
    IF NOT (L_BP24$ = "HER") THEN GOTO L_402ec   '@40266 DS:3848
    RT_SCREEN 3   '@4027d
    L_BP12! = 7.0   '@40293 DS:3850
    L_BP0e! = 7.0   '@402a3 DS:3850
    L_BP16! = 7.0   '@402b3 DS:3850
    L_BP1a! = 7.0   '@402c3 DS:3850
    V_14be! = 0.0   '@402d3 DS:3840
    GOTO L_40425   '@402e4
L_402ec:
    IF NOT (L_BP24$ <> "CGA") THEN GOTO L_40310   '@402ec DS:3854
    IF NOT (L_BP24$ = "MCG") THEN GOTO L_4037c   '@402fe DS:385c
L_40310:
    RT_SCREEN 2   '@40310
    L_BP12! = 15.0   '@40323 DS:3864
    L_BP0e! = 15.0   '@40333 DS:3864
    L_BP16! = 15.0   '@40343 DS:3864
    L_BP1a! = 15.0   '@40353 DS:3864
    V_14be! = 0.0   '@40363 DS:3840
    GOTO L_40425   '@40374
L_4037c:
    IF NOT (L_BP24$ <> "EGA") THEN GOTO L_403a0   '@4037c DS:3868
    IF NOT (L_BP24$ = "VGA") THEN GOTO L_40425   '@4038e DS:3870
L_403a0:
    RT_SCREEN 9   '@403a0
    COLOR , 1   '@403b6
    L_BP12! = 9.0   '@403cc DS:3878
    L_BP0e! = 14.0   '@403dc DS:387c
    L_BP16! = 12.0   '@403ec DS:3880
    L_BP1a! = 16.0   '@403fc DS:3884
    V_14be! = 1.0   '@4040c DS:3844
    GOTO L_40425   '@4041d
L_40425:
    V_14c2% = 0   '@40425
    IF NOT (V_14f4% = 1) THEN GOTO L_40447   '@40430
    GOTO L_4052c   '@4043f
L_40447:
    V_14f6! = 2.0   '@40447 DS:3888
L_4045d:
    V_14e4! = A_0f8a!(1, 1)   '@40462
    V_14ec! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@40483
    V_14e8! = A_0f8a!(1, 0)   '@404c0
    V_14f0! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@404e3
    V_14f4% = 1   '@4051c
L_4052c:
    V_14cc! = V_14e4!   '@40531
    V_14d0! = V_14e8!   '@40542
    V_14c4! = V_14e4!   '@40553
    V_14c8! = V_14e8!   '@40564
    V_14b6! = 560.0 / (FX##(V_14ec!) - V_14e4!)   '@40575 DS:388c
    V_14ba! = 145.0 / (FX##(V_14f0!) - V_14e8!)   '@40593 DS:3890
    IF NOT (FX##(V_14ba!) / V_14b6! > 0.41670000553131103515625##) THEN GOTO L_405ef   '@405b1 DS:3894
    V_14ba! = V_14b6! * 0.41670000553131103515625##   '@405d1 DS:3894
    GOTO L_4060a   '@405e7
L_405ef:
    V_14b6! = V_14ba! / 0.41670000553131103515625##   '@405ef DS:3894
L_4060a:
L_4060f:
    RT_CLS -1   '@40614
    RT_WINDOW 1, (0), (0), (639), (199)   '@40622 DS:3840,3842,3898,389a,389c,389e (B$WIND decodificado)
    V_14d4! = 45.0   '@40650 DS:38a0
    V_14d8! = 10.0   '@40661 DS:38a4
    GOSUB L_47d41   '@40672
    GOSUB L_48a43   '@4067f
    IF NOT (A_0fe6!(0, 0) > 0.0) THEN GOTO L_408c7   '@4068c DS:3840
    GOSUB L_48bc6   '@406b6
    IF NOT (A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 3) <= V_14f0! AND (A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 3) >= V_14e8! AND (A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 2) <= V_14ec! AND A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 2) >= V_14e4!))) THEN GOTO L_408c2   '@406c3
    V_14cc! = A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 2)   '@407db
    V_14d0! = A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 3)   '@40812
    V_14c4! = A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 2)   '@4084c
    V_14c8! = A_0fe6!(RT_CINT%(FX##(A_0fe6!(0, 0))), 3)   '@40883
L_408c2:
L_408c7:
    IF NOT (A_1014!(0, 0) > 0.0) THEN GOTO L_40903   '@408c7 DS:3840
    GOSUB L_491b4   '@408f1
L_40903:
    IF NOT (V_1528$ = "S") THEN GOTO L_40922   '@40903 DS:38a8
    GOTO L_494ed   '@4091a
L_40922:
    V_14dc! = V_14c4!   '@40922
    V_14e0! = V_14c8!   '@40933
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@40944 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@409b7 DS:38ae
    GOSUB L_4872d   '@40a2a
    GOSUB L_488b0   '@40a37
L_40a49:
    RT_VIEWPRINT 23, 25   '@40a4e
    LOCATE 23, 1   '@40a60
    PRINT " <"; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " *> Movimenta";   '@40a7b DS:38b2,38b8
    IF NOT (V_14c2% = 0) THEN GOTO L_40bf6   '@40ace
    PRINT " por Eixo";   '@40add DS:38ca
    IF NOT (L_BP1c% = 0) THEN GOTO L_40b2a   '@40aeb
    PRINT " - Carga Linear"; RT_TAB$(79); ""; ""   '@40af9 DS:38d8,38ec
    GOTO L_40b58   '@40b22
L_40b2a:
    PRINT " - Carga por Area"; RT_TAB$(79); ""; ""   '@40b2a DS:38ec,38f0
L_40b58:
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <C>oordenada  <F>im"; RT_TAB$(79); ""; ""   '@40b58 DS:38ec,3906
    IF NOT (L_BP1c% = 0) THEN GOTO L_40bc0   '@40b81
    PRINT " <M>odifica  <A>rea"; RT_TAB$(79); ""; "";   '@40b8f DS:38ec,3958
    GOTO L_40bee   '@40bb8
L_40bc0:
    PRINT " <M>odifica  <L>inear"; RT_TAB$(79); ""; "";   '@40bc0 DS:38ec,3970
L_40bee:
    GOTO L_40d0c   '@40bee
L_40bf6:
    PRINT " por Coordenada";   '@40bf6 DS:398a
    IF NOT (L_BP1c% = 0) THEN GOTO L_40c43   '@40c04
    PRINT " - Carga Linear"; RT_TAB$(79); ""; ""   '@40c12 DS:38d8,38ec
    GOTO L_40c71   '@40c3b
L_40c43:
    PRINT " - Carga por Area"; RT_TAB$(79); ""; ""   '@40c43 DS:38ec,38f0
L_40c71:
    PRINT " <I>nicio                   <D>eleta  <R>edesenha  <Z>oom  <E>ixo        <F>im"; RT_TAB$(79); ""; ""   '@40c71 DS:38ec,399e
    IF NOT (L_BP1c% = 0) THEN GOTO L_40cd9   '@40c9a
    PRINT " <M>odifica  <A>rea         <+ -> <P>asso do cursor    <C>oordenada absoluta"; RT_TAB$(79); ""; "";   '@40ca8 DS:38ec,39f0
    GOTO L_40d07   '@40cd1
L_40cd9:
    PRINT " <M>odifica  <L>inear       <+ -> <P>asso do cursor    <C>oordenada absoluta"; RT_TAB$(79); ""; "";   '@40cd9 DS:38ec,3a40
L_40d07:
L_40d0c:
    LOCATE 24, 11   '@40d0c
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@40d2a DS:3a90
    RT_VIEWPRINT 1, 25   '@40d57
    LOCATE 22, 1   '@40d69
    PRINT RT_STRINGC$((20), (95)); "  C A R G A S   D E   O C U P A C A O  "; RT_STRINGC$((21), (95));   '@40d84 DS:3aa4
L_40dbd:
    V_0f18$ = ""   '@40dc2 DS:38ec
L_40dda:
    V_0f18$ = RT_INKEY$   '@40dda
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_40dda   '@40dee DS:38ec
    L_BP28$ = V_0f18$   '@40e02
    IF NOT (L_BP28$ <> "4") THEN GOTO L_40e52   '@40e14 DS:3ad0
    IF NOT (CHR$(0) + CHR$(75) = L_BP28$) THEN GOTO L_41533   '@40e2b
L_40e52:
    IF NOT (V_14c2% = 0) THEN GOTO L_414f5   '@40e52
    FOR V_0f10! = A_0f8a!(0, 1) TO 1.0 STEP -1.0   '@40e61 DS:3844,3ade
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) < V_14cc!) THEN GOTO L_414c1   '@40e80
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) >= V_14e4!) THEN GOTO L_40f15   '@40eb5
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@40eea
L_40f15:
    V_0f14! = 1.0   '@40f15 DS:3844
    V_0ef4# = V_14c4!   '@40f26
L_40f3c:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_41488   '@40f3d
    L_BP2c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@40f61
    L_BP30! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@40f8c
    CALL MIXT_0877_Menor(L_BP2c!, L_BP30!, L_BP34!)   '@40fb0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP30!   '@40fc2
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP2c!   '@40fe7
    IF NOT (L_BP34! > V_14d0!) THEN GOTO L_41028   '@4100c
    GOTO L_41464   '@41020
L_41028:
    L_BP38! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@41028
    L_BP3c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@41053
    CALL MIXT_082a_Maior(L_BP38!, L_BP3c!, L_BP40!)   '@41077
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP3c!   '@41089
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP38!   '@410ae
    IF NOT (L_BP40! < V_14d0!) THEN GOTO L_410ef   '@410d3
    GOTO L_41464   '@410e7
L_410ef:
    L_BP44! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@410ef
    L_BP48! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@41119
    CALL MIXT_0877_Menor(L_BP44!, L_BP48!, L_BP4c!)   '@4113a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP48!   '@4114c
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP44!   '@4116e
    IF NOT (L_BP4c! > V_14cc!) THEN GOTO L_411ae   '@41192
    GOTO L_41464   '@411a6
L_411ae:
    L_BP50! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@411ae
    L_BP54! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@411d8
    CALL MIXT_082a_Maior(L_BP50!, L_BP54!, L_BP58!)   '@411f9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP54!   '@4120b
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP50!   '@4122d
    IF NOT (L_BP58! < V_14c4!) THEN GOTO L_4126d   '@41251
    GOTO L_41464   '@41265
L_4126d:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_412c4   '@4126d
    GOTO L_41464   '@412bc
L_412c4:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_41341   '@412c4
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@4130f
    GOTO L_41413   '@41339
L_41341:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@41341
L_41413:
    IF NOT (V_0f04! < V_14cc!) THEN GOTO L_4145f   '@41413
    L_BP5c! = FX##(V_0ef4#) / 1.0#   '@4142e DS:3ad6
    CALL MIXT_082a_Maior(L_BP5c!, V_0f04!, L_BP60!)   '@41443
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP60!   '@41455
L_4145f:
L_41464:
    V_0f14! = FX##(V_0f14!) + 1.0   '@41469 DS:3844
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40f3c   '@4147f
L_41488:
    IF NOT (FX##(V_14c4!) < FX##(V_0ef4#)) THEN GOTO L_414b4   '@41488
    V_14c4! = V_0ef4#   '@414a3
L_414b4:
    GOTO L_414ed   '@414b4
L_414c1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@414c1 DS:3844,3ade
L_414ed:
    GOTO L_4152b   '@414ed
L_414f5:
    L_BP64! = FX##(V_14cc!) - V_14f6!   '@414f5
    CALL MIXT_082a_Maior(V_14e4!, L_BP64!, L_BP68!)   '@4150a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP68!   '@4151c
L_4152b:
    GOTO L_47a0c   '@4152b
L_41533:
    IF NOT (L_BP28$ <> "6") THEN GOTO L_4156c   '@41533 DS:3ae2
    IF NOT (CHR$(0) + CHR$(77) = L_BP28$) THEN GOTO L_41c72   '@41545
L_4156c:
    IF NOT (V_14c2% = 0) THEN GOTO L_41c30   '@4156c
    L_BP6c! = A_0f8a!(0, 1)   '@4157b
    FOR V_0f10! = 1.0 TO L_BP6c!   '@4159e DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) > V_14cc!) THEN GOTO L_41bfd   '@415a6
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) <= V_14ec!) THEN GOTO L_4163b   '@415db
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@41610
L_4163b:
    V_0f14! = 1.0   '@4163b DS:3844
    V_0ef4# = V_14c4!   '@4164c
L_41662:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_41bc4   '@41663
    L_BP70! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@41687
    L_BP74! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@416b2
    CALL MIXT_0877_Menor(L_BP70!, L_BP74!, L_BP78!)   '@416d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP74!   '@416e8
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP70!   '@4170d
    IF NOT (L_BP78! > V_14d0!) THEN GOTO L_4174e   '@41732
    GOTO L_41ba0   '@41746
L_4174e:
    L_BP7c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@4174e
    L_BP80! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@41779
    CALL MIXT_082a_Maior(L_BP7c!, L_BP80!, L_BP84!)   '@4179d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP80!   '@417b0
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP7c!   '@417d5
    IF NOT (L_BP84! < V_14d0!) THEN GOTO L_41817   '@417fa
    GOTO L_41ba0   '@4180f
L_41817:
    L_BP88! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@41817
    L_BP8c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@41842
    CALL MIXT_0877_Menor(L_BP88!, L_BP8c!, L_BP90!)   '@41864
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP8c!   '@41879
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP88!   '@4189c
    IF NOT (L_BP90! > V_14c4!) THEN GOTO L_418de   '@418c1
    GOTO L_41ba0   '@418d6
L_418de:
    L_BP94! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@418de
    L_BP98! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@41909
    CALL MIXT_082a_Maior(L_BP94!, L_BP98!, L_BP9c!)   '@4192b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP98!   '@41940
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP94!   '@41963
    IF NOT (L_BP9c! < V_14cc!) THEN GOTO L_419a5   '@41988
    GOTO L_41ba0   '@4199d
L_419a5:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_419fc   '@419a5
    GOTO L_41ba0   '@419f4
L_419fc:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_41a79   '@419fc
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@41a47
    GOTO L_41b4b   '@41a71
L_41a79:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - V_14d0!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1))   '@41a79
L_41b4b:
    IF NOT (V_0f04! > V_14cc!) THEN GOTO L_41b9b   '@41b4b
    L_BPa0! = FX##(V_0ef4#) / 1.0#   '@41b66 DS:3ad6
    CALL MIXT_0877_Menor(L_BPa0!, V_0f04!, L_BPa4!)   '@41b7c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BPa4!   '@41b90
L_41b9b:
L_41ba0:
    V_0f14! = FX##(V_0f14!) + 1.0   '@41ba5 DS:3844
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41662   '@41bbb
L_41bc4:
    IF NOT (FX##(V_14c4!) > FX##(V_0ef4#)) THEN GOTO L_41bf0   '@41bc4
    V_14c4! = V_0ef4#   '@41bdf
L_41bf0:
    GOTO L_41c28   '@41bf0
L_41bfd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41bfd DS:3844
L_41c28:
    GOTO L_41c6a   '@41c28
L_41c30:
    L_BPa8! = FX##(V_14cc!) + V_14f6!   '@41c30
    CALL MIXT_0877_Menor(V_14ec!, L_BPa8!, L_BPac!)   '@41c46
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BPac!   '@41c5a
L_41c6a:
    GOTO L_47a0c   '@41c6a
L_41c72:
    IF NOT (L_BP28$ <> "8") THEN GOTO L_41cab   '@41c72 DS:3ae8
    IF NOT (CHR$(0) + CHR$(72) = L_BP28$) THEN GOTO L_423bb   '@41c84
L_41cab:
    IF NOT (V_14c2% = 0) THEN GOTO L_42379   '@41cab
    L_BPb0! = A_0f8a!(0, 0)   '@41cba
    FOR V_0f10! = 1.0 TO L_BPb0!   '@41cdb DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) > V_14d0!) THEN GOTO L_42345   '@41ce2
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) <= V_14f0!) THEN GOTO L_41d74   '@41d16
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@41d4a
L_41d74:
    V_0f14! = 1.0   '@41d74 DS:3844
    V_0efc# = V_14c8!   '@41d85
L_41d9c:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_4230c   '@41d9d
    L_BPb4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@41dc1
    L_BPb8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@41dec
    CALL MIXT_0877_Menor(L_BPb4!, L_BPb8!, L_BPbc!)   '@41e0e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPb8!   '@41e23
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPb4!   '@41e46
    IF NOT (L_BPbc! > V_14cc!) THEN GOTO L_41e88   '@41e6b
    GOTO L_422e9   '@41e80
L_41e88:
    L_BPc0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@41e88
    L_BPc4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@41eb3
    CALL MIXT_082a_Maior(L_BPc0!, L_BPc4!, L_BPc8!)   '@41ed5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPc4!   '@41eea
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPc0!   '@41f0d
    IF NOT (L_BPc8! < V_14cc!) THEN GOTO L_41f4f   '@41f32
    GOTO L_422e9   '@41f47
L_41f4f:
    L_BPcc! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@41f4f
    L_BPd0! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@41f7b
    CALL MIXT_0877_Menor(L_BPcc!, L_BPd0!, L_BPd4!)   '@41fa0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPd0!   '@41fb5
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPcc!   '@41fdb
    IF NOT (L_BPd4! > V_14c8!) THEN GOTO L_4201e   '@42001
    GOTO L_422e9   '@42016
L_4201e:
    L_BPd8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@4201e
    L_BPdc! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@4204a
    CALL MIXT_082a_Maior(L_BPd8!, L_BPdc!, L_BPe0!)   '@4206f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BPdc!   '@42084
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BPd8!   '@420aa
    IF NOT (L_BPe0! < V_14d0!) THEN GOTO L_420ed   '@420d0
    GOTO L_422e9   '@420e5
L_420ed:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_42140   '@420ed
    GOTO L_422e9   '@42138
L_42140:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_421c2   '@42140
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@4218f
    GOTO L_42294   '@421ba
L_421c2:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@421c2
L_42294:
    IF NOT (V_0f04! > V_14d0!) THEN GOTO L_422e4   '@42294
    L_BPe4! = FX##(V_0efc#) / 1.0#   '@422af DS:3ad6
    CALL MIXT_0877_Menor(L_BPe4!, V_0f04!, L_BPe8!)   '@422c5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BPe8!   '@422d9
L_422e4:
L_422e9:
    V_0f14! = FX##(V_0f14!) + 1.0   '@422ee DS:3844
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41d9c   '@42304
L_4230c:
    IF NOT (FX##(V_14c8!) > FX##(V_0efc#)) THEN GOTO L_42338   '@4230c
    V_14c8! = V_0efc#   '@42327
L_42338:
    GOTO L_42371   '@42338
L_42345:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@42345 DS:3844
L_42371:
    GOTO L_423b3   '@42371
L_42379:
    L_BPec! = FX##(V_14d0!) + V_14f6!   '@42379
    CALL MIXT_0877_Menor(V_14f0!, L_BPec!, L_BPf0!)   '@4238f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BPf0!   '@423a3
L_423b3:
    GOTO L_47a0c   '@423b3
L_423bb:
    IF NOT (L_BP28$ <> "2") THEN GOTO L_423f4   '@423bb DS:3aee
    IF NOT (CHR$(0) + CHR$(80) = L_BP28$) THEN GOTO L_42af9   '@423cd
L_423f4:
    IF NOT (V_14c2% = 0) THEN GOTO L_42ab7   '@423f4
    FOR V_0f10! = A_0f8a!(0, 0) TO 1.0 STEP -1.0   '@42403 DS:3844,3ade
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) < V_14d0!) THEN GOTO L_42a83   '@42420
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) >= V_14e8!) THEN GOTO L_424b2   '@42454
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@42488
L_424b2:
    V_0f14! = 1.0   '@424b2 DS:3844
    V_0efc# = V_14c8!   '@424c3
L_424da:
    IF NOT (A_0fb8!(0, 0) >= V_0f14!) THEN GOTO L_42a4a   '@424db
    L_BPf4! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@424ff
    L_BPf8! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@4252a
    CALL MIXT_0877_Menor(L_BPf4!, L_BPf8!, L_BPfc!)   '@4254c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BPf8!   '@42561
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BPf4!   '@42584
    IF NOT (L_BPfc! > V_14cc!) THEN GOTO L_425c6   '@425a9
    GOTO L_42a27   '@425be
L_425c6:
    L_BP100! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0)   '@425c6
    L_BP104! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)   '@425f1
    CALL MIXT_082a_Maior(L_BP100!, L_BP104!, L_BP108!)   '@42613
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2) = L_BP104!   '@42628
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP100!   '@4264b
    IF NOT (L_BP108! < V_14cc!) THEN GOTO L_4268d   '@42670
    GOTO L_42a27   '@42685
L_4268d:
    L_BP10c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@4268d
    L_BP110! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@426b9
    CALL MIXT_0877_Menor(L_BP10c!, L_BP110!, L_BP114!)   '@426de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP110!   '@426f3
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP10c!   '@42719
    IF NOT (L_BP114! > V_14d0!) THEN GOTO L_4275c   '@4273f
    GOTO L_42a27   '@42754
L_4275c:
    L_BP118! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@4275c
    L_BP11c! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)   '@42788
    CALL MIXT_082a_Maior(L_BP118!, L_BP11c!, L_BP120!)   '@427ad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) = L_BP11c!   '@427c2
    A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP118!   '@427e8
    IF NOT (L_BP120! < V_14c8!) THEN GOTO L_4282b   '@4280e
    GOTO L_42a27   '@42823
L_4282b:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) THEN GOTO L_4287e   '@4282b
    GOTO L_42a27   '@42876
L_4287e:
    IF NOT (A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1) = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) THEN GOTO L_42900   '@4287e
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)   '@428cd
    GOTO L_429d2   '@428f8
L_42900:
    V_0f04! = A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3) - (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - V_14cc!) * (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 3)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 1)) / (FX##(A_0fb8!(RT_CINT%(FX##(V_0f14!)), 2)) - A_0fb8!(RT_CINT%(FX##(V_0f14!)), 0))   '@42900
L_429d2:
    IF NOT (V_0f04! < V_14d0!) THEN GOTO L_42a22   '@429d2
    L_BP124! = FX##(V_0efc#) / 1.0#   '@429ed DS:3ad6
    CALL MIXT_082a_Maior(L_BP124!, V_0f04!, L_BP128!)   '@42a03
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP128!   '@42a17
L_42a22:
L_42a27:
    V_0f14! = FX##(V_0f14!) + 1.0   '@42a2c DS:3844
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_424da   '@42a42
L_42a4a:
    IF NOT (FX##(V_14c8!) < FX##(V_0efc#)) THEN GOTO L_42a76   '@42a4a
    V_14c8! = V_0efc#   '@42a65
L_42a76:
    GOTO L_42aaf   '@42a76
L_42a83:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@42a83 DS:3844,3ade
L_42aaf:
    GOTO L_42af1   '@42aaf
L_42ab7:
    L_BP12c! = FX##(V_14d0!) - V_14f6!   '@42ab7
    CALL MIXT_082a_Maior(V_14e8!, L_BP12c!, L_BP130!)   '@42acd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP130!   '@42ae1
L_42af1:
    GOTO L_47a0c   '@42af1
L_42af9:
    IF NOT (L_BP28$ = "*") THEN GOTO L_42b2f   '@42af9 DS:3af4
    V_0f18$ = "A"   '@42b0b DS:3afa
    CALL S_1b2df   '@42b1d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_47a0c   '@42b27
L_42b2f:
    IF NOT (CHR$(13) = L_BP28$) THEN GOTO L_44049   '@42b2f
    IF NOT (V_14e0! = V_14c8! AND (V_14dc! = V_14c4! AND L_BP1c% = 0)) THEN GOTO L_42baa   '@42b47
    BEEP   '@42b93
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@42b9d
L_42baa:
    IF NOT (L_BP1c% = 0) THEN GOTO L_432d3   '@42baa
    V_0f10! = FX##(A_0fe6!(0, 0)) + 1.0   '@42bb8 DS:3844
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = V_14dc!   '@42bdd
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = V_14e0!   '@42c07
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = V_14c4!   '@42c32
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = V_14c8!   '@42c5a
    A_0fe6!(0, 0) = FX##(A_0fe6!(0, 0)) + 1.0   '@42c85 DS:3844
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@42cb9 DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@42d23 DS:3b00,3b04
    L_BP134! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@42d98
    L_BP138! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!   '@42dd1 DS:3b08
    L_BP13c! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@42e13
    L_BP140! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!   '@42e4a DS:3b08
    V_0ee8! = L_BP16!   '@42e8c
    GOSUB L_48d40   '@42e9c
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@42ea9 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@42f1c DS:38ae
    RT_VIEWPRINT 23, 25   '@42f8f
L_42fa6:
    RT_CLS 2   '@42fab
    PRINT " Carga por metro linear de Alvenaria "   '@42fb9 DS:3b0c
    PRINT " Entre com o valor da carga ou A*B para multiplicar"   '@42fc7 DS:3b36
    PRINT " Carga ";   '@42fd5 DS:3b6e
    IF NOT (V_0f10! > 1.0) THEN GOTO L_43062   '@42fe3 DS:3844
    PRINT USING "*###.##* \  \ "; RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f10!) - 1.0), 4), "*###.##* \  \ ", 1); V_0de0$ + "/" + V_0ddc$;   '@42ffe DS:3ade,3b7a,3b8c
    GOTO L_43097   '@4305a
L_43062:
    PRINT USING " \   \ "; V_0de0$ + "/" + V_0ddc$;   '@43062 DS:3b8c,3b92
L_43097:
    CALL MIXT_07f1_LimpaTeclado   '@43097
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@430a1 DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_0f10! > 1.0 AND LEN(V_0f18$) = 0) THEN GOTO L_4312c   '@430bb DS:3844
    V_0f18$ = STR$(A_0fe6!(RT_CINT%(FX##(V_0f10!) - 1.0), 4))   '@430f1 DS:3ade
L_4312c:
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_43153   '@4312c
    BEEP   '@43141
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42fa6   '@4314b
L_43153:
    IF NOT (RT_INSTR%((1), (V_0f18$), ("*")) > 0) THEN GOTO L_43261   '@43153 DS:3af4
    V_0f18$ = RT_STR8$(RT_DBL#(FX##(VAL(V_0f18$)) * VAL(RT_MID2$((V_0f18$), (RT_INSTR%((1), (V_0f18$), ("*")) + 1)))))   '@43170 DS:3af4
    LOCATE 25, 30   '@431c7
    PRINT USING "####.###"; RT_PU#(VAL(V_0f18$), "####.###", 1);   '@431e5 DS:3b9e
    CALL MIXT_07f1_LimpaTeclado   '@43213
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " N/*S* ", V_0f1c$   '@4321d DS:3baa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f1c$) = "N") THEN GOTO L_4325c   '@43237 DS:3bb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42fa6   '@43254
L_4325c:
L_43261:
    IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_43297   '@43261 DS:3bbc
    BEEP   '@43285
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42fa6   '@4328f
L_43297:
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 4) = VAL(V_0f18$)   '@43297
    GOTO L_4400d   '@432cb
L_432d3:
    IF NOT (L_BP20! = 0.0) THEN GOTO L_433cf   '@432d3 DS:3840
    IF NOT (V_14e0! = V_14c8! AND V_14dc! = V_14c4!) THEN GOTO L_4333d   '@432ed
    BEEP   '@4332b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@43335
L_4333d:
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 0) = V_14dc!   '@4333d DS:3888
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 1) = V_14e0!   '@4337b DS:3888
    L_BP20! = 2.0   '@433ba DS:3888
L_433cf:
    L_BP20! = FX##(L_BP20!) + 1.0   '@433cf DS:3844
    IF NOT (ABS(FX##(A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 1)) - V_14c8!) < 0.0500000007450580596923828125## AND ABS(FX##(A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 0)) - V_14c4!) < 0.0500000007450580596923828125##) THEN GOTO L_43510   '@433e3 DS:3888,3bc4
    V_14c4! = A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 0)   '@4348e DS:3888
    V_14c8! = A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 1)   '@434cc DS:3888
L_43510:
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + L_BP20!), 0) = V_14c4!   '@43510
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + L_BP20!), 1) = V_14c8!   '@4354d
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@4358b DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@435f5 DS:3b00,3b04
    RT_PSET RT_SNG!((FX##(A_1014!(RT_CINT%(FX##(L_BP20!) - 1.0 + A_1014!(0, 0)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1014!(RT_CINT%(FX##(L_BP20!) - 1.0 + A_1014!(0, 0)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@4366a DS:3ade,3b08
    RT_LINE 0, 0, RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(L_BP1a!)), 4369   '@43720 DS:3b08
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@43784 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@437f7 DS:38ae
    L_BP144! = (FX##(V_14dc!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@4386a DS:3b04
    L_BP148! = 169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!   '@43890 DS:38ae
    L_BP14c$ = CHR$(26)   '@438b2
    L_BP150$ = "CGA"   '@438c6 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP144!, L_BP148!, L_BP14c$, L_BP150$)   '@438d4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @438ed libera strings locais (L_BP14c)
    ' @438f7 libera strings locais (L_BP150)
    L_BP154! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@43901
    L_BP158! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@43922 DS:38ae
    L_BP15c$ = CHR$(27)   '@43944
    L_BP160$ = "CGA"   '@43958 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP154!, L_BP158!, L_BP15c$, L_BP160$)   '@43966
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4397f libera strings locais (L_BP15c)
    ' @43989 libera strings locais (L_BP160)
    IF NOT (A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 1) <> V_14c8! OR A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 2.0), 0) <> V_14c4!) THEN GOTO L_43a36   '@43993 DS:3888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@43a2e
L_43a36:
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0))), 0) = FX##(L_BP20!) - 2.0   '@43a36 DS:3bc8
    RT_VIEWPRINT 23, 25   '@43a73
L_43a8a:
    RT_CLS 2   '@43a8f
    PRINT " Carga de Ocupacao distribuida na area demarcada (Total e Parcela Acidental)"   '@43a9d DS:3bcc
    PRINT " Entre com o valor da carga ou A*B para multiplicar"   '@43aab DS:3b36
    PRINT " Carga de Ocupacao Total "; V_0de0$; "/"; V_0ddc$; "2  ";   '@43ab9 DS:3b8c,3c1c,3c3a
    CALL MIXT_07f1_LimpaTeclado   '@43aeb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@43af5 DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_43b36   '@43b0f
    BEEP   '@43b24
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43a8a   '@43b2e
L_43b36:
    IF NOT (RT_INSTR%((1), (V_0f18$), ("*")) > 0) THEN GOTO L_43c44   '@43b36 DS:3af4
    V_0f18$ = RT_STR8$(RT_DBL#(FX##(VAL(V_0f18$)) * VAL(RT_MID2$((V_0f18$), (RT_INSTR%((1), (V_0f18$), ("*")) + 1)))))   '@43b53 DS:3af4
    LOCATE 25, 30   '@43baa
    PRINT USING "####.###"; RT_PU#(VAL(V_0f18$), "####.###", 1);   '@43bc8 DS:3b9e
    CALL MIXT_07f1_LimpaTeclado   '@43bf6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " N/*S* ", V_0f1c$   '@43c00 DS:3baa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f1c$) = "N") THEN GOTO L_43c3f   '@43c1a DS:3bb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43a8a   '@43c37
L_43c3f:
L_43c44:
    IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_43c7a   '@43c44 DS:3bbc
    BEEP   '@43c68
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43a8a   '@43c72
L_43c7a:
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 1.0), 0) = VAL(V_0f18$)   '@43c7a DS:3844
L_43cc6:
    LOCATE 25, 1   '@43ccb
    PRINT USING " Total = ###.##   Parcela Acidental da Carga de Ocupacao "; RT_PU#(A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 1.0), 0), " Total = ###.##   Parcela Acidental da Carga de Ocupacao ", 1);   '@43ce6 DS:3844,3c42
    PRINT V_0de0$; "/"; V_0ddc$; "2  ";   '@43d33 DS:3b8c,3c3a
    CALL MIXT_07f1_LimpaTeclado   '@43d5c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@43d66 DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (RT_INSTR%((1), (V_0f18$), ("*")) > 0) THEN GOTO L_43e8e   '@43d80 DS:3af4
    V_0f18$ = RT_STR8$(RT_DBL#(FX##(VAL(V_0f18$)) * VAL(RT_MID2$((V_0f18$), (RT_INSTR%((1), (V_0f18$), ("*")) + 1)))))   '@43d9d DS:3af4
    LOCATE 25, 61   '@43df4
    PRINT USING "####.###"; RT_PU#(VAL(V_0f18$), "####.###", 1);   '@43e12 DS:3b9e
    CALL MIXT_07f1_LimpaTeclado   '@43e40
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " N/*S* ", V_0f1c$   '@43e4a DS:3baa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f1c$) = "N") THEN GOTO L_43e89   '@43e64 DS:3bb6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43cc6   '@43e81
L_43e89:
L_43e8e:
    L_BP162% = (VAL(V_0f18$) < 0.0#)   '@43e8e DS:3844,3bbc
    IF NOT ((FX##(VAL(V_0f18$)) >= FX##(A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 1.0), 0)) OR L_BP162%) <> 0) THEN GOTO L_43f25   '@43ef1
    BEEP   '@43f13
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43a8a   '@43f1d
L_43f25:
    A_1014!(RT_CINT%(FX##(A_1014!(0, 0)) + 1.0), 1) = VAL(V_0f18$)   '@43f25 DS:3844
    A_1014!(0, 1) = FX##(A_1014!(0, 1)) + 1.0   '@43f6d DS:3844
    A_1014!(0, 0) = FX##(A_1014!(0, 0)) + A_1014!(RT_CINT%(FX##(A_1014!(0, 0))), 0) + 2.0   '@43fa7 DS:3888
L_4400d:
    RT_VIEWPRINT 1, 25   '@4400d
    GOSUB L_4872d   '@4401f
    GOSUB L_47ca3   '@4402c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@44039
L_44049:
    IF NOT (L_BP28$ <> "I") THEN GOTO L_4406d   '@44049 DS:3c80
    IF NOT (L_BP28$ = "i") THEN GOTO L_4408a   '@4405b DS:3c86
L_4406d:
    GOSUB L_47ca3   '@4406d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@4407a
L_4408a:
    IF NOT (L_BP28$ <> "D") THEN GOTO L_440ae   '@4408a DS:3c8c
    IF NOT (L_BP28$ = "d") THEN GOTO L_46183   '@4409c DS:3c92
L_440ae:
    RT_VIEWPRINT 23, 25   '@440ae
    RT_CLS 2   '@440c0
    RT_VIEWPRINT 1, 25   '@440ce
    LOCATE 24, 1   '@440e0
    PRINT " <T>odas as cargas   <U>ltima carga   <E>scolher a carga   <*R*>etorno";   '@440fb DS:3c98
    CALL MIXT_07f1_LimpaTeclado   '@44113
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@4411d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP166$ = V_0f18$   '@44139
    IF NOT (L_BP166$ <> "T") THEN GOTO L_44177   '@4414c DS:3ce2
    IF NOT (L_BP166$ = "t") THEN GOTO L_4421f   '@44164 DS:3ce8
L_44177:
    IF NOT (L_BP1c% = 0) THEN GOTO L_441ba   '@44177
    REDIM A_0fe6!(-32768 TO -32768, -32768 TO -32768)   '@44185
    REDIM A_0fe6!(0 TO V_0e46%, 0 TO 4)   '@44193
    GOTO L_4420f   '@441b2
L_441ba:
    REDIM A_1014!(-32768 TO -32768, -32768 TO -32768)   '@441ba
    REDIM A_1014!(0 TO V_0e48%, 0 TO 1)   '@441c8
    A_1014!(0, 0) = 1.0   '@441ea DS:3844
L_4420f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4060f   '@4420f
L_4421f:
    IF NOT (L_BP166$ <> "U") THEN GOTO L_44245   '@4421f DS:3cee
    IF NOT (L_BP166$ = "u") THEN GOTO L_449ff   '@44232 DS:3cf4
L_44245:
    IF NOT (L_BP1c% = 0) THEN GOTO L_44634   '@44245
    V_0f10! = A_0fe6!(0, 0)   '@44253
    IF NOT (V_0f10! = 0.0) THEN GOTO L_442a5   '@44273 DS:3840
    BEEP   '@4428e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@44298
L_442a5:
    L_BP134! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@442a5
    L_BP138! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!   '@442de DS:3b08
    L_BP13c! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@44320
    L_BP140! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!   '@44357 DS:3b08
    V_0ee8! = V_14be!   '@44399
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@443aa DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@44414 DS:3b00,3b04
    GOSUB L_48d40   '@44489
    V_14c4! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@44496
    V_14c8! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@444c0
    A_0fe6!(0, 0) = FX##(A_0fe6!(0, 0)) - 1.0   '@444eb DS:3ade
    GOSUB L_4824d   '@4451f
    GOSUB L_48a43   '@4452c
    GOSUB L_48bc6   '@44539
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@44546 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@445b9 DS:38ae
    GOTO L_44991   '@4462c
L_44634:
    IF NOT (A_1014!(0, 1) = 0.0) THEN GOTO L_44678   '@44634 DS:3840
    BEEP   '@44661
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@4466b
L_44678:
    V_0f04! = 1.0   '@44678 DS:3844
    V_0f14! = 1.0   '@44689 DS:3844
L_4469f:
    IF NOT (A_1014!(0, 1) > V_0f04!) THEN GOTO L_44728   '@446a4
    V_0f04! = FX##(V_0f04!) + 1.0   '@446d1 DS:3844
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@446e7 DS:3888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4469f   '@4471b
L_44728:
    A_1014!(0, 0) = V_0f14!   '@44728
    A_1014!(0, 1) = FX##(A_1014!(0, 1)) - 1.0   '@44748 DS:3ade
    V_0ee8! = V_14be!   '@44782
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@44793 DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@447fd DS:3b00,3b04
    GOSUB L_4929c   '@44872
    GOSUB L_4824d   '@4487f
    GOSUB L_48a43   '@4488c
    GOSUB L_491b4   '@44899
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@448a6 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@44919 DS:38ae
L_44991:
    GOSUB L_488b0   '@44991
    GOSUB L_4872d   '@4499e
    V_14cc! = V_14c4!   '@449ab
    V_14d0! = V_14c8!   '@449bc
    V_14dc! = V_14c4!   '@449cd
    V_14e0! = V_14c8!   '@449de
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@449ef
L_449ff:
    IF NOT (L_BP166$ <> "E") THEN GOTO L_44a25   '@449ff DS:3cfa
    IF NOT (L_BP166$ = "e") THEN GOTO L_4616e   '@44a12 DS:3d00
L_44a25:
    IF NOT (L_BP1c% = 0) THEN GOTO L_45639   '@44a25
    IF NOT (A_0fe6!(0, 0) = 0.0) THEN GOTO L_44a74   '@44a33 DS:3840
    BEEP   '@44a5d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@44a67
L_44a74:
    LOCATE 24, 1   '@44a74
    PRINT " Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@44a8f DS:38ec,3d06
L_44abd:
    V_0f18$ = "NENHUM"   '@44ac2 DS:3d52
    FOR V_0f10! = A_0fe6!(0, 0) TO 1.0 STEP -1.0   '@44ad4 DS:3844,3ade
    L_BP16a! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@44af0
    L_BP16e! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@44b1b
    CALL MIXT_0877_Menor(L_BP16a!, L_BP16e!, L_BP172!)   '@44b3d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP16e!   '@44b52
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP16a!   '@44b75
    L_BP176! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@44b9a
    L_BP17a! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@44bbf
    CALL MIXT_082a_Maior(L_BP176!, L_BP17a!, L_BP17e!)   '@44be1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP17a!   '@44bf6
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP176!   '@44c19
    L_BP182! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@44c3e
    L_BP186! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@44c64
    CALL MIXT_0877_Menor(L_BP182!, L_BP186!, L_BP18a!)   '@44c89
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP186!   '@44c9e
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP182!   '@44cc4
    L_BP18e! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@44cea
    L_BP192! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@44d10
    CALL MIXT_082a_Maior(L_BP18e!, L_BP192!, L_BP196!)   '@44d35
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP192!   '@44d4a
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP18e!   '@44d70
    IF NOT (L_BP196! <= V_14f0! AND (L_BP18a! >= V_14e8! AND (L_BP17e! <= V_14ec! AND L_BP172! >= V_14e4!))) THEN GOTO L_45591   '@44d96
L_44e0a:
    L_BP134! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@44e0a
    L_BP138! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!   '@44e43 DS:3b08
    L_BP13c! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@44e85
    L_BP140! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!   '@44ebc DS:3b08
    V_0ee8! = V_14be!   '@44efe
    GOSUB L_48d40   '@44f0f
    L_BP19a! = RT_TIMER   '@44f1c
L_44f38:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_44f38   '@44f38 DS:3d5c
    V_0ee8! = L_BP16!   '@44f5a
    GOSUB L_48d40   '@44f6a
    L_BP19a! = RT_TIMER   '@44f77
L_44f92:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_44f92   '@44f92 DS:3d5c
    V_0f18$ = RT_INKEY$   '@44fb4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_44e0a   '@44fc8 DS:38ec
    L_BP19e$ = V_0f18$   '@44fdf
    IF NOT (L_BP19e$ <> "S") THEN GOTO L_4501d   '@44ff2 DS:38a8
    IF NOT (L_BP19e$ = "s") THEN GOTO L_454cd   '@4500a DS:3d60
L_4501d:
    V_0ee8! = V_14be!   '@4501d
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@4502e DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@45098 DS:3b00,3b04
    GOSUB L_48d40   '@4510d
    GOSUB L_4824d   '@4511a
    L_BP1a2! = A_0fe6!(0, 0)   '@45127
    FOR V_0f14! = FX##(V_0f10!) + 1.0 TO L_BP1a2!   '@45148 DS:3844
    FOR V_0f04! = 0.0 TO 4.0   '@45154 DS:3840,3844,3d66
    A_0fe6!(RT_CINT%(FX##(V_0f14!) - 1.0), RT_CINT%(FX##(V_0f04!))) = A_0fe6!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!)))   '@45162 DS:3ade
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@451ba DS:3844,3d66
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@451e6 DS:3844
    IF NOT (V_0f10! > 1.0 AND A_0fe6!(0, 0) > V_0f10!) THEN GOTO L_45275   '@45212 DS:3844
    V_0f10! = FX##(V_0f10!) + 1.0   '@4525f DS:3844
L_45275:
    A_0fe6!(0, 0) = FX##(A_0fe6!(0, 0)) - 1.0   '@45275 DS:3ade
    GOSUB L_48a43   '@452a9
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@452b6 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@45329 DS:38ae
    L_BP1a6! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@4539c
    L_BP1aa! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@453bd DS:38ae
    L_BP1ae$ = CHR$(27)   '@453df
    L_BP1b2$ = "CGA"   '@453f3 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP1a6!, L_BP1aa!, L_BP1ae$, L_BP1b2$)   '@45401
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4541a libera strings locais (L_BP1ae)
    ' @45424 libera strings locais (L_BP1b2)
    L_BP1b6! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@4542e DS:3b04
    L_BP1ba! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@45454 DS:38ae
    L_BP1be$ = CHR$(26)   '@45476
    L_BP1c2$ = "CGA"   '@4548a DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP1b6!, L_BP1ba!, L_BP1be$, L_BP1c2$)   '@45498
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @454b1 libera strings locais (L_BP1be)
    ' @454bb libera strings locais (L_BP1c2)
    GOTO L_4558c   '@454c5
L_454cd:
    IF NOT (L_BP19e$ <> "F") THEN GOTO L_454f3   '@454cd DS:3d6a
    IF NOT (L_BP19e$ = "f") THEN GOTO L_45503   '@454e0 DS:3d70
L_454f3:
    GOTO L_455bd   '@454f3
L_45503:
    IF NOT (L_BP19e$ <> "R") THEN GOTO L_45529   '@45503 DS:3d76
    IF NOT (L_BP19e$ = "r") THEN GOTO L_45587   '@45516 DS:3d7c
L_45529:
    L_BP1c6! = FX##(V_0f10!) + 2.0   '@45529 DS:3888
    L_BP1ca! = FX##(A_0fe6!(0, 0)) + 1.0   '@4553f DS:3844
    CALL MIXT_0877_Menor(L_BP1c6!, L_BP1ca!, L_BP1ce!)   '@4555f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BP1ce!   '@45574
    GOTO L_4558c   '@4557f
L_45587:
L_4558c:
L_45591:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@45591 DS:3844,3ade
L_455bd:
    L_BP1d0% = (V_0f10! = 0.0)   '@455bd DS:3840
    IF NOT ((A_0fe6!(0, 0) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP1d0%)) <> 0) THEN GOTO L_45631   '@455e7 DS:3840,3d52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44abd   '@45629
L_45631:
    GOTO L_4615e   '@45631
L_45639:
    IF NOT (A_1014!(0, 1) = 0.0) THEN GOTO L_4567d   '@45639 DS:3840
    BEEP   '@45666
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@45670
L_4567d:
    LOCATE 24, 1   '@4567d
    PRINT " Escolha a Area a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@45698 DS:38ec,3d82
L_456c6:
    V_0f18$ = "NENHUM"   '@456cb DS:3d52
    FOR V_0ef0! = A_1014!(0, 1) TO 1.0 STEP -1.0   '@456dd DS:3844,3ade
    V_0f04! = 1.0   '@456fc DS:3844
    V_0f14! = 1.0   '@4570d DS:3844
L_45723:
    IF NOT (V_0f04! < V_0ef0!) THEN GOTO L_45799   '@45728
    V_0f04! = FX##(V_0f04!) + 1.0   '@45743 DS:3844
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@45759 DS:3888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45723   '@4578d
L_45799:
    L_BP1d4! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@45799
    FOR L_BP1d8! = 1.0 TO L_BP1d4!   '@457c4 DS:3844
    IF NOT (A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 0) > V_14ec! OR A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 0) < V_14e4!) THEN GOTO L_4586b   '@457cc DS:3844
    L_BP1d8! = 0.0   '@45852 DS:3840
    GOTO L_45938   '@45863
L_4586b:
    IF NOT (A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 1) > V_14f0! OR A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 1) < V_14e8!) THEN GOTO L_4590c   '@4586b DS:3844
    L_BP1d8! = 0.0   '@458f3 DS:3840
    GOTO L_45938   '@45904
L_4590c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1d8!   '@4590c DS:3844
L_45938:
    IF NOT (L_BP1d8! = 0.0) THEN GOTO L_4595b   '@45938 DS:3840
    GOTO L_460b1   '@45953
L_4595b:
L_45960:
    V_0ee8! = V_14be!   '@45960
    GOSUB L_4929c   '@45971
    L_BP19a! = RT_TIMER   '@4597e
L_4599a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_4599a   '@4599a DS:3d5c
    V_0ee8! = L_BP1a!   '@459bc
    GOSUB L_4929c   '@459cc
    L_BP19a! = RT_TIMER   '@459d9
L_459f4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_459f4   '@459f4 DS:3d5c
    V_0f18$ = RT_INKEY$   '@45a16
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_45960   '@45a2a DS:38ec
    L_BP1dc$ = V_0f18$   '@45a41
    IF NOT (L_BP1dc$ <> "S") THEN GOTO L_45a7f   '@45a54 DS:38a8
    IF NOT (L_BP1dc$ = "s") THEN GOTO L_45fea   '@45a6c DS:3d60
L_45a7f:
    V_0ee8! = V_14be!   '@45a7f
    RT_GPONTO RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@45a90 DS:3b00
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@45afa DS:3b00,3b04
    GOSUB L_4929c   '@45b6f
    L_BP1e0! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@45b7c
    IF NOT (A_1014!(0, 1) > V_0f04!) THEN GOTO L_45cdd   '@45ba6
    L_BP1e4! = FX##(A_1014!(0, 0)) - 1.0   '@45bd3 DS:3ade
    FOR V_0f04! = FX##(L_BP1e0!) + V_0f14! + 2.0 TO L_BP1e4!   '@45bf9 DS:3844,3888
    A_1014!(RT_CINT%(V_0f04! - (FX##(L_BP1e0!) + 2.0)), 0) = A_1014!(RT_CINT%(FX##(V_0f04!)), 0)   '@45c0a DS:3888
    A_1014!(RT_CINT%(V_0f04! - (FX##(L_BP1e0!) + 2.0)), 1) = A_1014!(RT_CINT%(FX##(V_0f04!)), 1)   '@45c5a DS:3888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@45cac DS:3844
L_45cdd:
    IF NOT (V_0ef0! > 1.0 AND A_1014!(0, 1) > V_0ef0!) THEN GOTO L_45d43   '@45cdd DS:3844
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@45d2d DS:3844
L_45d43:
    A_1014!(0, 1) = FX##(A_1014!(0, 1)) - 1.0   '@45d43 DS:3ade
    A_1014!(0, 0) = A_1014!(0, 0) - (FX##(L_BP1e0!) + 2.0)   '@45d7d DS:3888
    GOSUB L_48a43   '@45db9
    GOSUB L_491b4   '@45dc6
    RT_GCAIXA RT_SNG!((FX##(V_14dc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@45dd3 DS:38ae
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@45e46 DS:38ae
    L_BP1e8! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@45eb9
    L_BP1ec! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@45eda DS:38ae
    L_BP1f0$ = CHR$(27)   '@45efc
    L_BP1f4$ = "CGA"   '@45f10 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP1e8!, L_BP1ec!, L_BP1f0$, L_BP1f4$)   '@45f1e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @45f37 libera strings locais (L_BP1f0)
    ' @45f41 libera strings locais (L_BP1f4)
    L_BP1f8! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@45f4b DS:3b04
    L_BP1fc! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@45f71 DS:38ae
    L_BP200$ = CHR$(26)   '@45f93
    L_BP204$ = "CGA"   '@45fa7 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP1f8!, L_BP1fc!, L_BP200$, L_BP204$)   '@45fb5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @45fce libera strings locais (L_BP200)
    ' @45fd8 libera strings locais (L_BP204)
    GOTO L_460ac   '@45fe2
L_45fea:
    IF NOT (L_BP1dc$ <> "F") THEN GOTO L_46010   '@45fea DS:3d6a
    IF NOT (L_BP1dc$ = "f") THEN GOTO L_46020   '@45ffd DS:3d70
L_46010:
    GOTO L_460e2   '@46010
L_46020:
    IF NOT (L_BP1dc$ <> "R") THEN GOTO L_46046   '@46020 DS:3d76
    IF NOT (L_BP1dc$ = "r") THEN GOTO L_460a7   '@46033 DS:3d7c
L_46046:
    L_BP208! = FX##(V_0ef0!) + 2.0   '@46046 DS:3888
    L_BP20c! = FX##(A_1014!(0, 1)) + 1.0   '@4605c DS:3844
    CALL MIXT_0877_Menor(L_BP208!, L_BP20c!, L_BP210!)   '@4607f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef0! = L_BP210!   '@46094
    GOTO L_460ac   '@4609f
L_460a7:
L_460ac:
L_460b1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@460b6 DS:3844,3ade
L_460e2:
    L_BP212% = (V_0ef0! = 0.0)   '@460e2 DS:3840
    IF NOT ((A_1014!(0, 1) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP212%)) <> 0) THEN GOTO L_46159   '@4610c DS:3840,3d52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_456c6   '@46151
L_46159:
L_4615e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@4615e
L_4616e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@4616e
L_46183:
    IF NOT (L_BP28$ <> "R") THEN GOTO L_461a7   '@46183 DS:3d76
    IF NOT (L_BP28$ = "r") THEN GOTO L_461de   '@46195 DS:3d7c
L_461a7:
    GOSUB L_48a43   '@461a7
    GOSUB L_48bc6   '@461b4
    GOSUB L_491b4   '@461c1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@461ce
L_461de:
    IF NOT (L_BP28$ <> "Z") THEN GOTO L_46202   '@461de DS:3dcc
    IF NOT (L_BP28$ = "z") THEN GOTO L_4634f   '@461f0 DS:3dd2
L_46202:
L_46207:
    RT_VIEWPRINT 23, 25   '@4620c
    RT_CLS 2   '@4621e
    RT_VIEWPRINT 1, 25   '@4622c
    LOCATE 24, 1   '@4623e
    PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@46259 DS:3dd8
    CALL MIXT_07f1_LimpaTeclado   '@46267
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@46271
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP216$ = V_0f18$   '@4628d
    IF NOT (L_BP216$ <> "D") THEN GOTO L_462cb   '@462a0 DS:3c8c
    IF NOT (L_BP216$ = "d") THEN GOTO L_46304   '@462b8 DS:3c92
L_462cb:
    CALL S_4954b   '@462cb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f18$ = "FIM") THEN GOTO L_462f4   '@462d5 DS:3e26
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46207   '@462ec
L_462f4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4052c   '@462f4
L_46304:
    IF NOT (L_BP216$ <> "T") THEN GOTO L_4632a   '@46304 DS:3ce2
    IF NOT (L_BP216$ = "t") THEN GOTO L_4633a   '@46317 DS:3ce8
L_4632a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4045d   '@4632a
L_4633a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@4633a
L_4634f:
    IF NOT (L_BP28$ <> "M") THEN GOTO L_46373   '@4634f DS:3e2e
    IF NOT (L_BP28$ = "m") THEN GOTO L_47409   '@46361 DS:3e34
L_46373:
    RT_VIEWPRINT 23, 25   '@46373
    RT_CLS 2   '@46385
    PRINT ""   '@46393 DS:38ec
    PRINT " Escolha o trecho a Modificar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*"; RT_TAB$(79); ""; "";   '@463a1 DS:38ec,3e3a
    RT_VIEWPRINT 1, 25   '@463ca
    IF NOT (L_BP1c% = 0) THEN GOTO L_46c1d   '@463dc
L_463ef:
    V_0f18$ = "NENHUM"   '@463f4 DS:3d52
    FOR V_0f10! = A_0fe6!(0, 0) TO 1.0 STEP -1.0   '@46406 DS:3844,3ade
    L_BP21a! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@46422
    L_BP21e! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@4644d
    CALL MIXT_0877_Menor(L_BP21a!, L_BP21e!, L_BP222!)   '@4646f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP21e!   '@46484
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP21a!   '@464a7
    L_BP226! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@464cc
    L_BP22a! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@464f1
    CALL MIXT_082a_Maior(L_BP226!, L_BP22a!, L_BP22e!)   '@46513
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP22a!   '@46528
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP226!   '@4654b
    L_BP232! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@46570
    L_BP236! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@46596
    CALL MIXT_0877_Menor(L_BP232!, L_BP236!, L_BP23a!)   '@465bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP236!   '@465d0
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP232!   '@465f6
    L_BP23e! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@4661c
    L_BP242! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@46642
    CALL MIXT_082a_Maior(L_BP23e!, L_BP242!, L_BP246!)   '@46667
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP242!   '@4667c
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP23e!   '@466a2
    IF NOT (L_BP246! <= V_14f0! AND (L_BP23a! >= V_14e8! AND (L_BP22e! <= V_14ec! AND L_BP222! >= V_14e4!))) THEN GOTO L_46b75   '@466c8
L_4673c:
    L_BP134! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@4673c
    L_BP138! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)) - V_14e8!) * V_14ba!   '@46775 DS:3b08
    L_BP13c! = (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@467b7
    L_BP140! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)) - V_14e8!) * V_14ba!   '@467ee DS:3b08
    V_0ee8! = V_14be!   '@46830
    GOSUB L_48d40   '@46841
    L_BP19a! = RT_TIMER   '@4684e
L_4686a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_4686a   '@4686a DS:3d5c
    V_0ee8! = L_BP16!   '@4688c
    GOSUB L_48d40   '@4689c
    L_BP19a! = RT_TIMER   '@468a9
L_468c4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_468c4   '@468c4 DS:3d5c
    V_0f18$ = RT_INKEY$   '@468e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_4673c   '@468fa DS:38ec
    L_BP24a$ = V_0f18$   '@46911
    IF NOT (L_BP24a$ <> "S") THEN GOTO L_4694f   '@46924 DS:38a8
    IF NOT (L_BP24a$ = "s") THEN GOTO L_46ab1   '@4693c DS:3d60
L_4694f:
L_46954:
    LOCATE 25, 1   '@46959
    PRINT USING " Digite a nova carga *###.##* \ \ "; RT_PU#(A_0fe6!(RT_CINT%(FX##(V_0f10!)), 4), " Digite a nova carga *###.##* \ \ ", 1); V_0de0$ + "/" + V_0ddc$;   '@46974 DS:3b8c,3e88
    CALL MIXT_07f1_LimpaTeclado   '@469cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@469d5 DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE , 1   '@469ef
    PRINT RT_TAB$(78); ""; "";   '@46a05 DS:38ec
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_46aa9   '@46a25
    IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_46a70   '@46a3a DS:3bbc
    BEEP   '@46a5e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46954   '@46a68
L_46a70:
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 4) = VAL(V_0f18$)   '@46a70
L_46aa9:
    GOTO L_46b70   '@46aa9
L_46ab1:
    IF NOT (L_BP24a$ <> "F") THEN GOTO L_46ad7   '@46ab1 DS:3d6a
    IF NOT (L_BP24a$ = "f") THEN GOTO L_46ae7   '@46ac4 DS:3d70
L_46ad7:
    GOTO L_46ba1   '@46ad7
L_46ae7:
    IF NOT (L_BP24a$ <> "R") THEN GOTO L_46b0d   '@46ae7 DS:3d76
    IF NOT (L_BP24a$ = "r") THEN GOTO L_46b6b   '@46afa DS:3d7c
L_46b0d:
    L_BP24e! = FX##(V_0f10!) + 2.0   '@46b0d DS:3888
    L_BP252! = FX##(A_0fe6!(0, 0)) + 1.0   '@46b23 DS:3844
    CALL MIXT_0877_Menor(L_BP24e!, L_BP252!, L_BP256!)   '@46b43
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f10! = L_BP256!   '@46b58
    GOTO L_46b70   '@46b63
L_46b6b:
L_46b70:
L_46b75:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@46b75 DS:3844,3ade
L_46ba1:
    L_BP258% = (V_0f10! = 0.0)   '@46ba1 DS:3840
    IF NOT ((A_0fe6!(0, 0) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP258%)) <> 0) THEN GOTO L_46c15   '@46bcb DS:3840,3d52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_463ef   '@46c0d
L_46c15:
    GOTO L_473f9   '@46c15
L_46c1d:
L_46c22:
    V_0f18$ = "NENHUM"   '@46c27 DS:3d52
    FOR V_0ef0! = A_1014!(0, 1) TO 1.0 STEP -1.0   '@46c39 DS:3844,3ade
    V_0f04! = 1.0   '@46c58 DS:3844
    V_0f14! = 1.0   '@46c69 DS:3844
L_46c7f:
    IF NOT (V_0f04! < V_0ef0!) THEN GOTO L_46cf5   '@46c84
    V_0f04! = FX##(V_0f04!) + 1.0   '@46c9f DS:3844
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@46cb5 DS:3888
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46c7f   '@46ce9
L_46cf5:
    L_BP25c! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@46cf5
    FOR L_BP1d8! = 1.0 TO L_BP25c!   '@46d20 DS:3844
    IF NOT (A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 0) > V_14ec! OR A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 0) < V_14e4!) THEN GOTO L_46dc7   '@46d28 DS:3844
    L_BP1d8! = 0.0   '@46dae DS:3840
    GOTO L_46e94   '@46dbf
L_46dc7:
    IF NOT (A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 1) > V_14f0! OR A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 1) < V_14e8!) THEN GOTO L_46e68   '@46dc7 DS:3844
    L_BP1d8! = 0.0   '@46e4f DS:3840
    GOTO L_46e94   '@46e60
L_46e68:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1d8!   '@46e68 DS:3844
L_46e94:
    IF NOT (L_BP1d8! = 0.0) THEN GOTO L_46eb7   '@46e94 DS:3840
    GOTO L_4734c   '@46eaf
L_46eb7:
L_46ebc:
    V_0ee8! = V_14be!   '@46ebc
    GOSUB L_4929c   '@46ecd
    L_BP19a! = RT_TIMER   '@46eda
L_46ef6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_46ef6   '@46ef6 DS:3d5c
    V_0ee8! = L_BP1a!   '@46f18
    GOSUB L_4929c   '@46f28
    L_BP19a! = RT_TIMER   '@46f35
L_46f50:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP19a! < 0.100000001490116119384765625## THEN GOTO L_46f50   '@46f50 DS:3d5c
    V_0f18$ = RT_INKEY$   '@46f72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f18$ <> "") THEN GOTO L_46ebc   '@46f86 DS:38ec
    L_BP260$ = V_0f18$   '@46f9d
    IF NOT (L_BP260$ <> "S") THEN GOTO L_46fdb   '@46fb0 DS:38a8
    IF NOT (L_BP260$ = "s") THEN GOTO L_47285   '@46fc8 DS:3d60
L_46fdb:
L_46fe0:
    LOCATE 25, 1   '@46fe5
    PRINT USING " Carga Ocupacao *###.##* \  \ "; RT_PU#(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0), " Carga Ocupacao *###.##* \  \ ", 1); V_0de0$ + "/" + V_0ddc$ + "2";   '@47000 DS:3844,3aee,3b8c,3eae
    CALL MIXT_07f1_LimpaTeclado   '@47065
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@4706f DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_47111   '@47089
    IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_470d4   '@4709e DS:3bbc
    BEEP   '@470c2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46fe0   '@470cc
L_470d4:
    A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) = VAL(V_0f18$)   '@470d4 DS:3844
L_47111:
    LOCATE 25, 38   '@47111
    PRINT USING " Parcela Acidental *###.##* \  \ "; RT_PU#(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 1), " Parcela Acidental *###.##* \  \ ", 1); V_0de0$ + "/" + V_0ddc$ + "2";   '@4712f DS:3844,3aee,3b8c,3ed0
    CALL MIXT_07f1_LimpaTeclado   '@47195
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@4719f DS:38ec (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_47242   '@471b9
    IF NOT (VAL(V_0f18$) <= 0.0#) THEN GOTO L_47204   '@471ce DS:3bbc
    BEEP   '@471f2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46fe0   '@471fc
L_47204:
    A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 1) = VAL(V_0f18$)   '@47204 DS:3844
L_47242:
    LOCATE 25, 1   '@47242
    PRINT RT_TAB$(80); ""; "";   '@4725d DS:38ec
    GOTO L_47347   '@4727d
L_47285:
    IF NOT (L_BP260$ <> "F") THEN GOTO L_472ab   '@47285 DS:3d6a
    IF NOT (L_BP260$ = "f") THEN GOTO L_472bb   '@47298 DS:3d70
L_472ab:
    GOTO L_4737d   '@472ab
L_472bb:
    IF NOT (L_BP260$ <> "R") THEN GOTO L_472e1   '@472bb DS:3d76
    IF NOT (L_BP260$ = "r") THEN GOTO L_47342   '@472ce DS:3d7c
L_472e1:
    L_BP264! = FX##(V_0ef0!) + 2.0   '@472e1 DS:3888
    L_BP268! = FX##(A_1014!(0, 1)) + 1.0   '@472f7 DS:3844
    CALL MIXT_0877_Menor(L_BP264!, L_BP268!, L_BP26c!)   '@4731a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef0! = L_BP26c!   '@4732f
    GOTO L_47347   '@4733a
L_47342:
L_47347:
L_4734c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@47351 DS:3844,3ade
L_4737d:
    L_BP26e% = (V_0ef0! = 0.0)   '@4737d DS:3840
    IF NOT ((A_1014!(0, 1) > 0.0 AND (V_0f18$ <> "NENHUM" AND L_BP26e%)) <> 0) THEN GOTO L_473f4   '@473a7 DS:3840,3d52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46c22   '@473ec
L_473f4:
L_473f9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@473f9
L_47409:
    IF NOT (L_BP28$ <> "C") THEN GOTO L_4742d   '@47409 DS:3ef6
    IF NOT (L_BP28$ = "c") THEN GOTO L_476c7   '@4741b DS:3efc
L_4742d:
    IF NOT (V_14c2% = 0) THEN GOTO L_47457   '@4742d
    V_14c2% = 1   '@4743c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@47447
L_47457:
    RT_VIEWPRINT 23, 25   '@47457
    RT_CLS 2   '@47469
    RT_VIEWPRINT 1, 25   '@47477
    LOCATE 23, 1   '@47489
    PRINT USING " Movimente o cursor ate a Coordenada *###.###,###.###* "; RT_PU#(V_14c4!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 1); RT_PU#(V_14c8!, " Movimente o cursor ate a Coordenada *###.###,###.###* ", 2);   '@474a4 DS:3f02
    CALL MIXT_07f1_LimpaTeclado   '@474d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_0f18$, V_0f1c$)   '@474db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP270% = (LEN(V_0f18$) = 0)   '@474ed
    IF NOT ((LEN(V_0f1c$) = 0 AND L_BP270%) <> 0) THEN GOTO L_4752b   '@4750b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@47523
L_4752b:
    L_BP272% = (LEN(V_0f18$) > 0)   '@4752b
    L_BP274% = FX##(VAL(V_0f18$)) >= FX##(V_14e4!) AND L_BP272%   '@4754e
    IF NOT ((FX##(VAL(V_0f18$)) <= FX##(V_14ec!) AND L_BP274%) <> 0) THEN GOTO L_475b4   '@47578
    V_14c4! = VAL(V_0f18$)   '@4759a
L_475b4:
    L_BP276% = (LEN(V_0f1c$) > 0)   '@475b4
    L_BP278% = FX##(VAL(V_0f1c$)) >= FX##(V_14e8!) AND L_BP276%   '@475d7
    IF NOT ((FX##(VAL(V_0f1c$)) <= FX##(V_14f0!) AND L_BP278%) <> 0) THEN GOTO L_4763d   '@47601
    V_14c8! = VAL(V_0f1c$)   '@47623
L_4763d:
    GOSUB L_4872d   '@4763d
    LOCATE 23, 40   '@4764a
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14c4!, "(###.##,###.##)", 1); RT_PU#(V_14c8!, "(###.##,###.##)", 2)   '@47668 DS:3a90
    V_14cc! = V_14c4!   '@47690
    V_14d0! = V_14c8!   '@476a1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@476b2
L_476c7:
    IF NOT (L_BP28$ <> "E") THEN GOTO L_476eb   '@476c7 DS:3cfa
    IF NOT (L_BP28$ = "e") THEN GOTO L_47715   '@476d9 DS:3d00
L_476eb:
    IF NOT (V_14c2% = 1) THEN GOTO L_47705   '@476eb
    V_14c2% = 0   '@476fa
L_47705:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@47705
L_47715:
    IF NOT (L_BP28$ <> "A") THEN GOTO L_47739   '@47715 DS:3afa
    IF NOT (L_BP28$ = "a") THEN GOTO L_47771   '@47727 DS:3f3e
L_47739:
    IF NOT (L_BP1c% = 0) THEN GOTO L_47761   '@47739
    L_BP1c% = 1   '@47747
    L_BP20! = 0.0   '@47751 DS:3840
L_47761:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@47761
L_47771:
    IF NOT (L_BP28$ <> "L") THEN GOTO L_47795   '@47771 DS:3f44
    IF NOT (L_BP28$ = "l") THEN GOTO L_477bd   '@47783 DS:3f4a
L_47795:
    IF NOT (L_BP1c% = 1) THEN GOTO L_477ad   '@47795
    L_BP1c% = 0   '@477a3
L_477ad:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@477ad
L_477bd:
    IF NOT (L_BP28$ = "+") THEN GOTO L_47804   '@477bd DS:3f50
    IF NOT (V_14c2% = 1) THEN GOTO L_477f4   '@477cf
    V_14f6! = FX##(V_14f6!) * 2.0   '@477de DS:3888
L_477f4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@477f4
L_47804:
    IF NOT (L_BP28$ = "-") THEN GOTO L_4784b   '@47804 DS:3f56
    IF NOT (V_14c2% = 1) THEN GOTO L_4783b   '@47816
    V_14f6! = FX##(V_14f6!) / 2.0   '@47825 DS:3888
L_4783b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@4783b
L_4784b:
    IF NOT (L_BP28$ <> "P") THEN GOTO L_4786f   '@4784b DS:3f5c
    IF NOT (L_BP28$ = "p") THEN GOTO L_479b6   '@4785d DS:3f62
L_4786f:
    IF NOT (V_14c2% = 0) THEN GOTO L_47886   '@4786f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@4787e
L_47886:
    RT_VIEWPRINT 23, 25   '@47886
    RT_CLS 2   '@47898
    RT_VIEWPRINT 1, 25   '@478a6
    LOCATE 23, 1   '@478b8
    PRINT USING " Passo de movimentacao *###.####* "; RT_PU#(V_14f6!, " Passo de movimentacao *###.####* ", 1);   '@478d3 DS:3f68
    CALL MIXT_07f1_LimpaTeclado   '@478f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@478fd DS:38ec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) > 0) THEN GOTO L_479a6   '@47917
    L_BP27a% = (VAL(V_0f18$) > 0.0#)   '@4792c DS:3bbc,3f8e
    IF NOT ((FX##(VAL(V_0f18$)) < 50.0 * FX##(V_14f6!) AND L_BP27a%) <> 0) THEN GOTO L_479a1   '@47965
    V_14f6! = VAL(V_0f18$)   '@47987
L_479a1:
L_479a6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40a49   '@479a6
L_479b6:
    IF NOT (L_BP28$ <> "F") THEN GOTO L_479da   '@479b6 DS:3d6a
    IF NOT (L_BP28$ = "f") THEN GOTO L_479ff   '@479c8 DS:3d70
L_479da:
    RT_SCREEN 0   '@479da
    GOTO L_494ed   '@479ef
L_479ff:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@479ff
L_47a0c:
    GOSUB L_4872d   '@47a0c
    LOCATE 23, 60   '@47a19
    V_0f18$ = ""   '@47a37 DS:38ec
    IF NOT (V_14c2% = 0) THEN GOTO L_47c43   '@47a49
    L_BP27e! = A_0f8a!(0, 1)   '@47a58
    FOR V_0f10! = 1.0 TO L_BP27e!   '@47a7c DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) = V_14c4!) THEN GOTO L_47b5b   '@47a84
    V_0f18$ = CHR$(RT_CINT%(FX##(V_0f10!) + 26& * ((RT_CLNG&(FX##(V_0f10!)) \ 26&) * (V_0f10! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f10!) - 1.0) \ 26&), ("'"))   '@47ab9 DS:3ade,3f92,3f96,3f9e
    GOTO L_47b87   '@47b53
L_47b5b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@47b5b DS:3844
L_47b87:
    L_BP282! = A_0f8a!(0, 0)   '@47b87
    FOR V_0f10! = 1.0 TO L_BP282!   '@47ba8 DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) = V_14c8!) THEN GOTO L_47c12   '@47bb0
    V_0f18$ = V_0f18$ + STR$(V_0f10!)   '@47be4
    GOTO L_47c3e   '@47c0a
L_47c12:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@47c12 DS:3844
L_47c3e:
L_47c43:
    PRINT USING "(###.##,###.##) \   \ "; RT_PU#(V_14c4!, "(###.##,###.##) \   \ ", 1); RT_PU#(V_14c8!, "(###.##,###.##) \   \ ", 2); V_0f18$   '@47c43 DS:3fa4
    V_14cc! = V_14c4!   '@47c74
    V_14d0! = V_14c8!   '@47c85
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40dbd   '@47c96
    ' ---- F_47c9e @0x47c9e  (047c9e_F_47c9e.lift.txt; evidence_id (assembly): ev_71200d3b7b43886e95a6a5f6c4a2db715615e52f479d0627b8a2da4adee7c945)
L_47ca3:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    GOSUB L_488b0   '@47ca8
    V_14dc! = V_14c4!   '@47cb5
    V_14e0! = V_14c8!   '@47cc6
    L_BP20! = 0.0   '@47cd7 DS:3840
    LOCATE 24, 11   '@47ce7
    PRINT USING "(###.##,###.##)"; RT_PU#(V_14dc!, "(###.##,###.##)", 1); RT_PU#(V_14e0!, "(###.##,###.##)", 2);   '@47d05 DS:3a90
    RETURN   '@47d32
L_47d41:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    V_0f18$ = ""   '@47d46 DS:38ec
    V_0f1c$ = ""   '@47d58 DS:38ec
    L_BP284% = (V_0dcc_placa$ = "EGA")   '@47d6a DS:3868
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP284%) <> 0) THEN GOTO L_47dbc   '@47d90 DS:3870
    COLOR 10   '@47da6
L_47dbc:
    L_BP288! = A_0f8a!(0, 0)   '@47dbc
    FOR V_0f14! = 1.0 TO L_BP288!   '@47ddd DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= V_14f0! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= V_14e8!) THEN GOTO L_481b9   '@47de4
    L_BP28c! = 2.0   '@47e56 DS:3888
    L_BP290! = 169.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!   '@47e68 DS:38ae
    L_BP294$ = LTRIM$(STR$(V_0f14!))   '@47ea3
    L_BP298$ = "CGA"   '@47ec1 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP28c!, L_BP290!, L_BP294$, L_BP298$)   '@47ecf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @47ee8 libera strings locais (L_BP294)
    ' @47ef2 libera strings locais (L_BP298)
    L_BP29c! = A_0f8a!(0, 1)   '@47efc
    FOR V_0f04! = 1.0 TO L_BP29c!   '@47f20 DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) <= V_14ec! AND A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1) >= V_14e4!) THEN GOTO L_48176   '@47f28
    IF NOT (V_0f18$ = "") THEN GOTO L_480e1   '@47f9c DS:38ec
    L_BP2a0! = (FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! - 3.0 + V_14d4!   '@47fb3 DS:3fbe
    L_BP2a4! = 165.0   '@47ff3 DS:3b08
    L_BP2a8$ = CHR$(RT_CINT%(FX##(V_0f04!) + 26& * ((RT_CLNG&(FX##(V_0f04!)) \ 26&) * (V_0f04! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_0f04!) - 1.0) \ 26&), ("'"))   '@47fff DS:3ade,3f92,3f96,3f9e
    L_BP2ac$ = "CGA"   '@48094 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP2a0!, L_BP2a4!, L_BP2a8$, L_BP2ac$)   '@480a2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @480bb libera strings locais (L_BP2a8)
    ' @480c5 libera strings locais (L_BP2ac)
    V_0f1c$ = "*"   '@480cf DS:3af4
L_480e1:
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@480e1 DS:3b08
L_48176:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@48176 DS:3844
    V_0f18$ = V_0f1c$   '@481a2
L_481b9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@481b9 DS:3844
    L_BP2ae% = (V_0dcc_placa$ = "EGA")   '@481e5 DS:3868
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP2ae%) <> 0) THEN GOTO L_4823e   '@4820b DS:3870
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@48221
L_4823e:
    RETURN   '@4823e
L_4824d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    L_BP2b2! = A_0f8a!(0, 0)   '@48252
    FOR V_0f14! = 1.0 TO L_BP2b2!   '@48273 DS:3844
    L_BP2b6! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@4827a
    L_BP2ba! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@482a6
    CALL MIXT_082a_Maior(L_BP2b6!, L_BP2ba!, L_BP2be!)   '@482cb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP2ba!   '@482e0
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP2b6!   '@48306
    L_BP2c2! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1)   '@4832c
    L_BP2c6! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3)   '@48352
    CALL MIXT_0877_Menor(L_BP2c2!, L_BP2c6!, L_BP2ca!)   '@48377
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 3) = L_BP2c6!   '@4838c
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 1) = L_BP2c2!   '@483b2
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) >= L_BP2ca! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0) <= L_BP2be!) THEN GOTO L_486f2   '@483d8
    L_BP2ce! = A_0f8a!(0, 1)   '@48444
    FOR V_0f04! = 1.0 TO L_BP2ce!   '@48468 DS:3844
    L_BP2d2! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@48470
    L_BP2d6! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@4849b
    CALL MIXT_082a_Maior(L_BP2d2!, L_BP2d6!, L_BP2da!)   '@484bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP2d6!   '@484d2
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP2d2!   '@484f5
    L_BP2de! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0)   '@4851a
    L_BP2e2! = A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2)   '@4853f
    CALL MIXT_0877_Menor(L_BP2de!, L_BP2e2!, L_BP2e6!)   '@48561
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 2) = L_BP2e2!   '@48576
    A_0fe6!(RT_CINT%(FX##(V_0f10!)), 0) = L_BP2de!   '@48599
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) >= L_BP2e6! AND A_0f8a!(RT_CINT%(FX##(V_0f14!)), 1) <= L_BP2da!) THEN GOTO L_486c1   '@485be
    RT_PSET RT_SNG!((FX##(A_0f8a!(RT_CINT%(FX##(V_0f04!)), 1)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0f8a!(RT_CINT%(FX##(V_0f14!)), 0)) - V_14e8!) * V_14ba!), 0, 0   '@4862c DS:3b08
L_486c1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@486c1 DS:3844
L_486f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@486f2 DS:3844
    RETURN   '@4871e
L_4872d:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    RT_GPONTO RT_SNG!((FX##(V_14cc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14d0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@48732 DS:3b00
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@4879c DS:38ae
    L_BP2ea! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@4880f
    L_BP2ee! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@48830 DS:38ae
    L_BP2f2$ = CHR$(27)   '@48852
    L_BP2f6$ = "CGA"   '@48866 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP2ea!, L_BP2ee!, L_BP2f2$, L_BP2f6$)   '@48874
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4888d libera strings locais (L_BP2f2)
    ' @48897 libera strings locais (L_BP2f6)
    RETURN   '@488a1
L_488b0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    RT_GPONTO RT_SNG!(FX##(V_14d4!) - 8.0 + (FX##(V_14dc!) - V_14e4!) * V_14b6!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14e0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(241), PSET: RT_GFIM   '@488b5 DS:3b00,3b04
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), -8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(241): RT_GFIM   '@4892a DS:38ae
    L_BP2fa! = (FX##(V_14c4!) - V_14e4!) * V_14b6! - 8.0 + V_14d4!   '@4899d DS:3b04
    L_BP2fe! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@489c3 DS:38ae
    L_BP302$ = CHR$(26)   '@489e5
    L_BP306$ = "CGA"   '@489f9 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BP2fa!, L_BP2fe!, L_BP302$, L_BP306$)   '@48a07
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @48a20 libera strings locais (L_BP302)
    ' @48a2a libera strings locais (L_BP306)
    RETURN   '@48a34
L_48a43:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    L_BP30a! = A_0fb8!(0, 0)   '@48a48
    FOR L_BP1d8! = 1.0 TO L_BP30a!   '@48a69 DS:3844
    RT_PSET RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP1d8!)), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP1d8!)), 1)) - V_14e8!) * V_14ba!), 0, 0   '@48a70 DS:3b08
    RT_LINE 0, 0, RT_SNG!((FX##(A_0fb8!(RT_CINT%(FX##(L_BP1d8!)), 2)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_0fb8!(RT_CINT%(FX##(L_BP1d8!)), 3)) - V_14e8!) * V_14ba!), 8, RT_CINT%(FX##(L_BP0e!)), 0   '@48af6 DS:3b08
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1d8!   '@48b8b DS:3844
    RETURN   '@48bb7
L_48bc6:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    L_BP30e! = A_0fe6!(0, 0)   '@48bcb
    FOR L_BP1d8! = 1.0 TO L_BP30e!   '@48bec DS:3844
    L_BP134! = (FX##(A_0fe6!(RT_CINT%(FX##(L_BP1d8!)), 0)) - V_14e4!) * V_14b6! + V_14d4!   '@48bf4
    L_BP138! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(L_BP1d8!)), 1)) - V_14e8!) * V_14ba!   '@48c2d DS:3b08
    L_BP13c! = (FX##(A_0fe6!(RT_CINT%(FX##(L_BP1d8!)), 2)) - V_14e4!) * V_14b6! + V_14d4!   '@48c6f
    L_BP140! = 165.0 - FX##(V_14d8!) - (FX##(A_0fe6!(RT_CINT%(FX##(L_BP1d8!)), 3)) - V_14e8!) * V_14ba!   '@48ca6 DS:3b08
    V_0ee8! = L_BP16!   '@48ce8
    GOSUB L_48d40   '@48cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1d8!   '@48d05 DS:3844
    RETURN   '@48d31
L_48d40:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    CALL MIXT_0877_Menor(L_BP134!, L_BP13c!, L_BP312!)   '@48d45
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP134!, L_BP13c!, L_BP316!)   '@48d5e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP138!, L_BP140!, L_BP31a!)   '@48d72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP138!, L_BP140!, L_BP31e!)   '@48d86
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP31e! < 0.0 OR (L_BP31a! > 175.0 OR (L_BP316! < 0.0 OR L_BP312! > 639.0))) THEN GOTO L_48e13   '@48d9b DS:3840,3898,3fc2
    RETURN   '@48e09
L_48e13:
    IF NOT (L_BP134! <> L_BP13c!) THEN GOTO L_48f6a   '@48e13
    L_BP322! = ATN(ABS((FX##(L_BP140!) - L_BP138!) / (FX##(L_BP13c!) - L_BP134!)))   '@48e2e
    IF NOT (L_BP140! <= L_BP138! AND L_BP13c! < L_BP134!) THEN GOTO L_48eb2   '@48e5b
    L_BP322! = FX##(V_0e68_pi#) - L_BP322!   '@48e99
L_48eb2:
    IF NOT (L_BP140! > L_BP138! AND L_BP13c! < L_BP134!) THEN GOTO L_48f06   '@48eb2
    L_BP322! = FX##(L_BP322!) + V_0e68_pi#   '@48ef0
L_48f06:
    IF NOT (L_BP140! > L_BP138! AND L_BP13c! > L_BP134!) THEN GOTO L_48f62   '@48f06
    L_BP322! = 2.0# * FX##(V_0e68_pi#) - L_BP322!   '@48f44 DS:3fc6
L_48f62:
    GOTO L_48fbb   '@48f62
L_48f6a:
    L_BP322! = FX##(V_0e68_pi#) / 2.0#   '@48f6a DS:3fc6
    IF NOT (L_BP140! > L_BP138!) THEN GOTO L_48fb6   '@48f80
    L_BP322! = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@48f9b DS:3fc6,3fce
L_48fb6:
L_48fbb:
    L_BP326! = RT_SIN##(FX##(L_BP322!)) * 3.0   '@48fbb DS:3fd6
    L_BP32a! = RT_COS##(FX##(L_BP322!)) * 1.25   '@48fd8 DS:3fda
    L_BP32e! = RT_SQR##(RT_POT##((FX##(L_BP140!) - L_BP138!), (2.0)) + RT_POT##((FX##(L_BP13c!) - L_BP134!), (2.0)))   '@48ff5 DS:3888
    L_BP332! = 6.0 - ABS(RT_SIN##(FX##(L_BP322!))) * 4.0   '@49033 DS:3d66,3fde
    L_BP336! = L_BP32e!   '@4905b
    L_BP33a! = L_BP332!   '@4906d
    L_BP33e! = 1.0   '@49079 DS:3844
    GOTO L_4915a_v   '@49079
L_49080:
    RT_PSET RT_SNG!(RT_COS##(FX##(L_BP322!)) * L_BP33e! - L_BP326! + L_BP134!), RT_SNG!(L_BP138! - RT_SIN##(FX##(L_BP322!)) * L_BP33e! - L_BP32a!), 0, 0   '@49080
    RT_LINE 0, 0, RT_SNG!(RT_COS##(FX##(L_BP322!)) * L_BP33e! + L_BP134! + L_BP326!), RT_SNG!(L_BP138! - RT_SIN##(FX##(L_BP322!)) * L_BP33e! + L_BP32a!), 8, RT_CINT%(FX##(V_0ee8!)), 0   '@490dc
L_49159:
    L_BP33e! = FX##(L_BP33e!) + L_BP33a!   '@4915a
L_4915a_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP33a! < 0.0) THEN GOTO L_4918f   '@49161 DS:3840
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP33e! < L_BP336!) THEN GOTO L_49080   '@49177
    GOTO L_491a5   '@4918c
L_4918f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP33e! > L_BP336!) THEN GOTO L_49080   '@49190
L_491a5:
    RETURN   '@491a5
L_491b4:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    IF NOT (A_1014!(0, 1) = 0.0) THEN GOTO L_491f0   '@491b9 DS:3840
    RETURN   '@491e6
L_491f0:
    V_0ee8! = L_BP1a!   '@491f0
    V_0f14! = 1.0   '@49200 DS:3844
L_49216:
    GOSUB L_4929c   '@4921b
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@49228 DS:3888
    IF NOT (A_1014!(0, 0) > V_0f14!) THEN GOTO L_4928d   '@4925c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49216   '@49286
L_4928d:
    RETURN   '@4928d
L_4929c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040137_FUN_4000_0137
    RT_PSET RT_SNG!((FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 1)) - V_14e8!) * V_14ba!), 0, 0   '@492a1 DS:3888,3b08
    L_BP342! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@49331
    FOR L_BP1d8! = 1.0 TO L_BP342!   '@4935c DS:3844
    RT_LINE 0, 0, RT_SNG!((FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0 + L_BP1d8!), 1)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(V_0ee8!)), 4369   '@49364 DS:3844,3b08
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1d8!   '@49410 DS:3844
    RT_LINE 0, 0, RT_SNG!((FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 0)) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 1)) - V_14e8!) * V_14ba!), 72, RT_CINT%(FX##(V_0ee8!)), 4369   '@4943c DS:3888,3b08
    RETURN   '@494de
L_494ed:   ' entrada vinda de 040137_FUN_4000_0137
    ' @494ed libera strings locais (L_BP260)
    ' @494f7 libera strings locais (L_BP24a)
    ' @49501 libera strings locais (L_BP216)
    ' @4950b libera strings locais (L_BP1dc)
    ' @49515 libera strings locais (L_BP19e)
    ' @4951f libera strings locais (L_BP166)
    ' @49529 libera strings locais (L_BP28)
    ' @49532 libera strings locais (L_BP24)
    ' END SUB   '@4953b
END SUB

SUB S_4954b   ' entrada de SUB/FUNCTION (B$ENRA, locais 200 bytes) (0x4954b)
    DIM L_BP56!
    DIM L_BP5a$
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
    DIM L_BPce$
    DIM L_BPd2$
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP2e%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP40%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP52%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_4000_954b @0x4954b  (04954b_FUN_4000_954b.lift.txt; evidence_id (assembly): ev_e476bf07bb06479eb8fbf86882208f4a0d4e87173ec08a1c4f3905aff9c498df)
    REDIM L_BP1c%(0 TO 162)   '@49553
    REDIM L_BP2e%(0 TO 162)   '@49570
    REDIM L_BP40%(0 TO 704)   '@49588
    REDIM L_BP52%(0 TO 704)   '@495a0
    L_BP56! = 0.0   '@495b8 DS:3840
L_495cd:
    RT_VIEWPRINT 23, 25   '@495d2
    RT_CLS 2   '@495e4
    RT_VIEWPRINT 1, 25   '@495f2
    LOCATE 24, 1   '@49604
    IF NOT (L_BP56! = 0.0) THEN GOTO L_4964f   '@4961f DS:3840
    PRINT "  Movimente o cursor ate o PRIMEIRO canto e acione <Enter>  ou  <R>etorna"   '@49639 DS:3fe2
    GOTO L_49662   '@49647
L_4964f:
    PRINT "  Movimente o cursor ate o  SEGUNDO canto e acione <Enter>  ou  <R>etorna"   '@4964f DS:4030
L_49662:
L_49667:
    V_0f18$ = ""   '@4966c DS:38ec
L_49684:
    V_0f18$ = RT_INKEY$   '@49684
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f18$ = "" THEN GOTO L_49684   '@49698 DS:38ec
    L_BP5a$ = V_0f18$   '@496ac
    IF NOT (L_BP5a$ <> "R") THEN GOTO L_496e7   '@496be DS:3d76
    IF NOT (L_BP5a$ = "r") THEN GOTO L_498e8   '@496d5 DS:3d7c
L_496e7:
    IF NOT (L_BP56! = 1.0) THEN GOTO L_498c6   '@496e7 DS:3844
    CALL MIXT_0877_Menor(L_BP62!, L_BP66!, L_BP5e!)   '@49701
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP5e!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@49718 DS:3b08
    CALL MIXT_0877_Menor(L_BP62!, L_BP66!, L_BP6e!)   '@49771
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP6e!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@49788 DS:3b08
    CALL MIXT_082a_Maior(L_BP72!, L_BP6a!, L_BP76!)   '@497e1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP76!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@497f8 DS:3b08
    CALL MIXT_082a_Maior(L_BP72!, L_BP6a!, L_BP7a!)   '@49851
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP7a!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@49868 DS:3b08
L_498c6:
    V_0f18$ = "FIM"   '@498c6 DS:3e26
    GOTO L_4aa6d   '@498d8
L_498e8:
    IF NOT (L_BP5a$ <> "4") THEN GOTO L_49921   '@498e8 DS:3ad0
    IF NOT (CHR$(0) + CHR$(75) = L_BP5a$) THEN GOTO L_49a66   '@498fa
L_49921:
    IF NOT (V_14c2% = 0) THEN GOTO L_49a26   '@49921
    FOR V_0f10! = A_0f8a!(0, 1) TO 1.0 STEP -1.0   '@49930 DS:3844,3ade
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) < V_14cc!) THEN GOTO L_499f2   '@49950
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) >= V_14e4!) THEN GOTO L_499e5   '@49985
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@499ba
L_499e5:
    GOTO L_49a1e   '@499e5
L_499f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@499f2 DS:3844,3ade
L_49a1e:
    GOTO L_49a5e   '@49a1e
L_49a26:
    L_BP7e! = FX##(V_14cc!) - V_14f6!   '@49a26
    CALL MIXT_082a_Maior(V_14e4!, L_BP7e!, L_BP82!)   '@49a3b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP82!   '@49a4e
L_49a5e:
    GOTO L_4a319   '@49a5e
L_49a66:
    IF NOT (L_BP5a$ <> "6") THEN GOTO L_49a9f   '@49a66 DS:3ae2
    IF NOT (CHR$(0) + CHR$(77) = L_BP5a$) THEN GOTO L_49bf2   '@49a78
L_49a9f:
    IF NOT (V_14c2% = 0) THEN GOTO L_49bb0   '@49a9f
    L_BP86! = A_0f8a!(0, 1)   '@49aae
    FOR V_0f10! = 1.0 TO L_BP86!   '@49ad2 DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) > V_14cc!) THEN GOTO L_49b7c   '@49ada
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1) <= V_14ec!) THEN GOTO L_49b6f   '@49b0f
    V_14c4! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 1)   '@49b44
L_49b6f:
    GOTO L_49ba8   '@49b6f
L_49b7c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@49b7c DS:3844
L_49ba8:
    GOTO L_49bea   '@49ba8
L_49bb0:
    L_BP8a! = FX##(V_14cc!) + V_14f6!   '@49bb0
    CALL MIXT_0877_Menor(V_14ec!, L_BP8a!, L_BP8e!)   '@49bc6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c4! = L_BP8e!   '@49bda
L_49bea:
    GOTO L_4a319   '@49bea
L_49bf2:
    IF NOT (L_BP5a$ <> "8") THEN GOTO L_49c2b   '@49bf2 DS:3ae8
    IF NOT (CHR$(0) + CHR$(72) = L_BP5a$) THEN GOTO L_49d77   '@49c04
L_49c2b:
    IF NOT (V_14c2% = 0) THEN GOTO L_49d35   '@49c2b
    L_BP92! = A_0f8a!(0, 0)   '@49c3a
    FOR V_0f10! = 1.0 TO L_BP92!   '@49c5b DS:3844
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) > V_14d0!) THEN GOTO L_49d01   '@49c62
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) <= V_14f0!) THEN GOTO L_49cf4   '@49c96
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@49cca
L_49cf4:
    GOTO L_49d2d   '@49cf4
L_49d01:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@49d01 DS:3844
L_49d2d:
    GOTO L_49d6f   '@49d2d
L_49d35:
    L_BP96! = FX##(V_14d0!) + V_14f6!   '@49d35
    CALL MIXT_0877_Menor(V_14f0!, L_BP96!, L_BP9a!)   '@49d4b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BP9a!   '@49d5f
L_49d6f:
    GOTO L_4a319   '@49d6f
L_49d77:
    IF NOT (L_BP5a$ <> "2") THEN GOTO L_49db0   '@49d77 DS:3aee
    IF NOT (CHR$(0) + CHR$(80) = L_BP5a$) THEN GOTO L_49ef1   '@49d89
L_49db0:
    IF NOT (V_14c2% = 0) THEN GOTO L_49eaf   '@49db0
    FOR V_0f10! = A_0f8a!(0, 0) TO 1.0 STEP -1.0   '@49dbf DS:3844,3ade
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) < V_14d0!) THEN GOTO L_49e7b   '@49ddc
    IF NOT (A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0) >= V_14e8!) THEN GOTO L_49e6e   '@49e10
    V_14c8! = A_0f8a!(RT_CINT%(FX##(V_0f10!)), 0)   '@49e44
L_49e6e:
    GOTO L_49ea7   '@49e6e
L_49e7b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@49e7b DS:3844,3ade
L_49ea7:
    GOTO L_49ee9   '@49ea7
L_49eaf:
    L_BP9e! = FX##(V_14d0!) - V_14f6!   '@49eaf
    CALL MIXT_082a_Maior(V_14e8!, L_BP9e!, L_BPa2!)   '@49ec5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14c8! = L_BPa2!   '@49ed9
L_49ee9:
    GOTO L_4a319   '@49ee9
L_49ef1:
    IF NOT (CHR$(13) = L_BP5a$) THEN GOTO L_4a30c   '@49ef1
    IF NOT (L_BP56! = 0.0) THEN GOTO L_4a20b   '@49f09 DS:3840
    L_BP62! = V_14c4!   '@49f23
    L_BP72! = V_14c8!   '@49f33
    L_BP66! = V_14c4!   '@49f43
    L_BP6a! = V_14c8!   '@49f53
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@49f63 DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@4a005 DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@4a0a7 DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@4a149 DS:3b08
    L_BP56! = 1.0   '@4a1eb DS:3844
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_495cd   '@4a1fb
L_4a20b:
    IF NOT (V_14c8! = L_BP72! OR V_14c4! = L_BP62!) THEN GOTO L_4a259   '@4a20b
    BEEP   '@4a247
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_495cd   '@4a251
L_4a259:
    CALL MIXT_0877_Menor(L_BP62!, V_14c4!, L_BPa6!)   '@4a259
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14e4! = L_BPa6!   '@4a271
    CALL MIXT_0877_Menor(L_BP72!, V_14c8!, L_BPaa!)   '@4a27c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14e8! = L_BPaa!   '@4a294
    CALL MIXT_082a_Maior(L_BP62!, V_14c4!, L_BPae!)   '@4a29f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14ec! = L_BPae!   '@4a2b7
    CALL MIXT_082a_Maior(L_BP72!, V_14c8!, L_BPb2!)   '@4a2c2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_14f0! = L_BPb2!   '@4a2da
    V_0f18$ = ""   '@4a2e5 DS:38ec
    GOTO L_4aa6d   '@4a2f7
L_4a30c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49667   '@4a30c
L_4a319:
    IF NOT (L_BP56! = 1.0) THEN GOTO L_4a520   '@4a319 DS:3844
    CALL MIXT_0877_Menor(L_BP62!, L_BP66!, L_BPb6!)   '@4a333
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPb6!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@4a34b DS:3b08
    CALL MIXT_0877_Menor(L_BP62!, L_BP66!, L_BPba!)   '@4a3a5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPba!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@4a3bd DS:3b08
    CALL MIXT_082a_Maior(L_BP72!, L_BP6a!, L_BPbe!)   '@4a417
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BPbe!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@4a42f DS:3b08
    CALL MIXT_082a_Maior(L_BP72!, L_BP6a!, L_BPc2!)   '@4a489
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BPc2!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@4a4a1 DS:3b08
    L_BP66! = V_14c4!   '@4a4fb
    L_BP6a! = V_14c8!   '@4a50b
L_4a520:
    GOSUB L_4a8ea   '@4a520
    V_14cc! = V_14c4!   '@4a52d
    V_14d0! = V_14c8!   '@4a53e
    IF NOT (L_BP56! = 1.0) THEN GOTO L_4a8dd   '@4a54f DS:3844
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@4a569 DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@4a60b DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@4a6ad DS:3b08
    RT_GCAIXA RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@4a74f DS:3b08
    RT_PSET RT_SNG!((FX##(L_BP62!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP72!) - V_14e8!) * V_14ba!), 0, 0   '@4a7f1 DS:3b08
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP66!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(165.0 - FX##(V_14d8!) - (FX##(L_BP6a!) - V_14e8!) * V_14ba!), 88, ((V_14be! = 1.0) * -13 + (V_14be! = 0.0) * -7), 4369   '@4a842 DS:3840,3844,3b08
L_4a8dd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49667   '@4a8dd
    ' ---- F_4a8e5 @0x4a8e5  (04a8e5_F_4a8e5.lift.txt; evidence_id (assembly): ev_3b9752a9930cebc79e31c70c5c2654ca48d2b2437772493eed282f5d864d626a)
L_4a8ea:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04954b_FUN_4000_954b
    RT_GPONTO RT_SNG!((FX##(V_14cc!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(161.0 - FX##(V_14d8!) - (FX##(V_14d0!) - V_14e8!) * V_14ba!), 0: PUT (RG_GX1, RG_GY1), A_14fa%(1), PSET: RT_GFIM   '@4a8ef DS:3b00
    RT_GCAIXA RT_SNG!((FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!), RT_SNG!(169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_14fa%(1): RT_GFIM   '@4a959 DS:38ae
    L_BPc6! = (FX##(V_14c4!) - V_14e4!) * V_14b6! + V_14d4!   '@4a9cc
    L_BPca! = 169.0 - FX##(V_14d8!) - (FX##(V_14c8!) - V_14e8!) * V_14ba!   '@4a9ed DS:38ae
    L_BPce$ = CHR$(27)   '@4aa0f
    L_BPd2$ = "CGA"   '@4aa23 DS:3854
    CALL MIXT_08c4_TextoGrafico(L_BPc6!, L_BPca!, L_BPce$, L_BPd2$)   '@4aa31
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4aa4a libera strings locais (L_BPce)
    ' @4aa54 libera strings locais (L_BPd2)
    RETURN   '@4aa5e
L_4aa6d:   ' entrada vinda de 04954b_FUN_4000_954b
    ' @4aa6d libera strings locais (L_BP5a)
    ERASE L_BP52%   '@4aa76
    ERASE L_BP40%   '@4aa7f
    ERASE L_BP2e%   '@4aa88
    ERASE L_BP1c%   '@4aa91
    ' END SUB   '@4aa9a
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_LAJE.BM'
'$INCLUDE: '../comum/MIXT.BM'
