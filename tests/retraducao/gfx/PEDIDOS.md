# Pedidos ao tradutor e ao RT45 (primitivas gráficas, `RT45GFX`)

As rotinas estão prontas e conferidas com o oráculo (`GRAFICO.md`). Para os programas usarem, o tradutor (`tools/retraduz.py`) precisa incluir os arquivos e trocar os comandos gráficos nativos pelas chamadas abaixo. Isso resolve os pedidos R5 e R6 da família VIGA (`viga/PEDIDOS-TRADUTOR.md`).

## G1. Incluir os arquivos

O `tools/retraduz.py` de trabalho já emite `'$INCLUDE: '../comum/RT45GFX.BI'` depois do RT45.BI e `RT45GFX.BM` depois do RT45.BM (22 dos 28 programas já saíram assim; FORMA*, VIGA ainda não foram regenerados). Conferido: VPLOTA, LAJEPROC e DESIMP compilam com os arquivos novos. `RT45GFX` usa do RT45 só `RT_MODO`, `RT_VW_T`, `RT_VW()`, `RT_WIN_T`, `RT_WIN()` e `FX##`; nada no RT45 precisa mudar. Os nomes novos começam por `RG_` e por `RT_LINE`, `RT_PSET`, `RT_CIRCLE`, `RT_PMAP!`, `RT_GCAIXA`, `RT_GPONTO`, `RT_GFIM`.

## G2. Trocar os comandos

Os argumentos são passados por referência. Coordenadas, raio e ângulos são SINGLE (como o B$N1R4 recebe): passe `RT_SNG!(expr)` ou a variável SINGLE; inteiro vai entre parênteses, `(x%)`. `f`, `cor` e `estilo` são INTEGER: literal, `CINT(...)` ou `(v%)`. A sonda só passou variáveis do tipo exato; a conversão de `(x%)` para o parâmetro SINGLE não foi conferida.

| original (lift) | QB64 |
|---|---|
| `LINE [[STEP](x1,y1)]-[STEP](x2,y2)[, [cor][, [B\|BF][, estilo]]]` (B$N1R4/N1I2, B$N2R4/N2I2, B$LINE) | `RT_LINE x1, y1, x2, y2, f, cor, estilo` |
| `PSET [STEP](x,y)[, cor]`, `PRESET ...` (B$PSET, B$PRST, PSET com cor) | `RT_PSET x, y, f, cor` |
| `CIRCLE [STEP](x,y), r[, [cor][, [início][, [fim][, aspecto]]]]` (B$CSTT, B$CSTO, B$CASP antes de B$CIRC) | `RT_CIRCLE x, y, r, f, cor, inicio, fim, aspecto` |
| `PMAP(v, n)` | `RT_PMAP!(v, n)` |
| `GET [STEP](x1,y1)-[STEP](x2,y2), m` | `RT_GCAIXA x1, y1, x2, y2, f: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), m: RT_GFIM` |
| `PUT [STEP](x,y), m[, ação]` | `RT_GPONTO x, y, f: PUT (RG_GX1, RG_GY1), m[, ação]: RT_GFIM` |

Bits de `f` (valores sem uso podem ir 0):

- 1 = LINE com o 1º ponto (sem ele, `LINE -(x,y)` parte do último ponto; x1, y1 são ignorados).
- 2 = STEP no 1º ponto (ou no único: PSET, CIRCLE, PUT).
- 4 = STEP no 2º ponto.
- 8 = tem cor (sem ele, a cor corrente; PRESET sem cor usa 0).
- 16 = B; 32 = BF; 64 = tem estilo.
- 128 = PRESET.
- 256 = CIRCLE com início, 512 = com fim, 1024 = com aspecto.

Exemplos:

```
LINE (a!, b!)-(c!, d!), 3, B, &H1111   ->  RT_LINE a!, b!, c!, d!, 1 + 8 + 16 + 64, 3, &H1111
LINE -STEP(5, 0)                       ->  RT_LINE 0, 0, 5, 0, 4, 0, 0
PRESET (x!, y!)                        ->  RT_PSET x!, y!, 128, 0
CIRCLE (x!, y!), r!, c%, 0, 3.1416, a! ->  RT_CIRCLE x!, y!, r!, 8 + 256 + 512 + 1024, (c%), 0, 3.1416, a!
```

## G3. CIRCLE: aspecto e ângulos se perdem hoje

O tradutor emite o aspecto e os ângulos como comentário (`' @12aa8 CIRCLE aspecto 16.438356 / V_14c4!`) e o CIRCLE sai sem eles (DESIMP, FORMIMP, FORMEDCA, FORMPLOT, PILAREDI, PIPROEDI, VIGA). No original são as chamadas B$CASP (índice 04), B$CSTT (0E, início) e B$CSTO (0D, fim) logo antes do B$CIRC; os valores precisam entrar nos argumentos de `RT_CIRCLE` (com os bits 256/512/1024). Sem isso o círculo sai com o aspecto padrão e completo (VIGA 0x27b65: meio círculo de 0 a 3,1416 com aspecto calculado).

## G4. CLS em modo gráfico (opcional)

No original, CLS também põe o último ponto no centro. `RT45GFX` acompanha SCREEN, VIEW e WINDOW pelo estado do RT45, mas não vê o CLS. Só importa para `LINE -(x,y)`/STEP logo depois de um CLS. Se aparecer, o RT45 pode chamar uma SUB `RG_CLS` (a escrever) no `CLS` gráfico.

## O que muda nas telas

- Com WINDOW, os pontos no meio de dois pixels caem como no original (R5: x = 320 do esquema da viga vai para a coluna 319).
- As retas inclinadas saem com o traçado do BRUN45 (R6).
- Círculos e arcos saem com o aspecto em 8.8 e as posições de início e fim do original.
- Os mesmos erros do original: reta muito longa recortada dá erro 6; CIRCLE com cor < −1 dá erro 5; ângulo acima de 2π, erro 5.
