// Números como o original (e a V1 nova) imprime e a tolerância de comparação que sai deles.
//
// O original imprime de dois jeitos:
//  - formato fixo (FormataNumero$, PRINT USING, STR$(CLNG(x*100)/100)): n casas
//    decimais. A tolerância é meia unidade da última casa: 0,5·10^-n.
//  - formato livre (PRINT/STR$ de DOUBLE): o QB64 mostra todos os dígitos
//    significativos e corta os zeros à direita, então "2" quer dizer 2,000…
//    Aqui a tolerância é relativa (TOL_LIVRE_REL), só para absorver o ruído de
//    ponto flutuante entre QB64 e JavaScript.

/** Tolerância relativa dos números em formato livre (≈ precisão de SINGLE). */
export const TOL_LIVRE_REL = 5e-7;
/** Piso absoluto da tolerância em formato livre (valores perto de zero). */
export const TOL_LIVRE_ABS = 1e-9;

export interface NumeroImpresso {
  valor: number;
  /** Casas decimais impressas (formato fixo); null = formato livre. */
  casas: number | null;
}

/** Lê um número impresso pelo original: aceita ".19", "-1.84", "1.5D-3", "  12 ".
 *  Devolve null se não for número. */
export function lerNumero(texto: string): number | null {
  const t = texto.trim().replace(/[dD]/, "e");
  if (!/^[-+]?(\d+\.?\d*|\.\d+)(e[-+]?\d+)?$/i.test(t)) return null;
  const v = Number(t);
  return Number.isFinite(v) ? v : null;
}

/** Casas decimais escritas no texto ("1.50" → 2, ".19" → 2, "12" → 0, "1.5E-3" → null). */
export function casasDoTexto(texto: string): number | null {
  const t = texto.trim();
  if (/[eEdD]/.test(t)) return null;
  const p = t.indexOf(".");
  return p < 0 ? 0 : t.length - p - 1;
}

/** Número em formato fixo: valor e casas vêm do próprio texto. */
export function fixo(texto: string): NumeroImpresso {
  const valor = lerNumero(texto);
  if (valor === null) throw new Error(`número inválido: "${texto}"`);
  return { valor, casas: casasDoTexto(texto) };
}

/** Número em formato livre (PRINT/STR$ do QB64). */
export function livre(texto: string): NumeroImpresso {
  const valor = lerNumero(texto);
  if (valor === null) throw new Error(`número inválido: "${texto}"`);
  return { valor, casas: null };
}

/** Tolerância de comparação: meia unidade da última casa impressa (formato fixo)
 *  ou relativa (formato livre). */
export function tolerancia(n: { valor: number; casas: number | null }): number {
  if (n.casas !== null) return 0.5 * 10 ** -n.casas;
  return Math.max(TOL_LIVRE_REL * Math.abs(n.valor), TOL_LIVRE_ABS);
}

/** V2 bate com o original dentro da tolerância do número impresso. A folga de 1e-9
 *  absorve o erro de representação de 0,5·10^-n em binário (ex.: 1,23 contra 1,235). */
export function bate(ref: { valor: number; casas: number | null }, v2: number): boolean {
  if (!Number.isFinite(v2)) return false;
  return Math.abs(v2 - ref.valor) <= tolerancia(ref) + 1e-9;
}

/** Folga relativa do truncamento: um valor já truncado e guardado em SINGLE pela V2
 *  (2,08 → 2,0799999) ainda trunca para o mesmo impresso. ≈ 8 ulps de SINGLE. */
export const TOL_TRUNCA_REL = 1e-6;

/** Número que o original truncou em direção a zero (FIX) na casa `casas` antes de
 *  imprimir: a V2 bate se FIX(v2·10^casas)/10^casas = valor, isto é,
 *  valor ≤ v2 < valor + 10^-casas (positivo) ou valor − 10^-casas < v2 ≤ valor (negativo),
 *  com a folga de SINGLE em `TOL_TRUNCA_REL`.
 *  Ex.: o .REP do VIGA imprime "-.64" para o MEP −0,648 e ".72" para a reação 0,729. */
export function bateTruncado(ref: { valor: number; casas: number }, v2: number): boolean {
  if (!Number.isFinite(v2)) return false;
  const neg = ref.valor < 0 || (ref.valor === 0 && v2 < 0);
  const [v, x] = neg ? [-ref.valor, -v2] : [ref.valor, v2];
  const folga = Math.max(TOL_TRUNCA_REL * Math.abs(v), 1e-9);
  return x >= v - folga && x < v + 10 ** -ref.casas - folga;
}

/** Formata com n casas e vírgula decimal (relatório). */
export function fmt(v: number | null | undefined, casas: number): string {
  if (v === null || v === undefined) return "—";
  if (!Number.isFinite(v)) return String(v);
  return v.toFixed(casas).replace(".", ",");
}
