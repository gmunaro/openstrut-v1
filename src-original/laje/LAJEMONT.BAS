' ============================================================================
'  LAJEMONT - OpenStrut V1: engenharia reversa independente do SISTRUT 4.0 (1991),
'  retraduzido do original para QB64 PE. Textos de marca: src-original/marca.json.
'  Gerado por tools/retraduz.py a partir de dump/LAJEMONT/*.lift.txt (fora do repositorio).
'  sha256 do EXE original: 49774a0b034aec7d7d4efc884479cc35175df87013d0ea35f16c3e8f7874e5e9
'  Cada comando termina com '@xxxxx = endereco linear do comando no EXE derivado
'  (prep/, modulos realinhados a 64 KB); os nomes V_/A_xxxx sao enderecos DS:xxxx.
'  Convencoes: docs/RETRADUCAO.md. Correcoes a mao: tools/retraduz.py CORRECOES e <familia>/correcoes.json.
' ============================================================================
'$INCLUDE: '../comum/RT45.BI'
'$INCLUDE: '../comum/RT45GFX.BI'
'$INCLUDE: 'COMUM_LAJE.BI'

' ---- variaveis do LAJEMONT fora do COMMON (DS do programa)
REDIM SHARED A_1342%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_14a4!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_19fe!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1a2c%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1a6a!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1a98$(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1ac6!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1af4!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1b22!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1b50!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1b7e!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1bac!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1bda%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1c08!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1c36!(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1c64%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
REDIM SHARED A_1c92%(-32768 TO -32768, -32768 TO -32768)   ' matriz dinamica: ainda nao dimensionada
DIM SHARED V_1376!
DIM SHARED V_137a!
DIM SHARED V_137e!
DIM SHARED V_1382!
DIM SHARED V_1386!
DIM SHARED V_138a!
DIM SHARED V_138e!
DIM SHARED V_1392!
DIM SHARED V_14da#
DIM SHARED V_14e2#
DIM SHARED V_14ea#
DIM SHARED V_14f2#
DIM SHARED V_14fa#
DIM SHARED V_1502#
DIM SHARED V_150a#
DIM SHARED V_1512#
DIM SHARED V_151a#
DIM SHARED V_1522!
DIM SHARED V_1526!
DIM SHARED V_152a!
DIM SHARED V_152e!
DIM SHARED V_1536!
DIM SHARED V_153a#
DIM SHARED V_1542#
DIM SHARED V_154a#
DIM SHARED V_1552#
DIM SHARED V_155a#
DIM SHARED V_1562#
DIM SHARED V_156a#
DIM SHARED V_1572#
DIM SHARED V_157a#
DIM SHARED V_1582#
DIM SHARED V_158a#
DIM SHARED V_1592#
DIM SHARED V_159a#
DIM SHARED V_15a2#
DIM SHARED V_15aa#
DIM SHARED V_15b2#
DIM SHARED V_15ba!
DIM SHARED V_15be!
DIM SHARED V_15c2!
DIM SHARED V_15c6!
DIM SHARED V_15ca!
DIM SHARED V_15ce!
DIM SHARED V_15d2#
DIM SHARED V_15da#
DIM SHARED V_15e2!
DIM SHARED V_15e6!
DIM SHARED V_15ea!
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
DIM SHARED V_164a#
DIM SHARED V_1652#
DIM SHARED V_165a#
DIM SHARED V_1662#
DIM SHARED V_166a!
DIM SHARED V_166e!
DIM SHARED V_1672!
DIM SHARED V_1676!
DIM SHARED V_167a!
DIM SHARED V_167e!
DIM SHARED V_1682!
DIM SHARED V_1686!
DIM SHARED V_168a$
DIM SHARED V_169e$
DIM SHARED V_16a3%
DIM SHARED V_16a5%
DIM SHARED V_16a7%
DIM SHARED V_16a9%
DIM SHARED V_16ab%
DIM SHARED V_16ad%
DIM SHARED V_16af%
DIM SHARED V_16b1!
DIM SHARED V_16b5!
DIM SHARED V_16b9%
DIM SHARED V_16bb%
DIM SHARED V_16bd!
DIM SHARED V_16c1!
DIM SHARED V_16c5%
DIM SHARED V_16c7%
DIM SHARED V_16c9!
DIM SHARED V_16cd!
DIM SHARED V_16d1%
DIM SHARED V_16d3%
DIM SHARED V_16d5!
DIM SHARED V_16d9!
DIM SHARED V_16dd%
DIM SHARED V_16df%
DIM SHARED V_16e1!
DIM SHARED V_16e5!
DIM SHARED V_16e9%
DIM SHARED V_16eb%
DIM SHARED V_16ed!
DIM SHARED V_16f1!
DIM SHARED V_16f5%
DIM SHARED V_16f7%
DIM SHARED V_16f9!
DIM SHARED V_16fd!
DIM SHARED V_1701%
DIM SHARED V_1703%
DIM SHARED V_1705!
DIM SHARED V_1709!
DIM SHARED V_170d%
DIM SHARED V_170f%
DIM SHARED V_1711!
DIM SHARED V_1715!
DIM SHARED V_1719%
DIM SHARED V_171b%
DIM SHARED V_171d!
DIM SHARED V_1721!
DIM SHARED V_1725%
DIM SHARED V_1727%
DIM SHARED V_1729!
DIM SHARED V_172d!
DIM SHARED V_1731%
DIM SHARED V_1733%
DIM SHARED V_1735!
DIM SHARED V_1739!
DIM SHARED V_173d%
DIM SHARED V_173f%
DIM SHARED V_1741!
DIM SHARED V_1745!
DIM SHARED V_1749%
DIM SHARED V_174b%
DIM SHARED V_174d!
DIM SHARED V_1751!
DIM SHARED V_1761!
DIM SHARED V_1765!
DIM SHARED V_1769!
DIM SHARED V_176d!
DIM SHARED V_1771!
DIM SHARED V_1775!
DIM SHARED V_1779!
DIM SHARED V_177d!
DIM SHARED V_1781!
DIM SHARED V_1785!
DIM SHARED V_1789!
DIM SHARED V_178d!
DIM SHARED V_1791!
DIM SHARED V_1795!
DIM SHARED V_1799!
DIM SHARED V_179d!
DIM SHARED V_17a1!
DIM SHARED V_17a5!
DIM SHARED V_17a9!
DIM SHARED V_17ad!
DIM SHARED V_17b1!
DIM SHARED V_17b5!
DIM SHARED V_17b9!
DIM SHARED V_17bd!
DIM SHARED V_17c1!
DIM SHARED V_17c5!
DIM SHARED V_17c9!
DIM SHARED V_17cd!
DIM SHARED V_17d1!
DIM SHARED V_17d5!
DIM SHARED V_17d9!
DIM SHARED V_17dd!
DIM SHARED V_17e1!
DIM SHARED V_17e5!
DIM SHARED V_17e9!
DIM SHARED V_17ed!
DIM SHARED V_17f1!
DIM SHARED V_17f5!
DIM SHARED V_17f9!
DIM SHARED V_17fd!
DIM SHARED V_1801!
DIM SHARED V_1805!
DIM SHARED V_1809!
DIM SHARED V_180d!
DIM SHARED V_1811!
DIM SHARED V_1815!
DIM SHARED V_1819!
DIM SHARED V_181d!
DIM SHARED V_1821!
DIM SHARED V_1825!
DIM SHARED V_1829!
DIM SHARED V_182d!
DIM SHARED V_1831!
DIM SHARED V_1835!
DIM SHARED V_1839!
DIM SHARED V_183d!
DIM SHARED V_1841!
DIM SHARED V_1845!
DIM SHARED V_1849!
DIM SHARED V_184d!
DIM SHARED V_1851!
DIM SHARED V_1855!
DIM SHARED V_1859!
DIM SHARED V_185d!
DIM SHARED V_1861!
DIM SHARED V_1865!
DIM SHARED V_1869!
DIM SHARED V_186d!
DIM SHARED V_1871!
DIM SHARED V_1875!
DIM SHARED V_1879!
DIM SHARED V_187d!
DIM SHARED V_1881!
DIM SHARED V_1885!
DIM SHARED V_1889!
DIM SHARED V_188d!
DIM SHARED V_1891!
DIM SHARED V_1895!
DIM SHARED V_1899!
DIM SHARED V_189d!
DIM SHARED V_18a1!
DIM SHARED V_18a5!
DIM SHARED V_18a9!
DIM SHARED V_18ad!
DIM SHARED V_18b1!
DIM SHARED V_18b5!
DIM SHARED V_18b9!
DIM SHARED V_18bd!
DIM SHARED V_18c1!
DIM SHARED V_18c5!
DIM SHARED V_18c9!
DIM SHARED V_18cd!
DIM SHARED V_18d1!
DIM SHARED V_18d5!
DIM SHARED V_18d9!
DIM SHARED V_18dd!
DIM SHARED V_18e1!
DIM SHARED V_18e5!
DIM SHARED V_18e9!
DIM SHARED V_18ed!
DIM SHARED V_18f1!
DIM SHARED V_18f5!
DIM SHARED V_18f9!
DIM SHARED V_18fd!
DIM SHARED V_1901!
DIM SHARED V_1905!
DIM SHARED V_1909!
DIM SHARED V_190d!
DIM SHARED V_1911!
DIM SHARED V_1915!
DIM SHARED V_1919!
DIM SHARED V_191d!
DIM SHARED V_1921!
DIM SHARED V_1925!
DIM SHARED V_1929!
DIM SHARED V_192d!
DIM SHARED V_1931!
DIM SHARED V_1935!
DIM SHARED V_1939!
DIM SHARED V_193d!
DIM SHARED V_1941!
DIM SHARED V_1945!
DIM SHARED V_1949!
DIM SHARED V_194d!
DIM SHARED V_1951!
DIM SHARED V_1955!
DIM SHARED V_1959!
DIM SHARED V_195d!
DIM SHARED V_1961!
DIM SHARED V_1965!
DIM SHARED V_1969!
DIM SHARED V_196d!
DIM SHARED V_1971!
DIM SHARED V_1975!
DIM SHARED V_1979!
DIM SHARED V_197d!
DIM SHARED V_1981!
DIM SHARED V_1985!
DIM SHARED V_1989!
DIM SHARED V_198d!
DIM SHARED V_1991!
DIM SHARED V_1995!
DIM SHARED V_1999!
DIM SHARED V_199d!
DIM SHARED V_19a1!
DIM SHARED V_19a5!
DIM SHARED V_19a9!
DIM SHARED V_19ad!
DIM SHARED V_19b1!
DIM SHARED V_19b5!
DIM SHARED V_19b9!
DIM SHARED V_19bd!
DIM SHARED V_19c1!
DIM SHARED V_19c5!
DIM SHARED V_19c9!
DIM SHARED V_19cd!
DIM SHARED V_19d1!
DIM SHARED V_19e2!
DIM SHARED V_19e6!
DIM SHARED V_19ea!
DIM SHARED V_19ee!
DIM SHARED V_19f2!
DIM SHARED V_19f6!
DIM SHARED V_19fa!
DIM SHARED V_1a66$
DIM SHARED RG_168A AS STRING * 855   ' registro de GET/PUT # em DS:168A

ON ERROR GOTO RT_ERRO_FATAL   ' erro sem tratador do programa: RT_ERRO_SEM_TRATADOR (RT45)
RT_INICIO "LAJEMONT"
' ---- M_LAJEMONT @0x10030  (010030_M_LAJEMONT.lift.txt; evidence_id (assembly): ev_5245fc135b4fa94f340258f8b823b763afc68d222753e1d5f57497a93f344ac7)
' @10030 inicio do programa (B$?EVT)
GOTO L_10224   ' PROTECAO: verificacao de licenca do original desativada
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
' PROTECAO (removido)
L_10224:
REDIM A_19fe!(-32768 TO -32768, -32768 TO -32768)   '@10224
REDIM A_1a2c%(-32768 TO -32768, -32768 TO -32768)   '@10232
REDIM A_19fe!(0 TO 200, 0 TO 2)   '@1023b
REDIM A_1a2c%(0 TO V_0e4e%, 0 TO 50)   '@1025f
L_10286:   ' entrada vinda de 01100b_F_1100b, 0112a2_F_112a2
GOSUB L_11010   '@1028b
ON ERROR GOTO L_112a7
RT_ONERR = &H112a7   '@10298
CALL S_3014b   '@102a7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
CALL S_2a7a8   '@102b1
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
IF NOT (V_1a66$ = "S") THEN GOTO L_1035c   '@102bb DS:1d1a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@102d2 DS:1cc0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@102e5 DS:1cc0
RT_LPTABRE: RT_LPS "     REACOES DE LAJES NAS VIGAS E PILARES": RT_LPFIM   '@102f8 DS:1d20
RT_LPTABRE: RT_LPS "                                     - - - -  c a r g a s - - - -": RT_LPFIM   '@1030b DS:1d4e
RT_LPTABRE: RT_LPS "  Laje         Sub-area    Area      Linear   Area   Estru.  Peso  Apoio": RT_LPFIM   '@1031e DS:1d94
RT_LPTABRE: RT_LPS RT_STRINGS$((73), ("-")): RT_LPS "": RT_LPFIM   '@10331 DS:1cc0,1de0
L_1035c:
V_19ee! = 0.0   '@1035c DS:1de6
V_19f2! = 0.0   '@1036d DS:1de6
V_1376! = A_109e%(0, 0)   '@1037e
FOR V_0f0c! = 1.0 TO V_1376!   '@103a3 DS:1dea
RT_VIEWPRINT 23, 25   '@103aa
RT_CLS 2   '@103bc
PRINT " Distribuicao das cargas das Lajes nos Elementos de Apoio"   '@103ca DS:1dee
CALL S_401b9   '@103d8
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
CALL S_20146   '@103e2
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@103ec DS:1dea
V_0ef0! = 0.0   '@10415 DS:1de6
V_137a! = A_0fe6!(0, 0)   '@10426
FOR V_0f0c! = 1.0 TO V_137a!   '@10447 DS:1dea
V_0ef0! = RT_SQR##(RT_POT##((FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 0)) - A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 2)), (2.0)) + RT_POT##((FX##(A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 1)) - A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 3)), (2.0))) * A_0fe6!(RT_CINT%(FX##(V_0f0c!)), 4) + V_0ef0!   '@1044e DS:1e2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@10514 DS:1dea
IF NOT (V_0ef0! > 0.0) THEN GOTO L_106c3   '@10540 DS:1de6
IF NOT (V_1a66$ = "S") THEN GOTO L_105ef   '@1055b DS:1d1a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10572 DS:1cc0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10585 DS:1cc0
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas Lineares ...................... ####.## \      \"; RT_PU#(V_0ef0!, "     Total das Cargas Lineares ...................... ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10598 DS:1e30
RT_LPTABRE: PRINT #RT_LPT, USING "     Total Considerado das Cargas Lineares .......... ####.## \      \"; RT_PU#(V_19e2!, "     Total Considerado das Cargas Lineares .......... ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@105c1 DS:1e7a
L_105ef:
IF NOT (ABS((FX##(V_19e2!) - V_0ef0!) / V_0ef0!) > 0.02999999932944774627685546875##) THEN GOTO L_106be   '@105ef DS:1ec4
RT_VIEWPRINT 23, 25   '@10617
RT_CLS 2   '@10629
PRINT " A Somatoria das Cargas de Alvenaria consideradas nas Lajes e nas Vigas"   '@10637 DS:1ec8
PRINT " difere em mais de 3% da Carga total das Alvenarias ";   '@10645 DS:1f14
PRINT USING "(####.## ####.##)"; RT_PU#(V_0ef0!, "(####.## ####.##)", 1); RT_PU#(V_19e2!, "(####.## ####.##)", 2)   '@10653 DS:1f4c
PRINT " Qualquer Tecla para Continuar ou <F2> para interromper.";   '@1067b DS:1f62
BEEP   '@10689
CALL MIXT_07f1_LimpaTeclado   '@10693
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1069d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
L_106be:
L_106c3:
V_0ef0! = 0.0   '@106c3 DS:1de6
V_0f14! = 1.0   '@106d4 DS:1dea
V_137e! = A_1014!(0, 1)   '@106e5
FOR V_0f0c! = 1.0 TO V_137e!   '@10709 DS:1dea
V_1382! = 0.0   '@10710 DS:1de6
V_1386! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@10721
FOR V_15e2! = 1.0 TO V_1386!   '@1074c DS:1dea
IF NOT (A_1014!(RT_CINT%(FX##(V_0f14!)), 0) > V_15e2!) THEN GOTO L_107f9   '@10754
V_0ef4# = A_1014!(RT_CINT%(FX##(V_0f14!) + V_15e2! + 2.0), 0)   '@10788 DS:1e2c
V_0efc# = A_1014!(RT_CINT%(FX##(V_0f14!) + V_15e2! + 2.0), 1)   '@107bc DS:1e2c
GOTO L_1085d   '@107f1
L_107f9:
V_0ef4# = A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 0)   '@107f9 DS:1e2c
V_0efc# = A_1014!(RT_CINT%(FX##(V_0f14!) + 2.0), 1)   '@10828 DS:1e2c
L_1085d:
V_1382! = V_1382! + (FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + V_15e2! + 1.0), 0)) + V_0ef4#) * (FX##(A_1014!(RT_CINT%(FX##(V_0f14!) + V_15e2! + 1.0), 1)) - V_0efc#) / 2.0#   '@1085d DS:1dea,1f9e
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_15e2!   '@108d4 DS:1dea
V_0ef0! = ABS(FX##(V_1382!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) + V_0ef0!   '@10900 DS:1dea
V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@1093c DS:1e2c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@10970 DS:1dea
IF NOT (V_0ef0! > 0.0) THEN GOTO L_10b0c   '@1099c DS:1de6
IF NOT (V_1a66$ = "S") THEN GOTO L_10a38   '@109b7 DS:1d1a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@109ce DS:1cc0
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas por Area ...................... ####.## \      \"; RT_PU#(V_0ef0!, "     Total das Cargas por Area ...................... ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@109e1 DS:1fa6
RT_LPTABRE: PRINT #RT_LPT, USING "     Total Considerado das Cargas por Area .......... ####.## \      \"; RT_PU#(V_19e6!, "     Total Considerado das Cargas por Area .......... ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10a0a DS:1ff0
L_10a38:
IF NOT (ABS((FX##(V_19e6!) - V_0ef0!) / V_0ef0!) > 0.02999999932944774627685546875##) THEN GOTO L_10b07   '@10a38 DS:1ec4
RT_VIEWPRINT 23, 25   '@10a60
RT_CLS 2   '@10a72
PRINT " A Somatoria de Todas as Cargas por Area aplicadas nas Lajes"   '@10a80 DS:203a
PRINT " difere em mais de 3% da Carga total das Lajes ";   '@10a8e DS:207a
PRINT USING "(####.## ####.##)"; RT_PU#(V_0ef0!, "(####.## ####.##)", 1); RT_PU#(V_19e6!, "(####.## ####.##)", 2)   '@10a9c DS:1f4c
PRINT " Qualquer Tecla para Continuar ou <F2> para interromper.";   '@10ac4 DS:1f62
BEEP   '@10ad2
CALL MIXT_07f1_LimpaTeclado   '@10adc
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10ae6
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
L_10b07:
L_10b0c:
IF NOT (V_1a66$ = "S") THEN GOTO L_10d1c   '@10b0c DS:1d1a
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10b23 DS:1cc0
RT_LPTABRE: PRINT #RT_LPT, USING "     Total do Peso Proprio das Vigas ................ ####.## \      \"; RT_PU#(V_19ea!, "     Total do Peso Proprio das Vigas ................ ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10b36 DS:20ae
RT_LPTABRE: PRINT #RT_LPT, USING "     Total do Peso Proprio das Lajes ................ ####.## \      \"; RT_PU#(V_19ee!, "     Total do Peso Proprio das Lajes ................ ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10b5f DS:20f8
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas de Estrutura .................. ####.## \      \"; RT_PU#(V_19f2!, "     Total das Cargas de Estrutura .................. ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10b88 DS:2142
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas no Painel ..................... ####.## \      \"; RT_PU#(RT_SNG!(FX##(V_19e2!) + V_19e6! + V_19ea! + V_19ee! + V_19f2!), "     Total das Cargas no Painel ..................... ####.## \      \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10bb1 DS:218c
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10bf5 DS:1cc0
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas aplicadas nas Vigas ........... ####.## \       \"; RT_PU#(V_19f6!, "     Total das Cargas aplicadas nas Vigas ........... ####.## \       \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10c08 DS:21d6
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas aplicadas nos Pilares ......... ####.## \       \"; RT_PU#(V_19fa!, "     Total das Cargas aplicadas nos Pilares ......... ####.## \       \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10c31 DS:2222
RT_LPTABRE: PRINT #RT_LPT, USING "     Total das Cargas aplicadas nas Vigas+Pilares ... ####.## \       \"; RT_PU#(RT_SNG!(FX##(V_19f6!) + V_19fa!), "     Total das Cargas aplicadas nas Vigas+Pilares ... ####.## \       \", 1); V_0de0$: RT_LPTQUEBRA 0   '@10c5a DS:226e
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10c8f DS:1cc0
RT_LPTABRE: RT_LPS "": RT_LPFIM   '@10ca2 DS:1cc0
RT_VIEWPRINT 23, 25   '@10cb5
RT_CLS 2   '@10cc7
RT_VIEWPRINT 1, 25   '@10cd5
RT_LPTABRE: RT_LPS V_0e14$: RT_LPFIM   '@10ce7
RT_ROTINA_0AEA   '@10cfa (rotina em assembly ligada ao EXE (SUB_60aea); gerada no fim do programa)
RT_LPTABRE: RT_LPS V_0e08$: RT_LPFIM   '@10d04
L_10d1c:
GOSUB L_112da   '@10d1c
RT_VIEWPRINT 23, 25   '@10d29
RT_CLS 2   '@10d3b
PRINT " Termino da Gravacao dos Arquivos de dados  "; V_0e24$; ".VIG  e  "; V_0e24$; ".RLP"   '@10d49 DS:22ba,22ea,22f8
PRINT "   Aguarde .."   '@10d7b DS:2300
REDIM A_1bda%(-32768 TO -32768, -32768 TO -32768)   '@10d89
REDIM A_1c08!(-32768 TO -32768, -32768 TO -32768)   '@10d97
REDIM A_1c36!(-32768 TO -32768, -32768 TO -32768)   '@10da0
REDIM A_1c64%(-32768 TO -32768, -32768 TO -32768)   '@10da9
REDIM A_1c92%(-32768 TO -32768, -32768 TO -32768)   '@10db2
REDIM A_1ac6!(-32768 TO -32768, -32768 TO -32768)   '@10dbb
REDIM A_1af4!(-32768 TO -32768, -32768 TO -32768)   '@10dc4
REDIM A_1b22!(-32768 TO -32768, -32768 TO -32768)   '@10dcd
REDIM A_1b50!(-32768 TO -32768, -32768 TO -32768)   '@10dd6
REDIM A_1b7e!(-32768 TO -32768, -32768 TO -32768)   '@10ddf
REDIM A_1bac!(-32768 TO -32768, -32768 TO -32768)   '@10de8
REDIM A_1a6a!(-32768 TO -32768, -32768 TO -32768)   '@10df1
REDIM A_1a98$(-32768 TO -32768, -32768 TO -32768)   '@10dff
REDIM A_19fe!(-32768 TO -32768, -32768 TO -32768)   '@10e08
REDIM A_1a2c%(-32768 TO -32768, -32768 TO -32768)   '@10e11
L_10e1f:   ' entrada vinda de 01100b_F_1100b
V_0ef0! = 0.0   '@10e24 DS:1de6
L_10e3a:
ON ERROR GOTO L_10edb
RT_ONERR = &H10edb   '@10e3f
V_0ef4# = RT_FRE&("")   '@10e4e DS:1cc0
IF NOT (V_0ef0! = 3.0) THEN GOTO L_10e8b   '@10e68 DS:2312
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
GOTO L_10286   '@10e83
L_10e8b:
L_BP0c% = (LEN(V_0e04_direxe$) > 3)   '@10e8b
CHDIR RT_ARQ$(RT_LEFT$((V_0e04_direxe$), (LEN(V_0e04_direxe$) + L_BP0c%)))   '@10eaa
RT_CHAIN V_0e04_direxe$ + "LAJEGEOM"   '@10ebe DS:2316
L_10edb:
RESUME L_10ef2   '@10ee0
L_10ef2:
V_0ef0! = FX##(V_0ef0!) + 1.0   '@10ef7 DS:1dea
L_BP0c% = (RT_MID$((V_0e04_direxe$), (1), (1)) = "A")   '@10f0d DS:2322
IF NOT ((RT_MID$((V_0e04_direxe$), (1), (1)) = "B" OR L_BP0c%) <> 0) THEN GOTO L_11003   '@10f3e DS:2328
LOCATE 25, 1   '@10f5d
PRINT " Coloque o Disco Contendo o modulo LAJEGEOM no Drive "; RT_MID$((V_0e04_direxe$), (1), (2));   '@10f78 DS:232e
CALL MIXT_07f1_LimpaTeclado   '@10f9d
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@10fa7
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 1   '@10fc3
PRINT RT_TAB$(79); ""; " ";   '@10fde DS:1cc0,2368
L_11003:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
GOTO L_10e3a   '@11003
' ---- F_1100b @0x1100b  (01100b_F_1100b.lift.txt; evidence_id (assembly): ev_5e4313415c15e46649b2aa775263f6e30611c70eb66996af1765bbec4ed8e42c)
L_11010:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJEMONT
FOR V_138a! = 1.0 TO 10.0   '@11015 DS:1dea,236e
ON KEY(RT_CINT%(FX##(V_138a!))) GOSUB L_1124e
RT_ONKEY RT_CINT%(FX##(V_138a!)), 1   '@11022
KEY(RT_CINT%(FX##(V_138a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_138a!)), 1   '@1103c
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_138a!   '@11051 DS:1dea,236e
KEY 15, CHR$(12) + CHR$(83)
RT_KEYDEF 15, CHR$(12) + CHR$(83)   '@1107a
KEY 16, CHR$(44) + CHR$(83)
RT_KEYDEF 16, CHR$(44) + CHR$(83)   '@110a2
KEY 17, CHR$(76) + CHR$(83)
RT_KEYDEF 17, CHR$(76) + CHR$(83)   '@110ca
KEY 18, CHR$(108) + CHR$(83)
RT_KEYDEF 18, CHR$(108) + CHR$(83)   '@110f2
KEY 19, CHR$(32) + CHR$(1)
RT_KEYDEF 19, CHR$(32) + CHR$(1)   '@1111a
KEY 20, CHR$(64) + CHR$(1)
RT_KEYDEF 20, CHR$(64) + CHR$(1)   '@11142
KEY 21, CHR$(96) + CHR$(1)
RT_KEYDEF 21, CHR$(96) + CHR$(1)   '@1116a
KEY 22, CHR$(0) + CHR$(1)
RT_KEYDEF 22, CHR$(0) + CHR$(1)   '@11192
FOR V_138a! = 15.0 TO 22.0   '@111b9 DS:1dea,2372,2376
ON KEY(RT_CINT%(FX##(V_138a!))) GOSUB L_10e1f
RT_ONKEY RT_CINT%(FX##(V_138a!)), 2   '@111c6
KEY(RT_CINT%(FX##(V_138a!))) ON
RT_KEYESTADO RT_CINT%(FX##(V_138a!)), 1   '@111e0
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_138a!   '@111f5 DS:1dea,2376
ON KEY(2) GOSUB L_10e1f
RT_ONKEY 2, 2   '@1121e
KEY(2) ON
RT_KEYESTADO 2, 1   '@11231
RETURN   '@1123f
L_1124e:
BEEP   '@11253
GOSUB L_11010   '@1125d
RETURN   '@1126a
' @11274 (trecho de 44 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
BEEP   '@1127e
GOSUB L_11010   '@11288
RETURN L_10286   '@1129f
' ---- F_112a2 @0x112a2  (0112a2_F_112a2.lift.txt; evidence_id (assembly): ev_2fbfd4c9917405627a8bc07b91a00946b12c71db7622dd13d304ceb062958586)
L_112a7:   ' entrada vinda de 010030_M_LAJEMONT
RESUME L_112be   '@112ac
L_112be:
CALL S_1321a   '@112c3
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
GOTO L_10286   '@112cd
' ---- F_112d5 @0x112d5  (0112d5_F_112d5.lift.txt; evidence_id (assembly): ev_3f5968fb4a02e409380e8adec31f0b4b1202407469a36d2409efaf1e91247669)
L_112da:   ' sub-rotina (alvo de GOSUB); entrada vinda de 010030_M_LAJEMONT
L_BP0c% = (V_0dfc$ = "A")   '@112df DS:2322
IF NOT ((V_0dfc$ = "B" OR L_BP0c%) <> 0) THEN GOTO L_1139c   '@11304 DS:2328
RT_VIEWPRINT 23, 25   '@11319
RT_CLS 2   '@1132b
BEEP   '@11339
PRINT " Coloque o disco de Dados no Drive "; V_0dfc$; ":"   '@11343 DS:237a,23a2
PRINT " Qualquer tecla para Continuar";   '@11363 DS:23a8
CALL MIXT_07f1_LimpaTeclado   '@11371
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
V_0f18$ = RT_INPUT$(1)   '@1137b
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
L_1139c:
RT_VIEWPRINT 23, 25   '@1139c
RT_CLS 2   '@113ae
PRINT " Gravacao do Arquivo de Vigas (.VIG)"   '@113bc DS:23ca
PRINT "   "; V_0dfc$; ":"; V_0e00$; V_0e24$; ".VIG"   '@113ca DS:23a2,23f2,23fa
V_16a3% = 0   '@11405
OPEN RT_ARQ$(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".VIG") FOR RANDOM AS #1 LEN = 855   '@11410 DS:23a2,23fa,2402
RT_REG_168A_GRAVA 1, 1&   '@11452 (registro de 855 bytes)
CLOSE #1   '@11471
OPEN RT_ARQ$(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".VIG") FOR RANDOM AS #1 LEN = 855   '@11480 DS:23a2,23fa,2402
V_138e! = A_11b2%(0, 0)   '@114c2
FOR V_0f0c! = 1.0 TO V_138e!   '@114e7 DS:1dea
CALL S_33d84   '@114ee
IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY pelo roteiro (entre comandos)
LOCATE 25, 4   '@114f8
PRINT V_0e60$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e5c!) + V_0f0c!))); RT_TAB$(30); ""; "Registro"; V_0f0c!; " /"; A_11b2%(0, 0);   '@11513 DS:1cc0,2408,2414
RT_REG_168A_GRAVA 1, RT_CLNG&(FX##(V_0f0c!) + 1.0)   '@11590 DS:1dea (registro de 855 bytes)
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@115ba DS:1dea
CLOSE #1   '@115e6
V_16a3% = A_11b2%(0, 0)   '@115f5
OPEN RT_ARQ$(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".VIG") FOR RANDOM AS #1 LEN = 855   '@11610 DS:23a2,23fa,2402
RT_REG_168A_GRAVA 1, 1&   '@11652 (registro de 855 bytes)
CLOSE #1   '@11671
RT_VIEWPRINT 23, 25   '@11680
RT_CLS 2   '@11692
PRINT " Gravacao do Arquivo de Cargas em Pilares e Inclinacoes (.RLP)"   '@116a0 DS:241a
PRINT "   "; V_0dfc$; ":"; V_0e00$; V_0e24$; ".RLP"   '@116ae DS:22f8,23a2,23f2
IF RT_DISP%(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".RLP") THEN OPEN RT_ARQ$(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".RLP") FOR APPEND AS #1 ELSE OPEN RT_ARQ$(V_0dfc$ + ":" + V_0e00$ + V_0e24$ + ".RLP") FOR OUTPUT AS #1   '@116e9 DS:22f8,23a2,245c
PRINT #1, "SISTRUT Software e Tecnologia s/c Ltda"   '@1172b DS:2462
PRINT #1, "Versao 4.0    Abril 1991"   '@11742 DS:248c
PRINT #1, ""   '@11759 DS:1cc0
PRINT #1, " SOMATORIA DE REACOES EM PILARES E INCLINACOES GERADAS PELAS LAJES"   '@11770 DS:24a8
PRINT #1, " OBRA "; V_0e24$   '@11787 DS:24ee
PRINT #1, " GERADO EM "; RT_DATE$; "   "; RT_MID$((RT_TIME$), (1), (5))   '@117a7 DS:23f2,24f8
PRINT #1, ""   '@117eb DS:1cc0
V_0f14! = 1.0   '@11802 DS:1dea
V_1392! = A_1156!(0, 0)   '@11813
FOR V_0f0c! = 1.0 TO V_1392!   '@11834 DS:1dea
L_BP0c% = (V_0f0c! > 1.0)   '@1183c DS:1dea
IF NOT ((A_1128$(RT_CINT%(FX##(V_0f0c!))) = V_0f18$ AND L_BP0c%) <> 0) THEN GOTO L_11898   '@1187b
GOTO L_11be0   '@11890
L_11898:
V_0ef0! = FX##(A_1a6a!(RT_CINT%(FX##(V_0f14!)), 0)) + A_1a6a!(RT_CINT%(FX##(V_0f14!)), 1)   '@11898
V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@118e1
V_0f1c$ = ""   '@11907 DS:1cc0
V_15e2! = 0.0   '@11919 DS:1de6
L_11930:
IF NOT (LEN(A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_15e2!)))) > 0) THEN GOTO L_11a30   '@11931
V_0f1c$ = V_0f1c$ + A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_15e2!))) + "[" + LTRIM$(STR$(A_1a6a!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_15e2!) + 2.0)))) + "] >"   '@1195f DS:1e2c,2508,250e
V_15e2! = FX##(V_15e2!) + 1.0   '@119ee DS:1dea
IF NOT (V_15e2! = 4.0) THEN GOTO L_11a27   '@11a04 DS:2516
GOTO L_11a30   '@11a1f
L_11a27:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
GOTO L_11930   '@11a27
L_11a30:
LOCATE 25, 4   '@11a30
IF NOT (VAL(A_1128$(RT_CINT%(FX##(V_0f0c!)))) > 0.0#) THEN GOTO L_11aef   '@11a4b DS:251a
PRINT #1, "P"; A_1128$(RT_CINT%(FX##(V_0f0c!)));   '@11a83 DS:2522
PRINT "P"; A_1128$(RT_CINT%(FX##(V_0f0c!)));   '@11abc DS:2522
GOTO L_11b46   '@11ae7
L_11aef:
PRINT #1, A_1128$(RT_CINT%(FX##(V_0f0c!)));   '@11aef
PRINT A_1128$(RT_CINT%(FX##(V_0f0c!)));   '@11b1f
L_11b46:
PRINT #1, TAB(16);: PRINT #1, USING "#######.###"; RT_PU#(V_0ef0!, "#######.###", 1)   '@11b46 DS:2528
PRINT TAB(16);: PRINT USING "#######.### \\"; RT_PU#(V_0ef0!, "#######.### \\", 1); TAB(75); "";   '@11b73 DS:1cc0,2538
PRINT #1, V_0f1c$   '@11bae
V_0f14! = FX##(V_0f14!) + 1.0   '@11bc5 DS:1dea
L_11be0:
IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN RT_EV = RT_EVENTO: RT_EVENTO = 0: ON RT_EV GOSUB L_1124e, L_10e1f   ' ON KEY no laco (B$EVCK)
NEXT V_0f0c!   '@11be5 DS:1dea
PRINT #1, "FIM"   '@11c11 DS:254a
CLOSE #1   '@11c28
RETURN   '@11c37
' @11c41 (trecho de 6 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
GOTO L_13212   '@11c41
' ---- FUN_1000_3212 @0x13212  (013212_FUN_1000_3212.lift.txt; evidence_id (assembly): ev_b9db64266c9f465437ec807a8c48c17846a23a57cc61a54f2c0bf4d4cc1c9822)
L_13212:   ' entrada vinda de 0112d5_F_112d5
GOTO L_13318   '@13212
' ---- FUN_1000_3318 @0x13318  (013318_FUN_1000_3318.lift.txt; evidence_id (assembly): ev_748df8e6116389c173a91bde0189d5af815302b31d7f5c7e0ae1fc0a3c6c14bb)
L_13318:   ' entrada vinda de 013212_FUN_1000_3212
GOTO L_13a6b   '@13318
' ---- FUN_1000_3a6b @0x13a6b  (013a6b_FUN_1000_3a6b.lift.txt; evidence_id (assembly): ev_fd516496d40d37c89826ddeed416546c7e7d27748b3d253b030ecb08cffc6002)
L_13a6b:   ' entrada vinda de 013318_FUN_1000_3318
GOTO L_15181   '@13a6b
' ---- FUN_1000_5181 @0x15181  (015181_FUN_1000_5181.lift.txt; evidence_id (assembly): ev_164ca72d9715c623a5ceebabfeb3d3c997d3e7ce4b20578270db9154664e290c)
L_15181:   ' entrada vinda de 013a6b_FUN_1000_3a6b
GOTO L_15788   '@15181
' ---- FUN_1000_5788 @0x15788  (015788_FUN_1000_5788.lift.txt; evidence_id (assembly): ev_595131bd7d670e63cab1cd9596eda1f59e1ccdf6b285d07a8fce4b564925dd91)
L_15788:   ' entrada vinda de 015181_FUN_1000_5181
GOTO L_17b59   '@15788
' ---- FUN_1000_7b59 @0x17b59  (017b59_FUN_1000_7b59.lift.txt; evidence_id (assembly): ev_75c2e5b115d7b7e7a7c260366583992674ab9fc2ba5caf62c55641a13805e41a)
L_17b59:   ' entrada vinda de 015788_FUN_1000_5788
GOTO L_18131   '@17b59
' ---- RT_EA @0x18131  (018131_RT_EA.lift.txt; evidence_id (assembly): ev_c23a7d2cba5c0fed685c7c51c0d7810a0acbde31524bbebc7e6ccd9abb7290b2)
L_18131:   ' entrada vinda de 017b59_FUN_1000_7b59
RT_FIM   ' @18131 B$CENP (inicio/fim do modulo)
' ---- M_LAJECARR @0x20030  (020030_M_LAJECARR.lift.txt; evidence_id (assembly): ev_1409643fd1d2663dbf4dfd745885d377cf45dbdb56bf0bf45affec42a61636e3)
' @20030 inicio do programa (B$?EVT)
GOTO L_2a7a0   '@2013e
' ---- FUN_2000_a7a0 @0x2a7a0  (02a7a0_FUN_2000_a7a0.lift.txt; evidence_id (assembly): ev_eabdec25b327ef353ae6fa8c34216eb5d0d87c3605aa8828bdbe48db8c8ad9b4)
L_2a7a0:   ' entrada vinda de 020030_M_LAJECARR
GOTO L_2e7eb   '@2a7a0
' ---- RT_EA @0x2e7eb  (02e7eb_RT_EA.lift.txt; evidence_id (assembly): ev_678c1853c6a2d4cee89a42062a4c50cabaf48006566e5c401f57385d11f908ca)
L_2e7eb:   ' entrada vinda de 02a7a0_FUN_2000_a7a0
RT_FIM   ' @2e7eb B$CENP (inicio/fim do modulo)
' ---- M_LAJEMONV @0x30030  (030030_M_LAJEMONV.lift.txt; evidence_id (assembly): ev_392e66c3fcbab84fdbef639b54df7369bf73bed53902b5d868a66beb48a6f76b)
' @30030 inicio do programa (B$?EVT)
GOTO L_33d7c   '@30143
' ---- FUN_3000_3d7c @0x33d7c  (033d7c_FUN_3000_3d7c.lift.txt; evidence_id (assembly): ev_b03f3541c5e0d1e4a0e45b2d62b45d1ea96de1e73b8062da846d128e508300a9)
L_33d7c:   ' entrada vinda de 030030_M_LAJEMONV
GOTO L_361a2   '@33d7c
' ---- RT_EA @0x361a2  (0361a2_RT_EA.lift.txt; evidence_id (assembly): ev_ea441002f375cca393c86b9c9f2ec64702f070c40c5ed41e39a5c3bdb7a97803)
L_361a2:   ' entrada vinda de 033d7c_FUN_3000_3d7c
RT_FIM   ' @361a2 B$CENP (inicio/fim do modulo)
' ---- M_LAMONTLA @0x40030  (040030_M_LAMONTLA.lift.txt; evidence_id (assembly): ev_76894e864b0b12931f785ccd86646c63c7ff3a44eb06edabc3805fc4150a6b92)
' @40030 inicio do programa (B$?EVT)
GOTO L_4f87a   '@401b1
' ---- RT_EA @0x4f87a  (04f87a_RT_EA.lift.txt; evidence_id (assembly): ev_c01ed983044aba481b69b635544d9e51ddd2bda6a08d4d6813156963d394660d)
L_4f87a:   ' entrada vinda de 040030_M_LAMONTLA
RT_FIM   ' @4f87a B$CENP (inicio/fim do modulo)
RT_FIM

' ---- tratador de erro do modulo MIXT (nivel de modulo no original)
'$INCLUDE: '../comum/MIXT_MOD.BI'

' ---- erro sem ON ERROR do programa: o BRUN45 escreve a mensagem e volta ao DOS
RT_ERRO_FATAL:
RT_ERRO_SEM_TRATADOR

' Registro de 855 bytes em DS:168A (GET/PUT #): campos pelo endereco das variaveis.
SUB RT_REG_168A_LE (f AS INTEGER, r AS LONG)
    GET #f, r, RG_168A
    V_168a$ = MID$(RG_168A, 1, 20)
    V_169e$ = MID$(RG_168A, 21, 5)
    V_16a3% = CVI(MID$(RG_168A, 26, 2))
    V_16a5% = CVI(MID$(RG_168A, 28, 2))
    V_16a7% = CVI(MID$(RG_168A, 30, 2))
    V_16a9% = CVI(MID$(RG_168A, 32, 2))
    V_16ab% = CVI(MID$(RG_168A, 34, 2))
    V_16ad% = CVI(MID$(RG_168A, 36, 2))
    V_16af% = CVI(MID$(RG_168A, 38, 2))
    V_16b1! = CVS(MID$(RG_168A, 40, 4))
    V_16b5! = CVS(MID$(RG_168A, 44, 4))
    V_16b9% = CVI(MID$(RG_168A, 48, 2))
    V_16bb% = CVI(MID$(RG_168A, 50, 2))
    V_16bd! = CVS(MID$(RG_168A, 52, 4))
    V_16c1! = CVS(MID$(RG_168A, 56, 4))
    V_16c5% = CVI(MID$(RG_168A, 60, 2))
    V_16c7% = CVI(MID$(RG_168A, 62, 2))
    V_16c9! = CVS(MID$(RG_168A, 64, 4))
    V_16cd! = CVS(MID$(RG_168A, 68, 4))
    V_16d1% = CVI(MID$(RG_168A, 72, 2))
    V_16d3% = CVI(MID$(RG_168A, 74, 2))
    V_16d5! = CVS(MID$(RG_168A, 76, 4))
    V_16d9! = CVS(MID$(RG_168A, 80, 4))
    V_16dd% = CVI(MID$(RG_168A, 84, 2))
    V_16df% = CVI(MID$(RG_168A, 86, 2))
    V_16e1! = CVS(MID$(RG_168A, 88, 4))
    V_16e5! = CVS(MID$(RG_168A, 92, 4))
    V_16e9% = CVI(MID$(RG_168A, 96, 2))
    V_16eb% = CVI(MID$(RG_168A, 98, 2))
    V_16ed! = CVS(MID$(RG_168A, 100, 4))
    V_16f1! = CVS(MID$(RG_168A, 104, 4))
    V_16f5% = CVI(MID$(RG_168A, 108, 2))
    V_16f7% = CVI(MID$(RG_168A, 110, 2))
    V_16f9! = CVS(MID$(RG_168A, 112, 4))
    V_16fd! = CVS(MID$(RG_168A, 116, 4))
    V_1701% = CVI(MID$(RG_168A, 120, 2))
    V_1703% = CVI(MID$(RG_168A, 122, 2))
    V_1705! = CVS(MID$(RG_168A, 124, 4))
    V_1709! = CVS(MID$(RG_168A, 128, 4))
    V_170d% = CVI(MID$(RG_168A, 132, 2))
    V_170f% = CVI(MID$(RG_168A, 134, 2))
    V_1711! = CVS(MID$(RG_168A, 136, 4))
    V_1715! = CVS(MID$(RG_168A, 140, 4))
    V_1719% = CVI(MID$(RG_168A, 144, 2))
    V_171b% = CVI(MID$(RG_168A, 146, 2))
    V_171d! = CVS(MID$(RG_168A, 148, 4))
    V_1721! = CVS(MID$(RG_168A, 152, 4))
    V_1725% = CVI(MID$(RG_168A, 156, 2))
    V_1727% = CVI(MID$(RG_168A, 158, 2))
    V_1729! = CVS(MID$(RG_168A, 160, 4))
    V_172d! = CVS(MID$(RG_168A, 164, 4))
    V_1731% = CVI(MID$(RG_168A, 168, 2))
    V_1733% = CVI(MID$(RG_168A, 170, 2))
    V_1735! = CVS(MID$(RG_168A, 172, 4))
    V_1739! = CVS(MID$(RG_168A, 176, 4))
    V_173d% = CVI(MID$(RG_168A, 180, 2))
    V_173f% = CVI(MID$(RG_168A, 182, 2))
    V_1741! = CVS(MID$(RG_168A, 184, 4))
    V_1745! = CVS(MID$(RG_168A, 188, 4))
    V_1749% = CVI(MID$(RG_168A, 192, 2))
    V_174b% = CVI(MID$(RG_168A, 194, 2))
    V_174d! = CVS(MID$(RG_168A, 196, 4))
    V_1751! = CVS(MID$(RG_168A, 200, 4))
    V_1761! = CVS(MID$(RG_168A, 216, 4))
    V_1765! = CVS(MID$(RG_168A, 220, 4))
    V_1769! = CVS(MID$(RG_168A, 224, 4))
    V_176d! = CVS(MID$(RG_168A, 228, 4))
    V_1771! = CVS(MID$(RG_168A, 232, 4))
    V_1775! = CVS(MID$(RG_168A, 236, 4))
    V_1779! = CVS(MID$(RG_168A, 240, 4))
    V_177d! = CVS(MID$(RG_168A, 244, 4))
    V_1781! = CVS(MID$(RG_168A, 248, 4))
    V_1785! = CVS(MID$(RG_168A, 252, 4))
    V_1789! = CVS(MID$(RG_168A, 256, 4))
    V_178d! = CVS(MID$(RG_168A, 260, 4))
    V_1791! = CVS(MID$(RG_168A, 264, 4))
    V_1795! = CVS(MID$(RG_168A, 268, 4))
    V_1799! = CVS(MID$(RG_168A, 272, 4))
    V_179d! = CVS(MID$(RG_168A, 276, 4))
    V_17a1! = CVS(MID$(RG_168A, 280, 4))
    V_17a5! = CVS(MID$(RG_168A, 284, 4))
    V_17a9! = CVS(MID$(RG_168A, 288, 4))
    V_17ad! = CVS(MID$(RG_168A, 292, 4))
    V_17b1! = CVS(MID$(RG_168A, 296, 4))
    V_17b5! = CVS(MID$(RG_168A, 300, 4))
    V_17b9! = CVS(MID$(RG_168A, 304, 4))
    V_17bd! = CVS(MID$(RG_168A, 308, 4))
    V_17c1! = CVS(MID$(RG_168A, 312, 4))
    V_17c5! = CVS(MID$(RG_168A, 316, 4))
    V_17c9! = CVS(MID$(RG_168A, 320, 4))
    V_17cd! = CVS(MID$(RG_168A, 324, 4))
    V_17d1! = CVS(MID$(RG_168A, 328, 4))
    V_17d5! = CVS(MID$(RG_168A, 332, 4))
    V_17d9! = CVS(MID$(RG_168A, 336, 4))
    V_17dd! = CVS(MID$(RG_168A, 340, 4))
    V_17e1! = CVS(MID$(RG_168A, 344, 4))
    V_17e5! = CVS(MID$(RG_168A, 348, 4))
    V_17e9! = CVS(MID$(RG_168A, 352, 4))
    V_17ed! = CVS(MID$(RG_168A, 356, 4))
    V_17f1! = CVS(MID$(RG_168A, 360, 4))
    V_17f5! = CVS(MID$(RG_168A, 364, 4))
    V_17f9! = CVS(MID$(RG_168A, 368, 4))
    V_17fd! = CVS(MID$(RG_168A, 372, 4))
    V_1801! = CVS(MID$(RG_168A, 376, 4))
    V_1805! = CVS(MID$(RG_168A, 380, 4))
    V_1809! = CVS(MID$(RG_168A, 384, 4))
    V_180d! = CVS(MID$(RG_168A, 388, 4))
    V_1811! = CVS(MID$(RG_168A, 392, 4))
    V_1815! = CVS(MID$(RG_168A, 396, 4))
    V_1819! = CVS(MID$(RG_168A, 400, 4))
    V_181d! = CVS(MID$(RG_168A, 404, 4))
    V_1821! = CVS(MID$(RG_168A, 408, 4))
    V_1825! = CVS(MID$(RG_168A, 412, 4))
    V_1829! = CVS(MID$(RG_168A, 416, 4))
    V_182d! = CVS(MID$(RG_168A, 420, 4))
    V_1831! = CVS(MID$(RG_168A, 424, 4))
    V_1835! = CVS(MID$(RG_168A, 428, 4))
    V_1839! = CVS(MID$(RG_168A, 432, 4))
    V_183d! = CVS(MID$(RG_168A, 436, 4))
    V_1841! = CVS(MID$(RG_168A, 440, 4))
    V_1845! = CVS(MID$(RG_168A, 444, 4))
    V_1849! = CVS(MID$(RG_168A, 448, 4))
    V_184d! = CVS(MID$(RG_168A, 452, 4))
    V_1851! = CVS(MID$(RG_168A, 456, 4))
    V_1855! = CVS(MID$(RG_168A, 460, 4))
    V_1859! = CVS(MID$(RG_168A, 464, 4))
    V_185d! = CVS(MID$(RG_168A, 468, 4))
    V_1861! = CVS(MID$(RG_168A, 472, 4))
    V_1865! = CVS(MID$(RG_168A, 476, 4))
    V_1869! = CVS(MID$(RG_168A, 480, 4))
    V_186d! = CVS(MID$(RG_168A, 484, 4))
    V_1871! = CVS(MID$(RG_168A, 488, 4))
    V_1875! = CVS(MID$(RG_168A, 492, 4))
    V_1879! = CVS(MID$(RG_168A, 496, 4))
    V_187d! = CVS(MID$(RG_168A, 500, 4))
    V_1881! = CVS(MID$(RG_168A, 504, 4))
    V_1885! = CVS(MID$(RG_168A, 508, 4))
    V_1889! = CVS(MID$(RG_168A, 512, 4))
    V_188d! = CVS(MID$(RG_168A, 516, 4))
    V_1891! = CVS(MID$(RG_168A, 520, 4))
    V_1895! = CVS(MID$(RG_168A, 524, 4))
    V_1899! = CVS(MID$(RG_168A, 528, 4))
    V_189d! = CVS(MID$(RG_168A, 532, 4))
    V_18a1! = CVS(MID$(RG_168A, 536, 4))
    V_18a5! = CVS(MID$(RG_168A, 540, 4))
    V_18a9! = CVS(MID$(RG_168A, 544, 4))
    V_18ad! = CVS(MID$(RG_168A, 548, 4))
    V_18b1! = CVS(MID$(RG_168A, 552, 4))
    V_18b5! = CVS(MID$(RG_168A, 556, 4))
    V_18b9! = CVS(MID$(RG_168A, 560, 4))
    V_18bd! = CVS(MID$(RG_168A, 564, 4))
    V_18c1! = CVS(MID$(RG_168A, 568, 4))
    V_18c5! = CVS(MID$(RG_168A, 572, 4))
    V_18c9! = CVS(MID$(RG_168A, 576, 4))
    V_18cd! = CVS(MID$(RG_168A, 580, 4))
    V_18d1! = CVS(MID$(RG_168A, 584, 4))
    V_18d5! = CVS(MID$(RG_168A, 588, 4))
    V_18d9! = CVS(MID$(RG_168A, 592, 4))
    V_18dd! = CVS(MID$(RG_168A, 596, 4))
    V_18e1! = CVS(MID$(RG_168A, 600, 4))
    V_18e5! = CVS(MID$(RG_168A, 604, 4))
    V_18e9! = CVS(MID$(RG_168A, 608, 4))
    V_18ed! = CVS(MID$(RG_168A, 612, 4))
    V_18f1! = CVS(MID$(RG_168A, 616, 4))
    V_18f5! = CVS(MID$(RG_168A, 620, 4))
    V_18f9! = CVS(MID$(RG_168A, 624, 4))
    V_18fd! = CVS(MID$(RG_168A, 628, 4))
    V_1901! = CVS(MID$(RG_168A, 632, 4))
    V_1905! = CVS(MID$(RG_168A, 636, 4))
    V_1909! = CVS(MID$(RG_168A, 640, 4))
    V_190d! = CVS(MID$(RG_168A, 644, 4))
    V_1911! = CVS(MID$(RG_168A, 648, 4))
    V_1915! = CVS(MID$(RG_168A, 652, 4))
    V_1919! = CVS(MID$(RG_168A, 656, 4))
    V_191d! = CVS(MID$(RG_168A, 660, 4))
    V_1921! = CVS(MID$(RG_168A, 664, 4))
    V_1925! = CVS(MID$(RG_168A, 668, 4))
    V_1929! = CVS(MID$(RG_168A, 672, 4))
    V_192d! = CVS(MID$(RG_168A, 676, 4))
    V_1931! = CVS(MID$(RG_168A, 680, 4))
    V_1935! = CVS(MID$(RG_168A, 684, 4))
    V_1939! = CVS(MID$(RG_168A, 688, 4))
    V_193d! = CVS(MID$(RG_168A, 692, 4))
    V_1941! = CVS(MID$(RG_168A, 696, 4))
    V_1945! = CVS(MID$(RG_168A, 700, 4))
    V_1949! = CVS(MID$(RG_168A, 704, 4))
    V_194d! = CVS(MID$(RG_168A, 708, 4))
    V_1951! = CVS(MID$(RG_168A, 712, 4))
    V_1955! = CVS(MID$(RG_168A, 716, 4))
    V_1959! = CVS(MID$(RG_168A, 720, 4))
    V_195d! = CVS(MID$(RG_168A, 724, 4))
    V_1961! = CVS(MID$(RG_168A, 728, 4))
    V_1965! = CVS(MID$(RG_168A, 732, 4))
    V_1969! = CVS(MID$(RG_168A, 736, 4))
    V_196d! = CVS(MID$(RG_168A, 740, 4))
    V_1971! = CVS(MID$(RG_168A, 744, 4))
    V_1975! = CVS(MID$(RG_168A, 748, 4))
    V_1979! = CVS(MID$(RG_168A, 752, 4))
    V_197d! = CVS(MID$(RG_168A, 756, 4))
    V_1981! = CVS(MID$(RG_168A, 760, 4))
    V_1985! = CVS(MID$(RG_168A, 764, 4))
    V_1989! = CVS(MID$(RG_168A, 768, 4))
    V_198d! = CVS(MID$(RG_168A, 772, 4))
    V_1991! = CVS(MID$(RG_168A, 776, 4))
    V_1995! = CVS(MID$(RG_168A, 780, 4))
    V_1999! = CVS(MID$(RG_168A, 784, 4))
    V_199d! = CVS(MID$(RG_168A, 788, 4))
    V_19a1! = CVS(MID$(RG_168A, 792, 4))
    V_19a5! = CVS(MID$(RG_168A, 796, 4))
    V_19a9! = CVS(MID$(RG_168A, 800, 4))
    V_19ad! = CVS(MID$(RG_168A, 804, 4))
    V_19b1! = CVS(MID$(RG_168A, 808, 4))
    V_19b5! = CVS(MID$(RG_168A, 812, 4))
    V_19b9! = CVS(MID$(RG_168A, 816, 4))
    V_19bd! = CVS(MID$(RG_168A, 820, 4))
    V_19c1! = CVS(MID$(RG_168A, 824, 4))
    V_19c5! = CVS(MID$(RG_168A, 828, 4))
    V_19c9! = CVS(MID$(RG_168A, 832, 4))
    V_19cd! = CVS(MID$(RG_168A, 836, 4))
    V_19d1! = CVS(MID$(RG_168A, 840, 4))
END SUB
SUB RT_REG_168A_GRAVA (f AS INTEGER, r AS LONG)
    MID$(RG_168A, 1, 20) = RT_FIX$(V_168a$, 20)
    MID$(RG_168A, 21, 5) = RT_FIX$(V_169e$, 5)
    MID$(RG_168A, 26, 2) = MKI$(V_16a3%)
    MID$(RG_168A, 28, 2) = MKI$(V_16a5%)
    MID$(RG_168A, 30, 2) = MKI$(V_16a7%)
    MID$(RG_168A, 32, 2) = MKI$(V_16a9%)
    MID$(RG_168A, 34, 2) = MKI$(V_16ab%)
    MID$(RG_168A, 36, 2) = MKI$(V_16ad%)
    MID$(RG_168A, 38, 2) = MKI$(V_16af%)
    MID$(RG_168A, 40, 4) = MKS$(V_16b1!)
    MID$(RG_168A, 44, 4) = MKS$(V_16b5!)
    MID$(RG_168A, 48, 2) = MKI$(V_16b9%)
    MID$(RG_168A, 50, 2) = MKI$(V_16bb%)
    MID$(RG_168A, 52, 4) = MKS$(V_16bd!)
    MID$(RG_168A, 56, 4) = MKS$(V_16c1!)
    MID$(RG_168A, 60, 2) = MKI$(V_16c5%)
    MID$(RG_168A, 62, 2) = MKI$(V_16c7%)
    MID$(RG_168A, 64, 4) = MKS$(V_16c9!)
    MID$(RG_168A, 68, 4) = MKS$(V_16cd!)
    MID$(RG_168A, 72, 2) = MKI$(V_16d1%)
    MID$(RG_168A, 74, 2) = MKI$(V_16d3%)
    MID$(RG_168A, 76, 4) = MKS$(V_16d5!)
    MID$(RG_168A, 80, 4) = MKS$(V_16d9!)
    MID$(RG_168A, 84, 2) = MKI$(V_16dd%)
    MID$(RG_168A, 86, 2) = MKI$(V_16df%)
    MID$(RG_168A, 88, 4) = MKS$(V_16e1!)
    MID$(RG_168A, 92, 4) = MKS$(V_16e5!)
    MID$(RG_168A, 96, 2) = MKI$(V_16e9%)
    MID$(RG_168A, 98, 2) = MKI$(V_16eb%)
    MID$(RG_168A, 100, 4) = MKS$(V_16ed!)
    MID$(RG_168A, 104, 4) = MKS$(V_16f1!)
    MID$(RG_168A, 108, 2) = MKI$(V_16f5%)
    MID$(RG_168A, 110, 2) = MKI$(V_16f7%)
    MID$(RG_168A, 112, 4) = MKS$(V_16f9!)
    MID$(RG_168A, 116, 4) = MKS$(V_16fd!)
    MID$(RG_168A, 120, 2) = MKI$(V_1701%)
    MID$(RG_168A, 122, 2) = MKI$(V_1703%)
    MID$(RG_168A, 124, 4) = MKS$(V_1705!)
    MID$(RG_168A, 128, 4) = MKS$(V_1709!)
    MID$(RG_168A, 132, 2) = MKI$(V_170d%)
    MID$(RG_168A, 134, 2) = MKI$(V_170f%)
    MID$(RG_168A, 136, 4) = MKS$(V_1711!)
    MID$(RG_168A, 140, 4) = MKS$(V_1715!)
    MID$(RG_168A, 144, 2) = MKI$(V_1719%)
    MID$(RG_168A, 146, 2) = MKI$(V_171b%)
    MID$(RG_168A, 148, 4) = MKS$(V_171d!)
    MID$(RG_168A, 152, 4) = MKS$(V_1721!)
    MID$(RG_168A, 156, 2) = MKI$(V_1725%)
    MID$(RG_168A, 158, 2) = MKI$(V_1727%)
    MID$(RG_168A, 160, 4) = MKS$(V_1729!)
    MID$(RG_168A, 164, 4) = MKS$(V_172d!)
    MID$(RG_168A, 168, 2) = MKI$(V_1731%)
    MID$(RG_168A, 170, 2) = MKI$(V_1733%)
    MID$(RG_168A, 172, 4) = MKS$(V_1735!)
    MID$(RG_168A, 176, 4) = MKS$(V_1739!)
    MID$(RG_168A, 180, 2) = MKI$(V_173d%)
    MID$(RG_168A, 182, 2) = MKI$(V_173f%)
    MID$(RG_168A, 184, 4) = MKS$(V_1741!)
    MID$(RG_168A, 188, 4) = MKS$(V_1745!)
    MID$(RG_168A, 192, 2) = MKI$(V_1749%)
    MID$(RG_168A, 194, 2) = MKI$(V_174b%)
    MID$(RG_168A, 196, 4) = MKS$(V_174d!)
    MID$(RG_168A, 200, 4) = MKS$(V_1751!)
    MID$(RG_168A, 216, 4) = MKS$(V_1761!)
    MID$(RG_168A, 220, 4) = MKS$(V_1765!)
    MID$(RG_168A, 224, 4) = MKS$(V_1769!)
    MID$(RG_168A, 228, 4) = MKS$(V_176d!)
    MID$(RG_168A, 232, 4) = MKS$(V_1771!)
    MID$(RG_168A, 236, 4) = MKS$(V_1775!)
    MID$(RG_168A, 240, 4) = MKS$(V_1779!)
    MID$(RG_168A, 244, 4) = MKS$(V_177d!)
    MID$(RG_168A, 248, 4) = MKS$(V_1781!)
    MID$(RG_168A, 252, 4) = MKS$(V_1785!)
    MID$(RG_168A, 256, 4) = MKS$(V_1789!)
    MID$(RG_168A, 260, 4) = MKS$(V_178d!)
    MID$(RG_168A, 264, 4) = MKS$(V_1791!)
    MID$(RG_168A, 268, 4) = MKS$(V_1795!)
    MID$(RG_168A, 272, 4) = MKS$(V_1799!)
    MID$(RG_168A, 276, 4) = MKS$(V_179d!)
    MID$(RG_168A, 280, 4) = MKS$(V_17a1!)
    MID$(RG_168A, 284, 4) = MKS$(V_17a5!)
    MID$(RG_168A, 288, 4) = MKS$(V_17a9!)
    MID$(RG_168A, 292, 4) = MKS$(V_17ad!)
    MID$(RG_168A, 296, 4) = MKS$(V_17b1!)
    MID$(RG_168A, 300, 4) = MKS$(V_17b5!)
    MID$(RG_168A, 304, 4) = MKS$(V_17b9!)
    MID$(RG_168A, 308, 4) = MKS$(V_17bd!)
    MID$(RG_168A, 312, 4) = MKS$(V_17c1!)
    MID$(RG_168A, 316, 4) = MKS$(V_17c5!)
    MID$(RG_168A, 320, 4) = MKS$(V_17c9!)
    MID$(RG_168A, 324, 4) = MKS$(V_17cd!)
    MID$(RG_168A, 328, 4) = MKS$(V_17d1!)
    MID$(RG_168A, 332, 4) = MKS$(V_17d5!)
    MID$(RG_168A, 336, 4) = MKS$(V_17d9!)
    MID$(RG_168A, 340, 4) = MKS$(V_17dd!)
    MID$(RG_168A, 344, 4) = MKS$(V_17e1!)
    MID$(RG_168A, 348, 4) = MKS$(V_17e5!)
    MID$(RG_168A, 352, 4) = MKS$(V_17e9!)
    MID$(RG_168A, 356, 4) = MKS$(V_17ed!)
    MID$(RG_168A, 360, 4) = MKS$(V_17f1!)
    MID$(RG_168A, 364, 4) = MKS$(V_17f5!)
    MID$(RG_168A, 368, 4) = MKS$(V_17f9!)
    MID$(RG_168A, 372, 4) = MKS$(V_17fd!)
    MID$(RG_168A, 376, 4) = MKS$(V_1801!)
    MID$(RG_168A, 380, 4) = MKS$(V_1805!)
    MID$(RG_168A, 384, 4) = MKS$(V_1809!)
    MID$(RG_168A, 388, 4) = MKS$(V_180d!)
    MID$(RG_168A, 392, 4) = MKS$(V_1811!)
    MID$(RG_168A, 396, 4) = MKS$(V_1815!)
    MID$(RG_168A, 400, 4) = MKS$(V_1819!)
    MID$(RG_168A, 404, 4) = MKS$(V_181d!)
    MID$(RG_168A, 408, 4) = MKS$(V_1821!)
    MID$(RG_168A, 412, 4) = MKS$(V_1825!)
    MID$(RG_168A, 416, 4) = MKS$(V_1829!)
    MID$(RG_168A, 420, 4) = MKS$(V_182d!)
    MID$(RG_168A, 424, 4) = MKS$(V_1831!)
    MID$(RG_168A, 428, 4) = MKS$(V_1835!)
    MID$(RG_168A, 432, 4) = MKS$(V_1839!)
    MID$(RG_168A, 436, 4) = MKS$(V_183d!)
    MID$(RG_168A, 440, 4) = MKS$(V_1841!)
    MID$(RG_168A, 444, 4) = MKS$(V_1845!)
    MID$(RG_168A, 448, 4) = MKS$(V_1849!)
    MID$(RG_168A, 452, 4) = MKS$(V_184d!)
    MID$(RG_168A, 456, 4) = MKS$(V_1851!)
    MID$(RG_168A, 460, 4) = MKS$(V_1855!)
    MID$(RG_168A, 464, 4) = MKS$(V_1859!)
    MID$(RG_168A, 468, 4) = MKS$(V_185d!)
    MID$(RG_168A, 472, 4) = MKS$(V_1861!)
    MID$(RG_168A, 476, 4) = MKS$(V_1865!)
    MID$(RG_168A, 480, 4) = MKS$(V_1869!)
    MID$(RG_168A, 484, 4) = MKS$(V_186d!)
    MID$(RG_168A, 488, 4) = MKS$(V_1871!)
    MID$(RG_168A, 492, 4) = MKS$(V_1875!)
    MID$(RG_168A, 496, 4) = MKS$(V_1879!)
    MID$(RG_168A, 500, 4) = MKS$(V_187d!)
    MID$(RG_168A, 504, 4) = MKS$(V_1881!)
    MID$(RG_168A, 508, 4) = MKS$(V_1885!)
    MID$(RG_168A, 512, 4) = MKS$(V_1889!)
    MID$(RG_168A, 516, 4) = MKS$(V_188d!)
    MID$(RG_168A, 520, 4) = MKS$(V_1891!)
    MID$(RG_168A, 524, 4) = MKS$(V_1895!)
    MID$(RG_168A, 528, 4) = MKS$(V_1899!)
    MID$(RG_168A, 532, 4) = MKS$(V_189d!)
    MID$(RG_168A, 536, 4) = MKS$(V_18a1!)
    MID$(RG_168A, 540, 4) = MKS$(V_18a5!)
    MID$(RG_168A, 544, 4) = MKS$(V_18a9!)
    MID$(RG_168A, 548, 4) = MKS$(V_18ad!)
    MID$(RG_168A, 552, 4) = MKS$(V_18b1!)
    MID$(RG_168A, 556, 4) = MKS$(V_18b5!)
    MID$(RG_168A, 560, 4) = MKS$(V_18b9!)
    MID$(RG_168A, 564, 4) = MKS$(V_18bd!)
    MID$(RG_168A, 568, 4) = MKS$(V_18c1!)
    MID$(RG_168A, 572, 4) = MKS$(V_18c5!)
    MID$(RG_168A, 576, 4) = MKS$(V_18c9!)
    MID$(RG_168A, 580, 4) = MKS$(V_18cd!)
    MID$(RG_168A, 584, 4) = MKS$(V_18d1!)
    MID$(RG_168A, 588, 4) = MKS$(V_18d5!)
    MID$(RG_168A, 592, 4) = MKS$(V_18d9!)
    MID$(RG_168A, 596, 4) = MKS$(V_18dd!)
    MID$(RG_168A, 600, 4) = MKS$(V_18e1!)
    MID$(RG_168A, 604, 4) = MKS$(V_18e5!)
    MID$(RG_168A, 608, 4) = MKS$(V_18e9!)
    MID$(RG_168A, 612, 4) = MKS$(V_18ed!)
    MID$(RG_168A, 616, 4) = MKS$(V_18f1!)
    MID$(RG_168A, 620, 4) = MKS$(V_18f5!)
    MID$(RG_168A, 624, 4) = MKS$(V_18f9!)
    MID$(RG_168A, 628, 4) = MKS$(V_18fd!)
    MID$(RG_168A, 632, 4) = MKS$(V_1901!)
    MID$(RG_168A, 636, 4) = MKS$(V_1905!)
    MID$(RG_168A, 640, 4) = MKS$(V_1909!)
    MID$(RG_168A, 644, 4) = MKS$(V_190d!)
    MID$(RG_168A, 648, 4) = MKS$(V_1911!)
    MID$(RG_168A, 652, 4) = MKS$(V_1915!)
    MID$(RG_168A, 656, 4) = MKS$(V_1919!)
    MID$(RG_168A, 660, 4) = MKS$(V_191d!)
    MID$(RG_168A, 664, 4) = MKS$(V_1921!)
    MID$(RG_168A, 668, 4) = MKS$(V_1925!)
    MID$(RG_168A, 672, 4) = MKS$(V_1929!)
    MID$(RG_168A, 676, 4) = MKS$(V_192d!)
    MID$(RG_168A, 680, 4) = MKS$(V_1931!)
    MID$(RG_168A, 684, 4) = MKS$(V_1935!)
    MID$(RG_168A, 688, 4) = MKS$(V_1939!)
    MID$(RG_168A, 692, 4) = MKS$(V_193d!)
    MID$(RG_168A, 696, 4) = MKS$(V_1941!)
    MID$(RG_168A, 700, 4) = MKS$(V_1945!)
    MID$(RG_168A, 704, 4) = MKS$(V_1949!)
    MID$(RG_168A, 708, 4) = MKS$(V_194d!)
    MID$(RG_168A, 712, 4) = MKS$(V_1951!)
    MID$(RG_168A, 716, 4) = MKS$(V_1955!)
    MID$(RG_168A, 720, 4) = MKS$(V_1959!)
    MID$(RG_168A, 724, 4) = MKS$(V_195d!)
    MID$(RG_168A, 728, 4) = MKS$(V_1961!)
    MID$(RG_168A, 732, 4) = MKS$(V_1965!)
    MID$(RG_168A, 736, 4) = MKS$(V_1969!)
    MID$(RG_168A, 740, 4) = MKS$(V_196d!)
    MID$(RG_168A, 744, 4) = MKS$(V_1971!)
    MID$(RG_168A, 748, 4) = MKS$(V_1975!)
    MID$(RG_168A, 752, 4) = MKS$(V_1979!)
    MID$(RG_168A, 756, 4) = MKS$(V_197d!)
    MID$(RG_168A, 760, 4) = MKS$(V_1981!)
    MID$(RG_168A, 764, 4) = MKS$(V_1985!)
    MID$(RG_168A, 768, 4) = MKS$(V_1989!)
    MID$(RG_168A, 772, 4) = MKS$(V_198d!)
    MID$(RG_168A, 776, 4) = MKS$(V_1991!)
    MID$(RG_168A, 780, 4) = MKS$(V_1995!)
    MID$(RG_168A, 784, 4) = MKS$(V_1999!)
    MID$(RG_168A, 788, 4) = MKS$(V_199d!)
    MID$(RG_168A, 792, 4) = MKS$(V_19a1!)
    MID$(RG_168A, 796, 4) = MKS$(V_19a5!)
    MID$(RG_168A, 800, 4) = MKS$(V_19a9!)
    MID$(RG_168A, 804, 4) = MKS$(V_19ad!)
    MID$(RG_168A, 808, 4) = MKS$(V_19b1!)
    MID$(RG_168A, 812, 4) = MKS$(V_19b5!)
    MID$(RG_168A, 816, 4) = MKS$(V_19b9!)
    MID$(RG_168A, 820, 4) = MKS$(V_19bd!)
    MID$(RG_168A, 824, 4) = MKS$(V_19c1!)
    MID$(RG_168A, 828, 4) = MKS$(V_19c5!)
    MID$(RG_168A, 832, 4) = MKS$(V_19c9!)
    MID$(RG_168A, 836, 4) = MKS$(V_19cd!)
    MID$(RG_168A, 840, 4) = MKS$(V_19d1!)
    PUT #f, r, RG_168A
END SUB

' Rotina em assembly do EXE em 0x60aea (chamada por CALL SUB_60aea no lift).
' Versao A; DS do original: inicio DS:2E9E, CR LF DS:2E98, fim DS:2E9B, margem em [DS:318F], ESC L em [DS:2E96].
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
    REDIM A_14a4!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_19fe!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1a2c%(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1a6a!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1a98$(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1ac6!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1af4!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1b22!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1b50!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1b7e!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1bac!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1bda%(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1c08!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1c36!(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1c64%(-32768 TO -32768, -32768 TO -32768)
    REDIM A_1c92%(-32768 TO -32768, -32768 TO -32768)
    V_1376! = 0
    V_137a! = 0
    V_137e! = 0
    V_1382! = 0
    V_1386! = 0
    V_138a! = 0
    V_138e! = 0
    V_1392! = 0
    V_14da# = 0
    V_14e2# = 0
    V_14ea# = 0
    V_14f2# = 0
    V_14fa# = 0
    V_1502# = 0
    V_150a# = 0
    V_1512# = 0
    V_151a# = 0
    V_1522! = 0
    V_1526! = 0
    V_152a! = 0
    V_152e! = 0
    V_1536! = 0
    V_153a# = 0
    V_1542# = 0
    V_154a# = 0
    V_1552# = 0
    V_155a# = 0
    V_1562# = 0
    V_156a# = 0
    V_1572# = 0
    V_157a# = 0
    V_1582# = 0
    V_158a# = 0
    V_1592# = 0
    V_159a# = 0
    V_15a2# = 0
    V_15aa# = 0
    V_15b2# = 0
    V_15ba! = 0
    V_15be! = 0
    V_15c2! = 0
    V_15c6! = 0
    V_15ca! = 0
    V_15ce! = 0
    V_15d2# = 0
    V_15da# = 0
    V_15e2! = 0
    V_15e6! = 0
    V_15ea! = 0
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
    V_164a# = 0
    V_1652# = 0
    V_165a# = 0
    V_1662# = 0
    V_166a! = 0
    V_166e! = 0
    V_1672! = 0
    V_1676! = 0
    V_167a! = 0
    V_167e! = 0
    V_1682! = 0
    V_1686! = 0
    V_168a$ = ""
    V_169e$ = ""
    V_16a3% = 0
    V_16a5% = 0
    V_16a7% = 0
    V_16a9% = 0
    V_16ab% = 0
    V_16ad% = 0
    V_16af% = 0
    V_16b1! = 0
    V_16b5! = 0
    V_16b9% = 0
    V_16bb% = 0
    V_16bd! = 0
    V_16c1! = 0
    V_16c5% = 0
    V_16c7% = 0
    V_16c9! = 0
    V_16cd! = 0
    V_16d1% = 0
    V_16d3% = 0
    V_16d5! = 0
    V_16d9! = 0
    V_16dd% = 0
    V_16df% = 0
    V_16e1! = 0
    V_16e5! = 0
    V_16e9% = 0
    V_16eb% = 0
    V_16ed! = 0
    V_16f1! = 0
    V_16f5% = 0
    V_16f7% = 0
    V_16f9! = 0
    V_16fd! = 0
    V_1701% = 0
    V_1703% = 0
    V_1705! = 0
    V_1709! = 0
    V_170d% = 0
    V_170f% = 0
    V_1711! = 0
    V_1715! = 0
    V_1719% = 0
    V_171b% = 0
    V_171d! = 0
    V_1721! = 0
    V_1725% = 0
    V_1727% = 0
    V_1729! = 0
    V_172d! = 0
    V_1731% = 0
    V_1733% = 0
    V_1735! = 0
    V_1739! = 0
    V_173d% = 0
    V_173f% = 0
    V_1741! = 0
    V_1745! = 0
    V_1749% = 0
    V_174b% = 0
    V_174d! = 0
    V_1751! = 0
    V_1761! = 0
    V_1765! = 0
    V_1769! = 0
    V_176d! = 0
    V_1771! = 0
    V_1775! = 0
    V_1779! = 0
    V_177d! = 0
    V_1781! = 0
    V_1785! = 0
    V_1789! = 0
    V_178d! = 0
    V_1791! = 0
    V_1795! = 0
    V_1799! = 0
    V_179d! = 0
    V_17a1! = 0
    V_17a5! = 0
    V_17a9! = 0
    V_17ad! = 0
    V_17b1! = 0
    V_17b5! = 0
    V_17b9! = 0
    V_17bd! = 0
    V_17c1! = 0
    V_17c5! = 0
    V_17c9! = 0
    V_17cd! = 0
    V_17d1! = 0
    V_17d5! = 0
    V_17d9! = 0
    V_17dd! = 0
    V_17e1! = 0
    V_17e5! = 0
    V_17e9! = 0
    V_17ed! = 0
    V_17f1! = 0
    V_17f5! = 0
    V_17f9! = 0
    V_17fd! = 0
    V_1801! = 0
    V_1805! = 0
    V_1809! = 0
    V_180d! = 0
    V_1811! = 0
    V_1815! = 0
    V_1819! = 0
    V_181d! = 0
    V_1821! = 0
    V_1825! = 0
    V_1829! = 0
    V_182d! = 0
    V_1831! = 0
    V_1835! = 0
    V_1839! = 0
    V_183d! = 0
    V_1841! = 0
    V_1845! = 0
    V_1849! = 0
    V_184d! = 0
    V_1851! = 0
    V_1855! = 0
    V_1859! = 0
    V_185d! = 0
    V_1861! = 0
    V_1865! = 0
    V_1869! = 0
    V_186d! = 0
    V_1871! = 0
    V_1875! = 0
    V_1879! = 0
    V_187d! = 0
    V_1881! = 0
    V_1885! = 0
    V_1889! = 0
    V_188d! = 0
    V_1891! = 0
    V_1895! = 0
    V_1899! = 0
    V_189d! = 0
    V_18a1! = 0
    V_18a5! = 0
    V_18a9! = 0
    V_18ad! = 0
    V_18b1! = 0
    V_18b5! = 0
    V_18b9! = 0
    V_18bd! = 0
    V_18c1! = 0
    V_18c5! = 0
    V_18c9! = 0
    V_18cd! = 0
    V_18d1! = 0
    V_18d5! = 0
    V_18d9! = 0
    V_18dd! = 0
    V_18e1! = 0
    V_18e5! = 0
    V_18e9! = 0
    V_18ed! = 0
    V_18f1! = 0
    V_18f5! = 0
    V_18f9! = 0
    V_18fd! = 0
    V_1901! = 0
    V_1905! = 0
    V_1909! = 0
    V_190d! = 0
    V_1911! = 0
    V_1915! = 0
    V_1919! = 0
    V_191d! = 0
    V_1921! = 0
    V_1925! = 0
    V_1929! = 0
    V_192d! = 0
    V_1931! = 0
    V_1935! = 0
    V_1939! = 0
    V_193d! = 0
    V_1941! = 0
    V_1945! = 0
    V_1949! = 0
    V_194d! = 0
    V_1951! = 0
    V_1955! = 0
    V_1959! = 0
    V_195d! = 0
    V_1961! = 0
    V_1965! = 0
    V_1969! = 0
    V_196d! = 0
    V_1971! = 0
    V_1975! = 0
    V_1979! = 0
    V_197d! = 0
    V_1981! = 0
    V_1985! = 0
    V_1989! = 0
    V_198d! = 0
    V_1991! = 0
    V_1995! = 0
    V_1999! = 0
    V_199d! = 0
    V_19a1! = 0
    V_19a5! = 0
    V_19a9! = 0
    V_19ad! = 0
    V_19b1! = 0
    V_19b5! = 0
    V_19b9! = 0
    V_19bd! = 0
    V_19c1! = 0
    V_19c5! = 0
    V_19c9! = 0
    V_19cd! = 0
    V_19d1! = 0
    V_19e2! = 0
    V_19e6! = 0
    V_19ea! = 0
    V_19ee! = 0
    V_19f2! = 0
    V_19f6! = 0
    V_19fa! = 0
    V_1a66$ = ""
END SUB

' ON KEY dentro de SUB: -1 = o tratador i volta com RETURN simples e roda aqui; 0 = sai da SUB.
FUNCTION RT_ONKEY_FICA% (i AS INTEGER)
    SELECT CASE i
        CASE 1   ' L_1124e: BEEP; GOSUB L_11010; RETURN
            BEEP
            RT_ONKEY_FICA% = -1
        CASE 2   ' L_10e1f: sai da SUB (V_0ef0! = 0.0; ON ERROR GOTO L_10edb; RT_ONERR = &H10edb; V_0ef4# = RT_FRE&("");)
    END SELECT
END FUNCTION

SUB RT_REARMA_ERRO
    RT_ERRO_MIXT = 0
    SELECT CASE RT_ONERR
        CASE &H10edb: ON ERROR GOTO L_10edb
        CASE &H112a7: ON ERROR GOTO L_112a7
        CASE ELSE: ON ERROR GOTO RT_ERRO_FATAL
    END SELECT
END SUB

SUB S_11c49   ' entrada de SUB/FUNCTION (B$ENRA, locais 688 bytes) (0x11c49)
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
    ' ---- FUN_1000_1c49 @0x11c49  (011c49_FUN_1000_1c49.lift.txt; evidence_id (assembly): ev_f70b559af91afa41af1c7c51eb5c294fd40caacefa0fad8ea89a8fc438ab9d9c)
    V_0f1c$ = ""   '@11c51 DS:1cc0
    V_0ef4# = 10000000000.0#   '@11c63 DS:2552
    V_0efc# = 10000000000.0#   '@11c74 DS:2552
    L_BP0e! = FX##(V_155a#) / 1.0#   '@11c85 DS:255a
    L_BP12! = FX##(V_156a#) / 1.0#   '@11c9b DS:255a
    CALL MIXT_082a_Maior(L_BP0e!, L_BP12!, L_BP16!)   '@11caa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a! = FX##(V_153a#) / 1.0#   '@11cbc DS:255a
    L_BP1e! = FX##(V_154a#) / 1.0#   '@11ccc DS:255a
    CALL MIXT_0877_Menor(L_BP1a!, L_BP1e!, L_BP22!)   '@11cdb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP26! = FX##(V_155a#) / 1.0#   '@11ced DS:255a
    L_BP2a! = FX##(V_156a#) / 1.0#   '@11cfd DS:255a
    CALL MIXT_0877_Menor(L_BP26!, L_BP2a!, L_BP2e!)   '@11d0c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP32! = FX##(V_153a#) / 1.0#   '@11d1e DS:255a
    L_BP36! = FX##(V_154a#) / 1.0#   '@11d2e DS:255a
    CALL MIXT_082a_Maior(L_BP32!, L_BP36!, L_BP3a!)   '@11d3d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP2e! > L_BP3a! OR L_BP16! < L_BP22!) THEN GOTO L_11d8b   '@11d4f
    GOTO L_131ee   '@11d83
L_11d8b:
    L_BP3e! = FX##(V_1562#) / 1.0#   '@11d8b DS:255a
    L_BP42! = FX##(V_1572#) / 1.0#   '@11da1 DS:255a
    CALL MIXT_082a_Maior(L_BP3e!, L_BP42!, L_BP46!)   '@11db0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP4a! = FX##(V_1542#) / 1.0#   '@11dc2 DS:255a
    L_BP4e! = FX##(V_1552#) / 1.0#   '@11dd2 DS:255a
    CALL MIXT_0877_Menor(L_BP4a!, L_BP4e!, L_BP52!)   '@11de1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP56! = FX##(V_1562#) / 1.0#   '@11df3 DS:255a
    L_BP5a! = FX##(V_1572#) / 1.0#   '@11e03 DS:255a
    CALL MIXT_0877_Menor(L_BP56!, L_BP5a!, L_BP5e!)   '@11e12
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP62! = FX##(V_1542#) / 1.0#   '@11e24 DS:255a
    L_BP66! = FX##(V_1552#) / 1.0#   '@11e34 DS:255a
    CALL MIXT_082a_Maior(L_BP62!, L_BP66!, L_BP6a!)   '@11e43
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP5e! > L_BP6a! OR L_BP46! < L_BP52!) THEN GOTO L_11e91   '@11e55
    GOTO L_131ee   '@11e89
L_11e91:
    IF NOT (V_1542# = V_1552# AND V_1562# = V_1572#) THEN GOTO L_11fe8   '@11e91
    L_BP6e! = FX##(V_155a#) / 1.0#   '@11ecf DS:255a
    L_BP72! = FX##(V_156a#) / 1.0#   '@11ee5 DS:255a
    CALL MIXT_082a_Maior(L_BP6e!, L_BP72!, L_BP76!)   '@11ef4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP7a! = FX##(V_153a#) / 1.0#   '@11f06 DS:255a
    L_BP7e! = FX##(V_154a#) / 1.0#   '@11f16 DS:255a
    CALL MIXT_0877_Menor(L_BP7a!, L_BP7e!, L_BP82!)   '@11f25
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP86! = FX##(V_153a#) / 1.0#   '@11f38 DS:255a
    L_BP8a! = FX##(V_154a#) / 1.0#   '@11f49 DS:255a
    CALL MIXT_082a_Maior(L_BP86!, L_BP8a!, L_BP8e!)   '@11f59
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP92! = FX##(V_155a#) / 1.0#   '@11f6e DS:255a
    L_BP96! = FX##(V_156a#) / 1.0#   '@11f7f DS:255a
    CALL MIXT_0877_Menor(L_BP92!, L_BP96!, L_BP9a!)   '@11f8f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP8e! < L_BP9a! OR L_BP76! < L_BP82!) THEN GOTO L_11fe3   '@11fa4
    GOTO L_131ee   '@11fdb
L_11fe3:
L_11fe8:
    IF NOT (V_1562# = V_1572#) THEN GOTO L_1201c   '@11fe8
    V_0efc# = V_1562#   '@12003
    GOTO L_12816   '@12014
L_1201c:
    IF NOT (V_1542# = V_1552#) THEN GOTO L_12050   '@1201c
    V_0efc# = V_1542#   '@12037
    GOTO L_12816   '@12048
L_12050:
    IF NOT (ABS((FX##(V_156a#) - V_155a#) / (FX##(V_1572#) - V_1562#) - (FX##(V_154a#) - V_153a#) / (FX##(V_1552#) - V_1542#)) < FX##(V_133e!)) THEN GOTO L_126b9   '@12050
    L_BP9e! = FX##(V_1562#) / 1.0#   '@1209a DS:255a
    L_BPa2! = FX##(V_1572#) / 1.0#   '@120b1 DS:255a
    CALL MIXT_082a_Maior(L_BP9e!, L_BPa2!, L_BPa6!)   '@120c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPaa! = FX##(V_1542#) / 1.0#   '@120d6 DS:255a
    L_BPae! = FX##(V_1552#) / 1.0#   '@120e7 DS:255a
    CALL MIXT_0877_Menor(L_BPaa!, L_BPae!, L_BPb2!)   '@120f7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb6! = FX##(V_1542#) / 1.0#   '@1210c DS:255a
    L_BPba! = FX##(V_1552#) / 1.0#   '@1211d DS:255a
    CALL MIXT_082a_Maior(L_BPb6!, L_BPba!, L_BPbe!)   '@1212d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc2! = FX##(V_1562#) / 1.0#   '@12142 DS:255a
    L_BPc6! = FX##(V_1572#) / 1.0#   '@12153 DS:255a
    CALL MIXT_0877_Menor(L_BPc2!, L_BPc6!, L_BPca!)   '@12163
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPbe! < L_BPca! OR L_BPa6! < L_BPb2!) THEN GOTO L_121b8   '@12178
    GOTO L_131ee   '@121b0
L_121b8:
    IF NOT (ABS(V_153a# - (FX##(V_154a#) - V_153a#) / (FX##(V_1552#) - V_1542#) * V_1542# - (V_155a# - (FX##(V_156a#) - V_155a#) / (FX##(V_1572#) - V_1562#) * V_1562#)) > FX##(V_133a!)) THEN GOTO L_12224   '@121b8
    GOTO L_131ee   '@1221c
L_12224:
    L_BPce! = FX##(V_1562#) / 1.0#   '@12224 DS:255a
    L_BPd2! = FX##(V_1572#) / 1.0#   '@1223b DS:255a
    CALL MIXT_082a_Maior(L_BPce!, L_BPd2!, L_BPd6!)   '@1224b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPda! = FX##(V_1542#) / 1.0#   '@12260 DS:255a
    L_BPde! = FX##(V_1552#) / 1.0#   '@12271 DS:255a
    CALL MIXT_082a_Maior(L_BPda!, L_BPde!, L_BPe2!)   '@12281
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe6! = FX##(V_1562#) / 1.0#   '@12296 DS:255a
    L_BPea! = FX##(V_1572#) / 1.0#   '@122a7 DS:255a
    CALL MIXT_0877_Menor(L_BPe6!, L_BPea!, L_BPee!)   '@122b7
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPf2! = FX##(V_1542#) / 1.0#   '@122cc DS:255a
    L_BPf6! = FX##(V_1552#) / 1.0#   '@122dd DS:255a
    CALL MIXT_082a_Maior(L_BPf2!, L_BPf6!, L_BPfa!)   '@122ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPee! < L_BPfa! AND L_BPd6! >= L_BPe2!) THEN GOTO L_12468   '@12302
    L_BPfe! = FX##(V_1542#) / 1.0#   '@1233a DS:255a
    L_BP102! = FX##(V_1552#) / 1.0#   '@12351 DS:255a
    CALL MIXT_082a_Maior(L_BPfe!, L_BP102!, L_BP106!)   '@12361
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP106!   '@12376
    L_BP10a! = FX##(V_1562#) / 1.0#   '@12381 DS:255a
    L_BP10e! = FX##(V_1572#) / 1.0#   '@12398 DS:255a
    CALL MIXT_082a_Maior(L_BP10a!, L_BP10e!, L_BP112!)   '@123a8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP112!) = FX##(V_0efc#)) THEN GOTO L_12463   '@123bd
    L_BP116! = FX##(V_1542#) / 1.0#   '@123d2 DS:255a
    L_BP11a! = FX##(V_1552#) / 1.0#   '@123e9 DS:255a
    CALL MIXT_0877_Menor(L_BP116!, L_BP11a!, L_BP11e!)   '@123f9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP122! = FX##(V_1562#) / 1.0#   '@1240e DS:255a
    L_BP126! = FX##(V_1572#) / 1.0#   '@1241f DS:255a
    CALL MIXT_0877_Menor(L_BP122!, L_BP126!, L_BP12a!)   '@1242f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP11e!, L_BP12a!, L_BP12e!)   '@12443
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP12e!   '@12458
L_12463:
L_12468:
    L_BP132! = FX##(V_1542#) / 1.0#   '@12468 DS:255a
    L_BP136! = FX##(V_1552#) / 1.0#   '@1247f DS:255a
    CALL MIXT_082a_Maior(L_BP132!, L_BP136!, L_BP13a!)   '@1248f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP13e! = FX##(V_1562#) / 1.0#   '@124a4 DS:255a
    L_BP142! = FX##(V_1572#) / 1.0#   '@124b5 DS:255a
    CALL MIXT_082a_Maior(L_BP13e!, L_BP142!, L_BP146!)   '@124c5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP14a! = FX##(V_1542#) / 1.0#   '@124da DS:255a
    L_BP14e! = FX##(V_1552#) / 1.0#   '@124eb DS:255a
    CALL MIXT_0877_Menor(L_BP14a!, L_BP14e!, L_BP152!)   '@124fb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP156! = FX##(V_1562#) / 1.0#   '@12510 DS:255a
    L_BP15a! = FX##(V_1572#) / 1.0#   '@12521 DS:255a
    CALL MIXT_082a_Maior(L_BP156!, L_BP15a!, L_BP15e!)   '@12531
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP152! < L_BP15e! AND L_BP13a! >= L_BP146!) THEN GOTO L_126ac   '@12546
    L_BP162! = FX##(V_1562#) / 1.0#   '@1257e DS:255a
    L_BP166! = FX##(V_1572#) / 1.0#   '@12595 DS:255a
    CALL MIXT_082a_Maior(L_BP162!, L_BP166!, L_BP16a!)   '@125a5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP16a!   '@125ba
    L_BP16e! = FX##(V_1542#) / 1.0#   '@125c5 DS:255a
    L_BP172! = FX##(V_1552#) / 1.0#   '@125dc DS:255a
    CALL MIXT_082a_Maior(L_BP16e!, L_BP172!, L_BP176!)   '@125ec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP176!) = FX##(V_0efc#)) THEN GOTO L_126a7   '@12601
    L_BP17a! = FX##(V_1562#) / 1.0#   '@12616 DS:255a
    L_BP17e! = FX##(V_1572#) / 1.0#   '@1262d DS:255a
    CALL MIXT_0877_Menor(L_BP17a!, L_BP17e!, L_BP182!)   '@1263d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP186! = FX##(V_1542#) / 1.0#   '@12652 DS:255a
    L_BP18a! = FX##(V_1552#) / 1.0#   '@12663 DS:255a
    CALL MIXT_0877_Menor(L_BP186!, L_BP18a!, L_BP18e!)   '@12673
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP182!, L_BP18e!, L_BP192!)   '@12687
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0efc# = L_BP192!   '@1269c
L_126a7:
L_126ac:
    GOTO L_12816   '@126ac
L_126b9:
    V_0efc# = (FX##(V_156a#) - V_154a# + ((FX##(V_154a#) - V_153a#) / (FX##(V_1552#) - V_1542#) * V_1552# - (FX##(V_156a#) - V_155a#) / (FX##(V_1572#) - V_1562#) * V_1572#)) / ((FX##(V_154a#) - V_153a#) / (FX##(V_1552#) - V_1542#) - (FX##(V_156a#) - V_155a#) / (FX##(V_1572#) - V_1562#))   '@126b9
    IF NOT (ABS(FX##(V_1562#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_12775   '@12741
    V_0efc# = V_1562#   '@12764
L_12775:
    IF NOT (ABS(FX##(V_1572#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_127a9   '@12775
    V_0efc# = V_1572#   '@12798
L_127a9:
    IF NOT (ABS(FX##(V_1542#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_127dd   '@127a9
    V_0efc# = V_1542#   '@127cc
L_127dd:
    IF NOT (ABS(FX##(V_1552#) - V_0efc#) < FX##(V_133a!)) THEN GOTO L_12811   '@127dd
    V_0efc# = V_1552#   '@12800
L_12811:
L_12816:
    L_BP196! = FX##(V_1562#) / 1.0#   '@1281b DS:255a
    L_BP19a! = FX##(V_1572#) / 1.0#   '@12832 DS:255a
    CALL MIXT_082a_Maior(L_BP196!, L_BP19a!, L_BP19e!)   '@12842
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a2! = FX##(V_1562#) / 1.0#   '@12857 DS:255a
    L_BP1a6! = FX##(V_1572#) / 1.0#   '@12868 DS:255a
    CALL MIXT_0877_Menor(L_BP1a2!, L_BP1a6!, L_BP1aa!)   '@12878
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ae! = FX##(V_1542#) / 1.0#   '@1288d DS:255a
    L_BP1b2! = FX##(V_1552#) / 1.0#   '@1289e DS:255a
    CALL MIXT_082a_Maior(L_BP1ae!, L_BP1b2!, L_BP1b6!)   '@128ae
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ba! = FX##(V_1542#) / 1.0#   '@128c3 DS:255a
    L_BP1be! = FX##(V_1552#) / 1.0#   '@128d4 DS:255a
    CALL MIXT_0877_Menor(L_BP1ba!, L_BP1be!, L_BP1c2!)   '@128e4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_1542# <> V_1552# AND (FX##(V_133a!) + V_0efc# < FX##(L_BP1c2!) OR FX##(V_0efc#) - V_133a! > FX##(L_BP1b6!)) OR V_1562# <> V_1572# AND (FX##(V_133a!) + V_0efc# < FX##(L_BP1aa!) OR FX##(V_0efc#) - V_133a! > FX##(L_BP19e!))) THEN GOTO L_129bf   '@128f9
    GOTO L_131ee   '@129b7
L_129bf:
    IF NOT (V_155a# = V_156a#) THEN GOTO L_129f3   '@129bf
    V_0ef4# = V_155a#   '@129da
    GOTO L_1303d   '@129eb
L_129f3:
    IF NOT (V_1542# = V_1552# AND V_1562# = V_1572#) THEN GOTO L_12ec6   '@129f3
    L_BP1c6! = FX##(V_155a#) / 1.0#   '@12a31 DS:255a
    L_BP1ca! = FX##(V_156a#) / 1.0#   '@12a48 DS:255a
    CALL MIXT_082a_Maior(L_BP1c6!, L_BP1ca!, L_BP1ce!)   '@12a58
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d2! = FX##(V_153a#) / 1.0#   '@12a6d DS:255a
    L_BP1d6! = FX##(V_154a#) / 1.0#   '@12a7e DS:255a
    CALL MIXT_0877_Menor(L_BP1d2!, L_BP1d6!, L_BP1da!)   '@12a8e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1de! = FX##(V_155a#) / 1.0#   '@12aa3 DS:255a
    L_BP1e2! = FX##(V_156a#) / 1.0#   '@12ab4 DS:255a
    CALL MIXT_082a_Maior(L_BP1de!, L_BP1e2!, L_BP1e6!)   '@12ac4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ea! = FX##(V_153a#) / 1.0#   '@12ad9 DS:255a
    L_BP1ee! = FX##(V_154a#) / 1.0#   '@12aea DS:255a
    CALL MIXT_082a_Maior(L_BP1ea!, L_BP1ee!, L_BP1f2!)   '@12afa
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1e6! <= L_BP1f2! AND L_BP1ce! >= L_BP1da!) THEN GOTO L_12c75   '@12b0f
    L_BP1f6! = FX##(V_155a#) / 1.0#   '@12b47 DS:255a
    L_BP1fa! = FX##(V_156a#) / 1.0#   '@12b5e DS:255a
    CALL MIXT_082a_Maior(L_BP1f6!, L_BP1fa!, L_BP1fe!)   '@12b6e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP1fe!   '@12b83
    L_BP202! = FX##(V_153a#) / 1.0#   '@12b8e DS:255a
    L_BP206! = FX##(V_154a#) / 1.0#   '@12ba5 DS:255a
    CALL MIXT_082a_Maior(L_BP202!, L_BP206!, L_BP20a!)   '@12bb5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP20a!) = FX##(V_0ef4#)) THEN GOTO L_12c70   '@12bca
    L_BP20e! = FX##(V_155a#) / 1.0#   '@12bdf DS:255a
    L_BP212! = FX##(V_156a#) / 1.0#   '@12bf6 DS:255a
    CALL MIXT_0877_Menor(L_BP20e!, L_BP212!, L_BP216!)   '@12c06
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP21a! = FX##(V_153a#) / 1.0#   '@12c1b DS:255a
    L_BP21e! = FX##(V_154a#) / 1.0#   '@12c2c DS:255a
    CALL MIXT_0877_Menor(L_BP21a!, L_BP21e!, L_BP222!)   '@12c3c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP216!, L_BP222!, L_BP226!)   '@12c50
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP226!   '@12c65
L_12c70:
L_12c75:
    L_BP22a! = FX##(V_153a#) / 1.0#   '@12c75 DS:255a
    L_BP22e! = FX##(V_154a#) / 1.0#   '@12c8c DS:255a
    CALL MIXT_082a_Maior(L_BP22a!, L_BP22e!, L_BP232!)   '@12c9c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP236! = FX##(V_155a#) / 1.0#   '@12cb1 DS:255a
    L_BP23a! = FX##(V_156a#) / 1.0#   '@12cc2 DS:255a
    CALL MIXT_0877_Menor(L_BP236!, L_BP23a!, L_BP23e!)   '@12cd2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP242! = FX##(V_153a#) / 1.0#   '@12ce7 DS:255a
    L_BP246! = FX##(V_154a#) / 1.0#   '@12cf8 DS:255a
    CALL MIXT_082a_Maior(L_BP242!, L_BP246!, L_BP24a!)   '@12d08
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24e! = FX##(V_155a#) / 1.0#   '@12d1d DS:255a
    L_BP252! = FX##(V_156a#) / 1.0#   '@12d2e DS:255a
    CALL MIXT_082a_Maior(L_BP24e!, L_BP252!, L_BP256!)   '@12d3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP24a! <= L_BP256! AND L_BP232! >= L_BP23e!) THEN GOTO L_12eb9   '@12d53
    L_BP25a! = FX##(V_153a#) / 1.0#   '@12d8b DS:255a
    L_BP25e! = FX##(V_154a#) / 1.0#   '@12da2 DS:255a
    CALL MIXT_082a_Maior(L_BP25a!, L_BP25e!, L_BP262!)   '@12db2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP262!   '@12dc7
    L_BP266! = FX##(V_155a#) / 1.0#   '@12dd2 DS:255a
    L_BP26a! = FX##(V_156a#) / 1.0#   '@12de9 DS:255a
    CALL MIXT_082a_Maior(L_BP266!, L_BP26a!, L_BP26e!)   '@12df9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP26e!) = FX##(V_0ef4#)) THEN GOTO L_12eb4   '@12e0e
    L_BP272! = FX##(V_153a#) / 1.0#   '@12e23 DS:255a
    L_BP276! = FX##(V_154a#) / 1.0#   '@12e3a DS:255a
    CALL MIXT_0877_Menor(L_BP272!, L_BP276!, L_BP27a!)   '@12e4a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP27e! = FX##(V_155a#) / 1.0#   '@12e5f DS:255a
    L_BP282! = FX##(V_156a#) / 1.0#   '@12e70 DS:255a
    CALL MIXT_0877_Menor(L_BP27e!, L_BP282!, L_BP286!)   '@12e80
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP27a!, L_BP286!, L_BP28a!)   '@12e94
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0ef4# = L_BP28a!   '@12ea9
L_12eb4:
L_12eb9:
    GOTO L_13033   '@12eb9
L_12ec6:
    IF NOT (V_1562# <> V_1572#) THEN GOTO L_12f21   '@12ec6
    V_0ef4# = V_156a# - (FX##(V_1572#) - V_0efc#) * (FX##(V_156a#) - V_155a#) / (FX##(V_1572#) - V_1562#)   '@12ee1
    GOTO L_12f5e   '@12f19
L_12f21:
    V_0ef4# = V_154a# - (FX##(V_1552#) - V_0efc#) * (FX##(V_154a#) - V_153a#) / (FX##(V_1552#) - V_1542#)   '@12f21
L_12f5e:
    IF NOT (ABS(FX##(V_155a#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_12f92   '@12f5e
    V_0ef4# = V_155a#   '@12f81
L_12f92:
    IF NOT (ABS(FX##(V_156a#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_12fc6   '@12f92
    V_0ef4# = V_156a#   '@12fb5
L_12fc6:
    IF NOT (ABS(FX##(V_153a#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_12ffa   '@12fc6
    V_0ef4# = V_153a#   '@12fe9
L_12ffa:
    IF NOT (ABS(FX##(V_154a#) - V_0ef4#) < FX##(V_133a!)) THEN GOTO L_1302e   '@12ffa
    V_0ef4# = V_154a#   '@1301d
L_1302e:
L_13033:
L_1303d:
    L_BP28e! = FX##(V_155a#) / 1.0#   '@1303d DS:255a
    L_BP292! = FX##(V_156a#) / 1.0#   '@13054 DS:255a
    CALL MIXT_082a_Maior(L_BP28e!, L_BP292!, L_BP296!)   '@13064
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP29a! = FX##(V_155a#) / 1.0#   '@13079 DS:255a
    L_BP29e! = FX##(V_156a#) / 1.0#   '@1308a DS:255a
    CALL MIXT_0877_Menor(L_BP29a!, L_BP29e!, L_BP2a2!)   '@1309a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2a6! = FX##(V_153a#) / 1.0#   '@130af DS:255a
    L_BP2aa! = FX##(V_154a#) / 1.0#   '@130c0 DS:255a
    CALL MIXT_082a_Maior(L_BP2a6!, L_BP2aa!, L_BP2ae!)   '@130d0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2b2! = FX##(V_153a#) / 1.0#   '@130e5 DS:255a
    L_BP2b6! = FX##(V_154a#) / 1.0#   '@130f6 DS:255a
    CALL MIXT_0877_Menor(L_BP2b2!, L_BP2b6!, L_BP2ba!)   '@13106
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (V_153a# <> V_154a# AND (FX##(V_133a!) + V_0ef4# < FX##(L_BP2ba!) OR FX##(V_0ef4#) - V_133a! > FX##(L_BP2ae!)) OR V_155a# <> V_156a# AND (FX##(V_133a!) + V_0ef4# < FX##(L_BP2a2!) OR FX##(V_0ef4#) - V_133a! > FX##(L_BP296!))) THEN GOTO L_131e1   '@1311b
    GOTO L_131ee   '@131d9
L_131e1:
    GOTO L_1320a   '@131e1
L_131ee:
    V_0f1c$ = "NAO"   '@131f3 DS:2562
L_1320a:
    ' END SUB   '@1320a
END SUB

SUB S_1321a   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x1321a)
    ' ---- FUN_1000_321a @0x1321a  (01321a_FUN_1000_321a.lift.txt; evidence_id (assembly): ev_2a4ad3f1c33cc6dd453d8dcd977b0ce7e96b06ac2ab04c0ce99e7bf528c9f95b)
    BEEP   '@13222
    BEEP   '@1322c
    BEEP   '@13236
    RT_VIEWPRINT 23, 25   '@13240
    RT_CLOSE   '@13252 (CLOSE sem numero: nao fecha a impressora (LPT1) do LPRINT)
    RT_CLS 2   '@1325f
    RT_VIEWPRINT 1, 25   '@1326d
    LOCATE 23, 1   '@1327f
    PRINT RT_TAB$(30); ""; "erro no processamento"   '@1329a DS:1cc0,256a
    PRINT RT_TAB$(20); ""; "verifique a consistencia dos seus dados"   '@132ba DS:1cc0,2584
    PRINT RT_TAB$(27); ""; "Acione <ESC> para Continuar ";   '@132da DS:1cc0,25b0
L_132ff:
    RT_ESPERA_EVENTO   ' laco sem leitura: so o ON KEY sai dele
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    GOTO L_132ff   '@13304
    ' ---- F_1330b @0x1330b  (01330b_F_1330b.lift.txt; evidence_id (assembly): ev_f066f4b63ffffcda67db43f8d1a9d44ef4b42c90d77a4dcc90a1087475169772)
    ' END SUB   '@1330b
END SUB

SUB S_13320   ' entrada de SUB/FUNCTION (B$ENRA, locais 52 bytes) (0x13320)
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
    ' ---- FUN_1000_3320 @0x13320  (013320_FUN_1000_3320.lift.txt; evidence_id (assembly): ev_6870aa7a7867dc69adfd63d32ca9a3db194a8f5a73e679c1f9539bed3f81fb8b)
    IF NOT (V_0f18$ = "NAO") THEN GOTO L_13347   '@13328 DS:2562
    GOTO L_13a63   '@1333f
L_13347:
    V_15f6! = 0.0   '@1334c DS:1de6
    L_BP1e! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@1335d
    FOR V_15e2! = 1.0 TO L_BP1e!   '@1338c DS:1dea
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15e2!)), 0) = -100.0) THEN GOTO L_133d0   '@13394 DS:25d0
    GOTO L_139e5   '@133c8
L_133d0:
    L_BP0e! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 0)   '@133d0
    L_BP12! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 1)   '@13413
    L_BP1a! = FX##(V_15e2!) + 1.0   '@13457 DS:1dea
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP1a!) THEN GOTO L_134b3   '@1346c
    L_BP1a! = 1.0   '@134a3 DS:1dea
L_134b3:
L_134b8:
    IF NOT (A_14a4!(RT_CINT%(FX##(L_BP1a!)), 0) = -100.0) THEN GOTO L_13558   '@134bd DS:25d0
    L_BP1a! = FX##(L_BP1a!) + 1.0   '@134f0 DS:1dea
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP1a!) THEN GOTO L_1354b   '@13504
    L_BP1a! = 1.0   '@1353b DS:1dea
L_1354b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_134b8   '@1354b
L_13558:
    L_BP16! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 0)   '@13558
    L_BP1a! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 1)   '@1359a
    IF NOT (ABS(FX##(V_0efc#) - L_BP1a!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP16!) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BP12!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP0e!) < FX##(V_133a!)) THEN GOTO L_13692   '@135dd
    V_15f6! = 1.0   '@13679 DS:1dea
    GOTO L_13a15   '@1368a
L_13692:
    CALL MIXT_0877_Menor(L_BP0e!, L_BP16!, L_BP22!)   '@13692
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP22!) > FX##(V_133a!) + V_0ef4#) THEN GOTO L_136ca   '@136a9
    GOTO L_139e5   '@136c2
L_136ca:
    CALL MIXT_0877_Menor(L_BP12!, L_BP1a!, L_BP26!)   '@136ca
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP2a!)   '@136e0
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP2a!) < FX##(V_0efc#) OR FX##(L_BP26!) > FX##(V_0efc#)) THEN GOTO L_13730   '@136f2
    GOTO L_139e5   '@13728
L_13730:
    CALL MIXT_082a_Maior(L_BP0e!, L_BP16!, L_BP2e!)   '@13730
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT ((FX##(V_0ef4#) - V_133a! > FX##(L_BP2e!) OR FX##(L_BP12!) <> FX##(V_0efc#)) AND L_BP12! = L_BP1a!) THEN GOTO L_137a6   '@13747
    GOTO L_139e5   '@1379e
L_137a6:
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP32!)   '@137a6
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP12!, L_BP1a!, L_BP36!)   '@137bc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP0e!, L_BP16!, L_BP3a!)   '@137cd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP3a!) <= FX##(V_0ef4#) AND (FX##(L_BP36!) <= FX##(V_0efc#) AND FX##(L_BP32!) > FX##(V_0efc#))) THEN GOTO L_138b9   '@137df
    V_15f6! = FX##(V_15f6!) + 1.0   '@1382f DS:1dea
    IF NOT (ABS(FX##(V_0ef4#) - L_BP0e!) < FX##(V_133a!) AND ABS(FX##(L_BP0e!) - L_BP16!) < FX##(V_133a!)) THEN GOTO L_138ac   '@13845
    V_15f6! = 1.0   '@13893 DS:1dea
    GOTO L_13a15   '@138a4
L_138ac:
    GOTO L_139e5   '@138ac
L_138b9:
    IF NOT (L_BP12! = L_BP1a!) THEN GOTO L_138eb   '@138b9
    V_15f6! = 1.0   '@138d2 DS:1dea
    GOTO L_13a15   '@138e3
L_138eb:
    CALL MIXT_082a_Maior(L_BP12!, L_BP1a!, L_BP3e!)   '@138eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP3e!) = FX##(V_0efc#)) THEN GOTO L_1391e   '@13902
    GOTO L_139e5   '@13916
L_1391e:
    IF NOT (FX##(V_133a!) + V_0ef4# >= L_BP0e! + (FX##(V_0efc#) - L_BP12!) * (FX##(L_BP16!) - L_BP0e!) / (FX##(L_BP1a!) - L_BP12!)) THEN GOTO L_139e0   '@1391e
    V_15f6! = FX##(V_15f6!) + 1.0   '@13962 DS:1dea
    IF NOT (ABS(V_0ef4# - (L_BP0e! + (FX##(V_0efc#) - L_BP12!) * (FX##(L_BP16!) - L_BP0e!) / (FX##(L_BP1a!) - L_BP12!))) < FX##(V_133a!)) THEN GOTO L_139db   '@13978
    V_15f6! = 1.0   '@139c2 DS:1dea
    GOTO L_13a15   '@139d3
L_139db:
L_139e0:
L_139e5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@139ea DS:1dea
L_13a15:
    IF NOT (FX##(V_15f6!) / 2.0 = RT_CLNG&(FX##(V_15f6!)) \ 2&) THEN GOTO L_13a5e   '@13a15 DS:1e2c
    V_0f18$ = "NAO"   '@13a4c DS:2562
L_13a5e:
L_13a63:
    ' END SUB   '@13a63
END SUB

SUB S_13a73   ' entrada de SUB/FUNCTION (B$ENRA, locais 36 bytes) (0x13a73)
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2e!
    ' ---- FUN_1000_3a73 @0x13a73  (013a73_FUN_1000_3a73.lift.txt; evidence_id (assembly): ev_5375c6855cf989fce350972df7145e3f1bc913ca92c4e1caf5f76ef092f2862e)
    V_159a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)   '@13a80
    V_15a2# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)   '@13ac4
    V_15d2# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@13b09
    V_15da# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@13b4d
    IF NOT (V_159a# = V_15d2#) THEN GOTO L_13c01   '@13b92
    V_1512# = FX##(V_0e68_pi#) / 2.0#   '@13bad DS:1f9e
    IF NOT (V_15a2# < V_15da#) THEN GOTO L_13bf9   '@13bc3
    V_1512# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@13bde DS:1f9e,25d4
L_13bf9:
    GOTO L_13dc0   '@13bf9
L_13c01:
    IF NOT (V_15a2# <= V_15da# AND V_159a# < V_15d2#) THEN GOTO L_13c6e   '@13c01
    V_1512# = ATN((FX##(V_15da#) - V_15a2#) / (FX##(V_15d2#) - V_159a#)) + V_0e68_pi#   '@13c3f
L_13c6e:
    IF NOT (V_15a2# >= V_15da# AND V_159a# > V_15d2#) THEN GOTO L_13cd6   '@13c6e
    V_1512# = ATN((FX##(V_15a2#) - V_15da#) / (FX##(V_159a#) - V_15d2#))   '@13cac
L_13cd6:
    IF NOT (V_15a2# < V_15da# AND V_159a# > V_15d2#) THEN GOTO L_13d4b   '@13cd6
    V_1512# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_15da#) - V_15a2#) / (FX##(V_159a#) - V_15d2#))   '@13d14 DS:1f9e
L_13d4b:
    IF NOT (V_15a2# > V_15da# AND V_159a# < V_15d2#) THEN GOTO L_13dbb   '@13d4b
    V_1512# = V_0e68_pi# - ATN((FX##(V_15a2#) - V_15da#) / (FX##(V_15d2#) - V_159a#))   '@13d89
L_13dbb:
L_13dc0:
    V_15d2# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 0)   '@13dc0
    V_15da# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 1)   '@13e04
    V_15aa# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1606!))), 0)   '@13e49
    V_15b2# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1606!))), 1)   '@13e8d
    IF NOT (V_15aa# = V_15d2#) THEN GOTO L_13f41   '@13ed2
    V_151a# = FX##(V_0e68_pi#) / 2.0#   '@13eed DS:1f9e
    IF NOT (V_15b2# < V_15da#) THEN GOTO L_13f39   '@13f03
    V_151a# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@13f1e DS:1f9e,25d4
L_13f39:
    GOTO L_14100   '@13f39
L_13f41:
    IF NOT (V_15b2# <= V_15da# AND V_15aa# < V_15d2#) THEN GOTO L_13fae   '@13f41
    V_151a# = ATN((FX##(V_15da#) - V_15b2#) / (FX##(V_15d2#) - V_15aa#)) + V_0e68_pi#   '@13f7f
L_13fae:
    IF NOT (V_15b2# >= V_15da# AND V_15aa# > V_15d2#) THEN GOTO L_14016   '@13fae
    V_151a# = ATN((FX##(V_15b2#) - V_15da#) / (FX##(V_15aa#) - V_15d2#))   '@13fec
L_14016:
    IF NOT (V_15b2# < V_15da# AND V_15aa# > V_15d2#) THEN GOTO L_1408b   '@14016
    V_151a# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_15da#) - V_15b2#) / (FX##(V_15aa#) - V_15d2#))   '@14054 DS:1f9e
L_1408b:
    IF NOT (V_15b2# > V_15da# AND V_15aa# < V_15d2#) THEN GOTO L_140fb   '@1408b
    V_151a# = V_0e68_pi# - ATN((FX##(V_15b2#) - V_15da#) / (FX##(V_15d2#) - V_15aa#))   '@140c9
L_140fb:
L_14100:
    IF NOT (V_1512# <= V_151a#) THEN GOTO L_145a8   '@14100
    V_150a# = (FX##(V_1512#) + V_151a#) / 2.0#   '@1411b DS:1f9e
    IF NOT (ABS(FX##(V_151a#) - V_0e68_pi# - V_1512#) >= FX##(V_133e!) AND (ABS(FX##(V_1512#) - V_0e68_pi# - V_151a#) >= FX##(V_133e!) AND ABS(FX##(V_1512#) - V_151a#) >= FX##(V_133e!))) THEN GOTO L_145a0   '@14136
    L_BP26! = V_15fa!   '@141b1
    GOSUB L_14b11   '@141c1
    L_BP2a! = L_BP22!   '@141ce
    L_BP26! = V_1602!   '@141dd
    GOSUB L_14b11   '@141ed
    L_BP2e! = L_BP22!   '@141fa
    IF NOT (L_BP2a! > L_BP2e! AND (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) <> 1 AND (L_BP2e! > 0.0 OR L_BP2a! > 0.0))) THEN GOTO L_14399   '@14209 DS:1de6
    IF NOT (ABS(RT_SQR##((FX##(L_BP2e!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(FX##(V_151a#) - V_1512#)) < FX##(V_133e!)) THEN GOTO L_142f5   '@14292 DS:1dea
    V_150a# = FX##(V_0e68_pi#) / 2.0#   '@142d7 DS:1f9e
    GOTO L_1437e   '@142ed
L_142f5:
    V_150a# = ATN(RT_SIN##(FX##(V_151a#) - V_1512#) / (RT_SQR##((FX##(L_BP2e!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(FX##(V_151a#) - V_1512#)))   '@142f5 DS:1dea
    IF NOT (V_150a# < 0.0#) THEN GOTO L_14379   '@14348 DS:251a
    V_150a# = FX##(V_0e68_pi#) + V_150a#   '@14363
L_14379:
L_1437e:
    V_150a# = FX##(V_1512#) + V_150a#   '@1437e
L_14399:
    IF NOT (L_BP2e! > L_BP2a! AND ((L_BP2e! > 0.0 OR L_BP2a! > 0.0) AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) <> 1)) THEN GOTO L_14527   '@14399 DS:1de6
    IF NOT (ABS(RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP2e!) + 1.0)) + RT_COS##(FX##(V_151a#) - V_1512#)) < FX##(V_133e!)) THEN GOTO L_14483   '@14420 DS:1dea
    V_150a# = FX##(V_0e68_pi#) / 2.0#   '@14465 DS:1f9e
    GOTO L_1450c   '@1447b
L_14483:
    V_150a# = ATN(RT_SIN##(FX##(V_151a#) - V_1512#) / (RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP2e!) + 1.0)) + RT_COS##(FX##(V_151a#) - V_1512#)))   '@14483 DS:1dea
    IF NOT (V_150a# < 0.0#) THEN GOTO L_14507   '@144d6 DS:251a
    V_150a# = FX##(V_0e68_pi#) + V_150a#   '@144f1
L_14507:
L_1450c:
    V_150a# = FX##(V_151a#) - V_150a#   '@1450c
L_14527:
    IF NOT (V_150a# < 0.0#) THEN GOTO L_1455d   '@14527 DS:251a
    V_150a# = 2.0# * FX##(V_0e68_pi#) + V_150a#   '@14542 DS:1f9e
L_1455d:
    IF NOT (2.0# * FX##(V_0e68_pi#) <= FX##(V_150a#)) THEN GOTO L_1459b   '@1455d DS:1f9e
    V_150a# = V_150a# - 2.0# * FX##(V_0e68_pi#)   '@1457d DS:1f9e
L_1459b:
L_145a0:
    GOTO L_14a73   '@145a0
L_145a8:
    V_150a# = (FX##(V_1512#) + V_151a#) / 2.0# + V_0e68_pi#   '@145a8 DS:1f9e
    IF NOT (ABS(FX##(V_151a#) - V_0e68_pi# - V_1512#) >= FX##(V_133e!) AND (ABS(FX##(V_1512#) - V_0e68_pi# - V_151a#) >= FX##(V_133e!) AND ABS(FX##(V_1512#) - V_151a#) >= FX##(V_133e!))) THEN GOTO L_14a30   '@145c8
    L_BP26! = V_15fa!   '@14643
    GOSUB L_14b11   '@14653
    L_BP2a! = L_BP22!   '@14660
    L_BP26! = V_1602!   '@1466f
    GOSUB L_14b11   '@1467f
    L_BP2e! = L_BP22!   '@1468c
    IF NOT (L_BP2a! > L_BP2e! AND (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) <> 1 AND (L_BP2e! > 0.0 OR L_BP2a! > 0.0))) THEN GOTO L_14849   '@1469b DS:1de6
    IF NOT (ABS(RT_SQR##((FX##(L_BP2e!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#)) < FX##(V_133e!)) THEN GOTO L_14791   '@14724 DS:1dea,1f9e
    V_150a# = FX##(V_0e68_pi#) / 2.0#   '@14773 DS:1f9e
    GOTO L_1482e   '@14789
L_14791:
    V_150a# = ATN(RT_SIN##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#) / (RT_SQR##((FX##(L_BP2e!) + 1.0) / (FX##(L_BP2a!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#)))   '@14791 DS:1dea,1f9e
    IF NOT (V_150a# < 0.0#) THEN GOTO L_14829   '@147f8 DS:251a
    V_150a# = FX##(V_0e68_pi#) + V_150a#   '@14813
L_14829:
L_1482e:
    V_150a# = FX##(V_1512#) + V_150a#   '@1482e
L_14849:
    IF NOT (L_BP2e! > L_BP2a! AND ((L_BP2e! > 0.0 OR L_BP2a! > 0.0) AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) <> 1)) THEN GOTO L_149f5   '@14849 DS:1de6
    IF NOT (ABS(RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP2e!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#)) < FX##(V_133e!)) THEN GOTO L_1493d   '@148d0 DS:1dea,1f9e
    V_150a# = FX##(V_0e68_pi#) / 2.0#   '@1491f DS:1f9e
    GOTO L_149da   '@14935
L_1493d:
    V_150a# = ATN(RT_SIN##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#) / (RT_SQR##((FX##(L_BP2a!) + 1.0) / (FX##(L_BP2e!) + 1.0)) + RT_COS##(2.0# * FX##(V_0e68_pi#) - V_1512# + V_151a#)))   '@1493d DS:1dea,1f9e
    IF NOT (V_150a# < 0.0#) THEN GOTO L_149d5   '@149a4 DS:251a
    V_150a# = FX##(V_0e68_pi#) + V_150a#   '@149bf
L_149d5:
L_149da:
    V_150a# = FX##(V_151a#) - V_150a#   '@149da
L_149f5:
    IF NOT (V_150a# < 0.0#) THEN GOTO L_14a2b   '@149f5 DS:251a
    V_150a# = 2.0# * FX##(V_0e68_pi#) + V_150a#   '@14a10 DS:1f9e
L_14a2b:
L_14a30:
    IF NOT (2.0# * FX##(V_0e68_pi#) <= FX##(V_150a#)) THEN GOTO L_14a6e   '@14a30 DS:1f9e
    V_150a# = V_150a# - 2.0# * FX##(V_0e68_pi#)   '@14a50 DS:1f9e
L_14a6e:
L_14a73:
    IF NOT (ABS(FX##(V_1512#) - V_151a#) < FX##(V_133e!)) THEN GOTO L_14b04   '@14a73
    IF NOT (ABS(FX##(V_15b2#) - V_15a2# + (FX##(V_15aa#) - V_159a#) * V_1512#) > FX##(V_133e!) AND V_15fe! <> V_1602!) THEN GOTO L_14aff   '@14a96
    V_150a# = V_1512#   '@14aee
L_14aff:
L_14b04:
    GOTO L_15179   '@14b04
    ' ---- F_14b0c @0x14b0c  (014b0c_F_14b0c.lift.txt; evidence_id (assembly): ev_184d43b2aa4c11566895074251e50022916b4d317c741fe905881f0f14088e67)
L_14b11:   ' sub-rotina (alvo de GOSUB); entrada vinda de 013a73_FUN_1000_3a73
    L_BP12! = L_BP26!   '@14b16
    L_BP22! = 0.0   '@14b25 DS:1de6
L_14b3a:
    L_BP16! = FX##(L_BP12!) + 1.0   '@14b3a DS:1dea
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP16!) THEN GOTO L_14b95   '@14b4e
    L_BP16! = 1.0   '@14b85 DS:1dea
L_14b95:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))) > 2) THEN GOTO L_14d06   '@14b95
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))) - 2) * RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 1)), (2.0))) / 10.0 + L_BP22!   '@14bc5 DS:1e2c,236e
L_14d06:
    L_BP1a! = L_BP12!   '@14d06
    IF NOT (A_14a4!(RT_CINT%(FX##(L_BP12!)), 0) = -100.0) THEN GOTO L_14dac   '@14d15 DS:25d0
    L_BP12! = FX##(L_BP12!) - 1.0   '@14d48 DS:25dc
    IF NOT (L_BP12! = 0.0) THEN GOTO L_14da4   '@14d5c DS:1de6
    L_BP12! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@14d76
L_14da4:
    GOTO L_14db9   '@14da4
L_14dac:
    GOTO L_14dc2   '@14dac
L_14db9:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14b3a   '@14db9
L_14dc2:
    L_BP12! = L_BP26!   '@14dc2
L_14dd6:
    L_BP12! = FX##(L_BP12!) + 1.0   '@14dd6 DS:1dea
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP12!) THEN GOTO L_14e31   '@14dea
    L_BP12! = 1.0   '@14e21 DS:1dea
L_14e31:
    L_BP1e! = L_BP12!   '@14e31
    IF NOT (A_14a4!(RT_CINT%(FX##(L_BP12!)), 0) = -100.0) THEN GOTO L_14ed6   '@14e40 DS:25d0
    L_BP16! = FX##(L_BP12!) + 1.0   '@14e73 DS:1dea
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP16!) THEN GOTO L_14ece   '@14e87
    L_BP16! = 1.0   '@14ebe DS:1dea
L_14ece:
    GOTO L_14ee3   '@14ece
L_14ed6:
    GOTO L_1505c   '@14ed6
L_14ee3:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))) > 2) THEN GOTO L_15054   '@14ee3
    L_BP22! = (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))) - 2) * RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 1)), (2.0))) / 10.0 + L_BP22!   '@14f13 DS:1e2c,236e
L_15054:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_14dd6   '@15054
L_1505c:
    L_BP22! = L_BP22! / RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1e!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1e!))), 1)), (2.0)))   '@1505c DS:1e2c
    RETURN   '@1516a
L_15179:   ' entrada vinda de 013a73_FUN_1000_3a73
    ' END SUB   '@15179
END SUB

SUB S_15189   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x15189)
    ' ---- FUN_1000_5189 @0x15189  (015189_FUN_1000_5189.lift.txt; evidence_id (assembly): ev_125da81e5f0cb48342e0cd59b2486815f8465c2498ab7ab432a34dee13f3204d)
    V_0f18$ = ""   '@15191 DS:1cc0
    IF NOT (ABS(FX##(V_14e2#) - V_14ea# + V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_0e68_pi#) - V_14ea# + V_14e2#) < FX##(V_133e!) OR (ABS(FX##(V_14e2#) - V_14ea# - V_0e68_pi#) < FX##(V_133e!) OR (ABS(FX##(V_14e2#) - V_0e68_pi# - V_14ea#) < FX##(V_133e!) OR ABS(FX##(V_14e2#) - V_14ea#) < FX##(V_133e!))))) THEN GOTO L_152af   '@151a3
    V_0ef4# = 10000000000.0#   '@1526e DS:2552
    V_0efc# = 10000000000.0#   '@1527f DS:2552
    V_0f18$ = "NAO"   '@15290 DS:2562
    GOTO L_1576c   '@152a2
L_152af:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_14e2#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_14e2#)) THEN GOTO L_1539d   '@152af DS:1f9e,25d4
    V_0ef4# = V_164a#   '@152fc
    V_0efc# = RT_TAN##(FX##(V_14ea#)) * V_0ef4# + (V_1662# - RT_SIN##(FX##(V_14ea#)) / RT_COS##(FX##(V_14ea#)) * V_1652#)   '@1530d
    IF NOT (ABS(RT_SIN##(FX##(V_14ea#))) < FX##(V_133e!) / 100.0) THEN GOTO L_15390   '@15355 DS:25e0
    V_0efc# = V_1662#   '@1537f
L_15390:
    GOTO L_1576c   '@15390
L_1539d:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# = FX##(V_14ea#) OR FX##(V_0e68_pi#) / 2.0# = FX##(V_14ea#)) THEN GOTO L_1548b   '@1539d DS:1f9e,25d4
    V_0ef4# = V_1652#   '@153ea
    V_0efc# = RT_TAN##(FX##(V_14e2#)) * V_0ef4# + (V_165a# - RT_SIN##(FX##(V_14e2#)) / RT_COS##(FX##(V_14e2#)) * V_164a#)   '@153fb
    IF NOT (ABS(RT_SIN##(FX##(V_14e2#))) < FX##(V_133e!) / 100.0) THEN GOTO L_1547e   '@15443 DS:25e0
    V_0efc# = V_165a#   '@1546d
L_1547e:
    GOTO L_1576c   '@1547e
L_1548b:
    IF NOT (V_14e2# = V_0e68_pi# OR V_14e2# = 0.0#) THEN GOTO L_1556d   '@1548b DS:251a
    V_0efc# = V_165a#   '@154c9
    V_0ef4# = (V_0efc# - (V_1662# - RT_SIN##(FX##(V_14ea#)) / RT_COS##(FX##(V_14ea#)) * V_1652#)) / RT_TAN##(FX##(V_14ea#))   '@154da
    IF NOT (ABS(RT_COS##(FX##(V_14ea#))) < FX##(V_133e!) / 100.0) THEN GOTO L_15560   '@15525 DS:25e0
    V_0ef4# = V_1652#   '@1554f
L_15560:
    GOTO L_1576c   '@15560
L_1556d:
    IF NOT (V_14ea# = V_0e68_pi# OR V_14ea# = 0.0#) THEN GOTO L_1564f   '@1556d DS:251a
    V_0efc# = V_1662#   '@155ab
    V_0ef4# = (V_0efc# - (V_165a# - RT_SIN##(FX##(V_14e2#)) / RT_COS##(FX##(V_14e2#)) * V_164a#)) / RT_TAN##(FX##(V_14e2#))   '@155bc
    IF NOT (ABS(RT_COS##(FX##(V_14e2#))) < FX##(V_133e!) / 100.0) THEN GOTO L_15642   '@15607 DS:25e0
    V_0ef4# = V_164a#   '@15631
L_15642:
    GOTO L_1576c   '@15642
L_1564f:
    V_0efc# = (RT_TAN##(FX##(V_14ea#)) * (V_165a# - RT_SIN##(FX##(V_14e2#)) / RT_COS##(FX##(V_14e2#)) * V_164a#) - RT_TAN##(FX##(V_14e2#)) * (V_1662# - RT_SIN##(FX##(V_14ea#)) / RT_COS##(FX##(V_14ea#)) * V_1652#)) / (RT_TAN##(FX##(V_14ea#)) - RT_TAN##(FX##(V_14e2#)))   '@1564f
    V_0ef4# = (V_1662# - RT_SIN##(FX##(V_14ea#)) / RT_COS##(FX##(V_14ea#)) * V_1652# - (V_165a# - RT_SIN##(FX##(V_14e2#)) / RT_COS##(FX##(V_14e2#)) * V_164a#)) / (RT_TAN##(FX##(V_14e2#)) - RT_TAN##(FX##(V_14ea#)))   '@156ea
L_1576c:
    CALL S_13320   '@15771
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    ' END SUB   '@1577b
END SUB

SUB S_15790   ' entrada de SUB/FUNCTION (B$ENRA, locais 66 bytes) (0x15790)
    DIM L_BP0e!
    DIM L_BP12!
    DIM L_BP16!
    DIM L_BP1a!
    DIM L_BP1e!
    DIM L_BP22!
    DIM L_BP26!
    DIM L_BP2a!
    DIM L_BP2c%
    DIM L_BP30!
    DIM L_BP34!
    DIM L_BP38!
    DIM L_BP3c!
    DIM L_BP40!
    DIM L_BP44!
    DIM L_BP48!
    DIM L_BP4c!
    ' ---- FUN_1000_5790 @0x15790  (015790_FUN_1000_5790.lift.txt; evidence_id (assembly): ev_6ecf51b090d9aad55c6d7f052967efa442241d05a3c9aaf90bb09aee4b2f9687)
    L_BP0e! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@15798
    FOR V_0f10! = 1.0 TO L_BP0e!   '@157c7 DS:1dea
    V_15ea! = V_0f10!   '@157ce
    V_15ee! = FX##(V_0f10!) - 1.0   '@157df DS:25dc
    V_15f2! = FX##(V_0f10!) + 1.0   '@157f5 DS:1dea
    IF NOT (V_15ee! = 0.0) THEN GOTO L_15855   '@1580b DS:1de6
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@15826
L_15855:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_1589e   '@15855
    V_15f2! = 1.0   '@1588d DS:1dea
L_1589e:
    V_15fa! = V_15ee!   '@1589e
    V_15fe! = V_15ea!   '@158af
    V_1602! = V_15ea!   '@158c0
    V_1606! = V_15f2!   '@158d1
    CALL S_13a73   '@158e2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP12! = FX##(V_1512#) / 1.0#   '@158ec DS:255a
    L_BP16! = FX##(V_151a#) / 1.0#   '@15902 DS:255a
    CALL MIXT_082a_Maior(L_BP12!, L_BP16!, L_BP1a!)   '@15911
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1e! = FX##(V_1512#) / 1.0#   '@15923 DS:255a
    L_BP22! = FX##(V_151a#) / 1.0#   '@15933 DS:255a
    CALL MIXT_0877_Menor(L_BP1e!, L_BP22!, L_BP26!)   '@15942
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP1a!) - L_BP26! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_159a3   '@15954
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 0) = -100.0   '@15974 DS:25d0
L_159a3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@159a3 DS:1dea
    V_1536! = 1.0   '@159ce DS:1dea
    L_BP2a! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@159df
    FOR V_0f10! = 1.0 TO L_BP2a!   '@15a0e DS:1dea
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@15a16 DS:1dea
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_0f10!   '@15a4a
    V_155a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)   '@15a86
    V_1562# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)   '@15aca
    V_156a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0) + RT_COS##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#) * -(ABS(RT_COS##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#)) > FX##(V_133e!)) * 1000.0#   '@15b0f DS:25e4,25ec
    V_1572# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1) + RT_SIN##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#) * -(ABS(RT_SIN##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#)) > FX##(V_133e!)) * 1000.0#   '@15bda DS:25e4,25ec
    L_BP2c% = 0   '@15ca6
    V_0f14! = 0.0   '@15cb0 DS:1de6
    V_1522! = A_19fe!(0, 0)   '@15cc1
L_15ce6:
    CALL S_17b61   '@15ceb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT ((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)) <> FX##(V_0efc#) OR FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)) <> FX##(V_0ef4#)) AND V_0f1c$ = "") THEN GOTO L_15e7f   '@15cf5 DS:1cc0
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_0ef4#   '@15db5
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_0efc#   '@15dec
    L_BP2c% = 2   '@15e26
    V_156a# = V_0ef4#   '@15e30
    V_1572# = V_0efc#   '@15e41
    V_1522! = A_19fe!(0, 0)   '@15e52
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15ce6   '@15e72
L_15e7f:
    IF NOT (L_BP2c% = 2) THEN GOTO L_16031   '@15e7f
    V_0ef4# = (FX##(V_155a#) + V_156a#) / 2.0#   '@15e8d DS:1f9e
    V_0efc# = (FX##(V_1562#) + V_1572#) / 2.0#   '@15ea8 DS:1f9e
    V_0f18$ = ""   '@15ec3 DS:1cc0
    CALL S_13320   '@15ed5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f18$ = "NAO") THEN GOTO L_15f10   '@15edf DS:2562
    L_BP2c% = RT_CINT%(FX##(V_0f14!))   '@15ef6
    GOTO L_1602c   '@15f08
L_15f10:
    V_156a# = (FX##(V_155a#) + V_156a#) / 2.0#   '@15f10 DS:1f9e
    V_1572# = (FX##(V_1562#) + V_1572#) / 2.0#   '@15f2b DS:1f9e
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_156a#   '@15f46
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1572#   '@15f7d
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@15fb7 DS:1dea
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_0f10!   '@15feb
L_1602c:
L_16031:
    IF NOT (V_0f14! = 0.0 OR L_BP2c% = 0) THEN GOTO L_16221   '@16031 DS:1de6
    V_156a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0) - RT_COS##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#) * -(ABS(RT_COS##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#)) > FX##(V_133e!)) * 1000.0#   '@16062 DS:25e4,25ec
    V_1572# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1) - RT_SIN##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#) * -(ABS(RT_SIN##(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * V_0e68_pi# / 180.0#)) > FX##(V_133e!)) * 1000.0#   '@1612d DS:25e4,25ec
    L_BP2c% = 1   '@161f9
    V_0f14! = 1.0   '@16203 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_15ce6   '@16214
L_16221:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@16221 DS:25dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@16255 DS:1dea
    V_0f14! = A_19fe!(0, 0)   '@16280
    V_0f10! = 1.0   '@162a0 DS:1dea
L_162b6:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f10!)), 0) < 0.0) THEN GOTO L_163b3   '@162b6 DS:1de6
    V_155a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)))), 0)   '@162ea
    V_1562# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)))), 1)   '@1634a
    GOTO L_1640d   '@163ab
L_163b3:
    V_155a# = A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)   '@163b3
    V_1562# = A_19fe!(RT_CINT%(FX##(V_0f10!)), 1)   '@163dd
L_1640d:
    V_156a# = A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)   '@1640d
    V_1572# = A_19fe!(RT_CINT%(FX##(V_0f10!)), 3)   '@16435
    V_0ef4# = V_156a#   '@16460
    V_0efc# = V_1572#   '@16471
    V_15d2# = V_0f10!   '@16482
    V_15da# = V_0f10!   '@16493
L_164a9:
    V_15e2! = 1.0   '@164ae DS:1dea
L_164c4:
    IF NOT (FX##(V_15e2!) = FX##(V_15da#) OR (V_15e2! = V_0f10! OR FX##(V_15e2!) = FX##(V_15d2#))) THEN GOTO L_16525   '@164c4
    GOTO L_16ac3   '@1651d
L_16525:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_15e2!)), 0) < 0.0) THEN GOTO L_16622   '@16525 DS:1de6
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)))), 0)   '@16559
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)))), 1)   '@165b9
    GOTO L_1667c   '@1661a
L_16622:
    V_153a# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)   '@16622
    V_1542# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 1)   '@1664c
L_1667c:
    V_154a# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 2)   '@1667c
    V_1552# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 3)   '@166a4
    IF NOT (ABS(FX##(V_1562#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_155a#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_16735   '@166cf
    L_BP30! = 1.0   '@1671d DS:1dea
    GOTO L_16874   '@1672d
L_16735:
    IF NOT (ABS(FX##(V_1562#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_155a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_1679b   '@16735
    L_BP30! = 2.0   '@16783 DS:1e2c
    GOTO L_16874   '@16793
L_1679b:
    IF NOT (ABS(FX##(V_1572#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_156a#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_16801   '@1679b
    L_BP30! = 3.0   '@167e9 DS:2312
    GOTO L_16874   '@167f9
L_16801:
    IF NOT (ABS(FX##(V_1572#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_156a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_16867   '@16801
    L_BP30! = 4.0   '@1684f DS:2516
    GOTO L_16874   '@1685f
L_16867:
    GOTO L_16ac3   '@16867
L_16874:
    L_BP34! = L_BP30!   '@16879
    IF NOT (L_BP34! = 1.0) THEN GOTO L_16913   '@16888 DS:1dea
    V_0ef4# = (FX##(V_156a#) + V_154a#) / 2.0#   '@168a2 DS:1f9e
    V_0efc# = (FX##(V_1572#) + V_1552#) / 2.0#   '@168bd DS:1f9e
    V_155a# = V_154a#   '@168d8
    V_1562# = V_1552#   '@168e9
    V_15d2# = V_15e2!   '@168fa
    GOTO L_16aa5   '@1690b
L_16913:
    IF NOT (L_BP34! = 2.0) THEN GOTO L_16999   '@16914 DS:1e2c
    V_0ef4# = (FX##(V_156a#) + V_153a#) / 2.0#   '@16928 DS:1f9e
    V_0efc# = (FX##(V_1572#) + V_1542#) / 2.0#   '@16943 DS:1f9e
    V_155a# = V_153a#   '@1695e
    V_1562# = V_1542#   '@1696f
    V_15d2# = V_15e2!   '@16980
    GOTO L_16aa5   '@16991
L_16999:
    IF NOT (L_BP34! = 3.0) THEN GOTO L_16a1f   '@1699a DS:2312
    V_0ef4# = (FX##(V_155a#) + V_154a#) / 2.0#   '@169ae DS:1f9e
    V_0efc# = (FX##(V_1562#) + V_1552#) / 2.0#   '@169c9 DS:1f9e
    V_156a# = V_154a#   '@169e4
    V_1572# = V_1552#   '@169f5
    V_15da# = V_15e2!   '@16a06
    GOTO L_16aa5   '@16a17
L_16a1f:
    IF NOT (L_BP34! = 4.0) THEN GOTO L_16aa5   '@16a20 DS:2516
    V_0ef4# = (FX##(V_155a#) + V_153a#) / 2.0#   '@16a34 DS:1f9e
    V_0efc# = (FX##(V_1562#) + V_1542#) / 2.0#   '@16a4f DS:1f9e
    V_156a# = V_153a#   '@16a6a
    V_1572# = V_1542#   '@16a7b
    V_15da# = V_15e2!   '@16a8c
    GOTO L_16aa5   '@16a9d
L_16aa5:
    V_15e2! = -1.0   '@16aa5 DS:25dc
    GOTO L_16afa   '@16ab6
L_16ac3:
    V_15e2! = FX##(V_15e2!) + 1.0   '@16ac8 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_15e2! > V_0f14!) THEN GOTO L_164c4   '@16ade
L_16afa:
    IF NOT (V_15e2! = -1.0) THEN GOTO L_16b1d   '@16afa DS:25dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_164a9   '@16b15
L_16b1d:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@16b1d DS:1dea
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_0ef4#   '@16b51
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_0efc#   '@16b8a
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = 0.0   '@16bc4 DS:1de6
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = 0.0   '@16bfb DS:1de6
    V_0f10! = FX##(V_0f10!) + 1.0   '@16c35 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f10! > V_0f14!) THEN GOTO L_162b6   '@16c4b
    V_0f10! = 1.0   '@16c66 DS:1dea
L_16c7c:
    V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)   '@16c7c
    V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)   '@16cc0
    V_15e2! = 1.0   '@16d05 DS:1dea
L_16d1c:
    IF NOT (FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 1)) = FX##(V_0efc#) AND FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)) = FX##(V_0ef4#) OR -A_19fe!(RT_CINT%(FX##(V_15e2!)), 0) = V_0f10!) THEN GOTO L_16dd0   '@16d1c
    GOTO L_16e02   '@16dc8
L_16dd0:
    V_15e2! = FX##(V_15e2!) + 1.0   '@16dd0 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_15e2! > V_0f14!) THEN GOTO L_16d1c   '@16de6
L_16e02:
    IF NOT (V_15e2! > V_0f14!) THEN GOTO L_16ec9   '@16e02
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@16e1d DS:1dea
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_0ef4#   '@16e51
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_0efc#   '@16e8a
L_16ec9:
    V_0f10! = FX##(V_0f10!) + 1.0   '@16ec9 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1 < V_0f10!) THEN GOTO L_16c7c   '@16edf
    V_0f10! = FX##(V_0f14!) + 1.0   '@16f18 DS:1dea
L_16f34:
    V_15e2! = FX##(V_0f10!) + 1.0   '@16f34 DS:1dea
L_16f50:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 1)) - A_19fe!(RT_CINT%(FX##(V_15e2!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)) - A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)) < FX##(V_133a!)) THEN GOTO L_17169   '@16f50
    IF NOT (A_19fe!(0, 0) > V_15e2!) THEN GOTO L_1711a   '@17006
    L_BP30! = FX##(V_15e2!) + 1.0   '@17030 DS:1dea
L_1704a:
    A_19fe!(RT_CINT%(FX##(L_BP30!) - 1.0), 0) = A_19fe!(RT_CINT%(FX##(L_BP30!)), 0)   '@1704a DS:25dc
    A_19fe!(RT_CINT%(FX##(L_BP30!) - 1.0), 1) = A_19fe!(RT_CINT%(FX##(L_BP30!)), 1)   '@17090 DS:25dc
    L_BP30! = FX##(L_BP30!) + 1.0   '@170d8 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < L_BP30!) THEN GOTO L_1704a   '@170ec
L_1711a:
    V_15e2! = FX##(V_15e2!) - 1.0   '@1711a DS:25dc
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@17130 DS:25dc
L_17169:
    V_15e2! = FX##(V_15e2!) + 1.0   '@17169 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_15e2!) THEN GOTO L_16f50   '@1717f
    V_0f10! = FX##(V_0f10!) + 1.0   '@171a9 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) <= V_0f10!) THEN GOTO L_16f34   '@171bf
    L_BP30! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) - 90.0   '@171e9 DS:25f4
    IF NOT (L_BP30! < 0.0) THEN GOTO L_17246   '@17218 DS:1de6
    L_BP30! = FX##(L_BP30!) + 360.0   '@17232 DS:25f8
L_17246:
    L_BP30! = FX##(L_BP30!) * V_0e68_pi# / 180.0#   '@17246 DS:25e4
    V_0ef4# = 100000.0#   '@1725f DS:25fc
    L_BP38! = A_19fe!(0, 0)   '@17270
    FOR V_0f10! = FX##(V_0f14!) + 1.0 TO L_BP38!   '@17290 DS:1dea
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f10!)), 0) < 0.0) THEN GOTO L_173c9   '@1729c DS:1de6
    A_19fe!(RT_CINT%(FX##(V_0f10!)), 1) = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)))), 1)   '@172d0
    A_19fe!(RT_CINT%(FX##(V_0f10!)), 0) = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(-A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)))), 0)   '@1734b
L_173c9:
    A_19fe!(RT_CINT%(FX##(V_0f10!)), 2) = RT_SIN##(FX##(L_BP30!)) * A_19fe!(RT_CINT%(FX##(V_0f10!)), 1) + (1.0 - RT_POT##((RT_SIN##(FX##(L_BP30!))), (2.0))) * A_19fe!(RT_CINT%(FX##(V_0f10!)), 0) / (RT_COS##(FX##(L_BP30!)) - RT_COS##(FX##(L_BP30!)) = FX##(0.0))   '@173c9 DS:1de6,1dea,1e2c
    IF NOT (FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)) < FX##(V_0ef4#)) THEN GOTO L_174f4   '@17489
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)   '@174bb
    V_0ef0! = V_0f10!   '@174e3
L_174f4:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@174f4 DS:1dea
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = 1001.0   '@1751f DS:2604
    L_BP30! = 2.0   '@1754a DS:1e2c
L_17560:
    V_0ef0! = -1.0   '@17560 DS:25dc
    V_15e2! = 1000.0   '@17571 DS:2608
    L_BP3c! = A_19fe!(0, 0)   '@17582
    FOR V_0f10! = FX##(V_0f14!) + 1.0 TO L_BP3c!   '@175a2 DS:1dea
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f10!)), 2) < V_15e2! AND FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)) > FX##(V_0ef4#)) THEN GOTO L_17655   '@175ae
    V_15e2! = A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)   '@1761c
    V_0ef0! = V_0f10!   '@17644
L_17655:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@17655 DS:1dea
    IF NOT (V_0ef0! <> -1.0) THEN GOTO L_176e0   '@17680 DS:25dc
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = FX##(L_BP30!) + 1000.0   '@1769b DS:2608
    V_0ef4# = V_15e2!   '@176ca
L_176e0:
    L_BP30! = FX##(L_BP30!) + 1.0   '@176e0 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (FX##(L_BP30!) + V_0f14! > FX##(A_19fe!(0, 0))) THEN GOTO L_17560   '@176f4
    L_BP30! = 1.0   '@17722 DS:1dea
    L_BP40! = A_19fe!(0, 0)   '@17732
    FOR V_0f10! = FX##(V_0f14!) + 1.0 TO L_BP40!   '@17752 DS:1dea
    IF NOT (FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 3)) = FX##(L_BP30!) + 1000.0) THEN GOTO L_1779f   '@1775e DS:2608
    GOTO L_177c7   '@17797
L_1779f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@1779f DS:1dea
L_177c7:
L_177cc:
    L_BP30! = FX##(L_BP30!) + 1.0   '@177d1 DS:1dea
    L_BP44! = A_19fe!(0, 0)   '@177e5
    FOR V_15e2! = FX##(V_0f14!) + 1.0 TO L_BP44!   '@17805 DS:1dea
    IF NOT (FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 3)) = FX##(L_BP30!) + 1000.0) THEN GOTO L_178ef   '@17812 DS:2608
    A_19fe!(RT_CINT%(FX##(V_0f10!)), 2) = A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)   '@1784b
    A_19fe!(RT_CINT%(FX##(V_0f10!)), 3) = A_19fe!(RT_CINT%(FX##(V_15e2!)), 1)   '@1788c
    V_0f10! = V_15e2!   '@178d1
    GOTO L_1791a   '@178e2
L_178ef:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@178ef DS:1dea
L_1791a:
    IF NOT (FX##(A_19fe!(0, 0)) - V_0f14! - 1.0 >= FX##(L_BP30!)) THEN GOTO L_17955   '@1791a DS:25dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_177cc   '@1794d
L_17955:
    L_BP48! = A_19fe!(0, 0)   '@17955
    FOR V_0f10! = FX##(V_0f14!) + 1.0 TO L_BP48!   '@17975 DS:1dea
    IF NOT (FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 3)) = FX##(A_19fe!(0, 0)) - V_0f14! + 1000.0) THEN GOTO L_17b21   '@17982 DS:2608
    IF NOT (A_19fe!(0, 0) > V_0f10!) THEN GOTO L_17ae0   '@179d0
    L_BP4c! = A_19fe!(0, 0)   '@179fa
    FOR V_15e2! = FX##(V_0f10!) + 1.0 TO L_BP4c!   '@17a1a DS:1dea
    FOR L_BP30! = 0.0 TO 3.0   '@17a26 DS:1de6,1dea,2312
    A_19fe!(RT_CINT%(FX##(V_15e2!) - 1.0), RT_CINT%(FX##(L_BP30!))) = A_19fe!(RT_CINT%(FX##(V_15e2!)), RT_CINT%(FX##(L_BP30!)))   '@17a34 DS:25dc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP30!   '@17a8a DS:1dea,2312
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@17ab0 DS:1dea
L_17ae0:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@17ae0 DS:25dc
    GOTO L_17b4c   '@17b14
L_17b21:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@17b21 DS:1dea
L_17b4c:
    ' END SUB   '@17b4c
END SUB

SUB S_17b61   ' entrada de SUB/FUNCTION (B$ENRA, locais 2 bytes) (0x17b61)
    DIM L_BP0c%
    ' ---- FUN_1000_7b61 @0x17b61  (017b61_FUN_1000_7b61.lift.txt; evidence_id (assembly): ev_535814aff2822484fe8fe58b34ab766989afdf2e7360fc8aa9227c29d96be252)
    V_15e2! = FX##(V_1522!) + 1.0   '@17b69 DS:1dea
    V_0f1c$ = "NAO"   '@17b7f DS:2562
L_17b96:
    IF NOT (A_19fe!(0, 0) >= V_15e2!) THEN GOTO L_17e4c   '@17b97
    IF NOT (A_19fe!(RT_CINT%(FX##(V_15e2!)), 0) >= 0.0) THEN GOTO L_17c4c   '@17bbb DS:1de6
    V_153a# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 0)   '@17bef
    V_1542# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 1)   '@17c19
    GOTO L_17d12   '@17c44
L_17c4c:
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 0))))), 0)   '@17c4c
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 0))))), 1)   '@17cac
L_17d12:
    V_154a# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 2)   '@17d12
    V_1552# = A_19fe!(RT_CINT%(FX##(V_15e2!)), 3)   '@17d3a
    CALL S_11c49   '@17d65
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = V_1562# AND V_0ef4# = V_155a#) THEN GOTO L_17dbf   '@17d6f
    V_0f1c$ = "NAO"   '@17dad DS:2562
L_17dbf:
    IF NOT (V_0efc# = V_1572# AND V_0ef4# = V_156a#) THEN GOTO L_17e0f   '@17dbf
    V_0f1c$ = ""   '@17dfd DS:1cc0
L_17e0f:
    IF NOT (V_0f1c$ = "") THEN GOTO L_17e2e   '@17e0f DS:1cc0
    GOTO L_17e4c   '@17e26
L_17e2e:
    V_15e2! = FX##(V_15e2!) + 1.0   '@17e2e DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17b96   '@17e44
L_17e4c:
    L_BP0c% = (V_1536! = -1.0)   '@17e4c DS:25dc
    IF NOT ((V_0f1c$ = "" OR L_BP0c%) <> 0) THEN GOTO L_17e92   '@17e75 DS:1cc0
    GOTO L_18129   '@17e8a
L_17e92:
    V_15e2! = 1.0   '@17e92 DS:1dea
L_17ea8:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1 >= V_15e2!) THEN GOTO L_18124   '@17ea9
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 0)   '@17edc
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 1)   '@17f20
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!) + 1.0)), 0)   '@17f65 DS:1dea
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!) + 1.0)), 1)   '@17fae DS:1dea
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))) = 1) THEN GOTO L_18032   '@17ff8
    GOTO L_18100   '@1802a
L_18032:
    CALL S_11c49   '@18032
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = V_1562# AND V_0ef4# = V_155a#) THEN GOTO L_1808c   '@1803c
    V_0f1c$ = "NAO"   '@1807a DS:2562
L_1808c:
    IF NOT (V_0efc# = V_1572# AND V_0ef4# = V_156a#) THEN GOTO L_180dc   '@1808c
    V_0f1c$ = "NAO"   '@180ca DS:2562
L_180dc:
    IF NOT (V_0f1c$ = "") THEN GOTO L_180fb   '@180dc DS:1cc0
    GOTO L_18124   '@180f3
L_180fb:
L_18100:
    V_15e2! = FX##(V_15e2!) + 1.0   '@18105 DS:1dea
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_17ea8   '@1811b
L_18124:
L_18129:
    ' END SUB   '@18129
END SUB

SUB S_20146   ' entrada de SUB/FUNCTION (B$ENRA, locais 844 bytes) (0x20146)
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
    DIM L_BPe6#
    DIM L_BPee#
    DIM L_BPf6#
    DIM L_BPfe#
    REDIM L_BP1c!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP2e!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP40!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP52!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP64%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP7a!(-32768 TO -32768, -32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP8c!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    REDIM L_BP9e!(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_2000_0146 @0x20146  (020146_FUN_2000_0146.lift.txt; evidence_id (assembly): ev_9a23cb80155069f8a9b788bc85a6d9c11fce12869a537e8e194706a4a2917903)
    REDIM L_BP1c!(0 TO 50)   '@2014e
    REDIM L_BP2e!(0 TO 50)   '@2016b
    REDIM L_BP40!(0 TO 50)   '@20183
    REDIM L_BP52!(0 TO 50)   '@201a0
    REDIM L_BP64%(0 TO 50)   '@201b8
    REDIM L_BP7a!(0 TO 50, 0 TO 1)   '@201d0
    REDIM L_BP8c!(0 TO 20)   '@201ef
    REDIM L_BP9e!(0 TO 20)   '@2020d
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_20286   '@20249 DS:2610
    GOTO L_2a74e   '@2027e
L_20286:
    L_BP120! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@20286
    L_BPde! = 0.0   '@202b0 DS:2614
    L_BP124! = A_109e%(RT_CINT%(FX##(L_BP120!)), 0) - 1   '@202c1
    FOR V_0f10! = 1.0 TO L_BP124!   '@202f1 DS:2618
    IF NOT (A_10fa%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(V_0f10!))) = 1) THEN GOTO L_20332   '@202f8
    GOTO L_2097e   '@2032a
L_20332:
    L_BP128! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(V_0f10!))), 0)   '@20332
    L_BP12c! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(V_0f10!))), 1)   '@20376
    L_BP106! = FX##(V_0f10!) + 1.0   '@203bb DS:2618
    IF NOT (A_109e%(RT_CINT%(FX##(L_BP120!)), 0) = L_BP106!) THEN GOTO L_2041a   '@203d1
    L_BP106! = 1.0   '@20409 DS:2618
L_2041a:
    L_BP130! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP106!))), 0)   '@2041a
    L_BP134! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP106!))), 1)   '@2045e
    GOSUB L_20c6b   '@204a3
    L_BPde! = FX##(L_BPde!) + L_BPd6!   '@204b0
    IF NOT (L_BPd6! > V_133a!) THEN GOTO L_20979   '@204c6
    GOSUB L_22d01   '@204e1
    LOCATE 25, 1   '@204ee
    PRINT ""; RT_TAB$(78); ""; " ";   '@20509 DS:261c,2620
    LOCATE 25, 1   '@20532
    PRINT USING "    Sub-area ##"; RT_PU#(V_0f10!, "    Sub-area ##", 1);   '@2054d DS:2626
    PRINT USING "     Alvenaria ###.##"; RT_PU#(L_BP10e!, "     Alvenaria ###.##", 1);   '@2056d DS:263a
    GOSUB L_25041   '@2058d
    PRINT USING "     Carga Area ###.##"; RT_PU#(L_BP112!, "     Carga Area ###.##", 1);   '@2059a DS:2654
    GOSUB L_29708   '@205ba
    PRINT "       "; V_0f18$;   '@205c7 DS:266e
    IF NOT (V_1a66$ = "S") THEN GOTO L_20974   '@205de DS:267a
    V_0f1c$ = "  \           \  ###   ####.## m2  ####.## ####.## ####.## ###.##  \          \"   '@205f5 DS:2680
    IF NOT (RT_MID$((V_0f18$), (1), (LEN(V_0e60$))) = V_0e60$) THEN GOTO L_207a5   '@20607
    V_0ef0! = RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0)))   '@20632 DS:2610
    V_19f6! = FX##(L_BP10e!) + V_19f6! + L_BP112! + FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) * L_BPd6! + -(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) * FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * L_BPd6!   '@20670 DS:2618
    L_BP10e! = L_BP10e! / RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0)))   '@20711 DS:2610
    L_BP112! = L_BP112! / RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0)))   '@20757 DS:2610
    GOTO L_2085c   '@2079d
L_207a5:
    V_0ef0! = 1.0   '@207a5 DS:2618
    V_19fa! = FX##(L_BP10e!) + V_19fa! + L_BP112! + FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) * L_BPd6! + -(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) * FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * L_BPd6!   '@207b6 DS:2618
L_2085c:
    RT_LPTABRE: PRINT #RT_LPT, USING V_0f1c$; V_0f20$; RT_PU#(V_0f10!, V_0f1c$, 1); RT_PU#(L_BPd6!, V_0f1c$, 2); RT_PU#(L_BP10e!, V_0f1c$, 3); RT_PU#(L_BP112!, V_0f1c$, 4); RT_PU#(RT_SNG!(FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) * L_BPd6! / V_0ef0!), V_0f1c$, 5); RT_PU#(RT_SNG!(-(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) * FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) * L_BPd6! / V_0ef0!), V_0f1c$, 6); V_0f18$: RT_LPTQUEBRA 0   '@2085c DS:2618
    V_0f20$ = ""   '@2095d DS:261c
L_20974:
L_20979:
L_2097e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@20983 DS:2618
    IF NOT (ABS((FX##(L_BPde!) - A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) / A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) > 0.02999999932944774627685546875##) THEN GOTO L_20b91   '@209af DS:26d4
    V_0f14! = 0.0   '@20a05 DS:2614
    V_0f10! = 1.0   '@20a16 DS:2618
L_20a2c:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f10!)), 1) <> 2.0) THEN GOTO L_20a77   '@20a2c DS:2610
    V_0f14! = FX##(V_0f14!) + 1.0   '@20a61 DS:2618
L_20a77:
    V_0f10! = FX##(V_0f10!) + 1.0   '@20a77 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f10! <= V_0f0c! THEN GOTO L_20a2c   '@20a8d
    BEEP   '@20aa5
    RT_VIEWPRINT 23, 25   '@20aaf
    RT_CLS 2   '@20ac1
    PRINT " A Somatoria das Areas parciais da Laje "; V_0e58_prefixolaje$; LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_0f14!)))   '@20acf DS:26d8
    PRINT " diferem em mais de 3% da Area Total.  ";   '@20b0b DS:2704
    PRINT USING "#####.## #####.##"; RT_PU#(L_BPde!, "#####.## #####.##", 1); RT_PU#(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2), "#####.## #####.##", 2)   '@20b19 DS:2730
    PRINT " Qualquer Tecla para Continuar ou <F2> para interromper.";   '@20b58 DS:2746
    CALL MIXT_07f1_LimpaTeclado   '@20b66
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_0f18$ = RT_INPUT$(1)   '@20b70
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
L_20b91:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) THEN GOTO L_20c12   '@20b91 DS:2618
    V_19ee! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) * A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5) + V_19ee!   '@20bc6
L_20c12:
    V_19f2! = FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 2)) * A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4) + V_19f2!   '@20c12
    GOTO L_2a74e   '@20c5e
    ' ---- F_20c66 @0x20c66  (020c66_F_20c66.lift.txt; evidence_id (assembly): ev_263a6ec1e110e628c47327543590962531a832eb70f5077e1e388f3a926378e2)
L_20c6b:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    L_BP138! = A_19fe!(0, 0)   '@20c70
    FOR V_0f14! = 1.0 TO L_BP138!   '@20c91 DS:2618
    IF NOT (-A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) = V_0f10!) THEN GOTO L_20d2f   '@20c98
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@20ccf
    V_0efc# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@20cf7
    GOTO L_20d5b   '@20d22
L_20d2f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@20d2f DS:2618
L_20d5b:
    IF NOT (A_19fe!(0, 0) < V_0f14!) THEN GOTO L_21073   '@20d5b
    L_BP13c! = A_19fe!(0, 0)   '@20d85
    FOR V_0f14! = 1.0 TO L_BP13c!   '@20da6 DS:2618
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) > 0.0) THEN GOTO L_20e3f   '@20dae DS:2614
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)   '@20de2
    V_0efc# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 1)   '@20e0c
    GOTO L_20f05   '@20e37
L_20e3f:
    V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 0)   '@20e3f
    V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 1)   '@20e9f
L_20f05:
    IF NOT (ABS(FX##(V_0efc#) - L_BP12c!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP128!) < FX##(V_133a!)) THEN GOTO L_20fb9   '@20f05
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@20f59
    V_0efc# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@20f81
    GOTO L_2106e   '@20fac
L_20fb9:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)) - L_BP12c!) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)) - L_BP128!) < FX##(V_133a!)) THEN GOTO L_21042   '@20fb9
    GOTO L_2106e   '@2103a
L_21042:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@21042 DS:2618
L_2106e:
L_21073:
    L_BP1c!(0) = 2.0   '@21073 DS:2610
    L_BP1c!(1) = L_BP128!   '@21092
    L_BP2e!(1) = L_BP12c!   '@210af
    L_BP1c!(2) = V_0ef4#   '@210cc
    L_BP2e!(2) = V_0efc#   '@210ec
    L_BP140! = 1.0   '@2110c DS:2618
L_21122:
    IF NOT (ABS(FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!)))) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_21200   '@21127 DS:2618
    L_BPee# = FX##(V_0e68_pi#) / 2.0#   '@2117b DS:2782
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP140!))) > L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) THEN GOTO L_211f8   '@21191 DS:2618
    L_BPee# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@211dd DS:2782,278a
L_211f8:
    GOTO L_216e1   '@211f8
L_21200:
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0)) >= L_BP2e!(RT_CINT%(FX##(L_BP140!))) AND L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0)) > L_BP1c!(RT_CINT%(FX##(L_BP140!)))) THEN GOTO L_2132e   '@21200 DS:2618
    L_BPee# = ATN((FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) - L_BP2e!(RT_CINT%(FX##(L_BP140!)))) / (FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) - L_BP1c!(RT_CINT%(FX##(L_BP140!)))))   '@212a2 DS:2618
L_2132e:
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0)) > L_BP2e!(RT_CINT%(FX##(L_BP140!))) AND L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0)) < L_BP1c!(RT_CINT%(FX##(L_BP140!)))) THEN GOTO L_21469   '@2132e DS:2618
    L_BPee# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!)))) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) / (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) - L_BP2e!(RT_CINT%(FX##(L_BP140!)))))   '@213d0 DS:2618,2782
L_21469:
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0)) <= L_BP2e!(RT_CINT%(FX##(L_BP140!))) AND L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0)) < L_BP1c!(RT_CINT%(FX##(L_BP140!)))) THEN GOTO L_2159c   '@21469 DS:2618
    L_BPee# = ATN((FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!)))) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) / (FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!)))) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0)))) + V_0e68_pi#   '@2150b DS:2618
L_2159c:
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0)) < L_BP2e!(RT_CINT%(FX##(L_BP140!))) AND L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0)) > L_BP1c!(RT_CINT%(FX##(L_BP140!)))) THEN GOTO L_216dc   '@2159c DS:2618
    L_BPee# = 3.0# * FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) - L_BP1c!(RT_CINT%(FX##(L_BP140!)))) / (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!)))) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))))   '@2163e DS:2618,2782,278a
L_216dc:
L_216e1:
    L_BP144! = -1.0   '@216e1 DS:2792
    L_BP148! = A_19fe!(0, 0)   '@216f2
    FOR V_0f04! = 1.0 TO L_BP148!   '@21713 DS:2618
    IF NOT (V_0f04! = V_0f14!) THEN GOTO L_2173d   '@2171a
    GOTO L_22497   '@21735
L_2173d:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f04!)), 0) >= 0.0) THEN GOTO L_217ce   '@2173d DS:2614
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f04!)), 0)   '@21771
    V_0efc# = A_19fe!(RT_CINT%(FX##(V_0f04!)), 1)   '@2179b
    GOTO L_21894   '@217c6
L_217ce:
    V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f04!)), 0))))), 0)   '@217ce
    V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f04!)), 0))))), 1)   '@2182e
L_21894:
    IF NOT (ABS(FX##(V_0efc#) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_21928   '@21894 DS:2618
    GOTO L_219f4   '@21920
L_21928:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f04!)), 3)) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f04!)), 2)) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_219e7   '@21928 DS:2618
    GOTO L_219f4   '@219df
L_219e7:
    GOTO L_22497   '@219e7
L_219f4:
    IF NOT (ABS(FX##(V_0efc#) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_21add   '@219f9 DS:2618
    V_0ef4# = A_19fe!(RT_CINT%(FX##(V_0f04!)), 2)   '@21a85
    V_0efc# = A_19fe!(RT_CINT%(FX##(V_0f04!)), 3)   '@21aad
L_21add:
    IF NOT (ABS(FX##(V_0efc#) - L_BP134!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP130!) < FX##(V_133a!) OR A_19fe!(RT_CINT%(FX##(V_0f04!)), 0) = -L_BP106!) THEN GOTO L_21b97   '@21add
    V_153a# = L_BP130!   '@21b68
    V_1542# = L_BP134!   '@21b79
    GOTO L_224c8   '@21b8a
L_21b97:
    IF NOT (ABS(FX##(V_0ef4#) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_133a!)) THEN GOTO L_21c47   '@21b97 DS:2618
    L_BPf6# = FX##(V_0e68_pi#) / 2.0#   '@21bd8 DS:2782
    IF NOT (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) > FX##(V_0efc#)) THEN GOTO L_21c3f   '@21bee DS:2618
    L_BPf6# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@21c24 DS:2782,278a
L_21c3f:
    GOTO L_21fd4   '@21c3f
L_21c47:
    IF NOT (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) <= FX##(V_0efc#) AND FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_0ef4#)) THEN GOTO L_21d23   '@21c47 DS:2618
    L_BPf6# = ATN((FX##(V_0efc#) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) / (FX##(V_0ef4#) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))))   '@21cbd DS:2618
L_21d23:
    IF NOT (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_0efc#) AND FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) > FX##(V_0ef4#)) THEN GOTO L_21e09   '@21d23 DS:2618
    L_BPf6# = FX##(V_0e68_pi#) / 2.0# + ATN((FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) - V_0ef4#) / (FX##(V_0efc#) - L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))))   '@21d99 DS:2618,2782
L_21e09:
    IF NOT (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) >= FX##(V_0efc#) AND FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) > FX##(V_0ef4#)) THEN GOTO L_21ee4   '@21e09 DS:2618
    L_BPf6# = ATN((FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) - V_0efc#) / (FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) - V_0ef4#)) + V_0e68_pi#   '@21e7f DS:2618
L_21ee4:
    IF NOT (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) > FX##(V_0efc#) AND FX##(L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) < FX##(V_0ef4#)) THEN GOTO L_21fcf   '@21ee4 DS:2618
    L_BPf6# = 3.0# * FX##(V_0e68_pi#) / 2.0# + ATN((FX##(V_0ef4#) - L_BP1c!(RT_CINT%(FX##(L_BP140!) + 1.0))) / (FX##(L_BP2e!(RT_CINT%(FX##(L_BP140!) + 1.0))) - V_0efc#))   '@21f5a DS:2618,2782,278a
L_21fcf:
L_21fd4:
    IF NOT (FX##(V_0e68_pi#) / 2.0# > FX##(L_BPee#) AND L_BPee# >= 0.0#) THEN GOTO L_220a5   '@21fd4 DS:2782,2796
    IF NOT (FX##(L_BPee#) + V_0e68_pi# > FX##(L_BPf6#) AND L_BPf6# >= 0.0#) THEN GOTO L_2207d   '@22017 DS:2796
    L_BPfe# = FX##(V_0e68_pi#) - L_BPee# + L_BPf6#   '@2205a
    GOTO L_220a0   '@22075
L_2207d:
    L_BPfe# = L_BPf6# - (FX##(L_BPee#) + V_0e68_pi#)   '@2207d
L_220a0:
L_220a5:
    IF NOT (L_BPee# < V_0e68_pi# AND FX##(V_0e68_pi#) / 2.0# <= FX##(L_BPee#)) THEN GOTO L_22176   '@220a5 DS:2782
    IF NOT (FX##(L_BPee#) + V_0e68_pi# > FX##(L_BPf6#) AND L_BPf6# >= 0.0#) THEN GOTO L_2214e   '@220e8 DS:2796
    L_BPfe# = FX##(V_0e68_pi#) - L_BPee# + L_BPf6#   '@2212b
    GOTO L_22171   '@22146
L_2214e:
    L_BPfe# = L_BPf6# - (FX##(L_BPee#) + V_0e68_pi#)   '@2214e
L_22171:
L_22176:
    IF NOT (3.0# * FX##(V_0e68_pi#) / 2.0# > FX##(L_BPee#) AND L_BPee# >= V_0e68_pi#) THEN GOTO L_2225e   '@22176 DS:2782,278a
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(L_BPf6#) AND FX##(L_BPee#) - V_0e68_pi# <= FX##(L_BPf6#)) THEN GOTO L_2222c   '@221be DS:2782
    L_BPfe# = L_BPf6# - (FX##(L_BPee#) - V_0e68_pi#)   '@22206
    GOTO L_22259   '@22224
L_2222c:
    L_BPfe# = 2.0# * FX##(V_0e68_pi#) - (FX##(L_BPee#) - V_0e68_pi#) + L_BPf6#   '@2222c DS:2782
L_22259:
L_2225e:
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(L_BPee#) AND 3.0# * FX##(V_0e68_pi#) / 2.0# <= FX##(L_BPee#)) THEN GOTO L_2234b   '@2225e DS:2782,278a
    IF NOT (2.0# * FX##(V_0e68_pi#) >= FX##(L_BPf6#) AND FX##(L_BPee#) - V_0e68_pi# <= FX##(L_BPf6#)) THEN GOTO L_22319   '@222ab DS:2782
    L_BPfe# = L_BPf6# - (FX##(L_BPee#) - V_0e68_pi#)   '@222f3
    GOTO L_22346   '@22311
L_22319:
    L_BPfe# = 2.0# * FX##(V_0e68_pi#) - (FX##(L_BPee#) - V_0e68_pi# - L_BPf6#)   '@22319 DS:2782
L_22346:
L_2234b:
    IF NOT (ABS(FX##(L_BPf6#) - L_BPee# - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_22384   '@2234b
    L_BPfe# = V_0e68_pi#   '@22373
L_22384:
    IF NOT (2.0# * FX##(V_0e68_pi#) <= FX##(L_BPfe#)) THEN GOTO L_223c2   '@22384 DS:2782
    L_BPfe# = L_BPfe# - 2.0# * FX##(V_0e68_pi#)   '@223a4 DS:2782
L_223c2:
    IF NOT (L_BP144! = -1.0) THEN GOTO L_22429   '@223c2 DS:2792
    V_153a# = V_0ef4#   '@223dd
    V_1542# = V_0efc#   '@223ee
    L_BPe6# = L_BPfe#   '@223ff
    L_BP144! = V_0f04!   '@22410
    GOTO L_22492   '@22421
L_22429:
    IF NOT (L_BPe6# < L_BPfe#) THEN GOTO L_2248d   '@22429
    V_153a# = V_0ef4#   '@22444
    V_1542# = V_0efc#   '@22455
    L_BPe6# = L_BPfe#   '@22466
    L_BP144! = V_0f04!   '@22477
L_2248d:
L_22492:
L_22497:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2249c DS:2618
L_224c8:
    IF NOT (V_0f14! = -1.0) THEN GOTO L_22503   '@224c8 DS:2792
    L_BPd6! = 0.0   '@224e3 DS:2614
    RETURN   '@224f4
L_22503:
    L_BP1c!(RT_CINT%(FX##(L_BP140!) + 2.0)) = V_153a#   '@22503 DS:2610
    L_BP2e!(RT_CINT%(FX##(L_BP140!) + 2.0)) = V_1542#   '@2252f DS:2610
    L_BP1c!(0) = FX##(L_BP1c!(0)) + 1.0   '@2255b DS:2618
    IF NOT (ABS(FX##(V_1542#) - L_BP134!) < FX##(V_133a!) AND ABS(FX##(V_153a#) - L_BP130!) < FX##(V_133a!)) THEN GOTO L_2268b   '@2258d
    L_BP1c!(RT_CINT%(FX##(L_BP140!) + 3.0)) = L_BP1c!(1)   '@225e1 DS:279e
    L_BP2e!(RT_CINT%(FX##(L_BP140!) + 3.0)) = L_BP2e!(1)   '@22619 DS:279e
    L_BP1c!(0) = FX##(L_BP1c!(0)) + 1.0   '@22651 DS:2618
    GOTO L_226bf   '@22683
L_2268b:
    L_BP140! = FX##(L_BP140!) + 1.0   '@2268b DS:2618
    V_0f14! = L_BP144!   '@226a1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_21122   '@226b2
L_226bf:
    V_0f04! = 1.0   '@226bf DS:2618
L_226d6:
    IF NOT (FX##(V_0f04!) + 2.0 <= FX##(L_BP1c!(0)) - 1.0) THEN GOTO L_22bf6   '@226d6 DS:2610,2792
    IF NOT (L_BP1c!(RT_CINT%(FX##(V_0f04!))) = L_BP1c!(RT_CINT%(FX##(V_0f04!) + 1.0))) THEN GOTO L_228d5   '@22704 DS:2618
    IF NOT (L_BP1c!(RT_CINT%(FX##(V_0f04!))) = L_BP1c!(RT_CINT%(FX##(V_0f04!) + 2.0))) THEN GOTO L_228b2   '@22750 DS:2610
    L_BP14c! = L_BP1c!(0)   '@2279c
    FOR L_BP140! = FX##(V_0f04!) + 2.0 TO L_BP14c!   '@227bc DS:2610,2618
    L_BP1c!(RT_CINT%(FX##(L_BP140!) - 1.0)) = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@227c8 DS:2792
    L_BP2e!(RT_CINT%(FX##(L_BP140!) - 1.0)) = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@2280a DS:2792
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@2284c DS:2618
    L_BP1c!(0) = FX##(L_BP1c!(0)) - 1.0   '@22878 DS:2792
    GOTO L_228cd   '@228aa
L_228b2:
    V_0f04! = FX##(V_0f04!) + 1.0   '@228b2 DS:2618
L_228cd:
    GOTO L_22bed   '@228cd
L_228d5:
    IF NOT (L_BP1c!(RT_CINT%(FX##(V_0f04!) + 1.0)) <> L_BP1c!(RT_CINT%(FX##(V_0f04!) + 2.0)) AND L_BP1c!(RT_CINT%(FX##(V_0f04!))) <> L_BP1c!(RT_CINT%(FX##(V_0f04!) + 2.0))) THEN GOTO L_22bcd   '@228d5 DS:2610,2618
    IF NOT (ABS((FX##(L_BP2e!(RT_CINT%(FX##(V_0f04!) + 2.0))) - L_BP2e!(RT_CINT%(FX##(V_0f04!) + 1.0))) / (FX##(L_BP1c!(RT_CINT%(FX##(V_0f04!) + 2.0))) - L_BP1c!(RT_CINT%(FX##(V_0f04!) + 1.0))) - (FX##(L_BP2e!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP2e!(RT_CINT%(FX##(V_0f04!)))) / (FX##(L_BP1c!(RT_CINT%(FX##(V_0f04!) + 1.0))) - L_BP1c!(RT_CINT%(FX##(V_0f04!))))) < FX##(V_133e!)) THEN GOTO L_22baa   '@2297c DS:2610,2618
    L_BP150! = L_BP1c!(0)   '@22a94
    FOR L_BP140! = FX##(V_0f04!) + 2.0 TO L_BP150!   '@22ab4 DS:2610,2618
    L_BP1c!(RT_CINT%(FX##(L_BP140!) - 1.0)) = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@22ac0 DS:2792
    L_BP2e!(RT_CINT%(FX##(L_BP140!) - 1.0)) = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@22b02 DS:2792
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@22b44 DS:2618
    L_BP1c!(0) = FX##(L_BP1c!(0)) - 1.0   '@22b70 DS:2792
    GOTO L_22bc5   '@22ba2
L_22baa:
    V_0f04! = FX##(V_0f04!) + 1.0   '@22baa DS:2618
L_22bc5:
    GOTO L_22be8   '@22bc5
L_22bcd:
    V_0f04! = FX##(V_0f04!) + 1.0   '@22bcd DS:2618
L_22be8:
L_22bed:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_226d6   '@22bed
L_22bf6:
    L_BPd6! = 0.0   '@22bf6 DS:2614
    L_BP154! = FX##(L_BP1c!(0)) - 1.0   '@22c07 DS:2792
    FOR V_0f04! = 1.0 TO L_BP154!   '@22c2c DS:2618
    L_BPd6! = L_BPd6! - (FX##(L_BP1c!(RT_CINT%(FX##(V_0f04!)))) + L_BP1c!(RT_CINT%(FX##(V_0f04!) + 1.0))) * (FX##(L_BP2e!(RT_CINT%(FX##(V_0f04!)))) - L_BP2e!(RT_CINT%(FX##(V_0f04!) + 1.0))) / 2.0   '@22c34 DS:2610,2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@22cc6 DS:2618
    RETURN   '@22cf2
L_22d01:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    L_BP11a% = 0   '@22d06
    L_BPb2! = L_BP1c!(1)   '@22d11
    L_BPb6! = L_BP2e!(1)   '@22d2e
    L_BPba! = L_BP1c!(1)   '@22d4b
    L_BPbe! = L_BP2e!(1)   '@22d68
    L_BP158! = FX##(L_BP1c!(0)) - 1.0   '@22d85 DS:2792
    FOR L_BP140! = 2.0 TO L_BP158!   '@22daa DS:2610,2618
    L_BP15c! = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@22db2
    CALL MIXT_0877_Menor(L_BPb2!, L_BP15c!, L_BP160!)   '@22dd9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1c!(RT_CINT%(FX##(L_BP140!))) = L_BP15c!   '@22dee
    L_BPb2! = L_BP160!   '@22e10
    L_BP164! = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@22e1b
    CALL MIXT_0877_Menor(L_BPb6!, L_BP164!, L_BP168!)   '@22e42
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2e!(RT_CINT%(FX##(L_BP140!))) = L_BP164!   '@22e57
    L_BPb6! = L_BP168!   '@22e79
    L_BP16c! = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@22e84
    CALL MIXT_082a_Maior(L_BPba!, L_BP16c!, L_BP170!)   '@22eab
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1c!(RT_CINT%(FX##(L_BP140!))) = L_BP16c!   '@22ec0
    L_BPba! = L_BP170!   '@22ee2
    L_BP174! = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@22eed
    CALL MIXT_082a_Maior(L_BPbe!, L_BP174!, L_BP178!)   '@22f14
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP2e!(RT_CINT%(FX##(L_BP140!))) = L_BP174!   '@22f29
    L_BPbe! = L_BP178!   '@22f4b
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@22f56 DS:2618
    L_BP10e! = 0.0   '@22f82 DS:2614
    L_BP17c! = A_0fe6!(0, 0)   '@22f93
    FOR V_0f04! = 1.0 TO L_BP17c!   '@22fb4 DS:2618
    V_153a# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 0)   '@22fbc
    V_1542# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 1)   '@22fe6
    V_154a# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 2)   '@23011
    V_1552# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 3)   '@23039
    L_BP180! = FX##(V_153a#) / 1.0#   '@23064 DS:27a2
    L_BP184! = FX##(V_154a#) / 1.0#   '@2307b DS:27a2
    CALL MIXT_0877_Menor(L_BP180!, L_BP184!, L_BP188!)   '@2308b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP18c! = FX##(V_153a#) / 1.0#   '@230a0 DS:27a2
    L_BP190! = FX##(V_154a#) / 1.0#   '@230b1 DS:27a2
    CALL MIXT_082a_Maior(L_BP18c!, L_BP190!, L_BP194!)   '@230c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BPb2!) / 1.0 > FX##(L_BP194!) OR FX##(L_BPba!) / 1.0 < FX##(L_BP188!)) THEN GOTO L_23120   '@230d6 DS:2618
    GOTO L_23f76   '@23118
L_23120:
    L_BP198! = FX##(V_1542#) / 1.0#   '@23120 DS:27a2
    L_BP19c! = FX##(V_1552#) / 1.0#   '@23137 DS:27a2
    CALL MIXT_0877_Menor(L_BP198!, L_BP19c!, L_BP1a0!)   '@23147
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a4! = FX##(V_1542#) / 1.0#   '@2315c DS:27a2
    L_BP1a8! = FX##(V_1552#) / 1.0#   '@2316d DS:27a2
    CALL MIXT_082a_Maior(L_BP1a4!, L_BP1a8!, L_BP1ac!)   '@2317d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BPb6!) / 1.0 > FX##(L_BP1ac!) OR FX##(L_BPbe!) / 1.0 < FX##(L_BP1a0!)) THEN GOTO L_231dc   '@23192 DS:2618
    GOTO L_23f76   '@231d4
L_231dc:
    L_BP8c!(0) = 1.0   '@231dc DS:2618
    V_0ef4# = V_153a#   '@231fc
    V_0efc# = V_1542#   '@2320d
    L_BP102! = 1.0   '@2321e DS:2618
    L_BP1b0! = 0.0   '@2322f DS:2614
    GOSUB L_23fcc   '@23240
    IF NOT (FX##(L_BP1b4!) / 2.0 = RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_2329d   '@2324d DS:2610
    L_BP102! = 0.0   '@23284 DS:2614
    GOTO L_23344   '@23295
L_2329d:
    L_BP8c!(RT_CINT%(FX##(L_BP8c!(0)))) = V_153a#   '@2329d
    L_BP9e!(RT_CINT%(FX##(L_BP8c!(0)))) = V_1542#   '@232d4
    L_BP8c!(0) = FX##(L_BP8c!(0)) + 1.0   '@2330b DS:2618
L_23344:
    V_0ef4# = V_154a#   '@23344
    V_0efc# = V_1552#   '@23355
    L_BP106! = 1.0   '@23366 DS:2618
    GOSUB L_23fcc   '@23377
    IF NOT (FX##(L_BP1b4!) / 2.0 = RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_233d4   '@23384 DS:2610
    L_BP106! = 0.0   '@233bb DS:2614
    GOTO L_2347b   '@233cc
L_233d4:
    L_BP8c!(RT_CINT%(FX##(L_BP8c!(0)))) = V_154a#   '@233d4
    L_BP9e!(RT_CINT%(FX##(L_BP8c!(0)))) = V_1552#   '@2340b
    L_BP8c!(0) = FX##(L_BP8c!(0)) + 1.0   '@23442 DS:2618
L_2347b:
    L_BP1b8! = FX##(L_BP1c!(0)) - 1.0   '@2347b DS:2792
    FOR V_0f14! = 1.0 TO L_BP1b8!   '@234a0 DS:2618
    V_155a# = L_BP1c!(RT_CINT%(FX##(V_0f14!)))   '@234a8
    V_1562# = L_BP2e!(RT_CINT%(FX##(V_0f14!)))   '@234cf
    V_1572# = FX##(V_0f14!) + 1.0   '@234f6 DS:2618
    IF NOT (FX##(L_BP1c!(0)) = FX##(V_1572#)) THEN GOTO L_23546   '@2350c
    V_1572# = 1.0#   '@23535 DS:27a2
L_23546:
    V_156a# = L_BP1c!(RT_CINT%(FX##(V_1572#)))   '@23546
    V_1572# = L_BP2e!(RT_CINT%(FX##(V_1572#)))   '@2356d
    CALL S_11c49   '@23594
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ <> "NAO") THEN GOTO L_2365c   '@2359e DS:27aa
    L_BP8c!(RT_CINT%(FX##(L_BP8c!(0)))) = V_0ef4#   '@235b5
    L_BP9e!(RT_CINT%(FX##(L_BP8c!(0)))) = V_0efc#   '@235ec
    L_BP8c!(0) = FX##(L_BP8c!(0)) + 1.0   '@23623 DS:2618
L_2365c:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2365c DS:2618
    L_BP8c!(0) = FX##(L_BP8c!(0)) - 1.0   '@23688 DS:2792
    IF NOT (L_BP8c!(0) < 2.0) THEN GOTO L_236ee   '@236bc DS:2610
    GOTO L_23f76   '@236e6
L_236ee:
    IF NOT (FX##(L_BP8c!(0)) > FX##(L_BP102!) + L_BP106!) THEN GOTO L_239d3   '@236ee
    L_BP140! = 1.0   '@2371d DS:2618
L_23734:
    V_0f14! = FX##(L_BP140!) + 1.0   '@23734 DS:2618
L_23750:
    IF NOT (ABS(FX##(L_BP9e!(RT_CINT%(FX##(L_BP140!)))) - L_BP9e!(RT_CINT%(FX##(V_0f14!)))) < FX##(V_133a!) AND ABS(FX##(L_BP8c!(RT_CINT%(FX##(L_BP140!)))) - L_BP8c!(RT_CINT%(FX##(V_0f14!)))) < FX##(V_133a!)) THEN GOTO L_23949   '@23750
    IF NOT (L_BP8c!(0) > V_0f14!) THEN GOTO L_2390d   '@237fc
    L_BP1c0# = FX##(L_BP8c!(0)) - 1.0   '@23826 DS:2792
    FOR V_0ef4# = V_0f14! TO L_BP1c0#   '@2384c DS:27a2
    L_BP8c!(RT_CINT%(FX##(V_0ef4#))) = L_BP8c!(RT_CINT%(FX##(V_0ef4#) + 1.0#))   '@23854 DS:27a2
    L_BP9e!(RT_CINT%(FX##(V_0ef4#))) = L_BP9e!(RT_CINT%(FX##(V_0ef4#) + 1.0#))   '@23898 DS:27a2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@238dc DS:27a2
L_2390d:
    L_BP8c!(0) = FX##(L_BP8c!(0)) - 1.0   '@2390d DS:2792
    GOTO L_23964   '@23941
L_23949:
    V_0f14! = FX##(V_0f14!) + 1.0   '@23949 DS:2618
L_23964:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP8c!(0) < V_0f14!) THEN GOTO L_23750   '@23964
    L_BP140! = FX##(L_BP140!) + 1.0   '@2398e DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP8c!(0) <= L_BP140!) THEN GOTO L_23734   '@239a4
L_239d3:
    IF NOT (L_BP8c!(0) >= 2.0) THEN GOTO L_23f71   '@239d3 DS:2610
    IF NOT (L_BP8c!(1) = L_BP8c!(2)) THEN GOTO L_23bb8   '@239fd
    L_BP1c4! = FX##(L_BP8c!(0)) - 1.0   '@23a32 DS:2792
    FOR L_BP140! = 1.0 TO L_BP1c4!   '@23a58 DS:2618
    L_BP1c8! = L_BP8c!(0)   '@23a60
    FOR V_0ef0! = FX##(L_BP140!) + 1.0 TO L_BP1c8!   '@23a81 DS:2618
    IF NOT (L_BP9e!(RT_CINT%(FX##(L_BP140!))) > L_BP9e!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_23b58   '@23a8e
    SWAP L_BP8c!(RT_CINT%(FX##(L_BP140!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@23ad7
    SWAP L_BP9e!(RT_CINT%(FX##(L_BP140!))), L_BP9e!(RT_CINT%(FX##(V_0ef0!)))   '@23b15
L_23b58:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@23b58 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@23b84 DS:2618
    GOTO L_23d3b   '@23bb0
L_23bb8:
    L_BP1cc! = FX##(L_BP8c!(0)) - 1.0   '@23bb8 DS:2792
    FOR L_BP140! = 1.0 TO L_BP1cc!   '@23bde DS:2618
    L_BP1d0! = L_BP8c!(0)   '@23be6
    FOR V_0ef0! = FX##(L_BP140!) + 1.0 TO L_BP1d0!   '@23c07 DS:2618
    IF NOT (L_BP8c!(RT_CINT%(FX##(L_BP140!))) > L_BP8c!(RT_CINT%(FX##(V_0ef0!)))) THEN GOTO L_23cde   '@23c14
    SWAP L_BP8c!(RT_CINT%(FX##(L_BP140!))), L_BP8c!(RT_CINT%(FX##(V_0ef0!)))   '@23c5d
    SWAP L_BP9e!(RT_CINT%(FX##(L_BP140!))), L_BP9e!(RT_CINT%(FX##(V_0ef0!)))   '@23c9b
L_23cde:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@23cde DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@23d0a DS:2618
L_23d3b:
    V_0f14! = 1.0   '@23d3b DS:2618
L_23d51:
    IF NOT (FX##(V_0f14!) + 1.0 > FX##(L_BP8c!(0))) THEN GOTO L_23d8d   '@23d56 DS:2618
    GOTO L_23f76   '@23d85
L_23d8d:
    V_153a# = L_BP8c!(RT_CINT%(FX##(V_0f14!)))   '@23d8d
    V_1542# = L_BP9e!(RT_CINT%(FX##(V_0f14!)))   '@23db5
    V_154a# = L_BP8c!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@23ddd DS:2618
    V_1552# = L_BP9e!(RT_CINT%(FX##(V_0f14!) + 1.0))   '@23e0a DS:2618
    L_BP1d4! = 1.0   '@23e37 DS:2618
    GOSUB L_245f5   '@23e48
    IF NOT (L_BPd2! <> -1.0) THEN GOTO L_23e81   '@23e55 DS:2792
    L_BP1d4! = L_BPd2!   '@23e70
L_23e81:
    L_BP10e! = RT_SQR##(RT_POT##((FX##(L_BP8c!(RT_CINT%(FX##(V_0f14!)))) - L_BP8c!(RT_CINT%(FX##(V_0f14!) + 1.0))), (2.0)) + RT_POT##((FX##(L_BP9e!(RT_CINT%(FX##(V_0f14!)))) - L_BP9e!(RT_CINT%(FX##(V_0f14!) + 1.0))), (2.0))) * A_0fe6!(RT_CINT%(FX##(V_0f04!)), 4) * L_BP1d4! + L_BP10e!   '@23e81 DS:2610,2618
    V_0f14! = FX##(V_0f14!) + 1.0   '@23f4e DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_23d51   '@23f64
L_23f71:
L_23f76:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@23f7b DS:2618
    V_19e2! = FX##(L_BP10e!) + V_19e2!   '@23fa7
    RETURN   '@23fbd
L_23fcc:   ' sub-rotina (alvo de GOSUB)
    L_BP1b4! = 0.0   '@23fd1 DS:2614
    L_BP1d8! = FX##(L_BP1c!(0)) - 1.0   '@23fe2 DS:2792
    FOR L_BP140! = 1.0 TO L_BP1d8!   '@24007 DS:2618
    L_BPa2! = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@2400e
    L_BPa6! = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@24035
    L_BPae! = FX##(L_BP140!) + 1.0   '@2405c DS:2618
    IF NOT (L_BP1c!(0) = L_BPae!) THEN GOTO L_240ac   '@24072
    L_BPae! = 1.0   '@2409b DS:2618
L_240ac:
    L_BPaa! = L_BP1c!(RT_CINT%(FX##(L_BPae!)))   '@240ac
    L_BPae! = L_BP2e!(RT_CINT%(FX##(L_BPae!)))   '@240d3
    IF NOT (ABS(FX##(V_0efc#) - L_BPae!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPaa!) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BPa6!) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BPa2!) < FX##(V_133a!)) THEN GOTO L_241b8   '@240fa
    L_BP1b4! = L_BP1b0!   '@2419a
    GOTO L_245e6   '@241ab
L_241b8:
    CALL MIXT_0877_Menor(L_BPa2!, L_BPaa!, L_BP1dc!)   '@241b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP1dc!) > FX##(V_133a!) + V_0ef4#) THEN GOTO L_241f4   '@241d2
    GOTO L_245b5   '@241ec
L_241f4:
    IF NOT (ABS(FX##(V_0efc#) - L_BPa6!) < FX##(V_133a!) AND ABS(FX##(L_BPa6!) - L_BPae!) < FX##(V_133a!)) THEN GOTO L_242db   '@241f4
    CALL MIXT_0877_Menor(L_BPa2!, L_BPaa!, L_BP1e0!)   '@24245
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPa2!, L_BPaa!, L_BP1e4!)   '@2425e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(V_0ef4#) - V_133a! <= FX##(L_BP1e4!) AND FX##(V_133a!) + V_0ef4# >= FX##(L_BP1e0!)) THEN GOTO L_242d6   '@24273
    L_BP1b4! = L_BP1b0!   '@242b8
    GOTO L_245e6   '@242c9
L_242d6:
L_242db:
    CALL MIXT_0877_Menor(L_BPa6!, L_BPae!, L_BP1e8!)   '@242db
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPa6!, L_BPae!, L_BP1ec!)   '@242f4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BPa6!) <> FX##(V_0efc#) AND L_BPa6! = L_BPae! OR (FX##(L_BP1ec!) <= FX##(V_0efc#) OR FX##(L_BP1e8!) > FX##(V_0efc#))) THEN GOTO L_2437f   '@24309
    GOTO L_245b5   '@24377
L_2437f:
    CALL MIXT_082a_Maior(L_BPa6!, L_BPae!, L_BP1f0!)   '@2437f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BPa6!, L_BPae!, L_BP1f4!)   '@24398
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPa2!, L_BPaa!, L_BP1f8!)   '@243ac
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (FX##(L_BP1f8!) <= FX##(V_0ef4#) AND (FX##(L_BP1f4!) <= FX##(V_0efc#) AND FX##(L_BP1f0!) >= FX##(V_0efc#))) THEN GOTO L_244ba   '@243c1
    L_BP1b4! = FX##(L_BP1b4!) + 1.0   '@24414 DS:2618
    CALL MIXT_082a_Maior(L_BPa2!, L_BPaa!, L_BP1fc!)   '@2442a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(V_0ef4#) - L_BP1fc!) < FX##(V_133a!) AND ABS(FX##(L_BPa2!) - L_BPaa!) < FX##(V_133a!)) THEN GOTO L_244ad   '@24444
    L_BP1b4! = L_BP1b0!   '@2448f
    GOTO L_245e6   '@244a0
L_244ad:
    GOTO L_245b5   '@244ad
L_244ba:
    IF NOT (L_BPa6! = L_BPae!) THEN GOTO L_244dd   '@244ba
    GOTO L_245b5   '@244d5
L_244dd:
    IF NOT (FX##(V_133a!) + V_0ef4# >= L_BPa2! + (FX##(V_0efc#) - L_BPa6!) * (FX##(L_BPaa!) - L_BPa2!) / (FX##(L_BPae!) - L_BPa6!)) THEN GOTO L_245b0   '@244dd
    L_BP1b4! = FX##(L_BP1b4!) + 1.0   '@24527 DS:2618
    IF NOT (ABS(V_0ef4# - (L_BPa2! + (FX##(V_0efc#) - L_BPa6!) * (FX##(L_BPaa!) - L_BPa2!) / (FX##(L_BPae!) - L_BPa6!))) < FX##(V_133a!)) THEN GOTO L_245ab   '@2453d
    L_BP1b4! = L_BP1b0!   '@2458d
    GOTO L_245e6   '@2459e
L_245ab:
L_245b0:
L_245b5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@245ba DS:2618
L_245e6:
    RETURN   '@245e6
L_245f5:   ' sub-rotina (alvo de GOSUB)
    L_BPd2! = -1.0   '@245fa DS:2792
    IF NOT (L_BP11a% = 1) THEN GOTO L_24624   '@2460b
    RETURN   '@2461a
L_24624:
    L_BP200! = A_109e%(RT_CINT%(FX##(L_BP120!)), 0) - 1   '@24624
    FOR L_BP140! = 1.0 TO L_BP200!   '@24654 DS:2618
    L_BP128! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP140!))), 0)   '@2465c
    L_BP12c! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP140!))), 1)   '@246a0
    L_BP134! = FX##(L_BP140!) + 1.0   '@246e5 DS:2618
    IF NOT (A_109e%(RT_CINT%(FX##(L_BP120!)), 0) = L_BP134!) THEN GOTO L_24744   '@246fb
    L_BP134! = 1.0   '@24733 DS:2618
L_24744:
    L_BP130! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP134!))), 0)   '@24744
    L_BP134! = A_1070!(A_109e%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP134!))), 1)   '@24788
    L_BP11c% = 1   '@247cd
    GOSUB L_249e8   '@247d8
    IF NOT (L_BPd2! <> -1.0) THEN GOTO L_24808   '@247e5 DS:2792
    GOTO L_24834   '@24800
L_24808:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@24808 DS:2618
L_24834:
    IF NOT (L_BPd2! <> -1.0) THEN GOTO L_24859   '@24834 DS:2792
    RETURN   '@2484f
L_24859:
    L_BP204! = FX##(L_BP1c!(0)) - 1.0   '@24859 DS:2792
    FOR L_BP140! = 1.0 TO L_BP204!   '@2487e DS:2618
    L_BP128! = L_BP1c!(RT_CINT%(FX##(L_BP140!)))   '@24886
    L_BP12c! = L_BP2e!(RT_CINT%(FX##(L_BP140!)))   '@248ad
    L_BP134! = FX##(L_BP140!) + 1.0   '@248d4 DS:2618
    IF NOT (L_BP1c!(0) = L_BP134!) THEN GOTO L_24924   '@248ea
    L_BP134! = 1.0   '@24913 DS:2618
L_24924:
    L_BP130! = L_BP1c!(RT_CINT%(FX##(L_BP134!)))   '@24924
    L_BP134! = L_BP2e!(RT_CINT%(FX##(L_BP134!)))   '@2494b
    L_BP11c% = 2   '@24972
    GOSUB L_249e8   '@2497d
    IF NOT (L_BPd2! <> -1.0) THEN GOTO L_249ad   '@2498a DS:2792
    GOTO L_249d9   '@249a5
L_249ad:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@249ad DS:2618
L_249d9:
    RETURN   '@249d9
L_249e8:   ' sub-rotina (alvo de GOSUB)
    CALL MIXT_082a_Maior(L_BP128!, L_BP130!, L_BP208!)   '@249ed
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP20c! = FX##(V_153a#) / 1.0#   '@24a07 DS:27a2
    L_BP210! = FX##(V_154a#) / 1.0#   '@24a18 DS:27a2
    CALL MIXT_0877_Menor(L_BP20c!, L_BP210!, L_BP214!)   '@24a28
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP128!, L_BP130!, L_BP218!)   '@24a3c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP21c! = FX##(V_153a#) / 1.0#   '@24a51 DS:27a2
    L_BP220! = FX##(V_154a#) / 1.0#   '@24a62 DS:27a2
    CALL MIXT_082a_Maior(L_BP21c!, L_BP220!, L_BP224!)   '@24a72
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP218! > L_BP224! OR L_BP208! < L_BP214!) THEN GOTO L_24ac9   '@24a87
    RETURN   '@24abf
L_24ac9:
    CALL MIXT_082a_Maior(L_BP12c!, L_BP134!, L_BP228!)   '@24ac9
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP22c! = FX##(V_1542#) / 1.0#   '@24ae3 DS:27a2
    L_BP230! = FX##(V_1552#) / 1.0#   '@24af4 DS:27a2
    CALL MIXT_0877_Menor(L_BP22c!, L_BP230!, L_BP234!)   '@24b04
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP12c!, L_BP134!, L_BP238!)   '@24b18
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP23c! = FX##(V_1542#) / 1.0#   '@24b2d DS:27a2
    L_BP240! = FX##(V_1552#) / 1.0#   '@24b3e DS:27a2
    CALL MIXT_082a_Maior(L_BP23c!, L_BP240!, L_BP244!)   '@24b4e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP238! > L_BP244! OR L_BP228! < L_BP234!) THEN GOTO L_24ba5   '@24b63
    RETURN   '@24b9b
L_24ba5:
    IF NOT (L_BP128! = L_BP130!) THEN GOTO L_24de3   '@24ba5
    IF NOT (V_153a# <> V_154a#) THEN GOTO L_24be5   '@24bc0
    RETURN   '@24bdb
L_24be5:
    CALL MIXT_082a_Maior(L_BP12c!, L_BP134!, L_BP248!)   '@24be5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP24c! = FX##(V_1542#) / 1.0#   '@24bff DS:27a2
    L_BP250! = FX##(V_1552#) / 1.0#   '@24c10 DS:27a2
    CALL MIXT_0877_Menor(L_BP24c!, L_BP250!, L_BP254!)   '@24c20
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP12c!, L_BP134!, L_BP258!)   '@24c34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP25c! = FX##(V_1542#) / 1.0#   '@24c49 DS:27a2
    L_BP260! = FX##(V_1552#) / 1.0#   '@24c5a DS:27a2
    CALL MIXT_082a_Maior(L_BP25c!, L_BP260!, L_BP264!)   '@24c6a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP258! = L_BP264! OR L_BP248! = L_BP254!) THEN GOTO L_24cc1   '@24c7f
    RETURN   '@24cb7
L_24cc1:
L_24cc6:
    IF NOT (L_BP11c% = 1) THEN GOTO L_24dbb   '@24ccb
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_24d28   '@24cda DS:2618
    L_BPd2! = 0.0   '@24d0f DS:2614
    GOTO L_24db3   '@24d20
L_24d28:
    IF NOT (A_10fa%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP140!))) <> 1) THEN GOTO L_24d6b   '@24d28
    L_BPd2! = 0.0   '@24d5a DS:2614
L_24d6b:
    IF NOT (A_10fa%(RT_CINT%(FX##(L_BP120!)), RT_CINT%(FX##(L_BP140!))) = 1) THEN GOTO L_24dae   '@24d6b
    L_BPd2! = 1.0   '@24d9d DS:2618
L_24dae:
L_24db3:
    GOTO L_24dd1   '@24db3
L_24dbb:
    L_BPd2! = 0.5   '@24dbb DS:27b2
L_24dd1:
    RETURN   '@24dd1
    ' @24ddb (trecho de 8 bytes sem caminho de entrada conhecido: codigo morto ou alcancado por meio nao rastreado; traduzido abaixo)
    GOTO L_25032   '@24ddb
L_24de3:
    IF NOT (V_153a# = V_154a#) THEN GOTO L_24e08   '@24de3
    RETURN   '@24dfe
L_24e08:
    CALL MIXT_082a_Maior(L_BP128!, L_BP130!, L_BP268!)   '@24e08
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP26c! = FX##(V_153a#) / 1.0#   '@24e22 DS:27a2
    L_BP270! = FX##(V_154a#) / 1.0#   '@24e33 DS:27a2
    CALL MIXT_0877_Menor(L_BP26c!, L_BP270!, L_BP274!)   '@24e43
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP128!, L_BP130!, L_BP278!)   '@24e57
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP27c! = FX##(V_153a#) / 1.0#   '@24e6c DS:27a2
    L_BP280! = FX##(V_154a#) / 1.0#   '@24e7d DS:27a2
    CALL MIXT_082a_Maior(L_BP27c!, L_BP280!, L_BP284!)   '@24e8d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP278! = L_BP284! OR L_BP268! = L_BP274!) THEN GOTO L_24ee4   '@24ea2
    RETURN   '@24eda
L_24ee4:
    IF NOT (ABS((FX##(V_1552#) - V_1542#) / (FX##(V_154a#) - V_153a#) - (FX##(L_BP134!) - L_BP12c!) / (FX##(L_BP130!) - L_BP128!)) > FX##(V_133a!)) THEN GOTO L_24f38   '@24ee4
    RETURN   '@24f2e
L_24f38:
    IF NOT (FX##(L_BP128!) <> FX##(V_154a#) AND FX##(L_BP128!) <> FX##(V_153a#)) THEN GOTO L_24fd8   '@24f38
    IF NOT (ABS((FX##(V_1552#) - L_BP12c!) / (FX##(V_154a#) - L_BP128!) - (FX##(L_BP12c!) - V_1542#) / (FX##(L_BP128!) - V_153a#)) > FX##(V_133a!)) THEN GOTO L_24fd0   '@24f76
    RETURN   '@24fc6
L_24fd0:
    GOTO L_25025   '@24fd0
L_24fd8:
    IF NOT (FX##(L_BP12c!) <> FX##(V_1552#) AND FX##(L_BP12c!) <> FX##(V_1542#)) THEN GOTO L_25020   '@24fd8
    RETURN   '@25016
L_25020:
L_25025:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_24cc6   '@25025
L_25032:
    RETURN   '@25032
L_25041:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    L_BP112! = 0.0   '@25046 DS:2614
    L_BP116! = 0.0   '@25057 DS:2614
    IF NOT (A_1014!(0, 1) = 0.0) THEN GOTO L_2509f   '@25068 DS:2614
    RETURN   '@25095
L_2509f:
    V_0f14! = 1.0   '@2509f DS:2618
    L_BP288! = A_1014!(0, 1)   '@250b0
    FOR V_0f04! = 1.0 TO L_BP288!   '@250d4 DS:2618
    ERASE L_BP40!   '@250dc
    ERASE L_BP52!   '@250ea
    REDIM L_BP40!(0 TO 50)   '@250f3
    REDIM L_BP52!(0 TO 50)   '@25110
    L_BP40!(0) = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + 1.0   '@25128 DS:2618
    L_BP28c! = A_1014!(RT_CINT%(FX##(V_0f14!)), 0)   '@25165
    FOR L_BP140! = 1.0 TO L_BP28c!   '@25190 DS:2618
    L_BP40!(RT_CINT%(FX##(L_BP140!))) = A_1014!(RT_CINT%(FX##(L_BP140!) + V_0f14! + 1.0), 0)   '@25198 DS:2618
    L_BP52!(RT_CINT%(FX##(L_BP140!))) = A_1014!(RT_CINT%(FX##(L_BP140!) + V_0f14! + 1.0), 1)   '@251e2 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@2522d DS:2618
    L_BP40!(RT_CINT%(FX##(L_BP140!))) = L_BP40!(1)   '@25259
    L_BP52!(RT_CINT%(FX##(L_BP140!))) = L_BP52!(1)   '@2528c
    L_BPda! = 0.0   '@252bf DS:2614
    L_BP290! = FX##(L_BP40!(0)) - 1.0   '@252d0 DS:2792
    FOR L_BP140! = 1.0 TO L_BP290!   '@252f5 DS:2618
    L_BPda! = (FX##(L_BP40!(RT_CINT%(FX##(L_BP140!)))) + L_BP40!(RT_CINT%(FX##(L_BP140!) + 1.0))) * (FX##(L_BP52!(RT_CINT%(FX##(L_BP140!)))) - L_BP52!(RT_CINT%(FX##(L_BP140!) + 1.0))) / 2.0 + L_BPda!   '@252fc DS:2610,2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@2538b DS:2618
    L_BPda! = ABS(FX##(L_BPda!))   '@253b7
    GOSUB L_2551f   '@253cb
    IF NOT (ABS(FX##(L_BP294!)) > FX##(0.0)) THEN GOTO L_254b0   '@253d8 DS:2614
    L_BP112! = ABS(FX##(L_BP294!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) + L_BP112!   '@253f6 DS:2618
    L_BP116! = ABS(FX##(L_BP294!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 1) + L_BP116!   '@25432 DS:2618
    V_19e6! = ABS(FX##(L_BP294!)) * A_1014!(RT_CINT%(FX##(V_0f14!) + 1.0), 0) + V_19e6!   '@2546f DS:2618
L_254b0:
    V_0f14! = FX##(A_1014!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0f14! + 2.0   '@254b0 DS:2610
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@254e4 DS:2618
    RETURN   '@25510
L_2551f:   ' sub-rotina (alvo de GOSUB)
    L_BPc2! = FX##(L_BP40!(1)) + V_133a!   '@25524
    L_BPc6! = FX##(L_BP52!(1)) + V_133a!   '@25546
    L_BPca! = FX##(L_BP40!(1)) - V_133a!   '@25568
    L_BPce! = FX##(L_BP52!(1)) - V_133a!   '@2558a
    L_BP298! = FX##(L_BP40!(0)) - 1.0   '@255ac DS:2792
    FOR L_BP140! = 2.0 TO L_BP298!   '@255d1 DS:2610,2618
    L_BP29c! = FX##(L_BPc2!) + V_133a!   '@255d8
    L_BP2a0! = L_BP40!(RT_CINT%(FX##(L_BP140!)))   '@255ef
    CALL MIXT_0877_Menor(L_BP29c!, L_BP2a0!, L_BP2a4!)   '@25610
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(RT_CINT%(FX##(L_BP140!))) = L_BP2a0!   '@25625
    L_BPc2! = L_BP2a4!   '@25647
    L_BP2a8! = FX##(L_BPc6!) + V_133a!   '@25652
    L_BP2ac! = L_BP52!(RT_CINT%(FX##(L_BP140!)))   '@25669
    CALL MIXT_0877_Menor(L_BP2a8!, L_BP2ac!, L_BP2b0!)   '@2568a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52!(RT_CINT%(FX##(L_BP140!))) = L_BP2ac!   '@2569f
    L_BPc6! = L_BP2b0!   '@256c1
    L_BP2b4! = FX##(L_BPca!) - V_133a!   '@256cc
    L_BP2b8! = L_BP40!(RT_CINT%(FX##(L_BP140!)))   '@256e3
    CALL MIXT_082a_Maior(L_BP2b4!, L_BP2b8!, L_BP2bc!)   '@25704
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(RT_CINT%(FX##(L_BP140!))) = L_BP2b8!   '@25719
    L_BPca! = L_BP2bc!   '@2573b
    L_BP2c0! = FX##(L_BPce!) - V_133a!   '@25746
    L_BP2c4! = L_BP52!(RT_CINT%(FX##(L_BP140!)))   '@2575d
    CALL MIXT_082a_Maior(L_BP2c0!, L_BP2c4!, L_BP2c8!)   '@2577e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP52!(RT_CINT%(FX##(L_BP140!))) = L_BP2c4!   '@25793
    L_BPce! = L_BP2c8!   '@257b5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP140!   '@257c0 DS:2618
    L_BP294! = 0.0   '@257ec DS:2614
    IF NOT (L_BPca! <= L_BPb2! OR (L_BPc2! >= L_BPba! OR (L_BPce! <= L_BPb6! OR L_BPc6! >= L_BPbe!))) THEN GOTO L_2587b   '@257fd
    RETURN   '@25871
L_2587b:
    ERASE L_BP64%   '@2587b
    REDIM L_BP64%(0 TO 50)   '@25889
    L_BP1b0! = 1.0   '@258a6 DS:2618
    L_BP2cc! = FX##(L_BP40!(0)) - 1.0   '@258b7 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP2cc!   '@258dc DS:2618
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@258e4
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@2590b
    GOSUB L_23fcc   '@25932
    IF NOT (FX##(L_BP1b4!) / 2.0 <> RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_25995   '@2593f DS:2610
    L_BP64%(RT_CINT%(FX##(V_0ef0!))) = 1   '@25976
L_25995:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@25995 DS:2618
    ERASE L_BP7a!   '@259c1
    REDIM L_BP7a!(0 TO 1, 0 TO 1)   '@259cf
    L_BP2d0! = FX##(L_BP1c!(0)) - 1.0   '@259f3 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP2d0!   '@25a18 DS:2618
    V_153a# = L_BP1c!(RT_CINT%(FX##(V_0ef0!)))   '@25a20
    V_1542# = L_BP2e!(RT_CINT%(FX##(V_0ef0!)))   '@25a47
    V_154a# = L_BP1c!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@25a6e DS:2618
    V_1552# = L_BP2e!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@25a9a DS:2618
    L_BP2d4! = FX##(L_BP40!(0)) - 1.0   '@25ac6 DS:2792
    FOR L_BP2d8! = 1.0 TO L_BP2d4!   '@25aeb DS:2618
    V_155a# = L_BP40!(RT_CINT%(FX##(L_BP2d8!)))   '@25af2
    V_1562# = L_BP52!(RT_CINT%(FX##(L_BP2d8!)))   '@25b19
    V_156a# = L_BP40!(RT_CINT%(FX##(L_BP2d8!) + 1.0))   '@25b40 DS:2618
    V_1572# = L_BP52!(RT_CINT%(FX##(L_BP2d8!) + 1.0))   '@25b6c DS:2618
    CALL S_11c49   '@25b98
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_154a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_25c48   '@25ba2
    V_0f1c$ = "NAO"   '@25c36 DS:27aa
L_25c48:
    IF NOT (ABS(FX##(V_0efc#) - V_1572#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_156a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1562#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_155a#) < FX##(V_133a!)) THEN GOTO L_25cee   '@25c48
    V_0f1c$ = "NAO"   '@25cdc DS:27aa
L_25cee:
    IF NOT (V_0f1c$ = "") THEN GOTO L_25dc6   '@25cee DS:261c
    L_BP128! = V_155a#   '@25d05
    L_BP12c! = V_1562#   '@25d16
    L_BP130! = V_156a#   '@25d27
    L_BP134! = V_1572#   '@25d38
    L_BP11c% = 2   '@25d49
    L_BPd2! = 1.0   '@25d54 DS:2618
    GOSUB L_249e8   '@25d65
    IF NOT (L_BPd2! = 1.0) THEN GOTO L_25dc1   '@25d72 DS:2618
    L_BP7a!(0, 0) = FX##(L_BP7a!(0, 0)) + 1.0   '@25d8d DS:2618
L_25dc1:
L_25dc6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP2d8!   '@25dc6 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@25df2 DS:2618
    L_BP2dc! = FX##(L_BP40!(0)) - 1.0   '@25e1e DS:2792
    FOR V_0ef0! = 1.0 TO L_BP2dc!   '@25e43 DS:2618
    L_BP7a!(0, 1) = FX##(L_BP64%(RT_CINT%(FX##(V_0ef0!)))) + L_BP7a!(0, 1)   '@25e4a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@25e9e DS:2618
    IF NOT (L_BP7a!(0, 0) = 0.0 AND FX##(L_BP7a!(0, 1)) = FX##(L_BP40!(0)) - 1.0) THEN GOTO L_25f5b   '@25ec7 DS:2614,2792
    L_BP294! = L_BPda!   '@25f3b
    RETURN   '@25f4c
L_25f5b:
    IF NOT (L_BP7a!(0, 0) = 0.0) THEN GOTO L_2639b   '@25f5b DS:2614
    L_BP2e0! = L_BP1c!(0)   '@25f85
    L_BP2e4! = L_BP40!(0)   '@25fa4
    CALL MIXT_082a_Maior(L_BP2e0!, L_BP2e4!, L_BP2e8!)   '@25fbe
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(0) = L_BP2e4!   '@25fd3
    L_BP1c!(0) = L_BP2e0!   '@25fed
    L_BP2ec! = L_BP2e8!   '@26007
    FOR V_0ef0! = 0.0 TO L_BP2ec!   '@26013 DS:2614,2618
    SWAP L_BP1c!(RT_CINT%(FX##(V_0ef0!))), L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@2601a
    SWAP L_BP2e!(RT_CINT%(FX##(V_0ef0!))), L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@26056
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@26092 DS:2618
    ERASE L_BP64%   '@260be
    REDIM L_BP64%(0 TO 1)   '@260cc
    L_BP1b0! = 1.0   '@260e9 DS:2618
    L_BP2f0! = FX##(L_BP40!(0)) - 1.0   '@260fa DS:2792
    FOR V_0ef0! = 1.0 TO L_BP2f0!   '@2611f DS:2618
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@26126
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@2614d
    GOSUB L_23fcc   '@26174
    IF NOT (FX##(L_BP1b4!) / 2.0 <> RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_261db   '@26181 DS:2610
    L_BP64%(1) = L_BP64%(1) + 1   '@261b8
L_261db:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@261db DS:2618
    IF NOT (L_BP64%(1) = FX##(L_BP40!(0)) - 1.0) THEN GOTO L_26253   '@26207 DS:2792
    L_BP294! = L_BPd6!   '@26242
L_26253:
    L_BP2f4! = L_BP1c!(0)   '@26253
    L_BP2f8! = L_BP40!(0)   '@26272
    CALL MIXT_082a_Maior(L_BP2f4!, L_BP2f8!, L_BP2fc!)   '@2628c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(0) = L_BP2f8!   '@262a1
    L_BP1c!(0) = L_BP2f4!   '@262bb
    L_BP300! = L_BP2fc!   '@262d5
    FOR V_0ef0! = 0.0 TO L_BP300!   '@262e1 DS:2614,2618
    SWAP L_BP1c!(RT_CINT%(FX##(V_0ef0!))), L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@262e8
    SWAP L_BP2e!(RT_CINT%(FX##(V_0ef0!))), L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@26324
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@26360 DS:2618
    RETURN   '@2638c
L_2639b:
    ERASE L_BP7a!   '@2639b
    REDIM L_BP7a!(0 TO 50, 0 TO 3)   '@263a9
    L_BP7a!(0, 0) = FX##(L_BP1c!(0)) - 1.0   '@263cd DS:2792
    L_BP304! = FX##(L_BP1c!(0)) - 1.0   '@26400 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP304!   '@26425 DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0) = L_BP1c!(RT_CINT%(FX##(V_0ef0!)))   '@2642c
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1) = L_BP2e!(RT_CINT%(FX##(V_0ef0!)))   '@2646c
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2) = L_BP1c!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@264ad DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3) = L_BP2e!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@264f0 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@26536 DS:2618
    L_BP7a!(0, 0) = FX##(L_BP40!(0)) - 1.0 + L_BP7a!(0, 0)   '@26562 DS:2792
    L_BP308! = FX##(L_BP40!(0)) - 1.0   '@265a9 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP308!   '@265ce DS:2618
    L_BP7a!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0 + V_0ef0!), 0) = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@265d6 DS:2792
    L_BP7a!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0 + V_0ef0!), 1) = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@2662e DS:2792
    L_BP7a!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0 + V_0ef0!), 2) = L_BP40!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@26687 DS:2618,2792
    L_BP7a!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0 + V_0ef0!), 3) = L_BP52!(RT_CINT%(FX##(V_0ef0!) + 1.0))   '@266e2 DS:2618,2792
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@26740 DS:2618
    V_0ef0! = 1.0   '@2676c DS:2618
L_26782:
    V_153a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)   '@26782
    V_1542# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)   '@267ac
    V_154a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)   '@267d7
    V_1552# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)   '@267ff
    L_BP2d8! = FX##(V_0ef0!) + 1.0   '@2682a DS:2618
L_26846:
    V_155a# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)   '@26846
    V_1562# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)   '@26870
    V_156a# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)   '@2689b
    V_1572# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)   '@268c3
    CALL S_11c49   '@268ee
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_154a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_26a37   '@268f8
    IF NOT (ABS(FX##(V_0efc#) - V_1572#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_156a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1562#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_155a#) < FX##(V_133a!)) THEN GOTO L_26a32   '@2698c
    V_0f1c$ = "NAO"   '@26a20 DS:27aa
L_26a32:
L_26a37:
    IF NOT (V_0f1c$ = "") THEN GOTO L_26f6c   '@26a37 DS:261c
    L_BP128! = V_155a#   '@26a4e
    L_BP12c! = V_1562#   '@26a5f
    L_BP130! = V_156a#   '@26a70
    L_BP134! = V_1572#   '@26a81
    L_BP11c% = 2   '@26a92
    L_BPd2! = 1.0   '@26a9d DS:2618
    GOSUB L_249e8   '@26aae
    IF NOT (L_BPd2! = 1.0) THEN GOTO L_26f67   '@26abb DS:2618
    IF NOT ((ABS(FX##(V_0efc#) - V_1552#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_154a#) > FX##(V_133a!)) AND (ABS(FX##(V_0efc#) - V_1542#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_153a#) > FX##(V_133a!))) THEN GOTO L_26d2d   '@26ad6
    L_BP7a!(0, 0) = FX##(L_BP7a!(0, 0)) + 1.0   '@26b6a DS:2618
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 0) = V_0ef4#   '@26b9e
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 1) = V_0efc#   '@26bd7
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 2) = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)   '@26c11
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 3) = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)   '@26c5f
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2) = V_0ef4#   '@26cb3
    L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3) = V_0efc#   '@26cdb
    V_154a# = V_0ef4#   '@26d06
    V_1552# = V_0efc#   '@26d17
L_26d2d:
    IF NOT ((ABS(FX##(V_0efc#) - V_1572#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_156a#) > FX##(V_133a!)) AND (ABS(FX##(V_0efc#) - V_1562#) > FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_155a#) > FX##(V_133a!))) THEN GOTO L_26f62   '@26d2d
    L_BP7a!(0, 0) = FX##(L_BP7a!(0, 0)) + 1.0   '@26dc1 DS:2618
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 0) = V_0ef4#   '@26df5
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 1) = V_0efc#   '@26e2e
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 2) = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)   '@26e68
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0))), 3) = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)   '@26eb6
    L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2) = V_0ef4#   '@26f0a
    L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3) = V_0efc#   '@26f32
L_26f62:
L_26f67:
L_26f6c:
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@26f6c DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP2d8!) THEN GOTO L_26846   '@26f82
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@26fac DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) <= V_0ef0!) THEN GOTO L_26782   '@26fc2
    ERASE L_BP64%   '@26fec
    REDIM L_BP64%(0 TO 50)   '@26ffa
    L_BP1b0! = 1.0   '@27017 DS:2618
    L_BP30c! = FX##(L_BP40!(0)) - 1.0   '@27028 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP30c!   '@2704d DS:2618
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@27054
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@2707b
    GOSUB L_23fcc   '@270a2
    IF NOT (FX##(L_BP1b4!) / 2.0 <> RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_27105   '@270af DS:2610
    L_BP64%(RT_CINT%(FX##(V_0ef0!))) = 1   '@270e6
L_27105:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@27105 DS:2618
    L_BP310! = FX##(L_BP40!(0)) - 1.0   '@27131 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP310!   '@27156 DS:2618
    IF NOT (L_BP64%(RT_CINT%(FX##(V_0ef0!))) = 0) THEN GOTO L_27353   '@2715e
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@27185
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@271ac
    L_BP2d8! = 1.0   '@271d3 DS:2618
L_271ea:
    IF NOT (ABS(FX##(V_0efc#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) < FX##(V_133a!)) THEN GOTO L_27309   '@271ea
    GOSUB L_29517   '@272f4
    GOTO L_27324   '@27301
L_27309:
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@27309 DS:2618
L_27324:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP2d8!) THEN GOTO L_271ea   '@27324
L_27353:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@27353 DS:2618
    L_BP314! = L_BP1c!(0)   '@2737f
    L_BP318! = L_BP40!(0)   '@2739e
    CALL MIXT_082a_Maior(L_BP314!, L_BP318!, L_BP31c!)   '@273b8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(0) = L_BP318!   '@273cd
    L_BP1c!(0) = L_BP314!   '@273e7
    L_BP320! = L_BP31c!   '@27401
    FOR V_0ef0! = 0.0 TO L_BP320!   '@2740d DS:2614,2618
    SWAP L_BP1c!(RT_CINT%(FX##(V_0ef0!))), L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@27414
    SWAP L_BP2e!(RT_CINT%(FX##(V_0ef0!))), L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@27450
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@2748c DS:2618
    ERASE L_BP64%   '@274b8
    REDIM L_BP64%(0 TO 50)   '@274c6
    L_BP1b0! = 1.0   '@274e3 DS:2618
    L_BP324! = FX##(L_BP40!(0)) - 1.0   '@274f4 DS:2792
    FOR V_0ef0! = 1.0 TO L_BP324!   '@27519 DS:2618
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@27520
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@27547
    GOSUB L_23fcc   '@2756e
    IF NOT (FX##(L_BP1b4!) / 2.0 <> RT_CLNG&(FX##(L_BP1b4!)) \ 2&) THEN GOTO L_275d1   '@2757b DS:2610
    L_BP64%(RT_CINT%(FX##(V_0ef0!))) = 1   '@275b2
L_275d1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@275d1 DS:2618
    L_BP328! = FX##(L_BP40!(0)) - 1.0   '@275fd DS:2792
    FOR V_0ef0! = 1.0 TO L_BP328!   '@27622 DS:2618
    IF NOT (L_BP64%(RT_CINT%(FX##(V_0ef0!))) = 0) THEN GOTO L_2781f   '@2762a
    V_0ef4# = L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@27651
    V_0efc# = L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@27678
    L_BP2d8! = 1.0   '@2769f DS:2618
L_276b6:
    IF NOT (ABS(FX##(V_0efc#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) < FX##(V_133a!)) THEN GOTO L_277d5   '@276b6
    GOSUB L_29517   '@277c0
    GOTO L_277f0   '@277cd
L_277d5:
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@277d5 DS:2618
L_277f0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP2d8!) THEN GOTO L_276b6   '@277f0
L_2781f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@2781f DS:2618
    L_BP32c! = L_BP1c!(0)   '@2784b
    L_BP330! = L_BP40!(0)   '@2786a
    CALL MIXT_082a_Maior(L_BP32c!, L_BP330!, L_BP334!)   '@27884
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP40!(0) = L_BP330!   '@27899
    L_BP1c!(0) = L_BP32c!   '@278b3
    L_BP338! = L_BP334!   '@278cd
    FOR V_0ef0! = 0.0 TO L_BP338!   '@278d9 DS:2614,2618
    SWAP L_BP1c!(RT_CINT%(FX##(V_0ef0!))), L_BP40!(RT_CINT%(FX##(V_0ef0!)))   '@278e0
    SWAP L_BP2e!(RT_CINT%(FX##(V_0ef0!))), L_BP52!(RT_CINT%(FX##(V_0ef0!)))   '@2791c
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@27958 DS:2618
    V_0ef0! = 1.0   '@27984 DS:2618
L_2799a:
    L_BP2d8! = FX##(V_0ef0!) + 1.0   '@2799a DS:2618
L_279b6:
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!) AND (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) < FX##(V_133a!)))) THEN GOTO L_27b20   '@279b6
    GOTO L_27c97   '@27b18
L_27b20:
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) < FX##(V_133a!) AND (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) < FX##(V_133a!) AND (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!)))) THEN GOTO L_27c8a   '@27b20
    GOTO L_27c97   '@27c82
L_27c8a:
    GOTO L_27cae   '@27c8a
L_27c97:
    GOSUB L_29517   '@27c9c
L_27cae:
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@27cb3 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP2d8!) THEN GOTO L_279b6   '@27cc9
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@27cf3 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) <= V_0ef0!) THEN GOTO L_2799a   '@27d09
    L_BP2d8! = 1.0   '@27d33 DS:2618
L_27d4a:
    L_BP102! = 0.0   '@27d4a DS:2614
    L_BP106! = 0.0   '@27d5b DS:2614
    V_0ef0! = 1.0   '@27d6c DS:2618
L_27d82:
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_27f01   '@27d82
    L_BP102! = FX##(L_BP102!) + 1.0   '@27ee6 DS:2618
L_27f01:
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_2807c   '@27f01
    L_BP106! = FX##(L_BP106!) + 1.0   '@28061 DS:2618
L_2807c:
    IF NOT (L_BP106! > 2.0 AND L_BP102! > 2.0) THEN GOTO L_280c2   '@2807c DS:2610
    GOTO L_28102   '@280ba
L_280c2:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@280c2 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < V_0ef0!) THEN GOTO L_27d82   '@280d8
L_28102:
    IF NOT (L_BP106! = 1.0 OR (L_BP102! = 1.0 OR L_BP106! > 2.0 AND L_BP102! > 2.0)) THEN GOTO L_28c55   '@28102 DS:2610,2618
    IF NOT ((ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) >= FX##(V_133a!) OR ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) >= FX##(V_133a!)) AND (L_BP106! > 2.0 AND L_BP102! > 2.0)) THEN GOTO L_28c40   '@28176 DS:2610
    L_BP140! = 1.0   '@28262 DS:2618
    V_155a# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)   '@28273
    V_1562# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)   '@2829d
    V_156a# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)   '@282c8
    V_1572# = L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)   '@282f0
L_28320:
    IF NOT (L_BP140! <> L_BP2d8!) THEN GOTO L_285b1   '@28320
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 0)) < FX##(V_133a!)) THEN GOTO L_285ac   '@2833b
    V_153a# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 0)   '@2849f
    V_1542# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 1)   '@284c9
    V_154a# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 2)   '@284f4
    V_1552# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 3)   '@2851c
    CALL S_11c49   '@28547
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_0efc#) - V_1562#) >= FX##(V_133a!) OR ABS(FX##(V_0ef4#) - V_155a#) >= FX##(V_133a!)) THEN GOTO L_285a7   '@28551
    GOTO L_285f2   '@2859f
L_285a7:
L_285ac:
L_285b1:
    L_BP140! = FX##(L_BP140!) + 1.0   '@285b1 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP140!) THEN GOTO L_28320   '@285c7
L_285f2:
    IF NOT (L_BP7a!(0, 0) < L_BP140!) THEN GOTO L_28c3b   '@285f2
    L_BP140! = 1.0   '@2861c DS:2618
L_28632:
    IF NOT (ABS(FX##(V_1562#) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_155a#) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_155a#) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 0)) < FX##(V_133a!) AND (ABS(FX##(V_1562#) - L_BP7a!(RT_CINT%(FX##(L_BP140!)), 1)) < FX##(V_133a!) AND L_BP140! <> L_BP2d8!)) THEN GOTO L_28bcb   '@28632
    V_153a# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 0)   '@28759
    V_1542# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 1)   '@28783
    IF NOT (ABS(FX##(V_1562#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_155a#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_28854   '@287ae
    V_153a# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 2)   '@287fc
    V_1542# = L_BP7a!(RT_CINT%(FX##(L_BP140!)), 3)   '@28824
L_28854:
    V_0ef0! = 1.0   '@28854 DS:2618
L_2886a:
    IF NOT (ABS(FX##(V_1572#) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(V_156a#) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!) OR ABS(FX##(V_156a#) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!) AND (ABS(FX##(V_1572#) - L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND (V_0ef0! <> L_BP2d8! AND V_0ef0! <> L_BP140!))) THEN GOTO L_28b85   '@2886a
    V_154a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)   '@289ac
    V_1552# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)   '@289d6
    IF NOT (ABS(FX##(V_1572#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_156a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_28aa7   '@28a01
    V_154a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)   '@28a4f
    V_1552# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)   '@28a77
L_28aa7:
    IF NOT (ABS(FX##(V_1542#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_153a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_28b80   '@28aa7
    L_BP2d8! = L_BP140!   '@28af5
    GOSUB L_29517   '@28b06
    IF NOT (V_0ef0! > L_BP140!) THEN GOTO L_28b44   '@28b13
    V_0ef0! = FX##(V_0ef0!) - 1.0   '@28b2e DS:2792
L_28b44:
    L_BP2d8! = V_0ef0!   '@28b44
    GOSUB L_29517   '@28b55
    L_BP2d8! = 0.0   '@28b62 DS:2614
    GOTO L_28bc6   '@28b73
L_28b80:
L_28b85:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@28b85 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < V_0ef0!) THEN GOTO L_2886a   '@28b9b
L_28bc6:
L_28bcb:
    IF NOT (L_BP2d8! = 0.0) THEN GOTO L_28bee   '@28bcb DS:2614
    GOTO L_28c2e   '@28be6
L_28bee:
    L_BP140! = FX##(L_BP140!) + 1.0   '@28bee DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP140!) THEN GOTO L_28632   '@28c04
L_28c2e:
    GOTO L_28c5a   '@28c2e
L_28c3b:
L_28c40:
    GOSUB L_29517   '@28c40
    GOTO L_28c7a   '@28c4d
L_28c55:
L_28c5a:
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@28c5f DS:2618
L_28c7a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (L_BP7a!(0, 0) < L_BP2d8!) THEN GOTO L_27d4a   '@28c7a
    L_BP2d8! = 1.0   '@28ca4 DS:2618
L_28cba:
    V_0ee8! = 0.0   '@28cbf DS:2614
    L_BP33c! = L_BP7a!(0, 0)   '@28cd0
    FOR V_0ef0! = FX##(L_BP2d8!) + 1.0 TO L_BP33c!   '@28cf1 DS:2618
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!)) THEN GOTO L_28dbf   '@28cfe
    GOTO L_28f0f   '@28db2
L_28dbf:
    IF NOT (ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 3)) < FX##(V_133a!) AND ABS(FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)) - L_BP7a!(RT_CINT%(FX##(L_BP2d8!)), 2)) < FX##(V_133a!)) THEN GOTO L_28f02   '@28dbf
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0), L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)   '@28e71
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1), L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)   '@28eb1
    GOTO L_28f0f   '@28ef5
L_28f02:
    GOTO L_29081   '@28f02
L_28f0f:
    IF NOT (FX##(L_BP2d8!) + 1.0 < FX##(V_0ef0!)) THEN GOTO L_29055   '@28f14 DS:2618
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0), L_BP7a!(RT_CINT%(FX##(L_BP2d8!) + 1.0), 0)   '@28f34 DS:2618
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1), L_BP7a!(RT_CINT%(FX##(L_BP2d8!) + 1.0), 1)   '@28f7b DS:2618
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2), L_BP7a!(RT_CINT%(FX##(L_BP2d8!) + 1.0), 2)   '@28fc4 DS:2618
    SWAP L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3), L_BP7a!(RT_CINT%(FX##(L_BP2d8!) + 1.0), 3)   '@29007 DS:2618
L_29055:
    V_0ee8! = 1.0   '@29055 DS:2618
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@29066 DS:2618
L_29081:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@29086 DS:2618
    IF NOT (L_BP7a!(0, 0) > L_BP2d8!) THEN GOTO L_2911a   '@290b2
    IF NOT (V_0ee8! = 0.0) THEN GOTO L_2910d   '@290dc DS:2614
    L_BP2d8! = FX##(L_BP2d8!) + 1.0   '@290f7 DS:2618
L_2910d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_28cba   '@2910d
L_2911a:
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0)) + 1.0), 0) = L_BP7a!(1, 0)   '@2911a DS:2618
    L_BP7a!(RT_CINT%(FX##(L_BP7a!(0, 0)) + 1.0), 1) = L_BP7a!(1, 1)   '@2916a DS:2618
    L_BP294! = 0.0   '@291b9 DS:2614
    V_0ee8! = 1.0   '@291ca DS:2618
    L_BP2d8! = 0.0   '@291db DS:2614
    L_BP340! = L_BP7a!(0, 0)   '@291ec
    FOR V_0ef0! = 1.0 TO L_BP340!   '@2920d DS:2618
    V_153a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!) + 1.0), 0)   '@29214 DS:2618
    V_1542# = L_BP7a!(RT_CINT%(FX##(V_0ef0!) + 1.0), 1)   '@29243 DS:2618
    IF NOT (L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3) <> L_BP7a!(RT_CINT%(FX##(V_0ef0!) + 1.0), 1) OR L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2) <> L_BP7a!(RT_CINT%(FX##(V_0ef0!) + 1.0), 0)) THEN GOTO L_29379   '@29273 DS:2618
    V_153a# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2)   '@29321
    V_1542# = L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3)   '@29349
L_29379:
    L_BP2d8! = L_BP2d8! + (FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 0)) + V_153a#) * (FX##(L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 1)) - V_1542#) / 2.0#   '@29379 DS:2782
    IF NOT (L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 3) = L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 1) AND L_BP7a!(RT_CINT%(FX##(V_0ef0!)), 2) = L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 0)) THEN GOTO L_294c5   '@293dc
    L_BP294! = ABS(FX##(L_BP2d8!)) + L_BP294!   '@29480
    L_BP2d8! = 0.0   '@29499 DS:2614
    V_0ee8! = FX##(V_0ef0!) + 1.0   '@294aa DS:2618
L_294c5:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@294c5 DS:2618
    ERASE L_BP64%   '@294f1
    ERASE L_BP7a!   '@294ff
    RETURN   '@29508
L_29517:   ' sub-rotina (alvo de GOSUB)
    IF NOT (L_BP7a!(0, 0) > L_BP2d8!) THEN GOTO L_296c5   '@2951c
    L_BP344! = FX##(L_BP7a!(0, 0)) - 1.0   '@29546 DS:2792
    FOR V_0ee8! = L_BP2d8! TO L_BP344!   '@2956c DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 0) = L_BP7a!(RT_CINT%(FX##(V_0ee8!) + 1.0), 0)   '@29574 DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 1) = L_BP7a!(RT_CINT%(FX##(V_0ee8!) + 1.0), 1)   '@295bc DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 2) = L_BP7a!(RT_CINT%(FX##(V_0ee8!) + 1.0), 2)   '@29606 DS:2618
    L_BP7a!(RT_CINT%(FX##(V_0ee8!)), 3) = L_BP7a!(RT_CINT%(FX##(V_0ee8!) + 1.0), 3)   '@2964a DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ee8!   '@29694 DS:2618
L_296c5:
    L_BP7a!(0, 0) = FX##(L_BP7a!(0, 0)) - 1.0   '@296c5 DS:2792
    RETURN   '@296f9
L_29708:   ' sub-rotina (alvo de GOSUB); entrada vinda de 020146_FUN_2000_0146
    L_BP11a% = 1   '@2970d
    V_0f18$ = ""   '@29718 DS:261c
    V_0ef0! = 0.0   '@2972a DS:2614
    L_BP348! = A_1156!(0, 0)   '@2973b
    FOR V_0f04! = 1.0 TO L_BP348!   '@2975c DS:2618
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f04!)), 1) = A_1156!(RT_CINT%(FX##(V_0f04!)), 3) AND A_1156!(RT_CINT%(FX##(V_0f04!)), 0) = A_1156!(RT_CINT%(FX##(V_0f04!)), 2)) THEN GOTO L_29810   '@29764
    GOTO L_29eee   '@29808
L_29810:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f04!)), 3) = L_BP2e!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 2) = L_BP1c!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 1) = L_BP2e!(1) AND A_1156!(RT_CINT%(FX##(V_0f04!)), 0) = L_BP1c!(1)))) THEN GOTO L_29960   '@29810 DS:2792
    GOTO L_29c5f   '@29958
L_29960:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f04!)), 3) = L_BP2e!(1) AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 2) = L_BP1c!(1) AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 1) = L_BP2e!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) AND A_1156!(RT_CINT%(FX##(V_0f04!)), 0) = L_BP1c!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0))))) THEN GOTO L_29ab0   '@29960 DS:2792
    GOTO L_29c5f   '@29aa8
L_29ab0:
    L_BP128! = A_1156!(RT_CINT%(FX##(V_0f04!)), 0)   '@29ab0
    L_BP12c! = A_1156!(RT_CINT%(FX##(V_0f04!)), 1)   '@29ada
    L_BP130! = A_1156!(RT_CINT%(FX##(V_0f04!)), 2)   '@29b05
    L_BP134! = A_1156!(RT_CINT%(FX##(V_0f04!)), 3)   '@29b2d
    V_153a# = L_BP1c!(1)   '@29b58
    V_1542# = L_BP2e!(1)   '@29b75
    V_154a# = L_BP1c!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0))   '@29b92 DS:2792
    V_1552# = L_BP2e!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0))   '@29bcc DS:2792
    L_BPd2! = -1.0   '@29c06 DS:2792
    L_BP11c% = 2   '@29c17
    GOSUB L_249e8   '@29c22
    IF NOT (L_BPd2! = 0.5) THEN GOTO L_29c52   '@29c2f DS:27b2
    GOTO L_29c5f   '@29c4a
L_29c52:
    GOTO L_29eee   '@29c52
L_29c5f:
    V_0f14! = 0.0   '@29c64 DS:2614
    V_0f18$ = ""   '@29c75 DS:261c
    L_BP34c! = V_0f04!   '@29c87
    FOR V_0ef0! = 1.0 TO L_BP34c!   '@29c99 DS:2618
    IF NOT (A_1128$(RT_CINT%(FX##(V_0ef0!))) <> V_0f18$) THEN GOTO L_29ce1   '@29ca0
    V_0f14! = FX##(V_0f14!) + 1.0   '@29ccb DS:2618
L_29ce1:
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0ef0!)))   '@29ce1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@29d07 DS:2618
    A_1a6a!(RT_CINT%(FX##(V_0f14!)), 1) = FX##(A_1a6a!(RT_CINT%(FX##(V_0f14!)), 1)) + L_BP10e! + L_BP112!   '@29d33
    A_1a6a!(RT_CINT%(FX##(V_0f14!)), 1) = (-(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) * FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) * L_BPd6! + A_1a6a!(RT_CINT%(FX##(V_0f14!)), 1)   '@29d82 DS:2618
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f04!)))   '@29e42
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(V_0f04!)))) > 0.0#) THEN GOTO L_29ed0   '@29e68 DS:2796
    V_0f18$ = "P" + A_1128$(RT_CINT%(FX##(V_0f04!)))   '@29ea0 DS:27b6
L_29ed0:
    V_0ef0! = 1.0   '@29ed0 DS:2618
    GOTO L_29f1f   '@29ee1
L_29eee:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@29ef3 DS:2618
L_29f1f:
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_29f44   '@29f1f DS:2618
    RETURN   '@29f3a
L_29f44:
    L_BP350! = A_11b2%(0, 0)   '@29f44
    FOR V_0f14! = 1.0 TO L_BP350!   '@29f69 DS:2618
    L_BP354! = A_11b2%(RT_CINT%(FX##(V_0f14!)), 0) - 1   '@29f70
    FOR V_0f04! = 1.0 TO L_BP354!   '@29fa0 DS:2618
    L_BP128! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!))), 0)   '@29fa8
    L_BP12c! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!))), 1)   '@29fec
    L_BP130! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 0)   '@2a031 DS:2618
    L_BP134! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f04!) + 1.0)), 1)   '@2a07a DS:2618
    IF NOT (L_BP2e!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) = L_BP134! AND (L_BP1c!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) = L_BP130! AND (L_BP2e!(1) = L_BP12c! AND L_BP1c!(1) = L_BP128!))) THEN GOTO L_2a1b0   '@2a0c4 DS:2792
    GOTO L_2a2a9   '@2a1a8
L_2a1b0:
    IF NOT (L_BP2e!(1) = L_BP134! AND (L_BP1c!(1) = L_BP130! AND (L_BP2e!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) = L_BP12c! AND L_BP1c!(RT_CINT%(FX##(L_BP1c!(0)) - 1.0)) = L_BP128!))) THEN GOTO L_2a29c   '@2a1b0 DS:2792
    GOTO L_2a2a9   '@2a294
L_2a29c:
    GOTO L_2a6a1   '@2a29c
L_2a2a9:
    V_0ef0! = 1.0   '@2a2ae DS:2618
    L_BP140! = 0.0   '@2a2bf DS:2614
L_2a2d6:
    L_BP356% = (INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0ef0!)))) / 1000.0) <> FX##(1.0))   '@2a2d6 DS:2618,27bc
    IF NOT ((A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0ef0!))) <> A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0ef0!) + 1.0)) AND INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0ef0!)))) / 1000.0) = FX##(1.0) OR L_BP356%) <> 0) THEN GOTO L_2a41b   '@2a363 DS:2618
    L_BP140! = FX##(L_BP140!) + 1.0   '@2a3dd DS:2618
    IF NOT (V_0ef0! = V_0f04!) THEN GOTO L_2a416   '@2a3f3
    GOTO L_2a43a   '@2a40e
L_2a416:
L_2a41b:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@2a41b DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2a2d6   '@2a431
L_2a43a:
    A_1af4!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!))) = (FX##(L_BP10e!) + L_BP112!) / RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0))) + A_1af4!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!)))   '@2a43a DS:2610
    A_1b22!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!))) = L_BP116! / RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0))) + A_1b22!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!)))   '@2a4cc DS:2610
    A_1af4!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!))) = (-(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) <> 1.0) * FX##(A_10cc!(RT_CINT%(FX##(V_0f0c!)), 5)) + A_10cc!(RT_CINT%(FX##(V_0f0c!)), 4)) / RT_SQR##(RT_POT##((FX##(L_BP128!) - L_BP130!), (2.0)) + RT_POT##((FX##(L_BP12c!) - L_BP134!), (2.0))) * L_BPd6! + A_1af4!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP140!)))   '@2a559 DS:2610,2618
    V_0f18$ = V_0e60$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e5c!) + V_0f14!)))   '@2a65c
    GOTO L_2a6d2   '@2a694
L_2a6a1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2a6a6 DS:2618
L_2a6d2:
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0f14!)), 0) - 1 >= V_0f04!) THEN GOTO L_2a713   '@2a6d2
    GOTO L_2a73f   '@2a70b
L_2a713:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2a713 DS:2618
L_2a73f:
    RETURN   '@2a73f
L_2a74e:   ' entrada vinda de 020146_FUN_2000_0146
    ERASE L_BP7a!   '@2a74e
    ERASE L_BP64%   '@2a757
    ERASE L_BP40!   '@2a760
    ERASE L_BP1c!   '@2a769
    ERASE L_BP52!   '@2a772
    ERASE L_BP2e!   '@2a77b
    ERASE L_BP8c!   '@2a784
    ERASE L_BP9e!   '@2a78e
    ' END SUB   '@2a798
END SUB

SUB S_2a7a8   ' entrada de SUB/FUNCTION (B$ENRA, locais 222 bytes) (0x2a7a8)
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
    DIM L_BP4c%
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
    ' ---- FUN_2000_a7a8 @0x2a7a8  (02a7a8_FUN_2000_a7a8.lift.txt; evidence_id (assembly): ev_4066b821cf525708476485b96fed638cb80083d12fffb540d6abd708f0830e30)
    REDIM A_1bda%(-32768 TO -32768, -32768 TO -32768)   '@2a7b0
    REDIM A_1c08!(-32768 TO -32768, -32768 TO -32768)   '@2a7be
    REDIM A_1c36!(-32768 TO -32768, -32768 TO -32768)   '@2a7c7
    REDIM A_1c64%(-32768 TO -32768, -32768 TO -32768)   '@2a7d0
    REDIM A_1c92%(-32768 TO -32768, -32768 TO -32768)   '@2a7d9
    REDIM A_1ac6!(-32768 TO -32768, -32768 TO -32768)   '@2a7e2
    REDIM A_1af4!(-32768 TO -32768, -32768 TO -32768)   '@2a7eb
    REDIM A_1b22!(-32768 TO -32768, -32768 TO -32768)   '@2a7f4
    REDIM A_1b50!(-32768 TO -32768, -32768 TO -32768)   '@2a7fd
    REDIM A_1b7e!(-32768 TO -32768, -32768 TO -32768)   '@2a806
    REDIM A_1bac!(-32768 TO -32768, -32768 TO -32768)   '@2a80f
    REDIM A_1bda%(0 TO A_11b2%(0, 0), 0 TO 4)   '@2a818
    REDIM A_1c08!(0 TO A_11b2%(0, 0), 0 TO 13)   '@2a849
    REDIM A_1c36!(0 TO A_11b2%(0, 0), 0 TO 13)   '@2a87a
    REDIM A_1c64%(0 TO A_11b2%(0, 0), 0 TO 13)   '@2a8ab
    REDIM A_1c92%(0 TO A_11b2%(0, 0), 0 TO 13)   '@2a8dc
    REDIM A_1ac6!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2a90d
    REDIM A_1af4!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2a93e
    REDIM A_1b22!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2a96f
    REDIM A_1b50!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2a9a0
    REDIM A_1b7e!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2a9d1
    REDIM A_1bac!(0 TO A_11b2%(0, 0), 0 TO 30)   '@2aa02
    RT_VIEWPRINT 23, 25   '@2aa33
    RT_CLS 2   '@2aa45
    PRINT " Montagem do Esquema Unifilar do Carregamento das Vigas"   '@2aa53 DS:27c0
    V_19ea! = 0.0   '@2aa61 DS:2614
    V_19f6! = 0.0   '@2aa72 DS:2614
    V_19fa! = 0.0   '@2aa83 DS:2614
    L_BP0e! = A_11b2%(0, 0)   '@2aa94
    FOR V_0f0c! = 1.0 TO L_BP0e!   '@2aab8 DS:2618
    L_BP12! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@2aac0
    FOR V_0f10! = 1.0 TO L_BP12!   '@2aaee DS:2618
    V_0f04! = INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) / 1000.0) * 1000.0   '@2aaf6 DS:27bc
    IF NOT (V_0f10! = 1.0) THEN GOTO L_2ada8   '@2ab3d DS:2618
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1), 0)   '@2ab58
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1), 1)   '@2ab94
    V_0f14! = 1.0   '@2abd1 DS:2618
    L_BP1e! = -1.0   '@2abe2 DS:2792
    IF NOT (V_0f04! = 0.0 OR (V_0f04! = 4000.0 OR V_0f04! = 3000.0)) THEN GOTO L_2ad36   '@2abf2 DS:2614,27fc,2800
    L_BP22! = 0.0   '@2ac4b DS:2614
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 1) = 1   '@2ac5b
    IF NOT (V_0f04! = 3000.0) THEN GOTO L_2ad2e   '@2ac80 DS:27fc
    A_1b7e!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = FX##(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) - V_0f04!   '@2ac9b
    A_1bac!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = -100.0   '@2acf7 DS:2804
L_2ad2e:
    GOTO L_2ad9b   '@2ad2e
L_2ad36:
    L_BP22! = 1.0   '@2ad36 DS:2618
    IF NOT (V_0f04! = 1000.0) THEN GOTO L_2ad96   '@2ad46 DS:27bc
    L_BP1e! = A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))   '@2ad61
L_2ad96:
L_2ad9b:
    GOTO L_2bcea   '@2ad9b
L_2ada8:
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = L_BP1e! AND V_0f04! = 1000.0) THEN GOTO L_2aee2   '@2ada8 DS:27bc
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@2ae0e
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@2ae51
    IF NOT (V_0f10! = 2.0) THEN GOTO L_2aed5   '@2ae95 DS:2610
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 3) = 1   '@2aeb0
L_2aed5:
    GOTO L_2b8a0   '@2aed5
L_2aee2:
    A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) + 1   '@2aee2
    A_1b50!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = RT_SQR##(RT_POT##((FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 0)) - L_BP16!), (2.0)) + RT_POT##((FX##(A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 1)) - L_BP1a!), (2.0)))   '@2af30 DS:2610
    A_1af4!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1) / (FX##(V_0dec!) * 1000.0) * V_0de8!   '@2aff4 DS:27bc
    IF NOT (V_0f04! = 3000.0) THEN GOTO L_2b158   '@2b06e DS:27fc
    A_1b7e!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!) - (L_BP22! = 0.0))) = FX##(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) - V_0f04!   '@2b089 DS:2614
    A_1bac!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!) - (L_BP22! = 0.0))) = -100.0   '@2b103 DS:2614,2804
L_2b158:
    IF NOT (V_0f04! = 2000.0 OR V_0f04! = 1000.0) THEN GOTO L_2b885   '@2b158 DS:27bc,2808
    IF NOT (L_BP22! > 0.0) THEN GOTO L_2b1f0   '@2b196 DS:2614
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0) = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0) + 1   '@2b1b0
L_2b1f0:
    A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1b50!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!)))   '@2b1f0
    V_19ea! = FX##(A_11b2%(RT_CINT%(FX##(V_0f0c!)), A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1)) * A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) / (FX##(V_0dec!) * 1000.0) * V_0de8! + V_19ea!   '@2b242 DS:27bc
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = 1.0047099590301513671875##   '@2b2c5 DS:280c
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) <> L_BP1e! AND V_0f04! = 1000.0) THEN GOTO L_2b433   '@2b2f6 DS:27bc
    IF NOT (VAL(A_1128$(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) - 1000)) > 0.0#) THEN GOTO L_2b42e   '@2b35c DS:2796
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = FX##(VAL(A_1128$(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) - 1000))) / 100000.0# + 1.0#   '@2b3b2 DS:27a2,2810
L_2b42e:
L_2b433:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 1) = 0 AND L_BP22! = 1.0) THEN GOTO L_2b588   '@2b433 DS:2618
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), 0) = 1.0047099590301513671875##   '@2b482 DS:280c
    IF NOT (L_BP1e! < 2000.0 AND L_BP1e! > 1000.0) THEN GOTO L_2b583   '@2b4ac DS:27bc,2808
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(L_BP1e!) - 1000.0))) > 0.0#) THEN GOTO L_2b57e   '@2b4e8 DS:2796,2818
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), 0) = FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP1e!) - 1000.0)))) / 100000.0# + 1.0#   '@2b524 DS:27a2,2810,2818
L_2b57e:
L_2b583:
L_2b588:
    IF NOT (L_BP22! > 0.0) THEN GOTO L_2b622   '@2b588 DS:2614
    A_1c92%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) + A_1c92%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!) - 1.0))   '@2b5a2 DS:2792
    GOTO L_2b66f   '@2b61a
L_2b622:
    A_1c92%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!)))   '@2b622
L_2b66f:
    IF NOT (L_BP22! = 0.0) THEN GOTO L_2b7e5   '@2b66f DS:2614
    IF NOT (A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) > 1) THEN GOTO L_2b7e0   '@2b689
    FOR L_BP26! = A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) TO 2.0 STEP -1.0   '@2b6ba DS:2610,2792
    A_1b50!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!))) = FX##(A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!)))) - A_1b50!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!) - 1.0))   '@2b6ec DS:2792
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@2b767 DS:2610,2792
    A_1b50!(RT_CINT%(FX##(V_0f0c!)), 1) = A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!)))   '@2b790
L_2b7e0:
L_2b7e5:
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@2b7e5
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@2b828
    L_BP22! = FX##(L_BP22!) + 1.0   '@2b86c DS:2618
L_2b885:
    V_0f14! = FX##(V_0f14!) + 1.0   '@2b885 DS:2618
L_2b8a0:
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) = V_0f10!) THEN GOTO L_2bc95   '@2b8a5
    IF NOT (V_0f04! = 0.0 OR (V_0f04! = 4000.0 OR V_0f04! = 3000.0)) THEN GOTO L_2bc00   '@2b8dd DS:2614,27fc,2800
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2) = 1   '@2b936
    A_1c92%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) + A_1c92%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!) - 1.0))   '@2b958 DS:2792
    A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = A_1b50!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!) - 1.0))   '@2b9d0 DS:2792
    V_19ea! = FX##(A_11b2%(RT_CINT%(FX##(V_0f0c!)), A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1)) * A_1c08!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) / (FX##(V_0dec!) * 1000.0) * V_0de8! + V_19ea!   '@2ba27 DS:27bc
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP22!))) = 1.0   '@2baaa DS:2618
    IF NOT (L_BP22! = 1.0) THEN GOTO L_2bbfb   '@2badb DS:2618
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), 0) = 1.0047099590301513671875##   '@2baf5 DS:280c
    IF NOT (L_BP1e! < 2000.0 AND L_BP1e! > 1000.0) THEN GOTO L_2bbf6   '@2bb1f DS:27bc,2808
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(L_BP1e!) - 1000.0))) > 0.0#) THEN GOTO L_2bbf1   '@2bb5b DS:2796,2818
    A_1c36!(RT_CINT%(FX##(V_0f0c!)), 0) = FX##(VAL(A_1128$(RT_CINT%(FX##(L_BP1e!) - 1000.0)))) / 100000.0# + 1.0#   '@2bb97 DS:27a2,2810,2818
L_2bbf1:
L_2bbf6:
L_2bbfb:
L_2bc00:
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = L_BP1e! AND V_0f04! = 1000.0) THEN GOTO L_2bc90   '@2bc00 DS:27bc
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 4) = 1   '@2bc66
L_2bc90:
L_2bc95:
    IF NOT (V_0f04! = 1000.0) THEN GOTO L_2bce5   '@2bc95 DS:27bc
    L_BP1e! = A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))   '@2bcb0
L_2bce5:
L_2bcea:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2bcef DS:2618
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0) = 0) THEN GOTO L_2bd8e   '@2bd1a
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 3) = 0   '@2bd44
    A_1bda%(RT_CINT%(FX##(V_0f0c!)), 4) = 0   '@2bd69
L_2bd8e:
    RT_VIEWPRINT 24, 25   '@2bd8e
    RT_CLS 2   '@2bda0
    LOCATE 24, 4   '@2bdae
    PRINT "VIGA "; V_0e60$ + LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1184$(RT_CINT%(FX##(V_0f0c!))))) + V_0e5c!)))   '@2bdc9 DS:281c
    V_0f18$ = STR$(A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0)) + " Tramos "   '@2be26 DS:2826
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 1) = 1) THEN GOTO L_2bea8   '@2be61
    V_0f18$ = V_0f18$ + "Be "   '@2be8c DS:2832
L_2bea8:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2) = 1) THEN GOTO L_2beec   '@2bea8
    V_0f18$ = V_0f18$ + "Bd "   '@2bed0 DS:283a
L_2beec:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 3) = 1) THEN GOTO L_2bf33   '@2beec
    V_0f18$ = V_0f18$ + "Ee "   '@2bf17 DS:2842
L_2bf33:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 4) = 1) THEN GOTO L_2bf7a   '@2bf33
    V_0f18$ = V_0f18$ + "Ed "   '@2bf5e DS:284a
L_2bf7a:
    LOCATE 25, 3   '@2bf7a
    PRINT V_0f18$;   '@2bf98
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2bfa6 DS:2618
    L_BP2a! = A_11b2%(0, 0)   '@2bfd1
    FOR V_0f0c! = 1.0 TO L_BP2a!   '@2bff5 DS:2618
    L_BP2e! = A_1c92%(RT_CINT%(FX##(V_0f0c!)), A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2) + A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0))   '@2bffc
    FOR L_BP26! = 1.0 TO L_BP2e!   '@2c05f DS:2618
    IF NOT (A_1bac!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!))) = -100.0) THEN GOTO L_2c36d   '@2c066 DS:2804
    V_0f14! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!)))   '@2c0a1
    L_BP1e! = -1.0   '@2c0d2 DS:2792
    V_0ef0! = 0.0   '@2c0e2 DS:2614
    L_BP32! = A_11b2%(RT_CINT%(FX##(V_0f14!)), 0)   '@2c0f3
    FOR V_0f10! = 1.0 TO L_BP32!   '@2c121 DS:2618
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!))) = 2000.0 + FX##(V_0f0c!)) THEN GOTO L_2c1d5   '@2c128 DS:2808
    A_1b7e!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!))) = FX##(V_0ef0!) / 100.0 + A_1b7e!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BP26!)))   '@2c16d DS:2852
    GOTO L_2c368   '@2c1c8
L_2c1d5:
    V_0f04! = INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!)))) / 1000.0) * 1000.0   '@2c1d5 DS:27bc
    IF NOT (V_0f04! = 2000.0 OR V_0f04! = 1000.0) THEN GOTO L_2c333   '@2c21c DS:27bc,2808
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!))) = L_BP1e! AND V_0f04! = 1000.0) THEN GOTO L_2c2c8   '@2c25a DS:27bc
    GOTO L_2c338   '@2c2c0
L_2c2c8:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@2c2c8 DS:2618
    IF NOT (V_0f04! = 1000.0) THEN GOTO L_2c32e   '@2c2de DS:27bc
    L_BP1e! = A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_0f10!)))   '@2c2f9
L_2c32e:
L_2c333:
L_2c338:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2c33d DS:2618
L_2c368:
L_2c36d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BP26!   '@2c36d DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2c395 DS:2618
    V_19f6! = V_19ea!   '@2c3c0
    RT_VIEWPRINT 23, 25   '@2c3d1
    RT_CLS 2   '@2c3e3
    PRINT " Montagem do Esquema Unifilar do Carregamento dos Pilares"   '@2c3f1 DS:2856
    REDIM A_1a6a!(-32768 TO -32768, -32768 TO -32768)   '@2c3ff
    REDIM A_1a98$(-32768 TO -32768, -32768 TO -32768)   '@2c40d
    V_0f14! = 0.0   '@2c416 DS:2614
    V_0f18$ = ""   '@2c427 DS:261c
    L_BP36! = A_1156!(0, 0)   '@2c439
    FOR V_0f10! = 1.0 TO L_BP36!   '@2c459 DS:2618
    IF NOT (A_1128$(RT_CINT%(FX##(V_0f10!))) <> V_0f18$) THEN GOTO L_2c4a1   '@2c460
    V_0f14! = FX##(V_0f14!) + 1.0   '@2c48b DS:2618
L_2c4a1:
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f10!)))   '@2c4a1
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2c4c7 DS:2618
    REDIM A_1a6a!(0 TO CINT(V_0f14!), 0 TO 5)   '@2c4f2
    REDIM A_1a98$(0 TO CINT(V_0f14!), 0 TO 3)   '@2c51d
    A_1a6a!(0, 0) = V_0f14!   '@2c543
    V_0f14! = 0.0   '@2c563 DS:2614
    V_0f18$ = ""   '@2c574 DS:261c
    L_BP3a! = A_1156!(0, 0)   '@2c586
    FOR V_0f0c! = 1.0 TO L_BP3a!   '@2c5a6 DS:2618
    IF NOT (A_1128$(RT_CINT%(FX##(V_0f0c!))) <> V_0f18$) THEN GOTO L_2c5ef   '@2c5ae
    V_0f14! = FX##(V_0f14!) + 1.0   '@2c5d9 DS:2618
L_2c5ef:
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@2c5ef
    L_BP26! = 0.0   '@2c615 DS:2614
L_2c62a:
    IF NOT (LEN(A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!)))) > 0) THEN GOTO L_2c671   '@2c62a
    L_BP26! = FX##(L_BP26!) + 1.0   '@2c65d DS:2618
L_2c671:
    IF NOT (L_BP26! = 3.0) THEN GOTO L_2c693   '@2c671 DS:279e
    GOTO L_2c6c6   '@2c68b
L_2c693:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (LEN(A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!)))) <= 0) THEN GOTO L_2c62a   '@2c693
L_2c6c6:
    RT_VIEWPRINT 24, 25   '@2c6c6
    RT_CLS 2   '@2c6d8
    PRINT "    PILAR ";   '@2c6e6 DS:2894
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(V_0f0c!)))) > 0.0#) THEN GOTO L_2c765   '@2c6f4 DS:2796
    PRINT "P"; LTRIM$(A_1128$(RT_CINT%(FX##(V_0f0c!))))   '@2c72c DS:27b6
    GOTO L_2c792   '@2c75d
L_2c765:
    PRINT LTRIM$(A_1128$(RT_CINT%(FX##(V_0f0c!))))   '@2c765
L_2c792:
    L_BP3e! = A_11b2%(0, 0)   '@2c792
    FOR V_0f10! = 1.0 TO L_BP3e!   '@2c7b6 DS:2618
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f10!)), 1) = 1000.0 + FX##(V_0f0c!)) THEN GOTO L_2c9a4   '@2c7be DS:27bc
    V_0f1c$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1184$(RT_CINT%(FX##(V_0f10!))))) + V_0e5c!)))   '@2c7fc
    IF NOT (VAL(V_0f1c$) > 0.0#) THEN GOTO L_2c88a   '@2c84a DS:2796
    V_0f1c$ = V_0e60$ + V_0f1c$   '@2c86e
L_2c88a:
    A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!))) = V_0f1c$   '@2c88a
    V_0f04! = 1.0   '@2c8ba DS:2618
    GOSUB L_2e40f   '@2c8cb
    A_1a6a!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!) + 2.0)) = L_BP42!   '@2c8d8 DS:2610
    PRINT "    "; A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!))); "-"; LTRIM$(STR$(L_BP42!)); CHR$(248);   '@2c90d DS:28a2,28aa
    IF NOT (L_BP26! < 3.0) THEN GOTO L_2c99f   '@2c971 DS:279e
    L_BP26! = FX##(L_BP26!) + 1.0   '@2c98b DS:2618
L_2c99f:
L_2c9a4:
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f10!)), A_11b2%(RT_CINT%(FX##(V_0f10!)), 0)) = 1000.0 + FX##(V_0f0c!)) THEN GOTO L_2cba0   '@2c9a4 DS:27bc
    V_0f1c$ = LTRIM$(RT_STR8$(RT_DBL#(FX##(VAL(A_1184$(RT_CINT%(FX##(V_0f10!))))) + V_0e5c!)))   '@2c9f8
    IF NOT (VAL(V_0f1c$) > 0.0#) THEN GOTO L_2ca86   '@2ca46 DS:2796
    V_0f1c$ = V_0e60$ + V_0f1c$   '@2ca6a
L_2ca86:
    A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!))) = V_0f1c$   '@2ca86
    V_0f04! = 2.0   '@2cab6 DS:2610
    GOSUB L_2e40f   '@2cac7
    A_1a6a!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!) + 2.0)) = L_BP42!   '@2cad4 DS:2610
    PRINT "    "; A_1a98$(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BP26!))); "-"; LTRIM$(STR$(L_BP42!)); CHR$(248);   '@2cb09 DS:28a2,28aa
    IF NOT (L_BP26! < 3.0) THEN GOTO L_2cb9b   '@2cb6d DS:279e
    L_BP26! = FX##(L_BP26!) + 1.0   '@2cb87 DS:2618
L_2cb9b:
L_2cba0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2cba0 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2cbcb DS:2618
    RT_VIEWPRINT 23, 25   '@2cbf6
    RT_CLS 2   '@2cc08
    PRINT " Alvenaria sobre as Vigas"   '@2cc16 DS:28b0
    IF NOT (V_1a66$ = "S") THEN GOTO L_2ccb2   '@2cc24 DS:267a
    RT_LPTABRE: RT_LPS V_0e0c$: RT_LPFIM   '@2cc3b
    RT_LPTABRE: RT_LPS V_0e10$: RT_LPFIM   '@2cc4e
    RT_LPTABRE: RT_LPS "     ALVENARIAS SOBRE AS VIGAS": RT_LPFIM   '@2cc61 DS:28ce
    RT_LPTABRE: RT_LPS "     Viga          Tramo   Peso Proprio    Carga": RT_LPFIM   '@2cc74 DS:28f0
    RT_LPTABRE: RT_LPS RT_STRINGS$((50), ("-")): RT_LPS "": RT_LPFIM   '@2cc87 DS:261c,28aa
L_2ccb2:
    V_19e2! = 0.0   '@2ccb2 DS:2614
    V_19e6! = 0.0   '@2ccc3 DS:2614
    L_BP46! = A_11b2%(0, 0)   '@2ccd4
    FOR V_0f0c! = 1.0 TO L_BP46!   '@2ccf8 DS:2618
    RT_VIEWPRINT 24, 25   '@2cd00
    RT_CLS 2   '@2cd12
    PRINT "   Viga "; V_0e60$; LTRIM$(STR$(RT_SNG!(FX##(V_0f0c!) + V_0e5c!))); RT_TAB$(30); ""; A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0); "Tramos";   '@2cd20 DS:261c,2924,2930
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 1) = 1) THEN GOTO L_2cdd2   '@2cd99
    PRINT " Be";   '@2cdc4 DS:293a
L_2cdd2:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2) = 1) THEN GOTO L_2ce08   '@2cdd2
    PRINT " Bd";   '@2cdfa DS:2942
L_2ce08:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 3) = 1) THEN GOTO L_2ce41   '@2ce08
    PRINT " Ee";   '@2ce33 DS:294a
L_2ce41:
    IF NOT (A_1bda%(RT_CINT%(FX##(V_0f0c!)), 4) = 1) THEN GOTO L_2ce7a   '@2ce41
    PRINT " Ed";   '@2ce6c DS:2952
L_2ce7a:
    V_0f1c$ = V_0e60$ + LTRIM$(STR$(RT_SNG!(FX##(V_0f0c!) + V_0e5c!)))   '@2ce7a
    LOCATE 25, 2   '@2ceb2
    L_BP4a! = A_1c92%(RT_CINT%(FX##(V_0f0c!)), A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2) + A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0))   '@2ced0
    FOR V_0f14! = 1.0 TO L_BP4a!   '@2cf33 DS:2618
    V_0f10! = 1.0   '@2cf3a DS:2618
    L_BP26! = 0.0   '@2cf4b DS:2614
L_2cf60:
    L_BP4c% = (INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) / 1000.0) <> FX##(1.0))   '@2cf60 DS:2618,27bc
    IF NOT ((A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) <> A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) AND INT(FX##(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) / 1000.0) = FX##(1.0) OR L_BP4c%) <> 0) THEN GOTO L_2d0a0   '@2cfec DS:2618
    L_BP26! = FX##(L_BP26!) + 1.0   '@2d065 DS:2618
    IF NOT (L_BP26! = V_0f14!) THEN GOTO L_2d09b   '@2d079
    GOTO L_2d0be   '@2d093
L_2d09b:
L_2d0a0:
    V_0f10! = FX##(V_0f10!) + 1.0   '@2d0a0 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2cf60   '@2d0b6
L_2d0be:
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@2d0be
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@2d101
    L_BP50! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)), 0)   '@2d145 DS:2618
    L_BP54! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)), 1)   '@2d18d DS:2618
    GOSUB L_2db80   '@2d1d6
    IF NOT (V_0ef0! > 0.0) THEN GOTO L_2d3a6   '@2d1e3 DS:2614
    A_1ac6!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = V_0ef0! / RT_SQR##(RT_POT##((FX##(L_BP16!) - L_BP50!), (2.0)) + RT_POT##((FX##(L_BP1a!) - L_BP54!), (2.0))) + A_1ac6!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!)))   '@2d1fe DS:2610
    A_1af4!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!))) = V_0ef0! / RT_SQR##(RT_POT##((FX##(L_BP16!) - L_BP50!), (2.0)) + RT_POT##((FX##(L_BP1a!) - L_BP54!), (2.0))) + A_1af4!(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f14!)))   '@2d287 DS:2610
    V_19e2! = FX##(V_19e2!) + V_0ef0!   '@2d310
    V_19f6! = FX##(V_19f6!) + V_0ef0!   '@2d326
    PRINT USING " ## ##.##"; RT_PU#(V_0f14!, " ## ##.##", 1); RT_PU#(RT_SNG!(V_0ef0! / RT_SQR##(RT_POT##((FX##(L_BP16!) - L_BP50!), (2.0)) + RT_POT##((FX##(L_BP1a!) - L_BP54!), (2.0)))), " ## ##.##", 2);   '@2d33c DS:2610,295a
L_2d3a6:
    IF NOT (V_1a66$ = "S") THEN GOTO L_2d58e   '@2d3a6 DS:267a
    V_0f10! = 0.0   '@2d3bd DS:2614
    L_BP26! = 0.0   '@2d3ce DS:2614
L_2d3e3:
    IF NOT (FX##(A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) + L_BP26! < FX##(V_0f14!)) THEN GOTO L_2d483   '@2d3e8
    L_BP26! = FX##(A_1c64%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!)))) + L_BP26!   '@2d42c
    V_0f10! = FX##(V_0f10!) + 1.0   '@2d465 DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_2d3e3   '@2d47b
L_2d483:
    V_0f18$ = "     \        \   ##(##a)    ####.##     ####.##"   '@2d483 DS:2968
    RT_LPTABRE: PRINT #RT_LPT, USING V_0f18$; V_0f1c$; RT_PU#(V_0f10!, V_0f18$, 1); RT_PU#(RT_SNG!(FX##(V_0f14!) - L_BP26!), V_0f18$, 2); RT_PU#(RT_SNG!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1) / (FX##(V_0dec!) * 1000.0) * V_0de8!), V_0f18$, 3); RT_PU#(RT_SNG!(V_0ef0! / RT_SQR##(RT_POT##((FX##(L_BP16!) - L_BP50!), (2.0)) + RT_POT##((FX##(L_BP1a!) - L_BP54!), (2.0)))), V_0f18$, 4): RT_LPTQUEBRA 0   '@2d495 DS:2610,27bc
    V_0f1c$ = ""   '@2d577 DS:261c
L_2d58e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@2d58e DS:2618
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2d5b9 DS:2618
    RT_VIEWPRINT 23, 25   '@2d5e4
    RT_CLS 2   '@2d5f6
    PRINT " Alvenaria sobre os Pilares"   '@2d604 DS:299c
    IF NOT (V_1a66$ = "S") THEN GOTO L_2d6a0   '@2d612 DS:267a
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@2d629 DS:261c
    RT_LPTABRE: RT_LPS "": RT_LPFIM   '@2d63c DS:261c
    RT_LPTABRE: RT_LPS "     ALVENARIAS SOBRE OS PILARES": RT_LPFIM   '@2d64f DS:29bc
    RT_LPTABRE: RT_LPS "     Pilar                                 Carga": RT_LPFIM   '@2d662 DS:29e0
    RT_LPTABRE: RT_LPS RT_STRINGS$((50), ("-")): RT_LPS "": RT_LPFIM   '@2d675 DS:261c,28aa
L_2d6a0:
    L_BP58! = A_1156!(0, 0)   '@2d6a0
    FOR V_0f0c! = 1.0 TO L_BP58!   '@2d6c0 DS:2618
    RT_VIEWPRINT 24, 25   '@2d6c8
    RT_CLS 2   '@2d6da
    PRINT "    Pilar ";   '@2d6e8 DS:2a14
    IF NOT (VAL(A_1128$(RT_CINT%(FX##(V_0f0c!)))) > 0.0#) THEN GOTO L_2d791   '@2d6f6 DS:2796
    PRINT "P"; A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@2d72e DS:27b6
    V_0f1c$ = "P" + A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@2d759 DS:27b6
    GOTO L_2d7de   '@2d789
L_2d791:
    PRINT A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@2d791
    V_0f1c$ = A_1128$(RT_CINT%(FX##(V_0f0c!)))   '@2d7b3
L_2d7de:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f0c!)), 1) = A_1156!(RT_CINT%(FX##(V_0f0c!)), 3) AND A_1156!(RT_CINT%(FX##(V_0f0c!)), 0) = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)) THEN GOTO L_2d88a   '@2d7de
    GOTO L_2db43   '@2d882
L_2d88a:
    LOCATE 25, 5   '@2d88a
    L_BP16! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 0)   '@2d8a8
    L_BP1a! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 1)   '@2d8d1
    L_BP50! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 2)   '@2d8fb
    L_BP54! = A_1156!(RT_CINT%(FX##(V_0f0c!)), 3)   '@2d922
    GOSUB L_2db80   '@2d94c
    V_0f14! = 0.0   '@2d959 DS:2614
    V_0f18$ = ""   '@2d96a DS:261c
    L_BP5c! = V_0f0c!   '@2d97c
    FOR V_0f10! = 1.0 TO L_BP5c!   '@2d98d DS:2618
    IF NOT (A_1128$(RT_CINT%(FX##(V_0f10!))) <> V_0f18$) THEN GOTO L_2d9d5   '@2d994
    V_0f14! = FX##(V_0f14!) + 1.0   '@2d9bf DS:2618
L_2d9d5:
    V_0f18$ = A_1128$(RT_CINT%(FX##(V_0f10!)))   '@2d9d5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@2d9fb DS:2618
    A_1a6a!(RT_CINT%(FX##(V_0f14!)), 0) = FX##(A_1a6a!(RT_CINT%(FX##(V_0f14!)), 0)) + V_0ef0!   '@2da26
    IF NOT (V_0ef0! > 0.0) THEN GOTO L_2db3e   '@2da6e DS:2614
    V_19e2! = FX##(V_19e2!) + V_0ef0!   '@2da89
    V_19fa! = FX##(V_19fa!) + V_0ef0!   '@2da9f
    PRINT USING "## ##.##"; RT_PU#(V_0f14!, "## ##.##", 1); RT_PU#(V_0ef0!, "## ##.##", 2);   '@2dab5 DS:2a22
    IF NOT (V_1a66$ = "S") THEN GOTO L_2db39   '@2dae2 DS:267a
    V_0f18$ = "     \        \                          ####.##"   '@2daf9 DS:2a2e
    RT_LPTABRE: PRINT #RT_LPT, USING V_0f18$; V_0f1c$; RT_PU#(V_0ef0!, V_0f18$, 1): RT_LPTQUEBRA 0   '@2db0b
L_2db39:
L_2db3e:
L_2db43:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@2db48 DS:2618
    GOTO L_2e7e3   '@2db73
    ' ---- F_2db7b @0x2db7b  (02db7b_F_2db7b.lift.txt; evidence_id (assembly): ev_815d476773303ba71604477446689b9fa55134d26d7d0c7eba165183aca867e3)
L_2db80:   ' sub-rotina (alvo de GOSUB); entrada vinda de 02a7a8_FUN_2000_a7a8
    V_0ef0! = 0.0   '@2db85 DS:2614
    L_BP60! = A_0fe6!(0, 0)   '@2db96
    FOR V_0f04! = 1.0 TO L_BP60!   '@2dbb6 DS:2618
    V_153a# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 0)   '@2dbbe
    V_1542# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 1)   '@2dbe8
    V_154a# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 2)   '@2dc13
    V_1552# = A_0fe6!(RT_CINT%(FX##(V_0f04!)), 3)   '@2dc3b
    CALL MIXT_082a_Maior(L_BP16!, L_BP50!, L_BP64!)   '@2dc66
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP68! = FX##(V_153a#) / 1.0#   '@2dc7d DS:27a2
    L_BP6c! = FX##(V_154a#) / 1.0#   '@2dc8d DS:27a2
    CALL MIXT_0877_Menor(L_BP68!, L_BP6c!, L_BP70!)   '@2dc9c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP16!, L_BP50!, L_BP74!)   '@2dcad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP78! = FX##(V_153a#) / 1.0#   '@2dcbf DS:27a2
    L_BP7c! = FX##(V_154a#) / 1.0#   '@2dccf DS:27a2
    CALL MIXT_082a_Maior(L_BP78!, L_BP7c!, L_BP80!)   '@2dcde
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP74! > L_BP80! OR L_BP64! < L_BP70!) THEN GOTO L_2dd2c   '@2dcf0
    GOTO L_2e3d0   '@2dd24
L_2dd2c:
    CALL MIXT_082a_Maior(L_BP1a!, L_BP54!, L_BP84!)   '@2dd2c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP88! = FX##(V_1542#) / 1.0#   '@2dd44 DS:27a2
    L_BP8c! = FX##(V_1552#) / 1.0#   '@2dd55 DS:27a2
    CALL MIXT_0877_Menor(L_BP88!, L_BP8c!, L_BP90!)   '@2dd65
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1a!, L_BP54!, L_BP94!)   '@2dd79
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP98! = FX##(V_1542#) / 1.0#   '@2dd8c DS:27a2
    L_BP9c! = FX##(V_1552#) / 1.0#   '@2dd9d DS:27a2
    CALL MIXT_082a_Maior(L_BP98!, L_BP9c!, L_BPa0!)   '@2ddad
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP94! > L_BPa0! OR L_BP84! < L_BP90!) THEN GOTO L_2de02   '@2ddc2
    GOTO L_2e3d0   '@2ddfa
L_2de02:
    IF NOT (L_BP16! = L_BP50!) THEN GOTO L_2e016   '@2de02
    IF NOT (V_153a# <> V_154a#) THEN GOTO L_2de3e   '@2de1b
    GOTO L_2e3d0   '@2de36
L_2de3e:
    CALL MIXT_082a_Maior(L_BP1a!, L_BP54!, L_BPa4!)   '@2de3e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPa8! = FX##(V_1542#) / 1.0#   '@2de56 DS:27a2
    L_BPac! = FX##(V_1552#) / 1.0#   '@2de67 DS:27a2
    CALL MIXT_0877_Menor(L_BPa8!, L_BPac!, L_BPb0!)   '@2de77
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1a!, L_BP54!, L_BPb4!)   '@2de8b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPb8! = FX##(V_1542#) / 1.0#   '@2de9e DS:27a2
    L_BPbc! = FX##(V_1552#) / 1.0#   '@2deaf DS:27a2
    CALL MIXT_082a_Maior(L_BPb8!, L_BPbc!, L_BPc0!)   '@2debf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BPb4! = L_BPc0! OR L_BPa4! = L_BPb0!) THEN GOTO L_2df14   '@2ded4
    GOTO L_2e3d0   '@2df0c
L_2df14:
    V_155a# = L_BP16!   '@2df14
    V_156a# = L_BP16!   '@2df24
    CALL MIXT_082a_Maior(L_BP1a!, L_BP54!, L_BPc4!)   '@2df34
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc8! = FX##(V_1542#) / 1.0#   '@2df4c DS:27a2
    L_BPcc! = FX##(V_1552#) / 1.0#   '@2df5d DS:27a2
    CALL MIXT_082a_Maior(L_BPc8!, L_BPcc!, L_BPd0!)   '@2df6d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BPc4!, L_BPd0!, L_BPd4!)   '@2df81
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1562# = L_BPd4!   '@2df96
    CALL MIXT_0877_Menor(L_BP1a!, L_BP54!, L_BPd8!)   '@2dfa1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPdc! = FX##(V_1542#) / 1.0#   '@2dfb9 DS:27a2
    L_BPe0! = FX##(V_1552#) / 1.0#   '@2dfca DS:27a2
    CALL MIXT_0877_Menor(L_BPdc!, L_BPe0!, L_BPe4!)   '@2dfda
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BPd8!, L_BPe4!, L_BPe8!)   '@2dfee
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1572# = L_BPe8!   '@2e003
    GOTO L_2e363   '@2e00e
L_2e016:
    IF NOT (V_153a# = V_154a#) THEN GOTO L_2e039   '@2e016
    GOTO L_2e3d0   '@2e031
L_2e039:
    IF NOT (ABS((FX##(V_1552#) - V_1542#) / (FX##(V_154a#) - V_153a#) - (FX##(L_BP54!) - L_BP1a!) / (FX##(L_BP50!) - L_BP16!)) > FX##(V_133e!)) THEN GOTO L_2e087   '@2e039
    GOTO L_2e3d0   '@2e07f
L_2e087:
    IF NOT (FX##(L_BP16!) <> FX##(V_154a#) AND FX##(L_BP16!) <> FX##(V_153a#)) THEN GOTO L_2e11f   '@2e087
    IF NOT (ABS((FX##(V_1552#) - L_BP1a!) / (FX##(V_154a#) - L_BP16!) - (FX##(L_BP1a!) - V_1542#) / (FX##(L_BP16!) - V_153a#)) > FX##(V_133e!)) THEN GOTO L_2e117   '@2e0c3
    GOTO L_2e3d0   '@2e10f
L_2e117:
    GOTO L_2e168   '@2e117
L_2e11f:
    IF NOT (FX##(L_BP1a!) <> FX##(V_1552#) AND FX##(L_BP1a!) <> FX##(V_1542#)) THEN GOTO L_2e163   '@2e11f
    GOTO L_2e3d0   '@2e15b
L_2e163:
L_2e168:
    V_155a# = L_BP16!   '@2e168
    V_1562# = L_BP1a!   '@2e178
    IF NOT (L_BP50! < L_BP16!) THEN GOTO L_2e1c1   '@2e188
    V_155a# = L_BP50!   '@2e1a1
    V_1562# = L_BP54!   '@2e1b1
L_2e1c1:
    IF NOT (V_153a# < V_154a#) THEN GOTO L_2e221   '@2e1c1
    IF NOT (V_153a# > V_155a#) THEN GOTO L_2e219   '@2e1dc
    V_155a# = V_153a#   '@2e1f7
    V_1562# = V_1542#   '@2e208
L_2e219:
    GOTO L_2e263   '@2e219
L_2e221:
    IF NOT (V_154a# > V_155a#) THEN GOTO L_2e25e   '@2e221
    V_155a# = V_154a#   '@2e23c
    V_1562# = V_1552#   '@2e24d
L_2e25e:
L_2e263:
    V_156a# = L_BP16!   '@2e263
    V_1572# = L_BP1a!   '@2e273
    IF NOT (L_BP50! > L_BP16!) THEN GOTO L_2e2bc   '@2e283
    V_156a# = L_BP50!   '@2e29c
    V_1572# = L_BP54!   '@2e2ac
L_2e2bc:
    IF NOT (V_153a# > V_154a#) THEN GOTO L_2e31c   '@2e2bc
    IF NOT (V_153a# < V_156a#) THEN GOTO L_2e314   '@2e2d7
    V_156a# = V_153a#   '@2e2f2
    V_1572# = V_1542#   '@2e303
L_2e314:
    GOTO L_2e35e   '@2e314
L_2e31c:
    IF NOT (V_154a# < V_156a#) THEN GOTO L_2e359   '@2e31c
    V_156a# = V_154a#   '@2e337
    V_1572# = V_1552#   '@2e348
L_2e359:
L_2e35e:
L_2e363:
    V_0ef0! = V_0ef0! + A_0fe6!(RT_CINT%(FX##(V_0f04!)), 4) * RT_SQR##(RT_POT##((FX##(V_155a#) - V_156a#), (2.0#)) + RT_POT##((FX##(V_1562#) - V_1572#), (2.0#)))   '@2e363 DS:2782
L_2e3d0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@2e3d5 DS:2618
    RETURN   '@2e400
L_2e40f:   ' sub-rotina (alvo de GOSUB); entrada vinda de 02a7a8_FUN_2000_a7a8
    L_BP16! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 0)   '@2e414
    L_BP1a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), 1), 1)   '@2e450
    L_BP50! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), A_11b2%(RT_CINT%(FX##(V_0f10!)), 0)), 0)   '@2e48d
    L_BP54! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f10!)), A_11b2%(RT_CINT%(FX##(V_0f10!)), 0)), 1)   '@2e4df
    IF NOT (ABS(FX##(L_BP1a!) - L_BP54!) < FX##(V_133a!)) THEN GOTO L_2e562   '@2e532
    L_BP54! = L_BP1a!   '@2e553
L_2e562:
    IF NOT (V_0f04! = 2.0) THEN GOTO L_2e5b0   '@2e562 DS:2610
    SWAP L_BP16!, L_BP50!   '@2e588 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
    SWAP L_BP1a!, L_BP54!   '@2e59f (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 12 bytes)
L_2e5b0:
    IF NOT (L_BP16! = L_BP50!) THEN GOTO L_2e619   '@2e5b0
    L_BP42! = FX##(V_0e68_pi#) / 2.0#   '@2e5c9 DS:2782
    IF NOT (L_BP1a! > L_BP54!) THEN GOTO L_2e611   '@2e5de
    L_BP42! = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@2e5f7 DS:2782,278a
L_2e611:
    GOTO L_2e7b4   '@2e611
L_2e619:
    IF NOT (L_BP1a! <= L_BP54! AND L_BP16! < L_BP50!) THEN GOTO L_2e678   '@2e619
    L_BP42! = ATN((FX##(L_BP54!) - L_BP1a!) / (FX##(L_BP50!) - L_BP16!))   '@2e653
L_2e678:
    IF NOT (L_BP1a! < L_BP54! AND L_BP16! > L_BP50!) THEN GOTO L_2e6df   '@2e678
    L_BP42! = V_0e68_pi# - ATN((FX##(L_BP54!) - L_BP1a!) / (FX##(L_BP16!) - L_BP50!))   '@2e6b2
L_2e6df:
    IF NOT (L_BP1a! >= L_BP54! AND L_BP16! > L_BP50!) THEN GOTO L_2e743   '@2e6df
    L_BP42! = ATN((FX##(L_BP1a!) - L_BP54!) / (FX##(L_BP16!) - L_BP50!)) + V_0e68_pi#   '@2e719
L_2e743:
    IF NOT (L_BP1a! > L_BP54! AND L_BP16! < L_BP50!) THEN GOTO L_2e7af   '@2e743
    L_BP42! = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(L_BP1a!) - L_BP54!) / (FX##(L_BP50!) - L_BP16!))   '@2e77d DS:2782
L_2e7af:
L_2e7b4:
    L_BP42! = INT(FX##(L_BP42!) * 180.0 / V_0e68_pi#)   '@2e7b4 DS:2a62
    RETURN   '@2e7d4
L_2e7e3:   ' entrada vinda de 02a7a8_FUN_2000_a7a8
    ' END SUB   '@2e7e3
END SUB

SUB S_3014b   ' entrada de SUB/FUNCTION (B$ENRA, locais 396 bytes) (0x3014b)
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
    DIM L_BPa2%
    DIM L_BPa4%
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
    REDIM L_BP60%(-32768 TO -32768)   ' matriz local: ainda nao dimensionada
    ' ---- FUN_3000_014b @0x3014b  (03014b_FUN_3000_014b.lift.txt; evidence_id (assembly): ev_e83dc233d9f5fe22c40693351db3784d6f2e5de964a8f750103f6d485296a4be)
    REDIM L_BP60%(0 TO 240)   '@30167
    IF NOT (V_0dcc_placa$ = "HER") THEN GOTO L_301fa   '@3018e DS:2a70
    L_BP42! = 7.0   '@301a5 DS:2a78
    L_BP3e! = 7.0   '@301b5 DS:2a78
    L_BP46! = 7.0   '@301c5 DS:2a78
    L_BP4a! = 7.0   '@301d5 DS:2a78
    L_BP4e! = 7.0   '@301e5 DS:2a78
L_301fa:
    L_BPa2% = (V_0dcc_placa$ = "CGA")   '@301fa DS:2a7c
    IF NOT ((V_0dcc_placa$ = "MCG" OR L_BPa2%) <> 0) THEN GOTO L_3028b   '@30220 DS:2a84
    L_BP42! = 15.0   '@30236 DS:2a8c
    L_BP3e! = 15.0   '@30246 DS:2a8c
    L_BP46! = 15.0   '@30256 DS:2a8c
    L_BP4a! = 15.0   '@30266 DS:2a8c
    L_BP4e! = 15.0   '@30276 DS:2a8c
L_3028b:
    L_BPa4% = (V_0dcc_placa$ = "EGA")   '@3028b DS:2a90
    IF NOT ((V_0dcc_placa$ = "VGA" OR L_BPa4%) <> 0) THEN GOTO L_30332   '@302b1 DS:2a98
    COLOR , 1   '@302c7
    L_BP42! = 11.0   '@302dd DS:2aa0
    L_BP3e! = 14.0   '@302ed DS:2aa4
    L_BP46! = 16.0   '@302fd DS:2aa8
    L_BP4a! = 12.0   '@3030d DS:2aac
    L_BP4e! = 15.0   '@3031d DS:2a8c
L_30332:
    L_BP0e! = A_0f8a!(1, 1)   '@30332
    L_BP12! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@30352
    L_BP16! = A_0f8a!(1, 0)   '@3038e
    L_BP1a! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@303b0
    L_BP1e! = 560.0 / (FX##(L_BP12!) - L_BP0e!)   '@303e8 DS:2ab0
    L_BP22! = 145.0 / (FX##(L_BP1a!) - L_BP16!)   '@30403 DS:2ab4
    IF NOT (FX##(L_BP22!) / L_BP1e! > 0.41670000553131103515625##) THEN GOTO L_30458   '@3041e DS:2ab8
    L_BP22! = L_BP1e! * 0.41670000553131103515625##   '@3043c DS:2ab8
    GOTO L_30471   '@30450
L_30458:
    L_BP1e! = L_BP22! / 0.41670000553131103515625##   '@30458 DS:2ab8
L_30471:
    L_BP26! = 45.0   '@30471 DS:2abc
    L_BP2a! = 10.0   '@30481 DS:2ac0
    RT_VIEWPRINT 23, 25   '@30491
    RT_CLS 2   '@304a3
    RT_VIEWPRINT 1, 25   '@304b1
    LOCATE 24, 1   '@304c3
    PRINT " Aguarde .."   '@304de DS:2ac4
    GOSUB L_305c9   '@304ec
    GOSUB L_312b3   '@304f9
    GOSUB L_33920   '@30506
    RT_VIEWPRINT 23, 25   '@30513
    RT_CLS 2   '@30525
    PRINT ""   '@30533 DS:2ad4
    PRINT " Imprimo Relatorio sobre Carregamento das Vigas S/*N* ";   '@30541 DS:2ad8
    CALL MIXT_07f1_LimpaTeclado   '@3054f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@30559 DS:2ad4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "S") THEN GOTO L_305aa   '@30573 DS:2b12
    V_1a66$ = "S"   '@30590 DS:2b12
    GOTO L_305bc   '@305a2
L_305aa:
    V_1a66$ = "N"   '@305aa DS:2b18
L_305bc:
    GOTO L_33d6b   '@305bc
    ' ---- F_305c4 @0x305c4  (0305c4_F_305c4.lift.txt; evidence_id (assembly): ev_d2214efe0dae7d13623043b0166d672766ec0466abb0fb0abfedc9830cd2a5d7)
L_305c9:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03014b_FUN_3000_014b
    L_BPa8! = A_11b2%(0, 0)   '@305ce
    FOR V_0f0c! = 1.0 TO L_BPa8!   '@305f3 DS:2b1e
    L_BP2e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1), 0)   '@305fa
    L_BP36! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 1), 1)   '@30636
    L_BP32! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 2), 0)   '@30673
    L_BP3a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), 2), 1)   '@306ac
    L_BPac! = A_1070!(0, 0)   '@306e6
    FOR V_0f14! = 1.0 TO L_BPac!   '@30707 DS:2b1e
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP3a! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP32! OR A_1070!(RT_CINT%(FX##(V_0f14!)), 1) = L_BP36! AND A_1070!(RT_CINT%(FX##(V_0f14!)), 0) = L_BP2e!) THEN GOTO L_307f2   '@3070e
    GOTO L_31247   '@307ea
L_307f2:
    IF NOT (L_BP2e! = L_BP32!) THEN GOTO L_30aff   '@307f2
    IF NOT (ABS(FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - L_BP2e!) > FX##(V_133a!)) THEN GOTO L_3084e   '@3080b
    GOTO L_31247   '@30846
L_3084e:
    CALL MIXT_0877_Menor(L_BP36!, L_BP3a!, L_BPb0!)   '@3084e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP36!, L_BP3a!, L_BPb4!)   '@30865
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) > L_BPb4! OR A_1070!(RT_CINT%(FX##(V_0f14!)), 1) < L_BPb0!) THEN GOTO L_308ee   '@30878
    GOTO L_31247   '@308e6
L_308ee:
    L_BPb8! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@308ee
    FOR V_0f04! = 1.0 TO L_BPb8!   '@3091d DS:2b1e
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 1) > A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) THEN GOTO L_30a4e   '@30924
    L_BPbc! = V_0f04!   '@3098d
    FOR L_BPc0! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) TO L_BPbc! STEP -1.0   '@3099f DS:2b22
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!) + 1.0)) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!)))   '@309c4 DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc0!   '@30a18 DS:2b22
    GOTO L_30a7a   '@30a41
L_30a4e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@30a4e DS:2b1e
L_30a7a:
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1   '@30a7a
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_0f14!))   '@30aba
    GOTO L_31247   '@30af2
L_30aff:
    IF NOT (L_BP36! = L_BP3a!) THEN GOTO L_30e09   '@30aff
    IF NOT (ABS(FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 1)) - L_BP36!) > FX##(V_133a!)) THEN GOTO L_30b5c   '@30b18
    GOTO L_31247   '@30b54
L_30b5c:
    CALL MIXT_0877_Menor(L_BP2e!, L_BP32!, L_BPc4!)   '@30b5c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP2e!, L_BP32!, L_BPc8!)   '@30b73
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) > L_BPc8! OR A_1070!(RT_CINT%(FX##(V_0f14!)), 0) < L_BPc4!) THEN GOTO L_30bfa   '@30b86
    GOTO L_31247   '@30bf2
L_30bfa:
    L_BPcc! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@30bfa
    FOR V_0f04! = 1.0 TO L_BPcc!   '@30c29 DS:2b1e
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 0) > A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) THEN GOTO L_30d58   '@30c30
    L_BPd0! = V_0f04!   '@30c97
    FOR L_BPc0! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) TO L_BPd0! STEP -1.0   '@30ca9 DS:2b22
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!) + 1.0)) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!)))   '@30cce DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc0!   '@30d22 DS:2b22
    GOTO L_30d84   '@30d4b
L_30d58:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@30d58 DS:2b1e
L_30d84:
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1   '@30d84
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_0f14!))   '@30dc4
    GOTO L_31247   '@30dfc
L_30e09:
    IF NOT (ABS(FX##(L_BP32!) - A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) < FX##(V_133a!) OR ABS(FX##(L_BP2e!) - A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) < FX##(V_133a!)) THEN GOTO L_30e91   '@30e09
    GOTO L_31247   '@30e89
L_30e91:
    CALL MIXT_082a_Maior(L_BP2e!, L_BP32!, L_BPd4!)   '@30e91
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP2e!, L_BP32!, L_BPd8!)   '@30ea8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP36!, L_BP3a!, L_BPdc!)   '@30eba
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP36!, L_BP3a!, L_BPe0!)   '@30ecc
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) < L_BPe0! OR (A_1070!(RT_CINT%(FX##(V_0f14!)), 1) > L_BPdc! OR (A_1070!(RT_CINT%(FX##(V_0f14!)), 0) < L_BPd8! OR A_1070!(RT_CINT%(FX##(V_0f14!)), 0) > L_BPd4!))) THEN GOTO L_30fc1   '@30edf
    GOTO L_31247   '@30fb9
L_30fc1:
    IF NOT (ABS(A_1070!(RT_CINT%(FX##(V_0f14!)), 1) - ((FX##(L_BP3a!) - L_BP36!) * (FX##(A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) - L_BP2e!) / (FX##(L_BP32!) - L_BP2e!) + L_BP36!)) > FX##(V_133e!)) THEN GOTO L_31040   '@30fc1
    GOTO L_31247   '@31038
L_31040:
    L_BPe4! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@31040
    FOR V_0f04! = 1.0 TO L_BPe4!   '@3106f DS:2b1e
    IF NOT (A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 0) > A_1070!(RT_CINT%(FX##(V_0f14!)), 0)) THEN GOTO L_3119e   '@31076
    L_BPe8! = V_0f04!   '@310dd
    FOR L_BPc0! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) TO L_BPe8! STEP -1.0   '@310ef DS:2b22
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!) + 1.0)) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(L_BPc0!)))   '@31114 DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc0!   '@31168 DS:2b22
    GOTO L_311ca   '@31191
L_3119e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@3119e DS:2b1e
L_311ca:
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1   '@311ca
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(V_0f14!))   '@3120a
L_31247:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@3124c DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@31278 DS:2b1e
    RETURN   '@312a4
L_312b3:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03014b_FUN_3000_014b
    REDIM A_1a2c%(-32768 TO -32768, -32768 TO -32768)   '@312b8
    REDIM A_1a2c%(0 TO V_0e4e%, 0 TO 50)   '@312c6
    L_BPec! = 0.0   '@312e8 DS:2b26
    L_BPf0! = A_11b2%(0, 0)   '@312f9
    FOR V_0f0c! = 1.0 TO L_BPf0!   '@3131e DS:2b1e
    L_BPf4! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@31326
    FOR V_0f04! = 1.0 TO L_BPf4!   '@31355 DS:2b1e
    L_BP2e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@3135c
    L_BP36! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@3139f
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) > 0) THEN GOTO L_3141d   '@313e3
    GOTO L_320a3   '@31415
L_3141d:
    L_BPf8! = A_1156!(0, 0)   '@3141d
    FOR L_BPc0! = 1.0 TO L_BPf8!   '@3143e DS:2b1e
    IF NOT ((ABS(FX##(L_BP36!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)) > FX##(V_133a!) OR ABS(FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)) > FX##(V_133a!)) AND (A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3) AND A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2))) THEN GOTO L_3156d   '@31446
    GOTO L_3206d   '@31565
L_3156d:
    IF NOT (A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)) THEN GOTO L_317e1   '@3156d
    IF NOT (ABS(FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)) > FX##(V_133a!)) THEN GOTO L_315fb   '@315b8
    GOTO L_3206d   '@315f3
L_315fb:
    L_BPfc! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)   '@315fb
    L_BP100! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)   '@31627
    CALL MIXT_0877_Menor(L_BPfc!, L_BP100!, L_BP104!)   '@3164c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 3) = L_BP100!   '@31661
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = L_BPfc!   '@31687
    L_BP108! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)   '@316ad
    L_BP10c! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)   '@316d3
    CALL MIXT_082a_Maior(L_BP108!, L_BP10c!, L_BP110!)   '@316f8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 3) = L_BP10c!   '@3170d
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = L_BP108!   '@31733
    IF NOT (L_BP36! > L_BP110! OR L_BP36! < L_BP104!) THEN GOTO L_31797   '@31759
    GOTO L_3206d   '@3178f
L_31797:
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(L_BPc0!) + 1000.0)   '@31797 DS:2b2a
    GOTO L_3209e   '@317d4
L_317e1:
    IF NOT (A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)) THEN GOTO L_31a4a   '@317e1
    IF NOT (ABS(FX##(L_BP36!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)) > FX##(V_133a!)) THEN GOTO L_31874   '@31830
    GOTO L_3206d   '@3186c
L_31874:
    L_BP114! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)   '@31874
    L_BP118! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)   '@3189f
    CALL MIXT_0877_Menor(L_BP114!, L_BP118!, L_BP11c!)   '@318c1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 2) = L_BP118!   '@318d6
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = L_BP114!   '@318f9
    L_BP120! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)   '@3191e
    L_BP124! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)   '@31943
    CALL MIXT_082a_Maior(L_BP120!, L_BP124!, L_BP128!)   '@31965
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 2) = L_BP124!   '@3197a
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = L_BP120!   '@3199d
    IF NOT (L_BP2e! > L_BP128! OR L_BP2e! < L_BP11c!) THEN GOTO L_31a00   '@319c2
    GOTO L_3206d   '@319f8
L_31a00:
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(L_BPc0!) + 1000.0)   '@31a00 DS:2b2a
    GOTO L_3209e   '@31a3d
L_31a4a:
    L_BP12a% = (RT_POT##((FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)), (2.0)) + RT_POT##((FX##(L_BP36!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)), (2.0)) < FX##(V_133a!))   '@31a4a DS:2b2e
    IF NOT ((RT_POT##((FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)), (2.0)) + RT_POT##((FX##(L_BP36!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)), (2.0)) < FX##(V_133a!) OR L_BP12a%) <> 0) THEN GOTO L_31b8e   '@31af5 DS:2b2e
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(L_BPc0!) + 1000.0)   '@31b44 DS:2b2a
    GOTO L_3209e   '@31b81
L_31b8e:
    IF NOT (ABS(FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)) < FX##(V_133a!) OR ABS(FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)) < FX##(V_133a!)) THEN GOTO L_31c14   '@31b8e
    GOTO L_3206d   '@31c0c
L_31c14:
    L_BP12e! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)   '@31c14
    L_BP132! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)   '@31c3f
    CALL MIXT_0877_Menor(L_BP12e!, L_BP132!, L_BP136!)   '@31c61
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 2) = L_BP132!   '@31c76
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = L_BP12e!   '@31c99
    L_BP13a! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)   '@31cbe
    L_BP13e! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)   '@31ce3
    CALL MIXT_082a_Maior(L_BP13a!, L_BP13e!, L_BP142!)   '@31d05
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 2) = L_BP13e!   '@31d1a
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 0) = L_BP13a!   '@31d3d
    IF NOT (L_BP2e! > L_BP142! OR L_BP2e! < L_BP136!) THEN GOTO L_31da0   '@31d62
    GOTO L_3206d   '@31d98
L_31da0:
    L_BP146! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)   '@31da0
    L_BP14a! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)   '@31dcc
    CALL MIXT_0877_Menor(L_BP146!, L_BP14a!, L_BP14e!)   '@31df1
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 3) = L_BP14a!   '@31e06
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = L_BP146!   '@31e2c
    L_BP152! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)   '@31e52
    L_BP156! = A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)   '@31e78
    CALL MIXT_082a_Maior(L_BP152!, L_BP156!, L_BP15a!)   '@31e9d
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 3) = L_BP156!   '@31eb2
    A_1156!(RT_CINT%(FX##(L_BPc0!)), 1) = L_BP152!   '@31ed8
    IF NOT (L_BP36! > L_BP15a! OR L_BP36! < L_BP14e!) THEN GOTO L_31f3c   '@31efe
    GOTO L_3206d   '@31f34
L_31f3c:
    IF NOT (ABS(L_BP36! - ((FX##(A_1156!(RT_CINT%(FX##(L_BPc0!)), 3)) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 1)) * (FX##(L_BP2e!) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)) / (FX##(A_1156!(RT_CINT%(FX##(L_BPc0!)), 2)) - A_1156!(RT_CINT%(FX##(L_BPc0!)), 0)) + A_1156!(RT_CINT%(FX##(L_BPc0!)), 1))) > FX##(V_133a!)) THEN GOTO L_32023   '@31f3c
    GOTO L_3206d   '@3201b
L_32023:
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(FX##(L_BPc0!) + 1000.0)   '@32023 DS:2b2a
    GOTO L_3209e   '@32060
L_3206d:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc0!   '@32072 DS:2b1e
L_3209e:
L_320a3:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@320a8 DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@320d4 DS:2b1e
    LOCATE 23, 1   '@32100
    PRINT " Escolha opcao   (qualquer tecla para alterar a opcao ou <Enter> para aceitar)"   '@3211b DS:2b32
    CALL MIXT_07f1_LimpaTeclado   '@32129
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP15e! = A_11b2%(0, 0)   '@32133
    FOR V_0f0c! = 1.0 TO L_BP15e!   '@32158 DS:2b1e
    L_BP162! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0)   '@32160
    FOR V_0f04! = 1.0 TO L_BP162!   '@3218f DS:2b1e
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = 0) THEN GOTO L_32e64   '@32196
    L_BP166! = A_11b2%(0, 0)   '@321c8
    FOR V_0f14! = 1.0 TO L_BP166!   '@321ed DS:2b1e
    IF NOT (V_0f14! = V_0f0c!) THEN GOTO L_32217   '@321f4
    GOTO L_32e2e   '@3220f
L_32217:
    L_BP16a! = A_11b2%(RT_CINT%(FX##(V_0f14!)), 0)   '@32217
    FOR L_BPc0! = 1.0 TO L_BP16a!   '@32246 DS:2b1e
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = A_11b2%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BPc0!)))) THEN GOTO L_32dbd   '@3224e
    V_0ef4# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 0)   '@322a4
    V_0efc# = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))), 1)   '@322e8
    IF NOT (VAL(A_1184$(RT_CINT%(FX##(V_0f0c!)))) > 0.0#) THEN GOTO L_323c2   '@3232d DS:2b84
    V_0f18$ = V_0e60$ + LTRIM$(RT_STR8$(RT_DBL#(FX##(V_0e5c!) + VAL(A_1184$(RT_CINT%(FX##(V_0f0c!)))))))   '@32365
    GOTO L_323ed   '@323ba
L_323c2:
    V_0f18$ = A_1184$(RT_CINT%(FX##(V_0f0c!)))   '@323c2
L_323ed:
    IF NOT (VAL(A_1184$(RT_CINT%(FX##(V_0f14!)))) > 0.0#) THEN GOTO L_32482   '@323ed DS:2b84
    V_0f1c$ = V_0e60$ + LTRIM$(RT_STR8$(RT_DBL#(FX##(V_0e5c!) + VAL(A_1184$(RT_CINT%(FX##(V_0f14!)))))))   '@32425
    GOTO L_324ad   '@3247a
L_32482:
    V_0f1c$ = A_1184$(RT_CINT%(FX##(V_0f14!)))   '@32482
L_324ad:
    V_0ef0! = 1.0   '@324ad DS:2b1e
    RT_VIEWPRINT 24, 25   '@324be
    RT_CLS 2   '@324d0
    RT_VIEWPRINT 1, 25   '@324de
    LOCATE 24, 1   '@324f0
    PRINT "     "; V_0f18$; " apoia em "; V_0f1c$; "      ou         "; V_0f1c$; " apoia em "; V_0f18$; RT_TAB$(68); ""; "Isoladas";   '@3250b DS:2ad4,2b8c,2b96,2ba4,2bba
    RT_GCAIXA RT_SNG!(FX##(L_BP26!) - 4.0 + (FX##(V_0ef4#) - L_BP0e!) * L_BP1e!), RT_SNG!(166.0 - FX##(L_BP2a!) - (FX##(V_0efc#) - L_BP16!) * L_BP22!), 8, -8, 5: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), L_BP60%(1): RT_GFIM   '@32573 DS:2bc6,2bca
L_325f9:
L_32604:
    L_BP16e! = FX##(L_BP26!) - 4.0 + (FX##(V_0ef4#) - L_BP0e!) * L_BP1e!   '@32604 DS:2bc6
    L_BP172! = 166.0 - FX##(L_BP2a!) - (FX##(V_0efc#) - L_BP16!) * L_BP22!   '@32630 DS:2bca
    L_BP176$ = CHR$(25)   '@32655
    L_BP17a$ = "CGA"   '@32669 DS:2a7c
    CALL MIXT_08c4_TextoGrafico(L_BP16e!, L_BP172!, L_BP176$, L_BP17a$)   '@32677
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    ' @32690 libera strings locais (L_BP176)
    ' @3269a libera strings locais (L_BP17a)
    L_BP17c% = (V_0ef0! = 2.0)   '@326a4 DS:2b1e,2b2e
    L_BP17e% = -(V_0ef0! = 1.0) * 2   '@326f7
    LOCATE 24, L_BP17e% - (LEN(V_0f18$ + V_0f1c$) + 29) * L_BP17c% - (V_0ef0! = 3.0) * 64   '@326fb DS:2bce
    PRINT CHR$(45); CHR$(45); CHR$(26);   '@32742
    L_BP182! = RT_TIMER   '@32774
L_32790:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP182! < 0.07999999821186065673828125## THEN GOTO L_32790   '@32790 DS:2bd2
    RT_GPONTO RT_SNG!(FX##(L_BP26!) - 4.0 + (FX##(V_0ef4#) - L_BP0e!) * L_BP1e!), RT_SNG!(158.0 - FX##(L_BP2a!) - (FX##(V_0efc#) - L_BP16!) * L_BP22!), 0: PUT (RG_GX1, RG_GY1), L_BP60%(1), PSET: RT_GFIM   '@327b2 DS:2bc6,2bd6
    L_BP182! = RT_TIMER   '@3282a
L_32846:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF FX##(RT_TIMER) - L_BP182! < 0.07999999821186065673828125## THEN GOTO L_32846   '@32846 DS:2bd2
    L_BP184% = (V_0ef0! = 2.0)   '@32868 DS:2b1e,2b2e
    L_BP186% = -(V_0ef0! = 1.0) * 2   '@328bb
    LOCATE 24, L_BP186% - (LEN(V_0f18$ + V_0f1c$) + 29) * L_BP184% - (V_0ef0! = 3.0) * 64   '@328bf DS:2bce
    PRINT "   ";   '@32906 DS:2bda
    V_0f20$ = RT_INKEY$   '@32914
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_0f20$ <> "") THEN GOTO L_32604   '@32928 DS:2ad4
    IF NOT (CHR$(13) <> V_0f20$) THEN GOTO L_329f8   '@3293f
    SOUND 1000, 2.0   '@3295c DS:2b2e
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_329a6   '@32972 DS:2b1e
    V_0ef0! = 2.0   '@3298d DS:2b2e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_325f9   '@3299e
L_329a6:
    IF NOT (V_0ef0! = 2.0) THEN GOTO L_329da   '@329a6 DS:2b2e
    V_0ef0! = 3.0   '@329c1 DS:2bce
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_325f9   '@329d2
L_329da:
    V_0ef0! = 1.0   '@329da DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_325f9   '@329eb
L_329f8:
    LOCATE 25, 6   '@329f8
    PRINT "Confirme ";   '@32a16 DS:2be2
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_32a64   '@32a24 DS:2b1e
    PRINT V_0f18$; " apoia em "; V_0f1c$;   '@32a3f DS:2b96
L_32a64:
    IF NOT (V_0ef0! = 2.0) THEN GOTO L_32aa4   '@32a64 DS:2b2e
    PRINT V_0f1c$; " apoia em "; V_0f18$;   '@32a7f DS:2b96
L_32aa4:
    IF NOT (V_0ef0! = 3.0) THEN GOTO L_32ae4   '@32aa4 DS:2bce
    PRINT V_0f18$; " isolada de "; V_0f1c$;   '@32abf DS:2bf0
L_32ae4:
    PRINT "   N/*S* ";   '@32ae4 DS:2c00
    CALL MIXT_07f1_LimpaTeclado   '@32af2
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f20$   '@32afc DS:2ad4 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    LOCATE 25, 1   '@32b16
    PRINT RT_TAB$(79); ""; " ";   '@32b31 DS:2ad4,2c0e
    IF NOT (UCASE$(V_0f20$) = "N") THEN GOTO L_32b76   '@32b51 DS:2b18
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_325f9   '@32b6e
L_32b76:
    L_BPec! = 1.0   '@32b76 DS:2b1e
    IF NOT (V_0ef0! = 1.0) THEN GOTO L_32c21   '@32b87 DS:2b1e
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(2000.0 + FX##(V_0f14!))   '@32ba2 DS:2c14
    A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BPc0!))) = RT_CINT%(3000.0 + FX##(V_0f0c!))   '@32bdf DS:2c18
L_32c21:
    IF NOT (V_0ef0! = 2.0) THEN GOTO L_32cbb   '@32c21 DS:2b2e
    A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BPc0!))) = RT_CINT%(2000.0 + FX##(V_0f0c!))   '@32c3c DS:2c14
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(3000.0 + FX##(V_0f14!))   '@32c79 DS:2c18
L_32cbb:
    IF NOT (V_0ef0! = 3.0) THEN GOTO L_32d55   '@32cbb DS:2bce
    A_1a2c%(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(L_BPc0!))) = RT_CINT%(4000.0 + FX##(V_0f0c!))   '@32cd6 DS:2c1c
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f04!))) = RT_CINT%(4000.0 + FX##(V_0f14!))   '@32d13 DS:2c1c
L_32d55:
    RT_VIEWPRINT 24, 25   '@32d55
    RT_CLS 2   '@32d67
    RT_VIEWPRINT 1, 25   '@32d75
    LOCATE 24, 1   '@32d87
    PRINT " Aguarde .."   '@32da2 DS:2ac4
    GOTO L_32de9   '@32db0
L_32dbd:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT L_BPc0!   '@32dbd DS:2b1e
L_32de9:
    IF NOT (A_11b2%(RT_CINT%(FX##(V_0f14!)), 0) >= L_BPc0!) THEN GOTO L_32e29   '@32de9
    GOTO L_32e5f   '@32e21
L_32e29:
L_32e2e:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@32e33 DS:2b1e
L_32e5f:
L_32e64:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f04!   '@32e64 DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@32e90 DS:2b1e
    L_BP18a! = A_11b2%(0, 0)   '@32ebc
    FOR V_0f0c! = 1.0 TO L_BP18a!   '@32ee1 DS:2b1e
    L_BP18e! = A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) - 1   '@32ee8
    FOR V_0f10! = 1.0 TO L_BP18e!   '@32f18 DS:2b1e
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) < 2000 AND (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) > 1000 AND (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) < 2000 AND A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) > 1000))) THEN GOTO L_337f0   '@32f20 DS:2b1e
    IF NOT (A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) <> A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) AND A_1128$(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) - 1000) = A_1128$(A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) - 1000)) THEN GOTO L_337eb   '@32ff8 DS:2b1e
    V_0f04! = A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) - 1000   '@330df
    V_0ef0! = A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) - 1000   '@33118 DS:2b1e
    L_BP2e! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 0)   '@33156
    L_BP36! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))), 1)   '@33199
    L_BP32! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)), 0)   '@331dd DS:2b1e
    L_BP3a! = A_1070!(A_11b2%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)), 1)   '@33225 DS:2b1e
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f04!)), 3) = L_BP3a! AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 2) = L_BP32! AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 1) = L_BP36! AND A_1156!(RT_CINT%(FX##(V_0f04!)), 0) = L_BP2e!))) THEN GOTO L_333cc   '@3326e
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = RT_CINT%(1000.0 + FX##(V_0f04!))   '@33348 DS:2b2a
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) = RT_CINT%(1000.0 + FX##(V_0f04!))   '@33385 DS:2b1e,2b2a
L_333cc:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0f04!)), 3) = L_BP36! AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 2) = L_BP2e! AND (A_1156!(RT_CINT%(FX##(V_0f04!)), 1) = L_BP3a! AND A_1156!(RT_CINT%(FX##(V_0f04!)), 0) = L_BP32!))) THEN GOTO L_3352a   '@333cc
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = RT_CINT%(1000.0 + FX##(V_0f04!))   '@334a6 DS:2b2a
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) = RT_CINT%(1000.0 + FX##(V_0f04!))   '@334e3 DS:2b1e,2b2a
L_3352a:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0ef0!)), 3) = L_BP3a! AND (A_1156!(RT_CINT%(FX##(V_0ef0!)), 2) = L_BP32! AND (A_1156!(RT_CINT%(FX##(V_0ef0!)), 1) = L_BP36! AND A_1156!(RT_CINT%(FX##(V_0ef0!)), 0) = L_BP2e!))) THEN GOTO L_33688   '@3352a
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = RT_CINT%(1000.0 + FX##(V_0ef0!))   '@33604 DS:2b2a
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) = RT_CINT%(1000.0 + FX##(V_0ef0!))   '@33641 DS:2b1e,2b2a
L_33688:
    IF NOT (A_1156!(RT_CINT%(FX##(V_0ef0!)), 3) = L_BP36! AND (A_1156!(RT_CINT%(FX##(V_0ef0!)), 2) = L_BP2e! AND (A_1156!(RT_CINT%(FX##(V_0ef0!)), 1) = L_BP3a! AND A_1156!(RT_CINT%(FX##(V_0ef0!)), 0) = L_BP32!))) THEN GOTO L_337e6   '@33688
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!))) = RT_CINT%(1000.0 + FX##(V_0ef0!))   '@33762 DS:2b2a
    A_1a2c%(RT_CINT%(FX##(V_0f0c!)), RT_CINT%(FX##(V_0f10!) + 1.0)) = RT_CINT%(1000.0 + FX##(V_0ef0!))   '@3379f DS:2b1e,2b2a
L_337e6:
L_337eb:
L_337f0:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@337f0 DS:2b1e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@3381c DS:2b1e
    RT_VIEWPRINT 24, 25   '@33848
    RT_CLS 2   '@3385a
    RT_VIEWPRINT 1, 25   '@33868
    IF NOT (L_BPec! = 0.0) THEN GOTO L_3389f   '@3387a DS:2b26
    RETURN   '@33895
L_3389f:
    LOCATE 24, 1   '@3389f
    PRINT " Indexacoes de Vigas estao corretas  N/*S* ";   '@338ba DS:2c20
    CALL MIXT_07f1_LimpaTeclado   '@338c8
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUT "", V_0f18$   '@338d2 DS:2ad4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (UCASE$(V_0f18$) = "N") THEN GOTO L_33911   '@338ec DS:2b18
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_312b3   '@33909
L_33911:
    RETURN   '@33911
L_33920:   ' sub-rotina (alvo de GOSUB); entrada vinda de 03014b_FUN_3000_014b
    RT_VIEWPRINT 23, 25   '@33925
    RT_CLS 2   '@33937
    PRINT " Definicao do Peso Proprio das Vigas"   '@33945 DS:2c50
    PRINT "    Peso Proprio PREDOMINANTE "; V_0de0$; "/"; V_0ddc$;   '@33953 DS:2c78,2c9a
    CALL MIXT_07f1_LimpaTeclado   '@3397c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " ", V_0f18$   '@33986 DS:2c0e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP190% = (VAL(V_0f18$) < 0.0#)   '@339a0 DS:2b84
    IF NOT ((LEN(V_0f18$) = 0 OR L_BP190%) <> 0) THEN GOTO L_339f9   '@339cf
    BEEP   '@339e7
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33920   '@339f1
L_339f9:
    L_BP194! = A_11b2%(0, 0)   '@339f9
    FOR V_0f0c! = 1.0 TO L_BP194!   '@33a1e DS:2b1e
    A_11b2%(RT_CINT%(FX##(V_0f0c!)), A_11b2%(RT_CINT%(FX##(V_0f0c!)), 0) + 1) = RT_CINT%(FX##(VAL(V_0f18$)) * V_0dec! / V_0de8! * 1000.0#)   '@33a26 DS:2ca0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f0c!   '@33a8d DS:2b1e
L_33abe:
    RT_VIEWPRINT 25, 25   '@33ac3
    RT_CLS 2   '@33ad2
    RT_VIEWPRINT 1, 25   '@33ae0
    LOCATE 25, 1   '@33af2
    PRINT "    Viga com peso diferente *NENHUMA* ";   '@33b0d DS:2ca8
    CALL MIXT_07f1_LimpaTeclado   '@33b1b
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV "", V_0f18$   '@33b25 DS:2ad4 (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_33b5e   '@33b3f
    RETURN   '@33b54
L_33b5e:
    V_0ef0! = VAL(V_0f18$)   '@33b5e
    L_BP196% = (FX##(V_0ef0!) - V_0e5c! > A_11b2%(0, 0) OR FX##(V_0ef0!) - V_0e5c! < FX##(1.0))   '@33b78 DS:2b1e
    IF NOT ((INT(FX##(V_0ef0!)) <> FX##(V_0ef0!) OR L_BP196%) <> 0) THEN GOTO L_33c0f   '@33be0
    BEEP   '@33bfd
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33abe   '@33c07
L_33c0f:
    V_0ef0! = FX##(V_0ef0!) - V_0e5c!   '@33c0f
L_33c2a:
    LOCATE 25, 50   '@33c2f
    PRINT "Peso "; V_0de0$; "/"; V_0ddc$;   '@33c4d DS:2c9a,2cd2
    CALL MIXT_07f1_LimpaTeclado   '@33c76
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    RT_LINEINPUTPV " ", V_0f18$   '@33c80 DS:2c0e (LINE INPUT ; (B$LNIN 3))
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (LEN(V_0f18$) = 0) THEN GOTO L_33cc1   '@33c9a
    BEEP   '@33caf
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33abe   '@33cb9
L_33cc1:
    IF NOT (VAL(V_0f18$) < 0.0#) THEN GOTO L_33cf7   '@33cc1 DS:2b84
    BEEP   '@33ce5
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33c2a   '@33cef
L_33cf7:
    A_11b2%(RT_CINT%(FX##(V_0ef0!)), A_11b2%(RT_CINT%(FX##(V_0ef0!)), 0) + 1) = RT_CINT%(FX##(VAL(V_0f18$)) * V_0dec! / V_0de8! * 1000.0#)   '@33cf7 DS:2ca0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_33abe   '@33d5e
    ' ---- FUN_3000_3d6b @0x33d6b  (033d6b_FUN_3000_3d6b.lift.txt; evidence_id (assembly): ev_b84c9b0d1b08cf1bf063b60afd72b98157c7206afb066ac5f93b76774525c4a7)
L_33d6b:   ' entrada vinda de 03014b_FUN_3000_014b
    ERASE L_BP60%   '@33d6b
    ' END SUB   '@33d74
END SUB

SUB S_33d84   ' entrada de SUB/FUNCTION (B$ENRA, locais 0 bytes) (0x33d84)
    ' ---- FUN_3000_3d84 @0x33d84  (033d84_FUN_3000_3d84.lift.txt; evidence_id (assembly): ev_eaf519dca1604959ee168adff2baa49f8d9adefa13ea2b04959c0dc88d8b2a10)
    V_168a$ = RT_FIX$(V_0e60$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e5c!) + V_0f0c!))), 20)   '@33d8c (string fixa)
    V_169e$ = RT_FIX$(RT_MID$((RT_DATE$), (1), (5)), 5)   '@33dcd (string fixa)
    V_16a3% = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 0)   '@33df8
    V_16a5% = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 1)   '@33e1d
    V_16a7% = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 2)   '@33e43
    V_16a9% = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 3)   '@33e66
    V_16ab% = A_1bda%(RT_CINT%(FX##(V_0f0c!)), 4)   '@33e8c
    V_16ad% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 0)   '@33eb2
    V_16af% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 0)   '@33ed7
    V_16b1! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 0)   '@33efc
    V_16b5! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 0)   '@33f26
    V_16b9% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 1)   '@33f50
    V_16bb% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 1)   '@33f76
    V_16bd! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 1)   '@33f9c
    V_16c1! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 1)   '@33fc7
    V_16c5% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 2)   '@33ff2
    V_16c7% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 2)   '@34015
    V_16c9! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 2)   '@34038
    V_16cd! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 2)   '@34060
    V_16d1% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 3)   '@34088
    V_16d3% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 3)   '@340ae
    V_16d5! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 3)   '@340d4
    V_16d9! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 3)   '@340ff
    V_16dd% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 4)   '@3412a
    V_16df% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 4)   '@34150
    V_16e1! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34176
    V_16e5! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 4)   '@341a1
    V_16e9% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 5)   '@341cc
    V_16eb% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 5)   '@341f2
    V_16ed! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34218
    V_16f1! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34243
    V_16f5% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 6)   '@3426e
    V_16f7% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 6)   '@34294
    V_16f9! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 6)   '@342ba
    V_16fd! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 6)   '@342e5
    V_1701% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 7)   '@34310
    V_1703% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 7)   '@34336
    V_1705! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 7)   '@3435c
    V_1709! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34387
    V_170d% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 8)   '@343b2
    V_170f% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 8)   '@343d8
    V_1711! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 8)   '@343fe
    V_1715! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34429
    V_1719% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 9)   '@34454
    V_171b% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 9)   '@3447a
    V_171d! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 9)   '@344a0
    V_1721! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 9)   '@344cb
    V_1725% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 10)   '@344f6
    V_1727% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 10)   '@3451c
    V_1729! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 10)   '@34542
    V_172d! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 10)   '@3456d
    V_1731% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 11)   '@34598
    V_1733% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 11)   '@345be
    V_1735! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 11)   '@345e4
    V_1739! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 11)   '@3460f
    V_173d% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 12)   '@3463a
    V_173f% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 12)   '@34660
    V_1741! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 12)   '@34686
    V_1745! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 12)   '@346b1
    V_1749% = A_1c64%(RT_CINT%(FX##(V_0f0c!)), 13)   '@346dc
    V_174b% = A_1c92%(RT_CINT%(FX##(V_0f0c!)), 13)   '@34702
    V_174d! = A_1c08!(RT_CINT%(FX##(V_0f0c!)), 13)   '@34728
    V_1751! = A_1c36!(RT_CINT%(FX##(V_0f0c!)), 13)   '@34753
    V_1761! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 0)   '@3477e
    V_1765! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 0)   '@347a8
    V_1769! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 0)   '@347d2
    V_176d! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 0)   '@347fc
    V_1771! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 0)   '@34826
    V_1775! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 1)   '@34850
    V_1779! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 1)   '@3487b
    V_177d! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 1)   '@348a6
    V_1781! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 1)   '@348d1
    V_1785! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 1)   '@348fc
    V_1789! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 2)   '@34927
    V_178d! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3494f
    V_1791! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 2)   '@34977
    V_1795! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 2)   '@3499f
    V_1799! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 2)   '@349c7
    V_179d! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 3)   '@349ef
    V_17a1! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 3)   '@34a1a
    V_17a5! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 3)   '@34a45
    V_17a9! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 3)   '@34a70
    V_17ad! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 3)   '@34a9b
    V_17b1! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34ac6
    V_17b5! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34af1
    V_17b9! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34b1c
    V_17bd! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34b47
    V_17c1! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 4)   '@34b72
    V_17c5! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34b9d
    V_17c9! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34bc8
    V_17cd! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34bf3
    V_17d1! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34c1e
    V_17d5! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 5)   '@34c49
    V_17d9! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 6)   '@34c74
    V_17dd! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 6)   '@34c9f
    V_17e1! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 6)   '@34cca
    V_17e5! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 6)   '@34cf5
    V_17e9! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 6)   '@34d20
    V_17ed! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34d4b
    V_17f1! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34d76
    V_17f5! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34da1
    V_17f9! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34dcc
    V_17fd! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 7)   '@34df7
    V_1801! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34e22
    V_1805! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34e4d
    V_1809! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34e78
    V_180d! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34ea3
    V_1811! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 8)   '@34ece
    V_1815! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 9)   '@34ef9
    V_1819! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 9)   '@34f24
    V_181d! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 9)   '@34f4f
    V_1821! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 9)   '@34f7a
    V_1825! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 9)   '@34fa5
    V_1829! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 10)   '@34fd0
    V_182d! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 10)   '@34ffb
    V_1831! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 10)   '@35026
    V_1835! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 10)   '@35051
    V_1839! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 10)   '@3507c
    V_183d! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 11)   '@350a7
    V_1841! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 11)   '@350d2
    V_1845! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 11)   '@350fd
    V_1849! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 11)   '@35128
    V_184d! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 11)   '@35153
    V_1851! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 12)   '@3517e
    V_1855! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 12)   '@351a9
    V_1859! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 12)   '@351d4
    V_185d! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 12)   '@351ff
    V_1861! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 12)   '@3522a
    V_1865! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 13)   '@35255
    V_1869! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 13)   '@35280
    V_186d! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 13)   '@352ab
    V_1871! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 13)   '@352d6
    V_1875! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 13)   '@35301
    V_1879! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 14)   '@3532c
    V_187d! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 14)   '@35357
    V_1881! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 14)   '@35382
    V_1885! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 14)   '@353ad
    V_1889! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 14)   '@353d8
    V_188d! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 15)   '@35403
    V_1891! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 15)   '@3542e
    V_1895! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 15)   '@35459
    V_1899! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 15)   '@35484
    V_189d! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 15)   '@354af
    V_18a1! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 16)   '@354da
    V_18a5! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 16)   '@35505
    V_18a9! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 16)   '@35530
    V_18ad! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 16)   '@3555b
    V_18b1! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 16)   '@35586
    V_18b5! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 17)   '@355b1
    V_18b9! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 17)   '@355dc
    V_18bd! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 17)   '@35607
    V_18c1! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 17)   '@35632
    V_18c5! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 17)   '@3565d
    V_18c9! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 18)   '@35688
    V_18cd! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 18)   '@356b3
    V_18d1! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 18)   '@356de
    V_18d5! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 18)   '@35709
    V_18d9! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 18)   '@35734
    V_18dd! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 19)   '@3575f
    V_18e1! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 19)   '@3578a
    V_18e5! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 19)   '@357b5
    V_18e9! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 19)   '@357e0
    V_18ed! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 19)   '@3580b
    V_18f1! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 20)   '@35836
    V_18f5! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 20)   '@35861
    V_18f9! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 20)   '@3588c
    V_18fd! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 20)   '@358b7
    V_1901! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 20)   '@358e2
    V_1905! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 21)   '@3590d
    V_1909! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 21)   '@35938
    V_190d! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 21)   '@35963
    V_1911! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 21)   '@3598e
    V_1915! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 21)   '@359b9
    V_1919! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 22)   '@359e4
    V_191d! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 22)   '@35a0f
    V_1921! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 22)   '@35a3a
    V_1925! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 22)   '@35a65
    V_1929! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 22)   '@35a90
    V_192d! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 23)   '@35abb
    V_1931! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 23)   '@35ae6
    V_1935! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 23)   '@35b11
    V_1939! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 23)   '@35b3c
    V_193d! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 23)   '@35b67
    V_1941! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 24)   '@35b92
    V_1945! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 24)   '@35bbd
    V_1949! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 24)   '@35be8
    V_194d! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 24)   '@35c13
    V_1951! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 24)   '@35c3e
    V_1955! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 25)   '@35c69
    V_1959! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 25)   '@35c94
    V_195d! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 25)   '@35cbf
    V_1961! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 25)   '@35cea
    V_1965! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 25)   '@35d15
    V_1969! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 26)   '@35d40
    V_196d! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 26)   '@35d6b
    V_1971! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 26)   '@35d96
    V_1975! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 26)   '@35dc1
    V_1979! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 26)   '@35dec
    V_197d! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 27)   '@35e17
    V_1981! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 27)   '@35e42
    V_1985! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 27)   '@35e6d
    V_1989! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 27)   '@35e98
    V_198d! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 27)   '@35ec3
    V_1991! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 28)   '@35eee
    V_1995! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 28)   '@35f19
    V_1999! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 28)   '@35f44
    V_199d! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 28)   '@35f6f
    V_19a1! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 28)   '@35f9a
    V_19a5! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 29)   '@35fc5
    V_19a9! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 29)   '@35ff0
    V_19ad! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 29)   '@3601b
    V_19b1! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 29)   '@36046
    V_19b5! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 29)   '@36071
    V_19b9! = A_1af4!(RT_CINT%(FX##(V_0f0c!)), 30)   '@3609c
    V_19bd! = A_1b50!(RT_CINT%(FX##(V_0f0c!)), 30)   '@360c7
    V_19c1! = A_1b7e!(RT_CINT%(FX##(V_0f0c!)), 30)   '@360f2
    V_19c5! = A_1b22!(RT_CINT%(FX##(V_0f0c!)), 30)   '@3611d
    V_19c9! = A_1bac!(RT_CINT%(FX##(V_0f0c!)), 30)   '@36148
    V_19cd! = 0.0   '@36173 DS:2b26
    V_19d1! = 0.0   '@36184 DS:2b26
    ' END SUB   '@36195
END SUB

SUB S_401b9   ' entrada de SUB/FUNCTION (B$ENRA, locais 552 bytes) (0x401b9)
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
    ' ---- FUN_4000_01b9 @0x401b9  (0401b9_FUN_4000_01b9.lift.txt; evidence_id (assembly): ev_7b460b916269fa44a633def4cf69b0f4f02add94532ddff6bde29a62757e4d19)
    REDIM L_BP40!(0 TO 20, 0 TO 2)   '@401c6
    V_1672! = A_0f8a!(1, 1)   '@401ea
    V_1676! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 1))), 1)   '@4020b
    V_167a! = A_0f8a!(1, 0)   '@40248
    V_167e! = A_0f8a!(RT_CINT%(FX##(A_0f8a!(0, 0))), 0)   '@4026b
    V_1682! = 560.0 / (FX##(V_1676!) - V_1672!)   '@402a4 DS:2ce0
    V_1686! = 145.0 / (FX##(V_167e!) - V_167a!)   '@402c2 DS:2ce4
    IF NOT (FX##(V_1686!) / V_1682! > 0.41670000553131103515625##) THEN GOTO L_4031e   '@402e0 DS:2ce8
    V_1686! = V_1682! * 0.41670000553131103515625##   '@40300 DS:2ce8
    GOTO L_40339   '@40316
L_4031e:
    V_1682! = V_1686! / 0.41670000553131103515625##   '@4031e DS:2ce8
L_40339:
    V_166a! = 45.0   '@40339 DS:2cec
    V_166e! = 10.0   '@4034a DS:2cf0
    V_15e6! = 0.0   '@4035b DS:2cf4
    V_0f10! = 1.0   '@4036c DS:2cf8
L_40382:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f10!)), 1) <> 2.0) THEN GOTO L_403cd   '@40382 DS:2cfc
    V_15e6! = FX##(V_15e6!) + 1.0   '@403b7 DS:2cf8
L_403cd:
    V_0f10! = FX##(V_0f10!) + 1.0   '@403cd DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF V_0f10! <= V_0f0c! THEN GOTO L_40382   '@403e3
    RT_VIEWPRINT 24, 25   '@403fb
    RT_CLS 2   '@4040d
    RT_VIEWPRINT 1, 25   '@4041b
    LOCATE 24, 1   '@4042d
    PRINT "    Cargas da Laje "; V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_15e6!)))   '@40448 DS:2d00
    PRINT "    Aguarde ..";   '@40485 DS:2d18
    V_0f20$ = V_0e58_prefixolaje$ + LTRIM$(STR$(RT_SNG!(FX##(V_0e54_nivellaje!) + V_15e6!)))   '@40493
    GOSUB L_404e5   '@404cb
    GOTO L_4f855   '@404d8
    ' ---- F_404e0 @0x404e0  (0404e0_F_404e0.lift.txt; evidence_id (assembly): ev_ee616115fcb6dac82a6253212ce1793ef3355c05739c28abde273e1d7a2f9d0f)
L_404e5:   ' sub-rotina (alvo de GOSUB); entrada vinda de 0401b9_FUN_4000_01b9
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@404ea
    REDIM A_19fe!(-32768 TO -32768, -32768 TO -32768)   '@404f8
    REDIM A_14a4!(-32768 TO -32768, -32768 TO -32768)   '@40501
    REDIM A_1342%(0 TO V_0e50%, 0 TO 30)   '@4050a
    REDIM A_19fe!(0 TO 100, 0 TO 3)   '@4052c
    REDIM A_14a4!(0 TO 30, 0 TO 2)   '@40550
    V_15e6! = A_10cc!(RT_CINT%(FX##(V_0f0c!)), 0)   '@40574
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 2.0) THEN GOTO L_405dd   '@4059e DS:2cfc
    RETURN   '@405d3
L_405dd:
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_40629   '@405dd DS:2cf8
    CALL S_15790   '@40612
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    GOTO L_4b11c   '@4061c
L_40629:
    V_1536! = 1.0   '@40629 DS:2cf8
    L_BP44! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4063a
    FOR V_0f10! = 1.0 TO L_BP44!   '@40669 DS:2cf8
    V_15ea! = V_0f10!   '@40670
    V_15ee! = FX##(V_0f10!) - 1.0   '@40681 DS:2d2a
    V_15f2! = FX##(V_0f10!) + 1.0   '@40697 DS:2cf8
    IF NOT (V_15ee! = 0.0) THEN GOTO L_406f7   '@406ad DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@406c8
L_406f7:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_40740   '@406f7
    V_15f2! = 1.0   '@4072f DS:2cf8
L_40740:
    V_1526! = 1.0   '@40740 DS:2cf8
    V_15fa! = V_15ee!   '@40751
    V_15fe! = V_15ea!   '@40762
    V_1602! = V_15ea!   '@40773
    V_1606! = V_15f2!   '@40784
    CALL S_13a73   '@40795
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP48! = FX##(V_1512#) / 1.0#   '@4079f DS:2d2e
    L_BP4c! = FX##(V_151a#) / 1.0#   '@407b5 DS:2d2e
    CALL MIXT_082a_Maior(L_BP48!, L_BP4c!, L_BP50!)   '@407c4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP54! = FX##(V_1512#) / 1.0#   '@407d6 DS:2d2e
    L_BP58! = FX##(V_151a#) / 1.0#   '@407e6 DS:2d2e
    CALL MIXT_0877_Menor(L_BP54!, L_BP58!, L_BP5c!)   '@407f5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP50!) - L_BP5c! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_40856   '@40807
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 0) = -100.0   '@40827 DS:2d36
L_40856:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@40856 DS:2cf8
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@40881
    REDIM A_1342%(0 TO A_109e%(CINT(V_15e6!), 0), 0 TO 0)   '@4088f
    V_1536! = 1.0   '@408c9 DS:2cf8
    L_BP60! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@408da
    FOR V_0f10! = 1.0 TO L_BP60!   '@40909 DS:2cf8
    V_15ea! = V_0f10!   '@40910
    V_15ee! = FX##(V_0f10!) - 1.0   '@40921 DS:2d2a
    V_15f2! = FX##(V_0f10!) + 1.0   '@40937 DS:2cf8
    IF NOT (V_15ee! = 0.0) THEN GOTO L_40997   '@4094d DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@40968
L_40997:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_409e0   '@40997
    V_15f2! = 1.0   '@409cf DS:2cf8
L_409e0:
    V_15ca! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 0)   '@409e0
    V_15ce! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 1)   '@40a24
    V_15ba! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 0)   '@40a69
    V_15be! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 1)   '@40aad
    V_15c2! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 0)   '@40af2
    V_15c6! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 1)   '@40b36
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1) THEN GOTO L_40d9c   '@40b7b
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@40bad DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ea!   '@40be1
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = (FX##(V_15ca!) + V_15c2!) / 2.0   '@40c1d DS:2cfc
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = (FX##(V_15ce!) + V_15c6!) / 2.0   '@40c5e DS:2cfc
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@40ca2 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15f2!   '@40cd6
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = (FX##(V_15ca!) + V_15c2!) / 2.0   '@40d12 DS:2cfc
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = (FX##(V_15ce!) + V_15c6!) / 2.0   '@40d53 DS:2cfc
L_40d9c:
    V_1526! = 1.0   '@40d9c DS:2cf8
    V_15fa! = V_15ee!   '@40dad
    V_15fe! = V_15ea!   '@40dbe
    V_1602! = V_15ea!   '@40dcf
    V_1606! = V_15f2!   '@40de0
    CALL S_13a73   '@40df1
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f1c$ = ""   '@40dfb DS:2d3a
    L_BP64! = FX##(V_1512#) / 1.0#   '@40e0d DS:2d2e
    L_BP68! = FX##(V_151a#) / 1.0#   '@40e23 DS:2d2e
    CALL MIXT_082a_Maior(L_BP64!, L_BP68!, L_BP6c!)   '@40e32
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP70! = FX##(V_1512#) / 1.0#   '@40e44 DS:2d2e
    L_BP74! = FX##(V_151a#) / 1.0#   '@40e54 DS:2d2e
    CALL MIXT_0877_Menor(L_BP70!, L_BP74!, L_BP78!)   '@40e63
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP6c!) - L_BP78! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_40eac   '@40e75
    V_0f1c$ = "NAO"   '@40e95 DS:2d3e
L_40eac:
    V_14f2# = V_150a#   '@40eac
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_40f39   '@40ebd
    V_0f1c$ = "NAO"   '@40f27 DS:2d3e
L_40f39:
L_40f3e:
    V_152e! = 1.0   '@40f43 DS:2cf8
    V_15fa! = FX##(V_15f2!) - 1.0   '@40f54 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_40fb4   '@40f6a DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@40f85
L_40fb4:
    V_15fe! = V_15f2!   '@40fb4
    V_1602! = V_15f2!   '@40fc5
    V_1606! = FX##(V_15f2!) + 1.0   '@40fd6 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_41035   '@40fec
    V_1606! = 1.0   '@41024 DS:2cf8
L_41035:
    CALL S_13a73   '@41035
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP7c! = FX##(V_1512#) / 1.0#   '@4103f DS:2d2e
    L_BP80! = FX##(V_151a#) / 1.0#   '@41055 DS:2d2e
    CALL MIXT_082a_Maior(L_BP7c!, L_BP80!, L_BP84!)   '@41064
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP88! = FX##(V_1512#) / 1.0#   '@41077 DS:2d2e
    L_BP8c! = FX##(V_151a#) / 1.0#   '@41088 DS:2d2e
    CALL MIXT_0877_Menor(L_BP88!, L_BP8c!, L_BP90!)   '@41098
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP84!) - L_BP90! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_4121b   '@410ad
    V_15f2! = FX##(V_15f2!) + 1.0   '@410cf DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_4112e   '@410e5
    V_15f2! = 1.0   '@4111d DS:2cf8
L_4112e:
    L_BP92% = (V_15f2! <> V_15ea!)   '@4112e
    IF NOT ((V_0f1c$ <> "NAO" AND L_BP92%) <> 0) THEN GOTO L_41204   '@41158 DS:2d3e
    V_15c2! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 0)   '@4116e
    V_15c6! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 1)   '@411b2
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_40f3e   '@411f7
L_41204:
    V_0f1c$ = "NAO"   '@41204 DS:2d3e
L_4121b:
    V_14fa# = V_150a#   '@4121b
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_412a8   '@4122c
    V_0f1c$ = "NAO"   '@41296 DS:2d3e
L_412a8:
    V_164a# = V_15ca!   '@412a8
    V_165a# = V_15ce!   '@412b9
    V_14e2# = V_14f2#   '@412ca
    V_1652# = V_15c2!   '@412db
    V_1662# = V_15c6!   '@412ec
    V_14ea# = V_14fa#   '@412fd
    CALL S_15189   '@4130e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP96$ = V_0f18$   '@41318
    V_157a# = V_0ef4#   '@4132b
    V_1582# = V_0efc#   '@4133c
    L_BP98% = (L_BP96$ <> "NAO")   '@4134d DS:2d3e
    IF NOT ((V_0f1c$ <> "NAO" AND L_BP98%) <> 0) THEN GOTO L_415cf   '@41374 DS:2d3e
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 0) = V_157a#   '@4138a
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) = V_1582#   '@413b4
    V_15fa! = V_15ee!   '@413df
    V_15fe! = V_15ea!   '@413f0
    V_1602! = V_15f2!   '@41401
    V_1606! = FX##(V_15f2!) + 1.0   '@41412 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_41471   '@41428
    V_1606! = 1.0   '@41460 DS:2cf8
L_41471:
    CALL S_13a73   '@41471
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = V_150a#   '@4147b
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) <> 1 AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_41535   '@414a3
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = V_1512#   '@4150d
L_41535:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) <> 1 AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1) THEN GOTO L_415c7   '@41535
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = V_151a#   '@4159f
L_415c7:
    GOTO L_415fc   '@415c7
L_415cf:
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = 100.0   '@415cf DS:2d46
L_415fc:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@415fc DS:2cf8
    L_BP9c! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@41627
    FOR V_0f10! = 1.0 TO L_BP9c!   '@41657 DS:2cf8
    V_15ea! = V_0f10!   '@4165e
    V_15ee! = FX##(V_0f10!) - 1.0   '@4166f DS:2d2a
    V_15f2! = FX##(V_0f10!) + 1.0   '@41685 DS:2cf8
    IF NOT (V_15ee! = 0.0) THEN GOTO L_416e5   '@4169b DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@416b6
L_416e5:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_4172e   '@416e5
    V_15f2! = 1.0   '@4171d DS:2cf8
L_4172e:
    V_15ca! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 0)   '@4172e
    V_15ce! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 1)   '@41772
L_417bc:
    V_15c2! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 0)   '@417c1
    V_15c6! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 1)   '@41805
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) = 100.0) THEN GOTO L_41a1e   '@4184a DS:2d46
    V_15fa! = FX##(V_15f2!) - 1.0   '@4187c DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_418dc   '@41892 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@418ad
L_418dc:
    V_15fe! = V_15f2!   '@418dc
    V_1602! = V_15f2!   '@418ed
    V_1606! = FX##(V_15f2!) + 1.0   '@418fe DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_4195d   '@41914
    V_1606! = 1.0   '@4194c DS:2cf8
L_4195d:
    CALL S_13a73   '@4195d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPa0! = FX##(V_1512#) / 1.0#   '@41967 DS:2d2e
    L_BPa4! = FX##(V_151a#) / 1.0#   '@4197e DS:2d2e
    CALL MIXT_082a_Maior(L_BPa0!, L_BPa4!, L_BPa8!)   '@4198e
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPac! = FX##(V_1512#) / 1.0#   '@419a3 DS:2d2e
    L_BPb0! = FX##(V_151a#) / 1.0#   '@419b4 DS:2d2e
    CALL MIXT_0877_Menor(L_BPac!, L_BPb0!, L_BPb4!)   '@419c4
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPa8!) - L_BPb4! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_41a19   '@419d9
    V_15f2! = V_1606!   '@419fb
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_417bc   '@41a0c
L_41a19:
L_41a1e:
L_41a23:
    V_15ba! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 0)   '@41a28
    V_15be! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 1)   '@41a6c
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) = 100.0) THEN GOTO L_41c96   '@41ab1 DS:2d46
    V_152a! = 1.0   '@41ae3 DS:2cf8
    V_15fa! = FX##(V_15ee!) - 1.0   '@41af4 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_41b54   '@41b0a DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@41b25
L_41b54:
    V_15fe! = V_15ee!   '@41b54
    V_1602! = V_15ee!   '@41b65
    V_1606! = FX##(V_15ee!) + 1.0   '@41b76 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_41bd5   '@41b8c
    V_1606! = 1.0   '@41bc4 DS:2cf8
L_41bd5:
    CALL S_13a73   '@41bd5
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPb8! = FX##(V_1512#) / 1.0#   '@41bdf DS:2d2e
    L_BPbc! = FX##(V_151a#) / 1.0#   '@41bf6 DS:2d2e
    CALL MIXT_082a_Maior(L_BPb8!, L_BPbc!, L_BPc0!)   '@41c06
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPc4! = FX##(V_1512#) / 1.0#   '@41c1b DS:2d2e
    L_BPc8! = FX##(V_151a#) / 1.0#   '@41c2c DS:2d2e
    CALL MIXT_0877_Menor(L_BPc4!, L_BPc8!, L_BPcc!)   '@41c3c
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPc0!) - L_BPcc! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_41c91   '@41c51
    V_15ee! = V_15fa!   '@41c73
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_41a23   '@41c84
L_41c91:
L_41c96:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) <> 100.0) THEN GOTO L_41f37   '@41c96 DS:2d46
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) <> 100.0) THEN GOTO L_41dfd   '@41cc8 DS:2d46
    IF NOT (RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 1)) - V_15ce!), (2.0)) >= RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ee!)), 0)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ee!)), 1)) - V_15ce!), (2.0))) THEN GOTO L_41df8   '@41cfa DS:2cfc
    A_1342%(RT_CINT%(FX##(V_15ea!)), 0) = 100   '@41dcf
L_41df8:
L_41dfd:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) <> 100.0) THEN GOTO L_41f32   '@41dfd DS:2d46
    IF NOT (RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) - V_15c2!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 1)) - V_15c6!), (2.0)) >= RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15f2!)), 0)) - V_15c2!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15f2!)), 1)) - V_15c6!), (2.0))) THEN GOTO L_41f2d   '@41e2f DS:2cfc
    A_1342%(RT_CINT%(FX##(V_15ea!)), 0) = 100   '@41f04
L_41f2d:
L_41f32:
L_41f37:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41f37 DS:2cf8
    L_BPd0! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@41f63
    FOR V_0f10! = 1.0 TO L_BPd0!   '@41f93 DS:2cf8
    IF NOT (A_1342%(RT_CINT%(FX##(V_0f10!)), 0) = 100) THEN GOTO L_41fec   '@41f9a
    A_14a4!(RT_CINT%(FX##(V_0f10!)), 2) = 100.0   '@41fc4 DS:2d46
L_41fec:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@41fec DS:2cf8
    V_0f10! = 1.0   '@42015 DS:2cf8
L_4202c:
    V_15ea! = V_0f10!   '@4202c
    V_0ef4# = 0.0#   '@4203d DS:2d4a
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) <> 100.0) THEN GOTO L_42383   '@4204e DS:2d46
    V_15f2! = FX##(V_0f10!) + 1.0   '@42080 DS:2cf8
L_4209b:
    V_0ef4# = FX##(V_0ef4#) + 1.0#   '@420a0 DS:2d2e
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_420ff   '@420b6
    V_15f2! = 1.0   '@420ee DS:2cf8
L_420ff:
    V_15fa! = FX##(V_15f2!) - 1.0   '@420ff DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4215f   '@42115 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@42130
L_4215f:
    V_15fe! = V_15f2!   '@4215f
    V_1602! = V_15f2!   '@42170
    V_1606! = FX##(V_15f2!) + 1.0   '@42181 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_421e0   '@42197
    V_1606! = 1.0   '@421cf DS:2cf8
L_421e0:
    CALL S_13a73   '@421e0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPd4! = FX##(V_1512#) / 1.0#   '@421ea DS:2d2e
    L_BPd8! = FX##(V_151a#) / 1.0#   '@42201 DS:2d2e
    CALL MIXT_082a_Maior(L_BPd4!, L_BPd8!, L_BPdc!)   '@42211
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BPe0! = FX##(V_1512#) / 1.0#   '@42226 DS:2d2e
    L_BPe4! = FX##(V_151a#) / 1.0#   '@42237 DS:2d2e
    CALL MIXT_0877_Menor(L_BPe0!, L_BPe4!, L_BPe8!)   '@42247
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BPdc!) - L_BPe8! - V_0e68_pi#) < FX##(V_133e!)) THEN GOTO L_422a1   '@4225c
    V_15f2! = FX##(V_15f2!) + 1.0   '@4227e DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4209b   '@42294
L_422a1:
    A_14a4!(RT_CINT%(FX##(V_15f2!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)   '@422a1
    A_14a4!(RT_CINT%(FX##(V_15f2!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 1)   '@422e4
    A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 2)   '@42329
    V_0f10! = FX##(V_0f10!) + V_0ef4#   '@42368
L_42383:
    V_0f10! = FX##(V_0f10!) + 1.0   '@42383 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1 < V_0f10!) THEN GOTO L_4202c   '@42399
    REDIM A_1342%(-32768 TO -32768, -32768 TO -32768)   '@423d2
    REDIM A_1342%(0 TO V_0e50%, 0 TO 30)   '@423e0
    L_BPec! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@42402
    FOR V_0f10! = 1.0 TO L_BPec!   '@42432 DS:2cf8
    V_15fe! = V_0f10!   '@4243a
    V_1602! = V_0f10!   '@4244b
    V_15fa! = FX##(V_0f10!) - 1.0   '@4245c DS:2d2a
    V_1606! = FX##(V_0f10!) + 1.0   '@42472 DS:2cf8
    IF NOT (V_15fa! = 0.0) THEN GOTO L_424d2   '@42488 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@424a3
L_424d2:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_4251b   '@424d2
    V_1606! = 1.0   '@4250a DS:2cf8
L_4251b:
    CALL S_13a73   '@4251b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_0f1c$ = ""   '@42525 DS:2d3a
    IF NOT (V_1512# < V_151a#) THEN GOTO L_4258c   '@42537
    IF NOT (FX##(V_1512#) + V_0e68_pi# < FX##(V_151a#)) THEN GOTO L_42584   '@42552
    V_0f1c$ = "NAO"   '@42572 DS:2d3e
L_42584:
    GOTO L_425c3   '@42584
L_4258c:
    IF NOT (FX##(V_151a#) + V_0e68_pi# > FX##(V_1512#)) THEN GOTO L_425be   '@4258c
    V_0f1c$ = "NAO"   '@425ac DS:2d3e
L_425be:
L_425c3:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_0f10!)), 2) <> 100.0 AND V_0f1c$ = "NAO") THEN GOTO L_43075   '@425c3 DS:2d3e,2d46
    V_15fa! = V_0f10!   '@42616
    V_164a# = A_14a4!(RT_CINT%(FX##(V_15fa!)), 0)   '@42627
    V_165a# = A_14a4!(RT_CINT%(FX##(V_15fa!)), 1)   '@42651
    V_14e2# = A_14a4!(RT_CINT%(FX##(V_15fa!)), 2)   '@4267c
    V_15fe! = V_15fa!   '@426a4
L_426ba:
    V_15fe! = FX##(V_15fe!) + 1.0   '@426ba DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fe!) THEN GOTO L_42719   '@426d0
    V_15fe! = 1.0   '@42708 DS:2cf8
L_42719:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = A_14a4!(RT_CINT%(FX##(V_15fa!)), 2) AND (A_14a4!(RT_CINT%(FX##(V_15fe!)), 1) = A_14a4!(RT_CINT%(FX##(V_15fa!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15fe!)), 0) = A_14a4!(RT_CINT%(FX##(V_15fa!)), 0))) THEN GOTO L_42812   '@42719
    GOTO L_4281a   '@4280a
L_42812:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_426ba   '@42812
L_4281a:
    V_1602! = V_15fa!   '@4281a
L_42830:
    V_1602! = FX##(V_1602!) + 1.0   '@42830 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1602!) THEN GOTO L_4288f   '@42846
    V_1602! = 1.0   '@4287e DS:2cf8
L_4288f:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_1602!)), 2) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 2) OR (A_14a4!(RT_CINT%(FX##(V_1602!)), 1) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 1) OR A_14a4!(RT_CINT%(FX##(V_1602!)), 0) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 0))) THEN GOTO L_42988   '@4288f
    GOTO L_42990   '@42980
L_42988:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42830   '@42988
L_42990:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_1602!)), 2) <> 100.0) THEN GOTO L_42c48   '@42990 DS:2d46
    V_1652# = A_14a4!(RT_CINT%(FX##(V_1602!)), 0)   '@429c2
    V_1662# = A_14a4!(RT_CINT%(FX##(V_1602!)), 1)   '@429ec
    V_14ea# = A_14a4!(RT_CINT%(FX##(V_1602!)), 2)   '@42a17
    CALL S_15189   '@42a3f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPee% = (V_0f18$ = "")   '@42a49 DS:2cfc,2d3a
    IF NOT ((RT_POT##((FX##(V_0ef4#) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)), (2.0#)) < RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15fa!)), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15fa!)), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)), (2.0)) AND L_BPee%) <> 0) THEN GOTO L_42c43   '@42ac6 DS:2cfc,2d52
    A_14a4!(RT_CINT%(FX##(V_15fa!)), 2) = 100.0   '@42be6 DS:2d46
    A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0   '@42c0e DS:2d46
    GOTO L_4307a   '@42c36
L_42c43:
L_42c48:
    V_1602! = V_15fa!   '@42c48
L_42c5e:
    V_1602! = FX##(V_1602!) - 1.0   '@42c5e DS:2d2a
    IF NOT (V_1602! = 0.0) THEN GOTO L_42cbe   '@42c74 DS:2cf4
    V_1602! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@42c8f
L_42cbe:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_1602!)), 2) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 2) OR (A_14a4!(RT_CINT%(FX##(V_1602!)), 1) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 1) OR A_14a4!(RT_CINT%(FX##(V_1602!)), 0) <> A_14a4!(RT_CINT%(FX##(V_15fa!)), 0))) THEN GOTO L_42db7   '@42cbe
    GOTO L_42dc0   '@42daf
L_42db7:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_42c5e   '@42db7
L_42dc0:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_1602!)), 2) <> 100.0) THEN GOTO L_43070   '@42dc0 DS:2d46
    V_1652# = A_14a4!(RT_CINT%(FX##(V_1602!)), 0)   '@42df2
    V_1662# = A_14a4!(RT_CINT%(FX##(V_1602!)), 1)   '@42e1c
    V_14ea# = A_14a4!(RT_CINT%(FX##(V_1602!)), 2)   '@42e47
    CALL S_15189   '@42e6f
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPf0% = (V_0f18$ = "")   '@42e79 DS:2cfc,2d3a
    IF NOT ((RT_POT##((FX##(V_0ef4#) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)), (2.0#)) < RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15fa!)), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15fa!)), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)), (2.0)) AND L_BPf0%) <> 0) THEN GOTO L_4306b   '@42ef6 DS:2cfc,2d52
    A_14a4!(RT_CINT%(FX##(V_15fa!)), 2) = 100.0   '@43016 DS:2d46
    A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0   '@4303e DS:2d46
L_4306b:
L_43070:
L_43075:
L_4307a:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4307f DS:2cf8
    L_BPf4! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@430ab
    FOR V_0f10! = 1.0 TO L_BPf4!   '@430db DS:2cf8
    V_15ea! = V_0f10!   '@430e2
    V_15ee! = FX##(V_0f10!) - 1.0   '@430f3 DS:2d2a
    V_15f2! = FX##(V_0f10!) + 1.0   '@43109 DS:2cf8
    IF NOT (V_15ee! = 0.0) THEN GOTO L_43169   '@4311f DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4313a
L_43169:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_431b2   '@43169
    V_15f2! = 1.0   '@431a1 DS:2cf8
L_431b2:
    V_1526! = 1.0   '@431b2 DS:2cf8
    V_15ca! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 0)   '@431c3
    V_15ce! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))), 1)   '@43207
    V_1522! = A_19fe!(0, 0)   '@4324c
    V_15fa! = V_15ee!   '@4326c
    V_15fe! = V_15ea!   '@4327d
    V_1602! = V_15ea!   '@4328e
    V_1606! = V_15f2!   '@4329f
L_432b5:
    CALL S_13a73   '@432ba
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BPf8! = FX##(V_1512#) / 1.0#   '@432c4 DS:2d2e
    L_BPfc! = FX##(V_151a#) / 1.0#   '@432db DS:2d2e
    CALL MIXT_082a_Maior(L_BPf8!, L_BPfc!, L_BP100!)   '@432eb
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP104! = FX##(V_1512#) / 1.0#   '@43300 DS:2d2e
    L_BP108! = FX##(V_151a#) / 1.0#   '@43311 DS:2d2e
    CALL MIXT_0877_Menor(L_BP104!, L_BP108!, L_BP10c!)   '@43321
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (ABS(FX##(L_BP100!) - L_BP10c! - V_0e68_pi#) < FX##(V_133e!) AND V_15fe! = V_1602!) THEN GOTO L_43383   '@43336
    GOTO L_49138   '@4337b
L_43383:
    V_14f2# = V_150a#   '@43383
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 AND (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1 AND V_1526! = 1.0)) THEN GOTO L_43423   '@43394 DS:2cf8
    GOTO L_49138   '@4341b
L_43423:
    IF NOT ((A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) AND V_1526! = 1.0) THEN GOTO L_437a6   '@43423 DS:2cf8
    GOSUB L_4dbbe   '@434aa
    IF NOT (V_0f18$ = "NAO") THEN GOTO L_4375d   '@434b7 DS:2d3e
    IF NOT (RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 0)) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))), 1)) - V_0efc#), (2.0#)) < RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)) - V_0efc#), (2.0#))) THEN GOTO L_43613   '@434ce DS:2d52
    GOTO L_49138   '@4360b
L_43613:
    IF NOT (RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1606!))), 0)) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1606!))), 1)) - V_0efc#), (2.0#)) < RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 0)) - V_0ef4#), (2.0#)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 1)) - V_0efc#), (2.0#))) THEN GOTO L_43758   '@43613 DS:2d52
    GOTO L_49138   '@43750
L_43758:
L_4375d:
    V_1526! = 2.0   '@4375d DS:2cfc
    V_15ca! = V_0ef4#   '@4376e
    V_15ce! = V_0efc#   '@4377f
    V_14f2# = V_14da#   '@43790
L_437a6:
    V_152a! = 0.0   '@437a6 DS:2cf4
    V_152e! = 0.0   '@437b7 DS:2cf4
    L_BP110$ = ""   '@437c8 DS:2d3a
L_437e0:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15ea!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 0) OR A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) = 100.0) THEN GOTO L_43d38   '@437e5 DS:2d46
L_438c4:
    V_152a! = 1.0   '@438c9 DS:2cf8
    V_15fa! = FX##(V_15ee!) - 1.0   '@438da DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4393a   '@438f0 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4390b
L_4393a:
    V_15fe! = V_15ee!   '@4393a
    V_1602! = V_15ee!   '@4394b
    V_1606! = FX##(V_15ee!) + 1.0   '@4395c DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_439bb   '@43972
    V_1606! = 1.0   '@439aa DS:2cf8
L_439bb:
    CALL S_13a73   '@439bb
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP114! = FX##(V_1512#) / 1.0#   '@439c5 DS:2d2e
    L_BP118! = FX##(V_151a#) / 1.0#   '@439dc DS:2d2e
    CALL MIXT_082a_Maior(L_BP114!, L_BP118!, L_BP11c!)   '@439ec
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP120! = FX##(V_1512#) / 1.0#   '@43a01 DS:2d2e
    L_BP124! = FX##(V_151a#) / 1.0#   '@43a12 DS:2d2e
    CALL MIXT_0877_Menor(L_BP120!, L_BP124!, L_BP128!)   '@43a22
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) <> 1 AND ABS(FX##(L_BP11c!) - L_BP128! - V_0e68_pi#) < FX##(V_133e!) OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1) THEN GOTO L_43b32   '@43a37
    V_15ee! = FX##(V_15ee!) - 1.0   '@43ac5 DS:2d2a
    IF NOT (V_15ee! = 0.0) THEN GOTO L_43b25   '@43adb DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@43af6
L_43b25:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_437e0   '@43b25
L_43b32:
    V_15ba! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 0)   '@43b32
    V_15be! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 1)   '@43b76
    V_1502# = V_150a#   '@43bbb
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1 AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1) THEN GOTO L_43c49   '@43bcc
    L_BP110$ = "NAO"   '@43c36 DS:2d3e
L_43c49:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_43d30   '@43c49
    GOSUB L_4dbbe   '@43cb3
    V_152a! = 3.0   '@43cc0 DS:2d5a
    V_15ba! = V_0ef4#   '@43cd1
    V_15be! = V_0efc#   '@43ce2
    V_1502# = V_14da#   '@43cf3
    V_1612! = FX##(V_15ee!) - V_15fe!   '@43d04
    V_15ee! = V_15fe!   '@43d1a
L_43d30:
    GOTO L_441b6   '@43d30
L_43d38:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@43d38 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ee!   '@43d6c
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 0)   '@43da8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 1)   '@43df8
    V_1612! = V_15ee!   '@43e4c
L_43e62:
    V_15ee! = FX##(V_15ee!) - 1.0   '@43e67 DS:2d2a
    IF NOT (V_15ee! = 0.0) THEN GOTO L_43ec7   '@43e7d DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@43e98
L_43ec7:
    IF NOT (V_15ee! = V_15ea!) THEN GOTO L_43f2f   '@43ec7
    V_15ee! = V_1612!   '@43ee2
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@43ef3 DS:2d2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_438c4   '@43f27
L_43f2f:
    IF NOT (A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) <> A_14a4!(RT_CINT%(FX##(V_15ee!)), 1) OR A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) <> A_14a4!(RT_CINT%(FX##(V_15ee!)), 0)) THEN GOTO L_43ff9   '@43f2f
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_43e62   '@43ff1
L_43ff9:
    V_1612! = FX##(V_1612!) - V_15ee!   '@43ff9
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4400f DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ee!   '@44043
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 0)   '@4407f
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_14a4!(RT_CINT%(FX##(V_15ee!)), 1)   '@440cf
    V_15ba! = A_14a4!(RT_CINT%(FX##(V_15ee!)), 0)   '@44123
    V_15be! = A_14a4!(RT_CINT%(FX##(V_15ee!)), 1)   '@4414d
    V_1502# = A_14a4!(RT_CINT%(FX##(V_15ee!)), 2)   '@44178
    V_152a! = 2.0   '@441a0 DS:2cfc
L_441b6:
    IF NOT (V_152e! <> 0.0) THEN GOTO L_441d9   '@441b6 DS:2cf4
    GOTO L_44bca   '@441d1
L_441d9:
    L_BP96$ = ""   '@441d9 DS:2d3a
L_441f1:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15ea!)), 0) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 0) OR A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) = 100.0) THEN GOTO L_44748   '@441f6 DS:2d46
L_442d5:
    V_152e! = 1.0   '@442da DS:2cf8
    V_15fa! = FX##(V_15f2!) - 1.0   '@442eb DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4434b   '@44301 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4431c
L_4434b:
    V_15fe! = V_15f2!   '@4434b
    V_1602! = V_15f2!   '@4435c
    V_1606! = FX##(V_15f2!) + 1.0   '@4436d DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_443cc   '@44383
    V_1606! = 1.0   '@443bb DS:2cf8
L_443cc:
    CALL S_13a73   '@443cc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP12c! = FX##(V_1512#) / 1.0#   '@443d6 DS:2d2e
    L_BP130! = FX##(V_151a#) / 1.0#   '@443ed DS:2d2e
    CALL MIXT_082a_Maior(L_BP12c!, L_BP130!, L_BP134!)   '@443fd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP138! = FX##(V_1512#) / 1.0#   '@44412 DS:2d2e
    L_BP13c! = FX##(V_151a#) / 1.0#   '@44423 DS:2d2e
    CALL MIXT_0877_Menor(L_BP138!, L_BP13c!, L_BP140!)   '@44433
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) <> 1 AND ABS(FX##(L_BP134!) - L_BP140! - V_0e68_pi#) < FX##(V_133e!) OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_44542   '@44448
    V_15f2! = FX##(V_15f2!) + 1.0   '@444d6 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_44535   '@444ec
    V_15f2! = 1.0   '@44524 DS:2cf8
L_44535:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_441f1   '@44535
L_44542:
    V_15c2! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 0)   '@44542
    V_15c6! = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 1)   '@44586
    V_14fa# = V_150a#   '@445cb
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1 AND A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1) THEN GOTO L_44659   '@445dc
    L_BP96$ = "NAO"   '@44646 DS:2d3e
L_44659:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_44740   '@44659
    GOSUB L_4dbbe   '@446c3
    V_152e! = 3.0   '@446d0 DS:2d5a
    V_15c2! = V_0ef4#   '@446e1
    V_15c6! = V_0efc#   '@446f2
    V_14fa# = V_14da#   '@44703
    V_1616! = FX##(V_1602!) - V_15f2!   '@44714
    V_15f2! = V_1602!   '@4472a
L_44740:
    GOTO L_44bc5   '@44740
L_44748:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@44748 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15f2!   '@4477c
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 0)   '@447b8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 1)   '@44808
    V_1616! = V_15f2!   '@4485c
L_44872:
    V_15f2! = FX##(V_15f2!) + 1.0   '@44877 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_448d6   '@4488d
    V_15f2! = 1.0   '@448c5 DS:2cf8
L_448d6:
    IF NOT (V_15f2! = V_15ea!) THEN GOTO L_4493e   '@448d6
    V_15f2! = V_1616!   '@448f1
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@44902 DS:2d2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_442d5   '@44936
L_4493e:
    IF NOT (A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) <> A_14a4!(RT_CINT%(FX##(V_15f2!)), 1) OR A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) <> A_14a4!(RT_CINT%(FX##(V_15f2!)), 0)) THEN GOTO L_44a08   '@4493e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44872   '@44a00
L_44a08:
    V_1616! = FX##(V_15f2!) - V_1616!   '@44a08
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@44a1e DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15f2!   '@44a52
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 0)   '@44a8e
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_14a4!(RT_CINT%(FX##(V_15f2!)), 1)   '@44ade
    V_15c2! = A_14a4!(RT_CINT%(FX##(V_15f2!)), 0)   '@44b32
    V_15c6! = A_14a4!(RT_CINT%(FX##(V_15f2!)), 1)   '@44b5c
    V_14fa# = A_14a4!(RT_CINT%(FX##(V_15f2!)), 2)   '@44b87
    V_152e! = 2.0   '@44baf DS:2cfc
L_44bc5:
L_44bca:
    IF NOT (V_15ee! >= V_15f2! AND (V_15ea! >= V_15f2! AND V_15ea! <= V_15ee!) OR (V_15ee! <= V_15f2! AND (V_15ea! >= V_15f2! AND V_15ea! >= V_15ee!) OR V_15ee! <= V_15f2! AND (V_15ea! <= V_15f2! AND V_15ea! <= V_15ee!))) THEN GOTO L_44cd2   '@44bcf
    GOTO L_48a96   '@44cca
L_44cd2:
    IF NOT (L_BP96$ = "NAO") THEN GOTO L_44cf2   '@44cd2 DS:2d3e
    GOTO L_45a9c   '@44cea
L_44cf2:
    V_164a# = V_15ca!   '@44cf2
    V_165a# = V_15ce!   '@44d03
    V_14e2# = V_14f2#   '@44d14
    V_1652# = V_15c2!   '@44d25
    V_1662# = V_15c6!   '@44d36
    V_14ea# = V_14fa#   '@44d47
    CALL S_15189   '@44d58
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP96$ = V_0f18$   '@44d62
    V_157a# = V_0ef4#   '@44d75
    V_1582# = V_0efc#   '@44d86
    IF NOT (L_BP96$ <> "NAO") THEN GOTO L_45a97   '@44d97 DS:2d3e
    IF NOT (V_152e! = 2.0 AND A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) <> 100.0) THEN GOTO L_45084   '@44daf DS:2cfc,2d46
    V_155a# = V_15ca!   '@44e04
    V_1562# = V_15ce!   '@44e15
    V_156a# = V_157a#   '@44e26
    V_1572# = V_1582#   '@44e37
    V_153a# = V_15c2!   '@44e48
    V_1542# = V_15c6!   '@44e59
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!) - V_1616!)), 0)   '@44e6a
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!) - V_1616!)), 1)   '@44eb3
    CALL S_11c49   '@44efd
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_1562#) - V_1572#) < FX##(V_133a!) AND ABS(FX##(V_155a#) - V_156a#) < FX##(V_133a!) OR V_0f1c$ = "") THEN GOTO L_44fcd   '@44f07 DS:2d3a
L_44f71:
    V_15f2! = FX##(V_15f2!) - V_1616!   '@44f76
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@44f8c DS:2d5e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_442d5   '@44fc0
L_44fcd:
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 0)   '@44fcd
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))), 1)   '@45011
    CALL S_11c49   '@45056
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4507f   '@45060 DS:2d3a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_44f71   '@45077
L_4507f:
L_45084:
    V_15fe! = FX##(V_15f2!) + 1.0   '@45084 DS:2cf8
L_450a0:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fe!) THEN GOTO L_450e9   '@450a0
    V_15fe! = 1.0   '@450d8 DS:2cf8
L_450e9:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 0) <> -100.0 OR A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) <> 100.0) THEN GOTO L_45161   '@450e9 DS:2d36,2d46
    GOTO L_45180   '@45159
L_45161:
    V_15fe! = FX##(V_15fe!) + 1.0   '@45161 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_450a0   '@45177
L_45180:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_45368   '@45180 DS:2d46
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))) = 1) THEN GOTO L_451ec   '@451b2
    GOTO L_45a9c   '@451e4
L_451ec:
    V_15fa! = FX##(V_15fe!) - 1.0   '@451ec DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4524c   '@45202 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4521d
L_4524c:
    V_1602! = V_15fe!   '@4524c
    V_1606! = FX##(V_15fe!) + 1.0   '@4525d DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_452bc   '@45273
    V_1606! = 1.0   '@452ab DS:2cf8
L_452bc:
    CALL S_13a73   '@452bc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_164a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@452c6
    V_165a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@4530a
    V_14e2# = V_150a#   '@4534f
    GOTO L_453ea   '@45360
L_45368:
    V_164a# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)   '@45368
    V_165a# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1)   '@45392
    V_14e2# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 2)   '@453bd
L_453ea:
    CALL S_15189   '@453ea
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_15c2!), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_15c6!), (2.0#)) + V_133a! < RT_POT##((FX##(V_157a#) - V_15c2!), (2.0#)) + RT_POT##((FX##(V_1582#) - V_15c6!), (2.0#))) THEN GOTO L_45a92   '@453f4 DS:2d52
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_157a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1582#), (2.0#)) < RT_POT##((FX##(V_15c2!) - V_157a#), (2.0#)) + RT_POT##((FX##(V_15c6!) - V_1582#), (2.0#))) THEN GOTO L_45a8d   '@45477 DS:2d52
    V_153a# = V_0ef4#   '@454e6
    V_1542# = V_0efc#   '@454f7
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_45558   '@45508 DS:2d46
    V_15fe! = FX##(V_15fe!) + 1.0   '@4553a DS:2cf8
    GOTO L_4569f   '@45550
L_45558:
    V_15fa! = V_15fe!   '@45558
L_4556e:
    V_15fa! = FX##(V_15fa!) + 1.0   '@4556e DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fa!) THEN GOTO L_455cd   '@45584
    V_15fa! = 1.0   '@455bc DS:2cf8
L_455cd:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fa!)), 1) = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15fa!)), 0) = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)) THEN GOTO L_45691   '@455cd
    V_15fe! = FX##(V_15fa!) + 1.0   '@45673 DS:2cf8
    GOTO L_4569a   '@45689
L_45691:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4556e   '@45691
L_4569a:
L_4569f:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fe!) THEN GOTO L_456e8   '@4569f
    V_15fe! = 1.0   '@456d7 DS:2cf8
L_456e8:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_458e3   '@456e8 DS:2d46
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))) = 1) THEN GOTO L_45767   '@4571a
    L_BP96$ = "NAO"   '@4574c DS:2d3e
    GOTO L_45a9c   '@4575f
L_45767:
    V_15fa! = FX##(V_15fe!) - 1.0   '@45767 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_457c7   '@4577d DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@45798
L_457c7:
    V_1602! = V_15fe!   '@457c7
    V_1606! = FX##(V_15fe!) + 1.0   '@457d8 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_45837   '@457ee
    V_1606! = 1.0   '@45826 DS:2cf8
L_45837:
    CALL S_13a73   '@45837
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1652# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@45841
    V_1662# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@45885
    V_14ea# = V_150a#   '@458ca
    GOTO L_45965   '@458db
L_458e3:
    V_1652# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)   '@458e3
    V_1662# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1)   '@4590d
    V_14ea# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 2)   '@45938
L_45965:
    CALL S_15189   '@45965
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_164a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_165a#), (2.0#)) + V_133a! >= RT_POT##((FX##(V_153a#) - V_164a#), (2.0#)) + RT_POT##((FX##(V_1542#) - V_165a#), (2.0#))) THEN GOTO L_45a01   '@4596f DS:2d52
    L_BP96$ = "NAO"   '@459e6 DS:2d3e
    GOTO L_45a88   '@459f9
L_45a01:
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_153a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1542#), (2.0#)) > RT_POT##((FX##(V_164a#) - V_153a#), (2.0#)) + RT_POT##((FX##(V_165a#) - V_1542#), (2.0#))) THEN GOTO L_45a83   '@45a01 DS:2d52
    L_BP96$ = "NAO"   '@45a70 DS:2d3e
L_45a83:
L_45a88:
L_45a8d:
L_45a92:
L_45a97:
L_45a9c:
    IF NOT (L_BP110$ = "NAO") THEN GOTO L_45ac1   '@45aa1 DS:2d3e
    GOTO L_46893   '@45ab9
L_45ac1:
    V_164a# = V_15ba!   '@45ac1
    V_165a# = V_15be!   '@45ad2
    V_14e2# = V_1502#   '@45ae3
    V_1652# = V_15ca!   '@45af4
    V_1662# = V_15ce!   '@45b05
    V_14ea# = V_14f2#   '@45b16
    CALL S_15189   '@45b27
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP110$ = V_0f18$   '@45b31
    V_158a# = V_0ef4#   '@45b44
    V_1592# = V_0efc#   '@45b55
    IF NOT (L_BP110$ <> "NAO") THEN GOTO L_4688e   '@45b66 DS:2d3e
    IF NOT (V_152a! = 2.0 AND A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) <> 100.0) THEN GOTO L_45e7b   '@45b7e DS:2cfc,2d46
    V_155a# = V_15ca!   '@45bd3
    V_1562# = V_15ce!   '@45be4
    V_156a# = V_158a#   '@45bf5
    V_1572# = V_1592#   '@45c06
    V_153a# = V_15ba!   '@45c17
    V_1542# = V_15be!   '@45c28
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!) + V_1612!)), 0)   '@45c39
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!) + V_1612!)), 1)   '@45c82
    CALL S_11c49   '@45ccc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (ABS(FX##(V_1562#) - V_1572#) < FX##(V_133a!) AND ABS(FX##(V_155a#) - V_156a#) < FX##(V_133a!) OR V_0f1c$ = "") THEN GOTO L_45dc4   '@45cd6 DS:2d3a
L_45d40:
    V_15ee! = FX##(V_15ee!) + V_1612!   '@45d45
    IF NOT (V_152e! = 2.0) THEN GOTO L_45d83   '@45d5b DS:2cfc
    GOSUB L_4e563   '@45d76
L_45d83:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@45d83 DS:2d5e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_438c4   '@45db7
L_45dc4:
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 0)   '@45dc4
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))), 1)   '@45e08
    CALL S_11c49   '@45e4d
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_45e76   '@45e57 DS:2d3a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45d40   '@45e6e
L_45e76:
L_45e7b:
    V_15fe! = FX##(V_15ee!) - 1.0   '@45e7b DS:2d2a
L_45e96:
    IF NOT (V_15fe! = 0.0) THEN GOTO L_45ee0   '@45e96 DS:2cf4
    V_15fe! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@45eb1
L_45ee0:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 0) <> -100.0 OR A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) <> 100.0) THEN GOTO L_45f58   '@45ee0 DS:2d36,2d46
    GOTO L_45f76   '@45f50
L_45f58:
    V_15fe! = FX##(V_15fe!) - 1.0   '@45f58 DS:2d2a
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_45e96   '@45f6e
L_45f76:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_4615e   '@45f76 DS:2d46
    V_15fa! = FX##(V_15fe!) - 1.0   '@45fa8 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_46008   '@45fbe DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@45fd9
L_46008:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_46042   '@46008
    GOTO L_46893   '@4603a
L_46042:
    V_1602! = V_15fe!   '@46042
    V_1606! = FX##(V_15fe!) + 1.0   '@46053 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_460b2   '@46069
    V_1606! = 1.0   '@460a1 DS:2cf8
L_460b2:
    CALL S_13a73   '@460b2
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_1652# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@460bc
    V_1662# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@46100
    V_14ea# = V_150a#   '@46145
    GOTO L_461e0   '@46156
L_4615e:
    V_1652# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)   '@4615e
    V_1662# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1)   '@46188
    V_14ea# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 2)   '@461b3
L_461e0:
    CALL S_15189   '@461e0
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_15ba!), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_15be!), (2.0#)) + V_133a! < RT_POT##((FX##(V_158a#) - V_15ba!), (2.0#)) + RT_POT##((FX##(V_1592#) - V_15be!), (2.0#))) THEN GOTO L_46889   '@461ea DS:2d52
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_158a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1592#), (2.0#)) < RT_POT##((FX##(V_15ba!) - V_158a#), (2.0#)) + RT_POT##((FX##(V_15be!) - V_1592#), (2.0#))) THEN GOTO L_46884   '@4626d DS:2d52
    V_153a# = V_0ef4#   '@462dc
    V_1542# = V_0efc#   '@462ed
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_4634e   '@462fe DS:2d46
    V_15fe! = FX##(V_15fe!) - 1.0   '@46330 DS:2d2a
    GOTO L_46495   '@46346
L_4634e:
    V_15fa! = V_15fe!   '@4634e
L_46364:
    V_15fa! = FX##(V_15fa!) - 1.0   '@46364 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_463c4   '@4637a DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@46395
L_463c4:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fa!)), 1) = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15fa!)), 0) = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)) THEN GOTO L_46488   '@463c4
    V_15fe! = FX##(V_15fa!) - 1.0   '@4646a DS:2d2a
    GOTO L_46490   '@46480
L_46488:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_46364   '@46488
L_46490:
L_46495:
    IF NOT (V_15fe! = 0.0) THEN GOTO L_464df   '@46495 DS:2cf4
    V_15fe! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@464b0
L_464df:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15fe!)), 2) = 100.0) THEN GOTO L_466da   '@464df DS:2d46
    V_15fa! = FX##(V_15fe!) - 1.0   '@46511 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_46571   '@46527 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@46542
L_46571:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_465be   '@46571
    L_BP110$ = "NAO"   '@465a3 DS:2d3e
    GOTO L_46893   '@465b6
L_465be:
    V_1602! = V_15fe!   '@465be
    V_1606! = FX##(V_15fe!) + 1.0   '@465cf DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_4662e   '@465e5
    V_1606! = 1.0   '@4661d DS:2cf8
L_4662e:
    CALL S_13a73   '@4662e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_164a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@46638
    V_165a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@4667c
    V_14e2# = V_150a#   '@466c1
    GOTO L_4675c   '@466d2
L_466da:
    V_164a# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 0)   '@466da
    V_165a# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 1)   '@46704
    V_14e2# = A_14a4!(RT_CINT%(FX##(V_15fe!)), 2)   '@4672f
L_4675c:
    CALL S_15189   '@4675c
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_1652#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1662#), (2.0#)) + V_133a! >= RT_POT##((FX##(V_153a#) - V_1652#), (2.0#)) + RT_POT##((FX##(V_1542#) - V_1662#), (2.0#))) THEN GOTO L_467f8   '@46766 DS:2d52
    L_BP110$ = "NAO"   '@467dd DS:2d3e
    GOTO L_4687f   '@467f0
L_467f8:
    IF NOT (RT_POT##((FX##(V_0ef4#) - V_153a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1542#), (2.0#)) > RT_POT##((FX##(V_1652#) - V_153a#), (2.0#)) + RT_POT##((FX##(V_1662#) - V_1542#), (2.0#))) THEN GOTO L_4687a   '@467f8 DS:2d52
    L_BP110$ = "NAO"   '@46867 DS:2d3e
L_4687a:
L_4687f:
L_46884:
L_46889:
L_4688e:
L_46893:
    L_BP142% = (L_BP110$ = "NAO")   '@46898 DS:2d3e
    IF NOT ((L_BP96$ = "NAO" AND L_BP142%) <> 0) THEN GOTO L_468de   '@468c0 DS:2d3e
    GOTO L_48a96   '@468d6
L_468de:
    IF NOT (A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1 AND V_1526! = 1.0) THEN GOTO L_46bb9   '@468de DS:2cf8
    V_15e2! = 1.0   '@46935 DS:2cf8
L_4694c:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_15e2!)), 0) = -V_15ea!) THEN GOTO L_46b42   '@4694c
    L_BP144% = (RT_POT##((FX##(V_157a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1582#) - V_15ce!), (2.0#)) + V_133a! >= RT_POT##((FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 2)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 3)) - V_15ce!), (2.0)))   '@46983 DS:2cfc,2d52
    IF NOT ((L_BP96$ = "NAO" OR L_BP144%) <> 0) THEN GOTO L_46b3d   '@46a41 DS:2d3e
    L_BP146% = (RT_POT##((FX##(V_158a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1592#) - V_15ce!), (2.0#)) + V_133a! >= RT_POT##((FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 2)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_19fe!(RT_CINT%(FX##(V_15e2!)), 3)) - V_15ce!), (2.0)))   '@46a57 DS:2cfc,2d52
    IF NOT ((L_BP110$ = "NAO" OR L_BP146%) <> 0) THEN GOTO L_46b38   '@46b15 DS:2d3e
    GOTO L_46b82   '@46b2b
L_46b38:
L_46b3d:
L_46b42:
    V_15e2! = FX##(V_15e2!) + 1.0   '@46b42 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_15e2!) THEN GOTO L_4694c   '@46b58
L_46b82:
    IF NOT (A_19fe!(0, 0) >= V_15e2!) THEN GOTO L_46bb4   '@46b82
    GOTO L_49138   '@46bac
L_46bb4:
L_46bb9:
    L_BP148% = (ABS(FX##(V_1582#) - V_1592#) < FX##(V_133a!) AND ABS(FX##(V_157a#) - V_158a#) < FX##(V_133a!))   '@46bb9
    L_BP14a% = L_BP110$ <> "NAO" AND L_BP148%   '@46c0f DS:2d3e
    IF NOT ((L_BP96$ <> "NAO" AND L_BP14a%) <> 0) THEN GOTO L_4739e   '@46c2d DS:2d3e
    V_155a# = V_15c2!   '@46c43
    V_1562# = V_15c6!   '@46c54
    V_156a# = V_157a#   '@46c65
    V_1572# = V_1582#   '@46c76
    CALL S_17b61   '@46c87
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_46cb0   '@46c91 DS:2d3a
    GOTO L_49138   '@46ca8
L_46cb0:
    V_155a# = V_15ba!   '@46cb0
    V_1562# = V_15be!   '@46cc1
    V_156a# = V_157a#   '@46cd2
    V_1572# = V_1582#   '@46ce3
    CALL S_17b61   '@46cf4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_46d1d   '@46cfe DS:2d3a
    GOTO L_49138   '@46d15
L_46d1d:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@46d1d DS:2cf8
    IF NOT (V_152e! = 1.0) THEN GOTO L_46ddc   '@46d51 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15f2!   '@46d6c
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))) = 1   '@46da8
    GOTO L_46e54   '@46dd4
L_46ddc:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15c2!   '@46ddc
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15c6!   '@46e15
L_46e54:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_157a#   '@46e54
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1582#   '@46e8b
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@46ec5 DS:2cf8
    IF NOT (V_152a! = 1.0) THEN GOTO L_46f84   '@46ef9 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ee!   '@46f14
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))) = 1   '@46f50
    GOTO L_46ffc   '@46f7c
L_46f84:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ba!   '@46f84
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15be!   '@46fbd
L_46ffc:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_157a#   '@46ffc
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1582#   '@47033
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4706d DS:2cf8
    IF NOT (V_1526! = 1.0) THEN GOTO L_4713d   '@470a1 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ea!   '@470bc
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1   '@470f8
    V_1526! = 2.0   '@47124 DS:2cfc
    GOTO L_471b5   '@47135
L_4713d:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ca!   '@4713d
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15ce!   '@47176
L_471b5:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_157a#   '@471b5
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1582#   '@471ec
    V_15ca! = V_157a#   '@47226
    V_15ce! = V_1582#   '@47237
    V_15fe! = V_15ee!   '@47248
    V_15ee! = FX##(V_15ee!) - 1.0   '@47259 DS:2d2a
    IF NOT (V_15ee! = 0.0) THEN GOTO L_472b9   '@4726f DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4728a
L_472b9:
    V_15fa! = V_15ee!   '@472b9
    IF NOT (V_15f2! = V_15ee!) THEN GOTO L_472ed   '@472ca
    GOTO L_49138   '@472e5
L_472ed:
    V_1602! = V_15f2!   '@472ed
    V_15f2! = FX##(V_15f2!) + 1.0   '@472fe DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_4735d   '@47314
    V_15f2! = 1.0   '@4734c DS:2cf8
L_4735d:
    V_1606! = V_15f2!   '@4735d
    IF NOT (V_15f2! = V_15ee!) THEN GOTO L_47391   '@4736e
    GOTO L_49138   '@47389
L_47391:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_432b5   '@47391
L_4739e:
L_473a3:
    L_BP14c% = (L_BP96$ <> "NAO")   '@473a8 DS:2d3e,2d52
    L_BP14e% = (RT_POT##((FX##(V_157a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1582#) - V_15ce!), (2.0#)) <= RT_POT##((FX##(V_158a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1592#) - V_15ce!), (2.0#)))   '@473d9 DS:2d52
    IF NOT (((L_BP110$ = "NAO" OR L_BP14e%) AND L_BP14c%) <> 0) THEN GOTO L_47f2d   '@4744b DS:2d3e
    IF NOT (ABS(FX##(V_15ce!) - V_1582#) < FX##(V_133a!) AND ABS(FX##(V_15ca!) - V_157a#) < FX##(V_133a!)) THEN GOTO L_474bb   '@47465
    GOTO L_4764a   '@474b3
L_474bb:
    V_155a# = V_15ca!   '@474bb
    V_1562# = V_15ce!   '@474cc
    V_156a# = V_157a#   '@474dd
    V_1572# = V_1582#   '@474ee
    CALL S_17b61   '@474ff
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP150% = (V_0f1c$ = "")   '@47509 DS:2d3a
    IF NOT ((L_BP110$ <> "NAO" AND L_BP150%) <> 0) THEN GOTO L_47561   '@47530 DS:2d3e
    L_BP96$ = "NAO"   '@47546 DS:2d3e
    GOTO L_47f32   '@47559
L_47561:
    IF NOT (V_0f1c$ = "") THEN GOTO L_47580   '@47561 DS:2d3a
    GOTO L_49138   '@47578
L_47580:
    V_155a# = V_15c2!   '@47580
    V_1562# = V_15c6!   '@47591
    V_156a# = V_157a#   '@475a2
    V_1572# = V_1582#   '@475b3
    CALL S_17b61   '@475c4
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP152% = (V_0f1c$ = "")   '@475ce DS:2d3a
    IF NOT ((L_BP110$ <> "NAO" AND L_BP152%) <> 0) THEN GOTO L_47626   '@475f5 DS:2d3e
    L_BP96$ = "NAO"   '@4760b DS:2d3e
    GOTO L_47f32   '@4761e
L_47626:
    IF NOT (V_0f1c$ = "") THEN GOTO L_47645   '@47626 DS:2d3a
    GOTO L_49138   '@4763d
L_47645:
L_4764a:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) <> 100.0 AND V_152a! <> 1.0) THEN GOTO L_47707   '@4764f DS:2cf8,2d46
    IF NOT (V_152e! = 2.0) THEN GOTO L_476ce   '@476a6 DS:2cfc
    GOSUB L_4e563   '@476c1
L_476ce:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@476ce DS:2d5e
L_47707:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) <> 100.0 AND V_1526! = 1.0) THEN GOTO L_479dc   '@47707 DS:2cf8,2d46
    IF NOT (RT_POT##((FX##(V_157a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1582#) - V_15ce!), (2.0#)) + V_133a! < RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 1)) - V_15ce!), (2.0))) THEN GOTO L_479d7   '@4775e DS:2cfc,2d52
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = 100.0   '@4780e DS:2d46
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ee!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15ee!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) THEN GOTO L_47904   '@47836
    A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) = 100.0   '@478dc DS:2d46
L_47904:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15f2!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15f2!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) THEN GOTO L_479d2   '@47904
    A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) = 100.0   '@479aa DS:2d46
L_479d2:
L_479d7:
L_479dc:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@479dc DS:2cf8
    IF NOT (V_152e! = 1.0) THEN GOTO L_47a9b   '@47a10 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15f2!   '@47a2b
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15f2!))) = 1   '@47a67
    GOTO L_47b13   '@47a93
L_47a9b:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15c2!   '@47a9b
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15c6!   '@47ad4
L_47b13:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_157a#   '@47b13
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1582#   '@47b4a
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@47b84 DS:2cf8
    IF NOT (V_1526! = 1.0) THEN GOTO L_47c54   '@47bb8 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ea!   '@47bd3
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1   '@47c0f
    V_1526! = 2.0   '@47c3b DS:2cfc
    GOTO L_47ccc   '@47c4c
L_47c54:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ca!   '@47c54
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15ce!   '@47c8d
L_47ccc:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_157a#   '@47ccc
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1582#   '@47d03
    IF NOT (FX##(V_15ce!) = FX##(V_1582#) AND FX##(V_15ca!) = FX##(V_157a#)) THEN GOTO L_47daf   '@47d3d
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@47d7b DS:2d2a
L_47daf:
    V_15ca! = V_157a#   '@47daf
    V_15ce! = V_1582#   '@47dc0
    IF NOT (V_152a! <> 1.0) THEN GOTO L_47e02   '@47dd1 DS:2cf8
    V_15ee! = FX##(V_15ee!) + V_1612!   '@47dec
L_47e02:
    V_15fa! = V_15ee!   '@47e0c
    V_15fe! = FX##(V_15ee!) + 1.0   '@47e1d DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fe!) THEN GOTO L_47e7c   '@47e33
    V_15fe! = 1.0   '@47e6b DS:2cf8
L_47e7c:
    V_1602! = V_15f2!   '@47e7c
    V_15f2! = FX##(V_15f2!) + 1.0   '@47e8d DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15f2!) THEN GOTO L_47eec   '@47ea3
    V_15f2! = 1.0   '@47edb DS:2cf8
L_47eec:
    V_1606! = V_15f2!   '@47eec
    IF NOT (V_15f2! = V_15ee!) THEN GOTO L_47f20   '@47efd
    GOTO L_49138   '@47f18
L_47f20:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_432b5   '@47f20
L_47f2d:
L_47f32:
    L_BP154% = (L_BP110$ <> "NAO")   '@47f37 DS:2d3e,2d52
    L_BP156% = (RT_POT##((FX##(V_157a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1582#) - V_15ce!), (2.0#)) > RT_POT##((FX##(V_158a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1592#) - V_15ce!), (2.0#)))   '@47f68 DS:2d52
    IF NOT (((L_BP96$ = "NAO" OR L_BP156%) AND L_BP154%) <> 0) THEN GOTO L_48a91   '@47fda DS:2d3e
    IF NOT (ABS(FX##(V_15ce!) - V_1592#) < FX##(V_133a!) AND ABS(FX##(V_15ca!) - V_158a#) < FX##(V_133a!)) THEN GOTO L_4804a   '@47ff4
    GOTO L_481d9   '@48042
L_4804a:
    V_155a# = V_15ca!   '@4804a
    V_1562# = V_15ce!   '@4805b
    V_156a# = V_158a#   '@4806c
    V_1572# = V_1592#   '@4807d
    CALL S_17b61   '@4808e
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP158% = (V_0f1c$ = "")   '@48098 DS:2d3a
    IF NOT ((L_BP96$ <> "NAO" AND L_BP158%) <> 0) THEN GOTO L_480f0   '@480bf DS:2d3e
    L_BP110$ = "NAO"   '@480d5 DS:2d3e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473a3   '@480e8
L_480f0:
    IF NOT (V_0f1c$ = "") THEN GOTO L_4810f   '@480f0 DS:2d3a
    GOTO L_49138   '@48107
L_4810f:
    V_155a# = V_15ba!   '@4810f
    V_1562# = V_15be!   '@48120
    V_156a# = V_158a#   '@48131
    V_1572# = V_1592#   '@48142
    CALL S_17b61   '@48153
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    L_BP15a% = (V_0f1c$ = "")   '@4815d DS:2d3a
    IF NOT ((L_BP96$ <> "NAO" AND L_BP15a%) <> 0) THEN GOTO L_481b5   '@48184 DS:2d3e
    L_BP110$ = "NAO"   '@4819a DS:2d3e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_473a3   '@481ad
L_481b5:
    IF NOT (V_0f1c$ = "") THEN GOTO L_481d4   '@481b5 DS:2d3a
    GOTO L_49138   '@481cc
L_481d4:
L_481d9:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) <> 100.0 AND V_152e! <> 1.0) THEN GOTO L_48269   '@481de DS:2cf8,2d46
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@48235 DS:2d5e
L_48269:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) <> 100.0 AND V_1526! = 1.0) THEN GOTO L_4853e   '@48269 DS:2cf8,2d46
    IF NOT (RT_POT##((FX##(V_158a#) - V_15ca!), (2.0#)) + RT_POT##((FX##(V_1592#) - V_15ce!), (2.0#)) + V_133a! < RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) - V_15ca!), (2.0)) + RT_POT##((FX##(A_14a4!(RT_CINT%(FX##(V_15ea!)), 1)) - V_15ce!), (2.0))) THEN GOTO L_48539   '@482c0 DS:2cfc,2d52
    A_14a4!(RT_CINT%(FX##(V_15ea!)), 2) = 100.0   '@48370 DS:2d46
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15ee!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15ee!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) THEN GOTO L_48466   '@48398
    A_14a4!(RT_CINT%(FX##(V_15ee!)), 2) = 100.0   '@4843e DS:2d46
L_48466:
    IF NOT (A_14a4!(RT_CINT%(FX##(V_15f2!)), 1) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 1) AND A_14a4!(RT_CINT%(FX##(V_15f2!)), 0) = A_14a4!(RT_CINT%(FX##(V_15ea!)), 0)) THEN GOTO L_48534   '@48466
    A_14a4!(RT_CINT%(FX##(V_15f2!)), 2) = 100.0   '@4850c DS:2d46
L_48534:
L_48539:
L_4853e:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4853e DS:2cf8
    IF NOT (V_152a! = 1.0) THEN GOTO L_485fd   '@48572 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ee!   '@4858d
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ee!))) = 1   '@485c9
    GOTO L_48675   '@485f5
L_485fd:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ba!   '@485fd
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15be!   '@48636
L_48675:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_158a#   '@48675
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1592#   '@486ac
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@486e6 DS:2cf8
    IF NOT (V_1526! = 1.0) THEN GOTO L_487b6   '@4871a DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ea!   '@48735
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1   '@48771
    V_1526! = 2.0   '@4879d DS:2cfc
    GOTO L_4882e   '@487ae
L_487b6:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ca!   '@487b6
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15ce!   '@487ef
L_4882e:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_158a#   '@4882e
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1592#   '@48865
    IF NOT (FX##(V_15ce!) = FX##(V_1592#) AND FX##(V_15ca!) = FX##(V_158a#)) THEN GOTO L_48911   '@4889f
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@488dd DS:2d2a
L_48911:
    V_15ca! = V_158a#   '@48911
    V_15ce! = V_1592#   '@48922
    IF NOT (V_152e! <> 1.0) THEN GOTO L_48964   '@48933 DS:2cf8
    V_15f2! = FX##(V_15f2!) - V_1616!   '@4894e
L_48964:
    V_15fe! = V_15ee!   '@4896e
    V_15ee! = FX##(V_15ee!) - 1.0   '@4897f DS:2d2a
    IF NOT (V_15ee! = 0.0) THEN GOTO L_489df   '@48995 DS:2cf4
    V_15ee! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@489b0
L_489df:
    V_15fa! = V_15ee!   '@489df
    V_1602! = FX##(V_15f2!) - 1.0   '@489f0 DS:2d2a
    IF NOT (V_1602! = 0.0) THEN GOTO L_48a50   '@48a06 DS:2cf4
    V_1602! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@48a21
L_48a50:
    V_1606! = V_15f2!   '@48a50
    IF NOT (V_15f2! = V_15ee!) THEN GOTO L_48a84   '@48a61
    GOTO L_49138   '@48a7c
L_48a84:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_432b5   '@48a84
L_48a91:
L_48a96:
    IF NOT (V_152a! <> 1.0) THEN GOTO L_48acc   '@48a9b DS:2cf8
    V_15ee! = FX##(V_15ee!) + V_1612!   '@48ab6
L_48acc:
    IF NOT (V_152e! <> 1.0) THEN GOTO L_48afd   '@48acc DS:2cf8
    V_15f2! = FX##(V_15f2!) - V_1616!   '@48ae7
L_48afd:
    IF NOT (V_152a! = 2.0) THEN GOTO L_48b4c   '@48afd DS:2cfc
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@48b18 DS:2d5e
L_48b4c:
    IF NOT (V_152e! = 2.0) THEN GOTO L_48b9b   '@48b4c DS:2cfc
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 2.0   '@48b67 DS:2d5e
L_48b9b:
    IF NOT (V_15ea! = V_15f2! OR (V_15ea! = V_15ee! OR (V_15ee! >= V_15f2! AND (V_15ea! > V_15f2! AND V_15ea! < V_15ee!) OR (V_15ee! <= V_15f2! AND (V_15ea! > V_15f2! AND V_15ea! > V_15ee!) OR V_15ee! <= V_15f2! AND (V_15ea! < V_15f2! AND V_15ea! < V_15ee!))))) THEN GOTO L_48cd4   '@48b9b
    GOTO L_49138   '@48ccc
L_48cd4:
    V_0f18$ = ""   '@48cd4 DS:2d3a
    V_15fa! = V_15f2!   '@48ce6
L_48cfc:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) <> 1) THEN GOTO L_48d40   '@48cfc
    V_0f18$ = "*"   '@48d2e DS:2d62
L_48d40:
    IF NOT (V_0f18$ = "*") THEN GOTO L_48d5f   '@48d40 DS:2d62
    GOTO L_48dda   '@48d57
L_48d5f:
    V_15fa! = FX##(V_15fa!) + 1.0   '@48d5f DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_15fa!) THEN GOTO L_48dbe   '@48d75
    V_15fa! = 1.0   '@48dad DS:2cf8
L_48dbe:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (V_15fa! = V_15ee!) THEN GOTO L_48cfc   '@48dbe
L_48dda:
    IF NOT (V_0f18$ = "") THEN GOTO L_49030   '@48dda DS:2d3a
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@48df1 DS:2cf8
    IF NOT (V_1526! = 1.0) THEN GOTO L_48ec1   '@48e25 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_15ea!   '@48e40
    A_1342%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15ea!))) = 1   '@48e7c
    V_1526! = 2.0   '@48ea8 DS:2cfc
    GOTO L_48f39   '@48eb9
L_48ec1:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_15ca!   '@48ec1
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_15ce!   '@48efa
L_48f39:
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_15ca! + RT_COS##(FX##(V_14f2#)) * -(ABS(RT_COS##(FX##(V_14f2#))) > FX##(V_133e!)) * 1000.0#   '@48f39 DS:2d68
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_15ce! + RT_SIN##(FX##(V_14f2#)) * -(ABS(RT_SIN##(FX##(V_14f2#))) > FX##(V_133e!)) * 1000.0#   '@48faf DS:2d68
    GOTO L_49133   '@49028
L_49030:
    IF NOT (V_1526! > 1.0) THEN GOTO L_4912e   '@49030 DS:2cf8
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) + 1.0   '@4904b DS:2cf8
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0) = V_15ca!   '@4907f
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1) = V_15ce!   '@490b8
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2) = V_14f2#   '@490f2
L_4912e:
L_49133:
L_49138:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4913d DS:2cf8
    V_1536! = -1.0   '@49169 DS:2d2a
    V_0ef0! = 1.0   '@4917a DS:2cf8
L_49190:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_49780   '@49190 DS:2cf4
    V_15fa! = ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)))   '@491c4
    V_15fe! = ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))) - 1.0   '@491f1 DS:2d2a
    IF NOT (V_15fe! = 0.0) THEN GOTO L_4926d   '@49223 DS:2cf4
    V_15fe! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4923e
L_4926d:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_492df   '@4926d
    GOTO L_49785   '@492d7
L_492df:
L_492e4:
    IF NOT (A_19fe!(0, 0) <= V_0ef0!) THEN GOTO L_4931b   '@492e9
    GOTO L_497ca   '@49313
L_4931b:
    V_0f14! = FX##(V_0ef0!) + 1.0   '@4931b DS:2cf8
L_49336:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)) THEN GOTO L_49718   '@49336
    V_0ef4# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 0)   '@49383
    V_0efc# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 1)   '@493e3
    V_164a# = RT_POT##((FX##(V_0ef4#) - A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)), (2.0#))   '@49444 DS:2d52
    V_165a# = RT_POT##((FX##(V_0ef4#) - A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)), (2.0#)) + RT_POT##((FX##(V_0efc#) - A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)), (2.0#))   '@494b6 DS:2d52
    IF NOT (V_164a# > V_165a#) THEN GOTO L_495d0   '@49528
    FOR V_15e2! = 0.0 TO 3.0   '@49543 DS:2cf4,2cf8,2d5a
    SWAP A_19fe!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_15e2!))), A_19fe!(RT_CINT%(FX##(V_0f14!)), RT_CINT%(FX##(V_15e2!)))   '@49550
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@495a2 DS:2cf8,2d5a
L_495d0:
    L_BP162# = FX##(A_19fe!(0, 0)) - 1.0   '@495d0 DS:2d2a
    FOR V_0ef4# = V_0f14! TO L_BP162#   '@495f6 DS:2d2e
    FOR V_0efc# = 0.0# TO 3.0#   '@495fe DS:2d2e,2d4a,2d70
    A_19fe!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_19fe!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@4960c DS:2d2e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@49664 DS:2d2e,2d70
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@49690 DS:2d2e
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@496bc DS:2d2a
    V_0f14! = 0.0   '@496f0 DS:2cf4
    GOTO L_49758   '@49701
L_49718:
    V_0f14! = FX##(V_0f14!) + 1.0   '@49718 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0f14!) THEN GOTO L_49336   '@4972e
L_49758:
    IF NOT (V_0f14! = 0.0) THEN GOTO L_4977b   '@49758 DS:2cf4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_492e4   '@49773
L_4977b:
L_49780:
L_49785:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4978a DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) <= V_0ef0!) THEN GOTO L_49190   '@497a0
L_497ca:
    V_0ef0! = 1.0   '@497ca DS:2cf8
L_497e0:
    V_155a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@497e0
    V_1562# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4980a
    V_156a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@49835
    V_1572# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4985d
    IF NOT (ABS(FX##(V_155a#) - V_156a#) < FX##(V_133a!)) THEN GOTO L_498fd   '@49888
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@498ab
    V_156a# = V_155a#   '@498ec
L_498fd:
    IF NOT (ABS(FX##(V_1562#) - V_1572#) < FX##(V_133a!)) THEN GOTO L_49976   '@498fd
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@49920
    V_1572# = V_1562#   '@49965
L_49976:
    V_0f14! = FX##(V_0ef0!) + 1.0   '@49976 DS:2cf8
L_49992:
    IF NOT (A_19fe!(0, 0) >= V_0f14!) THEN GOTO L_49dae   '@49993
    V_153a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)   '@499b7
    V_1542# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 1)   '@499e1
    V_154a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@49a0c
    V_1552# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@49a34
    IF NOT (ABS(FX##(V_155a#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_49ac5   '@49a5f
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@49a82
L_49ac5:
    IF NOT (ABS(FX##(V_155a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_49b29   '@49ac5
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 2) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@49ae8
L_49b29:
    IF NOT (ABS(FX##(V_156a#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_49b8d   '@49b29
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@49b4c
L_49b8d:
    IF NOT (ABS(FX##(V_156a#) - V_154a#) < FX##(V_133a!)) THEN GOTO L_49bef   '@49b8d
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 2) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@49bb0
L_49bef:
    IF NOT (ABS(FX##(V_1562#) - V_1542#) < FX##(V_133a!)) THEN GOTO L_49c57   '@49bef
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 1) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@49c12
L_49c57:
    IF NOT (ABS(FX##(V_1562#) - V_1552#) < FX##(V_133a!)) THEN GOTO L_49cbf   '@49c57
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 3) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@49c7a
L_49cbf:
    IF NOT (ABS(FX##(V_1572#) - V_1542#) < FX##(V_133a!)) THEN GOTO L_49d27   '@49cbf
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 1) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@49ce2
L_49d27:
    IF NOT (ABS(FX##(V_1572#) - V_1552#) < FX##(V_133a!)) THEN GOTO L_49d8f   '@49d27
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 3) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@49d4a
L_49d8f:
    V_0f14! = FX##(V_0f14!) + 1.0   '@49d8f DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49992   '@49da5
L_49dae:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@49dae DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_497e0   '@49dc4
L_49df3:
    V_0ef0! = 1.0   '@49df8 DS:2cf8
L_49e0e:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_49e9f   '@49e0e DS:2cf4
    V_155a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@49e42
    V_1562# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@49e6c
    GOTO L_49f65   '@49e97
L_49e9f:
    V_155a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 0)   '@49e9f
    V_1562# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 1)   '@49eff
L_49f65:
    V_156a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@49f65
    V_1572# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@49f8d
    V_0f14! = FX##(V_0ef0!) + 1.0   '@49fb8 DS:2cf8
L_49fd4:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_4a065   '@49fd4 DS:2cf4
    V_153a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)   '@4a008
    V_1542# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 1)   '@4a032
    GOTO L_4a1b9   '@4a05d
L_4a065:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_4a0f3   '@4a065 DS:2cf4
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) <> A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)) THEN GOTO L_4a0ee   '@4a099
    GOTO L_4b080   '@4a0e6
L_4a0ee:
L_4a0f3:
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 0)   '@4a0f3
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 1)   '@4a153
L_4a1b9:
    V_154a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@4a1b9
    V_1552# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@4a1e1
    L_BP166! = FX##(V_155a#) / 1.0#   '@4a20c DS:2d2e
    L_BP16a! = FX##(V_156a#) / 1.0#   '@4a223 DS:2d2e
    CALL MIXT_082a_Maior(L_BP166!, L_BP16a!, L_BP16e!)   '@4a233
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP172! = FX##(V_153a#) / 1.0#   '@4a248 DS:2d2e
    L_BP176! = FX##(V_154a#) / 1.0#   '@4a259 DS:2d2e
    CALL MIXT_0877_Menor(L_BP172!, L_BP176!, L_BP17a!)   '@4a269
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP17e! = FX##(V_155a#) / 1.0#   '@4a27e DS:2d2e
    L_BP182! = FX##(V_156a#) / 1.0#   '@4a28f DS:2d2e
    CALL MIXT_0877_Menor(L_BP17e!, L_BP182!, L_BP186!)   '@4a29f
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP18a! = FX##(V_153a#) / 1.0#   '@4a2b4 DS:2d2e
    L_BP18e! = FX##(V_154a#) / 1.0#   '@4a2c5 DS:2d2e
    CALL MIXT_082a_Maior(L_BP18a!, L_BP18e!, L_BP192!)   '@4a2d5
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP186! > L_BP192! OR L_BP16e! < L_BP17a!) THEN GOTO L_4a32a   '@4a2ea
    GOTO L_4b080   '@4a322
L_4a32a:
    L_BP196! = FX##(V_1562#) / 1.0#   '@4a32a DS:2d2e
    L_BP19a! = FX##(V_1572#) / 1.0#   '@4a341 DS:2d2e
    CALL MIXT_082a_Maior(L_BP196!, L_BP19a!, L_BP19e!)   '@4a351
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1a2! = FX##(V_1542#) / 1.0#   '@4a366 DS:2d2e
    L_BP1a6! = FX##(V_1552#) / 1.0#   '@4a377 DS:2d2e
    CALL MIXT_0877_Menor(L_BP1a2!, L_BP1a6!, L_BP1aa!)   '@4a387
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ae! = FX##(V_1562#) / 1.0#   '@4a39c DS:2d2e
    L_BP1b2! = FX##(V_1572#) / 1.0#   '@4a3ad DS:2d2e
    CALL MIXT_0877_Menor(L_BP1ae!, L_BP1b2!, L_BP1b6!)   '@4a3bd
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ba! = FX##(V_1542#) / 1.0#   '@4a3d2 DS:2d2e
    L_BP1be! = FX##(V_1552#) / 1.0#   '@4a3e3 DS:2d2e
    CALL MIXT_082a_Maior(L_BP1ba!, L_BP1be!, L_BP1c2!)   '@4a3f3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    IF NOT (L_BP1b6! > L_BP1c2! OR L_BP19e! < L_BP1aa!) THEN GOTO L_4a448   '@4a408
    GOTO L_4b080   '@4a440
L_4a448:
    IF NOT (V_155a# <> V_156a# AND V_153a# = V_154a# OR V_153a# <> V_154a# AND V_155a# = V_156a#) THEN GOTO L_4a4c4   '@4a448
    GOTO L_4b080   '@4a4bc
L_4a4c4:
    IF NOT (V_155a# <> V_154a# AND (V_153a# = V_154a# AND V_155a# = V_156a#)) THEN GOTO L_4a525   '@4a4c4
    GOTO L_4b080   '@4a51d
L_4a525:
    IF NOT (V_155a# = V_156a#) THEN GOTO L_4a691   '@4a525
    V_164a# = V_155a#   '@4a540
    V_1652# = V_156a#   '@4a551
    L_BP1c6! = FX##(V_1562#) / 1.0#   '@4a562 DS:2d2e
    L_BP1ca! = FX##(V_1572#) / 1.0#   '@4a579 DS:2d2e
    CALL MIXT_0877_Menor(L_BP1c6!, L_BP1ca!, L_BP1ce!)   '@4a589
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1d2! = FX##(V_1542#) / 1.0#   '@4a59e DS:2d2e
    L_BP1d6! = FX##(V_1552#) / 1.0#   '@4a5af DS:2d2e
    CALL MIXT_0877_Menor(L_BP1d2!, L_BP1d6!, L_BP1da!)   '@4a5bf
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_0877_Menor(L_BP1ce!, L_BP1da!, L_BP1de!)   '@4a5d3
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_165a# = L_BP1de!   '@4a5e8
    L_BP1e2! = FX##(V_1562#) / 1.0#   '@4a5f3 DS:2d2e
    L_BP1e6! = FX##(V_1572#) / 1.0#   '@4a60a DS:2d2e
    CALL MIXT_082a_Maior(L_BP1e2!, L_BP1e6!, L_BP1ea!)   '@4a61a
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    L_BP1ee! = FX##(V_1542#) / 1.0#   '@4a62f DS:2d2e
    L_BP1f2! = FX##(V_1552#) / 1.0#   '@4a640 DS:2d2e
    CALL MIXT_082a_Maior(L_BP1ee!, L_BP1f2!, L_BP1f6!)   '@4a650
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    CALL MIXT_082a_Maior(L_BP1ea!, L_BP1f6!, L_BP1fa!)   '@4a664
    IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY dentro da SUB
    V_1662# = L_BP1fa!   '@4a679
    GOTO L_4aa01   '@4a684
L_4a691:
    IF NOT (ABS((FX##(V_1572#) - V_1562#) / (FX##(V_156a#) - V_155a#) - (FX##(V_1552#) - V_1542#) / (FX##(V_154a#) - V_153a#)) > FX##(V_133a!)) THEN GOTO L_4a6e3   '@4a691
    GOTO L_4b080   '@4a6db
L_4a6e3:
    IF NOT (V_1572# = V_1552# AND V_156a# = V_154a# OR (V_1572# = V_1542# AND V_156a# = V_153a# OR (V_1562# = V_1552# AND V_155a# = V_154a# OR V_1562# = V_1542# AND V_155a# = V_153a#))) THEN GOTO L_4a7cb   '@4a6e3
    GOTO L_4a845   '@4a7c3
L_4a7cb:
    IF NOT (V_154a# = V_155a#) THEN GOTO L_4a7ee   '@4a7cb
    GOTO L_4b080   '@4a7e6
L_4a7ee:
    IF NOT (ABS((FX##(V_1572#) - V_1562#) / (FX##(V_156a#) - V_155a#) - (FX##(V_1552#) - V_1562#) / (FX##(V_154a#) - V_155a#)) > FX##(V_133a!)) THEN GOTO L_4a840   '@4a7ee
    GOTO L_4b080   '@4a838
L_4a840:
L_4a845:
    V_164a# = V_155a#   '@4a84a
    V_165a# = V_1562#   '@4a85b
    IF NOT (V_156a# < V_164a#) THEN GOTO L_4a8a9   '@4a86c
    V_164a# = V_156a#   '@4a887
    V_165a# = V_1572#   '@4a898
L_4a8a9:
    IF NOT (V_153a# < V_164a#) THEN GOTO L_4a8e6   '@4a8a9
    V_164a# = V_153a#   '@4a8c4
    V_165a# = V_1542#   '@4a8d5
L_4a8e6:
    IF NOT (V_154a# < V_164a#) THEN GOTO L_4a923   '@4a8e6
    V_164a# = V_154a#   '@4a901
    V_165a# = V_1552#   '@4a912
L_4a923:
    V_1652# = V_155a#   '@4a923
    V_1662# = V_1562#   '@4a934
    IF NOT (V_156a# > V_1652#) THEN GOTO L_4a982   '@4a945
    V_1652# = V_156a#   '@4a960
    V_1662# = V_1572#   '@4a971
L_4a982:
    IF NOT (V_153a# > V_1652#) THEN GOTO L_4a9bf   '@4a982
    V_1652# = V_153a#   '@4a99d
    V_1662# = V_1542#   '@4a9ae
L_4a9bf:
    IF NOT (V_154a# > V_1652#) THEN GOTO L_4a9fc   '@4a9bf
    V_1652# = V_154a#   '@4a9da
    V_1662# = V_1552#   '@4a9eb
L_4a9fc:
L_4aa01:
    V_15ea! = 0.0   '@4aa06 DS:2cf4
    L_BP1fe! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0)   '@4aa17
    FOR V_15e2! = 1.0 TO L_BP1fe!   '@4aa46 DS:2cf8
    IF NOT (FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 1)) = FX##(V_165a#) AND FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 0)) = FX##(V_164a#)) THEN GOTO L_4ab13   '@4aa4e
    V_15ea! = V_15e2!   '@4aaf5
    GOTO L_4ab3f   '@4ab06
L_4ab13:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@4ab13 DS:2cf8
L_4ab3f:
    IF NOT (V_15ea! <> 0.0) THEN GOTO L_4ac12   '@4ab3f DS:2cf4
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_15ea!   '@4ab5a
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@4ab87 DS:2cf4
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2) = V_1652#   '@4abb2
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = V_1662#   '@4abda
    GOTO L_4af3e   '@4ac05
L_4ac12:
    V_15ea! = 0.0   '@4ac12 DS:2cf4
    L_BP202! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0)   '@4ac23
    FOR V_15e2! = 1.0 TO L_BP202!   '@4ac52 DS:2cf8
    IF NOT (FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 1)) = FX##(V_1662#) AND FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15e2!))), 0)) = FX##(V_1652#)) THEN GOTO L_4ad1f   '@4ac5a
    V_15ea! = V_15e2!   '@4ad01
    GOTO L_4ad4b   '@4ad12
L_4ad1f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_15e2!   '@4ad1f DS:2cf8
L_4ad4b:
    IF NOT (V_15ea! <> 0.0) THEN GOTO L_4ae1e   '@4ad4b DS:2cf4
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_15ea!   '@4ad66
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1) = 0.0   '@4ad93 DS:2cf4
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2) = V_164a#   '@4adbe
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = V_165a#   '@4ade6
    GOTO L_4af3e   '@4ae11
L_4ae1e:
    IF NOT (V_164a# < 0.0#) THEN GOTO L_4ae91   '@4ae1e DS:2d4a
    SWAP V_164a#, V_1652#   '@4ae46 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
    SWAP V_165a#, V_1662#   '@4ae72 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
L_4ae91:
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) = V_164a#   '@4ae91
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1) = V_165a#   '@4aebb
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2) = V_1652#   '@4aee6
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = V_1662#   '@4af0e
L_4af3e:
    L_BP20a# = FX##(A_19fe!(0, 0)) - 1.0   '@4af43 DS:2d2a
    FOR V_0ef4# = V_0f14! TO L_BP20a#   '@4af69 DS:2d2e
    FOR V_0efc# = 0.0# TO 3.0#   '@4af70 DS:2d2e,2d4a,2d70
    A_19fe!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_19fe!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@4af7e DS:2d2e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@4afd6 DS:2d2e,2d70
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@4b002 DS:2d2e
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@4b02e DS:2d2a
    V_0ef0! = 0.0   '@4b062 DS:2cf4
    GOTO L_4b0c6   '@4b073
L_4b080:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4b085 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0f14!) THEN GOTO L_49fd4   '@4b09b
L_4b0c6:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4b0c6 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) <= V_0ef0!) THEN GOTO L_49e0e   '@4b0dc
    L_BP20e! = 0.0   '@4b106 DS:2cf4
L_4b11c:
    V_0ef0! = 1.0   '@4b121 DS:2cf8
L_4b138:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_4b1c9   '@4b138 DS:2cf4
    V_155a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4b16c
    V_1562# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4b196
    GOTO L_4b28f   '@4b1c1
L_4b1c9:
    V_155a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 0)   '@4b1c9
    V_1562# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 1)   '@4b229
L_4b28f:
    V_156a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4b28f
    V_1572# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4b2b7
    V_0f14! = FX##(V_0ef0!) + 1.0   '@4b2e2 DS:2cf8
L_4b2fe:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_4b38f   '@4b2fe DS:2cf4
    V_153a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)   '@4b332
    V_1542# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 1)   '@4b35c
    GOTO L_4b455   '@4b387
L_4b38f:
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 0)   '@4b38f
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 1)   '@4b3ef
L_4b455:
    V_154a# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@4b455
    V_1552# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@4b47d
    CALL S_11c49   '@4b4a8
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "NAO") THEN GOTO L_4b4d1   '@4b4b2 DS:2d3e
    GOTO L_4b972   '@4b4c9
L_4b4d1:
    IF NOT (ABS(FX##(V_0efc#) - V_1572#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_156a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1562#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_155a#) < FX##(V_133a!)) THEN GOTO L_4b56d   '@4b4d1
    GOTO L_4b730   '@4b565
L_4b56d:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4b56d DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_0ef4#   '@4b5a1
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_0efc#   '@4b5da
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4b614
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4b662
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2) = V_0ef4#   '@4b6b6
    A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3) = V_0efc#   '@4b6de
    V_156a# = V_0ef4#   '@4b709
    V_1572# = V_0efc#   '@4b71a
L_4b730:
    IF NOT (ABS(FX##(V_0efc#) - V_1552#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_154a#) < FX##(V_133a!) OR ABS(FX##(V_0efc#) - V_1542#) < FX##(V_133a!) AND ABS(FX##(V_0ef4#) - V_153a#) < FX##(V_133a!)) THEN GOTO L_4b7d1   '@4b735
    GOTO L_4b972   '@4b7c9
L_4b7d1:
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4b7d1 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_0ef4#   '@4b805
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_0efc#   '@4b83e
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@4b878
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@4b8c6
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 2) = V_0ef4#   '@4b91a
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 3) = V_0efc#   '@4b942
L_4b972:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4b977 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0f14!) THEN GOTO L_4b2fe   '@4b98d
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4b9b7 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) <= V_0ef0!) THEN GOTO L_4b138   '@4b9cd
    IF NOT (A_10cc!(RT_CINT%(FX##(V_0f0c!)), 1) = 1.0) THEN GOTO L_4ba34   '@4b9f7 DS:2cf8
    GOTO L_4d84f   '@4ba2c
L_4ba34:
    V_0ef0! = 1.0   '@4ba34 DS:2cf8
L_4ba4a:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) >= 0.0) THEN GOTO L_4be72   '@4ba4a DS:2cf4
    V_15e2! = 2.0   '@4ba7e DS:2cfc
    V_164a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4ba8f
    V_165a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4bab9
    L_BP212! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4bae4
    FOR V_0f14! = 1.0 TO L_BP212!   '@4bb14 DS:2cf8
    IF NOT (ABS(FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f14!))), 1)) - V_165a#) < FX##(V_133a!) AND ABS(FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f14!))), 0)) - V_164a#) < FX##(V_133a!)) THEN GOTO L_4bbdb   '@4bb1c
    GOTO L_4bc07   '@4bbd3
L_4bbdb:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@4bbdb DS:2cf8
L_4bc07:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) > V_0f14!) THEN GOTO L_4bc47   '@4bc07
    GOTO L_4be77   '@4bc3f
L_4bc47:
    GOSUB L_4ef1b   '@4bc47
    IF NOT (V_0ef0! = 0.0) THEN GOTO L_4bc77   '@4bc54 DS:2cf4
    GOTO L_4bebc   '@4bc6f
L_4bc77:
    V_15e2! = 0.0   '@4bc77 DS:2cf4
    V_164a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4bc88
    V_165a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4bcb0
    L_BP216! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4bcdb
    FOR V_0f14! = 1.0 TO L_BP216!   '@4bd0b DS:2cf8
    IF NOT (ABS(FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f14!))), 1)) - V_165a#) < FX##(V_133a!) AND ABS(FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f14!))), 0)) - V_164a#) < FX##(V_133a!)) THEN GOTO L_4bdd1   '@4bd12
    GOTO L_4bdfd   '@4bdc9
L_4bdd1:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f14!   '@4bdd1 DS:2cf8
L_4bdfd:
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) > V_0f14!) THEN GOTO L_4be3d   '@4bdfd
    GOTO L_4be77   '@4be35
L_4be3d:
    GOSUB L_4ef1b   '@4be3d
    IF NOT (V_0ef0! = 0.0) THEN GOTO L_4be6d   '@4be4a DS:2cf4
    GOTO L_4bebc   '@4be65
L_4be6d:
L_4be72:
L_4be77:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4be7c DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_4ba4a   '@4be92
L_4bebc:
    IF NOT (A_19fe!(0, 0) > A_109e%(RT_CINT%(FX##(V_15e6!)), 0) AND V_0ef0! = 0.0) THEN GOTO L_4bf32   '@4bebc DS:2cf4
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_49df3   '@4bf2a
L_4bf32:
L_4bf37:
    V_0ef0! = 1.0   '@4bf3c DS:2cf8
L_4bf52:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)) - A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)) - A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)) < FX##(V_133a!)) THEN GOTO L_4c1ef   '@4bf52
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@4c006 DS:2d2a
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_4c06c   '@4c03a
    GOTO L_4c230   '@4c064
L_4c06c:
    V_0f14! = V_0ef0!   '@4c06c
L_4c082:
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) = A_19fe!(RT_CINT%(FX##(V_0f14!) + 1.0), 0)   '@4c082 DS:2cf8
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 1) = A_19fe!(RT_CINT%(FX##(V_0f14!) + 1.0), 1)   '@4c0ca DS:2cf8
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 2) = A_19fe!(RT_CINT%(FX##(V_0f14!) + 1.0), 2)   '@4c114 DS:2cf8
    A_19fe!(RT_CINT%(FX##(V_0f14!)), 3) = A_19fe!(RT_CINT%(FX##(V_0f14!) + 1.0), 3)   '@4c158 DS:2cf8
    V_0f14! = FX##(V_0f14!) + 1.0   '@4c1a2 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0f14!) THEN GOTO L_4c082   '@4c1b8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4bf37   '@4c1e2
L_4c1ef:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4c1ef DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_4bf52   '@4c205
L_4c230:
    IF NOT (L_BP20e! = 1.0) THEN GOTO L_4c253   '@4c230 DS:2cf8
    GOTO L_4d845   '@4c24b
L_4c253:
    IF NOT (L_BP20e! = 2.0) THEN GOTO L_4c276   '@4c253 DS:2cfc
    GOTO L_4d84f   '@4c26e
L_4c276:
    V_0ef0! = 1.0   '@4c276 DS:2cf8
L_4c28c:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4c698   '@4c28d
    V_15e2! = 0.0   '@4c2b1 DS:2cf4
    L_BP21a! = A_19fe!(0, 0)   '@4c2c2
    FOR V_0f10! = 1.0 TO L_BP21a!   '@4c2e3 DS:2cf8
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f10!)), 0) > 0.0) THEN GOTO L_4c3ea   '@4c2ea DS:2cf4
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 1)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 0)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_4c3e5   '@4c31e
    V_15e2! = 1.0   '@4c3d4 DS:2cf8
L_4c3e5:
L_4c3ea:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 3)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f10!)), 2)) - L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) < FX##(V_133a!)) THEN GOTO L_4c4af   '@4c3ea
    V_15e2! = 1.0   '@4c49e DS:2cf8
L_4c4af:
    IF NOT (V_15e2! = 1.0) THEN GOTO L_4c4d2   '@4c4af DS:2cf8
    GOTO L_4c4fe   '@4c4ca
L_4c4d2:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4c4d2 DS:2cf8
L_4c4fe:
    IF NOT (V_15e2! = 1.0) THEN GOTO L_4c537   '@4c4fe DS:2cf8
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4c519 DS:2cf8
    GOTO L_4c690   '@4c52f
L_4c537:
    IF NOT (L_BP40!(0, 0) > V_0ef0!) THEN GOTO L_4c657   '@4c537
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0)   '@4c561
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1)   '@4c5b2
    SWAP L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2)   '@4c605
L_4c657:
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) - 1.0   '@4c657 DS:2d2a
L_4c690:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c28c   '@4c690
L_4c698:
    V_0ef0! = 1.0   '@4c698 DS:2cf8
L_4c6ae:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4c966   '@4c6af
    V_15e2! = FX##(V_0ef0!) + 1.0   '@4c6d3 DS:2cf8
L_4c6ee:
    IF NOT (L_BP40!(0, 0) >= V_15e2!) THEN GOTO L_4c948   '@4c6ef
    IF NOT (ABS(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)) - L_BP40!(RT_CINT%(FX##(V_15e2!)), 1)) < FX##(V_133a!) AND ABS(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)) - L_BP40!(RT_CINT%(FX##(V_15e2!)), 0)) < FX##(V_133a!)) THEN GOTO L_4c925   '@4c713
    IF NOT (L_BP40!(0, 0) > V_15e2!) THEN GOTO L_4c8e9   '@4c7c9
    SWAP L_BP40!(RT_CINT%(FX##(V_15e2!)), 0), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0)   '@4c7f3
    SWAP L_BP40!(RT_CINT%(FX##(V_15e2!)), 1), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1)   '@4c844
    SWAP L_BP40!(RT_CINT%(FX##(V_15e2!)), 2), L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2)   '@4c897
L_4c8e9:
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) - 1.0   '@4c8e9 DS:2d2a
    GOTO L_4c940   '@4c91d
L_4c925:
    V_15e2! = FX##(V_15e2!) + 1.0   '@4c925 DS:2cf8
L_4c940:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c6ee   '@4c940
L_4c948:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4c948 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c6ae   '@4c95e
L_4c966:
    V_0ef0! = 1.0   '@4c966 DS:2cf8
L_4c97c:
    IF NOT (L_BP40!(0, 0) >= V_0ef0!) THEN GOTO L_4cf8e   '@4c97d
    V_155a# = L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4c9a1
    V_1562# = L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4c9cb
    V_156a# = RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2))) * -(ABS(RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4c9f6 DS:2d78
    V_1572# = RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2))) * -(ABS(RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0ef0!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4ca8a DS:2d78
    V_15e2! = 0.0   '@4cb1f DS:2cf4
    V_0f14! = 1.0   '@4cb30 DS:2cf8
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4cb72   '@4cb41
    V_0f14! = FX##(V_0f14!) + 1.0   '@4cb5c DS:2cf8
L_4cb72:
L_4cb78:
    IF NOT (L_BP40!(0, 0) >= V_0f14!) THEN GOTO L_4ce38   '@4cb79
    V_153a# = L_BP40!(RT_CINT%(FX##(V_0f14!)), 0)   '@4cb9d
    V_1542# = L_BP40!(RT_CINT%(FX##(V_0f14!)), 1)   '@4cbc7
    V_154a# = RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2))) * -(ABS(RT_COS##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0f14!)), 0)   '@4cbf2 DS:2d78
    V_1552# = RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2))) * -(ABS(RT_SIN##(FX##(L_BP40!(RT_CINT%(FX##(V_0f14!)), 2)))) > FX##(V_133e!)) * 1000.0 + L_BP40!(RT_CINT%(FX##(V_0f14!)), 1)   '@4cc86 DS:2d78
    CALL S_11c49   '@4cd1b
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4cde8   '@4cd25 DS:2d3a
    IF NOT (RT_POT##((FX##(V_156a#) - V_155a#), (2.0#)) + RT_POT##((FX##(V_1572#) - V_1562#), (2.0#)) > RT_POT##((FX##(V_0ef4#) - V_155a#), (2.0#)) + RT_POT##((FX##(V_0efc#) - V_1562#), (2.0#))) THEN GOTO L_4cde3   '@4cd3c DS:2d52
    V_156a# = V_0ef4#   '@4cdab
    V_1572# = V_0efc#   '@4cdbc
    V_15e2! = 1.0   '@4cdcd DS:2cf8
L_4cde3:
L_4cde8:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4cde8 DS:2cf8
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4ce2f   '@4cdfe
    V_0f14! = FX##(V_0f14!) + 1.0   '@4ce19 DS:2cf8
L_4ce2f:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4cb78   '@4ce2f
L_4ce38:
    IF NOT (V_15e2! = 1.0) THEN GOTO L_4cf70   '@4ce38 DS:2cf8
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4ce53 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = V_155a#   '@4ce87
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1) = V_1562#   '@4cec0
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_156a#   '@4cefa
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_1572#   '@4cf31
L_4cf70:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4cf70 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4c97c   '@4cf86
L_4cf8e:
    L_BP40!(0, 0) = 0.0   '@4cf8e DS:2cf4
    V_0ee8! = 1.0   '@4cfae DS:2cf8
L_4cfc4:
    L_BP21e! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4cfc9
    FOR V_0f10! = 1.0 TO L_BP21e!   '@4cff9 DS:2cf8
    IF NOT (V_0ee8! = 1.0 AND A_14a4!(RT_CINT%(FX##(V_0f10!)), 0) = -100.0) THEN GOTO L_4d05f   '@4d000 DS:2cf8,2d36
    GOTO L_4d7b8   '@4d057
L_4d05f:
    V_0ef0! = 1.0   '@4d05f DS:2cf8
L_4d076:
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_4d0f1   '@4d076 DS:2cf4
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) = -V_0f10!) THEN GOTO L_4d0e9   '@4d0aa
    GOTO L_4d318   '@4d0e1
L_4d0e9:
    GOTO L_4d1e8   '@4d0e9
L_4d0f1:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)) < FX##(V_133a!)) THEN GOTO L_4d1e3   '@4d0f1
    GOTO L_4d318   '@4d1db
L_4d1e3:
L_4d1e8:
    IF NOT (ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)) < FX##(V_133a!) AND ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)) < FX##(V_133a!)) THEN GOTO L_4d2d8   '@4d1e8
    GOTO L_4d318   '@4d2d0
L_4d2d8:
    V_0ef0! = FX##(V_0ef0!) + 1.0   '@4d2d8 DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_4d076   '@4d2ee
L_4d318:
    IF NOT (A_19fe!(0, 0) < V_0ef0!) THEN GOTO L_4d7b3   '@4d318
    V_15ea! = 0.0   '@4d342 DS:2cf4
    V_15fa! = FX##(V_0f10!) - 1.0   '@4d353 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4d3b3   '@4d369 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4d384
L_4d3b3:
    V_15fe! = V_0f10!   '@4d3b3
    V_1602! = V_0f10!   '@4d3c4
    V_1606! = FX##(V_0f10!) + 1.0   '@4d3d5 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_4d434   '@4d3eb
    V_1606! = 1.0   '@4d423 DS:2cf8
L_4d434:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1 OR A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_4d4a6   '@4d434
    GOTO L_4d7b8   '@4d49e
L_4d4a6:
    CALL S_13a73   '@4d4a6
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) + 1.0   '@4d4b0 DS:2cf8
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0) = -V_0f10!   '@4d4e4
    V_155a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0)   '@4d520
    V_1562# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1)   '@4d564
    V_156a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 0) + RT_COS##(FX##(V_150a#)) * -(ABS(RT_COS##(FX##(V_150a#))) > FX##(V_133e!)) * 1000.0#   '@4d5a9 DS:2d68
    V_1572# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_0f10!))), 1) + RT_SIN##(FX##(V_150a#)) * -(ABS(RT_SIN##(FX##(V_150a#))) > FX##(V_133e!)) * 1000.0#   '@4d62c DS:2d68
    V_1522! = 0.0   '@4d6b0 DS:2cf4
    L_BP20e! = 1.0   '@4d6c1 DS:2cf8
L_4d6d7:
    CALL S_17b61   '@4d6dc
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "") THEN GOTO L_4d7ae   '@4d6e6 DS:2d3a
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2) = V_0ef4#   '@4d6fd
    A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3) = V_0efc#   '@4d734
    V_156a# = V_0ef4#   '@4d76e
    V_1572# = V_0efc#   '@4d77f
    V_1522! = V_15e2!   '@4d790
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4d6d7   '@4d7a1
L_4d7ae:
L_4d7b3:
L_4d7b8:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0f10!   '@4d7bd DS:2cf8
    IF NOT (V_0ee8! = 1.0) THEN GOTO L_4d81d   '@4d7e9 DS:2cf8
    V_0ee8! = 2.0   '@4d804 DS:2cfc
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4cfc4   '@4d815
L_4d81d:
    IF NOT (L_BP20e! = 1.0) THEN GOTO L_4d840   '@4d81d DS:2cf8
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4b11c   '@4d838
L_4d840:
L_4d845:
L_4d84f:
    L_BP222! = A_19fe!(0, 0)   '@4d854
    FOR V_0ef0! = 1.0 TO L_BP222!   '@4d875 DS:2cf8
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0) < 0.0) THEN GOTO L_4d979   '@4d87c DS:2cf4
    V_164a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 0)   '@4d8b0
    V_165a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0))))), 1)   '@4d910
    GOTO L_4d9d3   '@4d971
L_4d979:
    V_164a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4d979
    V_165a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4d9a3
L_4d9d3:
    V_1652# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4d9d3
    V_1662# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4d9fb
    RT_PSET RT_SNG!(V_166a! + (FX##(V_164a#) - V_1672!) * V_1682!), RT_SNG!(165.0 - FX##(V_166e!) - (FX##(V_165a#) - V_167a!) * V_1686!), 0, 0   '@4da26 DS:2d7c
    L_BP224% = (V_0dcc_placa$ = "CGA")   '@4da88 DS:2d7c,2d80
    L_BP226% = V_0dcc_placa$ = "MCGA" OR L_BP224%   '@4db06 DS:2d88
    L_BP228% = (V_0dcc_placa$ = "HER" OR L_BP226%) * -7   '@4db23 DS:2d90
    L_BP22a% = (V_0dcc_placa$ = "VGA")   '@4db45 DS:2d98
    RT_LINE 0, 0, RT_SNG!(V_166a! + (FX##(V_1652#) - V_1672!) * V_1682!), RT_SNG!(165.0 - FX##(V_166e!) - (FX##(V_1662#) - V_167a!) * V_1686!), 72, ((V_0dcc_placa$ = "EGA" OR L_BP22a%) * -13 + L_BP228%), 21845   '@4db5e DS:2da0
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef0!   '@4db83 DS:2cf8
    RETURN   '@4dbaf
L_4dbbe:   ' sub-rotina (alvo de GOSUB)
L_4dbc8:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fa!))) = 1) THEN GOTO L_4dc7d   '@4dbcd
    V_15fe! = V_15fa!   '@4dbff
    V_15fa! = FX##(V_15fa!) - 1.0   '@4dc10 DS:2d2a
    IF NOT (V_15fa! = 0.0) THEN GOTO L_4dc70   '@4dc26 DS:2cf4
    V_15fa! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4dc41
L_4dc70:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4dbc8   '@4dc70
L_4dc7d:
L_4dc82:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))) = 1) THEN GOTO L_4dd84   '@4dc87
    V_1602! = FX##(V_1602!) + 1.0   '@4dcb9 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1602!) THEN GOTO L_4dd18   '@4dccf
    V_1602! = 1.0   '@4dd07 DS:2cf8
L_4dd18:
    V_1606! = FX##(V_1602!) + 1.0   '@4dd18 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_1606!) THEN GOTO L_4dd77   '@4dd2e
    V_1606! = 1.0   '@4dd66 DS:2cf8
L_4dd77:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4dc82   '@4dd77
L_4dd84:
    CALL S_13a73   '@4dd84
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    V_14da# = V_150a#   '@4dd8e
    V_14e2# = V_1512#   '@4dd9f
    V_164a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 0)   '@4ddb0
    V_165a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_15fe!))), 1)   '@4ddf4
    V_14ea# = V_151a#   '@4de39
    V_1652# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 0)   '@4de4a
    V_1662# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_1602!))), 1)   '@4de8e
    CALL S_15189   '@4ded3
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0efc# = 10000000000.0# AND (V_0ef4# = 10000000000.0# AND V_0f18$ = "NAO")) THEN GOTO L_4e201   '@4dedd DS:2d3e,2da8
    V_0ef4# = (FX##(V_164a#) + V_1652#) / 2.0#   '@4df32 DS:2d52
    V_0efc# = (FX##(V_165a#) + V_1662#) / 2.0#   '@4df4d DS:2d52
    L_BP1e! = V_15fa!   '@4df68
    GOSUB L_4e8b3   '@4df78
    L_BP22! = L_BP2a!   '@4df85
    L_BP1e! = V_1602!   '@4df94
    GOSUB L_4e8b3   '@4dfa4
    L_BP26! = L_BP2a!   '@4dfb1
    IF NOT (L_BP22! <> L_BP26!) THEN GOTO L_4e1fc   '@4dfc0
    V_14e2# = RT_SIN##(FX##(V_0e68_pi#) / 2.0#) / (RT_SQR##(1.0 / (FX##(L_BP22!) + 1.0)) + RT_COS##(FX##(V_0e68_pi#) / 2.0#))   '@4dfd9 DS:2cf8,2d52
    V_14ea# = RT_SIN##(FX##(V_0e68_pi#) / 2.0#) / (RT_SQR##(1.0 / (FX##(L_BP26!) + 1.0)) + RT_COS##(FX##(V_0e68_pi#) / 2.0#))   '@4e021 DS:2cf8,2d52
    IF NOT (L_BP22! > L_BP26!) THEN GOTO L_4e0ac   '@4e069
    L_BP1e! = 1.0# / (FX##(V_14ea#) / V_14e2# + 1.0#)   '@4e082 DS:2d2e
    GOTO L_4e0db   '@4e0a4
L_4e0ac:
    L_BP1e! = 1.0# - 1.0# / (FX##(V_14e2#) / V_14ea# + 1.0#)   '@4e0ac DS:2d2e
L_4e0db:
    V_0ef4# = V_164a#   '@4e0db
    IF NOT (V_164a# > V_1652#) THEN GOTO L_4e12c   '@4e0ec
    V_0ef4# = V_164a# - L_BP1e! * (FX##(V_164a#) - V_1652#)   '@4e107
L_4e12c:
    IF NOT (V_164a# < V_1652#) THEN GOTO L_4e169   '@4e12c
    V_0ef4# = L_BP1e! * (FX##(V_1652#) - V_164a#) + V_164a#   '@4e147
L_4e169:
    V_0efc# = V_165a#   '@4e169
    IF NOT (V_165a# > V_1662#) THEN GOTO L_4e1ba   '@4e17a
    V_0efc# = V_165a# - L_BP1e! * (FX##(V_165a#) - V_1662#)   '@4e195
L_4e1ba:
    IF NOT (V_165a# < V_1662#) THEN GOTO L_4e1f7   '@4e1ba
    V_0efc# = L_BP1e! * (FX##(V_1662#) - V_165a#) + V_165a#   '@4e1d5
L_4e1f7:
L_4e1fc:
L_4e201:
    V_155a# = V_0ef4# - RT_COS##(FX##(V_150a#)) * -(ABS(RT_COS##(FX##(V_14da#))) > FX##(V_133e!)) * 1000.0#   '@4e201 DS:2d68
    V_1562# = V_0efc# - RT_SIN##(FX##(V_150a#)) * -(ABS(RT_SIN##(FX##(V_14da#))) > FX##(V_133e!)) * 1000.0#   '@4e251 DS:2d68
    V_156a# = RT_COS##(FX##(V_150a#)) * -(ABS(RT_COS##(FX##(V_14da#))) > FX##(V_133e!)) * 1000.0# + V_0ef4#   '@4e2a1 DS:2d68
    V_1572# = RT_SIN##(FX##(V_150a#)) * -(ABS(RT_SIN##(FX##(V_14da#))) > FX##(V_133e!)) * 1000.0# + V_0efc#   '@4e2ee DS:2d68
    V_160a! = V_15fe!   '@4e33b
L_4e351:
    V_153a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_160a!))), 0)   '@4e356
    V_1542# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_160a!))), 1)   '@4e39a
    V_160e! = FX##(V_160a!) + 1.0   '@4e3df DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_160e!) THEN GOTO L_4e43e   '@4e3f5
    V_160e! = 1.0   '@4e42d DS:2cf8
L_4e43e:
    V_154a# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_160e!))), 0)   '@4e43e
    V_1552# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(V_160e!))), 1)   '@4e482
    CALL S_11c49   '@4e4c7
    IF RT_EVENTO THEN EXIT SUB   ' ON KEY que sai da SUB
    IF NOT (V_0f1c$ = "NAO") THEN GOTO L_4e554   '@4e4d1 DS:2d3e
    V_160a! = FX##(V_160a!) + 1.0   '@4e4e8 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = V_160a!) THEN GOTO L_4e547   '@4e4fe
    V_160a! = 1.0   '@4e536 DS:2cf8
L_4e547:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4e351   '@4e547
L_4e554:
    RETURN   '@4e554
L_4e563:   ' sub-rotina (alvo de GOSUB)
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 0), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 2.0), 0)   '@4e568 DS:2d5e
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 1), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 2.0), 1)   '@4e5cd DS:2d5e
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 2), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 2.0), 2)   '@4e634 DS:2d5e
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0))), 3), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 2.0), 3)   '@4e695 DS:2d5e
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 1.0), 0), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 3.0), 0)   '@4e6fc DS:2d2a,2db0
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 1.0), 1), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 3.0), 1)   '@4e766 DS:2d2a,2db0
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 1.0), 2), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 3.0), 2)   '@4e7d2 DS:2d2a,2db0
    SWAP A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 1.0), 3), A_19fe!(RT_CINT%(FX##(A_19fe!(0, 0)) - 3.0), 3)   '@4e838 DS:2d2a,2db0
    RETURN   '@4e8a4
L_4e8b3:   ' sub-rotina (alvo de GOSUB)
    L_BP16! = L_BP1e!   '@4e8b8
    L_BP2a! = 0.0   '@4e8c7 DS:2cf4
L_4e8dc:
    L_BP1a! = FX##(L_BP16!) + 1.0   '@4e8dc DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP1a!) THEN GOTO L_4e937   '@4e8f0
    L_BP1a! = 1.0   '@4e927 DS:2cf8
L_4e937:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))) > 2) THEN GOTO L_4eaa8   '@4e937
    L_BP2a! = (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))) - 2) * RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 1)), (2.0))) / 10.0 + L_BP2a!   '@4e967 DS:2cf0,2cfc
L_4eaa8:
    L_BP0e! = L_BP16!   '@4eaa8
    IF NOT (A_14a4!(RT_CINT%(FX##(L_BP16!)), 0) = -100.0) THEN GOTO L_4eb4e   '@4eab7 DS:2d36
    L_BP16! = FX##(L_BP16!) - 1.0   '@4eaea DS:2d2a
    IF NOT (L_BP16! = 0.0) THEN GOTO L_4eb46   '@4eafe DS:2cf4
    L_BP16! = A_109e%(RT_CINT%(FX##(V_15e6!)), 0) - 1   '@4eb18
L_4eb46:
    GOTO L_4eb5b   '@4eb46
L_4eb4e:
    GOTO L_4eb64   '@4eb4e
L_4eb5b:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4e8dc   '@4eb5b
L_4eb64:
    L_BP16! = L_BP1e!   '@4eb64
L_4eb78:
    L_BP16! = FX##(L_BP16!) + 1.0   '@4eb78 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP16!) THEN GOTO L_4ebd3   '@4eb8c
    L_BP16! = 1.0   '@4ebc3 DS:2cf8
L_4ebd3:
    L_BP12! = L_BP16!   '@4ebd3
    IF NOT (A_14a4!(RT_CINT%(FX##(L_BP16!)), 0) = -100.0) THEN GOTO L_4ec78   '@4ebe2 DS:2d36
    L_BP1a! = FX##(L_BP16!) + 1.0   '@4ec15 DS:2cf8
    IF NOT (A_109e%(RT_CINT%(FX##(V_15e6!)), 0) = L_BP1a!) THEN GOTO L_4ec70   '@4ec29
    L_BP1a! = 1.0   '@4ec60 DS:2cf8
L_4ec70:
    GOTO L_4ec85   '@4ec70
L_4ec78:
    GOTO L_4edfe   '@4ec78
L_4ec85:
    IF NOT (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))) > 2) THEN GOTO L_4edf6   '@4ec85
    L_BP2a! = (A_10fa%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))) - 2) * RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP16!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP1a!))), 1)), (2.0))) / 10.0 + L_BP2a!   '@4ecb5 DS:2cf0,2cfc
L_4edf6:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4eb78   '@4edf6
L_4edfe:
    L_BP2a! = L_BP2a! / RT_SQR##(RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP0e!))), 0)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 0)), (2.0)) + RT_POT##((FX##(A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP0e!))), 1)) - A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(FX##(L_BP12!))), 1)), (2.0)))   '@4edfe DS:2cfc
    RETURN   '@4ef0c
L_4ef1b:   ' sub-rotina (alvo de GOSUB)
    V_15ea! = 1.0   '@4ef20 DS:2cf8
    V_0f14! = 1.0   '@4ef31 DS:2cf8
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4ef73   '@4ef42
    V_0f14! = FX##(V_0f14!) + 1.0   '@4ef5d DS:2cf8
L_4ef73:
L_4ef78:
    IF NOT (A_19fe!(0, 0) >= V_0f14!) THEN GOTO L_4f282   '@4ef79
    IF NOT (A_19fe!(RT_CINT%(FX##(V_0f14!)), 0) >= 0.0) THEN GOTO L_4f02e   '@4ef9d DS:2cf4
    V_1652# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 0)   '@4efd1
    V_1662# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 1)   '@4effb
    GOTO L_4f0f4   '@4f026
L_4f02e:
    V_1652# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 0)   '@4f02e
    V_1662# = A_1070!(A_109e%(RT_CINT%(FX##(V_15e6!)), RT_CINT%(ABS(FX##(A_19fe!(RT_CINT%(FX##(V_0f14!)), 0))))), 1)   '@4f08e
L_4f0f4:
    IF NOT (ABS(FX##(V_165a#) - V_1662#) < FX##(V_133a!) AND ABS(FX##(V_164a#) - V_1652#) < FX##(V_133a!)) THEN GOTO L_4f158   '@4f0f4
    V_15ea! = FX##(V_15ea!) + 1.0   '@4f142 DS:2cf8
L_4f158:
    V_1652# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 2)   '@4f158
    V_1662# = A_19fe!(RT_CINT%(FX##(V_0f14!)), 3)   '@4f180
    IF NOT (ABS(FX##(V_165a#) - V_1662#) < FX##(V_133a!) AND ABS(FX##(V_164a#) - V_1652#) < FX##(V_133a!)) THEN GOTO L_4f20f   '@4f1ab
    V_15ea! = FX##(V_15ea!) + 1.0   '@4f1f9 DS:2cf8
L_4f20f:
    V_0f14! = FX##(V_0f14!) + 1.0   '@4f20f DS:2cf8
    IF NOT (V_0f14! = V_0ef0!) THEN GOTO L_4f256   '@4f225
    V_0f14! = FX##(V_0f14!) + 1.0   '@4f240 DS:2cf8
L_4f256:
    IF NOT (V_15ea! >= 2.0) THEN GOTO L_4f279   '@4f256 DS:2cfc
    GOTO L_4f282   '@4f271
L_4f279:
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    GOTO L_4ef78   '@4f279
L_4f282:
    IF NOT (V_15ea! < 2.0) THEN GOTO L_4f846   '@4f282 DS:2cfc
    L_BP40!(0, 0) = FX##(L_BP40!(0, 0)) + 1.0   '@4f29d DS:2cf8
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 0) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_15e2!)))   '@4f2d1
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 1) = A_19fe!(RT_CINT%(FX##(V_0ef0!)), RT_CINT%(FX##(V_15e2!) + 1.0))   '@4f32b DS:2cf8
    V_155a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 0)   '@4f38b
    V_1562# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 1)   '@4f3b5
    V_156a# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 2)   '@4f3e0
    V_1572# = A_19fe!(RT_CINT%(FX##(V_0ef0!)), 3)   '@4f408
    IF NOT (V_15e2! = 2.0) THEN GOTO L_4f4ab   '@4f433 DS:2cfc
    SWAP V_155a#, V_156a#   '@4f45b (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
    SWAP V_1562#, V_1572#   '@4f487 (SWAP inline: MOV/XCHG no .asm; o lift mostra ?? 31 bytes)
L_4f4ab:
    IF NOT (V_156a# = V_155a#) THEN GOTO L_4f51a   '@4f4ab
    V_14f2# = FX##(V_0e68_pi#) / 2.0#   '@4f4c6 DS:2d52
    IF NOT (V_1572# < V_1562#) THEN GOTO L_4f512   '@4f4dc
    V_14f2# = 3.0# * FX##(V_0e68_pi#) / 2.0#   '@4f4f7 DS:2d52,2d70
L_4f512:
    GOTO L_4f6d9   '@4f512
L_4f51a:
    IF NOT (V_1572# <= V_1562# AND V_156a# < V_155a#) THEN GOTO L_4f587   '@4f51a
    V_14f2# = ATN((FX##(V_1562#) - V_1572#) / (FX##(V_155a#) - V_156a#)) + V_0e68_pi#   '@4f558
L_4f587:
    IF NOT (V_1572# >= V_1562# AND V_156a# > V_155a#) THEN GOTO L_4f5ef   '@4f587
    V_14f2# = ATN((FX##(V_1572#) - V_1562#) / (FX##(V_156a#) - V_155a#))   '@4f5c5
L_4f5ef:
    IF NOT (V_1572# < V_1562# AND V_156a# > V_155a#) THEN GOTO L_4f664   '@4f5ef
    V_14f2# = 2.0# * FX##(V_0e68_pi#) - ATN((FX##(V_1562#) - V_1572#) / (FX##(V_156a#) - V_155a#))   '@4f62d DS:2d52
L_4f664:
    IF NOT (V_1572# > V_1562# AND V_156a# < V_155a#) THEN GOTO L_4f6d4   '@4f664
    V_14f2# = V_0e68_pi# - ATN((FX##(V_1572#) - V_1562#) / (FX##(V_155a#) - V_156a#))   '@4f6a2
L_4f6d4:
L_4f6d9:
    L_BP40!(RT_CINT%(FX##(L_BP40!(0, 0))), 2) = V_14f2#   '@4f6d9
    L_BP232# = FX##(A_19fe!(0, 0)) - 1.0   '@4f710 DS:2d2a
    FOR V_0ef4# = V_0ef0! TO L_BP232#   '@4f736 DS:2d2e
    FOR V_0efc# = 0.0# TO 3.0#   '@4f73e DS:2d2e,2d4a,2d70
    A_19fe!(RT_CINT%(FX##(V_0ef4#)), RT_CINT%(FX##(V_0efc#))) = A_19fe!(RT_CINT%(FX##(V_0ef4#) + 1.0#), RT_CINT%(FX##(V_0efc#)))   '@4f74c DS:2d2e
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0efc#   '@4f7a4 DS:2d2e,2d70
    IF RT_ROT_ATIVO THEN RT_EVCK: IF RT_EVENTO THEN IF RT_ONKEY_FICA%(RT_EVENTO) THEN RT_EVENTO = 0 ELSE EXIT SUB   ' ON KEY no laco (B$EVCK)
    NEXT V_0ef4#   '@4f7d0 DS:2d2e
    A_19fe!(0, 0) = FX##(A_19fe!(0, 0)) - 1.0   '@4f7fc DS:2d2a
    V_0ef0! = 0.0   '@4f830 DS:2cf4
L_4f846:
    RETURN   '@4f846
L_4f855:   ' entrada vinda de 0401b9_FUN_4000_01b9
    ' @4f855 libera strings locais (L_BP110)
    ' @4f85f libera strings locais (L_BP96)
    ERASE L_BP40!   '@4f869
    ' END SUB   '@4f872
END SUB

'$INCLUDE: '../comum/RT45.BM'
'$INCLUDE: '../comum/RT45GFX.BM'
'$INCLUDE: 'COMUM_LAJE.BM'
'$INCLUDE: '../comum/MIXT.BM'
