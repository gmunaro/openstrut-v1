# Família ARMACAO (ARMADURA.EXE): retradução, casos e checklist dos livros U01/U02

## Quem chama e o que o ARMADURA lê

- Chamado pelo SISTRUT (item "Armacao" do gerenciador, `A{ENTER}`): `V_0dd4$ = "ARMADURA"` (SISTRUT 0x13ee0) e `CHAIN V_0ddc$ + V_0dd4$` (0x14349), depois de escrever na tela " Aguarde ...", "Leitura do Modulo ARMADURA" (linha 4) e "placa impressora serial pasta" (linha 5).
- Não tem COMMON com ninguém (`COMUM_ARMACAO` vazio, `common_familia.py armacao auto auto ARMADURA`). Faz `CLEAR` na entrada (0x1010c).
- Lê da tela a linha 5 (0x1044e..0x10508): placa, impressora, serial e a pasta dos EXE (coluna 17 em diante).
- Lê `<pasta>ARMADURA.INI` por posição de linha (0x1083a..0x10ffe) e faz `CHDIR` para o drive/pasta de dados do INI (0x11175). Não lê nem grava arquivo de obra: as seções ficam só na memória (máx. 20). Nos 8 casos o oráculo registrou "arquivos gravados/alterados em C:\: (nenhum)", e a V1 também não gravou nada.
- Volta ao gerenciador por F2: `RUN "C:\SISTRUT\" + "SISTRUT"` (0x1174f).
- Módulos do EXE: ARMADURA (0x1xxxx), ARMADAUX (0x2xxxx, SUBs do item 6 e das rotinas de limites/Vk/σs), NOM (0x30042) e MIXT.

## Geração

```sh
python -I tools/retraduz.py ARMADURA --familia armacao  # -> src-original/armacao/ARMADURA.BAS
bash tools/qbcompile.sh "$(cygpath -aw src-original/armacao/ARMADURA.BAS)" "$(cygpath -aw "$BIN")\ARMADURA.exe"   # BIN = pasta dos EXE da V1
```

Compila no QB64 PE 4.7.0 sem erro (3.494 linhas, 0 avisos; tradutor e RT45 do commit 6fe5644, com o gráfico RT45GFX). Regenerar reproduz o `.BAS` byte a byte. Único `'RETRAD?` é o de dado em 0x1af8e (bytes depois do fim do programa, F_1af88).

`src-original/armacao/correcoes.json`:
- Verificação de licença do original desativada (marcas PROTECAO), como no LAJE.
- Só isso: 13 entradas. Os contornos de 14/10 (A1 matrizes estáticas e A2 TAB no LPRINT USING, gerados por `gera_alias.py`; A3 `CLOSE`; A6 ON KEY dentro da SUB do ARMADAUX) saíram em 15/10, porque o tradutor passou a resolver os quatro (commit 9b33d44). `gera_alias.py` está fora de uso.

## Casos (oráculo `$ORACULO/casos/retrad_arm_*.txt`, sufixos aqui)

Entrada: `mkcaso.sh <nome>` monta o caso do oráculo (gerenciador → `A{ENTER}` → sufixo). `roda_casos.sh <bin> <trabalho> [casos]` roda na V1 e compara com a última execução do oráculo (`compara_arm.sh` → `tools/compara_retrad.py`). Disco C: = configuração da instalação oficial (`$SIS_C_BASE` + `$LAJE_C_E2E`, pastas preparadas à mão; ver o cabeçalho do `roda_casos.sh`); o ARMADURA não usa obra.

| caso | o que cobre | resultado |
|---|---|---|
| menu | menu; 1 Materiais (ENTER e valores, Fck 0 e aço C recusados); 7 Parâmetros (item 12 recusado, item 3); 8/3/5 sem seções; tecla inválida; 2 com posição inválida e saída pelo tipo | 24 telas + impressora (vazia): 25 iguais |
| secoes | 2 Arquivar: 6 seções (ret. com d ≥ H recusado e d padrão, Te, triangular, invertida, trapezoidal, circular) + bitola não padronizada e "Dados Corretos" N; 8 Lista; 5 Correções (posição inexistente, H, bitola recusada, item 12, circular: H recusado, diâmetro); 3 Processar (lista inválida, "1 A 6" tela a tela, "1/3/5 A 6" impresso) | 51 telas + impressora: 52 iguais |
| uma | 4 Cálculo de uma Seção: ret. tela a tela; circular (Fck 0.2, Fyk 0 recusado), Te, trapezoidal com aço A e invertida impressas; "Dados Corretos" N; FIM | 17 telas + impressora: 18 iguais |
| dim | 6 Dimensionamento: opção sem seção; ret. 20x50 Mk 5/15, Vk 10 (0 recusado), torção (cobrimento recusado); Te Mk 20/−20, Vk, Tk; triangular, invertida, trapezoidal (Bsup > e < Binf), circular: Mk, Vk, Tk | 42 telas + impressora (vazia): 43 iguais |
| dim2 | 6: Fck 0 e aço X recusados; aço A (x/d(3-4) = .628) Mk 7/9/12; aço B Mk 10.5 (faixa entre x/d(3-4) e x/d(lim)); Te com mesa comprimida e Bf negativo recusado; trapezoidal Binf = Bsup e circular D = 0 recusados; Vk na invertida | 16 telas + impressora (vazia): 17 iguais |
| param | Materiais em kgf/cm2 (mult. 0.001, Fck 150, Fyk 5000); Parâmetros 1..9 alterados (x/d(lim) .45, @1 .02, γ 1.5/1.6/1.2, kN 0.1, cm 0.01); 4 impresso; 2 + 3 impresso; 6 Mk/Vk/Tk nas unidades novas | 12 telas + impressora: 13 iguais |
| lista | 18 seções (Lista em 2 páginas), posição 21 recusada; 6 ramos (B = 70) e trapezoidal com Binf, Bsup < 40 logo depois (fica com 6 ramos); Twu com α = 0.5 e H/50 + 1/3; Processar na tela e impresso | 12 telas + impressora: 13 iguais |
| teclas | F1 (BEEP), Esc no Fck, na posição, no tipo, nas dimensões (MIXT), no menu e no Mk do Dimensionamento (ARMADAUX), F2 → gerenciador (precisa do SISTRUT.exe retraduzido na pasta dos EXE) | 9 telas + impressora (vazia): 10 iguais |

Impressora: secoes, uma, param e lista imprimem; `impressora.prn` comparado byte a byte. O ARMADURA não imprime data/hora. FRE: o único `FRE("")` (0x11df5) vai para `V_14ac!`, que não aparece em tela nem impressora; não há diferença de FRE nesses casos.

## Checklist do U01 (módulo ARMADURA)

As divergências do U01 comparam o original com a V1 antiga (`src-reconstructed`). Na retradução o código é o do original em cada endereço; a tabela diz o que os casos conferiram no oráculo.

| divergência | onde | conferido no oráculo |
|---|---|---|
| U01-001 tabela de Mk resistente (n = 2..N, 3 bitolas, ret. e T) | F_14b58 0x16290 | sim: secoes r01f..r06f, uma, lista; impressora |
| U01-002 ramo escoando divide por γf·γf | 9857 0x19b2d | sim com γf ≠ γc (param: 1.5/1.6), impressora igual |
| U01-003 domínio 4 por busca (recuo 3 cm, bisseção 0.0001, σs real) | 9857 0x19bf4 | sim: linhas marcadas `#` das tabelas |
| U01-004 tipos 3, 4, 5, 10 | 9857 0x19e1c.. | sim: secoes pos. 3-6, uma, lista (ATN sem quadrante não forçado) |
| U01-005 bitolas e áreas do INI | F_14b58 0x15fb2 | sim (DATA + INI, tabelas) |
| U01-006 N = CINT(MIN(20, MAX(4, ...))) | 0x16092 | sim (N = 4 a 8 nas tabelas) |
| U01-007 marcas `#` e `@` | 0x16302 | sim |
| U01-008 ψ por faixas de @1 | ace8 0x1ad00 | faixa 0.001..0.015 (padrão) e ≥ 0.015 (param); ≤ 0.001 não |
| U01-009 Vk resistente, área por tipo | ace8 0x1adbe | sim, os 5 tipos (r0Xc) |
| U01-010 s = 7.5..MIN(H/2, 30) | 0x172b8 | sim |
| U01-011 ramos 2/4/6; trapezoidal sem padrão | 0x16a14 | sim: 2, 4, 6 e a trapezoidal que herda 6 (lista r02c) |
| U01-012 Twu com α | 0x16ea5 | sim: α = 1, 0.5 e H/50 + 1/3 (lista, impressora) |
| U01-013 As(pele) e dc+10fi/dc+50fi | 0x15b1c, 0x15e3f | sim |
| U01-014 entrada da seção, d = H − 4, recusas | F_13130 0x13635 | d ≥ H, d vazio; recusas de Bf/Hf < 0 e trapezoidal no item 6 (dim2) |
| U01-015 escolha de bitolas, "BITOLA NAO PADRONIZADA" | 0x13bf4, GOSUB 40cc | sim (secoes s15..s17) |
| U01-016 seções só em memória | GOSUB 41da | sim (nenhum arquivo nos dois lados) |
| U01-017 menu de 8 itens | 1801 0x11893 | sim (texto, realce e atributos) |
| U01-018 Materiais sem gravar INI | 0x12092 | sim, com recusas |
| U01-019 Parâmetros, um item por vez | 894d | sim (itens 1-9, item 12 recusado) |
| U01-020 Processar: lista I/J/N a M, Imprimo, Dados Corretos | 0x14589, 147d0 | sim, inclusive lista inválida; "Dados Corretos" = N não |
| U01-021 Correção, 11 itens e recusas | 7beb | itens 1, 2, 6 e recusas (12, bitola, H na circular); 3-5, 7-11 não |
| U01-022 Lista em páginas de 17 | 8f3a/1902a | sim (2 páginas) |
| U01-023 INI por posição | 0x1083a | sim (valores do INI em todas as telas) |
| U01-024 F2 → gerenciador; Esc → menu de qualquer tela | 113f8 | sim (teclas) |
| U01-025 tela de erro 96cc | 0x196cc | não exercitado (nenhuma entrada do roteiro gera erro de execução no original) |
| U01-026 item 4 Cálculo de uma Seção | 0x17681 | sim (uma, param) |

## Checklist do U02 (módulo ARMADAUX)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U02-001 menu de 5 opções, opções 2-4 sem seção voltam | 0x200d6 | sim (dim d01, d02) |
| U02-002 Fck/Fyk/aço só em memória, recusas | 0x2051f | sim (dim2 e01, e02) |
| U02-003 5 formas | 0x208cb | sim |
| U02-004 dimensões numa linha, d = H − 4, recusas | 0x20d07 | sim: d ≥ H, Bf < 0, Binf = Bsup, D = 0 (dim2) |
| U02-005 laço do Mk, aviso do sinal, Mk negativo na Te | 0x2128b | sim (dim t03) |
| U02-006 faixas 1-4 da flexão | F_21607 0x21622 | faixa 1 (dim2 e10), 2, 3 (dim2 e08) e 4; aço A (dim2 e05..e07) |
| U02-007 armadura dupla com d' = H − d | 0x21b92 | sim (Asc em d09, t03, g02, c02, e14) |
| U02-008 formas não retangulares por busca | 0x21d9c | sim (g, i, z, y, c) |
| U02-009 cortante (ψ1, Ac por forma, sem τwu) | 0x22eee | sim (Vk nas 5 formas, Twd > τwu em dim2 e15) |
| U02-010 torção | 0x23170 | sim, inclusive Tk(lim) negativo e `%` no PRINT USING (trapezoidal Bsup > Binf) |
| U02-011 cabeçalho, coeficientes só fora do padrão | 0x238de | sim (param) |
| U02-012 VK(min)/VK(max)/@1 | 0x23d85 | sim |
| U02-013 x/d(3-4) truncado; x/d(lim) do INI | 0x24151 | sim (.462, .628, x/d(lim) .45 em param) |
| U02-014 Mk-limites e Mk(min) por forma | 0x2413f | sim |
| U02-015 σs(εs) | 0x25ab5 | indireto (faixas 3/4 e domínio 4 das tabelas); σs = −1 não forçado |

Pendências do U01/U02 que a retradução reproduz sem julgar (decisão do dono): divisor γf·γf (U01-002), H antigo na circular corrigida (secoes c10, lista mostra "Diam. 50" e d antigo), ramos herdados na trapezoidal, Tk(lim) negativo, Ase negativa possível, Materiais não atualiza o Fck de trabalho até o próximo Processar.

## Diferenças restantes

Nenhuma. Rodada final (15/10/2026, tradutor e RT45 até o commit 6fe5644 (RT45GFX, DATE$/TIME$ congelados, INKEY$ do roteiro corrigido), `correcoes.json` só com as marcas PROTECAO, relógio fixo 2026-10-14 12:00 nos dois lados, oráculo `runs/retrad_arm_<caso>-20261014-2023xx/2028xx`): 8 casos, 195 itens (telas com texto, realce e atributos, e `impressora.prn` byte a byte), 195 iguais. As rodadas anteriores (14/10 com contornos; 15/10 com o tradutor 351cde1) também deram 195/195. O ARMADURA não usa DATE$ fora de trecho desativado e nenhuma tela dos casos, nem a do gerenciador no caso teclas, mostra data ou hora; por isso as execuções do oráculo de 14/10 às 20h valem e não foram refeitas.

Diferenças vistas no caminho (14/10), todas resolvidas primeiro com contorno e depois no tradutor/RT45 (pedidos em PEDIDOS-TRADUTOR.md):
- tela "erro no processamento" ao escolher bitolas (erro 9): tradutor, matrizes estáticas (A1);
- impressão parando no primeiro `LPRINT USING` com TAB (erro 13): tradutor (A2);
- segunda impressão depois de voltar ao menu (erro 52): tradutor/RT45, `CLOSE` sem número (A3);
- `{F2}{ENTER}` levando o ENTER ao gerenciador: RT45, resolvido no commit 907bf8a (A4);
- Esc no Mk do Dimensionamento ficando no submenu (teclas k07): tradutor, ON KEY dentro de SUB (A6).

O caso `teclas` depende do `SISTRUT.exe` da família sistema (compilado de `src-original/sistema/SISTRUT.BAS` como estava em 15/10) para a tela k09.
