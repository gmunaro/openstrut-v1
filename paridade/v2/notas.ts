// O porquê de cada situação que não é "igual", para o relatório:
// - SEM_PAR: o que a V2 não produz, por caso e grupo de ids, com o item do
//   docs/MODO-CALCULO.md da V2 que diz que a obra não representa aquilo;
// - DIAGNOSTICOS: cada DIFERE do modo original, com a causa provável;
// - ITENS_CORRIGIDO, FAMILIAS_CORRIGIDO, regraCorrigido: por família de id, os itens do
//   MODO-CALCULO que mudam o número no modo corrigido e quanto cada um pode mudar
//   (a classificação esperada/inesperada de lib/comparar.ts sai daqui).
// Caminhos de código: os do worktree da V2 (src/calculo/...).
import type { ItemCorrigido, RegraCorrigido } from "../lib/comparar";

export interface Nota {
  /** Nome do caso (regex). */
  casos: RegExp;
  ids: RegExp;
  texto: string;
}

/** O que a V2 não produz. Primeira que casa. Vazia desde a V2 par-int2 (156e07c): com as
 *  obras importadas dos arquivos do original e os campos novos do modelo (verificações,
 *  predimensionamento, entrada de viga, parâmetros do .LAP), todo id dos casos tem par.
 *  Um motivo novo deve citar o item de "O que o modelo da obra ainda não representa" do
 *  MODO-CALCULO. */
export const SEM_PAR: Nota[] = [];

/** Causa provável de cada DIFERE do modo original. Primeira que casa. Vazia desde a V2
 *  par-int2: os quatro grupos da rodada anterior (fôrma dos des_* sem lajes no corte,
 *  alvenaria sobre laje do cargas, numeração dos lados do r2 e o total do painel do
 *  umadir) eram entrada que a obra não representava e saíram com `lajesNoCorte`,
 *  `pavimento.alvenarias`/`cargasOcupacao` e `laje.poligono` lidos do .LAJ e do .FOR. */
export const DIAGNOSTICOS: Nota[] = [];

/** Causa provável de um caso cuja montagem a V2 recusa (o caso sai em "Erros"). */
export const DIAGNOSTICOS_ERRO: Record<string, string> = {
  v2par2_laje_tipos:
    "Bug da V2 (importador × validação). A L5 rebaixada −10 cm grava o grupo (A_10cc(·,3), o nível da laje) como −10 no TIP.LAJ (linha 227). " +
    "`importarLaj` o passa para `laje.grupo` (src/armazenamento/sistrut/laje.ts:216) e a validação da obra exige grupo ≥ 0 (src/armazenamento/arquivo.ts:939-941, `naoNegativo`): a obra que o importador monta não passa no próprio leitor. " +
    "O LAJECALC só compara grupos (iguais ou não, LAJECALC.BAS:3709), então o grupo negativo é entrada válida do original. Prévia fora do comparador, com o −10 trocado por 10 numa cópia do .LAJ: 263 de 263 iguais no modo original.",
};


/** Causa provável das diferenças inesperadas do modo corrigido (as que nenhum item do
 *  MODO-CALCULO explica). A classe continua inesperada: é o que a próxima rodada da V2
 *  tem de decidir. */
export const DIAGNOSTICOS_CORRIGIDO: Nota[] = [];
// O corte do STR$ do .REP (v2par2_viga_varios, P8/P9 da VC) virou o D-21 do MODO-CALCULO
// na V2 par-backend (4cfc810): o corrigido grava o texto sem corte e o pilar lê o valor.

/** Itens do MODO-CALCULO da V2 ("Defeitos do original corrigidos" e "Outras diferenças
 *  do corrigido") e o quanto cada um pode mudar um número (`Efeito`, lib/comparar.ts).
 *  A precisão (até 1 na última casa) vale para todo id e não está aqui. */
export const ITENS_CORRIGIDO: Record<string, Omit<ItemCorrigido, "codigo">> = {
  materiais: {
    nome: "materiais (aço 500 MPa, concreto 25 kN/m³, fck/98,0665)",
    // densidade +1,97 %, fyk +1,97 % (As −1,9 %), fck +1,97 %; o produto de dois dá ≈ 4 %
    efeito: { tipo: "relativo", max: 0.05 },
  },
  R5: { nome: "R5 (.REP sem truncar)", efeito: { tipo: "absoluto", max: 0.01 } },
  "V-a": { nome: "V-a (reação indexada inteira)", efeito: { tipo: "absoluto", max: 0.002 } },
  R1: { nome: "R1 (flecha na espessura mínima)", efeito: { tipo: "caminho" } },
  R2: { nome: "R2 (LAJEPROC refaz o vizinho)", efeito: { tipo: "caminho" } },
  R3: { nome: "R3 (código fracionário na otimização)", efeito: { tipo: "caminho" } },
  "M-a": { nome: "M-a (região do bordo no nó sem saída)", efeito: { tipo: "caminho" } },
  R8: { nome: "R8 (σs elástico)", efeito: { tipo: "caminho" } },
  "D-ψ": { nome: "D-ψ (ρ do ψ com a As do tramo)", efeito: { tipo: "caminho" } },
  R11: { nome: "R11 (DESINIT, barra longa)", efeito: { tipo: "caminho" } },
  "D-1": { nome: "D-1 (fluência e^X − 1)", efeito: { tipo: "caminho" } },
  "D-17": { nome: "D-17 (ângulo da LN por bissecção)", efeito: { tipo: "caminho" } },
  "P-a": { nome: "P-a (inclinação e rigidez da viga no MEP do pilar)", efeito: { tipo: "caminho" } },
  "D-21": {
    nome: "D-21 (.REP sem o corte do STR$; o pilar lê o momento e o total com todas as casas)",
    efeito: { tipo: "caminho" },
    principal: true,
  },
  cobrimentos: { nome: "cobrimentos da obra", efeito: { tipo: "naoSeAplica", porque: "as obras usam os cobrimentos do original (1,5 / 2 / 2 cm)" } },
  H: { nome: "H (As,mín 0,25 % com CA-25)", efeito: { tipo: "naoSeAplica", porque: "os casos são CA-50" } },
  R9: { nome: "R9 (área do φ32)", efeito: { tipo: "naoSeAplica", porque: "nenhum arranjo dos casos usa φ32" } },
  R6: { nome: "R6 (redução dos negativos e % de acidental limitadas)", efeito: { tipo: "caminho" } },
  "M-b": { nome: "M-b (eixo em ordem decrescente)", efeito: { tipo: "naoSeAplica", porque: "a V2 grava os eixos em ordem crescente" } },
  "D-3": { nome: "D-3 (Nk = 0)", efeito: { tipo: "naoSeAplica", porque: "nenhum lance tem Nk = 0" } },
  "D-6": { nome: "D-6 (seção poligonal anti-horária)", efeito: { tipo: "naoSeAplica", porque: "os pilares são retangulares" } },
  "D-7": { nome: "D-7 (\"ok\" com ≥)", efeito: { tipo: "naoSeAplica", porque: "só no empate exato entre resistente e atuante" } },
  "D-8": { nome: "D-8 (redução de sobrecarga sem o peso próprio)", efeito: { tipo: "naoSeAplica", porque: "a redução de sobrecarga está desligada no .PIP de fábrica (\"N\")" } },
};

/** Tabelas das grandezas discretas (parâmetros "SISTRUT", src/calculo/sistrut/base/parametros.ts). */
const BITOLAS = [4, 5, 6.3, 8, 10, 12.5, 16, 20, 25, 32];
const ESPACAMENTOS_LAJE = [7.5, 10, 12.5, 15, 17.5, 20];
const ALTURAS_LAJE = Array.from({ length: 35 }, (_, i) => 6 + i);

const LAJE_FINAL = ["materiais", "R3"];
const CARGA_LAJE = ["materiais", "R3", "M-a", "M-b"];
const ANALISE = ["materiais", "R3", "M-a", "M-b", "V-a", "R6"];
const DESDIM = [...ANALISE, "R8", "R9", "H", "cobrimentos"];
const PILAR = ["materiais", "R3", "M-a", "V-a", "R5", "D-1", "D-3", "D-6", "D-7", "D-8", "D-17", "P-a", "D-21", "cobrimentos"];

interface Familia {
  re: RegExp;
  itens: string[];
  tabela?: readonly number[];
  /** Item com o qual a grandeza deixa de existir no corrigido (a tela parada do R3). */
  someNoCorrigido?: string;
}
/** Família de id → itens que podem mudar o número no corrigido. Lista vazia = grandeza
 *  que nenhum item muda (entrada ou geometria; só a precisão). Primeira que casa. */
export const FAMILIAS_CORRIGIDO: Familia[] = [
  // lajes: entrada, μ, espessura mínima, imposição, momentos e armaduras, LAJEPROC
  { re: /^L\d+\.(H|perm|acid|Hmin\.perm|Hmin\.acid|mu)$/, itens: [] },
  { re: /^L\d+\.lado\d+\.codigo$/, itens: LAJE_FINAL },
  // tela parada da otimização: só existe no original (o corrigido converge, R3)
  { re: /^L\d+\.otim\./, itens: ["R3", "materiais"], someNoCorrigido: "R3" },
  { re: /^L\d+\.Hmin$/, itens: ["R1", "materiais"], tabela: ALTURAS_LAJE },
  { re: /^L\d+\.(Hmin\.)?As\.phi$/, itens: ["R1", "materiais"], tabela: BITOLAS },
  { re: /^L\d+\.(Hmin\.)?As\.s$/, itens: ["R1", "materiais"], tabela: ESPACAMENTOS_LAJE },
  { re: /^L\d+\.Hmin\..+$/, itens: ["R1", "materiais"] },
  { re: /^L\d+\.(pp|p|x\/d)$/, itens: ["materiais"] },
  { re: /^L\d+\.(M|As)[+-]\w+\.antesOtim$/, itens: ["materiais"] },
  { re: /^L\d+\.(M|As)[+-]\w+$/, itens: LAJE_FINAL },
  { re: /^L\d+\.proc\.pos(Princ|Sec)$/, itens: LAJE_FINAL },
  { re: /^L\d+-L\d+\.proc\.neg$/, itens: ["materiais", "R2", "R3"] },
  // LAJEMONT: áreas de influência (charneiras: códigos do R3), cargas por bordo, totais
  { re: /^L\d+>\w+\.(s\d+\.)?(area|qArea|qEstru|qLinear)$/, itens: ["R3", "M-a", "M-b"] },
  { re: /^L\d+>\w+\.(s\d+\.)?qPeso$/, itens: CARGA_LAJE },
  { re: /^total\.(cargasArea|cargasLineares)$/, itens: [] },
  // peso das vigas pela seção (o .LAJ não grava o peso digitado): muda com a densidade
  { re: /^total\.ppVigas$/, itens: ["materiais"] },
  { re: /^total\.(cargasAreaConsiderado|cargasLinearesConsiderado|estrutura)$/, itens: ["M-a"] },
  { re: /^total\.ppLajes$/, itens: ["materiais"] },
  { re: /^total\.(painel|vigas|pilares|vigasPilares)$/, itens: CARGA_LAJE },
  // VIGA: .VIG, análise, .REP. Viga pelo nome (V1, D1, VR6, VA) e "des." = a análise que o
  // DESDIM imprime; ".tela" = a tela da viga que parou ("Continuo" N)
  { re: /^(des\.)?\w+\.t\d+\.(d\d+\.)?(L|J|D|alv)$/, itens: [] },
  { re: /^(des\.)?\w+\.a\d+\.Mext$/, itens: [] },
  { re: /^\w+\.t\d+\.(\d+a\.)?(pp|ppViga)$/, itens: ["materiais"] },
  { re: /^\w+\.t\d+\.\d+a\.alv$/, itens: [] },
  { re: /^(des\.)?\w+\.t\d+\.(d\d+\.)?(P|Pac)$/, itens: [...CARGA_LAJE, "R6"] },
  { re: /^(des\.)?\w+\.t\d+\.(d\d+\.)?(F|Fac)$/, itens: ["materiais", "V-a", "R3", "M-a"] },
  { re: /^(des\.)?\w+\.(somaR|MEP\d+|a\d+\.(max\.|min\.)?(M-|R)|t\d+\.(EEP\.|max\.)?(Ve|x|M\+|Vd|fEJ))$/, itens: ANALISE },
  { re: /^REP\.\w+(\.carga\.\w+)?$/, itens: [...ANALISE, "R5", "D-21"] },
  { re: /^REP\.\w+\.momento\.\w+$/, itens: [...ANALISE, "D-21"] },
  // DESDIM e resumo do DESENHO 4
  { re: /^(des\.)?\w+\.cobrimento$/, itens: ["cobrimentos"] },
  { re: /^(des\.)?\w+\.[at]\d+\.(x\/d|Mk|Ast|Asc|barras|barrasComp|fissura)(\.tela)?$/, itens: DESDIM },
  { re: /^(des\.)?\w+\.t\d+\.(Vke|Vkd|flecha)(\.tela)?$/, itens: ANALISE },
  { re: /^(des\.)?\w+\.t\d+\.(Aee|Aed|estriboE|estriboD)(\.tela)?$/, itens: [...ANALISE, "D-ψ"] },
  { re: /^resumo\..*\.(Vconc|Afor|rept)$/, itens: [] },
  { re: /^resumo\./, itens: [...DESDIM, "D-ψ", "R11"] },
  // PILAR opção 6 (verificações): geometria; esforços e ELU
  { re: /^(e\d+\.)?P\.(Jx|Jy|lambdaX|lambdaY)$/, itens: [] },
  { re: /^(e\d+\.)?c\d+\./, itens: ["materiais", "D-1", "D-3", "D-6", "D-7", "D-17"] },
  // PILAREDI: <pilar>.<nível>.<r rodada>.<campo> (P5.As, P7.FUND.1e.Mkx, PA.FUND.r2.As)
  { re: /^\w+\.((?:FUND|PAV\d+|COB)\.)?(r\d+\.)?(lambdaX|lambdaY|Bw|Hw|rot|Dext|nvert)$/, itens: [] },
  { re: /^\w+\.((?:FUND|PAV\d+|COB)\.)?(r\d+\.)?cobrimento$/, itens: ["cobrimentos"] },
  { re: /^\w+\.((?:FUND|PAV\d+|COB)\.)?(r\d+\.)?(Nk|Mkxi|Mkyi|cargaREP|As|taxa|barras\.(n|phi)|estribo\.(phi|s)|\d[ef]\.\w+|\d[ef]\.(1\/r|x\/d)|pre\.\w+|predim\.\w+)$/, itens: PILAR },
];

/** Caso rodado sem o LAJECALC 6 (`otimizaNegativos: false`): o R3 não age. */
const SEM_OTIMIZACAO = /^v2par_laje_r2$/;

/** O que se sabe do caso na hora de classificar uma diferença do corrigido. */
export interface ContextoCorrigido {
  caso: string;
  id: string;
  /** Ids do caso. */
  ids: readonly string[];
  /** O id difere do original no corrigido. */
  mudou(id: string): boolean;
  /** Itens que a V2 mostrou ativos (`CalculoV2.evidencias`, dos dois modos). */
  evidencias: readonly string[];
  /** Número de outro id do caso: o impresso pelo original e o da V2 no corrigido. */
  numero?(id: string): { original?: number | undefined; corrigido?: number | undefined };
  /** Texto impresso pelo original para um id do caso. */
  impresso?(id: string): string | undefined;
}

/** O pilar do id lê momento do .REP no caso (há `REP.<pilar>.momento.*` entre os ids). */
const leMomentoDoRep = (c: ContextoCorrigido) => {
  const pilar = /^(\w+)\./.exec(c.id)?.[1];
  return !!pilar && c.ids.some((i) => i.startsWith(`REP.${pilar}.momento.`));
};

/** Evidência no caso de cada item de caminho; sem regra aqui, o item não explica nada
 *  além da faixa dos outros. */
const ATIVO: Record<string, (c: ContextoCorrigido) => boolean> = {
  R3: (c) => c.evidencias.includes("R3"),
  "M-a": (c) => c.evidencias.includes("M-a"),
  R6: (c) => c.evidencias.includes("R6"),
  // a flecha sobe o Hmin; o resto da linha da tabela sai do Hmin
  R1: (c) => {
    const l = /^(L\d+)\.Hmin/.exec(c.id)?.[1];
    return !!l && (c.id === `${l}.Hmin` || c.mudou(`${l}.Hmin`));
  },
  // a negativa da continuidade passa a ser a maior dos dois lados
  R2: (c) => /\.proc\.neg$/.test(c.id),
  // o corrigido sempre usa a As do tramo no ρ do ψ
  "D-ψ": () => true,
  // o corrigido sempre usa e^X − 1 na flambagem (casos "f") e bissecção no ângulo da LN
  // (PILAREDI e PILAR opção 6)
  "D-1": (c) => /\.\df\./.test(c.id),
  "D-17": (c) => /\.\d[ef]\./.test(c.id) || /^(e\d+\.)?c\d+\./.test(c.id),
  // momento da viga levado ao pilar: o original o levou sem a inclinação (sem .RLP) ou sem
  // a rigidez da viga ("Defino seção" N), e o pilar lê momento do .REP no caso
  "P-a": (c) => c.evidencias.includes("P-a") && leMomentoDoRep(c),
  // .REP: só onde o original perdeu dígitos (parcela ou momento inteiro cortado pelo STR$:
  // impresso sem ponto e o número da V2 com dois ou mais dígitos); pilar: o que lê momento
  // do .REP no caso (o MEP chega com todas as casas, não truncado em 2)
  "D-21": (c) => {
    if (/^REP\.\w+\.(carga|momento)\.\w+$/.test(c.id)) {
      const n = c.numero?.(c.id);
      const impresso = c.ids.includes(c.id) ? c.impresso?.(c.id) : undefined;
      return !!impresso && !impresso.includes(".") && n?.corrigido !== undefined && Math.abs(n.corrigido) >= 10;
    }
    return /^\w+\.(FUND|PAV\d+|COB)\./.test(c.id) && leMomentoDoRep(c);
  },
};

/** Áreas das bitolas no .DSP de fábrica, cm² (PARAMETROS_DSP.bitolas da V2). */
const AREAS_DSP: Record<string, number> = { "5": 0.2, "6.3": 0.315, "8": 0.5, "10": 0.8, "12.5": 1.25, "16": 2, "20": 3.15, "25": 5 };

/** Arranjo de viga do DESDIM ("<viga>.a1.barras"): a As da mesma seção nos dois modos. */
function arranjoDe(c: ContextoCorrigido) {
  const m = /^(.*\.[at]\d+)\.barras(\.tela)?$/.exec(c.id);
  const n = m && c.numero?.(`${m[1]}.Ast${m[2] ?? ""}`);
  if (!n || n.original === undefined || n.corrigido === undefined) return undefined;
  return { areas: AREAS_DSP, asOriginal: n.original, asCorrigido: n.corrigido };
}

/** Regra do id no corrigido (undefined: família sem regra). O R5 dos totais do .REP vale
 *  0,01 por parcela da linha. */
export function regraCorrigido(c: ContextoCorrigido): RegraCorrigido | undefined {
  const f = FAMILIAS_CORRIGIDO.find((x) => x.re.test(c.id));
  if (!f) return undefined;
  const pilarRep = /^REP\.(P\d+)$/.exec(c.id)?.[1];
  const parcelas = pilarRep ? Math.max(1, c.ids.filter((i) => i.startsWith(`REP.${pilarRep}.carga.`)).length) : 1;
  const itens = f.itens
    .filter((i) => !(i === "R3" && SEM_OTIMIZACAO.test(c.caso)))
    // só há reação indexada truncada onde há viga apoiada em viga
    .filter((i) => i !== "V-a" || c.evidencias.includes("V-a"))
    .map((codigo): ItemCorrigido => {
      const item = ITENS_CORRIGIDO[codigo];
      if (!item) throw new Error(`item ${codigo} sem entrada em ITENS_CORRIGIDO`);
      const e = item.efeito;
      return { codigo, ...item, efeito: codigo === "R5" && e.tipo === "absoluto" ? { ...e, max: e.max * parcelas } : e };
    });
  const ativos = itens.filter((i) => i.efeito.tipo === "caminho" && ATIVO[i.codigo]?.(c)).map((i) => i.codigo);
  return {
    itens,
    ativos,
    tabela: f.tabela,
    someNoCorrigido: f.someNoCorrigido && ativos.includes(f.someNoCorrigido) ? ITENS_CORRIGIDO[f.someNoCorrigido]!.nome : undefined,
    tabelasTexto: /\.proc\./.test(c.id) ? { bitola: BITOLAS, espacamento: ESPACAMENTOS_LAJE } : undefined,
    arranjo: arranjoDe(c),
  };
}

/** Primeira nota do caso que casa o id. */
export const notaDe = (notas: readonly Nota[], caso: string, id: string) => notas.find((n) => n.casos.test(caso) && n.ids.test(id))?.texto;
