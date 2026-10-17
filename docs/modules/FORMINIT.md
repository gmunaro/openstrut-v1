# FORMINIT.EXE - Especificacao funcional

Fontes: strings do executavel original `FORMINIT.EXE` (fora do repositorio).
Convencoes: `[inferido]` = deducao sem prova direta.
Bytes de caixa e de comprimento do QuickBASIC foram omitidos. Caracteres soltos no fim de algumas linhas (`E`, `└`) sao residuos binarios.

## 1. Papel do modulo

FORMINIT.EXE e o submodulo de inicializacao da montagem de forma. Recebe as Lajes, Vigas e Pilares ja vinculados pelo FORMA, posiciona os elementos em planta, calcula as intersecoes entre faces de Vigas, Pilares e Bordos Livres de Lajes, e devolve o controle ao FORMA ou passa para FORMEDCA (edicao) [inferido].

Nao ha tela de identificacao (cabecalho, autor, data) nas strings. A data do sistema aparece em FORMA e INSTALAR (ver FORMA.md, secao 1).

## 2. Chamada e retorno

**Entrada.** FORMA chama FORMINIT pelo token `FORMINIT`, com o mesmo mecanismo de lancamento descrito em FORMA.md, secao 2 (`SHELL` com `<unidade>:\SISTRUT\EXEC40\FORMINIT.EXE`, sem argumentos) [inferido: a chamada e a reconstrucao `src-reconstructed/SISTRUT.BAS`, sub `RunModule`, nao o binario do FORMA].

**Tokens de despacho presentes neste executavel.** `FORMA`, `FORMEDCA` (seguido de um byte residual), `FORMINIT`, `VOLTAFORMINIT`, `FORMA`, `CRUZA`, `NAOCRUZA`.
- `FORMA` e `FORMEDCA` sao os destinos de saida: retorno ao gerenciador e passagem para a edicao [inferido].
- `VOLTAFORMINIT` e o token que FORMEDCA usa para voltar a FORMINIT. Aqui ele aparece como token de despacho de entrada [inferido].

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. Mesmo texto de FORMA.

**Retorno ao gerenciador.** `Retorno ao Modulo Gerenciador`. Mesmo texto de FORMA e SISEDIT. Quem exibe a frase e quando, nao foi confirmado [inferido].

**Submodulo ausente.** `Modulo nao encontrado em ` (com espaco final), seguido do nome `SISTRUT` como cabecalho da mensagem [inferido]. Mesmo padrao de FORMA.

## 3. Telas e menus

FORMINIT nao tem menu nem tela de escolha nas strings. Sua interface e uma sequencia de mensagens de progresso:

1. `Atualizacao da posicao dos Pilares Alterados.` (texto com espacos finais de preenchimento).
2. `Atualizacao da posicao das Vigas Alteradas.`
3. `Aguarde ...` (com espaco inicial).
4. `Posicionando Bordos livres e Buracos na Forma.`
5. `Posicionando Secao dos Pilares na forma.`
6. `Posicionando Vigas em planta na forma.`
7. `Interseccoes entre linhas de faces das Vigas.`
8. `Interseccoes entre linhas de faces das Vigas com Pilares.`
9. `Interseccoes entre linhas de Bordos Livres de Lajes.`

A ordem acima e a ordem das strings no executavel, nao necessariamente a ordem de execucao [inferido: as etapas 4 a 9 seguem a sequencia logica da geometria, mas nao ha prova de sequencia no codigo].

Os textos 1 e 2 indicam que FORMINIT tambem roda para reposicionar elementos alterados. Quem dispara essa reposicao (FORMEDCA ou FORMA) nao foi confirmado [inferido].

### 3.1 Confirmacoes e pausas

- `Acione ESC <Enter> para Continuar` (com residuo `E` no fim do texto). Mesmo texto de FORMA. Pausa antes de continuar.

## 4. Entradas do usuario

- **Pausa de erro:** `ESC` ou `Enter` para continuar [inferido: o texto pede `ESC <Enter>`].
- **Nenhum outro prompt de dados.** As strings nao trazem pergunta sobre nome de arquivo, drive ou opcao. Os dados chegam pelo FORMA e pelos arquivos (secao 5).

O par `CRUZA` / `NAOCRUZA` parece ser um modo de calculo de intersecao (cruzar ou nao as faces). Nao ha prompt visivel nas strings que o escolha; a origem do modo e uma lacuna (secao 10) [inferido].

## 5. Arquivos lidos e gravados

As strings nao trazem nome nem extensao de arquivo de dados. A unica evidencia de E/S de disco e o runtime do BRUN45 (`C_FILE_INFO`) e a mensagem de disco:

| Item | Evidencia | Direcao |
|---|---|---|
| Dados da forma (Lajes, Vigas, Pilares vinculados) | Mensagens de posicionamento (secao 3) | Lido [inferido] |
| Forma montada (`.FRM`) | Ausente nas strings; FORMA le e grava `.FRM` | Nao confirmado [inferido] |
| `Coloque o Disco ... no Drive` | mensagem de disco | Troca de disquete; obsoleta (secao 9) |

Os nomes de arquivo e as extensoes exatas de FORMINIT ficam como lacuna (secao 10).

## 6. Calculos e processamento

FORMINIT nao calcula esforcos. Faz geometria de planta:

1. Posiciona Bordos Livres e Buracos da forma.
2. Posiciona a secao de cada Pilar na forma.
3. Posiciona as Vigas em planta.
4. Calcula intersecoes entre linhas de faces das Vigas.
5. Calcula intersecoes entre faces das Vigas e Pilares.
6. Calcula intersecoes entre Bordos Livres de Lajes.

Os tres passos de intersecao usam os modos `CRUZA` e `NAOCRUZA` [inferido].

Falha de processamento: `erro no processamento` seguido de `verifique a consistencia dos seus dados` e a pausa `Acione ESC <Enter> para Continuar`. Mesmos textos de FORMA.

## 7. Relatorios, impressao e plotagem

FORMINIT nao imprime nem plota. Nao ha string de relatorio. Impressao e plotagem ficam em FORMIMP e FORMPLOT (ver FORMA.md, secao 7).

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| `erro no processamento` | Falha durante a montagem geometrica [inferido] |
| `verifique a consistencia dos seus dados` | Dados de entrada inconsistentes [inferido] |
| `Modulo nao encontrado em ` | Submodulo ausente (secao 2) |
| `run-time error R6005` + `- not enough memory on exec` | Runtime BRUN45 |
| `run-time error R6006` + `- bad format on exec` | Runtime BRUN45 |
| `run-time error R6007` + `- bad environment on exec` | Runtime BRUN45 |

Os erros R6005 a R6007 sao do runtime, nao texto de FORMINIT.

## 9. Troca de disquete e outros textos

- **Troca de disquete:** `Coloque o Disco ... no Drive`. Texto da versao de disquete. No codigo novo, o caminho vem do diretorio configurado (FORMA.INI).
- **Nome do sistema:** `SISTRUT` e so o nome do produto, usado na mensagem de submodulo ausente.

## 10. Lacunas e incertezas

1. **Arquivos de dados**: nenhum nome ou extensao de arquivo aparece nas strings. Nao se sabe se FORMINIT le e grava `.FRM` ou so trabalha em memoria.
2. **Modo CRUZA / NAOCRUZA**: a forma como o modo e escolhido (parametro, flag do FORMA, opcao de tela) nao esta nas strings. Os tokens aparecem sem texto de prompt.
3. **Ordem de execucao** das etapas de posicionamento e intersecao (secao 3 e 6): a ordem e a das strings.
4. **Origem da reposicao** (`Atualizacao da posicao ...`): nao se sabe se FORMINIT e chamado por FORMA, por FORMEDCA ou pelos dois.
5. **Byte residual** em `FORMEDCA`, `Acione ESC <Enter> para Continuar E` e `Coloque o Disco └`: caracteres que nao sao texto. Nao alteram o significado, mas o texto exato deve ser conferido no executavel original.
6. **Ausencia de telas e menus**: FORMINIT nao tem tela de escolha nas strings. Se houver tela, ela nao foi encontrada em texto (pode estar em tokens binarios).
