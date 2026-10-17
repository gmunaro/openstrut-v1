#!/usr/bin/env python3
"""Gera tests/retraducao/viga/CHECKLIST.md: as divergências dos livros U61..U68 agrupadas por rotina,
com o que os casos do oráculo exercitam (mapa CONFERIDO abaixo, escrito à mão a partir dos casos).
Uso: python -I tests/retraducao/viga/checklist.py
  REA_WORK = pasta do trabalho de engenharia reversa (variável de ambiente obrigatória; lê $REA_WORK/ledger)."""
import collections
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
REA_WORK = os.environ.get("REA_WORK") or sys.exit("defina REA_WORK=<pasta do trabalho de engenharia reversa> (dump em $REA_WORK/dump, livros em $REA_WORK/ledger)")
LEDGER = os.path.join(REA_WORK, "ledger")
LIVROS = [("U61", "VIGA", "VIGA"), ("U62", "VIGA", "VIAUX"), ("U63", "VIGA", "VIGRAV"), ("U64", "VIGA", "VICALC"),
          ("U65", "VPLOTA", "VPLOTA"), ("U66", "VPLOTA", "VPGRAV/VPCAD"), ("U67", "VPLOTA", "VPAUXIM"),
          ("U68", "VPLOTA", "VPINI")]

# rotina -> (o que faz, conferido no oráculo)
CONFERIDO = {
    "M_VIGA": ("início, VIGA.INI por posição, padrões, tela do gerenciador",
               "sim: VIGA.INI lido em todos os casos (parâmetros da tela p00 do m1: 100%, N, F, E, t/m; % de acidental gerada aplicada no c1). "
               "Verificação de licença do original desativada (marcas PROTECAO). Padrões sem VIGA.INI: não"),
    "F_1115c": ("ON KEY: F2 e Ctrl+Alt+Del voltam ao gerenciador, Esc ao menu, F1/F3-F10 BEEP",
                "sim: Esc em LINE INPUT (opções 3 e 7) e em INPUT$ (parâmetros) e F2 no menu (caso k1, volta ao SISTRUT). Ctrl+Alt+Del e BEEP das outras teclas: não"),
    "F_10f51": ("tratadores de erro, cores, códigos de impressora do INI",
                "sim: cores CGA (atributos iguais em todas as telas) e códigos ESC do INI (impressora.prn igual). PCOPY falhando (Hercules) e tela de erro: não"),
    "FUN_1000_157a": ("menu principal, número máximo de posições, opção 1 (arquivar)",
                      "sim: menu (realce e atributos), 'Numero maximo de posicoes - 200', opção 1 com 2 vigas (a1, x1). Recusas de posição: não"),
    "F_1297b": ("entrada de uma viga",
                "sim: balanço, engaste, inércia variável e calculada por seções ('*'), divisões de carga, COLOCACAO ERRADA (p3), "
                "acidentais geradas (c1) e fornecidas com VERIFIQUE CARGA ACIDENTAL (x1), momentos externos (c1), carga indexada *1.01 (x1). Limites de 12 tramos e 30 divisões: não"),
    "F_15049": ("opção 2 (processar arquivadas)",
                "sim: posições 1 A 2 com impressão, diagramas e esquema (p2), só na tela parando (a1), com reação transferida (x1)"),
    "F_15d8a": ("transferência de reações entre vigas; opção 3",
                "sim: carga indexada resolvida na opção 2 (x1: V21 recebe a reação do apoio 1 da V20); opção 3 (p3, c1)"),
    "FUN_1000_698d": ("opção 7: obra, leitura do .VIG", "sim (b, c1, x1)"),
    "F_17d76": ("opção 7: apoios, multiplicador, saída",
                "sim: apoios como gravados (b), apoio desconsiderado '*' (c1, x1), pilares digitados (x1), multiplicador 50% (c1)"),
    "F_19377": ("opção 7: cálculo, soma por pilar, tela de reações, .REP",
                "sim: estáticas (b, x1) e máximas com acidentais (c1); E2E.REP e IDX.REP iguais byte a byte (fora a hora, ver R7)"),
    "F_1aa98": ("opção 7: FILES e erros de disco",
                "sim: ' Nenhum Arquivo Encontrado' (k1, com o contorno R4). Disco cheio e drive inválido: não"),
    "FUN_2000_01eb": ("opção 5 (correções): pede a posição", "sim: posição 1 (m1)"),
    "F_2043b": ("menu de correção de uma viga", "sim: os 8 itens, sem alterar (m1)"),
    "F_22809": ("correção de L e J", "sim: tabela, sem alterar (m1)"),
    "F_22f47": ("correção das cargas totais", "sim: tabela, sem alterar (m1)"),
    "F_24479": ("correção das acidentais", "sim: tabela, sem alterar (m1)"),
    "F_24c4a": ("momentos aplicados", "sim: tela, sem alterar (m1)"),
    "FUN_2000_82eb / F_2846c": ("opção 4 (lista)", "sim: sem vigas (m1, volta sem tela), 6 vigas (m1), vínculo de carga 'V20/' (x1)"),
    "FUN_2000_8871": ("opção 8 (parâmetros)", "sim: itens 1-5 sem alterar (m1); 1-4 alterados (c1: 85%, S/G/25%, S, M). Unidades alteradas: não"),
    "FUN_2000_9ab7 / F_2a9ce": ("quadro de dados da viga (tela em moldura, tela, impressora)",
                                "sim: moldura (p3, a1, c1, x1), impressora (b, p2, p3, c1, x1), com acidentais e Mext (c1, contorno P4)"),
    "FUN_2000_4fe1 / F_2820b": ("esquema estrutural (gráfico)",
                                "sim, com diferença: desenho D (p2) e I na impressora (p3); apoio do meio uma coluna deslocada (R5)"),
    "M_VIAUX": ("DIM das matrizes da viga de trabalho", "indireto (todas as entradas); limites não"),
    "FUN_3000_0558": ("drive e diretório de dados", "sim: sem alterar (m1). Diretório inexistente, MKDIR: não"),
    "F_328cd": ("catálogo", "sim (m1, a1)"),
    "F_3386d": ("FILES na tela de gravação", "sim (m1, a1)"),
    "F_3091d": ("menu de gravação: criação, gravação, número de vigas",
                "sim: criação de NOVA e IDX, gravação 1 A 2 (a1, x1; .VIG iguais byte a byte), número de vigas (m1). Acesso ao DOS: não"),
    "FUN_3000_2b12": ("leitura de vigas gravadas", "sim: registros 1 A 6 da E2E (m1, p2)"),
    "FUN_3000_3991": ("copia a viga de trabalho para a posição", "indireto (a1, x1: .VIG gravado igual)"),
    "FUN_4000_0243": ("análise da viga contínua (focos, reações, M+, envoltória)",
                      "sim: 6 vigas da E2E (b), balanço/engaste/inércia variável/concentradas (p3), engaste duplo (a1), "
                      "acidentais e envoltória, Mext, redução 85% (c1), indexada (x1): números iguais (impressora byte a byte)"),
    "F_45ed7": ("M+ por cortante nulo, flecha f*EJ", "sim (mesmos casos)"),
    "FUN_4000_730d": ("diagramas de esforços (gráfico)",
                      "sim, com diferença: tela (p2, a1, c1) e impressora escala 1/100 (p3); traçado das linhas (R5, R6)"),
    "M_VPLOTA": ("início do VPLOTA", "sim: entrada pelo gerenciador (V, duas setas, Enter) (v1); verificação de licença desativada (marcas PROTECAO)"),
    "F_107c9": ("ON KEY do VPLOTA", "sim: Esc + Enter durante o erro de plotagem volta ao menu (vpl_edv5). F2 e Ctrl+Alt+Del no VPLOTA: não"),
    "FUN_1000_0be6": ("menu do VPLOTA", "sim: opções 1, 2 e 3 (v1, vpl_*)"),
    "FUN_1000_119c": ("entrada da montagem DXF e C/S/G", "sim: alterar parâmetros, G grava o VPLOTA.INI (v1), S segue sem gravar (vpl_dxf2)"),
    "F_115ac": ("leitura e gravação do VPLOTA.INI, edição dos 19 campos", "sim: largura 1189 e os outros 18 mantidos (v1); os 19 alterados: folha 1189x841, escala 100, tabela E, numeração I, letras (vpl_dxf2); FILES dos .DXF/.EDV/.AVF/.PLT (vpl_*)"),
    "F_148da": ("faixas de registros (DXF)", "sim: registro 1 (vpl_dxf1, vpl_dxf2), '1 A 1' e registro 9 inexistente com DADOS INCORRETOS (vpl_dxf3). Faixas com '/' e mais de uma viga: não (a obra tem uma viga desenhada)"),
    "F_14f68": ("leitura dos DXF e arranjo", "sim: leitura do R1__E2E.DXF gravado pelo DESENHO original, arranjo na folha, menu V/A/S/C, <A>lterar com confirmação S por registro, <C>ancelar (vpl_dxf1..3); FV1_E2E.DXF igual byte a byte. Várias folhas e disco cheio: não"),
    "F_17f9a": ("montagem a partir do .EDV", "sim: R1__E2E.EDV do DESENHO original, 7 configurações de PLOTER (vpl_edv1..7)"),
    "F_19710": ("validação da seleção (.EDV)", "sim: registro 1 (vpl_edv1..7). Registro inexistente: não"),
    "F_19d3a": ("leitura dos registros da obra", "sim: .EDV, .VIG, .SEC e .FOR; E2E.AVF gravado igual byte a byte (vpl_edv1..7, vpl_avf1); plotagem em arquivo .PLT e na LPT1 (vpl_edv6)"),
    "FUN_1000_cd4e": ("recuperação de folhas .AVF", "sim: E2E.AVF gravado pelo original, visualização sem alterar, regrava o .AVF e plota (vpl_avf1)"),
    "FUN_3000_02fe": ("plotagem de uma folha (HPGL)", "sim: FV1_E2E.PLT igual byte a byte com HOUSTON DMP 41/42 e 52 MP (DM/PL, 1 e 14 penas), HP DraftPro com origem 10,20 e cotas, Calcomp Artisan (CPGL) com cotas, American Graphtec; LOGICAL LTG 400/B na LPT1 (impressora.prn igual); Calcomp 906/7/PCI 'nao configuravel': erro 5 e ' Erro na plotagem' como no original (vpl_edv5). Porta COM: não"),
    "M_VPAUXIM": ("tratador de erro do VPAUXIM", "não (o erro da vpl_edv5 é tratado no VPCAD, 0x3025a)"),
    "FUN_4000_035c": ("tela de erro fatal", "não"),
    "F_40568": ("padrões e leitura do .DSP", "indireto: SISTRUT.DSP lido na configuração (v1)"),
    "F_41eec": ("desenho das barras", "sim, indireto: desenho da viga editada no .PLT e na LPT1 (vpl_edv1..7, vpl_avf1)"),
    "FUN_4000_b9b1": ("configuração da plotagem (.DSP, .PLT, PLOTER.INI)",
                      "sim: SISTRUT.DSP; arquivo .PLT e plotagem direta (LPT1); PLOTER 1, 2, 3, 6, 9, 11, 20 e 22 do PLOTER.INI; origem 0,0, 10,20 e 5,5; cotas S/N; 'Todas as folhas' N com confirmação (v1, vpl_edv1..7, vpl_avf1)"),
    "FUN_5000_37c1": ("DXF da folha", "sim: FV1_E2E.DXF igual byte a byte com os parâmetros do INI (vpl_dxf1) e com folha, escala, tabela, numeração e letras alterados e a viga deslocada na visualização (vpl_dxf2). Telas gráficas da visualização iguais (vpl_dxf2, vpl_avf1)"),
}


def main():
    out = []
    w = out.append
    w("# Checklist dos livros U61-U68 (VIGA e VPLOTA)")
    w("")
    w("Gerado por `tests/retraducao/viga/checklist.py`. Os livros apontam onde a V1 antiga (`src-reconstructed`) se afasta do "
      "original. Na retradução o código é o do original em cada endereço, então as divergências ficam resolvidas por "
      "construção; a coluna da direita diz o que os casos do oráculo conferem. Casos (`$ORACULO/casos/retrad_viga_*.txt` e `retrad_vpl_*.txt`, "
      "sufixos em `tests/retraducao/viga/*.sufixo.txt`):")
    w("")
    w("| caso | o que faz |")
    w("|---|---|")
    for c, d in [("b", "opção 7 da obra E2E (o caso b do oráculo com mais telas): lista, todas as vigas, impressão, E2E.REP"),
                 ("m1", "menus sem cálculo: 4 vazio, 8, 6 (3, 4, 1, 7, 5 leitura da E2E), 4, 5 (os 8 itens)"),
                 ("p2", "opção 2 da E2E (1 A 2): impressão, diagramas no vídeo, esquema desenhado"),
                 ("p3", "opção 3: viga de 3 tramos digitada (balanço, engaste, J calculado, COLOCACAO ERRADA), impressão, diagramas 1/100 e esquema na impressora"),
                 ("k1", "Esc em LINE INPUT e INPUT$, F2 de volta ao gerenciador"),
                 ("a1", "opção 1 (2 vigas novas), opção 6 (cria e grava NOVA.VIG), opção 2 na tela"),
                 ("c1", "parâmetros alterados (85%, acidentais geradas 25%, Mext, máximas); opção 3 com acidentais e Mext; opção 7 parcial com apoio desconsiderado e multiplicador 50%"),
                 ("x1", "acidentais fornecidas, carga indexada (reação de outra viga), opções 4, 2, 6 e 7 na obra IDX"),
                 ("v1", "VPLOTA: menu, parâmetros do DXF com gravação do VPLOTA.INI, configuração da plotagem, opções 2 e 3 sem arquivos"),
                 ("vpl_dxf1", "VPLOTA opção 1 com o R1__E2E.DXF do DESENHO original (caso retrad_vpl_obra): parâmetros do INI, grava FV1_E2E.DXF"),
                 ("vpl_dxf2", "opção 1 com os 19 parâmetros alterados; <V>isualizar e deslocar a viga (6, 6, seta acima, +, seta à direita, 2, F); FV1_E2E.DXF"),
                 ("vpl_dxf3", "opção 1: registro 9 inexistente (DADOS INCORRETOS), '1 A 1', <A>lterar com confirmação, <C>ancelar, nome vazio"),
                 ("vpl_edv1..7", "opção 2 com o R1__E2E.EDV: grava E2E.AVF e plota FV1_E2E.PLT com 7 PLOTER (DM/PL, HP-GL, CPGL, 'nao configuravel', LPT1, Graphtec), origens, cotas, confirmação de folha"),
                 ("vpl_avf1", "opção 3 com o E2E.AVF do original: visualização, regrava o .AVF, plota no 2o PLOTER")]:
        w(f"| {c} | {d} |")
    w("")
    w("Resultado (rodada final de 15/10/2026, `tests/retraducao/viga/comparacao.txt`; tradutor e RT45 do repositório, "
      "correcoes.json só com as marcas PROTECAO; oráculo com DATE$/TIME$ congelados): a1 32/32 + NOVA.VIG; b 16/16 + E2E.REP; "
      "c1 38/38 + E2E.VIG e E2E.REP; k1 9/9; m1 58/58; p2 13/13; p3 37/37; v1 21/21 + VPLOTA.INI; x1 22/22 + IDX.VIG e IDX.REP; "
      "vpl_dxf1 9/9 e vpl_dxf2 13/13 + FV1_E2E.DXF; vpl_dxf3 13/13; vpl_edv1..7 com todas as telas iguais (18 a 20) + E2E.AVF e "
      "FV1_E2E.PLT (vpl_edv6: impressora.prn de 8344 bytes); vpl_avf1 14/14 + FV1_E2E.PLT (o E2E.AVF regravado é igual ao de "
      "partida). Telas (inclusive as gráficas), impressora e arquivos iguais byte a byte.")
    w("")
    for u, exe, mod in LIVROS:
        d = json.load(open(os.path.join(LEDGER, u + ".json"), encoding="utf-8"))
        por = collections.OrderedDict()
        for v in d["divergencias"]:
            por.setdefault(v.get("rotina"), []).append(v)
        w(f"## {u}: {exe}, módulo {mod} ({len(d['divergencias'])} divergências)")
        w("")
        w("| divergências | rotina | o que é | conferido no oráculo |")
        w("|---|---|---|---|")
        for r, vs in por.items():
            ids = [v["id"].split("-", 1)[1] for v in vs]
            faixa = f"{u}-{ids[0]}" + (f"..{ids[-1]}" if len(ids) > 1 else "")
            if len(ids) > 1 and int(ids[-1]) - int(ids[0]) + 1 != len(ids):
                faixa = ", ".join(f"{u}-{i}" for i in ids)
            faz, conf = CONFERIDO.get(r, ("?", "não mapeado"))
            w(f"| {faixa} | {r} | {faz} | {conf} |")
        w("")
    w("## Pendências que a retradução reproduz sem julgar")
    w("")
    w("Decisão do dono: V1 igual ao original, inclusive em defeitos.")
    w("")
    w("- U64-009: `A_1936!(CINT(V_1c46!))` em VICALC 0x43b39 usa `V_1c46!`, que nenhuma rotina grava: vale 0 (o VIGA faz CLEAR ao entrar). Reproduzido.")
    w("- Entrada de viga (F_1297b): depois de 'COLOCACAO ERRADA DAS CARGAS' a tecla seguinte só confirma a mensagem e o tramo recomeça pelo número de divisões; carga concentrada no último ponto de um tramo interno é recusada; 'VERIFIQUE CARGA ACIDENTAL' aparece para Fac > 0 em carga indexada. Conferido no oráculo (p3, x1).")
    w("- Opção 7 com 'Imprimo os Resultados S' não pergunta 'Imprimo somente a Somatoria' (só pergunta com N). Conferido (c1, x1).")
    w("- O número máximo de vigas em memória depende de FRE(-1) (`INT(MIN(200, (FRE(-1) - 30720) / 918 - 1))`); com o valor fixo do RT45 sai 200, como no oráculo.")
    w("")
    w("## Diferenças restantes (não são da família)")
    w("")
    w("- Telas gráficas e cópia gráfica na impressora: com o RT45GFX de 15/10 todas saíram iguais nos casos (R5, R6 ficam com o agente do gráfico).")
    w("- Hora impressa e gravada: o oráculo e a V1 congelam DATE$/TIME$ em 10-14-2026 12:00:00; na rodada final nenhuma comparação precisou da regra 'igual (relógio)' (R7).")
    w("- Nenhum contorno PROVISORIO: os pedidos P1-P6, R1-R4 e R8-R12 foram atendidos pelo tradutor e pelo RT45 (PEDIDOS-TRADUTOR.md).")
    w("- 'Kbytes livres' do menu de gravação (FRE): ignorado na comparação, como no piloto.")
    open(os.path.join(AQUI, "CHECKLIST.md"), "w", encoding="utf-8", newline="\n").write("\n".join(out) + "\n")


if __name__ == "__main__":
    main()
