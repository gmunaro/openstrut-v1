' ============================================================================
'  SISCOMUM.BI - declaracoes, constantes e estado da biblioteca comum
'  Uso no programa:
'      $CONSOLE:ONLY                       (se for programa de teste ou console)
'      '$INCLUDE: '../common/SISCOMUM.BI'  (no topo, antes do codigo principal)
'      ... codigo principal ...
'      '$INCLUDE: '../common/SISCOMUM.BM'  (no fim, depois do codigo principal)
'  O estado (DIM SHARED) fica aqui porque precisa estar declarado antes do uso.
' ============================================================================

'$INCLUDE: '../common/SISTELA.BI'

CONST ARQ_MAX = 1000                    ' linhas maximas de um arquivo carregado
CONST COR_TEXTO = 7                     ' cinza claro sobre preto
CONST COR_DESTAQUE = 15                 ' branco brilhante, primeira letra do menu
CONST COR_STATUS = 0                    ' preto sobre cinza (linha 25)
CONST COR_STATUS_FUNDO = 7
CONST COR_ERRO = 15                     ' branco sobre vermelho (linha 24)
CONST COR_ERRO_FUNDO = 4
CONST DIR_EXEC_PADRAO = "C:\SISTRUT\EXEC40\"

' Linhas do ultimo arquivo carregado por ArqLer%, indice 1 a ArqQtd,
' sem CR/LF e sem padding 0x1A
DIM SHARED ArqDados$(ARQ_MAX)
DIM SHARED ArqQtd AS INTEGER
' Diretorio dos executaveis para RunSubmodulo; vazio usa DIR_EXEC_PADRAO
DIM SHARED ComumDirExec$

' --- arquivos -------------------------------------------------------------
DECLARE FUNCTION FileExists% (nome$)
DECLARE FUNCTION ArqLer% (arquivo$)
DECLARE SUB ArqGravar (arquivo$)
DECLARE FUNCTION ArqLinha$ (n%)
DECLARE SUB ArqDefinirLinha (n%, texto$)
DECLARE FUNCTION ArqAchaTexto% (texto$, depois%)
DECLARE FUNCTION ArqAchaExato% (texto$, depois%)

' --- arquivos VALOR=DESCRICAO (.INI) -------------------------------------
DECLARE FUNCTION IniValor$ (n%)
DECLARE FUNCTION IniDesc$ (n%)
DECLARE SUB IniDefinir (n%, valor$)
DECLARE FUNCTION IniDirDados$ ()
DECLARE FUNCTION DirUtilizavel$ (d$)
DECLARE FUNCTION DirCurto$ (d$, larg%)
DECLARE FUNCTION IniDirParam$ ()
DECLARE FUNCTION ChrAvalia$ (expr$)

' --- arquivos de parametrizacao (.LAP, .PIP, .FOP, .DSP) -----------------
DECLARE FUNCTION ParToken$ (texto$, sep$, k%)
DECLARE FUNCTION ParConta% (texto$, sep$)

' --- numeros --------------------------------------------------------------
DECLARE FUNCTION FormataNumero$ (valor#, casas%, larg%)
DECLARE FUNCTION NumeroValido% (txt$)

' --- tela 80x25 ------------------------------------------------------------
DECLARE SUB TelaMoldura (l1%, c1%, l2%, c2%)
DECLARE SUB TelaItemMenu (lin%, col%, texto$)
DECLARE SUB TelaStatus (texto$)
DECLARE SUB TelaErro (texto$)
DECLARE FUNCTION TeclaLer$ ()
DECLARE FUNCTION EntradaTexto$ (lin%, col%, larg%, padrao$)
DECLARE FUNCTION EntradaNumero# (lin%, col%, larg%, padrao#)

' --- execucao de submodulos -----------------------------------------------
DECLARE SUB ComumDirExecDefine (dir$)
DECLARE SUB RunSubmodulo (nome$)
