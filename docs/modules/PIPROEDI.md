# PIPROEDI.EXE - Especificacao funcional

Fontes: strings do executavel original `PIPROEDI.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Letras destacadas em menus aparecem sem a primeira letra nas strings; neste modulo nao ha menu.

## 1. Papel do modulo

PIPROEDI.EXE e um submodulo de PILAREDI (editor de pilares). Pelo nome e pelas telas, trata do "Processamento de Colunas Arquivadas Posicionadas/Colunas": pega colunas (pilares) ja arquivadas e as processa por posicao na planta [inferido quanto ao significado exato de "posicionadas"].

Nao ha tela de calculo, nem menu, nem titulo de relatorio. Ha apenas um prompt de entrada de posicoes, um aviso de impressora e tratamento de erro.

## 2. Chamada e retorno

**Chamador.** O token `PILAREDI` aparece isolado, provavelmente como nome do modulo pai usado no retorno. Mensagem de retorno: `Retorno ao Modulo Basico de PILAREDI`.

**Protocolo VOLTA.** O token de retorno e `VOLTA PIPROEDI`. Pelo padrao observado em FORMA (`VOLTAFORMINIT`), o pai le esse token para saber que o filho terminou [inferido]. O mecanismo exato (arquivo, variavel ou parametro do SHELL) nao esta nas strings [inferido].

**Saida.** Ao encerrar com o sistema inteiro, mostra `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. A saida normal para o pai usa a mensagem de retorno acima [inferido].

**Modulo ausente.** `Modulo nao encontrado em <caminho>`. O caminho e concatenado em tempo de execucao (o `$` no fim da string e o ponto de insercao) [inferido].

**Aguarde.** `Aguarde ...`. O `%` no fim do texto e lixo de comprimento ou caractere de controle [inferido].

## 3. Telas e menus

Nao ha menu. A sequencia de telas, na ordem das strings, e:

1. Titulo: `Processamento de Colunas Arquivadas` / `Posicionadas/` / `Colunas.`. As tres linhas sao fragmentos de uma mesma tela. A leitura exata da quebra de linha e incerta (ver secao 9).
2. Prompt de posicoes: `Processar posicoes I/J/N a M/.../K *RETORNO* `. Este e o unico campo de entrada do modulo.
3. Aviso de impressora: `Ajuste a Impressora `, seguido de `Acione <Enter> para seguir ou *<Enter> para anular o avanco do formulario `.
4. Troca de disco: `Coloque o Disco PILAREDI no Drive `. Obsoleta (ver secao 8).
5. Erro: `erro no processamento` / `verifique a consistencia dos seus dados` / `Acione ESC <Enter> para Continuar `.

Hotkeys: nao aplicavel. Os unicos atalhos citados sao `<Enter>`, `*<Enter>` e `ESC <Enter>`.

## 4. Entradas do usuario

| Campo | Prompt exato | Formato | Default |
|---|---|---|---|
| Posicoes | `Processar posicoes I/J/N a M/.../K *RETORNO* ` | letras de posicao separadas por `/`, faixa `I/J/N a M/.../K` | nenhum [inferido] |
| Continuar impressora | `Acione <Enter> para seguir ou *<Enter> para anular o avanco do formulario ` | `<Enter>` segue, `*<Enter>` anula avanco | [inferido] |
| Continuar apos erro | `Acione ESC <Enter> para Continuar ` | `ESC` + `<Enter>` | nao aplicavel |

- Interpretacao de `I/J/N a M/.../K`: parece ser uma lista de letras de eixo (grade de pilares) com faixa, onde `/.../` indica abreviacao [inferido]. `*RETORNO*` volta ao pai (PILAREDI) [inferido].
- Unidades, limites de letras e formato exato de cada eixo: nao existem nas strings [inferido].
- `PILAR.INI` e `SISTRUT.PIP` nao citam este modulo (confirmar em secao 9).

## 5. Arquivos lidos e gravados

As strings nao trazem nome de arquivo com extensao. Os tokens relevantes sao:

- `PILAREDI`, isolado e como alvo de disco: o modulo pai, e possivelmente o disquete de dados que o usuario deve trocar. Nao ha extensao [inferido].
- `SOSECAO`: token sem contexto. Pode ser nome de arquivo, flag de parametro ou identificador de secao. Nao ha como afirmar [inferido, incerto].
- `PATH=.\`: variavel de ambiente do runtime BRUN45, nao do modulo.
- Caminho base `<unidade>:\SISTRUT\EXEC40\` nao aparece nas strings deste modulo. Foi visto em FORMA (ver `docs/modules/FORMA.md`, secao 2). Seria o mesmo padrao [inferido].

Nao ha leitura de `.INI` nem gravacao de arquivo nas strings.

## 6. Calculos

Nenhuma string de calculo. O modulo nao traz termo de esbeltez, excentricidade, flexo-compressao ou armadura [ev: ausencia nas strings].

O "processamento" citado pode ser apenas a leitura das colunas arquivadas e a impressao das posicoes, sem calculo estrutural [inferido]. A natureza exata do processamento depende do codigo, que nao esta disponivel.

## 7. Relatorios e impressao

O modulo imprime ou prepara impressao. Evidencias:

- `Ajuste a Impressora `: pede ao operador que alinhe a impressora.
- `anular o avanco do formulario`: controle de avanco de pagina. `*<Enter>` cancela o avanco.
- `$        $:`: mascara de formato provavelmente usada em `PRINT USING` para valores numericos, com `$` de cifrao flutuante [inferido]. Pela lacuna de espacos, parece uma linha de cabecalho de tabela, nao texto do usuario [inferido].

Titulo ou cabecalho de relatorio: nao identificado.

Mensagens de erro: `erro no processamento` (erro generico), `verifique a consistencia dos seus dados` (orienta a checar os dados de entrada) e `Modulo nao encontrado em ` (modulo filho ausente no disco). Erros de runtime do BRUN45 (`Error in loading RTM`, `Out of memory`, `Disk I/O error` etc.) nao sao regras de negocio e ficam fora desta spec.

## 8. Obsolescencia

`Coloque o Disco PILAREDI no Drive ` e troca de disquete. No sistema reconstruido, o caminho vem do diretorio de dados, nao de troca de disco [inferido, mesmo padrao de FORMA secao 3.2].

## 9. Lacunas e incertezas

1. Quebra do titulo: `Processamento de Colunas Arquivadas` + `Posicionadas/` + `Colunas.` pode ser uma unica frase, ou o titulo pode ter duas linhas com mais um texto perdido. A leitura nao e confiavel [inferido].
2. Sintaxe de `I/J/N a M/.../K`: as strings nao mostram a regra completa. Nao se sabe se as letras sao eixos de grade, nomes de pilar ou letras de posicao [inferido].
3. `SOSECAO`: sem contexto. Pode ser um flag de secao, um nome de arquivo ou um token interno [inferido].
4. Caminho e tipo de arquivo lido ou gravado pelo processamento: ausentes das strings.
5. Mecanismo do VOLTA (arquivo, variavel ou parametro do SHELL): ausente.
6. Ordem das mensagens: a ordem das strings no executavel sugere uma sequencia, mas nao prova o fluxo. Sem o codigo, o caminho de erro e o caminho normal so podem ser inferidos.
7. Se PIPROEDI chama algum outro modulo: as strings nao mostram tokens de despacho.
