SCREEN 2
LINE (100, 20)-(100, 120), 1, , &H2
LINE (110, 120)-(110, 20), 1, , &H2
LINE (120, 20)-(220, 20), 1, , &H2
LINE (220, 30)-(120, 30), 1, , &H2
PSET (230, 20)
LINE -(230, 120), 1, , &H2
LINE (300, 20)-(300, 27), 1, , &H8000
LINE (310, 20)-(310, 40), 1, , &H8000
LINE (400, 20)-(483, 101), 1, B, &H1111
LINE (500, 101)-(583, 20), 1, B, &H1111
OPEN "STY.OUT" FOR OUTPUT AS #1
FOR k = 1 TO 6
  READ t$, fx, a, b
  PRINT #1, t$;
  FOR i = a TO b
    IF fx THEN p = POINT(fx, i) ELSE p = 0
    IF p THEN PRINT #1, i;
  NEXT
  PRINT #1,
NEXT
FOR k = 1 TO 3
  READ t$, fy, a, b
  PRINT #1, t$;
  FOR i = a TO b
    IF POINT(i, fy) THEN PRINT #1, i;
  NEXT
  PRINT #1,
NEXT
CLOSE #1
DATA "V100 desce", 100, 0, 130
DATA "V110 sobe", 110, 0, 130
DATA "PSET+V230", 230, 0, 130
DATA "V310 depois de V300", 310, 0, 50
DATA "B esq x400", 400, 0, 110
DATA "B dir x483", 483, 0, 110
DATA "H20 direita", 20, 110, 230
DATA "H30 esquerda", 30, 110, 230
DATA "B topo y20", 20, 390, 490
