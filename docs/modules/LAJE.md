# LAJE — Módulo gerenciador da família LAJE

Fontes: strings do executável original `LAJE.EXE` (fora do repositório), `sistrut-game/LAJE.INI` e `sistrut-game/SISTRUT.LAP`.
Convenção: `[ev: EXE]` = achado na busca no executável original. `[ev: LAJE.INI]` / `[ev: SISTRUT.LAP:Ln]` = arquivo de configuração. `[inferido]` = dedução sem evidência direta. Hotkey entre colchetes é sempre `[inferido]`.

## Papel

Módulo de entrada da família. Identifica o programa ("LAJES EM REGIME DE RUPTURA", Versão 4.0, Abril 1991). Carrega a parametrização (`.LAP`), define materiais, despacha para os submódulos e mostra a lista das lajes arquivadas.

## Inicialização

- Lê `LAJE.INI` e usa as chaves de drive, diretório e parametrização (ver Arquivos).
- Monta o caminho de parametrização a partir de `C:\SISTRUT\EXEC40\` [ev: LAJE.INI].
- Abre o `.LAP` informado. Mensagens: "Arquivo parametrizacao", ".LAP nao encontrado", "Erro no Arquivo parametrizacao", "ultimo dado lido".
- Se o arquivo falhar: "Sera adotada a parametrizacao SISTRUT" (retorno ao padrão embutido) `[inferido: LAJE.INI tem SISTRUT=PARAMETRIZACAO UTILIZADA]`.
- Erros de parametrização: "ERPARA"/"ERRPARA"; "NAO EXISTE ESTE ARQUIVO"; "ERRO NO ARQUIVO PARAMETRIZACAO &"; "Nenhum Arquivo Encontrado".
- Fim da parametrização: "FINAL DA PARAMETRIZACAO" (mesma marca usada no `SISTRUT.LAP`, linha 202).

## Menu principal

Cabeçalho: "LAJES EM REGIME DE RUPTURA", versão e "Abril 1991". Rodapé: "<F2> = Fim" e "escolha opcao".

As strings do executável não trazem números. A primeira letra de cada item está destacada na tela e não aparece nas strings. A ordem abaixo segue a posição das strings no executável, não necessariamente a ordem na tela.

| Opção (texto no executável) | Destino | Evidência |
|---|---|---|
| [D]efinicao dos Materiais, Concreto Aco | Tela de materiais | [ev] |
| [A]rquivar dados de Painel | LAJEGRAV | [inferido] |
| [C]ontinuidade / | LAJECALC | [inferido] |
| [E]spessura / | LAJECALC | [inferido] |
| [D]imensionamento | LAJECALC | [inferido] |
| [P]rocessar / Detalhar Lajes | LAJEPROC | [inferido] |
| [L]ista das Lajes Arquivadas | Tela própria | [ev] |
| [G]ravacao e Leitura | Não identificado (ver Lacunas) | lacuna |
| [V]isualizar e Alterar Parametrizacoes | Correcao de Parametros | [inferido] |
| Geometria (rótulo ausente) | LAJEGEOM | lacuna |

Hotkeys: todas as letras entre colchetes são `[inferido]`.

**Atualização (reconstrução):** a releitura do binário mostrou rótulos no formato `"N  -  texto"`, numerados de 1 a 7. As letras destacadas são mnemônicos visuais, não teclas. O fonte reconstruído (`LAJE.BAS`, `MenuPrincipal`) usa as teclas 1 a 7, nesta ordem: 1 Materiais, 2 Arquivar, 3 Continuidade/Espessura/Dimensionamento, 4 Processar, 5 Lista, 6 Gravação e Leitura e 7 Visualizar. As teclas 8 (Geometria) e 9 (Montagem) são acréscimos da reconstrução.

## Definicao dos Materiais

Título "Definicao dos Materiais e unidades de trabalho". Campos:

- Concreto Fck `*`. Padrão em LAJE.INI: 0.15, unidade t/cm² [ev: LAJE.INI].
- Aço Fyk `*`. Padrão em LAJE.INI: 5.0, unidade t/cm².
- Unidade de grandeza para Concreto e Aço. Multiplicador "para transformar em Tonelada/Centimetro2".
- Tipo de Aço A/B `*`. Padrão em LAJE.INI: B.

`*` marca campo com valor padrão (mesma convenção do LAJEGRAV).

## Correcao de Parametros

Tela para alterar a parametrização em uso. Texto literal da tela:

```
Correcao de Parametros
Parametrizacao Utilizada (.LAP)
(P)  Parametrizacao = <nome do .LAP>
Coeficientes de Seguranca
(1)  Forcas =
(2)  Concreto =
(3)  Aco =
Unidades de trabalho dos esforcos solicitantes
(4)  Unidade de Forca =
(5)  Coef. multiplicador para transformar em toneladas =
(6)  Unidade de Medida = 6
(7)  Coef. multiplicador para transformar em metros =
item , Novo Valor  *NAO*  1
Acione D <Enter> para alterar Drive e Diretorio
```

- Itens 1–3 (coeficientes) correspondem a 1.4, 1.4 e 1.15 do LAJE.INI, na ordem [inferido].
- Item 4 corresponde à unidade de força (`t`) [inferido].
- Item 6 "Unidade de Medida = 6": o "6" no texto é ambíguo; LAJE.INI tem `m` para unidade linear [inferido].
- Itens 5 e 7 (coeficientes multiplicadores) não têm chave no LAJE.INI. Origem do valor não identificada.
- "item , Novo Valor *NAO*": `*NAO*` é o padrão (não alterar). O campo "1" não tem significado identificado.
- Drive e diretório: "Acione D <Enter>". Mensagem de caminho: "Drive:\Diretorio\...\Subdiretorio". Lista de arquivos: "dos arquivos de Parametrizacao (.LAP)".

## Lista das Lajes Arquivadas

Título: "Lista das Lajes arquivadas            Obra H". O "H" final é o início de um campo (nome da obra) `[inferido]`.

Cabeçalho:

```
Laje    tipo  lados  livre   peso p.    carga     area     H   Armadura
```

Linha-modelo:

```
## \    \
 \ \   ###   ####  ####.##    ####.##   ####.##
```

Mapeamento `[inferido]`:
- `##` = número da laje (Laje).
- O modelo tem 5 campos após "Laje" (`###`, `####`, `####.##`, `####.##`, `####.##`) para 6 rótulos (tipo, lados, livre, peso p., carga, área). Não há correspondência 1:1. Caminho provável: `###` = tipo; `####` = lados; `####.##` = peso p.; `####.##` = carga; `####.##` = área; "livre" sem campo.
- "H" e "Armadura" não têm campo no modelo. Vêm de outra fonte ou são texto livre.

Rodapé: "Qualquer Tecla para Continuar".

Mensagem relacionada no LAJEGRAV: "Nao ha Lajes Arquivadas na Memoria".

## Chamadas e retorno

- Submódulos no executável (contagem de ocorrências): LAJEGEOM 3, LAJECALC 3, LAJEGRAV 3, LAJEPROC 3 [ev: EXE].
- Chamadas por nome com `#`: LAJEGEOM, LAJECALC#, LAJEPROC#, LAJEGRAV# [ev].
- Retorno: "VOLTA LAJEGEOM", "VOLTA LAJEGRAV", "VOLTA LAJECALC", "VOLTA LAJEPROC" [ev]. Este é o protocolo de retorno. O mecanismo (arquivo, variável de ambiente ou `COMSPEC`) não é identificado `[inferido]`.
- "Retorno ao Modulo Gerenciador".
- "Modulo nao encontrado em": falha ao localizar o submódulo.
- Trocas de disquete: "Coloque o disco LAJEGEOM/LAJECALC/LAJEPROC/LAJEGRAV no Drive". Obsoleto. Não reimplementar.
- Ambiente de execução: "COMSPEC". Portas LPT1: e COM1: (sem uso identificado `[inferido: configuração de impressão]`).
- Saída do sistema: "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".

## Erros

- "erro no processamento"
- "verifique a consistencia dos seus dados"
- "Acione ESC <Enter> para Continuar"

## Arquivos

### LAJE.INI (lido na inicialização)

`C=` drive padrão de dados; `\=` diretório padrão de dados; `SISTRUT=` parametrização utilizada; `C:\SISTRUT\EXEC40\=` drive e diretório dos `.LAP`; limites de tabela (80 lajes arquivadas, 40 eixos, 200 traços de arquitetura, 70 cargas lineares, 70 cargas por área, 200 traços de estrutura, 100 pilares, 200 vigas); `L=` denominação das lajes; `V=` denominação das vigas; `m=`, `t=`, `t/cm2=` unidades; `0.15=` Fck; `5.0=` Fyk; `B=` tipo de aço; `1.4`, `1.4`, `1.15` coeficientes de segurança; sequências `CHR$(27)` de impressora. Aviso no arquivo: "Altere somente os valores que se encontram a esquerda do sinal =" [ev: LAJE.INI].

`LAJE.EXE` não contém `.LAJ` [ev: EXE]. A leitura dos dados das lajes arquivadas é feita pelo LAJEGRAV.

### SISTRUT.LAP (`.LAP`, parametrização)

Lido via "Nome do Arquivo PARAMETRIZACAO". Arquivo de 204 linhas. Estrutura:

| Seção | Linhas | Conteúdo |
|---|---|---|
| Cabeçalho | 1–30 | Comentários com `*`. Regras de edição: manter `*`, não mudar a ordem das entradas |
| Globais | 32–33 | Cobrimento 1.5 cm; acréscimo para altura útil 0.5 cm |
| Bitolas | 44–53 | 10 bitolas (4 a 25 mm): diâmetro, área (cm²), peso (kg/m). Área nula desativa a bitola |
| Predimensionamento | 77–84 | Altura mín. 6 cm, máx. 40 cm; linha neutra 100%; flecha com carga total 300 e acidental 500; fluência "S" (NB1 4.2.3.1.B); multiplicador de Ec 0.9 (NB1 8.2.5); densidade do concreto 2.50 t/m³ |
| Relação vão maior/esforços | 98–113 | Tabela de até 20 linhas (0.25→0.40 até 4.00→2.50); termina em "FIM" |
| Relação Mneg/Mpos | 135–137 | Máx. 2.00 (engastado); mín. 0.30; fixa 1.00 (cantos reentrantes) |
| Armaduras mínimas | 150–152 | 0.15% positiva; 0.10% negativa; eficiência da negativa 100% |
| Espaçamentos | 158–159 | Máx. 20 cm; compara com 2×Htotal (S/N, padrão S) |
| Espaçamento mínimo por altura | 170–173 | até 10.0→7.5; 22.0→10.0; 30.0→12.5; 40.0→15.0 |
| Espaçamentos utilizáveis | 180 | 7.5, 10, 12.5, 15, 17.5, 20 |
| Bitola preferencial por altura | 194–199 | até 5.0→4.0 (ordem 0); 5.5→5.0 (1); 14.0→6.3 (2); 25.0→8.0 (3); 32.0→10.0 (4); 40.0→12.5 (5). Busca de bitolas maiores só até ordem 5 |
| Fim | 202 | "FINAL DA PARAMETRIZACAO" |

Linha 204 é vazia. O arquivo não tem linhas úteis além disso [ev: SISTRUT.LAP:L204]. O `.LAP` não tem Fck, Fyk nem unidades; esses valores ficam no LAJE.INI.

## Lacunas

1. Rótulo da opção de geometria (que chama LAJEGEOM) não aparece nas strings do executável.
2. "Gravacao e Leitura": qual opção chama. Possivelmente LAJEGRAV; não confirmado.
3. Hotkeys (primeira letra oculta): todas `[inferido]`.
4. "Continuidade / Espessura / Dimensionamento": se são um item ou três, e qual ação cada um dispara dentro de LAJECALC.
5. Lista das Lajes: 6 rótulos para 5 campos; campos "H" e "Armadura" sem origem.
6. "(6) Unidade de Medida = 6" e "item , Novo Valor *NAO* 1": significado de "6" e de "1".
7. Coeficientes multiplicadores (5) e (7): sem chave no LAJE.INI.
8. Mecanismo do protocolo "VOLTA ...": como o LAJE recebe o retorno do submódulo.
9. Ordem dos itens na tela (as strings do executável não trazem a ordem).
