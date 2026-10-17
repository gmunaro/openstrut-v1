' ============================================================================
'  LAJEPROC - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/LAJEPROC/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 446863368ae59a5951a20e418b5a5a4bb980fc37830b24d2521b2cb1e67ac83d
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_LAJE.BI'

' ---- variaveis do LAJEPROC fora do COMMON (DS do programa)
REDIM SHARED A_1342!(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1370!(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_139e!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_13d2!
DIM SHARED V_13d6!
DIM SHARED V_13da!
DIM SHARED V_13de!
DIM SHARED V_13e2!
DIM SHARED V_13e6%
DIM SHARED V_13e8%
DIM SHARED V_13ea$
DIM SHARED V_13ee!
DIM SHARED V_13f2!
DIM SHARED V_13f6!
DIM SHARED V_13fa!
DIM SHARED V_13fe!
DIM SHARED V_1402!
DIM SHARED V_1406!
DIM SHARED V_140a!
DIM SHARED V_140e!
DIM SHARED V_1412%
DIM SHARED V_1414%
DIM SHARED V_1416%
DIM SHARED V_1418!
DIM SHARED V_141c$
DIM SHARED V_1420%
DIM SHARED V_1422!
DIM SHARED V_1426!
DIM SHARED V_142a!
DIM SHARED V_142e!
DIM SHARED V_1432#
DIM SHARED V_143a!
DIM SHARED V_143e!
DIM SHARED V_1442!
DIM SHARED V_1446!
DIM SHARED V_144a!
DIM SHARED V_144e!
DIM SHARED V_1452!
DIM SHARED V_1456$
DIM SHARED V_145a$
DIM SHARED V_145e$
DIM SHARED V_1462!
DIM SHARED V_1466!
DIM SHARED V_146a!
DIM SHARED V_146e!
DIM SHARED V_1472!
DIM SHARED V_1476$
DIM SHARED V_147a!
DIM SHARED V_147e!
DIM SHARED V_1482$
DIM SHARED V_1486!
DIM SHARED V_148a!
DIM SHARED V_148e$
DIM SHARED V_15cc#
DIM SHARED V_15d4#
DIM SHARED V_15f4#
DIM SHARED V_15fc#
DIM SHARED V_1604#
DIM SHARED V_16a4!
DIM SHARED V_16a8!
DIM SHARED V_16ac!
DIM SHARED V_16b0!
DIM SHARED V_16cc!
DIM SHARED V_16d0!
DIM SHARED V_1734#
DIM SHARED V_173c#
DIM SHARED V_1744#
DIM SHARED V_174c#
DIM SHARED V_1754!
DIM SHARED V_1758!
DIM SHARED V_175c!
DIM SHARED V_1760!
DIM SHARED V_1764!
DIM SHARED V_1768!
DIM SHARED V_176c!
DIM SHARED V_1770!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "LAJEPROC"
' ---- M_LAJEPROC @0x10030  (010030_M_LAJEPROC.lift.txt; evidence_id (assembly): ev_40c577a6670b5c2788d627172dba76ee3b3b412c2a6b0299aad4d5cdf2c2e834)
' @10030 inicio do programa (B$?EVT)
GOTO L_101f2   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101f2:
GOSUB L_10270   '@101f2
ON ERROR GOTO L_1021b
RT_ONERR = &H1021b   '@101ff
GOTO L_10681   '@1020e
' ---- F_10216 @0x10216  (010216_F_10216.lift.txt; evidence_id (assembly): ev_3006fb29cb1dc3a57212b35b34bfdd30f6eee646256c936d22b2f64bdfcc9335)
L_1021b:   ' entrada vinda de 010030_M_LAJEPROC, 010681_FUN_1000_0681
RESUME L_10232   '@10220
L_10232:
GOSUB L_10270   '@10237
CALL S_1aa2c   '@10244
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_SCREEN 0   '@1024e
GOTO L_10681   '@10263
' ---- F_1026b @0x1026b  (01026b_F_1026b.lift.txt; evidence_id (assembly): ev_60bf7740ba9350de8a9a075c25fa79f7ee026de2732055eb66dfedb3e50d64ac)
L_10270:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJEPROC, 010216_F_10216
FOR V_1418! = 1.0 TO 10.0   '@10275 DS:17da,17de
ON KEY(RT_CINT%(FX##(V_1418!))) GOSUB L_10515
RT_ONKEY RT_CINT%(FX##(V_1418!)), 1   '@10282
KEY(RT_CINT%(FX##(V_1418!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1418!)), 1   '@1029c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_1418!   '@102b1 DS:17da,17de
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@102da
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10302
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1032a
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@10352
FOR V_1418! = 15.0 TO 18.0   '@1037a DS:17da,17e2,17e6
ON KEY(RT_CINT%(FX##(V_1418!))) GOSUB L_10540
RT_ONKEY RT_CINT%(FX##(V_1418!)), 2   '@10388
KEY(RT_CINT%(FX##(V_1418!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1418!)), 1   '@103a2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_1418!   '@103b7 DS:17da,17e6
ON KEY(2) GOSUB L_10540
RT_ONKEY 2, 2   '@103e0
KEY(2) ON
RT_KEYESTADO 2, 1   '@103f3
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10401
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@10429
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@10451
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@10479
FOR V_1418! = 19.0 TO 22.0   '@104a0 DS:17da,17ea,17ee
ON KEY(RT_CINT%(FX##(V_1418!))) GOSUB L_1063e
RT_ONKEY RT_CINT%(FX##(V_1418!)), 3   '@104ae
KEY(RT_CINT%(FX##(V_1418!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1418!)), 1   '@104c8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_1418!   '@104dd DS:17da,17ee
RETURN   '@10506
L_10515:
BEEP   '@1051a
GOSUB L_10270   '@10524
RETURN   '@10531
L_10540:
RT_SCREEN 0   '@10545
RT_VIEWPRINT 1, 25   '@1055a
COLOR 7, 0, 0   '@1056c
RT_CLS 0   '@10590
PRINT " Aguarde ..."   '@1059d DS:17f2
PRINT ""   '@105ab DS:1780
PRINT " Retorno ao Modulo Basico de LAJE"   '@105b9 DS:1802
ON ERROR GOTO L_10605
RT_ONERR = &H10605   '@105c7
V_0f28_volta$ = "VOLTA LAJEPROC"   '@105d6 DS:1828
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@105e8 DS:183a
L_10605:
PRINT " Modulo nao encontrado em "; V_0e04_direxe$   '@1060a DS:1842
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@10621 DS:179e
RT_FIM   '@1062f (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_1063e:
BEEP   '@10643
GOSUB L_10270   '@1064d
RT_SCREEN 0   '@1065a
RETURN L_10681   '@10679
' ---- FUN_1000_0681 @0x10681  (010681_FUN_1000_0681.lift.txt; evidence_id (assembly): ev_7ac3704c38dc6a7db3b2eeded7bcc16a2f3b924a12a0901ec33283f2708488e2)
L_10681:   ' entrada vinda de 010030_M_LAJEPROC, 010216_F_10216, 01026b_F_1026b, 01197f_F_1197f
ON ERROR GOTO L_1021b
RT_ONERR = &H1021b   '@10686
RT_VIEWPRINT 1, 25   '@10695
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@106a7
RT_CLS 2   '@106e2
PRINT RT_STRINGC$((80), (205))   '@106f0
PRINT " Escolha de Armaduras do Painel / Lajes de um Edificio"   '@10708 DS:1860
PRINT RT_STRINGC$((80), (205))   '@10716
RT_VIEWPRINT 6, 25   '@1072e
V_0ef4# = RT_FRE&("")   '@10740 DS:1780
COLOR 7   '@1075a
LOCATE 8, 20   '@10770
PRINT "1  -  ";   '@1078e DS:189a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1079c
PRINT "E";   '@107b9 DS:18a4
COLOR 7   '@107c7
PRINT "scolhe todas as Armadura"   '@107dd DS:18aa
LOCATE 10, 20   '@107eb
PRINT "2  -  ";   '@10809 DS:18c6
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10817
PRINT "P";   '@10834 DS:18d0
COLOR 7   '@10842
PRINT "ositivo, desenho da Ferragem"   '@10858 DS:18d6
LOCATE 12, 20   '@10866
PRINT "3  -  ";   '@10884 DS:18f6
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10892
PRINT "N";   '@108af DS:1900
COLOR 7   '@108bd
PRINT "egativo, desenho da Ferragem"   '@108d3 DS:1906
LOCATE 14, 20   '@108e1
PRINT "4  -  ";   '@108ff DS:1926
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@1090d
PRINT "M";   '@1092a DS:1930
COLOR 7   '@10938
PRINT "odifica Armadura"   '@1094e DS:1936
LOCATE 16, 20   '@1095c
PRINT "5  -  ";   '@1097a DS:194a
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10988
PRINT "I";   '@109a5 DS:1954
COLOR 7   '@109b3
PRINT "mpressao das Armaduras"   '@109c9 DS:195a
LOCATE 18, 20   '@109d7
PRINT "6  -  ";   '@109f5 DS:1974
COLOR RT_CINT%(FX##(V_0dc4_cordestaque!))   '@10a03
PRINT "R";   '@10a20 DS:197e
COLOR 7   '@10a2e
PRINT "etorno ao Menu Principal"   '@10a44 DS:1984
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@10a52
LOCATE 22, 20   '@10a7e
PRINT "escolha opcao ";   '@10a9c DS:19a0
CALL MIXT_07f1_LimpaTeclado   '@10aaa
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10ab4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@10ad0
V_141c$ = V_0f18$   '@10ae6
IF NOT (V_141c$ <> "1") THEN GOTO L_10b33   '@10af8 DS:19b2
IF NOT (V_141c$ <> "E") THEN GOTO L_10b33   '@10b0f DS:18a4
IF NOT (V_141c$ = "e") THEN GOTO L_10b43   '@10b21 DS:19b8
L_10b33:
GOTO L_10dfe   '@10b33
L_10b43:
IF NOT (V_141c$ <> "2") THEN GOTO L_10b79   '@10b43 DS:19be
IF NOT (V_141c$ <> "P") THEN GOTO L_10b79   '@10b55 DS:18d0
IF NOT (V_141c$ = "p") THEN GOTO L_10b89   '@10b67 DS:19c4
L_10b79:
GOTO L_15824   '@10b79
L_10b89:
IF NOT (V_141c$ <> "3") THEN GOTO L_10bbf   '@10b89 DS:19ca
IF NOT (V_141c$ <> "N") THEN GOTO L_10bbf   '@10b9b DS:1900
IF NOT (V_141c$ = "n") THEN GOTO L_10bcf   '@10bad DS:19d0
L_10bbf:
GOTO L_16337   '@10bbf
L_10bcf:
IF NOT (V_141c$ <> "4") THEN GOTO L_10c05   '@10bcf DS:19d6
IF NOT (V_141c$ <> "M") THEN GOTO L_10c05   '@10be1 DS:1930
IF NOT (V_141c$ = "m") THEN GOTO L_10c15   '@10bf3 DS:19dc
L_10c05:
GOTO L_11384   '@10c05
L_10c15:
IF NOT (V_141c$ <> "5") THEN GOTO L_10c4b   '@10c15 DS:19e2
IF NOT (V_141c$ <> "I") THEN GOTO L_10c4b   '@10c27 DS:1954
IF NOT (V_141c$ = "i") THEN GOTO L_10c5b   '@10c39 DS:19e8
L_10c4b:
GOTO L_163fb   '@10c4b
L_10c5b:
IF NOT (V_141c$ <> "6") THEN GOTO L_10c91   '@10c5b DS:19ee
IF NOT (V_141c$ <> "R") THEN GOTO L_10c91   '@10c6d DS:197e
IF NOT (V_141c$ = "r") THEN GOTO L_10c99   '@10c7f DS:19f4
L_10c91:
GOTO L_10ca6   '@10c91
L_10c99:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@10c99
L_10ca6:
L_10cab:
V_0f28_volta$ = "VOLTA LAJEPROC"   '@10cb0 DS:1828
ON ERROR GOTO L_10d3b
RT_ONERR = &H10d3b   '@10cc2
V_0ef4# = RT_FRE&("")   '@10cd1 DS:1780
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@10ceb
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@10d0a
RT_CHAIN V_0e04_direxe$ + "LAJE"   '@10d1e DS:183a
L_10d3b:
RESUME L_10d52   '@10d40
L_10d52:
L_BP0c% = (V_0e04_direxe$ = "A:\")   '@10d57 DS:19fa
IF NOT ((V_0e04_direxe$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_10df1   '@10d7c DS:1a02
LOCATE 23, 10   '@10d91
PRINT " Coloque o Disco LAJE no Drive "; V_0e04_direxe$   '@10daf DS:1a0a
CALL MIXT_07f1_LimpaTeclado   '@10dc6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10dd0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
L_10df1:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10cab   '@10df1
L_10dfe:
IF NOT (V_12f8% = 0) THEN GOTO L_10e1a   '@10e03
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@10e12
L_10e1a:
V_1416% = 0   '@10e1a
RT_VIEWPRINT 1, 25   '@10e25
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@10e37
RT_CLS 2   '@10e63
PRINT RT_STRINGC$((80), (205))   '@10e71
PRINT " Escolha automatica das Armaduras para as Lajes"   '@10e89 DS:1a2e
PRINT RT_STRINGC$((80), (205))   '@10e97
V_13e6% = 1   '@10eaf
V_13e8% = 0   '@10eba
L_10eca:
IF NOT (A_10cc!(V_13e6%, 1) = 2.0) THEN GOTO L_10f01   '@10eca DS:1a62
V_13e8% = V_13e8% + 1   '@10ef8
L_10f01:
V_13e6% = V_13e6% + 1   '@10f01
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_13e6% THEN GOTO L_10eca   '@10f0a
V_13e6% = A_109e%(0, 0) - V_13e8%   '@10f28
RT_VIEWPRINT 5, 25   '@10f47
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@10f59
RT_CLS 2   '@10f76
PRINT " Arquivadas"; V_13e6%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@10f84 DS:17da,1a66,1a76
IF NOT (V_13e6% > 1) THEN GOTO L_11020   '@10fd2
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_13e6%) + V_0e54_nivellaje!)));   '@10fe1 DS:1a84
L_11020:
PRINT " )"   '@11020 DS:1a8c
RT_VIEWPRINT 7, 25   '@1102e
RT_CLS 2   '@11040
COLOR 7   '@1104e
PRINT " Escolhe automaticamente Armadura para Todas as Lajes N/*S* ";   '@11064 DS:1a92
CALL MIXT_07f1_LimpaTeclado   '@11072
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@1107c DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_110bb   '@11096 DS:1900
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@110b3
L_110bb:
V_13e2! = 1.0   '@110bb DS:17da
L_110d2:
V_0f0c! = 0.0   '@110d2 DS:1ad2
V_13e8% = 0   '@110e3
L_110f4:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@110f4 DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_11148   '@1110a DS:1a62
V_13e8% = V_13e8% + 1   '@1113f
L_11148:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF FX##(V_0f0c!) - V_13e8% < FX##(V_13e2!) THEN GOTO L_110f4   '@11148
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 3.0 OR A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_111e7   '@1116b DS:17da,1ad6
GOTO L_1133e   '@111df
L_111e7:
LOCATE 9, 1   '@111e7
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@11202
PRINT " Laje "; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_13e2!) + V_0e54_nivellaje!))); "        H ="; A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0); "cm   "   '@1121f DS:1ada,1ae4,1af4
COLOR 7   '@11294
LOCATE 11, 1   '@112aa
PRINT " Momento Positivo PINCIPAL"   '@112c5 DS:1afe
GOSUB L_11984   '@112d3
COLOR 7   '@112e0
LOCATE 14, 1   '@112f6
PRINT " Momento Positivo SECUNDARIO"   '@11311 DS:1b1c
GOSUB L_11ecb   '@1131f
GOSUB L_13ee1   '@1132c
L_1133e:
V_13e2! = FX##(V_13e2!) + 1.0   '@11343 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (V_13e6% < V_13e2!) THEN GOTO L_110d2   '@11359
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@11377
L_11384:
IF NOT (V_12f8% = 0) THEN GOTO L_113a0   '@11389
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@11398
L_113a0:
V_1416% = 1   '@113a0
RT_VIEWPRINT 1, 25   '@113ab
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@113bd
RT_CLS 2   '@113e9
PRINT RT_STRINGC$((80), (205))   '@113f7
PRINT " Modificacao das Armaduras para as Lajes"   '@1140f DS:1b3c
PRINT RT_STRINGC$((80), (205))   '@1141d
V_13e6% = 1   '@11435
V_13e8% = 0   '@11440
L_11450:
IF NOT (A_10cc!(V_13e6%, 1) = 2.0) THEN GOTO L_11487   '@11450 DS:1a62
V_13e8% = V_13e8% + 1   '@1147e
L_11487:
V_13e6% = V_13e6% + 1   '@11487
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_13e6% THEN GOTO L_11450   '@11490
V_13e6% = A_109e%(0, 0) - V_13e8%   '@114ae
RT_VIEWPRINT 5, 25   '@114d7
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@114e9
RT_CLS 2   '@11506
PRINT " Arquivadas"; V_13e6%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@11514 DS:17da,1a66,1a76
IF NOT (V_13e6% > 1) THEN GOTO L_115b0   '@11562
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_13e6%) + V_0e54_nivellaje!)));   '@11571 DS:1a84
L_115b0:
PRINT " )"   '@115b0 DS:1a8c
L_115c3:   ' entrada vinda de 01197f_F_1197f
RT_VIEWPRINT 7, 25   '@115c8
RT_CLS 2   '@115da
COLOR 7   '@115e8
PRINT " Numero da Laje que sera Alterada/Imposta Armadura *FIM* ";   '@115fe DS:1b68
CALL MIXT_07f1_LimpaTeclado   '@1160c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@11616 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_1164d   '@11630
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@11645
L_1164d:
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@1164d
IF NOT ((FX##(VAL(V_0f18$)) > FX##(V_13e6%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_116bb   '@11688
BEEP   '@116a9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_115c3   '@116b3
L_116bb:
V_16cc! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@116bb
V_0f0c! = 0.0   '@116dd DS:1ad2
V_13e8% = 0   '@116ee
L_116fe:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@116fe DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_11752   '@11714 DS:1a62
V_13e8% = V_13e8% + 1   '@11749
L_11752:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF FX##(V_0f0c!) - V_13e8% < FX##(V_16cc!) THEN GOTO L_116fe   '@11752
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 3.0 OR (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0 OR A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) = 0.0)) THEN GOTO L_11832   '@11775 DS:17da,1ad2,1ad6
BEEP   '@11820
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_115c3   '@1182a
L_11832:
LOCATE 9, 1   '@11832
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1184d
PRINT " Laje "; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_16cc!) + V_0e54_nivellaje!))); "        H ="; A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0); "cm   "   '@1186a DS:1ada,1ae4,1af4
COLOR 7   '@118df
LOCATE 11, 1   '@118f5
PRINT " Momento Positivo PINCIPAL"   '@11910 DS:1afe
GOSUB L_11984   '@1191e
COLOR 7   '@1192b
LOCATE 14, 1   '@11941
PRINT " Momento Positivo SECUNDARIO"   '@1195c DS:1b1c
GOSUB L_11ecb   '@1196a
GOTO L_1280c   '@11977
' ---- F_1197f @0x1197f  (01197f_F_1197f.lift.txt; evidence_id (assembly): ev_d98c7b75bb3f850501d4ed32ad8af3e999eb039225035cf218d3a8cc8ce71984)
L_11984:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010681_FUN_1000_0681
V_1420% = 0   '@11989
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@11994
V_1426! = 0.0   '@119be DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_11a2f   '@119cf DS:1ad2
V_1426! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@11a04
L_11a2f:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@11a2f DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@11a89
GOSUB L_15279   '@11aa4
GOSUB L_154c4   '@11ab1
IF NOT (V_142a! = -1.0) THEN GOTO L_11b12   '@11abe DS:1bb8
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 0.0   '@11ad9 DS:1ad2
V_13f2! = 0.0   '@11b01 DS:1ad2
L_11b12:
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) < 0.0) THEN GOTO L_11c64   '@11b12 DS:1ad2
V_0ef4# = A_0eba_areabarra!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0)))   '@11b44 DS:1bbc
V_0efc# = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0) * 1000.0   '@11b91 DS:1bbc
IF NOT (FX##(V_13f2!) > 100.0 / FX##(A_129c_espacamento!(RT_CINT%(FX##(V_0efc#)))) * V_0ef4#) THEN GOTO L_11c5c   '@11bef DS:1bc0
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 1000.0 * FX##(V_13f6!) + V_0f04!   '@11c2a DS:1bbc
L_11c5c:
GOTO L_11cb6   '@11c5c
L_11c64:
IF NOT (V_142a! <> -1.0) THEN GOTO L_11cb1   '@11c64 DS:1bb8
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 1000.0 * FX##(V_13f6!) + V_0f04!   '@11c7f DS:1bbc
L_11cb1:
L_11cb6:
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 0.0) THEN GOTO L_11d02   '@11cb6 DS:1ad2
V_0f18$ = "*"   '@11ce8 DS:1bc4
GOTO L_11dea   '@11cfa
L_11d02:
V_0f18$ = "#" + STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0)))) + " c/" + STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0) * 1000.0)))   '@11d02 DS:1bbc,1bca,1bd0
L_11dea:
LOCATE 12, 1   '@11dea
COLOR 7   '@11e05
PRINT USING " M =######.##        As =####.## cm2"; RT_PU#(RT_SNG!(V_1426! / (FX##(V_0dec!) * V_0de8! * 100.0)), " M =######.##        As =####.## cm2", 1); RT_PU#(V_13f2!, " M =######.##        As =####.## cm2", 2);   '@11e1b DS:1bc0,1bd8
COLOR 14   '@11e61
PRINT USING "        \                    \"; V_0f18$;   '@11e77 DS:1c00
PRINT " "; RT_TAB$(79); ""; " "   '@11e93 DS:1780,1c22
RETURN   '@11ebc
L_11ecb:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010681_FUN_1000_0681
V_1420% = 0   '@11ed0
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@11edb
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) < 1.0) THEN GOTO L_12004   '@11f05 DS:17da
V_1426! = 0.0   '@11f53 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_11ffc   '@11f64 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@11f99
L_11ffc:
GOTO L_120b2   '@11ffc
L_12004:
V_1426! = 0.0   '@12004 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_120ad   '@12015 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@1204a
L_120ad:
L_120b2:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@120b2 DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@1210c
GOSUB L_15279   '@12127
GOSUB L_154c4   '@12134
IF NOT (V_142a! = -1.0) THEN GOTO L_12198   '@12141 DS:1bb8
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 0.0   '@1215c DS:1ad2
V_13f2! = 0.0   '@12187 DS:1ad2
L_12198:
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) < 0.0) THEN GOTO L_122f9   '@12198 DS:1ad2
V_0ef4# = A_0eba_areabarra!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0)))   '@121cd DS:1bbc
V_0efc# = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0) * 1000.0   '@1221d DS:1bbc
IF NOT (FX##(V_13f2!) > 100.0 / FX##(A_129c_espacamento!(RT_CINT%(FX##(V_0efc#)))) * V_0ef4#) THEN GOTO L_122f1   '@12281 DS:1bc0
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 1000.0 * FX##(V_13f6!) + V_0f04!   '@122bc DS:1bbc
L_122f1:
GOTO L_1234e   '@122f1
L_122f9:
IF NOT (V_142a! <> -1.0) THEN GOTO L_12349   '@122f9 DS:1bb8
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 1000.0 * FX##(V_13f6!) + V_0f04!   '@12314 DS:1bbc
L_12349:
L_1234e:
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 0.0) THEN GOTO L_1239d   '@1234e DS:1ad2
V_0f18$ = "*"   '@12383 DS:1bc4
GOTO L_1248e   '@12395
L_1239d:
V_0f18$ = "#" + STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0)))) + " c/" + STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0) * 1000.0)))   '@1239d DS:1bbc,1bca,1bd0
L_1248e:
LOCATE 15, 1   '@1248e
COLOR 7   '@124a9
PRINT USING " M =######.##        As =####.## cm2"; RT_PU#(RT_SNG!(V_1426! / (FX##(V_0dec!) * V_0de8! * 100.0)), " M =######.##        As =####.## cm2", 1); RT_PU#(V_13f2!, " M =######.##        As =####.## cm2", 2);   '@124bf DS:1bc0,1bd8
COLOR 14   '@12505
PRINT USING "        \                    \"; V_0f18$;   '@1251b DS:1c00
PRINT " "; RT_TAB$(79); ""; " "   '@12537 DS:1780,1c22
RETURN   '@12560
L_1256f:   ' sub-rotina (alvo de GOSUB)
V_1420% = 1   '@12574
LOCATE 17, 1   '@1257f
COLOR 7   '@1259a
PRINT " Momento Negativo";   '@125b0 DS:1c28
IF NOT (LEN(V_0f1c$) > 0) THEN GOTO L_125fb   '@125be
PRINT "   .. Continuidade com a Laje "; V_0f1c$; "   "   '@125d3 DS:1c3e,1c60
GOTO L_12609   '@125f3
L_125fb:
PRINT ""   '@125fb DS:1780
L_12609:
IF NOT (V_13f2! = 0.0) THEN GOTO L_1263e   '@12609 DS:1ad2
V_0f18$ = "*"   '@12624 DS:1bc4
GOTO L_12741   '@12636
L_1263e:
V_0f18$ = "#" + STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0)))) + " c/" + STR$(A_129c_espacamento!(RT_CINT%(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) - INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0) * 1000.0)))   '@1263e DS:1bbc,1bca,1bd0
L_12741:
LOCATE 18, 1   '@12741
PRINT USING " M =######.##        As =####.## cm2"; RT_PU#(RT_SNG!(V_1426! / (FX##(V_0dec!) * V_0de8! * 100.0)), " M =######.##        As =####.## cm2", 1); RT_PU#(V_13f2!, " M =######.##        As =####.## cm2", 2);   '@1275c DS:1bc0,1bd8
COLOR 14   '@127a2
PRINT USING "        \                    \"; V_0f18$;   '@127b8 DS:1c00
PRINT " "; RT_TAB$(79); ""; " "   '@127d4 DS:1780,1c22
RETURN   '@127fd
L_1280c:   ' entrada vinda de 010681_FUN_1000_0681
V_1420% = 0   '@12811
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1281c
RT_VIEWPRINT 23, 25   '@12846
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@12858
RT_CLS 2   '@12875
PRINT " Armadura Positiva PRINCIPAL"   '@12883 DS:1c68
RT_VIEWPRINT 1, 25   '@12891
L_128a8:
V_0f18$ = "*"   '@128ad DS:1bc4
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) <> 0.0) THEN GOTO L_1294f   '@128bf DS:1ad2
V_0f18$ = LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0)))))   '@128f1 DS:1bbc
L_1294f:
LOCATE 24, 1   '@1294f
COLOR 7   '@1296a
PRINT " Bitola  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@12980 DS:1780,1bc4,1c22,1c88
LOCATE 24, LEN(V_0f18$) + 13   '@129bb
CALL MIXT_07f1_LimpaTeclado   '@129e2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@129ec
RT_LINEINPUT "", V_0f18$   '@12a02 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@12a1c
IF NOT (V_142e! > 0.0) THEN GOTO L_12c6a   '@12a36 DS:1ad2
V_13f6! = 0.0   '@12a51 DS:1ad2
L_12a68:
IF NOT (A_0e8c_bitola!(RT_CINT%(FX##(V_13f6!))) = V_142e!) THEN GOTO L_12aa1   '@12a68
GOTO L_12ad0   '@12a99
L_12aa1:
V_13f6! = FX##(V_13f6!) + 1.0   '@12aa1 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF V_13f6! <= 9.0 THEN GOTO L_12a68   '@12ab7 DS:1c96
L_12ad0:
IF NOT (V_13f6! > 9.0) THEN GOTO L_12afd   '@12ad0 DS:1c96
BEEP   '@12aeb
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_128a8   '@12af5
L_12afd:
V_1426! = 0.0   '@12afd DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_12b6e   '@12b0e DS:1ad2
V_1426! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@12b43
L_12b6e:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@12b6e DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@12bc8
GOSUB L_15279   '@12be3
GOSUB L_1559c   '@12bf0
IF NOT (V_0f18$ = "NAO") THEN GOTO L_12c26   '@12bfd DS:1c9a
BEEP   '@12c14
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_128a8   '@12c1e
L_12c26:
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = -1000.0 * FX##(V_13f6!) - V_0f04!   '@12c26 DS:1ca2
GOSUB L_11984   '@12c58
L_12c6a:
L_12c6f:
V_0f18$ = "*"   '@12c74 DS:1bc4
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) <> 0.0) THEN GOTO L_12d3d   '@12c86 DS:1ad2
V_0f18$ = LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0) * 1000.0))))   '@12cb8 DS:1bbc
L_12d3d:
LOCATE 24, 40   '@12d3d
COLOR 7   '@12d5b
PRINT "Espacamento  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@12d71 DS:1780,1bc4,1c22,1ca6
LOCATE 24, LEN(V_0f18$) + 56   '@12dac
CALL MIXT_07f1_LimpaTeclado   '@12dd3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@12ddd
RT_LINEINPUT "", V_0f18$   '@12df3 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@12e0d
IF NOT (V_142e! > 0.0) THEN GOTO L_1322a   '@12e27 DS:1ad2
IF NOT (V_142e! > V_0f62!) THEN GOTO L_12e6f   '@12e42
BEEP   '@12e5d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_12c6f   '@12e67
L_12e6f:
V_0ef0! = 1.0   '@12e6f DS:17da
L_12e86:
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0ef0!))) = V_142e!) THEN GOTO L_12ebf   '@12e86
GOTO L_12efc   '@12eb7
L_12ebf:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@12ebf DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_129c_espacamento!(0) >= V_0ef0! THEN GOTO L_12e86   '@12ed5
L_12efc:
IF NOT (A_129c_espacamento!(0) < V_0ef0!) THEN GOTO L_12f37   '@12efc
BEEP   '@12f25
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_12c6f   '@12f2f
L_12f37:
V_16a8! = V_0ef0!   '@12f37
V_0ef0! = 0.0   '@12f48 DS:1ad2
L_12f5e:
IF NOT (A_0f34!(RT_CINT%(FX##(V_0ef0!)), 0) >= V_1422!) THEN GOTO L_12ffb   '@12f5e
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_16a8!))) < A_0f34!(RT_CINT%(FX##(V_0ef0!)), 1)) THEN GOTO L_12fee   '@12f92
V_0ef0! = 4.0   '@12fdd DS:1cb8
L_12fee:
GOTO L_1302c   '@12fee
L_12ffb:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@12ffb DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (V_0ef0! > 3.0) THEN GOTO L_12f5e   '@13011 DS:1ad6
L_1302c:
IF NOT (V_0ef0! = 4.0) THEN GOTO L_13059   '@1302c DS:1cb8
BEEP   '@13047
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_12c6f   '@13051
L_13059:
V_1426! = 0.0   '@13059 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_130ca   '@1306a DS:1ad2
V_1426! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)   '@1309f
L_130ca:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@130ca DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@13124
GOSUB L_15279   '@1313f
V_13f6! = INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0)   '@1314c DS:1bbc
IF NOT (FX##(A_0eba_areabarra!(RT_CINT%(FX##(V_13f6!)))) / A_129c_espacamento!(RT_CINT%(FX##(V_16a8!))) * 100.0 < FX##(V_13f2!)) THEN GOTO L_131e6   '@13183 DS:1bc0
BEEP   '@131d4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_12c6f   '@131de
L_131e6:
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = -1000.0 * FX##(V_13f6!) - V_16a8!   '@131e6 DS:1ca2
GOSUB L_11984   '@13218
L_1322a:
V_1420% = 0   '@13234
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1323f
RT_VIEWPRINT 23, 25   '@13269
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@1327b
RT_CLS 2   '@13298
PRINT " Armadura Positiva SECUNDARIA"   '@132a6 DS:1cbc
RT_VIEWPRINT 1, 25   '@132b4
L_132cb:
V_0f18$ = "*"   '@132d0 DS:1bc4
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) <> 0.0) THEN GOTO L_13378   '@132e2 DS:1ad2
V_0f18$ = LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0)))))   '@13317 DS:1bbc
L_13378:
LOCATE 24, 1   '@13378
COLOR 7   '@13393
PRINT " Bitola  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@133a9 DS:1780,1bc4,1c22,1c88
LOCATE 24, LEN(V_0f18$) + 13   '@133e4
CALL MIXT_07f1_LimpaTeclado   '@1340b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@13415
RT_LINEINPUT "", V_0f18$   '@1342b DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@13445
IF NOT (V_142e! > 0.0) THEN GOTO L_137d1   '@1345f DS:1ad2
V_13f6! = 0.0   '@1347a DS:1ad2
L_13490:
IF NOT (A_0e8c_bitola!(RT_CINT%(FX##(V_13f6!))) = V_142e!) THEN GOTO L_134c9   '@13490
GOTO L_134f8   '@134c1
L_134c9:
V_13f6! = FX##(V_13f6!) + 1.0   '@134c9 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF V_13f6! <= 9.0 THEN GOTO L_13490   '@134df DS:1c96
L_134f8:
IF NOT (V_13f6! > 9.0) THEN GOTO L_13525   '@134f8 DS:1c96
BEEP   '@13513
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_132cb   '@1351d
L_13525:
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) < 1.0) THEN GOTO L_13624   '@13525 DS:17da
V_1426! = 0.0   '@13573 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_1361c   '@13584 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@135b9
L_1361c:
GOTO L_136d2   '@1361c
L_13624:
V_1426! = 0.0   '@13624 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_136cd   '@13635 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@1366a
L_136cd:
L_136d2:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@136d2 DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@1372c
GOSUB L_15279   '@13747
GOSUB L_1559c   '@13754
IF NOT (V_0f18$ = "NAO") THEN GOTO L_1378a   '@13761 DS:1c9a
BEEP   '@13778
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_132cb   '@13782
L_1378a:
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = -1000.0 * FX##(V_13f6!) - V_0f04!   '@1378a DS:1ca2
GOSUB L_11ecb   '@137bf
L_137d1:
L_137d6:
V_0f18$ = "*"   '@137db DS:1bc4
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) <> 0.0) THEN GOTO L_138ad   '@137ed DS:1ad2
V_0f18$ = LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0) * 1000.0))))   '@13822 DS:1bbc
L_138ad:
LOCATE 24, 40   '@138ad
COLOR 7   '@138cb
PRINT "Espacamento  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@138e1 DS:1780,1bc4,1c22,1ca6
LOCATE 24, LEN(V_0f18$) + 56   '@1391c
CALL MIXT_07f1_LimpaTeclado   '@13943
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@1394d
RT_LINEINPUT "", V_0f18$   '@13963 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@1397d
IF NOT (V_142e! > 0.0) THEN GOTO L_13edc   '@13997 DS:1ad2
IF NOT (V_142e! > V_0f62!) THEN GOTO L_139df   '@139b2
BEEP   '@139cd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_137d6   '@139d7
L_139df:
V_0ef0! = 1.0   '@139df DS:17da
L_139f6:
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0ef0!))) = V_142e!) THEN GOTO L_13a2f   '@139f6
GOTO L_13a6c   '@13a27
L_13a2f:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@13a2f DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_129c_espacamento!(0) >= V_0ef0! THEN GOTO L_139f6   '@13a45
L_13a6c:
IF NOT (A_129c_espacamento!(0) < V_0ef0!) THEN GOTO L_13aa7   '@13a6c
BEEP   '@13a95
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_137d6   '@13a9f
L_13aa7:
V_16a8! = V_0ef0!   '@13aa7
V_0ef0! = 0.0   '@13ab8 DS:1ad2
L_13ace:
IF NOT (A_0f34!(RT_CINT%(FX##(V_0ef0!)), 0) >= V_1422!) THEN GOTO L_13b6b   '@13ace
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_16a8!))) < A_0f34!(RT_CINT%(FX##(V_0ef0!)), 1)) THEN GOTO L_13b5e   '@13b02
V_0ef0! = 4.0   '@13b4d DS:1cb8
L_13b5e:
GOTO L_13b9c   '@13b5e
L_13b6b:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@13b6b DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (V_0ef0! > 3.0) THEN GOTO L_13ace   '@13b81 DS:1ad6
L_13b9c:
IF NOT (V_0ef0! = 4.0) THEN GOTO L_13bc9   '@13b9c DS:1cb8
BEEP   '@13bb7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_137d6   '@13bc1
L_13bc9:
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) < 1.0) THEN GOTO L_13cc8   '@13bc9 DS:17da
V_1426! = 0.0   '@13c17 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_13cc0   '@13c28 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) * A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@13c5d
L_13cc0:
GOTO L_13d76   '@13cc0
L_13cc8:
V_1426! = 0.0   '@13cc8 DS:1ad2
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1) > 0.0) THEN GOTO L_13d71   '@13cd9 DS:1ad2
V_1426! = FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1)) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)   '@13d0e
L_13d71:
L_13d76:
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@13d76 DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@13dd0
GOSUB L_15279   '@13deb
V_13f6! = INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0)   '@13df8 DS:1bbc
IF NOT (FX##(A_0eba_areabarra!(RT_CINT%(FX##(V_13f6!)))) / A_129c_espacamento!(RT_CINT%(FX##(V_16a8!))) * 100.0 < FX##(V_13f2!)) THEN GOTO L_13e95   '@13e32 DS:1bc0
BEEP   '@13e83
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_137d6   '@13e8d
L_13e95:
A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = -1000.0 * FX##(V_13f6!) - V_16a8!   '@13e95 DS:1ca2
GOSUB L_11ecb   '@13eca
L_13edc:
L_13ee1:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010681_FUN_1000_0681
V_16d0! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@13ee6
V_1432# = A_109e%(RT_CINT%(FX##(V_16d0!)), 0) - 1   '@13f10
FOR V_0efc# = 1.0# TO V_1432#   '@13f40 DS:1cde
IF NOT (A_10fa%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0efc#))) > 2) THEN GOTO L_15170   '@13f48
GOSUB L_18c8b   '@13f79
V_1420% = 1   '@13f86
V_1426! = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) * (A_10fa%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@13f91 DS:1ce6
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@13ff9
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@14023 DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@1407d
GOSUB L_15279   '@14098
V_16a4! = V_13f2!   '@140a5
V_16ac! = V_1426!   '@140b6
V_0f1c$ = ""   '@140c7 DS:1780
V_143a! = A_11e0%(0, 0)   '@140d9
FOR V_0f14! = 1.0 TO V_143a!   '@140fe DS:17da
IF NOT (A_11e0%(RT_CINT%(FX##(V_0f14!)), 1) = V_0efc# AND A_11e0%(RT_CINT%(FX##(V_0f14!)), 0) = V_0f0c!) THEN GOTO L_1433b   '@14106
IF NOT (A_11e0%(RT_CINT%(FX##(V_0f14!)), 2) = -1) THEN GOTO L_141f3   '@14183
V_16a8! = A_11e0%(RT_CINT%(FX##(V_0f14!)), 1)   '@141ab
V_16b0! = V_16d0!   '@141da
GOTO L_1432e   '@141eb
L_141f3:
V_16a8! = A_11e0%(RT_CINT%(FX##(V_0f14!)), 3)   '@141f3
V_16b0! = A_11e0%(RT_CINT%(FX##(V_0f14!)), 2)   '@14222
L_14253:
V_0f08! = 0.0   '@14258 DS:1ad2
V_13e8% = 0   '@14269
L_1427a:
V_0f08! = FX##(V_0f08!) + 1.0   '@1427a DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f08!)), 1) = 2.0) THEN GOTO L_142ce   '@14290 DS:1a62
V_13e8% = V_13e8% + 1   '@142c5
L_142ce:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF V_0f08! < V_16b0! THEN GOTO L_1427a   '@142ce
V_0f1c$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0f08!) - V_13e8% + V_0e54_nivellaje!)))   '@142e6
L_1432e:
GOTO L_1444c   '@1432e
L_1433b:
IF NOT (A_11e0%(RT_CINT%(FX##(V_0f14!)), 3) = V_0efc# AND A_11e0%(RT_CINT%(FX##(V_0f14!)), 2) = V_0f0c!) THEN GOTO L_14420   '@1433b
V_16a8! = A_11e0%(RT_CINT%(FX##(V_0f14!)), 1)   '@143b6
V_16b0! = A_11e0%(RT_CINT%(FX##(V_0f14!)), 0)   '@143e5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14253   '@14413
L_14420:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f14!   '@14420 DS:17da
L_1444c:
IF NOT (FX##(V_16a8!) <> FX##(V_0efc#) AND A_11e0%(0, 0) >= V_0f14!) THEN GOTO L_14733   '@1444c
V_0ef4# = V_0efc#   '@1449d
V_0efc# = V_16a8!   '@144ae
V_16a8! = V_0ef4#   '@144bf
V_0ef4# = V_0f0c!   '@144d0
V_0f0c! = V_16b0!   '@144e1
V_16b0! = V_0ef4#   '@144f2
GOSUB L_18c8b   '@14503
V_1420% = 1   '@14510
V_1426! = ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 1))) * (A_10fa%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))) - 2) * V_0ef4# / 10.0#   '@1451b DS:1ce6
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1459c
V_13ee! = V_0f6a! / ((V_0e74! / (FX##(V_0e30!) * 2100.0) * V_0df0! - (V_0e80_tipoaco$ = "B") * 0.00200000009499490261077880859375##) / 0.0035000001080334186553955078125## + 1.0) * 1.0   '@145c6 DS:17da,1ba6,1baa,1bb0,1bb4
V_0eec! = FX##(V_1422!) - V_0e84! - V_0e88!   '@14620
GOSUB L_15279   '@1463b
V_0ef4# = V_0efc#   '@14648
V_0efc# = V_16a8!   '@14659
V_16a8! = V_0ef4#   '@1466a
V_0ef4# = V_0f0c!   '@1467b
V_0f0c! = V_16b0!   '@1468c
V_16b0! = V_0ef4#   '@1469d
IF NOT (V_13f2! = 0.0 OR V_13f2! > V_16a4! AND V_16a4! > 0.0) THEN GOTO L_1472e   '@146ae DS:1ad2
V_16a4! = V_13f2!   '@14707
V_16ac! = V_1426!   '@14718
L_1472e:
L_14733:
V_1426! = V_16ac!   '@14733
V_13f2! = V_16a4!   '@14744
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@14755
GOSUB L_154c4   '@1477f
IF NOT (A_11e0%(RT_CINT%(FX##(V_0f14!)), 4) > 0) THEN GOTO L_149f7   '@1478c
V_0ef4# = A_0eba_areabarra!(RT_CINT%(INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0)))   '@147b7 DS:1bbc
V_0efc# = ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) - INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0) * 1000.0   '@1480d DS:1bbc
IF NOT (FX##(V_13f2!) > FX##(V_0ef4#) * 100.0# / V_0efc# OR V_13f2! = 0.0) THEN GOTO L_149ea   '@1487d DS:1ad2,1cee
LOCATE 17, 1   '@148c5
COLOR 7   '@148e0
PRINT " Momento Negativo";   '@148f6 DS:1c28
IF NOT (LEN(V_0f1c$) > 0) THEN GOTO L_14941   '@14904
PRINT "   .. Continuidade com a Laje "; V_0f1c$; "   "   '@14919 DS:1c3e,1c60
GOTO L_14959   '@14939
L_14941:
PRINT RT_STRINGC$((50), (32))   '@14941
L_14959:
RT_VIEWPRINT 23, 25   '@14959
RT_CLS 2   '@1496b
BEEP   '@14979
PRINT " Armadura Negativa IMPOSTA menor que a NECESSARIA"   '@14983 DS:1cf6
PRINT " Acione o Item OTIMIZACAO em Continuidade/Espessura/Dimensionamento";   '@14991 DS:1d2c
CALL MIXT_07f1_LimpaTeclado   '@1499f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@149a9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_CLS 2   '@149c5
RT_VIEWPRINT 1, 25   '@149d3
L_149ea:
GOTO L_15166   '@149ea
L_149f7:
A_11e0%(RT_CINT%(FX##(V_0f14!)), 4) = RT_CINT%(-1000.0 * FX##(V_13f6!) - V_0f04!)   '@149f7 DS:1ca2
RT_VIEWPRINT 23, 25   '@14a3c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@14a4e
RT_CLS 2   '@14a6b
PRINT " Armadura Negativa"   '@14a79 DS:1d74
RT_VIEWPRINT 1, 25   '@14a87
GOSUB L_1256f   '@14a99
L_14aab:
V_0f18$ = "*"   '@14ab0 DS:1bc4
IF NOT (V_13f2! <> 0.0) THEN GOTO L_14b44   '@14ac2 DS:1ad2
V_0f18$ = LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0)))))   '@14add DS:1bbc
L_14b44:
IF NOT (V_1416% = 1) THEN GOTO L_15161   '@14b44
LOCATE 24, 1   '@14b53
COLOR 7   '@14b6e
PRINT " Bitola  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@14b84 DS:1780,1bc4,1c22,1c88
LOCATE 24, LEN(V_0f18$) + 13   '@14bbf
CALL MIXT_07f1_LimpaTeclado   '@14be6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@14bf0
RT_LINEINPUT "", V_0f18$   '@14c06 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@14c20
IF NOT (V_142e! > 0.0) THEN GOTO L_14d84   '@14c3a DS:1ad2
V_13f6! = 0.0   '@14c55 DS:1ad2
L_14c6c:
IF NOT (A_0e8c_bitola!(RT_CINT%(FX##(V_13f6!))) = V_142e!) THEN GOTO L_14ca5   '@14c6c
GOTO L_14cd4   '@14c9d
L_14ca5:
V_13f6! = FX##(V_13f6!) + 1.0   '@14ca5 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF V_13f6! <= 9.0 THEN GOTO L_14c6c   '@14cbb DS:1c96
L_14cd4:
IF NOT (V_13f6! > 9.0) THEN GOTO L_14d01   '@14cd4 DS:1c96
BEEP   '@14cef
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14aab   '@14cf9
L_14d01:
GOSUB L_1559c   '@14d01
IF NOT (V_0f18$ = "NAO") THEN GOTO L_14d37   '@14d0e DS:1c9a
BEEP   '@14d25
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14aab   '@14d2f
L_14d37:
A_11e0%(RT_CINT%(FX##(V_0f14!)), 4) = RT_CINT%(-1000.0 * FX##(V_13f6!) - V_0f04!)   '@14d37 DS:1ca2
GOSUB L_1256f   '@14d72
L_14d84:
L_14d89:
V_0f18$ = "*"   '@14d8e DS:1bc4
IF NOT (A_11e0%(RT_CINT%(FX##(V_0f14!)), 4) <> 0) THEN GOTO L_14e62   '@14da0
V_0f18$ = LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) - INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0) * 1000.0))))   '@14dcb DS:1bbc
L_14e62:
LOCATE 24, 40   '@14e62
COLOR 7   '@14e80
PRINT "Espacamento  *"; V_0f18$; "*"; RT_TAB$(79); ""; " "   '@14e96 DS:1780,1bc4,1c22,1ca6
LOCATE 24, LEN(V_0f18$) + 56   '@14ed1
CALL MIXT_07f1_LimpaTeclado   '@14ef8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
COLOR 14   '@14f02
RT_LINEINPUT "", V_0f18$   '@14f18 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_142e! = VAL(V_0f18$)   '@14f32
IF NOT (V_142e! > 0.0) THEN GOTO L_1515c   '@14f4c DS:1ad2
IF NOT (V_142e! > V_0f62!) THEN GOTO L_14f94   '@14f67
BEEP   '@14f82
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14d89   '@14f8c
L_14f94:
V_0ef0! = 1.0   '@14f94 DS:17da
L_14faa:
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0ef0!))) = V_142e!) THEN GOTO L_14fe3   '@14faa
GOTO L_15020   '@14fdb
L_14fe3:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@14fe3 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_129c_espacamento!(0) >= V_0ef0! THEN GOTO L_14faa   '@14ff9
L_15020:
IF NOT (A_129c_espacamento!(0) < V_0ef0!) THEN GOTO L_1505b   '@15020
BEEP   '@15049
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14d89   '@15053
L_1505b:
V_16a8! = V_0ef0!   '@1505b
V_13f6! = INT(ABS(A_11e0%(RT_CINT%(FX##(V_0f14!)), 4)) / 1000.0)   '@1506c DS:1bbc
IF NOT (FX##(A_0eba_areabarra!(RT_CINT%(FX##(V_13f6!)))) / A_129c_espacamento!(RT_CINT%(FX##(V_16a8!))) * 100.0 < FX##(V_13f2!)) THEN GOTO L_1510f   '@150ac DS:1bc0
BEEP   '@150fd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_14d89   '@15107
L_1510f:
A_11e0%(RT_CINT%(FX##(V_0f14!)), 4) = RT_CINT%(-1000.0 * FX##(V_13f6!) - V_16a8!)   '@1510f DS:1ca2
GOSUB L_1256f   '@1514a
L_1515c:
L_15161:
L_15166:
L_15170:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0efc#   '@15170 DS:1cde
IF NOT (V_1416% = 1) THEN GOTO L_1526a   '@1519c
RT_VIEWPRINT 23, 25   '@151ab
COLOR 7   '@151bd
RT_CLS 2   '@151d3
PRINT " Alteracao Correta  N/*S* ";   '@151e1 DS:1d8a
CALL MIXT_07f1_LimpaTeclado   '@151ef
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@151f9 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_1525d   '@15213 DS:1900
RT_VIEWPRINT 17, 25   '@15230
RT_CLS 2   '@15242
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_1280c   '@15250
L_1525d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_115c3   '@1525d
L_1526a:
RETURN   '@1526a
L_15279:   ' sub-rotina (alvo de GOSUB)
IF NOT (RT_POT##((80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c!), (2.0)) < 108.8000030517578125## * V_0df0! * V_0e70! * V_1426! * V_0e28! / V_0e2c!) THEN GOTO L_152f2   '@1527e DS:1a62,1da8,1dac,1db0
V_142a! = -1.0   '@152d7 DS:1bb8
RETURN   '@152e8
L_152f2:
V_142a! = (80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c! - RT_SQR##(RT_POT##((80.0 * FX##(V_0eec!) * 0.85000002384185791015625## * V_0df0! * V_0e70! / V_0e2c!), (2.0)) - 108.8000030517578125## * V_0df0! * V_0e70! * V_1426! * V_0e28! / V_0e2c!)) / (FX##(V_0e70!) * V_0df0! * 54.40000152587890625##) * V_0e2c!   '@152f2 DS:1a62,1da8,1dac,1db0,1db4
IF NOT (FX##(V_142a!) / V_0eec! > FX##(V_13ee!)) THEN GOTO L_153bf   '@15384
V_142a! = -1.0   '@153a4 DS:1bb8
RETURN   '@153b5
L_153bf:
V_13f2! = 80.0 / (FX##(V_0e2c!) * V_0df0! * V_0e74!) * V_142a! * 0.85000002384185791015625## * V_0df0! * V_0e70! * V_0e30!   '@153bf DS:1dac,1db0
IF NOT (V_1420% = 0) THEN GOTO L_1543d   '@153fb
V_143e! = FX##(V_0f72!) * V_1422!   '@1540a
CALL MIXT_082a_Maior(V_13f2!, V_143e!, V_1442!)   '@15420
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_13f2! = V_1442!   '@15432
L_1543d:
IF NOT (V_1420% = 1) THEN GOTO L_154b5   '@1543d
IF NOT (V_0f86! < 1.0) THEN GOTO L_1547d   '@1544c DS:17da
V_13f2! = FX##(V_13f2!) / V_0f86!   '@15467
L_1547d:
V_1446! = FX##(V_0f76!) * V_1422!   '@1547d
CALL MIXT_082a_Maior(V_13f2!, V_1446!, V_144a!)   '@15493
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_13f2! = V_144a!   '@154a5
L_154b5:
RETURN   '@154b5
L_154c4:   ' sub-rotina (alvo de GOSUB)
V_0f18$ = ""   '@154c9 DS:1780
V_144e! = A_126e!(0, 0)   '@154db
FOR V_0f04! = 1.0 TO V_144e!   '@154fc DS:17da
V_13f6! = A_126e!(RT_CINT%(FX##(V_0f04!)), 1)   '@15504
IF NOT (A_126e!(RT_CINT%(FX##(V_0f04!)), 0) >= V_1422!) THEN GOTO L_1556b   '@1552f
GOTO L_15597   '@15563
L_1556b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@1556b DS:17da
L_15597:
L_1559c:   ' sub-rotina (alvo de GOSUB)
FOR V_0f04! = A_129c_espacamento!(0) TO 1.0 STEP -1.0   '@155a1 DS:17da,1bb8
V_16cc! = 0.0   '@155bc DS:1ad2
L_155d2:
IF NOT (A_0f34!(RT_CINT%(FX##(V_16cc!)), 0) < V_1422!) THEN GOTO L_1561e   '@155d3
V_16cc! = FX##(V_16cc!) + 1.0   '@15601 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_155d2   '@15617
L_1561e:
IF NOT (A_129c_espacamento!(RT_CINT%(FX##(V_0f04!))) < A_0f34!(RT_CINT%(FX##(V_16cc!)), 1)) THEN GOTO L_15682   '@1561e
V_0f04! = 0.0   '@15669 DS:1ad2
GOTO L_157aa   '@1567a
L_15682:
IF NOT (FX##(A_0eba_areabarra!(RT_CINT%(FX##(V_13f6!)))) / A_129c_espacamento!(RT_CINT%(FX##(V_0f04!))) * 100.0 >= FX##(V_13f2!)) THEN GOTO L_1577e   '@15682 DS:1bc0
L_BP0c% = (V_0f66$ = "N")   '@156d3 DS:1900
IF NOT ((FX##(A_129c_espacamento!(RT_CINT%(FX##(V_0f04!)))) <= 2.0 * FX##(V_1422!) AND V_0f66$ = "S" OR L_BP0c%) <> 0) THEN GOTO L_15779   '@156f8 DS:1a62,1db8
V_1452! = A_129c_espacamento!(RT_CINT%(FX##(V_0f04!)))   '@15745
GOTO L_157aa   '@1576c
L_15779:
L_1577e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@1577e DS:17da,1bb8
L_157aa:
IF NOT (V_0f04! = 0.0) THEN GOTO L_15815   '@157aa DS:1ad2
V_13f6! = FX##(V_13f6!) + 1.0   '@157c5 DS:17da
IF NOT (V_13f6! < 10.0) THEN GOTO L_157fe   '@157db DS:17de
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_1559c   '@157f6
L_157fe:
V_0f18$ = "NAO"   '@157fe DS:1c9a
L_15815:
RETURN   '@15815
L_15824:   ' entrada vinda de 010681_FUN_1000_0681
RT_VIEWPRINT 1, 25   '@15829
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1583b
RT_CLS 2   '@15867
PRINT RT_STRINGC$((80), (205))   '@15875
PRINT " Armaduras Positivas nas Lajes"   '@1588d DS:1dbe
PRINT RT_STRINGC$((80), (205))   '@1589b
V_1414% = 0   '@158b3
V_1412% = 1   '@158be
V_1456$ = "N"   '@158c9 DS:1900
L_158e0:   ' entrada vinda de 016337_FUN_1000_6337, 0163fb_FUN_1000_63fb
V_13e6% = 1   '@158e5
V_13e8% = 0   '@158f0
L_15900:
IF NOT (A_10cc!(V_13e6%, 1) = 2.0) THEN GOTO L_15937   '@15900 DS:1a62
V_13e8% = V_13e8% + 1   '@1592e
L_15937:
V_13e6% = V_13e6% + 1   '@15937
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF A_109e%(0, 0) >= V_13e6% THEN GOTO L_15900   '@15940
V_13e6% = A_109e%(0, 0) - V_13e8%   '@1595e
L_15982:
RT_VIEWPRINT 6, 25   '@15987
COLOR RT_CINT%(FX##(V_0dc0_cortexto!))   '@15999
RT_CLS 2   '@159b6
PRINT " Arquivadas"; V_13e6%; "Lajes  ( "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)));   '@159c4 DS:17da,1a66,1a76
IF NOT (V_13e6% > 1) THEN GOTO L_15a60   '@15a12
PRINT " a "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_13e6%) + V_0e54_nivellaje!)));   '@15a21 DS:1a84
L_15a60:
PRINT " )"   '@15a60 DS:1a8c
COLOR 7   '@15a6e
PRINT " Numero das Lajes que serao mostradas as Armaduras"   '@15a84 DS:1de0
PRINT " I/J/N a M/.../K  *TODAS* ";   '@15a92 DS:1e16
CALL MIXT_07f1_LimpaTeclado   '@15aa0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@15aaa DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_15b63   '@15ac4
V_13ea$ = LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + 1.0)))   '@15ad9 DS:17da
IF NOT (V_13e6% > 1) THEN GOTO L_15b5b   '@15b07
V_13ea$ = V_13ea$ + " A " + LTRIM$(STR$(RT_SNG!(FX##(V_13e6%) + V_0e54_nivellaje!)))   '@15b16 DS:1e34
L_15b5b:
GOTO L_15b80   '@15b5b
L_15b63:
V_13ea$ = UCASE$(V_0f18$)   '@15b63
L_15b80:
V_13da! = 1.0   '@15b80 DS:17da
L_15b96:
V_13de! = RT_INSTR%((RT_CINT%(FX##(V_13da!) + 1.0)), (V_13ea$), ("/"))   '@15b96 DS:17da,1e3c
IF NOT (V_13de! = 0.0) THEN GOTO L_15bfa   '@15bc4 DS:1ad2
V_13de! = LEN(V_13ea$) + 1   '@15bdf
L_15bfa:
V_0f18$ = RT_MID$((V_13ea$), (RT_CINT%(FX##(V_13da!))), (RT_CINT%(FX##(V_13de!) - V_13da!)))   '@15bfa
L_BP0c% = (FX##(VAL(V_0f18$)) <= FX##(V_0e54_nivellaje!))   '@15c2d
IF NOT ((FX##(VAL(V_0f18$)) > FX##(V_13e6%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_15ca3   '@15c68
V_0f18$ = "*"   '@15c89 DS:1bc4
GOTO L_15dfa   '@15c9b
L_15ca3:
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_15dc0   '@15ca3 DS:1e42
L_BP0c% = (FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) <= FX##(V_0e54_nivellaje!))   '@15cbc DS:1e42
IF NOT ((FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) > FX##(V_13e6%) + V_0e54_nivellaje! OR L_BP0c%) <> 0) THEN GOTO L_15d5e   '@15d12 DS:1e42
V_0f18$ = "*"   '@15d44 DS:1bc4
GOTO L_15dfa   '@15d56
L_15d5e:
IF NOT (VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1))) <= VAL(V_0f18$)) THEN GOTO L_15dbb   '@15d5e DS:1e42
V_0f18$ = "*"   '@15da1 DS:1bc4
GOTO L_15dfa   '@15db3
L_15dbb:
L_15dc0:
V_13da! = FX##(V_13de!) + 1.0   '@15dc0 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_13ea$) <= V_13de!) THEN GOTO L_15b96   '@15dd6
L_15dfa:
IF NOT (V_0f18$ = "*") THEN GOTO L_15e23   '@15dfa DS:1bc4
BEEP   '@15e11
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_15982   '@15e1b
L_15e23:
LOCATE 10, 1   '@15e23
PRINT " Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada ";   '@15e3e DS:1e48
CALL MIXT_07f1_LimpaTeclado   '@15e4c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@15e56 DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_145a$ = "ST"   '@15e70 DS:1e84
IF NOT (UCASE$(V_0f18$) = "I") THEN GOTO L_15eb1   '@15e82 DS:1954
V_145a$ = "SI"   '@15e9f DS:1e8a
L_15eb1:
IF NOT (V_1414% = 1) THEN GOTO L_16047   '@15eb1
L_15ec5:
LOCATE 12, 1   '@15eca
PRINT " <1> So Positiva   <2> So Negativa   <*3*> Ambas Juntas   <4> Ambas Isoladas";   '@15ee5 DS:1e90
CALL MIXT_07f1_LimpaTeclado   '@15ef3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@15efd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
L_BP0c% = (V_0f18$ = " ")   '@15f19 DS:1c22
IF NOT ((CHR$(13) = V_0f18$ OR L_BP0c%) <> 0) THEN GOTO L_15f6c   '@15f3a
V_1414% = 3   '@15f59
GOTO L_16042   '@15f64
L_15f6c:
L_BP0c% = (VAL(V_0f18$) <> 1.0#)   '@15f6c DS:1cde,1ee0
L_BP0e% = VAL(V_0f18$) <> 2.0# AND L_BP0c%   '@15f9f DS:1ee8
L_BP10% = VAL(V_0f18$) <> 3.0# AND L_BP0e%   '@15fc7 DS:1ef0
IF NOT ((VAL(V_0f18$) <> 4.0# AND L_BP10%) <> 0) THEN GOTO L_16022   '@15fef
BEEP   '@16010
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_15ec5   '@1601a
L_16022:
V_1414% = RT_CINT%(FX##(VAL(V_0f18$)))   '@16022
L_16042:
L_16047:
PRINT ""   '@16047 DS:1780
PRINT " Dados Corretos N/*S* ";   '@16055 DS:1ef8
CALL MIXT_07f1_LimpaTeclado   '@16063
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0f18$   '@1606d DS:1780
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_160ac   '@16087 DS:1900
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@160a4
L_160ac:
IF NOT (V_1414% > 0) THEN GOTO L_160c6   '@160ac
V_1412% = 0   '@160bb
L_160c6:
L_160cb:
IF NOT (V_1414% > 0) THEN GOTO L_1626e   '@160d0
V_1412% = V_1412% + 1   '@160df
IF NOT (V_1412% = 1 AND V_1414% = 1) THEN GOTO L_16114   '@160e8
GOTO L_16273   '@1610c
L_16114:
IF NOT (V_1414% = 1) THEN GOTO L_1612b   '@16114
GOTO L_162a1   '@16123
L_1612b:
IF NOT (V_1412% = 1 AND V_1414% = 2) THEN GOTO L_16157   '@1612b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_160cb   '@1614f
L_16157:
IF NOT (V_1412% = 2 AND V_1414% = 2) THEN GOTO L_16183   '@16157
GOTO L_16273   '@1617b
L_16183:
IF NOT (V_1414% = 2) THEN GOTO L_1619a   '@16183
GOTO L_162a1   '@16192
L_1619a:
IF NOT (V_1412% < 3 AND V_1414% = 3) THEN GOTO L_161c6   '@1619a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_160cb   '@161be
L_161c6:
IF NOT (V_1412% = 3 AND V_1414% = 3) THEN GOTO L_161f2   '@161c6
GOTO L_16273   '@161ea
L_161f2:
IF NOT (V_1414% = 3) THEN GOTO L_16209   '@161f2
GOTO L_162a1   '@16201
L_16209:
IF NOT (V_1412% = 1 AND V_1414% = 4) THEN GOTO L_16235   '@16209
GOTO L_16273   '@1622d
L_16235:
IF NOT (V_1412% = 2 AND V_1414% = 4) THEN GOTO L_16261   '@16235
GOTO L_16273   '@16259
L_16261:
GOTO L_162a1   '@16261
L_1626e:
L_16273:
GOSUB L_164bf   '@16278
IF NOT (V_1414% > 0) THEN GOTO L_1629c   '@16285
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_160cb   '@16294
L_1629c:
L_162a1:
IF NOT (V_1414% > 0) THEN GOTO L_1632a   '@162a6
RT_SCREEN 0   '@162b5
RT_VIEWPRINT 1, 25   '@162ca
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@162dc
RT_CLS 2   '@16317
L_1632a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_10681   '@1632a
' ---- FUN_1000_6337 @0x16337  (016337_FUN_1000_6337.lift.txt; evidence_id (assembly): ev_0db90db29d15846b68d68d96f91088aa6969eb3adbff0e78f8163632a789ccd7)
L_16337:   ' entrada vinda de 010681_FUN_1000_0681
RT_VIEWPRINT 1, 25   '@1633c
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@1634e
RT_CLS 2   '@1637a
PRINT RT_STRINGC$((80), (205))   '@16388
PRINT " Armaduras Negativas nas Lajes"   '@163a0 DS:1f12
PRINT RT_STRINGC$((80), (205))   '@163ae
V_1414% = 0   '@163c6
V_1412% = 2   '@163d1
V_1456$ = "N"   '@163dc DS:1900
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_158e0   '@163ee
' ---- FUN_1000_63fb @0x163fb  (0163fb_FUN_1000_63fb.lift.txt; evidence_id (assembly): ev_be6098475123b0d25a4ca2fdb8613e3ba0e8adaa4016ca573f71f2e27fe03a98)
L_163fb:   ' entrada vinda de 010681_FUN_1000_0681
RT_VIEWPRINT 1, 25   '@16400
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@16412
RT_CLS 2   '@1643e
PRINT RT_STRINGC$((80), (205))   '@1644c
PRINT " Impressao do Desenho das Armaduras dispostas nas Lajes"   '@16464 DS:1f34
PRINT RT_STRINGC$((80), (205))   '@16472
V_1414% = 1   '@1648a
V_1412% = 3   '@16495
V_1456$ = "S"   '@164a0 DS:1db8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
GOTO L_158e0   '@164b2
' ---- F_164ba @0x164ba  (0164ba_F_164ba.lift.txt; evidence_id (assembly): ev_0ceedf0d97f3af03b123789cb124c426ba90334cab922111aef5472aec4e676e)
L_164bf:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01197f_F_1197f
RT_VIEWPRINT 1, 25   '@164c4
V_145e$ = V_0dcc_placa$   '@164d6
IF NOT (V_145e$ = "HER") THEN GOTO L_16583   '@164e8 DS:1f70
RT_SCREEN 3   '@164ff
V_1402! = 7.0   '@16515 DS:1f78
V_1406! = 7.0   '@16526 DS:1f78
V_140a! = 0.0   '@16537 DS:1ad2
V_140e! = 7.0   '@16548 DS:1f78
V_13fa! = 4.5   '@16559 DS:1f7c
V_13fe! = 4.0   '@1656a DS:1cb8
GOTO L_166e6   '@1657b
L_16583:
IF NOT (V_145e$ <> "CGA") THEN GOTO L_165a7   '@16583 DS:1f80
IF NOT (V_145e$ = "MCG") THEN GOTO L_16628   '@16595 DS:1f88
L_165a7:
RT_SCREEN 2   '@165a7
V_1402! = 15.0   '@165ba DS:17e2
V_1406! = 15.0   '@165cb DS:17e2
V_140a! = 0.0   '@165dc DS:1ad2
V_140e! = 15.0   '@165ed DS:17e2
V_13fa! = 4.0   '@165fe DS:1cb8
V_13fe! = 4.0   '@1660f DS:1cb8
GOTO L_166e6   '@16620
L_16628:
IF NOT (V_145e$ <> "EGA") THEN GOTO L_1664c   '@16628 DS:1f90
IF NOT (V_145e$ = "VGA") THEN GOTO L_166e6   '@1663a DS:1f98
L_1664c:
RT_SCREEN 9   '@1664c
COLOR , 1   '@16662
V_1402! = 14.0   '@16678 DS:1fa0
V_1406! = 15.0   '@16689 DS:17e2
V_140a! = 1.0   '@1669a DS:17da
V_140e! = 12.0   '@166ab DS:1fa4
V_13fa! = 4.0   '@166bc DS:1cb8
V_13fe! = 4.0   '@166cd DS:1cb8
GOTO L_166e6   '@166de
L_166e6:
IF NOT (V_145a$ = "ST") THEN GOTO L_171db   '@166e6 DS:1e84
V_175c! = 1000.0   '@166fd DS:1bbc
V_1760! = 0.0   '@1670e DS:1ad2
V_1764! = 1000.0   '@1671f DS:1bbc
V_1768! = 0.0   '@16730 DS:1ad2
V_13da! = 1.0   '@16741 DS:17da
L_16758:
V_13de! = RT_INSTR%((RT_CINT%(FX##(V_13da!) + 1.0)), (V_13ea$), ("/"))   '@16758 DS:17da,1e3c
IF NOT (V_13de! = 0.0) THEN GOTO L_167bc   '@16786 DS:1ad2
V_13de! = LEN(V_13ea$) + 1   '@167a1
L_167bc:
V_0f18$ = RT_MID$((V_13ea$), (RT_CINT%(FX##(V_13da!))), (RT_CINT%(FX##(V_13de!) - V_13da!)))   '@167bc
V_13d2! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@167ef
V_13d6! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@16811
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_16884   '@16833 DS:1e42
V_13d6! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@1684c DS:1e42
L_16884:
V_13e8% = 0   '@16884
V_0f0c! = 0.0   '@1688f DS:1ad2
L_168a6:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@168a6 DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_168fa   '@168bc DS:1a62
V_13e8% = V_13e8% + 1   '@168f1
L_168fa:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!) OR FX##(V_0f0c!) - V_13e8% < FX##(V_13d2!))) THEN GOTO L_1698d   '@168fa DS:1ad2
GOTO L_16c6b   '@16985
L_1698d:
V_16d0! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@1698d
V_1462! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0)   '@169b7
FOR V_0f04! = 1.0 TO V_1462!   '@169e6 DS:17da
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0) < V_175c!) THEN GOTO L_16a80   '@169ee
V_175c! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@16a3c
L_16a80:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0) > V_1760!) THEN GOTO L_16b12   '@16a80
V_1760! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@16ace
L_16b12:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1) < V_1764!) THEN GOTO L_16ba6   '@16b12
V_1764! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@16b61
L_16ba6:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1) > V_1768!) THEN GOTO L_16c3a   '@16ba6
V_1768! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@16bf5
L_16c3a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@16c3a DS:17da
L_16c6b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!)) THEN GOTO L_168a6   '@16c70
V_13da! = FX##(V_13de!) + 1.0   '@16c96 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_13ea$) <= V_13de!) THEN GOTO L_16758   '@16cac
V_176c! = 560.0 / (FX##(V_1760!) - V_175c!)   '@16cd0 DS:1fa8
V_1770! = 145.0 / (FX##(V_1768!) - V_1764!)   '@16cee DS:1fac
IF NOT (FX##(V_1770!) / V_176c! > 0.41670000553131103515625##) THEN GOTO L_16d4a   '@16d0c DS:1fb0
V_1770! = V_176c! * 0.41670000553131103515625##   '@16d2c DS:1fb0
GOTO L_16d65   '@16d42
L_16d4a:
V_176c! = V_1770! / 0.41670000553131103515625##   '@16d4a DS:1fb0
L_16d65:
RT_CLS -1   '@16d65
RT_WINDOW 1, (0), (0), (639), (199)   '@16d73 DS:1ad2,1ad4,1fb4,1fb6,1fb8,1fba (B$WIND decodificado)
V_1754! = 45.0   '@16da1 DS:1fbc
V_1758! = 10.0   '@16db2 DS:17de
V_13da! = 1.0   '@16dc3 DS:17da
L_16dda:
V_13de! = RT_INSTR%((RT_CINT%(FX##(V_13da!) + 1.0)), (V_13ea$), ("/"))   '@16dda DS:17da,1e3c
IF NOT (V_13de! = 0.0) THEN GOTO L_16e3e   '@16e08 DS:1ad2
V_13de! = LEN(V_13ea$) + 1   '@16e23
L_16e3e:
V_0f18$ = RT_MID$((V_13ea$), (RT_CINT%(FX##(V_13da!))), (RT_CINT%(FX##(V_13de!) - V_13da!)))   '@16e3e
V_13d2! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@16e71
V_13d6! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@16e93
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_16f06   '@16eb5 DS:1e42
V_13d6! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@16ece DS:1e42
L_16f06:
V_13e8% = 0   '@16f06
V_0f0c! = 0.0   '@16f11 DS:1ad2
L_16f28:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@16f28 DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_16f7c   '@16f3e DS:1a62
V_13e8% = V_13e8% + 1   '@16f73
L_16f7c:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!) OR FX##(V_0f0c!) - V_13e8% < FX##(V_13d2!))) THEN GOTO L_1700f   '@16f7c DS:1ad2
GOTO L_17021   '@17007
L_1700f:
GOSUB L_17b6c   '@1700f
L_17021:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!)) THEN GOTO L_16f28   '@17026
V_13da! = FX##(V_13de!) + 1.0   '@1704c DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_13ea$) <= V_13de!) THEN GOTO L_16dda   '@17062
LOCATE 22, 1   '@17086
PRINT " "; V_0dd8$   '@170a1 DS:1c22
IF NOT (V_1412% = 1) THEN GOTO L_170d5   '@170b8
PRINT " ARMADURAS POSITIVAS"   '@170c7 DS:1fc0
L_170d5:
IF NOT (V_1412% = 2) THEN GOTO L_170f2   '@170d5
PRINT " ARMADURAS NEGATIVAS"   '@170e4 DS:1fd8
L_170f2:
IF NOT (V_1412% = 3) THEN GOTO L_1710f   '@170f2
PRINT " ARMADURAS POSITIVAS E NEGATIVAS"   '@17101 DS:1ff0
L_1710f:
PRINT " OBRA "; V_0e24$;   '@1710f DS:2014
PRINT "      LAJES "; V_0e58_prefixolaje$; V_13ea$;   '@17126 DS:201e
IF NOT (V_1456$ = "S") THEN GOTO L_171a8   '@17146 DS:1db8
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@1715d
RT_ROTINA_0AEA   '@17170 (rotina em assembly ligada ao EXE (SUB_30aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@1717a DS:1780
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@1718d
GOTO L_171d3   '@171a0
L_171a8:
CALL MIXT_07f1_LimpaTeclado   '@171a8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@171b2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
L_171d3:
GOTO L_17ad9   '@171d3
L_171db:
V_13da! = 1.0   '@171db DS:17da
L_171f2:
V_13de! = RT_INSTR%((RT_CINT%(FX##(V_13da!) + 1.0)), (V_13ea$), ("/"))   '@171f2 DS:17da,1e3c
IF NOT (V_13de! = 0.0) THEN GOTO L_17256   '@17220 DS:1ad2
V_13de! = LEN(V_13ea$) + 1   '@1723b
L_17256:
V_0f18$ = RT_MID$((V_13ea$), (RT_CINT%(FX##(V_13da!))), (RT_CINT%(FX##(V_13de!) - V_13da!)))   '@17256
V_13d2! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@17289
V_13d6! = FX##(VAL(V_0f18$)) - V_0e54_nivellaje!   '@172ab
IF NOT (INSTR(V_0f18$, "A") > 0) THEN GOTO L_1731e   '@172cd DS:1e42
V_13d6! = FX##(VAL(RT_MID2$((V_0f18$), (INSTR(V_0f18$, "A") + 1)))) - V_0e54_nivellaje!   '@172e6 DS:1e42
L_1731e:
V_13e8% = 0   '@1731e
V_0f0c! = 0.0   '@17329 DS:1ad2
L_17340:
V_0f0c! = FX##(V_0f0c!) + 1.0   '@17340 DS:17da
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_17394   '@17356 DS:1a62
V_13e8% = V_13e8% + 1   '@1738b
L_17394:
IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 0.0 OR (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!) OR FX##(V_0f0c!) - V_13e8% < FX##(V_13d2!))) THEN GOTO L_17427   '@17394 DS:1ad2
GOTO L_17a6f   '@1741f
L_17427:
V_16d0! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@17427
V_175c! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), 1), 0)   '@17451
V_1760! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), 1), 0)   '@1748e
V_1764! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), 1), 1)   '@174cb
V_1768! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), 1), 1)   '@17509
V_1466! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0)   '@17547
FOR V_0f04! = 2.0 TO V_1466!   '@17576 DS:17da,1a62
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0) < V_175c!) THEN GOTO L_17610   '@1757e
V_175c! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@175cc
L_17610:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0) > V_1760!) THEN GOTO L_176a2   '@17610
V_1760! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@1765e
L_176a2:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1) < V_1764!) THEN GOTO L_17736   '@176a2
V_1764! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@176f1
L_17736:
IF NOT (A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1) > V_1768!) THEN GOTO L_177ca   '@17736
V_1768! = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@17785
L_177ca:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@177ca DS:17da
V_176c! = 560.0 / (FX##(V_1760!) - V_175c!)   '@177f6 DS:1fa8
V_1770! = 145.0 / (FX##(V_1768!) - V_1764!)   '@17814 DS:1fac
IF NOT (FX##(V_1770!) / V_176c! > 0.41670000553131103515625##) THEN GOTO L_17870   '@17832 DS:1fb0
V_1770! = V_176c! * 0.41670000553131103515625##   '@17852 DS:1fb0
GOTO L_1788b   '@17868
L_17870:
V_176c! = V_1770! / 0.41670000553131103515625##   '@17870 DS:1fb0
L_1788b:
RT_CLS -1   '@1788b
RT_WINDOW 1, (0), (0), (639), (199)   '@17899 DS:1ad2,1ad4,1fb4,1fb6,1fb8,1fba (B$WIND decodificado)
V_1754! = 45.0   '@178c7 DS:1fbc
V_1758! = 10.0   '@178d8 DS:17de
GOSUB L_17b6c   '@178e9
LOCATE 22, 1   '@178f6
PRINT " "; V_0dd8$   '@17911 DS:1c22
IF NOT (V_1412% = 1) THEN GOTO L_17945   '@17928
PRINT " ARMADURAS POSITIVAS"   '@17937 DS:1fc0
L_17945:
IF NOT (V_1412% = 2) THEN GOTO L_17962   '@17945
PRINT " ARMADURAS NEGATIVAS"   '@17954 DS:1fd8
L_17962:
IF NOT (V_1412% = 3) THEN GOTO L_1797f   '@17962
PRINT " ARMADURAS POSITIVAS E NEGATIVAS"   '@17971 DS:1ff0
L_1797f:
PRINT " OBRA "; V_0e24$;   '@1797f DS:2014
PRINT "      LAJE "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0f0c!) - V_13e8% + V_0e54_nivellaje!)));   '@17996 DS:202e
IF NOT (V_1456$ = "S") THEN GOTO L_17a3f   '@179dd DS:1db8
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@179f4
RT_ROTINA_0AEA   '@17a07 (rotina em assembly ligada ao EXE (SUB_30aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@17a11 DS:1780
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@17a24
GOTO L_17a6a   '@17a37
L_17a3f:
CALL MIXT_07f1_LimpaTeclado   '@17a3f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@17a49
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
L_17a6a:
L_17a6f:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_0f0c!) - V_13e8% > FX##(V_13d6!)) THEN GOTO L_17340   '@17a74
V_13da! = FX##(V_13de!) + 1.0   '@17a9a DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_13ea$) <= V_13de!) THEN GOTO L_171f2   '@17ab0
L_17ad9:
IF NOT (V_1414% = 0) THEN GOTO L_17b5d   '@17ad9
RT_SCREEN 0   '@17ae8
RT_VIEWPRINT 1, 25   '@17afd
COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(FX##(V_0dc8_corfundo!)), RT_CINT%(FX##(V_0dc8_corfundo!))   '@17b0f
RT_CLS 2   '@17b4a
L_17b5d:
RETURN   '@17b5d
L_17b6c:   ' sub-rotina (alvo de GOSUB)
V_16d0! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@17b71
V_1422! = A_12fc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@17b9b
V_146a! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0) - 1   '@17bc5
FOR V_0f04! = 1.0 TO V_146a!   '@17bf5 DS:17da
V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@17bfc
V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@17c40
RT_PSET RT_SNG!(V_1754! + (FX##(V_0ef4#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_0efc#) - V_1764!) * V_1770!), 0, 0   '@17c85 DS:203e
V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 0)   '@17ce7 DS:17da
V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 1)   '@17d30 DS:17da
IF NOT (A_10fa%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))) = 1) THEN GOTO L_17e28   '@17d7a
RT_LINE 0, 0, RT_SNG!(V_1754! + (FX##(V_0ef4#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_0efc#) - V_1764!) * V_1770!), 72, RT_CINT%(FX##(V_1402!)), 17476   '@17dac DS:203e
GOTO L_18680   '@17e20
L_17e28:
RT_LINE 0, 0, RT_SNG!(V_1754! + (FX##(V_0ef4#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_0efc#) - V_1764!) * V_1770!), 8, RT_CINT%(FX##(V_1406!)), 0   '@17e28 DS:203e
V_0f1c$ = ""   '@17e9c DS:1780
IF NOT ((V_1412% = 3 OR V_1412% = 2) AND A_10fa%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))) > 2) THEN GOTO L_1828b   '@17eae
V_0ef0! = 1.0   '@17f00 DS:17da
L_17f16:
L_BP0c% = (A_11e0%(RT_CINT%(FX##(V_0ef0!)), 2) = V_0f0c!)   '@17f16
IF NOT ((A_11e0%(RT_CINT%(FX##(V_0ef0!)), 3) = V_0f04! AND L_BP0c% OR A_11e0%(RT_CINT%(FX##(V_0ef0!)), 1) = V_0f04! AND A_11e0%(RT_CINT%(FX##(V_0ef0!)), 0) = V_0f0c!) <> 0) THEN GOTO L_18014   '@17fee
GOTO L_18058   '@1800c
L_18014:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@18014 DS:17da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
IF NOT (A_11e0%(0, 0) < V_0ef0!) THEN GOTO L_17f16   '@1802a
L_18058:
IF NOT (A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4) < 0) THEN GOTO L_18195   '@18058
V_0f1c$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4)) / 1000.0))))) + "c/" + LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4)) - INT(ABS(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4)) / 1000.0) * 1000.0))))   '@18083 DS:1bbc,1bca,2042
GOTO L_18286   '@1818d
L_18195:
V_0f1c$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(FX##(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4)) / 1000.0))))) + "c/" + LTRIM$(STR$(RT_SNG!(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4) - INT(FX##(A_11e0%(RT_CINT%(FX##(V_0ef0!)), 4)) / 1000.0) * 1000.0)))   '@18195 DS:1bbc,1bca,2042
L_18286:
L_1828b:
IF NOT (LEN(V_0f1c$) > 0) THEN GOTO L_1867b   '@1828b
V_1734# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 0)   '@182a0
V_173c# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 0)   '@182e4 DS:17da
V_0ef4# = (FX##(V_1734#) + V_173c#) / 2.0#   '@1832d DS:1ee0
V_1744# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!))), 1)   '@18348
V_174c# = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 1)   '@1838d DS:17da
V_0efc# = (FX##(V_1744#) + V_174c#) / 2.0#   '@183d7 DS:1ee0
V_16a4! = 1.0   '@183f2 DS:17da
V_16a8! = -V_13fe! * 0.20000000298023223876953125##   '@18403 DS:2048
IF NOT (V_1744# > V_174c# AND V_1734# > V_173c# OR V_1744# > V_174c# AND V_1734# <= V_173c#) THEN GOTO L_184af   '@1841c
V_16a4! = -(LEN(V_0f1c$) * 2) - 1   '@18490
L_184af:
IF NOT (V_1744# = V_174c#) THEN GOTO L_184e6   '@184af
V_16a4! = -LEN(V_0f1c$)   '@184ca
L_184e6:
IF NOT (V_1734# < V_173c#) THEN GOTO L_18517   '@184e6
V_16a8! = 2.400000095367431640625## * V_13fe!   '@18501 DS:204c
L_18517:
IF NOT (V_1734# = V_173c#) THEN GOTO L_18543   '@18517
V_16a8! = V_13fe!   '@18532
L_18543:
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@18543 DS:1f90
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_18593   '@18568 DS:1f98
COLOR 10   '@1857d
L_18593:
V_146e! = FX##(V_16a4!) * V_13fa! + V_1754! + (FX##(V_0ef4#) - V_175c!) * V_176c!   '@18593
V_1472! = FX##(V_16a8!) - V_1758! - (FX##(V_0efc#) - V_1764!) * V_1770! + 165.0#   '@185c7 DS:2050
V_1476$ = "CGA"   '@185f4 DS:1f80
CALL MIXT_08c4_TextoGrafico(V_146e!, V_1472!, V_0f1c$, V_1476$)   '@18601
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
' @18616 libera strings locais (V_1476)
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@1861f DS:1f90
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_18676   '@18644 DS:1f98
COLOR RT_CINT%(FX##(V_1406!))   '@18659
L_18676:
L_1867b:
L_18680:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY no laco (B$EVCK)
NEXT V_0f04!   '@18680 DS:17da
IF NOT (V_1412% = 3 OR V_1412% = 1) THEN GOTO L_18c7c   '@186ac
GOSUB L_192da   '@186d0
V_0ef4# = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 6)   '@186dd
V_0efc# = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 7)   '@18708
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2) = 0.0) THEN GOTO L_1877f   '@18733 DS:1ad2
V_0f1c$ = "*"   '@18765 DS:1bc4
GOTO L_188dd   '@18777
L_1877f:
V_0f1c$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0))))) + "c/" + LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 2))) / 1000.0) * 1000.0))))   '@1877f DS:1bbc,1bca,2042
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) <= 1.0) THEN GOTO L_188d8   '@1886e DS:17da
V_0f1c$ = "Ä" + V_0f1c$   '@188bc DS:2058
L_188d8:
L_188dd:
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@188dd DS:1f90
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_1892d   '@18902 DS:1f98
COLOR 14   '@18917
L_1892d:
V_147a! = V_1754! - FX##(LEN(V_0f1c$)) * V_13fa! + (FX##(V_0ef4#) - V_175c!) * V_176c!   '@1892d
V_147e! = 165.0 - 0.20000000298023223876953125## * V_13fe! - V_1758! - (FX##(V_0efc#) - V_1764!) * V_1770!   '@1896d DS:203e,2048
V_1482$ = "CGA"   '@189a2 DS:1f80
CALL MIXT_08c4_TextoGrafico(V_147a!, V_147e!, V_0f1c$, V_1482$)   '@189af
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
' @189c4 libera strings locais (V_1482)
IF NOT (A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3) = 0.0) THEN GOTO L_18a1c   '@189cd DS:1ad2
V_0f1c$ = "*"   '@18a02 DS:1bc4
GOTO L_18b83   '@18a14
L_18a1c:
V_0f1c$ = "#" + LTRIM$(STR$(A_0e8c_bitola!(RT_CINT%(INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0))))) + "c/" + LTRIM$(STR$(A_129c_espacamento!(RT_CINT%(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) - INT(ABS(FX##(A_12fc!(RT_CINT%(FX##(V_0f0c!)), 3))) / 1000.0) * 1000.0))))   '@18a1c DS:1bbc,1bca,2042
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) > 1.0) THEN GOTO L_18b7e   '@18b14 DS:17da
V_0f1c$ = "Ä" + V_0f1c$   '@18b62 DS:2058
L_18b7e:
L_18b83:
V_1486! = V_1754! - FX##(LEN(V_0f1c$)) * V_13fa! + (FX##(V_0ef4#) - V_175c!) * V_176c!   '@18b83
V_148a! = 2.2000000476837158203125## * V_13fe! - V_1758! - (FX##(V_0efc#) - V_1764!) * V_1770! + 165.0#   '@18bc3 DS:2050,205e
V_148e$ = "CGA"   '@18bf5 DS:1f80
CALL MIXT_08c4_TextoGrafico(V_1486!, V_148a!, V_0f1c$, V_148e$)   '@18c02
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
' @18c17 libera strings locais (V_148e)
L_BP0c% = (V_0dcc_placa$ = "EGA")   '@18c20 DS:1f90
IF NOT ((V_0dcc_placa$ = "VGA" OR L_BP0c%) <> 0) THEN GOTO L_18c77   '@18c45 DS:1f98
COLOR RT_CINT%(FX##(V_1406!))   '@18c5a
L_18c77:
L_18c7c:
RETURN   '@18c7c
L_18c8b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 01197f_F_1197f
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) = 1.0) THEN GOTO L_18cf9   '@18c90 DS:17da
V_0ef4# = 1.0#   '@18cde DS:1cde
RETURN   '@18cef
L_18cf9:
V_15f4# = FX##(A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 0)) * V_0e68_pi# / 180.0#   '@18cf9 DS:2062
V_1734# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 0) * RT_COS##(FX##(V_15f4#)) - A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 1) * RT_SIN##(FX##(V_15f4#))   '@18d46
V_1744# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 0) * RT_SIN##(FX##(V_15f4#)) + A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0efc#))), 1) * RT_COS##(FX##(V_15f4#))   '@18e16
V_0ef4# = FX##(V_0efc#) + 1.0#   '@18ee6 DS:1cde
IF NOT (A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 0) = V_0ef4#) THEN GOTO L_18f5e   '@18efc
V_0ef4# = 1.0#   '@18f4d DS:1cde
L_18f5e:
V_173c# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 0) * RT_COS##(FX##(V_15f4#)) - A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 1) * RT_SIN##(FX##(V_15f4#))   '@18f5e
V_174c# = A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 0) * RT_SIN##(FX##(V_15f4#)) + A_1070!(A_109e%(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), RT_CINT%(FX##(V_0ef4#))), 1) * RT_COS##(FX##(V_15f4#))   '@1902e
V_15fc# = ABS(FX##(V_173c#) - V_1734#) / RT_SQR##(RT_POT##((FX##(V_174c#) - V_1744#), (2.0#)) + RT_POT##((FX##(V_173c#) - V_1734#), (2.0#)))   '@190fe DS:1ee0
V_1604# = ABS(FX##(V_174c#) - V_1744#) / RT_SQR##(RT_POT##((FX##(V_174c#) - V_1744#), (2.0#)) + RT_POT##((FX##(V_173c#) - V_1734#), (2.0#)))   '@1914c DS:1ee0
SWAP V_15fc#, V_1604#   ' @191a7 correcao manual (ver retraduz.py CORRECOES)
IF NOT (A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) < 1.0) THEN GOTO L_1926d   '@191c6 DS:17da
V_0ef4# = ABS(FX##(A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1)) * V_1604# + V_15fc#)   '@19214
GOTO L_192cb   '@19265
L_1926d:
V_0ef4# = ABS(FX##(V_15fc#) / A_1210!(RT_CINT%(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0))), 1) * 1.0# + V_1604#)   '@1926d DS:1cde
L_192cb:
RETURN   '@192cb
L_192da:   ' sub-rotina (alvo de GOSUB)
CALL S_195d2   '@192df
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10515, L_10540, L_1063e   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 1, 25   '@192e9
V_1734# = A_139e!(1, 0)   '@192fb
V_1744# = A_139e!(1, 1)   '@1931e
V_173c# = A_139e!(1, 2)   '@1933f
V_174c# = A_139e!(1, 3)   '@19360
RT_PSET RT_SNG!(V_1754! + (FX##(V_1734#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_1744#) - V_1764!) * V_1770!), 0, 0   '@19384 DS:203e
RT_LINE 0, 0, RT_SNG!(V_1754! + (FX##(V_173c#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_174c#) - V_1764!) * V_1770!), 8, RT_CINT%(FX##(V_140e!)), 0   '@193e6 DS:203e
V_1734# = A_139e!(1, 4)   '@1945a
V_1744# = A_139e!(1, 5)   '@1947e
V_173c# = A_139e!(1, 6)   '@194a2
V_174c# = A_139e!(1, 7)   '@194c6
RT_PSET RT_SNG!(V_1754! + (FX##(V_1734#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_1744#) - V_1764!) * V_1770!), 0, 0   '@194ea DS:203e
RT_LINE 0, 0, RT_SNG!(V_1754! + (FX##(V_173c#) - V_175c!) * V_176c!), RT_SNG!(165.0 - FX##(V_1758!) - (FX##(V_174c#) - V_1764!) * V_1770!), 72, RT_CINT%(FX##(V_140e!)), 4369   '@1954c DS:203e
RETURN   '@195c0
' @195ca (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_1aa24   '@195ca
' ---- FUN_1000_aa24 @0x1aa24  (01aa24_FUN_1000_aa24.lift.txt; evidence_id (assembly): ev_99572162539ff305e1750814f03cfa771fe5f3ca2dd89854db376f8ddce0a3e4)
L_1aa24:   ' entrada vinda de 0164ba_F_164ba
GOTO L_1aba6   '@1aa24
' ---- FUN_1000_aba6 @0x1aba6  (01aba6_FUN_1000_aba6.lift.txt; evidence_id (assembly): ev_f816b5e87af3a9762c9e2d98eaba35aee3ce6fc4790b84bd3933d8e4c3282ab8)
L_1aba6:   ' entrada vinda de 01aa24_FUN_1000_aa24
GOTO L_1b1a3   '@1aba6
' ---- FUN_1000_b1a3 @0x1b1a3  (01b1a3_FUN_1000_b1a3.lift.txt; evidence_id (assembly): ev_806c75944b76c901219155a042bf35f3810c9da5875fc1072d0051841a1c1411)
L_1b1a3:   ' entrada vinda de 01aba6_FUN_1000_aba6
RT_FIM   ' @1b1a3 B$CENP (inicio/fim do modulo)
'RETRAD? @1b1a8 ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x30aea (chamada por CALL SUB_30aea no lift).
' Versao A; DS do original: inicio DS:21A2, CR LF DS:219C, fim DS:219F, margem em [DS:2493], ESC L em [DS:219A].
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
    REDIM A_1342!(-32768 TO -32768)
    REDIM A_1370!(-32768 TO -32768)
    REDIM A_139e!(-32768 TO -32768, -32768 TO -32768)
    V_13d2! = 0
    V_13d6! = 0
    V_13da! = 0
    V_13de! = 0
    V_13e2! = 0
    V_13e6% = 0
    V_13e8% = 0
    V_13ea$ = ""
    V_13ee! = 0
    V_13f2! = 0
    V_13f6! = 0
    V_13fa! = 0
    V_13fe! = 0
    V_1402! = 0
    V_1406! = 0
    V_140a! = 0
    V_140e! = 0
    V_1412% = 0
    V_1414% = 0
    V_1416% = 0
    V_1418! = 0
    V_141c$ = ""
    V_1420% = 0
    V_1422! = 0
    V_1426! = 0
    V_142a! = 0
    V_142e! = 0
    V_1432# = 0
    V_143a! = 0
    V_143e! = 0
    V_1442! = 0
    V_1446! = 0
    V_144a! = 0
    V_144e! = 0
    V_1452! = 0
    V_1456$ = ""
    V_145a$ = ""
    V_145e$ = ""
    V_1462! = 0
    V_1466! = 0
    V_146a! = 0
    V_146e! = 0
    V_1472! = 0
    V_1476$ = ""
    V_147a! = 0
    V_147e! = 0
    V_1482$ = ""
    V_1486! = 0
    V_148a! = 0
    V_148e$ = ""
    V_15cc# = 0
    V_15d4# = 0
    V_15f4# = 0
    V_15fc# = 0
    V_1604# = 0
    V_16a4! = 0
    V_16a8! = 0
    V_16ac! = 0
    V_16b0! = 0
    V_16cc! = 0
    V_16d0! = 0
    V_1734# = 0
    V_173c# = 0
    V_1744# = 0
    V_174c# = 0
    V_1754! = 0
    V_1758! = 0
    V_175c! = 0
    V_1760! = 0
    V_1764! = 0
    V_1768! = 0
    V_176c! = 0
    V_1770! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_10515: BEEP; GOSUB L_10270; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_10540: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_1063e: sai da SUB (BEEP; GOSUB L_10270; RT_SCREEN 0; RETURN L_10681)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H1021b: ON ERROR GOTO L_1021b
        CASE &H10605: ON ERROR GOTO L_10605
        CASE &H10d3b: ON ERROR GOTO L_10d3b
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_195d2   ' entrada de SUB/FUNCTION (B$ENRA, locais 132 bytes) (0x195d2)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP14%
    DIM L_BP18!
    DIM L_BP1c!
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
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
    REDIM L_BP42!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_1000_95d2 @0x195d2  (0195d2_FUN_1000_95d2.lift.txt; evidence_id (assembly): ev_ebd264eb04b6ec6f94872906fb0a0b9d437f722a806961c0682b0b329576bfb5)
    REDIM L_BP42!(0 TO 1)   '@195e9
    REDIM A_139e!(-32768 TO -32768, -32768 TO -32768)   '@19606
    REDIM A_139e!(0 TO 1, 0 TO 7)   '@19614
    REDIM A_1342!(-32768 TO -32768)   '@19638
    REDIM A_1370!(-32768 TO -32768)   '@19646
    REDIM A_1342!(0 TO A_109e%(CINT(V_16d0!), 0))   '@1964f
    REDIM A_1370!(0 TO A_109e%(CINT(V_16d0!), 0))   '@19685
    L_BP46! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0)   '@196b6
    FOR V_0f10! = 1.0 TO L_BP46!   '@196e4 DS:17da
    A_1342!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f10!))), 0)   '@196ec
    A_1370!(RT_CINT%(FX##(V_0f10!))) = A_1070!(A_109e%(RT_CINT%(FX##(V_16d0!)), RT_CINT%(FX##(V_0f10!))), 1)   '@19746
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@197a1 DS:17da
    L_BP14% = 0   '@197cc
    L_BP30! = A_1210!(RT_CINT%(FX##(V_16d0!)), 0)   '@197d6
    V_16ac! = 0.0   '@197ff DS:1ad2
    V_16b0! = 0.0   '@19810 DS:1ad2
L_19826:
    IF NOT (L_BP30! = 270.0 OR L_BP30! = 90.0) THEN GOTO L_199d3   '@1982b DS:206a,206e
    L_BP24! = 0.0   '@19867 DS:1ad2
    L_BP20! = 0.0   '@19877 DS:1ad2
    L_BP1c! = A_1342!(1)   '@19887
    L_BP18! = A_1342!(1)   '@198a3
    L_BP4a! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0)   '@198bf
    FOR V_0f10! = 2.0 TO L_BP4a!   '@198ed DS:17da,1a62
    IF NOT (A_1342!(RT_CINT%(FX##(V_0f10!))) < L_BP1c!) THEN GOTO L_1994a   '@198f4
    L_BP1c! = A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19924
L_1994a:
    IF NOT (A_1342!(RT_CINT%(FX##(V_0f10!))) > L_BP18!) THEN GOTO L_199a0   '@1994a
    L_BP18! = A_1342!(RT_CINT%(FX##(V_0f10!)))   '@1997a
L_199a0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@199a0 DS:17da
    GOTO L_19c6c   '@199cb
L_199d3:
    L_BP24! = A_1370!(1) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(1)   '@199d3 DS:2062
    L_BP20! = A_1370!(1) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(1)   '@19a1b DS:2062
    L_BP1c! = 0.0   '@19a63 DS:1ad2
    L_BP18! = 0.0   '@19a73 DS:1ad2
    L_BP4e! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0)   '@19a83
    FOR V_0f10! = 2.0 TO L_BP4e!   '@19ab1 DS:17da,1a62
    IF NOT (A_1370!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(RT_CINT%(FX##(V_0f10!))) < FX##(L_BP24!)) THEN GOTO L_19b7a   '@19ab8 DS:2062
    L_BP24! = A_1370!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19b1e DS:2062
L_19b7a:
    IF NOT (A_1370!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(RT_CINT%(FX##(V_0f10!))) > FX##(L_BP20!)) THEN GOTO L_19c3c   '@19b7a DS:2062
    L_BP20! = A_1370!(RT_CINT%(FX##(V_0f10!))) - RT_TAN##(FX##(L_BP30!) * V_0e68_pi# / 180.0#) * A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19be0 DS:2062
L_19c3c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@19c3c DS:17da
L_19c6c:
    L_BP0e! = (FX##(L_BP18!) - L_BP1c!) / 10.0   '@19c6c DS:17de
    L_BP12! = (FX##(L_BP20!) - L_BP24!) / 10.0   '@19c84 DS:17de
    V_16a4! = FX##(L_BP1c!) + L_BP0e!   '@19c9c
    V_16a8! = FX##(L_BP24!) + L_BP12!   '@19cb0
    L_BP2c! = 1.0   '@19cc4 DS:17da
L_19cda:
    V_1734# = V_16a4!   '@19cda
    V_1744# = V_16a8!   '@19ceb
    V_15cc# = FX##(L_BP30!) * V_0e68_pi# / 180.0#   '@19cfc DS:2062
    L_BP28! = 0.0   '@19d16 DS:1ad2
    ERASE L_BP42!   '@19d26
    REDIM L_BP42!(0 TO 20)   '@19d34
    L_BP52! = A_109e%(RT_CINT%(FX##(V_16d0!)), 0) - 1   '@19d51
    FOR V_0f10! = 1.0 TO L_BP52!   '@19d80 DS:17da
    V_173c# = A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19d88
    V_174c# = A_1370!(RT_CINT%(FX##(V_0f10!)))   '@19daf
    IF NOT (A_1342!(RT_CINT%(FX##(V_0f10!))) = A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0))) THEN GOTO L_19e40   '@19dd6 DS:17da
    V_15d4# = FX##(V_0e68_pi#) / 2.0#   '@19e22 DS:1ee0
    GOTO L_19ed1   '@19e38
L_19e40:
    V_15d4# = ATN((FX##(A_1370!(RT_CINT%(FX##(V_0f10!)))) - A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0))) / (FX##(A_1342!(RT_CINT%(FX##(V_0f10!)))) - A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0))))   '@19e40 DS:17da
L_19ed1:
    CALL S_1abae   '@19ed1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP56! = A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19edb
    L_BP5a! = A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@19f02 DS:17da
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@19f27
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BP5a!   '@19f39 DS:17da
    A_1342!(RT_CINT%(FX##(V_0f10!))) = L_BP56!   '@19f5f
    L_BP62! = A_1342!(RT_CINT%(FX##(V_0f10!)))   '@19f80
    L_BP66! = A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@19fa1 DS:17da
    CALL MIXT_082a_Maior(L_BP62!, L_BP66!, L_BP6a!)   '@19fc6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BP66!   '@19fd8 DS:17da
    A_1342!(RT_CINT%(FX##(V_0f10!))) = L_BP62!   '@19ffe
    IF NOT (FX##(L_BP6a!) >= FX##(V_0ef4#) AND FX##(L_BP5e!) <= FX##(V_0ef4#)) THEN GOTO L_1a32b   '@1a01f
    L_BP6e! = A_1370!(RT_CINT%(FX##(V_0f10!)))   '@1a055
    L_BP72! = A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@1a07c DS:17da
    CALL MIXT_0877_Menor(L_BP6e!, L_BP72!, L_BP76!)   '@1a0a1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BP72!   '@1a0b3 DS:17da
    A_1370!(RT_CINT%(FX##(V_0f10!))) = L_BP6e!   '@1a0d9
    L_BP7a! = A_1370!(RT_CINT%(FX##(V_0f10!)))   '@1a0fa
    L_BP7e! = A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0))   '@1a11b DS:17da
    CALL MIXT_082a_Maior(L_BP7a!, L_BP7e!, L_BP82!)   '@1a140
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0)) = L_BP7e!   '@1a153 DS:17da
    A_1370!(RT_CINT%(FX##(V_0f10!))) = L_BP7a!   '@1a179
    IF NOT (FX##(L_BP82!) >= FX##(V_0efc#) AND FX##(L_BP76!) <= FX##(V_0efc#)) THEN GOTO L_1a326   '@1a19a
    IF NOT (FX##(A_1370!(RT_CINT%(FX##(V_0f10!) + 1.0))) = FX##(V_0efc#) AND FX##(A_1342!(RT_CINT%(FX##(V_0f10!) + 1.0))) = FX##(V_0ef4#) OR FX##(A_1370!(RT_CINT%(FX##(V_0f10!)))) = FX##(V_0efc#) AND FX##(A_1342!(RT_CINT%(FX##(V_0f10!)))) = FX##(V_0ef4#)) THEN GOTO L_1a2b5   '@1a1d1 DS:17da
    GOTO L_1a321   '@1a2ad
L_1a2b5:
    L_BP28! = FX##(L_BP28!) + 1.0   '@1a2b5 DS:17da
    L_BP42!(RT_CINT%(FX##(L_BP28!))) = RT_SQR##(RT_POT##((FX##(V_0ef4#) - V_1734#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1744#), (2.0#)))   '@1a2c9 DS:1ee0
L_1a321:
L_1a326:
L_1a32b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1a32b DS:17da
    L_BP86! = FX##(L_BP28!) - 1.0   '@1a356 DS:1bb8
    FOR V_0f10! = 1.0 TO L_BP86!   '@1a36c DS:17da
    L_BP8a! = L_BP28!   '@1a374
    FOR V_0f04! = FX##(V_0f10!) + 1.0 TO L_BP8a!   '@1a385 DS:17da
    IF NOT (L_BP42!(RT_CINT%(FX##(V_0f10!))) > L_BP42!(RT_CINT%(FX##(V_0f04!)))) THEN GOTO L_1a415   '@1a392
    SWAP L_BP42!(RT_CINT%(FX##(V_0f10!))), L_BP42!(RT_CINT%(FX##(V_0f04!)))   '@1a3d9
L_1a415:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@1a415 DS:17da
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1a441 DS:17da
    V_0f04! = 0.0   '@1a46d DS:1ad2
    L_BP8e! = L_BP28!   '@1a47e
    FOR V_0f10! = 1.0 TO L_BP8e! STEP 2.0   '@1a48f DS:17da,1a62
    IF NOT (FX##(L_BP42!(RT_CINT%(FX##(V_0f10!) + 1.0))) - L_BP42!(RT_CINT%(FX##(V_0f10!))) > FX##(V_0f04!)) THEN GOTO L_1a709   '@1a496 DS:17da
    V_0f04! = FX##(L_BP42!(RT_CINT%(FX##(V_0f10!) + 1.0))) - L_BP42!(RT_CINT%(FX##(V_0f10!)))   '@1a4e7 DS:17da
    A_139e!(0, 0) = ABS(RT_COS##(FX##(V_15cc#)) * L_BP42!(RT_CINT%(FX##(V_0f10!)))) + V_1734#   '@1a52e
    A_139e!(0, 1) = RT_SIN##(FX##(V_15cc#)) * L_BP42!(RT_CINT%(FX##(V_0f10!))) * ((3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(V_15cc#) AND FX##(V_0e68_pi#) / 2.0# < FX##(V_15cc#)) * 2 + 1) + V_1744#   '@1a57b DS:1ee0,1ee8
    A_139e!(0, 2) = ABS(RT_COS##(FX##(V_15cc#)) * L_BP42!(RT_CINT%(FX##(V_0f10!) + 1.0))) + V_1734#   '@1a614 DS:17da
    A_139e!(0, 3) = RT_SIN##(FX##(V_15cc#)) * L_BP42!(RT_CINT%(FX##(V_0f10!) + 1.0)) * ((3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(V_15cc#) AND FX##(V_0e68_pi#) / 2.0# < FX##(V_15cc#)) * 2 + 1) + V_1744#   '@1a666 DS:17da,1ee0,1ee8
L_1a709:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1a709 DS:1a62
    IF NOT (L_BP14% = 0) THEN GOTO L_1a847   '@1a735
    IF NOT (V_0f04! > V_16ac!) THEN GOTO L_1a83f   '@1a743
    V_16ac! = V_0f04!   '@1a75e
    A_139e!(1, 0) = A_139e!(0, 0)   '@1a76f
    A_139e!(1, 1) = A_139e!(0, 1)   '@1a7a1
    A_139e!(1, 2) = A_139e!(0, 2)   '@1a7d4
    A_139e!(1, 3) = A_139e!(0, 3)   '@1a804
L_1a83f:
    GOTO L_1a94f   '@1a83f
L_1a847:
    IF NOT (V_0f04! > V_16b0!) THEN GOTO L_1a94a   '@1a847
    V_16b0! = V_0f04!   '@1a862
    A_139e!(1, 4) = A_139e!(0, 0)   '@1a873
    A_139e!(1, 5) = A_139e!(0, 1)   '@1a8a6
    A_139e!(1, 6) = A_139e!(0, 2)   '@1a8dc
    A_139e!(1, 7) = A_139e!(0, 3)   '@1a90f
L_1a94a:
L_1a94f:
    V_16a8! = FX##(L_BP12!) + V_16a8!   '@1a94f
    V_16a4! = FX##(L_BP0e!) + V_16a4!   '@1a964
    L_BP2c! = FX##(L_BP2c!) + 1.0   '@1a979 DS:17da
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP2c! >= 10.0) THEN GOTO L_19cda   '@1a98d DS:17de
    IF NOT (L_BP14% = 0) THEN GOTO L_1aa0e   '@1a9a7
    L_BP14% = 1   '@1a9b5
    L_BP30! = FX##(L_BP30!) + 90.0   '@1a9bf DS:206a
    IF NOT (L_BP30! > 360.0) THEN GOTO L_1aa01   '@1a9d3 DS:2072
    L_BP30! = FX##(L_BP30!) - 360.0   '@1a9ed DS:2076
L_1aa01:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_19826   '@1aa01
L_1aa0e:
    ERASE L_BP42!   '@1aa0e
    ' END SUB   '@1aa1c
END SUB

SUB S_1aa2c   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1aa2c)
    ' ---- FUN_1000_aa2c @0x1aa2c  (01aa2c_FUN_1000_aa2c.lift.txt; evidence_id (assembly): ev_12f478f3f24c4e956ed7db75fd438dbd152fd36736fd8a3e01d6adf6418749d0)
    BEEP   '@1aa39
    BEEP   '@1aa43
    BEEP   '@1aa4d
    RT_SCREEN 0   '@1aa57
    RT_VIEWPRINT 1, 25   '@1aa6c
    RT_CLOSE   '@1aa7e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0_cortexto!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!)), RT_CINT%(4.0 * FX##(V_0dc8_corfundo!))   '@1aa8b DS:1cb8
    RT_CLS 0   '@1aad0
    LOCATE 10, 1   '@1aadd
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1aaf8 DS:1780,207a
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@1ab18 DS:1780,2094
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@1ab38 DS:1780,20c0
L_1ab5d:
    CALL MIXT_07f1_LimpaTeclado   '@1ab62
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@1ab6c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1ab88
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1ab5d   '@1ab92
    ' ---- F_1ab99 @0x1ab99  (01ab99_F_1ab99.lift.txt; evidence_id (assembly): ev_df3f82e7d97f6723147f66db234e6d0a869155ed77beb2226d4b31b8eabcf672)
    ' END SUB   '@1ab99
END SUB

SUB S_1abae   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1abae)
    ' ---- FUN_1000_abae @0x1abae  (01abae_FUN_1000_abae.lift.txt; evidence_id (assembly): ev_5de5e85e68eb1bc204fcae8e7af77f4bb811c83b4941bbbd0f29df8e27f4feff)
    V_0f18$ = ""   '@1abb6 DS:1780
    IF NOT (ABS(FX##(V_15cc#) - V_15d4# + V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_0e68_pi#) - V_15d4# + V_15cc#) < FX##(V_133e!) OR (ABS(FX##(V_15cc#) - V_15d4# - V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_15cc#) - V_0e68_pi# - V_15d4#) < FX##(V_133e!) OR ABS(FX##(V_15cc#) - V_15d4#) < FX##(V_133e!))))) THEN GOTO L_1acd4   '@1abc8
    V_0ef4# = 10000000000.0#   '@1ac93 DS:20e6
    V_0efc# = 10000000000.0#   '@1aca4 DS:20e6
    V_0f18$ = "NAO"   '@1acb5 DS:1c9a
    GOTO L_1b191   '@1acc7
L_1acd4:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_15cc#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_15cc#)) THEN GOTO L_1adc2   '@1acd4 DS:1ee0,1ee8
    V_0ef4# = V_1734#   '@1ad21
    V_0efc# = RT_TAN##(FX##(V_15d4#)) * V_0ef4# + (V_174c# - RT_SIN##(FX##(V_15d4#)) / RT_COS##(FX##(V_15d4#)) * V_173c#)   '@1ad32
    IF NOT (ABS(RT_SIN##(FX##(V_15d4#))) < FX##(V_133e!) / 100.0) THEN GOTO L_1adb5   '@1ad7a DS:1bc0
    V_0efc# = V_174c#   '@1ada4
L_1adb5:
    GOTO L_1b191   '@1adb5
L_1adc2:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_15d4#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_15d4#)) THEN GOTO L_1aeb0   '@1adc2 DS:1ee0,1ee8
    V_0ef4# = V_173c#   '@1ae0f
    V_0efc# = RT_TAN##(FX##(V_15cc#)) * V_0ef4# + (V_1744# - RT_SIN##(FX##(V_15cc#)) / RT_COS##(FX##(V_15cc#)) * V_1734#)   '@1ae20
    IF NOT (ABS(RT_SIN##(FX##(V_15cc#))) < FX##(V_133e!) / 100.0) THEN GOTO L_1aea3   '@1ae68 DS:1bc0
    V_0efc# = V_1744#   '@1ae92
L_1aea3:
    GOTO L_1b191   '@1aea3
L_1aeb0:
    IF NOT (V_15cc# = V_0e68_pi# OR V_15cc# = 0.0#) THEN GOTO L_1af92   '@1aeb0 DS:20ee
    V_0efc# = V_1744#   '@1aeee
    V_0ef4# = (V_0efc# - (V_174c# - RT_SIN##(FX##(V_15d4#)) / RT_COS##(FX##(V_15d4#)) * V_173c#)) / RT_TAN##(FX##(V_15d4#))   '@1aeff
    IF NOT (ABS(RT_COS##(FX##(V_15d4#))) < FX##(V_133e!) / 100.0) THEN GOTO L_1af85   '@1af4a DS:1bc0
    V_0ef4# = V_173c#   '@1af74
L_1af85:
    GOTO L_1b191   '@1af85
L_1af92:
    IF NOT (V_15d4# = V_0e68_pi# OR V_15d4# = 0.0#) THEN GOTO L_1b074   '@1af92 DS:20ee
    V_0efc# = V_174c#   '@1afd0
    V_0ef4# = (V_0efc# - (V_1744# - RT_SIN##(FX##(V_15cc#)) / RT_COS##(FX##(V_15cc#)) * V_1734#)) / RT_TAN##(FX##(V_15cc#))   '@1afe1
    IF NOT (ABS(RT_COS##(FX##(V_15cc#))) < FX##(V_133e!) / 100.0) THEN GOTO L_1b067   '@1b02c DS:1bc0
    V_0ef4# = V_1734#   '@1b056
L_1b067:
    GOTO L_1b191   '@1b067
L_1b074:
    V_0efc# = (RT_TAN##(FX##(V_15d4#)) * (V_1744# - RT_SIN##(FX##(V_15cc#)) / RT_COS##(FX##(V_15cc#)) * V_1734#) - RT_TAN##(FX##(V_15cc#)) * (V_174c# - RT_SIN##(FX##(V_15d4#)) / RT_COS##(FX##(V_15d4#)) * V_173c#)) / (RT_TAN##(FX##(V_15d4#)) - RT_TAN##(FX##(V_15cc#)))   '@1b074
    V_0ef4# = (V_174c# - RT_SIN##(FX##(V_15d4#)) / RT_COS##(FX##(V_15d4#)) * V_173c# - (V_1744# - RT_SIN##(FX##(V_15cc#)) / RT_COS##(FX##(V_15cc#)) * V_1734#)) / (RT_TAN##(FX##(V_15cc#)) - RT_TAN##(FX##(V_15d4#)))   '@1b10f
L_1b191:
    ' END SUB   '@1b196
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_LAJE.BM'
'$INCLUDE: '../comum/MIXT.BM'
