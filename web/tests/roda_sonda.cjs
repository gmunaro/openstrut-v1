#!/usr/bin/env node
// roda_sonda.cjs - roda uma sonda (.BAS sem RT45) do build web no Node e mostra o arquivo que ela grava.
// Uso: node [--experimental-wasm-jspi] roda_sonda.cjs <pasta dos .js/.wasm> <EXE> <arquivo gravado (em /C)>
'use strict';
const path = require('path');
const V1 = require('../site/v1-nucleo.js');
const [dist, exe, arq] = process.argv.slice(2);
V1.rodaCadeia(exe, [], {
    arquivos: [],
    carrega: async (e) => require(path.resolve(dist, e + '.js')),
    log: (t) => console.log(t),
}).then((r) => {
    const a = r.arquivos.find((x) => x.caminho === '/C/' + arq.toUpperCase());
    console.log(a ? Buffer.from(a.dados).toString('latin1') : 'sem ' + arq);
    process.exit(0);
});
