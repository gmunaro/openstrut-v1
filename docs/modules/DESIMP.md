# DESIMP.EXE — spec de reconstrução

Fonte de evidência: strings do executável original `DESIMP.EXE` (fora do repositório).

## Papel

Submódulo da família DESENHO que gera a saída de desenho e de tabelas de armadura. Pelas strings, produz um arquivo ASCII em formato DXF (seções `ENTITIES`, entidades `LINE` e `TEXT`, cabeçalho "PROGER SISTRUT-DESENHO VERSAO 40") com cortes, formas, textos, cotas, tabela de ferros e raio de dobramento.

Não há prompts de entrada nas strings. A rotina de impressão em matricial não aparece por nome (nenhuma string de impressora). [ev: ausência] A relação com a impressão do DESEDITA ("Imprimo Desenho Definitivo ... na Impressora") é hipótese. [inferido]

## Chamada e retorno

- Cadeia de blocos de runtime: `DESIMP`, `DESAUXIM`, `DESCAD`, `MIXT`. Os blocos chamados são [inferido] módulos auxiliares de desenho e de exportação CAD.
- Saída para o gerenciador: "Retorno ao Modulo Gerenciador", "SISTRUT".
- Troca de disco para o DESINIT: "Coloque o Disco DESINIT no Drive", "Aguarde ...". Sugere retorno ao disco de inicialização. [inferido]
- Encerramento: "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..".
- "VOLTA <MOD>" / "*VOLTA*" não aparece. [ev: ausência]
- Erros de carga RTM (BRUN45, R6005–R6007) são do runtime. Ignorados.

## Telas e menus

Não há menu interativo nas strings. Textos de tela, em ordem:

| Texto | Função |
|---|---|
| "Coloque o Disco DESINIT no Drive" | Pede a troca de disco |
| "Aguarde ..." | Mensagem de espera |
| "Retorno ao Modulo Gerenciador" | Saída |
| "Modulo nao encontrado em" | Erro de carga |
| "HER" / "EGA" / "VGA" / "CGA" | Tipos de placa de vídeo detectados [inferido] |
| "Acione ESC <Enter> para Continuar" | Pausa final |

Títulos de seção de desenho gravados no arquivo de saída: "CORTE", "Raio de" / "Dobramento", "VIGA", "FORMAFE" / "FORMA", "TEXTO", "FERRO", "TABELA" para a tabela de ferros, "COTAS" e "ENTIDADES" (rótulo de seção do DXF).

## Entradas do usuário

Nenhuma entrada explícita nas strings. Os dados de viga, forma e ferro vêm de arquivos [inferido]. Nenhum campo, unidade ou limite está documentado aqui.

## Arquivos lidos e gravados

| Arquivo | Operação | Formato |
|---|---|---|
| Arquivo de desenho de saída (DXF ASCII) | gravado | DXF com `SECTION`, `ENTITIES`, `LINE`, `TEXT`, `ENDSEC`, `FIM DE ARQUIVO`; cabeçalho "PROGER SISTRUT-DESENHO VERSAO 40"; "UNI 1.00 mm" |
| Tabela de ferros | conteúdo gravado | cabeçalhos "Q UNI TOTAL", "ACO # TOTAL PESO", "REPETIR VEZES" |
| Dados de viga, forma e ferro | lidos [inferido] | formato desconhecido |
| `SISTRUT.DSP`, `DESENHO.INI` | não há string de referência neste executável | — |

Nome e extensão do arquivo de saída não aparecem nas strings. [lacuna]

## Processamento

- Gera um arquivo DXF por viga ou conjunto, com entidades `LINE` e `TEXT`. Cada linha de dimensão e de ferro vira entidade.
- Blocos de entidade repetidos no arquivo: `LINE` seguido de "L 1 1 1"; `TEXT` seguido de "T 1" e " 1 0 0". Os campos numéricos são valores de código DXF; o significado de cada um é [inferido]. Há um segundo conjunto de títulos (COTAS, FERRO, TEXTO, FORMA) com o mesmo padrão.
- Gera a tabela de ferros: quantidade, unidade, total, aço, número da barra, total em peso. Repetições da armadura aparecem em "REPETIR VEZES".
- Gera cortes ("CORTE") e formas ("FORMA", "FORMAFE") com raio de dobramento.
- Versão do sistema escrita no cabeçalho do arquivo: "VERSAO 40".
- Impressão matricial em si não aparece. A saída pode ser DXF para CAD ou impressão, conforme o DESEDITA chama este módulo. [inferido]
- Sem cálculo de armadura nas strings. Esse cálculo fica com DESDIM e DESEDCAO [inferido].

## Relatórios e impressão

- Saída principal: arquivo DXF com tabela de ferros, cortes e formas.
- Impressão em matricial: sem evidência nas strings. [ev: ausência] [lacuna]

## Mensagens de erro

"Modulo nao encontrado em", "erro no processamento", "verifique a consistencia dos seus dados" e a pausa "Acione ESC <Enter> para Continuar".

## Lacunas

1. Impressão matricial: nenhuma string de impressora. Não há como confirmar que o módulo imprime. [ev: ausência]
2. Nome e extensão do arquivo DXF de saída: não aparecem nas strings.
3. Formato de entrada (dados de viga, forma, ferro): não lido nesta passada.
4. Papel de `DESAUXIM`, `DESCAD` e `MIXT`: nomes de blocos, função não confirmada.
5. Como o DESIMP recebe o parâmetro da viga e a escala (DESEDITA? arquivo?): sem evidência.
