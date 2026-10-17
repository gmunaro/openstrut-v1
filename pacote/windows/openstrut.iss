; Instalador único do OpenStrut V1 e V2 para Windows (Inno Setup 6). Compilado
; por windows/empacotar.sh, que passa Versao, Pacote (a árvore montada), Saida e
; Icones. Instala por usuário, sem administrador, em
; %LOCALAPPDATA%\Programs\OpenStrut. Reinstalar atualiza os programas e mantém
; as obras da V1, os .INI já existentes e os dados da V2 (dados-v2).

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

[Setup]
AppId={{B1C792BF-0155-4FAE-9E55-3567E01CB0FD}
AppName=OpenStrut
AppVerName=OpenStrut V1 e V2 ({#Versao})
AppVersion={#Versao}
AppPublisher=gmunaro
DefaultDirName={autopf}\OpenStrut
DefaultGroupName=OpenStrut
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0.17763
OutputDir={#Saida}
OutputBaseFilename=OpenStrut-Setup-windows-x64
SetupIconFile={#Icones}\openstrut-v1.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName=OpenStrut V1 e V2
UninstallDisplayIcon={app}\icones\openstrut-v1.ico

[Languages]
Name: "ptbr"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalhos na área de trabalho"; GroupDescription: "Atalhos:"

[InstallDelete]
; assets da V2 têm hash no nome; sem isso os de versões antigas se acumulam
Type: filesandordirs; Name: "{app}\V2\www"

[Files]
Source: "{#Pacote}\V1\*.exe"; DestDir: "{app}\V1"; Flags: ignoreversion
Source: "{#Pacote}\V1\*"; Excludes: "*.exe"; DestDir: "{app}\V1"; Flags: onlyifdoesntexist
Source: "{#Pacote}\V2\*"; DestDir: "{app}\V2"; Flags: ignoreversion recursesubdirs
Source: "{#Pacote}\icones\*"; DestDir: "{app}\icones"; Flags: ignoreversion
Source: "{#Pacote}\LEIA-ME.txt"; DestDir: "{app}"; Flags: ignoreversion isreadme

[Icons]
Name: "{group}\OpenStrut V1"; Filename: "{app}\V1\OPENSTRUT.exe"; WorkingDir: "{app}\V1"; IconFilename: "{app}\icones\openstrut-v1.ico"; Comment: "Reconstrução do SISTRUT 4.0 (NB-1/78)"
Name: "{group}\OpenStrut V2"; Filename: "{app}\V2\OpenStrut-V2.exe"; WorkingDir: "{app}\V2"; IconFilename: "{app}\icones\openstrut-v2.ico"; Comment: "OpenStrut V2 (NBR 6118:2023 e NB-1/78)"
Name: "{group}\Pasta das obras da V1"; Filename: "{app}\V1"
Name: "{group}\Desinstalar OpenStrut"; Filename: "{uninstallexe}"
Name: "{autodesktop}\OpenStrut V1"; Filename: "{app}\V1\OPENSTRUT.exe"; WorkingDir: "{app}\V1"; IconFilename: "{app}\icones\openstrut-v1.ico"; Tasks: desktopicon
Name: "{autodesktop}\OpenStrut V2"; Filename: "{app}\V2\OpenStrut-V2.exe"; WorkingDir: "{app}\V2"; IconFilename: "{app}\icones\openstrut-v2.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\V2\OpenStrut-V2.exe"; Description: "Abrir o OpenStrut V2"; Flags: nowait postinstall skipifsilent unchecked
