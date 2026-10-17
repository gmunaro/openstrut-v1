' SONDA_CHAIN - sonda de teste da familia sistema (nao faz parte da V1).
' Compilada com o nome de um modulo (LAJE.exe, VIGA.exe, SISEDIT.exe...) ao lado do
' SISTRUT.exe retraduzido, recebe o CHAIN do gerenciador no lugar do modulo e grava o que
' chegou no arquivo de troca do RT45 (comum/RT45.BM, RT_TROCA_GRAVA_CAB e RT_COMMON_GRAVA):
'   <SISTRUT_SAIDA>telas\NNN_chain_<modulo>.txt         tela de texto (CP437, como RT_GRAVA_TELA)
'   <SISTRUT_SAIDA>telas\NNN_chain_<modulo>.realce.txt  caracteres fora do atributo mais comum
'   <SISTRUT_SAIDA>telas\NNN_chain_<modulo>.atr.txt     atributo de cada celula (hex), como o RT45
'   <SISTRUT_SAIDA>chain_<modulo>.info.txt             cursor, modo, atributos e bytes de COMMON
' NNN = numero da proxima tela do roteiro, como se o modulo gravasse um {TELA chain_<modulo>}.
$SCREENHIDE
DIM troca AS STRING, p AS LONG, f AS INTEGER, g AS INTEGER
DIM s AS STRING * 16, n AS LONG, telan AS INTEGER, modo AS INTEGER, lin AS INTEGER, col AS INTEGER
DIM ch(1 TO 25, 1 TO 80) AS _UNSIGNED _BYTE, at(1 TO 25, 1 TO 80) AS _UNSIGNED _BYTE
DIM r AS INTEGER, c AS INTEGER, conta(255) AS LONG, comum AS INTEGER
DIM prog AS STRING, saida AS STRING, arqb AS STRING, l AS STRING, resto AS LONG
DIM vp1 AS INTEGER, vp2 AS INTEGER

prog = COMMAND$(0)
FOR p = LEN(prog) TO 1 STEP -1
    IF MID$(prog, p, 1) = "\" OR MID$(prog, p, 1) = "/" THEN EXIT FOR
NEXT
prog = MID$(prog, p + 1)
IF UCASE$(RIGHT$(prog, 4)) = ".EXE" THEN prog = LEFT$(prog, LEN(prog) - 4)
prog = LCASE$(prog)
saida = ENVIRON$("SISTRUT_SAIDA")
IF saida = "" THEN saida = "."
IF RIGHT$(saida, 1) <> "\" THEN saida = saida + "\"

p = INSTR(COMMAND$, "/CHAIN:")
IF p = 0 THEN SYSTEM
troca = MID$(COMMAND$, p + 7)
IF LEFT$(troca, 1) = CHR$(34) THEN troca = MID$(troca, 2)
IF INSTR(troca, CHR$(34)) THEN troca = LEFT$(troca, INSTR(troca, CHR$(34)) - 1)
IF NOT _FILEEXISTS(troca) THEN SYSTEM
f = FREEFILE
OPEN troca FOR BINARY AS #f
GET #f, , s
GET #f, , n
GET #f, , telan
GET #f, , modo
GET #f, , lin
GET #f, , col
FOR r = 1 TO 25
    FOR c = 1 TO 80
        GET #f, , ch(r, c)
        GET #f, , at(r, c)
        conta(at(r, c)) = conta(at(r, c)) + 1
    NEXT
NEXT
' versao 2 ou mais do arquivo de troca: VIEW PRINT corrente (2 INTEGER) depois da tela; em modo
' grafico vem ainda a parte grafica (o gerenciador faz CHAIN sempre em modo texto)
IF VAL(MID$(s, 15, 1)) >= 2 THEN GET #f, , vp1: GET #f, , vp2
resto = LOF(f) - SEEK(f) + 1
CLOSE #f
KILL troca

FOR c = 1 TO 255
    IF conta(c) > conta(comum) THEN comum = c
NEXT
IF NOT _DIREXISTS(saida + "telas") THEN MKDIR saida + "telas"
arqb = saida + "telas\" + RIGHT$("00" + LTRIM$(STR$(telan + 1)), 3) + "_chain_" + prog
g = FREEFILE
OPEN arqb + ".txt" FOR OUTPUT AS #g
FOR r = 1 TO 25
    l = ""
    FOR c = 1 TO 80: l = l + CHR$(ch(r, c)): NEXT
    PRINT #g, l
NEXT
CLOSE #g
OPEN arqb + ".realce.txt" FOR OUTPUT AS #g
FOR r = 1 TO 25
    l = ""
    FOR c = 1 TO 80
        IF at(r, c) <> comum THEN l = l + CHR$(ch(r, c)) ELSE l = l + " "
    NEXT
    PRINT #g, RTRIM$(l)
NEXT
CLOSE #g
OPEN arqb + ".atr.txt" FOR OUTPUT AS #g
FOR r = 1 TO 25
    l = ""
    FOR c = 1 TO 80: l = l + RIGHT$("0" + HEX$(at(r, c)), 2): NEXT
    PRINT #g, l
NEXT
CLOSE #g
OPEN saida + "chain_" + prog + ".info.txt" FOR OUTPUT AS #g
PRINT #g, "assinatura: "; s
PRINT #g, "modo:"; modo; " cursor: linha"; lin; "coluna"; col; " tela n.:"; telan; " posicao do roteiro:"; n; " VIEW PRINT:"; vp1; vp2
PRINT #g, "bytes de COMMON depois da tela:"; resto
PRINT #g, "atributos (hex) por linha:"
FOR r = 1 TO 25
    l = ""
    FOR c = 1 TO 80: l = l + RIGHT$("0" + HEX$(at(r, c)), 2): NEXT
    PRINT #g, l
NEXT
CLOSE #g
' fim da cadeia no registro do RT45 (tools/roda_retrad.sh espera "<EXE>: fim" no fim da linha)
IF ENVIRON$("SISTRUT_LOG") <> "" THEN
    OPEN ENVIRON$("SISTRUT_LOG") FOR APPEND AS #g
    PRINT #g, TIME$; " "; UCASE$(prog); ": fim"
    CLOSE #g
END IF
SYSTEM
