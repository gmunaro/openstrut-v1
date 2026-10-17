# PIGRAEDI.EXE - Especificacao funcional

Fontes: strings do executavel original `PIGRAEDI.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Nas strings, a primeira letra de cada item de menu aparece perdida (ex.: `riacao` = `Criacao`, hotkey `C`). Os caracteres estranhos antes de alguns textos (`B!`, `T!,`, `"`) sao atributos de cor ou lixo e foram omitidos nas citacoes.

## 1. Papel do modulo

PIGRAEDI.EXE e um submodulo de PILAREDI. Seu titulo e `Gravacao e Leitura de Dados de Colunas de um Edificio`. Ele cria, grava, lê, cataloga e pesquisa arquivos de colunas (pilares) arquivadas em disco, com extensao `.COL`.

Em resumo, serve para persistir e recarregar a "memoria" de colunas de uma obra. O calculo nao esta aqui.

## 2. Chamada e retorno

**Chamador.** O token `PILAREDI` aparece isolado, e a mensagem `Retorno ao Modulo Basico de PILAREDI` indica que o pai e PILAREDI.

**Protocolo VOLTA: dois tokens distintos.**
- `VOLTA PIGRAEDI`: token de retorno com o proprio nome do modulo. Segue o padrao de PIPROEDI (`VOLTA PIPROEDI`).
- `VOLTA PILGEEDI`: token com o nome de outro submodulo da familia.

Esses dois tokens nao batem. Ha tres leituras possiveis [inferido]:
1. PIGRAEDI foi chamado por PILGEEDI e devolve a PILGEEDI, que e o gerenciador intermediario.
2. O token `VOLTA PILGEEDI` e resto de copia de codigo de PILGEEDI (lixo de cópia).
3. Os dois tokens sao usados em caminhos diferentes do mesmo modulo.

A leitura correta depende do codigo, que nao esta disponivel. Ver `docs/modules/PILGEEDI.md` quando for escrito, e secao 10.

**Saida normal.** Ao sair, o menu oferece `Retorno ao Menu Principal` e a instrucao `para retornar acione EXIT <Enter>`. O token `EXIT` e a tecla de saida do menu e nao um hotkey de letra [inferido].

**Encerramento do sistema.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

**Modulo ausente.** `Modulo nao encontrado em 6`. O `6` no fim e lixo ou um caractere de controle do caminho, que e montado em tempo de execucao [inferido].

**Aguarde.** `Aguarde ...%`.

## 3. Telas e menus

### 3.1 Menu principal

Titulo: `Gravacao e Leitura de Dados de Colunas de um Edificio`.

Itens, na ordem das strings. Os numeros que faltam nas strings sao deduzidos pela sequencia.

| No. | Texto exato (strings) | Texto completo deduzido | Hotkey deduzida | Destino |
|---|---|---|---|---|
| 1 | `riacao de Arquivo em disco` | `Criacao de Arquivo em disco` | C [inferido] | Criacao do arquivo `.COL` |
| 2 | `umero de Colunas Gravadas` | `Numero de Colunas Gravadas` | N [inferido] | Pesquisa do numero de colunas |
| 3 | `ravacao de Colunas` | `Gravacao de Colunas` | G [inferido] | Gravacao das colunas em memoria |
| 4 | `4  -  Ca` + `alogo de Colunas Gravadas` | `Catalogo de Colunas Gravadas` | C [inferido] | Catalogo de arquivos gravados |
| 5 | `eitura de Colunas` | `Leitura de Colunas` | L [inferido] | Leitura do arquivo para memoria |
| 6 | `6  -  Acesso ao ` + `Kbytes livres )` | `Acesso ao <...> (N Kbytes livres)` | A [inferido] | Mostra espaco livre em disco |
| 7 | `lterar Drive e Diretorio ` | `Alterar Drive e Diretorio` | A [inferido] | Troca de drive e subdiretorio de dados |
| - | `etorno ao Menu Principal` | `Retorno ao Menu Principal` | R [inferido] | Volta ao pai |
| - | `escolha opcao ` | prompt de entrada | nao aplicavel | Escolha do item |
| - | `para retornar acione EXIT <Enter>` | instrucao de saida | EXIT + Enter | Sai |

Observacoes:
- Itens 1 e 4 pareceriam ter a mesma hotkey `C`. A numeracao e a hotkey do item 1 nao aparecem nas strings, entao a atribuicao e incerta [inferido].
- Item 6 tem o texto `Acesso ao ` seguido de `Kbytes livres )`. O texto do meio nao aparece. Pode ser `Acesso ao Disco (N Kbytes livres)` [inferido].
- Item 7 nao tem numero nas strings [inferido].
- O item `Retorno ao Menu Principal` nao tem numero nas strings.

### 3.2 Opcao 1: Criacao de arquivo

Sequencia de textos:

1. Aviso: `ATENCAO !  `.
2. `A criacao do arquivo, deve ser feita somente quando este ainda nao existe.`.
3. `Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido.`. O texto e um aviso de sobrescrita.
4. `O Arquivo que sera criado para gravacao das Colunas arquivadas em Memoria,` e `tera o nome da Obra arquivada com extensao .COL `. O nome do arquivo e o nome da obra, com `.COL`.
5. `Arquivadas em Memoria`. Titulo de tela.
6. `Colunas da Obra %`. O `%` e um campo variavel do nome da obra [inferido].
7. Se nao houver colunas: `Nao ha Colunas Arquivadas na Memoria`.
8. `Nome do arquivo *`. Entrada do nome. O `*` marca o campo de entrada [inferido].
9. `NAO CRIAR`. Opcao de cancelar a criacao [inferido].
10. Token `ERRCOL&`. Ver secao 8.
11. Cabecalho: linha de assinatura do formato, gravada pelo programa, e `Obra - `.
12. Confirmacao: `Arquivo con dados de PILARES inicializado em `. Typo `con` nas strings (deve ser `com`). A mesma frase aparece sem o typo em `Arquivo com dados de PILARES inicializado em `.

### 3.3 Opcao 3: Gravacao de colunas

1. Titulo: `Gravacao de Colunas`.
2. `Colunas referentes a Obra `.
3. `Nome da Obra *`. Entrada do nome da obra.
4. `Continuo N/*S* `. Confirmacao, default `S`.
5. `Aguarde ..`.
6. Backup: `.BAK ` e `Dados anteriores copiados para ` seguido de `.BAK     Aguarde ...`. Antes de sobrescrever, o arquivo anterior e copiado para um `.BAK`.
7. Cabecalho: linha de assinatura do formato, gravada pelo programa.
8. `Arquivo com dados de PILARES inicializado em `.
9. Campos do arquivo: `=NUMERO DE NIVEIS` e `=NUMERO DE COLUNAS`. Ver secao 5.

### 3.4 Opcao 2: Numero de colunas gravadas (pesquisa)

- Titulo: `Pesquisa do Numero de Colunas Gravadas`.
- Entrada: `Nome do Arquivo a Pesquisar *FIM* `. `*FIM*` e a palavra de saida.
- Erro se nao existir: `ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR `.

### 3.5 Opcao 4: Catalogo

- Titulo: `Catalogo de Colunas Gravadas em Disco#`.
- Entrada: `Nome do Arquivo a Catalogar *FIM* `.
- Campo: `GravadasO` (texto truncado, `O` pode ser lixo) e `Colunas `.
- Cabecalho de tabela: `Pos  Coluna         inicio         termino`.
- Separador de colunas: `###  \          \ \            \ \            \`. Mascara de largura fixa.
- Linha de titulo de coluna: `Colunas   * interrompe`. `*` interrompe a listagem.
- Paginacao: `Qualquer Tecla para Continuar %`.

### 3.6 Opcao 5: Leitura de colunas

- Titulo: `Leitura de Colunas Gravadas em Disco`.
- Opcao: `RETORNO`.
- Aviso de sobrescrita: `Os Dados em memoria das Colunas da Obra v` + `serao Perdidos  SIM/*N* `. Confirmacao antes de sobrescrever a memoria, default `N`.

### 3.7 Opcao 7: Drive e diretorio

- `Drive que contem o Disco de Dados `.
- Formato de caminho: `\Diretorio\Subdiretorio\...\`.
- `Subdiretorio `.
- Erro: `ATENCAO ! ..  Drive e Diretorio nao encontrados`.
- Criacao: `Crio o Diretorio `; `S/*N*`; `Criando Diretorio     Aguarde ...`.
- Hint: `Acione  D <Enter>  para alterar Drive e Diretorio`. Confirma o hotkey `D` para mudar drive e diretorio.
- Vazio: `Nenhum Arquivo Encontrado`.

## 4. Entradas do usuario

| Campo | Prompt exato | Formato | Default |
|---|---|---|---|
| Nome da obra | `Nome da Obra *` | texto; vira nome do `.COL` | nenhum |
| Nome do arquivo (criacao) | `Nome do arquivo *` | texto, com `.COL` implicito | nome da obra [inferido] |
| Nome do arquivo (pesquisa) | `Nome do Arquivo a Pesquisar *FIM* ` | texto; `*FIM*` sai | nenhum |
| Nome do arquivo (catalogo) | `Nome do Arquivo a Catalogar *FIM* ` | texto; `*FIM*` sai | nenhum |
| Continuar gravacao | `Continuo N/*S* ` | S/N | `S` |
| Sobrescrever memoria | `serao Perdidos  SIM/*N* ` | SIM/N | `N` |
| Criar diretorio | `Crio o Diretorio ` + `S/*N*` | S/N | `S` |
| Drive de dados | `Drive que contem o Disco de Dados ` | letra de unidade | nenhum |
| Subdiretorio | `Subdiretorio ` | formato `\Dir\Sub\...\` | nenhum |
| Escolha de menu | `escolha opcao ` | numero 1 a 7 ou hotkey | nenhum |
| Confirmar parametros | `Materiais arquivados NAO conferem com os configurados. Altero N/*S* ` | S/N | `S` |

Limites de capacidade (ver secao 8):
- Nivel, coluna, vertice de poligonal, barra e variacao de armadura. Os limites numericos nao aparecem nas strings [inferido].

Unidades: `Kbytes` para o espaco livre.

## 5. Arquivos lidos e gravados

| Arquivo | Acao | Quando | Formato inferido |
|---|---|---|---|
| `<obra>.COL` | criado, gravado, lido, pesquisado, catalogado | opcoes 1, 3, 5, 2, 4 | arquivo de colunas com cabecalho `NUMERO DE NIVEIS` e `NUMERO DE COLUNAS` |
| `<obra>.BAK` | copia de seguranca | antes de sobrescrever na gravacao | copia byte a byte do `.COL` anterior [inferido] |
| `PILAR.INI` / `SISTRUT.PIP` | lidos para comparar materiais e parametros | confirmacao de materiais | parametros Fck, Fyk, tipo de aco, cobrimento, parametrizacao [inferido] |
| Drive e diretorio de dados | lidos e, se necessario, criados | opcao 7 | `\Diretorio\Subdiretorio\...\` |

Nomes de arquivo de erro: `ERRCOL&` e `ERRPIL/`. Sao tokens com `&` e `/` no fim, nao extensoes. Pode ser um nome de log ou de codigo de erro [inferido].

Formato interno do `.COL`: nao ha como afirmar. Os rotulos `NUMERO DE NIVEIS` e `NUMERO DE COLUNAS` sugerem um cabecalho com contagens, seguido de registros por coluna (`Pos`, `Coluna`, `inicio`, `termino` na listagem) [inferido].

## 6. Calculos

Nenhum calculo estrutural no modulo. O modulo nao traz termo de flambagem, excentricidade, flexo-compressao ou armadura.

Dados que sao gravados e lidos (segundo os limites da secao 8):
- Niveis de pilares.
- Colunas arquivadas.
- Vertices de poligonal da secao.
- Barras de armadura.
- Variacoes de armadura.
- Materiais: Fck, Fyk, tipo de aco, cobrimento.
- Parametrizacao.

## 7. Relatorios e impressao

Nenhum relatorio impresso neste modulo. A listagem do catalogo (opcao 4) e mostrada na tela com `Qualquer Tecla para Continuar`. Nao ha string de impressora (`Ajuste a Impressora`) nas strings deste modulo.

## 8. Mensagens de erro

| Texto exato | Observacao |
|---|---|
| `ATENCAO !  ` | aviso de criacao de arquivo |
| `Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido.` | aviso de sobrescrita |
| `Nao ha Colunas Arquivadas na Memoria` | nao ha dados para gravar |
| `ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR ` | arquivo nao encontrado |
| `Nenhum Arquivo Encontrado` | busca sem resultado |
| `ATENCAO ! ..  Drive e Diretorio nao encontrados` | caminho invalido |
| `Acione  D <Enter>  para alterar Drive e Diretorio` | pede ao usuario trocar o caminho |
| `NUMERO DE NIVEIS INSUFICIENTE` | limite de niveis estourado |
| `NUMERO MAXIMO DE COLUNAS ARQUIVADAS INSUFICIENTE` | limite de colunas |
| `NUMERO MAXIMO DE VERTICES DA POLIGONAL INSUFICIENTE` | limite de vertices |
| `NUMERO MAXIMO DE BARRAS INSUFICIENTE` | limite de barras |
| `NUMERO MAXIMO DE VARIACOES DA ARMADURA INSUFICIENTE` | limite de variacoes |
| `Materiais arquivados NAO conferem com os configurados. Altero` | conflito de parametros, pede confirmacao |
| `CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA ` | capacidade do modulo menor que o arquivo |
| `O SEU DISCO DE DADOS ESTA LOTADO ` | disco cheio |
| `VERIFIQUE O SEU DRIVE ` | drive com problema |
| `erro no processamento` | erro generico |
| `verifique a consistencia dos seus dados` | orientacao |
| `Acione ESC <Enter> para Continuar ` | prosseguir apos erro |

Comparacao de materiais: cada linha compara o valor arquivado com o configurado. Textos: `Fck arquivado` / `Fck configurado`, `Fyk arquivado` / `Fyk configurado`, `tipo de Aco arquivado` / `tipo de Aco configurado`, `Cobrimento arquivado` / `Cobrimento configurado`, `Parametrizacao arquivada` / `Parametrizacao configurada`. O `Altero N/*S*` e a confirmacao.

## 9. Obsolescencia

`Coloque o Disco PILAREDI no Drive ` e troca de disquete. A opcao 7 substitui isso no sistema reconstruido [inferido].

## 10. Lacunas e incertezas

1. Retorno: `VOLTA PIGRAEDI` e `VOLTA PILGEEDI` nao batem. Nao se sabe qual e o correto (secao 2).
2. Hotkeys dos itens 1 e 4 (ambos `C`) e do item 7 (`A`, conflito com o item 6). Numeros de itens 1 e 7 nao aparecem nas strings.
3. Texto completo do item 6 (`Acesso ao ...`).
4. Formato interno do `.COL`: registros, tamanhos, ordem.
5. `ERRCOL&` e `ERRPIL/`: nomes de arquivo de erro ou codigos. Sem o codigo, nao se confirma.
6. `SOSECAO` (PIPROEDI) nao aparece aqui. Sem relacao confirmada.
7. Limites numericos dos campos de capacidade: os valores nao estao nas strings.
8. Se `PILAR.INI` e `SISTRUT.PIP` sao realmente lidos para a comparacao de materiais. Ver `docs/modules/PILAR.md`.
9. A quebra `Arquivo con` (typo) x `Arquivo com`. Pode ser duas telas diferentes, ou uma correcao posterior.
