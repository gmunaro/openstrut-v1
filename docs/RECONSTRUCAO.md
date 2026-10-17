# Guia de reconstrução dos módulos (fase 2)

Cada EXE original (desempacotado, fora do repositório; nos comandos abaixo, `$ORIGINAL/<MOD>.EXE`) vira `src-reconstructed/<familia>/<MOD>.BAS`. O fonte é QuickBASIC 4.5 compatível com QB64 Phoenix Edition. Os trechos de verificação de licença do original não são reimplementados.

## Regras

1. **Sem verificação de licença.** Os trechos de verificação de licença do original não são reimplementados. Qualquer módulo pode ser executado diretamente.
2. **Fidelidade de tela.** Use o texto EXATO das strings do original (o dump de strings de cada EXE fica fora do repositório), na ordem e com as hotkeys da spec (`docs/modules/<MOD>.md`). Menus: `TelaItemMenu` destaca a 1ª letra. A cobertura é medida com `python -I tools/strcover.py "$ORIGINAL/<MOD>.EXE" src-reconstructed/<familia>/<MOD>.BAS --show-missing`.
3. **Dados entre módulos** seguem `docs/formats/DADOS.md` e usam SOMENTE as rotinas de `common/SISDADOS.BM` (`LajLe%`/`LajGrava`, `VigLe%`/`VigGrava`, `CPilLe%`/`CPilGrava`, `ColLe%`/`ColGrava`, `FrmLe%`/`FrmGrava`, `ForGrava`, `CfoGrava`...). Nunca invente outro formato para esses arquivos.
4. **Cálculo** de concreto armado usa `common/CALCCA.BM` (flexão, armadura mínima, estribos, escolha de barras). Cálculo específico da família fica num `.BM` separado da interface (ex.: `laje/LAJCALC.BM`), sem `PRINT`/`INPUT`/`LOCATE`, para ser testado em `tests/T_<X>.BAS`.
5. **Desenho** é gravado em `.VET` com `common/SISPLOT.BM` (`VetAbre%`, `VetLinha`, `VetTexto`...) e pode ser mostrado com `VetMostra%`. A conversão para plotter/CAD é `VetParaHpgl%`/`VetParaDxf%`.
6. **Configuração** vem do `.INI` do módulo e do arquivo de parametrização (`.LAP`/`.PIP`/`.FOP`/`.DSP`) via `common/SISCOMUM.BM` (`ArqLer%`, `IniValor$`, `IniDesc$`, `ArqAchaTexto%`, `ParToken$`...). Ver `docs/formats/INI.md` e `docs/formats/PARAM.md`. Se o arquivo não existir, use os defaults do original e siga.
7. **Submódulos** são chamados com `RunSubmodulo "LAJEGEOM"`. O submódulo termina com `SYSTEM` e o chamador volta ao seu menu. Isso substitui o protocolo "VOLTA <MOD>" do original. No início de todo gerenciador: `ComumDirExecDefine _CWD$`.
8. **Estilo:** comentários em português sem acento, um comentário de uso por SUB/FUNCTION, `DECLARE` para cada SUB/FUNCTION do módulo, `DIM SHARED` só para o estado do módulo. Nada de recursos `_xxx` do QB64 além de `_FILEEXISTS`, `_DIREXISTS`, `_CWD$`, `_FILES$`, `_LIMIT`, `_PRINTSTRING` e `_INSTRREV`. Modulos de interface rodam em janela (sem `$CONSOLE`); `$CONSOLE:ONLY` so nos testes. `_CWD$` no inicio do programa e a pasta do executavel (o QB64 faz chdir para ela); `_STARTDIR$` e a pasta de quem o lancou e nao deve ser usada.
9. **Tamanho:** um `.BAS` de interface com no máximo ~900 linhas. Se passar disso, separe telas em `<familia>/<MOD>T.BM`.
10. **Lacunas:** quando a spec marca algo como [inferido] ou lacuna, implemente o comportamento mais simples e plausível e deixe um comentário `' RECONSTRUCAO: <o que foi suposto>`.
11. **Impressão.** O que o original mandava para a impressora (LPT/COM) vai para um arquivo texto `<obra>_<MOD>.LST` no diretório de dados, com o mesmo layout de colunas. Ao final, mostre `Relatorio gravado em <arquivo>`. Os códigos ESC do .INI são ignorados.
12. **Obra corrente.** O nome da obra trafega entre módulos pelo `SISTRUT.OBR` (ver DADOS.md): use `ObraAtual$(dir)` como default ao pedir o nome da obra e `ObraDefine dir, obra` quando o usuário escolher outra.

## Modelo de módulo

```basic
' ============================================================================
'  LAJECALC - <papel do modulo, 1 linha>
'  Fonte RECONSTRUIDO do SISTRUT 4.0 (1991). Spec: docs/modules/LAJECALC.md
'  Verificacao de licenca do original nao reimplementada.
' ============================================================================
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

DECLARE SUB MenuPrincipal ()
' ... estado do modulo (DIM SHARED) ...

ComumDirExecDefine _CWD$
CarregaConfiguracao
MenuPrincipal
SYSTEM

SUB MenuPrincipal
    ' ...
END SUB

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: 'LAJCALC.BM'
```

Teste de cálculo (`tests/T_LAJCALC.BAS`):
```basic
$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
AssertNear "laje quadrada apoiada m = pL2/24", <chamada>, <valor de referencia>, 0.001#
TestEnd
'$INCLUDE: 'ASSERT.BM'
'$INCLUDE: '../src-reconstructed/common/CALCCA.BM'
'$INCLUDE: '../src-reconstructed/laje/LAJCALC.BM'
```
Os valores esperados vêm de referência independente (solução fechada, tabela clássica, equilíbrio), nunca do próprio resultado da função.

## Verificação (rode antes de declarar pronto)

```sh
cd <raiz do repositorio>
bash tools/build.sh <familia>/          # todos OK
bash tools/runtests.sh T_<X>            # PASS
python -I tools/strcover.py "$ORIGINAL/<MOD>.EXE" src-reconstructed/<familia>/<MOD>.BAS --show-missing
```
Compilações do qb64pe são em série. Se der erro de arquivo travado em `internal/temp`, outro agente está compilando: espere 20 s e repita.

Metas: compila; testes de cálculo PASS; cobertura de strings ≥ 70% (as faltantes devem ser lixo binário, verificação de licença ou runtime).
