# Família LAJE: visão geral

Fontes: specs `LAJE.md`, `LAJEPROC.md`, `LAJEGRAV.md`, `LAJEMONT.md`, `LAJEGEOM.md` e `LAJECALC.md`; strings dos executáveis originais (fora do repositório); `LAJE.INI`; `SISTRUT.LAP`.
Convenção: `[ev: EXE]` = busca no executável original; `[inferido]` = dedução sem evidência direta. Strings de BRUN45 e resíduos de detecção de vídeo são ignorados.

## Módulos

| Módulo | Função | Spec |
|---|---|---|
| LAJE | Menu principal; materiais, parametrização e chamada dos demais | `LAJE.md` |
| LAJEGEOM | Geometria das lajes; item 7 gera `.VIG` e `.RLP` | `LAJEGEOM.md` |
| LAJECALC | Cálculo e impressão de resultados | `LAJECALC.md` |
| LAJEPROC | Escolha, modificação e desenho das armaduras | `LAJEPROC.md` |
| LAJEGRAV | Criar, gravar, ler e contar lajes arquivadas (`.LAJ`) | `LAJEGRAV.md` |
| LAJEMONT | Distribui as cargas das lajes em vigas e pilares; grava `.VIG` e `.RLP` | `LAJEMONT.md` |

## Menu do LAJE

Opções na ordem da tela, com destino `[ev: LAJE.md]`:

| Opção | Destino | Evidência |
|---|---|---|
| Materiais | Tela Definicao dos Materiais (Fck, Fyk, coeficientes) | [ev] |
| Arquivar dados de Painel | LAJEGRAV | [inferido] |
| Continuidade / Espessura / Dimensionamento | LAJECALC | [inferido] |
| (sem rótulo nas strings) | LAJEGEOM | chamada por nome |
| Processar / Detalhar Lajes | LAJEPROC | [ev] |
| Lista das Lajes | Tela de lista de lajes arquivadas | [ev] |
| Gravacao e Leitura | Sem mapeamento | lacuna |
| Visualizar e Alterar Parametrizacoes | Correcao de Parametros | [inferido] |

LAJEMONT não tem opção identificada no menu do LAJE. Lacuna.

Hotkeys entre colchetes são [inferido]: a primeira letra de cada item aparece destacada e não entra nas strings do executável.

## Fluxo típico

1. LAJE lê `LAJE.INI` e `SISTRUT.LAP` (caminho `C:\SISTRUT\EXEC40\`).
2. Define materiais e parâmetros.
3. LAJEGEOM monta a geometria e, no item 7, gera `.VIG` e `.RLP`.
4. LAJECALC calcula as lajes [inferido].
5. LAJEPROC escolhe ou ajusta as armaduras e imprime o desenho.
6. LAJEGRAV arquiva as lajes em `.LAJ`.
7. LAJEMONT distribui as reações nas vigas e pilares e regrava `.VIG` e `.RLP`.

Ordem entre os passos 3, 4 e 7 não está confirmada. LAJEGEOM avisa sobre lajes sem peso próprio e sobre Continuidade alterando a distribuição de cargas. Não é possível dizer se o item 7 do LAJEGEOM dispara o LAJEMONT [inferido].

Protocolo de retorno: LAJE contém "VOLTA LAJEGEOM", "VOLTA LAJECALC", "VOLTA LAJEPROC" e "VOLTA LAJEGRAV". LAJEGEOM contém "VOLTA LAJEGEOM". O mecanismo de passagem de controle não foi identificado [inferido].

## Arquivos compartilhados

| Arquivo | Uso | Evidência |
|---|---|---|
| `LAJE.INI` | Lido por LAJE. Defaults: Fck 0,15 t/cm²; Fyk 5,0 t/cm²; aço B; coeficientes 1,4 / 1,4 / 1,15; unidade m; força t | [ev: LAJE.INI] |
| `SISTRUT.LAP` | Parametrização lida por LAJE. 204 linhas úteis; "FINAL DA PARAMETRIZACAO" na linha 202 | [ev: SISTRUT.LAP] |
| `.LAJ` | Obra arquivada: LAJEGRAV grava, lê e conta. LAJE e LAJEMONT não citam a extensão no executável | [ev: LAJEGRAV] |
| `.VIG` | Gravado por LAJEMONT; gerado por LAJEGEOM item 7 | [ev: EXE] LAJEMONT, 3 ocorrências |
| `.RLP` | Gravado por LAJEMONT; gerado por LAJEGEOM item 7 | [ev: EXE] LAJEMONT, 2 ocorrências |
| `.BAK` | Sem referência nos 4 executáveis da família. Uso não confirmado | [ev: EXE] |

O nome-base de `.VIG` e `.RLP` ("...VIG e") não tem origem identificada [inferido: nome da obra].

## Interfaces externas

- **VIGA**
  - LAJEMONT grava `.VIG` com contador "Registro" e monta o esquema unifilar com tramos.
  - LAJEGEOM item 7 "Geracao de Arquivos (.VIG e .RLP)"; comando `<G>eracao .VIG .RLP`; confirmação `Confirme prosseguir para montagem dos arquivos .VIG e .RLP`.
  - LAJEGRAV: "NUMERO MAXIMO DE VIGAS INSUFICIENTE".
  - Formato do `.VIG`: fica na spec de VIGA.
- **PILAR**
  - LAJEMONT grava `.RLP` (cargas em pilares e inclinações) e monta o esquema unifilar de pilares.
  - LAJEGEOM item 7 também atende PILAR.
  - LAJEGRAV: "NUMERO MAXIMO DE PILARES INSUFICIENTE".
  - Formato do `.RLP`: fica na spec de PILAR.
- **FORMA**: nenhuma string "FORMA" nos 4 executáveis (busca no executável). Sem interface direta identificada nesta família.
- **DESENHO**: LAJEPROC imprime "Impressao do Desenho das Armaduras dispostas nas Lajes" e "desenho da Ferragem". Não há chamada a módulo DESENHO nos executáveis da família [ev: EXE]. O desenho é feito dentro de LAJEPROC [inferido].

## Incertezas principais

1. Hotkeys do menu do LAJE: [inferido] pela ausência da primeira letra nas strings.
2. Opção de geometria sem rótulo nas strings; "Gravacao e Leitura" sem mapeamento.
3. Lista das Lajes tem 6 rótulos para 5 campos no template.
4. Mecanismo de VOLTA não identificado; LAJEMONT não tem opção de menu identificada.
5. Origem dos dados de entrada das lajes (`.LAJ` ou outro arquivo) e de `.VIG`/`.RLP`; coeficientes 5 e 7 ("toneladas", "metros") sem fórmula.
