#!/usr/bin/env bash
# Roda um modulo do SISTRUT dirigido por um roteiro de teclas (teste de uso).
# Uso: tools/roteiro.sh roteiros/NOME.txt [EXE inicial] [limite em s, padrao 120]
# Sem EXE, usa a linha "# exe: NOME" do roteiro (senao SISTRUT).
#
# Cria roteiros/saida/NOME-<data>/ com os .exe de build/ (hard link), copias
# dos INIs e parametrizacoes e, se existir, o conteudo de roteiros/NOME.dados/
# (obra de partida). O programa roda nessa pasta (dados = pasta do programa)
# com SISTRUT_ROTEIRO apontando para a copia do roteiro (ver common/SISTELA.BM).
# Ficam na pasta: os arquivos gravados pela obra, as telas {TELA nome} (.txt
# ou .png), roteiro.txt.log (telas, erros, fim) e roteiro.txt.pos.
#
# Saida: 0 o programa terminou (F2/Esc ate o fim); 3 o roteiro acabou com o
# programa ainda esperando tecla (tela em esgotado_<EXE>.txt); 4 erro de
# execucao (tela em erro_<EXE>.txt); 5 roteiro mal formado; 124 estourou o
# limite de tempo (processos da pasta sao encerrados).

DIST="$(cd "$(dirname "$0")/.." && pwd)"
rot="$1"; exe="$2"; lim="${3:-120}"
[ -f "$rot" ] || { echo "uso: tools/roteiro.sh roteiros/NOME.txt [EXE] [segundos]" >&2; exit 2; }
[ -n "$exe" ] || exe="$(grep -m1 '^# exe:' "$rot" | sed 's/^# exe: *//' | tr -d '\r ')"
[ -n "$exe" ] || exe=SISTRUT
nome="$(basename "$rot" .txt)"
dir="$DIST/roteiros/saida/$nome-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$dir" || exit 2

# .exe: copia por versao em roteiros/saida/_exe/ e hard link dela (barato e
# sem prender build/, que outro build pode estar regravando)
mkdir -p "$DIST/roteiros/saida/_exe"
for f in "$DIST"/build/*.exe; do
    b="$(basename "$f" .exe)"
    s="$DIST/roteiros/saida/_exe/$b-$(stat -c %Y "$f")-$(stat -c %s "$f").exe"
    [ -f "$s" ] || cp "$f" "$s"
    ln "$s" "$dir/$b.exe" 2>/dev/null || cp "$s" "$dir/$b.exe"
done
for f in "$DIST"/build/*; do
    case "$f" in *.exe) ;; *) [ -f "$f" ] && cp "$f" "$dir/" ;; esac
done
dados="$(dirname "$rot")/$nome.dados"
[ -d "$dados" ] && cp -r "$dados"/. "$dir/"
cp "$rot" "$dir/roteiro.txt"

rotwin="$(cygpath -w "$dir/roteiro.txt")"
(cd "$dir" && SISTRUT_ROTEIRO="$rotwin" timeout "$lim" "./$exe.exe")
rc=$?

if [ "$rc" -eq 124 ]; then
    # encerra o que sobrou (submodulos chamados por SHELL) - so processos desta pasta
    dirwin="$(cygpath -w "$dir")"
    powershell -NoProfile -Command "Get-CimInstance Win32_Process | Where-Object { \$_.ExecutablePath -like '$dirwin\\*' } | ForEach-Object { Stop-Process -Id \$_.ProcessId -Force }"
fi

echo "pasta: $dir"
echo "saida: $rc"
[ -f "$dir/roteiro.txt.log" ] && sed 's/^/  log | /' "$dir/roteiro.txt.log"
exit "$rc"
