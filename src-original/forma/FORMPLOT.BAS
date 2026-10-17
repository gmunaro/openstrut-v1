' ============================================================================
'  FORMPLOT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/FORMPLOT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 37e32236a1db1fb5380376d92c34ab86d2ba395d1f11715764a7b792c6a5b3dd
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_FORMA.BI'

' ---- variaveis do FORMPLOT fora do COMMON (DS do programa)
REDIM SHARED A_19f8%(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1a26%(-32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1acc!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1866!
DIM SHARED V_186a$
DIM SHARED V_186e$
DIM SHARED V_1872!
DIM SHARED V_1876!
DIM SHARED V_187a!
DIM SHARED V_187e!
DIM SHARED V_1882$
DIM SHARED V_1886!
DIM SHARED V_188a!
DIM SHARED V_188e!
DIM SHARED V_1892!
DIM SHARED V_1896!
DIM SHARED V_189a!
DIM SHARED V_189e!
DIM SHARED V_18a2!
DIM SHARED V_18a6!
DIM SHARED V_18aa!
DIM SHARED V_18ae!
DIM SHARED V_18b2!
DIM SHARED V_18b6!
DIM SHARED V_18ba!
DIM SHARED V_18be!
DIM SHARED V_18c2!
DIM SHARED V_18c6!
DIM SHARED V_18ca!
DIM SHARED V_18ce$
DIM SHARED V_18d2!
DIM SHARED V_19e4!
DIM SHARED V_19e8!
DIM SHARED V_19ec$
DIM SHARED V_19f0!
DIM SHARED V_19f4$
DIM SHARED V_1a54$
DIM SHARED V_1a58$
DIM SHARED V_1a5c$
DIM SHARED V_1a60$
DIM SHARED V_1a64$
DIM SHARED V_1a68$
DIM SHARED V_1a6c$
DIM SHARED V_1a70$
DIM SHARED V_1a74$
DIM SHARED V_1a78$
DIM SHARED V_1a7c!
DIM SHARED V_1a80$
DIM SHARED V_1a84$
DIM SHARED V_1a88$
DIM SHARED V_1a8c!
DIM SHARED V_1a90$
DIM SHARED V_1a94!
DIM SHARED V_1a98!
DIM SHARED V_1a9c!
DIM SHARED V_1aa0!
DIM SHARED V_1aa4!
DIM SHARED V_1aa8!
DIM SHARED V_1aac!
DIM SHARED V_1ab0!
DIM SHARED V_1ab4!
DIM SHARED V_1ab8!
DIM SHARED V_1abc!
DIM SHARED V_1ac0!
DIM SHARED V_1ac4!
DIM SHARED V_1ac8!
DIM SHARED V_1afa!
DIM SHARED V_1afe!
DIM SHARED V_1b02!
DIM SHARED V_1b06!
DIM SHARED V_1b0a!
DIM SHARED V_1b0e!
DIM SHARED V_1b12!
DIM SHARED V_1b16!
DIM SHARED V_1b1a!
DIM SHARED V_1b1e!
DIM SHARED V_1b22!
DIM SHARED V_1b26!
DIM SHARED V_1b2a!
DIM SHARED V_1b2e!
DIM SHARED V_1b32!
DIM SHARED V_1b36!

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "FORMPLOT"
' ---- M_FORMPLOT @0x10030  (010030_M_FORMPLOT.lift.txt; evidence_id (assembly): ev_886b4d294de0768a11e72a8e247a931b3dc6a9f7780da25b5c31daffd7b599e8)
' @10030 inicio do programa (B$?EVT)
GOTO L_10206   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10206:
REDIM A_1acc!(-32768 TO -32768, -32768 TO -32768)   '@10206
REDIM A_1acc!(0 TO CINT(A_15da!(0, 0)), 0 TO 4)   '@10214
V_1b2a! = A_1664!(1, 0)   '@10249
V_1b32! = A_1664!(1, 0)   '@1026c
V_1b2e! = A_1664!(1, 1)   '@1028f
V_1b36! = A_1664!(1, 1)   '@102b0
V_1866! = A_1664!(0, 0)   '@102d1
FOR V_11b8! = 1.0 TO V_1866!   '@102f2 DS:1b9a
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) < V_1b2a!) THEN GOTO L_10358   '@102fa
V_1b2a! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@1032e
L_10358:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) < V_1b2a!) THEN GOTO L_103b2   '@10358
V_1b2a! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@1038a
L_103b2:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) > V_1b32!) THEN GOTO L_10410   '@103b2
V_1b32! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@103e6
L_10410:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) > V_1b32!) THEN GOTO L_1046a   '@10410
V_1b32! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@10442
L_1046a:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) < V_1b2e!) THEN GOTO L_104ca   '@1046a
V_1b2e! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1049f
L_104ca:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) < V_1b2e!) THEN GOTO L_1052a   '@104ca
V_1b2e! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@104ff
L_1052a:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) > V_1b36!) THEN GOTO L_1058a   '@1052a
V_1b36! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1055f
L_1058a:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) > V_1b36!) THEN GOTO L_105ea   '@1058a
V_1b36! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@105bf
L_105ea:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@105ea DS:1b9a
CALL S_20187   '@10616
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_1abc! = V_1b2a!   '@10620
V_1ac0! = V_1b2e!   '@10631
V_1ac4! = V_1b32!   '@10642
V_1ac8! = V_1b36!   '@10653
L_10669:   ' entrada vinda de 012fb7_F_12fb7, 01464b_F_1464b
ON ERROR GOTO L_14610
RT_ONERR = &H14610   '@1066e
V_11d4! = RT_FRE&("")   '@1067d DS:1b40
GOSUB L_14650   '@10697
L_106a9:
V_1b1a! = INT(V_1b2a! - (FX##(V_1b32!) - V_1b2a!) / 20.0)   '@106ae DS:1b9e
V_1b1e! = INT(V_1b2e! - (FX##(V_1b36!) - V_1b2e!) / 20.0)   '@106d8 DS:1b9e
V_1b22! = INT((FX##(V_1b32!) - V_1b2a!) / 20.0 + V_1b32!)   '@10702 DS:1b9e
V_1b26! = INT((FX##(V_1b36!) - V_1b2e!) / 20.0 + V_1b36!)   '@10729 DS:1b9e
L_10755:
CALL S_14bb7   '@1075a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_21ded   '@10764
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_216c1   '@1076e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_2141f   '@10778
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
L_10787:
RT_VIEWPRINT 23, 25   '@1078c
RT_CLS 2   '@1079e
PRINT " <S>eleciona Campo de Plotagem    <M>argens carimbo & Escala    <P>lotar"   '@107ac DS:1ba2
PRINT " <Z>oom    <T>extos    <D>etalhes ampliados    <C>ad geracao de arquivo DXF"   '@107ba DS:1bee
PRINT " <F>im";   '@107c8 DS:1c3e
L_107db:
CALL MIXT_07f1_LimpaTeclado   '@107e0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@107ea
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_186a$ = V_0e0c$   '@10806
IF NOT (V_186a$ <> "S") THEN GOTO L_10841   '@10818 DS:1c48
IF NOT (V_186a$ = "s") THEN GOTO L_10b30   '@1082f DS:1c4e
L_10841:
RT_VIEWPRINT 23, 25   '@10841
RT_CLS 2   '@10853
RT_VIEWPRINT 1, 25   '@10861
LOCATE 24, 1   '@10873
PRINT "   <D>efine um campo de Plotagen    <T>odo o campo    <*R*>etorna";   '@1088e DS:1c54
V_0e1c$ = "SELECIONA"   '@1089c DS:1c9a
CALL MIXT_07f1_LimpaTeclado   '@108ae
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@108b8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_186e$ = V_0e0c$   '@108d4
IF NOT (V_186e$ <> "D") THEN GOTO L_1090f   '@108e6 DS:1ca8
IF NOT (V_186e$ = "d") THEN GOTO L_10940   '@108fd DS:1cae
L_1090f:
CALL S_235b9   '@1090f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "FIM") THEN GOTO L_10938   '@10919 DS:1cb4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@10930
L_10938:
GOTO L_109b0   '@10938
L_10940:
IF NOT (V_186e$ <> "T") THEN GOTO L_10964   '@10940 DS:1cbc
IF NOT (V_186e$ = "t") THEN GOTO L_109b0   '@10952 DS:1cc2
L_10964:
V_1abc! = V_1b2a!   '@10964
V_1ac0! = V_1b2e!   '@10975
V_1ac4! = V_1b32!   '@10986
V_1ac8! = V_1b36!   '@10997
GOTO L_109b0   '@109a8
L_109b0:
IF NOT (V_1802% = 1) THEN GOTO L_10b28   '@109b0
V_1872! = A_1804!(0, 0)   '@109bf
FOR V_11b8! = 1.0 TO V_1872!   '@109e0 DS:1b9a
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 1) = -1000.0 AND A_1804!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0) THEN GOTO L_10a71   '@109e8 DS:1cc8,1ccc
V_1ac4! = FX##(V_1ac4!) + 30.0   '@10a5b DS:1cd0
L_10a71:
IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 2) = -1000.0 AND A_1804!(RT_CINT%(FX##(V_11b8!)), 0) = 1.0) THEN GOTO L_10af7   '@10a71 DS:1b9a,1ccc
V_1ac0! = FX##(V_1ac0!) - 30.0   '@10ae1 DS:1cd4
L_10af7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@10af7 DS:1b9a
L_10b28:
GOTO L_12faf   '@10b28
L_10b30:
IF NOT (V_186a$ <> "M") THEN GOTO L_10b54   '@10b30 DS:1cd8
IF NOT (V_186a$ = "m") THEN GOTO L_10cb2   '@10b42 DS:1cde
L_10b54:
RT_SCREEN 0   '@10b54
RT_VIEWPRINT 1, 25   '@10b69
COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(FX##(V_0dc8!)), RT_CINT%(FX##(V_0dc8!))   '@10b7b
RT_CLS 2   '@10bb6
L_10bca:
GOSUB L_12fbc   '@10bca
LOCATE 24, 1   '@10bd7
PRINT " "; RT_TAB$(79); ""; ""   '@10bf2 DS:1b40,1ce4
LOCATE 24, 1   '@10c1b
PRINT " Deseja Alterar as parametrizacoes S/*N* ";   '@10c36 DS:1cea
CALL MIXT_07f1_LimpaTeclado   '@10c44
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@10c4e DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_10c8d   '@10c68 DS:1c48
GOTO L_10ca2   '@10c85
L_10c8d:
GOSUB L_1377f   '@10c8d
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10bca   '@10c9a
L_10ca2:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10755   '@10ca2
L_10cb2:
IF NOT (V_186a$ <> "P") THEN GOTO L_10cd6   '@10cb2 DS:1d18
IF NOT (V_186a$ = "p") THEN GOTO L_122ee   '@10cc4 DS:1d1e
L_10cd6:
RT_VIEWPRINT 23, 25   '@10cd6
RT_CLS 2   '@10ce8
PRINT " Montagem de Folha para Plotagem"   '@10cf6 DS:1d24
V_1876! = (FX##(V_1b32!) - V_1b2a!) / V_153c% * 10.0 + 20.0   '@10d04 DS:1b9e,1d48
V_187a! = (FX##(V_1b36!) - V_1b2e!) / V_153c% * 10.0 + 20.0   '@10d2f DS:1b9e,1d48
V_19e4! = V_1534% + 30   '@10d5a
V_19e8! = V_1532% - V_1536% - 30 - FX##(V_187a!)   '@10d71
V_187e! = 20.0   '@10d91 DS:1b9e
IF NOT (FX##(V_19e4!) + V_1876! > V_1530% - V_1536% - V_1538% OR V_1536% + 30 > V_19e8!) THEN GOTO L_10e70   '@10da2
PRINT " DESENHO NA ESCALA ESCOLHIDA E MAIOR QUE A AREA UTIL DA FOLHA"   '@10df9 DS:1d4c
BEEP   '@10e07
PRINT " Altere a escala ou o tamanho da Folha.  Sigo mesmo assim  SIM/*N* ";   '@10e11 DS:1d8e
CALL MIXT_07f1_LimpaTeclado   '@10e1f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@10e29 DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) <> "SIM") THEN GOTO L_10e68   '@10e43 DS:1dd6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@10e60
L_10e68:
GOTO L_10ef4   '@10e68
L_10e70:
PRINT USING " AREA OCUPADA PELO DESENHO #### x#### mm "; RT_PU#(V_1876!, " AREA OCUPADA PELO DESENHO #### x#### mm ", 1); RT_PU#(V_187a!, " AREA OCUPADA PELO DESENHO #### x#### mm ", 2)   '@10e70 DS:1dde
PRINT " Sigo com a Configuracao para Plotagem N/*S* ";   '@10e98 DS:1e0c
CALL MIXT_07f1_LimpaTeclado   '@10ea6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@10eb0 DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_10eef   '@10eca DS:1e3e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@10ee7
L_10eef:
L_10ef4:
V_1b1a! = FX##(V_1b2a!) - 20.0   '@10ef4 DS:1e44
V_1b22! = FX##(V_1b32!) + 20.0   '@10f0a DS:1b9e
V_1b1e! = FX##(V_1b2e!) - 20.0   '@10f20 DS:1e44
V_1b26! = FX##(V_1b36!) + 20.0   '@10f36 DS:1b9e
V_1b12! = FX##(6000.0) / (V_153c% * V_1530%)   '@10f4c DS:1e48
V_1b16! = FX##(1650.0) / (V_153c% * V_1532%)   '@10f73 DS:1e4c
IF NOT (FX##(V_1b16!) / V_1b12! > 0.41670000553131103515625##) THEN GOTO L_10fd8   '@10f9a DS:1e50
V_1b16! = V_1b12! * 0.41670000553131103515625##   '@10fba DS:1e50
GOTO L_10ff3   '@10fd0
L_10fd8:
V_1b12! = V_1b16! / 0.41670000553131103515625##   '@10fd8 DS:1e50
L_10ff3:
L_10ff8:
V_19e4! = V_1534% + 30   '@10ffd
V_19e8! = V_1532% - V_1536% - 30 - FX##(V_187a!)   '@11014
RT_VIEWPRINT 1, 25   '@11034
RT_CLS 0   '@11046
RT_WINDOW 1, (0), (0), (639), (199)   '@11053 DS:1cc8,1cca,1e54,1e56,1e58,1e5a (B$WIND decodificado)
RT_LINE 20, 170, RT_SNG!(V_1530% * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - V_1532% * V_153c% * FX##(V_1b16!) / 10.0), 25, RT_CINT%(FX##(V_1afa!)), 0   '@11081 DS:1b9e,1d48,1e5c
RT_LINE RT_SNG!(V_1534% * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - V_1536% * V_153c% * FX##(V_1b16!) / 10.0), RT_SNG!((V_1530% - V_1536%) * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - (V_1532% - V_1536%) * V_153c% * FX##(V_1b16!) / 10.0), 25, RT_CINT%(FX##(V_1afa!)), 0   '@1110b DS:1b9e,1d48,1e5c
L_BP0c% = V_1530% - V_1536%   '@111f0 DS:1b9e,1d48,1e5c
RT_LINE RT_SNG!((V_1530% - V_1536% - V_1538%) * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - V_1536% * V_153c% * FX##(V_1b16!) / 10.0), RT_SNG!(L_BP0c% * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - (V_153a% + V_1536%) * V_153c% * FX##(V_1b16!) / 10.0), 25, RT_CINT%(FX##(V_1afa!)), 0   '@11263 DS:1b9e,1d48,1e5c
L_112e9:
V_1b0a! = INT(FX##(V_153c%) * V_19e4! * V_1b12! / 10.0) + 20.0   '@112ee DS:1b9e,1d48
V_1b0e! = 170.0 - INT(FX##(V_153c%) * V_19e8! * V_1b16! / 10.0)   '@1131d DS:1d48,1e5c
CALL S_2141f   '@1134f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_21ded   '@11359
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_216c1   '@11363
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
L_11372:
LOCATE 24, 1   '@11377
PRINT " "; CHR$(24); CHR$(25); CHR$(26); CHR$(27); " movimenta    <S>egue com a Plotagem    <A>bandona    <C>ancela    <P>asso"; RT_TAB$(79); ""; "";   '@11392 DS:1b40,1ce4,1e60
CALL MIXT_07f1_LimpaTeclado   '@11400
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
L_11410:
V_0e0c$ = RT_INKEY$   '@11410
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_1882$ = V_0e0c$   '@11424
IF NOT (V_1882$ <> "4") THEN GOTO L_11474   '@11436 DS:1eae
IF NOT (CHR$(0) + CHR$(75) = V_1882$) THEN GOTO L_11583   '@1144d
L_11474:
IF NOT (V_1534% + 20 < V_19e4!) THEN GOTO L_1157b   '@11474
V_1886! = V_1534% + 20   '@11495
V_188a! = FX##(V_19e4!) - V_187e!   '@114ad
CALL MIXT_082a_Maior(V_1886!, V_188a!, V_188e!)   '@114bd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e4! = V_188e!   '@114cf
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@114da DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@1156e
L_1157b:
GOTO L_11e14   '@1157b
L_11583:
IF NOT (V_1882$ <> "6") THEN GOTO L_115bc   '@11583 DS:1eb4
IF NOT (CHR$(0) + CHR$(77) = V_1882$) THEN GOTO L_1182b   '@11595
L_115bc:
IF NOT (V_153a% + V_1536% + 20 < V_19e8!) THEN GOTO L_116fd   '@115bc
IF NOT (FX##(V_19e4!) + V_1876! < V_1530% - V_1536% - 20) THEN GOTO L_116f5   '@115e1
V_1892! = V_1530% - V_1536% - 20   '@1160b
V_1896! = FX##(V_19e4!) + V_187e!   '@11627
CALL MIXT_0877_Menor(V_1892!, V_1896!, V_189a!)   '@11637
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e4! = V_189a!   '@11649
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@11654 DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@116e8
L_116f5:
GOTO L_11823   '@116f5
L_116fd:
IF NOT (FX##(V_19e4!) + V_1876! < V_1530% - V_1536% - V_1538% - 20) THEN GOTO L_1181e   '@116fd
V_189e! = V_1530% - V_1536% - V_1538% - 20 - FX##(V_1876!)   '@1172b
V_18a2! = FX##(V_19e4!) + V_187e!   '@11750
CALL MIXT_0877_Menor(V_189e!, V_18a2!, V_18a6!)   '@11760
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e4! = V_18a6!   '@11772
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@1177d DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@11811
L_1181e:
L_11823:
GOTO L_11e14   '@11823
L_1182b:
IF NOT (V_1882$ <> "2") THEN GOTO L_11864   '@1182b DS:1eba
IF NOT (CHR$(0) + CHR$(80) = V_1882$) THEN GOTO L_11abd   '@1183d
L_11864:
IF NOT (FX##(V_19e4!) + V_1876! <= V_1530% - V_1536% - V_1538% - 20) THEN GOTO L_119a1   '@11864
IF NOT (V_1536% + 20 < V_19e8!) THEN GOTO L_11999   '@11892
V_18aa! = V_1536% + 20   '@118b3
V_18ae! = FX##(V_19e8!) - V_187e!   '@118cb
CALL MIXT_082a_Maior(V_18aa!, V_18ae!, V_18b2!)   '@118db
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e8! = V_18b2!   '@118ed
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@118f8 DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@1198c
L_11999:
GOTO L_11ab5   '@11999
L_119a1:
IF NOT (V_153a% + V_1536% + 20 < V_19e8!) THEN GOTO L_11ab0   '@119a1
V_18b6! = V_153a% + V_1536% + 20   '@119c6
V_18ba! = FX##(V_19e8!) - V_187e!   '@119e2
CALL MIXT_082a_Maior(V_18b6!, V_18ba!, V_18be!)   '@119f2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e8! = V_18be!   '@11a04
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@11a0f DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@11aa3
L_11ab0:
L_11ab5:
GOTO L_11e14   '@11ab5
L_11abd:
IF NOT (V_1882$ <> "8") THEN GOTO L_11af6   '@11abd DS:1ec0
IF NOT (CHR$(0) + CHR$(72) = V_1882$) THEN GOTO L_11c12   '@11acf
L_11af6:
IF NOT (FX##(V_19e8!) + V_187a! < V_1532% - V_1536% - 20) THEN GOTO L_11c0a   '@11af6
V_18c2! = V_1532% - V_1536% - 20   '@11b20
V_18c6! = FX##(V_19e8!) + V_187e!   '@11b3c
CALL MIXT_0877_Menor(V_18c2!, V_18c6!, V_18ca!)   '@11b4c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_19e8! = V_18ca!   '@11b5e
RT_LINE V_1b0a!, V_1b0e!, RT_SNG!(INT(FX##(V_153c%) * V_1876! * V_1b12! / 10.0) + V_1b0a!), RT_SNG!(V_1b0e! - INT(FX##(V_153c%) * V_187a! * V_1b16! / 10.0)), 41, RT_CINT%(FX##(V_1b06!)), 0   '@11b69 DS:1d48
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_112e9   '@11bfd
L_11c0a:
GOTO L_11e14   '@11c0a
L_11c12:
IF NOT (V_1882$ <> "S") THEN GOTO L_11c36   '@11c12 DS:1c48
IF NOT (V_1882$ = "s") THEN GOTO L_11c46   '@11c24 DS:1c4e
L_11c36:
GOTO L_11e1c   '@11c36
L_11c46:
IF NOT (V_1882$ <> "A") THEN GOTO L_11c6a   '@11c46 DS:1ec6
IF NOT (V_1882$ = "a") THEN GOTO L_11c7a   '@11c58 DS:1ecc
L_11c6a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10ff8   '@11c6a
L_11c7a:
IF NOT (V_1882$ <> "C") THEN GOTO L_11c9e   '@11c7a DS:1ed2
IF NOT (V_1882$ = "c") THEN GOTO L_11cae   '@11c8c DS:1ed8
L_11c9e:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_106a9   '@11c9e
L_11cae:
IF NOT (V_1882$ <> "P") THEN GOTO L_11cd2   '@11cae DS:1d18
IF NOT (V_1882$ = "p") THEN GOTO L_11e14   '@11cc0 DS:1d1e
L_11cd2:
LOCATE 24, 1   '@11cd2
PRINT " "; RT_TAB$(79); ""; ""   '@11ced DS:1b40,1ce4
LOCATE 24, 1   '@11d16
PRINT " Passo de Movimento *"; LTRIM$(STR$(V_187e!)); "* mm ";   '@11d31 DS:1ede,1ef8
CALL MIXT_07f1_LimpaTeclado   '@11d61
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
L_BP0c% = (LEN(V_0e0c$) > 0)   '@11d6b DS:1f02
L_BP0e% = VAL(V_0e0c$) > 0.0# AND L_BP0c%   '@11d8d DS:1b9e
IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_1530%) / 20.0 AND L_BP0e%) <> 0) THEN GOTO L_11e04   '@11dbd
V_187e! = INT(FX##(VAL(V_0e0c$)))   '@11dde
L_11e04:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_11372   '@11e04
L_11e14:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_11410   '@11e14
L_11e1c:
CALL S_15254   '@11e1c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINE RT_SNG!(V_1534% * V_153c% * FX##(V_1b12!) / 10.0 + 21.0), RT_SNG!(169.0 - V_1536% * V_153c% * FX##(V_1b16!) / 10.0), RT_SNG!((V_1530% - V_1536%) * V_153c% * FX##(V_1b12!) / 10.0 + 19.0), RT_SNG!(171.0 - (V_1532% - V_1536%) * V_153c% * FX##(V_1b16!) / 10.0), 41, RT_CINT%(FX##(V_1b06!)), 0   '@11e26 DS:1d48,1f0a,1f0e,1f12,1f16
L_BP0c% = V_1530% - V_1536%   '@11f0b DS:1b9e,1d48,1e5c
RT_LINE RT_SNG!((V_1530% - V_1536% - V_1538%) * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - V_1536% * V_153c% * FX##(V_1b16!) / 10.0), RT_SNG!(L_BP0c% * V_153c% * FX##(V_1b12!) / 10.0 + 20.0), RT_SNG!(170.0 - (V_153a% + V_1536%) * V_153c% * FX##(V_1b16!) / 10.0), 25, RT_CINT%(FX##(V_1afa!)), 0   '@11f7e DS:1b9e,1d48,1e5c
CALL S_2141f   '@11fff
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_21ded   '@12009
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
CALL S_216c1   '@12013
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 23, 25   '@1201d
IF NOT (V_1524$ = "S") THEN GOTO L_12153   '@1202f DS:1c48
L_1204b:
RT_CLS 2   '@12050
PRINT " Geracao de arquivo de Plotagem (.PLT)"   '@1205e DS:1f1a
PRINT " Nome do arquivo a ser gerado *"; V_0e32$; "* ";   '@1206c DS:1f44,1f68
CALL MIXT_07f1_LimpaTeclado   '@1208c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@12096 DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_120d7   '@120b0
V_0e0c$ = V_0e32$   '@120c5
L_120d7:
L_BP0c% = (VAL(V_0e0c$) <> 0.0#)   '@120d7 DS:1f02
IF NOT ((RT_INSTR%((1), (V_0e0c$), (" ")) > 0 OR L_BP0c%) <> 0) THEN GOTO L_12136   '@1210d DS:1ce4
BEEP   '@12124
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_1204b   '@1212e
L_12136:
V_0e18$ = UCASE$(V_0e0c$)   '@12136
L_12153:
RT_CLS 2   '@12153
PRINT " Plotagem da Forma "; V_0e32$   '@12161 DS:1f6e
PRINT " "; V_1a70$; " em ";   '@12178 DS:1ce4,1f86
IF NOT (V_1524$ = "S") THEN GOTO L_121d7   '@12198 DS:1c48
PRINT V_0e52$; V_0e18$; ".PLT"   '@121af DS:1f8e
GOTO L_121ea   '@121cf
L_121d7:
PRINT V_1a74$   '@121d7
L_121ea:
RT_VIEWPRINT 1, 25   '@121ea
LOCATE 25, 1   '@121fc
PRINT " Sigo com a Plotagem  N/*S* ";   '@12217 DS:1f96
CALL MIXT_07f1_LimpaTeclado   '@12225
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1222f DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1226e   '@12249 DS:1e3e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_106a9   '@12266
L_1226e:
LOCATE 25, 1   '@1226e
PRINT " Aguarde.."; RT_TAB$(79); ""; "";   '@12289 DS:1b40,1fb6
V_1abc! = V_1b2a!   '@122b2
V_1ac0! = V_1b2e!   '@122c3
CALL S_30182   '@122d4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_106a9   '@122de
L_122ee:
IF NOT (V_186a$ <> "D") THEN GOTO L_12312   '@122ee DS:1ca8
IF NOT (V_186a$ = "d") THEN GOTO L_1231a   '@12300 DS:1cae
L_12312:
GOTO L_12faf   '@12312
L_1231a:
IF NOT (V_186a$ <> "C") THEN GOTO L_1233e   '@1231a DS:1ed2
IF NOT (V_186a$ = "c") THEN GOTO L_1252b   '@1232c DS:1ed8
L_1233e:
RT_VIEWPRINT 23, 25   '@1233e
L_12355:
RT_CLS 2   '@1235a
PRINT " Geracao de arquivo CAD (.DXF)"   '@12368 DS:1fc4
PRINT " Nome do arquivo a ser gerado *"; V_0e32$; "* ";   '@12376 DS:1f44,1f68
CALL MIXT_07f1_LimpaTeclado   '@12396
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@123a0 DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_123e1   '@123ba
V_0e0c$ = V_0e32$   '@123cf
L_123e1:
L_BP0c% = (VAL(V_0e0c$) <> 0.0#)   '@123e1 DS:1f02
IF NOT ((RT_INSTR%((1), (V_0e0c$), (" ")) > 0 OR L_BP0c%) <> 0) THEN GOTO L_12440   '@12417 DS:1ce4
BEEP   '@1242e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12355   '@12438
L_12440:
V_0e18$ = UCASE$(V_0e0c$)   '@12440
LOCATE 25, 1   '@12458
PRINT " Sigo com a geracao em "; V_0e4a$; V_0e18$; ".DXF N/*S* ";   '@12473 DS:1fe6,2002
CALL MIXT_07f1_LimpaTeclado   '@1249c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@124a6 DS:1b40 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_124e5   '@124c0 DS:1e3e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@124dd
L_124e5:
LOCATE 25, 65   '@124e5
PRINT "Aguarde..";   '@12503 DS:2012
CALL S_4016e   '@12511
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@1251b
L_1252b:
IF NOT (V_186a$ <> "T") THEN GOTO L_1254f   '@1252b DS:1cbc
IF NOT (V_186a$ = "t") THEN GOTO L_12de8   '@1253d DS:1cc2
L_1254f:
RT_VIEWPRINT 23, 25   '@1254f
L_12566:
RT_CLS 2   '@1256b
PRINT " Imprimo Nome das Lajes  S/N  *"; V_1556$; "* ";   '@12579 DS:1f68,2020
CALL MIXT_07f1_LimpaTeclado   '@12599
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@125a3 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_125e4   '@125bd
V_0e0c$ = V_1556$   '@125d2
L_125e4:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@125e4 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_1263c   '@1260b DS:1c48
BEEP   '@1262a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12566   '@12634
L_1263c:
V_1556$ = UCASE$(V_0e0c$)   '@1263c
IF NOT (V_1556$ = "S") THEN GOTO L_1274b   '@12654 DS:1c48
PRINT " Imprimo Espessura das Lajes  S/N  *"; V_155a$; "* ";   '@1266b DS:1f68,2044
CALL MIXT_07f1_LimpaTeclado   '@1268b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12695 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_126d6   '@126af
V_0e0c$ = V_155a$   '@126c4
L_126d6:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@126d6 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_1272e   '@126fd DS:1c48
BEEP   '@1271c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12566   '@12726
L_1272e:
V_155a$ = UCASE$(V_0e0c$)   '@1272e
L_1274b:
L_12750:
RT_CLS 2   '@12755
PRINT " Imprimo Nome das Vigas  S/N  *"; V_155e$; "* ";   '@12763 DS:1f68,206c
CALL MIXT_07f1_LimpaTeclado   '@12783
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@1278d DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_127ce   '@127a7
V_0e0c$ = V_155e$   '@127bc
L_127ce:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@127ce DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12826   '@127f5 DS:1c48
BEEP   '@12814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12750   '@1281e
L_12826:
V_155e$ = UCASE$(V_0e0c$)   '@12826
IF NOT (V_155e$ = "S") THEN GOTO L_12935   '@1283e DS:1c48
PRINT " Imprimo Secao das Vigas  S/N  *"; V_1562$; "* ";   '@12855 DS:1f68,2090
CALL MIXT_07f1_LimpaTeclado   '@12875
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@1287f DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_128c0   '@12899
V_0e0c$ = V_1562$   '@128ae
L_128c0:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@128c0 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12918   '@128e7 DS:1c48
BEEP   '@12906
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12750   '@12910
L_12918:
V_1562$ = UCASE$(V_0e0c$)   '@12918
L_12935:
L_1293a:
RT_CLS 2   '@1293f
PRINT " Imprimo Nome dos Pilares  S/N  *"; V_1566$; "* ";   '@1294d DS:1f68,20b4
CALL MIXT_07f1_LimpaTeclado   '@1296d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12977 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_129b8   '@12991
V_0e0c$ = V_1566$   '@129a6
L_129b8:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@129b8 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12a10   '@129df DS:1c48
BEEP   '@129fe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_1293a   '@12a08
L_12a10:
V_1566$ = UCASE$(V_0e0c$)   '@12a10
PRINT " Imprimo Secao dos Pilares  S/N  *"; V_156a$; "* ";   '@12a28 DS:1f68,20da
CALL MIXT_07f1_LimpaTeclado   '@12a48
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12a52 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_12a93   '@12a6c
V_0e0c$ = V_156a$   '@12a81
L_12a93:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@12a93 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12aeb   '@12aba DS:1c48
BEEP   '@12ad9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_1293a   '@12ae3
L_12aeb:
V_156a$ = UCASE$(V_0e0c$)   '@12aeb
L_12b08:
RT_CLS 2   '@12b0d
PRINT " Imprimo Cotas e Medidas  S/N  *"; V_156e$; "* ";   '@12b1b DS:1f68,2100
CALL MIXT_07f1_LimpaTeclado   '@12b3b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12b45 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_12b86   '@12b5f
V_0e0c$ = V_156e$   '@12b74
L_12b86:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@12b86 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12bde   '@12bad DS:1c48
BEEP   '@12bcc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12b08   '@12bd6
L_12bde:
V_156e$ = UCASE$(V_0e0c$)   '@12bde
L_12bfb:
RT_CLS 2   '@12c00
PRINT " Desenho Cortes e Elevacao das Vigas  S/N  *"; V_1572$; "* ";   '@12c0e DS:1f68,2124
CALL MIXT_07f1_LimpaTeclado   '@12c2e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12c38 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_12c79   '@12c52
V_0e0c$ = V_1572$   '@12c67
L_12c79:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@12c79 DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12cd1   '@12ca0 DS:1c48
BEEP   '@12cbf
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12bfb   '@12cc9
L_12cd1:
V_1572$ = UCASE$(V_0e0c$)   '@12cd1
IF NOT (V_1572$ = "S") THEN GOTO L_12de0   '@12ce9 DS:1c48
PRINT " Imprimo valores de Elevacao das Vigas  S/N  *"; V_1576$; "* ";   '@12d00 DS:1f68,2154
CALL MIXT_07f1_LimpaTeclado   '@12d20
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "", V_0e0c$   '@12d2a DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_12d6b   '@12d44
V_0e0c$ = V_1576$   '@12d59
L_12d6b:
L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@12d6b DS:1e3e
IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_12dc3   '@12d92 DS:1c48
BEEP   '@12db1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_12bfb   '@12dbb
L_12dc3:
V_1576$ = UCASE$(V_0e0c$)   '@12dc3
L_12de0:
GOTO L_12faf   '@12de0
L_12de8:
IF NOT (V_186a$ <> "Z") THEN GOTO L_12e0c   '@12de8 DS:2186
IF NOT (V_186a$ = "z") THEN GOTO L_12f5c   '@12dfa DS:218c
L_12e0c:
RT_VIEWPRINT 23, 25   '@12e0c
RT_CLS 2   '@12e1e
RT_VIEWPRINT 1, 25   '@12e2c
LOCATE 24, 1   '@12e3e
PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@12e59 DS:2192
V_0e1c$ = "ZOOM"   '@12e67 DS:21e0
CALL MIXT_07f1_LimpaTeclado   '@12e79
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@12e83
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_18ce$ = V_0e0c$   '@12e9f
IF NOT (V_18ce$ <> "D") THEN GOTO L_12eda   '@12eb1 DS:1ca8
IF NOT (V_18ce$ = "d") THEN GOTO L_12f13   '@12ec8 DS:1cae
L_12eda:
CALL S_235b9   '@12eda
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "FIM") THEN GOTO L_12f03   '@12ee4 DS:1cb4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@12efb
L_12f03:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10755   '@12f03
L_12f13:
IF NOT (V_18ce$ <> "T") THEN GOTO L_12f37   '@12f13 DS:1cbc
IF NOT (V_18ce$ = "t") THEN GOTO L_12f47   '@12f25 DS:1cc2
L_12f37:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_106a9   '@12f37
L_12f47:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@12f47
L_12f5c:
IF NOT (V_186a$ <> "F") THEN GOTO L_12f80   '@12f5c DS:21e8
IF NOT (V_186a$ = "f") THEN GOTO L_12fa2   '@12f6e DS:21ee
L_12f80:
V_0e0c$ = "FORMA"   '@12f80 DS:21f4
GOTO L_14a61   '@12f92
L_12fa2:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_107db   '@12fa2
L_12faf:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10787   '@12faf
' ---- F_12fb7 @0x12fb7  (012fb7_F_12fb7.lift.txt; evidence_id (assembly): ev_d13db2e1a9b58008f0257226fda4c7e9c7440a676356464cbe0c65db7cd107b7)
L_12fbc:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMPLOT
LOCATE 1, 1   '@12fc1
COLOR RT_CINT%(FX##(V_0dc0!))   '@12fd6
PRINT RT_STRINGS$((80), ("Í"));   '@12ff3 DS:21fe
PRINT " Desenho e Plotagem de Formas"   '@1300b DS:2204
PRINT " Configuracao do tamanho da folha de Plotagem e Escala"   '@13019 DS:2226
PRINT RT_STRINGS$((80), ("Í"));   '@13027 DS:21fe
LOCATE 5, 1   '@1303f
COLOR 14   '@1305a
PRINT " - Area de Plotagem e Bordas"   '@13070 DS:2260
PRINT ""   '@1307e DS:1b40
COLOR 7   '@1308c
PRINT "   largura da folha ";   '@130a2 DS:2280
COLOR RT_CINT%(FX##(V_0dc0!))   '@130b0
PRINT V_1530%;   '@130cd
COLOR 7   '@130db
PRINT "mm   ";   '@130f1 DS:2298
PRINT RT_TAB$(40); ""; "altura da folha ";   '@130ff DS:1b40,22a2
COLOR RT_CINT%(FX##(V_0dc0!))   '@1311f
PRINT V_1532%;   '@1313c
COLOR 7   '@1314a
PRINT "mm   "   '@13160 DS:2298
PRINT "   margem esquerda  ";   '@1316e DS:22b6
COLOR RT_CINT%(FX##(V_0dc0!))   '@1317c
PRINT V_1534%;   '@13199
COLOR 7   '@131a7
PRINT "mm   ";   '@131bd DS:2298
PRINT RT_TAB$(40); ""; "outras margens  ";   '@131cb DS:1b40,22ce
COLOR RT_CINT%(FX##(V_0dc0!))   '@131eb
PRINT V_1536%;   '@13208
COLOR 7   '@13216
PRINT "mm   "   '@1322c DS:2298
PRINT "   largura do carimbo ";   '@1323a DS:22e2
COLOR RT_CINT%(FX##(V_0dc0!))   '@13248
PRINT V_1538%;   '@13265
COLOR 7   '@13273
PRINT "mm   ";   '@13289 DS:2298
PRINT RT_TAB$(40); ""; "altura do carimbo ";   '@13297 DS:1b40,22fc
COLOR RT_CINT%(FX##(V_0dc0!))   '@132b7
PRINT V_153a%;   '@132d4
COLOR 7   '@132e2
PRINT "mm   "   '@132f8 DS:2298
PRINT "   escala do desenho 1/";   '@13306 DS:2312
COLOR RT_CINT%(FX##(V_0dc0!))   '@13314
PRINT V_153c%; "   "   '@13331 DS:232e
LOCATE 12, 1   '@13348
COLOR 14   '@13363
PRINT " - Drives e Extensoes de arquivos"   '@13379 DS:2336
PRINT ""   '@13387 DS:1b40
COLOR 7   '@13395
PRINT "   drive gravacao folha   (.DXF) ";   '@133ab DS:235c
COLOR RT_CINT%(FX##(V_0dc0!))   '@133b9
PRINT V_0e4a$; RT_TAB$(70); ""; ""   '@133d6 DS:1b40
COLOR 7   '@133ff
PRINT "   drive de plotagem      (.PLT) ";   '@13415 DS:2382
COLOR RT_CINT%(FX##(V_0dc0!))   '@13423
PRINT V_0e52$; RT_TAB$(70); ""; ""   '@13440 DS:1b40
LOCATE 17, 1   '@13469
COLOR 14   '@13484
PRINT " - Grandezas de Escrita   altura de letra (mm) para :"   '@1349a DS:23a8
PRINT ""   '@134a8 DS:1b40
V_0e0c$ = "##.#    "   '@134b6 DS:23e2
COLOR 7   '@134c8
PRINT RT_TAB$(5); ""; "coluna    ";   '@134de DS:1b40,23ee
COLOR RT_CINT%(FX##(V_0dc0!))   '@134fe
PRINT USING V_0e0c$; RT_PU#(V_153e!, V_0e0c$, 1);   '@1351b
COLOR 7   '@1353b
PRINT RT_TAB$(30); ""; "vigas     ";   '@13551 DS:1b40,23fc
COLOR RT_CINT%(FX##(V_0dc0!))   '@13571
PRINT USING V_0e0c$; RT_PU#(V_1542!, V_0e0c$, 1);   '@1358e
COLOR 7   '@135ae
PRINT RT_TAB$(55); ""; "lajes     ";   '@135c4 DS:1b40,240a
COLOR RT_CINT%(FX##(V_0dc0!))   '@135e4
PRINT USING V_0e0c$; RT_PU#(V_1546!, V_0e0c$, 1)   '@13601
COLOR 7   '@1361c
PRINT RT_TAB$(5); ""; "amarracao ";   '@13632 DS:1b40,2418
COLOR RT_CINT%(FX##(V_0dc0!))   '@13652
PRINT USING V_0e0c$; RT_PU#(V_154a!, V_0e0c$, 1);   '@1366f
COLOR 7   '@1368f
PRINT RT_TAB$(30); ""; "elevacao  ";   '@136a5 DS:1b40,2426
COLOR RT_CINT%(FX##(V_0dc0!))   '@136c5
PRINT USING V_0e0c$; RT_PU#(V_154e!, V_0e0c$, 1);   '@136e2
COLOR 7   '@13702
PRINT RT_TAB$(55); ""; "extras    ";   '@13718 DS:1b40,2434
COLOR RT_CINT%(FX##(V_0dc0!))   '@13738
PRINT USING V_0e0c$; RT_PU#(V_1552!, V_0e0c$, 1)   '@13755
RETURN   '@13770
L_1377f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMPLOT
FOR V_11b8! = 19.0 TO 22.0   '@13784 DS:1b9a,1f12,2442
ON KEY(RT_CINT%(FX##(V_11b8!))) GOSUB L_145ea
RT_ONKEY RT_CINT%(FX##(V_11b8!)), 1   '@13792
KEY(RT_CINT%(FX##(V_11b8!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_11b8!)), 1   '@137ac
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@137c1 DS:1b9a,2442
COLOR 11   '@137ea
LOCATE 24, 1   '@13800
PRINT "       Acione   <Enter> para manter   ou   <ESC> <Enter> para Retornar"   '@1381b DS:2446
COLOR 3   '@13829
L_13844:
CALL MIXT_07f1_LimpaTeclado   '@13849
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 7, 22   '@13853
RT_LINEINPUT "", V_0e0c$   '@13871 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_138f6   '@1388b DS:1f02
V_1530% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@138af
LOCATE 7, 21   '@138ca
PRINT V_1530%   '@138e8
L_138f6:
L_138fb:
CALL MIXT_07f1_LimpaTeclado   '@13900
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 7, 57   '@1390a
RT_LINEINPUT "", V_0e0c$   '@13928 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_139ad   '@13942 DS:1f02
V_1532% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13966
LOCATE 7, 56   '@13981
PRINT V_1532%   '@1399f
L_139ad:
IF NOT (V_0e0c$ = "R") THEN GOTO L_139cc   '@139ad DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13844   '@139c4
L_139cc:
L_139d1:
CALL MIXT_07f1_LimpaTeclado   '@139d6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 8, 22   '@139e0
RT_LINEINPUT "", V_0e0c$   '@139fe DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_13a83   '@13a18 DS:1f02
V_1534% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13a3c
LOCATE 8, 21   '@13a57
PRINT V_1534%   '@13a75
L_13a83:
IF NOT (V_0e0c$ = "R") THEN GOTO L_13aa2   '@13a83 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_138fb   '@13a9a
L_13aa2:
L_13aa7:
CALL MIXT_07f1_LimpaTeclado   '@13aac
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 8, 57   '@13ab6
RT_LINEINPUT "", V_0e0c$   '@13ad4 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_13b59   '@13aee DS:1f02
V_1536% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13b12
LOCATE 8, 56   '@13b2d
PRINT V_1536%   '@13b4b
L_13b59:
IF NOT (V_0e0c$ = "R") THEN GOTO L_13b78   '@13b59 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_139d1   '@13b70
L_13b78:
L_13b7d:
CALL MIXT_07f1_LimpaTeclado   '@13b82
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 9, 24   '@13b8c
RT_LINEINPUT "", V_0e0c$   '@13baa DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_13c2f   '@13bc4 DS:1f02
V_1538% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13be8
LOCATE 9, 23   '@13c03
PRINT V_1538%   '@13c21
L_13c2f:
IF NOT (V_0e0c$ = "R") THEN GOTO L_13c4e   '@13c2f DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13aa7   '@13c46
L_13c4e:
L_13c53:
CALL MIXT_07f1_LimpaTeclado   '@13c58
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 9, 59   '@13c62
RT_LINEINPUT "", V_0e0c$   '@13c80 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_13d05   '@13c9a DS:1f02
V_153a% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13cbe
LOCATE 9, 58   '@13cd9
PRINT V_153a%   '@13cf7
L_13d05:
IF NOT (V_0e0c$ = "R") THEN GOTO L_13d24   '@13d05 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13b7d   '@13d1c
L_13d24:
L_13d29:
CALL MIXT_07f1_LimpaTeclado   '@13d2e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 10, 25   '@13d38
RT_LINEINPUT "", V_0e0c$   '@13d56 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "R") THEN GOTO L_13d8f   '@13d70 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13c53   '@13d87
L_13d8f:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_13dfa   '@13d8f DS:1f02
V_153c% = RT_CINT%(FX##(VAL(V_0e0c$)))   '@13db3
LOCATE 10, 24   '@13dce
PRINT V_153c%   '@13dec
L_13dfa:
L_13dff:
CALL MIXT_07f1_LimpaTeclado   '@13e04
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 14, LEN(V_0e4a$) + 34   '@13e0e
RT_LINEINPUT "", V_0e0c$   '@13e35 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "R") THEN GOTO L_13e6e   '@13e4f DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13d29   '@13e66
L_13e6e:
IF NOT (LEN(V_0e0c$) > 0) THEN GOTO L_13fd0   '@13e6e
L_BP0c% = (RT_MID$((V_0e0c$), (2), (1)) = ":")   '@13e83 DS:2496
IF NOT ((LEN(V_0e0c$) = 1 OR L_BP0c%) <> 0) THEN GOTO L_13ee4   '@13eb2
V_0e18$ = V_0e0c$   '@13eca
GOTO L_13f05   '@13edc
L_13ee4:
V_0e18$ = V_0e4a$ + V_0e0c$   '@13ee4
L_13f05:
IF NOT (LEN(V_0e18$) = 1) THEN GOTO L_13f37   '@13f05
V_0e18$ = V_0e18$ + ":\"   '@13f1b DS:249c
L_13f37:
IF NOT (RT_MID$((V_0e18$), (LEN(V_0e18$)), (1)) <> "\") THEN GOTO L_13f7b   '@13f37 DS:24a2
V_0e18$ = V_0e18$ + "\"   '@13f5f DS:24a2
L_13f7b:
V_0e4a$ = V_0e18$   '@13f7b
LOCATE 14, 34   '@13f8d
PRINT V_0e18$; RT_TAB$(79); "";   '@13fab DS:1b40
L_13fd0:
L_13fd5:
CALL MIXT_07f1_LimpaTeclado   '@13fda
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 15, LEN(V_0e52$) + 34   '@13fe4
RT_LINEINPUT "", V_0e0c$   '@1400b DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "R") THEN GOTO L_14044   '@14025 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13dff   '@1403c
L_14044:
IF NOT (LEN(V_0e0c$) > 0) THEN GOTO L_141a6   '@14044
L_BP0c% = (RT_MID$((V_0e0c$), (2), (1)) = ":")   '@14059 DS:2496
IF NOT ((LEN(V_0e0c$) = 1 OR L_BP0c%) <> 0) THEN GOTO L_140ba   '@14088
V_0e18$ = V_0e0c$   '@140a0
GOTO L_140db   '@140b2
L_140ba:
V_0e18$ = V_0e52$ + V_0e0c$   '@140ba
L_140db:
IF NOT (LEN(V_0e18$) = 1) THEN GOTO L_1410d   '@140db
V_0e18$ = V_0e18$ + ":\"   '@140f1 DS:249c
L_1410d:
IF NOT (RT_MID$((V_0e18$), (LEN(V_0e18$)), (1)) <> "\") THEN GOTO L_14151   '@1410d DS:24a2
V_0e18$ = V_0e18$ + "\"   '@14135 DS:24a2
L_14151:
V_0e52$ = V_0e18$   '@14151
LOCATE 15, 34   '@14163
PRINT V_0e18$; RT_TAB$(79); "";   '@14181 DS:1b40
L_141a6:
L_141ab:
CALL MIXT_07f1_LimpaTeclado   '@141b0
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 19, 16   '@141ba
RT_LINEINPUT "", V_0e0c$   '@141d8 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_14230   '@141f2 DS:1f02
V_153e! = VAL(V_0e0c$)   '@14216
L_14230:
IF NOT (V_0e0c$ = "R") THEN GOTO L_1424f   '@14230 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_13fd5   '@14247
L_1424f:
L_14254:
CALL MIXT_07f1_LimpaTeclado   '@14259
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 19, 41   '@14263
RT_LINEINPUT "", V_0e0c$   '@14281 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_142d9   '@1429b DS:1f02
V_1542! = VAL(V_0e0c$)   '@142bf
L_142d9:
IF NOT (V_0e0c$ = "R") THEN GOTO L_142f8   '@142d9 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_141ab   '@142f0
L_142f8:
L_142fd:
CALL MIXT_07f1_LimpaTeclado   '@14302
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 19, 66   '@1430c
RT_LINEINPUT "", V_0e0c$   '@1432a DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_14382   '@14344 DS:1f02
V_1546! = VAL(V_0e0c$)   '@14368
L_14382:
IF NOT (V_0e0c$ = "R") THEN GOTO L_143a1   '@14382 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_14254   '@14399
L_143a1:
L_143a6:
CALL MIXT_07f1_LimpaTeclado   '@143ab
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 20, 16   '@143b5
RT_LINEINPUT "", V_0e0c$   '@143d3 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_1442b   '@143ed DS:1f02
V_154a! = VAL(V_0e0c$)   '@14411
L_1442b:
IF NOT (V_0e0c$ = "R") THEN GOTO L_1444a   '@1442b DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_142fd   '@14442
L_1444a:
L_1444f:
CALL MIXT_07f1_LimpaTeclado   '@14454
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 20, 41   '@1445e
RT_LINEINPUT "", V_0e0c$   '@1447c DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_144d4   '@14496 DS:1f02
V_154e! = VAL(V_0e0c$)   '@144ba
L_144d4:
IF NOT (V_0e0c$ = "R") THEN GOTO L_144f3   '@144d4 DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_143a6   '@144eb
L_144f3:
CALL MIXT_07f1_LimpaTeclado   '@144fd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
LOCATE 20, 66   '@14507
RT_LINEINPUT "", V_0e0c$   '@14525 DS:1b40
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_1457d   '@1453f DS:1f02
V_1552! = VAL(V_0e0c$)   '@14563
L_1457d:
IF NOT (V_0e0c$ = "R") THEN GOTO L_1459c   '@1457d DS:2490
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_1444f   '@14594
L_1459c:
LOCATE 23, 1   '@1459c
PRINT RT_TAB$(75); "";   '@145b7 DS:1b40
GOSUB L_14650   '@145ce
RETURN   '@145db
L_145ea:
V_0e0c$ = "R"   '@145ef DS:2490
RETURN   '@14601
L_14610:   ' entrada vinda de 010030_M_FORMPLOT
RESUME L_14627   '@14615
L_14627:
GOSUB L_14650   '@1462c
CALL S_150d7   '@14639
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_10669   '@14643
' ---- F_1464b @0x1464b  (01464b_F_1464b.lift.txt; evidence_id (assembly): ev_34aadac79a5f34aae2acba095c2d7e36c681bf5c00762590bdc414c391b2ad30)
L_14650:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMPLOT, 012fb7_F_12fb7
FOR V_18d2! = 1.0 TO 10.0   '@14655 DS:1b9a,1d48
ON KEY(RT_CINT%(FX##(V_18d2!))) GOSUB L_148f5
RT_ONKEY RT_CINT%(FX##(V_18d2!)), 2   '@14662
KEY(RT_CINT%(FX##(V_18d2!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_18d2!)), 1   '@1467c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_18d2!   '@14691 DS:1b9a,1d48
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@146ba
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@146e2
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1470a
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@14732
FOR V_18d2! = 15.0 TO 18.0   '@1475a DS:1b9a,24a8,24ac
ON KEY(RT_CINT%(FX##(V_18d2!))) GOSUB L_14920
RT_ONKEY RT_CINT%(FX##(V_18d2!)), 3   '@14768
KEY(RT_CINT%(FX##(V_18d2!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_18d2!)), 1   '@14782
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_18d2!   '@14797 DS:1b9a,24ac
ON KEY(2) GOSUB L_14920
RT_ONKEY 2, 3   '@147c0
KEY(2) ON
RT_KEYESTADO 2, 1   '@147d3
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@147e1
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@14809
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@14831
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@14859
FOR V_18d2! = 19.0 TO 22.0   '@14880 DS:1b9a,1f12,2442
ON KEY(RT_CINT%(FX##(V_18d2!))) GOSUB L_14a1e
RT_ONKEY RT_CINT%(FX##(V_18d2!)), 4   '@1488e
KEY(RT_CINT%(FX##(V_18d2!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_18d2!)), 1   '@148a8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
NEXT V_18d2!   '@148bd DS:1b9a,2442
RETURN   '@148e6
L_148f5:
BEEP   '@148fa
GOSUB L_14650   '@14904
RETURN   '@14911
L_14920:
RT_SCREEN 0   '@14925
RT_VIEWPRINT 1, 25   '@1493a
COLOR 7, 0, 0   '@1494c
RT_CLS 0   '@14970
PRINT " Aguarde ..."   '@1497d DS:24b0
PRINT ""   '@1498b DS:1b40
PRINT " Retorno ao Modulo Basico de FORMA"   '@14999 DS:24c0
V_157a$ = "FORMPLOT"   '@149a7 DS:24e6
ON ERROR GOTO L_149e5
RT_ONERR = &H149e5   '@149b9
RT_CHAIN V_0e3a$ + "FORMA"   '@149c8 DS:21f4
L_149e5:
PRINT " Modulo nao encontrado em "; V_0e3a$   '@149ea DS:24f2
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@14a01 DS:1b5e
RT_FIM   '@14a0f (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_14a1e:
BEEP   '@14a23
GOSUB L_14650   '@14a2d
RT_SCREEN 0   '@14a3a
RETURN L_10669   '@14a59
' ---- FUN_1000_4a61 @0x14a61  (014a61_FUN_1000_4a61.lift.txt; evidence_id (assembly): ev_84f561b8298687b7551a9cccd1ca163b5fd196715453a89171d72d895f884402)
L_14a61:   ' entrada vinda de 010030_M_FORMPLOT
V_157a$ = "FORMPLOT"   '@14a66 DS:24e6
ON ERROR GOTO L_14af1
RT_ONERR = &H14af1   '@14a78
V_11d4! = RT_FRE&("")   '@14a87 DS:1b40
L_BP0c% = (LEN(V_0e3a$) > 3)   '@14aa1
CHDIR RT_ARQ$(RT_LEFT$((V_0e3a$), (LEN(V_0e3a$) + L_BP0c%)))   '@14ac0
RT_CHAIN V_0e3a$ + V_0e0c$   '@14ad4
L_14af1:
RESUME L_14b08   '@14af6
L_14b08:
L_BP0c% = (V_0e3a$ = "A:\")   '@14b0d DS:2510
IF NOT ((V_0e3a$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_14ba7   '@14b32 DS:2518
LOCATE 23, 10   '@14b47
PRINT " Coloque o Disco FORMA no Drive "; V_0e3a$   '@14b65 DS:2520
CALL MIXT_07f1_LimpaTeclado   '@14b7c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@14b86
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY pelo roteiro (entre comandos)
L_14ba7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_145ea, L_148f5, L_14920, L_14a1e   ' ON KEY no laco (B$EVCK)
GOTO L_14a61   '@14ba7
' ---- M_FORMPLUX @0x20030  (020030_M_FORMPLUX.lift.txt; evidence_id (assembly): ev_7260517d0f34784c15e5e88392870e20e0219ff526ef40edcdab4ddb795eb59c)
' @20030 inicio do programa (B$?EVT)
GOTO L_20f42   '@2017f
' ---- FUN_2000_0f42 @0x20f42  (020f42_FUN_2000_0f42.lift.txt; evidence_id (assembly): ev_28e128712c6abe3a6c1119a9265628ea0e15d0820273c62bc1dd5adb14e51836)
L_20f42:   ' entrada vinda de 020030_M_FORMPLUX
GOTO L_21417   '@20f42
' ---- FUN_2000_1417 @0x21417  (021417_FUN_2000_1417.lift.txt; evidence_id (assembly): ev_a356e1b52187e30dc45246a52f3433578c7aa21f6ac346b98b7429b935dff324)
L_21417:   ' entrada vinda de 020f42_FUN_2000_0f42
GOTO L_216b9   '@21417
' ---- FUN_2000_16b9 @0x216b9  (0216b9_FUN_2000_16b9.lift.txt; evidence_id (assembly): ev_95943f5be34c7c60565ad63d1303b911c7e761561bf413fea66cb5debf7a73df)
L_216b9:   ' entrada vinda de 021417_FUN_2000_1417
GOTO L_21de5   '@216b9
' ---- FUN_2000_1de5 @0x21de5  (021de5_FUN_2000_1de5.lift.txt; evidence_id (assembly): ev_bd9195e77016b32ea80a79428df92d8beee5b48df2201c9bf4b70009f36116bd)
L_21de5:   ' entrada vinda de 0216b9_FUN_2000_16b9
GOTO L_22087   '@21de5
' ---- FUN_2000_2087 @0x22087  (022087_FUN_2000_2087.lift.txt; evidence_id (assembly): ev_bceb83874c8e5f045e57fee98410141ea7bf64ecaf57ba6cec37f5ebac4433de)
L_22087:   ' entrada vinda de 021de5_FUN_2000_1de5
GOTO L_22bae   '@22087
' ---- FUN_2000_2bae @0x22bae  (022bae_FUN_2000_2bae.lift.txt; evidence_id (assembly): ev_4235d127159320a6626a30366a0e399a471960098be826dce9cb1ea1fd7efbf2)
L_22bae:   ' entrada vinda de 022087_FUN_2000_2087
GOTO L_235b1   '@22bae
' ---- FUN_2000_35b1 @0x235b1  (0235b1_FUN_2000_35b1.lift.txt; evidence_id (assembly): ev_ea949760c429888dd4d59b658edfd7cf40a4d56b0ad0224da595f35539a2b709)
L_235b1:   ' entrada vinda de 022bae_FUN_2000_2bae
GOTO L_24c8f   '@235b1
' ---- RT_EA @0x24c8f  (024c8f_RT_EA.lift.txt; evidence_id (assembly): ev_f6d11491b5d8fc1ff54f8ea966c803311d29fc2fbb8e20ca81d7370898df19ce)
L_24c8f:   ' entrada vinda de 0235b1_FUN_2000_35b1
RT_FIM   ' @24c8f B$CENP (inicio/fim do modulo)
' ---- M_FORMPLPL @0x30030  (030030_M_FORMPLPL.lift.txt; evidence_id (assembly): ev_92aade024fd4cebde465506eed77d24796742ccbe055989ee711c456c0691d29)
' @30030 inicio do programa (B$?EVT)
GOTO L_398b8   '@3017a
' ---- RT_EA @0x398b8  (0398b8_RT_EA.lift.txt; evidence_id (assembly): ev_0c54d4911242edff1080657c0e68ef37144231599c31047dd745d4ca3a71fa79)
L_398b8:   ' entrada vinda de 030030_M_FORMPLPL
RT_FIM   ' @398b8 B$CENP (inicio/fim do modulo)
' ---- M_FORMPLDX @0x40030  (040030_M_FORMPLDX.lift.txt; evidence_id (assembly): ev_10887b91b4d8203b420e190c0cf40953ecb1c781c8b724551935deef6c1780d4)
' @40030 inicio do programa (B$?EVT)
GOTO L_48b34   '@40166
' ---- RT_EA @0x48b34  (048b34_RT_EA.lift.txt; evidence_id (assembly): ev_3dc8829ead1c18a590efe6da86837c97960d49852f855607db18f7344ebaf097)
L_48b34:   ' entrada vinda de 040030_M_FORMPLDX
RT_FIM   ' @48b34 B$CENP (inicio/fim do modulo)
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
    REDIM A_19f8%(-32768 TO -32768)
    REDIM A_1a26%(-32768 TO -32768)
    REDIM A_1acc!(-32768 TO -32768, -32768 TO -32768)
    V_1866! = 0
    V_186a$ = ""
    V_186e$ = ""
    V_1872! = 0
    V_1876! = 0
    V_187a! = 0
    V_187e! = 0
    V_1882$ = ""
    V_1886! = 0
    V_188a! = 0
    V_188e! = 0
    V_1892! = 0
    V_1896! = 0
    V_189a! = 0
    V_189e! = 0
    V_18a2! = 0
    V_18a6! = 0
    V_18aa! = 0
    V_18ae! = 0
    V_18b2! = 0
    V_18b6! = 0
    V_18ba! = 0
    V_18be! = 0
    V_18c2! = 0
    V_18c6! = 0
    V_18ca! = 0
    V_18ce$ = ""
    V_18d2! = 0
    V_19e4! = 0
    V_19e8! = 0
    V_19ec$ = ""
    V_19f0! = 0
    V_19f4$ = ""
    V_1a54$ = ""
    V_1a58$ = ""
    V_1a5c$ = ""
    V_1a60$ = ""
    V_1a64$ = ""
    V_1a68$ = ""
    V_1a6c$ = ""
    V_1a70$ = ""
    V_1a74$ = ""
    V_1a78$ = ""
    V_1a7c! = 0
    V_1a80$ = ""
    V_1a84$ = ""
    V_1a88$ = ""
    V_1a8c! = 0
    V_1a90$ = ""
    V_1a94! = 0
    V_1a98! = 0
    V_1a9c! = 0
    V_1aa0! = 0
    V_1aa4! = 0
    V_1aa8! = 0
    V_1aac! = 0
    V_1ab0! = 0
    V_1ab4! = 0
    V_1ab8! = 0
    V_1abc! = 0
    V_1ac0! = 0
    V_1ac4! = 0
    V_1ac8! = 0
    V_1afa! = 0
    V_1afe! = 0
    V_1b02! = 0
    V_1b06! = 0
    V_1b0a! = 0
    V_1b0e! = 0
    V_1b12! = 0
    V_1b16! = 0
    V_1b1a! = 0
    V_1b1e! = 0
    V_1b22! = 0
    V_1b26! = 0
    V_1b2a! = 0
    V_1b2e! = 0
    V_1b32! = 0
    V_1b36! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_145ea: sai da SUB (V_0e0c$ = "R"; RETURN)
        CASE 2   ' L_148f5: BEEP; GOSUB L_14650; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 3   ' L_14920: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 4   ' L_14a1e: sai da SUB (BEEP; GOSUB L_14650; RT_SCREEN 0; RETURN L_10669)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H14610: ON ERROR GOTO L_14610
        CASE &H149e5: ON ERROR GOTO L_149e5
        CASE &H14af1: ON ERROR GOTO L_14af1
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_14bb7   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x14bb7)
    DIM L_BP0e$
    ' ---- FUN_1000_4bb7 @0x14bb7  (014bb7_FUN_1000_4bb7.lift.txt; evidence_id (assembly): ev_a3e2de859231764c5243647760afa3aade71c9410d4879b1f6b9aac8e57d3433)
    L_BP0e$ = V_0dcc$   '@14bbf
    IF NOT (L_BP0e$ = "HER") THEN GOTO L_14c4a   '@14bd1 DS:2544
    RT_SCREEN 3   '@14be8
    V_1afa! = 7.0   '@14bfe DS:254c
    V_1afe! = 7.0   '@14c0f DS:254c
    V_1b02! = 7.0   '@14c20 DS:254c
    V_1b06! = 0.0   '@14c31 DS:1cc8
    GOTO L_14d69   '@14c42
L_14c4a:
    IF NOT (L_BP0e$ <> "CGA") THEN GOTO L_14c6e   '@14c4a DS:2550
    IF NOT (L_BP0e$ = "MCG") THEN GOTO L_14ccd   '@14c5c DS:2558
L_14c6e:
    RT_SCREEN 2   '@14c6e
    V_1afa! = 15.0   '@14c81 DS:24a8
    V_1afe! = 15.0   '@14c92 DS:24a8
    V_1b02! = 15.0   '@14ca3 DS:24a8
    V_1b06! = 0.0   '@14cb4 DS:1cc8
    GOTO L_14d69   '@14cc5
L_14ccd:
    IF NOT (L_BP0e$ <> "EGA") THEN GOTO L_14cf1   '@14ccd DS:2560
    IF NOT (L_BP0e$ = "VGA") THEN GOTO L_14d69   '@14cdf DS:2568
L_14cf1:
    RT_SCREEN 9   '@14cf1
    COLOR , 1   '@14d07
    V_1afa! = 15.0   '@14d1d DS:24a8
    V_1afe! = 14.0   '@14d2e DS:2570
    V_1b02! = 11.0   '@14d3f DS:2574
    V_1b06! = 1.0   '@14d50 DS:1b9a
    GOTO L_14d69   '@14d61
L_14d69:
    V_1b0a! = 40.0   '@14d69 DS:2578
    V_1b0e! = 165.0   '@14d7a DS:257c
    V_1b12! = 560.0 / (FX##(V_1b22!) - V_1b1a!)   '@14d8b DS:2580
    V_1b16! = 145.0 / (FX##(V_1b26!) - V_1b1e!)   '@14da9 DS:2584
    IF NOT (FX##(V_1b16!) / V_1b12! > 0.41670000553131103515625##) THEN GOTO L_14e05   '@14dc7 DS:1e50
    V_1b16! = V_1b12! * 0.41670000553131103515625##   '@14de7 DS:1e50
    GOTO L_14e20   '@14dfd
L_14e05:
    V_1b12! = V_1b16! / 0.41670000553131103515625##   '@14e05 DS:1e50
L_14e20:
    RT_CLS 0   '@14e20
    RT_WINDOW 1, (0), (0), (639), (199)   '@14e2d DS:1cc8,1cca,1e54,1e56,1e58,1e5a (B$WIND decodificado)
    ' @14e5b libera strings locais (L_BP0e)
    ' END SUB   '@14e69
END SUB

SUB S_14e79   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x14e79)
    ' ---- FUN_1000_4e79 @0x14e79  (014e79_FUN_1000_4e79.lift.txt; evidence_id (assembly): ev_0c94d64197843a6466b0a2769cb025b9687798f07365ea747a7f27242523266f)
    IF NOT (V_1aa8! = V_1ab0! OR V_1a98! = V_1aa0!) THEN GOTO L_14f04   '@14e81
    V_1ab8! = V_1a98!   '@14ebf
    IF NOT (V_1aa8! = V_1ab0!) THEN GOTO L_14efc   '@14ed0
    V_1ab8! = V_1aa8!   '@14eeb
L_14efc:
    GOTO L_14fa2   '@14efc
L_14f04:
    V_1ab8! = FX##(V_1a9c!) - V_1aac! + ((FX##(V_1aac!) - V_1aa4!) / (FX##(V_1ab0!) - V_1aa8!) * V_1ab0! - (FX##(V_1a9c!) - V_1a94!) / (FX##(V_1aa0!) - V_1a98!) * V_1aa0!)   '@14f04
    V_1ab8! = V_1ab8! / ((FX##(V_1aac!) - V_1aa4!) / (FX##(V_1ab0!) - V_1aa8!) - (FX##(V_1a9c!) - V_1a94!) / (FX##(V_1aa0!) - V_1a98!))   '@14f58
L_14fa2:
    IF NOT (V_1aa4! = V_1aac! OR V_1a94! = V_1a9c!) THEN GOTO L_15025   '@14fa2
    V_1ab4! = V_1a94!   '@14fe0
    IF NOT (V_1aa4! = V_1aac!) THEN GOTO L_1501d   '@14ff1
    V_1ab4! = V_1aa4!   '@1500c
L_1501d:
    GOTO L_150c2   '@1501d
L_15025:
    IF NOT (V_1a98! = V_1aa0!) THEN GOTO L_15080   '@15025
    V_1ab4! = V_1aac! - (FX##(V_1ab0!) - V_1ab8!) * (FX##(V_1aac!) - V_1aa4!) / (FX##(V_1ab0!) - V_1aa8!)   '@15040
    GOTO L_150bd   '@15078
L_15080:
    V_1ab4! = V_1a9c! - (FX##(V_1aa0!) - V_1ab8!) * (FX##(V_1a9c!) - V_1a94!) / (FX##(V_1aa0!) - V_1a98!)   '@15080
L_150bd:
L_150c2:
    ' END SUB   '@150c2
END SUB

SUB S_150d7   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x150d7)
    ' ---- FUN_1000_50d7 @0x150d7  (0150d7_FUN_1000_50d7.lift.txt; evidence_id (assembly): ev_819d95cee371b44a6598ad1ab7cb6d93b9fded0b4cf14f62127bc9c959dedefe)
    BEEP   '@150df
    BEEP   '@150e9
    BEEP   '@150f3
    RT_SCREEN 0   '@150fd
    RT_VIEWPRINT 1, 25   '@15112
    RT_CLOSE   '@15124 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@15131 DS:2588
    RT_CLS 0   '@15176
    LOCATE 10, 1   '@15183
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1519e DS:1b40,258c
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@151be DS:1b40,25a6
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@151de DS:1b40,25d2
L_15203:
    CALL MIXT_07f1_LimpaTeclado   '@15208
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@15212
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1522e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15203   '@15238
    ' ---- F_1523f @0x1523f  (01523f_F_1523f.lift.txt; evidence_id (assembly): ev_a6ec4e58af9d12ecbb61e28f647c530d9d10543be9e402a97fe1a4533686778f)
    ' END SUB   '@1523f
END SUB

SUB S_15254   ' entrada de SUB/FUNCTION (B$ENRA, locais 16 bytes) (0x15254)
    DIM L_BP0c%
    DIM L_BP10!
    DIM L_BP14!
    DIM L_BP18!
    DIM L_BP1a%
    ' ---- FUN_1000_5254 @0x15254  (015254_FUN_1000_5254.lift.txt; evidence_id (assembly): ev_c7f370c0441c664d863e1a30e12d4e17fbdeedac36b376dfbeaad0d0e0c65bea)
    RT_VIEWPRINT 1, 25   '@1525c
    LOCATE 9, 8   '@1526e
    COLOR RT_CINT%((V_1b06! = 1.0) * 3 + FX##(V_1afa!))   '@1528c DS:1b9a
    PRINT CHR$(201); RT_STRINGC$((58), (205)); CHR$(187)   '@152ca
    FOR V_11b8! = 10.0 TO 17.0   '@15300 DS:1b9a,1d48,25f8
    LOCATE RT_CINT%(FX##(V_11b8!)), 8   '@1530e
    PRINT CHR$(186); RT_TAB$(67); ""; CHR$(186);   '@15333 DS:1b40
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@15368 DS:1b9a,25f8
    LOCATE 18, 8   '@15394
    PRINT CHR$(200); RT_STRINGC$((58), (205)); CHR$(188);   '@153b2
    COLOR RT_CINT%(FX##(V_1afa!))   '@153e8
    LOCATE 11, 10   '@15405
    PRINT "ARQUIVO PARAMETRIZACAO A SER UTILIZADO (.FOP)"   '@15423 DS:25fc
    LOCATE 13, 10   '@15431
    PRINT "PLOTER UTILIZADO E CONFIGURACAO DO DESENHO"   '@1544f DS:262e
    LOCATE 12, 12   '@15467
    PRINT V_0e22$; RT_TAB$(55); ""; ""   '@15485 DS:1b40
    LOCATE 12, 12   '@154ae
    CALL MIXT_07f1_LimpaTeclado   '@154cc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0e0c$   '@154d6 DS:1b40
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 14, 12   '@154f0
    PRINT "Plotagem gerada em Arquivo no Disco (.PLT) ";   '@1550e DS:265c
    IF NOT (V_1524$ = "S") THEN GOTO L_15549   '@1551c DS:1c48
    PRINT "N/*S* "   '@15533 DS:268c
    GOTO L_15557   '@15541
L_15549:
    PRINT "S/*N* "   '@15549 DS:2696
L_15557:
    LOCATE 15, 12   '@15557
    PRINT "PLOTER utilizado"   '@15575 DS:26a0
    LOCATE 16, 12   '@15583
    PRINT "Origem da Folha (mm) *"; LTRIM$(STR$(V_1528!)); ","; LTRIM$(STR$(V_152c!)); "*"   '@155a1 DS:26b4,26ce,26d4
L_155f8:
    LOCATE 14, 61   '@155fd
    CALL MIXT_07f1_LimpaTeclado   '@1561b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0e0c$   '@15625 DS:1b40
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) > 0) THEN GOTO L_156c9   '@1563f
    L_BP0c% = (UCASE$(V_0e0c$) <> "N")   '@15654 DS:1e3e
    IF NOT ((UCASE$(V_0e0c$) <> "S" AND L_BP0c%) <> 0) THEN GOTO L_156ac   '@1567b DS:1c48
    BEEP   '@1569a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_155f8   '@156a4
L_156ac:
    V_1524$ = UCASE$(V_0e0c$)   '@156ac
L_156c9:
L_156ce:
    OPEN RT_ARQ$(V_0e3a$ + "PLOTER.INI") FOR INPUT AS #1   '@156d3 DS:26da,26e0
L_156fc:
    IF NOT (EOF(1) <> -1) THEN GOTO L_15eca   '@156fc
    INPUT #1, V_0e0c$   '@1570d
    IF NOT (RT_MID$((V_0e0c$), (1), (1)) = "$") THEN GOTO L_15ec1   '@1572d DS:26ee
    LOCATE 15, 29   '@1574f
    PRINT RT_TAB$(65); ""; "";   '@1576d DS:1b40
    LOCATE 15, 29   '@1578d
    PRINT RT_MID2$((V_0e0c$), (2));   '@157ab
    V_1a70$ = RT_MID2$((V_0e0c$), (2))   '@157c7
    CALL MIXT_07f1_LimpaTeclado   '@157e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "  S/*N* ", V_0e0c$   '@157f1 DS:26f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "S") THEN GOTO L_15ebc   '@1580b DS:1c48
    LINE INPUT #1, V_0e0c$   '@15828 DS:1b40
    V_1a74$ = LTRIM$(V_0e0c$)   '@1584b
    LINE INPUT #1, V_0e0c$   '@15863 DS:1b40
    V_1a78$ = LTRIM$(V_0e0c$)   '@15886
    LINE INPUT #1, V_0e0c$   '@1589e DS:1b40
    V_1a7c! = VAL(V_0e0c$)   '@158c1
    LINE INPUT #1, V_0e0c$   '@158db DS:1b40
    V_1a80$ = LTRIM$(V_0e0c$)   '@158fe
    LINE INPUT #1, V_0e0c$   '@15916 DS:1b40
    V_1a84$ = LTRIM$(V_0e0c$)   '@15939
    LINE INPUT #1, V_0e0c$   '@15951 DS:1b40
    V_0e0c$ = LTRIM$(V_0e0c$)   '@15974
    V_1a88$ = RT_MID$((V_0e0c$), (1), (INSTR(V_0e0c$, "(") - 1))   '@1598c DS:2700
    V_1a8c! = VAL(RT_MID2$((V_0e0c$), (INSTR(V_0e0c$, "(") + 1)))   '@159b7 DS:2700
    LINE INPUT #1, V_0e0c$   '@159e7 DS:1b40
    V_1a90$ = LTRIM$(V_0e0c$)   '@15a0a
    LINE INPUT #1, V_0e0c$   '@15a22 DS:1b40
    V_1a54$ = LTRIM$(V_0e0c$)   '@15a45
    LINE INPUT #1, V_0e0c$   '@15a5d DS:1b40
    V_1a58$ = LTRIM$(V_0e0c$)   '@15a80
    LINE INPUT #1, V_0e0c$   '@15a98 DS:1b40
    V_1a5c$ = LTRIM$(V_0e0c$)   '@15abb
    LINE INPUT #1, V_0e0c$   '@15ad3 DS:1b40
    V_1a60$ = LTRIM$(V_0e0c$)   '@15af6
    LINE INPUT #1, V_0e0c$   '@15b0e DS:1b40
    V_1a64$ = LTRIM$(V_0e0c$)   '@15b31
    LINE INPUT #1, V_0e0c$   '@15b49 DS:1b40
    V_1a68$ = LTRIM$(V_0e0c$)   '@15b6c
    LINE INPUT #1, V_0e0c$   '@15b84 DS:1b40
    V_1a6c$ = LTRIM$(V_0e0c$)   '@15ba7
    LINE INPUT #1, V_0e0c$   '@15bbf DS:1b40
    V_19ec$ = LTRIM$(V_0e0c$)   '@15be2
    LINE INPUT #1, V_0e0c$   '@15bfa DS:1b40
    V_19f0! = VAL(V_0e0c$)   '@15c1d
    LINE INPUT #1, V_0e0c$   '@15c37 DS:1b40
    V_19f4$ = LTRIM$(V_0e0c$)   '@15c5a
    LINE INPUT #1, V_0e0c$   '@15c72 DS:1b40
    REDIM A_19f8%(-32768 TO -32768)   '@15c95
    REDIM A_1a26%(-32768 TO -32768)   '@15ca3
    REDIM A_19f8%(0 TO 7)   '@15cac
    REDIM A_1a26%(0 TO 12)   '@15cc9
    L_BP10! = 6.0   '@15ce6 DS:2706
    CALL MIXT_0877_Menor(L_BP10!, V_1a7c!, L_BP14!)   '@15cf6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP18! = L_BP14!   '@15d08
    FOR V_11bc! = 1.0 TO L_BP18!   '@15d12 DS:1b9a
    LINE INPUT #1, V_0e0c$   '@15d1a DS:1b40
    A_19f8%(RT_CINT%(FX##(V_11bc!))) = RT_CINT%(FX##(VAL(RT_MID2$((V_0e0c$), (13)))))   '@15d3d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@15d81 DS:1b9a
L_15db1:
    LINE INPUT #1, V_0e0c$   '@15db6 DS:1b40
    IF NOT (INSTR(V_0e0c$, "# DESENHO DE FORMAS") = 0) THEN GOTO L_15df9   '@15dd9 DS:270a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15db1   '@15df2
L_15df9:
    LINE INPUT #1, V_0e0c$   '@15df9 DS:1b40
    FOR V_11bc! = 0.0 TO 10.0   '@15e1c DS:1b9a,1cc8,1d48
    LINE INPUT #1, V_0e0c$   '@15e2a DS:1b40
    A_1a26%(RT_CINT%(FX##(V_11bc!))) = RT_CINT%(FX##(VAL(V_0e0c$)))   '@15e4d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@15e83 DS:1b9a,1d48
    GOTO L_15eca   '@15eaf
L_15ebc:
L_15ec1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_156fc   '@15ec1
L_15eca:
    IF NOT (EOF(1) = -1) THEN GOTO L_15ef5   '@15eca
    RT_CLOSE   '@15ee0 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_156ce   '@15eed
L_15ef5:
    RT_CLOSE   '@15ef5 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    V_0e0c$ = V_1a78$   '@15f02
    GOSUB L_161ee   '@15f14
    V_1a78$ = V_0e0c$   '@15f21
    V_0e0c$ = V_1a80$   '@15f33
    GOSUB L_161ee   '@15f45
    V_1a80$ = V_0e0c$   '@15f52
    V_0e0c$ = V_1a84$   '@15f64
    GOSUB L_161ee   '@15f76
    V_1a84$ = V_0e0c$   '@15f83
    V_0e0c$ = V_1a88$   '@15f95
    GOSUB L_161ee   '@15fa7
    V_1a88$ = V_0e0c$   '@15fb4
    V_0e0c$ = V_1a54$   '@15fc6
    GOSUB L_161ee   '@15fd8
    V_1a54$ = V_0e0c$   '@15fe5
    V_0e0c$ = V_1a90$   '@15ff7
    GOSUB L_161ee   '@16009
    V_1a90$ = V_0e0c$   '@16016
    V_0e0c$ = V_1a58$   '@16028
    GOSUB L_161ee   '@1603a
    V_1a58$ = V_0e0c$   '@16047
    V_0e0c$ = V_1a5c$   '@16059
    GOSUB L_161ee   '@1606b
    V_1a5c$ = V_0e0c$   '@16078
    V_0e0c$ = V_1a64$   '@1608a
    GOSUB L_161ee   '@1609c
    V_1a64$ = V_0e0c$   '@160a9
    V_0e0c$ = V_1a68$   '@160bb
    GOSUB L_161ee   '@160cd
    V_1a68$ = V_0e0c$   '@160da
    V_0e0c$ = V_19ec$   '@160ec
    GOSUB L_161ee   '@160fe
    V_19ec$ = V_0e0c$   '@1610b
    L_BP1a% = LEN(STR$(V_1528!))   '@1611d
    LOCATE 16, LEN(STR$(V_152c!)) + L_BP1a% + 35   '@1614c
    CALL MIXT_07f1_LimpaTeclado   '@16167
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0049_Le2Campos(V_0e0c$, V_0e10$)   '@16171
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) > 0) THEN GOTO L_161b2   '@16183
    V_1528! = VAL(V_0e0c$)   '@16198
L_161b2:
    IF NOT (LEN(V_0e10$) > 0) THEN GOTO L_161e1   '@161b2
    V_152c! = VAL(V_0e10$)   '@161c7
L_161e1:
    GOTO L_162b9   '@161e1
    ' ---- F_161e9 @0x161e9  (0161e9_F_161e9.lift.txt; evidence_id (assembly): ev_5cf9ac31d039f584b23af1c1ea08a932999ea2a43a1f33c35baaa9d32607d59c)
L_161ee:   ' sub-rotina (alvo de GOSUB); entrada vinda de 015254_FUN_1000_5254
    IF NOT (INSTR(V_0e0c$, "CHR$(") > 0) THEN GOTO L_162aa   '@161f3 DS:2722
    V_0e0c$ = RT_MID$((V_0e0c$), (1), (INSTR(V_0e0c$, "CHR$(") - 1)) + CHR$(RT_CINT%(FX##(VAL(RT_MID2$((V_0e0c$), (INSTR(V_0e0c$, "CHR$(") + 5)))))) + RT_MID2$((V_0e0c$), (RT_INSTR%((INSTR(V_0e0c$, "CHR$(")), (V_0e0c$), (")")) + 1))   '@1620c DS:2722,272c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_161ee   '@1629d
L_162aa:
    RETURN   '@162aa
L_162b9:   ' entrada vinda de 015254_FUN_1000_5254
    ' END SUB   '@162b9
END SUB

SUB S_20187   ' entrada de SUB/FUNCTION (B$ENRA, locais 50 bytes) (0x20187)
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
    ' ---- FUN_2000_0187 @0x20187  (020187_FUN_2000_0187.lift.txt; evidence_id (assembly): ev_8251c145dc336830895a9ccc36d86ed7b3754c7f82c77c5c72308dea4cfc2708)
L_2019e:
    L_BP14% = 0   '@201a3
    L_BP28! = A_15da!(0, 0)   '@201ad
    FOR V_11b8! = 1.0 TO L_BP28!   '@201cd DS:2740
    IF NOT (NOT (A_1acc!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0 AND ((A_15da!(RT_CINT%(FX##(V_11b8!)), 3) <> -2.0 OR A_1acc!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0) AND (A_15da!(RT_CINT%(FX##(V_11b8!)), 0) <> -2.0 OR A_1acc!(RT_CINT%(FX##(V_11b8!)), 3) = 1.0)))) THEN GOTO L_202f5   '@201d4 DS:2740,2744,2748
    GOTO L_20eef   '@202ed
L_202f5:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@202f5
    IF NOT (V_11bc! <= 0.0) THEN GOTO L_20343   '@20320 DS:2748
    GOTO L_20eef   '@2033b
L_20343:
    V_11ec! = -V_11b8!   '@20343
    CALL S_22bb6   '@20357
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@20361
    L_BP12! = V_11d8!   '@20371
    A_1acc!(RT_CINT%(FX##(V_11b8!)), 0) = 1.0   '@20381 DS:2740
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_204d4   '@203ab
    L_BP18! = L_BP0e! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@203da DS:274c
    L_BP1c! = L_BP12! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@20418 DS:274c
    L_BP20! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP0e!   '@20456 DS:274c
    L_BP24! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP12!   '@20491 DS:274c
    GOTO L_20754   '@204cc
L_204d4:
    L_BP18! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@204d4
    L_BP1c! = FX##(A_16ee!(1, 1)) + L_BP12!   '@204fa
    L_BP20! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@2051e
    L_BP24! = FX##(A_16ee!(1, 1)) + L_BP12!   '@20544
    L_BP2c! = A_16ee!(0, 0)   '@20568
    FOR V_11c0! = 2.0 TO L_BP2c!   '@20588 DS:2740,274c
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! < FX##(L_BP18!)) THEN GOTO L_205f4   '@20590
    L_BP18! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@205c7
L_205f4:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! > FX##(L_BP20!)) THEN GOTO L_20658   '@205f4
    L_BP20! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@2062b
L_20658:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! < FX##(L_BP1c!)) THEN GOTO L_206be   '@20658
    L_BP1c! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@20690
L_206be:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! > FX##(L_BP24!)) THEN GOTO L_20724   '@206be
    L_BP24! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@206f6
L_20724:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20724 DS:2740
L_20754:
    IF NOT (L_BP18! < V_1b2a!) THEN GOTO L_2077e   '@20754
    V_1b2a! = L_BP18!   '@2076e
L_2077e:
    IF NOT (L_BP20! > V_1b32!) THEN GOTO L_207a8   '@2077e
    V_1b32! = L_BP20!   '@20798
L_207a8:
    IF NOT (L_BP1c! < V_1b2e!) THEN GOTO L_207d2   '@207a8
    V_1b2e! = L_BP1c!   '@207c2
L_207d2:
    IF NOT (L_BP24! > V_1b36!) THEN GOTO L_207fc   '@207d2
    V_1b36! = L_BP24!   '@207ec
L_207fc:
    L_BP30! = A_15da!(0, 0)   '@207fc
    FOR V_11c0! = 1.0 TO L_BP30!   '@2081c DS:2740
    IF NOT (V_11c0! <> V_11b8!) THEN GOTO L_20bee   '@20824
    L_BP34! = A_15da!(RT_CINT%(FX##(V_11c0!)), 0)   '@2083f
    IF NOT (L_BP34! = -2.0) THEN GOTO L_209f9   '@20868 DS:2744
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_209f1   '@20882 DS:2750
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20955   '@208f4
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 1) = L_BP0e!   '@20923
    GOTO L_209c1   '@2094d
L_20955:
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0), 0)) + L_BP0e!   '@20955 DS:2750
L_209c1:
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 3) = 1.0   '@209c1 DS:2740
L_209f1:
    GOTO L_20a16   '@209f1
L_209f9:
    IF NOT (L_BP34! = -3.0) THEN GOTO L_20a16   '@209fa DS:2754
    GOTO L_20a16   '@20a0e
L_20a16:
    L_BP38! = A_15da!(RT_CINT%(FX##(V_11c0!)), 3)   '@20a16
    IF NOT (L_BP38! = -2.0) THEN GOTO L_20bcc   '@20a40 DS:2744
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_20bc4   '@20a5a DS:2750
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20b2a   '@20acc
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 2) = L_BP12!   '@20afb
    GOTO L_20b94   '@20b22
L_20b2a:
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0), 1)) + L_BP12!   '@20b2a DS:2750
L_20b94:
    A_1acc!(RT_CINT%(FX##(V_11c0!)), 4) = 1.0   '@20b94 DS:2740
L_20bc4:
    GOTO L_20be9   '@20bc4
L_20bcc:
    IF NOT (L_BP38! = -3.0) THEN GOTO L_20be9   '@20bcd DS:2754
    GOTO L_20be9   '@20be1
L_20be9:
L_20bee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20bee DS:2740
    L_BP3c! = A_1664!(0, 0)   '@20c19
    FOR V_11c0! = 1.0 TO L_BP3c!   '@20c39 DS:2740
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = -2.0) THEN GOTO L_20d78   '@20c40 DS:2744
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = V_11b8!) THEN GOTO L_20d73   '@20c74
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20d0a   '@20ca9
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = L_BP0e!   '@20cd8
    GOTO L_20d6e   '@20d02
L_20d0a:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 2))), 0)) + L_BP0e!   '@20d0a
L_20d6e:
L_20d73:
L_20d78:
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = -2.0) THEN GOTO L_20eb5   '@20d78 DS:2744
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = V_11b8!) THEN GOTO L_20eb0   '@20dad
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20e43   '@20de2
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = L_BP12!   '@20e11
    GOTO L_20eab   '@20e3b
L_20e43:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 5))), 1)) + L_BP12!   '@20e43
L_20eab:
L_20eb0:
L_20eb5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20eb5 DS:2740
    L_BP14% = 1   '@20ee0
L_20eef:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@20ef4 DS:2740
    IF NOT (L_BP14% = 1) THEN GOTO L_20f35   '@20f1f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2019e   '@20f2d
L_20f35:
    ' END SUB   '@20f35
END SUB

SUB S_20f4a   ' entrada de SUB/FUNCTION (B$ENRA, locais 24 bytes) (0x20f4a)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    ' ---- F_20f4a @0x20f4a  (020f4a_F_20f4a.lift.txt; evidence_id (assembly): ev_3cae73d7869e7c76952ddce89b4cfededf82086cfc4c796864fdce6d239f6e0b)
    L_BP1e! = A_0e78!(0, 0)   '@20f57
    FOR V_11ec! = 1.0 TO L_BP1e!   '@20f77 DS:2740
    L_BP0e! = V_1abc!   '@20f7e
    L_BP12! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 0)) * 100.0   '@20f8e DS:2758
    L_BP16! = V_1ac4!   '@20fbc
    L_BP1a! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 0)) * 100.0   '@20fcc DS:2758
    IF NOT (NOT (L_BP1a! <= V_1b1e! AND L_BP12! <= V_1b1e! OR (L_BP1a! >= V_1b26! AND L_BP12! >= V_1b26! OR (L_BP16! <= V_1b1a! AND L_BP0e! <= V_1b1a! OR L_BP16! >= V_1b22! AND L_BP0e! >= V_1b22!)))) THEN GOTO L_21183   '@20ffa
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP12!) - V_1b1e!) * V_1b16!), 0, 0   '@210d4
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), 72, RT_CINT%(FX##(V_1afa!)), 2   '@21120
L_21183:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21183 DS:2740
    L_BP22! = A_0e78!(0, 1)   '@211ae
    FOR V_11ec! = 1.0 TO L_BP22!   '@211d1 DS:2740
    L_BP0e! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 1)) * 100.0   '@211d8 DS:2758
    L_BP12! = V_1ac0!   '@21207
    L_BP16! = FX##(A_0e78!(RT_CINT%(FX##(V_11ec!)), 1)) * 100.0   '@21217 DS:2758
    L_BP1a! = V_1ac8!   '@21246
    IF NOT (NOT (L_BP1a! <= V_1b1e! AND L_BP12! <= V_1b1e! OR (L_BP1a! >= V_1b26! AND L_BP12! >= V_1b26! OR (L_BP16! <= V_1b1a! AND L_BP0e! <= V_1b1a! OR L_BP16! >= V_1b22! AND L_BP0e! >= V_1b22!)))) THEN GOTO L_213df   '@21256
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP12!) - V_1b1e!) * V_1b16!), 0, 0   '@21330
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), 72, RT_CINT%(FX##(V_1afa!)), 2   '@2137c
L_213df:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@213df DS:2740
    ' END SUB   '@2140a
END SUB

SUB S_2141f   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x2141f)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_141f @0x2141f  (02141f_FUN_2000_141f.lift.txt; evidence_id (assembly): ev_d54737fa1533a7662d0387746ad597bbc9afb616f31af764fc070e59287075dc)
    L_BP1e! = A_1692!(0, 0)   '@2142c
    FOR V_11ec! = 1.0 TO L_BP1e!   '@2144c DS:2740
    L_BP0e! = A_1692!(RT_CINT%(FX##(V_11ec!)), 0)   '@21454
    L_BP12! = A_1692!(RT_CINT%(FX##(V_11ec!)), 1)   '@2147d
    L_BP16! = A_1692!(RT_CINT%(FX##(V_11ec!)), 2)   '@214a7
    L_BP1a! = A_1692!(RT_CINT%(FX##(V_11ec!)), 3)   '@214ce
    IF NOT (NOT (L_BP1a! <= V_1b1e! AND L_BP12! <= V_1b1e! OR (L_BP1a! >= V_1b26! AND L_BP12! >= V_1b26! OR (L_BP16! <= V_1b1a! AND L_BP0e! <= V_1b1a! OR L_BP16! >= V_1b22! AND L_BP0e! >= V_1b22!)))) THEN GOTO L_21681   '@214f8
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP12!) - V_1b1e!) * V_1b16!), 0, 0   '@215d2
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), 8, RT_CINT%(FX##(V_1b02!)), 0   '@2161e
L_21681:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21681 DS:2740
    ' END SUB   '@216ac
END SUB

SUB S_216c1   ' entrada de SUB/FUNCTION (B$ENRA, locais 84 bytes) (0x216c1)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    ' ---- FUN_2000_16c1 @0x216c1  (0216c1_FUN_2000_16c1.lift.txt; evidence_id (assembly): ev_7d470d349b12c1989cf76f3de40cfa134c5d15eb3f94a6c68fb4d71240d3d6da)
    IF NOT (A_15da!(0, 0) = 0.0) THEN GOTO L_21705   '@216d3 DS:2748
    GOTO L_21ddd   '@216fd
L_21705:
    L_BP56! = A_15da!(0, 0)   '@21705
    FOR V_11b8! = 1.0 TO L_BP56!   '@21725 DS:2740
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@2172c
    IF NOT (V_11bc! > 0.0) THEN GOTO L_217c2   '@21757 DS:2748
    V_11ec! = -V_11b8!   '@21772
    CALL S_22bb6   '@21786
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@21790
    L_BP12! = V_11d8!   '@217a0
    GOSUB L_217fa   '@217b0
L_217c2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@217c2 DS:2740
    GOTO L_21ddd   '@217ed
    ' ---- F_217f5 @0x217f5  (0217f5_F_217f5.lift.txt; evidence_id (assembly): ev_ced5d5998c9ad844dc440adb1854b8de122ee65d81d59d3435202d688326d614)
L_217fa:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0216c1_FUN_2000_16c1
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_21a51   '@217ff
    L_BP16! = L_BP0e!   '@2182e
    L_BP1a! = L_BP12!   '@2183d
    L_BP5a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@2184c DS:274c
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), RT_SNG!(FX##(L_BP5a!) * V_1b12!), 8, RT_CINT%(FX##(V_1afa!)), 0, 0, 0   '@21883
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_21a49   '@218ed
    L_BP5a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@2191c DS:274c
    IF NOT (NOT (FX##(L_BP1a!) - L_BP5a! >= FX##(V_1b26!) AND FX##(L_BP1a!) + L_BP5a! <= FX##(V_1b1e!) OR (FX##(L_BP16!) + L_BP5a! <= FX##(V_1b1a!) OR FX##(L_BP16!) - L_BP5a! >= FX##(V_1b22!)))) THEN GOTO L_21a44   '@21953
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), RT_SNG!(FX##(L_BP5a!) * V_1b12!), 8, RT_CINT%(FX##(V_1afa!)), 0, 0, 0   '@219d5
L_21a44:
L_21a49:
    GOTO L_21cf1   '@21a49
L_21a51:
    L_BP5e! = A_16ee!(0, 0)   '@21a51
    FOR V_11ec! = 1.0 TO L_BP5e!   '@21a71 DS:2740
    L_BP16! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP0e!   '@21a78
    L_BP1a! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP12!   '@21aa5
    L_BP1e! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP0e!   '@21ad3 DS:2740
    L_BP22! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP12!   '@21b05 DS:2740
    IF NOT (NOT (L_BP22! <= V_1b1e! AND L_BP1a! <= V_1b1e! OR (L_BP22! >= V_1b26! AND L_BP1a! >= V_1b26! OR (L_BP1e! <= V_1b1a! AND L_BP16! <= V_1b1a! OR L_BP1e! >= V_1b22! AND L_BP16! >= V_1b22!)))) THEN GOTO L_21cc1   '@21b38
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), 0, 0   '@21c12
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP22!) - V_1b1e!) * V_1b16!), 8, RT_CINT%(FX##(V_1afa!)), 0   '@21c5e
L_21cc1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21cc1 DS:2740
L_21cf1:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 0) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_21d41   '@21cf1
L_21d41:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 1) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_21dce   '@21d41
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_21dc4   '@21d8d
    GOTO L_21dc9   '@21dbc
L_21dc4:
L_21dc9:
L_21dce:
    RETURN   '@21dce
L_21ddd:   ' entrada vinda de 0216c1_FUN_2000_16c1
    ' END SUB   '@21ddd
END SUB

SUB S_21ded   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x21ded)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_1ded @0x21ded  (021ded_FUN_2000_1ded.lift.txt; evidence_id (assembly): ev_6d272e34a738fc573f696dc7f15adc29d764a95e791a9bbdf05e8e408748bc87)
    L_BP1e! = A_1664!(0, 0)   '@21dfa
    FOR V_11ec! = 1.0 TO L_BP1e!   '@21e1a DS:2740
    L_BP0e! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@21e22
    L_BP12! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@21e4b
    L_BP16! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@21e75
    L_BP1a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@21e9c
    IF NOT (NOT (L_BP1a! <= V_1b1e! AND L_BP12! <= V_1b1e! OR (L_BP1a! >= V_1b26! AND L_BP12! >= V_1b26! OR (L_BP16! <= V_1b1a! AND L_BP0e! <= V_1b1a! OR L_BP16! >= V_1b22! AND L_BP0e! >= V_1b22!)))) THEN GOTO L_2204f   '@21ec6
    RT_PSET RT_SNG!((FX##(L_BP0e!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP12!) - V_1b1e!) * V_1b16!), 0, 0   '@21fa0
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP16!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(V_1b0e! - (FX##(L_BP1a!) - V_1b1e!) * V_1b16!), 8, RT_CINT%(FX##(V_1afe!)), 0   '@21fec
L_2204f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2204f DS:2740
    ' END SUB   '@2207a
END SUB

SUB S_2208f   ' entrada de SUB/FUNCTION (B$ENRA, locais 30 bytes) (0x2208f)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP24%
    DIM L_BP28!
    ' ---- FUN_2000_208f @0x2208f  (02208f_FUN_2000_208f.lift.txt; evidence_id (assembly): ev_b98d1bea5fefd355fa77fbb6004e4d29ab590cf11127106cdce774f0ed43d95a)
    V_13aa% = 0   '@22097
L_220a8:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_220ff   '@220a8
    GOTO L_22110   '@220f7
L_220ff:
    V_13aa% = V_13aa% + 1   '@220ff
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_220a8   '@22108
L_22110:
    REDIM A_16c0!(-32768 TO -32768, -32768 TO -32768)   '@22110
    REDIM A_16ee!(-32768 TO -32768, -32768 TO -32768)   '@2211e
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1) THEN GOTO L_22888   '@22127
    REDIM A_16c0!(0 TO 10, 0 TO 1)   '@22156
    REDIM A_16ee!(0 TO 10, 0 TO 1)   '@2217a
    A_16c0!(0, 0) = 4.0   '@2219e DS:275c
    A_16c0!(1, 0) = 0.0   '@221be DS:2748
    A_16c0!(1, 1) = 0.0   '@221e1 DS:2748
    A_16c0!(2, 0) = 0.0   '@22202 DS:2748
    A_16c0!(2, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@22225
    A_16c0!(3, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@2226b
    A_16c0!(3, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@222b0
    A_16c0!(4, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@222f6
    A_16c0!(4, 1) = 0.0   '@2233b DS:2748
    A_16c0!(5, 0) = 0.0   '@2235f DS:2748
    A_16c0!(5, 1) = 0.0   '@22382 DS:2748
    A_16c0!(6, 0) = 0.0   '@223a6 DS:2748
    A_16c0!(6, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@223c9
    L_BP0e! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 3)   '@2240f
    REDIM A_16ee!(0 TO 6, 0 TO 1)   '@2243e
    A_16ee!(0, 0) = A_16c0!(0, 0)   '@22462
    L_BP12! = FX##(A_16ee!(0, 0)) + 1.0   '@22491 DS:2740
    FOR V_11d4! = 1.0 TO L_BP12!   '@224b6 DS:2740
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#) - A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@224be DS:2760
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#) + A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@22553 DS:2760
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@225e9 DS:2740
    L_BP16! = A_16ee!(0, 0)   '@22614
    FOR V_11d4! = 1.0 TO L_BP16!   '@22634 DS:2740
    IF NOT (V_11d4! = 1.0) THEN GOTO L_226b2   '@2263c DS:2740
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@22657
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@22680
    GOTO L_22771   '@226aa
L_226b2:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) < L_BP1a!) THEN GOTO L_2270e   '@226b2
    L_BP1a! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@226e5
L_2270e:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) < L_BP1e!) THEN GOTO L_2276c   '@2270e
    L_BP1e! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@22742
L_2276c:
L_22771:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@22771 DS:2740
    L_BP22! = FX##(A_16ee!(0, 0)) + 1.0   '@2279c DS:2740
    FOR V_11d4! = 1.0 TO L_BP22!   '@227c1 DS:2740
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)) - L_BP1a!   '@227c8
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)) - L_BP1e!   '@2280f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@22858 DS:2740
L_22888:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 3) THEN GOTO L_22ba1   '@22888
    L_BP24% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@228b6
    REDIM A_16ee!(0 TO A_1496%(CINT(V_11bc!), V_13aa%, 2) + 5, 0 TO 1)   '@228e0
    A_16ee!(0, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@22926
    L_BP28! = A_16ee!(0, 0)   '@22968
    FOR V_11d4! = 0.0 TO L_BP28!   '@22988 DS:2740,2748
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 0)) / 10.0   '@22990 DS:2768
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_14c4%(L_BP24%, RT_CINT%(FX##(V_11d4!)), 1)) / 10.0   '@229df DS:2768
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@22a30 DS:2740
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 0) = A_16ee!(1, 0)   '@22a5b DS:2740
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 1) = A_16ee!(1, 1)   '@22aab DS:2740
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 0) = A_16ee!(2, 0)   '@22afa DS:274c
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 1) = A_16ee!(2, 1)   '@22b4a DS:274c
L_22ba1:
    ' END SUB   '@22ba1
END SUB

SUB S_22bb6   ' entrada de SUB/FUNCTION (B$ENRA, locais 46 bytes) (0x22bb6)
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
    ' ---- FUN_2000_2bb6 @0x22bb6  (022bb6_FUN_2000_2bb6.lift.txt; evidence_id (assembly): ev_f10b0ec343f8b77aca068a5cb147fac6c5ef10f3ed448b68563a3be8f69d1d0f)
    REDIM L_BP1c%(0 TO 210)   '@22bbe
    V_11bc! = A_15ac%(RT_CINT%(ABS(FX##(V_11ec!))))   '@22bdb
    CALL S_2208f   '@22c09
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP20! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 0)   '@22c13
    IF NOT (L_BP20! = 0.0) THEN GOTO L_22d4a   '@22c3f DS:2748
    L_BP22% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@22c59
    IF NOT (L_BP22% <> 1) THEN GOTO L_22c9a   '@22c83
    IF NOT (L_BP22% = 3) THEN GOTO L_22d07   '@22c91
L_22c9a:
    L_BP26! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1))), 0)   '@22c9a
    GOTO L_22d42   '@22cff
L_22d07:
    IF NOT (L_BP22% = 2) THEN GOTO L_22d42   '@22d07
    L_BP26! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@22d10
    GOTO L_22d42   '@22d3a
L_22d42:
    GOTO L_230ac   '@22d42
L_22d4a:
    IF NOT (L_BP20! = -1.0) THEN GOTO L_22f14   '@22d4b DS:276c
    L_BP28% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@22d5f
    IF NOT (L_BP28% <> 1) THEN GOTO L_22da0   '@22d89
    IF NOT (L_BP28% = 3) THEN GOTO L_22e89   '@22d97
L_22da0:
    L_BP26! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0))   '@22da0 DS:2758
    GOTO L_22f0c   '@22e81
L_22e89:
    IF NOT (L_BP28% = 2) THEN GOTO L_22f0c   '@22e89
    L_BP26! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@22e92 DS:2758
    GOTO L_22f0c   '@22f04
L_22f0c:
    GOTO L_230ac   '@22f0c
L_22f14:
    IF NOT (L_BP20! = -2.0) THEN GOTO L_2308f   '@22f15 DS:2744
    L_BP2a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@22f29
    IF NOT (L_BP2a% <> 1) THEN GOTO L_22f6a   '@22f53
    IF NOT (L_BP2a% = 3) THEN GOTO L_2302a   '@22f61
L_22f6a:
    L_BP26! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0) + A_1acc!(RT_CINT%(ABS(FX##(V_11ec!))), 1)   '@22f6a DS:2758
    GOTO L_23087   '@23022
L_2302a:
    IF NOT (L_BP2a% = 2) THEN GOTO L_23087   '@2302a
    L_BP26! = FX##(A_1acc!(RT_CINT%(ABS(FX##(V_11ec!))), 1)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@23033
    GOTO L_23087   '@2307f
L_23087:
    GOTO L_230ac   '@23087
L_2308f:
    IF NOT (L_BP20! = -3.0) THEN GOTO L_230ac   '@23090 DS:2754
    GOTO L_230ac   '@230a4
L_230ac:
    L_BP2e! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 3)   '@230ac
    IF NOT (L_BP2e! = 0.0) THEN GOTO L_231eb   '@230d9 DS:2748
    L_BP30% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@230f3
    IF NOT (L_BP30% <> 1) THEN GOTO L_23134   '@2311d
    IF NOT (L_BP30% = 3) THEN GOTO L_231a5   '@2312b
L_23134:
    L_BP34! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4))), 1)   '@23134
    GOTO L_231e3   '@2319d
L_231a5:
    IF NOT (L_BP30% = 2) THEN GOTO L_231e3   '@231a5
    L_BP34! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@231ae
    GOTO L_231e3   '@231db
L_231e3:
    GOTO L_23553   '@231e3
L_231eb:
    IF NOT (L_BP2e! = -1.0) THEN GOTO L_233ba   '@231ec DS:276c
    L_BP36% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23200
    IF NOT (L_BP36% <> 1) THEN GOTO L_23241   '@2322a
    IF NOT (L_BP36% = 3) THEN GOTO L_2332d   '@23238
L_23241:
    L_BP34! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1))   '@23241 DS:2758
    GOTO L_233b2   '@23325
L_2332d:
    IF NOT (L_BP36% = 2) THEN GOTO L_233b2   '@2332d
    L_BP34! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@23336 DS:2758
    GOTO L_233b2   '@233aa
L_233b2:
    GOTO L_23553   '@233b2
L_233ba:
    IF NOT (L_BP2e! = -2.0) THEN GOTO L_23536   '@233bb DS:2744
    L_BP38% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@233cf
    IF NOT (L_BP38% <> 1) THEN GOTO L_23410   '@233f9
    IF NOT (L_BP38% = 3) THEN GOTO L_234d1   '@23407
L_23410:
    L_BP34! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1) + A_1acc!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@23410 DS:2758
    GOTO L_2352e   '@234c9
L_234d1:
    IF NOT (L_BP38% = 2) THEN GOTO L_2352e   '@234d1
    L_BP34! = FX##(A_1acc!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@234da
    GOTO L_2352e   '@23526
L_2352e:
    GOTO L_23553   '@2352e
L_23536:
    IF NOT (L_BP2e! = -3.0) THEN GOTO L_23553   '@23537 DS:2754
    GOTO L_23553   '@2354b
L_23553:
    IF NOT (V_11ec! < 0.0) THEN GOTO L_2359b   '@23553 DS:2748
    V_11d4! = L_BP26!   '@2356e
    V_11d8! = L_BP34!   '@2357e
    GOTO L_235a0   '@2358e
L_2359b:
L_235a0:
    ERASE L_BP1c%   '@235a0
    ' END SUB   '@235a9
END SUB

SUB S_235b9   ' entrada de SUB/FUNCTION (B$ENRA, locais 260 bytes) (0x235b9)
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
    ' ---- FUN_2000_35b9 @0x235b9  (0235b9_FUN_2000_35b9.lift.txt; evidence_id (assembly): ev_e6628491cd5f6d3bb7f941f2c3174f29972bc0c0d5aa73a21b33ec0064a47760)
    REDIM L_BP1c%(0 TO 162)   '@235c1
    REDIM L_BP2e%(0 TO 162)   '@235de
    REDIM L_BP40%(0 TO 704)   '@235f6
    REDIM L_BP52%(0 TO 704)   '@2360e
    REDIM L_BP64%(0 TO 480)   '@23626
    V_11c8! = 0.0   '@23643 DS:2748
    L_BP68! = 100.0   '@23654 DS:2758
    L_BP6c! = INT((FX##(V_1b22!) + V_1b1a!) / 2.0)   '@23664 DS:274c
    L_BP70! = INT((FX##(V_1b26!) + V_1b1e!) / 2.0)   '@23685 DS:274c
    L_BP74! = L_BP6c!   '@236a6
    L_BP78! = L_BP70!   '@236b5
    RT_GCAIXA RT_SNG!((FX##(L_BP6c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(169.0 - (FX##(L_BP70!) - V_1b1e!) * V_1b16!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@236c4 DS:2770
    L_BP7c! = (FX##(L_BP6c!) - V_1b1a!) * V_1b12! + V_1b0a!   '@23730
    L_BP80! = 169.0 - (FX##(L_BP70!) - V_1b1e!) * V_1b16!   '@2374f DS:2770
    L_BP84$ = CHR$(27)   '@2376a
    L_BP88$ = "CGA"   '@2377e DS:2774
    CALL MIXT_08c4_TextoGrafico(L_BP7c!, L_BP80!, L_BP84$, L_BP88$)   '@2378c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @237a3 libera strings locais (L_BP84)
    ' @237ad libera strings locais (L_BP88)
L_237bc:
    RT_VIEWPRINT 23, 25   '@237c1
    RT_CLS 2   '@237d3
    RT_VIEWPRINT 1, 25   '@237e1
    LOCATE 24, 1   '@237f3
    IF NOT (V_11c8! = 0.0) THEN GOTO L_2383f   '@2380e DS:2748
    PRINT " Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso"   '@23829 DS:277c
    GOTO L_23852   '@23837
L_2383f:
    PRINT " Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso"   '@2383f DS:27ce
L_23852:
L_23857:
    V_0e0c$ = ""   '@2385c DS:2820
L_23874:
    V_0e0c$ = RT_INKEY$   '@23874
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_23874   '@23888 DS:2820
    L_BP8c$ = V_0e0c$   '@2389c
    IF NOT (L_BP8c$ <> "R") THEN GOTO L_238da   '@238af DS:2824
    IF NOT (L_BP8c$ = "r") THEN GOTO L_23b37   '@238c7 DS:282a
L_238da:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_23ab2   '@238da DS:2740
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BP90!)   '@238f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP90!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@2390d DS:2830
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BP94!)   '@23963
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@2397b DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BP98!)   '@239d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BP98!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@239e9 DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BP9c!)   '@23a3f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BP9c!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@23a57 DS:2830
L_23ab2:
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@23ab2 DS:2834
    V_0e0c$ = "FIM"   '@23b15 DS:2838
    GOTO L_24c50   '@23b27
L_23b37:
    IF NOT (L_BP8c$ <> "4") THEN GOTO L_23b72   '@23b37 DS:2840
    IF NOT (CHR$(0) + CHR$(75) = L_BP8c$) THEN GOTO L_23bac   '@23b4a
L_23b72:
    L_BPa0! = FX##(L_BP6c!) - L_BP68!   '@23b72
    CALL MIXT_082a_Maior(V_1b1a!, L_BPa0!, L_BPa4!)   '@23b86
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPa4!   '@23b9a
    GOTO L_24541   '@23ba4
L_23bac:
    IF NOT (L_BP8c$ <> "6") THEN GOTO L_23be7   '@23bac DS:2846
    IF NOT (CHR$(0) + CHR$(77) = L_BP8c$) THEN GOTO L_23c21   '@23bbf
L_23be7:
    L_BPa8! = FX##(L_BP6c!) + L_BP68!   '@23be7
    CALL MIXT_0877_Menor(V_1b22!, L_BPa8!, L_BPac!)   '@23bfb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPac!   '@23c0f
    GOTO L_24541   '@23c19
L_23c21:
    IF NOT (L_BP8c$ <> "8") THEN GOTO L_23c5c   '@23c21 DS:284c
    IF NOT (CHR$(0) + CHR$(72) = L_BP8c$) THEN GOTO L_23c96   '@23c34
L_23c5c:
    L_BPb0! = FX##(L_BP70!) + L_BP68!   '@23c5c
    CALL MIXT_0877_Menor(V_1b26!, L_BPb0!, L_BPb4!)   '@23c70
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP78! = L_BPb4!   '@23c84
    GOTO L_24541   '@23c8e
L_23c96:
    IF NOT (L_BP8c$ <> "2") THEN GOTO L_23cd1   '@23c96 DS:2852
    IF NOT (CHR$(0) + CHR$(80) = L_BP8c$) THEN GOTO L_23d0b   '@23ca9
L_23cd1:
    L_BPb8! = FX##(L_BP70!) - L_BP68!   '@23cd1
    CALL MIXT_082a_Maior(V_1b1e!, L_BPb8!, L_BPbc!)   '@23ce5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP78! = L_BPbc!   '@23cf9
    GOTO L_24541   '@23d03
L_23d0b:
    IF NOT (CHR$(13) = L_BP8c$) THEN GOTO L_243dc   '@23d0b
    IF NOT (V_11c8! = 0.0) THEN GOTO L_24010   '@23d24 DS:2748
    V_1a94! = L_BP74!   '@23d3f
    V_1a98! = L_BP78!   '@23d4f
    V_1a9c! = L_BP74!   '@23d5f
    V_1aa0! = L_BP78!   '@23d6f
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@23d7f DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@23e1b DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@23eb7 DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@23f53 DS:2830
    V_11c8! = 1.0   '@23fef DS:2740
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_237bc   '@24000
L_24010:
    IF NOT (L_BP78! = V_1a98! OR L_BP74! = V_1a94!) THEN GOTO L_2405e   '@24010
    BEEP   '@2404c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_237bc   '@24056
L_2405e:
    IF NOT (V_0e1c$ = "ZOOM") THEN GOTO L_24109   '@2405e DS:2858
    CALL MIXT_0877_Menor(V_1a94!, L_BP74!, L_BPc0!)   '@24075
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1b1a! = L_BPc0!   '@2408d
    CALL MIXT_0877_Menor(V_1a98!, L_BP78!, L_BPc4!)   '@24098
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1b1e! = L_BPc4!   '@240b0
    CALL MIXT_082a_Maior(V_1a94!, L_BP74!, L_BPc8!)   '@240bb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1b22! = L_BPc8!   '@240d3
    CALL MIXT_082a_Maior(V_1a98!, L_BP78!, L_BPcc!)   '@240de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1b26! = L_BPcc!   '@240f6
    GOTO L_243b5   '@24101
L_24109:
    CALL MIXT_0877_Menor(V_1a94!, L_BP74!, L_BPd0!)   '@24109
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1abc! = L_BPd0!   '@24121
    CALL MIXT_0877_Menor(V_1a98!, L_BP78!, L_BPd4!)   '@2412c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1ac0! = L_BPd4!   '@24144
    CALL MIXT_082a_Maior(V_1a94!, L_BP74!, L_BPd8!)   '@2414f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1ac4! = L_BPd8!   '@24167
    CALL MIXT_082a_Maior(V_1a98!, L_BP78!, L_BPdc!)   '@24172
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1ac8! = L_BPdc!   '@2418a
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BPe0!)   '@24195
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe0!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@241ad DS:2830
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BPe4!)   '@24203
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe4!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@2421b DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BPe8!)   '@24271
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BPe8!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@24289 DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BPec!)   '@242df
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BPec!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@242f7 DS:2830
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@2434d DS:2834
L_243b5:
    V_0e0c$ = ""   '@243b5 DS:2820
    GOTO L_24c50   '@243c7
L_243dc:
    IF NOT (L_BP8c$ <> "P") THEN GOTO L_24402   '@243dc DS:2860
    IF NOT (L_BP8c$ = "p") THEN GOTO L_24534   '@243ef DS:2866
L_24402:
    RT_VIEWPRINT 23, 25   '@24402
    RT_CLS 2   '@24414
    PRINT ""   '@24422 DS:2820
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP68!)); "* ";   '@24430 DS:286c,2882
    CALL MIXT_07f1_LimpaTeclado   '@2445e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@24468 DS:2820 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_24524   '@24482 DS:2888
    L_BPee% = (FX##(VAL(V_0e0c$)) < FX##(V_1b26!) - V_1b1e!)   '@244a6
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_1b22!) - V_1b1a! AND L_BPee%) <> 0) THEN GOTO L_2451f   '@244e4
    L_BP68! = VAL(V_0e0c$)   '@24506
L_2451f:
L_24524:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_237bc   '@24524
L_24534:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23857   '@24534
L_24541:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_24739   '@24541 DS:2740
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BPf2!)   '@2455c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPf2!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@24574 DS:2830
    CALL MIXT_0877_Menor(V_1a94!, V_1a9c!, L_BPf6!)   '@245ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPf6!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@245e2 DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BPfa!)   '@24638
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BPfa!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@24650 DS:2830
    CALL MIXT_082a_Maior(V_1a98!, V_1aa0!, L_BPfe!)   '@246a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(L_BPfe!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@246be DS:2830
    V_1a9c! = L_BP74!   '@24714
    V_1aa0! = L_BP78!   '@24724
L_24739:
    GOSUB L_24ae2   '@24739
    L_BP6c! = L_BP74!   '@24746
    L_BP70! = L_BP78!   '@24755
    IF NOT (V_11c8! = 1.0) THEN GOTO L_24ad5   '@24764 DS:2740
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@2477f DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@2481b DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@248b7 DS:2830
    RT_GCAIXA RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@24953 DS:2830
    RT_PSET RT_SNG!((FX##(V_1a94!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1a98!) - V_1b1e!) * V_1b16!), 0, 0   '@249ef DS:2830
    RT_LINE 0, 0, RT_SNG!((FX##(V_1a9c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(165.0 - (FX##(V_1aa0!) - V_1b1e!) * V_1b16!), 88, ((V_1b06! = 1.0) * -13 + (V_1b06! = 0.0) * -7), 4369   '@24a3d DS:2740,2748,2830
L_24ad5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23857   '@24ad5
    ' ---- F_24add @0x24add  (024add_F_24add.lift.txt; evidence_id (assembly): ev_579a48407f8a27d521481405a74d42f444b1d72a1b5639089ff2fafdff221986)
L_24ae2:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0235b9_FUN_2000_35b9
    RT_GPONTO RT_SNG!((FX##(L_BP6c!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(161.0 - (FX##(L_BP70!) - V_1b1e!) * V_1b16!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@24ae7 DS:2834
    RT_GCAIXA RT_SNG!((FX##(L_BP74!) - V_1b1a!) * V_1b12! + V_1b0a!), RT_SNG!(169.0 - (FX##(L_BP78!) - V_1b1e!) * V_1b16!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@24b4a DS:2770
    L_BP102! = (FX##(L_BP74!) - V_1b1a!) * V_1b12! + V_1b0a!   '@24bb6
    L_BP106! = 169.0 - (FX##(L_BP78!) - V_1b1e!) * V_1b16!   '@24bd6 DS:2770
    L_BP10a$ = CHR$(27)   '@24bf2
    L_BP10e$ = "CGA"   '@24c06 DS:2774
    CALL MIXT_08c4_TextoGrafico(L_BP102!, L_BP106!, L_BP10a$, L_BP10e$)   '@24c14
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @24c2d libera strings locais (L_BP10a)
    ' @24c37 libera strings locais (L_BP10e)
    RETURN   '@24c41
L_24c50:   ' entrada vinda de 0235b9_FUN_2000_35b9
    ' @24c50 libera strings locais (L_BP8c)
    ERASE L_BP64%   '@24c5a
    ERASE L_BP52%   '@24c63
    ERASE L_BP40%   '@24c6c
    ERASE L_BP2e%   '@24c75
    ERASE L_BP1c%   '@24c7e
    ' END SUB   '@24c87
END SUB

SUB S_30182   ' entrada de SUB/FUNCTION (B$ENRA, locais 496 bytes) (0x30182)
    DIM L_BP0e$
    DIM L_BP10%
    DIM L_BP12%
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1c%
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
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP6e%
    DIM L_BP70%
    DIM L_BP74!
    DIM L_BP76%
    DIM L_BP7a!
    DIM L_BP7e!
    DIM L_BP82!
    DIM L_BP84%
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
    DIM L_BPb2%
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
    ' ---- FUN_3000_0182 @0x30182  (030182_FUN_3000_0182.lift.txt; evidence_id (assembly): ev_0f3ad2d2db8a684a1910ff703d4869e165085d8478d9b3f86eabda7565446e27)
    IF NOT (V_1524$ = "S") THEN GOTO L_301d7   '@3018a DS:2890
    IF RT_DISP%(V_0e52$ + V_0e32$ + ".PLT") THEN OPEN RT_ARQ$(V_0e52$ + V_0e32$ + ".PLT") FOR APPEND AS #3 ELSE OPEN RT_ARQ$(V_0e52$ + V_0e32$ + ".PLT") FOR OUTPUT AS #3   '@301a1 DS:2896,289c
    GOTO L_30256   '@301cf
L_301d7:
    IF NOT (RT_MID$((V_1a74$), (1), (3)) = "LPT") THEN GOTO L_3021e   '@301d7 DS:28a4
    IF RT_DISP%(V_1a74$) THEN OPEN RT_ARQ$(V_1a74$) FOR APPEND AS #3 ELSE OPEN RT_ARQ$(V_1a74$) FOR OUTPUT AS #3   '@301fc
    GOTO L_30251   '@30216
L_3021e:
    OPEN RT_ARQ$("COM" + V_1a74$ + ",CS65535,DS65535,OP65535") FOR RANDOM AS #3   '@3021e DS:28ac,28b4
L_30251:
L_30256:
    PRINT #3, V_1a78$; " "   '@30256 DS:28d0
    PRINT #3, V_1a54$; " "   '@30276 DS:28d0
    PRINT #3, V_1a88$; " "   '@30296 DS:28d0
    L_BP0e$ = V_1a90$   '@302b6
    IF NOT (INSTR(L_BP0e$, "Xmax") > 0) THEN GOTO L_30361   '@302c8 DS:28d6
    L_BP0e$ = RT_MID$((L_BP0e$), (1), (INSTR(L_BP0e$, "Xmax") - 1)) + LTRIM$(STR$(RT_SNG!(INT(FX##(V_1530%) / V_1a8c!)))) + RT_MID2$((L_BP0e$), (INSTR(L_BP0e$, "Xmax") + 4))   '@302e1 DS:28d6
L_30361:
    IF NOT (INSTR(L_BP0e$, "Ymax") > 0) THEN GOTO L_30413   '@30361 DS:28de
    L_BP0e$ = RT_MID$((L_BP0e$), (1), (INSTR(L_BP0e$, "Ymax") - 1)) + LTRIM$(STR$(RT_SNG!(INT((V_1532% - V_1536% - FX##(L_BP10%) / 2.0 - V_152c!) / V_1a8c!)))) + RT_MID2$((L_BP0e$), (INSTR(L_BP0e$, "Ymax") + 4))   '@3037a DS:28de,28e6
L_30413:
    IF NOT (INSTR(L_BP0e$, "Xmax") > 0) THEN GOTO L_304ac   '@30413 DS:28d6
    L_BP0e$ = RT_MID$((L_BP0e$), (1), (INSTR(L_BP0e$, "Xmax") - 1)) + LTRIM$(STR$(RT_SNG!(INT(FX##(V_1530%) / V_1a8c!)))) + RT_MID2$((L_BP0e$), (INSTR(L_BP0e$, "Xmax") + 4))   '@3042c DS:28d6
L_304ac:
    IF NOT (INSTR(L_BP0e$, "Ymax") > 0) THEN GOTO L_3055e   '@304ac DS:28de
    L_BP0e$ = RT_MID$((L_BP0e$), (1), (INSTR(L_BP0e$, "Ymax") - 1)) + LTRIM$(STR$(RT_SNG!(INT((V_1532% - V_1536% - FX##(L_BP10%) / 2.0 - V_152c!) / V_1a8c!)))) + RT_MID2$((L_BP0e$), (INSTR(L_BP0e$, "Ymax") + 4))   '@304c5 DS:28de,28e6
L_3055e:
    PRINT #3, L_BP0e$; " "   '@3055e DS:28d0
    PRINT #3, V_1a64$; " "   '@3057e DS:28d0
    PRINT #3, V_1a68$; " "   '@3059e DS:28d0
    L_BP12% = 1   '@305be
    FOR V_11bc! = 0.0 TO 9.0   '@305c8 DS:28ea,28ee,28f2
    IF NOT (A_1a26%(RT_CINT%(FX##(V_11bc!))) > L_BP12%) THEN GOTO L_3061f   '@305d6
    L_BP12% = A_1a26%(RT_CINT%(FX##(V_11bc!)))   '@305fd
L_3061f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@3061f DS:28ee,28f2
    L_BP16! = L_BP12%   '@30648
    FOR L_BP1a! = 1.0 TO L_BP16!   '@3065c DS:28ee
    IF NOT (V_1524$ = "S") THEN GOTO L_30743   '@30664 DS:2890
    IF NOT (L_BP1a! <= V_1a7c!) THEN GOTO L_3073b   '@3067b
    PRINT #3, RT_MID$((V_1a80$), (1), (INSTR(V_1a80$, "[") - 1)); LTRIM$(STR$(L_BP1a!))   '@30695 DS:28f6
    PRINT #3, RT_MID$((V_1a84$), (1), (INSTR(V_1a84$, "[") - 1)); LTRIM$(STR$(A_19f8%(RT_CINT%(FX##(L_BP1a!)))))   '@306dc DS:28f6
L_3073b:
    GOTO L_308de   '@3073b
L_30743:
    IF NOT (L_BP1c% <= V_1a7c! AND L_BP1a! <= V_1a7c!) THEN GOTO L_3082c   '@30743
    PRINT #3, RT_MID$((V_1a80$), (1), (INSTR(V_1a80$, "[") - 1)); LTRIM$(STR$(L_BP1a!))   '@30783 DS:28f6
    PRINT #3, RT_MID$((V_1a84$), (1), (INSTR(V_1a84$, "[") - 1)); LTRIM$(STR$(A_19f8%(RT_CINT%(FX##(L_BP1a!)))))   '@307ca DS:28f6
    GOTO L_308d9   '@30824
L_3082c:
    RT_VIEWPRINT 25, 25   '@3082c
    RT_CLS 2   '@3083b
    PRINT " Coloque a pena de numero"; L_BP1a!; " no Ploter, no local da pena"; V_1a7c!;   '@30849 DS:28fc,291a
    BEEP   '@30878
    CALL MIXT_07f1_LimpaTeclado   '@30882
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "  <Enter> para seguir", V_0e0c$   '@3088c DS:293a (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_CLS 2   '@308a6
    PRINT " Aguarde ...";   '@308b4 DS:2954
    RT_VIEWPRINT 1, 25   '@308c2
L_308d9:
L_308de:
    IF NOT (A_1a26%(1) = L_BP1a!) THEN GOTO L_30a11   '@308de
    L_BP20! = A_1692!(0, 0)   '@30908
    FOR V_11ec! = 1.0 TO L_BP20!   '@30928 DS:28ee
    L_BP24! = A_1692!(RT_CINT%(FX##(V_11ec!)), 0)   '@30930
    L_BP28! = A_1692!(RT_CINT%(FX##(V_11ec!)), 1)   '@30959
    L_BP2c! = A_1692!(RT_CINT%(FX##(V_11ec!)), 2)   '@30983
    L_BP30! = A_1692!(RT_CINT%(FX##(V_11ec!)), 3)   '@309aa
    GOSUB L_38c9a   '@309d4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@309e1 DS:28ee
L_30a11:
    IF NOT (A_1a26%(2) = L_BP1a!) THEN GOTO L_30b2c   '@30a11
    L_BP34! = A_15da!(0, 0)   '@30a3e
    FOR V_11b8! = 1.0 TO L_BP34!   '@30a5e DS:28ee
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@30a66
    IF NOT (V_11bc! > 0.0) THEN GOTO L_30afc   '@30a91 DS:28ea
    V_11ec! = -V_11b8!   '@30aac
    CALL S_22bb6   '@30ac0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP38! = V_11d4!   '@30aca
    L_BP3c! = V_11d8!   '@30ada
    GOSUB L_347dd   '@30aea
L_30afc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@30afc DS:28ee
L_30b2c:
    IF NOT (A_1a26%(0) = L_BP1a!) THEN GOTO L_30c61   '@30b2c
    L_BP40! = A_1664!(0, 0)   '@30b58
    FOR V_11ec! = 1.0 TO L_BP40!   '@30b78 DS:28ee
    L_BP24! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@30b80
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@30ba9
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@30bd3
    L_BP30! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@30bfa
    GOSUB L_38c9a   '@30c24
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@30c31 DS:28ee
L_30c61:
    IF NOT (A_1a26%(6) = L_BP1a! AND V_1556$ = "S") THEN GOTO L_30ff7   '@30c61 DS:2890
    L_BP44! = 0.0   '@30cb1 DS:28ea
    L_BP48! = A_17a6%(0, 0)   '@30cc1
    FOR V_11b8! = 1.0 TO L_BP48!   '@30ce5 DS:28ee
    L_BP4c! = FX##(V_153c%) * V_1546!   '@30cec
    L_BP0e$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@30d04
    L_BP50! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) - FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@30d3c DS:2964
    L_BP54! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)   '@30d83
    GOSUB L_38e52   '@30db1
    IF NOT (V_155a$ = "S") THEN GOTO L_30fc7   '@30dbe DS:2890
    L_BP4c! = V_153c% * 0.800000011920928955078125## * V_1546!   '@30dd5 DS:2968
    L_BP58! = 1.0   '@30df2 DS:28ee
    V_11c0! = 0.0   '@30e02 DS:28ea
L_30e18:
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP58!)), 1) = 2.0) THEN GOTO L_30e6a   '@30e18 DS:28e6
    V_11c0! = FX##(V_11c0!) + 1.0   '@30e4c DS:28ee
    GOTO L_30fa6   '@30e62
L_30e6a:
    IF NOT (FX##(L_BP58!) - V_11c0! = FX##(V_11b8!)) THEN GOTO L_30fa1   '@30e6a
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP58!)), 1) = 0.0) THEN GOTO L_30f94   '@30e89 DS:28ea
    L_BP0e$ = "h=" + LTRIM$(STR$(A_115e!(RT_CINT%(FX##(L_BP58!)), 0)))   '@30ebd DS:296c
    L_BP50! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) - FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@30f01 DS:2964
    L_BP54! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) - L_BP4c! * 0.1500000059604644775390625##   '@30f48 DS:2972
    GOSUB L_38e52   '@30f82
L_30f94:
    GOTO L_30fc2   '@30f94
L_30fa1:
L_30fa6:
    L_BP58! = FX##(L_BP58!) + 1.0   '@30fa6 DS:28ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_30e18   '@30fba
L_30fc2:
L_30fc7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@30fc7 DS:28ee
L_30ff7:
    IF NOT (A_1a26%(7) = L_BP1a! AND V_1566$ = "S") THEN GOTO L_31cf1   '@30ff7 DS:2890
    L_BP5c! = A_15da!(0, 0)   '@31047
    FOR V_11b8! = 1.0 TO L_BP5c!   '@31067 DS:28ee
    L_BP4c! = FX##(V_153c%) * V_153e!   '@3106e
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@31086
    IF NOT (V_11bc! > 0.0) THEN GOTO L_31cc1   '@310b1 DS:28ea
    L_BP44! = 0.0   '@310cc DS:28ea
    L_BP50! = A_174a%(RT_CINT%(FX##(V_11b8!)), 0)   '@310dc
    L_BP54! = A_174a%(RT_CINT%(FX##(V_11b8!)), 1)   '@31109
    L_BP0e$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@31137
    GOSUB L_38e52   '@31169
    IF NOT (V_156a$ = "S") THEN GOTO L_31cbc   '@31176 DS:2890
    L_BP4c! = FX##(V_153c%) * 0.5 * V_153e!   '@3118d DS:2976
    V_11ec! = -V_11b8!   '@311aa
    CALL S_22bb6   '@311be
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP60! = V_11d4!   '@311c8
    L_BP64! = V_11d8!   '@311d8
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_313c0   '@311e8
    L_BP44! = 0.0   '@31217 DS:28ea
    L_BP50! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP60!   '@31227 DS:28e6
    L_BP54! = L_BP64!   '@31262
    L_BP0e$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * 10) / 10.0#)))   '@31271 DS:297a
    GOSUB L_38e52   '@312c7
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_313b8   '@312d4
    L_BP50! = L_BP60! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@31303 DS:28e6
    L_BP54! = L_BP64!   '@31341
    L_BP0e$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) * 10) / 10.0#)))   '@31350 DS:297a
    GOSUB L_38e52   '@313a6
L_313b8:
    GOTO L_31cb7   '@313b8
L_313c0:
    L_BP68! = A_16ee!(0, 0)   '@313c0
    FOR V_11ec! = 1.0 TO L_BP68!   '@313e0 DS:28ee
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1 AND V_11ec! = 3.0) THEN GOTO L_31444   '@313e8 DS:2982
    GOTO L_31cb2   '@3143c
L_31444:
    V_1a94! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP60!   '@31444
    V_1a98! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP64!   '@31472
    V_1a9c! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP60!   '@314a1 DS:28ee
    V_1aa0! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP64!   '@314d4 DS:28ee
    L_BP0e$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&(RT_SQR##(RT_POT##((FX##(V_1a94!) - V_1a9c!), (2.0)) + RT_POT##((FX##(V_1a98!) - V_1aa0!), (2.0))) * 10.0)) / 10.0#)))   '@31508 DS:28e6,297a,2986
    IF NOT (V_1a94! < V_1a9c! AND V_1a98! = V_1aa0!) THEN GOTO L_31615   '@31572
    L_BP44! = 0.0   '@315b0 DS:28ea
    L_BP50! = (FX##(V_1a94!) + V_1a9c!) / 2.0 - FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@315c0 DS:28e6,2964
    L_BP54! = FX##(L_BP4c!) / 50.0 + V_1a98!   '@315f4 DS:298a
    GOTO L_31c7a   '@3160d
L_31615:
    IF NOT (V_1a94! > V_1a9c! AND V_1a98! = V_1aa0!) THEN GOTO L_316b4   '@31615
    L_BP44! = 0.0   '@31653 DS:28ea
    L_BP50! = (FX##(V_1a94!) + V_1a9c!) / 2.0 - FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@31663 DS:28e6,2964
    L_BP54! = FX##(V_1a98!) - 10.0   '@31697 DS:298e
    GOTO L_31c75   '@316ac
L_316b4:
    IF NOT (V_1a94! = V_1a9c!) THEN GOTO L_317bc   '@316b4
    IF NOT (V_1a98! < V_1aa0!) THEN GOTO L_31752   '@316cf
    L_BP44! = 90.0   '@316ea DS:2992
    L_BP50! = V_1a94! - FX##(L_BP4c!) / 50.0   '@316fa DS:298a
    L_BP54! = (FX##(V_1a98!) + V_1aa0!) / 2.0 - FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@31716 DS:28e6,2964
    GOTO L_317b4   '@3174a
L_31752:
    L_BP44! = 270.0   '@31752 DS:2996
    L_BP50! = FX##(L_BP4c!) / 50.0 + V_1a94!   '@31762 DS:298a
    L_BP54! = (FX##(V_1a98!) + V_1aa0!) / 2.0 + FX##(LEN(L_BP0e$)) * L_BP4c! * 0.02999999932944774627685546875##   '@3177b DS:28e6,2964
L_317b4:
    GOTO L_31c70   '@317b4
L_317bc:
    L_BP50! = (FX##(V_1a94!) + V_1a9c!) / 2.0   '@317bc DS:28e6
    L_BP54! = (FX##(V_1a98!) + V_1aa0!) / 2.0   '@317d6 DS:28e6
    IF NOT (V_1a98! < V_1aa0! AND V_1a94! < V_1a9c!) THEN GOTO L_318f8   '@317f0
    L_BP44! = ATN((FX##(V_1aa0!) - V_1a98!) / (FX##(V_1a9c!) - V_1a94!))   '@3182e
    L_BP50! = L_BP50! - RT_SIN##(FX##(L_BP44!)) * L_BP4c! / 50.0 - LEN(L_BP0e$) * RT_COS##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c!   '@31857 DS:2964,298a
    L_BP54! = RT_COS##(FX##(L_BP44!)) * L_BP4c! / 50.0 - LEN(L_BP0e$) * RT_SIN##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c! + L_BP54!   '@318a5 DS:2964,298a
    GOTO L_31c52   '@318f0
L_318f8:
    IF NOT (V_1a98! < V_1aa0! AND V_1a94! > V_1a9c!) THEN GOTO L_31a42   '@318f8
    L_BP44! = ATN((FX##(V_1a94!) - V_1a9c!) / (FX##(V_1aa0!) - V_1a98!))   '@31936
    L_BP50! = L_BP50! - (FX##(L_BP4c!) / 50.0 + L_BP4c! * 0.119999997317790985107421875##) * RT_COS##(FX##(L_BP44!)) - LEN(L_BP0e$) * RT_SIN##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c!   '@3195f DS:2964,298a,299a
    L_BP54! = L_BP54! - (FX##(L_BP4c!) / 50.0 + L_BP4c! * 0.119999997317790985107421875##) * RT_SIN##(FX##(L_BP44!)) + LEN(L_BP0e$) * RT_COS##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c!   '@319bc DS:2964,298a,299a
    L_BP44! = 3.0# * FX##(V_0e04#) / 2.0# + L_BP44!   '@31a19 DS:299e,29a6
    GOTO L_31c4d   '@31a3a
L_31a42:
    IF NOT (V_1a98! > V_1aa0! AND V_1a94! > V_1a9c!) THEN GOTO L_31b68   '@31a42
    L_BP44! = ATN((FX##(V_1a98!) - V_1aa0!) / (FX##(V_1a94!) - V_1a9c!))   '@31a80
    L_BP50! = (FX##(L_BP4c!) / 50.0 + L_BP4c! * 0.119999997317790985107421875##) * RT_SIN##(FX##(L_BP44!)) - LEN(L_BP0e$) * RT_COS##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c! + L_BP50!   '@31aa9 DS:2964,298a,299a
    L_BP54! = L_BP54! - (FX##(L_BP4c!) / 50.0 + L_BP4c! * 0.119999997317790985107421875##) * RT_COS##(FX##(L_BP44!)) - LEN(L_BP0e$) * RT_SIN##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c!   '@31b03 DS:2964,298a,299a
    GOTO L_31c48   '@31b60
L_31b68:
    L_BP44! = ATN((FX##(V_1a98!) - V_1aa0!) / (FX##(V_1a9c!) - V_1a94!))   '@31b68
    L_BP50! = RT_SIN##(FX##(L_BP44!)) * L_BP4c! / 50.0 - LEN(L_BP0e$) * RT_COS##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c! + L_BP50!   '@31b91 DS:2964,298a
    L_BP54! = RT_COS##(FX##(L_BP44!)) * L_BP4c! / 50.0 + L_BP54! + LEN(L_BP0e$) * RT_SIN##(FX##(L_BP44!)) * 0.02999999932944774627685546875## * L_BP4c!   '@31bdc DS:2964,298a
    L_BP44! = 2.0# * FX##(V_0e04#) - L_BP44!   '@31c27 DS:29a6
L_31c48:
L_31c4d:
L_31c52:
    L_BP44! = FX##(L_BP44!) * 180.0 / V_0e04#   '@31c52 DS:29ae
L_31c70:
L_31c75:
L_31c7a:
    GOSUB L_38e52   '@31c7a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@31c87 DS:28ee
L_31cb2:
L_31cb7:
L_31cbc:
L_31cc1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@31cc1 DS:28ee
L_31cf1:
    IF NOT (A_1a26%(5) = L_BP1a! AND V_155e$ = "S") THEN GOTO L_3222e   '@31cf1 DS:2890
    L_BP6c! = A_157e%(0)   '@31d41
    FOR V_11b8! = 1.0 TO L_BP6c!   '@31d64 DS:28ee
    IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_321fe   '@31d6c
    L_BP4c! = FX##(V_153c%) * V_1542!   '@31d93
    L_BP50! = A_1778%(RT_CINT%(FX##(V_11b8!)), 0)   '@31dab
    L_BP54! = A_1778%(RT_CINT%(FX##(V_11b8!)), 1)   '@31dd8
    L_BP6e% = A_1778%(RT_CINT%(FX##(V_11b8!)), 2)   '@31e06
    IF NOT (L_BP6e% >= 0) THEN GOTO L_31e74   '@31e29
    L_BP44! = A_1778%(RT_CINT%(FX##(V_11b8!)), 2) * 1.7999999523162841796875## / V_0e04#   '@31e37 DS:29b2
    GOTO L_31ec9   '@31e6c
L_31e74:
    IF NOT (L_BP6e% < 0) THEN GOTO L_31ec9   '@31e74
    L_BP44! = (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 2)) / 100.0 + V_0e04#) * 180.0# / V_0e04# + 180.0#   '@31e7d DS:29b6,29ba
    GOTO L_31ec9   '@31ec1
L_31ec9:
    IF NOT (V_1562$ = "S") THEN GOTO L_32199   '@31ec9 DS:2890
    L_BP70% = 0   '@31ee0
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 1) = 0.0) THEN GOTO L_31f3c   '@31eea DS:28ea
    L_BP70% = 1   '@31f32
L_31f3c:
    V_0e0c$ = " (" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP70%, 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BP70%, 1)))   '@31f3c DS:29c2,29c8
    L_BP74! = FX##(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 0)) + A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 2)   '@31fe0
    FOR L_BP58! = L_BP70% TO L_BP74!   '@3204e DS:28ee
    V_0e10$ = LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), RT_CINT%(FX##(L_BP58!)), 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), RT_CINT%(FX##(L_BP58!)), 1)))   '@3205a DS:29c8
    IF NOT (RT_INSTR%((1), (V_0e0c$), (V_0e10$)) = 0) THEN GOTO L_3214d   '@32105
    V_0e0c$ = V_0e0c$ + "/" + V_0e10$   '@32122 DS:29ce
L_3214d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP58!   '@3214d DS:28ee
    V_0e0c$ = V_0e0c$ + ")"   '@32175 DS:29d4
    GOTO L_321b0   '@32191
L_32199:
    V_0e0c$ = ""   '@32199 DS:29da
L_321b0:
    L_BP0e$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!)))) + V_0e0c$   '@321b0
    GOSUB L_38e52   '@321ec
L_321fe:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@321fe DS:28ee
L_3222e:
    L_BP76% = (A_1a26%(3) = L_BP1a!)   '@3222e DS:2890
    IF NOT (((A_1a26%(8) = L_BP1a! OR L_BP76%) AND V_156e$ = "S") <> 0) THEN GOTO L_33015   '@32293
    IF NOT (V_1802% = 0) THEN GOTO L_322c8   '@322b1
    GOTO L_3300b   '@322c0
L_322c8:
    L_BP4c! = FX##(V_153c%) * V_154a!   '@322c8
    L_BP7a! = FX##(V_1ac4!) + 20.0   '@322e0 DS:29de
    L_BP7e! = V_1ac0!   '@322f5
    L_BP82! = A_1804!(0, 0)   '@32305
    FOR V_11b8! = 1.0 TO L_BP82!   '@32326 DS:28ee
    L_BP84% = RT_CINT%(FX##(A_1804!(RT_CINT%(FX##(V_11b8!)), 4)))   '@3232e
    L_BP88! = A_1804!(RT_CINT%(FX##(V_11b8!)), 5)   '@3235b
    L_BP8c! = A_1804!(RT_CINT%(FX##(V_11b8!)), 0)   '@32386
    IF NOT (L_BP8c! = 0.0) THEN GOTO L_329bc   '@323b0 DS:28ea
    V_11e4! = 1.0   '@323cb DS:28ee
L_323e2:
    IF NOT (V_11e4! <= L_BP88!) THEN GOTO L_329b4   '@323e3
    L_BP90! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 0)   '@323f8 DS:29e2
    L_BP94! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 1)   '@32437 DS:29e2
    L_BP98! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 2)   '@32477 DS:29e2
    L_BP9c! = L_BP90!   '@324b4
    IF NOT (L_BP9c! = -1.0) THEN GOTO L_32526   '@324c5 DS:29e2
    L_BPa0! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BP94!)), 0)) * 1000.0)) / 10.0#   '@324e0 DS:297a,29e6
    GOTO L_3265c   '@3251e
L_32526:
    IF NOT (L_BP9c! = -2.0) THEN GOTO L_325ee   '@32527 DS:29ea
    V_11ec! = -L_BP94!   '@3253c
    CALL S_22bb6   '@32550
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP94!))), V_13aa%, 6) = 2) THEN GOTO L_325b1   '@3255a
    L_BPa0! = V_11d8!   '@32598
    GOTO L_325e6   '@325a9
L_325b1:
    L_BPa0! = FX##(A_16ee!(RT_CINT%(FX##(L_BP98!)), 1)) + V_11d8!   '@325b1
L_325e6:
    GOTO L_3265c   '@325e6
L_325ee:
    IF NOT (L_BP9c! = -3.0) THEN GOTO L_3263e   '@325ef DS:29ee
    L_BPa0! = A_1664!(RT_CINT%(FX##(L_BP94!)), RT_CINT%(FX##(L_BP98!)))   '@32604
    GOTO L_3265c   '@32636
L_3263e:
    IF NOT (L_BP9c! = -4.0) THEN GOTO L_3265c   '@3263f DS:29f2
    GOTO L_3265c   '@32654
L_3265c:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_3270d   '@3265c DS:28ee
    IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 1) <> -1000.0) THEN GOTO L_326df   '@32677 DS:29f6
    L_BPa4! = A_1804!(RT_CINT%(FX##(V_11b8!)), 1)   '@326ac
    GOTO L_32708   '@326d7
L_326df:
    L_BP7a! = FX##(L_BP7a!) + 30.0   '@326df DS:29fa
    L_BPa4! = L_BP7a!   '@326f3
L_32708:
L_3270d:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_32741   '@3270d DS:28ee
    L_BPa8! = L_BPa0!   '@32728
    GOTO L_328ac   '@32739
L_32741:
    IF NOT (A_1a26%(3) = L_BP1a!) THEN GOTO L_327c0   '@32741
    L_BP24! = L_BPa4!   '@3276e
    L_BP28! = L_BPa8!   '@3277e
    L_BP2c! = L_BPa4!   '@3278e
    L_BP30! = L_BPa0!   '@3279e
    GOSUB L_38c9a   '@327ae
L_327c0:
    IF NOT (A_1a26%(8) = L_BP1a!) THEN GOTO L_32896   '@327c0
    L_BP0e$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BPa0!) - L_BPa8!) * 10.0)) / 10.0#)))   '@327ed DS:297a,2986
    L_BP50! = L_BPa4! - 0.300000011920928955078125##   '@3282f DS:29fe
    L_BP54! = (FX##(L_BPa8!) + L_BPa0!) / 2.0 - LEN(L_BP0e$) * 6   '@32844 DS:28e6
    L_BP44! = 90.0   '@32874 DS:2992
    GOSUB L_38e52   '@32884
L_32896:
    L_BPa8! = L_BPa0!   '@32896
L_328ac:
    IF NOT (A_1a26%(3) = L_BP1a!) THEN GOTO L_32996   '@328ac
    L_BP24! = FX##(L_BPa4!) - 7.0   '@328d9 DS:2a02
    L_BP28! = L_BPa8!   '@328ee
    L_BP2c! = FX##(L_BPa4!) + 7.0   '@328fe DS:2a06
    L_BP30! = L_BPa8!   '@32913
    GOSUB L_38c9a   '@32923
    L_BP24! = FX##(L_BPa4!) - 5.0   '@32930 DS:2a0a
    L_BP28! = FX##(L_BPa8!) + 2.0   '@32945 DS:28e6
    L_BP2c! = FX##(L_BPa4!) + 5.0   '@3295a DS:2a0e
    L_BP30! = FX##(L_BPa8!) - 2.0   '@3296f DS:29ea
    GOSUB L_38c9a   '@32984
L_32996:
    V_11e4! = FX##(V_11e4!) + 1.0   '@32996 DS:28ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_323e2   '@329ac
L_329b4:
    GOTO L_32fda   '@329b4
L_329bc:
    IF NOT (L_BP8c! = 1.0) THEN GOTO L_32fbc   '@329bd DS:28ee
    V_11e4! = 1.0   '@329d2 DS:28ee
L_329e8:
    IF NOT (V_11e4! <= L_BP88!) THEN GOTO L_32fb4   '@329e9
    L_BP90! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 0)   '@329fe DS:29e2
    L_BP94! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 1)   '@32a3d DS:29e2
    L_BP98! = A_1832%(RT_CINT%(L_BP84% + (FX##(V_11e4!) - 1.0)), 2)   '@32a7d DS:29e2
    L_BPac! = L_BP90!   '@32aba
    IF NOT (L_BPac! = -1.0) THEN GOTO L_32b2d   '@32acb DS:29e2
    L_BPb0! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BP94!)), 1)) * 1000.0)) / 10.0#   '@32ae6 DS:297a,29e6
    GOTO L_32c62   '@32b25
L_32b2d:
    IF NOT (L_BPac! = -2.0) THEN GOTO L_32bf4   '@32b2e DS:29ea
    V_11ec! = -L_BP94!   '@32b43
    CALL S_22bb6   '@32b57
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP94!))), V_13aa%, 6) = 2) THEN GOTO L_32bb8   '@32b61
    L_BPb0! = V_11d4!   '@32b9f
    GOTO L_32bec   '@32bb0
L_32bb8:
    L_BPb0! = FX##(A_16ee!(RT_CINT%(FX##(L_BP98!)), 0)) + V_11d4!   '@32bb8
L_32bec:
    GOTO L_32c62   '@32bec
L_32bf4:
    IF NOT (L_BPac! = -3.0) THEN GOTO L_32c44   '@32bf5 DS:29ee
    L_BPb0! = A_1664!(RT_CINT%(FX##(L_BP94!)), RT_CINT%(FX##(L_BP98!)))   '@32c0a
    GOTO L_32c62   '@32c3c
L_32c44:
    IF NOT (L_BPac! = -4.0) THEN GOTO L_32c62   '@32c45 DS:29f2
    GOTO L_32c62   '@32c5a
L_32c62:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_32d0d   '@32c62 DS:28ee
    IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 2) <> -1000.0) THEN GOTO L_32cdf   '@32c7d DS:29f6
    L_BPa8! = A_1804!(RT_CINT%(FX##(V_11b8!)), 2)   '@32caf
    GOTO L_32d08   '@32cd7
L_32cdf:
    L_BP7e! = FX##(L_BP7e!) - 30.0   '@32cdf DS:2a12
    L_BPa8! = L_BP7e!   '@32cf3
L_32d08:
L_32d0d:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_32d41   '@32d0d DS:28ee
    L_BPa4! = L_BPb0!   '@32d28
    GOTO L_32eac   '@32d39
L_32d41:
    IF NOT (A_1a26%(3) = L_BP1a!) THEN GOTO L_32dc0   '@32d41
    L_BP24! = L_BPa4!   '@32d6e
    L_BP28! = L_BPa8!   '@32d7e
    L_BP2c! = L_BPb0!   '@32d8e
    L_BP30! = L_BPa8!   '@32d9e
    GOSUB L_38c9a   '@32dae
L_32dc0:
    IF NOT (A_1a26%(8) = L_BP1a!) THEN GOTO L_32e96   '@32dc0
    L_BP0e$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BPb0!) - L_BPa4!) * 10.0)) / 10.0#)))   '@32ded DS:297a,2986
    L_BP50! = (FX##(L_BPa4!) + L_BPb0!) / 2.0 - LEN(L_BP0e$) * 6   '@32e2f DS:28e6
    L_BP54! = FX##(L_BPa8!) + 3.0   '@32e5f DS:2982
    L_BP44! = 0.0   '@32e74 DS:28ea
    GOSUB L_38e52   '@32e84
L_32e96:
    L_BPa4! = L_BPb0!   '@32e96
L_32eac:
    IF NOT (A_1a26%(3) = L_BP1a!) THEN GOTO L_32f96   '@32eac
    L_BP24! = L_BPa4!   '@32ed9
    L_BP28! = FX##(L_BPa8!) + 5.0   '@32ee9 DS:2a0e
    L_BP2c! = L_BPa4!   '@32efe
    L_BP30! = FX##(L_BPa8!) - 5.0   '@32f0e DS:2a0a
    GOSUB L_38c9a   '@32f23
    L_BP24! = FX##(L_BPa4!) + 3.0   '@32f30 DS:2982
    L_BP28! = FX##(L_BPa8!) + 4.0   '@32f45 DS:2a16
    L_BP2c! = FX##(L_BPa4!) - 3.0   '@32f5a DS:29ee
    L_BP30! = FX##(L_BPa8!) - 4.0   '@32f6f DS:29f2
    GOSUB L_38c9a   '@32f84
L_32f96:
    V_11e4! = FX##(V_11e4!) + 1.0   '@32f96 DS:28ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_329e8   '@32fac
L_32fb4:
    GOTO L_32fda   '@32fb4
L_32fbc:
    IF NOT (L_BP8c! = 2.0) THEN GOTO L_32fda   '@32fbd DS:28e6
    GOTO L_32fda   '@32fd2
L_32fda:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@32fda DS:28ee
L_3300b:
L_33015:
    L_BPb2% = (A_1a26%(4) = L_BP1a!)   '@33015 DS:2890
    IF NOT (((A_1a26%(9) = L_BP1a! OR L_BPb2%) AND V_1572$ = "S") <> 0) THEN GOTO L_3477b   '@3307b
    L_BP4c! = FX##(V_153c%) * V_154e!   '@3309a
    L_BPb6! = A_1200!(0, 0, 0)   '@330b2
    FOR V_11e4! = 1.0 TO L_BPb6!   '@330d4 DS:28ee
    L_BPba! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@330dc
    FOR V_11cc! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BPba!   '@3312e DS:28ee
    L_BP58! = 0.0   '@33158 DS:28ea
    L_BPbe! = FX##(A_1664!(0, 0)) - 1.0   '@33168 DS:29e2
    FOR V_11ec! = 1.0 TO L_BPbe!   '@3318e DS:28ee
    V_11bc! = FX##(V_11cc!) / 100.0 + V_11e4!   '@33196 DS:29b6
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 4) = V_11bc!) THEN GOTO L_346f2   '@331b1
    IF NOT (L_BP58! = 0.0) THEN GOTO L_337b1   '@331e6 DS:28ea
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_33269   '@33200
    L_BPc2! = FX##(V_0e04#) / 2.0#   '@3324b DS:29a6
    GOTO L_3379c   '@33261
L_33269:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_3332d   '@33269
    L_BPc2! = 0.0   '@332b8 DS:28ea
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_33325   '@332c9
    L_BPc2! = V_0e04#   '@33314
L_33325:
    GOTO L_33797   '@33325
L_3332d:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) < A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_33467   '@3332d
    L_BPc2! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@333d1
    GOTO L_33792   '@3345f
L_33467:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_335a9   '@33467
    L_BPc2! = V_0e04# - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2)))   '@3350b
    GOTO L_3378d   '@335a1
L_335a9:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) > A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_336e8   '@335a9
    L_BPc2! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2))) + V_0e04#   '@3364d
    GOTO L_33788   '@336e0
L_336e8:
    L_BPc2! = 2.0# * FX##(V_0e04#) - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@336e8 DS:29a6
L_33788:
L_3378d:
L_33792:
L_33797:
L_3379c:
    L_BP58! = 1.0   '@3379c DS:28ee
L_337b1:
    L_BPc6! = A_1664!(0, 0)   '@337b1
    FOR V_11bc! = FX##(V_11ec!) + 1.0 TO L_BPc6!   '@337d2 DS:28ee
    L_BP58! = FX##(V_11cc!) / 100.0 + V_11e4!   '@337de DS:29b6
    IF NOT (A_1664!(RT_CINT%(FX##(V_11bc!)), 4) = L_BP58!) THEN GOTO L_346c1   '@337f8
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_33cc1   '@3382c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) THEN GOTO L_33cb9   '@33877
    L_BPca! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@338c4
    L_BPce! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@338f0
    CALL MIXT_0877_Menor(L_BPca!, L_BPce!, L_BPd2!)   '@33915
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPce!   '@3392a
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPca!   '@33950
    L_BPd6! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@33976
    L_BPda! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@3399c
    CALL MIXT_0877_Menor(L_BPd6!, L_BPda!, L_BPde!)   '@339c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BPda!   '@339d6
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BPd6!   '@339fc
    CALL MIXT_082a_Maior(L_BPd2!, L_BPde!, L_BPe2!)   '@33a21
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a98! = L_BPe2!   '@33a36
    L_BPe6! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@33a41
    L_BPea! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@33a6d
    CALL MIXT_082a_Maior(L_BPe6!, L_BPea!, L_BPee!)   '@33a92
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPea!   '@33aa7
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPe6!   '@33acd
    L_BPf2! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@33af3
    L_BPf6! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@33b19
    CALL MIXT_082a_Maior(L_BPf2!, L_BPf6!, L_BPfa!)   '@33b3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BPf6!   '@33b53
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BPf2!   '@33b79
    CALL MIXT_0877_Menor(L_BPee!, L_BPfa!, L_BPfe!)   '@33b9e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aa0! = L_BPfe!   '@33bb3
    IF NOT (FX##(V_1aa0!) - V_1a98! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_33cb4   '@33bbe DS:2a1a
    L_BP102! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) / 2.0   '@33c08 DS:28e6
    L_BP106! = (FX##(V_1aa0!) + V_1a98!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@33c55 DS:28e6
    GOSUB L_374ea   '@33ca2
L_33cb4:
L_33cb9:
    GOTO L_346bc   '@33cb9
L_33cc1:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_3413e   '@33cc1
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) THEN GOTO L_34136   '@33d10
    L_BP10a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@33d5f
    L_BP10e! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@33d8a
    CALL MIXT_0877_Menor(L_BP10a!, L_BP10e!, L_BP112!)   '@33dac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP10e!   '@33dc1
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP10a!   '@33de4
    L_BP116! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@33e09
    L_BP11a! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@33e2e
    CALL MIXT_0877_Menor(L_BP116!, L_BP11a!, L_BP11e!)   '@33e50
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP11a!   '@33e65
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP116!   '@33e88
    CALL MIXT_082a_Maior(L_BP112!, L_BP11e!, L_BP122!)   '@33eac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a94! = L_BP122!   '@33ec1
    L_BP126! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@33ecc
    L_BP12a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@33ef7
    CALL MIXT_082a_Maior(L_BP126!, L_BP12a!, L_BP12e!)   '@33f19
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP12a!   '@33f2e
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP126!   '@33f51
    L_BP132! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@33f76
    L_BP136! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@33f9b
    CALL MIXT_082a_Maior(L_BP132!, L_BP136!, L_BP13a!)   '@33fbd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP136!   '@33fd2
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP132!   '@33ff5
    CALL MIXT_0877_Menor(L_BP12e!, L_BP13a!, L_BP13e!)   '@34019
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a9c! = L_BP13e!   '@3402e
    IF NOT (FX##(V_1a9c!) - V_1a94! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_34131   '@34039 DS:2a1a
    L_BP102! = (FX##(V_1a9c!) + V_1a94!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@34083 DS:28e6
    L_BP106! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) / 2.0   '@340d0 DS:28e6
    GOSUB L_374ea   '@3411f
L_34131:
L_34136:
    GOTO L_346b7   '@34136
L_3413e:
    V_1a94! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) * A_1664!(RT_CINT%(FX##(V_11ec!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1))   '@3413e
    V_1a9c! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) * A_1664!(RT_CINT%(FX##(V_11bc!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 1))   '@34205
    IF NOT (ABS(FX##(V_1a94!) - V_1a9c!) > FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) - 1.0) THEN GOTO L_346b2   '@342cc DS:29e2
    V_1aa4! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - V_1a94!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1))), (2.0)))   '@34318 DS:28e6
    V_1aa8! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - V_1a94!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3))), (2.0)))   '@34384 DS:28e6
    V_1aac! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) - V_1a9c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 1))), (2.0)))   '@343ee DS:28e6
    V_1ab0! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - V_1a9c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3))), (2.0)))   '@3445a DS:28e6
    CALL MIXT_0877_Menor(V_1aa4!, V_1aa8!, L_BP142!)   '@344c4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_1aac!, V_1ab0!, L_BP146!)   '@344db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP142!, L_BP146!, L_BP14a!)   '@344ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a98! = L_BP14a!   '@34502
    CALL MIXT_082a_Maior(V_1aa4!, V_1aa8!, L_BP14e!)   '@3450d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_1aac!, V_1ab0!, L_BP152!)   '@34524
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP14e!, L_BP152!, L_BP156!)   '@34536
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aa0! = L_BP156!   '@3454b
    IF NOT (FX##(V_1aa0!) - V_1a98! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_346ad   '@34556 DS:2a1a
    IF NOT (FX##(L_BPc2!) > FX##(V_0e04#)) THEN GOTO L_345d1   '@345a0
    L_BPc2! = FX##(L_BPc2!) - V_0e04#   '@345bb
L_345d1:
    L_BP102! = (FX##(V_1a9c!) + V_1a94!) / 2.0 + ((FX##(V_1a98!) + V_1aa0!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_COS##(FX##(L_BPc2!))   '@345d1 DS:28e6
    L_BP106! = ((FX##(V_1a98!) + V_1aa0!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_SIN##(FX##(L_BPc2!))   '@3463f DS:28e6
    GOSUB L_374ea   '@3469b
L_346ad:
L_346b2:
L_346b7:
L_346bc:
L_346c1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@346c1 DS:28ee
L_346f2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@346f2 DS:28ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@3471e DS:28ee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@3474a DS:28ee
L_3477b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP1a!   '@3477b DS:28ee
    PRINT #3, V_1a5c$; " 0,0"   '@347a3 DS:2a1e
    RT_CLOSE   '@347c3 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    GOTO L_398a7   '@347d0
    ' ---- F_347d8 @0x347d8  (0347d8_F_347d8.lift.txt; evidence_id (assembly): ev_4db680c3455170d787084c371c4cc8193b34d585019b589ac5030a0eca420dc3)
L_347dd:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_34ab3   '@347e2
    L_BP15a! = L_BP38!   '@34811
    L_BP15e! = L_BP3c!   '@34821
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@34831 DS:28e6
    GOSUB L_394e7   '@34869
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 0.4000000059604644775390625##   '@34876 DS:28e6,2a26
    GOSUB L_394e7   '@348b3
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 0.800000011920928955078125##   '@348c0 DS:28e6,2a2a
    GOSUB L_394e7   '@348fd
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 1.2000000476837158203125##   '@3490a DS:28e6,2a2e
    GOSUB L_394e7   '@34947
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_34aab   '@34954
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@34983 DS:28e6
    GOSUB L_394e7   '@349bb
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 0.4000000059604644775390625##   '@349c8 DS:28e6,2a32
    GOSUB L_394e7   '@34a05
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 0.800000011920928955078125##   '@34a12 DS:28e6,2968
    GOSUB L_394e7   '@34a4f
    L_BP162! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 1.2000000476837158203125##   '@34a5c DS:28e6,2a36
    GOSUB L_394e7   '@34a99
L_34aab:
    GOTO L_34c5b   '@34aab
L_34ab3:
    L_BP166! = A_16ee!(0, 0)   '@34ab3
    FOR V_11ec! = 1.0 TO L_BP166!   '@34ad4 DS:28ee
    L_BP24! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP38!   '@34adc
    L_BP28! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP3c!   '@34b09
    L_BP2c! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP38!   '@34b37 DS:28ee
    L_BP30! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP3c!   '@34b69 DS:28ee
    GOSUB L_38c9a   '@34b9c
    L_BP16a! = 0.4000000059604644775390625##   '@34ba9 DS:2a32
    GOSUB L_3661a   '@34bba
    GOSUB L_38c9a   '@34bc7
    L_BP16a! = 0.800000011920928955078125##   '@34bd4 DS:2968
    GOSUB L_3661a   '@34be5
    GOSUB L_38c9a   '@34bf2
    L_BP16a! = 1.2000000476837158203125##   '@34bff DS:2a36
    GOSUB L_3661a   '@34c10
    GOSUB L_38c9a   '@34c1d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@34c2a DS:28ee
L_34c5b:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 1) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_357f2   '@34c5b
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_34dc2   '@34ca7
    V_1a94! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@34cd6 DS:28e6
    V_1a98! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@34d10 DS:28e6
    V_1a9c! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@34d4a DS:28e6
    V_1aa0! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@34d82 DS:28e6
    GOTO L_3501f   '@34dba
L_34dc2:
    V_1a94! = A_16ee!(1, 0)   '@34dc2
    V_1a98! = A_16ee!(1, 1)   '@34de5
    V_1a9c! = A_16ee!(1, 0)   '@34e06
    V_1aa0! = A_16ee!(1, 1)   '@34e29
    L_BP16e! = A_16ee!(0, 0)   '@34e4a
    FOR V_11ec! = 2.0 TO L_BP16e!   '@34e6b DS:28e6,28ee
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) < V_1a94!) THEN GOTO L_34ed0   '@34e72
    V_1a94! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@34ea6
L_34ed0:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) < V_1a98!) THEN GOTO L_34f30   '@34ed0
    V_1a98! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@34f05
L_34f30:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) > V_1a9c!) THEN GOTO L_34f8e   '@34f30
    V_1a9c! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@34f64
L_34f8e:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) > V_1aa0!) THEN GOTO L_34fee   '@34f8e
    V_1aa0! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@34fc3
L_34fee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@34fee DS:28ee
L_3501f:
    L_BP172! = FX##(V_1aa0!) - 1.0   '@3501f DS:29e2
    FOR V_11d8! = FX##(V_1a98!) + 1.0 TO L_BP172!   '@35036 DS:28ee
    L_BP102! = FX##(V_1a94!) - 1.0   '@35042 DS:29e2
    L_BP16a! = -1.0   '@35058 DS:29e2
L_3506e:
    L_BP176! = -1000.0   '@35073 DS:29f6
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_35454   '@35084
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@350b3 DS:28e6
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_3517b   '@35111 DS:29f6
    L_BP176! = V_11d4!   '@3516a
L_3517b:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@3517b DS:28e6
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35240   '@351d6 DS:29f6
    L_BP176! = V_11d4!   '@3522f
L_35240:
    IF NOT (ABS(FX##(V_11d8!)) < FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 AND A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_3544c   '@35240 DS:28e6
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@352ba DS:28e6
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35382   '@35318 DS:29f6
    L_BP176! = V_11d4!   '@35371
L_35382:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@35382 DS:28e6
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35447   '@353dd DS:29f6
    L_BP176! = V_11d4!   '@35436
L_35447:
L_3544c:
    GOTO L_356cd   '@3544c
L_35454:
    L_BP17a! = A_16ee!(0, 0)   '@35454
    FOR V_11ec! = 1.0 TO L_BP17a!   '@35475 DS:28ee
    L_BP17e! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@3547c
    L_BP182! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@354a6
    L_BP186! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@354d1 DS:28ee
    L_BP18a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@35500 DS:28ee
    IF NOT ((L_BP18a! >= V_11d8! OR L_BP182! >= V_11d8!) AND ((L_BP18a! <= V_11d8! OR L_BP182! <= V_11d8!) AND L_BP182! <> L_BP18a!)) THEN GOTO L_3569c   '@35530
    IF NOT (L_BP17e! = L_BP186!) THEN GOTO L_355f3   '@355bf
    V_11d4! = L_BP17e!   '@355da
    GOTO L_3562d   '@355eb
L_355f3:
    V_11d4! = (FX##(V_11d8!) - L_BP182!) * (FX##(L_BP186!) - L_BP17e!) / (FX##(L_BP18a!) - L_BP182!) + L_BP17e!   '@355f3
L_3562d:
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35697   '@3562d DS:29f6
    L_BP176! = V_11d4!   '@35686
L_35697:
L_3569c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@3569c DS:28ee
L_356cd:
    IF NOT (L_BP176! <> -1000.0) THEN GOTO L_357be   '@356cd DS:29f6
    IF NOT (L_BP16a! = -1.0) THEN GOTO L_35732   '@356e8 DS:29e2
    L_BP102! = L_BP176!   '@35703
    L_BP16a! = 0.0   '@35714 DS:28ea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3506e   '@35725
L_35732:
    L_BP24! = FX##(L_BP102!) + L_BP38!   '@35732
    L_BP28! = FX##(L_BP3c!) + V_11d8!   '@35746
    L_BP2c! = FX##(L_BP176!) + L_BP38!   '@3575a
    L_BP30! = FX##(L_BP3c!) + V_11d8!   '@3576e
    GOSUB L_38c9a   '@35782
    L_BP102! = L_BP176!   '@3578f
    L_BP16a! = -1.0   '@357a0 DS:29e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3506e   '@357b1
L_357be:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d8!   '@357be DS:28ee
    GOTO L_3660b   '@357ea
L_357f2:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) > A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_36606   '@357f2
    L_BPc2! = 35.81999969482421875## * V_0e04# / 180.0#   '@35841 DS:29ba,2a3a
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_35a0d   '@3585c
    L_BP17e! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BPc2!)) / 2.0   '@3588b DS:28e6
    L_BP182! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BPc2!)) / 2.0   '@358d4 DS:28e6
    L_BP186! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BPc2!)) / 2.0   '@3591b DS:28e6
    L_BP18a! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BPc2!)) / 2.0   '@35962 DS:28e6
    L_BP17e! = L_BP17e! - (FX##(L_BP182!) + 200.0) / RT_TAN##(FX##(L_BPc2!))   '@359ab DS:2a42
    L_BP186! = L_BP186! - (FX##(L_BP18a!) + 200.0) / RT_TAN##(FX##(L_BPc2!))   '@359d8 DS:2a42
    GOTO L_35b7f   '@35a05
L_35a0d:
    L_BP17e! = A_16ee!(1, 0) - (FX##(A_16ee!(1, 1)) + 200.0) / RT_TAN##(FX##(L_BPc2!))   '@35a0d DS:2a42
    L_BP186! = L_BP17e!   '@35a5c
    L_BP18e! = A_16ee!(0, 0)   '@35a6d
    FOR V_11ec! = 2.0 TO L_BP18e!   '@35a8e DS:28e6,28ee
    V_11d4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + 200.0) / RT_TAN##(FX##(L_BPc2!))   '@35a96 DS:2a42
    IF NOT (V_11d4! < L_BP17e!) THEN GOTO L_35b22   '@35af6
    L_BP17e! = V_11d4!   '@35b11
L_35b22:
    IF NOT (V_11d4! > L_BP186!) THEN GOTO L_35b4e   '@35b22
    L_BP186! = V_11d4!   '@35b3d
L_35b4e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@35b4e DS:28ee
L_35b7f:
    L_BP192! = 5.0 / RT_SIN##(FX##(L_BPc2!))   '@35b7f DS:2a0e
    IF NOT ((FX##(L_BP186!) - L_BP17e!) / L_BP192! < FX##(3.0)) THEN GOTO L_35bdf   '@35b9f DS:2982
    L_BP192! = (FX##(L_BP186!) - L_BP17e!) / 4.0   '@35bc4 DS:2a16
L_35bdf:
    L_BP196! = L_BP186! - 0.100000001490116119384765625##   '@35bdf DS:2a46
    L_BP19a! = L_BP192!   '@35bf6
    L_BP58! = FX##(L_BP17e!) + L_BP192!   '@35c02
    GOTO L_365b9_v   '@35c02
L_35c0e:
    L_BP102! = L_BP58!   '@35c0e
    L_BP16a! = -1.0   '@35c1e DS:29e2
L_35c34:
    L_BP176! = -1000.0   '@35c39 DS:29f6
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_361be   '@35c4a
    L_BP19e! = RT_POT##((RT_TAN##(FX##(L_BPc2!))), (2.0)) + 1.0   '@35c79 DS:28e6,28ee
    L_BP1a2! = RT_POT##((RT_TAN##(FX##(L_BPc2!))), (2.0)) * -2.0 * L_BP58! - RT_TAN##(FX##(L_BPc2!)) * 400.0   '@35ca2 DS:28e6,29ea,2a4a
    L_BP1a6! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BP58!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BPc2!))), (2.0)) + (RT_TAN##(FX##(L_BPc2!)) * 400.0 * L_BP58! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)))   '@35ce3 DS:28e6,2a42,2a4a
    V_11d4! = (-L_BP1a2! - RT_SQR##(RT_POT##((FX##(L_BP1a2!)), (2.0)) - FX##(L_BP19e!) * 4.0 * L_BP1a6!)) / (FX##(L_BP19e!) * 2.0)   '@35d81 DS:28e6,2a16
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35e35   '@35dcb DS:29f6
    L_BP176! = V_11d4!   '@35e24
L_35e35:
    V_11d4! = (-L_BP1a2! + RT_SQR##(RT_POT##((FX##(L_BP1a2!)), (2.0)) - FX##(L_BP19e!) * 4.0 * L_BP1a6!)) / (FX##(L_BP19e!) * 2.0)   '@35e35 DS:28e6,2a16
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_35ee9   '@35e7f DS:29f6
    L_BP176! = V_11d4!   '@35ed8
L_35ee9:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_3618d   '@35ee9
    IF NOT (ABS(L_BP58! - (FX##(V_1a94!) + V_1a9c!) / 2.0) < A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) / (RT_SIN##(FX##(L_BPc2!)) * 2.0)) THEN GOTO L_36188   '@35f18 DS:28e6
    L_BP1a6! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BP58!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BPc2!))), (2.0)) + (RT_TAN##(FX##(L_BPc2!)) * 400.0 * L_BP58! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)))   '@35f7d DS:28e6,2a42,2a4a
    V_11d4! = (-L_BP1a2! - RT_SQR##(RT_POT##((FX##(L_BP1a2!)), (2.0)) - FX##(L_BP19e!) * 4.0 * L_BP1a6!)) / (FX##(L_BP19e!) * 2.0)   '@3601b DS:28e6,2a16
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_360cf   '@36065 DS:29f6
    L_BP176! = V_11d4!   '@360be
L_360cf:
    V_11d4! = (-L_BP1a2! + RT_SQR##(RT_POT##((FX##(L_BP1a2!)), (2.0)) - FX##(L_BP19e!) * 4.0 * L_BP1a6!)) / (FX##(L_BP19e!) * 2.0)   '@360cf DS:28e6,2a16
    IF NOT ((V_11d4! < L_BP176! OR L_BP176! = -1000.0) AND V_11d4! > L_BP102!) THEN GOTO L_36183   '@36119 DS:29f6
    L_BP176! = V_11d4!   '@36172
L_36183:
L_36188:
L_3618d:
    L_BP1aa! = (FX##(L_BP176!) - L_BP58!) * RT_TAN##(FX##(L_BPc2!)) - 200.0   '@3618d DS:2a4e
    GOTO L_36497   '@361b6
L_361be:
    V_1a94! = L_BP58!   '@361be
    V_1a98! = -200.0   '@361ce DS:2a4e
    V_1a9c! = 200.0 / RT_TAN##(FX##(L_BPc2!)) + V_1a94!   '@361df DS:2a42
    V_1aa0! = 0.0   '@36204 DS:28ea
    L_BP1ae! = A_16ee!(0, 0)   '@36215
    FOR V_11ec! = 1.0 TO L_BP1ae!   '@36236 DS:28ee
    V_1aa4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@3623e
    V_1aa8! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@36268
    V_1aac! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@36293 DS:28ee
    V_1ab0! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@362c2 DS:28ee
    CALL S_14e79   '@362f2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1b0% = (RT_POT##((FX##(V_1aa4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1aa8!) - V_1ab0!), (2.0)) >= RT_POT##((FX##(V_1ab4!) - V_1aa4!), (2.0)) + RT_POT##((FX##(V_1ab8!) - V_1aa8!), (2.0)))   '@362fc DS:28e6
    IF NOT ((RT_POT##((FX##(V_1aa4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1aa8!) - V_1ab0!), (2.0)) >= RT_POT##((FX##(V_1ab4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1ab8!) - V_1ab0!), (2.0)) AND L_BP1b0%) <> 0) THEN GOTO L_36466   '@36381 DS:28e6
    IF NOT ((V_1ab4! < L_BP176! OR L_BP176! = -1000.0) AND V_1ab4! > L_BP102!) THEN GOTO L_36461   '@363e6 DS:29f6
    L_BP176! = V_1ab4!   '@3643f
    L_BP1aa! = V_1ab8!   '@36450
L_36461:
L_36466:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@36466 DS:28ee
L_36497:
    IF NOT (L_BP176! <> -1000.0) THEN GOTO L_365aa   '@36497 DS:29f6
    IF NOT (L_BP16a! = -1.0) THEN GOTO L_3650d   '@364b2 DS:29e2
    L_BP102! = L_BP176!   '@364cd
    L_BP106! = L_BP1aa!   '@364de
    L_BP16a! = 0.0   '@364ef DS:28ea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35c34   '@36500
L_3650d:
    L_BP24! = FX##(L_BP102!) + L_BP38!   '@3650d
    L_BP28! = FX##(L_BP106!) + L_BP3c!   '@36521
    L_BP2c! = FX##(L_BP176!) + L_BP38!   '@36535
    L_BP30! = FX##(L_BP1aa!) + L_BP3c!   '@36549
    GOSUB L_38c9a   '@3655d
    L_BP102! = L_BP176!   '@3656a
    L_BP106! = L_BP1aa!   '@3657b
    L_BP16a! = -1.0   '@3658c DS:29e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_35c34   '@3659d
L_365aa:
L_365b8:
    L_BP58! = FX##(L_BP58!) + L_BP19a!   '@365b9
L_365b9_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP19a! < 0.0) THEN GOTO L_365ec   '@365bf DS:28ea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP58! < L_BP196!) THEN GOTO L_35c0e   '@365d5
    GOTO L_36601   '@365e9
L_365ec:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP58! > L_BP196!) THEN GOTO L_35c0e   '@365ed
L_36601:
L_36606:
L_3660b:
    RETURN   '@3660b
L_3661a:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_11ec! > 1.0) THEN GOTO L_366a1   '@3661f DS:28ee
    L_BP1b4! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 0)   '@3663a DS:29e2
    L_BP1b8! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 1)   '@36669 DS:29e2
    GOTO L_36719   '@36699
L_366a1:
    L_BP1b4! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 0)   '@366a1
    L_BP1b8! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 1)   '@366da
L_36719:
    L_BP1bc! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@36719
    L_BP1c0! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@36743
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_367e9   '@3676e DS:28ee
    L_BP1c4! = A_16ee!(1, 0)   '@3679d
    L_BP1c8! = A_16ee!(1, 1)   '@367c0
    GOTO L_3684d   '@367e1
L_367e9:
    L_BP1c4! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@367e9 DS:28ee
    L_BP1c8! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@36818 DS:28ee
L_3684d:
    GOSUB L_36b2c   '@3684d
    L_BP24! = FX##(L_BP38!) + V_1ab4!   '@3685a
    L_BP28! = FX##(L_BP3c!) + V_1ab8!   '@3686e
    L_BP1b4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@36882
    L_BP1b8! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@368ac
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_36952   '@368d7 DS:28ee
    L_BP1bc! = A_16ee!(1, 0)   '@36906
    L_BP1c0! = A_16ee!(1, 1)   '@36929
    GOTO L_369b6   '@3694a
L_36952:
    L_BP1bc! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@36952 DS:28ee
    L_BP1c0! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@36981 DS:28ee
L_369b6:
    IF NOT (FX##(V_11ec!) + 2.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_36a84   '@369b6 DS:28e6
    L_BP1c4! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 0)   '@369e5
    L_BP1c8! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 1)   '@36a30
    GOTO L_36ae8   '@36a7c
L_36a84:
    L_BP1c4! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 0)   '@36a84 DS:28e6
    L_BP1c8! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 1)   '@36ab3 DS:28e6
L_36ae8:
    GOSUB L_36b2c   '@36ae8
    L_BP2c! = FX##(L_BP38!) + V_1ab4!   '@36af5
    L_BP30! = FX##(L_BP3c!) + V_1ab8!   '@36b09
    RETURN   '@36b1d
L_36b2c:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BP1c0! = L_BP1b8! AND L_BP1bc! > L_BP1b4!) THEN GOTO L_36bc2   '@36b31
    V_1a94! = L_BP1b4!   '@36b6f
    V_1a98! = FX##(L_BP1b8!) - L_BP16a!   '@36b80
    V_1a9c! = L_BP1bc!   '@36b96
    V_1aa0! = FX##(L_BP1c0!) - L_BP16a!   '@36ba7
L_36bc2:
    IF NOT (L_BP1c0! > L_BP1b8! AND L_BP1bc! >= L_BP1b4!) THEN GOTO L_36cd9   '@36bc2
    IF NOT (L_BP1bc! = L_BP1b4!) THEN GOTO L_36c39   '@36c00
    L_BP1cc! = FX##(V_0e04#) / 2.0#   '@36c1b DS:29a6
    GOTO L_36c68   '@36c31
L_36c39:
    L_BP1cc! = ATN((FX##(L_BP1c0!) - L_BP1b8!) / (FX##(L_BP1bc!) - L_BP1b4!))   '@36c39
L_36c68:
    V_1a94! = L_BP16a! / RT_SIN##(FX##(L_BP1cc!)) + L_BP1b4!   '@36c68
    V_1a98! = L_BP1b8!   '@36c8d
    V_1a9c! = L_BP16a! / RT_SIN##(FX##(L_BP1cc!)) + L_BP1bc!   '@36c9e
    V_1aa0! = L_BP1c0!   '@36cc3
L_36cd9:
    IF NOT (L_BP1c0! > L_BP1b8! AND L_BP1bc! < L_BP1b4!) THEN GOTO L_36db2   '@36cd9
    L_BP1cc! = ATN((FX##(L_BP1b4!) - L_BP1bc!) / (FX##(L_BP1c0!) - L_BP1b8!))   '@36d17
    V_1a94! = L_BP16a! / RT_COS##(FX##(L_BP1cc!)) + L_BP1b4!   '@36d41
    V_1a98! = L_BP1b8!   '@36d66
    V_1a9c! = L_BP16a! / RT_COS##(FX##(L_BP1cc!)) + L_BP1bc!   '@36d77
    V_1aa0! = L_BP1c0!   '@36d9c
L_36db2:
    IF NOT (L_BP1c0! = L_BP1b8! AND L_BP1bc! < L_BP1b4!) THEN GOTO L_36e43   '@36db2
    V_1a94! = L_BP1b4!   '@36df0
    V_1a98! = FX##(L_BP1b8!) + L_BP16a!   '@36e01
    V_1a9c! = L_BP1bc!   '@36e17
    V_1aa0! = FX##(L_BP1c0!) + L_BP16a!   '@36e28
L_36e43:
    IF NOT (L_BP1c0! < L_BP1b8! AND L_BP1bc! <= L_BP1b4!) THEN GOTO L_36f22   '@36e43
    L_BP1cc! = ATN((FX##(L_BP1b4!) - L_BP1bc!) / (FX##(L_BP1b8!) - L_BP1c0!))   '@36e81
    V_1a94! = L_BP1b4! - L_BP16a! / RT_COS##(FX##(L_BP1cc!))   '@36eab
    V_1a98! = L_BP1b8!   '@36ed3
    V_1a9c! = L_BP1bc! - L_BP16a! / RT_COS##(FX##(L_BP1cc!))   '@36ee4
    V_1aa0! = L_BP1c0!   '@36f0c
L_36f22:
    IF NOT (L_BP1c0! < L_BP1b8! AND L_BP1bc! > L_BP1b4!) THEN GOTO L_37001   '@36f22
    L_BP1cc! = ATN((FX##(L_BP1bc!) - L_BP1b4!) / (FX##(L_BP1b8!) - L_BP1c0!))   '@36f60
    V_1a94! = L_BP1b4! - L_BP16a! / RT_COS##(FX##(L_BP1cc!))   '@36f8a
    V_1a98! = L_BP1b8!   '@36fb2
    V_1a9c! = L_BP1bc! - L_BP16a! / RT_COS##(FX##(L_BP1cc!))   '@36fc3
    V_1aa0! = L_BP1c0!   '@36feb
L_37001:
    IF NOT (L_BP1c8! = L_BP1c0! AND L_BP1c4! > L_BP1bc!) THEN GOTO L_37092   '@37001
    V_1aa4! = L_BP1bc!   '@3703f
    V_1aa8! = FX##(L_BP1c0!) - L_BP16a!   '@37050
    V_1aac! = L_BP1c4!   '@37066
    V_1ab0! = FX##(L_BP1c8!) - L_BP16a!   '@37077
L_37092:
    IF NOT (L_BP1c8! > L_BP1c0! AND L_BP1c4! >= L_BP1bc!) THEN GOTO L_371a9   '@37092
    IF NOT (L_BP1c4! = L_BP1bc!) THEN GOTO L_37109   '@370d0
    L_BP1d0! = FX##(V_0e04#) / 2.0#   '@370eb DS:29a6
    GOTO L_37138   '@37101
L_37109:
    L_BP1d0! = ATN((FX##(L_BP1c8!) - L_BP1c0!) / (FX##(L_BP1c4!) - L_BP1bc!))   '@37109
L_37138:
    V_1aa4! = L_BP16a! / RT_SIN##(FX##(L_BP1d0!)) + L_BP1bc!   '@37138
    V_1aa8! = L_BP1c0!   '@3715d
    V_1aac! = L_BP16a! / RT_SIN##(FX##(L_BP1d0!)) + L_BP1c4!   '@3716e
    V_1ab0! = L_BP1c8!   '@37193
L_371a9:
    IF NOT (L_BP1c8! > L_BP1c0! AND L_BP1c4! < L_BP1bc!) THEN GOTO L_37282   '@371a9
    L_BP1d0! = ATN((FX##(L_BP1bc!) - L_BP1c4!) / (FX##(L_BP1c8!) - L_BP1c0!))   '@371e7
    V_1aa4! = L_BP16a! / RT_COS##(FX##(L_BP1d0!)) + L_BP1bc!   '@37211
    V_1aa8! = L_BP1c0!   '@37236
    V_1aac! = L_BP16a! / RT_COS##(FX##(L_BP1d0!)) + L_BP1c4!   '@37247
    V_1ab0! = L_BP1c8!   '@3726c
L_37282:
    IF NOT (L_BP1c8! = L_BP1c0! AND L_BP1c4! < L_BP1bc!) THEN GOTO L_37313   '@37282
    V_1aa4! = L_BP1bc!   '@372c0
    V_1aa8! = FX##(L_BP1c0!) + L_BP16a!   '@372d1
    V_1aac! = L_BP1c4!   '@372e7
    V_1ab0! = FX##(L_BP1c8!) + L_BP16a!   '@372f8
L_37313:
    IF NOT (L_BP1c8! < L_BP1c0! AND L_BP1c4! <= L_BP1bc!) THEN GOTO L_373f2   '@37313
    L_BP1d0! = ATN((FX##(L_BP1bc!) - L_BP1c4!) / (FX##(L_BP1c0!) - L_BP1c8!))   '@37351
    V_1aa4! = L_BP1bc! - L_BP16a! / RT_COS##(FX##(L_BP1d0!))   '@3737b
    V_1aa8! = L_BP1c0!   '@373a3
    V_1aac! = L_BP1c4! - L_BP16a! / RT_COS##(FX##(L_BP1d0!))   '@373b4
    V_1ab0! = L_BP1c8!   '@373dc
L_373f2:
    IF NOT (L_BP1c8! < L_BP1c0! AND L_BP1c4! > L_BP1bc!) THEN GOTO L_374d1   '@373f2
    L_BP1d0! = ATN((FX##(L_BP1c4!) - L_BP1bc!) / (FX##(L_BP1c0!) - L_BP1c8!))   '@37430
    V_1aa4! = L_BP1bc! - L_BP16a! / RT_COS##(FX##(L_BP1d0!))   '@3745a
    V_1aa8! = L_BP1c0!   '@37482
    V_1aac! = L_BP1c4! - L_BP16a! / RT_COS##(FX##(L_BP1d0!))   '@37493
    V_1ab0! = L_BP1c8!   '@374bb
L_374d1:
    CALL S_14e79   '@374d1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RETURN   '@374db
L_374ea:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    GOSUB L_38455   '@374ef
    L_BP24! = L_BP102!   '@374fc
    L_BP28! = L_BP106!   '@3750c
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP102!   '@3751c DS:28e6
    L_BP30! = L_BP106! - RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@37566 DS:28e6
    GOSUB L_38c9a   '@375b3
    L_BP24! = L_BP2c!   '@375c0
    L_BP28! = L_BP30!   '@375cf
    L_BP2c! = L_BP24! - RT_COS##(FX##(L_BPc2!)) * L_BP1d4!   '@375de
    L_BP30! = L_BP28! - RT_SIN##(FX##(L_BPc2!)) * L_BP1d4!   '@37601
    GOSUB L_38c9a   '@37624
    IF NOT (L_BP1d8! > 0.0) THEN GOTO L_37755   '@37631 DS:28ea
    L_BP24! = L_BP2c!   '@3764c
    L_BP28! = L_BP30!   '@3765b
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * 30.0 + L_BP24!   '@3766a DS:29fa
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * 30.0   '@3768a DS:29fa
    GOSUB L_38c9a   '@376ad
    L_BP24! = L_BP2c! - RT_COS##(FX##(L_BPc2!)) * L_BP1d8!   '@376ba
    L_BP28! = L_BP30! - RT_SIN##(FX##(L_BPc2!)) * L_BP1d8!   '@376dd
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * 30.0   '@37700 DS:29fa
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * 30.0 + L_BP28!   '@37723 DS:29fa
    GOSUB L_38c9a   '@37743
L_37755:
    L_BP24! = L_BP2c!   '@37755
    L_BP28! = L_BP30!   '@37764
    L_BP2c! = L_BP24! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1d4! - L_BP1d8!) * RT_COS##(FX##(L_BPc2!))   '@37773
    L_BP30! = L_BP28! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1d4! - L_BP1d8!) * RT_SIN##(FX##(L_BPc2!))   '@377c8
    GOSUB L_38c9a   '@3781d
    L_BP24! = L_BP2c!   '@3782a
    L_BP28! = L_BP30!   '@37839
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)   '@37848
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) + L_BP28!   '@3788f
    GOSUB L_38c9a   '@378d3
    L_BP24! = L_BP2c!   '@378e0
    L_BP28! = L_BP30!   '@378ef
    L_BP2c! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1dc! - L_BP1e0!) * RT_COS##(FX##(L_BPc2!)) + L_BP24!   '@378fe
    L_BP30! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1dc! - L_BP1e0!) * RT_SIN##(FX##(L_BPc2!)) + L_BP28!   '@37950
    GOSUB L_38c9a   '@379a2
    IF NOT (L_BP1e0! > 0.0) THEN GOTO L_37acd   '@379af DS:28ea
    L_BP24! = L_BP2c!   '@379ca
    L_BP28! = L_BP30!   '@379d9
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * 30.0   '@379e8 DS:29fa
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * 30.0 + L_BP28!   '@37a0b DS:29fa
    GOSUB L_38c9a   '@37a2b
    L_BP24! = RT_COS##(FX##(L_BPc2!)) * L_BP1e0! + L_BP2c!   '@37a38
    L_BP28! = RT_SIN##(FX##(L_BPc2!)) * L_BP1e0! + L_BP30!   '@37a58
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * 30.0 + L_BP24!   '@37a78 DS:29fa
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * 30.0   '@37a98 DS:29fa
    GOSUB L_38c9a   '@37abb
L_37acd:
    L_BP24! = L_BP2c!   '@37acd
    L_BP28! = L_BP30!   '@37adc
    L_BP2c! = RT_COS##(FX##(L_BPc2!)) * L_BP1dc! + L_BP24!   '@37aeb
    L_BP30! = RT_SIN##(FX##(L_BPc2!)) * L_BP1dc! + L_BP28!   '@37b0b
    GOSUB L_38c9a   '@37b2b
    L_BP24! = L_BP2c!   '@37b38
    L_BP28! = L_BP30!   '@37b47
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP24!   '@37b56 DS:28e6
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@37b9f DS:28e6
    GOSUB L_38c9a   '@37beb
    L_BP1e4! = RT_COS##(FX##(L_BPc2!)) * 0.4000000059604644775390625##   '@37bf8 DS:2a32
    V_11dc! = RT_SIN##(FX##(L_BPc2!)) * 0.4000000059604644775390625##   '@37c15 DS:2a32
    L_BP24! = FX##(L_BP102!) - L_BP1e4!   '@37c32
    L_BP28! = FX##(L_BP106!) - V_11dc!   '@37c47
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 - L_BP1e4! - V_11dc! + L_BP102!   '@37c5c DS:28e6
    L_BP30! = L_BP106! - RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 - V_11dc! - L_BP1e4!   '@37cb0 DS:28e6
    GOSUB L_38c9a   '@37d07
    L_BP24! = L_BP2c!   '@37d14
    L_BP28! = L_BP30!   '@37d23
    L_BP2c! = L_BP24! - RT_COS##(FX##(L_BPc2!)) * L_BP1d4!   '@37d32
    L_BP30! = L_BP28! - RT_SIN##(FX##(L_BPc2!)) * L_BP1d4!   '@37d55
    GOSUB L_38c9a   '@37d78
    IF NOT (L_BP1d8! > 0.0) THEN GOTO L_37ec3   '@37d85 DS:28ea
    L_BP24! = L_BP2c!   '@37da0
    L_BP28! = L_BP30!   '@37daf
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * 30.0 + L_BP24!   '@37dbe DS:29fa
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * 30.0   '@37dde DS:29fa
    GOSUB L_38c9a   '@37e01
    L_BP24! = L_BP2c! - RT_COS##(FX##(L_BPc2!)) * L_BP1d8! + FX##(L_BP1e4!) * 2.0   '@37e0e DS:28e6
    L_BP28! = L_BP30! - RT_SIN##(FX##(L_BPc2!)) * L_BP1d8! + 2.0 * FX##(V_11dc!)   '@37e3e DS:28e6
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * 30.0   '@37e6e DS:29fa
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * 30.0 + L_BP28!   '@37e91 DS:29fa
    GOSUB L_38c9a   '@37eb1
L_37ec3:
    L_BP24! = L_BP2c!   '@37ec3
    L_BP28! = L_BP30!   '@37ed2
    L_BP2c! = L_BP24! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1d4! - L_BP1d8!) * RT_COS##(FX##(L_BPc2!)) + FX##(-(L_BP1d8! = 0.0)) * 2.0 * L_BP1e4!   '@37ee1 DS:28e6,28ea
    L_BP30! = L_BP28! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1d4! - L_BP1d8!) * RT_SIN##(FX##(L_BPc2!)) + FX##(-(L_BP1d8! = 0.0)) * 2.0 * V_11dc!   '@37f61 DS:28e6,28ea
    GOSUB L_38c9a   '@37fe1
    L_BP24! = L_BP2c!   '@37fee
    L_BP28! = L_BP30!   '@37ffd
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) + 2.0 * FX##(V_11dc!)   '@3800c DS:28e6
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) - FX##(L_BP1e4!) * 2.0 + L_BP28!   '@38060 DS:28e6
    GOSUB L_38c9a   '@380b1
    L_BP24! = L_BP2c!   '@380be
    L_BP28! = L_BP30!   '@380cd
    L_BP2c! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1dc! - L_BP1e0!) * RT_COS##(FX##(L_BPc2!)) + L_BP24!   '@380dc
    L_BP30! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP1dc! - L_BP1e0!) * RT_SIN##(FX##(L_BPc2!)) + L_BP28!   '@3812e
    GOSUB L_38c9a   '@38180
    IF NOT (L_BP1e0! > 0.0) THEN GOTO L_382c5   '@3818d DS:28ea
    L_BP24! = L_BP2c!   '@381a8
    L_BP28! = L_BP30!   '@381b7
    L_BP2c! = L_BP24! - RT_SIN##(FX##(L_BPc2!)) * 30.0   '@381c6 DS:29fa
    L_BP30! = RT_COS##(FX##(L_BPc2!)) * 30.0 + L_BP28!   '@381e9 DS:29fa
    GOSUB L_38c9a   '@38209
    L_BP24! = RT_COS##(FX##(L_BPc2!)) * L_BP1e0! - FX##(L_BP1e4!) * 2.0 + L_BP2c!   '@38216 DS:28e6
    L_BP28! = RT_SIN##(FX##(L_BPc2!)) * L_BP1e0! - 2.0 * FX##(V_11dc!) + L_BP30!   '@38243 DS:28e6
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * 30.0 + L_BP24!   '@38270 DS:29fa
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * 30.0   '@38290 DS:29fa
    GOSUB L_38c9a   '@382b3
L_382c5:
    L_BP24! = L_BP2c!   '@382c5
    L_BP28! = L_BP30!   '@382d4
    L_BP2c! = RT_COS##(FX##(L_BPc2!)) * L_BP1dc! - FX##(-(L_BP1e0! = 0.0)) * 2.0 * L_BP1e4! + L_BP24!   '@382e3 DS:28e6,28ea
    L_BP30! = RT_SIN##(FX##(L_BPc2!)) * L_BP1dc! - FX##(-(L_BP1e0! = 0.0)) * 2.0 * V_11dc! + L_BP28!   '@3832e DS:28e6,28ea
    GOSUB L_38c9a   '@38379
    L_BP24! = L_BP2c!   '@38386
    L_BP28! = L_BP30!   '@38395
    L_BP2c! = RT_SIN##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP24!   '@383a4 DS:28e6
    L_BP30! = L_BP28! - RT_COS##(FX##(L_BPc2!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@383ed DS:28e6
    GOSUB L_38c9a   '@38439
    RETURN   '@38446
L_38455:   ' sub-rotina (alvo de GOSUB)
    V_11d4! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BPc2!)) + L_BP102!   '@3845a DS:28e6,29de
    V_11d8! = L_BP106! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BPc2!))   '@384ad DS:28e6,29de
    GOSUB L_38619   '@38503
    L_BP1d4! = V_11c8!   '@38510
    L_BP1d8! = V_11c4!   '@38521
    V_11d4! = L_BP102! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BPc2!))   '@38532 DS:28e6,29de
    V_11d8! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BPc2!)) + L_BP106!   '@38588 DS:28e6,29de
    GOSUB L_38619   '@385db
    L_BP1dc! = V_11c8!   '@385e8
    L_BP1e0! = V_11c4!   '@385f9
    RETURN   '@3860a
L_38619:   ' sub-rotina (alvo de GOSUB)
    V_11c8! = 0.0   '@3861e DS:28ea
    V_11c4! = 0.0   '@3862f DS:28ea
    L_BP1e8! = A_0f30%(0, 0)   '@38640
    FOR V_11b8! = 1.0 TO L_BP1e8!   '@38665 DS:28ee
    IF NOT (A_0f5e!(RT_CINT%(FX##(V_11b8!)), 1) = 0.0) THEN GOTO L_38c5f   '@3866c DS:28ea
    L_BP1e4! = A_0f5e!(RT_CINT%(FX##(V_11b8!)), 0)   '@386a1
    V_11a4! = 0.0   '@386cb DS:28ea
    L_BP1ec! = A_0f30%(RT_CINT%(FX##(L_BP1e4!)), 0) - 1   '@386dc
    FOR V_11c0! = 1.0 TO L_BP1ec!   '@3870c DS:28ee
    V_1a94! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e4!)), RT_CINT%(FX##(V_11c0!))), 0)) * 100.0   '@38714 DS:29b6
    V_1a98! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e4!)), RT_CINT%(FX##(V_11c0!))), 1)) * 100.0   '@3875d DS:29b6
    V_1a9c! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e4!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 0)) * 100.0   '@387a7 DS:28ee,29b6
    V_1aa0! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e4!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 1)) * 100.0   '@387f5 DS:28ee,29b6
    IF NOT (NOT (V_1a9c! > V_11d4! AND V_1a94! > V_11d4!)) THEN GOTO L_38b0a   '@38844
    IF NOT (NOT (V_1aa0! > V_11d8! AND V_1a98! > V_11d8! OR V_1aa0! < V_11d8! AND V_1a98! < V_11d8!)) THEN GOTO L_38b05   '@38884
    IF NOT (V_1a98! = V_1aa0!) THEN GOTO L_389b9   '@388fa
    IF NOT ((V_1a94! >= V_11d4! AND V_1a9c! <= 2.0 OR V_1a9c! >= V_11d4! AND V_1a94! <= V_11d4!) AND V_11d8! = V_1a98!) THEN GOTO L_389b1   '@38915 DS:28e6
    GOTO L_38b36   '@389a4
L_389b1:
    GOTO L_38b00   '@389b1
L_389b9:
    IF NOT ((V_11d8! < V_1a98! AND V_11d8! >= V_1aa0! OR V_11d8! <= V_1aa0! AND V_11d8! > V_1a98!) AND (V_1a9c! <= V_11d4! AND V_1a94! <= V_11d4!)) THEN GOTO L_38a81   '@389b9
    V_11a4! = FX##(V_11a4!) + 1.0   '@38a63 DS:28ee
    GOTO L_38afb   '@38a79
L_38a81:
    IF NOT (V_1a94! <> V_1a9c!) THEN GOTO L_38af6   '@38a81
    IF NOT ((FX##(V_11d8!) - V_1a98!) * (FX##(V_1a9c!) - V_1a94!) / (FX##(V_1aa0!) - V_1a98!) + V_1a94! <= FX##(V_11d4!)) THEN GOTO L_38af1   '@38a9c
    V_11a4! = FX##(V_11a4!) + 1.0   '@38adb DS:28ee
L_38af1:
L_38af6:
L_38afb:
L_38b00:
L_38b05:
L_38b0a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@38b0a DS:28ee
L_38b36:
    IF NOT (A_0f30%(RT_CINT%(FX##(L_BP1e4!)), 0) - 1 > V_11c0! OR FX##(V_11a4!) / 2.0 <> RT_CLNG&(FX##(V_11a4!)) \ 2&) THEN GOTO L_38c5a   '@38b36 DS:28e6
    V_11c8! = A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2) - (FX##(A_1200!(1, 14, 3)) + A_0f5e!(RT_CINT%(FX##(V_11b8!)), 3))   '@38bb2
    V_11c4! = A_115e!(RT_CINT%(FX##(V_11b8!)), 0)   '@38c23
    GOTO L_38c8b   '@38c4d
L_38c5a:
L_38c5f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@38c5f DS:28ee
L_38c8b:
    RETURN   '@38c8b
L_38c9a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    PRINT #3, V_1a5c$; " "; LTRIM$(STR$(RT_SNG!(INT((-V_1528! + FX##(V_19e4!) + (FX##(L_BP24!) - V_1abc!) / V_153c% * 10.0) / V_1a8c!)))); ","; LTRIM$(STR$(RT_SNG!(INT((-V_152c! + FX##(V_19e8!) + (FX##(L_BP28!) - V_1ac0!) / V_153c% * 10.0) / V_1a8c!)))); " "   '@38c9f DS:28d0,2986,2a52
    PRINT #3, V_1a58$; " "; LTRIM$(STR$(RT_SNG!(INT((-V_1528! + FX##(V_19e4!) + (FX##(L_BP2c!) - V_1abc!) / V_153c% * 10.0) / V_1a8c!)))); ","; LTRIM$(STR$(RT_SNG!(INT((-V_152c! + FX##(V_19e8!) + (FX##(L_BP30!) - V_1ac0!) / V_153c% * 10.0) / V_1a8c!)))); " "   '@38d71 DS:28d0,2986,2a52
    RETURN   '@38e43
L_38e52:   ' sub-rotina (alvo de GOSUB); entrada vinda de 030182_FUN_3000_0182
    PRINT #3, V_1a5c$; " "; LTRIM$(STR$(RT_SNG!(INT((-V_1528! + FX##(V_19e4!) + (FX##(L_BP50!) - V_1abc!) / V_153c% * 10.0) / V_1a8c!)))); ","; LTRIM$(STR$(RT_SNG!(INT((-V_152c! + FX##(V_19e8!) + (FX##(L_BP54!) - V_1ac0!) / V_153c% * 10.0) / V_1a8c!)))); " "   '@38e57 DS:28d0,2986,2a52
    V_0e0c$ = RT_MID$((V_1a60$), (1), (INSTR(V_1a60$, "[1") - 1)) + LTRIM$(STR$(RT_CINT%(L_BP4c! / (FX##(V_153c%) * 7.0 * V_1a8c!))))   '@38f29 DS:2a06,2a58
    IF NOT (INSTR(V_1a60$, "[LARG]") > 0) THEN GOTO L_3904f   '@38f85 DS:2a5e
    V_0e0c$ = RT_MID$((V_1a60$), (1), (INSTR(V_1a60$, "[1") - 1)) + LTRIM$(STR$(RT_SNG!(L_BP4c! / (FX##(V_153c%) * 10.0) * 0.60000002384185791015625##)))   '@38f9e DS:2986,2a58,2a68
    V_0e0c$ = V_0e0c$ + "," + LTRIM$(STR$(RT_SNG!(L_BP4c! / (FX##(V_153c%) * 10.0))))   '@38ffe DS:2986,2a52
L_3904f:
    IF NOT (INSTR(V_1a60$, "*") > 0) THEN GOTO L_390e8   '@3904f DS:2a6c
    V_0e0c$ = RT_MID$((V_1a60$), (1), (INSTR(V_1a60$, "[1") - 1)) + LTRIM$(STR$(RT_CINT%(L_BP4c! / (FX##(V_153c%) * V_1a8c!) * VAL(RT_MID2$((V_1a60$), (INSTR(V_1a60$, "*") + 1))))))   '@39068 DS:2a58,2a6c
L_390e8:
    L_BP1ee% = INSTR(V_1a60$, "]")   '@390e8 DS:2a72
    IF NOT (LEN(V_1a60$) > L_BP1ee%) THEN GOTO L_39149   '@39104
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_1a60$), (INSTR(V_1a60$, "]") + 1))   '@39112 DS:2a72
L_39149:
    PRINT #3, V_0e0c$   '@39149
    IF NOT (RT_INSTR%((1), (V_1a6c$), ("@")) = 0) THEN GOTO L_39346   '@39160 DS:2a78
    L_BP38! = RT_CINT%(RT_COS##(FX##(L_BP44!) * V_0e04# / 180.0#) * 100.0#)   '@3917d DS:29ba,2a7e
    L_BP3c! = RT_CINT%(RT_SIN##(FX##(L_BP44!) * V_0e04# / 180.0#) * 100.0#)   '@391ac DS:29ba,2a7e
    V_0e0c$ = RT_MID$((V_1a6c$), (1), (INSTR(V_1a6c$, "[3") - 1)) + LTRIM$(STR$(L_BP38!))   '@391db DS:2a86
    L_BP1f0% = INSTR(V_1a6c$, "3]")   '@3921e DS:2a8c
    IF NOT (LEN(V_1a6c$) > L_BP1f0%) THEN GOTO L_39281   '@3923a
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_1a6c$), (INSTR(V_1a6c$, "3]") + 2))   '@39248 DS:2a8c
L_39281:
    V_0e0c$ = RT_MID$((V_0e0c$), (1), (INSTR(V_0e0c$, "[4") - 1)) + LTRIM$(STR$(L_BP3c!))   '@39281 DS:2a92
    L_BP1f2% = INSTR(V_1a6c$, "4]")   '@392c4 DS:2a98
    IF NOT (LEN(V_1a6c$) > L_BP1f2%) THEN GOTO L_39327   '@392e0
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_1a6c$), (INSTR(V_1a6c$, "4]") + 2))   '@392ee DS:2a98
L_39327:
    PRINT #3, V_0e0c$   '@39327
    GOTO L_393f8   '@3933e
L_39346:
    V_0e0c$ = "@" + LTRIM$(RTRIM$(STR$(L_BP44!)))   '@39346 DS:2a78
    IF NOT (RT_INSTR%((1), (V_1a6c$), (V_0e0c$)) > 0) THEN GOTO L_393f3   '@39376
    V_0e0c$ = RT_MID$((V_1a6c$), (1), (RT_INSTR%((1), (V_1a6c$), ("@")) - 1)) + LTRIM$(STR$(L_BP44!))   '@39393 DS:2a78
    PRINT #3, V_0e0c$   '@393d7
L_393f3:
L_393f8:
    V_0e0c$ = RT_MID$((V_19ec$), (1), (INSTR(V_19ec$, "[2]") - 1))   '@393f8 DS:2a9e
    L_BP1f4% = INSTR(V_19ec$, "]")   '@39423 DS:2a72
    IF NOT (LEN(V_19ec$) > L_BP1f4%) THEN GOTO L_39484   '@3943f
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_19ec$), (INSTR(V_19ec$, "]") + 1))   '@3944d DS:2a72
L_39484:
    V_0e0c$ = V_0e0c$ + L_BP0e$ + CHR$(RT_CINT%(FX##(V_19f0!))) + " "   '@39484 DS:28d0
    PRINT #3, V_0e0c$   '@394c1
    RETURN   '@394d8
L_394e7:   ' sub-rotina (alvo de GOSUB)
    IF NOT (RT_INSTR%((1), (V_19f4$), ("[X]")) = 0) THEN GOTO L_395f7   '@394ec DS:2aa6
    PRINT #3, V_1a5c$; " "; LTRIM$(STR$(RT_SNG!(INT((-V_1528! + FX##(V_19e4!) + (FX##(L_BP15a!) - V_1abc!) / V_153c% * 10.0) / V_1a8c!)))); ","; LTRIM$(STR$(RT_SNG!(INT((-V_152c! + FX##(V_19e8!) + (FX##(L_BP15e!) - V_1ac0!) / V_153c% * 10.0) / V_1a8c!)))); " "   '@39509 DS:28d0,2986,2a52
    V_0e0c$ = V_19f4$   '@395dd
    GOTO L_397be   '@395ef
L_395f7:
    V_0e0c$ = RT_MID$((V_19f4$), (1), (INSTR(V_19f4$, "[X") - 1)) + LTRIM$(STR$(RT_SNG!(INT((-V_1528! + FX##(V_19e4!) + (FX##(L_BP15a!) - V_1abc!) / V_153c% * 10.0) / V_1a8c!))))   '@395f7 DS:2986,2aae
    L_BP1f6% = INSTR(V_19f4$, "X]") + 1   '@39674 DS:2ab4
    IF NOT (LEN(V_19f4$) > L_BP1f6%) THEN GOTO L_396d8   '@39691
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_19f4$), (INSTR(V_19f4$, "X]") + 2))   '@3969f DS:2ab4
L_396d8:
    V_0e0c$ = RT_MID$((V_0e0c$), (1), (INSTR(V_0e0c$, "[Y") - 1)) + LTRIM$(STR$(RT_SNG!(INT((-V_152c! + FX##(V_19e8!) + (FX##(L_BP15e!) - V_1ac0!) / V_153c% * 10.0) / V_1a8c!))))   '@396d8 DS:2986,2aba
    L_BP1f8% = INSTR(V_19f4$, "Y]") + 1   '@39755 DS:2ac0
    IF NOT (LEN(V_19f4$) > L_BP1f8%) THEN GOTO L_397b9   '@39772
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_19f4$), (INSTR(V_19f4$, "Y]") + 2))   '@39780 DS:2ac0
L_397b9:
L_397be:
    V_0e0c$ = RT_MID$((V_0e0c$), (1), (INSTR(V_0e0c$, "[RAIO") - 1)) + LTRIM$(STR$(RT_CINT%(10.0 / (FX##(V_153c%) * V_1a8c!) * L_BP162!)))   '@397be DS:2986,2ac6
    L_BP1fa% = INSTR(V_19f4$, "RAIO]") + 4   '@3981b DS:2ad0
    IF NOT (LEN(V_19f4$) > L_BP1fa%) THEN GOTO L_39881   '@3983a
    V_0e0c$ = V_0e0c$ + RT_MID2$((V_19f4$), (INSTR(V_19f4$, "RAIO]") + 5))   '@39848 DS:2ad0
L_39881:
    PRINT #3, V_0e0c$   '@39881
    RETURN   '@39898
L_398a7:   ' entrada vinda de 030182_FUN_3000_0182
    ' @398a7 libera strings locais (L_BP0e)
    ' END SUB   '@398b0
END SUB

SUB S_4016e   ' entrada de SUB/FUNCTION (B$ENRA, locais 496 bytes) (0x4016e)
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
    DIM L_BP46$
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP62!
    DIM L_BP66!
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
    DIM L_BPaa$
    DIM L_BPae!
    DIM L_BPb2!
    DIM L_BPb6!
    DIM L_BPba!
    DIM L_BPbe!
    DIM L_BPc2$
    DIM L_BPc4%
    DIM L_BPc8!
    DIM L_BPca%
    DIM L_BPce!
    DIM L_BPd2!
    DIM L_BPd6!
    DIM L_BPd8%
    DIM L_BPda%
    DIM L_BPde!
    DIM L_BPe2!
    DIM L_BPe4%
    DIM L_BPe8!
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf8!
    DIM L_BPfc!
    ' ---- FUN_4000_016e @0x4016e  (04016e_FUN_4000_016e.lift.txt; evidence_id (assembly): ev_2dfbe2be205e3f55093d562940f8d4a0c50aa9e6234a12d4aee17badee5f4e1d)
    L_BPaa$ = "A"   '@40194 DS:2ae0
    IF RT_DISP%(V_0e4a$ + V_0e18$ + ".DXF") THEN OPEN RT_ARQ$(V_0e4a$ + V_0e18$ + ".DXF") FOR APPEND AS #2 ELSE OPEN RT_ARQ$(V_0e4a$ + V_0e18$ + ".DXF") FOR OUTPUT AS #2   '@401a7 DS:2ae6,2aec
    PRINT #2, 0   '@401d5
    PRINT #2, "SECTION"   '@401eb DS:2af4
    PRINT #2, 2   '@40202
    PRINT #2, "ENTITIES"   '@40219 DS:2b00
    L_BPae! = A_1692!(0, 0)   '@40230
    FOR V_11ec! = 1.0 TO L_BPae!   '@40251 DS:2b0c
    L_BP46$ = "EST-LAJES"   '@40258 DS:2b10
    L_BP72! = A_1692!(RT_CINT%(FX##(V_11ec!)), 0)   '@4026a
    L_BP76! = A_1692!(RT_CINT%(FX##(V_11ec!)), 1)   '@40293
    L_BP7a! = A_1692!(RT_CINT%(FX##(V_11ec!)), 2)   '@402bd
    L_BP7e! = A_1692!(RT_CINT%(FX##(V_11ec!)), 3)   '@402e4
    GOSUB L_48212   '@4030e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@4031b DS:2b0c
    L_BPb2! = A_15da!(0, 0)   '@40347
    FOR V_11b8! = 1.0 TO L_BPb2!   '@40368 DS:2b0c
    L_BP46$ = "EST-PILAR"   '@40370 DS:2b1e
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@40382
    IF NOT (V_11bc! > 0.0) THEN GOTO L_40418   '@403ad DS:2b2c
    V_11ec! = -V_11b8!   '@403c8
    CALL S_22bb6   '@403dc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@403e6
    L_BP12! = V_11d8!   '@403f6
    GOSUB L_43e39   '@40406
L_40418:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@40418 DS:2b0c
    L_BPb6! = A_1664!(0, 0)   '@40444
    FOR V_11ec! = 1.0 TO L_BPb6!   '@40465 DS:2b0c
    L_BP46$ = "EST-VIGAS"   '@4046c DS:2b30
    L_BP72! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@4047e
    L_BP76! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@404a7
    L_BP7a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@404d1
    L_BP7e! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@404f8
    GOSUB L_48212   '@40522
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@4052f DS:2b0c
    IF NOT (V_1556$ = "S") THEN GOTO L_408c2   '@4055b DS:2b3e
    L_BP46$ = "EST-LAJES-TEXT"   '@40572 DS:2b44
    L_BPba! = 0.0   '@40584 DS:2b2c
    L_BPbe! = A_17a6%(0, 0)   '@40595
    FOR V_11b8! = 1.0 TO L_BPbe!   '@405ba DS:2b0c
    L_BP96! = 18.0   '@405c2 DS:2b56
    L_BPc2$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@405d3
    L_BPc4% = A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)   '@4060c
    L_BP8e! = -(LEN(L_BPc2$) * 9 - L_BPc4%)   '@40639
    L_BP92! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)   '@40655
    GOSUB L_48781   '@40684
    IF NOT (V_155a$ = "S") THEN GOTO L_40891   '@40691 DS:2b3e
    L_BPc8! = 1.0   '@406a8 DS:2b0c
    V_11c0! = 0.0   '@406b9 DS:2b2c
L_406d0:
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BPc8!)), 1) = 2.0) THEN GOTO L_40723   '@406d0 DS:2b5a
    V_11c0! = FX##(V_11c0!) + 1.0   '@40705 DS:2b0c
    GOTO L_4086e   '@4071b
L_40723:
    IF NOT (FX##(L_BPc8!) - V_11c0! = FX##(V_11b8!)) THEN GOTO L_40869   '@40723
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BPc8!)), 1) = 0.0) THEN GOTO L_4085c   '@40743 DS:2b2c
    L_BP96! = 14.0   '@40778 DS:2b5e
    L_BPc2$ = "h=" + LTRIM$(STR$(A_115e!(RT_CINT%(FX##(L_BPc8!)), 0)))   '@40789 DS:2b62
    L_BPca% = A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)   '@407cf
    L_BP8e! = -(LEN(L_BPc2$) * 7 - L_BPca%)   '@407fc
    L_BP92! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) - 25   '@40818
    GOSUB L_48781   '@4084a
L_4085c:
    GOTO L_4088c   '@4085c
L_40869:
L_4086e:
    L_BPc8! = FX##(L_BPc8!) + 1.0   '@4086e DS:2b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_406d0   '@40884
L_4088c:
L_40891:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@40891 DS:2b0c
L_408c2:
    IF NOT (V_1566$ = "S") THEN GOTO L_4152a   '@408c2 DS:2b3e
    L_BP46$ = "EST-PILAR-TEXT"   '@408d9 DS:2b68
    L_BPce! = A_15da!(0, 0)   '@408eb
    FOR V_11b8! = 1.0 TO L_BPce!   '@4090c DS:2b0c
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@40914
    IF NOT (V_11bc! > 0.0) THEN GOTO L_414f9   '@4093f DS:2b2c
    L_BP96! = 20.0   '@4095a DS:2b7a
    L_BPba! = 0.0   '@4096b DS:2b2c
    L_BP8e! = A_174a%(RT_CINT%(FX##(V_11b8!)), 0)   '@4097c
    L_BP92! = A_174a%(RT_CINT%(FX##(V_11b8!)), 1)   '@409aa
    L_BPc2$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@409d9
    GOSUB L_48781   '@40a0c
    IF NOT (V_156a$ = "S") THEN GOTO L_414f4   '@40a19 DS:2b3e
    L_BP96! = 10.0   '@40a30 DS:2b7e
    V_11ec! = -V_11b8!   '@40a41
    CALL S_22bb6   '@40a55
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@40a5f
    L_BP12! = V_11d8!   '@40a6f
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_40c5e   '@40a7f
    L_BPba! = 0.0   '@40aae DS:2b2c
    L_BP8e! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP0e!   '@40abf DS:2b5a
    L_BP92! = L_BP12!   '@40afb
    L_BPc2$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * 10) / 10.0#)))   '@40b0b DS:2b82
    GOSUB L_48781   '@40b62
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_40c56   '@40b6f
    L_BP8e! = L_BP0e! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@40b9e DS:2b5a
    L_BP92! = L_BP12!   '@40bdd
    L_BPc2$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) * 10) / 10.0#)))   '@40bed DS:2b82
    GOSUB L_48781   '@40c44
L_40c56:
    GOTO L_414ef   '@40c56
L_40c5e:
    L_BPd2! = A_16ee!(0, 0)   '@40c5e
    FOR V_11ec! = 1.0 TO L_BPd2!   '@40c7f DS:2b0c
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1 AND V_11ec! = 3.0) THEN GOTO L_40ce2   '@40c86 DS:2b8a
    GOTO L_414ea   '@40cda
L_40ce2:
    V_1a94! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP0e!   '@40ce2
    V_1a98! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP12!   '@40d10
    V_1a9c! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP0e!   '@40d3f DS:2b0c
    V_1aa0! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP12!   '@40d72 DS:2b0c
    L_BPc2$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&(RT_SQR##(RT_POT##((FX##(V_1a94!) - V_1a9c!), (2.0)) + RT_POT##((FX##(V_1a98!) - V_1aa0!), (2.0))) * 10.0)) / 10.0#)))   '@40da6 DS:2b5a,2b7e,2b82
    IF NOT (V_1a94! < V_1a9c! AND V_1a98! = V_1aa0!) THEN GOTO L_40eb0   '@40e11
    L_BPba! = 0.0   '@40e4f DS:2b2c
    L_BP8e! = (FX##(V_1a94!) + V_1a9c!) / 2.0 - LEN(L_BPc2$) * 5   '@40e60 DS:2b5a
    L_BP92! = FX##(V_1a98!) + 2.0   '@40e92 DS:2b5a
    GOTO L_414b1   '@40ea8
L_40eb0:
    IF NOT (V_1a94! > V_1a9c! AND V_1a98! = V_1aa0!) THEN GOTO L_40f4f   '@40eb0
    L_BPba! = 0.0   '@40eee DS:2b2c
    L_BP8e! = (FX##(V_1a94!) + V_1a9c!) / 2.0 - LEN(L_BPc2$) * 5   '@40eff DS:2b5a
    L_BP92! = FX##(V_1a98!) - 12.0   '@40f31 DS:2b8e
    GOTO L_414ac   '@40f47
L_40f4f:
    IF NOT (V_1a94! = V_1a9c!) THEN GOTO L_4103b   '@40f4f
    L_BPba! = 90.0   '@40f6a DS:2b92
    IF NOT (V_1a98! < V_1aa0!) THEN GOTO L_40fe6   '@40f7b
    L_BP8e! = FX##(V_1a94!) - 2.0   '@40f96 DS:2b96
    L_BP92! = (FX##(V_1a98!) + V_1aa0!) / 2.0 - LEN(L_BPc2$) * 5   '@40fac DS:2b5a
    GOTO L_41033   '@40fde
L_40fe6:
    L_BP8e! = FX##(V_1a94!) + 12.0   '@40fe6 DS:2b9a
    L_BP92! = (FX##(V_1a98!) + V_1aa0!) / 2.0 - LEN(L_BPc2$) * 5   '@40ffc DS:2b5a
L_41033:
    GOTO L_414a7   '@41033
L_4103b:
    L_BP8e! = (FX##(V_1a94!) + V_1a9c!) / 2.0   '@4103b DS:2b5a
    L_BP92! = (FX##(V_1a98!) + V_1aa0!) / 2.0   '@41056 DS:2b5a
    IF NOT (V_1a98! < V_1aa0! AND V_1a94! < V_1a9c!) THEN GOTO L_41174   '@41071
    L_BPba! = ATN((FX##(V_1aa0!) - V_1a98!) / (FX##(V_1a9c!) - V_1a94!))   '@410af
    L_BP8e! = L_BP8e! - RT_SIN##(FX##(L_BPba!)) * 2.0 - LEN(L_BPc2$) * 5 * RT_COS##(FX##(L_BPba!))   '@410d9 DS:2b5a
    L_BP92! = RT_COS##(FX##(L_BPba!)) * 2.0 - LEN(L_BPc2$) * 5 * RT_SIN##(FX##(L_BPba!)) + L_BP92!   '@41124 DS:2b5a
    GOTO L_41487   '@4116c
L_41174:
    IF NOT (V_1a98! < V_1aa0! AND V_1a94! > V_1a9c!) THEN GOTO L_4129d   '@41174
    L_BPba! = ATN((FX##(V_1a94!) - V_1a9c!) / (FX##(V_1aa0!) - V_1a98!))   '@411b2
    L_BP8e! = L_BP8e! - RT_COS##(FX##(L_BPba!)) * 12.0 - LEN(L_BPc2$) * 5 * RT_SIN##(FX##(L_BPba!))   '@411dc DS:2b9a
    L_BP92! = L_BP92! - RT_SIN##(FX##(L_BPba!)) * 12.0 + LEN(L_BPc2$) * 5 * RT_COS##(FX##(L_BPba!))   '@41227 DS:2b9a
    L_BPba! = 3.0# * FX##(V_0e04#) / 2.0# + L_BPba!   '@41272 DS:2b9e,2ba6
    GOTO L_41482   '@41295
L_4129d:
    IF NOT (V_1a98! > V_1aa0! AND V_1a94! > V_1a9c!) THEN GOTO L_413a0   '@4129d
    L_BPba! = ATN((FX##(V_1a98!) - V_1aa0!) / (FX##(V_1a94!) - V_1a9c!))   '@412db
    L_BP8e! = RT_SIN##(FX##(L_BPba!)) * 12.0 - LEN(L_BPc2$) * 5 * RT_COS##(FX##(L_BPba!)) + L_BP8e!   '@41305 DS:2b9a
    L_BP92! = L_BP92! - RT_COS##(FX##(L_BPba!)) * 12.0 - LEN(L_BPc2$) * 5 * RT_SIN##(FX##(L_BPba!))   '@4134d DS:2b9a
    GOTO L_4147d   '@41398
L_413a0:
    L_BPba! = ATN((FX##(V_1a98!) - V_1aa0!) / (FX##(V_1a9c!) - V_1a94!))   '@413a0
    L_BP8e! = RT_SIN##(FX##(L_BPba!)) * 2.0 - LEN(L_BPc2$) * 5 * RT_COS##(FX##(L_BPba!)) + L_BP8e!   '@413ca DS:2b5a
    L_BP92! = RT_COS##(FX##(L_BPba!)) * 2.0 + L_BP92! + LEN(L_BPc2$) * 5 * RT_SIN##(FX##(L_BPba!))   '@41412 DS:2b5a
    L_BPba! = 2.0# * FX##(V_0e04#) - L_BPba!   '@4145a DS:2ba6
L_4147d:
L_41482:
L_41487:
    L_BPba! = FX##(L_BPba!) * 180.0 / V_0e04#   '@41487 DS:2bae
L_414a7:
L_414ac:
L_414b1:
    GOSUB L_48781   '@414b1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@414be DS:2b0c
L_414ea:
L_414ef:
L_414f4:
L_414f9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@414f9 DS:2b0c
L_4152a:
    IF NOT (V_155e$ = "S") THEN GOTO L_41a4e   '@4152a DS:2b3e
    L_BP46$ = "EST-VIGAS-TEXT"   '@41541 DS:2bb2
    L_BPd6! = A_157e%(0)   '@41553
    FOR V_11b8! = 1.0 TO L_BPd6!   '@41577 DS:2b0c
    IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_41a1d   '@4157e
    L_BP96! = 18.0   '@415a5 DS:2b56
    L_BP8e! = A_1778%(RT_CINT%(FX##(V_11b8!)), 0)   '@415b6
    L_BP92! = A_1778%(RT_CINT%(FX##(V_11b8!)), 1)   '@415e4
    L_BPd8% = A_1778%(RT_CINT%(FX##(V_11b8!)), 2)   '@41613
    IF NOT (L_BPd8% >= 0) THEN GOTO L_41684   '@41637
    L_BPba! = A_1778%(RT_CINT%(FX##(V_11b8!)), 2) * 1.7999999523162841796875## / V_0e04#   '@41646 DS:2bc4
    GOTO L_416db   '@4167c
L_41684:
    IF NOT (L_BPd8% < 0) THEN GOTO L_416db   '@41684
    L_BPba! = (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 2)) / 100.0 + V_0e04#) * 180.0# / V_0e04# + 180.0#   '@4168e DS:2bc8,2bcc
    GOTO L_416db   '@416d3
L_416db:
    IF NOT (V_1562$ = "S") THEN GOTO L_419b7   '@416db DS:2b3e
    L_BPda% = 0   '@416f2
    IF NOT (A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 1) = 0.0) THEN GOTO L_41750   '@416fd DS:2b2c
    L_BPda% = 1   '@41745
L_41750:
    V_0e0c$ = " (" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BPda%, 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), L_BPda%, 1)))   '@41750 DS:2bd4,2bda
    L_BPde! = FX##(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 0)) + A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), 14, 2)   '@417f6
    FOR L_BPc8! = L_BPda% TO L_BPde!   '@41865 DS:2b0c
    V_0e10$ = LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), RT_CINT%(FX##(L_BPc8!)), 0))) + "x" + LTRIM$(STR$(A_1200!(A_157e%(RT_CINT%(FX##(V_11b8!))), RT_CINT%(FX##(L_BPc8!)), 1)))   '@41872 DS:2bda
    IF NOT (RT_INSTR%((1), (V_0e0c$), (V_0e10$)) = 0) THEN GOTO L_41967   '@4191f
    V_0e0c$ = V_0e0c$ + "/" + V_0e10$   '@4193c DS:2be0
L_41967:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc8!   '@41967 DS:2b0c
    V_0e0c$ = V_0e0c$ + ")"   '@41993 DS:2be6
    GOTO L_419ce   '@419af
L_419b7:
    V_0e0c$ = ""   '@419b7 DS:2bec
L_419ce:
    L_BPc2$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!)))) + V_0e0c$   '@419ce
    GOSUB L_48781   '@41a0b
L_41a1d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@41a1d DS:2b0c
L_41a4e:
    IF NOT (V_156e$ = "S") THEN GOTO L_426d5   '@41a4e DS:2b3e
    IF NOT (V_1802% = 0) THEN GOTO L_41a7c   '@41a65
    GOTO L_426cb   '@41a74
L_41a7c:
    L_BP96! = 8.0   '@41a7c DS:2bf0
    L_BP62! = FX##(V_1ac4!) + 20.0   '@41a8d DS:2b7a
    L_BP66! = V_1ac0!   '@41aa2
    L_BPe2! = A_1804!(0, 0)   '@41ab2
    FOR V_11b8! = 1.0 TO L_BPe2!   '@41ad3 DS:2b0c
    L_BPe4% = RT_CINT%(FX##(A_1804!(RT_CINT%(FX##(V_11b8!)), 4)))   '@41ada
    L_BPe8! = A_1804!(RT_CINT%(FX##(V_11b8!)), 5)   '@41b07
    L_BPec! = A_1804!(RT_CINT%(FX##(V_11b8!)), 0)   '@41b32
    IF NOT (L_BPec! = 0.0) THEN GOTO L_420f2   '@41b5c DS:2b2c
    V_11e4! = 1.0   '@41b77 DS:2b0c
L_41b8e:
    IF NOT (V_11e4! <= L_BPe8!) THEN GOTO L_420ea   '@41b8f
    L_BPf0! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 0)   '@41ba4 DS:2bf4
    L_BPf4! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 1)   '@41be3 DS:2bf4
    L_BPf8! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 2)   '@41c23 DS:2bf4
    L_BPfc! = L_BPf0!   '@41c60
    IF NOT (L_BPfc! = -1.0) THEN GOTO L_41cd1   '@41c71 DS:2bf4
    L_BP5e! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BPf4!)), 0)) * 1000.0)) / 10.0#   '@41c8c DS:2b82,2bf8
    GOTO L_41e04   '@41cc9
L_41cd1:
    IF NOT (L_BPfc! = -2.0) THEN GOTO L_41d97   '@41cd2 DS:2b96
    V_11ec! = -L_BPf4!   '@41ce7
    CALL S_22bb6   '@41cfb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BPf4!))), V_13aa%, 6) = 2) THEN GOTO L_41d5b   '@41d05
    L_BP5e! = V_11d8!   '@41d43
    GOTO L_41d8f   '@41d53
L_41d5b:
    L_BP5e! = FX##(A_16ee!(RT_CINT%(FX##(L_BPf8!)), 1)) + V_11d8!   '@41d5b
L_41d8f:
    GOTO L_41e04   '@41d8f
L_41d97:
    IF NOT (L_BPfc! = -3.0) THEN GOTO L_41de6   '@41d98 DS:2bfc
    L_BP5e! = A_1664!(RT_CINT%(FX##(L_BPf4!)), RT_CINT%(FX##(L_BPf8!)))   '@41dad
    GOTO L_41e04   '@41dde
L_41de6:
    IF NOT (L_BPfc! = -4.0) THEN GOTO L_41e04   '@41de7 DS:2c00
    GOTO L_41e04   '@41dfc
L_41e04:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_41eb3   '@41e04 DS:2b0c
    IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 1) <> -1000.0) THEN GOTO L_41e86   '@41e1f DS:2c04
    L_BP52! = A_1804!(RT_CINT%(FX##(V_11b8!)), 1)   '@41e54
    GOTO L_41eae   '@41e7e
L_41e86:
    L_BP62! = FX##(L_BP62!) + 30.0   '@41e86 DS:2c08
    L_BP52! = L_BP62!   '@41e9a
L_41eae:
L_41eb3:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_41ee5   '@41eb3 DS:2b0c
    L_BP56! = L_BP5e!   '@41ece
    GOTO L_42009   '@41edd
L_41ee5:
    L_BP46$ = "EST-COTAS"   '@41ee5 DS:2c0c
    L_BP72! = L_BP52!   '@41ef7
    L_BP76! = L_BP56!   '@41f06
    L_BP7a! = L_BP52!   '@41f15
    L_BP7e! = L_BP5e!   '@41f24
    GOSUB L_48212   '@41f33
    L_BPc2$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BP5e!) - L_BP56!) * 10.0)) / 10.0#)))   '@41f40 DS:2b7e,2b82
    L_BP8e! = FX##(L_BP52!) - 2.0   '@41f81 DS:2b96
    L_BP92! = (FX##(L_BP56!) + L_BP5e!) / 2.0 - LEN(L_BPc2$) * 4   '@41f96 DS:2b5a
    L_BPba! = 90.0   '@41fc5 DS:2b92
    L_BP46$ = "EST-COTAS-TEXT"   '@41fd6 DS:2c1a
    GOSUB L_48781   '@41fe8
    L_BP56! = L_BP5e!   '@41ff5
L_42009:
    L_BP72! = FX##(L_BP52!) - 7.0   '@42009 DS:2c2c
    L_BP76! = L_BP56!   '@4201d
    L_BP7a! = FX##(L_BP52!) + 7.0   '@4202c DS:2c30
    L_BP7e! = L_BP56!   '@42040
    L_BP46$ = "EST-COTAS"   '@4204f DS:2c0c
    GOSUB L_48212   '@42061
    L_BP72! = FX##(L_BP52!) - 5.0   '@4206e DS:2c34
    L_BP76! = FX##(L_BP56!) + 2.0   '@42082 DS:2b5a
    L_BP7a! = FX##(L_BP52!) + 5.0   '@42096 DS:2c38
    L_BP7e! = FX##(L_BP56!) - 2.0   '@420aa DS:2b96
    GOSUB L_48212   '@420be
    V_11e4! = FX##(V_11e4!) + 1.0   '@420cb DS:2b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41b8e   '@420e1
L_420ea:
    GOTO L_4269a   '@420ea
L_420f2:
    IF NOT (L_BPec! = 1.0) THEN GOTO L_4267c   '@420f3 DS:2b0c
    V_11e4! = 1.0   '@42108 DS:2b0c
L_4211e:
    IF NOT (V_11e4! <= L_BPe8!) THEN GOTO L_42674   '@4211f
    L_BPf0! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 0)   '@42134 DS:2bf4
    L_BPf4! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 1)   '@42173 DS:2bf4
    L_BPf8! = A_1832%(RT_CINT%(L_BPe4% + (FX##(V_11e4!) - 1.0)), 2)   '@421b3 DS:2bf4
    L_BP100! = L_BPf0!   '@421f0
    IF NOT (L_BP100! = -1.0) THEN GOTO L_42262   '@42201 DS:2bf4
    L_BP5a! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BPf4!)), 1)) * 1000.0)) / 10.0#   '@4221c DS:2b82,2bf8
    GOTO L_42394   '@4225a
L_42262:
    IF NOT (L_BP100! = -2.0) THEN GOTO L_42327   '@42263 DS:2b96
    V_11ec! = -L_BPf4!   '@42278
    CALL S_22bb6   '@4228c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BPf4!))), V_13aa%, 6) = 2) THEN GOTO L_422ec   '@42296
    L_BP5a! = V_11d4!   '@422d4
    GOTO L_4231f   '@422e4
L_422ec:
    L_BP5a! = FX##(A_16ee!(RT_CINT%(FX##(L_BPf8!)), 0)) + V_11d4!   '@422ec
L_4231f:
    GOTO L_42394   '@4231f
L_42327:
    IF NOT (L_BP100! = -3.0) THEN GOTO L_42376   '@42328 DS:2bfc
    L_BP5a! = A_1664!(RT_CINT%(FX##(L_BPf4!)), RT_CINT%(FX##(L_BPf8!)))   '@4233d
    GOTO L_42394   '@4236e
L_42376:
    IF NOT (L_BP100! = -4.0) THEN GOTO L_42394   '@42377 DS:2c00
    GOTO L_42394   '@4238c
L_42394:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_4243d   '@42394 DS:2b0c
    IF NOT (A_1804!(RT_CINT%(FX##(V_11b8!)), 2) <> -1000.0) THEN GOTO L_42410   '@423af DS:2c04
    L_BP56! = A_1804!(RT_CINT%(FX##(V_11b8!)), 2)   '@423e1
    GOTO L_42438   '@42408
L_42410:
    L_BP66! = FX##(L_BP66!) - 30.0   '@42410 DS:2c3c
    L_BP56! = L_BP66!   '@42424
L_42438:
L_4243d:
    IF NOT (V_11e4! = 1.0) THEN GOTO L_4246f   '@4243d DS:2b0c
    L_BP52! = L_BP5a!   '@42458
    GOTO L_42593   '@42467
L_4246f:
    L_BP72! = L_BP52!   '@4246f
    L_BP76! = L_BP56!   '@4247e
    L_BP7a! = L_BP5a!   '@4248d
    L_BP7e! = L_BP56!   '@4249c
    L_BP46$ = "EST-COTAS"   '@424ab DS:2c0c
    GOSUB L_48212   '@424bd
    L_BPc2$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BP5a!) - L_BP52!) * 10.0)) / 10.0#)))   '@424ca DS:2b7e,2b82
    L_BP8e! = (FX##(L_BP52!) + L_BP5a!) / 2.0 - LEN(L_BPc2$) * 4   '@4250b DS:2b5a
    L_BP92! = FX##(L_BP56!) + 2.0   '@4253a DS:2b5a
    L_BPba! = 0.0   '@4254f DS:2b2c
    L_BP46$ = "EST-COTAS-TEXT"   '@42560 DS:2c1a
    GOSUB L_48781   '@42572
    L_BP52! = L_BP5a!   '@4257f
L_42593:
    L_BP72! = L_BP52!   '@42593
    L_BP76! = FX##(L_BP56!) + 5.0   '@425a2 DS:2c38
    L_BP7a! = L_BP52!   '@425b6
    L_BP7e! = FX##(L_BP56!) - 5.0   '@425c5 DS:2c34
    L_BP46$ = "EST-COTAS"   '@425d9 DS:2c0c
    GOSUB L_48212   '@425eb
    L_BP72! = FX##(L_BP52!) + 3.0   '@425f8 DS:2b8a
    L_BP76! = FX##(L_BP56!) + 4.0   '@4260c DS:2c40
    L_BP7a! = FX##(L_BP52!) - 3.0   '@42620 DS:2bfc
    L_BP7e! = FX##(L_BP56!) - 4.0   '@42634 DS:2c00
    GOSUB L_48212   '@42648
    V_11e4! = FX##(V_11e4!) + 1.0   '@42655 DS:2b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4211e   '@4266b
L_42674:
    GOTO L_4269a   '@42674
L_4267c:
    IF NOT (L_BPec! = 2.0) THEN GOTO L_4269a   '@4267d DS:2b5a
    GOTO L_4269a   '@42692
L_4269a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@4269a DS:2b0c
L_426cb:
L_426d5:
    IF NOT (V_1572$ = "S") THEN GOTO L_43dc5   '@426d5 DS:2b3e
    L_BP46$ = "EST-ELEVA"   '@426ec DS:2c44
    L_BP104! = A_1200!(0, 0, 0)   '@426fe
    FOR V_11e4! = 1.0 TO L_BP104!   '@42720 DS:2b0c
    L_BP108! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@42728
    FOR V_11cc! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP108!   '@4277a DS:2b0c
    L_BPc8! = 0.0   '@427a4 DS:2b2c
    L_BP10c! = FX##(A_1664!(0, 0)) - 1.0   '@427b5 DS:2bf4
    FOR V_11ec! = 1.0 TO L_BP10c!   '@427db DS:2b0c
    V_11bc! = FX##(V_11cc!) / 100.0 + V_11e4!   '@427e2 DS:2bc8
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 4) = V_11bc!) THEN GOTO L_43d3c   '@427fd
    IF NOT (L_BPc8! = 0.0) THEN GOTO L_42dff   '@42832 DS:2b2c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_428b6   '@4284d
    L_BP110! = FX##(V_0e04#) / 2.0#   '@42898 DS:2ba6
    GOTO L_42de9   '@428ae
L_428b6:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_4297a   '@428b6
    L_BP110! = 0.0   '@42905 DS:2b2c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42972   '@42916
    L_BP110! = V_0e04#   '@42961
L_42972:
    GOTO L_42de4   '@42972
L_4297a:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) < A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42ab4   '@4297a
    L_BP110! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@42a1e
    GOTO L_42ddf   '@42aac
L_42ab4:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42bf6   '@42ab4
    L_BP110! = V_0e04# - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2)))   '@42b58
    GOTO L_42dda   '@42bee
L_42bf6:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) > A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42d35   '@42bf6
    L_BP110! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2))) + V_0e04#   '@42c9a
    GOTO L_42dd5   '@42d2d
L_42d35:
    L_BP110! = 2.0# * FX##(V_0e04#) - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@42d35 DS:2ba6
L_42dd5:
L_42dda:
L_42ddf:
L_42de4:
L_42de9:
    L_BPc8! = 1.0   '@42de9 DS:2b0c
L_42dff:
    L_BP114! = A_1664!(0, 0)   '@42dff
    FOR V_11bc! = FX##(V_11ec!) + 1.0 TO L_BP114!   '@42e20 DS:2b0c
    L_BPc8! = FX##(V_11cc!) / 100.0 + V_11e4!   '@42e2c DS:2bc8
    IF NOT (A_1664!(RT_CINT%(FX##(V_11bc!)), 4) = L_BPc8!) THEN GOTO L_43d0b   '@42e47
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_4330f   '@42e7c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) THEN GOTO L_43307   '@42ec7
    L_BP118! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@42f14
    L_BP11c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@42f40
    CALL MIXT_0877_Menor(L_BP118!, L_BP11c!, L_BP120!)   '@42f65
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP11c!   '@42f7a
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP118!   '@42fa0
    L_BP124! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@42fc6
    L_BP128! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@42fec
    CALL MIXT_0877_Menor(L_BP124!, L_BP128!, L_BP12c!)   '@43011
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BP128!   '@43026
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BP124!   '@4304c
    CALL MIXT_082a_Maior(L_BP120!, L_BP12c!, L_BP130!)   '@43071
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a98! = L_BP130!   '@43086
    L_BP134! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@43091
    L_BP138! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@430bd
    CALL MIXT_082a_Maior(L_BP134!, L_BP138!, L_BP13c!)   '@430e2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP138!   '@430f7
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP134!   '@4311d
    L_BP140! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@43143
    L_BP144! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@43169
    CALL MIXT_082a_Maior(L_BP140!, L_BP144!, L_BP148!)   '@4318e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BP144!   '@431a3
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BP140!   '@431c9
    CALL MIXT_0877_Menor(L_BP13c!, L_BP148!, L_BP14c!)   '@431ee
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aa0! = L_BP14c!   '@43203
    IF NOT (FX##(V_1aa0!) - V_1a98! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_43302   '@4320e DS:2c52
    L_BP16! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) / 2.0   '@43258 DS:2b5a
    L_BP1a! = (FX##(V_1aa0!) + V_1a98!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@432a4 DS:2b5a
    GOSUB L_46a6e   '@432f0
L_43302:
L_43307:
    GOTO L_43d06   '@43307
L_4330f:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_4378a   '@4330f
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) THEN GOTO L_43782   '@4335e
    L_BP150! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@433ad
    L_BP154! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@433d8
    CALL MIXT_0877_Menor(L_BP150!, L_BP154!, L_BP158!)   '@433fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP154!   '@4340f
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP150!   '@43432
    L_BP15c! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@43457
    L_BP160! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@4347c
    CALL MIXT_0877_Menor(L_BP15c!, L_BP160!, L_BP164!)   '@4349e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP160!   '@434b3
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP15c!   '@434d6
    CALL MIXT_082a_Maior(L_BP158!, L_BP164!, L_BP168!)   '@434fa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a94! = L_BP168!   '@4350f
    L_BP16c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@4351a
    L_BP170! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@43545
    CALL MIXT_082a_Maior(L_BP16c!, L_BP170!, L_BP174!)   '@43567
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP170!   '@4357c
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP16c!   '@4359f
    L_BP178! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@435c4
    L_BP17c! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@435e9
    CALL MIXT_082a_Maior(L_BP178!, L_BP17c!, L_BP180!)   '@4360b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP17c!   '@43620
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP178!   '@43643
    CALL MIXT_0877_Menor(L_BP174!, L_BP180!, L_BP184!)   '@43667
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a9c! = L_BP184!   '@4367c
    IF NOT (FX##(V_1a9c!) - V_1a94! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_4377d   '@43687 DS:2c52
    L_BP16! = (FX##(V_1a9c!) + V_1a94!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@436d1 DS:2b5a
    L_BP1a! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) / 2.0   '@4371d DS:2b5a
    GOSUB L_46a6e   '@4376b
L_4377d:
L_43782:
    GOTO L_43d01   '@43782
L_4378a:
    V_1a94! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) * A_1664!(RT_CINT%(FX##(V_11ec!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1))   '@4378a
    V_1a9c! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) * A_1664!(RT_CINT%(FX##(V_11bc!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 1))   '@43851
    IF NOT (ABS(FX##(V_1a94!) - V_1a9c!) > FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) - 1.0) THEN GOTO L_43cfc   '@43918 DS:2bf4
    V_1aa4! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - V_1a94!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1))), (2.0)))   '@43964 DS:2b5a
    V_1aa8! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - V_1a94!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3))), (2.0)))   '@439d0 DS:2b5a
    V_1aac! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) - V_1a9c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 1))), (2.0)))   '@43a3a DS:2b5a
    V_1ab0! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - V_1a9c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3))), (2.0)))   '@43aa6 DS:2b5a
    CALL MIXT_0877_Menor(V_1aa4!, V_1aa8!, L_BP188!)   '@43b10
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(V_1aac!, V_1ab0!, L_BP18c!)   '@43b27
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP188!, L_BP18c!, L_BP190!)   '@43b39
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1a98! = L_BP190!   '@43b4e
    CALL MIXT_082a_Maior(V_1aa4!, V_1aa8!, L_BP194!)   '@43b59
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(V_1aac!, V_1ab0!, L_BP198!)   '@43b70
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP194!, L_BP198!, L_BP19c!)   '@43b82
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1aa0! = L_BP19c!   '@43b97
    IF NOT (FX##(V_1aa0!) - V_1a98! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_43cf7   '@43ba2 DS:2c52
    IF NOT (FX##(L_BP110!) > FX##(V_0e04#)) THEN GOTO L_43c1d   '@43bec
    L_BP110! = FX##(L_BP110!) - V_0e04#   '@43c07
L_43c1d:
    L_BP16! = (FX##(V_1a9c!) + V_1a94!) / 2.0 + ((FX##(V_1a98!) + V_1aa0!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_COS##(FX##(L_BP110!))   '@43c1d DS:2b5a
    L_BP1a! = ((FX##(V_1a98!) + V_1aa0!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_SIN##(FX##(L_BP110!))   '@43c8a DS:2b5a
    GOSUB L_46a6e   '@43ce5
L_43cf7:
L_43cfc:
L_43d01:
L_43d06:
L_43d0b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@43d0b DS:2b0c
L_43d3c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@43d3c DS:2b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@43d68 DS:2b0c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@43d94 DS:2b0c
L_43dc5:
    PRINT #2, 0   '@43dc5
    PRINT #2, "ENDSEC"   '@43ddb DS:2c56
    PRINT #2, 0   '@43df2
    PRINT #2, "EOF"   '@43e08 DS:2c60
    RT_CLOSE   '@43e1f (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    GOTO L_48b0f   '@43e2c
    ' ---- F_43e34 @0x43e34  (043e34_F_43e34.lift.txt; evidence_id (assembly): ev_577fb9968f0da7700e88155f86ba7ea26c151793a2bbb69e6c207f8edd1ab08c)
L_43e39:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04016e_FUN_4000_016e
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_4410f   '@43e3e
    L_BP82! = L_BP0e!   '@43e6d
    L_BP86! = L_BP12!   '@43e7d
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@43e8d DS:2b5a
    GOSUB L_484f6   '@43ec5
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 0.4000000059604644775390625##   '@43ed2 DS:2b5a,2c68
    GOSUB L_484f6   '@43f0f
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 0.800000011920928955078125##   '@43f1c DS:2b5a,2c6c
    GOSUB L_484f6   '@43f59
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 - 1.2000000476837158203125##   '@43f66 DS:2b5a,2c70
    GOSUB L_484f6   '@43fa3
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_44107   '@43fb0
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@43fdf DS:2b5a
    GOSUB L_484f6   '@44017
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 0.4000000059604644775390625##   '@44024 DS:2b5a,2c74
    GOSUB L_484f6   '@44061
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 0.800000011920928955078125##   '@4406e DS:2b5a,2c78
    GOSUB L_484f6   '@440ab
    L_BP8a! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 + 1.2000000476837158203125##   '@440b8 DS:2b5a,2c7c
    GOSUB L_484f6   '@440f5
L_44107:
    GOTO L_442b7   '@44107
L_4410f:
    L_BP1a0! = A_16ee!(0, 0)   '@4410f
    FOR V_11ec! = 1.0 TO L_BP1a0!   '@44130 DS:2b0c
    L_BP72! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP0e!   '@44138
    L_BP76! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP12!   '@44165
    L_BP7a! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP0e!   '@44193 DS:2b0c
    L_BP7e! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP12!   '@441c5 DS:2b0c
    GOSUB L_48212   '@441f8
    L_BP1a4! = 0.4000000059604644775390625##   '@44205 DS:2c74
    GOSUB L_45c50   '@44216
    GOSUB L_48212   '@44223
    L_BP1a4! = 0.800000011920928955078125##   '@44230 DS:2c78
    GOSUB L_45c50   '@44241
    GOSUB L_48212   '@4424e
    L_BP1a4! = 1.2000000476837158203125##   '@4425b DS:2c7c
    GOSUB L_45c50   '@4426c
    GOSUB L_48212   '@44279
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@44286 DS:2b0c
L_442b7:
    L_BP46$ = "EST-PILAR-HACH"   '@442b7 DS:2c80
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 1) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_44e43   '@442c9
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_44430   '@44315
    V_1a94! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@44344 DS:2b5a
    V_1a98! = FX##(-A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@4437e DS:2b5a
    V_1a9c! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@443b8 DS:2b5a
    V_1aa0! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@443f0 DS:2b5a
    GOTO L_4468d   '@44428
L_44430:
    V_1a94! = A_16ee!(1, 0)   '@44430
    V_1a98! = A_16ee!(1, 1)   '@44453
    V_1a9c! = A_16ee!(1, 0)   '@44474
    V_1aa0! = A_16ee!(1, 1)   '@44497
    L_BP1a8! = A_16ee!(0, 0)   '@444b8
    FOR V_11ec! = 2.0 TO L_BP1a8!   '@444d9 DS:2b0c,2b5a
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) < V_1a94!) THEN GOTO L_4453e   '@444e0
    V_1a94! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@44514
L_4453e:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) < V_1a98!) THEN GOTO L_4459e   '@4453e
    V_1a98! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@44573
L_4459e:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) > V_1a9c!) THEN GOTO L_445fc   '@4459e
    V_1a9c! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@445d2
L_445fc:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) > V_1aa0!) THEN GOTO L_4465c   '@445fc
    V_1aa0! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@44631
L_4465c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@4465c DS:2b0c
L_4468d:
    L_BP1ac! = FX##(V_1aa0!) - 1.0   '@4468d DS:2bf4
    FOR V_11d8! = FX##(V_1a98!) + 1.0 TO L_BP1ac!   '@446a4 DS:2b0c
    L_BP16! = FX##(V_1a94!) - 1.0   '@446b0 DS:2bf4
    L_BP1a4! = -1.0   '@446c5 DS:2bf4
L_446db:
    L_BP1e! = -1000.0   '@446e0 DS:2c04
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_44ab0   '@446f0
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@4471f DS:2b5a
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_447e3   '@4477d DS:2c04
    L_BP1e! = V_11d4!   '@447d3
L_447e3:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@447e3 DS:2b5a
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_448a4   '@4483e DS:2c04
    L_BP1e! = V_11d4!   '@44894
L_448a4:
    IF NOT (ABS(FX##(V_11d8!)) < FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0 AND A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_44aa8   '@448a4 DS:2b5a
    V_11d4! = -RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@4491e DS:2b5a
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_449e2   '@4497c DS:2c04
    L_BP1e! = V_11d4!   '@449d2
L_449e2:
    V_11d4! = RT_SQR##(RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)) - RT_POT##((FX##(V_11d8!)), (2.0)))   '@449e2 DS:2b5a
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_44aa3   '@44a3d DS:2c04
    L_BP1e! = V_11d4!   '@44a93
L_44aa3:
L_44aa8:
    GOTO L_44d25   '@44aa8
L_44ab0:
    L_BP1b0! = A_16ee!(0, 0)   '@44ab0
    FOR V_11ec! = 1.0 TO L_BP1b0!   '@44ad1 DS:2b0c
    L_BP1b4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@44ad8
    L_BP1b8! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@44b02
    L_BP1bc! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@44b2d DS:2b0c
    L_BP1c0! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@44b5c DS:2b0c
    IF NOT ((L_BP1c0! >= V_11d8! OR L_BP1b8! >= V_11d8!) AND ((L_BP1c0! <= V_11d8! OR L_BP1b8! <= V_11d8!) AND L_BP1b8! <> L_BP1c0!)) THEN GOTO L_44cf4   '@44b8c
    IF NOT (L_BP1b4! = L_BP1bc!) THEN GOTO L_44c4f   '@44c1b
    V_11d4! = L_BP1b4!   '@44c36
    GOTO L_44c89   '@44c47
L_44c4f:
    V_11d4! = (FX##(V_11d8!) - L_BP1b8!) * (FX##(L_BP1bc!) - L_BP1b4!) / (FX##(L_BP1c0!) - L_BP1b8!) + L_BP1b4!   '@44c4f
L_44c89:
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_44cef   '@44c89 DS:2c04
    L_BP1e! = V_11d4!   '@44cdf
L_44cef:
L_44cf4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@44cf4 DS:2b0c
L_44d25:
    IF NOT (L_BP1e! <> -1000.0) THEN GOTO L_44e0f   '@44d25 DS:2c04
    IF NOT (L_BP1a4! = -1.0) THEN GOTO L_44d87   '@44d3f DS:2bf4
    L_BP16! = L_BP1e!   '@44d5a
    L_BP1a4! = 0.0   '@44d69 DS:2b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_446db   '@44d7a
L_44d87:
    L_BP72! = FX##(L_BP16!) + L_BP0e!   '@44d87
    L_BP76! = FX##(L_BP12!) + V_11d8!   '@44d9a
    L_BP7a! = FX##(L_BP1e!) + L_BP0e!   '@44dae
    L_BP7e! = FX##(L_BP12!) + V_11d8!   '@44dc1
    GOSUB L_48212   '@44dd5
    L_BP16! = L_BP1e!   '@44de2
    L_BP1a4! = -1.0   '@44df1 DS:2bf4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_446db   '@44e02
L_44e0f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d8!   '@44e0f DS:2b0c
    GOTO L_45c41   '@44e3b
L_44e43:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) > A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_45c3c   '@44e43
    L_BP110! = 35.81999969482421875## * V_0e04# / 180.0#   '@44e92 DS:2bcc,2c92
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_4505e   '@44ead
    L_BP1b4! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BP110!)) / 2.0   '@44edc DS:2b5a
    L_BP1b8! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BP110!)) / 2.0   '@44f25 DS:2b5a
    L_BP1bc! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_SIN##(FX##(L_BP110!)) / 2.0   '@44f6c DS:2b5a
    L_BP1c0! = -A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1) * RT_COS##(FX##(L_BP110!)) / 2.0   '@44fb3 DS:2b5a
    L_BP1b4! = L_BP1b4! - (FX##(L_BP1b8!) + 200.0) / RT_TAN##(FX##(L_BP110!))   '@44ffc DS:2c9a
    L_BP1bc! = L_BP1bc! - (FX##(L_BP1c0!) + 200.0) / RT_TAN##(FX##(L_BP110!))   '@45029 DS:2c9a
    GOTO L_451cf   '@45056
L_4505e:
    L_BP1b4! = A_16ee!(1, 0) - (FX##(A_16ee!(1, 1)) + 200.0) / RT_TAN##(FX##(L_BP110!))   '@4505e DS:2c9a
    L_BP1bc! = L_BP1b4!   '@450ad
    L_BP1c4! = A_16ee!(0, 0)   '@450be
    FOR V_11ec! = 2.0 TO L_BP1c4!   '@450df DS:2b0c,2b5a
    V_11d4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + 200.0) / RT_TAN##(FX##(L_BP110!))   '@450e6 DS:2c9a
    IF NOT (V_11d4! < L_BP1b4!) THEN GOTO L_45172   '@45146
    L_BP1b4! = V_11d4!   '@45161
L_45172:
    IF NOT (V_11d4! > L_BP1bc!) THEN GOTO L_4519e   '@45172
    L_BP1bc! = V_11d4!   '@4518d
L_4519e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@4519e DS:2b0c
L_451cf:
    L_BP1c8! = 5.0 / RT_SIN##(FX##(L_BP110!))   '@451cf DS:2c38
    IF NOT ((FX##(L_BP1bc!) - L_BP1b4!) / L_BP1c8! < FX##(3.0)) THEN GOTO L_4522f   '@451ef DS:2b8a
    L_BP1c8! = (FX##(L_BP1bc!) - L_BP1b4!) / 4.0   '@45214 DS:2c40
L_4522f:
    L_BP1cc! = L_BP1bc! - 0.100000001490116119384765625##   '@4522f DS:2c9e
    L_BP1d0! = L_BP1c8!   '@45246
    L_BPc8! = FX##(L_BP1b4!) + L_BP1c8!   '@45252
    GOTO L_45bec_v   '@45252
L_4525e:
    L_BP16! = L_BPc8!   '@4525e
    L_BP1a4! = -1.0   '@4526e DS:2bf4
L_45284:
    L_BP1e! = -1000.0   '@45289 DS:2c04
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_45802   '@45299
    L_BP1d4! = RT_POT##((RT_TAN##(FX##(L_BP110!))), (2.0)) + 1.0   '@452c8 DS:2b0c,2b5a
    L_BP1d8! = RT_POT##((RT_TAN##(FX##(L_BP110!))), (2.0)) * -2.0 * L_BPc8! - RT_TAN##(FX##(L_BP110!)) * 400.0   '@452f1 DS:2b5a,2b96,2ca2
    L_BP1dc! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BPc8!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BP110!))), (2.0)) + (RT_TAN##(FX##(L_BP110!)) * 400.0 * L_BPc8! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0), (2.0)))   '@45333 DS:2b5a,2c9a,2ca2
    V_11d4! = (-L_BP1d8! - RT_SQR##(RT_POT##((FX##(L_BP1d8!)), (2.0)) - FX##(L_BP1d4!) * 4.0 * L_BP1dc!)) / (FX##(L_BP1d4!) * 2.0)   '@453d3 DS:2b5a,2c40
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_45483   '@4541d DS:2c04
    L_BP1e! = V_11d4!   '@45473
L_45483:
    V_11d4! = (-L_BP1d8! + RT_SQR##(RT_POT##((FX##(L_BP1d8!)), (2.0)) - FX##(L_BP1d4!) * 4.0 * L_BP1dc!)) / (FX##(L_BP1d4!) * 2.0)   '@45483 DS:2b5a,2c40
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_45533   '@454cd DS:2c04
    L_BP1e! = V_11d4!   '@45523
L_45533:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_457d2   '@45533
    IF NOT (ABS(L_BPc8! - (FX##(V_1a94!) + V_1a9c!) / 2.0) < A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) / (RT_SIN##(FX##(L_BP110!)) * 2.0)) THEN GOTO L_457cd   '@45562 DS:2b5a
    L_BP1dc! = RT_POT##((FX##(200.0)), (2.0)) + RT_POT##((FX##(L_BPc8!)), (2.0)) * RT_POT##((RT_TAN##(FX##(L_BP110!))), (2.0)) + (RT_TAN##(FX##(L_BP110!)) * 400.0 * L_BPc8! - RT_POT##((FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0), (2.0)))   '@455c8 DS:2b5a,2c9a,2ca2
    V_11d4! = (-L_BP1d8! - RT_SQR##(RT_POT##((FX##(L_BP1d8!)), (2.0)) - FX##(L_BP1d4!) * 4.0 * L_BP1dc!)) / (FX##(L_BP1d4!) * 2.0)   '@45668 DS:2b5a,2c40
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_45718   '@456b2 DS:2c04
    L_BP1e! = V_11d4!   '@45708
L_45718:
    V_11d4! = (-L_BP1d8! + RT_SQR##(RT_POT##((FX##(L_BP1d8!)), (2.0)) - FX##(L_BP1d4!) * 4.0 * L_BP1dc!)) / (FX##(L_BP1d4!) * 2.0)   '@45718 DS:2b5a,2c40
    IF NOT ((V_11d4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_11d4! > L_BP16!) THEN GOTO L_457c8   '@45762 DS:2c04
    L_BP1e! = V_11d4!   '@457b8
L_457c8:
L_457cd:
L_457d2:
    L_BP22! = (FX##(L_BP1e!) - L_BPc8!) * RT_TAN##(FX##(L_BP110!)) - 200.0   '@457d2 DS:2ca6
    GOTO L_45ad6   '@457fa
L_45802:
    V_1a94! = L_BPc8!   '@45802
    V_1a98! = -200.0   '@45813 DS:2ca6
    V_1a9c! = 200.0 / RT_TAN##(FX##(L_BP110!)) + V_1a94!   '@45824 DS:2c9a
    V_1aa0! = 0.0   '@45849 DS:2b2c
    L_BP1e0! = A_16ee!(0, 0)   '@4585a
    FOR V_11ec! = 1.0 TO L_BP1e0!   '@4587b DS:2b0c
    V_1aa4! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@45882
    V_1aa8! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@458ac
    V_1aac! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@458d7 DS:2b0c
    V_1ab0! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@45906 DS:2b0c
    CALL S_14e79   '@45936
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1e2% = (RT_POT##((FX##(V_1aa4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1aa8!) - V_1ab0!), (2.0)) >= RT_POT##((FX##(V_1ab4!) - V_1aa4!), (2.0)) + RT_POT##((FX##(V_1ab8!) - V_1aa8!), (2.0)))   '@45940 DS:2b5a
    IF NOT ((RT_POT##((FX##(V_1aa4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1aa8!) - V_1ab0!), (2.0)) >= RT_POT##((FX##(V_1ab4!) - V_1aac!), (2.0)) + RT_POT##((FX##(V_1ab8!) - V_1ab0!), (2.0)) AND L_BP1e2%) <> 0) THEN GOTO L_45aa5   '@459c5 DS:2b5a
    IF NOT ((V_1ab4! < L_BP1e! OR L_BP1e! = -1000.0) AND V_1ab4! > L_BP16!) THEN GOTO L_45aa0   '@45a2a DS:2c04
    L_BP1e! = V_1ab4!   '@45a80
    L_BP22! = V_1ab8!   '@45a90
L_45aa0:
L_45aa5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@45aa5 DS:2b0c
L_45ad6:
    IF NOT (L_BP1e! <> -1000.0) THEN GOTO L_45bdc   '@45ad6 DS:2c04
    IF NOT (L_BP1a4! = -1.0) THEN GOTO L_45b47   '@45af0 DS:2bf4
    L_BP16! = L_BP1e!   '@45b0b
    L_BP1a! = L_BP22!   '@45b1a
    L_BP1a4! = 0.0   '@45b29 DS:2b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45284   '@45b3a
L_45b47:
    L_BP72! = FX##(L_BP16!) + L_BP0e!   '@45b47
    L_BP76! = FX##(L_BP1a!) + L_BP12!   '@45b5a
    L_BP7a! = FX##(L_BP1e!) + L_BP0e!   '@45b6d
    L_BP7e! = FX##(L_BP22!) + L_BP12!   '@45b80
    GOSUB L_48212   '@45b93
    L_BP16! = L_BP1e!   '@45ba0
    L_BP1a! = L_BP22!   '@45baf
    L_BP1a4! = -1.0   '@45bbe DS:2bf4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45284   '@45bcf
L_45bdc:
L_45beb:
    L_BPc8! = FX##(L_BPc8!) + L_BP1d0!   '@45bec
L_45bec_v:   ' juncao: valor vindo dos GOTO 'leva'
    IF NOT (L_BP1d0! < 0.0) THEN GOTO L_45c21   '@45bf3 DS:2b2c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPc8! < L_BP1cc!) THEN GOTO L_4525e   '@45c09
    GOTO L_45c37   '@45c1e
L_45c21:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BPc8! > L_BP1cc!) THEN GOTO L_4525e   '@45c22
L_45c37:
L_45c3c:
L_45c41:
    RETURN   '@45c41
L_45c50:   ' sub-rotina (alvo de GOSUB)
    IF NOT (V_11ec! > 1.0) THEN GOTO L_45cd5   '@45c55 DS:2b0c
    L_BP26! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 0)   '@45c70 DS:2bf4
    L_BP2a! = A_16ee!(RT_CINT%(FX##(V_11ec!) - 1.0), 1)   '@45c9e DS:2bf4
    GOTO L_45d4b   '@45ccd
L_45cd5:
    L_BP26! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 0)   '@45cd5
    L_BP2a! = A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0))), 1)   '@45d0d
L_45d4b:
    L_BP2e! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@45d4b
    L_BP32! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@45d74
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_45e17   '@45d9e DS:2b0c
    L_BP36! = A_16ee!(1, 0)   '@45dcd
    L_BP3a! = A_16ee!(1, 1)   '@45def
    GOTO L_45e79   '@45e0f
L_45e17:
    L_BP36! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@45e17 DS:2b0c
    L_BP3a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@45e45 DS:2b0c
L_45e79:
    GOSUB L_4614e   '@45e79
    L_BP72! = FX##(L_BP0e!) + V_1ab4!   '@45e86
    L_BP76! = FX##(L_BP12!) + V_1ab8!   '@45e9a
    L_BP26! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@45eae
    L_BP2a! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@45ed7
    IF NOT (FX##(V_11ec!) + 1.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_45f7a   '@45f01 DS:2b0c
    L_BP2e! = A_16ee!(1, 0)   '@45f30
    L_BP32! = A_16ee!(1, 1)   '@45f52
    GOTO L_45fdc   '@45f72
L_45f7a:
    L_BP2e! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)   '@45f7a DS:2b0c
    L_BP32! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)   '@45fa8 DS:2b0c
L_45fdc:
    IF NOT (FX##(V_11ec!) + 2.0 > FX##(A_16ee!(0, 0))) THEN GOTO L_460a8   '@45fdc DS:2b5a
    L_BP36! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 0)   '@4600b
    L_BP3a! = A_16ee!(1 - (A_16ee!(0, 0) = V_11ec!), 1)   '@46055
    GOTO L_4610a   '@460a0
L_460a8:
    L_BP36! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 0)   '@460a8 DS:2b5a
    L_BP3a! = A_16ee!(RT_CINT%(FX##(V_11ec!) + 2.0), 1)   '@460d6 DS:2b5a
L_4610a:
    GOSUB L_4614e   '@4610a
    L_BP7a! = FX##(L_BP0e!) + V_1ab4!   '@46117
    L_BP7e! = FX##(L_BP12!) + V_1ab8!   '@4612b
    RETURN   '@4613f
L_4614e:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BP32! = L_BP2a! AND L_BP2e! > L_BP26!) THEN GOTO L_461dc   '@46153
    V_1a94! = L_BP26!   '@4618d
    V_1a98! = FX##(L_BP2a!) - L_BP1a4!   '@4619d
    V_1a9c! = L_BP2e!   '@461b2
    V_1aa0! = FX##(L_BP32!) - L_BP1a4!   '@461c2
L_461dc:
    IF NOT (L_BP32! > L_BP2a! AND L_BP2e! >= L_BP26!) THEN GOTO L_462e1   '@461dc
    IF NOT (L_BP2e! = L_BP26!) THEN GOTO L_4624c   '@46216
    L_BP3e! = FX##(V_0e04#) / 2.0#   '@4622f DS:2ba6
    GOTO L_46276   '@46244
L_4624c:
    L_BP3e! = ATN((FX##(L_BP32!) - L_BP2a!) / (FX##(L_BP2e!) - L_BP26!))   '@4624c
L_46276:
    V_1a94! = L_BP1a4! / RT_SIN##(FX##(L_BP3e!)) + L_BP26!   '@46276
    V_1a98! = L_BP2a!   '@46299
    V_1a9c! = L_BP1a4! / RT_SIN##(FX##(L_BP3e!)) + L_BP2e!   '@462a9
    V_1aa0! = L_BP32!   '@462cc
L_462e1:
    IF NOT (L_BP32! > L_BP2a! AND L_BP2e! < L_BP26!) THEN GOTO L_463ab   '@462e1
    L_BP3e! = ATN((FX##(L_BP26!) - L_BP2e!) / (FX##(L_BP32!) - L_BP2a!))   '@4631b
    V_1a94! = L_BP1a4! / RT_COS##(FX##(L_BP3e!)) + L_BP26!   '@46340
    V_1a98! = L_BP2a!   '@46363
    V_1a9c! = L_BP1a4! / RT_COS##(FX##(L_BP3e!)) + L_BP2e!   '@46373
    V_1aa0! = L_BP32!   '@46396
L_463ab:
    IF NOT (L_BP32! = L_BP2a! AND L_BP2e! < L_BP26!) THEN GOTO L_46434   '@463ab
    V_1a94! = L_BP26!   '@463e5
    V_1a98! = FX##(L_BP2a!) + L_BP1a4!   '@463f5
    V_1a9c! = L_BP2e!   '@4640a
    V_1aa0! = FX##(L_BP32!) + L_BP1a4!   '@4641a
L_46434:
    IF NOT (L_BP32! < L_BP2a! AND L_BP2e! <= L_BP26!) THEN GOTO L_46504   '@46434
    L_BP3e! = ATN((FX##(L_BP26!) - L_BP2e!) / (FX##(L_BP2a!) - L_BP32!))   '@4646e
    V_1a94! = L_BP26! - L_BP1a4! / RT_COS##(FX##(L_BP3e!))   '@46493
    V_1a98! = L_BP2a!   '@464b9
    V_1a9c! = L_BP2e! - L_BP1a4! / RT_COS##(FX##(L_BP3e!))   '@464c9
    V_1aa0! = L_BP32!   '@464ef
L_46504:
    IF NOT (L_BP32! < L_BP2a! AND L_BP2e! > L_BP26!) THEN GOTO L_465d4   '@46504
    L_BP3e! = ATN((FX##(L_BP2e!) - L_BP26!) / (FX##(L_BP2a!) - L_BP32!))   '@4653e
    V_1a94! = L_BP26! - L_BP1a4! / RT_COS##(FX##(L_BP3e!))   '@46563
    V_1a98! = L_BP2a!   '@46589
    V_1a9c! = L_BP2e! - L_BP1a4! / RT_COS##(FX##(L_BP3e!))   '@46599
    V_1aa0! = L_BP32!   '@465bf
L_465d4:
    IF NOT (L_BP3a! = L_BP32! AND L_BP36! > L_BP2e!) THEN GOTO L_4665d   '@465d4
    V_1aa4! = L_BP2e!   '@4660e
    V_1aa8! = FX##(L_BP32!) - L_BP1a4!   '@4661e
    V_1aac! = L_BP36!   '@46633
    V_1ab0! = FX##(L_BP3a!) - L_BP1a4!   '@46643
L_4665d:
    IF NOT (L_BP3a! > L_BP32! AND L_BP36! >= L_BP2e!) THEN GOTO L_46762   '@4665d
    IF NOT (L_BP36! = L_BP2e!) THEN GOTO L_466cd   '@46697
    L_BP42! = FX##(V_0e04#) / 2.0#   '@466b0 DS:2ba6
    GOTO L_466f7   '@466c5
L_466cd:
    L_BP42! = ATN((FX##(L_BP3a!) - L_BP32!) / (FX##(L_BP36!) - L_BP2e!))   '@466cd
L_466f7:
    V_1aa4! = L_BP1a4! / RT_SIN##(FX##(L_BP42!)) + L_BP2e!   '@466f7
    V_1aa8! = L_BP32!   '@4671a
    V_1aac! = L_BP1a4! / RT_SIN##(FX##(L_BP42!)) + L_BP36!   '@4672a
    V_1ab0! = L_BP3a!   '@4674d
L_46762:
    IF NOT (L_BP3a! > L_BP32! AND L_BP36! < L_BP2e!) THEN GOTO L_4682c   '@46762
    L_BP42! = ATN((FX##(L_BP2e!) - L_BP36!) / (FX##(L_BP3a!) - L_BP32!))   '@4679c
    V_1aa4! = L_BP1a4! / RT_COS##(FX##(L_BP42!)) + L_BP2e!   '@467c1
    V_1aa8! = L_BP32!   '@467e4
    V_1aac! = L_BP1a4! / RT_COS##(FX##(L_BP42!)) + L_BP36!   '@467f4
    V_1ab0! = L_BP3a!   '@46817
L_4682c:
    IF NOT (L_BP3a! = L_BP32! AND L_BP36! < L_BP2e!) THEN GOTO L_468b5   '@4682c
    V_1aa4! = L_BP2e!   '@46866
    V_1aa8! = FX##(L_BP32!) + L_BP1a4!   '@46876
    V_1aac! = L_BP36!   '@4688b
    V_1ab0! = FX##(L_BP3a!) + L_BP1a4!   '@4689b
L_468b5:
    IF NOT (L_BP3a! < L_BP32! AND L_BP36! <= L_BP2e!) THEN GOTO L_46985   '@468b5
    L_BP42! = ATN((FX##(L_BP2e!) - L_BP36!) / (FX##(L_BP32!) - L_BP3a!))   '@468ef
    V_1aa4! = L_BP2e! - L_BP1a4! / RT_COS##(FX##(L_BP42!))   '@46914
    V_1aa8! = L_BP32!   '@4693a
    V_1aac! = L_BP36! - L_BP1a4! / RT_COS##(FX##(L_BP42!))   '@4694a
    V_1ab0! = L_BP3a!   '@46970
L_46985:
    IF NOT (L_BP3a! < L_BP32! AND L_BP36! > L_BP2e!) THEN GOTO L_46a55   '@46985
    L_BP42! = ATN((FX##(L_BP36!) - L_BP2e!) / (FX##(L_BP32!) - L_BP3a!))   '@469bf
    V_1aa4! = L_BP2e! - L_BP1a4! / RT_COS##(FX##(L_BP42!))   '@469e4
    V_1aa8! = L_BP32!   '@46a0a
    V_1aac! = L_BP36! - L_BP1a4! / RT_COS##(FX##(L_BP42!))   '@46a1a
    V_1ab0! = L_BP3a!   '@46a40
L_46a55:
    CALL S_14e79   '@46a55
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    RETURN   '@46a5f
L_46a6e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04016e_FUN_4000_016e
    GOSUB L_479d1   '@46a73
    L_BP72! = L_BP16!   '@46a80
    L_BP76! = L_BP1a!   '@46a8f
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP16!   '@46a9e DS:2b5a
    L_BP7e! = L_BP1a! - RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@46ae7 DS:2b5a
    GOSUB L_48212   '@46b33
    L_BP72! = L_BP7a!   '@46b40
    L_BP76! = L_BP7e!   '@46b4f
    L_BP7a! = L_BP72! - RT_COS##(FX##(L_BP110!)) * L_BP9a!   '@46b5e
    L_BP7e! = L_BP76! - RT_SIN##(FX##(L_BP110!)) * L_BP9a!   '@46b81
    GOSUB L_48212   '@46ba4
    IF NOT (L_BP9e! > 0.0) THEN GOTO L_46cd5   '@46bb1 DS:2b2c
    L_BP72! = L_BP7a!   '@46bcc
    L_BP76! = L_BP7e!   '@46bdb
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * 30.0 + L_BP72!   '@46bea DS:2c08
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * 30.0   '@46c0a DS:2c08
    GOSUB L_48212   '@46c2d
    L_BP72! = L_BP7a! - RT_COS##(FX##(L_BP110!)) * L_BP9e!   '@46c3a
    L_BP76! = L_BP7e! - RT_SIN##(FX##(L_BP110!)) * L_BP9e!   '@46c5d
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * 30.0   '@46c80 DS:2c08
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * 30.0 + L_BP76!   '@46ca3 DS:2c08
    GOSUB L_48212   '@46cc3
L_46cd5:
    L_BP72! = L_BP7a!   '@46cd5
    L_BP76! = L_BP7e!   '@46ce4
    L_BP7a! = L_BP72! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP9a! - L_BP9e!) * RT_COS##(FX##(L_BP110!))   '@46cf3
    L_BP7e! = L_BP76! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP9a! - L_BP9e!) * RT_SIN##(FX##(L_BP110!))   '@46d48
    GOSUB L_48212   '@46d9d
    L_BP72! = L_BP7a!   '@46daa
    L_BP76! = L_BP7e!   '@46db9
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)   '@46dc8
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) + L_BP76!   '@46e0f
    GOSUB L_48212   '@46e53
    L_BP72! = L_BP7a!   '@46e60
    L_BP76! = L_BP7e!   '@46e6f
    L_BP7a! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BPa2! - L_BPa6!) * RT_COS##(FX##(L_BP110!)) + L_BP72!   '@46e7e
    L_BP7e! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BPa2! - L_BPa6!) * RT_SIN##(FX##(L_BP110!)) + L_BP76!   '@46ed0
    GOSUB L_48212   '@46f22
    IF NOT (L_BPa6! > 0.0) THEN GOTO L_4704d   '@46f2f DS:2b2c
    L_BP72! = L_BP7a!   '@46f4a
    L_BP76! = L_BP7e!   '@46f59
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * 30.0   '@46f68 DS:2c08
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * 30.0 + L_BP76!   '@46f8b DS:2c08
    GOSUB L_48212   '@46fab
    L_BP72! = RT_COS##(FX##(L_BP110!)) * L_BPa6! + L_BP7a!   '@46fb8
    L_BP76! = RT_SIN##(FX##(L_BP110!)) * L_BPa6! + L_BP7e!   '@46fd8
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * 30.0 + L_BP72!   '@46ff8 DS:2c08
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * 30.0   '@47018 DS:2c08
    GOSUB L_48212   '@4703b
L_4704d:
    L_BP72! = L_BP7a!   '@4704d
    L_BP76! = L_BP7e!   '@4705c
    L_BP7a! = RT_COS##(FX##(L_BP110!)) * L_BPa2! + L_BP72!   '@4706b
    L_BP7e! = RT_SIN##(FX##(L_BP110!)) * L_BPa2! + L_BP76!   '@4708b
    GOSUB L_48212   '@470ab
    L_BP72! = L_BP7a!   '@470b8
    L_BP76! = L_BP7e!   '@470c7
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP72!   '@470d6 DS:2b5a
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@4711f DS:2b5a
    GOSUB L_48212   '@4716b
    L_BP1e6! = RT_COS##(FX##(L_BP110!)) * 0.4000000059604644775390625##   '@47178 DS:2c74
    V_11dc! = RT_SIN##(FX##(L_BP110!)) * 0.4000000059604644775390625##   '@47195 DS:2c74
    L_BP72! = FX##(L_BP16!) - L_BP1e6!   '@471b2
    L_BP76! = FX##(L_BP1a!) - V_11dc!   '@471c6
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 - L_BP1e6! - V_11dc! + L_BP16!   '@471da DS:2b5a
    L_BP7e! = L_BP1a! - RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 - V_11dc! - L_BP1e6!   '@4722d DS:2b5a
    GOSUB L_48212   '@47283
    L_BP72! = L_BP7a!   '@47290
    L_BP76! = L_BP7e!   '@4729f
    L_BP7a! = L_BP72! - RT_COS##(FX##(L_BP110!)) * L_BP9a!   '@472ae
    L_BP7e! = L_BP76! - RT_SIN##(FX##(L_BP110!)) * L_BP9a!   '@472d1
    GOSUB L_48212   '@472f4
    IF NOT (L_BP9e! > 0.0) THEN GOTO L_4743f   '@47301 DS:2b2c
    L_BP72! = L_BP7a!   '@4731c
    L_BP76! = L_BP7e!   '@4732b
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * 30.0 + L_BP72!   '@4733a DS:2c08
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * 30.0   '@4735a DS:2c08
    GOSUB L_48212   '@4737d
    L_BP72! = L_BP7a! - RT_COS##(FX##(L_BP110!)) * L_BP9e! + FX##(L_BP1e6!) * 2.0   '@4738a DS:2b5a
    L_BP76! = L_BP7e! - RT_SIN##(FX##(L_BP110!)) * L_BP9e! + 2.0 * FX##(V_11dc!)   '@473ba DS:2b5a
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * 30.0   '@473ea DS:2c08
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * 30.0 + L_BP76!   '@4740d DS:2c08
    GOSUB L_48212   '@4742d
L_4743f:
    L_BP72! = L_BP7a!   '@4743f
    L_BP76! = L_BP7e!   '@4744e
    L_BP7a! = L_BP72! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP9a! - L_BP9e!) * RT_COS##(FX##(L_BP110!)) + FX##(-(L_BP9e! = 0.0)) * 2.0 * L_BP1e6!   '@4745d DS:2b2c,2b5a
    L_BP7e! = L_BP76! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP9a! - L_BP9e!) * RT_SIN##(FX##(L_BP110!)) + FX##(-(L_BP9e! = 0.0)) * 2.0 * V_11dc!   '@474dd DS:2b2c,2b5a
    GOSUB L_48212   '@4755d
    L_BP72! = L_BP7a!   '@4756a
    L_BP76! = L_BP7e!   '@47579
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) + 2.0 * FX##(V_11dc!)   '@47588 DS:2b5a
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) - FX##(L_BP1e6!) * 2.0 + L_BP76!   '@475dc DS:2b5a
    GOSUB L_48212   '@4762d
    L_BP72! = L_BP7a!   '@4763a
    L_BP76! = L_BP7e!   '@47649
    L_BP7a! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BPa2! - L_BPa6!) * RT_COS##(FX##(L_BP110!)) + L_BP72!   '@47658
    L_BP7e! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BPa2! - L_BPa6!) * RT_SIN##(FX##(L_BP110!)) + L_BP76!   '@476aa
    GOSUB L_48212   '@476fc
    IF NOT (L_BPa6! > 0.0) THEN GOTO L_47841   '@47709 DS:2b2c
    L_BP72! = L_BP7a!   '@47724
    L_BP76! = L_BP7e!   '@47733
    L_BP7a! = L_BP72! - RT_SIN##(FX##(L_BP110!)) * 30.0   '@47742 DS:2c08
    L_BP7e! = RT_COS##(FX##(L_BP110!)) * 30.0 + L_BP76!   '@47765 DS:2c08
    GOSUB L_48212   '@47785
    L_BP72! = RT_COS##(FX##(L_BP110!)) * L_BPa6! - FX##(L_BP1e6!) * 2.0 + L_BP7a!   '@47792 DS:2b5a
    L_BP76! = RT_SIN##(FX##(L_BP110!)) * L_BPa6! - 2.0 * FX##(V_11dc!) + L_BP7e!   '@477bf DS:2b5a
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * 30.0 + L_BP72!   '@477ec DS:2c08
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * 30.0   '@4780c DS:2c08
    GOSUB L_48212   '@4782f
L_47841:
    L_BP72! = L_BP7a!   '@47841
    L_BP76! = L_BP7e!   '@47850
    L_BP7a! = RT_COS##(FX##(L_BP110!)) * L_BPa2! - FX##(-(L_BPa6! = 0.0)) * 2.0 * L_BP1e6! + L_BP72!   '@4785f DS:2b2c,2b5a
    L_BP7e! = RT_SIN##(FX##(L_BP110!)) * L_BPa2! - FX##(-(L_BPa6! = 0.0)) * 2.0 * V_11dc! + L_BP76!   '@478aa DS:2b2c,2b5a
    GOSUB L_48212   '@478f5
    L_BP72! = L_BP7a!   '@47902
    L_BP76! = L_BP7e!   '@47911
    L_BP7a! = RT_SIN##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP72!   '@47920 DS:2b5a
    L_BP7e! = L_BP76! - RT_COS##(FX##(L_BP110!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@47969 DS:2b5a
    GOSUB L_48212   '@479b5
    RETURN   '@479c2
L_479d1:   ' sub-rotina (alvo de GOSUB)
    V_11d4! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP110!)) + L_BP16!   '@479d6 DS:2b5a,2b7a
    V_11d8! = L_BP1a! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP110!))   '@47a28 DS:2b5a,2b7a
    GOSUB L_47b91   '@47a7d
    L_BP9a! = V_11c8!   '@47a8a
    L_BP9e! = V_11c4!   '@47a9b
    V_11d4! = L_BP16! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP110!))   '@47aac DS:2b5a,2b7a
    V_11d8! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP110!)) + L_BP1a!   '@47b01 DS:2b5a,2b7a
    GOSUB L_47b91   '@47b53
    L_BPa2! = V_11c8!   '@47b60
    L_BPa6! = V_11c4!   '@47b71
    RETURN   '@47b82
L_47b91:   ' sub-rotina (alvo de GOSUB)
    V_11c8! = 0.0   '@47b96 DS:2b2c
    V_11c4! = 0.0   '@47ba7 DS:2b2c
    L_BP1ea! = A_0f30%(0, 0)   '@47bb8
    FOR V_11b8! = 1.0 TO L_BP1ea!   '@47bdd DS:2b0c
    IF NOT (A_0f5e!(RT_CINT%(FX##(V_11b8!)), 1) = 0.0) THEN GOTO L_481d7   '@47be4 DS:2b2c
    L_BP1e6! = A_0f5e!(RT_CINT%(FX##(V_11b8!)), 0)   '@47c19
    V_11a4! = 0.0   '@47c43 DS:2b2c
    L_BP1ee! = A_0f30%(RT_CINT%(FX##(L_BP1e6!)), 0) - 1   '@47c54
    FOR V_11c0! = 1.0 TO L_BP1ee!   '@47c84 DS:2b0c
    V_1a94! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e6!)), RT_CINT%(FX##(V_11c0!))), 0)) * 100.0   '@47c8c DS:2bc8
    V_1a98! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e6!)), RT_CINT%(FX##(V_11c0!))), 1)) * 100.0   '@47cd5 DS:2bc8
    V_1a9c! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e6!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 0)) * 100.0   '@47d1f DS:2b0c,2bc8
    V_1aa0! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1e6!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 1)) * 100.0   '@47d6d DS:2b0c,2bc8
    IF NOT (NOT (V_1a9c! > V_11d4! AND V_1a94! > V_11d4!)) THEN GOTO L_48082   '@47dbc
    IF NOT (NOT (V_1aa0! > V_11d8! AND V_1a98! > V_11d8! OR V_1aa0! < V_11d8! AND V_1a98! < V_11d8!)) THEN GOTO L_4807d   '@47dfc
    IF NOT (V_1a98! = V_1aa0!) THEN GOTO L_47f31   '@47e72
    IF NOT ((V_1a94! >= V_11d4! AND V_1a9c! <= 2.0 OR V_1a9c! >= V_11d4! AND V_1a94! <= V_11d4!) AND V_11d8! = V_1a98!) THEN GOTO L_47f29   '@47e8d DS:2b5a
    GOTO L_480ae   '@47f1c
L_47f29:
    GOTO L_48078   '@47f29
L_47f31:
    IF NOT ((V_11d8! < V_1a98! AND V_11d8! >= V_1aa0! OR V_11d8! <= V_1aa0! AND V_11d8! > V_1a98!) AND (V_1a9c! <= V_11d4! AND V_1a94! <= V_11d4!)) THEN GOTO L_47ff9   '@47f31
    V_11a4! = FX##(V_11a4!) + 1.0   '@47fdb DS:2b0c
    GOTO L_48073   '@47ff1
L_47ff9:
    IF NOT (V_1a94! <> V_1a9c!) THEN GOTO L_4806e   '@47ff9
    IF NOT ((FX##(V_11d8!) - V_1a98!) * (FX##(V_1a9c!) - V_1a94!) / (FX##(V_1aa0!) - V_1a98!) + V_1a94! <= FX##(V_11d4!)) THEN GOTO L_48069   '@48014
    V_11a4! = FX##(V_11a4!) + 1.0   '@48053 DS:2b0c
L_48069:
L_4806e:
L_48073:
L_48078:
L_4807d:
L_48082:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@48082 DS:2b0c
L_480ae:
    IF NOT (A_0f30%(RT_CINT%(FX##(L_BP1e6!)), 0) - 1 > V_11c0! OR FX##(V_11a4!) / 2.0 <> RT_CLNG&(FX##(V_11a4!)) \ 2&) THEN GOTO L_481d2   '@480ae DS:2b5a
    V_11c8! = A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2) - (FX##(A_1200!(1, 14, 3)) + A_0f5e!(RT_CINT%(FX##(V_11b8!)), 3))   '@4812a
    V_11c4! = A_115e!(RT_CINT%(FX##(V_11b8!)), 0)   '@4819b
    GOTO L_48203   '@481c5
L_481d2:
L_481d7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@481d7 DS:2b0c
L_48203:
    RETURN   '@48203
L_48212:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04016e_FUN_4000_016e
    IF NOT (L_BPaa$ = "C") THEN GOTO L_48237   '@48217 DS:2caa
    GOTO L_4839f   '@4822f
L_48237:
    PRINT #2, 0   '@48241
    PRINT #2, "LINE"   '@48257 DS:2cb0
    PRINT #2, 8   '@4826e
    PRINT #2, L_BP46$   '@48285
    PRINT #2, 10   '@4829c
    PRINT #2, RT_SNG!(FX##(L_BP72!) + 100.0)   '@482b3 DS:2bc8
    PRINT #2, 20   '@482d9
    PRINT #2, RT_SNG!(FX##(L_BP76!) + 100.0)   '@482f0 DS:2bc8
    PRINT #2, 11   '@48316
    PRINT #2, RT_SNG!(FX##(L_BP7a!) + 100.0)   '@4832d DS:2bc8
    PRINT #2, 21   '@48353
    PRINT #2, RT_SNG!(FX##(L_BP7e!) + 100.0)   '@4836a DS:2bc8
    RETURN   '@48390
L_4839f:
    L_BP1f2! = 1.0   '@483a4 DS:2b0c
    IF NOT (L_BP46$ = "COTAS") THEN GOTO L_483dd   '@483b5 DS:2cb8
    L_BP1f2! = 2.0   '@483cc DS:2b5a
L_483dd:
    IF NOT (L_BP46$ = "FERRO") THEN GOTO L_48405   '@483dd DS:2cc2
    L_BP1f2! = 3.0   '@483f4 DS:2b8a
L_48405:
    IF NOT (L_BP46$ = "ESTRIBO") THEN GOTO L_4842d   '@48405 DS:2ccc
    L_BP1f2! = 4.0   '@4841c DS:2c40
L_4842d:
    IF NOT (L_BP46$ = "CORTE") THEN GOTO L_48455   '@4842d DS:2cd8
    L_BP1f2! = 5.0   '@48444 DS:2c38
L_48455:
    IF NOT (L_BP46$ = "TABELA") THEN GOTO L_4847d   '@48455 DS:2ce2
    L_BP1f2! = 6.0   '@4846c DS:2cec
L_4847d:
    PRINT #2, "L          1 1 1"; L_BP1f2!; RT_SNG!(FX##(L_BP72!) + 3000.0); L_BP76!; RT_SNG!(FX##(L_BP7a!) + 3000.0); L_BP7e!   '@4847d DS:2cf0,2d04
    RETURN   '@484e7
L_484f6:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BPaa$ = "C") THEN GOTO L_4851b   '@484fb DS:2caa
    GOTO L_4863d   '@48513
L_4851b:
    PRINT #2, 0   '@48525
    PRINT #2, "CIRCLE"   '@4853b DS:2d08
    PRINT #2, 8   '@48552
    PRINT #2, L_BP46$   '@48569
    PRINT #2, 10   '@48580
    PRINT #2, RT_SNG!(FX##(L_BP82!) + 100.0)   '@48597 DS:2bc8
    PRINT #2, 20   '@485be
    PRINT #2, RT_SNG!(FX##(L_BP86!) + 100.0)   '@485d5 DS:2bc8
    PRINT #2, 40   '@485fc
    PRINT #2, L_BP8a!   '@48613
    RETURN   '@4862e
L_4863d:
    L_BP1f2! = 1.0   '@48642 DS:2b0c
    IF NOT (L_BP46$ = "COTAS") THEN GOTO L_4867b   '@48653 DS:2cb8
    L_BP1f2! = 2.0   '@4866a DS:2b5a
L_4867b:
    IF NOT (L_BP46$ = "FERRO") THEN GOTO L_486a3   '@4867b DS:2cc2
    L_BP1f2! = 3.0   '@48692 DS:2b8a
L_486a3:
    IF NOT (L_BP46$ = "ESTRIBO") THEN GOTO L_486cb   '@486a3 DS:2ccc
    L_BP1f2! = 4.0   '@486ba DS:2c40
L_486cb:
    IF NOT (L_BP46$ = "CORTE") THEN GOTO L_486f3   '@486cb DS:2cd8
    L_BP1f2! = 5.0   '@486e2 DS:2c38
L_486f3:
    IF NOT (L_BP46$ = "TABELA") THEN GOTO L_4871b   '@486f3 DS:2ce2
    L_BP1f2! = 6.0   '@4870a DS:2cec
L_4871b:
    PRINT #2, "C          1 1 1"; L_BP1f2!; RT_SNG!(FX##(L_BP82!) + 3000.0); L_BP86!; L_BP8a!   '@4871b DS:2d04,2d12
    RETURN   '@48772
L_48781:   ' sub-rotina (alvo de GOSUB); entrada vinda de 04016e_FUN_4000_016e
    IF NOT (L_BPaa$ = "C") THEN GOTO L_487a6   '@48786 DS:2caa
    GOTO L_48927   '@4879e
L_487a6:
    PRINT #2, 0   '@487b0
    PRINT #2, "TEXT"   '@487c6 DS:2d26
    PRINT #2, 8   '@487dd
    PRINT #2, L_BP46$   '@487f4
    PRINT #2, 10   '@4880b
    PRINT #2, RT_SNG!(FX##(L_BP8e!) + 100.0)   '@48822 DS:2bc8
    PRINT #2, 20   '@48849
    PRINT #2, RT_SNG!(FX##(L_BP92!) + 100.0)   '@48860 DS:2bc8
    PRINT #2, 40   '@48887
    PRINT #2, L_BP96!   '@4889e
    PRINT #2, 1   '@488b9
    PRINT #2, L_BPc2$   '@488d0
    PRINT #2, 50   '@488e8
    PRINT #2, L_BPba!   '@488ff
    GOTO L_48ab5   '@4891a
L_48927:
    L_BP1f2! = 1.0   '@4892c DS:2b0c
    IF NOT (L_BP46$ = "COTAS") THEN GOTO L_48965   '@4893d DS:2cb8
    L_BP1f2! = 2.0   '@48954 DS:2b5a
L_48965:
    IF NOT (L_BP46$ = "FERRO") THEN GOTO L_4898d   '@48965 DS:2cc2
    L_BP1f2! = 3.0   '@4897c DS:2b8a
L_4898d:
    IF NOT (L_BP46$ = "ESTRIBO") THEN GOTO L_489b5   '@4898d DS:2ccc
    L_BP1f2! = 4.0   '@489a4 DS:2c40
L_489b5:
    IF NOT (L_BP46$ = "CORTE") THEN GOTO L_489dd   '@489b5 DS:2cd8
    L_BP1f2! = 5.0   '@489cc DS:2c38
L_489dd:
    IF NOT (L_BP46$ = "TABELA") THEN GOTO L_48a05   '@489dd DS:2ce2
    L_BP1f2! = 6.0   '@489f4 DS:2cec
L_48a05:
    PRINT #2, "T          1"; L_BP96!; L_BP96!; L_BP1f2!; " 1 0"; L_BPba!; RT_SNG!(FX##(L_BP8e!) + 3000.0); L_BP92!; LEN(L_BPc2$)   '@48a05 DS:2d04,2d2e,2d3e
    PRINT #2, "           "; L_BPc2$   '@48a8f DS:2d46
L_48ab5:
    L_BP1f6! = FX##(LEN(L_BPc2$) + 2) * L_BP96! + L_BP8e!   '@48aba
    CALL MIXT_082a_Maior(L_BP36!, L_BP1f6!, L_BP1fa!)   '@48ae2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP36! = L_BP1fa!   '@48af6
    RETURN   '@48b00
L_48b0f:   ' entrada vinda de 04016e_FUN_4000_016e
    ' @48b0f libera strings locais (L_BP46)
    ' @48b18 libera strings locais (L_BPc2)
    ' @48b22 libera strings locais (L_BPaa)
    ' END SUB   '@48b2c
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_FORMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
