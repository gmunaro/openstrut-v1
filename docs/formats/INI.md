# Formato dos arquivos .INI

Os arquivos .INI guardam a configuração de cada módulo do SISTRUT 4.0: drives e diretórios, unidades, coeficientes de segurança, limites de memória e códigos de impressora. Os exemplos distribuídos estão em `dist/sistrut-game/`. Este documento cobre LAJE, VIGA, DESENHO, ARMADURA, PILAR, FORMA e VPLOTA. Os arquivos SISTRUT.INI e PLOTER.INI têm documentos próprios.

## Regras de leitura

1. Cada parâmetro segue a forma `VALOR=DESCRICAO`.
2. A leitura divide a linha no primeiro `=`. Assim, uma descrição que contenha `=` fica intacta.
3. O valor é o texto à esquerda do separador, sem espaços nas bordas. FORMA.INI e VPLOTA.INI têm valores com espaços à esquerda, como ` 841 `.
4. Linhas sem `=` não são parâmetros. São textos de ajuda, cabeçalhos e listas. A biblioteca SISCOMUM ignora essas linhas.
5. Listas de bitolas em ARMADURA.INI e PILAR.INI são linhas sem `=`, lidas por posição pelo módulo que as usa. A biblioteca não as interpreta.
6. O fim de linha pode ser CRLF ou LF. A leitura aceita os dois.
7. O valor `CHR$(n)+CHR$(m)+...` é uma expressão. A biblioteca a avalia e obtém a sequência de bytes enviada à impressora. Por exemplo, `CHR$(27)+CHR$(50)` resulta em ESC 2, que define espaçamento de 1/6 de polegada.
8. Um valor pode estar vazio. Em SISTRUT.INI, a linha `=ARQUIVO .BAT ACESSADO NA INSTALACAO` tem valor vazio.

## Arquivos e módulos

| Arquivo | Módulo | Parametrização que aponta | Observação |
|---|---|---|---|
| LAJE.INI | LAJE | .LAP | Limites de tabelas e defaults de unidades |
| VIGA.INI | VIGA | nenhuma | Opções de carga acidental e de momentos |
| DESENHO.INI | DESENHO | .DSP | Diretórios de vigas, .DSP, .EDV e .DXF |
| ARMADURA.INI | ARMADURA | nenhuma | Listas de bitolas e áreas em linhas sem `=` |
| PILAR.INI | PILAR (PILAREDI) | .PIP | Listas de bitolas, excentricidade e esbeltez |
| FORMA.INI | FORMA | .FOP | Folha de corte, carimbo e opções de impressão |
| VPLOTA.INI | VPLOTA | .DSP | Montagem de folha DXF; termina em `FINAL DE PARAMETRIZACAO` sem `=` |

## LAJE.INI

| Campo (valor à esquerda) | Significado | Default distribuído |
|---|---|---|
| C | Drive padrão para os dados | C |
| \ | Diretório padrão para os dados | \ |
| SISTRUT | Nome da parametrização padrão (.LAP) | SISTRUT |
| C:\SISTRUT\EXEC40\ | Drive e diretório dos arquivos de parametrização (.LAP) | C:\SISTRUT\EXEC40\ |
| 80 | Número máximo de lajes arquivadas | 80 |
| 40 | Número máximo de eixos de auxílio em cada direção | 40 |
| 200 | Número máximo de traços do contorno de arquitetura | 200 |
| 70 | Número máximo de cargas lineares | 70 |
| 70 | Número máximo de traços do polígono de carga por área | 70 |
| 200 | Número máximo de traços da estrutura | 200 |
| 100 | Número máximo de pilares | 100 |
| 200 | Número máximo de vigas | 200 |
| L | Denominação usada para as lajes | L |
| 0 | Nível somado à numeração das lajes | 0 |
| V | Denominação usada para as vigas | V |
| 0 | Nível somado à numeração das vigas | 0 |
| m | Unidade de medida linear | m |
| t | Unidade de força | t |
| 1 | Coeficiente que converte a unidade linear em metros | 1 |
| 1 | Coeficiente que converte a unidade de força em toneladas | 1 |
| t/cm2 | Unidade de Fck e Fyk | t/cm2 |
| 1 | Coeficiente que converte Fck e Fyk em t/cm2 | 1 |
| 0.15 | Fck, resistência característica do concreto | 0.15 |
| 5.0 | Fyk, resistência característica do aço | 5.0 |
| B | Tipo de aço (A ou B) | B |
| 1.4 | Coeficiente de segurança dos esforços | 1.4 |
| 1.4 | Coeficiente de segurança do concreto | 1.4 |
| 1.15 | Coeficiente de segurança do aço | 1.15 |
| CHR$(27)+CHR$(50) | Espaçamento padrão da impressora, 1/6 de polegada | ESC 2 |
| CHR$(27)+CHR$(48) | Espaçamento de impressão, 1/8 de polegada | ESC 0 |
| CHR$(27)+CHR$(78)+CHR$(6) | Linhas puladas no picote | ESC N 6 |
| CHR$(27)+CHR$(79) | Anula o pulo do picote, usado em gráficos | ESC O |

A descrição de Fyk no arquivo grafa "CATACTERISTICA". O texto foi mantido como está no original.

## VIGA.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| C | Drive padrão para os dados | C |
| \ | Diretório padrão para os dados | \ |
| m | Unidade de medida linear | m |
| t | Unidade de força | t |
| 1 | Coeficiente que converte a unidade linear em metros | 1 |
| 1 | Coeficiente que converte a unidade de força em toneladas | 1 |
| 100 | Porcentagem multiplicadora dos momentos negativos para redução (faixa de 15 a 100) | 100 |
| N | Considera carga acidental nos dados e resultados (S ou N) | N |
| F | Carga acidental vinda da entrada de dados (F) ou gerada pelo programa (G) | F |
| 30 | Porcentagem de carga acidental gerada em relação à carga total (faixa de 4 a 96) | 30 |
| N | Aplicação e fornecimento de momentos externos acidentais (S ou N) | N |
| E | Indexação e somatória em pilares com reações estáticas (E) ou máximas (M) | E |
| 200 | Número máximo de vigas arquivadas simultaneamente em memória | 200 |
| 150 | Número máximo de vigas para processamento conjunto com reação em pilares | 150 |
| 80 | Número máximo de pilares diferentes para a somatória de cargas | 80 |
| CHR$(27)+CHR$(50) | Espaçamento padrão da impressora, 1/6 de polegada | ESC 2 |
| CHR$(27)+CHR$(48) | Espaçamento de impressão, 1/8 de polegada | ESC 0 |
| CHR$(27)+CHR$(78)+CHR$(6) | Linhas puladas no picote | ESC N 6 |
| CHR$(27)+CHR$(79) | Anula o pulo do picote, usado em gráficos | ESC O |

## DESENHO.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| SISTRUT | Nome da parametrização padrão (.DSP) | SISTRUT |
| C:\ | Drive e diretório dos arquivos de vigas (.VIG, .SEC, .FOR) | C:\ |
| C:\SISTRUT\EXEC40\ | Drive e diretório dos arquivos de parametrização (.DSP) | C:\SISTRUT\EXEC40\ |
| C:\ | Drive e diretório das vigas editadas (.EDV) | C:\ |
| C:\ | Drive e diretório dos arquivos CAD (.DXF ou .PUB) | C:\ |
| m | Unidade de medida linear | m |
| t | Unidade de força | t |
| 1 | Coeficiente que converte a unidade linear em metros | 1 |
| 1 | Coeficiente que converte a unidade de força em toneladas | 1 |
| CHR$(...) | Quatro códigos de impressora, iguais aos dos demais módulos | ESC 2, ESC 0, ESC N 6, ESC O |

Para usar outra parametrização, troque o nome em `SISTRUT=` por um nome novo e aponte o diretório dele na linha `C:\SISTRUT\EXEC40\=`. O texto de ajuda do arquivo descreve esse procedimento.

## ARMADURA.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| C | Drive padrão para os dados | C |
| \ | Diretório padrão para os dados | \ |
| m | Unidade de medida linear | m |
| t | Unidade de força | t |
| 1 | Coeficiente que converte a unidade linear em metros | 1 |
| 1 | Coeficiente que converte a unidade de força em toneladas | 1 |
| t/cm2 | Unidade de Fck e Fyk | t/cm2 |
| 1 | Coeficiente que converte Fck e Fyk em t/cm2 | 1 |
| 0.15 | Fck, resistência característica do concreto | 0.15 |
| 5.0 | Fyk, resistência característica do aço | 5.0 |
| B | Tipo de aço (A ou B) | B |
| Lista sem `=` (13 valores) | Diâmetros das bitolas em mm, na ordem das áreas | 3.2, 4, 5, 6.3, 8, 10, 12.5, 16, 20, 22.2, 25, 32, 40 |
| Lista sem `=` (13 valores) | Áreas das bitolas em cm2, na mesma ordem | 0.08, 0.125, 0.2, 0.315, 0.5, 0.8, 1.25, 2, 3.15, 3.88, 5, 8, 12.5 |
| 0.53 | Limite da linha neutra para considerar armadura dupla | 0.53 |
| 0.0015 | Taxa de armadura longitudinal tracionada usada na correção da tensão de cisalhamento | 0.0015 |
| 1.4 | Coeficiente de segurança dos esforços | 1.4 |
| 1.4 | Coeficiente de segurança do concreto | 1.4 |
| 1.15 | Coeficiente de segurança do aço | 1.15 |
| 40 | Largura da peça, em cm, a partir da qual o estribo é duplo (4 ramos) | 40 |
| 60 | Largura da peça, em cm, a partir da qual o estribo é triplo (6 ramos) | 60 |
| CHR$(...) | Quatro códigos de impressora | ESC 2, ESC 0, ESC N 6, ESC O |

A linha de limite de largura usa a unidade da peça. A unidade de origem não está descrita no arquivo, então o valor 40 e o valor 60 assumem centímetros. Ver decisões em aberto.

## PILAR.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| C | Drive padrão para os dados | C |
| \ | Diretório padrão para os dados | \ |
| SISTRUT | Nome da parametrização padrão (.PIP) | SISTRUT |
| C:\SISTRUT\EXEC40\ | Drive e diretório dos arquivos de parametrização (.PIP) | C:\SISTRUT\EXEC40\ |
| 20 | Número máximo de seções (arquivadas ou poligonais de edifício) | 20 |
| 200 | Número máximo de barras internas em uma seção | 200 |
| 40 | Número máximo de vértices de uma seção poligonal | 40 |
| 30 | Número máximo de colunas dimensionadas simultaneamente | 30 |
| 40 | Número máximo de níveis para definir as colunas | 40 |
| 15 | Número máximo de variações de armadura em uma coluna | 15 |
| m | Unidade de medida linear | m |
| t | Unidade de força | t |
| 1 | Coeficiente que converte a unidade linear em metros | 1 |
| 1 | Coeficiente que converte a unidade de força em toneladas | 1 |
| t/cm2 | Unidade de Fck e Fyk | t/cm2 |
| 1 | Coeficiente que converte Fck e Fyk em t/cm2 | 1 |
| 0.15 | Fck, resistência característica do concreto | 0.15 |
| 5.0 | Fyk, resistência característica do aço | 5.0 |
| B | Tipo de aço (A ou B) | B |
| Lista sem `=` (13 valores) | Diâmetros das bitolas em mm | 3.2, 4, 5, 6.3, 8, 10, 12.5, 16, 20, 22.2, 25, 32, 40 |
| Lista sem `=` (13 valores) | Áreas das bitolas em cm2 | 0.08, 0.125, 0.2, 0.315, 0.5, 0.8, 1.25, 2, 3.15, 3.88, 5, 8, 12.5 |
| 0.9 | Multiplicador de Ec (NB1 8.2.5), módulo de elasticidade do concreto | 0.9 |
| 2 | Excentricidade acidental mínima, em cm, comparada com H/30 | 2 |
| S | Verifica a excentricidade acidental mínima de H/30 (S ou N) | S |
| I | Excentricidades acidentais isoladas (I) ou simultâneas (S) na verificação | I |
| S | Considera seções retangulares e circulares simétricas (S ou N) | S |
| 40 | Lambda a partir do qual considera deformação de 2a ordem | 40 |
| 80 | Lambda a partir do qual considera excentricidade acidental de fluência | 80 |
| 140 | Lambda a partir do qual a deformação é calculada pelo processo exato | 140 |
| 0 | Coeficiente de fluência na excentricidade equivalente (0 a 2) | 0 |
| 0.95 | Multiplicador de Nk para obter a carga que produz fluência | 0.95 |
| 1.1 | Multiplicador da carga de fluência no cálculo da excentricidade (1.1 a 1.25) | 1.1 |
| 1.4 | Coeficiente de segurança dos esforços | 1.4 |
| 1.4 | Coeficiente de segurança do concreto | 1.4 |
| 1.15 | Coeficiente de segurança do aço | 1.15 |
| CHR$(...) | Quatro códigos de impressora | ESC 2, ESC 0, ESC N 6, ESC O |

## FORMA.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| SISTRUT | Nome da parametrização padrão (.FOP) | SISTRUT |
| C:\SISTRUT\EXEC40\ | Drive e diretório dos arquivos de parametrização (.FOP) | C:\SISTRUT\EXEC40\ |
| C:\ | Drive e diretório das lajes (.LAJ) | C:\ |
| C:\ | Drive e diretório das vigas (.VIG, .SEC, .FOR) | C:\ |
| C:\ | Drive e diretório das colunas (.COL) | C:\ |
| C:\ | Drive e diretório das formas (.FRM) | C:\ |
| C:\ | Drive e diretório dos arquivos CAD (.DXF) | C:\ |
| C:\ | Drive e diretório dos arquivos de plotagem (.PLT) | C:\ |
| 841 | Largura de corte da folha, em mm | 841 |
| 594 | Altura de corte da folha, em mm | 594 |
| 25 | Margem à esquerda da folha de corte, em mm | 25 |
| 10 | Margem nas outras faces da folha, em mm | 10 |
| 175 | Largura do carimbo a partir da margem direita, em mm | 175 |
| 287 | Altura do carimbo a partir da margem inferior, em mm | 287 |
| 50 | Escala do desenho | 50 |
| 3 | Altura da letra do nome dos pilares, em mm | 3 |
| 3 | Altura da letra do nome das vigas, em mm | 3 |
| 3 | Altura da letra do nome das lajes, em mm | 3 |
| 2 | Altura da letra das cotas de amarração, em mm | 2 |
| 2 | Altura da letra das cotas de elevação e cortes, em mm | 2 |
| 1.5 | Altura da letra dos extras, em mm | 1.5 |
| N | Arquivo gerado em disco (S ou N) | N |
| 0 | X inicial da plotagem, em mm, para plotagem direta ou arquivo | 0 |
| 0 | Y inicial da plotagem, em mm, para plotagem direta ou arquivo | 0 |
| S (nove linhas) | Impressão de nome e espessura das lajes, nome e seção das vigas, nome e seção dos pilares, cotas de amarração, traços e valores de elevação | S em todas |
| CHR$(...) | Quatro códigos de impressora | ESC 2, ESC 0, ESC N 6, ESC O |

Os valores têm espaço à esquerda. A leitura remove os espaços.

## VPLOTA.INI

| Campo | Significado | Default distribuído |
|---|---|---|
| Linha 1 e linha 2 sem `=` | Cabeçalho do software e data da parametrização | texto fixo |
| 841 | Largura de corte da folha, em mm | 841 |
| 594 | Altura de corte da folha, em mm | 594 |
| 25 | Margem à esquerda da folha de corte, em mm | 25 |
| 10 | Margem nas outras faces da folha, em mm | 10 |
| 175 | Largura do carimbo a partir da margem direita, em mm | 175 |
| 287 | Altura do carimbo a partir da margem inferior, em mm | 287 |
| 50 | Escala do desenho | 50 |
| C:\ | Drive de leitura dos arquivos DXF isolados | C:\ |
| C:\ | Drive de gravação do DXF da folha montada | C:\ |
| 35 | Distância entre desenhos (acima, abaixo e laterais), em mm | 35 |
| D | Posição da tabela: I (isolada), E (à esquerda) ou D (à direita) | D |
| S | Numeração das posições na folha: I (isolada) ou S (sequencial) | S |
| 6 | Altura da letra do nome da viga, em mm | 6 |
| 3 | Altura da letra do nome do ferro, em mm | 3 |
| 2.4 | Altura da letra da amarração, em mm | 2.4 |
| 3 | Altura da letra do nome dos apoios, em mm | 3 |
| 2.4 | Altura da letra dos cortes, em mm | 2.4 |
| 2.4 | Altura da letra dos estribos, em mm | 2.4 |
| 2.4 | Altura da letra da tabela, em mm | 2.4 |
| SISTRUT | Parametrização usada na montagem do desenho (.DSP) | SISTRUT |
| C:\ | Drive de leitura dos arquivos de dados (.VIG, .SEC, .FOR) | C:\ |
| C:\ | Drive de leitura das vigas editadas (.EDV) | C:\ |
| C:\ | Drive de plotagem dos arquivos (.PLT) | C:\ |
| N | Arquivo gerado em disco (S ou N) | N |
| 0 | X inicial da plotagem, em mm | 0 |
| 0 | Y inicial da plotagem, em mm | 0 |
| `FINAL DE PARAMETRIZACAO` (sem `=`) | Marca o fim do bloco de parâmetros. O texto de ajuda depois dele não é lido. | texto fixo |

## Decisões em aberto

- Os arquivos de parametrização (.LAP, .PIP, .DSP, .FOP) e o diretório dos executáveis aparecem como `C:\SISTRUT\EXEC40\`. A biblioteca separa os dois conceitos em `DirExec` e `DirParam`. A distribuição não confirma essa separação.
- Final de linha na gravação: a biblioteca pode manter o EOL original ou padronizar em CRLF. A escolha ainda está em aberto.
- Unidade das larguras de 40 e 60 em ARMADURA.INI: o arquivo não informa. O documento assume centímetros.
- A letra G em DESENHO e VIGA.INI (F/G) vem da descrição "fornecidos ou gerados". O arquivo distribuído não usa G.
