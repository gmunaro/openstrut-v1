' ============================================================================
'  LAJEPROC.BAS - escolha, modificacao e desenho das armaduras das lajes.
'  Fonte RECONSTRUIDO (engenharia reversa) de LAJEPROC.EXE (1991), originalmente
'  QuickBASIC 4.5. Especificacao: docs/modules/LAJEPROC.md.
'  Textos de tela: dump de strings do LAJEPROC.EXE (fora do repositorio) (offsets do EXE).
'
'  Le <obra>.LAJ (resultados do LAJECALC). Grava um .VET por desenho (1:50,
'  1 m = 20 mm no papel; nome em ArqDesenho$) e <obra>_LAJEPROC.LST (tabela de
'  ferros e peso).
'  O .LAJ nao tem campos de armadura (lacuna, ver LAJEPROC.md): a escolha feita
'  em E e M fica no arquivo auxiliar <obra>.ARL (layout em ArlGrava). Laje sem
'  escolha (ou com escolha de um calculo anterior) usa a escolha automatica no
'  desenho e na impressao, com aviso.
'
'  Marcas RECONSTRUCAO: trecho sem evidencia completa no EXE.
'  Verificacao de licenca do original nao reimplementada.
'  Compilacao: tools/build.sh laje/LAJEPROC   (qb64pe -c -x LAJEPROC.BAS)
' ============================================================================

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Criterio da escolha automatica (CcaEscolheMalha). RECONSTRUCAO: phiMin e
' sMin inferidos da tarefa; sMax (20 cm) e chute e precisa de confirmacao.
CONST PROC_PHI_MIN = 5
CONST PROC_S_MIN = 7
CONST PROC_S_MAX = 20
' Desenho 1:50: 1 m real = 20 mm no papel. Origem do desenho em 20 mm.
CONST PROC_MM_M = 20
CONST PROC_ORIGEM = 20
' Peso linear do aco (kg/m) = PROC_PESO * phi^2 / 100, phi em mm.
CONST PROC_PESO = 0.617
' Posicoes de armadura por laje: 1 positiva principal, 2 positiva secundaria,
' 3 a 6 negativa dos bordos 1 (esquerdo), 2 (inferior), 3 (direito), 4 (superior),
' ordem do contrato .LAJ (docs/formats/DADOS.md).
CONST PROC_POS = 6

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB TelaCabecalho (subtit AS STRING)
DECLARE SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
DECLARE SUB Espera (texto AS STRING, erro AS INTEGER)
DECLARE SUB ItemEscolha ()
DECLARE SUB ItemModifica ()
DECLARE SUB ArmTela (i AS INTEGER)
DECLARE SUB ArmPede (lin AS INTEGER, titulo AS STRING, phi AS DOUBLE, s AS DOUBLE)
DECLARE SUB ItemDesenha (tipoPadrao AS INTEGER)
DECLARE SUB DesenhaLaje (f AS INTEGER, i AS INTEGER, tipo AS INTEGER)
DECLARE SUB RotulosLaje (f AS INTEGER, i AS INTEGER, tipo AS INTEGER, passo AS DOUBLE)
DECLARE FUNCTION RotuloPasso# (ini AS INTEGER, fim AS INTEGER, tipo AS INTEGER)
DECLARE FUNCTION ArqDesenho$ (tipo AS INTEGER, uma AS INTEGER)
DECLARE SUB EscolheLaje (i AS INTEGER)
DECLARE FUNCTION CompletaEscolha% (ini AS INTEGER, fim AS INTEGER, aplica AS INTEGER)
DECLARE SUB ArlGrava ()
DECLARE SUB ArlLe ()
DECLARE SUB BarrasPos (f AS INTEGER, i AS INTEGER, k AS INTEGER)
DECLARE SUB BarrasNeg (f AS INTEGER, i AS INTEGER, k AS INTEGER)
DECLARE SUB ItemImprime ()
DECLARE SUB ImprimeLinha (f AS INTEGER, i AS INTEGER, k AS INTEGER)
DECLARE SUB EscolheAuto ()
DECLARE SUB ArmEscolhe (i AS INTEGER, k AS INTEGER, asm AS DOUBLE)
DECLARE FUNCTION LajTemCalc% ()
DECLARE FUNCTION LajAs# (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION LajMom# (i AS INTEGER, b AS INTEGER)
DECLARE FUNCTION LajNegMax# (i AS INTEGER, usaAs AS INTEGER)
DECLARE FUNCTION LajMenor# (i AS INTEGER)
DECLARE FUNCTION PapelX# (m AS DOUBLE)
DECLARE FUNCTION PapelY# (m AS DOUBLE)
DECLARE FUNCTION BitolaIndice% (phi AS DOUBLE)
DECLARE FUNCTION NegativaInsuficiente% (i AS INTEGER, phi AS DOUBLE, s AS DOUBLE)
DECLARE FUNCTION Pergunta$ (lin AS INTEGER, texto AS STRING, larg AS INTEGER, padrao AS STRING)
DECLARE FUNCTION IniArq$ ()
DECLARE FUNCTION DirComBarra$ (d AS STRING)
' Rotinas de common/ sem DECLARE nos .BI
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE FUNCTION CcaBitola# (i AS INTEGER)
DECLARE FUNCTION CcaAreaBarra# (phi AS DOUBLE)
DECLARE SUB CcaEscolheMalha (asm AS DOUBLE, phiMin AS DOUBLE, sMin AS DOUBLE, sMax AS DOUBLE, phi AS DOUBLE, s AS DOUBLE)
DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE FUNCTION VetMostra% (arqVet AS STRING)

DIM SHARED DirDados AS STRING                                  ' unidade:\diretorio\ dos arquivos de obra
DIM SHARED ArmPhi(1 TO DAD_MAXLAJ, 1 TO PROC_POS) AS DOUBLE   ' bitola (mm) por posicao
DIM SHARED ArmS(1 TO DAD_MAXLAJ, 1 TO PROC_POS) AS DOUBLE     ' espacamento (cm) por posicao
DIM SHARED ArmTem(1 TO DAD_MAXLAJ) AS INTEGER                 ' -1 = escolha feita em E/M (gravada no .ARL)
DIM SHARED ResPeso(1 TO 9) AS DOUBLE                          ' kg por bitola (relatorio)
DIM SHARED ResComp(1 TO 9) AS DOUBLE                          ' m por bitola (relatorio)

CarregaConfiguracao
IF LajTemCalc% = 0 THEN
    ' RECONSTRUCAO: texto pedido na tarefa; nao aparece no strings do EXE.
    Espera "Lajes sem calculo, execute o Dimensionamento", -1
ELSE
    MenuPrincipal
END IF
CLS
LOCATE 12, 3: PRINT "Retorno ao Modulo Basico de LAJE"
SYSTEM

' Le LAJE.INI (drive e diretorio de dados), a obra corrente e <obra>.LAJ.
' Sem LAJE.INI usa C:\ . Sem .LAJ, LajQtd fica 0 e LajTemCalc% da 0.
SUB CarregaConfiguracao
    DIM d AS STRING, i AS INTEGER
    ComumDirExecDefine _CWD$
    DirDados = DirUtilizavel$("")   ' sem INI: pasta do programa (nunca a raiz do disco)
    i = ArqLer%(IniArq$)
    IF i >= 0 THEN
        d = IniDirDados$
        IF INSTR(d, ":") = 2 THEN DirDados = DirComBarra$(d)
    END IF
    LajObra = ObraAtual$(DirDados)
    IF LajObra = "" THEN LajObra = "sem nome"
    i = LajLe%(DirDados + LajObra + ".LAJ")
    IF i <> -1 THEN LajQtd = 0
    ArlLe
END SUB

' Grava a escolha das lajes com ArmTem em <obra>.ARL (backup em .ARL.BAK).
' Layout: cabecalho "SISTRUT40","ARL",1,"<obra>", depois <n> e uma linha por laje:
'   "<nome>",as1,phi1,s1,...,as6,phi6,s6
' posicoes 1 positiva principal, 2 secundaria, 3..6 negativa dos bordos esquerdo,
' inferior, direito e superior; as em cm2/m (do calculo), phi em mm, s em cm.
SUB ArlGrava
    DIM f AS INTEGER, i AS INTEGER, k AS INTEGER, n AS INTEGER
    n = 0
    FOR i = 1 TO LajQtd
        IF ArmTem(i) THEN n = n + 1
    NEXT
    f = DadAbreGravacao%(DirDados + LajObra + ".ARL", "ARL", LajObra)
    WRITE #f, n
    FOR i = 1 TO LajQtd
        IF ArmTem(i) THEN
            PRINT #f, CHR$(34); DadNome$(Laj(i).nome); CHR$(34);
            FOR k = 1 TO PROC_POS
                PRINT #f, ","; LTRIM$(STR$(LajAs#(i, k))); ","; LTRIM$(STR$(ArmPhi(i, k))); ","; LTRIM$(STR$(ArmS(i, k)));
            NEXT
            PRINT #f, ""
        END IF
    NEXT
    CLOSE #f
END SUB

' Le <obra>.ARL, se existir. A escolha de uma laje so vale se a laje tem resultado
' e as areas gravadas batem com as do .LAJ atual; senao (recalculo depois da
' escolha) e ignorada e a laje fica sem escolha.
SUB ArlLe
    DIM f AS INTEGER, n AS INTEGER, j AS INTEGER, i AS INTEGER, k AS INTEGER, ok AS INTEGER
    DIM nome AS STRING, obra AS STRING, a(1 TO PROC_POS) AS DOUBLE, p(1 TO PROC_POS) AS DOUBLE, s(1 TO PROC_POS) AS DOUBLE
    IF NOT _FILEEXISTS(DirDados + LajObra + ".ARL") THEN EXIT SUB
    f = DadAbreLeitura%(DirDados + LajObra + ".ARL", "ARL", obra)
    IF f = 0 THEN EXIT SUB
    INPUT #f, n
    FOR j = 1 TO n
        IF EOF(f) THEN EXIT FOR
        INPUT #f, nome
        FOR k = 1 TO PROC_POS
            INPUT #f, a(k), p(k), s(k)
        NEXT
        FOR i = 1 TO LajQtd
            IF DadNome$(Laj(i).nome) = nome AND Laj(i).temRes = -1 THEN
                ok = -1
                FOR k = 1 TO PROC_POS
                    IF ABS(a(k) - LajAs#(i, k)) > 0.005 THEN ok = 0
                NEXT
                IF ok THEN
                    FOR k = 1 TO PROC_POS
                        ArmPhi(i, k) = p(k): ArmS(i, k) = s(k)
                    NEXT
                    ArmTem(i) = -1
                END IF
                EXIT FOR
            END IF
        NEXT
    NEXT
    CLOSE #f
END SUB

' Menu principal. Teclas E, P, N, M, I; R volta ao LAJE.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        CLS
        TelaCabecalho "Escolha de Armaduras do Painel / Lajes de um Edificio"
        MenuLinha 7, "E", "Escolhe todas as Armaduras"          ' RECONSTRUCAO: inicial E inferida
        MenuLinha 8, "P", "Positivo, desenho da Ferragem"       ' RECONSTRUCAO: inicial P inferida
        MenuLinha 9, "N", "Negativo, desenho da Ferragem"       ' RECONSTRUCAO: inicial N inferida
        MenuLinha 10, "M", "Modifica Armadura"                  ' RECONSTRUCAO: inicial M inferida
        MenuLinha 11, "I", "Impressao das Armaduras"            ' RECONSTRUCAO: inicial I inferida
        MenuLinha 12, "R", "Retorno ao Menu Principal"          ' RECONSTRUCAO: inicial R inferida
        TelaStatus "escolha opcao "
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "E": ItemEscolha
            CASE "P": ItemDesenha 1
            CASE "N": ItemDesenha 2
            CASE "M": ItemModifica
            CASE "I": ItemImprime
            CASE "R": EXIT DO
        END SELECT
    LOOP
END SUB

' Titulo, empresa, obra corrente e unidade de dados. subtit "" nao escreve na linha 5.
SUB TelaCabecalho (subtit AS STRING)
    COLOR COR_DESTAQUE
    LOCATE 1, 3: PRINT "LAJES EM REGIME DE RUPTURA"
    COLOR COR_TEXTO
    LOCATE 2, 3: PRINT "OpenStrut                             "
    LOCATE 3, 3: PRINT "Abril 1991 (omitido)                 "
    LOCATE 4, 3: PRINT "Obra - "; LajObra; "   Dados em "; DirCurto$(DirDados, 77 - LEN("Obra - " + RTRIM$(LajObra) + "   Dados em "))
    IF subtit <> "" THEN
        COLOR COR_DESTAQUE
        LOCATE 5, 3: PRINT subtit
        COLOR COR_TEXTO
    END IF
END SUB

' Uma linha do menu: tecla em destaque, texto em COR_TEXTO.
SUB MenuLinha (lin AS INTEGER, tecla AS STRING, texto AS STRING)
    LOCATE lin, 10
    COLOR COR_DESTAQUE
    PRINT tecla;
    COLOR COR_TEXTO
    PRINT "  -  "; texto
END SUB

' Mostra texto na linha de erro (erro = -1, linha 24) ou de status (linha 25),
' espera ESC ou Enter e limpa as linhas 23 a 25. texto "" so espera.
SUB Espera (texto AS STRING, erro AS INTEGER)
    DIM k AS STRING
    IF texto <> "" THEN
        IF erro THEN TelaErro texto ELSE TelaStatus texto
    END IF
    LOCATE 23, 3: PRINT "Acione ESC <Enter> para Continuar ";
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(27) OR k = CHR$(13)
    LOCATE 23, 1: PRINT SPACE$(79);
    LOCATE 24, 1: PRINT SPACE$(79);
    LOCATE 25, 1: PRINT SPACE$(79);
END SUB

' Mostra texto em (lin, 3) e le a resposta logo depois. Devolve em maiusculas.
' Resposta vazia devolve padrao (EntradaTexto$).
FUNCTION Pergunta$ (lin AS INTEGER, texto AS STRING, larg AS INTEGER, padrao AS STRING)
    LOCATE lin, 3: PRINT texto;
    Pergunta$ = UCASE$(EntradaTexto$(lin, 3 + LEN(texto), larg, padrao))
END FUNCTION

' Le o nome do LAJE.INI, na pasta de execucao.
FUNCTION IniArq$ ()
    IniArq$ = ComumDirExec$ + "LAJE.INI"
END FUNCTION

FUNCTION DirComBarra$ (d AS STRING)
    IF RIGHT$(d, 1) = "\" THEN DirComBarra$ = d ELSE DirComBarra$ = d + "\"
END FUNCTION

' Verdadeiro (-1) se ha alguma laje do .LAJ carregado com resultado de calculo.
FUNCTION LajTemCalc%
    DIM i AS INTEGER
    LajTemCalc% = 0
    FOR i = 1 TO LajQtd
        IF Laj(i).temRes = -1 THEN LajTemCalc% = -1: EXIT FUNCTION
    NEXT
END FUNCTION

' Area de aco (cm2/m) da posicao k de uma laje: 1 asx, 2 asy, 3..6 as1..as4.
FUNCTION LajAs# (i AS INTEGER, k AS INTEGER)
    SELECT CASE k
        CASE 1: LajAs# = Laj(i).asx
        CASE 2: LajAs# = Laj(i).asy
        CASE 3: LajAs# = Laj(i).as1
        CASE 4: LajAs# = Laj(i).as2
        CASE 5: LajAs# = Laj(i).as3
        CASE ELSE: LajAs# = Laj(i).as4
    END SELECT
END FUNCTION

' Momento negativo (tf.m/m) do bordo b (1..4): x1..x4.
FUNCTION LajMom# (i AS INTEGER, b AS INTEGER)
    SELECT CASE b
        CASE 1: LajMom# = Laj(i).x1
        CASE 2: LajMom# = Laj(i).x2
        CASE 3: LajMom# = Laj(i).x3
        CASE ELSE: LajMom# = Laj(i).x4
    END SELECT
END FUNCTION

' Maior momento negativo (usaAs = 0) ou maior area negativa (usaAs = -1) dos bordos.
FUNCTION LajNegMax# (i AS INTEGER, usaAs AS INTEGER)
    DIM b AS INTEGER, v AS DOUBLE, best AS DOUBLE
    best = 0
    FOR b = 1 TO 4
        IF usaAs THEN v = LajAs#(i, 2 + b) ELSE v = LajMom#(i, b)
        IF v > best THEN best = v
    NEXT
    LajNegMax# = best
END FUNCTION

' Menor vao da laje (m). Usado no comprimento das negativas e na ancoragem do desenho.
FUNCTION LajMenor# (i AS INTEGER)
    IF Laj(i).lx < Laj(i).ly THEN LajMenor# = Laj(i).lx ELSE LajMenor# = Laj(i).ly
END FUNCTION

' Coordenada no papel (mm) de uma distancia em m, no 1:50 com origem em PROC_ORIGEM.
FUNCTION PapelX# (m AS DOUBLE)
    PapelX# = PROC_ORIGEM + m * PROC_MM_M
END FUNCTION

FUNCTION PapelY# (m AS DOUBLE)
    PapelY# = PROC_ORIGEM + m * PROC_MM_M
END FUNCTION

' Indice 1..9 da bitola phi (mm) na tabela de CcaBitola#; 0 se nao existe.
FUNCTION BitolaIndice% (phi AS DOUBLE)
    DIM i AS INTEGER
    BitolaIndice% = 0
    FOR i = 1 TO 9
        IF ABS(CcaBitola#(i) - phi) < 0.01 THEN BitolaIndice% = i: EXIT FUNCTION
    NEXT
END FUNCTION

' Verdadeiro se alguma negativa com area necessaria nao cabe na barra imposta:
' CcaAreaBarra#(phi) * 100 / s < As (cm2/m). Mesma regra de tela "Armadura Negativa
' IMPOSTA menor que a NECESSARIA".
FUNCTION NegativaInsuficiente% (i AS INTEGER, phi AS DOUBLE, s AS DOUBLE)
    DIM b AS INTEGER
    NegativaInsuficiente% = 0
    FOR b = 3 TO 6
        IF LajAs#(i, b) > 0 THEN
            IF CcaAreaBarra#(phi) * 100 / s < LajAs#(i, b) THEN NegativaInsuficiente% = -1
        END IF
    NEXT
END FUNCTION

' Escolha automatica (E): bitola e espacamento de todas as lajes com resultado.
SUB ItemEscolha
    CLS
    TelaCabecalho "Escolha automatica das Armaduras para as Lajes"
    IF Pergunta$(7, "Escolhe automaticamente Armadura para Todas as Lajes N/*S* ", 1, "S") <> "S" THEN EXIT SUB
    LOCATE 9, 3: PRINT "Aguarde ...!"
    EscolheAuto
    ArlGrava
    Espera "", 0
END SUB

' Escolha automatica de todas as lajes com resultado, marcada como escolha feita.
SUB EscolheAuto
    DIM i AS INTEGER
    FOR i = 1 TO LajQtd
        IF Laj(i).temRes = -1 THEN EscolheLaje i: ArmTem(i) = -1
    NEXT
END SUB

' Preenche ArmPhi/ArmS da laje i pela regra de CcaEscolheMalha (nao marca ArmTem).
SUB EscolheLaje (i AS INTEGER)
    DIM k AS INTEGER
    FOR k = 1 TO PROC_POS
        ArmEscolhe i, k, LajAs#(i, k)
    NEXT
END SUB

' Aplica a escolha automatica as lajes ini..fim com resultado e sem escolha feita.
' Devolve quantas lajes estavam sem escolha. aplica = 0 so conta, sem alterar nada.
FUNCTION CompletaEscolha% (ini AS INTEGER, fim AS INTEGER, aplica AS INTEGER)
    DIM i AS INTEGER, n AS INTEGER
    FOR i = ini TO fim
        IF Laj(i).temRes = -1 AND ArmTem(i) = 0 THEN
            n = n + 1
            IF aplica THEN EscolheLaje i
        END IF
    NEXT
    CompletaEscolha% = n
END FUNCTION

' Bitola e espacamento para a area asm (cm2/m) na posicao k. asm <= 0 zera a posicao.
' Se CcaEscolheMalha nao acha solucao, phi sai 0 e a posicao fica sem armadura.
SUB ArmEscolhe (i AS INTEGER, k AS INTEGER, asm AS DOUBLE)
    DIM phi AS DOUBLE, s AS DOUBLE
    IF asm <= 0 THEN
        ArmPhi(i, k) = 0: ArmS(i, k) = 0
        EXIT SUB
    END IF
    CcaEscolheMalha asm, PROC_PHI_MIN, PROC_S_MIN, PROC_S_MAX, phi, s
    ArmPhi(i, k) = phi: ArmS(i, k) = s
END SUB

' Modificacao (M): pede o numero da laje ate FIM. Cada laje abre na ArmTela.
SUB ItemModifica
    DIM txt AS STRING, n AS INTEGER
    DO
        CLS
        TelaCabecalho "Modificacao das Armaduras para as Lajes"
        txt = Pergunta$(6, "Numero da Laje que sera Alterada/Imposta Armadura *FIM* ", 4, "")
        IF txt = "FIM" OR txt = "" THEN EXIT DO
        n = VAL(txt)
        IF n < 1 OR n > LajQtd THEN
            Espera "verifique a consistencia dos seus dados", -1
        ELSEIF Laj(n).temRes <> -1 THEN
            Espera "Lajes sem calculo, execute o Dimensionamento", -1
        ELSE
            ArmTela n
        END IF
    LOOP
END SUB

' Tela de uma laje: momentos e As calculados, e armaduras impostas (bitola e
' espacamento). Grava so com confirmacao e com a negativa atendendo a necessaria.
' H (espessura) e so mostrado: alterar H exigiria recalculo (lacuna).
SUB ArmTela (i AS INTEGER)
    DIM phiIn(1 TO 3) AS DOUBLE, spIn(1 TO 3) AS DOUBLE, k AS INTEGER
    ' Sem escolha feita, os campos abrem com a proposta automatica (a mesma do E).
    IF ArmTem(i) = 0 THEN EscolheLaje i
    FOR k = 1 TO 2
        phiIn(k) = ArmPhi(i, k): spIn(k) = ArmS(i, k)
    NEXT
    ' RECONSTRUCAO: a negativa mostrada e a do primeiro bordo com armadura (o bordo 1
    ' pode ser zero, e o campo abria 0 / 0).
    phiIn(3) = 0: spIn(3) = 0
    FOR k = 3 TO PROC_POS
        IF LajAs#(i, k) > 0 AND phiIn(3) = 0 THEN phiIn(3) = ArmPhi(i, k): spIn(3) = ArmS(i, k)
    NEXT
    DO
        CLS
        TelaCabecalho "Modificacao das Armaduras para as Lajes"
        LOCATE 6, 3: PRINT "Laje "; i; "   H ="; FormataNumero$(Laj(i).h, 1, 6); " cm"
        LOCATE 8, 3: PRINT "Momento Positivo PINCIPAL"
        LOCATE 9, 3: PRINT "M ="; FormataNumero$(Laj(i).mx, 2, 9); "        As ="; FormataNumero$(LajAs#(i, 1), 2, 7); " cm2"
        LOCATE 10, 3: PRINT "Momento Positivo SECUNDARIO("
        LOCATE 11, 3: PRINT "M ="; FormataNumero$(Laj(i).my, 2, 9); "        As ="; FormataNumero$(LajAs#(i, 2), 2, 7); " cm2"
        LOCATE 12, 3: PRINT "Momento Negativo"                ' RECONSTRUCAO: mostra o maior dos bordos
        LOCATE 13, 3: PRINT "M ="; FormataNumero$(LajNegMax#(i, 0), 2, 9); "        As ="; FormataNumero$(LajNegMax#(i, -1), 2, 7); " cm2"
        ArmPede 15, "Armadura Positiva PRINCIPAL", phiIn(1), spIn(1)
        ArmPede 17, "Armadura Positiva SECUNDARIA", phiIn(2), spIn(2)
        ArmPede 19, "Armadura Negativa", phiIn(3), spIn(3)
        IF BitolaIndice%(phiIn(1)) = 0 OR BitolaIndice%(phiIn(2)) = 0 OR BitolaIndice%(phiIn(3)) = 0 OR spIn(1) <= 0 OR spIn(2) <= 0 OR spIn(3) <= 0 THEN
            Espera "verifique a consistencia dos seus dados", -1
        ELSEIF NegativaInsuficiente%(i, phiIn(3), spIn(3)) THEN
            Espera "Armadura Negativa IMPOSTA menor que a NECESSARIA", -1
        ELSEIF Pergunta$(22, "Alteracao Correta  N/*S* ", 1, "S") = "S" THEN
            FOR k = 1 TO 2
                ArmPhi(i, k) = phiIn(k): ArmS(i, k) = spIn(k)
            NEXT
            FOR k = 3 TO PROC_POS
                IF LajAs#(i, k) > 0 THEN
                    ArmPhi(i, k) = phiIn(3): ArmS(i, k) = spIn(3)
                ELSE
                    ArmPhi(i, k) = 0: ArmS(i, k) = 0
                END IF
            NEXT
            ArmTem(i) = -1
            ArlGrava
            EXIT DO
        END IF
    LOOP
END SUB

' Pede bitola e espacamento de uma armadura (duas linhas: titulo e campos).
' Os campos vem com phi e s atuais e voltam com os valores digitados.
SUB ArmPede (lin AS INTEGER, titulo AS STRING, phi AS DOUBLE, s AS DOUBLE)
    LOCATE lin, 3: PRINT titulo
    LOCATE lin + 1, 3: PRINT "Bitola  *";
    phi = EntradaNumero#(lin + 1, 15, 6, phi)
    LOCATE lin + 1, 28: PRINT "Espacamento  *";
    s = EntradaNumero#(lin + 1, 42, 6, s)
END SUB

' Desenho (P e N): grava o .VET do desenho (nome em ArqDesenho$) e mostra a previa.
' tipoPadrao 1 = positiva, 2 = negativa, e e o default da pergunta de tipo (1 a 4).
' Lajes sem escolha feita usam a escolha automatica (aviso antes da confirmacao).
SUB ItemDesenha (tipoPadrao AS INTEGER)
    DIM modo AS STRING, txt AS STRING, tipo AS INTEGER, i AS INTEGER, ini AS INTEGER, fim AS INTEGER
    DIM f AS INTEGER, arq AS STRING, titulo AS STRING, n AS INTEGER, passo AS DOUBLE, uma AS INTEGER
    CLS
    IF tipoPadrao = 1 THEN
        TelaCabecalho "Armaduras Positivas nas Lajes"
    ELSE
        TelaCabecalho "Armaduras Negativas nas Lajes"
    END IF
    modo = Pergunta$(6, "Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada ", 1, "T")
    ini = 1: fim = LajQtd
    IF modo = "I" THEN
        LOCATE 8, 3: PRINT "Numero das Lajes que serao mostradas as Armaduras"
        txt = Pergunta$(9, "I/J/N a M/.../K  *TODAS* ", 6, "TODAS")
        IF txt <> "TODAS" THEN
            ini = VAL(txt): fim = ini: uma = ini
        END IF
        IF ini < 1 OR fim > LajQtd THEN
            Espera "verifique a consistencia dos seus dados", -1
            EXIT SUB
        END IF
    END IF
    LOCATE 11, 1: PRINT "<1> So Positiva   <2> So Negativa   <*3*> Ambas Juntas   <4> Ambas Isoladas"
    tipo = VAL(Pergunta$(12, "Tipo ", 1, LTRIM$(STR$(tipoPadrao))))
    IF tipo < 1 OR tipo > 4 THEN
        Espera "verifique a consistencia dos seus dados", -1
        EXIT SUB
    END IF
    arq = ArqDesenho$(tipo, uma)
    LOCATE 16, 3: PRINT "Desenho em "; DirCurto$(arq, 66)
    n = CompletaEscolha%(ini, fim, 0)
    IF n > 0 THEN
        COLOR COR_DESTAQUE
        LOCATE 17, 3: PRINT "Sem escolha de armaduras em"; n; "laje(s): usada a escolha automatica"
        COLOR COR_TEXTO
    END IF
    IF Pergunta$(14, "Dados Corretos N/*S* ", 1, "S") <> "S" THEN EXIT SUB
    n = CompletaEscolha%(ini, fim, -1)
    ' Titulos do desenho [ev: 0x012f14, 0x012f2c, 0x012f44]
    SELECT CASE tipo
        CASE 1: titulo = "ARMADURAS POSITIVAS"
        CASE 2: titulo = "ARMADURAS NEGATIVAS"
        CASE ELSE: titulo = "ARMADURAS POSITIVAS E NEGATIVAS"
    END SELECT
    f = VetAbre%(arq, titulo + " - OBRA " + LajObra)
    FOR i = ini TO fim
        IF Laj(i).temRes = -1 THEN DesenhaLaje f, i, tipo
    NEXT
    ' Rotulos depois de todas as barras: na previa o texto tem fundo e fica por cima
    ' da malha, inclusive das negativas que a laje vizinha estende para dentro desta.
    passo = RotuloPasso#(ini, fim, tipo)
    FOR i = ini TO fim
        IF Laj(i).temRes = -1 THEN RotulosLaje f, i, tipo, passo
    NEXT
    VetFecha f
    IF VetMostra%(arq) = -1 THEN Espera "erro no processamento", -1
    SCREEN 0
END SUB

' Desenha uma laje: contorno (pena 1), armadura positiva (pena 2 e 3) e negativa (pena 2).
' tipo: 1 so positiva, 2 so negativa, 3 e 4 ambas. RECONSTRUCAO: 4 (ambas isoladas)
' desenha igual a 3; a separacao em isoladas nao tem evidencia no EXE.
SUB DesenhaLaje (f AS INTEGER, i AS INTEGER, tipo AS INTEGER)
    DIM k AS INTEGER
    VetRetangulo f, PapelX#(Laj(i).x0), PapelY#(Laj(i).y0), PapelX#(Laj(i).x0 + Laj(i).lx), PapelY#(Laj(i).y0 + Laj(i).ly), 1
    IF tipo <> 2 THEN
        BarrasPos f, i, 1
        BarrasPos f, i, 2
    END IF
    IF tipo <> 1 THEN
        FOR k = 3 TO PROC_POS
            BarrasNeg f, i, k
        NEXT
    END IF
END SUB

' Armadura positiva k (1 principal, 2 secundaria). Principal: barras paralelas a X,
' quantidade ly/s + 1. Secundaria: paralelas a Y, quantidade lx/s + 1.
SUB BarrasPos (f AS INTEGER, i AS INTEGER, k AS INTEGER)
    DIM j AS INTEGER, n AS INTEGER, pena AS INTEGER, p AS DOUBLE, s AS DOUBLE
    IF ArmPhi(i, k) <= 0 THEN EXIT SUB
    s = ArmS(i, k)
    IF k = 1 THEN
        n = INT(Laj(i).ly * 100 / s) + 1: pena = 2
        FOR j = 0 TO n - 1
            p = Laj(i).y0 + j * s / 100
            VetLinha f, PapelX#(Laj(i).x0), PapelY#(p), PapelX#(Laj(i).x0 + Laj(i).lx), PapelY#(p), pena
        NEXT
    ELSE
        n = INT(Laj(i).lx * 100 / s) + 1: pena = 3
        FOR j = 0 TO n - 1
            p = Laj(i).x0 + j * s / 100
            VetLinha f, PapelX#(p), PapelY#(Laj(i).y0), PapelX#(p), PapelY#(Laj(i).y0 + Laj(i).ly), pena
        NEXT
    END IF
END SUB

' Armadura negativa do bordo b = k - 2 (1 esquerdo, 2 inferior, 3 direito, 4 superior).
' Barras perpendiculares ao bordo, atravessando-o com 0,25 * lmenor para cada lado.
' RECONSTRUCAO: a regra de quantidade (comprimento do bordo / s + 1) e inferida.
SUB BarrasNeg (f AS INTEGER, i AS INTEGER, k AS INTEGER)
    DIM b AS INTEGER, j AS INTEGER, n AS INTEGER, s AS DOUBLE, c AS DOUBLE, p AS DOUBLE, ext AS DOUBLE
    IF ArmPhi(i, k) <= 0 THEN EXIT SUB
    b = k - 2: s = ArmS(i, k)
    ext = 0.25 * LajMenor#(i) * PROC_MM_M
    IF b = 2 OR b = 4 THEN
        n = INT(Laj(i).lx * 100 / s) + 1
        IF b = 2 THEN c = PapelY#(Laj(i).y0) ELSE c = PapelY#(Laj(i).y0 + Laj(i).ly)
        FOR j = 0 TO n - 1
            p = PapelX#(Laj(i).x0 + j * s / 100)
            VetLinha f, p, c - ext, p, c + ext, 2
        NEXT
    ELSE
        n = INT(Laj(i).ly * 100 / s) + 1
        IF b = 1 THEN c = PapelX#(Laj(i).x0) ELSE c = PapelX#(Laj(i).x0 + Laj(i).lx)
        FOR j = 0 TO n - 1
            p = PapelY#(Laj(i).y0 + j * s / 100)
            VetLinha f, c - ext, p, c + ext, p, 2
        NEXT
    END IF
END SUB

' Rotulos de uma laje (pena 3), empilhados do canto superior esquerdo para baixo:
' "Laje i" e uma linha por posicao desenhada ("N<k> phi<mm> c/<cm>").
SUB RotulosLaje (f AS INTEGER, i AS INTEGER, tipo AS INTEGER, passo AS DOUBLE)
    DIM k AS INTEGER, x AS DOUBLE, y AS DOUBLE
    x = PapelX#(Laj(i).x0) + 2
    y = PapelY#(Laj(i).y0 + Laj(i).ly) - passo
    VetTexto f, x, y, 3, 0, 3, "Laje " + LTRIM$(STR$(i))
    FOR k = 1 TO PROC_POS
        IF ArmPhi(i, k) > 0 AND ((k <= 2 AND tipo <> 2) OR (k > 2 AND tipo <> 1)) THEN
            y = y - passo
            VetTexto f, x, y, 2.5, 0, 3, "N" + LTRIM$(STR$(k)) + " phi" + LTRIM$(STR$(ArmPhi(i, k))) + " c/" + LTRIM$(STR$(ArmS(i, k)))
        END IF
    NEXT
END SUB

' Distancia (mm no papel) entre linhas de rotulo. No papel bastam 4 mm (texto de
' 2,5 a 3 mm), mas a previa (VetMostra%, SISPLOT.BM) ignora a altura e escreve
' com a fonte fixa de 16 pixels na escala que encaixa o desenho em 620 x 440.
' O passo e o maior entre 4 mm e 18 pixels nessa escala, para as linhas nao se
' cobrirem na tela.
FUNCTION RotuloPasso# (ini AS INTEGER, fim AS INTEGER, tipo AS INTEGER)
    DIM i AS INTEGER, ext AS DOUBLE, esc AS DOUBLE, p AS DOUBLE
    DIM xmin AS DOUBLE, ymin AS DOUBLE, xmax AS DOUBLE, ymax AS DOUBLE
    xmin = 1E+30: ymin = 1E+30: xmax = -1E+30: ymax = -1E+30
    FOR i = ini TO fim
        IF Laj(i).temRes = -1 THEN
            ext = 0
            IF tipo <> 1 THEN ext = 0.25 * LajMenor#(i) * PROC_MM_M
            IF PapelX#(Laj(i).x0) - ext < xmin THEN xmin = PapelX#(Laj(i).x0) - ext
            IF PapelY#(Laj(i).y0) - ext < ymin THEN ymin = PapelY#(Laj(i).y0) - ext
            IF PapelX#(Laj(i).x0 + Laj(i).lx) + ext > xmax THEN xmax = PapelX#(Laj(i).x0 + Laj(i).lx) + ext
            IF PapelY#(Laj(i).y0 + Laj(i).ly) + ext > ymax THEN ymax = PapelY#(Laj(i).y0 + Laj(i).ly) + ext
        END IF
    NEXT
    p = 4
    IF xmax > xmin AND ymax > ymin THEN
        esc = 620# / (xmax - xmin)
        IF 440# / (ymax - ymin) < esc THEN esc = 440# / (ymax - ymin)
        IF 18 / esc > p THEN p = 18 / esc
    END IF
    RotuloPasso# = p
END FUNCTION

' Nome do .VET de um desenho: <obra>_ARM<tipo>[_L<n>].VET, com tipo P (so positiva),
' N (so negativa), PN (ambas juntas) ou PNI (ambas isoladas), e _L<n> quando uma
' laje so foi pedida no modo I (uma = numero dela; 0 = todas). Cada desenho tem o
' seu arquivo e repetir o mesmo desenho regrava so ele.
' RECONSTRUCAO: o EXE nao tem nome de arquivo (LAJEPROC.md, Lacunas 2).
FUNCTION ArqDesenho$ (tipo AS INTEGER, uma AS INTEGER)
    DIM s AS STRING
    SELECT CASE tipo
        CASE 1: s = "P"
        CASE 2: s = "N"
        CASE 3: s = "PN"
        CASE ELSE: s = "PNI"
    END SELECT
    IF uma > 0 THEN s = s + "_L" + LTRIM$(STR$(uma))
    ArqDesenho$ = DirDados + LajObra + "_ARM" + s + ".VET"
END FUNCTION

' Impressao (I): grava <obra>_LAJEPROC.LST com um ferro por linha e o resumo por bitola.
' Lajes sem escolha feita usam a escolha automatica, com aviso na tela e no relatorio.
SUB ItemImprime
    DIM arq AS STRING, f AS INTEGER, i AS INTEGER, k AS INTEGER, ix AS INTEGER, tot AS DOUBLE, n AS INTEGER
    CLS
    TelaCabecalho "Impressao do Desenho das Armaduras dispostas nas Lajes"
    n = CompletaEscolha%(1, LajQtd, -1)
    IF n > 0 THEN
        COLOR COR_DESTAQUE
        LOCATE 7, 3: PRINT "Sem escolha de armaduras em"; n; "laje(s): usada a escolha automatica"
        COLOR COR_TEXTO
    END IF
    FOR ix = 1 TO 9
        ResPeso(ix) = 0: ResComp(ix) = 0
    NEXT
    arq = DirDados + LajObra + "_LAJEPROC.LST"
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    PRINT #f, "LAJEPROC - Armaduras das lajes - Obra: "; LajObra
    PRINT #f, ""
    PRINT #f, "Laje  Posicao        Bitola(mm)  Quantidade  Comp.unit.(cm)  Comp.total(m)  Peso(kg)"
    FOR i = 1 TO LajQtd
        IF Laj(i).temRes = -1 THEN
            FOR k = 1 TO PROC_POS
                ImprimeLinha f, i, k
            NEXT
        END IF
    NEXT
    PRINT #f, ""
    PRINT #f, "Resumo por bitola"
    tot = 0
    FOR ix = 1 TO 9
        IF ResComp(ix) > 0 THEN
            PRINT #f, "phi "; FormataNumero$(CcaBitola#(ix), 1, 5); "  comprimento "; FormataNumero$(ResComp(ix), 2, 10); " m  peso "; FormataNumero$(ResPeso(ix), 2, 10); " kg"
            tot = tot + ResPeso(ix)
        END IF
    NEXT
    PRINT #f, "Peso total: "; FormataNumero$(tot, 2, 10); " kg"
    IF n > 0 THEN
        PRINT #f, ""
        PRINT #f, "Obs.: escolha automatica (sem escolha previa em E/M) nas lajes:";
        FOR i = 1 TO LajQtd
            IF Laj(i).temRes = -1 AND ArmTem(i) = 0 THEN PRINT #f, i;
        NEXT
        PRINT #f, ""
    END IF
    CLOSE #f
    Espera "Relatorio gravado: " + arq, 0
END SUB

' Uma linha do relatorio (posicao k da laje i). Soma o comprimento e o peso na bitola.
' Comprimento positivo: vao + 2 * 10 phi (phi = 1 cm por 10 mm, ancoragem em cm).
' Comprimento negativo: 2 * 0,25 * lmenor (m -> cm) + 2 * (h - 2) cm.
SUB ImprimeLinha (f AS INTEGER, i AS INTEGER, k AS INTEGER)
    DIM phi AS DOUBLE, s AS DOUBLE, qtd AS DOUBLE, comp AS DOUBLE, tot AS DOUBLE, peso AS DOUBLE
    DIM b AS INTEGER, Lb AS DOUBLE, nome AS STRING, ix AS INTEGER
    phi = ArmPhi(i, k): s = ArmS(i, k)
    IF phi <= 0 OR s <= 0 THEN EXIT SUB
    SELECT CASE k
        CASE 1
            qtd = INT(Laj(i).ly * 100 / s) + 1
            comp = Laj(i).lx * 100 + 2 * phi
            nome = "Pos.principal"
        CASE 2
            qtd = INT(Laj(i).lx * 100 / s) + 1
            comp = Laj(i).ly * 100 + 2 * phi
            nome = "Pos.secundaria"
        CASE ELSE
            b = k - 2
            ' RECONSTRUCAO: bordos 1 e 3 (esquerdo/direito) tem comprimento ly, como em BarrasNeg.
            IF b = 1 OR b = 3 THEN Lb = Laj(i).ly ELSE Lb = Laj(i).lx
            qtd = INT(Lb * 100 / s) + 1
            comp = 50 * LajMenor#(i) + 2 * (Laj(i).h - 2)
            nome = "Negativa bd" + LTRIM$(STR$(b))
    END SELECT
    tot = qtd * comp / 100
    peso = tot * PROC_PESO * phi * phi / 100
    ix = BitolaIndice%(phi)
    IF ix > 0 THEN
        ResComp(ix) = ResComp(ix) + tot
        ResPeso(ix) = ResPeso(ix) + peso
    END IF
    PRINT #f, FormataNumero$(i, 0, 4); "  "; nome; "  "; FormataNumero$(phi, 1, 6); "  "; FormataNumero$(qtd, 0, 10); "  "; FormataNumero$(comp, 1, 14); "  "; FormataNumero$(tot, 2, 13); "  "; FormataNumero$(peso, 2, 9)
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISPLOT.BM'
