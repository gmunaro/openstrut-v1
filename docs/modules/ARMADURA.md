# ARMADURA.EXE - Especificacao funcional

Fontes: strings do executavel original `ARMADURA.EXE` do SISTRUT 4.0 (MS-DOS, QuickBASIC 4.5; fora do repositorio). Parametros padrao em `sistrut-game/ARMADURA.INI`.

Convencoes: `[ini: ARMADURA.INI linha N]` aponta para o arquivo de parametros; `[inferido]` marca o que nao esta explicito nas strings do executavel. Texto entre aspas e literal das strings; letras perdidas nas strings (hotkeys destacadas, bytes de caixa do QuickBASIC) aparecem como lacuna ou com a forma completa indicada entre colchetes.

Strings de runtime BRUN45 e lixo binario sem texto nao sao especificados.

## 1. Papel do modulo

ARMADURA.EXE dimensiona a armadura de secoes de concreto armado submetidas a flexao simples (titulo: "ARMADURA PARA VIGAS DE CONCRETO SUBMETIDA A FLEXAO SIMPLES"). O dimensionamento trata secoes de vigas: o submenu de esforcos traz o fragmento "ecao da Viga" e a tela de dimensionamento pede momento fletor, forca cortante e momento torsor [inferido: o escopo se limita a vigas].

Fluxo geral: o usuario define materiais (Fck, Fyk, tipo de aco), arquiva secoes (tipo e dimensoes), processa secoes arquivadas ou dimensiona uma secao avulsa, e corrige ou lista as secoes guardadas. Os resultados sao As longitudinal, As de pele, estribos por metro, verificacao de cisalhamento e numero de ramos.

Identificacao na tela de abertura: "Abril 1991" e "Versao 4.0", alem de linhas de credito do original (omitidas).

## 2. Chamada e retorno

- Iniciado pelo gerenciador SISTRUT [inferido]. O nome do gerenciador aparece como `SISTRUTM`. A mensagem "Modulo nao encontrado em =" indica falha ao localizar um modulo; as strings nao dizem qual programa a emite [inferido].
- Caminho de execucao: lookup de `COMSPEC`, caminho `:\SISTRUT\EXEC40\` e `PATH=.\`. Os tres sao do ambiente de execucao; a regra exata de busca nao esta nas strings [inferido].
- Na inicializacao aparece "Aguarde ...".
- Saida pelo menu principal com `<F2> = Fim`. A saida mostra "Termino da Utilizacao do Sistema SISTRUT   Obrigado .." e, ao voltar ao gerenciador, "Retorno ao Modulo Gerenciador".
- Retorno interno: os prompts de entrada mostram `*RETORNO*` e a opcao "*Retorno*" no tipo de secao. A opcao "5 - *Retorno ao Menu Principal*" do dimensionamento fica na secao 3.6.

## 3. Telas e menus

### 3.1 Tela inicial (menu principal)

Titulo, versao e creditos na tela de abertura. Menu com seis opcoes, mais saida:

| Texto na tela | Tela |
|---|---|
| "Definicao dos Materiais e unidades de trabalho" (fragmento "ateriais, Concreto Aco") | 3.2 |
| "[A]rquivar Secoes" (letra A perdida) | 3.3 |
| "[P]rocessar Calculo das Secoes" (letra P perdida) | 3.4 |
| "4 - Calculo de ... ma Secao" e "...imensionamento" (texto fragmentado) | 3.6 [inferido] |
| "Correcoes dos dados" | 3.5 |
| "Visualizar / Alterar Parametrizacoes" | 3.7 |
| "Lista das Secoes Arquivadas" (letra L perdida) | 3.8 |
| "<F2> = Fim" | 2 |
| "escolha opcao" | - |

Numeros dos itens: so o item 4 aparece com numero nas strings. Os demais (1, 2, 3, 5, 6) estao [inferido] pela ordem do texto.

### 3.2 Materiais e unidades (dados de entrada)

Tela "Definicao dos Materiais e unidades de trabalho". Campos:

- "Concreto Fck *". Padrao 0.15 t/cm2 [ini: ARMADURA.INI linha 9].
- "Aco      Fyk *". Padrao 5.0 t/cm2 [ini: ARMADURA.INI linha 10].
- "Tipo de Aco  A/B *". Padrao B [ini: ARMADURA.INI linha 11].
- "Unidade de grandeza para os valores caracteristicos do Concreto e Aco". Padrao t/cm2 [ini: linha 7].
- "Multiplicador de (*" + ") para transformar em Tonelada/Centimetro2". Padrao 1 [ini: linha 8].

### 3.3 Arquivamento de secao (opcao 1)

Tela "Arquivo de Secoes para dimensionamento" com "numero maximo de posicoes - posicionadas". Cabecalho "Secoes" [inferido: titulo da lista de secoes]. Nao ha nas strings o valor maximo [lacuna, secao 9]. Campos:

- "Posicao *" e "( POSICAO".
- Tipo de secao, menu numerado de 1 a 5:
  1. Secao Retangular - Te (fragmento "etangular Te")
  2. Secao Triangular (fragmento "riangular")
  3. Secao Triangular Invertida
  4. Secao Trapezoidal
  5. Secao Circular
  Fim da lista: "*Fim*". Escolha: "Escolha o tipo de secao".
- Dimensoes por tipo, cada uma com `*RETORNO*`:
  - Retangular: "B(cm) , H(cm) , d(cm)".
  - Triangular, trapezoidal: "Binf(cm) , Bsup(cm) , H(cm) , d(cm)"; rotulos "Binf=", "Bsup=".
  - Circular: "Diametro(cm) , d(cm)"; rotulo "Diametro=".
  - Sinal negativo: "use sinal negativo (-) para ser considerada somente a secao retangular". Esse texto e o unico sobre a secao "Te" (mesa de compressao); o significado exato nao esta nas strings [inferido].
- Bitolas para flexao: "Dentre as Bitolas mostradas abaixo, escolha tres (3) para utilizacao no calculo de esforcos de Flexao ."; campo "Bitolas(mm) *"; titulo "Bitolas utilizadas na Flexao".
- Bitolas para cisalhamento: "para utilizacao no calculo de esforcos de Cisalhamento."; titulo "Bitolas utilizadas no Cisalhamento".
- Validacao de bitola: "BITOLA NAO PADRONIZADA", "FAVOR REPETIR". A tabela de bitolas e lida do INI [ini: ARMADURA.INI linhas 13 e 15]: 13 diametros em mm e 13 areas em cm2 (ex.: 3.2 mm = 0.08 cm2; 40 mm = 12.5 cm2).
- Confirmacao: "Dados Corretos  N/*S*".

### 3.4 Processamento de secoes arquivadas (opcao 2)

Titulo "Processamento de Secoes Arquivadas". Campos e confirmacoes:

- "4 Secoes -" e "posicionadas>": quantidade de secoes que serao processadas [inferido].
- "Calcular posicoes I/J/N a M/.../K *RETORNO*": faixa de posicoes a calcular.
- "Imprimo os resultados S/*N*".
- "Dados Corretos N/*S*".
- Erros de processamento: "erro no processamento", "verifique a consistencia dos seus dados". Saida: "Acione ESC <Enter> para Continuar"; "Qualquer Tecla para Continuar".
- Resultado por secao: ver secao 7.

### 3.5 Correcao de dados (opcao 3)

Tela "Correcao de Secoes" e "Processamento de uma Secao":

- "Correcao de Secoes" com "posicionada(s)" e "Secao(oes)(".
- "Numero da posicao a ser alterada *FIM*"; "( Posicao".
- Campos por tipo de secao, com a mesma nomenclatura da 3.3 e numeros de campo: "(1) Binf =", "(4) Bsup =", "(1) Diametro =". Ha tambem itens numerados (7), (8), (10) e (11); as strings nao dizem quais campos sao, entao a leitura como campos de bitola e [inferido].
- Bitolas repetidas, com os mesmos titulos da 3.3.
- Escolha do item a alterar: "item , Novo Valor  *NAO*". Entra o numero do item e o novo valor; "*NAO*" marca a opcao de nao confirmar [inferido].
- Aço do dimensionamento: "Aco Fyk *".

### 3.6 Dimensionamento de secao avulsa (opcao 4)

Titulo "Dimensionamento de Secoes".

- Submenu de esforcos:
  - "1 - Secao da Viga" (numero perdido; texto "ecao da Viga") [inferido].
  - "2 - Momento Fletor" (fragmento "letor").
  - "3 - Forca Cortante" (fragmento "ortante").
  - "4 - Momento Torsor" (fragmento "orcor"; palavra com letra perdida, provavelmente "Torcor") [inferido].
  - "5 - *Retorno ao Menu Principal*". Escolha: "escolha opcao".
- Tela "(Secao para Dimensionamento)" com "Concreto Fck *", "Aco      Fyk *", "Tipo de Aco  A/B *".
- Tipo de secao: lista 1 a 5 igual a 3.3; "*Retorno*"; "Escolha o tipo de secao".
- Dimensoes: "B(cm) , H(cm) , d(cm) *RETORNO*"; "Binf(cm) , Bsup(cm) , H(cm) , d(cm) *RETORNO*"; "Diametro(cm) , d(cm) *RETORNO*"; sinal negativo.
- Tela de resultados, com "Qualquer Tecla para Continuar". Resultado na secao 7.

### 3.7 Parametrizacao (opcao 5)

Titulo "Correcao de Parametros". Os itens 3 a 9 tem numero entre parenteses nas strings; os itens 1 e 2 estao sem numero e a numeracao e [inferido] pela sequencia:

- (1) "Limite da posicao da Linha Neutra". Padrao 0.53 [ini: ARMADURA.INI linha 16].
- (2) "Taxa de Armadura Longitudinal". Padrao 0.0015 [ini: linha 17]. O rotulo do INI mistura taxa de armadura e "TENSAO CORRECAO CISALHAMENTO" [ini: linha 17]; ver secao 9.
- "Coeficientes de Seguranca":
  - (3) "Forcas ="; padrao 1.4 [ini: linha 18].
  - (4) "Concreto ="; padrao 1.4 [ini: linha 19].
  - (5) "Aco ="; padrao 1.15 [ini: linha 20].
- "Unidades de trabalho dos esforcos solicitantes":
  - (6) "Unidade de Forca = "; padrao t [ini: linha 4]. O valor de exibicao nas strings e "8"; nao esta claro se e o campo ou o caractere de uma opcao [inferido].
  - (7) "Coef. multiplicador para transformar em toneladas ="; padrao 1 [ini: linha 6].
  - (8) "Unidade de Medida = "; padrao m [ini: linha 3].
  - (9) "Coef. multiplicador para transformar em metros ="; padrao 1 [ini: linha 5].
- Trocar item: "item , Novo Valor  *NAO*", mesmo texto da 3.5.

Os parametros de Fck, Fyk e tipo de aco nao estao nesta tela; estao na 3.2.

### 3.8 Lista das secoes arquivadas (opcao 6)

Titulo "Lista das Secoes arquivadasN" (letra final "N" [inferido]: lixo ou sinal de tecla). Colunas: "POS", "tipo", "B", "H", "Diam", "d", "Bsup/Bf", "Hf", "Bit Flexao", "Bit Cisalham". Linhas de dados em formato fixo. Fim com "Qualquer Tecla para Continuar".

## 4. Entradas do usuario

Campos digitados, na ordem em que aparecem nas telas:

- Materiais (3.2): Fck, Fyk e tipo de aco A/B. Unidade de grandeza e multiplicador para T/C2.
- Numero da posicao da secao, com "Posicao *" e limite "numero maximo de posicoes". O valor maximo nao esta nas strings.
- Tipo de secao, escolha de 1 a 5.
- Dimensoes, conforme o tipo: B, H, d; Binf, Bsup, H, d; Diametro, d. Cada uma aceita `*RETORNO*`.
- Sinal negativo em uma dimensao: "use sinal negativo (-) para ser considerada somente a secao retangular". O efeito exato sobre a secao Te nao esta nas strings [inferido].
- Bitolas para flexao: escolha de tres bitolas, campo "Bitolas(mm) *". A escolha de bitolas para cisalhamento tem titulo proprio e o numero de bitolas nao esta nas strings [lacuna].
- Confirmacao de dados: "Dados Corretos N/*S*". O asterisco parece marcar a opcao padrao [inferido].
- Processamento de secoes arquivadas: faixa de posicoes "Calcular posicoes I/J/N a M/.../K *RETORNO*" e "Imprimo os resultados S/*N*".
- Correcao: "Numero da posicao a ser alterada *FIM*"; depois "item , Novo Valor *NAO*".
- Parametros (3.7): valores de limite de linha neutra, taxa, coeficientes de seguranca e unidades.
- Dimensionamento avulso (3.6): escolha do esforco solicitante (1 a 5); Fck, Fyk e tipo de aco; tipo e dimensoes da secao.
- Campos de valor dos esforcos (momento, cortante, torsor): as strings trazem os titulos "(Secao para Dimensionamento)" e os menus, mas nao rotulos de campo para os valores de Mk, Vk e Tk [lacuna].
- Teclas: "<F2> = Fim"; "Qualquer Tecla para Continuar"; "Acione ESC <Enter> para Continuar".

## 5. Arquivos lidos e gravados

Lidos:

- `ARMADURA.INI`, lido na inicializacao. Contem drive e diretorio de dados (linhas 1 e 2), unidades (3 a 8), materiais (9 a 11), bitolas (12 a 15), limites e coeficientes (16 a 22) e codigos de impressora (23 a 26) [ini: sistrut-game/ARMADURA.INI]. Linhas 28 a 32 sao aviso de winchester.
- Variavel de ambiente `COMSPEC`.
- Caminho `:\SISTRUT\EXEC40\` e `PATH=.\`. Uso exato nao esta nas strings [inferido].

Gravados:

- Secoes arquivadas, pela opcao "Arquivar Secoes" e a tela "Arquivo de Secoes para dimensionamento". O nome do arquivo nao aparece nas strings [lacuna]. A gravacao em disco e [inferido] pelo nome da opcao.
- Nao ha texto de confirmacao de gravacao nas strings [lacuna].

Outros nomes de arquivo ou dispositivo no binario:

- `ARMADAUX`, sem contexto [incerto].
- `CDEF`, sem contexto [incerto].
- Dispositivos `LPT1:` e `COM1:`. Provavelmente destinos de impressao [inferido].

## 6. Calculos

As formulas nao estao nas strings. Esta secao lista os parametros, as grandezas de saida e o que cada rotulo indica. Todas as interpretacoes sao [inferido].

Parametros lidos do INI:

- Limite da linha neutra, 0.53, a partir do qual considera armadura dupla [ini: linha 16].
- Taxa de armadura longitudinal tracionada, 0.0015 [ini: linha 17]. O rotulo do INI cita tambem "TENSAO CORRECAO CISALHAMENTO", que nao se explica [lacuna].
- Coeficientes de seguranca: esforcos 1.4, concreto 1.4, aco 1.15 [ini: linhas 18 a 20].
- Limites de largura da peca: 40 para estribo duplo (4 ramos) e 60 para estribo triplo (6 ramos) [ini: linhas 21 e 22]. O INI descreve a grandeza como "LARGURA DA PECA"; a unidade nao esta escrita [inferido: cm].

Grandezas de saida (templates das telas de resultado do processamento e do dimensionamento avulso):

- Armadura longitudinal tracionada: Ast, em cm2, com x/d.
- Armadura longitudinal comprimida: Asc, em cm2. Armadura de correcao Asl.
- Posicao da linha neutra: x/d e o limite "x/d(3-4)". O limite x/d(3-4) e [inferido] o limite de dominio 3 a 4.
- Cobrimento: "cobrimento + fi/2 (cm)", com o rotulo "dc+##fi" nos templates. dc e o cobrimento mais metade do diametro [inferido].
- Armadura de pele: "As(pele)=####.# cm2 por face". A regra de calculo nao esta nas strings [lacuna].
- Armadura transversal: "Ase=###.## cm2/m".
- Tensoes de cisalhamento em k/cm2: Twd, Twu, Ttd, Tk(lim) e Tk. Os significados de Twd, Twu, Ttd e Tk(lim) estao [inferido].
- Numero de ramos do estribo: "# Ramos". A escolha entre 2, 4 e 6 ramos e feita pelos limites de largura [ini: linhas 21 e 22] [inferido].
- Cortante: "VK (min) =" e "VK (max) =", com rotulos de faixa [inferido].
- Momento limite por tipo de secao: "Mk(ret)" (retangular), "Mk(fla)" (flange, Te) [inferido], "Mk(tpz)" (trapezoidal) [inferido], "Mk(cir)" (circular) [inferido]. A secao triangular nao tem rotulo Mk nas strings [lacuna].
- Momento e cortante de entrada nos templates: "momentos(Mk) em" e "cortantes(Vk) em". A unidade de Mk e Vk esta cortada nas strings [lacuna].

Coeficientes aplicados, mostrados na tela de resultado: "coeficientes de seguranca forcas", "concreto" e "aco".

Caminho de calculo do processamento de secoes arquivadas e do dimensionamento avulso: nao esta nas strings [lacuna].

## 7. Relatorios e impressao

- Pergunta antes do processamento: "Imprimo os resultados S/*N*". O asterisco parece marcar o padrao N [inferido].
- Modelo de resultado por secao, tela de processamento (3.4): rotulos de dimensoes por tipo de secao, "Diam.", "B=", "H=", "d=", "Bf=", "Hf=", "Binf=", "Bsup=", "Diametro=".
- Modelo de armadura e cisalhamento no mesmo relatorio: "Fyk="; "momentos(Mk) em"; "dc+##fi"; "As(pele)"; linha de valores de bitolas; "cortantes(Vk) em"; "# Ramos"; "Twu="; coeficientes de seguranca ("COEFICIENTES DE SEGURANCA", "Forca", "Concreto", "Aco").
- Modelo de dimensionamento avulso: os mesmos tipos de secao com rotulos "B=", "Bf=", "Binf=", "Bsup=", "Diametro="; resultados ja listados na secao 6.
- Lista de secoes arquivadas (3.8): cabecalho "POS tipo B H Diam d Bsup/Bf Hf Bit Flexao Bit Cisalham" e linhas-modelo.
- Codigos de controle de impressora em `ARMADURA.INI`, linhas 23 a 26 [ini: sistrut-game/ARMADURA.INI]. Destinos citados no binario: `LPT1:` e `COM1:` [inferido].
- Adaptadores de video citados: "XOR", "HER", "EGA", "VGA". Uso provavel: deteccao ou escolha de placa grafica [inferido].
- Titulo de cabecalho do relatorio impresso, numero de pagina e formato de linha de impressao nao aparecem nas strings [lacuna].

## 8. Mensagens de erro

Textos de erro e aviso visiveis ao usuario:

- "Modulo nao encontrado em =". O caminho que segue o sinal de igual nao aparece nas strings [lacuna]. A condicao e [inferida]: o modulo chamado nao esta no diretorio esperado.
- "BITOLA NAO PADRONIZADA", seguida de "FAVOR REPETIR". Validacao da bitola digitada na escolha de bitolas (3.3, campo de bitolas). [inferido].
- "erro no processamento" e "verifique a consistencia dos seus dados", com "Acione ESC <Enter> para Continuar". Aparecem no processamento de secoes arquivadas (3.4). A condicao exata nao esta nas strings [lacuna].

Mensagens de status e saida, que nao sao erro:

- "Aguarde ...".
- "Retorno ao Modulo Gerenciador".
- "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".

Mensagens do runtime `BRUN45.EXE` estao fora da especificacao.

## 9. Lacunas e incertezas

1. Formulas de Ast, Asc, Asl, Ase, Twd, Twu, Ttd, Tk e Tk(lim) nao estao nas strings. Os valores de saida sao descritos pelos templates, mas o calculo nao. [lacuna]
2. Ordem dos itens do menu principal: os itens 1 a 6 estao em strings separadas, e o item 4 aparece fragmentado ("4 - Calculo de ... ma Secao"). Ver 3.1. [inferido]
3. Unidades de Mk e Vk, e campos de entrada de esforcos, nao aparecem nas strings [lacuna]. Ver secao 4 e secao 6.
4. Rotulos ambiguos do `ARMADURA.INI`: linha 17 mistura "TAXA DE ARMADURA" com "TENSAO CORRECAO CISALHAMENTO"; a unidade da largura da peca (linhas 21 e 22) nao esta escrita [inferido: cm].
5. Nome do arquivo de secoes arquivadas e formato de gravacao em disco [lacuna]. Ver secao 5.
6. Significado de "x/d(3-4)" [inferido: limite de dominio]. Secao triangular sem rotulo Mk nas strings [lacuna].
7. Datas: "Abril 1991" e "Versao 4.0", sem data de versao separada. O VIGA traz data divergente ("Abril 1991" na abertura e "Versao 4.0    Abril 1990" no cabecalho dos relatorios). Registrar a divergencia; nao resolvida.
8. Strings sem contexto: `ARMADAUX`, `CDEF`, `SISTRUTM`. [incerto]
9. Padrao de "Dados Corretos" e de "Imprimo os resultados" (asterisco) [inferido].
10. Linhas de credito do original registradas no binario, sem funcao no programa (omitidas).
