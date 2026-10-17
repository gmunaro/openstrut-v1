# FORMA.EXE - Especificacao funcional

Fontes: strings do executavel original `FORMA.EXE` (fora do repositorio) e `sistrut-game/FORMA.INI`.
Convencoes: `[inferido]` = deducao sem prova direta.
`!` no texto citado marca a letra destacada que as strings perderam (ex.: `!ontagem` = `Montagem`, com `M` destacado).

## 1. Papel do modulo

FORMA.EXE e o gerenciador da familia FORMA (Montagem e Desenho de Formas). Nao calcula esforcos. Le os dados de dimensionamento de Lajes, Vigas e Colunas, monta o vinculo entre eles e despacha para os submodulos FORMINIT, FORMEDCA, FORMIMP e FORMPLOT.

Cabecalho: `MONTAGEM E DESENHO DE FORMAS`, `Outubro 1993`, `Versao 4.0`. A data diverge de `Abril 1991` do SISEDIT e do INSTALAR (secao 10).

## 2. Chamada e retorno

**Entrada.** O gerenciador lanca `<unidade>:\SISTRUT\EXEC40\FORMA.EXE` via `SHELL`, sem argumentos; se o arquivo nao existir, tenta `EXEC32` (versao 3.2). Fonte: reconstrucao `src-reconstructed/SISTRUT.BAS`, sub `RunModule`. Nao confirmado no executavel do gerenciador [inferido].

**Partida.** O executavel traz `SISTRUT`, `LPT1:`, `COM1:`, `COMSPEC`, `:\SISTRUT\EXEC40\`, `FORMA.INI` e `CDEF`. O uso de cada um na partida e [inferido]. `FORMA.INI` e o arquivo de parametros do modulo (secao 5).

**Saida normal.** `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..`. A frase `Retorno ao Modulo Gerenciador` tambem esta em FORMA (e em SISEDIT e FORMINIT); quem a exibe ao voltar nao foi confirmado [inferido].

**Submodulo nao encontrado.** `Modulo nao encontrado em ` seguido do caminho, concatenado em tempo de execucao [inferido].

**Tokens de despacho.** `RETORNA`, `FORMA`, `FORMINIT`, `REEDITA`, `FORMEDCA`, `FORMIMP`, `FORMPLOT1`. O nome do modulo e `FORMPLOT`; o `1` final e provavelmente byte de comprimento [inferido]. Os tokens `EDITA`, `IMPRIME` e `PLOTA` sao os destinos do menu (secao 3.1).

**Retorno dos submodulos.** Os submodulos devolvem ao FORMA pelo token `VOLTA<MODULO>` (`VOLTAFORMINIT` em FORMINIT e em FORMEDCA). FORMA nao traz `VOLTA...`. O canal (arquivo, variavel ou argumento) nao foi identificado [inferido]. FORMIMP, FORMPLOT e FORMEDCA mostram a mesma frase ao voltar: `Retorno ao Modulo Basico de FORMA`.

## 3. Telas e menus

### 3.1 Tela principal

Cabecalho como na secao 1. Itens, na ordem das strings. A letra de hotkey se perdeu; a letra e deduzida [inferido]. Os numeros de 2 a 6 nao sao legiveis; a numeracao e a ordem das linhas.

| No. | Texto nas strings | Texto completo | Hotkey | Destino |
|---|---|---|---|---|
| 1 | `1  -  !ontagem e Desenho de Formas` | Montagem e Desenho de Formas | M [inferido] | Montagem (Lajes, Vigas, Colunas) |
| 2 | `2!ditadas, acesso as Formas gravadas` | Reeditadas, acesso as Formas gravadas [inferido: o `Re` inicial falta] | E [inferido; token `EDITA`] | Reedicao de forma gravada |
| 3 | `b!mpressao de Formas` | Impressao de Formas | I [inferido; token `IMPRIME`] | FORMIMP |
| 4 | `e!esenhos e Plotagens` | Desenhos e Plotagens | D ou P [inferido; a letra destacada nao e inequivoca] | FORMPLOT (token `PLOTA`) |
| 5 | `!arametrizacoes / escolha` | Parametrizacoes / escolha | P [inferido] | Nao identificado (secao 10) |
| 6 | `!lteracao de Drive e Subdiretorio` | Alteracao de Drive e Subdiretorio | A [inferido] | Troca de drive/diretorio de dados |
| - | `! <F2> = Fim` | <F2> = Fim | F2 | Sai do modulo |

O prompt de entrada e `escolha opcao`.

### 3.2 Montagem: escolha dos arquivos de dados

Sequencia. Cada prompt de nome de arquivo aceita `*RETORNO*` para voltar:

1. `Coloque o Disco de Dados no Drive`. Troca de disquete, obsoleta (secao 9).
2. `Nome do Arquivo de Lajes  *RETORNO*`; erro `NOMEERRADO`; depois `Lajes a serem utilizadas`.
3. `Nome do Arquivo de Vigas  *RETORNO*`; depois `Vigas a serem utilizadas`.
4. `Nome do Arquivo de Colunas  *RETORNO*`; depois `Colunas a serem utilizadas`.
5. `Leitura de dados   Aguarde ...`; `Todos os dados de dimensionamento foram lidos.`
6. `Inicio a montagem da Forma  N/*S*`. Default `S`.

### 3.3 Reedicao: escolha da forma gravada

- `Nome do Arquivo de Forma  *RETORNO*`; `Forma a ser editada`; extensao `.FRM`.
- Nao achou: `NAO ENCONTRADO` ou `Nenhum Arquivo Encontrado`.
- `Continuo com a edicao da forma  N/*S*`; `Qualquer Tecla para Continuar`.
- Confirmacao de inicio por modo: reedicao, montagem de impressao ou montagem da plotagem da forma, todas `N/*S*`.
- Se a secao de alguma viga mudou: `Reedicao necessaria devido a mudanca de secao nas Vigas` e `Vigas com secao alterada.  Edite novamente a Forma  *RETORNA*`.

Resumo da forma lida: contadores de tracos de arquitetura, tracos de estrutura, lajes arquivadas, trechos de pilares arquivados, vigas arquivadas, niveis definidos e colunas arquivadas. O formato numerico da linha nao foi recuperado.

### 3.4 Vinculo entre elementos estruturais

- Titulo `Vinculo entre os Elementos Estruturais`, com colunas Painel de Lajes, Vigas e Colunas.
- Vigas: tabela `Viga do Painel / Viga Correspondente / Tramos / Secao`. Acoes: proxima viga, altera viga correspondente, elimina, aceita correspondencia, retorna a escolha dos arquivos. Mensagens `SECAO NAO DEFINIDA` e `VIGA ELIMINADA DA FORMA`.
- Nivel: `Escolha o Nivel referente as secoes das Colunas`, com acoes proximo nivel, aceita nivel e retorna a correspondencia das vigas. Cotas com mascara `####.###`.
- Pilares: tabela `Pilar do Painel / Pilar Correspondente / Secao`, com o nivel. Acoes: proximo pilar, altera pilar correspondente, retorna a escolha do nivel. Tipos de secao: Retangular (`rot`), Circular (`di`) e Poligonal (`vertices`). Mensagem `PILAR ELIMINADO DA FORMA`.
- Aviso quando o pilar nao existe no nivel escolhido: `Retorne e ANULE o pilar da montagem da forma ou ESCOLHA outro Nivel`.

Hotkeys dos prompts de vinculo: `S` (sim), `P` (proximo), `A` (altera), `E` (elimina), `R` (retorna). As letras entre `<>` se perderam; as iniciais sao deduzidas [inferido].

### 3.5 Pre-condicoes (telas de bloqueio)

Quando o dimensionamento de origem esta incompleto, o modulo mostra a pendencia: colunas ainda nao dimensionadas, secao da coluna com definicao incorreta, painel de lajes ou sua estrutura ainda nao definidos, lajes, pilares, vigas, continuidade, dimensionamento ou armaduras ainda nao definidos, secao da viga nao confere.

### 3.6 Drive, diretorio e arquivos

- `Acione  D <Enter>  para alterar Drive e Diretorio` (item 6 do menu).
- Erros de drive ou arquivo: `NAO EXISTE ESTE ARQUIVO NESTE DISCO`, `O SEU DISCO DE DADOS ESTA COMPLETO`, `VERIFIQUE O SEU DRIVE`.
- Pedido de disco: `Coloque o disco contendo o Modulo` seguido do drive.
- Caminho padrao por tipo de arquivo (`Drive:\Diretorio\...\Subdiretorio`): Lajes (`.LAJ`), Vigas (`.VIG .SEC .FOR`), Colunas (`.COL`), Formas (`.FRM`), Parametrizacao (`.FOP`), arquivos publicos CAD (`.DXF`) e plotagem (`.PLT`).

### 3.7 Modos de video

Os tokens `OR`, `XOR`, `HER`, `EGA` e `VGA` sao rotulos de modo de video, sem texto de tela [inferido]. `CGA` e `MCGA` nao aparecem neste EXE (aparecem em FORMEDCA).

### 3.8 Fluxo de tela

1. Menu principal (itens 1 a 6, F2).
2. Montagem: Lajes -> Vigas -> Colunas -> `Inicio a montagem da Forma` [inferido na ordem].
3. Vinculo (3.4), quando necessario [inferido].
4. Submodulo: FORMEDCA (edicao), FORMIMP (impressao) ou FORMPLOT (plotagem) [inferido].
5. Retorno via `VOLTA<MODULO>` e mensagem `Retorno ao Modulo Basico de FORMA`.

## 4. Entradas do usuario

- **Menu:** letras de hotkey (3.1) e `F2`.
- **Confirmacoes:** `S`/`N` com default em maiuscula (`N/*S*` = S).
- **Nomes de arquivo:** `*RETORNO*` volta ao menu. A extensao padrao e presumida pelo tipo (`.FRM` na reedicao) [inferido].
- **Drive/diretorio:** `D` + Enter.
- **Qualquer tecla:** continuar.
- **Vinculo:** `S`, `P`, `A`, `E`, `R` (3.4).

## 5. Arquivos lidos e gravados

| Arquivo | Papel | Direcao |
|---|---|---|
| `SISTRUT.INI` | configuracao global | lido [inferido] |
| `FORMA.INI` | parametros do modulo | lido |
| `*.LAJ` | Lajes (de LAJE) | lido |
| `*.VIG`, `*.SEC`, `*.FOR` | Vigas (de VIGA) | lido |
| `*.COL` | Colunas (de PILAR) | lido |
| `*.FRM` | forma montada | lido (reedicao); gravado por FORMEDCA |
| `*.FOP` | parametrizacao de plotagem | lido por FORMPLOT [inferido] |
| `*.DXF` | CAD | gravado por FORMPLOT [inferido] |
| `*.PLT` | plotagem | gravado por FORMPLOT [inferido] |

Campos de `FORMA.INI` (ASCII; o usuario edita o valor a esquerda de `=`), conforme o arquivo de exemplo `sistrut-game/FORMA.INI`:
- Caminho de `.FOP`: `C:\SISTRUT\EXEC40\`; de `.VIG .SEC .FOR`, `.FRM`, `.DXF`, `.PLT`: `C:\`.
- Folha (mm): `841` x `594`; margens `25` (esquerda) e `10` (demais); carimbo `175` x `287`; escala `50`.
- Alturas de letra (mm): colunas `3`, vigas `3`, lajes `3`, amarracao `2`, elevacao `2`, extras `1.5`.
- Flags `S`/`N`: arquivo gerado em disco `N`; nove flags `S`.
- Origem da plotagem `0` e `0`.
- Linhas de comando da impressora (secao 7).

O rotulo `Drive:\Diretorio\...\Subdiretorio` mostra que os caminhos sao por diretorio, nao por disquete.

Formato binario de `.FRM`, `.FOR`, `.CFO`, `.PLT`, `.DXF` e `.FOP`: nao decodificado nesta especificacao (secao 10).

## 6. Calculos e processamento

FORMA nao calcula esforcos. O processamento e de leitura, consistencia e montagem:

1. Le Lajes, Vigas e Colunas (`Leitura de dados`) e confirma leitura completa.
2. Verifica pre-condicoes de dimensionamento (3.5).
3. Estabelece vinculo Viga do painel <-> viga correspondente e Pilar do painel <-> pilar por nivel (3.4).
4. Detecta mudanca de secao em Vigas e obriga reedicao (3.3).
5. Despacha FORMINIT (token `FORMINIT`). A funcao de FORMINIT esta em `FORMINIT.md` [inferido].
6. Falha de consistencia: `erro no processamento`, `verifique a consistencia dos seus dados`, `Acione ESC <Enter> para Continuar`.

## 7. Relatorios, impressao e plotagem

FORMA nao imprime nem plota. Escolhe o destino e chama o submodulo:

- **Impressao:** FORMIMP (item 3, token `IMPRIME`), com confirmacao `Inicio da Montagem de Impressao da Forma  N/*S*`.
- **Plotagem:** FORMPLOT (item 4, token `PLOTA`), com confirmacao `Inicio da Montagem da Plotagem da Forma  N/*S*`.
- **Edicao/desenho:** FORMEDCA (token `FORMEDCA`).

Saidas: `.DXF` (CAD) e `.PLT` (plotagem), com diretorios definidos em FORMA.INI.

As sequencias ESC/P da impressora nao estao no FORMA.EXE; FORMA.INI traz as linhas de comando da impressora [inferido].

## 8. Mensagens de erro

| Mensagem exata | Quando |
|---|---|
| `NAO ENCONTRADO` | Forma a editar nao existe [inferido] |
| `Nenhum Arquivo Encontrado` | Sem arquivos do tipo no diretorio [inferido] |
| `NAO EXISTE ESTE ARQUIVO NESTE DISCO` | Nome nao achado [inferido] |
| `O SEU DISCO DE DADOS ESTA COMPLETO` | Texto antigo de disquete; a condicao exata e [inferido] |
| `VERIFIQUE O SEU DRIVE` | Drive nao responde [inferido] |
| `NOMEERRADO` | Nome de Lajes invalido [inferido] |
| `SECAO NAO DEFINIDA` | Viga sem secao no vinculo [inferido] |
| `VIGA ELIMINADA DA FORMA` / `PILAR ELIMINADO DA FORMA` | Confirmacao de eliminacao |
| Pre-condicoes (3.5) | Dimensionamento incompleto |
| `erro no processamento` / `verifique a consistencia dos seus dados` | Falha de consistencia |
| `Modulo nao encontrado em ` | Submodulo ausente |

## 9. Troca de disquete

`Coloque o Disco de Dados no Drive` e `Coloque o disco contendo o Modulo` estao em FORMA. Os textos `Coloque o Disco FORMA no Drive` estao em FORMPLOT e FORMEDCA, nao em FORMA. No codigo novo, o caminho vem do diretorio configurado em FORMA.INI.

## 10. Lacunas e incertezas

1. **Formato binario dos arquivos** (`.FRM`, `.FOR`, `.CFO`, `.PLT`, `.DXF`, `.FOP`, `.LAJ`, `.VIG`, `.SEC`, `.COL`) nao decodificado. Precisa de desassemblador ou amostras reais.
2. **Hotkeys deduzidas** (M, E, I, D/P, P, A): as letras destacadas se perderam nas strings. Conferir no EXE original rodando em DOSBox.
3. **Itens 2 a 6 do menu**: sem numero legivel; a ordem e a das linhas.
4. **Item 5 "Parametrizacoes / escolha"**: sem token de despacho; destino desconhecido.
5. **Canal do `VOLTA<MODULO>`**: o token esta em FORMINIT e FORMEDCA, nao em FORMA. O canal (arquivo, variavel ou argumento) nao foi confirmado.
6. **Data**: FORMA diz `Outubro 1993`; SISEDIT e INSTALAR dizem `Abril 1991`.
7. **Contadores** (3.3): o formato numerico da linha nao foi recuperado.
8. **Origem da chamada**: a unica prova do `SHELL` com `EXEC40` e `src-reconstructed/SISTRUT.BAS`. O codigo decompilado do gerenciador (fora do repositorio) nao tem referencias a FORMA. Confirmar no executavel original do gerenciador.
