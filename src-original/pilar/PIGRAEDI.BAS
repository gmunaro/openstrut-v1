' ============================================================================
'  PIGRAEDI - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/PIGRAEDI/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 0c3831fca4ad8b01589923194532c5b0433159285bd04e9c33e793c664bbc75b
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_PILAREDI.BI'

' ---- variaveis do PIGRAEDI fora do COMMON (DS do programa)
DIM SHARED V_1484%
DIM SHARED V_1486!
DIM SHARED V_148a$
DIM SHARED V_148e$
DIM SHARED V_1492$
DIM SHARED V_1496!
DIM SHARED V_149a!
DIM SHARED V_149e!
DIM SHARED V_14a2!
DIM SHARED V_14a6!
DIM SHARED V_14aa!
DIM SHARED V_14ae!
DIM SHARED V_14b2!
DIM SHARED V_14b6!
DIM SHARED V_14ba!
DIM SHARED V_14be!
DIM SHARED V_14c2!
DIM SHARED V_14c6%
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
DIM SHARED V_14f4!
DIM SHARED V_14f8!
DIM SHARED V_14fc!
DIM SHARED V_1500$
DIM SHARED V_1504!
DIM SHARED V_1508!
DIM SHARED V_150c!
DIM SHARED V_1510!
DIM SHARED V_1514!
DIM SHARED V_1518!
DIM SHARED V_151c!
DIM SHARED V_1520!
DIM SHARED V_1524!
DIM SHARED V_1528%

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "PIGRAEDI"
' ---- M_PIGRAEDI @0x10030  (010030_M_PIGRAEDI.lift.txt; evidence_id (assembly): ev_bc0adff90df6c78ca4ecd4799f9e355ff7216abc785ec7004267ad7dadb955ad)
' @10030 inicio do programa (B$?EVT)
GOTO L_10189   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10189:
GOSUB L_101f2   '@10189
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@10196
GOTO L_105ee   '@101a5
' ---- F_101ad @0x101ad  (0101ad_F_101ad.lift.txt; evidence_id (assembly): ev_5e2b3a751e869275fb8fb3a3030be2f8255f923b054f2ca807347c408cdd77a7)
L_101b2:   ' entrada vinda de 010030_M_PIGRAEDI, 0105ee_FUN_1000_05ee, 011b7d_F_11b7d, 013f92_F_13f92
RESUME L_101c9   '@101b7
L_101c9:
GOSUB L_101f2   '@101ce
CALL S_16807   '@101db
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
GOTO L_105ee   '@101e5
' ---- F_101ed @0x101ed  (0101ed_F_101ed.lift.txt; evidence_id (assembly): ev_dac1359e29c0defa1e386888c11e9d5cd46f3dcded096b03f1ff5b7015d50822)
L_101f2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_PIGRAEDI, 0101ad_F_101ad
FOR V_1486! = 1.0 TO 10.0   '@101f7 DS:168a,168e
ON KEY(RT_CINT%(FX##(V_1486!))) GOSUB L_10497
RT_ONKEY RT_CINT%(FX##(V_1486!)), 1   '@10204
KEY(RT_CINT%(FX##(V_1486!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1486!)), 1   '@1021e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1486!   '@10233 DS:168a,168e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1025c
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@10284
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@102ac
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@102d4
FOR V_1486! = 15.0 TO 18.0   '@102fc DS:168a,1692,1696
ON KEY(RT_CINT%(FX##(V_1486!))) GOSUB L_104c2
RT_ONKEY RT_CINT%(FX##(V_1486!)), 2   '@1030a
KEY(RT_CINT%(FX##(V_1486!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1486!)), 1   '@10324
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1486!   '@10339 DS:168a,1696
ON KEY(2) GOSUB L_104c2
RT_ONKEY 2, 2   '@10362
KEY(2) ON
RT_KEYESTADO 2, 1   '@10375
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@10383
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@103ab
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@103d3
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@103fb
FOR V_1486! = 19.0 TO 22.0   '@10422 DS:168a,169a,169e
ON KEY(RT_CINT%(FX##(V_1486!))) GOSUB L_105c0
RT_ONKEY RT_CINT%(FX##(V_1486!)), 3   '@10430
KEY(RT_CINT%(FX##(V_1486!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1486!)), 1   '@1044a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1486!   '@1045f DS:168a,169e
RETURN   '@10488
L_10497:
BEEP   '@1049c
GOSUB L_101f2   '@104a6
RETURN   '@104b3
L_104c2:
RT_SCREEN 0   '@104c7
RT_VIEWPRINT 1, 25   '@104dc
COLOR 7, 0, 0   '@104ee
RT_CLS 0   '@10512
PRINT " Aguarde ..."   '@1051f DS:16a2
PRINT ""   '@1052d DS:1630
PRINT " Retorno ao Modulo Basico de PILAREDI"   '@1053b DS:16b2
ON ERROR GOTO L_10587
RT_ONERR = &H10587   '@10549
V_107e$ = "VOLTA PILGEEDI"   '@10558 DS:16dc
RT_CHAIN V_0e00$ + "PILAREDI"   '@1056a DS:16ee
L_10587:
PRINT " Modulo nao encontrado em "; V_0e00$   '@1058c DS:16fa
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@105a3 DS:164e
RT_FIM   '@105b1 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_105c0:
BEEP   '@105c5
GOSUB L_101f2   '@105cf
RETURN L_105ee   '@105e6
' ---- FUN_1000_05ee @0x105ee  (0105ee_FUN_1000_05ee.lift.txt; evidence_id (assembly): ev_8775e92f84e20a14eedec883cb3162374cd5c055073edb62a16276fb79fd20e0)
L_105ee:   ' entrada vinda de 010030_M_PIGRAEDI, 0101ad_F_101ad, 0101ed_F_101ed
L_105f8:   ' entrada vinda de 011b1a_F_11b1a, 011b7d_F_11b7d, 0138ea_F_138ea, 013f92_F_13f92
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@105fd
RT_VIEWPRINT 1, 25   '@1060c
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1061e
RT_CLS 2   '@1064a
PRINT RT_STRINGC$((80), (205))   '@10658
PRINT " Gravacao e Leitura de Dados de Colunas de um Edificio"   '@10670 DS:1718
PRINT RT_STRINGC$((80), (205))   '@1067e
RT_VIEWPRINT 6, 25   '@10696
V_1006! = RT_FRE&("")   '@106a8 DS:1630
V_1006! = INT(FX##(RT_FREN&(-1)) / 1024.0#)   '@106c2 DS:1752
COLOR 7   '@106e8
LOCATE 6, 20   '@106fe
PRINT "1  -  ";   '@1071c DS:175a
COLOR RT_CINT%(FX##(V_0dc4!))   '@1072a
PRINT "C";   '@10747 DS:1764
COLOR 7   '@10755
PRINT "riacao de Arquivo em disco"   '@1076b DS:176a
LOCATE 8, 20   '@10779
PRINT "2  -  ";   '@10797 DS:1788
COLOR RT_CINT%(FX##(V_0dc4!))   '@107a5
PRINT "G";   '@107c2 DS:1792
COLOR 7   '@107d0
PRINT "ravacao de Colunas"   '@107e6 DS:1798
LOCATE 10, 20   '@107f4
PRINT "3  -  ";   '@10812 DS:17ae
COLOR RT_CINT%(FX##(V_0dc4!))   '@10820
PRINT "N";   '@1083d DS:17b8
COLOR 7   '@1084b
PRINT "umero de Colunas Gravadas"   '@10861 DS:17be
LOCATE 12, 20   '@1086f
PRINT "4  -  Ca";   '@1088d DS:17dc
COLOR RT_CINT%(FX##(V_0dc4!))   '@1089b
PRINT "t";   '@108b8 DS:17e8
COLOR 7   '@108c6
PRINT "alogo de Colunas Gravadas"   '@108dc DS:17ee
LOCATE 14, 20   '@108ea
PRINT "5  -  ";   '@10908 DS:180c
COLOR RT_CINT%(FX##(V_0dc4!))   '@10916
PRINT "L";   '@10933 DS:1816
COLOR 7   '@10941
PRINT "eitura de Colunas"   '@10957 DS:181c
LOCATE 16, 20   '@10965
PRINT "6  -  Acesso ao ";   '@10983 DS:1832
COLOR RT_CINT%(FX##(V_0dc4!))   '@10991
PRINT "D";   '@109ae DS:1846
COLOR 7   '@109bc
PRINT "OS ";   '@109d2 DS:184c
COLOR 3   '@109e0
PRINT "("; V_1006!; "Kbytes livres )"   '@109f6 DS:1854,185a
COLOR 7   '@10a1a
LOCATE 18, 20   '@10a30
PRINT "7  -  ";   '@10a4e DS:186e
COLOR RT_CINT%(FX##(V_0dc4!))   '@10a5c
PRINT "A";   '@10a79 DS:1878
COLOR 7   '@10a87
PRINT "lterar Drive e Diretorio ";   '@10a9d DS:187e
COLOR 3   '@10aab
PRINT V_0df8$; ":"; V_0dfc$   '@10ac1 DS:189c
COLOR 7   '@10ae1
LOCATE 20, 20   '@10af7
PRINT "8  -  ";   '@10b15 DS:18a2
COLOR RT_CINT%(FX##(V_0dc4!))   '@10b23
PRINT "R";   '@10b40 DS:18ac
COLOR 7   '@10b4e
PRINT "etorno ao Menu Principal"   '@10b64 DS:18b2
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@10b72
LOCATE 22, 20   '@10b9e
PRINT "escolha opcao ";   '@10bbc DS:18ce
CALL MIXT_07f1_LimpaTeclado   '@10bca
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@10bd4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
COLOR 7   '@10bf0
V_148a$ = ".COL"   '@10c06 DS:18e0
V_148e$ = V_106e$   '@10c18
IF NOT (V_148e$ <> "1") THEN GOTO L_10c65   '@10c2a DS:18e8
IF NOT (V_148e$ <> "C") THEN GOTO L_10c65   '@10c41 DS:1764
IF NOT (V_148e$ = "c") THEN GOTO L_10c75   '@10c53 DS:18ee
L_10c65:
GOTO L_110b0   '@10c65
L_10c75:
IF NOT (V_148e$ <> "2") THEN GOTO L_10cab   '@10c75 DS:18f4
IF NOT (V_148e$ <> "G") THEN GOTO L_10cab   '@10c87 DS:1792
IF NOT (V_148e$ = "g") THEN GOTO L_10cbb   '@10c99 DS:18fa
L_10cab:
GOTO L_11591   '@10cab
L_10cbb:
IF NOT (V_148e$ <> "3") THEN GOTO L_10cf1   '@10cbb DS:1900
IF NOT (V_148e$ <> "N") THEN GOTO L_10cf1   '@10ccd DS:17b8
IF NOT (V_148e$ = "n") THEN GOTO L_10d0c   '@10cdf DS:1906
L_10cf1:
V_1484% = 0   '@10cf1
GOTO L_12e53   '@10cfc
L_10d0c:
IF NOT (V_148e$ <> "4") THEN GOTO L_10d42   '@10d0c DS:190c
IF NOT (V_148e$ <> "T") THEN GOTO L_10d42   '@10d1e DS:1912
IF NOT (V_148e$ = "t") THEN GOTO L_10d5d   '@10d30 DS:17e8
L_10d42:
V_1484% = 1   '@10d42
GOTO L_12e53   '@10d4d
L_10d5d:
IF NOT (V_148e$ <> "5") THEN GOTO L_10d93   '@10d5d DS:1918
IF NOT (V_148e$ <> "L") THEN GOTO L_10d93   '@10d6f DS:1816
IF NOT (V_148e$ = "l") THEN GOTO L_10da3   '@10d81 DS:191e
L_10d93:
GOTO L_13b57   '@10d93
L_10da3:
IF NOT (V_148e$ <> "6") THEN GOTO L_10dd9   '@10da3 DS:1924
IF NOT (V_148e$ <> "D") THEN GOTO L_10dd9   '@10db5 DS:1846
IF NOT (V_148e$ = "d") THEN GOTO L_10eba   '@10dc7 DS:192a
L_10dd9:
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@10dd9 DS:1930
RT_VIEWPRINT 1, 25   '@10e1e
RT_CLS 2   '@10e30
PRINT " para retornar acione EXIT <Enter>"   '@10e3e DS:1934
PRINT ""   '@10e4c DS:1630
RT_SHELL ""   '@10e5a DS:1630
COLOR 7, RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@10e68
RT_CLS 2   '@10e9c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@10eaa
L_10eba:
IF NOT (V_148e$ <> "7") THEN GOTO L_10ef0   '@10eba DS:195a
IF NOT (V_148e$ <> "A") THEN GOTO L_10ef0   '@10ecc DS:1878
IF NOT (V_148e$ = "a") THEN GOTO L_10f0d   '@10ede DS:1960
L_10ef0:
GOSUB L_1604a   '@10ef0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@10efd
L_10f0d:
IF NOT (V_148e$ <> "8") THEN GOTO L_10f43   '@10f0d DS:1966
IF NOT (V_148e$ <> "R") THEN GOTO L_10f43   '@10f1f DS:18ac
IF NOT (V_148e$ = "r") THEN GOTO L_10f4b   '@10f31 DS:196c
L_10f43:
GOTO L_10f58   '@10f43
L_10f4b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105ee   '@10f4b
L_10f58:
L_10f5d:
V_107e$ = "VOLTA PIGRAEDI"   '@10f62 DS:1972
ON ERROR GOTO L_10fed
RT_ONERR = &H10fed   '@10f74
V_1006! = RT_FRE&("")   '@10f83 DS:1630
L_BP0c% = (LEN(V_0e00$) > 3)   '@10f9d
CHDIR RT_ARQ$(RT_LEFT$((V_0e00$), (LEN(V_0e00$) + L_BP0c%)))   '@10fbc
RT_CHAIN V_0e00$ + "PILAREDI"   '@10fd0 DS:16ee
L_10fed:
RESUME L_11004   '@10ff2
L_11004:
L_BP0c% = (V_0e00$ = "A:\")   '@11009 DS:1984
IF NOT ((V_0e00$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_110a3   '@1102e DS:198c
LOCATE 23, 10   '@11043
PRINT " Coloque o Disco PILAREDI no Drive "; V_0e00$   '@11061 DS:1994
CALL MIXT_07f1_LimpaTeclado   '@11078
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@11082
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
L_110a3:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_10f5d   '@110a3
L_110b0:
RT_VIEWPRINT 5, 25   '@110b5
RT_CLS 2   '@110c7
COLOR RT_CINT%(4.0 * FX##(V_0dc8!)), 7   '@110d5 DS:1930
PRINT RT_TAB$(2); ""; "  ATENCAO !  "   '@110ff DS:1630,19bc
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@1111f
PRINT " A criacao do arquivo, deve ser feita somente quando este ainda nao existe."   '@1114b DS:19ce
PRINT " Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido."   '@11159 DS:1a1e
PRINT ""   '@11167 DS:1630
COLOR 7   '@11175
PRINT " O Arquivo que sera criado para gravacao das Colunas arquivadas em Memoria,"   '@1118b DS:1a66
PRINT " tera o nome da Obra arquivada com extensao .COL "   '@11199 DS:1ab6
PRINT ""   '@111a7 DS:1630
COLOR 14   '@111b5
IF NOT (V_11a6% > 0) THEN GOTO L_1120b   '@111cb
PRINT " Arquivadas em Memoria"; V_11a6%; "Colunas da Obra "; V_11be$   '@111da DS:1aec,1b06
GOTO L_1121e   '@11203
L_1120b:
PRINT " Nao ha Colunas Arquivadas na Memoria"   '@1120b DS:1b1a
L_1121e:
L_11223:
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@11228
V_101a! = 16.0   '@11237 DS:1b44
GOSUB L_16501   '@11248
RT_VIEWPRINT 5, 25   '@11255
LOCATE 14, 1   '@11267
COLOR 7   '@11282
PRINT " Nome do arquivo *";   '@11298 DS:1b48
COLOR RT_CINT%(FX##(V_0dc0!))   '@112a6
PRINT "NAO CRIAR";   '@112c3 DS:1b5e
COLOR 7   '@112d1
PRINT "* ";   '@112e7 DS:1b6c
CALL MIXT_07f1_LimpaTeclado   '@112f5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1492$   '@112ff DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_1492$) = 0) THEN GOTO L_11336   '@11319
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@1132e
L_11336:
L_BP0c% = (VAL(V_1492$) <> 0.0#)   '@11336 DS:1b72
IF NOT ((LEN(V_1492$) > 8 OR L_BP0c%) <> 0) THEN GOTO L_1138e   '@11364
BEEP   '@1137c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11223   '@11386
L_1138e:
L_BP0c% = (RT_INSTR%((1), (V_1492$), (" ")) > 0)   '@1138e DS:1b7a
L_BP0e% = RT_INSTR%((1), (V_1492$), (".")) > 0 OR L_BP0c%   '@113bb DS:1b80
L_BP10% = RT_INSTR%((1), (V_1492$), ("\")) > 0 OR L_BP0e%   '@113da DS:1b86
IF NOT ((RT_INSTR%((1), (V_1492$), ("/")) > 0 OR L_BP10%) <> 0) THEN GOTO L_11422   '@113f9 DS:1b8c
BEEP   '@11410
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11223   '@1141a
L_11422:
IF NOT (UCASE$(V_1492$) = "D") THEN GOTO L_11454   '@11422 DS:1846
GOSUB L_1604a   '@1143f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11223   '@1144c
L_11454:
ON ERROR GOTO L_166ae
RT_ONERR = &H166ae   '@11454
V_1016! = 16.0   '@11463 DS:1b44
IF RT_DISP%(V_0df8$ + ":" + V_0dfc$ + V_1492$ + ".COL") THEN OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_1492$ + ".COL") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_1492$ + ".COL") FOR OUTPUT AS #1   '@11474 DS:189c,18e0,1b92
IF NOT (V_106e$ = "ERRCOL") THEN GOTO L_114d5   '@114b6 DS:1b98
GOTO L_1155e   '@114cd
L_114d5:
PRINT #1, "SISTRUT Software e Tecnologia s/c ltda"   '@114d5 DS:1ba2
PRINT #1, "Obra - "; V_11be$   '@114ec DS:1bcc
PRINT #1, "Arquivo con dados de PILARES inicializado em "; RT_DATE$; " "; RT_TIME$   '@1150c DS:1b7a,1bd8
PRINT #1, "FIM"   '@11542 DS:1c0a
L_1155e:
CLOSE #1   '@11563
V_11be$ = V_1492$   '@11572
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@11584
L_11591:
IF NOT (V_11a6% = 0) THEN GOTO L_115ad   '@11596
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@115a5
L_115ad:
RT_VIEWPRINT 1, 25   '@115ad
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@115bf
RT_CLS 2   '@115eb
PRINT RT_STRINGC$((80), (205))   '@115f9
PRINT " Gravacao de Colunas"   '@11611 DS:1c12
PRINT " Arquivadas em Memoria"; V_11a6%; "Colunas referentes a Obra "; V_11be$   '@1161f DS:1aec,1c2a
PRINT RT_STRINGC$((80), (205))   '@11648
L_11665:
V_101a! = 10.0   '@1166a DS:168e
GOSUB L_16501   '@1167b
RT_VIEWPRINT 5, 9   '@11688
RT_CLS 2   '@1169a
LOCATE 6, 1   '@116a8
COLOR 7   '@116c3
PRINT " Nome da Obra *";   '@116d9 DS:1c48
COLOR RT_CINT%(FX##(V_0dc0!))   '@116e7
PRINT V_11be$;   '@11704
COLOR 7   '@11712
CALL MIXT_07f1_LimpaTeclado   '@11728
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "* ", V_1492$   '@11732 DS:1b6c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_1492$) = 0) THEN GOTO L_11773   '@1174c
V_1492$ = V_11be$   '@11761
L_11773:
L_BP0c% = (VAL(V_1492$) <> 0.0#)   '@11773 DS:1b72
IF NOT ((LEN(V_1492$) > 8 OR L_BP0c%) <> 0) THEN GOTO L_117cb   '@117a1
BEEP   '@117b9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11665   '@117c3
L_117cb:
L_BP0c% = (RT_INSTR%((1), (V_1492$), (" ")) > 0)   '@117cb DS:1b7a
L_BP0e% = RT_INSTR%((1), (V_1492$), (".")) > 0 OR L_BP0c%   '@117f8 DS:1b80
L_BP10% = RT_INSTR%((1), (V_1492$), ("\")) > 0 OR L_BP0e%   '@11817 DS:1b86
IF NOT ((RT_INSTR%((1), (V_1492$), ("/")) > 0 OR L_BP10%) <> 0) THEN GOTO L_1185f   '@11836 DS:1b8c
BEEP   '@1184d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11665   '@11857
L_1185f:
IF NOT (UCASE$(V_1492$) = "D") THEN GOTO L_11891   '@1185f DS:1846
GOSUB L_1604a   '@1187c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_11665   '@11889
L_11891:
LOCATE 6, 40   '@11891
COLOR 7   '@118af
CALL MIXT_07f1_LimpaTeclado   '@118c5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Continuo N/*S* ", V_106e$   '@118cf DS:1c5c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_1190e   '@118e9 DS:17b8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@11906
L_1190e:
V_11be$ = V_1492$   '@1190e
LOCATE 7, 1   '@11920
PRINT " Aguarde .."   '@1193b DS:1c70
ON ERROR GOTO L_119ec
RT_ONERR = &H119ec   '@11949
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".BAK") FOR INPUT AS #1   '@11958 DS:189c,1c80,1c86
CLOSE #1   '@1199a
KILL RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".BAK")   '@119a9 DS:189c,1c86
GOTO L_11a10   '@119df
' ---- F_119e7 @0x119e7  (0119e7_F_119e7.lift.txt; evidence_id (assembly): ev_d25bb9ffd11d90080ce6ce027db6fd2051adb2b2fbedd258c9d531a11195585b)
L_119ec:   ' entrada vinda de 0105ee_FUN_1000_05ee
RT_CLOSE   '@119f1 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RESUME L_11a10   '@119fe
L_11a10:   ' entrada vinda de 0105ee_FUN_1000_05ee
ON ERROR GOTO L_11b1f
RT_ONERR = &H11b1f   '@11a15
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") FOR INPUT AS #1   '@11a24 DS:189c,18e0,1c80
CLOSE #1   '@11a66
NAME RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") AS RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".BAK")   '@11a75 DS:189c,18e0,1c86
LOCATE 7, 1   '@11ad7
PRINT " Dados anteriores copiados para "; V_11be$; ".BAK     Aguarde ..."   '@11af2 DS:1c8e,1cb2
GOTO L_11b43   '@11b12
' ---- F_11b1a @0x11b1a  (011b1a_F_11b1a.lift.txt; evidence_id (assembly): ev_8d9e115162e631388ead2016dbd3661937b8b7c47fb9b30afa6ca6b98c4f7b37)
L_11b1f:   ' entrada vinda de 0119e7_F_119e7
RT_CLOSE   '@11b24 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RESUME L_11b43   '@11b31
L_11b43:   ' entrada vinda de 0119e7_F_119e7
ON ERROR GOTO L_166ae
RT_ONERR = &H166ae   '@11b48
V_1016! = 7.0   '@11b57 DS:1cca
GOSUB L_11b82   '@11b68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@11b75
' ---- F_11b7d @0x11b7d  (011b7d_F_11b7d.lift.txt; evidence_id (assembly): ev_1989244159ff4a930ed150115612d447ef62ffc0560ba72c90842c7b8da2c3ac)
L_11b82:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011b1a_F_11b1a
IF RT_DISP%(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") THEN OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") FOR OUTPUT AS #1   '@11b87 DS:189c,18e0,1b92
IF NOT (V_106e$ = "ERRCOL") THEN GOTO L_11bea   '@11bc9 DS:1b98
RETURN   '@11be0
L_11bea:
PRINT #1, "SISTRUT Software e Tecnologia s/c Ltda"   '@11bea DS:1cce
PRINT #1, "Obra - "; V_11be$   '@11c01 DS:1bcc
PRINT #1, "Arquivo com dados de PILARES inicializado em "; RT_DATE$; " "; RT_TIME$   '@11c21 DS:1b7a,1cf8
PRINT #1, A_11c8!(0); "=NUMERO DE NIVEIS"   '@11c57 DS:1d2a
PRINT #1, V_11a6%; "=NUMERO DE COLUNAS"   '@11c89 DS:1d40
V_1496! = A_11c8!(0)   '@11ca9
FOR V_101e! = 0.0 TO V_1496!   '@11cc9 DS:168a,1d56
PRINT #1, A_11c8!(RT_CINT%(FX##(V_101e!))); ","; A_11f6$(RT_CINT%(FX##(V_101e!)))   '@11cd0 DS:1d5a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@11d27 DS:168a
V_149a! = V_11a6%   '@11d50
FOR V_101e! = 1.0 TO V_149a!   '@11d65 DS:168a
PRINT #1, A_1252$(RT_CINT%(FX##(V_101e!))); ","; "N ("; A_1224%(RT_CINT%(FX##(V_101e!)), 0); ") "; A_11f6$(A_1224%(RT_CINT%(FX##(V_101e!)), 0)); ","; "N ("; A_1224%(RT_CINT%(FX##(V_101e!)), 1); ") "; A_11f6$(A_1224%(RT_CINT%(FX##(V_101e!)), 1))   '@11d6c DS:1d5a,1d60,1d68
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@11e71 DS:168a
V_149e! = V_11a6%   '@11e9d
FOR V_101e! = 1.0 TO V_149e!   '@11eb2 DS:168a
PRINT #1, A_1224%(RT_CINT%(FX##(V_101e!)), 2); ","; A_1224%(RT_CINT%(FX##(V_101e!)), 3); ","; A_1224%(RT_CINT%(FX##(V_101e!)), 4); ","; A_1224%(RT_CINT%(FX##(V_101e!)), 5); ","; A_1224%(RT_CINT%(FX##(V_101e!)), 6); ","; A_1224%(RT_CINT%(FX##(V_101e!)), 7)   '@11eba DS:1d5a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@11fc4 DS:168a
V_14a2! = 3.0   '@11ff0 DS:1d6e
IF NOT (V_11c4% = 1) THEN GOTO L_1210e   '@12001
V_14a6! = V_11a6%   '@12010
FOR V_101e! = 1.0 TO V_14a6!   '@12025 DS:168a
V_14aa! = V_0e3c%   '@1202c
FOR V_100e! = 0.0 TO V_14aa!   '@12041 DS:168a,1d56
IF NOT (A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = 0) THEN GOTO L_12085   '@12048
GOTO L_120dd   '@1207d
L_12085:
IF NOT (V_100e! > V_14a2!) THEN GOTO L_120b1   '@12085
V_14a2! = V_100e!   '@120a0
L_120b1:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@120b1 DS:168a
L_120dd:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@120dd DS:168a
L_1210e:
PRINT #1, V_11aa%; "[1]"; V_0e3e%; "[2]"; RT_SNG!(FX##(V_14a2!) + 1.0); "[3]"; V_0e2c!; "[4]"; -(V_11ac% = 1) * V_11c2%; "[5]"; -(V_11c4% = 1) * V_0e40%; "[6]"; V_0e66!; "[7]"; V_0e6a!; "[8]"; V_0e7e$; "[9]"; V_0de0$; "[10]"; V_0e8e!; "[11]{"; V_0e14$; "}"; "[12]"; V_0dec!   '@1210e DS:168a,1d72,1d7a,1d82,1d8a,1d92,1d9a,1da2,1daa,1db2,1dba,1dc2,1dcc,1dd2
IF NOT (V_11aa% = 1) THEN GOTO L_12358   '@12246
V_14ae! = V_11a6%   '@12255
FOR V_101e! = 1.0 TO V_14ae!   '@1226a DS:168a
V_14b2! = A_1224%(RT_CINT%(FX##(V_101e!)), 1)   '@12272
FOR V_14a2! = A_1224%(RT_CINT%(FX##(V_101e!)), 0) TO V_14b2!   '@122a2 DS:168a
PRINT #1, A_130a%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)))   '@122c6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@122fe DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@12327 DS:168a
L_12358:
PRINT #1, V_11a8%   '@12358
IF NOT (V_11a8% = 1) THEN GOTO L_127a5   '@1236f
V_14b6! = V_11a6%   '@1237e
FOR V_101e! = 1.0 TO V_14b6!   '@12393 DS:168a
V_14ba! = A_1224%(RT_CINT%(FX##(V_101e!)), 1)   '@1239a
FOR V_14a2! = A_1224%(RT_CINT%(FX##(V_101e!)), 0) TO V_14ba!   '@123ca DS:168a
FOR V_100e! = 0.0 TO 16.0   '@123ee DS:168a,1b44,1d56
PRINT #1, A_1280!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), RT_CINT%(FX##(V_100e!)))   '@123fc
IF NOT (A_1280!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), RT_CINT%(FX##(V_100e!))) = 0.0 AND (V_100e! = 13.0 OR (V_100e! = 9.0 OR (V_100e! = 5.0 OR V_100e! = 1.0)))) THEN GOTO L_12508   '@12443 DS:168a,1d56,1dda,1dde,1de2
GOTO L_12534   '@12500
L_12508:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@12508 DS:168a,1b44
L_12534:
PRINT #1, A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 0); ","; A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 1); ","; A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 2); ","; A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 3)   '@12534 DS:1d5a
PRINT #1, A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 0); ","; A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 1); ","; A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 2); ","; A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 3); ","; A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 4)   '@12609 DS:1d5a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@12731 DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@1275d DS:168a
PRINT #1, V_11b4%   '@12789
L_127a5:
PRINT #1, V_11ac%   '@127a5
PRINT #1, V_11c2%   '@127bc
IF NOT (V_11ac% = 1) THEN GOTO L_12aab   '@127d3
V_14be! = V_11a6%   '@127e2
FOR V_101e! = 1.0 TO V_14be!   '@127f7 DS:168a
V_14c2! = V_0e3e%   '@127fe
FOR V_100e! = 0.0 TO V_14c2!   '@12813 DS:168a,1d56
PRINT #1, A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0)   '@1281a
IF NOT (A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = 0) THEN GOTO L_12892   '@12855
GOTO L_12a7a   '@1288a
L_12892:
FOR V_1012! = 1.0 TO 6.0   '@12892 DS:168a,1de6
PRINT #1, A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_1012!)))   '@128a0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1012!   '@128e3 DS:168a,1de6
IF NOT (A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 6) = 3) THEN GOTO L_12a4e   '@1290c
V_14c6% = A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 1)   '@12941
V_14c8! = A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 2)   '@12972
FOR V_14a2! = 0.0 TO V_14c8!   '@129ad DS:168a,1d56
PRINT #1, A_1366%(V_14c6%, RT_CINT%(FX##(V_14a2!)), 0)   '@129b4
PRINT #1, A_1366%(V_14c6%, RT_CINT%(FX##(V_14a2!)), 1)   '@129e8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@12a1d DS:168a
L_12a4e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@12a4e DS:168a
L_12a7a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@12a7a DS:168a
L_12aab:
PRINT #1, V_11c4%   '@12aab
IF NOT (V_11c4% = 1) THEN GOTO L_12e1e   '@12ac2
V_14cc! = V_11a6%   '@12ad1
FOR V_101e! = 1.0 TO V_14cc!   '@12ae6 DS:168a
V_14d0! = V_0e3c%   '@12aee
FOR V_100e! = 0.0 TO V_14d0!   '@12b03 DS:168a,1d56
IF NOT (A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = 0) THEN GOTO L_12b47   '@12b0a
GOTO L_12dd7   '@12b3f
L_12b47:
PRINT #1, A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0)   '@12b47
FOR V_1012! = 1.0 TO 6.0   '@12b82 DS:168a,1de6
PRINT #1, A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_1012!)))   '@12b90
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1012!   '@12bd3 DS:168a,1de6
V_14d4! = A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 3) + A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 1)   '@12bfc
FOR V_14a2! = 0.0 TO V_14d4!   '@12c5f DS:168a,1d56
PRINT #1, A_13f0%(RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 7)) + V_14a2!), 0)   '@12c66
PRINT #1, A_13f0%(RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 7)) + V_14a2!), 1)   '@12cc4
PRINT #1, A_13f0%(RT_CINT%(FX##(A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 7)) + V_14a2!), 2)   '@12d23
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@12d7f DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@12dab DS:168a
L_12dd7:
PRINT #1, 0   '@12dd7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@12ded DS:168a
L_12e1e:
PRINT #1, "FIM"   '@12e1e DS:1c0a
CLOSE #1   '@12e35
RETURN   '@12e44
L_12e53:   ' entrada vinda de 0105ee_FUN_1000_05ee
RT_VIEWPRINT 1, 25   '@12e58
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@12e6a
RT_CLS 2   '@12e96
PRINT RT_STRINGC$((80), (205))   '@12ea4
IF NOT (V_1484% = 0) THEN GOTO L_12ee1   '@12ebc
PRINT " Pesquisa do Numero de Colunas Gravadas"   '@12ecb DS:1dea
GOTO L_12ef4   '@12ed9
L_12ee1:
PRINT " Catalogo de Colunas Gravadas em Disco"   '@12ee1 DS:1e16
L_12ef4:
IF NOT (V_11a6% > 0) THEN GOTO L_12f34   '@12ef4
PRINT " Arquivadas em Memoria"; V_11a6%; "Colunas da Obra "; V_11be$   '@12f03 DS:1aec,1b06
GOTO L_12f47   '@12f2c
L_12f34:
PRINT " Nao ha Colunas Arquivadas na Memoria"   '@12f34 DS:1b1a
L_12f47:
PRINT RT_STRINGC$((80), (205))   '@12f47
L_12f64:
V_101a! = 9.0   '@12f69 DS:1dde
GOSUB L_16501   '@12f7a
L_12f8c:
RT_VIEWPRINT 5, 8   '@12f91
RT_CLS 2   '@12fa3
LOCATE 6, 1   '@12fb1
COLOR 7   '@12fcc
IF NOT (V_1484% = 0) THEN GOTO L_13007   '@12fe2
PRINT " Nome do Arquivo a Pesquisar *FIM* ";   '@12ff1 DS:1e40
GOTO L_1301a   '@12fff
L_13007:
PRINT " Nome do Arquivo a Catalogar *FIM* ";   '@13007 DS:1e68
L_1301a:
CALL MIXT_07f1_LimpaTeclado   '@1301a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_14d8! = 0.0   '@13024 DS:1d56
V_14dc! = 1.0   '@13036 DS:168a
CALL MIXT_0dbe_GuardaTela(V_14d8!, V_14dc!, V_0dcc$)   '@13041
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1492$   '@13052 DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_1492$) = 0) THEN GOTO L_13089   '@1306c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@13081
L_13089:
IF NOT (UCASE$(V_1492$) = "D") THEN GOTO L_130bb   '@13089 DS:1846
GOSUB L_1604a   '@130a6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_12f64   '@130b3
L_130bb:
ON ERROR GOTO L_166ae
RT_ONERR = &H166ae   '@130bb
V_1016! = 7.0   '@130ca DS:1cca
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_1492$ + ".COL") FOR INPUT AS #1   '@130db DS:189c,18e0,1c80
CLOSE #1   '@1311d
IF NOT (V_106e$ = "ERRCOL") THEN GOTO L_1314b   '@1312c DS:1b98
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_12f64   '@13143
L_1314b:
RT_VIEWPRINT 5, 25   '@1314b
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_1492$ + ".COL") FOR INPUT AS #1   '@1315d DS:189c,18e0,1c80
INPUT #1, V_106e$   '@1319f
INPUT #1, V_106e$   '@131bf
INPUT #1, V_106e$   '@131df
INPUT #1, V_106e$   '@131ff
V_1012! = VAL(V_106e$)   '@1321f
V_100e! = 0.0   '@13239 DS:1d56
IF NOT (V_106e$ <> "FIM") THEN GOTO L_132a0   '@1324a DS:1c0a
INPUT #1, V_106e$   '@13261
V_100e! = VAL(V_106e$)   '@13281
L_132a0:
IF NOT (V_100e! = 0.0) THEN GOTO L_132f0   '@132a0 DS:1d56
BEEP   '@132bb
CLOSE #1   '@132c5
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@132d4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_12f8c   '@132e3
L_132f0:
IF NOT (V_1484% = 0) THEN GOTO L_13401   '@132f0
CLOSE #1   '@132ff
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@1330e
LOCATE 6, 50   '@1331d
COLOR RT_CINT%(4.0 * FX##(V_0dc8!)), 7   '@1333b DS:1930
PRINT " Gravadas"; V_100e!; "Colunas ";   '@13365 DS:1e90,1e9e
CALL MIXT_07f1_LimpaTeclado   '@13389
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@13393
V_106e$ = RT_INPUT$(1)   '@133b8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 5, 8   '@133d4
RT_CLS 2   '@133e6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_12f8c   '@133f4
L_13401:
V_1016! = 1.0   '@13401 DS:168a
L_13417:
COLOR RT_CINT%(FX##(V_0dc8!)), 7   '@1341c
LOCATE 7, 30   '@13441
PRINT CHR$(218); RT_STRINGC$((47), (196)); CHR$(191)   '@1345f
V_101a! = 8.0   '@13495 DS:1eaa
L_134ac:
LOCATE RT_CINT%(FX##(V_101a!)), 30   '@134ac
COLOR RT_CINT%(FX##(V_0dc8!))   '@134d1
PRINT CHR$(179); RT_TAB$(78); ""; CHR$(179);   '@134ee DS:1630
COLOR 0   '@13523
PRINT CHR$(219)   '@13538
V_101a! = FX##(V_101a!) + 1.0   '@1354c DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
IF NOT (V_101a! = 22.0) THEN GOTO L_134ac   '@13562 DS:169e
LOCATE 22, 30   '@1357d
COLOR RT_CINT%(FX##(V_0dc8!))   '@1359b
PRINT CHR$(195); RT_STRINGC$((47), (196)); CHR$(180);   '@135b8
COLOR 0   '@135ee
PRINT CHR$(219)   '@13603
COLOR RT_CINT%(FX##(V_0dc8!))   '@13617
LOCATE 8, 31   '@13634
PRINT "Pos  Coluna         inicio         termino"   '@13652 DS:1eae
LOCATE 23, 30   '@13660
PRINT CHR$(179); " Gravadas"; V_100e!; "Colunas   * interrompe"; RT_TAB$(78); ""; CHR$(179);   '@1367e DS:1630,1e90,1edc
COLOR 0   '@136d2
PRINT CHR$(219)   '@136e7
LOCATE 24, 30   '@136fb
COLOR RT_CINT%(FX##(V_0dc8!))   '@13719
PRINT CHR$(192); RT_STRINGC$((47), (196)); CHR$(217);   '@13736
COLOR 0   '@1376c
PRINT CHR$(219);   '@13781
LOCATE 25, 32   '@13795
PRINT RT_STRINGC$((48), (219));   '@137b3
V_101a! = FX##(V_1016!) + 9.0   '@137cb DS:1dde
CALL MIXT_0877_Menor(V_101a!, V_100e!, V_14e0!)   '@137e1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_101a! = V_14e0!   '@137f8
GOSUB L_138ef   '@13803
L_BP0c% = (V_101a! = V_100e!)   '@13810
IF NOT ((V_106e$ = "*" OR L_BP0c%) <> 0) THEN GOTO L_138cc   '@13839 DS:1ef6
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@1384e
CLOSE #1   '@1385d
V_14e4! = 1.0   '@1386c DS:168a
V_14e8! = 0.0   '@1387e DS:1d56
CALL MIXT_0dbe_GuardaTela(V_14e4!, V_14e8!, V_0dcc$)   '@13889
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
COLOR 7, RT_CINT%(FX##(V_0dc8!))   '@1389a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_12f8c   '@138bf
L_138cc:
V_1016! = FX##(V_101a!) + 1.0   '@138cc DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_13417   '@138e2
' ---- F_138ea @0x138ea  (0138ea_F_138ea.lift.txt; evidence_id (assembly): ev_7f813bc1bb13806ca14d285aea3ab1fb7636646e0fe646a0b99319434e5ae946)
L_138ef:   ' sub-rotina (alvo de GOSUB); entrada vinda de 011b7d_F_11b7d
IF NOT (V_1016! > V_101a!) THEN GOTO L_13917   '@138f4
GOTO L_13acc   '@1390f
L_13917:
COLOR RT_CINT%(4.0 * FX##(V_0dc8!)), 7   '@13917 DS:1930
IF NOT (V_1016! = 1.0) THEN GOTO L_139c7   '@13941 DS:168a
V_14ec! = V_1012!   '@1395c
FOR V_101e! = 0.0 TO V_14ec!   '@1396e DS:168a,1d56
LINE INPUT #1, V_106e$   '@13976 DS:1630
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@13999 DS:168a
L_139c7:
V_14f0! = V_101a!   '@139c7
FOR V_101e! = V_1016! TO V_14f0!   '@139d9 DS:168a
LOCATE RT_CINT%(10.0 - FX##(V_1016!) + V_101e!), 31   '@139e0 DS:168e
INPUT #1, V_106e$, V_1072$, V_1076$   '@13a0f
PRINT USING "###  \          \ \            \ \            \"; RT_PU#(V_101e!, "###  \          \ \            \ \            \", 1); V_106e$; RT_MID2$((V_1072$), (3)); RT_MID2$((V_1076$), (3))   '@13a49 DS:1efc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@13a9b DS:168a
L_13acc:
COLOR RT_CINT%(FX##(V_0dc8!)), 7   '@13ad1
LOCATE 21, 31   '@13af6
PRINT "Qualquer Tecla para Continuar "   '@13b14 DS:1f30
CALL MIXT_07f1_LimpaTeclado   '@13b22
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@13b2c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@13b48
L_13b57:   ' entrada vinda de 0105ee_FUN_1000_05ee
RT_VIEWPRINT 1, 25   '@13b5c
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!))   '@13b6e
RT_CLS 2   '@13b9a
PRINT RT_STRINGC$((80), (205))   '@13ba8
PRINT " Leitura de Colunas Gravadas em Disco"   '@13bc0 DS:1f52
IF NOT (V_11a6% > 0) THEN GOTO L_13c0e   '@13bce
PRINT " Arquivadas em Memoria"; V_11a6%; "Colunas da Obra "; V_11be$   '@13bdd DS:1aec,1b06
GOTO L_13c21   '@13c06
L_13c0e:
PRINT " Nao ha Colunas Arquivadas na Memoria"   '@13c0e DS:1b1a
L_13c21:
PRINT RT_STRINGC$((80), (205))   '@13c21
L_13c3e:
V_101a! = 10.0   '@13c43 DS:168e
GOSUB L_16501   '@13c54
RT_VIEWPRINT 5, 9   '@13c61
L_13c78:
RT_CLS 2   '@13c7d
LOCATE 6, 1   '@13c8b
COLOR 7   '@13ca6
IF NOT (V_11a6% = 0) THEN GOTO L_13cdd   '@13cbc
V_11be$ = "RETORNO"   '@13ccb DS:1f7c
L_13cdd:
PRINT " Nome da Obra *"; V_11be$; "* ";   '@13cdd DS:1b6c,1c48
CALL MIXT_07f1_LimpaTeclado   '@13cfd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1492$   '@13d07 DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_1492$) = 0) THEN GOTO L_13d64   '@13d21
V_1492$ = V_11be$   '@13d36
IF NOT (V_11a6% = 0) THEN GOTO L_13d5f   '@13d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@13d57
L_13d5f:
L_13d64:
IF NOT (UCASE$(V_1492$) = "D") THEN GOTO L_13d96   '@13d64 DS:1846
GOSUB L_1604a   '@13d81
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_13c3e   '@13d8e
L_13d96:
IF NOT (V_11a6% > 0) THEN GOTO L_13ec5   '@13d96
BEEP   '@13da5
LOCATE 7, 1   '@13daf
COLOR RT_CINT%(FX##(V_0dc0!))   '@13dca
PRINT " Os Dados em memoria das Colunas da Obra "; V_11be$; " serao Perdidos  SIM/*N* ";   '@13de7 DS:1f88,1fb6
CALL MIXT_07f1_LimpaTeclado   '@13e07
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_1072$   '@13e11 DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
LOCATE 7, 1   '@13e2b
PRINT RT_TAB$(78); ""; ""   '@13e46 DS:1630
IF NOT (UCASE$(V_1072$) = "SIM") THEN GOTO L_13eb3   '@13e66 DS:1fd4
V_11a6% = 0   '@13e83
V_11be$ = V_1492$   '@13e8e
V_11ac% = 0   '@13ea0
GOTO L_13ec0   '@13eab
L_13eb3:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@13eb3
L_13ec0:
L_13ec5:
LOCATE 6, 40   '@13ec5
COLOR 7   '@13ee3
CALL MIXT_07f1_LimpaTeclado   '@13ef9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Continuo N/*S* ", V_106e$   '@13f03 DS:1c5c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) = "N") THEN GOTO L_13f42   '@13f1d DS:17b8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_13c78   '@13f3a
L_13f42:
LOCATE 7, 1   '@13f42
PRINT " Aguarde ..."   '@13f5d DS:16a2
V_11be$ = V_1492$   '@13f6b
GOSUB L_13f97   '@13f7d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_105f8   '@13f8a
' ---- F_13f92 @0x13f92  (013f92_F_13f92.lift.txt; evidence_id (assembly): ev_df8814169ab6f60d813519b66838ca2947f9112f33d8319f905ebb3820426b1c)
L_13f97:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0138ea_F_138ea
V_106e$ = ""   '@13f9c DS:1630
ON ERROR GOTO L_166ae
RT_ONERR = &H166ae   '@13fae
V_1016! = 8.0   '@13fbd DS:1eaa
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") FOR INPUT AS #1   '@13fce DS:189c,18e0,1c80
CLOSE #1   '@14010
IF NOT (V_106e$ = "ERRCOL") THEN GOTO L_14040   '@1401f DS:1b98
RETURN   '@14036
L_14040:
OPEN RT_ARQ$(V_0df8$ + ":" + V_0dfc$ + V_11be$ + ".COL") FOR INPUT AS #1   '@14040 DS:189c,18e0,1c80
INPUT #1, V_106e$   '@14082
INPUT #1, V_106e$   '@140a2
INPUT #1, V_106e$   '@140c2
INPUT #1, V_106e$   '@140e2
IF NOT (V_106e$ = "FIM") THEN GOTO L_1412d   '@14102 DS:1c0a
BEEP   '@14119
RETURN   '@14123
L_1412d:
REDIM A_11c8!(-32768 TO -32768)   '@1412d
REDIM A_11f6$(-32768 TO -32768)   '@1413b
REDIM A_11c8!(0 TO CINT(V_0e38!))   '@14144
REDIM A_11f6$(0 TO CINT(V_0e38!))   '@14168
A_11c8!(0) = VAL(V_106e$)   '@1418c
INPUT #1, V_106e$   '@141b4
V_11a6% = RT_CINT%(FX##(VAL(V_106e$)))   '@141d4
V_1072$ = " NUMERO DE NIVEIS INSUFICIENTE"   '@141ef DS:1fdc
V_14f4! = A_11c8!(0)   '@14201
FOR V_101e! = 0.0 TO V_14f4!   '@14221 DS:168a,1d56
INPUT #1, A_11c8!(RT_CINT%(FX##(V_101e!))), A_11f6$(RT_CINT%(FX##(V_101e!)))   '@14228
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@1427a DS:168a
V_11a4% = 1   '@142a3
REDIM A_1224%(-32768 TO -32768, -32768 TO -32768)   '@142ae
REDIM A_1252$(-32768 TO -32768)   '@142bc
REDIM A_1224%(0 TO CINT(V_0e34!), 0 TO 7)   '@142c5
REDIM A_1252$(0 TO CINT(V_0e34!))   '@142f0
V_1072$ = " NUMERO MAXIMO DE COLUNAS ARQUIVADAS INSUFICIENTE"   '@14314 DS:1ffe
V_14f8! = V_11a6%   '@14326
FOR V_101e! = 1.0 TO V_14f8!   '@1433b DS:168a
INPUT #1, A_1252$(RT_CINT%(FX##(V_101e!))), V_106e$, V_1076$   '@14342
A_1224%(RT_CINT%(FX##(V_101e!)), 0) = RT_CINT%(FX##(VAL(RT_MID2$((V_106e$), (4)))))   '@14390
A_1224%(RT_CINT%(FX##(V_101e!)), 1) = RT_CINT%(FX##(VAL(RT_MID2$((V_1076$), (4)))))   '@143d7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@1441f DS:168a
V_14fc! = V_11a6%   '@1444b
FOR V_101e! = 1.0 TO V_14fc!   '@14460 DS:168a
INPUT #1, A_1224%(RT_CINT%(FX##(V_101e!)), 2), A_1224%(RT_CINT%(FX##(V_101e!)), 3), A_1224%(RT_CINT%(FX##(V_101e!)), 4), A_1224%(RT_CINT%(FX##(V_101e!)), 5), A_1224%(RT_CINT%(FX##(V_101e!)), 6), A_1224%(RT_CINT%(FX##(V_101e!)), 7)   '@14468
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@14544 DS:168a
V_11aa% = 0   '@14570
REDIM A_130a%(-32768 TO -32768, -32768 TO -32768)   '@1457b
INPUT #1, V_1500$   '@14589
V_0fb8! = VAL(V_1500$)   '@145a9
IF NOT (V_0fb8! = 1.0) THEN GOTO L_14721   '@145c3 DS:168a
REDIM A_130a%(0 TO CINT(V_0e34!), 0 TO CINT(V_0e38!))   '@145de
V_1504! = V_11a6%   '@14610
FOR V_101e! = 1.0 TO V_1504!   '@14625 DS:168a
V_1508! = A_1224%(RT_CINT%(FX##(V_101e!)), 1)   '@1462c
FOR V_14a2! = A_1224%(RT_CINT%(FX##(V_101e!)), 0) TO V_1508!   '@1465c DS:168a
INPUT #1, A_130a%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)))   '@14680
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@146bc DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@146e5 DS:168a
V_11aa% = 1   '@14711
L_14721:
V_11a8% = 0   '@14721
REDIM A_1280!(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@1472c
REDIM A_12ae$(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@1473a
REDIM A_12dc!(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@14743
INPUT #1, V_0fb8!   '@14751
IF NOT (V_0fb8! = 1.0) THEN GOTO L_14c30   '@14770 DS:168a
REDIM A_1280!(0 TO CINT(V_0e34!), 0 TO CINT(V_0e38!), 0 TO 16)   '@1478b
REDIM A_12ae$(0 TO CINT(V_0e34!), 0 TO CINT(V_0e38!), 0 TO 3)   '@147c4
REDIM A_12dc!(0 TO CINT(V_0e34!), 0 TO CINT(V_0e38!), 0 TO 4)   '@147fd
V_150c! = V_11a6%   '@14833
FOR V_101e! = 1.0 TO V_150c!   '@14848 DS:168a
V_1510! = A_1224%(RT_CINT%(FX##(V_101e!)), 1)   '@14850
FOR V_14a2! = A_1224%(RT_CINT%(FX##(V_101e!)), 0) TO V_1510!   '@14880 DS:168a
FOR V_100e! = 0.0 TO 16.0   '@148a4 DS:168a,1b44,1d56
INPUT #1, A_1280!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), RT_CINT%(FX##(V_100e!)))   '@148b2
IF NOT (A_1280!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), RT_CINT%(FX##(V_100e!))) = 0.0 AND (V_100e! = 13.0 OR (V_100e! = 9.0 OR (V_100e! = 5.0 OR V_100e! = 1.0)))) THEN GOTO L_149be   '@148f9 DS:168a,1d56,1dda,1dde,1de2
GOTO L_149ea   '@149b6
L_149be:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@149be DS:168a,1b44
L_149ea:
INPUT #1, A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 0), A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 1), A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 2), A_12ae$(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 3)   '@149ea
INPUT #1, A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 0), A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 1), A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 2), A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 3), A_12dc!(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_14a2!)), 4)   '@14ab9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@14ba9 DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@14bd5 DS:168a
V_11a8% = 1   '@14c01
INPUT #1, V_11b4%   '@14c0c
L_14c30:
V_11ac% = 0   '@14c30
REDIM A_1338%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@14c3b
REDIM A_1366%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@14c49
INPUT #1, V_0fb8!   '@14c57
INPUT #1, V_11c2%   '@14c76
IF NOT (V_0fb8! = 1.0) THEN GOTO L_151a8   '@14c95 DS:168a
L_BP0c% = (RT_INSTR%((1), (V_1500$), ("[1]")) > 0)   '@14cb0 DS:1d72
IF NOT ((V_0e3e% < VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[1]")) + 3))) AND L_BP0c%) <> 0) THEN GOTO L_14d5c   '@14ce1 DS:1d72
V_0e3e% = RT_CINT%(FX##(VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[1]")) + 3)))))   '@14d1d DS:1d72
L_14d5c:
REDIM A_1338%(0 TO CINT(V_0e34!), 0 TO V_0e3e%, 0 TO 6)   '@14d5c
L_BP0c% = (RT_INSTR%((1), (V_1500$), ("[3]")) > 0)   '@14d8c DS:1d82
IF NOT ((FX##(V_0e2c!) < FX##(VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[3]")) + 3)))) AND L_BP0c%) <> 0) THEN GOTO L_14e34   '@14dbd DS:1d82
V_0e2c! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[3]")) + 3)))   '@14df6 DS:1d82
L_14e34:
IF NOT (V_11c2% > V_0e28!) THEN GOTO L_14e66   '@14e34
V_0e28! = V_11c2%   '@14e52
L_14e66:
REDIM A_1366%(0 TO CINT(V_0e28!), 0 TO CINT(V_0e2c!), 0 TO 1)   '@14e66
V_1514! = V_11a6%   '@14e9f
FOR V_101e! = 1.0 TO V_1514!   '@14eb4 DS:168a
V_1518! = V_0e3e%   '@14ebc
FOR V_100e! = 0.0 TO V_1518!   '@14ed1 DS:168a,1d56
INPUT #1, A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0)   '@14ed8
IF NOT (A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = 0) THEN GOTO L_14f54   '@14f17
GOTO L_1516c   '@14f4c
L_14f54:
FOR V_1012! = 1.0 TO 6.0   '@14f54 DS:168a,1de6
INPUT #1, A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_1012!)))   '@14f62
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1012!   '@14fa9 DS:168a,1de6
IF NOT (A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 6) = 3) THEN GOTO L_15140   '@14fd2
V_1072$ = " NUMERO MAXIMO DE VERTICES DA POLIGONAL INSUFICIENTE"   '@15007 DS:2034
V_14c6% = A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 1)   '@15019
V_151c! = A_1338%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 2)   '@1504a
FOR V_14a2! = 0.0 TO V_151c!   '@15085 DS:168a,1d56
INPUT #1, A_1366%(V_14c6%, RT_CINT%(FX##(V_14a2!)), 0)   '@1508c
INPUT #1, A_1366%(V_14c6%, RT_CINT%(FX##(V_14a2!)), 1)   '@150c4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@150fd DS:168a
V_1072$ = " NUMERO MAXIMO DE COLUNAS ARQUIVADAS INSUFICIENTE"   '@15129 DS:1ffe
L_15140:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_100e!   '@15140 DS:168a
L_1516c:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@1516c DS:168a
V_11ac% = 1   '@15198
L_151a8:
V_1072$ = " NUMERO MAXIMO DE BARRAS INSUFICIENTE"   '@151a8 DS:206c
V_0e40% = 0   '@151ba
V_11c4% = 0   '@151c5
REDIM A_141e%(-32768 TO -32768, -32768 TO -32768, -32768 TO -32768)   '@151d0
REDIM A_13f0%(-32768 TO -32768, -32768 TO -32768)   '@151de
INPUT #1, V_0fb8!   '@151ec
IF NOT (V_0fb8! = 1.0) THEN GOTO L_15830   '@1520b DS:168a
L_BP0c% = (RT_INSTR%((1), (V_1500$), ("[2]")) > 0)   '@15226 DS:1d7a
IF NOT ((V_0e3c% < VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[2]")) + 3))) AND L_BP0c%) <> 0) THEN GOTO L_152d2   '@15257 DS:1d7a
V_0e3c% = RT_CINT%(FX##(VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[2]")) + 3)))))   '@15293 DS:1d7a
L_152d2:
REDIM A_141e%(0 TO CINT(V_0e34!), 0 TO V_0e3c%, 0 TO 7)   '@152d2
V_101e! = INT(FX##(RT_FREN&(-1) + -254440&) / 6.0# - 1.0#)   '@15302 DS:2096,209e
IF NOT (V_101e! < 1024.0) THEN GOTO L_1535f   '@15333 DS:20a6
V_101e! = 1024.0   '@1534e DS:20a6
L_1535f:
IF NOT (V_101e! > 32760.0) THEN GOTO L_1538b   '@1535f DS:20aa
V_101e! = 32760.0   '@1537a DS:20aa
L_1538b:
L_BP0c% = (RT_INSTR%((1), (V_1500$), ("[5]")) > 0)   '@1538b DS:1d92
IF NOT ((FX##(V_101e!) < FX##(VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[5]")) + 3)))) + 100.0# AND L_BP0c%) <> 0) THEN GOTO L_1543d   '@153bc DS:1d92,20ae
V_101e! = FX##(VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[5]")) + 3)))) + 100.0#   '@153fa DS:1d92,20ae
L_1543d:
REDIM A_13f0%(0 TO CINT(V_101e!), 0 TO 2)   '@1543d
V_1520! = V_11a6%   '@15465
FOR V_101e! = 1.0 TO V_1520!   '@1547a DS:168a
V_100e! = 0.0   '@15482 DS:1d56
L_15498:
V_1072$ = " NUMERO MAXIMO DE VARIACOES DA ARMADURA INSUFICIENTE"   '@15498 DS:20b6
INPUT #1, V_1012!   '@154aa
IF NOT (V_0e3c% < V_100e!) THEN GOTO L_154ef   '@154c9
GOTO L_157f4   '@154e7
L_154ef:
A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = RT_CINT%(FX##(V_1012!))   '@154ef
IF NOT (A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 0) = 0) THEN GOTO L_15567   '@1552a
GOTO L_157f4   '@1555f
L_15567:
FOR V_1012! = 1.0 TO 6.0   '@15567 DS:168a,1de6
INPUT #1, A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), RT_CINT%(FX##(V_1012!)))   '@15574
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_1012!   '@155bb DS:168a,1de6
V_1072$ = " NUMERO MAXIMO DE BARRAS INSUFICIENTE"   '@155e4 DS:206c
V_1524! = A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 3) + A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 1)   '@155f6
FOR V_14a2! = 0.0 TO V_1524!   '@15659 DS:168a,1d56
INPUT #1, A_13f0%(RT_CINT%(V_0e40% + 1 + FX##(V_14a2!)), 0)   '@15660
INPUT #1, A_13f0%(RT_CINT%(V_0e40% + 1 + FX##(V_14a2!)), 1)   '@1569d
INPUT #1, A_13f0%(RT_CINT%(V_0e40% + 1 + FX##(V_14a2!)), 2)   '@156db
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_14a2!   '@15716 DS:168a
A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 7) = V_0e40% + 1   '@15742
V_0e40% = A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 3) + A_141e%(RT_CINT%(FX##(V_101e!)), RT_CINT%(FX##(V_100e!)), 1) + V_0e40% + 1   '@15778
V_100e! = FX##(V_100e!) + 1.0   '@157d6 DS:168a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
GOTO L_15498   '@157ec
L_157f4:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY no laco (B$EVCK)
NEXT V_101e!   '@157f4 DS:168a
V_11c4% = 1   '@15820
L_15830:
V_1072$ = ""   '@15830 DS:1630
CLOSE #1   '@15842
IF NOT (RT_INSTR%((1), (V_1500$), ("[6]")) > 0) THEN GOTO L_15fa7   '@15851 DS:1d9a
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[6]")) + 3)))   '@1586e DS:1d9a
V_101e! = -(V_1012! = V_0e66!)   '@158a7
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[7]")) + 3)))   '@158d1 DS:1da2
V_101e! = FX##(V_101e!) - (V_1012! = V_0e6a!)   '@1590a
V_101e! = FX##(V_101e!) - (LTRIM$(RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[8]")) + 3), (1))) = V_0e7e$)   '@1593a DS:1daa
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[10]")) + 4)))   '@1598b DS:1dba
V_101e! = FX##(V_101e!) - (V_1012! = V_0e8e!)   '@159c4
L_BP0c% = RT_INSTR%((1), (V_1500$), ("}"))   '@159f4 DS:1dcc,20ee
V_101e! = FX##(V_101e!) - (RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("{")) + 1), (L_BP0c% - RT_INSTR%((1), (V_1500$), ("{")) - 1)) = V_0e14$)   '@15a37 DS:20ee
IF NOT (V_101e! < 5.0) THEN GOTO L_15fa2   '@15a67 DS:1dda
LOCATE 7, 1   '@15a82
BEEP   '@15a9d
PRINT " Materiais arquivados NAO conferem com os configurados. Altero N/*S* ";   '@15aa7 DS:20f4
CALL MIXT_07f1_LimpaTeclado   '@15ab5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_106e$   '@15abf DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_15f9d   '@15ad9 DS:17b8
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[6]")) + 3)))   '@15af6 DS:1d9a
IF NOT (V_1012! <> V_0e66!) THEN GOTO L_15bd8   '@15b2f
V_106e$ = " Fck arquivado" + STR$(V_1012!) + ", Fck configurado" + STR$(V_0e66!) + " Altero N/*S* "   '@15b4a DS:213e,2150,2166
GOSUB L_15fb6   '@15b98
IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_15bd3   '@15ba5 DS:17b8
V_0e66! = V_1012!   '@15bc2
L_15bd3:
L_15bd8:
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[7]")) + 3)))   '@15bd8 DS:1da2
IF NOT (V_1012! <> V_0e6a!) THEN GOTO L_15cba   '@15c11
V_106e$ = " Fyk arquivado" + STR$(V_1012!) + ", Fyk configurado" + STR$(V_0e6a!) + " Altero N/*S* "   '@15c2c DS:2166,2178,218a
GOSUB L_15fb6   '@15c7a
IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_15cb5   '@15c87 DS:17b8
V_0e6a! = V_1012!   '@15ca4
L_15cb5:
L_15cba:
IF NOT (LTRIM$(RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[8]")) + 3), (1))) <> V_0e7e$) THEN GOTO L_15dbb   '@15cba DS:1daa
V_106e$ = " tipo de Aco arquivado " + LTRIM$(RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[8]")) + 3), (1))) + ", tipo de Aco configurado " + V_0e7e$ + " Altero N/*S* "   '@15cf6 DS:1daa,2166,21a0,21bc
GOSUB L_15fb6   '@15d55
IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_15db6   '@15d62 DS:17b8
V_0e7e$ = LTRIM$(RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[8]")) + 3), (1)))   '@15d7f DS:1daa
L_15db6:
L_15dbb:
V_1012! = VAL(RT_MID2$((V_1500$), (RT_INSTR%((1), (V_1500$), ("[10]")) + 4)))   '@15dbb DS:1dba
IF NOT (V_1012! <> V_0e8e!) THEN GOTO L_15e9d   '@15df4
V_106e$ = " Cobrimento arquivado" + STR$(V_1012!) + ", Cobrimento configurado" + STR$(V_0e8e!) + " Altero N/*S* "   '@15e0f DS:2166,21da,21f4
GOSUB L_15fb6   '@15e5d
IF NOT (UCASE$(V_106e$) <> "N") THEN GOTO L_15e98   '@15e6a DS:17b8
V_0e8e! = V_1012!   '@15e87
L_15e98:
L_15e9d:
L_BP0c% = RT_INSTR%((1), (V_1500$), ("}"))   '@15e9d DS:1dcc,20ee
IF NOT (RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("{")) + 1), (L_BP0c% - RT_INSTR%((1), (V_1500$), ("{")) - 1)) <> V_0e14$) THEN GOTO L_15f98   '@15edb DS:20ee
BEEP   '@15efb
L_BP0c% = RT_INSTR%((1), (V_1500$), ("}"))   '@15f05 DS:1dcc,20ee
V_106e$ = " Parametrizacao arquivada " + RT_MID$((V_1500$), (RT_INSTR%((1), (V_1500$), ("{")) + 1), (L_BP0c% - RT_INSTR%((1), (V_1500$), ("{")) - 1)) + ", Parametrizacao configurada " + V_0e14$ + " "   '@15f47 DS:1b7a,20ee,2210,222e
GOSUB L_15fb6   '@15f86
L_15f98:
L_15f9d:
L_15fa2:
L_15fa7:
RETURN   '@15fa7
L_15fb6:   ' sub-rotina (alvo de GOSUB)
LOCATE 7, 1   '@15fbb
PRINT RT_STRINGC$((80), (32));   '@15fd6
LOCATE 7, 1   '@15fee
PRINT V_106e$;   '@16009
CALL MIXT_07f1_LimpaTeclado   '@16017
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_106e$   '@16021 DS:1630
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@1603b
L_1604a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0105ee_FUN_1000_05ee, 011b7d_F_11b7d, 0138ea_F_138ea
RT_VIEWPRINT 22, 25   '@1604f
RT_CLS 2   '@16061
COLOR 7   '@1606f
PRINT " Drive que contem o Disco de Dados ";   '@16085 DS:2250
COLOR RT_CINT%(FX##(V_0dc0!))   '@16093
PRINT "*"; RT_MID$((V_0df8$), (1), (1)); "*";   '@160b0 DS:1ef6
CALL MIXT_07f1_LimpaTeclado   '@160db
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT " ", V_106e$   '@160e5 DS:1b7a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_1612c   '@160ff
V_0df8$ = UCASE$(V_106e$)   '@16114
L_1612c:
COLOR 3   '@1612c
PRINT " [";   '@16142 DS:2278
COLOR 7   '@16150
PRINT "\Diretorio\Subdiretorio\...\";   '@16166 DS:227e
COLOR 3   '@16174
PRINT "]";   '@1618a DS:229e
COLOR 7   '@16198
PRINT "Subdiretorio ";   '@161ae DS:22a4
COLOR RT_CINT%(FX##(V_0dc0!))   '@161bc
PRINT "*"; V_0dfc$; "*";   '@161d9 DS:1ef6
COLOR 7   '@161f9
RT_LINEINPUT " ", V_106e$   '@1620f DS:1b7a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_106e$) > 0) THEN GOTO L_162a7   '@16229
IF NOT (RT_MID$((V_106e$), (1), (1)) <> "\") THEN GOTO L_1628a   '@1623e DS:1b86
V_0dfc$ = V_0dfc$ + UCASE$(V_106e$)   '@16260
GOTO L_162a2   '@16282
L_1628a:
V_0dfc$ = UCASE$(V_106e$)   '@1628a
L_162a2:
L_162a7:
IF NOT (RT_RIGHT$((V_0dfc$), (1)) <> "\") THEN GOTO L_162e4   '@162a7 DS:1b86
V_0dfc$ = V_0dfc$ + "\"   '@162c8 DS:1b86
L_162e4:
ON ERROR GOTO L_16358
RT_ONERR = &H16358   '@162e4
L_BP0c% = (LEN(V_0dfc$) > 1)   '@162f3 DS:189c
CHDIR RT_ARQ$(V_0df8$ + ":" + RT_LEFT$((V_0dfc$), (LEN(V_0dfc$) + L_BP0c%)))   '@16320
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@1633a
RETURN   '@16349
L_16358:
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@1635d
COLOR 14   '@1636c
RT_CLS 2   '@16382
BEEP   '@16390
BEEP   '@1639a
PRINT " ATENCAO ! ..  Drive e Diretorio nao encontrados"   '@163a4 DS:22b6
COLOR 7   '@163b2
PRINT " Crio o Diretorio ";   '@163c8 DS:22ea
COLOR RT_CINT%(FX##(V_0dc0!))   '@163d6
PRINT V_0df8$; ":"; V_0dfc$;   '@163f3 DS:189c
COLOR 7   '@16413
CALL MIXT_07f1_LimpaTeclado   '@16429
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "    S/*N* ", V_106e$   '@16433 DS:2300
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_106e$) <> "S") THEN GOTO L_1649d   '@1644d DS:230e
V_0dfc$ = V_0df4$   '@1646a
V_0df8$ = V_0df0$   '@1647c
RESUME   '@1648e
L_1649d:
PRINT " Criando Diretorio     Aguarde ..."   '@1649d DS:2314
L_BP0c% = (LEN(V_0dfc$) > 1)   '@164ab DS:189c
MKDIR RT_ARQ$(V_0df8$ + ":" + RT_LEFT$((V_0dfc$), (LEN(V_0dfc$) + L_BP0c%)))   '@164d8
RESUME   '@164f2
L_16501:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0105ee_FUN_1000_05ee, 011b7d_F_11b7d, 0138ea_F_138ea
RT_VIEWPRINT RT_CINT%(FX##(V_101a!)), 25   '@16506
RT_CLS 2   '@1651f
COLOR 3   '@1652d
PRINT RT_TAB$(30); ""; "Acione  D <Enter>  para alterar Drive e Diretorio"   '@16543 DS:1630,233a
COLOR 14   '@16563
RT_VIEWPRINT RT_CINT%(FX##(V_101a!) + 1.0), 25   '@16579 DS:168a
ON ERROR GOTO L_16647
RT_ONERR = &H16647   '@16597
L_BP0c% = (LEN(V_0dfc$) > 1)   '@165a6 DS:189c
CHDIR RT_ARQ$(RT_LEFT$((V_0df8$ + ":" + V_0dfc$), (LEN(V_0dfc$) + L_BP0c% + 2)))   '@165dc
RT_FILES V_0df8$ + ":" + V_0dfc$ + "*" + V_148a$   '@165f3 DS:189c,1ef6 (FILES: cabecalho em forma DOS (RT45))
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@16629
RETURN   '@16638
L_16647:
IF NOT (ERR = 53) THEN GOTO L_1668d   '@1664c
PRINT " Nenhum Arquivo Encontrado"   '@1665e DS:2370
V_106e$ = ""   '@1666c DS:1630
RESUME NEXT   '@1667e
L_1668d:
V_106e$ = "ERRPIL"   '@1668d DS:238e
RESUME NEXT   '@1669f
L_166ae:   ' entrada vinda de 0105ee_FUN_1000_05ee, 011b1a_F_11b1a, 011b7d_F_11b7d
BEEP   '@166b3
COLOR 14   '@166bd
LOCATE RT_CINT%(FX##(V_1016!)), 1   '@166d3
V_1528% = ERR   '@166f5
IF NOT (V_1528% = 9) THEN GOTO L_16735   '@16702
PRINT " CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA "   '@16711 DS:2398
PRINT V_1072$;   '@1671f
GOTO L_16788   '@1672d
L_16735:
IF NOT (V_1528% = 53) THEN GOTO L_16755   '@16735
PRINT " ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ";   '@1673f DS:23cc
GOTO L_16788   '@1674d
L_16755:
IF NOT (V_1528% = 61) THEN GOTO L_16775   '@16755
PRINT " O SEU DISCO DE DADOS ESTA LOTADO ";   '@1675f DS:23fa
GOTO L_16788   '@1676d
L_16775:
PRINT " VERIFIQUE O SEU DRIVE ";   '@16775 DS:2420
L_16788:
RT_CLOSE   '@16788 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
COLOR 7   '@16795
CALL MIXT_07f1_LimpaTeclado   '@167ab
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = RT_INPUT$(1)   '@167b5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_10497, L_104c2, L_105c0   ' ON KEY pelo roteiro (entre comandos)
V_106e$ = "ERRCOL"   '@167d1 DS:1b98
ON ERROR GOTO L_101b2
RT_ONERR = &H101b2   '@167e3
RESUME L_105f8   '@167f2
' @167ff (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_1697c   '@167ff
' ---- FUN_1000_697c @0x1697c  (01697c_FUN_1000_697c.lift.txt; evidence_id (assembly): ev_f3fdddc5bb062a54d265c83551d28769911e9f15adebe6a0c91de0e92ba8ebad)
L_1697c:   ' entrada vinda de 013f92_F_13f92
RT_FIM   ' @1697c B$CENP (inicio/fim do modulo)
'RETRAD? @16981 ?? 50 bytes sem caminho de entrada conhecido (dados/lixo, 23 instr.): XOR AX, 0x0; ADD byte ptr [BP + SI], BH; ADD byte ptr [BX + SI], AL ...
L_169b3:
'RETRAD? @169b3 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JBE 0x1000:69b7
L_169b7:
'RETRAD? @169b7 ?? 4 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JNP 0x1000:69bb
L_169bb:
'RETRAD? @169bb ?? 391 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 164 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], 0x0 ...
' ---- F_16b42 @0x16b42  (016b42_F_16b42.lift.txt; evidence_id (assembly): ev_9a1bc17638ec32d8016e2c3a59a3584813dc9b69dd1f8b443141cee4a7b62431)
'RETRAD? @16b47 ?? 10 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 2 instr.): ADD byte ptr [BX + SI], AL; JMP 0x1000:6b51
L_16b51:
'RETRAD? @16b51 ?? 28 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 17 instr.): STD; ADD AX, 0x0 ...
L_16b6d:
'RETRAD? @16b6f ?? 2 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 1 instr.): ADD byte ptr [BX + SI], AL
L_16b71:
'RETRAD? @16b71 ?? 5 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 3 instr.): TEST AL, 0x6; ADD byte ptr [BX + SI], AL ...
' ---- F_16b78 @0x16b78  (016b78_F_16b78.lift.txt; evidence_id (assembly): ev_25a9d3dfd05da489ea770c9fa27ddfbdae550f54c11ba07988fc3d35d54fd3df)
'RETRAD? @16b78 ?? 42 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 24 instr.): ADD AL, CH; PUSH ES ...
' ---- F_16ba4 @0x16ba4  (016ba4_F_16ba4.lift.txt; evidence_id (assembly): ev_48b180ed4ea9fe0de632f011dac02a5823b7ea5854fffdf68a0cac82c972dd20)
'RETRAD? @16ba4 ?? 10 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 6 instr.): ADD AL, DL; POP ES ...
' ---- F_16bae @0x16bae  (016bae_F_16bae.lift.txt; evidence_id (assembly): ev_962ba88ad838e56d126a2b68e308e9ae7e323d7086b6625da18db5f1b1139a53)
'RETRAD? @16baf ?? 179 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 80 instr.): ADD byte ptr [BX + SI], AL; ADC CL, byte ptr [BX + SI] ...
L_16c62:
'RETRAD? @16c62 ?? 69 bytes que nao parecem codigo do QuickBASIC (dados lidos como instrucoes; 31 instr.): OR AX, word ptr [BX + SI]; ADD AH, DL ...
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
    V_1484% = 0
    V_1486! = 0
    V_148a$ = ""
    V_148e$ = ""
    V_1492$ = ""
    V_1496! = 0
    V_149a! = 0
    V_149e! = 0
    V_14a2! = 0
    V_14a6! = 0
    V_14aa! = 0
    V_14ae! = 0
    V_14b2! = 0
    V_14b6! = 0
    V_14ba! = 0
    V_14be! = 0
    V_14c2! = 0
    V_14c6% = 0
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
    V_14f4! = 0
    V_14f8! = 0
    V_14fc! = 0
    V_1500$ = ""
    V_1504! = 0
    V_1508! = 0
    V_150c! = 0
    V_1510! = 0
    V_1514! = 0
    V_1518! = 0
    V_151c! = 0
    V_1520! = 0
    V_1524! = 0
    V_1528% = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_10497: BEEP; GOSUB L_101f2; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_104c2: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_105c0: sai da SUB (BEEP; GOSUB L_101f2; RETURN L_105ee)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H101b2: ON ERROR GOTO L_101b2
        CASE &H10587: ON ERROR GOTO L_10587
        CASE &H10fed: ON ERROR GOTO L_10fed
        CASE &H119ec: ON ERROR GOTO L_119ec
        CASE &H11b1f: ON ERROR GOTO L_11b1f
        CASE &H16358: ON ERROR GOTO L_16358
        CASE &H16647: ON ERROR GOTO L_16647
        CASE &H166ae: ON ERROR GOTO L_166ae
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_16807   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x16807)
    ' ---- FUN_1000_6807 @0x16807  (016807_FUN_1000_6807.lift.txt; evidence_id (assembly): ev_28d6cc22f226e67139aaa23ec3353a28fe76db511c8fc0d04d002928f682f98d)
    BEEP   '@1680f
    BEEP   '@16819
    BEEP   '@16823
    RT_SCREEN 0   '@1682d
    RT_VIEWPRINT 1, 25   '@16842
    RT_CLOSE   '@16854 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@16861 DS:1930
    RT_CLS 0   '@168a6
    LOCATE 10, 1   '@168b3
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@168ce DS:1630,243c
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@168ee DS:1630,2456
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@1690e DS:1630,2482
L_16933:
    CALL MIXT_07f1_LimpaTeclado   '@16938
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_106e$ = RT_INPUT$(1)   '@16942
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1695e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_16933   '@16968
    ' ---- F_1696f @0x1696f  (01696f_F_1696f.lift.txt; evidence_id (assembly): ev_34fcfddda515381500bc347c39ae976ecb942db78c815fa47066f001b2d0cd34)
    ' END SUB   '@1696f
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_PILAREDI.BM'
'$INCLUDE: '../comum/MIXT.BM'
