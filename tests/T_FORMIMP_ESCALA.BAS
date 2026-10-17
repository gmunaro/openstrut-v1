' Teste da escala de impressao do FORMIMP (forma/FORMIMPESC.BM). Grava .VET e
' le de volta. Os valores esperados sao contas a mao, em comentario em cada bloco.
' Folha util 806 x 574 mm, margem esq. 25 e inf. 10 (RECONSTRUCAO no .BM).
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
DIM dir AS STRING, f AS INTEGER, todo AS STRING, nx AS INTEGER, ny AS INTEGER, ql AS STRING
ql = CHR$(34) + "L" + CHR$(34)
dir = COMMAND$
IF dir = "" THEN dir = "."
IF RIGHT$(dir, 1) <> "/" AND RIGHT$(dir, 1) <> "\" THEN dir = dir + "/"

' Escala: 1000 mm / escala = mm no papel por metro real.
AssertNear "escala 1/50 = 20 mm/m", EscMmPorM#(50), 20#, 0.000001
AssertNear "escala 1/100 = 10 mm/m", EscMmPorM#(100), 10#, 0.000001

' Laje de 4 m x 2 m a 1/50: X 4 x 20 = 80 mm, origem na margem 25 -> X 25 a 105.
' Y 2 x 20 = 40 mm, origem na margem 10 -> Y 10 a 50.
f = VetAbre%(dir + "ESC50.VET", "Laje 1/50")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 0#, 0#, EscMmPorM#(50), -1000000#, -1000000#, 1000000#, 1000000#
VetFecha f
todo = LeTudo$(dir + "ESC50.VET")
AssertTrue "1/50: lado inferior 25 a 105 mm (80 mm)", INSTR(todo, "|" + ql + ",25,10,105,10,1|") > 0
AssertTrue "1/50: lado direito x=105, y 10 a 50", INSTR(todo, "|" + ql + ",105,10,105,50,1|") > 0

' Mesma laje a 1/100: X 4 x 10 = 40 mm -> 25 a 65. Y 2 x 10 = 20 mm -> 10 a 30.
f = VetAbre%(dir + "ESC100.VET", "Laje 1/100")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 0#, 0#, EscMmPorM#(100), -1000000#, -1000000#, 1000000#, 1000000#
VetFecha f
todo = LeTudo$(dir + "ESC100.VET")
AssertTrue "1/100: lado inferior 25 a 65 mm (40 mm)", INSTR(todo, "|" + ql + ",25,10,65,10,1|") > 0
AssertTrue "1/100: lado direito x=65, y 10 a 30", INSTR(todo, "|" + ql + ",65,10,65,30,1|") > 0

' Recorte: janela X de -1e6 a 2 m corta a laje em 2 m -> X 25 a 65 a 1/50, sem x=105.
f = VetAbre%(dir + "RECORTE.VET", "Recorte")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 0#, 0#, 20#, -1000000#, -1000000#, 2#, 1000000#
VetFecha f
todo = LeTudo$(dir + "RECORTE.VET")
AssertTrue "recorte: lado inferior 25 a 65 mm", INSTR(todo, "|" + ql + ",25,10,65,10,1|") > 0
AssertTrue "recorte: nenhuma linha em x=105", INSTR(todo, ",105,") = 0

' Parte 2: folha com origem em X=2 m. Laje 0..4 m cortada a 2..4 m: 2 m x 20 = 40 mm,
' X = (2-2)x20+25 = 25 a (4-2)x20+25 = 65.
f = VetAbre%(dir + "PARTE2.VET", "Parte 2")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 2#, 0#, 20#, 2#, -1000000#, 4#, 1000000#
VetFecha f
todo = LeTudo$(dir + "PARTE2.VET")
AssertTrue "parte 2: origem em 2 m, X 25 a 65 mm", INSTR(todo, "|" + ql + ",25,10,65,10,1|") > 0

' Fora da janela nao grava nada: laje 0..4 m, janela 5..6 m.
f = VetAbre%(dir + "FORA.VET", "Fora")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 5#, 0#, 20#, 5#, -1000000#, 6#, 1000000#
VetFecha f
todo = LeTudo$(dir + "FORA.VET")
AssertTrue "fora da janela: nenhuma linha L", INSTR(todo, ql) = 0

' FOTO: min(806 / 4, 574 / 2) = min(201.5, 287) = 201.5 mm/m.
' X: 4 x 201.5 = 806 -> 25 a 831. Y: 2 x 201.5 = 403 -> 10 a 413.
AssertNear "FOTO 4 x 2 m = 201.5 mm/m", EscFotoMmPorM#(4#, 2#), 201.5#, 0.000001
' FOTO 1 x 10 m: min(806, 574 / 10 = 57.4) -> altura limita, 57.4 mm/m.
AssertNear "FOTO 1 x 10 m = 57.4 mm/m", EscFotoMmPorM#(1#, 10#), 57.4#, 0.000001
f = VetAbre%(dir + "FOTO.VET", "Foto")
EscRetangulo f, 0#, 0#, 4#, 2#, 1, 0#, 0#, EscFotoMmPorM#(4#, 2#), -1000000#, -1000000#, 1000000#, 1000000#
VetFecha f
todo = LeTudo$(dir + "FOTO.VET")
AssertTrue "FOTO: lado inferior 25 a 831 mm", INSTR(todo, "|" + ql + ",25,10,831,10,1|") > 0
AssertTrue "FOTO: lado direito x=831, y 10 a 413", INSTR(todo, "|" + ql + ",831,10,831,413,1|") > 0

' Partes: 50 m a 1/50 = 1000 mm; 1000 / 806 -> 2 folhas em X. Altura 1 m = 20 mm: 1 folha.
EscPartes 50#, 1#, 20#, nx, ny
AssertTrue "partes: 50 m a 1/50 = 2 folhas em X", nx = 2
AssertTrue "partes: 1 m a 1/50 = 1 folha em Y", ny = 1
' 40 m a 1/50 = 800 mm: cabe numa folha. 41 m = 820 mm: duas.
EscPartes 40#, 1#, 20#, nx, ny
AssertTrue "partes: 800 mm cabem em 1 folha", nx = 1
EscPartes 41#, 1#, 20#, nx, ny
AssertTrue "partes: 820 mm pedem 2 folhas", nx = 2
' Altura 50 m a 1/50 = 1000 mm; 1000 / 574 -> 2 folhas em Y.
EscPartes 1#, 50#, 20#, nx, ny
AssertTrue "partes: 1000 mm em Y pedem 2 folhas", ny = 2

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
'$INCLUDE: '../src-reconstructed/forma/FORMIMPESC.BM'
