#!/usr/bin/env node
// sonda_navegador.cjs - roda uma sonda do build web (web/tests/sondas, .BAS sem RT45) no Chrome
// headless, na pagina de verdade, e mostra o arquivo que ela grava em C:.
// Uso: node sonda_navegador.cjs <pasta do site> <EXE> <arquivo gravado em C:>
'use strict';
const fs = require('fs');
const { chromium } = require('playwright-core');
const { serve, chrome } = require('./comum.cjs');
const [dist, exe, arq] = process.argv.slice(2);
serve(dist).then(async (s) => {
    const nav = await chromium.launch({ executablePath: chrome(), headless: true });
    try {
        const p = await nav.newPage();
        await p.goto('http://127.0.0.1:' + s.address().port + '/index.html?teste=1');
        const c = '/C/' + arq.toUpperCase();
        const r = await p.evaluate((o) => window.V1_TESTE(o), { prog: exe, args: [], arquivos: [{ caminho: '/C', pasta: true }], devolve: [c] });
        const a = r.saida.find((x) => x.caminho === c);
        console.log(a ? Buffer.from(a.b64, 'base64').toString('latin1') : 'sem ' + arq);
        console.log('(' + (r.ms / 1000).toFixed(1) + ' s na pagina)');
    } finally {
        await nav.close();
        s.close();
    }
});
