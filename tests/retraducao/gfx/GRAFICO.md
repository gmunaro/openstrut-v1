# Primitivas gráficas do BRUN45 (QuickBASIC 4.5) e a reprodução em `RT45GFX`

O QB64 PE desenha LINE, CIRCLE e PSET com outras regras de arredondamento e de traçado. Em tela isso aparece como pixels deslocados: o apoio do meio do esquema da viga sai uma coluna à direita, e os diagramas de esforços saem com os segmentos deslocados de um pixel (`viga/PEDIDOS-TRADUTOR.md`, R5 e R6). `src-original/comum/RT45GFX.BI`/`.BM` refazem as primitivas com os algoritmos do BRUN45.EXE do SISTRUT e desenham pixel a pixel na imagem do QB64.

Os endereços são do BRUN45.EXE original (`017D:xxxx`, desmontado com `$REA_WORK/rt/rt.py @017D:xxxx:n`, fora do repositório). Entre colchetes, as variáveis do runtime no DS dele.

## Resultado

Sondas QB4.5 compiladas com o BC/LINK do QuickBASIC 4.5 e o BRUN45 do SISTRUT, rodando no oráculo (DOSBox-X, `machine=svga_s3`), em SCREEN 2 (CGA 640x200) e SCREEN 9 (EGA 640x350). Cada cena termina com a memória de vídeo gravada por BSAVE (CGA: B800, 16 KB; EGA: os 4 planos de A000). O mesmo programa (mesmas DATA) roda no QB64 com as rotinas de `RT45GFX`, e `compara_gfx.py` compara pixel a pixel (índice de cor) e os textos (PMAP e erros do BASIC).

| sonda | caso do oráculo | cenas | pixels acesos no oráculo | RT45GFX | QB64 nativo (antes) |
|---|---|---|---|---|---|
| 1 (grupos A-D) | `retrad_gfx_s1`, `runs/retrad_gfx_s1-20261015-020905` | 13 em SCREEN 2 + 13 em SCREEN 9 | 242.470 | **0 pixels diferentes em todas**; PMAP (76 valores) e erros iguais | 132.892 pixels diferentes |
| 2 (grupos E-F) | `retrad_gfx_s2`, `runs/retrad_gfx_s2-20261015-030046` | 7 + 7 | 263.693 | **0 pixels diferentes em todas**; PMAP (72 valores) e erros iguais | 44.304 pixels diferentes |

Cenas: 1 leque de retas do centro e das bordas (todas as inclinações); 2 retas inteiras dentro da tela; 3 retas com pontas fora (recorte, até ±30000, com o erro 6 do original); 4 coordenadas fracionárias sem WINDOW (LINE e PSET em .25/.5/.75); 5 estilos, `LINE -(x,y)` em cadeia e STEP; 6 caixas B e BF dentro e fora (inclusive a caixa toda à esquerda/acima); 7 VIEW (0,0)-(639,191) + WINDOW SCREEN (0,0)-(640,192), o esquema da VIGA, com PMAP; 8 VIEW comum com borda + WINDOW cartesiano, STEP lógico; 9 VIEW SCREEN + WINDOW SCREEN; 10 círculos com o aspecto padrão (raios 0 a 260, centro fora); 11 aspectos 0,004 a 3,7; 12 arcos (ângulos negativos, início > fim); 13 GET/PUT em WINDOW SCREEN com coordenadas fracionárias; 14 empates exatos (fator 0,5) em WINDOW SCREEN e cartesiano, PMAP 0 a 3; 15 círculos de raio até 3000, STEP, aspecto > 1 com arco, início = fim, raio 0, CIRCLE em WINDOW; 16 estilo com recorte de VIEW SCREEN e B com estilo; 17 cores (0, 2, 3, 255, 256, 257, −2, 16, 20, 300) e PRESET; 18 último ponto depois de SCREEN, VIEW e WINDOW; 19 coordenadas além de 16 e de 32 bits; 20 GET/PUT sem WINDOW e com STEP, PUT fora do VIEW (erro 5).

Para repetir: `bash tests/retraducao/gfx/roda.sh <runs/retrad_gfx_s1-.../obra> "$V1_TRAB/gfx/o" "A B C D"` e `... <runs/retrad_gfx_s2-.../obra> "$V1_TRAB/gfx/o2" "E F"` (compila no QB64 pela trava do `tools/qbcompile.sh`; as diferenças, se houver, saem em PNG em `<saida>/dif/`). `V1_TRAB` é a pasta de trabalho descartável (ver o cabeçalho do `roda.sh`). `GFX_NATIVO=1` roda os mesmos programas com os comandos nativos do QB64.

## Conversão de coordenadas

### WINDOW e VIEW

- `VIEW` (B$VIEW 017D:41C8; sem argumentos B$VEW0 017D:426F → 774D): recorte inclusivo [651]..[657] com os cantos ordenados. VIEW comum põe a origem [659],[65b] no canto; VIEW SCREEN deixa a origem em 0 e liga [297]. Toda troca de VIEW põe o último ponto no centro da área (76F0: `x1 + (largura + 1) \ 2`) e refaz a escala do WINDOW.
- `WINDOW` (B$WIND 017D:9EEF; sem argumentos B$WIN0 017D:9F70): cantos guardados em DOUBLE e ordenados (x1 < x2, y1 < y2). [294] = WINDOW ligado, [295] = WINDOW SCREEN.
- Escala (017D:A0B5): fator x [740] = [65d] / (x2 − x1), calculado no x87 com 64 bits e gravado em DOUBLE; o inverso [730] = 1 / (valor estendido). [65d] é `x2 − x1` do VIEW comum. Depois de um VIEW SCREEN, [65d] é a largura da tela inteira menos 1: **com VIEW SCREEN o WINDOW se espalha pela tela toda e o VIEW só recorta** (sonda: VIEW SCREEN (50,20)-(590,170) + WINDOW SCREEN (0,0)-(100,100) dá PMAP(50, 0) = 319). Sem WINDOW, a escala é 1 ((0,0)-(largura, altura) da área).
- Ponto com WINDOW (017D:9F83): STEP soma no último ponto lógico [242],[246], guardado em SINGLE. Pixel = FISTP((x − x1) · fator) + origem; no WINDOW cartesiano y = −FISTP((y − y2) · fator) + origem. FISTP arredonda ao par (palavra de controle 1332h), mas a conta é feita em precisão estendida com o fator já arredondado para DOUBLE. É isso que dá o "meio para baixo" do pedido R5: 639/640 em DOUBLE fica abaixo do valor exato, então 320 · fator = 319,4999999… e x = 320 cai na coluna 319. Num fator exato (0,5), o empate vai ao par (sonda, cena 14).
- Ponto sem WINDOW (017D:A1BD): FISTP de cada coordenada SINGLE (2,5 → 2, 3,5 → 4); soma a origem, ou o último ponto em pixels se STEP. O BRUN45 usa só os 16 bits baixos do FISTP e soma em 16 bits: x = 70000 vira 4464.
- Valor além de 32 bits no FISTP: num 8087 de verdade seria exceção (a palavra de controle 1332h não mascara "operação inválida"); no DOSBox-X do oráculo não há exceção e o FISTP grava 80000000h, cujos 16 bits baixos valem 0 (sonda, cena 19: WINDOW SCREEN (0,0)-(1,1) e x = 4.000.000 vai para a coluna 0). O RT45GFX segue o oráculo, como já se faz com 1/0 (`docs/RETRADUCAO.md`, "Ponto flutuante").
- Ao ligar um WINDOW, o último ponto lógico vem do último ponto em pixels pela escala inversa (017D:A0FB), para o STEP seguinte.
- PMAP (017D:A1E4): 0/1 = mesma conversão do ponto, sem a origem do VIEW; 2/3 = pixel arredondado → lógico pela escala inversa.

### Cor

B$LINE (017D:B978) troca −1 pela cor corrente e passa a cor ao driver ([9ab]). Só o byte baixo conta. CGA 640x200 (017D:89B2): qualquer valor diferente de 0 acende, então 256 apaga. EGA (017D:8E1E): acima de 15 vira 15. PRESET sem cor usa 0. CIRCLE com cor < −1 dá erro 5 (017D:99A2); LINE e PSET aceitam.

## LINE (B$LINE 017D:2DE4)

Primeiro ponto (ou o último ponto, em `LINE -(x,y)`), segundo ponto, estilo [252] e cor. O último ponto passa a ser o segundo.

- Recorte (017D:2EC7): Cohen–Sutherland com o código de 017D:B906 (1 esquerda, 2 direita, 4 acima, 8 abaixo). A ponta que está fora vai para a borda (017D:2F24): na borda x = b, `y = py + q·(b − px) + R`, com q e r o quociente e o resto (truncados) de (qy − py) / (qx − px), em 16 bits, e R = (v + 1) \ 2 para v ≥ 0 ou piso(v / 2) para v < 0, onde v = trunc(2r(b − px) / (qx − px)). Na borda y, o mesmo com x e y trocados. A divisão (017D:2F5A) dá erro 6 (Overflow) quando os bits do dividendo passam os do divisor em mais de 14: uma reta de (320,20) a (100000,100000) dá erro 6 no original.
- Traçado (017D:2FD7 e os passos do driver: CGA 017D:8CEA/8D53/8D95, EGA 8ECD/8F0F/8F39): começa na ponta da esquerda (empate: a primeira ponta depois do recorte). Eixo maior x (|dy| < dx): erro inicial 4|dy| − dx; a cada pixel, erro < 0 → erro += 4|dy|; senão erro += 4|dy| − 4dx e um passo em y. Eixo maior y: o mesmo com x e y trocados; vertical à parte. O pixel do passo k fica em piso(k · menor / maior + 3/4), e não no arredondamento ao meio do Bresenham comum: é a diferença de um pixel do pedido R6.
- Estilo: a cada pixel o bit 15 de [252] decide se acende, e [252] gira um bit para a esquerda. Bits 0 deixam o pixel como está. O estilo continua de uma reta para a outra dentro do mesmo comando (os 4 lados do B) e começa no primeiro pixel depois do recorte. No fim do comando volta a FFFFh.
- B (017D:2E37): quatro retas, nesta ordem: (x1,y2)-(x2,y2), (x1,y1)-(x2,y1), (x2,y1)-(x2,y2), (x1,y1)-(x1,y2), cada uma recortada.
- BF (017D:B872): preenche a caixa presa ao recorte (017D:B928). O teste de "caixa toda fora" (017D:B8E0) compara com sinal (JL), mas o retorno usa o CF dessa comparação: uma caixa toda à esquerda ou acima de um VIEW que começa em 0 (coordenadas negativas) não é rejeitada e sai como uma faixa presa na borda. Ex.: `LINE (-10,-10)-(-5,-5), , BF` acende o pixel (0,0). A sonda confirma.

## PSET e PRESET (B$PSET 017D:309A, B$PRST 017D:30EB, com cor 017D:306B)

Converte o ponto (que vira o último ponto) e acende o pixel se ele estiver dentro do recorte (017D:B98B). PRESET sem cor usa a cor 0.

## CIRCLE (B$CIRC 017D:9990; aspecto B$CASP 017D:9949, início 017D:9920, fim 017D:992B)

- Raio em pixels = FISTP(raio · fator x do WINDOW); acima de 32767 dá erro 6; raio negativo, erro 5.
- Aspecto (B$CASP): acima de 1 vira 1/aspecto e liga o indicador 1 (o raio dado vale no eixo y). Guardado em ponto fixo 8.8: FISTP(a · 256), só o byte baixo (exceto 256). Sem aspecto, o valor da tabela do driver ([99b]): SCREEN 2 = 107 (0,418), SCREEN 9 = 187 (0,730).
- Contorno (017D:9B58): ponto médio com x = 0, y = raio, d = 1 − raio; a cada passo, d < 0 → d += 2x + 3; senão d += 2(x − y) + 5 e y −= 1; x += 1; para quando x ≥ y (depois de desenhar). A cada passo, 8 pontos (017D:9BA3), com o eixo menor escalado por A(v) = (aspecto·v + 128) \ 256. Sem o indicador 1: (y, −A(x)), (−x, −A(y)), (−y, A(x)), (x, A(y)), (x, −A(y)), (−y, −A(x)), (−x, A(y)), (y, A(x)), nesta ordem. Cada pixel é recortado pelo VIEW.
- Arco (017D:9AD7 e 9C2E): o contorno tem 8 oitavos de [25a] = FISTP(raio · √0,5) passos. A posição de um ângulo a é oct = FIX(a · 4/π), q = (oct + 1) \ 2 e pos = 2q·[25a] ± raio·|SIN a| (q par) ou |COS a| (q ímpar), + quando oct é par. Cada ponto desenhado tem a posição base + x (4 primeiros) ou base − x (4 últimos). Desenha os pontos com posição entre início e fim; se fim < início, os de fora. Ângulo negativo: a primeira vez que o contorno passa pela posição daquela ponta, traça o raio até o centro (com o recorte da LINE) em vez do pixel. Ângulo acima de 2π dá erro 5.
- O último ponto fica no centro.

## GET e PUT (B$GGET 017D:2C86, B$GPUT 017D:2D42)

Os cantos passam pela mesma conversão de pontos. A cópia dos bits é a do QB64 (já conferida no piloto); só os cantos mudam. `RT_GCAIXA` calcula os cantos em pixels (caixa ordenada) e desliga o VIEW e o WINDOW do QB64 para o GET seguinte; `RT_GPONTO` faz o mesmo para o PUT; `RT_GFIM` religa o que o RT45 guardou. PUT cujo canto de baixo à direita fica fora do VIEW dá erro 5 no original (017D:2DA2); por isso `RT_GPONTO` mantém o VIEW do QB64 ligado (canto relativo à origem do VIEW comum) e só desliga o WINDOW, e o QB64 dá o mesmo erro (sonda, cena 20). No WINDOW cartesiano o original lê e escreve as linhas de baixo para cima; o SISTRUT não usa GET/PUT nesse caso (NÃO TESTADO).

## Uma armadilha do QB64 na reprodução

`IF d > 0.5 THEN` com `d AS _FLOAT` compara em SINGLE no QB64 (a regra 6 de `docs/RETRADUCAO.md`): 0,49999999999999289 vira 0,5 e o arredondamento erra justamente nos empates do WINDOW. No `RT45GFX` toda constante comparada com valor estendido leva `##`.

## O que não está coberto

- Hercules (SCREEN 3): o oráculo não tem a placa; a cor e o aspecto (165) vêm da tabela do driver, sem conferência.
- `CLS` em modo gráfico também põe o último ponto no centro no original; o RT45GFX só vê SCREEN, VIEW e WINDOW (pedido em `PEDIDOS.md`).
- PAINT, DRAW e POINT não aparecem nos programas (`rt/freq.json`).

## Arquivos

- `src-original/comum/RT45GFX.BI`, `RT45GFX.BM`: estado e rotinas.
- `gera_sonda.py`: gera as sondas (QB4.5 para o oráculo, QB64 com RT45GFX) a partir das mesmas DATA.
- `compara_gfx.py`: compara os despejos e os textos; `roda.sh`: gera, compila, roda e compara.
- `stubs_rt45.bm`: rotinas que o tradutor gera por programa, vazias, para o teste compilar com o RT45.
- Casos do oráculo: `$ORACULO/casos/retrad_gfx_s1.txt` e `retrad_gfx_s2.txt` (fontes QB4.5 em `.dados/`).
- `PEDIDOS.md`: o que o tradutor e o RT45 precisam mudar.
