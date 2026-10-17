// v1.js - pagina da OpenStrut V1 no navegador: tela (canvas), teclado fisico e virtual, som, obras
// no IndexedDB, importar/exportar arquivos e impressora. A cadeia de programas e o sistema de
// arquivos ficam no v1-nucleo.js; o ESC/P, no impressora.js; o .zip, no zip.js.
(function () {
    'use strict';
    const V1 = window.V1;
    const $ = (id) => document.getElementById(id);
    const tela = $('tela');
    const ctx = tela.getContext('2d');
    const estado = $('estado');
    let modulo = null; // modulo wasm corrente
    let imagem = null;
    let ultimos = []; // arquivos do ultimo modulo que terminou (ou os iniciais)

    // ------------------------------------------------------------------ modulos
    const fabricas = {};
    function carrega(exe) {
        if (fabricas[exe]) return fabricas[exe];
        fabricas[exe] = new Promise((ok, falha) => {
            const s = document.createElement('script');
            s.src = exe + '.js';
            s.onload = () => ok(window['V1_' + exe]);
            s.onerror = () => falha(new Error('modulo ' + exe + ' nao encontrado'));
            document.head.appendChild(s);
        });
        return fabricas[exe];
    }

    // ------------------------------------------------------------------ tela
    function aoQuadro(M, p, w, h) {
        if (tela.width !== w || tela.height !== h) {
            tela.width = w;
            tela.height = h;
            imagem = null;
        }
        if (!imagem) imagem = ctx.createImageData(w, h);
        const o = M.HEAPU8.subarray(p, p + w * h * 4), d = imagem.data;
        for (let i = 0; i < d.length; i += 4) { // BGRA -> RGBA
            d[i] = o[i + 2];
            d[i + 1] = o[i + 1];
            d[i + 2] = o[i];
            d[i + 3] = 255;
        }
        ctx.putImageData(imagem, 0, 0);
    }
    // espaco que sobra para a tela (cabecalho, teclado virtual, rodape)
    function ajustaTela() {
        const resto = document.querySelector('header').offsetHeight + $('teclado').offsetHeight + document.querySelector('footer').offsetHeight + 8;
        document.documentElement.style.setProperty('--resto', resto + 'px');
    }
    addEventListener('resize', ajustaTela);

    // ------------------------------------------------------------------ som (SOUND, BEEP)
    let audio = null;
    function aoSom(freq, seg) {
        try {
            audio = audio || new AudioContext();
            const o = audio.createOscillator(), g = audio.createGain();
            o.type = 'square';
            o.frequency.value = freq;
            g.gain.value = 0.05;
            o.connect(g).connect(audio.destination);
            o.start();
            o.stop(audio.currentTime + Math.min(seg, 5));
        } catch (e) {}
    }

    // ------------------------------------------------------------------ teclado -> GLFW
    const GLFW = { Space: 32, Quote: 39, Comma: 44, Minus: 45, Period: 46, Slash: 47, Semicolon: 59, Equal: 61, BracketLeft: 91, Backslash: 92,
        BracketRight: 93, Backquote: 96, IntlBackslash: 162, IntlRo: 47, Escape: 256, Enter: 257, Tab: 258, Backspace: 259, Insert: 260, Delete: 261,
        ArrowRight: 262, ArrowLeft: 263, ArrowDown: 264, ArrowUp: 265, PageUp: 266, PageDown: 267, Home: 268, End: 269, CapsLock: 280, ScrollLock: 281,
        NumLock: 282, PrintScreen: 283, Pause: 284, NumpadDecimal: 330, NumpadDivide: 331, NumpadMultiply: 332, NumpadSubtract: 333, NumpadAdd: 334,
        NumpadEnter: 335, NumpadEqual: 336, ShiftLeft: 340, ControlLeft: 341, AltLeft: 342, MetaLeft: 343, ShiftRight: 344, ControlRight: 345,
        AltRight: 346, MetaRight: 347, ContextMenu: 348 };
    function glfwTecla(code) {
        if (code in GLFW) return GLFW[code];
        let m = /^Key([A-Z])$/.exec(code);
        if (m) return m[1].charCodeAt(0);
        m = /^Digit([0-9])$/.exec(code);
        if (m) return 48 + Number(m[1]);
        m = /^F([0-9]+)$/.exec(code);
        if (m) return 289 + Number(m[1]);
        m = /^Numpad([0-9])$/.exec(code);
        if (m) return 320 + Number(m[1]);
        return -1;
    }
    function mods(e) {
        return (e.shiftKey ? 1 : 0) | (e.ctrlKey ? 2 : 0) | (e.altKey ? 4 : 0) | (e.metaKey ? 8 : 0) | (e.getModifierState && e.getModifierState('CapsLock') ? 16 : 0) |
            (e.getModifierState && e.getModifierState('NumLock') ? 32 : 0);
    }
    function tecla(e, acao) {
        if (!modulo || !modulo._qbweb_tecla) return;
        modulo._qbweb_tecla(glfwTecla(e.code), 0, acao, mods(e));
        // caractere (o GLFW manda pelo callback de caractere): letras, digitos, acentos ja compostos
        if (acao && e.key.length === 1 && !e.ctrlKey && !e.metaKey && !(e.altKey && !e.getModifierState('AltGraph')))
            modulo._qbweb_caractere(e.key.codePointAt(0), mods(e));
        e.preventDefault();
    }
    tela.addEventListener('keydown', (e) => tecla(e, e.repeat ? 2 : 1));
    tela.addEventListener('keyup', (e) => tecla(e, 0));
    tela.addEventListener('pointerdown', () => tela.focus());

    // teclado virtual: teclas de funcao, ESC, setas (o SISTRUT depende delas)
    function aperta(code) {
        if (!modulo) return;
        const k = glfwTecla(code);
        modulo._qbweb_tecla(k, 0, 1, 0);
        modulo._qbweb_tecla(k, 0, 0, 0);
    }
    $('teclado').addEventListener('pointerdown', (e) => {
        const k = e.target.dataset && e.target.dataset.k;
        if (k) {
            e.preventDefault();
            aperta(k);
        }
    });
    // texto pelo teclado do sistema (celular): um <input> escondido recebe o que for digitado
    const entrada = $('entrada');
    $('botaoDigitar').addEventListener('pointerdown', (e) => {
        e.preventDefault();
        entrada.focus();
    });
    entrada.addEventListener('beforeinput', (e) => {
        if (!modulo) return;
        if (e.inputType === 'insertText' && e.data) for (const ch of e.data) modulo._qbweb_caractere(ch.codePointAt(0), 0);
        else if (e.inputType === 'deleteContentBackward') aperta('Backspace');
        else if (e.inputType === 'insertLineBreak') aperta('Enter');
        e.preventDefault();
    });
    entrada.addEventListener('keydown', (e) => {
        if (['Enter', 'Escape', 'Tab', 'ArrowLeft', 'ArrowRight', 'ArrowUp', 'ArrowDown'].includes(e.key) || /^F[0-9]+$/.test(e.key)) {
            aperta(e.code || e.key);
            e.preventDefault();
        }
    });
    const toque = matchMedia('(pointer: coarse)').matches;
    if (toque) $('teclado').classList.add('visivel');
    $('botaoTeclado').addEventListener('click', () => {
        $('teclado').classList.toggle('visivel');
        ajustaTela();
    });
    ajustaTela();

    // ------------------------------------------------------------------ obras (IndexedDB)
    function banco() {
        return new Promise((ok, falha) => {
            const r = indexedDB.open('openstrut-v1', 1);
            r.onupgradeneeded = () => r.result.createObjectStore('arquivos');
            r.onsuccess = () => ok(r.result);
            r.onerror = () => falha(r.error);
        });
    }
    async function leObras() {
        const db = await banco();
        return new Promise((ok) => {
            const r = db.transaction('arquivos').objectStore('arquivos').get('drive');
            r.onsuccess = () => ok(r.result || null);
            r.onerror = () => ok(null);
        });
    }
    async function gravaObras(lista) {
        const db = await banco();
        return new Promise((ok) => {
            const t = db.transaction('arquivos', 'readwrite');
            t.objectStore('arquivos').put(lista, 'drive');
            t.oncomplete = ok;
            t.onerror = ok;
        });
    }
    // o que fica entre sessoes: o drive C: e a impressora
    function persistentes(lista) {
        return lista.filter((a) => a.caminho === '/C' || a.caminho.startsWith('/C/') || a.caminho === '/SAIDA/impressora.prn');
    }
    async function instalacao() {
        const r = await fetch('instalacao.json');
        const j = await r.json();
        return j.map((a) => (a.pasta ? a : { caminho: a.caminho, dados: Uint8Array.from(atob(a.b64), (c) => c.charCodeAt(0)) }));
    }
    // arquivos correntes: do modulo que esta rodando ou do ultimo que terminou
    function correntes() {
        if (modulo) {
            try {
                return V1.exporta(modulo.FS, V1.PASTAS);
            } catch (e) {}
        }
        return ultimos;
    }
    // grava um arquivo no modulo que esta rodando (ele leva adiante no CHAIN) ou na lista guardada
    async function escreve(caminho, dados) {
        if (modulo) {
            modulo.FS.mkdirTree(caminho.substring(0, caminho.lastIndexOf('/')));
            modulo.FS.writeFile(caminho, dados);
        }
        ultimos = ultimos.filter((a) => a.caminho !== caminho).concat([{ caminho, dados }]);
        await gravaObras(persistentes(correntes()));
    }
    async function apaga(caminho) {
        if (modulo) {
            try {
                modulo.FS.unlink(caminho);
            } catch (e) {}
        }
        ultimos = ultimos.filter((a) => a.caminho !== caminho);
        await gravaObras(persistentes(correntes()));
    }

    function baixa(nome, dados) {
        const url = URL.createObjectURL(new Blob([dados], { type: 'application/octet-stream' }));
        const l = document.createElement('a');
        l.href = url;
        l.download = nome;
        l.click();
        setTimeout(() => URL.revokeObjectURL(url), 1000);
    }

    // ------------------------------------------------------------------ painel de arquivos
    function abre(id) {
        $(id).classList.add('aberto');
    }
    document.querySelectorAll('.painel .fechar').forEach((b) =>
        b.addEventListener('click', () => {
            b.closest('.painel').classList.remove('aberto');
            tela.focus();
        })
    );
    function mostraArquivos() {
        const lista = correntes();
        const pastas = lista.filter((a) => a.pasta && (a.caminho === '/C' || a.caminho.startsWith('/C/'))).map((a) => a.caminho);
        const sel = $('pastaDestino'), antes = sel.value;
        sel.innerHTML = '';
        for (const p of pastas.sort()) {
            const o = document.createElement('option');
            o.value = p;
            o.textContent = 'C:' + (p.substring(2).replace(/\//g, '\\') || '\\');
            sel.appendChild(o);
        }
        sel.value = antes || '/C';
        const t = $('listaArquivos');
        t.innerHTML = '';
        for (const a of lista.filter((x) => !x.pasta && x.caminho.startsWith('/C/')).sort((x, y) => (x.caminho < y.caminho ? -1 : 1))) {
            const tr = t.insertRow();
            tr.insertCell().textContent = 'C:' + a.caminho.substring(2).replace(/\//g, '\\');
            const n = tr.insertCell();
            n.className = 'n';
            n.textContent = a.dados.length + ' bytes';
            const acoes = tr.insertCell();
            const b = document.createElement('button');
            b.textContent = 'Baixar';
            b.onclick = () => baixa(a.caminho.substring(a.caminho.lastIndexOf('/') + 1), a.dados);
            const x = document.createElement('button');
            x.textContent = 'Apagar';
            x.onclick = async () => {
                if (confirm('Apagar ' + a.caminho.substring(1) + '?')) {
                    await apaga(a.caminho);
                    mostraArquivos();
                }
            };
            acoes.append(b, ' ', x);
        }
    }
    $('botaoArquivos').addEventListener('click', () => {
        mostraArquivos();
        abre('painelArquivos');
    });
    $('exportar').addEventListener('click', () => {
        const arqs = correntes().filter((a) => !a.pasta && a.caminho.startsWith('/C/')).map((a) => ({ nome: a.caminho.substring(3), dados: a.dados }));
        baixa('openstrut-c.zip', Zip.grava(arqs));
    });
    $('importar').addEventListener('click', () => $('arquivoImportado').click());
    $('arquivoImportado').addEventListener('change', async (e) => {
        const destino = $('pastaDestino').value || '/C';
        // nome do DOS: 8.3 em maiusculas (o programa so le esses)
        const dos = (n) => n.toUpperCase();
        for (const f of e.target.files) {
            const dados = new Uint8Array(await f.arrayBuffer());
            if (/\.zip$/i.test(f.name)) {
                for (const a of await Zip.le(dados)) await escreve(destino + '/' + a.nome.split('/').map(dos).join('/'), a.dados);
            } else await escreve(destino + '/' + dos(f.name), dados);
        }
        e.target.value = '';
        mostraArquivos();
    });
    $('limpar').addEventListener('click', async () => {
        if (!confirm('Apagar as obras gravadas neste navegador e voltar à instalação original?')) return;
        await gravaObras(null);
        location.reload();
    });

    // ------------------------------------------------------------------ impressora
    function impressora() {
        const a = correntes().find((x) => x.caminho === '/SAIDA/impressora.prn');
        return a ? a.dados : null;
    }
    $('botaoImpressao').addEventListener('click', () => {
        const d = impressora(), pg = $('paginas');
        pg.innerHTML = '';
        if (!d || !d.length) pg.textContent = 'Nada foi impresso ainda.';
        else for (const c of Impressora.desenha(d)) pg.appendChild(c);
        abre('painelImpressao');
    });
    $('imprimir').addEventListener('click', () => print());
    $('baixar').addEventListener('click', () => {
        const d = impressora();
        if (!d) return alert('Nada foi impresso ainda.');
        baixa('IMPRESSORA.PRN', d);
    });
    $('limparImpressora').addEventListener('click', async () => {
        if (!confirm('Apagar o que foi impresso?')) return;
        await apaga('/SAIDA/impressora.prn');
        $('paginas').textContent = 'Nada foi impresso ainda.';
    });

    // ------------------------------------------------------------------ cadeia
    let programas = null; // modulos que o site tem (modulos.json, gerado pelo build)
    async function roda(prog, args, arquivos, env) {
        estado.textContent = 'carregando ' + prog + '...';
        if (!programas) programas = await fetch('modulos.json').then((r) => (r.ok ? r.json() : V1.PROGRAMAS)).catch(() => V1.PROGRAMAS);
        ultimos = arquivos;
        let salvador = null;
        const r = await V1.rodaCadeia(prog, args, {
            arquivos,
            programas,
            env: Object.assign({ SISTRUT_SAIDA: '/SAIDA' }, env || {}),
            cwd: '/C',
            carrega,
            aoQuadro,
            aoSom,
            log: (t) => console.log(t),
            aoModulo: (M, exe) => {
                modulo = M;
                estado.textContent = exe;
                if (!$('painelArquivos').classList.contains('aberto')) tela.focus();
                // grava as obras de tempos em tempos (o fim do modulo tambem grava)
                clearInterval(salvador);
                if (!env || !env.SISTRUT_ROTEIRO)
                    salvador = setInterval(() => {
                        try {
                            gravaObras(persistentes(V1.exporta(M.FS, V1.PASTAS)));
                        } catch (e) {}
                    }, 10000);
            },
            aoFimModulo: () => {
                clearInterval(salvador);
                try {
                    ultimos = V1.exporta(modulo.FS, V1.PASTAS);
                } catch (e) {}
                modulo = null;
            },
        });
        ultimos = r.arquivos;
        return r;
    }

    async function inicia() {
        const p = new URLSearchParams(location.search);
        const prog = (p.get('prog') || 'SISTRUT').toUpperCase();
        let arquivos = await leObras();
        if (!arquivos) arquivos = await instalacao();
        let args = [];
        if (prog !== 'SISTRUT') {
            // modulo aberto direto: a tela de entrada do gerenciador vem da semente (tools/troca_semente.py)
            const s = await fetch('semente_' + prog + '.chn');
            if (s.ok) {
                arquivos = arquivos.concat([{ caminho: '/TMP/SEMENTE.CHN', dados: new Uint8Array(await s.arrayBuffer()) }]);
                args = ['/CHAIN:/TMP/SEMENTE.CHN'];
            }
        }
        const r = await roda(prog, args, arquivos);
        await gravaObras(persistentes(r.arquivos));
        estado.textContent = 'programa encerrado (' + r.programas.join(' > ') + ')';
        $('recomecar').hidden = false;
    }
    $('recomecar').addEventListener('click', () => location.reload());

    // ------------------------------------------------------------------ testes (Chrome headless)
    const b64 = (d) => {
        let s = '';
        for (let i = 0; i < d.length; i += 32768) s += String.fromCharCode.apply(null, d.subarray(i, i + 32768));
        return btoa(s);
    };
    // web/tests/paridade_navegador.cjs: roda um roteiro com uma pasta C: dada e devolve /SAIDA (e /C,
    // com devolveC) em base64
    window.V1_TESTE = async function (o) {
        const arquivos = o.arquivos.map((a) => (a.pasta ? a : { caminho: a.caminho, dados: Uint8Array.from(atob(a.b64), (c) => c.charCodeAt(0)) }));
        const t0 = performance.now();
        const r = await roda(o.prog, o.args, arquivos, o.env);
        const quer = (c) => c.startsWith('/SAIDA/') || (o.devolveC && (c === '/C' || c.startsWith('/C/'))) || (o.devolve || []).includes(c);
        const saida = r.arquivos.filter((a) => quer(a.caminho)).map((a) => (a.pasta ? { caminho: a.caminho, pasta: true } : { caminho: a.caminho, b64: b64(a.dados) }));
        return { saida, programas: r.programas, ms: performance.now() - t0 };
    };
    // estado parcial do modulo corrente (o executor chama quando estoura o limite de tempo)
    window.V1_PARCIAL = function () {
        const lista = modulo ? V1.exporta(modulo.FS, ['/SAIDA', '/C']) : ultimos;
        return { saida: lista.map((a) => (a.pasta ? { caminho: a.caminho, pasta: true } : { caminho: a.caminho, b64: b64(a.dados) })) };
    };
    // impressora desenhada (teste da visualizacao): numero de paginas e pixels pretos de cada uma
    window.V1_DESENHA_PRN = function (b) {
        const d = Uint8Array.from(atob(b), (c) => c.charCodeAt(0));
        return Impressora.desenha(d).map((c) => {
            const px = c.getContext('2d').getImageData(0, 0, c.width, c.height).data;
            let n = 0;
            for (let i = 0; i < px.length; i += 4) if (px[i] < 128) n++;
            return n;
        });
    };

    if (!new URLSearchParams(location.search).has('teste')) inicia().catch((e) => (estado.textContent = 'erro: ' + e.message));
})();
