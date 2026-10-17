' ============================================================================
'  LAJEMONT.BAS - reacoes das lajes nas vigas e pilares (.VIG e .RLP).
'  Fonte RECONSTRUIDO (engenharia reversa) a partir de LAJEMONT.EXE (1991),
'  originalmente QuickBASIC 4.5. Especificacao: docs/modules/LAJEMONT.md.
'  O calculo fica em LAJMONT.BM (sem tela e sem I/O).
'
'  Marcas "RECONSTRUCAO" no fonte: trecho sem evidencia completa no EXE.
'  Compilacao: tools/build.sh laje/LAJEMONT
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB InicTextos ()
DECLARE SUB LeLaje ()
DECLARE SUB MontaLinhas ()
DECLARE SUB MostraReacoes ()
DECLARE SUB Cabecalho ()
DECLARE SUB MostraAvisos (msg AS STRING)
DECLARE SUB GravaArquivos (relat AS INTEGER)
DECLARE SUB EscreveLst (arq AS STRING)
DECLARE SUB Espera (l1 AS STRING, l2 AS STRING)
DECLARE FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS STRING)
DECLARE FUNCTION PadL$ (s AS STRING, n AS INTEGER)
DECLARE FUNCTION PadR$ (s AS STRING, n AS INTEGER)
DECLARE FUNCTION NumT$ (v AS DOUBLE, casas AS INTEGER, larg AS INTEGER)
DECLARE FUNCTION LinhaReacao$ (i AS INTEGER)
DECLARE FUNCTION LinhaTotal$ (i AS INTEGER)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE SUB VigGrava (arq AS STRING, tipo AS STRING)
DECLARE SUB CPilGrava (arq AS STRING, tipo AS STRING)
DECLARE SUB LmMonta (msg AS STRING)
DECLARE FUNCTION LmLado$ (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION LmLadoLen# (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION LmArea# (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION VigTramo% (v AS INTEGER, t AS INTEGER)
DECLARE SUB Imprime (s AS STRING)
DECLARE SUB MostraEsquemas ()
DECLARE SUB EsquemaVigas ()
DECLARE SUB EsquemaPilares ()

DIM SHARED DirDados AS STRING                 ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED Saida AS INTEGER                   ' 0 = tela; senao numero do arquivo do relatorio
DIM SHARED LinhaTela AS INTEGER               ' linhas impressas na pagina (paginacao de Imprime)
DIM SHARED TotVal(1 TO 11) AS DOUBLE          ' totais da tela de reacoes (ver InicTextos)
DIM SHARED TotNome(1 TO 11) AS STRING
DIM SHARED RowQtd AS INTEGER                  ' uma linha por lado de laje (4 por laje)
DIM SHARED RowLaje(1 TO 800) AS STRING
DIM SHARED RowSub(1 TO 800) AS INTEGER        ' lado 1..4
DIM SHARED RowArea(1 TO 800) AS DOUBLE        ' area de influencia do lado (m2)
DIM SHARED RowLe(1 TO 800) AS DOUBLE          ' comprimento do lado (m)
DIM SHARED RowRa(1 TO 800) AS DOUBLE          ' carga acidental do lado (tf)
DIM SHARED RowRp(1 TO 800) AS DOUBLE          ' carga permanente do lado (tf)
DIM SHARED RowEst(1 TO 800) AS STRING         ' viga ou pilar; "-" se o lado nao apoia
DIM SHARED RowApo(1 TO 800) AS STRING         ' "V" viga, "P" pilar, "-" sem apoio

DIM msg AS STRING, relat AS INTEGER

CarregaConfiguracao
InicTextos
LeLaje
LmMonta msg
MontaLinhas
MostraReacoes
MostraAvisos msg
IF VigQtd = 0 AND CPilQtd = 0 THEN SYSTEM
MostraEsquemas
relat = Pergunta%(23, "Imprimo Relatorio sobre Carregamento das Vigas S/*N*", "N")
IF Pergunta%(24, "Indexacoes de Vigas estao corretas  N/*S*", "S") = 0 THEN
    ' RECONSTRUCAO: resposta N encerra sem gravar (o EXE nao mostra o que acontece).
    Espera "Gravacao nao feita: indexacoes de vigas marcadas como incorretas.", ""
    SYSTEM
END IF
GravaArquivos relat
' RECONSTRUCAO: posicao da mensagem de encerramento (o EXE a tem, o ponto de chamada nao foi achado).
CLS
LOCATE 12, 3: PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Le SISTRUT.OBR e LAJE.INI (mesma regra de LAJEGRAV): unidade e diretorio de dados
' e obra corrente. Sem INI usa C:\ .
SUB CarregaConfiguracao
    DIM d AS STRING
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    IF ArqLer%(ComumDirExec$ + "LAJE.INI") >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN
            DirDados = d
            IF RIGHT$(DirDados, 1) <> "\" THEN DirDados = DirDados + "\"
        END IF
    END IF
    LajObra = ObraAtual$(DirDados)
    IF LajObra = "" THEN LajObra = "sem nome"
END SUB

' Textos fixos da tela e dos totais (strings do EXE, dump de strings do LAJEMONT.EXE (fora do repositorio)).
SUB InicTextos
    TotNome(1) = "Total das Cargas Lineares ......................"
    TotNome(2) = "Total Considerado das Cargas Lineares .........."
    TotNome(3) = "Total das Cargas por Area ......................"
    TotNome(4) = "Total Considerado das Cargas por Area .........."
    TotNome(5) = "Total do Peso Proprio das Vigas ................"
    TotNome(6) = "Total do Peso Proprio das Lajes ................"
    TotNome(7) = "Total das Cargas de Estrutura .................."
    TotNome(8) = "Total das Cargas no Painel ....................."
    TotNome(9) = "Total das Cargas aplicadas nas Vigas ..........."
    TotNome(10) = "Total das Cargas aplicadas nos Pilares ........."
    TotNome(11) = "Total das Cargas aplicadas nas Vigas+Pilares ..."
END SUB

' Le o .LAJ da obra corrente. Erro de leitura encerra o programa.
' RECONSTRUCAO: o EXE usa a mesma mensagem de erro para arquivo ausente ou invalido.
SUB LeLaje
    IF LajLe%(DirDados + LajObra + ".LAJ") = 0 THEN
        Espera "erro no processamento", "verifique a consistencia dos seus dados"
        SYSTEM
    END IF
    IF LajQtd = 0 THEN Espera "Nao ha lajes no arquivo de dados.", "": SYSTEM
END SUB

' Mensagem de erro em 24 e 23 (opcional); espera <ESC>.
SUB Espera (l1 AS STRING, l2 AS STRING)
    DIM k AS STRING
    IF l1 <> "" THEN TelaErro l1
    IF l2 <> "" THEN LOCATE 23, 1: PRINT l2
    TelaStatus "Acione <ESC> para Continuar "
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27)
END SUB

' Pergunta S/N na linha lin. Enter usa padrao. Devolve -1 para S e 0 para N.
FUNCTION Pergunta% (lin AS INTEGER, texto AS STRING, padrao AS STRING)
    DIM k AS STRING
    LOCATE lin, 1: COLOR COR_TEXTO
    PRINT texto;
    DO
        k = UCASE$(TeclaLer$)
        IF k = CHR$(13) THEN k = padrao
    LOOP UNTIL k = "S" OR k = "N"
    IF k = "S" THEN Pergunta% = -1 ELSE Pergunta% = 0
END FUNCTION

FUNCTION PadR$ (s AS STRING, n AS INTEGER)
    PadR$ = LEFT$(s + SPACE$(n), n)
END FUNCTION

FUNCTION PadL$ (s AS STRING, n AS INTEGER)
    PadL$ = RIGHT$(SPACE$(n) + s, n)
END FUNCTION

' Numero com casas decimais, alinhado a direita em larg colunas.
FUNCTION NumT$ (v AS DOUBLE, casas AS INTEGER, larg AS INTEGER)
    NumT$ = PadL$(FormataNumero$(v, casas, larg), larg)
END FUNCTION

' Preenche RowXxx() com os quatro lados de cada laje calculada e os totais TotVal().
' Lajes com temRes = 0 ficam de fora (ja avisadas por LmMonta).
' RECONSTRUCAO: definicao dos totais inferida pelos nomes (lacuna 6 do LAJEMONT.md):
'   1 e 2: Rp de todos os lados / lados com apoio; 3 e 4: Ra idem;
'   5: peso proprio das vigas (bw*h, zero quando vigas nao tem secao);
'   6: pp*area da laje; 7: g*area; 8: (g+pp+q)*area; 9 e 10: Rp+Ra nas vigas e nos pilares; 11 = 9+10.
SUB MontaLinhas
    DIM i AS INTEGER, k AS INTEGER, v AS INTEGER, t AS INTEGER, nm AS STRING
    DIM pp AS DOUBLE, wp AS DOUBLE, area AS DOUBLE, Rp AS DOUBLE, Ra AS DOUBLE
    FOR i = 1 TO 11: TotVal(i) = 0: NEXT
    RowQtd = 0
    FOR i = 1 TO LajQtd
        IF Laj(i).temRes <> 0 THEN
            pp = Laj(i).h / 100 * 2.5
            wp = Laj(i).g + pp
            TotVal(6) = TotVal(6) + pp * Laj(i).lx * Laj(i).ly
            TotVal(7) = TotVal(7) + Laj(i).g * Laj(i).lx * Laj(i).ly
            TotVal(8) = TotVal(8) + (Laj(i).g + pp + Laj(i).q) * Laj(i).lx * Laj(i).ly
            FOR k = 1 TO 4
                nm = LmLado$(i, k)
                area = LmArea#(i, k)
                Rp = wp * area
                Ra = Laj(i).q * area
                RowQtd = RowQtd + 1
                RowLaje(RowQtd) = RTRIM$(Laj(i).nome)
                RowSub(RowQtd) = k
                RowArea(RowQtd) = area
                RowLe(RowQtd) = LmLadoLen#(i, k)
                RowRa(RowQtd) = Ra
                RowRp(RowQtd) = Rp
                TotVal(1) = TotVal(1) + Rp
                TotVal(3) = TotVal(3) + Ra
                IF nm = "" THEN
                    RowEst(RowQtd) = "-": RowApo(RowQtd) = "-"
                ELSE
                    RowEst(RowQtd) = nm
                    TotVal(2) = TotVal(2) + Rp
                    TotVal(4) = TotVal(4) + Ra
                    IF LEFT$(nm, 1) = "P" THEN
                        RowApo(RowQtd) = "P"
                        TotVal(10) = TotVal(10) + Rp + Ra
                    ELSE
                        RowApo(RowQtd) = "V"
                        TotVal(9) = TotVal(9) + Rp + Ra
                    END IF
                END IF
            NEXT
        END IF
    NEXT
    FOR v = 1 TO VigQtd
        FOR t = 1 TO Vig(v).nTramos
            TotVal(5) = TotVal(5) + VigTra(VigTramo%(v, t)).vao * Vig(v).bw * Vig(v).h / 10000 * 2.5
        NEXT
    NEXT
    TotVal(11) = TotVal(9) + TotVal(10)
END SUB

' Linha da tabela de reacoes (mesmas colunas do cabecalho de Cabecalho).
FUNCTION LinhaReacao$ (i AS INTEGER)
    LinhaReacao$ = PadR$(RowLaje(i), 13) + PadL$(LTRIM$(STR$(RowSub(i))), 9) + NumT$(RowArea(i), 2, 10) + NumT$(RowLe(i), 2, 9) + NumT$(RowRa(i), 3, 8) + PadL$(RowEst(i), 9) + NumT$(RowRp(i), 3, 8) + PadL$(RowApo(i), 7)
END FUNCTION

FUNCTION LinhaTotal$ (i AS INTEGER)
    LinhaTotal$ = TotNome(i) + " " + NumT$(TotVal(i), 3, 12)
END FUNCTION

SUB Cabecalho
    CLS
    LOCATE 1, 1: PRINT "REACOES DE LAJES NAS VIGAS E PILARES"
    LOCATE 2, 1: PRINT "- - - - -  c a r g a s - - - -"
    LOCATE 3, 1: PRINT "Laje         Sub-area    Area      Linear   Area   Estru.  Peso  Apoio"
END SUB

' Tabela de lados em paginas de 18 linhas (F2 interrompe) e depois os 11 totais.
SUB MostraReacoes
    DIM i AS INTEGER, lin AS INTEGER, k AS STRING
    Cabecalho
    lin = 4
    FOR i = 1 TO RowQtd
        IF lin > 21 THEN
            LOCATE 23, 1: PRINT "Qualquer Tecla para Continuar ou <F2> para interromper."
            k = TeclaLer$
            IF k = CHR$(0) + CHR$(60) THEN EXIT FOR
            Cabecalho
            lin = 4
        END IF
        LOCATE lin, 1: PRINT LinhaReacao$(i)
        lin = lin + 1
    NEXT
    ' RECONSTRUCAO: a ultima pagina da tabela espera tecla antes dos totais; sem isso
    ' a tabela era apagada pelo CLS sem ser vista.
    LOCATE 23, 1: PRINT "Qualquer Tecla para Continuar"
    k = TeclaLer$
    CLS
    LOCATE 1, 1: PRINT "Distribuicao das cargas das Lajes nos Elementos de Apoio"
    FOR i = 1 TO 11
        LOCATE 2 + i, 1: PRINT LinhaTotal$(i)
    NEXT
    TelaStatus "Qualquer tecla para Continuar"
    k = TeclaLer$
END SUB

' Avisos de LmMonta (separados por "|") em tela propria.
SUB MostraAvisos (msg AS STRING)
    DIM n AS INTEGER, i AS INTEGER, k AS STRING
    IF msg = "" THEN EXIT SUB
    CLS
    n = ParConta%(msg, "|")
    FOR i = 1 TO n
        PRINT ParToken$(msg, "|", i)
    NEXT
    TelaStatus "Qualquer tecla para Continuar"
    k = TeclaLer$
END SUB

' Escreve s na tela (Saida = 0, com pausa a cada 20 linhas) ou no arquivo do relatorio.
' LinhaTela deve ser zerada antes de uma sequencia de telas.
' RECONSTRUCAO: paginacao de 20 linhas na tela e suposicao (o EXE nao foi lido aqui).
SUB Imprime (s AS STRING)
    DIM k AS STRING
    IF Saida <> 0 THEN
        PRINT #Saida, s
        EXIT SUB
    END IF
    IF LinhaTela >= 20 THEN
        TelaStatus "Qualquer tecla para Continuar"
        k = TeclaLer$
        CLS
        LinhaTela = 0
    END IF
    PRINT s
    LinhaTela = LinhaTela + 1
END SUB

' Esquemas unifilares na tela: vigas, depois pilares (so os que existem).
SUB MostraEsquemas
    Saida = 0: LinhaTela = 0
    CLS
    IF VigQtd > 0 THEN EsquemaVigas
    IF CPilQtd > 0 THEN EsquemaPilares
END SUB

' Pausa no fim de cada esquema. Nao pausa quando a saida e o arquivo .LST.
SUB PausaTela
    DIM k AS STRING
    IF Saida = 0 THEN
        TelaStatus "Qualquer tecla para Continuar"
        k = TeclaLer$
        CLS
        LinhaTela = 0
    END IF
END SUB

' Uma linha por tramo: viga, tramo, peso proprio e carga de alvenaria/laje do tramo.
' RECONSTRUCAO: Peso Proprio = vao * bw * h * 2,5 tf/m3 (bw e h em cm; zero sem secao);
'   Carga = (qPerm + qAcid) * vao. A forma "##(##" da coluna Tramo nao foi identificada.
SUB EsquemaVigas
    DIM v AS INTEGER, t AS INTEGER, ti AS INTEGER, pesoV AS DOUBLE, carga AS DOUBLE
    Imprime "Montagem do Esquema Unifilar do Carregamento das Vigas"
    Imprime ""
    Imprime "ALVENARIAS SOBRE AS VIGAS"
    Imprime "Viga          Tramo   Peso Proprio    Carga"
    FOR v = 1 TO VigQtd
        FOR t = 1 TO Vig(v).nTramos
            ti = VigTramo%(v, t)
            pesoV = VigTra(ti).vao * Vig(v).bw * Vig(v).h / 10000 * 2.5
            carga = (VigTra(ti).qPerm + VigTra(ti).qAcid) * VigTra(ti).vao
            Imprime PadR$(DadNome$(Vig(v).nome), 13) + PadL$(LTRIM$(STR$(t)), 5) + NumT$(pesoV, 2, 14) + NumT$(carga, 2, 12)
        NEXT
    NEXT
    PausaTela
END SUB

' Uma linha por pilar com a carga concentrada (N) recebida das lajes.
SUB EsquemaPilares
    DIM i AS INTEGER
    Imprime "Montagem do Esquema Unifilar do Carregamento dos Pilares"
    Imprime ""
    Imprime "ALVENARIAS SOBRE OS PILARES"
    Imprime "Pilar                                 Carga"
    FOR i = 1 TO CPilQtd
        Imprime PadR$(DadNome$(CPil(i).nome), 38) + NumT$(CPil(i).N, 2, 12)
    NEXT
    PausaTela
END SUB

' Grava .VIG e .RLP da obra corrente; com relat = -1 grava tambem o .LST.
' Tipos "VIG" e "RLP" conforme o contrato de dados (docs/formats/DADOS.md).
SUB GravaArquivos (relat AS INTEGER)
    DIM k AS STRING, arqLst AS STRING
    VigObra = LajObra: VigNivel = LajNivel
    CPilObra = LajObra: CPilNivel = LajNivel
    CLS
    TelaStatus "Gravacao do Arquivo de Vigas (.VIG)"
    VigGrava DirDados + LajObra + ".VIG", "VIG"
    TelaStatus "Gravacao do Arquivo de Cargas em Pilares e Inclinacoes (.RLP)"
    CPilGrava DirDados + LajObra + ".RLP", "RLP"
    LOCATE 23, 1: PRINT "Termino da Gravacao dos Arquivos de dados"
    IF relat = -1 THEN
        ' RECONSTRUCAO: nome do .LST = <obra>_LAJEMONT.LST no diretorio de dados.
        arqLst = DirDados + LajObra + "_LAJEMONT.LST"
        EscreveLst arqLst
        LOCATE 24, 1: PRINT "Relatorio gravado em " + arqLst
    END IF
    TelaStatus "Qualquer tecla para Continuar"
    k = TeclaLer$
END SUB

' Relatorio .LST: cabecalho da obra e os esquemas (Imprime grava no arquivo).
SUB EscreveLst (arq AS STRING)
    Saida = FREEFILE
    OPEN arq FOR OUTPUT AS #Saida
    Imprime "OpenStrut                             "
    Imprime "Versao 4.0    Abril 1991"
    Imprime ""
    Imprime " SOMATORIA DE REACOES EM PILARES E INCLINACOES GERADAS PELAS LAJES"
    Imprime " OBRA " + LajObra
    Imprime " GERADO EM " + DATE$ + " " + TIME$
    Imprime ""
    IF VigQtd > 0 THEN EsquemaVigas
    IF CPilQtd > 0 THEN EsquemaPilares
    CLOSE #Saida
    Saida = 0
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: 'LAJMONT.BM'
