' ====================================================================
'  VPLOTA.BAS - plotagem de vigas continuas editadas (SISTRUT 4.0)
'
'  Monta as vigas (.VET) em folhas, grava <obra>.AVF, gera os
'  <obra>_F<n>.VET (contorno da folha, pena 5), .DXF e .PLT.
'  Parametros da folha em VPLOTA.INI; equipamento lido de PLOTER.INI.
' ====================================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

DECLARE FUNCTION VetAbre% (arq AS STRING, titulo AS STRING)
DECLARE SUB VetLinha (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetRetangulo (f AS INTEGER, x1 AS DOUBLE, y1 AS DOUBLE, x2 AS DOUBLE, y2 AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetTexto (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, altura AS DOUBLE, angulo AS DOUBLE, pena AS INTEGER, texto AS STRING)
DECLARE SUB VetCirculo (f AS INTEGER, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE, pena AS INTEGER)
DECLARE SUB VetFecha (f AS INTEGER)
DECLARE SUB VetLimites (x AS DOUBLE, y AS DOUBLE, xmin AS DOUBLE, ymin AS DOUBLE, xmax AS DOUBLE, ymax AS DOUBLE)
DECLARE FUNCTION VetParaHpgl% (arqVet AS STRING, arqPlt AS STRING)
DECLARE FUNCTION VetParaDxf% (arqVet AS STRING, arqDxf AS STRING)
DECLARE FUNCTION VetMostra% (arqVet AS STRING)

DECLARE FUNCTION ParmValor$ (n AS INTEGER)
DECLARE FUNCTION ParmNum# (n AS INTEGER)
DECLARE FUNCTION ParmDir$ (n AS INTEGER)
DECLARE SUB ParmTela ()
DECLARE FUNCTION Confirma% (txt AS STRING)
DECLARE SUB Espera ()
DECLARE SUB Mensagem (txt AS STRING)
DECLARE FUNCTION EFolha% (nome AS STRING, o AS STRING)
DECLARE FUNCTION ListaVet% (d AS STRING, o AS STRING)
DECLARE SUB SelecionaVets ()
DECLARE SUB ParseOrdem (txt AS STRING)
DECLARE SUB VetCaixa (arqV AS STRING, xi AS DOUBLE, yi AS DOUBLE, xa AS DOUBLE, ya AS DOUBLE)
DECLARE FUNCTION CampoVet$ (ln AS STRING, k AS INTEGER, resto AS INTEGER)
DECLARE SUB Arranja ()
DECLARE SUB CopiaVet (arq AS STRING, f AS INTEGER, dx AS DOUBLE, dy AS DOUBLE)
DECLARE SUB MarcaPenas (arq AS STRING)
DECLARE SUB AvisaPenas ()
DECLARE FUNCTION NomeFolha$ (n AS INTEGER)
DECLARE SUB GeraFolhas ()
DECLARE SUB GravaAvf ()
DECLARE SUB LeAvf ()
DECLARE FUNCTION ResultadoMenu$ ()
DECLARE SUB Apresenta (arranjar AS INTEGER)
DECLARE SUB MontaFluxo ()
DECLARE SUB RecuperaFluxo ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB ListaEquipamentos ()
DECLARE FUNCTION EscolheEquip% ()
DECLARE SUB GeraDxf ()
DECLARE SUB GeraPlt ()
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ResumoGeral ()
DECLARE SUB ResumoFolha (n AS INTEGER)
DECLARE SUB AcoDaViga (v AS INTEGER, c() AS DOUBLE, p() AS DOUBLE)
DECLARE FUNCTION VigDaEntrada% (arq AS STRING)
DECLARE FUNCTION DcTabelaAco# (compr() AS DOUBLE, peso() AS DOUBLE)
DECLARE FUNCTION DcPesoMetro# (phi AS DOUBLE)
DECLARE FUNCTION CcaBitola# (i AS INTEGER)

' Estado compartilhado entre as rotinas de montagem.
' VN$ = vigas (.VET) selecionadas; PFOL%/PARQ$/PDX#/PDY# = arranjo (folha, arquivo, deslocamento).
DIM SHARED Obra$, DirDados$, DirVet$, DirDxf$, DirPlt$, Equip$, EqModo$
DIM SHARED VQ%, EQQ%, PQ%, PFN%, Excl%, ORDQ%, EqPenas%
DIM SHARED VN$(1 TO 300), VXI#(1 TO 300), VYI#(1 TO 300), VXA#(1 TO 300), VYA#(1 TO 300)
DIM SHARED PFOL%(1 TO 1000), PARQ$(1 TO 1000), PDX#(1 TO 1000), PDY#(1 TO 1000)
DIM SHARED ORD%(1 TO 300), EQ$(1 TO 200), EQM$(1 TO 200), EQP%(1 TO 200), PenaUsada%(1 TO 9)

' ---------------------------------------------------------------- principal
ComumDirExecDefine _CWD$
IF ArqLer%("VPLOTA.INI") < 0 THEN
    TelaErro "ERRO NO ARQUIVO PARAMETRIZACAO "
    TelaStatus "Acione ESC <Enter> para Continuar "
    DO
        k$ = TeclaLer$
    LOOP UNTIL k$ = CHR$(13) OR k$ = CHR$(27)
    SYSTEM
END IF
DirDados$ = IniDirDados$

DO
    MenuPrincipal
    k$ = TeclaLer$
    SELECT CASE k$
        CASE "1", "2"
            MontaFluxo
        CASE "3"
            RecuperaFluxo
        CASE CHR$(27), CHR$(0) + CHR$(60)
            EXIT DO
    END SELECT
LOOP

CLS
PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
SYSTEM

' Menu inicial. Opcao 2 usa <obra>_*.VET (SISPLOT.BM: todo modulo grava .VET).
' RECONSTRUCAO: o dump corta a extensao em "Arquivo ." e "em ." nas linhas de menu.
SUB MenuPrincipal
    CLS
    TelaMoldura 2, 4, 22, 76
    TelaItemMenu 4, 10, "PLOTAGEM DE VIGAS CONTINUAS EDITADAS"
    TelaItemMenu 5, 10, "OpenStrut                              "
    TelaItemMenu 6, 10, "Abril 1991   (omitido)                 "
    TelaItemMenu 7, 10, "Versao 4.0"
    TelaItemMenu 9, 6, "1  -  Montagem de Folha a partir de Arquivo ."
    TelaItemMenu 10, 6, "      Arquivos Publicos padrao CAD gerados pelo Modulo Desenho-"
    TelaItemMenu 11, 6, "2  -  Montagem de Folha a partir de Arquivo ."
    TelaItemMenu 12, 6, "      Arquivos Editados gerados pelo Modulo Desenho"
    TelaItemMenu 13, 6, "3  -  Recuperacao de Folhas previamente salvas em ."
    TelaItemMenu 14, 6, "      Arquivos contendo o Arranjo das Vigas nas Folhas"
    TelaItemMenu 17, 10, " <F2> = Fim "
    TelaStatus "escolha opcao "
END SUB

' ---------------------------------------------------------- parametros
' Valor (antes do =) da linha n de VPLOTA.INI, sem espacos.
FUNCTION ParmValor$ (n AS INTEGER)
    IF ArqLer%("VPLOTA.INI") < 0 THEN
        ParmValor$ = ""
    ELSE
        ParmValor$ = LTRIM$(RTRIM$(IniValor$(n)))
    END IF
END FUNCTION

' Valor numerico da linha n de VPLOTA.INI.
FUNCTION ParmNum# (n AS INTEGER)
    ParmNum# = VAL(ParmValor$(n))
END FUNCTION

' Diretorio da linha n de VPLOTA.INI; cai na pasta de trabalho se nao existir.
FUNCTION ParmDir$ (n AS INTEGER)
    ParmDir$ = DirUtilizavel$(ParmValor$(n))
END FUNCTION

' Tela de parametros da folha: grupo "Area de Plotagem e Bordas" (linhas 3 a 9
' do VPLOTA.INI: largura, altura, margens, carimbo e escala) e a distancia entre
' desenhos (linha 12). Rotulos e titulos vem dos textos do original.
' RECONSTRUCAO: linhas e colunas da tela (o dump nao traz o layout).
' Enter mantem o valor; grava o arquivo ao final.
SUB ParmTela
    DIM campo(1 TO 8) AS INTEGER, novo(1 TO 8) AS STRING
    DIM linha(1 TO 8) AS INTEGER, rotulo(1 TO 8) AS STRING
    DIM k AS INTEGER, n AS INTEGER, v AS DOUBLE
    campo(1) = 3: campo(2) = 4: campo(3) = 5: campo(4) = 6
    campo(5) = 7: campo(6) = 8: campo(7) = 9: campo(8) = 12
    rotulo(1) = "   largura da folha": rotulo(2) = "   altura da folha"
    rotulo(3) = "   margem esquerda": rotulo(4) = "   outras margens"
    rotulo(5) = "   largura do carimbo": rotulo(6) = "   altura do carimbo"
    rotulo(7) = "   escala do desenho 1/"
    rotulo(8) = "   distancia de separacao entre desenhos"
    FOR k = 1 TO 7: linha(k) = 4 + k: NEXT
    linha(8) = 14
    CLS
    TelaMoldura 2, 2, 22, 78
    TelaItemMenu 3, 4, "OpenStrut                                   parametrizacao-VPLOTA"
    TelaItemMenu 4, 4, " - Area de Plotagem e Bordas"
    TelaItemMenu 13, 4, " - Posicionamento e Caracteristicas do Desenho"
    TelaStatus "Acione <Enter> para manter   ou   <ESC> <Enter> para Retornar"
    FOR k = 1 TO 8
        n = campo(k)
        TelaItemMenu linha(k), 4, rotulo(k)
        IF n <> 9 THEN TelaItemMenu linha(k), 71, "mm"
        v = EntradaNumero#(linha(k), 60, 10, ParmNum#(n))
        novo(k) = LTRIM$(STR$(v))
    NEXT
    IF ArqLer%("VPLOTA.INI") >= 0 THEN
        FOR k = 1 TO 8
            IniDefinir campo(k), novo(k)
        NEXT
        CALL ArqGravar("VPLOTA.INI")
    END IF
END SUB

' ------------------------------------------------------------- telas
' Pergunta S/N. Devolve -1 para S.
FUNCTION Confirma% (txt AS STRING)
    TelaStatus txt
    Confirma% = (UCASE$(TeclaLer$) = "S")
END FUNCTION

' Espera Enter para seguir.
SUB Espera
    TelaStatus "Acione <Enter> para continuar "
    DO
    LOOP UNTIL TeclaLer$ = CHR$(13)
END SUB

' Linha de mensagem de processo (fica abaixo da tela atual).
SUB Mensagem (txt AS STRING)
    PRINT txt
END SUB

' ------------------------------------------------ selecao de .VET
' Folha gerada pelo VPLOTA: "<obra>_F<digitos>.VET". Devolve -1 se o nome for uma folha.
' "<obra>_FORMA.VET" nao e folha (depois de _F ha letras).
FUNCTION EFolha% (nome AS STRING, o AS STRING)
    DIM miolo AS STRING, i AS INTEGER
    EFolha% = 0
    IF UCASE$(MID$(nome, LEN(o) + 1, 2)) <> "_F" THEN EXIT FUNCTION
    miolo = MID$(nome, LEN(o) + 3)
    IF LEN(miolo) <= 4 THEN EXIT FUNCTION
    miolo = LEFT$(miolo, LEN(miolo) - 4)
    EFolha% = -1
    FOR i = 1 TO LEN(miolo)
        IF MID$(miolo, i, 1) < "0" OR MID$(miolo, i, 1) > "9" THEN EFolha% = 0
    NEXT
END FUNCTION

' Lista <obra>_*.VET do diretorio d$ com _FILES$ (sem SHELL: o nome da obra
' nao chega ao interpretador de comandos). Ignora as folhas geradas
' (EFolha%) e subdiretorios (nome termina em "\"). Devolve a quantidade e preenche VN$.
FUNCTION ListaVet% (d AS STRING, o AS STRING)
    DIM nome AS STRING
    VQ% = 0
    nome = _FILES$(d + o + "_*.VET")
    DO WHILE nome <> ""
        IF RIGHT$(nome, 1) <> "\" AND VQ% < 300 THEN
            IF EFolha%(nome, o) = 0 THEN
                VQ% = VQ% + 1
                VN$(VQ%) = nome
            END IF
        END IF
        nome = _FILES$
    LOOP
    ListaVet% = VQ%
END FUNCTION

' Mostra os desenhos encontrados e pede a ordem de preferencia (ex.: 3,1,2).
' Vazio = todas na ordem listada. Mede a caixa de cada uma.
' RECONSTRUCAO: o dump nao tem rotulo "desenhos" para esta selecao (so "Vigas"); usa-se "Desenhos"
' para caber na linha de 80 colunas.
SUB SelecionaVets
    DIM i AS INTEGER, txt AS STRING, tmp(1 TO 300) AS STRING, src AS STRING
    CLS
    TelaItemMenu 2, 2, "Numero dos Desenhos a serem Montados I/J/../N a M/../K "
    FOR i = 1 TO VQ%
        PRINT i; " "; VN$(i)
    NEXT
    txt = EntradaTexto$(CSRLIN + 1, 2, 60, "")
    CALL ParseOrdem(txt)
    FOR i = 1 TO ORDQ%
        tmp(i) = VN$(ORD%(i))
    NEXT
    FOR i = 1 TO ORDQ%
        VN$(i) = tmp(i)
    NEXT
    VQ% = ORDQ%
    FOR i = 1 TO VQ%
        src = DirVet$ + VN$(i)
        CALL VetCaixa(src, VXI#(i), VYI#(i), VXA#(i), VYA#(i))
    NEXT
END SUB

' Le numeros de txt$ (separados por qualquer caractere nao numerico) em ORD%.
' Sem numeros validos, ORD% recebe 1..VQ% (todas na ordem).
SUB ParseOrdem (txt AS STRING)
    DIM i AS INTEGER, c AS STRING, num AS LONG, digito AS INTEGER
    ORDQ% = 0: num = 0: digito = 0
    FOR i = 1 TO LEN(txt) + 1
        IF i <= LEN(txt) THEN c = MID$(txt, i, 1) ELSE c = " "
        IF c >= "0" AND c <= "9" THEN
            IF num < 100000 THEN num = num * 10 + VAL(c)
            digito = -1
        ELSE
            IF digito AND num >= 1 AND num <= VQ% AND ORDQ% < 300 THEN
                ORDQ% = ORDQ% + 1
                ORD%(ORDQ%) = num
            END IF
            num = 0: digito = 0
        END IF
    NEXT
    IF ORDQ% = 0 THEN
        FOR i = 1 TO VQ%
            ORD%(i) = i
        NEXT
        ORDQ% = VQ%
    END IF
END SUB

' Caixa envolvente (xi,yi)-(xa,ya) de um .VET. Vazio ou inexistente = 0,0-0,0.
SUB VetCaixa (arqV AS STRING, xi AS DOUBLE, yi AS DOUBLE, xa AS DOUBLE, ya AS DOUBLE)
    DIM fi AS INTEGER, ln AS STRING, tipo AS STRING, x AS DOUBLE, y AS DOUBLE, r AS DOUBLE
    DIM alt AS DOUBLE, tam AS DOUBLE
    xi = 1E+30: yi = 1E+30: xa = -1E+30: ya = -1E+30
    IF _FILEEXISTS(arqV) THEN
        fi = FREEFILE
        OPEN arqV FOR INPUT AS #fi
        LINE INPUT #fi, ln
        DO WHILE NOT EOF(fi)
            LINE INPUT #fi, ln
            tipo = CampoVet$(ln, 1, 0)
            SELECT CASE tipo
                CASE "L"
                    CALL VetLimites(VAL(CampoVet$(ln, 2, 0)), VAL(CampoVet$(ln, 3, 0)), xi, yi, xa, ya)
                    CALL VetLimites(VAL(CampoVet$(ln, 4, 0)), VAL(CampoVet$(ln, 5, 0)), xi, yi, xa, ya)
                CASE "T"
                    ' RECONSTRUCAO: a caixa do texto vai do ponto de insercao ate a altura do campo 4
                    ' e a largura estimada (0,7 da altura por caractere, como SI alt*0.07 em SISPLOT.BM 85).
                    ' Sem rotacao: os .VET de DESENHO gravam angulo 0.
                    x = VAL(CampoVet$(ln, 2, 0))
                    y = VAL(CampoVet$(ln, 3, 0))
                    alt = VAL(CampoVet$(ln, 4, 0))
                    tam = LEN(CampoVet$(ln, 7, -1))
                    CALL VetLimites(x, y, xi, yi, xa, ya)
                    CALL VetLimites(x + tam * alt * 0.7#, y + alt, xi, yi, xa, ya)
                CASE "C"
                    x = VAL(CampoVet$(ln, 2, 0))
                    y = VAL(CampoVet$(ln, 3, 0))
                    r = VAL(CampoVet$(ln, 4, 0))
                    CALL VetLimites(x - r, y - r, xi, yi, xa, ya)
                    CALL VetLimites(x + r, y + r, xi, yi, xa, ya)
            END SELECT
        LOOP
        CLOSE #fi
    END IF
    IF xa < xi THEN
        xi = 0: yi = 0: xa = 0: ya = 0
    END IF
END SUB

' Campo k de uma linha de .VET (virgulas fora de aspas separam; aspas somem).
' resto = -1 devolve do campo k ate o fim (usado no texto da entidade T).
FUNCTION CampoVet$ (ln AS STRING, k AS INTEGER, resto AS INTEGER)
    DIM i AS INTEGER, c AS STRING, cont AS INTEGER, dentro AS INTEGER, s AS STRING
    cont = 1: dentro = 0: s = ""
    FOR i = 1 TO LEN(ln)
        c = MID$(ln, i, 1)
        IF c = CHR$(34) THEN
            dentro = 1 - dentro
        ELSEIF c = "," AND dentro = 0 THEN
            cont = cont + 1
        ELSEIF cont = k THEN
            s = s + c
        ELSEIF resto AND cont > k THEN
            s = s + c
        END IF
    NEXT
    CampoVet$ = s
END FUNCTION

' ------------------------------------------------------- arranjo
' Coloca as vigas em linha da esquerda para a direita, de cima para baixo.
' Quebra de linha e de folha quando nao cabe. Itens maiores que a area
' util ficam de fora (Excl%). Deslocamentos em PDX#/PDY#.
' RECONSTRUCAO: margem esquerda = linha 5; margens outras = linha 6;
' carimbo reservado como faixa inferior de altura linha 8 em toda a largura
' (o dump nao traz o retangulo exato do carimbo).
SUB Arranja
    DIM i AS INTEGER, larg AS DOUBLE, alt AS DOUBLE, mE AS DOUBLE, mO AS DOUBLE, dist AS DOUBLE
    DIM xl AS DOUBLE, xr AS DOUBLE, yb AS DOUBLE, yt AS DOUBLE
    DIM cx AS DOUBLE, cy AS DOUBLE, lh AS DOUBLE, w AS DOUBLE, h AS DOUBLE, folha AS INTEGER
    larg = ParmNum#(3): alt = ParmNum#(4)
    mE = ParmNum#(5): mO = ParmNum#(6)
    dist = ParmNum#(12)
    xl = mE: xr = larg - mO
    yb = mO + ParmNum#(8): yt = alt - mO
    PQ% = 0: Excl% = 0: PFN% = 0
    folha = 1: cx = xl: cy = yt: lh = 0
    FOR i = 1 TO VQ%
        w = VXA#(i) - VXI#(i)
        h = VYA#(i) - VYI#(i)
        IF w < 0 THEN w = 0
        IF h < 0 THEN h = 0
        IF w > xr - xl OR h > yt - yb THEN
            Excl% = Excl% + 1
        ELSE
            IF cx + w > xr THEN
                cx = xl: cy = cy - lh - dist: lh = 0
            END IF
            IF cy - h < yb THEN
                folha = folha + 1: cx = xl: cy = yt: lh = 0
            END IF
            PQ% = PQ% + 1
            PFOL%(PQ%) = folha
            PARQ$(PQ%) = VN$(i)
            PDX#(PQ%) = cx - VXI#(i)
            PDY#(PQ%) = (cy - h) - VYI#(i)
            PFN% = folha
            cx = cx + w + dist
            IF h > lh THEN lh = h
        END IF
    NEXT
END SUB

' ------------------------------------------------- geracao de arquivos
' Copia as entidades de um .VET deslocando por (dx,dy) para o .VET da folha.
SUB CopiaVet (arq AS STRING, f AS INTEGER, dx AS DOUBLE, dy AS DOUBLE)
    DIM fi AS INTEGER, ln AS STRING, tipo AS STRING, x AS DOUBLE, y AS DOUBLE
    fi = FREEFILE
    OPEN arq FOR INPUT AS #fi
    LINE INPUT #fi, ln
    DO WHILE NOT EOF(fi)
        LINE INPUT #fi, ln
        tipo = CampoVet$(ln, 1, 0)
        SELECT CASE tipo
            CASE "L"
                CALL VetLinha(f, VAL(CampoVet$(ln, 2, 0)) + dx, VAL(CampoVet$(ln, 3, 0)) + dy, VAL(CampoVet$(ln, 4, 0)) + dx, VAL(CampoVet$(ln, 5, 0)) + dy, VAL(CampoVet$(ln, 6, 0)))
            CASE "T"
                x = VAL(CampoVet$(ln, 2, 0)) + dx
                y = VAL(CampoVet$(ln, 3, 0)) + dy
                CALL VetTexto(f, x, y, VAL(CampoVet$(ln, 4, 0)), VAL(CampoVet$(ln, 5, 0)), VAL(CampoVet$(ln, 6, 0)), CampoVet$(ln, 7, -1))
            CASE "C"
                x = VAL(CampoVet$(ln, 2, 0)) + dx
                y = VAL(CampoVet$(ln, 3, 0)) + dy
                CALL VetCirculo(f, x, y, VAL(CampoVet$(ln, 4, 0)), VAL(CampoVet$(ln, 5, 0)))
        END SELECT
    LOOP
    CLOSE #fi
END SUB

' Nome base da folha n: <obra>_F<n> (sem extensao).
FUNCTION NomeFolha$ (n AS INTEGER)
    NomeFolha$ = Obra$ + "_F" + LTRIM$(STR$(n))
END FUNCTION

' Gera <obra>_F<n>.VET: contorno da folha em pena 5 e as vigas deslocadas.
SUB GeraFolhas
    DIM n AS INTEGER, i AS INTEGER, f AS INTEGER, arq AS STRING, tit AS STRING, src AS STRING
    TelaStatus "Aguarde ...  Montagem das Vigas nas Folhas .."
    FOR n = 1 TO PFN%
        arq = DirVet$ + NomeFolha$(n) + ".VET"
        tit = "Folha " + LTRIM$(STR$(n)) + " - " + Obra$
        f = VetAbre%(arq, tit)
        CALL VetRetangulo(f, 0, 0, ParmNum#(3), ParmNum#(4), 5)
        FOR i = 1 TO PQ%
            IF PFOL%(i) = n THEN
                src = DirVet$ + PARQ$(i)
                CALL CopiaVet(src, f, PDX#(i), PDY#(i))
            END IF
        NEXT
        CALL VetFecha(f)
        CALL Mensagem("Arquivo gerado: " + arq)
    NEXT
END SUB

' Grava <obra>.AVF: cabecalho e uma linha por viga (folha, arquivo, dx, dy).
SUB GravaAvf
    DIM f AS INTEGER, i AS INTEGER, arq AS STRING
    arq = DirVet$ + Obra$ + ".AVF"
    f = FREEFILE
    OPEN arq FOR OUTPUT AS #f
    WRITE #f, "SISTRUT40", "AVF", 1, Obra$
    FOR i = 1 TO PQ%
        WRITE #f, PFOL%(i), PARQ$(i), PDX#(i), PDY#(i)
    NEXT
    CLOSE #f
    CALL Mensagem("Arquivo gerado: " + arq)
END SUB

' Le <obra>.AVF para o arranjo e monta a lista de .VET usados (VN$).
' PQ% = 0 em caso de erro (arquivo com cabecalho errado ou .VET faltando).
SUB LeAvf
    DIM f AS INTEGER, s1 AS STRING, s2 AS STRING, ver AS INTEGER, tit AS STRING
    DIM fo AS INTEGER, nome AS STRING, dx AS DOUBLE, dy AS DOUBLE, j AS INTEGER, achou AS INTEGER
    DIM src AS STRING
    f = FREEFILE
    OPEN DirVet$ + Obra$ + ".AVF" FOR INPUT AS #f
    INPUT #f, s1, s2, ver, tit
    IF s1 <> "SISTRUT40" OR s2 <> "AVF" THEN
        CLOSE #f
        TelaErro "DADOS INCORRETOS"
        PQ% = 0
        EXIT SUB
    END IF
    PQ% = 0: VQ% = 0: PFN% = 0
    DO WHILE NOT EOF(f)
        INPUT #f, fo, nome, dx, dy
        PQ% = PQ% + 1
        PFOL%(PQ%) = fo
        PARQ$(PQ%) = nome
        PDX#(PQ%) = dx
        PDY#(PQ%) = dy
        IF fo > PFN% THEN PFN% = fo
        achou = 0
        FOR j = 1 TO VQ%
            IF VN$(j) = nome THEN achou = -1
        NEXT
        IF achou = 0 AND VQ% < 300 THEN
            VQ% = VQ% + 1
            VN$(VQ%) = nome
        END IF
    LOOP
    CLOSE #f
    FOR j = 1 TO VQ%
        IF NOT _FILEEXISTS(DirVet$ + VN$(j)) THEN
            TelaErro "NAO EXISTE ESTE ARQUIVO NO DISCO"
            PQ% = 0
            EXIT SUB
        END IF
        src = DirVet$ + VN$(j)
        CALL VetCaixa(src, VXI#(j), VYI#(j), VXA#(j), VYA#(j))
    NEXT
END SUB

' ------------------------------------------------ lista de equipamentos
' Nomes $NOME de PLOTER.INI (sem o $) em EQ$; modo (H+2) em EQM$ e penas (H+3) em EQP%.
SUB ListaEquipamentos
    DIM i AS INTEGER, ln AS STRING
    EQQ% = 0
    IF ArqLer%("PLOTER.INI") < 0 THEN EXIT SUB
    FOR i = 1 TO ArqQtd
        ln = ArqLinha$(i)
        IF LEFT$(ln, 1) = "$" AND EQQ% < 200 THEN
            EQQ% = EQQ% + 1
            EQ$(EQQ%) = RTRIM$(MID$(ln, 2))
            EQM$(EQQ%) = ""
            EQP%(EQQ%) = 0
            IF i + 3 <= ArqQtd THEN
                EQM$(EQQ%) = UCASE$(LTRIM$(RTRIM$(ArqLinha$(i + 2))))
                EQP%(EQQ%) = VAL(ArqLinha$(i + 3))
            END IF
        END IF
    NEXT
END SUB

' Mostra os equipamentos (2 colunas de 14, ate 28) e grava a escolha em Equip$, EqModo$ e EqPenas%.
' Devolve -1 se escolheu, 0 se nao.
FUNCTION EscolheEquip%
    DIM i AS INTEGER, lin AS INTEGER, col AS INTEGER, idx AS DOUBLE
    EscolheEquip% = 0
    ListaEquipamentos
    IF EQQ% = 0 THEN
        TelaErro "DADOS INCORRETOS"
        EXIT FUNCTION
    END IF
    CLS
    TelaItemMenu 2, 4, "PLOTER utilizado"
    FOR i = 1 TO EQQ%
        lin = 4 + ((i - 1) MOD 14)
        col = 4 + 38 * ((i - 1) \ 14)
        LOCATE lin, col: PRINT i; " "; EQ$(i)
    NEXT
    idx = EntradaNumero#(20, 4, 4, 1)
    IF idx < 1 OR idx > EQQ% THEN EXIT FUNCTION
    Equip$ = EQ$(INT(idx))
    EqModo$ = EQM$(INT(idx))
    EqPenas% = EQP%(INT(idx))
    EscolheEquip% = -1
END FUNCTION

' <obra>_F<n>.DXF a partir de cada <obra>_F<n>.VET.
SUB GeraDxf
    DIM n AS INTEGER, dst AS STRING, src AS STRING
    DirDxf$ = ParmDir$(11)
    TelaStatus "Aguarde ..."
    CALL Mensagem("Montagem dos arquivos .DXF em " + DirDxf$)
    FOR n = 1 TO PFN%
        dst = DirDxf$ + NomeFolha$(n) + ".DXF"
        src = DirVet$ + NomeFolha$(n) + ".VET"
        IF VetParaDxf%(src, dst) < 0 THEN
            TelaErro "erro no processamento"
        ELSE
            CALL Mensagem(dst)
        END IF
    NEXT
END SUB

' Marca em PenaUsada%() as penas (1 a 9) usadas no .VET arq: L e T pelo campo 6,
' C pelo campo 5. Pula a primeira linha, como CopiaVet.
SUB MarcaPenas (arq AS STRING)
    DIM i AS INTEGER, ln AS STRING, tipo AS STRING, pena AS INTEGER
    IF ArqLer%(arq) < 0 THEN EXIT SUB
    FOR i = 2 TO ArqQtd
        ln = ArqLinha$(i)
        tipo = CampoVet$(ln, 1, 0)
        pena = 0
        IF tipo = "L" OR tipo = "T" THEN pena = VAL(CampoVet$(ln, 6, 0))
        IF tipo = "C" THEN pena = VAL(CampoVet$(ln, 5, 0))
        IF pena >= 1 AND pena <= 9 THEN PenaUsada%(pena) = -1
    NEXT
END SUB

' Avisa cada pena do desenho acima de EqPenas% (numero de penas do equipamento).
' Nao bloqueia: se houve aviso, espera Enter antes de plotar.
SUB AvisaPenas
    DIM n AS INTEGER, p AS INTEGER, avisou AS INTEGER
    avisou = 0
    FOR p = 1 TO 9
        PenaUsada%(p) = 0
    NEXT
    FOR n = 1 TO PFN%
        CALL MarcaPenas(DirVet$ + NomeFolha$(n) + ".VET")
    NEXT
    FOR p = EqPenas% + 1 TO 9
        IF PenaUsada%(p) THEN
            CALL Mensagem("Coloque a pena de numero " + LTRIM$(STR$(p)) + " no Ploter, no local da pena")
            avisou = -1
        END IF
    NEXT
    IF avisou THEN
        TelaStatus "Acione <Enter> para seguir com a plotagem "
        DO
        LOOP UNTIL TeclaLer$ = CHR$(13)
    END IF
END SUB

' <obra>_F<n>.PLT (HP-GL) a partir de cada <obra>_F<n>.VET.
' VetParaHpgl% grava IN; no inicio e PU;SP0; no fim: equivale ao bloco HP-GL do
' PLOTER.INI (H+2 = IN); por isso o .PLT nao e reescrito por equipamento.
' RECONSTRUCAO: equipamento que nao e HP-GL (H+2 diferente de IN: Houston,
' Digicon/Smar, LPT) recebe o mesmo HP-GL generico, com aviso.
SUB GeraPlt
    DIM n AS INTEGER, dst AS STRING, src AS STRING
    IF EscolheEquip% = 0 THEN EXIT SUB
    IF EqModo$ <> "IN" THEN CALL Mensagem("equipamento nao suportado nesta reconstrucao")
    DirPlt$ = ParmDir$(25)
    TelaStatus "Aguarde ..."
    CALL Mensagem("PLOTER utilizado: " + Equip$)
    AvisaPenas
    FOR n = 1 TO PFN%
        dst = DirPlt$ + NomeFolha$(n) + ".PLT"
        src = DirVet$ + NomeFolha$(n) + ".VET"
        IF VetParaHpgl%(src, dst) < 0 THEN
            TelaErro "erro no processamento"
        ELSE
            CALL Mensagem("Plotagem gerada em Arquivo no Disco (.PLT) " + dst)
        END IF
    NEXT
END SUB

' --------------------------------------------------------- fluxos
' Opcoes 1 e 2: parametros (opcional), obra, selecao de .VET, arranjo.
SUB MontaFluxo
    CLS
    IF Confirma%("Deseja alterar as parametrizacoes S/*N* ") THEN ParmTela
    CLS
    TelaItemMenu 2, 4, "Montagem de Folhas para Plotagem"
    TelaItemMenu 20, 2, "Nome da Obra *RETORNO* "
    Obra$ = EntradaTexto$(20, 30, 20, ObraAtual$(DirDados$))
    IF Obra$ = "" THEN EXIT SUB
    DirVet$ = ParmDir$(24)
    IF ListaVet%(DirVet$, Obra$) = 0 THEN
        TelaErro "Nenhum Arquivo Encontrado!"
        EXIT SUB
    END IF
    CLS
    SelecionaVets
    CALL Apresenta(-1)
END SUB

' Opcao 3: reabre <obra>.AVF e apresenta as folhas sem rearranjar.
SUB RecuperaFluxo
    CLS
    TelaItemMenu 20, 2, "Nome da Obra *RETORNO* "
    Obra$ = EntradaTexto$(20, 30, 20, ObraAtual$(DirDados$))
    IF Obra$ = "" THEN EXIT SUB
    DirVet$ = ParmDir$(24)
    IF NOT _FILEEXISTS(DirVet$ + Obra$ + ".AVF") THEN
        TelaErro "NAO EXISTE ESTE ARQUIVO NO DISCO"
        EXIT SUB
    END IF
    LeAvf
    IF PQ% = 0 THEN EXIT SUB
    CALL Apresenta(0)
END SUB

' Arranjo (se pedido), gravacao do AVF, geracao das folhas e menu de resultado.
' Opcao A volta aos parametros e rearranja.
SUB Apresenta (arranjar AS INTEGER)
    DIM k AS STRING
    DO
        IF arranjar THEN
            Arranja
            IF PQ% = 0 THEN
                TelaErro "Nao couberam nos limites da folha / excluidos   os registros"
                EXIT SUB
            END IF
            IF Excl% > 0 THEN
                TelaErro "Nao couberam nos limites da folha / excluidos   os registros "
                Espera
            END IF
            IF Confirma%("Gravo o conjunto de folhas em <" + DirVet$ + Obra$ + ".AVF>  S/*N* ") THEN
                GravaAvf
            END IF
        END IF
        GeraFolhas
        ResumoGeral
        k = ResultadoMenu$
        IF k <> "A" THEN EXIT DO
        ParmTela
        arranjar = -1
    LOOP
END SUB

' Resumo geral: uma tela por folha, com o aco das vigas da folha. Precisa dos
' dados das vigas (.EDV) carregados; sem o .EDV mostra o erro e nao segue.
SUB ResumoGeral
    DIM n AS INTEGER
    IF VigLe%(DirVet$ + Obra$ + ".EDV", "EDV") = 0 THEN
        TelaErro DadErro
        Espera
        EXIT SUB
    END IF
    FOR n = 1 TO PFN%
        ResumoFolha n
        Espera
    NEXT
END SUB

' Tela do resumo da folha n: aco por bitola (soma das vigas da folha), com
' peso total, tipo de aco, ordem e comparacao com o maior peso da folha.
' Rotulos e colunas vem de dump de strings do VPLOTA.EXE (fora do repositorio); o resto e RECONSTRUCAO.
SUB ResumoFolha (n AS INTEGER)
    DIM i AS INTEGER, k AS INTEGER, v AS INTEGER, lin AS INTEGER, ordem AS INTEGER
    DIM c(1 TO 9) AS DOUBLE, p(1 TO 9) AS DOUBLE, fc(1 TO 9) AS DOUBLE, fp(1 TO 9) AS DOUBLE
    DIM tot AS DOUBLE, maior AS DOUBLE, pct AS DOUBLE, tipo AS STRING
    FOR k = 1 TO 9: fc(k) = 0: fp(k) = 0: NEXT
    FOR i = 1 TO PQ%
        IF PFOL%(i) = n THEN
            v = VigDaEntrada%(PARQ$(i))
            IF v > 0 THEN
                CALL AcoDaViga(v, c(), p())
                FOR k = 1 TO 9
                    fc(k) = fc(k) + c(k)
                    fp(k) = fp(k) + p(k)
                NEXT
            END IF
        END IF
    NEXT
    maior = 0: tot = 0
    FOR k = 1 TO 9
        tot = tot + fp(k)
        IF fp(k) > maior THEN maior = fp(k)
    NEXT

    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 3: PRINT "RESUMO GERAL DA FOLHA  "; NomeFolha$(n)
    LOCATE 4, 3: PRINT "Xmax"; : PRINT USING "########.##"; ParmNum#(3)
    LOCATE 4, 30: PRINT "Ymax"; : PRINT USING "########.##"; ParmNum#(4)
    LOCATE 6, 3: PRINT "ACO  #    TOTAL   PESO"
    LOCATE 6, 31: PRINT "TIPO DE ACO"
    LOCATE 6, 44: PRINT "ORDEM"
    LOCATE 6, 52: PRINT "COMPARACAO DO MAXIMO"

    lin = 7
    FOR k = 1 TO 9
        IF fp(k) > 0 THEN
            ' ordem = 1 + bitolas de peso maior (RECONSTRUCAO)
            ordem = 1
            FOR i = 1 TO 9
                IF fp(i) > fp(k) THEN ordem = ordem + 1
            NEXT
            ' RECONSTRUCAO: CA-60 ate 6,3 mm e CA-50 acima (NBR 7480 nao lida)
            IF CcaBitola#(k) <= 6.3# THEN tipo = "CA-60" ELSE tipo = "CA-50"
            pct = fp(k) / maior * 100#
            LOCATE lin, 3: PRINT USING "##.#"; CcaBitola#(k);
            LOCATE lin, 13: PRINT USING "#####.##"; fc(k);
            LOCATE lin, 21: PRINT USING "#####.##"; fp(k);
            LOCATE lin, 31: PRINT tipo;
            LOCATE lin, 44: PRINT ordem;
            LOCATE lin, 52: PRINT USING "###.#"; pct; : PRINT " %"
            lin = lin + 1
        END IF
    NEXT
    IF tot = 0 THEN
        LOCATE 7, 3: PRINT "Nenhuma viga com aco nesta folha"
    END IF
    LOCATE 20, 3: PRINT "PESO TOTAL (kg)";
    LOCATE 20, 21: PRINT USING "#####.##"; tot
END SUB

' Soma o aco de uma viga (todas as posicoes dos seus tramos) em c(i) (m) e
' p(i) (kg) por bitola. DcTabelaAco# le o estado global das vigas, por isso a
' viga v vai para Vig(1) com VigQtd = 1 e a area global volta ao original.
SUB AcoDaViga (v AS INTEGER, c() AS DOUBLE, p() AS DOUBLE)
    DIM salvaVig AS TViga, salvaQtd AS INTEGER, tot AS DOUBLE
    salvaVig = Vig(1): salvaQtd = VigQtd
    Vig(1) = Vig(v): VigQtd = 1
    tot = DcTabelaAco#(c(), p())
    Vig(1) = salvaVig: VigQtd = salvaQtd
END SUB

' Indice da viga dona do .VET arq (nome relativo a DirVet$); 0 se nao achar.
' O nome do arquivo nao serve (FLUXO_V.VET tambem e de uma viga); o titulo do
' cabecalho "OBRA - <obra>  VIGA - <nome>" (DESCALC.BM) diz qual viga e.
FUNCTION VigDaEntrada% (arq AS STRING)
    DIM v AS INTEGER, f AS INTEGER, s1 AS STRING, s2 AS STRING, ver AS INTEGER
    DIM tit AS STRING, nome AS STRING, ini AS INTEGER
    VigDaEntrada% = 0
    IF NOT _FILEEXISTS(DirVet$ + arq) THEN EXIT FUNCTION
    f = FREEFILE
    OPEN DirVet$ + arq FOR INPUT AS #f
    INPUT #f, s1, s2, ver, tit
    CLOSE #f
    ini = INSTR(tit, "VIGA - ")
    IF ini = 0 THEN EXIT FUNCTION
    nome = RTRIM$(MID$(tit, ini + 7))
    FOR v = 1 TO VigQtd
        IF RTRIM$(Vig(v).nome) = nome THEN
            VigDaEntrada% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Menu do resultado. V = previa (VetMostra%), A = alterar parametros,
' S = gera .DXF e .PLT, C = cancela. Devolve "A" ou "C" para sair.
FUNCTION ResultadoMenu$
    DIM k AS STRING, n AS INTEGER, src AS STRING
    ResultadoMenu$ = ""
    DO
        CLS
        TelaMoldura 3, 4, 14, 76
        TelaItemMenu 5, 8, "<V>isualizar a disposicao das Vigas nas folhas e altera-las"
        TelaItemMenu 6, 8, "<A>lterar as Parametrizacoes ou a Escolha das Vigas entre as folhas"
        ' RECONSTRUCAO: as duas linhas <S> do dump sao tratadas como uma unica tecla S:
        ' confirma, gera .DXF de todas as folhas e depois .PLT.
        TelaItemMenu 7, 8, "<S>eguir ... preparo dos arquivos .DXF"
        TelaItemMenu 8, 8, "<S>eguir ... plotagem"
        TelaItemMenu 9, 8, "<C>ancelar as montagens executadas"
        TelaStatus "escolha opcao"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "V"
                FOR n = 1 TO PFN%
                    src = DirVet$ + NomeFolha$(n) + ".VET"
                    IF VetMostra%(src) < 0 THEN
                        TelaErro "verifique a consistencia dos seus dados"
                    END IF
                NEXT
            CASE "A"
                ResultadoMenu$ = "A"
                EXIT FUNCTION
            CASE "S"
                IF Confirma%("Confirme seguir S/*N* ") THEN
                    GeraDxf
                    GeraPlt
                    Espera
                END IF
            CASE "C"
                IF Confirma%("Confirme o cancelamento S/*N* !") THEN
                    ResultadoMenu$ = "C"
                    EXIT FUNCTION
                END IF
        END SELECT
    LOOP
END FUNCTION

' ---------------------------------------------- inclusao dos modulos
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
