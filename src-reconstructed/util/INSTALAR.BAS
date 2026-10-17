' ============================================================================
'  INSTALAR.BAS - implantacao do SISTRUT a partir de um diretorio de origem
'  Pede o diretorio de destino (padrao C:\SISTRUT\EXEC40\) e o de origem
'  (padrao: diretorio de partida). Copia os .EXE da lista fixa e os arquivos
'  de parametrizacao (.INI, .LAP, .PIP, .FOP, .DSP) e PLOTER.INI de mesmo nome que
'  existirem na origem. Executaveis sao substituidos; parametrizacao que ja existe
'  no destino e mantida. Grava SISTRUT.INI no destino e mostra o relatorio final.
'  Recusa destino na raiz de um disco (ex.: C:\) e destino igual a origem
'  (copiar uma pasta sobre ela mesma apagaria os arquivos).
' ============================================================================
'$INCLUDE: '../common/SISCOMUM.BI'

CONST INS_QTD_EXE = 28                   ' programas da lista fixa
CONST INS_QTD_EXT = 5                    ' extensoes de parametrizacao
CONST INS_BLOCO = 16384                  ' bytes por bloco na copia

DIM SHARED InsDestino$, InsOrigem$       ' diretorios, sempre com barra final
DIM SHARED InsMonitor$, InsLpt$, InsCom$ ' equipamento escolhido nas telas
DIM SHARED InsExe$(INS_QTD_EXE)          ' lista fixa de executaveis
DIM SHARED InsExt$(INS_QTD_EXT)          ' extensoes de parametrizacao
DIM SHARED InsCopiados%                  ' arquivos copiados com sucesso
DIM SHARED InsAusentes$, InsErros$       ' nomes nao copiados, separados por espaco
DIM SHARED InsMantidos$                  ' parametrizacoes que ja existiam no destino
DIM SHARED InsFalhou%                    ' -1 quando a ultima operacao de arquivo falhou

DECLARE SUB InsCabecalho ()
DECLARE SUB InsLimpa (l1%, l2%)
DECLARE SUB InsCarregaListas ()
DECLARE FUNCTION InsBarraFinal$ (dir$)
DECLARE FUNCTION InsPedeDiretorio$ (lin%, rotulo$, padrao$)
DECLARE FUNCTION InsPedeOpcao$ (lin%, rotulo$, opcoes$, padrao$)
DECLARE FUNCTION InsCriaDir% (dir$)
DECLARE FUNCTION InsMesmaPasta% (a$, b$)
DECLARE SUB InsMakeDirSeg (p$)
DECLARE FUNCTION CopiaArquivo% (origem$, destino$)
DECLARE SUB InsCopiaTudo ()
DECLARE SUB InsGravaIni ()
DECLARE SUB InsRelatorio ()

' ---- programa principal ----------------------------------------------------
DIM k$

ON ERROR GOTO InsErro
InsFalhou% = 0

SCREEN 0: WIDTH 80, 25
COLOR COR_TEXTO, 0
CLS
InsCarregaListas
InsCabecalho

InsDestino$ = InsPedeDiretorio$(6, "Drive onde sera implantado o sistema *", "C:\SISTRUT\EXEC40\")
InsOrigem$ = InsPedeDiretorio$(9, "Drive onde esta o disco  SISTRUT *", _CWD$)

' RECONSTRUCAO: rotulos de monitor, LPT e COM nao estao no dump; a lista de
' monitores e incompleta (so CGA e HERCULES aparecem). Ver docs/modules/INSTALAR.md 10.
k$ = InsPedeOpcao$(12, "Monitor utilizado", "CH", "C")
IF k$ = "H" THEN InsMonitor$ = "HERCULES" ELSE InsMonitor$ = "CGA"
k$ = InsPedeOpcao$(14, "Saida paralela utilizada", "12", "1")
InsLpt$ = "LPT" + k$
k$ = InsPedeOpcao$(16, "Porta de comunicacao serial utilizada", "12", "1")
InsCom$ = "COM" + k$

InsLimpa 5, 23
' RECONSTRUCAO: decisao de manter a configuracao do usuario. Se o SISTRUT.INI ja
' existe no destino, nao e regravado; InsCopiaTudo o registra em InsMantidos$.
InsIniExistia% = FileExists%(InsDestino$ + "SISTRUT.INI")
IF LEN(InsDestino$) <= 3 THEN
    TelaErro "Destino na raiz do disco: informe um diretorio (ex.: C:\SISTRUT\EXEC40\)"
ELSEIF InsMesmaPasta%(InsDestino$, InsOrigem$) THEN
    TelaErro "Destino igual a origem: informe outro diretorio de destino"
ELSEIF InsCriaDir%(InsDestino$) = 0 THEN
    TelaErro "Erro de Operacao"
ELSE
    InsCopiaTudo
    IF InsIniExistia% = 0 THEN InsGravaIni
    InsRelatorio
END IF

TelaStatus "qualquer tecla para continuar "
k$ = TeclaLer$

CLS
LOCATE 12, 15
PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' ---- tela ------------------------------------------------------------------

' Titulo e identificacao do sistema no topo da tela.
SUB InsCabecalho
    CLS
    COLOR COR_DESTAQUE, 0
    LOCATE 1, 3: PRINT "S I S T R U T";
    COLOR COR_TEXTO, 0
    LOCATE 1, 20: PRINT "OpenStrut                     ";
    LOCATE 2, 20: PRINT "Versao 4.0          Abril 1991";
    LOCATE 3, 20: PRINT "(omitido)                 ";
END SUB

' Apaga as linhas l1% a l2% (inclusive).
SUB InsLimpa (l1%, l2%)
    DIM l%
    COLOR COR_TEXTO, 0
    FOR l% = l1% TO l2%
        LOCATE l%, 1
        PRINT SPACE$(79);
        LOCATE l%, 80: PRINT " ";  ' RECONSTRUCAO: a coluna 80 nao e coberta por SPACE$(79)
    NEXT
END SUB

' Mostra rotulo na linha lin% e pede o diretorio na linha seguinte.
' Enter ou ESC devolvem padrao$. O resultado e absoluto (com unidade) e
' sempre termina com barra; caminho relativo e resolvido a partir de _CWD$.
FUNCTION InsPedeDiretorio$ (lin%, rotulo$, padrao$)
    DIM d$
    COLOR COR_DESTAQUE, 0
    LOCATE lin%, 3: PRINT rotulo$;
    COLOR COR_TEXTO, 0
    d$ = LTRIM$(RTRIM$(EntradaTexto$(lin% + 1, 3, 76, padrao$)))  ' RECONSTRUCAO: 76 colunas (cabe caminho longo; 60 era pouco)
    IF d$ = "" THEN d$ = padrao$
    ' RECONSTRUCAO: a resolucao de caminho relativo e suposicao. Sem ela, o
    ' INI recebia "sis=DRIVE IMPLANTACAO" para o destino "sis_inst\".
    IF MID$(d$, 2, 1) <> ":" THEN
        IF LEFT$(d$, 1) = "\" THEN
            d$ = LEFT$(_CWD$, 2) + d$
        ELSE
            d$ = _CWD$ + "\" + d$
        END IF
    END IF
    InsPedeDiretorio$ = InsBarraFinal$(d$)
END FUNCTION

' Mostra rotulo e as opcoes entre colchetes na linha lin%. Espera uma das
' letras de opcoes$; Enter e ESC devolvem padrao$. Devolve a letra escolhida.
FUNCTION InsPedeOpcao$ (lin%, rotulo$, opcoes$, padrao$)
    DIM k$, t$
    t$ = rotulo$ + " [" + opcoes$ + "] "
    COLOR COR_TEXTO, 0
    LOCATE lin%, 3: PRINT t$;
    DO
        k$ = UCASE$(TeclaLer$)
        IF LEN(k$) = 1 AND INSTR(opcoes$, k$) > 0 THEN EXIT DO
        IF k$ = CHR$(13) OR k$ = CHR$(27) THEN
            k$ = padrao$
            EXIT DO
        END IF
    LOOP
    LOCATE lin%, 3 + LEN(t$): PRINT k$;
    InsPedeOpcao$ = k$
END FUNCTION

' ---- fluxo -----------------------------------------------------------------

' Carrega a lista fixa de executaveis e as extensoes (DATA no fim do modulo).
SUB InsCarregaListas
    DIM i%
    FOR i% = 1 TO INS_QTD_EXE
        READ InsExe$(i%)
    NEXT
    FOR i% = 1 TO INS_QTD_EXT
        READ InsExt$(i%)
    NEXT
END SUB

' Copia os executaveis da lista e as parametrizacoes de mesmo nome que existirem
' na origem. Quem nao existe vai para InsAusentes$; falha de copia, para InsErros$.
SUB InsCopiaTudo
    DIM i%, j%, nome$, origem$, arq$
    InsCopiados% = 0
    InsAusentes$ = ""
    InsErros$ = ""
    InsMantidos$ = ""
    InsLimpa 16, 23
    COLOR COR_TEXTO, 0
    LOCATE 16, 3: PRINT "Atualizacao da Versao 4.0 para o diretorio " + InsDestino$;
    LOCATE 17, 3: PRINT "Copiando os aplicativos executaveis ...";

    FOR i% = 1 TO INS_QTD_EXE
        nome$ = InsExe$(i%)
        TelaStatus nome$ + ".EXE"
        origem$ = InsOrigem$ + nome$ + ".EXE"
        IF FileExists%(origem$) = 0 THEN
            InsAusentes$ = InsAusentes$ + nome$ + " "
        ELSEIF CopiaArquivo%(origem$, InsDestino$ + nome$ + ".EXE") THEN
            InsCopiados% = InsCopiados% + 1
        ELSE
            InsErros$ = InsErros$ + nome$ + ".EXE "
        END IF

        FOR j% = 1 TO INS_QTD_EXT
            arq$ = nome$ + "." + InsExt$(j%)
            InsCopiaParam InsOrigem$ + arq$, InsDestino$ + arq$, arq$
        NEXT
    NEXT
    InsCopiaParam InsOrigem$ + "PLOTER.INI", InsDestino$ + "PLOTER.INI", "PLOTER.INI"

    ' auxiliar do monitor Hercules
    IF InsMonitor$ = "HERCULES" THEN
        LOCATE 18, 3: PRINT "Copiando os aplicativos auxiliares ....";
        origem$ = InsOrigem$ + "HERCULES.COM"
        TelaStatus "HERCULES.COM"
        IF FileExists%(origem$) = 0 THEN
            InsAusentes$ = InsAusentes$ + "HERCULES.COM "
        ELSEIF CopiaArquivo%(origem$, InsDestino$ + "HERCULES.COM") THEN
            InsCopiados% = InsCopiados% + 1
        ELSE
            InsErros$ = InsErros$ + "HERCULES.COM "
        END IF
    END IF
END SUB

' Copia uma parametrizacao (ou PLOTER.INI). Se o destino ja existe, mantem o do
' usuario e registra em InsMantidos$. Arquivo ausente na origem e ignorado.
SUB InsCopiaParam (origem$, destino$, nome$)
    IF FileExists%(origem$) = 0 THEN EXIT SUB
    IF FileExists%(destino$) THEN
        InsMantidos$ = InsMantidos$ + nome$ + " "
    ELSEIF CopiaArquivo%(origem$, destino$) THEN
        InsCopiados% = InsCopiados% + 1
    ELSE
        InsErros$ = InsErros$ + nome$ + " "
    END IF
END SUB

' Grava SISTRUT.INI no destino com linhas VALOR=DESCRICAO e a linha informativa
' PARAMETRIZADO EM (data e hora da instalacao).
SUB InsGravaIni
    DIM f%, dt$
    InsFalhou% = 0
    f% = FREEFILE
    OPEN InsDestino$ + "SISTRUT.INI" FOR OUTPUT AS #f%
    IF InsFalhou% THEN
        TelaErro "Erro de Operacao"
        EXIT SUB
    END IF
    PRINT #f%, "SISTRUT Software e tecnologia s/c Ltda"
    PRINT #f%, "Versao 4.0                  Abril 1991"
    PRINT #f%, LEFT$(InsDestino$, 3) + "=DRIVE IMPLANTACAO"
    PRINT #f%, InsMonitor$ + "=MONITOR UTILIZADO"
    PRINT #f%, InsLpt$ + ":=SAIDA PARALELA UTILIZADA"
    PRINT #f%, InsCom$ + ":=PORTA DE COMUNICACAO SERIAL UTILIZADA"
    ' RECONSTRUCAO: a linha "=ARQUIVO .BAT ACESSADO" foi omitida: o nome do .BAT nao esta no dump.
    ' DATE$ e MM-DD-YYYY; o INI usa DD-MM-YY, como no original.
    dt$ = MID$(DATE$, 4, 2) + "-" + LEFT$(DATE$, 2) + "-" + RIGHT$(DATE$, 2)
    PRINT #f%, "PARAMETRIZADO EM:" + dt$ + "  " + TIME$  ' RECONSTRUCAO: so o texto informativo, sem assinatura
    CLOSE #f%
    IF InsFalhou% THEN
        TelaErro "Erro de Operacao"
    ELSE
        TelaStatus "Configuracao SISTRUT.INI implantada"
    END IF
END SUB

' Mostra quantos arquivos foram copiados e quais nomes ficaram de fora.
' RECONSTRUCAO: rotulos do relatorio nao estao no dump.
SUB InsRelatorio
    InsLimpa 16, 23
    COLOR COR_TEXTO, 0
    LOCATE 17, 3: PRINT "Copiados:  " + LTRIM$(STR$(InsCopiados%));
    LOCATE 18, 3: PRINT "Ausentes:  " + LEFT$(InsAusentes$, 60);
    LOCATE 19, 3: PRINT "Erros:     " + LEFT$(InsErros$, 60);
    LOCATE 20, 3: PRINT "Mantido (ja existe): " + LEFT$(InsMantidos$, 55);
    TelaStatus "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
END SUB

' ---- arquivos ----------------------------------------------------------------

' Devolve dir$ com barra final.
FUNCTION InsBarraFinal$ (dir$)
    IF RIGHT$(dir$, 1) = "\" THEN
        InsBarraFinal$ = dir$
    ELSE
        InsBarraFinal$ = dir$ + "\"
    END IF
END FUNCTION

' Diz se a$ e b$ sao o mesmo diretorio, comparando o caminho absoluto (ignora
' maiusculas, barra final e "."/".."). So compara diretorios existentes, porque
' _FULLPATH$ falha com caminho inexistente.
FUNCTION InsMesmaPasta% (a$, b$)
    InsMesmaPasta% = 0
    IF _DIREXISTS(a$) AND _DIREXISTS(b$) THEN
        IF UCASE$(_FULLPATH$(a$)) = UCASE$(_FULLPATH$(b$)) THEN InsMesmaPasta% = -1
    END IF
END FUNCTION

' Cria dir$ e os diretorios pais que faltarem. Devolve -1 se o destino existe ao final.
FUNCTION InsCriaDir% (dir$)
    DIM d$, i%
    d$ = dir$
    IF RIGHT$(d$, 1) = "\" THEN d$ = LEFT$(d$, LEN(d$) - 1)
    ' i% = 4 pula a raiz "X:\"
    FOR i% = 4 TO LEN(d$)
        IF MID$(d$, i%, 1) = "\" THEN InsMakeDirSeg LEFT$(d$, i% - 1)
    NEXT
    InsMakeDirSeg d$
    InsCriaDir% = _DIREXISTS(d$)
END FUNCTION

' Cria p$ se ainda nao existir. Erro de MKDIR cai no tratador global.
SUB InsMakeDirSeg (p$)
    IF _DIREXISTS(p$) = 0 THEN MKDIR p$
END SUB

' Copia origem$ para destino$ em blocos binarios. Substitui destino$ se existir;
' so usar para executaveis (parametrizacao passa por InsCopiaParam).
' Devolve -1 se copiou tudo, 0 se alguma operacao falhou. Origem igual ao destino
' e falha (nao apaga nada): o KILL abaixo destruiria a origem.
FUNCTION CopiaArquivo% (origem$, destino$)
    DIM f1%, f2%, tam&, ps&, bl&, buf$, ok%
    ok% = -1
    InsFalhou% = 0
    IF FileExists%(destino$) THEN
        IF UCASE$(_FULLPATH$(origem$)) = UCASE$(_FULLPATH$(destino$)) THEN
            CopiaArquivo% = 0
            EXIT FUNCTION
        END IF
    END IF
    f1% = FREEFILE
    OPEN origem$ FOR BINARY AS #f1%
    IF InsFalhou% THEN
        CopiaArquivo% = 0
        EXIT FUNCTION
    END IF
    tam& = LOF(f1%)
    IF FileExists%(destino$) THEN KILL destino$
    f2% = FREEFILE
    OPEN destino$ FOR BINARY AS #f2%
    IF InsFalhou% THEN
        CLOSE #f1%
        CopiaArquivo% = 0
        EXIT FUNCTION
    END IF
    ps& = 0
    DO WHILE ps& < tam&
        bl& = tam& - ps&
        IF bl& > INS_BLOCO THEN bl& = INS_BLOCO
        buf$ = SPACE$(bl&)
        GET #f1%, ps& + 1, buf$
        PUT #f2%, ps& + 1, buf$
        IF InsFalhou% THEN
            ok% = 0
            EXIT DO
        END IF
        ps& = ps& + bl&
    LOOP
    CLOSE #f1%, #f2%
    CopiaArquivo% = ok%
END FUNCTION

' Tratador global: marca a falha e segue; quem chamou confere InsFalhou%.
InsErro:
    InsFalhou% = -1
    RESUME NEXT

' Lista fixa de programas e extensoes de parametrizacao.
DATA "SISTRUT","LAJE","LAJEGEOM","LAJECALC","LAJEPROC","LAJEGRAV","LAJEMONT"
DATA "VIGA","ARMADURA","PILAR","PILAREDI","PILGEEDI","PIGRAEDI","PIPROEDI"
DATA "FORMA","FORMINIT","FORMEDCA","FORMIMP","FORMPLOT","DESENHO","DESINIT"
DATA "DESDIM","DESEDCAO","DESEDITA","DESGRAF","DESIMP","VPLOTA","SISEDIT"
DATA "INI","LAP","PIP","FOP","DSP"

'$INCLUDE: '../common/SISCOMUM.BM'
