// PILAR opção 6 (verificação de uma seção e armadura dadas): o original não grava arquivo
// de entrada (nem .PIL nos runs), então a obra é a do roteiro, lida da `entrada` do JSON
// do caso: uma obra só com o pilar e uma `Pilar.verificacoes` por conjunto de esforços
// (MODO-CALCULO da V2, "Pilares": `verificacoes`).
// Barras como o PILDADOS as põe na retangular (PILAR.BAS:3521-3542): n nas bordas
// superior e inferior em x = (k−1)(b−2c)/MAX(1, n−1) + c, y = h − c e c.
import type { CasoRef } from "../../lib/caso";
import type { ValorV2 } from "../../lib/comparar";
import { KN, type Modo, type Motor, type Obra } from "../motor";

interface Conjunto {
  Nk_t: number;
  Mxk_tm: number;
  Myk_tm: number;
  Lxe_m: number;
  Lye_m: number;
}
/** As duas formas da entrada: a do caso c (um conjunto, campos soltos) e a dos v2par. */
interface Entrada {
  b_cm?: number;
  h_cm?: number;
  cLinha_cm?: number;
  Nk_t?: number;
  Mxk_tm?: number;
  Myk_tm?: number;
  lex_m?: number;
  ley_m?: number;
  secao?: { B_cm: number; H_cm: number; cLinha_cm: number; barrasBordaSuperior: number; barrasBordaInferior: number; barrasLaterais: number; bitola_mm: number };
  conjuntos?: Conjunto[];
}

function secaoDe(e: Entrada) {
  if (e.secao) {
    const s = e.secao;
    if (s.barrasLaterais || s.barrasBordaSuperior !== s.barrasBordaInferior) throw new Error("seção com barras laterais ou bordas diferentes: acrescente aqui");
    return { b: s.B_cm, h: s.H_cm, c: s.cLinha_cm, n: s.barrasBordaSuperior, bitola: s.bitola_mm };
  }
  // caso c: "2 em cima + 2 embaixo, 12.5 mm"
  return { b: e.b_cm!, h: e.h_cm!, c: e.cLinha_cm!, n: 2, bitola: 12.5 };
}

export function obraPilarAvulso(caso: CasoRef): Obra {
  const e = caso.entrada as Entrada;
  const { b, h, c, n, bitola } = secaoDe(e);
  const barras = [h - c, c].flatMap((y) => Array.from({ length: n }, (_, k) => ({ x: (k * (b - 2 * c)) / Math.max(1, n - 1) + c, y, bitola })));
  const conjuntos: Conjunto[] = e.conjuntos ?? [{ Nk_t: e.Nk_t!, Mxk_tm: e.Mxk_tm!, Myk_tm: e.Myk_tm!, Lxe_m: e.lex_m!, Lye_m: e.ley_m! }];
  return {
    versao: 3,
    nome: caso.caso,
    norma: "nb1-78",
    modoCalculo: "original",
    materiais: { fck: 15, aco: "CA-50", acoEstribo: "CA-50", classeAco: "B", caa: 1, cobrimentoLaje: 1.5, cobrimentoViga: 2, cobrimentoPilar: 2 },
    pavimentos: [
      {
        id: "N1",
        nome: "N1",
        peDireito: 3,
        repeticoes: 1,
        lajes: [],
        vigas: [],
        pilaresRemovidos: [],
        pilares: [
          {
            id: "P",
            nome: "P",
            x: 0,
            y: 0,
            b,
            h,
            verificacoes: conjuntos.map((k) => ({
              barras,
              esforcos: { nk: k.Nk_t * KN, mxk: k.Mxk_tm * KN, myk: k.Myk_tm * KN, lex: k.Lxe_m, ley: k.Lye_m },
            })),
          },
        ],
      },
    ],
  };
}

export const montarPilarAvulso = (motor: Motor, modo: Modo, caso: CasoRef): Map<string, ValorV2> => motor.calcular(obraPilarAvulso(caso), modo).valores(caso);
