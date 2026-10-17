# VIGA.EXE - Especificacao funcional

Fontes: strings do executavel original `VIGA.EXE` (fora do repositorio) e `sistrut-game/VIGA.INI`.
Convencoes: `[ini: VIGA.INI linha N]` = linha do arquivo de configuracao. `[inferido]` = deducao sem prova direta.
Nos textos abaixo, a letra destacada que se perdeu nas strings do executavel aparece como `!` (ex.: `!rquivar` = `Arquivar`). Bytes de caixa e de comprimento do QuickBASIC foram omitidos. Texto entre aspas simples e o texto exato das strings, sem correcao ortografica.

## 1. Papel do modulo

VIGA.EXE e o modulo de calculo de vigas continuas do SISTRUT. Ele tem tres funcoes principais, pela ordem do menu principal:
- arquivar a geometria e os carregamentos de cada viga em posicoes numeradas da obra;
- processar as vigas arquivadas (ou uma viga avulsa), obtendo esforcos, reacoes e envoltorias;
- gerar a somatoria de cargas nas colunas (pilares) e grava-la em arquivo `.REP` para o modulo PILAR.

Ele tambem grava e le as vigas arquivadas em disco (`.VIG`), corrige dados ja arquivados e mantem parametros globais em `VIGA.INI`.

Titulo: `VIGAS CONTINUAS`, com `Abril 1991` e `Versao 4.0`, alem de linhas de credito do original (omitidas). O cabecalho dos relatorios diz `Versao 4.0    Abril 1990`. As duas datas divergem no mesmo modulo (ver secao 9).

## 2. Chamada e retorno

**Entrada.** Lancado pelo gerenciador SISTRUT.EXE, sem argumentos declarados nas strings. Dentro do VIGA aparecem `COMSPEC` e `:\SISTRUT\EXEC40\` (caminho base dos submodulos), `LPT1:` e `COM1:` (saida de impressao), `PATH=.\`, e o nome do arquivo de configuracao `VIGA.INI`. `CDEF` aparece como rotulo de tabela, sem uso claro [inferido].

**Submodulos (chamada por cadeia).** Nomes de programa presentes no EXE: `VIGA`, `VIAUX`, `VIGRAV`, `VICALC`, `NOM`, `MIXT`. O prefixo `bm` antes de cada nome e lixo do formato de string do QuickBASIC [inferido]. Supoe-se que VIAUX, VIGRAV e VICALC sejam EXEs separados chamados por SHELL/CHAIN; NOM e MIXT nao tem funcao clara [inferido: VIGRAV = gravacao e leitura (secao 3.6); VICALC = calculo (secao 3.5); VIAUX = auxiliar de correcao/listagem; NOM e MIXT sem evidencia].

**Retorno.** Ao sair, `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` e depois `Retorno ao Modulo Gerenciador`. Se o modulo nao for achado no disco: `Modulo nao encontrado em `. As strings nao trazem nenhum token `VOLTA<MODULO>` (existe em FORMA e FORMINIT). O mecanismo de retorno aos submodulos e uma lacuna (secao 9). Os prompts de retorno usam `*RETORNO*` (tela de resultados) e `RETORNO` (leitura de vigas, 3.6).

## 3. Telas e menus

### 3.1 Tela inicial (menu principal)

Cabecalho: `VIGAS CONTINUAS`, `Abril 1991`, `Versao 4.0` e as linhas de credito do original (omitidas).

Itens, na ordem. Os numeros vem das strings; o caractere destacado (hotkey) e deduzido pela palavra [inferido]:

| No. | Texto exato (strings) | Hotkey | Destino provavel |
|---|---|---|---|
| 1 | `1  -  !rquivar Geometria das Vigas` ("Arquivar Geometria das Vigas") | A | Arquivamento (3.2) |
| 2 | `2  -  !rocessar Vigas arquivadas` ("Processar Vigas arquivadas") | P | Processamento em lote (3.5) |
| 3 | `3  -  Processar !ma Viga` ("Processar uma Viga") | U | Calculo de viga independente (3.5) |
| 4 | `4  -  !ista das Vigas Arquivadas` ("Lista das Vigas Arquivadas") | L | Listagem (3.4) |
| 5 | `5  -  !orrecoes dos dados` ("Correcoes dos dados") | C | Correcao (3.3) |
| 6 | `6  -  !ravacao e Leitura de Vigas` ("Gravacao e Leitura de Vigas") | G | Gravacao/leitura em disco (3.6) |
| 7 | `7  -  Processar com !esumo de cargas nos Pilares` ("Processar com Resumo de cargas nos Pilares") | R | Somatoria de cargas em pilares (3.5) |
| 8 | `!isualizar / Alterar Parametrizacoes` ("Visualizar / Alterar Parametrizacoes") | V | Parametros globais (3.7) |
| - | `<F2> = Fim` | F2 | Sai do modulo |
| - | `escolha opcao` | prompt | |

Os numeros 1 a 8 e a ordem seguem a sequencia das strings, mas o numero do item 8 nao aparece; deduzido pela ordem [inferido]. Os hotkeys sao deduzidos das palavras: a letra destacada foi perdida nas strings [inferido]. O menu nao traz `Fim` com hotkey, so `<F2>`.

### 3.2 Arquivamento de viga (menu 1)

Titulo da sub-tela: `Arquivo de Vigas Continuas`. Fluxo, em ordem de tela:

1. `Numero maximo de posicoes - ` e `posicionadas`. Pede o numero de posicoes (limite da obra) [inferido].
2. `Vigas da Obra ` e `Posicao`.
3. Aviso `Atencao !!!` com o texto: `Para o Nome da OBRA, recomendamos que seja dado de maneira a identificar primeiro o Pavimento e depois a Obra .`. Exemplo: `Exemplo:  sub2-MAK , tipo-312 , tipITU1 , cob-FMU , maq-O115`.
4. `Para alterar o nome da Obra rearquive a posicao 1`.
5. `Obra` e `maximo 8 caracteres`. Nome da obra limitado a 8 caracteres (nome DOS).
6. `Mantenho as Vigas arquivadas em memoria   NAO/*S*`. Default `S`.
7. `( posicao` e `Obra `.
8. `Dados Corretos N/*S*`. Default `S`.
9. `Viga *FIM*` e `maximo 20 caracteres`. Nome da viga: 20 caracteres, `*FIM*` encerra a entrada.
10. Geometria: `Numero de tramos sem balanco `; `Balanco  esquerda(` / `)  direita(` / `)  ambos(`; `Engaste  esquerda(`.
11. `Inercia e constante N/*S*` e `* <Enter> para calcular inercia`. Se `S`, a inercia e constante e o programa calcula. Se nao, e informada por tramo [inferido].
12. Secao da viga: `Secao 1)  Bw,Hw ` e `Secao 2)  Bw,Hw `. Bw e Hw = largura e altura da secao, uma para cada uma das duas secoes permitidas [inferido: Bw/Hw sao nomes de largura e altura].
13. Divisoes de carga: `Numero de divisoes de carga *1* ` (default 1). `SOMENTE` / `DIVISOES DE CARGA NA VIGA`. `(cargas totais)` / `(cargas acidentais)`.
14. Carga pontual: `Pac` / `Fac`; `Pac` e `Fac` (repetidos em cargas acidentais). `VERIFIQUE CARGA ACIDENTAL `.
15. Momentos externos: `Momentos externos aplicados (`; `Mext( apoio 0 ) , Mext( apoio`.
16. Erro de carga: `COLOCACAO ERRADA DAS CARGAS` e `CONSULTE O MANUAL`.
17. `Continua ...` e `Qualquer Tecla para Continuar ` (ver 3.5 para a ordem exata).

**Campos de carga (formato de tela).** Tabela `CARGA , P , D , F  *NAO*`; `CARGA TRAMO  P( D( F(`; `CARGA , Pac , Fac *NAO*`; `CARGA TRAMO   Pac(  Fac(`. Instrucao: `Coloque  I n  para INCLUIR antes da carga de numero n  e  D n  para DELETAR`.

Hipotese: P = valor da carga, D = posicao inicial, F = posicao final (carga parcial); Pac/Fac = as mesmas grandezas para a carga acidental [inferido].

### 3.3 Correcao de dados (menu 5)

Titulo: `Correcao das Geometrias e Carregamentos das Vigas Posicionadas`. Entrada: `Numero da Posicao a ser Alterada *FIM*`.

Menu de correcao, com o numero deduzido pela ordem [inferido]:

| No. | Texto exato (strings) |
|---|---|
| 1 | `1  -  Nome da Viga` |
| 2 | `2  -  Numero de Tramos` |
| 3 | `3  -  Balancos e Engastes` |
| 4 | `4  -  Comprimento dos Tramos e Inercias` |
| 5 | `5  -  Cargas Totais` |
| 6 | `6  -  Cargas Acidentais` |
| 7 | `7  -  Momentos Aplicados` |
| 8 | `8  -  *Fim da Correcao*` |

Sub-tela de edicao de uma viga, com os textos da tela:
- `Alteracao do nome da Viga`; `Viga *`.
- `Incluir um novo Tramo apos o Tramo *NAO* `; `Eliminar o Tramo *NENHUM*`.
- `Balanco  esquerda(` / `)  direita(` / `)  ambos(` / `NAO*` / `Engaste  esquerda(`.
- Tabela `TRAMO     L(` / `)      J(`; linha de tramo `TRAMO , L , J  *NAO*`.
- Cabecalho `POSICAO  VIGA     TRAMOS Be Bd Ee Ed   Vinculo de Carga`. Be/Bd = balanco esquerda/direita; Ee/Ed = engaste esquerda/direita [inferido].
- `Momentos Externos Aplicados (` / `Mext(apoio 0) , Mext(apoio`.

### 3.4 Listagem de vigas arquivadas (menu 4)

`Listo as Vigas S/*N*`. (Palavra nas strings: `Listo`; a forma provavel e `Lista`. Literal aqui.) Cabecalho: `Registro  Viga            Tramos  Data`; linha `Vigas     * interrompe&`; `Qualquer Tecla para Continuar `. Relisto: `Relisto as Vigas S/*N*` e `Continuo N/*S* %`.

### 3.5 Processamento (menus 2, 3 e 7)

**Escolha das vigas.** `Escolha das Vigas para Processamento`; `Todas as Vigas S/*N*`; `Processar Registros  ` com `I/J/N a M/.../K #`. Os intervalos sao de posicoes, sintaxe `I/J/N a M/.../K` [inferido].

**Erros.** `VERIFIQUE OS SEUS DADOS DE ENTRADA`. `Entre somente com o numero do Pilar ou   * <Enter>  para desconsiderar o apoio`. `INDEXADA#` / `Esta Viga possui cargas indexadas.` / `Leia o arquivo, processe e regrave para poder utiliza-lo.`. `erro no processamento` / `verifique a consistencia dos seus dados` / `Acione ESC <Enter> para Continuar `.

**Dados de apoio (por viga).** `Dados de Apoio`. `Registro` / `Viga ` / `Tramo` / `NAO LIDO` / `LIDO`. `Numero do pilar referente ao Apoio`; `-desconsiderado`.

**Tela de resultados** (dentro do processamento, sem cabecalho proprio): `Calculo das Vigas Arquivadas Posicionadas`; `Vigas referentes a Obra `; `Calcular posicoes I/J/N a M/.../K *RETORNO*`; `Imprimo os resultados S/*N*`; `Desenho diagramas de esforcos S/*N*`; `Escala 1/..`; `200.. 100.. 50..  FOTO`; `*VIDEO*`; `Paro para visualizacao no Monitor S/*N*`; `<D>esenho ou <I>mprimo o esquema estrutural das Vigas *N*`; `Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario`.
Avisos: `AS VIGAS REFERENTES AS POSICOES:` / `NAO FORAM PROCESSADAS`; `Qualquer Tecla para Continuar `.

**Calculo de viga independente (menu 3).** `Calculo de uma Viga independente dos Arquivos`; `OBRA `; `Imprimo os Resultados S/*N*`; `Desenho Diagramas de Esforcos S/*N*`; `Paro para Visualizacao no Monitor S/*N*`.

**Somatoria de cargas em pilares (menu 7).** `Processamento de Vigas Continuas com saida de cargas nos Pilares`. Limites exibidos: `Maximo de` / `Vigas e` / `Pilares diferentes`. Tipos de carga e reacao: `Consideracao de Cargas Totais` / `e Acidentais` / `com Momentos Externos`; `Consideracao de Reacoes Maximas` / `Estaticas`.

**Envoltoria** (saida de calculo, ver secao 5): `envoltoria de carga acidental ...`; cabecalho `APOIO          M-([` / `R(~` / `max` / `soma das reacoes estaticas` / `negativos reduzidos a`.

**Esforcos por tramo.** `TRAMO     Ve(` / `x(` / `M+(` / `Vd(` / `f*EJ`; `Momento Engastamento Perfeito apoio(0) 0`; `Momento Engastamento Perfeito apoio(`; `Esforcos de Engastamento Perfeito`. `Qualquer Tecla para Continuar `.

### 3.6 Gravacao e leitura de vigas (menu 6)

Titulo: `Gravacao e Leitura de Vigas Continuas`. Submenu:

| No. | Texto exato (strings) |
|---|---|
| 1 | `1  -  Criacao de Arquivo em Disco` |
| 2 | `2  -  Gravacao de Vigas em Disco` |
| 3 | `3  -  Numero de Vigas Gravadas` |
| 4 | `4  -  Catalogo de Vigas Gravadas` |
| 5 | `5  -  Leitura de Vigas Gravadas` (nas strings: `Ceitura de Vigas Gravadas`; o `C` e a letra destacada ruim, ver lacunas) |
| 6 | `6  -  Acesso ao DOS (Kbytes livres )` |
| 7 | `7  -  Alterar Drive e Diretorio` |
| 8 | `8  -  *Retorno ao Menu Principal*` |
| - | `escolha opcao ` |

**Criacao de arquivo.** `ATENCAO !  `. Texto: `A criacao do arquivo, deve ser feita somente quando este ainda nao existe.`; `Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido.`; `O Arquivo que sera criado para gravacao das Vigas arquivadas em Memoria, devera ter o mesmo nome da Obra arquivada com extensao .VIG`. Sub-prompts: `Arquivadas em Memoria` / `Vigas da Obra ` / `Nao ha Vigas Arquivadas na Memoria` / `Nome do arquivo *` / `NAO CRIAR`.

**Gravacao.** `Gravacao de Vigas Continuas`; `Vigas referentes a Obra `; `Entre com o intervalo de posicoes que sera gravado   ...`; exemplos de intervalo `1 A 2  ou  1,5 (1 2.. 5)  ou  2 (somente 2)  ou  4a7 ...`; `Gravar no Disco, posicoes da memoria ` / `A ` / `*FIM*`; `A partir (` / `INCLUSIVE` / `) no Disco, do Registro `; `Dados Corretos N/*S*`; `GRAVADOS` / `REGISTROS NESTE ARQUIVO `.

**Contagem.** `Pesquisa do Numero de Vigas Gravadas`; `Vigas da Obra `; `Nome do Arquivo a Pesquisar *FIM*`; `Gravadas` / `Vigas `.

**Catalogo.** `Catalogo de Vigas Gravadas em Disco`; `Nome do Arquivo a Catalogar *FIM*`; `Registro  Viga            Tramos  Data`; `Vigas     * interrompe`; `###      \             \   ##   \   \` (mascara de linha); `Qualquer Tecla para Continuar `.

**Leitura.** `Leitura de Vigas Gravadas em Disco`; `RETORNO`; `Nome da Obra *`; `As Vigas da Obra ` / `serao Perdidas  SIM/*N*` / `SIM`; `Entre com o intervalo de posicoes que sera lido ...`; `Ler Registros do Disco !`; `Coloca-las em Memoria a Partir (` / `) da Posicao *`; `TEMOS?`; `VIGAS GRAVADAS NESTE ARQUIVO.  NAO PODE SER LIDO ATE O REGISTRO` / `para retornar acione EXIT <Enter>`; `Acione  D <Enter>  para alterar Drive e Diretorio`; `Aguarde ...`. `EXIT` e a palavra de saida nessa tela.

### 3.7 Parametrizacao (menu 8)

Tela "Correcao dos Parametros". Mostra os parametros de calculo e permite alterar cada um. Os valores iniciais vêm de `VIGA.INI` [ini: VIGA.INI linhas 7 a 12]. Se a tela grava de volta em `VIGA.INI` ou so vale para a sessao: [inferido], ver secao 9.

Itens da tela (a numeracao 1 a 5 nao aparece nas strings; so o item 6 tem numero visivel) [inferido]:

- Reduzir momentos negativos a `____ %`. Faixa 15 a 100, padrao 100 [ini: VIGA.INI linha 7].
- Consideracao de cargas acidentais `(S/N)` (a primeira letra esta perdida nas strings, "orneco" = "Consideracao" [inferido]). Padrao N [ini: VIGA.INI linha 8].
  - "Fornecidas atraves de entrada de dados" (opcao F).
  - "Geradas automaticamente como ... % da carga total" (opcao G). Percentual de 4 a 96, padrao 30 [ini: VIGA.INI linhas 9 e 10].
- Aplicacao e fornecimento de momentos externos `(S/N)` (inicio perdido nas strings; ver a tela de edicao "Aplicacao e Fornecimento de Momentos Externos"). Padrao N [ini: VIGA.INI linha 11].
- Indexacao com reacoes maximas ou estaticas `(M/E)`. Padrao E [ini: VIGA.INI linha 12].
- Unidade de esforcos e medidas. A tela de edicao pede so a unidade de forca (ver abaixo); nao ha texto de unidade linear nas strings.
- "6 - *Retorno ao Menu Principal*". "Escolha opcao".

Telas de edicao, uma por parametro, com o campo marcado por `*`:

- "Reduzir Momentos Negativos a *".
- "Considero Cargas Acidentais na entrada de dados/processamento" (S/N).
- "As cargas Acidentais serao <F>ornecidas ou <G>eradas *".
- "Percentual de Carga Acidental *".
- "Aplicacao e Fornecimento de Momentos Externos" (S/N).
- "As reacoes Indexadas e/ou Somatoria serao <M>aximas ou <E>staticas *".
- "Unidade de Forca *". Os coeficientes de conversao (`1` e `1` no INI, linhas 5 e 6) nao aparecem como prompt nas strings [inferido: nao editaveis pela tela].

## 4. Entradas do usuario

Todos os prompts abaixo estao nas telas da secao 3. Defaults e limites vem das strings do executavel ou do `VIGA.INI`.

**Identificacao da obra e viga**
- Nome da obra: ate 8 caracteres. Nome DOS.
- Nome da viga: ate 20 caracteres.
- Numero de posicao: inteiro, ate o numero de posicoes da obra (limite numerico nao esta nas strings).
- Nome do arquivo de gravacao: default de nome = nome da obra com `.VIG`.

**Geometria**
- Numero de tramos sem balanco.
- Balanco esquerda/direita/ambos e engaste esquerda. O tipo de balanco/engaste e escolhido por menu; as strings nao trazem campo S/N para isso.
- Inercia: `N/*S*` com default S; `<Enter>` para calcular.
- Secao 1 e secao 2: Bw e Hw (dimensoes da secao; unidade a definir pela unidade de medida do VIGA.INI).

**Cargas**
- Numero de divisoes de carga: default `*1*`.
- Carga total e acidental por tramo: P, D, F (e Pac, Fac). Acao: `I n` inclui antes da carga n; `D n` deleta.
- Momentos externos: Mext(apoio 0), Mext(apoio n).

**Parametros globais (VIGA.INI, editaveis no menu 8)**
Sao as chaves do arquivo `sistrut-game/VIGA.INI` (valores abaixo sao os do arquivo original, nao o default do EXE):

| Chave (INI) | Valor original | Significado | Texto na tela |
|---|---|---|---|
| `C` | `C` | drive default de dados | `Acione D <Enter>`; `Drive que contem o Disco de Dados` |
| `\` | `\` (raiz; o aviso do INI sugere `\SISTRUT\`) | diretorio default de dados | `\Diretorio\Subdiretorio\...\` |
| `m` | `m` | unidade de medida linear | `Unidade de Medida *` |
| `t` | `t` | unidade de forca | `Unidade de Forca *` |
| coef. (1) | `1` | multiplicador p/ metros | `Coef. Multiplicador para metro` |
| coef. (2) | `1` | multiplicador p/ toneladas | `Coef. Multiplicador para tonelada` |
| reducao | `100` (faixa 15 a 100) | % multiplicador dos momentos negativos | `Reduzir Momentos Negativos a` |
| acidental | `N` | considerar carga acidental S/N | `Considero Cargas Acidentais na entrada de dados/processamento` |
| origem acid. | `F` | F = fornecida, G = gerada | `As cargas Acidentais serao <F>ornecidas ou <G>eradas` |
| % acid. | `30` (faixa 4 a 96) | % de carga acidental gerada sobre a total | `Percentual de Carga Acidental` |
| mom. externos | `N` | aplicacao e fornecimento de momentos externos S/N | `Aplicacao e Fornecimento de Momentos Externos` |
| indexacao | `E` | reacoes indexadas: E = estaticas, M = maximas | `As reacoes Indexadas e/ou Somatoria serao <M>aximas ou <E>staticas` |
| max. vigas em memoria | `200` | vigas arquivadas simultaneamente | `Maximo de Vigas` [inferido] |
| max. vigas por processamento | `150` | vigas por processamento conjunto com reacao em pilares | idem [inferido] |
| max. pilares | `80` | pilares diferentes para a somatoria | `Pilares diferentes` [inferido] |

Impressora (INI): `CHR$(27)+CHR$(50)` = espacamento padrao 1/6"; `CHR$(27)+CHR$(48)` = espacamento 1/8"; `CHR$(27)+CHR$(78)+CHR$(6)` = 6 linhas no picote; `CHR$(27)+CHR$(79)` = anula o pulo do picote (graficos). [inferido: sequencias ESC/P, nao aparecem no EXE como strings; sao do arquivo INI.]

Multiplicador para colunas (tela de somatoria de pilares): texto `Entre com o multiplicador em porcentagem (0% a 100%) para estes momentos.`; prompt `Multiplicador dos Momentos de Vigas Apoiadas (%) `. Valor padrao nao aparece nas strings.

## 5. Arquivos lidos e gravados

| Nome / extensao | Quando | Direcao | Formato inferido |
|---|---|---|---|
| `VIGA.INI` | na partida | le | texto, `chave=valor` por linha, CRLF; ver secao 4 e `sistrut-game/VIGA.INI` |
| `<obra>.VIG` | menu 6, criacao e leitura | le e grava | registros de viga (posicao, nome, tramos, data), formato binario ou texto nao descrito nas strings |
| `<arquivo>.REP` | menu 7, gravacao da somatoria de cargas em pilares (S/N) | grava | registros: `P####` (posicao/pilar) e `#####.##` (valores numericos); lido depois pelo PILAR |
| dados de apoio (pilar) | processamento | le | numero do pilar referente a cada apoio |
| Drive e diretorio de dados | menu 6 opcao 7; menu 8 | le | caminho base |

Extensoes citadas por outras familias (FORMA, PILAR, LAJE) sao tratadas em `_FAMILIA_VIGA.md`.
Caminho padrao de dados vem do INI (`C` e `\`; o aviso do INI sugere `\SISTRUT\` como diretorio de trabalho), com criacao de diretorio sob confirmacao: `ATENCAO ! .. Drive e Diretorio nao encontrados` / `Crio o Diretorio` / `Criando Diretorio     Aguarde ...`.

## 6. Calculos

Modelo de entrada: viga com tramos, balancos e engastes, cargas totais e acidentais por tramo, momentos externos opcionais, inercia constante ou por tramo, e duas secoes (Bw, Hw).

Etapas que as strings nomeiam:
- **Engastamento perfeito.** Calcula o momento de engastamento perfeito de cada tramo e apoio: `Momento Engastamento Perfeito apoio(0) 0`, `Momento Engastamento Perfeito apoio(`, `Esforcos de Engastamento Perfeito`.
- **Metodo de resolucao.** As strings nao dizem qual metodo resolve a viga continua (distribuicao de momentos, matriz de rigidez ou outro). [inferido: metodo de rigidez ou distribuicao; sem prova.]
- **Envoltoria.** `envoltoria de carga acidental ...`. Envoltoria de esforcos sobre os arranjos de carga acidental. [inferido: maximos e minimos por secao.]
- **Reacoes.** Reacoes maximas ou estaticas, escolhidas no INI (`E`/`M`). A soma das reacoes estaticas aparece na saida.
- **Reducao de momentos negativos.** Multiplicador em porcento (faixa 15 a 100; valor original `100`). Saida `negativos reduzidos a`.
- **Momentos nas colunas.** Texto da norma brasileira no EXE: alem dos momentos de engastamento, devem ser considerados nas colunas parcelas dos momentos de engastamento perfeito das vigas de periferia e de extremidade, em funcao da relacao entre a rigidez da viga e a da coluna. O usuario informa um multiplicador de 0% a 100% para esses momentos. O valor padrao nao aparece nas strings.
- **Saida por tramo.** Colunas `TRAMO`, `Ve(`, `x(`, `M+(`, `Vd(`, `f*EJ`. [inferido: Ve e Vd = cortante na esquerda e na direita; x = abscissa do momento maximo; M+ = momento positivo; f*EJ = flecha vezes rigidez.]
- **Carga acidental gerada.** Se o INI mandar gerar (`G`), a carga acidental e uma porcentagem da total (faixa 4 a 96; valor original `30`). Se `F`, e fornecida pela entrada.

Tela de andamento: `Calculo das Vigas Arquivadas Posicionadas`. Erros de processamento: secao 3.5 e secao 8.

## 7. Relatorios e impressao

**Escolha da saida** (tela `Escolha do Tipo de Saida e Impressao`):
- `Desenho Diagrama de Esforcos S/*N*`.
- `Imprimo somente a Somatoria de Cargas S/*N*`.
- Subopcoes para a somatoria: `Cargas Totais`, `Momentos Externos`, `Reacoes`.

**Somatoria em pilares (arquivo .REP).** Pergunta `GRAVO A SOMATORIA DE CARGAS NOS PILARES EM DISCO DE DADOS (.REP) S/*N*`. Titulos de relatorio:
- `Reacoes de Apoio`; `Obra -`; `Registros`; colunas `P`, `carga`, `momento`.
- Cabecalho de pagina: linha com o nome do fornecedor do original (omitido); `Versao 4.0    Abril 1990`.
- Titulo da listagem: `SOMATORIA DE REACOES EM PILARES`; `GERADO EM`; `REGISTROS`.
- Mascara da linha: `P####     #####.##`. [inferido: P seguido do numero do pilar com 4 digitos; valor numerico com 5 inteiros e 2 decimais.]
- O arquivo e lido depois pelo PILAR.

**Desenho de diagramas** (tela de resultados): `Escala 1/..`; `200.. 100.. 50..  FOTO`; `*VIDEO*`; `Paro para visualizacao no Monitor S/*N*`. Opcao `<D>esenho ou <I>mprimo o esquema estrutural das Vigas`. [inferido: `FOTO`/`VIDEO` marcam escala para impressora ou tela; as strings nao descrevem o desenho em si.]

**Impressora.** Portas `LPT1:` e `COM1:`. Sequencias ESC/P vem do INI (secao 4). Controle de picote: `Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario`.

## 8. Mensagens de erro e aviso

| Mensagem (texto na tela) | Quando |
|---|---|
| `VERIFIQUE OS SEUS DADOS DE ENTRADA` | dados invalidos na escolha de vigas |
| `Entre somente com o numero do Pilar ou * <Enter> para desconsiderar o apoio` | apoio sem pilar valido |
| `INDEXADA#` / `Esta Viga possui cargas indexadas.` / `Leia o arquivo, processe e regrave para poder utiliza-lo.` | viga com cargas indexadas antes do processamento |
| `erro no processamento` / `verifique a consistencia dos seus dados` / `Acione ESC <Enter> para Continuar` | falha de calculo |
| `VERIFIQUE CARGA ACIDENTAL` | carga acidental inconsistente na entrada |
| `COLOCACAO ERRADA DAS CARGAS` / `CONSULTE O MANUAL` | carga mal posicionada |
| `AS VIGAS REFERENTES AS POSICOES:` / `NAO FORAM PROCESSADAS` | lista de posicoes sem calculo |
| `Nenhum Arquivo Encontrado` | leitura de arquivo inexistente |
| `NAO EXISTE ESTE ARQUIVO NESTE DISCO#` | arquivo ausente no drive |
| `O SEU DISCO DE DADOS ESTA COMPLETO` | disco cheio na gravacao |
| `VERIFIQUE O SEU DRIVE` | drive invalido |
| `ATENCAO ! .. Drive e Diretorio nao encontrados` / `Crio o Diretorio` | caminho de dados inexistente |
| `VIGAS GRAVADAS NESTE ARQUIVO.  NAO PODE SER LIDO ATE O REGISTRO` | leitura alem do fim do arquivo `.VIG` |
| `Modulo nao encontrado em ` | modulo filho ausente no disco |
| `Coloque o Disco de Dados no Drive` | troca de disquete; obsoleta (ver secao 9) |

Avisos de confirmacao: `ATENCAO !  ` antes da criacao de arquivo; `Qualquer Tecla para Continuar `.

## 9. Lacunas e incertezas

1. **Datas divergentes.** A tela inicial diz `Abril 1991` e o cabecalho dos relatorios diz `Abril 1990`. Nao ha como saber qual esta certa sem outra fonte.
2. **Metodo de calculo.** As strings nao descrevem o metodo de resolucao das vigas continuas (secao 6). Tudo que a secao 6 diz sobre o metodo e [inferido].
3. **Formato dos arquivos `.VIG` e `.REP`.** As strings so trazem a mascara de linha do `.REP` e as mensagens de gravacao. O layout binario ou texto de `.VIG` nao aparece.
4. **Letras de hotkey perdidas.** As strings perderam a letra destacada de quase todos os itens de menu. Os hotkeys da secao 3 sao deduzidos das palavras [inferido].
5. **Numero do item 8 do menu principal.** Nao aparece nas strings; a numeracao e deduzida da ordem [inferido].
6. **Texto `Ceitura de Vigas Gravadas`**: o `L` do item 5 do menu 6 esta perdido nas strings. Literal aqui: `Leitura`.
7. **`Listo as Vigas`**: as strings trazem `Listo`; a forma provavel e `Lista`.
8. **Submodulos VIAUX, VIGRAV, VICALC, NOM, MIXT.** Os nomes estao no EXE, mas o mecanismo de chamada (SHELL, CHAIN ou outro) nao aparece. Funcao de NOM e MIXT sem evidencia.
9. **Retorno aos submodulos.** Nao ha token `VOLTA<MODULO>` nas strings. Os prompts de retorno sao `*RETORNO*` e `RETORNO` (secao 2).
10. **Prompt `Nome da Obra *FIM*`**: aparece logo depois de `Coloque o Disco de Dados no Drive`. A tela a que pertence nao esta identificada. [inferido: leitura de dados em disco.]
11. **Troca de disquete.** `Coloque o Disco de Dados no Drive` e a mensagem de troca de disquete. Obsoleta pelo pedido do usuario. Nao reimplementar.
12. **`CDEF`**: rotulo de tabela sem uso claro no EXE.
13. **Sentido de `Bw` e `Hw`.** Assumidos como largura e altura da secao; a unidade vem de `m` no INI, mas nao esta confirmada [inferido].
14. **Multiplicador dos momentos nas colunas.** O valor padrao nao aparece nas strings.
15. **Limites do INI (200, 150, 80).** O significado exato de cada limite no processamento e [inferido].
16. **Tela de desenho.** `FOTO`, `VIDEO` e `Paro` sao rotulos sem descricao do que a tela mostra.
