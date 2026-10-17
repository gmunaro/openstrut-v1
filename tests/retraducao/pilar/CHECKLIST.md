# Família PILAR na V1 retraduzida: estado, casos e checklist dos livros U46..U58

EXE: PILAR (livros U47-U50), PILAREDI (U51-U55), PILGEEDI (U56-U57), PIPROEDI (U58), PIGRAEDI (U46).

## Como regenerar, compilar e conferir

```sh
bash tests/retraducao/pilar/gera.sh                      # COMMON (dois blocos) + os 5 .BAS
# compilar os 5 EXE com tools/qbcompile.sh a partir do mesmo RT45 (EXE de RT45 diferentes não trocam CHAIN)
bash tests/retraducao/pilar/roda_casos.sh <pasta dos EXE> <trabalho> [caso ...]   # V1 + comparação
bash tests/retraducao/pilar/mkcaso.sh <caso> [obra]      # monta casos/retrad_pil_<caso>.txt do oráculo
```

`roda_casos.sh` começa no PILAR com a tela que o gerenciador deixa (`tools/troca_semente.py --modulo PILAR`), roda o sufixo `<caso>.sufixo.txt`, compara com a última execução do oráculo (`compara.sh` → `tools/compara_retrad.py`: texto, realce, atributos, PNG, impressora byte a byte, hora aceita como "igual (relógio)") e compara com `cmp` os arquivos gravados (`obra/` do oráculo × pasta C: da V1). No caso `trava` o limite é 40 s e os EXE da pasta de binários que sobram são mortos (laço sem fim, ver abaixo).

`src-original/pilar/correcoes.json` tem só as marcas PROTECAO (verificação de licença desativada, 5 EXE). Os contornos que existiram (P1, P2, P3, P4, P7, P14) saíram quando o tradutor/RT45 resolveram os pedidos; os scripts que os geravam (`erase_common.py`, `using_tab.py`, `csng_pu.py`) estão fora de uso. Pedidos em `PEDIDOS-TRADUTOR.md` (todos resolvidos).

## COMMON e CHAIN

Quem chama quem (lifts):

| de | para | como | o que passa |
|---|---|---|---|
| SISTRUT | PILAR | CHAIN | tela: linha 5 placa/LPT/COM/pasta (lida com SCREEN); COMMON vazio, e o PILAR faz `CLEAR` quando `V_0dcc$` está vazio (0x10148) |
| PILAR | SISTRUT | RUN (F2, 0x1227c) | nada (RUN) |
| PILAR | PILAREDI | CHAIN (opção 8, 0x1d90d) | COMMON DS:0DC0..0F87 |
| PILAREDI | PILAR | CHAIN (F2, 0x10826) | COMMON DS:0DC0..0F87 (antes, ERASE das 19 matrizes do bloco PILAREDI) |
| PILAREDI | PILGEEDI / PIPROEDI / PIGRAEDI | CHAIN `V_0e00$ + V_106e$` (0x117a2) | COMMON DS:0DC0..1483 |
| PILGEEDI, PIPROEDI, PIGRAEDI | PILAREDI | CHAIN (item de retorno e F2) | COMMON DS:0DC0..1483 com `V_107e$ = "VOLTA <EXE>"`; o PILAREDI testa o VOLTA (0x1019e..0x101de) e pula a inicialização |

Dois blocos (`gera.sh`, `tools/common_familia.py ... --nome pilaredi` para o segundo): `COMUM_PILAR` (DS:0DC0..0F87, 75 variáveis; DS:0F8A do PILAR cai dentro de DS:0F88 do PILAREDI) para o PILAR e `COMUM_PILAREDI` (DS:0DC0..1483, 185 variáveis; DS:1484 já tem tipos diferentes entre PILAREDI e PIGRAEDI) para os quatro EXE de edifícios. O bloco maior é necessário: com um só, a volta do PILGEEDI perde níveis, colunas (`V_11a6%`, matrizes A_11c8..A_141e) e as marcas que liberam a opção 3. Variáveis `{COMMON?}` dos filhos chegam até `V_11be$`/`V_11c4%`; `V_149e$` (PILAREDI, FILES) e `V_1986!` (PILGEEDI) nunca são gravadas em EXE nenhum (variáveis sem valor no original, não COMMON).

O PILAR não lê da tela nada além das linhas 4 e 5; os EXE de edifícios não leem a tela. O RT45 leva a tela em todo CHAIN, como o QB4.5.

## Verificação de licença

Trechos de verificação de licença do original foram desativados (marcas PROTECAO em `src-original/pilar/correcoes.json`).

## Casos e resultado

Rodada final de 15/10/2026: os 10 casos `retrad_pil_*` rodados de novo no oráculo (instalação oficial, `DATE$`/`TIME$` congelados em 10-14-2026 12:00:00) e o `caso_c_pilaredi` do agente do oráculo (run 041842); na V1, os 5 EXE gerados por `gera.sh` sem contornos e compilados com o RT45/RT45GFX do repositório (HEAD 6fe5644, o mesmo em todos os EXE da cadeia), relógio também congelado. Obra de partida dos casos de edifícios: E2E.REP gravado pelo VIGA original (`casos/caso_c_pilaredi.dados`); os do PILAR começam sem obra.

| caso | o que cobre | iguais / total | diferença |
|---|---|---|---|
| ref_pilaredi (`caso_c_pilaredi`) | PILAR 8 → PILAREDI → PILGEEDI (níveis, coluna, leitura .REP, travamentos) → PILAREDI 1, 3/1 retangular, 3/2 dimensionamento impresso | 9/9 | |
| dim | o anterior + 3/3 resumo impresso, 3/4 momentos e diagramas impressos (cópia de tela), 3/5, 3/6, 4 PIPROEDI (processamento impresso), 5 lista | 23/23 | |
| geo | PILGEEDI 1-8 (esforços, vento, impressão por coluna e visualização por nível), PILAREDI 5, 1, 7, PIGRAEDI 1 (cria E2E.COL), 2, 3, 4, 5, 7, 8 | 55/59; E2E.COL e E2E.BAK iguais | 4 telas do menu do PIGRAEDI: só a linha "Acesso ao DOS ( n Kbytes livres )" (FRE: 329 no oráculo, 292 na V1) |
| teclas | F1 e F2 no PILAREDI (volta ao PILAR), Esc num campo e F2 no PILGEEDI, F2 no PIGRAEDI, Esc e F1 no PILAR | 14/15 | tela k08 (menu do PIGRAEDI): só a linha do FRE |
| graf | dimensionamento com "Paro para Visualizacao", desenho das seções na tela CGA e impresso | 15/15 | |
| secoes | seção circular (D 25) e poligonal de 4 vértices no sentido horário, predimensionamento e dimensionamento impressos | 14/14 | |
| poliinv | poligonal no sentido anti-horário (área negativa, SQR de negativo) | 14/14 | |
| sec | PILAR 1, 2 (retangular e circular), 4, 5 (correção), 3 na tela (3 diagramas de interação CGA) e impresso, 7 | 21/21 | |
| verif (= `caso_c_pilar` sem a tela do gerenciador) | PILAR 6, verificação NB1 impressa do P5 | 5/5 | |
| verif2 | PILAR 6, seção 20 x 40, flexo-compressão com 2a ordem + compressão com lambda 139 | 8/8 | |
| trava | PILAR 6, Nk 40, Mxk 2, Myk 1 (flexão oblíqua) | 4/5 | laço sem fim nos dois (ver abaixo); a tela `q03` não existe na V1 |

Todas as impressoras são iguais byte a byte (dim 18163, geo 478, graf 15216, poliinv 1336, ref 1342, sec 44341, secoes 3211, trava 1790, verif 2098, verif2 3958 bytes).

Diferenças que ficam:

- FRE (geo 4 telas, teclas 1 tela): conferido por script que, nessas telas, todas as linhas diferentes (texto e realce) são a do "Kbytes livres"; o resto da tela é igual. O valor vem de `FRE` e depende da memória do DOS. Não reproduzível; nem família nem tradutor.
- trava: laço sem fim do original, que a V1 reproduz. No oráculo, depois do `{ENTER}` de "Dados Corretos", a tela fica em "Esforcos resistentes do Pilar / Aguarde ..." no caso 2/2 (tela `q03`, tirada após `{PAUSA 60}`; numa execução anterior com `{LIMITE 400}` o KEYFEED registrou "tecla nao consumida no limite"). Na V1 o log para em "tecla pedida (posicao 42)" (o mesmo `{ENTER}`), o processo fica em laço até o limite de 40 s e é morto pelo `roda_casos.sh`; como a V1 só grava `{TELA}` quando o programa pede tecla, a `q03` não sai. A impressora é igual até ali (1790 bytes, caso 1/2 com "SITUACAO DE INSTABILIDADE"). Causa: busca do equilíbrio sem teto de iterações (U49-009). Esperado.

Caso do pilar (`tabela_3casos.md`, item c), oráculo × V1 nova (caso `verif`, impressora igual byte a byte):

| grandeza | oráculo | V1 nova | V1 antiga |
|---|---|---|---|
| Lambda x / y | 52 / 52 | 52 / 52 | 51.96 |
| situação | Compressão Centrada (casos 1/2 e 2/2) | igual | Flexão Oblíqua |
| Mx de cálculo (caso 1) | 0.35 (a) = 0.35 tm | igual | 1.26 (tf.cm) |
| momento resistente | 0.60 (1a) − 0.09 (2a) = 0.51 tm | igual | 1.95 |
| ln / Xln / 1/r | 270 graus / 17.96 cm / 0.05550 x 10-3 | igual | — |
| def. concreto / aço | 0.9966 / −0.0531 ‰ | igual | — |
| veredito (casos 1 e 2) | ok / ok | ok / ok | NÃO |

## PILAR

Traduzido depois do dump refeito (15/10, lifts das 02:06; o salto de 0x44a33 vai para L_48808). 0 avisos; os 27 `'RETRAD?` restantes são tabelas de dados lidas como código (F_1db13, F_1dc98, F_1dca4, F_1ddd0, F_49ea2, F_4a0c1). Até o dump novo, os casos de edifícios usaram um PILAR provisório (dump antigo, fora de `src-original`); as rodadas de 15/10 usam só os 5 EXE de `src-original/pilar`.

## Checklist dos livros

As divergências dos livros comparam a V1 antiga (`src-reconstructed`) com o original. Na retradução o código de cada endereço é o do original, então todas ficam resolvidas por construção; a coluna "conferido" diz se o caminho rodou num caso comparado com o oráculo. A cobertura vem de uma cópia instrumentada (fora do repositório, `cov.sh`: um `RT_LOG` na primeira passagem por cada rótulo de cada rotina do lift) rodando os 11 casos.

### U46 — PIGRAEDI (84)

| rotina | divergências | conferido |
|---|---|---|
| M_PIGRAEDI 0x10030 | 001-003 (entrada, ON ERROR, saída) | sim (geo, teclas); verificação de licença desativada (marcas PROTECAO) |
| FUN_1000_05ee 0x105ee | 004-025 (menu de 8 itens, letras, criação de arquivo, nome da obra, D) | sim: itens 1, 2, 3, 4, 5, 7, 8 e F2 (geo, teclas); validações do nome (8 caracteres, ponto, barra) e "D" não |
| F_119e7 0x119e7 | 026-030 (backup .BAK) | sim: E2E.BAK igual fora a hora (geo) |
| F_11b1a 0x11b1a | 031 (abertura do .COL e erro de disco) | abertura sim (geo); o caminho de erro não |
| F_11b7d 0x11b7d | 032-051 (formato do .COL, número de colunas, catálogo) | sim: E2E.COL igual fora a hora (geo), "Gravadas 1 Colunas", janela do catálogo |
| F_138ea 0x138ea | 052-063 (leitura de colunas, SIM, Continuo) | sim (geo, r11-r14) |
| F_13f92 0x13f92 | 064-084 (leitor do .COL, drive/diretório) | sim: leitura do E2E.COL e item 7 (geo); erros de drive e de capacidade não |

### U47 — PILAR, módulo PILAR (19)

| rotina | divergências | conferido |
|---|---|---|
| M_PILAR 0x10030, F_11acb 0x11acb | 002-005 (PILAR.INI, bitolas do DATA, padrões) | sim, com o PILAR.INI da instalação (todos); sem INI não |
| F_11f11 0x11f11 | 006 (F2 volta ao SISTRUT por RUN, Esc volta ao menu) | Esc e F1 sim (teclas); F2 do PILAR não (os casos começam no PILAR, sem o gerenciador na V1) |
| FUN_1000_232e 0x1232e | 001, 007, 008, 018 (menu, materiais, arquivo de seções) | sim (sec, verif) |
| F_1376d 0x1376d | 010, 011, 019 (conferência da seção, Jx/Jy, lista de posições) | sim: retangular e circular (sec, verif) |
| F_16530, F_16a69 | 009, 016 (processar: diagramas de interação) | sim: 3 diagramas na tela e impressos, iguais (sec) |
| FUN_1000_c837 0x1c837 | 012 (correção de parâmetros) | sim, item 1 (sec); faixas dos itens 4-6 não |
| FUN_1000_cf6b 0x1cf6b | 013 (lista das seções) | sim (sec) |
| F_1d05b 0x1d05b | 014 (verificação NB1) | sim (verif, verif2, trava) |
| FUN_1000_d6a7 0x1d6a7 | 015 (opção 8, chamada do PILAREDI) | sim sem seções arquivadas (todos os casos de edifícios); o aviso "Todas as secoes arquivadas serao perdidas" não |
| FUN_1000_d994 0x1d994 | 017 (tela "erro no processamento") | não |

### U48 — PILAR, PILAUX (15)

| rotina | divergências | conferido |
|---|---|---|
| FUN_2000_218a 0x2218a | 001-006 (posição das barras) | sim (sec, verif, verif2) |
| FUN_2000_2914 0x22914 | 007-013 (correção da seção por item) | sim, item 2 (sec) |
| FUN_2000_7521 0x27521 | 014-015 (lei do aço) | sim (sec, verif) |

### U49 — PILAR, PILVERIF (18)

| rotina | divergências | conferido |
|---|---|---|
| FUN_3000_013c 0x3013c | 001, 002, 012, 013, 017, 018 (casos, carregamentos seguidos, relatório impresso) | sim: dois carregamentos (verif2), relatório byte a byte (verif, trava, 1.º carregamento do verif2) |
| F_32220 0x32220 | 003-011, 014-016 (ea, fluência, lambda inteiro, 2a ordem, busca do equilíbrio, instabilidade, desenho) | sim: compressão centrada (verif), flexo-compressão com 2a ordem e "SITUACAO DE INSTABILIDADE" (verif2), flexão oblíqua até o laço sem fim do caso 2/2 (trava); fluência (φ > 0), lambda > 140 e o desenho da seção não |

### U50 — PILAR, PILDADOS (28)

| rotina | divergências | conferido |
|---|---|---|
| F_40161 0x40161 | 001-009 (erros de disco) | não |
| FUN_4000_045f 0x4045f | 010-025 (tipo de seção, retangular com laterais, Di/Df, circular, bitolas) | sim: retangular sem e com barras laterais (Di,Df padrão), circular com barras distribuídas (sec, verif, verif2); poligonal, seção arquivada em disco e validações com BEEP não |
| F_488ad 0x488ad | 026-028 (drive e diretório) | só a passagem (todos); alterar não |

### U51 — PILAREDI, módulos PILAREDI e PIAUXEDI (76)

| rotina | divergências | conferido |
|---|---|---|
| M_PILAREDI 0x10030 | 001-004 (entrada, VOLTA, ON ERROR) | sim (todos os casos: entrada pelo PILAR e voltas dos filhos); verificação de licença desativada (marcas PROTECAO) |
| F_10285 0x10285 | 005-010 (erro no .PIP) | não (o .PIP SISTRUT não é lido) |
| F_10401 0x10401 | 011-017 (ON KEY: F2 volta ao PILAR, F1 BEEP, Esc) | sim: F1 e F2 (teclas); KEY 15-18 (Ctrl+Alt+Del) não |
| FUN_1000_08aa 0x108aa | 018-026 (menu, materiais) | sim (todos; materiais com Fck .2 e aço A no geo) |
| F_119ba 0x119ba | 027-045 (lista de colunas, correção de parâmetros) | sim: lista (dim, geo), parâmetros com "1,1.5" (geo); seleção de .PIP pela tecla P e faixas dos itens 5/6 não |
| F_13521 0x13521 | 046-064 (submenu de seções, resumo de cargas, parâmetros do predimensionamento) | sim: 3/3 resumo impresso, 3/5, 3/6 (dim) |
| FUN_2000_3c9a 0x23c9a | 065-072 (parâmetros SISTRUT sem ler .PIP) | sim (todos) |
| FUN_2000_5d0d 0x25d0d | 073 (lei do aço) | sim (dimensionamento em dim, graf, secoes) |
| FUN_2000_608e 0x2608e | 074-076 (janela de níveis) | não |
| FUN_1000_53de 0x153de, F_103c1 0x103c1 | (tela "erro no processamento") | não (com o P12 resolvido, o poliinv não passa mais por ela, como no original) |

### U52 — PILAREDI, PILDAEDI (33)

| rotina | divergências | conferido |
|---|---|---|
| F_3017f 0x3017f | 001-010 (erro de drive/diretório) | não |
| FUN_3000_3d7a 0x33d7a | 011-020 (entrada da seção) | sim: retangular, circular, poligonal (ref, secoes) |
| F_378fe 0x378fe | 021-033 (drive e diretório da seção arquivada) | só a passagem pela tela do tipo de seção (ref, dim, secoes); alterar drive e ler seção arquivada não |

### U53 — PILAREDI, PILVEEDI (63)

| rotina | divergências | conferido |
|---|---|---|
| FUN_4000_015f 0x4015f | 001-009 | sim (dim, graf, secoes) |
| F_4093e 0x4093e | 010-050 (dimensionamento, tela de cada trecho, aceite) | sim: retangular, circular, poligonal; "Paro para Visualizacao" (graf); variação de armadura e redefinição manual não |
| FUN_4000_5f89 0x45f89 | 051-058 | sim |
| F_477c3 0x477c3 | 059-063 | sim |
| F_4585c 0x4585c (editor de vértices) | — | sim: entrada e edição da poligonal (secoes, poliinv) |

### U54 — PILAREDI, PISECEDI (41)

| rotina | divergências | conferido |
|---|---|---|
| FUN_5000_0187 0x50187 | 001-007 | sim |
| F_50cea 0x50cea | 008-041 (predimensionamento, relatório, desenho das seções) | sim: relatório (dim), desenho na tela e impresso, iguais (graf) |

### U55 — PILAREDI, PIMOMEDI (22)

| rotina | divergências | conferido |
|---|---|---|
| FUN_6000_33c1, FUN_6000_346f, F_63b55 | 001-022 (momentos e normal, diagramas) | sim: 3/4 impresso, com a cópia da tela (dim) |

### U56 — PILGEEDI, módulo PILGEEDI (68)

| rotina | divergências | conferido |
|---|---|---|
| M_PILGEEDI 0x10030 | 001-002 | sim |
| FUN_1000_064e 0x1064e | 003-013 (menu de 8 itens, letras, volta) | sim (todos os itens no geo) |
| F_11145 0x11145 | 014-023 | sim (leitura do .REP) |
| F_11731 0x11731 | 024-031 (nível das cargas, confirmação) | sim |
| F_14aa8 0x14aa8 | 032-035 | sim |
| FUN_1000_4faa 0x14faa | 036-046 (impressão dos dados por coluna e por nível) | sim: por colunas com dados geométricos impressos e por níveis na tela (geo) |
| F_15976 0x15976, F_16f0c 0x16f0c | 047-059 | sim (geo) |
| FUN_1000_7bca 0x17bca | 060-068 (travamentos) | sim (entrada e saída sem alterar); travamento com viga (F_146dc) não |

### U57 — PILGEEDI, PILESEDI (36)

| rotina | divergências | conferido |
|---|---|---|
| FUN_2000_013c 0x2013c | 001-007 (esforços externos e vento) | sim: esforços e vento da coluna P5 (geo) |
| FUN_2000_537f 0x2537f | 008-036 (níveis e coluna) | sim (todos) |

### U58 — PIPROEDI (24)

| rotina | divergências | conferido |
|---|---|---|
| M_PIPROEDI 0x10030 | 001-002 | sim (dim) |
| F_101fc 0x101fc | 003-008 (ON KEY, volta) | volta pelo fim do processamento, sim; F2/Esc não |
| FUN_1000_05fe 0x105fe | 009-019 (lista de posições, impressão) | sim: posição 1 impressa (dim) |
| FUN_1000_540a 0x1540a | 020-024 (tela de erro) | não |

## Defeitos do original que a V1 reproduz

- Poligonal no sentido anti-horário: área negativa e índices de esbeltez com SQR de negativo (NaN, sem erro) e "ESTA SECAO NAO SUPORTA" (poliinv, igual).
- Verificação NB1 em flexão oblíqua (caso `trava`): laço sem fim na busca do equilíbrio do caso 2/2 (U49-009, sem teto de iterações). A V1 fica no mesmo laço.
- Diagramas de interação do PILAR desenhados com as cores 11, 12 e 14 no modo CGA (o BRUN45 acende qualquer cor diferente de 0; a V1 também, desde o RT45GFX).
- `FILES ... + V_149e$` (PILAREDI 0x1296a): variável nunca gravada (string vazia), o padrão sai `C:*`.
