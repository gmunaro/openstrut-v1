' OPENSTRUT - lancador da OpenStrut V1 (nao faz parte da retraducao; compilado pelo
' tools/build.sh junto com os 28 programas). E o que os atalhos dos pacotes abrem.
'
' 1. Pasta que faz o papel do disco C: do DOS: SISTRUT_C, se ja estiver definida; senao
'    <pasta do usuario>/OpenStrut (%USERPROFILE%\OpenStrut no Windows, ~/OpenStrut no
'    Linux e no macOS). As obras gravadas em C:\... ficam nela.
' 2. Copia a instalacao do original (sistrut-game/, ao lado deste executavel) para
'    C:\SISTRUT\SISTRUT.INI e C:\SISTRUT\EXEC40\, so os arquivos que faltam: as
'    configuracoes do usuario nao sao sobrescritas.
' 3. Fora do Windows, define COMSPEC=C:\COMMAND.COM se nao existir (ver abaixo).
' 4. Roda o gerenciador (SISTRUT.exe, ao lado deste executavel) com SISTRUT_C apontando
'    para a pasta C: e com ela como pasta corrente (impressora e arquivos do CHAIN).
' Os programas da V1 se acham pelo nome na pasta do executavel (RT_ACHA_EXE do RT45).
' A OpenStrut V2 e web: https://gmunaro.github.io/openstrut/
$SCREENHIDE
DIM SHARED barra AS STRING
DIM prog AS STRING, jogo AS STRING, c AS STRING, exec AS STRING, nome AS STRING

IF INSTR(_OS$, "[WINDOWS]") THEN barra = "\" ELSE barra = "/"

' Pasta deste executavel, absoluta e com a barra no fim. O QB64 PE comeca na pasta do
' EXE (_STARTDIR$ e a de quem chamou); COMMAND$(0) pode vir relativo (./OPENSTRUT.exe).
prog = _CWD$
IF RIGHT$(prog, 1) <> "\" AND RIGHT$(prog, 1) <> "/" THEN prog = prog + barra
jogo = prog + "sistrut-game" + barra
IF NOT _FILEEXISTS(prog + "SISTRUT.exe") THEN falha "SISTRUT.exe nao encontrado em " + prog
IF NOT _FILEEXISTS(jogo + "SISTRUT.INI") THEN falha "SISTRUT.INI nao encontrado em " + jogo

c = ENVIRON$("SISTRUT_C")
IF c = "" THEN
    IF barra = "\" THEN c = ENVIRON$("USERPROFILE") ELSE c = ENVIRON$("HOME")
    IF c = "" THEN falha "pasta do usuario desconhecida (defina SISTRUT_C)"
    IF RIGHT$(c, 1) <> barra THEN c = c + barra
    c = c + "OpenStrut"
    ENVIRON "SISTRUT_C=" + c
END IF
IF RIGHT$(c, 1) = "\" OR RIGHT$(c, 1) = "/" THEN c = LEFT$(c, LEN(c) - 1)
' O gerenciador e os modulos tiram a letra do disco de COMSPEC (no DOS do original,
' C:\COMMAND.COM) e montam com ela os caminhos C:\SISTRUT\...; fora do Windows a
' variavel nao existe. No Windows fica como esta: o CHAIN funciona com ela trocada, mas
' o "Acesso ao DOS" (SHELL sem comando) usa o interpretador dela e nao foi conferido.
' Windows instalado fora do C: (COMSPEC=D:\...) da "Erro de Operacao" ao abrir um modulo
' (ver pacote/leia-me/windows.txt).
IF barra = "/" AND ENVIRON$("COMSPEC") = "" THEN ENVIRON "COMSPEC=C:\COMMAND.COM"

exec = c + barra + "SISTRUT" + barra + "EXEC40" + barra
cria c
cria c + barra + "SISTRUT"
cria exec
copia jogo + "SISTRUT.INI", c + barra + "SISTRUT" + barra + "SISTRUT.INI"
nome = _FILES$(jogo + "*.*")
DO WHILE LEN(nome)
    IF RIGHT$(nome, 1) <> "\" AND RIGHT$(nome, 1) <> "/" THEN copia jogo + nome, exec + nome
    nome = _FILES$
LOOP

CHDIR c
SHELL _DONTWAIT CHR$(34) + prog + "SISTRUT.exe" + CHR$(34)
SYSTEM

' cria a pasta se ainda nao existe
SUB cria (d AS STRING)
    IF _DIREXISTS(d) THEN EXIT SUB
    MKDIR d
    IF NOT _DIREXISTS(d) THEN falha "nao foi possivel criar " + d
END SUB

' copia o arquivo se o destino ainda nao existe
SUB copia (de AS STRING, para AS STRING)
    IF _FILEEXISTS(para) THEN EXIT SUB
    _WRITEFILE para, _READFILE$(de)
    IF NOT _FILEEXISTS(para) THEN falha "nao foi possivel gravar " + para
END SUB

SUB falha (msg AS STRING)
    _MESSAGEBOX "OpenStrut V1", msg, "error"
    SYSTEM 1
END SUB
