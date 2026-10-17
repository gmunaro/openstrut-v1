# Familia VIGA: relacoes entre modulos

Escopo: relacao entre VIGA.EXE e ARMADURA.EXE, e interfaces de arquivo com LAJE, PILAR, FORMA e DESENHO. Detalhe de cada modulo fica em `VIGA.md` e `ARMADURA.md`. Fonte de FORMA: `FORMA.md`. Formatos binarios nao foram decodificados (ver secao 3).

Fontes: strings dos executaveis originais (fora do repositorio) e os `.INI` de `sistrut-game/`. `[inferido]` marca conclusao que nao aparece literalmente nas strings do executavel.

## 1. Relacao VIGA e ARMADURA

- **INI:** `sistrut-game/VIGA.INI` e `sistrut-game/ARMADURA.INI` tem a mesma estrutura inicial: drive, diretorio, unidades e codigos de impressora.
- **Retorno:** ambos usam `*RETORNO*` nas telas de entrada de secao.
- **ARMADURA nao le `.VIG`.** As strings de ARMADURA nao tem nenhum token de extensao de viga. As ocorrencias de "VIG" sao o titulo "VIGAS DE CONCRETO" e "Secao da Viga". ARMADURA recebe a secao pela tela (menu 4, "Calculo ... Secao") ou pelo arquivo que ele mesmo grava, "Arquivo de Secoes para dimensionamento" e "Arquivar Secoes".
- **Ponto de contato:** nenhum arquivo comum entre os dois foi confirmado. O arquivo de secoes de ARMADURA nao tem nome nem extensao nas strings [lacuna].
- **Datas:** VIGA "Abril 1991" e "Versao 4.0    Abril 1990"; ARMADURA "Abril 1991", sem data de versao; FORMA "Outubro 1993". Divergencia registrada, nao resolvida.

## 2. Interfaces externas (arquivos lidos e gravados)

| Modulo | Arquivo | Acao | Fonte | Observacao |
|---|---|---|---|---|
| VIGA | `<obra>.VIG` | grava e le | strings de VIGA | nome default = nome da obra arquivada |
| VIGA | `<arquivo>.REP` | grava (menu 7, pergunta S/N) | strings de VIGA | somatoria de cargas nos pilares |
| PILAR | `.REP` | le | strings de VIGA: "sera recuperado pelo programa PILAR - Edificios" | o lado PILAR nao foi analisado |
| PILAR | `*.COL` | grava [inferido] | FORMA.md, secao 5 (`*.COL` "de PILAR") | strings de PILAR nao analisadas |
| LAJE | `*.LAJ` | grava [inferido] | FORMA.md, secao 5 | strings de LAJE nao analisadas; lado LAJE nao analisado |
| FORMA | `*.LAJ` | le | strings de FORMA | |
| FORMA | `*.VIG`, `*.SEC`, `*.FOR` | le | strings de FORMA | `.VIG` vem de VIGA; quem grava `.SEC` e `.FOR` nao foi confirmado |
| FORMA | `*.COL` | le | strings de FORMA | |
| FORMA | `*.FRM` | le (reedicao) e grava (FORMEDCA) | strings de FORMA | |
| FORMA | `*.FOP` | le (FORMPLOT) [inferido] | strings de FORMA | |
| FORMA | `*.DXF`, `*.PLT` | grava (FORMPLOT) [inferido] | strings de FORMA | drives definidos em FORMA.INI |
| VIGA | tela de desenho | saida para DESENHO [inferido] | strings de VIGA | titulos "OBRA - ", "VIGA - ", "ESCALA 1/" |
| DESENHO | ? | lacuna | strings de DESENHO nao analisadas | nao se sabe quais arquivos DESENHO le |

`.SEC` e `.FOR` nao aparecem nas strings de VIGA nem de ARMADURA. A origem deles fica como lacuna.

## 3. Lacunas

- **LAJE, PILAR e DESENHO nao foram analisados diretamente nesta nota.** As linhas de LAJE e PILAR vem de FORMA.md e de VIGA.md. Nada de DESENHO alem da tela de saida de VIGA.
- **Formatos binarios** de `.VIG`, `.REP`, `.COL`, `.LAJ`, `.SEC`, `.FOR`, `.FRM`, `.FOP`, `.DXF` e `.PLT` nao foram decodificados. Exige amostras reais ou analise de binario.
- **Quem grava `.SEC` e `.FOR`** nao foi confirmado.
- **Datas de versao** divergem entre modulos (secao 1). Sem fonte externa para resolver.
