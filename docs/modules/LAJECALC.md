# LAJECALC.EXE - Especificacao funcional

Fontes: strings do executavel original `LAJECALC.EXE` (fora do repositorio), `sistrut-game/LAJE.INI` e `sistrut-game/SISTRUT.LAP`.
Convencoes: `[arquivo: NOME linha N]` = valor lido de arquivo de configuracao do repo (`sistrut-game/`). `[inferido]` = deducao sem prova direta.
Nos textos abaixo, a letra destacada que se perdeu nas strings extraidas aparece como `!`. Bytes de caixa e de comprimento do QuickBASIC foram omitidos. Texto entre crases e o texto exato das strings do executavel, sem correcao ortografica.

## 1. Papel

- Modulo de calculo e detalhamento de paineis de lajes de um edificio, do SISTRUT 4.0. Titulo do menu: `Calculo e Detalhamento de Painel / Lajes de um Edificio`.
- Oferece sete tarefas e um retorno no menu principal (secao 3.1): continuidade e engastes, direcao principal da armadura, espessuras minimas, imposicao de espessuras, momentos e armadura necessaria, otimizacao dos negativos e visualizacao/alteracao de parametros.
- Metodo: o cabecalho do arquivo de parametros cita `CALCULO E DETALHAMENTO DE LAJES EM REGIME DE RUPTURA` [arquivo: SISTRUT.LAP linha 5]. O termo nao aparece nas strings do LAJECALC; a aplicacao ao LAJECALC e [inferido].
- Etapa de calculo do sistema: recebe o painel montado pela etapa de geometria (LAJEGEOM, ver `docs/modules/LAJEGEOM.md`) [inferido]; as strings nao mostram essa entrada.

## 2. Chamada e retorno

- Quem chama o LAJECALC nao aparece nas strings. Nomes de outros modulos presentes no executavel: `bmLAJECALC`, `bmLAJECHAR`, `bmLAGEOCAL`, `bmLAMONTLB`, `bmLACALCU`, `bmMIXT`. Funcao desses modulos: [inferido] pelo nome, nao confirmado. `bmLAJECALC` e o nome do proprio programa; `bmLACALCU` difere e nao esta explicado.
- Retorno ao gerenciador: `Retorno ao Modulo Basico de LAJE`, `VOLTA LAJECALC`, `LAJE`. Protocolo: [inferido] o LAJECALC grava a instrucao `VOLTA LAJECALC` e o gerenciador `LAJE` e o alvo do retorno, mesmo padrao do `VOLTA LAJEGEOM` (ver `docs/modules/LAJEGEOM.md`, secao 2).
- Falha ao localizar o modulo de destino: `Modulo nao encontrado em ` + caractere final perdido. Ver secao 8.
- Encerramento: `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. A mensagem fala do sistema inteiro, nao so do modulo [inferido].
- Espera: `Aguarde ...!`, `Aguarde ..` e ` .. Aguarde`.
- Troca de disco: `Coloque o Disco LAJE no Drive `. Quando aparece nao esta provado.

## 3. Telas e menus

### 3.1 Menu principal

Titulo: `Calculo e Detalhamento de Painel / Lajes de um Edificio`. Prompt: `escolha opcao `. Itens (a letra destacada esta perdida; ver secao 9):

- `!ontinuidade e Engastes`. Tela 3.7.
- `!irecoes Principais das Armaduras`. Tela 3.8.
- `!spessuras Minimas`. Tela 3.2.
- `!mposicao de Espessuras`. Tela 3.3.
- `!omentos e ` + `!rmadura necessaria`. Tela 3.4.
- `!timizacao dos Negativos`. Tela 3.5.
- `!isualizar e Alterar Parametrizacoes`. Tela 3.6.
- `!etorno ao Menu Principal`. Sai do menu (secao 2).

Relacao item-tela: [inferido] pela ordem dos titulos de tela. As strings nao trazem numeracao dos itens.

### 3.2 Calculo de Espessuras Minimas

- Titulo de tela: `Calculo de Espessuras Minimas`.
- Texto de lista: `Lajes (` seguido de `Arquivadas`. Sentido exato nao esta claro (ver secao 9).
- Campos de entrada: ver secao 4.2 e 4.3.
- Relatorio: titulo `CALCULO DAS ESPESSURAS MINIMAS DAS LAJES`; cabecalho de colunas `Laje    H min   x/d    L/f        As        Perm.    Acid.   P Prop.   Total`.

### 3.3 Imposicao de Espessuras

- Titulos de tela: `ESPESSURAS MINIMAS` e `ESPESSURAS IMPOSTAS`. Ambos aparecem no mesmo bloco de codigo; qual e exibido em cada caso nao esta provado.
- Titulo de quadro: `OBRA #`. Titulo: `Imposicao das Espessuras das Lajes`.
- Campos: `Espessura a ser Imposta em um grupo de Lajes (H em cm) *FIM*`; `Numero das Lajes que serao Impostas as Espessuras`; `I/J/N a M/.../K  *RETORNA*`; `Ultima Espessura Fornecida`; ` Lajes `.
- Relatorio: `IMPOSICAO DAS ESPESSURAS NAS LAJES`; cabecalho `Laje     H      x/d    L/f        As        Perm.    Acid.   P Prop.   Total`.

### 3.4 Momentos e Armadura necessaria

- Campos: `Imprimo Relatorio com Momentos/Armaduras  S/*N*`; `Visualizo todo o painel com os Momentos/Armaduras  S/*N*`; `Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada`; `Deseja Visualizar  <*1*> Momentos e Armaduras   <2> Momentos   <3> Armaduras`.
- Cabecalho da tela de resumo: `Momentos Atuantes e Armadura Necessaria nas Lajes:`; `Numero das Lajes que serao Listados os Momentos/Armaduras`.
- Relatorios: `MOMENTOS ATUANTES NAS LAJES`, cabecalho `Laje     H       M+ principal    M+ secundario    M- maior      M- menor`. `ARMADURAS NAS LAJES`, cabecalho `Laje     H      As+ principal   As+ secundario   As- maior     As- menor`. Titulo sem cabecalho: `MOMENTOS ATUANTES`.

### 3.5 Otimizacao dos Momentos Negativos

- Texto de apresentacao: `Otimizacao dos Momentos Negativos`; `A Otimizacao dos Momentos Negativos consiste  em  Equilibrar  os  momentos oriundos de Lajes Adjacentes.   Este processo podera ser feito manualmente pelas rotinas de  CONTINUIDADE - IMPOSICAO DE ARMADURA  ou  atraves  deste procedimento automatizado.`; `Caso tenha sido Imposta Armadura nos trechos de Continuidade, tambem serao Verificadas as Armaduras Necessarias e Impostas.`
- Escolha: `Deseja <E>scolher as lajes  ou  <*T*>odas serao equilibradas`. `Acione  *<Enter> para Interromper`.
- Acompanhamento: `Laje que sera Equilibrada *`; `Laje `; linha de valores `M =#####.##      As =####.##    Mneg/Mpos = ##.##`; `Continuidade com a Laje `; `Relacao Mneg/Mpos da Laje  ` + ` alterada para `; ` .. Aguarde`.
- Comparacao: `Armadura Imposta   \           \  As =###.## cm2/m`; `Armadura Necessaria               As =###.## cm2/m`.

### 3.6 Visualizar e Alterar Parametrizacoes (`Correcao de Parametros`)

- Titulo: `Correcao de Parametros`.
- Itens com unidade, na ordem das strings. Os numeros 1 a 6 estao perdidos; so `7` e `8` sobrevivem:
  - `!ficiencia da Armadura Negativa` + `%`. Ver LAP linha 152.
  - `!obrimento da Armadura` + `cm`. Ver LAP linha 32.
  - `!imita Linha Neutra (dominio 3/4)` + `%`. Ver LAP linha 79.
  - `!ensidade do Concreto` + `t/m2`. Ver secao 9 (unidade em conflito).
  - `!oeficientes para Relacao dos Momentos Negativos`.
    - `!axima Relacao      Mneg/Mpos`. Ver LAP linha 135.
    - `!nima Relacao      Mneg/Mpos`. Ver LAP linha 136.
    - `7  -  Cantos` + `!eentrantes  Mneg/Mpos`. Ver LAP linha 137.
  - `8  -  *Retorno ao Menu Principal*`.
- Campos com rotulo longo, mesma sequencia: `Eficiencia da Armadura`; `Cobrimento da Armadura` + `cm`; `Limite da Linha Neutra em relacao ao Dominio 3/4` + `Relacao Limite`; `Densidade do Concreto` + `t/cm2`; `Maxima Relacao entre Momentos Negativos e Positivos em Lados Engastados` + `Maxima Relacao`; `Minima Relacao entre Momentos Negativos e Positivos em Lados Engastados` + `Minima Relacao`; `Relacao FIXA entre Momentos Negativos e Positivos em Cantos Reentrantes` + `Relacao para Cantos Reentrantes`.
- Relacao dos itens 1 a 6 com os rotulos: [inferido]. A ordem das strings nao e a ordem da tela.

### 3.7 Continuidade e Engastes

- Titulo: `C O N T I N U I D A D E`.
- Menu de acoes: `<E>limina Continuidade   <I>mpoe Engastamento   <A>tribui Armadura   <F>im`; `<T>oda continuidade   <E>scolher o trecho   <*R*>etorno`.
- Eliminar trecho: `Escolha o trecho a Eliminar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*`.
- Impor engastamento: `Numero da Laje para Imposicao de Engastamento *FIM*`; `Considero este trecho Engastado  S/*PROXIMO*`; `Considero a Laje ` + ` continua com a Laje `.
- Alterar coeficiente: `Escolha o trecho a Alterar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*.`; `Altere o Coeficiente de Engastamento (M-/M+)`; `Coef <=` + ` ou`.
- Armadura: `Escolha armadura na forma  #bit/esp  com bit=Bitola(mm) e esp=Espacamento(cm)`; `Novo  Coeficiente/Armadura *F` + `IM`.

### 3.8 Direcao da Armadura

- Titulo: `D I R E C A O   D A   A R M A D U R A`.
- Texto: `Uma das Direcoes Principais Predominante da Armadura  180`. O numero `180` nao tem explicacao nas strings (ver secao 9).
- Acoes: `<D>irecao principal da Armadura    <R>elacao entre Esforcos    <F>im`.
- Campos: `Laje que deseja Alterar a Direcao Principal da Armadura *RETORNO*`; `Nova Direcao Principal *`; `Laje que deseja Alterar a Relacao entre Esforcos *RETORNO*`; `Nova Relacao *`.
- `NAO` aparece em tres lugares. Papel exato: [inferido] resposta de confirmacao, sem prova.

## 4. Entradas do usuario

### 4.1 Menu
- Letra ou numero da opcao (`escolha opcao`), ver secao 3.1.

### 4.2 Lista de lajes
- Formato: `I/J/N a M/.../K`. Padrao `*TODAS*`. Os nomes de laje sao letras [arquivo: LAJE.INI linha 13] [inferido] pela forma do prompt.
- Aparece em: espessuras minimas, imposicao, momentos/armaduras.
- Visualizacao por laje: `<*T*>odas as Lajes ou cada Laje <I>solada`. Padrao `T`.

### 4.3 Sim/nao
- `Imprimo Relatorio com Espessuras Minimas  S/*N*`. Padrao `N`.
- `Visualizo todo o painel com as Espessuras Minimas  S/*N*`. Padrao `N`.
- `Imprimo Relatorio com Espessuras Impostas  S/*N* ;`. Padrao `N`.
- `Visualizo todo o painel com as Espessuras Impostas  S/*N*`. Padrao `N`.
- `Imprimo Relatorio com Momentos/Armaduras  S/*N*`. Padrao `N`.
- `Visualizo todo o painel com os Momentos/Armaduras  S/*N*`. Padrao `N`.
- `Dados Corretos N/*S* I`. Padrao `S`.
- `Considero este trecho Engastado  S/*PROXIMO*`.
- Textos com `S/<N>` ou `<S>im` sao confirmacoes; o padrao de cada um vem marcado com `*`.

### 4.4 Valores numericos
- Espessura H em cm para imposicao: `(H em cm)`. Faixa: [arquivo: SISTRUT.LAP linhas 77-78] (6 a 40 cm), validada contra o mensagem `H necessario > H maximo configurado` (secao 8).
- Coeficiente de engastamento M-/M+: `Coef <=`. Faixa [arquivo: SISTRUT.LAP linhas 135-136] (0,30 a 2,00). Ver secao 6.6.
- Armadura na forma `#bit/esp` com bit em mm e espacamento em cm. Bitolas: [arquivo: SISTRUT.LAP linhas 43-53]. Espacamentos: [arquivo: SISTRUT.LAP linha 180].
- Parametros da tela 3.6: eficiencia (%), cobrimento (cm), limite de linha neutra (%), densidade, relacoes Mneg/Mpos. Valores iniciais: ver secao 6.

### 4.5 Escolha de tipo de dado
- `Deseja Visualizar  <*1*> Momentos e Armaduras   <2> Momentos   <3> Armaduras`. Padrao `1`.
- `Deseja <E>scolher as lajes  ou  <*T*>odas serao equilibradas`. Padrao `T`.
- Direcao: `<D>irecao principal`, `<R>elacao entre Esforcos`.

### 4.6 Teclas de controle
- `<Enter>` segue; `Acione  *<Enter> para Interromper` na otimizacao.
- `Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario ` — avanco de formulario na impressora [inferido].
- `Acione ESC <Enter> para Continuar ` apos erro.
- `Qualquer Tecla para Continuar `.

## 5. Arquivos lidos e gravados

- As strings do LAJECALC nao trazem nenhum nome de arquivo com extensao (`.LAP`, `.INI`, `.VIG`, `.RLP`, outros). Nomes de arquivo sao contados em LAJEGEOM e no gerenciador LAJE, nao aqui. Ver secao 9.
- Configuracao de drive e pasta: `C=` (drive) e `\=` (pasta) em [arquivo: LAJE.INI linhas 1-2]; pasta dos arquivos `.LAP`: `C:\SISTRUT\EXEC40\=` em [arquivo: LAJE.INI linha 4]. O cabecalho do `SISTRUT.LAP` tambem cita a pasta `\SISTRUT\EXEC40` [arquivo: SISTRUT.LAP linhas 16-18].
- Parametros lidos: [inferido] o `SISTRUT.LAP` (secao 6 e tela 3.6). As strings nao mostram a leitura, so os rotulos dos parametros.
- Dados de painel de entrada: [inferido] o resultado da etapa de geometria (`.VIG` e `.RLP`, gerados em `MONTAGEM` do LAJEGEOM, ver `docs/modules/LAJEGEOM.md`). Sem prova nas strings do LAJECALC.
- Saida: relatorios para a impressora e tela (secao 7). Codigos de impressora em [arquivo: LAJE.INI linhas 29-32] (1/6 de polegada, 1/8 de polegada, salto de perfuracao de 6 linhas e cancelamento). Uso desses codigos pelo LAJECALC: [inferido].
- Gravacao em arquivo: nenhum nome de saida identificado nas strings. Se o modulo grava resultados para outra etapa, nao esta provado.

## 6. Calculos

Nao ha formula nas strings. Os itens abaixo vem de rotulos de tela e de parametros do `SISTRUT.LAP`. Onde o modulo usa um parametro, isso e [inferido] pelo nome do rotulo.

### 6.1 Materiais e coeficientes de seguranca
- Fck = 0.15 e Fyk = 5.0, com unidade de forca em t e de area em t/cm2 [arquivo: LAJE.INI linhas 18, 21, 23, 24]. Tipo de aco `B` [arquivo: LAJE.INI linha 25].
- Coeficientes de seguranca: esforcos 1.4, concreto 1.4, aco 1.15 [arquivo: LAJE.INI linhas 26-28].
- Os cabecalhos da tela de imposicao listam `Fck`, `Fyk`, `tipo`, `Cobrimento`, `CSE`, `CSC`, `CSA`. Associacao de CSE/CSC/CSA aos coeficientes de esforcos, concreto e aco: [inferido] pela ordem, pois as strings nao trazem a legenda.

### 6.2 Espessura minima e flechas
- Tabela do relatorio de espessuras minimas: `H min`, `x/d`, `L/f`, `As`, `Perm.`, `Acid.`, `P Prop.`, `Total`.
- Altura minima 6 cm e maxima 40 cm [arquivo: SISTRUT.LAP linhas 77-78].
- Limite de linha neutra 100 % [arquivo: SISTRUT.LAP linha 79]. Coluna `x/d`: [inferido] posicao relativa da linha neutra, limitada por esse valor.
- Limites de flecha: total 300 e acidental 500 [arquivo: SISTRUT.LAP linhas 80-81]. Coluna `L/f`: [inferido] razao vao/flecha comparada com esses limites.
- Flecha com deformacao lenta `S` [arquivo: SISTRUT.LAP linha 82] e multiplicador de Ec 0.9 [arquivo: SISTRUT.LAP linha 83]. Ver secao 9 sobre a referencia NB1.
- Densidade do concreto 2.50 t/m3 [arquivo: SISTRUT.LAP linha 84]. Ver secao 9 sobre a unidade.

### 6.3 Altura e imposicao
- Espessura imposta digitada em cm, faixa 6 a 40 cm [arquivo: SISTRUT.LAP linhas 77-78]. Se a altura necessaria passa do maximo, o modulo recusa com a mensagem da secao 8.
- Telas `ESPESSURAS MINIMAS` e `ESPESSURAS IMPOSTAS`: comparacao entre altura calculada e altura imposta [inferido].

### 6.4 Momentos e relacao de esforcos
- Tabela de 15 pares `vao maior / relacao de esforcos`, de 0.25/0.40 ate 4.00/2.50 [arquivo: SISTRUT.LAP linhas 98-112]. Uso: [inferido] coeficientes de momento por relacao de vaos.
- Momentos atuantes por laje: `M+ principal`, `M+ secundario`, `M- maior`, `M- menor`. Armaduras correspondentes: `As+ principal`, `As+ secundario`, `As- maior`, `As- menor`.
- Direcao da armadura e relacao entre esforcos alteradas pela tela 3.8. Efeito sobre os momentos: [inferido].

### 6.5 Armadura
- Bitolas de 4 a 25 mm, em 10 posicoes de ordem 0 a 9 [arquivo: SISTRUT.LAP linhas 43-53].
- Armadura minima positiva 0.15 % e negativa 0.10 % [arquivo: SISTRUT.LAP linhas 150-151].
- Eficiencia da armadura negativa 100 % [arquivo: SISTRUT.LAP linha 152].
- Espacamento maximo 20 cm [arquivo: SISTRUT.LAP linha 158]. Comparacao com 2 x altura total, S/N [arquivo: SISTRUT.LAP linha 159].
- Espacamento minimo por altura: 10.0 cm -> 7.5; 22.0 -> 10.0; 30.0 -> 12.5; 40.0 -> 15.0 [arquivo: SISTRUT.LAP linhas 170-173]. Espacamentos disponiveis: 7.5, 10, 12.5, 15, 17.5, 20 cm [arquivo: SISTRUT.LAP linha 180].
- Bitola preferencial por altura: ate 5.0 cm -> 4.0 mm; 5.5 -> 5.0; 14.0 -> 6.3; 25.0 -> 8.0; 32.0 -> 10.0; 40.0 -> 12.5 mm [arquivo: SISTRUT.LAP linhas 194-199]. Regra exata de selecao: [inferido].
- Formato de entrada da armadura imposta `#bit/esp`: bitola em mm e espacamento em cm.
- Resultado mostrado: `Armadura Necessaria As = ###.## cm2/m` e `Armadura Imposta As = ###.## cm2/m`.

### 6.6 Otimizacao dos momentos negativos
- Relacao Mneg/Mpos maxima 2.00, minima 0.30 e para cantos reentrantes 1.00 [arquivo: SISTRUT.LAP linhas 135-137].
- Processo: equilibrar os momentos de lajes adjacentes, por lista de lajes ou por todas. Cada laje tem `M`, `As` e `Mneg/Mpos` mostrados. A relacao e alterada quando o equilibrio exige.
- Se houve armadura imposta nos trechos de continuidade, ela tambem e verificada.

### 6.7 Continuidade e engastes
- Coeficiente de engastamento M-/M+ digitado, com faixa 0.30 a 2.00 [arquivo: SISTRUT.LAP linhas 135-136]. Prompt `Coef <=`.
- Engastamento e continuidade do trecho entre duas lajes. Efeito no calculo: [inferido].

### 6.8 Direcao da armadura
- Texto `Uma das Direcoes Principais Predominante da Armadura  180`. Significado do `180`: ver secao 9.

## 7. Relatorios e impressao

Cada relatorio tem titulo e cabecalho de colunas. A impressao e opcional e confirmada por `S/N` (secao 4.3).

- Espessuras minimas: titulo `CALCULO DAS ESPESSURAS MINIMAS DAS LAJES`; cabecalho `Laje    H min   x/d    L/f        As        Perm.    Acid.   P Prop.   Total`. Mascara numerica das colunas: `######.##` e `##.#`.
- Imposicao de espessuras: titulo `IMPOSICAO DAS ESPESSURAS NAS LAJES`; cabecalho `Laje     H      x/d    L/f        As        Perm.    Acid.   P Prop.   Total`. Bloco de parametros com `Fck`, `Fyk`, `tipo`, `Cobrimento`, `CSE`, `CSC`, `CSA`, com mascaras de linha proprias. Este bloco e [inferido] o cabecalho de parametros do relatorio.
- Coluna de armadura com rotulo `espac/bitola`. Uso exato: [inferido].
- Momentos atuantes: titulo `MOMENTOS ATUANTES NAS LAJES`; cabecalho `Laje     H       M+ principal    M+ secundario    M- maior      M- menor`. Titulo curto `MOMENTOS ATUANTES`.
- Armaduras: titulo `ARMADURAS NAS LAJES`; cabecalho `Laje     H      As+ principal   As+ secundario   As- maior     As- menor`.
- Opcao do que sai no relatorio: `Deseja Visualizar  <*1*> Momentos e Armaduras   <2> Momentos   <3> Armaduras`.
- Visualizacao do painel na tela com os valores: `Visualizo todo o painel com ...`. Se respondido `S`, o painel inteiro e desenhado com os valores [inferido].
- Avanco de formulario: `Acione <Enter> para seguir  ou  *<Enter> elimina o avanco do formulario`. Indica uso de impressora de formulario continuo [inferido].
- Codigos de impressora de LAJE.INI: ESC 2 = espacamento de 1/6 de polegada; ESC 0 = 1/8 de polegada; ESC N ESC 6 = salto de 6 linhas; ESC O = cancela salto [arquivo: LAJE.INI linhas 29-32]. Uso desses codigos pelo LAJECALC: [inferido].
- Texto de espera durante a impressao ou calculo: `Aguarde ..` e `Aguarde ...!`.
- Pausa apos a tela de relatorio: `Qualquer Tecla para Continuar`.

## 8. Mensagens de erro

- `H necessario  >  H maximo configurado`. A altura calculada passa do maximo de 40 cm [arquivo: SISTRUT.LAP linha 78] ou do valor imposto [inferido].
- `erro no processamento` seguido de `verifique a consistencia dos seus dados`. Mostrados juntos apos falha de calculo. Causa exata: [inferido] dado inconsistente de painel.
- `Acione ESC <Enter> para Continuar`. Saida da mensagem de erro, sem sair do modulo [inferido].
- `Modulo nao encontrado em ` seguido do caractere final perdido. Ver secao 2.
- `Coloque o Disco LAJE no Drive `. Pede a troca de disco quando o modulo ou arquivo nao esta no drive. Gatilho exato: [inferido].

## 9. Lacunas e incertezas

1. Unidade da densidade do concreto: `SISTRUT.LAP` linha 84 diz t/m3 [arquivo]; a tela 3.6 diz `t/m2` em um rotulo e `t/cm2` em outro. Nao resolvido.
2. Letras e numeros perdidos nas strings: as letras destacadas do menu principal (secao 3.1) e os numeros 1 a 6 da tela 3.6 (secao 3.6) foram perdidos. A ordem e o mapeamento item/tela sao [inferido].
3. Significado do `180` na tela de direcao da armadura. Sem legenda nas strings.
4. Legenda de `Lajes (` e `Arquivadas` na tela de espessuras minimas. Sentido exato nao esta claro.
5. Formulas de calculo: nao ha nenhuma nas strings. Momentos, armaduras, `x/d`, `L/f` e a regra de escolha de bitola sao [inferido] a partir de rotulos e do SISTRUT.LAP. Para exatidao numerica, a fonte precisa ser outra (manual do SISTRUT 4.0, codigo fonte ou comparacao com o executavel original rodando).
6. Arquivos de dados: o LAJECALC nao mostra nome de arquivo com extensao nas strings. A entrada de painel pode vir de `.VIG` e `.RLP` (gerados pelo LAJEGEOM), mas isso e [inferido]. Ver `docs/modules/LAJEGEOM.md`.
7. Mapeamento de CSE, CSC e CSA para os coeficientes de LAJE.INI linhas 26-28 [inferido].
8. Funcao dos outros modulos (`bmLAJECHAR`, `bmLAGEOCAL`, `bmLAMONTLB`, `bmLACALCU`, `bmMIXT`) nao e confirmada pelas strings.
9. Referencia normativa: o cabecalho do SISTRUT.LAP cita `CALCULO E DETALHAMENTO DE LAJES EM REGIME DE RUPTURA` [arquivo: SISTRUT.LAP linha 5]. Os parametros citam NB1 (linhas 82-83). A aplicacao exata da norma no codigo nao esta confirmada.
