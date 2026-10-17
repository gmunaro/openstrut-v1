' ===============================================================
' DESENHO.BAS - gerenciador da familia DESENHO (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Fontes: dump de strings do DESENHO.EXE (fora do repositorio), docs/modules/_FAMILIA_DESENHO.md.
' Entrada: <dirDados>SISTRUT.OBR (obra) e DESENHO.INI (parametrizacao e diretorios).
' Saida: DESENHO.INI regravado a cada campo alterado.
' Os submodulos sao chamados por RunSubmodulo; nao sao escritos aqui.
' Compilacao: tools/build.sh desenho/DESENHO.BAS
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Linhas do DESENHO.INI, contadas a partir de 1 (ver sistrut-game/DESENHO.INI).
CONST DES_LN_PAR = 1       ' nome do arquivo de parametrizacao (sem .DSP)
CONST DES_LN_VIG = 2       ' diretorio dos .VIG .SEC .FOR
CONST DES_LN_DSP = 3       ' diretorio dos .DSP
CONST DES_LN_EDV = 4       ' diretorio dos .EDV
CONST DES_LN_CAD = 5       ' diretorio dos .DXF ou .PUB

DECLARE SUB DesMenu (dirDados AS STRING, obra AS STRING)
DECLARE SUB DesSubmodulo (nome AS STRING)
DECLARE SUB DesParametros (dirDados AS STRING)
DECLARE SUB DesDiretorios
DECLARE SUB DesCampo (lin AS INTEGER, ln AS INTEGER, rotulo AS STRING)
DECLARE SUB DesObra (dirDados AS STRING)
DECLARE SUB DesPausa
DECLARE SUB DesFim
DECLARE SUB DesResumo (dirEdv AS STRING, obra AS STRING)
DECLARE SUB DesIniRecarrega
DECLARE FUNCTION DesLinhaItem% (item AS INTEGER, ini AS INTEGER)
DECLARE FUNCTION DesRotulo$ (item AS INTEGER)
DECLARE FUNCTION DspValor$ (linha AS STRING)
DECLARE FUNCTION DspTrocaValor$ (linha AS STRING, valor AS STRING)
DECLARE FUNCTION DcTabelaAco# (compr() AS DOUBLE, peso() AS DOUBLE)
DECLARE FUNCTION DcPesoMetro# (phi AS DOUBLE)
DECLARE FUNCTION CcaBitola# (i AS INTEGER)

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, obra AS STRING

IF ArqLer%("DESENHO.INI") < 0 THEN
    TelaMoldura 1, 1, 23, 80
    TelaErro "NAO EXISTE ESTE ARQUIVO NESTE DISCO"
    DesPausa
    DesFim
END IF

dirDados = IniDirDados$
obra = ObraAtual$(dirDados)
IF obra = "" THEN
    DesObra dirDados
    obra = ObraAtual$(dirDados)
END IF

DesMenu dirDados, obra
DesFim

' Desenha o menu principal e despacha cada tecla. F2 encerra.
' Os seis primeiros itens sao os do dump. Os quatro ultimos (G S V I) nao estao
' no dump; RECONSTRUCAO: foram incluidos para alcançar DESGRAF, DESEDCAO, VPLOTA e DESINIT.
' O texto do item comeca pela letra da tecla (TelaItemMenu destaca a primeira letra).
SUB DesMenu (dirDados AS STRING, obra AS STRING)
    DIM k AS STRING
    DO
        CLS
        TelaMoldura 1, 1, 23, 80
        LOCATE 3, 20: PRINT "DETALHAMENTO E DESENHO DE VIGAS CONTINUAS"
        LOCATE 5, 20: PRINT "OpenStrut                              "
        LOCATE 6, 20: PRINT "Abril 1991   (omitido)                 "
        LOCATE 7, 20: PRINT "Versao 4.0"
        LOCATE 9, 10: PRINT "OBRA - "; obra
        TelaItemMenu 11, 10, "Detalhamento e Desenho"
        TelaItemMenu 12, 10, "Editadas, acesso as Vigas gravadas"
        TelaItemMenu 13, 10, "Listagem dos dados arquivados"
        TelaItemMenu 14, 10, "Resumo geral de consumo"
        TelaItemMenu 15, 10, "Parametrizacoes / escolha"
        TelaItemMenu 16, 10, "Alteracao de Drive e Subdiretorio"
        ' RECONSTRUCAO: itens fora do dump, um por tecla de submodulo.
        TelaItemMenu 17, 10, "Grafico de uma viga editada (DESGRAF)"
        TelaItemMenu 18, 10, "Selecao das posicoes de ferro (DESEDCAO)"
        TelaItemMenu 19, 10, "Vigas editadas: plotagem em folhas (VPLOTA)"
        TelaItemMenu 20, 10, "Inicializacao do Detalhamento (.SEC -> .EDV)"
        LOCATE 22, 10: PRINT "escolha opcao ";
        TelaStatus "<F2> = Fim"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "D": DesSubmodulo "DESDIM"
            CASE "E": DesSubmodulo "DESEDITA"
            CASE "L": DesSubmodulo "DESIMP"
            CASE "R"
                DesIniRecarrega
                DesResumo DirUtilizavel$(RTRIM$(IniValor$(DES_LN_EDV))), obra
            CASE "P": DesParametros dirDados
            CASE "A": DesDiretorios
            CASE "G": DesSubmodulo "DESGRAF"
            CASE "S": DesSubmodulo "DESEDCAO"
            CASE "V": DesSubmodulo "VPLOTA"
            CASE "I": DesSubmodulo "DESINIT"
            CASE CHR$(0) + CHR$(60): EXIT DO
        END SELECT
    LOOP
END SUB

' Executa o submodulo nome pelo diretorio de ComumDirExecDefine.
' Se o .EXE nao existir, mostra o erro e volta ao menu.
SUB DesSubmodulo (nome AS STRING)
    DIM dirExec AS STRING
    dirExec = ComumDirExec$
    IF dirExec = "" THEN dirExec = DIR_EXEC_PADRAO
    IF NOT _FILEEXISTS(dirExec + nome + ".EXE") THEN
        TelaErro "Modulo nao encontrado em " + dirExec
        DesPausa
        EXIT SUB
    END IF
    TelaStatus "Aguarde ..."
    RunSubmodulo nome
END SUB

' Tela Atualizacao de Parametros. Mostra os itens 1-9 do .DSP apontado pelo
' DESENHO.INI (linha 1 = nome, linha 3 = diretorio). "item,valor" grava o item
' no .DSP; Enter vazio volta; D leva a drive e diretorio.
' ArqLer% troca o buffer, por isso cada volta relê o INI e o .DSP do disco.
SUB DesParametros (dirDados AS STRING)
    DIM dspArq AS STRING, entrada AS STRING, novo AS STRING
    DIM item AS INTEGER, ln AS INTEGER, ini AS INTEGER, virg AS INTEGER, ok AS INTEGER
    DO
        DesIniRecarrega
        CLS
        TelaMoldura 1, 1, 23, 80
        LOCATE 3, 10: PRINT "Atualizacao de Parametros"
        LOCATE 5, 5: PRINT "P - Parametrizacao Utilizada - "; RTRIM$(IniValor$(DES_LN_PAR))
        dspArq = DirUtilizavel$(RTRIM$(IniValor$(DES_LN_DSP))) + RTRIM$(IniValor$(DES_LN_PAR)) + ".DSP"
        ok = (ArqLer%(dspArq) > 0)
        ini = 0
        IF ok THEN ini = ArqAchaTexto%("PARAMETROS GLOBAIS", 0)
        ok = (ini > 0)
        IF ok THEN
            FOR item = 1 TO 9
                ln = DesLinhaItem%(item, ini)
                LOCATE 7 + item, 5: PRINT LTRIM$(STR$(item)); " - "; DesRotulo$(item)
                LOCATE 7 + item, 48
                IF ln > 0 THEN PRINT DspValor$(ArqLinha$(ln)) ELSE PRINT "nao existe no .DSP"
            NEXT
        ELSE
            LOCATE 8, 5: PRINT "Sem bloco PARAMETROS GLOBAIS em "; dspArq
        END IF
        LOCATE 20, 5: PRINT "item , Novo Valor  *NAO*"
        LOCATE 21, 5: PRINT "Acione  D <Enter>  para alterar Drive e Diretorio"
        TelaStatus "Enter vazio = NAO    item,valor = grava no .DSP    P = Nome do .DSP    D = Drive e Diretorio"
        entrada = LTRIM$(RTRIM$(EntradaTexto$(20, 30, 20, "")))
        IF entrada = "" THEN
            EXIT DO
        ELSEIF UCASE$(entrada) = "P" THEN
            DesIniRecarrega
            DesCampo 6, DES_LN_PAR, "Nome do Arquivo PARAMETRIZACAO *"
        ELSEIF UCASE$(entrada) = "D" THEN
            DesIniRecarrega
            DesDiretorios
        ELSEIF NOT ok THEN
            TelaErro "Nao ha .DSP carregado para gravar"
            DesPausa
        ELSE
            virg = INSTR(entrada, ",")
            IF virg = 0 THEN
                TelaErro "Use item,valor   ex.: 2,0.20"
                DesPausa
            ELSE
                item = VAL(LEFT$(entrada, virg - 1))
                novo = LTRIM$(RTRIM$(MID$(entrada, virg + 1)))
                ln = DesLinhaItem%(item, ini)
                IF ln = 0 OR novo = "" THEN
                    TelaErro "Item sem linha no .DSP ou valor vazio"
                    DesPausa
                ELSE
                    ArqDefinirLinha ln, DspTrocaValor$(ArqLinha$(ln), novo)
                    ArqGravar dspArq
                END IF
            END IF
        END IF
    LOOP
    DesIniRecarrega
END SUB

' ArqLer% troca o buffer por outro arquivo; esta SUB devolve o buffer ao DESENHO.INI.
SUB DesIniRecarrega
    IF ArqLer%("DESENHO.INI") < 0 THEN DesFim
END SUB

' Rotulo do item 1-9 da tela de parametros, como no dump do DESENHO.EXE.
FUNCTION DesRotulo$ (item AS INTEGER)
    SELECT CASE item
        CASE 1: DesRotulo$ = "Reducao dos Negativos a (%)"
        CASE 2: DesRotulo$ = "Concreto"
        CASE 3: DesRotulo$ = "Aco"
        CASE 4: DesRotulo$ = "Tipo de Aco (A/B)"
        CASE 5: DesRotulo$ = "Cobrimento da Armadura (cm)"
        CASE 6: DesRotulo$ = "Alivio Esforcos Cortantes no Apoio"
        CASE 7: DesRotulo$ = "Cargas Acidentais"
        CASE 8: DesRotulo$ = "Momentos Externos"
        CASE 9: DesRotulo$ = "Desenho Definitivo da Armadura"
    END SELECT
END FUNCTION

' Linha do .DSP que guarda o item 1-9, procurada no bloco PARAMETROS GLOBAIS
' (ini = linha do cabecalho, bloco de 15 linhas). Devolve 0 se o item nao tem linha.
' O item 9 nao tem linha no SISTRUT.DSP de exemplo.
FUNCTION DesLinhaItem% (item AS INTEGER, ini AS INTEGER)
    DIM anc AS STRING, achou AS INTEGER
    SELECT CASE item
        CASE 1: anc = "MOMENTOS NEGATIVOS"
        CASE 2: anc = "CONCRETO - Fck"
        CASE 3: anc = "ACO - Fyk"
        CASE 4: anc = "TIPO DE ACO"
        CASE 5: anc = "COBRIMENTO DA ARMADURA"
        CASE 6: anc = "ALIVIO DE ESFORCOS"
        CASE 7: anc = "CARGAS ACIDENTAIS"
        CASE 8: anc = "MOMENTOS EXTERNOS"
        CASE ELSE: EXIT FUNCTION
    END SELECT
    achou = ArqAchaTexto%(anc, ini)
    IF achou > ini AND achou <= ini + 15 THEN DesLinhaItem% = achou
END FUNCTION

' Primeiro campo de uma linha do .DSP (o valor; o resto e a descricao).
FUNCTION DspValor$ (linha AS STRING)
    DIM t AS STRING
    t = LTRIM$(linha)
    IF INSTR(t, " ") = 0 THEN DspValor$ = t ELSE DspValor$ = LEFT$(t, INSTR(t, " ") - 1)
END FUNCTION

' Troca o valor de uma linha do .DSP e mantem a descricao a partir da coluna 19.
FUNCTION DspTrocaValor$ (linha AS STRING, valor AS STRING)
    DIM t AS STRING, resto AS STRING, pad AS INTEGER
    t = LTRIM$(linha)
    resto = ""
    IF INSTR(t, " ") > 0 THEN resto = LTRIM$(MID$(t, INSTR(t, " ")))
    pad = 18 - LEN(valor)
    IF pad < 1 THEN pad = 1
    DspTrocaValor$ = valor + SPACE$(pad) + resto
END FUNCTION

' Resumo geral de consumo: soma o aco de todas as vigas do .EDV da obra, por bitola.
SUB DesResumo (dirEdv AS STRING, obra AS STRING)
    DIM compr(1 TO 9) AS DOUBLE, peso(1 TO 9) AS DOUBLE, tot AS DOUBLE
    DIM i AS INTEGER, lin AS INTEGER
    IF VigLe%(dirEdv + obra + ".EDV", "EDV") = 0 THEN
        TelaErro DadErro
        DesPausa
        EXIT SUB
    END IF
    IF VigQtd = 0 THEN
        TelaErro "Nenhuma viga gravada para a obra"
        DesPausa
        EXIT SUB
    END IF
    tot = DcTabelaAco#(compr(), peso())
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "RESUMO GERAL DE CONSUMO - OBRA - "; obra
    LOCATE 4, 10: PRINT "BITOLA(mm)   METROS      KG/m        KG"
    lin = 5
    FOR i = 1 TO 9
        IF compr(i) > 0 THEN
            LOCATE lin, 10
            PRINT USING "##.#        #####.##  ###.###  #####.##"; CcaBitola#(i); compr(i); DcPesoMetro#(CcaBitola#(i)); peso(i)
            lin = lin + 1
        END IF
    NEXT
    LOCATE lin + 1, 10: PRINT "PESO TOTAL (kg): ";
    PRINT USING "#####.##"; tot
    DesPausa
END SUB

' Tela de drive e diretorio: vigas, parametrizacao, editadas e CAD.
SUB DesDiretorios
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 3, 10: PRINT "Drive:\Diretorio\...\Subdiretorio"
    DesCampo 5, DES_LN_VIG, "dos arquivos de Vigas (.VIG .SEC .FOR)"
    DesCampo 7, DES_LN_DSP, "dos arquivos de Parametrizacao (.DSP)"
    DesCampo 9, DES_LN_EDV, "dos arquivos de Vigas Editadas (.EDV)"
    DesCampo 11, DES_LN_CAD, "dos arquivos publicos CAD (.DXF ou .PUB)"
END SUB

' Rotulo na linha lin, campo editavel na linha lin+1 com o valor da linha ln do INI.
' Enter grava o valor em DESENHO.INI. Diretorio inexistente so gera aviso.
SUB DesCampo (lin AS INTEGER, ln AS INTEGER, rotulo AS STRING)
    DIM valor AS STRING
    LOCATE lin, 5: PRINT rotulo
    valor = EntradaTexto$(lin + 1, 5, 40, IniValor$(ln))
    IF valor = "" THEN EXIT SUB
    IniDefinir ln, valor
    ArqGravar "DESENHO.INI"
    IF ln <> DES_LN_PAR THEN
        IF NOT _DIREXISTS(valor) THEN
            TelaErro "ATENCAO ! .. Drive e Diretorio nao encontrados"
            DesPausa
        END IF
    END IF
END SUB

' Pede o nome da obra corrente (vazio = RETORNO sem gravar) e grava em SISTRUT.OBR.
SUB DesObra (dirDados AS STRING)
    DIM nome AS STRING
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 10, 10: PRINT "Nome da Obra *RETORNO*"
    nome = EntradaTexto$(10, 35, 20, "")
    IF nome <> "" THEN ObraDefine dirDados, nome
END SUB

' Espera ENTER ou ESC depois de um aviso ou erro.
SUB DesPausa
    DIM k AS STRING
    TelaStatus "Acione ESC <Enter> para Continuar"
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mensagem de encerramento do sistema, como no dump.
SUB DesFim
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
