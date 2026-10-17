// qbweb_stubs.cpp - o que a libqb pede de bibliotecas que nao entram no build web.
// - SOUND/BEEP: tom no WebAudio (sem fila: o roteiro nao depende da duracao do som)
// - tinyfiledialogs (gui.cpp): caixa de mensagem no console do navegador
// - stack trace (logging/stacktrace.cpp usa _Unwind, que o wasm nao tem)
#include "libqb-common.h"

#include <emscripten.h>
#include <string>

EM_JS(void, qbweb_js_som, (double freq, double seg), {
    if (Module.qbwebSom)
        Module.qbwebSom(freq, seg);
});
EM_JS(void, qbweb_js_mensagem, (const char *titulo, const char *msg), {
    console.log('[QB64] ' + UTF8ToString(titulo) + ': ' + UTF8ToString(msg));
});

void sub_sound(float frequency, float lengthInClockTicks, float volume, float panPosition, int32_t waveform, float waveformParam, uint32_t voice,
               int32_t option, int32_t passed) {
    (void)volume, (void)panPosition, (void)waveform, (void)waveformParam, (void)voice, (void)option, (void)passed;
    if (frequency > 0 && lengthInClockTicks > 0)
        qbweb_js_som(frequency, lengthInClockTicks / 18.2);
}

extern "C" {
void tinyfd_beep(void) { qbweb_js_som(900, 0.2); }
int tinyfd_messageBox(char const *aTitle, char const *aMessage, char const *aDialogType, char const *aIconType, int aDefaultButton) {
    (void)aDialogType, (void)aIconType;
    qbweb_js_mensagem(aTitle ? aTitle : "", aMessage ? aMessage : "");
    return aDefaultButton ? aDefaultButton : 1;
}
}

std::string libqb_log_get_stacktrace(bool) { return std::string(); }
