# FORMEDCA.EXE - Especificacao funcional

Fontes: strings do executavel original `FORMEDCA.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Bytes de caixa e de comprimento do QuickBASIC foram omitidos. Caracteres soltos no fim de algumas linhas (`5`, `L`, `B`, `E`, `F`, `D`) sao residuos binarios das strings extraidas, nao texto.
Erros de digitacao do original sao mantidos como estao no executavel e marcados com `(sic)`.

## 1. Papel do modulo

FORMEDCA.EXE e o editor interativo da forma. Recebe a forma montada por FORMINIT e permite:

- amarrar Pilares, Vigas e faces de Vigas a coordenadas, eixos ou outros elementos (secoes 3.2 a 3.4);
- ajustar a posicao dos textos e das cotas do desenho (3.5 e 3.7);
- ajustar a elevacao (cota basica e alinhamento de Vigas) (3.6);
- gravar a forma em `.FRM` e gerar os dados de desenho de Vigas (`.FOR`) e de Pilares (`.CFO`) (secao 5).

Identificacao: nao ha cabecalho de versao ou data nas strings deste executavel.

## 2. Chamada e retorno

**Entrada.** FORMA e FORMINIT chamam FORMEDCA pelo token `FORMEDCA`. Lancamento por `SHELL` com `<unidade>:\SISTRUT\EXEC40\FORMEDCA.EXE` [inferido, reconstrucao `src-reconstructed/SISTRUT.BAS`, sub `RunModule`].

**Tokens de despacho neste executavel.** `FORMA`, `FORMINIT`, `VOLTAFORMINIT`, `FORMEDCA`, `INICIAL`.
- `VOLTAFORMINIT` e o retorno para FORMINIT. O canal (arquivo, variavel ou argumento) nao esta nas strings [inferido].
- `FORMA` e o destino de retorno ao modulo basico.
- `INICIAL` e o estado inicial da tela (menu principal) [inferido].

**Retorno ao modulo basico.** `Retorno ao Modulo Basico de FORMA`. Mesma frase em FORMIMP, FORMPLOT e FORMA (`Retorno ao Modulo Gerenciador`).

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` (mesmo texto de FORMA).

**Submodulo ausente.** `Modulo nao encontrado em `.

## 3. Telas e menus

### 3.1 Menu principal

Titulo na tela: `<INICIAL>` (token). Opcoes, em tres linhas, na ordem:

| Linha | Texto exato (sem residuos) |
|---|---|
| 1 | `<P>ilares     <V>igas    <B>orda de Laje           <R>edesenha` |
| 2 | `<D>etalhes    <C>otas    <T>extos    <E>levacao    <Z>oom` |
| 3 | `<G>ravacao    <F>orma gera Vigas+Pilares                         <S>egue ..` |

Hotkeys: P, V, B, R, D, C, T, E, Z, G, F, S. Estao entre `<>` no texto; sao lidas diretamente das strings, nao deduzidas. O nome da opcao `<R>edesenha` e a acao `REDESENHA` citada nas mensagens (3.9) [inferido].

`<S>egue ..` leva a `Continua ..` (3.8) [inferido].

### 3.2 Amarracao de Pilares

Titulo: `Amarracao dos Elementos Estruturais na Forma`.
Submenu: `Alteracao e Visualizacao da Amarracao dos Pilares`.
Pedido: `Numero ou Nome do Pilar *FIM*`. `*FIM*` e a entrada de fim da lista.
Confirmacao: `Altero N/*S*` (padrao em maiuscula, `S` = Sim; o texto e `Altero`, sem acento).
Titulo da alteracao: `Alteracoes na amarracao do Pilar /`.

**Sentido X - amarracao de um vertice do Pilar**:
`<C>oordenada   <E>ixo   outro <P>ilar   uma <V>iga   <M>antem   <R>etorna`.
- Pilar com secao circular: `Sentido X  -  Pilar com Secao Circular`; `acione A<Enter> para Angular` (`A` = angular).
- `Coordenada absoluta do Centro da Secao`.
- Escolha do vertice: `Sentido X  -  Escolha do Vertice a ser amarrado`; `<S>im vertice a ser amarrado   <*P*>roximo   <A>nterior   <C>ancela`. Vertice: `Sentido X  -  Vertice a ser amarrado`; `Coordenada absoluta do vertice`.
- Entrada de distancia: `Xref , + - Dist , Angulo ou vert/hori *RETORNA*`; campos `Xref #####.##   Dist #####.##  Ang ##.##     X=`; confirmacao `aceita N/*S*`.

**Sentido X - eixo de referencia**: `Sentido X  -  Escolha do Eixo Vertical de Referencia`; `<S>im eixo de referencia   <*P*>roximo   <A>nterior   <C>ancela`; `Sentido X  -  Eixo Referencia`; `Distancia relativa do eixo ao Centro da secao`; `Distancia relativa do eixo ao vertice`; `Numero ou Nome do Pilar que servira de Referencia *FIM*`.

**Sentido X - pilar de referencia**: `Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada.`; `Acione REDESENHA para poder utiliza-la`; `Sentido X  -  Pilar Referencia`; `Centro da Secao`.

**Sentido X - vertice de referencia**: `Sentido X  -  Escolha do Vertice de Referencia`; `<S>im vertice de referencia   <*P*>roximo   <A>nterior   <C>ancela`; `vertice`; `Distancia relativa da referencia ao Centro da Secao`; `Distancia relativa da referencia ao vertice`.

**Sentido X - viga de referencia**: `Sentido X  -  Escolha da Viga de Referencia`; `<S>im Viga de referencia   <*P*>roxima   <A>nterior   <C>ancela`; `Sentido X  -  Viga Referencia`; `Distancia relativa da Viga ao Centro da secao`; `Distancia relativa da Viga ao vertice`.

**Sentido Y.** Mesma estrutura, com eixo horizontal: `Sentido Y  -  Amarrar um vertice do Pilar por:`; `Sentido Y  -  Pilar com Secao Circular`; `Y= *`; `Sentido Y  -  Escolha do Vertice a ser amarrado`; `Sentido Y  -  Vertice a ser amarrado`; `Yref , + - Dist , Angulo ou hori/vert *RETORNA*`; `Yref #####.##   Dist #####.##  Ang ##.##     Y=`; `Sentido Y  -  Escolha do Eixo Horizontal de Referencia`; `Sentido Y  -  Eixo Referencia`; `Sentido Y  -  Pilar Referencia`; `Sentido Y  -  Escolha do Vertice de Referencia`; `Sentido Y  -  Escolha da Viga de Referencia`; `Sentido Y  -  Viga Referencia`.

**Confirmacao da amarracao de pilar:** `Corfirme Alteracao N/*S*` (typo `Corfirme` em vez de `Confirme`, sic).

### 3.3 Amarracao de Vigas

Titulo: `Alteracao e Visualizacao da Amarracao das Vigas`.
Pedido: `Numero ou Nome da Viga *FIM*`. Opcao `*PROXIMA*`.
Bloqueio: `Existem Pilares ou Bordas de Lajes alteradas..`; `Acione REDESENHA para poder alterar as Vigas`; `Esta Viga nao pode ser modificada pois ja foi alterada.`.
Titulo da alteracao: `Alteracoes na amarracao da Viga`.

**Faces da viga:**
- `<*T*>odas faces serao amarradas   <E>scolho faces a serem amarradas   <R>etorna` (`Escolho`, sic).
- `<S>im face escolhida    <A>nula escolha    <*P*>roximo    <F>im    <C>ancela`.
- `<S>im face a ser utilizada como referencia    <*P*>roxima    <R>etorna`.
- `<S>im vertice a ser utilizada como referencia    <*O*>utro    <R>etorna`.
- `X=#####.##  Y=#####.##`.

**Sentido X - amarrar faces de viga:** `Sentido X  -  Amarrar faces de Viga por:`; `<C>oordenada absoluta    <E>ixo    um <P>ilar    outra <V>iga    <R>etorna`; `Sentido X  -  Amarrar faces`; `Coordenada absoluta do vertice X=`; `Distancia relativa do eixo ao vertice X=`; `Distancia relativa da referencia ao vertice X=`; `Distancia relativa da Viga referencia a face X=`.

**Sentido Y - amarrar faces de viga:** `Sentido Y  -  Amarrar faces de Viga por:`; `Sentido Y  -  Amarrar faces`; `Coordenada absoluta do vertice Y=`; `Distancia relativa do eixo ao vertice Y=`; `Distancia relativa da referencia ao vertice Y=`; `Distancia relativa da Viga referencia a face Y=`.

Espera: `Aguarde ...`.

### 3.4 Pilares e vigas - tela de dados (campos de referencia)

Grade de campos mostrada durante a amarracao:
- Pilar: `Pilar -`; `Nome -`; `Centro da Secao  Coordenada Absoluta em X=`; `Vertice`; `Coordenada Absoluta em X=`; `Centro do Pilar distante em X=`; `do eixo`; `distante em X=`; `do Centro do Pilar`; `do vertice`; `do Pilar *`. Campo Y: `Centro da Secao  Coordenada Absoluta em Y=`; `Coordenada Absoluta em Y=`; `Centro do Pilar distante em Y=`; `do eixo`; `distante em Y=`.
- Viga: `Viga -`; `faces`; `Coordenada Absoluta em X`; `Distante do eixo q` (sic, residuo `q`); `em X`; `Distante`; `Nao Alterado em X`. Campo Y: `Coordenada Absoluta em Y`; `Distante do eixo`; `em Y`; `Nao Alterado em Y`.

### 3.5 Visualizacao e alteracao dos textos

Titulo: `Visualizacao e Alteracao da Posicao dos Textos`.
Opcoes: `<P>ilares     <V>igas     <L>ajes     Visualiza <T>odos     <*R*>etorna`.
Aviso: `Atencao!  Ajuste os textos apos ter amarrado os elementos estruturais`.
Campo: `TODOS` (token) e `Continua ..`.
Opcoes de campo de desenho: `<D>efine um campo de desenho ampliado    <T>odo o campo    <*R*>etorna`.
Fim: `FIM` (token).

### 3.6 Elevacao (cota basica)

Titulo: `Visualizacao e Alteracao da Elevacao dos Elementos Estruturais na Forma`.
Opcoes: `<C>ota basica de referenia      <L>ajes      <V>igas      <*R*>etorno` (`referenia`, sic).
Aviso: `Atencao!  Dados de Elevacao nao serao alterados pela amarracao`.
Explicacao: `Tanto Lajes como Vigas serao amarradas relativamente a esta Cota Basica.`.
Entrada: `Entre com o valor da Cota Baica (metros) tipo  100.0  ou  103.415` (`Baica`, sic). Campo `Cota Basica *`.
Confirmacao: `Confirme mudar Cota Basica de Z`; `para `; `N/*S*`.

**Lajes.** `O Alinhamento entre as Lajes e feito no proprio modulo de LAJES .`. `Veja acima a amarracao de cada Laje em relacao a Laje`. `Cota Relativa da Laje`; `em relacao a Cota Basica (`.

**Vigas continuas.** `Alinhamento das Vigas Continuas`. `alinha  face <S>uperior    face <I>nferior    <V>iga / Tramo    <*R*>etorna`. `acione Viga / Tramo para visualizar a cota relativa de cada Viga / Tramo`.
- Face superior: `Alinhamento das Vigas pela face Superior`; `Cota das Vigas em relacao a Cota Basica`; `+ cm) *RETORNA* ;`; `Confirme Alinhar todas as Vigas pela face Superior  S/*N*`.
- Face inferior: `Alinhamento das Vigas pela face Inferior`; `Confirme Alinhar todas as Vigas pela face Inferior  S/*N*`.
- Tramo a tramo: `Alinhamento das Vigas pela face Superior tramo a tramo.`; `Nome da Viga *FIM*`; `Confirme alterar elevacao da Viga`; `N/*S*`; `(tramos`; `Alteracao da elevacao da Viga`; `<T>odos os tramos serao modificados    <E>scolhe o tramo    <*R*>etorna`; `Numero do Tramo *FIM*`; `(tramo`; `RETORNA`; `Cota da face Superior em relacao a Cota Basica p`.

### 3.7 Cotas e distancias

Titulo: `Visualizacao e Alteracao das Cotas e Distancias mostradas no Desenho`.
Opcoes: `<D>enife novas Cotas     <A>ltera cotas definidas     <*R*>etorna` (`Denife`, sic; a letra D deveria ser `Define`).
Titulo de linhas: `Definicao de linhas de medidas da Forma`.
Tipo de cota: `Cotas <H>orizontais    Cotas <V>erticais    Cotas <I>nclinadas    <*R*>etorna`.
Busca: `<S>im cota local   busca: <P>ilar   <V>iga   <B>orda Laje   <E>ixo   pro<X>imo`.
Opcoes: `<A>nula ultima cota   <R>etorna   <C>ancela   <F>im`.
Rotulos de referencia: `(Eixo \    \ X=#####.##)`; `(Pilar \   \ X=#####.##)`; `(Viga \    \ X=#####.##)`. Versoes Y: `(Eixo \    \ Y=#####.##)`; `(Pilar \   \ Y=#####.##)`; `(Viga \    \ Y=#####.##)`.
Confirmacoes: `Confirme CANCELAR Cotas definidas S/*N*`; `Confirme Cotas definidas N/*S* :`.
Posicao da cota: `As medidas serao mostradas <D>entro ou <F>ora do desenho`; `Escolha a posicao desejada para a linha de medidas e acione <Enter>`.
Linhas de medida: `Visualizacao e Alteracao das linhas de medidas da Forma`; `Altera <H>orizontais   Altera <V>erticais   Altera <I>nclinadas   <*R*>etorna`; `<S>im visualizo e altero cota indicada    <*P*>roxima    <C>ancela`; `<E>limino linha de cotas    mostra <F>ora    mostra <D>entro    <*P*>roxima`; `Confirme ELIMINAR a linha de cota S/*N*`.

### 3.8 Movimentacao de textos (cursor)

- `Movimente o cursor ate o PRIMEIRO canto e acione <Enter>   <R>etorna  <P>asso`.
- `Movimente o cursor ate o  SEGUNDO canto e acione <Enter>   <R>etorna  <P>asso`.
- `Passo do cursor *`.
- `FIM`.
- Movimento de elemento: `<  Movimenta    <Enter> Fixa    <P>asso`.
- Selecao: `Numero ou Nome da Laje *FIM*`; `Numero ou Nome do Pilar *FIM*`; `Numero ou Nome da Viga *FIM*`.

### 3.9 Avisos de elementos alterados

- `Existem elementos alterados.`; `Acione REDESENHA para atualizacao e depois grave os dados da forma.`; `RETORNA`.
- `Atencao !!!` com `Existem Vigas ou Bordas de Lajes alteradas.`; `Acione REDESENHA para poder alterar os Pilares`; `Esta Coluna nao pode ser modificada pois ja foi alterada.`; `Acione REDESENHA para poder modifica-la novamente`.

### 3.10 Gravacao

- `Gravacao dos dados da Forma`.
- `Acione   D <Enter>   para alterar Drive e Diretorio`.
- `Sigo com a gravacao em ` + `.FRM   N/*S*`.
- `arquivo de dados de forma gravado em  `.
- `TERMINO DO ARQUIVO`.
- `Atencao !!`; `As alteracoes executadas nao foram gravadas.`; `A geracao de dados para Desenho de Viga e Pilar sera feita apos a gravacao.`.
- `Geracao dos dados para Desenho de Vigas e Desenho de Pilares`; `<V>igas - geracao .FOR         <P>ilares - geracao .CFO         <*R*>etorna`.

## 4. Entradas do usuario

- **Hotkeys de menu:** letras entre `<>` (3.1 a 3.10). As maiusculas sao o atalho; `<*X*>` marca a opcao padrao [inferido: `*` e o marcador de default, como em `N/*S*`].
- **Confirmacoes:** `S` ou `N` com padrao em maiuscula `*S*` ou `*N*` (3.2, 3.6, 3.7, 3.10).
- **Nomes e numeros:** `Numero ou Nome do Pilar/Viga/Laje *FIM*`, terminado por `*FIM*` (3.2, 3.3, 3.8).
- **Valores numericos:** `X=`, `Y=`, `Dist`, `Ang`, `Xref`, `Yref`, `Cota Basica` (formato `#####.##`, `##.##`, metros `100.0`) (3.2, 3.6).
- **Movimento de cursor:** teclas de cursor (`Movimente o cursor`), `<Enter>` para fixar, `<P>` passo.
- **Drive/diretorio:** `D` + `<Enter>`.
- **Pausa de erro:** `ESC <Enter>`.

## 5. Arquivos lidos e gravados

| Arquivo | Papel | Direcao |
|---|---|---|
| `*.FRM` | forma (dados da montagem) | gravado (via `Gravacao dos dados da Forma`); lido em FORMA (reedicao) |
| `*.FOR` | dados de desenho de Vigas | gravado |
| `*.CFO` | dados de desenho de Pilares | gravado |
| Copia anterior | `Dados anteriores copiados para` | gravado (backup) [inferido: copia de seguranca antes da gravacao] |
| `.FRM` de referencia | `Drive:\Diretorio\...\Subdiretorio dos arquivos de Formas (.FRM)` | caminho configurado |

Mensagens de caminho: `VERIFIQUE O DRIVE CONFIGURADO`; `O SEU DISCO DE DADOS ESTA COMPLETO`; `VERIFIQUE SE O DISQUETE ESTA NO DRIVE COM A PORTA FECHADA`; `VERIFIQUE O SEU DRIVE`. As tres ultimas sao de disquete (secao 9).

Formato binario de `.FRM`, `.FOR` e `.CFO`: nao decodificado (secao 10).

## 6. Calculos e processamento

FORMEDCA nao calcula esforcos. Faz geometria de amarracao e de cota:

1. **Amarracao de Pilar:** posiciona um vertice por coordenada absoluta, por eixo, por outro pilar, por viga, ou mantem a posicao. Usa distancia (`Dist`), angulo (`Ang`) ou referencia vertical/horizontal (`vert/hori`).
2. **Amarracao de Viga:** posiciona faces da viga por coordenada, eixo, pilar ou outra viga, nos sentidos X e Y.
3. **Elevacao:** alinha Vigas e Lajes a uma Cota Basica, pela face superior ou inferior, por tramo ou no conjunto.
4. **Cotas:** cria cotas horizontais, verticais e inclinadas, com referencia a eixo, pilar, viga ou borda de laje.
5. **Gravacao:** grava `.FRM`; depois gera `.FOR` (Vigas) e `.CFO` (Pilares).
6. **Falha:** `erro no processamento` e `verifique a consistencia dos seus dados`, com pausa `Acione ESC <Enter> para Continuar`. Mesmos textos de FORMA e FORMINIT.

Bloqueio de alteracao: um elemento ja alterado nao pode ser modificado de novo ate REDESENHA (3.9).

## 7. Relatorios, impressao e plotagem

FORMEDCA nao imprime nem plota. Nao ha string de relatorio no executavel. A saida de desenho e feita pelos arquivos `.FOR` e `.CFO` (secao 5), e a plotagem e de FORMPLOT (FORMA.md, secao 7).

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| `Atencao !!!  Esta Coluna nao pode ser utilizada pois foi alterada.` | Pilar de referencia ja alterado |
| `Esta Coluna nao pode ser modificada pois ja foi alterada.` | Pilar ja alterado |
| `Esta Viga nao pode ser modificada pois ja foi alterada.` | Viga ja alterada |
| `Existem Pilares ou Bordas de Lajes alteradas..` | Bloqueio de alteracao de Vigas |
| `Existem elementos alterados.` | Bloqueio de gravacao |
| `As alteracoes executadas nao foram gravadas.` | Saida sem gravar |
| `TERMINO DO ARQUIVO` | Fim de gravacao [inferido: erro ou fim de arquivo] |
| `AINDA NAO DISPONIVEL` | Funcao nao implementada nesta versao |
| `erro no processamento` | Falha de consistencia |
| `verifique a consistencia dos seus dados` | Falha de consistencia |
| `Modulo nao encontrado em ` | Submodulo ausente |
| `VERIFIQUE O DRIVE CONFIGURADO` | Drive invalido |
| `O SEU DISCO DE DADOS ESTA COMPLETO` | Disco cheio (texto de disquete) |
| `VERIFIQUE SE O DISQUETE ESTA NO DRIVE COM A PORTA FECHADA` | Disco de gravacao (obsoleto, secao 9) |
| `VERIFIQUE O SEU DRIVE` | Drive nao responde |
| run-time error R6005 / R6006 / R6007 | Erros do runtime BRUN45, nao texto de FORMEDCA |

## 9. Troca de disquete

- `Coloque o Disco FORMA no Drive`; `VERIFIQUE SE O DISQUETE ESTA NO DRIVE COM A PORTA FECHADA`; `O SEU DISCO DE DADOS ESTA COMPLETO`. Textos da versao em disquete. No codigo novo, o caminho vem do diretorio configurado (FORMA.INI).

## 10. Lacunas e incertezas

1. **Formato binario** de `.FRM`, `.FOR` e `.CFO` nao decodificado. Precisa de desassemblador ou amostras reais.
2. **Hotkeys do menu principal** (3.1) estao entre `<>` no texto: sao confiaveis. Ja as do cursor e de confirmacoes (3.8, 3.10) estao sem texto de tecla em alguns pontos.
3. **Canal do `VOLTAFORMINIT`** (arquivo, variavel ou argumento) nao esta nas strings. Ver FORMINIT.md, secoes 2 e 10.
4. **Opcao `<F>orma gera Vigas+Pilares`** (3.1): a acao exata nao foi confirmada; o texto indica geracao de Vigas e Pilares, mas o vinculo com `.FOR` e `.CFO` e [inferido].
5. **Copia anterior** (`Dados anteriores copiados para`): caminho do backup nao esta nas strings.
6. **Tokens sem texto de tela**: `DESENHASOUM`, `CRUZA` / `NAOCRUZA` e `INICIAL`. O uso de cada um nao foi confirmado [inferido: `CRUZA`/`NAOCRUZA` sao modos de intersecao, como em FORMINIT].
7. **Residuos binarios** nos fins de linha (`q`, `5`, `B` e `E` em varios): nao sao texto. O texto exato deve ser conferido no executavel original.
8. **Typos mantidos** (`Corfirme`, `Escolho`, `Denife`, `Cota Baica`, `referenia`): sao o texto original, nao erro desta especificacao.
9. **Elevacao das Lajes**: o alinhamento e feito no LAJE; o FORMEDCA so mostra a cota relativa. Nao ha prova de chamada a LAJE nas strings [inferido].
10. **Contadores e valores numericos** das cotas nao estao nas strings.
