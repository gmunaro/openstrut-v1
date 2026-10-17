// Cruzamento original × V2 por id, dentro de cada caso, a classificação das diferenças
// do modo corrigido e o relatório em Markdown.
import type { CasoRef, ValorRef } from "./caso";
import { bate, bateTruncado, casasDoTexto, lerNumero, tolerancia } from "./numero";

/** igual: dentro da tolerância; DIFERE: fora; sem par: a V2 não dá esse id. */
export type Situacao = "igual" | "DIFERE" | "sem par";
export const SITUACOES: readonly Situacao[] = ["igual", "DIFERE", "sem par"];

/** O que a V2 devolve para um id: número nas unidades do original (NaN = a V2 não
 *  calculou o elemento) ou texto (ex.: "#6.3c/12.5"). */
export type ValorV2 = number | string;

/** Diferença do modo corrigido: esperada (um item do MODO-CALCULO muda o número) ou
 *  inesperada (nenhum muda, ou o id já difere no modo original). */
export type Classe = "esperada" | "inesperada";

export interface Linha {
  ref: ValorRef;
  v2?: ValorV2 | undefined;
  situacao: Situacao;
  /** Sem par: o motivo; DIFERE do original: o diagnóstico; DIFERE do corrigido: a
   *  classificação. Ausente = sem justificativa. */
  nota?: string | undefined;
  /** Só no modo corrigido, nas DIFERE. */
  classe?: Classe | undefined;
  /** A classe inesperada vem do modo original (o id já difere lá). */
  herdada?: boolean | undefined;
  /** Faixa que os itens com faixa permitem para o id, nas unidades dele. */
  faixa?: number | undefined;
}

/** Um modo calculado de um caso. */
export interface ResultadoModo {
  linhas: Linha[];
  avisos: string[];
}

/** Bloco do relatório: um arquivo de caso e os dois modos da V2. */
export interface Bloco {
  arquivo: string;
  caso?: CasoRef;
  /** JSON inválido ou montagem da V2 que falhou. */
  erro?: string;
  /** Não há `paridade/v2/obras/<caso>.ts`: todos os valores ficam sem par. */
  semMontagem?: boolean;
  original?: ResultadoModo;
  corrigido?: ResultadoModo;
}

const normTexto = (s: string) => s.trim().replace(/\s+/g, " ").toLowerCase();

/** Valor de referência como número: valor e casas (as do texto, salvo `casas` no JSON). */
export function numeroRef(ref: ValorRef): { valor: number; casas: number | null } | null {
  const valor = lerNumero(ref.impresso);
  if (valor === null) return null;
  return { valor, casas: ref.casas ?? casasDoTexto(ref.impresso) };
}

/** Situação de um valor: número com a tolerância de meia unidade da última casa impressa
 *  (ou truncado, se `trunca`); texto por igualdade sem diferença de caixa e espaços. */
export function situacao(ref: ValorRef, v2: ValorV2 | undefined): Situacao {
  if (v2 === undefined) return "sem par";
  // número com marca na tela ("27.00*": acima do limite): o número e a marca
  const marcado = /^\s*(\S+?)\*\s*$/.exec(ref.impresso);
  if (marcado && lerNumero(marcado[1]!) !== null) {
    const m2 = typeof v2 === "string" ? /^\s*(\S+?)\*\s*$/.exec(v2) : null;
    return m2 ? situacao({ ...ref, impresso: marcado[1]! }, m2[1]!) : "DIFERE";
  }
  const n = numeroRef(ref);
  if (n === null) return normTexto(String(v2)) === normTexto(ref.impresso) ? "igual" : "DIFERE";
  const x = typeof v2 === "number" ? v2 : lerNumero(v2);
  if (x === null) return "DIFERE";
  const ok = ref.trunca && n.casas !== null ? bateTruncado({ valor: n.valor, casas: n.casas }, x) : bate(n, x);
  return ok ? "igual" : "DIFERE";
}

/** Casa os valores do caso com o mapa da V2 pelo id. */
export const compararCaso = (caso: CasoRef, v2: ReadonlyMap<string, ValorV2>): Linha[] =>
  caso.valores.map((ref) => ({ ref, v2: v2.get(ref.id), situacao: situacao(ref, v2.get(ref.id)) }));

/** O quanto um item do MODO-CALCULO pode mudar um número no corrigido:
 *  - relativo: até `max`·|original| (materiais);
 *  - absoluto: até `max` (truncamentos que o corrigido tira: R5, V-a);
 *  - caminho: troca o caminho do cálculo e não tem faixa; só explica uma diferença
 *    quando o caso mostra o item ativo (`RegraCorrigido.ativos`);
 *  - naoSeAplica: o item existe, mas a condição dele não ocorre nestes casos. */
export type Efeito =
  | { tipo: "relativo"; max: number }
  | { tipo: "absoluto"; max: number }
  | { tipo: "caminho" }
  | { tipo: "naoSeAplica"; porque: string };

export interface ItemCorrigido {
  codigo: string;
  nome: string;
  efeito: Efeito;
  /** Item de caminho que, ativo no caso, é a causa da diferença mesmo dentro da faixa dos
   *  outros itens (a nota o nomeia primeiro). */
  principal?: boolean | undefined;
}

/** Regra de um id no modo corrigido: os itens que podem mudá-lo e, nas grandezas
 *  discretas, a tabela de valores (os materiais movem no máximo um passo). */
export interface RegraCorrigido {
  itens: ItemCorrigido[];
  /** Códigos dos itens de caminho com evidência neste caso. */
  ativos: readonly string[];
  tabela?: readonly number[] | undefined;
  /** Nome do item ativo com o qual a grandeza deixa de existir no corrigido. */
  someNoCorrigido?: string | undefined;
  /** Texto "#φc/s" do LAJEPROC: tabelas de bitola e de espaçamento. */
  tabelasTexto?: { bitola: readonly number[]; espacamento: readonly number[] } | undefined;
  /** Arranjo de viga "n#φ+m#ψ" do DESDIM: área de cada bitola (cm², a tabela do .DSP) e a
   *  As da mesma seção no original e no corrigido. A troca é dos materiais quando a As
   *  cruza a capacidade de um dos dois arranjos. */
  arranjo?: { areas: Readonly<Record<string, number>>; asOriginal: number; asCorrigido: number } | undefined;
}

/** Uma unidade da última casa impressa (a precisão); no formato livre, a tolerância. */
function unidade(ref: ValorRef) {
  const n = numeroRef(ref);
  if (!n) return 0;
  return n.casas === null ? tolerancia(n) : 10 ** -n.casas;
}

/** Índice do valor mais próximo na tabela. */
const indice = (tabela: readonly number[], x: number) =>
  tabela.reduce((melhor, v, i) => (Math.abs(v - x) < Math.abs(tabela[melhor]! - x) ? i : melhor), 0);
const umPasso = (tabela: readonly number[], a: number, b: number) => Math.abs(indice(tabela, a) - indice(tabela, b)) <= 1;
const barraDeLaje = (t: string) => {
  const m = /^#([\d.]+)c\/([\d.]+)$/.exec(t.trim());
  return m ? { bitola: Number(m[1]), espacamento: Number(m[2]) } : null;
};

/** Classe de uma DIFERE do corrigido. `orig` é o mesmo id no modo original; `regra`, os
 *  itens que mudam a família do id (undefined = família sem regra).
 *  Esperada: a diferença cabe na faixa dos itens (precisão + materiais + truncamentos,
 *  ou um passo da tabela), ou passa dela com um item de caminho ativo no caso.
 *  Inesperada: o id já difere no original; a V2 não deu número (NaN, texto, "NAO", "")
 *  onde o original deu; ou a diferença passa da faixa sem item de caminho ativo. */
export function classificar(corr: Linha, orig: Linha | undefined, regra: RegraCorrigido | undefined): Pick<Linha, "classe" | "nota" | "herdada" | "faixa"> {
  if (orig?.situacao === "DIFERE") return { classe: "inesperada", herdada: true, nota: "já difere no modo original (ver o diagnóstico)" };
  if (!regra) return { classe: "inesperada", nota: "família de id sem regra em FAMILIAS_CORRIGIDO" };
  const nomes = (cs: readonly ItemCorrigido[]) => cs.map((c) => c.nome).join("; ");
  const comFaixa = regra.itens.filter((i) => i.efeito.tipo === "relativo" || i.efeito.tipo === "absoluto");
  const caminho = regra.itens.filter((i) => i.efeito.tipo === "caminho" && regra.ativos.includes(i.codigo));
  const materiais = regra.itens.some((i) => i.efeito.tipo === "relativo");
  const principais = caminho.filter((i) => i.principal);
  const acima = (porque: string) =>
    caminho.length
      ? { classe: "esperada" as const, nota: `${porque}; atribuída a ${nomes(caminho)}, ativo no caso` }
      : { classe: "inesperada" as const, nota: `${porque}, sem item de caminho ativo no caso` };

  const n = numeroRef(corr.ref);
  // item principal ativo: a diferença é dele, com os outros itens ativos e com faixa junto
  if (principais.length) {
    const x = typeof corr.v2 === "number" ? corr.v2 : corr.v2 === undefined ? null : lerNumero(corr.v2);
    if (n && (x === null || !Number.isFinite(x))) return { classe: "inesperada", nota: "a V2 não deu número no corrigido" };
    const outros = [...caminho.filter((i) => !i.principal), ...comFaixa];
    return { classe: "esperada", nota: `${nomes(principais)}, ativo no caso${outros.length ? `; com ${nomes(outros)}` : ""}` };
  }
  if (!n) {
    // texto: arranjo de barras
    const t = typeof corr.v2 === "string" ? corr.v2.trim() : "";
    if (!t || /^NAO$/i.test(t)) return { classe: "inesperada", nota: "a V2 não deu arranjo no corrigido" };
    const ar = regra.arranjo;
    if (materiais && ar) {
      const area = (x: string) => {
        let soma = 0;
        for (const g of x.split("+")) {
          const m = /^(\d*)#([\d.]+)$/.exec(g.trim());
          if (!m) return NaN;
          const a = ar.areas[String(Number(m[2]))];
          if (a === undefined) return NaN;
          soma += (m[1] ? Number(m[1]) : 1) * a;
        }
        return soma;
      };
      const [aO, aC] = [area(corr.ref.impresso), area(t)];
      if (Number.isFinite(aO) && Number.isFinite(aC) && (aC < ar.asOriginal - 1e-9 || aO < ar.asCorrigido - 1e-9))
        return { classe: "esperada", nota: `${nomes(comFaixa)}: a As cruza a capacidade do arranjo` };
    }
    const [a, b] = [barraDeLaje(corr.ref.impresso), barraDeLaje(t)];
    const tt = regra.tabelasTexto;
    if (materiais && tt && a && b && umPasso(tt.bitola, a.bitola, b.bitola) && umPasso(tt.espacamento, a.espacamento, b.espacamento))
      return { classe: "esperada", nota: `${nomes(comFaixa)}: um passo da tabela` };
    return acima("arranjo além de um passo da tabela");
  }
  const x = typeof corr.v2 === "number" ? corr.v2 : corr.v2 === undefined ? null : lerNumero(corr.v2);
  if (x === null || !Number.isFinite(x))
    return regra.someNoCorrigido
      ? { classe: "esperada", nota: `${regra.someNoCorrigido}: a grandeza não existe no corrigido` }
      : { classe: "inesperada", nota: "a V2 não deu número no corrigido" };
  const d = Math.abs(x - n.valor);
  const u = unidade(corr.ref);
  if (d <= u + 1e-9) return { classe: "esperada", nota: "precisão (até 1 na última casa)" };
  if (regra.tabela && materiais) {
    if (umPasso(regra.tabela, n.valor, x)) return { classe: "esperada", nota: `${nomes(comFaixa)}: um passo da tabela` };
    return acima("mais de um passo da tabela");
  }
  const limite =
    u + regra.itens.reduce((s, i) => s + (i.efeito.tipo === "relativo" ? i.efeito.max * Math.abs(n.valor) : i.efeito.tipo === "absoluto" ? i.efeito.max : 0), 0);
  if (comFaixa.length && d <= limite + 1e-9) return { classe: "esperada", nota: `${nomes(comFaixa)}: dentro da faixa`, faixa: limite };
  return { ...acima(comFaixa.length ? `acima da faixa de ${nomes(comFaixa)}` : "grandeza sem item com faixa"), faixa: limite };
}

export const contar = (linhas: readonly Linha[], s: Situacao) => linhas.filter((l) => l.situacao === s).length;
const contarClasse = (linhas: readonly Linha[], c: Classe, herdada?: boolean) =>
  linhas.filter((l) => l.situacao === "DIFERE" && l.classe === c && (herdada === undefined || !!l.herdada === herdada)).length;

// ---------------------------------------------------------------- relatório

export interface Execucao {
  modo: "original" | "corrigido";
  v2: string;
  v2Commit: string;
  pastas: readonly string[];
  geradoEm: string;
}

function fmtV2(ref: ValorRef, v2: ValorV2 | undefined) {
  if (v2 === undefined) return "—";
  if (typeof v2 === "string") return v2;
  if (!Number.isFinite(v2)) return "sem número";
  const n = numeroRef(ref);
  return v2.toFixed((n?.casas ?? 2) + 2);
}

function fmtDif(ref: ValorRef, v2: ValorV2 | undefined) {
  const n = numeroRef(ref);
  if (!n || typeof v2 !== "number" || !Number.isFinite(v2)) return "";
  const d = v2 - n.valor;
  const rel = n.valor !== 0 ? ` (${((d / Math.abs(n.valor)) * 100).toFixed(1)} %)` : "";
  return `${d >= 0 ? "+" : ""}${d.toFixed((n.casas ?? 2) + 2)}${rel}`;
}

const esc = (s: string) => s.replace(/\|/g, "\\|");
const nomeBloco = (b: Bloco) => b.caso?.caso ?? b.arquivo;
const orig = (r: ValorRef) => `${r.impresso}${r.trunca ? " (trunc.)" : ""}`;

/** Agrupa linhas pela nota, na ordem em que aparecem. */
function porNota<T extends { linha: Linha }>(xs: readonly T[]) {
  const g = new Map<string, T[]>();
  for (const x of xs) {
    const k = x.linha.nota ?? "";
    g.set(k, [...(g.get(k) ?? []), x]);
  }
  return g;
}

export function relatorio(ex: Execucao, blocos: readonly Bloco[]): string {
  const ok = blocos.filter((b) => b.original && b.corrigido);
  const todasO = ok.flatMap((b) => b.original!.linhas);
  const todasC = ok.flatMap((b) => b.corrigido!.linhas);
  const erros = blocos.filter((b) => b.erro);
  const out: string[] = [];
  out.push(`# Paridade V2 × SISTRUT original (NB-1/78): detalhe do modo ${ex.modo}`, "");
  out.push(
    `- V2: \`${ex.v2}\` (${ex.v2Commit}); \`calcularObra(obra, nb178)\` e os números de \`resultado.sistrut\`, nos dois modos de \`obra.modoCalculo\``,
    `- Casos: ${ex.pastas.map((p) => `\`${p}\``).join(", ")}`,
    `- Gerado em ${ex.geradoEm}`,
    "- Unidades do original (t, tm, tm/m, cm, cm², cm²/m, mm).",
    "- Tolerância: meia unidade da última casa impressa pelo original (`trunca`: o original truncou, a V2 bate se FIX(V2·10ⁿ)/10ⁿ = original). Texto: igualdade sem caixa e espaços.",
    "- Modo original: igual / DIFERE (reprova) / sem par (a V2 não produz; não reprova). Modo corrigido: a V2 não precisa bater; cada DIFERE é esperada (um item do MODO-CALCULO muda o número) ou inesperada.",
    "",
  );
  const semNota = (ls: readonly Linha[], s: Situacao) => ls.filter((l) => l.situacao === s && !l.nota).length;
  out.push(
    `**Modo original** (${todasO.length} valores): igual ${contar(todasO, "igual")}, DIFERE ${contar(todasO, "DIFERE")} (sem diagnóstico: ${semNota(todasO, "DIFERE")}), sem par ${contar(todasO, "sem par")} (sem justificativa: ${semNota(todasO, "sem par")}).`,
    "",
    `**Modo corrigido** (${todasC.length} valores): igual ${contar(todasC, "igual")}, DIFERE ${contar(todasC, "DIFERE")}: esperada ${contarClasse(todasC, "esperada")}, inesperada ${contarClasse(todasC, "inesperada", false)}, inesperada que já difere no original ${contarClasse(todasC, "inesperada", true)}; sem par ${contar(todasC, "sem par")}.`,
    "",
  );
  if (erros.length) out.push(`**${erros.length} caso(s) com erro** (seção Erros).`, "");

  out.push(
    "## Resumo por caso",
    "",
    "| caso | programa | original: igual | DIFERE | sem par | corrigido: igual | esperada | inesperada | inesperada (já no original) | sem par |",
    "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|",
  );
  for (const b of blocos) {
    if (!b.original || !b.corrigido) {
      out.push(`| ${nomeBloco(b)} | ${b.caso?.programa ?? ""} | ERRO | | | | | | | |`);
      continue;
    }
    const o = b.original.linhas;
    const c = b.corrigido.linhas;
    out.push(
      `| ${nomeBloco(b)} | ${b.caso?.programa ?? ""} | ${contar(o, "igual")} | ${contar(o, "DIFERE")} | ${contar(o, "sem par")} | ${contar(c, "igual")} | ${contarClasse(c, "esperada")} | ${contarClasse(c, "inesperada", false)} | ${contarClasse(c, "inesperada", true)} | ${contar(c, "sem par")} |`,
    );
  }
  out.push("");
  if (erros.length) {
    out.push("## Erros", "");
    for (const b of erros) out.push(`- \`${b.arquivo}\`: ${b.erro}`);
    out.push("");
  }

  // sem par: o que a V2 não produz, por motivo
  out.push("## Sem par: o que a V2 não produz", "", "Igual nos dois modos. Um grupo por motivo; motivo vazio = sem justificativa.", "");
  const semPar = ok.flatMap((b) => b.original!.linhas.filter((l) => l.situacao === "sem par").map((linha) => ({ caso: b.caso!.caso, linha })));
  for (const [nota, xs] of porNota(semPar)) {
    const casos = [...new Set(xs.map((x) => x.caso))];
    out.push(`- **${casos.join(", ")}** (${xs.length} valores): ${nota || "SEM JUSTIFICATIVA"}`);
    if (!nota) out.push(`  - ids: ${xs.map((x) => `\`${x.linha.ref.id}\``).join(", ")}`);
  }
  out.push("");

  // DIFERE do original: diagnóstico
  out.push("## DIFERE no modo original: diagnóstico", "");
  const difO = ok.flatMap((b) => b.original!.linhas.filter((l) => l.situacao === "DIFERE").map((linha) => ({ caso: b.caso!.caso, linha })));
  if (!difO.length) out.push("Nenhuma.", "");
  for (const [nota, xs] of porNota(difO)) {
    out.push(`### ${[...new Set(xs.map((x) => x.caso))].join(", ")} (${xs.length})`, "", nota || "**SEM DIAGNÓSTICO**", "");
    out.push("| caso | id | esperado (original) | obtido (V2) | V2 − original |", "|---|---|---:|---:|---:|");
    for (const { caso, linha: l } of xs) out.push(`| ${caso} | ${esc(l.ref.id)} | ${esc(orig(l.ref))} | ${esc(fmtV2(l.ref, l.v2))} | ${fmtDif(l.ref, l.v2)} |`);
    out.push("");
  }

  // DIFERE do corrigido: classificação
  if (ex.modo === "corrigido") {
    out.push("## DIFERE no modo corrigido: esperada ou inesperada", "");
    const difC = ok.flatMap((b) =>
      b.corrigido!.linhas.flatMap((linha, i) => (linha.situacao === "DIFERE" ? [{ caso: b.caso!.caso, linha, o: b.original!.linhas[i]! }] : [])),
    );
    for (const classe of ["inesperada", "esperada"] as const) {
      const xs = difC.filter((x) => x.linha.classe === classe);
      out.push(`### ${classe} (${xs.length})`, "");
      for (const [nota, grupo] of porNota(xs)) {
        out.push(`**${nota}** (${grupo.length})`, "", "| caso | id | original | V2 original | V2 corrigido | corrigido − original | faixa |", "|---|---|---:|---:|---:|---:|---:|");
        for (const { caso, linha: l, o } of grupo)
          out.push(
            `| ${caso} | ${esc(l.ref.id)} | ${esc(orig(l.ref))} | ${esc(fmtV2(l.ref, o.v2))} | ${esc(fmtV2(l.ref, l.v2))} | ${fmtDif(l.ref, l.v2)} | ${l.faixa === undefined ? "" : `±${l.faixa.toPrecision(2)}`} |`,
          );
        out.push("");
      }
    }
  }

  // detalhe por caso, no modo pedido
  out.push(`## Detalhe por caso (modo ${ex.modo})`, "");
  for (const b of blocos) {
    if (!b.caso) continue;
    const c = b.caso;
    const m = ex.modo === "original" ? b.original : b.corrigido;
    out.push(`### ${c.caso}`, "", `${c.descricao}`, "", `- Programa: ${c.programa}; run: \`${c.run}\``, `- Arquivo: \`${b.arquivo}\``);
    if (b.semMontagem) out.push(`- Sem montagem na V2 (\`paridade/v2/obras/${c.caso}.ts\`): todos os valores ficam sem par.`);
    if (m?.avisos.length) out.push(`- Avisos da V2: ${m.avisos.map((a) => esc(a)).join(" / ")}`);
    if (b.erro || !m) {
      out.push("", `ERRO: ${b.erro ?? "sem resultado"}`, "");
      continue;
    }
    out.push("", "| id | grandeza | unidade | original | V2 | V2 − original | situação | nota | fonte |", "|---|---|---|---:|---:|---:|---|---|---|");
    for (const l of m.linhas) {
      const sit = l.classe ? `${l.situacao} (${l.classe})` : l.situacao;
      // a nota de sem par e de diagnóstico está nas seções acima; aqui só a classe do corrigido
      const nota = l.situacao === "DIFERE" && l.classe ? esc(l.nota ?? "") : "";
      out.push(
        `| ${esc(l.ref.id)} | ${esc(l.ref.grandeza)} | ${esc(l.ref.unidade)} | ${esc(orig(l.ref))} | ${esc(fmtV2(l.ref, l.v2))} | ${fmtDif(l.ref, l.v2)} | ${sit} | ${nota} | ${esc(l.ref.fonte)} |`,
      );
    }
    out.push("");
  }
  return out.join("\n");
}
