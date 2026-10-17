# DESINIT.EXE - Especificacao funcional

Fontes: strings do executavel original `DESINIT.EXE` (fora do repositorio). Configs citados: `sistrut-game/DESENHO.INI`, `sistrut-game/SISTRUT.DSP`.
Convencoes: `[inferido]` = deducao sem prova direta. `[lacuna]` = sem evidencia.

## 1. Papel do modulo

DESINIT.EXE e o modulo de inicializacao do ramo DESENHO. Pelas strings, ele (a) monta o quadro de quantitativos "TABELA PARA 1 VIGA" com cabecalhos de cobrimento, Fck, volume de concreto, area de forma e aco; (b) contem a lista de nomes dos modulos da familia DESENHO, o que indica papel de despachante; (c) sinaliza erro ou retorno ao gerenciador [inferido].

Nao ha tela de identificacao (titulo, autor, data) nas strings, exceto a marca `SISTRUT`.

## 2. Chamada e retorno

**Entrada.** DESENHO.EXE (gerenciador) lanca DESINIT. As strings nao trazem a linha de comando; o token `DESINIT` aparece no proprio executavel [inferido: lancamento via `SHELL`/`CHAIN` como os demais modulos da suite].

**Tokens de despacho presentes.** Bloco de nomes de modulo, na mesma ordem: `DESEDCAO`, `INITRAN`, `DESIMP`, `DESDIM`, `DESEDITA`, `DESENHO`, `DESINIT`. `INITRAN` nao corresponde a nenhum EXE da familia; pode ser rotina ou modulo interno [inferido].

**Retorno.** Mensagem `Retorno ao Modulo Gerenciador` e encerramento `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. Nao ha token `VOLTA <MOD>` neste modulo (o `VOLTA` aparece em DESEDCAO, nao aqui).

## 3. Telas e menus

Nao ha menu com hotkeys nas strings. Textos visiveis:

| Texto exato | Uso |
|---|---|
| `Aguarde ...` | espera durante processamento |
| `Acione ESC <Enter> para Continuar ` | pausa apos erro ou aviso |
| `Retorno ao Modulo Gerenciador` | saida normal |
| `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` | encerramento total |
| `SISTRUT` (com caractere de caixa no fim) | titulo |
| `EGA`, `VGA`, `HER` (com bytes residuais) | lista de adaptadores de video [inferido: deteccao ou selecao do modo grafico] |

**Quadro de quantitativos (texto de desenho/tabela).** Os rotulos da tabela impressa/desenhada pelo modulo sao: `COBRIMENTO` / `CM`; `Fck`; volume de concreto (rotulo abreviado, terminado em `CONCR`); `AREA FORMA`; `ACO  #   TOTAL PESO`; `TABELA PARA 1 VIGA`; `MEDIDAS EM CM`; `REPETIR` / `VEZES`; `#   Q  UNI TOTAL`.

[inferido: `#` = numero da barra; `Q` = quantidade; `UNI` = comprimento unitario; `TOTAL` = comprimento total; `REPETIR x VEZES` = multiplicador de barras repetidas.]

## 4. Entradas do usuario

As strings nao tem prompt de campo (nenhum `INPUT`/rotulo de dado). A unica interacao textual e o `ESC`/`Enter` de pausa.

- Parametros de cobrimento, Fck, volume, forma e aco: **nao** vem do teclado. Os rotulos sao de saida [inferido].
- Padroes do DESENHO.INI que alimentam o modulo: caminhos de `.VIG`, `.SEC`, `.FOR`, `.EDV`, `.DSP`, `.DXF`, `.PUB` (linhas 2 a 5) e codigos de impressora (linhas 10 a 13) [ev: sistrut-game/DESENHO.INI]. Nao ha campo unico de DESINIT no INI.
- Padroes do SISTRUT.DSP usados no detalhamento (secao "PARAMETRIZACAO DOS DADOS DE DESENHO DE VIGAS", linhas 259 a 336): tabela de ganchos por bitola (linhas 274 a 283), bitola minima de porta-estribo por Hw (292 a 297), pele por Hw (310 a 315), letra de nome de ferro `N` (319), porta-estribo automatico `S` (320), ordem da bitola minima porta-estribo `2` (321), transpasse `15` (322), comprimento desenvolvido `S` (323), raio de dobra `8` (324), minimo de armadura negativa `0.001` (325), altura para pele `60` (326), multiplicador de pele `0.0005` (327), transpasse de pele `20` (328), distancia minima de estribo `40` (329), ancoragem minima `20` (330), verificacao de grampos `S` (331), reducao de ancoragem `N` (332), bitola CA60 `1` (333), comprimento maximo de ferragem `1050` cm (334). [ev: sistrut-game/SISTRUT.DSP linhas 274 a 334]
- Unidades: `m` (linear) e `t` (forca), coeficientes `1` e `1` em DESENHO.INI linhas 6 a 9.

## 5. Arquivos lidos e gravados

Nenhuma extensao de arquivo aparece nas strings de DESINIT. Os caminhos vem do DESENHO.INI em tempo de execucao [inferido].

| Arquivo | Direcao | Evidencia | Formato |
|---|---|---|---|
| `DESENHO.INI` | le (via modulo auxiliar `DESAUXIN`) [inferido] | sistrut-game/DESENHO.INI | texto, linhas `valor=descricao` |
| `SISTRUT.DSP` | le [inferido] | sistrut-game/SISTRUT.DSP | texto, comentarios com `*` e blocos `PARAMETROS` |
| `.VIG` / `.SEC` / `.FOR` / `.EDV` | le [inferido] | caminhos definidos no DESENHO.INI | sem evidencia nas strings de DESINIT |

Modulos auxiliares de dados sao referenciados por nome: `DESAUXIN`, `DESINI1`, `DESINI2`, `MIXT` [inferido: segmentos de codigo do QuickBASIC; `MIXT` sem papel claro].

## 6. Processamento

Nao ha primitivas graficas nem textos de calculo nas strings de DESINIT. O que as strings permitem afirmar:

- Ha um modulo auxiliar de inicializacao (`DESAUXIN`) e duas partes de inicializacao (`DESINI1`, `DESINI2`) [inferido: preparam variaveis, tela e leitura de configs].
- A tabela de quantitativos por viga (secao 3) e o unico bloco de saida com rotulos. Os valores sao calculados por outro modulo ou pelo proprio DESINIT; as strings nao dizem qual [lacuna].
- Escalas, primitivas (`LINE`, `CIRCLE`, `PSET`) e detalhamento de ferros nao aparecem. Os textos de escala (`ESCALA 1/`) estao em DESGRAF, nao aqui.

## 7. Relatorios, impressao e plotagem

- Nao ha texto de impressora nem plotter nas strings de DESINIT. Os codigos ESC de impressora ficam no DESENHO.INI (linhas 10 a 13).
- A tabela de quantitativos (secao 3) e a unica saida textual; se for impressa, a rotina e outra. [lacuna]

## 8. Mensagens de erro

| Texto | Acao |
|---|---|
| `Modulo nao encontrado em ` | falha ao lancar modulo; mostra caminho |
| `erro no processamento` | erro generico |
| `verifique a consistencia dos seus dados` | erro de dado de entrada |
| `Acione ESC <Enter> para Continuar ` | pausa |

Os erros de runtime do BRUN45 (`R6005`, `R6006`, `R6007`, `Error in loading RTM`) sao do runtime, nao do modulo; ignorados.

## 9. Troca de disquete

- `Coloque o Disco U / no Drive`: troca de disquete (obsoleta). Nao reimplementar.

## 10. Lacunas

1. Origem dos valores do quadro (cobrimento, Fck, volume, forma, aco): nao identificada nas strings.
2. Significado exato de `DESAUXIN`, `DESINI1`, `DESINI2`, `MIXT`, `INITRAN`: nomes de segmento ou rotina, sem papel confirmado.
3. Formato dos arquivos `.VIG`/`.SEC`/`.FOR`/`.EDV` lidos: sem evidencia nas strings deste modulo.
4. Ordem de chamada real entre DESINIT, DESENHO e DESGRAF: [inferido] a partir da lista de tokens.
5. Mensagem `Coloque o Disco U`: a letra/nome da variavel nao esta clara nas strings.
