# DESDIM.EXE — spec de reconstrução

Fontes de evidência: strings do executável original `DESDIM.EXE` (fora do repositório) e `sistrut-game/SISTRUT.DSP` (parametrização, linhas 26–65). Os nomes de campo do DSP só entram quando batem com string do executável.

## Papel

Detalhamento e desenho de vigas contínuas. Título na tela: "DETALHAMENTO E DESENHO DE VIGAS CONTINUAS", com "Abril 1991" e "Versao 4.0".

Pelas strings, o módulo calcula por apoio e por tramo: momento, área de aço tracionado e comprimido, posição da linha neutra (x/d), esforço cortante, flecha e reações. Depois mostra os resultados em tabela e deixa o usuário alterar a armadura.

## Chamada e retorno

- Cadeia de blocos: `DESDIM`, `DETALHA`, `DESENHO`, `DESINIT`, `DESGRAF`.
- Blocos de runtime referenciados: `DESGRAFI`, `DESGRAED`, `DESAUXDI`, `DESCALC`, `DESDIMEN`, `MIXT`. Função de cada um não confirmada; `DESCALC` sugere o motor de cálculo [inferido].
- Retorno: "RET" e "Retorno ao Modulo Gerenciador".
- "PROXIMO": avança para a viga seguinte.
- Pede o disco do módulo quando não o encontra: "Coloque o Disco contendo o Modulo s em".
- Protocolo "VOLTA <MOD>" / "*VOLTA*" não aparece. [ev: ausência]

## Telas e menus

| Texto | Função / hotkey | Padrão |
|---|---|---|
| "Concreto Fck", "Aco", "Fyk" | Dados de material | DSP (ver Entradas) |
| "Cobrimento" | Cobrimento | DSP |
| "Negativos reduzidos a" | Coeficiente dos momentos negativos | DSP |
| "APOIO  Bw   Hw    x/d    Mk      Ast     Asc" | Cabeçalho da tabela de apoios | — |
| "TRAMO Bw Hw Bf Hf x/d Mk Ast Asc Vke Aee Vkd Aed" | Cabeçalho da tabela de tramos | — |
| "Continua ..." | Paginação | — |
| "Atencao !!!" + avisos (abaixo) | Alerta | — |
| "Continuo com o processamento desta Viga S/*N*" | Confirma seguir | N |
| "Altero a Armacao N/*S*" | Entra em alteração | N |
| "Altero novamente S/*N*" | Repete alteração | N |
| "Modifico as Armaduras N/*S*" | Entra em alteração | N |
| "Numero do Apoio *FIM*", "Numero do Tramo *FIM*" | Escolha do apoio/tramo a alterar; FIM encerra | FIM |
| "Alteracao da armadura nos Apoios", "... nos Tramos" | Título da tela de alteração | — |
| "Apoio *FIM*", "Tramo *FIM*" | Encerra a tela | FIM |
| "=<Enter> mantem a armadura  OU  a+b para misturar" | Entrada de bitolas | Enter |
| "Bitola(mm) Tracionada *MESMA*", "Armadura Comprimida *MESMA*" | Entrada de bitolas | MESMA |
| "Numero de Barras  *NECESSARIO*" | Entrada de quantidade | — |
| "##+## CORTADAS CADA ##," | Espaçamento de barras cortadas | — |
| "- <Enter> para anular  ou  a#b <Enter> a>0" | Anular ou misturar bitolas | Enter |
| "Bitola (mm)", "Quantidade" | Campos de bitola/quantidade | — |
| "Ok" | Confirmação | — |
| "Qualquer Tecla para Continuar" | Pausa | — |
| "OBRA - ¼", "VIGA - Q", "REGISTRO" | Cabeçalho de contexto | — |

Hotkeys além de RET e PROXIMO não aparecem como letra destacada. [inferido: as letras das opções "S/N" e "*FIM*" são as iniciais das palavras]

Textos de ajuda: "Para armadura dos estribos, duas bitolas diferentes sao usadas. A primeira (MAXIMA), para suportar os maximos esforcos atuantes. A segunda (MINIMA), para cobrir os esforcos minimos." Campos: "Bitola Maxima *", "Bitola Minima *".

## Entradas do usuário

| Campo | Unidade | Padrão (SISTRUT.DSP) | Evidência |
|---|---|---|---|
| Fck (resistência do concreto) | t/cm² | 0.15 | DSP linha 33 |
| Fyk (resistência do aço) | t/cm² | 5.00 | DSP linha 34 |
| Tipo de aço | A ou B | B | DSP linha 35 |
| Coeficiente de Fck/Fyk para T/C² | — | 1 | DSP linha 36 |
| Coeficiente dos momentos negativos | 0,15 a 1,0 | 1.0 | DSP linha 32 |
| Cobrimento da armadura | cm | 2.00 | DSP linha 39 |
| Acréscimo ao cobrimento (início da altura útil) | cm | 2.00 | DSP linha 40 |
| Alívio de esforços cortantes | S/N | S | DSP linha 41 |
| Cargas acidentais envoltórias | S/N | N | DSP linha 42 |
| Momentos externos nas extremidades | S/N | N | DSP linha 43 |
| Coef. de segurança (esforços / concreto / aço) | — | 1.4 / 1.4 / 1.15 | DSP linhas 44–46 |
| Bitolas e áreas | mm, cm², kg/m | 10 bitolas (ordem 0–9) | DSP linhas 56–65 |
| Bitola e quantidade por apoio/tramo | mm / nº | "MESMA" como padrão | tela de alteração |

Nota: o "Ec multiplicador 0.9 (NB1 8.2.5)" (DSP linha 38) não tem correspondência direta nas strings de DESDIM. [lacuna]

## Arquivos lidos e gravados

| Arquivo | Operação | Evidência |
|---|---|---|
| `SISTRUT.DSP` | lido (parâmetros globais e tabela de bitolas) | DSP linhas 31–65; rótulos de material e cobrimento |
| Arquivo da viga (.VIG/.SEC ou similar) | lido [inferido] | "Viga nao existente" não aparece aqui; sem nome de extensão nas strings de DESDIM |
| Resultado editado (.EDV) | gravado [inferido] | ver DESEDITA |

Formato dos arquivos de viga não foi lido nesta passada. [lacuna]

## Processamento

- Carrega os parâmetros do DSP (material, cobrimento, coeficientes de segurança, bitolas). [ev: DSP 31–65]
- Para cada viga, calcula por apoio e por tramo: momento (Mk), áreas de aço tracionado e comprimido (Ast, Asc), posição da linha neutra (x/d), cortante (Vke, Vkd), armadura de estribo (Aee, Aed), flecha em cm e reações estáticas. Abreviações Bw, Hw, Bf, Hf: largura e altura da alma e da mesa [inferido].
- Quando "Cargas acidentais envoltórias" = S, calcula envoltória de carga acidental. [ev: DSP linha 42]
- Se o cálculo falha ou a armadura não cabe: "ARMADURA INSUFICIENTE", "BITOLA NAO PADRONIZADA" e alertas "Tensao de Cisalhamento acima do Limite." e "Momento Aplicado acima de 40% do Momento Limite da Armadura simples.".
- Estribos: duas bitolas, máxima e mínima.
- Alteração manual: o usuário troca bitola, quantidade e cortes por apoio ou tramo.
- Momentos de engastamento perfeito e esforços por apoio.
- Momentos externos (Mext) quando habilitados. [ev: DSP linha 43]

## Relatórios e impressão

- Tela de resultados por apoio e tramo, paginada com "Continua ...".
- Tela de envoltória e reações estáticas: "envoltoria de carga acidental ...", "soma das reacoes estaticas", "negativos reduzidos a".
- Impressão: não há string de impressora neste executável. [ev: ausência]

## Mensagens de erro

Avisos de cálculo: "Tensao de Cisalhamento acima do Limite.", "Momento Aplicado acima de 40% do Momento Limite da Armadura simples.", "BITOLA NAO PADRONIZADA", "ARMADURA INSUFICIENTE". Erros gerais: "erro no processamento", "verifique a consistencia dos seus dados", "Modulo nao encontrado em", "NAO EXISTE ESTE ARQUIVO NESTE DISCO", "O SEU DISCO DE DADOS ESTA COMPLETO", "VERIFIQUE O SEU DRIVE".

## Lacunas

1. Fórmulas de cálculo (Mk, x/d, Ast, Vke, flecha) não estão nas strings. Só a lista de rótulos. Não há base para reimplementar sem a análise do código.
2. Significado exato de "Negativos reduzidos a" e do "Ec multiplicador 0.9 (NB1 8.2.5)". Não há evidência de uso neste executável.
3. Formato dos arquivos da viga e do resultado: não lido nesta passada.
4. Papel dos blocos `DESCALC`, `DESDIMEN`, `DESGRAFI`, `DESAUXDI`, `MIXT`.
5. Ordem exata das telas: a ordem acima segue a posição das strings no executável, não o fluxo.
