# LAJEMONT — Reações das lajes nas vigas e pilares

Fontes: strings do executável original `LAJEMONT.EXE` (fora do repositório; inclui busca de extensões e módulos) e `sistrut-game/LAJE.INI`.
Convenção: `[ev: EXE]` = achado na busca no executável original. `[inferido]` = dedução sem evidência direta.

## Papel

Calcula a distribuição das cargas das lajes para os elementos de apoio (vigas e pilares). Monta o esquema unifilar do carregamento das vigas e dos pilares e grava os arquivos de dados de vigas (`.VIG`) e de cargas em pilares e inclinações (`.RLP`).

## Chamada e retorno

- Chamado pelo LAJE, opção de geração de reações `[inferido]`. A string de chamada da opção não está neste executável; a opção do menu de LAJE não foi confirmada.
- Retorno: "Retorno ao Modulo Basico de LAJE" e "VOLTA LAJEMONT" não aparecem nas strings; o módulo não tem menu de retorno identificado (só "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."). Lacuna.
- Módulo de geometria: "LAJEGEOM" aparece em duas mensagens de troca de disco e duas vezes no executável [ev: EXE]. Relação com a geometria é `[inferido]`.
- Textos de módulos ligados por nome no executável: `LAJECARR` (1 ocorrência), `LAJEMONV` (1 ocorrência) [ev: EXE]. Função não identificada; podem ser nomes de módulos vizinhos ou fragmentos de cadeia `[inferido]`. Não usar sem confirmação.

## Telas e menus

Não há menu numerado neste executável. O módulo é de processamento com confirmações Sim/Não.

### Tela de reações (cargas nas vigas e pilares)

Título "REACOES DE LAJES NAS VIGAS E PILARES". Cabeçalho de colunas:

`Laje | Sub-area | Area | Linear | Area | Estru. | Peso | Apoio`

Título da tabela de carga: "- - - - c a r g a s - - - -". Subtítulo "Distribuicao das cargas das Lajes nos Elementos de Apoio".

Linhas de sub-área:
- "Sub-area ##" (número da sub-área, 2 dígitos).
- "Alvenaria ###.##" (carga de alvenaria da sub-área).
- "Carga Area ###.##" (carga por área).
- Linha de dados: `### | ####.## m2 | ####.## | ####.## | ####.## | ###.##`. Colunas: número, área em m², três valores de carga e um valor de peso/apoio `[inferido: a ordem segue o cabeçalho]`.

### Totais

Os totais aparecem nesta ordem na tela, com campo `####.##`:

1. Total das Cargas Lineares
2. Total Considerado das Cargas Lineares
3. Total das Cargas por Area
4. Total Considerado das Cargas por Area
5. Total do Peso Proprio das Vigas
6. Total do Peso Proprio das Lajes
7. Total das Cargas de Estrutura
8. Total das Cargas no Painel
9. Total das Cargas aplicadas nas Vigas
10. Total das Cargas aplicadas nos Pilares
11. Total das Cargas aplicadas nas Vigas+Pilares

Após o último total: "Termino da Gravacao dos Arquivos de dados".

### Verificações de consistência (aviso com 3%)

Cada aviso termina com "Qualquer Tecla para Continuar ou <F2> para interromper.":
- Alvenaria: "A Somatoria das Cargas de Alvenaria consideradas nas Lajes e nas Vigas difere em mais de 3% da Carga total das Alvenarias".
- Cargas por área: "A Somatoria de Todas as Cargas por Area aplicadas nas Lajes ... difere em mais de 3% da Carga total das Lajes".
- Áreas parciais: "A Somatoria das Areas parciais da Laje ... diferem em mais de 3% da Area Total.".

Limiar de 3% está no texto. Não há parâmetro desse limiar no LAJE.INI [ev: LAJE.INI, ausência].

### Esquema unifilar de vigas

- Título "Montagem do Esquema Unifilar do Carregamento das Vigas".
- Campos "VIGA" e "Tramos".
- Tabela "ALVENARIAS SOBRE AS VIGAS" com colunas `Viga | Tramo | Peso Proprio | Carga`. Linha: `Viga ## Tramos ## \ \ ##(##  ####.## ####.##`.

### Esquema unifilar de pilares

- Título "Montagem do Esquema Unifilar do Carregamento dos Pilares".
- Campo "PILAR".
- Tabela "ALVENARIAS SOBRE OS PILARES" com colunas `Pilar | Carga`. Linha: `Pilar ... ####.##`.
- Subtítulo "Alvenaria sobre os Pilares".

### Confirmações e entradas

| Prompt | Default | Opções |
|---|---|---|
| Imprimo Relatorio sobre Carregamento das Vigas | N | S/*N* |
| Escolha opcao (qualquer tecla altera; Enter aceita) | — | menu de escolha `[inferido: relacionado à distribuição de apoio]` |
| "apoia em" / "ou" / "Isoladas" / "Confirme" / "isolada de" | — | confirmação de apoio isolado `[inferido]` |
| Indexacoes de Vigas estao corretas | S | N/*S* |
| Definicao do Peso Proprio das Vigas | — | Peso Proprio PREDOMINANTE; Viga com peso diferente |
| Viga com peso diferente | NENHUMA | *NENHUMA* |
| Peso (valor) | — | valor numérico `[inferido]` |
| Cargas da Laje | — | título de tela |

"Aguarde .." aparece durante o processamento.

### Gravação

- "Gravacao do Arquivo de Vigas (.VIG)". Com contador "Registro".
- "Gravacao do Arquivo de Cargas em Pilares e Inclinacoes (.RLP)".
- "Termino da Gravacao dos Arquivos de dados".
- Nome do arquivo `.VIG` e `.RLP`: "...VIG e". Fonte do nome (obra, nível, LAJE.INI) não identificada `[inferido: nome da obra]`.

### Relatório impresso

Cabeçalho: "Versao 4.0    Abril 1991".
Título: "SOMATORIA DE REACOES EM PILARES E INCLINACOES GERADAS PELAS LAJES".
Campos: "OBRA", "GERADO EM".

### Mensagens de erro

- "erro no processamento"
- "verifique a consistencia dos seus dados"
- "Acione <ESC> para Continuar"

### Mensagens obsoletas (troca de disquete)

- "Coloque o Disco Contendo o modulo LAJEGEOM no Drive". Obsoleta. Não reimplementar.
- "Coloque o disco de Dados no Drive". Obsoleta. Não reimplementar.
- "Qualquer tecla para Continuar". Pausa de tela, manter só como pausa.

## Entradas do usuário

- Confirmações S/N (ver tabela): imprimir relatório, índices de vigas, alteração de peso.
- Escolha de apoio (tecla qualquer para alterar, Enter para aceitar).
- Valor do peso próprio, quando o usuário informa peso diferente `[inferido]`.
- Tecla qualquer para continuar; F2 para interromper.

## Arquivos lidos e gravados

| Arquivo | Uso | Evidência |
|---|---|---|
| `<obra>.VIG` | Gravado: dados de vigas (contador de registros) | EXE: `.VIG` (3 ocorrências) |
| `<obra>.RLP` | Gravado: cargas em pilares e inclinações | EXE: `.RLP` (2 ocorrências) |
| Arquivo de dados de laje | Lido `[inferido]`. Não há extensão no executável | EXE: sem `.LAJ`, `.BAK`, `.LAP` ou `.INI` |

- `LAJE.INI` não é lido por este executável (sem `.INI` nas strings) [ev: EXE].
- O módulo não contém `.LAJ`. A origem dos dados das lajes (provavelmente o `.LAJ` gravado pelo LAJEGRAV) é lacuna.

## Processamento / cálculos

1. Distribui as cargas de cada laje (sub-áreas, alvenaria, carga por área) nos apoios: vigas e pilares.
2. Soma as cargas por tipo e compara com os totais de referência, com tolerância de 3%.
3. Monta o esquema unifilar de vigas (com tramos) e de pilares.
4. Calcula o peso próprio das vigas e das lajes, e as cargas de estrutura e de painel.
5. Grava `.VIG` e `.RLP`.
6. Opcionalmente imprime o relatório.

Não há fórmula de cálculo nas strings. A distribuição (método de decomposição em triângulos, trapézios ou outro) não é identificada.

## Lacunas

1. Fonte dos dados de laje (arquivo de entrada) não identificada.
2. Nome exato do `.VIG` e do `.RLP`: origem do nome não identificada.
3. Função de `LAJECARR` e `LAJEMONV` no executável.
4. Quem chama LAJEMONT no menu de LAJE, e a opção que o chama.
5. Método de distribuição das cargas (fórmula).
6. Significado das colunas de linha de sub-área (ordem dos valores).
7. Campo "Peso": tipo e unidade.
8. Retorno ao LAJE: string de retorno não aparece no executável.
