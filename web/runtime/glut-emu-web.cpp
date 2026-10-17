// glut-emu-web.cpp - o GLUTEmu da libqb (glut-emu.h) no navegador, no lugar do glut-emu.cpp (GLFW).
// Nao ha janela nem OpenGL: a tela sai pelo quadro de software (libqb_web.inc) e o teclado entra
// por qbweb_tecla/qbweb_caractere. Estas funcoes so guardam o estado que a libqb consulta.
#include "libqb-common.h"

#include "glut-emu.h"
#include "qbweb.h"
#include <emscripten.h>

int qbweb_mods = 0;

static std::string s_titulo;
static int s_w = 640, s_h = 400;

std::tuple<int, int, int> GLUTEmu_ScreenGetMode() { return {1024, 768, 60}; }
template <typename T> void GLUTEmu_WindowSetHint(GLUTEmu_WindowHint, const T) {}
template void GLUTEmu_WindowSetHint<bool>(GLUTEmu_WindowHint, bool);
template void GLUTEmu_WindowSetHint<int>(GLUTEmu_WindowHint, int);
template void GLUTEmu_WindowSetHint<char *>(GLUTEmu_WindowHint, char *);
template void GLUTEmu_WindowSetHint<const char *>(GLUTEmu_WindowHint, const char *);
template void GLUTEmu_WindowSetHint<GLUTEmu_WindowHintValue>(GLUTEmu_WindowHint, GLUTEmu_WindowHintValue);
bool GLUTEmu_WindowCreate(int width, int height) {
    s_w = width;
    s_h = height;
    return true;
}
bool GLUTEmu_WindowIsCreated() { return true; }
void GLUTEmu_WindowSetTitle(std::string_view title) { s_titulo = std::string(title); }
std::string GLUTEmu_WindowGetTitle() { return s_titulo; }
void GLUTEmu_WindowSetIcon(int32_t, int32_t) {}
void GLUTEmu_WindowFullScreen(bool) {}
bool GLUTEmu_WindowIsFullscreen() { return false; }
void GLUTEmu_WindowMaximize() {}
bool GLUTEmu_WindowIsMaximized() { return false; }
void GLUTEmu_WindowMinimize() {}
bool GLUTEmu_WindowIsMinimized() { return false; }
void GLUTEmu_WindowRestore() {}
bool GLUTEmu_WindowIsRestored() { return true; }
void GLUTEmu_WindowHide(bool) {}
bool GLUTEmu_WindowIsHidden() { return false; }
void GLUTEmu_WindowFocus() {}
bool GLUTEmu_WindowIsFocused() { return true; }
void GLUTEmu_WindowSetFloating(bool) {}
bool GLUTEmu_WindowIsFloating() { return false; }
void GLUTEmu_WindowSetOpacity(float) {}
float GLUTEmu_WindowGetOpacity() { return 1.0f; }
void GLUTEmu_WindowSetBordered(bool) {}
bool GLUTEmu_WindowIsBordered() { return true; }
void GLUTEmu_WindowSetMousePassthrough(bool) {}
bool GLUTEmu_WindowAllowsMousePassthrough() { return false; }
void GLUTEmu_WindowResize(int width, int height) {
    s_w = width;
    s_h = height;
}
std::pair<int, int> GLUTEmu_WindowGetSize() { return {s_w, s_h}; }
std::pair<int, int> GLUTEmu_WindowGetFramebufferSize() { return {s_w, s_h}; }
void GLUTEmu_WindowMove(int, int) {}
std::pair<int, int> GLUTEmu_WindowGetPosition() { return {0, 0}; }
void GLUTEmu_WindowCenter() {}
void GLUTEmu_WindowSetAspectRatio(int, int) {}
void GLUTEmu_WindowSetSizeLimits(int, int, int, int) {}
void GLUTEmu_WindowSetMinimumSizeLimits(int, int) {}
void GLUTEmu_WindowSetMaximumSizeLimits(int, int) {}
void GLUTEmu_WindowSetShouldClose(bool) {}
void GLUTEmu_WindowSwapBuffers() {}
void GLUTEmu_WindowRefresh() {}
const void *GLUTEmu_WindowGetNativeHandle(int32_t) { return nullptr; }
void GLUTEmu_WindowSetCloseFunction(GLUTEmu_CallbackWindowClose) {}
void GLUTEmu_WindowSetResizedFunction(GLUTEmu_CallbackWindowResized) {}
void GLUTEmu_WindowSetFramebufferResizedFunction(GLUTEmu_CallbackWindowFramebufferResized) {}
void GLUTEmu_WindowSetMaximizedFunction(GLUTEmu_CallbackWindowMaximized) {}
void GLUTEmu_WindowSetMinimizedFunction(GLUTEmu_CallbackWindowMinimized) {}
void GLUTEmu_WindowSetFocusedFunction(GLUTEmu_CallbackWindowFocused) {}
void GLUTEmu_WindowSetRefreshFunction(GLUTEmu_CallbackWindowRefresh) {}
void GLUTEmu_WindowSetIdleFunction(GLUTEmu_CallbackWindowIdle) {}
void GLUTEmu_SystemSetPollFunction(GLUTEmu_CallbackSystemPoll) {}
void GLUTEmu_KeyboardSetButtonFunction(GLUTEmu_CallbackKeyboardButton) {}
void GLUTEmu_KeyboardSetCharacterFunction(GLUTEmu_CallbackKeyboardCharacter) {}
bool GLUTEmu_KeyboardIsKeyModifierSet(GLUTEmu_KeyboardKeyModifier modifier) { return (qbweb_mods & (int)modifier) != 0; }
bool GLUTEmu_KeyboardToggleLockKeyState(GLUTEmu_KeyboardKeyModifier) { return false; }
const char *GLUTEmu_KeyboardGetKeyName(GLUTEmu_KeyboardKey, int) { return nullptr; }
bool GLUTEmu_MouseSetStandardCursor(GLUTEmu_MouseStandardCursor) { return true; }
bool GLUTEmu_MouseSetCustomCursor(int32_t, int, int) { return false; }
void GLUTEmu_MouseSetCursorMode(GLUTEnum_MouseCursorMode) {}
GLUTEnum_MouseCursorMode GLUTEmu_MouseGetCursorMode() { return GLUTEnum_MouseCursorMode::Normal; }
void GLUTEmu_MouseMove(double, double) {}
void GLUTEmu_MouseSetPositionFunction(GLUTEmu_CallbackMousePosition) {}
void GLUTEmu_MouseSetButtonFunction(GLUTEmu_CallbackMouseButton) {}
void GLUTEmu_MouseSetNotifyFunction(GLUTEmu_CallbackMouseNotify) {}
void GLUTEmu_MouseSetScrollFunction(GLUTEmu_CallbackMouseScroll) {}
void GLUTEmu_DropSetFilesFunction(GLUTEmu_CallbackDropFiles) {}
void GLUTEmu_MainLoop() {}
double GLUTEmu_TimeGet() { return emscripten_get_now() / 1000.0; }
void GLUTEmu_TimeSet(double) {}
void GLUTEmu_ProgramExit(int exitCode) { qbweb_fim_programa(exitCode); }
