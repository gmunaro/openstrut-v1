# DESEDITA.EXE — spec de reconstrução

Fonte de evidência: strings do executável original `DESEDITA.EXE` (fora do repositório).

## Papel

Submódulo da família DESENHO. Pelas strings, edita o cadastro de vigas da obra (seleção de vigas, repetições para a tabela de quantidades, reedição do desenho de armação) e gera o arquivo público CAD (AutoCAD ou Cadtec). Os nomes de módulos `DESGRAED` e `DESAUXED` aparecem como blocos de runtime; o papel exato deles é desconhecido. [inferido]

## Chamada e retorno

- Chamado a partir do gerenciador DESENHO. Evidência: string `DESENHO` e "Retorno ao Modulo Gerenciador".
- Tela de encerramento: "Termino da Utilizacao do Sistema SISTRUT   Obrigado ..", associada à cadeia `DESINIT`. [inferido: associação exata]
- Protocolo "VOLTA <MOD>" / "*VOLTA*" não aparece nas strings deste módulo. [ev: ausência]
- Erros de carga de overlay/RTM (BRUN45, R6005–R6007) são do runtime, não do módulo. Ignorados nesta spec.

## Telas e menus

Hotkey = letra entre colchetes na tela original; as strings chegam sem a primeira letra quando destacada em outra cor. Onde não há evidência, a letra é [inferido].

| Texto | Hotkey | Padrão |
|---|---|---|
| "Acione D <Enter> para alterar Drive e Diretorio" | D | — |
| "Nome da Obra *RETORNO*" | — | RETORNO = Enter |
| "Registros I/J/N a M/.../K *RETORNO*" | — | RETORNO |
| "Viga nao existente (registro" | — | — |
| "As Vigas escolhidas estao Corretas N/*S*" | — | S |
| "Imprimo Desenho Definitivo da Viga na Impressora S/*N*" | — | N |
| "Escala 1/.. 200 100 *50* 25 ..." | — | 50 |
| "Edito novamente o desenho da armacao para alteracoes S/*N*" | — | N |
| "Gero arquivo publico padrao CAD S/*N*" | — | N |
| "Tipo de Arquivo CAD  <*A*>utocad  <C>adtec" | A/C | A |
| "Imprimo medidas de forma e secoes abaixo do desenho N/*S*" | — | N |
| "Imprimo padrao de dobramento da armadura N/*S*" | — | N |
| "3 Cabecalhos e 2 Notas gerais, ate 40 caracteres cada" | — | — |
| "CAB 1)", "CAB 2)", "CAB 3)" | — | — |
| "NOT 1)", "NOT 2)" | — | — |
| "Vigas com repeticoes para Consideracao na Tabela" | — | — |
| "Entre com o numero Total de vezes a repetir quando > 14" | — | — |
| "Quando nao alterado, mantem o anteriormente definido" | — | valor anterior |
| "Registro , Numero de Repeticoes *FIM*" | — | FIM |
| "Registro + com total de  repeticoes" | — | — |
| "CAD⌠" e "Dados Corretos N/*S*" | — | S |
| "Aguarde ..." | — | — |
| "DESEDITA" | — | título |
| "Coloque o Disco ┌ no Drive" | — | — |
| "Retorno ao Modulo Gerenciador" | — | — |
| "Acione ESC <Enter> para Continuar" | ESC | — |

Hotkey de cada item de menu (ex.: "Imprimo" = I, "Edito" = E, "Gero" = G) é [inferido]: as strings não mostram a letra destacada.

## Entradas do usuário

| Campo | Unidade / formato | Limite / padrão |
|---|---|---|
| Drive e diretório | texto | "Drive:\Diretorio\...\Subdiretorio" |
| Nome da obra | texto | RETORNO sai |
| Registros de vigas | letras I/J/N … M … K | RETORNO sai |
| Confirmação das vigas | S/N | S |
| Impressão do desenho definitivo | S/N | N |
| Escala | 1/n | 200, 100, 50 (padrão), 25 |
| Reeditar desenho da armação | S/N | N |
| Gerar arquivo público CAD | S/N | N |
| Tipo de CAD | A (AutoCAD) ou C (Cadtec) | A |
| Medidas de forma e seções no desenho | S/N | N |
| Padrão de dobramento | S/N | N |
| Cabeçalhos CAB 1–3 e notas NOT 1–2 | texto | 40 caracteres cada |
| Repetições por registro | número inteiro | confirmação explícita se > 14 |
| Confirmação final | S/N | S |
| Criar diretório inexistente | S/N | — |

Limite "> 14" para repetições: o texto pede confirmação explícita acima desse valor; o tratamento exato é [inferido].

## Arquivos lidos e gravados

| Arquivo | Ext. | Operação | Formato |
|---|---|---|---|
| Vigas | .VIG, .SEC, .FOR | lido (busca de arquivos) | desconhecido [inferido: binário ou texto] |
| Vigas editadas | .EDV | lido e gravado | desconhecido |
| Parametrização | .DSP | lido | `SISTRUT.DSP` (ver config) |
| Público CAD | .DXF ou .PUB | gravado | DXF (AutoCAD) ou formato Cadtec [inferido] |

Os formatos internos não foram lidos. A spec não os infere além do nome e da extensão. Para vigas (.VIG) e .EDV, o formato precisa de análise do conteúdo da extensão, o que está fora desta passada.

## Processamento

- Carrega o conjunto de vigas da obra, pede a seleção por registro, confirma (S/N) e, se preciso, reedita o desenho de armação.
- Define o número de repetições de cada viga para a tabela de quantidades ("Consideracao na Tabela"). Valor anterior é mantido se não alterado.
- Gera o arquivo público CAD em AutoCAD ou Cadtec.
- Opções de desenho: escala, medidas de forma e seções, padrão de dobramento, três cabeçalhos e duas notas gerais.
- Impressão de desenho definitivo na impressora. A rotina de impressão não está neste executável; liga-se a DESIMP [inferido].
- Edição gráfica do desenho ("Edito novamente o desenho da armacao") pode chamar outro módulo; não há evidência de qual. [inferido]
- Edição de cotas e posições não aparece nas strings. Fica com DESEDCAO [inferido].

## Relatórios e impressão

- Impressão do desenho definitivo: opção S/N e escala.
- Impressão de medidas e padrão de dobramento como opções do desenho.
- Arquivo público CAD como saída.
- Tabela de quantidades: repetições por viga. Formato da tabela não aparece nas strings. [inferido]

## Mensagens de erro

"Viga nao existente (registro", "Nenhum Arquivo Encontrado", "Modulo nao encontrado em", "NAO EXISTE ESTE ARQUIVO NESTE DISCO", "NAO EXISTE ESTE ARQIVO" (sic), "O SEU DISCO DE DADOS ESTA COMPLETO", "VERIFIQUE O SEU DRIVE", "ATENCAO ! .. Drive e Diretorio nao encontrados", "erro no processamento", "verifique a consistencia dos seus dados", "Coloque o Disco ... no Drive".

## Lacunas

1. Ordem do fluxo: não há mapa de quais telas aparecem antes de quais. A ordem acima segue a posição das strings no executável. [inferido]
2. Formato interno de `.VIG`, `.SEC`, `.FOR` e `.EDV`: não lido nesta passada.
3. Significado de `DESGRAED`, `DESAUXED` e `MIXT`: nomes de blocos de runtime ou módulos chamados; função não confirmada.
4. Rotina de "Registros I/J/N a M/.../K": quais letras existem e como mapeiam para vigas. Não há evidência de tabela de nomes.
5. Como o DESEDITA chama a impressão (DESIMP?) e a edição gráfica (qual EXE?). Só há hipótese.
