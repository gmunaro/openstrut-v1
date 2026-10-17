# Família sistema (SISTRUT, SISEDIT): retradução e conferência no oráculo

A família tem os dois EXE que o gerenciador chama fora das famílias de cálculo: `SISTRUT` (menu principal, configuração, CHAIN/RUN para os módulos) e `SISEDIT` (editor dos .INI). Pelos CHAIN/RUN/SHELL do lift, o SISTRUT chama PORTICO, GRELHA, TRELICA, LAJE, VIGA, ARMADURA, FORMA, PILAR, DIAGRAMA, LDESENHO, DESENHO (ou DETALHA), PDESENHO, LPLOTA, VPLOTA, PPLOTA e SISEDIT; destes, só LAJE, VIGA, ARMADURA, FORMA, PILAR, DESENHO e VPLOTA existem na instalação (outras famílias), e SISEDIT é desta. O SISEDIT volta com `RUN ...SISTRUT`. Trechos de verificação de licença do original foram desativados. O outro SHELL do SISTRUT é o `.BAT` opcional da configuração.

## Resultado

| EXE | gerado por `retraduz.py --familia sistema` | compila (QB64 PE 4.7.0) | telas comparadas | iguais | diferentes |
|---|---|---|---|---|---|
| SISTRUT | sim, 0 avisos, nenhum `'RETRAD?` | sim | 95 | 95 | 0 |
| SISEDIT | sim, 0 avisos; 1 `'RETRAD?` em dado depois do `B$CENP` (`@13d49`) | sim | 48 | 47 | 1 (FRE) |
| LAJE (entrada, da família laje) | não é desta família | sim (compilado para o teste) | 2 | 2 | 0 |

Rodada final (15/10/2026): os 10 casos rodados de novo no oráculo com `DATE$`/`TIME$` congelados em `10-14-2026 12:00:00` (execuções `runs/retrad_sis_<caso>-20261015-082*`); SISTRUT e SISEDIT regenerados e compilados com o RT45 do repositório (commit 6fe5644), que congela o relógio igual. Telas comparadas em texto, realce e atributo de cada célula (`compara_retrad.py` lê o atributo do `telas.raw` do oráculo e o `.atr.txt` da V1). Nesta rodada nenhuma tela precisou da tolerância do cursor piscando do SISEDIT.

Além das telas:

- `SISTRUT.INI` regravado pela Configuração: igual byte a byte (338 bytes), inclusive `PARAMETRIZADO EM:10-14-2026  12:00:00`.
- `TESTE.INI` gravado pelo Salvar do SISEDIT: igual byte a byte (1.926 bytes).
- A tela que o gerenciador deixa no CHAIN: igual em texto, nas 2.000 células de atributo e no cursor (linha 6, coluna 1).

Comparação completa: `comparacao.txt` (gerado por `roda_sistema.sh`).

## COMMON do gerenciador

O SISTRUT não declara COMMON: o bloco dele tem 0 bytes. O CHAIN do gerenciador não passa variável nenhuma para os módulos; passa só a tela de texto.

Evidência do leiaute do DGROUP (QB4.5 com BRUN45):

- No `BRUN45.LIB` (`$REA_WORK/rt/ext/qb45`, lista de segmentos OMF), o segmento `COMMON` (classe `BLANK`, módulo `rtmload.asm`) fica junto do `BR_DATA` do runtime, e a classe `BC_VARS` começa com `NMALLOC` (6 bytes, `rtmdata.asm`), antes das variáveis do programa.
- No LAJE o bloco da família termina em DS:1341 (`docs/RETRADUCAO.md`) e DS:1342..1347 não é usado por variável nenhuma: são os 6 bytes do `NMALLOC` depois do COMMON.
- Em 23 dos outros 26 EXE a primeira variável está em DS:0DC0, início do COMMON (DESGRAF e DESIMP começam em 0DC8 e LAJEMONT em 0DCC: variáveis do COMMON da família que aquele EXE não usa). No SISTRUT a primeira é DS:0DC6 (`V_0dc6!`, item do menu). Como a classe `BC_VARS` começa pelos 6 bytes do `NMALLOC`, ele só cabe em DS:0DC0..0DC5, e o COMMON do SISTRUT começa e termina em DS:0DC0.
- Coerente com os módulos, que testam uma string do próprio COMMON para saber se voltam de um submódulo ou se fazem CLEAR: PILAR `LEN(V_0dcc$) = 0` (0x10148), FORMA `V_157a$ <> ""` (0x101b1), DESENHO `V_180a$ <> ""` (0x101ad), LAJE `V_0f28$ = "VOLTA ..."` (0x10125). Com COMMON vazio essas strings chegam vazias e o módulo faz CLEAR, que é o caminho da entrada pelo gerenciador. Se o SISTRUT passasse as próprias variáveis, o PILAR leria em DS:0DCC metade de `V_0dca!` e metade de `V_0dce!` como descritor de string.

`src-original/sistema/COMUM_SISTEMA.{BI,BM,json}` foi gerado com `python -I tools/common_familia.py sistema 0x0dc0 0x0dc0 SISTRUT SISEDIT`: bloco vazio, `RT_COMMON_GRAVA`/`RT_COMMON_LE`/`RT_COMMON_LIMPA` sem item. O SISEDIT declara um COMMON próprio (as variáveis dele começam em DS:0DC0, sem o `NMALLOC` na frente), que não entra no bloco da família: o SISEDIT faz CLEAR na primeira linha (0x1006c), recebe do SISTRUT um COMMON vazio e sai por RUN, então ninguém lê nem recebe esse bloco. As variáveis dele ficam como variáveis do programa e o `RT_CLEAR` as zera igual.

O que cada módulo recebe (V1 com a sonda `SONDA_CHAIN.BAS` no lugar do módulo; o original escreve isso em 0x14186..0x141f8, com `COLOR 7, 0, 0` e `CLS 0`):

| linha | texto | quem lê |
|---|---|---|
| 1 | ` Aguarde ...` | |
| 2 | (vazia) | |
| 3 | nome do fornecedor do original (na V1 com a marca: `OpenStrut (eng. reversa independente)`, mesma largura) | ninguém |
| 4 | `Leitura do Modulo <NOME>` | |
| 5 | `<placa, 3 letras> <impressora> <serial> <pasta dos EXE>`, ex. `CGA LPT1: COM1: C:\SISTRUT\EXEC40\` | LAJE, VIGA, PILAR, ARMADURA, FORMA, DESENHO, VPLOTA e SISEDIT leem as colunas 1..39 |

Atributos 07 em toda a tela, cursor na linha 6, coluna 1, nenhum byte de COMMON depois da tela no arquivo de troca do RT45 (versão 3 do arquivo: em modo texto, depois da tela vem só o VIEW PRINT corrente, 1 a 25). Conferido no oráculo com o caso `retrad_sis_chain_portico` (sonda QB4.5 `PORTICO.EXE`, só `A$ = INPUT$(1)`, compilada no oráculo pelo caso `retrad_sis_compila_sonda` e posta em `C:\SISTRUT\EXEC40` pelo `.dados`; o SISTRUT 4.0 não tem PORTICO, então nenhum binário original foi trocado). Na V1, a sonda foi chamada como PORTICO, LAJE, VIGA, PILAR, ARMADURA, FORMA, DESENHO, VPLOTA e SISEDIT: a linha 4 traz o nome certo em todos e a linha 5 é a mesma.

## Verificação de licença

Trechos de verificação de licença do original foram desativados (marcas PROTECAO em `src-original/sistema/correcoes.json`).

## Casos (`$ORACULO/casos/retrad_sis_*`)

Roteiro único para o original e a V1. Execuções do oráculo usadas (imagem padrão, relógio congelado): `runs/retrad_sis_<caso>-20261015-082*` (última de cada caso; lista no topo de `comparacao.txt`). `{F1}`, `{F2}`, `{F3}` e `{ESC}` vão pelo controlador de teclado nos dois lados e disparam o ON KEY como no original.

| caso | cobre | telas iguais |
|---|---|---|
| `retrad_sis_menu` | menu: setas e 2/4/6/8 pelas 17 posições, normalizações (11→21, 31→21, 43/53/73→63, 61→60, 82→80), letras P G T L V A F I C E (maiúsculas e minúsculas), tecla inválida, Ins e 0 (EXEC40/EXEC32) | 36 de 36 |
| `retrad_sis_inexist` | Enter em PORTICO, GRELHA, TRELICA (lista da versão 3.2) e DIAGRAMA, LDESENHO, LPLOTA, PDESENHO, PPLOTA: CHAIN falha, "Erro de Operacao", volta ao menu | 18 de 18 |
| `retrad_sis_exec32` | Ins + Enter: RUN em `EXEC32` para PORTICO, DESENHO→DETALHA e LAJE (que existe em EXEC40 e na pasta da V1), "Erro de Operacao" nos três, 0 volta | 11 de 11 |
| `retrad_sis_config` | Configuração completa com entradas recusadas (pasta sem `:\`, monitor 7 e 2 com CGA, impressora 3), LPT2:, SISTRUT.INI regravado, entrada no LAJE com a configuração nova | 13 de 13; INI igual byte a byte |
| `retrad_sis_laje` | L + Enter até o menu do LAJE | 3 de 3 |
| `retrad_sis_editor` | E + Enter (CHAIN `C:\SISTRUT\SISEDIT`), digitação, Enter, setas, Home, End, Del, PgUp, Tab, `~` recusado | 17 de 17 |
| `retrad_sis_onkey` | F1 (ajuda de 3 páginas), Esc (BEEP e menu), F3 (BEEP), F2 (fim) | 9 de 9 |
| `retrad_sis_onkey_editor` | SISEDIT: F1 (ajuda de 2 páginas), F2 (BEEP), Esc + Ler `LAJE.INI`, Deletar (N), Incluir, Salvar como `TESTE.INI`, outra tecla volta ao editor, Fim confirmado: RUN do SISTRUT e menu do gerenciador (f13) | 18 de 19 (FRE); TESTE.INI igual |
| `retrad_sis_onkey_editor2` | SISEDIT: Deletar confirmado, Incluir com o buffer (S), Ler arquivo inexistente ("Erro na leitura"), Salvar como `SISTRUT.DSP` (recusado), Fim negado | 17 de 17 |
| `retrad_sis_chain_portico` | tela deixada no CHAIN (com a sonda) | 2 de 2, com os 2.000 atributos |
| `retrad_sis_compila_sonda` | compila a sonda `PORTICO.EXE` no QB4.5 do oráculo (não é comparação; não foi rodado de novo) | — |

### Diferenças restantes

1. "Memoria Livre disponivel" na ajuda do SISEDIT (`onkey_editor`, h02): `INT(FRE(-1) / 1024)` (0x12921), 463 kb no oráculo e 292 kb na V1 (`RT_FREN&` fixo). É a diferença de FRE prevista.
2. Só na V1: a tela "Termino da Utilizacao do Sistema OpenStrut" do F2 (`onkey`, k08). No oráculo o DOSBox-X encerra quando o programa sai e a tela não é despejada.

O cursor do SISEDIT pisca por software (0x10f66..0x110d6: imprime o caractere, espera 0,1 s por TIMER, imprime `_`, espera 0,04 s); o oráculo despeja a tela num tique de tela parada, em qualquer das fases. Na rodada anterior 6 telas de `retrad_sis_editor` (s06..s11) diferiam só nessa célula; o `compara_retrad.py` as aceita como "igual (cursor)". Na rodada final as fases coincidiram nas 17 telas.

### Fora dos casos comparados

- Módulos de outras famílias (VIGA, PILAR, ARMADURA, FORMA, DESENHO, VPLOTA): o gerenciador entrega a mesma tela (sondas); a tela inicial de cada um fica para a família dele.

## Checklist do livro U60 (SISTRUT)

As 72 divergências do U60 comparam o original com a V1 antiga (`src-reconstructed`). Na retradução o código é o do original em cada endereço; todas ficam resolvidas por construção, menos as que tocam a verificação de licença do original, que fica desativada (marcas PROTECAO). Conferência no oráculo:

| divergência | onde | conferido no oráculo |
|---|---|---|
| U60-001, 002, 007 (INI em `<unidade do COMSPEC>:\SISTRUT\SISTRUT.INI`, padrão `A:\`, leitura por posição) | 0x10083..0x106e2 | sim: todas as telas do menu mostram em 24,50 a pasta lida da linha 3 do INI; `COMSPEC` vira C nos dois (Z: no DOSBox-X, C no Windows) |
| U60-008 (varre C, D, E, F, SISTRUTREDE, A, B) | L_10ff9 | não: o INI existe em todos os casos |
| U60-003 (SISTRUTREDE) | 0x102a9..0x1053f | não: variável ausente nos dois ambientes |
| U60-004, 005 | — | verificação de licença desativada (marcas PROTECAO) |
| U60-009 | — | verificação de licença desativada (marcas PROTECAO); sem INI a V1 segue com os padrões (não exercitado) |
| U60-010 (PATH = pasta dos EXE, 10 caracteres) | 0x112dc | reproduzido (`ENVIRON`); sem efeito visível nos casos |
| U60-011 (monitor ao iniciar) | 0x1131d..0x11389 | o lift diz o contrário do livro: se o INI diz HER o programa troca para CGA, e só volta a HER se o `PCOPY 0, 1` falhar (placa sem página 1). A V1 segue o lift. Com CGA, conferido em c03 (`<*1*>CGA`) |
| U60-012, 013 (ON ERROR inicial, SCREEN 0, PCOPY) | 0x1131d..0x11341 | reproduzido; implícito em todas as telas |
| U60-014..020, 022, 039, 040 (moldura, título, autor, árvore de 17 itens, rodapé F1/F2, fundo 7, realce do item e da letra) | L_115b0, L_12a69 | sim: `menu` m00..m35, texto e realce |
| U60-021, 064, 067 (cores e regras do Hercules) | 0x11728, 0x14b56, 0x14c20 | não: a instalação do oráculo é CGA; só o "2 recusado com CGA" (c05) |
| U60-023, 024 | — | verificação de licença desativada (marcas PROTECAO) |
| U60-025, 026, 046, 051 (tratador "Erro de Operacao", ERROR 53) | L_1250d, 0x14571 | sim: `inexist` e01..e16, `exec32` x02, x05 e x08 |
| U60-027 (F3..F10 = BEEP) | L_128db | sim: `onkey` k07 (tela igual; o som não é medido) |
| U60-028, 029 (F2: mensagem e CHDIR) | L_12906 | só na V1 (k08); o oráculo encerra sem despejar |
| U60-030 (KEY 15..18, Ctrl+Alt+Del = fim) | 0x126c2..0x1279f | não: o roteiro não manda Ctrl+Alt+Del |
| U60-031, 032 (Esc = BEEP e menu) | L_129ab | sim: `onkey` k06 |
| U60-033, 034, 048 (setas, 8/2/4/6, normalização, >73) | 0x1308d..0x13918 | sim: `menu` m01..m21 |
| U60-035 (letra só move o destaque) | 0x132d9..0x1357b | sim: `menu` m22..m32 |
| U60-036 (Enter) | 0x1358b | Enter sim (`inexist`, `laje`, `editor`, `config`); a parte da verificação de licença fica desativada (marcas PROTECAO) |
| U60-037 (Ins/0, caminho em 24,50) | 0x135d2..0x136a7 | sim: m34, m35, `exec32` (x01, x10) |
| U60-038, 049 (BEEP em tecla inválida) | 0x136b7, L_14165 | sim: m33 (tela igual; som não medido) |
| U60-041 (DIAGRAMA, LDESENHO, LPLOTA, PPLOTA) | L_13d85 | sim: `inexist` e04, e10, e12, e16 |
| U60-042 (DESENHO → DETALHA) | 0x14361, 0x1450d | pelo RUN em EXEC32, sim (`exec32` x05); pelo CHAIN em EXEC40, não (o DESENHO existe no oráculo) |
| U60-043, 044 (CHDIR, CHAIN, SISEDIT por `V_0dd8$`) | 0x14250..0x14349 | sim: `laje`, `editor`, `chain_portico` e sondas |
| U60-045, 052, 053 (versão 3.2 só para " 10 20 30 40 50 60 70 51") | 0x14443..0x144fa | sim pelo resultado (Erro de Operacao nos dois grupos); a linha "Versao 4.0 nao encontrda" é transitória e não foi despejada |
| U60-047 (tela "Aguarde / Leitura do Modulo") | 0x14181..0x141f8 | sim: `chain_portico`, texto e atributos |
| U60-050, 054..057, 059..063, 065, 066, 068, 069 (Configuração: pasta, monitor, impressora, serial, .BAT, gravação do INI) | L_14593 | sim: `config` c00..c10 e INI igual byte a byte, inclusive `PARAMETRIZADO EM:`; .BAT só vazio (com nome, o SHELL na entrada não roda com roteiro) |
| U60-058 (disco de instalação em A:/B:) | 0x15155..0x15221 | não |
| U60-070, 071 (F1: 3 páginas sobrepostas ao menu) | L_154ba | sim: `onkey` k01..k04 |
| U60-072 (F2/Esc durante a ajuda) | L_154ba com L_12615 | não |

## Checklist do livro U59 (SISEDIT)

| divergência | onde | conferido no oráculo |
|---|---|---|
| U59-001 | — | verificação de licença desativada (marcas PROTECAO) |
| U59-002 (CHDIR para a pasta da linha 5) | 0x104c4..0x1052b | o CHDIR não aparece nos casos (Ler e Salvar montam o caminho com `V_0dc4$:V_0dc8$`); a pasta lida da linha 5 aparece na linha 25 (s01) e o Ler de `LAJE.INI` sem caminho achou o arquivo nela (f03) |
| U59-003, 043, 045 (até 2001 linhas, `V_0e34! = 2000`) | 0x100e4, 0x13367 | não: arquivos pequenos |
| U59-004 (PCOPY 0, 1) | 0x1058c | reproduzido |
| U59-005, 006, 011 (tratadores de erro) | 0x10116, 0x1054a, 0x109a6 | o de leitura sim (`onkey_editor2` t08); os de CHDIR e de RUN que falha não |
| U59-007, 012, 025..027, 030, 031 (cabeçalho, cores, linhas 24/25, área 2..23, 80 colunas) | L_10a27, L_10b13, L_11d31 | sim: todas as telas do editor |
| U59-008, 013 (F2..F10 = BEEP) | L_10909 | sim: `onkey_editor` h04 (F2) |
| U59-009 (KEY 15..18 e 19..22) | 0x106f0..0x108d1 | Esc sim (f01, t03...); Ctrl+Alt+Del não |
| U59-010 (Fim = RUN SISTRUT) | L_10934 | sim: confirmação (f12; N em t14/t15) e RUN de volta ao menu do gerenciador (f13) |
| U59-014 (Tab anda 10) | 0x1175c | sim: s14 |
| U59-015, 018 (Shift+Tab, Ctrl+End, Ctrl+Home) | 0x116e2, 0x118b1, 0x11917 | não: o formato do roteiro não tem essas teclas |
| U59-016 (PgUp) | 0x1151b | sim: s13 |
| U59-017 (PgDn) | 0x115fc | não |
| U59-019, 020 (seta na coluna 1 / no fim da linha) | 0x1140a, 0x11484 | setas sim (s08, s10); os limites não |
| U59-021 (Del no fim da linha) | 0x1197d | Del sim no início (s07); no fim não |
| U59-022, 028 (Backspace ignorado) | 0x11b95 | não |
| U59-023 (só ASC 32..122) | 0x11b95 | sim: `~` recusado (s15) |
| U59-024 (cursor piscando por TIMER) | 0x10f66..0x110d6 | sim; ver a nota do cursor em "Diferenças restantes" |
| U59-029 (Enter não corta a linha) | 0x11a94 | sim: s03, s12 |
| U59-032 (confirmação do Fim) | 0x131e2 | sim: f12, t14 |
| U59-033, 034, 036 (Incluir antes da linha, buffer do Deletar, confirmações) | 0x12c65..0x131ae | sim: f04..f07, t03..t06 |
| U59-035 (Deletar a única linha) | 0x12c65 | não |
| U59-037, 038 (ajuda F1 em 2 páginas) | L_12085 | sim: h01, h02 |
| U59-039, 061, 062 (prompts do Ler e do Salvar) | 0x132d2, 0x13634, 0x1368b | sim: f02, f08, t10 |
| U59-040, 041 (memória livre FRE(-1)) | 0x12921 | diferente (FRE): 463 x 292 kb |
| U59-042, 049 (linhas finais e ^Z mantidos) | 0x1341e | sim pelo efeito: LAJE.INI lido e regravado igual (TESTE.INI byte a byte) |
| U59-044 (arquivo vazio) | 0x13434 | não |
| U59-046..048 ("Aguarde ..", "Ok leitura terminada") | 0x1333c, 0x134c4 | mensagens transitórias, não despejadas; a tela final (f03) é igual |
| U59-050..054 ("Erro na leitura", buffer apagado, nome zerado) | L_134f9 | sim: t08, t09 |
| U59-055, 056 (nomes protegidos .DSP .LAP .PIP) | 0x13729..0x1381d | sim: t11..t13 |
| U59-057, 060 (grava sem perguntar, "Ok gravacao terminada" e tecla) | 0x13855..0x13947 | sim: f09 (arquivo novo; sobrescrita não testada) |
| U59-059, 065..068 (erro de gravação) | L_1397d | não |
| U59-063, 064 (UCASE, sem trim, campo vazio mantém o nome) | 0x13663, 0x136ea | parcial: nomes digitados em maiúsculas |
| U59-058 (limite ARQ_MAX da V1 antiga) | — | não se aplica: não existe no original |

## Checklist do livro U69 (COMPART: módulos NOM e MIXT)

O U69 pertence ao "EXE" `COMPART` de `unidades.json`: os módulos compartilhados NOM e MIXT. O SISTRUT e o SISEDIT não têm o módulo NOM (`index.json`: só o programa e o MIXT); o MIXT vem de `src-original/comum/MIXT.BM` (agente do tradutor).

| item | uso na família | conferido no oráculo |
|---|---|---|
| FUN_4000_07f1 LimpaTeclado | 10 chamadas no SISTRUT, 16 no SISEDIT, antes de cada leitura | sim, em todos os casos |
| FUN_4000_082a / 0877 Maior / Menor | navegação do menu (0x130ed, 0x13175, 0x1320e, 0x132ac, 0x1376c) | sim: `menu` |
| F_40dbe GuardaTela | Configuração (6 chamadas), ajuda do SISEDIT (2) | sim: `config`, `onkey_editor` h01..h03 |
| FUN_3000_0042, Le2..Le6Campos, F_408c4 TextoGrafico | não usados pela família | não se aplica |
| U69-001..006 (Le3Campos no ARMADURA) | ARMADURA | não se aplica (família do ARMADURA) |

## Como reproduzir

```sh
# gerar (correcoes.json e COMUM_SISTEMA.* ficam em src-original/sistema)
python -I tools/common_familia.py sistema 0x0dc0 0x0dc0 SISTRUT SISEDIT
python -I tools/retraduz.py SISTRUT --familia sistema
python -I tools/retraduz.py SISEDIT --familia sistema
# SIS_BIN, SIS_BIN_SONDA: pastas dos EXE (V1 e sonda); SIS_C_BASE: pasta C: base (abaixo); ORACULO: pasta do oráculo
bash tools/qbcompile.sh "$(cygpath -aw src-original/sistema/SISTRUT.BAS)" "$(cygpath -aw "$SIS_BIN")\SISTRUT.exe"
bash tools/qbcompile.sh "$(cygpath -aw src-original/sistema/SISEDIT.BAS)" "$(cygpath -aw "$SIS_BIN")\SISEDIT.exe"
bash tools/qbcompile.sh "$(cygpath -aw src-original/laje/LAJE.BAS)" "$(cygpath -aw "$SIS_BIN")\LAJE.exe"
# sonda: SONDA_CHAIN.BAS compilada como PORTICO.exe, LAJE.exe, VIGA.exe... numa pasta com o SISTRUT.exe
# pasta C: base: SISTRUT\SISTRUT.INI e SISTRUT\EXEC40\{*.INI,*.DSP,*.LAP,*.PIP} de
#   runs/instalacao_oficial-20261013-145616/c.tar.gz (sem os .EXE)
bash tests/retraducao/sistema/roda_sistema.sh "$SIS_BIN" "$SIS_BIN_SONDA" "$SIS_C_BASE" "${V1_TRAB:-${TMPDIR:-/tmp}/v1-retrad}/sis-run/final"
```

Os casos do oráculo rodam com `ORACULO_BASE=/orig/instalado bash rodar.sh casos/retrad_sis_<caso>.txt "" 400` (imagem padrão, relógio fixo padrão). O `roda_retrad.sh` serve para começar pelo SISTRUT: a tela de entrada falsa que ele cria não influi, porque o SISTRUT limpa a tela (`CLS 2` em L_115b0) antes de desenhar o menu.
