' ============================================================================
'  RT45GFX.BI - estado grafico do BRUN45 (QuickBASIC 4.5) para as rotinas de RT45GFX.BM
'  Incluido depois de RT45.BI. Algoritmos e enderecos: tests/retraducao/gfx/GRAFICO.md.
'  Os nomes entre colchetes sao as variaveis do BRUN45 (DS do runtime).
' ============================================================================
DIM SHARED RG_ASS AS STRING                      ' estado do RT45 (SCREEN/VIEW/WINDOW) ja aplicado
DIM SHARED RG_ASSV AS STRING, RG_ASSW AS STRING
DIM SHARED RG_W AS INTEGER, RG_H AS INTEGER      ' [64d],[64f]: largura - 1, altura - 1
DIM SHARED RG_X1 AS INTEGER, RG_X2 AS INTEGER    ' [651],[653]: recorte (VIEW) em x
DIM SHARED RG_Y1 AS INTEGER, RG_Y2 AS INTEGER    ' [655],[657]: recorte em y
DIM SHARED RG_OX AS INTEGER, RG_OY AS INTEGER    ' [659],[65b]: origem (VIEW sem SCREEN)
DIM SHARED RG_VSCR AS INTEGER                    ' [297]: ultimo VIEW foi VIEW SCREEN
DIM SHARED RG_VW AS INTEGER, RG_VH AS INTEGER    ' [65d],[65f]: largura/altura da escala do WINDOW
DIM SHARED RG_WIN AS INTEGER, RG_WSCR AS INTEGER ' [294],[295]: WINDOW ligado, WINDOW SCREEN
DIM SHARED RG_WX1 AS DOUBLE, RG_WY1 AS DOUBLE    ' [760],[768]: canto menor do WINDOW
DIM SHARED RG_WX2 AS DOUBLE, RG_WY2 AS DOUBLE    ' [770],[778]: canto maior
DIM SHARED RG_SX AS DOUBLE, RG_SY AS DOUBLE      ' [740],[748]: pixels por unidade
DIM SHARED RG_IX AS DOUBLE, RG_IY AS DOUBLE      ' [730],[738]: unidades por pixel
DIM SHARED RG_PX AS INTEGER, RG_PY AS INTEGER    ' [234],[236]: ultimo ponto (pixel)
DIM SHARED RG_LX AS SINGLE, RG_LY AS SINGLE      ' [242],[246]: ultimo ponto (logico, para STEP)
DIM SHARED RG_EST AS LONG                        ' [252]: estilo da LINE (16 bits)
DIM SHARED RG_COR AS INTEGER                     ' [4ff]: cor ja ajustada ao modo
DIM SHARED RG_M AS _MEM, RG_LARG AS LONG, RG_ALT AS LONG   ' imagem de desenho (_DEST)
DIM SHARED RG_CF AS INTEGER                      ' [265]: indicadores do CIRCLE
DIM SHARED RG_LF AS INTEGER                      ' [255]: raios das pontas do arco
DIM SHARED RG_ASP AS LONG                        ' [256]: aspecto em 8.8
DIM SHARED RG_R AS INTEGER, RG_OCT AS LONG       ' [23c] raio em pixels, [25a] passos por oitavo
DIM SHARED RG_AS AS LONG, RG_AE AS LONG, RG_INV AS INTEGER   ' [262],[258],[264]: arco
DIM SHARED RG_FALHA AS INTEGER                   ' erro do BASIC no meio do comando: abandona o resto
DIM SHARED RG_GX1 AS INTEGER, RG_GY1 AS INTEGER  ' GET/PUT: cantos em pixels (RT_GCAIXA, RT_GPONTO)
DIM SHARED RG_GX2 AS INTEGER, RG_GY2 AS INTEGER
