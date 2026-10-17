$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISCOMUM.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DECLARE FUNCTION ContaControle% ()

' Testa SISCOMUM contra os arquivos de sistrut-game/. Uso: T_COMUM <diretorio de dados>
DIM d$, n%, m%, i%, k%, diff%, desc$
DIM Esperado$(ARQ_MAX)

d$ = COMMAND$
IF d$ = "" THEN
    PRINT "FAIL uso: T_COMUM <diretorio de dados>"
    SYSTEM 1
END IF
IF RIGHT$(d$, 1) <> "\" AND RIGHT$(d$, 1) <> "/" THEN d$ = d$ + "\"

' --- arquivos ---------------------------------------------------------------
AssertTrue "FileExists% acha LAJE.INI", FileExists%(d$ + "LAJE.INI")
AssertTrue "FileExists% nega arquivo inexistente", FileExists%(d$ + "NAO_EXISTE.XYZ") = 0
AssertNear "ArqLer% devolve -1 se o arquivo nao existe", ArqLer%(d$ + "NAO_EXISTE.XYZ"), -1, 0

' --- INI (LAJE.INI, CRLF) ----------------------------------------------------
n% = ArqLer%(d$ + "LAJE.INI")
AssertTrue "LAJE.INI tem pelo menos 32 linhas", n% >= 32
AssertEq "LAJE linha 1 valor", IniValor$(1), "C"
AssertEq "LAJE linha 1 descricao", IniDesc$(1), "DRIVE DEFAULT DE DADOS"
AssertEq "IniDirDados$: raiz C:\ do original vira a pasta de trabalho", IniDirDados$, DirUtilizavel$("")
AssertTrue "DirUtilizavel$ termina em barra", RIGHT$(DirUtilizavel$(""), 1) = "\" OR RIGHT$(DirUtilizavel$(""), 1) = "/"
AssertEq "IniDirParam$ le o diretorio de parametrizacao", IniDirParam$, "C:\SISTRUT\EXEC40\"

i% = ArqAchaTexto%("RESISTENCIA CARACTERISTICA DO CONCRETO", 0)
AssertTrue "LAJE acha a linha do Fck", i% > 0
AssertNear "Fck da LAJE = 0.15", VAL(IniValor$(i%)), 0.15#, 0.000001#

i% = ArqAchaTexto%("COEFICIENTE DE SEGURANCA DOS ESFORCOS", 0)
AssertNear "coeficiente dos esforcos = 1.4", VAL(IniValor$(i%)), 1.4#, 0.000001#

i% = ArqAchaTexto%("COEFICIENTE DE SEGURANCA DO ACO", 0)
AssertNear "coeficiente do aco = 1.15", VAL(IniValor$(i%)), 1.15#, 0.000001#

i% = ArqAchaTexto%("CHR$(27)+CHR$(50)", 0)
AssertTrue "LAJE tem a linha CHR$(27)+CHR$(50)", i% > 0
AssertEq "ChrAvalia$ da linha da LAJE = ESC 2", ChrAvalia$(IniValor$(i%)), CHR$(27) + CHR$(50)
AssertEq "ChrAvalia$ ESC N 6", ChrAvalia$("CHR$(27)+CHR$(78)+CHR$(6)"), CHR$(27) + CHR$(78) + CHR$(6)
AssertEq "ChrAvalia$ mistura texto e CHR$", ChrAvalia$("ABC+CHR$(65)"), "ABCA"

' --- parametrizacao (SISTRUT.LAP, CRLF, termina em FINAL DA PARAMETRIZACAO) --
n% = ArqLer%(d$ + "SISTRUT.LAP")
AssertTrue "LAP carregou", n% > 0
AssertNear "LAP sem CR, LF ou 0x1A nas linhas", ContaControle%, 0, 0
AssertTrue "LAP acha FINAL DA PARAMETRIZACAO", ArqAchaExato%("FINAL DA PARAMETRIZACAO", 0) > 0
AssertTrue "LAP acha PARAMETROS GLOBAIS", ArqAchaExato%("PARAMETROS GLOBAIS", 0) > 0

i% = ArqAchaTexto%("COBRIMENTO DA ARMADURA", 0)
AssertNear "cobrimento da armadura = 1.5", VAL(ParToken$(ArqLinha$(i%), " ", 1)), 1.5#, 0.000001#

i% = ArqAchaTexto%("MINIMA ALTURA TOTAL DA LAJE", 0)
AssertNear "altura minima da laje = 6", VAL(ParToken$(ArqLinha$(i%), " ", 1)), 6#, 0.000001#

i% = ArqAchaTexto%("MAXIMA ALTURA TOTAL DA LAJE", 0)
AssertNear "altura maxima da laje = 40", VAL(ParToken$(ArqLinha$(i%), " ", 1)), 40#, 0.000001#

i% = ArqAchaExato%("PARAMETROS", 90)
AssertTrue "LAP acha a secao PARAMETROS da lista", i% > 0
AssertNear "lista tem 2 campos", ParConta%(ArqLinha$(i% + 1), ","), 2, 0
AssertNear "lista campo 1 = 0.25", VAL(ParToken$(ArqLinha$(i% + 1), ",", 1)), 0.25#, 0.000001#
AssertNear "lista campo 2 = 0.40", VAL(ParToken$(ArqLinha$(i% + 1), ",", 2)), 0.4#, 0.000001#

i% = ArqAchaTexto%("BITOLA (MM)", 0)
AssertTrue "LAP acha o cabecalho da tabela de bitolas", i% > 0
AssertNear "linha da tabela tem 4 campos", ParConta%(ArqLinha$(i% + 1), "-"), 4, 0
AssertEq "linha da tabela campo 2 = bitola 4", ParToken$(ArqLinha$(i% + 1), "-", 2), "4"

' --- listas com outros separadores ---------------------------------------
AssertNear "lista com / tem 3 campos", ParConta%("7.5/ 10/ 12.5/", "/ "), 3, 0
AssertEq "lista com / campo 3", ParToken$("7.5/ 10/ 12.5/", "/ ", 3), "12.5"
AssertNear "lista com # e + tem 3 campos", ParConta%("2#12.5+#8", "#+"), 3, 0
AssertEq "lista com # e + campo 3", ParToken$("2#12.5+#8", "#+", 3), "8"
AssertEq "ParToken$ fora da faixa devolve vazio", ParToken$("1 2", " ", 5), ""

' --- formatacao e validacao numerica -----------------------------------
AssertEq "FormataNumero$ 1.5 com 2 casas", FormataNumero$(1.5#, 2, 0), "1.50"
AssertEq "FormataNumero$ arredonda 0.125 para 0.13", FormataNumero$(0.125#, 2, 0), "0.13"
AssertEq "FormataNumero$ negativo com largura 8", FormataNumero$(-2.345#, 1, 8), SPACE$(4) + "-2.3"
AssertEq "FormataNumero$ zero negativo sai sem sinal", FormataNumero$(-0.001#, 2, 0), "0.00"
AssertEq "FormataNumero$ inteiro sem casas", FormataNumero$(12#, 0, 0), "12"

AssertTrue "NumeroValido% aceita 1.5", NumeroValido%("1.5")
AssertTrue "NumeroValido% aceita -2", NumeroValido%("-2")
AssertTrue "NumeroValido% rejeita 1a", NumeroValido%("1a") = 0
AssertTrue "NumeroValido% rejeita 1.2.3", NumeroValido%("1.2.3") = 0
AssertTrue "NumeroValido% rejeita hifen no meio", NumeroValido%("1-2") = 0
AssertTrue "NumeroValido% rejeita vazio", NumeroValido%("") = 0

' --- PLOTER.INI (CRLF) e SISTRUT.DSP (padding 0x1A) -----------------------
n% = ArqLer%(d$ + "PLOTER.INI")
AssertTrue "PLOTER.INI tem 761 linhas ou mais", n% >= 761
AssertNear "PLOTER sem CR, LF ou 0x1A nas linhas", ContaControle%, 0, 0

n% = ArqLer%(d$ + "SISTRUT.DSP")
AssertTrue "DSP carregou", n% > 0
AssertNear "DSP sem 0x1A nas linhas", ContaControle%, 0, 0

' --- round-trip de gravacao (fica por ultimo, pois troca o conteudo de LAJE) --
n% = ArqLer%(d$ + "LAJE.INI")
i% = ArqAchaTexto%("RESISTENCIA CARACTERISTICA DO CONCRETO", 0)
desc$ = IniDesc$(i%)
IniDefinir i%, "0.20"
AssertEq "IniDefinir troca so o valor", IniValor$(i%), "0.20"
AssertEq "IniDefinir mantem a descricao", IniDesc$(i%), desc$
FOR k% = 1 TO n%
    Esperado$(k%) = ArqLinha$(k%)
NEXT
ArqGravar "T_COMUM_RT.TMP"
m% = ArqLer%("T_COMUM_RT.TMP")
AssertNear "round-trip mantem o numero de linhas", m%, n%, 0
diff% = 0
FOR k% = 1 TO n%
    IF ArqLinha$(k%) <> Esperado$(k%) THEN diff% = diff% + 1
NEXT
AssertNear "round-trip mantem o conteudo das linhas", diff%, 0, 0
KILL "T_COMUM_RT.TMP"

TestEnd

' Conta linhas com CR, LF ou 0x1A restantes em ArqDados$ (deve ser zero apos ArqLer%)
FUNCTION ContaControle% ()
    DIM k%, c%
    c% = 0
    FOR k% = 1 TO ArqQtd
        IF INSTR(ArqDados$(k%), CHR$(13)) > 0 OR INSTR(ArqDados$(k%), CHR$(10)) > 0 OR INSTR(ArqDados$(k%), CHR$(26)) > 0 THEN c% = c% + 1
    NEXT
    ContaControle% = c%
END FUNCTION

'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISCOMUM.BM'
