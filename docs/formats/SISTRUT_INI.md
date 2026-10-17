# Formato do SISTRUT.INI

O SISTRUT.INI guarda a configuração geral da instalação do SISTRUT 4.0: drive de implantação, monitor, saída de impressão e porta de comunicação. O exemplo distribuído está em `sistrut-game/SISTRUT.INI`. O arquivo segue a forma `VALOR=DESCRICAO` de INI.md, mas tem cabeçalho e linhas de texto sem `=`.

## Regras de leitura

1. As linhas 1 e 2 são cabeçalho, sem `=`.
2. As linhas 3 a 7 seguem `VALOR=DESCRICAO`. A leitura divide no primeiro `=`, como em INI.md.
3. As linhas 8 e 10 são texto, sem `=`. IniValor$ devolve vazio para elas.
4. A linha 9 é uma linha interna do original que a V1 não usa. Ver a seção própria.
5. O fim de linha é LF, e a última linha não tem quebra final. Ver "Decisões em aberto".

## Linhas

| Linha | Conteúdo | Valor (antes do `=`) | Significado |
|---|---|---|---|
| 1 | Nome do fornecedor do original (omitido aqui) | (sem `=`) | Cabeçalho |
| 2 | Versao 4.0 Abril 1991 | (sem `=`) | Cabeçalho: versão e data |
| 3 | `C:\=DRIVE IMPLANTACAO` | `C:\` | Drive e diretório de implantação |
| 4 | `CGA=MONITOR UTILIZADO` | `CGA` | Monitor utilizado |
| 5 | `LPT1:=SAIDA PARALELA UTILIZADA` | `LPT1:` | Saída paralela de impressão |
| 6 | `COM1:=PORTA DE COMUNICACAO SERIAL UTILIZADA` | `COM1:` | Porta serial de comunicação |
| 7 | `=ARQUIVO .BAT ACESSADO NA INSTALACAO` | vazio | Arquivo .BAT acessado na instalação. Sem valor na distribuição |
| 8 | PARAMETRIZADO EM:02-04-91  01:00:00 | (sem `=`) | Data e hora da parametrização |
| 9 | Linha interna do original | (sem `=`) | Não usada pela V1. O valor não é reproduzido aqui |
| 10 | FINAL DE PARAMETRIZACAO | (sem `=`) | Marca o fim da parametrização |

## Linha 9

A V1 não usa esta linha, e este documento não reproduz o valor dela.

A biblioteca SISCOMUM não interpreta a linha. IniValor$ devolve vazio para ela. Como ArqLer% carrega todas as linhas, a linha 9 entra em ArqDados$ como texto. Uma gravação com ArqGravar a regrava como texto, junto com as demais linhas.

## Decisões em aberto

- Fim de linha: o arquivo usa LF e não tem quebra final. SISCOMUM aceita LF e CRLF na leitura. ArqGravar grava CRLF com quebra final em todas as linhas, então uma regravação muda os bytes do arquivo. Não confirmado se o SISTRUT original aceita CRLF neste arquivo.
- Linha 8: a data e a hora são lidas aqui só como texto. O uso que o programa faz delas não foi confirmado.
- Valores de CGA, LPT1: e COM1:: tratados como texto. A lista de valores aceitos pelo programa (outros monitores, COM2:) não foi confirmada.
- Valor vazio da linha 7: não confirmado como o programa trata o campo vazio.
- Linhas sem `=` (1, 2, 8, 9, 10): assume-se que o programa as ignora na leitura. Não verificado.
