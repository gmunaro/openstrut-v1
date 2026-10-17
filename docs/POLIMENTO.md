# Guia da rodada de polimento (agentes de interface)

Objetivo: aproximar a interface de um módulo já reconstruído (que compila) do original. Isso significa completar telas e opções com comportamento real, usando os textos exatos do binário, e remover os "stubs".

## Regras de contexto (obrigatórias: o Haiku estoura o contexto fácil)
- NÃO abra arquivos `.BM` de `common/` nem specs `docs/modules/*.md` inteiras.
- Fonte de texto: o dump de strings do EXE original (fica fora do repositório), em blocos de 60 linhas.
- Para ver o que já existe no seu módulo: `grep -n "^SUB\|^FUNCTION\|CASE \|RECONSTRUCAO\|TelaStub\|ItemNaoReconstruido\|nao implementad" <arquivo>`. Leia no máximo uma SUB por vez (Read com offset/limit).
- Para ver o que falta: `python -I tools/strcover.py "$ORIGINAL/<MOD>.EXE" src-reconstructed/<fam>/<MOD>.BAS --show-missing | head -80`, onde `$ORIGINAL/<MOD>.EXE` é o EXE original desempacotado, fora do repositório.
- Escreva por partes e compile a cada parte: `bash tools/build.sh <fam>/<MOD>`.

## Regras de conteúdo
- PROIBIDO "stub padding": telas que só imprimem textos do binário sem comportamento, rotinas `TelaStub`/`ItemNaoReconstruido`, opções "nao implementada". Se encontrar, troque por comportamento real e simples; se não der, tire a opção do menu e deixe um comentário `' RECONSTRUCAO: opcao X do original nao reconstruida (motivo)`.
- Texto só entra em tela que funciona. Não cole strings para subir a métrica.
- Não mude formato de arquivo nem cálculo. Use as rotinas que já existem e veja as assinaturas abaixo.
- Os trechos de verificação de licença do original não são reimplementados.
- Diretórios: `IniDirDados$` / `DirUtilizavel$(...)`. Nunca use "C:\" literal como pasta de dados. Obra corrente: `ObraAtual$(dir)` / `ObraDefine dir, obra`.
- Comentários em português sem acento, um por rotina; `DECLARE` para rotinas novas.

## Assinaturas das bibliotecas comuns
- **Tela:**
  - `TelaMoldura (l1%, c1%, l2%, c2%)`, `TelaItemMenu (lin%, col%, texto$)` (1ª letra destacada), `TelaStatus (t$)`, `TelaErro (t$)` (espera tecla);
  - `TeclaLer$ ()` (F1 = CHR$(0)+CHR$(59), F2 = CHR$(0)+CHR$(60), ESC = CHR$(27));
  - `EntradaTexto$ (lin%, col%, larg%, padrao$)`, `EntradaNumero# (lin%, col%, larg%, padrao#)`, `FormataNumero$ (v#, casas%, larg%)`.
- **Arquivos texto e INI:** `ArqLer% (arq$)` carrega em `ArqDados$(1..ArqQtd)`; `ArqGravar arq$`; `ArqLinha$ (n%)`; `ArqAchaTexto% (txt$, depois%)`; `IniValor$ (n%)`; `IniDesc$ (n%)`; `IniDefinir n%, valor$`; `IniDirDados$ ()`; `IniDirParam$ ()`; `DirUtilizavel$ (d$)`; `FileExists% (arq$)`.
- **Submódulos:** `ComumDirExecDefine _CWD$`; `RunSubmodulo "NOME"`.
- **Obra:** `ObraAtual$ (dir$)`, `ObraDefine dir$, obra$`.
- **Dados** (ver `docs/formats/DADOS.md` só a seção do seu arquivo):
  - `LajLe%`/`LajGrava`, `VigLe%(arq, "VIG"|"SEC"|"EDV")`/`VigGrava`, `CPilLe%(arq, "RLP"|"REP")`/`CPilGrava`, `ColLe%`/`ColGrava`, `FrmLe%`/`FrmGrava`, `ForGrava arq, nivel`, `CfoGrava arq, nivel, altura`; erro em `DadErro`;
  - helpers `VigAdiciona%`, `VigTramo%`, `VigApoio%`, `VigAddConc`, `VigAddPos`, `CPilSoma%`, `ColIdx%`.
- **Desenho:** `VetAbre% (arq$, titulo$)`, `VetLinha f, x1, y1, x2, y2, pena`, `VetRetangulo f, x1, y1, x2, y2, pena`, `VetTexto f, x, y, alt, ang, pena, txt$`, `VetCirculo f, x, y, r, pena`, `VetFecha f`, `VetMostra% (arq$)`, `VetParaHpgl% (vet$, plt$)`, `VetParaDxf% (vet$, dxf$)`. Coordenadas em mm no papel; penas: 1 concreto, 2 armadura, 3 cotas/textos, 4 eixos, 5 carimbo.

## Entrega
- `bash tools/build.sh <fam>/<MOD>` OK, mais a cobertura antes e depois (strcover).
- Lista dos stubs removidos e das opções ainda ausentes, com motivo.
- Resposta final em até 12 linhas. Não edite arquivos que não sejam seus. Não pare para perguntar sobre métrica.
