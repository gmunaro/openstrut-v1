# Brief comum: correções de engenharia da V1 (achados da revisão independente)

## Contexto
O SISTRUT V1 é a reconstrução, em QB64, de um software de 1991 de cálculo de concreto armado pela NB-1/78 (NBR 6118:1978). Antes de começar, leia `README.md`, `docs/RECONSTRUCAO.md` e `docs/formats/DADOS.md`.

Uma revisão de engenharia independente encontrou erros contra a segurança e incoerências entre módulos. Sua tarefa é corrigir os itens do seu brief específico.

Diretório de trabalho: a raiz do repositório. Use Git Bash.

## Ferramentas
- **Compilar:**
  - `bash tools/build.sh viga/VIGA.BAS` compila só um módulo; o filtro é uma substring do caminho.
  - Nunca rode o build sem filtro, porque outro agente compila ao mesmo tempo.
- **Testes:**
  - `bash tools/runtests.sh T_VIGCALC` roda um teste de console; o filtro é o nome.
  - Rode só os seus.
- **Roteiros de teclado:** `bash tools/roteiro.sh roteiros/NOME.txt` lê o executável inicial da linha `# exe:` do roteiro. Antes de usar, leia `roteiros/README.md`.
  - Saída 0 significa que o programa terminou.
  - As telas gravadas ficam em `roteiros/saida/NOME-<data>/*.txt`.
- **Aço classe A/B:** use `CcaAcoClasse%` (no fim de `common/CALCCA.BM`). `CcaAcoClasse%(0)` define classe A, `CcaAcoClasse%(1)` define classe B e `CcaAcoClasse%(-1)` consulta. O padrão é A.
  - Cada módulo de tela deve definir a classe a partir do INI que já lê o "TIPO DE ACO".
  - Os cálculos consultam a classe.
  - Os testes que não definem a classe continuam em A.
- **Diagrama do aço classe B (NB-1/78):**
  - ε = σ/Es para σ ≤ 0,7 fyd.
  - ε = σ/Es + 0,823·(σ/fyd − 0,7)^5 para 0,7 fyd < σ ≤ fyd.
  - Em fyd, ε = fyd/Es + 0,002.
  - Para obter σ(ε), resolva por bissecção.
  - O εyd de cálculo, usado no x/d limite, é fyd/Es + 0,002.

## Regras
- **Testes:**
  - Todo bug corrigido ganha teste de regressão no `tests/T_*.BAS` correspondente.
  - O valor esperado vem de conta à mão ou de solução fechada, escrita num comentário do teste. Nunca da saída da própria função.
  - Testes existentes que mudarem de valor por causa da correção devem ser atualizados com a nova conta à mão. Explique no comentário.
- **Comentários:** marque com `' RECONSTRUCAO:` toda suposição sobre a norma que você não puder confirmar. Na dúvida, escolha a opção a favor da segurança.
- **Nomes reservados no QB64:** `as`, `pos`, `base`, `sin` e `asc` não podem ser nomes de variável.
- **Edição:** só nos seus arquivos. Não apague nada (nada de `rm`). Não edite fora do projeto. Não rode git.
- **Pronto:**
  - os itens estão corrigidos;
  - os testes do seu grupo passam;
  - os módulos do grupo compilam;
  - os roteiros da sua família (lista no brief específico) rodam de novo com saída 0, e as telas confirmam as correções.

## Relatório final (curto)
1. Para cada item: o que mudou (arquivo:função), o teste novo e os valores, antes e depois.
2. Os testes e roteiros rodados, com o resultado.
3. O que não corrigiu e por quê.
