// Compara a V2 com o SISTRUT original: lê os JSON de caso (valores impressos pelo
// original), monta cada caso na V2 (v2/obras/<caso>.ts) nos dois modos de cálculo e grava
// saida/relatorio-<modo>.md (resumo dos dois modos e o detalhe do modo pedido) e
// saida/v2-<modo>.json (o mapa id → número da V2 de cada caso nos dois modos).
//
// Uso: bun paridade/comparar.ts [--modo original|corrigido] [--v2 <raiz>] [--casos <pasta>]...
//                               [--saida <pasta>]
// Saída: 0 sem problema; 1 algum valor DIFERE (modo original) ou alguma diferença
// inesperada nova (modo corrigido; as que já diferem no original reprovam lá); 2 erro
// (JSON inválido, montagem da V2 que falhou, opção errada).
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";
import { type CasoRef, lerCasos } from "./lib/caso";
import { lerNumero } from "./lib/numero";
import { type Bloco, classificar, compararCaso, contar, type Linha, relatorio, type ResultadoModo, type ValorV2 } from "./lib/comparar";
import { abrirMotor, type Modo, type Motor } from "./v2/motor";
import { DIAGNOSTICOS, DIAGNOSTICOS_CORRIGIDO, DIAGNOSTICOS_ERRO, notaDe, regraCorrigido, SEM_PAR } from "./v2/notas";

const PARIDADE = dirname(fileURLToPath(import.meta.url));

const args = process.argv.slice(2);
const opt = (n: string, p: string) => (args.includes(n) ? args[args.indexOf(n) + 1] ?? p : p);
const modo = opt("--modo", "original") as Modo;
const v2Raiz = opt("--v2", process.env.V2_DIR ?? "");
const saida = resolve(opt("--saida", join(PARIDADE, "saida")));
const pastas = args.flatMap((a, i) => (a === "--casos" && args[i + 1] ? [resolve(args[i + 1]!)] : []));
if (!pastas.length) pastas.push(join(PARIDADE, "casos"));

if (!["original", "corrigido"].includes(modo)) {
  console.error("--modo original|corrigido");
  process.exit(2);
}
if (!v2Raiz) {
  console.error("informe a raiz do repositório da V2 com --v2 <raiz> ou na variável V2_DIR");
  process.exit(2);
}
const v2 = resolve(v2Raiz);
if (!existsSync(join(v2, "src", "calculo", "fluxo.ts"))) {
  console.error(`não achei o motor da V2 em ${v2} (src/calculo/fluxo.ts)`);
  process.exit(2);
}

/** Montagem de um caso: os ids do caso que a V2 dá, nas unidades do original. */
type Montagem = (motor: Motor, modo: Modo, caso: CasoRef) => Map<string, ValorV2>;
async function montagem(caso: string): Promise<Montagem | null> {
  const arq = join(PARIDADE, "v2", "obras", `${caso}.ts`);
  if (!/^[\w-]+$/.test(caso) || !existsSync(arq)) return null;
  return (await import(pathToFileURL(arq).href)).default as Montagem;
}

/** Calcula o caso num modo, guardando os avisos e as evidências que a V2 deu. */
function calcularModo(motor: Motor, montar: Montagem | null, m: Modo, caso: CasoRef) {
  const avisos: string[] = [];
  const evidencias: string[] = [];
  if (!montar) return { mapa: new Map<string, ValorV2>(), avisos, evidencias };
  const espiao: Motor = {
    ...motor,
    calcular: (obra, mm) => {
      const c = motor.calcular(obra, mm);
      avisos.push(...c.avisos);
      evidencias.push(...c.evidencias);
      return c;
    },
  };
  return { mapa: montar(espiao, m, caso), avisos: [...new Set(avisos)], evidencias };
}

const motor = await abrirMotor(v2);
const blocos: Bloco[] = [];
const mapas: Record<string, Record<Modo, Record<string, ValorV2>>> = {};
for (const lido of lerCasos(pastas)) {
  if ("erro" in lido) {
    blocos.push({ arquivo: lido.arquivo, erro: lido.erro });
    continue;
  }
  const { arquivo, caso } = lido;
  try {
    const montar = await montagem(caso.caso);
    const o = calcularModo(motor, montar, "original", caso);
    const c = calcularModo(motor, montar, "corrigido", caso);
    mapas[caso.caso] = { original: Object.fromEntries(o.mapa), corrigido: Object.fromEntries(c.mapa) };
    const nota = (l: Linha, notas: typeof SEM_PAR) => ({ ...l, nota: notaDe(notas, caso.caso, l.ref.id) });
    const linhasO = compararCaso(caso, o.mapa).map((l) =>
      l.situacao === "sem par" ? nota(l, SEM_PAR) : l.situacao === "DIFERE" ? nota(l, DIAGNOSTICOS) : l,
    );
    const brutasC = compararCaso(caso, c.mapa);
    const difere = new Set(brutasC.filter((l) => l.situacao === "DIFERE").map((l) => l.ref.id));
    const ids = caso.valores.map((v) => v.id);
    const evidencias = [...new Set([...o.evidencias, ...c.evidencias])];
    const linhasC = brutasC.map((l, i) => {
      if (l.situacao === "sem par") return nota(l, SEM_PAR);
      if (l.situacao !== "DIFERE") return l;
      const numero = (id: string) => {
        const ref = caso.valores.find((v) => v.id === id);
        const corr = c.mapa.get(id);
        return { original: ref ? (lerNumero(ref.impresso) ?? undefined) : undefined, corrigido: typeof corr === "number" ? corr : undefined };
      };
      const impresso = (id: string) => caso.valores.find((v) => v.id === id)?.impresso;
      const regra = regraCorrigido({ caso: caso.caso, id: l.ref.id, ids, mudou: (id) => difere.has(id), evidencias, numero, impresso });
      const cl = classificar(l, linhasO[i], regra);
      const diag = cl.classe === "inesperada" && !cl.herdada ? notaDe(DIAGNOSTICOS_CORRIGIDO, caso.caso, l.ref.id) : undefined;
      return { ...l, ...cl, ...(diag && { nota: `${cl.nota}. Diagnóstico: ${diag}` }) };
    });
    const original: ResultadoModo = { linhas: linhasO, avisos: o.avisos };
    const corrigido: ResultadoModo = { linhas: linhasC, avisos: c.avisos };
    blocos.push({ arquivo, caso, semMontagem: !montar, original, corrigido });
  } catch (e) {
    const err = e as Error;
    const diag = DIAGNOSTICOS_ERRO[caso.caso];
    blocos.push({ arquivo, caso, erro: `montagem na V2 falhou: ${err.message}${diag ? `
  Diagnóstico: ${diag}` : `
${err.stack ?? ""}`}` });
  }
}
if (!blocos.length) {
  console.error(`nenhum JSON de caso em ${pastas.join(", ")}`);
  process.exit(2);
}

mkdirSync(saida, { recursive: true });
const barra = (p: string) => p.replace(/\\/g, "/");
const ex = { modo, v2: barra(v2), v2Commit: motor.commit, pastas: pastas.map(barra), geradoEm: new Date().toISOString() };
const rel = join(saida, `relatorio-${modo}.md`);
writeFileSync(rel, relatorio(ex, blocos));
writeFileSync(join(saida, `v2-${modo}.json`), `${JSON.stringify({ ...ex, casos: mapas }, null, 1)}\n`);

const semNota = (ls: readonly Linha[], s: string) => ls.filter((l) => l.situacao === s && !l.nota).length;
let reprova = false;
for (const b of blocos) {
  const m = modo === "original" ? b.original : b.corrigido;
  if (b.erro || !m) {
    console.log(`${b.caso?.caso ?? b.arquivo}: ERRO ${(b.erro ?? "").split("\n")[0]}`);
    continue;
  }
  const ls = m.linhas;
  const dif = contar(ls, "DIFERE");
  const extra =
    modo === "original"
      ? `DIFERE ${dif} (sem diagnóstico ${semNota(ls, "DIFERE")})`
      : `DIFERE ${dif} (esperada ${ls.filter((l) => l.classe === "esperada").length}, inesperada ${ls.filter((l) => l.classe === "inesperada" && !l.herdada).length}, já no original ${ls.filter((l) => l.herdada).length})`;
  console.log(`${b.caso!.caso}: igual ${contar(ls, "igual")}, ${extra}, sem par ${contar(ls, "sem par")} (sem justificativa ${semNota(ls, "sem par")})`);
  // no corrigido, as inesperadas que já diferem no original reprovam lá, não aqui
  reprova ||= modo === "original" ? dif > 0 : ls.some((l) => l.classe === "inesperada" && !l.herdada);
}
console.log(`relatório: ${rel}`);
process.exit(blocos.some((b) => b.erro) ? 2 : reprova ? 1 : 0);
