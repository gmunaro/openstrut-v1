#!/usr/bin/env node
// roda_node.cjs - roda um programa da V1 web (wasm) no Node com um roteiro, como o
// tools/roda_retrad.sh roda o EXE nativo: mesma semente (tela do gerenciador), mesmo relogio fixo,
// mesma saida (telas/, impressora.prn, log.txt) para o tools/compara_retrad.py.
// Uso: node [--experimental-wasm-jspi] roda_node.cjs <pasta dos .js/.wasm> <EXE inicial> <roteiro> <pasta de saida> <pasta "C:"> [limite s] [--grava-c]
//   --grava-c: o drive C: final volta para <pasta "C:">; sem ela, vai para <saida>/c_final
'use strict';
const fs = require('fs');
const path = require('path');
const { execFileSync } = require('child_process');
const V1 = require('../site/v1-nucleo.js');
const { entradaC, gravaSaida } = require('./comum.cjs');

const args = process.argv.slice(2).filter((a) => !a.startsWith('--'));
const gravaC = process.argv.includes('--grava-c');
const [dist, exe0, roteiro, saida, driveC, limite] = args;
if (!driveC) {
    console.error('uso: node roda_node.cjs <dist> <EXE> <roteiro> <saida> <pasta C:> [limite s] [--grava-c]');
    process.exit(2);
}
const lim = Number(limite || 300);
const raiz = path.resolve(__dirname, '../..');

fs.rmSync(saida, { recursive: true, force: true });
fs.mkdirSync(saida, { recursive: true });
const py = process.platform === 'win32' ? 'python' : 'python3';
execFileSync(py, ['-I', path.join(raiz, 'tools/troca_semente.py'), path.join(saida, 'semente.chn'), '--modulo', exe0, '--marca', process.env.V1_MARCA || 'openstrut'], { stdio: 'ignore' });

const de64 = (a) => (a.pasta ? a : { caminho: a.caminho, dados: new Uint8Array(Buffer.from(a.b64, 'base64')) });
const arquivos = entradaC(driveC).map(de64);
arquivos.push({ caminho: '/SAIDA/semente.chn', dados: new Uint8Array(fs.readFileSync(path.join(saida, 'semente.chn'))) });
arquivos.push({ caminho: '/SAIDA/roteiro.txt', dados: new Uint8Array(fs.readFileSync(roteiro)) });

const env = {
    SISTRUT_ROTEIRO: '/SAIDA/roteiro.txt',
    SISTRUT_SAIDA: '/SAIDA',
    SISTRUT_LOG: '/SAIDA/log.txt',
    SISTRUT_DATA: process.env.SISTRUT_DATA || '2026-10-14 12:00:00',
    SISTRUT_RELOGIO: process.env.SISTRUT_RELOGIO || 'congelado',
};
for (const k of Object.keys(process.env)) {
    if (k.startsWith('SISTRUT_') && !(k in env) && k !== 'SISTRUT_C') env[k] = process.env[k];
    if (k.startsWith('QB64PE_')) env[k] = process.env[k]; // log da libqb (QB64PE_LOG_HANDLERS=console...)
}

// destino do drive C: final
function grava(lista) {
    if (gravaC) return gravaSaida(lista, saida, driveC);
    gravaSaida(lista.map((a) => (a.caminho.startsWith('/C/') ? Object.assign({}, a, { caminho: '/SAIDA/c_final/' + a.caminho.substring(3) }) : a)), saida, null);
}

const t0 = Date.now();
let moduloAtual = null;
const relogio = setTimeout(() => {
    console.error('roda_node: limite de ' + lim + ' s');
    try {
        grava(V1.exporta(moduloAtual.FS, ['/SAIDA', '/C']).concat([{ caminho: '/C', pasta: true }]));
    } catch (e) {}
    process.exit(3);
}, lim * 1000);

const lista = path.join(dist, 'modulos.json');
V1.rodaCadeia(exe0, ['/CHAIN:/SAIDA/semente.chn'], {
    arquivos,
    programas: fs.existsSync(lista) ? JSON.parse(fs.readFileSync(lista, 'utf8')) : undefined,
    env,
    cwd: '/C',
    carrega: async (exe) => require(path.resolve(dist, exe + '.js')),
    aoModulo: (m) => (moduloAtual = m),
    log: (t) => process.env.V1_VERBOSO && console.log(t),
    aoFimModulo: (exe, c) => console.log('modulo ' + exe + ' terminou (' + c + ') em ' + ((Date.now() - t0) / 1000).toFixed(1) + ' s'),
}).then((r) => {
    clearTimeout(relogio);
    grava(r.arquivos);
    console.log('saida: ' + saida + ' (' + r.programas.join(' -> ') + ', ' + ((Date.now() - t0) / 1000).toFixed(1) + ' s)');
    process.exit(0);
});
