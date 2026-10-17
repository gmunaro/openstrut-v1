// Lado "original": extrai os valores de referência de um run, lendo a impressora.prn
// pelos rótulos, e grava o JSON de caso (formato em lib/caso.ts).
//
// O run pode ser do oráculo ($ORACULO/runs/<caso>-<data>) ou da V1 nova
// (tools/roda_retrad.sh grava o mesmo formato: impressora.prn na pasta de saída).
//
// Uso:
//   bun paridade/original/extrair.ts <caso> <pasta do run> [--saida <pasta>]
//   bun paridade/original/extrair.ts --padrao [--runs <pasta runs>] [--saida <pasta>]
//     --padrao  os 4 casos do PLANO (seção 2) a partir dos runs do oráculo; é assim que
//               paridade/casos/*.json foi gerado
//     --runs    pasta dos runs (padrão: $ORACULO/runs; sem --runs, ORACULO é obrigatória)
//     --saida   pasta dos JSON (padrão: paridade/casos)
//   Casos: caso_a_laje, caso_b_viga, caso_c_pilar, caso_c_pilaredi.
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { type CasoRef, pastaOraculo, runDoCaso, type ValorRef } from "../lib/caso";

/** Linhas da impressora.prn sem os códigos de controle (ESC/P). A numeração das
 *  linhas é a do arquivo bruto (quebra em \n), que é a usada em `fonte`. */
export function linhasPrn(bytes: Buffer): string[] {
  return bytes
    .toString("latin1")
    .split("\n")
    .map((l) => l.replace(/[\x00-\x1f\x7f]/g, ""));
}

type Novo = Omit<ValorRef, "fonte" | "id" | "impresso"> & { obs?: string; casas?: number; trunca?: boolean };

/** Acumula valores com a fonte "impressora.prn:<linha>". */
class Coleta {
  valores: ValorRef[] = [];
  constructor(readonly linhas: readonly string[]) {}
  add(id: string, impresso: string, i: number, v: Novo) {
    if (this.valores.some((x) => x.id === id)) throw new Error(`id repetido na extração: ${id}`);
    this.valores.push({ id, grandeza: v.grandeza, unidade: v.unidade, impresso, fonte: `impressora.prn:${i + 1}`, ...(v.casas !== undefined && { casas: v.casas }), ...(v.trunca && { trunca: true }), ...(v.obs && { obs: v.obs }) });
  }
  /** Índice da primeira (ou última) linha que casa com re, a partir de `desde`. */
  achar(re: RegExp, desde = 0, ultima = false): number {
    let achou = -1;
    for (let i = desde; i < this.linhas.length; i++)
      if (re.test(this.linhas[i]!)) {
        if (!ultima) return i;
        achou = i;
      }
    if (achou < 0) throw new Error(`não achei ${re} na impressora.prn`);
    return achou;
  }
}

const N = String.raw`(-?\d*\.?\d+)`;
const S = String.raw`\s+`;

// ------------------------------------------------------------ caso a: LAJECALC + LAJEGEOM 7

/** Tabelas de espessura do LAJECALC: "L1  7.0  0.382  0  # 6.3 c/ 7.5  0.10  0.15  0.17  0.43". */
const RE_ESPESSURA = new RegExp(String.raw`^\s*(L\d+)${S}${N}${S}${N}${S}${N}${S}#\s*${N}\s*c/\s*${N}${S}${N}${S}${N}${S}${N}${S}${N}`);
const RE_4COL = new RegExp(String.raw`^\s*(L\d+)${S}${N}${S}${N}${S}${N}${S}${N}${S}${N}\s*$`);

function linhasDaTabela(c: Coleta, cab: RegExp, re: RegExp, ultima = false) {
  const i0 = c.achar(cab, 0, ultima);
  const fim = c.achar(/Fck|Total das Cargas/, i0);
  const out: { m: RegExpMatchArray; i: number }[] = [];
  for (let i = i0 + 1; i < fim; i++) {
    const m = c.linhas[i]!.match(re);
    if (m) out.push({ m, i });
  }
  if (!out.length) throw new Error(`tabela vazia depois de ${cab}`);
  return out;
}

function casoA(c: Coleta) {
  for (const { m, i } of linhasDaTabela(c, /CALCULO DAS ESPESSURAS MINIMAS/, RE_ESPESSURA)) {
    const L = m[1]!;
    c.add(`${L}.Hmin`, m[2]!, i, { grandeza: `${L} espessura mínima`, unidade: "cm" });
    c.add(`${L}.Hmin.x/d`, m[3]!, i, { grandeza: `${L} x/d com H mínimo`, unidade: "" });
    c.add(`${L}.Hmin.As.phi`, m[5]!, i, { grandeza: `${L} bitola da armadura com H mínimo`, unidade: "mm" });
    c.add(`${L}.Hmin.As.s`, m[6]!, i, { grandeza: `${L} espaçamento da armadura com H mínimo`, unidade: "cm" });
    c.add(`${L}.Hmin.pp`, m[9]!, i, { grandeza: `${L} peso próprio com H mínimo`, unidade: "t/m2" });
    c.add(`${L}.Hmin.p`, m[10]!, i, { grandeza: `${L} carga total com H mínimo`, unidade: "t/m2" });
  }
  for (const { m, i } of linhasDaTabela(c, /IMPOSICAO DAS ESPESSURAS/, RE_ESPESSURA)) {
    const L = m[1]!;
    c.add(`${L}.H`, m[2]!, i, { grandeza: `${L} espessura imposta`, unidade: "cm" });
    c.add(`${L}.x/d`, m[3]!, i, { grandeza: `${L} x/d com H imposto`, unidade: "" });
    c.add(`${L}.As.phi`, m[5]!, i, { grandeza: `${L} bitola da armadura (tabela de espessuras)`, unidade: "mm" });
    c.add(`${L}.As.s`, m[6]!, i, { grandeza: `${L} espaçamento da armadura (tabela de espessuras)`, unidade: "cm" });
    c.add(`${L}.pp`, m[9]!, i, { grandeza: `${L} peso próprio`, unidade: "t/m2" });
    c.add(`${L}.p`, m[10]!, i, { grandeza: `${L} carga total p`, unidade: "t/m2" });
  }
  // momentos e armaduras: a última impressão (depois da otimização dos negativos)
  const obs = "última impressão, depois da otimização dos negativos";
  for (const { m, i } of linhasDaTabela(c, /MOMENTOS ATUANTES NAS LAJES/, RE_4COL, true)) {
    const L = m[1]!;
    c.add(`${L}.M+princ`, m[3]!, i, { grandeza: `${L} M+ principal`, unidade: "tm/m", obs });
    c.add(`${L}.M+sec`, m[4]!, i, { grandeza: `${L} M+ secundário`, unidade: "tm/m", obs });
    c.add(`${L}.M-maior`, m[5]!, i, { grandeza: `${L} M− maior`, unidade: "tm/m", obs });
    c.add(`${L}.M-menor`, m[6]!, i, { grandeza: `${L} M− menor`, unidade: "tm/m", obs });
  }
  for (const { m, i } of linhasDaTabela(c, /ARMADURAS NAS LAJES/, RE_4COL, true)) {
    const L = m[1]!;
    c.add(`${L}.As+princ`, m[3]!, i, { grandeza: `${L} As+ principal`, unidade: "cm2/m", obs });
    c.add(`${L}.As+sec`, m[4]!, i, { grandeza: `${L} As+ secundário`, unidade: "cm2/m", obs });
    c.add(`${L}.As-maior`, m[5]!, i, { grandeza: `${L} As− maior`, unidade: "cm2/m", obs });
    c.add(`${L}.As-menor`, m[6]!, i, { grandeza: `${L} As− menor`, unidade: "cm2/m", obs });
  }
  // reações de lajes nas vigas (LAJEGEOM 7): sub-área, área, cargas lineares, apoio
  const reSub = new RegExp(String.raw`^\s*(L\d+)?${S}(\d+)${S}${N} m2${S}${N}${S}${N}${S}${N}${S}${N}${S}(V\d+)`);
  let laje = "";
  const i0 = c.achar(/REACOES DE LAJES NAS VIGAS/);
  for (let i = i0; i < c.achar(/Total das Cargas por Area/, i0); i++) {
    const m = c.linhas[i]!.match(reSub);
    if (!m) continue;
    laje = m[1] ?? laje;
    const k = `${laje}>${m[8]}`;
    c.add(`${k}.area`, m[3]!, i, { grandeza: `${laje} área de influência no apoio ${m[8]} (sub-área ${m[2]})`, unidade: "m2" });
    c.add(`${k}.qArea`, m[5]!, i, { grandeza: `${laje} → ${m[8]} carga linear de ocupação`, unidade: "t/m" });
    c.add(`${k}.qEstru`, m[6]!, i, { grandeza: `${laje} → ${m[8]} carga linear de estrutura (permanente)`, unidade: "t/m" });
    c.add(`${k}.qPeso`, m[7]!, i, { grandeza: `${laje} → ${m[8]} carga linear (Peso)`, unidade: "t/m" });
  }
  const totais: [string, RegExp, string][] = [
    ["total.cargasArea", /Total das Cargas por Area \.+/, "total das cargas por área"],
    ["total.cargasAreaConsiderado", /Total Considerado das Cargas por Area \.+/, "total considerado das cargas por área"],
    ["total.ppVigas", /Total do Peso Proprio das Vigas \.+/, "peso próprio das vigas"],
    ["total.ppLajes", /Total do Peso Proprio das Lajes \.+/, "peso próprio das lajes"],
    ["total.estrutura", /Total das Cargas de Estrutura \.+/, "cargas de estrutura"],
    ["total.painel", /Total das Cargas no Painel \.+/, "total das cargas no painel"],
    ["total.vigas", /Total das Cargas aplicadas nas Vigas \.+/, "cargas aplicadas nas vigas"],
    ["total.pilares", /Total das Cargas aplicadas nos Pilares \.+/, "cargas aplicadas nos pilares"],
    ["total.vigasPilares", /Total das Cargas aplicadas nas Vigas\+Pilares \.+/, "cargas aplicadas nas vigas + pilares"],
  ];
  for (const [id, re, grandeza] of totais) {
    const i = c.achar(re);
    c.add(id, c.linhas[i]!.match(new RegExp(String.raw`${N}\s*t\s*$`))![1]!, i, { grandeza, unidade: "t" });
  }
}

// ------------------------------------------------------------ caso b: VIGA opção 7 e .REP

function casoB(c: Coleta) {
  const iRep = c.achar(/Reacoes de Apoio/);
  const inicios = c.linhas.flatMap((l, i) => (/^\s*VIGA-(V\d+)/.test(l) && i < iRep ? [i] : []));
  inicios.forEach((i0, k) => {
    const V = c.linhas[i0]!.match(/VIGA-(V\d+)/)![1]!;
    const fim = inicios[k + 1] ?? iRep;
    let secao = "";
    let tramo = 0;
    for (let i = i0 + 1; i < fim; i++) {
      const l = c.linhas[i]!;
      if (/TRAMO\s+L\(m\)/.test(l)) secao = "dados";
      else if (/APOIO\s+M-/.test(l)) secao = "apoios";
      else if (/TRAMO\s+Ve\(t\)/.test(l)) secao = "tramos";
      let m: RegExpMatchArray | null;
      if ((m = l.match(/soma das reacoes estaticas\s+(\S+)\s*t/)))
        c.add(`${V}.somaR`, m[1]!, i, { grandeza: `${V} soma das reações estáticas`, unidade: "t" });
      else if ((m = l.match(/Momento Engastamento Perfeito apoio\((\d+)\)\s+(\S+)\s*tm/)))
        c.add(`${V}.MEP${m[1]}`, m[2]!, i, { grandeza: `${V} momento de engastamento perfeito no apoio ${m[1]}`, unidade: "tm" });
      else if (secao === "dados" && (m = l.match(new RegExp(String.raw`^\s*(\d+)${S}${N}${S}${N}\s*$`)))) tramo = Number(m[1]);
      else if (secao === "dados" && (m = l.match(new RegExp(String.raw`^${S}${N}${S}${N}${S}${N}\s*$`))))
        c.add(`${V}.t${tramo}.P`, m[1]!, i, { grandeza: `${V} tramo ${tramo} carga distribuída P`, unidade: "t/m" });
      else if (secao === "apoios" && (m = l.match(new RegExp(String.raw`^\s*(\d+)${S}${N}${S}${N}\s+P\s*(\d+)`)))) {
        const obs = `apoio no pilar P${m[4]}`;
        c.add(`${V}.a${m[1]}.M-`, m[2]!, i, { grandeza: `${V} apoio ${m[1]} M−`, unidade: "tm", obs });
        c.add(`${V}.a${m[1]}.R`, m[3]!, i, { grandeza: `${V} apoio ${m[1]} reação`, unidade: "t", obs });
      } else if (secao === "tramos" && (m = l.match(new RegExp(String.raw`^\s*(\d+)${S}${N}${S}${N}${S}${N}${S}${N}${S}${N}\s*$`)))) {
        const t = m[1];
        c.add(`${V}.t${t}.Ve`, m[2]!, i, { grandeza: `${V} tramo ${t} cortante à esquerda`, unidade: "t" });
        c.add(`${V}.t${t}.x`, m[3]!, i, { grandeza: `${V} tramo ${t} posição do M+`, unidade: "m" });
        c.add(`${V}.t${t}.M+`, m[4]!, i, { grandeza: `${V} tramo ${t} M+`, unidade: "tm" });
        c.add(`${V}.t${t}.Vd`, m[5]!, i, { grandeza: `${V} tramo ${t} cortante à direita`, unidade: "t" });
        c.add(`${V}.t${t}.fEJ`, m[6]!, i, { grandeza: `${V} tramo ${t} flecha × EJ`, unidade: "" });
      }
    }
  });
  // .REP: carga total por pilar e as parcelas de cada viga, truncadas (FIX) na 2ª casa
  let pilar = "";
  for (let i = iRep; i < c.linhas.length; i++) {
    const l = c.linhas[i]!;
    for (const m of l.matchAll(/P\s*(\d+)\s+-\s+(\d*\.?\d+)/g))
      c.add(`REP.P${m[1]}`, m[2]!, i, { grandeza: `P${m[1]} carga total no .REP`, unidade: "t", obs: "soma das parcelas, cada uma truncada na 2ª casa" });
    let m = l.match(/^\s*P\s*(\d+)\s+carga\s+(.*)$/);
    if (m) {
      pilar = `P${m[1]}`;
      for (const p of m[2]!.matchAll(/(-?\d*\.?\d+)\s+\((V\d+)\)/g))
        c.add(`REP.${pilar}.carga.${p[2]}`, p[1]!, i, { grandeza: `${pilar} parcela da carga vinda de ${p[2]}`, unidade: "t", casas: 2, trunca: true });
    }
    m = l.match(/^\s*momento\s*(.*)$/);
    if (m && pilar)
      for (const p of m[1]!.matchAll(/(-?\d*\.?\d+)@(\d+)\s+\[(\d+)\]\s+\((V\d+)\)/g))
        c.add(`REP.${pilar}.momento.${p[4]}`, p[1]!, i, { grandeza: `${pilar} momento vindo de ${p[4]}`, unidade: "tm", casas: 2, trunca: true, obs: `impresso "${p[1]}@${p[2]} [${p[3]}]"` });
  }
}

// ------------------------------------------------------------ caso c: PILAR opção 6

function casoC(c: Coleta) {
  let m: RegExpMatchArray | null;
  for (const [eixo, re] of [["x", /Jx = (\S+) cm4/], ["y", /Jy = (\S+) cm4/]] as const) {
    const i = c.achar(re);
    c.add(`P.J${eixo}`, c.linhas[i]!.match(re)![1]!, i, { grandeza: `momento de inércia J${eixo}`, unidade: "cm4" });
  }
  const iL = c.achar(/Lambda x =/);
  m = c.linhas[iL]!.match(/Lambda x = (\S+)\s+Lambda y = (\S+)/)!;
  c.add("P.lambdaX", m[1]!, iL, { grandeza: "esbeltez λx", unidade: "" });
  c.add("P.lambdaY", m[2]!, iL, { grandeza: "esbeltez λy", unidade: "" });
  let caso = "";
  let resistente = false;
  for (let i = iL + 1; i < c.linhas.length; i++) {
    const l = c.linhas[i]!;
    if ((m = l.match(/Situacao - (.+?)\s+caso (\d+)\/\d+/))) {
      caso = `c${m[2]}`;
      resistente = false;
      c.add(`${caso}.situacao`, m[1]!, i, { grandeza: `caso ${m[2]}: situação`, unidade: "" });
      continue;
    }
    if (!caso) continue;
    if (/Esforcos resistentes/.test(l)) resistente = true;
    else if (!resistente && (m = l.match(/^\s*M([xy]) = .*=\s*(\S+) \(tm\)/)))
      c.add(`${caso}.M${m[1]}`, m[2]!, i, { grandeza: `caso ${caso.slice(1)}: momento solicitante M${m[1]}`, unidade: "tm" });
    else if (!resistente && (m = l.match(/Mtotal=\s*(\S+) tm\s+incl (\S+) graus/))) {
      c.add(`${caso}.Mtotal`, m[1]!, i, { grandeza: `caso ${caso.slice(1)}: momento solicitante total`, unidade: "tm" });
      c.add(`${caso}.incl`, m[2]!, i, { grandeza: `caso ${caso.slice(1)}: inclinação do momento`, unidade: "graus" });
    } else if (resistente && (m = l.match(/^\s*M([xy])=\s*(\S+)\(1a\)(?:-\s*(\S+)\(2a\))?=\s*(\S+) tm/))) {
      const g = `caso ${caso.slice(1)}: momento resistente M${m[1]}`;
      c.add(`${caso}.MR${m[1]}1a`, m[2]!, i, { grandeza: `${g} de 1ª ordem`, unidade: "tm" });
      if (m[3]) c.add(`${caso}.MR${m[1]}2a`, m[3], i, { grandeza: `${g}, parcela de 2ª ordem`, unidade: "tm" });
      c.add(`${caso}.MR${m[1]}`, m[4]!, i, { grandeza: g, unidade: "tm" });
    } else if (resistente && (m = l.match(/Mtotal=\s*(\S+?)\s*tm/)))
      c.add(`${caso}.MRtotal`, m[1]!, i, { grandeza: `caso ${caso.slice(1)}: momento resistente total`, unidade: "tm" });
    else if ((m = l.match(/ln= (\S+) graus\s+Xln= (\S+) cm\s+1\/r= (\S+)/))) {
      c.add(`${caso}.ln`, m[1]!, i, { grandeza: `caso ${caso.slice(1)}: inclinação da linha neutra`, unidade: "graus" });
      c.add(`${caso}.Xln`, m[2]!, i, { grandeza: `caso ${caso.slice(1)}: profundidade da linha neutra`, unidade: "cm" });
      c.add(`${caso}.1/r`, m[3]!, i, { grandeza: `caso ${caso.slice(1)}: curvatura 1/r`, unidade: "10-3/cm" });
    } else if ((m = l.match(/Def con\s+(\S+) \/oo\s+Def aco\s+(\S+) \/oo/))) {
      c.add(`${caso}.defCon`, m[1]!, i, { grandeza: `caso ${caso.slice(1)}: deformação do concreto`, unidade: "‰" });
      c.add(`${caso}.defAco`, m[2]!, i, { grandeza: `caso ${caso.slice(1)}: deformação do aço`, unidade: "‰" });
    } else if ((m = l.match(/^\s*(ok|nao ok|não ok|insuficiente.*)\s*$/i)))
      c.add(`${caso}.veredito`, m[1]!, i, { grandeza: `caso ${caso.slice(1)}: veredito`, unidade: "" });
  }
}

// ------------------------------------------------------------ caso c': PILAREDI

const COLS_PILAREDI = [
  ["Mkx", "Mk atuante x", "tm"],
  ["Mky", "Mk atuante y", "tm"],
  ["Mktot", "Mk atuante total", "tm"],
  ["MRx1a", "Mk resistente x, 1ª ordem", "tm"],
  ["MRx2a", "Mk resistente x, 2ª ordem", "tm"],
  ["MRy1a", "Mk resistente y, 1ª ordem", "tm"],
  ["MRy2a", "Mk resistente y, 2ª ordem", "tm"],
  ["MRtot", "Mk resistente total", "tm"],
  ["incLN", "inclinação da linha neutra", "graus"],
  ["1/r", "curvatura 1/r", "10-3/cm"],
  ["x/d", "x/d", ""],
  ["defCon", "deformação do concreto", "‰"],
  ["defAco", "deformação do aço", "‰"],
] as const;

function casoPilaredi(c: Coleta) {
  let m: RegExpMatchArray | null;
  const iCol = c.achar(/COLUNA - /);
  const P = `P${c.linhas[iCol]!.match(/COLUNA - P\s*(\d+)/)![1]}`;
  let i = c.achar(/Lbx=/);
  m = c.linhas[i]!.match(/Lbx=\s*(\S+)\s+Lby=\s*(\S+)/)!;
  c.add(`${P}.lambdaX`, m[1]!, i, { grandeza: `${P} esbeltez λx`, unidade: "" });
  c.add(`${P}.lambdaY`, m[2]!, i, { grandeza: `${P} esbeltez λy`, unidade: "" });
  i = c.achar(/Nk =/);
  c.add(`${P}.Nk`, c.linhas[i]!.match(/Nk =\s*(\S+) t/)![1]!, i, { grandeza: `${P} Nk (carga do .REP + peso próprio)`, unidade: "t" });
  i = c.achar(/Cobrimento/);
  c.add(`${P}.cobrimento`, c.linhas[i]!.match(/Cobrimento\s+(\S+) cm/)![1]!, i, { grandeza: `${P} cobrimento`, unidade: "cm" });
  let num = "";
  const reCaso = new RegExp(String.raw`^\s*(\d?)([ef])` + `${S}${N}`.repeat(13) + String.raw`\s*$`);
  for (let k = c.achar(/caso\s+Mkx/); k < c.linhas.length; k++) {
    if (!(m = c.linhas[k]!.match(reCaso))) continue;
    num = m[1] || num;
    const caso = `${num}${m[2]}`;
    COLS_PILAREDI.forEach(([id, g, u], j) => c.add(`${P}.${caso}.${id}`, m![3 + j]!, k, { grandeza: `${P} caso ${caso}: ${g}`, unidade: u }));
  }
  i = c.achar(/As\s+\S+ cm2\s+Taxa/);
  m = c.linhas[i]!.match(/As\s+(\S+) cm2\s+Taxa\s+(\S+)%\s+(\d+)\s+#\s*(\S+)\s+#\s*(\S+)\s+c\/\s*(\S+)/)!;
  c.add(`${P}.As`, m[1]!, i, { grandeza: `${P} armadura As`, unidade: "cm2" });
  c.add(`${P}.taxa`, m[2]!, i, { grandeza: `${P} taxa de armadura`, unidade: "%" });
  c.add(`${P}.barras.n`, m[3]!, i, { grandeza: `${P} número de barras`, unidade: "" });
  c.add(`${P}.barras.phi`, m[4]!, i, { grandeza: `${P} bitola das barras`, unidade: "mm" });
  c.add(`${P}.estribo.phi`, m[5]!, i, { grandeza: `${P} bitola do estribo`, unidade: "mm" });
  c.add(`${P}.estribo.s`, m[6]!, i, { grandeza: `${P} espaçamento do estribo`, unidade: "cm" });
}

// ------------------------------------------------------------ casos

/** Entrada de cada caso (do roteiro em $ORACULO/casos/<caso>.txt) e o extrator. */
export const CASOS: Record<string, { programa: string; descricao: string; entrada: Record<string, unknown>; extrair: (c: Coleta) => void }> = {
  caso_a_laje: {
    programa: "LAJECALC + LAJEGEOM 7",
    descricao:
      "Obra E2E: painel 2×2 de lajes maciças 4×5 m (eixos x 0/4/8, y 0/5/10), carga permanente 0,10 e acidental 0,15 t/m², h imposto 10 cm, otimização dos negativos; LAJEGEOM 7 gera vigas e reações (peso próprio das vigas 0,12 t/m nas de 4 m e 0,15 t/m nas de 5 m).",
    entrada: {
      eixosX_m: [0, 4, 8],
      eixosY_m: [0, 5, 10],
      lajes: { L1: { x: 0, y: 5 }, L2: { x: 4, y: 5 }, L3: { x: 0, y: 0 }, L4: { x: 4, y: 0 }, lx_m: 4, ly_m: 5 },
      pilares: { P1: [0, 0], P2: [4, 0], P3: [8, 0], P4: [8, 5], P5: [4, 5], P6: [0, 5], P7: [0, 10], P8: [4, 10], P9: [8, 10] },
      vigas: { V1: "y=10", V2: "y=5", V3: "y=0", V4: "x=0", V5: "x=4", V6: "x=8" },
      h_cm: 10,
      cargaPermanente_tm2: 0.1,
      acidental_tm2: 0.15,
      ppVigas_tm: { V1: 0.12, V2: 0.12, V3: 0.12, V4: 0.15, V5: 0.15, V6: 0.15 },
      fck_tcm2: 0.15,
      fyk_tcm2: 5,
      classeAco: "B",
      cobrimentoLaje_cm: 1.5,
      densidadeConcreto_tm3: 2.5,
    },
    extrair: casoA,
  },
  caso_b_viga: {
    programa: "VIGA opção 7",
    descricao: "As 6 vigas da obra E2E (E2E.VIG gerado no caso a), VIGA.INI de fábrica (acidentais N, redução 100 %, reação estática); gera o E2E.REP.",
    entrada: { obra: "E2E (caso_a_laje)", vigas: "V1..V3 2×4 m, V4..V6 2×5 m", acidentais: "N", reacao: "estática" },
    extrair: casoB,
  },
  caso_c_pilar: {
    programa: "PILAR opção 6",
    descricao: "Verificação NB-1/78 do P5 da obra E2E: seção 20×20, c' 3 cm, 2 + 2 barras de 12,5 mm, Nk 17,37 t, Mk 0, le 3 m.",
    entrada: { b_cm: 20, h_cm: 20, cLinha_cm: 3, barras: "2 em cima + 2 embaixo, 12.5 mm", Nk_t: 17.37, Mxk_tm: 0, Myk_tm: 0, lex_m: 3, ley_m: 3, fck_tcm2: 0.15, fyk_tcm2: 5, classeAco: "B" },
    extrair: casoC,
  },
  caso_c_pilaredi: {
    programa: "PILAREDI",
    descricao: "Edifícios: P5 da obra E2E (carga do E2E.REP 17,37 t), níveis FUND 0 e PAV1 3 m, seção 20×20, predimensionamento e dimensionamento com os padrões.",
    entrada: { pilar: "P5", carga_REP_t: 17.37, niveis: { FUND: 0, PAV1: 3 }, b_cm: 20, h_cm: 20, fck_tcm2: 0.15, fyk_tcm2: 5, classeAco: "B" },
    extrair: casoPilaredi,
  },
};

/** Runs do oráculo da seção 2 do PLANO. */
export const RUNS_PADRAO: Record<string, string> = {
  caso_a_laje: "caso_a_laje-20261015-041425",
  caso_b_viga: "caso_b_viga-20261014-182718",
  caso_c_pilar: "caso_c_pilar-20261014-182757",
  caso_c_pilaredi: "caso_c_pilaredi-20261015-041842",
};

/** Extrai o caso das linhas de uma impressora.prn. */
export function extrairCaso(caso: string, linhas: readonly string[]): ValorRef[] {
  const def = CASOS[caso];
  if (!def) throw new Error(`caso desconhecido: ${caso} (conheço ${Object.keys(CASOS).join(", ")})`);
  const c = new Coleta(linhas);
  def.extrair(c);
  return c.valores;
}

export function casoDoRun(caso: string, run: string): CasoRef {
  const def = CASOS[caso]!;
  const valores = extrairCaso(caso, linhasPrn(readFileSync(join(run, "impressora.prn"))));
  return { caso, run: runDoCaso(run), programa: def.programa, descricao: def.descricao, entrada: def.entrada, valores };
}

if (import.meta.main) {
  const args = process.argv.slice(2);
  const opt = (n: string, p: string) => (args.includes(n) ? args[args.indexOf(n) + 1]! : p);
  const saida = resolve(opt("--saida", join(dirname(fileURLToPath(import.meta.url)), "..", "casos")));
  const padrao = args.includes("--padrao");
  const runs = padrao ? opt("--runs", "") || join(pastaOraculo(), "runs") : "";
  const pares: [string, string][] = padrao
    ? Object.entries(RUNS_PADRAO).map(([c, r]) => [c, join(runs, r)])
    : [[args[0]!, args[1]!]];
  if (!pares[0]![0] || !pares[0]![1]) {
    console.error("uso: bun paridade/original/extrair.ts <caso> <pasta do run> [--saida <pasta>] | --padrao");
    process.exit(2);
  }
  mkdirSync(saida, { recursive: true });
  for (const [caso, run] of pares) {
    const c = casoDoRun(caso, resolve(run));
    writeFileSync(join(saida, `${caso}.json`), `${JSON.stringify(c, null, 1)}\n`);
    console.log(`${caso}: ${c.valores.length} valores de ${run} → ${join(saida, `${caso}.json`)}`);
  }
}
