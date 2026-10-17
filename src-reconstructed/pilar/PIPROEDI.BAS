' ============================================================================
'  PIPROEDI.BAS - processamento de colunas arquivadas por posicao (3.x).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de PIPROEDI.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/PIPROEDI.md.
'
'  Submodulo de PILAREDI: le <obra>.COL do diretorio de dados, pede as posicoes
'  e grava em <obra>_PIPROEDI.LST (DirDados) as colunas com esses nomes. *RETORNO* volta ao pai.
'  A pesquisa de posicoes so lista esforcos e armaduras gravados.
'  Processar (cada pedido): dimensiona as colunas (PILEDCAL.BM, PeDimensionaTodas), regrava o .COL e lista.
'  Verificacao de licenca do original nao reimplementada.
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Compilacao: bash tools/build.sh pilar/PIPROEDI
' ============================================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Rotinas de SISDADOS.BM (o .BI nao traz DECLARE)
DECLARE FUNCTION ColLe% (arq AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
' Rotinas deste modulo
DECLARE SUB CarregaConfiguracao ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB LimpaLinha (lin AS INTEGER)
DECLARE FUNCTION DirComBarra$ (d AS STRING)
DECLARE SUB Processa ()
DECLARE SUB Imprime (entrada AS STRING)
DECLARE SUB ListaColuna (c AS INTEGER, f AS INTEGER)
DECLARE FUNCTION Posicionada% (nome AS STRING, lista AS STRING)
DECLARE FUNCTION IniCarrega% ()
DECLARE FUNCTION IniNumero# (n AS INTEGER, padrao AS DOUBLE)
DECLARE SUB IniParaCalculo ()

DIM SHARED DirDados AS STRING       ' unidade:\diretorio\ dos arquivos de obra

CarregaConfiguracao
CLS
IF ColLe%(DirDados + ColObra + ".COL") = 0 THEN
    Espera "erro no processamento; verifique a consistencia dos seus dados", -1
ELSE
    Processa
    Espera "Retorno ao Modulo Basico de PILAREDI", 0
END IF
CLS
LOCATE 12, 10: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le o diretorio de dados do PILAR.INI e define a obra corrente.
' RECONSTRUCAO: o dump nao mostra de onde PIPROEDI tira a obra; usa PILAR.INI como PIGRAEDI.
SUB CarregaConfiguracao
    DIM d AS STRING
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    IF ArqLer%(ComumDirExec$ + "PILAR.INI") >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    ColObra = ObraAtual$(DirDados)
    IF ColObra = "" THEN
        CLS
        TelaCabecalho ""
        LOCATE 6, 3: PRINT "Nome da Obra ";
        ColObra = EntradaTexto$(6, 20, 30, "")
        IF ColObra = "" THEN ColObra = "sem nome"
        ObraDefine DirDados, ColObra
    END IF
END SUB

' Cabecalho: titulo, obra e diretorio (linha 2), razao social (linha 3); subtitulo na linha 4.
' RECONSTRUCAO: o diretorio e encurtado (mantem o final) para caber em 80 colunas;
' as linhas 2 a 4 sao limpas antes de escrever, para nao sobrepor textos antigos.
SUB TelaCabecalho (subtit AS STRING)
    DIM espaco AS INTEGER, mostra AS STRING
    mostra = DirDados
    espaco = 76 - LEN("Obra - " + ColObra + "   Dados em ")
    IF LEN(mostra) > espaco THEN mostra = "..." + RIGHT$(mostra, espaco - 3)
    LimpaLinha 2: LimpaLinha 3: LimpaLinha 4
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "PIPROEDI - Processamento de Colunas por Posicao"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "Obra - "; ColObra; "   Dados em "; mostra
    LOCATE 3, 3: PRINT "OpenStrut                             "
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 4, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Aviso (erro = -1) ou status (erro = 0) nas linhas 24 e 25, espera ESC ou Enter.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF texto <> "" THEN
        IF erro THEN TelaErro texto ELSE TelaStatus texto
    END IF
    LOCATE 23, 3: PRINT "Acione ESC <Enter> para Continuar";
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27) OR k = CHR$(13)
    LimpaLinha 23
    LimpaLinha 24
    LimpaLinha 25
END SUB

SUB LimpaLinha (lin AS INTEGER)
    LOCATE lin, 1: PRINT SPACE$(79);
END SUB

' Garante a barra final no caminho de diretorio.
FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Pede as posicoes e lista as colunas ate entrada vazia ou *RETORNO*.
SUB Processa
    DIM entrada AS STRING, pr AS STRING, msgDim AS STRING
    DIM fck AS DOUBLE, fyk AS DOUBLE, gf AS DOUBLE, gc AS DOUBLE, gs AS DOUBLE
    pr = "Processar posicoes I/J/N a M/.../K *RETORNO* "
    DO
        CLS
        TelaCabecalho ""
        LOCATE 6, 3: PRINT "Processamento de Colunas Arquivadas"
        LOCATE 7, 3: PRINT "Posicionadas/Colunas."
        LOCATE 9, 3: PRINT pr;
        entrada = UCASE$(EntradaTexto$(9, 3 + LEN(pr), 25, ""))
        IF entrada = "" OR entrada = "*RETORNO*" THEN EXIT DO
        ' dimensiona todas as colunas (PILEDCAL) e regrava o .COL antes de listar
        ' fck/fyk/coeficientes vem do PILAR.INI, como em PILAREDI (Dimensiona); d' = 4 cm
        ' RECONSTRUCAO: Fck/Fyk na unidade de grandeza (linha 16), como em PILAREDI
        fck = IniNumero#(17, 0.15#) * IniNumero#(16, 1#)
        fyk = IniNumero#(18, 5#) * IniNumero#(16, 1#)
        gf = IniNumero#(35, 1.4#)
        gc = IniNumero#(36, 1.4#)
        gs = IniNumero#(37, 1.15#)
        IniParaCalculo
        PeDimensionaTodas fck, fyk, gf, gc, gs, 4#, msgDim
        ColGrava DirDados + ColObra + ".COL"
        IF msgDim <> "" THEN Espera LEFT$(msgDim, 75), -1
        Imprime entrada
    LOOP
END SUB

' Grava em <obra>_PIPROEDI.LST (DirDados) as colunas cujo nome esta em entrada.
' O arquivo e refeito a cada pedido. Faixas (I a M) e "..." nao sao lidas.
' RECONSTRUCAO: a leitura de faixas e o significado de "posicionadas" sao inferidos.
SUB Imprime (entrada AS STRING)
    DIM c AS INTEGER, f AS INTEGER, lst AS STRING
    lst = DirDados + ColObra + "_PIPROEDI.LST"
    LOCATE 14, 3: PRINT "Aguarde ...";
    f = FREEFILE
    OPEN lst FOR OUTPUT AS #f
    FOR c = 1 TO ColQtd
        IF Posicionada%(RTRIM$(Col(c).nome), entrada) THEN ListaColuna c, f
    NEXT
    CLOSE #f
    ' RECONSTRUCAO: so o nome do arquivo cabe na linha 25 (79 colunas).
    Espera "Relatorio gravado em " + MID$(lst, LEN(DirDados) + 1), 0
END SUB

' Escreve no arquivo f a coluna c: uma linha por nivel, com esforco e armadura gravados.
' RECONSTRUCAO: layout e campos da listagem sao inferidos; o EXE nao mostra a tabela no dump.
SUB ListaColuna (c AS INTEGER, f AS INTEGER)
    DIM k AS INTEGER, e AS INTEGER
    PRINT #f, "Coluna "; RTRIM$(Col(c).nome); "   secao "; Col(c).secao; "   bx="; Col(c).bx; " by="; Col(c).by
    FOR k = 1 TO ColNivQtd
        e = (c - 1) * ColNivQtd + k
        PRINT #f, "  "; RTRIM$(ColNiv(k).nome); "  N="; ColEsf(e).N; " Mx="; ColEsf(e).Mx; " My="; ColEsf(e).My;
        PRINT #f, " lex="; ColEsf(e).lex; " ley="; ColEsf(e).ley; " As="; ColEsf(e).asTot; " barras="; ColEsf(e).nBarras;
        PRINT #f, " phi="; ColEsf(e).phi; " estribo="; ColEsf(e).phiEstribo; "c/"; ColEsf(e).sEstribo
    NEXT
END SUB

' Devolve -1 se nome esta na lista de posicoes separadas por "/".
FUNCTION Posicionada% (nome AS STRING, lista AS STRING)
    Posicionada% = INSTR("/" + lista + "/", "/" + UCASE$(nome) + "/") > 0
END FUNCTION

' Classe do aco (linha 19) e limites de esbeltez/fluencia (linhas 30, 31 e 34) do
' PILAR.INI para o calculo (copia de PILAREDI). Sem INI: classe A (PpClasseAco%) e
' padroes de PeParam#.
SUB IniParaCalculo
    DIM cl AS INTEGER, v AS DOUBLE, t AS STRING, tem AS INTEGER
    tem = IniCarrega%
    IF tem THEN t = IniValor$(19)
    cl = CcaAcoClasse%(PpClasseAco%(tem, t))
    v = PeParam#(1, IniNumero#(30, 80#))
    v = PeParam#(2, IniNumero#(31, 140#))
    v = PeParam#(3, IniNumero#(34, 1.1#))
END SUB

' Recarrega o PILAR.INI (copia de PILAREDI). Retorna -1 se o arquivo foi lido.
FUNCTION IniCarrega%
    IniCarrega% = (ArqLer%(ComumDirExec$ + "PILAR.INI") >= 0)
END FUNCTION

' Valor numerico da linha n do PILAR.INI; padrao se o arquivo ou a linha nao existe.
FUNCTION IniNumero# (n AS INTEGER, padrao AS DOUBLE)
    DIM t AS STRING
    IniNumero# = padrao
    IF IniCarrega% THEN
        t = IniValor$(n)
        IF t <> "" THEN IniNumero# = VAL(t)
    END IF
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: 'PILCALC.BM'
'$INCLUDE: 'PILEDCAL.BM'
'$INCLUDE: 'PILPRED.BM'
