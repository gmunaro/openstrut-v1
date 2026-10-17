// zip.js - .zip sem compressao (gravar) e com ou sem deflate (ler, pelo DecompressionStream do
// navegador), para exportar e importar os arquivos da obra.
(function (raiz) {
    'use strict';
    const TAB = new Uint32Array(256).map((_, n) => {
        let c = n;
        for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
        return c >>> 0;
    });
    function crc32(d) {
        let c = 0xffffffff;
        for (let i = 0; i < d.length; i++) c = TAB[(c ^ d[i]) & 255] ^ (c >>> 8);
        return (c ^ 0xffffffff) >>> 0;
    }

    // [{nome, dados: Uint8Array}] -> Uint8Array do .zip (metodo 0, nomes em CP437/ASCII)
    function grava(arquivos) {
        const partes = [], central = [];
        let pos = 0;
        const agora = new Date();
        const hora = (agora.getHours() << 11) | (agora.getMinutes() << 5) | (agora.getSeconds() >> 1);
        const data = ((agora.getFullYear() - 1980) << 9) | ((agora.getMonth() + 1) << 5) | agora.getDate();
        for (const a of arquivos) {
            const nome = new TextEncoder().encode(a.nome), crc = crc32(a.dados), n = a.dados.length;
            const h = new DataView(new ArrayBuffer(30));
            h.setUint32(0, 0x04034b50, true);
            h.setUint16(4, 20, true);
            h.setUint16(10, hora, true);
            h.setUint16(12, data, true);
            h.setUint32(14, crc, true);
            h.setUint32(18, n, true);
            h.setUint32(22, n, true);
            h.setUint16(26, nome.length, true);
            const c = new DataView(new ArrayBuffer(46));
            c.setUint32(0, 0x02014b50, true);
            c.setUint16(4, 20, true);
            c.setUint16(6, 20, true);
            c.setUint16(12, hora, true);
            c.setUint16(14, data, true);
            c.setUint32(16, crc, true);
            c.setUint32(20, n, true);
            c.setUint32(24, n, true);
            c.setUint16(28, nome.length, true);
            c.setUint32(42, pos, true);
            partes.push(new Uint8Array(h.buffer), nome, a.dados);
            central.push(new Uint8Array(c.buffer), nome);
            pos += 30 + nome.length + n;
        }
        const tamCentral = central.reduce((s, p) => s + p.length, 0);
        const fim = new DataView(new ArrayBuffer(22));
        fim.setUint32(0, 0x06054b50, true);
        fim.setUint16(8, arquivos.length, true);
        fim.setUint16(10, arquivos.length, true);
        fim.setUint32(12, tamCentral, true);
        fim.setUint32(16, pos, true);
        const tudo = partes.concat(central, [new Uint8Array(fim.buffer)]);
        const r = new Uint8Array(tudo.reduce((s, p) => s + p.length, 0));
        let o = 0;
        for (const p of tudo) {
            r.set(p, o);
            o += p.length;
        }
        return r;
    }

    // Uint8Array do .zip -> Promise([{nome, dados}]) (metodos 0 e 8)
    async function le(zip) {
        const v = new DataView(zip.buffer, zip.byteOffset, zip.byteLength);
        let e = zip.length - 22;
        while (e >= 0 && v.getUint32(e, true) !== 0x06054b50) e--;
        if (e < 0) throw new Error('arquivo .zip invalido');
        const total = v.getUint16(e + 10, true);
        let p = v.getUint32(e + 16, true);
        const r = [];
        for (let k = 0; k < total; k++) {
            const metodo = v.getUint16(p + 10, true), comp = v.getUint32(p + 20, true);
            const ln = v.getUint16(p + 28, true), lx = v.getUint16(p + 30, true), lc = v.getUint16(p + 32, true);
            const local = v.getUint32(p + 42, true);
            const nome = new TextDecoder().decode(zip.subarray(p + 46, p + 46 + ln));
            p += 46 + ln + lx + lc;
            if (nome.endsWith('/')) continue;
            const ini = local + 30 + v.getUint16(local + 26, true) + v.getUint16(local + 28, true);
            let dados = zip.slice(ini, ini + comp);
            if (metodo === 8) {
                const s = new Blob([dados]).stream().pipeThrough(new DecompressionStream('deflate-raw'));
                dados = new Uint8Array(await new Response(s).arrayBuffer());
            } else if (metodo !== 0) throw new Error('metodo de compressao ' + metodo + ' nao suportado em ' + nome);
            r.push({ nome, dados });
        }
        return r;
    }

    const Zip = { grava, le, crc32 };
    if (typeof module !== 'undefined' && module.exports) module.exports = Zip;
    else raiz.Zip = Zip;
})(typeof self !== 'undefined' ? self : this);
