' Teste do RT_PU# (PRINT USING arredondado como o QB4.5) com os valores do QB45_T1.
' Compare a saida com as linhas " M =" de QB45_T1.saida.txt.
'$INCLUDE: '../../src-original/comum/RT45.BI'
$CONSOLE:ONLY
_DEST _CONSOLE
DIM f$
f$ = " M =######.##  As =####.## cm2|"
FOR k = 1 TO 12
    READ v#
    s! = v#
    PRINT USING f$; RT_PU#(s!, f$, 1); RT_PU#(v#, f$, 2)
NEXT
DATA 2.675,0.125,-0.005,0.005,1.005,12345.6,999999.995,-123456.78,0.0049,1E10,2.5,-0.125
SYSTEM
SUB RT_COMMON_GRAVA (f AS INTEGER): END SUB
SUB RT_COMMON_LE (f AS INTEGER): END SUB
SUB RT_COMMON_LIMPA: END SUB
SUB RT_PROG_LIMPA: END SUB
SUB RT_REARMA_ERRO: END SUB
'$INCLUDE: '../../src-original/comum/RT45.BM'
