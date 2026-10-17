#!/usr/bin/env python3
"""Arquivo de troca inicial (formato de comum/RT45.BM, RT_TROCA_GRAVA_CAB) para rodar um
módulo retraduzido como se viesse do gerenciador SISTRUT.

O SISTRUT.EXE original escreve na tela, antes do CHAIN (dump/SISTRUT 0x141b7..0x141f8):
  linha 1 " Aguarde ...", linha 3 o nome da empresa do original (troca "chain_linha3" de
  src-original/marca.json), linha 4 "Leitura do Modulo <módulo>",
  linha 5 "<placa> <impressora> <serial> <pasta dos EXE>".
Os módulos leem a configuração da linha 5 com SCREEN(l, c). O CHAIN do QB4.5 não limpa a
tela; o RT45 leva a tela no arquivo de troca.

Uso: python -I tools/troca_semente.py SAIDA.CHN [--modulo LAJE] [--placa CGA]
         [--impressora LPT1:] [--serial COM1:] [--pasta C:\\SISTRUT\\EXEC40\\]
         [--marca openstrut|original]
--marca openstrut (padrão): a linha 3 sai como a do SISTRUT.BAS do repositório, com a troca de
src-original/marca.json; original: o texto do SISTRUT.EXE, lido de V1_MARCA_ORIGINAL (tools/marca.py).
Depois: LAJE.exe /CHAIN:SAIDA.CHN
"""
import argparse
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import marca   # noqa: E402  (tools/marca.py)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("saida")
    ap.add_argument("--modulo", default="LAJE")
    ap.add_argument("--placa", default="CGA")
    ap.add_argument("--impressora", default="LPT1:")
    ap.add_argument("--serial", default="COM1:")
    ap.add_argument("--pasta", default="C:\\SISTRUT\\EXEC40\\")
    ap.add_argument("--marca", choices=("openstrut", "original"), default="openstrut")
    a = ap.parse_args()
    t3 = next(t for t in marca.trocas() if t["id"] == "chain_linha3")
    l3 = t3["openstrut"] if a.marca == "openstrut" else t3["original"]
    if l3 is None:
        sys.exit("troca_semente.py --marca original: defina V1_MARCA_ORIGINAL (ver tools/marca.py)")
    linhas = [" Aguarde ...", "", l3,
              "Leitura do Modulo " + a.modulo,
              a.placa[:3] + " " + a.impressora + " " + a.serial + " " + a.pasta]
    tela = bytearray()
    for r in range(25):
        t = (linhas[r] if r < len(linhas) else "").ljust(80)[:80].encode("cp437")
        for ch in t:
            tela += bytes([ch, 7])
    with open(a.saida, "wb") as f:
        f.write(b"SISTRUT CHAIN 1 ")                       # STRING * 16
        f.write(struct.pack("<i", 0))                      # posição no roteiro
        f.write(struct.pack("<hhhh", 0, 0, len(linhas) + 1, 1))  # n. de telas, modo, linha, coluna
        f.write(tela)
    print(a.saida)


if __name__ == "__main__":
    main()
