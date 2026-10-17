' Garante que as quatro bibliotecas comuns compilam juntas no mesmo programa,
' na ordem de inclusao usada pelos modulos.
$CONSOLE:ONLY
'$INCLUDE: '../src-reconstructed/common/SISCOMUM.BI'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BI'
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
AssertTrue "SISCOMUM + SISDADOS + CALCCA + SISPLOT juntos", CcaAreaBarra#(10) > 0 AND DadNome$("X  ") = "X"
AssertEq "FormataNumero da SISCOMUM", LTRIM$(FormataNumero$(1.5#, 2, 6)), "1.50"
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/SISCOMUM.BM'
'$INCLUDE: '../src-reconstructed/common/SISDADOS.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/common/SISPLOT.BM'
