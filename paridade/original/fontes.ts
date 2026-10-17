// Conferência das fontes de um JSON de caso: cada valor com fonte "impressora.prn:N" ou
// "telas/<tela>.txt:N" tem o texto impresso como token na linha N do arquivo do run
// (run relativo resolve contra $ORACULO).
// Pega id apontando para a linha errada (o cobrimento dos v2par_des_* apontava a linha
// em branco de baixo) e colunas trocadas na mesma linha. Fontes .LAJ e .png não são
// conferidas aqui.
import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { type CasoRef, pastaDoRun } from "../lib/caso";

const esc = (s: string) => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
/** O texto como token: antes, início ou separador; depois, fim, separador ou letra
 *  ("0.35tm", "-1.02@1", "0.60(1a)"). */
const token = (s: string) => new RegExp(`(^|[\\s(=:/#,])${esc(s.trim())}(?=$|[\\s),:/%;@(a-zA-Z])`, "g");

/** Linhas do arquivo como o extrator conta: quebra em \n; na .prn, sem os controles. */
function linhas(arq: string) {
  const prn = arq.endsWith(".prn");
  return readFileSync(arq, prn ? "latin1" : "utf8")
    .split("\n")
    .map((l) => (prn ? l.replace(/[\x00-\x1f\x7f]/g, "") : l.replace(/\r$/, "")));
}

/** Problemas das fontes do caso (vazio = todas conferem). Valores da mesma linha têm
 *  de aparecer na ordem do JSON (a ordem das colunas). */
export function conferirFontes(caso: CasoRef): string[] {
  const problemas: string[] = [];
  const cache = new Map<string, string[]>();
  const pos = new Map<string, number>();
  for (const v of caso.valores) {
    const m = /^(impressora\.prn|telas\/[^:]+\.txt):(\d+)$/.exec(v.fonte);
    if (!m) continue;
    const arq = join(pastaDoRun(caso.run), m[1]!);
    if (!cache.has(arq)) cache.set(arq, existsSync(arq) ? linhas(arq) : []);
    const ls = cache.get(arq)!;
    if (!ls.length) {
      problemas.push(`${v.id}: ${arq} não existe`);
      continue;
    }
    const chave = `${arq}:${m[2]}`;
    const re = token(v.impresso);
    re.lastIndex = pos.get(chave) ?? 0;
    const achou = re.exec(ls[Number(m[2]) - 1] ?? "");
    if (!achou) problemas.push(`${v.id}: "${v.impresso}" não está em ${v.fonte} (ou está fora da ordem das colunas)`);
    else pos.set(chave, achou.index + achou[0].length);
  }
  return problemas;
}
