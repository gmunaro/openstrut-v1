// main-thread-web.cpp - no lugar do main-thread-gui.cpp: sem thread do GLUT. O programa roda na
// chamada do main() (prepara_libqb.py) e a "janela" esta sempre pronta.
#include "libqb-common.h"

#include "main-thread.h"
#include "qbweb.h"

void libqb_glut_presetup() {}
void libqb_start_main_thread() {}
void libqb_start_glut_thread() {}
bool libqb_is_glut_up() { return true; }
bool libqb_is_glut_thread() { return true; }
void libqb_exit(int exitcode) { qbweb_fim_programa(exitcode); }
