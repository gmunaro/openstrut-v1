# Família FORMA (SISTRUT 4.0)

Especificação funcional da família FORMA, para guiar reescrita em BASIC compatível com QB64 Phoenix.

Convenção: `[inferido]` marca o que não tem evidência direta.

Detalhes de cada módulo estão em `FORMA.md`, `FORMINIT.md`, `FORMEDCA.md`, `FORMIMP.md`, `FORMPLOT.md`, `SISEDIT.md` e `INSTALAR.md`, na mesma pasta.

## 1. Visão geral

- A família FORMA monta e desenha formas (plantas de forma) de estruturas de concreto armado. Os módulos são: FORMA (menu principal), FORMINIT (inicialização de dados), FORMEDCA (edição de pilares, vigas e cotas de arrasamento), FORMIMP (impressão em impressora matricial), FORMPLOT (plotagem e geração de DXF) e SISEDIT (editor de texto para arquivos de dados).
- INSTALAR é o instalador do original. Não faz parte do fluxo de uso nem da V1. Ver seção 3.
- Runtime: QuickBASIC 4.5 com `BRUN45.EXE`. Os EXEs usam o mesmo runtime.
- Identificação: FORMA traz `MONTAGEM E DESENHO DE FORMAS`, `Outubro 1993` e `Versao 4.0`; SISEDIT e INSTALAR trazem `Abril 1991`. Discrepância registrada em FORMA.md, lacuna 6.

## 2. Fluxo entre submódulos

1. Lançamento: o launcher SISTRUT abre o módulo com `SHELL` no caminho `<DRIVE>\SISTRUT\EXEC40\<MOD>.EXE`, sem argumentos; se não existir, tenta `EXEC32` [reconstrução: `src-reconstructed/SISTRUT.BAS`, sub `RunModule`]. Mensagem de módulo ausente: `Modulo nao instalado nesta copia` (vem da reconstrução, não do executável).
2. FORMA é o menu principal. Os tokens de despacho do menu estão em FORMA: `EDITA`, `IMPRIME`, `PLOTA`, `LAJE`, `VIGA`, `RETORNA`. Os nomes dos submódulos também: `FORMA`, `FORMINIT`, `REEDITA`, `FORMEDCA`, `FORMIMP`, `FORMPLOT1`.
3. FORMINIT: entrada por `FORMINIT`; retorna com `VOLTAFORMINIT`. Quem chama é FORMA [inferido; token `FORMA` em FORMINIT].
4. FORMEDCA: entrada por `FORMEDCA`, a partir de FORMINIT e do menu de FORMA. Em FORMEDCA, os tokens de retorno são `FORMA`, `FORMINIT` e `VOLTAFORMINIT`.
5. FORMIMP e FORMPLOT: chamados por FORMA pelos tokens do item 2. Cada um volta ao menu com `Retorno ao Modulo Basico de FORMA` (o mesmo texto está em FORMEDCA).
6. Saída normal: `Termino da Utilizacao do Sistema SISTRUT   Obrigado ..` (FORMA, FORMIMP, FORMEDCA).
7. Retorno ao gerenciador: `Retorno ao Modulo Gerenciador` está em FORMA e FORMINIT. O canal exato de retorno (como o EXE devolve o controle ao SISTRUT) não foi identificado [inferido: depende do `SHELL` e do retorno do DOS].

Canal do `VOLTA<MOD>`: os tokens existem, mas o mecanismo que faz a volta não foi identificado. Ver lacuna 1.

## 3. O que INSTALAR copiava

Resumo em `INSTALAR.md`. A instalação montava `\SISTRUT\` (gerenciador `SISTRUT.EXE`, `SISTRUT.INI`, `SISEDIT.EXE`, `HERCULES.COM`, `BRUN45.EXE`, `INSTALAR.EXE`), `\SISTRUT\EXEC40\` (programas e INIs da versão 4.0) e, opcionalmente, `\SISTRUT\EXEC32\` (versão 3.2). O `SISTRUT.INI` está descrito em `docs/formats/SISTRUT_INI.md`.

Pontos não confirmados:
- `FORMA.INI` (defaults de diretórios e folha) não aparece como item de cópia no INSTALAR. Origem não confirmada [inferido].
- `SISTRUT.DSP`, `SISTRUT.LAP` e `SISTRUT.PIP` existem em `sistrut-game/`. SISEDIT os referencia. Quem os cria não foi confirmado.

## 4. Arquivos de dados e formatos

| Extensão | Função | Quem lê | Quem grava | Evidência |
|---|---|---|---|---|
| `.FOP` | parametrização de plotagem | FORMPLOT | FORMPLOT | FORMA.INI linha 2 (diretório `C:\SISTRUT\EXEC40\`) |
| `.LAJ` | dados de lajes | FORMA | LAJE [inferido] | FORMA.INI linha 3 |
| `.VIG`, `.SEC` | vigas e seções | FORMA, FORMEDCA, VPLOTA, DESENHO | VIGA [inferido] | FORMA.INI linha 4; VPLOTA.INI linha 23; DESENHO.INI linha 2 |
| `.FOR` | dados de desenho de vigas | FORMA, FORMEDCA, VPLOTA, DESENHO | FORMEDCA | FORMA.INI linha 4; VPLOTA.INI linha 23; DESENHO.INI linha 2 |
| `.COL` | colunas (pilares) | FORMA | PILAR [inferido] | FORMA.INI linha 5 |
| `.FRM` | forma montada | FORMA, FORMIMP | FORMA, FORMEDCA | FORMA.INI linha 6; FORMEDCA.md seção 5 |
| `.CFO` | dados de desenho de pilares | FORMEDCA | FORMEDCA | FORMEDCA.md, seção 5 |
| `.DXF` | desenho CAD | — | FORMPLOT | FORMA.INI linha 7 |
| `.PLT` | arquivo de plotagem | — | FORMPLOT | FORMA.INI linha 8; VPLOTA.INI linha 25 |

Formatos binários (`.FRM`, `.FOR`, `.CFO`, `.PLT`, `.DXF`, `.FOP`, `.LAJ`, `.VIG`, `.SEC`, `.COL`) não foram decodificados. Ver lacuna 2.

Arquivos INI:
- `FORMA.INI` (CRLF): diretórios default, folha 841/594 mm, margens 25/10, carimbo 175/287, escala 50, alturas 3,3,3 e 2,2,1.5, nove flags S, origem 0/0, linhas CHR$ de impressora [ev: `sistrut-game/FORMA.INI`].
- `SISTRUT.INI`: configuração geral da instalação; ver `docs/formats/SISTRUT_INI.md`.
- `VPLOTA.INI`, `DESENHO.INI`, `PLOTER.INI`: usados por VPLOTA, DESENHO e PLOTER. Lidos só em trechos (linhas citadas acima).

## 5. Troca de disquete

- Troca de disquete `Coloque o Disco FORMA no Drive` (FORMA, FORMEDCA, FORMIMP, FORMPLOT) é obsoleta; a instalação hoje usa caminhos por diretório. Não reimplementar.

## 6. Interfaces externas

Os módulos da família trocam arquivos com LAJE, VIGA, PILAR e DESENHO. As extensões abaixo vêm dos INIs. Quem produz cada extensão está marcado.

### LAJE
- Lê e grava `.LAJ` (diretório default `C:\`) [ev: FORMA.INI linha 3].
- FORMA tem o token `LAJE` no menu. Lançamento pelo launcher como qualquer módulo (EXEC40, fallback EXEC32) [reconstrução].
- Produtor do `.LAJ`: LAJE [inferido].

### VIGA
- Lê e grava `.VIG`, `.SEC` e `.FOR` [ev: FORMA.INI linha 4; VPLOTA.INI linha 23; DESENHO.INI linha 2].
- FORMA tem o token `VIGA` no menu. FORMEDCA atualiza a forma das vigas da obra.

### PILAR
- Lê `.COL` (diretório default `C:\`) [ev: FORMA.INI linha 5].
- Produtor do `.COL`: PILAR [inferido].
- FORMEDCA trabalha com pilares.

### DESENHO
- Lê `.VIG`, `.SEC`, `.FOR` e usa `.DXF` ou `.PUB` como padrão CAD [ev: DESENHO.INI linhas 2 e 5].
- FORMPLOT grava `.DXF` com as camadas `EST-LAJES`, `EST-PILAR`, `EST-VIGAS`, `EST-COTAS`, `EST-ELEVA`, `FERRO`, `ESTRIBO`, `CORTE`, `TABELA`. A compatibilidade com o `.DXF` que DESENHO lê não foi verificada.

### Demais interfaces
- VPLOTA lê `.VIG`, `.SEC`, `.FOR` e grava `.PLT` [ev: VPLOTA.INI linhas 23 e 25].
- PLOTER.INI tem a seção `# DESENHO DE FORMAS` [ev: PLOTER.INI linha 746].

## 7. Lacunas e incertezas

1. Canal exato do `VOLTA<MOD>` e do retorno ao gerenciador. Os tokens e as frases estão nos executáveis, mas o mecanismo de retorno não foi identificado.
2. Formatos binários não decodificados (`.FRM`, `.FOR`, `.CFO`, `.PLT`, `.DXF`, `.FOP`, `.LAJ`, `.VIG`, `.SEC`, `.COL`). Precisa de amostras reais ou análise do EXE.
3. Produtores de `.LAJ`, `.VIG`, `.SEC`, `.FOR` e `.COL` (LAJE, VIGA, PILAR) não confirmados nas strings desta família.
4. Discrepância de data: FORMA `Outubro 1993`, SISEDIT e INSTALAR `Abril 1991`.
5. Typos originais mantidos com `(sic)` nos `.md` de cada módulo (ex.: `Denife`, `Corfirme`, `Plotagen`, `Ploter`).

## 8. Verificação

- Verificado: a sequência de chamada e os tokens de FORMA foram conferidos nas strings de FORMA.EXE.
- Não verificado: o conteúdo binário de qualquer arquivo de dados; o comportamento dos EXEs em execução; a compatibilidade dos DXF e PLT com as ferramentas externas.
- Não verificado: as especificações de LAJE, VIGA, PILAR e DESENHO não foram incorporadas a este documento. Esta seção usa só os INIs e as strings desta família.
