# Família FORMA: retradução conferida contra o original

EXE: FORMA (livros U19, U20), FORMEDCA (U21 a U24), FORMIMP (U25), FORMINIT (U26, U27), FORMPLOT (U28 a U30).

## Como reproduzir

```sh
# BIN = pasta dos EXE da V1; ORACULO = pasta do oráculo
python -I tools/common_familia.py forma auto auto FORMA FORMEDCA FORMIMP FORMINIT FORMPLOT
for e in FORMA FORMEDCA FORMIMP FORMINIT FORMPLOT; do python -I tools/retraduz.py $e --familia forma; done
for e in FORMA FORMEDCA FORMIMP FORMINIT FORMPLOT; do
  bash tools/qbcompile.sh "$(cygpath -aw src-original/forma/$e.BAS)" "$(cygpath -aw "$BIN")\\$e.exe"; done
bash tools/qbcompile.sh "$(cygpath -aw src-original/sistema/SISTRUT.BAS)" "$(cygpath -aw "$BIN")\SISTRUT.exe"   # F2 (RUN do gerenciador)
bash tests/retraducao/forma/mkcaso.sh <caso>        # monta casos/retrad_frm_<caso>.txt e .dados
(cd "$ORACULO" && ORACULO_BASE=/orig/instalado bash rodar.sh casos/retrad_frm_<caso>.txt)
bash tests/retraducao/forma/roda_casos.sh "$BIN" "${V1_TRAB:-${TMPDIR:-/tmp}/v1-retrad}/forma"   # V1 + comparação
```

- COMMON: bloco automático DS:0DC0..DS:1866, 140 variáveis, sem conflito de tipo nos 5 EXE. DS:1866 já diverge (`V_1866$` no FORMA, `V_1866!` no FORMPLOT).
- Quem chama quem, pelos CHAIN e RUN do lift:
  - O gerenciador faz CHAIN do FORMA, e o RUN do F2 volta ao gerenciador.
  - O FORMA faz CHAIN do FORMINIT (Montagem) e do FORMEDCA, FORMIMP e FORMPLOT (opções 2, 3 e 4) em 0x154f8. O COMMON leva a forma lida do .FRM e `V_157a$`, que diz de onde veio.
  - O FORMINIT faz CHAIN do FORMEDCA (0x103a9).
  - O FORMEDCA faz CHAIN do FORMINIT (R) e do FORMA (S).
  - O FORMIMP e o FORMPLOT fazem CHAIN do FORMA (F).
  - O FORMINIT tem também o RUN do gerenciador (F2).
- Tela deixada pelo gerenciador: como o LAJE, o FORMA lê na linha 5 a placa, a impressora, a serial e a pasta dos EXE (0x10734..0x10864). Os submódulos não leem a tela.
- `roda_casos.sh` monta o C: da V1 com os .INI da instalação oficial (`ini/`, os arquivos que não são EXE de `runs/instalacao_oficial-*/c.tar.gz` em SISTRUT\EXEC40, mais `ini_sistrut/SISTRUT.INI` em SISTRUT\) e a obra de partida.

## Obra de partida, gravada pelo original

Cada caso começa pelo gerenciador (tecla F). As obras são:

| pasta | conteúdo | como foi gravada no original |
|---|---|---|
| `obra/` | E2E.LAJ, .VIG, .RLP, .BAK (caso_a_laje), E2E.REP (caso_c_pilaredi), E2E.SEC e .FOR, E2E.COL | `casos/retrad_frm_prep_sec.txt` (DESENHO: seção 12x40 e dados de forma das 6 vigas, run `retrad_frm_sonda_des-20261014-200548`) e `casos/retrad_frm_prep_col.txt` (PILAREDI: níveis FUND/PAV1, colunas P1..P9, cargas do E2E.REP, seção 20x20, gravação do .COL, run `retrad_frm_sonda_pil-20261014-202358`) |
| `obra2/` | `obra/` + E2E.FRM, .FOR e .FOK gravados pela opção 1 | caso `retrad_frm_montagem` (run `-20261014-204012`) |

## Resultado final (15/10/2026, depois do 6fe5644; `correcoes.json` só com as marcas PROTECAO)

O oráculo rodou de novo os 5 casos com `DATE$`/`TIME$` congelados em 10-14-2026 12:00:00 (runs `retrad_frm_*-20261015-0824..0844`). A V1 foi gerada e compilada com o tradutor, o RT45 e o RT45GFX do repositório e rodou com o relógio congelado (padrão do `roda_retrad.sh`). Saída completa em `comparacao.txt`.

| caso | o que faz | telas e impressora iguais / total | arquivos byte a byte |
|---|---|---|---|
| montagem | menu (tecla inválida, 5, 6 com pasta inválida), opção 1 com vínculos (navegação, alteração), FORMINIT, editor: G sem nome, G E2E, F/V, F/P, F/Retorna, B, D, S | 33 / 33 | E2E.FRM (6.151), E2E.FOR (3.696), E2E.FOK (3.696) iguais |
| edita | opção 2, editor: P (pilar 5), V com pilar alterado, G com alterado, R, G, V (viga 1), T, Z por campo e todo, C, E, Esc no zoom, S com alterado, R, G, S | 35 / 35 | E2E.FRM (6.151) igual |
| imprime | opção 3, FORMIMP: S, E (1/100), T, I (desenho em escala na impressora), C (cópia da tela, versão C), Z, F | 15 / 15 (`impressora.prn`, 29.120 bytes iguais) | nenhum arquivo gravado |
| plota | opção 4, FORMPLOT: S, M (15 parâmetros, Esc), C (DXF), T, Z, D, P (prévia, setas, S: "erro no processamento" nos dois), F | 22 / 22 | E2E.DXF (51.618) igual |
| teclas | F1, Esc em duas telas, F2 (RUN do gerenciador) | 7 / 7 | — |

| EXE | compila | casos que o exercitam |
|---|---|---|
| FORMA | sim | os 5 |
| FORMINIT | sim | montagem (ramo FORMA), edita (R, ramo FORMEDCA, 2 vezes); não para em tela, o resultado aparece no desenho do editor |
| FORMEDCA | sim | montagem, edita |
| FORMIMP | sim | imprime |
| FORMPLOT | sim | plota |

Diferenças restantes: nenhuma. FRE não aparece nas telas comparadas.

A V1 não grava nenhum arquivo além dos do original. A tela a21 da montagem ("VERIFIQUE O SEU DRIVE" no G com nome vazio) agora sai igual: o RT45 dá erro 64 para `C:\.FRM`. O BRUN45 dá o mesmo número; foi medido no oráculo com a sonda `retrad_frm_err` (`sonda_line/ERR.BAS`, saída `sonda_line/ERR.oraculo.OUT`: "ERR = 64").

Os casos edita, imprime e plota partem de `obra2/`, que tem o E2E.FRM da montagem de 14/10 (cabeçalho "12:01", gravado antes do relógio congelado). Os dois lados leem o mesmo arquivo, e o FORMA não usa esse cabeçalho.

Rodada anterior (com os contornos e o relógio andando): restavam a tela a21 (R3), o retângulo do zoom e os tracejados da impressora (R2), a hora e a data do E2E.FRM. Todas eram do RT45 ou do oráculo; nenhuma era da família.

## Correções em `src-original/forma/correcoes.json`

Ficou só a verificação de licença do original, desativada (marcas PROTECAO).

Os contornos de P1, P2, P3 e R1 saíram: o tradutor e o RT45 agora resolvem esses pontos (commits 6491e1f, d134727, 8983b7e).

## Checklist dos livros

Na retradução, o código de cada endereço é o do original, então as divergências dos livros (original × V1 antiga) ficam resolvidas por construção. A coluna "conferido no oráculo" diz o que os casos exercitam. Telas: `NNN_nome` do caso.

### U19 (FORMA, módulo FORMA)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U19-001 | — | verificação de licença desativada (marcas PROTECAO) |
| U19-002 (pasta de execução) | 0x105b2 | sim: todos os casos entram pelo gerenciador e o FORMA acha FORMA.INI e os EXE |
| U19-003 (sem FORMA.INI) | 0x11443 | não |
| U19-004 (FORMA.INI por posição, 37 linhas) | 0x108b0 | sim, indireto: pastas (montagem a02..a05) e parâmetros da folha (plota d04) |
| U19-005, 006 (menu, "Editadas", BEEP) | 0x119e2, 0x11fa9 | sim: a00 com realce; tecla inválida (montagem), F1 (teclas f01) |
| U19-007 (opção 5 não faz nada) | 0x120e7 | sim: a01 |
| U19-008, 009 (pasta por pasta; normalização) | 0x1212d, 0x16398 | sim: a02..a06, "123" recusado e "C:" vira "C:\"; caminho relativo não |
| U19-010, 011 (F2 = RUN do gerenciador; Esc volta ao menu) | 0x118a7, 0x119af | sim: teclas f03, f04, f05 |
| U19-012 (tela "erro no processamento" do FORMA) | 0x11849 | não (a do FORMPLOT sim: plota d11) |
| U19-013, 014, 015, 016 (nome com FILES, exige .SEC, resumo, LINE INPUT da confirmação) | 0x12196..0x12ab4 | sim: a07..a10 |
| U19-017 (vínculos) | 0x12b0b | sim: a11..a17 (navegação e alteração de viga e pilar, nível) |
| U19-018, 019, 020 (escolha do .FRM nas opções 2/3/4, .FRM no COMMON, CHAIN) | 0x12b65..0x15387 | sim: edita b00..b03, imprime c00..c02, plota d01..d02; desenhos iguais nos submódulos |
| U19-021 (volta ao menu com o estado) | 0x101b6 | sim: montagem a31, edita b32, plota d20 |
| U19-022 (erro do FILES) | 0x15125 | não |
| U19-023 (troca para Hercules) | 0x113d8 | não |

### U20 (FORMA, módulo FORMAUX: leitores)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U20-001 (.COL) | 0x2018c | sim: resumo "niveis definidos 2 / colunas arquivadas 9" e seções 20x20 nos vínculos (a16) |
| U20-002, 003 (colunas não dimensionadas, seção inconsistente) | 0x20aee, 0x20d34 | não |
| U20-004 (.LAJ) | 0x21093 | sim: resumo (a10) e desenho do editor |
| U20-005 (mensagens fatais do .LAJ) | 0x2166c | não |
| U20-006, 007, 008 (.VIG/.SEC RANDOM, aviso de seção, CINT do SINGLE) | 0x22afe..0x23868 | sim: "12x40" nos vínculos (a11); o aviso não aparece |
| U20-009 (ajuste das faces quando a seção mudou) | 0x239c9 | só o caminho sem mudança (opções 2/3/4) |

### U21 a U24 (FORMEDCA)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U21-002, 017..021 (amarração de pilar: coordenada, M, confirmação) | 0x10c38..0x15e30 | sim: edita b04..b11 (pilar 5, X = 395). Eixo, outro pilar, viga e a opção A (ângulo, U21-001) não |
| U21-003, 022 (faces de viga) | 0x16812..0x1b030 | sim: edita b16..b21 (todas as faces, Y = 1010); "Escolho faces" e *PROXIMA* não |
| U21-004, 023..025 (janela da planta, menu nas linhas 23-25, linhas do pilar/viga) | 0x1fc20, 0x10b79, 0x1df4a, 0x1ea26 | sim: todas as telas gráficas do editor |
| U21-005, 015 (.FRM, gravação com nome e drive) | 0x1c4e5, 0x1c19d | sim: E2E.FRM igual byte a byte; G sem nome (erro 64) |
| U21-006, 010, U23-002..005 (F/V: .FOR por .$$$, .FOK) | 0x1da80, 0x376e7 | sim: E2E.FOR e E2E.FOK iguais byte a byte |
| U21-007 (F/P "AINDA NAO DISPONIVEL") | 0x1dd72 | sim: a27, a28 |
| U21-008, 009 (forma e eixos pelo COMMON) | 0x101d4, 0x1e1e5 | sim, indireto (desenhos iguais) |
| U21-011 (R chama o FORMINIT) | 0x1bb0d | sim: edita b15 e o R antes do último G |
| U21-012 (B e D não fazem nada) | 0x1bae1 | sim: a30 |
| U21-013, U23-001 (T textos) | 0x1bc37, 0x39a7b | só "Visualiza Todos" e Retorna (b22, b23) |
| U21-014, U22-013 (zoom por cantos) | 0x1bf5e, 0x26417 | sim: b24..b27 |
| U21-016 (S com alteração pendente) | 0x1ddee | sim: b31 (BEEP, fica no editor); "Abandono as Modificacoes" não |
| U22-001..016 (desenho, vértices, eixos, segmentos) | 0x20750..0x25bbf | desenho de pilares retangulares, vigas e bordas: sim. Circular, poligonal, amarração a vértice de outro pilar e escolha de segmento: não |
| U24-001..009 (E elevação, C cotas) | 0x401e8..0x450c5 | só abrir e retornar (b28, b29) |

### U25 (FORMIMP)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U25-002, 011, 012, 014 (menu sobre o desenho, COMMON, F volta ao FORMA, Z, C) | módulo | sim: c02..c13 |
| U25-003, 004 (escala livre, folhas e partes) | 0x10e6e..0x111cb | sim: c05, c06 (1/100) |
| U25-005 (FOTO) | 0x11ba7 | não |
| U25-006 (Todo o campo) | 0x10d40 | sim: c04 |
| U25-007 (campo por cursor) | 0x10c1d | não (só T) |
| U25-008 (7 perguntas de texto) | 0x111fa | sim: c07 |
| U25-009, 013 (impressão gráfica por faixas, segmentos desenhados) | 0x11895..0x12708 | sim: impressora.prn igual byte a byte (29.120 bytes): desenho em escala e cópia da tela (versão C) |
| U25-010 (tela de erro) | 0x1532c | não |

### U26, U27 (FORMINIT)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U26-001, 002 | — | verificação de licença desativada (marcas PROTECAO) |
| U26-003, 005, 006, 009 (ramo FORMA, V_157a$, CHAIN do FORMEDCA) | 0x10030 | sim: montagem |
| U26-004 (ramo FORMEDCA: pilares e vigas alterados) | 0x10030 | sim: edita (R depois de pilar e de viga alterados) |
| U26-007, 008 (repetição do CHAIN, troca de disco, tratador de erro) | 0x10030 | não |
| U26-010..012 (teclas no FORMINIT) | 0x104a6 | não |
| U26-013..018 (tela "erro no processamento") | 0x110ba | não |
| U26-019..021, U27-001 (posição das seções, interseções) | 0x116a5, 0x1296d, 0x20c9a | sim, indireto (desenho do editor igual depois do FORMINIT) |

### U28 a U30 (FORMPLOT)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U28-001, 002, 017 (COMMON, menu, F volta ao FORMA) | módulo | sim: d01..d20 |
| U28-003, 004, 006 (caixa, área ocupada, prévia da folha) | 0x10249..0x10eef | sim: d08, d09 |
| U28-005 (desenho maior que a folha) | 0x10da2 | não |
| U28-007 (movimento por setas) | 0x11436 | sim: d10 |
| U28-008 (Passo) | 0x11d31 | não |
| U28-009, U29-001..016 (plotagem, .PLT, PLOTER.INI) | 0x1202f, 0x30182 | parcial: com FORMA.INI "N=ARQUIVO GERADO EM DISCO", o S vai direto ao plotter (COM1) e dá "erro no processamento" nos dois (d11). O .PLT não foi gerado |
| U28-010, U30-001..027 (DXF) | 0x1233e, 0x4016e, 0x43e34 | sim: E2E.DXF igual byte a byte (51.618 bytes) |
| U28-011 (perguntas de texto dependentes) | 0x1254f | sim: d17 (a "Secao das Vigas" só aparece com "Nome das Vigas" = S) |
| U28-012, 013, 028..033 (campo e zoom por cursor) | 0x10841, 0x235b9 | só "Todo o campo" (d03, d18) |
| U28-015 (15 parâmetros, Esc volta um campo) | 0x12fbc | sim: d04..d07 |
| U28-016 (tela de erro) | 0x15183 | sim: d11 |
| U28-018..027 (montagem dos segmentos e janela) | 0x20187..0x21ded | sim, indireto (prévia e DXF iguais) |

## Comportamentos do original reproduzidos sem julgar (decisão do dono)

- FORMEDCA, G com nome vazio: o original tenta gravar `C:\.FRM`, recebe o erro 64 e mostra " VERIFIQUE O SEU DRIVE". A V1 faz o mesmo.
- FORMPLOT: depois do "erro no processamento" da plotagem direta, o original entrou em laço de "Segment limit violation" no DOSBox-X na tecla T seguinte (runs `retrad_frm_plota-20261015-024707` e `-030145`). Com o C sem nome antes, o laço apareceu no C seguinte. No caso final, o P é o último comando antes do F, e o F volta ao FORMA nos dois.
- FORMPLOT, C (DXF) com o nome vazio na primeira vez: "erro no processamento" (sonda `retrad_frm_sonda_plt-20261015-022738`). Fica fora do caso pelo motivo acima.
