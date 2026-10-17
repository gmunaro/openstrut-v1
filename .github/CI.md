# CI da V1

Dois workflows em `.github/workflows/`. Os dois rodam os scripts de `tools/` e `pacote/` com `bash` em todos os sistemas (Git Bash no Windows).

## build.yml

Compila a OpenStrut V1 (os 28 programas de `src-original/` e o lançador `pacote/lancador/OPENSTRUT.BAS`) com o QB64 PE 4.7.0 e roda os testes que não dependem do original.

Quando roda:

- push em qualquer branch (tags ficam com o `release.yml`);
- pull request;
- manual (Actions > build > Run workflow);
- chamado pelo `release.yml`.

Push e pull request ignoram mudanças só em `docs/**` e `*.md`. Um push e o pull request do mesmo branch caem no mesmo grupo de concorrência: o run mais novo cancela o anterior.

Matriz, sempre os três:

| Runner | Sistema |
| --- | --- |
| `windows-latest` | Windows x64 |
| `ubuntu-24.04` | Linux x64 |
| `macos-15-intel` | macOS x64 |

Só x64. O RT45 faz a raiz quadrada do x87 em assembly inline e lê o `long double` de 80 bits (`src-original/comum/RT45X87.h`): em arm64 não compila, e o ponto flutuante não seria o do original. Os Macs com Apple Silicon rodam o pacote x64 pelo Rosetta 2. O `macos-15-intel` é a imagem Intel que o GitHub mantém; quando ela sair, o macOS precisa de outra solução (compilar x64 no runner arm64 com `-arch x86_64`).

Passos de cada job:

1. Instala o QB64 PE pelo caminho oficial de cada sistema. No Windows extrai o `.7z` da release em `C:\qb64pe\qb64pe`. No Linux instala as dependências apt do `setup_lnx.sh` (e o Xvfb) e roda o `setup_lnx.sh` em `~/qb64pe`. No macOS roda o `setup_osx.command` em `~/qb64pe`. Exporta `QB64_DIR`.
2. Cache da instalação limpa, com chave `qb64pe-<versão>-<runner>-mac<MACOSX_DEPLOYMENT_TARGET>`, salvo logo depois de instalar. As dependências apt do Linux são instaladas em todo run, porque cada programa é compilado e ligado contra elas.
3. `bash tools/build.sh`: os 28 programas e o lançador em `build/`, todos `<NOME>.exe` (também no Linux e no macOS: o CHAIN do RT45 procura `<nome>.exe`), mais `build/sistrut-game/`.
4. `bash tools/fumaca.sh`: roda o `OPENSTRUT.exe` com uma pasta de usuário vazia e um roteiro de teclas (`L{ENTER}`). Confere que o lançador montou a pasta C:, que o gerenciador fez CHAIN para o LAJE e que a tela gravada é o menu do LAJE. No Linux, sob `xvfb-run`.
5. Testes de `tools/runtests.sh`:
   - a sonda T20 (`tests/retraducao/QB64_T20.BAS`): potências e raízes do RT45 da V1 contra os bits gravados no original (`QB45_T20.saida.bin`); a saída tem de ser igual à versionada (`QB64_T20.saida.txt`, com as 2 diferenças conhecidas). Nos três sistemas (`runtests.sh SONDA` no Linux e no macOS).
   - os `tests/T_*.BAS`: testes de unidade da versão anterior (`src-reconstructed`). Só no Windows: 7 deles incluem o `SISTELA.BI`, que declara a `user32`, e não compilam fora dele; o `T_SISDADOS` falha 2 checagens de arquivo truncado no Linux.
6. `bun test paridade/testes` (Bun 1.4.2), só no Linux: é TypeScript, igual em todo sistema. Os 2 casos que leem o oráculo pulam sem `ORACULO`.
7. Envia `build/` como `v1-build-<so>-x64.tar.gz` (tar para manter a permissão de execução), por 3 dias.

`MACOSX_DEPLOYMENT_TARGET=13.0` vale para o job inteiro: no macOS, o QB64 PE e os programas saem para o macOS 13 em diante (sem isso o clang usa a versão do runner). Nos outros sistemas a variável não tem efeito.

A release oficial que o QB64 PE chama de 4.7.0 tem a tag `v4.7.0-GLFW`. Para trocar de versão, mude `QB64_VERSAO` no `build.yml`; a chave do cache muda junto.

### O que não roda no CI

- **Regenerar `src-original/` pelo tradutor e conferir que sai igual.** O tradutor (`tools/regenera.sh`) lê o pseudo-BASIC recuperado dos EXE originais (`dump/<EXE>/*.lift.txt`), que não está no repositório. Sem ele não há o que regenerar.
- **Casos contra o oráculo** (`tests/retraducao/*/roda_casos.sh`, `tools/compara_retrad.py`): precisam do original rodando no DOSBox-X (`ORACULO`), fora do repositório.
- **`tools/roteiros.sh`**: roteiros de teclas da versão anterior (`src-reconstructed`). Ele espera os EXE da versão anterior em `build/` e só olha o código de saída do primeiro processo. Na V1 o CHAIN encerra o processo (`SYSTEM`) depois de abrir o próximo programa, e o roteiro esgotado termina com 0 (`RT_FIM`), então o resultado não diria nada. Também usa `cygpath` e `powershell`, só do Windows.

## release.yml

Gera os instaladores e publica a release.

Quando roda:

- push de tag `v*`: gera e publica;
- manual: gera os instaladores como artifacts do run e só publica se o run for disparado a partir de uma tag.

Jobs:

1. `build`: chama o `build.yml` (os três sistemas, com fumaça e testes).
2. `pacote` (um job por sistema): baixa o build do sistema, roda `pacote/<so>/empacotar.sh` e depois instala o pacote gerado e roda o `tools/fumaca.sh` na instalação:
   - Windows: `OpenStrut-V1-Setup-windows-x64.exe` (Inno Setup 6 da imagem; se não achar, `choco install innosetup`). Teste: instalação silenciosa numa pasta temporária, fumaça e desinstalação silenciosa.
   - Linux: `OpenStrut-V1-linux-x64.tar.gz`. Teste: extrai, `./instalar.sh`, fumaça em `~/.local/share/openstrut` sob Xvfb, `desinstalar.sh`.
   - macOS: `OpenStrut-V1-macos-x64.dmg`. Teste: monta o `.dmg`, `codesign --verify` no app e fumaça pelo executável do app (que copia a V1 para `~/Library/Application Support/OpenStrut/V1` e abre o lançador de lá). Depois abre o app pelo LaunchServices (`open -n --env ...`, como o duplo clique) com o mesmo roteiro e exige "LAJE: fim" no log. Isso prova que o app abre o lançador, que as variáveis chegam e que o gerenciador e o CHAIN continuam depois que o processo principal do app termina. Com roteiro não há janela.

### Duplo clique no macOS: o que o CI mostrou (17/10/2026, branch de diagnóstico)

- O primeiro `open -n` (run 38996470674) só avisou porque a checagem não tirava o ``: o RT45 grava o log com CRLF também fora do Windows. O roteiro tinha chegado a "LAJE: fim" pelo LaunchServices.
- No macOS e no Linux, o `SHELL _DONTWAIT` do QB64 faz `fork()` e `system()`: o lançador sai, e uma cópia dele fica como pai do `SISTRUT.exe` (adotada pelo launchd) até o gerenciador terminar. Sem roteiro, o gerenciador continuou vivo por mais de 60 s depois do `open -n`.
- O runner não abre janela de programa QB64: qualquer programa com janela, até um `PRINT` mínimo, morre com "Failed to initialize window" (alerta do QB64 por `osascript`). A VM `macos-15-intel` só tem a "Apple Paravirtualized Graphics Device" (Metal), e o QB64 PE usa janela OpenGL pelo GLFW. Com roteiro a V1 não chama `_SCREENSHOW` e não cria janela, por isso a fumaça passa. A janela visível só se confere num Mac de verdade (checagem manual abaixo).
- Pedido de microfone: aberto como app, todo programa QB64 que usa som (os 28 da V1 usam `BEEP`/`SOUND`) faz o macOS pedir acesso ao microfone (`kTCCServiceMicrophone`, atribuído ao `OPENSTRUT.exe`). Vem do CoreAudio ao abrir a AudioUnit `HALOutput` do miniaudio 0.11.25 do QB64; tirar o listener do dispositivo de entrada ou o `EnableIO` de entrada do miniaudio não mudou nada. O programa não espera a resposta: com o pedido na tela, o som tocou e o programa seguiu. O `LEIA-ME` do macOS diz que dá para recusar.
3. `publicar` (só em tag): `gh release create` com os três instaladores e notas geradas pelo GitHub. Tag com hífen (`v1.0.0-rc1`) sai como pre-release. Se a release já existir, os arquivos são substituídos.

A versão dos pacotes é a tag sem o `v`. Fora de tag é `0.0.0-dev.<número do run>`.

### O que o usuário instala

O mesmo conteúdo nos três sistemas: os 28 programas, o lançador `OPENSTRUT.exe`, `sistrut-game/` (os `.INI` e as parametrizações da instalação do original), o ícone e o `LEIA-ME.txt` (`pacote/leia-me/`). O atalho abre o lançador, que:

1. usa como disco C: a pasta `OpenStrut` do usuário (`%USERPROFILE%\OpenStrut`, `~/OpenStrut`), ou a de `SISTRUT_C` se estiver definida;
2. copia para ela `sistrut-game/` (`C:\SISTRUT\SISTRUT.INI` e `C:\SISTRUT\EXEC40\`), só o que falta, sem sobrescrever a configuração do usuário;
3. fora do Windows, define `COMSPEC=C:\COMMAND.COM` se ela não existir: o gerenciador e os módulos tiram dela a letra do disco, como no DOS, e sem ela montam caminhos `:\SISTRUT\...` e caem no "erro no processamento";
4. abre o `SISTRUT.exe` com essa pasta como pasta corrente.

As obras ficam nessa pasta, fora da instalação: reinstalar ou desinstalar não mexe nelas.

| Sistema | Pacote | Instala em | Atalhos |
| --- | --- | --- | --- |
| Windows | Inno Setup, por usuário, sem administrador | `%LOCALAPPDATA%\Programs\OpenStrut` | menu Iniciar (V1, pasta das obras, V2 web, desinstalar) e área de trabalho |
| Linux | `.tar.gz` com `instalar.sh`, sem sudo | `~/.local/share/openstrut` | `.desktop` no menu (V1 e V2 web) e na Área de Trabalho, se houver |
| macOS | `.app` num `.dmg`, assinatura ad hoc | onde o usuário arrastar o app; os programas são copiados para `~/Library/Application Support/OpenStrut/V1` na primeira execução (para tirar a quarentena) | o app e um `.webloc` da V2 no `.dmg` |

A V2 saiu dos pacotes. Ela é web e instalável como PWA em https://gmunaro.github.io/openstrut/; empacotá-la exigia o build da V2, um lançador em Bun por sistema e um navegador Chromium na máquina do usuário. Os pacotes levam só um atalho para o endereço (`V2_URL` em `pacote/comum.sh`).

### Checagem manual antes da primeira tag

O que o CI não prova e precisa de uma pessoa, com os pacotes de um `workflow_dispatch` do `release.yml`:

- **macOS, duplo clique.** Num Mac, abrir o `.dmg`, arrastar o app para Aplicativos, liberar no Gatekeeper (botão direito > Abrir, ou Ajustes > Privacidade e Segurança) e dar duplo clique: a janela do gerenciador tem de aparecer (o runner não abre janela OpenGL, ver acima), e F2/Esc e um módulo (L) têm de funcionar. Recusar o pedido de microfone e conferir que o programa segue e que o bipe toca. Conferir também com o `.dmg` baixado do navegador (quarentena), o que o CI não reproduz.
- **Apple Silicon.** Num Mac M1 ou mais novo: sem o Rosetta, o app avisa com o comando `softwareupdate --install-rosetta`; com ele, abre. Ninguém conferiu se o Rosetta 2 reproduz o x87 de 80 bits que o RT45 usa: rode lá o `runtests.sh SONDA` (ou compare uma obra com o Windows) antes de dizer que o Mac M1 dá os mesmos números.
- **Windows e Linux com tela.** Abrir pelo atalho e ver a janela; o CI roda tudo com roteiro e, no Linux, no Xvfb.

## Validação

Feita antes do primeiro run no GitHub (16/10/2026):

- `actionlint` 1.7.12 (com shellcheck) via Docker, sem erros:

  ```bash
  MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd -W):/repo" --workdir /repo rhysd/actionlint:latest -no-color
  ```

- shellcheck (`-S warning`) nos scripts de `tools/` e `pacote/` tocados, sem avisos.
- `act` 0.2.89, job Linux do `build.yml` num contêiner Ubuntu 24.04 (imagem `catthehacker/ubuntu:act-24.04` com um usuário `runner` comum, porque o `setup_lnx.sh` se recusa a rodar como root, que é o padrão do `act`): todos os passos passaram (dependências, instalação do QB64 PE, cache, compilação 29/29 em 12 min, fumaça, sonda T20, `bun test`, tar do build), menos o upload: o servidor de artifacts do `act` não aceita o campo `mime_type` do `upload-artifact@v7`. O `release.yml` e os jobs de Windows e macOS não rodam no `act`.
- Windows 11 (QB64 PE 4.7.0): `build.sh` 29/29, `fumaca.sh` OK, `runtests.sh` 25/25, `bun test paridade/testes` 50 pass e 2 skip. Lançador chamado por caminho relativo (`build\OPENSTRUT.exe` pelo `cmd`, `.\OPENSTRUT.exe` de dentro de `build`, `./build/OPENSTRUT.exe` pelo bash): OK. Instalador do Inno Setup gerado e o passo "Instalar e testar (Windows)" do `release.yml` rodado aqui com um perfil temporário: instala, fumaça OK, os 4 atalhos do menu são `.lnk` válidos, e depois de desinstalar o grupo do menu e os programas somem. Com `COMSPEC=D:\...` (Windows fora do C:) o módulo dá "Erro de Operacao"; o contorno do `LEIA-ME` (`set COMSPEC=C:\COMMAND.COM`) funciona.
- Linux (Ubuntu 24.04, as dependências apt e o `setup_lnx.sh` do `build.yml`): `build.sh` 29/29 (9 min), `fumaca.sh` OK sob Xvfb, `runtests.sh SONDA` OK (os `T_*` falham, ver acima), lançador por caminho relativo e por symlink OK, `.tar.gz` gerado, `instalar.sh`, fumaça na instalação e `desinstalar.sh` OK. Árvore do `.app` do macOS montada e o script do app rodado com um `arch` falso: com Rosetta abre e a fumaça passa; sem Rosetta avisa com o comando de instalação e sai com 1; com o `exec` falhando avisa e sai com 1. `xattr`, `codesign`, `iconutil`, `hdiutil`, `osascript` e `open` não existem no Linux.
- macOS: nada rodou. Só a sintaxe dos workflows e o shellcheck dos scripts.

O primeiro run no GitHub é o teste real do macOS inteiro, do Inno Setup da imagem `windows-latest` e dos uploads de artifact.
