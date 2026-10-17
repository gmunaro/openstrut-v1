' ============================================================================
'  FORMEDCA - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/FORMEDCA/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: efd337e52d0f8640083d8352a7b68e47f40ba0e072841c671bfd5dd44a46c677
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_FORMA.BI'

' ---- variaveis do FORMEDCA fora do COMMON (DS do programa)
DIM SHARED A_27d0%(0 TO 700)   ' matriz estatica de GET/PUT grafico (descritor em DS:27D0)
DIM SHARED A_3424%(0 TO 210)   ' matriz estatica de GET/PUT grafico (descritor em DS:3424)
REDIM SHARED A_2536!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1868!
DIM SHARED V_186c!
DIM SHARED V_1870%
DIM SHARED V_1872%
DIM SHARED V_1874%
DIM SHARED V_1876%
DIM SHARED V_1878!
DIM SHARED V_187c!
DIM SHARED V_1880!
DIM SHARED V_1884$
DIM SHARED V_188c!
DIM SHARED V_1890!
DIM SHARED V_1894!
DIM SHARED V_1898!
DIM SHARED V_189c%
DIM SHARED V_189e%
DIM SHARED V_18a0%
DIM SHARED V_18a2%
DIM SHARED V_18a4!
DIM SHARED V_18a8!
DIM SHARED V_18ac!
DIM SHARED V_18b0$
DIM SHARED V_18b8!
DIM SHARED V_18bc!
DIM SHARED V_18c0!
DIM SHARED V_18c4!
DIM SHARED V_18c8%
DIM SHARED V_18ca%
DIM SHARED V_18cc%
DIM SHARED V_18ce%
DIM SHARED V_18d0!
DIM SHARED V_18d4!
DIM SHARED V_18d8!
DIM SHARED V_18dc$
DIM SHARED V_18e4!
DIM SHARED V_18e8!
DIM SHARED V_18ec!
DIM SHARED V_18f0!
DIM SHARED V_18f4%
DIM SHARED V_18f6%
DIM SHARED V_18f8%
DIM SHARED V_18fa%
DIM SHARED V_18fc!
DIM SHARED V_1900!
DIM SHARED V_1904!
DIM SHARED V_1908$
DIM SHARED V_1910!
DIM SHARED V_1914!
DIM SHARED V_1918!
DIM SHARED V_191c!
DIM SHARED V_1920%
DIM SHARED V_1922%
DIM SHARED V_1924%
DIM SHARED V_1926%
DIM SHARED V_1928!
DIM SHARED V_192c!
DIM SHARED V_1930!
DIM SHARED V_1934$
DIM SHARED V_193c!
DIM SHARED V_1940!
DIM SHARED V_1944!
DIM SHARED V_1948!
DIM SHARED V_194c%
DIM SHARED V_194e%
DIM SHARED V_1950%
DIM SHARED V_1952%
DIM SHARED V_1954!
DIM SHARED V_1958!
DIM SHARED V_195c!
DIM SHARED V_1960$
DIM SHARED V_1968!
DIM SHARED V_196c!
DIM SHARED V_1970!
DIM SHARED V_1974!
DIM SHARED V_1978%
DIM SHARED V_197a%
DIM SHARED V_197c%
DIM SHARED V_197e%
DIM SHARED V_1980!
DIM SHARED V_1984!
DIM SHARED V_1988!
DIM SHARED V_198c$
DIM SHARED V_1994!
DIM SHARED V_1998!
DIM SHARED V_199c!
DIM SHARED V_19a0!
DIM SHARED V_19a4%
DIM SHARED V_19a6%
DIM SHARED V_19a8%
DIM SHARED V_19aa%
DIM SHARED V_19ac!
DIM SHARED V_19b0!
DIM SHARED V_19b4!
DIM SHARED V_19b8$
DIM SHARED V_19c0!
DIM SHARED V_19c4!
DIM SHARED V_19c8!
DIM SHARED V_19cc!
DIM SHARED V_19d0%
DIM SHARED V_19d2%
DIM SHARED V_19d4%
DIM SHARED V_19d6%
DIM SHARED V_19d8!
DIM SHARED V_19dc!
DIM SHARED V_19e0!
DIM SHARED V_19e4$
DIM SHARED V_19ec!
DIM SHARED V_19f0!
DIM SHARED V_19f4!
DIM SHARED V_19f8!
DIM SHARED V_19fc%
DIM SHARED V_19fe%
DIM SHARED V_1a00%
DIM SHARED V_1a02%
DIM SHARED V_1a04!
DIM SHARED V_1a08!
DIM SHARED V_1a0c!
DIM SHARED V_1a10$
DIM SHARED V_1a18!
DIM SHARED V_1a1c!
DIM SHARED V_1a20!
DIM SHARED V_1a24!
DIM SHARED V_1a28%
DIM SHARED V_1a2a%
DIM SHARED V_1a2c%
DIM SHARED V_1a2e%
DIM SHARED V_1a30!
DIM SHARED V_1a34!
DIM SHARED V_1a38!
DIM SHARED V_1a3c$
DIM SHARED V_1a44!
DIM SHARED V_1a48!
DIM SHARED V_1a4c!
DIM SHARED V_1a50!
DIM SHARED V_1a54%
DIM SHARED V_1a56%
DIM SHARED V_1a58%
DIM SHARED V_1a5a%
DIM SHARED V_1a5c!
DIM SHARED V_1a60!
DIM SHARED V_1a64!
DIM SHARED V_1a68$
DIM SHARED V_1a70!
DIM SHARED V_1a74!
DIM SHARED V_1a78!
DIM SHARED V_1a7c!
DIM SHARED V_1a80%
DIM SHARED V_1a82%
DIM SHARED V_1a84%
DIM SHARED V_1a86%
DIM SHARED V_1a88!
DIM SHARED V_1a8c!
DIM SHARED V_1a90!
DIM SHARED V_1a94$
DIM SHARED V_1a9c!
DIM SHARED V_1aa0!
DIM SHARED V_1aa4!
DIM SHARED V_1aa8!
DIM SHARED V_1aac%
DIM SHARED V_1aae%
DIM SHARED V_1ab0%
DIM SHARED V_1ab2%
DIM SHARED V_1ab4!
DIM SHARED V_1ab8!
DIM SHARED V_1abc!
DIM SHARED V_1ac0$
DIM SHARED V_1ace!
DIM SHARED V_1ad2!
DIM SHARED V_1ad6!
DIM SHARED V_1ada!
DIM SHARED V_1ade!
DIM SHARED V_1ae2!
DIM SHARED V_1ae6!
DIM SHARED V_1aea!
DIM SHARED V_1aee!
DIM SHARED V_1af2!
DIM SHARED V_1af6!
DIM SHARED V_1afa!
DIM SHARED V_1afe!
DIM SHARED V_1b06!
DIM SHARED V_1b0a!
DIM SHARED V_1b0e$
DIM SHARED V_1b12!
DIM SHARED V_1b16!
DIM SHARED V_1b1a!
DIM SHARED V_1b1e!
DIM SHARED V_2242!
DIM SHARED V_2246!
DIM SHARED V_224a$
DIM SHARED V_224e!
DIM SHARED V_2252!
DIM SHARED V_2256!
DIM SHARED V_225a$
DIM SHARED V_225e!
DIM SHARED V_2262!
DIM SHARED V_2266$
DIM SHARED V_226a!
DIM SHARED V_226e!
DIM SHARED V_2272!
DIM SHARED V_2276$
DIM SHARED V_227a!
DIM SHARED V_227e!
DIM SHARED V_2282!
DIM SHARED V_2286!
DIM SHARED V_228a!
DIM SHARED V_228e!
DIM SHARED V_2292!
DIM SHARED V_2296$
DIM SHARED V_229a!
DIM SHARED V_229e$
DIM SHARED V_22a2!
DIM SHARED V_22a6!
DIM SHARED V_22aa!
DIM SHARED V_22ae!
DIM SHARED V_22b2!
DIM SHARED V_22b6!
DIM SHARED V_22ba!
DIM SHARED V_22be!
DIM SHARED V_22c2!
DIM SHARED V_22c6!
DIM SHARED V_22ca!
DIM SHARED V_22ce!
DIM SHARED V_22d2$
DIM SHARED V_22d6$
DIM SHARED V_22da$
DIM SHARED V_22de!
DIM SHARED V_22e2!
DIM SHARED V_22e6!
DIM SHARED V_22ea!
DIM SHARED V_22ee!
DIM SHARED V_22f2!
DIM SHARED V_22f6!
DIM SHARED V_22fa!
DIM SHARED V_22fe!
DIM SHARED V_2302!
DIM SHARED V_2306!
DIM SHARED V_230a!
DIM SHARED V_230e!
DIM SHARED V_2312!
DIM SHARED V_2316$
DIM SHARED V_231a$
DIM SHARED V_231e$
DIM SHARED V_2322!
DIM SHARED V_2326!
DIM SHARED V_232a!
DIM SHARED V_232e!
DIM SHARED V_2332!
DIM SHARED V_2336!
DIM SHARED V_233a!
DIM SHARED V_233e!
DIM SHARED V_2342!
DIM SHARED V_2346!
DIM SHARED V_234a!
DIM SHARED V_234e!
DIM SHARED V_2352!
DIM SHARED V_2356!
DIM SHARED V_235a!
DIM SHARED V_235e!
DIM SHARED V_2362!
DIM SHARED V_2366$
DIM SHARED V_236a$
DIM SHARED V_236e$
DIM SHARED V_2372!
DIM SHARED V_2376!
DIM SHARED V_237a!
DIM SHARED V_237e!
DIM SHARED V_2382$
DIM SHARED V_2386!
DIM SHARED V_238a!
DIM SHARED V_238e!
DIM SHARED V_2392!
DIM SHARED V_2396!
DIM SHARED V_239a$
DIM SHARED V_239e!
DIM SHARED V_23a2!
DIM SHARED V_23a6!
DIM SHARED V_23aa!
DIM SHARED V_23ae!
DIM SHARED V_23b2!
DIM SHARED V_23b6!
DIM SHARED V_23ba!
DIM SHARED V_23be!
DIM SHARED V_23c2!
DIM SHARED V_23c6!
DIM SHARED V_23ca$
DIM SHARED V_23ce$
DIM SHARED V_23d2!
DIM SHARED V_23d6!
DIM SHARED V_23da!
DIM SHARED V_23de!
DIM SHARED V_23e2!
DIM SHARED V_23e6!
DIM SHARED V_23ea!
DIM SHARED V_23ee!
DIM SHARED V_23f2!
DIM SHARED V_23f6!
DIM SHARED V_23fa!
DIM SHARED V_23fe!
DIM SHARED V_2402!
DIM SHARED V_2406!
DIM SHARED V_240a!
DIM SHARED V_240e$
DIM SHARED V_2412!
DIM SHARED V_2416!
DIM SHARED V_241a!
DIM SHARED V_241e!
DIM SHARED V_2422%
DIM SHARED V_2424!
DIM SHARED V_2564%
DIM SHARED V_2566%
DIM SHARED V_2568%
DIM SHARED V_256a%
DIM SHARED V_256c%
DIM SHARED V_256e!
DIM SHARED V_2572!
DIM SHARED V_2576!
DIM SHARED V_257a!
DIM SHARED V_257e!
DIM SHARED V_2582!
DIM SHARED V_2586!
DIM SHARED V_258a!
DIM SHARED V_258e!
DIM SHARED V_2592!
DIM SHARED V_2596!
DIM SHARED V_259a!
DIM SHARED V_259e!
DIM SHARED V_25a2!
DIM SHARED V_25a6!
DIM SHARED V_25aa!
DIM SHARED V_25ae!
DIM SHARED RG_1860 AS STRING * 616   ' registro de GET/PUT # em DS:1860

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "FORMEDCA"
' ---- M_FORMEDCA @0x10030  (010030_M_FORMEDCA.lift.txt; evidence_id (assembly): ev_af1e77c08cef81d95eef8bf27854d87fc8fa745418e999ae2735a7b1a406b121)
' @10030 inicio do programa (B$?EVT)
GOTO L_10224   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10224:
V_2564% = 0   '@10224
V_2566% = 0   '@1022f
V_2568% = 0   '@1023a
V_256a% = 0   '@10245
IF NOT (V_157a$ = "FORMA") THEN GOTO L_1027a   '@10250 DS:261a
V_256c% = 1   '@10267
GOTO L_1028a   '@10272
L_1027a:
V_256c% = 0   '@1027a
L_1028a:
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1028a
V_11d4! = RT_FRE&("")   '@10299 DS:25c0
REDIM A_2536!(-32768 TO -32768, -32768 TO -32768)   '@102b3
REDIM A_2536!(0 TO CINT(A_15da!(0, 0)), 0 TO 4)   '@102c1
V_25a2! = A_1664!(1, 0)   '@102f6
V_25aa! = A_1664!(1, 0)   '@10319
V_25a6! = A_1664!(1, 1)   '@1033c
V_25ae! = A_1664!(1, 1)   '@1035d
V_2242! = A_1664!(0, 0)   '@1037e
FOR V_11b8! = 1.0 TO V_2242!   '@1039f DS:2624
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) < V_25a2!) THEN GOTO L_10404   '@103a6
V_25a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@103da
L_10404:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) < V_25a2!) THEN GOTO L_1045e   '@10404
V_25a2! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@10436
L_1045e:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) > V_25aa!) THEN GOTO L_104bc   '@1045e
V_25aa! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@10492
L_104bc:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) > V_25aa!) THEN GOTO L_10516   '@104bc
V_25aa! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@104ee
L_10516:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) < V_25a6!) THEN GOTO L_10576   '@10516
V_25a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1054b
L_10576:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) < V_25a6!) THEN GOTO L_105d6   '@10576
V_25a6! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@105ab
L_105d6:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) > V_25ae!) THEN GOTO L_10636   '@105d6
V_25ae! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@1060b
L_10636:
IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) > V_25ae!) THEN GOTO L_10696   '@10636
V_25ae! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@1066b
L_10696:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@10696 DS:2624
V_2246! = A_1692!(0, 0)   '@106c2
FOR V_11b8! = 1.0 TO V_2246!   '@106e3 DS:2624
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 0) < V_25a2!) THEN GOTO L_10748   '@106ea
V_25a2! = A_1692!(RT_CINT%(FX##(V_11b8!)), 0)   '@1071e
L_10748:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 2) < V_25a2!) THEN GOTO L_107a2   '@10748
V_25a2! = A_1692!(RT_CINT%(FX##(V_11b8!)), 2)   '@1077a
L_107a2:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 0) > V_25aa!) THEN GOTO L_10800   '@107a2
V_25aa! = A_1692!(RT_CINT%(FX##(V_11b8!)), 0)   '@107d6
L_10800:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 2) > V_25aa!) THEN GOTO L_1085a   '@10800
V_25aa! = A_1692!(RT_CINT%(FX##(V_11b8!)), 2)   '@10832
L_1085a:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 1) < V_25a6!) THEN GOTO L_108ba   '@1085a
V_25a6! = A_1692!(RT_CINT%(FX##(V_11b8!)), 1)   '@1088f
L_108ba:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 3) < V_25a6!) THEN GOTO L_1091a   '@108ba
V_25a6! = A_1692!(RT_CINT%(FX##(V_11b8!)), 3)   '@108ef
L_1091a:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 1) > V_25ae!) THEN GOTO L_1097a   '@1091a
V_25ae! = A_1692!(RT_CINT%(FX##(V_11b8!)), 1)   '@1094f
L_1097a:
IF NOT (A_1692!(RT_CINT%(FX##(V_11b8!)), 3) > V_25ae!) THEN GOTO L_109da   '@1097a
V_25ae! = A_1692!(RT_CINT%(FX##(V_11b8!)), 3)   '@109af
L_109da:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@109da DS:2624
CALL S_20182   '@10a06
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
L_10a15:   ' entrada vinda de 01f4b3_F_1f4b3, 01f4f3_F_1f4f3
GOSUB L_1f4f8   '@10a1a
L_BP0c% = (V_157a$ = "FORMINIT")   '@10a27 DS:2628
IF NOT ((V_157a$ = "VOLTAFORMINIT" OR L_BP0c%) <> 0) THEN GOTO L_10a96   '@10a4c DS:2634
V_0e0c$ = "INICIAL"   '@10a61 DS:2646
CALL S_3ac05   '@10a73
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_3beff   '@10a7d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_39a51   '@10a87
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
L_10a96:
L_10a9b:
V_2592! = INT(V_25a2! - (FX##(V_25aa!) - V_25a2!) / 20.0)   '@10aa0 DS:2652
V_2596! = INT(V_25a6! - (FX##(V_25ae!) - V_25a6!) / 20.0)   '@10aca DS:2652
V_259a! = INT((FX##(V_25aa!) - V_25a2!) / 20.0 + V_25aa!)   '@10af4 DS:2652
V_259e! = INT((FX##(V_25ae!) - V_25a6!) / 20.0 + V_25ae!)   '@10b1b DS:2652
L_10b47:
CALL S_1fa3b   '@10b4c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_2193a   '@10b56
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_212be   '@10b60
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_20f46   '@10b6a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
L_10b79:   ' entrada vinda de 01dafe_F_1dafe, 01dc96_FUN_1000_dc96, 01dddc_FUN_1000_dddc, 01df3d_FUN_1000_df3d, 01f36d_F_1f36d
RT_VIEWPRINT 23, 25   '@10b7e
RT_CLS 2   '@10b90
PRINT " <P>ilares     <V>igas    <B>orda de Laje           <R>edesenha"   '@10b9e DS:2656
PRINT " <D>etalhes    <C>otas    <T>extos    <E>levacao    <Z>oom"   '@10bac DS:269a
PRINT " <G>ravacao    <F>orma gera Vigas+Pilares                         <S>egue ..";   '@10bba DS:26d8
L_10bcd:   ' entrada vinda de 01dddc_FUN_1000_dddc
CALL MIXT_07f1_LimpaTeclado   '@10bd2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@10bdc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_224a$ = V_0e0c$   '@10bf8
IF NOT (V_224a$ <> "P") THEN GOTO L_10c33   '@10c0a DS:2728
IF NOT (V_224a$ = "p") THEN GOTO L_163b0   '@10c21 DS:272e
L_10c33:
L_10c38:
RT_VIEWPRINT 23, 25   '@10c3d
RT_CLS 2   '@10c4f
PRINT " Amarracao dos Elementos Estruturais na Forma"   '@10c5d DS:2734
PRINT " Alteracao e Visualizacao da Amarracao dos Pilares"   '@10c6b DS:2766
PRINT " Numero ou Nome do Pilar *FIM* ";   '@10c79 DS:279c
CALL MIXT_07f1_LimpaTeclado   '@10c87
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@10c91 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_10cc8   '@10cab
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@10cc0
L_10cc8:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_10d0e   '@10cc8 DS:27c0
V_11b8! = VAL(V_0e0c$)   '@10cec
GOTO L_10dde   '@10d06
L_10d0e:
V_224e! = A_15da!(0, 0)   '@10d0e
FOR V_11b8! = 1.0 TO V_224e!   '@10d2f DS:2624
IF NOT (A_15ac%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_10dad   '@10d36
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!)))))) THEN GOTO L_10da8   '@10d5d
GOTO L_10dd9   '@10da0
L_10da8:
L_10dad:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@10dad DS:2624
L_10dd9:
L_10dde:
L_BP0c% = (V_11b8! < 1.0)   '@10dde DS:2624
IF NOT ((A_15da!(0, 0) < V_11b8! OR (INT(FX##(V_11b8!)) <> FX##(V_11b8!) OR L_BP0c%)) <> 0) THEN GOTO L_10e63   '@10e09
BEEP   '@10e51
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10c38   '@10e5b
L_10e63:
L_10e68:
RT_VIEWPRINT 1, 25   '@10e6d
V_0e0c$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@10e7f
RT_GCAIXA RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582! + LEN(V_0e0c$) * 8), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_27d0%(1): RT_GFIM   '@10eb1 DS:27c8,27cc
V_2252! = (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!   '@10fe0
V_2256! = 165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@1101e DS:27c8
V_225a$ = "CGA"   '@11059 DS:27e2
CALL MIXT_08c4_TextoGrafico(V_2252!, V_2256!, V_0e0c$, V_225a$)   '@11066
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
' @1107b libera strings locais (V_225a)
V_225e! = A_15da!(RT_CINT%(FX##(V_11b8!)), 0)   '@11084
IF NOT (V_225e! = 0.0) THEN GOTO L_11135   '@110ae DS:27ea
V_1ace! = 0.0   '@110c9 DS:27ea
V_1ad2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 1)   '@110da
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@11105
GOTO L_11395   '@1112d
L_11135:
IF NOT (V_225e! = -1.0) THEN GOTO L_11221   '@11136 DS:27ee
V_1ace! = -1.0   '@1114b DS:27ee
V_1ad2! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))   '@1115c
V_1aea! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))) * 100.0)   '@1118e DS:27f2
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@111f1
GOTO L_11395   '@11219
L_11221:
IF NOT (V_225e! = -2.0) THEN GOTO L_11377   '@11222 DS:27f6
V_1ace! = -2.0   '@11237 DS:27f6
V_1ae6! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)) / 1000.0)   '@11248 DS:27fa
V_1ad2! = INT(A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)) / 1000.0) * 1000.0)   '@1127f DS:27fa
V_1aea! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))) * 100.0)   '@112e4 DS:27f2
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@11347
GOTO L_11395   '@1136f
L_11377:
IF NOT (V_225e! = -3.0) THEN GOTO L_11395   '@11378 DS:27fe
GOTO L_11395   '@1138d
L_11395:
V_2262! = A_15da!(RT_CINT%(FX##(V_11b8!)), 3)   '@11395
IF NOT (V_2262! = 0.0) THEN GOTO L_1144a   '@113c0 DS:27ea
V_1ada! = 0.0   '@113db DS:27ea
V_1ade! = A_15da!(RT_CINT%(FX##(V_11b8!)), 4)   '@113ec
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@11417
GOTO L_116b0   '@11442
L_1144a:
IF NOT (V_2262! = -1.0) THEN GOTO L_11539   '@1144b DS:27ee
V_1ada! = -1.0   '@11460 DS:27ee
V_1ade! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))   '@11471
V_1af2! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@114a3 DS:27f2
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@11506
GOTO L_116b0   '@11531
L_11539:
IF NOT (V_2262! = -2.0) THEN GOTO L_11692   '@1153a DS:27f6
V_1ada! = -2.0   '@1154f DS:27f6
V_1aee! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)) / 1000.0)   '@11560 DS:27fa
V_1ade! = INT(A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)) / 1000.0) * 1000.0)   '@11597 DS:27fa
V_1af2! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@115fc DS:27f2
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@1165f
GOTO L_116b0   '@1168a
L_11692:
IF NOT (V_2262! = -3.0) THEN GOTO L_116b0   '@11693 DS:27fe
GOTO L_116b0   '@116a8
L_116b0:
V_13aa% = 0   '@116b0
L_116c0:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_11726   '@116c0
GOTO L_11736   '@1171e
L_11726:
V_13aa% = V_13aa% + 1   '@11726
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_116c0   '@1172f
L_11736:
GOSUB L_1df4a   '@11736
LOCATE 23, 40   '@11743
CALL MIXT_07f1_LimpaTeclado   '@11761
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Altero N/*S* ", V_0e0c$   '@1176b DS:2802
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1184c   '@11785 DS:2814
RT_GPONTO RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@117a2 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10c38   '@1183f
L_1184c:
IF NOT (V_2568% = 1 OR V_2566% = 1) THEN GOTO L_11992   '@1184c
RT_VIEWPRINT 23, 25   '@11870
RT_CLS 2   '@11882
PRINT " Atencao !!!"   '@11890 DS:281a
PRINT " Existem Vigas ou Bordas de Lajes alteradas."   '@1189e DS:282a
PRINT " Acione REDESENHA para poder alterar os Pilares ";   '@118ac DS:285a
BEEP   '@118ba
CALL MIXT_07f1_LimpaTeclado   '@118c4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@118ce DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@118e8 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10c38   '@11985
L_11992:
IF NOT (A_2536!(RT_CINT%(FX##(V_11b8!)), 0) = 2.0) THEN GOTO L_11ad8   '@11992 DS:288e
RT_CLS 2   '@119c6
PRINT " Atencao !!!"   '@119d4 DS:281a
PRINT " Esta Coluna nao pode ser modificada pois ja foi alterada."   '@119e2 DS:2892
PRINT " Acione REDESENHA para poder modifica-la novamente";   '@119f0 DS:28d0
BEEP   '@119fe
CALL MIXT_07f1_LimpaTeclado   '@11a08
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@11a12
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@11a2e DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10c38   '@11acb
L_11ad8:
L_11add:
RT_VIEWPRINT 23, 25   '@11ae2
RT_CLS 2   '@11af4
PRINT " Alteracoes na amarracao do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@11b02 DS:2906
PRINT " Sentido X  -  Amarrar um vertice do Pilar por:"   '@11b39 DS:292c
PRINT " <C>oordenada   <E>ixo   outro <P>ilar   uma <V>iga   <M>antem   <R>etorna";   '@11b47 DS:2960
CALL MIXT_07f1_LimpaTeclado   '@11b55
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@11b5f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_2266$ = V_0e0c$   '@11b7b
IF NOT (V_2266$ <> "C") THEN GOTO L_11bb6   '@11b8d DS:29ae
IF NOT (V_2266$ = "c") THEN GOTO L_12539   '@11ba4 DS:29b4
L_11bb6:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_11d0e   '@11bb6
LOCATE 24, 1   '@11bf4
PRINT " Sentido X  -  Pilar com Secao Circular"; RT_TAB$(50); ""; "acione A<Enter> para Angular"; RT_TAB$(79); ""; ""   '@11c0f DS:25c0,29ba,29e6
V_11ec! = V_11b8!   '@11c53
CALL S_22ee1   '@11c64
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@11c6e
PRINT ""; RT_TAB$(79); ""; "";   '@11c89 DS:25c0
LOCATE 25, 1   '@11cb2
PRINT " Coordenada absoluta do Centro da Secao "; " X= *"; LTRIM$(STR$(V_11d4!)); "* ";   '@11ccd DS:2a06,2a32,2a3c
GOTO L_11f13   '@11d06
L_11d0e:
LOCATE 24, 1   '@11d0e
PRINT " Sentido X  -  Escolha do Vertice a ser amarrado"; RT_TAB$(79); ""; ""   '@11d29 DS:25c0,2a42
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@11d52 DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@11d7b
CALL S_22ee1   '@11d8c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_11db9   '@11d96 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@11db1
L_11db9:
LOCATE 24, 1   '@11db9
PRINT " Sentido X  -  Vertice a ser amarrado"; V_11dc!; "("; LTRIM$(STR$(A_16ee!(RT_CINT%(FX##(V_11dc!)), 0))); ")"; RT_TAB$(50); ""; "acione A<Enter> para Angular"; RT_TAB$(79); ""; ""   '@11dd4 DS:25c0,29e6,2ac4,2aee,2af4
LOCATE 25, 1   '@11e69
PRINT ""; RT_TAB$(79); ""; "";   '@11e84 DS:25c0
LOCATE 25, 1   '@11ead
PRINT " Coordenada absoluta do vertice"; V_11dc!; " X= *"; LTRIM$(STR$(V_11d4!)); "* ";   '@11ec8 DS:2a32,2a3c,2afa
L_11f13:
V_1ace! = 0.0   '@11f13 DS:27ea
V_1ad2! = V_11dc!   '@11f24
CALL MIXT_07f1_LimpaTeclado   '@11f35
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@11f3f DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_11f8a   '@11f59
V_0e0c$ = STR$(V_11d4!)   '@11f6e
L_11f8a:
IF NOT (UCASE$(V_0e0c$) = "A") THEN GOTO L_124a7   '@11f8a DS:2b1e
LOCATE 24, 50   '@11fa7
PRINT ""; RT_TAB$(79); ""; ""   '@11fc5 DS:25c0
L_11ff3:
LOCATE 25, 1   '@11ff8
PRINT ""; RT_TAB$(79); ""; "";   '@12013 DS:25c0
LOCATE 25, 1   '@1203c
PRINT " Xref , + - Dist , Angulo ou vert/hori *RETORNA* ";   '@12057 DS:2b24
RT_LINEINPUTPV "", V_0e0c$   '@12065 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1209c   '@1207f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@12094
L_1209c:
V_11d4! = VAL(V_0e0c$)   '@1209c
V_11dc! = RT_INSTR%((1), (V_0e0c$), (","))   '@120b6 DS:2b5a
V_11ec! = RT_INSTR%((RT_CINT%(FX##(V_11dc!) + 1.0)), (V_0e0c$), (","))   '@120d8 DS:2624,2b5a
IF NOT (V_11ec! = 0.0 OR V_11dc! = 0.0) THEN GOTO L_12156   '@12106 DS:27ea
BEEP   '@12144
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11ff3   '@1214e
L_12156:
V_11dc! = VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11dc!) + 1.0))))   '@12156 DS:2624
IF NOT (V_11dc! = 0.0) THEN GOTO L_121b7   '@1218a DS:27ea
BEEP   '@121a5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11ff3   '@121af
L_121b7:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_11ec!))), (V_0e0c$), ("/")) = 0) THEN GOTO L_12221   '@121b7 DS:2b60
V_11ec! = FX##(VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11ec!) + 1.0))))) * V_0e04# / 180.0#   '@121db DS:2624,2b66
GOTO L_12305   '@12219
L_12221:
V_226a! = VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11ec!) + 1.0))))   '@12221 DS:2624
V_11c0! = VAL(RT_MID2$((V_0e0c$), (RT_INSTR%((RT_CINT%(FX##(V_11ec!))), (V_0e0c$), ("/")) + 1)))   '@12255 DS:2b60
IF NOT (V_11c0! <= 0.0 OR V_226a! <= 0.0) THEN GOTO L_122e3   '@12293 DS:27ea
BEEP   '@122d1
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11ff3   '@122db
L_122e3:
V_11ec! = ATN(FX##(V_226a!) / V_11c0!)   '@122e3
L_12305:
IF NOT (FX##(V_11ec!) >= FX##(V_0e04#) / 2.0# OR V_11ec! <= 0.0) THEN GOTO L_1235a   '@12305 DS:27ea,2b6e
BEEP   '@12348
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11ff3   '@12352
L_1235a:
V_0e0c$ = STR$(RT_SNG!(FX##(RT_CINT%(RT_COS##(FX##(V_11ec!)) * 100.0 * V_11dc!)) / 100.0 + V_11d4!))   '@1235a DS:27f2
LOCATE 25, 1   '@123a2
PRINT ""; RT_TAB$(79); ""; "";   '@123bd DS:25c0
LOCATE 25, 1   '@123e6
PRINT USING " Xref #####.##   Dist #####.##  Ang ##.##     X="; RT_PU#(V_11d4!, " Xref #####.##   Dist #####.##  Ang ##.##     X=", 1); RT_PU#(V_11dc!, " Xref #####.##   Dist #####.##  Ang ##.##     X=", 2); RT_PU#(RT_DBL#(180.0 * FX##(V_11ec!) / V_0e04#), " Xref #####.##   Dist #####.##  Ang ##.##     X=", 3);   '@12401 DS:2b76,2baa
PRINT V_0e0c$; "    aceita N/*S* ";   '@1244c DS:2bae
RT_LINEINPUTPV "", V_0e10$   '@12463 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e10$) = "N") THEN GOTO L_124a2   '@1247d DS:2814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11ff3   '@1249a
L_124a2:
L_124a7:
L_BP0c% = (VAL(V_0e0c$) = 0.0#)   '@124a7 DS:27c0
L_BP0e% = LEN(V_0e0c$) > 0 AND L_BP0c%   '@124d5
IF NOT ((V_0e0c$ <> "0" AND L_BP0e%) <> 0) THEN GOTO L_12517   '@124f0 DS:2bc4
BEEP   '@12505
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@1250f
L_12517:
V_1ad6! = VAL(V_0e0c$)   '@12517
GOTO L_13c58   '@12531
L_12539:
IF NOT (V_2266$ <> "E") THEN GOTO L_1255d   '@12539 DS:2bca
IF NOT (V_2266$ = "e") THEN GOTO L_129fb   '@1254b DS:2bd0
L_1255d:
L_12562:
LOCATE 24, 1   '@12567
PRINT ""; RT_TAB$(79); ""; "";   '@12582 DS:25c0
LOCATE 25, 1   '@125ab
PRINT ""; RT_TAB$(79); ""; "";   '@125c6 DS:25c0
LOCATE 24, 1   '@125ef
PRINT " Sentido X  -  Escolha do Eixo Vertical de Referencia"; RT_TAB$(79); ""; ""   '@1260a DS:25c0,2bd6
PRINT " <S>im eixo de referencia                 <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@12633 DS:25c0,2abe,2c10
V_11e4! = 1.0   '@1265c DS:2624
CALL S_2261e   '@1266d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1269a   '@12677 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@12692
L_1269a:
LOCATE 24, 1   '@1269a
PRINT " Sentido X  -  Eixo Referencia "; V_0e14$; "("; LTRIM$(STR$(V_11d4!)); ")"; RT_TAB$(79); ""; "";   '@126b5 DS:25c0,2aee,2af4,2c62
V_1ad2! = V_11dc!   '@12712
V_1af6! = V_11d4!   '@12723
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_12839   '@12734
V_11ec! = V_11b8!   '@12772
CALL S_22ee1   '@12783
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@1278d
PRINT ""; RT_TAB$(79); ""; "";   '@127a8 DS:25c0
LOCATE 25, 1   '@127d1
PRINT " Distancia relativa do eixo ao Centro da secao"; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@127ec DS:2a32,2a3c,2c86
GOTO L_12956   '@12831
L_12839:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@12839 DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@12862
CALL S_22ee1   '@12873
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_128a0   '@1287d DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12562   '@12898
L_128a0:
LOCATE 25, 1   '@128a0
PRINT ""; RT_TAB$(79); ""; "";   '@128bb DS:25c0
LOCATE 25, 1   '@128e4
PRINT " Distancia relativa do eixo ao vertice "; V_11dc!; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@128ff DS:2a32,2a3c,2cb8
L_12956:
V_1ace! = -1.0   '@12956 DS:27ee
V_1aea! = V_11dc!   '@12967
CALL MIXT_07f1_LimpaTeclado   '@12978
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@12982 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_129d9   '@1299c
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))   '@129b1
L_129d9:
V_1ad6! = VAL(V_0e0c$)   '@129d9
GOTO L_13c58   '@129f3
L_129fb:
IF NOT (V_2266$ <> "P") THEN GOTO L_12a1f   '@129fb DS:2728
IF NOT (V_2266$ = "p") THEN GOTO L_1336e   '@12a0d DS:272e
L_12a1f:
L_12a24:
LOCATE 24, 1   '@12a29
PRINT ""; RT_TAB$(79); ""; "";   '@12a44 DS:25c0
LOCATE 25, 1   '@12a6d
PRINT ""; RT_TAB$(79); ""; "";   '@12a88 DS:25c0
LOCATE 24, 1   '@12ab1
PRINT " Numero ou Nome do Pilar que servira de Referencia *FIM* ";   '@12acc DS:2ce4
CALL MIXT_07f1_LimpaTeclado   '@12ada
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@12ae4 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_12b1b   '@12afe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@12b13
L_12b1b:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_12b61   '@12b1b DS:27c0
V_11e0! = VAL(V_0e0c$)   '@12b3f
GOTO L_12c32   '@12b59
L_12b61:
V_226e! = A_15da!(0, 0)   '@12b61
FOR V_11e0! = 1.0 TO V_226e!   '@12b82 DS:2624
IF NOT (A_15ac%(RT_CINT%(FX##(V_11e0!))) > 0) THEN GOTO L_12c01   '@12b8a
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))))) THEN GOTO L_12bfc   '@12bb1
GOTO L_12c2d   '@12bf4
L_12bfc:
L_12c01:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11e0!   '@12c01 DS:2624
L_12c2d:
L_12c32:
L_BP0c% = (V_11e0! < 1.0)   '@12c32 DS:2624
IF NOT ((A_15da!(0, 0) < V_11e0! OR (INT(FX##(V_11e0!)) <> FX##(V_11e0!) OR L_BP0c%)) <> 0) THEN GOTO L_12cb7   '@12c5d
BEEP   '@12ca5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12a24   '@12caf
L_12cb7:
IF NOT (A_2536!(RT_CINT%(FX##(V_11e0!)), 0) = 2.0) THEN GOTO L_12d95   '@12cb7 DS:288e
LOCATE 24, 1   '@12ceb
PRINT " Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada."; RT_TAB$(79); ""; ""   '@12d06 DS:25c0,2d22
PRINT " Acione REDESENHA para poder utiliza-la"; RT_TAB$(79); ""; "";   '@12d2f DS:25c0,2d6a
BEEP   '@12d58
CALL MIXT_07f1_LimpaTeclado   '@12d62
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@12d6c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12a24   '@12d88
L_12d95:
V_13aa% = 0   '@12d95
L_12da6:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_12e0c   '@12da6
GOTO L_12e1c   '@12e04
L_12e0c:
V_13aa% = V_13aa% + 1   '@12e0c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12da6   '@12e15
L_12e1c:
V_1ace! = -2.0   '@12e1c DS:27f6
V_1ad2! = V_11e0!   '@12e2d
L_12e43:
LOCATE 25, 1   '@12e48
PRINT ""; RT_TAB$(79); ""; "";   '@12e63 DS:25c0
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 6) = 2) THEN GOTO L_12f63   '@12e8c
LOCATE 24, 1   '@12eca
PRINT " Sentido X  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " Centro da Secao"; RT_TAB$(79); ""; ""   '@12ee5 DS:25c0,2d96,2dba
V_11ec! = V_11e0!   '@12f40
CALL S_22ee1   '@12f51
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_13096   '@12f5b
L_12f63:
LOCATE 24, 1   '@12f63
PRINT " Sentido X  -  Escolha do Vertice de Referencia"; RT_TAB$(79); ""; ""   '@12f7e DS:25c0,2dce
PRINT " <S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@12fa7 DS:25c0,2abe,2e02
V_11ec! = V_11e0!   '@12fd0
CALL S_22ee1   '@12fe1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1300e   '@12feb DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12a24   '@13006
L_1300e:
LOCATE 24, 1   '@1300e
PRINT " Sentido X  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " vertice"; V_11dc!; RT_TAB$(79); ""; ""   '@13029 DS:25c0,2d96,2e4a
L_13096:
V_1ae6! = V_11dc!   '@13096
V_1af6! = V_11d4!   '@130a7
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_131bd   '@130b8
V_11ec! = V_11b8!   '@130f6
CALL S_22ee1   '@13107
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@13111
PRINT ""; RT_TAB$(79); ""; "";   '@1312c DS:25c0
LOCATE 25, 1   '@13155
PRINT " Distancia relativa da referencia ao Centro da Secao "; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@13170 DS:2a32,2a3c,2e56
GOTO L_132da   '@131b5
L_131bd:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@131bd DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@131e6
CALL S_22ee1   '@131f7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_13224   '@13201 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_12e43   '@1321c
L_13224:
LOCATE 25, 1   '@13224
PRINT ""; RT_TAB$(79); ""; "";   '@1323f DS:25c0
LOCATE 25, 1   '@13268
PRINT " Distancia relativa da referencia ao vertice"; V_11dc!; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@13283 DS:2a32,2a3c,2e90
L_132da:
V_1aea! = V_11dc!   '@132da
CALL MIXT_07f1_LimpaTeclado   '@132eb
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@132f5 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1334c   '@1330f
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))   '@13324
L_1334c:
V_1ad6! = VAL(V_0e0c$)   '@1334c
GOTO L_13c58   '@13366
L_1336e:
IF NOT (V_2266$ <> "V") THEN GOTO L_13392   '@1336e DS:2ec0
IF NOT (V_2266$ = "v") THEN GOTO L_13835   '@13380 DS:2ec6
L_13392:
L_13397:
LOCATE 24, 1   '@1339c
PRINT ""; RT_TAB$(79); ""; "";   '@133b7 DS:25c0
LOCATE 25, 1   '@133e0
PRINT ""; RT_TAB$(79); ""; "";   '@133fb DS:25c0
LOCATE 24, 1   '@13424
PRINT " Sentido X  -  Escolha da Viga de Referencia"; RT_TAB$(79); ""; ""   '@1343f DS:25c0,2ecc
PRINT " <S>im Viga de referencia                 <*P*>roxima   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@13468 DS:25c0,2abe,2efc
V_11ec! = V_11b8!   '@13491
V_11e4! = 0.0   '@134a2 DS:27ea
CALL S_23d3c   '@134b3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_134e0   '@134bd DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@134d8
L_134e0:
LOCATE 24, 1   '@134e0
PRINT " Sentido X  -  Viga Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d4!)); ")"; RT_TAB$(79); ""; "";   '@134fb DS:25c0,2aee,2af4,2f4e
V_1af6! = V_11d4!   '@13558
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1366e   '@13569
V_11ec! = V_11b8!   '@135a7
CALL S_22ee1   '@135b8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@135c2
PRINT ""; RT_TAB$(79); ""; "";   '@135dd DS:25c0
LOCATE 25, 1   '@13606
PRINT " Distancia relativa da Viga ao Centro da secao"; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@13621 DS:2a32,2a3c,2f72
GOTO L_1378b   '@13666
L_1366e:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1366e DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@13697
CALL S_22ee1   '@136a8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_136d5   '@136b2 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13397   '@136cd
L_136d5:
LOCATE 25, 1   '@136d5
PRINT ""; RT_TAB$(79); ""; "";   '@136f0 DS:25c0
LOCATE 25, 1   '@13719
PRINT " Distancia relativa da Viga ao vertice "; V_11dc!; " X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))); "* ";   '@13734 DS:2a32,2a3c,2fa4
L_1378b:
V_1ace! = 0.0   '@1378b DS:27ea
V_1ad2! = V_11dc!   '@1379c
CALL MIXT_07f1_LimpaTeclado   '@137ad
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@137b7 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1380e   '@137d1
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d4!) - V_1af6!))   '@137e6
L_1380e:
V_1ad6! = FX##(V_1af6!) + VAL(V_0e0c$)   '@1380e
GOTO L_13c58   '@1382d
L_13835:
IF NOT (V_2266$ <> "M") THEN GOTO L_13859   '@13835 DS:2fd0
IF NOT (V_2266$ = "m") THEN GOTO L_13b7a   '@13847 DS:2fd6
L_13859:
V_2272! = A_15da!(RT_CINT%(FX##(V_11b8!)), 0)   '@13859
IF NOT (V_2272! = 0.0) THEN GOTO L_1390a   '@13883 DS:27ea
V_1ace! = 0.0   '@1389e DS:27ea
V_1ad2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 1)   '@138af
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@138da
GOTO L_13b6a   '@13902
L_1390a:
IF NOT (V_2272! = -1.0) THEN GOTO L_139f6   '@1390b DS:27ee
V_1ace! = -1.0   '@13920 DS:27ee
V_1ad2! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))   '@13931
V_1aea! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))) * 100.0)   '@13963 DS:27f2
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@139c6
GOTO L_13b6a   '@139ee
L_139f6:
IF NOT (V_2272! = -2.0) THEN GOTO L_13b4c   '@139f7 DS:27f6
V_1ace! = -2.0   '@13a0c DS:27f6
V_1ae6! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)) / 1000.0)   '@13a1d DS:27fa
V_1ad2! = INT(A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)) / 1000.0) * 1000.0)   '@13a54 DS:27fa
V_1aea! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 1)))) * 100.0)   '@13ab9 DS:27f2
V_1ad6! = A_15da!(RT_CINT%(FX##(V_11b8!)), 2)   '@13b1c
GOTO L_13b6a   '@13b44
L_13b4c:
IF NOT (V_2272! = -3.0) THEN GOTO L_13b6a   '@13b4d DS:27fe
GOTO L_13b6a   '@13b62
L_13b6a:
GOTO L_13c5d   '@13b6a
L_13b7a:
IF NOT (V_2266$ <> "R") THEN GOTO L_13b9e   '@13b7a DS:2fdc
IF NOT (V_2266$ = "r") THEN GOTO L_13c4b   '@13b8c DS:2fe2
L_13b9e:
RT_GPONTO RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@13b9e DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10e68   '@13c3b
L_13c4b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@13c4b
L_13c58:
L_13c5d:
RT_VIEWPRINT 23, 25   '@13c62
RT_CLS 2   '@13c74
PRINT " Alteracoes na amarracao do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@13c82 DS:2906
PRINT " Sentido Y  -  Amarrar um vertice do Pilar por:"   '@13cb9 DS:2fe8
PRINT " <C>oordenada   <E>ixo   outro <P>ilar   uma <V>iga   <M>antem   <R>etorna";   '@13cc7 DS:2960
CALL MIXT_07f1_LimpaTeclado   '@13cd5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@13cdf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_2276$ = V_0e0c$   '@13cfb
IF NOT (V_2276$ <> "C") THEN GOTO L_13d36   '@13d0d DS:29ae
IF NOT (V_2276$ = "c") THEN GOTO L_146ba   '@13d24 DS:29b4
L_13d36:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_13e8e   '@13d36
LOCATE 24, 1   '@13d74
PRINT " Sentido Y  -  Pilar com Secao Circular"; RT_TAB$(50); ""; "acione A<Enter> para Angular"; RT_TAB$(79); ""; ""   '@13d8f DS:25c0,29e6,301c
V_11ec! = V_11b8!   '@13dd3
CALL S_22ee1   '@13de4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@13dee
PRINT ""; RT_TAB$(79); ""; "";   '@13e09 DS:25c0
LOCATE 25, 1   '@13e32
PRINT " Coordenada absoluta do Centro da Secao "; " Y= *"; LTRIM$(STR$(V_11d8!)); "* ";   '@13e4d DS:2a06,2a3c,3048
GOTO L_14094   '@13e86
L_13e8e:
LOCATE 24, 1   '@13e8e
PRINT " Sentido Y  -  Escolha do Vertice a ser amarrado"; RT_TAB$(79); ""; ""   '@13ea9 DS:25c0,3052
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@13ed2 DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@13efb
CALL S_22ee1   '@13f0c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_13f39   '@13f16 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@13f31
L_13f39:
LOCATE 24, 1   '@13f39
PRINT " Sentido Y  -  Vertice a ser amarrado"; V_11dc!; "("; LTRIM$(STR$(A_16ee!(RT_CINT%(FX##(V_11dc!)), 1))); ")"; RT_TAB$(50); ""; "acione A<Enter> para Angular"; RT_TAB$(79); ""; ""   '@13f54 DS:25c0,29e6,2aee,2af4,3086
LOCATE 25, 1   '@13fea
PRINT ""; RT_TAB$(79); ""; "";   '@14005 DS:25c0
LOCATE 25, 1   '@1402e
PRINT " Coordenada absoluta do vertice"; V_11dc!; " Y= *"; LTRIM$(STR$(V_11d8!)); "* ";   '@14049 DS:2a3c,2afa,3048
L_14094:
V_1ada! = 0.0   '@14094 DS:27ea
V_1ade! = V_11dc!   '@140a5
CALL MIXT_07f1_LimpaTeclado   '@140b6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@140c0 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1410b   '@140da
V_0e0c$ = STR$(V_11d8!)   '@140ef
L_1410b:
IF NOT (UCASE$(V_0e0c$) = "A") THEN GOTO L_14628   '@1410b DS:2b1e
LOCATE 24, 50   '@14128
PRINT ""; RT_TAB$(79); ""; ""   '@14146 DS:25c0
L_14174:
LOCATE 25, 1   '@14179
PRINT ""; RT_TAB$(79); ""; "";   '@14194 DS:25c0
LOCATE 25, 1   '@141bd
PRINT " Yref , + - Dist , Angulo ou hori/vert *RETORNA* ";   '@141d8 DS:30b0
RT_LINEINPUTPV "", V_0e0c$   '@141e6 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1421d   '@14200
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@14215
L_1421d:
V_11d8! = VAL(V_0e0c$)   '@1421d
V_11dc! = RT_INSTR%((1), (V_0e0c$), (","))   '@14237 DS:2b5a
V_11ec! = RT_INSTR%((RT_CINT%(FX##(V_11dc!) + 1.0)), (V_0e0c$), (","))   '@14259 DS:2624,2b5a
IF NOT (V_11ec! = 0.0 OR V_11dc! = 0.0) THEN GOTO L_142d7   '@14287 DS:27ea
BEEP   '@142c5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14174   '@142cf
L_142d7:
V_11dc! = VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11dc!) + 1.0))))   '@142d7 DS:2624
IF NOT (V_11dc! = 0.0) THEN GOTO L_14338   '@1430b DS:27ea
BEEP   '@14326
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14174   '@14330
L_14338:
IF NOT (RT_INSTR%((RT_CINT%(FX##(V_11ec!))), (V_0e0c$), ("/")) = 0) THEN GOTO L_143a2   '@14338 DS:2b60
V_11ec! = FX##(VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11ec!) + 1.0))))) * V_0e04# / 180.0#   '@1435c DS:2624,2b66
GOTO L_14486   '@1439a
L_143a2:
V_226a! = VAL(RT_MID2$((V_0e0c$), (RT_CINT%(FX##(V_11ec!) + 1.0))))   '@143a2 DS:2624
V_11c0! = VAL(RT_MID2$((V_0e0c$), (RT_INSTR%((RT_CINT%(FX##(V_11ec!))), (V_0e0c$), ("/")) + 1)))   '@143d6 DS:2b60
IF NOT (V_11c0! <= 0.0 OR V_226a! <= 0.0) THEN GOTO L_14464   '@14414 DS:27ea
BEEP   '@14452
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14174   '@1445c
L_14464:
V_11ec! = ATN(FX##(V_226a!) / V_11c0!)   '@14464
L_14486:
IF NOT (FX##(V_11ec!) >= FX##(V_0e04#) / 2.0# OR V_11ec! <= 0.0) THEN GOTO L_144db   '@14486 DS:27ea,2b6e
BEEP   '@144c9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14174   '@144d3
L_144db:
V_0e0c$ = STR$(RT_SNG!(FX##(RT_CINT%(RT_COS##(FX##(V_11ec!)) * 100.0 * V_11dc!)) / 100.0 + V_11d8!))   '@144db DS:27f2
LOCATE 25, 1   '@14523
PRINT ""; RT_TAB$(79); ""; "";   '@1453e DS:25c0
LOCATE 25, 1   '@14567
PRINT USING " Yref #####.##   Dist #####.##  Ang ##.##     Y="; RT_PU#(V_11d8!, " Yref #####.##   Dist #####.##  Ang ##.##     Y=", 1); RT_PU#(V_11dc!, " Yref #####.##   Dist #####.##  Ang ##.##     Y=", 2); RT_PU#(RT_DBL#(180.0 * FX##(V_11ec!) / V_0e04#), " Yref #####.##   Dist #####.##  Ang ##.##     Y=", 3);   '@14582 DS:2baa,30e6
PRINT V_0e0c$; "    aceita N/*S* ";   '@145cd DS:2bae
RT_LINEINPUTPV "", V_0e10$   '@145e4 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e10$) = "N") THEN GOTO L_14623   '@145fe DS:2814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14174   '@1461b
L_14623:
L_14628:
L_BP0c% = (VAL(V_0e0c$) = 0.0#)   '@14628 DS:27c0
L_BP0e% = LEN(V_0e0c$) > 0 AND L_BP0c%   '@14656
IF NOT ((V_0e0c$ <> "0" AND L_BP0e%) <> 0) THEN GOTO L_14698   '@14671 DS:2bc4
BEEP   '@14686
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@14690
L_14698:
V_1ae2! = VAL(V_0e0c$)   '@14698
GOTO L_15d15   '@146b2
L_146ba:
IF NOT (V_2276$ <> "E") THEN GOTO L_146de   '@146ba DS:2bca
IF NOT (V_2276$ = "e") THEN GOTO L_14b7c   '@146cc DS:2bd0
L_146de:
L_146e3:
LOCATE 24, 1   '@146e8
PRINT ""; RT_TAB$(79); ""; "";   '@14703 DS:25c0
LOCATE 25, 1   '@1472c
PRINT ""; RT_TAB$(79); ""; "";   '@14747 DS:25c0
LOCATE 24, 1   '@14770
PRINT " Sentido Y  -  Escolha do Eixo Horizontal de Referencia"; RT_TAB$(79); ""; ""   '@1478b DS:25c0,311a
PRINT " <S>im eixo de referencia                 <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@147b4 DS:25c0,2abe,2c10
V_11e4! = 0.0   '@147dd DS:27ea
CALL S_2261e   '@147ee
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1481b   '@147f8 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@14813
L_1481b:
LOCATE 24, 1   '@1481b
PRINT " Sentido Y  -  Eixo Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d8!)); ")"; RT_TAB$(79); ""; "";   '@14836 DS:25c0,2aee,2af4,3156
V_1ade! = V_11dc!   '@14893
V_1afa! = V_11d8!   '@148a4
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_149ba   '@148b5
V_11ec! = V_11b8!   '@148f3
CALL S_22ee1   '@14904
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@1490e
PRINT ""; RT_TAB$(79); ""; "";   '@14929 DS:25c0
LOCATE 25, 1   '@14952
PRINT " Distancia relativa do eixo ao Centro da secao"; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@1496d DS:2a3c,2c86,3048
GOTO L_14ad7   '@149b2
L_149ba:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@149ba DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@149e3
CALL S_22ee1   '@149f4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_14a21   '@149fe DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_146e3   '@14a19
L_14a21:
LOCATE 25, 1   '@14a21
PRINT ""; RT_TAB$(79); ""; "";   '@14a3c DS:25c0
LOCATE 25, 1   '@14a65
PRINT " Distancia relativa do eixo ao vertice "; V_11dc!; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@14a80 DS:2a3c,2cb8,3048
L_14ad7:
V_1ada! = -1.0   '@14ad7 DS:27ee
V_1af2! = V_11dc!   '@14ae8
CALL MIXT_07f1_LimpaTeclado   '@14af9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@14b03 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_14b5a   '@14b1d
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))   '@14b32
L_14b5a:
V_1ae2! = VAL(V_0e0c$)   '@14b5a
GOTO L_15d15   '@14b74
L_14b7c:
IF NOT (V_2276$ <> "P") THEN GOTO L_14ba0   '@14b7c DS:2728
IF NOT (V_2276$ = "p") THEN GOTO L_154be   '@14b8e DS:272e
L_14ba0:
L_14ba5:
LOCATE 24, 1   '@14baa
PRINT ""; RT_TAB$(79); ""; "";   '@14bc5 DS:25c0
LOCATE 25, 1   '@14bee
PRINT ""; RT_TAB$(79); ""; "";   '@14c09 DS:25c0
LOCATE 24, 1   '@14c32
PRINT " Numero ou Nome do Pilar que servira de Referencia *FIM* ";   '@14c4d DS:2ce4
CALL MIXT_07f1_LimpaTeclado   '@14c5b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@14c65 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_14c9c   '@14c7f
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@14c94
L_14c9c:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_14ce2   '@14c9c DS:27c0
V_11e0! = VAL(V_0e0c$)   '@14cc0
GOTO L_14d83   '@14cda
L_14ce2:
V_227a! = A_15da!(0, 0)   '@14ce2
FOR V_11e0! = 1.0 TO V_227a!   '@14d03 DS:2624
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))))) THEN GOTO L_14d55   '@14d0a
GOTO L_14d7e   '@14d4d
L_14d55:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11e0!   '@14d55 DS:2624
L_14d7e:
L_14d83:
L_BP0c% = (V_11e0! < 1.0)   '@14d83 DS:2624
IF NOT ((A_15da!(0, 0) < V_11e0! OR (INT(FX##(V_11e0!)) <> FX##(V_11e0!) OR L_BP0c%)) <> 0) THEN GOTO L_14e08   '@14dae
BEEP   '@14df6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14ba5   '@14e00
L_14e08:
IF NOT (A_2536!(RT_CINT%(FX##(V_11e0!)), 0) = 2.0) THEN GOTO L_14ee6   '@14e08 DS:288e
LOCATE 24, 1   '@14e3c
PRINT " Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada."; RT_TAB$(79); ""; ""   '@14e57 DS:25c0,2d22
PRINT " Acione REDESENHA para poder utiliza-la"; RT_TAB$(79); ""; "";   '@14e80 DS:25c0,2d6a
BEEP   '@14ea9
CALL MIXT_07f1_LimpaTeclado   '@14eb3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@14ebd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14ba5   '@14ed9
L_14ee6:
V_13aa% = 0   '@14ee6
L_14ef6:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_14f5c   '@14ef6
GOTO L_14f6c   '@14f54
L_14f5c:
V_13aa% = V_13aa% + 1   '@14f5c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14ef6   '@14f65
L_14f6c:
V_1ada! = -2.0   '@14f6c DS:27f6
V_1ade! = V_11e0!   '@14f7d
L_14f93:
LOCATE 25, 1   '@14f98
PRINT ""; RT_TAB$(79); ""; "";   '@14fb3 DS:25c0
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 6) = 2) THEN GOTO L_150b3   '@14fdc
LOCATE 24, 1   '@1501a
PRINT " Sentido Y  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " Centro da Secao"; RT_TAB$(79); ""; ""   '@15035 DS:25c0,2dba,317a
V_11ec! = V_11e0!   '@15090
CALL S_22ee1   '@150a1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_151e6   '@150ab
L_150b3:
LOCATE 24, 1   '@150b3
PRINT " Sentido Y  -  Escolha do Vertice de Referencia"; RT_TAB$(79); ""; ""   '@150ce DS:25c0,319e
PRINT " <S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@150f7 DS:25c0,2abe,2e02
V_11ec! = V_11e0!   '@15120
CALL S_22ee1   '@15131
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1515e   '@1513b DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14ba5   '@15156
L_1515e:
LOCATE 24, 1   '@1515e
PRINT " Sentido Y  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " vertice"; V_11dc!; RT_TAB$(79); ""; ""   '@15179 DS:25c0,2e4a,317a
L_151e6:
V_1aee! = V_11dc!   '@151e6
V_1afa! = V_11d8!   '@151f7
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1530d   '@15208
V_11ec! = V_11b8!   '@15246
CALL S_22ee1   '@15257
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@15261
PRINT ""; RT_TAB$(79); ""; "";   '@1527c DS:25c0
LOCATE 25, 1   '@152a5
PRINT " Distancia relativa da referencia ao Centro da Secao "; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@152c0 DS:2a3c,2e56,3048
GOTO L_1542a   '@15305
L_1530d:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1530d DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@15336
CALL S_22ee1   '@15347
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_15374   '@15351 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_14f93   '@1536c
L_15374:
LOCATE 25, 1   '@15374
PRINT ""; RT_TAB$(79); ""; "";   '@1538f DS:25c0
LOCATE 25, 1   '@153b8
PRINT " Distancia relativa da referencia ao vertice"; V_11dc!; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@153d3 DS:2a3c,2e90,3048
L_1542a:
V_1af2! = V_11dc!   '@1542a
CALL MIXT_07f1_LimpaTeclado   '@1543b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@15445 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1549c   '@1545f
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))   '@15474
L_1549c:
V_1ae2! = VAL(V_0e0c$)   '@1549c
GOTO L_15d15   '@154b6
L_154be:
IF NOT (V_2276$ <> "V") THEN GOTO L_154e2   '@154be DS:2ec0
IF NOT (V_2276$ = "v") THEN GOTO L_15985   '@154d0 DS:2ec6
L_154e2:
L_154e7:
LOCATE 24, 1   '@154ec
PRINT ""; RT_TAB$(79); ""; "";   '@15507 DS:25c0
LOCATE 25, 1   '@15530
PRINT ""; RT_TAB$(79); ""; "";   '@1554b DS:25c0
LOCATE 24, 1   '@15574
PRINT " Sentido Y  -  Escolha da Viga de Referencia"; RT_TAB$(79); ""; ""   '@1558f DS:25c0,31d2
PRINT " <S>im Viga de referencia                 <*P*>roxima   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@155b8 DS:25c0,2abe,2efc
V_11ec! = V_11b8!   '@155e1
V_11e4! = 1.0   '@155f2 DS:2624
CALL S_23d3c   '@15603
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_15630   '@1560d DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@15628
L_15630:
LOCATE 24, 1   '@15630
PRINT " Sentido Y  -  Viga Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d8!)); ")"; RT_TAB$(79); ""; "";   '@1564b DS:25c0,2aee,2af4,3202
V_1afa! = V_11d8!   '@156a8
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_157be   '@156b9
V_11ec! = V_11b8!   '@156f7
CALL S_22ee1   '@15708
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@15712
PRINT ""; RT_TAB$(79); ""; "";   '@1572d DS:25c0
LOCATE 25, 1   '@15756
PRINT " Distancia relativa da Viga ao Centro da secao"; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@15771 DS:2a3c,2f72,3048
GOTO L_158db   '@157b6
L_157be:
PRINT " <S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@157be DS:25c0,2a76,2abe
V_11ec! = V_11b8!   '@157e7
CALL S_22ee1   '@157f8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_15825   '@15802 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_154e7   '@1581d
L_15825:
LOCATE 25, 1   '@15825
PRINT ""; RT_TAB$(79); ""; "";   '@15840 DS:25c0
LOCATE 25, 1   '@15869
PRINT " Distancia relativa da Viga ao vertice "; V_11dc!; " Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))); "* ";   '@15884 DS:2a3c,2fa4,3048
L_158db:
V_1ada! = 0.0   '@158db DS:27ea
V_1ade! = V_11dc!   '@158ec
CALL MIXT_07f1_LimpaTeclado   '@158fd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@15907 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1595e   '@15921
V_0e0c$ = STR$(RT_SNG!(FX##(V_11d8!) - V_1afa!))   '@15936
L_1595e:
V_1ae2! = FX##(V_1afa!) + VAL(V_0e0c$)   '@1595e
GOTO L_15d15   '@1597d
L_15985:
IF NOT (V_2276$ <> "M") THEN GOTO L_159a9   '@15985 DS:2fd0
IF NOT (V_2276$ = "m") THEN GOTO L_15cd4   '@15997 DS:2fd6
L_159a9:
V_227e! = A_15da!(RT_CINT%(FX##(V_11b8!)), 3)   '@159a9
IF NOT (V_227e! = 0.0) THEN GOTO L_15a5e   '@159d4 DS:27ea
V_1ada! = 0.0   '@159ef DS:27ea
V_1ade! = A_15da!(RT_CINT%(FX##(V_11b8!)), 4)   '@15a00
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@15a2b
GOTO L_15cc4   '@15a56
L_15a5e:
IF NOT (V_227e! = -1.0) THEN GOTO L_15b4d   '@15a5f DS:27ee
V_1ada! = -1.0   '@15a74 DS:27ee
V_1ade! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))   '@15a85
V_1af2! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@15ab7 DS:27f2
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@15b1a
GOTO L_15cc4   '@15b45
L_15b4d:
IF NOT (V_227e! = -2.0) THEN GOTO L_15ca6   '@15b4e DS:27f6
V_1ada! = -2.0   '@15b63 DS:27f6
V_1aee! = INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)) / 1000.0)   '@15b74 DS:27fa
V_1ade! = INT(A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)) / 1000.0) * 1000.0)   '@15bab DS:27fa
V_1af2! = RT_CINT%((A_15da!(RT_CINT%(FX##(V_11b8!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11b8!)), 4)))) * 100.0)   '@15c10 DS:27f2
V_1ae2! = A_15da!(RT_CINT%(FX##(V_11b8!)), 5)   '@15c73
GOTO L_15cc4   '@15c9e
L_15ca6:
IF NOT (V_227e! = -3.0) THEN GOTO L_15cc4   '@15ca7 DS:27fe
GOTO L_15cc4   '@15cbc
L_15cc4:
GOTO L_15d1a   '@15cc4
L_15cd4:
IF NOT (V_2276$ <> "R") THEN GOTO L_15cf8   '@15cd4 DS:2fdc
IF NOT (V_2276$ = "r") THEN GOTO L_15d08   '@15ce6 DS:2fe2
L_15cf8:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_11add   '@15cf8
L_15d08:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_13c5d   '@15d08
L_15d15:
L_15d1a:
GOSUB L_1df4a   '@15d1f
LOCATE 23, 40   '@15d2c
CALL MIXT_07f1_LimpaTeclado   '@15d4a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Corfirme Alteracao N/*S* ", V_0e0c$   '@15d54 DS:3226
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@15d6e DS:27c8,27cc
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_15e30   '@15e0b DS:2814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10e68   '@15e28
L_15e30:
V_2282! = V_1ace!   '@15e30
IF NOT (V_2282! = 0.0) THEN GOTO L_15ee1   '@15e41 DS:27ea
A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0   '@15e5c DS:27ea
A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = V_1ad2!   '@15e86
A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = V_1ad6!   '@15eb1
GOTO L_16056   '@15ed9
L_15ee1:
IF NOT (V_2282! = -1.0) THEN GOTO L_15f86   '@15ee2 DS:27ee
A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = -1.0   '@15ef7 DS:27ee
A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = FX##(V_1aea!) / 100.0 + V_1ad2!   '@15f21 DS:27f2
A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = V_1ad6!   '@15f56
GOTO L_16056   '@15f7e
L_15f86:
IF NOT (V_2282! = -2.0) THEN GOTO L_16038   '@15f87 DS:27f6
A_15da!(RT_CINT%(FX##(V_11b8!)), 0) = -2.0   '@15f9c DS:27f6
A_15da!(RT_CINT%(FX##(V_11b8!)), 1) = 1000.0 * FX##(V_1ae6!) + V_1ad2! + FX##(V_1aea!) / 100.0   '@15fc6 DS:27f2,27fa
A_15da!(RT_CINT%(FX##(V_11b8!)), 2) = V_1ad6!   '@16008
GOTO L_16056   '@16030
L_16038:
IF NOT (V_2282! = -3.0) THEN GOTO L_16056   '@16039 DS:27fe
GOTO L_16056   '@1604e
L_16056:
V_2286! = V_1ada!   '@16056
IF NOT (V_2286! = 0.0) THEN GOTO L_1610b   '@16067 DS:27ea
A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = 0.0   '@16082 DS:27ea
A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = V_1ade!   '@160ad
A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = V_1ae2!   '@160d8
GOTO L_16288   '@16103
L_1610b:
IF NOT (V_2286! = -1.0) THEN GOTO L_161b4   '@1610c DS:27ee
A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = -1.0   '@16121 DS:27ee
A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = FX##(V_1af2!) / 100.0 + V_1ade!   '@1614c DS:27f2
A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = V_1ae2!   '@16181
GOTO L_16288   '@161ac
L_161b4:
IF NOT (V_2286! = -2.0) THEN GOTO L_1626a   '@161b5 DS:27f6
A_15da!(RT_CINT%(FX##(V_11b8!)), 3) = -2.0   '@161ca DS:27f6
A_15da!(RT_CINT%(FX##(V_11b8!)), 4) = 1000.0 * FX##(V_1aee!) + V_1ade! + FX##(V_1af2!) / 100.0   '@161f5 DS:27f2,27fa
A_15da!(RT_CINT%(FX##(V_11b8!)), 5) = V_1ae2!   '@16237
GOTO L_16288   '@16262
L_1626a:
IF NOT (V_2286! = -3.0) THEN GOTO L_16288   '@1626b DS:27fe
GOTO L_16288   '@16280
L_16288:
A_2536!(RT_CINT%(FX##(V_11b8!)), 0) = 2.0   '@16288 DS:288e
A_2536!(RT_CINT%(FX##(V_11b8!)), 3) = 0.0   '@162b2 DS:27ea
A_2536!(RT_CINT%(FX##(V_11b8!)), 4) = 0.0   '@162dd DS:27ea
IF NOT (V_1ace! = -2.0) THEN GOTO L_1634d   '@16308 DS:27f6
A_2536!(RT_CINT%(FX##(V_1ad2!)), 0) = 0.0   '@16323 DS:27ea
L_1634d:
IF NOT (V_1ada! = -2.0) THEN GOTO L_16392   '@1634d DS:27f6
A_2536!(RT_CINT%(FX##(V_1ade!)), 0) = 0.0   '@16368 DS:27ea
L_16392:
V_2564% = 1   '@16392
V_256c% = 0   '@1639d
GOTO L_1df3d   '@163a8
L_163b0:
IF NOT (V_224a$ <> "V") THEN GOTO L_163d4   '@163b0 DS:2ec0
IF NOT (V_224a$ = "v") THEN GOTO L_1babd   '@163c2 DS:2ec6
L_163d4:
CALL S_1fa3b   '@163d4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_210fe   '@163de
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
L_163ed:
RT_VIEWPRINT 23, 25   '@163f2
RT_CLS 2   '@16404
PRINT " Amarracao dos Elementos Estruturais na Forma"   '@16412 DS:2734
PRINT " Alteracao e Visualizacao da Amarracao das Vigas"   '@16420 DS:3244
PRINT " Numero ou Nome da Viga *FIM* ";   '@1642e DS:3278
CALL MIXT_07f1_LimpaTeclado   '@1643c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@16446 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1647d   '@16460
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b47   '@16475
L_1647d:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_164c3   '@1647d DS:27c0
V_11b8! = VAL(V_0e0c$)   '@164a1
GOTO L_16567   '@164bb
L_164c3:
V_228a! = A_157e%(0)   '@164c3
FOR V_11b8! = 1.0 TO V_228a!   '@164e7 DS:2624
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!)))))) THEN GOTO L_16539   '@164ee
GOTO L_16562   '@16531
L_16539:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@16539 DS:2624
L_16562:
L_16567:
L_BP0c% = (V_11b8! < 1.0)   '@16567 DS:2624
IF NOT ((A_157e%(0) < V_11b8! OR (INT(FX##(V_11b8!)) <> FX##(V_11b8!) OR L_BP0c%)) <> 0) THEN GOTO L_165f1   '@16592
BEEP   '@165df
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@165e9
L_165f1:
L_165f6:
RT_VIEWPRINT 1, 25   '@165fb
V_0e0c$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@1660d
RT_GCAIXA RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582! + LEN(V_0e0c$) * 8), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_27d0%(1): RT_GFIM   '@1663f DS:27c8,27cc
V_228e! = (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!   '@1676e
V_2292! = 165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@167ac DS:27c8
V_2296$ = "CGA"   '@167e7 DS:27e2
CALL MIXT_08c4_TextoGrafico(V_228e!, V_2292!, V_0e0c$, V_2296$)   '@167f4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
' @16809 libera strings locais (V_2296)
V_11e4! = 1.0   '@16812 DS:2624
V_1afe! = 2.0   '@16823 DS:288e
L_1683a:
V_1b0e$ = "/"   '@1683a DS:2b60
V_226a! = -1.0   '@1684c DS:27ee
V_229a! = A_1608!(0, 0)   '@1685d
FOR V_11c0! = V_11e4! TO V_229a!   '@1687e DS:2624
IF NOT (INT(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 4))) = FX##(V_11b8!)) THEN GOTO L_16c67   '@16886
IF NOT (V_226a! = -1.0) THEN GOTO L_169f1   '@168c2 DS:27ee
V_1ace! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 0)   '@168dd
V_1ad2! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 1)   '@16907
V_1aea! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 2)   '@16932
V_1ada! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 3)   '@1695a
V_1ade! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 4)   '@16985
V_1af2! = A_17d4!(RT_CINT%(FX##(V_11c0!)), 5)   '@169b0
V_226a! = 0.0   '@169db DS:27ea
L_169f1:
V_11cc! = (A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) <> V_1ace!)   '@169f1
V_11cc! = FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) <> V_1ad2!) + V_11cc!   '@16a32
V_11cc! = FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 2) <> V_1aea!) + V_11cc!   '@16a79
V_11cc! = FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) <> V_1ada!) + V_11cc!   '@16abd
V_11cc! = FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) <> V_1ade!) + V_11cc!   '@16b04
V_11cc! = FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 5) <> V_1af2!) + V_11cc!   '@16b4b
IF NOT (V_11cc! = 0.0) THEN GOTO L_16beb   '@16b92 DS:27ea
V_1b0e$ = V_1b0e$ + LTRIM$(STR$(V_11c0!)) + "/"   '@16bad DS:2b60
GOTO L_16c1c   '@16be3
L_16beb:
IF NOT (V_226a! = 0.0) THEN GOTO L_16c17   '@16beb DS:27ea
V_226a! = V_11c0!   '@16c06
L_16c17:
L_16c1c:
IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) <> 2.0) THEN GOTO L_16c62   '@16c1c DS:288e
V_1afe! = 0.0   '@16c51 DS:27ea
L_16c62:
L_16c67:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11c0!   '@16c67 DS:2624
V_11e4! = V_226a!   '@16c93
IF NOT (V_1b0e$ = "/") THEN GOTO L_16d6f   '@16ca4 DS:2b60
BEEP   '@16cbb
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@16cc5 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@16d62
L_16d6f:
GOSUB L_1ea26   '@16d6f
IF NOT (V_11e4! > 0.0) THEN GOTO L_16e25   '@16d7c DS:27ea
LOCATE 23, 65   '@16d97
CALL MIXT_07f1_LimpaTeclado   '@16db5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "*PROXIMA*", V_0e0c$   '@16dbf DS:329a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 23, 40   '@16dd9
PRINT ""; RT_TAB$(79); ""; ""   '@16df7 DS:25c0
L_16e25:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
IF NOT (V_11e4! <= 0.0) THEN GOTO L_1683a   '@16e25 DS:27ea
LOCATE 24, 55   '@16e40
CALL MIXT_07f1_LimpaTeclado   '@16e5e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Altero N/*S* ", V_0e0c$   '@16e68 DS:2802
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_16f49   '@16e82 DS:2814
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@16e9f DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@16f3c
L_16f49:
IF NOT (V_2568% = 1 OR V_2564% = 1) THEN GOTO L_1708f   '@16f49
RT_VIEWPRINT 23, 25   '@16f6d
RT_CLS 2   '@16f7f
PRINT " Atencao !!!"   '@16f8d DS:281a
PRINT " Existem Pilares ou Bordas de Lajes alteradas."   '@16f9b DS:32a8
PRINT " Acione REDESENHA para poder alterar as Vigas ";   '@16fa9 DS:32da
BEEP   '@16fb7
CALL MIXT_07f1_LimpaTeclado   '@16fc1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@16fcb DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@16fe5 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@17082
L_1708f:
IF NOT (V_1afe! = 2.0) THEN GOTO L_171ce   '@1708f DS:288e
RT_VIEWPRINT 23, 25   '@170aa
RT_CLS 2   '@170bc
PRINT " Atencao !!!"   '@170ca DS:281a
PRINT " Esta Viga nao pode ser modificada pois ja foi alterada."   '@170d8 DS:330c
PRINT " Acione REDESENHA para poder modifica-la novamente";   '@170e6 DS:28d0
BEEP   '@170f4
CALL MIXT_07f1_LimpaTeclado   '@170fe
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@17108
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@17124 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@171c1
L_171ce:
L_171d3:
RT_VIEWPRINT 23, 25   '@171d8
RT_CLS 2   '@171ea
PRINT " Alteracoes na amarracao da Viga "; A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@171f8 DS:3348
PRINT " <*T*>odas faces serao amarradas   <E>scolho faces a serem amarradas  <R>etorna";   '@1722f DS:336e
CALL MIXT_07f1_LimpaTeclado   '@1723d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@17247
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 1, 25   '@17263
V_229e$ = V_0e0c$   '@17275
IF NOT (V_229e$ <> "E") THEN GOTO L_172b0   '@17287 DS:2bca
IF NOT (V_229e$ = "e") THEN GOTO L_17d12   '@1729e DS:2bd0
L_172b0:
LOCATE 24, 1   '@172b0
PRINT " <S>im face escolhida    <A>nula escolha    <*P*>roximo    <F>im    <C>ancela"; RT_TAB$(79); ""; " "   '@172cb DS:25c0,2abe,33c2
V_1b0e$ = "/"   '@172f4 DS:2b60
V_11c0! = 1.0   '@17306 DS:2624
L_1731c:
IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) <> 2.0 AND INT(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 4))) = FX##(V_11b8!)) THEN GOTO L_17c52   '@1731c DS:288e
V_22a2! = 0.0   '@17397 DS:27ea
CALL S_3e559(V_11c0!, V_22a2!, V_22a6!)   '@173a8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22aa! = 2.0   '@173ba DS:288e
CALL S_3e559(V_11c0!, V_22aa!, V_22ae!)   '@173c5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22b2! = (FX##(V_22a6!) + V_22ae!) / 2.0   '@173d7 DS:288e
V_22b6! = 1.0   '@173ec DS:2624
CALL S_3e559(V_11c0!, V_22b6!, V_22ba!)   '@173fd
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22be! = 3.0   '@1740f DS:3414
CALL S_3e559(V_11c0!, V_22be!, V_22c2!)   '@1741a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22c6! = (FX##(V_22ba!) + V_22c2!) / 2.0   '@1742c DS:288e
IF NOT (V_22c6! <= V_2596! OR (V_22c6! >= V_259e! OR (V_22b2! <= V_2592! OR V_22b2! >= V_259a!))) THEN GOTO L_174bd   '@17441
GOTO L_17cac   '@174b5
L_174bd:
RT_GCAIXA RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) + 5.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_3424%(1): RT_GFIM   '@174bd DS:27c8,3418,341c,3420
V_22ca! = (FX##(V_22b2!) - V_2592!) * V_258a! - 8.0 + V_2582!   '@17585 DS:27cc
V_22ce! = 165.0 - (FX##(V_22c6!) - V_2596!) * V_258e! + 4.0   '@175ab DS:27c8,3436
V_22d2$ = CHR$(26)   '@175cd
V_22d6$ = "CGA"   '@175e0 DS:27e2
CALL MIXT_08c4_TextoGrafico(V_22ca!, V_22ce!, V_22d2$, V_22d6$)   '@175ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
' @17602 libera strings locais (V_22d2)
' @1760b libera strings locais (V_22d6)
CALL MIXT_07f1_LimpaTeclado   '@17614
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1761e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), 0: PUT (RG_GX1, RG_GY1), A_3424%(1), PSET: RT_GFIM   '@1763a DS:27c8,3418,341c
V_22da$ = V_0e0c$   '@176af
IF NOT (V_22da$ <> "S") THEN GOTO L_176ea   '@176c1 DS:343a
IF NOT (V_22da$ = "s") THEN GOTO L_178ad   '@176d8 DS:3440
L_176ea:
V_0e0c$ = "/" + LTRIM$(STR$(V_11c0!)) + "/"   '@176ea DS:2b60
IF NOT (RT_INSTR%((1), (V_1b0e$), (V_0e0c$)) = 0) THEN GOTO L_17773   '@17720
V_1b0e$ = V_1b0e$ + LTRIM$(STR$(V_11c0!)) + "/"   '@1773d DS:2b60
L_17773:
V_22de! = A_1608!(0, 0)   '@17773
FOR V_22e2! = 1.0 TO V_22de!   '@17794 DS:2624
IF NOT (A_1608!(RT_CINT%(FX##(V_22e2!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_17879   '@1779c
V_0e0c$ = "/" + LTRIM$(STR$(V_22e2!)) + "/"   '@177eb DS:2b60
IF NOT (RT_INSTR%((1), (V_1b0e$), (V_0e0c$)) = 0) THEN GOTO L_17874   '@17821
V_1b0e$ = V_1b0e$ + LTRIM$(STR$(V_22e2!)) + "/"   '@1783e DS:2b60
L_17874:
L_17879:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_22e2!   '@17879 DS:2624
GOTO L_17c4d   '@178a5
L_178ad:
IF NOT (V_22da$ <> "A") THEN GOTO L_178d1   '@178ad DS:2b1e
IF NOT (V_22da$ = "a") THEN GOTO L_17be5   '@178bf DS:3446
L_178d1:
V_0e0c$ = "/" + LTRIM$(STR$(V_11c0!)) + "/"   '@178d1 DS:2b60
IF NOT (RT_INSTR%((1), (V_1b0e$), (V_0e0c$)) = 0) THEN GOTO L_17936   '@17907
BEEP   '@17924
GOTO L_17bdd   '@1792e
L_17936:
V_226a! = RT_INSTR%((1), (V_1b0e$), (V_0e0c$))   '@17936
V_11cc! = RT_INSTR%((RT_CINT%(FX##(V_226a!) + 1.0)), (V_1b0e$), ("/"))   '@17958 DS:2624,2b60
IF NOT (V_226a! > 1.0) THEN GOTO L_179d5   '@17986 DS:2624
V_0e0c$ = RT_MID$((V_1b0e$), (1), (RT_CINT%(FX##(V_226a!) - 1.0)))   '@179a1 DS:27ee
GOTO L_179e7   '@179cd
L_179d5:
V_0e0c$ = ""   '@179d5 DS:25c0
L_179e7:
V_1b0e$ = V_0e0c$ + RT_MID2$((V_1b0e$), (RT_CINT%(FX##(V_11cc!))))   '@179e7
V_22e6! = A_1608!(0, 0)   '@17a18
FOR V_22e2! = 1.0 TO V_22e6!   '@17a39 DS:2624
IF NOT (A_1608!(RT_CINT%(FX##(V_22e2!)), 4) = A_1608!(RT_CINT%(FX##(V_11c0!)), 4)) THEN GOTO L_17bac   '@17a40
V_0e0c$ = "/" + LTRIM$(STR$(V_22e2!)) + "/"   '@17a8f DS:2b60
V_226a! = RT_INSTR%((1), (V_1b0e$), (V_0e0c$))   '@17ac5
V_11cc! = RT_INSTR%((RT_CINT%(FX##(V_226a!) + 1.0)), (V_1b0e$), ("/"))   '@17ae7 DS:2624,2b60
IF NOT (V_226a! > 1.0) THEN GOTO L_17b64   '@17b15 DS:2624
V_0e0c$ = RT_MID$((V_1b0e$), (1), (RT_CINT%(FX##(V_226a!) - 1.0)))   '@17b30 DS:27ee
GOTO L_17b76   '@17b5c
L_17b64:
V_0e0c$ = ""   '@17b64 DS:25c0
L_17b76:
V_1b0e$ = V_0e0c$ + RT_MID2$((V_1b0e$), (RT_CINT%(FX##(V_11cc!))))   '@17b76
L_17bac:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_22e2!   '@17bac DS:2624
L_17bdd:
GOTO L_17c4d   '@17bdd
L_17be5:
IF NOT (V_22da$ <> "F") THEN GOTO L_17c09   '@17be5 DS:344c
IF NOT (V_22da$ = "f") THEN GOTO L_17c19   '@17bf7 DS:3452
L_17c09:
GOTO L_17d0a   '@17c09
L_17c19:
IF NOT (V_22da$ <> "C") THEN GOTO L_17c3d   '@17c19 DS:29ae
IF NOT (V_22da$ = "c") THEN GOTO L_17c4d   '@17c2b DS:29b4
L_17c3d:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_171d3   '@17c3d
L_17c4d:
L_17c52:
LOCATE 25, 2   '@17c52
PRINT RT_MID$((V_1b0e$), (1), (75)); RT_TAB$(79); ""; "";   '@17c70 DS:25c0
L_17cac:
V_11c0! = FX##(V_11c0!) + 1.0   '@17cb1 DS:2624
IF NOT (A_1608!(0, 0) < V_11c0!) THEN GOTO L_17d02   '@17cc7
V_11c0! = 1.0   '@17cf1 DS:2624
L_17d02:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1731c   '@17d02
L_17d0a:
GOTO L_17f5a   '@17d0a
L_17d12:
IF NOT (V_229e$ <> "R") THEN GOTO L_17d36   '@17d12 DS:2fdc
IF NOT (V_229e$ = "r") THEN GOTO L_17de3   '@17d24 DS:2fe2
L_17d36:
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@17d36 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_165f6   '@17dd3
L_17de3:
V_1b0e$ = "/"   '@17de3 DS:2b60
V_22ea! = A_1608!(0, 0)   '@17df5
FOR V_11c0! = 1.0 TO V_22ea!   '@17e16 DS:2624
IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) <> 2.0 AND INT(FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 4))) = FX##(V_11b8!)) THEN GOTO L_17ed4   '@17e1e DS:288e
V_1b0e$ = V_1b0e$ + LTRIM$(STR$(V_11c0!)) + "/"   '@17e99 DS:2b60
L_17ed4:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11c0!   '@17ed4 DS:2624
LOCATE 25, 2   '@17f00
PRINT RT_MID$((V_1b0e$), (1), (75)); RT_TAB$(79); ""; "";   '@17f1e DS:25c0
L_17f5a:
IF NOT (V_1b0e$ = "/") THEN GOTO L_17f83   '@17f5a DS:2b60
BEEP   '@17f71
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_171d3   '@17f7b
L_17f83:
L_17f88:
LOCATE 24, 1   '@17f8d
PRINT " <S>im face a ser utilizada como referencia    <*P*>roxima    <R>etorna"; RT_TAB$(79); ""; " "   '@17fa8 DS:25c0,2abe,3458
V_226a! = 1.0   '@17fd1 DS:2624
L_17fe8:
V_11c0! = VAL(RT_MID2$((V_1b0e$), (RT_CINT%(FX##(V_226a!) + 1.0))))   '@17fe8 DS:2624
V_22ee! = 0.0   '@1801c DS:27ea
CALL S_3e559(V_11c0!, V_22ee!, V_22f2!)   '@1802d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22f6! = 2.0   '@1803f DS:288e
CALL S_3e559(V_11c0!, V_22f6!, V_22fa!)   '@1804a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22b2! = (FX##(V_22f2!) + V_22fa!) / 2.0   '@1805c DS:288e
V_22fe! = 1.0   '@18071 DS:2624
CALL S_3e559(V_11c0!, V_22fe!, V_2302!)   '@18082
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_2306! = 3.0   '@18094 DS:3414
CALL S_3e559(V_11c0!, V_2306!, V_230a!)   '@1809f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22c6! = (FX##(V_2302!) + V_230a!) / 2.0   '@180b1 DS:288e
RT_GCAIXA RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) + 5.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_3424%(1): RT_GFIM   '@180c6 DS:27c8,3418,341c,3420
V_230e! = (FX##(V_22b2!) - V_2592!) * V_258a! - 8.0 + V_2582!   '@1818e DS:27cc
V_2312! = 165.0 - (FX##(V_22c6!) - V_2596!) * V_258e! + 4.0   '@181b4 DS:27c8,3436
V_2316$ = CHR$(26)   '@181d6
V_231a$ = "CGA"   '@181e9 DS:27e2
CALL MIXT_08c4_TextoGrafico(V_230e!, V_2312!, V_2316$, V_231a$)   '@181f6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
' @1820b libera strings locais (V_2316)
' @18214 libera strings locais (V_231a)
CALL MIXT_07f1_LimpaTeclado   '@1821d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@18227
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), 0: PUT (RG_GX1, RG_GY1), A_3424%(1), PSET: RT_GFIM   '@18243 DS:27c8,3418,341c
V_231e$ = V_0e0c$   '@182b8
IF NOT (V_231e$ <> "S") THEN GOTO L_182f3   '@182ca DS:343a
IF NOT (V_231e$ = "s") THEN GOTO L_18303   '@182e1 DS:3440
L_182f3:
GOTO L_183a2   '@182f3
L_18303:
IF NOT (V_231e$ <> "R") THEN GOTO L_18327   '@18303 DS:2fdc
IF NOT (V_231e$ = "r") THEN GOTO L_18337   '@18315 DS:2fe2
L_18327:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_171d3   '@18327
L_18337:
V_226a! = RT_INSTR%((RT_CINT%(FX##(V_226a!) + 1.0)), (V_1b0e$), ("/"))   '@18337 DS:2624,2b60
IF NOT (LEN(V_1b0e$) = V_226a!) THEN GOTO L_1839a   '@18365
V_226a! = 1.0   '@18389 DS:2624
L_1839a:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_17fe8   '@1839a
L_183a2:
V_1b06! = V_11c0!   '@183a2
V_2322! = 0.0   '@183bd DS:27ea
CALL S_3e559(V_1b06!, V_2322!, V_2326!)   '@183ce
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_1b12! = V_2326!   '@183e0
V_232a! = 1.0   '@183eb DS:2624
CALL S_3e559(V_1b06!, V_232a!, V_232e!)   '@183fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_1b16! = V_232e!   '@1840e
V_1b0a! = 0.0   '@18419 DS:27ea
V_2332! = 0.0   '@1842a DS:27ea
CALL S_3e559(V_1b06!, V_2332!, V_2336!)   '@1843b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_233a! = 2.0   '@1844d DS:288e
CALL S_3e559(V_1b06!, V_233a!, V_233e!)   '@18458
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_2336! = V_233e!) THEN GOTO L_18487   '@1846a
GOTO L_189fa   '@1847f
L_18487:
V_2342! = 1.0   '@18487 DS:2624
CALL S_3e559(V_1b06!, V_2342!, V_2346!)   '@18498
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_234a! = 3.0   '@184aa DS:3414
CALL S_3e559(V_1b06!, V_234a!, V_234e!)   '@184b5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_2346! = V_234e!) THEN GOTO L_184e4   '@184c7
GOTO L_189fa   '@184dc
L_184e4:
LOCATE 25, 1   '@184e4
PRINT ""; RT_TAB$(79); ""; "";   '@184ff DS:25c0
LOCATE 24, 1   '@18528
PRINT " <S>im vertice a ser utilizada como referencia    <*O*>utro    <R>etorna"; RT_TAB$(79); ""; ""   '@18543 DS:25c0,34a4
V_226a! = 0.0   '@1856c DS:27ea
L_18582:
CALL S_3e559(V_1b06!, V_226a!, V_2352!)   '@18582
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22b2! = V_2352!   '@18599
V_2356! = FX##(V_226a!) + 1.0   '@185a4 DS:2624
CALL S_3e559(V_1b06!, V_2356!, V_235a!)   '@185ba
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_22c6! = V_235a!   '@185cc
IF NOT (V_22c6! < V_2596! OR (V_22c6! > V_259e! OR (V_22b2! < V_2592! OR V_22b2! > V_259a!))) THEN GOTO L_18653   '@185d7
GOTO L_18992   '@1864b
L_18653:
RT_GCAIXA RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) + 5.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), A_3424%(1): RT_GFIM   '@18653 DS:27c8,3418,341c,3420
V_235e! = (FX##(V_22b2!) - V_2592!) * V_258a! - 8.0 + V_2582!   '@1871b DS:27cc
V_2362! = 165.0 - (FX##(V_22c6!) - V_2596!) * V_258e! + 4.0   '@18741 DS:27c8,3436
V_2366$ = CHR$(26)   '@18763
V_236a$ = "CGA"   '@18776 DS:27e2
CALL MIXT_08c4_TextoGrafico(V_235e!, V_2362!, V_2366$, V_236a$)   '@18783
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
' @18798 libera strings locais (V_2366)
' @187a1 libera strings locais (V_236a)
LOCATE 25, 1   '@187aa
PRINT USING " X=#####.##  Y=#####.##"; RT_PU#(V_22b2!, " X=#####.##  Y=#####.##", 1); RT_PU#(V_22c6!, " X=#####.##  Y=#####.##", 2);   '@187c5 DS:34f0
CALL MIXT_07f1_LimpaTeclado   '@187f2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@187fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!(INT((FX##(V_22b2!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_22c6!) - V_2596!) * V_258e!) - 5.0), 0: PUT (RG_GX1, RG_GY1), A_3424%(1), PSET: RT_GFIM   '@18818 DS:27c8,3418,341c
LOCATE 25, 1   '@1888d
V_236e$ = V_0e0c$   '@188a8
IF NOT (V_236e$ <> "S") THEN GOTO L_188e3   '@188ba DS:343a
IF NOT (V_236e$ = "s") THEN GOTO L_18915   '@188d1 DS:3440
L_188e3:
V_1b12! = V_22b2!   '@188e3
V_1b16! = V_22c6!   '@188f4
GOTO L_189e4   '@18905
L_18915:
IF NOT (V_236e$ <> "R") THEN GOTO L_18939   '@18915 DS:2fdc
IF NOT (V_236e$ = "r") THEN GOTO L_1898d   '@18927 DS:2fe2
L_18939:
LOCATE 25, 1   '@18939
PRINT " "; RT_TAB$(79); ""; "";   '@18954 DS:25c0,2abe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_17f88   '@1897d
L_1898d:
L_18992:
IF NOT (V_226a! = 0.0) THEN GOTO L_189cb   '@18997 DS:27ea
V_226a! = 2.0   '@189b2 DS:288e
GOTO L_189dc   '@189c3
L_189cb:
V_226a! = 0.0   '@189cb DS:27ea
L_189dc:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_18582   '@189dc
L_189e4:
V_1b0a! = V_226a!   '@189e4
L_189fa:
V_2372! = 1.0   '@189ff DS:2624
CALL S_3e559(V_1b06!, V_2372!, V_2376!)   '@18a10
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_237a! = 3.0   '@18a22 DS:3414
CALL S_3e559(V_1b06!, V_237a!, V_237e!)   '@18a2d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_2376! = V_237e!) THEN GOTO L_18a72   '@18a3f
V_1ace! = 100.0   '@18a54 DS:27f2
GOTO L_19ca2   '@18a65
L_18a72:
RT_VIEWPRINT 23, 25   '@18a72
RT_CLS 2   '@18a84
PRINT " Alteracoes na amarracao da Viga "; A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@18a92 DS:3348
PRINT " Sentido X  -  Amarrar faces de Viga por:"   '@18ac9 DS:350c
PRINT " <C>oordenada absoluta    <E>ixo    um <P>ilar    outra <V>iga    <R>etorna";   '@18ad7 DS:353a
CALL MIXT_07f1_LimpaTeclado   '@18ae5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@18aef
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_2382$ = V_0e0c$   '@18b0b
IF NOT (V_2382$ <> "C") THEN GOTO L_18b46   '@18b1d DS:29ae
IF NOT (V_2382$ = "c") THEN GOTO L_18d28   '@18b34 DS:29b4
L_18b46:
LOCATE 24, 1   '@18b46
PRINT " Sentido X  -  Amarrar faces "; RT_MID$((V_1b0e$), (1), (45)); RT_TAB$(79); ""; ""   '@18b61 DS:25c0,358a
LOCATE 25, 1   '@18ba1
PRINT ""; RT_TAB$(79); ""; "";   '@18bbc DS:25c0
LOCATE 25, 1   '@18be5
PRINT " Coordenada absoluta do vertice X= *"; LTRIM$(STR$(V_1b12!)); "* ";   '@18c00 DS:2a3c,35ac
V_1ace! = 0.0   '@18c30 DS:27ea
CALL MIXT_07f1_LimpaTeclado   '@18c41
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@18c4b DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_18c96   '@18c65
V_0e0c$ = STR$(V_1b12!)   '@18c7a
L_18c96:
L_BP0c% = (VAL(V_0e0c$) = 0.0#)   '@18c96 DS:27c0
L_BP0e% = LEN(V_0e0c$) > 0 AND L_BP0c%   '@18cc4
IF NOT ((V_0e0c$ <> "0" AND L_BP0e%) <> 0) THEN GOTO L_18d06   '@18cdf DS:2bc4
BEEP   '@18cf4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_189fa   '@18cfe
L_18d06:
V_1ad6! = VAL(V_0e0c$)   '@18d06
GOTO L_19c9d   '@18d20
L_18d28:
IF NOT (V_2382$ <> "E") THEN GOTO L_18d4c   '@18d28 DS:2bca
IF NOT (V_2382$ = "e") THEN GOTO L_19052   '@18d3a DS:2bd0
L_18d4c:
LOCATE 24, 1   '@18d56
PRINT ""; RT_TAB$(79); ""; "";   '@18d71 DS:25c0
LOCATE 25, 1   '@18d9a
PRINT ""; RT_TAB$(79); ""; "";   '@18db5 DS:25c0
LOCATE 24, 1   '@18dde
PRINT " Sentido X  -  Escolha do Eixo Vertical de Referencia"; RT_TAB$(79); ""; ""   '@18df9 DS:25c0,2bd6
PRINT " <S>im eixo de referencia                 <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@18e22 DS:25c0,2abe,2c10
V_11e4! = 1.0   '@18e4b DS:2624
CALL S_2261e   '@18e5c
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_18e89   '@18e66 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_189fa   '@18e81
L_18e89:
V_1ace! = -1.0   '@18e89 DS:27ee
V_1ad2! = V_11dc!   '@18e9a
LOCATE 24, 1   '@18eab
PRINT " Sentido X  -  Eixo Referencia "; V_0e14$; "("; LTRIM$(STR$(V_11d4!)); ")"; RT_TAB$(79); ""; "";   '@18ec6 DS:25c0,2aee,2af4,2c62
V_1b1a! = V_11d4!   '@18f23
LOCATE 25, 1   '@18f34
PRINT ""; RT_TAB$(79); ""; "";   '@18f4f DS:25c0
LOCATE 25, 1   '@18f78
PRINT " Distancia relativa do eixo ao vertice X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))); "* ";   '@18f93 DS:2a3c,35d4
CALL MIXT_07f1_LimpaTeclado   '@18fcf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@18fd9 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_19030   '@18ff3
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))   '@19008
L_19030:
V_1ad6! = VAL(V_0e0c$)   '@19030
GOTO L_19c9d   '@1904a
L_19052:
IF NOT (V_2382$ <> "P") THEN GOTO L_19076   '@19052 DS:2728
IF NOT (V_2382$ = "p") THEN GOTO L_1986b   '@19064 DS:272e
L_19076:
L_1907b:
LOCATE 24, 1   '@19080
PRINT ""; RT_TAB$(79); ""; "";   '@1909b DS:25c0
LOCATE 25, 1   '@190c4
PRINT ""; RT_TAB$(79); ""; "";   '@190df DS:25c0
LOCATE 24, 1   '@19108
PRINT " Numero ou Nome do Pilar que servira de Referencia *FIM* ";   '@19123 DS:2ce4
CALL MIXT_07f1_LimpaTeclado   '@19131
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1913b DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_19172   '@19155
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_189fa   '@1916a
L_19172:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_191b8   '@19172 DS:27c0
V_11e0! = VAL(V_0e0c$)   '@19196
GOTO L_19288   '@191b0
L_191b8:
V_2386! = A_15da!(0, 0)   '@191b8
FOR V_11e0! = 1.0 TO V_2386!   '@191d9 DS:2624
IF NOT (A_15ac%(RT_CINT%(FX##(V_11e0!))) > 0) THEN GOTO L_19257   '@191e0
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))))) THEN GOTO L_19252   '@19207
GOTO L_19283   '@1924a
L_19252:
L_19257:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11e0!   '@19257 DS:2624
L_19283:
L_19288:
L_BP0c% = (V_11e0! < 1.0)   '@19288 DS:2624
IF NOT ((A_15da!(0, 0) < V_11e0! OR (INT(FX##(V_11e0!)) <> FX##(V_11e0!) OR L_BP0c%)) <> 0) THEN GOTO L_1930d   '@192b3
BEEP   '@192fb
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1907b   '@19305
L_1930d:
IF NOT (A_2536!(RT_CINT%(FX##(V_11e0!)), 0) = 2.0) THEN GOTO L_193eb   '@1930d DS:288e
LOCATE 24, 1   '@19341
PRINT " Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada."; RT_TAB$(79); ""; ""   '@1935c DS:25c0,2d22
PRINT " Acione REDESENHA para poder utiliza-la"; RT_TAB$(79); ""; "";   '@19385 DS:25c0,2d6a
BEEP   '@193ae
CALL MIXT_07f1_LimpaTeclado   '@193b8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@193c2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1907b   '@193de
L_193eb:
V_13aa% = 0   '@193eb
L_193fc:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_19462   '@193fc
GOTO L_19472   '@1945a
L_19462:
V_13aa% = V_13aa% + 1   '@19462
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_193fc   '@1946b
L_19472:
V_11e4! = V_11e0!   '@19472
V_0e1c$ = "DESENHASOUM"   '@19483 DS:3604
CALL S_212be   '@19495
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e1c$ = ""   '@1949f DS:25c0
V_1ace! = -2.0   '@194b1 DS:27f6
V_1ad2! = V_11e0!   '@194c2
LOCATE 25, 1   '@194dd
PRINT ""; RT_TAB$(79); ""; "";   '@194f8 DS:25c0
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 6) = 2) THEN GOTO L_195f8   '@19521
LOCATE 24, 1   '@1955f
PRINT " Sentido X  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " Centro da Secao"; RT_TAB$(79); ""; ""   '@1957a DS:25c0,2d96,2dba
V_11ec! = V_11e0!   '@195d5
CALL S_22ee1   '@195e6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1972b   '@195f0
L_195f8:
LOCATE 24, 1   '@195f8
PRINT " Sentido X  -  Escolha do Vertice de Referencia"; RT_TAB$(79); ""; ""   '@19613 DS:25c0,2dce
PRINT " <S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1963c DS:25c0,2abe,2e02
V_11ec! = V_11e0!   '@19665
CALL S_22ee1   '@19676
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_196a3   '@19680 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1907b   '@1969b
L_196a3:
LOCATE 24, 1   '@196a3
PRINT " Sentido X  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " vertice"; V_11dc!; RT_TAB$(79); ""; ""   '@196be DS:25c0,2d96,2e4a
L_1972b:
V_1aea! = V_11dc!   '@1972b
V_1b1a! = V_11d4!   '@1973c
LOCATE 25, 1   '@1974d
PRINT ""; RT_TAB$(79); ""; "";   '@19768 DS:25c0
LOCATE 25, 1   '@19791
PRINT " Distancia relativa da referencia ao vertice X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))); "* ";   '@197ac DS:2a3c,3614
CALL MIXT_07f1_LimpaTeclado   '@197e8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@197f2 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_19849   '@1980c
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))   '@19821
L_19849:
V_1ad6! = VAL(V_0e0c$)   '@19849
GOTO L_19c9d   '@19863
L_1986b:
IF NOT (V_2382$ <> "V") THEN GOTO L_1988f   '@1986b DS:2ec0
IF NOT (V_2382$ = "v") THEN GOTO L_19bbf   '@1987d DS:2ec6
L_1988f:
LOCATE 24, 1   '@19899
PRINT ""; RT_TAB$(79); ""; "";   '@198b4 DS:25c0
LOCATE 25, 1   '@198dd
PRINT ""; RT_TAB$(79); ""; "";   '@198f8 DS:25c0
LOCATE 24, 1   '@19921
PRINT " Sentido X  -  Escolha da Viga de Referencia"; RT_TAB$(79); ""; ""   '@1993c DS:25c0,2ecc
PRINT " <S>im Viga de referencia                 <*P*>roxima   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@19965 DS:25c0,2abe,2efc
V_11d4! = V_1b12!   '@1998e
V_11d8! = V_1b16!   '@1999f
V_11ec! = -V_11b8!   '@199b0
V_11e4! = 0.0   '@199c4 DS:27ea
CALL S_23d3c   '@199d5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_19a02   '@199df DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_189fa   '@199fa
L_19a02:
LOCATE 24, 1   '@19a02
PRINT " Sentido X  -  Viga Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d4!)); ")"; RT_TAB$(79); ""; "";   '@19a1d DS:25c0,2aee,2af4,2f4e
V_1b1a! = V_11d4!   '@19a7a
LOCATE 25, 1   '@19a8b
PRINT ""; RT_TAB$(79); ""; "";   '@19aa6 DS:25c0
LOCATE 25, 1   '@19acf
PRINT " Distancia relativa da Viga referencia a face X= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))); "* ";   '@19aea DS:2a3c,364a
V_1ace! = 0.0   '@19b26 DS:27ea
CALL MIXT_07f1_LimpaTeclado   '@19b37
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@19b41 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_19b98   '@19b5b
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b12!) - V_1b1a!))   '@19b70
L_19b98:
V_1ad6! = FX##(V_1b1a!) + VAL(V_0e0c$)   '@19b98
GOTO L_19c9d   '@19bb7
L_19bbf:
IF NOT (V_2382$ <> "R") THEN GOTO L_19be3   '@19bbf DS:2fdc
IF NOT (V_2382$ = "r") THEN GOTO L_19c90   '@19bd1 DS:2fe2
L_19be3:
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@19be3 DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_165f6   '@19c80
L_19c90:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_189fa   '@19c90
L_19c9d:
L_19ca2:
V_238a! = 0.0   '@19ca7 DS:27ea
CALL S_3e559(V_1b06!, V_238a!, V_238e!)   '@19cb8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_2392! = 2.0   '@19cca DS:288e
CALL S_3e559(V_1b06!, V_2392!, V_2396!)   '@19cd5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_238e! = V_2396!) THEN GOTO L_19d1a   '@19ce7
V_1ada! = 100.0   '@19cfc DS:27f2
GOTO L_1af1a   '@19d0d
L_19d1a:
RT_VIEWPRINT 23, 25   '@19d1a
RT_CLS 2   '@19d2c
PRINT " Alteracoes na amarracao da Viga "; A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@19d3a DS:3348
PRINT " Sentido Y  -  Amarrar faces de Viga por:"   '@19d71 DS:3680
PRINT " <C>oordenada absoluta    <E>ixo    um <P>ilar    outra <V>iga    <R>etorna";   '@19d7f DS:353a
CALL MIXT_07f1_LimpaTeclado   '@19d8d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@19d97
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_239a$ = V_0e0c$   '@19db3
IF NOT (V_239a$ <> "C") THEN GOTO L_19dee   '@19dc5 DS:29ae
IF NOT (V_239a$ = "c") THEN GOTO L_19fd0   '@19ddc DS:29b4
L_19dee:
LOCATE 24, 1   '@19dee
PRINT " Sentido Y  -  Amarrar faces "; RT_MID$((V_1b0e$), (1), (45)); RT_TAB$(79); ""; ""   '@19e09 DS:25c0,36ae
LOCATE 25, 1   '@19e49
PRINT ""; RT_TAB$(79); ""; "";   '@19e64 DS:25c0
LOCATE 25, 1   '@19e8d
PRINT " Coordenada absoluta do vertice Y= *"; LTRIM$(STR$(V_1b16!)); "* ";   '@19ea8 DS:2a3c,36d0
V_1ada! = 0.0   '@19ed8 DS:27ea
CALL MIXT_07f1_LimpaTeclado   '@19ee9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@19ef3 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_19f3e   '@19f0d
V_0e0c$ = STR$(V_1b16!)   '@19f22
L_19f3e:
L_BP0c% = (VAL(V_0e0c$) = 0.0#)   '@19f3e DS:27c0
L_BP0e% = LEN(V_0e0c$) > 0 AND L_BP0c%   '@19f6c
IF NOT ((V_0e0c$ <> "0" AND L_BP0e%) <> 0) THEN GOTO L_19fae   '@19f87 DS:2bc4
BEEP   '@19f9c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_19ca2   '@19fa6
L_19fae:
V_1ae2! = VAL(V_0e0c$)   '@19fae
GOTO L_1af15   '@19fc8
L_19fd0:
IF NOT (V_239a$ <> "E") THEN GOTO L_19ff4   '@19fd0 DS:2bca
IF NOT (V_239a$ = "e") THEN GOTO L_1a2fa   '@19fe2 DS:2bd0
L_19ff4:
LOCATE 24, 1   '@19ffe
PRINT ""; RT_TAB$(79); ""; "";   '@1a019 DS:25c0
LOCATE 25, 1   '@1a042
PRINT ""; RT_TAB$(79); ""; "";   '@1a05d DS:25c0
LOCATE 24, 1   '@1a086
PRINT " Sentido Y  -  Escolha do Eixo Horizontal de Referencia"; RT_TAB$(79); ""; ""   '@1a0a1 DS:25c0,311a
PRINT " <S>im eixo de referencia                 <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1a0ca DS:25c0,2abe,2c10
V_11e4! = 0.0   '@1a0f3 DS:27ea
CALL S_2261e   '@1a104
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1a131   '@1a10e DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_19ca2   '@1a129
L_1a131:
V_1ada! = -1.0   '@1a131 DS:27ee
V_1ade! = V_11dc!   '@1a142
LOCATE 24, 1   '@1a153
PRINT " Sentido Y  -  Eixo Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d8!)); ")"; RT_TAB$(79); ""; "";   '@1a16e DS:25c0,2aee,2af4,3156
V_1b1e! = V_11d8!   '@1a1cb
LOCATE 25, 1   '@1a1dc
PRINT ""; RT_TAB$(79); ""; "";   '@1a1f7 DS:25c0
LOCATE 25, 1   '@1a220
PRINT " Distancia relativa do eixo ao vertice Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))); "* ";   '@1a23b DS:2a3c,36f8
CALL MIXT_07f1_LimpaTeclado   '@1a277
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1a281 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1a2d8   '@1a29b
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))   '@1a2b0
L_1a2d8:
V_1ae2! = VAL(V_0e0c$)   '@1a2d8
GOTO L_1af15   '@1a2f2
L_1a2fa:
IF NOT (V_239a$ <> "P") THEN GOTO L_1a31e   '@1a2fa DS:2728
IF NOT (V_239a$ = "p") THEN GOTO L_1aae3   '@1a30c DS:272e
L_1a31e:
L_1a323:
LOCATE 24, 1   '@1a328
PRINT ""; RT_TAB$(79); ""; "";   '@1a343 DS:25c0
LOCATE 25, 1   '@1a36c
PRINT ""; RT_TAB$(79); ""; "";   '@1a387 DS:25c0
LOCATE 24, 1   '@1a3b0
PRINT " Numero ou Nome do Pilar que servira de Referencia *FIM* ";   '@1a3cb DS:2ce4
CALL MIXT_07f1_LimpaTeclado   '@1a3d9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1a3e3 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1a41a   '@1a3fd
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_19ca2   '@1a412
L_1a41a:
IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_1a460   '@1a41a DS:27c0
V_11e0! = VAL(V_0e0c$)   '@1a43e
GOTO L_1a501   '@1a458
L_1a460:
V_239e! = A_15da!(0, 0)   '@1a460
FOR V_11e0! = 1.0 TO V_239e!   '@1a481 DS:2624
IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))))) THEN GOTO L_1a4d3   '@1a488
GOTO L_1a4fc   '@1a4cb
L_1a4d3:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11e0!   '@1a4d3 DS:2624
L_1a4fc:
L_1a501:
L_BP0c% = (V_11e0! < 1.0)   '@1a501 DS:2624
IF NOT ((A_15da!(0, 0) < V_11e0! OR (INT(FX##(V_11e0!)) <> FX##(V_11e0!) OR L_BP0c%)) <> 0) THEN GOTO L_1a586   '@1a52c
BEEP   '@1a574
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1a323   '@1a57e
L_1a586:
IF NOT (A_2536!(RT_CINT%(FX##(V_11e0!)), 0) = 2.0) THEN GOTO L_1a664   '@1a586 DS:288e
LOCATE 24, 1   '@1a5ba
PRINT " Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada."; RT_TAB$(79); ""; ""   '@1a5d5 DS:25c0,2d22
PRINT " Acione REDESENHA para poder utiliza-la"; RT_TAB$(79); ""; "";   '@1a5fe DS:25c0,2d6a
BEEP   '@1a627
CALL MIXT_07f1_LimpaTeclado   '@1a631
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1a63b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1a323   '@1a657
L_1a664:
V_13aa% = 0   '@1a664
L_1a674:
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_1a6da   '@1a674
GOTO L_1a6ea   '@1a6d2
L_1a6da:
V_13aa% = V_13aa% + 1   '@1a6da
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1a674   '@1a6e3
L_1a6ea:
V_11e4! = V_11e0!   '@1a6ea
V_0e1c$ = "DESENHASOUM"   '@1a6fb DS:3604
CALL S_212be   '@1a70d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e1c$ = ""   '@1a717 DS:25c0
V_1ada! = -2.0   '@1a729 DS:27f6
V_1ade! = V_11e0!   '@1a73a
LOCATE 25, 1   '@1a755
PRINT ""; RT_TAB$(79); ""; "";   '@1a770 DS:25c0
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11e0!))), V_13aa%, 6) = 2) THEN GOTO L_1a870   '@1a799
LOCATE 24, 1   '@1a7d7
PRINT " Sentido Y  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " Centro da Secao"; RT_TAB$(79); ""; ""   '@1a7f2 DS:25c0,2dba,317a
V_11ec! = V_11e0!   '@1a84d
CALL S_22ee1   '@1a85e
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1a9a3   '@1a868
L_1a870:
LOCATE 24, 1   '@1a870
PRINT " Sentido Y  -  Escolha do Vertice de Referencia"; RT_TAB$(79); ""; ""   '@1a88b DS:25c0,319e
PRINT " <S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1a8b4 DS:25c0,2abe,2e02
V_11ec! = V_11e0!   '@1a8dd
CALL S_22ee1   '@1a8ee
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1a91b   '@1a8f8 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1a323   '@1a913
L_1a91b:
LOCATE 24, 1   '@1a91b
PRINT " Sentido Y  -  Pilar Referencia "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11e0!)))); " vertice"; V_11dc!; RT_TAB$(79); ""; ""   '@1a936 DS:25c0,2e4a,317a
L_1a9a3:
V_1af2! = V_11dc!   '@1a9a3
V_1b1e! = V_11d8!   '@1a9b4
LOCATE 25, 1   '@1a9c5
PRINT ""; RT_TAB$(79); ""; "";   '@1a9e0 DS:25c0
LOCATE 25, 1   '@1aa09
PRINT " Distancia relativa da referencia ao vertice Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))); "* ";   '@1aa24 DS:2a3c,3728
CALL MIXT_07f1_LimpaTeclado   '@1aa60
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1aa6a DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1aac1   '@1aa84
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))   '@1aa99
L_1aac1:
V_1ae2! = VAL(V_0e0c$)   '@1aac1
GOTO L_1af15   '@1aadb
L_1aae3:
IF NOT (V_239a$ <> "V") THEN GOTO L_1ab07   '@1aae3 DS:2ec0
IF NOT (V_239a$ = "v") THEN GOTO L_1ae37   '@1aaf5 DS:2ec6
L_1ab07:
LOCATE 24, 1   '@1ab11
PRINT ""; RT_TAB$(79); ""; "";   '@1ab2c DS:25c0
LOCATE 25, 1   '@1ab55
PRINT ""; RT_TAB$(79); ""; "";   '@1ab70 DS:25c0
LOCATE 24, 1   '@1ab99
PRINT " Sentido Y  -  Escolha da Viga de Referencia"; RT_TAB$(79); ""; ""   '@1abb4 DS:25c0,31d2
PRINT " <S>im Viga de referencia                 <*P*>roxima   <A>nterior   <C>ancela"; RT_TAB$(79); ""; " ";   '@1abdd DS:25c0,2abe,2efc
V_11d4! = V_1b12!   '@1ac06
V_11d8! = V_1b16!   '@1ac17
V_11ec! = -V_11b8!   '@1ac28
V_11e4! = 1.0   '@1ac3c DS:2624
CALL S_23d3c   '@1ac4d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_11dc! = -1.0) THEN GOTO L_1ac7a   '@1ac57 DS:27ee
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_19ca2   '@1ac72
L_1ac7a:
LOCATE 24, 1   '@1ac7a
PRINT " Sentido Y  -  Viga Referencia "; V_0e10$; "("; LTRIM$(STR$(V_11d8!)); ")"; RT_TAB$(79); ""; "";   '@1ac95 DS:25c0,2aee,2af4,3202
V_1b1e! = V_11d8!   '@1acf2
LOCATE 25, 1   '@1ad03
PRINT ""; RT_TAB$(79); ""; "";   '@1ad1e DS:25c0
LOCATE 25, 1   '@1ad47
PRINT " Distancia relativa da Viga referencia a face Y= *"; LTRIM$(STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))); "* ";   '@1ad62 DS:2a3c,375e
V_1ada! = 0.0   '@1ad9e DS:27ea
CALL MIXT_07f1_LimpaTeclado   '@1adaf
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1adb9 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1ae10   '@1add3
V_0e0c$ = STR$(RT_SNG!(FX##(V_1b16!) - V_1b1e!))   '@1ade8
L_1ae10:
V_1ae2! = FX##(V_1b1e!) + VAL(V_0e0c$)   '@1ae10
GOTO L_1af15   '@1ae2f
L_1ae37:
IF NOT (V_239a$ <> "R") THEN GOTO L_1ae5b   '@1ae37 DS:2fdc
IF NOT (V_239a$ = "r") THEN GOTO L_1af08   '@1ae49 DS:2fe2
L_1ae5b:
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@1ae5b DS:27c8,27cc
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_165f6   '@1aef8
L_1af08:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_19ca2   '@1af08
L_1af15:
L_1af1a:
GOSUB L_1ea26   '@1af1f
LOCATE 24, 50   '@1af2c
CALL MIXT_07f1_LimpaTeclado   '@1af4a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUT "Corfirme Alteracao N/*S* ", V_0e0c$   '@1af54 DS:3226
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_GPONTO RT_SNG!((FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), A_27d0%(1), PSET: RT_GFIM   '@1af6e DS:27c8,27cc
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1b030   '@1b00b DS:2814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_165f6   '@1b028
L_1b030:
V_226a! = 1.0   '@1b030 DS:2624
L_1b046:
V_11c0! = VAL(RT_MID2$((V_1b0e$), (RT_CINT%(FX##(V_226a!) + 1.0))))   '@1b046 DS:2624
IF NOT (V_1ace! <> 100.0) THEN GOTO L_1b126   '@1b07a DS:27f2
V_23a2! = 0.0   '@1b095 DS:27ea
CALL S_3e559(V_11c0!, V_23a2!, V_23a6!)   '@1b0a6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = V_23a6!   '@1b0b8
V_23aa! = 2.0   '@1b0dc DS:288e
CALL S_3e559(V_11c0!, V_23aa!, V_23ae!)   '@1b0ed
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = V_23ae!   '@1b0ff
L_1b126:
IF NOT (V_1ada! <> 100.0) THEN GOTO L_1b1d6   '@1b126 DS:27f2
V_23b2! = 1.0   '@1b141 DS:2624
CALL S_3e559(V_11c0!, V_23b2!, V_23b6!)   '@1b152
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = V_23b6!   '@1b164
V_23ba! = 3.0   '@1b189 DS:3414
CALL S_3e559(V_11c0!, V_23ba!, V_23be!)   '@1b19a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = V_23be!   '@1b1ac
L_1b1d6:
V_23c2! = V_1ace!   '@1b1d6
IF NOT (V_23c2! = 0.0) THEN GOTO L_1b31d   '@1b1e7 DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = 0.0   '@1b202 DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = 0.0   '@1b22c DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 2) = 0.0   '@1b257 DS:27ea
A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - V_1b12! + V_1ad6!   '@1b27f
A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) - V_1b12! + V_1ad6!   '@1b2cc
GOTO L_1b5e6   '@1b315
L_1b31d:
IF NOT (V_23c2! = -1.0) THEN GOTO L_1b44e   '@1b31e DS:27ee
A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = -1.0   '@1b333 DS:27ee
A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = V_1ad2!   '@1b35d
A_17d4!(RT_CINT%(FX##(V_11c0!)), 2) = 0.0   '@1b388 DS:27ea
A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - V_1b12! + V_1ad6!   '@1b3b0
A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) - V_1b12! + V_1ad6!   '@1b3fd
GOTO L_1b5e6   '@1b446
L_1b44e:
IF NOT (V_23c2! = -2.0) THEN GOTO L_1b5aa   '@1b44f DS:27f6
A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = -2.0   '@1b464 DS:27f6
A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = V_1ad2!   '@1b48e
A_17d4!(RT_CINT%(FX##(V_11c0!)), 2) = V_1aea!   '@1b4b9
A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = V_1b1a!   '@1b4e1
A_1608!(RT_CINT%(FX##(V_11c0!)), 0) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 0)) - V_1b12! + V_1ad6!   '@1b50c
A_1608!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 2)) - V_1b12! + V_1ad6!   '@1b559
GOTO L_1b5e6   '@1b5a2
L_1b5aa:
IF NOT (V_23c2! = -3.0) THEN GOTO L_1b5c8   '@1b5ab DS:27fe
GOTO L_1b5e6   '@1b5c0
L_1b5c8:
IF NOT (V_23c2! = 100.0) THEN GOTO L_1b5e6   '@1b5c9 DS:27f2
GOTO L_1b5e6   '@1b5de
L_1b5e6:
V_23c6! = V_1ada!   '@1b5e6
IF NOT (V_23c6! = 0.0) THEN GOTO L_1b739   '@1b5f7 DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = 0.0   '@1b612 DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = 0.0   '@1b63d DS:27ea
A_17d4!(RT_CINT%(FX##(V_11c0!)), 5) = 0.0   '@1b668 DS:27ea
A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - V_1b16! + V_1ae2!   '@1b693
A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) - V_1b16! + V_1ae2!   '@1b6e2
GOTO L_1ba1a   '@1b731
L_1b739:
IF NOT (V_23c6! = -1.0) THEN GOTO L_1b876   '@1b73a DS:27ee
A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = -1.0   '@1b74f DS:27ee
A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = V_1ade!   '@1b77a
A_17d4!(RT_CINT%(FX##(V_11c0!)), 5) = 0.0   '@1b7a5 DS:27ea
A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - V_1b16! + V_1ae2!   '@1b7d0
A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) - V_1b16! + V_1ae2!   '@1b81f
GOTO L_1ba1a   '@1b86e
L_1b876:
IF NOT (V_23c6! = -2.0) THEN GOTO L_1b9de   '@1b877 DS:27f6
A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = -2.0   '@1b88c DS:27f6
A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = V_1ade!   '@1b8b7
A_17d4!(RT_CINT%(FX##(V_11c0!)), 5) = V_1af2!   '@1b8e2
A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = V_1b1e!   '@1b90d
A_1608!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 1)) - V_1b16! + V_1ae2!   '@1b938
A_1608!(RT_CINT%(FX##(V_11c0!)), 3) = FX##(A_1608!(RT_CINT%(FX##(V_11c0!)), 3)) - V_1b16! + V_1ae2!   '@1b987
GOTO L_1ba1a   '@1b9d6
L_1b9de:
IF NOT (V_23c6! = -3.0) THEN GOTO L_1b9fc   '@1b9df DS:27fe
GOTO L_1ba1a   '@1b9f4
L_1b9fc:
IF NOT (V_23c6! = 100.0) THEN GOTO L_1ba1a   '@1b9fd DS:27f2
GOTO L_1ba1a   '@1ba12
L_1ba1a:
A_17d4!(RT_CINT%(FX##(V_11c0!)), 6) = 2.0   '@1ba1a DS:288e
V_226a! = RT_INSTR%((RT_CINT%(FX##(V_226a!) + 1.0)), (V_1b0e$), ("/"))   '@1ba45 DS:2624,2b60
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
IF NOT (LEN(V_1b0e$) <= V_226a!) THEN GOTO L_1b046   '@1ba73
V_2566% = 1   '@1ba97
V_256c% = 0   '@1baa2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_163ed   '@1baad
L_1babd:
IF NOT (V_224a$ <> "B") THEN GOTO L_1bae1   '@1babd DS:3794
IF NOT (V_224a$ = "b") THEN GOTO L_1bae9   '@1bacf DS:379a
L_1bae1:
GOTO L_1df3d   '@1bae1
L_1bae9:
IF NOT (V_224a$ <> "R") THEN GOTO L_1bb0d   '@1bae9 DS:2fdc
IF NOT (V_224a$ = "r") THEN GOTO L_1bbe7   '@1bafb DS:2fe2
L_1bb0d:
IF NOT (V_256a% = 1 OR (V_2568% = 1 OR (V_2566% = 1 OR V_2564% = 1))) THEN GOTO L_1bbd7   '@1bb0d
RT_VIEWPRINT 23, 25   '@1bb4b
RT_CLS 2   '@1bb5d
RT_VIEWPRINT 1, 25   '@1bb6b
LOCATE 24, 1   '@1bb7d
PRINT " Aguarde ...";   '@1bb98 DS:37a0
V_157a$ = "FORMEDCA"   '@1bba6 DS:37b0
V_0e0c$ = "FORMINIT"   '@1bbb8 DS:2628
GOTO L_1f8f7   '@1bbca
L_1bbd7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1bbd7
L_1bbe7:
IF NOT (V_224a$ <> "D") THEN GOTO L_1bc0b   '@1bbe7 DS:37bc
IF NOT (V_224a$ = "d") THEN GOTO L_1bc13   '@1bbf9 DS:37c2
L_1bc0b:
GOTO L_1df3d   '@1bc0b
L_1bc13:
IF NOT (V_224a$ <> "C") THEN GOTO L_1bc37   '@1bc13 DS:29ae
IF NOT (V_224a$ = "c") THEN GOTO L_1bc51   '@1bc25 DS:29b4
L_1bc37:
CALL S_44f95   '@1bc37
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1bc41
L_1bc51:
IF NOT (V_224a$ <> "T") THEN GOTO L_1bc75   '@1bc51 DS:37c8
IF NOT (V_224a$ = "t") THEN GOTO L_1befc   '@1bc63 DS:37ce
L_1bc75:
L_1bc7a:
RT_VIEWPRINT 23, 25   '@1bc7f
RT_CLS 2   '@1bc91
PRINT " Visualizacao e Alteracao da Posicao dos Textos"   '@1bc9f DS:37d4
PRINT " <P>ilares     <V>igas     <L>ajes     Visualiza <T>odos     <*R*>etorna"; RT_TAB$(79); ""; ""   '@1bcad DS:25c0,3808
PRINT " Atencao!  Ajuste os textos apos ter amarrado os elementos estruturais";   '@1bcd6 DS:3854
RT_VIEWPRINT 1, 25   '@1bce4
CALL MIXT_07f1_LimpaTeclado   '@1bcf6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e18$ = ""   '@1bd00 DS:25c0
V_0e0c$ = RT_INPUT$(1)   '@1bd12
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_23ca$ = V_0e0c$   '@1bd2e
IF NOT (V_23ca$ <> "P") THEN GOTO L_1bd69   '@1bd40 DS:2728
IF NOT (V_23ca$ = "p") THEN GOTO L_1bd7b   '@1bd57 DS:272e
L_1bd69:
CALL S_3ac05   '@1bd69
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1beba   '@1bd73
L_1bd7b:
IF NOT (V_23ca$ <> "V") THEN GOTO L_1bd9f   '@1bd7b DS:2ec0
IF NOT (V_23ca$ = "v") THEN GOTO L_1bdb1   '@1bd8d DS:2ec6
L_1bd9f:
CALL S_3beff   '@1bd9f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1beba   '@1bda9
L_1bdb1:
IF NOT (V_23ca$ <> "L") THEN GOTO L_1bdd5   '@1bdb1 DS:389e
IF NOT (V_23ca$ = "l") THEN GOTO L_1bde7   '@1bdc3 DS:38a4
L_1bdd5:
CALL S_39a51   '@1bdd5
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1beba   '@1bddf
L_1bde7:
IF NOT (V_23ca$ <> "T") THEN GOTO L_1be0b   '@1bde7 DS:37c8
IF NOT (V_23ca$ = "t") THEN GOTO L_1bead   '@1bdf9 DS:37ce
L_1be0b:
V_0e18$ = "TODOS"   '@1be0b DS:38aa
CALL S_3ac05   '@1be1d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_3beff   '@1be27
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_39a51   '@1be31
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 24, 1   '@1be3b
PRINT " Continua .."; RT_TAB$(79); ""; ""   '@1be56 DS:25c0,38b4
CALL MIXT_07f1_LimpaTeclado   '@1be7f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1be89
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
GOTO L_1beba   '@1bea5
L_1bead:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1bead
L_1beba:
CALL S_1fa3b   '@1beba
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_20182   '@1bec4
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_2193a   '@1bece
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_212be   '@1bed8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
CALL S_20f46   '@1bee2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1bc7a   '@1beec
L_1befc:
IF NOT (V_224a$ <> "E") THEN GOTO L_1bf20   '@1befc DS:2bca
IF NOT (V_224a$ = "e") THEN GOTO L_1bf3a   '@1bf0e DS:2bd0
L_1bf20:
CALL S_40187   '@1bf20
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1bf2a
L_1bf3a:
IF NOT (V_224a$ <> "Z") THEN GOTO L_1bf5e   '@1bf3a DS:38c4
IF NOT (V_224a$ = "z") THEN GOTO L_1c0b0   '@1bf4c DS:38ca
L_1bf5e:
RT_VIEWPRINT 23, 25   '@1bf5e
RT_CLS 2   '@1bf70
RT_VIEWPRINT 1, 25   '@1bf7e
LOCATE 24, 1   '@1bf90
PRINT "   <D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna";   '@1bfab DS:38d0
CALL MIXT_07f1_LimpaTeclado   '@1bfb9
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1bfc3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_23ce$ = V_0e0c$   '@1bfdf
IF NOT (V_23ce$ <> "D") THEN GOTO L_1c01a   '@1bff1 DS:37bc
IF NOT (V_23ce$ = "d") THEN GOTO L_1c05d   '@1c008 DS:37c2
L_1c01a:
CALL S_261a9   '@1c01a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_0e0c$ = "FIM") THEN GOTO L_1c043   '@1c024 DS:391e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1c03b
L_1c043:
CALL S_20182   '@1c043
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b47   '@1c04d
L_1c05d:
IF NOT (V_23ce$ <> "T") THEN GOTO L_1c081   '@1c05d DS:37c8
IF NOT (V_23ce$ = "t") THEN GOTO L_1c09b   '@1c06f DS:37ce
L_1c081:
CALL S_20182   '@1c081
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10a9b   '@1c08b
L_1c09b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1c09b
L_1c0b0:
IF NOT (V_224a$ <> "G") THEN GOTO L_1c0d4   '@1c0b0 DS:3926
IF NOT (V_224a$ = "g") THEN GOTO L_1d82a   '@1c0c2 DS:392c
L_1c0d4:
IF NOT (V_256a% = 1 OR (V_2568% = 1 OR (V_2566% = 1 OR V_2564% = 1))) THEN GOTO L_1c19d   '@1c0d4
RT_VIEWPRINT 23, 25   '@1c112
RT_CLS 2   '@1c124
PRINT " Existem elementos alterados."   '@1c132 DS:3932
PRINT " Acione REDESENHA para atualizacao e depois grave os dados da forma.";   '@1c140 DS:3954
RT_VIEWPRINT 1, 25   '@1c14e
BEEP   '@1c160
CALL MIXT_07f1_LimpaTeclado   '@1c16a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1c174
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1c190
L_1c19d:
L_1c1a2:
RT_VIEWPRINT 23, 25   '@1c1a7
RT_CLS 2   '@1c1b9
V_0e0c$ = V_0e32$   '@1c1c7
IF NOT (V_0e32$ = "") THEN GOTO L_1c202   '@1c1d9 DS:25c0
V_0e0c$ = "RETORNA"   '@1c1f0 DS:399c
L_1c202:
PRINT " Gravacao dos dados da Forma"   '@1c202 DS:39a8
LOCATE 25, 1   '@1c210
PRINT " Acione   D <Enter>   para alterar Drive e Diretorio";   '@1c22b DS:39c8
LOCATE 24, 1   '@1c239
PRINT " "; V_0e4e$; " *"; V_0e0c$; "* ";   '@1c254 DS:2a3c,2abe,3a00
CALL MIXT_07f1_LimpaTeclado   '@1c286
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1c290 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "D") THEN GOTO L_1c2e1   '@1c2aa DS:37bc
GOSUB L_1efb9   '@1c2c7
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1c1a2   '@1c2d4
L_1c2e1:
IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_1c308   '@1c2e1
V_0e0c$ = V_0e32$   '@1c2f6
L_1c308:
L_BP0c% = (VAL(V_0e0c$) > 0.0#)   '@1c308 DS:27c0
L_BP0e% = VAL(V_0e0c$) < 0.0# OR L_BP0c%   '@1c33b
L_BP10% = RT_INSTR%((1), (V_0e0c$), (" ")) > 0 OR L_BP0e%   '@1c366 DS:2abe
IF NOT ((LEN(V_0e0c$) > 8 OR L_BP10%) <> 0) THEN GOTO L_1c3a7   '@1c37d
BEEP   '@1c395
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1c1a2   '@1c39f
L_1c3a7:
V_0e32$ = UCASE$(V_0e0c$)   '@1c3a7
LOCATE 25, 1   '@1c3bf
PRINT " "; RT_TAB$(79); ""; "";   '@1c3da DS:25c0,2abe
LOCATE 25, 1   '@1c403
PRINT " Sigo com a gravacao em "; V_0e4e$ + V_0e32$ + ".FRM   N/*S*";   '@1c41e DS:3a06,3a22
CALL MIXT_07f1_LimpaTeclado   '@1c449
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV " ", V_0e0c$   '@1c453 DS:2abe (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_1c492   '@1c46d DS:2814
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1c48a
L_1c492:
LOCATE 25, 1   '@1c492
PRINT " Aguarde ..."; RT_TAB$(79); ""; "";   '@1c4ad DS:25c0,37a0
ON ERROR GOTO L_1f372
RT_ONERR = &H1f372   '@1c4d6
IF RT_DISP%(V_0e4e$ + V_0e32$ + ".FRM") THEN OPEN RT_ARQ$(V_0e4e$ + V_0e32$ + ".FRM") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0e4e$ + V_0e32$ + ".FRM") FOR OUTPUT AS #1   '@1c4e5 DS:3a32,3a38
PRINT #1, "SISTRUT Software e Tecnologia s/c Ltda"   '@1c513 DS:3a40
PRINT #1, "arquivo de dados de forma gravado em "; RT_DATE$; "   "; RT_MID$((RT_TIME$), (1), (5))   '@1c52a DS:3a6a,3a94
PRINT #1, V_0e2a$   '@1c56e
PRINT #1, V_0e26$   '@1c585
PRINT #1, V_0e2e$   '@1c59c
PRINT #1, V_0e42$   '@1c5b3
PRINT #1, V_0e3e$   '@1c5ca
PRINT #1, V_0e46$   '@1c5e1
PRINT #1, V_0e22$   '@1c5f8
PRINT #1, 0   '@1c60f
PRINT #1, 0   '@1c625
PRINT #1, 0   '@1c63b
PRINT #1, A_157e%(0)   '@1c651
IF NOT (A_157e%(0) > 0) THEN GOTO L_1c71b   '@1c676
V_23d2! = A_157e%(0)   '@1c695
FOR V_11b8! = 0.0 TO V_23d2!   '@1c6b9 DS:2624,27ea
PRINT #1, A_157e%(RT_CINT%(FX##(V_11b8!)))   '@1c6c0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1c6ed DS:2624
L_1c71b:
PRINT #1, A_15ac%(0)   '@1c71b
IF NOT (A_15ac%(0) > 0) THEN GOTO L_1c7e5   '@1c740
V_23d6! = A_15ac%(0)   '@1c75f
FOR V_11b8! = 0.0 TO V_23d6!   '@1c783 DS:2624,27ea
PRINT #1, A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@1c78a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1c7b7 DS:2624
L_1c7e5:
PRINT #1, A_15da!(0, 0)   '@1c7e5
IF NOT (A_15da!(0, 0) > 0.0) THEN GOTO L_1c906   '@1c80f DS:27ea
V_23da! = A_15da!(0, 0)   '@1c839
FOR V_11b8! = 0.0 TO V_23da!   '@1c85a DS:2624,27ea
FOR V_11bc! = 0.0 TO 5.0   '@1c862 DS:2624,27ea,3420
PRINT #1, A_15da!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1c870
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1c8ac DS:2624,3420
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1c8d5 DS:2624
L_1c906:
PRINT #1, A_1608!(0, 1)   '@1c906
PRINT #1, A_1608!(0, 0)   '@1c933
IF NOT (A_1608!(0, 0) > 0.0) THEN GOTO L_1cb1c   '@1c95d DS:27ea
V_23de! = A_1608!(0, 0)   '@1c987
FOR V_11b8! = 0.0 TO V_23de!   '@1c9a8 DS:2624,27ea
FOR V_11bc! = 0.0 TO 4.0   '@1c9b0 DS:2624,27ea,3436
PRINT #1, A_1608!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1c9be
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1c9fa DS:2624,3436
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1ca23 DS:2624
V_23e2! = A_1608!(0, 0)   '@1ca4f
FOR V_11b8! = 0.0 TO V_23e2!   '@1ca70 DS:2624,27ea
FOR V_11bc! = 0.0 TO 8.0   '@1ca78 DS:2624,27ea,3a9c
PRINT #1, A_17d4!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1ca86
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1cac2 DS:2624,3a9c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1caeb DS:2624
L_1cb1c:
PRINT #1, A_1636!(0, 0)   '@1cb1c
IF NOT (A_1636!(0, 0) > 0.0) THEN GOTO L_1cc3c   '@1cb46 DS:27ea
V_23e6! = A_1636!(0, 0)   '@1cb70
FOR V_11b8! = 0.0 TO V_23e6!   '@1cb91 DS:2624,27ea
FOR V_11bc! = 0.0 TO 4.0   '@1cb98 DS:2624,27ea,3436
PRINT #1, A_1636!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1cba6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1cbe2 DS:2624,3436
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1cc0b DS:2624
L_1cc3c:
PRINT #1, A_15ac%(A_15ac%(0) + 1)   '@1cc3c
PRINT #1, 1   '@1cc6f
V_23ea! = A_1200!(0, 0, 0)   '@1cc86
FOR V_11b8! = 1.0 TO V_23ea!   '@1cca8 DS:2624
FOR V_11bc! = 0.0 TO 13.0   '@1ccb0 DS:2624,27ea,3aa0
PRINT #1, A_1200!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 2)   '@1ccbe
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1ccfe DS:2624,3aa0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1cd27 DS:2624
PRINT #1, A_1200!(1, 14, 3)   '@1cd53
PRINT #1, A_1200!(1, 14, 4)   '@1cd82
PRINT #1, 0   '@1cdb4
PRINT #1, A_1664!(0, 0)   '@1cdca
IF NOT (A_1664!(0, 0) > 0.0) THEN GOTO L_1ceea   '@1cdf4 DS:27ea
V_23ee! = A_1664!(0, 0)   '@1ce1e
FOR V_11b8! = 0.0 TO V_23ee!   '@1ce3f DS:2624,27ea
FOR V_11bc! = 0.0 TO 4.0   '@1ce46 DS:2624,27ea,3436
PRINT #1, A_1664!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1ce54
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1ce90 DS:2624,3436
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1ceb9 DS:2624
L_1ceea:
PRINT #1, A_1608!(0, 0)   '@1ceea
IF NOT (A_1608!(0, 0) > 0.0) THEN GOTO L_1d048   '@1cf14 DS:27ea
V_23f2! = A_1608!(0, 0)   '@1cf3e
FOR V_11b8! = 0.0 TO V_23f2!   '@1cf5f DS:2624,27ea
FOR V_11bc! = 0.0 TO 6.0   '@1cf66 DS:2624,27ea,3aa4
PRINT #1, A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 0)   '@1cf74
PRINT #1, A_171c%(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)), 1)   '@1cfaf
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1cfeb DS:2624,3aa4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d017 DS:2624
L_1d048:
PRINT #1, A_1692!(0, 0)   '@1d048
IF NOT (A_1692!(0, 0) > 0.0) THEN GOTO L_1d168   '@1d072 DS:27ea
V_23f6! = A_1692!(0, 0)   '@1d09c
FOR V_11b8! = 0.0 TO V_23f6!   '@1d0bd DS:2624,27ea
FOR V_11bc! = 0.0 TO 4.0   '@1d0c4 DS:2624,27ea,3436
PRINT #1, A_1692!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1d0d2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1d10e DS:2624,3436
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d137 DS:2624
L_1d168:
PRINT #1, 0   '@1d168
PRINT #1, 0   '@1d17e
PRINT #1, 0   '@1d194
PRINT #1, 0   '@1d1aa
PRINT #1, 0   '@1d1c0
PRINT #1, 0   '@1d1d6
PRINT #1, V_1802%   '@1d1ec
IF NOT (V_1802% = 1) THEN GOTO L_1d416   '@1d203
PRINT #1, A_1832%(0, 0)   '@1d212
V_23fa! = A_1832%(0, 0)   '@1d238
FOR V_11b8! = 0.0 TO V_23fa!   '@1d25d DS:2624,27ea
PRINT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 0)   '@1d264
PRINT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 1)   '@1d294
PRINT #1, A_1832%(RT_CINT%(FX##(V_11b8!)), 2)   '@1d2c5
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d2f3 DS:2624
PRINT #1, A_1804!(0, 0)   '@1d31f
V_23fe! = A_1804!(0, 0)   '@1d349
FOR V_11b8! = 0.0 TO V_23fe!   '@1d36a DS:2624,27ea
FOR V_11bc! = 0.0 TO 5.0   '@1d372 DS:2624,27ea,3420
PRINT #1, A_1804!(RT_CINT%(FX##(V_11b8!)), RT_CINT%(FX##(V_11bc!)))   '@1d380
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11bc!   '@1d3bc DS:2624,3420
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d3e5 DS:2624
L_1d416:
PRINT #1, A_0f30%(0, 0)   '@1d416
IF NOT (A_0f30%(0, 0) > 0) THEN GOTO L_1d51a   '@1d43c
V_2402! = A_0f30%(0, 0)   '@1d45c
FOR V_11b8! = 0.0 TO V_2402!   '@1d481 DS:2624,27ea
PRINT #1, A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)   '@1d488
PRINT #1, A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)   '@1d4b8
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d4e9 DS:2624
L_1d51a:
PRINT #1, A_15da!(0, 0)   '@1d51a
IF NOT (A_15da!(0, 0) > 0.0) THEN GOTO L_1d628   '@1d544 DS:27ea
V_2406! = A_15da!(0, 0)   '@1d56e
FOR V_11b8! = 0.0 TO V_2406!   '@1d58f DS:2624,27ea
PRINT #1, A_174a%(RT_CINT%(FX##(V_11b8!)), 0)   '@1d596
PRINT #1, A_174a%(RT_CINT%(FX##(V_11b8!)), 1)   '@1d5c6
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d5f7 DS:2624
L_1d628:
PRINT #1, A_157e%(0)   '@1d628
IF NOT (A_157e%(0) > 0) THEN GOTO L_1d758   '@1d64d
V_240a! = A_157e%(0)   '@1d66c
FOR V_11b8! = 0.0 TO V_240a!   '@1d690 DS:2624,27ea
PRINT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 0)   '@1d698
PRINT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 1)   '@1d6c8
PRINT #1, A_1778%(RT_CINT%(FX##(V_11b8!)), 2)   '@1d6f9
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_11b8!   '@1d727 DS:2624
L_1d758:
PRINT #1, 0   '@1d758
PRINT #1, 0   '@1d76e
PRINT #1, 0   '@1d784
PRINT #1, 0   '@1d79a
PRINT #1, 0   '@1d7b0
PRINT #1, 0   '@1d7c6
PRINT #1, "TERMINO DO ARQUIVO"   '@1d7dc DS:3aa8
RT_CLOSE   '@1d7f3 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
V_256c% = 1   '@1d800
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1d80b
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1d81a
L_1d82a:
IF NOT (V_224a$ <> "F") THEN GOTO L_1d84e   '@1d82a DS:344c
IF NOT (V_224a$ = "f") THEN GOTO L_1dddc   '@1d83c DS:3452
L_1d84e:
IF NOT (V_256a% = 1 OR (V_2568% = 1 OR (V_2566% = 1 OR V_2564% = 1))) THEN GOTO L_1d8a3   '@1d84e
BEEP   '@1d88c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1d896
L_1d8a3:
IF NOT (V_256c% = 0) THEN GOTO L_1d92d   '@1d8a3
RT_VIEWPRINT 23, 25   '@1d8b2
RT_CLS 2   '@1d8c4
PRINT " Atencao !!"   '@1d8d2 DS:3abe
PRINT " As alteracoes executadas nao foram gravadas."   '@1d8e0 DS:3ace
PRINT " A geracao de dados para Desenho de Viga e Pilar sera feita apos a gravacao.";   '@1d8ee DS:3b00
CALL MIXT_07f1_LimpaTeclado   '@1d8fc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1d906 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1d920
L_1d92d:
RT_VIEWPRINT 23, 25   '@1d92d
RT_CLS 2   '@1d93f
PRINT " Geracao dos dados para Desenho de Vigas e Desenho de Pilares"   '@1d94d DS:3b50
PRINT " <V>igas - geracao .FOR         <P>ilares - geracao .CFO         <*R*>etorna"   '@1d95b DS:3b92
CALL MIXT_07f1_LimpaTeclado   '@1d969
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1d973
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_240e$ = V_0e0c$   '@1d98f
IF NOT (V_240e$ <> "V") THEN GOTO L_1d9ca   '@1d9a1 DS:2ec0
IF NOT (V_240e$ = "v") THEN GOTO L_1dc96   '@1d9b8 DS:2ec6
L_1d9ca:
RT_CLS 2   '@1d9ca
PRINT " Geracao dos dados para Desenho de Vigas (.FOR)"   '@1d9d8 DS:3be2
PRINT " Atualizacao dos dados da Forma das Vigas da Obra "; V_0e26$   '@1d9e6 DS:3c16
PRINT " Sigo com atualizacao  S/*N* ";   '@1d9fd DS:3c4c
CALL MIXT_07f1_LimpaTeclado   '@1da0b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1da15 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_1da54   '@1da2f DS:343a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1da4c
L_1da54:
LOCATE 25, 40   '@1da54
PRINT "Aguarde ...";   '@1da72 DS:3c6e
CALL S_3018c   '@1da80
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
ON ERROR GOTO L_1db03
RT_ONERR = &H1db03   '@1da8a
OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOK") FOR INPUT AS #2   '@1da99 DS:3c7e
RT_CLOSE   '@1dac7 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
KILL RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOK")   '@1dad4 DS:3c7e
GOTO L_1db27   '@1daf6
' ---- F_1dafe @0x1dafe  (01dafe_F_1dafe.lift.txt; evidence_id (assembly): ev_38e8389e8e0cf3fe77443edfc19dbb9f0b9f4ec5b8c44437afb951c708e23da0)
L_1db03:   ' entrada vinda de 010030_M_FORMEDCA
RT_CLOSE   '@1db08 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RESUME L_1db27   '@1db15
L_1db27:   ' entrada vinda de 010030_M_FORMEDCA
ON ERROR GOTO L_1dc6f
RT_ONERR = &H1dc6f   '@1db2c
OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOR") FOR INPUT AS #2   '@1db3b DS:3c86
RT_CLOSE   '@1db69 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
LOCATE 25, 1   '@1db76
PRINT " Dados anteriores copiados para "; V_0e3e$; V_0e26$; ".FOK"; RT_TAB$(79); ""; "";   '@1db91 DS:25c0,3c7e,3c8e
NAME RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOR") AS RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOK")   '@1dbd5 DS:3c7e,3c86
L_1dc14:   ' entrada vinda de 01dc6a_F_1dc6a
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1dc19
NAME RT_ARQ$(V_0e3e$ + V_0e26$ + ".$$$") AS RT_ARQ$(V_0e3e$ + V_0e26$ + ".FOR")   '@1dc28 DS:3c86,3cb2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1dc62
' ---- F_1dc6a @0x1dc6a  (01dc6a_F_1dc6a.lift.txt; evidence_id (assembly): ev_cb18f638c702bff5561f7c7f1ca77081e5e9a9ca55288776df5da473142d1e1d)
L_1dc6f:   ' entrada vinda de 01dafe_F_1dafe
RT_CLOSE   '@1dc74 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
RESUME L_1dc14   '@1dc81
' @1dc8e (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_1ddd4   '@1dc8e
' ---- FUN_1000_dc96 @0x1dc96  (01dc96_FUN_1000_dc96.lift.txt; evidence_id (assembly): ev_8ad98f6f47218904c6d0c580cbee32b92f2710c397b512de0ae197561e10f2af)
L_1dc96:   ' entrada vinda de 010030_M_FORMEDCA
IF NOT (V_240e$ <> "P") THEN GOTO L_1dcba   '@1dc96 DS:2728
IF NOT (V_240e$ = "p") THEN GOTO L_1ddc7   '@1dca8 DS:272e
L_1dcba:
RT_CLS 2   '@1dcba
PRINT " Geracao dos dados para Desenho de Pilares (.CFO)"   '@1dcc8 DS:3cba
PRINT " Atualizacao dos dados das Cotas de Arrazamento da Obra "; V_0e2e$; " nivel "; A_13de$(A_15ac%(A_15ac%(0) + 1))   '@1dcd6 DS:3cf0,3d2c
PRINT " Certifique-se da COTA BASICA.   Sigo com atualizacao  S/*N* ";   '@1dd25 DS:3d38
CALL MIXT_07f1_LimpaTeclado   '@1dd33
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1dd3d DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@1dd57
PRINT "  *** AINDA NAO DISPONIVEL ***"; RT_TAB$(79); ""; "";   '@1dd72 DS:25c0,3d7a
V_0e0c$ = RT_INPUT$(1)   '@1dd9b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1ddb7
L_1ddc7:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1ddc7
' ---- FUN_1000_ddd4 @0x1ddd4  (01ddd4_FUN_1000_ddd4.lift.txt; evidence_id (assembly): ev_e6c19e4e701c90cb3851118f1344d20e48071ba92110540c25cf3b7bfa692fcd)
L_1ddd4:   ' entrada vinda de 01dc6a_F_1dc6a
GOTO L_1df3d   '@1ddd4
' ---- FUN_1000_dddc @0x1dddc  (01dddc_FUN_1000_dddc.lift.txt; evidence_id (assembly): ev_3f0f2dcbc699160f4c6badb2a8cd9a8997eb596819b8900bb87252385cdb654e)
L_1dddc:   ' entrada vinda de 010030_M_FORMEDCA
IF NOT (V_224a$ <> "S") THEN GOTO L_1de00   '@1dddc DS:343a
IF NOT (V_224a$ = "s") THEN GOTO L_1df30   '@1ddee DS:3440
L_1de00:
IF NOT (V_256a% = 1 OR (V_2568% = 1 OR (V_2566% = 1 OR V_2564% = 1))) THEN GOTO L_1de55   '@1de00
BEEP   '@1de3e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1de48
L_1de55:
IF NOT (V_256c% = 0) THEN GOTO L_1df0e   '@1de55
RT_VIEWPRINT 23, 25   '@1de64
RT_CLS 2   '@1de76
PRINT " Atencao !!"   '@1de84 DS:3abe
PRINT " As alteracoes executadas nao foram gravadas."   '@1de92 DS:3ace
PRINT " Abandono as Modificacoes  S/*N* ";   '@1dea0 DS:3d9c
CALL MIXT_07f1_LimpaTeclado   '@1deae
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "", V_0e0c$   '@1deb8 DS:25c0 (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_VIEWPRINT 1, 25   '@1ded2
IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_1df09   '@1dee4 DS:343a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1df01
L_1df09:
L_1df0e:
V_0e0c$ = "FORMA"   '@1df0e DS:261a
GOTO L_1f8f7   '@1df20
L_1df30:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10bcd   '@1df30
' ---- FUN_1000_df3d @0x1df3d  (01df3d_FUN_1000_df3d.lift.txt; evidence_id (assembly): ev_f9c6a20a7c5ba5596152fb29735b820748de5f349bcba29486ff27143ca7c594)
L_1df3d:   ' entrada vinda de 010030_M_FORMEDCA, 01ddd4_FUN_1000_ddd4
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1df3d
' ---- F_1df45 @0x1df45  (01df45_F_1df45.lift.txt; evidence_id (assembly): ev_6bf1de25e37a7cba2caec82af676b322f6e8731864da8f0eb8dab046a9264120)
L_1df4a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMEDCA
RT_VIEWPRINT 23, 25   '@1df4f
RT_CLS 2   '@1df61
LOCATE 23, 1   '@1df6f
PRINT " Pilar -"; V_11b8!; " Nome - "; A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@1df8a DS:3dc2,3dce
LOCATE 24, 3   '@1dfd7
V_2412! = V_1ace!   '@1dff5
IF NOT (V_2412! = 0.0) THEN GOTO L_1e0c0   '@1e006 DS:27ea
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e082   '@1e021
PRINT "Centro da Secao  Coordenada Absoluta em X="; V_1ad6!;   '@1e05f DS:3dda
GOTO L_1e0b8   '@1e07a
L_1e082:
PRINT "Vertice"; V_1ad2!; " Coordenada Absoluta em X="; V_1ad6!;   '@1e082 DS:3e08,3e14
L_1e0b8:
GOTO L_1e576   '@1e0b8
L_1e0c0:
IF NOT (V_2412! = -1.0) THEN GOTO L_1e34b   '@1e0c1 DS:27ee
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e222   '@1e0d6
PRINT "Centro do Pilar distante em X="; V_1ad6!; " do eixo "; CHR$(RT_CINT%(FX##(V_1ad2!) + 26& * ((RT_CLNG&(FX##(V_1ad2!)) \ 26&) * (V_1ad2! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_1ad2!) - 1.0) \ 26&), ("'")); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ad2!)), 1)) * 100.0))); ")";   '@1e114 DS:27ee,27f2,2aee,2af4,3e32,3e54,3e62,3e66,3e6e
GOTO L_1e343   '@1e21a
L_1e222:
PRINT "Vertice"; V_1aea!; " distante em X="; V_1ad6!; " do eixo "; CHR$(RT_CINT%(FX##(V_1ad2!) + 26& * ((RT_CLNG&(FX##(V_1ad2!)) \ 26&) * (V_1ad2! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_1ad2!) - 1.0) \ 26&), ("'")); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ad2!)), 1)) * 100.0))); ")";   '@1e222 DS:27ee,27f2,2aee,2af4,3e08,3e54,3e62,3e66,3e6e,3e74
L_1e343:
GOTO L_1e576   '@1e343
L_1e34b:
IF NOT (V_2412! = -2.0) THEN GOTO L_1e558   '@1e34c DS:27f6
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e46e   '@1e361
PRINT "Centro do Pilar distante em X="; V_1ad6!;   '@1e39f DS:3e32
IF NOT (V_1ae6! = 0.0) THEN GOTO L_1e414   '@1e3ba DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!))));   '@1e3d5 DS:3e88
GOTO L_1e466   '@1e40c
L_1e414:
PRINT " do vertice"; V_1ae6!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!))));   '@1e414 DS:3ea0,3eb0
L_1e466:
GOTO L_1e550   '@1e466
L_1e46e:
PRINT "Vertice"; V_1aea!; " distante em X="; V_1ad6!;   '@1e46e DS:3e08,3e74
IF NOT (V_1ae6! = 0.0) THEN GOTO L_1e4f9   '@1e49f DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!))));   '@1e4ba DS:3e88
GOTO L_1e54b   '@1e4f1
L_1e4f9:
PRINT " do vertice"; V_1ae6!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!))));   '@1e4f9 DS:3ea0,3eb0
L_1e54b:
L_1e550:
GOTO L_1e576   '@1e550
L_1e558:
IF NOT (V_2412! = -3.0) THEN GOTO L_1e576   '@1e559 DS:27fe
GOTO L_1e576   '@1e56e
L_1e576:
LOCATE 25, 3   '@1e576
V_2416! = V_1ada!   '@1e594
IF NOT (V_2416! = 0.0) THEN GOTO L_1e65f   '@1e5a5 DS:27ea
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e621   '@1e5c0
PRINT "Centro da Secao  Coordenada Absoluta em Y="; V_1ae2!;   '@1e5fe DS:3ebe
GOTO L_1e657   '@1e619
L_1e621:
PRINT "Vertice"; V_1ade!; " Coordenada Absoluta em Y="; V_1ae2!;   '@1e621 DS:3e08,3eec
L_1e657:
GOTO L_1ea17   '@1e657
L_1e65f:
IF NOT (V_2416! = -1.0) THEN GOTO L_1e7ec   '@1e660 DS:27ee
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e742   '@1e675
PRINT "Centro do Pilar distante em Y="; V_1ae2!; " do eixo"; STR$(V_1ade!); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ade!)), 0)) * 100.0))); ")";   '@1e6b3 DS:27f2,2aee,2af4,3f0a,3f2c
GOTO L_1e7e4   '@1e73a
L_1e742:
PRINT "Vertice"; V_1af2!; " distante em Y="; V_1ae2!; " do eixo"; STR$(V_1ade!); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ade!)), 0)) * 100.0))); ")";   '@1e742 DS:27f2,2aee,2af4,3e08,3f2c,3f38
L_1e7e4:
GOTO L_1ea17   '@1e7e4
L_1e7ec:
IF NOT (V_2416! = -2.0) THEN GOTO L_1e9f9   '@1e7ed DS:27f6
IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_1e90f   '@1e802
PRINT "Centro do Pilar distante em Y="; V_1ae2!;   '@1e840 DS:3f0a
IF NOT (V_1aee! = 0.0) THEN GOTO L_1e8b5   '@1e85b DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!))));   '@1e876 DS:3e88
GOTO L_1e907   '@1e8ad
L_1e8b5:
PRINT " do vertice"; V_1aee!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!))));   '@1e8b5 DS:3ea0,3eb0
L_1e907:
GOTO L_1e9f1   '@1e907
L_1e90f:
PRINT "Vertice"; V_1af2!; " distante em Y="; V_1ae2!;   '@1e90f DS:3e08,3f38
IF NOT (V_1aee! = 0.0) THEN GOTO L_1e99a   '@1e940 DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!))));   '@1e95b DS:3e88
GOTO L_1e9ec   '@1e992
L_1e99a:
PRINT " do vertice"; V_1aee!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!))));   '@1e99a DS:3ea0,3eb0
L_1e9ec:
L_1e9f1:
GOTO L_1ea17   '@1e9f1
L_1e9f9:
IF NOT (V_2416! = -3.0) THEN GOTO L_1ea17   '@1e9fa DS:27fe
GOTO L_1ea17   '@1ea0f
L_1ea17:
RETURN   '@1ea17
L_1ea26:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMEDCA
RT_VIEWPRINT 23, 25   '@1ea2b
RT_CLS 2   '@1ea3d
LOCATE 23, 1   '@1ea4b
PRINT " Viga -"; V_11b8!; " Nome - "; A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!)))); "   faces  "; RT_MID$((V_1b0e$), (1), (45))   '@1ea66 DS:3dce,3f4c,3f58
LOCATE 24, 3   '@1ead3
V_241a! = V_1ace!   '@1eaf1
IF NOT (V_241a! = 0.0) THEN GOTO L_1eb33   '@1eb02 DS:27ea
PRINT "Coordenada Absoluta em X";   '@1eb1d DS:3f66
GOTO L_1ed7e   '@1eb2b
L_1eb33:
IF NOT (V_241a! = -1.0) THEN GOTO L_1ec4a   '@1eb34 DS:27ee
PRINT "Distante do eixo "; CHR$(RT_CINT%(FX##(V_1ad2!) + 26& * ((RT_CLNG&(FX##(V_1ad2!)) \ 26&) * (V_1ad2! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_1ad2!) - 1.0) \ 26&), ("'")); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ad2!)), 1)) * 100.0))); ")"; " em X";   '@1eb49 DS:27ee,27f2,2aee,2af4,3e62,3e66,3e6e,3f82,3f98
GOTO L_1ed7e   '@1ec42
L_1ec4a:
IF NOT (V_241a! = -2.0) THEN GOTO L_1ed34   '@1ec4b DS:27f6
PRINT "Distante";   '@1ec60 DS:3fa2
IF NOT (V_1aea! = 0.0) THEN GOTO L_1ecd1   '@1ec6e DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!)))); " em X";   '@1ec89 DS:3e88,3f98
GOTO L_1ed2c   '@1ecc9
L_1ecd1:
PRINT " do vertice"; V_1aea!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ad2!)))); " em X";   '@1ecd1 DS:3ea0,3eb0,3f98
L_1ed2c:
GOTO L_1ed7e   '@1ed2c
L_1ed34:
IF NOT (V_241a! = -3.0) THEN GOTO L_1ed52   '@1ed35 DS:27fe
GOTO L_1ed7e   '@1ed4a
L_1ed52:
IF NOT (V_241a! = 100.0) THEN GOTO L_1ed7e   '@1ed53 DS:27f2
PRINT "Nao Alterado em X";   '@1ed68 DS:3fae
GOTO L_1ed7e   '@1ed76
L_1ed7e:
LOCATE 25, 3   '@1ed7e
V_241e! = V_1ada!   '@1ed9c
IF NOT (V_241e! = 0.0) THEN GOTO L_1edde   '@1edad DS:27ea
PRINT "Coordenada Absoluta em Y";   '@1edc8 DS:3fc4
GOTO L_1efaa   '@1edd6
L_1edde:
IF NOT (V_241e! = -1.0) THEN GOTO L_1ee76   '@1eddf DS:27ee
PRINT "Distante do eixo"; STR$(V_1ade!); "("; LTRIM$(STR$(RT_SNG!(FX##(A_0e78!(RT_CINT%(FX##(V_1ade!)), 0)) * 100.0))); ")"; " em Y";   '@1edf4 DS:27f2,2aee,2af4,3fe0,3ff4
GOTO L_1efaa   '@1ee6e
L_1ee76:
IF NOT (V_241e! = -2.0) THEN GOTO L_1ef60   '@1ee77 DS:27f6
PRINT "Distante";   '@1ee8c DS:3fa2
IF NOT (V_1af2! = 0.0) THEN GOTO L_1eefd   '@1ee9a DS:27ea
PRINT " do Centro do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!)))); " em Y";   '@1eeb5 DS:3e88,3ff4
GOTO L_1ef58   '@1eef5
L_1eefd:
PRINT " do vertice"; V_1af2!; " do Pilar "; A_143a$(A_15ac%(RT_CINT%(FX##(V_1ade!)))); " em Y";   '@1eefd DS:3ea0,3eb0,3ff4
L_1ef58:
GOTO L_1efaa   '@1ef58
L_1ef60:
IF NOT (V_241e! = -3.0) THEN GOTO L_1ef7e   '@1ef61 DS:27fe
GOTO L_1efaa   '@1ef76
L_1ef7e:
IF NOT (V_241e! = 100.0) THEN GOTO L_1efaa   '@1ef7f DS:27f2
PRINT "Nao Alterado em Y";   '@1ef94 DS:3ffe
GOTO L_1efaa   '@1efa2
L_1efaa:
RETURN   '@1efaa
L_1efb9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMEDCA
LOCATE 24, 1   '@1efbe
PRINT " Drive:\Diretorio\...\Subdiretorio dos arquivos de Formas (.FRM)"; RT_TAB$(79); ""; ""   '@1efd9 DS:25c0,4014
LOCATE 25, 1   '@1f002
PRINT " "; RT_TAB$(79); ""; "";   '@1f01d DS:25c0,2abe
LOCATE 25, 1   '@1f046
PRINT " *"; V_0e4e$;   '@1f061 DS:3a00
CALL MIXT_07f1_LimpaTeclado   '@1f078
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
RT_LINEINPUTPV "* ", V_0e18$   '@1f082 DS:2a3c (LINE INPUT ; (B$LNIN 3))
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e10$ = V_0e4e$   '@1f09c
GOSUB L_1f161   '@1f0ae
IF NOT (V_0e18$ = "*") THEN GOTO L_1f0e9   '@1f0bb DS:4058
BEEP   '@1f0d2
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1efb9   '@1f0dc
L_1f0e9:
ON ERROR GOTO L_1f2b0
RT_ONERR = &H1f2b0   '@1f0e9
L_BP0c% = (LEN(V_0e18$) > 3)   '@1f0f8
CHDIR RT_ARQ$(RT_LEFT$((V_0e18$), (LEN(V_0e18$) + L_BP0c%)))   '@1f117
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1f12b
V_0e4e$ = UCASE$(V_0e18$)   '@1f13a
RETURN   '@1f152
L_1f161:   ' sub-rotina (alvo de GOSUB)
IF NOT (VAL(V_0e18$) <> 0.0#) THEN GOTO L_1f1a6   '@1f166 DS:27c0
V_0e18$ = "*"   '@1f18a DS:4058
RETURN   '@1f19c
L_1f1a6:
IF NOT (LEN(V_0e18$) = 1) THEN GOTO L_1f1d8   '@1f1a6
V_0e18$ = V_0e18$ + ":\"   '@1f1bc DS:405e
L_1f1d8:
L_BP0c% = (INSTR(V_0e18$, ":\") = 0)   '@1f1d8 DS:405e
IF NOT ((RT_MID$((V_0e18$), (1), (1)) <> "\" AND L_BP0c%) <> 0) THEN GOTO L_1f239   '@1f1fe DS:4064
V_0e18$ = V_0e10$ + V_0e18$   '@1f21d
L_1f239:
IF NOT (RT_RIGHT$((V_0e18$), (1)) <> "\") THEN GOTO L_1f276   '@1f239 DS:4064
V_0e18$ = V_0e18$ + "\"   '@1f25a DS:4064
L_1f276:
IF NOT (INSTR(V_0e18$, ":\") = 0) THEN GOTO L_1f2a1   '@1f276 DS:405e
V_0e18$ = "*"   '@1f28f DS:4058
L_1f2a1:
RETURN   '@1f2a1
L_1f2b0:
RESUME L_1f2c7   '@1f2b5
L_1f2c7:
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1f2cc
RT_CLOSE   '@1f2db (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
LOCATE 25, 1   '@1f2e8
PRINT " VERIFIQUE O DRIVE CONFIGURADO  "; V_0e18$; RT_TAB$(79); ""; "";   '@1f303 DS:25c0,406a
BEEP   '@1f335
CALL MIXT_07f1_LimpaTeclado   '@1f33f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1f349
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1efb9   '@1f365
' ---- F_1f36d @0x1f36d  (01f36d_F_1f36d.lift.txt; evidence_id (assembly): ev_9abe3684c07d6203736d593dae8e9901b81193c3232f340d5616ea29ef69d4a6)
L_1f372:   ' entrada vinda de 010030_M_FORMEDCA
RESUME L_1f389   '@1f377
L_1f389:
ON ERROR GOTO L_1f4b8
RT_ONERR = &H1f4b8   '@1f38e
RT_CLOSE   '@1f39d (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
LOCATE 25, 1   '@1f3aa
V_2422% = ERR   '@1f3c5
IF NOT (V_2422% = 61) THEN GOTO L_1f412   '@1f3d2
PRINT " O SEU DISCO DE DADOS ESTA COMPLETO"; RT_TAB$(79); ""; "";   '@1f3e1 DS:25c0,408e
GOTO L_1f47b   '@1f40a
L_1f412:
IF NOT (V_2422% = 71) THEN GOTO L_1f44d   '@1f412
PRINT " VERIFIQUE SE O DISQUETE ESTA NO DRIVE COM A PORTA FECHADA"; RT_TAB$(79); ""; "";   '@1f41c DS:25c0,40b6
GOTO L_1f47b   '@1f445
L_1f44d:
PRINT " VERIFIQUE O SEU DRIVE"; RT_TAB$(79); ""; "";   '@1f44d DS:25c0,40f4
L_1f47b:
BEEP   '@1f47b
CALL MIXT_07f1_LimpaTeclado   '@1f485
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1f48f
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10b79   '@1f4ab
' ---- F_1f4b3 @0x1f4b3  (01f4b3_F_1f4b3.lift.txt; evidence_id (assembly): ev_18fda06952eb04fe7a58b0b6e26338d0a625709cfd5a0de415c09c36f3492ba1)
L_1f4b8:   ' entrada vinda de 010030_M_FORMEDCA, 01dafe_F_1dafe, 01df45_F_1df45, 01f36d_F_1f36d
RESUME L_1f4cf   '@1f4bd
L_1f4cf:
GOSUB L_1f4f8   '@1f4d4
CALL S_1fd31   '@1f4e1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_10a15   '@1f4eb
' ---- F_1f4f3 @0x1f4f3  (01f4f3_F_1f4f3.lift.txt; evidence_id (assembly): ev_f7348855207bcbb98118a9508256a773364e8af638a0c8f2140b2c2d9d230e3e)
L_1f4f8:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_FORMEDCA, 01f4b3_F_1f4b3
FOR V_2424! = 1.0 TO 10.0   '@1f4fd DS:2624,410e
ON KEY(RT_CINT%(FX##(V_2424!))) GOSUB L_1f79d
RT_ONKEY RT_CINT%(FX##(V_2424!)), 1   '@1f50a
KEY(RT_CINT%(FX##(V_2424!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_2424!)), 1   '@1f524
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_2424!   '@1f539 DS:2624,410e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1f562
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@1f58a
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@1f5b2
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@1f5da
FOR V_2424! = 15.0 TO 18.0   '@1f602 DS:2624,4112,4116
ON KEY(RT_CINT%(FX##(V_2424!))) GOSUB L_1f7c8
RT_ONKEY RT_CINT%(FX##(V_2424!)), 2   '@1f610
KEY(RT_CINT%(FX##(V_2424!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_2424!)), 1   '@1f62a
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_2424!   '@1f63f DS:2624,4116
ON KEY(2) GOSUB L_1f7c8
RT_ONKEY 2, 2   '@1f668
KEY(2) ON
RT_KEYESTADO 2, 1   '@1f67b
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@1f689
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@1f6b1
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@1f6d9
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@1f701
FOR V_2424! = 19.0 TO 22.0   '@1f728 DS:2624,411a,411e
ON KEY(RT_CINT%(FX##(V_2424!))) GOSUB L_1f8b4
RT_ONKEY RT_CINT%(FX##(V_2424!)), 3   '@1f736
KEY(RT_CINT%(FX##(V_2424!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_2424!)), 1   '@1f750
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
NEXT V_2424!   '@1f765 DS:2624,411e
RETURN   '@1f78e
L_1f79d:
BEEP   '@1f7a2
GOSUB L_1f4f8   '@1f7ac
RETURN   '@1f7b9
L_1f7c8:
RT_SCREEN 0   '@1f7cd
RT_VIEWPRINT 1, 25   '@1f7e2
COLOR 7, 0, 0   '@1f7f4
RT_CLS 0   '@1f818
PRINT " Aguarde ..."   '@1f825 DS:37a0
PRINT ""   '@1f833 DS:25c0
PRINT " Retorno ao Modulo Basico de FORMA"   '@1f841 DS:4122
ON ERROR GOTO L_1f87b
RT_ONERR = &H1f87b   '@1f84f
RT_CHAIN V_0e3a$ + "FORMA"   '@1f85e DS:261a
L_1f87b:
PRINT " Modulo nao encontrado em "; V_0e3a$   '@1f880 DS:4148
PRINT " Termino da Utilizacao do Sistema OpenStrut Obrigado .."   '@1f897 DS:25de
RT_FIM   '@1f8a5 (END: o QB64 pede tecla no END; RT_FIM fecha como o BRUN45)
L_1f8b4:
BEEP   '@1f8b9
GOSUB L_1f4f8   '@1f8c3
RT_SCREEN 0   '@1f8d0
RETURN L_10a15   '@1f8ef
' ---- FUN_1000_f8f7 @0x1f8f7  (01f8f7_FUN_1000_f8f7.lift.txt; evidence_id (assembly): ev_fe0d52e347f4e48d1165151c9be48f78e4222d0d8a8de14c0d892d1f3c563a2c)
L_1f8f7:   ' entrada vinda de 010030_M_FORMEDCA, 01dddc_FUN_1000_dddc
ON ERROR GOTO L_1f975
RT_ONERR = &H1f975   '@1f8fc
V_11d4! = RT_FRE&("")   '@1f90b DS:25c0
L_BP0c% = (LEN(V_0e3a$) > 3)   '@1f925
CHDIR RT_ARQ$(RT_LEFT$((V_0e3a$), (LEN(V_0e3a$) + L_BP0c%)))   '@1f944
RT_CHAIN V_0e3a$ + V_0e0c$   '@1f958
L_1f975:
RESUME L_1f98c   '@1f97a
L_1f98c:
L_BP0c% = (V_0e3a$ = "A:\")   '@1f991 DS:4166
IF NOT ((V_0e3a$ = "B:\" OR L_BP0c%) <> 0) THEN GOTO L_1fa2b   '@1f9b6 DS:416e
LOCATE 23, 10   '@1f9cb
PRINT " Coloque o Disco FORMA no Drive "; V_0e3a$   '@1f9e9 DS:4176
CALL MIXT_07f1_LimpaTeclado   '@1fa00
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
V_0e0c$ = RT_INPUT$(1)   '@1fa0a
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY pelo roteiro (entre comandos)
L_1fa2b:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1f79d, L_1f7c8, L_1f8b4   ' ON KEY no laco (B$EVCK)
GOTO L_1f8f7   '@1fa2b
' ---- M_FORMEDUX @0x20030  (020030_M_FORMEDUX.lift.txt; evidence_id (assembly): ev_ff34ff5fbdb14c961b1ac4d2c3a89f1d68237150e90cd178d85daae680f656d3)
' @20030 inicio do programa (B$?EVT)
GOTO L_20f3e   '@2017a
' ---- FUN_2000_0f3e @0x20f3e  (020f3e_FUN_2000_0f3e.lift.txt; evidence_id (assembly): ev_7b3d704e50f48cf28c4068d8df3d6c9e5d22fb0b5d04fa27c1737db541b022c4)
L_20f3e:   ' entrada vinda de 020030_M_FORMEDUX
GOTO L_210f6   '@20f3e
' ---- FUN_2000_10f6 @0x210f6  (0210f6_FUN_2000_10f6.lift.txt; evidence_id (assembly): ev_ed57599a2893538b267eab47f93a960a2de685e7db907b1f1204062f735e032a)
L_210f6:   ' entrada vinda de 020f3e_FUN_2000_0f3e
GOTO L_212b6   '@210f6
' ---- FUN_2000_12b6 @0x212b6  (0212b6_FUN_2000_12b6.lift.txt; evidence_id (assembly): ev_1c3e1dfa4a4df17cba5f5526f0d08d549bc94e9ac6fac0f49705547cd50f74b2)
L_212b6:   ' entrada vinda de 0210f6_FUN_2000_10f6
GOTO L_21932   '@212b6
' ---- FUN_2000_1932 @0x21932  (021932_FUN_2000_1932.lift.txt; evidence_id (assembly): ev_528d48133c54924c8afe37a208105827c9d3dfce41974df47e778eebf9c40ecf)
L_21932:   ' entrada vinda de 0212b6_FUN_2000_12b6
GOTO L_21aea   '@21932
' ---- FUN_2000_1aea @0x21aea  (021aea_FUN_2000_1aea.lift.txt; evidence_id (assembly): ev_fcc329fd6428a6c5414067c2eacb9a5d99b2820bbdb74ee2fcdf8d9297e32472)
L_21aea:   ' entrada vinda de 021932_FUN_2000_1932
GOTO L_22616   '@21aea
' ---- FUN_2000_2616 @0x22616  (022616_FUN_2000_2616.lift.txt; evidence_id (assembly): ev_e73a6e866eebe4191d752bdf9fad3ea8ea88ab8c23aa26ead9dd67deabbae394)
L_22616:   ' entrada vinda de 021aea_FUN_2000_1aea
GOTO L_22ed9   '@22616
' ---- FUN_2000_2ed9 @0x22ed9  (022ed9_FUN_2000_2ed9.lift.txt; evidence_id (assembly): ev_e889b3cea88478f0555992beea1e366671060e404ef02007789df0d44f4c4d9d)
L_22ed9:   ' entrada vinda de 022616_FUN_2000_2616
GOTO L_23d34   '@22ed9
' ---- FUN_2000_3d34 @0x23d34  (023d34_FUN_2000_3d34.lift.txt; evidence_id (assembly): ev_eaef20c203d35aa20532f0e7c6b2355ba27937af152392f43c0a167afe1a37fc)
L_23d34:   ' entrada vinda de 022ed9_FUN_2000_2ed9
GOTO L_261a1   '@23d34
' ---- FUN_2000_61a1 @0x261a1  (0261a1_FUN_2000_61a1.lift.txt; evidence_id (assembly): ev_92c42997719e1398de95609953367a0b0b786b01fd939414f2246acf94c5d6de)
L_261a1:   ' entrada vinda de 023d34_FUN_2000_3d34
GOTO L_2764a   '@261a1
' ---- RT_EA @0x2764a  (02764a_RT_EA.lift.txt; evidence_id (assembly): ev_0cf7ad7dcd1793f3c519ad2d04debc25d36c61865dd56cbdd26a029d06b539b4)
L_2764a:   ' entrada vinda de 0261a1_FUN_2000_61a1
RT_FIM   ' @2764a B$CENP (inicio/fim do modulo)
' ---- M_FORMEDTE @0x30030  (030030_M_FORMEDTE.lift.txt; evidence_id (assembly): ev_717b0710141f8dbc85f2996ddf5a8fb73f9e286c4253b3d294d9171b831f04fb)
' @30030 inicio do programa (B$?EVT)
GOTO L_39a49   '@30184
' ---- FUN_3000_9a49 @0x39a49  (039a49_FUN_3000_9a49.lift.txt; evidence_id (assembly): ev_6b19018c0a0f601eb3a228c289915524678a8a850fa5bae107d3cff91d0d6c93)
L_39a49:   ' entrada vinda de 030030_M_FORMEDTE
GOTO L_3abfd   '@39a49
' ---- FUN_3000_abfd @0x3abfd  (03abfd_FUN_3000_abfd.lift.txt; evidence_id (assembly): ev_2e679c188f834c618a6fe67985069c9c648296d9fdf961216a32ef415e1d5720)
L_3abfd:   ' entrada vinda de 039a49_FUN_3000_9a49
GOTO L_3bef7   '@3abfd
' ---- FUN_3000_bef7 @0x3bef7  (03bef7_FUN_3000_bef7.lift.txt; evidence_id (assembly): ev_f6491e63908934bff0626f9214cdf1e4e170cd71d421a0e723e3779318fae726)
L_3bef7:   ' entrada vinda de 03abfd_FUN_3000_abfd
GOTO L_3e551   '@3bef7
' ---- FUN_3000_e551 @0x3e551  (03e551_FUN_3000_e551.lift.txt; evidence_id (assembly): ev_1d831b1adf55b933883733c5c4cb15f1cb322bc879a21a821daf1a28eb7ded5f)
L_3e551:   ' entrada vinda de 03bef7_FUN_3000_bef7
GOTO L_3e942   '@3e551
' ---- RT_EA @0x3e942  (03e942_RT_EA.lift.txt; evidence_id (assembly): ev_05b8eaeca74c24de17c21926dadbb0315821ce7fd3c6a90b25b5952537c48c19)
L_3e942:   ' entrada vinda de 03e551_FUN_3000_e551
RT_FIM   ' @3e942 B$CENP (inicio/fim do modulo)
' ---- M_FORMDETA @0x40030  (040030_M_FORMDETA.lift.txt; evidence_id (assembly): ev_e49da5577e1918b9189f0dc3dbc40d609c77d98a4bf1de4ea503b83c66495bba)
' @40030 inicio do programa (B$?EVT)
GOTO L_44f8d   '@4017f
' ---- FUN_4000_4f8d @0x44f8d  (044f8d_FUN_4000_4f8d.lift.txt; evidence_id (assembly): ev_588daeed7ffdab0efb49c1da6e1609089c6625f559a0aeddb7a0ff68e3c43385)
L_44f8d:   ' entrada vinda de 040030_M_FORMDETA
GOTO L_4b99d   '@44f8d
' ---- RT_EA @0x4b99d  (04b99d_RT_EA.lift.txt; evidence_id (assembly): ev_63d16bc04ee18e1a07922748ac8678ea96cdf02f250a04d4615dcc5f19e956a3)
L_4b99d:   ' entrada vinda de 044f8d_FUN_4000_4f8d
RT_FIM   ' @4b99d B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Registro de 616 bytes em DS:1860 (GET/PUT #): campos pelo endereco das variaveis.
SUB RT_REG_1860_LE (f AS INTEGER, r AS LONG)
    GET #f, r, RG_1860
    V_1860! = CVS(MID$(RG_1860, 1, 4))
    V_1864! = CVS(MID$(RG_1860, 5, 4))
    V_1868! = CVS(MID$(RG_1860, 9, 4))
    V_186c! = CVS(MID$(RG_1860, 13, 4))
    V_1870% = CVI(MID$(RG_1860, 17, 2))
    V_1872% = CVI(MID$(RG_1860, 19, 2))
    V_1874% = CVI(MID$(RG_1860, 21, 2))
    V_1876% = CVI(MID$(RG_1860, 23, 2))
    V_1878! = CVS(MID$(RG_1860, 25, 4))
    V_187c! = CVS(MID$(RG_1860, 29, 4))
    V_1880! = CVS(MID$(RG_1860, 33, 4))
    V_1884$ = MID$(RG_1860, 37, 8)
    V_188c! = CVS(MID$(RG_1860, 45, 4))
    V_1890! = CVS(MID$(RG_1860, 49, 4))
    V_1894! = CVS(MID$(RG_1860, 53, 4))
    V_1898! = CVS(MID$(RG_1860, 57, 4))
    V_189c% = CVI(MID$(RG_1860, 61, 2))
    V_189e% = CVI(MID$(RG_1860, 63, 2))
    V_18a0% = CVI(MID$(RG_1860, 65, 2))
    V_18a2% = CVI(MID$(RG_1860, 67, 2))
    V_18a4! = CVS(MID$(RG_1860, 69, 4))
    V_18a8! = CVS(MID$(RG_1860, 73, 4))
    V_18ac! = CVS(MID$(RG_1860, 77, 4))
    V_18b0$ = MID$(RG_1860, 81, 8)
    V_18b8! = CVS(MID$(RG_1860, 89, 4))
    V_18bc! = CVS(MID$(RG_1860, 93, 4))
    V_18c0! = CVS(MID$(RG_1860, 97, 4))
    V_18c4! = CVS(MID$(RG_1860, 101, 4))
    V_18c8% = CVI(MID$(RG_1860, 105, 2))
    V_18ca% = CVI(MID$(RG_1860, 107, 2))
    V_18cc% = CVI(MID$(RG_1860, 109, 2))
    V_18ce% = CVI(MID$(RG_1860, 111, 2))
    V_18d0! = CVS(MID$(RG_1860, 113, 4))
    V_18d4! = CVS(MID$(RG_1860, 117, 4))
    V_18d8! = CVS(MID$(RG_1860, 121, 4))
    V_18dc$ = MID$(RG_1860, 125, 8)
    V_18e4! = CVS(MID$(RG_1860, 133, 4))
    V_18e8! = CVS(MID$(RG_1860, 137, 4))
    V_18ec! = CVS(MID$(RG_1860, 141, 4))
    V_18f0! = CVS(MID$(RG_1860, 145, 4))
    V_18f4% = CVI(MID$(RG_1860, 149, 2))
    V_18f6% = CVI(MID$(RG_1860, 151, 2))
    V_18f8% = CVI(MID$(RG_1860, 153, 2))
    V_18fa% = CVI(MID$(RG_1860, 155, 2))
    V_18fc! = CVS(MID$(RG_1860, 157, 4))
    V_1900! = CVS(MID$(RG_1860, 161, 4))
    V_1904! = CVS(MID$(RG_1860, 165, 4))
    V_1908$ = MID$(RG_1860, 169, 8)
    V_1910! = CVS(MID$(RG_1860, 177, 4))
    V_1914! = CVS(MID$(RG_1860, 181, 4))
    V_1918! = CVS(MID$(RG_1860, 185, 4))
    V_191c! = CVS(MID$(RG_1860, 189, 4))
    V_1920% = CVI(MID$(RG_1860, 193, 2))
    V_1922% = CVI(MID$(RG_1860, 195, 2))
    V_1924% = CVI(MID$(RG_1860, 197, 2))
    V_1926% = CVI(MID$(RG_1860, 199, 2))
    V_1928! = CVS(MID$(RG_1860, 201, 4))
    V_192c! = CVS(MID$(RG_1860, 205, 4))
    V_1930! = CVS(MID$(RG_1860, 209, 4))
    V_1934$ = MID$(RG_1860, 213, 8)
    V_193c! = CVS(MID$(RG_1860, 221, 4))
    V_1940! = CVS(MID$(RG_1860, 225, 4))
    V_1944! = CVS(MID$(RG_1860, 229, 4))
    V_1948! = CVS(MID$(RG_1860, 233, 4))
    V_194c% = CVI(MID$(RG_1860, 237, 2))
    V_194e% = CVI(MID$(RG_1860, 239, 2))
    V_1950% = CVI(MID$(RG_1860, 241, 2))
    V_1952% = CVI(MID$(RG_1860, 243, 2))
    V_1954! = CVS(MID$(RG_1860, 245, 4))
    V_1958! = CVS(MID$(RG_1860, 249, 4))
    V_195c! = CVS(MID$(RG_1860, 253, 4))
    V_1960$ = MID$(RG_1860, 257, 8)
    V_1968! = CVS(MID$(RG_1860, 265, 4))
    V_196c! = CVS(MID$(RG_1860, 269, 4))
    V_1970! = CVS(MID$(RG_1860, 273, 4))
    V_1974! = CVS(MID$(RG_1860, 277, 4))
    V_1978% = CVI(MID$(RG_1860, 281, 2))
    V_197a% = CVI(MID$(RG_1860, 283, 2))
    V_197c% = CVI(MID$(RG_1860, 285, 2))
    V_197e% = CVI(MID$(RG_1860, 287, 2))
    V_1980! = CVS(MID$(RG_1860, 289, 4))
    V_1984! = CVS(MID$(RG_1860, 293, 4))
    V_1988! = CVS(MID$(RG_1860, 297, 4))
    V_198c$ = MID$(RG_1860, 301, 8)
    V_1994! = CVS(MID$(RG_1860, 309, 4))
    V_1998! = CVS(MID$(RG_1860, 313, 4))
    V_199c! = CVS(MID$(RG_1860, 317, 4))
    V_19a0! = CVS(MID$(RG_1860, 321, 4))
    V_19a4% = CVI(MID$(RG_1860, 325, 2))
    V_19a6% = CVI(MID$(RG_1860, 327, 2))
    V_19a8% = CVI(MID$(RG_1860, 329, 2))
    V_19aa% = CVI(MID$(RG_1860, 331, 2))
    V_19ac! = CVS(MID$(RG_1860, 333, 4))
    V_19b0! = CVS(MID$(RG_1860, 337, 4))
    V_19b4! = CVS(MID$(RG_1860, 341, 4))
    V_19b8$ = MID$(RG_1860, 345, 8)
    V_19c0! = CVS(MID$(RG_1860, 353, 4))
    V_19c4! = CVS(MID$(RG_1860, 357, 4))
    V_19c8! = CVS(MID$(RG_1860, 361, 4))
    V_19cc! = CVS(MID$(RG_1860, 365, 4))
    V_19d0% = CVI(MID$(RG_1860, 369, 2))
    V_19d2% = CVI(MID$(RG_1860, 371, 2))
    V_19d4% = CVI(MID$(RG_1860, 373, 2))
    V_19d6% = CVI(MID$(RG_1860, 375, 2))
    V_19d8! = CVS(MID$(RG_1860, 377, 4))
    V_19dc! = CVS(MID$(RG_1860, 381, 4))
    V_19e0! = CVS(MID$(RG_1860, 385, 4))
    V_19e4$ = MID$(RG_1860, 389, 8)
    V_19ec! = CVS(MID$(RG_1860, 397, 4))
    V_19f0! = CVS(MID$(RG_1860, 401, 4))
    V_19f4! = CVS(MID$(RG_1860, 405, 4))
    V_19f8! = CVS(MID$(RG_1860, 409, 4))
    V_19fc% = CVI(MID$(RG_1860, 413, 2))
    V_19fe% = CVI(MID$(RG_1860, 415, 2))
    V_1a00% = CVI(MID$(RG_1860, 417, 2))
    V_1a02% = CVI(MID$(RG_1860, 419, 2))
    V_1a04! = CVS(MID$(RG_1860, 421, 4))
    V_1a08! = CVS(MID$(RG_1860, 425, 4))
    V_1a0c! = CVS(MID$(RG_1860, 429, 4))
    V_1a10$ = MID$(RG_1860, 433, 8)
    V_1a18! = CVS(MID$(RG_1860, 441, 4))
    V_1a1c! = CVS(MID$(RG_1860, 445, 4))
    V_1a20! = CVS(MID$(RG_1860, 449, 4))
    V_1a24! = CVS(MID$(RG_1860, 453, 4))
    V_1a28% = CVI(MID$(RG_1860, 457, 2))
    V_1a2a% = CVI(MID$(RG_1860, 459, 2))
    V_1a2c% = CVI(MID$(RG_1860, 461, 2))
    V_1a2e% = CVI(MID$(RG_1860, 463, 2))
    V_1a30! = CVS(MID$(RG_1860, 465, 4))
    V_1a34! = CVS(MID$(RG_1860, 469, 4))
    V_1a38! = CVS(MID$(RG_1860, 473, 4))
    V_1a3c$ = MID$(RG_1860, 477, 8)
    V_1a44! = CVS(MID$(RG_1860, 485, 4))
    V_1a48! = CVS(MID$(RG_1860, 489, 4))
    V_1a4c! = CVS(MID$(RG_1860, 493, 4))
    V_1a50! = CVS(MID$(RG_1860, 497, 4))
    V_1a54% = CVI(MID$(RG_1860, 501, 2))
    V_1a56% = CVI(MID$(RG_1860, 503, 2))
    V_1a58% = CVI(MID$(RG_1860, 505, 2))
    V_1a5a% = CVI(MID$(RG_1860, 507, 2))
    V_1a5c! = CVS(MID$(RG_1860, 509, 4))
    V_1a60! = CVS(MID$(RG_1860, 513, 4))
    V_1a64! = CVS(MID$(RG_1860, 517, 4))
    V_1a68$ = MID$(RG_1860, 521, 8)
    V_1a70! = CVS(MID$(RG_1860, 529, 4))
    V_1a74! = CVS(MID$(RG_1860, 533, 4))
    V_1a78! = CVS(MID$(RG_1860, 537, 4))
    V_1a7c! = CVS(MID$(RG_1860, 541, 4))
    V_1a80% = CVI(MID$(RG_1860, 545, 2))
    V_1a82% = CVI(MID$(RG_1860, 547, 2))
    V_1a84% = CVI(MID$(RG_1860, 549, 2))
    V_1a86% = CVI(MID$(RG_1860, 551, 2))
    V_1a88! = CVS(MID$(RG_1860, 553, 4))
    V_1a8c! = CVS(MID$(RG_1860, 557, 4))
    V_1a90! = CVS(MID$(RG_1860, 561, 4))
    V_1a94$ = MID$(RG_1860, 565, 8)
    V_1a9c! = CVS(MID$(RG_1860, 573, 4))
    V_1aa0! = CVS(MID$(RG_1860, 577, 4))
    V_1aa4! = CVS(MID$(RG_1860, 581, 4))
    V_1aa8! = CVS(MID$(RG_1860, 585, 4))
    V_1aac% = CVI(MID$(RG_1860, 589, 2))
    V_1aae% = CVI(MID$(RG_1860, 591, 2))
    V_1ab0% = CVI(MID$(RG_1860, 593, 2))
    V_1ab2% = CVI(MID$(RG_1860, 595, 2))
    V_1ab4! = CVS(MID$(RG_1860, 597, 4))
    V_1ab8! = CVS(MID$(RG_1860, 601, 4))
    V_1abc! = CVS(MID$(RG_1860, 605, 4))
    V_1ac0$ = MID$(RG_1860, 609, 8)
END SUB
SUB RT_REG_1860_GRAVA (f AS INTEGER, r AS LONG)
    MID$(RG_1860, 1, 4) = MKS$(V_1860!)
    MID$(RG_1860, 5, 4) = MKS$(V_1864!)
    MID$(RG_1860, 9, 4) = MKS$(V_1868!)
    MID$(RG_1860, 13, 4) = MKS$(V_186c!)
    MID$(RG_1860, 17, 2) = MKI$(V_1870%)
    MID$(RG_1860, 19, 2) = MKI$(V_1872%)
    MID$(RG_1860, 21, 2) = MKI$(V_1874%)
    MID$(RG_1860, 23, 2) = MKI$(V_1876%)
    MID$(RG_1860, 25, 4) = MKS$(V_1878!)
    MID$(RG_1860, 29, 4) = MKS$(V_187c!)
    MID$(RG_1860, 33, 4) = MKS$(V_1880!)
    MID$(RG_1860, 37, 8) = RT_FIX$(V_1884$, 8)
    MID$(RG_1860, 45, 4) = MKS$(V_188c!)
    MID$(RG_1860, 49, 4) = MKS$(V_1890!)
    MID$(RG_1860, 53, 4) = MKS$(V_1894!)
    MID$(RG_1860, 57, 4) = MKS$(V_1898!)
    MID$(RG_1860, 61, 2) = MKI$(V_189c%)
    MID$(RG_1860, 63, 2) = MKI$(V_189e%)
    MID$(RG_1860, 65, 2) = MKI$(V_18a0%)
    MID$(RG_1860, 67, 2) = MKI$(V_18a2%)
    MID$(RG_1860, 69, 4) = MKS$(V_18a4!)
    MID$(RG_1860, 73, 4) = MKS$(V_18a8!)
    MID$(RG_1860, 77, 4) = MKS$(V_18ac!)
    MID$(RG_1860, 81, 8) = RT_FIX$(V_18b0$, 8)
    MID$(RG_1860, 89, 4) = MKS$(V_18b8!)
    MID$(RG_1860, 93, 4) = MKS$(V_18bc!)
    MID$(RG_1860, 97, 4) = MKS$(V_18c0!)
    MID$(RG_1860, 101, 4) = MKS$(V_18c4!)
    MID$(RG_1860, 105, 2) = MKI$(V_18c8%)
    MID$(RG_1860, 107, 2) = MKI$(V_18ca%)
    MID$(RG_1860, 109, 2) = MKI$(V_18cc%)
    MID$(RG_1860, 111, 2) = MKI$(V_18ce%)
    MID$(RG_1860, 113, 4) = MKS$(V_18d0!)
    MID$(RG_1860, 117, 4) = MKS$(V_18d4!)
    MID$(RG_1860, 121, 4) = MKS$(V_18d8!)
    MID$(RG_1860, 125, 8) = RT_FIX$(V_18dc$, 8)
    MID$(RG_1860, 133, 4) = MKS$(V_18e4!)
    MID$(RG_1860, 137, 4) = MKS$(V_18e8!)
    MID$(RG_1860, 141, 4) = MKS$(V_18ec!)
    MID$(RG_1860, 145, 4) = MKS$(V_18f0!)
    MID$(RG_1860, 149, 2) = MKI$(V_18f4%)
    MID$(RG_1860, 151, 2) = MKI$(V_18f6%)
    MID$(RG_1860, 153, 2) = MKI$(V_18f8%)
    MID$(RG_1860, 155, 2) = MKI$(V_18fa%)
    MID$(RG_1860, 157, 4) = MKS$(V_18fc!)
    MID$(RG_1860, 161, 4) = MKS$(V_1900!)
    MID$(RG_1860, 165, 4) = MKS$(V_1904!)
    MID$(RG_1860, 169, 8) = RT_FIX$(V_1908$, 8)
    MID$(RG_1860, 177, 4) = MKS$(V_1910!)
    MID$(RG_1860, 181, 4) = MKS$(V_1914!)
    MID$(RG_1860, 185, 4) = MKS$(V_1918!)
    MID$(RG_1860, 189, 4) = MKS$(V_191c!)
    MID$(RG_1860, 193, 2) = MKI$(V_1920%)
    MID$(RG_1860, 195, 2) = MKI$(V_1922%)
    MID$(RG_1860, 197, 2) = MKI$(V_1924%)
    MID$(RG_1860, 199, 2) = MKI$(V_1926%)
    MID$(RG_1860, 201, 4) = MKS$(V_1928!)
    MID$(RG_1860, 205, 4) = MKS$(V_192c!)
    MID$(RG_1860, 209, 4) = MKS$(V_1930!)
    MID$(RG_1860, 213, 8) = RT_FIX$(V_1934$, 8)
    MID$(RG_1860, 221, 4) = MKS$(V_193c!)
    MID$(RG_1860, 225, 4) = MKS$(V_1940!)
    MID$(RG_1860, 229, 4) = MKS$(V_1944!)
    MID$(RG_1860, 233, 4) = MKS$(V_1948!)
    MID$(RG_1860, 237, 2) = MKI$(V_194c%)
    MID$(RG_1860, 239, 2) = MKI$(V_194e%)
    MID$(RG_1860, 241, 2) = MKI$(V_1950%)
    MID$(RG_1860, 243, 2) = MKI$(V_1952%)
    MID$(RG_1860, 245, 4) = MKS$(V_1954!)
    MID$(RG_1860, 249, 4) = MKS$(V_1958!)
    MID$(RG_1860, 253, 4) = MKS$(V_195c!)
    MID$(RG_1860, 257, 8) = RT_FIX$(V_1960$, 8)
    MID$(RG_1860, 265, 4) = MKS$(V_1968!)
    MID$(RG_1860, 269, 4) = MKS$(V_196c!)
    MID$(RG_1860, 273, 4) = MKS$(V_1970!)
    MID$(RG_1860, 277, 4) = MKS$(V_1974!)
    MID$(RG_1860, 281, 2) = MKI$(V_1978%)
    MID$(RG_1860, 283, 2) = MKI$(V_197a%)
    MID$(RG_1860, 285, 2) = MKI$(V_197c%)
    MID$(RG_1860, 287, 2) = MKI$(V_197e%)
    MID$(RG_1860, 289, 4) = MKS$(V_1980!)
    MID$(RG_1860, 293, 4) = MKS$(V_1984!)
    MID$(RG_1860, 297, 4) = MKS$(V_1988!)
    MID$(RG_1860, 301, 8) = RT_FIX$(V_198c$, 8)
    MID$(RG_1860, 309, 4) = MKS$(V_1994!)
    MID$(RG_1860, 313, 4) = MKS$(V_1998!)
    MID$(RG_1860, 317, 4) = MKS$(V_199c!)
    MID$(RG_1860, 321, 4) = MKS$(V_19a0!)
    MID$(RG_1860, 325, 2) = MKI$(V_19a4%)
    MID$(RG_1860, 327, 2) = MKI$(V_19a6%)
    MID$(RG_1860, 329, 2) = MKI$(V_19a8%)
    MID$(RG_1860, 331, 2) = MKI$(V_19aa%)
    MID$(RG_1860, 333, 4) = MKS$(V_19ac!)
    MID$(RG_1860, 337, 4) = MKS$(V_19b0!)
    MID$(RG_1860, 341, 4) = MKS$(V_19b4!)
    MID$(RG_1860, 345, 8) = RT_FIX$(V_19b8$, 8)
    MID$(RG_1860, 353, 4) = MKS$(V_19c0!)
    MID$(RG_1860, 357, 4) = MKS$(V_19c4!)
    MID$(RG_1860, 361, 4) = MKS$(V_19c8!)
    MID$(RG_1860, 365, 4) = MKS$(V_19cc!)
    MID$(RG_1860, 369, 2) = MKI$(V_19d0%)
    MID$(RG_1860, 371, 2) = MKI$(V_19d2%)
    MID$(RG_1860, 373, 2) = MKI$(V_19d4%)
    MID$(RG_1860, 375, 2) = MKI$(V_19d6%)
    MID$(RG_1860, 377, 4) = MKS$(V_19d8!)
    MID$(RG_1860, 381, 4) = MKS$(V_19dc!)
    MID$(RG_1860, 385, 4) = MKS$(V_19e0!)
    MID$(RG_1860, 389, 8) = RT_FIX$(V_19e4$, 8)
    MID$(RG_1860, 397, 4) = MKS$(V_19ec!)
    MID$(RG_1860, 401, 4) = MKS$(V_19f0!)
    MID$(RG_1860, 405, 4) = MKS$(V_19f4!)
    MID$(RG_1860, 409, 4) = MKS$(V_19f8!)
    MID$(RG_1860, 413, 2) = MKI$(V_19fc%)
    MID$(RG_1860, 415, 2) = MKI$(V_19fe%)
    MID$(RG_1860, 417, 2) = MKI$(V_1a00%)
    MID$(RG_1860, 419, 2) = MKI$(V_1a02%)
    MID$(RG_1860, 421, 4) = MKS$(V_1a04!)
    MID$(RG_1860, 425, 4) = MKS$(V_1a08!)
    MID$(RG_1860, 429, 4) = MKS$(V_1a0c!)
    MID$(RG_1860, 433, 8) = RT_FIX$(V_1a10$, 8)
    MID$(RG_1860, 441, 4) = MKS$(V_1a18!)
    MID$(RG_1860, 445, 4) = MKS$(V_1a1c!)
    MID$(RG_1860, 449, 4) = MKS$(V_1a20!)
    MID$(RG_1860, 453, 4) = MKS$(V_1a24!)
    MID$(RG_1860, 457, 2) = MKI$(V_1a28%)
    MID$(RG_1860, 459, 2) = MKI$(V_1a2a%)
    MID$(RG_1860, 461, 2) = MKI$(V_1a2c%)
    MID$(RG_1860, 463, 2) = MKI$(V_1a2e%)
    MID$(RG_1860, 465, 4) = MKS$(V_1a30!)
    MID$(RG_1860, 469, 4) = MKS$(V_1a34!)
    MID$(RG_1860, 473, 4) = MKS$(V_1a38!)
    MID$(RG_1860, 477, 8) = RT_FIX$(V_1a3c$, 8)
    MID$(RG_1860, 485, 4) = MKS$(V_1a44!)
    MID$(RG_1860, 489, 4) = MKS$(V_1a48!)
    MID$(RG_1860, 493, 4) = MKS$(V_1a4c!)
    MID$(RG_1860, 497, 4) = MKS$(V_1a50!)
    MID$(RG_1860, 501, 2) = MKI$(V_1a54%)
    MID$(RG_1860, 503, 2) = MKI$(V_1a56%)
    MID$(RG_1860, 505, 2) = MKI$(V_1a58%)
    MID$(RG_1860, 507, 2) = MKI$(V_1a5a%)
    MID$(RG_1860, 509, 4) = MKS$(V_1a5c!)
    MID$(RG_1860, 513, 4) = MKS$(V_1a60!)
    MID$(RG_1860, 517, 4) = MKS$(V_1a64!)
    MID$(RG_1860, 521, 8) = RT_FIX$(V_1a68$, 8)
    MID$(RG_1860, 529, 4) = MKS$(V_1a70!)
    MID$(RG_1860, 533, 4) = MKS$(V_1a74!)
    MID$(RG_1860, 537, 4) = MKS$(V_1a78!)
    MID$(RG_1860, 541, 4) = MKS$(V_1a7c!)
    MID$(RG_1860, 545, 2) = MKI$(V_1a80%)
    MID$(RG_1860, 547, 2) = MKI$(V_1a82%)
    MID$(RG_1860, 549, 2) = MKI$(V_1a84%)
    MID$(RG_1860, 551, 2) = MKI$(V_1a86%)
    MID$(RG_1860, 553, 4) = MKS$(V_1a88!)
    MID$(RG_1860, 557, 4) = MKS$(V_1a8c!)
    MID$(RG_1860, 561, 4) = MKS$(V_1a90!)
    MID$(RG_1860, 565, 8) = RT_FIX$(V_1a94$, 8)
    MID$(RG_1860, 573, 4) = MKS$(V_1a9c!)
    MID$(RG_1860, 577, 4) = MKS$(V_1aa0!)
    MID$(RG_1860, 581, 4) = MKS$(V_1aa4!)
    MID$(RG_1860, 585, 4) = MKS$(V_1aa8!)
    MID$(RG_1860, 589, 2) = MKI$(V_1aac%)
    MID$(RG_1860, 591, 2) = MKI$(V_1aae%)
    MID$(RG_1860, 593, 2) = MKI$(V_1ab0%)
    MID$(RG_1860, 595, 2) = MKI$(V_1ab2%)
    MID$(RG_1860, 597, 4) = MKS$(V_1ab4!)
    MID$(RG_1860, 601, 4) = MKS$(V_1ab8!)
    MID$(RG_1860, 605, 4) = MKS$(V_1abc!)
    MID$(RG_1860, 609, 8) = RT_FIX$(V_1ac0$, 8)
    PUT #f, r, RG_1860
END SUB

' Volta o ON ERROR do modulo principal depois de uma SUB do MIXT que ligou o dela:
' no QB4.5 cada modulo tem o seu tratador; no QB64 ha um so (ver RETRADUCAO.md).
' CLEAR do original: zera as variaveis deste programa (as do COMMON: RT_COMMON_LIMPA).
SUB RT_PROG_LIMPA
    REDIM A_2536!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_27d0%(-32768 TO -32768)
    REDIM A_3424%(-32768 TO -32768)
    V_1868! = 0
    V_186c! = 0
    V_1870% = 0
    V_1872% = 0
    V_1874% = 0
    V_1876% = 0
    V_1878! = 0
    V_187c! = 0
    V_1880! = 0
    V_1884$ = ""
    V_188c! = 0
    V_1890! = 0
    V_1894! = 0
    V_1898! = 0
    V_189c% = 0
    V_189e% = 0
    V_18a0% = 0
    V_18a2% = 0
    V_18a4! = 0
    V_18a8! = 0
    V_18ac! = 0
    V_18b0$ = ""
    V_18b8! = 0
    V_18bc! = 0
    V_18c0! = 0
    V_18c4! = 0
    V_18c8% = 0
    V_18ca% = 0
    V_18cc% = 0
    V_18ce% = 0
    V_18d0! = 0
    V_18d4! = 0
    V_18d8! = 0
    V_18dc$ = ""
    V_18e4! = 0
    V_18e8! = 0
    V_18ec! = 0
    V_18f0! = 0
    V_18f4% = 0
    V_18f6% = 0
    V_18f8% = 0
    V_18fa% = 0
    V_18fc! = 0
    V_1900! = 0
    V_1904! = 0
    V_1908$ = ""
    V_1910! = 0
    V_1914! = 0
    V_1918! = 0
    V_191c! = 0
    V_1920% = 0
    V_1922% = 0
    V_1924% = 0
    V_1926% = 0
    V_1928! = 0
    V_192c! = 0
    V_1930! = 0
    V_1934$ = ""
    V_193c! = 0
    V_1940! = 0
    V_1944! = 0
    V_1948! = 0
    V_194c% = 0
    V_194e% = 0
    V_1950% = 0
    V_1952% = 0
    V_1954! = 0
    V_1958! = 0
    V_195c! = 0
    V_1960$ = ""
    V_1968! = 0
    V_196c! = 0
    V_1970! = 0
    V_1974! = 0
    V_1978% = 0
    V_197a% = 0
    V_197c% = 0
    V_197e% = 0
    V_1980! = 0
    V_1984! = 0
    V_1988! = 0
    V_198c$ = ""
    V_1994! = 0
    V_1998! = 0
    V_199c! = 0
    V_19a0! = 0
    V_19a4% = 0
    V_19a6% = 0
    V_19a8% = 0
    V_19aa% = 0
    V_19ac! = 0
    V_19b0! = 0
    V_19b4! = 0
    V_19b8$ = ""
    V_19c0! = 0
    V_19c4! = 0
    V_19c8! = 0
    V_19cc! = 0
    V_19d0% = 0
    V_19d2% = 0
    V_19d4% = 0
    V_19d6% = 0
    V_19d8! = 0
    V_19dc! = 0
    V_19e0! = 0
    V_19e4$ = ""
    V_19ec! = 0
    V_19f0! = 0
    V_19f4! = 0
    V_19f8! = 0
    V_19fc% = 0
    V_19fe% = 0
    V_1a00% = 0
    V_1a02% = 0
    V_1a04! = 0
    V_1a08! = 0
    V_1a0c! = 0
    V_1a10$ = ""
    V_1a18! = 0
    V_1a1c! = 0
    V_1a20! = 0
    V_1a24! = 0
    V_1a28% = 0
    V_1a2a% = 0
    V_1a2c% = 0
    V_1a2e% = 0
    V_1a30! = 0
    V_1a34! = 0
    V_1a38! = 0
    V_1a3c$ = ""
    V_1a44! = 0
    V_1a48! = 0
    V_1a4c! = 0
    V_1a50! = 0
    V_1a54% = 0
    V_1a56% = 0
    V_1a58% = 0
    V_1a5a% = 0
    V_1a5c! = 0
    V_1a60! = 0
    V_1a64! = 0
    V_1a68$ = ""
    V_1a70! = 0
    V_1a74! = 0
    V_1a78! = 0
    V_1a7c! = 0
    V_1a80% = 0
    V_1a82% = 0
    V_1a84% = 0
    V_1a86% = 0
    V_1a88! = 0
    V_1a8c! = 0
    V_1a90! = 0
    V_1a94$ = ""
    V_1a9c! = 0
    V_1aa0! = 0
    V_1aa4! = 0
    V_1aa8! = 0
    V_1aac% = 0
    V_1aae% = 0
    V_1ab0% = 0
    V_1ab2% = 0
    V_1ab4! = 0
    V_1ab8! = 0
    V_1abc! = 0
    V_1ac0$ = ""
    V_1ace! = 0
    V_1ad2! = 0
    V_1ad6! = 0
    V_1ada! = 0
    V_1ade! = 0
    V_1ae2! = 0
    V_1ae6! = 0
    V_1aea! = 0
    V_1aee! = 0
    V_1af2! = 0
    V_1af6! = 0
    V_1afa! = 0
    V_1afe! = 0
    V_1b06! = 0
    V_1b0a! = 0
    V_1b0e$ = ""
    V_1b12! = 0
    V_1b16! = 0
    V_1b1a! = 0
    V_1b1e! = 0
    V_2242! = 0
    V_2246! = 0
    V_224a$ = ""
    V_224e! = 0
    V_2252! = 0
    V_2256! = 0
    V_225a$ = ""
    V_225e! = 0
    V_2262! = 0
    V_2266$ = ""
    V_226a! = 0
    V_226e! = 0
    V_2272! = 0
    V_2276$ = ""
    V_227a! = 0
    V_227e! = 0
    V_2282! = 0
    V_2286! = 0
    V_228a! = 0
    V_228e! = 0
    V_2292! = 0
    V_2296$ = ""
    V_229a! = 0
    V_229e$ = ""
    V_22a2! = 0
    V_22a6! = 0
    V_22aa! = 0
    V_22ae! = 0
    V_22b2! = 0
    V_22b6! = 0
    V_22ba! = 0
    V_22be! = 0
    V_22c2! = 0
    V_22c6! = 0
    V_22ca! = 0
    V_22ce! = 0
    V_22d2$ = ""
    V_22d6$ = ""
    V_22da$ = ""
    V_22de! = 0
    V_22e2! = 0
    V_22e6! = 0
    V_22ea! = 0
    V_22ee! = 0
    V_22f2! = 0
    V_22f6! = 0
    V_22fa! = 0
    V_22fe! = 0
    V_2302! = 0
    V_2306! = 0
    V_230a! = 0
    V_230e! = 0
    V_2312! = 0
    V_2316$ = ""
    V_231a$ = ""
    V_231e$ = ""
    V_2322! = 0
    V_2326! = 0
    V_232a! = 0
    V_232e! = 0
    V_2332! = 0
    V_2336! = 0
    V_233a! = 0
    V_233e! = 0
    V_2342! = 0
    V_2346! = 0
    V_234a! = 0
    V_234e! = 0
    V_2352! = 0
    V_2356! = 0
    V_235a! = 0
    V_235e! = 0
    V_2362! = 0
    V_2366$ = ""
    V_236a$ = ""
    V_236e$ = ""
    V_2372! = 0
    V_2376! = 0
    V_237a! = 0
    V_237e! = 0
    V_2382$ = ""
    V_2386! = 0
    V_238a! = 0
    V_238e! = 0
    V_2392! = 0
    V_2396! = 0
    V_239a$ = ""
    V_239e! = 0
    V_23a2! = 0
    V_23a6! = 0
    V_23aa! = 0
    V_23ae! = 0
    V_23b2! = 0
    V_23b6! = 0
    V_23ba! = 0
    V_23be! = 0
    V_23c2! = 0
    V_23c6! = 0
    V_23ca$ = ""
    V_23ce$ = ""
    V_23d2! = 0
    V_23d6! = 0
    V_23da! = 0
    V_23de! = 0
    V_23e2! = 0
    V_23e6! = 0
    V_23ea! = 0
    V_23ee! = 0
    V_23f2! = 0
    V_23f6! = 0
    V_23fa! = 0
    V_23fe! = 0
    V_2402! = 0
    V_2406! = 0
    V_240a! = 0
    V_240e$ = ""
    V_2412! = 0
    V_2416! = 0
    V_241a! = 0
    V_241e! = 0
    V_2422% = 0
    V_2424! = 0
    V_2564% = 0
    V_2566% = 0
    V_2568% = 0
    V_256a% = 0
    V_256c% = 0
    V_256e! = 0
    V_2572! = 0
    V_2576! = 0
    V_257a! = 0
    V_257e! = 0
    V_2582! = 0
    V_2586! = 0
    V_258a! = 0
    V_258e! = 0
    V_2592! = 0
    V_2596! = 0
    V_259a! = 0
    V_259e! = 0
    V_25a2! = 0
    V_25a6! = 0
    V_25aa! = 0
    V_25ae! = 0
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_1f79d: BEEP; GOSUB L_1f4f8; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_1f7c8: sai da SUB (RT_SCREEN 0; RT_VIEWPRINT 1, 25; COLOR 7, 0, 0; RT_CLS 0; PRINT " Aguarde ..."; )
        CASE 3   ' L_1f8b4: sai da SUB (BEEP; GOSUB L_1f4f8; RT_SCREEN 0; RETURN L_10a15)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H1db03: ON ERROR GOTO L_1db03
        CASE &H1dc6f: ON ERROR GOTO L_1dc6f
        CASE &H1f2b0: ON ERROR GOTO L_1f2b0
        CASE &H1f372: ON ERROR GOTO L_1f372
        CASE &H1f4b8: ON ERROR GOTO L_1f4b8
        CASE &H1f87b: ON ERROR GOTO L_1f87b
        CASE &H1f975: ON ERROR GOTO L_1f975
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_1fa3b   ' entrada de SUB/FUNCTION (B$ENRA, locais 4 bytes) (0x1fa3b)
    DIM L_BP0e$
    ' ---- FUN_1000_fa3b @0x1fa3b  (01fa3b_FUN_1000_fa3b.lift.txt; evidence_id (assembly): ev_3322ae6c9cbefed96fde1c9d30e88c9fc75c7ec05ed06dd14b8bd09de7403aaa)
    L_BP0e$ = V_0dcc$   '@1fa43
    IF NOT (L_BP0e$ = "HER") THEN GOTO L_1fadf   '@1fa55 DS:419a
    RT_SCREEN 3   '@1fa6c
    V_256e! = 7.0   '@1fa82 DS:41a2
    V_2572! = 7.0   '@1fa93 DS:41a2
    V_2576! = 7.0   '@1faa4 DS:41a2
    V_257a! = 7.0   '@1fab5 DS:41a2
    V_257e! = 0.0   '@1fac6 DS:27ea
    GOTO L_1fc20   '@1fad7
L_1fadf:
    IF NOT (L_BP0e$ <> "CGA") THEN GOTO L_1fb03   '@1fadf DS:27e2
    IF NOT (L_BP0e$ = "MCG") THEN GOTO L_1fb73   '@1faf1 DS:41a6
L_1fb03:
    RT_SCREEN 2   '@1fb03
    V_256e! = 15.0   '@1fb16 DS:4112
    V_2572! = 15.0   '@1fb27 DS:4112
    V_2576! = 15.0   '@1fb38 DS:4112
    V_257a! = 15.0   '@1fb49 DS:4112
    V_257e! = 0.0   '@1fb5a DS:27ea
    GOTO L_1fc20   '@1fb6b
L_1fb73:
    IF NOT (L_BP0e$ <> "EGA") THEN GOTO L_1fb97   '@1fb73 DS:41ae
    IF NOT (L_BP0e$ = "VGA") THEN GOTO L_1fc20   '@1fb85 DS:41b6
L_1fb97:
    RT_SCREEN 9   '@1fb97
    COLOR , 1   '@1fbad
    V_256e! = 15.0   '@1fbc3 DS:4112
    V_2572! = 3.0   '@1fbd4 DS:3414
    V_2576! = 4.0   '@1fbe5 DS:3436
    V_257a! = 14.0   '@1fbf6 DS:41be
    V_257e! = 1.0   '@1fc07 DS:2624
    GOTO L_1fc20   '@1fc18
L_1fc20:
    V_2582! = 40.0   '@1fc20 DS:41c2
    V_2586! = 0.0   '@1fc31 DS:27ea
    V_258a! = 560.0 / (FX##(V_259a!) - V_2592!)   '@1fc42 DS:41c6
    V_258e! = 145.0 / (FX##(V_259e!) - V_2596!)   '@1fc60 DS:41ca
    IF NOT (FX##(V_258e!) / V_258a! > 0.41670000553131103515625##) THEN GOTO L_1fcbc   '@1fc7e DS:41ce
    V_258e! = V_258a! * 0.41670000553131103515625##   '@1fc9e DS:41ce
    GOTO L_1fcd7   '@1fcb4
L_1fcbc:
    V_258a! = V_258e! / 0.41670000553131103515625##   '@1fcbc DS:41ce
L_1fcd7:
    RT_CLS -1   '@1fcd7
    RT_WINDOW 1, (0), (0), (639), (199)   '@1fce5 DS:27ea,27ec,41d2,41d4,41d6,41d8 (B$WIND decodificado)
    ' @1fd13 libera strings locais (L_BP0e)
    ' END SUB   '@1fd21
END SUB

SUB S_1fd31   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1fd31)
    ' ---- FUN_1000_fd31 @0x1fd31  (01fd31_FUN_1000_fd31.lift.txt; evidence_id (assembly): ev_323a559b6df0b247c904259e52ffb13911193b73b54903d05291e6c742492706)
    BEEP   '@1fd39
    BEEP   '@1fd43
    BEEP   '@1fd4d
    RT_SCREEN 0   '@1fd57
    RT_VIEWPRINT 1, 25   '@1fd6c
    RT_CLOSE   '@1fd7e (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    COLOR RT_CINT%(FX##(V_0dc0!)), RT_CINT%(4.0 * FX##(V_0dc8!)), RT_CINT%(4.0 * FX##(V_0dc8!))   '@1fd8b DS:3436
    RT_CLS 0   '@1fdd0
    LOCATE 10, 1   '@1fddd
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1fdf8 DS:25c0,41da
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@1fe18 DS:25c0,41f4
    PRINT RT_TAB$(24); ""; "Acione ESC <Enter> para Continuar ";   '@1fe38 DS:25c0,4220
L_1fe5d:
    CALL MIXT_07f1_LimpaTeclado   '@1fe62
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@1fe6c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    BEEP   '@1fe88
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_1fe5d   '@1fe92
    ' ---- F_1fe99 @0x1fe99  (01fe99_F_1fe99.lift.txt; evidence_id (assembly): ev_8dbcf2e3398ea9378d658c9364e0fb53220d5a5ad2ff2580ecd96f97f0bd0c46)
    ' END SUB   '@1fe99
END SUB

SUB S_20182   ' entrada de SUB/FUNCTION (B$ENRA, locais 50 bytes) (0x20182)
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
    ' ---- FUN_2000_0182 @0x20182  (020182_FUN_2000_0182.lift.txt; evidence_id (assembly): ev_41dcb7f9efb1b6231d3511748bfb3e3e19bb6c1e5ed916937d7602c6f06d8263)
L_20199:
    L_BP14% = 0   '@2019e
    L_BP28! = A_15da!(0, 0)   '@201a8
    FOR V_11b8! = 1.0 TO L_BP28!   '@201c8 DS:4250
    IF NOT (NOT (A_2536!(RT_CINT%(FX##(V_11b8!)), 0) = 0.0 AND ((A_15da!(RT_CINT%(FX##(V_11b8!)), 3) <> -2.0 OR A_2536!(RT_CINT%(FX##(V_11b8!)), 4) = 1.0) AND (A_15da!(RT_CINT%(FX##(V_11b8!)), 0) <> -2.0 OR A_2536!(RT_CINT%(FX##(V_11b8!)), 3) = 1.0)))) THEN GOTO L_202f1   '@201d0 DS:4250,4254,4258
    GOTO L_20eeb   '@202e9
L_202f1:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@202f1
    IF NOT (V_11bc! <= 0.0) THEN GOTO L_2033f   '@2031c DS:4258
    GOTO L_20eeb   '@20337
L_2033f:
    V_11ec! = -V_11b8!   '@2033f
    CALL S_22ee1   '@20353
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@2035d
    L_BP12! = V_11d8!   '@2036d
    A_2536!(RT_CINT%(FX##(V_11b8!)), 0) = 1.0   '@2037d DS:4250
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_204d0   '@203a7
    L_BP18! = L_BP0e! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@203d6 DS:425c
    L_BP1c! = L_BP12! - FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@20414 DS:425c
    L_BP20! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP0e!   '@20452 DS:425c
    L_BP24! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0 + L_BP12!   '@2048d DS:425c
    GOTO L_20750   '@204c8
L_204d0:
    L_BP18! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@204d0
    L_BP1c! = FX##(A_16ee!(1, 1)) + L_BP12!   '@204f6
    L_BP20! = FX##(A_16ee!(1, 0)) + L_BP0e!   '@2051a
    L_BP24! = FX##(A_16ee!(1, 1)) + L_BP12!   '@20540
    L_BP2c! = A_16ee!(0, 0)   '@20564
    FOR V_11c0! = 2.0 TO L_BP2c!   '@20584 DS:4250,425c
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! < FX##(L_BP18!)) THEN GOTO L_205f0   '@2058c
    L_BP18! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@205c3
L_205f0:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e! > FX##(L_BP20!)) THEN GOTO L_20654   '@205f0
    L_BP20! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 0)) + L_BP0e!   '@20627
L_20654:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! < FX##(L_BP1c!)) THEN GOTO L_206ba   '@20654
    L_BP1c! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@2068c
L_206ba:
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12! > FX##(L_BP24!)) THEN GOTO L_20720   '@206ba
    L_BP24! = FX##(A_16ee!(RT_CINT%(FX##(V_11c0!)), 1)) + L_BP12!   '@206f2
L_20720:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20720 DS:4250
L_20750:
    IF NOT (L_BP18! < V_25a2!) THEN GOTO L_2077a   '@20750
    V_25a2! = L_BP18!   '@2076a
L_2077a:
    IF NOT (L_BP20! > V_25aa!) THEN GOTO L_207a4   '@2077a
    V_25aa! = L_BP20!   '@20794
L_207a4:
    IF NOT (L_BP1c! < V_25a6!) THEN GOTO L_207ce   '@207a4
    V_25a6! = L_BP1c!   '@207be
L_207ce:
    IF NOT (L_BP24! > V_25ae!) THEN GOTO L_207f8   '@207ce
    V_25ae! = L_BP24!   '@207e8
L_207f8:
    L_BP30! = A_15da!(0, 0)   '@207f8
    FOR V_11c0! = 1.0 TO L_BP30!   '@20818 DS:4250
    IF NOT (V_11c0! <> V_11b8!) THEN GOTO L_20bea   '@20820
    L_BP34! = A_15da!(RT_CINT%(FX##(V_11c0!)), 0)   '@2083b
    IF NOT (L_BP34! = -2.0) THEN GOTO L_209f5   '@20864 DS:4254
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_209ed   '@2087e DS:4260
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20951   '@208f0
    A_2536!(RT_CINT%(FX##(V_11c0!)), 1) = L_BP0e!   '@2091f
    GOTO L_209bd   '@20949
L_20951:
    A_2536!(RT_CINT%(FX##(V_11c0!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 1)) / 1000.0), 0)) + L_BP0e!   '@20951 DS:4260
L_209bd:
    A_2536!(RT_CINT%(FX##(V_11c0!)), 3) = 1.0   '@209bd DS:4250
L_209ed:
    GOTO L_20a12   '@209ed
L_209f5:
    IF NOT (L_BP34! = -3.0) THEN GOTO L_20a12   '@209f6 DS:4264
    GOTO L_20a12   '@20a0a
L_20a12:
    L_BP38! = A_15da!(RT_CINT%(FX##(V_11c0!)), 3)   '@20a12
    IF NOT (L_BP38! = -2.0) THEN GOTO L_20bc8   '@20a3c DS:4254
    IF NOT (INT(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) - RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0) * 1000) = FX##(V_11b8!)) THEN GOTO L_20bc0   '@20a56 DS:4260
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20b26   '@20ac8
    A_2536!(RT_CINT%(FX##(V_11c0!)), 2) = L_BP12!   '@20af7
    GOTO L_20b90   '@20b1e
L_20b26:
    A_2536!(RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11c0!)), 4)) / 1000.0), 1)) + L_BP12!   '@20b26 DS:4260
L_20b90:
    A_2536!(RT_CINT%(FX##(V_11c0!)), 4) = 1.0   '@20b90 DS:4250
L_20bc0:
    GOTO L_20be5   '@20bc0
L_20bc8:
    IF NOT (L_BP38! = -3.0) THEN GOTO L_20be5   '@20bc9 DS:4264
    GOTO L_20be5   '@20bdd
L_20be5:
L_20bea:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20bea DS:4250
    L_BP3c! = A_1664!(0, 0)   '@20c15
    FOR V_11c0! = 1.0 TO L_BP3c!   '@20c35 DS:4250
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 0) = -2.0) THEN GOTO L_20d74   '@20c3c DS:4254
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 1) = V_11b8!) THEN GOTO L_20d6f   '@20c70
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20d06   '@20ca5
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = L_BP0e!   '@20cd4
    GOTO L_20d6a   '@20cfe
L_20d06:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 7) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 2))), 0)) + L_BP0e!   '@20d06
L_20d6a:
L_20d6f:
L_20d74:
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 3) = -2.0) THEN GOTO L_20eb1   '@20d74 DS:4254
    IF NOT (A_17d4!(RT_CINT%(FX##(V_11c0!)), 4) = V_11b8!) THEN GOTO L_20eac   '@20da9
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_20e3f   '@20dde
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = L_BP12!   '@20e0d
    GOTO L_20ea7   '@20e37
L_20e3f:
    A_17d4!(RT_CINT%(FX##(V_11c0!)), 8) = FX##(A_16ee!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(V_11c0!)), 5))), 1)) + L_BP12!   '@20e3f
L_20ea7:
L_20eac:
L_20eb1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@20eb1 DS:4250
    L_BP14% = 1   '@20edc
L_20eeb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@20ef0 DS:4250
    IF NOT (L_BP14% = 1) THEN GOTO L_20f31   '@20f1b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_20199   '@20f29
L_20f31:
    ' END SUB   '@20f31
END SUB

SUB S_20f46   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x20f46)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_0f46 @0x20f46  (020f46_FUN_2000_0f46.lift.txt; evidence_id (assembly): ev_7cb565cffe902790b11daec2085afb119ea73e047fec976a9121a0bb96ac091f)
    L_BP1e! = A_1692!(0, 0)   '@20f53
    FOR V_11ec! = 1.0 TO L_BP1e!   '@20f73 DS:4250
    L_BP0e! = A_1692!(RT_CINT%(FX##(V_11ec!)), 0)   '@20f7a
    L_BP12! = A_1692!(RT_CINT%(FX##(V_11ec!)), 1)   '@20fa3
    L_BP16! = A_1692!(RT_CINT%(FX##(V_11ec!)), 2)   '@20fcd
    L_BP1a! = A_1692!(RT_CINT%(FX##(V_11ec!)), 3)   '@20ff4
    RT_LINE RT_SNG!((FX##(L_BP0e!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP12!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), 9, RT_CINT%(FX##(V_2576!)), 0   '@2101e DS:4268
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@210be DS:4250
    ' END SUB   '@210e9
END SUB

SUB S_210fe   ' entrada de SUB/FUNCTION (B$ENRA, locais 52 bytes) (0x210fe)
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
    ' ---- FUN_2000_10fe @0x210fe  (0210fe_FUN_2000_10fe.lift.txt; evidence_id (assembly): ev_2c259831cff75c9eaaa09ffd02c5b52a687e46d2cec761b4639e534e4e5f696e)
    L_BP1e! = A_1608!(0, 0)   '@2110b
    FOR V_11ec! = 1.0 TO L_BP1e!   '@2112b DS:4250
    L_BP22! = 0.0   '@21132 DS:4258
    CALL S_3e559(V_11ec!, L_BP22!, L_BP26!)   '@21142
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = L_BP26!   '@21154
    L_BP2a! = 1.0   '@2115d DS:4250
    CALL S_3e559(V_11ec!, L_BP2a!, L_BP2e!)   '@2116d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP12! = L_BP2e!   '@2117f
    L_BP32! = 2.0   '@21188 DS:425c
    CALL S_3e559(V_11ec!, L_BP32!, L_BP36!)   '@21198
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP16! = L_BP36!   '@211aa
    L_BP3a! = 3.0   '@211b3 DS:426c
    CALL S_3e559(V_11ec!, L_BP3a!, L_BP3e!)   '@211c3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1a! = L_BP3e!   '@211d5
    RT_LINE RT_SNG!((FX##(L_BP0e!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP12!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), 9, RT_CINT%(FX##(V_2572!)), 0   '@211de DS:4268
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2127e DS:4250
    ' END SUB   '@212a9
END SUB

SUB S_212be   ' entrada de SUB/FUNCTION (B$ENRA, locais 36 bytes) (0x212be)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    ' ---- FUN_2000_12be @0x212be  (0212be_FUN_2000_12be.lift.txt; evidence_id (assembly): ev_f25867c0cd985cfd193d72c70ba391375e2e5680b2580887a9bdd10dbab3d34f)
    IF NOT (A_15da!(0, 0) = 0.0) THEN GOTO L_212fd   '@212cb DS:4258
    GOTO L_2192a   '@212f5
L_212fd:
    IF NOT (V_0e1c$ = "DESENHASOUM") THEN GOTO L_213b2   '@212fd DS:4270
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11e4!)))   '@21314
    IF NOT (V_11bc! > 0.0) THEN GOTO L_213aa   '@2133f DS:4258
    V_11ec! = -V_11e4!   '@2135a
    CALL S_22ee1   '@2136e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@21378
    L_BP12! = V_11d8!   '@21388
    GOSUB L_214ad   '@21398
L_213aa:
    GOTO L_214a0   '@213aa
L_213b2:
    L_BP2a! = A_15da!(0, 0)   '@213b2
    FOR V_11b8! = 1.0 TO L_BP2a!   '@213d2 DS:4250
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11b8!)))   '@213da
    IF NOT (V_11bc! > 0.0) THEN GOTO L_21470   '@21405 DS:4258
    V_11ec! = -V_11b8!   '@21420
    CALL S_22ee1   '@21434
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP0e! = V_11d4!   '@2143e
    L_BP12! = V_11d8!   '@2144e
    GOSUB L_214ad   '@2145e
L_21470:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@21470 DS:4250
L_214a0:
    GOTO L_2192a   '@214a0
    ' ---- F_214a8 @0x214a8  (0214a8_F_214a8.lift.txt; evidence_id (assembly): ev_4a2350bed332ba0bcf5ec1448c48ef6d4313a9befca7d3203eadb9447c7e58fe)
L_214ad:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0212be_FUN_2000_12be
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_2167d   '@214b2
    L_BP16! = L_BP0e!   '@214e1
    L_BP1a! = L_BP12!   '@214f0
    L_BP26! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)) / 2.0   '@214ff DS:425c
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), RT_SNG!(FX##(L_BP26!) * V_258a!), 8, RT_CINT%(FX##(V_256e!)), 0, 0, 0   '@21536 DS:4268
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2) > 0) THEN GOTO L_21675   '@215a0
    L_BP26! = FX##(A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)) / 2.0   '@215cf DS:425c
    RT_CIRCLE RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), RT_SNG!(FX##(L_BP26!) * V_258a!), 8, RT_CINT%(FX##(V_256e!)), 0, 0, 0   '@21606 DS:4268
L_21675:
    GOTO L_2183e   '@21675
L_2167d:
    L_BP2e! = A_16ee!(0, 0)   '@2167d
    FOR V_11ec! = 1.0 TO L_BP2e!   '@2169d DS:4250
    L_BP16! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)) + L_BP0e!   '@216a4
    L_BP1a! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)) + L_BP12!   '@216d1
    L_BP1e! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 0)) + L_BP0e!   '@216ff DS:4250
    L_BP22! = FX##(A_16ee!(RT_CINT%(FX##(V_11ec!) + 1.0), 1)) + L_BP12!   '@21731 DS:4250
    RT_PSET RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), 0, 0   '@21764 DS:4268
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1e!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP22!) - V_2596!) * V_258e!), 8, RT_CINT%(FX##(V_256e!)), 0   '@217b0 DS:4268
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@2180e DS:4250
L_2183e:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 0) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_2188e   '@2183e
L_2188e:
    IF NOT (A_140c%(RT_CINT%(FX##(V_11bc!)), 1) = A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_2191b   '@2188e
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_21911   '@218da
    GOTO L_21916   '@21909
L_21911:
L_21916:
L_2191b:
    RETURN   '@2191b
L_2192a:   ' entrada vinda de 0212be_FUN_2000_12be
    ' END SUB   '@2192a
END SUB

SUB S_2193a   ' entrada de SUB/FUNCTION (B$ENRA, locais 20 bytes) (0x2193a)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    ' ---- FUN_2000_193a @0x2193a  (02193a_FUN_2000_193a.lift.txt; evidence_id (assembly): ev_364343ec001b7101f87174c4fb96b71370a874ceb238ac84ad4728553c0923ca)
    L_BP1e! = A_1664!(0, 0)   '@21947
    FOR V_11ec! = 1.0 TO L_BP1e!   '@21967 DS:4250
    L_BP0e! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@2196e
    L_BP12! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@21997
    L_BP16! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@219c1
    L_BP1a! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@219e8
    RT_LINE RT_SNG!((FX##(L_BP0e!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP12!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP16!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1a!) - V_2596!) * V_258e!), 9, RT_CINT%(FX##(V_2572!)), 0   '@21a12 DS:4268
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@21ab2 DS:4250
    ' END SUB   '@21add
END SUB

SUB S_21af2   ' entrada de SUB/FUNCTION (B$ENRA, locais 30 bytes) (0x21af2)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP18%
    DIM L_BP1c!
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    ' ---- FUN_2000_1af2 @0x21af2  (021af2_FUN_2000_1af2.lift.txt; evidence_id (assembly): ev_65b20c47eb172be032ba1e675be6f512b45eb3c0e8ec40e420b49188c266a984)
    V_13aa% = 0   '@21aff
L_21b10:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 0) >= A_15ac%(A_15ac%(0) + 1)) THEN GOTO L_21b67   '@21b10
    GOTO L_21b78   '@21b5f
L_21b67:
    V_13aa% = V_13aa% + 1   '@21b67
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21b10   '@21b70
L_21b78:
    REDIM A_16c0!(-32768 TO -32768, -32768 TO -32768)   '@21b78
    REDIM A_16ee!(-32768 TO -32768, -32768 TO -32768)   '@21b86
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 1) THEN GOTO L_222f0   '@21b8f
    REDIM A_16c0!(0 TO 10, 0 TO 1)   '@21bbe
    REDIM A_16ee!(0 TO 10, 0 TO 1)   '@21be2
    A_16c0!(0, 0) = 4.0   '@21c06 DS:4280
    A_16c0!(1, 0) = 0.0   '@21c26 DS:4258
    A_16c0!(1, 1) = 0.0   '@21c49 DS:4258
    A_16c0!(2, 0) = 0.0   '@21c6a DS:4258
    A_16c0!(2, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@21c8d
    A_16c0!(3, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@21cd3
    A_16c0!(3, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@21d18
    A_16c0!(4, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@21d5e
    A_16c0!(4, 1) = 0.0   '@21da3 DS:4258
    A_16c0!(5, 0) = 0.0   '@21dc7 DS:4258
    A_16c0!(5, 1) = 0.0   '@21dea DS:4258
    A_16c0!(6, 0) = 0.0   '@21e0e DS:4258
    A_16c0!(6, 1) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@21e31
    L_BP0e! = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 3)   '@21e77
    REDIM A_16ee!(0 TO 6, 0 TO 1)   '@21ea6
    A_16ee!(0, 0) = A_16c0!(0, 0)   '@21eca
    L_BP1c! = FX##(A_16ee!(0, 0)) + 1.0   '@21ef9 DS:4250
    FOR V_11d4! = 1.0 TO L_BP1c!   '@21f1e DS:4250
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#) - A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@21f26 DS:4284
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = A_16c0!(RT_CINT%(FX##(V_11d4!)), 0) * RT_SIN##(FX##(L_BP0e!) * V_0e04# / 180.0#) + A_16c0!(RT_CINT%(FX##(V_11d4!)), 1) * RT_COS##(FX##(L_BP0e!) * V_0e04# / 180.0#)   '@21fbb DS:4284
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@22051 DS:4250
    L_BP20! = A_16ee!(0, 0)   '@2207c
    FOR V_11d4! = 1.0 TO L_BP20!   '@2209c DS:4250
    IF NOT (V_11d4! = 1.0) THEN GOTO L_2211a   '@220a4 DS:4250
    L_BP12! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@220bf
    L_BP16! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@220e8
    GOTO L_221d9   '@22112
L_2211a:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) < L_BP12!) THEN GOTO L_22176   '@2211a
    L_BP12! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)   '@2214d
L_22176:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) < L_BP16!) THEN GOTO L_221d4   '@22176
    L_BP16! = A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)   '@221aa
L_221d4:
L_221d9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@221d9 DS:4250
    L_BP24! = FX##(A_16ee!(0, 0)) + 1.0   '@22204 DS:4250
    FOR V_11d4! = 1.0 TO L_BP24!   '@22229 DS:4250
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 0)) - L_BP12!   '@22230
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_16ee!(RT_CINT%(FX##(V_11d4!)), 1)) - L_BP16!   '@22277
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@222c0 DS:4250
L_222f0:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 3) THEN GOTO L_22609   '@222f0
    L_BP18% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 1)   '@2231e
    REDIM A_16ee!(0 TO A_1496%(CINT(V_11bc!), V_13aa%, 2) + 5, 0 TO 1)   '@22348
    A_16ee!(0, 0) = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 2)   '@2238e
    L_BP28! = A_16ee!(0, 0)   '@223d0
    FOR V_11d4! = 0.0 TO L_BP28!   '@223f0 DS:4250,4258
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 0) = FX##(A_14c4%(L_BP18%, RT_CINT%(FX##(V_11d4!)), 0)) / 10.0   '@223f8 DS:428c
    A_16ee!(RT_CINT%(FX##(V_11d4!)), 1) = FX##(A_14c4%(L_BP18%, RT_CINT%(FX##(V_11d4!)), 1)) / 10.0   '@22447 DS:428c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11d4!   '@22498 DS:4250
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 0) = A_16ee!(1, 0)   '@224c3 DS:4250
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 1.0), 1) = A_16ee!(1, 1)   '@22513 DS:4250
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 0) = A_16ee!(2, 0)   '@22562 DS:425c
    A_16ee!(RT_CINT%(FX##(A_16ee!(0, 0)) + 2.0), 1) = A_16ee!(2, 1)   '@225b2 DS:425c
L_22609:
    ' END SUB   '@22609
END SUB

SUB S_2261e   ' entrada de SUB/FUNCTION (B$ENRA, locais 30 bytes) (0x2261e)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28$
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_261e @0x2261e  (02261e_FUN_2000_261e.lift.txt; evidence_id (assembly): ev_fe2b749879f42452cff04de9b02404de0acb2ec6583154b536e6aa0c7d4e8435)
    REDIM L_BP1c%(0 TO 860)   '@22626
    V_11dc! = 1.0   '@22643 DS:4250
L_2265a:
    L_BP20! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11dc!)), 1)) * 1000.0)) / 10.0#   '@2265a DS:4260,4290
    L_BP24! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11dc!)), 0)) * 1000.0)) / 10.0#   '@22698 DS:4260,4290
    IF NOT ((L_BP24! > V_259e! OR L_BP24! < V_2596!) AND V_11e4! = 0.0 OR (L_BP20! > V_259a! OR L_BP20! < V_2592!) AND V_11e4! = 1.0) THEN GOTO L_22783   '@226d5 DS:4250,4258
    GOTO L_22e52   '@2277b
L_22783:
    IF NOT (V_11e4! = 0.0) THEN GOTO L_22911   '@22783 DS:4258
    RT_GCAIXA RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP24!) - V_2596!) * V_258e!) - 1.0), RT_SNG!(INT((FX##(V_259a!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP24!) - V_2596!) * V_258e!) + 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@2279e DS:4250,4268,4298
    RT_LINE RT_SNG!((FX##(V_2592!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP24!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_259a!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP24!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 20   '@22867 DS:4268
    GOTO L_22a81   '@22909
L_22911:
    RT_GCAIXA RT_SNG!(INT((FX##(L_BP20!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), RT_SNG!(INT((FX##(L_BP20!) - V_2592!) * V_258a!) + V_2582! + 1.0), RT_SNG!(165.0 - INT((FX##(V_2596!) - V_2596!) * V_258e!)), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@22911 DS:4250,4268,4298
    RT_LINE RT_SNG!((FX##(L_BP20!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_259e!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP20!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_2596!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 20   '@229da DS:4268
L_22a81:
    LOCATE 25, 27   '@22a81
    IF NOT (V_11e4! = 0.0) THEN GOTO L_22b05   '@22a9f DS:4258
    V_0e10$ = STR$(V_11dc!)   '@22aba
    PRINT USING "\ \(#####.##)"; V_0e10$; RT_PU#(L_BP24!, "\ \(#####.##)", 1);   '@22ad6 DS:429c
    GOTO L_22bd5   '@22afd
L_22b05:
    V_0e14$ = " " + CHR$(RT_CINT%(FX##(V_11dc!) + 26& * ((RT_CLNG&(FX##(V_11dc!)) \ 26&) * (V_11dc! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(V_11dc!) - 1.0) \ 26&), ("'"))   '@22b05 DS:4298,42ae,42b4,42b8,42c0
    PRINT USING "\ \(#####.##)"; V_0e14$; RT_PU#(L_BP20!, "\ \(#####.##)", 1);   '@22ba9 DS:429c
L_22bd5:
    CALL MIXT_07f1_LimpaTeclado   '@22bd5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@22bdf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_11e4! = 0.0) THEN GOTO L_22c95   '@22bfb DS:4258
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP24!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@22c16 DS:4268,4298
    GOTO L_22d11   '@22c8d
L_22c95:
    RT_GPONTO RT_SNG!(INT((FX##(L_BP20!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@22c95 DS:4268,4298
L_22d11:
    L_BP28$ = V_0e0c$   '@22d11
    IF NOT (L_BP28$ <> "S") THEN GOTO L_22d4c   '@22d23 DS:42c6
    IF NOT (L_BP28$ = "s") THEN GOTO L_22d7c   '@22d3a DS:42cc
L_22d4c:
    V_11d4! = L_BP20!   '@22d4c
    V_11d8! = L_BP24!   '@22d5c
    GOTO L_22ebf   '@22d6c
L_22d7c:
    IF NOT (L_BP28$ <> "C") THEN GOTO L_22da0   '@22d7c DS:42d2
    IF NOT (L_BP28$ = "c") THEN GOTO L_22dc1   '@22d8e DS:42d8
L_22da0:
    V_11dc! = -1.0   '@22da0 DS:4298
    GOTO L_22ebf   '@22db1
L_22dc1:
    IF NOT (L_BP28$ <> "A") THEN GOTO L_22de5   '@22dc1 DS:42de
    IF NOT (L_BP28$ = "a") THEN GOTO L_22e4d   '@22dd3 DS:42e4
L_22de5:
    V_11dc! = FX##(V_11dc!) - 2.0   '@22de5 DS:4254
    IF NOT (V_11dc! = -1.0) THEN GOTO L_22e45   '@22dfb DS:4298
    V_11dc! = FX##(A_0e78!(0, RT_CINT%(FX##(V_11e4!)))) - 1.0   '@22e16 DS:4298
L_22e45:
    GOTO L_22e4d   '@22e45
L_22e4d:
L_22e52:
    V_11dc! = FX##(V_11dc!) + 1.0   '@22e57 DS:4250
    IF NOT (A_0e78!(0, RT_CINT%(FX##(V_11e4!))) < V_11dc!) THEN GOTO L_22eb2   '@22e6d
    V_11dc! = 1.0   '@22ea1 DS:4250
L_22eb2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2265a   '@22eb2
L_22ebf:
    ' @22ebf libera strings locais (L_BP28)
    ERASE L_BP1c%   '@22ec8
    ' END SUB   '@22ed1
END SUB

SUB S_22ee1   ' entrada de SUB/FUNCTION (B$ENRA, locais 74 bytes) (0x22ee1)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2a%
    DIM L_BP2c%
    DIM L_BP2e%
    DIM L_BP32!
    DIM L_BP34%
    DIM L_BP36%
    DIM L_BP38%
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c$
    DIM L_BP50$
    DIM L_BP54$
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_2ee1 @0x22ee1  (022ee1_FUN_2000_2ee1.lift.txt; evidence_id (assembly): ev_f8f017c408c4fd55bcf5aba90cb4e1391382905d03ff9b86dc658dd39cc6c00a)
    REDIM L_BP1c%(0 TO 210)   '@22ee9
    V_11bc! = A_15ac%(RT_CINT%(ABS(FX##(V_11ec!))))   '@22f0b
    CALL S_21af2   '@22f39
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 0)   '@22f43
    IF NOT (L_BP28! = 0.0) THEN GOTO L_2307a   '@22f6f DS:4258
    L_BP2a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@22f89
    IF NOT (L_BP2a% <> 1) THEN GOTO L_22fca   '@22fb3
    IF NOT (L_BP2a% = 3) THEN GOTO L_23037   '@22fc1
L_22fca:
    L_BP20! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1))), 0)   '@22fca
    GOTO L_23072   '@2302f
L_23037:
    IF NOT (L_BP2a% = 2) THEN GOTO L_23072   '@23037
    L_BP20! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@23040
    GOTO L_23072   '@2306a
L_23072:
    GOTO L_233dc   '@23072
L_2307a:
    IF NOT (L_BP28! = -1.0) THEN GOTO L_23244   '@2307b DS:4298
    L_BP2c% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@2308f
    IF NOT (L_BP2c% <> 1) THEN GOTO L_230d0   '@230b9
    IF NOT (L_BP2c% = 3) THEN GOTO L_231b9   '@230c7
L_230d0:
    L_BP20! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0))   '@230d0 DS:42ea
    GOTO L_2323c   '@231b1
L_231b9:
    IF NOT (L_BP2c% = 2) THEN GOTO L_2323c   '@231b9
    L_BP20! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@231c2 DS:42ea
    GOTO L_2323c   '@23234
L_2323c:
    GOTO L_233dc   '@2323c
L_23244:
    IF NOT (L_BP28! = -2.0) THEN GOTO L_233bf   '@23245 DS:4254
    L_BP2e% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23259
    IF NOT (L_BP2e% <> 1) THEN GOTO L_2329a   '@23283
    IF NOT (L_BP2e% = 3) THEN GOTO L_2335a   '@23291
L_2329a:
    L_BP20! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 1)))) * 100.0), 0) + A_2536!(RT_CINT%(ABS(FX##(V_11ec!))), 1)   '@2329a DS:42ea
    GOTO L_233b7   '@23352
L_2335a:
    IF NOT (L_BP2e% = 2) THEN GOTO L_233b7   '@2335a
    L_BP20! = FX##(A_2536!(RT_CINT%(ABS(FX##(V_11ec!))), 1)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@23363
    GOTO L_233b7   '@233af
L_233b7:
    GOTO L_233dc   '@233b7
L_233bf:
    IF NOT (L_BP28! = -3.0) THEN GOTO L_233dc   '@233c0 DS:4264
    GOTO L_233dc   '@233d4
L_233dc:
    L_BP32! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 3)   '@233dc
    IF NOT (L_BP32! = 0.0) THEN GOTO L_2351b   '@23409 DS:4258
    L_BP34% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23423
    IF NOT (L_BP34% <> 1) THEN GOTO L_23464   '@2344d
    IF NOT (L_BP34% = 3) THEN GOTO L_234d5   '@2345b
L_23464:
    L_BP24! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4))), 1)   '@23464
    GOTO L_23513   '@234cd
L_234d5:
    IF NOT (L_BP34% = 2) THEN GOTO L_23513   '@234d5
    L_BP24! = A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@234de
    GOTO L_23513   '@2350b
L_23513:
    GOTO L_23883   '@23513
L_2351b:
    IF NOT (L_BP32! = -1.0) THEN GOTO L_236ea   '@2351c DS:4298
    L_BP36% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23530
    IF NOT (L_BP36% <> 1) THEN GOTO L_23571   '@2355a
    IF NOT (L_BP36% = 3) THEN GOTO L_2365d   '@23568
L_23571:
    L_BP24! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1))   '@23571 DS:42ea
    GOTO L_236e2   '@23655
L_2365d:
    IF NOT (L_BP36% = 2) THEN GOTO L_236e2   '@2365d
    L_BP24! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@23666 DS:42ea
    GOTO L_236e2   '@236da
L_236e2:
    GOTO L_23883   '@236e2
L_236ea:
    IF NOT (L_BP32! = -2.0) THEN GOTO L_23866   '@236eb DS:4254
    L_BP38% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@236ff
    IF NOT (L_BP38% <> 1) THEN GOTO L_23740   '@23729
    IF NOT (L_BP38% = 3) THEN GOTO L_23801   '@23737
L_23740:
    L_BP24! = FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4) - INT(FX##(A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 4)))) * 100.0), 1) + A_2536!(RT_CINT%(ABS(FX##(V_11ec!))), 2)   '@23740 DS:42ea
    GOTO L_2385e   '@237f9
L_23801:
    IF NOT (L_BP38% = 2) THEN GOTO L_2385e   '@23801
    L_BP24! = FX##(A_2536!(RT_CINT%(ABS(FX##(V_11ec!))), 2)) + A_15da!(RT_CINT%(ABS(FX##(V_11ec!))), 5)   '@2380a
    GOTO L_2385e   '@23856
L_2385e:
    GOTO L_23883   '@2385e
L_23866:
    IF NOT (L_BP32! = -3.0) THEN GOTO L_23883   '@23867 DS:4264
    GOTO L_23883   '@2387b
L_23883:
    RT_VIEWPRINT 1, 25   '@23883
    IF NOT (V_11ec! < 0.0) THEN GOTO L_238dd   '@23895 DS:4258
    V_11d4! = L_BP20!   '@238b0
    V_11d8! = L_BP24!   '@238c0
    GOTO L_23d1a   '@238d0
L_238dd:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_23945   '@238dd
    V_11dc! = 0.0   '@2390c DS:4258
    V_11d4! = L_BP20!   '@2391d
    V_11d8! = L_BP24!   '@2392d
    GOTO L_23d15   '@2393d
L_23945:
    V_11dc! = 1.0   '@23945 DS:4250
L_2395c:
    L_BP3c! = FX##(A_16ee!(RT_CINT%(FX##(V_11dc!)), 0)) + L_BP20!   '@2395c
    L_BP40! = FX##(A_16ee!(RT_CINT%(FX##(V_11dc!)), 1)) + L_BP24!   '@23989
    RT_GCAIXA RT_SNG!((FX##(L_BP3c!) - V_2592!) * V_258a! - 12.0 + V_2582!), RT_SNG!(165.0 - (FX##(L_BP40!) - V_2596!) * V_258e! - 6.0), RT_SNG!((FX##(L_BP3c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP40!) - V_2596!) * V_258e! + 6.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@239b7 DS:4268,42ee,42f2,42f6
    L_BP44! = (FX##(L_BP3c!) - V_2592!) * V_258a! - 8.0 + V_2582!   '@23a67 DS:42fa
    L_BP48! = 165.0 - (FX##(L_BP40!) - V_2596!) * V_258e! + 4.0   '@23a8b DS:4268,4280
    L_BP4c$ = CHR$(26)   '@23aab
    L_BP50$ = "CGA"   '@23abe DS:42fe
    CALL MIXT_08c4_TextoGrafico(L_BP44!, L_BP48!, L_BP4c$, L_BP50$)   '@23acb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @23ae0 libera strings locais (L_BP4c)
    ' @23ae9 libera strings locais (L_BP50)
    CALL MIXT_07f1_LimpaTeclado   '@23af2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@23afc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP3c!) - V_2592!) * V_258a! - 12.0 + V_2582!), RT_SNG!(165.0 - (FX##(L_BP40!) - V_2596!) * V_258e! - 6.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@23b18 DS:4268,42ee,42f2
    L_BP54$ = V_0e0c$   '@23b85
    IF NOT (L_BP54$ <> "S") THEN GOTO L_23bc0   '@23b97 DS:42c6
    IF NOT (L_BP54$ = "s") THEN GOTO L_23bf0   '@23bae DS:42cc
L_23bc0:
    V_11d4! = L_BP3c!   '@23bc0
    V_11d8! = L_BP40!   '@23bd0
    GOTO L_23d1a   '@23be0
L_23bf0:
    IF NOT (L_BP54$ <> "C") THEN GOTO L_23c14   '@23bf0 DS:42d2
    IF NOT (L_BP54$ = "c") THEN GOTO L_23c35   '@23c02 DS:42d8
L_23c14:
    V_11dc! = -1.0   '@23c14 DS:4298
    GOTO L_23d1a   '@23c25
L_23c35:
    IF NOT (L_BP54$ <> "A") THEN GOTO L_23c59   '@23c35 DS:42de
    IF NOT (L_BP54$ = "a") THEN GOTO L_23cb7   '@23c47 DS:42e4
L_23c59:
    V_11dc! = FX##(V_11dc!) - 2.0   '@23c59 DS:4254
    IF NOT (V_11dc! = -1.0) THEN GOTO L_23caf   '@23c6f DS:4298
    V_11dc! = FX##(A_16ee!(0, 0)) - 1.0   '@23c8a DS:4298
L_23caf:
    GOTO L_23cb7   '@23caf
L_23cb7:
    V_11dc! = FX##(V_11dc!) + 1.0   '@23cb7 DS:4250
    IF NOT (A_16ee!(0, 0) < V_11dc!) THEN GOTO L_23d08   '@23ccd
    V_11dc! = 1.0   '@23cf7 DS:4250
L_23d08:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2395c   '@23d08
L_23d15:
L_23d1a:
    ' @23d1a libera strings locais (L_BP54)
    ERASE L_BP1c%   '@23d23
    ' END SUB   '@23d2c
END SUB

SUB S_23d3c   ' entrada de SUB/FUNCTION (B$ENRA, locais 314 bytes) (0x23d3c)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP4a!
    DIM L_BP4c%
    DIM L_BP4e%
    DIM L_BP50%
    DIM L_BP54!
    DIM L_BP56%
    DIM L_BP58%
    DIM L_BP5a%
    DIM L_BP5e!
    DIM L_BP60%
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
    DIM L_BPe8$
    DIM L_BPec$
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf8$
    DIM L_BPfc$
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP46%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_3d3c @0x23d3c  (023d3c_FUN_2000_3d3c.lift.txt; evidence_id (assembly): ev_904cc6fce750f2ee05ad36778b1149ec4be978470a9f55a843119c096f27b20b)
    REDIM L_BP1c%(0 TO 210)   '@23d44
    V_11bc! = A_1664!(0, 0)   '@23d66
    IF NOT (V_11ec! < 0.0) THEN GOTO L_23dc1   '@23d86 DS:4258
    V_11bc! = A_1608!(0, 0)   '@23da1
L_23dc1:
    REDIM L_BP46%(0 TO CINT(V_11bc!))   '@23dc1
    IF NOT (V_11ec! < 0.0) THEN GOTO L_23e08   '@23de5 DS:4258
    GOTO L_248a3   '@23e00
L_23e08:
    V_11bc! = A_15ac%(RT_CINT%(FX##(V_11ec!)))   '@23e08
    CALL S_21af2   '@23e33
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP4a! = A_15da!(RT_CINT%(FX##(V_11ec!)), 0)   '@23e3d
    IF NOT (L_BP4a! = 0.0) THEN GOTO L_23f68   '@23e66 DS:4258
    L_BP4c% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23e80
    IF NOT (L_BP4c% <> 1) THEN GOTO L_23ec1   '@23eaa
    IF NOT (L_BP4c% = 3) THEN GOTO L_23f28   '@23eb8
L_23ec1:
    L_BP20! = FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 2)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1))), 0)   '@23ec1
    GOTO L_23f60   '@23f20
L_23f28:
    IF NOT (L_BP4c% = 2) THEN GOTO L_23f60   '@23f28
    L_BP20! = A_15da!(RT_CINT%(FX##(V_11ec!)), 2)   '@23f31
    GOTO L_23f60   '@23f58
L_23f60:
    GOTO L_242a6   '@23f60
L_23f68:
    IF NOT (L_BP4a! = -1.0) THEN GOTO L_24120   '@23f69 DS:4298
    L_BP4e% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@23f7d
    IF NOT (L_BP4e% <> 1) THEN GOTO L_23fbe   '@23fa7
    IF NOT (L_BP4e% = 3) THEN GOTO L_2409b   '@23fb5
L_23fbe:
    L_BP20! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)))), 1)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11ec!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)))) * 100.0), 0))   '@23fbe DS:42ea
    GOTO L_24118   '@24093
L_2409b:
    IF NOT (L_BP4e% = 2) THEN GOTO L_24118   '@2409b
    L_BP20! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)))), 1)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11ec!)), 2)   '@240a4 DS:42ea
    GOTO L_24118   '@24110
L_24118:
    GOTO L_242a6   '@24118
L_24120:
    IF NOT (L_BP4a! = -2.0) THEN GOTO L_24289   '@24121 DS:4254
    L_BP50% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@24135
    IF NOT (L_BP50% <> 1) THEN GOTO L_24176   '@2415f
    IF NOT (L_BP50% = 3) THEN GOTO L_2422a   '@2416d
L_24176:
    L_BP20! = FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 2)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11ec!)), 1) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 1)))) * 100.0), 0) + A_2536!(RT_CINT%(FX##(V_11ec!)), 1)   '@24176 DS:42ea
    GOTO L_24281   '@24222
L_2422a:
    IF NOT (L_BP50% = 2) THEN GOTO L_24281   '@2422a
    L_BP20! = FX##(A_2536!(RT_CINT%(FX##(V_11ec!)), 1)) + A_15da!(RT_CINT%(FX##(V_11ec!)), 2)   '@24233
    GOTO L_24281   '@24279
L_24281:
    GOTO L_242a6   '@24281
L_24289:
    IF NOT (L_BP4a! = -3.0) THEN GOTO L_242a6   '@2428a DS:4264
    GOTO L_242a6   '@2429e
L_242a6:
    L_BP54! = A_15da!(RT_CINT%(FX##(V_11ec!)), 3)   '@242a6
    IF NOT (L_BP54! = 0.0) THEN GOTO L_243d9   '@242d0 DS:4258
    L_BP56% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@242ea
    IF NOT (L_BP56% <> 1) THEN GOTO L_2432b   '@24314
    IF NOT (L_BP56% = 3) THEN GOTO L_24396   '@24322
L_2432b:
    L_BP24! = FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 5)) - A_16ee!(RT_CINT%(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4))), 1)   '@2432b
    GOTO L_243d1   '@2438e
L_24396:
    IF NOT (L_BP56% = 2) THEN GOTO L_243d1   '@24396
    L_BP24! = A_15da!(RT_CINT%(FX##(V_11ec!)), 5)   '@2439f
    GOTO L_243d1   '@243c9
L_243d1:
    GOTO L_2471d   '@243d1
L_243d9:
    IF NOT (L_BP54! = -1.0) THEN GOTO L_24596   '@243da DS:4298
    L_BP58% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@243ee
    IF NOT (L_BP58% <> 1) THEN GOTO L_2442f   '@24418
    IF NOT (L_BP58% = 3) THEN GOTO L_2450f   '@24426
L_2442f:
    L_BP24! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)))), 0)) * 100.0 + (FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11ec!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)))) * 100.0), 1))   '@2442f DS:42ea
    GOTO L_2458e   '@24507
L_2450f:
    IF NOT (L_BP58% = 2) THEN GOTO L_2458e   '@2450f
    L_BP24! = FX##(A_0e78!(RT_CINT%(INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)))), 0)) * 100.0 + A_15da!(RT_CINT%(FX##(V_11ec!)), 5)   '@24518 DS:42ea
    GOTO L_2458e   '@24586
L_2458e:
    GOTO L_2471d   '@2458e
L_24596:
    IF NOT (L_BP54! = -2.0) THEN GOTO L_24700   '@24597 DS:4254
    L_BP5a% = A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6)   '@245ab
    IF NOT (L_BP5a% <> 1) THEN GOTO L_245ec   '@245d5
    IF NOT (L_BP5a% = 3) THEN GOTO L_246a1   '@245e3
L_245ec:
    L_BP24! = FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 5)) - A_16ee!(RT_CINT%((A_15da!(RT_CINT%(FX##(V_11ec!)), 4) - INT(FX##(A_15da!(RT_CINT%(FX##(V_11ec!)), 4)))) * 100.0), 1) + A_2536!(RT_CINT%(FX##(V_11ec!)), 2)   '@245ec DS:42ea
    GOTO L_246f8   '@24699
L_246a1:
    IF NOT (L_BP5a% = 2) THEN GOTO L_246f8   '@246a1
    L_BP24! = FX##(A_2536!(RT_CINT%(FX##(V_11ec!)), 2)) + A_15da!(RT_CINT%(FX##(V_11ec!)), 5)   '@246aa
    GOTO L_246f8   '@246f0
L_246f8:
    GOTO L_2471d   '@246f8
L_24700:
    IF NOT (L_BP54! = -3.0) THEN GOTO L_2471d   '@24701 DS:4264
    GOTO L_2471d   '@24715
L_2471d:
    IF NOT (A_1496%(RT_CINT%(FX##(V_11bc!)), V_13aa%, 6) = 2) THEN GOTO L_24774   '@2471d
    V_11d4! = L_BP20!   '@2474c
    V_11d8! = L_BP24!   '@2475c
    GOTO L_2489e   '@2476c
L_24774:
    V_11d4! = 0.0   '@24774 DS:4258
    V_11d8! = 0.0   '@24785 DS:4258
    L_BP5e! = A_16ee!(0, 0)   '@24796
    FOR V_11dc! = 1.0 TO L_BP5e!   '@247b6 DS:4250
    V_11d4! = FX##(A_16ee!(RT_CINT%(FX##(V_11dc!)), 0)) + V_11d4!   '@247be
    V_11d8! = FX##(A_16ee!(RT_CINT%(FX##(V_11dc!)), 0)) + V_11d8!   '@247ed
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11dc!   '@2481c DS:4250
    V_11d4! = FX##(V_11d4!) / A_16ee!(0, 0) + L_BP20!   '@24847
    V_11d8! = FX##(V_11d8!) / A_16ee!(0, 0) + L_BP24!   '@24870
L_2489e:
L_248a3:
    V_11dc! = 1.0   '@248a8 DS:4250
L_248be:
    L_BP60% = (V_11ec! < 0.0)   '@248be DS:4258
    IF NOT ((FX##(-V_11ec!) = INT(FX##(A_1608!(RT_CINT%(FX##(V_11dc!)), 4))) AND L_BP60%) <> 0) THEN GOTO L_2494f   '@24902
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = 0   '@24926
    GOTO L_24e96   '@24947
L_2494f:
    IF NOT (V_11ec! < 0.0) THEN GOTO L_24a1e   '@2494f DS:4258
    L_BP64! = 0.0   '@2496a DS:4258
    CALL S_3e559(V_11dc!, L_BP64!, L_BP68!)   '@2497a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = L_BP68!   '@2498c
    L_BP6c! = 1.0   '@24995 DS:4250
    CALL S_3e559(V_11dc!, L_BP6c!, L_BP70!)   '@249a5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = L_BP70!   '@249b7
    L_BP74! = 2.0   '@249c0 DS:425c
    CALL S_3e559(V_11dc!, L_BP74!, L_BP78!)   '@249d0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP30! = L_BP78!   '@249e2
    L_BP7c! = 3.0   '@249eb DS:426c
    CALL S_3e559(V_11dc!, L_BP7c!, L_BP80!)   '@249fb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP34! = L_BP80!   '@24a0d
    GOTO L_24ac7   '@24a16
L_24a1e:
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11dc!)), 0)   '@24a1e
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11dc!)), 1)   '@24a47
    L_BP30! = A_1664!(RT_CINT%(FX##(V_11dc!)), 2)   '@24a71
    L_BP34! = A_1664!(RT_CINT%(FX##(V_11dc!)), 3)   '@24a98
L_24ac7:
    IF NOT (L_BP34! < V_2596! OR (L_BP2c! < V_2596! OR (L_BP34! > V_259e! OR (L_BP2c! > V_259e! OR (L_BP30! < V_2592! OR (L_BP28! < V_2592! OR (L_BP30! > V_259a! OR (L_BP28! > V_259a! OR A_17d4!(RT_CINT%(FX##(V_11dc!)), 6) = 2.0 AND V_11ec! < 0.0)))))))) THEN GOTO L_24c1a   '@24ac7 DS:4258,425c
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = 0   '@24bf1
    GOTO L_24e91   '@24c12
L_24c1a:
    IF NOT (V_11e4! = 0.0) THEN GOTO L_24d62   '@24c1a DS:4258
    IF NOT (L_BP2c! <> L_BP34!) THEN GOTO L_24d34   '@24c35
    L_BP84! = RT_POT##((FX##(L_BP28!) - V_11d4!), (2.0)) + RT_POT##((FX##(L_BP2c!) - V_11d8!), (2.0))   '@24c4e DS:425c
    L_BP88! = RT_POT##((FX##(L_BP30!) - V_11d4!), (2.0)) + RT_POT##((FX##(L_BP34!) - V_11d8!), (2.0))   '@24c88 DS:425c
    CALL MIXT_0877_Menor(L_BP84!, L_BP88!, L_BP8c!)   '@24cbb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = RT_CINT%(-1.0 - RT_SQR##(FX##(L_BP8c!)))   '@24cd0 DS:4298
    L_BP46%(0) = L_BP46%(0) + 1   '@24d02
    GOTO L_24d5a   '@24d2c
L_24d34:
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = 0   '@24d34
L_24d5a:
    GOTO L_24e8c   '@24d5a
L_24d62:
    IF NOT (L_BP28! <> L_BP30!) THEN GOTO L_24e61   '@24d62
    L_BP90! = RT_POT##((FX##(L_BP28!) - V_11d4!), (2.0)) + RT_POT##((FX##(L_BP2c!) - V_11d8!), (2.0))   '@24d7b DS:425c
    L_BP94! = RT_POT##((FX##(L_BP30!) - V_11d4!), (2.0)) + RT_POT##((FX##(L_BP34!) - V_11d8!), (2.0))   '@24db5 DS:425c
    CALL MIXT_0877_Menor(L_BP90!, L_BP94!, L_BP98!)   '@24de8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = RT_CINT%(-1.0 - RT_SQR##(FX##(L_BP98!)))   '@24dfd DS:4298
    L_BP46%(0) = L_BP46%(0) + 1   '@24e2f
    GOTO L_24e87   '@24e59
L_24e61:
    L_BP46%(RT_CINT%(FX##(V_11dc!))) = 0   '@24e61
L_24e87:
L_24e8c:
L_24e91:
L_24e96:
    V_11dc! = FX##(V_11dc!) + 1.0   '@24e96 DS:4250
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (NOT (A_1608!(0, 0) >= V_11dc! AND V_11ec! < 0.0 OR A_1664!(0, 0) >= V_11dc! AND V_11ec! > 0.0)) THEN GOTO L_248be   '@24eac DS:4258
    IF NOT (L_BP46%(0) = 0) THEN GOTO L_24f7f   '@24f42
    V_11dc! = -1.0   '@24f61 DS:4298
    GOTO L_2617d   '@24f72
L_24f7f:
    L_BP9c! = 1.0   '@24f7f DS:4250
L_24f96:
    V_11c0! = -1.0   '@24f96 DS:4298
    V_11dc! = 1.0   '@24fa7 DS:4250
L_24fbe:
    IF NOT (L_BP46%(RT_CINT%(FX##(V_11dc!))) < 0) THEN GOTO L_2508b   '@24fbe
    IF NOT (-L_BP46%(RT_CINT%(FX##(V_11dc!))) < V_11c0! OR V_11c0! = -1.0) THEN GOTO L_25086   '@24fe5 DS:4298
    V_11c0! = -L_BP46%(RT_CINT%(FX##(V_11dc!)))   '@25043
    V_11cc! = V_11dc!   '@25070
L_25086:
L_2508b:
    V_11dc! = FX##(V_11dc!) + 1.0   '@2508b DS:4250
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (NOT (A_1664!(0, 0) >= V_11dc! AND V_11ec! > 0.0 OR A_1608!(0, 0) >= V_11dc! AND V_11ec! < 0.0)) THEN GOTO L_24fbe   '@250a1 DS:4258
    L_BP46%(RT_CINT%(FX##(V_11cc!))) = RT_CINT%(FX##(L_BP9c!))   '@25137
    L_BP9c! = FX##(L_BP9c!) + 1.0   '@25164 DS:4250
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP46%(0) < L_BP9c!) THEN GOTO L_24f96   '@2517a
    RT_VIEWPRINT 1, 25   '@251a7
    V_0e18$ = ""   '@251b9 DS:4306
    L_BP9c! = 1.0   '@251cb DS:4250
L_251e2:
    IF NOT (V_0e18$ = "") THEN GOTO L_253e2   '@251e2 DS:4306
    V_11dc! = 1.0   '@251f9 DS:4250
L_25210:
    IF NOT (L_BP46%(RT_CINT%(FX##(V_11dc!))) = L_BP9c!) THEN GOTO L_2524d   '@25210
    GOTO L_2526a   '@25245
L_2524d:
    V_11dc! = FX##(V_11dc!) + 1.0   '@2524d DS:4250
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_25210   '@25263
L_2526a:
    IF NOT (V_11ec! < 0.0) THEN GOTO L_2533d   '@2526a DS:4258
    L_BPa0! = 0.0   '@25285 DS:4258
    CALL S_3e559(V_11dc!, L_BPa0!, L_BPa4!)   '@25296
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPa8! = 2.0   '@252aa DS:425c
    CALL S_3e559(V_11dc!, L_BPa8!, L_BPac!)   '@252b5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = (FX##(L_BPa4!) + L_BPac!) / 2.0   '@252c9 DS:425c
    L_BPb0! = 1.0   '@252dd DS:4250
    CALL S_3e559(V_11dc!, L_BPb0!, L_BPb4!)   '@252ee
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPb8! = 3.0   '@25302 DS:426c
    CALL S_3e559(V_11dc!, L_BPb8!, L_BPbc!)   '@2530d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = (FX##(L_BPb4!) + L_BPbc!) / 2.0   '@25321 DS:425c
    GOTO L_253da   '@25335
L_2533d:
    L_BP28! = (FX##(A_1664!(RT_CINT%(FX##(V_11dc!)), 0)) + A_1664!(RT_CINT%(FX##(V_11dc!)), 2)) / 2.0   '@2533d DS:425c
    L_BP2c! = (FX##(A_1664!(RT_CINT%(FX##(V_11dc!)), 1)) + A_1664!(RT_CINT%(FX##(V_11dc!)), 3)) / 2.0   '@25387 DS:425c
L_253da:
    GOTO L_255df   '@253da
L_253e2:
    IF NOT (V_0e18$ = "*") THEN GOTO L_254ea   '@253e2 DS:430a
    V_0e18$ = "**"   '@253f9 DS:4310
    IF NOT (V_11ec! < 0.0) THEN GOTO L_2548c   '@2540b DS:4258
    L_BPc0! = 2.0   '@25426 DS:425c
    CALL S_3e559(V_11dc!, L_BPc0!, L_BPc4!)   '@25437
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = L_BPc4!   '@2544b
    L_BPc8! = 3.0   '@25455 DS:426c
    CALL S_3e559(V_11dc!, L_BPc8!, L_BPcc!)   '@25466
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = L_BPcc!   '@2547a
    GOTO L_254e2   '@25484
L_2548c:
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11dc!)), 2)   '@2548c
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11dc!)), 3)   '@254b3
L_254e2:
    GOTO L_255da   '@254e2
L_254ea:
    V_0e18$ = "*"   '@254ea DS:430a
    IF NOT (V_11ec! < 0.0) THEN GOTO L_2557d   '@254fc DS:4258
    L_BPd0! = 0.0   '@25517 DS:4258
    CALL S_3e559(V_11dc!, L_BPd0!, L_BPd4!)   '@25528
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = L_BPd4!   '@2553c
    L_BPd8! = 1.0   '@25546 DS:4250
    CALL S_3e559(V_11dc!, L_BPd8!, L_BPdc!)   '@25557
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = L_BPdc!   '@2556b
    GOTO L_255d5   '@25575
L_2557d:
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11dc!)), 0)   '@2557d
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11dc!)), 1)   '@255a6
L_255d5:
L_255da:
L_255df:
    IF NOT (V_11e4! = 0.0) THEN GOTO L_25763   '@255df DS:4258
    RT_GCAIXA RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!) - 5.0), RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!) + 5.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@255fa DS:4268,4316,431a,431e
    L_BPe0! = (FX##(L_BP28!) - V_2592!) * V_258a! - 8.0 + V_2582!   '@256c6 DS:42fa
    L_BPe4! = 165.0 - (FX##(L_BP2c!) - V_2596!) * V_258e! + 4.0   '@256eb DS:4268,4280
    L_BPe8$ = CHR$(26)   '@2570c
    L_BPec$ = "CGA"   '@25720 DS:42fe
    CALL MIXT_08c4_TextoGrafico(L_BPe0!, L_BPe4!, L_BPe8$, L_BPec$)   '@2572e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @25747 libera strings locais (L_BPe8)
    ' @25751 libera strings locais (L_BPec)
    GOTO L_258c9   '@2575b
L_25763:
    RT_GCAIXA RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) - 5.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!) - 10.0), RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) + V_2582! + 5.0), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!)), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@25763 DS:4268,4316,431a,431e
    L_BPf0! = (FX##(L_BP28!) - V_2592!) * V_258a! - 4.0 + V_2582!   '@2582f DS:4322
    L_BPf4! = 165.0 - (FX##(L_BP2c!) - V_2596!) * V_258e! + 2.0   '@25854 DS:425c,4268
    L_BPf8$ = CHR$(25)   '@25875
    L_BPfc$ = "CGA"   '@25889 DS:42fe
    CALL MIXT_08c4_TextoGrafico(L_BPf0!, L_BPf4!, L_BPf8$, L_BPfc$)   '@25897
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @258b0 libera strings locais (L_BPf8)
    ' @258ba libera strings locais (L_BPfc)
L_258c9:
    LOCATE 25, 27   '@258c9
    IF NOT (V_11ec! < 0.0) THEN GOTO L_2595d   '@258e7 DS:4258
    V_0e10$ = A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1608!(RT_CINT%(FX##(V_11dc!)), 4))))))   '@25902
    GOTO L_259b5   '@25955
L_2595d:
    V_0e10$ = A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11dc!)), 4))))))   '@2595d
L_259b5:
    IF NOT (V_0e18$ = "*") THEN GOTO L_259e8   '@259b5 DS:430a
    V_0e10$ = V_0e10$ + "-a"   '@259cc DS:4326
L_259e8:
    IF NOT (V_0e18$ = "**") THEN GOTO L_25a1b   '@259e8 DS:4310
    V_0e10$ = V_0e10$ + "-b"   '@259ff DS:432c
L_25a1b:
    PRINT USING "\         \"; V_0e10$;   '@25a1b DS:4332
    CALL MIXT_07f1_LimpaTeclado   '@25a37
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@25a41
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_11e4! = 0.0) THEN GOTO L_25afb   '@25a5d DS:4258
    RT_GPONTO RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) - 10.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!) - 5.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@25a78 DS:4268,4316,431a
    GOTO L_25b7b   '@25af3
L_25afb:
    RT_GPONTO RT_SNG!(INT((FX##(L_BP28!) - V_2592!) * V_258a!) - 5.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BP2c!) - V_2596!) * V_258e!) - 10.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@25afb DS:4268,4316,431a
L_25b7b:
    L_BP100$ = V_0e0c$   '@25b7b
    IF NOT (L_BP100$ <> "S") THEN GOTO L_25bb9   '@25b8e DS:42c6
    IF NOT (L_BP100$ = "s") THEN GOTO L_26024   '@25ba6 DS:42cc
L_25bb9:
    V_11d4! = INT(FX##(L_BP28!) * 100.0) / 100.0   '@25bb9 DS:42ea
    V_11d8! = INT(FX##(L_BP2c!) * 100.0) / 100.0   '@25bda DS:42ea
    IF NOT (V_0e18$ <> "") THEN GOTO L_25c1a   '@25bfb DS:4306
    GOTO L_2617d   '@25c12
L_25c1a:
    L_BP104! = 0.0   '@25c1a DS:4258
    CALL S_3e559(V_11dc!, L_BP104!, L_BP108!)   '@25c2b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP10c! = 2.0   '@25c3f DS:425c
    CALL S_3e559(V_11dc!, L_BP10c!, L_BP110!)   '@25c4a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP112% = (V_11e4! = 0.0)   '@25c5e DS:4258
    IF NOT (((A_1664!(RT_CINT%(FX##(V_11dc!)), 0) <> A_1664!(RT_CINT%(FX##(V_11dc!)), 2) AND V_11ec! > 0.0 OR L_BP108! <> L_BP110! AND V_11ec! < 0.0) AND L_BP112%) <> 0) THEN GOTO L_25e10   '@25cd7
    V_0e18$ = "*"   '@25d1d DS:430a
    IF NOT (V_11ec! < 0.0) THEN GOTO L_25db0   '@25d2f DS:4258
    L_BP116! = 0.0   '@25d4a DS:4258
    CALL S_3e559(V_11dc!, L_BP116!, L_BP11a!)   '@25d5b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = L_BP11a!   '@25d6f
    L_BP11e! = 1.0   '@25d79 DS:4250
    CALL S_3e559(V_11dc!, L_BP11e!, L_BP122!)   '@25d8a
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = L_BP122!   '@25d9e
    GOTO L_25e08   '@25da8
L_25db0:
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11dc!)), 0)   '@25db0
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11dc!)), 1)   '@25dd9
L_25e08:
    GOTO L_2601c   '@25e08
L_25e10:
    L_BP126! = 1.0   '@25e10 DS:4250
    CALL S_3e559(V_11dc!, L_BP126!, L_BP12a!)   '@25e21
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP12e! = 3.0   '@25e35 DS:426c
    CALL S_3e559(V_11dc!, L_BP12e!, L_BP132!)   '@25e40
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP134% = (V_11e4! = 1.0)   '@25e54 DS:4250,4258
    IF NOT (((A_1664!(RT_CINT%(FX##(V_11dc!)), 1) <> A_1664!(RT_CINT%(FX##(V_11dc!)), 3) AND V_11ec! > 0.0 OR L_BP12a! <> L_BP132! AND V_11ec! < 0.0) AND L_BP134%) <> 0) THEN GOTO L_2600a   '@25ed0
    V_0e18$ = "*"   '@25f17 DS:430a
    IF NOT (V_11ec! < 0.0) THEN GOTO L_25faa   '@25f29 DS:4258
    L_BP138! = 0.0   '@25f44 DS:4258
    CALL S_3e559(V_11dc!, L_BP138!, L_BP13c!)   '@25f55
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP28! = L_BP13c!   '@25f69
    L_BP140! = 1.0   '@25f73 DS:4250
    CALL S_3e559(V_11dc!, L_BP140!, L_BP144!)   '@25f84
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP2c! = L_BP144!   '@25f98
    GOTO L_26002   '@25fa2
L_25faa:
    L_BP28! = A_1664!(RT_CINT%(FX##(V_11dc!)), 0)   '@25faa
    L_BP2c! = A_1664!(RT_CINT%(FX##(V_11dc!)), 1)   '@25fd3
L_26002:
    GOTO L_26017   '@26002
L_2600a:
    GOTO L_2617d   '@2600a
L_26017:
L_2601c:
    GOTO L_26100   '@2601c
L_26024:
    IF NOT (L_BP100$ <> "C") THEN GOTO L_2604a   '@26024 DS:42d2
    IF NOT (L_BP100$ = "c") THEN GOTO L_2606b   '@26037 DS:42d8
L_2604a:
    V_11dc! = -1.0   '@2604a DS:4298
    GOTO L_2617d   '@2605b
L_2606b:
    IF NOT (L_BP100$ <> "A") THEN GOTO L_26091   '@2606b DS:42de
    IF NOT (L_BP100$ = "a") THEN GOTO L_26100   '@2607e DS:42e4
L_26091:
    V_0e18$ = ""   '@26091 DS:4306
    L_BP9c! = FX##(L_BP9c!) - 2.0   '@260a3 DS:4254
    IF NOT (L_BP9c! = -1.0) THEN GOTO L_260f8   '@260b9 DS:4298
    L_BP9c! = L_BP46%(0) - 1   '@260d4
L_260f8:
    GOTO L_26100   '@260f8
L_26100:
    IF NOT (V_0e18$ = "") THEN GOTO L_26170   '@26100 DS:4306
    L_BP9c! = FX##(L_BP9c!) + 1.0   '@26117 DS:4250
    IF NOT (L_BP46%(0) < L_BP9c!) THEN GOTO L_2616b   '@2612d
    L_BP9c! = 1.0   '@2615a DS:4250
L_2616b:
L_26170:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_251e2   '@26170
L_2617d:
    ' @2617d libera strings locais (L_BP100)
    ERASE L_BP46%   '@26187
    ERASE L_BP1c%   '@26190
    ' END SUB   '@26199
END SUB

SUB S_261a9   ' entrada de SUB/FUNCTION (B$ENRA, locais 244 bytes) (0x261a9)
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
    DIM L_BP94$
    DIM L_BP98$
    DIM L_BP9c$
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
    DIM L_BPde%
    DIM L_BPe2!
    DIM L_BPe6!
    DIM L_BPea!
    DIM L_BPee!
    DIM L_BPf2!
    DIM L_BPf6!
    DIM L_BPfa$
    DIM L_BPfe$
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP2e%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP40%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP52%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP64%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_61a9 @0x261a9  (0261a9_FUN_2000_61a9.lift.txt; evidence_id (assembly): ev_7b864dcdbc0c6ce9c2aa17acca42b840ce0b7e6cf5b91c78448280b6d78e2ab8)
    REDIM L_BP1c%(0 TO 162)   '@261b1
    REDIM L_BP2e%(0 TO 162)   '@261ce
    REDIM L_BP40%(0 TO 704)   '@261e6
    REDIM L_BP52%(0 TO 704)   '@261fe
    REDIM L_BP64%(0 TO 480)   '@26216
    V_11c8! = 0.0   '@26238 DS:4258
    L_BP78! = 100.0   '@26249 DS:42ea
    L_BP68! = INT((FX##(V_259a!) + V_2592!) / 2.0)   '@26259 DS:425c
    L_BP6c! = INT((FX##(V_259e!) + V_2596!) / 2.0)   '@2627a DS:425c
    L_BP70! = L_BP68!   '@2629b
    L_BP74! = L_BP6c!   '@262aa
    RT_GCAIXA RT_SNG!((FX##(L_BP68!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(169.0 - FX##(V_2586!) - (FX##(L_BP6c!) - V_2596!) * V_258e!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@262b9 DS:4342
    L_BP8c! = (FX##(L_BP68!) - V_2592!) * V_258a! + V_2582!   '@2632a
    L_BP90! = 169.0 - FX##(V_2586!) - (FX##(L_BP6c!) - V_2596!) * V_258e!   '@2634a DS:4342
    L_BP94$ = CHR$(27)   '@2636b
    L_BP98$ = "CGA"   '@2637f DS:42fe
    CALL MIXT_08c4_TextoGrafico(L_BP8c!, L_BP90!, L_BP94$, L_BP98$)   '@2638d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @263a6 libera strings locais (L_BP94)
    ' @263b0 libera strings locais (L_BP98)
L_263bf:
    RT_VIEWPRINT 23, 25   '@263c4
    RT_CLS 2   '@263d6
    RT_VIEWPRINT 1, 25   '@263e4
    LOCATE 24, 1   '@263f6
    IF NOT (V_11c8! = 0.0) THEN GOTO L_26442   '@26411 DS:4258
    PRINT " Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso"   '@2642c DS:4346
    GOTO L_26455   '@2643a
L_26442:
    PRINT " Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso"   '@26442 DS:4398
L_26455:
L_2645a:
    V_0e0c$ = ""   '@2645f DS:4306
L_26476:
    V_0e0c$ = RT_INKEY$   '@26476
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_26476   '@2648a DS:4306
    L_BP9c$ = V_0e0c$   '@2649e
    IF NOT (L_BP9c$ <> "R") THEN GOTO L_264dc   '@264b1 DS:43ea
    IF NOT (L_BP9c$ = "r") THEN GOTO L_26754   '@264c9 DS:43f0
L_264dc:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_266ca   '@264dc DS:4250
    CALL MIXT_0877_Menor(L_BP7c!, L_BP84!, L_BPa0!)   '@264f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPa0!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@26510 DS:4268
    CALL MIXT_0877_Menor(L_BP7c!, L_BP84!, L_BPa4!)   '@2656b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPa4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@26584 DS:4268
    CALL MIXT_082a_Maior(L_BP80!, L_BP88!, L_BPa8!)   '@265de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BPa8!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@265f7 DS:4268
    CALL MIXT_082a_Maior(L_BP80!, L_BP88!, L_BPac!)   '@26651
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BPac!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@2666a DS:4268
L_266ca:
    RT_GPONTO RT_SNG!((FX##(L_BP68!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(161.0 - FX##(V_2586!) - (FX##(L_BP6c!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@266ca DS:43f6
    V_0e0c$ = "FIM"   '@26732 DS:43fa
    GOTO L_2760b   '@26744
L_26754:
    IF NOT (L_BP9c$ <> "4") THEN GOTO L_2678f   '@26754 DS:4402
    IF NOT (CHR$(0) + CHR$(75) = L_BP9c$) THEN GOTO L_267c9   '@26767
L_2678f:
    L_BPb0! = FX##(L_BP68!) - L_BP78!   '@2678f
    CALL MIXT_082a_Maior(V_2592!, L_BPb0!, L_BPb4!)   '@267a3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP70! = L_BPb4!   '@267b7
    GOTO L_26eaf   '@267c1
L_267c9:
    IF NOT (L_BP9c$ <> "6") THEN GOTO L_26804   '@267c9 DS:4408
    IF NOT (CHR$(0) + CHR$(77) = L_BP9c$) THEN GOTO L_2683e   '@267dc
L_26804:
    L_BPb8! = FX##(L_BP68!) + L_BP78!   '@26804
    CALL MIXT_0877_Menor(V_259a!, L_BPb8!, L_BPbc!)   '@26818
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP70! = L_BPbc!   '@2682c
    GOTO L_26eaf   '@26836
L_2683e:
    IF NOT (L_BP9c$ <> "8") THEN GOTO L_26879   '@2683e DS:440e
    IF NOT (CHR$(0) + CHR$(72) = L_BP9c$) THEN GOTO L_268b3   '@26851
L_26879:
    L_BPc0! = FX##(L_BP6c!) + L_BP78!   '@26879
    CALL MIXT_0877_Menor(V_259e!, L_BPc0!, L_BPc4!)   '@2688d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPc4!   '@268a1
    GOTO L_26eaf   '@268ab
L_268b3:
    IF NOT (L_BP9c$ <> "2") THEN GOTO L_268ee   '@268b3 DS:4414
    IF NOT (CHR$(0) + CHR$(80) = L_BP9c$) THEN GOTO L_26928   '@268c6
L_268ee:
    L_BPc8! = FX##(L_BP6c!) - L_BP78!   '@268ee
    CALL MIXT_082a_Maior(V_2596!, L_BPc8!, L_BPcc!)   '@26902
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP74! = L_BPcc!   '@26916
    GOTO L_26eaf   '@26920
L_26928:
    IF NOT (CHR$(13) = L_BP9c$) THEN GOTO L_26d4a   '@26928
    IF NOT (V_11c8! = 0.0) THEN GOTO L_26c4b   '@26941 DS:4258
    L_BP7c! = L_BP70!   '@2695c
    L_BP80! = L_BP74!   '@2696b
    L_BP84! = L_BP70!   '@2697a
    L_BP88! = L_BP74!   '@2698a
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@2699a DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@26a3f DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@26ae2 DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@26b85 DS:4268
    V_11c8! = 1.0   '@26c2a DS:4250
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_263bf   '@26c3b
L_26c4b:
    IF NOT (L_BP74! = L_BP80! OR L_BP70! = L_BP7c!) THEN GOTO L_26c97   '@26c4b
    BEEP   '@26c85
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_263bf   '@26c8f
L_26c97:
    CALL MIXT_0877_Menor(L_BP7c!, L_BP70!, L_BPd0!)   '@26c97
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_2592! = L_BPd0!   '@26caf
    CALL MIXT_0877_Menor(L_BP80!, L_BP74!, L_BPd4!)   '@26cba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_2596! = L_BPd4!   '@26cd2
    CALL MIXT_082a_Maior(L_BP7c!, L_BP70!, L_BPd8!)   '@26cdd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_259a! = L_BPd8!   '@26cf5
    CALL MIXT_082a_Maior(L_BP80!, L_BP74!, L_BPdc!)   '@26d00
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_259e! = L_BPdc!   '@26d18
    V_0e0c$ = ""   '@26d23 DS:4306
    GOTO L_2760b   '@26d35
L_26d4a:
    IF NOT (L_BP9c$ <> "P") THEN GOTO L_26d70   '@26d4a DS:441a
    IF NOT (L_BP9c$ = "p") THEN GOTO L_26ea2   '@26d5d DS:4420
L_26d70:
    RT_VIEWPRINT 23, 25   '@26d70
    RT_CLS 2   '@26d82
    PRINT ""   '@26d90 DS:4306
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP78!)); "* ";   '@26d9e DS:4426,443c
    CALL MIXT_07f1_LimpaTeclado   '@26dcc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@26dd6 DS:4306 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_26e92   '@26df0 DS:4442
    L_BPde% = (FX##(VAL(V_0e0c$)) < FX##(V_259e!) - V_2596!)   '@26e14
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_259a!) - V_2592! AND L_BPde%) <> 0) THEN GOTO L_26e8d   '@26e52
    L_BP78! = VAL(V_0e0c$)   '@26e74
L_26e8d:
L_26e92:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_263bf   '@26e92
L_26ea2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2645a   '@26ea2
L_26eaf:
    IF NOT (V_11c8! = 1.0) THEN GOTO L_270bd   '@26eaf DS:4250
    CALL MIXT_0877_Menor(L_BP7c!, L_BP84!, L_BPe2!)   '@26eca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe2!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP1c%, PSET: RT_GFIM   '@26ee3 DS:4268
    CALL MIXT_0877_Menor(L_BP7c!, L_BP84!, L_BPe6!)   '@26f3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BPe6!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP2e%, PSET: RT_GFIM   '@26f57 DS:4268
    CALL MIXT_082a_Maior(L_BP80!, L_BP88!, L_BPea!)   '@26fb1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BPea!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP40%, PSET: RT_GFIM   '@26fca DS:4268
    CALL MIXT_082a_Maior(L_BP80!, L_BP88!, L_BPee!)   '@27024
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BPee!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP52%, PSET: RT_GFIM   '@2703d DS:4268
    L_BP84! = L_BP70!   '@27098
    L_BP88! = L_BP74!   '@270a8
L_270bd:
    GOSUB L_2748e   '@270bd
    L_BP68! = L_BP70!   '@270ca
    L_BP6c! = L_BP74!   '@270d9
    IF NOT (V_11c8! = 1.0) THEN GOTO L_27481   '@270e8 DS:4250
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%: RT_GFIM   '@27103 DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP2e%: RT_GFIM   '@271a8 DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP40%: RT_GFIM   '@2724b DS:4268
    RT_GCAIXA RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP52%: RT_GFIM   '@272ee DS:4268
    RT_PSET RT_SNG!((FX##(L_BP7c!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP80!) - V_2596!) * V_258e!), 0, 0   '@27393 DS:4268
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP84!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - FX##(V_2586!) - (FX##(L_BP88!) - V_2596!) * V_258e!), 88, ((V_257e! = 1.0) * -13 + (V_257e! = 0.0) * -7), 4369   '@273e4 DS:4250,4258,4268
L_27481:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2645a   '@27481
    ' ---- F_27489 @0x27489  (027489_F_27489.lift.txt; evidence_id (assembly): ev_0c199a361e93c6a5b4ff792ea6a7c258e4bb812b10eb1ccb82bd48081128b739)
L_2748e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0261a9_FUN_2000_61a9
    RT_GPONTO RT_SNG!((FX##(L_BP68!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(161.0 - FX##(V_2586!) - (FX##(L_BP6c!) - V_2596!) * V_258e!), 0: PUT (RG_GX1, RG_GY1), L_BP64%(1), PSET: RT_GFIM   '@27493 DS:43f6
    RT_GCAIXA RT_SNG!((FX##(L_BP70!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(169.0 - FX##(V_2586!) - (FX##(L_BP74!) - V_2596!) * V_258e!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP64%(1): RT_GFIM   '@274fb DS:4342
    L_BPf2! = (FX##(L_BP70!) - V_2592!) * V_258a! + V_2582!   '@2756c
    L_BPf6! = 169.0 - FX##(V_2586!) - (FX##(L_BP74!) - V_2596!) * V_258e!   '@2758c DS:4342
    L_BPfa$ = CHR$(27)   '@275ad
    L_BPfe$ = "CGA"   '@275c1 DS:42fe
    CALL MIXT_08c4_TextoGrafico(L_BPf2!, L_BPf6!, L_BPfa$, L_BPfe$)   '@275cf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @275e8 libera strings locais (L_BPfa)
    ' @275f2 libera strings locais (L_BPfe)
    RETURN   '@275fc
L_2760b:   ' entrada vinda de 0261a9_FUN_2000_61a9
    ' @2760b libera strings locais (L_BP9c)
    ERASE L_BP64%   '@27615
    ERASE L_BP52%   '@2761e
    ERASE L_BP40%   '@27627
    ERASE L_BP2e%   '@27630
    ERASE L_BP1c%   '@27639
    ' END SUB   '@27642
END SUB

SUB S_3018c   ' entrada de SUB/FUNCTION (B$ENRA, locais 148 bytes) (0x3018c)
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
    DIM L_BP40%
    DIM L_BP42%
    DIM L_BP44%
    DIM L_BP46%
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
    DIM L_BP8c%
    DIM L_BP8e%
    DIM L_BP90%
    DIM L_BP92%
    DIM L_BP96!
    DIM L_BP9a!
    DIM L_BP9e!
    ' ---- FUN_3000_018c @0x3018c  (03018c_FUN_3000_018c.lift.txt; evidence_id (assembly): ev_539427e0828ef7a803f7ce814fd20a95fbe3db1bb17dde03c644683299cff3b0)
    REDIM A_125c!(0 TO 13, 0 TO 1)   '@30199
    REDIM A_12e6!(0 TO 13)   '@301bd
    REDIM A_1314!(0 TO 13)   '@301d5
    REDIM A_1370%(0 TO 13, 0 TO 3)   '@301ed
    REDIM A_12b8!(0 TO 13, 0 TO 2)   '@3020c
    REDIM A_128a$(0 TO 13)   '@3022b
    L_BP26! = A_1200!(0, 0, 0)   '@30248
    FOR V_11e4! = 1.0 TO L_BP26!   '@30269 DS:4450
    REDIM A_125c!(-32768 TO -32768, -32768 TO -32768)   '@30270
    REDIM A_12e6!(-32768 TO -32768)   '@3027e
    REDIM A_1314!(-32768 TO -32768)   '@30287
    REDIM A_1370%(-32768 TO -32768, -32768 TO -32768)   '@30290
    REDIM A_12b8!(-32768 TO -32768, -32768 TO -32768)   '@30299
    REDIM A_128a$(-32768 TO -32768)   '@302a2
    REDIM A_125c!(0 TO 13, 0 TO 1)   '@302ab
    REDIM A_12e6!(0 TO 13)   '@302cf
    REDIM A_1314!(0 TO 13)   '@302e7
    REDIM A_1370%(0 TO 13, 0 TO 3)   '@302ff
    REDIM A_12b8!(0 TO 13, 0 TO 2)   '@3031e
    REDIM A_128a$(0 TO 13)   '@3033d
    L_BP2a! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@30355
    FOR V_11cc! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP2a!   '@303a6 DS:4450
    L_BP2e! = -1000.0   '@303d0 DS:4454
    L_BP32! = -1000.0   '@303e0 DS:4454
    IF NOT (V_11cc! = 0.0) THEN GOTO L_307f8   '@303f0 DS:4458
    V_11ec! = 0.0   '@3040b DS:4458
    V_11c4! = 1.0   '@3041c DS:4450
L_30432:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@30432 DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_30782   '@3044c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_30624   '@30480
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@304cb
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@304f5
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) < V_11d4!) THEN GOTO L_305aa   '@30520
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@30552
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@3057a
L_305aa:
    IF NOT (V_11d4! < L_BP2e! OR L_BP2e! = -1000.0) THEN GOTO L_3061c   '@305aa DS:4454
    L_BP2e! = V_11d4!   '@305e6
    L_BP32! = V_11d8!   '@305f6
    V_11ec! = V_11c4!   '@30606
L_3061c:
    GOTO L_3077d   '@3061c
L_30624:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@30624
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@3064e
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) < V_11d8!) THEN GOTO L_30706   '@30679
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@306ae
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@306d6
L_30706:
    IF NOT (V_11d8! < L_BP32! OR L_BP32! = -1000.0) THEN GOTO L_30778   '@30706 DS:4454
    L_BP2e! = V_11d4!   '@30742
    L_BP32! = V_11d8!   '@30752
    V_11ec! = V_11c4!   '@30762
L_30778:
L_3077d:
L_30782:
    V_11c4! = FX##(V_11c4!) + 1.0   '@30782 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_30432   '@30798
    L_BP1a! = L_BP2e!   '@307c2
    L_BP1e! = L_BP32!   '@307d1
    L_BP22! = V_11ec!   '@307e0
    GOTO L_33761   '@307f0
L_307f8:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!) - 1.0), 4))) = 471) THEN GOTO L_314c4   '@307f8 DS:4460
    V_11ec! = 0.0   '@30839 DS:4458
    L_BP3a! = 1.0   '@3084a DS:4450
L_30860:
    L_BP2e! = -1000.0   '@30860 DS:4454
    L_BP32! = -1000.0   '@30870 DS:4454
    V_11c4! = 1.0   '@30880 DS:4450
L_30896:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@30896 DS:445c
    IF NOT ((V_11c4! <> L_BP3e! AND L_BP3a! = 2.0 OR L_BP3a! = 1.0) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_3104c   '@308b0 DS:4450,4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_30ce6   '@3093a
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@30985
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@309af
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) < V_11d4!) THEN GOTO L_30a64   '@309da
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@30a0c
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@30a34
L_30a64:
    IF NOT (V_11d4! < L_BP2e! OR L_BP2e! = -1000.0) THEN GOTO L_30cde   '@30a64 DS:4454
    V_11c8! = 1.0   '@30aa0 DS:4450
L_30ab6:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_30c27   '@30ab6
    L_BP40% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@30b13 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP40%) <> 0) THEN GOTO L_30c22   '@30bc3 DS:4464
    GOTO L_30c68   '@30c15
L_30c22:
L_30c27:
    V_11c8! = FX##(V_11c8!) + 1.0   '@30c27 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_30ab6   '@30c3d
L_30c68:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_30cd9   '@30c68
    L_BP2e! = V_11d4!   '@30c92
    L_BP32! = V_11d8!   '@30ca2
    V_11ec! = V_11c4!   '@30cb2
    V_11bc! = V_11c8!   '@30cc3
L_30cd9:
L_30cde:
    GOTO L_31047   '@30cde
L_30ce6:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@30ce6
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@30d10
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) < V_11d8!) THEN GOTO L_30dc8   '@30d3b
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@30d70
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@30d98
L_30dc8:
    IF NOT (V_11d8! < L_BP32! OR L_BP32! = -1000.0) THEN GOTO L_31042   '@30dc8 DS:4454
    V_11c8! = 1.0   '@30e04 DS:4450
L_30e1a:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_30f8b   '@30e1a
    L_BP42% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@30e77 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP42%) <> 0) THEN GOTO L_30f86   '@30f27 DS:4464
    GOTO L_30fcc   '@30f79
L_30f86:
L_30f8b:
    V_11c8! = FX##(V_11c8!) + 1.0   '@30f8b DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_30e1a   '@30fa1
L_30fcc:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_3103d   '@30fcc
    L_BP2e! = V_11d4!   '@30ff6
    L_BP32! = V_11d8!   '@31006
    V_11ec! = V_11c4!   '@31016
    V_11bc! = V_11c8!   '@31027
L_3103d:
L_31042:
L_31047:
L_3104c:
    V_11c4! = FX##(V_11c4!) + 1.0   '@3104c DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_30896   '@31062
    IF NOT (L_BP32! <> -1000.0 AND (L_BP2e! <> -1000.0 AND L_BP3a! = 2.0) OR L_BP3a! = 1.0) THEN GOTO L_3112f   '@3108c DS:4450,4454,4464
    L_BP1a! = L_BP2e!   '@310fc
    L_BP1e! = L_BP32!   '@3110b
    L_BP22! = V_11ec!   '@3111a
L_3112f:
    L_BP3e! = V_11ec!   '@3112f
    L_BP3a! = FX##(L_BP3a!) + 1.0   '@3113f DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP3a! > 2.0) THEN GOTO L_30860   '@31153 DS:4464
    IF NOT (A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1) = 0.0 AND V_11cc! = 1.0) THEN GOTO L_314bc   '@3116d DS:4450,4458
    A_128a$(0) = "V" + A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))))   '@311cb DS:446c
    A_125c!(0, 0) = A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 0)   '@31234 DS:445c
    A_12b8!(0, 0) = A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 1)   '@312f0 DS:445c
    A_12b8!(0, 1) = FX##(A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 2)) - A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2)   '@313ad DS:445c
    A_12b8!(0, 2) = 0.0   '@31497 DS:4458
L_314bc:
    GOTO L_3375c   '@314bc
L_314c4:
    V_11ec! = 0.0   '@314c4 DS:4458
    V_11c4! = 1.0   '@314d5 DS:4450
L_314ec:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@314ec DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_31c4c   '@31506
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_318e6   '@3153a
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@31585
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@315af
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) < V_11d4!) THEN GOTO L_31664   '@315da
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@3160c
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@31634
L_31664:
    IF NOT (V_11d4! < L_BP2e! OR L_BP2e! = -1000.0) THEN GOTO L_318de   '@31664 DS:4454
    V_11c8! = 1.0   '@316a0 DS:4450
L_316b6:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_31827   '@316b6
    L_BP44% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@31713 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP44%) <> 0) THEN GOTO L_31822   '@317c3 DS:4464
    GOTO L_31868   '@31815
L_31822:
L_31827:
    V_11c8! = FX##(V_11c8!) + 1.0   '@31827 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_316b6   '@3183d
L_31868:
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_318d9   '@31868
    L_BP2e! = V_11d4!   '@31892
    L_BP32! = V_11d8!   '@318a2
    V_11ec! = V_11c4!   '@318b2
    V_11bc! = V_11c8!   '@318c3
L_318d9:
L_318de:
    GOTO L_31c47   '@318de
L_318e6:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@318e6
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@31910
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) < V_11d8!) THEN GOTO L_319c8   '@3193b
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@31970
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@31998
L_319c8:
    IF NOT (V_11d8! < L_BP32! OR L_BP32! = -1000.0) THEN GOTO L_31c42   '@319c8 DS:4454
    V_11c8! = 1.0   '@31a04 DS:4450
L_31a1a:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_31b8b   '@31a1a
    L_BP46% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@31a77 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP46%) <> 0) THEN GOTO L_31b86   '@31b27 DS:4464
    GOTO L_31bcc   '@31b79
L_31b86:
L_31b8b:
    V_11c8! = FX##(V_11c8!) + 1.0   '@31b8b DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_31a1a   '@31ba1
L_31bcc:
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_31c3d   '@31bcc
    L_BP2e! = V_11d4!   '@31bf6
    L_BP32! = V_11d8!   '@31c06
    V_11ec! = V_11c4!   '@31c16
    V_11bc! = V_11c8!   '@31c27
L_31c3d:
L_31c42:
L_31c47:
L_31c4c:
    V_11c4! = FX##(V_11c4!) + 1.0   '@31c4c DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_314ec   '@31c62
    L_BP1a! = L_BP2e!   '@31c8c
    L_BP1e! = L_BP32!   '@31c9b
    L_BP22! = V_11ec!   '@31caa
    IF NOT (A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1) = 0.0 AND V_11cc! = 1.0) THEN GOTO L_31f48   '@31cba DS:4450,4458
    A_128a$(0) = "P"   '@31d18 DS:4472
    V_11c4! = 1.0   '@31d36 DS:4450
    L_BP36! = 0.0   '@31d47 DS:4458
L_31d5c:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!) - 1.0), 4))) = VAL(A_0fba$(RT_CINT%(FX##(V_11c4!))))) THEN GOTO L_31e2d   '@31d5c DS:4460
    A_128a$(0) = A_128a$(0) + A_143a$(A_15ac%(RT_CINT%(FX##(V_11c4!) - L_BP36!)))   '@31dc8
    GOTO L_31ec6   '@31e20
L_31e2d:
    V_11c4! = FX##(V_11c4!) + 1.0   '@31e2d DS:4450
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11c4!) - 1.0)) = A_0fba$(RT_CINT%(FX##(V_11c4!)))) THEN GOTO L_31e9b   '@31e43 DS:4460
    L_BP36! = FX##(L_BP36!) + 1.0   '@31e87 DS:4450
L_31e9b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0fe8!(0, 0) < V_11c4!) THEN GOTO L_31d5c   '@31e9b
L_31ec6:
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 0) = 0.0   '@31ec6 DS:4458
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 1) = 0.0   '@31ef0 DS:4458
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 2) = 0.0   '@31f1b DS:4458
L_31f48:
    IF NOT (L_BP1e! = -1000.0 AND L_BP1a! = -1000.0 OR A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1) = 0.0 AND V_11cc! = 1.0) THEN GOTO L_33757   '@31f48 DS:4450,4454,4458
    V_11c4! = 1.0   '@31fda DS:4450
    IF NOT (L_BP1a! <> -1000.0) THEN GOTO L_32015   '@31feb DS:4454
    V_11c4! = L_BP22!   '@32005
L_32015:
L_3201a:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@3201a DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_32cbd   '@32034
    V_11c8! = FX##(V_11c4!) + 1.0   '@32068 DS:4450
L_32084:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c8!)), 4) = L_BP36!) THEN GOTO L_32c2c   '@32084
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_322e6   '@320b8
    IF NOT (ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_322de   '@32103
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) / 2.0   '@3217c DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0   '@321c8 DS:4464
    IF NOT ((FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) / 2.0 > FX##(L_BP4e!)) THEN GOTO L_322bc   '@32216 DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) / 2.0   '@3226e DS:4464
L_322bc:
    L_BP0e! = FX##(V_0e04#) / 2.0#   '@322bc DS:4478
    GOTO L_32c86   '@322d1
L_322de:
    GOTO L_32c27   '@322de
L_322e6:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) THEN GOTO L_3250b   '@322e6
    IF NOT (ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_32503   '@32335
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) / 2.0   '@323b0 DS:4464
    IF NOT ((FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) / 2.0 > FX##(L_BP4a!)) THEN GOTO L_32498   '@323fa DS:4464
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) / 2.0   '@3244e DS:4464
L_32498:
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) / 2.0   '@32498 DS:4464
    L_BP0e! = 0.0   '@324e6 DS:4458
    GOTO L_32c86   '@324f6
L_32503:
    GOTO L_32c22   '@32503
L_3250b:
    L_BP0e! = ATN(ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@3250b
    L_BP2e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) / 2.0   '@3259e DS:4464
    L_BP52! = ((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0 - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) * (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 0)   '@325e8 DS:4464
    IF NOT (ABS(FX##(L_BP2e!) - L_BP52!) * RT_SIN##(FX##(L_BP0e!)) + 0.100000001490116119384765625## >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_32c1d   '@326f1 DS:4468
    L_BP4a! = (FX##(L_BP2e!) + L_BP52!) / 2.0   '@32749 DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0   '@32761 DS:4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) < A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) < A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_328e8   '@327af
    L_BP0e! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@32853
    GOTO L_32c10   '@328e0
L_328e8:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) < A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) > A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_32a29   '@328e8
    L_BP0e! = V_0e04# - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 2)))   '@3298c
    GOTO L_32c0b   '@32a21
L_32a29:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) > A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) > A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_32b67   '@32a29
    L_BP0e! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 2))) + V_0e04#   '@32acd
    GOTO L_32c06   '@32b5f
L_32b67:
    L_BP0e! = 2.0# * FX##(V_0e04#) - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@32b67 DS:4478
L_32c06:
L_32c0b:
L_32c10:
    GOTO L_32c86   '@32c10
L_32c1d:
L_32c22:
L_32c27:
L_32c2c:
    V_11c8! = FX##(V_11c8!) + 1.0   '@32c2c DS:4450
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_32c7d   '@32c42
    V_11c8! = 1.0   '@32c6c DS:4450
L_32c7d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_32084   '@32c7d
L_32c86:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_32cb8   '@32c86
    GOTO L_32cfe   '@32cb0
L_32cb8:
L_32cbd:
    V_11c4! = FX##(V_11c4!) + 1.0   '@32cbd DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_3201a   '@32cd3
L_32cfe:
    L_BP2e! = L_BP4a! - RT_COS##(FX##(L_BP0e!)) * 1000.0   '@32cfe DS:4480
    L_BP32! = L_BP4e! - RT_SIN##(FX##(L_BP0e!)) * 1000.0   '@32d20 DS:4480
    L_BP52! = RT_COS##(FX##(L_BP0e!)) * 1000.0 + L_BP4a!   '@32d42 DS:4480
    L_BP56! = RT_SIN##(FX##(L_BP0e!)) * 1000.0 + L_BP4e!   '@32d61 DS:4480
    V_11ec! = 1.0   '@32d80 DS:4450
    L_BP36! = 0.0   '@32d91 DS:4458
L_32da6:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!) - 1.0), 4))) = VAL(A_0fba$(RT_CINT%(FX##(V_11ec!))))) THEN GOTO L_32e1f   '@32da6 DS:4460
    GOTO L_32eb8   '@32e12
L_32e1f:
    V_11ec! = FX##(V_11ec!) + 1.0   '@32e1f DS:4450
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11ec!) - 1.0)) = A_0fba$(RT_CINT%(FX##(V_11ec!)))) THEN GOTO L_32e8d   '@32e35 DS:4460
    L_BP36! = FX##(L_BP36!) + 1.0   '@32e79 DS:4450
L_32e8d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0fe8!(0, 0) < V_11ec!) THEN GOTO L_32da6   '@32e8d
L_32eb8:
    V_11ec! = -(FX##(V_11ec!) - L_BP36!)   '@32eb8
    CALL S_22ee1   '@32ed0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP5a! = V_11d4!   '@32eda
    L_BP5e! = V_11d8!   '@32eea
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 6) = 2) THEN GOTO L_331f9   '@32efa
    L_BP12! = A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_COS##(FX##(L_BP0e!)) / 2.0 + L_BP5a!   '@32f3b DS:4464
    L_BP16! = A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_SIN##(FX##(L_BP0e!)) / 2.0 + L_BP5e!   '@32f93 DS:4464
    L_BP62! = L_BP5a! - A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_COS##(FX##(L_BP0e!)) / 2.0   '@32feb DS:4464
    L_BP66! = L_BP5e! - A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_SIN##(FX##(L_BP0e!)) / 2.0   '@33046 DS:4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_33170   '@330a1
    IF NOT (L_BP12! <= L_BP4a!) THEN GOTO L_33168   '@330ec
    IF NOT (L_BP12! > L_BP1a! OR L_BP1a! = -1000.0) THEN GOTO L_33163   '@33105 DS:4454
    L_BP1a! = L_BP12!   '@33140
    L_BP1e! = L_BP16!   '@3314f
L_33163:
L_33168:
    GOTO L_331f1   '@33168
L_33170:
    IF NOT (L_BP16! <= L_BP4e!) THEN GOTO L_331ec   '@33170
    IF NOT (L_BP16! > L_BP1e! OR L_BP1e! = -1000.0) THEN GOTO L_331e7   '@33189 DS:4454
    L_BP1a! = L_BP12!   '@331c4
    L_BP1e! = L_BP16!   '@331d3
L_331e7:
L_331ec:
L_331f1:
    GOTO L_33692   '@331f1
L_331f9:
    L_BP12! = -1000.0   '@331f9 DS:4454
    L_BP16! = -1000.0   '@33209 DS:4454
    L_BP62! = -1000.0   '@33219 DS:4454
    L_BP66! = -1000.0   '@33229 DS:4454
    V_11c8! = 1.0   '@33239 DS:4450
L_33250:
    L_BP6a! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!)), 0)) + L_BP5a!   '@33250
    L_BP6e! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!)), 1)) + L_BP5e!   '@3327d
    L_BP72! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!) + 1.0), 0)) + L_BP5a!   '@332ab DS:4450
    L_BP76! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!) + 1.0), 1)) + L_BP5e!   '@332dd DS:4450
    GOSUB L_37d45   '@33310
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_3364d   '@3331d DS:4484
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_334e5   '@33334
    IF NOT (L_BP7a! <= L_BP4a!) THEN GOTO L_334dd   '@3337f
    IF NOT (L_BP7a! > L_BP1a! OR L_BP1a! = -1000.0) THEN GOTO L_333f6   '@33398 DS:4454
    L_BP1a! = L_BP7a!   '@333d3
    L_BP1e! = L_BP7e!   '@333e2
L_333f6:
    IF NOT (L_BP7a! > L_BP12! OR L_BP12! = -1000.0) THEN GOTO L_33475   '@333f6 DS:4454
    L_BP62! = L_BP12!   '@33431
    L_BP66! = L_BP16!   '@33440
    L_BP12! = L_BP7a!   '@3344f
    L_BP16! = L_BP7e!   '@3345e
    GOTO L_334d8   '@3346d
L_33475:
    IF NOT (L_BP7a! > L_BP62! OR L_BP62! = -1000.0) THEN GOTO L_334d3   '@33475 DS:4454
    L_BP62! = L_BP7a!   '@334b0
    L_BP66! = L_BP7e!   '@334bf
L_334d3:
L_334d8:
L_334dd:
    GOTO L_33648   '@334dd
L_334e5:
    IF NOT (L_BP7e! <= L_BP4e!) THEN GOTO L_33643   '@334e5
    IF NOT (L_BP7e! > L_BP1e! OR L_BP1e! = -1000.0) THEN GOTO L_3355c   '@334fe DS:4454
    L_BP1a! = L_BP7a!   '@33539
    L_BP1e! = L_BP7e!   '@33548
L_3355c:
    IF NOT (L_BP7e! > L_BP16! OR L_BP16! = -1000.0) THEN GOTO L_335db   '@3355c DS:4454
    L_BP62! = L_BP12!   '@33597
    L_BP66! = L_BP16!   '@335a6
    L_BP12! = L_BP7a!   '@335b5
    L_BP16! = L_BP7e!   '@335c4
    GOTO L_3363e   '@335d3
L_335db:
    IF NOT (L_BP7e! > L_BP66! OR L_BP66! = -1000.0) THEN GOTO L_33639   '@335db DS:4454
    L_BP62! = L_BP7a!   '@33616
    L_BP66! = L_BP7e!   '@33625
L_33639:
L_3363e:
L_33643:
L_33648:
L_3364d:
    V_11c8! = FX##(V_11c8!) + 1.0   '@3364d DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_16ee!(0, 0) < V_11c8!) THEN GOTO L_33250   '@33663
L_33692:
    IF NOT (A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1) = 0.0 AND V_11cc! = 1.0) THEN GOTO L_33752   '@33692 DS:4450,4458
    A_125c!(0, 0) = FX##(RT_CINT%(RT_SQR##(RT_POT##((FX##(L_BP66!) - L_BP16!), (2.0)) + RT_POT##((FX##(L_BP62!) - L_BP12!), (2.0))) * 10.0)) / 10.0   '@336f0 DS:4464,448e
L_33752:
L_33757:
L_3375c:
L_33761:
    L_BP52! = -1000.0   '@33761 DS:4454
    L_BP56! = -1000.0   '@33771 DS:4454
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 = FX##(V_11cc!)) THEN GOTO L_33bb7   '@33781 DS:4450
    V_11ec! = 0.0   '@337be DS:4458
    V_11c4! = 1.0   '@337cf DS:4450
L_337e6:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@337e6 DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_33b36   '@33800
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_339d8   '@33834
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@3387f
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@338a9
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) > V_11d4!) THEN GOTO L_3395e   '@338d4
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@33906
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@3392e
L_3395e:
    IF NOT (V_11d4! > L_BP52! OR L_BP52! = -1000.0) THEN GOTO L_339d0   '@3395e DS:4454
    L_BP52! = V_11d4!   '@3399a
    L_BP56! = V_11d8!   '@339aa
    V_11ec! = V_11c4!   '@339ba
L_339d0:
    GOTO L_33b31   '@339d0
L_339d8:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@339d8
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@33a02
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) > V_11d8!) THEN GOTO L_33aba   '@33a2d
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@33a62
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@33a8a
L_33aba:
    IF NOT (V_11d8! > L_BP56! OR L_BP56! = -1000.0) THEN GOTO L_33b2c   '@33aba DS:4454
    L_BP52! = V_11d4!   '@33af6
    L_BP56! = V_11d8!   '@33b06
    V_11ec! = V_11c4!   '@33b16
L_33b2c:
L_33b31:
L_33b36:
    V_11c4! = FX##(V_11c4!) + 1.0   '@33b36 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_337e6   '@33b4c
    L_BP82! = L_BP52!   '@33b76
    L_BP86! = L_BP56!   '@33b86
    L_BP8a! = V_11ec!   '@33b96
    GOTO L_3538c   '@33ba7
L_33bb7:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 4))) = 471) THEN GOTO L_34890   '@33bb7
    V_11ec! = 0.0   '@33bf3 DS:4458
    L_BP3a! = 1.0   '@33c04 DS:4450
L_33c1a:
    L_BP52! = -1000.0   '@33c1a DS:4454
    L_BP56! = -1000.0   '@33c2a DS:4454
    V_11c4! = 1.0   '@33c3a DS:4450
L_33c50:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@33c50 DS:445c
    IF NOT ((V_11c4! <> L_BP3e! AND L_BP3a! = 2.0 OR L_BP3a! = 1.0) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_3440a   '@33c6a DS:4450,4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_340a2   '@33cf4
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@33d3f
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@33d69
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) > V_11d4!) THEN GOTO L_33e1e   '@33d94
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@33dc6
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@33dee
L_33e1e:
    IF NOT (V_11d4! > L_BP52! OR L_BP52! = -1000.0) THEN GOTO L_3409a   '@33e1e DS:4454
    V_11c8! = 1.0   '@33e5a DS:4450
L_33e70:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_33fe3   '@33e70
    L_BP8c% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@33ecd DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP8c%) <> 0) THEN GOTO L_33fde   '@33f7e DS:4464
    GOTO L_34024   '@33fd1
L_33fde:
L_33fe3:
    V_11c8! = FX##(V_11c8!) + 1.0   '@33fe3 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_33e70   '@33ff9
L_34024:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_34095   '@34024
    L_BP52! = V_11d4!   '@3404e
    L_BP56! = V_11d8!   '@3405e
    V_11ec! = V_11c4!   '@3406e
    V_11bc! = V_11c8!   '@3407f
L_34095:
L_3409a:
    GOTO L_34405   '@3409a
L_340a2:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@340a2
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@340cc
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) > V_11d8!) THEN GOTO L_34184   '@340f7
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@3412c
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@34154
L_34184:
    IF NOT (V_11d8! > L_BP56! OR L_BP56! = -1000.0) THEN GOTO L_34400   '@34184 DS:4454
    V_11c8! = 1.0   '@341c0 DS:4450
L_341d6:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_34349   '@341d6
    L_BP8e% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@34233 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP8e%) <> 0) THEN GOTO L_34344   '@342e4 DS:4464
    GOTO L_3438a   '@34337
L_34344:
L_34349:
    V_11c8! = FX##(V_11c8!) + 1.0   '@34349 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_341d6   '@3435f
L_3438a:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_343fb   '@3438a
    L_BP52! = V_11d4!   '@343b4
    L_BP56! = V_11d8!   '@343c4
    V_11ec! = V_11c4!   '@343d4
    V_11bc! = V_11c8!   '@343e5
L_343fb:
L_34400:
L_34405:
L_3440a:
    V_11c4! = FX##(V_11c4!) + 1.0   '@3440a DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_33c50   '@34420
    IF NOT (L_BP56! <> -1000.0 AND (L_BP52! <> -1000.0 AND L_BP3a! = 2.0) OR L_BP3a! = 1.0) THEN GOTO L_344f0   '@3444a DS:4450,4454,4464
    L_BP82! = L_BP52!   '@344ba
    L_BP86! = L_BP56!   '@344ca
    L_BP8a! = V_11ec!   '@344da
L_344f0:
    L_BP3e! = V_11ec!   '@344f0
    L_BP3a! = FX##(L_BP3a!) + 1.0   '@34500 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP3a! > 2.0) THEN GOTO L_33c1a   '@34514 DS:4464
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 > FX##(V_11cc!)) THEN GOTO L_34888   '@3452e DS:4450
    A_128a$(RT_CINT%(FX##(V_11cc!))) = "V" + A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))))   '@3456b DS:446c
    A_125c!(RT_CINT%(FX##(V_11cc!)), 0) = A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 0)   '@345dc DS:445c
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 0) = A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 1)   '@346a2 DS:445c
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 1) = FX##(A_1200!(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4))))), RT_CINT%((A_1664!(RT_CINT%(FX##(V_11bc!)), 4) - INT(FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 4)))) * 100.0), 2)) - A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2)   '@34769 DS:445c
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 2) = 0.0   '@3485b DS:4458
L_34888:
    GOTO L_36b4f   '@34888
L_34890:
    V_11ec! = 0.0   '@34890 DS:4458
    V_11c4! = 1.0   '@348a1 DS:4450
L_348b8:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@348b8 DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_3501c   '@348d2
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_34cb4   '@34906
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@34951
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@3497b
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 2) > V_11d4!) THEN GOTO L_34a30   '@349a6
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@349d8
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@34a00
L_34a30:
    IF NOT (V_11d4! > L_BP52! OR L_BP52! = -1000.0) THEN GOTO L_34cac   '@34a30 DS:4454
    V_11c8! = 1.0   '@34a6c DS:4450
L_34a82:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_34bf5   '@34a82
    L_BP90% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@34adf DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP90%) <> 0) THEN GOTO L_34bf0   '@34b90 DS:4464
    GOTO L_34c36   '@34be3
L_34bf0:
L_34bf5:
    V_11c8! = FX##(V_11c8!) + 1.0   '@34bf5 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_34a82   '@34c0b
L_34c36:
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_34ca7   '@34c36
    L_BP52! = V_11d4!   '@34c60
    L_BP56! = V_11d8!   '@34c70
    V_11ec! = V_11c4!   '@34c80
    V_11bc! = V_11c8!   '@34c91
L_34ca7:
L_34cac:
    GOTO L_35017   '@34cac
L_34cb4:
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 0)   '@34cb4
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 1)   '@34cde
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 3) > V_11d8!) THEN GOTO L_34d96   '@34d09
    V_11d4! = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)   '@34d3e
    V_11d8! = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)   '@34d66
L_34d96:
    IF NOT (V_11d8! > L_BP56! OR L_BP56! = -1000.0) THEN GOTO L_35012   '@34d96 DS:4454
    V_11c8! = 1.0   '@34dd2 DS:4450
L_34de8:
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 4))) <> INT(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 4)))) THEN GOTO L_34f5b   '@34de8
    L_BP92% = (RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)), (2.0))) < 0.100000001490116119384765625##)   '@34e45 DS:4464,4468
    IF NOT ((RT_SQR##(RT_POT##((FX##(V_11d4!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 2)), (2.0)) + RT_POT##((FX##(V_11d8!) - A_1664!(RT_CINT%(FX##(V_11c8!)), 3)), (2.0))) < 0.100000001490116119384765625## OR L_BP92%) <> 0) THEN GOTO L_34f56   '@34ef6 DS:4464
    GOTO L_34f9c   '@34f49
L_34f56:
L_34f5b:
    V_11c8! = FX##(V_11c8!) + 1.0   '@34f5b DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_34de8   '@34f71
L_34f9c:
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_3500d   '@34f9c
    L_BP52! = V_11d4!   '@34fc6
    L_BP56! = V_11d8!   '@34fd6
    V_11ec! = V_11c4!   '@34fe6
    V_11bc! = V_11c8!   '@34ff7
L_3500d:
L_35012:
L_35017:
L_3501c:
    V_11c4! = FX##(V_11c4!) + 1.0   '@3501c DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_348b8   '@35032
    L_BP82! = L_BP52!   '@3505c
    L_BP86! = L_BP56!   '@3506c
    L_BP8a! = V_11ec!   '@3507c
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 > FX##(V_11cc!)) THEN GOTO L_3530c   '@3508d DS:4450
    A_128a$(RT_CINT%(FX##(V_11cc!))) = "P"   '@350ca DS:4472
    V_11c4! = 1.0   '@350f0 DS:4450
    L_BP36! = 0.0   '@35101 DS:4458
L_35116:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 4))) = VAL(A_0fba$(RT_CINT%(FX##(V_11c4!))))) THEN GOTO L_351f2   '@35116
    A_128a$(RT_CINT%(FX##(V_11cc!))) = A_128a$(RT_CINT%(FX##(V_11cc!))) + A_143a$(A_15ac%(RT_CINT%(FX##(V_11c4!) - L_BP36!)))   '@3517d
    GOTO L_3528a   '@351e5
L_351f2:
    V_11c4! = FX##(V_11c4!) + 1.0   '@351f2 DS:4450
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11c4!) - 1.0)) = A_0fba$(RT_CINT%(FX##(V_11c4!)))) THEN GOTO L_35260   '@35208 DS:4460
    L_BP36! = FX##(L_BP36!) + 1.0   '@3524c DS:4450
L_35260:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0fe8!(0, 0) < V_11c4!) THEN GOTO L_35116   '@35260
L_3528a:
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 0) = 0.0   '@3528a DS:4458
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 1) = 0.0   '@352b4 DS:4458
    A_12b8!(RT_CINT%(FX##(V_11cc!)), 2) = 0.0   '@352df DS:4458
L_3530c:
    IF NOT (L_BP86! = -1000.0 AND L_BP82! = -1000.0 OR FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 > FX##(V_11cc!)) THEN GOTO L_36b4a   '@3530c DS:4450,4454
L_3538c:
    V_11c4! = 1.0   '@35391 DS:4450
    IF NOT (L_BP82! <> -1000.0) THEN GOTO L_353ce   '@353a2 DS:4454
    V_11c4! = L_BP8a!   '@353bd
L_353ce:
L_353d4:
    L_BP36! = FX##(V_11cc!) / 100.0 + V_11e4!   '@353d4 DS:445c
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 4) = L_BP36!) THEN GOTO L_36077   '@353ee
    V_11c8! = FX##(V_11c4!) + 1.0   '@35422 DS:4450
L_3543e:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c8!)), 4) = L_BP36!) THEN GOTO L_35fe6   '@3543e
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) = A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_356a0   '@35472
    IF NOT (ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_35698   '@354bd
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) / 2.0   '@35536 DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0   '@35582 DS:4464
    IF NOT ((FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) / 2.0 < FX##(L_BP4e!)) THEN GOTO L_35676   '@355d0 DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) / 2.0   '@35628 DS:4464
L_35676:
    L_BP0e! = FX##(V_0e04#) / 2.0#   '@35676 DS:4478
    GOTO L_36040   '@3568b
L_35698:
    GOTO L_35fe1   '@35698
L_356a0:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) = A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) THEN GOTO L_358c5   '@356a0
    IF NOT (ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_358bd   '@356ef
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) / 2.0   '@3576a DS:4464
    IF NOT ((FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) / 2.0 < FX##(L_BP4a!)) THEN GOTO L_35852   '@357b4 DS:4464
    L_BP4a! = (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) / 2.0   '@35808 DS:4464
L_35852:
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) / 2.0   '@35852 DS:4464
    L_BP0e! = 0.0   '@358a0 DS:4458
    GOTO L_36040   '@358b0
L_358bd:
    GOTO L_35fdc   '@358bd
L_358c5:
    L_BP0e! = ATN(ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / ABS(FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@358c5
    L_BP2e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) / 2.0   '@35958 DS:4464
    L_BP52! = ((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0 - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) * (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 0)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c8!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c8!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c8!)), 0)   '@359a2 DS:4464
    IF NOT (ABS(FX##(L_BP2e!) - L_BP52!) * RT_SIN##(FX##(L_BP0e!)) + 0.100000001490116119384765625## >= FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0))) THEN GOTO L_35fd7   '@35aab DS:4468
    L_BP4a! = (FX##(L_BP2e!) + L_BP52!) / 2.0   '@35b03 DS:4464
    L_BP4e! = (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) + A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / 2.0   '@35b1b DS:4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) < A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) < A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_35ca2   '@35b69
    L_BP0e! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@35c0d
    GOTO L_35fca   '@35c9a
L_35ca2:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) < A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) > A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_35de3   '@35ca2
    L_BP0e! = V_0e04# - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 2)))   '@35d46
    GOTO L_35fc5   '@35ddb
L_35de3:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 1) > A_1664!(RT_CINT%(FX##(V_11c4!)), 3) AND A_1664!(RT_CINT%(FX##(V_11c4!)), 0) > A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_35f21   '@35de3
    L_BP0e! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 0)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 2))) + V_0e04#   '@35e87
    GOTO L_35fc0   '@35f19
L_35f21:
    L_BP0e! = 2.0# * FX##(V_0e04#) - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 1)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) - A_1664!(RT_CINT%(FX##(V_11c4!)), 0)))   '@35f21 DS:4478
L_35fc0:
L_35fc5:
L_35fca:
    GOTO L_36040   '@35fca
L_35fd7:
L_35fdc:
L_35fe1:
L_35fe6:
    V_11c8! = FX##(V_11c8!) + 1.0   '@35fe6 DS:4450
    IF NOT (A_1664!(0, 0) < V_11c8!) THEN GOTO L_36037   '@35ffc
    V_11c8! = 1.0   '@36026 DS:4450
L_36037:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3543e   '@36037
L_36040:
    IF NOT (A_1664!(0, 0) >= V_11c8!) THEN GOTO L_36072   '@36040
    GOTO L_360b8   '@3606a
L_36072:
L_36077:
    V_11c4! = FX##(V_11c4!) + 1.0   '@36077 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_1664!(0, 0) < V_11c4!) THEN GOTO L_353d4   '@3608d
L_360b8:
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 = FX##(V_11cc!)) THEN GOTO L_360fd   '@360b8 DS:4450
    GOTO L_36b59   '@360f5
L_360fd:
    L_BP2e! = L_BP4a! - RT_COS##(FX##(L_BP0e!)) * 1000.0   '@360fd DS:4480
    L_BP32! = L_BP4e! - RT_SIN##(FX##(L_BP0e!)) * 1000.0   '@3611f DS:4480
    L_BP52! = RT_COS##(FX##(L_BP0e!)) * 1000.0 + L_BP4a!   '@36141 DS:4480
    L_BP56! = RT_SIN##(FX##(L_BP0e!)) * 1000.0 + L_BP4e!   '@36160 DS:4480
    V_11ec! = 1.0   '@3617f DS:4450
    L_BP36! = 0.0   '@36190 DS:4458
L_361a6:
    IF NOT (RT_CINT%(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 4))) = VAL(A_0fba$(RT_CINT%(FX##(V_11ec!))))) THEN GOTO L_3621a   '@361a6
    GOTO L_362b2   '@3620d
L_3621a:
    V_11ec! = FX##(V_11ec!) + 1.0   '@3621a DS:4450
    IF NOT (A_0fba$(RT_CINT%(FX##(V_11ec!) - 1.0)) = A_0fba$(RT_CINT%(FX##(V_11ec!)))) THEN GOTO L_36288   '@36230 DS:4460
    L_BP36! = FX##(L_BP36!) + 1.0   '@36274 DS:4450
L_36288:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0fe8!(0, 0) < V_11ec!) THEN GOTO L_361a6   '@36288
L_362b2:
    V_11ec! = -(FX##(V_11ec!) - L_BP36!)   '@362b2
    CALL S_22ee1   '@362ca
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP5a! = V_11d4!   '@362d4
    L_BP5e! = V_11d8!   '@362e4
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 6) = 2) THEN GOTO L_365fb   '@362f4
    L_BP12! = A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_COS##(FX##(L_BP0e!)) / 2.0 + L_BP5a!   '@36335 DS:4464
    L_BP16! = A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_SIN##(FX##(L_BP0e!)) / 2.0 + L_BP5e!   '@3638d DS:4464
    L_BP62! = L_BP5a! - A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_COS##(FX##(L_BP0e!)) / 2.0   '@363e5 DS:4464
    L_BP66! = L_BP5e! - A_1496%(A_15ac%(RT_CINT%(FX##(-V_11ec!))), V_13aa%, 1) * RT_SIN##(FX##(L_BP0e!)) / 2.0   '@36440 DS:4464
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_3656e   '@3649b
    IF NOT (L_BP62! >= L_BP4a!) THEN GOTO L_36566   '@364e6
    IF NOT (L_BP62! > L_BP82! OR L_BP82! = -1000.0) THEN GOTO L_36561   '@364ff DS:4454
    L_BP82! = L_BP62!   '@3653c
    L_BP86! = L_BP66!   '@3654c
L_36561:
L_36566:
    GOTO L_365f3   '@36566
L_3656e:
    IF NOT (L_BP66! >= L_BP4e!) THEN GOTO L_365ee   '@3656e
    IF NOT (L_BP66! > L_BP86! OR L_BP86! = -1000.0) THEN GOTO L_365e9   '@36587 DS:4454
    L_BP82! = L_BP62!   '@365c4
    L_BP86! = L_BP66!   '@365d4
L_365e9:
L_365ee:
L_365f3:
    GOTO L_36a9c   '@365f3
L_365fb:
    L_BP12! = -1000.0   '@365fb DS:4454
    L_BP16! = -1000.0   '@3660b DS:4454
    L_BP62! = -1000.0   '@3661b DS:4454
    L_BP66! = -1000.0   '@3662b DS:4454
    V_11c8! = 1.0   '@3663b DS:4450
L_36652:
    L_BP6a! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!)), 0)) + L_BP5a!   '@36652
    L_BP6e! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!)), 1)) + L_BP5e!   '@3667f
    L_BP72! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!) + 1.0), 0)) + L_BP5a!   '@366ad DS:4450
    L_BP76! = FX##(A_16ee!(RT_CINT%(FX##(V_11c8!) + 1.0), 1)) + L_BP5e!   '@366df DS:4450
    GOSUB L_37d45   '@36712
    IF NOT (V_0e14$ = "CRUZA") THEN GOTO L_36a57   '@3671f DS:4484
    IF NOT (A_1664!(RT_CINT%(FX##(V_11c4!)), 0) <> A_1664!(RT_CINT%(FX##(V_11c4!)), 2)) THEN GOTO L_368eb   '@36736
    IF NOT (L_BP7a! >= L_BP4a!) THEN GOTO L_368e3   '@36781
    IF NOT (L_BP7a! < L_BP82! OR L_BP82! = -1000.0) THEN GOTO L_367fc   '@3679a DS:4454
    L_BP82! = L_BP7a!   '@367d7
    L_BP86! = L_BP7e!   '@367e7
L_367fc:
    IF NOT (L_BP7a! < L_BP12! OR L_BP12! = -1000.0) THEN GOTO L_3687b   '@367fc DS:4454
    L_BP62! = L_BP12!   '@36837
    L_BP66! = L_BP16!   '@36846
    L_BP12! = L_BP7a!   '@36855
    L_BP16! = L_BP7e!   '@36864
    GOTO L_368de   '@36873
L_3687b:
    IF NOT (L_BP7a! < L_BP62! OR L_BP62! = -1000.0) THEN GOTO L_368d9   '@3687b DS:4454
    L_BP62! = L_BP7a!   '@368b6
    L_BP66! = L_BP7e!   '@368c5
L_368d9:
L_368de:
L_368e3:
    GOTO L_36a52   '@368e3
L_368eb:
    IF NOT (L_BP7e! >= L_BP4e!) THEN GOTO L_36a4d   '@368eb
    IF NOT (L_BP7e! < L_BP86! OR L_BP86! = -1000.0) THEN GOTO L_36966   '@36904 DS:4454
    L_BP82! = L_BP7a!   '@36941
    L_BP86! = L_BP7e!   '@36951
L_36966:
    IF NOT (L_BP7e! < L_BP16! OR L_BP16! = -1000.0) THEN GOTO L_369e5   '@36966 DS:4454
    L_BP62! = L_BP12!   '@369a1
    L_BP66! = L_BP16!   '@369b0
    L_BP12! = L_BP7a!   '@369bf
    L_BP16! = L_BP7e!   '@369ce
    GOTO L_36a48   '@369dd
L_369e5:
    IF NOT (L_BP7e! < L_BP66! OR L_BP66! = -1000.0) THEN GOTO L_36a43   '@369e5 DS:4454
    L_BP62! = L_BP7a!   '@36a20
    L_BP66! = L_BP7e!   '@36a2f
L_36a43:
L_36a48:
L_36a4d:
L_36a52:
L_36a57:
    V_11c8! = FX##(V_11c8!) + 1.0   '@36a57 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_16ee!(0, 0) < V_11c8!) THEN GOTO L_36652   '@36a6d
L_36a9c:
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 > FX##(V_11cc!)) THEN GOTO L_36b45   '@36a9c DS:4450
    A_125c!(RT_CINT%(FX##(V_11cc!)), 0) = FX##(RT_CINT%(RT_SQR##(RT_POT##((FX##(L_BP66!) - L_BP16!), (2.0)) + RT_POT##((FX##(L_BP62!) - L_BP12!), (2.0))) * 10.0)) / 10.0   '@36ad9 DS:4464,448e
L_36b45:
L_36b4a:
L_36b4f:
L_36b59:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP22!)), 0) = A_1664!(RT_CINT%(FX##(L_BP22!)), 2)) THEN GOTO L_36bf5   '@36b5e
    A_125c!(RT_CINT%(FX##(V_11cc!)), 1) = FX##(RT_CINT%(ABS(FX##(L_BP86!) - L_BP1e!) * 10.0)) / 10.0   '@36ba7 DS:448e
    GOTO L_36d04   '@36bed
L_36bf5:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP22!)), 1) = A_1664!(RT_CINT%(FX##(L_BP22!)), 3)) THEN GOTO L_36c90   '@36bf5
    A_125c!(RT_CINT%(FX##(V_11cc!)), 1) = FX##(RT_CINT%(ABS(FX##(L_BP82!) - L_BP1a!) * 10.0)) / 10.0   '@36c42 DS:448e
    GOTO L_36cff   '@36c88
L_36c90:
    A_125c!(RT_CINT%(FX##(V_11cc!)), 1) = FX##(RT_CINT%(RT_SQR##(RT_POT##((FX##(L_BP86!) - L_BP1e!), (2.0)) + RT_POT##((FX##(L_BP82!) - L_BP1a!), (2.0))) * 10.0)) / 10.0   '@36c90 DS:4464,448e
L_36cff:
L_36d04:
    IF NOT (V_11cc! = 1.0) THEN GOTO L_36d4e   '@36d04 DS:4450
    A_12e6!(RT_CINT%(FX##(V_11cc!))) = 0.0   '@36d1f DS:4458
    GOTO L_36dc2   '@36d46
L_36d4e:
    A_12e6!(RT_CINT%(FX##(V_11cc!))) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 1, 2)) - A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2)   '@36d4e
L_36dc2:
    IF NOT (V_11cc! = 0.0) THEN GOTO L_36e52   '@36dc2 DS:4458
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_125c!(RT_CINT%(FX##(V_11cc!)), 1)   '@36ddd DS:445c
    GOTO L_3741d   '@36e4a
L_36e52:
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + 1.0 = FX##(V_11cc!)) THEN GOTO L_36f04   '@36e52 DS:4450
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_125c!(RT_CINT%(FX##(V_11cc!)), 1)   '@36e8f DS:445c
    GOTO L_37418   '@36efc
L_36f04:
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 < FX##(A_125c!(RT_CINT%(FX##(V_11cc!) - 1.0), 0)) / 2.0 + A_125c!(RT_CINT%(FX##(V_11cc!)), 1) + FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) / 2.0) THEN GOTO L_371f3   '@36f04 DS:445c,4460,4464
    A_1314!(RT_CINT%(FX##(V_11cc!))) = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_125c!(RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@36fae DS:445c,4464
    IF NOT (FX##(A_1314!(RT_CINT%(FX##(V_11cc!)))) > FX##(A_125c!(RT_CINT%(FX##(V_11cc!) - 1.0), 0)) / 2.0) THEN GOTO L_370be   '@37020 DS:4460,4464
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_125c!(RT_CINT%(FX##(V_11cc!) - 1.0), 0)) / 2.0   '@37074 DS:4460,4464
L_370be:
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_1314!(RT_CINT%(FX##(V_11cc!))) - A_125c!(RT_CINT%(FX##(V_11cc!)), 1) > FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) / 2.0) THEN GOTO L_371eb   '@370be DS:445c,4464
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_125c!(RT_CINT%(FX##(V_11cc!)), 1) - FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) / 2.0   '@37158 DS:445c,4464
L_371eb:
    GOTO L_37413   '@371eb
L_371f3:
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_125c!(RT_CINT%(FX##(V_11cc!) - 1.0), 0)) / 2.0 + (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - FX##(A_125c!(RT_CINT%(FX##(V_11cc!) - 1.0), 0)) / 2.0 - A_125c!(RT_CINT%(FX##(V_11cc!)), 1) - FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) / 2.0) / 2.0   '@371f3 DS:445c,4460,4464
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 - A_1314!(RT_CINT%(FX##(V_11cc!))) > FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) - 2.0 + A_125c!(RT_CINT%(FX##(V_11cc!)), 1)) THEN GOTO L_3740e   '@372e1 DS:445c,4492
    A_1314!(RT_CINT%(FX##(V_11cc!))) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 3)) * 100.0 + (2.0 - FX##(A_125c!(RT_CINT%(FX##(V_11cc!)), 0)) - A_125c!(RT_CINT%(FX##(V_11cc!)), 1))   '@3737b DS:445c,4464
L_3740e:
L_37413:
L_37418:
L_3741d:
    V_11d4! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP0e!)) + L_BP4a!   '@3741d DS:4464,4496
    V_11d8! = L_BP4e! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP0e!))   '@3746e DS:4464,4496
    GOSUB L_376ec   '@374c2
    A_1370%(RT_CINT%(FX##(V_11cc!)), 2) = RT_CINT%(FX##(V_11c8!))   '@374cf
    A_1370%(RT_CINT%(FX##(V_11cc!)), 3) = RT_CINT%(FX##(V_11c4!))   '@374fd
    V_11d4! = L_BP4a! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP0e!))   '@3752e DS:4464,4496
    V_11d8! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP0e!)) + L_BP4e!   '@37582 DS:4464,4496
    GOSUB L_376ec   '@375d3
    A_1370%(RT_CINT%(FX##(V_11cc!)), 0) = RT_CINT%(FX##(V_11c8!))   '@375e0
    A_1370%(RT_CINT%(FX##(V_11cc!)), 1) = RT_CINT%(FX##(V_11c4!))   '@37610
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@37641 DS:4450
    GOSUB L_3846a   '@3766c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@37679 DS:4450
    REDIM A_125c!(-32768 TO -32768, -32768 TO -32768)   '@376a4
    REDIM A_12e6!(-32768 TO -32768)   '@376b2
    REDIM A_1314!(-32768 TO -32768)   '@376bb
    REDIM A_1370%(-32768 TO -32768, -32768 TO -32768)   '@376c4
    REDIM A_12b8!(-32768 TO -32768, -32768 TO -32768)   '@376cd
    REDIM A_128a$(-32768 TO -32768)   '@376d6
    GOTO L_39a41   '@376df
    ' ---- F_376e7 @0x376e7  (0376e7_F_376e7.lift.txt; evidence_id (assembly): ev_3e66cc36ac11f67caccb28280f15d7bb0520067ede89607f3577ccf15a921ce7)
L_376ec:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03018c_FUN_3000_018c
    V_11c8! = 0.0   '@376f1 DS:4458
    V_11c4! = 0.0   '@37702 DS:4458
    L_BP96! = A_0f30%(0, 0)   '@37713
    FOR V_11b8! = 1.0 TO L_BP96!   '@37738 DS:4450
    IF NOT (A_0f5e!(RT_CINT%(FX##(V_11b8!)), 1) = 0.0) THEN GOTO L_37d14   '@37740 DS:4458
    L_BP9a! = A_0f5e!(RT_CINT%(FX##(V_11b8!)), 0)   '@37775
    V_11a4! = 0.0   '@3779f DS:4458
    L_BP9e! = A_0f30%(RT_CINT%(FX##(L_BP9a!)), 0) - 1   '@377b0
    FOR V_11c0! = 1.0 TO L_BP9e!   '@377e0 DS:4450
    L_BP2e! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP9a!)), RT_CINT%(FX##(V_11c0!))), 0)) * 100.0   '@377e8 DS:445c
    L_BP32! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP9a!)), RT_CINT%(FX##(V_11c0!))), 1)) * 100.0   '@37830 DS:445c
    L_BP52! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP9a!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 0)) * 100.0   '@37879 DS:4450,445c
    L_BP56! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP9a!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 1)) * 100.0   '@378c6 DS:4450,445c
    IF NOT (NOT (L_BP52! > V_11d4! AND L_BP2e! > V_11d4!)) THEN GOTO L_37bbf   '@37914
    IF NOT (NOT (L_BP56! > V_11d8! AND L_BP32! > V_11d8! OR L_BP56! < V_11d8! AND L_BP32! < V_11d8!)) THEN GOTO L_37bba   '@37952
    IF NOT (L_BP32! = L_BP56!) THEN GOTO L_37a7c   '@379c4
    IF NOT ((L_BP2e! >= V_11d4! AND L_BP52! <= 2.0 OR L_BP52! >= V_11d4! AND L_BP2e! <= V_11d4!) AND V_11d8! = L_BP32!) THEN GOTO L_37a74   '@379dd DS:4464
    GOTO L_37beb   '@37a67
L_37a74:
    GOTO L_37bb5   '@37a74
L_37a7c:
    IF NOT ((V_11d8! < L_BP32! AND V_11d8! >= L_BP56! OR V_11d8! <= L_BP56! AND V_11d8! > L_BP32!) AND (L_BP52! <= V_11d4! AND L_BP2e! <= V_11d4!)) THEN GOTO L_37b3e   '@37a7c
    V_11a4! = FX##(V_11a4!) + 1.0   '@37b20 DS:4450
    GOTO L_37bb0   '@37b36
L_37b3e:
    IF NOT (L_BP2e! <> L_BP52!) THEN GOTO L_37bab   '@37b3e
    IF NOT ((FX##(V_11d8!) - L_BP32!) * (FX##(L_BP52!) - L_BP2e!) / (FX##(L_BP56!) - L_BP32!) + L_BP2e! <= FX##(V_11d4!)) THEN GOTO L_37ba6   '@37b57
    V_11a4! = FX##(V_11a4!) + 1.0   '@37b90 DS:4450
L_37ba6:
L_37bab:
L_37bb0:
L_37bb5:
L_37bba:
L_37bbf:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@37bbf DS:4450
L_37beb:
    IF NOT (A_0f30%(RT_CINT%(FX##(L_BP9a!)), 0) - 1 > V_11c0! OR FX##(V_11a4!) / 2.0 <> RT_CLNG&(FX##(V_11a4!)) \ 2&) THEN GOTO L_37d0f   '@37beb DS:4464
    V_11c8! = A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2) - (FX##(A_1200!(1, 14, 3)) + A_0f5e!(RT_CINT%(FX##(V_11b8!)), 3))   '@37c67
    V_11c4! = A_115e!(RT_CINT%(FX##(V_11b8!)), 0)   '@37cd8
    GOTO L_37d40   '@37d02
L_37d0f:
L_37d14:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@37d14 DS:4450
L_37d40:
L_37d45:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03018c_FUN_3000_018c
    V_0e14$ = "NAOCRUZA"   '@37d4a DS:449a
    IF NOT (L_BP52! < L_BP72! AND (L_BP52! < L_BP6a! AND (L_BP2e! < L_BP72! AND L_BP2e! < L_BP6a!))) THEN GOTO L_37dd0   '@37d5c
    GOTO L_38456   '@37dc8
L_37dd0:
    IF NOT (L_BP72! < L_BP52! AND (L_BP72! < L_BP2e! AND (L_BP6a! < L_BP52! AND L_BP6a! < L_BP2e!))) THEN GOTO L_37e44   '@37dd0
    GOTO L_38456   '@37e3c
L_37e44:
    IF NOT (L_BP56! < L_BP76! AND (L_BP56! < L_BP6e! AND (L_BP32! < L_BP76! AND L_BP32! < L_BP6e!))) THEN GOTO L_37eb8   '@37e44
    GOTO L_38456   '@37eb0
L_37eb8:
    IF NOT (L_BP76! < L_BP56! AND (L_BP76! < L_BP32! AND (L_BP6e! < L_BP56! AND L_BP6e! < L_BP32!))) THEN GOTO L_37f2c   '@37eb8
    GOTO L_38456   '@37f24
L_37f2c:
    IF NOT (L_BP32! = L_BP6e! AND (L_BP6e! = L_BP76! AND L_BP32! = L_BP56!)) THEN GOTO L_37f87   '@37f2c
    GOTO L_38456   '@37f7f
L_37f87:
    IF NOT (L_BP2e! = L_BP6a! AND (L_BP6a! = L_BP72! AND L_BP2e! = L_BP52!)) THEN GOTO L_37fe2   '@37f87
    GOTO L_38456   '@37fda
L_37fe2:
    IF NOT (L_BP32! <> L_BP56! AND L_BP6e! <> L_BP76!) THEN GOTO L_3806b   '@37fe2
    IF NOT (ABS((FX##(L_BP72!) - L_BP6a!) / (FX##(L_BP76!) - L_BP6e!) - (FX##(L_BP52!) - L_BP2e!) / (FX##(L_BP56!) - L_BP32!)) < 0.0000999999974737875163555145263671875##) THEN GOTO L_38066   '@3801c DS:44a6
    GOTO L_38456   '@3805e
L_38066:
L_3806b:
    IF NOT (L_BP6e! = L_BP76! OR L_BP32! = L_BP56!) THEN GOTO L_380e4   '@3806b
    L_BP7e! = L_BP32!   '@380a5
    IF NOT (L_BP6e! = L_BP76!) THEN GOTO L_380dc   '@380b4
    L_BP7e! = L_BP6e!   '@380cd
L_380dc:
    GOTO L_3816b   '@380dc
L_380e4:
    L_BP7e! = FX##(L_BP52!) - L_BP72! + ((FX##(L_BP72!) - L_BP6a!) / (FX##(L_BP76!) - L_BP6e!) * L_BP76! - (FX##(L_BP52!) - L_BP2e!) / (FX##(L_BP56!) - L_BP32!) * L_BP56!)   '@380e4
    L_BP7e! = L_BP7e! / ((FX##(L_BP72!) - L_BP6a!) / (FX##(L_BP76!) - L_BP6e!) - (FX##(L_BP52!) - L_BP2e!) / (FX##(L_BP56!) - L_BP32!))   '@3812b
L_3816b:
    IF NOT (L_BP6a! = L_BP72! OR L_BP2e! = L_BP52!) THEN GOTO L_381e4   '@3816b
    L_BP7a! = L_BP2e!   '@381a5
    IF NOT (L_BP6a! = L_BP72!) THEN GOTO L_381dc   '@381b4
    L_BP7a! = L_BP6a!   '@381cd
L_381dc:
    GOTO L_3826f   '@381dc
L_381e4:
    IF NOT (L_BP32! = L_BP56!) THEN GOTO L_38235   '@381e4
    L_BP7a! = L_BP72! - (FX##(L_BP76!) - L_BP7e!) * (FX##(L_BP72!) - L_BP6a!) / (FX##(L_BP76!) - L_BP6e!)   '@381fd
    GOTO L_3826a   '@3822d
L_38235:
    L_BP7a! = L_BP52! - (FX##(L_BP56!) - L_BP7e!) * (FX##(L_BP52!) - L_BP2e!) / (FX##(L_BP56!) - L_BP32!)   '@38235
L_3826a:
L_3826f:
    IF NOT (L_BP7a! < L_BP72! AND L_BP7a! < L_BP6a! OR L_BP7a! < L_BP52! AND L_BP7a! < L_BP2e!) THEN GOTO L_382e3   '@3826f
    GOTO L_38456   '@382db
L_382e3:
    IF NOT (L_BP7a! > L_BP72! AND L_BP7a! > L_BP6a! OR L_BP7a! > L_BP52! AND L_BP7a! > L_BP2e!) THEN GOTO L_38357   '@382e3
    GOTO L_38456   '@3834f
L_38357:
    IF NOT (L_BP7e! < L_BP76! AND L_BP7e! < L_BP6e! OR L_BP7e! < L_BP56! AND L_BP7e! < L_BP32!) THEN GOTO L_383cb   '@38357
    GOTO L_38456   '@383c3
L_383cb:
    IF NOT (L_BP7e! > L_BP76! AND L_BP7e! > L_BP6e! OR L_BP7e! > L_BP56! AND L_BP7e! > L_BP32!) THEN GOTO L_3843f   '@383cb
    GOTO L_38456   '@38437
L_3843f:
    V_0e14$ = "CRUZA"   '@3843f DS:4484
L_38456:
    RETURN   '@3845b
L_3846a:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03018c_FUN_3000_018c
    V_1860! = A_125c!(0, 0)   '@3846f
    V_1864! = A_125c!(0, 1)   '@3848f
    V_188c! = A_125c!(1, 0)   '@384b2
    V_1890! = A_125c!(1, 1)   '@384d5
    V_18b8! = A_125c!(2, 0)   '@384f6
    V_18bc! = A_125c!(2, 1)   '@38519
    V_18e4! = A_125c!(3, 0)   '@3853d
    V_18e8! = A_125c!(3, 1)   '@38560
    V_1910! = A_125c!(4, 0)   '@38584
    V_1914! = A_125c!(4, 1)   '@385a7
    V_193c! = A_125c!(5, 0)   '@385cb
    V_1940! = A_125c!(5, 1)   '@385ee
    V_1968! = A_125c!(6, 0)   '@38612
    V_196c! = A_125c!(6, 1)   '@38635
    V_1994! = A_125c!(7, 0)   '@38659
    V_1998! = A_125c!(7, 1)   '@3867c
    V_19c0! = A_125c!(8, 0)   '@386a0
    V_19c4! = A_125c!(8, 1)   '@386c3
    V_19ec! = A_125c!(9, 0)   '@386e7
    V_19f0! = A_125c!(9, 1)   '@3870a
    V_1a18! = A_125c!(10, 0)   '@3872e
    V_1a1c! = A_125c!(10, 1)   '@38751
    V_1a44! = A_125c!(11, 0)   '@38775
    V_1a48! = A_125c!(11, 1)   '@38798
    V_1a70! = A_125c!(12, 0)   '@387bc
    V_1a74! = A_125c!(12, 1)   '@387df
    V_1a9c! = A_125c!(13, 0)   '@38803
    V_1aa0! = A_125c!(13, 1)   '@38826
    V_1868! = A_12e6!(0)   '@3884a
    V_186c! = A_1314!(0)   '@38869
    V_1894! = A_12e6!(1)   '@38888
    V_1898! = A_1314!(1)   '@388a5
    V_18c0! = A_12e6!(2)   '@388c2
    V_18c4! = A_1314!(2)   '@388e2
    V_18ec! = A_12e6!(3)   '@38902
    V_18f0! = A_1314!(3)   '@38922
    V_1918! = A_12e6!(4)   '@38942
    V_191c! = A_1314!(4)   '@38962
    V_1944! = A_12e6!(5)   '@38982
    V_1948! = A_1314!(5)   '@389a2
    V_1970! = A_12e6!(6)   '@389c2
    V_1974! = A_1314!(6)   '@389e2
    V_199c! = A_12e6!(7)   '@38a02
    V_19a0! = A_1314!(7)   '@38a22
    V_19c8! = A_12e6!(8)   '@38a42
    V_19cc! = A_1314!(8)   '@38a62
    V_19f4! = A_12e6!(9)   '@38a82
    V_19f8! = A_1314!(9)   '@38aa2
    V_1a20! = A_12e6!(10)   '@38ac2
    V_1a24! = A_1314!(10)   '@38ae2
    V_1a4c! = A_12e6!(11)   '@38b02
    V_1a50! = A_1314!(11)   '@38b22
    V_1a78! = A_12e6!(12)   '@38b42
    V_1a7c! = A_1314!(12)   '@38b62
    V_1aa4! = A_12e6!(13)   '@38b82
    V_1aa8! = A_1314!(13)   '@38ba2
    V_1870% = A_1370%(0, 0)   '@38bc2
    V_1872% = A_1370%(0, 1)   '@38bdd
    V_1874% = A_1370%(0, 2)   '@38bfb
    V_1876% = A_1370%(0, 3)   '@38c16
    V_189c% = A_1370%(1, 0)   '@38c34
    V_189e% = A_1370%(1, 1)   '@38c52
    V_18a0% = A_1370%(1, 2)   '@38c6e
    V_18a2% = A_1370%(1, 3)   '@38c8a
    V_18c8% = A_1370%(2, 0)   '@38ca9
    V_18ca% = A_1370%(2, 1)   '@38cc7
    V_18cc% = A_1370%(2, 2)   '@38ce6
    V_18ce% = A_1370%(2, 3)   '@38cff
    V_18f4% = A_1370%(3, 0)   '@38d1e
    V_18f6% = A_1370%(3, 1)   '@38d3c
    V_18f8% = A_1370%(3, 2)   '@38d5b
    V_18fa% = A_1370%(3, 3)   '@38d77
    V_1920% = A_1370%(4, 0)   '@38d93
    V_1922% = A_1370%(4, 1)   '@38db1
    V_1924% = A_1370%(4, 2)   '@38dd0
    V_1926% = A_1370%(4, 3)   '@38dec
    V_194c% = A_1370%(5, 0)   '@38e0b
    V_194e% = A_1370%(5, 1)   '@38e29
    V_1950% = A_1370%(5, 2)   '@38e48
    V_1952% = A_1370%(5, 3)   '@38e64
    V_1978% = A_1370%(6, 0)   '@38e83
    V_197a% = A_1370%(6, 1)   '@38ea1
    V_197c% = A_1370%(6, 2)   '@38ec0
    V_197e% = A_1370%(6, 3)   '@38edc
    V_19a4% = A_1370%(7, 0)   '@38efb
    V_19a6% = A_1370%(7, 1)   '@38f19
    V_19a8% = A_1370%(7, 2)   '@38f38
    V_19aa% = A_1370%(7, 3)   '@38f54
    V_19d0% = A_1370%(8, 0)   '@38f73
    V_19d2% = A_1370%(8, 1)   '@38f91
    V_19d4% = A_1370%(8, 2)   '@38fb0
    V_19d6% = A_1370%(8, 3)   '@38fcc
    V_19fc% = A_1370%(9, 0)   '@38feb
    V_19fe% = A_1370%(9, 1)   '@39009
    V_1a00% = A_1370%(9, 2)   '@39028
    V_1a02% = A_1370%(9, 3)   '@39044
    V_1a28% = A_1370%(10, 0)   '@39063
    V_1a2a% = A_1370%(10, 1)   '@39081
    V_1a2c% = A_1370%(10, 2)   '@390a0
    V_1a2e% = A_1370%(10, 3)   '@390bc
    V_1a54% = A_1370%(11, 0)   '@390db
    V_1a56% = A_1370%(11, 1)   '@390f9
    V_1a58% = A_1370%(11, 2)   '@39118
    V_1a5a% = A_1370%(11, 3)   '@39134
    V_1a80% = A_1370%(12, 0)   '@39153
    V_1a82% = A_1370%(12, 1)   '@39171
    V_1a84% = A_1370%(12, 2)   '@39190
    V_1a86% = A_1370%(12, 3)   '@391ac
    V_1aac% = A_1370%(13, 0)   '@391cb
    V_1aae% = A_1370%(13, 1)   '@391e9
    V_1ab0% = A_1370%(13, 2)   '@39208
    V_1ab2% = A_1370%(13, 3)   '@39224
    V_1878! = A_12b8!(0, 0)   '@39243
    V_187c! = A_12b8!(0, 1)   '@39263
    V_1880! = A_12b8!(0, 2)   '@39286
    V_18a4! = A_12b8!(1, 0)   '@392a6
    V_18a8! = A_12b8!(1, 1)   '@392c9
    V_18ac! = A_12b8!(1, 2)   '@392ea
    V_18d0! = A_12b8!(2, 0)   '@3930b
    V_18d4! = A_12b8!(2, 1)   '@3932e
    V_18d8! = A_12b8!(2, 2)   '@39352
    V_18fc! = A_12b8!(3, 0)   '@39370
    V_1900! = A_12b8!(3, 1)   '@39393
    V_1904! = A_12b8!(3, 2)   '@393b7
    V_1928! = A_12b8!(4, 0)   '@393d8
    V_192c! = A_12b8!(4, 1)   '@393fb
    V_1930! = A_12b8!(4, 2)   '@3941f
    V_1954! = A_12b8!(5, 0)   '@39440
    V_1958! = A_12b8!(5, 1)   '@39463
    V_195c! = A_12b8!(5, 2)   '@39487
    V_1980! = A_12b8!(6, 0)   '@394a8
    V_1984! = A_12b8!(6, 1)   '@394cb
    V_1988! = A_12b8!(6, 2)   '@394ef
    V_19ac! = A_12b8!(7, 0)   '@39510
    V_19b0! = A_12b8!(7, 1)   '@39533
    V_19b4! = A_12b8!(7, 2)   '@39557
    V_19d8! = A_12b8!(8, 0)   '@39578
    V_19dc! = A_12b8!(8, 1)   '@3959b
    V_19e0! = A_12b8!(8, 2)   '@395bf
    V_1a04! = A_12b8!(9, 0)   '@395e0
    V_1a08! = A_12b8!(9, 1)   '@39603
    V_1a0c! = A_12b8!(9, 2)   '@39627
    V_1a30! = A_12b8!(10, 0)   '@39648
    V_1a34! = A_12b8!(10, 1)   '@3966b
    V_1a38! = A_12b8!(10, 2)   '@3968f
    V_1a5c! = A_12b8!(11, 0)   '@396b0
    V_1a60! = A_12b8!(11, 1)   '@396d3
    V_1a64! = A_12b8!(11, 2)   '@396f7
    V_1a88! = A_12b8!(12, 0)   '@39718
    V_1a8c! = A_12b8!(12, 1)   '@3973b
    V_1a90! = A_12b8!(12, 2)   '@3975f
    V_1ab4! = 0.0   '@39780 DS:4458
    V_1ab8! = 0.0   '@39791 DS:4458
    V_1abc! = 0.0   '@397a2 DS:4458
    V_1884$ = RT_FIX$(A_128a$(0), 8)   '@397b3 (string fixa)
    V_18b0$ = RT_FIX$(A_128a$(1), 8)   '@397da (string fixa)
    V_18dc$ = RT_FIX$(A_128a$(2), 8)   '@397ff (string fixa)
    V_1908$ = RT_FIX$(A_128a$(3), 8)   '@39827 (string fixa)
    V_1934$ = RT_FIX$(A_128a$(4), 8)   '@3984f (string fixa)
    V_1960$ = RT_FIX$(A_128a$(5), 8)   '@39877 (string fixa)
    V_198c$ = RT_FIX$(A_128a$(6), 8)   '@3989f (string fixa)
    V_19b8$ = RT_FIX$(A_128a$(7), 8)   '@398c7 (string fixa)
    V_19e4$ = RT_FIX$(A_128a$(8), 8)   '@398ef (string fixa)
    V_1a10$ = RT_FIX$(A_128a$(9), 8)   '@39917 (string fixa)
    V_1a3c$ = RT_FIX$(A_128a$(10), 8)   '@3993f (string fixa)
    V_1a68$ = RT_FIX$(A_128a$(11), 8)   '@39967 (string fixa)
    V_1a94$ = RT_FIX$(A_128a$(12), 8)   '@3998f (string fixa)
    V_1ac0$ = RT_FIX$("", 8)   '@399b7 DS:44aa (string fixa)
    OPEN RT_ARQ$(V_0e3e$ + V_0e26$ + ".$$$") FOR RANDOM AS #1 LEN = 616   '@399d2 DS:44ae,44b4
    RT_REG_1860_GRAVA 1, RT_CLNG&(FX##(V_11e4!))   '@39a00 (registro de 616 bytes)
    RT_CLOSE   '@39a25 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    RETURN   '@39a32
L_39a41:   ' entrada vinda de 03018c_FUN_3000_018c
    ' END SUB   '@39a41
END SUB

SUB S_39a51   ' entrada de SUB/FUNCTION (B$ENRA, locais 124 bytes) (0x39a51)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c$
    DIM L_BP3e%
    DIM L_BP42!
    DIM L_BP44%
    DIM L_BP48!
    DIM L_BP4c!
    DIM L_BP50$
    DIM L_BP54$
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP60$
    DIM L_BP64$
    DIM L_BP68!
    DIM L_BP6c!
    DIM L_BP70!
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP86%
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_3000_9a51 @0x39a51  (039a51_FUN_3000_9a51.lift.txt; evidence_id (assembly): ev_9af1192780c49037c83c9de6cba073c967214180be8ee2affd23bfbc7d93a08f)
    REDIM L_BP1c%(0 TO 700)   '@39a59
    IF NOT (V_0e0c$ = "INICIAL") THEN GOTO L_39c7f   '@39a7b DS:44bc
    REDIM A_17a6%(-32768 TO -32768, -32768 TO -32768)   '@39a92
    REDIM A_17a6%(0 TO A_0f30%(0, 0), 0 TO 1)   '@39aa0
    L_BP2c! = 1.0   '@39ad1 DS:4450
    V_11c0! = 0.0   '@39ae1 DS:4458
L_39af8:
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP2c!)), 1) = 2.0) THEN GOTO L_39b4a   '@39af8 DS:4464
    V_11c0! = FX##(V_11c0!) + 1.0   '@39b2c DS:4450
    GOTO L_39c02   '@39b42
L_39b4a:
    A_17a6%(RT_CINT%(FX##(L_BP2c!) - V_11c0!), 0) = RT_CINT%(INT(FX##(A_0f5e!(RT_CINT%(FX##(L_BP2c!)), 6)) * 100.0))   '@39b4a DS:445c
    A_17a6%(RT_CINT%(FX##(L_BP2c!) - V_11c0!), 1) = RT_CINT%(INT(FX##(A_0f5e!(RT_CINT%(FX##(L_BP2c!)), 7)) * 100.0))   '@39ba3 DS:445c
L_39c02:
    L_BP2c! = FX##(L_BP2c!) + 1.0   '@39c02 DS:4450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0f30%(0, 0) < L_BP2c!) THEN GOTO L_39af8   '@39c16
    A_17a6%(0, 0) = RT_CINT%(FX##(L_BP2c!) - 1.0 - V_11c0!)   '@39c43 DS:4460
    GOTO L_3abe3   '@39c72
L_39c7f:
    V_11ec! = 0.0   '@39c7f DS:4458
    L_BP30! = A_17a6%(0, 0)   '@39c90
    FOR V_11b8! = 1.0 TO L_BP30!   '@39cb4 DS:4450
    IF NOT (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) <= V_259e! AND (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) >= V_2596! AND (A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) <= V_259a! AND A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) >= V_2592!))) THEN GOTO L_39eb7   '@39cbc
    V_0e0c$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@39db2
    L_BP34! = (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! - LEN(V_0e0c$) * 4 + V_2582!   '@39dea
    L_BP38! = 165.0 - (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@39e3c DS:44c8
    L_BP3c$ = "CGA"   '@39e76 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP34!, L_BP38!, V_0e0c$, L_BP3c$)   '@39e83
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @39e98 libera strings locais (L_BP3c)
    V_11ec! = 1.0   '@39ea1 DS:4450
L_39eb7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@39eb7 DS:4450
    L_BP3e% = (V_11ec! = 0.0)   '@39ee2 DS:4458
    IF NOT ((V_0e18$ = "TODOS" OR L_BP3e%) <> 0) THEN GOTO L_39f28   '@39f0b DS:44d4
    GOTO L_3abe3   '@39f20
L_39f28:
    L_BP20! = 10.0   '@39f28 DS:448e
L_39f3d:
    LOCATE 24, 1   '@39f42
    PRINT " "; RT_TAB$(79); ""; ""   '@39f5d DS:44aa,44de
    LOCATE 25, 1   '@39f86
    PRINT " "; RT_TAB$(79); ""; "";   '@39fa1 DS:44aa,44de
    LOCATE 24, 1   '@39fca
    PRINT " Numero ou Nome da Laje *FIM* ";   '@39fe5 DS:44e4
    CALL MIXT_07f1_LimpaTeclado   '@39ff3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@39ffd DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_3a034   '@3a017
    GOTO L_3abe3   '@3a02c
L_3a034:
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3a07a   '@3a034 DS:4506
    V_11b8! = VAL(V_0e0c$)   '@3a058
    GOTO L_3a124   '@3a072
L_3a07a:
    L_BP42! = A_17a6%(0, 0)   '@3a07a
    FOR V_11b8! = 1.0 TO L_BP42!   '@3a09e DS:4450
    IF NOT (UCASE$(V_0e0c$) = UCASE$(V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!))))) THEN GOTO L_3a0f7   '@3a0a6
    GOTO L_3a11f   '@3a0ef
L_3a0f7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3a0f7 DS:4450
L_3a11f:
L_3a124:
    L_BP44% = (V_11b8! < 1.0)   '@3a124 DS:4450
    IF NOT ((A_17a6%(0, 0) < V_11b8! OR (INT(FX##(V_11b8!)) <> FX##(V_11b8!) OR L_BP44%)) <> 0) THEN GOTO L_3a1af   '@3a14f
    BEEP   '@3a19d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_39f3d   '@3a1a7
L_3a1af:
    IF NOT (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) > V_259e! OR (A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) < V_2596! OR (A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) > V_259a! OR A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) < V_2592!))) THEN GOTO L_3a2b7   '@3a1af
    BEEP   '@3a2a5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_39f3d   '@3a2af
L_3a2b7:
    V_0e0c$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@3a2b7
    L_BP48! = (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! - LEN(V_0e0c$) * 4 + V_2582!   '@3a2ef
    L_BP4c! = 165.0 - (FX##(A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@3a341 DS:44c8
    L_BP50$ = "~" + V_0e0c$   '@3a37b DS:450e
    L_BP54$ = "CGA"   '@3a392 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP48!, L_BP4c!, L_BP50$, L_BP54$)   '@3a39f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3a3b4 libera strings locais (L_BP50)
    ' @3a3bd libera strings locais (L_BP54)
    V_11d4! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 0)   '@3a3c6
    V_11d8! = A_17a6%(RT_CINT%(FX##(V_11b8!)), 1)   '@3a3f4
    V_0e10$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + V_11b8!)))   '@3a423
L_3a460:
    LOCATE 25, 1   '@3a465
    PRINT " <"; CHR$(24); ">  <"; CHR$(25); ">  <"; CHR$(26); ">  <"; CHR$(27); ">  Movimenta    <Enter> Fixa    <P>asso"; RT_TAB$(79); ""; "";   '@3a480 DS:44aa,4514,451a,4522
L_3a50e:
    RT_GCAIXA RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - LEN(V_0e10$) * 4 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + LEN(V_0e10$) * 8), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@3a513 DS:44c8,454e
    L_BP58! = (FX##(V_11d4!) - V_2592!) * V_258a! - LEN(V_0e10$) * 4 + V_2582!   '@3a5e9
    L_BP5c! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3a61e DS:44c8
    L_BP60$ = "CGA"   '@3a63a DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP58!, L_BP5c!, V_0e10$, L_BP60$)   '@3a647
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3a65c libera strings locais (L_BP60)
    V_0e0c$ = ""   '@3a665 DS:44aa
L_3a67c:
    V_0e0c$ = RT_INKEY$   '@3a67c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_3a67c   '@3a690 DS:44aa
    L_BP24! = V_11d4!   '@3a6a4
    L_BP28! = V_11d8!   '@3a6b4
    L_BP64$ = V_0e0c$   '@3a6c4
    IF NOT (L_BP64$ <> "4") THEN GOTO L_3a714   '@3a6d6 DS:4552
    IF NOT (CHR$(0) + CHR$(75) = L_BP64$) THEN GOTO L_3a74b   '@3a6ed
L_3a714:
    L_BP68! = FX##(V_11d4!) - L_BP20!   '@3a714
    CALL MIXT_082a_Maior(V_2592!, L_BP68!, L_BP6c!)   '@3a728
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24! = L_BP6c!   '@3a73a
    GOTO L_3ab2c   '@3a743
L_3a74b:
    IF NOT (L_BP64$ <> "6") THEN GOTO L_3a784   '@3a74b DS:4558
    IF NOT (CHR$(0) + CHR$(77) = L_BP64$) THEN GOTO L_3a7bb   '@3a75d
L_3a784:
    L_BP70! = FX##(L_BP20!) + V_11d4!   '@3a784
    CALL MIXT_0877_Menor(V_259a!, L_BP70!, L_BP74!)   '@3a798
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24! = L_BP74!   '@3a7aa
    GOTO L_3ab2c   '@3a7b3
L_3a7bb:
    IF NOT (L_BP64$ <> "8") THEN GOTO L_3a7f4   '@3a7bb DS:455e
    IF NOT (CHR$(0) + CHR$(72) = L_BP64$) THEN GOTO L_3a82b   '@3a7cd
L_3a7f4:
    L_BP78! = FX##(L_BP20!) + V_11d8!   '@3a7f4
    CALL MIXT_0877_Menor(V_259e!, L_BP78!, L_BP7c!)   '@3a808
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28! = L_BP7c!   '@3a81a
    GOTO L_3ab2c   '@3a823
L_3a82b:
    IF NOT (L_BP64$ <> "2") THEN GOTO L_3a864   '@3a82b DS:4564
    IF NOT (CHR$(0) + CHR$(80) = L_BP64$) THEN GOTO L_3a89d   '@3a83d
L_3a864:
    L_BP80! = FX##(V_11d8!) - L_BP20!   '@3a864
    CALL MIXT_082a_Maior(V_2596!, L_BP80!, L_BP84!)   '@3a878
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28! = L_BP84!   '@3a88b
    GOTO L_3ab2c   '@3a895
L_3a89d:
    IF NOT (CHR$(13) = L_BP64$) THEN GOTO L_3a926   '@3a89d
    A_17a6%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(V_11d4!))   '@3a8b5
    A_17a6%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(V_11d8!))   '@3a8e5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_39f3d   '@3a916
L_3a926:
    IF NOT (L_BP64$ <> "P") THEN GOTO L_3a94a   '@3a926 DS:4472
    IF NOT (L_BP64$ = "p") THEN GOTO L_3ab2c   '@3a938 DS:456a
L_3a94a:
    LOCATE 25, 1   '@3a94a
    PRINT " "; RT_TAB$(79); ""; "";   '@3a965 DS:44aa,44de
    LOCATE 25, 1   '@3a98e
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP20!)); "* ";   '@3a9a9 DS:4570,4586
    CALL MIXT_07f1_LimpaTeclado   '@3a9d7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@3a9e1 DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3aa9d   '@3a9fb DS:4506
    L_BP86% = (FX##(VAL(V_0e0c$)) < FX##(V_259e!) - V_2596!)   '@3aa1f
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_259a!) - V_2592! AND L_BP86%) <> 0) THEN GOTO L_3aa98   '@3aa5d
    L_BP20! = VAL(V_0e0c$)   '@3aa7f
L_3aa98:
L_3aa9d:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - LEN(V_0e10$) * 4 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3aa9d DS:44c8,454e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3a460   '@3ab1c
L_3ab2c:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - LEN(V_0e10$) * 4 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3ab2c DS:44c8,454e
    V_11d4! = L_BP24!   '@3abab
    V_11d8! = L_BP28!   '@3abbb
    V_256c% = 0   '@3abcb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3a50e   '@3abd6
L_3abe3:
    ' @3abe3 libera strings locais (L_BP64)
    ERASE L_BP1c%   '@3abec
    ' END SUB   '@3abf5
END SUB

SUB S_3ac05   ' entrada de SUB/FUNCTION (B$ENRA, locais 132 bytes) (0x3ac05)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP44$
    DIM L_BP46%
    DIM L_BP4a!
    DIM L_BP4c%
    DIM L_BP50!
    DIM L_BP54!
    DIM L_BP58$
    DIM L_BP5c$
    DIM L_BP60!
    DIM L_BP64!
    DIM L_BP68$
    DIM L_BP6c$
    DIM L_BP70!
    DIM L_BP74!
    DIM L_BP78!
    DIM L_BP7c!
    DIM L_BP80!
    DIM L_BP84!
    DIM L_BP88!
    DIM L_BP8c!
    DIM L_BP8e%
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_3000_ac05 @0x3ac05  (03ac05_FUN_3000_ac05.lift.txt; evidence_id (assembly): ev_741a33eb5c1cf24cbe816a9172965bcd5c4f8e003ddd7f9b322c58ff42895425)
    REDIM L_BP1c%(0 TO 700)   '@3ac0d
    IF NOT (V_0e0c$ = "INICIAL") THEN GOTO L_3b01a   '@3ac2f DS:44bc
    REDIM A_174a%(-32768 TO -32768, -32768 TO -32768)   '@3ac46
    REDIM A_174a%(0 TO CINT(A_15da!(0, 0)), 0 TO 1)   '@3ac54
    L_BP2c! = A_15da!(0, 0)   '@3ac8c
    FOR V_11b8! = 1.0 TO L_BP2c!   '@3acac DS:4450
    IF NOT (A_15ac%(RT_CINT%(FX##(V_11b8!))) <= 0) THEN GOTO L_3ace3   '@3acb4
    GOTO L_3afdd   '@3acdb
L_3ace3:
    V_11ec! = -V_11b8!   '@3ace3
    CALL S_22ee1   '@3acf7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_3ae18   '@3ad01
    A_174a%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 1)) / 2.0 + V_11d4!)   '@3ad3f DS:4464
    A_174a%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 1)) / 2.0 + V_11d8!)   '@3ada7 DS:4464
    GOTO L_3afd8   '@3ae10
L_3ae18:
    L_BP30! = A_16ee!(1, 0)   '@3ae18
    V_11c0! = A_16ee!(1, 1)   '@3ae3a
    L_BP34! = A_16ee!(0, 0)   '@3ae5b
    FOR V_11ec! = 2.0 TO L_BP34!   '@3ae7b DS:4450,4464
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 0) > L_BP30!) THEN GOTO L_3aede   '@3ae82
    L_BP30! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 0)   '@3aeb5
L_3aede:
    IF NOT (A_16ee!(RT_CINT%(FX##(V_11ec!)), 1) > V_11c0!) THEN GOTO L_3af3e   '@3aede
    V_11c0! = A_16ee!(RT_CINT%(FX##(V_11ec!)), 1)   '@3af13
L_3af3e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@3af3e DS:4450
    A_174a%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP30!) + V_11d4!)   '@3af69
    A_174a%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(V_11d8!) + V_11c0!)   '@3af9d
L_3afd8:
L_3afdd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3afe2 DS:4450
    GOTO L_3bedd   '@3b00d
L_3b01a:
    V_11ec! = 0.0   '@3b01a DS:4458
    L_BP38! = A_15da!(0, 0)   '@3b02b
    FOR V_11b8! = 1.0 TO L_BP38!   '@3b04b DS:4450
    IF NOT (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) <= V_259e! AND (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) >= V_2596! AND (A_174a%(RT_CINT%(FX##(V_11b8!)), 0) <= V_259a! AND A_174a%(RT_CINT%(FX##(V_11b8!)), 0) >= V_2592!))) THEN GOTO L_3b232   '@3b052
    V_0e0c$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@3b148
    L_BP3c! = (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!   '@3b17a
    L_BP40! = 165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@3b1b7 DS:44c8
    L_BP44$ = "CGA"   '@3b1f1 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP3c!, L_BP40!, V_0e0c$, L_BP44$)   '@3b1fe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3b213 libera strings locais (L_BP44)
    V_11ec! = 1.0   '@3b21c DS:4450
L_3b232:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3b232 DS:4450
    L_BP46% = (V_11ec! = 0.0)   '@3b25d DS:4458
    IF NOT ((V_0e18$ = "TODOS" OR L_BP46%) <> 0) THEN GOTO L_3b2a3   '@3b286 DS:44d4
    GOTO L_3bedd   '@3b29b
L_3b2a3:
    L_BP20! = 20.0   '@3b2a3 DS:4496
L_3b2b8:
    LOCATE 24, 1   '@3b2bd
    PRINT " "; RT_TAB$(79); ""; ""   '@3b2d8 DS:44aa,44de
    LOCATE 25, 1   '@3b301
    PRINT " "; RT_TAB$(79); ""; "";   '@3b31c DS:44aa,44de
    LOCATE 24, 1   '@3b345
    PRINT " Numero ou Nome do Pilar *FIM* ";   '@3b360 DS:458c
    CALL MIXT_07f1_LimpaTeclado   '@3b36e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@3b378 DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_3b3af   '@3b392
    GOTO L_3bedd   '@3b3a7
L_3b3af:
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3b3f5   '@3b3af DS:4506
    V_11b8! = VAL(V_0e0c$)   '@3b3d3
    GOTO L_3b494   '@3b3ed
L_3b3f5:
    L_BP4a! = A_15da!(0, 0)   '@3b3f5
    FOR V_11b8! = 1.0 TO L_BP4a!   '@3b415 DS:4450
    IF NOT (UCASE$(V_0e0c$) = UCASE$(A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!)))))) THEN GOTO L_3b467   '@3b41c
    GOTO L_3b48f   '@3b45f
L_3b467:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3b467 DS:4450
L_3b48f:
L_3b494:
    L_BP4c% = (V_11b8! < 1.0)   '@3b494 DS:4450
    IF NOT ((A_15da!(0, 0) < V_11b8! OR (INT(FX##(V_11b8!)) <> FX##(V_11b8!) OR L_BP4c%)) <> 0) THEN GOTO L_3b519   '@3b4bf
    BEEP   '@3b507
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b2b8   '@3b511
L_3b519:
    IF NOT (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) > V_259e! OR (A_174a%(RT_CINT%(FX##(V_11b8!)), 1) < V_2596! OR (A_174a%(RT_CINT%(FX##(V_11b8!)), 0) > V_259a! OR A_174a%(RT_CINT%(FX##(V_11b8!)), 0) < V_2592!))) THEN GOTO L_3b621   '@3b519
    BEEP   '@3b60f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b2b8   '@3b619
L_3b621:
    V_0e0c$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@3b621
    L_BP50! = (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 0)) - V_2592!) * V_258a! + V_2582!   '@3b653
    L_BP54! = 165.0 - (FX##(A_174a%(RT_CINT%(FX##(V_11b8!)), 1)) - V_2596!) * V_258e!   '@3b690 DS:44c8
    L_BP58$ = "~" + V_0e0c$   '@3b6ca DS:450e
    L_BP5c$ = "CGA"   '@3b6e1 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP50!, L_BP54!, L_BP58$, L_BP5c$)   '@3b6ee
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3b703 libera strings locais (L_BP58)
    ' @3b70c libera strings locais (L_BP5c)
    V_11d4! = A_174a%(RT_CINT%(FX##(V_11b8!)), 0)   '@3b715
    V_11d8! = A_174a%(RT_CINT%(FX##(V_11b8!)), 1)   '@3b743
    V_0e10$ = A_143a$(A_15ac%(RT_CINT%(FX##(V_11b8!))))   '@3b772
L_3b7a9:
    LOCATE 25, 1   '@3b7ae
    PRINT " <"; CHR$(24); ">  <"; CHR$(25); ">  <"; CHR$(26); ">  <"; CHR$(27); ">  Movimenta    <Enter> Fixa    <P>asso"; RT_TAB$(79); ""; "";   '@3b7c9 DS:44aa,4514,451a,4522
L_3b857:
    RT_GCAIXA RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + LEN(V_0e10$) * 8), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@3b85c DS:44c8,454e
    L_BP60! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3b91d
    L_BP64! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3b93d DS:44c8
    L_BP68$ = "CGA"   '@3b959 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP60!, L_BP64!, V_0e10$, L_BP68$)   '@3b966
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3b97b libera strings locais (L_BP68)
    V_0e0c$ = ""   '@3b984 DS:44aa
L_3b99c:
    V_0e0c$ = RT_INKEY$   '@3b99c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_3b99c   '@3b9b0 DS:44aa
    L_BP24! = V_11d4!   '@3b9c4
    L_BP28! = V_11d8!   '@3b9d4
    L_BP6c$ = V_0e0c$   '@3b9e4
    IF NOT (L_BP6c$ <> "4") THEN GOTO L_3ba34   '@3b9f6 DS:4552
    IF NOT (CHR$(0) + CHR$(75) = L_BP6c$) THEN GOTO L_3ba6b   '@3ba0d
L_3ba34:
    L_BP70! = FX##(V_11d4!) - L_BP20!   '@3ba34
    CALL MIXT_082a_Maior(V_2592!, L_BP70!, L_BP74!)   '@3ba48
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24! = L_BP74!   '@3ba5a
    GOTO L_3be3b   '@3ba63
L_3ba6b:
    IF NOT (L_BP6c$ <> "6") THEN GOTO L_3baa4   '@3ba6b DS:4558
    IF NOT (CHR$(0) + CHR$(77) = L_BP6c$) THEN GOTO L_3badb   '@3ba7d
L_3baa4:
    L_BP78! = FX##(L_BP20!) + V_11d4!   '@3baa4
    CALL MIXT_0877_Menor(V_259a!, L_BP78!, L_BP7c!)   '@3bab8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24! = L_BP7c!   '@3baca
    GOTO L_3be3b   '@3bad3
L_3badb:
    IF NOT (L_BP6c$ <> "8") THEN GOTO L_3bb14   '@3badb DS:455e
    IF NOT (CHR$(0) + CHR$(72) = L_BP6c$) THEN GOTO L_3bb4d   '@3baed
L_3bb14:
    L_BP80! = FX##(L_BP20!) + V_11d8!   '@3bb14
    CALL MIXT_0877_Menor(V_259e!, L_BP80!, L_BP84!)   '@3bb28
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28! = L_BP84!   '@3bb3b
    GOTO L_3be3b   '@3bb45
L_3bb4d:
    IF NOT (L_BP6c$ <> "2") THEN GOTO L_3bb86   '@3bb4d DS:4564
    IF NOT (CHR$(0) + CHR$(80) = L_BP6c$) THEN GOTO L_3bbc1   '@3bb5f
L_3bb86:
    L_BP88! = FX##(V_11d8!) - L_BP20!   '@3bb86
    CALL MIXT_082a_Maior(V_2596!, L_BP88!, L_BP8c!)   '@3bb9b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP28! = L_BP8c!   '@3bbaf
    GOTO L_3be3b   '@3bbb9
L_3bbc1:
    IF NOT (CHR$(13) = L_BP6c$) THEN GOTO L_3bc4a   '@3bbc1
    A_174a%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(V_11d4!))   '@3bbd9
    A_174a%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(V_11d8!))   '@3bc09
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b2b8   '@3bc3a
L_3bc4a:
    IF NOT (L_BP6c$ <> "P") THEN GOTO L_3bc6e   '@3bc4a DS:4472
    IF NOT (L_BP6c$ = "p") THEN GOTO L_3be3b   '@3bc5c DS:456a
L_3bc6e:
    LOCATE 25, 1   '@3bc6e
    PRINT " "; RT_TAB$(79); ""; "";   '@3bc89 DS:44aa,44de
    LOCATE 25, 1   '@3bcb2
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP20!)); "* ";   '@3bccd DS:4570,4586
    CALL MIXT_07f1_LimpaTeclado   '@3bcfb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@3bd05 DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3bdc1   '@3bd1f DS:4506
    L_BP8e% = (FX##(VAL(V_0e0c$)) < FX##(V_259e!) - V_2596!)   '@3bd43
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_259a!) - V_2592! AND L_BP8e%) <> 0) THEN GOTO L_3bdbc   '@3bd81
    L_BP20! = VAL(V_0e0c$)   '@3bda3
L_3bdbc:
L_3bdc1:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3bdc1 DS:44c8,454e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b7a9   '@3be2b
L_3be3b:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 8.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3be3b DS:44c8,454e
    V_11d4! = L_BP24!   '@3bea5
    V_11d8! = L_BP28!   '@3beb5
    V_256c% = 0   '@3bec5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3b857   '@3bed0
L_3bedd:
    ' @3bedd libera strings locais (L_BP6c)
    ERASE L_BP1c%   '@3bee6
    ' END SUB   '@3beef
END SUB

SUB S_3beff   ' entrada de SUB/FUNCTION (B$ENRA, locais 240 bytes) (0x3beff)
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30!
    DIM L_BP34!
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
    DIM L_BPb0$
    DIM L_BPb2%
    DIM L_BPb6!
    DIM L_BPb8%
    DIM L_BPbc$
    DIM L_BPc0$
    DIM L_BPc4!
    DIM L_BPc8!
    DIM L_BPcc!
    DIM L_BPd0$
    DIM L_BPd4$
    DIM L_BPd8!
    DIM L_BPdc!
    DIM L_BPe0!
    DIM L_BPe4!
    DIM L_BPe8!
    DIM L_BPec!
    DIM L_BPf0!
    DIM L_BPf4!
    DIM L_BPf6%
    DIM L_BPfa!
    REDIM L_BP1c%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_3000_beff @0x3beff  (03beff_FUN_3000_beff.lift.txt; evidence_id (assembly): ev_e653f5c2c8964c98155b97b64e32ce867d99c0b7da2131af07ea2451e1b480f9)
    REDIM L_BP1c%(0 TO 1300)   '@3bf07
    IF NOT (V_0e0c$ = "INICIAL") THEN GOTO L_3d17b   '@3bf2e DS:44bc
    REDIM A_1778%(-32768 TO -32768, -32768 TO -32768)   '@3bf45
    REDIM A_1778%(0 TO A_157e%(0), 0 TO 2)   '@3bf53
    L_BP50! = A_157e%(0)   '@3bf80
    FOR V_11b8! = 1.0 TO L_BP50!   '@3bfa3 DS:4450
    IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) = 0) THEN GOTO L_3bfd9   '@3bfaa
    GOTO L_3d13e   '@3bfd1
L_3bfd9:
    V_11c0! = -1.0   '@3bfd9 DS:4460
    L_BP54! = A_1664!(0, 0)   '@3bfea
    FOR L_BP58! = 1.0 TO L_BP54!   '@3c00a DS:4450
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(L_BP58!)), 4))) = FX##(V_11b8!)) THEN GOTO L_3cdb2   '@3c012
    IF NOT (V_11c0! = -1.0) THEN GOTO L_3c81e   '@3c04d DS:4460
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 1) = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)) THEN GOTO L_3c19e   '@3c068
    L_BP40! = 0.0   '@3c0b5 DS:4458
    L_BP5c! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3c0c5
    L_BP60! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3c0ee
    CALL MIXT_0877_Menor(L_BP5c!, L_BP60!, L_BP64!)   '@3c10e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 2) = L_BP60!   '@3c120
    A_1664!(RT_CINT%(FX##(L_BP58!)), 0) = L_BP5c!   '@3c141
    L_BP20! = L_BP64!   '@3c164
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3c16d
    GOTO L_3c808   '@3c196
L_3c19e:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 0) = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)) THEN GOTO L_3c2d7   '@3c19e
    L_BP40! = 90.0   '@3c1e7 DS:45b0
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3c1f7
    L_BP68! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3c21f
    L_BP6c! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3c249
    CALL MIXT_0877_Menor(L_BP68!, L_BP6c!, L_BP70!)   '@3c26c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 3) = L_BP6c!   '@3c27e
    A_1664!(RT_CINT%(FX##(L_BP58!)), 1) = L_BP68!   '@3c2a2
    L_BP24! = L_BP70!   '@3c2c6
    GOTO L_3c803   '@3c2cf
L_3c2d7:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 3) < A_1664!(RT_CINT%(FX##(L_BP58!)), 1) AND A_1664!(RT_CINT%(FX##(L_BP58!)), 2) < A_1664!(RT_CINT%(FX##(L_BP58!)), 0) OR A_1664!(RT_CINT%(FX##(L_BP58!)), 3) > A_1664!(RT_CINT%(FX##(L_BP58!)), 1) AND A_1664!(RT_CINT%(FX##(L_BP58!)), 2) > A_1664!(RT_CINT%(FX##(L_BP58!)), 0)) THEN GOTO L_3c602   '@3c2d7
    L_BP40! = ATN(ABS((FX##(A_1664!(RT_CINT%(FX##(L_BP58!)), 3)) - A_1664!(RT_CINT%(FX##(L_BP58!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(L_BP58!)), 2)) - A_1664!(RT_CINT%(FX##(L_BP58!)), 0))))   '@3c411
    L_BP74! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3c49d
    L_BP78! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3c4c6
    CALL MIXT_0877_Menor(L_BP74!, L_BP78!, L_BP7c!)   '@3c4e6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 2) = L_BP78!   '@3c4f8
    A_1664!(RT_CINT%(FX##(L_BP58!)), 0) = L_BP74!   '@3c519
    L_BP20! = L_BP7c!   '@3c53c
    L_BP80! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3c545
    L_BP84! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3c56f
    CALL MIXT_0877_Menor(L_BP80!, L_BP84!, L_BP88!)   '@3c593
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 3) = L_BP84!   '@3c5a7
    A_1664!(RT_CINT%(FX##(L_BP58!)), 1) = L_BP80!   '@3c5cc
    L_BP24! = L_BP88!   '@3c5f0
    GOTO L_3c7fe   '@3c5fa
L_3c602:
    L_BP40! = -ATN(ABS((FX##(A_1664!(RT_CINT%(FX##(L_BP58!)), 3)) - A_1664!(RT_CINT%(FX##(L_BP58!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(L_BP58!)), 2)) - A_1664!(RT_CINT%(FX##(L_BP58!)), 0))))   '@3c602
    L_BP8c! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3c691
    L_BP90! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3c6bb
    CALL MIXT_0877_Menor(L_BP8c!, L_BP90!, L_BP94!)   '@3c6dc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 2) = L_BP90!   '@3c6f1
    A_1664!(RT_CINT%(FX##(L_BP58!)), 0) = L_BP8c!   '@3c713
    L_BP20! = L_BP94!   '@3c737
    L_BP98! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3c741
    L_BP9c! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3c76c
    CALL MIXT_082a_Maior(L_BP98!, L_BP9c!, L_BPa0!)   '@3c790
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(L_BP58!)), 3) = L_BP9c!   '@3c7a5
    A_1664!(RT_CINT%(FX##(L_BP58!)), 1) = L_BP98!   '@3c7ca
    L_BP24! = L_BPa0!   '@3c7ef
L_3c7fe:
L_3c803:
L_3c808:
    V_11c0! = 0.0   '@3c808 DS:4458
L_3c81e:
    L_BPa4! = L_BP40!   '@3c81e
    IF NOT (L_BPa4! = 0.0) THEN GOTO L_3c9b9   '@3c82e DS:4458
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 0) < L_BP20!) THEN GOTO L_3c8a3   '@3c849
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3c87b
L_3c8a3:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 1) > L_BP24!) THEN GOTO L_3c8ff   '@3c8a3
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3c8d6
L_3c8ff:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 2) < L_BP20!) THEN GOTO L_3c955   '@3c8ff
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3c92f
L_3c955:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 3) > L_BP24!) THEN GOTO L_3c9b1   '@3c955
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3c988
L_3c9b1:
    GOTO L_3cdad   '@3c9b1
L_3c9b9:
    IF NOT (L_BPa4! = 90.0) THEN GOTO L_3cb3f   '@3c9ba DS:45b0
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 0) < L_BP20!) THEN GOTO L_3ca29   '@3c9cf
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3ca01
L_3ca29:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 1) < L_BP24!) THEN GOTO L_3ca85   '@3ca29
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3ca5c
L_3ca85:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 2) < L_BP20!) THEN GOTO L_3cadb   '@3ca85
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3cab5
L_3cadb:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 3) < L_BP24!) THEN GOTO L_3cb37   '@3cadb
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3cb0e
L_3cb37:
    GOTO L_3cdad   '@3cb37
L_3cb3f:
    IF NOT (L_BPa4! <= 0.0) THEN GOTO L_3cb6b   '@3cb40 DS:4458
    IF NOT (L_BPa4! < 90.0) THEN GOTO L_3cc7f   '@3cb56 DS:45b0
L_3cb6b:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 0) < L_BP20!) THEN GOTO L_3cbf3   '@3cb6b
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3cb9d
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3cbc5
L_3cbf3:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 2) < L_BP20!) THEN GOTO L_3cc77   '@3cbf3
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3cc23
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3cc49
L_3cc77:
    GOTO L_3cdad   '@3cc77
L_3cc7f:
    IF NOT (L_BPa4! < 0.0) THEN GOTO L_3cdad   '@3cc80 DS:4458
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 1) > L_BP24!) THEN GOTO L_3cd1e   '@3cc95
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 0)   '@3ccc8
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 1)   '@3ccf0
L_3cd1e:
    IF NOT (A_1664!(RT_CINT%(FX##(L_BP58!)), 3) > L_BP24!) THEN GOTO L_3cda5   '@3cd1e
    L_BP20! = A_1664!(RT_CINT%(FX##(L_BP58!)), 2)   '@3cd51
    L_BP24! = A_1664!(RT_CINT%(FX##(L_BP58!)), 3)   '@3cd77
L_3cda5:
    GOTO L_3cdad   '@3cda5
L_3cdad:
L_3cdb2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP58!   '@3cdb2 DS:4450
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP20!))   '@3cdda
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(L_BP24!))   '@3ce09
    L_BPa8! = L_BP40!   '@3ce39
    IF NOT (L_BPa8! = 0.0) THEN GOTO L_3cef7   '@3ce49 DS:4458
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP20!) + 20.0)   '@3ce64 DS:4496
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(L_BP24!) + 10.0)   '@3ce98 DS:448e
    A_1778%(RT_CINT%(FX##(V_11b8!)), 2) = 0   '@3cecd
    GOTO L_3d139   '@3ceef
L_3cef7:
    IF NOT (L_BPa8! = 90.0) THEN GOTO L_3cfb6   '@3cef8 DS:45b0
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP20!) - 10.0)   '@3cf0d DS:45b4
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(L_BP24!) + 20.0)   '@3cf41 DS:4496
    A_1778%(RT_CINT%(FX##(V_11b8!)), 2) = RT_CINT%(100.0# * FX##(V_0e04#) / 2.0#)   '@3cf76 DS:4478,45b8
    GOTO L_3d139   '@3cfae
L_3cfb6:
    IF NOT (L_BPa8! <= 0.0) THEN GOTO L_3cfe2   '@3cfb7 DS:4458
    IF NOT (L_BPa8! < 90.0) THEN GOTO L_3d085   '@3cfcd DS:45b0
L_3cfe2:
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP20!) + 20.0)   '@3cfe2 DS:4496
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(L_BP24!) + 20.0)   '@3d016 DS:4496
    A_1778%(RT_CINT%(FX##(V_11b8!)), 2) = RT_CINT%(FX##(L_BP40!) * 100.0)   '@3d04b DS:445c
    GOTO L_3d139   '@3d07d
L_3d085:
    IF NOT (L_BPa8! < 0.0) THEN GOTO L_3d139   '@3d086 DS:4458
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(L_BP20!) + 10.0)   '@3d09b DS:448e
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(L_BP24!))   '@3d0cf
    A_1778%(RT_CINT%(FX##(V_11b8!)), 2) = RT_CINT%(FX##(L_BP40!) * 100.0)   '@3d0ff DS:445c
    GOTO L_3d139   '@3d131
L_3d139:
L_3d13e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3d143 DS:4450
    GOTO L_3e536   '@3d16e
L_3d17b:
    V_11ec! = 0.0   '@3d17b DS:4458
    L_BPac! = A_157e%(0)   '@3d18c
    FOR V_11b8! = 1.0 TO L_BPac!   '@3d1b0 DS:4450
    IF NOT (A_157e%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_3d365   '@3d1b8
    GOSUB L_3dfdd   '@3d1df
    IF NOT (V_11d8! > V_259e! OR (V_11d8! < V_2596! OR (V_11d4! > V_259a! OR V_11d4! < V_2592!))) THEN GOTO L_3d268   '@3d1ec
    GOTO L_3d35b   '@3d260
L_3d268:
    GOSUB L_3e07e   '@3d268
    RT_LINE L_BP20!, L_BP24!, L_BP28!, L_BP2c!, 9, RT_CINT%(FX##(V_2576!)), 0   '@3d275
    RT_LINE 0, 0, L_BP30!, L_BP34!, 8, RT_CINT%(FX##(V_2576!)), 0   '@3d2b3
    V_0e10$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@3d2e0
    L_BPb0$ = "CGA"   '@3d312 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP20!, L_BP2c!, V_0e10$, L_BPb0$)   '@3d325
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3d33b libera strings locais (L_BPb0)
    V_11ec! = 1.0   '@3d345 DS:4450
L_3d35b:
L_3d365:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3d365 DS:4450
    L_BPb2% = (V_11ec! = 0.0)   '@3d391 DS:4458
    IF NOT ((V_0e18$ = "TODOS" OR L_BPb2%) <> 0) THEN GOTO L_3d3d9   '@3d3bb DS:44d4
    GOTO L_3e536   '@3d3d1
L_3d3d9:
    L_BP44! = 10.0   '@3d3d9 DS:448e
L_3d3ee:
    LOCATE 24, 1   '@3d3f3
    PRINT " "; RT_TAB$(79); ""; ""   '@3d40e DS:44aa,44de
    LOCATE 25, 1   '@3d437
    PRINT " "; RT_TAB$(79); ""; "";   '@3d452 DS:44aa,44de
    LOCATE 24, 1   '@3d47b
    PRINT " Numero ou Nome da Viga *FIM* ";   '@3d496 DS:45c0
    CALL MIXT_07f1_LimpaTeclado   '@3d4a4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@3d4ae DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_3d4e5   '@3d4c8
    GOTO L_3e536   '@3d4dd
L_3d4e5:
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3d52b   '@3d4e5 DS:4506
    V_11b8! = VAL(V_0e0c$)   '@3d509
    GOTO L_3d5cf   '@3d523
L_3d52b:
    L_BPb6! = A_157e%(0)   '@3d52b
    FOR V_11b8! = 1.0 TO L_BPb6!   '@3d54f DS:4450
    IF NOT (UCASE$(V_0e0c$) = UCASE$(A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!)))))) THEN GOTO L_3d5a1   '@3d556
    GOTO L_3d5ca   '@3d599
L_3d5a1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@3d5a1 DS:4450
L_3d5ca:
L_3d5cf:
    L_BPb8% = (V_11b8! < 1.0)   '@3d5cf DS:4450
    IF NOT ((A_157e%(0) < V_11b8! OR (INT(FX##(V_11b8!)) <> FX##(V_11b8!) OR L_BPb8%)) <> 0) THEN GOTO L_3d65b   '@3d5fb
    BEEP   '@3d649
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3d3ee   '@3d653
L_3d65b:
    GOSUB L_3dfdd   '@3d65b
    IF NOT (V_11d8! > V_259e! OR (V_11d8! < V_2596! OR (V_11d4! > V_259a! OR V_11d4! < V_2592!))) THEN GOTO L_3d6ee   '@3d668
    BEEP   '@3d6dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3d3ee   '@3d6e6
L_3d6ee:
    GOSUB L_3e07e   '@3d6ee
    V_0e10$ = A_122e$(A_157e%(RT_CINT%(FX##(V_11b8!))))   '@3d6fb
    L_BPbc$ = "~" + V_0e10$   '@3d72d DS:450e
    L_BPc0$ = "CGA"   '@3d74a DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP20!, L_BP2c!, L_BPbc$, L_BPc0$)   '@3d758
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3d76f libera strings locais (L_BPbc)
    ' @3d779 libera strings locais (L_BPc0)
    RT_LINE L_BP20!, L_BP24!, L_BP28!, L_BP2c!, 9, RT_CINT%(FX##(V_257e!)), 0   '@3d783
    RT_LINE 0, 0, L_BP30!, L_BP34!, 8, RT_CINT%(FX##(V_257e!)), 0   '@3d7c1
    L_BP48! = V_11d4!   '@3d7ee
    L_BP4c! = V_11d8!   '@3d7fe
L_3d813:
    LOCATE 25, 1   '@3d818
    PRINT " <"; CHR$(24); ">  <"; CHR$(25); ">  <"; CHR$(26); ">  <"; CHR$(27); ">  Movimenta    <Enter> Fixa    <P>asso"; RT_TAB$(79); ""; "";   '@3d833 DS:44aa,4514,451a,4522
L_3d8c1:
    L_BPc4! = 30.0   '@3d8c6 DS:44c8,45b4,45e2,45e6
    L_BPc8! = LEN(V_0e10$) * 8   '@3d925
    CALL MIXT_082a_Maior(L_BPc4!, L_BPc8!, L_BPcc!)   '@3d940
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GCAIXA RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - 10.0 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 20.0), RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + L_BPcc!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! + 10.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP1c%(1): RT_GFIM   '@3d955 DS:448e,44c8
    GOSUB L_3e07e   '@3d9ba
    RT_LINE L_BP20!, L_BP24!, L_BP28!, L_BP2c!, 9, RT_CINT%(FX##(V_2576!)), 0   '@3d9c7
    RT_LINE 0, 0, L_BP30!, L_BP34!, 8, RT_CINT%(FX##(V_2576!)), 0   '@3da05
    L_BPd0$ = "CGA"   '@3da32 DS:44cc
    CALL MIXT_08c4_TextoGrafico(L_BP20!, L_BP2c!, V_0e10$, L_BPd0$)   '@3da45
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @3da5b libera strings locais (L_BPd0)
    V_0e0c$ = ""   '@3da65 DS:44aa
L_3da7c:
    V_0e0c$ = RT_INKEY$   '@3da7c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0e0c$ = "" THEN GOTO L_3da7c   '@3da90 DS:44aa
    L_BP48! = V_11d4!   '@3daa4
    L_BP4c! = V_11d8!   '@3dab4
    L_BPd4$ = V_0e0c$   '@3dac4
    IF NOT (L_BPd4$ <> "4") THEN GOTO L_3db17   '@3dad7 DS:4552
    IF NOT (CHR$(0) + CHR$(75) = L_BPd4$) THEN GOTO L_3db52   '@3daef
L_3db17:
    L_BPd8! = FX##(V_11d4!) - L_BP44!   '@3db17
    CALL MIXT_082a_Maior(V_2592!, L_BPd8!, L_BPdc!)   '@3db2c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP48! = L_BPdc!   '@3db40
    GOTO L_3df36   '@3db4a
L_3db52:
    IF NOT (L_BPd4$ <> "6") THEN GOTO L_3db8d   '@3db52 DS:4558
    IF NOT (CHR$(0) + CHR$(77) = L_BPd4$) THEN GOTO L_3dbc8   '@3db65
L_3db8d:
    L_BPe0! = FX##(L_BP44!) + V_11d4!   '@3db8d
    CALL MIXT_0877_Menor(V_259a!, L_BPe0!, L_BPe4!)   '@3dba2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP48! = L_BPe4!   '@3dbb6
    GOTO L_3df36   '@3dbc0
L_3dbc8:
    IF NOT (L_BPd4$ <> "8") THEN GOTO L_3dc03   '@3dbc8 DS:455e
    IF NOT (CHR$(0) + CHR$(72) = L_BPd4$) THEN GOTO L_3dc3e   '@3dbdb
L_3dc03:
    L_BPe8! = FX##(L_BP44!) + V_11d8!   '@3dc03
    CALL MIXT_0877_Menor(V_259e!, L_BPe8!, L_BPec!)   '@3dc18
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4c! = L_BPec!   '@3dc2c
    GOTO L_3df36   '@3dc36
L_3dc3e:
    IF NOT (L_BPd4$ <> "2") THEN GOTO L_3dc79   '@3dc3e DS:4564
    IF NOT (CHR$(0) + CHR$(80) = L_BPd4$) THEN GOTO L_3dcb4   '@3dc51
L_3dc79:
    L_BPf0! = FX##(V_11d8!) - L_BP44!   '@3dc79
    CALL MIXT_082a_Maior(V_2596!, L_BPf0!, L_BPf4!)   '@3dc8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4c! = L_BPf4!   '@3dca2
    GOTO L_3df36   '@3dcac
L_3dcb4:
    IF NOT (CHR$(13) = L_BPd4$) THEN GOTO L_3dd3e   '@3dcb4
    A_1778%(RT_CINT%(FX##(V_11b8!)), 0) = RT_CINT%(FX##(V_11d4!))   '@3dccd
    A_1778%(RT_CINT%(FX##(V_11b8!)), 1) = RT_CINT%(FX##(V_11d8!))   '@3dcfd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3d3ee   '@3dd2e
L_3dd3e:
    IF NOT (L_BPd4$ <> "P") THEN GOTO L_3dd64   '@3dd3e DS:4472
    IF NOT (L_BPd4$ = "p") THEN GOTO L_3df36   '@3dd51 DS:456a
L_3dd64:
    LOCATE 25, 1   '@3dd64
    PRINT " "; RT_TAB$(79); ""; "";   '@3dd7f DS:44aa,44de
    LOCATE 25, 1   '@3dda8
    PRINT " Passo do cursor *"; LTRIM$(STR$(L_BP44!)); "* ";   '@3ddc3 DS:4570,4586
    CALL MIXT_07f1_LimpaTeclado   '@3ddf1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@3ddfb DS:44aa (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (VAL(V_0e0c$) > 0.0#) THEN GOTO L_3deb7   '@3de15 DS:4506
    L_BPf6% = (FX##(VAL(V_0e0c$)) < FX##(V_259e!) - V_2596!)   '@3de39
    IF NOT ((FX##(VAL(V_0e0c$)) < FX##(V_259a!) - V_2592! AND L_BPf6%) <> 0) THEN GOTO L_3deb2   '@3de77
    L_BP44! = VAL(V_0e0c$)   '@3de99
L_3deb2:
L_3deb7:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - 10.0 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 20.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3deb7 DS:44c8,45b4,45e2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3d813   '@3df26
L_3df36:
    RT_GPONTO RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! - 10.0 + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 20.0), 0: PUT (RG_GX1, RG_GY1), L_BP1c%(1), PSET: RT_GFIM   '@3df36 DS:44c8,45b4,45e2
    V_11d4! = L_BP48!   '@3dfa5
    V_11d8! = L_BP4c!   '@3dfb5
    V_256c% = 0   '@3dfc5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_3d8c1   '@3dfd0
    ' ---- F_3dfd8 @0x3dfd8  (03dfd8_F_3dfd8.lift.txt; evidence_id (assembly): ev_5a6999620d3692e218fedeefac7706a9e0c21a8ecf8888d1b25076eab7fefda4)
L_3dfdd:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03beff_FUN_3000_beff
    V_11d4! = A_1778%(RT_CINT%(FX##(V_11b8!)), 0)   '@3dfe2
    V_11d8! = A_1778%(RT_CINT%(FX##(V_11b8!)), 1)   '@3e010
    L_BP40! = FX##(A_1778%(RT_CINT%(FX##(V_11b8!)), 2)) / 100.0   '@3e03f DS:445c
    RETURN   '@3e06f
L_3e07e:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03beff_FUN_3000_beff
    L_BPfa! = INT(FX##(L_BP40!) * 100.0) / 100.0   '@3e083 DS:445c
    IF NOT (L_BPfa! = 0.0) THEN GOTO L_3e194   '@3e0a4 DS:4458
    L_BP20! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e0bf
    L_BP24! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 5.0   '@3e0de DS:44c8,45ea
    L_BP28! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e105
    L_BP2c! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e124 DS:44c8
    L_BP30! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + 20.0   '@3e146 DS:4496
    L_BP34! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e16a DS:44c8
    GOTO L_3e527   '@3e18c
L_3e194:
    IF NOT (INT(100.0# * FX##(V_0e04#) / 2.0#) / 100.0# = FX##(L_BPfa!)) THEN GOTO L_3e295   '@3e195 DS:4478,45b8
    L_BP20! = (FX##(V_11d4!) - V_2592!) * V_258a! - 10.0 + V_2582!   '@3e1c0 DS:45b4
    L_BP24! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e1e4 DS:44c8
    L_BP28! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e206
    L_BP2c! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e225 DS:44c8
    L_BP30! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e247
    L_BP34! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - 10.0   '@3e266 DS:44c8,45b4
    GOTO L_3e527   '@3e28d
L_3e295:
    IF NOT (L_BPfa! > 0.0) THEN GOTO L_3e3e9   '@3e296 DS:4458
    L_BP20! = V_2582! + ((FX##(V_11d4!) - V_2592!) * V_258a! - RT_COS##(FX##(V_0e04#) / 2.0# - L_BP40!) * 10.0#)   '@3e2ab DS:4478,45ee
    L_BP24! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - RT_SIN##(FX##(V_0e04#) / 2.0# - L_BP40!) * 2000.0# / 640.0#   '@3e2ed DS:4478,44c8,45f6,45fe
    L_BP28! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e334
    L_BP2c! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e353 DS:44c8
    L_BP30! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + RT_COS##(FX##(L_BP40!)) * 20.0   '@3e375 DS:4496
    L_BP34! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - RT_SIN##(FX##(L_BP40!)) * 4000.0 / 640.0   '@3e3a7 DS:44c8,4606,460a
    GOTO L_3e527   '@3e3e1
L_3e3e9:
    IF NOT (L_BPfa! < 0.0) THEN GOTO L_3e527   '@3e3ea DS:4458
    L_BP20! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + RT_SIN##(ABS(FX##(L_BP40!))) * 10.0   '@3e3ff DS:448e
    L_BP24! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! - RT_COS##(ABS(FX##(L_BP40!))) * 10.0   '@3e434 DS:448e,44c8
    L_BP28! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!   '@3e46c
    L_BP2c! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!   '@3e48b DS:44c8
    L_BP30! = (FX##(V_11d4!) - V_2592!) * V_258a! + V_2582! + RT_COS##(ABS(FX##(L_BP40!))) * 20.0   '@3e4ad DS:4496
    L_BP34! = 165.0 - (FX##(V_11d8!) - V_2596!) * V_258e! + RT_SIN##(ABS(FX##(L_BP40!))) * 4000.0 / 640.0   '@3e4e2 DS:44c8,4606,460a
    GOTO L_3e527   '@3e51f
L_3e527:
    RETURN   '@3e527
L_3e536:   ' entrada vinda de 03beff_FUN_3000_beff
    ' @3e536 libera strings locais (L_BPd4)
    ERASE L_BP1c%   '@3e540
    ' END SUB   '@3e549
END SUB

SUB S_3e559 (P_BP0a!, P_BP08!, P_BP06!)   ' entrada de SUB/FUNCTION (B$ENRA, locais 8 bytes) (0x3e559)
    DIM L_BP0e!
    DIM L_BP12!
    ' ---- FUN_3000_e559 @0x3e559  (03e559_FUN_3000_e559.lift.txt; evidence_id (assembly): ev_f0afd70345764ed4186af3df83687e12882f8b3ed9f1e133765c476ebff2cca0)
    IF NOT (A_1608!(0, 0) < P_BP0a!) THEN GOTO L_3e594   '@3e561
    GOTO L_3e937   '@3e58c
L_3e594:
    IF NOT (P_BP08! = 2.0 OR P_BP08! = 0.0) THEN GOTO L_3e783   '@3e594 DS:4458,4464
    L_BP0e! = A_17d4!(RT_CINT%(FX##(P_BP0a!)), 0)   '@3e5d1
    IF NOT (L_BP0e! = 0.0) THEN GOTO L_3e652   '@3e5fb DS:4458
    P_BP06! = A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e615
    GOTO L_3e77b   '@3e64a
L_3e652:
    IF NOT (L_BP0e! = -1.0) THEN GOTO L_3e6ef   '@3e653 DS:4460
    P_BP06! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 1))), 1)) * 1000.0)) / 10.0 + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e667 DS:4480,448e
    GOTO L_3e77b   '@3e6e7
L_3e6ef:
    IF NOT (L_BP0e! = -2.0) THEN GOTO L_3e75e   '@3e6f0 DS:4492
    P_BP06! = FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 7)) + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e704
    GOTO L_3e77b   '@3e756
L_3e75e:
    IF NOT (L_BP0e! = -3.0) THEN GOTO L_3e77b   '@3e75f DS:460e
    GOTO L_3e77b   '@3e773
L_3e77b:
    GOTO L_3e932   '@3e77b
L_3e783:
    L_BP12! = A_17d4!(RT_CINT%(FX##(P_BP0a!)), 3)   '@3e783
    IF NOT (L_BP12! = 0.0) THEN GOTO L_3e805   '@3e7ae DS:4458
    P_BP06! = A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e7c8
    GOTO L_3e92d   '@3e7fd
L_3e805:
    IF NOT (L_BP12! = -1.0) THEN GOTO L_3e8a1   '@3e806 DS:4460
    P_BP06! = FX##(RT_CINT%(FX##(A_0e78!(RT_CINT%(FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 4))), 0)) * 1000.0)) / 10.0 + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e81a DS:4480,448e
    GOTO L_3e92d   '@3e899
L_3e8a1:
    IF NOT (L_BP12! = -2.0) THEN GOTO L_3e910   '@3e8a2 DS:4492
    P_BP06! = FX##(A_17d4!(RT_CINT%(FX##(P_BP0a!)), 8)) + A_1608!(RT_CINT%(FX##(P_BP0a!)), RT_CINT%(FX##(P_BP08!)))   '@3e8b6
    GOTO L_3e92d   '@3e908
L_3e910:
    IF NOT (L_BP12! = -3.0) THEN GOTO L_3e92d   '@3e911 DS:460e
    GOTO L_3e92d   '@3e925
L_3e92d:
L_3e932:
L_3e937:
    ' END SUB   '@3e937
END SUB

SUB S_40187   ' entrada de SUB/FUNCTION (B$ENRA, locais 466 bytes) (0x40187)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1c%
    DIM L_BP20!
    DIM L_BP24!
    DIM L_BP28!
    DIM L_BP2c!
    DIM L_BP30$
    DIM L_BP32%
    DIM L_BP34%
    DIM L_BP36%
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46$
    DIM L_BP48%
    DIM L_BP4a%
    DIM L_BP4c%
    DIM L_BP4e%
    DIM L_BP52$
    DIM L_BP54%
    DIM L_BP58!
    DIM L_BP5c!
    DIM L_BP5e%
    DIM L_BP62!
    DIM L_BP66!
    DIM L_BP6a!
    DIM L_BP6e$
    DIM L_BP70%
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
    ' ---- FUN_4000_0187 @0x40187  (040187_FUN_4000_0187.lift.txt; evidence_id (assembly): ev_e70db831b90a698e7bb3d14c897bae4ccc823c4e3828e2e0a855ead8f22c1d61)
    L_BP0e! = V_2592!   '@40199
    L_BP12! = V_2596!   '@401a9
    L_BP16! = V_259a!   '@401b9
    L_BP1a! = V_259e!   '@401c9
    L_BP1c% = 0   '@401d9
L_401e8:
    RT_VIEWPRINT 23, 25   '@401ed
    RT_CLS 2   '@401ff
    PRINT " Visualizacao e Alteracao da Elevacao dos Elementos Estruturais na Forma"   '@4020d DS:4620
    PRINT " <C>ota basica de referenia      <L>ajes      <V>igas      <*R*>etorno"   '@4021b DS:466c
    PRINT " Atencao!  Dados de Elevacao nao serao alterados pela amarracao";   '@40229 DS:46b6
    CALL MIXT_07f1_LimpaTeclado   '@40237
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@40241
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP30$ = V_0e0c$   '@4025d
    IF NOT (L_BP30$ <> "C") THEN GOTO L_40298   '@4026f DS:46fa
    IF NOT (L_BP30$ = "c") THEN GOTO L_404cf   '@40286 DS:4700
L_40298:
L_4029d:
    RT_CLS 2   '@402a2
    PRINT " Tanto Lajes como Vigas serao amarradas relativamente a esta Cota Basica.";   '@402b0 DS:4706
    PRINT " Entre com o valor da Cota Baica (metros) tipo  100.0  ou  103.415"   '@402be DS:4754
    PRINT " Cota Basica *"; LTRIM$(STR$(A_1200!(1, 14, 4))); "* ";   '@402cc DS:479a,47ac
    CALL MIXT_07f1_LimpaTeclado   '@40313
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@4031d DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP32% = (LEN(V_0e0c$) = 0)   '@40337 DS:47b6
    L_BP34% = (VAL(V_0e0c$) = 0.0#)   '@40359
    L_BP36% = LEN(V_0e0c$) > 0 AND L_BP34%   '@40379
    IF NOT ((V_0e0c$ <> "0" AND L_BP36% OR L_BP32%) <> 0) THEN GOTO L_403b4   '@40394 DS:47be
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401e8   '@403ac
L_403b4:
    L_BP3a! = VAL(V_0e0c$)   '@403b4
    LOCATE 25, 1   '@403cd
    PRINT " Confirme mudar Cota Basica de "; LTRIM$(STR$(A_1200!(1, 14, 4))); " para "; LTRIM$(STR$(L_BP3a!)); " N/*S* ";   '@403e8 DS:47c4,47e8,47f2
    CALL MIXT_07f1_LimpaTeclado   '@4044f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@40459 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_40498   '@40473 DS:47fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4029d   '@40490
L_40498:
    A_1200!(1, 14, 4) = L_BP3a!   '@40498
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401e8   '@404bf
L_404cf:
    IF NOT (L_BP30$ <> "L") THEN GOTO L_404f3   '@404cf DS:4804
    IF NOT (L_BP30$ = "l") THEN GOTO L_40af4   '@404e1 DS:480a
L_404f3:
    IF NOT (L_BP1c% = 1) THEN GOTO L_40578   '@404f3
    V_2592! = L_BP0e!   '@40501
    V_2596! = L_BP12!   '@40511
    V_259a! = L_BP16!   '@40521
    V_259e! = L_BP1a!   '@40531
    CALL S_1fa3b   '@40541
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2193a   '@4054b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_212be   '@40555
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20f46   '@4055f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1c% = 0   '@40569
L_40578:
    RT_VIEWPRINT 1, 25   '@40578
    L_BP3a! = 1.0   '@4058a DS:4810
    V_11c0! = 0.0   '@4059a DS:4814
L_405b0:
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP3a!)), 1) = 2.0) THEN GOTO L_40602   '@405b0 DS:4818
    V_11c0! = FX##(V_11c0!) + 1.0   '@405e4 DS:4810
    GOTO L_4081e   '@405fa
L_40602:
    IF NOT (FX##(L_BP3a!) - V_11c0! = FX##(1.0)) THEN GOTO L_40661   '@40602 DS:4810
    V_0e0c$ = V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + 1.0)))   '@40621 DS:4810
    GOTO L_40721   '@40659
L_40661:
    V_0e0c$ = LTRIM$(STR$(A_0f5e!(RT_CINT%(FX##(L_BP3a!)), 3)))   '@40661
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP3a!)), 3) >= 0.0) THEN GOTO L_406fa   '@4069c DS:4814
    V_0e0c$ = CHR$(24) + V_0e0c$   '@406d0
    GOTO L_4071c   '@406f2
L_406fa:
    V_0e0c$ = CHR$(25) + V_0e0c$   '@406fa
L_4071c:
L_40721:
    IF NOT (A_0f5e!(RT_CINT%(FX##(L_BP3a!)), 3) <> 1.0) THEN GOTO L_40819   '@40721 DS:4810
    L_BP3e! = (FX##(A_17a6%(RT_CINT%(FX##(L_BP3a!) - V_11c0!), 0)) - V_2592!) * V_258a! - LEN(V_0e0c$) * 4 + V_2582!   '@40755
    L_BP42! = 165.0 - (FX##(A_17a6%(RT_CINT%(FX##(L_BP3a!) - V_11c0!), 1)) - V_2596!) * V_258e!   '@407ab DS:481c
    L_BP46$ = "CGA"   '@407e9 DS:4820
    CALL MIXT_08c4_TextoGrafico(L_BP3e!, L_BP42!, V_0e0c$, L_BP46$)   '@407f6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4080b libera strings locais (L_BP46)
L_40819:
L_4081e:
    L_BP3a! = FX##(L_BP3a!) + 1.0   '@4081e DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_0f30%(0, 0) < L_BP3a!) THEN GOTO L_405b0   '@40832
L_40864:
    RT_VIEWPRINT 23, 25   '@40869
    RT_CLS 2   '@4087b
    PRINT " O Alinhamento entre as Lajes e feito no proprio modulo de LAJES ."   '@40889 DS:4828
    PRINT " Veja acima a amarracao de cada Laje em relacao a Laje "; V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + 1.0))); " (cm)."   '@40897 DS:4810,486e,48aa
    PRINT " Cota Relativa da Laje "; V_0e6c$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e68!) + 1.0))); " em relacao a Cota Basica ("; CHR$(24); "+ cm) *"; LTRIM$(STR$(A_1200!(1, 14, 3))); "* ";   '@408dd DS:47ac,4810,48b4,48d0,48f0
    CALL MIXT_07f1_LimpaTeclado   '@40971
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@4097b DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP48% = (LEN(V_0e0c$) = 0)   '@40995 DS:47b6
    L_BP4a% = (VAL(V_0e0c$) = 0.0#)   '@409b7
    L_BP4c% = LEN(V_0e0c$) > 0 AND L_BP4a%   '@409d7
    IF NOT ((V_0e0c$ <> "0" AND L_BP4c% OR L_BP48%) <> 0) THEN GOTO L_40a12   '@409f2 DS:47be
    GOTO L_40ab7   '@40a0a
L_40a12:
    L_BP3a! = VAL(V_0e0c$)   '@40a12
    L_BP4e% = (ABS(FX##(L_BP3a!)) < 0.100000001490116119384765625##)   '@40a2b DS:48fc,4900
    IF NOT ((FX##(L_BP3a!) * 10.0 <> INT(FX##(L_BP3a!) * 10.0) OR L_BP4e%) <> 0) THEN GOTO L_40a8e   '@40a57 DS:4900
    BEEP   '@40a7c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40864   '@40a86
L_40a8e:
    A_1200!(1, 14, 3) = L_BP3a!   '@40a8e
L_40ab7:
    CALL S_1fa3b   '@40abc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2193a   '@40ac6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_212be   '@40ad0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20f46   '@40ada
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401e8   '@40ae4
L_40af4:
    IF NOT (L_BP30$ <> "V") THEN GOTO L_40b18   '@40af4 DS:4904
    IF NOT (L_BP30$ = "v") THEN GOTO L_41d33   '@40b06 DS:490a
L_40b18:
L_40b1d:
    RT_VIEWPRINT 23, 25   '@40b22
    RT_CLS 2   '@40b34
    PRINT " Alinhamento das Vigas Continuas"   '@40b42 DS:4910
    PRINT " alinha  face <S>uperior    face <I>nferior    <V>iga / Tramo    <*R*>etorna";   '@40b50 DS:4934
    PRINT " acione Viga / Tramo para visualizar a cota relativa de cada Viga / Tramo";   '@40b5e DS:4984
    CALL MIXT_07f1_LimpaTeclado   '@40b6c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@40b76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52$ = V_0e0c$   '@40b92
    IF NOT (L_BP52$ <> "S") THEN GOTO L_40bcd   '@40ba4 DS:49d2
    IF NOT (L_BP52$ = "s") THEN GOTO L_40ea0   '@40bbb DS:49d8
L_40bcd:
    RT_CLS 2   '@40bcd
    PRINT " Alinhamento das Vigas pela face Superior"   '@40bdb DS:49de
    PRINT " Cota das Vigas em relacao a Cota Basica "; LTRIM$(STR$(A_1200!(1, 14, 4))); " ("; CHR$(24); "+ cm) *RETORNA* ";   '@40be9 DS:4a0c,4a3a,4a40
    CALL MIXT_07f1_LimpaTeclado   '@40c48
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@40c52 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_40c89   '@40c6c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@40c81
L_40c89:
    L_BP3a! = VAL(V_0e0c$)   '@40c89
    L_BP54% = (ABS(FX##(L_BP3a!)) < 0.100000001490116119384765625##)   '@40ca2 DS:48fc,4900
    IF NOT ((FX##(L_BP3a!) * 10.0 <> INT(FX##(L_BP3a!) * 10.0) OR L_BP54%) <> 0) THEN GOTO L_40d05   '@40cce DS:4900
    BEEP   '@40cf3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@40cfd
L_40d05:
    PRINT " Confirme Alinhar todas as Vigas pela face Superior  S/*N* ";   '@40d05 DS:4a54
    CALL MIXT_07f1_LimpaTeclado   '@40d13
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@40d1d DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "S") THEN GOTO L_40e90   '@40d37 DS:49d2
    L_BP58! = A_1200!(0, 0, 0)   '@40d54
    FOR V_11e4! = 1.0 TO L_BP58!   '@40d75 DS:4810
    L_BP5c! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@40d7c
    FOR V_11c0! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP5c!   '@40dcd DS:4810
    A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11c0!)), 2) = L_BP3a!   '@40df8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@40e2d DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@40e55 DS:4810
    V_256a% = 1   '@40e80
L_40e90:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@40e90
L_40ea0:
    IF NOT (L_BP52$ <> "I") THEN GOTO L_40ec4   '@40ea0 DS:4a94
    IF NOT (L_BP52$ = "i") THEN GOTO L_411c5   '@40eb2 DS:4a9a
L_40ec4:
    RT_CLS 2   '@40ec4
    PRINT " Alinhamento das Vigas pela face Inferior"   '@40ed2 DS:4aa0
    PRINT " Cota das Vigas em relacao a Cota Basica "; LTRIM$(STR$(A_1200!(1, 14, 4))); " ("; CHR$(24); "+ cm) *RETORNA* ";   '@40ee0 DS:4a0c,4a3a,4a40
    CALL MIXT_07f1_LimpaTeclado   '@40f3f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@40f49 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_40f80   '@40f63
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@40f78
L_40f80:
    L_BP3a! = VAL(V_0e0c$)   '@40f80
    L_BP5e% = (ABS(FX##(L_BP3a!)) < 0.100000001490116119384765625##)   '@40f99 DS:48fc,4900
    IF NOT ((FX##(L_BP3a!) * 10.0 <> INT(FX##(L_BP3a!) * 10.0) OR L_BP5e%) <> 0) THEN GOTO L_40ffc   '@40fc5 DS:4900
    BEEP   '@40fea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@40ff4
L_40ffc:
    PRINT " Confirme Alinhar todas as Vigas pela face Inferior  S/*N* ";   '@40ffc DS:4ace
    CALL MIXT_07f1_LimpaTeclado   '@4100a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@41014 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "S") THEN GOTO L_411b5   '@4102e DS:49d2
    L_BP62! = A_1200!(0, 0, 0)   '@4104b
    FOR V_11e4! = 1.0 TO L_BP62!   '@4106c DS:4810
    L_BP66! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@41074
    FOR V_11c0! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP66!   '@410c5 DS:4810
    A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11c0!)), 2) = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11c0!)), 1)) + L_BP3a!   '@410f0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@4114f DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@4117a DS:4810
    V_256a% = 1   '@411a5
L_411b5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@411b5
L_411c5:
    IF NOT (L_BP52$ <> "V") THEN GOTO L_411e9   '@411c5 DS:4904
    IF NOT (L_BP52$ = "v") THEN GOTO L_41d1e   '@411d7 DS:490a
L_411e9:
L_411ee:
    RT_CLS 2   '@411f3
    PRINT " Alinhamento das Vigas pela face Superior tramo a tramo."   '@41201 DS:4b0e
    PRINT " Nome da Viga *FIM* ";   '@4120f DS:4b4a
    CALL MIXT_07f1_LimpaTeclado   '@4121d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@41227 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_412e8   '@41241
    IF NOT (L_BP1c% = 1) THEN GOTO L_412db   '@41256
    V_2592! = L_BP0e!   '@41264
    V_2596! = L_BP12!   '@41274
    V_259a! = L_BP16!   '@41284
    V_259e! = L_BP1a!   '@41294
    CALL S_1fa3b   '@412a4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2193a   '@412ae
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_212be   '@412b8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20f46   '@412c2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1c% = 0   '@412cc
L_412db:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40b1d   '@412db
L_412e8:
    L_BP6a! = A_1200!(0, 0, 0)   '@412e8
    FOR V_11e4! = 1.0 TO L_BP6a!   '@41309 DS:4810
    IF NOT (UCASE$(V_0e0c$) = UCASE$(A_122e$(RT_CINT%(FX##(V_11e4!))))) THEN GOTO L_4134f   '@41310
    GOTO L_41377   '@41347
L_4134f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@4134f DS:4810
L_41377:
    IF NOT (A_1200!(0, 0, 0) < V_11e4!) THEN GOTO L_413b4   '@41377
    BEEP   '@413a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@413ac
L_413b4:
    LOCATE 24, 1   '@413b4
    PRINT " Confirme alterar elevacao da Viga "; A_122e$(RT_CINT%(FX##(V_11e4!))); "  N/*S* ";   '@413cf DS:4b62,4b8a
    CALL MIXT_07f1_LimpaTeclado   '@41403
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@4140d DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_4144c   '@41427 DS:47fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@41444
L_4144c:
    GOSUB L_41dc0   '@4144c
    LOCATE 23, 1   '@41459
    PRINT " Alinhamento das Vigas pela face Superior tramo a tramo."   '@41474 DS:4b0e
    LOCATE 24, 1   '@41482
    V_0e14$ = " (tramos" + STR$(RT_SNG!(1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)))) + " a" + STR$(RT_SNG!(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2))) + ")"   '@4149d DS:4810,4b96,4ba2,4ba8
    PRINT " Alteracao da elevacao da Viga "; A_122e$(RT_CINT%(FX##(V_11e4!))); V_0e14$; RT_TAB$(79); ""; ""   '@4155c DS:47b2,4bae
    LOCATE 25, 1   '@415ab
    PRINT " <T>odos os tramos serao modificados    <E>scolhe o tramo    <*R*>etorna";   '@415c6 DS:4bd2
    CALL MIXT_07f1_LimpaTeclado   '@415d4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@415de
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP6e$ = V_0e0c$   '@415fa
    IF NOT (L_BP6e$ <> "T") THEN GOTO L_41635   '@4160c DS:4c1e
    IF NOT (L_BP6e$ = "t") THEN GOTO L_4164f   '@41623 DS:4c24
L_41635:
    V_0e10$ = "T"   '@41635 DS:4c1e
    GOTO L_41848   '@41647
L_4164f:
    IF NOT (L_BP6e$ <> "E") THEN GOTO L_41673   '@4164f DS:4c2a
    IF NOT (L_BP6e$ = "e") THEN GOTO L_4183b   '@41661 DS:4c30
L_41673:
L_41678:
    LOCATE 25, 1   '@4167d
    PRINT " "; RT_TAB$(79); ""; "";   '@41698 DS:47b2,4c36
    LOCATE 25, 1   '@416c1
    PRINT " Numero do Tramo *FIM* ";   '@416dc DS:4c3c
    CALL MIXT_07f1_LimpaTeclado   '@416ea
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@416f4 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_4172b   '@4170e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@41723
L_4172b:
    L_BP3a! = VAL(V_0e0c$)   '@4172b
    IF NOT (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2) < FX##(L_BP3a!) OR (1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) > FX##(L_BP3a!) OR INT(FX##(L_BP3a!)) <> FX##(L_BP3a!))) THEN GOTO L_41819   '@41744 DS:4810
    BEEP   '@41807
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41678   '@41811
L_41819:
    V_0e10$ = STR$(L_BP3a!)   '@41819
    GOTO L_41848   '@41833
L_4183b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@4183b
L_41848:
    IF NOT (V_0e10$ = "T") THEN GOTO L_41926   '@41848 DS:4c1e
    V_0e14$ = " (tramos" + STR$(RT_SNG!(1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)))) + " a" + STR$(RT_SNG!(FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2))) + ")"   '@4185f DS:4810,4b96,4ba2,4ba8
    GOTO L_41951   '@4191e
L_41926:
    V_0e14$ = " (tramo" + V_0e10$ + ")"   '@41926 DS:4ba8,4c58
L_41951:
    LOCATE 24, 1   '@41951
    PRINT " Alteracao da elevacao da Viga "; A_122e$(RT_CINT%(FX##(V_11e4!))); V_0e14$; RT_TAB$(79); ""; ""   '@4196c DS:47b2,4bae
L_419c0:
    IF NOT (V_0e10$ = "T") THEN GOTO L_419f6   '@419c5 DS:4c1e
    V_0e0c$ = "RETORNA"   '@419dc DS:4c64
    GOTO L_41a4b   '@419ee
L_419f6:
    V_0e0c$ = LTRIM$(STR$(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(VAL(V_0e10$))), 2)))   '@419f6
L_41a4b:
    LOCATE 25, 1   '@41a4b
    PRINT " Cota da face Superior em relacao a Cota Basica "; LTRIM$(STR$(A_1200!(1, 14, 4))); " ("; CHR$(24); "+ cm) *"; V_0e0c$; "* ";   '@41a66 DS:47ac,48f0,4a3a,4c70
    CALL MIXT_07f1_LimpaTeclado   '@41ad7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@41ae1 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0e0c$) = 0) THEN GOTO L_41b44   '@41afb
    IF NOT (V_0e10$ = "T") THEN GOTO L_41b37   '@41b10 DS:4c1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@41b27
L_41b37:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41678   '@41b37
L_41b44:
    L_BP3a! = VAL(V_0e0c$)   '@41b44
    L_BP70% = (ABS(FX##(L_BP3a!)) < 0.100000001490116119384765625##)   '@41b5d DS:48fc,4900
    IF NOT ((FX##(L_BP3a!) * 10.0 <> INT(FX##(L_BP3a!) * 10.0) OR L_BP70%) <> 0) THEN GOTO L_41bc0   '@41b89 DS:4900
    BEEP   '@41bae
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_419c0   '@41bb8
L_41bc0:
    V_256a% = 1   '@41bc0
    IF NOT (V_0e10$ = "T") THEN GOTO L_41ccb   '@41bcb DS:4c1e
    L_BP74! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@41be2
    FOR V_11cc! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP74!   '@41c33 DS:4810
    A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2) = L_BP3a!   '@41c5e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@41c93 DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_411ee   '@41cbb
L_41ccb:
    A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(VAL(V_0e10$))), 2) = L_BP3a!   '@41ccb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41678   '@41d09
L_41d1e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_401e8   '@41d1e
L_41d33:
    IF NOT (L_BP1c% = 1) THEN GOTO L_41dae   '@41d33
    V_2592! = L_BP0e!   '@41d41
    V_2596! = L_BP12!   '@41d51
    V_259a! = L_BP16!   '@41d61
    V_259e! = L_BP1a!   '@41d71
    CALL S_1fa3b   '@41d81
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2193a   '@41d8b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_212be   '@41d95
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20f46   '@41d9f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
L_41dae:
    GOTO L_44f6a   '@41dae
    ' ---- F_41db6 @0x41db6  (041db6_F_41db6.lift.txt; evidence_id (assembly): ev_385193a0a7755123d45330fddd55589054af061c065fd6485de1b68bb58b4200)
L_41dc0:   ' sub-rotina (alvo de GOSUB); entrada vinda de 040187_FUN_4000_0187
    L_BP3a! = 0.0   '@41dc5 DS:4814
    L_BP78! = A_1664!(0, 0)   '@41dd5
    FOR V_11ec! = 1.0 TO L_BP78!   '@41df5 DS:4810
    IF NOT (INT(FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 4))) = FX##(V_11e4!)) THEN GOTO L_42742   '@41dfc
    IF NOT (L_BP3a! = 0.0) THEN GOTO L_42148   '@41e38 DS:4814
    L_BP7c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@41e52
    L_BP80! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@41e7c
    CALL MIXT_0877_Menor(L_BP7c!, L_BP80!, L_BP84!)   '@41e9d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP80!   '@41eb0
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP7c!   '@41ed2
    V_2592! = L_BP84!   '@41ef6
    L_BP88! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@41f01
    L_BP8c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@41f2d
    CALL MIXT_0877_Menor(L_BP88!, L_BP8c!, L_BP90!)   '@41f52
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP8c!   '@41f67
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP88!   '@41f8d
    V_2596! = L_BP90!   '@41fb3
    L_BP94! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@41fbe
    L_BP98! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@41fe9
    CALL MIXT_082a_Maior(L_BP94!, L_BP98!, L_BP9c!)   '@4200b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP98!   '@42020
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP94!   '@42043
    V_259a! = L_BP9c!   '@42068
    L_BPa0! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@42073
    L_BPa4! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@4209f
    CALL MIXT_082a_Maior(L_BPa0!, L_BPa4!, L_BPa8!)   '@420c4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPa4!   '@420d9
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPa0!   '@420ff
    V_259e! = L_BPa8!   '@42125
    L_BP3a! = 1.0   '@42130 DS:4810
    GOTO L_4273d   '@42140
L_42148:
    L_BPac! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@42148
    L_BPb0! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@42173
    CALL MIXT_0877_Menor(L_BPac!, L_BPb0!, L_BPb4!)   '@42195
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BPb0!   '@421aa
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BPac!   '@421cd
    IF NOT (V_2592! > L_BPb4!) THEN GOTO L_422bc   '@421f2
    L_BPb8! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@42207
    L_BPbc! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@42232
    CALL MIXT_0877_Menor(L_BPb8!, L_BPbc!, L_BPc0!)   '@42254
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BPbc!   '@42269
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BPb8!   '@4228c
    V_2592! = L_BPc0!   '@422b1
L_422bc:
    L_BPc4! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@422bc
    L_BPc8! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@422e8
    CALL MIXT_0877_Menor(L_BPc4!, L_BPc8!, L_BPcc!)   '@4230d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPc8!   '@42322
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPc4!   '@42348
    IF NOT (V_2596! > L_BPcc!) THEN GOTO L_42440   '@4236e
    L_BPd0! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@42383
    L_BPd4! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@423af
    CALL MIXT_0877_Menor(L_BPd0!, L_BPd4!, L_BPd8!)   '@423d4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPd4!   '@423e9
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPd0!   '@4240f
    V_2596! = L_BPd8!   '@42435
L_42440:
    L_BPdc! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@42440
    L_BPe0! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@4246b
    CALL MIXT_082a_Maior(L_BPdc!, L_BPe0!, L_BPe4!)   '@4248d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BPe0!   '@424a2
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BPdc!   '@424c5
    IF NOT (V_259a! < L_BPe4!) THEN GOTO L_425b4   '@424ea
    L_BPe8! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@424ff
    L_BPec! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@4252a
    CALL MIXT_082a_Maior(L_BPe8!, L_BPec!, L_BPf0!)   '@4254c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BPec!   '@42561
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BPe8!   '@42584
    V_259a! = L_BPf0!   '@425a9
L_425b4:
    L_BPf4! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@425b4
    L_BPf8! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@425e0
    CALL MIXT_082a_Maior(L_BPf4!, L_BPf8!, L_BPfc!)   '@42605
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BPf8!   '@4261a
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BPf4!   '@42640
    IF NOT (V_259e! < L_BPfc!) THEN GOTO L_42738   '@42666
    L_BP100! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@4267b
    L_BP104! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@426a7
    CALL MIXT_082a_Maior(L_BP100!, L_BP104!, L_BP108!)   '@426cc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP104!   '@426e1
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP100!   '@42707
    V_259e! = L_BP108!   '@4272d
L_42738:
L_4273d:
L_42742:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@42742 DS:4810
    L_BP3a! = FX##(V_259a!) - V_2592!   '@4276d
    V_11d4! = 1.0   '@42782 DS:4810
    V_11d8! = 0.56656551361083984375##   '@42793 DS:4ca4
    IF NOT (FX##(V_259e!) - V_2596! > FX##(L_BP3a!)) THEN GOTO L_427ff   '@427a4
    L_BP3a! = FX##(V_259e!) - V_2596!   '@427c3
    V_11d4! = 1.76502096652984619140625##   '@427d8 DS:4ca8
    V_11d8! = 1.0   '@427e9 DS:4810
L_427ff:
    L_BP3a! = FX##(L_BP3a!) / 2.0   '@427ff DS:4818
    L_BP10c! = (FX##(V_259a!) + V_2592!) / 2.0   '@42813 DS:4818
    L_BP110! = (FX##(V_259e!) + V_2596!) / 2.0   '@4282e DS:4818
    V_2592! = INT(L_BP10c! - FX##(L_BP3a!) * V_11d4!)   '@42849
    V_2596! = INT(L_BP110! - FX##(L_BP3a!) * V_11d8!)   '@4286d
    V_259a! = INT(FX##(L_BP3a!) * V_11d4! + L_BP10c!)   '@42891
    V_259e! = INT(FX##(L_BP3a!) * V_11d8! + L_BP110!)   '@428b2
    CALL S_1fa3b   '@428d3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_2193a   '@428dd
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_212be   '@428e7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    CALL S_20f46   '@428f1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP1c% = 1   '@428fb
    L_BP114! = FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 0)) + A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 2)   '@42905
    FOR V_11cc! = 1.0 - FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), 14, 1)) TO L_BP114!   '@42957 DS:4810
    L_BP3a! = 0.0   '@42982 DS:4814
    L_BP118! = FX##(A_1664!(0, 0)) - 1.0   '@42992 DS:4cac
    FOR V_11ec! = 1.0 TO L_BP118!   '@429b8 DS:4810
    V_11bc! = FX##(V_11cc!) / 100.0 + V_11e4!   '@429c0 DS:4cb0
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 4) = V_11bc!) THEN GOTO L_43f24   '@429db
    IF NOT (L_BP3a! = 0.0) THEN GOTO L_42fdb   '@42a10 DS:4814
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42a93   '@42a2a
    L_BP11c! = FX##(V_0e04#) / 2.0#   '@42a75 DS:4cb4
    GOTO L_42fc6   '@42a8b
L_42a93:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_42b57   '@42a93
    L_BP11c! = 0.0   '@42ae2 DS:4814
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42b4f   '@42af3
    L_BP11c! = V_0e04#   '@42b3e
L_42b4f:
    GOTO L_42fc1   '@42b4f
L_42b57:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) < A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42c91   '@42b57
    L_BP11c! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@42bfb
    GOTO L_42fbc   '@42c89
L_42c91:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) < A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42dd3   '@42c91
    L_BP11c! = V_0e04# - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2)))   '@42d35
    GOTO L_42fb7   '@42dcb
L_42dd3:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) > A_1664!(RT_CINT%(FX##(V_11ec!)), 3) AND A_1664!(RT_CINT%(FX##(V_11ec!)), 0) > A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_42f12   '@42dd3
    L_BP11c! = ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 2))) + V_0e04#   '@42e77
    GOTO L_42fb2   '@42f0a
L_42f12:
    L_BP11c! = 2.0# * FX##(V_0e04#) - ATN((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)))   '@42f12 DS:4cb4
L_42fb2:
L_42fb7:
L_42fbc:
L_42fc1:
L_42fc6:
    L_BP3a! = 1.0   '@42fc6 DS:4810
L_42fdb:
    L_BP120! = A_1664!(0, 0)   '@42fdb
    FOR V_11bc! = FX##(V_11ec!) + 1.0 TO L_BP120!   '@42ffc DS:4810
    L_BP3a! = FX##(V_11cc!) / 100.0 + V_11e4!   '@43008 DS:4cb0
    IF NOT (A_1664!(RT_CINT%(FX##(V_11bc!)), 4) = L_BP3a!) THEN GOTO L_43ef3   '@43022
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) THEN GOTO L_434eb   '@43056
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 0) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) THEN GOTO L_434e3   '@430a1
    L_BP124! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@430ee
    L_BP128! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@4311a
    CALL MIXT_0877_Menor(L_BP124!, L_BP128!, L_BP12c!)   '@4313f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP128!   '@43154
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP124!   '@4317a
    L_BP130! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@431a0
    L_BP134! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@431c6
    CALL MIXT_0877_Menor(L_BP130!, L_BP134!, L_BP138!)   '@431eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BP134!   '@43200
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BP130!   '@43226
    CALL MIXT_082a_Maior(L_BP12c!, L_BP138!, L_BP13c!)   '@4324b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP110! = L_BP13c!   '@43260
    L_BP140! = A_1664!(RT_CINT%(FX##(V_11ec!)), 1)   '@4326b
    L_BP144! = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)   '@43297
    CALL MIXT_082a_Maior(L_BP140!, L_BP144!, L_BP148!)   '@432bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 3) = L_BP144!   '@432d1
    A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = L_BP140!   '@432f7
    L_BP14c! = A_1664!(RT_CINT%(FX##(V_11bc!)), 1)   '@4331d
    L_BP150! = A_1664!(RT_CINT%(FX##(V_11bc!)), 3)   '@43343
    CALL MIXT_082a_Maior(L_BP14c!, L_BP150!, L_BP154!)   '@43368
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 3) = L_BP150!   '@4337d
    A_1664!(RT_CINT%(FX##(V_11bc!)), 1) = L_BP14c!   '@433a3
    CALL MIXT_0877_Menor(L_BP148!, L_BP154!, L_BP158!)   '@433c8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP15c! = L_BP158!   '@433dd
    IF NOT (FX##(L_BP15c!) - L_BP110! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_434de   '@433e8 DS:4cbc
    L_BP160! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) / 2.0   '@43432 DS:4818
    L_BP164! = (FX##(L_BP15c!) + L_BP110!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@4347f DS:4818
    GOSUB L_43f9d   '@434cc
L_434de:
L_434e3:
    GOTO L_43eee   '@434e3
L_434eb:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) = A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) THEN GOTO L_43968   '@434eb
    IF NOT (A_1664!(RT_CINT%(FX##(V_11ec!)), 1) <> A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) THEN GOTO L_43960   '@4353a
    L_BP168! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@43589
    L_BP16c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@435b4
    CALL MIXT_0877_Menor(L_BP168!, L_BP16c!, L_BP170!)   '@435d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP16c!   '@435eb
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP168!   '@4360e
    L_BP174! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@43633
    L_BP178! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@43658
    CALL MIXT_0877_Menor(L_BP174!, L_BP178!, L_BP17c!)   '@4367a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP178!   '@4368f
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP174!   '@436b2
    CALL MIXT_082a_Maior(L_BP170!, L_BP17c!, L_BP180!)   '@436d6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP10c! = L_BP180!   '@436eb
    L_BP184! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0)   '@436f6
    L_BP188! = A_1664!(RT_CINT%(FX##(V_11ec!)), 2)   '@43721
    CALL MIXT_082a_Maior(L_BP184!, L_BP188!, L_BP18c!)   '@43743
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11ec!)), 2) = L_BP188!   '@43758
    A_1664!(RT_CINT%(FX##(V_11ec!)), 0) = L_BP184!   '@4377b
    L_BP190! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0)   '@437a0
    L_BP194! = A_1664!(RT_CINT%(FX##(V_11bc!)), 2)   '@437c5
    CALL MIXT_082a_Maior(L_BP190!, L_BP194!, L_BP198!)   '@437e7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1664!(RT_CINT%(FX##(V_11bc!)), 2) = L_BP194!   '@437fc
    A_1664!(RT_CINT%(FX##(V_11bc!)), 0) = L_BP190!   '@4381f
    CALL MIXT_0877_Menor(L_BP18c!, L_BP198!, L_BP19c!)   '@43843
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a0! = L_BP19c!   '@43858
    IF NOT (FX##(L_BP1a0!) - L_BP10c! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_4395b   '@43863 DS:4cbc
    L_BP160! = (FX##(L_BP1a0!) + L_BP10c!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0   '@438ad DS:4818
    L_BP164! = (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1)) + A_1664!(RT_CINT%(FX##(V_11bc!)), 1)) / 2.0   '@438fa DS:4818
    GOSUB L_43f9d   '@43949
L_4395b:
L_43960:
    GOTO L_43ee9   '@43960
L_43968:
    L_BP10c! = A_1664!(RT_CINT%(FX##(V_11ec!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) * A_1664!(RT_CINT%(FX##(V_11ec!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3)) - A_1664!(RT_CINT%(FX##(V_11ec!)), 1))   '@43968
    L_BP1a0! = A_1664!(RT_CINT%(FX##(V_11bc!)), 0) - (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) * A_1664!(RT_CINT%(FX##(V_11bc!)), 1) / (FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3)) - A_1664!(RT_CINT%(FX##(V_11bc!)), 1))   '@43a2f
    IF NOT (ABS(FX##(L_BP10c!) - L_BP1a0!) > FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) - 1.0) THEN GOTO L_43ee4   '@43af6 DS:4cac
    L_BP1a4! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 0)) - L_BP10c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 1))), (2.0)))   '@43b42 DS:4818
    L_BP1a8! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 2)) - L_BP10c!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11ec!)), 3))), (2.0)))   '@43bae DS:4818
    L_BP1ac! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 0)) - L_BP1a0!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 1))), (2.0)))   '@43c18 DS:4818
    L_BP1b0! = RT_SQR##(RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 2)) - L_BP1a0!), (2.0)) + RT_POT##((FX##(A_1664!(RT_CINT%(FX##(V_11bc!)), 3))), (2.0)))   '@43c84 DS:4818
    CALL MIXT_0877_Menor(L_BP1a4!, L_BP1a8!, L_BP1b4!)   '@43cee
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1ac!, L_BP1b0!, L_BP1b8!)   '@43d07
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP1b4!, L_BP1b8!, L_BP1bc!)   '@43d1b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP110! = L_BP1bc!   '@43d30
    CALL MIXT_082a_Maior(L_BP1a4!, L_BP1a8!, L_BP1c0!)   '@43d3b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP1ac!, L_BP1b0!, L_BP1c4!)   '@43d54
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1c0!, L_BP1c4!, L_BP1c8!)   '@43d68
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP15c! = L_BP1c8!   '@43d7d
    IF NOT (FX##(L_BP15c!) - L_BP110! > A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1) * 1.10000002384185791015625##) THEN GOTO L_43edf   '@43d88 DS:4cbc
    IF NOT (FX##(L_BP11c!) > FX##(V_0e04#)) THEN GOTO L_43e03   '@43dd2
    L_BP11c! = FX##(L_BP11c!) - V_0e04#   '@43ded
L_43e03:
    L_BP160! = (FX##(L_BP1a0!) + L_BP10c!) / 2.0 + ((FX##(L_BP110!) + L_BP15c!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_COS##(FX##(L_BP11c!))   '@43e03 DS:4818
    L_BP164! = ((FX##(L_BP110!) + L_BP15c!) / 2.0 + FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) / 2.0) * RT_SIN##(FX##(L_BP11c!))   '@43e71 DS:4818
    GOSUB L_43f9d   '@43ecd
L_43edf:
L_43ee4:
L_43ee9:
L_43eee:
L_43ef3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11bc!   '@43ef3 DS:4810
L_43f24:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11ec!   '@43f24 DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11cc!   '@43f50 DS:4810
    RT_VIEWPRINT 23, 25   '@43f7c
    RETURN   '@43f8e
L_43f9d:   ' sub-rotina (alvo de GOSUB)
    GOSUB L_44728   '@43fa2
    RT_PSET RT_SNG!((FX##(L_BP160!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP164!) - V_2596!) * V_258e!), 0, 0   '@43faf DS:481c
    L_BP1cc! = RT_SIN##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP160!   '@43ffd DS:4818
    L_BP1d0! = L_BP164! - RT_COS##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@44048 DS:4818
    GOSUB L_446b4   '@44096
    L_BP1cc! = L_BP1cc! - RT_COS##(FX##(L_BP11c!)) * L_BP20!   '@440a3
    L_BP1d0! = L_BP1d0! - RT_SIN##(FX##(L_BP11c!)) * L_BP20!   '@440c7
    GOSUB L_446b4   '@440eb
    IF NOT (L_BP24! > 0.0) THEN GOTO L_44255   '@440f8 DS:4814
    L_BP1cc! = RT_SIN##(FX##(L_BP11c!)) * 30.0 + L_BP1cc!   '@44112 DS:4cc0
    L_BP1d0! = L_BP1d0! - RT_COS##(FX##(L_BP11c!)) * 30.0   '@44134 DS:4cc0
    GOSUB L_446b4   '@44159
    L_BP1cc! = L_BP1cc! - RT_COS##(FX##(L_BP11c!)) * L_BP24!   '@44166
    L_BP1d0! = L_BP1d0! - RT_SIN##(FX##(L_BP11c!)) * L_BP24!   '@4418a
    RT_PSET RT_SNG!((FX##(L_BP1cc!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1d0!) - V_2596!) * V_258e!), 0, 0   '@441ae DS:481c
    L_BP1cc! = L_BP1cc! - RT_SIN##(FX##(L_BP11c!)) * 30.0   '@441fc DS:4cc0
    L_BP1d0! = RT_COS##(FX##(L_BP11c!)) * 30.0 + L_BP1d0!   '@44221 DS:4cc0
    GOSUB L_446b4   '@44243
L_44255:
    L_BP1cc! = L_BP1cc! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP20! - L_BP24!) * RT_COS##(FX##(L_BP11c!))   '@44255
    L_BP1d0! = L_BP1d0! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP20! - L_BP24!) * RT_SIN##(FX##(L_BP11c!))   '@442aa
    GOSUB L_446b4   '@442ff
    L_BP1cc! = L_BP1cc! - RT_SIN##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)   '@4430c
    L_BP1d0! = RT_COS##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) + L_BP1d0!   '@44355
    GOSUB L_446b4   '@4439b
    L_BP1cc! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP28! - L_BP2c!) * RT_COS##(FX##(L_BP11c!)) + L_BP1cc!   '@443a8
    L_BP1d0! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 1)) - L_BP28! - L_BP2c!) * RT_SIN##(FX##(L_BP11c!)) + L_BP1d0!   '@443fa
    GOSUB L_446b4   '@4444c
    IF NOT (L_BP2c! > 0.0) THEN GOTO L_445b0   '@44459 DS:4814
    L_BP1cc! = L_BP1cc! - RT_SIN##(FX##(L_BP11c!)) * 30.0   '@44473 DS:4cc0
    L_BP1d0! = RT_COS##(FX##(L_BP11c!)) * 30.0 + L_BP1d0!   '@44498 DS:4cc0
    GOSUB L_446b4   '@444ba
    L_BP1cc! = RT_COS##(FX##(L_BP11c!)) * L_BP2c! + L_BP1cc!   '@444c7
    L_BP1d0! = RT_SIN##(FX##(L_BP11c!)) * L_BP2c! + L_BP1d0!   '@444e8
    RT_PSET RT_SNG!((FX##(L_BP1cc!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1d0!) - V_2596!) * V_258e!), 0, 0   '@44509 DS:481c
    L_BP1cc! = RT_SIN##(FX##(L_BP11c!)) * 30.0 + L_BP1cc!   '@44557 DS:4cc0
    L_BP1d0! = L_BP1d0! - RT_COS##(FX##(L_BP11c!)) * 30.0   '@44579 DS:4cc0
    GOSUB L_446b4   '@4459e
L_445b0:
    L_BP1cc! = RT_COS##(FX##(L_BP11c!)) * L_BP28! + L_BP1cc!   '@445b0
    L_BP1d0! = RT_SIN##(FX##(L_BP11c!)) * L_BP28! + L_BP1d0!   '@445d1
    GOSUB L_446b4   '@445f2
    L_BP1cc! = RT_SIN##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0 + L_BP1cc!   '@445ff DS:4818
    L_BP1d0! = L_BP1d0! - RT_COS##(FX##(L_BP11c!)) * A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0) / 2.0   '@4464a DS:4818
    GOSUB L_446b4   '@44698
    RETURN   '@446a5
L_446b4:   ' sub-rotina (alvo de GOSUB)
    RT_LINE 0, 0, RT_SNG!((FX##(L_BP1cc!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BP1d0!) - V_2596!) * V_258e!), 8, RT_CINT%(FX##(V_257a!)), 0   '@446b9 DS:481c
    RETURN   '@44719
L_44728:   ' sub-rotina (alvo de GOSUB)
    V_11d4! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP11c!)) + L_BP160!   '@4472d DS:4818,4cc4
    V_11d8! = L_BP164! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP11c!))   '@44780 DS:4818,4cc4
    GOSUB L_448e8   '@447d6
    L_BP20! = V_11c8!   '@447e3
    L_BP24! = V_11c4!   '@447f3
    V_11d4! = L_BP160! - (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_SIN##(FX##(L_BP11c!))   '@44803 DS:4818,4cc4
    V_11d8! = (FX##(A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 0)) / 2.0 + 20.0) * RT_COS##(FX##(L_BP11c!)) + L_BP164!   '@44859 DS:4818,4cc4
    GOSUB L_448e8   '@448ac
    L_BP28! = V_11c8!   '@448b9
    L_BP2c! = V_11c4!   '@448c9
    RETURN   '@448d9
L_448e8:   ' sub-rotina (alvo de GOSUB)
    V_11c8! = 0.0   '@448ed DS:4814
    V_11c4! = 0.0   '@448fe DS:4814
    L_BP1d4! = A_0f30%(0, 0)   '@4490f
    FOR V_11b8! = 1.0 TO L_BP1d4!   '@44934 DS:4810
    IF NOT (A_0f5e!(RT_CINT%(FX##(V_11b8!)), 1) = 0.0) THEN GOTO L_44f2f   '@4493c DS:4814
    L_BP1d8! = A_0f5e!(RT_CINT%(FX##(V_11b8!)), 0)   '@44971
    V_11a4! = 0.0   '@4499b DS:4814
    L_BP1dc! = A_0f30%(RT_CINT%(FX##(L_BP1d8!)), 0) - 1   '@449ac
    FOR V_11c0! = 1.0 TO L_BP1dc!   '@449dc DS:4810
    L_BP10c! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1d8!)), RT_CINT%(FX##(V_11c0!))), 0)) * 100.0   '@449e4 DS:4cb0
    L_BP110! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1d8!)), RT_CINT%(FX##(V_11c0!))), 1)) * 100.0   '@44a2d DS:4cb0
    L_BP1a0! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1d8!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 0)) * 100.0   '@44a77 DS:4810,4cb0
    L_BP15c! = FX##(A_0f02!(A_0f30%(RT_CINT%(FX##(L_BP1d8!)), RT_CINT%(FX##(V_11c0!) + 1.0)), 1)) * 100.0   '@44ac5 DS:4810,4cb0
    IF NOT (NOT (L_BP1a0! > V_11d4! AND L_BP10c! > V_11d4!)) THEN GOTO L_44dda   '@44b14
    IF NOT (NOT (L_BP15c! > V_11d8! AND L_BP110! > V_11d8! OR L_BP15c! < V_11d8! AND L_BP110! < V_11d8!)) THEN GOTO L_44dd5   '@44b54
    IF NOT (L_BP110! = L_BP15c!) THEN GOTO L_44c89   '@44bca
    IF NOT ((L_BP10c! >= V_11d4! AND L_BP1a0! <= 2.0 OR L_BP1a0! >= V_11d4! AND L_BP10c! <= V_11d4!) AND V_11d8! = L_BP110!) THEN GOTO L_44c81   '@44be5 DS:4818
    GOTO L_44e06   '@44c74
L_44c81:
    GOTO L_44dd0   '@44c81
L_44c89:
    IF NOT ((V_11d8! < L_BP110! AND V_11d8! >= L_BP15c! OR V_11d8! <= L_BP15c! AND V_11d8! > L_BP110!) AND (L_BP1a0! <= V_11d4! AND L_BP10c! <= V_11d4!)) THEN GOTO L_44d51   '@44c89
    V_11a4! = FX##(V_11a4!) + 1.0   '@44d33 DS:4810
    GOTO L_44dcb   '@44d49
L_44d51:
    IF NOT (L_BP10c! <> L_BP1a0!) THEN GOTO L_44dc6   '@44d51
    IF NOT ((FX##(V_11d8!) - L_BP110!) * (FX##(L_BP1a0!) - L_BP10c!) / (FX##(L_BP15c!) - L_BP110!) + L_BP10c! <= FX##(V_11d4!)) THEN GOTO L_44dc1   '@44d6c
    V_11a4! = FX##(V_11a4!) + 1.0   '@44dab DS:4810
L_44dc1:
L_44dc6:
L_44dcb:
L_44dd0:
L_44dd5:
L_44dda:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11c0!   '@44dda DS:4810
L_44e06:
    IF NOT (A_0f30%(RT_CINT%(FX##(L_BP1d8!)), 0) - 1 > V_11c0! OR FX##(V_11a4!) / 2.0 <> RT_CLNG&(FX##(V_11a4!)) \ 2&) THEN GOTO L_44f2a   '@44e06 DS:4818
    V_11c8! = A_1200!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(V_11cc!)), 2) - (FX##(A_1200!(1, 14, 3)) + A_0f5e!(RT_CINT%(FX##(V_11b8!)), 3))   '@44e82
    V_11c4! = A_115e!(RT_CINT%(FX##(V_11b8!)), 0)   '@44ef3
    GOTO L_44f5b   '@44f1d
L_44f2a:
L_44f2f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@44f2f DS:4810
L_44f5b:
    RETURN   '@44f5b
L_44f6a:   ' entrada vinda de 040187_FUN_4000_0187
    ' @44f6a libera strings locais (L_BP6e)
    ' @44f73 libera strings locais (L_BP52)
    ' @44f7c libera strings locais (L_BP30)
    ' END SUB   '@44f85
END SUB

SUB S_44f95   ' entrada de SUB/FUNCTION (B$ENRA, locais 292 bytes) (0x44f95)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP36!
    DIM L_BP3a!
    DIM L_BP3e!
    DIM L_BP42!
    DIM L_BP46!
    DIM L_BP48%
    DIM L_BP4a%
    DIM L_BP4e!
    DIM L_BP52!
    DIM L_BP56!
    DIM L_BP5a!
    DIM L_BP5e!
    DIM L_BP8a$
    DIM L_BP8e$
    DIM L_BP92!
    DIM L_BP96!
    DIM L_BP9a!
    DIM L_BP9e!
    DIM L_BPa2!
    DIM L_BPa6!
    DIM L_BPaa!
    DIM L_BPae$
    DIM L_BPb0%
    DIM L_BPb4$
    DIM L_BPb8!
    DIM L_BPbc!
    DIM L_BPc0!
    DIM L_BPc4!
    DIM L_BPc8!
    DIM L_BPcc!
    DIM L_BPd0$
    DIM L_BPd2%
    DIM L_BPd6$
    DIM L_BPda$
    DIM L_BPde$
    DIM L_BPe2$
    DIM L_BPe6$
    DIM L_BPea$
    DIM L_BPee$
    DIM L_BPf2$
    DIM L_BPf6!
    DIM L_BPfa!
    DIM L_BPfe!
    REDIM L_BP70%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP86!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_4000_4f95 @0x44f95  (044f95_FUN_4000_4f95.lift.txt; evidence_id (assembly): ev_294a5f7c878aa742b349b96156400ccc3ff13e41b7ea264db6125f1211fef892)
    REDIM L_BP70%(0 TO 860)   '@44fac
    REDIM L_BP86!(0 TO 50, 0 TO 1)   '@44fc9
L_44ff3:
    RT_VIEWPRINT 23, 25   '@44ff8
    RT_CLS 2   '@4500a
    PRINT " Visualizacao e Alteracao das Cotas e Distancias mostradas no Desenho"   '@45018 DS:4cc8
    PRINT " <D>enife novas Cotas     <A>ltera cotas definidas     <*R*>etorna"; RT_TAB$(79); ""; ""   '@45026 DS:47b2,4d12
    RT_VIEWPRINT 1, 25   '@4504f
    CALL MIXT_07f1_LimpaTeclado   '@45061
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@4506b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8a$ = V_0e0c$   '@45087
    IF NOT (L_BP8a$ <> "D") THEN GOTO L_450c5   '@4509a DS:4d58
    IF NOT (L_BP8a$ = "d") THEN GOTO L_493ea   '@450b2 DS:4d5e
L_450c5:
    IF NOT (V_1802% = 0) THEN GOTO L_45145   '@450c5
    REDIM A_1804!(-32768 TO -32768, -32768 TO -32768)   '@450d4
    REDIM A_1804!(0 TO 80, 0 TO 5)   '@450e2
    REDIM A_1832%(-32768 TO -32768, -32768 TO -32768)   '@45106
    REDIM A_1832%(0 TO 400, 0 TO 2)   '@45114
    V_1802% = 1   '@45135
L_45145:
L_4514a:
    LOCATE 25, 1   '@4514f
    PRINT " "; RT_TAB$(79); ""; "";   '@4516a DS:47b2,4c36
    LOCATE 23, 1   '@45193
    PRINT " Definicao de linhas de medidas da Forma"; RT_TAB$(79); ""; ""   '@451ae DS:47b2,4d64
    LOCATE 24, 1   '@451d7
    PRINT " Cotas <H>orizontais    Cotas <V>erticais    Cotas <I>nclinadas    <*R*>etorna"; RT_TAB$(79); ""; ""   '@451f2 DS:47b2,4d90
    CALL MIXT_07f1_LimpaTeclado   '@4521b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@45225
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP8e$ = V_0e0c$   '@45241
    IF NOT (L_BP8e$ <> "H") THEN GOTO L_4527f   '@45254 DS:4de2
    IF NOT (L_BP8e$ = "h") THEN GOTO L_4732f   '@4526c DS:4de8
L_4527f:
    L_BP36! = 0.0   '@4527f DS:4814
    L_BP86!(0, 0) = 0.0   '@4528f DS:4814
    L_BP4e! = V_2592!   '@452b0
    L_BP52! = V_2596!   '@452c0
    L_BP56! = V_259a!   '@452d0
    L_BP5a! = V_259e!   '@452e0
    V_0e18$ = "VPBE"   '@452f0 DS:4dee
    L_BP5e! = -1000.0   '@45302 DS:4df6
L_45317:
    LOCATE 24, 1   '@4531c
    PRINT " <S>im cota local   busca: <P>ilar   <V>iga   <B>orda Laje   <E>ixo   pro<X>imo";   '@45337 DS:4dfa
    LOCATE 25, 1   '@45345
    PRINT " <A>nula ultima cota   <R>etorna   <C>ancela   <F>im";   '@45360 DS:4e4e
    L_BP0e! = 0.0   '@4536e DS:4814
    L_BP92! = V_259a!   '@4537e
    IF NOT (RT_INSTR%((1), (V_0e18$), ("V")) > 0) THEN GOTO L_45739   '@4538f DS:4904
    L_BP96! = A_1664!(0, 0)   '@453ac
    FOR V_11b8! = 1.0 TO L_BP96!   '@453cd DS:4810
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) <> A_1664!(RT_CINT%(FX##(V_11b8!)), 3)) THEN GOTO L_45708   '@453d4
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) <= L_BP5a! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) >= L_BP52! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) > L_BP4e! AND A_1664!(RT_CINT%(FX##(V_11b8!)), 0) <= L_BP56!))) THEN GOTO L_45597   '@45423
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) < L_BP92!) THEN GOTO L_45592   '@454ff
    L_BP92! = A_1664!(RT_CINT%(FX##(V_11b8!)), 0)   '@45533
    L_BP0e! = -3.0   '@4555d DS:4e86
    L_BP12! = V_11b8!   '@4556d
    L_BP16! = 0.0   '@4557d DS:4814
L_45592:
L_45597:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) <= L_BP5a! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) >= L_BP52! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) > L_BP4e! AND A_1664!(RT_CINT%(FX##(V_11b8!)), 2) <= L_BP56!))) THEN GOTO L_45703   '@45597
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) < L_BP92!) THEN GOTO L_456fe   '@4566f
    L_BP92! = A_1664!(RT_CINT%(FX##(V_11b8!)), 2)   '@456a1
    L_BP0e! = -3.0   '@456c9 DS:4e86
    L_BP12! = V_11b8!   '@456d9
    L_BP16! = 2.0   '@456e9 DS:4818
L_456fe:
L_45703:
L_45708:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@45708 DS:4810
L_45739:
    IF NOT (RT_INSTR%((1), (V_0e18$), ("P")) > 0) THEN GOTO L_45b01   '@45739 DS:4e8a
    L_BP9a! = A_15da!(0, 0)   '@45756
    FOR V_11b8! = 1.0 TO L_BP9a!   '@45777 DS:4810
    IF NOT (A_15ac%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_45ad0   '@4577e
    V_11ec! = -V_11b8!   '@457a5
    CALL S_22ee1   '@457b9
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_458df   '@457c3
    IF NOT (V_11d8! <= L_BP5a! AND (V_11d8! >= L_BP52! AND (V_11d4! > L_BP4e! AND V_11d4! <= L_BP56!))) THEN GOTO L_458d7   '@45801
    IF NOT (V_11d4! < L_BP92!) THEN GOTO L_458d2   '@45871
    L_BP92! = V_11d4!   '@4588c
    L_BP0e! = -2.0   '@4589d DS:4e90
    L_BP12! = V_11b8!   '@458ad
    L_BP16! = 0.0   '@458bd DS:4814
L_458d2:
L_458d7:
    GOTO L_45acb   '@458d7
L_458df:
    L_BP9e! = A_16ee!(0, 0)   '@458df
    FOR L_BPa2! = 1.0 TO L_BP9e!   '@45900 DS:4810
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8! <= FX##(L_BP5a!) AND (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8! >= FX##(L_BP52!) AND (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4! > FX##(L_BP4e!) AND FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4! <= FX##(L_BP56!)))) THEN GOTO L_45a9a   '@45908
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4! < FX##(L_BP92!)) THEN GOTO L_45a95   '@459f8
    L_BP92! = FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4!   '@45a31
    L_BP0e! = -2.0   '@45a60 DS:4e90
    L_BP12! = V_11b8!   '@45a70
    L_BP16! = L_BPa2!   '@45a80
L_45a95:
L_45a9a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPa2!   '@45a9a DS:4810
L_45acb:
L_45ad0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@45ad0 DS:4810
L_45b01:
    IF NOT (RT_INSTR%((1), (V_0e18$), ("E")) > 0) THEN GOTO L_45cb9   '@45b01 DS:4c2a
    L_BPa6! = A_0e78!(0, 1)   '@45b1e
    FOR V_11b8! = 1.0 TO L_BPa6!   '@45b42 DS:4810
    IF NOT (FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 1)) * 100.0 > FX##(L_BP4e!) AND FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 1)) * 100.0 <= FX##(L_BP56!)) THEN GOTO L_45c88   '@45b4a DS:4cb0
    IF NOT (FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 1)) * 1000.0)) / 10.0# < FX##(L_BP92!)) THEN GOTO L_45c83   '@45bc6 DS:4e94,4e98
    L_BP92! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 1)) * 1000.0)) / 10.0#   '@45c0f DS:4e94,4e98
    L_BP0e! = -1.0   '@45c4e DS:4cac
    L_BP12! = V_11b8!   '@45c5e
    L_BP16! = 0.0   '@45c6e DS:4814
L_45c83:
L_45c88:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@45c88 DS:4810
L_45cb9:
    IF NOT (L_BP0e! <> 0.0) THEN GOTO L_45d87   '@45cb9 DS:4814
    L_BP86!(0, 0) = FX##(L_BP86!(0, 0)) + 1.0   '@45cd3 DS:4810
    L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0))), 0) = L_BP92!   '@45d09
    L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0))), 1) = L_BP0e!   '@45d44
    GOTO L_45d96   '@45d7f
L_45d87:
    BEEP   '@45d87
L_45d96:
L_45d9b:
    RT_GCAIXA RT_SNG!(INT((FX##(L_BP92!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), RT_SNG!(INT((FX##(L_BP92!) - V_2592!) * V_258a!) + V_2582! + 1.0), RT_SNG!(165.0 - INT((FX##(V_2596!) - V_2596!) * V_258e!)), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@45da0 DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(L_BP92!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_259e!) - V_2596!) * V_258e!), RT_SNG!((FX##(L_BP92!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_2596!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 20   '@45e6b DS:481c
    LOCATE 25, 55   '@45f0f
    PRINT " "; RT_TAB$(79); ""; " ";   '@45f2d DS:47b2,4c36
    LOCATE 25, 55   '@45f56
    L_BPaa! = L_BP0e!   '@45f74
    IF NOT (L_BPaa! = 0.0) THEN GOTO L_45fd0   '@45f84 DS:4814
    PRINT " "; RT_TAB$(79); ""; "";   '@45f9f DS:47b2,4c36
    GOTO L_461c2   '@45fc8
L_45fd0:
    IF NOT (L_BPaa! = -1.0) THEN GOTO L_460b7   '@45fd1 DS:4cac
    V_0e14$ = " " + CHR$(RT_CINT%(FX##(L_BP12!) + 26& * ((RT_CLNG&(FX##(L_BP12!)) \ 26&) * (L_BP12! > 26.0)) + 64.0#)) + RT_STRINGS$((RT_CLNG&(FX##(L_BP12!) - 1.0) \ 26&), ("'"))   '@45fe6 DS:4c36,4cac,4ea0,4ea4,4eac
    PRINT USING "(Eixo \    \ X=#####.##)"; V_0e14$; RT_PU#(L_BP92!, "(Eixo \    \ X=#####.##)", 1);   '@46086 DS:4eb2
    GOTO L_461c2   '@460af
L_460b7:
    IF NOT (L_BPaa! = -2.0) THEN GOTO L_4611d   '@460b8 DS:4e90
    PRINT USING "(Pilar \   \ X=#####.##)"; A_143a$(A_15ac%(RT_CINT%(FX##(L_BP12!)))); RT_PU#(L_BP92!, "(Pilar \   \ X=#####.##)", 1);   '@460cd DS:4ece
    GOTO L_461c2   '@46115
L_4611d:
    IF NOT (L_BPaa! = -3.0) THEN GOTO L_461a4   '@4611e DS:4e86
    PRINT USING "(Viga \    \ X=#####.##)"; A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(L_BP12!)), 4)))))); RT_PU#(L_BP92!, "(Viga \    \ X=#####.##)", 1);   '@46133 DS:4eea
    GOTO L_461c2   '@4619c
L_461a4:
    IF NOT (L_BPaa! = -4.0) THEN GOTO L_461c2   '@461a5 DS:4f06
    GOTO L_461c2   '@461ba
L_461c2:
    CALL MIXT_07f1_LimpaTeclado   '@461c2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@461cc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!(INT((FX##(L_BP92!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@461e8 DS:481c,4cac
    L_BPae$ = V_0e0c$   '@46260
    IF NOT (L_BPae$ <> "S") THEN GOTO L_4629e   '@46273 DS:49d2
    IF NOT (L_BPae$ = "s") THEN GOTO L_46501   '@4628b DS:49d8
L_4629e:
    IF NOT (L_BP36! > 0.0) THEN GOTO L_463cd   '@4629e DS:4814
    IF NOT (A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 2) = L_BP16! AND (A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 1) = L_BP12! AND A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 0) = L_BP0e!)) THEN GOTO L_463c8   '@462b8
    BEEP   '@463b1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@463bb
L_463c8:
L_463cd:
    L_BP48% = A_1832%(0, 0) + 1   '@463cd
    L_BP36! = FX##(L_BP36!) + 1.0   '@463e9 DS:4810
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 0) = RT_CINT%(FX##(L_BP0e!))   '@463fd
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 1) = RT_CINT%(FX##(L_BP12!))   '@46445
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 2) = RT_CINT%(FX##(L_BP16!))   '@4648e
    GOSUB L_4a8bb   '@464d4
    L_BP4e! = L_BP92!   '@464e1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@464f1
L_46501:
    IF NOT (L_BPae$ <> "P") THEN GOTO L_46527   '@46501 DS:4e8a
    IF NOT (L_BPae$ = "p") THEN GOTO L_4655e   '@46514 DS:4f0a
L_46527:
    L_BP4e! = L_BP92! + 0.100000001490116119384765625##   '@46527 DS:48fc
    V_0e18$ = "P"   '@4653c DS:4e8a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@4654e
L_4655e:
    IF NOT (L_BPae$ <> "V") THEN GOTO L_46584   '@4655e DS:4904
    IF NOT (L_BPae$ = "v") THEN GOTO L_465bb   '@46571 DS:490a
L_46584:
    L_BP4e! = L_BP92! + 0.100000001490116119384765625##   '@46584 DS:48fc
    V_0e18$ = "V"   '@46599 DS:4904
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@465ab
L_465bb:
    IF NOT (L_BPae$ <> "B") THEN GOTO L_465e1   '@465bb DS:4f10
    IF NOT (L_BPae$ = "b") THEN GOTO L_465e9   '@465ce DS:4f16
L_465e1:
    GOTO L_4731f   '@465e1
L_465e9:
    IF NOT (L_BPae$ <> "E") THEN GOTO L_4660f   '@465e9 DS:4c2a
    IF NOT (L_BPae$ = "e") THEN GOTO L_46646   '@465fc DS:4c30
L_4660f:
    L_BP4e! = L_BP92! + 0.100000001490116119384765625##   '@4660f DS:48fc
    V_0e18$ = "E"   '@46624 DS:4c2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@46636
L_46646:
    IF NOT (L_BPae$ <> "X") THEN GOTO L_4666c   '@46646 DS:4f1c
    IF NOT (L_BPae$ = "x") THEN GOTO L_466a3   '@46659 DS:4f22
L_4666c:
    L_BP4e! = L_BP92! + 0.100000001490116119384765625##   '@4666c DS:48fc
    V_0e18$ = "VPBE"   '@46681 DS:4dee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@46693
L_466a3:
    IF NOT (L_BPae$ <> "A") THEN GOTO L_466c9   '@466a3 DS:4f28
    IF NOT (L_BPae$ = "a") THEN GOTO L_46726   '@466b6 DS:4f2e
L_466c9:
    IF NOT (L_BP36! = 0.0) THEN GOTO L_466f5   '@466c9 DS:4814
    BEEP   '@466e3
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@466ed
L_466f5:
    L_BP36! = FX##(L_BP36!) - 1.0   '@466f5 DS:4cac
    GOSUB L_4a8bb   '@46709
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d9b   '@46716
L_46726:
    IF NOT (L_BPae$ <> "R") THEN GOTO L_4674c   '@46726 DS:4f34
    IF NOT (L_BPae$ = "r") THEN GOTO L_468c8   '@46739 DS:4f3a
L_4674c:
    IF NOT (L_BP86!(0, 0) < 2.0) THEN GOTO L_46789   '@4674c DS:4818
    BEEP   '@46777
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d9b   '@46781
L_46789:
    IF NOT (L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 0) < L_BP5e!) THEN GOTO L_467e4   '@46789 DS:4cac
    BEEP   '@467d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d9b   '@467dc
L_467e4:
    L_BP4e! = FX##(L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 0)) - 1.0   '@467e4 DS:4cac
    V_0e18$ = RT_MID$(("EPVB"), (RT_CINT%(ABS(FX##(L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 1))))), (1))   '@46828 DS:4cac,4f40
    L_BP86!(0, 0) = FX##(L_BP86!(0, 0)) - 2.0   '@46882 DS:4e90
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@468b8
L_468c8:
    IF NOT (L_BPae$ <> "C") THEN GOTO L_468ee   '@468c8 DS:46fa
    IF NOT (L_BPae$ = "c") THEN GOTO L_46a34   '@468db DS:4700
L_468ee:
    LOCATE 24, 1   '@468ee
    PRINT " "; RT_TAB$(79); ""; " "   '@46909 DS:47b2,4c36
    LOCATE 25, 1   '@46932
    PRINT " "; RT_TAB$(79); ""; " ";   '@4694d DS:47b2,4c36
    IF NOT (L_BP36! > 0.0) THEN GOTO L_46a24   '@46976 DS:4814
    LOCATE 24, 1   '@46990
    PRINT " Confirme CANCELAR Cotas definidas S/*N* ";   '@469ab DS:4f48
    CALL MIXT_07f1_LimpaTeclado   '@469b9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@469c3 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_46a02   '@469dd DS:49d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@469fa
L_46a02:
    L_BP36! = 0.0   '@46a02 DS:4814
    GOSUB L_4a8bb   '@46a12
L_46a24:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4514a   '@46a24
L_46a34:
    IF NOT (L_BPae$ <> "F") THEN GOTO L_46a5a   '@46a34 DS:4f76
    IF NOT (L_BPae$ = "f") THEN GOTO L_47312   '@46a47 DS:4f7c
L_46a5a:
    IF NOT (L_BP36! < 2.0) THEN GOTO L_46a8b   '@46a5a DS:4818
    BEEP   '@46a74
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@46a7e
L_46a8b:
    LOCATE 24, 1   '@46a8b
    PRINT " "; RT_TAB$(79); ""; " "   '@46aa6 DS:47b2,4c36
    LOCATE 25, 1   '@46acf
    PRINT " "; RT_TAB$(79); ""; " ";   '@46aea DS:47b2,4c36
    LOCATE 24, 1   '@46b13
    PRINT " Confirme Cotas definidas N/*S* ";   '@46b2e DS:4f82
    CALL MIXT_07f1_LimpaTeclado   '@46b3c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@46b46 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_46b85   '@46b60 DS:47fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@46b7d
L_46b85:
    A_1804!(0, 0) = FX##(A_1804!(0, 0)) + 1.0   '@46b85 DS:4810
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 0) = 1.0   '@46bb9 DS:4810
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 4) = A_1832%(0, 0) + 1   '@46bf2
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 5) = L_BP36!   '@46c42
    A_1832%(0, 0) = RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!)   '@46c7b
    LOCATE 25, 1   '@46cb8
    PRINT " As medidas serao mostradas <D>entro ou <F>ora do desenho ";   '@46cd3 DS:4fa6
    CALL MIXT_07f1_LimpaTeclado   '@46ce1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_46cf0:
    V_0e0c$ = RT_INPUT$(1)   '@46cf0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb0% = (UCASE$(V_0e0c$) = "D")   '@46d0c DS:4d58
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF (UCASE$(V_0e0c$) = "F" OR L_BPb0%) = 0 THEN GOTO L_46cf0   '@46d34 DS:4f76
    IF NOT (UCASE$(V_0e0c$) = "F") THEN GOTO L_46dad   '@46d51 DS:4f76
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 2) = -1000.0   '@46d6e DS:4df6
    GOTO L_472e5   '@46da5
L_46dad:
    LOCATE 25, 1   '@46dad
    PRINT " Escolha a posicao desejada para a linha de medidas e acione <Enter>";   '@46dc8 DS:4fe4
    V_11d8! = INT((FX##(V_259e!) + V_2596!) / 2.0)   '@46dd6 DS:4818
L_46dfe:
    RT_GCAIXA RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), RT_SNG!(INT((FX##(V_259a!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) + 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@46dfe DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(V_2592!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_259a!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 40   '@46ec9 DS:481c
L_46f72:
    V_0e0c$ = RT_INKEY$   '@46f72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb4$ = V_0e0c$   '@46f86
    IF NOT (L_BPb4$ <> "2") THEN GOTO L_46fd9   '@46f99 DS:502c
    IF NOT (CHR$(0) + CHR$(80) = L_BPb4$) THEN GOTO L_470b7   '@46fb1
L_46fd9:
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@46fd9 DS:481c,4cac
    V_11d8! = V_11d8! - INT((FX##(V_259e!) + V_2596!) / 30.0)   '@47051 DS:4cc0
    IF NOT (V_11d8! < V_2596!) THEN GOTO L_470a7   '@4707b
    V_11d8! = V_2596!   '@47096
L_470a7:
    GOTO L_472b2   '@470a7
L_470b7:
    IF NOT (L_BPb4$ <> "8") THEN GOTO L_470f2   '@470b7 DS:5032
    IF NOT (CHR$(0) + CHR$(72) = L_BPb4$) THEN GOTO L_471cd   '@470ca
L_470f2:
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@470f2 DS:481c,4cac
    V_11d8! = INT((FX##(V_259e!) + V_2596!) / 30.0) + V_11d8!   '@4716a DS:4cc0
    IF NOT (V_11d8! > V_259e!) THEN GOTO L_471bd   '@47191
    V_11d8! = V_259e!   '@471ac
L_471bd:
    GOTO L_472b2   '@471bd
L_471cd:
    IF NOT (CHR$(13) = L_BPb4$) THEN GOTO L_472a5   '@471cd
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@471e6 DS:481c,4cac
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 2) = V_11d8!   '@4725e
    GOTO L_472b2   '@47295
L_472a5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46f72   '@472aa
L_472b2:
    IF NOT (CHR$(13) = V_0e0c$) THEN GOTO L_472d7   '@472b2
    GOTO L_472e0   '@472cf
L_472d7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46dfe   '@472d7
L_472e0:
L_472e5:
    L_BP36! = 0.0   '@472e5 DS:4814
    GOSUB L_4a8bb   '@472f5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4514a   '@47302
L_47312:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d9b   '@47312
L_4731f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45317   '@4731f
L_4732f:
    IF NOT (L_BP8e$ <> "V") THEN GOTO L_47355   '@4732f DS:4904
    IF NOT (L_BP8e$ = "v") THEN GOTO L_4939f   '@47342 DS:490a
L_47355:
    L_BP36! = 0.0   '@47355 DS:4814
    L_BP86!(0, 0) = 0.0   '@47365 DS:4814
    L_BP4e! = V_2592!   '@47386
    L_BP52! = V_2596!   '@47396
    L_BP56! = V_259a!   '@473a6
    L_BP5a! = V_259e!   '@473b6
    V_0e18$ = "VPBE"   '@473c6 DS:4dee
    L_BP5e! = -1000.0   '@473d8 DS:4df6
L_473ed:
    LOCATE 24, 1   '@473f2
    PRINT " <S>im cota local   busca: <P>ilar   <V>iga   <B>orda Laje   <E>ixo   pro<X>imo";   '@4740d DS:4dfa
    LOCATE 25, 1   '@4741b
    PRINT " <A>nula ultima cota   <R>etorna   <C>ancela   <F>im"; RT_TAB$(79); ""; "";   '@47436 DS:47b2,4e4e
    L_BP0e! = 0.0   '@4745f DS:4814
    L_BPb8! = V_259e!   '@4746f
    IF NOT (RT_INSTR%((1), (V_0e18$), ("V")) > 0) THEN GOTO L_4782f   '@47480 DS:4904
    L_BPbc! = A_1664!(0, 0)   '@4749d
    FOR V_11b8! = 1.0 TO L_BPbc!   '@474be DS:4810
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) <> A_1664!(RT_CINT%(FX##(V_11b8!)), 2)) THEN GOTO L_477fe   '@474c6
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) <= L_BP56! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 0) >= L_BP4e! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) > L_BP52! AND A_1664!(RT_CINT%(FX##(V_11b8!)), 1) <= L_BP5a!))) THEN GOTO L_47687   '@47511
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 1) < L_BPb8!) THEN GOTO L_47682   '@475ed
    L_BPb8! = A_1664!(RT_CINT%(FX##(V_11b8!)), 1)   '@47622
    L_BP0e! = -3.0   '@4764d DS:4e86
    L_BP12! = V_11b8!   '@4765d
    L_BP16! = 1.0   '@4766d DS:4810
L_47682:
L_47687:
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) <= L_BP56! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 2) >= L_BP4e! AND (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) > L_BP52! AND A_1664!(RT_CINT%(FX##(V_11b8!)), 3) <= L_BP5a!))) THEN GOTO L_477f9   '@47687
    IF NOT (A_1664!(RT_CINT%(FX##(V_11b8!)), 3) < L_BPb8!) THEN GOTO L_477f4   '@4775f
    L_BPb8! = A_1664!(RT_CINT%(FX##(V_11b8!)), 3)   '@47794
    L_BP0e! = -3.0   '@477bf DS:4e86
    L_BP12! = V_11b8!   '@477cf
    L_BP16! = 3.0   '@477df DS:5038
L_477f4:
L_477f9:
L_477fe:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@477fe DS:4810
L_4782f:
    IF NOT (RT_INSTR%((1), (V_0e18$), ("P")) > 0) THEN GOTO L_47bf9   '@4782f DS:4e8a
    L_BPc0! = A_15da!(0, 0)   '@4784c
    FOR V_11b8! = 1.0 TO L_BPc0!   '@4786d DS:4810
    IF NOT (A_15ac%(RT_CINT%(FX##(V_11b8!))) > 0) THEN GOTO L_47bc8   '@47874
    V_11ec! = -V_11b8!   '@4789b
    CALL S_22ee1   '@478af
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(V_11b8!))), V_13aa%, 6) = 2) THEN GOTO L_479d5   '@478b9
    IF NOT (V_11d4! <= L_BP56! AND (V_11d4! >= L_BP4e! AND (V_11d8! > L_BP52! AND V_11d8! <= L_BP5a!))) THEN GOTO L_479cd   '@478f7
    IF NOT (V_11d8! < L_BPb8!) THEN GOTO L_479c8   '@47967
    L_BPb8! = V_11d8!   '@47982
    L_BP0e! = -2.0   '@47993 DS:4e90
    L_BP12! = V_11b8!   '@479a3
    L_BP16! = 0.0   '@479b3 DS:4814
L_479c8:
L_479cd:
    GOTO L_47bc3   '@479cd
L_479d5:
    L_BPc4! = A_16ee!(0, 0)   '@479d5
    FOR L_BPa2! = 1.0 TO L_BPc4!   '@479f6 DS:4810
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4! <= FX##(L_BP56!) AND (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 0)) + V_11d4! >= FX##(L_BP4e!) AND (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8! > FX##(L_BP52!) AND FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8! <= FX##(L_BP5a!)))) THEN GOTO L_47b92   '@479fe
    IF NOT (FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8! < FX##(L_BPb8!)) THEN GOTO L_47b8d   '@47aee
    L_BPb8! = FX##(A_16ee!(RT_CINT%(FX##(L_BPa2!)), 1)) + V_11d8!   '@47b28
    L_BP0e! = -2.0   '@47b58 DS:4e90
    L_BP12! = V_11b8!   '@47b68
    L_BP16! = L_BPa2!   '@47b78
L_47b8d:
L_47b92:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPa2!   '@47b92 DS:4810
L_47bc3:
L_47bc8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@47bc8 DS:4810
L_47bf9:
    IF NOT (RT_INSTR%((1), (V_0e18$), ("E")) > 0) THEN GOTO L_47da9   '@47bf9 DS:4c2a
    L_BPc8! = A_0e78!(0, 0)   '@47c16
    FOR V_11b8! = 1.0 TO L_BPc8!   '@47c37 DS:4810
    IF NOT (FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)) * 100.0 > FX##(L_BP52!) AND FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)) * 100.0 <= FX##(L_BP5a!)) THEN GOTO L_47d78   '@47c3e DS:4cb0
    IF NOT (FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)) * 1000.0)) / 10.0# < FX##(L_BPb8!)) THEN GOTO L_47d73   '@47cb8 DS:4e94,4e98
    L_BPb8! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(V_11b8!)), 0)) * 1000.0)) / 10.0#   '@47d00 DS:4e94,4e98
    L_BP0e! = -1.0   '@47d3e DS:4cac
    L_BP12! = V_11b8!   '@47d4e
    L_BP16! = 0.0   '@47d5e DS:4814
L_47d73:
L_47d78:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11b8!   '@47d78 DS:4810
L_47da9:
    IF NOT (L_BP0e! <> 0.0) THEN GOTO L_47e77   '@47da9 DS:4814
    L_BP86!(0, 0) = FX##(L_BP86!(0, 0)) + 1.0   '@47dc3 DS:4810
    L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0))), 0) = L_BPb8!   '@47df9
    L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0))), 1) = L_BP0e!   '@47e34
    GOTO L_47e86   '@47e6f
L_47e77:
    BEEP   '@47e77
L_47e86:
L_47e8b:
    RT_GCAIXA RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BPb8!) - V_2596!) * V_258e!) - 1.0), RT_SNG!(INT((FX##(V_259a!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BPb8!) - V_2596!) * V_258e!) + 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@47e90 DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(V_2592!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BPb8!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_259a!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(L_BPb8!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 20   '@47f5b DS:481c
    LOCATE 25, 55   '@47fff
    PRINT " "; RT_TAB$(79); ""; " ";   '@4801d DS:47b2,4c36
    LOCATE 25, 55   '@48046
    L_BPcc! = L_BP0e!   '@48064
    IF NOT (L_BPcc! = 0.0) THEN GOTO L_480c0   '@48074 DS:4814
    PRINT " "; RT_TAB$(79); ""; "";   '@4808f DS:47b2,4c36
    GOTO L_4822c   '@480b8
L_480c0:
    IF NOT (L_BPcc! = -1.0) THEN GOTO L_48121   '@480c1 DS:4cac
    V_0e14$ = STR$(L_BP12!)   '@480d6
    PRINT USING "(Eixo \    \ Y=#####.##)"; V_0e14$; RT_PU#(L_BPb8!, "(Eixo \    \ Y=#####.##)", 1);   '@480f0 DS:503c
    GOTO L_4822c   '@48119
L_48121:
    IF NOT (L_BPcc! = -2.0) THEN GOTO L_48187   '@48122 DS:4e90
    PRINT USING "(Pilar \   \ Y=#####.##)"; A_143a$(A_15ac%(RT_CINT%(FX##(L_BP12!)))); RT_PU#(L_BPb8!, "(Pilar \   \ Y=#####.##)", 1);   '@48137 DS:5058
    GOTO L_4822c   '@4817f
L_48187:
    IF NOT (L_BPcc! = -3.0) THEN GOTO L_4820e   '@48188 DS:4e86
    PRINT USING "(Viga \    \ Y=#####.##)"; A_122e$(A_157e%(RT_CINT%(INT(FX##(A_1664!(RT_CINT%(FX##(L_BP12!)), 4)))))); RT_PU#(L_BPb8!, "(Viga \    \ Y=#####.##)", 1);   '@4819d DS:5074
    GOTO L_4822c   '@48206
L_4820e:
    IF NOT (L_BPcc! = -4.0) THEN GOTO L_4822c   '@4820f DS:4f06
    GOTO L_4822c   '@48224
L_4822c:
    CALL MIXT_07f1_LimpaTeclado   '@4822c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@48236
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(L_BPb8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@48252 DS:481c,4cac
    L_BPd0$ = V_0e0c$   '@482ca
    IF NOT (L_BPd0$ <> "S") THEN GOTO L_48308   '@482dd DS:49d2
    IF NOT (L_BPd0$ = "s") THEN GOTO L_4856b   '@482f5 DS:49d8
L_48308:
    IF NOT (L_BP36! > 0.0) THEN GOTO L_48437   '@48308 DS:4814
    IF NOT (A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 2) = L_BP16! AND (A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 1) = L_BP12! AND A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 0) = L_BP0e!)) THEN GOTO L_48432   '@48322
    BEEP   '@4841b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48425
L_48432:
L_48437:
    L_BP48% = A_1832%(0, 0) + 1   '@48437
    L_BP36! = FX##(L_BP36!) + 1.0   '@48453 DS:4810
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 0) = RT_CINT%(FX##(L_BP0e!))   '@48467
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 1) = RT_CINT%(FX##(L_BP12!))   '@484af
    A_1832%(RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!), 2) = RT_CINT%(FX##(L_BP16!))   '@484f8
    GOSUB L_4adff   '@4853e
    L_BP52! = L_BPb8!   '@4854b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@4855b
L_4856b:
    IF NOT (L_BPd0$ <> "P") THEN GOTO L_48591   '@4856b DS:4e8a
    IF NOT (L_BPd0$ = "p") THEN GOTO L_485c8   '@4857e DS:4f0a
L_48591:
    L_BP52! = L_BPb8! + 0.100000001490116119384765625##   '@48591 DS:48fc
    V_0e18$ = "P"   '@485a6 DS:4e8a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@485b8
L_485c8:
    IF NOT (L_BPd0$ <> "V") THEN GOTO L_485ee   '@485c8 DS:4904
    IF NOT (L_BPd0$ = "v") THEN GOTO L_48625   '@485db DS:490a
L_485ee:
    L_BP52! = L_BPb8! + 0.100000001490116119384765625##   '@485ee DS:48fc
    V_0e18$ = "V"   '@48603 DS:4904
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48615
L_48625:
    IF NOT (L_BPd0$ <> "B") THEN GOTO L_4864b   '@48625 DS:4f10
    IF NOT (L_BPd0$ = "b") THEN GOTO L_48653   '@48638 DS:4f16
L_4864b:
    GOTO L_4938f   '@4864b
L_48653:
    IF NOT (L_BPd0$ <> "E") THEN GOTO L_48679   '@48653 DS:4c2a
    IF NOT (L_BPd0$ = "e") THEN GOTO L_486b0   '@48666 DS:4c30
L_48679:
    L_BP52! = L_BPb8! + 0.100000001490116119384765625##   '@48679 DS:48fc
    V_0e18$ = "E"   '@4868e DS:4c2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@486a0
L_486b0:
    IF NOT (L_BPd0$ <> "X") THEN GOTO L_486d6   '@486b0 DS:4f1c
    IF NOT (L_BPd0$ = "x") THEN GOTO L_4870d   '@486c3 DS:4f22
L_486d6:
    L_BP52! = L_BPb8! + 0.100000001490116119384765625##   '@486d6 DS:48fc
    V_0e18$ = "VPBE"   '@486eb DS:4dee
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@486fd
L_4870d:
    IF NOT (L_BPd0$ <> "A") THEN GOTO L_48733   '@4870d DS:4f28
    IF NOT (L_BPd0$ = "a") THEN GOTO L_48790   '@48720 DS:4f2e
L_48733:
    IF NOT (L_BP36! = 0.0) THEN GOTO L_4875f   '@48733 DS:4814
    BEEP   '@4874d
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48757
L_4875f:
    L_BP36! = FX##(L_BP36!) - 1.0   '@4875f DS:4cac
    GOSUB L_4adff   '@48773
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_47e8b   '@48780
L_48790:
    IF NOT (L_BPd0$ <> "R") THEN GOTO L_487b6   '@48790 DS:4f34
    IF NOT (L_BPd0$ = "r") THEN GOTO L_48932   '@487a3 DS:4f3a
L_487b6:
    IF NOT (L_BP86!(0, 0) < 2.0) THEN GOTO L_487f3   '@487b6 DS:4818
    BEEP   '@487e1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_47e8b   '@487eb
L_487f3:
    IF NOT (L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 0) < L_BP5e!) THEN GOTO L_4884e   '@487f3 DS:4cac
    BEEP   '@4883c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_47e8b   '@48846
L_4884e:
    L_BP52! = FX##(L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 0)) - 1.0   '@4884e DS:4cac
    V_0e18$ = RT_MID$(("EPVB"), (RT_CINT%(ABS(FX##(L_BP86!(RT_CINT%(FX##(L_BP86!(0, 0)) - 1.0), 1))))), (1))   '@48892 DS:4cac,4f40
    L_BP86!(0, 0) = FX##(L_BP86!(0, 0)) - 2.0   '@488ec DS:4e90
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48922
L_48932:
    IF NOT (L_BPd0$ <> "C") THEN GOTO L_48958   '@48932 DS:46fa
    IF NOT (L_BPd0$ = "c") THEN GOTO L_48a9e   '@48945 DS:4700
L_48958:
    LOCATE 24, 1   '@48958
    PRINT " "; RT_TAB$(79); ""; " "   '@48973 DS:47b2,4c36
    LOCATE 25, 1   '@4899c
    PRINT " "; RT_TAB$(79); ""; " ";   '@489b7 DS:47b2,4c36
    IF NOT (L_BP36! > 0.0) THEN GOTO L_48a8e   '@489e0 DS:4814
    LOCATE 24, 1   '@489fa
    PRINT " Confirme CANCELAR Cotas definidas S/*N* ";   '@48a15 DS:4f48
    CALL MIXT_07f1_LimpaTeclado   '@48a23
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@48a2d DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_48a6c   '@48a47 DS:49d2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48a64
L_48a6c:
    L_BP36! = 0.0   '@48a6c DS:4814
    GOSUB L_4adff   '@48a7c
L_48a8e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4514a   '@48a8e
L_48a9e:
    IF NOT (L_BPd0$ <> "F") THEN GOTO L_48ac4   '@48a9e DS:4f76
    IF NOT (L_BPd0$ = "f") THEN GOTO L_49382   '@48ab1 DS:4f7c
L_48ac4:
    IF NOT (L_BP36! < 2.0) THEN GOTO L_48af5   '@48ac4 DS:4818
    BEEP   '@48ade
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48ae8
L_48af5:
    LOCATE 24, 1   '@48af5
    PRINT " "; RT_TAB$(79); ""; " "   '@48b10 DS:47b2,4c36
    LOCATE 25, 1   '@48b39
    PRINT " "; RT_TAB$(79); ""; " ";   '@48b54 DS:47b2,4c36
    LOCATE 24, 1   '@48b7d
    PRINT " Confirme Cotas definidas N/*S* ";   '@48b98 DS:4f82
    CALL MIXT_07f1_LimpaTeclado   '@48ba6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0e0c$   '@48bb0 DS:47b2 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) = "N") THEN GOTO L_48bef   '@48bca DS:47fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@48be7
L_48bef:
    A_1804!(0, 0) = FX##(A_1804!(0, 0)) + 1.0   '@48bef DS:4810
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 0) = 0.0   '@48c23 DS:4814
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 4) = A_1832%(0, 0) + 1   '@48c5c
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 5) = L_BP36!   '@48cac
    A_1832%(0, 0) = RT_CINT%(FX##(A_1832%(0, 0)) + L_BP36!)   '@48ce5
    LOCATE 25, 1   '@48d22
    PRINT " As medidas serao mostradas <D>entro ou <F>ora do desenho ";   '@48d3d DS:4fa6
    CALL MIXT_07f1_LimpaTeclado   '@48d4b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_48d5a:
    V_0e0c$ = RT_INPUT$(1)   '@48d5a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPd2% = (UCASE$(V_0e0c$) = "D")   '@48d76 DS:4d58
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF (UCASE$(V_0e0c$) = "F" OR L_BPd2%) = 0 THEN GOTO L_48d5a   '@48d9e DS:4f76
    IF NOT (UCASE$(V_0e0c$) = "F") THEN GOTO L_48e1a   '@48dbb DS:4f76
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 1) = -1000.0   '@48dd8 DS:4df6
    GOTO L_49355   '@48e12
L_48e1a:
    LOCATE 25, 1   '@48e1a
    PRINT " Escolha a posicao desejada para a linha de medidas e acione <Enter>";   '@48e35 DS:4fe4
    V_11d4! = INT((FX##(V_259a!) + V_2592!) / 2.0)   '@48e43 DS:4818
L_48e6a:
    RT_GCAIXA RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) + V_2582! + 1.0), RT_SNG!(165.0 - INT((FX##(V_2596!) - V_2596!) * V_258e!)), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@48e6a DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_259e!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_2596!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 40   '@48f35 DS:481c
L_48fde:
    V_0e0c$ = RT_INKEY$   '@48fde
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPd6$ = V_0e0c$   '@48ff2
    IF NOT (L_BPd6$ <> "4") THEN GOTO L_49045   '@49005 DS:5090
    IF NOT (CHR$(0) + CHR$(75) = L_BPd6$) THEN GOTO L_49123   '@4901d
L_49045:
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@49045 DS:481c,4cac
    V_11d4! = V_11d4! - INT((FX##(V_259a!) + V_2592!) / 30.0)   '@490bd DS:4cc0
    IF NOT (V_11d4! < V_2592!) THEN GOTO L_49113   '@490e7
    V_11d4! = V_2592!   '@49102
L_49113:
    GOTO L_49322   '@49113
L_49123:
    IF NOT (L_BPd6$ <> "6") THEN GOTO L_4915e   '@49123 DS:5096
    IF NOT (CHR$(0) + CHR$(77) = L_BPd6$) THEN GOTO L_49239   '@49136
L_4915e:
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@4915e DS:481c,4cac
    V_11d4! = INT((FX##(V_259a!) + V_2592!) / 30.0) + V_11d4!   '@491d6 DS:4cc0
    IF NOT (V_11d4! > V_259a!) THEN GOTO L_49229   '@491fd
    V_11d4! = V_259a!   '@49218
L_49229:
    GOTO L_49322   '@49229
L_49239:
    IF NOT (CHR$(13) = L_BPd6$) THEN GOTO L_49314   '@49239
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@49252 DS:481c,4cac
    A_1804!(RT_CINT%(FX##(A_1804!(0, 0))), 1) = V_11d4!   '@492ca
    GOTO L_49322   '@49304
L_49314:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48fde   '@49319
L_49322:
    IF NOT (CHR$(13) = V_0e0c$) THEN GOTO L_49347   '@49322
    GOTO L_49350   '@4933f
L_49347:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_48e6a   '@49347
L_49350:
L_49355:
    L_BP36! = 0.0   '@49355 DS:4814
    GOSUB L_4adff   '@49365
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4514a   '@49372
L_49382:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_47e8b   '@49382
L_4938f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473ed   '@4938f
L_4939f:
    IF NOT (L_BP8e$ <> "I") THEN GOTO L_493c5   '@4939f DS:4a94
    IF NOT (L_BP8e$ = "i") THEN GOTO L_493d5   '@493b2 DS:4a9a
L_493c5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44ff3   '@493c5
L_493d5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44ff3   '@493d5
L_493ea:
    IF NOT (L_BP8a$ <> "A") THEN GOTO L_49410   '@493ea DS:4f28
    IF NOT (L_BP8a$ = "a") THEN GOTO L_4a8a9   '@493fd DS:4f2e
L_49410:
L_49415:
    IF NOT (V_1802% = 0) THEN GOTO L_49431   '@4941a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44ff3   '@49429
L_49431:
    LOCATE 25, 1   '@49431
    PRINT " "; RT_TAB$(79); ""; "";   '@4944c DS:47b2,4c36
    LOCATE 23, 1   '@49475
    PRINT " Visualizacao e Alteracao das linhas de medidas da Forma"; RT_TAB$(79); ""; ""   '@49490 DS:47b2,509c
    LOCATE 24, 1   '@494b9
    PRINT " Altera <H>orizontais   Altera <V>erticais   Altera <I>nclinadas   <*R*>etorna"; RT_TAB$(79); ""; ""   '@494d4 DS:47b2,50d8
    CALL MIXT_07f1_LimpaTeclado   '@494fd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@49507
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPda$ = V_0e0c$   '@49523
    IF NOT (L_BPda$ <> "H") THEN GOTO L_49561   '@49536 DS:4de2
    IF NOT (L_BPda$ = "h") THEN GOTO L_49ec8   '@4954e DS:4de8
L_49561:
    L_BP4a% = 1   '@49561
L_49570:
    IF NOT (L_BP4a% <= A_1804!(0, 0)) THEN GOTO L_49eb8   '@49570
    IF NOT (A_1804!(L_BP4a%, 0) = 1.0) THEN GOTO L_49ea8   '@49598 DS:4810
    L_BP48% = RT_CINT%(FX##(A_1804!(L_BP4a%, 4)))   '@495c4
    L_BP36! = A_1804!(L_BP4a%, 5)   '@495e8
    GOSUB L_4a8bb   '@4960a
    LOCATE 24, 1   '@49617
    PRINT " <S>im visualizo e altero cota indicada    <*P*>roxima    <C>ancela"; RT_TAB$(79); ""; ""   '@49632 DS:47b2,512a
    CALL MIXT_07f1_LimpaTeclado   '@4965b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@49665
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPde$ = V_0e0c$   '@49681
    IF NOT (L_BPde$ <> "S") THEN GOTO L_496bf   '@49694 DS:49d2
    IF NOT (L_BPde$ = "s") THEN GOTO L_49e2e   '@496ac DS:49d8
L_496bf:
L_496c4:
    LOCATE 24, 1   '@496c9
    PRINT " <E>limino linha de cotas    mostra <F>ora    mostra <D>entro    <*P*>roxima"; RT_TAB$(79); ""; ""   '@496e4 DS:47b2,5172
    CALL MIXT_07f1_LimpaTeclado   '@4970d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@49717
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe2$ = V_0e0c$   '@49733
    IF NOT (L_BPe2$ <> "E") THEN GOTO L_49771   '@49746 DS:4c2a
    IF NOT (L_BPe2$ = "e") THEN GOTO L_497ca   '@4975e DS:4c30
L_49771:
    GOSUB L_4b45f   '@49771
    IF NOT (V_0e0c$ = "NAO") THEN GOTO L_4979d   '@4977e DS:51c2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_496c4   '@49795
L_4979d:
    L_BP36! = 0.0   '@4979d DS:4814
    GOSUB L_4a8bb   '@497ad
    L_BP4a% = L_BP4a% - 1   '@497ba
    GOTO L_49e26   '@497c2
L_497ca:
    IF NOT (L_BPe2$ <> "F") THEN GOTO L_497f0   '@497ca DS:4f76
    IF NOT (L_BPe2$ = "f") THEN GOTO L_49818   '@497dd DS:4f7c
L_497f0:
    A_1804!(L_BP4a%, 2) = -1000.0   '@497f0 DS:4df6
    GOTO L_49e26   '@49810
L_49818:
    IF NOT (L_BPe2$ <> "D") THEN GOTO L_4983e   '@49818 DS:4d58
    IF NOT (L_BPe2$ = "d") THEN GOTO L_49e04   '@4982b DS:4d5e
L_4983e:
    LOCATE 24, 1   '@4983e
    PRINT " Escolha a posicao desejada para a linha de medidas e acione <Enter>"; RT_TAB$(79); ""; ""   '@49859 DS:47b2,4fe4
    V_11d8! = A_1804!(L_BP4a%, 2)   '@49882
    IF NOT (V_11d8! >= V_259e! OR (V_11d8! <= V_2596! OR V_11d8! = -1000.0)) THEN GOTO L_49922   '@498a2 DS:4df6
    V_11d8! = INT((FX##(V_259e!) + V_2596!) / 2.0)   '@498fb DS:4818
L_49922:
L_49928:
    RT_GCAIXA RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), RT_SNG!(INT((FX##(V_259a!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) + 1.0), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@49928 DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(V_2592!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_259a!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_11d8!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 40   '@499f3 DS:481c
L_49a9c:
    V_0e0c$ = RT_INKEY$   '@49a9c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe6$ = V_0e0c$   '@49ab0
    IF NOT (L_BPe6$ <> "2") THEN GOTO L_49b03   '@49ac3 DS:502c
    IF NOT (CHR$(0) + CHR$(80) = L_BPe6$) THEN GOTO L_49be1   '@49adb
L_49b03:
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@49b03 DS:481c,4cac
    V_11d8! = V_11d8! - INT((FX##(V_259e!) + V_2596!) / 30.0)   '@49b7b DS:4cc0
    IF NOT (V_11d8! < V_2596!) THEN GOTO L_49bd1   '@49ba5
    V_11d8! = V_2596!   '@49bc0
L_49bd1:
    GOTO L_49dc6   '@49bd1
L_49be1:
    IF NOT (L_BPe6$ <> "8") THEN GOTO L_49c1c   '@49be1 DS:5032
    IF NOT (CHR$(0) + CHR$(72) = L_BPe6$) THEN GOTO L_49cf7   '@49bf4
L_49c1c:
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@49c1c DS:481c,4cac
    V_11d8! = INT((FX##(V_259e!) + V_2596!) / 30.0) + V_11d8!   '@49c94 DS:4cc0
    IF NOT (V_11d8! > V_259e!) THEN GOTO L_49ce7   '@49cbb
    V_11d8! = V_259e!   '@49cd6
L_49ce7:
    GOTO L_49dc6   '@49ce7
L_49cf7:
    IF NOT (CHR$(13) = L_BPe6$) THEN GOTO L_49db8   '@49cf7
    RT_GPONTO RT_SNG!(INT((FX##(V_2592!) - V_2592!) * V_258a!) + V_2582!), RT_SNG!(165.0 - INT((FX##(V_11d8!) - V_2596!) * V_258e!) - 1.0), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@49d10 DS:481c,4cac
    A_1804!(L_BP4a%, 2) = V_11d8!   '@49d88
    GOTO L_49dc6   '@49da8
L_49db8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49a9c   '@49dbd
L_49dc6:
    IF NOT (CHR$(13) = V_0e0c$) THEN GOTO L_49deb   '@49dc6
    GOTO L_49df4   '@49de3
L_49deb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49928   '@49deb
L_49df4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_496c4   '@49df4
L_49e04:
    L_BP36! = 0.0   '@49e04 DS:4814
    GOSUB L_4a8bb   '@49e14
L_49e26:
    GOTO L_49ea3   '@49e26
L_49e2e:
    IF NOT (L_BPde$ <> "C") THEN GOTO L_49e54   '@49e2e DS:46fa
    IF NOT (L_BPde$ = "c") THEN GOTO L_49e81   '@49e41 DS:4700
L_49e54:
    L_BP36! = 0.0   '@49e54 DS:4814
    GOSUB L_4a8bb   '@49e64
    GOTO L_49eb8   '@49e71
L_49e81:
    L_BP36! = 0.0   '@49e81 DS:4814
    GOSUB L_4a8bb   '@49e91
L_49ea3:
L_49ea8:
    L_BP4a% = L_BP4a% + 1   '@49ea8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49570   '@49eb0
L_49eb8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49415   '@49eb8
L_49ec8:
    IF NOT (L_BPda$ <> "V") THEN GOTO L_49eee   '@49ec8 DS:4904
    IF NOT (L_BPda$ = "v") THEN GOTO L_4a85e   '@49edb DS:490a
L_49eee:
    L_BP4a% = 1   '@49eee
L_49efe:
    IF NOT (L_BP4a% <= A_1804!(0, 0)) THEN GOTO L_4a84e   '@49efe
    IF NOT (A_1804!(L_BP4a%, 0) = 0.0) THEN GOTO L_4a83e   '@49f26 DS:4814
    L_BP48% = RT_CINT%(FX##(A_1804!(L_BP4a%, 4)))   '@49f52
    L_BP36! = A_1804!(L_BP4a%, 5)   '@49f76
    GOSUB L_4adff   '@49f98
    LOCATE 24, 1   '@49fa5
    PRINT " <S>im visualizo e altero cota indicada    <*P*>roxima    <C>ancela"; RT_TAB$(79); ""; ""   '@49fc0 DS:47b2,512a
    CALL MIXT_07f1_LimpaTeclado   '@49fe9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@49ff3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPea$ = V_0e0c$   '@4a00f
    IF NOT (L_BPea$ <> "S") THEN GOTO L_4a04d   '@4a022 DS:49d2
    IF NOT (L_BPea$ = "s") THEN GOTO L_4a7c4   '@4a03a DS:49d8
L_4a04d:
L_4a052:
    LOCATE 24, 1   '@4a057
    PRINT " <E>limino linha de cotas    mostra <F>ora    mostra <D>entro    <*P*>roxima"; RT_TAB$(79); ""; ""   '@4a072 DS:47b2,5172
    CALL MIXT_07f1_LimpaTeclado   '@4a09b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0e0c$ = RT_INPUT$(1)   '@4a0a5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPee$ = V_0e0c$   '@4a0c1
    IF NOT (L_BPee$ <> "E") THEN GOTO L_4a0ff   '@4a0d4 DS:4c2a
    IF NOT (L_BPee$ = "e") THEN GOTO L_4a158   '@4a0ec DS:4c30
L_4a0ff:
    GOSUB L_4b45f   '@4a0ff
    IF NOT (V_0e0c$ = "NAO") THEN GOTO L_4a12b   '@4a10c DS:51c2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a052   '@4a123
L_4a12b:
    L_BP36! = 0.0   '@4a12b DS:4814
    GOSUB L_4adff   '@4a13b
    L_BP4a% = L_BP4a% - 1   '@4a148
    GOTO L_4a7bc   '@4a150
L_4a158:
    IF NOT (L_BPee$ <> "F") THEN GOTO L_4a17e   '@4a158 DS:4f76
    IF NOT (L_BPee$ = "f") THEN GOTO L_4a1a9   '@4a16b DS:4f7c
L_4a17e:
    A_1804!(L_BP4a%, 1) = -1000.0   '@4a17e DS:4df6
    GOTO L_4a7bc   '@4a1a1
L_4a1a9:
    IF NOT (L_BPee$ <> "D") THEN GOTO L_4a1cf   '@4a1a9 DS:4d58
    IF NOT (L_BPee$ = "d") THEN GOTO L_4a79a   '@4a1bc DS:4d5e
L_4a1cf:
    LOCATE 24, 1   '@4a1cf
    PRINT " Escolha a posicao desejada para a linha de medidas e acione <Enter>"; RT_TAB$(79); ""; ""   '@4a1ea DS:47b2,4fe4
    V_11d4! = A_1804!(L_BP4a%, 1)   '@4a213
    IF NOT (V_11d4! >= V_259a! OR (V_11d4! <= V_2592! OR V_11d4! = -1000.0)) THEN GOTO L_4a2b6   '@4a236 DS:4df6
    V_11d4! = INT((FX##(V_259a!) + V_2592!) / 2.0)   '@4a28f DS:4818
L_4a2b6:
L_4a2bc:
    RT_GCAIXA RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) + V_2582! + 1.0), RT_SNG!(165.0 - INT((FX##(V_2596!) - V_2596!) * V_258e!)), 1: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP70%(1): RT_GFIM   '@4a2bc DS:4810,481c,4cac
    RT_LINE RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_259e!) - V_2596!) * V_258e!), RT_SNG!((FX##(V_11d4!) - V_2592!) * V_258a! + V_2582!), RT_SNG!(165.0 - (FX##(V_2596!) - V_2596!) * V_258e!), 73, RT_CINT%(FX##(V_256e!)), 40   '@4a387 DS:481c
L_4a430:
    V_0e0c$ = RT_INKEY$   '@4a430
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf2$ = V_0e0c$   '@4a444
    IF NOT (L_BPf2$ <> "4") THEN GOTO L_4a497   '@4a457 DS:5090
    IF NOT (CHR$(0) + CHR$(75) = L_BPf2$) THEN GOTO L_4a575   '@4a46f
L_4a497:
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@4a497 DS:481c,4cac
    V_11d4! = V_11d4! - INT((FX##(V_259a!) + V_2592!) / 30.0)   '@4a50f DS:4cc0
    IF NOT (V_11d4! < V_2592!) THEN GOTO L_4a565   '@4a539
    V_11d4! = V_2592!   '@4a554
L_4a565:
    GOTO L_4a75c   '@4a565
L_4a575:
    IF NOT (L_BPf2$ <> "6") THEN GOTO L_4a5b0   '@4a575 DS:5096
    IF NOT (CHR$(0) + CHR$(77) = L_BPf2$) THEN GOTO L_4a68b   '@4a588
L_4a5b0:
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@4a5b0 DS:481c,4cac
    V_11d4! = INT((FX##(V_259a!) + V_2592!) / 30.0) + V_11d4!   '@4a628 DS:4cc0
    IF NOT (V_11d4! > V_259a!) THEN GOTO L_4a67b   '@4a64f
    V_11d4! = V_259a!   '@4a66a
L_4a67b:
    GOTO L_4a75c   '@4a67b
L_4a68b:
    IF NOT (CHR$(13) = L_BPf2$) THEN GOTO L_4a74f   '@4a68b
    RT_GPONTO RT_SNG!(INT((FX##(V_11d4!) - V_2592!) * V_258a!) - 1.0 + V_2582!), RT_SNG!(165.0 - INT((FX##(V_259e!) - V_2596!) * V_258e!)), 0: PUT (RG_GX1, RG_GY1), L_BP70%(1), PSET: RT_GFIM   '@4a6a4 DS:481c,4cac
    A_1804!(L_BP4a%, 1) = V_11d4!   '@4a71c
    GOTO L_4a75c   '@4a73f
L_4a74f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a430   '@4a754
L_4a75c:
    IF NOT (CHR$(13) = V_0e0c$) THEN GOTO L_4a781   '@4a75c
    GOTO L_4a78a   '@4a779
L_4a781:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a2bc   '@4a781
L_4a78a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a052   '@4a78a
L_4a79a:
    L_BP36! = 0.0   '@4a79a DS:4814
    GOSUB L_4adff   '@4a7aa
L_4a7bc:
    GOTO L_4a839   '@4a7bc
L_4a7c4:
    IF NOT (L_BPea$ <> "C") THEN GOTO L_4a7ea   '@4a7c4 DS:46fa
    IF NOT (L_BPea$ = "c") THEN GOTO L_4a817   '@4a7d7 DS:4700
L_4a7ea:
    L_BP36! = 0.0   '@4a7ea DS:4814
    GOSUB L_4adff   '@4a7fa
    GOTO L_4a84e   '@4a807
L_4a817:
    L_BP36! = 0.0   '@4a817 DS:4814
    GOSUB L_4adff   '@4a827
L_4a839:
L_4a83e:
    L_BP4a% = L_BP4a% + 1   '@4a83e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49efe   '@4a846
L_4a84e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49415   '@4a84e
L_4a85e:
    IF NOT (L_BPda$ <> "I") THEN GOTO L_4a884   '@4a85e DS:4a94
    IF NOT (L_BPda$ = "i") THEN GOTO L_4a894   '@4a871 DS:4a9a
L_4a884:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44ff3   '@4a884
L_4a894:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44ff3   '@4a894
L_4a8a9:
    GOTO L_4b900   '@4a8ae
    ' ---- F_4a8b6 @0x4a8b6  (04a8b6_F_4a8b6.lift.txt; evidence_id (assembly): ev_644f41ee48d3cce1b0e8588c5483e4616d8fd759030f373d9955349270af053c)
L_4a8bb:   ' sub-rotina (alvo de GOSUB); entrada vinda de 044f95_FUN_4000_4f95
    LOCATE 1, 1   '@4a8c0
    PRINT ""; RT_TAB$(79); ""; ""   '@4a8d5 DS:47b2
    LOCATE 2, 1   '@4a8fe
    PRINT ""; RT_TAB$(79); ""; "";   '@4a919 DS:47b2
    IF NOT (L_BP36! = 0.0) THEN GOTO L_4a966   '@4a942 DS:4814
    RETURN   '@4a95c
L_4a966:
    V_11e4! = 1.0   '@4a966 DS:4810
L_4a97c:
    IF NOT (V_11e4! <= L_BP36!) THEN GOTO L_4adf0   '@4a97d
    L_BP0e! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 0)   '@4a991 DS:4cac
    L_BP12! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 1)   '@4a9ce DS:4cac
    L_BP16! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 2)   '@4aa0c DS:4cac
    L_BPf6! = L_BP0e!   '@4aa47
    IF NOT (L_BPf6! = -1.0) THEN GOTO L_4aab7   '@4aa57 DS:4cac
    L_BP42! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BP12!)), 1)) * 1000.0)) / 10.0#   '@4aa72 DS:4e94,4e98
    GOTO L_4abe4   '@4aaaf
L_4aab7:
    IF NOT (L_BPf6! = -2.0) THEN GOTO L_4ab79   '@4aab8 DS:4e90
    V_11ec! = -L_BP12!   '@4aacd
    CALL S_22ee1   '@4aae0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP12!))), V_13aa%, 6) = 2) THEN GOTO L_4ab3f   '@4aaea
    L_BP42! = V_11d4!   '@4ab27
    GOTO L_4ab71   '@4ab37
L_4ab3f:
    L_BP42! = FX##(A_16ee!(RT_CINT%(FX##(L_BP16!)), 0)) + V_11d4!   '@4ab3f
L_4ab71:
    GOTO L_4abe4   '@4ab71
L_4ab79:
    IF NOT (L_BPf6! = -3.0) THEN GOTO L_4abc6   '@4ab7a DS:4e86
    L_BP42! = A_1664!(RT_CINT%(FX##(L_BP12!)), RT_CINT%(FX##(L_BP16!)))   '@4ab8f
    GOTO L_4abe4   '@4abbe
L_4abc6:
    IF NOT (L_BPf6! = -4.0) THEN GOTO L_4abe4   '@4abc7 DS:4f06
    GOTO L_4abe4   '@4abdc
L_4abe4:
    L_BP5e! = L_BP42!   '@4abe4
    IF NOT (V_11e4! = 1.0) THEN GOTO L_4ac25   '@4abf3 DS:4810
    L_BP3a! = L_BP42!   '@4ac0e
    GOTO L_4ad62   '@4ac1d
L_4ac25:
    RT_LINE RT_SNG!((FX##(L_BP3a!) - V_2592!) * V_258a! + V_2582!), 12.0, RT_SNG!((FX##(L_BP42!) - V_2592!) * V_258a! + V_2582!), 12.0, 9, RT_CINT%(FX##(V_2576!)), 0   '@4ac25 DS:51ca
    V_0e10$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BP42!) - L_BP3a!) * 10.0)) / 10.0#)))   '@4ac95 DS:4900,4e98
    L_BPfa! = ((FX##(L_BP3a!) + L_BP42!) / 2.0 - V_2592!) * V_258a! - LEN(V_0e10$) * 4 + V_2582!   '@4acd5 DS:4818
    L_BPfe! = 9.0   '@4ad13 DS:51ce
    L_BP102$ = "CGA"   '@4ad1e DS:4820
    CALL MIXT_08c4_TextoGrafico(L_BPfa!, L_BPfe!, V_0e10$, L_BP102$)   '@4ad2c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4ad44 libera strings locais (L_BP102)
    L_BP3a! = L_BP42!   '@4ad4e
L_4ad62:
    RT_LINE RT_SNG!((FX##(L_BP3a!) - V_2592!) * V_258a! + V_2582!), 15.0, RT_SNG!((FX##(L_BP3a!) - V_2592!) * V_258a! + V_2582!), 9.0, 9, RT_CINT%(FX##(V_2576!)), 0   '@4ad62 DS:51ce,51d2
    V_11e4! = FX##(V_11e4!) + 1.0   '@4add2 DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4a97c   '@4ade8
L_4adf0:
    RETURN   '@4adf0
L_4adff:   ' sub-rotina (alvo de GOSUB); entrada vinda de 044f95_FUN_4000_4f95
    L_BP104% = (V_0dcc$ = "EGA")   '@4ae04 DS:51d6
    L_BP106% = -(V_0dcc$ = "VGA" OR L_BP104%) * 640   '@4ae2a DS:51de
    L_BP108% = L_BP106% - (V_0dcc$ = "HER") * 720   '@4ae4e DS:51e6
    L_BP10a% = (V_0dcc$ = "CGA")   '@4ae70 DS:4820
    L_BP12! = FX##(-((V_0dcc$ = "MCGA" OR L_BP10a%) * 640 - L_BP108%)) * 0.078125   '@4ae89 DS:51ee,51f6
    L_BP10c% = (V_0dcc$ = "EGA")   '@4aeb3 DS:51d6
    L_BP10e% = -(V_0dcc$ = "VGA" OR L_BP10c%) * 350   '@4aed9 DS:51de
    L_BP110% = L_BP10e% - (V_0dcc$ = "HER") * 350   '@4aefd DS:51e6
    L_BP112% = (V_0dcc$ = "CGA")   '@4af1f DS:4820
    L_BP16! = -((V_0dcc$ = "MCGA" OR L_BP112%) * 200 - L_BP110%) * 0.87999999523162841796875##   '@4af38 DS:51ee,51fa
    RT_VIEW 1, (0), (0), (RT_CINT%(FX##(L_BP12!))), (RT_CINT%(FX##(L_BP16!))), (-1), (-1)   '@4af62 (B$VIEW decodificado)
    RT_CLS 1   '@4af8a
    RT_VIEW 0, 0, 0, 0, 0, -1, -1   '@4af98 (sem argumentos (B$WIN0/B$VEW0))
    IF NOT (L_BP36! = 0.0) THEN GOTO L_4afc6   '@4afa2 DS:4814
    RETURN   '@4afbc
L_4afc6:
    V_11e4! = 1.0   '@4afc6 DS:4810
L_4afdc:
    IF NOT (V_11e4! <= L_BP36!) THEN GOTO L_4b450   '@4afdd
    L_BP0e! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 0)   '@4aff1 DS:4cac
    L_BP12! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 1)   '@4b02e DS:4cac
    L_BP16! = A_1832%(RT_CINT%(L_BP48% + (FX##(V_11e4!) - 1.0)), 2)   '@4b06c DS:4cac
    L_BP116! = L_BP0e!   '@4b0a7
    IF NOT (L_BP116! = -1.0) THEN GOTO L_4b116   '@4b0b7 DS:4cac
    L_BP46! = FX##(RT_CLNG&(FX##(A_0e78!(RT_CINT%(FX##(L_BP12!)), 0)) * 1000.0)) / 10.0#   '@4b0d2 DS:4e94,4e98
    GOTO L_4b244   '@4b10e
L_4b116:
    IF NOT (L_BP116! = -2.0) THEN GOTO L_4b1d9   '@4b117 DS:4e90
    V_11ec! = -L_BP12!   '@4b12c
    CALL S_22ee1   '@4b13f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (A_1496%(A_15ac%(RT_CINT%(FX##(L_BP12!))), V_13aa%, 6) = 2) THEN GOTO L_4b19e   '@4b149
    L_BP46! = V_11d8!   '@4b186
    GOTO L_4b1d1   '@4b196
L_4b19e:
    L_BP46! = FX##(A_16ee!(RT_CINT%(FX##(L_BP16!)), 1)) + V_11d8!   '@4b19e
L_4b1d1:
    GOTO L_4b244   '@4b1d1
L_4b1d9:
    IF NOT (L_BP116! = -3.0) THEN GOTO L_4b226   '@4b1da DS:4e86
    L_BP46! = A_1664!(RT_CINT%(FX##(L_BP12!)), RT_CINT%(FX##(L_BP16!)))   '@4b1ef
    GOTO L_4b244   '@4b21e
L_4b226:
    IF NOT (L_BP116! = -4.0) THEN GOTO L_4b244   '@4b227 DS:4f06
    GOTO L_4b244   '@4b23c
L_4b244:
    L_BP5e! = L_BP46!   '@4b244
    IF NOT (V_11e4! = 1.0) THEN GOTO L_4b285   '@4b253 DS:4810
    L_BP3e! = L_BP46!   '@4b26e
    GOTO L_4b3bb   '@4b27d
L_4b285:
    RT_LINE 5.0, RT_SNG!(165.0 - (FX##(L_BP3e!) - V_2596!) * V_258e!), 5.0, RT_SNG!(165.0 - (FX##(L_BP46!) - V_2596!) * V_258e!), 9, RT_CINT%(FX##(V_2576!)), 0   '@4b285 DS:481c,51fe
    V_0e10$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(RT_CLNG&((FX##(L_BP46!) - L_BP3e!) * 10.0)) / 10.0#)))   '@4b2fb DS:4900,4e98
    L_BP11a! = 10.0   '@4b33b DS:4900
    L_BP11e! = 165.0 - ((FX##(L_BP3e!) + L_BP46!) / 2.0 - V_2596!) * V_258e! + 4.0   '@4b34d DS:4818,481c,5202
    L_BP122$ = "CGA"   '@4b377 DS:4820
    CALL MIXT_08c4_TextoGrafico(L_BP11a!, L_BP11e!, V_0e10$, L_BP122$)   '@4b385
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @4b39d libera strings locais (L_BP122)
    L_BP3e! = L_BP46!   '@4b3a7
L_4b3bb:
    RT_LINE 1.0, RT_SNG!(165.0 - (FX##(L_BP3e!) - V_2596!) * V_258e!), 9.0, RT_SNG!(165.0 - (FX##(L_BP3e!) - V_2596!) * V_258e!), 9, RT_CINT%(FX##(V_2576!)), 0   '@4b3bb DS:4810,481c,51ce
    V_11e4! = FX##(V_11e4!) + 1.0   '@4b431 DS:4810
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4afdc   '@4b447
L_4b450:
    RETURN   '@4b450
L_4b45f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 044f95_FUN_4000_4f95
    LOCATE 24, 1   '@4b464
    PRINT " "; RT_TAB$(79); ""; ""   '@4b47f DS:47b2,4c36
    LOCATE 24, 1   '@4b4a8
    PRINT " Confirme ELIMINAR a linha de cota S/*N* ";   '@4b4c3 DS:5206
    CALL MIXT_07f1_LimpaTeclado   '@4b4d1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0e0c$   '@4b4db DS:47b2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0e0c$) <> "S") THEN GOTO L_4b52e   '@4b4f5 DS:49d2
    V_0e0c$ = "NAO"   '@4b512 DS:51c2
    RETURN   '@4b524
L_4b52e:
    IF NOT (FX##(L_BP48%) + L_BP36! < A_1832%(0, 0)) THEN GOTO L_4b68e   '@4b52e
    L_BP126! = A_1832%(0, 0)   '@4b563
    FOR V_11e4! = FX##(L_BP48%) + L_BP36! TO L_BP126!   '@4b587 DS:4810
    A_1832%(RT_CINT%(FX##(V_11e4!) - L_BP36!), 0) = A_1832%(RT_CINT%(FX##(V_11e4!)), 0)   '@4b596
    A_1832%(RT_CINT%(FX##(V_11e4!) - L_BP36!), 1) = A_1832%(RT_CINT%(FX##(V_11e4!)), 1)   '@4b5d9
    A_1832%(RT_CINT%(FX##(V_11e4!) - L_BP36!), 2) = A_1832%(RT_CINT%(FX##(V_11e4!)), 2)   '@4b61e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@4b65d DS:4810
L_4b68e:
    A_1832%(0, 0) = RT_CINT%(FX##(A_1832%(0, 0)) - L_BP36!)   '@4b68e
    IF NOT (L_BP4a% < A_1804!(0, 0)) THEN GOTO L_4b7e7   '@4b6cb
    L_BP12a! = A_1804!(0, 0)   '@4b6f8
    FOR V_11e4! = L_BP4a% + 1 TO L_BP12a!   '@4b718 DS:4810
    FOR L_BPa2! = 0.0 TO 5.0   '@4b724 DS:4810,4814,51fe
    A_1804!(RT_CINT%(FX##(V_11e4!) - 1.0), RT_CINT%(FX##(L_BPa2!))) = A_1804!(RT_CINT%(FX##(V_11e4!)), RT_CINT%(FX##(L_BPa2!)))   '@4b732 DS:4cac
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPa2!   '@4b78a DS:4810,51fe
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_11e4!   '@4b7b6 DS:4810
L_4b7e7:
    A_1804!(0, 0) = FX##(A_1804!(0, 0)) - 1.0   '@4b7e7 DS:4cac
    L_BP12e! = A_1804!(0, 0)   '@4b81b
    FOR L_BPa2! = 1.0 TO L_BP12e!   '@4b83c DS:4810
    IF NOT (A_1804!(RT_CINT%(FX##(L_BPa2!)), 4) > L_BP48%) THEN GOTO L_4b8c5   '@4b844
    A_1804!(RT_CINT%(FX##(L_BPa2!)), 4) = FX##(A_1804!(RT_CINT%(FX##(L_BPa2!)), 4)) - L_BP36!   '@4b87c
L_4b8c5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPa2!   '@4b8c5 DS:4810
    RETURN   '@4b8f1
L_4b900:   ' entrada vinda de 044f95_FUN_4000_4f95
    ' @4b900 libera strings locais (L_BPf2)
    ' @4b90a libera strings locais (L_BPee)
    ' @4b914 libera strings locais (L_BPea)
    ' @4b91e libera strings locais (L_BPe6)
    ' @4b928 libera strings locais (L_BPe2)
    ' @4b932 libera strings locais (L_BPde)
    ' @4b93c libera strings locais (L_BPda)
    ' @4b946 libera strings locais (L_BPd6)
    ' @4b950 libera strings locais (L_BPd0)
    ' @4b95a libera strings locais (L_BPb4)
    ' @4b964 libera strings locais (L_BPae)
    ' @4b96e libera strings locais (L_BP8e)
    ' @4b978 libera strings locais (L_BP8a)
    ERASE L_BP86!   '@4b982
    ERASE L_BP70%   '@4b98c
    ' END SUB   '@4b995
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_FORMA.BM'
'$INCLUDE: '../comum/MIXT.BM'
