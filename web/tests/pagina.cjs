#!/usr/bin/env node
// pagina.cjs - teste da pagina no Chrome headless (o que o roteiro nao cobre): importar um arquivo,
// ele continuar la depois de recarregar (IndexedDB), exportar o .zip, ver a impressora e mandar
// tecla pelo teclado virtual. Uso: node web/tests/pagina.cjs <pasta do site>
'use strict';
const fs = require('fs');
const os = require('os');
const path = require('path');
const { chromium } = require('playwright-core');
const { serve, chrome } = require('./comum.cjs');

const dist = process.argv[2];
let falhas = 0;
const confere = (ok, msg) => {
    console.log((ok ? 'OK     ' : 'FALHOU ') + msg);
    if (!ok) falhas++;
};

serve(dist).then(async (s) => {
    const nav = await chromium.launch({ executablePath: chrome(), headless: true });
    const ctx = await nav.newContext({ acceptDownloads: true });
    const p = await ctx.newPage();
    const erros = [];
    p.on('pageerror', (e) => erros.push(e.message));
    const url = 'http://127.0.0.1:' + s.address().port + '/index.html';
    try {
        await p.goto(url);
        await p.waitForFunction(() => document.getElementById('estado').textContent === 'SISTRUT', null, { timeout: 60000 });
        confere(true, 'gerenciador carregado');

        // importar um arquivo na raiz do C:
        const tmp = path.join(os.tmpdir(), 'teste.laj');
        fs.writeFileSync(tmp, 'OBRA DE TESTE\r\n');
        await p.click('#botaoArquivos');
        await p.selectOption('#pastaDestino', '/C');
        await p.setInputFiles('#arquivoImportado', tmp);
        await p.waitForTimeout(500);
        const lista = await p.textContent('#listaArquivos');
        confere(lista.includes('C:\\TESTE.LAJ'), 'arquivo importado aparece como C:\\TESTE.LAJ');

        // exportar o .zip
        const [baixado] = await Promise.all([p.waitForEvent('download'), p.click('#exportar')]);
        const zip = fs.readFileSync(await baixado.path());
        confere(zip.includes(Buffer.from('TESTE.LAJ')) && zip.includes(Buffer.from('OBRA DE TESTE')), '.zip exportado tem o arquivo');
        await p.click('#painelArquivos .fechar');

        // continua la depois de recarregar (IndexedDB)
        await p.reload();
        await p.waitForFunction(() => document.getElementById('estado').textContent === 'SISTRUT', null, { timeout: 60000 });
        await p.click('#botaoArquivos');
        confere((await p.textContent('#listaArquivos')).includes('C:\\TESTE.LAJ'), 'arquivo continua depois de recarregar');
        await p.click('#painelArquivos .fechar');

        // teclado virtual: F1 (ajuda do gerenciador) muda a tela
        await p.click('#botaoTeclado');
        const antes = await p.evaluate(() => document.getElementById('tela').toDataURL());
        await p.click('#teclado button[data-k="F1"]');
        await p.waitForTimeout(1500);
        const depois = await p.evaluate(() => document.getElementById('tela').toDataURL());
        confere(antes !== depois, 'F1 do teclado virtual chega ao programa');

        // impressora
        await p.click('#botaoImpressao');
        confere((await p.textContent('#paginas')).includes('Nada foi impresso'), 'impressora vazia abre');
        confere(erros.length === 0, 'sem erro de JavaScript' + (erros.length ? ': ' + erros.join(' / ') : ''));
    } catch (e) {
        confere(false, String(e));
    } finally {
        await nav.close();
        s.close();
    }
    process.exit(falhas ? 1 : 0);
});
