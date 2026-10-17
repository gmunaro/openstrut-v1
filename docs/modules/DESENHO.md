# DESENHO.EXE - Especificacao funcional

Fontes: strings do executavel original `DESENHO.EXE` (fora do repositorio), `sistrut-game/DESENHO.INI` e `sistrut-game/SISTRUT.DSP`.
Convencoes: `[inferido]` = deducao sem prova direta. `[lacuna]` = sem evidencia.
Marca de hotkey: as strings do executavel nao tem a letra destacada (ex.: "istagem" = "Listagem", hotkey L). A letra inferida aparece entre colchetes. Padrao `S/*N*`: o `*...*` marca o default.

## 1. Papel do modulo

DESENHO.EXE e o gerenciador do ramo de detalhamento e desenho de vigas continuas. Cabecalho de tela: `DETALHAMENTO E DESENHO DE VIGAS CONTINUAS`, `Abril 1991`, `Versao 4.0`.

Ele mostra o menu principal (secao 3), lista as Vigas gravadas (secao 4), coleta as opcoes de saida do detalhamento (secao 6) e lanca os submodulos da familia (secao 2).

## 2. Chamada e retorno

**Entrada.** Lancado pelo SISTRUT (token `SISTRUT`). Caminho de instalacao lido como `\SISTRUT\EXEC40\`. Nao ha linha de comando nas strings [inferido: como os demais modulos, via `SHELL`/`COMSPEC`].

**Submodulos citados por nome:**

| Token | Uso |
|---|---|
| `DESEDITA` | item de menu "Editadas" (secao 3) |
| `DESINIT`, `DESGRAF`, `DESDIM`, `DESEDCAO`, `DESIMP` | nao citados neste executavel; ver `_FAMILIA_DESENHO.md` [inferido] |
| `FORMA` | texto junto a mensagem de retorno ao modulo de forma [inferido] |
| `bmDESAUX` | modulo auxiliar (prefixo `bm` de segmento do QuickBASIC [inferido]) |
| `bmDESCORRE` | nome de segmento; funcao nao confirmada [inferido] |
| `bmDESGRAV` | nome de segmento; **nao** bate com `DESGRAF`; funcao nao confirmada [inferido] |
| `bmNOM` | nome de segmento; funcao nao confirmada [inferido] |
| `bmMIXT` | nome de segmento (mesmo token em DESINIT e DESGRAF) [inferido] |

**Retorno.** `Retorno ao Modulo Gerenciador`. Encerramento: `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. Mensagem `Modulo nao encontrado em ` quando o lancamento falha.

## 3. Menu principal

Tela de abertura. A coluna Hotkey e [inferido]: as strings nao contem a letra (byte de atributo fica fora da string).

| Hotkey | Texto (reconstruido) | Evidencia |
|---|---|---|
| D | Detalhamento e Desenho | `*etalhamento e Desenho` |
| E | Editadas, acesso as Vigas gravadas | `8*ditadas, acesso as Vigas gravadas` [inferido: "Vigas Editadas" completo] |
| L | Listagem dos dados arquivados | `n*istagem dos dados arquivados` |
| R | Resumo geral de consumo | `₧*esumo geral de consumo` |
| P | Parametrizacoes / escolha | `╚*arametrizacoes / escolha` |
| A | Alteracao de Drive e Subdiretorio | `ε*lteracao de Drive e Subdiretorio` |
| F2 | Fim | `+ <F2> = Fim ` |
| - | escolha opcao | `+escolha opcao ` (prompt) |

Mapeamento item → submodulo: so `E` tem token direto (`DESEDITA`). Os demais nao tem token nas strings; o destino de `D`, `L`, `R`, `P` e desconhecido [lacuna].

## 4. Selecao de Vigas gravadas

Fluxo: entrada do nome da obra, depois lista de vigas.

| Texto | Observacao |
|---|---|
| `Coloque o Disco de Dados no Drive ` | troca de disquete (obsoleta, secao 8) |
| `Nome da Obra *RETORNO*` | campo de nome da obra; `RETORNO` e o default (volta ao menu) |
| `GRAVADAS` / `VIGAS ` | cabecalho da lista |
| `Lista as Vigas S/*N*` | default N |
| `Registro  Viga            Tramos  Data` | cabecalho de colunas |
| `Gravadas ` / `Vigas * interrompe` | `*` indica interrupcao (ESC) [inferido] |
| `###      \             \   ##   \   \` | mascara de colunas: registro, viga, tramos, data |
| `Qualquer Tecla para Continuar 1` | pausa |
| `Acione  D <Enter>  para alterar Drive e Diretorio` | D = alterar drive/diretorio |
| `Nenhum Arquivo Encontrado#` | aviso |
| `NAO EXISTE ESTE ARQUIVO NESTE DISCO` | aviso |
| `O SEU DISCO DE DADOS ESTA COMPLETO` | aviso |
| `VERIFIQUE O SEU DRIVE` | aviso |
| `Relisto as Vigas S/*N*` | default N |
| `Continuo N/*S*` | default S |
| `Escolha das Vigas para Processamento` | |
| `Todas as Vigas S/*N*` | default N |
| `Processar Registros I/J/N a M/.../K` | faixa de registros (ex.: I a K), separada por `/` [inferido] |

## 5. Verificacao e alteracao de Secao e Forma

Textos da tela, na ordem: `VERIFIQUE OS SEUS DADOS DE ENTRADA`; `Verificacao das Secoes Geometricas das Vigas Escolhidas`; `Registro`; `Atencao !!!`; `Viga com Carga Indexada.`; `Retorne ao modulo Viga e regrave as Vigas apos solucionadas.`; `Alteracao/Visualizacao de Secoes`; `Deseja Alterar Secoes     Registro *NAO*`; `Os dados de Secao do Registro ainda nao foram definidos.`; `Deseja defini-los para depois altera-los  N/*S*`; `Os dados de Forma do Registro`.

Leitura: o registro de viga tem dados de **Secao** (.SEC) e de **Forma** (.FOR), conforme DESENHO.INI linha 2 [ev: sistrut-game/DESENHO.INI]. Se faltarem, o programa oferece definir antes de alterar (default S). Viga com carga indexada aborta e manda voltar ao modulo VIGA [inferido].

## 6. Opcoes de saida do detalhamento

Tela `Escolha do tipo de Saida/Impressao para resultados de Detalhamento`. Perguntas em sequencia (default entre `*...*`):

| # | Pergunta (texto) | Default |
|---|---|---|
| 1 | Imprimo os dados da Viga e resultados de esforcos S/N | N |
| 2 | Imprimo os resultados de Armacao S/N | N |
| 3 | Desenho somente os diagramas de esforcos S/N | N |
| 4 | Desenho os diagramas e a Armacao das Vigas S/N | N |
| 5 | Escala 1/.. (opcoes `200 100 50 FOTO` e `*VIDEO*`) | `VIDEO` |
| 6 | Altero a armadura que sera optada pela Parametrizacao S/N | N |
| 7 | Paro para visualizacao no monitor S/N | N |
| 8 | Imprimo desenho definitivo da Viga na impressora S/N | N |
| 9 | Escala 1/.. `200 100 *50* 25 ...` (fragmento `250` logo depois) | 50 |
| 10 | Edito desenho da armacao para alteracoes S/N | N |
| 11 | Gero arquivo publico padrao CAD S/N | N |
| 12 | Tipo de arquivo CAD `<*A*>utocad  <C>adtec` | A (Autocad) |
| 13 | Imprimo medidas de forma e secoes abaixo do desenho N/S | S |
| 14 | Imprimo padrao de dobramento da armadura N/S | S |
| 15 | Cabecalhos e 2 Notas gerais, ate 40 caracteres cada: `CAB 1)`, `CAB 2)`, `CAB 3)` | em branco [inferido] |

Destinos de saida citados: `LPT1:` e `COM1:`; codigos ESC em DESENHO.INI linhas 10 a 13.

Saida em arquivo: `.DXF` ou `.PUB` (padrao CAD, DESENHO.INI linha 5 e pergunta 11) [ev: sistrut-game/DESENHO.INI].

## 7. Arquivos lidos e gravados

| Arquivo | Direcao | Evidencia |
|---|---|---|
| `DESENHO.INI` | le | nome citado nas strings; conteudo em sistrut-game/DESENHO.INI |
| `SISTRUT.DSP` | le | sistrut-game/SISTRUT.DSP linhas 259 a 336 (parametrizacao de desenho) [inferido] |
| `.VIG`, `.SEC`, `.FOR` | le | DESENHO.INI linha 2; menu da secao 4 e secao 5 |
| `.EDV` | le | DESENHO.INI linha 4; item E do menu |
| `.DXF` / `.PUB` | grava | DESENHO.INI linha 5; pergunta 11 |
| `\SISTRUT\EXEC40\` | caminho | caminho de instalacao citado nas strings |

## 8. Troca de disquete

- `Coloque o Disco de Dados no Drive`: troca de disquete. Obsoleta.

## 9. Mensagens de erro

| Texto | Acao |
|---|---|
| `Modulo nao encontrado em ` | falha ao lancar modulo |
| `ERRO NO ARQUIVO PARAMETRIZACAO ` | erro de leitura do .DSP; seguido de `ultimo dado lido` |
| `erro no processamento` | erro generico |
| `verifique a consistencia dos seus dados` | erro de dado |
| `Acione ESC <Enter> para Continuar ` | pausa |
| `ATENCAO ! .. Drive e Diretorio nao encontrados` | caminho invalido; oferece `Crio o Diretorio` (S/N) |

## 10. Processamento e parametrizacao

**Parametrizacao.** Tela `Atualizacao de Parametros` com itens numerados que exibem o valor atual:

Itens: P Parametrizacao Utilizada; 1 Reducao dos Negativos a %; 2 Concreto; 3 Aco; 4 Tipo de Aco A/B; 5 Cobrimento da Armadura cm; 6 Alivio dos Esforcos Cortantes no Apoio; 7 Cargas Acidentais; 8 Momentos Externos; 9 Desenho Definitivo da Armadura.

Cabecalho da tabela: `item , VALOR  *NAO*`. Os valores vem do arquivo de parametrizacao; o default visivel e o SISTRUT (`Sera adotada parametrizacao SISTRUT`).

Nome do arquivo: `Nome do Arquivo PARAMETRIZACAO *`. Caminho de .DSP: `Drive:\Diretorio\...\Subdiretorio dos arquivos de Parametrizacao (.DSP)`. Os caminhos de .VIG/.SEC/.FOR, .EDV e .DXF/.PUB batem com `DESENHO.INI` [ev: sistrut-game/DESENHO.INI].

Blocos internos do .DSP lidos na tela: `PARAMETROS GLOBAIS`, `ORDEM`, `INTERVALO`, `NUMERO`, `ESPACAMENTO DE ESTRIBOS` (`MAXIMA`/`MINIMA`). Mesmo formato da secao de `SISTRUT.DSP` [inferido].

**Repeticoes na Tabela.** `Vigas com repeticoes para consideracao na Tabela`. Pede `Registro , Numero de repeticoes *FIM*` e `Dados Corretos N/*S*`. Esse numero e o `REPETIR x VEZES` do quadro do DESINIT [inferido].

**Resumo geral de ferragem.** `Tabela Geral de Ferragem`. Anulacao de viga do resumo: `Numero do REGISTRO a anular *NENHUM*`; `VIGA AINDA NAO CALCULADA`; confirmacao `S/*N*`. Impressao do resumo: S/*N*.

Cabecalho de impressao do resumo: `OBRA -`, `Viga`, `rept`, `Vconc`, `Afor`, `(bitolas em Milimetros - Comprimentos em Metros)`, `TOTAIS`, `PESOS TOTAIS`. Colunas `Vconc` e `Afor` correspondem ao volume de concreto e a `AREA FORMA` do DESINIT [inferido].

**Listagem dos dados arquivados.** `Listagem dos dados Arquivados/`. Opcoes: `Todas as Vigas gravadas serao listadas S/*N*`; `Listar Registros I/J/N a M/.../K *RETORNO*`; `Imprimo os dados de Secao N/*S*`; `Imprimo os dados de Forma N/*S*`; `Paro para Visualizacao no Monitor S/*N*`; `Salto formulario ao final de cada Viga N/*S*`; `Dados Corretos N/*S*`.

Layout impresso de cada viga: `Obra -`, `Viga -`, `REGISTRO`, tabela de tramos com `Bw Hw Bf Hf` e apoios com `LPi LPs Dis LVi DFs Hv LOi LOs`. Tramo: `Vao Livre Alinhamento Eixo pe Hle pd Hld`. Colunas de apoio: dimensoes e vao livre [inferido].

**Troca de modulo.** `Coloque o disco contendo o Modulo ... em ... DESENHO`; `DESDIM#`. Caminhos de instalacao de desenvolvimento: `\SISTRUT` e `\QB\SISTRUT\` (troca de disco obsoleta, secao 8).

**Leitura de parametrizacao.** `Leitura do arquivo parametrizacao`.

## 11. Geometria da viga: tramos, apoios e secoes

**Cabecalho.** `FINAL DA PARAMETRIZACAO`. Cabecalho de tela `Obra -`, `Viga -`, `TRAMO Bw Hw Bf Hf APOIO Bw Hw`.

**Alteracao de apoios.** `Alteracao nos Apoios`, `APOIO , Bw , Hw *FIM*`. Campos: `Numero do Apoio *FIM*`, `Largura do Apoio`, tipo `<P>ilar <V>iga <O>utros` (default `*P*`), `Titulo`, posicao em relacao a viga `a<*B*>aixo a<C>ima <D>ireto`, `<M>orre <*C*>ontinua Constante Continua <A>lterado`. Hotkeys entre `<>` (P, V, O, B, C, D, M, A) aparecem nas strings destas telas.

**Geometria da viga.** `Largura do Pilar Acima da Viga (cm)`; `Distancia da Face Esquerda Inferior a Superior (cm)`; `Altura Total da Viga`; `Distancia da Face Superior da Viga`; `Posicionamento da parte Superior do Pilar em relacao a Inferior?`. Confirmacao `Dados Corretos N/*S*`.

**Tramos.** Tela `Dados de Tramos VIGA-`, colunas `Tramo Vao Livre Alinhamento Eixo pe Hle pd Hld`. Campos: `Numero do Tramo *FIM*`, `Vao Livre do Tramo`, `Face Superior do Tramo 1 a do Tramo5`, `Eixo esquerdo a Face do Apoio do Tramo`, `Posicao das Lajes no Corte pe,Hle,pd,Hld`. Codigos de vao `Ad`..`Cf`, exemplo `AD490E`. Regra: vao livre entre faces internas dos apoios (tramos internos) e da extremidade do tramo a face do apoio (balancos); `< >` mostra o vao de calculo.

Flags (`N/*S*` = default S): face superior alinhada; face inferior alinhada; `Centraliza os Eixos na Forma`; `Forneco dados sobre a posicao das Lajes no Corte`; `Adoto Flange ... secao T S/*N*`.

Lajes: posicao em relacao ao topo da viga; posicionamento predominante pe/Hle/pd/Hld; tramo com posicionamento diferente `*NENHUM*`.

**Secoes.** Tela `Dados de Secao VIGA-`. `Secao Predominante dos Tramos Bw , Hw , Bf , Hf`; `Numero de Tramos com Secoes Diferentes *0*`; `CASO` / `Tramo , Bw , Hw , Bf , Hf`; `Adoto Secao Retangular para Apoios N/*S*`; secao predominante dos apoios Bw,Hw; apoios com secoes diferentes `*0*`; `Apoio , Bw , Hw`.

**Rodape.** `XOR`, `HER`, `EGA`, `VGA`: lista de adaptadores ou rotina; papel do `XOR` nao confirmado [inferido].

## 12. Lacunas (provisorias)

1. Destino das opcoes `D`, `L`, `R`, `P` do menu: sem token de submodulo.
2. Texto completo do item `E`.
3. Significado de `bmDESGRAV`, `bmDESCORRE`, `bmNOM`.
