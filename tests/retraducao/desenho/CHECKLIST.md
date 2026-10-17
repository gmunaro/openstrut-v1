# Família DESENHO na V1 retraduzida: checklist dos livros U03..U18

Sete EXE: DESENHO (livros U09-U12), DESDIM (U03-U05), DESEDCAO (U06-U07), DESEDITA (U08), DESGRAF (U13), DESIMP (U14-U16), DESINIT (U17-U18). Todos saem de `tools/retraduz.py` e compilam no QB64 PE 4.7.0. A conferência é contra o oráculo (original no DOSBox-X, instalação oficial, placa CGA), com obra gravada pelo próprio original.

Estado em 15/10/2026, rodada final: tradutor, `tools/common_familia.py` e RT45 do repositório no commit 6fe5644, sem nenhum contorno de tradução em `correcoes.json` (só as marcas PROTECAO). Os pedidos D1, D2, D3, D4 e D7 foram resolvidos no tradutor, no RT45 e no `compara_retrad.py`; o oráculo passou a congelar DATE$/TIME$ em 10-14-2026 12:00:00 (D5). Todos os casos foram rodados de novo no oráculo depois disso.

## Como gerar

```sh
python -I tools/common_familia.py desenho auto auto DESENHO DESDIM DESEDITA DESGRAF DESIMP DESINIT DESEDCAO
bash tests/retraducao/desenho/gera.sh <pasta dos EXE> DESENHO DESDIM DESEDITA DESGRAF DESIMP DESINIT DESEDCAO
bash tools/qbcompile.sh <SISTRUT.BAS da família sistema> <pasta dos EXE>/SISTRUT.exe   # só para o F2 voltar ao gerenciador
```

`gera.sh` chama `tools/retraduz.py <EXE> --familia desenho` e `tools/qbcompile.sh` para cada EXE. Os scripts de contorno da rodada anterior (`gera_redim.py`, `gera_usingtab.py`, `gera_common.sh`) ficaram fora de uso. Regerar reproduz os fontes byte a byte.

Todos os EXE de uma cadeia precisam ser compilados com o mesmo RT45 (o arquivo de troca do CHAIN agora leva a versão).

COMMON: DS:0DC0..DS:1E06 nos sete EXE, 277 variáveis, sem conflito de tipo (DS:1E06 é `V_1e06$` no DESENHO e `V_1e06!` nos outros). Inclui as matrizes de tela `A_1d76`, `A_1da4`, `A_1dd2`: o DESENHO as dimensiona por placa, o DESGRAF guarda nelas o diagrama e o DESEDCAO o mostra em Esforços e guarda a tela do editor. Quem chama quem (CHAIN no lift):

| EXE | CHAIN para | RUN |
|---|---|---|
| DESENHO | DESDIM (item 1, 0x164b1), DESEDITA (item 2, 0x1230b) | SISTRUT (F2) |
| DESDIM | DESGRAF (diagramas), DESINIT (desenho definitivo/edição), DESENHO (fim da lista) | SISTRUT |
| DESGRAF | DESDIM | SISTRUT |
| DESINIT | DESEDCAO (edição, `V_184e$`="S"), DESIMP (impressão/CAD), o EXE em `V_180a$` (DESDIM ou DESEDITA), DESENHO | SISTRUT |
| DESEDCAO | DESINIT | SISTRUT |
| DESIMP | DESINIT | SISTRUT |
| DESEDITA | DESINIT, DESENHO | SISTRUT |

O DESENHO, como o LAJE, lê a placa, a impressora, a serial e a pasta dos EXE na linha 5 da tela deixada pelo gerenciador (0x10e71..0x10f6a). Os outros seis só olham o COMMON (`V_17f2$`, a placa).

## Verificação de licença

Trechos de verificação de licença do original foram desativados (marcas PROTECAO em `src-original/desenho/correcoes.json`).

## Casos

Prefixo `retrad_des_` em `$ORACULO/casos/`; sufixos em `tests/retraducao/desenho/<nome>.sufixo.txt` (entrada pelo gerenciador: `V`, seta para a direita = "Detalhamento & Desenho", Enter; `mkcaso.sh` monta o caso). Rodar e comparar: `bash roda_casos.sh <pasta dos EXE> <trabalho> [caso ...]` (V1 com `tools/roda_retrad.sh`; telas com texto, atributos exatos e PNG por `tools/compara_retrad.py` via `compara.sh`; arquivos gravados byte a byte por `compara_obra.py`). A pasta C: da V1 é a configuração da instalação oficial (`SISTRUT/SISTRUT.INI` e `SISTRUT/EXEC40`) mais a obra.

Obras: `caso_b_viga.dados` (E2E.LAJ/.VIG/.RLP gravados pelo original no caso a); para `menu` e `p10`, a mesma obra com E2E.SEC/.FOR/.TAB gravados pelo original no detalhamento.

Execuções do oráculo da rodada final: `runs/retrad_des_<caso>-20261015-0825..` a `-0830..`.

| caso | o que exercita | EXE | telas | impressora (bruta) | arquivos gravados |
|---|---|---|---|---|---|
| `det` | item 1 completo, viga 1: seção 20x50, apoios P1..P3, vãos 380, impressão de esforços e armação, diagramas (escala VIDEO), desenho definitivo 1/50 na impressora, CAD Autocad, 3 cabeçalhos e 2 notas | DESENHO → DESDIM → DESGRAF → DESDIM → DESINIT → DESIMP → DESINIT → DESDIM → DESENHO | 52 de 52 | 54.203 bytes iguais | E2E.FOR, .SEC, .TAB, R1__E2E.DXF iguais |
| `vis` | o mesmo sem impressão, com parada para visualização: telas do DESDIM e diagrama do DESGRAF em CGA | DESENHO, DESDIM, DESGRAF, DESINIT | 7 de 7 (o diagrama pixel a pixel) | nada impresso nos dois | E2E.FOR, .SEC, .TAB iguais |
| `edc` | detalhamento com edição (DESEDCAO): editor longitudinal, Esforços, Zoom 2,2, editor transversal, Esforços, Fim, grava R1__E2E.EDV; depois item 2 (DESEDITA) com a viga editada, desenho definitivo e CAD | os sete | 29 de 29 (11 telas gráficas pixel a pixel) | 51.716 bytes iguais | E2E.FOR, .SEC, .TAB, R1__E2E.EDV, R1__E2E.DXF iguais |
| `graf` | o mesmo do `vis` com os diagramas em escala 1/50: o DESGRAF imprime o diagrama (cópia da tela, versão B) | DESENHO, DESDIM, DESGRAF, DESINIT | 9 de 9 | 13.240 bytes iguais | E2E.FOR, .SEC, .TAB iguais |
| `menu` | tecla inválida, F1, Esc no menu, item 5 (parâmetros), item 6 (quatro diretórios), item 3 (listagem de todas as vigas, impressa), item 4 (resumo de ferragem, impresso), item 2 sem obra, Esc na pergunta do item 1, F2 de volta ao gerenciador | DESENHO, DESEDITA, SISTRUT | 34 de 34 | 1.343 bytes iguais | nenhum nos dois |
| `p2` (sonda) | itens 5, 6, 3 e 4 sem .TAB ("VERIFIQUE O SEU DRIVE") | DESENHO | 28 de 28 | nada impresso | nenhum |
| `p3` (sonda) | seção 20x50 e Enter na largura do apoio (o original repete a pergunta) | DESENHO | 46 de 46 | nada impresso | E2E.FOR, .SEC iguais |
| `p5` (sonda) | detalhamento com Enter em todas as opções de saída | DESENHO, DESDIM, DESINIT | 61 de 61 | nada impresso | E2E.FOR, .SEC, .TAB iguais |
| `p6` (sonda) | opções de saída com "Altero a armadura" = S: janelas de alteração de armadura por apoio e por tramo do DESDIM; desenho definitivo na impressora | DESENHO, DESDIM, DESGRAF, DESINIT, DESIMP | 71 de 71 | 45.795 bytes iguais | E2E.FOR, .SEC, .TAB iguais |
| `p10` (sonda) | itens 3, 4 e 2 com a obra detalhada (Enter nas perguntas) | DESENHO, DESEDITA | 34 de 34 | nada impresso | nenhum |

Total: 371 de 371 telas; as 5 impressões (det, edc, graf, menu, p6) e os 23 arquivos gravados iguais byte a byte; nos outros 5 casos nada foi impresso nos dois lados.

Por EXE:

| EXE | compila | casos | iguais / diferentes |
|---|---|---|---|
| DESENHO | sim | todos | tudo igual |
| DESDIM | sim | det, vis, edc, graf, p5, p6 | tudo igual (telas, LPRINT, data e hora do rodapé) |
| DESGRAF | sim | det, vis, edc, graf, p6 | tudo igual: diagrama na tela pixel a pixel e impresso (cópia versão B) byte a byte |
| DESINIT | sim | det, vis, edc, graf, p5, p6 | tudo igual (.TAB e impressora) |
| DESIMP | sim | det, edc, p6 | impressora (cópia versão C) e DXF iguais |
| DESEDCAO | sim | edc | telas do editor pixel a pixel, Esforços (imagem do DESGRAF pelo COMMON) e .EDV iguais |
| DESEDITA | sim | edc, menu, p10 | tudo igual |

## Diferenças restantes

Nenhuma nos casos acima. FRE não aparece em tela nesta família (o `FRE("")` antes de cada CHAIN só vai para variável). As diferenças das rodadas anteriores e como fecharam estão em PEDIDOS-TRADUTOR.md (D1..D7).

## Checklist dos livros

As divergências dos livros U03..U18 apontam onde a V1 antiga (`src-reconstructed`) se afasta do original. Na retradução o código é o do original em cada endereço, então ficam resolvidas por construção; a coluna da direita diz o que os casos conferiram contra o oráculo.

### U09-U12 (DESENHO)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U09-001, 002 (F2 volta ao gerenciador por RUN; Esc bipa e volta ao menu; F1 bipa) | F_119f5, F_11552 0x11721 | sim: `menu` m02 (F1), m03 (Esc no menu), x02 (Esc na pergunta do item 1), s01 (F2: tela do gerenciador). Ctrl+Alt+Del não |
| U09-003, 004 (DESENHO.INI pelo COMSPEC; linhas 6-13: unidades, conversões, ESC da impressora) | M_DESENHO 0x10fe9 | sim, indireto: unidades `t`/`m` nas telas do DESDIM e as sequências ESC na impressora iguais |
| U09-005 (cores pelo teste de PCOPY) | F_11552 0x11557 | sim (atributos exatos de todas as telas de texto) |
| U09-006, 007 (menu: faixas, números 1-6 e letras, bipe em tecla inválida) | 0x11d71, 0x12278 | sim (`menu` m00/m01, `p2`) |
| U09-008 (Editadas só com o parâmetro 9 = S) | 0x122f9 | sim para parâmetro 9 = S (`menu` e2, `edc`); com N não |
| U09-009..011 (obra, lista de *.VIG, "Listo as Vigas", seleção de registros) | 0x12492..0x13683 | sim (`det`, `p3`, `p5`); seleção por faixa "I A M" e vários registros não |
| U09-012 (verificação prévia: carga -100, contagens) | 0x1405a | só o caminho sem erro |
| U09-013, 014 (parâmetros só em memória; tela "item , VALOR") | 0x16c37, 0x166c9 | tela sim (`menu` p01, `p2`); alteração de item não |
| U09-015, 016 (opções de saída, escala, CAD, cabeçalhos, repetições; CHAIN com COMMON) | 0x15004, 0x164b1 | sim (`det`, `vis`, `edc`, `p5`, `p6`); repetições > 1 e Cadtec não |
| U09-017..021 (resumo pelo .TAB, 10 bitolas, kg/m da tabela, CINT, anular viga, impressão) | F_173ff, 0x172c2 | sim (`menu` r02..r05 e impressora, `p10`); anular viga não |
| U09-022, 023 (listagem dos dados arquivados pelo próprio DESENHO) | F_18df6, F_1969a | sim (`menu` l01..l10, impressora); "Imprimo dados de Seção/Forma" = S, sem parada |
| U10-001, 002 (diretórios: ordem VIG, EDV, DSP, CAD; edição sobre a tela) | FUN_2000_0503 | sim (`menu` a01..a05, `p2`) só com Enter |
| U10-003, 004 (validação e criação de diretório) | 0x20e18, 0x2072a | não |
| U10-005..010 (escolha e leitura do .DSP; cobrimento 2,0; kg/m da tabela) | F_211c3, F_2332e | sim, indireto: parametrização SISTRUT nas telas e no resumo; escolha de outro .DSP não |
| U11-001, 002 (dados de seção por tramo/apoio; dados de forma) | FUN_3000_8c4a, FUN_3000_47d8 | sim: telas da `det`/`p3`/`p5` e E2E.SEC/.FOR byte a byte. Apoios só tipo P "continua constante"; V, O, A, seções diferentes por tramo, face não alinhada e lajes no corte não |
| U12-001..005 (.FOR 616, .SEC 346, .VIG 855 bytes) | DESGRAV | sim (arquivos iguais; leitura do .VIG em todos os casos) |
| U12-006 (erro ao desempacotar a viga) | 0x44380 | não |

### U03-U05 (DESDIM)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U03-001..004 (lista de registros sem pergunta; lê .VIG/.SEC/.FOR; tela de título; CHAIN para DESGRAF/DESINIT/DESENHO) | M_DESDIM | sim (`det`, `vis`, `edc`, `p5`, `p6`) para um registro |
| U03-005, 006 (F1..F10, F2, Esc no DESDIM) | F_10db5, F_110bb | não |
| U03-007 (erros 53/61) | F_11219 | não |
| U03-008..010 (fissuração; alteração por apoio/tramo; bitola pela tabela do .DSP) | FUN_2000_0137 | parcial: janelas de alteração de armadura em `p6` (g13..g19) com Enter; fissuração e troca de bitola não |
| U03-011..025 (flecha, Ast mínima, seção T, tabela APOIO/TRAMO, impressão) | FUN_1000_13f7 | sim para a viga V1 (tela e impressora: x/d, Mk, Ast, Asc, flecha); seção T e balanços não |
| U03-026..039 (estribos: ψ, Asw mínimo, ramos, espaçamentos da lista) | F_15118 | sim para a viga V1 (Vk, Aee, `#5/12`) |
| U03-040..046 (limite 1,4·Mlim, flecha, seção T, armadura dupla, xlim/d) | F_183a8 | só o caminho da viga V1 (armadura simples) |
| U04-001..004 (registros binários .VIG/.SEC/.FOR) | DESGRAED | sim |
| U04-005..013 (corte dos negativos, zonas de estribos) | DESAUXDI | sim, indireto: desenho definitivo e DXF iguais (`det`, `edc`) |
| U04-014 (tela de erro) | FUN_4000_742a | não |
| U05-001..008 (dados da viga, focos, reações, M+, alívio do cortante, tela de resultados) | DESCALC | sim (`vis` j01..j03 e impressora do `det`); envoltória de acidentais (U05-004) não, a parametrização tem acidentais = N |
| U05-009..013 (alteração de armadura com duas telas) | DESDIMEN | parcial (`p6`, só Enter) |

### U13 (DESGRAF)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U13-001 | — | verificação de licença desativada (marcas PROTECAO) |
| U13-002, 005 (CHAIN DESDIM; RUN SISTRUT) | 0x10240, 0x10687 | CHAIN sim; RUN não |
| U13-003 (disquete) | 0x102b1 | não |
| U13-004 (tratadores de erro) | 0x10734, 0x10258 | não |
| U13-006 (teclas de função) | F_10338 | não |
| U13-007, 008, 009 (modo por placa; escala VIDEO/FOTO/número; desenho) | FUN_1000_0771, F_12cc1 | CGA, VIDEO (`vis` j04, pixel a pixel) e 1/50 (`graf`, impresso byte a byte); FOTO não |
| U13-010 (arquivo de saída) | F_12cc1 | não |
| cópia da tela, versão B | SUB_3109c | sim (`graf`, impressora igual byte a byte) |

### U14-U16 (DESIMP)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U14-001, 003 (imprime/gera CAD sem perguntar; volta ao DESINIT) | M_DESIMP | sim (`det`, `edc`) |
| U14-002 | — | verificação de licença desativada (marcas PROTECAO) |
| U14-004, 005 (teclas, tela de erro) | F_10390, F_10794 | não |
| U14-006..011 (impressão gráfica em faixas, escala, rótulos, cotas, estribos) | F_10bca | sim: impressora igual byte a byte (cópia da tela versão C) em escala 1/50; outras escalas não |
| U15-001, 002 (tela de erro) | FUN_2000_50a7 | não |
| U15-003..012 (DXF: códigos, +3000 em x, cortes, camadas, tabela de ferros) | F_2525b | sim (R1__E2E.DXF igual, `det` e `edc`); Cadtec (U15-005) não |
| U16-001, 003..006 (nome R1__E2E, cabeçalho, LINE/TEXT, camadas, escala) | DESCAD | sim (DXF igual) |
| U16-002 (Cadtec .PUB) | 0x30302 | não |

### U17-U18 (DESINIT)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U17-001 (roteador entre módulos) | M_DESINIT | sim: os quatro destinos (DESEDCAO, DESIMP, DESDIM, DESEDITA→DESENHO) passam nos casos |
| U17-002 | — | verificação de licença desativada (marcas PROTECAO) |
| U17-003 (tela de erro) | FUN_2000_013c | não |
| U17-B-01..B-08 (tabela de aço, forma, kg/m, taxa, quadro gráfico, .TAB de 70 bytes, impressão) | FUN_2000_2fe8 | sim: E2E.TAB igual e impressora igual |
| U17-D-01..D-06, U17-018 (desenho da forma e porta-estribos; 10 bitolas) | FUN_3000_0132, 38ed | sim, indireto (desenho definitivo, DXF e .EDV iguais) |
| U18-001..015 (ancoragem, corte das barras, camadas, dobras, emendas, grampos, pele) | DESINI2 F_401ce | sim para a viga V1 (resultado do detalhamento igual na impressora, no DXF e no .EDV); ramos de grampos, pele (Hw < limite), emendas e o defeito U18-015 não exercitados |

### U06-U07 (DESEDCAO)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U06-001, 002 (grava e confirma; volta ao DESINIT) | M_DESEDCAO, F_1092b | sim (`edc` k13, k14 e o resto da cadeia) |
| U06-003 (Iniciar: abandono das modificações) | 0x10d16 | não |
| U06-004 (.EDV por viga, R1__E2E.EDV) | F_110e9 0x11637 | sim (418 bytes iguais) |
| U06-005 (Zoom: "Desenhar do Tramo i a j") | 0x11367 | sim (`edc` k08, k09) |
| U06-006 (Esforços: imagem guardada pelo DESGRAF) | 0x110ee | sim (`edc` k06, k11, pixel a pixel) |
| U06-007 (F-teclas, Esc) | F_10349 | não |
| U06-010..020 (Separar, Juntar, Porta-estribo, Criar, Alterar, Deletar) | DESEDLON F_20581 | não |
| U06-021 (menu longitudinal) | FUN_2000_0146 | sim (k05, k07, k09) |
| U07-001, 003 (tela e menu transversal; F = Fim) | FUN_5000_0146 | sim (k10, k12, k13) |
| U07-002, 004..018 (alterar, estribos por intervalo, notas, bipes) | DESEDTRA | não |
| U07-019 (tela de erro) | FUN_4000_0137 | não |
| U07-020..024 (porta-estribo automático) | DESAUXCA | sim, indireto (.EDV e desenho do editor iguais) |
| U07-025, 026 (escolha do ponto e corte) | DESPARTE | não |
| U07-027..030 (desenho do editor: cabeçalho, rótulos "N3 2#10 C:350", estribos, numeração) | DESPARTE | sim (telas do editor iguais pixel a pixel) |

### U08 (DESEDITA)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U08-001 | — | verificação de licença desativada (marcas PROTECAO) |
| U08-002, 009 (retorno pelo DESINIT/DESENHO) | M_DESEDITA, F_1342f | sim (`edc` t05..t13) |
| U08-003, 006, 012..021 (drive e diretório, criação, normalização) | DESAUXED | não |
| U08-004, 005 (registro por número; viga não existente) | F_1078f, F_108a1 | registro existente sim; inexistente não |
| U08-007, 010 (disquete, disco cheio) | F_11ede, F_13652 | não |
| U08-008 (rodapé de teclas) | F_13157 | sim (atributos das telas t01..t05) |
| U08-011, 022..024 (erros de E/S) | F_138a8, FUN_3000_0e84 | não |

Pendências dos livros que a retradução reproduz sem julgar (decisão do dono: V1 igual, inclusive em defeitos): U18-015 (ramo "barra longa demais" do lado direito salta para o laço de outra sub-rotina), o GET do DESGRAF numa matriz que pode ser menor que a tela conforme a placa (EGA/VGA), a comparação de `V_0dfc$` com o retorno do DESINIT.

## Não conferido

- Placas HER, EGA e VGA (a instalação do oráculo é CGA).
- Teclas presas (F2, Esc) dentro de DESDIM, DESGRAF, DESIMP, DESINIT, DESEDCAO e DESEDITA (só no DESENHO).
- Caminhos de erro (tratadores ON ERROR), troca de disquete, diretórios inexistentes.
- Mais de uma viga por processamento, repetições, seção T, balanços, apoios V/O, envoltória de acidentais, Cadtec.
