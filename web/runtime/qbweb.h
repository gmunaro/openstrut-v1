// qbweb.h - camada web da libqb (build Emscripten). Implementacao em libqb_web.inc.
//
// O programa QB64 roda numa so chamada (main -> QBMAIN), sem as threads do QB64. Ele devolve o
// controle ao navegador em qbweb_sleep (o Sleep da libqb) e em qbweb_cede (consultas ao teclado e
// ao relogio, para um laco de espera nao travar a pagina), pelo Asyncify do Emscripten.
#pragma once

#include <stddef.h>
#include <stdint.h>

struct qbs;

// chamado no lugar do Sleep(ms) da libqb: faz o trabalho do MAIN_LOOP e cede ao navegador
void qbweb_sleep(uint32_t ms);
// cede ao navegador se passou tempo desde a ultima vez (laco que consulta teclado ou relogio)
void qbweb_cede();
// antes do QBMAIN
void qbweb_inicio();
// o programa terminou (SYSTEM, END, fim do QBMAIN)
void qbweb_fim_programa(int codigo);
// SHELL: passa o comando ao JavaScript (CHAIN/RUN do RT45). espera = 0 para _DONTWAIT
int64_t qbweb_shell(qbs *cmd, int32_t passed, int espera);
// caminho ja com "/": dentro do drive emulado (/C/...) passa para maiusculas, como o DOS
void qbweb_caminho_dos(char *p, size_t n);

// error() da libqb: avisa o JavaScript (Module.qbwebErro)
void qbweb_erro(int numero, int linha);

// modificadores do teclado (GLFW_MOD_*) do ultimo evento vindo do JavaScript
extern int qbweb_mods;
