# DESGRAF.EXE - Especificacao funcional

Fontes: strings do executavel original `DESGRAF.EXE` (fora do repositorio). Configs citados: `sistrut-game/DESENHO.INI`, `sistrut-game/SISTRUT.DSP`.
Convencoes: `[inferido]` = deducao sem prova direta. `[lacuna]` = sem evidencia.

## 1. Papel do modulo

DESGRAF.EXE e o modulo de desenho grafico do ramo DESENHO. Pelas strings, ele (a) pede o tipo de adaptador de video (CGA, MCG, EGA, VGA, HER); (b) oferece saida em FOTO ou VIDEO; (c) desenha um cabecalho com `OBRA`, `VIGA` e `ESCALA 1/`; (d) pode lancar DESDIM (cotagem) [inferido: o detalhamento grafico em si nao tem rotulos nas strings, so o cabecalho].

Nao ha tela de identificacao (titulo, autor, data) nas strings.

## 2. Chamada e retorno

**Entrada.** O token `DESGRAF` esta no proprio executavel. As strings nao trazem o chamador. Nao ha token `DESINIT` nem `DESENHO` em DESGRAF; logo DESGRAF nao os chama. Quem lanca DESGRAF e o gerenciador DESENHO [inferido].

**Tokens de despacho.** `DESDIM` (com a mensagem de troca de disco abaixo). Nao ha `VOLTA <MOD>` nas strings.

**Retorno.** `Retorno ao Modulo Gerenciador` e `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

## 3. Telas e menus

| Texto exato | Uso |
|---|---|
| `SISTRUT` (com caractere de caixa) | titulo |
| `CGA` (byte residual antes) | opcao de adaptador de video |
| `MCG` | opcao de adaptador de video [inferido: MCGA] |
| `EGA` | opcao de adaptador de video |
| `VGA` | opcao de adaptador de video |
| `HER` | opcao de adaptador de video (Hercules) |
| `FOTO` | saida de imagem [inferido: copia/fotografia da tela ou impressao] |
| `VIDEO` | saida de tela [inferido] |
| `OBRA - ` | rotulo do cabecalho do desenho |
| `VIGA - ` | rotulo do cabecalho do desenho |
| `ESCALA 1/` | rotulo da escala do desenho |
| `Qualquer Tecla para Continuar ` | pausa de tela |

Os rotulos de `FOTO`/`VIDEO` estao juntos, sem texto de pergunta. A pergunta pode ser de outra rotina [lacuna]. Sem hotkeys nas strings.

## 4. Entradas do usuario

| Campo | Rotulo | Tipo | Limites | Default |
|---|---|---|---|---|
| Adaptador de video | `CGA`, `MCG`, `EGA`, `VGA`, `HER` | escolha de lista [inferido] | 5 opcoes | sem evidencia |
| Saida | `FOTO` / `VIDEO` | escolha [inferido] | 2 opcoes | sem evidencia |
| Escala | `ESCALA 1/` | numero (denominador) [inferido: digitado] | sem evidencia | sem evidencia |
| Obra / Viga | `OBRA - `, `VIGA - ` | texto [inferido: vem do arquivo da viga] | sem evidencia | sem evidencia |
| Continuar | `Qualquer Tecla para Continuar ` | tecla | - | - |

Nenhum padrao de DESENHO.INI ou SISTRUT.DSP define escala, adaptador ou saida. O DESENHO.INI tem apenas caminhos e codigos de impressora (linhas 10 a 13), que serao usados quando a saida for impressa [ev: sistrut-game/DESENHO.INI]. Os blocos de detalhamento do SISTRUT.DSP (linhas 259 a 336) sao lidos por DESINIT/DESDIM, nao por DESGRAF [inferido].

## 5. Arquivos lidos e gravados

Nenhum nome de arquivo com extensao aparece nas strings de DESGRAF. Os caminhos viriam do DESENHO.INI [inferido].

| Arquivo | Direcao | Evidencia | Formato |
|---|---|---|---|
| `DESENHO.INI` | le [inferido] | sistrut-game/DESENHO.INI | texto `valor=descricao` |
| `.VIG` / `.SEC` / `.FOR` / `.EDV` | le [inferido] | caminhos do DESENHO.INI | sem evidencia nas strings |
| `DESDIM.EXE` | lancado | token `DESDIM` | EXE |

Modulos auxiliares: `DESAUXGR`, com o mesmo prefixo `bm` do DESINIT (`bmDESAUXIN`) [inferido]. DESGRAF nao tem `bmDESINI1`/`bmDESINI2`, o que indica que a inicializacao fica em DESINIT.

## 6. Processamento

Sem primitivas graficas (`LINE`, `CIRCLE`, `PSET`) ou textos de calculo nas strings. O que as strings permitem afirmar:

- Ha uma fase de selecao de video antes do desenho: a lista CGA/MCG/EGA/VGA/HER. Essa lista e mais longa que a de DESINIT (EGA/VGA/HER).
- O cabecalho do desenho tem `OBRA`, `VIGA` e `ESCALA 1/`. A escala e impressa com a formula `1/<n>`; o numero vem de outra parte [inferido].
- Detalhamento de ferros (ganchos, bitolas, quantitativos): **nao** aparece como texto em DESGRAF. O DESINIT tem a tabela "TABELA PARA 1 VIGA"; DESGRAF nao tem essa tabela [inferido: a tabela e de DESINIT ou DESDIM].
- Tempo: `Aguarde ...` mostrado durante processamento.

## 7. Relatorios, impressao e plotagem

- Opcao `FOTO` sugere saida de imagem ou impressao. Nenhum codigo de impressora aparece nas strings de DESGRAF; os codigos ESC estao em DESENHO.INI (linhas 10 a 13) [inferido].
- Nao ha token `VPLOTA` nem `PLOT` nas strings. A plotagem fica em VPLOTA, que e outro modulo [inferido].
- Nao ha tabela de quantitativos nem relatorio de texto no DESGRAF.

## 8. Mensagens de erro

| Texto | Acao |
|---|---|
| `Modulo nao encontrado em ` | falha ao lancar modulo (DESDIM); mostra caminho |
| `erro no processamento` | erro generico |
| `verifique a consistencia dos seus dados` | erro de dado |
| `Acione ESC <Enter> para Continuar ` | pausa |

## 9. Troca de disquete

- `Coloque o Disco DESDIM no Drive`: troca de disquete para o modulo DESDIM. Obsoleta; nao reimplementar. A parte `ÿ` no fim e byte residual.

## 10. Lacunas

1. Origem dos valores de OBRA, VIGA e ESCALA: sem evidencia nas strings.
2. Significado de FOTO e VIDEO: deducao; nao ha pergunta associada nas strings.
3. Algoritmo de desenho (primitivas, escala real, posicao dos ferros): nao ha evidencia textual.
4. Formato dos arquivos de viga lidos (`.VIG`/`.SEC`/`.FOR`/`.EDV`): sem evidencia neste modulo.
5. Quem chama DESGRAF: [inferido] DESENHO; nao confirmado.
