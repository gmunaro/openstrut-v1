' ============================================================================
'  RT45.BI - estado do runtime de apoio (emulacao do BRUN45 do QuickBASIC 4.5)
'  Incluido no inicio de todo programa retraduzido (antes do nivel de modulo).
'  As rotinas ficam em RT45.BM. Convencoes: docs/RETRADUCAO.md.
' ============================================================================
$SCREENHIDE
DEFSNG A-Z

' Potencia (B$POW4/B$POW8) e FSQRT em precisao estendida, RT45X87.h: modelo fixo em software (o
' mesmo da V2), que nao depende do processador. FSQRT: o SQR do QB64 converte o _FLOAT para double
' (func_sqr do libqb) e x - SQR(x * x) sai diferente de 0 (RT_SQR##). Ver RETRADUCAO.md, regras 9 e 10.
DECLARE LIBRARY "../comum/RT45X87"
    FUNCTION rt45_pot## (BYVAL a AS _FLOAT, BYVAL b AS _FLOAT)
    FUNCTION rt45_pot_erro% ()
    FUNCTION rt45_fsqrt## (BYVAL x AS _FLOAT)
END DECLARE

DIM SHARED RT_PROG AS STRING          ' nome do programa (LAJEPROC, LAJE...)
DIM SHARED RT_ONERR AS LONG           ' rotulo do ON ERROR ativo do modulo principal (endereco)
DIM SHARED RT_LPT AS INTEGER          ' arquivo da impressora (0 = fechado)
DIM SHARED RT_MODO AS INTEGER         ' modo do SCREEN corrente (0, 2, 3, 9...)
DIM SHARED RT_SEG AS LONG             ' DEF SEG corrente (-1 = DGROUP)
DIM SHARED RT_SAIDA AS STRING         ' pasta das saidas do roteiro (telas, impressora)

' roteiro de teclas (SISTRUT_ROTEIRO): fila de eventos
DIM SHARED RT_ROT_ATIVO AS INTEGER
DIM SHARED RT_ROT_N AS LONG, RT_ROT_I AS LONG
REDIM SHARED RT_ROT_FILA(0) AS STRING   ' tecla como o INKEY$ devolve, ou "{TELA nome}"
DIM SHARED RT_ROT_VAZIOS AS INTEGER     ' INKEY$ vazios seguidos (simula o KEYFEED)
DIM SHARED RT_TELA_N AS INTEGER
DIM SHARED RT_CG_POSTAM AS LONG          ' posicao do tamanho da matriz em gravacao
DIM SHARED RT_ERRO_MIXT AS INTEGER        ' -1 = o ON ERROR ativo e o do MIXT
DIM SHARED RT_LPT_LARG AS INTEGER          ' WIDTH LPRINT (0 = padrao, 80)
DIM SHARED RT_EVENTO AS INTEGER, RT_EV AS INTEGER   ' ON KEY disparado pelo roteiro (indice do GOSUB)
DIM SHARED RT_KEY_ALVO(1 TO 31) AS INTEGER, RT_KEY_LIGADA(1 TO 31) AS INTEGER
DIM SHARED RT_KEY_DEF(15 TO 25) AS STRING
DIM SHARED RT_ROT_HW AS INTEGER            ' -1 = a ultima tecla do roteiro veio pelo controlador ({HW}, Esc, Fn)
DIM SHARED RT_VP1 AS INTEGER, RT_VP2 AS INTEGER   ' VIEW PRINT corrente (0 = tela toda)
DIM SHARED RT_VW_T AS INTEGER, RT_VW(1 TO 4) AS INTEGER   ' VIEW corrente (0 = nenhum, 1 = SCREEN, 2 = VIEW)
DIM SHARED RT_WIN_T AS INTEGER, RT_WIN(1 TO 4) AS SINGLE  ' WINDOW corrente (0 = nenhum, 1 = SCREEN, 2 = WINDOW)
DIM SHARED RT_LPT_NOME AS STRING, RT_LPT_POS AS LONG, RT_LPT_COL AS INTEGER   ' quebra de linha da LPT1 (RT_LPTQUEBRA)
DIM SHARED RT_ROT_VAZIOS_TOT AS INTEGER   ' consultas vazias do INKEY$ desde a ultima tecla do roteiro
DIM SHARED RT_ULT_LEITURA AS DOUBLE   ' TIMER da ultima consulta ao teclado (RT_EVCK)
DIM SHARED RT_ARQ_CURINGA AS INTEGER   ' RT_ARQ_DOS$ aceita curinga (* ?) so no FILES
