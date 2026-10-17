// JSON de caso: os valores de referência que o original (oráculo) ou a V1 nova
// imprimiram para um caso, e a leitura das pastas desses JSONs.
import { readdirSync, readFileSync, statSync } from "node:fs";
import { isAbsolute, join, relative, resolve } from "node:path";

/** Um número (ou texto) impresso pelo original, como ele aparece na saída. */
export interface ValorRef {
  /** Identificador estável dentro do caso; é por ele que a montagem da V2 casa
   *  o número (`paridade/v2/obras/<caso>.ts` devolve um mapa id → número). */
  id: string;
  grandeza: string;
  unidade: string;
  /** Texto exatamente como impresso (".35", "0.25", "52", "Compressao Centrada"). */
  impresso: string;
  /** Onde está o texto: "impressora.prn:42" (linha do .prn, a partir de 1). */
  fonte: string;
  /** Casas decimais do valor quando o texto não mostra todas (ex.: "1.1" impresso
   *  por STR$ depois de truncar na 2ª casa tem 2 casas). Padrão: as do texto. */
  casas?: number;
  /** O original truncou em direção a zero (FIX) na última casa em vez de arredondar:
   *  a V2 bate se FIX(v2·10^casas)/10^casas = valor. Ex.: as parcelas do .REP do VIGA. */
  trunca?: boolean;
  obs?: string;
}

export interface CasoRef {
  caso: string;
  /** Pasta do run de onde os valores saíram: relativa à pasta do oráculo ($ORACULO,
   *  ex.: "runs/<caso>-<data>") ou absoluta (run da V1 nova). Ler com `pastaDoRun`. */
  run: string;
  programa: string;
  descricao: string;
  entrada: Record<string, unknown>;
  valores: ValorRef[];
}

/** Pasta do oráculo, da variável de ambiente ORACULO; erro se ela faltar. */
export function pastaOraculo(): string {
  const oraculo = process.env.ORACULO;
  if (!oraculo) throw new Error("defina ORACULO com a pasta do oráculo (a que contém runs/) para ler os runs dos casos");
  return oraculo;
}

/** Pasta do run de um caso: `run` relativo resolve contra $ORACULO; absoluto fica como está. */
export function pastaDoRun(run: string): string {
  return isAbsolute(run) ? run : join(pastaOraculo(), run);
}

/** Como o JSON guarda a pasta de um run: relativa a $ORACULO quando o run está dentro
 *  dela; senão o caminho como veio. Barras normais nos dois casos. */
export function runDoCaso(pasta: string): string {
  const oraculo = process.env.ORACULO;
  const rel = oraculo ? relative(resolve(oraculo), resolve(pasta)) : "";
  const dentro = rel !== "" && !rel.startsWith("..") && !isAbsolute(rel);
  return (dentro ? rel : pasta).replace(/\\/g, "/");
}

/** Casas de grandezas que o original imprime por STR$, que corta os zeros à direita
 *  ("-1.4" de −1,40; "9" de 9,0): o formato conhecido de cada uma, que vale quando o
 *  JSON não diz `casas` e o texto mostra menos. */
export const CASAS_POR_FORMATO: [RegExp, number, string][] = [
  [/\.MEP\d+$/, 2, "MEP: STR$(INT(100·M)/100) (VIGA.BAS:2416; DESDIM)"],
  [/\.t\d+\.flecha$/, 2, "flecha do DESDIM: STR$(INT(L³·k·1e8/EI)/100) (DESDIM.BAS:3894)"],
  [/^resumo\..+\.(Vconc|Afor)$/, 1, "volume e fôrma do DESENHO 4: CINT(x/10)/10 (DESENHO.BAS:2236-2310)"],
  [/^L\d+\.mu$/, 2, "μ gravado no .LAJ (SINGLE; a tabela do LAJECALC 2 tem 2 casas)"],
];

/** Casas de um valor: as do JSON; senão o maior entre o texto e o formato conhecido. */
export function casasDoValor(v: Pick<ValorRef, "id" | "impresso" | "casas">): number | undefined {
  if (v.casas !== undefined) return v.casas;
  const formato = CASAS_POR_FORMATO.find(([re]) => re.test(v.id))?.[1];
  if (formato === undefined) return undefined;
  const t = v.impresso.trim();
  const p = t.indexOf(".");
  return Math.max(formato, p < 0 ? 0 : t.length - p - 1);
}

/** Caso lido de um arquivo, ou o erro que impediu a leitura. */
export type CasoLido = { arquivo: string; caso: CasoRef } | { arquivo: string; erro: string };

/** Valida a forma mínima do JSON; devolve a lista de problemas (vazia = ok). */
export function validarCaso(x: unknown): string[] {
  const erros: string[] = [];
  if (typeof x !== "object" || x === null) return ["não é um objeto JSON"];
  const c = x as Record<string, unknown>;
  for (const k of ["caso", "run", "programa"] as const)
    if (typeof c[k] !== "string" || !c[k]) erros.push(`campo "${k}" ausente ou não é texto`);
  if (!Array.isArray(c.valores)) return [...erros, `campo "valores" ausente ou não é lista`];
  const ids = new Set<string>();
  c.valores.forEach((v: unknown, i) => {
    const r = v as Record<string, unknown>;
    if (typeof r !== "object" || r === null) return void erros.push(`valores[${i}] não é objeto`);
    for (const k of ["id", "impresso"] as const)
      if (typeof r[k] !== "string") erros.push(`valores[${i}].${k} ausente ou não é texto`);
    if (typeof r.id === "string") {
      if (ids.has(r.id)) erros.push(`id repetido: ${r.id}`);
      ids.add(r.id);
    }
  });
  return erros;
}

/** Lê os *.json das pastas (ou arquivos) dadas, em ordem de nome. */
export function lerCasos(caminhos: readonly string[]): CasoLido[] {
  const arquivos = caminhos.flatMap((p) => {
    const abs = resolve(p);
    if (!statSync(abs, { throwIfNoEntry: false })) return [];
    if (statSync(abs).isFile()) return [abs];
    return readdirSync(abs)
      .filter((n) => n.toLowerCase().endsWith(".json"))
      .sort()
      .map((n) => join(abs, n));
  });
  return arquivos.map((arquivo): CasoLido => {
    try {
      const x = JSON.parse(readFileSync(arquivo, "utf8"));
      const erros = validarCaso(x);
      if (erros.length) return { arquivo, erro: erros.join("; ") };
      const c = x as CasoRef;
      return {
        arquivo,
        caso: {
          ...c,
          descricao: c.descricao ?? "",
          entrada: c.entrada ?? {},
          valores: c.valores.map((v) => {
            const casas = casasDoValor(v);
            return { ...v, grandeza: v.grandeza ?? v.id, unidade: v.unidade ?? "", fonte: v.fonte ?? "", ...(casas !== undefined && { casas }) };
          }),
        },
      };
    } catch (e) {
      return { arquivo, erro: `JSON inválido: ${(e as Error).message}` };
    }
  });
}
