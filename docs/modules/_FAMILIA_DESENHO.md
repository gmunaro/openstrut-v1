# Familia DESENHO - Visao geral

Fontes: strings dos executaveis originais `DESENHO.EXE`, `DESINIT.EXE` e `DESGRAF.EXE` (fora do repositorio). Specs por modulo: `DESENHO.md`, `DESINIT.md`, `DESGRAF.md`. Configs: `sistrut-game/DESENHO.INI`, `sistrut-game/SISTRUT.DSP`.
Convencoes: `[inferido]` = deducao sem prova direta. `[lacuna]` = nao esta nas strings dos executaveis.

## 1. Papel da familia

A familia trata o detalhamento e o desenho de vigas continuas do SISTRUT 4.0 (DOS, QuickBASIC 4.5 com BRUN45).

- DESENHO: gerenciador. Mostra o menu principal, lista as vigas gravadas e lanca os demais modulos.
- DESINIT: inicializacao e tabela de quantitativos "TABELA PARA 1 VIGA".
- DESGRAF: desenho grafico, escolha de adaptador de video, cabecalho OBRA/VIGA/ESCALA.
- DESEDITA, DESDIM, DESIMP, DESEDCAO: modulos da mesma familia, citados por nome nas strings do DESINIT.

## 2. Identificacao

- Titulo: `DETALHAMENTO E DESENHO DE VIGAS CONTINUAS`.
- Data: `Abril 1991`.
- Versao: `Versao 4.0`.

## 3. Menu principal do DESENHO

Letra inicial de cada item perdida nas strings (byte residual). Letras e destinos: ver DESENHO.md, secao 3 [inferido].

| Rotulo (com byte residual) | Destino provavel |
|---|---|
| `Detalhamento e Desenho` | DESDIM [inferido] |
| `Editadas, acesso as Vigas gravadas` | DESEDITA (token `DESEDITA`) |
| `Listagem dos dados arquivados` | listagem interna [inferido] |
| `Resumo geral de consumo` | Tabela Geral de Ferragem [inferido] |
| `Parametrizacoes / escolha` | Atualizacao de Parametros [inferido] |
| `Alteracao de Drive e Subdiretorio` | caminhos [inferido] |

Rodape: `<F2> = Fim`; `escolha opcao`.

## 4. Mapa de chamadas

| Origem | Destino | Evidencia | Status |
|---|---|---|---|
| DESENHO | DESEDITA | token `DESEDITA` | confirmado nas strings |
| DESENHO | DESDIM | mensagem de troca de disco `Coloque o disco contendo o Modulo ... em ... DESENHO` e token `DESDIM` | [inferido] |
| DESGRAF | DESDIM | token `DESDIM` | confirmado nas strings |
| DESENHO | DESGRAF | sem token nas strings do DESENHO | [lacuna] |
| DESENHO | DESINIT | sem token nas strings do DESENHO | [lacuna] |
| DESINIT | DESEDCAO, DESIMP, DESDIM, DESEDITA, DESENHO | lista de nomes nas strings do DESINIT | so lista; ordem de uso [lacuna] |
| DESENHO | VPLOTA | sem token nas strings | fora deste conjunto |

## 5. Arquivos compartilhados

| Arquivo | Usado por | Evidencia |
|---|---|---|
| `DESENHO.INI` | DESENHO (nome citado nas strings) | DESINIT le via DESAUXIN [inferido] |
| `.VIG` / `.SEC` / `.FOR` | DESENHO | caminho na tela de diretorios |
| `.EDV` | DESENHO | caminho na tela de diretorios |
| `.DSP` (parametrizacao) | DESENHO, DESINIT | caminho na tela de diretorios; `SISTRUT.DSP` [inferido] |
| `.DXF` / `.PUB` | DESENHO | caminho na tela de diretorios |

Segmentos `bm` (prefixo de segmento QuickBASIC, [inferido]):

- DESENHO: `bmDESENHO`, `bmDESAUX`, `bmDESCORRE`, `bmDESGRAV`, `bmNOM`, `bmMIXT`.
- DESINIT: `bmDESAUXIN`, `bmDESINI1`, `bmDESINI2`.
- DESGRAF: `bmDESAUXGR`.

## 6. Interfaces externas

- Impressora: `LPT1:`, `COM1:`. Mensagem `Verifique a Impressora e acione`. Codigos ESC em `DESENHO.INI`, linhas 10 a 13 [ev: sistrut-game/DESENHO.INI].
- Ambiente: `COMSPEC` e caminho `\SISTRUT\EXEC40\`. Indicam lancamento de programa externo [inferido].
- Video: adaptadores `XOR`, `HER`, `EGA`, `VGA` no DESENHO; lista completa CGA/MCG/EGA/VGA/HER no DESGRAF.
- Plotagem: `VPLOTA` e `PLOTER.INI` ficam fora deste conjunto [lacuna].
- Gerenciador: retorno `Retorno ao Modulo Gerenciador`; encerramento `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

## 7. Troca de disquete

- `Coloque o Disco de Dados no Drive` e `Coloque o disco contendo o Modulo`. Obsoleta; nao reimplementar.

## 8. Lacunas e incertezas

1. Origem dos valores de parametrizacao (`P` e itens 1 a 9) [lacuna].
2. Significado de `Ad Ae Af Bd Be Bf Cd Ce Cf` (codigos auxiliares) [lacuna].
3. Formato dos arquivos `.VIG`, `.SEC`, `.FOR`, `.EDV` [lacuna].
4. Ordem de chamada entre DESENHO, DESINIT e DESGRAF [lacuna].
5. Papel de `bmDESGRAV`, `bmDESCORRE`, `bmNOM` [lacuna].
