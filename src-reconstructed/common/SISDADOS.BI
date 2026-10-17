' ============================================================================
'  SISDADOS.BI - tipos e estado dos arquivos de obra trocados entre modulos.
'  Contrato: docs/formats/DADOS.md. Rotinas em SISDADOS.BM.
'  Uso: '$INCLUDE: '../common/SISDADOS.BI' no topo (depois de SISCOMUM.BI),
'       '$INCLUDE: '../common/SISDADOS.BM' no fim.
'  Strings de nome sao de tamanho fixo: use RTRIM$ ao ler.
' ============================================================================

CONST DAD_MAXLAJ = 200      ' lajes por pavimento
CONST DAD_MAXVIG = 300      ' vigas por pavimento
CONST DAD_MAXAPO = 1500     ' apoios (todas as vigas)
CONST DAD_MAXTRA = 1200     ' tramos (todas as vigas)
CONST DAD_MAXCON = 2000     ' cargas concentradas (todos os tramos)
CONST DAD_MAXPIL = 300      ' pilares/colunas
CONST DAD_MAXNIV = 40       ' niveis do edificio
CONST DAD_MAXESF = 6000     ' linhas coluna x nivel
CONST DAD_MAXPOS = 3000     ' posicoes de ferro (.EDV)

' --- .LAJ -------------------------------------------------------------------
' Bordos: indice 1 esquerdo, 2 inferior, 3 direito, 4 superior.
TYPE TLaje
    nome AS STRING * 8
    x0 AS DOUBLE: y0 AS DOUBLE: lx AS DOUBLE: ly AS DOUBLE
    h AS DOUBLE                 ' cm (0 = a calcular)
    bordos AS STRING * 4        ' A/E/L por lado
    g AS DOUBLE: q AS DOUBLE    ' tf/m2
    vigas AS STRING * 40        ' "V1/V2/V3/V4"
    temRes AS INTEGER           ' -1 se ha resultados de calculo
    p AS DOUBLE                 ' carga total tf/m2
    mx AS DOUBLE: my AS DOUBLE  ' tf.m/m
    x1 AS DOUBLE: x2 AS DOUBLE: x3 AS DOUBLE: x4 AS DOUBLE      ' negativos por bordo
    asx AS DOUBLE: asy AS DOUBLE                                ' cm2/m
    as1 AS DOUBLE: as2 AS DOUBLE: as3 AS DOUBLE: as4 AS DOUBLE
    flecha AS DOUBLE            ' cm
    r1 AS DOUBLE: r2 AS DOUBLE: r3 AS DOUBLE: r4 AS DOUBLE      ' reacoes tf/m
END TYPE
DIM SHARED Laj(1 TO DAD_MAXLAJ) AS TLaje
DIM SHARED LajQtd AS INTEGER, LajNivel AS INTEGER, LajObra AS STRING

' --- .VIG / .SEC / .EDV -------------------------------------------------------
' Viga v tem apoios VigApo(Vig(v).iApo + 0 .. nTramos) e tramos
' VigTra(Vig(v).iTra + 0 .. nTramos-1); tramo t tem cargas VigCon(iCon + 0 .. nConc-1).
TYPE TViga
    nome AS STRING * 8
    nTramos AS INTEGER
    bw AS DOUBLE: h AS DOUBLE: d AS DOUBLE       ' cm (d so em .SEC/.EDV)
    iApo AS INTEGER: iTra AS INTEGER
END TYPE
TYPE TApoio
    nome AS STRING * 8          ' pilar/viga de apoio, "-" = balanco
    x AS DOUBLE: y AS DOUBLE
END TYPE
TYPE TTramo
    vao AS DOUBLE               ' m
    qPerm AS DOUBLE: qAcid AS DOUBLE             ' tf/m
    nConc AS INTEGER: iCon AS INTEGER
    ' resultados (.SEC/.EDV)
    mPos AS DOUBLE: mNegEsq AS DOUBLE: mNegDir AS DOUBLE        ' tf.m
    vEsq AS DOUBLE: vDir AS DOUBLE                              ' tf
    asPos AS DOUBLE: asNegEsq AS DOUBLE: asNegDir AS DOUBLE     ' cm2
    phiPos AS DOUBLE: nPos AS INTEGER
    phiNegEsq AS DOUBLE: nNegEsq AS INTEGER
    phiNegDir AS DOUBLE: nNegDir AS INTEGER
    aswEsq AS DOUBLE: aswDir AS DOUBLE           ' cm2/m
    phiEst AS DOUBLE: sEst AS DOUBLE             ' mm, cm
    nPosFerro AS INTEGER: iPosFerro AS INTEGER   ' posicoes (.EDV)
END TYPE
TYPE TConc
    a AS DOUBLE                 ' m do apoio esquerdo
    P AS DOUBLE                 ' tf
END TYPE
TYPE TPosFerro
    numPos AS INTEGER
    phi AS DOUBLE               ' mm
    n AS INTEGER
    compr AS DOUBLE             ' cm
    forma AS STRING * 1         ' R U L E
END TYPE
DIM SHARED Vig(1 TO DAD_MAXVIG) AS TViga
DIM SHARED VigApo(1 TO DAD_MAXAPO) AS TApoio
DIM SHARED VigTra(1 TO DAD_MAXTRA) AS TTramo
DIM SHARED VigCon(1 TO DAD_MAXCON) AS TConc
DIM SHARED VigPos(1 TO DAD_MAXPOS) AS TPosFerro
DIM SHARED VigQtd AS INTEGER, VigNivel AS INTEGER, VigObra AS STRING
DIM SHARED VigApoQtd AS INTEGER, VigTraQtd AS INTEGER, VigConQtd AS INTEGER, VigPosQtd AS INTEGER

' --- .RLP / .REP ------------------------------------------------------------
TYPE TCargaPilar
    nome AS STRING * 8
    x AS DOUBLE: y AS DOUBLE
    N AS DOUBLE                 ' tf
    Mx AS DOUBLE: My AS DOUBLE  ' tf.m
END TYPE
DIM SHARED CPil(1 TO DAD_MAXPIL) AS TCargaPilar
DIM SHARED CPilQtd AS INTEGER, CPilNivel AS INTEGER, CPilObra AS STRING

' --- .COL -------------------------------------------------------------------
' Esforcos da coluna c no nivel k (1 = mais alto): ColEsf((c - 1) * ColNivQtd + k).
TYPE TNivel
    nome AS STRING * 12
    cota AS DOUBLE: peDireito AS DOUBLE          ' m
END TYPE
TYPE TColuna
    nome AS STRING * 8
    secao AS STRING * 1         ' R ou C
    bx AS DOUBLE: by AS DOUBLE  ' cm
    x AS DOUBLE: y AS DOUBLE    ' m
END TYPE
TYPE TColEsf
    N AS DOUBLE: Mx AS DOUBLE: My AS DOUBLE
    lex AS DOUBLE: ley AS DOUBLE                 ' m
    asTot AS DOUBLE: phi AS DOUBLE: nBarras AS INTEGER
    phiEstribo AS DOUBLE: sEstribo AS DOUBLE
END TYPE
DIM SHARED ColNiv(1 TO DAD_MAXNIV) AS TNivel
DIM SHARED Col(1 TO DAD_MAXPIL) AS TColuna
DIM SHARED ColEsf(1 TO DAD_MAXESF) AS TColEsf
DIM SHARED ColNivQtd AS INTEGER, ColQtd AS INTEGER, ColObra AS STRING

' --- .FRM / .FOR / .CFO ------------------------------------------------------
TYPE TFrmLaje
    nome AS STRING * 8
    x0 AS DOUBLE: y0 AS DOUBLE: lx AS DOUBLE: ly AS DOUBLE: h AS DOUBLE
END TYPE
TYPE TFrmViga
    nome AS STRING * 8
    x1 AS DOUBLE: y1 AS DOUBLE: x2 AS DOUBLE: y2 AS DOUBLE
    bw AS DOUBLE: h AS DOUBLE
END TYPE
TYPE TFrmPilar
    nome AS STRING * 8
    x AS DOUBLE: y AS DOUBLE: bx AS DOUBLE: by AS DOUBLE
    secao AS STRING * 1
END TYPE
DIM SHARED FrmLaj(1 TO DAD_MAXLAJ) AS TFrmLaje
DIM SHARED FrmVig(1 TO DAD_MAXVIG) AS TFrmViga
DIM SHARED FrmPil(1 TO DAD_MAXPIL) AS TFrmPilar
DIM SHARED FrmLajQtd AS INTEGER, FrmVigQtd AS INTEGER, FrmPilQtd AS INTEGER, FrmObra AS STRING

' Ultima mensagem de erro de leitura (vazia se ok).
DIM SHARED DadErro AS STRING
