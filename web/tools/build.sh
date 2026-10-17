#!/usr/bin/env bash
# Build web da V1: libqb do QB64 PE + programas retraduzidos em WebAssembly (Emscripten).
# Uso: web/tools/build.sh [programa ...]        (sem programa: so a libqb)
#   programa = caminho do .BAS relativo a src-original (ex.: armacao/ARMADURA.BAS)
# Ambiente: QB64_DIR (padrao /c/qb64pe/qb64pe), EMSDK (emsdk; dispensado se o em++ ja esta no PATH),
#   WEB_BUILD (pasta de trabalho, padrao $TMPDIR/v1web/build), WEB_DIST (saida, padrao web/dist),
#   WEB_OPT (otimizacao, padrao -O2), WEB_J (compilacoes em paralelo, padrao 8).
# Saida: $WEB_DIST/<EXE>.js e <EXE>.wasm, mais os arquivos de web/site.
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
web="$(cd "$aqui/.." && pwd)"
raiz="$(cd "$web/.." && pwd)"
QB64_DIR="${QB64_DIR:-/c/qb64pe/qb64pe}"
WEB_BUILD="${WEB_BUILD:-${TMPDIR:-/tmp}/v1web/build}"
WEB_DIST="${WEB_DIST:-$web/dist}"
WEB_OPT="${WEB_OPT:-"-O2"}"
WEB_J="${WEB_J:-8}"
# Asyncify (padrao, todos os navegadores) ou JSPI (link rapido; Chrome 137+, Node com --experimental-wasm-jspi)
if [ "${WEB_ASYNC:-asyncify}" = jspi ]; then ASYNC="-sJSPI=1"; else ASYNC="-sASYNCIFY=1 -sASYNCIFY_STACK_SIZE=1048576 -sASYNCIFY_IGNORE_INDIRECT=1"; fi
source "$aqui/emenv.sh"
py() { if command -v python >/dev/null 2>&1; then python -I "$@"; else python3 -I "$@"; fi; }

qbc="$WEB_BUILD/qbc"
sf="$web/third_party/softfloat-3e"
obj="$WEB_BUILD/obj"
mkdir -p "$WEB_BUILD" "$obj" "$WEB_DIST"

DEPS="-DDEPENDENCY_NO_SOCKETS -DDEPENDENCY_NO_PRINTER -DDEPENDENCY_NO_ICON -DDEPENDENCY_NO_SCREENIMAGE -DDEPENDENCY_IMAGE_CODEC"
INCS="-I$qbc -I$qbc/libqb/include -I$qbc/parts/core/glfw/include -I$qbc/parts/core/glad/include -I$web/runtime -I$sf -I$sf/source/include -I$sf/source/8086"
SFOPTS="-DSOFTFLOAT_FAST_INT64 -DSOFTFLOAT_ROUND_ODD -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV32TO16 -DSOFTFLOAT_FAST_DIV64TO32"
CXXF="-std=gnu++20 -fno-strict-aliasing -Wno-conversion-null -w $WEB_OPT $DEPS $INCS $SFOPTS"
CF="$WEB_OPT -w $DEPS $INCS $SFOPTS"

# compila em paralelo: lista "fonte|objeto|compilador" na entrada
compila() {
    xargs -P "$WEB_J" -d '\n' -n 1 bash -c '
        IFS="|" read -r f o cc <<< "$0"
        if [ ! -f "$o" ] || [ "$f" -nt "$o" ]; then
            if [ "$cc" = c ]; then emcc '"$CF"' -c "$f" -o "$o" || { echo "FALHOU: $f" >&2; exit 255; }
            else em++ '"$CXXF"' -c "$f" -o "$o" || { echo "FALHOU: $f" >&2; exit 255; }; fi
        fi'
}

# ------------------------------------------------------------------ libqb
libqb="$WEB_BUILD/libqb_web.a"
selo="$WEB_BUILD/libqb.selo"
assinatura="$(cat "$aqui/prepara_libqb.py" "$aqui/f80iza.py" "$web"/runtime/* "$QB64_DIR/internal/c/libqb.cpp" | md5sum | cut -c1-32)"
if [ ! -f "$libqb" ] || [ "$(cat "$selo" 2>/dev/null)" != "$assinatura" ]; then
    echo "== libqb (QB64 PE em $QB64_DIR)"
    rm -rf "$obj"; mkdir -p "$obj"
    py "$aqui/prepara_libqb.py" "$QB64_DIR" "$qbc"
    lista=""
    add() { lista+="$1|$obj/$2.o|$3"$'\n'; }
    add "$qbc/libqb.cpp" libqb cxx
    for f in "$qbc"/libqb/src/*.cpp "$qbc"/libqb/src/logging/*.cpp "$qbc"/libqb/src/logging/handlers/*.cpp "$qbc"/libqb/src/logging/unix/*.cpp; do
        add "$f" "src_$(basename "$f" .cpp)" cxx
    done
    for f in "$web"/runtime/*.cpp; do add "$f" "web_$(basename "$f" .cpp)" cxx; done
    add "$qbc/parts/video/font/stub_font.cpp" stub_font cxx
    add "$qbc/parts/audio/stub_audio.cpp" stub_audio cxx
    for f in image.cpp stb/stb_image.cpp qoi/qoi.cpp jo_gif/jo_gif.cpp nanosvg/nanosvg.cpp pixelscalers/hqx.cpp pixelscalers/mmpx.cpp pixelscalers/sxbr.cpp sg_curico/sg_curico.cpp sg_pcx/sg_pcx.cpp tiny_webp/tiny_webp.cpp; do
        add "$qbc/parts/video/image/$f" "img_$(basename "$f" .cpp)" cxx
    done
    add "$qbc/parts/data/compression.cpp" data_compression cxx
    add "$qbc/parts/data/encoding.cpp" data_encoding cxx
    add "$qbc/parts/data/modp_b64.cpp" data_modp cxx
    add "$qbc/parts/data/miniz.c" data_miniz c
    add "$qbc/parts/gui/gui.cpp" gui cxx
    add "$qbc/parts/core/glad/src/gl.c" glad c
    for f in "$sf"/source/*.c "$sf"/source/8086/*.c; do add "$f" "sf_$(basename "$f" .c)" c; done
    printf '%s' "$lista" | compila
    rm -f "$libqb"
    emar rcs "$libqb" "$obj"/*.o
    echo "$assinatura" > "$selo"
fi

# ------------------------------------------------------------------ programas
# "todos" = os 28 de src-original; em paralelo (WEB_PJ, padrao 4), um log por programa
[ "${1:-}" = todos ] && set -- $(cd "$raiz/src-original" && ls */*.BAS)
export WEB_BUILD WEB_DIST WEB_OPT ASYNC CXXF libqb qbc raiz aqui
mkdir -p "$WEB_BUILD/log"
rmdir "$WEB_BUILD/qb64pe.lock" 2>/dev/null || true   # trava de um build interrompido (gera_cpp.sh)
falhas=0
if [ $# -gt 0 ]; then
    printf '%s\n' "$@" | xargs -P "${WEB_PJ:-4}" -I{} bash -c '
        exe="$(basename "{}" .BAS)"
        if bash "$aqui/build_prog.sh" "{}" > "$WEB_BUILD/log/$exe.log" 2>&1; then
            echo "   ok    $exe $(stat -c %s "$WEB_DIST/$exe.wasm") bytes, $(tail -1 "$WEB_BUILD/log/$exe.log")"
        else
            echo "   FALHA $exe (log: $WEB_BUILD/log/$exe.log)"; exit 1
        fi' || falhas=1
fi
# site: pagina, instalacao inicial do drive C: e sementes dos modulos compilados
cp -r "$web"/site/* "$WEB_DIST/"
exes=""; for f in "$WEB_DIST"/*.wasm; do [ -f "$f" ] && exes="$exes $(basename "$f" .wasm)"; done
# modulos que o site tem (o CHAIN/RUN so abre estes)
echo "[$(for e in $exes; do printf '"%s",' "$e"; done | sed 's/,$//')]" > "$WEB_DIST/modulos.json"
py "$aqui/instalacao.py" "$raiz/sistrut-game" "$WEB_DIST" $exes
[ "$falhas" = 0 ]
