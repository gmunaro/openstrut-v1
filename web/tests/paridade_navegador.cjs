#!/usr/bin/env node
// paridade_navegador.cjs - roda um programa da V1 web no Chrome headless (a pagina de verdade,
// web/site) com um roteiro, como o roda_node.cjs no Node e o tools/roda_retrad.sh no nativo.
// A saida (telas/, impressora.prn, log.txt) sai no formato do oraculo para o tools/compara_retrad.py.
// Uso: node paridade_navegador.cjs <pasta do site (web/dist)> <EXE> <roteiro> <pasta de saida> <pasta "C:"> [limite s] [--grava-c]
//   --grava-c: o drive C: final volta para <pasta "C:"> (como o EXE nativo grava nela)
//   Estourado o limite, grava o que o programa ja escreveu e sai com 3 (como o roda_retrad.sh).
// CHROME = executavel do Chrome/Chromium (padrao: o do Windows, ou o Chromium do playwright).
'use strict';
const fs = require('fs');
const path = require('path');
const { execFileSync } = require('child_process');
const { chromium } = require('playwright-core');
const { serve, chrome, entradaC, gravaSaida } = require('./comum.cjs');

const args = process.argv.slice(2).filter((a) => !a.startsWith('--'));
const gravaC = process.argv.includes('--grava-c');
const [dist, exe0, roteiro, saida, driveC, limite] = args;
if (!driveC) {
    console.error('uso: node paridade_navegador.cjs <dist> <EXE> <roteiro> <saida> <pasta C:> [limite s] [--grava-c]');
    process.exit(2);
}
const lim = Number(limite || 300) * 1000;
const raiz = path.resolve(__dirname, '../..');

(async () => {
    fs.rmSync(saida, { recursive: true, force: true });
    fs.mkdirSync(saida, { recursive: true });
    const py = process.platform === 'win32' ? 'python' : 'python3';
    execFileSync(py, ['-I', path.join(raiz, 'tools/troca_semente.py'), path.join(saida, 'semente.chn'), '--modulo', exe0, '--marca', process.env.V1_MARCA || 'openstrut'], { stdio: 'ignore' });
    const arquivos = entradaC(driveC);
    arquivos.push({ caminho: '/SAIDA/semente.chn', b64: fs.readFileSync(path.join(saida, 'semente.chn')).toString('base64') });
    arquivos.push({ caminho: '/SAIDA/roteiro.txt', b64: fs.readFileSync(roteiro).toString('base64') });
    const env = {
        SISTRUT_ROTEIRO: '/SAIDA/roteiro.txt',
        SISTRUT_SAIDA: '/SAIDA',
        SISTRUT_LOG: '/SAIDA/log.txt',
        SISTRUT_DATA: process.env.SISTRUT_DATA || '2026-10-14 12:00:00',
        SISTRUT_RELOGIO: process.env.SISTRUT_RELOGIO || 'congelado',
    };
    for (const k of Object.keys(process.env)) if (k.startsWith('SISTRUT_') && !(k in env) && k !== 'SISTRUT_C') env[k] = process.env[k];

    const servidor = await serve(path.resolve(dist));
    const navegador = await chromium.launch({ executablePath: chrome(), headless: true });
    let codigo = 0;
    try {
        const pagina = await navegador.newPage();
        pagina.on('pageerror', (e) => console.error('pagina: ' + e.message));
        if (process.env.V1_VERBOSO) pagina.on('console', (m) => console.log(m.text()));
        await pagina.goto(servidor.url + 'index.html?teste=1');
        const tempo = new Promise((ok) => setTimeout(() => ok(null), lim));
        const r = await Promise.race([
            pagina.evaluate((o) => window.V1_TESTE(o), { prog: exe0, args: ['/CHAIN:/SAIDA/semente.chn'], arquivos, env, devolveC: gravaC }),
            tempo,
        ]);
        let lista;
        if (r) {
            lista = r.saida;
            console.log('saida: ' + saida + ' (' + r.programas.join(' -> ') + ', ' + (r.ms / 1000).toFixed(1) + ' s no navegador)');
        } else {
            console.error('paridade_navegador: limite de ' + lim / 1000 + ' s');
            lista = (await pagina.evaluate(() => window.V1_PARCIAL())).saida;
            codigo = 3;
        }
        gravaSaida(lista, saida, gravaC ? driveC : null);
    } finally {
        await navegador.close();
        servidor.close();
    }
    process.exit(codigo);
})().catch((e) => {
    console.error(e);
    process.exit(1);
});
