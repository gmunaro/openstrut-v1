// v1-nucleo.js - nucleo da OpenStrut V1 no navegador e no Node: carrega o modulo wasm de um
// programa, monta o sistema de arquivos e segue a cadeia de CHAIN/RUN.
//
// Cada um dos 28 programas e um modulo wasm (<EXE>.js + <EXE>.wasm, fabrica global V1_<EXE>).
// O CHAIN/RUN do RT45 grava o arquivo de troca e faz SHELL _DONTWAIT "<pasta>/<EXE>.exe" /CHAIN:..;
// a libqb web passa o comando para qbwebShell, o programa termina (SYSTEM) e o nucleo abre o
// modulo seguinte com os arquivos do anterior (o MEMFS e de cada modulo: a copia leva tudo).
//
// Arvore de arquivos (igual em todos os modulos):
//   /C      o drive C: do DOS (SISTRUT_C); nomes em maiusculas (libqb_web.inc)
//   /EXE    um arquivo vazio <EXE>.exe por programa (o RT_ACHA_EXE$ procura o EXE ali)
//   /TMP    TEMP: arquivos de troca do CHAIN
//   /SAIDA  SISTRUT_SAIDA: telas do roteiro, log e a impressora (IMPRESSORA.PRN)
(function (raiz) {
    'use strict';

    const PROGRAMAS = ['SISTRUT', 'SISEDIT', 'LAJE', 'LAJEGEOM', 'LAJECALC', 'LAJEMONT', 'LAJEGRAV', 'LAJEPROC', 'VIGA', 'VPLOTA', 'ARMADURA', 'PILAR',
        'PILAREDI', 'PILGEEDI', 'PIPROEDI', 'PIGRAEDI', 'FORMA', 'FORMEDCA', 'FORMIMP', 'FORMINIT', 'FORMPLOT', 'DESENHO', 'DESDIM', 'DESEDCAO', 'DESEDITA',
        'DESGRAF', 'DESIMP', 'DESINIT'];
    const PASTAS = ['/C', '/EXE', '/TMP', '/SAIDA'];

    // lista de arquivos de um FS do Emscripten: [{caminho, dados (Uint8Array) | pasta: true}]
    function exporta(FS, pastas) {
        const lista = [];
        function anda(p) {
            let nomes;
            try {
                nomes = FS.readdir(p);
            } catch (e) {
                return;
            }
            for (const n of nomes) {
                if (n === '.' || n === '..') continue;
                const c = p + '/' + n;
                const st = FS.stat(c);
                if (FS.isDir(st.mode)) {
                    lista.push({ caminho: c, pasta: true });
                    anda(c);
                } else lista.push({ caminho: c, dados: FS.readFile(c) });
            }
        }
        for (const p of pastas) {
            lista.push({ caminho: p, pasta: true });
            anda(p);
        }
        return lista;
    }

    function importa(FS, lista) {
        for (const a of lista) {
            if (a.pasta) FS.mkdirTree(a.caminho);
            else {
                FS.mkdirTree(a.caminho.substring(0, a.caminho.lastIndexOf('/')) || '/');
                FS.writeFile(a.caminho, a.dados);
            }
        }
    }

    // SHELL do CHAIN/RUN: "<pasta>/<EXE>.exe" /CHAIN:"<troca>" -> {exe, args}
    function analisaShell(cmd) {
        const m = /^\s*"?([^"]*?)([^\/\\"]+)\.exe"?\s*(.*)$/i.exec(cmd);
        if (!m) return null;
        return { exe: m[2].toUpperCase(), args: m[3].trim() ? [m[3].trim()] : [] };
    }

    // Roda uma cadeia de programas.
    //   opcoes.carrega(exe) -> Promise da fabrica do modulo (V1_<EXE>)
    //   opcoes.programas    modulos que existem (modulos.json do site); padrao PROGRAMAS
    //   opcoes.arquivos     lista inicial de arquivos (exporta/importa) ou []
    //   opcoes.env          variaveis de ambiente extras (SISTRUT_ROTEIRO...)
    //   opcoes.cwd          pasta corrente inicial (padrao /C)
    //   opcoes.aoModulo(mod, exe)  modulo criado (canvas, teclado)
    //   opcoes.aoQuadro, opcoes.aoSom: tela e som (ver v1.js)
    //   opcoes.log(txt)
    // Devolve Promise({arquivos, codigo, programas}) quando a cadeia acaba.
    async function rodaCadeia(exe, args, opcoes) {
        let arquivos = opcoes.arquivos || [];
        const programas = [];
        let codigo = 0;
        const cwd0 = opcoes.cwd || '/C';
        const programas_ = opcoes.programas || PROGRAMAS;
        for (;;) {
            programas.push(exe);
            const fabrica = await opcoes.carrega(exe);
            let pendente = null;
            const r = await new Promise((resolve) => {
                let fim = false;
                const acaba = (c) => {
                    if (fim) return;
                    fim = true;
                    resolve(c);
                };
                const Module = {
                    thisProgram: '/EXE/' + exe + '.exe',
                    arguments: args,
                    noInitialRun: true,
                    print: (t) => opcoes.log && opcoes.log(exe + ': ' + t),
                    printErr: (t) => opcoes.log && opcoes.log(exe + '! ' + t),
                    qbwebQuadro: (p, w, h) => opcoes.aoQuadro && opcoes.aoQuadro(Module, p, w, h),
                    qbwebSom: (f, s) => opcoes.aoSom && opcoes.aoSom(f, s),
                    qbwebErro: (n, l) => opcoes.log && opcoes.log(exe + ': erro ' + n + ' (linha ' + l + ' do .BAS)'),
                    qbwebShell: (cmd, espera) => {
                        const s = analisaShell(cmd);
                        if (opcoes.log) opcoes.log(exe + ': SHELL ' + cmd);
                        if (s && programas_.includes(s.exe)) pendente = s;
                        return 0;
                    },
                    qbwebFim: (c) => {
                        try {
                            arquivos = exporta(Module.FS, PASTAS);
                        } catch (e) {
                            if (opcoes.log) opcoes.log('exporta: ' + e);
                        }
                    },
                    onExit: (c) => acaba(c),
                    quit: (c, e) => {
                        acaba(c);
                        throw e;
                    },
                    onAbort: (w) => {
                        if (opcoes.log) opcoes.log(exe + ': abort ' + w);
                        acaba(-1);
                    },
                    preRun: [
                        (M) => {
                            const FS = M.FS;
                            for (const p of PASTAS) FS.mkdirTree(p);
                            importa(FS, arquivos);
                            for (const p of programas_) {
                                const c = '/EXE/' + p + '.exe';
                                if (!FS.analyzePath(c).exists) FS.writeFile(c, new Uint8Array(0));
                            }
                            Object.assign(M.ENV, { SISTRUT_C: '/C', TEMP: '/TMP', TMP: '/TMP' }, opcoes.env || {});
                            FS.chdir(cwd0);
                        },
                    ],
                };
                if (opcoes.locateFile) Module.locateFile = opcoes.locateFile;
                fabrica(Module).then((M) => {
                    if (opcoes.aoModulo) opcoes.aoModulo(M, exe);
                    try {
                        M.callMain(args);
                    } catch (e) {
                        if (!(e && e.name === 'ExitStatus')) {
                            if (opcoes.log) opcoes.log(exe + ': ' + e);
                            acaba(-1);
                        }
                    }
                });
            });
            codigo = r;
            if (opcoes.aoFimModulo) opcoes.aoFimModulo(exe, r);
            if (!pendente) break;
            exe = pendente.exe;
            args = pendente.args;
        }
        return { arquivos, codigo, programas };
    }

    const V1 = { PROGRAMAS, PASTAS, exporta, importa, analisaShell, rodaCadeia };
    if (typeof module !== 'undefined' && module.exports) module.exports = V1;
    else raiz.V1 = V1;
})(typeof self !== 'undefined' ? self : this);
