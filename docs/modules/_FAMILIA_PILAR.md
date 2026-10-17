# Familia PILAR - visao geral

Fontes: specs `PILAR.md`, `PILAREDI.md`, `PILGEEDI.md`, `PIGRAEDI.md`, `PIPROEDI.md` e as interfaces `LAJEGEOM.md`, `LAJEMONT.md`, `VIGA.md`, `FORMA.md`, `DESENHO.md` em `docs/modules/`. Nao repete o conteudo de cada modulo; so amarra o fluxo.
Convencoes: `[inferido]` = deducao sem prova direta.

## 1. Modulos

| Modulo | Papel (resumo) | Spec |
|---|---|---|
| PILAR.EXE | Dimensionamento e verificacao de pilares de concreto armado. Chama PILAREDI | PILAR.md |
| PILAREDI.EXE | Editor de pilares. Devolve controle ao PILAR | PILAREDI.md |
| PILGEEDI.EXE | Submodulo de PILAREDI. Define dados de carregamento e vinculo das colunas arquivadas | PILGEEDI.md |
| PIGRAEDI.EXE | Submodulo de PILAREDI. Cria, grava, le, cataloga e pesquisa arquivos `.COL` | PIGRAEDI.md |
| PIPROEDI.EXE | Submodulo de PILAREDI. Processa colunas arquivadas por posicao | PIPROEDI.md |

## 2. Fluxo

```
PILAR --(PILAREDI#)--> PILAREDI --+--> PILGEEDI
                                  +--> PIGRAEDI
                                  +--> PIPROEDI
PILAREDI --(Retorno ao Modulo Basico de PILAR)--> PILAR
submodulo --(VOLTA <nome>)--> PILAREDI   [inferido]
```

- PILAR chama PILAREDI pelo token `PILAREDI#`. Mensagem se o modulo nao existe: `Modulo PILAREDI nao encontrado em`.
- PILAREDI devolve ao PILAR com `Retorno ao Modulo Basico de PILAR`.
- Os tres submodulos (PILGEEDI, PIGRAEDI, PIPROEDI) usam `Retorno ao Modulo Basico de PILAREDI` como mensagem de retorno.
- Protocolo de volta: `VOLTA PILGEEDI`, `VOLTA PIGRAEDI`, `VOLTA PIPROEDI`. PILAR nao tem protocolo VOLTA nas strings do executavel [inferido].
- **Divergencia nao resolvida:** PIGRAEDI tem `VOLTA PIGRAEDI` e tambem `VOLTA PILGEEDI`, que parece resto de copia de codigo. Nao se sabe qual rotulo e o correto [inferido]. O mecanismo exato do retorno (arquivo, variavel ou parametro) nao aparece nas strings de nenhum executavel.

## 3. Arquivos compartilhados

| Arquivo | Quem grava | Quem le |
|---|---|---|
| `SISTRUT.PIP` / `PILAR.INI` | - | PILAR, PILAREDI (`.PIP` ausente ou com erro cai na parametrizacao SISTRUT) |
| `ERRPIL/` | PILAR, PILAREDI | - |
| `<obra>.COL` | PIGRAEDI | FORMA (`*.COL`) |
| `<obra>.BAK` | PIGRAEDI | - |
| `<arquivo>.REP` | VIGA (somatoria de cargas em pilares) | PILAR; PILGEEDI (`*.REP`) |
| `<obra>.RLP` | LAJEMONT, LAJEGEOM (opcao G) | PILGEEDI (`*.RLP`) |
| `<obra>.VIG` | LAJEMONT, LAJEGEOM (opcao G) | PILGEEDI; FORMA; DESENHO |

- Disco de dados: `Coloque o Disco PILAREDI no Drive` (PILGEEDI e PIPROEDI). Troca de disquete e obsoleta; o caminho deve vir do diretorio de dados [inferido].
- Acesso ao diretorio: o caminho de dados aparece com o rotulo `Drive:\Diretorio\...\Subdiretorio` em FORMA. Nao se sabe se a familia PILAR usa o mesmo rotulo [inferido].

## 4. Interfaces externas

**LAJE (LAJEGEOM e LAJEMONT).** Geram `<obra>.VIG` e `<obra>.RLP` que o PILAR da familia consome. LAJEGEOM tem a opcao `<G>eracao .VIG .RLP` e aviso de ordem: gerar as vigas depois da Continuidade altera a Distribuicao de Cargas. LAJEMONT grava os dois arquivos. Origem do nome do arquivo nao identificada [inferido].

**VIGA.** Grava `<arquivo>.REP` com a somatoria de cargas nas colunas (menu 7, pergunta `GRAVO A SOMATORIA DE CARGAS NOS PILARES EM DISCO DE DADOS (.REP) S/*N*`). O arquivo e lido depois pelo PILAR. O layout interno do `.REP` nao aparece nas strings do executavel, so a mascara de linha.

**FORMA.** Le `*.COL` (colunas de PILAR), `*.VIG *.SEC *.FOR` e aceita a eliminacao `PILAR ELIMINADO DA FORMA`. Formato binario dos arquivos nao decodificado (ver FORMA.md, secao 10).

**DESENHO.** Le `.VIG .SEC .FOR`. Nao ha evidencia de vinculo direto com PILAR ou PILAREDI [inferido].

## 5. Modulos de apoio citados (fora do escopo)

PIAUXEDI, PILDAEDI#, PILVEEDI, PISECEDI, PIMOMEDI. Chamados a partir de PILGEEDI ou PILAREDI; sem spec propria nesta familia [inferido].

## 6. Lacunas da familia

1. **Pai dos submodulos.** As strings de PILAR nao listam submodulos. Os tres submodulos apontam para PILAREDI como pai, e PILAREDI aponta para PILAR. A cadeia e consistente, mas o retorno exato nao e comprovado [inferido].
2. **Data.** PILAR diz `Abril 1991` e PILAREDI tambem. SISTRUT.PIP diz `ABRIL 1992` [PILAR.md, secao 10].
3. **Area de barra.** PILAR.INI e SISTRUT.PIP divergem nas areas das bitolas [PILAR.md, secao 10].
4. **Formato dos arquivos.** `.COL`, `.REP`, `.RLP` e `.VIG` nao tem layout decodificado. Precisa de amostra real ou desassemblador.
5. **Troca de disco versus diretorio.** As strings mostram troca de disco; o sistema reconstruido precisa de um caminho de dados unico [inferido].
