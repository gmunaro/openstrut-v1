# FORMIMP.EXE - Especificacao funcional

Fontes: strings do executavel original `FORMIMP.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Caracteres soltos no fim de algumas linhas sao residuos binarios, nao texto. Os valores de default marcados com `*` foram lidos das strings do executavel.

## 1. Papel do modulo

FORMIMP.EXE imprime a forma (planta) em impressora matricial. Trabalha em dois caminhos:

- **Desenho em escala:** imprime um campo de impressao definido pelo usuario, em escala escolhida, com opcao de dividir em folhas (3.2).
- **Copia da tela:** imprime o conteudo da tela de desenho, como `ZOOM` (3.3).

A saida de arquivo e a plotagem em `.PLT` e `.DXF` ficam em FORMPLOT (FORMPLOT.md). Nao ha calculo de geometria neste modulo [inferido: os tokens de calculo estao em FORMINIT e FORMEDCA].

## 2. Chamada e retorno

**Entrada.** FORMA chama FORMIMP pelo token `FORMIMP`, com o mesmo mecanismo de lancamento de FORMA.md, secao 2 (`SHELL` com `<unidade>:\SISTRUT\EXEC40\FORMIMP.EXE`, sem argumentos) [inferido: reconstrucao `src-reconstructed/SISTRUT.BAS`, sub `RunModule`].

**Tokens de despacho presentes.** `SELECIONA`; `MCGA`; `ZOOM`; `FORMA`; `FORMIMP`; `CGA` (com residuo `N`). `FORMA` e o destino de retorno; `FORMIMP` e o proprio nome do modulo, usado na mensagem de retorno.

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` (mesmo texto de FORMA).

**Retorno ao modulo basico.** `Retorno ao Modulo Basico de FORMA`. Mesmo texto em FORMEDCA e FORMPLOT.

**Submodulo ausente.** `Modulo nao encontrado em `.

## 3. Telas e menus

### 3.1 Menu principal

Linhas do menu, na ordem das strings:

| Linha | Texto exato |
|---|---|
| 1 | `<S>eleciona Campo de Impressao     <E>scala     <T>extos     <I>mprimir` |
| 2 | `<Z>oom     <C>opia tela na impressora` |

Hotkeys: S, E, T, I, Z, C. Lidas entre `<>`. A letra `I` e a acao de impressao; `C` copia a tela na impressora (3.3) [inferido].

Titulo do campo de impressao: `<D>efine um campo de Impressao    <T>odo o campo    <*R*>etorna`. `<*R*>` e a opcao padrao [inferido].

### 3.2 Desenho em escala

1. **Escolha de escala.** Titulo: `Escolha de Escala para desenho de Forma em Impressora`. Opcoes: `Escala do Desenho 1/ 100 *50* 20 FOTO`. Lista `100`, `*50*` (padrao), `20` e `FOTO`. O padrao 50 bate com o default de `FORMA.INI` (escala 50) [inferido: mesma escala]. Tokens `FOTO`.
2. **Campo definido.** Mostra o campo: `campo de impressao definido X=#####.# a #####.#  Y=#####.## a #####.#`.
3. **Divisao em folhas.** `folhas em` `partes` [inferido: pergunta quantas folhas; o numero nao esta nas strings]. `Escala `.
4. **Opcoes de desenho.** Cada item e `S/N` com padrao (o padrao nao e legivel, pois o `*` vem seguido de residuo):
   - `Imprimo Nome das Lajes  S/N  *`
   - `Imprimo Espessura das Lajes  S/N  *`
   - `Imprimo Nome das Vigas  S/N  *`
   - `Imprimo Secao das Vigas  S/N  *`
   - `Imprimo Nome dos Pilares  S/N  *`
   - `Imprimo Secao dos Pilares  S/N  *`
   - `Imprimo Cotas e Medidas  S/N  *`
5. **Preparacao.** `Ajuste a Impressora para inicio da Impressao`.
6. **Confirmacao.** `Sigo com a Impressao do Desenho em Escala  N/*S*`. Padrao `S`.

Os passos 1 a 6 seguem esta ordem nas strings [inferido: a ordem e a das strings, nao prova de execucao].

### 3.3 Copia da tela (ZOOM)

- `<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna`.
- `Sigo com a Impressao da Tela N/*S*`. Padrao `S`.
- Campos de cursor: `Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso`; `Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso`.
- `Passo do cursor *`.
- Rotulo `ZOOM`.

### 3.4 Cabecalho de tela

`Forma:`, seguido de token `GGA` com residuo (provavelmente parte de `EGA`/`CGA`, ver secao 7) [inferido].

### 3.5 Aviso de processamento

`Aguarde ..."` (aguarde durante a impressao) [inferido].

## 4. Entradas do usuario

- **Hotkeys do menu:** letras entre `<>` (3.1 a 3.3). As maiusculas sao atalho; `<*R*>` e padrao.
- **Confirmacoes S/N:** `N/*S*` ou `S/N` com padrao em maiuscula. Padrao lido das strings onde visivel.
- **Escala:** entrada entre `100`, `50` (padrao), `20` e `FOTO`.
- **Numero de folhas:** campo `folhas em ... partes`; a entrada nao aparece nas strings [inferido].
- **Campo de impressao:** cursor, com `<Enter>` para fixar, `<R>` retorna e `<P>` passo.
- **Pausa de erro:** `Acione ESC <Enter> para Continuar`.

## 5. Arquivos lidos e gravados

FORMIMP nao grava nem le arquivo de dados, pelas strings. Os tokens `C_FILE_INFO` e o bloco BRUN45 sao do runtime, nao do programa.

Unica referencia a disco: `Coloque o Disco FORMA no Drive `. Troca de disquete, obsoleta (secao 9).

A impressao vai para a impressora (saida de dispositivo, nao arquivo) [inferido: o texto pede ajuste da impressora]. Os comandos ESC/P da impressora ficam em INSTALAR (`INSTALAR.md`).

## 6. Calculos e processamento

FORMIMP nao calcula geometria. Reaproveita o que FORMINIT e FORMEDCA produziram e faz:

1. Ler o campo de impressao e a escala escolhidos (3.2, 3.3).
2. Calcular a area do campo em X e Y, mostrada como `campo de impressao definido`.
3. Dividir em folhas quando o desenho nao cabe na folha (`folhas em partes`) [inferido].
4. Imprimir com as opcoes S/N (3.2, passo 4).

Falha de processamento: `erro no processamento` seguido de `verifique a consistencia dos seus dados` e pausa `Acione ESC <Enter> para Continuar`. Mesmos textos de FORMA e FORMINIT.

## 7. Relatorios, impressao e plotagem

- **Impressao em escala:** secao 3.2. Opcoes de conteudo: nomes e espessuras de Lajes, nomes e secoes de Vigas e Pilares, cotas e medidas (todas S/N).
- **Impressao da tela:** secao 3.3, com `Sigo com a Impressao da Tela`.
- **Modos de video:** `MCGA`, `CGA` com residuo e `GGA` com residuo. Sao rotulos de modo de video usados na copia da tela [inferido]. Nao ha evidencia de que a copia dependa do modo.
- **Plotagem:** nao e deste modulo. Ver FORMPLOT.md.
- **ESC/P da impressora:** comandos ESC 2, ESC 0, ESC N, ESC O ficam em INSTALAR (`INSTALAR.md`), nao aqui.

Nao ha relatorio tabular neste executavel.

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| `erro no processamento` | Falha de impressao ou de calculo do campo |
| `verifique a consistencia dos seus dados` | Dados de entrada inconsistentes [inferido] |
| `Modulo nao encontrado em ` | Submodulo ausente |
| `Acione ESC <Enter> para Continuar` | Pausa apos erro |

Os erros de runtime R6005 a R6007 nao aparecem nas strings; o texto `BRUN45.EXE - ...` e o do runtime, nao de FORMIMP.

## 9. Troca de disquete

- `Coloque o Disco FORMA no Drive `. Texto da versao em disquete; obsoleto. Nao reimplementar.
- **Nome do sistema e credito:** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` e so mensagem de saida.

## 10. Lacunas e incertezas

1. **Numero de folhas** (`folhas em partes`): o campo de entrada nao esta nas strings. Nao se sabe se o programa calcula as folhas ou pergunta.
2. **Padrao das opcoes S/N** (3.2, passo 4): o asterisco vem seguido de residuo binario, entao o padrao (S ou N) nao e legivel.
3. **Campo `Forma:`** e o token `GGA`: nao se sabe se e cabecalho de tela ou rotulo de modo.
4. **Copia da tela:** o modo de video (`MCGA`, `CGA`, `GGA`) afeta a copia? Nao confirmado.
5. **Ordem de execucao** de 3.2 e 3.3: a ordem e a das strings.
6. **Origem dos tokens `SELECIONA`, `ZOOM`, `FOTO`:** sao tokens de despacho ou so rotulos. Nao confirmado.
7. **Residuos binarios:** `GGA⌠` e `CGA⌠N`, verificados nas strings. Os demais residuos de caractere citados nas secoes 3 e 4 nao foram reverificados e devem ser conferidos no executavel original.
8. **Typos mantidos:** nenhum typo grave nas strings. `Escolha de Escala para desenho de Forma em Impressora` esta com `Impressora` colado no final da linha [inferido: texto integro].
