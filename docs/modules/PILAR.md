# PILAR.EXE - Especificacao funcional

Fontes: strings do executavel original `PILAR.EXE` (fora do repositorio), `sistrut-game/PILAR.INI` (defaults e limites), `sistrut-game/SISTRUT.PIP` (parametrizacao de armadura, buckling e predimensionamento).
Convencoes: `[inferido]` = deducao sem prova direta. Letras destacadas em menus aparecem sem a primeira letra nas strings; a letra deduzida e sempre `[inferido]`.

## 1. Papel do modulo

PILAR.EXE e o modulo de dimensionamento e verificacao de pilares de concreto armado do SISTRUT 4.0. Faz quatro coisas:

1. Cadastra secoes transversais (retangular, circular, poligonal) com suas barras de armadura, e as arquiva em disco (`.COL`/arquivo de secoes, ver secao 5).
2. Processa as secoes arquivadas e calcula os esforcos resistentes e a instabilidade.
3. Verifica um pilar isolado pela NB-1/78 (flexo-compressao, flambagem, esbeltez).
4. Chama PILAREDI (editor de edificio com multiplos andares) apos confirmacao, o que apaga as secoes arquivadas em memoria.

Papel de cada modo no menu: ver secao 3.

## 2. Chamada e retorno

**Chamador.** PILAR.EXE e lancado pelo shell SISTRUT (token `SISTRUT`). A identificacao do modulo e feita pelo arquivo de parametrizacao `PILAR.INI`.

**Retorno ao Gerenciador.** Ao sair, mostra `Retorno ao Modulo Gerenciador`. O shell e o "Gerenciador" nessa frase [inferido].

**Saida do sistema.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. Texto de encerramento total.

**Chamada a PILAREDI.** Ao confirmar o item de verificacao/edificio, o modulo tenta executar `PILAREDI#`. Sequencia de texto:
- `Coloque o Disco contendo o Modulo PILAREDI em` (obsoleta, ver secao 9).
- `Aguarde ..`, depois `PILAREDI#` como comando de execucao.
- Se o arquivo nao for achado: `Modulo PILAREDI nao encontrado em `.
- Se o pai falhar: `erro no processamento` / `verifique a consistencia dos seus dados` / `Acione ESC <Enter> para Continuar`.

**Protocolo VOLTA.** Nenhum token `VOLTA PILAR` aparece nas strings. O retorno de PILAREDI para PILAR, se existir, nao esta nas strings [inferido].

**Modulo ausente.** `Modulo nao encontrado em ` mostrado com o caminho concatenado em tempo de execucao [inferido].

## 3. Telas e menus

### 3.1 Abertura

Tela de identificacao, na ordem das strings:
- `SISTRUT`
- `PILAR.INI` (arquivo de defaults)
- `PILARES DE CONCRETO ARMADO`
- `Abril 1991`. Data conflitante com SISTRUT.PIP (ABRIL 1992), ver secao 10.
- `Versao 4.0`

### 3.2 Menu principal

Itens em ordem das strings (letra deduzida do primeiro caractere ausente):

| # | Texto exato | Letra deduzida |
|---|---|---|
| 1 | `Arquivar Secoes` | A [inferido] |
| 2 | `Processar Calculo das Secoes` | P [inferido] |
| 3 | `Lista das Secoes Arquivadas` | L [inferido] |
| 4 | `Correcoes dos dados` | C [inferido] |
| 5 | (item sem texto nas strings) | ? |
| 6 | `Verificacao de Pilares pela NB1/78` | [6 explicito] |
| 7 | `Visualizar / Alterar Parametrizacoes` | V [inferido] |
| 8 | `Edificios de Multiplos andares` | E [inferido] |
| - | `<F2> = Fim` | F2 |
| - | `escolha opcao` |  |

Observacoes:
- As strings mostram itens numerados 1 a 4 sem o numero (ver lacunas, secao 10). A ordem 1 a 4 e deduzida da ordem nas strings [inferido].
- A numeracao explicita so existe para o item 6. Os itens 7 e 8 foram deduzidos pelo texto (`Visualizar`, `Edificios`) [inferido].
- Conflito de letras: `Visualizar` (V) e `Edificios` (E) nao conflitam com as demais letras. Nao ha conflito conhecido [inferido].
- `<F2> = Fim` indica que a tecla F2 encerra o modulo.

### 3.3 Definicao dos materiais (item de Parametrizacao)

Titulo: `Definicao dos Materiais e unidades de trabalho`. Campos na ordem:
1. `Concreto Fck *`
2. `Unidade de grandeza para os valores caracteristicos do Concreto e Aco`
3. `Multiplicador de (* $ ) para transformar em Tonelada/Centimetro2` [inferido: dentro do mesmo bloco]
4. `Aco      Fyk *`
5. `Tipo de Aco  A/B *`

Defaults e limites: secao 4.

### 3.4 Arquivo de secoes

Titulo: `Arquivo de Secoes para dimensionamento`. Campos:
- `Numero maximo de posicoes -` seguido de `posicionadas` e `Secoes`. Limite de 20 secoes (INI, secao 4).
- `Posicao *`, `( POSICAO`.
- `Aguarde ..`
- Contagem de barras por borda, posicao de barras, geometria (`Diametro=`, `Dinterno=`, `Area =`, `Perimetro =`), `Barras internas a secao =`, `Poligonal come` (inicio de `Poligonal com ... vertices`), `Vertices`, `Bitolas utilizadas`, `Linha Neutra`, `Dados Corretos  N/*S*`.

### 3.5 Subtipos de secao (tela de escolha)

`Escolha o tipo de secao  *FIM*`, com itens:

| # | Texto |
|---|---|
| 1 | `Retangular` |
| 2 | `Circular` |
| 3 | `Poligonal fechada` |
| 4 | `Secao previamente arquivada` |
| 5 | `Leitura de Secao arquivada` |
| 6 | `Gravacao de Secao arquivada` |
| 7 | `Alterar Drive e Diretorio` |

Letras de subtipo nao aparecem; os numeros 1 a 7 sao explicitos nas strings.

### 3.6 Tela de secao retangular

Campos na ordem das strings:
- `( POSICAO` / `Numero da posicao a ser gravada *CANCELA*`
- `B(cm) , H(cm) , c'(cm) *RETORNO*`
- `Numero de barras na borda superior`
- `Numero de barras na borda inferior`
- `Numero de barras nas bordas laterais (por lado) *0*`
- `As barras laterais serao posicionadas internamente as das extremidades.`
- `O valor mostrado entre * fara com que as barras fiquem centradas.`
- `Distancia da borda superior ate a primeira e ate a ultima barra lateral` / `Di,Df (cm)  *`

### 3.7 Tela de secao circular

- `Diametro(cm) , c'(cm) , [ Dinterno(cm) ]  *RETORNO*`
- `Deseja criar Barras igualmente distribuidas ao longo do perimetro N/*S*`
- `Numero de barras no perimetro EXTERNO  *RETORNO*`
- `Numero de barras no perimetro INTERNO  *0*`
- `Deseja acrescentar novas barras na secao S/*N*`
- `Numero TOTAL de Barras na secao`

### 3.8 Tela de coordenadas das barras

- `Barra` / `cm`
- `Coordenadas das Barras - barra` / `X , Y (cm)`
- `Posicao da Barra externa a secao +`
- Codigos de entrada: `A x,y` (acrescentar na ultima coordenada dada), `P ang,comp` (acrescentar em coordenadas polares, ang em graus), `* n` (pular para a barra n)

### 3.9 Tela de secao poligonal

- `Numero de Vertices da poligonal *RETORNO*`
- `Faca a Poligonal no sentido horario, sempre com coordenadas positivas.`
- `entre com as coordenadas da poligonal X,Y ou use os codigos auxiliares:`
- `C Xcentro,Ycentro para criar vertices sobre um Circulo/semi-Circulo`
- `* n para pular para o Vertice n`
- `Coordenadas da Poligonal - Vertice`
- `Numero de Vertices INTERNOS ao Circulo , Angulo (GRAUS)`
- `Faces da Poligonal com mesmo alinhamento` / `Vertice`
- `Distancia do centro da armadura a face da Secao (cm)`
- `Crio uma Barra nos Vertices internos da Poligonal N/*S*`
- `Crio barras nas faces laterais, intermediarias as de canto S/*N*`
- `face ### ente os Vertices (####.##,####.##)  e  (####.##,####.##)`. Mascara de formato de coordenada.
- `c =` / `use Cn para obter a Cada n   exemplo:C20`: barra a cada n cm.
- `Numero de barras *0*`, `Numero TOTAL de Barras na Secao`, `use A x,y para Acrescentar na ultima coordenada dada`, `* n para Pular para a barra n.`

### 3.10 Tela de bitolas

- `Dentre as Bitolas mostradas abaixo, escolha tres (3)` / `escolha uma (1) predominante` / `para utilizacao no calculo de esforcos resistentes da secao .`
- `Bitolas(mm) b1,b2,b3`
- `Bitola (mm)`
- `Outra Bitola (mm) diferente  *NAO*`
- `BITOLA NAO PADRONIZADA     Favor Repetir`
- `Bitolas Utilizadas` / `Bitola Utilizada 5`. O `5` no fim e o default da ordem minima de bitola (SISTRUT.PIP, secao 4).

Lista de bitolas mostrada na tela: vem do INI (secao 4) [inferido].

### 3.11 Tela de inclinacoes da linha neutra

- `Inclinacoes desejadas para Varredura da Linha Neutra`
- `angulo de inclinacao no sentido anti-horario a partir da horizontal`
- `<1> 0   <2> 0 90   <3> 0 90 180   <4> 0 45 90 135 180  <5> Definir`
- `Numero de inclinacoes desejadas (maximo 5) *RETORNO* *`
- `Entre com a inclinacao em Graus (0 a 360)`
- `Definicao impropria da Poligonal.`
- `Face` / `cruzando com face`

### 3.12 Tela de Drive e Diretorio

- `Acione  D <Enter>  para alterar Drive e Diretorio`. Hotkey `D` explicita.
- `Drive que contem o Disco de Dados`
- `\Diretorio\Subdiretorio\...\`
- `Subdiretorio`
- `use  *n  para Pular para barra n   ou   *<Enter> para Terminar`

### 3.13 Lista das secoes arquivadas

- `Lista das Secoes arquivadas`
- Cabecalho: `POS tipo B(cm) H(cm) c'(cm) Sup Inf Lat d1 d2 Diametro Bit da armadura`. A coluna `Bit` aparece sem `Bitolas` completo.
- Linhas de exemplo: `Circular  com ### barras na secao` / `Poligonal com ### Vertices e ### barras na secao`
- `Qualquer Tecla para Continuar`

### 3.14 Correcao de secoes e de parametros

Titulo: `Correcao de Secoes`; subtitulo `CORRECAO`.

- `Numero da posicao a ser alterada *FIM*`
- `Correcao de Parametros`
- `Coeficientes de Seguranca`
- Itens numerados:
  - `(1) Forcas =` (coeficiente de seguranca das forcas, default 1.4, secao 4)
  - `(2) Concreto =` (default 1.4)
  - `(3) Aco =` (default 1.15)
  - Coeficientes de fluencia (texto truncado nas strings)
  - `(5) Mult. de  Nk  para  obter (Ngk + Nqk)  =` (default 0.95, secao 4)
  - `(6) Mult. Fluencia (1.1 a 1.25) =` (default 1.1, secao 4)
  - `(7) Unidade de Forca =` (default `t`)
  - `(8) Coef. multiplicador para transformar em toneladas =` (default 1)
  - `(9) Unidade de Medida =` (default `m`)
  - `(10) Coef. multiplicador para transformar em metros =` (default 1)
  - `item , Novo Valor  *NAO*`

Item (4) nao aparece nas strings. Ver secao 10.

Mapeamento de defaults para os itens 7 a 10: inferido pela ordem das unidades em PILAR.INI (`m`, `t`, `1`, `1`, `t/cm2`, `1`).

Correcao de geometria, circular e poligonal:
- `Secao CIRCULAR       Diametro` / `Dinterno`
- `Secao POLIGONAL` / `Vertices`
- `ordem , Inclinacao em Graus (0 A 360)  *FIM*`
- `Barra , Cood X , Cood y  *FIM*`
- `Vertice , Cood X , Cood y  *FIM*`
- `Deseja gerar as Coordenadas das Barras Novamente  S/*N*`

### 3.15 Verificacao NB1/78 (tela de entrada do pilar)

Titulo: `Verificacao de Pilares segundo a Norma Brasileira - NB1/78`. Campos:
- `Concreto Fck`
- `Aco      Fyk [` / `do Tipo`
- `Secao Retangular`: `H=`, `B`, `c'=`
- `Barras na borda superior=`, `Barras na borda inferior=`, `Barras nas bordas laterais =`, `Posicao da primeira barra =`, `Posicao da  ultima  barra =`
- `Secao Circular` / `Diametro=` / `Dinterno=`
- `Secao Poligonal` / `Numero de vertices%` / `Coordenadas dos Vertices da Poligonal` / `Coordenada das Barras`
- `Bitola ` / `mm`
- Coeficientes e propriedades: `Csf=` / `Csc=` / `Csa=` / `Jx =` / `cm4` / `Jy =` / `Fluencia =` / `Nk=` / `Mxk inicial =` / `Myk inicial =` / `Lxe =` / `Lye =` / `LAMB`
- Pergunta: `Imprimo as verificacoes S/*N*` e `Desenho a Secao comprimida N/*S*`
- Entradas de esforco: `Forca Normal Nk(`, `Momento inicial Mxk(`, `Momento inicial Myk(`, `Compr. flambagem Lxe(m)`, `Compr. flambagem Lye(m)`
- `Dados Corretos  N/*S*`

Situacoes de resultado:
- `Situacao - Flexo Tracao`
- `Situacao - Compressao Centrada`
- `Situacao - Flexo Compressao`
- `Situacao - Flexao Obliqua`

Tela de esforcos do pilar:
- `caso`
- `Mx=` / `My=` / `Mtotal=` / `incl` / `graus`
- `Esforcos resistentes do Pilar`
- `MAX` / `Bfo` (abreviacoes; `Bfo` sem explicacao nas strings)
- `Aguarde ...`

Tela de instabilidade:
- `SITUACAO DE INSTABILIDADE`
- `< M(Atuante)` / `M(Atuante)` / `INSTABILIDADE`
- `My=`, `ln=`, `Xln=`, `1/r=##.##### x 10-35`
- `Def con ##.#### x 10-3        Def aco ##.#### x 10-3`
- `Def con ##.#### /oo     Def aco ##.#### /oo`. Duplicado do anterior em unidade de deformacao por mil.

Resultado de verificacao:
- `ok` / `NAO` / `NAO` / `segue ..`
- `OS ESFORCOS APLICADOS NO PILAR SAO SUPERIORES AOS MAXIMOS ESFORCOS RESISTENTES DA SECAO `
- `Lambda x =` / `Lambda y =` / `RECOMENDA-SE Csf=` / `F critico euler =`
- `ESTE APLICATIVO NAO ACEITA PILARES COM ESBELTEZ MAIOR QUE 200`. Limite fixo de esbeltez 200, sem parametro no INI.

Labels de saida (abreviacoes para impressao):
- `EGA`, `Mini`, `Mflu`, `M1a`, `M2a`. Sao os rotulos de momento inicial, momento de fluencia e momentos de primeira e segunda ordem [inferido].
- `Comprimento flambagem Lxe(m)` / `Lye(m)` / `Csc=` / `Csa=` / `Fluencia=`

### 3.16 Mensagens de disco e diretorio

- `Nenhum Arquivo Encontrado`
- `ERRPIL/`. Nome de arquivo de log de erro ou prefixo de nome [inferido].
- `ATENCAO ! .. Drive e Diretorio nao encontrados`
- `Crio o Diretorio` / `S/*N*` / `Criando Diretorio     Aguarde ...)`
- `ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR`
- `O SEU DISCO DE DADOS ESTA LOTADO`
- `VERIFIQUE O SEU DRIVE`
- `ERRO` / `CORRECAO`

### 3.17 Verificacao (tela de aviso antes de PILAREDI)

- `Verificacao de Pilares segundo a Norma Brasileira - NB1/78` (repetido na tela de entrada)
- `ATENCAO !!!`
- `Todas as secoes arquivadas serao perdidas ao acionarmos o modulo PILAREDI.`. Aviso de perda de dados. Ver secao 4 e secao 8.
- `Corfime seguir  SIM/*N*`. Typo `Corfime` (nas strings; deve ser `Confirme`). Default `N`.

## 4. Entradas do usuario

Defaults vem de `sistrut-game/PILAR.INI` (PI) e `sistrut-game/SISTRUT.PIP` (PP). Quando PI e PP divergem, a divergencia esta na secao 10. Fonte `tela`: campo visto so na tela, sem default em PI ou PP.

| Campo | Prompt exato | Formato | Default | Limite | Fonte |
|---|---|---|---|---|---|
| Concreto Fck | `Concreto Fck *` | numero | 0.15 | - | PI |
| Aco Fyk | `Aco      Fyk *` | numero | 5.0 | - | PI |
| Tipo de aco | `Tipo de Aco  A/B *` | `A` ou `B` | `B` | - | PI |
| Unidade de grandeza do concreto e aco | `Unidade de grandeza para os valores caracteristicos do Concreto e Aco` | texto | `t/cm2` [inferido] | - | PI |
| Multiplicador de unidade | `Multiplicador de (* $ ) para transformar em Tonelada/Centimetro2` | numero | `1` [inferido] | - | PI |
| Numero maximo de secoes | `Numero maximo de posicoes -` | inteiro | 20 | 20 | PI |
| Barras por secao | (campo em Arquivo de secoes) | inteiro | - | 200 | PI |
| Vertices da poligonal | `Numero de Vertices da poligonal` | inteiro | - | 40 | PI |
| Colunas de uma vez | (nao identificado) | inteiro | - | 30 | PI |
| Niveis | (nao identificado) | inteiro | - | 40 | PI |
| Variacoes de armadura | (nao identificado) | inteiro | - | 15 | PI |
| Bitola | `Bitola (mm)` / `Outra Bitola (mm) diferente  *NAO*` | numero, lista de bitolas padronizadas | lista do PI (secao 3.10 e abaixo) | 13 diametros | PI |
| Inclinacoes | `Numero de inclinacoes desejadas (maximo 5) *RETORNO* *` | inteiro | `0`, `90`, ..., por opcao | 5 | PI/PP |
| Inclinacao em graus | `Entre com a inclinacao em Graus (0 a 360)` | 0 a 360 | - | 0 a 360 | tela |
| Cobrimento c' | `B(cm) , H(cm) , c'(cm) *RETORNO*` | cm | 2 cm | - | PP (cobrimento 2) |
| Forca Normal Nk | `Forca Normal Nk(` | t | - | - | tela |
| Momento Mxk inicial | `Momento inicial Mxk(` | t.m | - | - | tela |
| Momento Myk inicial | `Momento inicial Myk(` | t.m | - | - | tela |
| Comprimento Lxe | `Compr. flambagem Lxe(m)` | m | - | - | tela |
| Comprimento Lye | `Compr. flambagem Lye(m)` | m | - | - | tela |
| Dados corretos | `Dados Corretos  N/*S*` | S/N | `S` (marcado com `*`) | - | tela |
| Imprimo verificacoes | `Imprimo as verificacoes S/*N*` | S/N | `N` | - | tela |
| Desenho da secao comprimida | `Desenho a Secao comprimida N/*S*` | S/N | `S` | - | tela |
| Confirma PILAREDI | `Corfime seguir  SIM/*N*` | SIM/N | `N` | - | tela |
| Coeficiente Csf | `(1) Forcas =` | numero | 1.4 | - | PI |
| Coeficiente Csc | `(2) Concreto =` | numero | 1.4 | - | PI |
| Coeficiente Csa | `(3) Aco =` | numero | 1.15 | - | PI |
| Multiplicador Nk | `(5) Mult. de  Nk  para  obter (Ngk + Nqk)  =` | numero | 0.95 | - | PI |
| Fluencia | `(6) Mult. Fluencia (1.1 a 1.25) =` | 1.1 a 1.25 | 1.1 | 1.1 a 1.25 | PI |
| Unidade de forca | `(7) Unidade de Forca =` | texto | `t` | - | PI [inferido] |
| Coef. para toneladas | `(8) Coef. multiplicador para transformar em toneladas =` | numero | 1 | - | PI [inferido] |
| Unidade de medida | `(9) Unidade de Medida =` | texto | `m` | - | PI [inferido] |
| Coef. para metros | `(10) Coef. multiplicador para transformar em metros =` | numero | 1 | - | PI [inferido] |
| Predimensionamento | (campos de predimensionamento, texto nao identificado nas strings) | | Fck 0.6 e 0.75; taxa 1.50%; dimensao minima 14; multiplo 5; peso proprio `S`; concreto 2.50 t/m3; acidental 10%; `N`; `N` | PP |
| Taxa de armadura | (nao identificado nas strings) | % | min 0.8% (calc.), min 0.5% (real), max 6.0% | | PP |

Bitolas padronizadas (PI): 3.2, 4, 5, 6.3, 8, 10, 12.5, 16, 20, 22.2, 25, 32, 40 mm. Areas em cm2 (PI): 0.08, 0.125, 0.2, 0.315, 0.5, 0.8, 1.25, 2, 3.15, 3.88, 5, 8, 12.5. Conflito com PP: ver secao 10.

Ordem minima de bitola: 5 (`Bitola Utilizada 5`, PP `ORDEM MINIMA 5`).

Limites do PI: 20 secoes; 200 barras por secao; 40 vertices de poligonal; 30 colunas por vez; 40 niveis; 15 variacoes de armadura [inferido: campos de limite, o nome exato nas strings nao foi visto].

Esbeltez: limites de lambda 40 / 80 / 140 (PI). Limite fixo de rejeicao: 200.

## 5. Arquivos lidos e gravados

**Lidos.**
- `PILAR.INI`: defaults, limites e unidades (ver secao 4). Caminho: diretorio do EXE [inferido].
- `SISTRUT.PIP` (parametrizacao de armadura): nas strings do PILAR nao aparece o nome `SISTRUT.PIP`. Os valores em `SISTRUT.PIP` (cobrimento, tabela de bitolas, buckling, espacamentos) sao defaults de calculo deste modulo [inferido]. Ver lacunas.
- Arquivos de secoes arquivadas: lidos em `Leitura de Secao arquivada` (item 5 de 3.5) e `Secao previamente arquivada` (item 4). Extensao e nome nao aparecem nas strings.
- `Nenhum Arquivo Encontrado` indica que a leitura de lista nao achou arquivo.

**Gravados.**
- Secoes arquivadas: `Gravacao de Secao arquivada` (item 6 de 3.5) com numero de posicao e `Secoes de Pilares`. Nome e extensao nao aparecem nas strings.
- Log de erro `ERRPIL/` (ver secao 3.16). Nao confirmado como arquivo gravado [inferido].
- Diretorio de dados: criado sob demanda com `Crio o Diretorio` e `Criando Diretorio`.

**Mudanca de unidade e diretorio.** `Alterar Drive e Diretorio` (item 7 de 3.5), e `Acione D <Enter>`.

**Modulo filho.** `PILAREDI#` executado pelo PILAR (ver secao 2).

## 6. Calculos

Este e o modulo de calculo. Os calculos sao feitos sobre a secao (retangular, circular ou poligonal) e as barras, com as cargas da tela de entrada.

### 6.1 Esbeltez e flambagem

- Comprimentos de flambagem `Lxe(m)` e `Lye(m)` (entrada).
- Indice de esbeltez `LAMB` e `Lambda x`, `Lambda y`.
- Limites: lambda 40 (ausencia de efeito de 2a ordem, inferido), 80, 140 (PI). A esbeltez maior que 200 e recusada.
- Coeficiente de flambagem por vinculo: matriz ENGASTE / SEMI-ENGASTE / CONTINUIDADE / LIVRE (PP): ENGASTE 0.50, 0.70, 0.70, 2.00; SEMI-ENGASTE 0.70, 0.90, 0.85, 2.00; CONTINUIDADE 0.70, 0.85, 1.00, 2.00; LIVRE 2.00, 2.00, 2.00, NAO. As strings de PILAR nao trazem os nomes desses vinculos; os valores vem do PP [inferido].
- Carga critica de Euler: `F critico euler =`.

### 6.2 Excentricidades

- Excentricidade acidental minima: 2 cm ou H/30 (PI, minimo acidental). [inferido: as strings trazem `Mini` e `M1a`, `M2a`].
- Momentos iniciais `Mxk inicial`, `Myk inicial` (entrada).
- Momentos de primeira e segunda ordem: `M1a`, `M2a`. Calculo nao descrito nas strings [inferido].
- Momento de fluencia `Mflu`; fator de fluencia 1.1 (PI).

### 6.3 Flexo-compressao (NB-1/78)

- Situacoes: flexo-tracao, compressao centrada, flexo-compressao, flexao obliqua.
- Resultado: `Esforcos resistentes do Pilar` com `MAX` e `Bfo`.
- Comparacao: `OS ESFORCOS APLICADOS NO PILAR SAO SUPERIORES AOS MAXIMOS ESFORCOS RESISTENTES DA SECAO` -> resultado negativo.
- Verificacao de instabilidade: `SITUACAO DE INSTABILIDADE` com `M(Atuante)` e `< M(Atuante)` e `INSTABILIDADE`.
- Recomendacao de Csf: `RECOMENDA-SE Csf=` (quando instavel).
- Coeficientes de seguranca: forcas 1.4, concreto 1.4, aco 1.15 (PI, ver secao 4).

### 6.4 Deformacoes

- `1/r=##.##### x 10-35` (curvatura, unidade com erro de grafia nas strings: `10-35` provavelmente e `10-3`).
- `Def con ##.#### x 10-3` e `Def aco ##.#### x 10-3`: deformacao do concreto e do aco, em milesimos.
- `Def con ##.#### /oo` e `Def aco ##.#### /oo`: mesma grandeza em permil.
- `ln=` / `Xln=`: linha neutra.

### 6.5 Armadura

- Bitolas: escolha de 3 bitolas e de 1 predominante (3.10).
- Taxa minima e maxima: 0.8% (calculada), 0.5% (real), 6.0% (max) (PP). [inferido: as strings nao mostram o texto da taxa].
- Espacamento: min / max por bitola (PP, tabela de 3.2 mm a 40 mm). [inferido: as strings nao trazem o texto].
- Estribos: nao calculados neste modulo; PP traz tabela de estribos (PP, secao de estribos). Ver `docs/modules/ARMADURA.md` se existir [inferido].

### 6.6 Coeficiente de seguranca e fator de fluencia

- Csf (forcas), Csc (concreto), Csa (aco): `Csf=`, `Csc=`, `Csa=`, valores em PI.
- Fluencia `Fluencia =` com 1.1 a 1.25 (PI).

### 6.7 Predimensionamento

PP traz valores de predimensionamento (fck 0.6 e 0.75, taxa 1.50%, dimensao minima 14 cm, multiplo 5 cm, peso proprio, concreto 2.50 t/m3, acidental 10%). As strings de PILAR nao trazem textos de predimensionamento. Uso no modulo nao confirmado [inferido].

### 6.8 Inclinacoes da linha neutra

Varredura de linhas neutras nos angulos informados (0 a 360 graus, ate 5 inclinacoes). Resultado para cada inclinacao, sem texto de calculo nas strings.

## 7. Relatorios e impressao

Impressao e opcional e confirmada por `Imprimo as verificacoes S/*N*` (default N) e `Imprimo os resultados S/*N*`.

Cabecalhos de impressao, na ordem das strings:
- `graus`
- `Diametro`
- `Poligonal`
- `Fck - ####.### \   \`
- `Fyk - ####.### \   \`
- `ACO do tipo \\`
- `Vertices da Poligonal`
- `Barras na secao`
- `Coordenadas dos Vertices da Poligonal`
- `Coordenadas das Barras`

Mascaras (`\   \`, `####.###`) sao campos de formato de impressao (PRINT USING) [inferido].

Impressora: `Ajuste a Impressora` nao aparece nas strings deste modulo. Os codigos de escape da impressora estao em PILAR.INI: `CHR$(27)+CHR$(50)`, `CHR$(27)+CHR$(48)`, `CHR$(27)+CHR$(78)+CHR$(6)`, `CHR$(27)+CHR$(79)` (PI). Uso exato nao confirmado nas strings [inferido].

## 8. Mensagens de erro

| Texto exato | Observacao |
|---|---|
| `ATENCAO !!!` / `Todas as secoes arquivadas serao perdidas ao acionarmos o modulo PILAREDI.` | aviso antes de chamar PILAREDI (ver secao 4) |
| `BITOLA NAO PADRONIZADA     Favor Repetir` | bitola fora da lista |
| `Definicao impropria da Poligonal.` | poligonal invalida |
| `Face cruzando com face` | auto-interseccao |
| `ATENCAO ! .. Drive e Diretorio nao encontrados` | drive/diretorio inexistente |
| `ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR` | arquivo ausente |
| `O SEU DISCO DE DADOS ESTA LOTADO` | disco cheio |
| `VERIFIQUE O SEU DRIVE` | falha de drive |
| `ERRO` / `CORRECAO` | rotulos de tela de correcao |
| `ESTE APLICATIVO NAO ACEITA PILARES COM ESBELTEZ MAIOR QUE 200` | limite de esbeltez |
| `OS ESFORCOS APLICADOS NO PILAR SAO SUPERIORES AOS MAXIMOS ESFORCOS RESISTENTES DA SECAO` | resultado de instabilidade |
| `Nenhum Arquivo Encontrado` | lista vazia |
| `Modulo PILAREDI nao encontrado em ` | filho ausente |
| `erro no processamento` / `verifique a consistencia dos seus dados` / `Acione ESC <Enter> para Continuar` | erro ao chamar PILAREDI |
| `Modulo nao encontrado em ` | modulo ausente no inicio |

Erros de runtime do BRUN45 nao sao regras de negocio e ficam fora desta spec (ver PIPROEDI.md, secao 7).

## 9. Obsolescencia

- `Coloque o Disco contendo o Modulo PILAREDI em`: troca de disquete. No sistema reconstruido, o caminho vem do diretorio de dados [inferido, mesmo padrao de PIPROEDI.md secao 8].
- `Aguarde ..` junto com a troca de disco: sem funcao propria.
- `Acione <Enter>` para troca de disco: nao aparece aqui.
- `Acione  D <Enter>  para alterar Drive e Diretorio`: troca de drive e diretorio. Em sistema novo, o diretorio de dados vem de configuracao; a tela pode ser mantida como "Alterar diretorio de dados" [inferido].
- `ATENCAO !!! ... PILAREDI` com `Corfime seguir SIM/*N*`: aviso de perda de dados. Nao e obsoleto, mas precisa ser mantido (secao 3.17).

## 10. Lacunas e incertezas

1. **Conflito de data.** PILAR diz `Abril 1991`; SISTRUT.PIP diz `VERSAO 4.0 ABRIL 1992`, `DATA 30 ABRIL 1992`. Nao se sabe qual data vale. Registrar as duas [inferido].
2. **Conflito de area de barra.** PILAR.INI traz areas 0.08 e 0.125 cm2 para as bitolas 3.2 e 4 mm. SISTRUT.PIP traz 0.00 e 0.00 para ORDEM 0 e 1. Uma das duas tabelas esta errada ou a ordem 0 e 1 nao e usada [inferido].
3. **Menu com numeros faltantes.** Itens 1 a 5 do menu principal nao tem numero nas strings; o item 5 nao tem texto.
4. **Letras do menu.** A letra `E` de `Edificios` e a letra `V` de `Visualizar` sao deduzidas. Conflito possivel com o item 6 numerado (nao conflita pelas letras, mas a ordem nao esta provada).
5. **Typo `Corfime`.** Texto nas strings e `Corfime seguir SIM/*N*`. Pode ser texto original; reproduzir como esta ou corrigir na reescrita, sem mudar o sentido [inferido].
6. **Item (4) em Correcao de Parametros.** A numeracao (1), (2), (3), (5) pula o (4). Texto nao encontrado nas strings.
7. **Item (3) em Posicao/Circular.** A numeracao (1), (2), (4) pula o (3). Mesma situacao.
8. **Predimensionamento e taxa.** Os textos de predimensionamento e de taxa de armadura do PP nao aparecem nas strings do PILAR. Nao e possivel confirmar onde sao usados [inferido].
9. **SISTRUT.PIP.** O nome do arquivo nao aparece nas strings do PILAR. O uso dos valores do PP por este modulo precisa ser confirmado no codigo [inferido].
10. **ERRPIL/.** Nome de arquivo ou prefixo, sem contexto [inferido].
11. **Bfo.** Abreviacao sem explicacao nas strings.
12. **Expoente em 1/r.** `10-35` e provavelmente erro de digitacao das strings. Mesma ocorrencia em outras linhas usa `10-3`.
13. **Mapeamento de unidades.** Os itens 7 a 10 de correcao sao mapeados para os valores de PI por ordem [inferido].
14. **Nome do arquivo de secoes.** Extensao e nome nao aparecem nas strings de PILAR. Ver PIGRAEDI.md para o formato `.COL` de colunas [inferido, nao confirmado para secoes].
15. **Protocolo de retorno de PILAREDI.** Nao ha `VOLTA PILAR` nas strings. Nao se sabe como PILAREDI devolve o controle [inferido].
16. **Tela de instabilidade.** O campo `< M(Atuante)` e `M(Atuante)` sao dois rotulos; a diferenca nao esta clara [inferido].
17. **Entradas da tela NB1/78.** A unidade de Nk, Mxk, Myk (t e t.m) foi deduzida do PI [inferido].
18. **Dados Corretos.** O default `S` e marcado com `*` nas strings; o comportamento se o usuario responder `N` nao esta nas strings.
19. **Limites do PI.** Os nomes de limite (30 colunas, 40 niveis, 15 variacoes) nao tem texto nas strings de PILAR [inferido].
