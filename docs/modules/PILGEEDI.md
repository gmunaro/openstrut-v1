# PILGEEDI.EXE - Especificacao funcional

Fontes: strings do executavel original `PILGEEDI.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Nas strings do executavel, a primeira letra de varios itens aparece perdida (ex.: `iveis de referencia` = `Niveis de referencia`). As hotkeys sao deduzidas dessa letra perdida e marcadas [inferido]. Os caracteres soltos no fim de algumas linhas (`6;`, `7`, `N(`, `#`) sao atributos de cor, contadores ou lixo e foram omitidos nas citacoes.

## 1. Papel do modulo

PILGEEDI.EXE e um submodulo de PILAREDI que define os dados de carregamento e vinculo das colunas arquivadas. O titulo da tela principal e `Definicao dos dados de Colunas`, com `Numero maximo de Colunas -` e `Posicionadas`.

Ele cobre: niveis de referencia, esforcos externos (normal e momento, inclusive vento), vinculos de extremidade (travamentos), leitura de carga e geometria de arquivos `.REP`/`.RLP`, e impressao dos dados. Tambem permite ler momentos de engaste de vigas a partir de arquivos `.VIG`/`.SEC`.

Nao ha calculo estrutural de flexo-compressao, esbeltez ou armadura nas strings deste modulo. O modulo coleta e organiza dados de entrada.

## 2. Chamada e retorno

**Chamador.** O token `PILAREDI` aparece isolado e a mensagem `Retorno ao Modulo Basico de PILAREDI` indica que o pai e PILAREDI.

**Protocolo VOLTA.** O token e `VOLTA PILGEEDI`, o proprio nome do modulo. Isso segue o padrao de PIPROEDI (`VOLTA PIPROEDI`) e de PIGRAEDI (`VOLTA PIGRAEDI`) [inferido].

Consequencia para PIGRAEDI: as strings de PIGRAEDI tambem trazem `VOLTA PILGEEDI`. Como cada submodulo carrega o proprio `VOLTA <nome>`, esse token em PIGRAEDI e mais provavelmente resto de copia do codigo de PILGEEDI do que um retorno real. Ver `docs/modules/PIGRAEDI.md`, secao 2.

**Saida normal.** Pelo menu, sai com `Retorno ao Menu Principal` e o prompt `escolha opcao `.

**Encerramento do sistema.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

**Modulo ausente.** `Modulo nao encontrado em `. Ao contrario de PIGRAEDI, o texto termina em espaco, sem o `6`. O nome ou caminho e concatenado em tempo de execucao [inferido].

**Aguarde.** `Aguarde ...%`. Tambem aparece em `Aguarde ...`.

**Token sem tela.** O EXE tem a string `PILESEDI` e `PILGEEDI` no cabecalho. `PILESEDI` nao tem texto de tela. Pode ser o nome de outro modulo chamado por PILGEEDI, ou resto de runtime [inferido].

## 3. Telas e menus

### 3.1 Menu principal

Titulo: `Definicao dos dados de Colunas`. Linhas de cabecalho: `Numero maximo de Colunas -` e `Posicionadas`. A linha `Colunas` pode ser parte do titulo ou do cabecalho [inferido].

Itens, na ordem das strings. Os numeros nao aparecem nas strings e foram deduzidos pela sequencia.

| No. | Texto exato (strings) | Texto completo deduzido | Hotkey deduzida | Destino |
|---|---|---|---|---|
| 1 | `iveis de referencia` | `Niveis de referencia` | N [inferido] | Definicao dos niveis (3.6) |
| 2 | `rquivar Coluna` | `Arquivar Coluna` | A [inferido] | Tela `ENTRADA` de arquivamento (3.10) |
| 3 | `sforcos externos` | `Esforcos externos` | E [inferido] | Esforcos externamente aplicados (3.8) |
| 4 | `ento  Momentos externos` | `Vento  Momentos externos` | V [inferido] | Momentos de vento (3.8) |
| 5 | `eitura da Carga e Geometria (.REP .RLP)` | `Leitura da Carga e Geometria (.REP .RLP)` | L [inferido] | Leitura de arquivos de carga (3.4) |
| 6 | `ravamentos horizontais` | `Travamentos horizontais` | T [inferido] | Vinculos de extremidade (3.7) |
| 7 | `mpressao dos dados` | `Impressao dos dados` | I [inferido] | Relatorio (7) |
| - | `etorno ao Menu Principal` | `Retorno ao Menu Principal` | R [inferido] | Volta ao PILAREDI |
| - | `escolha opcao ` | prompt de entrada | nao aplicavel | Escolha do item |

Observacoes:
- Os itens 1 a 7 sao numerados por ordem de aparicao nas strings. A numeracao real nao esta nas strings [inferido].
- `NIVEIS` e `COLUNA` aparecem logo depois do menu. Sao rotulos de escolha entre visao por niveis e por colunas, usados por telas de definicao [inferido].
- `Posicionadas` aparece tambem no fim da tela de leitura. Confirma que o cabecalho e de tela, nao de menu.

### 3.2 Coloque o disco (obsoleta)

`Coloque o Disco PILAREDI no Drive `. Troca de disquete. Ver secao 9.

### 3.3 Erros de disco

`VERIFIQUE O SEU DRIVE `. `Acione  D <Enter>  para alterar Drive e Diretorio`. `Nenhum Arquivo Encontrado#`. Ver secao 4.

### 3.4 Leitura de arquivos de carga e geometria (.REP/.RLP)

1. Titulo: `Leitura de Arquivos de Cargas e Geometria (.REP e .RLP)`.
2. Campo de drive: `Drive que contem o Disco de Dados `. Formato: `\Diretorio\Subdiretorio\...\`. `Subdiretorio `.
3. Nome do arquivo: `Nome do Arquivo Carregamento  *RETORNO* `. `*RETORNO*` volta ao menu sem ler.
4. Erro de leitura: `ERRREP`. Token de nome de arquivo de erro (ver secao 5).

### 3.5 Entrada de cargas por nivel e coluna

1. `* <Enter>  para visualizar os Niveis definidos`. Os niveis tem o `6;` no fim, lixo.
2. `Numero ou Nome do Nivel onde as cargas serao introduzidas `.
3. Confirmacao de nivel: `Confirme Nivel  N (` seguido de `N/*S*`. Default `S`.
4. `Mantenho as Cargas ja arquivadas deste Nivel S/*N* `. Default `N`.
5. Tabela: `Cargas Totais`.
6. Por coluna: `Confirme carga `, `Na coluna      `.
7. Opcoes da primeira variante: `<M>axima  <+>Soma  <N>ao  <A>bandona  <*S*>im `. Default `S`.
8. Opcoes da segunda variante: `<M>axima  <+>Soma  <S>im  <A>bandona  <*N*>ao `. Default `N`. A diferenca de default sugere duas situacoes distintas de confirmacao [inferido].
9. Textos auxiliares `MAXIMA` e `SIMSOMA`: rotulos das opcoes, cortados.
10. Erro: `..NAO ENCONTRADO NOME CORRESPONDENTE`. Nome da coluna ou nivel nao existe.

### 3.6 Definicao dos niveis

1. Titulo: `Definicao dos Niveis das Colunas`.
2. `Numero maximo de Niveis - `.
3. Prompt: `Entre com o valor do Nivel em  [?` e `]  ou use os codigos auxiliares`. A unidade esta no `[?` e nao foi lida.
4. Codigos auxiliares (ordem das strings):
   - `* n` pular para o nivel n.
   - `A x` acrescentar no ultimo nivel o valor x.
   - `R x,y` repetir o acrescimo x por y vezes.
   - `C` cancela todos os anteriores.
   - `I x` inclui um novo nivel x antes do indicado.
   - `S x` soma x em todos os niveis superiores a partir do indicado.
   - `D` deleta o nivel indicado.
5. `Nivel (`, `[`, `,Nome do Nivel`.
6. Cancelamento: `Confirme CANCELAR os dados de Niveis S/*N* `. Default `N`.
7. Atualizacao: `Atualizo os dados das colunas ja arquivadas N/*S* `. Default `S`.

### 3.7 Vinculos de extremidade (travamentos)

1. Titulo: `Definicao dos Vinculos de extremidade`.
2. Texto de regra: `Todas as colunas sao inicialmente consideradas TRAVADAS em ambos os sentidos, em todos os niveis pelos quais as mesmas estao atravessando inclusive em suas extremidades.`. `Forneca caso existam, para cada uma das colunas arquivadas, os Niveis e, sentidos onde as mesmas nao estao travadas.`.
3. Campo de coluna: `Numero da Posicao ou Nome da Coluna  *FIM* `. `*FIM*` encerra a entrada.
4. Campos de faixa: `inicio N(`, `termino N(`, `Nivel *FIM* `.
5. Confirmacao: `Qualquer tecla para alterar  ou  <Enter> para aceitar`.
6. Eixos e tipos de vinculo:
   - `Rx` e `Ry`: dois sentidos.
   - Tipos: `continuidade`, `livre`, `engastado`, `semi-engaste`.
7. Tabela: `Nivel    Rx   Ry` e mascara `### \      \ \\   \\`.

### 3.8 Esforcos externos

1. Titulo: `Definicao dos Esforcos Externamente Aplicados`.
2. Tipos: `Normal + Momento externo` e `Momento de Vento acidental`.
3. Rotulo: `Posicionadas` e `Colunas`.
4. Escolha: `Deseja fornecer os dados para uma <C>oluna ou para um <N>ivel  *FIM* `. Hotkeys `C`, `N`, `FIM`.
5. Coluna: `Numero da posicao ou Nome da Coluna *RETORNO* `. `*RETORNO*` volta.
6. Igualar coluna: `Caso deseje igualar a Coluna  `, `a alguma outra coluna ja definida,`, `(sendo que os dados de carga ja tenham sido fornecidos para esta outra coluna)`, `digite o Numero da posicao ou Nome completo da coluna`, `correta N/*S* `. Default `S`.
7. Faixa de niveis: `Coluna  - `, `termino - Nivel (`, `inicio  - Nivel (`, `Nivel *FIM* `.
8. Rotulo `COLUNA`.
9. Campos da tabela de momentos (ordem nas strings): `Nk`, `Ma`, `Ina`, `Mb`, `Inb`, `Mc`, `Inc`, `Md`, `Ind`.
10. `*n para igualar ao Nivel n`. Equivale a copiar os dados de outro nivel.
11. `Nk`. `Momento [,Viga,Jvig/Lvig]  e  Inclinacao`. A entrada de momento pode referenciar uma viga e a inercia `Jvig/Lvig` [inferido].
12. Cabecalhos de tabela: `Nivel       Nk      Ma Incl     Mb Incl     Mc Incl     Md Incl`, `Nivel     Nk      Ma Incl     Mb Incl`. Mascaras `\ \    \  \ \ \    \` e `### \      \ ####.## `, `### \      \ ####### `. A mascara `####.##` tem duas casas decimais.
13. Rotulos dos niveis: `Nivel     `, `1            \ \`.

### 3.9 Igualar niveis

1. `Numero ou Nome do Nivel *RETORNO* `.
2. `Caso deseje igualar o Nivel  `, `a algum outro nivel ,`, `(sendo que os dados de carga ja tenham sido fornecidos para este outro nivel)`, `digite o Numero ou Nome completo do nivel `, `nivel correto N/*S* `. Default `S`.
3. `Para igualar varios Niveis simultaneamente, digite o numero ou nome do Nivel`, `superior ao Nivel `, `, fazendo com que todos os niveis intermediarios a estes dois niveis, tambem recebao as cargas do Nivel `. Nota: o texto diz `recebao`, typo do original.
4. `*SO ESTE*`. Opcao de copiar so para este nivel.
5. `Nivel (`. `Coluna *FIM* `. `NIVEL`.
6. Erro: `... nao definida neste nivel!`. A coluna nao tem dados neste nivel.

### 3.10 Arquivar coluna (tela ENTRADA)

1. Rotulo `ENTRADA`.
2. Titulo: `Arquivo de Colunas para dimensionamento`.
3. Contagem: `Numero maximo de Colunas -`, `posicionadas`.
4. Campos: `Posicao *`, `Nome da Obra`, `( POSICAO`, `Nome da Coluna *RETORNO* `, `maximo de 20 caracteres`. O nome da coluna tem limite de 20 caracteres.
5. Faixa de niveis: `Entre com o numero ou nome do Nivel onde comeca e termina a Coluna.`. `* <Enter>  para visualizar os Niveis definidos`. `Nivel inferior `, `Nivel superior `.
6. Confirmacao: `Dados Corretos N/*S* `. Default `S`.
7. Navegacao: `<Anteriores>  <R>etornar  Proximos<`. Fragmento `MOS` e resto de `Proximos`.

### 3.11 Impressao

1. Titulo: `Impressao dos Niveis, Esforcos Externos e Travamentos`.
2. Escolha de visao: `Deseja Visualizar os dados por <C>olunas ou por <N>iveis  *FIM* `.
3. Geometria: `Imprimo os Dados Geometricos  S/*N* `. Default `N`.
4. Faixa de posicoes: `Numero da Posicao das Colunas que serao Visualizadas`. `I/J/N a M/... /K *RETORNO* `. Mesma sintaxe de PIPROEDI.
5. Avanco: `<Enter> `, `para seguir `, `ou  `, `* <Enter> `, `para nao avancar o formulario `.
6. Cabecalho da coluna: `Coluna  `, `        Inicio     N(`, `        Termino    N(`.
7. Tabela de niveis: `NIVEL    *    P E R M A N E N T E S    *    V E N T O`. `Carga  Acumulada  Ma Incl   Mb Incl   Mc Incl   Md Incl  Nkv   Ma Incl   Mb Incl`. Mascara `### \     \`.
8. Niveis a visualizar: `Numero dos Niveis que serao Visualizados`. `Nivel  `.
9. Tabela de colunas: `    COLUNA      *    P E R M A N E N T E S    *    V E N T O`. Mascara `###     \           \`.

## 4. Entradas do usuario

| Campo | Prompt exato | Formato | Default |
|---|---|---|---|
| Nome do arquivo de carga | `Nome do Arquivo Carregamento  *RETORNO* ` | nome; `*RETORNO*` volta | nenhum |
| Drive de dados | `Drive que contem o Disco de Dados ` | letra de unidade | nenhum |
| Subdiretorio | `Subdiretorio ` | formato `\Dir\Sub\...\` | nenhum |
| Nivel de carga | `Numero ou Nome do Nivel onde as cargas serao introduzidas ` | numero ou nome | nenhum |
| Confirmar nivel | `Confirme Nivel  N (` + `N/*S*` | S/N | `S` |
| Manter cargas | `Mantenho as Cargas ja arquivadas deste Nivel S/*N* ` | S/N | `N` |
| Carga da coluna | `Confirme carga ` + `Na coluna      ` | opcoes `<M>axima`, `<+>Soma`, `<N>ao`, `<A>bandona`, `<*S*>im` | `S` (1a variante) ou `N` (2a) |
| Codigo do nivel | `Entre com o valor do Nivel em  [?` | valor numerico ou codigo auxiliar (`*`, `A`, `R`, `C`, `I`, `S`, `D`) | nenhum |
| Acrescimo de niveis | `A x`, `R x,y`, `I x`, `S x` | numeros | nenhum |
| Cancelar niveis | `Confirme CANCELAR os dados de Niveis S/*N* ` | S/N | `N` |
| Atualizar colunas | `Atualizo os dados das colunas ja arquivadas N/*S* ` | S/N | `S` |
| Confirmacao de vinculo | `Qualquer tecla para alterar  ou  <Enter> para aceitar` | tecla ou `<Enter>` | `<Enter>` aceita |
| Tipo de vinculo | `continuidade`, `livre`, `engastado`, `semi-engaste` em `Rx`, `Ry` | escolha por tela | nao identificado |
| Posicao ou nome da coluna | `Numero da Posicao ou Nome da Coluna  *FIM* ` | numero ou nome, ate 20 caracteres | nenhum |
| Nivel inicial e final | `inicio N(`, `termino N(`, `Nivel *FIM* ` | numero ou nome de nivel | nenhum |
| Escolha coluna/nivel | `Deseja fornecer os dados para uma <C>oluna ou para um <N>ivel  *FIM* ` | `C`, `N` ou `FIM` | nenhum |
| Igualar coluna | `digite o Numero da posicao ou Nome completo da coluna correta N/*S* ` | S/N | `S` |
| Igualar nivel | `digite o Numero ou Nome completo do nivel nivel correto N/*S* ` | S/N | `S` |
| Igualar varios niveis | `digite o numero ou nome do Nivel superior ao Nivel` | numero ou nome | nenhum |
| Usar arquivos VIG/SEC | `Prossigo com a Leitura (caso contrario definicao manual) N/*S* ` | S/N, ou `MANUAL`/`LEITURA` | `S` |
| Alterar drive ao faltar VIG/SEC | `Deseja alterar Drive e Diretorio para encontra-los  S/*N* ` | S/N | `N` |
| Definir secao das vigas | `Defino secao para as Vigas N/*S* ` | S/N | `S` |
| Secao da viga | `Secao da Viga `, `Bw , Hw (cm) ` | `Bw` e `Hw` em centimetros | nenhum |
| Visao da impressao | `Deseja Visualizar os dados por <C>olunas ou por <N>iveis  *FIM* ` | `C`, `N`, `FIM` | nenhum |
| Imprimir geometria | `Imprimo os Dados Geometricos  S/*N* ` | S/N | `N` |
| Posicoes a visualizar | `I/J/N a M/... /K *RETORNO* ` | faixa de letras/posicoes | nenhum |
| Niveis a visualizar | `Numero dos Niveis que serao Visualizados` | numero ou nome | nenhum |
| Arquivar coluna: posicao | `Posicao *` | numero | nenhum |
| Arquivar coluna: obra | `Nome da Obra` | texto | nenhum |
| Arquivar coluna: nome | `Nome da Coluna *RETORNO* ` | texto, ate 20 caracteres | nenhum |
| Arquivar coluna: faixa | `Nivel inferior `, `Nivel superior ` | nivel | nenhum |
| Confirmar dados da coluna | `Dados Corretos N/*S* ` | S/N | `S` |

Unidades: comprimento em cm (`Bw , Hw (cm)`). Demais unidades de carga, momento e nivel nao aparecem nas strings; `[?` na linha de nivel sugere unidade lida em tela, perdida nas strings.

Limites: `Numero maximo de Niveis`, `Numero maximo de Colunas`, nome de coluna de 20 caracteres. `MAXIMO DE 4 MOMENTOS SIMULTANEOS POR COLUNA/PAVIMENTO` limita a quatro os momentos por coluna e pavimento.

## 5. Arquivos lidos e gravados

| Arquivo | Acao | Quando | Formato inferido |
|---|---|---|---|
| `*.REP` e `*.RLP` | lidos | Opcao 5, leitura de carga e geometria | cargas e geometria exportadas por outro modulo [inferido] |
| `ERRREP` | token de nome de arquivo de erro | falha na leitura de `.REP`/`.RLP` | nome de log de erro [inferido] |
| `<obra>.VIG` | lido | Ao definir engastes de vigas | secoes e dados de vigas [inferido] |
| `<obra>.SEC` | lido | Ao definir engastes de vigas | secoes das vigas `Bw, Hw` [inferido] |
| `PILAR.INI` / `SISTRUT.PIP` | nao citados | - | nao ha referencia nas strings |
| Dados das colunas arquivadas | lidos e atualizados | opcoes 2, 3 e `Atualizo os dados das colunas ja arquivadas` | arquivo de colunas de PIGRAEDI (`.COL`) [inferido] |

Sobre o prefixo do nome dos arquivos `.VIG`/`.SEC`: o texto `Os Arquivos M` e seguido de `.VIG  ou  `, e `%.VIG` tem `%` como variavel. O nome parece ser `<obra>.VIG` e `<obra>.SEC`, com a parte inicial perdida [inferido].

Formatos de `.REP` e `.RLP` nao estao nas strings. A leitura so pode ser inferida pelos rotulos do menu.

## 6. Calculos

Nenhuma formula de esbeltez, excentricidade, flexo-compressao ou armadura nas strings. Os unicos elementos com natureza de calculo sao:

- Soma de cargas: `<+>Soma`. Acumula cargas de uma coluna no nivel.
- Maximo de cargas: `<M>axima`. Mantem o maior valor entre as entradas [inferido].
- Carga acumulada por nivel: rotulo `Carga  Acumulada`. Formula nao aparece.
- Distribuicao de momento de engaste: texto de NB-1:

  > "Para os momentos aplicados nas Colunas pelas Vigas Continuas nelas engastadas, a NB1 recomenda que estes momentos sejam distribuidos entre a Viga e a Coluna proporcionalmente a suas inercias na referida direcao."

  O modulo pede ao usuario os momentos. A distribuicao em si nao aparece como codigo nem texto de formula.
- Rigidez nula da viga quando nao definida: `esta sera considerada com rigidez nula, cabendo unicamente a coluna, a absorcao de todo o momento neste ponto aplicado.`

Referencia de norma: `NB1`. Versao (NB-1/78) nao aparece nas strings deste modulo.

## 7. Relatorios e impressao

Opcao 7 do menu, `Impressao dos Niveis, Esforcos Externos e Travamentos`. Fluxo:

1. Escolhe visao por colunas ou por niveis.
2. Decide se imprime a geometria.
3. Escolhe a faixa de posicoes e de niveis.
4. Imprime em formulario continuo. `<Enter> para seguir` e `* <Enter> para nao avancar o formulario` controlam o avanco de pagina.

Cabecalhos das tabelas:
- Coluna com `Inicio` e `Termino`.
- Tabela de niveis: `NIVEL` com colunas `PERMANENTES` e `VENTO`. Campos `Carga Acumulada`, `Ma`, `Mb`, `Mc`, `Md` com `Incl`, e `Nkv`.
- Tabela de colunas: `COLUNA` com `PERMANENTES` e `VENTO`.

Mascaras: `### \     \`, `###     \           \`.

Nao ha string de impressora (`Ajuste a Impressora`) nas strings deste modulo. Ao contrario de PIPROEDI, nao ha aviso de alinhamento.

## 8. Mensagens de erro

| Texto exato | Observacao |
|---|---|
| `Nenhum Arquivo Encontrado#` | busca sem resultado |
| `VERIFIQUE O SEU DRIVE ` | unidade com problema |
| `Acione  D <Enter>  para alterar Drive e Diretorio` | pede troca de caminho |
| `ERRREP` | erro de leitura de `.REP`/`.RLP` |
| `..NAO ENCONTRADO NOME CORRESPONDENTE` | nome de coluna ou nivel nao existe |
| `Os Arquivos M` / `.VIG  ou  ` / `.SEC nao foram encontrados em ` | VIG/SEC ausentes |
| `MAXIMO DE 4 MOMENTOS SIMULTANEOS POR COLUNA/PAVIMENTO` | limite de 4 momentos |
| `erro no processamento` | erro generico |
| `verifique a consistencia dos seus dados` | orientacao |
| `Acione <ESC> para Continuar ` | prosseguir apos erro |
| `... nao definida neste nivel!` | coluna sem dados neste nivel |
| `Modulo nao encontrado em ` | modulo filho ausente |

Erros de runtime BRUN45 nao sao regra de negocio. Ficam fora desta spec.

## 9. Obsolescencia

`Coloque o Disco PILAREDI no Drive ` e troca de disquete. No sistema reconstruido, o caminho vem do diretorio de dados [inferido, mesmo padrao de PIGRAEDI secao 9].

## 10. Lacunas e incertezas

1. Numeracao e letras perdidas dos itens do menu (secao 3.1). `ento  Momentos externos` pode ser `Vento` ou outra palavra, com `V` nao confirmado.
2. Significado de `Ma`, `Mb`, `Mc`, `Md`, `Ina`, `Inb`, `Inc`, `Ind`, `Nk`, `Nkv` e `Jvig/Lvig`. As siglas nao tem definicao nas strings [inferido].
3. Unidade do nivel `[?`: o caractere foi perdido.
4. Prefixo de `.VIG`/`.SEC` (secao 5): nome completo nao confirmado.
5. Formato de `.REP` e `.RLP`: nao esta nas strings. Se e exportado por outro modulo (ex.: FORMA ou LAJE), precisa confirmar nas specs desses modulos.
6. Sentido de `continuidade` e de `Rx`/`Ry` no vinculo de extremidade [inferido].
7. Diferenca entre as duas variantes de confirmacao de carga (default `S` x `N`, secao 3.5). Nao se sabe quando cada uma aparece.
8. Ligacao de `PILESEDI` com este modulo. Sem tela nas strings.
9. Se PILGEEDI grava algum arquivo: as strings nao tem texto de gravacao (`Gravacao`, `criado`, `.BAK`). A tela `Atualizo os dados das colunas ja arquivadas` sugere atualizacao de dados ja arquivados, mas nao diz se e em disco ou em memoria.
10. `VOLTA PILGEEDI` em PIGRAEDI (ver secao 2 e `docs/modules/PIGRAEDI.md`).
11. `PILAR.INI` e `SISTRUT.PIP` nao aparecem nas strings deste modulo. Confirmar em `docs/modules/PILAR.md`.
12. Texto com typo `recebao` e `Entre com ... Nivel em  [?`: verificar se sao do original ou de corrupcao na extracao das strings.
