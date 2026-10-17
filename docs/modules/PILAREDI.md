# PILAREDI.EXE - editor de edificio (pilares)

Fonte: strings do executavel original `PILAREDI.EXE` (fora do repositorio). Cabecalho: "Abril 1991", "Versao 4.0". Conflito de data: SISTRUT.PIP traz ABRIL 1992 (ver PILAR.md).

Convencao: `[inferido]` = deducao sem evidencia direta. Texto entre crases e exato das strings. A primeira letra de varias telas esta cortada (ex.: `ateriais` = Materiais, M) [inferido]. Asteriscos (`S/*N*`, `*0*`, `*RETORNO*`) marcam a opcao padrao [inferido].

## 1. Papel

Edita pilares de um edificio de concreto armado: parametrizacao, cadastro de secoes, predimensionamento, dimensionamento e arranjo de armadura, arquivamento, listagem e relatorios de fundacao e de armacao. Titulo: `PILARES DE CONCRETO ARMADO - CALCULO DE EDIFICIOS DE MULTIPLOS ANDARES`. Norma: NB-1/78 nao aparece nas strings (ver secao 9).

## 2. Chamada e retorno

- Chamado por PILAR como `PILAREDI#`.
- Modulo nao encontrado: `Modulo nao encontrado em I` (texto truncado).
- Retorno ao PILAR: `Retorno ao Modulo Basico de PILAR`.
- Retornos de submodulo: `VOLTA PILGEEDI`, `VOLTA PIGRAEDI`, `VOLTA PIPROEDI`. Quando cada um e usado nao esta nas strings [inferido].
- Saida: `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.
- Submodulos citados no menu: `PILGEEDI`, `PIPROEDI`, `PIGRAEDI`. Mapeamento tecla -> submodulo nao confirmado [inferido].
- Modulos de apoio citados (fora das 5 specs): `PIAUXEDI`, `PILDAEDI#`, `PILVEEDI`, `PISECEDI`, `PIMOMEDI` [inferido: apoio].

## 3. Telas e menus

### 3.1 Menu principal

| Texto nas strings | Tecla | Destino |
|---|---|---|
| `ateriais, Concreto Aco` | M | Materiais (3.2) |
| `rquivar dados de Colunas` | A | Arquivar |
| `ecoes / Dimensionamento` | S | Secoes (3.8) |
| `rocessar / Detalhar Colunas` | P | Calculo (3.4) |
| `ista das Colunas Arquivadas` | L | Lista (3.7) |
| `ravacao e Leitura` | G | Gravacao/leitura |
| `isualizar e Alterar Parametrizacoes` | V | Parametros (3.3) |

Rodape: `<F2> = Retorno`, `escolha opcao `.

### 3.2 Materiais
`Definicao dos Materiais e unidades de trabalho`. Campos: `Concreto Fck *`; `Unidade de grandeza para os valores caracteristicos do Concreto e Aco`; `Multiplicador de (*) para transformar em Tonelada/Centimetro2`; `Aco      Fyk *`; `Tipo de Aco  A/B *`.

### 3.3 Parametrizacao (.PIP) e correcao de parametros
- Leitura do .PIP: `Arquivo parametrizacao `; `.PIP   nao encontrado`; `Erro no Arquivo parametrizacao`; `ultimo dado lido `; `Sera adotada a parametrizacao SISTRUT `. Com .PIP ausente ou com erro, usa a parametrizacao SISTRUT.
- Nome do arquivo: `Nome do Arquivo PARAMETRIZACAO *`.
- Correcao de parametros: titulos `Coeficientes de Seguranca`, `Coeficientes para o calculo da fluencia`, `Unidades de trabalho dos esforcos solicitantes`. Itens: (P) `Parametrizacao =`; (1) `Forcas =`; (2) `Concreto =`; (3) `Aco =`; sem rotulo nas strings: `de Fluencia (0 a 2) =`; (5) `Mult. de Nk par obter (Ngk + Nqk) =`; (6) `Mult. Fluencia (1.1 a 1.25) =`; (7) `Unidade de Forca =`; (8) `Coef. multiplicador para transformar em toneladas =`; (9) `Unidade de Medida =`; (10) `Coef. multiplicador para transformar em metros =`.
- Edicao: `item , Novo Valor  *NAO* ` (texto truncado) [inferido: prompt de alteracao].
- Erro de log: `ERRPARA`: nome de arquivo de erro; conteudo nao evidenciado.

### 3.4 Menu de calculo
`Predimensionamento de Secao e Dimensionamento da Armadura`; `Numero maximo de Colunas Posicionadas`; `Colunas`; `Redimensionamento de Secao`; `Dimensionamento da Armadura`; `Resumo de cargas Acumuladas`; `Momentos e Carga Normal / Diagramas`; `*Retorno ao Menu Principal*`.
### 3.5 Fundacao
`Resumo de Cargas acumuladas na Fundacao`; `Parametros que influenciam as cargas na fundacao`; `Reduzo cargas acidentais para fundacao = `; `Porcentagem da carga considerada acidental = ##%`; `Acrescento o peso Proprio = `; `Densidade do Concreto (t/m3) = ##.##`; `Deseja alterar os parametros S/*N*`; `Deseja imprimir o  relatorio S/*N*`; `<Enter> para seguir` / `ou` / `* <Enter> para nao avancar o formulario :`.

### 3.6 Disco e diretorio
`Coloque o disco Q no Drive `; `Drive que contem o Disco de Dados `; `\Diretorio\Subdiretorio\...\`; `Subdiretorio `; `Acione  D <Enter>  para alterar Drive e Diretorio`; `Crio o Diretorio S/*N*`; `Criando Diretorio     Aguarde ...`.

### 3.7 Lista de colunas arquivadas
Titulo `Lista das Colunas arquivadas  Obra G`; cabecalho `Coluna  inicio  termino  Carga  Secao  Armadura`; mascara `######.##`; rodape `Qualquer Tecla para Continuar`. Lista paginada: `NOME`, `<Anteriores>`, `<R>etornar`, `Proximos`.

### 3.8 Cadastro de secao
- Tipo: `1 Retangular`, `2 Circular`, `3 Poligonal fechada`, `4 Leitura de Secao arquivada`, `5 Alterar Drive e Diretorio`, `Escolha o tipo de secao *FIM*`.
- Retangular: `B(cm) , H(cm) [, Rotacao(*0*)] *RETORNO*`; campos `Rotacao = ... graus`, `cm  Hw =`.
- Circular: `Diametro(cm) [, Dinterno(cm) ] *RETORNO*`; campos `Diametro externo =`, `Diametro interno =`.
- Poligonal: `Numero de Vertices da poligonal *RETORNO*`; `Faca a Poligonal no sentido horario, sempre com coordenadas positivas.`; codigos `A x,y` (acrescenta vertice), `P ang,comp` (polar, angulo em graus), `C Xcentro,Ycentro` (circulo ou semicirculo), `* n` (vai ao vertice n) [inferido: sentido pelo texto]; `Coordenadas da Poligonal - Vertice`; `X , Y (cm)`; `Numero de Vertices INTERNOS ao Circulo , Angulo (GRAUS)`.
- Armadura da secao (rotulos): `Bitola utilizada nos cantos da Secao *RETORNO*`; `Outra Bitola utilizada nas faces da Secao *MESMA*`; `Numero de barras (por face) internas as de canto em Bw *0*` e `... em Hw *0*`; `Bitola utilizada na periferia EXTERNA da Secao *RETORNO* +`; `Numero de barras no perimetro EXTERNO *0*`; `Bitola utilizada na periferia INTERNA da Secao *MESMA* +`; `Numero de barras no perimetro INTERNO *0*`; `Bitola utilizada nos cantos da Poligonal *RETORNO*`; `Crio barras nas faces laterais, intermediarias as de canto S/*N*`; `Bitola utilizada nas faces da Poligonal *MESMA*`; `use Cn para Cada n`; `Dados corretos N/*S*`.
- Entrada de coluna: `Nome do Pilar *RETORNO*`; `Entre com a Secao da Coluna no Nivel indicado ou use o codigo auxiliar`; `tamanho nao determinado a ser predimensionado*`; `NIVEL`.

### 3.9 Predimensionamento
- Selecao: `Numero da Posicao das Colunas que serao Predimensionadas`; faixa `I/J/N a M/... /K *RETORNO*`. Tabela com `Posicao` e `Nivel`.
- Variacao de secao: `a. Variacao de Secao a partir do nivel`; opcoes `NAO`, `REDEFINE`, `FIM`, `ALTERADAM`.
- Distancias entre centros de gravidade: `Entre com a distancia a PARTIR do Centro de Gravidade do Nivel inferior, ate o centro de gravidade da Secao predimensionada acima`; cabecalho `NIVEL ... Xcg=#####.## Ycg=#####.## Ex=####.## Ey=####.##`.
- Mudanca de secao: `Nivel a partir do qual (superiores) teremos uma nova secao`; `<Enter> para visualizar os Niveis definidos`; `Numero ou Nome *CANCELA*`; `Confirme uma nova secao a partir do NIVEL`.
- Tela de calculo: `Aguarde ..`, `PREDIMENSIONAMENTO`, `Compressao :`, `Compressao + Momento :`, `tensao maxima admissivel ####.###`, `maxima de`, `encontrada no`.
- Proposta: `CUIDADO`; `Deseja alterar as Coordenadas da Poligonal N/*S*`; `CARGA :`; `SECAO PROPOSTA :`.
- Opcoes: `Aceita a Secao proposta e passa a predimensionar a proxima Coluna`; `Modifica as excentricidades entre as diferentes Secoes`; `Retorna a escolha do tipo de secao e redefine`; `Elimina uma variacao de secao`; `Cancela o predimensionamento e passa para proxima Coluna`; `Inicia novamente o predimensionamento desta Coluna`; `Varia a secao da Coluna entre os niveis (maximo ... secoes)`.
- Variacao entre niveis: `Entre com a distancia a PARTIR do Centro de Gravidade da Secao do Nivel inferior, ate o centro de gravidade da Secao do Nivel Superior`; `Numero da Secao do Nivel superior que deseja alterar *FIM*`.
- Eliminacao: `Eliminacao de variacao de secao`; `Escolha a secao que deseja Eliminar`; `Acione <Enter> para Eliminar, <R> para Retornar`.
- Coluna ja predimensionada: `Coluna ja predimensionada`; `Acione * <Enter> para manter a Secao para alteracoes`; `Predimensiono a Coluna novamente S/*N*`.

### 3.10 Dimensionamento e arranjo de armadura
- Restricao: ver secao 8.
- Verificacao de esbeltez e extremidades: `Nk =`, `Blbx =`, `Blby =`, `Csf recomendado =`; `Mkx atuante`, `Mky atuante`, `Mk total atuante`, `Mkx resistente`, `Mky resistente`, `Incl ln`, `Mk total resistente`; tabela de casos `(1) (2) (3) (4)` com `Compressao Centrada`, `Flexo Compressao`, `Flexao Obliqua`.
- Estado do calculo: `Aguarde`; aviso de instabilidade com `DIMINUI` (texto quebrado, ver secao 8); cabecalhos `CARGA ACUMULADA`, `MOMENTOS`.
- Opcoes: `Numero da Posicao das Colunas que serao Dimensionadas` (faixa `I/J/N a M/... /K *RETORNO*`); `Varia a Armadura ao Longo da Coluna em trecho de Secao Constante S/*N*`; `De quantos em quantos Niveis *2*`; `Paro para Visualizacao a cada Trecho Dimensionado S/*N*` (grafia original); `Dimensiona as Colunas continuamente sem possibilidade de alteracoes S/*N*`.
- Resultado por nivel: `Posicao`, `VARIA:`, `REDEFINE`, `Nivel`, `a. Variacao de Secao`, `NAO`, `Aguarde ...`, `As ####.## cm2`, `Taxa ###.##%`.
- Menu de arranjo: `<A>` `Aceita a Armadura proposta e passa a Dimensionar a proxima Coluna`; `<R>` `Redefine manualmente a Armadura` (hotkey cortada: `Redefine`); `<L>` `Elimina uma Variacao` (hotkey cortada: `limina`) [inferido: L]; `<C>` `Cancela o Dimensionamento e passa para proxima Coluna`; `<I>` `Inicia novamente o Dimensionamento desta Coluna`; `<D>` `Redesenha as Secoes da Coluna com Armadura disposta`; `<V>` `Varia a Armadura da Coluna entre os niveis (maximo ... arranjos)`; `Continua ..`.
- Redefinicao manual: `Redefinicao manual da Armadura`; `Escolha o arranjo da armadura que deseja Alterar ou Eliminar`; `Acione <Enter> para Alterar, <R> retornar ou <E>liminar o arranjo escolhido` (letra E cortada [inferido]).
- Confirmacoes: `Confirme CANCELAR o dimensionamento da Coluna SIM/*N*`; `Confirme INICIAR o dimensionamento da Coluna SIM/*N*`.
- Variacao de armadura: `(maximo ...)`; `Nivel a partir do qual (superiores) teremos uma nova armadura`; `Numero ou Nome *CANCELA* -`; `Confirme uma nova armadura a partir do NIVEL`.
- Coluna ja dimensionada: `Acione  * <Enter>  para manter a Armadura para alteracoes`; `Dimensiono a Coluna novamente  S/*N*`.
- Selecao para listar: `Numero da Posicao das Colunas que serao Listadas`; `I/J/N a M/... /K *RETORNO*`; `Dados Corretos N/*S*`.

## 4. Entradas do usuario

| Campo | Formato / unidade | Faixa ou padrao |
|---|---|---|
| Fck (concreto), Fyk (aco), tipo de aco | valor caracteristico, multiplicador p/ tf/cm2; letra | tipo A ou B |
| Coef. de seguranca: forcas (1), concreto (2), aco (3) | fator | sem faixa nas strings |
| Fluencia | valor | 0 a 2 |
| Mult. de Nk para (Ngk+Nqk) (5) | fator | sem faixa nas strings |
| Mult. de fluencia (6) | fator | 1.1 a 1.25 |
| Unidades de forca (7) e medida (9); fatores p/ tonelada (8) e metro (10) | texto / fator | - |
| Coef. de tensao (1) e (2) | `####.###` ou multiplicador de Fck, negativo = tensao maxima | - |
| Taxa ideal (3), cobrimento (4), reducao de acidentais (5-6), % acidental (7), peso proprio (8), densidade (9) | `#.##%`, `##.# cm`, S/N, `##%`, S/N, `##.##` t/m3 | - |
| Dimensoes da secao (retangular, circular) | cm; rotacao | rotacao `*0*` |
| Vertices da poligonal | X,Y em cm; codigos A/P/C/* | sentido horario |
| Bitolas e numero de barras | tabela de bitolas; numero | `*0*` |
| Nome do .PIP | texto | padrao SISTRUT |

Tabela de bitolas: `3.2 ,4 ,5 ,6.3 ,8 ,10 ,12.5,16 ,20 ,22.2,25 ,32 ,40` (unidade provavel mm [inferido]). Espacamentos: `.08 ,.125,.2 ,.315,.5 ,.8 ,1.25,2 ,3.15,3.88,5 ,8 ,12.5` (unidade provavel m [inferido]).

## 5. Arquivos lidos e gravados

- Lido: arquivo de parametrizacao `.PIP` (nome digitado). Gravacao do .PIP: nao evidenciada [lacuna].
- Colunas arquivadas: gravadas e lidas pelas telas `Arquivar`, `Lista` e `Leitura`. Formato e extensao nao aparecem nas strings; PIGRAEDI.md indica `<obra>.COL` [inferido].
- Diretorio de dados: `ERRPIL/`; `ERRPIL`.
- Log de erro: `ERRPARA` (conteudo nao evidenciado).
- Saida impressa: relatorios de fundacao, armacao e desenho de secoes. Dispositivo nao nomeado [inferido: impressora].

## 6. Calculos

As strings trazem rotulos, tabelas e mensagens, nao formulas. Nenhum item abaixo prova uma formula.

- Coeficientes de flambagem: `.5 ,.7 ,.7 ,2 ,.7 ,.9 ,.85 ,2 ,.7 ,.85 ,1 ,2 ,2 ,2 ,2 ,100`. Coincide com a matriz 6.1 de PILAR.md. Os nomes de vinculo (ENGASTE etc.) nao aparecem nas strings; origem: PP [inferido].
- Esbeltez: `Lbx=###  Lby=###`; `Blbx`, `Blby`. Formula de esbeltez e de lambda: ausente [lacuna].
- Excentricidades entre secoes: `Ex`, `Ey` com `Xcg`, `Ycg`; `Modifica as excentricidades entre as diferentes Secoes`. Excentricidade acidental: ausente [lacuna]. Excentricidade de 2a ordem: so os rotulos `Mkx 1a`, `Mkx 2a`, `Mky 1a`, `Mky 2a`; calculo ausente [lacuna].
- Flexo-compressao normal e oblíqua: casos `Compressao Centrada`, `Flexo Compressao`, `Flexao Obliqua`; colunas `Mkx`, `Mky`, `Mk tot`, `Inc ln`, `1/r`, `x/d`, `Def con`, `Def aco`. NB-1/78 nao aparece nas strings [lacuna]. Coeficiente de seguranca: `Csf recomendado =`.
- Fluencia: `Coeficientes para o calculo da fluencia`; multiplicador de Nk para (Ngk+Nqk); fator de fluencia 1.1 a 1.25. Como o fator entra no calculo: [lacuna].
- Predimensionamento: tensao maxima admissivel, regra do multiplicador de Fck ou tensao negativa; telas em 3.9.
- Armadura minima e maxima: `TAXA DE ARMADURA PERMITIDA` (sem valor); `ESPACAMENTOS MINIMOS ENTRE BARRAS` e `NUMERO MAXIMO DE BARRAS` (sem valor). Valor de armadura minima: [lacuna].
- Estribos: nenhuma ocorrencia nas strings [lacuna].

## 7. Relatorios

- Colunas arquivadas: `Lista das Colunas arquivadas  Obra G`; `Coluna  inicio  termino  Carga  Secao  Armadura`.
- Resumo de cargas na fundacao `RESUMO DE CARGAS NA FUNDACAO`: colunas `Coluna`, `Carga Acumulada`, `Peso Proprio`, `Fundacao`, `Mx fundacao`, `My fundacao`, `Secao`, `As fundacao`; cabecalho `Obra - `; rodape `Qualquer tecla para Continuar`.
- Armacao das colunas: `Imprimo Relatorio da armacao das Colunas S/*N*`. Cabecalho: `OBRA -`, `COLUNA -`, `Nivel ... (###.##) ao ... (###.##)`, `Nivel Dimensionado`, `Fck`, `Fyk`, `ACO`, `Cobrimento ##.# cm`.
- Tabela de verificacao: `Atuante`, `Resistente`, `Situacao`.
- Desenho das secoes: `Imprimo o desenho das Secoes S/*N*`.
- Impressao: `Ajuste a Impressora e Acione <Enter> para seguir ou` e `* <Enter> para anular o avanco inicial do formulario`.

## 8. Mensagens de erro

- Parametrizacao: `.PIP   nao encontrado`; `Erro no Arquivo parametrizacao`; `Sera adotada a parametrizacao SISTRUT`.
- Processamento: `erro no processamento`, `verifique a consistencia dos seus dados`, `Acione ESC <Enter> para Continuar`.
- Disco e arquivos: `Nenhum Arquivo Encontrado`; `ATENCAO ! .. Drive e Diretorio nao encontrados`; `ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR`; `O SEU DISCO DE DADOS ESTA LOTADO`; `VERIFIQUE O SEU DRIVE`; `ERRO`.
- Poligonal: `Faces da Poligonal com mesmo alinhamento`; `Definicao impropria da Poligonal.`; `cruzando com face`; `face## (###.##,###.##) e (###.##,###.##)`; `c =###.##cm`.
- Restricao de dimensionamento: `ESTE APLICATIVO NAO ACEITA COLUNAS PARA DIMENSIONAMENTO` (a primeira letra vira byte de tamanho nas strings).
- Esbeltez: `COM ESBELTEZ MAIOR QUE LAMBDA` (texto de aviso truncado) [inferido].
- Armadura inviavel: `NUMERO MAXIMO DE BARRAS CONFIGURADO E INSUFICIENTE PARA A ARMADURA NECESSARIA,`; `OU O PERIMETRO DA SECAO E INSUFICIENTE PARA A QUANTIDADE DE ARMADURA DENTRO DOS ESPACAMENTOS MINIMOS ENTRE BARRAS CONFIGURADO.`; `AUMENTE O NUMERO MAXIMO DE BARRAS OU DIMINUA O ESPACAMENTO MINIMO ENTRE ELAS.`; fragmentos `NAOSUPORTA` e `NAOBARRAO` (texto quebrado; `NAO BARRAO` [inferido]).
- Estado de secao: `ATENCAO !!!`; `ESTA SECAO NAO SUPORTA OS ESFORCOS ATUANTES COM A MAXIMA TAXA DE ARMADURA PERMITIDA NA CONFIGURACAO.`; `ASSIM, ALTERE A SECAO DA COLUNA E RETORNE AO DIMENSIONAMENTO DA ARMADURA.`
- `DIMINUIU` e variantes (`DIMINUIU****`, `DIMINUI`, `DIMINUIU***`): mensagem quebrada; texto completo nao recuperado [inferido: reducao de armadura ou de secao].

## 9. Lacunas

1. NB-1/78, formulas de flambagem, esbeltez, lambda, excentricidades e flexo-compressao: so rotulos nas strings.
2. Estribos, excentricidade acidental e armadura minima/maxima em valor: ausentes ou so rotulos e mensagens. Excentricidade de 2a ordem: so rotulos `Mkx 1a/2a`.
3. Nomes dos coeficientes de vinculo (ENGASTE etc.): ausentes nas strings.
4. Hotkeys cortados: `<R>`, `<L>`, `<E>` e primeira letra do menu principal [inferido].
5. Mensagens quebradas: ver secao 8.
6. Ordem e condicoes de retorno aos submodulos (`VOLTA ...`).
7. Formato e extensao das colunas arquivadas; gravacao do .PIP; destino da impressao.
8. Modulos de apoio (PIAUXEDI, PILDAEDI#, PILVEEDI, PISECEDI, PIMOMEDI): fora das 5 specs.
9. Data: Abril 1991 aqui; ABRIL 1992 em SISTRUT.PIP (ver PILAR.md).
