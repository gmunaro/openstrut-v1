# Ambiente do Emscripten para os scripts de web/tools (source web/tools/emenv.sh).
# Com o em++ no PATH (emsdk_env.sh, ou o setup-emsdk do CI), nada muda; senao EMSDK aponta para a
# instalacao do emsdk.
if ! command -v em++ >/dev/null 2>&1; then
    EMSDK="${EMSDK:?defina EMSDK=<pasta do emsdk> ou ponha o em++ no PATH (emsdk_env.sh)}"
    export EMSDK EM_CONFIG="$EMSDK/.emscripten"
    for n in "$EMSDK"/node/*/bin "$EMSDK"/node/*; do [ -x "$n/node" ] || [ -x "$n/node.exe" ] && { PATH="$n:$PATH"; break; }; done
    export PATH="$EMSDK/upstream/emscripten:$EMSDK:$PATH"
fi
