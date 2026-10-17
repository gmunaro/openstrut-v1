' Teste do desenho vetorial (common/SISPLOT.BM): grava .VET, converte para
' HP-GL e DXF e confere o conteudo gerado.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISTELA.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM dir AS STRING, f AS INTEGER, n AS INTEGER, ln AS STRING, todo AS STRING
dir = COMMAND$
IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" AND RIGHT$(dir, 1) <> "\" THEN dir = dir + "/"

f = VetAbre%(dir + "TESTE.VET", "Teste, com virgula")
VetLinha f, 0, 0, 100, 0, 1
VetTexto f, 10, 10, 2.5, 0, 2, "V1 20x50"
VetCirculo f, 50, 50, 5, 3
VetRetangulo f, 0, 0, 10, 10, 1
VetFecha f

n = VetParaHpgl%(dir + "TESTE.VET", dir + "TESTE.PLT")
AssertTrue "hpgl: 7 entidades", n = 7
todo = LeTudo$(dir + "TESTE.PLT")
AssertTrue "hpgl: inicializa", LEFT$(todo, 3) = "IN;"
AssertTrue "hpgl: linha 100mm = 4000 unidades", INSTR(todo, "PU0,0;PD4000,0;") > 0
AssertTrue "hpgl: rotulo com ETX", INSTR(todo, "LBV1 20x50" + CHR$(3)) > 0
AssertTrue "hpgl: circulo raio 200", INSTR(todo, "CI200;") > 0
AssertTrue "hpgl: troca de pena", INSTR(todo, "SP2;") > 0

n = VetParaDxf%(dir + "TESTE.VET", dir + "TESTE.DXF")
AssertTrue "dxf: 7 entidades", n = 7
todo = LeTudo$(dir + "TESTE.DXF")
AssertTrue "dxf: secao ENTITIES", INSTR(todo, "SECTION|2|ENTITIES|") > 0
AssertTrue "dxf: termina em EOF", RIGHT$(todo, 4) = "EOF|"
AssertTrue "dxf: texto", INSTR(todo, "|1|V1 20x50|") > 0
AssertTrue "dxf: circulo camada PENA3", INSTR(todo, "CIRCLE|8|PENA3|") > 0

' arquivo invalido
f = FREEFILE: OPEN dir + "RUIM.VET" FOR OUTPUT AS #f: WRITE #f, "X", "Y", 1, "t": CLOSE #f
AssertTrue "vet invalido -> -1", VetParaHpgl%(dir + "RUIM.VET", dir + "RUIM.PLT") = -1
TestEnd

' Le um arquivo texto inteiro juntando as linhas com "|".
FUNCTION LeTudo$ (arq AS STRING)
    DIM f AS INTEGER, ln AS STRING, s AS STRING
    f = FREEFILE
    OPEN arq FOR INPUT AS #f
    DO WHILE NOT EOF(f)
        LINE INPUT #f, ln
        s = s + ln + "|"
    LOOP
    CLOSE #f
    LeTudo$ = s
END FUNCTION
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISPLOT.BM'
'$INCLUDE: '../src-reconstructed/common/SISTELA.BM'
