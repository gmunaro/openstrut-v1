"""Testes sinteticos de strcover.py. Rodar: python -I tools/test_strcover.py."""
import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import strcover  # noqa: E402


def cover(exe_strings: list[str], bas_text: str) -> strcover.Report:
    return strcover.compare(exe_strings, strcover.bas_literals(bas_text))


class HotkeyTest(unittest.TestCase):
    def test_exe_sem_primeira_letra_conta_como_coberto(self):
        # Hotkey: o EXE grava "onfiguracao" e o BAS tem "Configuracao".
        rep = cover(["onfiguracao"], 'PRINT "Configuracao"')
        self.assertEqual(rep.covered, ["onfiguracao"])
        self.assertEqual(rep.missing, [])


class ExclusaoTest(unittest.TestCase):
    def setUp(self):
        strcover.define_exclusoes(["Texto excluido"])

    def tearDown(self):
        strcover.define_exclusoes([])

    def test_excluida_sai_do_denominador(self):
        rep = cover(["T E X T O    E X C L U I D O", "Menu ausente"], 'PRINT "x"')
        self.assertEqual(rep.excluded, 1)
        self.assertEqual(rep.missing, ["Menu ausente"])
        self.assertEqual(rep.total, 1)

    def test_excluida_com_espacos_e_detectada(self):
        self.assertTrue(strcover.is_excluded("T E X T O    E X C L U I D O"))
        self.assertFalse(strcover.is_excluded("Configuracao"))

    def test_sem_exclusoes_nada_sai(self):
        strcover.define_exclusoes([])
        self.assertEqual(cover(["Texto excluido"], 'PRINT "x"').excluded, 0)


class CaseTest(unittest.TestCase):
    def test_comparacao_ignora_caixa_e_brancos_nas_pontas(self):
        rep = cover(["CONFIGURACAO"], 'PRINT "  configuracao  "')
        self.assertEqual(len(rep.covered), 1)
        self.assertEqual(rep.missing, [])


class ParserTest(unittest.TestCase):
    def test_comentario_nao_conta_como_literal(self):
        lits = strcover.bas_literals('\' PRINT "fantasma"\nREM "outro"\nPRINT "real"')
        self.assertEqual(lits, ["real"])

    def test_string_repetida_conta_uma_vez(self):
        rep = cover(["Menu", "Menu"], 'PRINT "Menu"')
        self.assertEqual(rep.total, 1)
        self.assertEqual(len(rep.covered), 1)

    def test_pct_sem_strings_e_none(self):
        self.assertIsNone(cover([], 'PRINT "x"').pct)


class DescritorTest(unittest.TestCase):
    def test_descritor_colado_ao_texto_e_ignorado(self):
        rep = cover(["J4Modifico as Armaduras N/*S*", "X;ARMADURA INSUFICIENTE", "h! Termino da Utilizacao"],
                    'PRINT "Modifico as Armaduras N/*S* "\nPRINT "ARMADURA INSUFICIENTE"\n'
                    'PRINT "Termino da Utilizacao"')
        self.assertEqual(len(rep.missing), 0)

    def test_texto_diferente_nao_casa(self):
        rep = cover(["J4Modifico as Armaduras"], 'PRINT "Altero as Secoes"')
        self.assertEqual(len(rep.covered), 0)


if __name__ == "__main__":
    unittest.main()
