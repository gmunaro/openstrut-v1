' ===============================================================
' FORMINIT.BAS - inicializacao da montagem da Forma (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Chamado por FORMA ("Inicio a montagem"); com a montagem pronta, chama
' FORMEDCA (edicao e gravacao do .FRM). Fontes: docs/modules/FORMINIT.md,
' dump de strings do FORMINIT.EXE (fora do repositorio). Dados: SISDADOS.BM. Diretorios: FORMA.INI.
' Compilacao: tools/build.sh forma/FORMINIT
' Textos fora do dump (RECONSTRUCAO): "Obra corrente nao definida...",
' "Montagem gravada em ...". Os demais vem de dump de strings do FORMINIT.EXE (fora do repositorio).
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST FORMA_INI_NOME = "FORMA.INI"

DIM SHARED obra$, dirLaj$, dirVig$, dirCol$, dirFrm$

DECLARE SUB CarregaDirs ()
DECLARE FUNCTION IniDirDe$ (chave$)
DECLARE FUNCTION DirIni$ (chave$)
DECLARE FUNCTION Carrega% ()
DECLARE SUB Etapa (lin%, texto$)
DECLARE SUB FalhaProcessa (motivo$)
DECLARE SUB GravaFin ()
DECLARE SUB TelaFim ()

' ---- programa principal ----
ComumDirExecDefine _CWD$
CarregaDirs
obra$ = ObraAtual$(IniDirDados$)
CLS
COLOR COR_TEXTO
Etapa 5, "Aguarde ..."
IF obra$ = "" THEN
    FalhaProcessa "Obra corrente nao definida em SISTRUT.OBR"
ELSEIF Carrega% = 0 THEN
    FalhaProcessa DadErro
ELSE
    ' RECONSTRUCAO: as etapas abaixo mostram o texto do dump, mas o calculo
    ' de geometria nao foi reconstruido (o dump nao traz o algoritmo).
    ' Passos 1 e 2 do dump (reposicao de Pilares e Vigas alterados) nao sao
    ' exibidos: nao ha gatilho conhecido nesta montagem.
    Etapa 6, "Posicionando Bordos livres e Buracos na Forma."
    Etapa 7, "Posicionando Secao dos Pilares na forma."
    Etapa 8, "Posicionando Vigas em planta na forma."
    Etapa 9, "Interseccoes entre linhas de faces das Vigas."
    Etapa 10, "Interseccoes entre linhas de faces das Vigas com Pilares."
    Etapa 11, "Interseccoes entre linhas de Bordos Livres de Lajes."
    GravaFin
    Etapa 13, "Montagem gravada em " + obra$ + ".FIN"
    ' Passa a forma montada para a edicao: o dump traz FORMEDCA como destino
    ' de saida [FORMINIT 0x01f848] e FORMEDCA conhece FORMINIT/VOLTAFORMINIT
    ' [FORMEDCA 0x04566a, 0x045676]. O .FRM so e gravado no G do FORMEDCA.
    ' RECONSTRUCAO: a volta (VOLTAFORMINIT) e o fim do FORMEDCA; aqui segue
    ' para TelaFim e o FORMA retoma o menu.
    RunSubmodulo "FORMEDCA"
END IF
TelaFim

' Preenche as quatro pastas (Lajes, Vigas, Colunas, Formas) a partir do FORMA.INI.
' Sem FORMA.INI, todas ficam no diretorio do executavel.
SUB CarregaDirs
    dirLaj$ = ComumDirExec$: dirVig$ = ComumDirExec$
    dirCol$ = ComumDirExec$: dirFrm$ = ComumDirExec$
    IF ArqLer%(ComumDirExec$ + FORMA_INI_NOME) < 0 THEN EXIT SUB
    dirLaj$ = DirIni$("ARQUIVOS DE LAJES")
    dirVig$ = DirIni$("ARQUIVOS DE VIGAS")
    dirCol$ = DirIni$("ARQUIVOS DE COLUNAS")
    dirFrm$ = DirIni$("ARQUIVOS DE FORMAS")
END SUB

' Diretorio do FORMA.INI para a chave; vazio cai no diretorio do executavel.
FUNCTION DirIni$ (chave$)
    DIM d$
    d$ = IniDirDe$(chave$)
    IF d$ = "" THEN d$ = ComumDirExec$
    DirIni$ = d$
END FUNCTION

' Valor da linha cuja descricao contem chave$, validado por DirUtilizavel$ (com barra
' final; raiz ou pasta inexistente vira a pasta de trabalho). "" se a linha nao existir.
FUNCTION IniDirDe$ (chave$)
    DIM i%
    IniDirDe$ = ""
    i% = ArqAchaTexto%(chave$, 0)
    IF i% > 0 THEN IniDirDe$ = DirUtilizavel$(IniValor$(i%))
END FUNCTION

' Le Lajes, Vigas e Colunas da obra corrente (nomes <obra>.LAJ, .VIG, .COL).
' Devolve -1 se os tres leram, 0 se algum falhou (motivo em DadErro).
' RECONSTRUCAO: FORMA nao passa os nomes escolhidos; usa-se o nome da obra.
FUNCTION Carrega% ()
    LajObra = obra$: VigObra = obra$: ColObra = obra$
    IF LajLe%(dirLaj$ + obra$ + ".LAJ") = 0 THEN EXIT FUNCTION
    IF VigLe%(dirVig$ + obra$ + ".VIG", "VIG") = 0 THEN EXIT FUNCTION
    IF ColLe%(dirCol$ + obra$ + ".COL") = 0 THEN EXIT FUNCTION
    Carrega% = -1
END FUNCTION

' Escreve o texto na linha lin%, a partir da coluna 4.
SUB Etapa (lin%, texto$)
    LOCATE lin%, 4: COLOR COR_TEXTO
    PRINT texto$
END SUB

' Mostra a falha de processamento com o motivo, espera ESC ou Enter e encerra.
SUB FalhaProcessa (motivo$)
    DIM k$, lin%, resto$
    CLS
    Etapa 11, "erro no processamento"
    Etapa 12, "verifique a consistencia dos seus dados"
    ' RECONSTRUCAO: o motivo pode passar de 76 colunas (caminho completo do .FRM);
    ' quebra em blocos de 76 a partir da linha 13 e o aviso de ESC desce logo abaixo.
    lin% = 13: resto$ = motivo$
    DO
        Etapa lin%, LEFT$(resto$, 76)
        resto$ = MID$(resto$, 77)
        lin% = lin% + 1
    LOOP UNTIL resto$ = ""
    Etapa lin%, "Acione ESC <Enter> para Continuar"
    DO
        k$ = TeclaLer$
    LOOP UNTIL k$ = CHR$(27) OR k$ = CHR$(13)
END SUB

' Grava <obra>.FIN na pasta de Formas: cabecalho padrao (DADOS.md) e uma linha
' por grupo de elementos, no formato "<nome>",valor.
' RECONSTRUCAO: o conteudo das linhas (nomes e valores) nao esta no dump; aqui
' registra-se a quantidade lida de cada grupo.
SUB GravaFin
    DIM f AS INTEGER
    f = DadAbreGravacao%(dirFrm$ + obra$ + ".FIN", "FIN", obra$)
    WRITE #f, "LAJES", LajQtd
    WRITE #f, "VIGAS", VigQtd
    WRITE #f, "COLUNAS", ColQtd
    CLOSE #f
END SUB

' Encerramento como no gerenciador: mensagem de termino e volta ao FORMA.
SUB TelaFim
    CLS
    COLOR COR_TEXTO
    LOCATE 11, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    LOCATE 12, 10: PRINT "Retorno ao Modulo Gerenciador"
    COLOR COR_TEXTO, 0
    SYSTEM
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
