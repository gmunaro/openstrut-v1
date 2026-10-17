// v2par_viga_r6 (VIGA opção 8 e 3): a VR6 foi digitada no VIGA e o original não gravou o
// .VIG (o run não tem obra/). A obra repete o roteiro ($ORACULO/casos/v2par_viga_r6.txt),
// como `armazenamento/sistrut/viga.oraculo.test.ts` da V2: opção 8 com acidentais "S"
// geradas a 150 %; tramos de 4 e 5 m com J 1 e P = 2 t/m digitado (a acidental sai do %).
import type { CasoRef } from "../../lib/caso";
import { KN, type Modo, type Motor, type Obra } from "../motor";

const pilar = (nome: string, x: number) => ({ id: nome, nome, x, y: 0, b: 20, h: 20 });

const R6: Obra = {
  versao: 3,
  nome: "R6",
  norma: "nb1-78",
  modoCalculo: "original",
  materiais: { fck: 15, aco: "CA-50", acoEstribo: "CA-50", classeAco: "B", caa: 1, cobrimentoLaje: 1.5, cobrimentoViga: 2, cobrimentoPilar: 2 },
  parametrosViga: { viga: { acidentais: true, acidentalGerada: true, porcentagemAcidentalGerada: 150 } },
  pavimentos: [
    {
      id: "pav",
      nome: "Pavimento 1",
      peDireito: 3,
      repeticoes: 1,
      lajes: [],
      pilares: [pilar("P1", 0), pilar("P2", 4), pilar("P3", 9)],
      pilaresRemovidos: [],
      vigas: [
        {
          id: "VR6",
          nome: "VR6",
          x1: 0,
          y1: 0,
          x2: 9,
          y2: 0,
          bw: 20,
          h: 50,
          cargaLinear: 0,
          somenteCargasProprias: true,
          inercias: [1, 1],
          cargas: [0, 1].map((trecho) => ({ tipo: "distribuida" as const, trecho, inicio: 0, fim: trecho === 0 ? 4 : 5, total: 2 * KN })),
        },
      ],
    },
  ],
};

export default (motor: Motor, modo: Modo, caso: CasoRef) => motor.calcular(R6, modo).valores(caso);
