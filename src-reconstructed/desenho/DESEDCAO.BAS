' ===============================================================
' DESEDCAO.BAS - edicao das posicoes de ferro da viga detalhada (SISTRUT 4.0).
' RECONSTRUCAO FUNCIONAL (engenharia reversa). Verificacao de licenca do original nao reimplementada.
' Entrada: <dirEdv><obra>.EDV, <dirDados><obra>.SEC (estribos do detalhamento
'          automatico), <dirEdv><obra>.EDX (se existir) e DESENHO.INI.
' Saida: <dirEdv><obra>.EDV regravado e <dirEdv><obra>.EDX (tipo e inicio de
'        cada barra e notas, ver EdvGravaEdx); previa em <dirDados><obra>_<viga>.VET
'        e corte em <dirDados><obra>_<viga>_C.VET.
' Contas de juntar, separar, porta-estribo e corte em DESEDC.BM.
' Escala da previa fixa 1/25.
' Compilacao: tools/build.sh desenho/DESEDCAO
' ===============================================================
' (interface em janela: sem $CONSOLE, para SCREEN 12 e teclas de funcao)

'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

CONST EDV_MAXLIN = 14        ' posicoes listadas na tela (linhas 6 a 19)
CONST EDV_LN_COB = 39        ' linha do cobrimento no .DSP (DSI_LN_COB de DESINIT)
CONST EDV_COB = 2.5          ' cobrimento padrao (cm), igual a DSI_COB de DESINIT
CONST EDV_MAXNOTA = 200      ' notas de observacao (todas as vigas)
CONST EDV_ESC = 25           ' escala da previa (1/25)

' Tipo e inicio (cm) de cada barra, paralelos a VigPos (ver DESEDC.BM).
DIM SHARED EdvGT(1 TO DAD_MAXPOS) AS STRING, EdvGX(1 TO DAD_MAXPOS) AS DOUBLE
' Estribos do .SEC (detalhamento automatico), para Iniciar a ferragem transversal.
DIM SHARED EdvSecNome(1 TO DAD_MAXVIG) AS STRING, EdvSecITra(1 TO DAD_MAXVIG) AS INTEGER
DIM SHARED EdvSecNT(1 TO DAD_MAXVIG) AS INTEGER, EdvSecQtd AS INTEGER
DIM SHARED EdvSecPhi(1 TO DAD_MAXTRA) AS DOUBLE, EdvSecS(1 TO DAD_MAXTRA) AS DOUBLE
' Notas de observacao: na forma (tramo > 0, lado E/C/D) ou na armadura (numPos > 0).
DIM SHARED EdvNotaViga(1 TO EDV_MAXNOTA) AS STRING, EdvNotaTramo(1 TO EDV_MAXNOTA) AS INTEGER
DIM SHARED EdvNotaLado(1 TO EDV_MAXNOTA) AS STRING, EdvNotaPos(1 TO EDV_MAXNOTA) AS INTEGER
DIM SHARED EdvNotaTxt(1 TO EDV_MAXNOTA) AS STRING, EdvNotaQtd AS INTEGER
' Materiais do .DSP para ancoragem e detalhamento (t/cm2 e coeficientes).
DIM SHARED EdvFck AS DOUBLE, EdvFyk AS DOUBLE, EdvGc AS DOUBLE, EdvGs AS DOUBLE

ComumDirExecDefine _CWD$

DIM dirDados AS STRING, dirEdv AS STRING, obra AS STRING
DIM nome AS STRING, v AS INTEGER

IF ArqLer%("DESENHO.INI") < 0 THEN
    TelaErro "erro no processamento"
    EdvPausa "Acione ESC <Enter> para Continuar "
    EdvFimPrograma
END IF

dirDados = IniDirDados$
dirEdv = DirUtilizavel$(RTRIM$(IniValor$(4)))  ' mesma regra de DESINIT
obra = ObraAtual$(dirDados)

IF obra = "" THEN
    TelaErro "verifique a consistencia dos seus dados"
    EdvPausa "Acione ESC <Enter> para Continuar "
    EdvFimPrograma
END IF

EdvLeParam
EdvLeSec dirDados + obra + ".SEC"

IF VigLe%(dirEdv + obra + ".EDV", "EDV") = 0 THEN
    TelaErro DadErro
    EdvPausa "Acione ESC <Enter> para Continuar "
    EdvFimPrograma
END IF

IF VigQtd = 0 THEN
    TelaErro "verifique a consistencia dos seus dados"
    EdvPausa "Acione ESC <Enter> para Continuar "
    EdvFimPrograma
END IF

EdvLeEdx dirEdv + obra + ".EDX"

' Lista as vigas e pede uma pelo nome. Nome vazio pede a confirmacao do termino.
DO
    EdvListaVigas obra
    nome = EntradaTexto$(21, 12, 20, "")
    IF nome = "" THEN
        IF EdvFim%(dirEdv + obra + ".EDV") THEN EXIT DO
    ELSE
        v = EdvAcha%(nome)
        IF v = 0 THEN
            EdvErro
        ELSE
            EdvViga v, dirDados, obra
        END IF
    END IF
LOOP

EdvFimPrograma

' Acha a viga cujo nome, sem caixa nem espacos nas pontas, bate com nome. 0 = nao achou.
FUNCTION EdvAcha% (nome AS STRING)
    DIM n AS STRING, v AS INTEGER
    n = UCASE$(LTRIM$(RTRIM$(nome)))
    EdvAcha% = 0
    FOR v = 1 TO VigQtd
        IF UCASE$(RTRIM$(Vig(v).nome)) = n THEN
            EdvAcha% = v
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Acha o indice em VigPos da posicao de numero num da viga v (so n > 0). 0 = nao achou.
FUNCTION EdvAchaPos% (v AS INTEGER, num AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER
    EdvAchaPos% = 0
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).numPos = num AND VigPos(j).n > 0 THEN
                EdvAchaPos% = j
                EXIT FUNCTION
            END IF
        NEXT
    NEXT
END FUNCTION

' Cobrimento (cm) lido do .DSP da obra, na linha 39, como em DESINIT. Sem o arquivo, 2.5.
' RECONSTRUCAO: o .DSP e procurado na pasta da linha 3 do DESENHO.INI e, se nao estiver la,
' na pasta do programa (igual a DESINIT). Sem isso, DESINIT (cob 2.0) e DESEDCAO (cob 2.5)
' davam comprimentos de estribo diferentes para a mesma obra.
FUNCTION EdvCobrimento#
    EdvCobrimento# = EdvValorDsp#(EdvArqDsp$, EDV_LN_COB, EDV_COB)
END FUNCTION

' Caminho do .DSP da obra: pasta da linha 3 do DESENHO.INI ou, se nao estiver la,
' pasta do programa (igual a DESINIT).
FUNCTION EdvArqDsp$
    DIM arq AS STRING
    arq = DirUtilizavel$(RTRIM$(IniValor$(3))) + RTRIM$(IniValor$(1)) + ".DSP"
    IF NOT _FILEEXISTS(arq) THEN arq = ComumDirExec$ + RTRIM$(IniValor$(1)) + ".DSP"
    EdvArqDsp$ = arq
END FUNCTION

' Le Fck, Fyk e os coeficientes do .DSP com as linhas e os padroes de DESINIT
' (DSI_LN_* e DSI_*), para a ancoragem (emendas) e para Iniciar.
SUB EdvLeParam
    DIM arq AS STRING, mult AS DOUBLE
    arq = EdvArqDsp$
    mult = EdvValorDsp#(arq, 36, 1#)
    EdvFck = EdvValorDsp#(arq, 33, 0#) * mult: IF EdvFck <= 0 THEN EdvFck = 0.15#
    EdvFyk = EdvValorDsp#(arq, 34, 0#) * mult: IF EdvFyk <= 0 THEN EdvFyk = 5#
    EdvGc = EdvValorDsp#(arq, 45, 1.4#)
    EdvGs = EdvValorDsp#(arq, 46, 1.15#)
END SUB

' Guarda os estribos (bitola e espacamento por tramo) do .SEC da obra, que
' sao o detalhamento automatico da ferragem transversal. Sem o .SEC, nada.
SUB EdvLeSec (arq AS STRING)
    DIM v AS INTEGER, ti AS INTEGER
    EdvSecQtd = 0
    IF VigLe%(arq, "SEC") = 0 THEN EXIT SUB
    FOR v = 1 TO VigQtd
        EdvSecNome(v) = UCASE$(RTRIM$(Vig(v).nome))
        EdvSecNT(v) = Vig(v).nTramos
        EdvSecITra(v) = Vig(v).iTra
    NEXT
    FOR ti = 1 TO VigTraQtd
        EdvSecPhi(ti) = VigTra(ti).phiEst
        EdvSecS(ti) = VigTra(ti).sEst
    NEXT
    EdvSecQtd = VigQtd
END SUB

' Le o .EDX: tipo e inicio de cada barra e as notas. A barra so usa o que
' foi gravado se bitola, quantidade e comprimento ainda batem com o .EDV;
' senao (ou sem o arquivo), o tipo e o inicio sao deduzidos (DecGeoInfere).
SUB EdvLeEdx (arq AS STRING)
    DIM f AS INTEGER, v AS INTEGER, k AS INTEGER, q AS INTEGER, j AS INTEGER, ob AS STRING
    DIM nome AS STRING, num AS INTEGER, phi AS DOUBLE, n AS INTEGER, compr AS DOUBLE, tipo AS STRING, xi AS DOUBLE
    DIM tr AS INTEGER, lado AS STRING, txt AS STRING
    FOR v = 1 TO VigQtd
        DecGeoInfere v, EdvGT(), EdvGX()
    NEXT
    EdvNotaQtd = 0
    IF NOT _FILEEXISTS(arq) THEN EXIT SUB
    f = DadAbreLeitura%(arq, "EDX", ob)
    IF f = 0 THEN EXIT SUB
    IF NOT EOF(f) THEN INPUT #f, q
    FOR k = 1 TO q
        IF EOF(f) THEN EXIT FOR
        INPUT #f, nome, num, phi, n, compr, tipo, xi
        v = EdvAcha%(nome)
        IF v > 0 THEN
            j = EdvAchaPos%(v, num)
            IF j > 0 THEN
                IF ABS(VigPos(j).phi - phi) < 0.01 AND VigPos(j).n = n AND ABS(VigPos(j).compr - compr) < 0.01 THEN
                    EdvGT(j) = tipo: EdvGX(j) = xi
                END IF
            END IF
        END IF
    NEXT
    q = 0
    IF NOT EOF(f) THEN INPUT #f, q
    FOR k = 1 TO q
        IF EOF(f) OR EdvNotaQtd >= EDV_MAXNOTA THEN EXIT FOR
        INPUT #f, nome, tr, lado, num, txt
        EdvNotaQtd = EdvNotaQtd + 1
        EdvNotaViga(EdvNotaQtd) = UCASE$(nome): EdvNotaTramo(EdvNotaQtd) = tr
        EdvNotaLado(EdvNotaQtd) = lado: EdvNotaPos(EdvNotaQtd) = num: EdvNotaTxt(EdvNotaQtd) = txt
    NEXT
    CLOSE #f
END SUB

' Grava o .EDX (arquivo auxiliar so deste modulo):
'   "SISTRUT40","EDX",1,"<obra>"
'   <nBarras>
'   "<viga>",<numPos>,<phi>,<n>,<compr>,"<tipo P|N|PE|G|E>",<inicio cm da ponta esquerda da viga>
'   <nNotas>
'   "<viga>",<tramo>,"<lado E|C|D>",<numPos>,"<texto>"   (nota na forma: tramo > 0; na armadura: numPos > 0)
SUB EdvGravaEdx (arq AS STRING)
    DIM f AS INTEGER, v AS INTEGER, t AS INTEGER, ti AS INTEGER, j AS INTEGER, k AS INTEGER
    f = DadAbreGravacao%(arq, "EDX", VigObra)
    WRITE #f, VigPosQtd
    FOR v = 1 TO VigQtd
        FOR t = 1 TO Vig(v).nTramos
            ti = VigTramo%(v, t)
            FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
                WRITE #f, RTRIM$(Vig(v).nome), VigPos(j).numPos, VigPos(j).phi, VigPos(j).n, VigPos(j).compr, EdvGT(j), EdvGX(j)
            NEXT
        NEXT
    NEXT
    WRITE #f, EdvNotaQtd
    FOR k = 1 TO EdvNotaQtd
        WRITE #f, EdvNotaViga(k), EdvNotaTramo(k), EdvNotaLado(k), EdvNotaPos(k), EdvNotaTxt(k)
    NEXT
    CLOSE #f
END SUB

' Confirma o termino. SIM grava o .EDV (e o .EDX) e sai. Senao, SIM em abandono sai sem gravar.
' Retorna -1 para sair do programa, 0 para voltar a lista de vigas.
FUNCTION EdvFim% (arq AS STRING)
    DIM r AS STRING
    EdvFim% = 0
    EdvLimpa
    LOCATE 21, 3: PRINT "Confirme o termino da Edicao  SIM/*N* ";
    r = UCASE$(EntradaTexto$(21, POS(0), 3, "N"))
    IF r = "SIM" THEN
        DecReconstroi 0, 0#, 0, 0#, "", "", 0#, EdvGT(), EdvGX()
        TelaStatus "Aguarde ..."
        VigGrava arq, "EDV"
        EdvGravaEdx LEFT$(arq, LEN(arq) - 4) + ".EDX"
        TelaStatus "Gravo a Viga Editada em <" + arq
        EdvEspera "Qualquer Tecla para Continuar "
        EdvFim% = -1
        EXIT FUNCTION
    END IF
    EdvLimpa
    LOCATE 21, 3: PRINT "Abandono TODAS as modificacoes e retorno a Armacao acima SIM/*N* ";
    r = UCASE$(EntradaTexto$(21, POS(0), 3, "N"))
    IF r = "SIM" THEN EdvFim% = -1
END FUNCTION

' Le um numero na linha 21 com o rotulo rot. padrao vale se so apertar ENTER.
FUNCTION EdvPedeNum# (rot AS STRING, padrao AS DOUBLE)
    EdvLimpa
    LOCATE 21, 3: PRINT rot;
    EdvPedeNum# = EntradaNumero#(21, POS(0), 6, padrao)
END FUNCTION

' Le um texto na linha 21 com o rotulo rot, em maiusculas, com largura larg.
FUNCTION EdvPedeTxt$ (rot AS STRING, padrao AS STRING, larg AS INTEGER)
    EdvLimpa
    LOCATE 21, 3: PRINT rot;
    EdvPedeTxt$ = UCASE$(EntradaTexto$(21, POS(0), larg, padrao))
END FUNCTION

' Peso de aco da viga v, em kg: n * comprimento (m) * kg/m, so posicoes com n > 0.
FUNCTION EdvPesoViga# (v AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER, peso AS DOUBLE
    peso = 0#
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).n > 0 THEN peso = peso + VigPos(j).n * VigPos(j).compr / 100# * DcPesoMetro#(VigPos(j).phi)
        NEXT
    NEXT
    EdvPesoViga# = peso
END FUNCTION

' Quantidade de estribos (posicao forma E com n > 0) do tramo ti. 0 se nao ha.
FUNCTION EdvQtdEst% (ti AS INTEGER)
    DIM j AS INTEGER
    EdvQtdEst% = 0
    FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
        IF VigPos(j).forma = "E" AND VigPos(j).n > 0 THEN
            EdvQtdEst% = VigPos(j).n
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Le o valor numerico da linha "linha" do arquivo arq (formato "valor  descricao").
' Devolve padrao se o arquivo ou a linha nao existirem. Mesma regra de DsiValorDsp# (DESINIT).
FUNCTION EdvValorDsp# (arq AS STRING, linha AS INTEGER, padrao AS DOUBLE)
    DIM f AS INTEGER, i AS INTEGER, l AS STRING, p AS INTEGER
    EdvValorDsp# = padrao
    IF NOT _FILEEXISTS(arq) THEN EXIT FUNCTION
    f = FREEFILE
    OPEN arq FOR INPUT AS #f
    l = ""
    FOR i = 1 TO linha
        IF EOF(f) THEN EXIT FOR
        LINE INPUT #f, l
    NEXT
    CLOSE #f
    l = LTRIM$(RTRIM$(l))
    p = INSTR(l, " ")
    IF p > 0 THEN l = LEFT$(l, p - 1)
    IF VAL(l) > 0 THEN EdvValorDsp# = VAL(l)
END FUNCTION

' Lista as vigas do .EDV em 4 colunas a partir da linha 4.
' Passou de 64 vigas: some da tela, mas continua aceita pelo nome.
SUB EdvListaVigas (obra AS STRING)
    DIM v AS INTEGER
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 2, 40: PRINT "Edicao de Ferragem Longitudinal"
    FOR v = 1 TO VigQtd
        IF v > 64 THEN EXIT FOR
        LOCATE 4 + ((v - 1) MOD 16), 5 + ((v - 1) \ 16) * 18
        PRINT RTRIM$(Vig(v).nome)
    NEXT
    LOCATE 19, 5: PRINT "Retorno ao Modulo Gerenciador"
    LOCATE 21, 5: PRINT "VIGA - "
END SUB

' Loop da viga v: mostra a tabela e executa a tecla. R (ou ESC) volta a lista.
SUB EdvViga (v AS INTEGER, dirDados AS STRING, obra AS STRING)
    DIM k AS STRING
    DO
        EdvTela v, obra
        DO
            k = UCASE$(TeclaLer$)
        LOOP UNTIL k <> ""
        IF k = "C" THEN EdvCria v
        IF k = "A" THEN EdvAltera v
        IF k = "D" THEN EdvDeleta v
        IF k = "Z" THEN EdvZoom v, dirDados, obra
        IF k = "E" THEN EdvEsforcos v, obra
        IF k = "F" THEN EdvEstribos v, dirDados, obra
        IF k = "J" THEN EdvJunta v
        IF k = "S" THEN EdvSepara v
        IF k = "I" THEN EdvIniLong v
        IF k = "P" THEN EdvPorta v
    LOOP UNTIL k = "R" OR k = CHR$(27)
END SUB

' Desenha a viga v: cabecalho, tabela das posicoes de cada tramo, peso e menu.
' RECONSTRUCAO: a tabela mostra ate a linha 19 (14 posicoes), sem rolagem.
SUB EdvTela (v AS INTEGER, obra AS STRING)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER, lin AS INTEGER, viga AS STRING
    viga = RTRIM$(Vig(v).nome)
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 2, 40: PRINT "Edicao de Ferragem Longitudinal"
    LOCATE 3, 10: PRINT "VIGA - "; viga
    ' RECONSTRUCAO: cabecalho da tabela (texto nao consta no dump).
    LOCATE 5, 3: PRINT "N    Tramo   Bitola (mm)   Quantidade   Comprimento (cm)   Forma  Tipo"
    lin = 6
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).n > 0 AND lin <= 6 + EDV_MAXLIN - 1 THEN
                LOCATE lin, 3: PRINT FormataNumero$(VigPos(j).numPos, 0, 3)
                LOCATE lin, 10: PRINT FormataNumero$(t, 0, 3)
                LOCATE lin, 20: PRINT FormataNumero$(VigPos(j).phi, 1, 6)
                LOCATE lin, 34: PRINT FormataNumero$(VigPos(j).n, 0, 6)
                LOCATE lin, 48: PRINT FormataNumero$(VigPos(j).compr, 1, 8)
                LOCATE lin, 66: PRINT VigPos(j).forma
                LOCATE lin, 70: PRINT EdvGT(j)
                lin = lin + 1
            END IF
        NEXT
    NEXT
    ' RECONSTRUCAO: rotulo do peso nao consta no dump.
    LOCATE 20, 3: PRINT "Peso total de aco (kg) "; FormataNumero$(EdvPesoViga#(v), 2, 12)
    LOCATE 21, 3: PRINT "<Z>oom   <P>orta estribo      <F>erragem transversal "
    TelaItemMenu 21, 66, "Retorno"
    LOCATE 22, 3: PRINT "<C>riar  <A>lterar  <J>untar  <S>eparar  <D>eletar  <I>niciar  <E>sforcos"
END SUB

' Submenu de Criacao de Ferragem: P positivo, G grampo positivo, R retorno.
' RECONSTRUCAO: Negativo e Pele nao existem no .EDV reconstruido (sem rotina).
SUB EdvCria (v AS INTEGER)
    DIM k AS STRING
    EdvTitulo "Criacao de Ferragem"
    LOCATE 21, 3: PRINT SPACE$(76)
    TelaItemMenu 21, 3, "Positivo"
    TelaItemMenu 21, 14, "Grampo"
    TelaItemMenu 21, 23, "Retorno"
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    IF k = "P" THEN EdvCriaPos v, 0
    IF k = "G" THEN EdvCriaPos v, -1
END SUB

' Inclui uma posicao positiva (grampo = 0) ou grampo positivo (grampo <> 0) no tramo pedido.
' Inclui pela DecReconstroi, no fim das posicoes do tramo.
SUB EdvCriaPos (v AS INTEGER, grampo AS INTEGER)
    DIM tr AS INTEGER, n AS INTEGER, phi AS DOUBLE, compr AS DOUBLE, forma AS STRING
    DIM x0 AS DOUBLE, L AS DOUBLE, tipo AS STRING
    IF grampo THEN
        EdvTitulo "Criacao de Grampo Positivo"
    ELSE
        EdvTitulo "Criacao de Ferragem Positiva"
    END IF
    tr = INT(EdvPedeNum#("Inicio no Tramo ", 0#))
    IF tr = 0 THEN EXIT SUB
    n = INT(EdvPedeNum#("Quantidade *0* ", 0#))
    phi = EdvPedeNum#("Bitola da Ferragem (mm) ", 0#)
    ' RECONSTRUCAO: rotulo do comprimento nao consta no dump. Em grampo, conta a partir da face do apoio.
    compr = EdvPedeNum#("Comprimento (cm) ", 0#)
    IF grampo THEN
        ' RECONSTRUCAO: lado E/D do grampo nao cabe no .EDV (TPosFerro); grava so a forma L.
        forma = "L"
    ELSE
        ' RECONSTRUCAO: rotulo da forma nao consta no dump.
        forma = EdvPedeTxt$("Forma (R/U/L) ", "R", 3)
    END IF
    IF tr < 1 OR tr > Vig(v).nTramos OR n < 1 OR phi <= 0 OR compr <= 0 THEN
        EdvErro
    ELSEIF VigPosQtd >= DAD_MAXPOS THEN
        EdvErro
    ELSEIF LEN(forma) <> 1 OR INSTR("RUL", forma) = 0 THEN
        EdvErro
    ELSE
        x0 = DecX0#(v, tr): L = VigTra(VigTramo%(v, tr)).vao * 100#
        IF grampo THEN tipo = "G" ELSE tipo = "P"
        ' a barra nova fica centrada no vao, como o positivo do detalhamento
        DecReconstroi VigTramo%(v, tr), phi, n, compr, forma, tipo, x0 + L / 2# - compr / 2#, EdvGT(), EdvGX()
    END IF
END SUB

' Alteracao de Ferragem: corrige quantidade, bitola e comprimento de uma posicao em VigPos.
SUB EdvAltera (v AS INTEGER)
    DIM num AS INTEGER, j AS INTEGER, n AS INTEGER, phi AS DOUBLE, compr AS DOUBLE
    EdvTitulo "Alteracao de Ferragem,"
    num = INT(EdvPedeNum#("Numero da posicao a ser alterada *RETORNO* ", 0#))
    IF num = 0 THEN EXIT SUB
    j = EdvAchaPos%(v, num)
    IF j = 0 THEN
        EdvErro
        EXIT SUB
    END IF
    n = INT(EdvPedeNum#("Quantidade *", VigPos(j).n))
    phi = EdvPedeNum#("Bitola (mm) *", VigPos(j).phi)
    ' RECONSTRUCAO: rotulo do comprimento nao consta no dump.
    compr = EdvPedeNum#("Comprimento (cm) ", VigPos(j).compr)
    IF n < 1 OR phi <= 0 OR compr <= 0 THEN
        EdvErro
    ELSE
        VigPos(j).n = n
        VigPos(j).phi = phi
        VigPos(j).compr = compr
    END IF
END SUB

' Deletar Ferragem: marca n = 0 na posicao (ou em todas, com TODOS); DecReconstroi a descarta depois.
' RECONSTRUCAO: Deletar PO/NE/GP/GN e o intervalo nao existem aqui (TPosFerro nao guarda o tipo da posicao).
SUB EdvDeleta (v AS INTEGER)
    DIM txt AS STRING, num AS INTEGER, j AS INTEGER, t AS INTEGER, ti AS INTEGER, r AS STRING
    EdvTitulo "Deletar Ferragem"
    txt = EdvPedeTxt$("Numero da posicao que sera Deletada, ou TODOS *RETORNO* ", "", 6)
    IF txt = "" THEN EXIT SUB
    IF txt = "TODOS" THEN
        EdvLimpa
        LOCATE 21, 3: PRINT "Deletar TODAS as posicoes da viga SIM/*N* ";
        r = UCASE$(EntradaTexto$(21, POS(0), 3, "N"))
        IF r = "SIM" THEN
            FOR t = 1 TO Vig(v).nTramos
                ti = VigTramo%(v, t)
                FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
                    VigPos(j).n = 0
                NEXT
            NEXT
        END IF
        EXIT SUB
    END IF
    num = INT(VAL(txt))
    IF num < 1 THEN
        EdvErro
        EXIT SUB
    END IF
    j = EdvAchaPos%(v, num)
    IF j = 0 THEN
        EdvErro
        EXIT SUB
    END IF
    EdvLimpa
    LOCATE 21, 3: PRINT "Deletar Posicao "; "SIM/*N* ";
    r = UCASE$(EntradaTexto$(21, POS(0), 3, "N"))
    IF r = "SIM" THEN VigPos(j).n = 0
END SUB

' Previa: regenera o .VET da viga v (escala 1/25), com as notas, e mostra. Antes, aplica as exclusoes.
SUB EdvZoom (v AS INTEGER, dirDados AS STRING, obra AS STRING)
    DIM viga AS STRING, arqVet AS STRING, r AS INTEGER
    viga = RTRIM$(Vig(v).nome)
    arqVet = dirDados + obra + "_" + viga + ".VET"
    DecReconstroi 0, 0#, 0, 0#, "", "", 0#, EdvGT(), EdvGX()
    TelaStatus "Aguarde ..."
    DcDesenhaViga v, arqVet, EDV_ESC, obra
    IF _FILEEXISTS(arqVet) THEN EdvVetNotas v, arqVet
    IF NOT _FILEEXISTS(arqVet) THEN
        TelaErro "erro no processamento"
        EdvPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    r = VetMostra%(arqVet)
    IF r <> 1 THEN
        IF r = -1 THEN
            EdvErro
        ELSE
            TelaErro "erro no processamento"
            EdvPausa "Acione ESC <Enter> para Continuar "
        END IF
        EXIT SUB
    END IF
    EdvEspera "Qualquer Tecla para Continuar "
END SUB

' Tela somente leitura dos esforcos por tramo (vao, momentos e cortantes). Qualquer tecla volta.
' RECONSTRUCAO: titulo e rotulos das colunas nao constam no dump.
SUB EdvEsforcos (v AS INTEGER, obra AS STRING)
    DIM t AS INTEGER, ti AS INTEGER, lin AS INTEGER
    CLS
    TelaMoldura 1, 1, 23, 80
    LOCATE 2, 10: PRINT "OBRA - "; obra
    LOCATE 2, 40: PRINT "Edicao de Ferragem Longitudinal"
    LOCATE 3, 10: PRINT "VIGA - "; RTRIM$(Vig(v).nome)
    LOCATE 5, 3: PRINT "Tramo"
    LOCATE 5, 10: PRINT "Vao (m)"
    LOCATE 5, 22: PRINT "M+ (tf.m)"
    LOCATE 5, 34: PRINT "M- esq"
    LOCATE 5, 46: PRINT "M- dir"
    LOCATE 5, 58: PRINT "V esq (tf)"
    LOCATE 5, 70: PRINT "V dir (tf)"
    lin = 6
    FOR t = 1 TO Vig(v).nTramos
        IF lin > 6 + EDV_MAXLIN - 1 THEN EXIT FOR
        ti = VigTramo%(v, t)
        LOCATE lin, 3: PRINT FormataNumero$(t, 0, 3)
        LOCATE lin, 10: PRINT FormataNumero$(VigTra(ti).vao, 2, 8)
        LOCATE lin, 22: PRINT FormataNumero$(VigTra(ti).mPos, 2, 8)
        LOCATE lin, 34: PRINT FormataNumero$(VigTra(ti).mNegEsq, 2, 8)
        LOCATE lin, 46: PRINT FormataNumero$(VigTra(ti).mNegDir, 2, 8)
        LOCATE lin, 58: PRINT FormataNumero$(VigTra(ti).vEsq, 2, 8)
        LOCATE lin, 70: PRINT FormataNumero$(VigTra(ti).vDir, 2, 8)
        lin = lin + 1
    NEXT
    EdvEspera "Qualquer Tecla para Continuar "
END SUB

' Ferragem transversal (estribos) por tramo. C cria, I volta ao detalhamento
' automatico, E esforcos, Z previa, N notas, V corte; R (ou ESC) volta a viga.
' RECONSTRUCAO: Alterar e Deletar intervalo nao constam aqui.
' RECONSTRUCAO: F Fim nao existe nesta tela; o termino fica na lista de vigas.
' RECONSTRUCAO: cabecalho da tabela nao consta no dump.
SUB EdvEstribos (v AS INTEGER, dirDados AS STRING, obra AS STRING)
    DIM k AS STRING, t AS INTEGER, ti AS INTEGER, lin AS INTEGER
    DO
        CLS
        TelaMoldura 1, 1, 23, 80
        LOCATE 2, 10: PRINT "OBRA - "; obra
        LOCATE 2, 40: PRINT "Edicao de Ferragem Transversal"
        LOCATE 3, 10: PRINT "VIGA - "; RTRIM$(Vig(v).nome)
        LOCATE 5, 3: PRINT "Tramo"
        LOCATE 5, 10: PRINT "Vao (m)"
        LOCATE 5, 22: PRINT "Bitola (mm)"
        LOCATE 5, 36: PRINT "Espacamento (cm)"
        LOCATE 5, 56: PRINT "Quantidade"
        lin = 6
        FOR t = 1 TO Vig(v).nTramos
            IF lin > 6 + EDV_MAXLIN - 1 THEN EXIT FOR
            ti = VigTramo%(v, t)
            LOCATE lin, 3: PRINT FormataNumero$(t, 0, 3)
            LOCATE lin, 10: PRINT FormataNumero$(VigTra(ti).vao, 2, 8)
            LOCATE lin, 22: PRINT FormataNumero$(VigTra(ti).phiEst, 1, 8)
            LOCATE lin, 36: PRINT FormataNumero$(VigTra(ti).sEst, 1, 8)
            LOCATE lin, 56: PRINT FormataNumero$(EdvQtdEst%(ti), 0, 6)
            lin = lin + 1
        NEXT
        LOCATE 21, 3: PRINT "<Z>oom   <N>otas    <V>er corte "
        TelaItemMenu 22, 3, "Criar"
        TelaItemMenu 22, 13, "Iniciar"
        TelaItemMenu 22, 25, "Esforcos"
        TelaItemMenu 22, 38, "Retorno"
        DO
            k = UCASE$(TeclaLer$)
        LOOP UNTIL k <> ""
        IF k = "C" THEN EdvEstCria v
        IF k = "I" THEN EdvIniTrans v
        IF k = "E" THEN EdvEsforcos v, obra
        IF k = "Z" THEN EdvZoom v, dirDados, obra
        IF k = "N" THEN EdvNotas v
        IF k = "V" THEN EdvCorte v, dirDados, obra
    LOOP UNTIL k = "R" OR k = CHR$(27)
END SUB

' Criacao de Estribos: tramo, bitola e espacamento (cm). Quantidade = INT(vao / espac) + 1.
' O estribo novo substitui o do tramo. Comprimento pelo cobrimento do .DSP.
SUB EdvEstCria (v AS INTEGER)
    DIM tr AS INTEGER, ti AS INTEGER, j AS INTEGER, phi AS DOUBLE, s AS DOUBLE, L AS DOUBLE, cob AS DOUBLE
    EdvTitulo "Criacao de Estribos"
    tr = INT(EdvPedeNum#("Localizado no Tramo ", 0#))
    phi = EdvPedeNum#("Bitola (mm) ", 0#)
    s = EdvPedeNum#("Espacamento (cm) ", 0#)
    IF tr < 1 OR tr > Vig(v).nTramos OR phi <= 0 OR s <= 0 THEN
        EdvErro
    ELSEIF VigPosQtd >= DAD_MAXPOS THEN
        EdvErro
    ELSE
        ti = VigTramo%(v, tr)
        L = VigTra(ti).vao * 100#
        cob = EdvCobrimento#
        VigTra(ti).phiEst = phi
        VigTra(ti).sEst = s
        ' zera o estribo antigo do tramo; DecReconstroi o descarta.
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).forma = "E" THEN VigPos(j).n = 0
        NEXT
        DecReconstroi ti, phi, INT(L / s) + 1, DcComprEstribo#(Vig(v).bw, Vig(v).h, cob, phi), "E", "E", DecX0#(v, tr), EdvGT(), EdvGX()
    END IF
END SUB

' Comprimento de ancoragem (cm) da posicao j da viga v: positivo e grampo com
' DcAncoragem#; negativo e porta-estribo (barras de cima) com DcAncoragemNeg#
' (o .DSP multiplica a ancoragem da ferragem negativa por 1,5).
FUNCTION EdvLb# (v AS INTEGER, j AS INTEGER)
    IF EdvGT(j) = "N" OR EdvGT(j) = "PE" THEN
        EdvLb# = DcAncoragemNeg#(VigPos(j).phi, EdvFck, EdvGc, EdvFyk, EdvGs, Vig(v).h)
    ELSE
        EdvLb# = DcAncoragem#(VigPos(j).phi, EdvFck, EdvGc, EdvFyk, EdvGs)
    END IF
END FUNCTION

' Pergunta SIM/*N* na linha 21. -1 so se responder SIM.
FUNCTION EdvSimNao%
    EdvLimpa
    LOCATE 21, 3: PRINT "SIM/*N* ";
    EdvSimNao% = (UCASE$(EntradaTexto$(21, POS(0), 3, "N")) = "SIM")
END FUNCTION

' Juncao de Ferragem: junta a segunda posicao na primeira (DecJunta%).
' So barras do mesmo tipo e bitola, encostadas ou sobrepostas; com traspasse
' soma a emenda (lb da bitola, arredondado para cima).
' RECONSTRUCAO: a emenda da juncao nao e pedida na tela original; usa lb.
SUB EdvJunta (v AS INTEGER)
    DIM n1 AS INTEGER, n2 AS INTEGER, j1 AS INTEGER, j2 AS INTEGER, k AS STRING, r AS INTEGER, temNota AS INTEGER
    EdvTitulo "Juncao de Ferragem"
    n1 = INT(EdvPedeNum#("Primeira posicao *RETORNO* ", 0#))
    IF n1 = 0 THEN EXIT SUB
    n2 = INT(EdvPedeNum#("Segunda posicao *VOLTA* ", 0#))
    IF n2 = 0 THEN EXIT SUB
    j1 = EdvAchaPos%(v, n1): j2 = EdvAchaPos%(v, n2)
    IF j1 = 0 OR j2 = 0 OR j1 = j2 THEN
        EdvErro
        EXIT SUB
    END IF
    IF (EdvGT(j1) = "P" AND EdvGT(j2) = "N") OR (EdvGT(j1) = "N" AND EdvGT(j2) = "P") THEN
        TelaErro "NAO PODEMOS JUNTAR FERROS POSITIVOS COM NEGATICOS"
        EdvPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    EdvLimpa
    LOCATE 21, 3: PRINT "Junto pela maior Bitola <S> ou <*R*>etorno ";
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    IF k <> "S" THEN EXIT SUB
    temNota = (EdvNotaAcha%(RTRIM$(Vig(v).nome), 0, "", n2) > 0)
    r = DecJunta%(v, j1, j2, DecEmenda#(EdvLb#(v, j1)), EdvGT(), EdvGX())
    IF r <> 0 THEN
        EdvErro
    ELSEIF temNota THEN
        EdvEspera "<< Verifique as Notas das Armaduras >>"
    END IF
END SUB

' Separacao de Ferragem: divide a posicao em duas com emenda (DecSepara%).
' Emenda padrao = psi x lb (EdvLb#, DecEmendaSepara#); a distancia conta da
' ponta esquerda da barra ate o inicio da emenda.
' RECONSTRUCAO: o texto entre "(" e "+)" esta ilegivel no dump; supoe
' "esquerda". So a ponta esquerda e pedida.
SUB EdvSepara (v AS INTEGER)
    DIM num AS INTEGER, j AS INTEGER, e AS DOUBLE, d AS DOUBLE
    EdvTitulo "Separacao de Ferragem,"
    num = INT(EdvPedeNum#("Numero da Posicao a ser Separada *RETORNO* ", 0#))
    IF num = 0 THEN EXIT SUB
    j = EdvAchaPos%(v, num)
    IF j = 0 THEN
        EdvErro
        EXIT SUB
    END IF
    IF EdvGT(j) = "E" THEN
        EdvErro
        EXIT SUB
    END IF
    e = EdvPedeNum#("Comprimento de Emenda *", DecEmendaSepara#(EdvLb#(v, j)))
    EdvTitulo "A partir da ponta da Barra (" + "esquerda" + " +), Distancia do Inicio da Emenda *"
    d = EdvPedeNum#("Distancia do Inicio da Emenda *", INT(VigPos(j).compr / 2#))
    IF NOT DecSepara%(v, j, d, e, EdvGT(), EdvGX()) THEN EdvErro
END SUB

' Inicializacao de Ferragem Longitudinal: refaz o detalhamento automatico da
' viga v (DcDetalha%, com o .DSP da obra) e mantem os estribos atuais.
' A numeracao das posicoes da viga recomeca em 1, como em DESINIT.
SUB EdvIniLong (v AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER, np AS INTEGER, nT AS INTEGER
    nT = Vig(v).nTramos
    DIM eP(1 TO nT) AS DOUBLE, eN(1 TO nT) AS INTEGER, eC(1 TO nT) AS DOUBLE
    EdvTitulo "Inicializacao de Ferragem Longitudinal"
    IF NOT EdvSimNao% THEN EXIT SUB
    ' DcDetalha% poe ate 5 posicoes por tramo no fim de VigPos
    IF VigPosQtd + 5 * nT > DAD_MAXPOS THEN
        EdvErro
        EXIT SUB
    END IF
    FOR t = 1 TO nT
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).forma = "E" AND VigPos(j).n > 0 AND eN(t) = 0 THEN
                eP(t) = VigPos(j).phi: eN(t) = VigPos(j).n: eC(t) = VigPos(j).compr
            END IF
        NEXT
    NEXT
    np = DcDetalha%(v, 1, EdvCobrimento#, EdvFck, EdvGc, EdvFyk, EdvGs)
    FOR t = 1 TO nT
        ti = VigTramo%(v, t)
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).forma = "E" THEN
                VigPos(j).phi = eP(t): VigPos(j).n = eN(t): VigPos(j).compr = eC(t)
            END IF
        NEXT
    NEXT
    DecReconstroi 0, 0#, 0, 0#, "", "", 0#, EdvGT(), EdvGX()
    DecGeoInfere v, EdvGT(), EdvGX()
END SUB

' Inicializacao de Ferragem Transversal: volta os estribos de cada tramo aos
' do .SEC (bitola e espacamento do dimensionamento). Sem a viga no .SEC,
' refaz os estribos com a bitola e o espacamento atuais.
SUB EdvIniTrans (v AS INTEGER)
    DIM t AS INTEGER, ti AS INTEGER, j AS INTEGER, sv AS INTEGER, k AS INTEGER, L AS DOUBLE, cob AS DOUBLE
    EdvTitulo "Inicializacao de Ferragem Transversal"
    IF NOT EdvSimNao% THEN EXIT SUB
    FOR k = 1 TO EdvSecQtd
        IF EdvSecNome(k) = UCASE$(RTRIM$(Vig(v).nome)) AND EdvSecNT(k) = Vig(v).nTramos THEN sv = k
    NEXT
    cob = EdvCobrimento#
    FOR t = 1 TO Vig(v).nTramos
        ti = VigTramo%(v, t)
        IF sv > 0 THEN
            VigTra(ti).phiEst = EdvSecPhi(EdvSecITra(sv) + t - 1)
            VigTra(ti).sEst = EdvSecS(EdvSecITra(sv) + t - 1)
        END IF
        FOR j = VigTra(ti).iPosFerro TO VigTra(ti).iPosFerro + VigTra(ti).nPosFerro - 1
            IF VigPos(j).forma = "E" THEN VigPos(j).n = 0
        NEXT
        L = VigTra(ti).vao * 100#
        IF VigTra(ti).phiEst > 0 AND VigTra(ti).sEst > 0 AND VigPosQtd < DAD_MAXPOS THEN
            DecReconstroi ti, VigTra(ti).phiEst, INT(L / VigTra(ti).sEst) + 1, DcComprEstribo#(Vig(v).bw, Vig(v).h, cob, VigTra(ti).phiEst), "E", "E", DecX0#(v, t), EdvGT(), EdvGX()
        ELSE
            DecReconstroi 0, 0#, 0, 0#, "", "", 0#, EdvGT(), EdvGX()
        END IF
    NEXT
END SUB

' Geracao Automatica de Porta-Estribo: S troca os porta-estribos da viga
' pelos gerados (DecPortaEstribo%): 2 barras da bitola minima do .DSP nos
' trechos sem negativo, com o traspasse do .DSP. Padrao S/N da linha
' "COLOCACAO AUTOMATICA DE PORTA ESTRIBOS" do .DSP. N nao muda nada.
SUB EdvPorta (v AS INTEGER)
    DIM arq AS STRING, r AS STRING, phi AS DOUBLE, q AS INTEGER
    arq = EdvArqDsp$
    EdvTitulo "Geracao Automatica de Porta-Estribo"
    r = DecDspTexto$(arq, "COLOCACAO AUTOMATICA DE PORTA ESTRIBOS")
    IF r = "" THEN r = "S"
    r = EdvPedeTxt$("Geracao Automatica S/N  *", r, 3)
    IF r <> "S" THEN EXIT SUB
    phi = DecPortaPhi#(arq)
    q = DecPortaEstribo%(v, phi, DecPortaTraspasse#(arq, phi), EdvGT(), EdvGX())
END SUB

' Corte da Viga: S pede o tramo e a distancia da face esquerda, gera
' <obra>_<viga>_C.VET com a secao (DecCorteVet%) e mostra.
SUB EdvCorte (v AS INTEGER, dirDados AS STRING, obra AS STRING)
    DIM k AS STRING, tr AS INTEGER, d AS DOUBLE, L AS DOUBLE, viga AS STRING, arq AS STRING, r AS INTEGER, nb AS INTEGER
    viga = RTRIM$(Vig(v).nome)
    EdvTitulo "Corte da Viga"
    EdvLimpa
    LOCATE 21, 3: PRINT "(vide"; " acima)   Local de Corte   <S>im  <*N*>ao  <R>etorno  ";
    DO
        k = UCASE$(TeclaLer$)
    LOOP UNTIL k <> ""
    IF k <> "S" THEN EXIT SUB
    tr = INT(EdvPedeNum#("Numero do Tramo ", 0#))
    IF tr < 1 OR tr > Vig(v).nTramos THEN
        EdvErro
        EXIT SUB
    END IF
    L = VigTra(VigTramo%(v, tr)).vao * 100#
    d = EdvPedeNum#("Distancia (cm " + "+) a partir da face " + "esquerda do Apoio ", INT(L / 2#))
    IF d < 0 OR d > L THEN
        EdvErro
        EXIT SUB
    END IF
    DecReconstroi 0, 0#, 0, 0#, "", "", 0#, EdvGT(), EdvGX()
    arq = dirDados + obra + "_" + viga + "_C.VET"
    TelaStatus "Aguarde ..."
    nb = DecCorteVet%(v, DecX0#(v, tr) + d, arq, EdvCobrimento#, "CORTE - VIGA " + viga + "  TRAMO " + LTRIM$(STR$(tr)) + "  A " + LTRIM$(STR$(d)) + " cm", EdvGT(), EdvGX())
    r = VetMostra%(arq)
    IF r <> 1 THEN
        TelaErro "erro no processamento"
        EdvPausa "Acione ESC <Enter> para Continuar "
        EXIT SUB
    END IF
    EdvEspera "Qualquer Tecla para Continuar "
END SUB

' Indice da nota da viga: na forma (tramo > 0, lado) ou na armadura (num > 0). 0 se nao ha.
FUNCTION EdvNotaAcha% (viga AS STRING, tramo AS INTEGER, lado AS STRING, num AS INTEGER)
    DIM k AS INTEGER
    FOR k = 1 TO EdvNotaQtd
        IF EdvNotaViga(k) = UCASE$(viga) AND EdvNotaTramo(k) = tramo AND EdvNotaLado(k) = lado AND EdvNotaPos(k) = num THEN
            EdvNotaAcha% = k
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Notas de Observacao: tramo informado = nota na forma (lado E/C/D);
' NENHUM (0) = nota na armadura, por numero de posicao. Nota existente so
' muda com "Altero a Nota" S. Texto vazio apaga a nota.
' RECONSTRUCAO: as notas ficam no .EDX e saem na previa (Zoom); aspas
' viram apostrofo (o .EDX e gravado com WRITE).
SUB EdvNotas (v AS INTEGER)
    DIM tr AS INTEGER, num AS INTEGER, lado AS STRING, k AS INTEGER, txt AS STRING, viga AS STRING, i AS INTEGER, r AS STRING
    viga = UCASE$(RTRIM$(Vig(v).nome))
    EdvTitulo "Notas de Observacao na Forma"
    tr = INT(EdvPedeNum#("Numero do Tramo em que sera colocada a Nota *NENHUM* ", 0#))
    IF tr = 0 THEN
        EdvTitulo "Notas de Observacao na Armadura"
        num = INT(EdvPedeNum#("Numero da Posicao em que sera colocada a Nota *RETORNO* ", 0#))
        IF num = 0 THEN EXIT SUB
        IF EdvAchaPos%(v, num) = 0 THEN
            EdvErro
            EXIT SUB
        END IF
    ELSE
        IF tr < 1 OR tr > Vig(v).nTramos THEN
            EdvErro
            EXIT SUB
        END IF
        EdvLimpa
        LOCATE 21, 3: PRINT "Posicao no Tramo"; "   <E>squerda  <C>entro  <D>ireita ";
        DO
            lado = UCASE$(TeclaLer$)
        LOOP UNTIL lado = "E" OR lado = "C" OR lado = "D" OR lado = CHR$(27)
        IF lado = CHR$(27) THEN EXIT SUB
    END IF
    k = EdvNotaAcha%(viga, tr, lado, num)
    txt = ""
    IF k > 0 THEN
        txt = EdvNotaTxt(k)
        IF tr > 0 THEN
            EdvTitulo "Tramo " + LTRIM$(STR$(tr)) + " " + lado + ": " + txt
        ELSE
            EdvTitulo "Posicao " + LTRIM$(STR$(num)) + ": " + txt
        END IF
        EdvLimpa
        LOCATE 21, 3: PRINT "Altero a Nota S/*N* ";
        r = UCASE$(EntradaTexto$(21, POS(0), 3, "N"))
        IF r <> "S" THEN EXIT SUB
    END IF
    EdvLimpa
    LOCATE 21, 3: PRINT "NOTA: ";
    txt = RTRIM$(LTRIM$(EntradaTexto$(21, POS(0), 60, txt)))
    DO
        i = INSTR(txt, CHR$(34))
        IF i = 0 THEN EXIT DO
        MID$(txt, i, 1) = "'"
    LOOP
    IF txt = "" THEN
        ' apaga: a ultima nota ocupa o lugar da apagada
        IF k > 0 THEN
            EdvNotaViga(k) = EdvNotaViga(EdvNotaQtd): EdvNotaTramo(k) = EdvNotaTramo(EdvNotaQtd)
            EdvNotaLado(k) = EdvNotaLado(EdvNotaQtd): EdvNotaPos(k) = EdvNotaPos(EdvNotaQtd)
            EdvNotaTxt(k) = EdvNotaTxt(EdvNotaQtd)
            EdvNotaQtd = EdvNotaQtd - 1
        END IF
        EXIT SUB
    END IF
    IF k = 0 THEN
        IF EdvNotaQtd >= EDV_MAXNOTA THEN
            EdvErro
            EXIT SUB
        END IF
        EdvNotaQtd = EdvNotaQtd + 1: k = EdvNotaQtd
        EdvNotaViga(k) = viga: EdvNotaTramo(k) = tr: EdvNotaLado(k) = lado: EdvNotaPos(k) = num
    END IF
    EdvNotaTxt(k) = txt
END SUB

' Acrescenta ao .VET da previa (escala EDV_ESC) as notas da viga v: as da
' forma acima da viga, no tramo e no lado escolhidos; as da armadura numa
' lista abaixo dos textos das posicoes ("N<posicao> - <texto>").
SUB EdvVetNotas (v AS INTEGER, arqVet AS STRING)
    DIM f AS INTEGER, buf AS STRING, p AS INTEGER, k AS INTEGER, viga AS STRING, s AS DOUBLE, hh AS DOUBLE
    DIM x AS DOUBLE, L AS DOUBLE, y AS DOUBLE, t AS INTEGER, mx AS INTEGER, tem AS INTEGER
    viga = UCASE$(RTRIM$(Vig(v).nome))
    FOR k = 1 TO EdvNotaQtd
        IF EdvNotaViga(k) = viga THEN tem = -1
    NEXT
    IF NOT tem THEN EXIT SUB
    ' tira o marcador de fim ("F") e grava as notas depois do desenho
    f = FREEFILE
    OPEN arqVet FOR BINARY AS #f
    buf = SPACE$(LOF(f))
    GET #f, , buf
    CLOSE #f
    p = _INSTRREV(buf, CHR$(34) + "F" + CHR$(34))
    IF p = 0 THEN EXIT SUB
    buf = LEFT$(buf, p - 1)
    f = FREEFILE
    OPEN arqVet FOR OUTPUT AS #f
    PRINT #f, buf;
    s = 1000# / EDV_ESC: hh = Vig(v).h / 100# * s
    FOR t = 1 TO Vig(v).nTramos
        IF VigTra(VigTramo%(v, t)).nPosFerro > mx THEN mx = VigTra(VigTramo%(v, t)).nPosFerro
    NEXT
    y = -26 - 4 * mx - 4
    FOR k = 1 TO EdvNotaQtd
        IF EdvNotaViga(k) = viga THEN
            IF EdvNotaTramo(k) > 0 AND EdvNotaTramo(k) <= Vig(v).nTramos THEN
                x = DecX0#(v, EdvNotaTramo(k)) / 100# * s
                L = VigTra(VigTramo%(v, EdvNotaTramo(k))).vao * s
                IF EdvNotaLado(k) = "C" THEN x = x + L / 2# - 20
                IF EdvNotaLado(k) = "D" THEN x = x + L - 40
                VetTexto f, x + 2, hh + 14, 2, 0, 3, EdvNotaTxt(k)
            ELSEIF EdvNotaPos(k) > 0 THEN
                VetTexto f, 0, y, 2, 0, 3, "N" + LTRIM$(STR$(EdvNotaPos(k))) + " - " + EdvNotaTxt(k)
                y = y - 4
            END IF
        END IF
    NEXT
    VetFecha f
END SUB

' Titulo do bloco de edicao, na linha 20 (troca a linha do peso).
SUB EdvTitulo (txt AS STRING)
    LOCATE 20, 3: PRINT SPACE$(76)
    LOCATE 20, 3: PRINT txt
END SUB

' Limpa a linha 21, onde ficam os campos de entrada.
SUB EdvLimpa
    LOCATE 21, 3: PRINT SPACE$(76)
    LOCATE 21, 3
END SUB

' Mensagem padrao de dado inconsistente, espera ESC ou ENTER.
SUB EdvErro
    TelaErro "verifique a consistencia dos seus dados"
    EdvPausa "Acione ESC <Enter> para Continuar "
END SUB

' Mostra msg na linha de status e espera ENTER ou ESC.
SUB EdvPausa (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k = CHR$(13) OR k = CHR$(27)
END SUB

' Mostra msg na linha de status e espera qualquer tecla.
SUB EdvEspera (msg AS STRING)
    DIM k AS STRING
    TelaStatus msg
    DO
        k = TeclaLer$
    LOOP UNTIL k <> ""
END SUB

' Mensagem de encerramento, como no dump.
SUB EdvFimPrograma
    CLS
    PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."
    SYSTEM
END SUB

'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/SISPLOT.BM'
'$INCLUDE: '../desenho/DESCALC.BM'
'$INCLUDE: '../desenho/DESEDC.BM'
'$INCLUDE: '../common/SISCOMUM.BM'
