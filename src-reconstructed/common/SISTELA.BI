' ============================================================================
'  SISTELA.BI - janela ampliada e redimensionavel (Windows)
'  A tela 80x25 / 640x480 do DOS e pequena em monitores atuais. Com
'  $RESIZE:SMOOTH o usuario pode arrastar a borda e o conteudo e esticado;
'  TelaEscala (SISTELA.BM) abre a janela ja ampliada para caber no monitor.
'  Alt+Enter alterna tela cheia (recurso do QB64).
'  Incluido por SISCOMUM.BI; SISTRUT.BAS inclui direto.
' ============================================================================

$RESIZE:SMOOTH

TYPE TelaRect
    x1 AS LONG
    y1 AS LONG
    x2 AS LONG
    y2 AS LONG
END TYPE

TYPE TelaMonInfo                        ' MONITORINFO
    tam AS LONG
    mx1 AS LONG
    my1 AS LONG
    mx2 AS LONG
    my2 AS LONG
    wx1 AS LONG                         ' area util (sem a barra de tarefas)
    wy1 AS LONG
    wx2 AS LONG
    wy2 AS LONG
    flags AS LONG
END TYPE

DECLARE DYNAMIC LIBRARY "user32"
    FUNCTION TelaGetClientRect& ALIAS "GetClientRect" (BYVAL hwnd AS _OFFSET, BYVAL lpRect AS _OFFSET)
    FUNCTION TelaGetWindowRect& ALIAS "GetWindowRect" (BYVAL hwnd AS _OFFSET, BYVAL lpRect AS _OFFSET)
    FUNCTION TelaSetWindowPos& ALIAS "SetWindowPos" (BYVAL hwnd AS _OFFSET, BYVAL depois AS _OFFSET, BYVAL x AS LONG, BYVAL y AS LONG, BYVAL cx AS LONG, BYVAL cy AS LONG, BYVAL flags AS _UNSIGNED LONG)
    FUNCTION TelaMonitorFromWindow%& ALIAS "MonitorFromWindow" (BYVAL hwnd AS _OFFSET, BYVAL flags AS _UNSIGNED LONG)
    FUNCTION TelaGetMonitorInfo& ALIAS "GetMonitorInfoA" (BYVAL hmon AS _OFFSET, BYVAL lpmi AS _OFFSET)
END DECLARE

' Tamanho natural (pixels) da ultima tela ampliada; muda quando o programa
' troca SCREEN 0 <-> SCREEN 12 e entao a janela e reajustada.
DIM SHARED TelaNatL AS LONG, TelaNatA AS LONG

' Modo roteiro (teste de uso, tools/roteiro.sh): se a variavel de ambiente
' SISTRUT_ROTEIRO aponta para um arquivo de teclas, TelaTecla$ tira as teclas
' de la em vez do teclado e a janela fica escondida. A posicao fica em
' <roteiro>.pos, entao um submodulo chamado por SHELL continua de onde o
' anterior parou. Formato e marcas: ver TelaRotProxima$ (SISTELA.BM).
' Erro de execucao ou roteiro esgotado grava a tela e encerra (codigo 4 / 3)
' em vez de abrir dialogo ou esperar tecla para sempre.
DIM SHARED TelaRot$, TelaRotTxt$
TelaRot$ = ENVIRON$("SISTRUT_ROTEIRO")
IF TelaRot$ <> "" THEN
    _SCREENHIDE
    ON ERROR GOTO TelaRotErro
END IF
GOTO TelaRotFimErro
TelaRotErro:
TelaRotLog "ERRO" + STR$(ERR) + " linha" + STR$(_ERRORLINE) + " " + _INCLERRORFILE$ + ":" + STR$(_INCLERRORLINE)
TelaRotDespeja "erro_" + TelaRotExe$
SYSTEM 4
TelaRotFimErro:
