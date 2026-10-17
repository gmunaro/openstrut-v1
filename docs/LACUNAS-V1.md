# Brief comum: lacunas funcionais da V1

Funcionalidades que o SISTRUT 4.0 original tinha e que a reconstrução ainda não tem. Elas foram encontradas pelos textos do executável que faltam no fonte (`tools/strcover.py`). Cada agente recebe alguns itens. Leia este arquivo inteiro antes de começar.

Raiz: a raiz do repositório. Use Git Bash.

## Itens

| # | Módulo | Funcionalidade | Evidência |
|---|---|---|---|
| 1 | PILAREDI | Pré-dimensionamento da seção (3.9): seleção de posições, centros de gravidade, tela de cálculo e opções aceita/varia/cancela | `docs/modules/PILAREDI.md:66-76`; `PILAREDI.BAS:210` (só comentário) |
| 2 | PILAREDI | Relatório "Resumo de cargas Acumuladas" e "Momentos e Carga Normal / Diagramas" | `docs/modules/PILAREDI.md:48` |
| 3 | FORMIMP | Escala de impressão: tela "Escala do Desenho 1/ 100 *50* 20 FOTO", impressão em partes e ajuste | `docs/modules/FORMIMP.md:45`; `FORMIMP.BAS:13` |
| 4 | VPLOTA | "RESUMO GERAL DA FOLHA" e tabela de aço da folha ("TIPO DE ACO", "ORDEM", "COMPARACAO DO MAXIMO") | `docs/modules/VPLOTA.md:169,193,310` |
| 5 | DESEDCAO | Juntar barras (não junta positivo com negativo) | `docs/modules/DESEDCAO.md:107`; `DESEDCAO.BAS:289` |
| 6 | DESEDCAO | Separar barra ("Separacao de Ferragem", com Comprimento de Emenda e distância da ponta) | `docs/modules/DESEDCAO.md:47` |
| 7 | DESEDCAO | Porta-estribo, Notas, Iniciar e Corte da viga | `docs/modules/DESEDCAO.md:36-60`; `DESEDCAO.BAS:289,468` |
| 8 | DESIMP | DXF com títulos e entidades do original: CORTE, FORMA/FORMAFE, Raio de Dobramento, TABELA; camadas e cotas | `docs/modules/DESIMP.md:33,55`; `DESIMP.BAS:185-186` |
| 9 | PILGEEDI | Tabela "Cargas Totais", opções `<M>axima`/`<+>Soma` e colunas PERMANENTES e VENTO por nível | `docs/modules/PILGEEDI.md:79,245-246,308` |
| 10 | PILAR | Geometria da seção impressa: "Area =", "Perimetro =", "Barras internas a secao =" | `docs/modules/PILAR.md:91`; `PILAR.BAS:41` |
| 11 | VPLOTA | Parametrização da folha: área de plotagem e bordas, margens, carimbo e escala | `docs/modules/VPLOTA.md:59,76`; `VPLOTA.BAS:327` |
| 12 | DESGRAF | Escala lida do `.DSP` (hoje fixa em 50) | `DESGRAF.BAS:7,118`; `docs/modules/_FAMILIA_DESENHO.md:12` |
| 13 | DESGRAF | Escolha de adaptador de vídeo (CGA/MCG/EGA/VGA/HER) | `docs/modules/_FAMILIA_DESENHO.md:70` |
| 14 | FORMEDCA | Amarração de pilares, vigas e faces por eixo, face ou coordenada (Sentido X/Y) | `docs/modules/FORMEDCA.md:12,50-58`; `FORMEDCA.BAS:6-8` |
| 15 | PIGRAEDI | Protocolo VOLTA: tokens `VOLTA PIGRAEDI` e `VOLTA PILGEEDI` | `docs/modules/PIGRAEDI.md:18-23`; `docs/modules/_FAMILIA_PILAR.md:30` |

As linhas acima são aproximadas. Confira cada uma com `grep -n`.

## Como trabalhar
- **Evidência primeiro.**
  - Os textos de tela vêm do dump de strings de `<MODULO>.EXE` (fora do repositório), copiados exatamente como no original.
  - O comportamento vem de `docs/modules/<MODULO>.md`.
  - O que não tiver evidência leva `' RECONSTRUCAO: <suposição>` no código. Não invente telas sem texto de evidência.
- **Cálculo:** use as rotinas das bibliotecas `.BM` existentes (`common/CALCCA.BM`, `common/SISDADOS.BM`, `pilar/PILCALC.BM`, `pilar/PILEDCAL.BM`, `desenho/DESCALC.BM` etc.). Você pode LER e chamar, mas NÃO editar.
  - Se precisar de rotina nova, crie uma `.BM` própria com o nome do seu módulo, por exemplo `pilar/PILPRED.BM`, ou ponha a rotina no seu `.BAS`.
  - Todo cálculo novo ganha teste de console novo, `tests/T_<NOME>.BAS`, no padrão dos existentes (veja `tests/ASSERT.BM`). O valor esperado vem de conta à mão escrita em comentário, nunca da saída da própria função.
- **Formato de arquivo:** não mude os formatos de `docs/formats/DADOS.md` e não edite o DADOS.md. Se precisar de campo ou arquivo novo, use um arquivo auxiliar próprio e descreva-o no relatório final, para o coordenador documentar.
- **QB64:**
  - `as`, `pos`, `base`, `sin` e `asc` são reservados; não use como nome de variável;
  - use `SYSTEM`, não `END`;
  - não use `$CONSOLE` nem `_STARTDIR$`;
  - a pasta de dados vem de `IniDirDados$`.
- **Leitura:** não leia `.BM` nem `.BAS` grandes inteiros. Use `grep -n` e leia só as SUBs que for mexer.

## Ferramentas
- **Compilar um módulo:** `bash tools/build.sh pilar/PILAREDI.BAS`. O filtro é parte do caminho. Nunca rode sem filtro. Há uma trava global e vários agentes compilam ao mesmo tempo; espere a sua vez.
- **Testes de console:** `bash tools/runtests.sh T_NOME`. O filtro é parte do nome. Rode os seus e o `T_FLUXO`.
- **Roteiros de teclado:** leia `roteiros/README.md` antes de usar.
  - Comando: `bash tools/roteiro.sh roteiros/NOME.txt EXE 60`.
  - Crie roteiros novos com o prefixo `lac<item>_`, por exemplo `roteiros/lac01_predim.txt`.
  - A obra de partida é `roteiros/semente/`; para usá-la, `cp -r roteiros/semente roteiros/lac01_predim.dados`.
  - Saída 0 significa que o programa terminou; as telas ficam em `roteiros/saida/`.
- **Cobertura:** `python -I tools/strcover.py <MODULO>` antes e depois.

## Proibido
- Editar arquivos fora da sua lista.
- Apagar arquivos.
- Rodar git.
- Editar fora do projeto.

## Pronto
- os itens funcionam, com evidência numa tela gravada por roteiro;
- o módulo compila;
- os testes novos e o `T_FLUXO` passam;
- os roteiros novos e os roteiros existentes do módulo saem com 0.

## Relatório final (até 15 linhas)
- **Por item:** o que fez (arquivo:SUB) e o roteiro e a tela que provam.
- **Números:** cobertura antes e depois, e a saída real dos testes e roteiros.
- **Pendências:** o que ficou como RECONSTRUCAO e o que não fez, com o motivo.
