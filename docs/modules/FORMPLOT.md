# FORMPLOT.EXE - Especificacao funcional

Fontes: strings do executavel original `FORMPLOT.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Residuos binarios no fim de linhas (`D`, `!`, `.`, `ò`, `N`, `9`, `⌠`, `g`) nao sao texto. Textos com erro de grafia estao marcados `(sic)`.

## 1. Papel do modulo

FORMPLOT.EXE gera o desenho da forma para fora do sistema. Tem tres saidas:

1. **Plotagem** em ploter: monta a folha (margens, carimbo, escala) e gera o arquivo `.PLT`.
2. **Arquivo CAD** `.DXF` com camadas de Lajes, Pilares, Vigas, Cotas, Elevacao, Ferro, Estribo, Corte e Tabela.
3. **Copia de desenho em folha** com parametros de plotagem, carregados de `.FOP` e `PLOTER.INI`.

Nao calcula esforcos. Recebe a geometria ja calculada por FORMINIT e FORMEDCA [inferido].

## 2. Chamada e retorno

**Entrada.** FORMA chama FORMPLOT pelo token `FORMPLOT1`. O nome do proprio modulo aparece como `FORMPLOT`. Lancamento pelo launcher: `SHELL` com `<unidade>:\SISTRUT\EXEC40\FORMPLOT.EXE`, sem argumentos [inferido: reconstrucao `src-reconstructed/SISTRUT.BAS`, sub `RunModule`].

**Tokens de despacho.** `SELECIONA`; `ZOOM`; `FORMA`; `COM`; `CGA` com residuo; `EGA`.

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

**Retorno ao modulo basico.** `Retorno ao Modulo Basico de FORMA`. Mesma frase de FORMEDCA e FORMIMP.

**Submodulo ausente.** `Modulo nao encontrado em `.

## 3. Telas e menus

### 3.1 Menu principal

| Linha | Texto exato |
|---|---|
| 1 | `<S>eleciona Campo de Plotagem    <M>argens carimbo & Escala    <P>lotar` |
| 2 | `<Z>oom    <T>extos    <D>etalhes ampliados    <C>ad geracao de arquivo DXF` |
| 3 | `<D>efine um campo de Plotagen    <T>odo o campo    <*R*>etorna` (sic: `Plotagen`) |

Hotkeys: `S`, `M`, `P`, `Z`, `T`, `D`, `C`, `R`, `T` (`<T>odo`) [inferido: lidas entre `<>`]. A letra `D` aparece em duas linhas com sentidos diferentes (Detalhes ampliados e Define campo). A letra `T` tambem aparece com dois sentidos (Textos e Todo o campo). Ambiguidade de atalho nao resolvida pelas strings (lacuna 2).

Titulo `SELECIONA` junto com o campo de plotagem.

### 3.2 Pergunta de parametrizacao

- `Deseja Alterar as parametrizacoes S/*N* `. Padrao `N`.

### 3.3 Montagem da folha

- Titulo: `Montagem de Folha para Plotagem`.
- Aviso se o desenho nao cabe: `DESENHO NA ESCALA ESCOLHIDA E MAIOR QUE A AREA UTIL DA FOLHA`.
- Pergunta: `Altere a escala ou o tamanho da Folha.  Sigo mesmo assim  SIM/*N* `. Padrao `N`.
- Area ocupada: `AREA OCUPADA PELO DESENHO #### x#### mm `. `####` e campo numerico.
- Confirmacao: `Sigo com a Configuracao para Plotagem N/*S* `. Padrao `S`.

### 3.4 Configuracao da folha

Titulo: `Desenho e Plotagem de Formas`. Subtitulo: `Configuracao do tamanho da folha de Plotagem e Escala`.

Blocos de campos, na ordem:

1. `- Area de Plotagem e Bordas`:
   - `largura da folha ` e `mm`.
   - `altura da folha `.
   - `margem esquerda  `.
   - `outras margens  `.
   - `largura do carimbo `.
   - `altura do carimbo `.
   - `escala do desenho 1/`.
2. `- Drives e Extensoes de arquivos`:
   - `drive gravacao folha   (.DXF) `.
   - `drive de plotagem      (.PLT) `.
3. `- Grandezas de Escrita   altura de letra (mm) para :`, com campo `###.#` e os itens `coluna`, `vigas`, `lajes`, `amarracao`, `elevacao` e `extras`.

Rodape: `Acione   <Enter> para manter   ou   <ESC> <Enter> para Retornar`. A alternativa `<ESC> <Enter>` volta sem gravar [inferido].

Padrao de campos: os textos `altura de letra`, `largura` e `escala` vem sem valor padrao nas strings [inferido: o valor e lido do `FORMA.INI` ou do `PLOTER.INI`].

### 3.5 Opcoes de desenho

Cada item e `S/N` com padrao:

- `Imprimo Nome das Lajes  S/N  *`.
- `Imprimo Espessura das Lajes  S/N  *`.
- `Imprimo Nome das Vigas  S/N  *`.
- `Imprimo Secao das Vigas  S/N  *`.
- `Imprimo Nome dos Pilares  S/N  *`.
- `Imprimo Secao dos Pilares  S/N  *`.
- `Imprimo Cotas e Medidas  S/N  *`.
- `Desenho Cortes e Elevacao das Vigas  S/N  *`.
- `Imprimo valores de Elevacao das Vigas  S/N  *`.

O padrao (S ou N) nao e legivel, pois o `*` vem seguido de residuo binario [inferido]. As mesmas sete primeiras opcoes aparecem em FORMIMP (FORMIMP.md, secao 3.2).

### 3.6 Menu de zoom e campo ampliado

- `<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna`.
- Rotulo `ZOOM`.
- Rotulo `FORMA`.

### 3.7 Cursor de campo

- `Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso`.
- `Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso`.
- `Passo do cursor *`. Rotulo `ZOOM`.
- Linha de movimento: `movimenta    <S>egue com a Plotagem    <A>bandona    <C>ancela    <P>asso`.
- `Passo de Movimento *` e `* mm `.

### 3.8 Arquivo de parametrizacao e ploter

- `ARQUIVO PARAMETRIZACAO A SER UTILIZADO (.FOP)`.
- `PLOTER UTILIZADO E CONFIGURACAO DO DESENHO`.
- `PLOTER utilizado`.
- `Origem da Folha (mm) *`.
- Nome do arquivo de parametros: `PLOTER.INI`, com linha de conteudo `# DESENHO DE FORMAS`.

### 3.9 Telas de geracao de arquivo

- `Geracao de arquivo de Plotagem (.PLT)`.
- `Nome do arquivo a ser gerado *`. Campo de nome, padrao com residuo `g`.
- `Plotagem da Forma ` e `em ` (com o nome da forma e a escala).
- `Sigo com a Plotagem  N/*S* `. Padrao `S`.
- `Aguarde..`.
- `Plotagem gerada em Arquivo no Disco (.PLT) `.
- `Geracao de arquivo CAD (.DXF)`.
- `Sigo com a geracao em 9`. Residuo `9`; o texto completo nao esta nas strings (lacuna 6).
- `.DXF N/*S* `. Padrao `S`.
- `Aguarde..`.

### 3.10 Pena do ploter

- `Coloque a pena de numeroD` (residuo `D`). O numero da pena nao esta nas strings.
- `no Ploter, no local da pena`.
- `<Enter> para seguir`.

Pausa para trocar de caneta. Nao ha evidencia de que a troca seja automatica [inferido].

### 3.11 Coordenadas e destinos

- `COM` seguido de `,CS65535,DS65535,OP65535`. Sequencia de inicializacao do ploter (HP-GL-like) [inferido]. As strings nao trazem outras sequencias de comando.
- `Xmax` e `Ymax`. Limites de coordenada [inferido].

## 4. Entradas do usuario

- **Hotkeys do menu principal:** letras de 3.1, com ambiguidade `D` e `T`.
- **Confirmacoes S/N:** padrao em maiuscula, como em 3.2, 3.3, 3.5, 3.9.
- **Campos numericos:** largura, altura, margens, carimbo, escala, altura de letra (`###.#`), origem da folha (3.4, 3.8).
- **Nome de arquivo** (`.PLT`): campo de texto, 3.9.
- **Cursor:** movimento e `<Enter>` para fixar canto (3.7).
- **Pausa:** `<Enter>` para seguir (3.10) e `<Enter>` para manter ou `<ESC> <Enter>` para retornar (3.4).

## 5. Arquivos lidos e gravados

**Lidos.**

- `.FOP` (parametrizacao de plotagem), selecionado pelo usuario.
- `PLOTER.INI` (configuracao do ploter e linha `# DESENHO DE FORMAS`).
- Os arquivos da forma (vigas, pilares, lajes, desenhos) carregados pelo FORMA [inferido].

**Gravados.**

- `.PLT` (plotagem em arquivo). Formato HP-GL-like, com linha de inicializacao em `COM` (3.11).
- `.DXF` (arquivo CAD). Estrutura observada nas strings:
  - Abertura e secao: `SECTION`, `ENTITIES`, fechamento `ENDSEC`.
  - Camadas: `EST-LAJES`, `EST-PILAR`, `EST-VIGAS`, `EST-LAJES-TEXT`, `EST-PILAR-TEXT`, `EST-VIGAS-TEXT`, `EST-COTAS`, `EST-COTAS-TEXT`, `EST-ELEVA`, `EST-PILAR-HACH`.
  - Tipos de entidade e camada de uso: `LINE`, `CIRCLE`, `TEXT`. Os rotulos `COTAS`, `FERRO`, `ESTRIBO`, `CORTE`, `TABELA` aparecem como nomes de camada ou de bloco [inferido].
  - Modelos de linha: `L          1 1 1`, `C          1 1 1`, `T          1`, ` 1 0`. Parecem ser linhas-modelo de codigos de grupo DXF [inferido].
- Marcadores `[LARG]`, `[RAIO` e `RAIO]` estao nas strings, mas o papel deles nao foi identificado (lacuna 3).

**Caminhos padrao.** Drive de gravacao da folha (`.DXF`) e drive de plotagem (`.PLT`) sao campos do FORMA.INI e de PLOTER.INI (3.4). Nao ha caminho fixo nas strings.

## 6. Calculos e processamento

- **Escala e folha:** a escala escolhida (`escala do desenho 1/`) e as dimensoes da folha e das margens geram a area util. Se o desenho nao cabe, a mensagem 3.3 aparece [inferido: pela ordem das strings].
- **Area ocupada:** as strings trazem `AREA OCUPADA PELO DESENHO #### x#### mm`. O calculo da area do desenho nao aparece [inferido].
- **Altura de letra:** a altura de letra e definida por tipo de texto (coluna, vigas, lajes, amarracao, elevacao, extras) em milimetros.
- **Passo do cursor:** o passo de movimento em mm.
- **Origem da folha:** campo `Origem da Folha (mm)`.
- **Geracao:** `.PLT` e `.DXF` sao gerados em sequencia, cada um com seu aviso `Aguarde` (3.9).

Falha de processamento: `erro no processamento` seguido de `verifique a consistencia dos seus dados` e `Acione ESC <Enter> para Continuar `.

## 7. Relatorios, impressao e plotagem

Este e o modulo de impressao em folha de Formas. Saidas:

- **Plotagem em ploter:** secoes 3.3 a 3.10 e 5 (`.PLT`).
- **Arquivo CAD:** secao 5 (`.DXF`).
- **Opcoes de conteudo:** secao 3.5, com S/N para Lajes, Vigas, Pilares, Cotas e Elevacao.

A impressao matricial em escala e da FORMIMP (FORMIMP.md). O formato de caracteres da impressora matricial (ESC/P) e de INSTALAR (`INSTALAR.md`).

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| `erro no processamento` | Falha de geracao |
| `verifique a consistencia dos seus dados` | Dados inconsistentes [inferido] |
| `Acione ESC <Enter> para Continuar ` | Pausa apos erro |
| `DESENHO NA ESCALA ESCOLHIDA E MAIOR QUE A AREA UTIL DA FOLHA` | Desenho nao cabe na folha |
| `Modulo nao encontrado em ` | Submodulo ausente (secao 2) |

Nao ha texto `run-time error R6005/R6006/R6007` nas strings de FORMPLOT. As mensagens do carregador BRUN45 (`Error in loading RTM`, `Input run-time module path: ` e outras, em ingles) sao texto do runtime, nao do modulo. Ver lacuna 7.

## 9. Troca de disquete e pausas

- **Troca de disquete:** `Coloque o Disco FORMA no Drive `. Texto da versao em disquete; obsoleto. Nao reimplementar.
- **Pena do ploter:** `Coloque a pena de numero ... no Ploter` (3.10) e uma pausa de hardware.

## 10. Lacunas e incertezas

1. **Typos mantidos:** `Plotagen` (sic) em `<D>efine um campo de Plotagen`. `Ploter` (sic, por `Plotter`) em `no Ploter, no local da pena`. Mantidos como estao nas strings.
2. **Hotkeys ambiguas:** `D` (Detalhes ampliados e Define campo) e `T` (Textos e Todo o campo) aparecem com dois sentidos nos menus. Nao se sabe em qual tela cada uma e valida.
3. **Marcadores `[LARG]`, `[RAIO` e `RAIO]`**: nao identificados. Podem ser marcas de texto no DXF.
4. **Modelos `L`, `C`, `T` com `1 1 1`**: nao se sabe se sao codigos de grupo DXF ou outro formato.
5. **Sequencia do ploter** `,CS65535,DS65535,OP65535`: significado dos codigos nao confirmado. Parece HP-GL, mas as strings nao provam.
6. **`Sigo com a geracao em 9`**: o texto esta incompleto nas strings; o `9` pode ser residuo ou parte do texto.
7. **Mensagens R6005 a R6007 de FORMPLOT:** o texto nao aparece nas strings deste executavel. Conferir no executavel original, se o runtime de erro for necessario.
8. **Padrao das opcoes S/N** (3.5): o `*` vem seguido de residuo; o padrao nao e legivel.
9. **Campos sem valor padrao** (3.4): a origem dos valores (FORMA.INI ou PLOTER.INI) nao esta nas strings.
10. **Chamada e retorno:** o canal exato de `VOLTA<MOD>` nao esta nas strings (mesma lacuna de FORMA).
