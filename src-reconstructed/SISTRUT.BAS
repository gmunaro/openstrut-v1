' ============================================================================
'  SISTRUT 4.0  -  Menu principal / launcher dos modulos
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de SISTRUT.EXE (1991),
'  originalmente compilado em Microsoft QuickBASIC 4.5 (runtime BRUN45).
'
'  Diferenca vs original: verificacao de licenca do original nao reimplementada.
'
'  Compilacao:
'    - QB64 Phoenix Edition:  qb64pe -c -x SISTRUT.BAS -o SISTRUT   (nativo)
'    - QuickBASIC 4.5 / QBX:  BC SISTRUT.BAS ;  + LINK              (DOS, drop-in)
'    - FreeBASIC:             fbc -lang qb SISTRUT.BAS
'
'  Reconstrucao baseada nas strings e no fluxo extraidos do executavel
'  desempacotado (EXEPACK). Rotulos de menu, nomes de modulos (EXEC40\ com
'  fallback EXEC32\), telas de configuracao e campos do SISTRUT.INI conferem
'  com o binario. Layout/cores exatos sao uma reconstrucao fiel do observado.
' ============================================================================


'$INCLUDE: 'common/SISTELA.BI'

DECLARE SUB InitModules ()
DECLARE SUB LoadIni ()
DECLARE SUB SaveIni ()
DECLARE SUB ShowMenu ()
DECLARE SUB ShowInfo ()
DECLARE SUB ConfigScreen ()
DECLARE SUB RunModule (idx AS INTEGER)
DECLARE FUNCTION Trim$ (s AS STRING)
DECLARE FUNCTION FileExists% (path AS STRING)

CONST VERSAO = "Versao 4.0          Abril 1991"
CONST EMPRESA = "OpenStrut                     "
CONST AUTOR = "(omitido)                 "
CONST NMOD = 13

' ---- Configuracao lida de SISTRUT.INI --------------------------------------
DIM SHARED DriveImpl AS STRING     ' DRIVE IMPLANTACAO (ex: "C:\")
DIM SHARED Monitor AS STRING       ' CGA/HERCULES/EGA/VGA/MCGA
DIM SHARED SaidaParalela AS STRING ' LPT1:/LPT2:
DIM SHARED PortaSerial AS STRING   ' COM1:/COM2:
DIM SHARED BatEntrada AS STRING    ' .BAT acessado na instalacao

' ---- Tabela de modulos (rotulo, hotkey, executavel em EXEC40\/EXEC32\) ------
DIM SHARED modLabel(1 TO NMOD) AS STRING
DIM SHARED modKey(1 TO NMOD) AS STRING
DIM SHARED modExec(1 TO NMOD) AS STRING

' ============================ programa principal ============================
InitModules
LoadIni
ShowMenu
SYSTEM

' ---------------------------------------------------------------------------
SUB InitModules
    ' Nomes de executavel conforme a tabela interna do SISTRUT.EXE.
    modLabel(1) = "Portico": modKey(1) = "P": modExec(1) = "PORTICO"
    modLabel(2) = "Grelha": modKey(2) = "G": modExec(2) = "GRELHA"
    modLabel(3) = "Trelica / Diagramas": modKey(3) = "T": modExec(3) = "TRELICA"
    modLabel(4) = "Laje": modKey(4) = "L": modExec(4) = "LAJE"
    modLabel(5) = "Viga": modKey(5) = "V": modExec(5) = "VIGA"
    modLabel(6) = "Armacao": modKey(6) = "A": modExec(6) = "ARMADURA"
    modLabel(7) = "Forma": modKey(7) = "F": modExec(7) = "FORMA"
    modLabel(8) = "Pilar": modKey(8) = "I": modExec(8) = "PILAR"
    modLabel(9) = "Desenho": modKey(9) = "D": modExec(9) = "DESENHO"
    modLabel(10) = "Plotagem": modKey(10) = "O": modExec(10) = "VPLOTA"
    modLabel(11) = "Detalhamento & Desenho": modKey(11) = "M": modExec(11) = "PDESENHO"
    modLabel(12) = "Configuracao": modKey(12) = "C": modExec(12) = "*CONFIG*"
    modLabel(13) = "Editor": modKey(13) = "E": modExec(13) = "SISEDIT"
END SUB

' ---------------------------------------------------------------------------
SUB LoadIni
    ' Le SISTRUT.INI (linhas VALOR=DESCRICAO); as demais linhas sao ignoradas
    ' (verificacao de licenca do original nao reimplementada).
    DriveImpl = "C:\"
    Monitor = "CGA"
    SaidaParalela = "LPT1:"
    PortaSerial = "COM1:"
    BatEntrada = ""

    IF FileExists%("SISTRUT.INI") = 0 THEN EXIT SUB
    DIM f AS INTEGER, ln AS STRING, k AS STRING, v AS STRING, p AS INTEGER
    f = FREEFILE
    OPEN "SISTRUT.INI" FOR INPUT AS #f
    DO WHILE NOT EOF(f)
        LINE INPUT #f, ln
        p = INSTR(ln, "=")
        IF p > 0 THEN
            v = Trim$(LEFT$(ln, p - 1))
            k = Trim$(MID$(ln, p + 1))
            IF INSTR(k, "DRIVE IMPLANTACAO") > 0 THEN DriveImpl = v
            IF INSTR(k, "MONITOR") > 0 THEN Monitor = v
            IF INSTR(k, "SAIDA PARALELA") > 0 THEN SaidaParalela = v
            IF INSTR(k, "COMUNICACAO SERIAL") > 0 THEN PortaSerial = v
            IF INSTR(k, ".BAT ACESSADO") > 0 THEN BatEntrada = v
        END IF
    LOOP
    CLOSE #f
END SUB

' ---------------------------------------------------------------------------
SUB SaveIni
    ' Grava SISTRUT.INI: cabecalho de formato do original e linhas VALOR=DESCRICAO.
    DIM f AS INTEGER
    f = FREEFILE
    OPEN "SISTRUT.INI" FOR OUTPUT AS #f
    PRINT #f, "SISTRUT Software e Tecnologia s/c Ltda"   ' assinatura de formato do .INI
    PRINT #f, VERSAO
    PRINT #f, DriveImpl + "=DRIVE IMPLANTACAO"
    PRINT #f, Monitor + "=MONITOR UTILIZADO"
    PRINT #f, SaidaParalela + "=SAIDA PARALELA UTILIZADA"
    PRINT #f, PortaSerial + "=PORTA DE COMUNICACAO SERIAL UTILIZADA"
    PRINT #f, BatEntrada + "=ARQUIVO .BAT ACESSADO NA INSTALACAO"
    CLOSE #f
END SUB

' ---------------------------------------------------------------------------
SUB ShowMenu
    DIM k AS STRING, i AS INTEGER, sel AS INTEGER
    DO
        CLS
        COLOR 15: LOCATE 2, 28: PRINT "S I S T R U T"
        COLOR 7: LOCATE 3, 25: PRINT EMPRESA
        LOCATE 4, 25: PRINT VERSAO
        LOCATE 6, 15: PRINT "Escolha o modulo pela letra em intensidade:"
        FOR i = 1 TO NMOD
            LOCATE 8 + ((i - 1) MOD 7), 8 + 40 * ((i - 1) \ 7)
            COLOR 15: PRINT modKey(i);
            COLOR 7: PRINT " ) " + modLabel(i)
        NEXT
        COLOR 7
        LOCATE 17, 8: PRINT "<F1> = Informacoes      <F2> = Fim"
        LOCATE 19, 8: PRINT "Opcao: ";

        k = ""
        DO: _LIMIT 30: k = TelaTecla$: LOOP WHILE k = ""

        IF k = CHR$(0) + CHR$(60) THEN EXIT DO            ' F2 = Fim
        IF k = CHR$(0) + CHR$(59) THEN
            ShowInfo
        ELSE
            sel = 0
            FOR i = 1 TO NMOD
                IF UCASE$(k) = modKey(i) THEN sel = i
            NEXT
            IF sel > 0 THEN
                IF modExec(sel) = "*CONFIG*" THEN
                    ConfigScreen
                ELSE
                    RunModule sel
                END IF
            END IF
        END IF
    LOOP

    CLS
    LOCATE 12, 10
    PRINT "Termino da Utilizacao do Sistema SISTRUT     Obrigado ..."
END SUB

' ---------------------------------------------------------------------------
SUB RunModule (idx AS INTEGER)
    ' Procura <NOME>.EXE na pasta do SISTRUT (instalacao reconstruida, todos os
    ' modulos juntos); depois <DRIVE>\SISTRUT\EXEC40\ e EXEC32\ (v3.2).
    DIM baseDir AS STRING, pAqui AS STRING, p40 AS STRING, p32 AS STRING, alvo AS STRING
    baseDir = DriveImpl
    IF RIGHT$(baseDir, 1) <> "\" THEN baseDir = baseDir + "\"
    pAqui = _CWD$
    IF RIGHT$(pAqui, 1) <> "\" AND RIGHT$(pAqui, 1) <> "/" THEN pAqui = pAqui + "\"
    pAqui = pAqui + modExec(idx) + ".EXE"
    p40 = baseDir + "SISTRUT\EXEC40\" + modExec(idx) + ".EXE"
    p32 = baseDir + "SISTRUT\EXEC32\" + modExec(idx) + ".EXE"

    CLS
    LOCATE 12, 10: PRINT "Modulo " + modLabel(idx) + " ...  Aguarde ..."

    IF FileExists%(pAqui) THEN
        alvo = pAqui
    ELSEIF FileExists%(p40) THEN
        alvo = p40
    ELSEIF FileExists%(p32) THEN
        alvo = p32
    END IF
    IF alvo <> "" THEN
        SHELL CHR$(34) + alvo + CHR$(34)     ' aspas: caminho pode ter espacos
    ELSE
        COLOR 12
        LOCATE 14, 10: PRINT "Modulo nao instalado nesta copia (" + modExec(idx) + ")."
        COLOR 7
        LOCATE 16, 10: PRINT "Pressione uma tecla ..."
        DO: _LIMIT 30: LOOP WHILE TelaTecla$ = ""
    END IF
END SUB

' ---------------------------------------------------------------------------
SUB ConfigLinhas
    ' Redesenha as tres linhas de valor da configuracao. Cada linha e
    ' impressa inteira, com espacos no fim, para apagar o valor anterior.
    ' RECONSTRUCAO: rotulos LPT/COM sem <1>/<2>: as teclas 1-5 sao sempre
    ' o monitor; LPT e COM alternam com <L> e <S> (ver ConfigScreen).
    LOCATE 5, 6: PRINT "Monitor  <1>CGA  <2>HERCULES  <3>EGA  <4>VGA  <5>MCGA   [" + Monitor + "]      "
    LOCATE 7, 6: PRINT "Impressora Paralela                                    [" + SaidaParalela + "]      "
    LOCATE 9, 6: PRINT "Serial/Mouse                                           [" + PortaSerial + "]      "
END SUB

' ---------------------------------------------------------------------------
SUB ConfigScreen
    DIM k AS STRING
    CLS
    COLOR 15: LOCATE 2, 25: PRINT "C O N F I G U R A C A O"
    COLOR 7
    ConfigLinhas
    LOCATE 12, 6: PRINT "Drive de implantacao: " + DriveImpl
    LOCATE 15, 6: PRINT "<1-5> Monitor   <L> alterna LPT   <S> alterna COM   <Enter> grava e volta"

    DO
        _LIMIT 30
        k = TelaTecla$
        SELECT CASE UCASE$(k)
            CASE "1": Monitor = "CGA"
            CASE "2": Monitor = "HERCULES"
            CASE "3": Monitor = "EGA"
            CASE "4": Monitor = "VGA"
            CASE "5": Monitor = "MCGA"
            CASE "L"
                IF SaidaParalela = "LPT1:" THEN SaidaParalela = "LPT2:" ELSE SaidaParalela = "LPT1:"
            CASE "S"
                IF PortaSerial = "COM1:" THEN PortaSerial = "COM2:" ELSE PortaSerial = "COM1:"
            CASE CHR$(13)
                SaveIni
                EXIT DO
        END SELECT
        IF k <> "" THEN ConfigLinhas
    LOOP
END SUB

' ---------------------------------------------------------------------------
SUB ShowInfo
    CLS
    COLOR 15: LOCATE 2, 20: PRINT "SISTRUT - Sistema para Calculo Estrutural"
    COLOR 7
    LOCATE 4, 6: PRINT "Este Sistema foi desenvolvido pela OpenStrut.                     "
    LOCATE 6, 6: PRINT EMPRESA
    LOCATE 7, 9: PRINT "Eng. " + AUTOR
    LOCATE 8, 9: PRINT "tel: (omitido)                       "
    LOCATE 11, 6: PRINT "Modulos: Portico, Grelha, Trelica, Laje, Viga, Armacao,"
    LOCATE 12, 6: PRINT "         Forma, Pilar, Desenho, Plotagem, Diagramas."
    LOCATE 15, 6: PRINT "Pressione uma tecla para voltar ao menu ..."
    DO: _LIMIT 30: LOOP WHILE TelaTecla$ = ""
END SUB

' ---------------------------------------------------------------------------
FUNCTION Trim$ (s AS STRING)
    DIM a AS INTEGER, b AS INTEGER
    a = 1: b = LEN(s)
    DO WHILE a <= b AND MID$(s, a, 1) = " ": a = a + 1: LOOP
    DO WHILE b >= a AND MID$(s, b, 1) = " ": b = b - 1: LOOP
    IF b < a THEN Trim$ = "" ELSE Trim$ = MID$(s, a, b - a + 1)
END FUNCTION

' ---------------------------------------------------------------------------
FUNCTION FileExists% (path AS STRING)
    ' QB64 PE: usa _FILEEXISTS (retorna -1/0).
    ' Em QuickBASIC 4.5, substituir por rotina ON ERROR + OPEN FOR INPUT.
    FileExists% = _FILEEXISTS(path)
END FUNCTION

'$INCLUDE: 'common/SISTELA.BM'
