# Formato dos arquivos de parametrização

Os arquivos de parametrização guardam as regras de cálculo e de detalhamento de cada módulo: critérios de altura, taxas de armadura, espaçamentos, rigidez de ligação de pilares e opções de desenho. Os exemplos distribuídos estão em `dist/sistrut-game/`. Este documento cobre SISTRUT.LAP, SISTRUT.PIP, SISTRUT.DSP e SISTRUT.FOP. Os arquivos INI apontam para eles; ver INI.md.

| Arquivo | Módulo | Linhas | Fim de linha | Observação |
|---|---|---|---|---|
| SISTRUT.LAP | LAJE | 203 | CRLF | Regras de lajes |
| SISTRUT.PIP | PILAR (PILAREDI) | 253 | CRLF | Regras de pilares |
| SISTRUT.DSP | DESENHO | 336 | CRLF | Regras de vigas e de desenho. Termina com 117 bytes 0x1A |
| SISTRUT.FOP | FORMA | 11 | CRLF | Texto livre, sem campos |

## Regras de leitura

1. Linha com `*` na coluna 0 é comentário. Os arquivos distribuídos usam essa marca nos blocos de texto de ajuda.
2. Parâmetro simples tem o valor no início da linha e a legenda depois, separada por espaços. A legenda serve de texto de ajuda. Exemplo: `1.5               COBRIMENTO DA ARMADURA - CM`.
3. Seção de parâmetros começa com uma linha só com `PARAMETROS` ou `PARAMETROS GLOBAIS`. Os dados vêm nas linhas seguintes.
4. Seção de lista pode terminar com a linha `FIM`. A presença de `FIM` não é uniforme nos arquivos distribuídos (ver decisões em aberto).
5. Separadores de campos:
   - `,` separa colunas de tabelas de pares e de tabelas com mais de duas colunas.
   - `/ ` (barra e espaço) separa listas de espaçamentos.
   - `-` separa colunas da tabela de bitolas e das tabelas de intervalo.
   - `#` e `+` compõem ferragens em intervalos. Exemplo: `2#12.5+#8` é duas barras de 12.5 mm mais uma de 8 mm.
6. Linha `ORDEM ... BITOLA (MM) ...` abre a tabela de bitolas. Área nula (0.00) desativa a bitola. O próprio SISTRUT.LAP registra essa regra nas linhas 36 a 39.
7. `FINAL DA PARAMETRIZACAO` marca o fim do conteúdo útil. Depois dele há só comentário, ou no DSP o padding 0x1A.

## SISTRUT.LAP (LAJE)

### Globais (linhas 31 a 33)

| Linha | Valor | Significado |
|---|---|---|
| 32 | 1.5 | Cobrimento da armadura, em cm |
| 33 | 0.5 | Acréscimo ao cobrimento para o início da altura útil, em cm |

### Tabela de bitolas (linhas 43 a 53)

Colunas: ORDEM, BITOLA (MM), AREA (CM2), PESO (KG/M). Separador `-`.

| Ordem | Bitola (mm) | Área (cm2) | Peso (kg/m) |
|---|---|---|---|
| 0 | 4 | 0.00 | 0.10 |
| 1 | 5 | 0.20 | 0.16 |
| 2 | 6.3 | 0.315 | 0.25 |
| 3 | 8 | 0.5 | 0.40 |
| 4 | 10 | 0.8 | 0.63 |
| 5 | 12.5 | 1.25 | 1.0 |
| 6 | 16 | 2.0 | 1.6 |
| 7 | 20 | 3.15 | 2.5 |
| 8 | 22.2 | 3.88 | 3.05 |
| 9 | 25 | 5.0 | 4.0 |

A bitola de ordem 0 tem área nula e está desativada.

### Altura da laje (linhas 76 a 84, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 77 | 6 | Altura total mínima da laje, em cm |
| 78 | 40 | Altura total máxima da laje, em cm |
| 79 | 100 | Porcentagem utilizada da linha neutra, em % |
| 80 | 300 | Relação mínima Lmenor/flecha com carga total |
| 81 | 500 | Relação mínima Lmenor/flecha com carga acidental |
| 82 | S | Calcula a flecha com deformação lenta (NB1 4.2.3.1.B), S ou N |
| 83 | 0.9 | Multiplicador de Ec (NB1 8.2.5) para o cálculo de deformação |
| 84 | 2.50 | Densidade do concreto para o peso próprio, em t/m3 |

### Relação entre esforços positivos (linhas 98 a 112, com `FIM` na linha 113)

Cada linha é um par `relação entre vão maior , relação entre esforços`. O arquivo distribuído tem 15 pares, de 0.25 , 0.40 até 4.00 , 2.50. O comentário limita a 20 pares.

### Momentos negativos (linhas 135 a 137, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 135 | 2.00 | Relação máxima Mneg/Mpos quando engastado |
| 136 | 0.30 | Relação mínima Mneg/Mpos quando engastado |
| 137 | 1.00 | Relação fixa Mneg/Mpos em cantos reentrantes (não maior que 1) |

### Armaduras mínimas e eficiência (linhas 150 a 152, sem marcador)

| Linha | Valor | Significado |
|---|---|---|
| 150 | 0.15 | Porcentagem mínima de armadura para os esforços positivos |
| 151 | 0.10 | Porcentagem mínima de armadura para os esforços negativos |
| 152 | 100 | Eficiência da armadura negativa, em % |

### Espaçamento entre barras longitudinais (linhas 158 e 159, sem marcador)

| Linha | Valor | Significado |
|---|---|---|
| 158 | 20 | Espaçamento máximo entre barras longitudinais, em cm |
| 159 | S | Compara o espaçamento máximo com 2 vezes a altura total, S ou N |

### Espaçamento mínimo por altura (linhas 170 a 173, sem `FIM`)

Cada linha é `altura total até , espaçamento mínimo`. Valores distribuídos: 10.0 , 7.5; 22.0 , 10.0; 30.0 , 12.5; 40.0 , 15.0.

### Lista de espaçamentos (linha 180)

`7.5/ 10/ 12.5/ 15/ 17.5/ 20/`. O último valor deve ser igual ao espaçamento máximo da linha 158. O comentário do arquivo pede isso.

### Bitola preferencial por altura (linhas 194 a 199, sem `FIM`)

Cada linha é `altura total até , bitola preferencial , ordem`. Valores distribuídos: 5.0 , 4.0 , 0; 5.5 , 5.0 , 1; 14.0 , 6.3 , 2; 25.0 , 8.0 , 3; 32.0 , 10.0 , 4; 40.0 , 12.5 , 5.

O fim do conteúdo útil é `FINAL DA PARAMETRIZACAO` na linha 202.

## SISTRUT.PIP (PILAR)

### Globais (linhas 31 e 32)

| Linha | Valor | Significado |
|---|---|---|
| 32 | 2 | Cobrimento da armadura para detalhamento, em cm |

### Tabela de bitolas (linhas 42 a 55)

Mesmo formato da tabela do LAP, com ORDEM de 0 a 12 e 13 linhas. Ordens 0 e 1 têm área nula e estão desativadas. Ordem 12 é a bitola de 40 mm.

### Coeficientes do pilar (linhas 71 a 80, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 71 | 0.6 | Multiplicador de Fck para a tensão admissível (Nk/Área) |
| 72 | 0.75 | Multiplicador de Fck para a tensão admissível (Nk/Área + Mk/W) |
| 73 | 1.50 | Taxa ideal de armadura para o predimensionamento, em % |
| 74 | 14 | Medida mínima da coluna para o predimensionamento, em cm |
| 75 | 5 | Múltiplo da medida da seção da coluna para o predimensionamento, em cm |
| 76 | S | Acrescenta o peso próprio da coluna, S ou N |
| 77 | 2.50 | Densidade do concreto para o peso próprio, em t/m3 |
| 78 | 10 | Porcentagem da carga total da coluna considerada acidental |
| 79 | N | Reduz para a fundação a parcela acidental da carga, S ou N |
| 80 | N | Reduz para o dimensionamento a parcela acidental da carga, S ou N |

### Matriz de condições de apoio (linhas 101 a 105, com `PARAMETROS` na linha 100)

Quatro condições nas linhas e nas colunas: ENGASTE, SEMI-ENGASTE, CONTINUIDADE e LIVRE. Cada linha da matriz começa pelo nome da condição, seguido de `,`. As células são separadas por `,`. A célula LIVRE / LIVRE vale `NAO`.

| Linha da matriz | ENGASTE | SEMI-ENGASTE | CONTINUIDADE | LIVRE |
|---|---|---|---|---|
| ENGASTE | 0.50 | 0.70 | 0.70 | 2.00 |
| SEMI-ENGASTE | 0.70 | 0.90 | 0.85 | 2.00 |
| CONTINUIDADE | 0.70 | 0.85 | 1.00 | 2.00 |
| LIVRE | 2.00 | 2.00 | 2.00 | NAO |

Pelos valores, a matriz parece ser o coeficiente de comprimento de flambagem (K). O arquivo não diz a grandeza, então isso é inferência.

### Armadura (linhas 110 a 115)

| Linha | Valor | Significado |
|---|---|---|
| 110 | 0.8 | Porcentagem mínima de armadura em relação à seção calculada |
| 111 | 0.5 | Porcentagem mínima de armadura em relação à seção real |
| 112 | 6.0 | Porcentagem máxima de armadura em relação à área da seção |
| 113 | S | Considera o transpasse da armadura no cálculo da taxa, S ou N |
| 114 | S | Mistura bitolas na seção no dimensionamento, S ou N |
| 115 | 5 | Ordem da mínima bitola longitudinal a usar |

### Tabelas de bitola com colunas não identificadas (linhas 123 a 135, 157 a 168, 196 a 207)

Três tabelas seguem uma linha `PARAMETROS` e não têm `FIM`. O significado das colunas não está no arquivo:

- Linhas 123 a 135: ORDEM, bitola e três colunas em cm (por exemplo, 25.0, 30.0 e 35.0 na primeira bitola). A grandeza não está confirmada.
- Linhas 157 a 169: ORDEM, bitola e duas colunas sem legenda (terceira e quarta colunas). Cada uma tem `NAO` ou um número. Pela posição, a terceira parece ser bitola transversal e a quarta, espaçamento máximo. Isso é inferência, o arquivo não legenda as colunas.
- Linhas 196 a 208: bitola, ORDEM e quatro colunas. A ordem das duas primeiras colunas é inversa à das outras tabelas.

### Opções de detalhamento (linhas 241 a 249, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 241 | N | Letra para dar nome aos ferros (exemplo: 3 N15) |
| 242 | S | Verifica o travamento contra flambagem das barras longitudinais, S ou N |
| 243 | 2 | Número máximo de barras adjacentes consideradas travadas |
| 244 | N | Arranque e transpasse com seção constante e As igual, S ou N |
| 245 | N | Arranque e transpasse com seção constante e As diferente, S ou N |
| 246 | S | Suspende a armadura inferior, S ou N |
| 247 | S | Suspende a armadura coincidente com seção diferente, S ou N |
| 248 | 2 | Ordem da bitola menor ou igual considerada CA60 |
| 249 | 1050 | Comprimento máximo da ferragem, em cm |

O fim do conteúdo útil é `FINAL DA PARAMETRIZACAO` na linha 251.

## SISTRUT.DSP (DESENHO)

### Globais (linhas 32 a 46)

| Linha | Valor | Significado |
|---|---|---|
| 32 | 1.0 | Coeficiente multiplicador dos momentos negativos (0.15 a 1.0) |
| 33 | 0.15 | Fck, resistência característica do concreto |
| 34 | 5.00 | Fyk, resistência característica do aço |
| 35 | B | Tipo de aço, A ou B |
| 36 | 1 | Coeficiente que converte Fck e Fyk para t/cm2 |
| 37 | t/cm2 | Unidade de Fck e Fyk |
| 38 | 0.9 | Multiplicador de Ec (NB1 8.2.5) para o cálculo de deformação |
| 39 | 2.00 | Cobrimento da armadura, em cm |
| 40 | 2.00 | Acréscimo ao cobrimento para o início da altura útil, em cm |
| 41 | S | Alívio de esforços cortantes, S ou N |
| 42 | N | Cargas acidentais envoltórias, S ou N |
| 43 | N | Momentos externos aplicados nas extremidades, S ou N |
| 44 | 1.4 | Coeficiente de segurança aos esforços |
| 45 | 1.4 | Coeficiente de segurança para o concreto |
| 46 | 1.15 | Coeficiente de segurança para o aço |

### Tabela de bitolas (linhas 57 a 66)

Mesmo formato do LAP. ORDEM de 0 a 9, com bitolas de 4 a 32 mm. A ordem 9 (32 mm) aparece com área 0.00, ou seja, desativada. O DSP não tem a bitola de 3.2 mm que o PIP usa.

### Coeficientes de ancoragem e fissuração (linhas 83 a 91, com `PARAMETROS` na linha 82, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 83 | 0.0015 | Multiplicador de Bw * Hw para a armadura mínima |
| 84 | 0.75 | Multiplicador de d para o comprimento da decalagem |
| 85 | 1.00 | Multiplicador do comprimento de ancoragem, ferragem positiva |
| 86 | 1.50 | Multiplicador do comprimento de ancoragem, ferragem negativa |
| 87 | S | Verifica a ancoragem mínima de 10 diâmetros da decalagem, S ou N |
| 88 | N | Calcula a flecha considerando inércia fissurada, S ou N |
| 89 | N | Calcula a flecha com deformação lenta (NB1 4.2.3.1.B), S ou N |
| 90 | N | Verifica a fissuração e permite alterar a armadura, S ou N |
| 91 | 3 | Limite de verificação à fissuração (1, 2 ou 3, pela NB1) |

### Grupos de bitolas para escolha da armadura (linhas 118 a 120, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 118 | 3 | Número de grupos de bitolas |
| 119 | 18 | Limite do primeiro intervalo (LIM 1) |
| 120 | 39 | Limite do segundo intervalo (LIM 2) |

### Tabelas de intervalo (linhas 124 a 176)

Três tabelas com cabeçalho `1 INTERVALO`, `2 INTERVALO` e `3 INTERVALO`. Cada linha segue `limite - N#bitola+M#bitola`, por exemplo `3.0 - 2#12.5+#8`. Cada tabela termina com `FIM` (linhas 143, 166 e 176).

| Tabela | Linhas | Limite final | Última linha |
|---|---|---|---|
| 1 INTERVALO | 125 a 142 | 70.0 | 70.0 - N#20 |
| 2 INTERVALO | 147 a 165 | 70.0 | 70.0 - N#25 |
| 3 INTERVALO | 170 a 175 | 70.0 | 70.0 - N#25 |

A grandeza comparada com o limite não está no arquivo.

### Número de barras e grupo de corte (linhas 193 a 221, sem marcador)

Três blocos com cabeçalho `NUMERO DE BARRAS TOTAIS    GRUPO DE CORTE`, nas linhas 193, 203 e 213. Cada linha é `número de barras - grupo`, de 2 até `>9`. Os blocos não têm `FIM`. A relação com as tabelas de intervalo não está confirmada.

### Estribos (linhas 226 a 239)

| Linha | Valor | Significado |
|---|---|---|
| 226 | 0.14 | Multiplicador de Bw para a armadura mínima de cisalhamento |
| 227 | 10.0 | Espaçamento mínimo de estribos, em cm |
| 228 | 30.0 | Espaçamento máximo de estribos, em cm, comparado com d/2 ou H/2 |
| 229 | 0 | Comparação do espaçamento máximo: 0 para d/2, 1 para H/2 |
| 230 | 39 | Largura máxima para estribos simples, em cm |
| 231 | 59 | Largura máxima para estribos duplos, em cm |

Na linha 239 há a lista `10/ 12/ 15/ 17/ 20/ 22/ 25/ 27/ 30/`, sob o cabeçalho `ESPACAMENTO DE ESTRIBOS` (linha 238).

A ARMADURA.INI usa 40 e 60 para larguras de estribo duplo e triplo. Os valores 39 e 59 do DSP não foram ligados a esses campos.

### Tabela de estribos máximo e mínimo (linhas 252 a 257, sem marcador)

Seis pares `máximo - mínimo`: 12.5 - 8; 10 - 6.3; 8 - 6.3; 6.3 - 6.3; 5 - 5; 4 - 4. O arquivo não legenda a tabela.

### Tabelas com colunas não identificadas (linhas 274 a 283, 292 a 297, 310 a 315)

- Linhas 274 a 283: seis colunas por bitola, com `NAO` nas bitolas de 16 mm em diante na última coluna.
- Linhas 292 a 297: duas colunas por bitola. Os valores são 15, 30, 70, 85, 120 e `acima de 120`.
- Linhas 310 a 315: duas colunas por bitola. Os valores são 30, 70, 100, 140, 180 e `acima de 180`.

A grandeza dessas colunas não está confirmada.

### Opções de desenho (linhas 319 a 334, com `PARAMETROS` na linha 318, sem `FIM`)

| Linha | Valor | Significado |
|---|---|---|
| 319 | N | Letra para dar nome aos ferros (exemplo: 3 N15) |
| 320 | S | Colocação automática de porta-estribos, S ou N |
| 321 | 2 | Ordem da mínima bitola de porta-estribo |
| 322 | 15 | Transpasse do porta-estribo, em cm (15) ou em diâmetros (D20) |
| 323 | S | Calcula o comprimento da ferragem desenvolvida, S ou N |
| 324 | 8 | Raio de dobramento a 90 graus, em diâmetros |
| 325 | 0.001 | Multiplicador de Bw * d para a armadura negativa mínima |
| 326 | 60 | Altura da viga a partir da qual há armadura de pele |
| 327 | 0.0005 | Multiplicador de Bw * Hw para a armadura de pele em uma face |
| 328 | 20 | Transpasse da armadura de pele, em cm (20) ou em diâmetros (D20) |
| 329 | 40 | Distância mínima para colocar estribos nas extremidades, em cm |
| 330 | 20 | Entrada mínima da ferragem nos apoios, em diâmetros |
| 331 | S | Verificação de grampos nos apoios, S ou N |
| 332 | N | Reduz a ancoragem positiva em função de Ase/Anec, S ou N |
| 333 | 1 | Ordem da bitola menor ou igual considerada CA60 |
| 334 | 1050 | Comprimento máximo da ferragem, em cm |

O fim do conteúdo útil é `FINAL DA PARAMETRIZACAO` na linha 336. Depois dele há 117 bytes 0x1A. É padding do formato e não tem significado para o módulo. A biblioteca SISCOMUM remove esses bytes ao ler.

## SISTRUT.FOP (FORMA)

Texto livre de 11 linhas em CRLF, com 380 bytes. Traz o cabeçalho da empresa e um aviso de protótipo. Não tem campos nem valores. O FORMA.INI informa o nome (`SISTRUT`) e o diretório (`C:\SISTRUT\EXEC40\`) dos arquivos .FOP.

## Decisões em aberto

- Marcador `FIM` não é uniforme. SISTRUT.LAP tem um `FIM` (linha 113), SISTRUT.PIP não tem nenhum e SISTRUT.DSP tem três (linhas 143, 166 e 176). Não está confirmado se o módulo lê as tabelas sem `FIM` por contagem fixa de linhas ou por marcador. A leitura por posição é uma inferência.
- Blocos sem `PARAMETROS` no cabeçalho: LAP linhas 150 a 152, 158 a 159 e 180; DSP linhas 193 a 221, 238 a 239 e 252 a 257.
- Colunas sem legenda: PIP linhas 123 a 135, 157 a 169 e 196 a 208; DSP linhas 274 a 283, 292 a 297 e 310 a 315.
- Matriz de apoios do PIP (linhas 101 a 105): a grandeza parece ser K, mas o arquivo não diz.
- Valores 39 e 59 de largura de estribo no DSP (linhas 230 e 231) e 40 e 60 no ARMADURA.INI. Não está confirmado se são a mesma grandeza nem a mesma unidade.
- Bitolas com área nula (LAP ordem 0, PIP ordens 0 e 1, DSP ordem 9): a leitura de desativação segue a regra do próprio LAP. Não foi testada no módulo.
