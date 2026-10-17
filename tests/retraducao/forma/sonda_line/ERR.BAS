ON ERROR GOTO trata
OPEN "O", #2, "ERR.OUT"
OPEN "O", #1, "C:\.FRM"
PRINT #2, "abriu sem erro"
GOTO fim
trata:
PRINT #2, "ERR ="; ERR
RESUME fim
fim:
CLOSE
END
