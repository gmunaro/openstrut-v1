"""Tabela de marca do OpenStrut (src-original/marca.json), comum a tools/retraduz.py,
tools/compara_retrad.py e tools/troca_semente.py.

Cada troca tem o texto do OpenStrut ("openstrut") e o do original: em claro ("original") ou,
quando o texto do original tem nome de pessoa ou da empresa do original, só o sha256 dele em
UTF-8 ("original_sha256"). O tradutor reconhece o literal pelo hash e não precisa do texto.
Quem precisa do texto do original para procurá-lo (o comparador, nas telas e na impressora do
oráculo; troca_semente.py --marca original) o lê de V1_MARCA_ORIGINAL: um JSON fora do
repositório, com a lista dos textos ou no formato da marca.json com "original" em claro. Cada
texto lido é conferido pelo hash.

Uso nos outros scripts (rodam com python -I, que tira a pasta do script do sys.path):
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import marca
"""
import hashlib
import json
import os
import sys

MARCA_JSON = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "src-original", "marca.json")


def sha(texto):
    """sha256 (hex) do texto em UTF-8, como em "original_sha256"."""
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()


def textos_originais(caminho=None):
    """sha256 -> texto do original, lidos de caminho ou de V1_MARCA_ORIGINAL ({} se nenhum)."""
    caminho = caminho or os.environ.get("V1_MARCA_ORIGINAL")
    if not caminho:
        return {}
    d = json.load(open(caminho, encoding="utf-8"))
    lista = [t["original"] for t in d["trocas"] if "original" in t] if isinstance(d, dict) else d
    return {sha(t): t for t in lista}


def trocas(caminho=MARCA_JSON, originais=None):
    """Trocas da tabela: lista de dicts com "sha256", "openstrut", "original" (texto ou None, se
    o texto só está como hash e não veio de V1_MARCA_ORIGINAL) e "id" (ou None). Confere a
    largura de cada troca cujo texto do original é conhecido."""
    if originais is None:
        originais = textos_originais()
    saida = []
    for t in json.load(open(caminho, encoding="utf-8"))["trocas"]:
        h = sha(t["original"]) if "original" in t else t["original_sha256"]
        o = t.get("original", originais.get(h))
        if o is not None and len(o) != len(t["openstrut"]):
            sys.exit(f"marca.json: largura diferente ({len(o)} x {len(t['openstrut'])}): -> {t['openstrut']!r}")
        saida.append({"sha256": h, "openstrut": t["openstrut"], "original": o, "id": t.get("id")})
    return saida
