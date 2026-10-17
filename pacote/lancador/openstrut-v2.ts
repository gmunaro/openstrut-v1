// Abre a V2 do OpenStrut como um programa: serve a pasta www/ (build do Vite) em
// 127.0.0.1:41780 e abre Chrome, Edge ou Chromium em modo app, com perfil próprio
// (onde ficam o rascunho e as obras recentes). Fecha o servidor quando essa janela
// fecha. Se o servidor já estiver no ar (segundo clique no atalho), só abre outra
// janela. Sem nenhum desses navegadores, abre o navegador padrão e deixa o servidor
// no ar até o fim da sessão. A porta é fixa porque o rascunho fica preso à origem.
//
// Um só fonte para Windows, Linux e macOS (ver compilar.sh). Onde fica cada coisa:
// - www/: ao lado do executável ou, no .app do macOS, em Contents/Resources/www
// - perfil: ../dados-v2 em relação ao executável; no macOS,
//   ~/Library/Application Support/OpenStrut/dados-v2 (o .app não deve ser gravado)
import { closeSync, existsSync, openSync, readSync, realpathSync, statSync } from "node:fs";
import os from "node:os";
import path from "node:path";

const PORTA = 41780;
const ENDERECO = `http://127.0.0.1:${PORTA}/`;
const ASSINATURA = "__openstrut-v2";
const TITULO = "OpenStrut V2";
const sistema = process.platform;
const casa = os.homedir();
const pasta = path.dirname(process.execPath);
const www = [path.join(pasta, "www"), path.join(pasta, "..", "Resources", "www")].find((p) =>
  existsSync(path.join(p, "index.html")),
);
const perfilPadrao =
  sistema === "darwin"
    ? path.join(casa, "Library", "Application Support", "OpenStrut", "dados-v2")
    : path.join(pasta, "..", "dados-v2");

type Navegador = { comando: string[]; perfil: string };

// mostra o erro numa caixa de diálogo do sistema (ou no terminal, se não houver como)
function avisar(texto: string) {
  console.error(texto);
  try {
    if (sistema === "win32") {
      const msg = texto.replaceAll("'", "''");
      Bun.spawnSync([
        "powershell",
        "-NoProfile",
        "-Command",
        `Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('${msg}', '${TITULO}') | Out-Null`,
      ]);
    } else if (sistema === "darwin") {
      // o texto vai como argumento para não precisar escapar aspas no AppleScript
      Bun.spawnSync([
        "osascript",
        "-e",
        "on run argv",
        "-e",
        `display alert "${TITULO}" message (item 1 of argv)`,
        "-e",
        "end run",
        texto,
      ]);
    } else if (Bun.which("zenity")) {
      Bun.spawnSync(["zenity", "--error", "--no-markup", `--title=${TITULO}`, `--text=${texto}`]);
    } else if (Bun.which("notify-send")) {
      Bun.spawnSync(["notify-send", TITULO, texto]);
    }
  } catch {}
}

function acharNavegadorWindows(): Navegador | undefined {
  const pf = process.env["ProgramFiles"] ?? "C:\\Program Files";
  const pf86 = process.env["ProgramFiles(x86)"] ?? "C:\\Program Files (x86)";
  const local = process.env["LOCALAPPDATA"] ?? "";
  const exe = [
    path.join(pf86, "Microsoft", "Edge", "Application", "msedge.exe"),
    path.join(pf, "Microsoft", "Edge", "Application", "msedge.exe"),
    path.join(pf, "Google", "Chrome", "Application", "chrome.exe"),
    path.join(pf86, "Google", "Chrome", "Application", "chrome.exe"),
    path.join(local, "Google", "Chrome", "Application", "chrome.exe"),
  ].find((c) => existsSync(c));
  return exe ? { comando: [exe], perfil: perfilPadrao } : undefined;
}

function acharNavegadorMac(): Navegador | undefined {
  const apps = [
    ["Google Chrome.app", "Google Chrome"],
    ["Microsoft Edge.app", "Microsoft Edge"],
    ["Chromium.app", "Chromium"],
  ] as const;
  const exe = ["/Applications", path.join(casa, "Applications")]
    .flatMap((base) => apps.map(([app, bin]) => path.join(base, app, "Contents", "MacOS", bin)))
    .find((c) => existsSync(c));
  return exe ? { comando: [exe], perfil: perfilPadrao } : undefined;
}

// Chromium em snap só grava em ~/snap/<nome>/ (pastas ocultas de ~ são bloqueadas),
// então ele é tratado à parte. Pega também o atalho do Ubuntu (/usr/bin/chromium-browser),
// um script curto que só chama o snap.
function ehSnap(caminho: string) {
  const real = realpathSync(caminho);
  if (real.startsWith("/snap/") || path.basename(real) === "snap") return true;
  if (statSync(real).size > 64 * 1024) return false;
  const fd = openSync(real, "r");
  const inicio = Buffer.alloc(4096);
  const lidos = readSync(fd, inicio, 0, inicio.length, 0);
  closeSync(fd);
  const texto = inicio.toString("latin1", 0, lidos);
  return texto.startsWith("#!") && texto.includes("/snap/");
}

function acharNavegadorLinux(): Navegador | undefined {
  const candidatos = [
    ...["google-chrome", "google-chrome-stable", "chromium", "chromium-browser"].map((n) => Bun.which(n)),
    "/opt/google/chrome/chrome",
    "/usr/lib/chromium/chromium",
    ...["microsoft-edge", "microsoft-edge-stable"].map((n) => Bun.which(n)),
    "/opt/microsoft/msedge/msedge",
  ];
  for (const c of candidatos) {
    if (!c || !existsSync(c)) continue;
    try {
      if (ehSnap(c)) continue;
    } catch {
      continue;
    }
    return { comando: [c], perfil: perfilPadrao };
  }
  if (existsSync("/snap/bin/chromium")) {
    return {
      comando: ["/snap/bin/chromium"],
      perfil: path.join(casa, "snap", "chromium", "common", "openstrut-dados-v2"),
    };
  }
  // flatpak: o perfil fica na pasta do próprio app, que o sandbox deixa gravar
  if (Bun.which("flatpak")) {
    for (const id of ["com.google.Chrome", "org.chromium.Chromium", "com.microsoft.Edge"]) {
      const info = Bun.spawnSync(["flatpak", "info", id], { stdout: "ignore", stderr: "ignore" });
      if (info.exitCode === 0) {
        return {
          comando: ["flatpak", "run", id],
          perfil: path.join(casa, ".var", "app", id, "data", "openstrut-dados-v2"),
        };
      }
    }
  }
  return undefined;
}

function acharNavegador() {
  if (sistema === "win32") return acharNavegadorWindows();
  if (sistema === "darwin") return acharNavegadorMac();
  return acharNavegadorLinux();
}

// comando que abre uma URL no navegador padrão, se o sistema tiver um
function abridorPadrao() {
  if (sistema === "win32") return "explorer.exe";
  if (sistema === "darwin") return "open";
  return Bun.which("xdg-open") ?? undefined;
}

// arquivo de www/ para o caminho pedido; o que não existe cai no index.html (rotas do app)
function arquivoDe(raiz: string, pathname: string) {
  try {
    const alvo = path.join(raiz, decodeURIComponent(pathname));
    if (alvo.startsWith(raiz + path.sep) && existsSync(alvo) && statSync(alvo).isFile()) return alvo;
  } catch {}
  return path.join(raiz, "index.html");
}

function iniciarServidor(raiz: string) {
  try {
    return Bun.serve({
      hostname: "127.0.0.1",
      port: PORTA,
      fetch(req) {
        const { pathname } = new URL(req.url);
        if (pathname === `/${ASSINATURA}`) return new Response("ok");
        return new Response(Bun.file(arquivoDe(raiz, pathname)), {
          headers: { "Cache-Control": "no-cache" },
        });
      },
    });
  } catch {
    return undefined;
  }
}

if (!www) {
  avisar(`Arquivos da V2 não encontrados em ${path.join(pasta, "www")}. Reinstale o OpenStrut.`);
  process.exit(1);
}

const servidor = iniciarServidor(www);
if (!servidor) {
  const jaNoAr = await fetch(ENDERECO + ASSINATURA)
    .then((r) => r.ok)
    .catch(() => false);
  if (!jaNoAr) {
    avisar(`A porta ${PORTA} está ocupada por outro programa. Feche-o e abra a V2 de novo.`);
    process.exit(1);
  }
}

const navegador = acharNavegador();
if (navegador) {
  const janela = Bun.spawn(
    [
      ...navegador.comando,
      `--app=${ENDERECO}`,
      `--user-data-dir=${navegador.perfil}`,
      "--no-first-run",
      "--no-default-browser-check",
    ],
    { stdout: "ignore", stderr: "ignore" },
  );
  await janela.exited;
  servidor?.stop(true);
  process.exit(0);
}

// sem Chrome, Edge nem Chromium: abre o navegador padrão; como não dá para saber
// quando a aba fecha, o servidor fica no ar até o fim da sessão
const abridor = abridorPadrao();
if (abridor) {
  Bun.spawn([abridor, ENDERECO], { stdout: "ignore", stderr: "ignore" });
} else {
  avisar(`Nenhum navegador encontrado. Abra ${ENDERECO} no seu navegador.`);
}
if (!servidor) process.exit(0);
console.error(`OpenStrut V2 no ar em ${ENDERECO}`);
