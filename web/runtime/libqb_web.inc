// libqb_web.inc - camada web da libqb (qbweb.h). Incluido no fim do libqb.cpp (prepara_libqb.py),
// porque usa as variaveis internas dele (cmem, display_frame, close_program...).
//
// O MAIN_LOOP do QB64 roda numa thread propria a cada 16 ms: atualiza o relogio da BIOS em cmem,
// desenha a tela (display) e encerra o programa. Aqui o mesmo trabalho e feito em qbweb_tique(),
// chamado pelo Sleep e pelas consultas ao teclado/relogio, e o quadro pronto vai para o canvas.

#include <emscripten.h>

static double qbweb_ultima_cessao = 0; // ms (emscripten_get_now) da ultima vez que cedeu
static double qbweb_ultimo_quadro = 0;
static int qbweb_no_tique = 0;
static int qbweb_terminando = 0;

// desenha o quadro BGRA pronto no canvas (web/site/v1.js: Module.qbwebQuadro)
EM_JS(void, qbweb_js_quadro, (const void *bgra, int w, int h), {
    if (Module.qbwebQuadro)
        Module.qbwebQuadro(bgra, w, h);
});
EM_JS(int, qbweb_js_shell, (const char *cmd, int espera), {
    if (Module.qbwebShell)
        return Module.qbwebShell(UTF8ToString(cmd), espera);
    return 0;
});
EM_JS(void, qbweb_js_fim, (int codigo), {
    if (Module.qbwebFim)
        Module.qbwebFim(codigo);
});

EM_JS(void, qbweb_js_erro, (int n, int linha), {
    if (Module.qbwebErro)
        Module.qbwebErro(n, linha);
});
void qbweb_erro(int numero, int linha) { qbweb_js_erro(numero, linha); }

// pega o quadro de maior ordem que display() deixou pronto (o que GLUT_DISPLAY_REQUEST faz)
static void qbweb_mostra_quadro() {
    int i = -1, ultimo = -1;
    int64 maior = 0;
    for (int k = 0; k <= 2; k++)
        if (display_frame[k].state == DISPLAY_FRAME_STATE__DISPLAYING)
            ultimo = k;
    if (ultimo != -1)
        maior = display_frame[ultimo].order;
    for (int k = 0; k <= 2; k++)
        if (display_frame[k].state == DISPLAY_FRAME_STATE__READY && display_frame[k].order > maior) {
            maior = display_frame[k].order;
            i = k;
        }
    if (i == -1)
        return;
    for (int k = 0; k <= 2; k++)
        if (k != i && (display_frame[k].state == DISPLAY_FRAME_STATE__DISPLAYING ||
                       (display_frame[k].state == DISPLAY_FRAME_STATE__READY && display_frame[k].order < display_frame[i].order)))
            display_frame[k].state = DISPLAY_FRAME_STATE__EMPTY;
    display_frame[i].state = DISPLAY_FRAME_STATE__DISPLAYING;
    qbweb_js_quadro(display_frame[i].bgra, display_frame[i].w, display_frame[i].h);
}

// fim do programa como o end_program do MAIN_LOOP (sem as threads)
static void qbweb_encerra() {
    if (qbweb_terminando)
        return;
    qbweb_terminando = 1;
    stop_program = 1;
    qbevent = 1;
    sub_close(NULL, 0);
    // ultimo quadro, para a tela final ficar visivel
    if (autodisplay)
        display();
    qbweb_mostra_quadro();
    qbweb_fim_programa((int)exit_code);
}

// trabalho de uma volta do MAIN_LOOP
static void qbweb_tique() {
    if (qbweb_no_tique)
        return;
    qbweb_no_tique = 1;
    if (exit_value && !exit_blocked)
        close_program = 1;
    if (close_program) {
        qbweb_no_tique = 0;
        qbweb_encerra();
        return;
    }
    // relogio da BIOS em 0:46C (como o MAIN_LOOP)
    uint64_t t = (uint64_t)(func_timer(0.001, 1) * 1000);
    t %= 86400000;
    t = ((double)t) * 0.0182;
    cmem[0x46c] = t & 255;
    cmem[0x46d] = (t >> 8) & 255;
    cmem[0x46e] = (t >> 16) & 255;
    vertical_retrace_happened = 1;
    double agora = emscripten_get_now();
    if (agora - qbweb_ultimo_quadro >= 32) { // o MAIN_LOOP desenha a cada 32 ms
        qbweb_ultimo_quadro = agora;
        if (autodisplay)
            display();
        qbweb_mostra_quadro();
    }
    qbweb_no_tique = 0;
}

void qbweb_sleep(uint32_t ms) {
    qbweb_tique();
    qbweb_ultima_cessao = emscripten_get_now();
    emscripten_sleep(ms);
}

void qbweb_cede() {
    double agora = emscripten_get_now();
    if (agora - qbweb_ultima_cessao >= 16 && !qbweb_no_tique)
        qbweb_sleep(0);
}

void qbweb_inicio() {
    lock_display_required = 0; // display() roda na mesma chamada que o programa
    qbweb_ultima_cessao = emscripten_get_now();
}

void qbweb_fim_programa(int codigo) {
    qbweb_js_fim(codigo);
    emscripten_force_exit(codigo);
}

int64_t qbweb_shell(qbs *cmd, int32_t passed, int espera) {
    std::string s;
    if (passed && cmd)
        s.assign((const char *)cmd->chr, cmd->len);
    return qbweb_js_shell(s.c_str(), espera);
}

void qbweb_caminho_dos(char *p, size_t n) {
    // absoluto em /C/..., ou relativo com a pasta corrente dentro de /C
    bool no_drive = n >= 2 && p[0] == '/' && (p[1] == 'C' || p[1] == 'c') && (n == 2 || p[2] == '/');
    if (!no_drive && n && p[0] != '/') {
        char cwd[512];
        if (getcwd(cwd, sizeof cwd) && cwd[0] == '/' && cwd[1] == 'C' && (cwd[2] == '/' || cwd[2] == 0))
            no_drive = true;
    }
    if (!no_drive)
        return;
    for (size_t i = 0; i < n; i++)
        if (p[i] >= 'a' && p[i] <= 'z')
            p[i] = (char)(p[i] - 'a' + 'A');
}

// ------------------------------------------------------------------ chamadas do JavaScript
extern "C" {
EMSCRIPTEN_KEEPALIVE void qbweb_tecla(int key, int scancode, int acao, int mods) {
    qbweb_mods = mods;
    GLUT_KEYBOARD_BUTTON_FUNC((GLUTEmu_KeyboardKey)key, scancode, (GLUTEmu_ButtonAction)acao, mods);
}
EMSCRIPTEN_KEEPALIVE void qbweb_caractere(unsigned cp, int mods) {
    qbweb_mods = mods;
    GLUT_KEYBOARD_CHARACTER_FUNC((char32_t)cp, mods);
}
}
