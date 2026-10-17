' FORMA R2: sonda STY (tests/retraducao/forma/sonda_line/STY.BAS) com RT_LINE do RT45GFX.
' Saida STY.OUT igual a STY.oraculo.OUT (oraculo retrad_frm_sty).
'$INCLUDE: '../../../src-original/comum/RT45.BI'
'$INCLUDE: '../../../src-original/comum/RT45GFX.BI'
RT_SCREEN 2
RT_LINE 100, 20, 100, 120, 1 + 8 + 64, 1, 2
RT_LINE 110, 120, 110, 20, 1 + 8 + 64, 1, 2
RT_LINE 120, 20, 220, 20, 1 + 8 + 64, 1, 2
RT_LINE 220, 30, 120, 30, 1 + 8 + 64, 1, 2
RT_PSET 230, 20, 0, 0
RT_LINE 0, 0, 230, 120, 8 + 64, 1, 2
RT_LINE 300, 20, 300, 27, 1 + 8 + 64, 1, -32768
RT_LINE 310, 20, 310, 40, 1 + 8 + 64, 1, -32768
RT_LINE 400, 20, 483, 101, 1 + 8 + 16 + 64, 1, &H1111
RT_LINE 500, 101, 583, 20, 1 + 8 + 16 + 64, 1, &H1111
OPEN "STY.OUT" FOR OUTPUT AS #1
FOR k = 1 TO 6
  READ t$, qx, a, b
  PRINT #1, t$;
  FOR i = a TO b
    IF qx THEN p = POINT(qx, i) ELSE p = 0
    IF p THEN PRINT #1, i;
  NEXT
  PRINT #1,
NEXT
FOR k = 1 TO 3
  READ t$, qy, a, b
  PRINT #1, t$;
  FOR i = a TO b
    IF POINT(i, qy) THEN PRINT #1, i;
  NEXT
  PRINT #1,
NEXT
CLOSE #1
SYSTEM
DATA "V100 desce", 100, 0, 130
DATA "V110 sobe", 110, 0, 130
DATA "PSET+V230", 230, 0, 130
DATA "V310 depois de V300", 310, 0, 50
DATA "B esq x400", 400, 0, 110
DATA "B dir x483", 483, 0, 110
DATA "H20 direita", 20, 110, 230
DATA "H30 esquerda", 30, 110, 230
DATA "B topo y20", 20, 390, 490
'$INCLUDE: '../../../src-original/comum/RT45.BM'
'$INCLUDE: '../../../src-original/comum/RT45GFX.BM'
'$INCLUDE: 'stubs_rt45.bm'
