// Adaptador do motor da V2: o ÚNICO arquivo da paridade que chama a V2 (caminhos de
// módulo, nomes de função e de campo de resultado). As montagens de caso
// (v2/obras/*.ts) importam a obra dos arquivos do original (`importar`) ou a escrevem
// com os tipos do domínio da V2 (`import type`), e recebem de volta o mapa id → número
// que o original imprimiu.
//
// Caminho: os importadores da V2 (`armazenamento/sistrut/`: `importarLaj` para o .LAJ,
// `importarVigasSistrut` para .VIG/.SEC/.FOR/.DSP/VIGA.INI) montam a `Obra`;
// `calcularObra(obra, nb178)` calcula no `obra.modoCalculo`, e os números saem de
// `resultado.sistrut`, que já está nas unidades do original (docs/MODO-CALCULO.md da V2,
// "Formato de resultado.sistrut"). A projeção em SI não é lida. Os tipos vêm da V2 de
// referência (`@v2/*`, paridade/tsconfig.json): uma renomeação lá quebra o typecheck aqui.
//
// Casamento dos ids: a convenção de `calculo/sistrut/__oraculo__/confere.ts` da V2 (e dos
// testes dos importadores), com duas diferenças de propósito:
// 1. parcelas e momentos do .REP como número (`valor`), não como texto: o JSON marca o
//    truncamento com `trunca`, e no corrigido o texto não existe no original;
// 2. id que o casamento reconhece mas a V2 não calculou (viga não processada, lance sem
//    dimensionamento, campo ausente) sai NaN ("sem número", DIFERE), não ausente.
// Id que o casamento não reconhece sai ausente (sem par); `v2/notas.ts` (SEM_PAR) diz por quê.
//
// Importa o motor direto do repositório da V2, sem copiar nem editar nada lá.
import { execFileSync } from "node:child_process";
import { join } from "node:path";
import { pathToFileURL } from "node:url";
import type * as ImportaLaj from "@v2/armazenamento/sistrut/laje";
import type * as ImportaPilar from "@v2/armazenamento/sistrut/pilar";
import type * as ImportaViga from "@v2/armazenamento/sistrut/viga";
import type * as Fluxo from "@v2/calculo/fluxo";
import type * as Normas from "@v2/calculo/normas/index";
import type * as F32 from "@v2/calculo/sistrut/base/f32";
import type { BarraDeLaje, FissuracaoViga, QuadroViga, ResumoVigas, TramoDimensionado } from "@v2/calculo/sistrut/base/tipos";
import type { ResultadoSistrut, VigaSistrut } from "@v2/calculo/sistrut/obra";
import type * as Quant from "@v2/calculo/sistrut/quant/vigas";
import type * as Descalc from "@v2/calculo/sistrut/vigas/desinitDescalc";
import type * as Vicalc from "@v2/calculo/sistrut/vigas/vicalc";
import type { Obra } from "@v2/dominio/obra";
import type { CasoRef } from "../lib/caso";
import type { ValorV2 } from "../lib/comparar";

export type { Obra };
export type OpcoesImportacaoLaj = ImportaLaj.OpcoesImportacaoLaj;

/** kN por tf. */
export const KN = 9.80665;

export type Modo = "original" | "corrigido";

/** Arquivo do original: nome com extensão e bytes. */
export interface ArquivoOriginal {
  nome: string;
  dados: Uint8Array;
}

export interface OpcoesValores {
  /** Pavimento das lajes, vigas, .REP e resumo (nome). Padrão: o primeiro. Os ids do
   *  PILAREDI leem o lance pelo nível. */
  pavimento?: string;
  /** Nome de nível no id do PILAREDI → nível da V2 (0 = fundação): `P5.FUND.As`. */
  niveis?: Record<string, number>;
  /** Vigas que o resumo do DESENHO 4 do original somou. Padrão: todas as detalhadas do pavimento. */
  resumo?: string[];
  /** De quem é a análise de viga impressa: do VIGA (opções 2 e 7, padrão) ou do DESDIM
   *  (o DESCALC sobre a entrada do DESDIM, com o .DSP). */
  analise?: "VIGA" | "DESDIM";
}

/** Uma obra calculada pela V2. */
export interface CalculoV2 {
  /** Avisos do importador, da obra e dos pavimentos e as falhas (carga que não chega à
   *  fundação). */
  avisos: string[];
  /** Itens do MODO-CALCULO que a V2 mostrou ativos nesta obra: "R3" (a otimização
   *  mudou algum código de lado ou parou no laço), "M-a" (aviso de soma das áreas de
   *  influência), "V-a" (carga indexada: viga apoiada em viga no .VIG), "R6" (VIGA.INI
   *  fora dos limites do corrigido), "P-a" (MEP ao pilar sem .RLP ou sem a rigidez da viga). */
  evidencias: string[];
  /** Os ids do caso que a V2 dá, nas unidades do original. */
  valores(caso: CasoRef, op?: OpcoesValores): Map<string, ValorV2>;
}

/** O que os arquivos não têm e o roteiro diz, por importador. */
export interface OpcoesImportacao {
  /** `importarLaj`: materiais, pesos de viga, rodada do LAJECALC, "Vx apoia em Vy". */
  laj?: OpcoesImportacaoLaj;
  /** Leituras de .REP do PILGEEDI (opção 5), na ordem do roteiro: arquivo, faixa de
   *  níveis (1-based) e modo. O .RLP de mesmo nome vai junto, como o PILGEEDI o abre. */
  reps?: { arquivo: string; nivelInicial: number; nivelFinal: number; modo?: "substitui" | "soma" | "maxima" }[];
}

/** Obra importada dos arquivos do original, com os avisos do importador. */
export interface Importacao {
  obra: Obra;
  avisos: string[];
}

export interface Motor {
  raiz: string;
  /** Commit da V2 (git rev-parse --short HEAD) e "+mod" se há mudanças não commitadas em src/. */
  commit: string;
  /** Monta a obra pelos importadores da V2, na ordem do original: o .LAJ (`importarLaj`),
   *  o .VIG/.SEC/.FOR/.TAB/.DSP/VIGA.INI/DESENHO.INI (`importarVigasSistrut`) e o
   *  .COL/.PIP/.PIL com os .REP (`importarPilaresSistrut`). Cada um completa a obra do
   *  anterior ou, sem ela, gera uma. */
  importar(arquivos: readonly ArquivoOriginal[], opcoes?: OpcoesImportacao): Importacao;
  /** Calcula a obra no modo dado (`obra.modoCalculo` é trocado); `avisos` (do importador)
   *  vão para o resultado. */
  calcular(obra: Obra, modo: Modo, avisos?: readonly string[]): CalculoV2;
}

interface ModulosV2 {
  fluxo: typeof Fluxo;
  normas: typeof Normas;
  vicalc: typeof Vicalc;
  quant: typeof Quant;
  descalc: typeof Descalc;
  f32: typeof F32;
  laje: typeof ImportaLaj;
  viga: typeof ImportaViga;
  pilar: typeof ImportaPilar;
}

// ---------------------------------------------------------------- resultado.sistrut → ids

/** Ordem das bitolas no .DSP (índice de comprimentoPorBitola/pesoPorBitola). */
const ROTULOS_BITOLA = ["4", "5", "6.3", "8", "10", "12.5", "16", "20", "25", "32"];

const perto = (a: number, b: number) => Math.abs(a - b) < 1e-3;
const barraOk = (b: BarraDeLaje | undefined) => (b?.ok ? b : undefined);
/** Barra de laje como o desenho do LAJEPROC rotula ("#6.3c/12.5"); a bitola e o
 *  espaçamento do original são SINGLE (6,3000002), impressos com 1 casa. */
const textoBarraLaje = (b: BarraDeLaje) => (b.ok ? `#${Number(b.bitola.toFixed(1))}c/${Number(b.espacamento.toFixed(1))}` : "NAO");
/** Valor de um id reconhecido: ausente na V2 = NaN (DIFERE), não sem par. */
const ou = (x: ValorV2 | undefined): ValorV2 => x ?? NaN;
/** Campo de um mapa de id reconhecido: undefined só se o campo não está no mapa. */
const campoDe = (mapa: Record<string, ValorV2 | undefined>, campo: string) => (campo in mapa ? ou(mapa[campo]) : undefined);
type Lado = { lado: number; de: number[]; para: number[] };

function casador(r: ResultadoSistrut, obra: Obra, v2: ModulosV2, caso: CasoRef, op: OpcoesValores) {
  const pav = op.pavimento ? r.pavimentos.find((p) => p.nome === op.pavimento) : r.pavimentos[0];
  if (!pav) throw new Error(`a V2 não devolveu o pavimento ${op.pavimento ?? "1"}`);
  // pilar da obra pelo id (o importador de .COL dá ids "P5@pav2"; o id casa pelo nome)
  const pilarPorId = new Map(obra.pavimentos.flatMap((p) => p.pilares.map((q) => [q.id, q] as const)));
  const nomesPilares = new Set(obra.pavimentos.flatMap((p) => p.pilares.map((q) => q.nome)));
  const nomeDoPilar = (id: string) => pilarPorId.get(id)?.nome ?? id;
  // viga pelo nome da obra (V1, D1, VR6, VA): o id "<viga>.<campo>" só casa com viga que existe
  const nomesVigas = new Set(obra.pavimentos.flatMap((p) => p.vigas.map((v) => v.nome)));
  // no original o id do .REP casa com o texto gravado (VIGA.BAS:2501/2506 corta STR$ em
  // INSTR(".") + 2: 30,00 vira "3"); no corrigido, com o número
  const original = r.modo === "original";

  /** Lajes: LAJECALC 3 (Hmin), 4 (imposição, antes da otimização), 5 (momentos e
   *  armaduras; `.antesOtim` = a impressão antes do LAJECALC 6), μ do .LAJ. */
  function laje(id: string): ValorV2 | undefined {
    const m = /^(L\d+)\.(.+)$/.exec(id);
    if (!m) return undefined;
    const [, nome = "", resto = ""] = m;
    const antes = /\.(preOtim|antesOtim)$/.test(resto);
    const campo = resto.replace(/\.(preOtim|antesOtim)$/, "");
    const esf = antes ? pav!.esforcosAntesOtimizacao : pav!.esforcos;
    const mom = esf.momentos[nome];
    const arm = (antes ? pav!.armadurasAntesOtimizacao : pav!.armaduras)[nome];
    // a tabela de imposição (LAJECALC 4) sai antes da otimização
    const imp = pav!.armadurasAntesOtimizacao[nome];
    const momImp = pav!.esforcosAntesOtimizacao.momentos[nome];
    const lajeS = esf.lajes.find((l) => l.nome === nome);
    const prep = esf.preparadas[nome];
    const esp = pav!.espessuras[nome];
    const espOk = esp?.ok ? esp : undefined;
    // coluna "Acid.": alvenarias e cargas por área sobre a área da laje
    const acid = prep && (prep.alvenaria + prep.cargaArea) / prep.area;
    // o M− é |M+|·c; no balanço (M+ < 0) o original imprime M+·c, com o sinal
    const sinal = mom && mom.mPositivoPrincipalTcm < 0 ? -1 : 1;
    const tcm = (x: number | undefined) => (x === undefined ? undefined : (sinal * x) / 100);
    return campoDe(
      {
        // o original imprime max(M+, 0): no balanço o M+ é negativo (LAJECALC.BAS:12417)
        "M+princ": mom && Math.max(mom.mPositivoPrincipalTcm, 0) / 100,
        "M+sec": mom && Math.max(mom.mPositivoSecundarioTcm, 0) / 100,
        "M-maior": tcm(mom?.mNegativoMaiorTcm),
        "M-menor": tcm(mom?.mNegativoMenorTcm),
        "As+princ": arm?.asPositivaPrincipal,
        "As+sec": arm?.asPositivaSecundaria,
        "As-maior": arm?.asNegativaMaior,
        "As-menor": arm?.asNegativaMenor,
        H: lajeS?.h,
        "x/d": imp?.xd,
        "As.phi": barraOk(imp?.barra)?.bitola,
        "As.s": barraOk(imp?.barra)?.espacamento,
        pp: momImp?.pesoProprio,
        p: momImp?.q,
        perm: lajeS?.cargaPermanente,
        acid,
        Hmin: espOk?.h,
        "Hmin.x/d": espOk?.xd,
        "Hmin.As.phi": barraOk(espOk?.barra)?.bitola,
        "Hmin.As.s": barraOk(espOk?.barra)?.espacamento,
        "Hmin.pp": espOk?.pesoProprio,
        "Hmin.p": espOk?.q,
        "Hmin.perm": lajeS?.cargaPermanente,
        "Hmin.acid": acid,
        mu: lajeS?.mu,
      },
      campo,
    );
  }

  /** Código do lado k do original (`L1.lado3.codigo`): o lado é achado pela geometria
   *  gravada pelo original (entrada do caso), porque o polígono da V2 começa sempre no
   *  canto inferior esquerdo. */
  function codigoDoLado(id: string): ValorV2 | undefined {
    const m = /^(L\d+)\.lado(\d+)\.codigo$/.exec(id);
    if (!m) return undefined;
    const lajes = (caso.entrada as { obra?: { obra_gravada_pelo_original?: { lajes?: Record<string, { lados: Lado[] }> } } }).obra
      ?.obra_gravada_pelo_original?.lajes;
    const lado = lajes?.[m[1]!]?.lados.find((l) => l.lado === Number(m[2]));
    const l = pav!.esforcos.lajes.find((x) => x.nome === m[1]);
    if (!lado || !l) return NaN;
    const igual = (p: { x: number; y: number }, q: number[]) => perto(p.x, q[0]!) && perto(p.y, q[1]!);
    const k = l.vertices.findIndex((v, i) => {
      const w = l.vertices[(i + 1) % l.vertices.length]!;
      return (igual(v, lado.de) && igual(w, lado.para)) || (igual(w, lado.de) && igual(v, lado.para));
    });
    return k < 0 ? NaN : ou(l.codigos[k]);
  }

  /** Tela parada da otimização (R3, só no original): `L1.otim.M`, `.As`, `.MnegMpos`,
   *  `.alteradaPara` (e a mesma tela aos 60 s). */
  function otimizacao(id: string): ValorV2 | undefined {
    const m = /^(L\d+)\.otim\.(M|As|MnegMpos|alteradaPara)(\.\d+s)?$/.exec(id);
    if (!m) return undefined;
    const parada = pav!.otimizacaoParada;
    if (!parada) return NaN;
    if (m[2] === "alteradaPara") return parada.laje === m[1] ? ou(parada.relacaoNova) : NaN;
    const lado = parada.lados.find((l) => l.laje === m[1]);
    if (!lado) return NaN;
    return ou(m[2] === "M" ? lado.mTcm / 100 : m[2] === "As" ? lado.as : lado.relacao);
  }

  /** PILAR opção 6 (`resultado.sistrut.verificacoes`): `P.lambdaX`, `c1.Mx` no caso c e
   *  `e2.c1.MRx1a` no conjunto 2 dos v2par (e<k> = verificação k, na ordem da obra). */
  function verificacao(id: string): ValorV2 | undefined {
    const m = /^(?:e(\d+)\.)?(?:P\.(Jx|Jy|lambdaX|lambdaY)|c(\d+)\.(\w+|1\/r)(\.tela)?)$/.exec(id);
    if (!m) return undefined;
    const v = r.verificacoes[Number(m[1] ?? 1) - 1]?.resultado;
    if (!v) return NaN;
    if (m[2]) return ou({ Jx: v.jx, Jy: v.jy, lambdaX: v.lambdaX, lambdaY: v.lambdaY }[m[2]]);
    const c = v.casos[Number(m[3]) - 1];
    if (!c) return NaN;
    const veredito = c.veredito === "INSTABILIDADE" ? "SITUACAO DE INSTABILIDADE" : c.veredito;
    const mapa: Record<string, ValorV2 | undefined> = {
      caso: c.rotulo,
      situacao: v.situacao,
      Mx: c.mx,
      My: c.my,
      Mxa: c.mxa,
      Mya: c.mya,
      Mtotal: c.mTotal,
      incl: c.anguloAtuante,
      veredito: c.erro ? undefined : veredito,
      M1a: c.instabilidade?.m1,
      M2a: c.instabilidade?.m2,
      MR1a: c.instabilidade?.m1,
      MR2a: c.instabilidade?.m2,
      Matuante: c.instabilidade?.atuante,
      MRx1a: c.mrx,
      MRx2a: c.m2x,
      MRx: c.mrxReduzido,
      MRy1a: c.mry,
      MRy2a: c.m2y,
      MRy: c.mryReduzido,
      MRtotal: c.mrTotal,
      ln: c.anguloLN,
      Xln: c.xLN,
      "1/r": c.curvatura * 1000,
      defCon: c.deformacaoConcreto,
      defAco: c.deformacaoAco,
    };
    return campoDe(mapa, m[4]!);
  }

  /** LAJEPROC: positivas por laje e uma negativa por continuidade, como texto. */
  function lajeproc(id: string): ValorV2 | undefined {
    const proc = pav!.lajeproc;
    const pos = /^(L\d+)\.proc\.pos(Princ|Sec)$/.exec(id);
    if (pos) {
      const p = proc.positivas[pos[1]!];
      const b = pos[2] === "Princ" ? p?.principal.barra : p?.secundaria.barra;
      return b ? textoBarraLaje(b) : NaN;
    }
    const neg = /^(L\d+)-(L\d+)\.proc\.neg$/.exec(id);
    if (!neg) return undefined;
    const n = proc.negativas.find(
      (x) => (x.continuidade.lajeA === neg[1] && x.continuidade.lajeB === neg[2]) || (x.continuidade.lajeA === neg[2] && x.continuidade.lajeB === neg[1]),
    );
    return n ? textoBarraLaje(n.barra) : NaN;
  }

  /** Reações do LAJEMONT por laje e viga. */
  function reacao(id: string): ValorV2 | undefined {
    // L3>V7.s2.area: a sub-área 2 (o lado 2 do polígono, na ordem do .LAJ) da L3, que vai à
    // V7; sem "s", a única da laje para aquele apoio. L3>P5.area: o bordo sobre o pilar-parede
    const m = /^(L\d+)>(\w+)\.(?:s(\d+)\.)?(area|qArea|qEstru|qPeso|qLinear)$/.exec(id);
    if (!m) return undefined;
    const doApoio = pav!.montagem.reacoes.filter(
      (q) => q.laje === m[1] && ((q.apoio.tipo === "viga" && q.apoio.viga === m[2]) || (q.apoio.tipo === "pilar" && q.apoio.pilar === m[2])),
    );
    const x = m[3] ? doApoio.find((q) => q.bordo === Number(m[3]) - 1) : doApoio[0];
    return ou(x && { area: x.area, qArea: x.cargaArea, qEstru: x.estrutura, qPeso: x.peso, qLinear: x.linear }[m[4] as "area"]);
  }

  /** Totais do relatório do LAJEMONT e parâmetros. */
  function totais(id: string): ValorV2 | undefined {
    const t = pav!.montagem.totais;
    return campoDe(
      {
        "total.cargasArea": t.cargasPorAreaNominal,
        "total.cargasAreaConsiderado": t.cargasPorArea,
        "total.cargasLineares": t.alvenariasNominal,
        "total.cargasLinearesConsiderado": t.alvenarias,
        "total.ppVigas": t.pesoProprioVigas,
        "total.ppLajes": t.pesoProprioLajes,
        "total.estrutura": t.estrutura,
        "total.painel": t.painel,
        "total.vigas": t.vigas,
        "total.pilares": t.pilares,
        "total.vigasPilares": t.vigas + t.pilares,
        "param.fck": r.materiais.fck,
        "param.fyk": r.materiais.fyk,
        "param.cobrimento": r.parametros.laje.cobrimento,
        "param.cse": r.materiais.gamaF,
        "param.csc": r.materiais.gamaC,
        "param.csa": r.materiais.gamaS,
      },
      id,
    );
  }

  /** DESDIM: apoios e tramos dimensionados (índice do original: t0 = balanço esquerdo). */
  function desdim(id: string): ValorV2 | undefined {
    // des.VB.* = impresso pelo DESDIM; .tela = a tela da viga que parou ("Continuo" N)
    const tela = id.endsWith(".tela");
    id = id.replace(/^des\./, "").replace(/\.tela$/, "");
    const m = /^(\w+)\.(?:cobrimento|([at])(\d+)\.(x\/d|Mk|Ast|Asc|barras|barrasComp|flecha|Vke|Aee|Vkd|Aed|estriboE|estriboD|fissura))$/.exec(id);
    if (!m) return undefined;
    const [, nome = "", at, k, campo = ""] = m;
    if (!nomesVigas.has(nome)) return undefined;
    const vs = pav!.vigas.find((v) => v.nome === nome);
    // o cobrimento do .DSP da viga (o da obra no corrigido)
    if (!at) return ou(vs?.entrada.parametros.cobrimento);
    const d = vs?.dimensionamento;
    if (!d) return NaN;
    // a tela imprime a fissura como MID$(STR$(w), 1, 6): a menor das duas, em décimos de mm
    const fissura = (f: FissuracaoViga | undefined) => f && Math.trunc(Math.min(f.w1, f.w2) * 10_000) / 1000;
    if (at === "a") {
      const a = d.apoios.find((x) => x.apoio === Number(k));
      if (!a) return NaN;
      return ou({ "x/d": a.xd, Mk: a.mk, Ast: a.as, Asc: a.asCompressao, barras: a.arranjo, barrasComp: a.arranjoCompressao, fissura: fissura(a.fissuracao) }[campo]);
    }
    const tramos: (TramoDimensionado | undefined)[] = [d.balancoEsquerdo, ...d.tramos, d.balancoDireito];
    const t = tramos.find((x) => x?.indice === Number(k));
    if (!t) return NaN;
    const c = t.cisalhamento;
    // a tela marca com * o cortante da viga acima do limite (τwd ≥ 0,25·fcd); a V2 guarda o
    // limite por viga, não por lado
    const marca = (v: number) => (tela && d.limitesExcedidos?.includes("cisalhamento") ? `${v}*` : v);
    const mapa: Record<string, ValorV2 | undefined> = {
      "x/d": t.flexao.xd,
      Mk: t.flexao.mk,
      Ast: t.flexao.as,
      Asc: t.flexao.asCompressao,
      barras: t.flexao.arranjo,
      barrasComp: t.flexao.arranjoCompressao,
      flecha: t.flecha,
      Vke: marca(c.vkEsquerda),
      Aee: c.aswEsquerda,
      Vkd: marca(c.vkDireita),
      Aed: c.aswDireita,
      estriboE: c.estriboEsquerda.texto,
      estriboD: c.estriboDireita.texto,
      fissura: fissura(t.fissuracao),
    };
    return ou(mapa[campo]);
  }

  /** Resumo do DESENHO 4: das vigas que o original somou (`op.resumo`), pela regra da
   *  V2 (`resumoGeralVigas`) sobre os quadros dessas vigas no pavimento (cada viga uma vez). */
  const quadrosPav = pav.vigas.flatMap((v) => (v.quadro && (!op.resumo || op.resumo.includes(v.nome)) ? [v.quadro] : []));
  let resumo: ResumoVigas | undefined;
  const resumoDe = (q: readonly QuadroViga[]) => v2.quant.resumoGeralVigas(q, r.parametros.dsp, r.modo);
  function resumoDesenho(id: string): ValorV2 | undefined {
    const m = /^resumo\.(?:(total|peso)|(\w+?))\.?(rept|Vconc|Afor|comp\.([\d.]+)|([\d.]+))?$/.exec(id);
    if (!m) return undefined;
    resumo ??= resumoDe(quadrosPav);
    const [, todos, viga, campo = "", rotComp, rotPeso] = m;
    const bitola = (xs: readonly number[], rot: string | undefined) => ou(xs[ROTULOS_BITOLA.indexOf(rot ?? "")]);
    if (todos === "peso") return bitola(resumo.pesoPorBitola, rotPeso);
    if (todos === "total") {
      if (campo === "Vconc") return ou(resumo.volume);
      if (campo === "Afor") return ou(resumo.forma);
      return bitola(resumo.comprimentoPorBitola, rotComp);
    }
    const q = quadrosPav.find((x) => x.nome === viga);
    if (!q) return NaN;
    // o resumo usa MAX(1, rept)
    if (campo === "rept") return Math.max(1, q.repeticoes);
    // a linha da viga mostra o comprimento de uma viga; o total é que conta MAX(1, rept)
    if (campo.startsWith("comp.")) return bitola(resumoDe([{ ...q, repeticoes: 0 }]).comprimentoPorBitola, rotComp);
    const pv = resumo.porViga.find((x) => x.nome === viga);
    return ou(campo === "Vconc" ? pv?.volume : pv?.forma);
  }

  /** Análise que o DESDIM imprime: o DESCALC sobre a entrada do DESDIM (o .VIG editado,
   *  as seções e o .DSP da obra), como `armazenamento/sistrut/viga.oraculo.test.ts`. */
  function analiseDesdim(vs: VigaSistrut, resto: string): ValorV2 {
    const c = v2.descalc.analisaDescalc(vs.entrada, r.modo);
    const imp = c.impressaoDescalc;
    if (!imp) return NaN;
    const n = c.v0ddc;
    if (resto === "somaR") {
      let soma = 0;
      for (let k = 0; k <= n; k++) soma += imp.reacao.g(k);
      return soma;
    }
    // o DESDIM imprime o MEP com INT no centésimo
    if (resto === "MEP0") return v2.f32.qbInt(imp.mep.g(0) * 100) / 100;
    if (resto === `MEP${n}`) return v2.f32.qbInt(imp.mep.g(1) * 100) / 100;
    const ap = /^a(\d+)\.(max\.|min\.)?(M-|R)$/.exec(resto);
    if (ap) {
      const k = Number(ap[1]);
      if (ap[2] === "max.") return ap[3] === "R" ? imp.reacaoEnvoltoria.g(k, 0) : c.a16de.g(k);
      if (ap[2] === "min.") return ap[3] === "R" ? imp.reacaoEnvoltoria.g(k, 1) : NaN;
      return ap[3] === "R" ? imp.reacao.g(k) : c.a15ca.g(k);
    }
    const ep = /^t(\d+)\.EEP\.(Ve|x|M\+|Vd)$/.exec(resto);
    if (ep) {
      for (let i = 1; i <= c.v1176; i++) {
        if (c.a11d6.g(i) !== Number(ep[1])) continue;
        return ou({ Ve: c.a1204.g(i, 0), x: c.a117a.g(i), "M+": c.a11a8.g(i), Vd: c.a1204.g(i, 1) }[ep[2]!]);
      }
      return NaN;
    }
    const tr = /^t(\d+)\.(max\.)?(Ve|x|M\+|Vd)$/.exec(resto);
    if (!tr) return NaN;
    const t = Number(tr[1]);
    if (t === 0 && tr[3] === "Vd" && !tr[2]) return c.a1654.g(0, 1);
    if (t === n + 1 && tr[3] === "Ve" && !tr[2]) return c.a1654.g(n + 1, 0);
    if (t < 1 || t > n) return NaN;
    if (!tr[2]) return ou({ Ve: c.a1654.g(t, 0), x: c.a15f8.g(t), "M+": c.a1626.g(t), Vd: c.a1654.g(t, 1) }[tr[3]!]);
    // DESDIM.BAS:6370-6380: o maior em módulo entre o cortante máximo e o mínimo
    const ve = Math.abs(c.a1796.g(t, 3)) > c.a1796.g(t, 0) ? c.a1796.g(t, 3) : c.a1796.g(t, 0);
    const vd = Math.abs(c.a1796.g(t, 4)) > c.a1796.g(t, 1) ? c.a1796.g(t, 4) : c.a1796.g(t, 1);
    return ou({ Ve: ve, x: c.a173a.g(t), "M+": c.a1768.g(t), Vd: vd }[tr[3]!]);
  }

  /** VIGA: carregamento do .VIG, análise, envoltória, engastamento perfeito e MEP. */
  function viga(id: string): ValorV2 | undefined {
    // des.VB.* = a análise que o DESDIM imprime; sem prefixo, a do VIGA (ou `op.analise`)
    const doDesdim = id.startsWith("des.") || op.analise === "DESDIM";
    id = id.replace(/^des\./, "");
    const m = /^(\w+)\.(.+)$/.exec(id);
    if (!m || !nomesVigas.has(m[1]!)) return undefined;
    const [, nome = "", resto = ""] = m;
    const reconhecido = /^(somaR|MEP\d+|a\d+\.(max\.)?(M-|R)|a\d+\.min\.R|a\d+\.Mext|t\d+\.(EEP\.|max\.)?(Ve|x|M\+|Vd|fEJ)|t\d+\.(P|L|J|D|F|Pac|Fac|pp|ppViga|alv)|t\d+\.\d+a\.(pp|ppViga|alv)|t\d+\.d\d+\.(P|D|F|Pac|Fac))$/;
    if (!reconhecido.test(resto)) return undefined;
    const a = pav!.analises.find((x) => x.nome === nome);
    const dados = pav!.vigasVig.find((x) => x.nome === nome);
    const mont = pav!.montagem.vigas.find((x) => x.nome === nome);
    if (!a || !dados) return NaN;
    if (doDesdim && /^(somaR|MEP\d+|a\d+\.|t\d+\.(EEP\.|max\.)?(Ve|x|M\+|Vd)$)/.test(resto)) {
      const vs = pav!.vigas.find((v) => v.nome === nome);
      return vs ? analiseDesdim(vs, resto) : NaN;
    }
    const n = a.tramos.length;
    if (resto === "somaR") return ou(a.somaReacoes);
    if (resto === "MEP0") return v2.vicalc.textoMep(a.mepEsquerdo, r.modo);
    if (resto === `MEP${n}`) return v2.vicalc.textoMep(a.mepDireito, r.modo);
    // momento externo digitado no apoio extremo (VIGA 1 com momentos externos S)
    const mext = /^a(\d+)\.Mext$/.exec(resto);
    if (mext) return ou(Number(mext[1]) === 0 ? dados.momentosExternos[0] : Number(mext[1]) === n ? dados.momentosExternos[1] : undefined);
    const ap = /^a(\d+)\.(?:(max|min)\.)?(M-|R)$/.exec(resto);
    if (ap) {
      const x = a.apoios[Number(ap[1])];
      if (!x) return NaN;
      if (ap[2] === "max") return ou(ap[3] === "R" ? x.rMax : x.mMax);
      if (ap[2] === "min") return ou(x.rMin);
      return ou(ap[3] === "R" ? x.r : x.m);
    }
    const ep = /^t(\d+)\.EEP\.(Ve|x|M\+|Vd)$/.exec(resto);
    if (ep) {
      const l = a.engastamentoPerfeito.find((x) => x.tramo === Number(ep[1]));
      return ou(l && { Ve: l.ve, x: l.x, "M+": l.mPositivo, Vd: l.vd }[ep[2] as "Ve"]);
    }
    // quadro de alvenarias com mais de uma linha no tramo: t1.2a = 2ª linha do tramo 1
    const linhaAlv = /^t(\d+)\.(\d+)a\.(pp|ppViga|alv)$/.exec(resto);
    if (linhaAlv) {
      const linhas = mont?.alvenariasSobreViga?.filter((x) => x.tramo === Number(linhaAlv[1])) ?? [];
      const l = linhas[Number(linhaAlv[2]) - 1];
      return ou(l && (linhaAlv[3] === "alv" ? l.alvenaria : l.peso));
    }
    const tr = /^t(\d+)\.(?:(max)\.|d(\d+)\.)?(\w+\+?)$/.exec(resto);
    if (!tr) return NaN;
    const k = Number(tr[1]);
    const campo = tr[4]!;
    // o VIGA imprime o balanço esquerdo como tramo 0 e o direito como n + 1
    const td = k === 0 ? dados.balancoEsquerdo : k === n + 1 ? dados.balancoDireito : dados.tramos[k - 1];
    const div = td?.divisoes[tr[3] ? Number(tr[3]) - 1 : 0];
    const cargas: Record<string, number | undefined> = { P: div?.p, D: div?.d, F: div?.f, Pac: div?.pAcidental, Fac: div?.fAcidental };
    if (tr[3]) return ou(cargas[campo]);
    if (k === n + 1 && campo === "Ve" && !tr[2]) return ou(a.balancoDireito?.carga);
    if (k === 0 && campo === "Vd" && !tr[2]) return ou(a.balancoEsquerdo?.carga);
    const t = a.tramos[k - 1];
    const env = t?.envoltoria;
    const alv = mont?.alvenariasSobreViga?.find((x) => x.tramo === k);
    const mapa: Record<string, number | undefined> = tr[2]
      ? { Ve: env?.ve, x: env?.x, "M+": env?.mPositivo, Vd: env?.vd, fEJ: env?.fEJ }
      : { ...cargas, Ve: t?.ve, x: t?.x, "M+": t?.mPositivo, Vd: t?.vd, fEJ: t?.fEJ, L: td?.vao, J: td?.inercia, pp: alv?.peso, ppViga: alv?.peso, alv: alv?.alvenaria };
    return ou(mapa[campo]);
  }

  /** .REP do pavimento (`op.pavimento`): total por pilar, parcela de cada viga e momento
   *  de extremidade (números; o JSON marca as parcelas truncadas com `trunca`). */
  function rep(id: string): ValorV2 | undefined {
    const m = /^REP(?:arq)?\.(P\d+)(?:\.(carga|momento)\.(\w+))?$/.exec(id);
    if (!m) return undefined;
    const [, pilar, tipo, v] = m;
    const linha = pav!.rep.find((l) => l.pilar === pilar);
    if (!linha) return NaN;
    if (!tipo) return ou(linha.total);
    const x = (tipo === "carga" ? linha.parcelas : linha.momentos).find((y) => y.viga === v);
    return ou(original ? x?.texto : x?.valor);
  }

  /** PILAREDI: o lance do pilar no nível (0 = fundação, ou o nível nomeado no id). */
  function pilaredi(id: string): ValorV2 | undefined {
    const m = /^([A-Za-z]\w*)\.(.+)$/.exec(id);
    if (!m || !nomesPilares.has(m[1]!)) return undefined;
    const [, pilar = ""] = m;
    let resto = m[2]!;
    let nivel = 0;
    const primeiro = resto.split(".")[0]!;
    if (op.niveis && primeiro in op.niveis) {
      nivel = op.niveis[primeiro]!;
      resto = resto.slice(primeiro.length + 1);
    }
    // predimensionamento (PILAREDI 3.1): tensões e a "CARGA" da tela; a cargaNivel é a
    // carga acumulada do .REP no nível da base
    const pre = /^(?:pre|predim)\.(carga|cargaNivel|tensaoAdmN|tensaoMaxN|tensaoAdmNM|tensaoMaxNM|sigmaAdmComp|sigmaComp|sigmaAdmCompM|sigmaCompM)$/.exec(resto);
    if (pre) {
      const p = r.predimensionamentos.find((x) => nomeDoPilar(x.pilarId) === pilar)?.resultado;
      if (pre[1] === "cargaNivel") return ou(r.lances.find((l) => nomeDoPilar(l.pilarId) === pilar && l.nivel === 0)?.carga.cargaAcumulada);
      if (!p) return NaN;
      const mapa: Record<string, number> = {
        carga: p.carga,
        tensaoAdmN: p.tensaoNormalAdmissivel,
        tensaoMaxN: p.tensaoNormal,
        tensaoAdmNM: p.tensaoFlexaoAdmissivel,
        tensaoMaxNM: p.tensaoFlexao,
        sigmaAdmComp: p.tensaoNormalAdmissivel,
        sigmaComp: p.tensaoNormal,
        sigmaAdmCompM: p.tensaoFlexaoAdmissivel,
        sigmaCompM: p.tensaoFlexao,
      };
      return ou(mapa[pre[1]!]);
    }
    const caso = /^(\d[ef])\.(\w+|1\/r|x\/d)$/.exec(resto);
    const campos = /^(lambdaX|lambdaY|Nk|Mkxi|Mkyi|cobrimento|As|taxa|barras\.n|barras\.phi|estribo\.phi|estribo\.s|Bw|Hw|rot|Dext|nvert|cargaREP)$/;
    if (!caso && !campos.test(resto)) return undefined;
    if (resto === "cobrimento") return ou(r.parametros.pip.cobrimento);
    const lance = r.lances.find((l) => nomeDoPilar(l.pilarId) === pilar && l.nivel === nivel);
    if (!lance) return NaN;
    // seção do lance como o PILAREDI imprime: B, H e o giro da retangular, D da circular,
    // número de vértices da poligonal (a do pilar do pavimento do lance)
    const pl = pilarPorId.get(lance.pilarId);
    if (resto === "rot") return ou(pl?.rotacao ?? 0);
    if (resto === "Dext") return ou(pl?.secao?.tipo === "circular" ? pl.secao.d : undefined);
    if (resto === "nvert") return ou(pl?.secao?.tipo === "poligonal" ? pl.secao.vertices.length : undefined);
    // o .REP que entra no topo do lance é o do pavimento do lance
    if (resto === "cargaREP") return ou(r.pavimentos.find((p) => p.pavimentoId === lance.pavimentoId)?.rep.find((l) => l.pilar === pilar)?.total);
    if (resto === "Nk") return ou(lance.carga.nk);
    if (resto === "Mkxi") return ou(lance.carga.mkx);
    if (resto === "Mkyi") return ou(lance.carga.mky);
    const d = lance.dimensionamento;
    if (!d) return NaN;
    if (caso) {
      const c = d.casos.find((x) => x.rotulo === caso[1]);
      if (!c) return NaN;
      const mapa: Record<string, number | undefined> = {
        Mkx: c.mx,
        Mky: c.my,
        Mktot: c.mTotal,
        MRx1a: c.mrx,
        MRx2a: c.m2x,
        MRy1a: c.mry,
        MRy2a: c.m2y,
        MRtot: c.mrTotal,
        incLN: c.anguloLN,
        "1/r": c.curvatura * 1000,
        "x/d": c.xd,
        defCon: c.deformacaoConcreto,
        defAco: c.deformacaoAco,
      };
      return ou(mapa[caso[2]!]);
    }
    const uma = d.barras.length === 1 ? d.barras[0] : undefined;
    // a retangular girada vai ao porte como poligonal: B e H são os do pilar
    const ret = d.secao.tipo === "retangular" ? d.secao : pl && !pl.secao ? { b: pl.b, h: pl.h } : undefined;
    const mapa: Record<string, number | undefined> = {
      lambdaX: d.lambdaX,
      lambdaY: d.lambdaY,
      As: d.as,
      taxa: d.taxa,
      "barras.n": uma?.quantidade,
      "barras.phi": uma?.bitola,
      "estribo.phi": d.estribo.bitola,
      "estribo.s": d.estribo.espacamento,
      Bw: ret?.b,
      Hw: ret?.h,
    };
    return ou(mapa[resto]);
  }

  // a ordem importa: os casadores mais específicos primeiro
  const casadores = [otimizacao, lajeproc, codigoDoLado, laje, reacao, totais, desdim, resumoDesenho, viga, rep, verificacao, pilaredi];
  return (id: string) => {
    for (const c of casadores) {
      const x = c(id);
      if (x !== undefined) return x;
    }
    return undefined;
  };
}

/** Itens do MODO-CALCULO que a V2 mostra ativos (ver `CalculoV2.evidencias`). */
function evidencias(r: ResultadoSistrut, avisos: readonly string[], obra: Obra) {
  const out: string[] = [];
  const codigos = (l: { codigos: number[] }) => l.codigos.join(",");
  const otimizou = r.pavimentos.some((p) =>
    p.esforcos.lajes.some((l) => {
      const antes = p.esforcosAntesOtimizacao.lajes.find((x) => x.nome === l.nome);
      return antes && codigos(antes) !== codigos(l);
    }),
  );
  // a otimização mudou um código, ou parou no laço do original (tela parada)
  if (otimizou || r.pavimentos.some((p) => p.otimizacaoParada)) out.push("R3");
  // VIGA.INI fora dos limites que o corrigido impõe: redução 0,15..1, % gerada 4..96
  const vi = r.parametros.viga;
  if (vi.reducaoNegativos < 0.15 || (vi.acidentalGerada && (vi.porcentagemAcidentalGerada < 4 || vi.porcentagemAcidentalGerada > 96))) out.push("R6");
  if (avisos.some((a) => a.includes("soma das áreas parciais"))) out.push("M-a");
  if (r.pavimentos.some((p) => p.montagem.vigas.some((v) => [v.balancoEsquerdo, ...v.tramos, v.balancoDireito].some((t) => t?.divisoes.some((d) => d.indexada)))))
    out.push("V-a");
  // o original levou o MEP ao pilar sem a inclinação (sem .RLP) ou sem a rigidez da viga
  // ("Defino seção" N), e o corrigido usa as duas (P-a)
  if (obra.parametrosPilar?.rigidezVigas === false || obra.parametrosPilar?.rlp === false) out.push("P-a");
  return out;
}

// ---------------------------------------------------------------- motor

function commitDe(raiz: string) {
  const git = (...a: string[]) => execFileSync("git", ["-C", raiz, ...a], { encoding: "utf8" }).trim();
  try {
    return git("rev-parse", "--short", "HEAD") + (git("status", "--porcelain", "--", "src") ? "+mod" : "");
  } catch {
    return "sem git";
  }
}

/** Carrega o motor da V2 em `raiz` (somente leitura). */
export async function abrirMotor(raiz: string): Promise<Motor> {
  const m = (p: string) => import(pathToFileURL(join(raiz, "src", p)).href);
  const [fluxo, normas, vicalc, quant, descalc, f32, laje, viga, pilar] = await Promise.all([
    m("calculo/fluxo.ts"),
    m("calculo/normas/index.ts"),
    m("calculo/sistrut/vigas/vicalc.ts"),
    m("calculo/sistrut/quant/vigas.ts"),
    m("calculo/sistrut/vigas/desinitDescalc.ts"),
    m("calculo/sistrut/base/f32.ts"),
    m("armazenamento/sistrut/laje.ts"),
    m("armazenamento/sistrut/viga.ts"),
    m("armazenamento/sistrut/pilar.ts"),
  ]);
  const v2: ModulosV2 = { fluxo, normas, vicalc, quant, descalc, f32, laje, viga, pilar };
  const ext = (a: ArquivoOriginal) => a.nome.slice(a.nome.lastIndexOf(".")).toUpperCase();

  function importar(arquivos: readonly ArquivoOriginal[], opcoes: OpcoesImportacao = {}): Importacao {
    const avisos: string[] = [];
    let obra: Obra | undefined;
    const laj = arquivos.find((a) => ext(a) === ".LAJ");
    if (laj) {
      const r = v2.laje.importarLaj(new TextDecoder("latin1").decode(laj.dados), opcoes.laj ?? {});
      if (!r.ok) throw new Error(`importarLaj(${laj.nome}): ${r.erros.join("; ")}`);
      obra = r.obra;
      avisos.push(...r.avisos.map((a) => `${laj.nome}: ${a}`));
    }
    // o .TAB dá o rept de cada viga no DESENHO (`viga.repeticoes`)
    const deViga = arquivos.filter((a) => [".VIG", ".SEC", ".FOR", ".DSP", ".TAB"].includes(ext(a)) || ["VIGA.INI", "DESENHO.INI"].includes(a.nome.toUpperCase()));
    if (deViga.length) {
      const r = v2.viga.importarVigasSistrut(deViga, obra);
      if (!r.ok) throw new Error(`importarVigasSistrut(${deViga.map((a) => a.nome).join(", ")}): ${r.erros.join("; ")}`);
      obra = r.obra;
      avisos.push(...r.avisos.map((a) => `vigas: ${a}`));
    }
    const col = arquivos.find((a) => ext(a) === ".COL");
    if (col) {
      const texto = (a: ArquivoOriginal) => new TextDecoder("latin1").decode(a.dados);
      const porNome = (nome: string) => arquivos.find((a) => a.nome.toUpperCase() === nome.toUpperCase());
      const reps = (opcoes.reps ?? []).map((x) => {
        const rep = porNome(x.arquivo);
        if (!rep) throw new Error(`${x.arquivo} não está entre os arquivos do caso`);
        const rlp = porNome(x.arquivo.replace(/\.REP$/i, ".RLP"));
        return { texto: texto(rep), nivelInicial: x.nivelInicial, nivelFinal: x.nivelFinal, ...(x.modo && { modo: x.modo }), ...(rlp && { rlp: texto(rlp) }) };
      });
      const pip = arquivos.find((a) => ext(a) === ".PIP");
      const pil = arquivos.find((a) => ext(a) === ".PIL");
      const r = v2.pilar.importarPilaresSistrut(
        { col: texto(col), ...(pip && { pip: texto(pip) }), ...(pil && { pil: texto(pil) }), reps },
        obra ? { base: obra } : {},
      );
      if ("erros" in r) throw new Error(`importarPilaresSistrut(${col.nome}): ${r.erros.join("; ")}`);
      obra = r.obra;
      avisos.push(...r.avisos.map((a) => `pilares: ${a}`));
    }
    if (!obra) throw new Error(`nenhum arquivo importável em ${arquivos.map((a) => a.nome).join(", ")}`);
    return { obra, avisos };
  }

  function calcular(obra: Obra, modo: Modo, avisosImportacao: readonly string[] = []): CalculoV2 {
    const res = v2.fluxo.calcularObra({ ...obra, modoCalculo: modo }, v2.normas.nb178);
    const r = res.sistrut;
    if (!r) throw new Error("calcularObra não devolveu resultado.sistrut (a norma não é a NB-1/78 pelo SISTRUT?)");
    if (r.modo !== modo) throw new Error(`resultado.sistrut no modo ${r.modo}, pedido ${modo}`);
    const avisos = [
      ...new Set([
        ...avisosImportacao.map((a) => `importador: ${a}`),
        ...res.avisos,
        ...r.pavimentos.flatMap((p) => [...p.avisos, ...p.montagem.avisos].map((a) => `${p.nome}: ${a}`)),
        ...r.lances.flatMap((l) => l.avisos),
        ...r.verificacoes.flatMap((v) => v.avisos),
        ...r.falhas.map((f) => `falha ${f.pavimentoId}: ${f.texto}`),
      ]),
    ];
    return {
      avisos,
      evidencias: evidencias(r, avisos, obra),
      valores(caso, op = {}) {
        const valor = casador(r, obra, v2, caso, op);
        const out = new Map<string, ValorV2>();
        for (const v of caso.valores) {
          const x = valor(v.id);
          if (x !== undefined) out.set(v.id, x);
        }
        return out;
      },
    };
  }

  return { raiz, commit: commitDe(raiz), importar, calcular };
}
