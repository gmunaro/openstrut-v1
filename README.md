# OpenStrut V1

> A OpenStrut V1 é uma retradução, por engenharia reversa, do SISTRUT 4.0 (1991), sem vínculo com os autores do original.
>
> **Os resultados exigem conferência de engenheiro responsável.** A V1 reproduz o original inclusive nos defeitos dele (ver os `CHECKLIST.md` das famílias em `tests/retraducao/`).

O SISTRUT 4.0 é uma suíte MS-DOS de cálculo e detalhamento de estruturas de concreto armado pela NB-1/78: lajes, vigas, pilares, armação, formas, desenho e plotagem. Foi escrito em QuickBASIC 4.5 e distribuído sem código-fonte. O OpenStrut não é produto da empresa do SISTRUT nem tem vínculo com ela ou com os autores do original.

A V1 é o SISTRUT 4.0 retraduzido para QB64 Phoenix Edition, comando por comando, a partir do código do próprio EXE original: 28 programas, um por EXE (o instalador não entra). Os executáveis do original foram desassemblados, e o tradutor (`tools/retraduz.py`) gera BASIC compilável no QB64 PE. Um runtime próprio (RT45, `src-original/comum/`) reproduz a semântica do runtime do QuickBASIC 4.5 (BRUN45): ponto flutuante do x87, COMMON e CHAIN, teclado, tela e impressora. O critério é ser idêntica ao original, inclusive nos bugs. Ela calcula, mostra as telas, imprime e grava os arquivos como o original, e foi conferida contra ele rodando lado a lado (tela a tela, pixel a pixel e byte a byte). As diferenças em relação ao original são três:

- A marca. As telas e os relatórios dizem OpenStrut no lugar da empresa, do autor e do licenciado do original, com o crédito "OpenStrut - engenharia reversa independente do SISTRUT 4.0 (1991)". O texto novo ocupa a mesma largura do antigo, então o leiaute não muda. A tabela das trocas, com o motivo de cada uma, está em [`src-original/marca.json`](src-original/marca.json).
- Os trechos de verificação de licença do original foram desativados (marcas `PROTECAO` em `src-original/<familia>/correcoes.json` e em `tools/retraduz.py`).
- O que o DOS e a impressora faziam fica no runtime de apoio (`src-original/comum/RT45.BM`): a impressora vira um arquivo com os mesmos bytes, e o caminho `C:\` pode apontar para uma pasta do Windows.

Nomes de arquivo, caminhos (`C:\SISTRUT\EXEC40\`), nomes dos EXE e formatos de arquivo continuam os do original. Uma obra gravada pelo SISTRUT 4.0 abre no OpenStrut V1 e vice-versa. Os arquivos que os programas gravam (`.LAJ`, `.RLP`, `.REP`, `.COL`, `.FRM`, `.AVF`, `SISTRUT.INI`...) mantêm a linha de assinatura do formato que o original grava no cabeçalho, porque o sistema relê esses arquivos e a V2 reconhece o `.LAJ` por ela.

A V2, a reimplementação em TypeScript, está em [gmunaro/openstrut](https://github.com/gmunaro/openstrut) (https://gmunaro.github.io/openstrut/).

## Estrutura

```
src-original/                 a V1 (OpenStrut V1)
  marca.json                  trocas de marca: texto do original -> texto do OpenStrut
  comum/RT45.BI/.BM           runtime de apoio (o que o BRUN45 do QuickBASIC fazia)
  comum/RT45GFX.BI/.BM        primitivas gráficas do BRUN45 (LINE, CIRCLE, PSET...)
  comum/MIXT.BM               módulo MIXT, comum aos 28 programas
  <familia>/<EXE>.BAS         um programa por EXE do original (gerado)
  <familia>/COMUM_*.BI/.BM    bloco COMMON da família (gerado)
  <familia>/correcoes.json    correções à mão (só a desativação da verificação de licença)
tools/retraduz.py             tradutor: pseudo-BASIC do EXE original -> .BAS do QB64
tools/regenera.sh             regenera os 28 .BAS
tools/roda_retrad.sh          roda um programa com um roteiro de teclas e grava as telas
tools/compara_retrad.py       compara a execução da V1 com a do original
tests/retraducao/<familia>/   casos, scripts e CHECKLIST.md de cada família
docs/RETRADUCAO.md            convenções da retradução e resultados
src-reconstructed/            versão anterior (reconstrução a partir das strings; referência)
tests/T_*.BAS, roteiros/      testes de unidade e roteiros de teclas da versão anterior
paridade/                     comparação de resultados V1 x V2 x original
sistrut-game/                 INIs e parametrizações da instalação do original
pacote/                       instaladores (V1 + V2) para Windows, Linux e macOS
```

Famílias e programas: sistema (SISTRUT, o gerenciador, e SISEDIT), laje (LAJE, LAJEGEOM, LAJECALC, LAJEMONT, LAJEGRAV, LAJEPROC), viga (VIGA, VPLOTA), armacao (ARMADURA), pilar (PILAR, PILAREDI, PILGEEDI, PIPROEDI, PIGRAEDI), forma (FORMA, FORMEDCA, FORMIMP, FORMINIT, FORMPLOT), desenho (DESENHO, DESDIM, DESEDCAO, DESEDITA, DESGRAF, DESIMP, DESINIT).

Os arquivos de `sistrut-game/` são os da instalação do original, com os mesmos bytes de dados. O cabeçalho de comentário que identificava a empresa e o autor (`.DSP`, `.LAP`, `.PIP`, `.FOP`, `PLOTER.INI`) foi trocado por texto neutro de mesma largura ("OpenStrut", "(omitido)"). A linha 9 do `SISTRUT.INI` tem um valor neutro de mesmo comprimento: o gerenciador só a copia ao gravar a configuração. Esses arquivos ficam no repositório porque a V1 precisa deles para rodar.

## Compilar

Pré-requisitos: [QB64 Phoenix Edition](https://www.qb64phoenix.com/) 4.7.0 e o bash (no Windows, o do Git for Windows). O QB64 PE fica em `C:\qb64pe\qb64pe\` por padrão; outro lugar vai em `QB64_DIR`. Os scripts foram usados no Windows; no Linux e no macOS o CI ainda não rodou.

Os 28 programas da V1, numa pasta só (o caminho do fonte não pode ter espaço, porque o qb64pe não aceita):

```sh
mkdir -p bin
for f in src-original/*/*.BAS; do
  bash tools/qbcompile.sh "$(cygpath -m "$PWD/$f")" "$(cygpath -m "$PWD")/bin/$(basename "$f" .BAS).exe"
done
```

Fora do Windows, troque `$(cygpath -m ...)` pelo caminho absoluto. Os 28 EXE precisam ficar na mesma pasta: o gerenciador e os módulos se chamam por CHAIN/RUN pelo nome, e o RT45 procura o EXE na pasta do executável quando o caminho DOS do original (`C:\SISTRUT\EXEC40\`) não existe.

`bash tools/build.sh` compila a versão anterior (`src-reconstructed/`) em `build/`, com os arquivos de `sistrut-game/`. É o que o CI compila hoje (`.github/CI.md`).

## Rodar

O programa procura a instalação em `C:\SISTRUT\` (`SISTRUT.INI`) e em `C:\SISTRUT\EXEC40\` (os `.INI` dos módulos e as parametrizações `SISTRUT.LAP`, `.PIP`, `.DSP`, `.FOP`). Com a variável `SISTRUT_C=<pasta>`, o `C:\` dos caminhos do original vira essa pasta. Monte `<pasta>\SISTRUT\SISTRUT.INI` e `<pasta>\SISTRUT\EXEC40\` com os arquivos de `sistrut-game/` e rode `SISTRUT.exe`, o gerenciador:

```sh
mkdir -p c/SISTRUT/EXEC40
cp sistrut-game/SISTRUT.INI c/SISTRUT/
cp sistrut-game/* c/SISTRUT/EXEC40/
SISTRUT_C="$(cygpath -w "$PWD/c")" ./bin/SISTRUT.exe
```

A impressora vai para `IMPRESSORA.PRN` na pasta corrente (ESC/P da Epson, como o original mandava para a LPT1). Outras variáveis do RT45 (roteiro de teclas, relógio fixo, log): `docs/RETRADUCAO.md`.

## Regenerar os fontes

Os `.BAS` de `src-original/` não são editados à mão: saem do tradutor, e regenerar reproduz os arquivos do repositório byte a byte. O tradutor lê o pseudo-BASIC recuperado dos EXE originais (`dump/<EXE>/*.lift.txt`), que não está no repositório; a pasta vem de `--dump` ou da variável `REA_WORK` (dump em `$REA_WORK/dump`).

```sh
REA_WORK=<pasta> bash tools/regenera.sh src-original                         # OpenStrut (padrão)
REA_WORK=<pasta> bash tools/regenera.sh <outra pasta> --marca original       # texto do SISTRUT 4.0, sem troca de marca
```

`--marca original` gera os fontes sem a troca de marca. É a prova de que a camada de marca só mexe nos textos da tabela. Na tabela, os textos do original com nome de pessoa ou da empresa ficam só como sha256 (ver `tools/marca.py`).

## Testar

Sem o original (rodam em qualquer máquina com o QB64 PE; são os passos do CI):

```sh
bash tools/build.sh          # compila src-reconstructed/
bash tools/runtests.sh       # tests/T_*.BAS
bash tools/roteiros.sh       # roteiros de teclas (roteiros/)
```

Contra o original: os testes de `tests/retraducao/` rodam a V1 com um roteiro de teclas e comparam com o original rodando no "oráculo" (DOSBox-X com a instalação oficial do SISTRUT 4.0, fora do repositório, na pasta de `ORACULO`): cada tela em texto e atributo de cor, cada desenho pixel a pixel, a impressora e os arquivos da obra byte a byte.

```sh
bash tools/roda_retrad.sh <pasta dos EXE> LAJE tests/retraducao/lajeproc_e2e.sufixo.txt <saída> <pasta C:>
python -I tools/compara_retrad.py "$ORACULO/runs/retrad_lajeproc-20261015-082452" <saída>
ORACULO=<pasta> LAJE_C_E2E=<pasta C: base> bash tests/retraducao/laje/roda_casos.sh <pasta dos EXE> <pasta de trabalho>
```

Cada família tem o seu `roda_casos.sh` (o sistema tem `roda_sistema.sh`); o cabeçalho de cada script lista as variáveis que ele pede. O `compara_retrad.py` aplica às telas e à impressora do original a mesma tabela de marca (`--marca openstrut`, o padrão), então a comparação de uma V1 OpenStrut com o original dá igual. Para as trocas guardadas só como hash, ele lê o texto do original de `V1_MARCA_ORIGINAL` (fora do repositório). Para EXE gerados com `--marca original`, use `V1_MARCA=original`.

Resultado por família: `tests/retraducao/<familia>/CHECKLIST.md`. As únicas diferenças conhecidas são o "Kbytes livres" (FRE), que depende da memória do DOS, e os pontos listados em cada checklist.

## Documentação

- [`docs/RETRADUCAO.md`](docs/RETRADUCAO.md): como o tradutor funciona, as regras de ponto flutuante, COMMON e CHAIN, teclado, impressora, verificação de licença, marca e os resultados.
- `tests/retraducao/<familia>/CHECKLIST.md`: o que cada caso cobre e o que foi conferido no original.
- [`src-original/marca.json`](src-original/marca.json): o que mudou de texto e o que ficou, com o motivo.
- `docs/RECONSTRUCAO.md`, `docs/formats/`, `docs/modules/`: documentação da versão anterior (`src-reconstructed`), mantida como referência. A especificação dos formatos ali é a da versão anterior, não a do original.
- [`.github/CI.md`](.github/CI.md): o build e a release no GitHub Actions.

## Licença

Copyright (C) 2026 gmunaro.

Este programa é software livre: você pode redistribuí-lo e modificá-lo nos termos da GNU General Public License, versão 3 ou (a seu critério) qualquer versão posterior, publicada pela Free Software Foundation. Ele é distribuído sem nenhuma garantia. O texto completo está em [`LICENSE`](LICENSE).

O SISTRUT 4.0 não é distribuído aqui: o repositório não traz executável, disquete nem arquivo extraído do original, além dos arquivos de parametrização da instalação em `sistrut-game/`.
