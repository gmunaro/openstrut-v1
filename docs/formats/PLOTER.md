# Formato do PLOTER.INI

O PLOTER.INI guarda a configuração dos plotters e impressoras de plotagem do SISTRUT 4.0: porta de comunicação, número de penas, comandos de cada equipamento e velocidade de cada pena. Está em `dist/sistrut-game/PLOTER.INI`: 763 linhas, 18623 bytes, terminadores CRLF, sem 0x1A. Os números de linha abaixo são os do editor, começando em 1.

## Regras de leitura

1. Linhas que começam com `*` na coluna 0 são comentários. O cabeçalho (linhas 1 a 124) e a área de penas (linhas 709 a 715) usam essa marca.
2. Cada equipamento começa numa linha `$NOME`. O nome é o texto inteiro depois de `$`. O cabeçalho (linha 26) descreve a forma `$nome/comentarios`, mas nenhum bloco tem comentário depois de barra; os nomes contêm `/` (`$HOUSTON DMP 41/42`), o que deixa a regra ambígua.
3. Dentro de um bloco, a leitura é posicional. As linhas seguem uma ordem fixa e não há chave. O cabeçalho manda não alterar a ordem.
4. O bloco termina antes do próximo `$`. O último bloco termina na linha 708.
5. A área final (linhas 709 a 761) tem as penas por tipo de desenho. Ela usa `# DESENHO ...` e `FIM`, e fecha com `FINAL DA PARAMETRIZACAO` na linha 761.
6. Os comandos de cada equipamento vêm em três famílias, com ordem e sintaxe diferentes (ver a seção "Famílias de comandos").

## Cabeçalho de comentários (linhas 1 a 124)

O cabeçalho descreve, em 14 itens, a ordem dos campos de cada equipamento. Os itens 1 a 14 são a referência para os campos da seção seguinte. Na linha 22, o cabeçalho diz que os comentários valem para a linha HOUSTON / DIGICON / SMAR (linguagem DM/PL).

## Campos de cada equipamento

| Pos. | Campo | Exemplo no arquivo | Significado (segundo o cabeçalho) |
|---|---|---|---|
| 1 | Nome | `$HOUSTON DMP 41/42` | Nome exibido ao usuário. `$` inicia o bloco |
| 2 | Comunicação | `1:2400,e,7,2` ou `LPT1:` | Porta, baud, paridade (`n`, `o`, `e`), bits de dados (7 ou 8), bits de parada (1 ou 2). `LPT1:` é saída paralela |
| 3 | Modo de seleção | `;:` (Houston), `IN` (HP-GL), `;RE;` (LPT) | Seleção do ploter. O cabeçalho descreve `;:` como XON/XOFF |
| 4 | Número de penas | `1`, `4`, `6`, `8`, `14` | Quantidade de penas. Com 1 pena, a troca é manual e só vale na plotagem direta. Em arquivo de plotagem (.PLT) só cabem as penas que o equipamento tem |
| 5 | Troca de pena | `P[1]`, `SP[1]`, `;SP[1];` | Comando de troca. `[1]` é a posição do número da pena |
| 6 | Velocidade | `V[1]`, `VS[1]`, `;VS[1];` | Comando de velocidade. `[1]` é a posição do valor |
| 7 | Precisão | `EC1  (0.0254)`, `SC (0.025)`, `;RE; (0.100)` | Comando de resolução. O valor entre parênteses é a precisão em mm. O cabeçalho dá EC1 = 0,001", EC5 = 0,005" e ECM = 0,1 mm |
| 8 | Área máxima | `W 0,0,Xmax,Ymax,0,0,Xmax,Ymax` (Houston), `IW` (HP-GL) | Janela de plotagem. Pelo comentário do cabeçalho (linhas 74 a 79), `Ymax` é a largura máxima e o limite é o deslocamento lateral da pena; o comprimento não tem limite. É leitura do comentário, não confirmada no leitor |
| 9 | Posição absoluta | `A` (Houston), `PA` (HP-GL) | Move a pena em coordenadas absolutas |
| 10 | Pena para baixo | `D` (Houston), `PD` (HP-GL) | Abaixa a pena e traça |
| 11 | Pena para cima | `U` (Houston), `PU` (HP-GL) | Levanta a pena sem traçar |
| 12 | Texto | cinco linhas (Houston); `SI`, `SS`, `CS0`, `DI`, `LB` (HP-GL) | Ver "Comandos de texto" |
| 13 | Fim de texto | `95` (Houston), `3` (HP-GL), `59` (LPT) | Número ASCII do caractere que encerra o texto (cabeçalho, linha 116). O caractere correspondente (`_`, `;`, ETX) é inferência da tabela ASCII, não está no arquivo |
| 14 | Círculo | `CC [X],[Y],[RAIO],` (Houston), `CI [RAIO]` (HP-GL), `;CI [RAIO];` (LPT) | Círculo com raio `[RAIO]`. No Houston, `[X]` e `[Y]` podem ser omitidos |

Fora do cabeçalho: cada bloco termina com a linha `PENA VELOCIDADE (cm/seg ou pol/seg - no padrao de cada ploter)` seguida de linhas `pena velocidade`. Ver "Ploters (blocos)".

## Famílias de comandos

| Família | Equipamentos (linha de abertura) | Campo 3 | Comandos de pena e velocidade | Fim de texto | Círculo |
|---|---|---|---|---|---|
| Houston, Digicon e Smar (DM/PL) | 126, 146, 166, 191, 216, 391, 411, 431, 456, 476, 501, 521 | `;:` | `P[1]`, `V[1]`, `EC1 (0.0254)`, `W ...`, `A`, `D`, `U`, texto em cinco linhas `S(...)`, `95`, `CC [X],[Y],[RAIO],` | 95 | `CC` |
| HP-GL | 241, 266, 291, 316, 341, 366, 546, 586, 611, 634, 659, 684 | `IN` | `SP[1]`, `VS[1]`, `SC (...)`, `IW`, `PA`, `PD`, `PU`, `SI[1],[LARG]`, `SS`, `CS0`, `DI [3],[4]`, `LB[2]`, `3`, `CI [RAIO]` | 3 | `CI` |
| LPT (LTG 400/B) | 566 | `;RE;` | `;SP[1];`, `;VS[1];`, `;RE; (0.100)`, `;HO;`, `;DA`, `;MA`, `;CS[1*0.05]`, `;RO @0@90@180@270;`, `;TX[2];`, `59`, `;CI [RAIO];` | 59 | `;CI [RAIO];` |

Diferenças da família HP-GL: não há `A`, `D`, `U`, `EC` nem `CC`. O bloco do Calcomp 104x (linha 366) tem a maior parte dos campos escrita como `nao configuravel`.

Nas linhas da família LPT, `;DA`, `;MA` e `;CS[1*0.05]` não têm `;` final. O arquivo não explica se isso é intencional.

## Comandos de texto (família Houston)

As cinco linhas de texto (linhas 137 a 141 no bloco DMP 41/42) são:

- `S(S[1],)_`: tamanho. `[1]` recebe o multiplicador da precisão vezes 6 (largura) e vezes 7 (altura). Exemplo do cabeçalho: `S10` com EC1 dá 1,524 mm de largura e 1,778 mm de altura.
- `S(NI,)_`: `NI` para não itálico, `I` para itálico.
- `S(G0,)_`: conjunto de caracteres. 0 = ASCII, 1 = matemáticos, 2 = germânicos, até 7 = itálicos.
- `S(X[3],Y[4])_`: incremento em X (`[3]`) e em Y (`[4]`) para inclinar o texto.
- `S()[2]`: posição onde entra o texto a ser plotado.

Na família HP-GL, o tamanho é `SI[1],[LARG]`, onde `[LARG]` é a largura do caractere. Segundo o cabeçalho, em HP-GL é preciso informar a largura do caractere com `[LARG]`.

## Ploters (blocos)

Os 25 blocos do arquivo, na ordem em que aparecem. "Penas" é o campo 4. "Velocidade por pena" lista os valores da linha `PENA VELOCIDADE`, na ordem das penas 1 a N.

| Linha | Nome | Família | Comunicação | Penas | Velocidade por pena |
|---|---|---|---|---|---|
| 126 | HOUSTON DMP 41/42 | Houston | 1:2400,e,7,2 | 1 | 4 |
| 146 | HOUSTON DMP 51/52 | Houston | 1:9600,e,7,2 | 1 | 8 |
| 166 | HOUSTON DMP 52 MP | Houston | 1:9600,e,7,2 | 14 | 4, 6, 6, 6, 4, 3 |
| 191 | HOUSTON DMP 56A | Houston | 1:9600,e,7,2 | 6 | 6, 8, 8, 8, 4, 3 |
| 216 | HOUSTON DMP 61/62 | Houston | 1:9600,e,7,2 | 6 | 25, 25, 25, 20, 15, 15 |
| 241 | HEWLETT-PACKARD DraftPro | HP-GL | 1:9600,n,8,1 | 8 | 16, 16, 16, 10, 8, 8 |
| 266 | HEWLETT-PACKARD 7580/85 A/B | HP-GL | 1:9600,n,8,1 | 8 | 16, 16, 16, 10, 8, 8 |
| 291 | HEWLETT-PACKARD 7586 A/B | HP-GL | 1:9600,n,8,1 | 8 | 16, 16, 16, 10, 8, 8 |
| 316 | Calcomp Artisan 1023 - CPGL | HP-GL | 1:9600,n,8,1 | 8 | 25, 25, 25, 20, 15, 15 |
| 341 | Calcomp 1042/3/4 GT - CPGL | HP-GL | 1:9600,n,8,1 | 8 | 25, 25, 25, 20, 15, 15 |
| 366 | Calcomp 104x GT - 906/7/PCI | HP-GL (quase tudo `nao configuravel`) | 1:9600,n,8,1 | 8 | 25, 25, 25, 20, 15, 15 |
| 391 | DIGICON TDD 21 | Houston | 1:9600,e,7,2 | 1 | 4 |
| 411 | DIGICON TDD 21R | Houston | 1:9600,e,7,2 | 1 | 16 |
| 431 | DIGICON TDD 21 RMT | Houston | 1:9600,e,7,2 | 14 | 16, 16, 16, 13, 10, 10 |
| 456 | SMAR GP 502 | Houston | 1:9600,e,7,2 | 1 | 16 |
| 476 | SMAR GP 503 | Houston | 1:9600,e,7,2 | 14 | 16, 16, 16, 13, 10, 10 |
| 501 | SMAR GP 600/700 | Houston | 1:9600,e,7,2 | 1 | 16 |
| 521 | SMAR GP 610/710 | Houston | 1:9600,e,7,2 | 6 | 16, 16, 16, 13, 10, 10 |
| 546 | LOGICAL LTG 1000MP | HP-GL | 1:9600,o,7,2 | 1 | 6 |
| 566 | LOGICAL LTG 400/B - LPT | LPT | LPT1: | 1 | 0 |
| 586 | VERSATEC SERIE 8500 | HP-GL | 1:9600,n,8,1 | 6 | 16, 16, 16, 10, 8, 8 |
| 611 | American Graphtec GP1002 | HP-GL | 1:9600,n,8,1 | 4 | 25, 25, 25, 20 |
| 634 | IBM 6184 | HP-GL | 1:9600,n,8,1 | 8 | 16, 16, 16, 10, 8, 8 |
| 659 | Roland DG GRX-300 | HP-GL | 1:9600,n,8,1 | 8 | 20, 20, 20, 15, 10, 10 |
| 684 | Roland DG GRX-400 | HP-GL | 1:9600,n,8,1 | 8 | 20, 20, 20, 15, 10, 10 |

Valores de precisão (`EC`, `SC`) por bloco, quando diferentes de 0.0254 (Houston) ou 0.025 (HP-GL): Artisan (316) e 1042/3/4 (341) usam `SC (0.0125)`; 104x (366) usa `nao configuravel (0.0125)` na linha 372; LTG 1000MP (546) usa `SC (0.035)`; LPT (566) usa `;RE; (0.100)`.

Linha de comunicação: a porta `1` é COM1, segundo o cabeçalho (linha 30).

## Linhas de comunicação

| Forma | Ocorrências | Significado |
|---|---|---|
| `1:2400,e,7,2` | 1 (linha 127) | COM1, 2400 bps, paridade par, 7 bits, 2 stop |
| `1:9600,e,7,2` | 11 | COM1, 9600 bps, paridade par, 7 bits, 2 stop |
| `1:9600,n,8,1` | 11 | COM1, 9600 bps, sem paridade, 8 bits, 1 stop |
| `1:9600,o,7,2` | 1 (linha 547) | COM1, 9600 bps, paridade ímpar, 7 bits, 2 stop |
| `LPT1:` | 1 (linha 567) | Saída paralela |

Total: 25 linhas de comunicação, uma por bloco.

## Seções de penas por desenho (linhas 709 a 761)

Cabeçalho (linhas 709 a 715): "Maximo de seis (6) penas - numeracao 1 a 6" e "Altere somente o numero da PENA para cada tipo de desenho".

Cada seção tem um título `# DESENHO ...`, uma linha `PENA  TIPO DE DESENHO` (com dois espaços) e as entradas no formato `pena  descricao`. Todas as entradas do arquivo têm pena `1`.

| Linhas | Título | Entradas | Termina com FIM na linha |
|---|---|---|---|
| 716 a 727 | DESENHO DE VIGAS CONTINUAS | 9 | 727 |
| 729 a 740 | DESENHO DE PILARES | 9 | 740 |
| 742 a 744 | DESENHO DE LAJES | 0 | 744 |
| 746 a 759 | DESENHO DE FORMAS | 11 | 759 |

Descrições das entradas, na ordem do arquivo:

- VIGAS CONTINUAS: escrita do nome da viga; escrita do nome dos ferros; escrita dos valores de amarracao; escrita do nome dos apoios; escrita e traco dos cortes; escrita da tabela; traco dos ferros; traco das amarracoes e cotas; traco da forma.
- PILARES: escrita do nome da coluna; escrita do nome dos ferros; escrita dos valores de amarracao; escrita do nome dos niveis e cotas; escrita e traco dos cortes; escrita da tabela; traco dos ferros; traco das amarracoes e cotas; traco da prumada.
- LAJES: sem entradas.
- FORMAS: traco das vigas; traco das lajes (furos internos e bordos livres); tracos dos pilares; tracos de medidas e amarracao; tracos do desenho de corte e elevacao; escrita do nome da viga; escrita do nome da laje; escrita do nome do pilar; escrita do valor das amarracoes; escrita dos valores na elevacao; extras.

A linha 761 é `FINAL DA PARAMETRIZACAO`.

## Decisões em aberto

- Penas declaradas x velocidades listadas. Nove blocos declaram 8 penas e listam 6 velocidades (linhas 241, 266, 291, 316, 341, 366, 634, 659, 684). Três declaram 14 penas e listam 6 (linhas 166, 431, 476). O cabeçalho (linha 712) diz "Maximo de seis (6) penas", mas esse texto está na área de desenho, não no campo 4. Não confirmei se o campo 4 é o total físico do equipamento ou só o número de penas com velocidade definida.
- Unidade da velocidade. O cabeçalho diz "cm/seg ou pol/seg - no padrao de cada ploter". O arquivo não traz coluna de unidade.
- Velocidade 0 no bloco LPT (linha 585). O significado não está no arquivo.
- Significado de `3` (HP-GL) e `59` (LPT) como fim de texto. Vem da convenção dos códigos ASCII e não está confirmado no leitor de texto.
- Comandos LPT `HO`, `DA`, `MA`, `RO`, `TX` e `CS` não estão descritos no arquivo.
- Leitor: não verifiquei se o leitor ignora linhas com `*` na coluna 0, se trata `nao configuravel` como campo vazio, nem se lê as seções de penas pelo `FIM` ou por posição.
- Seção de LAJES sem entradas e com `FIM`. Não sei se o leitor trata o bloco vazio como erro.
- Nome do bloco com `/`. O cabeçalho sugere `$nome/comentarios`, mas nenhum bloco usa essa forma. O leitor pode quebrar o nome no `/`; não verifiquei.

## Cobertura da verificação

O teste `tests/T_COMUM.BAS` confere que o PLOTER.INI tem 761 linhas ou mais e que as linhas lidas por `ArqLer%` não têm CR, LF nem 0x1A. Não confere os blocos, as linhas de comunicação, as velocidades nem as seções de penas.
