// Testes do comparador: tolerância do número impresso, truncamento, casamento por id,
// classificação do modo corrigido, notas, plantas contra o .LAJ gravado pelo original,
// validação do JSON de caso e extração da impressora.prn. Não precisam da V2.
// Rodar: bun test paridade/testes
import { describe, expect, test } from "bun:test";
import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { type CasoRef, casasDoValor, validarCaso, type ValorRef } from "../lib/caso";
import { classificar, compararCaso, type ItemCorrigido, type Linha, type RegraCorrigido, situacao } from "../lib/comparar";
import { bate, bateTruncado, casasDoTexto, fixo, lerNumero, tolerancia } from "../lib/numero";
import { casoDoRun, extrairCaso, RUNS_PADRAO } from "../original/extrair";
import { conferirFontes } from "../original/fontes";
import { lerCasos } from "../lib/caso";
import { DIAGNOSTICOS, FAMILIAS_CORRIGIDO, ITENS_CORRIGIDO, notaDe, regraCorrigido, SEM_PAR } from "../v2/notas";
import { arquivosDoCaso, PASTA_ARQUIVOS } from "../v2/obras/importada";
import { readdirSync } from "node:fs";

// runs do oráculo ($ORACULO/runs): os testes que leem os runs pulam sem ORACULO ou sem a pasta
const RUNS = process.env.ORACULO ? join(process.env.ORACULO, "runs") : "";
const temRuns = RUNS !== "" && existsSync(RUNS);

const ref = (impresso: string, extra: Partial<ValorRef> = {}): ValorRef => ({
  id: "x",
  grandeza: "x",
  unidade: "",
  impresso,
  fonte: "impressora.prn:1",
  ...extra,
});

describe("número impresso", () => {
  test("lê os formatos do QB", () => {
    expect(lerNumero(".35")).toBe(0.35);
    expect(lerNumero("-.65")).toBe(-0.65);
    expect(lerNumero("-0.00")).toBe(-0);
    expect(lerNumero("  52 ")).toBe(52);
    expect(lerNumero("Compressao Centrada")).toBeNull();
  });
  test("casas decimais do texto", () => {
    expect(casasDoTexto("0.05550")).toBe(5);
    expect(casasDoTexto(".35")).toBe(2);
    expect(casasDoTexto("52")).toBe(0);
  });
});

describe("tolerância: meia unidade da última casa impressa", () => {
  test("valor da tolerância", () => {
    expect(tolerancia(fixo("0.25"))).toBeCloseTo(0.005, 12);
    expect(tolerancia(fixo("0.382"))).toBeCloseTo(0.0005, 12);
    expect(tolerancia(fixo("52"))).toBe(0.5);
  });
  test("bate até a meia unidade, inclusive", () => {
    expect(bate(fixo("0.25"), 0.2549)).toBe(true);
    expect(bate(fixo("0.25"), 0.255)).toBe(true);
    expect(bate(fixo("0.25"), 0.2551)).toBe(false);
    expect(bate(fixo("0.25"), 0.2214)).toBe(false);
    expect(bate(fixo("52"), 51.96)).toBe(true);
    expect(bate(fixo("0.00"), NaN)).toBe(false);
  });
  test("truncado em direção a zero (FIX)", () => {
    expect(bateTruncado({ valor: 0.72, casas: 2 }, 0.729)).toBe(true);
    expect(bateTruncado({ valor: 0.72, casas: 2 }, 0.73)).toBe(false);
    expect(bateTruncado({ valor: 0.72, casas: 2 }, 0.7199)).toBe(false);
    // o .REP imprime "-.64" para o MEP −0,648
    expect(bateTruncado({ valor: -0.64, casas: 2 }, -0.648)).toBe(true);
    expect(bateTruncado({ valor: -0.64, casas: 2 }, -0.65)).toBe(false);
    // parcela já truncada e guardada em SINGLE pela V2: 2,08 → 2,0799999237
    expect(bateTruncado({ valor: 2.08, casas: 2 }, Math.fround(2.08))).toBe(true);
    expect(bateTruncado({ valor: -1.67, casas: 2 }, Math.fround(-1.67))).toBe(true);
    expect(bateTruncado({ valor: 2.08, casas: 2 }, 2.0799)).toBe(false);
  });
  test("situação: número, casas forçadas, truncamento e texto", () => {
    expect(situacao(ref("0.35"), 0.3549)).toBe("igual");
    expect(situacao(ref("0.35"), 1.2705)).toBe("DIFERE");
    expect(situacao(ref("0.35"), undefined)).toBe("sem par");
    // "1.1" impresso por STR$ de um valor truncado na 2ª casa
    expect(situacao(ref("1.1", { casas: 2, trunca: true }), 1.105)).toBe("igual");
    expect(situacao(ref("1.1", { casas: 2, trunca: true }), 1.1602)).toBe("DIFERE");
    expect(situacao(ref("1.1"), 1.14)).toBe("igual");
    expect(situacao(ref("Compressao Centrada"), "compressao  centrada")).toBe("igual");
    expect(situacao(ref("Compressao Centrada"), "Flexao Obliqua")).toBe("DIFERE");
    expect(situacao(ref("0.35"), "0.35")).toBe("igual");
    expect(situacao(ref("0.35"), "n/d")).toBe("DIFERE");
  });
});

describe("casamento por id", () => {
  const caso: CasoRef = {
    caso: "t",
    run: "r",
    programa: "p",
    descricao: "",
    entrada: {},
    valores: [ref("0.25", { id: "L1.M+princ" }), ref("0.50", { id: "L1.M-maior" }), ref("7.0", { id: "L1.Hmin" })],
  };
  test("cada valor do original procura o mesmo id na V2", () => {
    const linhas = compararCaso(caso, new Map<string, number>([["L1.M+princ", 0.2214], ["L1.M-maior", 0.5]]));
    expect(linhas.map((l) => [l.ref.id, l.situacao])).toEqual([
      ["L1.M+princ", "DIFERE"],
      ["L1.M-maior", "igual"],
      ["L1.Hmin", "sem par"],
    ]);
  });
  test("elemento que a V2 não calculou (NaN) é DIFERE, não sem par", () => {
    expect(situacao(ref("2.09"), NaN)).toBe("DIFERE");
  });
  test("validação do JSON de caso", () => {
    expect(validarCaso(caso)).toEqual([]);
    expect(validarCaso({ ...caso, valores: [...caso.valores, caso.valores[0]] })).toEqual(["id repetido: L1.M+princ"]);
    expect(validarCaso({ caso: "t", run: "r" })).toContain(`campo "programa" ausente ou não é texto`);
  });
});

describe("casas pelo formato do original (STR$ corta zeros)", () => {
  test("MEP, flecha, volume e fôrma do resumo, μ", () => {
    expect(casasDoValor({ id: "V5.MEP0", impresso: "-1.4" })).toBe(2);
    expect(casasDoValor({ id: "V5.t1.flecha", impresso: "0" })).toBe(2);
    expect(casasDoValor({ id: "resumo.V5.Afor", impresso: "9" })).toBe(1);
    expect(casasDoValor({ id: "L1.mu", impresso: "1" })).toBe(2);
    // o JSON manda; outras grandezas ficam com as casas do texto
    expect(casasDoValor({ id: "V5.MEP0", impresso: "-1.4", casas: 3 })).toBe(3);
    expect(casasDoValor({ id: "L1.M+princ", impresso: "0.25" })).toBeUndefined();
  });
});

describe("modo corrigido: esperada ou inesperada", () => {
  const linha = (impresso: string, v2: number | string, sit: Linha["situacao"] = "DIFERE"): Linha => ({ ref: ref(impresso), v2, situacao: sit });
  const item = (codigo: string, efeito: ItemCorrigido["efeito"]): ItemCorrigido => ({ codigo, nome: codigo, efeito });
  const materiais = item("materiais", { tipo: "relativo", max: 0.05 });
  const R1 = item("R1", { tipo: "caminho" });
  const regra = (itens: ItemCorrigido[], extra: Partial<RegraCorrigido> = {}): RegraCorrigido => ({ itens, ativos: [], ...extra });
  test("id que já difere no modo original: inesperada, herdada", () => {
    expect(classificar(linha("1.00", 1.2), linha("1.00", 1.1), regra([materiais]))).toMatchObject({ classe: "inesperada", herdada: true });
  });
  test("família sem regra: inesperada", () => {
    expect(classificar(linha("1", 2), undefined, undefined).classe).toBe("inesperada");
  });
  test("materiais: até 5 % mais 1 na última casa; acima disso, inesperada", () => {
    expect(classificar(linha("1.00", 1.05), undefined, regra([materiais])).classe).toBe("esperada");
    expect(classificar(linha("1.00", 1.07), undefined, regra([materiais])).classe).toBe("inesperada");
    expect(classificar(linha("1.00", 0.93), undefined, regra([materiais])).classe).toBe("inesperada");
  });
  test("item de caminho só explica acima da faixa quando está ativo no caso", () => {
    expect(classificar(linha("10.0", 12), undefined, regra([R1, materiais])).classe).toBe("inesperada");
    expect(classificar(linha("10.0", 12), undefined, regra([R1, materiais], { ativos: ["R1"] }))).toMatchObject({ classe: "esperada" });
  });
  test("grandeza discreta: os materiais movem um passo da tabela", () => {
    const tabela = [7.5, 10, 12.5, 15, 17.5, 20];
    expect(classificar(linha("12.5", 15), undefined, regra([materiais], { tabela })).classe).toBe("esperada");
    expect(classificar(linha("12.5", 17.5), undefined, regra([materiais], { tabela })).classe).toBe("inesperada");
  });
  test("a V2 sem número (NaN, \"NAO\", \"\") onde o original tem: inesperada", () => {
    expect(classificar(linha("1.00", NaN), undefined, regra([materiais])).classe).toBe("inesperada");
    expect(classificar(linha("1.00", "NAO"), undefined, regra([materiais])).classe).toBe("inesperada");
    expect(classificar(linha("#6.3c/12.5", "NAO"), undefined, regra([materiais])).classe).toBe("inesperada");
    expect(classificar(linha("#6.3c/12.5", ""), undefined, regra([materiais])).classe).toBe("inesperada");
  });
  test("arranjo de laje: um passo de bitola e de espaçamento", () => {
    const tabelasTexto = { bitola: [5, 6.3, 8, 10], espacamento: [7.5, 10, 12.5, 15] };
    expect(classificar(linha("#6.3c/12.5", "#6.3c/15"), undefined, regra([materiais], { tabelasTexto })).classe).toBe("esperada");
    expect(classificar(linha("#6.3c/7.5", "#10c/15"), undefined, regra([materiais], { tabelasTexto })).classe).toBe("inesperada");
  });
  test("grandeza que nenhum item muda: só a precisão (1 na última casa); Afor com 1 casa não aceita ±1 m²", () => {
    expect(classificar(linha("5.38", 5.37), undefined, regra([])).classe).toBe("esperada");
    expect(classificar(linha("5.38", 5.2), undefined, regra([])).classe).toBe("inesperada");
    const afor: Linha = { ref: ref("9", { id: "resumo.V5.Afor", casas: 1 }), v2: 8, situacao: "DIFERE" };
    expect(classificar(afor, undefined, regra([])).classe).toBe("inesperada");
  });
});

describe("notas", () => {
  const casos = lerCasos([join(import.meta.dir, "..", "casos")]).flatMap((l) => ("caso" in l ? [l.caso] : []));
  const ctx = (caso: string, id: string) => ({ caso, id, ids: [], mudou: () => false, evidencias: [] });
  test("todo id dos casos, fora os sem par justificados, tem família no modo corrigido", () => {
    const semRegra = casos.flatMap((c) => c.valores.map((v) => v.id).filter((id) => !regraCorrigido(ctx(c.caso, id)) && !notaDe(SEM_PAR, c.caso, id)));
    expect(semRegra).toEqual([]);
  });
  test("os itens das famílias estão em ITENS_CORRIGIDO", () => {
    expect(FAMILIAS_CORRIGIDO.flatMap((f) => f.itens).filter((i) => !(i in ITENS_CORRIGIDO))).toEqual([]);
  });
  test("R3 não age no caso rodado sem a otimização (r2); V-a só com carga indexada", () => {
    const codigos = (caso: string, evidencias: string[] = ["R3"]) => regraCorrigido({ ...ctx(caso, "L1.M+princ"), evidencias })!.itens.map((i) => i.codigo);
    expect(codigos("v2par_laje_assim")).toContain("R3");
    expect(codigos("v2par_laje_r2")).not.toContain("R3");
    expect(codigos("v2par_laje_r3")).toContain("R3");
    const va = (evidencias: string[]) => regraCorrigido({ ...ctx("v2par_viga_fluxo", "V1.a0.R"), evidencias })!.itens.map((i) => i.codigo);
    expect(va([])).not.toContain("V-a");
    expect(va(["V-a"])).toContain("V-a");
  });
  test("D-21: no .REP só o inteiro cortado; no pilar, o que lê momento do .REP; P-a só com a evidência", () => {
    const ids = ["REP.P8.carga.VC", "REP.P7.momento.V1", "P7.FUND.Mkxi", "REP.P7.momento.V4", "P5.FUND.Mkxi"];
    const impressos: Record<string, string> = { "REP.P8.carga.VC": "3", "REP.P7.momento.V1": "-.64" };
    const corrigidos: Record<string, number> = { "REP.P8.carga.VC": 30, "REP.P7.momento.V1": -0.6556 };
    const regra = (id: string, evidencias: string[] = []) =>
      regraCorrigido({ ...ctx("v2par2_pilar_def", id), ids, evidencias, impresso: (i) => impressos[i], numero: (i) => ({ corrigido: corrigidos[i] }) })!;
    expect(regra("REP.P8.carga.VC").ativos).toContain("D-21");
    expect(regra("REP.P7.momento.V1").ativos).not.toContain("D-21");
    expect(regra("P7.FUND.Mkxi").ativos).toContain("D-21");
    expect(regra("P5.FUND.Mkxi").ativos).not.toContain("D-21");
    expect(regra("P7.FUND.Mkxi").ativos).not.toContain("P-a");
    expect(regra("P7.FUND.Mkxi", ["P-a"]).ativos).toContain("P-a");
  });
  test("item principal ativo nomeia a diferença mesmo dentro da faixa", () => {
    const principal: ItemCorrigido = { codigo: "D-21", nome: "D-21", efeito: { tipo: "caminho" }, principal: true };
    const materiais: ItemCorrigido = { codigo: "materiais", nome: "materiais", efeito: { tipo: "relativo", max: 0.05 } };
    const l: Linha = { ref: ref("1.00"), v2: 1.01, situacao: "DIFERE" };
    expect(classificar(l, undefined, { itens: [principal, materiais], ativos: ["D-21"] })).toMatchObject({ classe: "esperada", nota: "D-21, ativo no caso; com materiais" });
  });
  test("R5 dos totais do .REP: 0,01 por parcela da linha", () => {
    const r = regraCorrigido({ ...ctx("caso_b_viga", "REP.P5"), ids: ["REP.P5", "REP.P5.carga.V2", "REP.P5.carga.V5"] })!;
    expect(r.itens.find((i) => i.codigo === "R5")?.efeito).toEqual({ tipo: "absoluto", max: 0.02 });
  });
  test("cada diagnóstico e cada motivo de sem par casa algum id de algum caso", () => {
    for (const n of [...DIAGNOSTICOS, ...SEM_PAR])
      expect(casos.some((c) => n.casos.test(c.caso) && c.valores.some((v) => n.ids.test(v.id))), n.texto.slice(0, 60)).toBe(true);
  });
});

describe("arquivos do original de cada caso", () => {
  const pastas = readdirSync(PASTA_ARQUIVOS, { withFileTypes: true }).filter((d) => d.isDirectory()).map((d) => d.name);
  test.each(pastas)("%s: tem JSON de caso e montagem que importa a pasta", (caso) => {
    expect(existsSync(join(import.meta.dir, "..", "casos", `${caso}.json`))).toBe(true);
    expect(readFileSync(join(import.meta.dir, "..", "v2", "obras", `${caso}.ts`), "utf8")).toContain("montarImportada");
    const nomes = arquivosDoCaso(caso).map((a) => a.nome);
    // a obra começa pelo .LAJ; sem planta, pelo .VIG (des_especial, viga_varios) ou pelo .COL
    expect(nomes.some((n) => /\.(LAJ|VIG|COL)$/i.test(n))).toBe(true);
  });
});

describe("extração da impressora.prn", () => {
  // os JSON versionados em paridade/casos são a extração dos runs do oráculo (PLANO, seção 2)
  test.skipIf(!temRuns)("paridade/casos/*.json = extração dos runs do oráculo", () => {
    for (const [caso, run] of Object.entries(RUNS_PADRAO)) {
      const versionado = JSON.parse(readFileSync(join(import.meta.dir, "..", "casos", `${caso}.json`), "utf8"));
      expect(versionado).toEqual(casoDoRun(caso, join(RUNS, run)));
    }
  });
  test("PILAREDI: casos 1e/1f/2e/2f, armadura e fonte com a linha do .prn", () => {
    const prn = [
      "\x1b0\x1bN", // códigos ESC/P somem
      " COLUNA - P   5              Nivel FUND     (  0.00) ao PAV1     (  3.00)",
      "    Nivel Dimensionado FUND     (  0.00)         Lbx= 52      Lby= 52",
      "    Nk =   17.67 t        Mkx i =   0.00 tm     Mky i =   0.00 tm    ",
      "    Fck    0.150 t/cm2    Fyk    5.000 t/cm2    ACO B    Cobrimento  2.0 cm",
      "    caso    Mkx       Mky     Mk tot    Mkx 1a    Mkx 2a    Mky 1a    Mky 2a    Mk tot    Inc ln     1/r    x/d   Def con  Def aco",
      "    1e       0.35      0.00      0.35      1.02      0.00      0.00      0.00      1.02    270.0   0.1579   0.82   2.2625   0.5000",
      "     f       0.35      0.00      0.35      1.02      0.25      0.00      0.00      0.77    270.0   0.1579   0.82   2.2625   0.5000",
      "    As    3.20 cm2   Taxa   0.80%   4 # 10       # 6.3 c/ 12 ",
    ];
    const v = new Map(extrairCaso("caso_c_pilaredi", prn).map((x) => [x.id, x]));
    expect(v.get("P5.Nk")?.impresso).toBe("17.67");
    expect(v.get("P5.Nk")?.fonte).toBe("impressora.prn:4");
    expect(v.get("P5.1f.MRx2a")?.impresso).toBe("0.25");
    expect(v.get("P5.1f.MRtot")?.impresso).toBe("0.77");
    expect(v.get("P5.barras.n")?.impresso).toBe("4");
    expect(v.get("P5.estribo.phi")?.impresso).toBe("6.3");
    expect(v.get("P5.estribo.s")?.impresso).toBe("12");
    expect(v.size).toBe(4 + 2 * 13 + 6);
  });
  test(".REP: parcelas truncadas com 2 casas", () => {
    const prn = [
      "          Reacoes de Apoio",
      "    P  7 -    1.82           P  8 -    5.56",
      "    P 7       carga   .72 (V1) + 1.1 (V4) + ",
      "              momento -.64@1 [4]  (V1) > -1.22@2 [5]  (V4) > ",
    ];
    const v = new Map(extrairCaso("caso_b_viga", prn).map((x) => [x.id, x]));
    expect(v.get("REP.P7")?.impresso).toBe("1.82");
    expect(v.get("REP.P8")?.impresso).toBe("5.56");
    expect(v.get("REP.P7.carga.V4")).toMatchObject({ impresso: "1.1", casas: 2, trunca: true });
    expect(v.get("REP.P7.momento.V1")).toMatchObject({ impresso: "-.64", trunca: true });
  });
});

describe("casos de paridade/casos", () => {
  // as fontes .prn e telas/*.txt dos JSONs conferem com os runs do oráculo
  test.skipIf(!temRuns)("cada fonte contém o texto impresso", () => {
    for (const lido of lerCasos([join(import.meta.dir, "..", "casos")])) {
      if ("erro" in lido) throw new Error(`${lido.arquivo}: ${lido.erro}`);
      expect([lido.caso.caso, conferirFontes(lido.caso)]).toEqual([lido.caso.caso, []]);
    }
  });
  test("conferirFontes acusa a linha errada", () => {
    const runs = join(RUNS, "v2par_des_2tramos-20261015-165207");
    if (!temRuns || !existsSync(runs)) return;
    const caso: CasoRef = { caso: "t", run: runs, programa: "p", descricao: "", entrada: {}, valores: [ref("2", { id: "V5.cobrimento", fonte: "impressora.prn:41" })] };
    expect(conferirFontes(caso)).toHaveLength(1);
    expect(conferirFontes({ ...caso, valores: [ref("2", { id: "V5.cobrimento", fonte: "impressora.prn:40" })] })).toEqual([]);
  });
});
