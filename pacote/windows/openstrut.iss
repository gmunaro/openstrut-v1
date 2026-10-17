; Instalador do OpenStrut V1 para Windows (Inno Setup 6). Compilado por
; windows/empacotar.sh, que passa Versao, Pacote (a árvore montada), Saida, Icones e
; V2Url. Instala por usuário, sem administrador, em %LOCALAPPDATA%\Programs\OpenStrut.
; O atalho abre o lançador OPENSTRUT.exe, que monta a pasta C: do usuário
; (%USERPROFILE%\OpenStrut, com a instalação do original) e abre o gerenciador SISTRUT.
; As obras ficam nessa pasta: reinstalar ou desinstalar não mexe nela.
; A V2 é web (PWA): o instalador só cria um atalho para ela.

#ifndef Versao
  #define Versao "0.0.0"
#endif
#ifndef Pacote
  #define Pacote "..\saida\arvore-windows-x64\OpenStrut"
#endif
#ifndef Saida
  #define Saida "..\saida"
#endif
#ifndef Icones
  #define Icones "..\icones"
#endif
#ifndef V2Url
  #define V2Url "https://gmunaro.github.io/openstrut/"
#endif

[Setup]
AppId={{B1C792BF-0155-4FAE-9E55-3567E01CB0FD}
AppName=OpenStrut V1
AppVerName=OpenStrut V1 ({#Versao})
AppVersion={#Versao}
AppPublisher=gmunaro
AppPublisherURL=https://github.com/gmunaro/openstrut-v1
DefaultDirName={autopf}\OpenStrut
DefaultGroupName=OpenStrut
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0.17763
OutputDir={#Saida}
OutputBaseFilename=OpenStrut-V1-Setup-windows-x64
SetupIconFile={#Icones}\openstrut-v1.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName=OpenStrut V1
UninstallDisplayIcon={app}\openstrut-v1.ico

[Languages]
Name: "ptbr"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na área de trabalho"; GroupDescription: "Atalhos:"

[Dirs]
; a pasta C: do usuário (o lançador também a cria); fica depois de desinstalar
Name: "{%USERPROFILE}\OpenStrut"; Flags: uninsneveruninstall

[Files]
Source: "{#Pacote}\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Pacote}\sistrut-game\*"; DestDir: "{app}\sistrut-game"; Flags: ignoreversion
Source: "{#Pacote}\openstrut-v1.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Pacote}\LEIA-ME.txt"; DestDir: "{app}"; Flags: ignoreversion isreadme

[INI]
Filename: "{app}\OpenStrut V2 (web).url"; Section: "InternetShortcut"; Key: "URL"; String: "{#V2Url}"

[Icons]
Name: "{group}\OpenStrut V1"; Filename: "{app}\OPENSTRUT.exe"; WorkingDir: "{app}"; IconFilename: "{app}\openstrut-v1.ico"; Comment: "Retradução do SISTRUT 4.0 (NB-1/78)"
Name: "{group}\Pasta das obras (disco C do OpenStrut)"; Filename: "{%USERPROFILE}\OpenStrut"
Name: "{group}\OpenStrut V2 (web)"; Filename: "{app}\OpenStrut V2 (web).url"; Comment: "OpenStrut V2 no navegador (NBR 6118:2023 e NB-1/78)"
Name: "{group}\Desinstalar OpenStrut V1"; Filename: "{uninstallexe}"
Name: "{autodesktop}\OpenStrut V1"; Filename: "{app}\OPENSTRUT.exe"; WorkingDir: "{app}"; IconFilename: "{app}\openstrut-v1.ico"; Tasks: desktopicon

[UninstallDelete]
Type: files; Name: "{app}\OpenStrut V2 (web).url"

[Run]
Filename: "{app}\OPENSTRUT.exe"; WorkingDir: "{app}"; Description: "Abrir o OpenStrut V1"; Flags: nowait postinstall skipifsilent
