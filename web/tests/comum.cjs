// comum.cjs - pecas dos executores de teste da V1 web (Node e Chrome headless).
'use strict';
const fs = require('fs');
const http = require('http');
const path = require('path');

const TIPOS = { '.html': 'text/html', '.js': 'text/javascript', '.wasm': 'application/wasm', '.json': 'application/json', '.css': 'text/css' };

// subpasta do site, como no GitHub Pages do repositorio (https://gmunaro.github.io/openstrut-v1/):
// o que a pagina pedir fora dela da 404, e um caminho absoluto no site aparece no teste
const BASE = ('/' + (process.env.V1_BASE || '/openstrut-v1/') + '/').replace(/\/+/g, '/');

// servidor estatico so deste processo (porta livre qualquer em 127.0.0.1), com o site em BASE;
// s.url e o endereco do site (termina em /). Feche com .close()
function serve(pasta) {
    const base = path.resolve(pasta);
    return new Promise((ok) => {
        const s = http.createServer((req, res) => {
            let u;
            try {
                u = decodeURIComponent(new URL(req.url, 'http://x').pathname);
            } catch {
                res.writeHead(400);
                return res.end();
            }
            const dentro = u.startsWith(BASE) ? u.substring(BASE.length) : null;
            const f = dentro === null ? '' : path.join(base, dentro === '' ? 'index.html' : dentro);
            if (dentro === null || !f.startsWith(base + path.sep) || !fs.existsSync(f) || fs.statSync(f).isDirectory()) {
                res.writeHead(404);
                return res.end();
            }
            res.writeHead(200, { 'Content-Type': TIPOS[path.extname(f)] || 'application/octet-stream' });
            fs.createReadStream(f).pipe(res);
        });
        s.listen(0, '127.0.0.1', () => {
            s.url = 'http://127.0.0.1:' + s.address().port + BASE;
            ok(s);
        });
    });
}

// Chrome: CHROME, o do Windows, ou o Chromium do playwright (undefined)
function chrome() {
    if (process.env.CHROME) return process.env.CHROME;
    for (const c of ['C:/Program Files/Google/Chrome/Application/chrome.exe', '/usr/bin/google-chrome', '/usr/bin/chromium'])
        if (fs.existsSync(c)) return c;
    return undefined;
}

// pasta do host -> arquivos do drive /C (nomes em maiusculas, como o DOS), dados em base64
function entradaC(host) {
    const lista = [{ caminho: '/C', pasta: true }];
    (function sobe(h, dest) {
        for (const n of fs.readdirSync(h)) {
            const ph = path.join(h, n), d = dest + '/' + n.toUpperCase();
            if (fs.statSync(ph).isDirectory()) {
                lista.push({ caminho: d, pasta: true });
                sobe(ph, d);
            } else lista.push({ caminho: d, b64: fs.readFileSync(ph).toString('base64') });
        }
    })(host, '/C');
    return lista;
}

// grava /SAIDA/* em <saida> e, se driveC, troca o conteudo de driveC pelo /C final
function gravaSaida(lista, saida, driveC) {
    const dados = (a) => (a.dados ? Buffer.from(a.dados) : Buffer.from(a.b64, 'base64'));
    if (driveC && lista.some((a) => a.caminho === '/C')) {
        for (const n of fs.readdirSync(driveC)) fs.rmSync(path.join(driveC, n), { recursive: true, force: true });
    }
    for (const a of lista) {
        let dest = null;
        if (a.caminho.startsWith('/SAIDA/')) dest = path.join(saida, a.caminho.substring(7));
        else if (driveC && a.caminho.startsWith('/C/')) dest = path.join(driveC, a.caminho.substring(3));
        if (!dest) continue;
        if (a.pasta) fs.mkdirSync(dest, { recursive: true });
        else {
            fs.mkdirSync(path.dirname(dest), { recursive: true });
            fs.writeFileSync(dest, dados(a));
        }
    }
}

module.exports = { serve, chrome, entradaC, gravaSaida };
