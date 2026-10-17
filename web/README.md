# OpenStrut V1 no navegador (build web)

A V1 compilada para WebAssembly: o mesmo C++ que o QB64 PE 4.7.0 gera para o executável nativo, ligado a uma cópia da libqb adaptada ao Emscripten. Cada um dos 28 programas vira um módulo (`<EXE>.js` + `<EXE>.wasm`), carregado quando o CHAIN/RUN chega nele. O site é estático (GitHub Pages, `.github/workflows/pages.yml`), publicado em <https://gmunaro.github.io/openstrut-v1/>.

## Como funciona

| peça | onde | o que faz |
|---|---|---|
| C++ do programa | `tools/gera_cpp.sh` | `qb64pe -z -f:TargetBits=32` numa cópia privada do qb64pe (o `internal/temp` da instalação é compartilhado); no Linux e no Windows o C++ sai igual, salvo caminhos e `#line` |
| libqb web | `tools/prepara_libqb.py` | copia a libqb do QB64 PE e aplica trocas conferidas (`QB64_WEB`); o QB64 nativo não é tocado |
| `_FLOAT` de 80 bits | `runtime/qb_f80.h/.cpp`, `tools/f80iza.py`, `third_party/softfloat-3e` | em wasm o `long double` é quad; o `f80iza.py` troca `long double` por `qb_f80` no C++ gerado, no `qbx.cpp` e na libqb, e cada literal `...L` pelos bits exatos do estendido |
| plataforma | `runtime/libqb_web.inc`, `glut-emu-web.cpp`, `main-thread-web.cpp`, `qbweb_stubs.cpp` | sem threads: o programa roda no `main()` e o `Sleep`/TIMER/INKEY$ cedem ao navegador (Asyncify ou JSPI); a tela sai do quadro de software da libqb para o canvas; o teclado entra pelos callbacks do GLFW que a libqb já tem; SHELL vai para o JavaScript |
| página | `site/index.html`, `site/v1.js` | canvas que se ajusta à janela (celular), teclado físico e virtual (ESC, F1-F10, setas, TAB, ⌫, ENTER e o teclado do sistema), som, obras no IndexedDB, arquivos e impressora |
| cadeia e arquivos | `site/v1-nucleo.js` | um módulo por programa; no CHAIN/RUN o núcleo copia o sistema de arquivos do módulo que terminou para o seguinte |
| impressora | `site/impressora.js` | desenha o `IMPRESSORA.PRN` (ESC/P da Epson: texto, condensado, entrelinhas, imagem de 8 agulhas ESC K/L) em páginas para ver e imprimir; o `.PRN` também pode ser baixado |
| arquivos da obra | `site/zip.js`, painel "Arquivos" | lista o drive C:, baixa um arquivo ou tudo (.zip), importa arquivos ou .zip para uma pasta (nomes em maiúsculas, como o DOS) e apaga |

Sistema de arquivos de cada módulo (MEMFS):

- `/C`: o drive C: (`SISTRUT_C=/C`). Nomes em maiúsculas, como no DOS (`qbweb_caminho_dos`). Gravado no IndexedDB a cada 10 s e no fim de cada programa; a primeira vez vem de `sistrut-game/` (`instalacao.json`).
- `/EXE/<EXE>.exe`: arquivos vazios, onde o `RT_ACHA_EXE$` acha o módulo (`COMMAND$(0)` é `/EXE/<EXE>.exe`). A lista de módulos vem do `modulos.json` do site.
- `/TMP`: `TEMP`, arquivos de troca do CHAIN.
- `/SAIDA`: `SISTRUT_SAIDA`, com a impressora (`impressora.prn`) e, com roteiro, as telas e o log.

Mudanças no RT45 por causa da web (o nativo do Windows não muda):

- `RT45X87.h`: no Emscripten o `rt45_fsqrt` usa a raiz do `qb_f80` em vez do `fsqrt` em assembly.
- `RT45.BM`, `RT_FILES`: o cabeçalho do FILES troca `/` por `\` (fora do Windows o `_CWD$` usa `/`).

### Ponto flutuante

`qb_f80` tem o leiaute de memória do x87 (o `RT45X87.h` lê os 10 bytes e funciona sem mudança). Conferido contra o x87 nativo (clang do QB64, Ryzen 5 3600) com `tests/f80` (30 mil casos de cada):

| operação | igual ao nativo |
|---|---|
| `+ - * /`, comparações, `SQR` (FSQRT), `INT`/`floor`, conversões para float/double/inteiros, arredondamento do `qbr` (FISTP) | 100% |
| VAL (decimal → estendido), literais do C++ gerado, `"%.*LG"` (`_TOSTR$`), `"% .*Lf"` (PRINT USING de `_FLOAT`) | 100% |
| `^` e `SQR` do RT45 (`RT45X87.h`, modelo fixo em software) | é o mesmo código C, compilado para wasm |
| SIN, COS (`sinl`/`cosl` do mingw: FSIN/FCOS do Zen 2, modelados em `runtime/x87_zen2.cpp`) | 99,96% e 99,95% |
| ATN (`atanl`: FPATAN do Zen 2, modelado) | 99,91% |
| LOG (`logl`: FYL2X/FYL2XP1 do Zen 2, modelados) | 99,997% |
| EXP (`expl`: a sequencia do mingw; o F2XM1 e o valor exato arredondado) | 99,39% |
| TAN (`tanl`: o FPTAN e o valor exato arredondado) | 97,5% |

Medido com `web/tests/x87/roda_f80.sh 30000 1` (web contra o x87 nativo, 30 mil casos por funcao). O que difere e sempre 1 ulp do estendido; nas instrucoes, contra o hardware, ver `runtime/x87_zen2.md`. Onde o modelo nao e bit a bit (FPTAN, F2XM1, o resto do FSIN/FCOS/FPATAN), a prova de que a diferenca nao chega ao resultado e a comparacao nativo x web byte a byte das familias (`tests/familias.sh`). Uso nos 28 programas: TAN em ARMADURA, FORMIMP, FORMPLOT, LAJECALC, LAJEMONT e LAJEPROC; SIN/COS/ATN em armacao, forma, laje e pilar; EXP e LOG em nenhum (o `^` passa pelo `RT45X87.h`).

## Compilar

Pré-requisitos: QB64 PE 4.7.0 (`QB64_DIR`, padrão `/c/qb64pe/qb64pe`), emsdk 6.0.12 (`git clone https://github.com/emscripten-core/emsdk && emsdk install 6.0.12 && emsdk activate 6.0.12`; com o `em++` no PATH ou `EMSDK` apontando para a pasta), Python 3, bash (Git Bash no Windows).

```sh
bash web/tools/build.sh todos                                       # os 28, Asyncify (publicacao) -> web/dist
WEB_ASYNC=jspi WEB_PJ=6 bash web/tools/build.sh todos               # JSPI: link rapido, para desenvolver
bash web/tools/build.sh armacao/ARMADURA.BAS sistema/SISTRUT.BAS   # so alguns
bash web/tools/monta_sonda.sh web/dist web/dist_sonda               # site da sonda do CHAIN (familia sistema)
```

`WEB_ASYNC=asyncify` (padrão) roda em todo navegador; `jspi` precisa de Chrome 137+ ou Node com `--experimental-wasm-jspi`. `WEB_PJ`: programas em paralelo (padrão 4); log de cada um em `$WEB_BUILD/log/<EXE>.log` (`WEB_BUILD`, padrão `$TMPDIR/v1web/build`).

## Testar

```sh
cd web && bun install && cd ..                 # playwright-core (Chrome headless; usa o Chrome instalado)
# um roteiro, como o tools/roda_retrad.sh: no Chrome headless ou no Node
node web/tests/paridade_navegador.cjs web/dist ARMADURA tests/retraducao/armacao/uma.sufixo.txt <saida> <pasta C:>
# os roda_casos.sh das familias rodam a web sem mudanca: V1_WEB aponta para o site
# (ORACULO, SIS_C_BASE e LAJE_C_E2E como nos roda_casos.sh: o oraculo e os discos C: de partida)
V1_WEB=web/dist bash tests/retraducao/laje/roda_casos.sh <ignorado> <trabalho>
# familia por familia: nativo e web, placar do oraculo dos dois lados e nativo x web byte a byte
bash web/tests/familias.sh <pasta dos EXE nativos> web/dist <trabalho> armacao laje viga pilar forma desenho sistema extras
# paridade do CI: casos com as entradas no repositorio, contra a saida nativa guardada
bash web/tests/referencia/gera_referencia.sh <pasta dos EXE nativos>
node web/tests/referencia.cjs web/dist
```

- `tools/roda_retrad.sh`: com `V1_WEB=<site>` chama `web/tests/roda_retrad_web.sh`, que roda a página no Chrome headless (`V1_WEB_EXECUTOR=node` para o Node) e devolve o drive C: final para a pasta, como o EXE nativo. Uma pasta de EXE com um arquivo `v1web.dist` aponta para outro site (a sonda do `roda_sistema.sh`).
- `tests/f80`: `gera_vetores.cpp` (nativo, clang do QB64) grava os resultados do x87; `testa_vetores.cpp` (em++, Node) confere o `qb_f80` contra eles.
- `tests/sondas`: programas pequenos (READ/INPUT #/VAL, desempenho), rodados por `roda_sonda.cjs` (Node) e `sonda_navegador.cjs` (Chrome).

## CI (`.github/workflows/pages.yml`)

1. `libqb`: instala o QB64 PE (cache) e o emsdk, compila a libqb web e lista os programas.
2. `programa`: matriz com os 28, um por job, em paralelo; cache do `.js`/`.wasm` pela assinatura do programa, do COMMON da família, do RT45/MIXT, da camada web e das versões.
3. `site`: junta os módulos, a página, `modulos.json` e a instalação; roda `web/tests/referencia.cjs` (contra a saída nativa guardada) e `web/tests/pagina.cjs` no Chrome headless, com o site em `/openstrut-v1/`; publica no Pages.

## Resultados (17/10/2026)

Roteiros de cada familia (`tests/retraducao/<familia>/roda_casos.sh`, sem mudanca) na pagina, no Chrome headless, com o build Asyncify feito no Linux (o que o CI publica), comparados byte a byte com o nativo do Windows (`tests/familias.sh`): telas (texto, atributo, realce, PNG), impressora e arquivos da obra.

| familia | casos | nativo x web | placar do oraculo |
|---|---|---|---|
| armacao | 8 | 665 de 665 | igual nos dois lados: 191 de 191 |
| forma | 5 | 364 de 364 | igual: 112 de 112 |
| laje | 16 | 2.016 de 2.016 | igual (as diferencas conhecidas: FRE, TIMER) |
| viga | 22 | 1.902 de 1.902 | igual: todos sem diferenca |
| pilar | 19 | 1.599 de 1.599 | igual (geo, teclas e trava como no nativo) |
| desenho | 14 | 1.851 de 1.851 | igual (det e p3: cabecalho de marca, como no nativo) |
| sistema | 10 + 8 sondas | 688 de 688 | resumo identico (onkey_editor: FRE) |
| roteiros soltos (piloto, onkey, run_sisedit, exec32) | 4 | 224 de 224 | piloto 27 de 29 (FRE) |

O caso `trava` do pilar fica em laco sem fim alternando COLOR 4 e 3 no "Aguarde ...", e a cor capturada depende do instante: numa rodada com a maquina carregada a web saiu com a outra cor; repetido, igual.

Defeitos que a comparacao achou e que foram corrigidos: o cabecalho do FILES fora do Windows (RT45), o FIX de `_FLOAT` (os templates da libqb nao truncavam o `qb_f80`; o VIGA x1 nao transferia a reacao da carga indexada) e a gravacao em arquivo com buffer (a impressora perdia o fim quando o programa era interrompido).

Build (Linux, 8 nucleos, com outros processos: carga 12 a 19): libqb 32 s; os 28 com Asyncify em 70 min, 4 em paralelo; o mais lento, DESDIM (link de 26 min sob carga). Site: 28 modulos, 26 MB, 15,1 MB com gzip. No CI cada programa e um job com cache pela assinatura das fontes: um build completo custa por volta de 28 jobs de 10 a 30 min; depois so os programas que mudaram.

