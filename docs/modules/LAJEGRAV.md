# LAJEGRAV — Gravação e leitura do painel de lajes em disco

Fontes: strings do executável original `LAJEGRAV.EXE` (fora do repositório; inclui busca de nomes e da numeração do menu) e `sistrut-game/LAJE.INI`.
Convenção: `[ev: EXE]` = achado na busca no executável original. `[ev: LAJE.INI:Ln]` = linha do INI. `[inferido]` = dedução sem evidência direta.

## Papel

Criar, gravar, ler e contar as lajes arquivadas em memória de uma obra, em arquivo `.LAJ` no disco. Título: "Gravacao e Leitura de Dados de Painel / Lajes de um Edificio".

## Chamada e retorno

- Chamado pelo LAJE. Não há opção do LAJE identificada para este módulo nas strings de LAJE `[inferido]`.
- Retorno: "Retorno ao Modulo Basico de LAJE", "VOLTA LAJEGRAV", nome do módulo "LAJE". Protocolo em `_FAMILIA_LAJE.md`.
- Opção 7 do menu retorna ao menu principal [ev: EXE, "7 - Retorno ao Menu Principal"].
- "Para retornar acione EXIT <Enter>".
- Falha ao localizar o módulo de retorno: "Modulo nao encontrado em =". O sinal "=" no fim é o mesmo caso de LAJEPROC, onde aparece "6" [inferido: variável de unidade ou caminho].
- "Aguarde ...!".
- Saída do sistema: "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".

## Telas e menus

### Menu principal

Prompt "escolha opcao ". Itens numerados 1 a 7 no executável [ev: EXE, "1  -  " a "7  -  "]. A primeira letra do texto não aparece nas strings (destacada na tela). A hotkey é `[inferido]` pela primeira letra do texto.

| Nº | Hotkey `[inferido]` | Texto no executável | Função |
|---|---|---|---|
| 1 | C | "riacao de Arquivo em disco" | Criar arquivo `.LAJ` |
| 2 | G | "ravacao de Painel / Lajes" | Gravar lajes em memória |
| 3 | N | "umero de Lajes Gravadas" | Contar lajes de um arquivo |
| 4 | L | "eitura de Painel / Lajes" | Ler lajes do arquivo para memória |
| 5 | A | "Acesso ao " + "Kbytes livres )" | Mostra espaço livre do disco de dados |
| 6 | A | "lterar Drive e Diretorio " | Muda unidade e diretório |
| 7 | R | "etorno ao Menu Principal" | Sai |

Item 5 mostra "Acesso ao <drive> ( nnnn Kbytes livres )". A forma exata da linha não está completa nas strings `[inferido]`.

### Item 1 — Criação de arquivo

- Aviso em bloco "ATENCAO !":
  - "A criacao do arquivo, deve ser feita somente quando este ainda nao existe."
  - "Caso ja exista tal arquivo no Disco, ele sera inteiramente perdido."
  - "O Arquivo que sera criado para gravacao das Lajes arquivadas em Memoria,"
  - "tera o nome da Obra arquivada com extensao .LAJ"
- Lista das lajes em memória: "Arquivadas em Memoria", "Lajes da Obra ", "sem nome#" (nome default da obra).
- Sem lajes: "Nao ha Lajes Arquivadas na Memoria".
- Prompt "Nome do arquivo *". Opções: "NAO CRIAR", "*CRIAR". Default CRIAR (asterisco).
- Resultado: "Arquivo con dados de LAJES inicializado em ". O texto "con" é erro de digitação do original.
- Rótulo "ERRLAJ&". Não está claro se é nome de arquivo de erro ou rótulo interno `[inferido]`. A busca no executável achou "ERRLAJ" uma vez e não achou extensão para ele.

### Item 2 — Gravação

- Título "Gravacao de Painel / Lajes".
- "Lajes referentes a Obra ", "Obra - ".
- Prompt "Nome da Obra *" e "Nome da Obra".
- "Continuo N/*S*". Default S.
- "Aguarde ..".
- Backup: ".BAK ", "Dados anteriores copiados para ", ".BAK     Aguarde ...".
- Confirmação "*GRAVA".

### Item 3 — Número de lajes gravadas

- "Pesquisa do Numero de Lajes Gravadas".
- Prompt "Nome do Arquivo a Pesquisar *FIM*". `FIM` é o marcador de fim, ver `*FIM*` em LAJEPROC.
- Resultado: "*NUMERO", "Gravadas", "Lajes ,".

### Item 4 — Leitura

- Título "Leitura de Painel / Lajes Gravadas em Disco".
- "RETORNO" (opção de saída).
- Prompt "Nome da Obra '".
- Aviso de perda: "Os Dados em memoria das Lajes da Obra " + "serao Perdidos  SIM/*N*". Default N.
- Confirmação "*LEIA".

### Item 6 — Drive e diretório

- "Drive que contem o Disco de Dados ".
- Formato "\Diretorio\Subdiretorio\...\" e "Subdiretorio ".
- Diretório inexistente: "ATENCAO ! ..  Drive e Diretorio nao encontrados".
- Criação: "Crio o Diretorio ", "S/*N*". Default N. "Criando Diretorio     Aguarde ...".
- "Acione  D <Enter>  para alterar Drive e Diretorio".
- "Nenhum Arquivo Encontrado/".

## Entradas do usuário

| Campo | Unidade | Default |
|---|---|---|
| Opção do menu | 1–7 ou hotkey | — |
| Nome do arquivo (criação) | nome DOS | CRIAR |
| Nome da obra (gravação) | texto | "sem nome" |
| Continuar gravação | S/N | S |
| Nome da obra (leitura) | texto | — |
| Sobrescrever memória | S/N | N |
| Nome do arquivo a pesquisar | texto, termina em `FIM` | — |
| Unidade (drive) | letra | C (LAJE.INI:L1) |
| Diretório | `\dir\subdir\` | `\` (LAJE.INI:L2) |
| Criar diretório | S/N | N |

Defaults vêm de `LAJE.INI` [ev: LAJE.INI:L1-L4]: drive C, diretório `\`, e caminho `C:\SISTRUT\EXEC40\` para arquivos `.LAP`. O caminho `.LAP` não é usado por este módulo (ver Arquivos).

## Arquivos lidos e gravados

| Arquivo | Formato | Uso | Evidência |
|---|---|---|---|
| `<nome da obra>.LAJ` | não identificado `[inferido: binário com registros de laje]` | Gravado (item 2 e 1); lido (item 4); contado (item 3) | EXE ".LAJ" (2 ocorrências) |
| `<arquivo>.BAK` | cópia do `.LAJ` anterior | Criado antes de sobrescrever na gravação | EXE ".BAK" (2 ocorrências) |
| Arquivo de erro `ERRLAJ...` | não identificado | Não confirmado | EXE "ERRLAJ&" |

- Não aparecem `LAJE.INI` nem `.LAP` no executável do LAJEGRAV. O módulo não lê os parâmetros de `SISTRUT.LAP` `[ev: EXE, ausência de string]`.
- Limites de capacidade (ver Processamento) vêm dos nomes de chave de `LAJE.INI`, mas não há string do arquivo INI no executável. A ligação é `[inferido]` por nome.

## Processamento / cálculos

Não há cálculo estrutural. O módulo faz gestão de arquivo:

1. Criação: `.LAJ` novo, com aviso de sobrescrita; se o arquivo existir, é perdido.
2. Gravação: copia o `.LAJ` anterior para `.BAK`, depois grava as lajes da obra em memória.
3. Leitura: pede confirmação antes de descartar a memória atual.
4. Contagem: informa o número de lajes em um arquivo.
5. Capacidade: compara o número de entidades com os máximos configurados. Mensagens de limite insuficiente por tipo: eixos, traços de arquitetura, cargas lineares, cargas por área, traços de estrutura, pilares, vigas, memória. O LAJE.INI tem os máximos: 40 eixos, 200 traços de arquitetura, 70 cargas lineares, 70 cargas por área, 200 traços de estrutura, 100 pilares, 200 vigas, 80 lajes arquivadas [ev: LAJE.INI:L5–L12] `[inferido: mapeamento por nome]`.
6. Espaço em disco: "CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA", "O SEU DISCO DE DADOS ESTA LOTADO". A opção 5 mostra espaço livre.

## Relatórios e impressão

Nenhuma string de relatório ou de impressora neste executável.

## Mensagens de erro

- "Modulo nao encontrado em ="
- "ATENCAO ! .. Drive e Diretorio nao encontrados"
- "Nenhum Arquivo Encontrado/"
- "ESTE ARQUIVO NAO EXISTE,  FAVOR REPETIR"
- "CAPACIDADE CONFIGURADA MENOR QUE A NECESSARIA", "O SEU DISCO DE DADOS ESTA LOTADO", "VERIFIQUE O SEU DRIVE"
- "erro no processamento", "verifique a consistencia dos seus dados"
- "NUMERO MAXIMO DE ... INSUFICIENTE" para eixos, traços de arquitetura, cargas lineares, cargas por área, traços de estrutura, pilares e vigas; "MEMORIA INSUFICIENTE"

Em todas as mensagens de erro, a saída é "Acione ESC <Enter> para Continuar".

O aviso de disquete "Coloque o Disco LAJE no Drive" é obsoleto. Não reimplementar.

## Lacunas

1. Formato interno do `.LAJ` (binário ou texto, layout dos registros de laje).
2. O que `ERRLAJ&` representa.
3. Linha exata do item 5 ("Acesso ao <drive> ( ... Kbytes livres )").
4. Quem chama o LAJEGRAV e com qual opção do menu LAJE. As strings de "Lista das Lajes Arquivadas" de LAJE são candidatas, mas não confirmadas.
5. Se `LAJE.INI` é lido pelo executável. Os limites de capacidade são inferidos.
6. Hotkeys do menu (todas `[inferido]`).
7. Significado do "=" em "em =" e da palavra "Gravadas" com caractere estranho ("Gravadas╝").
