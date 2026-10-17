#!/usr/bin/env node
// referencia.cjs - paridade da V1 web com o nativo no Chrome headless, para o CI: roda cada caso de
// web/tests/referencia/casos.json na pagina (paridade_navegador.cjs) e compara byte a byte com a
// saida do nativo guardada em web/tests/referencia/<caso>/ (gera_referencia.sh): telas em texto e
// atributo, impressora.prn e os arquivos que o programa gravou no drive C:.
// Uso: node web/tests/referencia.cjs <pasta do site> [caso ...]
'use strict';
const fs = require('fs');
const os = require('os');
const path = require('path');
const { execFileSync, spawnSync } = require('child_process');

const [dist, ...pedidos] = process.argv.slice(2);
const aqui = path.join(__dirname, 'referencia');
const py = process.platform === 'win32' ? 'python' : 'python3';
const casos = JSON.parse(fs.readFileSync(path.join(aqui, 'casos.json'), 'utf8')).filter((c) => !pedidos.length || pedidos.includes(c.nome));
const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'v1ref-'));

function lista(raiz, sub = '') {
    const r = [];
    const d = path.join(raiz, sub);
    if (!fs.existsSync(d)) return r;
    for (const n of fs.readdirSync(d)) {
        const rel = path.join(sub, n);
        if (fs.statSync(path.join(raiz, rel)).isDirectory()) r.push(...lista(raiz, rel));
        else r.push(rel);
    }
    return r;
}

let falhas = 0;
for (const c of casos) {
    const cdir = path.join(tmp, 'c_' + c.nome), ini = path.join(tmp, 'ini_' + c.nome), out = path.join(tmp, 'run_' + c.nome);
    const [exe, rot] = execFileSync(py, ['-I', path.join(aqui, 'monta_c.py'), c.nome, cdir]).toString().trim().split('\t');
    execFileSync(py, ['-I', path.join(aqui, 'monta_c.py'), c.nome, ini]);
    const t0 = Date.now();
    spawnSync(process.execPath, [path.join(__dirname, 'paridade_navegador.cjs'), dist, exe, rot, out, cdir, '300', '--grava-c'], { stdio: 'inherit' });
    const ref = path.join(aqui, c.nome);
    const dif = [];
    let n = 0;
    // telas e impressora
    for (const rel of lista(ref).filter((r) => !r.startsWith('c' + path.sep))) {
        n++;
        const b = path.join(out, rel);
        if (!fs.existsSync(b) || !fs.readFileSync(b).equals(fs.readFileSync(path.join(ref, rel)))) dif.push(rel);
    }
    for (const rel of lista(out, 'telas').filter((r) => !r.endsWith('.realce.txt') && !r.endsWith('.png')))
        if (!fs.existsSync(path.join(ref, rel))) dif.push(rel + ' (so na web)');
    if (fs.existsSync(path.join(out, 'impressora.prn')) && !fs.existsSync(path.join(ref, 'impressora.prn'))) dif.push('impressora.prn (so na web)');
    // drive C: o que o programa criou ou mudou
    const mudou = lista(cdir).filter((r) => !fs.existsSync(path.join(ini, r)) || !fs.readFileSync(path.join(ini, r)).equals(fs.readFileSync(path.join(cdir, r))));
    const refC = lista(path.join(ref, 'c')).map((r) => r.toUpperCase());
    for (const r of mudou) {
        n++;
        const rc = path.join(ref, 'c', r);
        const achado = lista(path.join(ref, 'c')).find((x) => x.toUpperCase() === r.toUpperCase());
        if (!achado || !fs.readFileSync(path.join(ref, 'c', achado)).equals(fs.readFileSync(path.join(cdir, r)))) dif.push('C:/' + r);
    }
    for (const r of refC) if (!mudou.some((m) => m.toUpperCase() === r)) dif.push('C:/' + r + ' (nao gravado pela web)');
    console.log((dif.length ? 'DIFERE ' : 'IGUAL  ') + c.nome + ': ' + (n - dif.length) + ' de ' + n + ' arquivos iguais ao nativo (' + ((Date.now() - t0) / 1000).toFixed(1) + ' s)');
    for (const d of dif.slice(0, 10)) console.log('    ' + d);
    if (dif.length) falhas++;
}
fs.rmSync(tmp, { recursive: true, force: true });
console.log(falhas ? falhas + ' caso(s) com diferenca' : 'todos os casos iguais ao nativo');
process.exit(falhas ? 1 : 0);
