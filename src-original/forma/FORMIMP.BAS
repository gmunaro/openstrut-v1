' ============================================================================
'  FORMIMP - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/FORMIMP/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: dc5c84c46a49dd75dad405aeb8112cd9457a21829795e674d0ba65a6c07d45cb
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_FORMA.BI'

' ---- variaveis do FORMIMP fora do COMMON (DS do programa)
REDIM SHARED A_1a60!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1866!
DIM SHARED V_186a!
DIM SHARED V_186e!
DIM SHARED V_1872!
DIM SHARED V_1876!
DIM SHARED V_187a!
DIM SHARED V_187e!
DIM SHARED V_1882!
DIM SHARED V_1886!
DIM SHARED V_188a!
DIM SHARED V_188e!
DIM SHARED V_1892!
DIM SHARED V_1896!
DIM SHARED V_189a!
DIM SHARED V_189e%
DIM SHARED V_18a0$
DIM SHARED V_18a4$
DIM SHARED V_18a8!
DIM SHARED V_18ac!
DIM SHARED V_18b0!
DIM SHARED V_18b4$
DIM SHARED V_18b8!
DIM SHARED V_18bc!
DIM SHARED V_18c0$
DIM SHARED V_18c4$
DIM SHARED V_18c8!
DIM SHARED V_18cc!
DIM SHARED V_18d0!
DIM SHARED V_18d4!
DIM SHARED V_18d8!
DIM SHARED V_18dc%
DIM SHARED V_18de!
DIM SHARED V_18e2!
DIM SHARED V_18e6!
DIM SHARED V_18ea!
DIM SHARED V_18ee!
DIM SHARED V_18f2!
DIM SHARED V_18f6!
DIM SHARED V_18fa$
DIM SHARED V_18fe$
DIM SHARED V_1902!
DIM SHARED V_1a08!
DIM SHARED V_1a0c!
DIM SHARED V_1a10!
DIM SHARED V_1a14!
DIM SHARED V_1a18!
DIM SHARED V_1a1c!
DIM SHARED V_1a20!
DIM SHARED V_1a24!
DIM SHARED V_1a28!
DIM SHARED V_1a2c!
DIM SHARED V_1a30!
DIM SHARED V_1a34!
DIM SHARED V_1a38!
DIM SHARED V_1a3c!
DIM SHARED V_1a40!
DIM SHARED V_1a44!
DIM SHARED V_1a48!
DIM SHARED V_1a4c!
DIM SHARED V_1a50!
DIM SHARED V_1a54!
DIM SHARED V_1a58!
DIM SHARED V_1a5c!
DIM SHARED V_1a8e!
DIM SHARED V_1a92!
DIM SHARED V_1a96!
DIM SHARED V_1a9a!
DIM SHARED V_1a9e!
DIM SHARED V_1aa2!
DIM SHARED V_1aa6!
DIM SHARED V_1aaa!
DIM SHARED V_1aae!
DIM SHARED V_1ab2!
DIM SHARED V_1ab6!
DIM SHARED V_1aba!
DIM SHARED V_1abe!
DIM SHARED V_1ac2!
DIM SHARED V_1ac6!
DIM SHARED V_1aca!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "FORMIMP"
' ---- M_FORMIMP @0x10030  (010030_M_FORMIMP.lift.txt; evidence_id (assembly): ev_4305d6d28b67a0f2dfaf0e524ff8d8093cec3749f9f02f70e29b5282ac42440a)
' @10030 inicio do programa (B$?EVT)
GOTO L_101f2   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_101f2:
REDIM A_1a60!(-32768 TO -32768, -32768 TO -32768)   '@101f2
REDIM A_1a60!(0 TO CINT(A_15da!(0, 0)), 0 TO 4)   '@10200
V_1abe! = A_1664!(1, 0)   '@10235
V_1ac6! = A_1664!(1, 0)   '@10258
V_1ac2! = A_1664!(1, 1)   '@1027b
V_1aca! = A_1664!(1, 1)   '@1029c
V_1896! = A_1664!(0, 0)   '@102bd
FOR V_11b8! = 1.0 TO V_1896!   '@102de DS:1b2a
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) < V_1abe!) THEN GOTO L_10344   '@102e6
V_1abe! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@1031a
L_10344:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) < V_1abe!) THEN GOTO L_1039e   '@10344
V_1abe! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@10376
L_1039e:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) > V_1ac6!) THEN GOTO L_103fc   '@1039e
V_1ac6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@103d2
L_103fc:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) > V_1ac6!) THEN GOTO L_10456   '@103fc
V_1ac6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@1042e
L_10456:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) < V_1ac2!) THEN GOTO L_104b6   '@10456
V_1ac2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1048b
L_104b6:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) < V_1ac2!) THEN GOTO L_10516   '@104b6
V_1ac2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@104eb
L_10516:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) > V_1aca!) THEN GOTO L_10576   '@10516
V_1aca! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1054b
L_10576:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) > V_1aca!) THEN GOTO L_105d6   '@10576
V_1aca! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@105ab
L_105d6:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@105d6 DS:1b2a
V_189a! = A_1692!(0, 0)   '@10602
FOR V_11b8! = 1.0 TO V_189a!   '@10623 DS:1b2a
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 0) < V_1abe!) THEN GOTO L_10688   '@1062a
V_1abe! = A_1692!(RT_CINT%(FX##(V_11b8!)), 0)   '@1065e
L_10688:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 2) < V_1abe!) THEN GOTO L_106e2   '@10688
V_1abe! = A_1692!(RT_CINT%(FX##(V_11b8!)), 2)   '@106ba
L_106e2:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 0) > V_1ac6!) THEN GOTO L_10740   '@106e2
V_1ac6! = A_1692!(RT_CINT%(FX##(V_11b8!)), 0)   '@10716
L_10740:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 2) > V_1ac6!) THEN GOTO L_1079a   '@10740
V_1ac6! = A_1692!(RT_CINT%(FX##(V_11b8!)), 2)   '@10772
L_1079a:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 1) < V_1ac2!) THEN GOTO L_107fa   '@1079a
V_1ac2! = A_1692!(RT_CINT%(FX##(V_11b8!)), 1)   '@107cf
L_107fa:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 3) < V_1ac2!) THEN GOTO L_1085a   '@107fa
V_1ac2! = A_1692!(RT_CINT%(FX##(V_11b8!)), 3)   '@1082f
L_1085a:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 1) > V_1aca!) THEN GOTO L_108ba   '@1085a
V_1aca! = A_1692!(RT_CINT%(FX##(V_11b8!)), 1)   '@1088f
L_108ba:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 3) > V_1aca!) THEN GOTO L_1091a   '@108ba
V_1aca! = A_1692!(RT_CINT%(FX##(V_11b8!)), 3)   '@108ef
L_1091a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1091a DS:1b2a
CALL S_2018c   '@10946
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_1556$ = "S"   '@10950 DS:1b2e
V_155a$ = "S"   '@10962 DS:1b2e
V_155e$ = "S"   '@10974 DS:1b2e
V_1562$ = "S"   '@10986 DS:1b2e
V_1566$ = "S"   '@10998 DS:1b2e
V_156a$ = "S"   '@109aa DS:1b2e
V_156e$ = "S"   '@109bc DS:1b2e
V_1a50! = V_1abe!   '@109ce
V_1a54! = V_1ac2!   '@109df
V_1a58! = V_1ac6!   '@109f0
V_1a5c! = V_1aca!   '@10a01
V_189e% = 50   '@10a12
L_10a22:   ' entrada vinda de 012766_F_12766, 0147a0_F_147a0
ON ERROR GOTO L_14765
RT_ONERR = &H14765   '@10a27
V_11d4! = RT_FRE&("")   '@10a36 DS:1ad0
GOSUB L_147a5   '@10a50
L_10a62:
V_1aae! = INT(V_1abe! - (FX##(V_1ac6!) - V_1abe!) / 20.0)   '@10a67 DS:1b34
V_1ab2! = INT(V_1ac2! - (FX##(V_1aca!) - V_1ac2!) / 20.0)   '@10a91 DS:1b34
V_1ab6! = INT((FX##(V_1ac6!) - V_1abe!) / 20.0 + V_1ac6!)   '@10abb DS:1b34
V_1aba! = INT((FX##(V_1aca!) - V_1ac2!) / 20.0 + V_1aca!)   '@10ae2 DS:1b34
L_10b0e:
CALL S_14d0d   '@10b13
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_1a30! = 4.0 / (FX##(V_1a34!) * 3.0) * V_1a38!   '@10b1d DS:1b38,1b3c
CALL S_24b48   '@10b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
CALL S_21425   '@10b4a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
CALL S_216c7   '@10b54
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
L_10b63:
RT_VIEWPRINT 23, 25   '@10b68
RT_CLS 2   '@10b7a
PRINT " <S>eleciona Campo de Impressao     <E>scala     <T>extos     <I>mprimir"   '@10b88 DS:1b40
PRINT " <Z>oom     <C>opia tela na impressora"   '@10b96 DS:1b8c
PRINT " <F>im";   '@10ba4 DS:1bb6
L_10bb7:
CALL MIXT_07f1_LimpaTeclado   '@10bbc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@10bc6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_18a0$ = V_0e0c$   '@10be2
IF NOT (V_18a0$ <> "S") THEN GOTO L_10c1d   '@10bf4 DS:1b2e
IF NOT (V_18a0$ = "s") THEN GOTO L_10da8   '@10c0b DS:1bc0
L_10c1d:
RT_VIEWPRINT 23, 25   '@10c1d
RT_CLS 2   '@10c2f
RT_VIEWPRINT 1, 25   '@10c3d
LOCATE 24, 1   '@10c4f
PRINT "   <D>efine um campo de Impressao    <T>odo o campo    <*R*>etorna";   '@10c6a DS:1bc6
V_0e1c$ = "SELECIONA"   '@10c78 DS:1c0c
CALL MIXT_07f1_LimpaTeclado   '@10c8a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@10c94
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_18a4$ = V_0e0c$   '@10cb0
IF NOT (V_18a4$ <> "D") THEN GOTO L_10ceb   '@10cc2 DS:1c1a
IF NOT (V_18a4$ = "d") THEN GOTO L_10d1c   '@10cd9 DS:1c20
L_10ceb:
CALL S_26313   '@10ceb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "FIM") THEN GOTO L_10d14   '@10cf5 DS:1c26
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@10d0c
L_10d14:
GOTO L_10da0   '@10d14
L_10d1c:
IF NOT (V_18a4$ <> "T") THEN GOTO L_10d40   '@10d1c DS:1c2e
IF NOT (V_18a4$ = "t") THEN GOTO L_10da0   '@10d2e DS:1c34
L_10d40:
V_1a50! = FX##(V_1abe!) - 100.0   '@10d40 DS:1c3a
V_1a54! = FX##(V_1ac2!) - 100.0   '@10d56 DS:1c3a
V_1a58! = FX##(V_1ac6!) + 100.0   '@10d6c DS:1c3e
V_1a5c! = FX##(V_1aca!) + 100.0   '@10d82 DS:1c3e
GOTO L_10da0   '@10d98
L_10da0:
GOTO L_1275e   '@10da0
L_10da8:
IF NOT (V_18a0$ <> "E") THEN GOTO L_10dcc   '@10da8 DS:1c42
IF NOT (V_18a0$ = "e") THEN GOTO L_111d6   '@10dba DS:1c48
L_10dcc:
RT_VIEWPRINT 23, 25   '@10dcc
RT_CLS 2   '@10dde
RT_VIEWPRINT 1, 25   '@10dec
LOCATE 23, 1   '@10dfe
PRINT " Escolha de Escala para desenho de Forma em Impressora"   '@10e19 DS:1c4e
PRINT USING " campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#"; RT_PU#(V_1a50!, " campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#", 1); RT_PU#(V_1a58!, " campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#", 2); RT_PU#(V_1a54!, " campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#", 3); RT_PU#(V_1a5c!, " campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#", 4)   '@10e27 DS:1c88
L_10e6e:
LOCATE 25, 1   '@10e73
PRINT " "; RT_TAB$(79); ""; "";   '@10e8e DS:1ad0,1cd2
LOCATE 25, 1   '@10eb7
PRINT " Escala do Desenho 1/ 100 *50* 20 FOTO ";   '@10ed2 DS:1cd8
CALL MIXT_07f1_LimpaTeclado   '@10ee0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@10eea DS:1ad0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_10f2b   '@10f04
V_0e0c$ = "50"   '@10f19 DS:1d04
L_10f2b:
IF NOT (UCASE$(V_0e0c$) = "FOTO") THEN GOTO L_10f6d   '@10f2b DS:1d0a
V_189e% = -1   '@10f48
V_0e10$ = " FOTO"   '@10f53 DS:1d12
GOTO L_110f4   '@10f65
L_10f6d:
L_BP0c% = (RT_INSTR%((1), (V_0e0c$), ("/")) > 0)   '@10f6d DS:1d1c,1d22
L_BP0e% = VAL(V_0e0c$) <= 0.0# OR L_BP0c%   '@10f97
IF NOT ((FX##(VAL(V_0e0c$)) <> INT(FX##(VAL(V_0e0c$))) OR L_BP0e%) <> 0) THEN GOTO L_11002   '@10fba
BEEP   '@10ff0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10e6e   '@10ffa
L_11002:
V_189e% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@11002
V_18a8! = INT((FX##(V_1a58!) - V_1a50!) / (V_189e% * 27.9400005340576171875##)) + 1.0   '@1101d DS:1b2a,1d2a
V_18ac! = INT((FX##(V_1a5c!) - V_1a54!) / (FX##(V_189e%) * 17.0)) + 1.0   '@1104f DS:1b2a,1d2e
V_0e10$ = "1/" + LTRIM$(STR$(V_189e%)) + "  " + STR$(V_18a8!) + " folhas em" + STR$(V_18ac!) + " partes"   '@11081 DS:1d32,1d38,1d3e,1d4c
L_110f4:
LOCATE 25, 1   '@110f4
PRINT " "; RT_TAB$(79); ""; "";   '@1110f DS:1ad0,1cd2
LOCATE 25, 1   '@11138
PRINT " Escala "; V_0e10$; RT_TAB$(50); ""; " ";   '@11153 DS:1ad0,1cd2,1d58
CALL MIXT_07f1_LimpaTeclado   '@11185
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " N/*S* ", V_0e0c$   '@1118f DS:1d64 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_111ce   '@111a9 DS:1d70
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10e6e   '@111c6
L_111ce:
GOTO L_1275e   '@111ce
L_111d6:
IF NOT (V_18a0$ <> "T") THEN GOTO L_111fa   '@111d6 DS:1c2e
IF NOT (V_18a0$ = "t") THEN GOTO L_11871   '@111e8 DS:1c34
L_111fa:
RT_VIEWPRINT 23, 25   '@111fa
L_11211:
RT_CLS 2   '@11216
PRINT " Imprimo Nome das Lajes  S/N  *"; V_1556$; "* ";   '@11224 DS:1d76,1d9a
CALL MIXT_07f1_LimpaTeclado   '@11244
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@1124e DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1128f   '@11268
V_0e0c$ = V_1556$   '@1127d
L_1128f:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@1128f DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_112e7   '@112b6 DS:1b2e
BEEP   '@112d5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_11211   '@112df
L_112e7:
V_1556$ = UCASE$(V_0e0c$)   '@112e7
PRINT " Imprimo Espessura das Lajes  S/N  *"; V_155a$; "* ";   '@112ff DS:1d9a,1da0
CALL MIXT_07f1_LimpaTeclado   '@1131f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@11329 DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1136a   '@11343
V_0e0c$ = V_155a$   '@11358
L_1136a:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@1136a DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_113c2   '@11391 DS:1b2e
BEEP   '@113b0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_11211   '@113ba
L_113c2:
V_155a$ = UCASE$(V_0e0c$)   '@113c2
L_113df:
RT_CLS 2   '@113e4
PRINT " Imprimo Nome das Vigas  S/N  *"; V_155e$; "* ";   '@113f2 DS:1d9a,1dc8
CALL MIXT_07f1_LimpaTeclado   '@11412
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@1141c DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1145d   '@11436
V_0e0c$ = V_155e$   '@1144b
L_1145d:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@1145d DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_114b5   '@11484 DS:1b2e
BEEP   '@114a3
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_113df   '@114ad
L_114b5:
V_155e$ = UCASE$(V_0e0c$)   '@114b5
PRINT " Imprimo Secao das Vigas  S/N  *"; V_1562$; "* ";   '@114cd DS:1d9a,1dec
CALL MIXT_07f1_LimpaTeclado   '@114ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@114f7 DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_11538   '@11511
V_0e0c$ = V_1562$   '@11526
L_11538:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@11538 DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_11590   '@1155f DS:1b2e
BEEP   '@1157e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_113df   '@11588
L_11590:
V_1562$ = UCASE$(V_0e0c$)   '@11590
L_115ad:
RT_CLS 2   '@115b2
PRINT " Imprimo Nome dos Pilares  S/N  *"; V_1566$; "* ";   '@115c0 DS:1d9a,1e10
CALL MIXT_07f1_LimpaTeclado   '@115e0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@115ea DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1162b   '@11604
V_0e0c$ = V_1566$   '@11619
L_1162b:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@1162b DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_11683   '@11652 DS:1b2e
BEEP   '@11671
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_115ad   '@1167b
L_11683:
V_1566$ = UCASE$(V_0e0c$)   '@11683
PRINT " Imprimo Secao dos Pilares  S/N  *"; V_156a$; "* ";   '@1169b DS:1d9a,1e36
CALL MIXT_07f1_LimpaTeclado   '@116bb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@116c5 DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_11706   '@116df
V_0e0c$ = V_156a$   '@116f4
L_11706:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@11706 DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_1175e   '@1172d DS:1b2e
BEEP   '@1174c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_115ad   '@11756
L_1175e:
V_156a$ = UCASE$(V_0e0c$)   '@1175e
L_1177b:
RT_CLS 2   '@11780
PRINT " Imprimo Cotas e Medidas  S/N  *"; V_156e$; "* ";   '@1178e DS:1d9a,1e5c
CALL MIXT_07f1_LimpaTeclado   '@117ae
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@117b8 DS:1ad0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_117f9   '@117d2
V_0e0c$ = V_156e$   '@117e7
L_117f9:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@117f9 DS:1d70
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_11851   '@11820 DS:1b2e
BEEP   '@1183f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_1177b   '@11849
L_11851:
V_156e$ = UCASE$(V_0e0c$)   '@11851
GOTO L_1275e   '@11869
L_11871:
IF NOT (V_18a0$ <> "I") THEN GOTO L_11895   '@11871 DS:1e80
IF NOT (V_18a0$ = "i") THEN GOTO L_12403   '@11883 DS:1e86
L_11895:
RT_VIEWPRINT 23, 25   '@11895
RT_CLS 2   '@118a7
PRINT " Ajuste a Impressora para inicio da Impressao"   '@118b5 DS:1e8c
PRINT " Sigo com a Impressao do Desenho em Escala  N/*S* ";   '@118c3 DS:1ebe
CALL MIXT_07f1_LimpaTeclado   '@118d1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@118db DS:1ad0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1191a   '@118f5 DS:1d70
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@11912
L_1191a:
RT_CLS 2   '@1191a
RT_VIEWPRINT 1, 25   '@11928
L_BP0c% = (V_0dcc$ = "EGA")   '@1193a DS:1ef4
L_BP0e% = (V_0dcc$ = "CGA")   '@1195f DS:1efc,1f04,1f08,1f10
V_1aa2! = (FX##(-(V_0dcc$ = "VGA" OR L_BP0c%) * 343) / 350.0 - FX##((V_0dcc$ = "HER") * 343) / 350.0 - (V_0dcc$ = "MCGA" OR L_BP0e%)) * 199.0   '@119c3 DS:1f18,1f20
V_188e! = 0.0   '@119e5 DS:1f24
V_1892! = 0.0   '@119f6 DS:1f24
L_BP0c% = (V_1802% = 1)   '@11a07
IF NOT ((V_156e$ = "S" AND L_BP0c%) <> 0) THEN GOTO L_11ba2   '@11a24 DS:1b2e
V_18b0! = A_1804!(0, 0)   '@11a39
FOR V_11b8! = 1.0 TO V_18b0!   '@11a5a DS:1b2a
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 1) = -1000.0 AND A_1804!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0) THEN GOTO L_11aeb   '@11a62 DS:1f24,1f28
V_188e! = FX##(V_188e!) + 150.0   '@11ad5 DS:1f2c
L_11aeb:
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 2) = -1000.0 AND A_1804!(RT_CINT%(FX##(V_11b8!)), 0) = 1.0) THEN GOTO L_11b71   '@11aeb DS:1b2a,1f28
V_1892! = FX##(V_1892!) + 150.0   '@11b5b DS:1f2c
L_11b71:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@11b71 DS:1b2a
L_11ba2:
IF NOT (V_189e% = -1) THEN GOTO L_11c69   '@11ba2
V_11e4! = (FX##(V_1a58!) + V_188e! - V_1a50!) / 25.0   '@11bb1 DS:1f30
IF NOT ((V_1a5c! - (FX##(V_1a54!) - V_1892!)) / 12.0 > FX##(V_11e4!)) THEN GOTO L_11c21   '@11bd1 DS:1f34
V_11e4! = (V_1a5c! - (FX##(V_1a54!) - V_1892!)) / 12.0   '@11bfe DS:1f34
L_11c21:
V_1a48! = FX##(V_11e4!) * V_1a3c! * 1.0499999523162841796875## / 100.0   '@11c21 DS:1c3e,1f38
V_1a4c! = FX##(V_11e4!) * V_1a40! * 2.099999904632568359375## / 100.0   '@11c41 DS:1c3e,1f3c
GOTO L_11caf   '@11c61
L_11c69:
V_1a48! = FX##(V_189e%) * V_1a3c! / 100.0   '@11c69 DS:1c3e
V_1a4c! = FX##(V_189e%) * V_1a40! * 2.0 / 100.0   '@11c87 DS:1c3e,1f40
L_11caf:
V_1aa6! = 320.0 / FX##(V_1a48!)   '@11caf DS:1f44
L_BP0c% = (V_0dcc$ = "EGA")   '@11cc5 DS:1ef4
L_BP0e% = (V_0dcc$ = "CGA")   '@11cea DS:1efc,1f04,1f08,1f10
V_11d8! = (FX##(-(V_0dcc$ = "VGA" OR L_BP0c%) * 344) / 350.0 - FX##((V_0dcc$ = "HER") * 344) / 350.0 - (V_0dcc$ = "MCGA" OR L_BP0e%)) * 200.0   '@11d4e DS:1f18,1f48
V_1aaa! = 2.0 * FX##(V_11d8!) / V_1a4c!   '@11d70 DS:1f40
V_1a30! = FX##(V_1a3c!) / V_1a40!   '@11d8b
RT_LPTABRE: RT_LPS V_0e00$   '@11da1
V_186a! = V_1a5c!   '@11db9
L_11dd0:
V_1866! = V_1a50!   '@11dd0
RT_LPTABRE: RT_LPS CHR$(12): RT_LPFIM   '@11de1
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11dfa DS:1ad0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@11e0d DS:1ad0
L_11e26:
RT_CLS 0   '@11e26
V_1a9e! = 0.0   '@11e33 DS:1f24
V_1aae! = V_1866!   '@11e44
V_1ab6! = FX##(V_1866!) + V_1a48!   '@11e55
V_1ab2! = FX##(V_186a!) - V_1a4c!   '@11e6b
V_1aba! = V_186a! - FX##(V_1a4c!) / 2.0   '@11e81 DS:1f40
L_BP0c% = (V_0dcc$ = "EGA")   '@11e9f DS:1ef4
L_BP0e% = -(V_0dcc$ = "VGA" OR L_BP0c%) * 640   '@11ec4 DS:1efc
L_BP10% = L_BP0e% - (V_0dcc$ = "HER") * 720   '@11ee6 DS:1f08
L_BP12% = (V_0dcc$ = "CGA")   '@11f06 DS:1f10
V_1886! = -((V_0dcc$ = "MCGA" OR L_BP12%) * 640 - L_BP10%)   '@11f1e DS:1f18
L_BP0c% = (V_0dcc$ = "EGA")   '@11f42 DS:1ef4
L_BP0e% = -(V_0dcc$ = "VGA" OR L_BP0c%) * 344   '@11f67 DS:1efc
L_BP10% = L_BP0e% - (V_0dcc$ = "HER") * 344   '@11f89 DS:1f08
L_BP12% = (V_0dcc$ = "CGA")   '@11fa9 DS:1f10
V_188a! = -((V_0dcc$ = "MCGA" OR L_BP12%) * 200 - L_BP10%)   '@11fc1 DS:1f18
RT_VIEW 1, (0), (0), (RT_CINT%(0.5 * FX##(V_1886!) - 1.0)), (RT_CINT%(FX##(V_188a!) - 1.0)), (-1), (-1)   '@11fe5 DS:1f4c,1f50 (B$VIEW decodificado)
L_BP0c% = (V_0dcc$ = "EGA")   '@1201e DS:1ef4
L_BP0e% = (V_0dcc$ = "CGA")   '@12043 DS:1efc,1f04,1f08,1f10
V_11d8! = INT((FX##(-(V_0dcc$ = "VGA" OR L_BP0c%) * 343) / 350.0 - FX##((V_0dcc$ = "HER") * 343) / 350.0 - (V_0dcc$ = "MCGA" OR L_BP0e%)) * 199.0)   '@120a7 DS:1f18,1f20
RT_LINE 0.0, V_11d8!, 320.0, V_11d8!, 9, RT_CINT%(FX##(V_1a92!)), 0   '@120d0 DS:1f24,1f44
GOSUB L_1276b   '@12116
V_11dc! = 0.0   '@12123 DS:1f24
GOSUB L_127a7   '@12134
V_1a9e! = 320.0   '@12141 DS:1f44
V_1ab2! = V_186a! - FX##(V_1a4c!) / 2.0   '@12152 DS:1f40
V_1aba! = V_186a!   '@12170
L_BP0c% = (V_0dcc$ = "EGA")   '@12181 DS:1ef4
L_BP0e% = -(V_0dcc$ = "VGA" OR L_BP0c%) * 640   '@121a6 DS:1efc
L_BP10% = L_BP0e% - (V_0dcc$ = "HER") * 720   '@121c8 DS:1f08
L_BP12% = (V_0dcc$ = "CGA")   '@121e8 DS:1f10
V_1886! = -((V_0dcc$ = "MCGA" OR L_BP12%) * 640 - L_BP10%)   '@12200 DS:1f18
L_BP0c% = (V_0dcc$ = "EGA")   '@12224 DS:1ef4
L_BP0e% = -(V_0dcc$ = "VGA" OR L_BP0c%) * 345   '@12249 DS:1efc
L_BP10% = L_BP0e% - (V_0dcc$ = "HER") * 345   '@1226b DS:1f08
L_BP12% = (V_0dcc$ = "CGA")   '@1228b DS:1f10
V_188a! = -((V_0dcc$ = "MCGA" OR L_BP12%) * 200 - L_BP10%)   '@122a3 DS:1f18
RT_VIEW 1, (RT_CINT%(0.5 * FX##(V_1886!))), (0), (RT_CINT%(FX##(V_1886!) - 1.0)), (RT_CINT%(FX##(V_188a!) - 1.0)), (-1), (-1)   '@122c7 DS:1f4c,1f50 (B$VIEW decodificado)
GOSUB L_1276b   '@1230a
V_11dc! = 1.0   '@12317 DS:1b2a
GOSUB L_127a7   '@12328
RT_ROTINA_0C66   '@12335 (rotina em assembly ligada ao EXE (SUB_40c66); gerada no fim do programa)
V_1866! = FX##(V_1866!) + V_1a48!   '@1233f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_1a58!) + V_188e! <= FX##(V_1866!)) THEN GOTO L_11e26   '@12355
V_186a! = FX##(V_186a!) - V_1a4c!   '@12375
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
IF NOT (FX##(V_1a54!) - V_1892! > FX##(V_186a!)) THEN GOTO L_11dd0   '@1238b
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@123ab DS:1ad0
RT_LPTABRE: RT_LPS V_0df8$   '@123be
RT_LPTABRE: RT_LPS V_0dfc$: RT_LPFIM   '@123d6
RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@123e9 (sem argumentos (B$WIN0/B$VEW0))
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10a62   '@123f3
L_12403:
IF NOT (V_18a0$ <> "Z") THEN GOTO L_12427   '@12403 DS:1f54
IF NOT (V_18a0$ = "z") THEN GOTO L_12577   '@12415 DS:1f5a
L_12427:
RT_VIEWPRINT 23, 25   '@12427
RT_CLS 2   '@12439
RT_VIEWPRINT 1, 25   '@12447
LOCATE 24, 1   '@12459
PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@12474 DS:1f60
V_0e1c$ = "ZOOM"   '@12482 DS:1fae
CALL MIXT_07f1_LimpaTeclado   '@12494
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1249e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_18b4$ = V_0e0c$   '@124ba
IF NOT (V_18b4$ <> "D") THEN GOTO L_124f5   '@124cc DS:1c1a
IF NOT (V_18b4$ = "d") THEN GOTO L_1252e   '@124e3 DS:1c20
L_124f5:
CALL S_26313   '@124f5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "FIM") THEN GOTO L_1251e   '@124ff DS:1c26
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@12516
L_1251e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b0e   '@1251e
L_1252e:
IF NOT (V_18b4$ <> "T") THEN GOTO L_12552   '@1252e DS:1c2e
IF NOT (V_18b4$ = "t") THEN GOTO L_12562   '@12540 DS:1c34
L_12552:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10a62   '@12552
L_12562:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@12562
L_12577:
IF NOT (V_18a0$ <> "C") THEN GOTO L_1259b   '@12577 DS:1fb6
IF NOT (V_18a0$ = "c") THEN GOTO L_1270b   '@12589 DS:1fbc
L_1259b:
RT_VIEWPRINT 23, 25   '@1259b
RT_CLS 2   '@125ad
PRINT " Ajuste a Impressora para inicio da Impressao"   '@125bb DS:1e8c
PRINT " Sigo com a Impressao da Tela N/*S* ";   '@125c9 DS:1fc2
CALL MIXT_07f1_LimpaTeclado   '@125d7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@125e1 DS:1ad0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_12620   '@125fb DS:1d70
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@12618
L_12620:
RT_CLS 2   '@12620
RT_VIEWPRINT 1, 25   '@1262e
V_18b8! = 10.0   '@12640 DS:1fea
V_18bc! = 195.0   '@12652 DS:1fee
V_18c0$ = "Forma:" + V_0e32$   '@1265d DS:1ff2
V_18c4$ = "GGA"   '@12674 DS:1ffc
CALL MIXT_08c4_TextoGrafico(V_18b8!, V_18bc!, V_18c0$, V_18c4$)   '@12681
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
' @12696 libera strings locais (V_18c0)
' @1269f libera strings locais (V_18c4)
RT_LPTABRE: RT_LPS V_0e00$: RT_LPFIM   '@126a8
RT_ROTINA_0AEA   '@126bb (rotina em assembly ligada ao EXE (SUB_40aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@126c5 DS:1ad0
RT_LPTABRE: RT_LPS V_0df8$   '@126d8
RT_LPTABRE: RT_LPS V_0dfc$: RT_LPFIM   '@126f0
GOTO L_1275e   '@12703
L_1270b:
IF NOT (V_18a0$ <> "F") THEN GOTO L_1272f   '@1270b DS:2004
IF NOT (V_18a0$ = "f") THEN GOTO L_12751   '@1271d DS:200a
L_1272f:
V_0e0c$ = "FORMA"   '@1272f DS:2010
GOTO L_14bb7   '@12741
L_12751:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10bb7   '@12751
L_1275e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10b63   '@1275e
' ---- F_12766 @0x12766  (012766_F_12766.lift.txt; evidence_id (assembly): ev_413c3a8cc6d6c36e63dd8cf7fd789163f7d897109cbb9122cb0876d5e493b5f5)
L_1276b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMIMP
CALL S_21425   '@12770
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
CALL S_24b48   '@1277a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
CALL S_216c7   '@12784
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
CALL S_20f50   '@1278e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
RETURN   '@12798
L_127a7:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMIMP
IF NOT (V_1556$ = "S") THEN GOTO L_12c45   '@127ac DS:1b2e
V_18c8! = A_17a6%(0, 0)   '@127c3
FOR V_11b8! = 1.0 TO V_18c8!   '@127e8 DS:1b2a
IF NOT (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) <= V_1a5c! AND (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) >= V_1a54! AND (A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) <= V_1a58! AND A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) >= V_1a50!))) THEN GOTO L_12c14   '@127f0
V_0e0c$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@128e6
V_11d4! = (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)) - V_1aae!) * V_1aa6! - FX##(LEN(V_0e0c$)) * V_1a44! / 2.0 + V_1a9e!   '@1291e DS:1f40
V_11d8! = V_1aa2! - (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)) - V_1ab2!) * V_1aaa!   '@12976
IF NOT (V_11dc! = 0.0) THEN GOTO L_129e7   '@129b7 DS:1f24
GOSUB L_14082   '@129d2
GOTO L_129f9   '@129df
L_129e7:
GOSUB L_14404   '@129e7
L_129f9:
IF NOT (V_155a$ = "S") THEN GOTO L_12c0f   '@129f9 DS:1b2e
V_18cc! = 1.0   '@12a10 DS:1b2a
V_11c0! = 0.0   '@12a21 DS:1f24
L_12a38:
IF NOT (A_0f5e!(RT_CINT%(FX##(V_18cc!)), 1) = 2.0) THEN GOTO L_12a8b   '@12a38 DS:1f40
V_11c0! = FX##(V_11c0!) + 1.0   '@12a6d DS:1b2a
GOTO L_12bec   '@12a83
L_12a8b:
IF NOT (FX##(V_18cc!) - V_11c0! = FX##(V_11b8!)) THEN GOTO L_12be7   '@12a8b
IF NOT (A_0f5e!(RT_CINT%(FX##(V_18cc!)), 1) = 0.0) THEN GOTO L_12bda   '@12aab DS:1f24
V_0e0c$ = "h=" + LTRIM$(STR$(A_115e!(RT_CINT%(FX##(V_18cc!)), 0)))   '@12ae0 DS:201a
V_11d4! = (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)) - V_1aae!) * V_1aa6! - FX##(LEN(V_0e0c$)) * V_1a44! / 2.0 + V_1a9e!   '@12b25 DS:1f40
V_11d8! = V_11d8! + 9.09090900421142578125##   '@12b7d DS:2020
IF NOT (V_11dc! = 0.0) THEN GOTO L_12bc3   '@12b93 DS:1f24
GOSUB L_14082   '@12bae
GOTO L_12bd5   '@12bbb
L_12bc3:
GOSUB L_14404   '@12bc3
L_12bd5:
L_12bda:
GOTO L_12c0a   '@12bda
L_12be7:
L_12bec:
V_18cc! = FX##(V_18cc!) + 1.0   '@12bec DS:1b2a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_12a38   '@12c02
L_12c0a:
L_12c0f:
L_12c14:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@12c14 DS:1b2a
L_12c45:
IF NOT (V_1566$ = "S") THEN GOTO L_12ebe   '@12c45 DS:1b2e
V_18d0! = A_15da!(0, 0)   '@12c5c
FOR V_11b8! = 1.0 TO V_18d0!   '@12c7d DS:1b2a
IF NOT (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) <= V_1a5c! AND (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) >= V_1a54! AND (A_174a%(RT_CINT%(FX##(V_11b8!)), 0) <= V_1a58! AND A_174a%(RT_CINT%(FX##(V_11b8!)), 0) >= V_1a50!))) THEN GOTO L_12e71   '@12c84
V_11d4! = (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_1aae!) * V_1aa6! + V_1a9e!   '@12d7a
V_11d8! = V_1aa2! - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_1ab2!) * V_1aaa!   '@12db7
V_0e0c$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@12df8
IF NOT (V_11dc! = 0.0) THEN GOTO L_12e5a   '@12e2a DS:1f24
GOSUB L_14082   '@12e45
GOTO L_12e6c   '@12e52
L_12e5a:
GOSUB L_14404   '@12e5a
L_12e6c:
L_12e71:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@12e71 DS:1b2a
IF NOT (V_156a$ = "S") THEN GOTO L_12eb9   '@12e9d DS:1b2e
L_12eb9:
L_12ebe:
IF NOT (V_155e$ = "S") THEN GOTO L_13166   '@12ebe DS:1b2e
V_18d4! = A_157e%(0)   '@12ed5
FOR V_11b8! = 1.0 TO V_18d4!   '@12ef9 DS:1b2a
IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_13135   '@12f00
IF NOT (A_1778%(RT_CINT%(FX##(V_11b8!)), 1) <= V_1a5c! AND (A_1778%(RT_CINT%(FX##(V_11b8!)), 1) >= V_1a54! AND (A_1778%(RT_CINT%(FX##(V_11b8!)), 0) <= V_1a58! AND A_1778%(RT_CINT%(FX##(V_11b8!)), 0) >= V_1a50!))) THEN GOTO L_13114   '@12f27
V_11d4! = (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_1aae!) * V_1aa6! + V_1a9e!   '@1301d
V_11d8! = V_1aa2! - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_1ab2!) * V_1aaa!   '@1305a
V_0e0c$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@1309b
IF NOT (V_11dc! = 0.0) THEN GOTO L_130fd   '@130cd DS:1f24
GOSUB L_14082   '@130e8
GOTO L_1310f   '@130f5
L_130fd:
GOSUB L_14404   '@130fd
L_1310f:
L_13114:
IF NOT (V_1562$ = "S") THEN GOTO L_13130   '@13114 DS:1b2e
L_13130:
L_13135:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@13135 DS:1b2a
L_13166:
IF NOT (V_156e$ = "S") THEN GOTO L_14073   '@13166 DS:1b2e
IF NOT (V_1802% = 0) THEN GOTO L_13196   '@1317d
RETURN   '@1318c
L_13196:
V_187e! = FX##(V_189e%) + V_1a58!   '@13196
V_1882! = V_1a54!   '@131af
V_18d8! = A_1804!(0, 0)   '@131c0
FOR V_11b8! = 1.0 TO V_18d8!   '@131e1 DS:1b2a
V_18dc% = RT_CINT%(FX##(A_1804!(RT_CINT%(FX##(V_11b8!)), 4)))   '@131e8
V_18de! = A_1804!(RT_CINT%(FX##(V_11b8!)), 5)   '@13214
V_18e2! = A_1804!(RT_CINT%(FX##(V_11b8!)), 0)   '@1323f
IF NOT (V_18e2! = 0.0) THEN GOTO L_13948   '@13269 DS:1f24
V_11e4! = 1.0   '@13284 DS:1b2a
L_1329a:
IF NOT (V_11e4! <= V_18de!) THEN GOTO L_13940   '@1329b
V_18e6! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 0)   '@132b0 DS:1f50
V_18ea! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 1)   '@132ee DS:1f50
V_18ee! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 2)   '@1332d DS:1f50
V_18f2! = V_18e6!   '@13369
IF NOT (V_18f2! = -1.0) THEN GOTO L_133db   '@1337a DS:1f50
V_187a! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(V_18ea!)), 0)) * 1000.0)) / 10.0   '@13395 DS:1fea,2024
GOTO L_13511   '@133d3
L_133db:
IF NOT (V_18f2! = -2.0) THEN GOTO L_134a3   '@133dc DS:2028
V_11ec! = -V_18ea!   '@133f1
CALL S_25910   '@13405
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_18ea!))), V_13aa%, 6) = 2) THEN GOTO L_13466   '@1340f
V_187a! = V_11d8!   '@1344d
GOTO L_1349b   '@1345e
L_13466:
V_187a! = FX##(A_16ee!(RT_CINT%(FX##(V_18ee!)), 1)) + V_11d8!   '@13466
L_1349b:
GOTO L_13511   '@1349b
L_134a3:
IF NOT (V_18f2! = -3.0) THEN GOTO L_134f3   '@134a4 DS:202c
V_187a! = A_1664!(RT_CINT%(FX##(V_18ea!)), RT_CINT%(FX##(V_18ee!)))   '@134b9
GOTO L_13511   '@134eb
L_134f3:
IF NOT (V_18f2! = -4.0) THEN GOTO L_13511   '@134f4 DS:2030
GOTO L_13511   '@13509
L_13511:
IF NOT (V_11e4! = 1.0) THEN GOTO L_135cd   '@13511 DS:1b2a
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 1) <> -1000.0) THEN GOTO L_13594   '@1352c DS:1f28
V_186e! = A_1804!(RT_CINT%(FX##(V_11b8!)), 1)   '@13561
GOTO L_135c8   '@1358c
L_13594:
V_187e! = FX##(V_189e%) * 2.5 + V_187e!   '@13594 DS:2034
V_186e! = V_187e!   '@135b2
L_135c8:
L_135cd:
IF NOT (V_11e4! = 1.0) THEN GOTO L_13601   '@135cd DS:1b2a
V_1872! = V_187a!   '@135e8
GOTO L_137a8   '@135f9
L_13601:
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!), 0, 0   '@13601
RT_LINE 0, 0, RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_187a!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a96!)), 0   '@1364f
V_0e0c$ = LTRIM$(STR$(RT_SNG!(FX##(RT_CINT%((FX##(V_187a!) - V_1872!) * 10.0)) / 10.0)))   '@136af DS:1fea
V_11d4! = (FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e! + FX##(V_1a44!) / 2.0   '@136f1 DS:1f40
V_11d8! = V_1aa2! - ((FX##(V_1872!) + V_187a!) / 2.0 - V_1ab2!) * V_1aaa! + 4.0   '@1371e DS:1b38,1f40
IF NOT (V_11dc! = 0.0) THEN GOTO L_13780   '@13750 DS:1f24
GOSUB L_14082   '@1376b
GOTO L_13792   '@13778
L_13780:
GOSUB L_14404   '@13780
L_13792:
V_1872! = V_187a!   '@13792
L_137a8:
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! - 7.0 + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!), 0, 0   '@137a8 DS:2038
RT_LINE 0, 0, RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e! + 7.0), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a96!)), 0   '@137fb DS:203c
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! - 5.0 + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! + 2.0), 0, 0   '@13860 DS:1f40,2040
RT_LINE 0, 0, RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e! + 5.0), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! - 2.0), 8, RT_CINT%(FX##(V_1a96!)), 0   '@138b8 DS:2028,2044
V_11e4! = FX##(V_11e4!) + 1.0   '@13922 DS:1b2a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_1329a   '@13938
L_13940:
GOTO L_14042   '@13940
L_13948:
IF NOT (V_18e2! = 1.0) THEN GOTO L_14024   '@13949 DS:1b2a
V_11e4! = 1.0   '@1395e DS:1b2a
L_13974:
IF NOT (V_11e4! <= V_18de!) THEN GOTO L_1401c   '@13975
V_18e6! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 0)   '@1398a DS:1f50
V_18ea! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 1)   '@139c8 DS:1f50
V_18ee! = A_1832%(RT_CINT%(V_18dc% + (FX##(V_11e4!) - 1.0)), 2)   '@13a07 DS:1f50
V_18f6! = V_18e6!   '@13a43
IF NOT (V_18f6! = -1.0) THEN GOTO L_13ab6   '@13a54 DS:1f50
V_1876! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(V_18ea!)), 1)) * 1000.0)) / 10.0   '@13a6f DS:1fea,2024
GOTO L_13beb   '@13aae
L_13ab6:
IF NOT (V_18f6! = -2.0) THEN GOTO L_13b7d   '@13ab7 DS:2028
V_11ec! = -V_18ea!   '@13acc
CALL S_25910   '@13ae0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_18ea!))), V_13aa%, 6) = 2) THEN GOTO L_13b41   '@13aea
V_1876! = V_11d4!   '@13b28
GOTO L_13b75   '@13b39
L_13b41:
V_1876! = FX##(A_16ee!(RT_CINT%(FX##(V_18ee!)), 0)) + V_11d4!   '@13b41
L_13b75:
GOTO L_13beb   '@13b75
L_13b7d:
IF NOT (V_18f6! = -3.0) THEN GOTO L_13bcd   '@13b7e DS:202c
V_1876! = A_1664!(RT_CINT%(FX##(V_18ea!)), RT_CINT%(FX##(V_18ee!)))   '@13b93
GOTO L_13beb   '@13bc5
L_13bcd:
IF NOT (V_18f6! = -4.0) THEN GOTO L_13beb   '@13bce DS:2030
GOTO L_13beb   '@13be3
L_13beb:
IF NOT (V_11e4! = 1.0) THEN GOTO L_13c9f   '@13beb DS:1b2a
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 2) <> -1000.0) THEN GOTO L_13c68   '@13c06 DS:1f28
V_1872! = A_1804!(RT_CINT%(FX##(V_11b8!)), 2)   '@13c38
GOTO L_13c9a   '@13c60
L_13c68:
V_1882! = FX##(V_1882!) - V_189e%   '@13c68
V_1872! = V_1882!   '@13c84
L_13c9a:
L_13c9f:
IF NOT (V_11e4! = 1.0) THEN GOTO L_13cd3   '@13c9f DS:1b2a
V_186e! = V_1876!   '@13cba
GOTO L_13e83   '@13ccb
L_13cd3:
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!), 0, 0   '@13cd3
RT_LINE 0, 0, RT_SNG!((FX##(V_1876!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a96!)), 0   '@13d21
V_0e0c$ = LTRIM$(STR$(RT_SNG!(FX##(RT_CINT%((FX##(V_1876!) - V_186e!) * 10.0)) / 10.0)))   '@13d81 DS:1fea
V_11d4! = ((FX##(V_186e!) + V_1876!) / 2.0 - V_1aae!) * V_1aa6! - FX##(LEN(V_0e0c$)) * V_1a44! / 2.0 + V_1a9e!   '@13dc3 DS:1f40
V_11d8! = V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa!   '@13e08
IF NOT (V_11dc! = 0.0) THEN GOTO L_13e5b   '@13e2b DS:1f24
GOSUB L_14082   '@13e46
GOTO L_13e6d   '@13e53
L_13e5b:
GOSUB L_14404   '@13e5b
L_13e6d:
V_186e! = V_1876!   '@13e6d
L_13e83:
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! + 5.0), 0, 0   '@13e83 DS:2044
RT_LINE 0, 0, RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! - 5.0), 8, RT_CINT%(FX##(V_1a96!)), 0   '@13ed6 DS:2040
RT_PSET RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! + V_1a9e! + 3.0), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! + 4.0), 0, 0   '@13f3b DS:1b38,1b3c
RT_LINE 0, 0, RT_SNG!((FX##(V_186e!) - V_1aae!) * V_1aa6! - 3.0 + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(V_1872!) - V_1ab2!) * V_1aaa! - 4.0), 8, RT_CINT%(FX##(V_1a96!)), 0   '@13f93 DS:202c,2030
V_11e4! = FX##(V_11e4!) + 1.0   '@13ffd DS:1b2a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_13974   '@14013
L_1401c:
GOTO L_14042   '@1401c
L_14024:
IF NOT (V_18e2! = 2.0) THEN GOTO L_14042   '@14025 DS:1f40
GOTO L_14042   '@1403a
L_14042:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@14042 DS:1b2a
L_14073:
RETURN   '@14073
L_14082:   ' sub-rotina (alvo de GOSUB)
V_11d4! = FX##(RT_CINT%(FX##(V_11d4!) / V_1a44!)) * V_1a44!   '@14087
IF NOT (V_1866! <= 0.0 AND V_11d4! < 0.0) THEN GOTO L_140fb   '@140ac DS:1f24
V_11d4! = 2.0   '@140ea DS:1f40
L_140fb:
L_BP0c% = (FX##(V_1a34!) / 2.0 - 1.0 <= FX##(V_11d4!))   '@140fb DS:1f24,1f40,1f50
IF NOT ((FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! <= FX##(0.0) OR L_BP0c%) <> 0) THEN GOTO L_14164   '@1412f
RETURN   '@1415a
L_14164:
IF NOT (V_11d4! < 0.0) THEN GOTO L_141c4   '@14164 DS:1f24
V_0e0c$ = RT_MID2$((V_0e0c$), (RT_CINT%(-V_11d4! / FX##(V_1a44!) + 1.0)))   '@1417f DS:1b2a
V_11d4! = 0.0   '@141b3 DS:1f24
L_141c4:
IF NOT (FX##(V_1866!) + V_1a48! < FX##(V_1a58!) AND FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! > FX##(V_1a34!) / 2.0 - 1.0) THEN GOTO L_1425a   '@141c4 DS:1f40,1f50
V_0e0c$ = RT_MID$((V_0e0c$), (1), (RT_CINT%((FX##(V_1a34!) / 2.0 - V_11d4!) / V_1a44!)))   '@14224 DS:1f40
L_1425a:
IF NOT (FX##(V_1866!) + V_1a48! >= FX##(V_1a58!) AND FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! > FX##(V_1a34!) / 2.0 - 2.0) THEN GOTO L_142eb   '@1425a DS:1f40,2028
V_11d4! = FX##(V_1a34!) / 2.0 - 3.0 - FX##(LEN(V_0e0c$)) * V_1a44!   '@142ba DS:1f40,202c
L_142eb:
IF NOT (V_11d8! < 7.0 AND V_11d8! > 0.0) THEN GOTO L_1433a   '@142eb DS:1f24,203c
V_11d8! = 8.0   '@14329 DS:2048
L_1433a:
IF NOT (FX##(V_11d8!) > 195.600006103515625## AND V_1a38! > 200.0) THEN GOTO L_14382   '@1433a DS:1f48,204c
RETURN   '@14378
L_14382:
RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@14382 (sem argumentos (B$WIN0/B$VEW0))
V_18fa$ = "CGA"   '@1438c DS:1f10
CALL MIXT_08c4_TextoGrafico(V_11d4!, V_11d8!, V_0e0c$, V_18fa$)   '@1439e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
' @143b3 libera strings locais (V_18fa)
RT_VIEW 1, (0), (0), (RT_CINT%(0.5 * FX##(V_1886!) - 1.0)), (RT_CINT%(FX##(V_188a!) - 1.0)), (-1), (-1)   '@143bc DS:1f4c,1f50 (B$VIEW decodificado)
RETURN   '@143f5
L_14404:   ' sub-rotina (alvo de GOSUB)
V_11d4! = FX##(RT_CINT%(FX##(V_11d4!) / V_1a44!)) * V_1a44!   '@14409
IF NOT (V_1866! <= 0.0 AND V_11d4! < 320.0) THEN GOTO L_1447d   '@1442e DS:1f24,1f44
V_11d4! = 322.0   '@1446c DS:2050
L_1447d:
L_BP0c% = (V_11d4! >= 639.0)   '@1447d DS:1f44,2054
IF NOT ((FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! <= FX##(320.0) OR L_BP0c%) <> 0) THEN GOTO L_144dc   '@144a7
RETURN   '@144d2
L_144dc:
IF NOT (V_11d4! < 320.0) THEN GOTO L_1453e   '@144dc DS:1f44
V_0e0c$ = RT_MID2$((V_0e0c$), (RT_CINT%((320.0 - FX##(V_11d4!)) / V_1a44! + 1.0)))   '@144f7 DS:1b2a,1f44
V_11d4! = 320.0   '@1452d DS:1f44
L_1453e:
IF NOT (FX##(V_1866!) + V_1a48! < FX##(V_1a58!) AND FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! > FX##(639.0)) THEN GOTO L_145c5   '@1453e DS:2054
V_0e0c$ = RT_MID$((V_0e0c$), (1), (RT_CINT%((640.0 - FX##(V_11d4!)) / V_1a44!)))   '@14594 DS:2058
L_145c5:
IF NOT (FX##(V_1866!) + V_1a48! >= FX##(V_1a58!) AND FX##(LEN(V_0e0c$)) * V_1a44! + V_11d4! > FX##(638.0)) THEN GOTO L_14642   '@145c5 DS:205c
V_11d4! = 637.0 - FX##(LEN(V_0e0c$)) * V_1a44!   '@1461b DS:2060
L_14642:
IF NOT (V_11d8! < 7.0 AND V_11d8! > 0.0) THEN GOTO L_14691   '@14642 DS:1f24,203c
V_11d8! = 8.0   '@14680 DS:2048
L_14691:
IF NOT (FX##(V_11d8!) > 195.600006103515625## AND V_1a38! > 200.0) THEN GOTO L_146d9   '@14691 DS:1f48,204c
RETURN   '@146cf
L_146d9:
RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@146d9 (sem argumentos (B$WIN0/B$VEW0))
V_18fe$ = "CGA"   '@146e3 DS:1f10
CALL MIXT_08c4_TextoGrafico(V_11d4!, V_11d8!, V_0e0c$, V_18fe$)   '@146f5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
' @1470a libera strings locais (V_18fe)
RT_VIEW 1, (RT_CINT%(0.5 * FX##(V_1886!))), (0), (RT_CINT%(FX##(V_1886!) - 1.0)), (RT_CINT%(FX##(V_188a!) - 1.0)), (-1), (-1)   '@14713 DS:1f4c,1f50 (B$VIEW decodificado)
RETURN   '@14756
L_14765:   ' entrada vinda de 010030_M_FORMIMP
RESUME L_1477c   '@1476a
L_1477c:
GOSUB L_147a5   '@14781
CALL S_1532c   '@1478e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_10a22   '@14798
' ---- F_147a0 @0x147a0  (0147a0_F_147a0.lift.txt; evidence_id (assembly): ev_c0de39cb06e452fb18135cafb426cca767677bb645b5372e544f087e25a81694)
L_147a5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMIMP, 012766_F_12766
FOR V_1902! = 1.0 TO 10.0   '@147aa DS:1b2a,1fea
ON KEY(RT_CINT%(FX##(V_1902!))) GOSUB L_14a4b
RT_ONKEY RT_CINT%(FX##(V_1902!)), 1   '@147b8
KEY(RT_CINT%(FX##(V_1902!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1902!)), 1   '@147d2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_1902!   '@147e7 DS:1b2a,1fea
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@14810
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@14838
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@14860
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@14888
FOR V_1902! = 15.0 TO 18.0   '@148b0 DS:1b2a,2064,2068
ON KEY(RT_CINT%(FX##(V_1902!))) GOSUB L_14a76
RT_ONKEY RT_CINT%(FX##(V_1902!)), 2   '@148be
KEY(RT_CINT%(FX##(V_1902!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1902!)), 1   '@148d8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_1902!   '@148ed DS:1b2a,2068
ON KEY(2) GOSUB L_14a76
RT_ONKEY 2, 2   '@14916
KEY(2) ON
RT_KEYESTADO 2, 1   '@14929
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@14937
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1495f
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@14987
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@149af
FOR V_1902! = 19.0 TO 22.0   '@149d6 DS:1b2a,206c,2070
ON KEY(RT_CINT%(FX##(V_1902!))) GOSUB L_14b74
RT_ONKEY RT_CINT%(FX##(V_1902!)), 3   '@149e4
KEY(RT_CINT%(FX##(V_1902!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_1902!)), 1   '@149fe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
NEXT V_1902!   '@14a13 DS:1b2a,2070
RETURN   '@14a3c
L_14a4b:
BEEP   '@14a50
GOSUB L_147a5   '@14a5a
RETURN   '@14a67
L_14a76:
RT_SCREEN 0   '@14a7b
RT_VIEWPRINT 1, 25   '@14a90
COLOR 7, 0, 0   '@14aa2
RT_CLS 0   '@14ac6
PRINT " Aguarde ..."   '@14ad3 DS:2074
PRINT ""   '@14ae1 DS:1ad0
PRINT " Retorno ao Modulo Basico de FORMA"   '@14aef DS:2084
V_157a$ = "FORMIMP"   '@14afd DS:20aa
ON ERROR GOTO L_14b3b
RT_ONERR = &H14b3b   '@14b0f
RT_CHAIN V_0e3a$ + "FORMA"   '@14b1e DS:2010
L_14b3b:
PRINT " Modulo nao encontrado em "; V_0e3a$   '@14b40 DS:20b6
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@14b57 DS:1aee
RT_FIM   '@14b65 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_14b74:
BEEP   '@14b79
GOSUB L_147a5   '@14b83
RT_SCREEN 0   '@14b90
RETURN L_10a22   '@14baf
' ---- FUN_1000_4bb7 @0x14bb7  (014bb7_FUN_1000_4bb7.lift.txt; evidence_id (assembly): ev_e338e565f84323f32cdf21c2426d22414608770e70b850743546168bfc2a51f7)
L_14bb7:   ' entrada vinda de 010030_M_FORMIMP
V_157a$ = "FORMIMP"   '@14bbc DS:20aa
ON ERROR GOTO L_14c47
RT_ONERR = &H14c47   '@14bce
V_11d4! = RT_FRE&("")   '@14bdd DS:1ad0
L_BP0c% = (LEN(V_0e3a$) > 3)   '@14bf7
CHDIR RT_ARQ$(RT_LEFT$((V_0e3a$), (LEN(V_0e3a$) + L_BP0c%)))   '@14c16
RT_CHAIN V_0e3a$ + V_0e0c$   '@14c2a
L_14c47:
RESUME L_14c5e   '@14c4c
L_14c5e:
L_BP0c% = (V_0e3a$ = "A:\")   '@14c63 DS:20d4
IF NOT ((V_0e3a$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_14cfd   '@14c88 DS:20dc
LOCATE 23, 10   '@14c9d
PRINT " Coloque o Disco FORMA no Drive "; V_0e3a$   '@14cbb DS:20e4
CALL MIXT_07f1_LimpaTeclado   '@14cd2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@14cdc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY pelo roteiro (entre comandos)
L_14cfd:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_14a4b, L_14a76, L_14b74   ' ON KEY no laco (B$EVCK)
GOTO L_14bb7   '@14cfd
' ---- M_FORMIMUX @0x20030  (020030_M_FORMIMUX.lift.txt; evidence_id (assembly): ev_6b069f3102fe13376920aabb2e320608feaec4e4217f54f6eb636091c4beb638)
' @20030 inicio do programa (B$?EVT)
GOTO L_20f48   '@20184
' ---- FUN_2000_0f48 @0x20f48  (020f48_FUN_2000_0f48.lift.txt; evidence_id (assembly): ev_a8340334b41df5bb96674ea9f0233e5409f2f64f4eff1c81f86c72b5d685d731)
L_20f48:   ' entrada vinda de 020030_M_FORMIMUX
GOTO L_2141d   '@20f48
' ---- FUN_2000_141d @0x2141d  (02141d_FUN_2000_141d.lift.txt; evidence_id (assembly): ev_58795f882c251cceb5b8745e174dda984f400cf6853dc11af2846e6dbc51f0dc)
L_2141d:   ' entrada vinda de 020f48_FUN_2000_0f48
GOTO L_216bf   '@2141d
' ---- FUN_2000_16bf @0x216bf  (0216bf_FUN_2000_16bf.lift.txt; evidence_id (assembly): ev_4126d314247d723488c07313ef0eaba5c53fbd1b69fa3260c799736c1a320e33)
L_216bf:   ' entrada vinda de 02141d_FUN_2000_141d
GOTO L_24b40   '@216bf
' ---- FUN_2000_4b40 @0x24b40  (024b40_FUN_2000_4b40.lift.txt; evidence_id (assembly): ev_563d8a3c6dc7285e9a220bc925a9b6c594cf830909fbb95edb9935fc15ac8df7)
L_24b40:   ' entrada vinda de 0216bf_FUN_2000_16bf
GOTO L_24de1   '@24b40
' ---- FUN_2000_4de1 @0x24de1  (024de1_FUN_2000_4de1.lift.txt; evidence_id (assembly): ev_be735670e90128994b4c504e6436ed84a4ae0812b5e6b17bd829f3124e166b55)
L_24de1:   ' entrada vinda de 024b40_FUN_2000_4b40
GOTO L_25908   '@24de1
' ---- FUN_2000_5908 @0x25908  (025908_FUN_2000_5908.lift.txt; evidence_id (assembly): ev_4862f035bd47e3ea5713310e4909896e8ed8bd7710550fd843bfccce9219b119)
L_25908:   ' entrada vinda de 024de1_FUN_2000_4de1
GOTO L_2630b   '@25908
' ---- FUN_2000_630b @0x2630b  (02630b_FUN_2000_630b.lift.txt; evidence_id (assembly): ev_2d678f15a72c0921e44b733889753888fb255389589d07246963aa5294e56077)
L_2630b:   ' entrada vinda de 025908_FUN_2000_5908
GOTO L_279e9   '@2630b
' ---- FUN_2000_79e9 @0x279e9  (0279e9_FUN_2000_79e9.lift.txt; evidence_id (assembly): ev_450c64b2560b7215e5b50ac0b3bdc2f4683677e43bacdd46938da4e57b511eff)
L_279e9:   ' entrada vinda de 02630b_FUN_2000_630b
RT_FIM   ' @279e9 B$CENP (inicio/fim do modulo)
'RETRAD? @279ee ?? 33 bytes sem caminho de entrada conhecido (dados/lixo, 17 instr.): ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL; ADD byte ptr [BX + SI], AL ...
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Rotina em assembly do EXE em 0x40aea (chamada por CALL SUB_40aea no lift).
' Versao A; DS do original: inicio DS:2406, CR LF DS:2400, fim DS:2403, margem em [DS:26F7], ESC L em [DS:23FE].
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

' Rotina em assembly do EXE em 0x40c66 (chamada por CALL SUB_40c66 no lift).
' Versao C; DS do original: inicio DS:271A, CR LF DS:2714, fim DS:2717, margem em [DS:29E9], ESC L em [DS:2712].
SUB RT_ROTINA_0C66
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
    REDIM A_1a60!(-32768 TO -32768, -32768 TO -32768)
    V_1866! = 0
    V_186a! = 0
    V_186e! = 0
    V_1872! = 0
    V_1876! = 0
    V_187a! = 0
    V_187e! = 0
    V_1882! = 0
    V_1886! = 0
    V_188a! = 0
    V_188e! = 0
    V_1892! = 0
    V_1896! = 0
    V_189a! = 0
    V_189e% = 0
    V_18a0$ = ""
    V_18a4$ = ""
    V_18a8! = 0
    V_18ac! = 0
    V_18b0! = 0
    V_18b4$ = ""
    V_18b8! = 0
    V_18bc! = 0
    V_18c0$ = ""
    V_18c4$ = ""
    V_18c8! = 0
    V_18cc! = 0
    V_18d0! = 0
    V_18d4! = 0
    V_18d8! = 0
    V_18dc% = 0
    V_18de! = 0
    V_18e2! = 0
    V_18e6! = 0
    V_18ea! = 0
    V_18ee! = 0
    V_18f2! = 0
    V_18f6! = 0
    V_18fa$ = ""
    V_18fe$ = ""
    V_1902! = 0
    V_1a08! = 0
    V_1a0c! = 0
    V_1a10! = 0
    V_1a14! = 0
    V_1a18! = 0
    V_1a1c! = 0
    V_1a20! = 0
    V_1a24! = 0
    V_1a28! = 0
    V_1a2c! = 0
    V_1a30! = 0
    V_1a34! = 0
    V_1a38! = 0
    V_1a3c! = 0
    V_1a40! = 0
    V_1a44! = 0
    V_1a48! = 0
    V_1a4c! = 0
    V_1a50! = 0
    V_1a54! = 0
    V_1a58! = 0
    V_1a5c! = 0
    V_1a8e! = 0
    V_1a92! = 0
    V_1a96! = 0
    V_1a9a! = 0
    V_1a9e! = 0
    V_1aa2! = 0
    V_1aa6! = 0
    V_1aaa! = 0
    V_1aae! = 0
    V_1ab2! = 0
    V_1ab6! = 0
    V_1aba! = 0
    V_1abe! = 0
    V_1ac2! = 0
    V_1ac6! = 0
    V_1aca! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_14a4b: BEEP; GOSUB L_147a5; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_14a76: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_14b74: sai da SUB (BEEP; GOSUB L_147a5; RT_SCREEN 0; RETURN L_10a22)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H14765: ON ERROR GOTO L_14765
        CASE &H14b3b: ON ERROR GOTO L_14b3b
        CASE &H14c47: ON ERROR GOTO L_14c47
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_14d0d   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x14d0d)
    DIM L_BP0e$
    ' ---- FUN_1000_4d0d @0x14d0d  (014d0d_FUN_1000_4d0d.lift.txt; evidence_id (assembly): ev_3721d6a514320778cef063b056ea71d1f6e78fa6f212bea75af33169a915cdcc)
    L_BP0e$ = V_0dcc$   '@14d15
    IF NOT (L_BP0e$ = "HER") THEN GOTO L_14df5   '@14d27 DS:1f08
    RT_SCREEN 3   '@14d3e
    V_1a8e! = 7.0   '@14d54 DS:203c
    V_1a92! = 7.0   '@14d65 DS:203c
    V_1a96! = 7.0   '@14d76 DS:203c
    V_1a9a! = 0.0   '@14d87 DS:1f24
    V_1a34! = 720.0   '@14d98 DS:2108
    V_1a38! = 344.0   '@14da9 DS:210c
    V_1a44! = 9.0   '@14dba DS:2110
    V_1a3c! = 1272.7249755859375##   '@14dcb DS:2114
    V_1a40! = 728.1300048828125##   '@14ddc DS:2118
    GOTO L_14fbe   '@14ded
L_14df5:
    IF NOT (L_BP0e$ <> "CGA") THEN GOTO L_14e19   '@14df5 DS:1f10
    IF NOT (L_BP0e$ = "MCG") THEN GOTO L_14ecd   '@14e07 DS:211c
L_14e19:
    RT_SCREEN 2   '@14e19
    V_1a8e! = 15.0   '@14e2c DS:2064
    V_1a92! = 15.0   '@14e3d DS:2064
    V_1a96! = 15.0   '@14e4e DS:2064
    V_1a9a! = 0.0   '@14e5f DS:1f24
    V_1a34! = 640.0   '@14e70 DS:2058
    V_1a38! = 200.0   '@14e81 DS:1f48
    V_1a44! = 8.0   '@14e92 DS:2048
    V_1a3c! = 1131.31005859375##   '@14ea3 DS:2124
    V_1a40! = 846.66998291015625##   '@14eb4 DS:2128
    GOTO L_14fbe   '@14ec5
L_14ecd:
    IF NOT (L_BP0e$ <> "EGA") THEN GOTO L_14ef1   '@14ecd DS:1ef4
    IF NOT (L_BP0e$ = "VGA") THEN GOTO L_14fbe   '@14edf DS:1efc
L_14ef1:
    RT_SCREEN 9   '@14ef1
    COLOR , 1   '@14f07
    V_1a8e! = 15.0   '@14f1d DS:2064
    V_1a92! = 14.0   '@14f2e DS:212c
    V_1a96! = 12.0   '@14f3f DS:1f34
    V_1a9a! = 1.0   '@14f50 DS:1b2a
    V_1a34! = 640.0   '@14f61 DS:2058
    V_1a38! = 344.0   '@14f72 DS:210c
    V_1a44! = 8.0   '@14f83 DS:2048
    V_1a3c! = 1131.31005859375##   '@14f94 DS:2124
    V_1a40! = 728.1300048828125##   '@14fa5 DS:2118
    GOTO L_14fbe   '@14fb6
L_14fbe:
    V_1a9e! = 40.0   '@14fbe DS:2130
    V_1aa2! = 165.0   '@14fcf DS:2134
    V_1aa6! = 560.0 / (FX##(V_1ab6!) - V_1aae!)   '@14fe0 DS:2138
    V_1aaa! = 145.0 / (FX##(V_1aba!) - V_1ab2!)   '@14ffe DS:213c
    IF NOT (FX##(V_1aaa!) / V_1aa6! > 0.41670000553131103515625##) THEN GOTO L_1505a   '@1501c DS:2140
    V_1aaa! = V_1aa6! * 0.41670000553131103515625##   '@1503c DS:2140
    GOTO L_15075   '@15052
L_1505a:
    V_1aa6! = V_1aaa! / 0.41670000553131103515625##   '@1505a DS:2140
L_15075:
    RT_CLS 0   '@15075
    RT_WINDOW 1, (0), (0), (639), (199)   '@15082 DS:1f20,1f22,1f24,1f26,2054,2056 (B$WIND decodificado)
    ' @150b0 libera strings locais (L_BP0e)
    ' END SUB   '@150be
END SUB

SUB S_150ce   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x150ce)
    ' ---- FUN_1000_50ce @0x150ce  (0150ce_FUN_1000_50ce.lift.txt; evidence_id (assembly): ev_5117b82b3975dc4b4bae918dd54f723fbb580971ff5df7d509376b65d5e41237)
    IF NOT (V_1a1c! = V_1a24! OR V_1a0c! = V_1a14!) THEN GOTO L_15159   '@150d6
    V_1a2c! = V_1a0c!   '@15114
    IF NOT (V_1a1c! = V_1a24!) THEN GOTO L_15151   '@15125
    V_1a2c! = V_1a1c!   '@15140
L_15151:
    GOTO L_151f7   '@15151
L_15159:
    V_1a2c! = FX##(V_1a10!) - V_1a20! + ((FX##(V_1a20!) - V_1a18!) / (FX##(V_1a24!) - V_1a1c!) * V_1a24! - (FX##(V_1a10!) - V_1a08!) / (FX##(V_1a14!) - V_1a0c!) * V_1a14!)   '@15159
    V_1a2c! = V_1a2c! / ((FX##(V_1a20!) - V_1a18!) / (FX##(V_1a24!) - V_1a1c!) - (FX##(V_1a10!) - V_1a08!) / (FX##(V_1a14!) - V_1a0c!))   '@151ad
L_151f7:
    IF NOT (V_1a18! = V_1a20! OR V_1a08! = V_1a10!) THEN GOTO L_1527a   '@151f7
    V_1a28! = V_1a08!   '@15235
    IF NOT (V_1a18! = V_1a20!) THEN GOTO L_15272   '@15246
    V_1a28! = V_1a18!   '@15261
L_15272:
    GOTO L_15317   '@15272
L_1527a:
    IF NOT (V_1a0c! = V_1a14!) THEN GOTO L_152d5   '@1527a
    V_1a28! = V_1a20! - (FX##(V_1a24!) - V_1a2c!) * (FX##(V_1a20!) - V_1a18!) / (FX##(V_1a24!) - V_1a1c!)   '@15295
    GOTO L_15312   '@152cd
L_152d5:
    V_1a28! = V_1a10! - (FX##(V_1a14!) - V_1a2c!) * (FX##(V_1a10!) - V_1a08!) / (FX##(V_1a14!) - V_1a0c!)   '@152d5
L_15312:
L_15317:
    ' END SUB   '@15317
END SUB

SUB S_1532c   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1532c)
    ' ---- FUN_1000_532c @0x1532c  (01532c_FUN_1000_532c.lift.txt; evidence_id (assembly): ev_102029fa7dc83ef837385dc4a4183be9f8c482424cbe3b1dc6314901b61df4ba)
    BEEP   '@15334
    BEEP   '@1533e
    BEEP   '@15348
    RT_SCREEN 0   '@15352
    RT_VIEWPRINT 1, 25   '@15367
    RT_CLOSE   '@15379 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@15386 DS:1b38
    RT_CLS 0   '@153cb
    LOCATE 10, 1   '@153d8
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@153f3 DS:1ad0,2144
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@15413 DS:1ad0,215e
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@15433 DS:1ad0,218a
L_15458:
    CALL MIXT_07f1_LimpaTeclado   '@1545d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@15467
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@15483
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15458   '@1548d
    ' ---- F_15494 @0x15494  (015494_F_15494.lift.txt; evidence_id (assembly): ev_ee0d7c85b0b8a703679168d617f090768be6032d0b0a293e4542e5d6d2f9639e)
    ' END SUB   '@15494
END SUB

SUB S_2018c   ' entrada de SUB/FUNCTION (B$ENRA, locais 50 bytes) (0x2018c)
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
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    ' ---- FUN_2000_018c @0x2018c  (02018c_FUN_2000_018c.lift.txt; evidence_id (assembly): ev_0e7ad0ac4f2387e267158e221671ad2eb3ccf705bd022a5732e42c902c8879c1)
L_201a3:
    L_BP14% = 0   '@201a8
    L_BP28! = A_15da!(0, 0)   '@201b2
    FOR V_11b8! = 1.0 TO L_BP28!   '@201d2 DS:21b0
    IF NOT (NOT (A_1a60!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0 AND ((A_15da!(RT_CINT%(FX##(V_11b8!)), 3) <> -2.0 OR A_1a60!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0) AND (A_15da!(RT_CINT%(FX##(V_11b8!)), 0) <> -2.0 OR A_1a60!(RT_CINT%(FX##(V_11b8!)), 3) = 1.0)))) THEN GOTO L_202fb   '@201da DS:21b0,21b4,21b8
    GOTO L_20ef5   '@202f3
L_202fb:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@202fb
    IF NOT (V_11bc! <= 0.0) THEN GOTO L_20349   '@20326 DS:21b8
    GOTO L_20ef5   '@20341
L_20349:
    V_11ec! = -V_11b8!   '@20349
    CALL S_25910   '@2035d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@20367
    L_BP12! = V_11d8!   '@20377
    A_1a60!(RT_CINT%(FX##(V_11b8!)), 0) = 1.0   '@20387 DS:21b0
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_204da   '@203b1
    L_BP18! = L_BP0e! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@203e0 DS:21bc
    L_BP1c! = L_BP12! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@2041e DS:21bc
    L_BP20! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP0e!   '@2045c DS:21bc
    L_BP24! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP12!   '@20497 DS:21bc
    GOTO L_2075a   '@204d2
L_204da:
    L_BP18! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@204da
    L_BP1c! = FX##(A_16ee!(1, 1)) + L_BP12!   '@20500
    L_BP20! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@20524
    L_BP24! = FX##(A_16ee!(1, 1)) + L_BP12!   '@2054a
    L_BP2c! = A_16ee!(0, 0)   '@2056e
    FOR V_11c0! = 2.0 TO L_BP2c!   '@2058e DS:21b0,21bc
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! < FX##(L_BP18!)) THEN GOTO L_205fa   '@20596
    L_BP18! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@205cd
L_205fa:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! > FX##(L_BP20!)) THEN GOTO L_2065e   '@205fa
    L_BP20! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@20631
L_2065e:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! < FX##(L_BP1c!)) THEN GOTO L_206c4   '@2065e
    L_BP1c! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@20696
L_206c4:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! > FX##(L_BP24!)) THEN GOTO L_2072a   '@206c4
    L_BP24! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@206fc
L_2072a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@2072a DS:21b0
L_2075a:
    IF NOT (L_BP18! < V_1abe!) THEN GOTO L_20784   '@2075a
    V_1abe! = L_BP18!   '@20774
L_20784:
    IF NOT (L_BP20! > V_1ac6!) THEN GOTO L_207ae   '@20784
    V_1ac6! = L_BP20!   '@2079e
L_207ae:
    IF NOT (L_BP1c! < V_1ac2!) THEN GOTO L_207d8   '@207ae
    V_1ac2! = L_BP1c!   '@207c8
L_207d8:
    IF NOT (L_BP24! > V_1aca!) THEN GOTO L_20802   '@207d8
    V_1aca! = L_BP24!   '@207f2
L_20802:
    L_BP30! = A_15da!(0, 0)   '@20802
    FOR V_11c0! = 1.0 TO L_BP30!   '@20822 DS:21b0
    IF NOT (V_11c0! <> V_11b8!) THEN GOTO L_20bf4   '@2082a
    L_BP34! = A_15da!(RT_CINT%(FX##(V_11c0!)), 0)   '@20845
    IF NOT (L_BP34! = -2.0) THEN GOTO L_209ff   '@2086e DS:21b4
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_209f7   '@20888 DS:21c0
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_2095b   '@208fa
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 1) = L_BP0e!   '@20929
    GOTO L_209c7   '@20953
L_2095b:
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0), 0)) + L_BP0e!   '@2095b DS:21c0
L_209c7:
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 3) = 1.0   '@209c7 DS:21b0
L_209f7:
    GOTO L_20a1c   '@209f7
L_209ff:
    IF NOT (L_BP34! = -3.0) THEN GOTO L_20a1c   '@20a00 DS:21c4
    GOTO L_20a1c   '@20a14
L_20a1c:
    L_BP38! = A_15da!(RT_CINT%(FX##(V_11c0!)), 3)   '@20a1c
    IF NOT (L_BP38! = -2.0) THEN GOTO L_20bd2   '@20a46 DS:21b4
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_20bca   '@20a60 DS:21c0
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20b30   '@20ad2
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 2) = L_BP12!   '@20b01
    GOTO L_20b9a   '@20b28
L_20b30:
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0), 1)) + L_BP12!   '@20b30 DS:21c0
L_20b9a:
    A_1a60!(RT_CINT%(FX##(V_11c0!)), 4) = 1.0   '@20b9a DS:21b0
L_20bca:
    GOTO L_20bef   '@20bca
L_20bd2:
    IF NOT (L_BP38! = -3.0) THEN GOTO L_20bef   '@20bd3 DS:21c4
    GOTO L_20bef   '@20be7
L_20bef:
L_20bf4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20bf4 DS:21b0
    L_BP3c! = A_1664!(0, 0)   '@20c1f
    FOR V_11c0! = 1.0 TO L_BP3c!   '@20c3f DS:21b0
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = -2.0) THEN GOTO L_20d7e   '@20c46 DS:21b4
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = V_11b8!) THEN GOTO L_20d79   '@20c7a
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20d10   '@20caf
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = L_BP0e!   '@20cde
    GOTO L_20d74   '@20d08
L_20d10:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 2))), 0)) + L_BP0e!   '@20d10
L_20d74:
L_20d79:
L_20d7e:
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = -2.0) THEN GOTO L_20ebb   '@20d7e DS:21b4
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = V_11b8!) THEN GOTO L_20eb6   '@20db3
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20e49   '@20de8
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = L_BP12!   '@20e17
    GOTO L_20eb1   '@20e41
L_20e49:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 5))), 1)) + L_BP12!   '@20e49
L_20eb1:
L_20eb6:
L_20ebb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20ebb DS:21b0
    L_BP14% = 1   '@20ee6
L_20ef5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@20efa DS:21b0
    IF NOT (L_BP14% = 1) THEN GOTO L_20f3b   '@20f25
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_201a3   '@20f33
L_20f3b:
    ' END SUB   '@20f3b
END SUB

SUB S_20f50   ' entrada de SUB/FUNCTION (B$ENRA, locais 24 bytes) (0x20f50)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    ' ---- FUN_2000_0f50 @0x20f50  (020f50_FUN_2000_0f50.lift.txt; evidence_id (assembly): ev_42895bbfbd5b46c176f6fa759b2849f256c0ae0838ec0d3070ca486d668f2239)
    L_BP1e! = A_0e78!(0, 0)   '@20f5d
    FOR V_11ec! = 1.0 TO L_BP1e!   '@20f7d DS:21b0
    L_BP0e! = V_1a50!   '@20f84
    L_BP12! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 0)) * 100.0   '@20f94 DS:21c8
    L_BP16! = V_1a58!   '@20fc2
    L_BP1a! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 0)) * 100.0   '@20fd2 DS:21c8
    IF NOT (NOT (L_BP1a! < V_1ab2! AND L_BP12! < V_1ab2! OR (L_BP1a! > V_1aba! AND L_BP12! > V_1aba! OR (L_BP16! < V_1aae! AND L_BP0e! < V_1aae! OR L_BP16! > V_1ab6! AND L_BP0e! > V_1ab6!)))) THEN GOTO L_21189   '@21000
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP12!) - V_1ab2!) * V_1aaa!), 0, 0   '@210da
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 72, RT_CINT%(FX##(V_1a8e!)), 2   '@21126
L_21189:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21189 DS:21b0
    L_BP22! = A_0e78!(0, 1)   '@211b4
    FOR V_11ec! = 1.0 TO L_BP22!   '@211d7 DS:21b0
    L_BP0e! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 1)) * 100.0   '@211de DS:21c8
    L_BP12! = V_1a54!   '@2120d
    L_BP16! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 1)) * 100.0   '@2121d DS:21c8
    L_BP1a! = V_1a5c!   '@2124c
    IF NOT (NOT (L_BP1a! < V_1ab2! AND L_BP12! < V_1ab2! OR (L_BP1a! > V_1aba! AND L_BP12! > V_1aba! OR (L_BP16! < V_1aae! AND L_BP0e! < V_1aae! OR L_BP16! > V_1ab6! AND L_BP0e! > V_1ab6!)))) THEN GOTO L_213e5   '@2125c
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP12!) - V_1ab2!) * V_1aaa!), 0, 0   '@21336
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 72, RT_CINT%(FX##(V_1a8e!)), 2   '@21382
L_213e5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@213e5 DS:21b0
    ' END SUB   '@21410
END SUB

SUB S_21425   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x21425)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_1425 @0x21425  (021425_FUN_2000_1425.lift.txt; evidence_id (assembly): ev_4d0a7ec0f1b5ece2ed18ece75f122e3f5290da1fcf83ede8693b1e6d56375d27)
    L_BP1e! = A_1692!(0, 0)   '@21432
    FOR V_11ec! = 1.0 TO L_BP1e!   '@21452 DS:21b0
    L_BP0e! = A_1692!(RT_CINT%(FX##(V_11ec!)), 0)   '@2145a
    L_BP12! = A_1692!(RT_CINT%(FX##(V_11ec!)), 1)   '@21483
    L_BP16! = A_1692!(RT_CINT%(FX##(V_11ec!)), 2)   '@214ad
    L_BP1a! = A_1692!(RT_CINT%(FX##(V_11ec!)), 3)   '@214d4
    IF NOT (NOT (L_BP1a! < V_1ab2! AND L_BP12! < V_1ab2! OR (L_BP1a! > V_1aba! AND L_BP12! > V_1aba! OR (L_BP16! < V_1aae! AND L_BP0e! < V_1aae! OR L_BP16! > V_1ab6! AND L_BP0e! > V_1ab6!)))) THEN GOTO L_21687   '@214fe
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP12!) - V_1ab2!) * V_1aaa!), 0, 0   '@215d8
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a96!)), 0   '@21624
L_21687:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21687 DS:21b0
    ' END SUB   '@216b2
END SUB

SUB S_216c7   ' entrada de SUB/FUNCTION (B$ENRA, locais 174 bytes) (0x216c7)
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
    DIM L_BPb8%
    ' ---- FUN_2000_16c7 @0x216c7  (0216c7_FUN_2000_16c7.lift.txt; evidence_id (assembly): ev_e377dbbacf5ff9cdaf15d11146839bd10b3590165f9d296d036a23d24d8e4969)
    IF NOT (A_15da!(0, 0) = 0.0) THEN GOTO L_2170b   '@216d9 DS:21b8
    GOTO L_24b38   '@21703
L_2170b:
    L_BP56! = A_15da!(0, 0)   '@2170b
    FOR V_11b8! = 1.0 TO L_BP56!   '@2172b DS:21b0
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@21732
    IF NOT (V_11bc! > 0.0) THEN GOTO L_217c8   '@2175d DS:21b8
    V_11ec! = -V_11b8!   '@21778
    CALL S_25910   '@2178c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@21796
    L_BP12! = V_11d8!   '@217a6
    GOSUB L_21800   '@217b6
L_217c8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@217c8 DS:21b0
    GOTO L_24b38   '@217f3
    ' ---- F_217fb @0x217fb  (0217fb_F_217fb.lift.txt; evidence_id (assembly): ev_805a3c4519f2d35c3ef9fd992e10c6ff7e651c87b2f227518eb8e8a30778b8dc)
L_21800:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0216c7_FUN_2000_16c7
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_21da3   '@21805
    L_BP16! = L_BP0e!   '@21834
    L_BP1a! = L_BP12!   '@21843
    L_BP5a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@21852 DS:21bc
    IF NOT (V_1a30! < 1.0) THEN GOTO L_218bd   '@21889 DS:21b0
    V_11ec! = V_1aa6!   '@218a4
    GOTO L_218d3   '@218b5
L_218bd:
    V_11ec! = FX##(V_1aa6!) * V_1a30!   '@218bd
L_218d3:
    ' @218d3 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!(FX##(L_BP5a!) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21928
    ' @2194a CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! - 0.4000000059604644775390625##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@2199f DS:21cc
    ' @219c6 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! - 0.800000011920928955078125##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21a1b DS:21d0
    ' @21a42 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! - 1.2000000476837158203125##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21a97 DS:21d4
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_21d9b   '@21abe
    L_BP5a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@21aed DS:21bc
    IF NOT (NOT (FX##(L_BP1a!) - L_BP5a! >= FX##(V_1aba!) AND FX##(L_BP1a!) + L_BP5a! <= FX##(V_1ab2!) OR (FX##(L_BP16!) + L_BP5a! <= FX##(V_1aae!) OR FX##(L_BP16!) - L_BP5a! >= FX##(V_1ab6!)))) THEN GOTO L_21d96   '@21b24
    ' @21ba6 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!(FX##(L_BP5a!) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21bfb
    ' @21c1d CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! + 0.4000000059604644775390625##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21c72 DS:21d8
    ' @21c99 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! + 0.800000011920928955078125##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21cee DS:21dc
    ' @21d15 CIRCLE aspecto V_1a30!
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), RT_SNG!((L_BP5a! + 1.2000000476837158203125##) * V_11ec!), 1032, RT_CINT%(FX##(V_1a8e!)), 0, 0, V_1a30!   '@21d6a DS:21e0
L_21d96:
L_21d9b:
    GOTO L_22298   '@21d9b
L_21da3:
    L_BP5e! = A_16ee!(0, 0)   '@21da3
    FOR V_11ec! = 1.0 TO L_BP5e!   '@21dc3 DS:21b0
    L_BP16! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP0e!   '@21dca
    L_BP1a! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP12!   '@21df7
    L_BP1e! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP0e!   '@21e25 DS:21b0
    L_BP22! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP12!   '@21e57 DS:21b0
    IF NOT (NOT (L_BP22! < V_1ab2! AND L_BP1a! < V_1ab2! OR (L_BP22! > V_1aba! AND L_BP1a! > V_1aba! OR (L_BP1e! < V_1aae! AND L_BP16! < V_1aae! OR L_BP1e! > V_1ab6! AND L_BP16! > V_1ab6!)))) THEN GOTO L_22268   '@21e8a
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 0, 0   '@21f64
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP22!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@21fb0
    L_BP62! = 0.4000000059604644775390625##   '@2200e DS:21d8
    GOSUB L_23d32   '@2201e
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 0, 0   '@2202b
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP22!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@22077
    L_BP62! = 0.800000011920928955078125##   '@220d5 DS:21dc
    GOSUB L_23d32   '@220e5
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 0, 0   '@220f2
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP22!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@2213e
    L_BP62! = 1.2000000476837158203125##   '@2219c DS:21e0
    GOSUB L_23d32   '@221ac
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 0, 0   '@221b9
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP22!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@22205
L_22268:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@22268 DS:21b0
L_22298:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 1) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_22e9a   '@22298
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_223ff   '@222e4
    V_1a08! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@22313 DS:21bc
    V_1a0c! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@2234d DS:21bc
    V_1a10! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@22387 DS:21bc
    V_1a14! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@223bf DS:21bc
    GOTO L_2265a   '@223f7
L_223ff:
    V_1a08! = A_16ee!(1, 0)   '@223ff
    V_1a0c! = A_16ee!(1, 1)   '@22422
    V_1a10! = A_16ee!(1, 0)   '@22443
    V_1a14! = A_16ee!(1, 1)   '@22466
    L_BP66! = A_16ee!(0, 0)   '@22487
    FOR V_11ec! = 2.0 TO L_BP66!   '@224a7 DS:21b0,21bc
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) < V_1a08!) THEN GOTO L_2250c   '@224ae
    V_1a08! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@224e2
L_2250c:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) < V_1a0c!) THEN GOTO L_2256c   '@2250c
    V_1a0c! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@22541
L_2256c:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) > V_1a10!) THEN GOTO L_225ca   '@2256c
    V_1a10! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@225a0
L_225ca:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) > V_1a14!) THEN GOTO L_2262a   '@225ca
    V_1a14! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@225ff
L_2262a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2262a DS:21b0
L_2265a:
    L_BP6a! = FX##(V_1a14!) - 1.0   '@2265a DS:21e4
    FOR V_11d8! = FX##(V_1a0c!) + 1.0 TO L_BP6a!   '@22670 DS:21b0
    L_BP16! = FX##(V_1a08!) - 1.0   '@2267c DS:21e4
    L_BP62! = -1.0   '@22691 DS:21e4
L_226a6:
    L_BP1e! = -1000.0   '@226ab DS:21e8
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_22a7b   '@226bb
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@226ea DS:21bc
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_227ae   '@22748 DS:21e8
    L_BP1e! = V_11d4!   '@2279e
L_227ae:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@227ae DS:21bc
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_2286f   '@22809 DS:21e8
    L_BP1e! = V_11d4!   '@2285f
L_2286f:
    IF NOT (ABS(FX##(V_11d8!)) < FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 AND A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_22a73   '@2286f DS:21bc
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@228e9 DS:21bc
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_229ad   '@22947 DS:21e8
    L_BP1e! = V_11d4!   '@2299d
L_229ad:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@229ad DS:21bc
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_22a6e   '@22a08 DS:21e8
    L_BP1e! = V_11d4!   '@22a5e
L_22a6e:
L_22a73:
    GOTO L_22cdb   '@22a73
L_22a7b:
    L_BP6e! = A_16ee!(0, 0)   '@22a7b
    FOR V_11ec! = 1.0 TO L_BP6e!   '@22a9b DS:21b0
    L_BP72! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@22aa2
    L_BP76! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@22acb
    L_BP7a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@22af5 DS:21b0
    L_BP7e! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@22b23 DS:21b0
    IF NOT ((L_BP7e! >= V_11d8! OR L_BP76! >= V_11d8!) AND ((L_BP7e! <= V_11d8! OR L_BP76! <= V_11d8!) AND L_BP76! <> L_BP7e!)) THEN GOTO L_22cab   '@22b52
    IF NOT (L_BP72! = L_BP7a!) THEN GOTO L_22c0c   '@22bdb
    V_11d4! = L_BP72!   '@22bf4
    GOTO L_22c40   '@22c04
L_22c0c:
    V_11d4! = (FX##(V_11d8!) - L_BP76!) * (FX##(L_BP7a!) - L_BP72!) / (FX##(L_BP7e!) - L_BP76!) + L_BP72!   '@22c0c
L_22c40:
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_22ca6   '@22c40 DS:21e8
    L_BP1e! = V_11d4!   '@22c96
L_22ca6:
L_22cab:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@22cab DS:21b0
L_22cdb:
    IF NOT (L_BP1e! <> -1000.0) THEN GOTO L_22e67   '@22cdb DS:21e8
    IF NOT (L_BP62! = -1.0) THEN GOTO L_22d3b   '@22cf5 DS:21e4
    L_BP16! = L_BP1e!   '@22d0f
    L_BP62! = 0.0   '@22d1e DS:21b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_226a6   '@22d2e
L_22d3b:
    L_BP82! = FX##(L_BP16!) + L_BP0e!   '@22d3b
    L_BP86! = FX##(L_BP12!) + V_11d8!   '@22d4f
    L_BP8a! = FX##(L_BP1e!) + L_BP0e!   '@22d64
    L_BP8e! = FX##(L_BP12!) + V_11d8!   '@22d78
    RT_PSET RT_SNG!((FX##(L_BP82!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP86!) - V_1ab2!) * V_1aaa!), 0, 0   '@22d8d
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP8a!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP8e!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@22ddb
    L_BP16! = L_BP1e!   '@22e3b
    L_BP62! = -1.0   '@22e4a DS:21e4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_226a6   '@22e5a
L_22e67:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d8!   '@22e67 DS:21b0
    GOTO L_23d23   '@22e92
L_22e9a:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) > A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_23d1e   '@22e9a
    L_BP92! = 35.81999969482421875## * V_0e04# / 180.0#   '@22ee9 DS:21ec,21f4
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_230ab   '@22f04
    L_BP72! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BP92!)) / 2.0   '@22f33 DS:21bc
    L_BP76! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BP92!)) / 2.0   '@22f7b DS:21bc
    L_BP7a! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BP92!)) / 2.0   '@22fc1 DS:21bc
    L_BP7e! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BP92!)) / 2.0   '@23007 DS:21bc
    L_BP72! = L_BP72! - (FX##(L_BP76!) + 200.0) / RT_TAN##(FX##(L_BP92!))   '@2304f DS:21fc
    L_BP7a! = L_BP7a! - (FX##(L_BP7e!) + 200.0) / RT_TAN##(FX##(L_BP92!))   '@23079 DS:21fc
    GOTO L_23215   '@230a3
L_230ab:
    L_BP72! = A_16ee!(1, 0) - (FX##(A_16ee!(1, 1)) + 200.0) / RT_TAN##(FX##(L_BP92!))   '@230ab DS:21fc
    L_BP7a! = L_BP72!   '@230f9
    L_BP96! = A_16ee!(0, 0)   '@23108
    FOR V_11ec! = 2.0 TO L_BP96!   '@23129 DS:21b0,21bc
    V_11d4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + 200.0) / RT_TAN##(FX##(L_BP92!))   '@23130 DS:21fc
    IF NOT (V_11d4! < L_BP72!) THEN GOTO L_231ba   '@23190
    L_BP72! = V_11d4!   '@231aa
L_231ba:
    IF NOT (V_11d4! > L_BP7a!) THEN GOTO L_231e4   '@231ba
    L_BP7a! = V_11d4!   '@231d4
L_231e4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@231e4 DS:21b0
L_23215:
    L_BP9a! = 5.0 / RT_SIN##(FX##(L_BP92!))   '@23215 DS:2200
    IF NOT ((FX##(L_BP7a!) - L_BP72!) / L_BP9a! < FX##(3.0)) THEN GOTO L_23271   '@23235 DS:2204
    L_BP9a! = (FX##(L_BP7a!) - L_BP72!) / 4.0   '@23258 DS:2208
L_23271:
    L_BP9e! = L_BP7a! - 0.100000001490116119384765625##   '@23271 DS:220c
    L_BPa2! = L_BP9a!   '@23287
    L_BPa6! = FX##(L_BP72!) + L_BP9a!   '@23293
    GOTO L_23cce_v   '@23293
L_2329e:
    L_BP16! = L_BPa6!   '@2329e
    L_BP62! = -1.0   '@232ae DS:21e4
L_232c3:
    L_BP1e! = -1000.0   '@232c8 DS:21e8
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_23841   '@232d8
    L_BPaa! = RT_POT##((RT_TAN##(FX##(L_BP92!))), (2.0)) + 1.0   '@23307 DS:21b0,21bc
    L_BPae! = RT_POT##((RT_TAN##(FX##(L_BP92!))), (2.0)) * -2.0 * L_BPa6! - RT_TAN##(FX##(L_BP92!)) * 400.0   '@23330 DS:21b4,21bc,2210
    L_BPb2! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BPa6!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BP92!))), (2.0)) + (RT_TAN##(FX##(L_BP92!)) * 400.0 * L_BPa6! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)))   '@23372 DS:21bc,21fc,2210
    V_11d4! = (-L_BPae! - RT_SQR##(RT_POT##((FX##(L_BPae!)), (2.0)) - FX##(L_BPaa!) * 4.0 * L_BPb2!)) / (FX##(L_BPaa!) * 2.0)   '@23412 DS:21bc,2208
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_234c2   '@2345c DS:21e8
    L_BP1e! = V_11d4!   '@234b2
L_234c2:
    V_11d4! = (-L_BPae! + RT_SQR##(RT_POT##((FX##(L_BPae!)), (2.0)) - FX##(L_BPaa!) * 4.0 * L_BPb2!)) / (FX##(L_BPaa!) * 2.0)   '@234c2 DS:21bc,2208
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_23572   '@2350c DS:21e8
    L_BP1e! = V_11d4!   '@23562
L_23572:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_23811   '@23572
    IF NOT (ABS(L_BPa6! - (FX##(V_1a08!) + V_1a10!) / 2.0) < A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) / (RT_SIN##(FX##(L_BP92!)) * 2.0)) THEN GOTO L_2380c   '@235a1 DS:21bc
    L_BPb2! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BPa6!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BP92!))), (2.0)) + (RT_TAN##(FX##(L_BP92!)) * 400.0 * L_BPa6! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)))   '@23607 DS:21bc,21fc,2210
    V_11d4! = (-L_BPae! - RT_SQR##(RT_POT##((FX##(L_BPae!)), (2.0)) - FX##(L_BPaa!) * 4.0 * L_BPb2!)) / (FX##(L_BPaa!) * 2.0)   '@236a7 DS:21bc,2208
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_23757   '@236f1 DS:21e8
    L_BP1e! = V_11d4!   '@23747
L_23757:
    V_11d4! = (-L_BPae! + RT_SQR##(RT_POT##((FX##(L_BPae!)), (2.0)) - FX##(L_BPaa!) * 4.0 * L_BPb2!)) / (FX##(L_BPaa!) * 2.0)   '@23757 DS:21bc,2208
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_23807   '@237a1 DS:21e8
    L_BP1e! = V_11d4!   '@237f7
L_23807:
L_2380c:
L_23811:
    L_BP22! = (FX##(L_BP1e!) - L_BPa6!) * RT_TAN##(FX##(L_BP92!)) - 200.0   '@23811 DS:2214
    GOTO L_23b16   '@23839
L_23841:
    V_1a08! = L_BPa6!   '@23841
    V_1a0c! = -200.0   '@23852 DS:2214
    V_1a10! = 200.0 / RT_TAN##(FX##(L_BP92!)) + V_1a08!   '@23863 DS:21fc
    V_1a14! = 0.0   '@23888 DS:21b8
    L_BPb6! = A_16ee!(0, 0)   '@23899
    FOR V_11ec! = 1.0 TO L_BPb6!   '@238ba DS:21b0
    V_1a18! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@238c2
    V_1a1c! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@238ec
    V_1a20! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@23917 DS:21b0
    V_1a24! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@23946 DS:21b0
    CALL S_150ce   '@23976
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPb8% = (RT_POT##((FX##(V_1a18!) - V_1a20!), (2.0)) + RT_POT##((FX##(V_1a1c!) - V_1a24!), (2.0)) >= RT_POT##((FX##(V_1a28!) - V_1a18!), (2.0)) + RT_POT##((FX##(V_1a2c!) - V_1a1c!), (2.0)))   '@23980 DS:21bc
    IF NOT ((RT_POT##((FX##(V_1a18!) - V_1a20!), (2.0)) + RT_POT##((FX##(V_1a1c!) - V_1a24!), (2.0)) >= RT_POT##((FX##(V_1a28!) - V_1a20!), (2.0)) + RT_POT##((FX##(V_1a2c!) - V_1a24!), (2.0)) AND L_BPb8%) <> 0) THEN GOTO L_23ae5   '@23a05 DS:21bc
    IF NOT ((V_1a28! < L_BP1e! OR L_BP1e! = -1000.0) AND V_1a28! > L_BP16!) THEN GOTO L_23ae0   '@23a6a DS:21e8
    L_BP1e! = V_1a28!   '@23ac0
    L_BP22! = V_1a2c!   '@23ad0
L_23ae0:
L_23ae5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@23ae5 DS:21b0
L_23b16:
    IF NOT (L_BP1e! <> -1000.0) THEN GOTO L_23cbe   '@23b16 DS:21e8
    IF NOT (L_BP62! = -1.0) THEN GOTO L_23b85   '@23b30 DS:21e4
    L_BP16! = L_BP1e!   '@23b4a
    L_BP1a! = L_BP22!   '@23b59
    L_BP62! = 0.0   '@23b68 DS:21b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_232c3   '@23b78
L_23b85:
    L_BP82! = FX##(L_BP16!) + L_BP0e!   '@23b85
    L_BP86! = FX##(L_BP1a!) + L_BP12!   '@23b99
    L_BP8a! = FX##(L_BP1e!) + L_BP0e!   '@23bad
    L_BP8e! = FX##(L_BP22!) + L_BP12!   '@23bc1
    RT_PSET RT_SNG!((FX##(L_BP82!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP86!) - V_1ab2!) * V_1aaa!), 0, 0   '@23bd5
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP8a!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP8e!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a8e!)), 0   '@23c23
    L_BP16! = L_BP1e!   '@23c83
    L_BP1a! = L_BP22!   '@23c92
    L_BP62! = -1.0   '@23ca1 DS:21e4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_232c3   '@23cb1
L_23cbe:
L_23ccd:
    L_BPa6! = FX##(L_BPa6!) + L_BPa2!   '@23cce
L_23cce_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BPa2! < 0.0) THEN GOTO L_23d03   '@23cd5 DS:21b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPa6! < L_BP9e!) THEN GOTO L_2329e   '@23ceb
    GOTO L_23d19   '@23d00
L_23d03:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPa6! > L_BP9e!) THEN GOTO L_2329e   '@23d04
L_23d19:
L_23d1e:
L_23d23:
    RETURN   '@23d23
L_23d32:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_11ec! > 1.0) THEN GOTO L_23db7   '@23d37 DS:21b0
    L_BP26! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 0)   '@23d52 DS:21e4
    L_BP2a! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 1)   '@23d80 DS:21e4
    GOTO L_23e2d   '@23daf
L_23db7:
    L_BP26! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 0)   '@23db7
    L_BP2a! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 1)   '@23def
L_23e2d:
    L_BP2e! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@23e2d
    L_BP32! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@23e56
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_23ef9   '@23e80 DS:21b0
    L_BP36! = A_16ee!(1, 0)   '@23eaf
    L_BP3a! = A_16ee!(1, 1)   '@23ed1
    GOTO L_23f5b   '@23ef1
L_23ef9:
    L_BP36! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@23ef9 DS:21b0
    L_BP3a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@23f27 DS:21b0
L_23f5b:
    GOSUB L_24230   '@23f5b
    L_BP16! = FX##(L_BP0e!) + V_1a28!   '@23f68
    L_BP1a! = FX##(L_BP12!) + V_1a2c!   '@23f7c
    L_BP26! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@23f90
    L_BP2a! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@23fb9
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_2405c   '@23fe3 DS:21b0
    L_BP2e! = A_16ee!(1, 0)   '@24012
    L_BP32! = A_16ee!(1, 1)   '@24034
    GOTO L_240be   '@24054
L_2405c:
    L_BP2e! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@2405c DS:21b0
    L_BP32! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@2408a DS:21b0
L_240be:
    IF NOT (FX##(V_11ec!) + 2.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_2418a   '@240be DS:21bc
    L_BP36! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 0)   '@240ed
    L_BP3a! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 1)   '@24137
    GOTO L_241ec   '@24182
L_2418a:
    L_BP36! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 0)   '@2418a DS:21bc
    L_BP3a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 1)   '@241b8 DS:21bc
L_241ec:
    GOSUB L_24230   '@241ec
    L_BP1e! = FX##(L_BP0e!) + V_1a28!   '@241f9
    L_BP22! = FX##(L_BP12!) + V_1a2c!   '@2420d
    RETURN   '@24221
L_24230:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BP32! = L_BP2a! AND L_BP2e! > L_BP26!) THEN GOTO L_242bc   '@24235
    V_1a08! = L_BP26!   '@2426f
    V_1a0c! = FX##(L_BP2a!) - L_BP62!   '@2427f
    V_1a10! = L_BP2e!   '@24293
    V_1a14! = FX##(L_BP32!) - L_BP62!   '@242a3
L_242bc:
    IF NOT (L_BP32! > L_BP2a! AND L_BP2e! >= L_BP26!) THEN GOTO L_243bf   '@242bc
    IF NOT (L_BP2e! = L_BP26!) THEN GOTO L_2432c   '@242f6
    L_BP4e! = FX##(V_0e04#) / 2.0#   '@2430f DS:2218
    GOTO L_24356   '@24324
L_2432c:
    L_BP4e! = ATN((FX##(L_BP32!) - L_BP2a!) / (FX##(L_BP2e!) - L_BP26!))   '@2432c
L_24356:
    V_1a08! = L_BP62! / RT_SIN##(FX##(L_BP4e!)) + L_BP26!   '@24356
    V_1a0c! = L_BP2a!   '@24378
    V_1a10! = L_BP62! / RT_SIN##(FX##(L_BP4e!)) + L_BP2e!   '@24388
    V_1a14! = L_BP32!   '@243aa
L_243bf:
    IF NOT (L_BP32! > L_BP2a! AND L_BP2e! < L_BP26!) THEN GOTO L_24487   '@243bf
    L_BP4e! = ATN((FX##(L_BP26!) - L_BP2e!) / (FX##(L_BP32!) - L_BP2a!))   '@243f9
    V_1a08! = L_BP62! / RT_COS##(FX##(L_BP4e!)) + L_BP26!   '@2441e
    V_1a0c! = L_BP2a!   '@24440
    V_1a10! = L_BP62! / RT_COS##(FX##(L_BP4e!)) + L_BP2e!   '@24450
    V_1a14! = L_BP32!   '@24472
L_24487:
    IF NOT (L_BP32! = L_BP2a! AND L_BP2e! < L_BP26!) THEN GOTO L_2450e   '@24487
    V_1a08! = L_BP26!   '@244c1
    V_1a0c! = FX##(L_BP2a!) + L_BP62!   '@244d1
    V_1a10! = L_BP2e!   '@244e5
    V_1a14! = FX##(L_BP32!) + L_BP62!   '@244f5
L_2450e:
    IF NOT (L_BP32! < L_BP2a! AND L_BP2e! <= L_BP26!) THEN GOTO L_245dc   '@2450e
    L_BP4e! = ATN((FX##(L_BP26!) - L_BP2e!) / (FX##(L_BP2a!) - L_BP32!))   '@24548
    V_1a08! = L_BP26! - L_BP62! / RT_COS##(FX##(L_BP4e!))   '@2456d
    V_1a0c! = L_BP2a!   '@24592
    V_1a10! = L_BP2e! - L_BP62! / RT_COS##(FX##(L_BP4e!))   '@245a2
    V_1a14! = L_BP32!   '@245c7
L_245dc:
    IF NOT (L_BP32! < L_BP2a! AND L_BP2e! > L_BP26!) THEN GOTO L_246aa   '@245dc
    L_BP4e! = ATN((FX##(L_BP2e!) - L_BP26!) / (FX##(L_BP2a!) - L_BP32!))   '@24616
    V_1a08! = L_BP26! - L_BP62! / RT_COS##(FX##(L_BP4e!))   '@2463b
    V_1a0c! = L_BP2a!   '@24660
    V_1a10! = L_BP2e! - L_BP62! / RT_COS##(FX##(L_BP4e!))   '@24670
    V_1a14! = L_BP32!   '@24695
L_246aa:
    IF NOT (L_BP3a! = L_BP32! AND L_BP36! > L_BP2e!) THEN GOTO L_24731   '@246aa
    V_1a18! = L_BP2e!   '@246e4
    V_1a1c! = FX##(L_BP32!) - L_BP62!   '@246f4
    V_1a20! = L_BP36!   '@24708
    V_1a24! = FX##(L_BP3a!) - L_BP62!   '@24718
L_24731:
    IF NOT (L_BP3a! > L_BP32! AND L_BP36! >= L_BP2e!) THEN GOTO L_24834   '@24731
    IF NOT (L_BP36! = L_BP2e!) THEN GOTO L_247a1   '@2476b
    L_BP52! = FX##(V_0e04#) / 2.0#   '@24784 DS:2218
    GOTO L_247cb   '@24799
L_247a1:
    L_BP52! = ATN((FX##(L_BP3a!) - L_BP32!) / (FX##(L_BP36!) - L_BP2e!))   '@247a1
L_247cb:
    V_1a18! = L_BP62! / RT_SIN##(FX##(L_BP52!)) + L_BP2e!   '@247cb
    V_1a1c! = L_BP32!   '@247ed
    V_1a20! = L_BP62! / RT_SIN##(FX##(L_BP52!)) + L_BP36!   '@247fd
    V_1a24! = L_BP3a!   '@2481f
L_24834:
    IF NOT (L_BP3a! > L_BP32! AND L_BP36! < L_BP2e!) THEN GOTO L_248fc   '@24834
    L_BP52! = ATN((FX##(L_BP2e!) - L_BP36!) / (FX##(L_BP3a!) - L_BP32!))   '@2486e
    V_1a18! = L_BP62! / RT_COS##(FX##(L_BP52!)) + L_BP2e!   '@24893
    V_1a1c! = L_BP32!   '@248b5
    V_1a20! = L_BP62! / RT_COS##(FX##(L_BP52!)) + L_BP36!   '@248c5
    V_1a24! = L_BP3a!   '@248e7
L_248fc:
    IF NOT (L_BP3a! = L_BP32! AND L_BP36! < L_BP2e!) THEN GOTO L_24983   '@248fc
    V_1a18! = L_BP2e!   '@24936
    V_1a1c! = FX##(L_BP32!) + L_BP62!   '@24946
    V_1a20! = L_BP36!   '@2495a
    V_1a24! = FX##(L_BP3a!) + L_BP62!   '@2496a
L_24983:
    IF NOT (L_BP3a! < L_BP32! AND L_BP36! <= L_BP2e!) THEN GOTO L_24a51   '@24983
    L_BP52! = ATN((FX##(L_BP2e!) - L_BP36!) / (FX##(L_BP32!) - L_BP3a!))   '@249bd
    V_1a18! = L_BP2e! - L_BP62! / RT_COS##(FX##(L_BP52!))   '@249e2
    V_1a1c! = L_BP32!   '@24a07
    V_1a20! = L_BP36! - L_BP62! / RT_COS##(FX##(L_BP52!))   '@24a17
    V_1a24! = L_BP3a!   '@24a3c
L_24a51:
    IF NOT (L_BP3a! < L_BP32! AND L_BP36! > L_BP2e!) THEN GOTO L_24b1f   '@24a51
    L_BP52! = ATN((FX##(L_BP36!) - L_BP2e!) / (FX##(L_BP32!) - L_BP3a!))   '@24a8b
    V_1a18! = L_BP2e! - L_BP62! / RT_COS##(FX##(L_BP52!))   '@24ab0
    V_1a1c! = L_BP32!   '@24ad5
    V_1a20! = L_BP36! - L_BP62! / RT_COS##(FX##(L_BP52!))   '@24ae5
    V_1a24! = L_BP3a!   '@24b0a
L_24b1f:
    CALL S_150ce   '@24b1f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RETURN   '@24b29
L_24b38:   ' entrada vinda de 0216c7_FUN_2000_16c7
    ' END SUB   '@24b38
END SUB

SUB S_24b48   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x24b48)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_4b48 @0x24b48  (024b48_FUN_2000_4b48.lift.txt; evidence_id (assembly): ev_3302a5e01e8e43e917e0e6dae584ed0712e8dd154449ed025b21786ba6be3430)
    L_BP1e! = A_1664!(0, 0)   '@24b55
    FOR V_11ec! = 1.0 TO L_BP1e!   '@24b75 DS:21b0
    L_BP0e! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@24b7c
    L_BP12! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@24ba5
    L_BP16! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@24bcf
    L_BP1a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@24bf6
    IF NOT (NOT (L_BP1a! < V_1ab2! AND L_BP12! < V_1ab2! OR (L_BP1a! > V_1aba! AND L_BP12! > V_1aba! OR (L_BP16! < V_1aae! AND L_BP0e! < V_1aae! OR L_BP16! > V_1ab6! AND L_BP0e! > V_1ab6!)))) THEN GOTO L_24da9   '@24c20
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP12!) - V_1ab2!) * V_1aaa!), 0, 0   '@24cfa
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(V_1aa2! - (FX##(L_BP1a!) - V_1ab2!) * V_1aaa!), 8, RT_CINT%(FX##(V_1a92!)), 0   '@24d46
L_24da9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@24da9 DS:21b0
    ' END SUB   '@24dd4
END SUB

SUB S_24de9   ' entrada de SUB/FUNCTION (B$ENRA, locais 30 bytes) (0x24de9)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP28!
    ' ---- FUN_2000_4de9 @0x24de9  (024de9_FUN_2000_4de9.lift.txt; evidence_id (assembly): ev_217fe05d7766df1a725961efcd814cbd925a4993f325a398defa21f3a9074a9f)
    V_13aa% = 0   '@24df1
L_24e02:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_24e59   '@24e02
    GOTO L_24e6a   '@24e51
L_24e59:
    V_13aa% = V_13aa% + 1   '@24e59
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24e02   '@24e62
L_24e6a:
    REDIM A_16c0!(-32768 TO -32768, -32768 TO -32768)   '@24e6a
    REDIM A_16ee!(-32768 TO -32768, -32768 TO -32768)   '@24e78
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1) THEN GOTO L_255e2   '@24e81
    REDIM A_16c0!(0 TO 10, 0 TO 1)   '@24eb0
    REDIM A_16ee!(0 TO 10, 0 TO 1)   '@24ed4
    A_16c0!(0, 0) = 4.0   '@24ef8 DS:2208
    A_16c0!(1, 0) = 0.0   '@24f18 DS:21b8
    A_16c0!(1, 1) = 0.0   '@24f3b DS:21b8
    A_16c0!(2, 0) = 0.0   '@24f5c DS:21b8
    A_16c0!(2, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@24f7f
    A_16c0!(3, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@24fc5
    A_16c0!(3, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@2500a
    A_16c0!(4, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@25050
    A_16c0!(4, 1) = 0.0   '@25095 DS:21b8
    A_16c0!(5, 0) = 0.0   '@250b9 DS:21b8
    A_16c0!(5, 1) = 0.0   '@250dc DS:21b8
    A_16c0!(6, 0) = 0.0   '@25100 DS:21b8
    A_16c0!(6, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@25123
    L_BP0e! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 3)   '@25169
    REDIM A_16ee!(0 TO 6, 0 TO 1)   '@25198
    A_16ee!(0, 0) = A_16c0!(0, 0)   '@251bc
    L_BP12! = FX##(A_16ee!(0, 0)) + 1.0   '@251eb DS:21b0
    FOR V_11d4! = 1.0 TO L_BP12!   '@25210 DS:21b0
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#) - A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@25218 DS:21f4
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#) + A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@252ad DS:21f4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@25343 DS:21b0
    L_BP16! = A_16ee!(0, 0)   '@2536e
    FOR V_11d4! = 1.0 TO L_BP16!   '@2538e DS:21b0
    IF NOT (V_11d4! = 1.0) THEN GOTO L_2540c   '@25396 DS:21b0
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@253b1
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@253da
    GOTO L_254cb   '@25404
L_2540c:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) < L_BP1a!) THEN GOTO L_25468   '@2540c
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@2543f
L_25468:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) < L_BP1e!) THEN GOTO L_254c6   '@25468
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@2549c
L_254c6:
L_254cb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@254cb DS:21b0
    L_BP22! = FX##(A_16ee!(0, 0)) + 1.0   '@254f6 DS:21b0
    FOR V_11d4! = 1.0 TO L_BP22!   '@2551b DS:21b0
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)) - L_BP1a!   '@25522
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)) - L_BP1e!   '@25569
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@255b2 DS:21b0
L_255e2:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 3) THEN GOTO L_258fb   '@255e2
    L_BP24% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@25610
    REDIM A_16ee!(0 TO A_1496%(CINT(V_11bc!), V_13aa%, 2) + 5, 0 TO 1)   '@2563a
    A_16ee!(0, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@25680
    L_BP28! = A_16ee!(0, 0)   '@256c2
    FOR V_11d4! = 0.0 TO L_BP28!   '@256e2 DS:21b0,21b8
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 0)) / 10.0   '@256ea DS:2220
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 1)) / 10.0   '@25739 DS:2220
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@2578a DS:21b0
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 0) = A_16ee!(1, 0)   '@257b5 DS:21b0
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 1) = A_16ee!(1, 1)   '@25805 DS:21b0
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 0) = A_16ee!(2, 0)   '@25854 DS:21bc
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 1) = A_16ee!(2, 1)   '@258a4 DS:21bc
L_258fb:
    ' END SUB   '@258fb
END SUB

SUB S_25910   ' entrada de SUB/FUNCTION (B$ENRA, locais 46 bytes) (0x25910)
    DIM L_BP20!
    DIM L_BP22%
    DIM L_BP26!
    DIM L_BP28%
    DIM L_BP2a%
    DIM L_BP2e!
    DIM L_BP30%
    DIM L_BP34!
    DIM L_BP36%
    DIM L_BP38%
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_5910 @0x25910  (025910_FUN_2000_5910.lift.txt; evidence_id (assembly): ev_3519cb8f073f7a83d1e4cefa6d6f97007e987bf85aa3f4476aa2be13f3d72d7e)
    REDIM L_BP1c%(0 TO 210)   '@25918
    V_11bc! = A_15ac%(RT_CINT%(ABS(FX##(V_11ec!))))   '@25935
    CALL S_24de9   '@25963
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP20! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 0)   '@2596d
    IF NOT (L_BP20! = 0.0) THEN GOTO L_25aa4   '@25999 DS:21b8
    L_BP22% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@259b3
    IF NOT (L_BP22% <> 1) THEN GOTO L_259f4   '@259dd
    IF NOT (L_BP22% = 3) THEN GOTO L_25a61   '@259eb
L_259f4:
    L_BP26! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1))), 0)   '@259f4
    GOTO L_25a9c   '@25a59
L_25a61:
    IF NOT (L_BP22% = 2) THEN GOTO L_25a9c   '@25a61
    L_BP26! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@25a6a
    GOTO L_25a9c   '@25a94
L_25a9c:
    GOTO L_25e06   '@25a9c
L_25aa4:
    IF NOT (L_BP20! = -1.0) THEN GOTO L_25c6e   '@25aa5 DS:21e4
    L_BP28% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@25ab9
    IF NOT (L_BP28% <> 1) THEN GOTO L_25afa   '@25ae3
    IF NOT (L_BP28% = 3) THEN GOTO L_25be3   '@25af1
L_25afa:
    L_BP26! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0))   '@25afa DS:21c8
    GOTO L_25c66   '@25bdb
L_25be3:
    IF NOT (L_BP28% = 2) THEN GOTO L_25c66   '@25be3
    L_BP26! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@25bec DS:21c8
    GOTO L_25c66   '@25c5e
L_25c66:
    GOTO L_25e06   '@25c66
L_25c6e:
    IF NOT (L_BP20! = -2.0) THEN GOTO L_25de9   '@25c6f DS:21b4
    L_BP2a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@25c83
    IF NOT (L_BP2a% <> 1) THEN GOTO L_25cc4   '@25cad
    IF NOT (L_BP2a% = 3) THEN GOTO L_25d84   '@25cbb
L_25cc4:
    L_BP26! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0) + A_1a60!(RT_CINT%(ABS(FX##(V_11ec!))), 1)   '@25cc4 DS:21c8
    GOTO L_25de1   '@25d7c
L_25d84:
    IF NOT (L_BP2a% = 2) THEN GOTO L_25de1   '@25d84
    L_BP26! = FX##(A_1a60!(RT_CINT%(ABS(FX##(V_11ec!))), 1)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@25d8d
    GOTO L_25de1   '@25dd9
L_25de1:
    GOTO L_25e06   '@25de1
L_25de9:
    IF NOT (L_BP20! = -3.0) THEN GOTO L_25e06   '@25dea DS:21c4
    GOTO L_25e06   '@25dfe
L_25e06:
    L_BP2e! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 3)   '@25e06
    IF NOT (L_BP2e! = 0.0) THEN GOTO L_25f45   '@25e33 DS:21b8
    L_BP30% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@25e4d
    IF NOT (L_BP30% <> 1) THEN GOTO L_25e8e   '@25e77
    IF NOT (L_BP30% = 3) THEN GOTO L_25eff   '@25e85
L_25e8e:
    L_BP34! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4))), 1)   '@25e8e
    GOTO L_25f3d   '@25ef7
L_25eff:
    IF NOT (L_BP30% = 2) THEN GOTO L_25f3d   '@25eff
    L_BP34! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@25f08
    GOTO L_25f3d   '@25f35
L_25f3d:
    GOTO L_262ad   '@25f3d
L_25f45:
    IF NOT (L_BP2e! = -1.0) THEN GOTO L_26114   '@25f46 DS:21e4
    L_BP36% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@25f5a
    IF NOT (L_BP36% <> 1) THEN GOTO L_25f9b   '@25f84
    IF NOT (L_BP36% = 3) THEN GOTO L_26087   '@25f92
L_25f9b:
    L_BP34! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1))   '@25f9b DS:21c8
    GOTO L_2610c   '@2607f
L_26087:
    IF NOT (L_BP36% = 2) THEN GOTO L_2610c   '@26087
    L_BP34! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@26090 DS:21c8
    GOTO L_2610c   '@26104
L_2610c:
    GOTO L_262ad   '@2610c
L_26114:
    IF NOT (L_BP2e! = -2.0) THEN GOTO L_26290   '@26115 DS:21b4
    L_BP38% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@26129
    IF NOT (L_BP38% <> 1) THEN GOTO L_2616a   '@26153
    IF NOT (L_BP38% = 3) THEN GOTO L_2622b   '@26161
L_2616a:
    L_BP34! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1) + A_1a60!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@2616a DS:21c8
    GOTO L_26288   '@26223
L_2622b:
    IF NOT (L_BP38% = 2) THEN GOTO L_26288   '@2622b
    L_BP34! = FX##(A_1a60!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@26234
    GOTO L_26288   '@26280
L_26288:
    GOTO L_262ad   '@26288
L_26290:
    IF NOT (L_BP2e! = -3.0) THEN GOTO L_262ad   '@26291 DS:21c4
    GOTO L_262ad   '@262a5
L_262ad:
    IF NOT (V_11ec! < 0.0) THEN GOTO L_262f5   '@262ad DS:21b8
    V_11d4! = L_BP26!   '@262c8
    V_11d8! = L_BP34!   '@262d8
    GOTO L_262fa   '@262e8
L_262f5:
L_262fa:
    ERASE L_BP1c%   '@262fa
    ' END SUB   '@26303
END SUB

SUB S_26313   ' entrada de SUB/FUNCTION (B$ENRA, locais 260 bytes) (0x26313)
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP70!
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84$
    DIM L_BP88$
    DIM L_BP8c$
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
    DIM L_BPee%
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe!
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP2e%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP40%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP52%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP64%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_6313 @0x26313  (026313_FUN_2000_6313.lift.txt; evidence_id (assembly): ev_af966c805f7ab959d5e11810a25b44ba3b466a3cc9a7426b85261ef13c224e4e)
    REDIM L_BP1c%(0 TO 162)   '@2631b
    REDIM L_BP2e%(0 TO 162)   '@26338
    REDIM L_BP40%(0 TO 704)   '@26350
    REDIM L_BP52%(0 TO 704)   '@26368
    REDIM L_BP64%(0 TO 480)   '@26380
    V_11c8! = 0.0   '@2639d DS:21b8
    L_BP68! = 100.0   '@263ae DS:21c8
    L_BP6c! = INT((FX##(V_1ab6!) + V_1aae!) / 2.0)   '@263be DS:21bc
    L_BP70! = INT((FX##(V_1aba!) + V_1ab2!) / 2.0)   '@263df DS:21bc
    L_BP74! = L_BP6c!   '@26400
    L_BP78! = L_BP70!   '@2640f
    RT_GCAIXA RT_SNG!((FX##(L_BP6c!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(169.0 - (FX##(L_BP70!) - V_1ab2!) * V_1aaa!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@2641e DS:2224
    L_BP7c! = (FX##(L_BP6c!) - V_1aae!) * V_1aa6! + V_1a9e!   '@2648a
    L_BP80! = 169.0 - (FX##(L_BP70!) - V_1ab2!) * V_1aaa!   '@264a9 DS:2224
    L_BP84$ = CHR$(27)   '@264c4
    L_BP88$ = "CGA"   '@264d8 DS:2228
    CALL MIXT_08c4_TextoGrafico(L_BP7c!, L_BP80!, L_BP84$, L_BP88$)   '@264e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @264fd libera strings locais (L_BP84)
    ' @26507 libera strings locais (L_BP88)
L_26516:
    RT_VIEWPRINT 23, 25   '@2651b
    RT_CLS 2   '@2652d
    RT_VIEWPRINT 1, 25   '@2653b
    LOCATE 24, 1   '@2654d
    IF NOT (V_11c8! = 0.0) THEN GOTO L_26599   '@26568 DS:21b8
    PRINT " Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso"   '@26583 DS:2230
    GOTO L_265ac   '@26591
L_26599:
    PRINT " Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso"   '@26599 DS:2282
L_265ac:
L_265b1:
    V_0e0c$ = ""   '@265b6 DS:22d4
L_265ce:
    V_0e0c$ = RT_INKEY$   '@265ce
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_265ce   '@265e2 DS:22d4
    L_BP8c$ = V_0e0c$   '@265f6
    IF NOT (L_BP8c$ <> "R") THEN GOTO L_26634   '@26609 DS:22d8
    IF NOT (L_BP8c$ = "r") THEN GOTO L_26891   '@26621 DS:22de
L_26634:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_2680c   '@26634 DS:21b0
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BP90!)   '@2664f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP90!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@26667 DS:22e4
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BP94!)   '@266bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP94!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@266d5 DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BP98!)   '@2672b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BP98!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@26743 DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BP9c!)   '@26799
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BP9c!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@267b1 DS:22e4
L_2680c:
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@2680c DS:22e8
    V_0e0c$ = "FIM"   '@2686f DS:22ec
    GOTO L_279aa   '@26881
L_26891:
    IF NOT (L_BP8c$ <> "4") THEN GOTO L_268cc   '@26891 DS:22f4
    IF NOT (CHR$(0) + CHR$(75) = L_BP8c$) THEN GOTO L_26906   '@268a4
L_268cc:
    L_BPa0! = FX##(L_BP6c!) - L_BP68!   '@268cc
    CALL MIXT_082a_Maior(V_1aae!, L_BPa0!, L_BPa4!)   '@268e0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPa4!   '@268f4
    GOTO L_2729b   '@268fe
L_26906:
    IF NOT (L_BP8c$ <> "6") THEN GOTO L_26941   '@26906 DS:22fa
    IF NOT (CHR$(0) + CHR$(77) = L_BP8c$) THEN GOTO L_2697b   '@26919
L_26941:
    L_BPa8! = FX##(L_BP6c!) + L_BP68!   '@26941
    CALL MIXT_0877_Menor(V_1ab6!, L_BPa8!, L_BPac!)   '@26955
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPac!   '@26969
    GOTO L_2729b   '@26973
L_2697b:
    IF NOT (L_BP8c$ <> "8") THEN GOTO L_269b6   '@2697b DS:2300
    IF NOT (CHR$(0) + CHR$(72) = L_BP8c$) THEN GOTO L_269f0   '@2698e
L_269b6:
    L_BPb0! = FX##(L_BP70!) + L_BP68!   '@269b6
    CALL MIXT_0877_Menor(V_1aba!, L_BPb0!, L_BPb4!)   '@269ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP78! = L_BPb4!   '@269de
    GOTO L_2729b   '@269e8
L_269f0:
    IF NOT (L_BP8c$ <> "2") THEN GOTO L_26a2b   '@269f0 DS:2306
    IF NOT (CHR$(0) + CHR$(80) = L_BP8c$) THEN GOTO L_26a65   '@26a03
L_26a2b:
    L_BPb8! = FX##(L_BP70!) - L_BP68!   '@26a2b
    CALL MIXT_082a_Maior(V_1ab2!, L_BPb8!, L_BPbc!)   '@26a3f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP78! = L_BPbc!   '@26a53
    GOTO L_2729b   '@26a5d
L_26a65:
    IF NOT (CHR$(13) = L_BP8c$) THEN GOTO L_27136   '@26a65
    IF NOT (V_11c8! = 0.0) THEN GOTO L_26d6a   '@26a7e DS:21b8
    V_1a08! = L_BP74!   '@26a99
    V_1a0c! = L_BP78!   '@26aa9
    V_1a10! = L_BP74!   '@26ab9
    V_1a14! = L_BP78!   '@26ac9
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@26ad9 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@26b75 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@26c11 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@26cad DS:22e4
    V_11c8! = 1.0   '@26d49 DS:21b0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26516   '@26d5a
L_26d6a:
    IF NOT (L_BP78! = V_1a0c! OR L_BP74! = V_1a08!) THEN GOTO L_26db8   '@26d6a
    BEEP   '@26da6
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26516   '@26db0
L_26db8:
    IF NOT (V_0e1c$ = "ZOOM") THEN GOTO L_26e63   '@26db8 DS:230c
    CALL MIXT_0877_Menor(V_1a08!, L_BP74!, L_BPc0!)   '@26dcf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aae! = L_BPc0!   '@26de7
    CALL MIXT_0877_Menor(V_1a0c!, L_BP78!, L_BPc4!)   '@26df2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1ab2! = L_BPc4!   '@26e0a
    CALL MIXT_082a_Maior(V_1a08!, L_BP74!, L_BPc8!)   '@26e15
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1ab6! = L_BPc8!   '@26e2d
    CALL MIXT_082a_Maior(V_1a0c!, L_BP78!, L_BPcc!)   '@26e38
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aba! = L_BPcc!   '@26e50
    GOTO L_2710f   '@26e5b
L_26e63:
    CALL MIXT_0877_Menor(V_1a08!, L_BP74!, L_BPd0!)   '@26e63
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a50! = L_BPd0!   '@26e7b
    CALL MIXT_0877_Menor(V_1a0c!, L_BP78!, L_BPd4!)   '@26e86
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a54! = L_BPd4!   '@26e9e
    CALL MIXT_082a_Maior(V_1a08!, L_BP74!, L_BPd8!)   '@26ea9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a58! = L_BPd8!   '@26ec1
    CALL MIXT_082a_Maior(V_1a0c!, L_BP78!, L_BPdc!)   '@26ecc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a5c! = L_BPdc!   '@26ee4
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BPe0!)   '@26eef
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe0!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@26f07 DS:22e4
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BPe4!)   '@26f5d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe4!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@26f75 DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BPe8!)   '@26fcb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BPe8!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@26fe3 DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BPec!)   '@27039
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BPec!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@27051 DS:22e4
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@270a7 DS:22e8
L_2710f:
    V_0e0c$ = ""   '@2710f DS:22d4
    GOTO L_279aa   '@27121
L_27136:
    IF NOT (L_BP8c$ <> "P") THEN GOTO L_2715c   '@27136 DS:2314
    IF NOT (L_BP8c$ = "p") THEN GOTO L_2728e   '@27149 DS:231a
L_2715c:
    RT_VIEWPRINT 23, 25   '@2715c
    RT_CLS 2   '@2716e
    PRINT ""   '@2717c DS:22d4
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP68!)); "* ";   '@2718a DS:2320,2336
    CALL MIXT_07f1_LimpaTeclado   '@271b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@271c2 DS:22d4 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_2727e   '@271dc DS:233c
    L_BPee% = (FX##(VAL(V_0e0c$)) < FX##(V_1aba!) - V_1ab2!)   '@27200
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_1ab6!) - V_1aae! AND L_BPee%) <> 0) THEN GOTO L_27279   '@2723e
    L_BP68! = VAL(V_0e0c$)   '@27260
L_27279:
L_2727e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_26516   '@2727e
L_2728e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_265b1   '@2728e
L_2729b:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_27493   '@2729b DS:21b0
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BPf2!)   '@272b6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPf2!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@272ce DS:22e4
    CALL MIXT_0877_Menor(V_1a08!, V_1a10!, L_BPf6!)   '@27324
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPf6!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@2733c DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BPfa!)   '@27392
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BPfa!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@273aa DS:22e4
    CALL MIXT_082a_Maior(V_1a0c!, V_1a14!, L_BPfe!)   '@27400
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(L_BPfe!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@27418 DS:22e4
    V_1a10! = L_BP74!   '@2746e
    V_1a14! = L_BP78!   '@2747e
L_27493:
    GOSUB L_2783c   '@27493
    L_BP6c! = L_BP74!   '@274a0
    L_BP70! = L_BP78!   '@274af
    IF NOT (V_11c8! = 1.0) THEN GOTO L_2782f   '@274be DS:21b0
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@274d9 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@27575 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@27611 DS:22e4
    RT_GCAIXA RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@276ad DS:22e4
    RT_PSET RT_SNG!((FX##(V_1a08!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a0c!) - V_1ab2!) * V_1aaa!), 0, 0   '@27749 DS:22e4
    RT_LINE 0, 0, RT_SNG!((FX##(V_1a10!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(165.0 - (FX##(V_1a14!) - V_1ab2!) * V_1aaa!), 88, ((V_1a9a! = 1.0) * -13 + (V_1a9a! = 0.0) * -7), 4369   '@27797 DS:21b0,21b8,22e4
L_2782f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_265b1   '@2782f
    ' ---- F_27837 @0x27837  (027837_F_27837.lift.txt; evidence_id (assembly): ev_aa2622808edaf6c4efd80791b618e111a06c1ba67da17fb18c81b713ffc58ddd)
L_2783c:   ' sub-rotina (alvo de GOSUB); entrada vinda de 026313_FUN_2000_6313
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1ab2!) * V_1aaa!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@27841 DS:22e8
    RT_GCAIXA RT_SNG!((FX##(L_BP74!) - V_1aae!) * V_1aa6! + V_1a9e!), RT_SNG!(169.0 - (FX##(L_BP78!) - V_1ab2!) * V_1aaa!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@278a4 DS:2224
    L_BP102! = (FX##(L_BP74!) - V_1aae!) * V_1aa6! + V_1a9e!   '@27910
    L_BP106! = 169.0 - (FX##(L_BP78!) - V_1ab2!) * V_1aaa!   '@27930 DS:2224
    L_BP10a$ = CHR$(27)   '@2794c
    L_BP10e$ = "CGA"   '@27960 DS:2228
    CALL MIXT_08c4_TextoGrafico(L_BP102!, L_BP106!, L_BP10a$, L_BP10e$)   '@2796e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @27987 libera strings locais (L_BP10a)
    ' @27991 libera strings locais (L_BP10e)
    RETURN   '@2799b
L_279aa:   ' entrada vinda de 026313_FUN_2000_6313
    ' @279aa libera strings locais (L_BP8c)
    ERASE L_BP64%   '@279b4
    ERASE L_BP52%   '@279bd
    ERASE L_BP40%   '@279c6
    ERASE L_BP2e%   '@279cf
    ERASE L_BP1c%   '@279d8
    ' END SUB   '@279e1
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_FORMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
