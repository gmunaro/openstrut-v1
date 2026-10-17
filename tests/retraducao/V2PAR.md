# Casos v2par (T10 da paridade da OpenStrut V2 com o SISTRUT 4.0)

Casos novos do oráculo para a V2 ter referência onde os casos a, b, c e `retrad_*` não chegam (plano em `PLANO.md` da pasta de paridade da V2, fora do repositório, linha T10 da seção 5.3 e defeitos R2, R3, R5, R6 da seção 4.2). Cada caso:

- roteiro: `tests/retraducao/<família>/v2par_<caso>.sufixo.txt` (começa no menu do módulo; a 1ª linha `# modulo: LAJE` ou `# modulo: VIGA` indica entrada por outro módulo); o caso do oráculo `$ORACULO/casos/v2par_<caso>.txt` é o cabeçalho + entrada pelo gerenciador + o sufixo, e a obra de partida, quando há, está em `$ORACULO/casos/v2par_<caso>.dados/`;
- resumo do run e da comparação: `tests/retraducao/<família>/v2par_<caso>.resultado.md`;
- valores de referência (formato de `paridade/README.md` do comparador V2): `oraculo-novos/v2par_<caso>.json` da pasta de paridade da V2 (fora do repositório).

## Como foi rodado

- Oráculo: `ORACULO_BASE=/orig/instalado ORACULO_RELOGIO=congelado ORACULO_DATA="2026-10-14 12:00:00" bash rodar.sh casos/v2par_<caso>.txt "" 1500`, no máximo 3 contêineres ao mesmo tempo. O executor só aceita `ORACULO_DATA` no formato `AAAA-MM-DD HH:MM:SS`; essa data dá `DATE$` = `10-14-2026`.
- Fim dos roteiros: `{F2}{ENTER}` volta ao gerenciador e `{F2}` sai. O log registra "DOSBox-X terminou (programa saiu), codigo 0", mas o `rodar.sh` devolve 3 com "roteiro completo: nao": o F2 final é atendido pelo `ON KEY` e o programa sai antes de o KEYFEED ver a tecla consumida. É o mesmo do caso de referência `retrad_sis_onkey`. Todas as telas até a última pergunta estão gravadas. `pilar_niveis` e `pilar_trava` terminam sem sair (roteiro completo: sim).
- V1 nova: os 28 `src-original/*/*.BAS` da main 75cbbab compilados sem regenerar (`tools/qbcompile.sh`) em `build/v2par-bin` (ignorado pelo git); C: = `.INI`/`SISTRUT.*` da instalação do oráculo em `SISTRUT/EXEC40`, `SISTRUT/SISTRUT.INI` do INSTALAR e a obra de partida; `tools/roda_retrad.sh build/v2par-bin <EXE> <sufixo> <saída> <C:>`; comparação `tools/compara_retrad.py <run do oráculo> <saída> --obra <C:>`. Rodar a V1 em paralelo não é seguro (arquivos de troca do CHAIN em `%TEMP%`).
- Rodada do v1-difs (15/10/2026): os 28 programas regenerados (`tools/regenera.sh src-original`) e compilados com o `src-original/comum` do v1-difs, mesmo C: e mesma comparação; os 17 casos, um de cada vez. Números na coluna "V1 nova × oráculo" (os casos sem menção ficaram com os mesmos números de antes).
- Scripts usados (fora do repositório): `oraculo-novos/_ferramentas/` da pasta de paridade da V2 (`mk.sh`, `oraculo.sh`, `v1.sh`, `lote2.sh`, `extrai_v2par.py`, `casos_v2par.py`, `lajinfo.py`).

## Casos

| caso | item da T10 | o que exercita | run do oráculo (`$ORACULO/runs/`) | V1 nova × oráculo | valores |
|---|---|---|---|---|---|
| laje/`v2par_laje_livre` | 1 laje com bordo livre | 2 lajes 4 × 5 com o bordo y = 5 sem viga (código 1) | `v2par_laje_livre-20261015-162737` | igual (46/47; só FRE) | 122 |
| laje/`v2par_laje_balanco` | 2 laje em balanço | interna 4 × 5 + balanço 4 × 1,5 com 3 bordos livres | `v2par_laje_balanco-20261015-162752` | igual (46/47; só FRE) depois do v1-difs; antes 45/47 (As+ do balanço, item 1 abaixo) | 115 |
| laje/`v2par_laje_umadir` | 3 uma direção (ly/lx 2,5) | 2 lajes 3 × 7,5 contínuas; μ 0,55 | `v2par_laje_umadir-20261015-162808` | igual (46/47; só FRE) | 136 |
| laje/`v2par_laje_assim` | 4 vínculos assimétricos; 5 otimização que muda o coeficiente | planta em T, 4 lajes; L3 lado 3 22 → 16, L4 lado 1 22 → 15 | `v2par_laje_assim-20261015-163200` | igual (46/47; só FRE) | 264 |
| laje/`v2par_laje_otim` | 5 otimização (R3, sem travar) | 6 × 6 ao lado de faixa 1,8 m; coeficiente vai de 2,0 ao piso 0,30 | `v2par_laje_otim-20261015-163215` | igual (46/47; só FRE) | 136 |
| laje/`v2par_laje_r3` | 5 R3 (otimização não converge) | a mesma obra com Mneg/Mpos mínimo 0,35: laço infinito | `v2par_laje_r3-20261015-164300` | igual (28/28, roteiro completo) depois do v1-difs; antes o F2 não tirava a V1 do laço (item 4) | 56 |
| laje/`v2par_laje_r2` | 6 R2 (lado do vizinho com o mesmo número) | L1 lado 3 ↔ L2 lado 3; negativa # 6.3 c/10 atende só a L2 | `v2par_laje_r2-20261015-163144` | igual (43/44; só FRE) | 120 |
| laje/`v2par_laje_cargas` | 7 cargas por área e alvenarias até o .VIG (e .REP) | 2 áreas de ocupação sobrepostas, alvenaria sobre viga e sobre laje; LAJEMONT + VIGA 7 | `v2par_laje_cargas-20261015-164316` | igual (65/66; só FRE) | 283 |
| viga/`v2par_viga_fluxo` | 8 viga com balanço e carga indexada no fluxo; R5 | balanços de 4 m com a V5 apoiada nas pontas; .REP com −1,67 + 1,66 = −0,01 | `v2par_viga_fluxo-20261015-164332` | igual nos números (66/71: FRE e a seta que pisca por TIMER em v02a/v02c) depois do v1-difs; antes 65/71 (f*EJ "-0.00", item 2) | 259 |
| viga/`v2par_viga_r6` | R6 (percentual de acidental gerada sem validação) | opção 8 aceita 150 %; acidental 3,0 > total 2,0 t/m, reações mínimas negativas | `v2par_viga_r6-20261015-184612` | igual (7/7) | 56 |
| pilar/`v2par_pilar_mk` | 9 Mk ≠ 0 | 20 × 30, 3 conjuntos com Mk inicial (reta e oblíqua) | `v2par_pilar_mk-20261015-170447` | igual (10/10) | 97 |
| pilar/`v2par_pilar_lambda` | 10 λ > 80 | caso c com le 5, 6/3 e 4,8 m (λ 87, 104, 83) | `v2par_pilar_lambda-20261015-164824` | igual (10/10) | 109 |
| pilar/`v2par_pilar_niveis` | 11 vários níveis | P5 com 4 níveis, carga em 3 níveis, armadura por lance | `v2par_pilar_niveis-20261015-164933` | igual (14/14) | 204 |
| pilar/`v2par_pilar_trava` | achado (fora da lista) | PILAR opção 6 não termina uma flexão oblíqua | `v2par_pilar_trava-20261015-171708` | igual (6/7, roteiro completo; t01 = fase do "Aguarde" que muda de cor, item 4) depois do v1-difs; antes sem comparação | 28 |
| desenho/`v2par_des_3tramos` | 12 DESDIM/DESENHO 3 tramos | V1 da obra ASS (3, 5, 4 m), 20 × 50, + resumo de consumo | `v2par_des_3tramos-20261015-165027` | igual nos números (30/31; d09 = marca) | 128 |
| desenho/`v2par_des_2tramos` | 12 DESDIM/DESENHO 2 tramos | V5 da obra ASS (4, 5 m), 15 × 45, + resumo | `v2par_des_2tramos-20261015-165207` | igual nos números (28/29; d09 = marca) | 96 |
| desenho/`v2par_des_especial` | pedido do orquestrador: seção T, armadura dupla, aço A, balanço nos dois lados, concentrada perto do apoio, fissuração e flecha estádio II com deformação lenta, envoltória de acidentais | viga D1 digitada no VIGA e detalhada com o V2P.DSP | `v2par_des_especial-20261015-171646` | igual nos números (33/35: FRE e d09 = marca) depois do v1-difs; antes 32/35 (DSX.SEC, item 3) | 159 |

"FRE" = "Acesso ao DOS ( n Kbytes livres )" do LAJEGRAV/VIGA, a diferença conhecida.

## Diferenças da V1 nova: causa e correção (branch `v1-difs`, 15/10/2026)

As 4 diferenças que estes casos mostraram eram da V1. Correções no RT45 (todas as famílias), no tradutor e na tabela `CORRECOES` do `tools/retraduz.py`; detalhes em `docs/RETRADUCAO.md` ("Ponto flutuante", regras 9 e 10; "ON KEY pelo roteiro"; "Mudanças do RT45", v1-difs).

1. **LAJECALC, laje em balanço** (`v2par_laje_balanco`). Causa: RT45 (semântica do `^` e do `SQR`). Com M+ ≤ 0 a flexão (`GOSUB L_14312`, LAJECALC 0x14317) calcula `X − SQR(X^2 − 0)`. No original o `^` é o B$POW4 do BRUN45, que calcula por logaritmo (FYL2X, FRNDINT, F2XM1, FSCALE, em 64 bits de mantissa, sem caso especial para expoente inteiro), e `X^2` não é `X * X`: aqui `X − SQR(X^2)` dá um positivo minúsculo, a seção passa (x ≥ 0 e x > 0) e o `MAIOR` com a armadura mínima dá 1,50 nas duas direções. Na V1 o `^` era o `powl` do QB64 (`X^2` exato) e o `SQR` do QB64 calcula em double: o resultado saía negativo e virava −1 ("seção não passa"). Correção: `RT_POT##` repete a sequência do B$POW4 e `RT_SQR##` usa FSQRT em long double (`src-original/comum/RT45X87.h`). Desde 16/10/2026 o FYL2X e o F2XM1 são o modelo fixo em software que a V2 usa (log2 interno de 68 bits do Zen 2 e F2XM1 exato), não as instruções do processador. Conferido na sonda `tests/retraducao/QB45_T20.BAS` (1.558 de 1.560 campos iguais bit a bit; os dois restos de `x^1.5` vêm do F2XM1 do Zen 2; com as instruções do hardware eram 1.560) e no caso: 46/47 (só FRE).
2. **VIGA, f*EJ** (`v2par_viga_fluxo`). Causa: RT45 (formato de −0). O valor do tramo com M+ = 0 é −0 nos dois lados; o PRINT USING do QB4.5 escreve −0 como " 0.00" e o do QB64 como "-0.00". Um negativo que arredonda a zero sai "-0.00" nos dois (sonda T20, linhas U1 a U4). Correção: `RT_PU#` devolve +0 para zero de qualquer sinal. Caso: 66/71 (3 FRE, a seta que pisca por TIMER em v02c, a tela v02a passou a bater nesta rodada); impressora igual.
3. **DESENHO/DESDIM, .SEC** (`v2par_des_especial`). Causa: leitura errada do desassemblado (o lift). Bf e Hf de cada seção são `(i > 0) * (i < n + 1) * b` (DESENHO 0x38ebb, 0x38f11, 0x3942a, 0x39480; quem grava o .SEC é o DESENHO, não o DESDIM). O `.asm` converte cada comparação com B$FIL2 e multiplica no x87 (FMULP): no balanço `0.0 * -1.0 = -0` e o original grava −0. O lift mostra um produto de INTEGER e a V1 fazia a conta em inteiro (+0). São os únicos produtos de duas comparações nos 27 EXE; o BC 4.5 do qb40, com o mesmo texto, faz IMUL e dá +0 (sonda `QB45_T21.BAS`), então a forma do fonte original não se reconstrói pelo texto do lift. Correção: os 4 endereços na tabela `CORRECOES` (linhas `lift:` com `CSNG` em cada comparação). Caso: 33/35 (FRE e d09 = marca); DSX.SEC igual byte a byte.
4. **ON KEY durante laço sem leitura de teclado** (`v2par_laje_r3`, `v2par_pilar_trava`). Causa: RT45 e tradutor. Os módulos foram compilados com /V: há `CALL B$EVCK` no início de cada comando, e o BRUN45 atende o ON KEY ali. A V1 só atendia depois das leituras de teclado. Correção: o tradutor põe `IF RT_ROT_ATIVO THEN RT_EVCK` e o desvio do ON KEY antes de cada salto para trás (GOTO, IF ... GOTO, NEXT), e `RT_EVCK` entrega a tecla presa seguinte do roteiro como o KEYFEED (sem leitura e tela parada há 0,3 s; no máximo 10 s), gravando antes as `{TELA}` pendentes. Casos: `v2par_laje_r3` 28/28, roteiro completo (o F2 volta ao LAJE e o roteiro sai pelo gerenciador); `v2par_pilar_trava` 6/7, roteiro completo (o F2 mostra "Erro de Operacao"); a única diferença é o atributo da linha 16 na tela t01: o laço escreve "Aguarde ..." alternando COLOR 4 e COLOR 3 (PILAR 0x34465 e 0x351b5) e no próprio oráculo t01 (0x73) e t02 (0x74) diferem; na V1 as duas telas são gravadas no momento da entrega do F2.

Diferenças que não são de cálculo: telas v02a/v02c do `viga_fluxo` (27 pixels da seta que pisca por TIMER no LAJEMONT, dependente do relógio real, como o k06 do calc2) e a tela d09 dos casos do DESENHO (cabeçalho com o nome do licenciado, cortado pela janela, que a tabela de marca do `compara_retrad.py` não troca).

## Achados sobre o original

- **R2 confirmado** (`v2par_laje_r2`): com o lado comum numerado 3 nas duas lajes, o LAJEPROC grava uma negativa # 6.3 c/10 (3,15 cm²/m) para a continuidade, suficiente para a L2 (As− 2,86) e insuficiente para a L1 (As− 4,70, que o LAJECALC arma com # 8.0 c/10). Como provocar: a numeração dos vértices segue a ordem em que os trechos de estrutura são desenhados (extremos e depois interseções) e cada polígono começa no vértice de menor número, no sentido horário.
- **R3 confirmado, mas só com parâmetro editado** (`v2par_laje_r3`): com o piso Mneg/Mpos mínimo de fábrica (0,30) a otimização sempre converge (varredura de larguras na V1: o código anda 22 → 7 → 6 → 5 e para no piso; 0,35 em SINGLE é 0,3499999940 e CINT(5,4999999) = 5). Com o piso 0,35 (LAJECALC 7, item 6) o laço é infinito: tela "Relacao Mneg/Mpos da Laje L1 alterada para .35 .. Aguarde" igual aos 30 s e 60 s, com Mneg/Mpos gravado 0,30.
- **R6 confirmado na metade da tela** (`v2par_viga_r6`): o percentual de acidental gerada é validado com `VAL > 96 AND VAL < 4` (nunca verdadeiro), e a opção 8 do VIGA aceita 150 %. A viga de 2 tramos com 2 t/m fica com acidental 3 t/m, permanente −1 t/m e reações mínimas −2,65 / −5,68 / −2,51.
- **R5 exercitado** (`v2par_viga_fluxo`, `v2par_laje_cargas`): parcelas truncadas no .REP (V3 R = 1,67 → 1,66; V4 4,86 → 4,85; V1 7,47 → 7,46; P4 = −1,67 + 1,66 = −0,01). Os JSONs marcam essas parcelas com `"trunca": true`.
- **Novo: PILAR opção 6 trava em alguns casos de flexão oblíqua** (`v2par_pilar_trava`): seção 20 × 30, 2 + 2 φ16, Nk 20, Mxk 0,8: o caso 2 (inclinação 27°) não termina; também Nk 30 com Mxk 1,0 e Myk 0,6 (21°) e Nk 30 com Mxk 0,8 (37°). A V1 nova trava igual (100 % de CPU por mais de 5 min). Terminam: 15°, 18°, 22°, 53°, 61°, 72°.
- O DESDIM não imprime fissuração: ela só aparece nas janelas "Fissura(n)" da tela, e só quando a verificação falha (`v2par_des_especial`, limite 1). A flecha (inércia fissurada e deformação lenta) é impressa.
- Laje em balanço: M+ 0,00 e M− negativo (−0,56); laje de uma direção não tem regra própria (μ 0,55 pela tabela).

## Inviáveis ou parciais

- **R6, metade do VIGA.INI** (fator de redução dos negativos lido como MIN(VAL/100; 15), sem piso): sem caso. Só muda número com o VIGA.INI editado à mão; ele vem da instalação oficial (`/orig/instalado`), o executor recria o C: a cada run e o `.dados` vai para a raiz, não para `C:\SISTRUT\EXEC40`. A tela (opção 8, item 1) recusa valores fora de 10 a 100 %. A outra metade do R6 tem caso (`v2par_viga_r6`).
- **R3 com os parâmetros de fábrica**: não é provocável (ver acima); o caso usa o piso 0,35 digitado na tela de parâmetros do LAJECALC.
- **Fissuração impressa**: o original não imprime; o caso traz os valores da tela.

## Rodada 2 (T10b, prefixo `v2par2_`)

Mesmo esquema da rodada 1, com estas diferenças:

- Roteiros em `tests/retraducao/<família>/v2par2_<caso>.sufixo.txt`, resumos em `v2par2_<caso>.resultado.md` e valores em `oraculo-novos2/v2par2_<caso>.json` da pasta de paridade da V2 (fora do repositório).
- V1 testada: HEAD do branch `v1-difs` (bb577e6). Os 28 EXE foram compilados com `tools/qbcompile.sh` do v1-difs em `build/v2par2-bin` (ignorado pelo git) e rodados com o `roda_retrad.sh` e o `compara_retrad.py` do v1-difs.
- O `obra/` de cada run tem todos os arquivos que o original criou ou alterou (.LAJ, .BAK, .VIG, .RLP, .REP, .SEC, .FOR, .TAB, .COL, conforme o caso). Nenhum caso grava `.PIP`: nenhum programa escreve esse arquivo. O PILAREDI só o lê (`OPEN ... ".PIP" FOR INPUT`, PILAREDI.BAS:1953), e um .PIP diferente só existe se for editado à mão (EDITOR do gerenciador, que avisa "As parametrizacoes SISTRUT .DSP .LAP .PIP nao devem ser alteradas") ou trazido no `.dados`, como o V2Q.DSP do `viga_varios`.
- Scripts (fora do repositório): `compila_v1b.sh`, `mk2.sh`, `oraculo2.sh`, `v1b.sh`, `lote3.sh`, `casos_v2par2.py`, `resumos2.py` e o mesmo `extrai_v2par.py`, agora com os dois dicionários de casos.

| caso | item da T10b | o que exercita | run do oráculo (`$ORACULO/runs/`) | V1 (v1-difs) × oráculo | valores |
|---|---|---|---|---|---|
| pilar/`v2par2_pilar_rig` | 1 momento de viga, rigidez lida S | obra E2E inteira (LAJE → VIGA 7 → DESENHO 1 → PILAREDI); P7 e P1 (canto), P8 (extremidade), 25 × 40, nível FUND–PAV1, momentos do E2E.REP com a rigidez das vigas do E2E.SEC | `v2par2_pilar_rig-20261016-045352` | igual (103/107; só FRE); impressora e os 9 arquivos da obra iguais | 664 |
| pilar/`v2par2_pilar_def` | 1 o mesmo com "Defino seção" N | "Prossigo com a Leitura" N e "Defino secao para as Vigas" N | `v2par2_pilar_def-20261016-045408` | igual (104/108; só FRE) | 664 |
| pilar/`v2par2_pilar_var` | 2 variação de armadura | coluna PA de 5 níveis; "Vario" N; Redefine recusado (4 # 10) e aceito (6 # 16); depois "de 2 em 2" | `v2par2_pilar_var-20261016-050733` | igual (12/13; só FRE) | 264 |
| pilar/`v2par2_pilar_col` | 3 .COL variado | C1 retangular girada 30° com troca de seção no PAV2 e excentricidade Ex 5/Ey 3, Rx livre no PAV1, vento com Ma e Mb; C2 circular D 40; C3 poligonal de 6 vértices, do PAV1 ao COB | `v2par2_pilar_col-20261016-050750` | igual (16/17; só FRE) | 212 |
| laje/`v2par2_laje_tipos` | 4 lajes | L1 em L; L2 com μ = 1; L3 tipo 3 com relação 0,7; L4 pré-moldada a 90°; L5 rebaixada −10 (segundo grupo); coeficiente 1,2 digitado no LAJECALC 1, sem otimização; P5 pilar-parede com alvenaria; cruzamento sem pilar em (8,4) com "Vx apoia em Vy" | `v2par2_laje_tipos-20261016-050324` | igual (56/58: FRE e os 27 pixels da seta TIMER do LAJEMONT) | 263 |
| desenho/`v2par2_viga_varios` | 5 vigas; 6 cortante acima do limite | VIGA 8 (acidentais S, Mext S, reações Máximas), VA com engaste nas duas pontas, Mext 1 e −0,8 e J 1,5/1,0; VB e VC; VVR.REP com máximas; DESENHO com V2Q.DSP (6 grupos de bitolas, fissuração classe 2), VB com o apoio 1 alterado para φ16 e 3 repetições, VC (15 t/m em 20 × 40) com "Continuo" N; resumo de consumo | `v2par2_viga_varios-20261016-053752` | igual (31/32; só FRE); impressora e VVR.VIG/.REP/.SEC/.FOR/.TAB iguais | 350 |

### Diferenças da V1 (v1-difs) na rodada 2

Nenhuma. Nos 6 casos, a impressora e todos os arquivos da obra são idênticos byte a byte; as telas diferem só no FRE ("Acesso ao DOS ( n Kbytes livres )") e nos 27 pixels da seta que pisca por TIMER no LAJEMONT.

### Achados sobre o original (rodada 2)

- **Rigidez das vigas** (`pilar_rig` × `pilar_def`): mesma carga (P7 Nk 2,57; P8 6,31), momentos iniciais diferentes. Com a rigidez lida do .SEC, P7 Mkx/Mky = −0,33/0,78 e P8 Mky = 2,23. Sem rigidez ("Defino seção" N), −0,64/1,22 e 3,48. P1 é o espelho do P7 (Mky −0,78 e −1,22). O E2E.COL também muda (1.669 contra 1.646 bytes).
- **Redefine recusado não imprime nada** (`pilar_var`): com 4 # 10 insuficiente, o PIPROEDI volta à janela do Redefine sem linha na impressora. Só o arranjo aceito (6 # 16) gera relatório. Numa sondagem fora do caso final, 4 # 6.3 foi aceito com taxa 0,12 % e estribo "# 0 c/ 0".
- **Laje tipo 3 descarrega no pilar-parede** (`laje_tipos`): a sub-área 6 da L3 (6 m²) vai para o P5 (1,50 t/m na tabela), e "ALVENARIAS SOBRE OS PILARES" mostra P5 2,40. O total aplicado nos pilares é 5,40 t.
- **Pré-moldada** (`laje_tipos`): a L4 (fluxo a 90°) descarrega só na V2 e na V3. O peso próprio dela entra como carga de estrutura (Estru 0,70 = 0,35 t/m² × 8 m² / 4 m), não na coluna Peso (0,00). Os totais fecham (painel 77,20 t).
- **Viga em dois grupos** (`laje_tipos`): no LAJEMONT, a V6 aparece como "1( 1a)" e "1( 2a)", um trecho por grupo de lajes (a L5 rebaixada forma o 2º grupo). No JSON, o id do 2º trecho é `V6.t1.2a.ppViga`.
- **LAJEPROC** (`laje_tipos`): o desenho cobre x de 0 a 12 m; a L3 (x 12..16) e a L4 (pré-moldada) ficam sem rótulo. A única negativa desenhada é a L1–L2 (# 6.3 c/12.5).
- **Ordem das perguntas do DESENHO**: "A Face Superior dos Tramos esta Alinhada" não é perguntada em viga de um tramo sem rebaixo; "Paro para visualizacao" só aparece quando a impressão de esforços ou de armação é N.
- **Parcela inteira do .REP perde dígitos** (`viga_varios`, novo): VIGA.BAS:2501 e 2506 formatam cada parcela com `MID$(STR$(x), 1, INSTR(STR$(x), ".") + 2)`. Quando o valor é inteiro, `STR$` não tem ponto e sobram o sinal e o 1º dígito. A VC (reação 30,00, MEP −20) grava no VVR.REP `*3 (VC) +` e `>-2@1 [4]  (VC) >` para P8 e P9, embora o total da linha `P   8` seja 30.00. O PILGEEDI lê as linhas `>` dos momentos (PILGEEDI.BAS:626-646), então um pilar que use esse .REP recebe −2 no lugar de −20 (não rodei esse caminho). Inteiros de um dígito saem certos (o "6" do `v2par_laje_cargas`). A V1 grava igual. No JSON, essas parcelas ficam sem `trunca` e com uma observação.
- **"Continuo com o processamento" N** (`viga_varios`): o DESDIM imprime só o bloco de esforços da VC (como o da VB: sem as linhas de acidental, de máximos e de Mext) e pula a tabela de armação. A armação calculada (As 30,65 + 28,13 cm², 7 # 25 + 6 # 25, Vk 27,00* com estribos 26,42 cm²/m) fica só na tela; o JSON a traz com ids `des.VC.t1.*.tela`. A VC fica fora do VVR.TAB (só a VB) e do resumo de consumo, mas a seção 20 × 40 continua no VVR.SEC.
- **Altero a Armacao** (`viga_varios`): o apoio 1 da VB passa a 3 # 16 na impressão (As calculado 4,01); o apoio 2, simétrico, fica 4 # 12.5. Com a classe de fissuração 2, os apoios passam ("Ok", sem pergunta), e só a janela dos tramos pergunta "Modifico as Armaduras" (fissura 3,073 / 2,924 / 3,073). No resumo, a linha da VB mostra "rept 3" e os TOTAIS ficam perto de 3 × a linha, mas não exatamente (φ5: 416 contra 3 × 139 = 417; φ6.3: 28 contra 27; φ12.5: 134 contra 135). Provavelmente o total é somado antes do arredondamento; não verifiquei.
- **MEP e .REP** (`viga_varios`): o VIGA e o DESDIM imprimem "Momento Engastamento Perfeito apoio(0) −3.34 tm" na VB (2,5 t/m, vão 4 m: 2,5 × 4²/12 = 3,333), e o .REP grava −3.33 no P4. Não investiguei a causa; V1 igual.

### Correção na rodada 1

O `lajinfo.py` lia o par (ângulo, μ) do `A_1210` pelo índice da laje, mas o vetor é indexado pelo polígono. Isso só faz diferença quando a numeração das lajes e a dos polígonos divergem. Foram regerados dois JSONs da rodada 1: `v2par_laje_balanco` (L1 μ 1,6, L2 μ 0,8) e `v2par_laje_assim` (L2 μ 0,9, L3 μ 0,8). O `v2par_laje_cargas` também foi regerado, por causa da parcela inteira do .REP descrita acima: `REP.P2.carga.V2` ("6") perdeu `casas: 2` e `trunca` e ganhou a observação. Os outros 14 saem idênticos com o extrator atual.

### Inviáveis ou parciais (rodada 2)

- **.PIP no `obra/`**: não há caminho na interface que grave um .PIP (ver acima). Os casos de pilar usam o SISTRUT.PIP de fábrica.
- **"Grupos de bitolas 3 e 6"**: entendido como .DSP com 6 grupos (V2Q.DSP, no `.dados` do caso). O de 3 grupos é o SISTRUT.DSP de fábrica, já usado nos outros casos de DESENHO. O EDITOR do gerenciador abre o arquivo, mas avisa que as parametrizações "nao devem ser alteradas"; o V2Q.DSP foi preparado fora e trazido no `.dados`.
- **Acidentais "S" no VIGA.INI**: como na rodada 1, o VIGA.INI vem da instalação oficial e não é editável pelo executor. O VIGA só lê esse arquivo (VIGA.BAS:594, `FOR INPUT`). O caso liga as acidentais pela opção 8 do VIGA (item 2: S, F), que vale para a sessão e tem o mesmo efeito no cálculo e no .REP.
