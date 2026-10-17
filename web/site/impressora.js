// impressora.js - desenha o arquivo da impressora (ESC/P da Epson, o que o SISTRUT mandava para a
// LPT1) em paginas de formulario continuo, para ver e imprimir no navegador.
// Comandos tratados (os que aparecem nas impressoes dos casos): CR, LF, FF, BS, SI/DC2 (condensado),
// SO/DC4 (expandido na linha), ESC 0/2/3 n/A n (entrelinha), ESC K/L/Y/Z (imagem de 8 agulhas),
// ESC N/O (salto de picote, ignorado), ESC ? n m, ESC E/F, ESC W n, ESC @. Outros ESC: ignorados.
// Unidades: x em 1/120", y em 1/216". Pagina de 8,5" x 11" (66 linhas de 1/6").
(function (raiz) {
    'use strict';
    // CP437 -> Unicode (0x80..0xFF)
    const CP437 = 'ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥₧ƒáíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ ';
    const LARG = 1020, ALT = 2376, ESC_Y = 0.5; // pagina em unidades; canvas = x 1:1, y metade

    function novaPagina(paginas) {
        const c = document.createElement('canvas');
        c.width = LARG;
        c.height = Math.round(ALT * ESC_Y);
        const g = c.getContext('2d');
        g.fillStyle = '#fff';
        g.fillRect(0, 0, c.width, c.height);
        g.fillStyle = '#000';
        g.textBaseline = 'bottom';
        paginas.push(c);
        return g;
    }

    // devolve uma lista de <canvas>, uma por pagina
    function desenha(bytes) {
        const paginas = [];
        let g = novaPagina(paginas);
        const M = 30; // margem esquerda: 1/4"
        let x = M, y = 36, entre = 36, cond = false, larga = false, negrito = false, largaW = false, vazia = true;
        const cel = () => (cond ? 7 : 12) * (larga || largaW ? 2 : 1);
        const avanca = (dy) => {
            y += dy;
            if (y > ALT) {
                g = novaPagina(paginas);
                vazia = true;
                y -= ALT;
            }
        };
        const imagem = (i, n, passo) => {
            for (let k = 0; k < n && i + k < bytes.length; k++) {
                const b = bytes[i + k];
                if (b) vazia = false;
                for (let p = 0; p < 8; p++)
                    if (b & (0x80 >> p)) g.fillRect(x + k * passo, (y - 36 + p * 3) * ESC_Y, Math.max(passo, 1), 3 * ESC_Y);
            }
            x += n * passo;
            return i + n;
        };
        for (let i = 0; i < bytes.length; ) {
            const b = bytes[i++];
            if (b === 13) x = M;
            else if (b === 10) {
                avanca(entre);
                larga = false;
            } else if (b === 12) {
                if (!vazia) g = novaPagina(paginas); // FF no comeco nao gasta uma folha em branco
                vazia = true;
                y = 36;
                x = M;
            } else if (b === 8) x = Math.max(0, x - cel());
            else if (b === 15) cond = true;
            else if (b === 18) cond = false;
            else if (b === 14) larga = true;
            else if (b === 20) larga = false;
            else if (b === 27) {
                const c = String.fromCharCode(bytes[i++] || 0);
                if (c === '0') entre = 27;
                else if (c === '2') entre = 36;
                else if (c === '1') entre = 21;
                else if (c === '3') entre = bytes[i++];
                else if (c === 'A') entre = bytes[i++] * 3;
                else if ('KLYZ'.includes(c)) {
                    const n = bytes[i] + 256 * bytes[i + 1];
                    i = imagem(i + 2, n, c === 'K' ? 2 : 1);
                } else if (c === '*') {
                    const m = bytes[i], n = bytes[i + 1] + 256 * bytes[i + 2];
                    i = imagem(i + 3, n, m === 0 ? 2 : 1);
                } else if (c === 'N' || c === 'W' || c === 'C' || c === 'Q' || c === 'l' || c === 'J' || c === 'S' || c === '-' || c === 'x' || c === 'U' || c === 'p') {
                    if (c === 'W') largaW = bytes[i] === 1 || bytes[i] === 49;
                    if (c === 'J') avanca(bytes[i]);
                    i++;
                } else if (c === '?') i += 2;
                else if (c === 'E') negrito = true;
                else if (c === 'F') negrito = false;
                else if (c === '@') {
                    entre = 36;
                    cond = larga = largaW = negrito = false;
                    x = M;
                }
            } else if (b >= 32) {
                const ch = b < 128 ? String.fromCharCode(b) : CP437[b - 128];
                const w = cel();
                if (b !== 32) vazia = false;
                // letra de ~7/72" (21 unidades), como a matriz da Epson: cabe na entrelinha de 1/8"
                g.font = (negrito ? 'bold ' : '') + Math.round(24 * ESC_Y) + 'px "Courier New", monospace';
                g.save();
                g.translate(x, y * ESC_Y);
                g.scale(w / g.measureText('M').width, 1);
                g.fillText(ch, 0, 0);
                g.restore();
                x += w;
            }
        }
        return paginas;
    }

    const Impressora = { desenha };
    if (typeof module !== 'undefined' && module.exports) module.exports = Impressora;
    else raiz.Impressora = Impressora;
})(typeof self !== 'undefined' ? self : this);
