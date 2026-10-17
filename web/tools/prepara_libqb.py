#!/usr/bin/env python3
"""prepara_libqb.py - copia a libqb do QB64 PE e adapta para o build web (Emscripten).

Uso: prepara_libqb.py <pasta do QB64 PE> <pasta de saida>

Copia internal/c (libqb.cpp, libqb/, qbx.cpp, common.h, os.h e as partes usadas) e aplica as
trocas abaixo, cada uma conferida: se o texto esperado nao for achado o script para (versao do
QB64 diferente da 4.7.0 precisa de revisao). As trocas so valem com QB64_WEB, que o
libqb-common.h define com o Emscripten; o QB64 nativo nao e tocado.

  - QB64_WEB: sistema novo (unix sem X11/GL); o qb_f80.h entra em todo arquivo C++.
  - long double -> qb_f80 em toda a libqb (f80iza.py).
  - VAL e _TOSTR$ de _FLOAT: conversao decimal do qb_f80 (o %Lf/%LG do printf nao serve).
  - arredondamento (rounding.h): como o x87 (FISTP ao par, indefinido 0x80000000).
  - Sleep: tique da camada web (tela, relogio, fim do programa) e emscripten_sleep.
  - main(): roda o programa direto, sem as threads do QB64 (QBMAIN, TIMERTHREAD, MAIN_LOOP).
  - display(): desenha mesmo com $SCREENHIDE (o RT45 esconde a janela quando ha roteiro).
  - SHELL: vai para o JavaScript (o CHAIN/RUN do RT45 e um SHELL _DONTWAIT).
  - caminhos dentro do drive /C: maiusculas (o DOS e o Windows nao diferenciam).
"""
import os
import shutil
import subprocess
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))


def troca(caminho, velho, novo, vezes=1):
    with open(caminho, 'r', encoding='latin-1', newline='') as f:
        s = f.read().replace('\r\n', '\n')  # a release do Windows vem em CRLF
    n = s.count(velho)
    if n != vezes:
        sys.exit('prepara_libqb: %s: esperado %d ocorrencia(s), achei %d:\n%s' % (caminho, vezes, n, velho))
    s = s.replace(velho, novo)
    with open(caminho, 'w', encoding='latin-1', newline='') as f:
        f.write(s)


def acrescenta(caminho, texto):
    with open(caminho, 'a', encoding='latin-1', newline='') as f:
        f.write(texto)


def main(qb, saida):
    c = os.path.join(qb, 'internal', 'c')
    if os.path.exists(saida):
        shutil.rmtree(saida)
    os.makedirs(saida)
    for nome in ('libqb.cpp', 'qbx.cpp', 'common.h', 'os.h'):
        shutil.copy(os.path.join(c, nome), saida)
    ignora = shutil.ignore_patterns('*.o', '*.a')
    shutil.copytree(os.path.join(c, 'libqb'), os.path.join(saida, 'libqb'), ignore=ignora)
    for parte in ('core/glad', 'core/glfw/include', 'video/font', 'video/image', 'audio', 'data', 'gui', 'os/clipboard',
                  'input/game_controller', 'network/http'):
        orig = os.path.join(c, 'parts', parte)
        if os.path.isdir(orig):
            shutil.copytree(orig, os.path.join(saida, 'parts', parte), ignore=ignora)
    # estes nao entram no build web (trocados pelos de web/runtime)
    for nome in ('glut-emu.cpp', 'main-thread-gui.cpp', 'main-thread-console.cpp', 'threading-windows.cpp', 'qb_http.cpp',
                 'window-console.cpp'):
        p = os.path.join(saida, 'libqb', 'src', nome)
        if os.path.exists(p):
            os.remove(p)
    os.remove(os.path.join(saida, 'libqb', 'src', 'logging', 'stacktrace.cpp'))  # _Unwind: qbweb_stubs.cpp

    inc = os.path.join(saida, 'libqb', 'include')
    src = os.path.join(saida, 'libqb', 'src')
    lq = os.path.join(saida, 'libqb.cpp')

    # ------------------------------------------------------------ sistema e qb_f80
    troca(os.path.join(inc, 'libqb-common.h'), '''#elif defined(__linux__)
#    define QB64_LINUX''', '''#elif defined(__EMSCRIPTEN__)
#    define QB64_WEB
#    define QB64_UNIX
#    define QB64_GCC
#elif defined(__linux__)
#    define QB64_LINUX''')
    troca(os.path.join(inc, 'libqb-common.h'), '''#define QB_FALSE 0''', '''#if defined(QB64_WEB) && defined(__cplusplus)
#    include "qb_f80.h" // o _FLOAT (long double do x87) em software; ver web/runtime/qb_f80.h
#    include "qbweb.h"
#endif

#define QB_FALSE 0''')

    # long double -> qb_f80 em toda a libqb
    arqs = [lq, os.path.join(saida, 'qbx.cpp')] + [os.path.join(src, f) for f in os.listdir(src) if f.endswith('.cpp')] + \
           [os.path.join(inc, f) for f in os.listdir(inc) if f.endswith('.h')]
    subprocess.check_call([sys.executable, '-I', os.path.join(AQUI, 'f80iza.py')] + arqs)
    # cabecalho que agora usa o qb_f80 precisa do libqb-common.h (que inclui o qb_f80.h)
    for f in os.listdir(inc):
        p = os.path.join(inc, f)
        if f.endswith('.h') and f != 'libqb-common.h':
            with open(p, encoding='latin-1', newline='') as h:
                t = h.read()
            if 'qb_f80' in t:
                with open(p, 'w', encoding='latin-1', newline='') as h:
                    h.write('#include "libqb-common.h"' + chr(10) + t)

    # VAL de _FLOAT: o %Lf do sscanf (__mingw_sscanf no Windows)
    troca(os.path.join(src, 'qbs_val.cpp'), '''#else
    sscanf(qbs_val_built_number, "%Lf", &value.f);
#endif''', '''#elif defined(QB64_WEB)
    value.f = qb_f80_de_texto(qbs_val_built_number);
#else
    sscanf(qbs_val_built_number, "%Lf", &value.f);
#endif''')
    # _TOSTR$ de _FLOAT: "%.*LG"
    troca(os.path.join(src, 'qbs__tostr.cpp'), '''#else
    tqbs->len = snprintf((char *)tqbs->chr, 32, "%.*LG", digits, value);
#endif''', '''#elif defined(QB64_WEB)
    tqbs->len = qb_f80_formata_g((char *)tqbs->chr, 32, value, digits, true);
#else
    tqbs->len = snprintf((char *)tqbs->chr, 32, "%.*LG", digits, value);
#endif''')

    # PRINT USING de _FLOAT: "% .255Lf" (o qb_f80 nao passa pelo varargs do printf)
    troca(lq, '''#else
    len = sprintf((char *)&pu_buf, "% .255Lf", value); // 256 character limit ([1].[255])
#endif''', '''#elif defined(QB64_WEB)
    len = qb_f80_formata_f((char *)&pu_buf, sizeof(pu_buf), value, 255, true);
#else
    len = sprintf((char *)&pu_buf, "% .255Lf", value); // 256 character limit ([1].[255])
#endif''')

    # arredondamento como o x87 (o ramo QB64_NOT_X86 usa nearbyint, que difere fora da faixa)
    troca(os.path.join(inc, 'rounding.h'), '''#ifdef QB64_NOT_X86

#    include <cfenv>''', '''#if defined(QB64_WEB)

// como o ramo x86 abaixo: FLD + FISTP (ao par; fora da faixa, o inteiro indefinido 0x80...0)
static inline int64_t qbr(qb_f80 f) {
    int temp = 0;
    if (f > qb_f80::bits(0x403D, 0xFFFFFFFFFFFFFFFEULL)) { // 9223372036854775807.0L
        temp = 1;
        f = f - qb_f80::dois63();
    }
    int64_t i = extF80_to_i64(f.sf(), softfloat_round_near_even, false);
    if (temp)
        return i | 0x8000000000000000;
    return i;
}

static inline uint64_t qbr_longdouble_to_uint64(qb_f80 f) { return (uint64_t)extF80_to_i64(f.sf(), softfloat_round_near_even, false); }

static inline int32_t qbr_float_to_long(float f) { return extF80_to_i32(qb_f80(f).sf(), softfloat_round_near_even, false); }

static inline int32_t qbr_double_to_long(double f) { return extF80_to_i32(qb_f80(f).sf(), softfloat_round_near_even, false); }

static inline void fpu_reinit() {}

#elif defined(QB64_NOT_X86)

#    include <cfenv>''')

    # Sleep: tique da camada web
    troca(os.path.join(src, 'datetime.cpp'), '''#ifndef QB64_WINDOWS
void Sleep(uint32_t milliseconds) {''', '''#if defined(QB64_WEB)
void Sleep(uint32_t milliseconds) {
    qbweb_sleep(milliseconds);
}
#elif !defined(QB64_WINDOWS)
void Sleep(uint32_t milliseconds) {''')

    # erro de execucao: avisa o JavaScript (log do executor; o programa segue com o ON ERROR)
    troca(os.path.join(src, 'error_handle.cpp'), '''void error(int32_t error_number) {''', '''void error(int32_t error_number) {
#ifdef QB64_WEB
    qbweb_erro(error_number, (int)ercl);
#endif''')

    # gravacao direto no arquivo, como o WriteFile do Windows (GFS_WINDOWS): sem isso o fstream
    # guarda bytes no buffer, e o que o programa ja gravou some se ele for interrompido (aba fechada,
    # limite do roteiro) ou nao aparece no LOF/FILES enquanto o arquivo esta aberto
    troca(os.path.join(src, 'gfs.cpp'), '''    f->file_handle->clear();
    f->file_handle->write((char *)data, size);
    if (f->file_handle->bad()) {
        return -7; // assume: permission denied
    }
    f->pos += size;''', '''    f->file_handle->clear();
    f->file_handle->write((char *)data, size);
#ifdef QB64_WEB
    f->file_handle->flush();
#endif
    if (f->file_handle->bad()) {
        return -7; // assume: permission denied
    }
    f->pos += size;''')

    # lacos de espera (TIMER, INKEY$) cedem ao navegador de tempos em tempos
    troca(os.path.join(src, 'datetime.cpp'), '''double func_timer(double accuracy, int32_t passed) {
    if (new_error)
        return 0;''', '''double func_timer(double accuracy, int32_t passed) {
#ifdef QB64_WEB
    qbweb_cede();
#endif
    if (new_error)
        return 0;''')
    troca(os.path.join(src, 'keyboard.cpp'), '''qbs *qbs_inkey() {
    if (is_error_pending())''', '''qbs *qbs_inkey() {
#ifdef QB64_WEB
    qbweb_cede();
#endif
    if (is_error_pending())''')

    # main(): sem threads
    troca(lq, '''    libqb_glut_presetup();

    struct libqb_thread *qbmain = libqb_thread_new();''', '''    libqb_glut_presetup();

#ifdef QB64_WEB
    // o programa roda nesta mesma chamada; o Sleep (qbweb_sleep) devolve o controle ao navegador
    qbweb_inicio();
    QBMAIN(NULL);
    qbweb_fim_programa(0);
    return 0;
#endif

    struct libqb_thread *qbmain = libqb_thread_new();''')

    # display(): desenha mesmo com $SCREENHIDE
    troca(lq, '''    if (screen_hide) {
        display_called = 1;
        return;
    }

    if (lock_display == 0) {''', '''#ifndef QB64_WEB
    if (screen_hide) {
        display_called = 1;
        return;
    }
#endif

    if (lock_display == 0) {''')

    # tique da camada web: precisa das variaveis internas do libqb.cpp
    acrescenta(lq, '\n#ifdef QB64_WEB\n#include "libqb_web.inc"\n#endif\n')

    # SHELL -> JavaScript
    sh = os.path.join(src, 'shell.cpp')
    for nome, espera in (('sub_shell', 1), ('sub_shell2', 1), ('sub_shell3', 0), ('sub_shell4', 0)):
        troca(sh, 'void %s(qbs *str, int32_t passed) {' % nome,
              'void %s(qbs *str, int32_t passed) {\n#ifdef QB64_WEB\n    qbweb_shell(str, passed, %d);\n    return;\n#endif' % (nome, espera))
    for nome in ('func_shell', 'func__shellhide'):
        troca(sh, 'int64_t %s(qbs *str) {' % nome, 'int64_t %s(qbs *str) {\n#ifdef QB64_WEB\n    return qbweb_shell(str, 1, 1);\n#endif' % nome)

    # caminhos: maiusculas dentro do drive /C (o DOS e o Windows nao diferenciam)
    fp = os.path.join(src, 'filepath.cpp')
    troca(fp, '''#else
        if (path[i] == '\\\\')
            path[i] = '/';
#endif
    }

    return path;''', '''#else
        if (path[i] == '\\\\')
            path[i] = '/';
#endif
    }
#ifdef QB64_WEB
    qbweb_caminho_dos(path, len);
#endif

    return path;''')
    troca(fp, '''#else
        if (path->chr[i] == '\\\\')
            path->chr[i] = '/';
#endif
    }
''', '''#else
        if (path->chr[i] == '\\\\')
            path->chr[i] = '/';
#endif
    }
#ifdef QB64_WEB
    qbweb_caminho_dos(reinterpret_cast<char *>(path->chr), path->len);
#endif
''')
    troca(fp, '''#else
        return c == '\\\\' ? '/' : c;
#endif
    });
''', '''#else
        return c == '\\\\' ? '/' : c;
#endif
    });
#ifdef QB64_WEB
    qbweb_caminho_dos(path.data(), path.size());
#endif
''')
    print('libqb web em', saida)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    main(sys.argv[1], sys.argv[2])
