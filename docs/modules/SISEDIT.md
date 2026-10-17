# SISEDIT.EXE - Especificacao funcional

Fontes: strings do executavel original `SISEDIT.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Residuos binarios no fim de linhas (`8`, `5`, `&`, `ò`, `ì`, `7`) nao sao texto.

## 1. Papel do modulo

SISEDIT.EXE e o editor de texto ASCII do sistema. Abre, edita por linha e grava os arquivos de parametrizacao (`.INI`, e os fixos `SISTRUT.DSP`, `SISTRUT.LAP`, `SISTRUT.PIP`). O cabecalho se identifica como `EDITOR`.

Os arquivos de parametrizacao sao texto ASCII editavel com qualquer editor.

## 2. Chamada e retorno

**Entrada.** Lancado pelo launcher com `SHELL` para `<unidade>:\SISTRUT\EXEC40\SISEDIT.EXE`, sem argumentos [inferido: reconstrucao `src-reconstructed/SISTRUT.BAS`, `modExec(13)="SISEDIT"`, sub `RunModule`]. O caminho `:\SISTRUT\EXEC40\` aparece no binario.

**Variavel de ambiente.** `COMSPEC`. Uso nao confirmado (lacuna 4).

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`.

**Retorno ao gerenciador.** `Retorno ao Modulo Gerenciador`. Mesma frase de FORMA e FORMINIT. O canal exato do retorno nao esta nas strings [inferido].

**Espera.** `Aguarde ...` e `Aguarde ..`.

**Submodulo ausente.** `Modulo nao encontrado em M`. O caractere `M` no fim e residuo, mas pode ser a inicial de uma variavel de caminho [inferido]. O padrao completo e `Modulo nao encontrado em ` + caminho, como em FORMA.

**Nome do sistema.** `SISTRUT`. Usado no cabecalho e na mensagem de submodulo.

## 3. Telas e menus

### 3.1 Cabecalho e barra de estado

- Cabecalho: `Versao 4.0   Abril 1991     EDITOR`.
- Campos de posicao: `Arquivo:                                           Linha:        Coluna:`. Os espacos sao campos preenchidos em tempo de execucao [inferido].
- Barra de teclas: `<ESC>=Acesso as funcoes Ler/Salvar/Deletar/Incluir/Fim     <F1>=Informacoes`.
- Espaco livre: `Memoria Livre disponivel`. O valor numerico nao esta nas strings.

### 3.2 Menu de funcoes

Linha de menu: `Ler    Salvar    Deletar Linha    Incluir Linha    Fim     <F1>=Informacoes`.

Ordem divergente: a barra de teclas (3.1) lista `Ler/Salvar/Deletar/Incluir/Fim`; a ajuda (3.3) lista `Ler/Salvar/Incluir/Deletar/Fim`. A ordem do menu de linha e `Ler, Salvar, Deletar Linha, Incluir Linha, Fim`.

Hotkeys: nao aparecem com `<>` nas strings. As letras `L`, `S`, `D`, `I`, `F` sao deducao pelas iniciais [inferido].

### 3.3 Tela de ajuda (F1)

Titulo: `TECLAS DE FUNCIONAMENTO`.

Linhas, na ordem:

1. `movimentar o cursor`.
2. `<ESC>   acesso as funcoes Ler/Salvar/Incluir/Deletar/Fim`.
3. `<PG UP> sobe 10            <PG DN>       desce 10`.
4. `<HOME>  inicio da linha    <Ctrl>+<HOME> inicio do texto`.
5. `<END>   fim da linha       <Ctrl>+<END>  fim do texto`.
6. `<TAB>   avanca na linha    <Shift>+<TAB> retorna na linha`.
7. `<DEL>   deleta o caracter sob o cursor,`.
8. `Ao termino da edicao, salve o texto editado.`.

### 3.4 Tela de leitura e gravacao

Titulo: `GRAVACAO E LEITURA DOS ARQUIVOS`.

Texto de instrucao, em quatro blocos:

- `Para Leitura e Gravacao dos arquivos editados, forneca o nome do` / `arquivo e sua respectiva extensao caso exista .`.
- `Para alterar o Drive e o Diretorio, entre no nome do arquivo com` / `a rota completa.  exemplo:   C:\SISTRUT\EXEC40\PILAR.INI `.
- `No caso do Drive e Diretorio estarem corretos, entre somente com` / `o nome do arquivo.  exemplo: PILAR.INI`.

Prompts de nome:

- `Nome do Arquivo *RETORNO* `.
- `Nome do Arquivo  *RETORNO* `.
- `Nome do Arquivo  *ò` (residuo `ò`).
- `Nome do Arquivo  *` (linha de prompt de leitura/gravacao).

Nomes sugeridos (padrao): `SISTRUT.DSP`, `SISTRUT.LAP`, `SISTRUT.PIP`.

### 3.5 Confirmacoes

- `Confirme DELETAR  ì`. Residuo `ì`.
- `Confirme INCLUIR  N/*S* `. Padrao `S`.
- `Confirme INCLUIR  `. Variante sem opcao; a diferenca entre as duas nao esta nas strings [inferido].
- `Confirme FIM  `.

### 3.6 Mensagens de status

- `Aguarde ..`.
- `Ok leitura terminada`.
- ` Erro na leitura ....`.
- `Ok gravacao terminada`.
- ` Erro na gravacao ....`.
- `Acione <Enter> para Continuar `.

## 4. Entradas do usuario

- **Teclas de movimento:** setas (implicitas), `<PG UP>`, `<PG DN>`, `<HOME>`, `<Ctrl>+<HOME>`, `<END>`, `<Ctrl>+<END>`, `<TAB>`, `<Shift>+<TAB>`.
- **Edicao:** `<DEL>` apaga o caractere sob o cursor. Inclusao e exclusao de linha pelo menu (3.2).
- **Funcoes:** `<ESC>` abre o menu de funcoes; `<F1>` mostra a ajuda.
- **Nome do arquivo:** texto livre. Aceita nome simples (usa o drive e diretorio do padrao) ou rota completa (`C:\SISTRUT\EXEC40\PILAR.INI`). O valor `*RETORNO*` nos prompts nao tem significado explicito nas strings (lacuna 5).
- **Confirmacoes:** `S/N` com padrao em maiuscula (3.5).
- **Pausa:** `<Enter>` para continuar.

## 5. Arquivos lidos e gravados

**Leitura.** Le um arquivo ASCII informado pelo usuario, linha por linha, para o buffer de edicao. Mensagem de sucesso: `Ok leitura terminada`; falha: `Erro na leitura ....` (3.6).

**Gravacao.** Grava o buffer no arquivo informado. Mensagem de sucesso: `Ok gravacao terminada`; falha: `Erro na gravacao ....` (3.6).

**Arquivos citados.**

- Exemplo de rota completa: `C:\SISTRUT\EXEC40\PILAR.INI`. Exemplo de nome simples: `PILAR.INI`.
- Nomes padrao: `SISTRUT.DSP`, `SISTRUT.LAP`, `SISTRUT.PIP`.
- Regra de salvamento: `Salve com OUTRO NOME com a mesma extencao (Veja nota na parametrizacao)`. Isso indica que o original nao deve ser sobrescrito [inferido].

**Formato.** Texto ASCII, uma linha por registro. Nenhum formato binario aparece nas strings.

**Memoria.** `Memoria Livre disponivel` indica que o tamanho do buffer e limitado pela memoria.

## 6. Calculos e processamento

Nao ha calculo. O processamento e de texto: carregar o arquivo, mostrar linha e coluna, inserir e apagar caracteres e linhas, gravar [inferido: as funcoes do menu e as teclas de cursor].

## 7. Relatorios, impressao e plotagem

Nao ha relatorio, impressao nem plotagem neste modulo. O executavel nao tem string de impressora.

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| ` Erro na leitura ....` | Falha ao ler o arquivo |
| ` Erro na gravacao ....` | Falha ao gravar o arquivo |
| `erro no processamento` | Falha de processamento |
| `verifique a consistencia dos seus dados` | Dados inconsistentes [inferido] |
| `Modulo nao encontrado em M` | Submodulo ausente (secao 2) |
| `Acione <Enter> para Continuar` | Pausa apos erro |
| `run-time error R6005` / `R6006` / `R6007` | Runtime BRUN45, nao texto do modulo |

## 9. Regra de uso dos arquivos fixos

- `As parametrizacoes SISTRUT .DSP .LAP .PIP nao devem ser alteradas`. E uma instrucao ao usuario. Nao ha evidencia de que o editor a imponha [inferido].

## 10. Lacunas e incertezas

1. **Ordem das funcoes:** a barra de teclas e a ajuda listam Deletar e Incluir em ordens diferentes. Nao se sabe qual e a ordem real do menu.
2. **Hotkeys do menu de funcoes:** as strings nao trazem `<>` nessas linhas. As letras sao deducao (3.2).
3. **`Modulo nao encontrado em M`:** o `M` final e residuo ou parte de uma variavel. Nao confirmado.
4. **`COMSPEC`:** nao se sabe se o editor le a variavel para abrir o shell.
5. **`*RETORNO*`:** significado nao identificado. Pode ser a palavra para cancelar a leitura ou a gravacao [inferido].
6. **Limites:** tamanho maximo do arquivo, numero de linhas e de colunas nao estao nas strings.
7. **Confirmacao `Confirme INCLUIR`:** duas variantes; a diferenca nao esta nas strings.
8. **Layout da tela:** posicao das linhas e colunas nao esta nas strings. Os textos estao listados na ordem em que aparecem no executavel, nao na ordem de tela.
9. **Chamada e retorno:** o canal exato do retorno nao esta nas strings (mesma lacuna de FORMA).
