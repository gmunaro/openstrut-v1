# CI da V1

Dois workflows em `.github/workflows/`. Os dois rodam os scripts de `tools/` e `pacote/` com `bash` em todos os sistemas (Git Bash no Windows).

## build.yml

Compila a V1 com o QB64 PE 4.7.0 e roda os testes.

Quando roda:

- push em qualquer branch (tags ficam com o `release.yml`);
- pull request;
- manual (Actions > build > Run workflow);
- chamado pelo `release.yml`.

Push e pull request ignoram mudanças só em `docs/**` e `*.md`. Um push e o pull request do mesmo branch caem no mesmo grupo de concorrência: o run mais novo cancela o anterior, então o commit fica com um run cancelado e um completo, e os minutos não dobram.

Matriz:

| Runner | Sistema | Quando |
| --- | --- | --- |
| `windows-latest` | Windows x64 | sempre |
| `ubuntu-24.04` | Linux x64 | sempre |
| `ubuntu-24.04-arm` | Linux arm64 | sempre; `continue-on-error` |
| `macos-15` | macOS arm64 (M1) | push na `main`, tag, manual |
| `macos-15-intel` | macOS x64 | push na `main`, tag, manual |

O pedido original citava `macos-14` e `macos-13`. O `macos-13` já foi retirado e o `macos-14` sai em 2/11/2026 (actions/runner-images#13518), por isso a matriz usa `macos-15` e `macos-15-intel`. O `ubuntu-24.04-arm` é runner padrão do GitHub.

Passos de cada job:

1. Instala o QB64 PE pelo caminho oficial de cada sistema. No Windows extrai o `.7z` da release em `C:\qb64pe\qb64pe`. No Linux instala as dependências apt listadas no `setup_lnx.sh` e roda o `setup_lnx.sh` em `~/qb64pe`. No macOS roda o `setup_osx.command` em `~/qb64pe` com o Xcode CLT da imagem. Exporta `QB64_DIR`.
2. Cache da instalação limpa, com chave `qb64pe-<versão>-<runner>`. Ele é salvo logo depois de instalar, antes do build. As dependências apt do Linux são instaladas em todo run, porque cada programa QB64 é compilado e ligado contra elas.
3. `bash tools/build.sh`.
4. `bash tools/runtests.sh`, sob `xvfb-run` no Linux.
5. `bash tools/roteiros.sh`: sempre no Linux, sob `xvfb-run`. No Windows e no macOS só com o input `roteiros: true` (execução manual), porque abrem janela.
6. Envia `build/` como `v1-build-<so>-<arch>.tar.gz` (tar para manter a permissão de execução). Se algo falhar, envia também os `.log` e `.txt` de `roteiros/saida/`.

A release oficial que o QB64 PE chama de 4.7.0 tem a tag `v4.7.0-GLFW`. Para trocar de versão, mude `QB64_VERSAO` no `build.yml`; a chave do cache muda junto. O QB64 PE não publica pacote de Linux arm64. O job arm usa o pacote `lnx-x64`, que é fonte C++ compilada na hora, e deve funcionar em aarch64, mas isso ainda não foi testado. Quando ficar verde, tire o `continue-on-error`.

## release.yml

Gera os pacotes e publica a release.

Quando roda:

- push de tag `v*`: gera e publica;
- manual: gera os pacotes como artifacts do run e só publica se o run for disparado a partir de uma tag. Input `v2_ref` escolhe o branch, tag ou commit da V2.

Jobs:

1. `build`: chama o `build.yml` (os 5 sistemas, sem roteiros fora do Linux).
2. `v2`: checkout de `gmunaro/openstrut`, `bun install --frozen-lockfile` e `bun run build --base=/`. Envia `dist/` como `v2-dist`.
3. `pacote` (um job por sistema): baixa o build da V1 e o `v2-dist`, compila o lançador da V2 e roda o `empacotar.sh` do sistema. No Windows usa o Inno Setup 6 da imagem; se não achar, instala com `choco install innosetup`. Gera `OpenStrut-Setup-windows-x64.exe`, `OpenStrut-linux-x64.tar.gz`, `OpenStrut-linux-arm64.tar.gz`, `OpenStrut-macos-arm64.dmg` e `OpenStrut-macos-x64.dmg`.
4. `publicar` (só em tag): `gh release create` com os pacotes e notas geradas pelo GitHub. Tag com hífen (`v1.0.0-rc1`) sai como pre-release. Se a release já existir, os arquivos são substituídos.

A versão dos pacotes é a tag sem o `v`. Fora de tag é `0.0.0-dev.<número do run>`.

## Pontos `# AJUSTAR:` pendentes (release.yml)

- **Checkout da V2.** `gmunaro/openstrut` é público, e o checkout não precisa de token. Se ficar privado, passe `token: ${{ secrets.V2_TOKEN }}` com leitura nele.
- **Build da V2 com base "/".** O `vite.config.ts` não define `base` hoje. O `--base=/` vai para o fim do script `build`, que termina em `vite build`. Confira se o script mudar.
- **Versão do Bun no job de pacote.** Usa `latest`. Troque por `bun-version-file: pacote/lancador/package.json` quando esse arquivo estiver na `main`.
- **Lançador da V2.** Step próprio chamando `pacote/lancador/compilar.sh <alvo> <saída>`. O rascunho atual dos `empacotar.sh` já chama esse script; se continuar assim, apague o step.
- **Pacote (Windows/Linux/macOS).** Um step por sistema: `bash pacote/<so>/empacotar.sh --arch <x64|arm64>`, com `V1_DIR`, `V2_DIST`, `SAIDA` e `VERSAO` no ambiente (e `ISCC` no Windows). O nome esperado do arquivo final está em `matrix.arquivo`. Esses nomes vieram do rascunho em andamento de `pacote/` e ainda podem mudar.

## Custo estimado em minutos

Em repositório público, os runners padrão do GitHub Actions não descontam minutos da cota. A conta abaixo vale para um fork privado, em que os minutos saem da cota da conta (2.000/mês no Free, 3.000 no Pro). Pelo preço por minuto dos runners padrão, 1 min de Windows custa como 1,7 min de Linux, 1 min de Linux arm64 como 0,8 e 1 min de macOS como 10,3 (Linux US$ 0,006, arm64 US$ 0,005, Windows US$ 0,010, macOS US$ 0,062).

As durações abaixo são estimativas, não medições. Partem do build local (cerca de 7 s por módulo numa máquina de 12 núcleos), com folga para os runners de 2 núcleos, 29 módulos, 24 testes e 128 roteiros. Ajuste depois do primeiro run real.

| Execução | Jobs | Duração estimada | Equivalente em min de Linux |
| --- | --- | --- | --- |
| push em branch / PR | Linux x64 e arm64 (com roteiros), Windows | 15 a 30 min cada | 50 a 105 |
| push na `main` | os 3 acima + 2 macOS | macOS 10 a 20 min cada | 260 a 520 |
| release (tag) | build completo + V2 + 5 pacotes + publicar | pacotes 3 a 8 min cada | 330 a 720 |

A primeira execução em cada runner também compila o QB64 PE (cerca de 5 min a mais no Linux e no macOS), até o cache existir.

Formas de gastar menos, se a cota apertar:

- os roteiros no Linux são a parte mais longa; dá para movê-los para a `main`;
- tirar o `ubuntu-24.04-arm` do push em branch;
- o artifact storage do plano Free é 500 MB. Os builds ficam 3 dias e os pacotes 5. Os arquivos da release não contam nesse limite.

Todos os jobs têm `timeout-minutes` (build 60, roteiros 30, pacote 30) para um processo travado não consumir as 6 h padrão.

## Validação

`actionlint` 1.7.12 (com shellcheck) via Docker, sem erros:

```bash
MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd -W):/repo" --workdir /repo rhysd/actionlint:latest
```

Nada disto rodou ainda no GitHub.
