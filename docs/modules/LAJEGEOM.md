# LAJEGEOM.EXE - Especificacao funcional

Fontes: strings do executavel original `LAJEGEOM.EXE` (fora do repositorio), `sistrut-game/LAJE.INI` e `sistrut-game/SISTRUT.LAP`.
Convencoes: `[arquivo: NOME linha N]` = valor lido de arquivo de configuracao do repo (`sistrut-game/`). `[inferido]` = deducao sem prova direta.
Nos textos abaixo, a letra destacada que se perdeu nas strings extraidas aparece como `!`. Bytes de caixa e de comprimento do QuickBASIC foram omitidos. Texto entre crases e o texto exato das strings do executavel, sem correcao ortografica.

## 1. Papel do modulo

LAJEGEOM.EXE e o modulo de geometria e entrada de dados das lajes do SISTRUT (pavimento de lajes). [inferido: pelo nome e pela parametrizacao de LAJE.INI; a confirmacao textual vem das telas da secao 3.]

Os submodulos chamados por cadeia (secao 2) indicam as tres partes do trabalho: grupo de auxiliares de laje (`LAJEGAUX`), pivotamento/posicionamento (`LAJEPIVI`) e ocupacao (`LAJEOCUP`) [inferido].

## 2. Chamada e retorno

**Entrada.** Lancado pelo gerenciador LAJE.EXE (ou SISTRUT.EXE) [inferido: o protocolo de retorno `VOLTA LAJEGEOM` existe, ver item Retorno abaixo]. Nome do programa no proprio executavel: `LAJEGEOM`.

**Submodulos (chamada por cadeia).** Nomes de programa presentes no executavel, na ordem em que aparecem:
- `LAJEGAUX`
- `LAJEPIVI`
- `LAJEOCUP`
- `MIXT`

O prefixo `bm` antes de cada nome e lixo do formato de string do QuickBASIC [inferido]. Supoe-se que sejam EXEs separados chamados por SHELL/CHAIN [inferido]. Papel de cada um: nao determinado pelas strings (lacuna, secao 9).

**Retorno.** Protocolo `VOLTA LAJEGEOM`, nome `LAJE`, titulo `Retorno ao Modulo Basico de LAJE`. Mensagem de modulo ausente na cadeia de chamada: `Modulo nao encontrado em +` (secao 8). Lacunas na secao 9.

## 3. Telas e menus

### 3.1 Cabecalho e menu principal

Titulo de tela: `Definicao dos dados de Geometria do Painel`. Campo de contagem: `Numero maximo de Lajes -` e `Posicionadas`. Cabecalho de lista: `Lajes`.

Itens do menu, na ordem das strings. A letra destacada (hotkey) foi perdida e e deduzida da palavra [inferido]:

| No. | Texto exato | Hotkey deduzida | Destino provavel |
|---|---|---|---|
| 1 | `1  -  Ei` + `os de Auxilio` (= "Eixos de Auxilio"; o `x` nao aparece nas strings) | E | Eixos de auxilio (3.2) |
| 2 | `rquitetura, definicoes de contorno` ("Arquitetura, definicoes de contorno") | A | Contorno de arquitetura (3.4) |
| 3 | `cupacao / Cargas de Arquitetura` ("Ocupacao / Cargas de Arquitetura") | O | Cargas de arquitetura (3.5) |
| 4 | `strutura / Lancamento` ("Estrutura / Lancamento") | E | Lancamento de estrutura (3.6) |
| 5 | `ilares` ("Pilares") | P | Pilares [inferido: destino sem texto proprio nas strings] |
| 6 | `ajes / ` + `argas de Estrutura` ("Lajes / Cargas de Estrutura") | L | Lajes / cargas de estrutura [inferido] |
| 7 | `igas / Geracao de Arquivos (.VIG e .RLP)` ("Vigas / Geracao de Arquivos (.VIG e .RLP)") | V | Geracao de arquivos para VIGA e PILAR (3.7) |
| 8 | `mpressao de Relatorios` ("Impressao de Relatorios") | I | Impressao (3.8) |
| 9 | `etorno ao Menu Principal` ("Retorno ao Menu Principal") | R | Retorno ao modulo basico de LAJE (secao 2) |
| - | `escolha opcao ` | - | Prompt de escolha |

Numeros 2 a 9 nao aparecem nas strings; deduzidos pela ordem [inferido]. A hotkey `E` aparece nos itens 1 e 4 (conflito a confirmar, ver secao 9). A numeracao exata em tela e um detalhe nao confirmado.

Titulo de sub-tela de LAJEGEOM ao sair do menu: `Retorno ao Modulo Basico de LAJE`, com protocolo `VOLTA LAJEGEOM` e nome `LAJE`. Ver secao 2.

### 3.2 Eixos de auxilio (menu 1)

Titulo: `Definicao dos Eixos de Auxilio`. Campo: `Numero maximo de Eixos - *`.

Prompt de cota: `Entre com o valor da Cota dos Eixos em  [` + `]  ou use os codigos auxiliares`.

Codigos auxiliares (a letra do codigo e o hotkey da linha):

| Codigo | Texto exato |
|---|---|
| H | `H          Solicita a entrada dos eixos Horizontais` |
| V | `V          Solicita a entrada dos eixos Verticais(` |
| * n | `* n        para pular para o Eixo n` |
| A x | `A x        para Acrescentar no ultimo Eixo o valor x` |
| R x,y | `R x,y      para Repetir o Acrescimo  x  por  y  vezes` |
| C | `C          Cancela todos os anteriores` |
| I x | `I x        Inclui um novo Eixo na cota  x  antes do indicado` |
| S x | `S x        Soma  x  em todos os Eixos superiores a partir do indicado` |
| D | `D          Deleta o Eixo indicado` |

Rotulos de lista: `HORIZONTAIS`, `VERTICAIS`, `Eixo HORIZONTAL (`, `Eixo  VERTICAL  (`.

Confirmacao de cancelamento: `Confirme CANCELAR os dados dos Eixos S/*N*`. Default `N` [inferido: a letra com asterisco marca o default, como em VIGA].

### 3.3 Arquivo e disco de dados

- `Acione  D <Enter>  para alterar Drive e Diretorio`.
- `Nenhum Arquivo Encontrado`.
- `ERRREP#`. Nome de arquivo ou mascara de busca [inferido: nao ha texto que confirme; o sufixo `#` e lixo ou caractere de controle].
- `Drive que contem o Disco de Dados `.
- `\Diretorio\Subdiretorio\...\`.
- `Subdiretorio `.
- `Obra `. `Descricao do Pavimento /`.
- `Defina o Nome da Obra ou Pavimento para Gravacao-Arquivo`.
- `OBRA `.

### 3.4 Arquitetura e contorno (menu 2)

Titulo do desenho: ` A R Q U I T E T U R A`.

Tabela de comandos da tela de desenho (ordem das strings):
- `<I>nicio  <D>eleta  <R>edesenha  <Z>oom  <C>oordenada  <F>im`. Modo por eixo; `Movimenta` / `por Eixo` / `por Coordenada`.
- `<I>nicio  <D>eleta  <R>edesenha  <Z>oom  <E>ixo  <F>im`.
- `<+ -> <P>asso do cursor  <C>oordenada absoluta`.
- `<T>odo o contorno  <U>ltimo trecho  <E>scolher o trecho  <*R*>etorno`.
- `Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*`.
- `<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna`.
- Entrada de coordenada: `Movimente o cursor ate a Coordenada *###.###,###.###*`. Passo: `Passo de movimentacao *###.####*`.

Rotulos de eixos na tela: `Eixos Horizontais`, `Eixos Verticais`, `Contorno da Arquitetura#`.

Processamento intermediario (mensagens de espera): `Aguarde ...`, `Interseccoes...`, `Contornos de Laje...`, `Ordenacao...`.

### 3.5 Cargas de arquitetura e de estrutura (menus 3 e 6)

Titulo: ` C A R G A S   D E   L A J E`.

Menu de cargas: `<N>ivel   <B>uracos   <T>ipo   <C>argas nas lajes   <A>linhamento   <F>im`. Hotkeys: N, B, T, C, A, F.

Prompt de imposicao: ` ( Acione  T <Enter>  para imposicao de cargas em Todas as Lajes`. O texto termina sem fechar parentese.

Cabecalhos de tabela de carga (usados nos relatorios e na tela) estao na secao 7.

Nota: as strings trazem `unidades ▌`; o texto de unidade e lixo de caractere grafico sem o valor [inferido].

### 3.6 Lancamento de estrutura (menu 4)

Titulo: ` E S T R U T U R A`. Comandos: `<T>odas as linhas   <U>ltima linhas   <E>scolher a linha   <*R*>etorno`. Delecao: `Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*`. Lista vazia: `NENHUM`.

Modos de desenho e cursor: `<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna`; `Movimente o cursor ate a Coordenada *###.###,###.###*`; `Passo de movimentacao *###.####*`.

Menu de movimentacao em grade: `Movimenta por Eixo` / `por Coordenada`; comandos `<I>nicio <D>eleta <R>edesenha <Z>oom <C>oordenada <F>im`, `<E>ixo`, `<+ -> <P>asso do cursor <C>oordenada absoluta`.

Tela de desenho anterior (antes de ESTRUTURA nas strings): mesmos comandos de grade, mais `<A>lvenaria`. Pela posicao, pertence a uma tela de desenho de alvenaria [inferido].

Lista de tipos de video: `HER`, `CGA`, `MCG`, `EGA`, `VGA`. Sao nomes de adaptadores de video (Hercules, CGA, MCGA, EGA, VGA) usados na deteccao da placa [inferido: sao codigos de deteccao de monitor, nao de tela do usuario].

### 3.7 Pilares (menu 5)

Titulo: `P I L A R E S`. Entrada: `Numero ou Nome do Pilar`; conflito: `Pilar. ... ja existe. Renumero para Cima e Incluo N/*S*`. Comandos: `<T>odas os Pilares <U>ltimo Pilar <E>scolher o Pilar <*R*>etorno`; delecao `Escolha o trecho a Deletar ...`; desenho `<D>efine um campo ...`; `FIM`; cursor e passo como na secao 3.6. Renumeracao: `Renumero os Pilares S/*N*`.

Na tela de pilares, as mesmas linhas de desenho/movimento da secao 3.6 se repetem.

### 3.8 Vigas de laje (menu 7, parte 1: montagem do contorno de vigas)

Titulo: ` V I G A S`. Espera: `Aguarde ...`.

Comandos: `<N>ivel   <J>untar   <S>eparar   <R>edesenhar   <G>eracao .VIG .RLP    <F>im`. `G` gera os arquivos `.VIG` e `.RLP` (ver secao 5).

Prompts de juncao e separacao:
- `Numero da primeira Viga *FIM*`
- `Numero da segunda Viga *RETORNA*`
- `Numero da Viga que sera Separada *FIM*`
- `Separo neste Local  <S>im  <*P*>roximo  <F>im`
- `Nivel das Vigas para numeracao *`
- `Denominacao utilizada *`

Aviso antes de gerar: `Existem Lajes a serem calculadas sem peso proprio.  Continuo  N/*S*`. Default `S`.

Aviso de ordem: `ATENCAO !     Caso o arquivo de Vigas seja Gerado apos as consideracoes de Continuidade,` + `a Distribuicao de Cargas sera Alterada .`. Confirmacao: `Confirme prosseguir para montagem dos arquivos .VIG e .RLP  N/*S*`. Default `S`.

### 3.9 Montagem (menu 7, parte 2)

Titulo: `MONTAGEM`; espera `Aguarde ..`. Mesmos comandos de desenho da secao 3.6.

Listas de carga editaveis:
- ` - Carga Linear`
- ` - Carga por Area`
- Comandos de carga linear: `<M>odifica <L>inear`; de area: `<M>odifica <A>rea`. Ha tambem modo por coordenada. Comandos completos: `<+ -> <P>asso do cursor`, `<C>oordenada absoluta`.

### 3.10 Cargas de ocupacao / arquitetura (menu 3)

Titulo: ` C A R G A S   D E   O C U P A C A O`.

Entradas:
- `Carga por metro linear de Alvenaria`
- `Entre com o valor da carga ou A*B para multiplicar`. `A*B` = multiplicacao (ex.: area x carga) [inferido].
- `Carga `
- `Carga de Ocupacao distribuida na area demarcada (Total e Parcela Acidental)`
- `Carga de Ocupacao Total -`
- `Total = ###.##   Parcela Acidental da Carga de Ocupacao`

Comandos de lista: `<T>odas as cargas   <U>ltima carga   <E>scolher a carga   <*R*>etorno`. Delecao: `Escolha o trecho a Deletar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*`; `Escolha a Area a Deletar`; `Escolha o trecho a Modificar`.

Alteracao de valor: `Digite a nova carga *###.##*`; `Carga Ocupacao *###.##*`; `Parcela Acidental *###.##*`.

Demarcacao de area por cantos: `Movimente o cursor ate o PRIMEIRO canto e acione <Enter>  ou  <R>etorna`; `... SEGUNDO canto ...`.

Cursor: `Movimente o cursor ate a Coordenada *###.###,###.###*`; `Passo de movimentacao *###.####*`.

## 4. Entradas do usuario

### 4.1 Tipo, carga e inclinacao

- Numero da laje para alterar o tipo: `Numero da Laje para alteracao do Tipo *RETORNA*`.
- Opcoes de tipo: `Laje  <M>acica  <P>remoldada  <L>aje comum nao calculada`. A mesma linha aparece tres vezes, com o realce em M, em P e em L. O asterisco marca o item realcado em cada tela; nao ha default fixo nas strings [inferido]. Letras: M = macica, P = premoldada, L = laje comum nao calculada [inferido pela palavra].
- Tipo em lote: `Acione  M <Enter>  para considerar todas as lajes Macicas`.
- Cargas por laje: `Acione  T <Enter>  para imposicao de cargas em Todas as Lajes`; `Numero da Laje para alteracao das Cargas *RETORNO*`.
- Campos de carga: `Carga permanente (`; `Peso proprio (`; `(revestimento + enchimento`; `+ PESO)`. A montagem exata dos rotulos pelos fragmentos nao e clara (secao 9). Unidades de comprimento em m e de forca em t [arquivo: LAJE.INI l.17-18].
- Inclinacao do fluxo das cargas: `Inclinacao do fluxo das cargas na laje  (180`. A unidade e o fechamento do parenteses nao aparecem [inferido: grau].
- Alinhamento: `Acione  S <Enter>  Alinha pela face Superior ou  I <Enter>  pela face Inferior`; `Numero da Laje para alteracao do Alinhamento *RETORNA*`; titulo `Alinhamento da Laje`. Valores S ou I; default nao aparece nas strings [lacuna].

### 4.2 Buracos, nivel e denominacao

- `Acione  A <Enter>  para Anular todos os Buracos definidos`; `Numero da Laje para consideracao de Buraco *RETORNA*`. Nenhuma string descreve a geometria do buraco.
- Nivel para numeracao das lajes: `Nivel das Lajes para numeracao *`. Default 0 [arquivo: LAJE.INI l.14].
- Denominacao das lajes: `Denominacao utilizada *`. Default L [arquivo: LAJE.INI l.13].
- Vigas, mesmo padrao: `Nivel das Vigas para numeracao *`; `Denominacao utilizada *`. Defaults 0 e V [arquivo: LAJE.INI l.15-16].

### 4.3 Cargas de ocupacao e arquitetura

Entradas da secao 3.10: `Digite a nova carga *###.##*`; `Carga Ocupacao *###.##*`; `Parcela Acidental *###.##*`. Unidade segue LAJE.INI (t e m) [arquivo: LAJE.INI l.17-18] [inferido].

### 4.4 Vigas

- Montagem por numero: `Numero da primeira Viga *FIM*`; `Numero da segunda Viga *RETORNA*`; `Numero da Viga que sera Separada *FIM*`.
- Separacao: `Separo neste Local  <S>im  <*P*>roximo  <F>im`. Default P.
- Aviso de lajes sem peso proprio: `Existem Lajes a serem calculadas sem peso proprio.  Continuo  N/*S*`. Default S.
- Confirmacao de geracao: `Confirme prosseguir para montagem dos arquivos .VIG e .RLP  N/*S*`. Default S. O aviso de ordem esta em 3.8.

### 4.5 Pilares

- `Numero ou Nome do Pilar`.
- Pilar existente: `...ja existe.  Renumero para Cima e Incluo N/*S*`. O inicio da frase esta perdido. Default S.
- `Renumero os Pilares S/*N*`. Default N.

### 4.6 Obra e impressao

- `Defina o Nome da Obra ou Pavimento para Gravacao-Arquivo`; campos `Obra` e `Descricao do Pavimento /`.
- `Dados Corretos para inicio da Impressao S/*N*`. Default N.

### 4.7 Drive e diretorio de dados

- `Acione  D <Enter>  para alterar Drive e Diretorio`; `Drive que contem o Disco de Dados`; `\Diretorio\Subdiretorio\...\`; `Subdiretorio`.
- Defaults: drive C [arquivo: LAJE.INI l.1]; diretorio `\` [arquivo: LAJE.INI l.2]; parametrizacao SISTRUT [arquivo: LAJE.INI l.3]; diretorio dos .LAP `C:\SISTRUT\EXEC40\` [arquivo: LAJE.INI l.4].

### 4.8 Limites, unidades e coeficientes (LAJE.INI)

Os nomes de arquivo nao aparecem nas strings do LAJEGEOM; a leitura desses valores pelo executavel e [inferida].

- Limites [arquivo: LAJE.INI l.5-12]: 80 lajes arquivadas; 40 eixos de auxilio por direcao; 200 tracos de contorno de arquitetura; 70 cargas lineares; 70 tracos de poligono de carga por area; 200 tracos de estrutura; 100 pilares; 200 vigas.
- Unidades e materiais [arquivo: LAJE.INI l.17-25]: comprimento m (coef. 1); forca t (coef. 1); Fck e Fyk em t/cm2 (coef. 1); Fck 0.15; Fyk 5.0; tipo de aco B.
- Coeficientes de seguranca [arquivo: LAJE.INI l.26-28]: esforcos 1.4; concreto 1.4; aco 1.15.
- Codigos de impressora [arquivo: LAJE.INI l.29-32]: espacamento 1/6 pol (ESC 2); impressao 1/8 pol (ESC 0); picote de 6 linhas (ESC N 6); anula picote (ESC O).

### 4.9 Parametros do SISTRUT.LAP usados no calculo

Detalhados em LAJECALC.md. Referencias [arquivo: SISTRUT.LAP]: cobrimento 1.5 cm (l.32); acrescimo 0.5 cm (l.33); bitolas 4 a 25 mm (l.44-53); altura total 6 a 40 cm (l.77-78); linha neutra 100 % (l.79); flechas 300 e 500 (l.80-81); densidade do concreto 2.50 t/m3 (l.84); espacamento maximo 20 cm (l.158); bitola preferencial por altura (l.194-199).

## 5. Arquivos lidos e gravados

Lidos:
- LAJE.INI e SISTRUT.LAP: nomes nao aparecem nas strings; a leitura pelo programa e [inferida]. O diretorio dos .LAP vem de LAJE.INI l.4 [arquivo].
- Dados da obra (lajes, eixos, arquitetura, cargas, estrutura, pilares, vigas) no drive e diretorio escolhidos na tela. Nomes e extensoes dos arquivos de dados nao aparecem nas strings [lacuna].
- `Nenhum Arquivo Encontrado` indica que a tela procura arquivo de obra [inferido].

Gravados:
- Arquivos .VIG e .RLP pela opcao `<G>eracao .VIG .RLP` e confirmacao. O conteudo nao aparece nas strings.
- Arquivo da obra ou pavimento: o nome e pedido em `Defina o Nome da Obra ou Pavimento para Gravacao-Arquivo`. A extensao do arquivo de dados nao aparece nas strings [lacuna].

Programas e discos:
- Nome `LAJEMONT` com prompt `Coloque o Disco Contendo o modulo LAJEMONT no Drive`. Modulo de montagem (menu 7, parte 2) [inferido].
- Prompt `Coloque o Disco LAJE no Drive`. Prompts de troca de disco sao de instalacao em disquete [inferido]; na instalacao em winchester o LAJE.INI orienta alterar drive e diretorio [arquivo: LAJE.INI l.34-38].

## 6. Calculos

LAJEGEOM nao contem formulas nas strings: nenhuma cita regime de ruptura, charneiras, momentos, flechas, NB-1/78 ou armadura. Esses calculos ficam no LAJECALC [inferido pela ausencia].

Etapas de processamento exibidas, na ordem das strings [inferido quanto a ordem]:
- `Interseccoes...`; `Contornos de Laje...`; `Ordenacao...`.
- Falha no processamento: `erro no processamento` (secao 8).

Totais exibidos:
- Area total das lajes; carga total de peso proprio; carga total de estrutura; total de carga linear; total de carga de area.
- Peso proprio: densidade 2.50 t/m3 do SISTRUT.LAP [arquivo: SISTRUT.LAP l.84]. Se o executavel usa esse valor no peso proprio nao e confirmado [inferido].

## 7. Relatorios e impressao

Cabecalho:
- `OBRA`; `Eixos Horizontais`; `Eixos Verticais`; `Contorno da Arquitetura`.
- `unidades` seguido de caractere de bloco. O valor da unidade nao aparece (secao 9).

Tabela de cargas lineares:
- Cabecalho `Carga Linear   Coordenadas   Comprimento   Carga   Total`; linha modelo; total `total de Carga Linear #####.##`.

Tabela de cargas de area:
- Cabecalho `Carga Area   Area   Carga   Parcela Acidental   Total`; linha modelo; total `total de Carga Area #####.##`.

Estrutura:
- `Tracos de Estrutura`; `Pilares%`.

Tabela de lajes:
- Cabecalho `Laje   Tipo   Area   Cota   Carga   Peso Proprio   Inclinacao>`; linha modelo; linha com tipo `PRE`. O codigo de laje macica nao aparece nas strings [lacuna].

Totais finais, formato `######.##`:
- Area total das lajes; carga total de peso proprio; carga total de estrutura.

Impressao:
- `Ligue a Impressora.`
- `Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario`. Codigos de picote em LAJE.INI l.29-32 [arquivo].

## 8. Mensagens de erro

- `erro no processamento`; `verifique a consistencia dos seus dados`; `Acione <ESC> para Continuar`. O caractere `,` no inicio de cada string e lixo de formato [inferido].
- `Nenhum Arquivo Encontrado`.
- `Modulo nao encontrado em +`. O `+` e provavelmente marcador do nome do modulo [inferido].
- Mensagens de espera, nao erros: `Aguarde ...`; `Aguarde ..`.
- Saida normal, nao erro: `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.
- `ERRREP#` sem contexto; uso nao confirmado (secao 9).

## 9. Lacunas e incertezas

1. Hotkey E aparece no item 1 (Eixos de auxilio) e no item 4 (Estrutura) do menu principal (secao 3.1). Conflito a confirmar na tela.
2. Numeros dos itens de menu 2 a 9 nao aparecem nas strings; o mapeamento para telas e inferido pela ordem [inferido].
3. `ERRREP#`: uso sem contexto.
4. Rotulos de carga permanente e peso proprio: ordem e formato dos fragmentos incertos.
5. `(180` na inclinacao: unidade e fechamento do parenteses ausentes.
6. `unidades`: valor da unidade ausente.
7. Papel dos modulos LAJEGAUX, LAJEPIVI, LAJEOCUP, MIXT e LAJEMONT: nao determinado so pelas strings do LAJEGEOM.
8. Extensoes dos arquivos de dados de obra e de laje: so .VIG e .RLP aparecem.
9. Codigo de laje macica no relatorio: nao aparece (so PRE).
10. Defaults de tipo de laje, alinhamento (S/I) e inclinacao: nao aparecem nas strings.
11. Geometria de buracos: nenhuma string a descreve.
12. Leitura de LAJE.INI e SISTRUT.LAP pelo executavel: inferida, sem nome de arquivo nas strings.
