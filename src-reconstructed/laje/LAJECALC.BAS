' ============================================================================
'  LAJECALC - interface do modulo de calculo e detalhamento de lajes
'  Fonte RECONSTRUIDO do SISTRUT 4.0 (1991). Spec: docs/modules/LAJECALC.md
'  Verificacao de licenca do original nao reimplementada.
'  O calculo fica em LAJCALC.BM; aqui ficam dados, telas e relatorios.
' ============================================================================
'$INCLUDE: '../common/SISCOMUM.BI'
'$INCLUDE: '../common/SISDADOS.BI'

' Parametros de calculo (LAJE.INI e SISTRUT.LAP), nas unidades da LAJCALC.BM.
TYPE TLajCfg
    fck AS DOUBLE          ' resistencia do concreto, tf/cm2
    fyk AS DOUBLE          ' resistencia do aco, tf/cm2
    gf AS DOUBLE           ' coeficiente de seguranca dos esforcos
    gc AS DOUBLE           ' coeficiente de seguranca do concreto
    gs AS DOUBLE           ' coeficiente de seguranca do aco
    cob AS DOUBLE          ' cobrimento, cm
    acresc AS DOUBLE       ' acrescimo ao cobrimento, cm
    hmin AS DOUBLE         ' altura minima da laje, cm
    hmax AS DOUBLE         ' altura maxima da laje, cm
    relTot AS DOUBLE       ' minima relacao Lmenor/flecha com carga total
    relAcid AS DOUBLE      ' minima relacao Lmenor/flecha com carga acidental
    dens AS DOUBLE         ' densidade do concreto, tf/m3
    taxaPos AS DOUBLE      ' taxa minima de armadura positiva, fracao
    taxaNeg AS DOUBLE      ' taxa minima de armadura negativa, fracao
    iE AS DOUBLE           ' coeficiente Mneg/Mpos dos bordos engastados
    relMax AS DOUBLE       ' maxima relacao Mneg/Mpos em engastes
    relMin AS DOUBLE       ' minima relacao Mneg/Mpos em engastes
    cantos AS DOUBLE       ' relacao fixa Mneg/Mpos em cantos reentrantes
    linhaNeutra AS DOUBLE  ' limite da linha neutra, % (dominio 3/4)
    efic AS DOUBLE         ' eficiencia da armadura negativa, %
END TYPE

DIM SHARED Cfg AS TLajCfg
DIM SHARED DirDados AS STRING                 ' pasta de dados, com barra final
DIM SHARED Obra AS STRING                     ' obra corrente
DIM SHARED Sel(1 TO DAD_MAXLAJ) AS INTEGER    ' lajes marcadas na ultima lista
DIM SHARED Rel(1 TO 600) AS STRING            ' linhas do relatorio em montagem
DIM SHARED RelQtd AS INTEGER
DIM SHARED ImpAlt AS DOUBLE                   ' ultima espessura imposta (tela 3.3)
DIM SHARED Alterado AS INTEGER                ' -1 quando a obra foi mudada nesta sessao
DIM SHARED DirPrin(1 TO DAD_MAXLAJ) AS DOUBLE ' RECONSTRUCAO: direcao principal (graus), so na sessao
DIM SHARED RelEsf(1 TO DAD_MAXLAJ) AS DOUBLE  ' RECONSTRUCAO: M+ principal / M+ secundario, so na sessao

DECLARE SUB CarregaConfiguracao ()
DECLARE SUB ObraCarrega ()
DECLARE SUB TelaFundo ()
DECLARE SUB MenuPrincipal ()
DECLARE SUB Continuidade ()
DECLARE FUNCTION TrechoPede% (pergunta AS STRING, i AS INTEGER, b AS INTEGER)
DECLARE SUB BordoTroca (i AS INTEGER, b AS INTEGER, novo AS STRING)
DECLARE SUB DirecaoArmadura ()
DECLARE SUB Parametros ()
DECLARE FUNCTION ParDescr$ (n AS INTEGER)
DECLARE FUNCTION ParGet# (n AS INTEGER)
DECLARE SUB ParAjusta (n AS INTEGER, v AS DOUBLE)
DECLARE SUB EspessuraMinima ()
DECLARE SUB MontaEspMin (msg AS STRING)
DECLARE SUB RelLinhaEsp (i AS INTEGER, h AS DOUBLE)
DECLARE SUB ImposicaoEspessura ()
DECLARE SUB MomentosArmaduras ()
DECLARE SUB MontaMomArm (visao AS INTEGER, sIdx AS INTEGER)
DECLARE SUB Otimizacao ()
DECLARE FUNCTION MomBordo# (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION AsBordo# (i AS INTEGER, k AS INTEGER)
DECLARE FUNCTION VizinhaDe% (i AS INTEGER, k AS INTEGER)
DECLARE SUB CalculaObra ()
DECLARE SUB RelLimpa ()
DECLARE SUB RelAdd (t AS STRING)
DECLARE SUB RelMostra ()
DECLARE SUB RelGrava ()
DECLARE FUNCTION Campo$ (v AS DOUBLE, ok AS INTEGER, larg AS INTEGER)
DECLARE FUNCTION Pad$ (s AS STRING, n AS INTEGER)
DECLARE FUNCTION MaxQ# (a AS DOUBLE, b AS DOUBLE, c AS DOUBLE, d AS DOUBLE)
DECLARE FUNCTION MinQ# (a AS DOUBLE, b AS DOUBLE, c AS DOUBLE, d AS DOUBLE)
DECLARE FUNCTION LajAcha% (nome AS STRING)
DECLARE SUB ListaPede (lin AS INTEGER, pergunta AS STRING, dica AS STRING, padrao AS STRING)
DECLARE SUB ListaSel (txt AS STRING)
DECLARE FUNCTION SimNao% (lin AS INTEGER, txt AS STRING, padrao AS INTEGER)
DECLARE SUB MostraErro (texto AS STRING)
DECLARE FUNCTION IniNum# (rotulo AS STRING, padrao AS DOUBLE)
DECLARE FUNCTION LapValor# (rotulo AS STRING, padrao AS DOUBLE)
DECLARE FUNCTION ArqLajPath$ (obra AS STRING)
DECLARE FUNCTION MuLaje# (i AS INTEGER)

' Rotinas de common/SISCOMUM.BM, common/SISDADOS.BM e laje/LAJCALC.BM usadas aqui.
DECLARE SUB ComumDirExecDefine (dir$)
DECLARE FUNCTION ArqLer% (arquivo$)
DECLARE FUNCTION ArqLinha$ (n%)
DECLARE FUNCTION ArqAchaTexto% (texto$, depois%)
DECLARE FUNCTION IniValor$ (n%)
DECLARE FUNCTION IniDirDados$ ()
DECLARE FUNCTION IniDirParam$ ()
DECLARE FUNCTION NumeroValido% (txt$)
DECLARE FUNCTION FormataNumero$ (valor#, casas%, larg%)
DECLARE SUB TelaItemMenu (lin%, col%, texto$)
DECLARE SUB TelaStatus (texto$)
DECLARE SUB TelaErro (texto$)
DECLARE FUNCTION TeclaLer$ ()
DECLARE FUNCTION EntradaTexto$ (lin%, col%, larg%, padrao$)
DECLARE FUNCTION EntradaNumero# (lin%, col%, larg%, padrao#)
DECLARE FUNCTION LajLe% (arq AS STRING)
DECLARE SUB LajGrava (arq AS STRING)
DECLARE FUNCTION ObraAtual$ (dirDados AS STRING)
DECLARE SUB ObraDefine (dirDados AS STRING, obra AS STRING)
DECLARE FUNCTION LcTipo$ (lx AS DOUBLE, ly AS DOUBLE, bordos AS STRING)
' RECONSTRUCAO: declaracao que faltava; usada pelo L/f de RelLinhaEsp
DECLARE FUNCTION LcVaoRef# (lx AS DOUBLE, ly AS DOUBLE, tipo AS STRING)
DECLARE FUNCTION LcEspessura# (lx AS DOUBLE, ly AS DOUBLE, bordos AS STRING, g AS DOUBLE, q AS DOUBLE, dens AS DOUBLE, fck AS DOUBLE, hmin AS DOUBLE, relTot AS DOUBLE, relAcid AS DOUBLE)
DECLARE FUNCTION LcFlecha# (lx AS DOUBLE, ly AS DOUBLE, bordos AS STRING, p AS DOUBLE, h AS DOUBLE, fck AS DOUBLE)
DECLARE FUNCTION LcFluencia# (v AS DOUBLE)
DECLARE FUNCTION LcLinhaNeutra# (v AS DOUBLE)
DECLARE FUNCTION LcXd# (m AS DOUBLE, d AS DOUBLE, gf AS DOUBLE, fcd AS DOUBLE)
DECLARE FUNCTION LcXdMax# (fyd AS DOUBLE)
DECLARE FUNCTION LcMu# (i AS INTEGER, v AS DOUBLE)
DECLARE SUB LcMomentoCritico (lx AS DOUBLE, ly AS DOUBLE, bordos AS STRING, iE AS DOUBLE, mu AS DOUBLE, p AS DOUBLE, mc AS DOUBLE, neg AS INTEGER)
DECLARE FUNCTION LcAs# (m AS DOUBLE, h AS DOUBLE, d AS DOUBLE, gf AS DOUBLE, fcd AS DOUBLE, fyd AS DOUBLE, taxa AS DOUBLE)
DECLARE FUNCTION CcaAcoClasse% (novo AS INTEGER)
DECLARE FUNCTION LcSobrepoe% (i AS INTEGER, k AS INTEGER, j AS INTEGER, kk AS INTEGER)
DECLARE FUNCTION LcViga$ (s AS STRING, k AS INTEGER)
DECLARE SUB LcCalculaTodas (fck AS DOUBLE, fyk AS DOUBLE, gf AS DOUBLE, gc AS DOUBLE, gs AS DOUBLE, cob AS DOUBLE, acresc AS DOUBLE, hmin AS DOUBLE, relTot AS DOUBLE, relAcid AS DOUBLE, iE AS DOUBLE, taxaPos AS DOUBLE, taxaNeg AS DOUBLE, dens AS DOUBLE, msg AS STRING)

ComumDirExecDefine _CWD$
CarregaConfiguracao
ObraCarrega
IF Obra <> "" THEN MenuPrincipal
IF Alterado THEN
    LajGrava ArqLajPath$(Obra)
END IF
SYSTEM

' Le o valor numerico do item do LAJE.INI cuja descricao contem o rotulo;
' sem item ou sem numero valido devolve o padrao.
FUNCTION IniNum# (rotulo AS STRING, padrao AS DOUBLE)
    DIM i AS INTEGER, t AS STRING
    i = ArqAchaTexto%(rotulo, 0)
    IF i > 0 THEN
        t = IniValor$(i)
        IF NumeroValido%(t) THEN
            IniNum# = VAL(t)
            EXIT FUNCTION
        END IF
    END IF
    IniNum# = padrao
END FUNCTION

' Le o primeiro campo da linha do SISTRUT.LAP cuja descricao contem o rotulo;
' sem linha ou sem numero valido devolve o padrao.
FUNCTION LapValor# (rotulo AS STRING, padrao AS DOUBLE)
    DIM i AS INTEGER, t AS STRING, sp AS INTEGER
    i = ArqAchaTexto%(rotulo, 0)
    IF i > 0 THEN
        t = LTRIM$(ArqLinha$(i))
        sp = INSTR(t, " ")
        IF sp > 0 THEN t = LEFT$(t, sp - 1)
        IF NumeroValido%(t) THEN
            LapValor# = VAL(t)
            EXIT FUNCTION
        END IF
    END IF
    LapValor# = padrao
END FUNCTION

' Le LAJE.INI (pastas, unidades e coeficientes) e SISTRUT.LAP (parametros de
' calculo). Arquivo ausente ou item ilegivel usa o padrao do original.
SUB CarregaConfiguracao
    DIM d AS STRING, lap AS STRING, nomeLap AS STRING, i AS INTEGER, un AS DOUBLE
    DIM t AS STRING, lenta AS INTEGER, f AS DOUBLE
    IF ArqLer%(ComumDirExec$ + "LAJE.INI") = -1 THEN ArqQtd = 0
    d = IniDirDados$
    IF LEN(d) > 2 THEN
        DirDados = d
    ELSE
        DirDados = ComumDirExec$  ' RECONSTRUCAO: sem pasta de dados no LAJE.INI, usa a pasta do programa
    END IF
    IF RIGHT$(DirDados, 1) <> "\" THEN DirDados = DirDados + "\"

    un = IniNum#("COEFICIENTE MULTIPLICADOR DA UNIDADE DE Fck E Fyk", 1#)
    Cfg.fck = IniNum#("RESISTENCIA CARACTERISTICA DO CONCRETO - Fck", 0.15#) * un
    Cfg.fyk = IniNum#("RESISTENCIA CATACTERISTICA DO ACO - Fyk", 5#) * un
    Cfg.gf = IniNum#("COEFICIENTE DE SEGURANCA DOS ESFORCOS", 1.4#)
    Cfg.gc = IniNum#("COEFICIENTE DE SEGURANCA DO CONCRETO", 1.4#)
    Cfg.gs = IniNum#("COEFICIENTE DE SEGURANCA DO ACO", 1.15#)
    ' Classe do aco pelo "TIPO DE ACO (A/B)" do LAJE.INI; sem o item, classe A.
    i = ArqAchaTexto%("TIPO DE ACO (A/B)", 0)
    IF i > 0 THEN t = UCASE$(LTRIM$(RTRIM$(IniValor$(i)))) ELSE t = "A"
    IF t = "B" THEN i = CcaAcoClasse%(1) ELSE i = CcaAcoClasse%(0)

    ' Nome e pasta do .LAP vem do LAJE.INI; sem arquivo na pasta indicada, tenta a do programa.
    nomeLap = "SISTRUT"
    i = ArqAchaTexto%("PARAMETRIZACAO UTILIZADA", 0)
    IF i > 0 THEN
        IF LEN(IniValor$(i)) > 0 THEN nomeLap = IniValor$(i)
    END IF
    d = IniDirParam$
    IF LEN(d) < 2 THEN d = ComumDirExec$
    IF RIGHT$(d, 1) <> "\" THEN d = d + "\"
    lap = d + nomeLap + ".LAP"
    IF ArqLer%(lap) = -1 THEN
        IF ArqLer%(ComumDirExec$ + nomeLap + ".LAP") = -1 THEN
            ArqQtd = 0  ' RECONSTRUCAO: sem .LAP, valem os padroes
        END IF
    END IF

    Cfg.cob = LapValor#("COBRIMENTO DA ARMADURA", 1.5#)
    Cfg.acresc = LapValor#("ACRESCIMO AO COBRIMENTO", 0.5#)
    Cfg.hmin = LapValor#("MINIMA ALTURA TOTAL DA LAJE", 6#)
    Cfg.hmax = LapValor#("MAXIMA ALTURA TOTAL DA LAJE", 40#)
    ' x/d maximo = esta porcentagem do limite 3/4 (texto do .LAP): limita a
    ' espessura minima e a armadura simples (LcXdMax#, LcAs#).
    Cfg.linhaNeutra = LapValor#("PORCENTAGEM UTILIZADA DA LINHA NEUTRA", 100#)
    Cfg.relTot = LapValor#("MINIMA RELACAO PARA FLEXA COM CARGA TOTAL", 300#)
    Cfg.relAcid = LapValor#("MINIMA RELACAO PARA FLEXA COM CARGA ACIDENTAL", 500#)
    Cfg.dens = LapValor#("DENSIDADE DO CONCRETO", 2.5#)
    Cfg.relMax = LapValor#("MAXIMA RELACAO PERMITIDA PARA Mneg/Mpos", 2#)
    Cfg.relMin = LapValor#("MINIMA RELACAO PERMITIDA PARA Mneg/Mpos", 0.3#)
    Cfg.cantos = LapValor#("RELACAO FIXA ENTRE Mneg/Mpos", 1#)
    Cfg.taxaPos = LapValor#("MINIMA PORCENTAGEM DE ARMADURA PARA OS ESFORCOS POSITIVOS", 0.15#) / 100#
    Cfg.taxaNeg = LapValor#("MINIMA PORCENTAGEM DE ARMADURA PARA OS ESFORCOS NEGATIVOS", 0.1#) / 100#
    Cfg.efic = LapValor#("A EFICIENCIA DA ARMADURA NEGATIVA", 100#)
    ' Coeficiente Mneg/Mpos dos bordos engastados: o .LAP manda considerar
    ' inicialmente o MAXIMO coeficiente (2,00) e a compatibilizacao reduz.
    Cfg.iE = Cfg.relMax

    ' Flecha diferida: "S" na linha DEFORMACAO LENTA do .LAP liga o fator (1+phi) sobre a permanente.
    ' RECONSTRUCAO: phi = 2 (flecha diferida = 2 x imediata), valor nao exposto no binario
    lenta = 0
    i = ArqAchaTexto%("DEFORMACAO LENTA", 0)
    IF i > 0 THEN
        t = LTRIM$(ArqLinha$(i))
        IF INSTR(t, " ") > 0 THEN t = LEFT$(t, INSTR(t, " ") - 1)
        lenta = (UCASE$(t) = "S")
    END IF
    IF lenta THEN f = LcFluencia#(3#) ELSE f = LcFluencia#(1#)

    FOR i = 1 TO DAD_MAXLAJ
        DirPrin(i) = 180#
        RelEsf(i) = 1#
    NEXT
END SUB

' Limpa a tela e escreve o titulo do modulo (linha 1) e a obra corrente (linha 2).
SUB TelaFundo
    CLS
    COLOR COR_DESTAQUE, 0
    LOCATE 1, 2
    PRINT "Calculo e Detalhamento de Painel / Lajes de um Edificio"
    COLOR COR_TEXTO, 0
    LOCATE 2, 2
    PRINT "Obra: "; Obra
END SUB

' Caminho do arquivo de lajes de uma obra: pasta de dados mais <obra>.LAJ.
FUNCTION ArqLajPath$ (obra AS STRING)
    ArqLajPath$ = DirDados + obra + ".LAJ"
END FUNCTION

' Pede a obra (default: obra corrente do SISTRUT.OBR) e le <obra>.LAJ.
' Falha de leitura mostra o erro e pede outra obra; ESC no erro ou nome vazio sai do modulo.
SUB ObraCarrega
    DIM nome AS STRING, msg AS STRING
    DO
        TelaFundo
        LOCATE 4, 2
        PRINT "OBRA #"
        nome = EntradaTexto$(4, 10, 20, ObraAtual$(DirDados))
        IF nome = "" THEN EXIT SUB
        IF LajLe%(ArqLajPath$(nome)) = -1 THEN
            IF SimNao%(6, "Dados Corretos N/*S*", -1) THEN
                Obra = nome
                LajObra = nome
                ObraDefine DirDados, nome
                EXIT SUB
            END IF
        ELSE
            msg = DadErro
            IF msg = "" THEN msg = "erro no processamento - verifique a consistencia dos seus dados"
            TelaErro msg
            TelaStatus "Acione ESC <Enter> para Continuar "
            IF TeclaLer$ = CHR$(27) THEN EXIT SUB
        END IF
    LOOP
END SUB

' Mostra uma mensagem de erro e espera uma tecla.
SUB MostraErro (texto AS STRING)
    DIM t AS STRING
    TelaErro texto
    TelaStatus "Acione ESC <Enter> para Continuar "
    t = TeclaLer$
END SUB

' Menu principal: cada opcao abre a sua tela; R volta ao fim do modulo.
SUB MenuPrincipal
    DIM k AS STRING
    DO
        TelaFundo
        TelaItemMenu 5, 10, "Continuidade e Engastes"
        TelaItemMenu 6, 10, "Direcoes Principais das Armaduras"
        TelaItemMenu 7, 10, "Espessuras Minimas"
        TelaItemMenu 8, 10, "Imposicao de Espessuras"
        TelaItemMenu 9, 10, "Momentos e Armadura necessaria"
        TelaItemMenu 10, 10, "Otimizacao dos Negativos"
        TelaItemMenu 11, 10, "Visualizar e Alterar Parametrizacoes"
        TelaItemMenu 12, 10, "Retorno ao Menu Principal"
        LOCATE 15, 10
        PRINT "escolha opcao ";
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "C": Continuidade
            CASE "D": DirecaoArmadura
            CASE "E": EspessuraMinima
            CASE "I": ImposicaoEspessura
            CASE "M": MomentosArmaduras
            CASE "O": Otimizacao
            CASE "V": Parametros
            CASE "R"
                CLS
                PRINT "Termino da Utilizacao do Sistema SISTRUT   Obrigado .."  ' RECONSTRUCAO: texto de saida do sistema, ver spec 2
                EXIT DO
        END SELECT
    LOOP
END SUB

' Tela 3.7: elimina ou impoe engastamento num trecho, ou altera o coeficiente de engaste.
SUB Continuidade
    DIM k AS STRING, i AS INTEGER, b AS INTEGER, v AS DOUBLE
    DO
        TelaFundo
        LOCATE 4, 2: PRINT "C O N T I N U I D A D E"
        LOCATE 6, 2: PRINT "<E>limina Continuidade   <I>mpoe Engastamento   <A>tribui Armadura   <F>im"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "E"
                TelaFundo
                LOCATE 8, 2: PRINT "<T>oda continuidade   <E>scolher o trecho   <*R*>etorno"
                k = UCASE$(TeclaLer$)
                IF k = "T" THEN
                    FOR i = 1 TO LajQtd
                        FOR b = 1 TO 4
                            IF MID$(Laj(i).bordos, b, 1) = "E" THEN BordoTroca i, b, "A"
                        NEXT
                    NEXT
                    Alterado = -1
                ELSEIF k = "E" THEN
                    DO
                        IF TrechoPede%("Escolha o trecho a Eliminar e acione  <S>im  <R>etorna  <F>im  *PROXIMO*", i, b) = 0 THEN EXIT DO
                        IF SimNao%(14, "Eliminar a continuidade deste trecho  S/*N*", 0) THEN
                            BordoTroca i, b, "A"
                            Alterado = -1
                        END IF
                    LOOP
                END IF
            CASE "I"
                DO
                    IF TrechoPede%("Numero da Laje para Imposicao de Engastamento *FIM*", i, b) = 0 THEN EXIT DO
                    IF SimNao%(14, "Considero este trecho Engastado  S/*PROXIMO*", 0) THEN
                        BordoTroca i, b, "E"
                        Alterado = -1
                    END IF
                LOOP
            CASE "A"
                TelaFundo
                LOCATE 6, 2: PRINT "Altere o Coeficiente de Engastamento (M-/M+)"
                LOCATE 8, 2: PRINT "Coef <=";
                v = EntradaNumero#(8, 11, 6, Cfg.iE)
                IF v >= 0.3# AND v <= 2# THEN
                    Cfg.iE = v
                ELSE
                    MostraErro "Coeficiente fora da faixa 0.30 a 2.00"
                END IF
            CASE "F"
                EXIT DO
        END SELECT
    LOOP
END SUB

' Pede a laje e o lado (1 a 4) de um trecho. Devolve -1 se informados, 0 se vazio ou invalido.
FUNCTION TrechoPede% (pergunta AS STRING, i AS INTEGER, b AS INTEGER)
    DIM nome AS STRING, lado AS STRING
    TelaFundo
    LOCATE 10, 2: PRINT pergunta
    LOCATE 12, 2: PRINT "Laje ";
    nome = UCASE$(LTRIM$(RTRIM$(EntradaTexto$(12, 8, 8, ""))))
    IF nome = "" THEN
        TrechoPede% = 0
        EXIT FUNCTION
    END IF
    LOCATE 13, 2: PRINT "Lado (1 a 4) ";  ' RECONSTRUCAO: o trecho e identificado pelo lado da laje
    lado = EntradaTexto$(13, 19, 2, "")
    i = LajAcha%(nome)
    b = VAL(lado)
    IF i = 0 OR b < 1 OR b > 4 THEN
        MostraErro "Trecho nao encontrado"
        TrechoPede% = 0
        EXIT FUNCTION
    END IF
    TrechoPede% = -1
END FUNCTION

' Troca a letra do lado b da laje i (E engastado, A apoiado, L livre) e zera o resultado
' da laje e da vizinha que divide o trecho, pois os momentos dela dependem do bordo.
SUB BordoTroca (i AS INTEGER, b AS INTEGER, novo AS STRING)
    DIM j AS INTEGER
    Laj(i).bordos = LEFT$(Laj(i).bordos, b - 1) + novo + MID$(Laj(i).bordos, b + 1)
    Laj(i).temRes = 0
    j = VizinhaDe%(i, b)
    IF j > 0 THEN Laj(j).temRes = 0
END SUB

' Tela 3.8: direcao principal da armadura e relacao entre esforcos
' (M+ principal / M+ secundario), usadas como ortotropia nas lajes em cruz
' (MuLaje#, LcMomentosOrto).
' RECONSTRUCAO: TLaje nao tem campo para estes valores; ficam so nesta sessao.
' RECONSTRUCAO: o padrao e 1 (isotropa); a tabela "RELACAO ENTRE VAO MAIOR /
' RELACAO ENTRE ESFORCOS" do .LAP nao e usada para o valor inicial.
SUB DirecaoArmadura
    DIM k AS STRING, i AS INTEGER, v AS DOUBLE
    DO
        TelaFundo
        LOCATE 4, 2: PRINT "D I R E C A O   D A   A R M A D U R A"
        LOCATE 6, 2: PRINT "Uma das Direcoes Principais Predominante da Armadura  180"
        LOCATE 8, 2: PRINT "<D>irecao principal da Armadura    <R>elacao entre Esforcos    <F>im"
        LOCATE 9, 2: PRINT "Relacao = M+ principal / M+ secundario, nas lajes armadas em cruz"
        k = UCASE$(TeclaLer$)
        SELECT CASE k
            CASE "D"
                TelaFundo
                LOCATE 10, 2: PRINT "Laje que deseja Alterar a Direcao Principal da Armadura *RETORNO*"
                i = LajAcha%(UCASE$(LTRIM$(RTRIM$(EntradaTexto$(11, 2, 8, "")))))
                IF i > 0 THEN
                    LOCATE 12, 2: PRINT "Nova Direcao Principal *";
                    v = EntradaNumero#(12, 26, 6, DirPrin(i))
                    DirPrin(i) = v
                    Laj(i).temRes = 0
                END IF
            CASE "R"
                TelaFundo
                LOCATE 10, 2: PRINT "Laje que deseja Alterar a Relacao entre Esforcos *RETORNO*"
                i = LajAcha%(UCASE$(LTRIM$(RTRIM$(EntradaTexto$(11, 2, 8, "")))))
                IF i > 0 THEN
                    LOCATE 12, 2: PRINT "Nova Relacao *";
                    v = EntradaNumero#(12, 18, 6, RelEsf(i))
                    IF v > 0# THEN
                        RelEsf(i) = v
                        Laj(i).temRes = 0
                    ELSE
                        MostraErro "Relacao deve ser maior que zero"
                    END IF
                END IF
            CASE "F"
                EXIT DO
        END SELECT
    LOOP
END SUB

' Relacao de ortotropia mu = my/mx da laje i para LcMomentosOrto. A direcao
' principal e y quando o angulo (graus) fica mais perto de 90/270 que de 0/180;
' RelEsf = M+ principal / M+ secundario.
' RECONSTRUCAO: angulos obliquos sao arredondados para o eixo mais proximo
' (as lajes sao retangulares e alinhadas aos eixos).
FUNCTION MuLaje# (i AS INTEGER)
    DIM a AS DOUBLE, r AS DOUBLE
    r = RelEsf(i)
    IF r <= 0# THEN r = 1#
    a = DirPrin(i) * 3.14159265358979# / 180#
    IF ABS(SIN(a)) > ABS(COS(a)) THEN MuLaje# = r ELSE MuLaje# = 1# / r
END FUNCTION

' Tela 3.6: mostra os parametros de calculo e altera o item escolhido (1 a 7). 8 retorna.
SUB Parametros
    DIM k AS STRING, n AS INTEGER, v AS DOUBLE
    DO
        TelaFundo
        LOCATE 4, 2: PRINT "Correcao de Parametros"
        LOCATE 6, 2: PRINT "1  -  Eficiencia da Armadura Negativa  %   "; FormataNumero$(ParGet#(1), 2, 8)
        LOCATE 7, 2: PRINT "2  -  Cobrimento da Armadura  cm           "; FormataNumero$(ParGet#(2), 2, 8)
        LOCATE 8, 2: PRINT "3  -  Limita Linha Neutra (dominio 3/4)  %  "; FormataNumero$(ParGet#(3), 2, 8)
        LOCATE 9, 2: PRINT "4  -  Densidade do Concreto  t/m2          "; FormataNumero$(ParGet#(4), 2, 8)
        LOCATE 10, 2: PRINT "    Fator de fluencia (1+phi) na flecha permanente  "; FormataNumero$(LcFluencia#(0), 2, 6);
        IF CcaAcoClasse%(-1) = 1 THEN PRINT "   Aco classe B" ELSE PRINT "   Aco classe A"
        LOCATE 11, 2: PRINT "Coeficientes para Relacao dos Momentos Negativos"
        LOCATE 12, 2: PRINT "5  -  Maxima Relacao      Mneg/Mpos      "; FormataNumero$(ParGet#(5), 2, 8)
        LOCATE 13, 2: PRINT "6  -  Minima Relacao      Mneg/Mpos      "; FormataNumero$(ParGet#(6), 2, 8)
        LOCATE 14, 2: PRINT "7  -  Cantos Reentrantes  Mneg/Mpos      "; FormataNumero$(ParGet#(7), 2, 8)
        LOCATE 15, 2: PRINT "8  -  *Retorno ao Menu Principal*"
        LOCATE 17, 2: PRINT "Numero do item a alterar ";
        k = TeclaLer$
        IF k = "8" OR k = CHR$(27) THEN EXIT DO
        IF k >= "1" AND k <= "7" THEN
            n = VAL(k)
            LOCATE 19, 2: PRINT ParDescr$(n)
            LOCATE 20, 2: PRINT "Novo valor ";
            v = EntradaNumero#(20, 14, 10, ParGet#(n))
            ParAjusta n, v
        END IF
    LOOP
END SUB

' Descricao longa do item n da tela de parametros.
FUNCTION ParDescr$ (n AS INTEGER)
    SELECT CASE n
        CASE 1: ParDescr$ = "Eficiencia da Armadura"
        CASE 2: ParDescr$ = "Cobrimento da Armadura"
        CASE 3: ParDescr$ = "Limite da Linha Neutra em relacao ao Dominio 3/4"
        CASE 4: ParDescr$ = "Densidade do Concreto"
        CASE 5: ParDescr$ = "Maxima Relacao entre Momentos Negativos e Positivos em Lados Engastados"
        CASE 6: ParDescr$ = "Minima Relacao entre Momentos Negativos e Positivos em Lados Engastados"
        CASE 7: ParDescr$ = "Relacao FIXA entre Momentos Negativos e Positivos em Cantos Reentrantes"
        CASE ELSE: ParDescr$ = ""
    END SELECT
END FUNCTION

' Valor atual do item n da tela de parametros.
FUNCTION ParGet# (n AS INTEGER)
    SELECT CASE n
        CASE 1: ParGet# = Cfg.efic
        CASE 2: ParGet# = Cfg.cob
        CASE 3: ParGet# = Cfg.linhaNeutra
        CASE 4: ParGet# = Cfg.dens
        CASE 5: ParGet# = Cfg.relMax
        CASE 6: ParGet# = Cfg.relMin
        CASE 7: ParGet# = Cfg.cantos
        CASE ELSE: ParGet# = 0#
    END SELECT
END FUNCTION

' Grava o novo valor do item n. Itens 1, 5, 6 e 7 nao entram na LAJCALC.BM hoje;
' o item 3 (linha neutra) entra via LcLinhaNeutra# em CalculaObra e MontaEspMin.
SUB ParAjusta (n AS INTEGER, v AS DOUBLE)
    SELECT CASE n
        CASE 1: Cfg.efic = v
        CASE 2: Cfg.cob = v
        CASE 3: Cfg.linhaNeutra = v
        CASE 4: Cfg.dens = v
        CASE 5: Cfg.relMax = v
        CASE 6: Cfg.relMin = v
        CASE 7: Cfg.cantos = v
    END SELECT
END SUB

' Tela 3.2: espessura minima (H min) das lajes marcadas; mostra e/ou imprime a tabela.
SUB EspessuraMinima
    DIM msg AS STRING, impr AS INTEGER, visu AS INTEGER
    TelaFundo
    LOCATE 4, 2: PRINT "Calculo de Espessuras Minimas"
    LOCATE 5, 2: PRINT "Lajes ("; LajQtd; ")  Arquivadas"  ' RECONSTRUCAO: legenda do dump incerta
    ListaPede 7, "Numero das Lajes que serao Pesquisadas as Espessuras Minimas", "I/J/N a M/.../K  *TODAS*", "*TODAS*"
    impr = SimNao%(12, "Imprimo Relatorio com Espessuras Minimas  S/*N*", 0)
    visu = SimNao%(13, "Visualizo todo o painel com as Espessuras Minimas  S/*N*", 0)
    RelLimpa
    msg = ""
    MontaEspMin msg
    IF impr THEN RelGrava
    IF visu THEN RelMostra
    IF msg <> "" THEN MostraErro msg
END SUB

' Monta a tabela de espessura minima das lajes marcadas; avisos vao para msg.
' H min: menor h que atende a flecha (LcEspessura#) e, na secao mais
' solicitada, x/d <= LcXdMax# (porcentagem da linha neutra do .LAP).
SUB MontaEspMin (msg AS STRING)
    DIM i AS INTEGER, h AS DOUBLE, mc AS DOUBLE, neg AS INTEGER, xd AS DOUBLE, fyd AS DOUBLE
    fyd = Cfg.fyk / Cfg.gs
    xd = LcLinhaNeutra#(Cfg.linhaNeutra)
    RelAdd "CALCULO DAS ESPESSURAS MINIMAS DAS LAJES"
    RelAdd "Laje    H min   x/d    L/f        As        Perm.    Acid.   P Prop.   Total"
    FOR i = 1 TO LajQtd
        IF Sel(i) THEN
            IF LcTipo$(Laj(i).lx, Laj(i).ly, Laj(i).bordos) = "" THEN
                msg = msg + RTRIM$(Laj(i).nome) + ": Configuracao de bordos nao suportada. "
            ELSE
                h = LcEspessura#(Laj(i).lx, Laj(i).ly, Laj(i).bordos, Laj(i).g, Laj(i).q, Cfg.dens, Cfg.fck, Cfg.hmin, Cfg.relTot, Cfg.relAcid)
                IF h < 0 THEN
                    msg = msg + RTRIM$(Laj(i).nome) + ": espessura acima de 60 cm. "
                    h = 60#
                END IF
                DO
                    LcMomentoCritico Laj(i).lx, Laj(i).ly, Laj(i).bordos, Cfg.iE, MuLaje#(i), h / 100# * Cfg.dens + Laj(i).g + Laj(i).q, mc, neg
                    xd = LcXd#(mc, h - Cfg.cob - Cfg.acresc, Cfg.gf, Cfg.fck / Cfg.gc)
                    IF xd >= 0# AND xd <= LcXdMax#(fyd) THEN EXIT DO
                    IF h >= 60# THEN
                        msg = msg + RTRIM$(Laj(i).nome) + ": x/d acima do limite da linha neutra com 60 cm. "
                        EXIT DO
                    END IF
                    h = h + 1#
                LOOP
                IF h > Cfg.hmax THEN msg = msg + RTRIM$(Laj(i).nome) + ": H necessario  >  H maximo configurado. "
                RelLinhaEsp i, h
            END IF
        END IF
    NEXT
END SUB

' Adiciona a linha de espessura da laje i com altura h (cm). x/d e As sao os
' da secao mais solicitada (LcMomentoCritico, sem compatibilizacao), com a
' taxa minima do sinal do momento; "-" se a secao nao resiste.
' RECONSTRUCAO: o original nao diz de que secao sao x/d e As; usa-se a critica.
SUB RelLinhaEsp (i AS INTEGER, h AS DOUBLE)
    DIM pp AS DOUBLE, tot AS DOUBLE, f1 AS DOUBLE, f2 AS DOUBLE, fl AS DOUBLE, lf AS DOUBLE, ok AS INTEGER
    DIM mc AS DOUBLE, neg AS INTEGER, d AS DOUBLE, xd AS DOUBLE, a AS DOUBLE, taxa AS DOUBLE
    pp = h / 100# * Cfg.dens
    tot = pp + Laj(i).g + Laj(i).q
    d = h - Cfg.cob - Cfg.acresc
    xd = LcLinhaNeutra#(Cfg.linhaNeutra)
    LcMomentoCritico Laj(i).lx, Laj(i).ly, Laj(i).bordos, Cfg.iE, MuLaje#(i), tot, mc, neg
    xd = LcXd#(mc, d, Cfg.gf, Cfg.fck / Cfg.gc)
    IF neg THEN taxa = Cfg.taxaNeg ELSE taxa = Cfg.taxaPos
    a = LcAs#(mc, h, d, Cfg.gf, Cfg.fck / Cfg.gc, Cfg.fyk / Cfg.gs, taxa)
    ' RECONSTRUCAO: L/f usa a flecha total com (1+phi) sobre a permanente e o vao de
    ' LcVaoRef#, o mesmo criterio de LcEspessura# e LcCalculaTodas (antes saia sem fluencia).
    f1 = LcFlecha#(Laj(i).lx, Laj(i).ly, Laj(i).bordos, pp + Laj(i).g, h, Cfg.fck)
    f2 = LcFlecha#(Laj(i).lx, Laj(i).ly, Laj(i).bordos, Laj(i).q, h, Cfg.fck)
    ok = (f1 > 0# AND f2 > 0#)
    IF ok THEN fl = f1 * LcFluencia#(0) + f2
    IF ok THEN lf = LcVaoRef#(Laj(i).lx, Laj(i).ly, LcTipo$(Laj(i).lx, Laj(i).ly, Laj(i).bordos)) * 100# / fl
    RelAdd Pad$(RTRIM$(Laj(i).nome), 8) + FormataNumero$(h, 2, 8) + Campo$(xd, xd >= 0#, 7) + Campo$(lf, ok, 11) + Campo$(a, a >= 0#, 11) + Campo$(Laj(i).g, -1, 10) + Campo$(Laj(i).q, -1, 9) + Campo$(pp, -1, 10) + Campo$(tot, -1, 9)
END SUB

' Tela 3.3: impoe espessuras a grupos de lajes (FIM encerra) e mostra/imprime a tabela.
SUB ImposicaoEspessura
    DIM h AS DOUBLE, i AS INTEGER, impr AS INTEGER, visu AS INTEGER
    DO
        TelaFundo
        LOCATE 4, 2: PRINT "ESPESSURAS IMPOSTAS"
        LOCATE 5, 2: PRINT "Imposicao das Espessuras das Lajes"
        LOCATE 7, 2: PRINT "Espessura a ser Imposta em um grupo de Lajes (H em cm) *FIM*"
        LOCATE 8, 2: PRINT "Ultima Espessura Fornecida "; FormataNumero$(ImpAlt, 2, 8)
        h = EntradaNumero#(7, 72, 6, 0#)
        IF h <= 0# THEN EXIT DO
        ImpAlt = h
        IF h > Cfg.hmax THEN
            MostraErro "H necessario  >  H maximo configurado"
        ELSE
            ListaPede 10, "Numero das Lajes que serao Impostas as Espessuras", "I/J/N a M/.../K  *RETORNA*", ""
            FOR i = 1 TO LajQtd
                IF Sel(i) THEN
                    Laj(i).h = h
                    Alterado = -1
                END IF
            NEXT
        END IF
    LOOP
    TelaFundo
    impr = SimNao%(14, "Imprimo Relatorio com Espessuras Impostas  S/*N*", 0)
    visu = SimNao%(15, "Visualizo todo o painel com as Espessuras Impostas  S/*N*", 0)
    RelLimpa
    RelAdd "IMPOSICAO DAS ESPESSURAS NAS LAJES"
    RelAdd "Laje     H      x/d    L/f        As        Perm.    Acid.   P Prop.   Total"
    FOR i = 1 TO LajQtd
        IF Laj(i).h > 0# THEN RelLinhaEsp i, Laj(i).h
    NEXT
    IF impr THEN RelGrava
    IF visu THEN RelMostra
END SUB

' Tela 3.4: momentos e/ou armaduras das lajes marcadas, todas juntas ou uma por tela.
SUB MomentosArmaduras
    DIM visao AS INTEGER, unica AS INTEGER, impr AS INTEGER, visu AS INTEGER, k AS STRING, i AS INTEGER
    TelaFundo
    LOCATE 4, 2: PRINT "Momentos Atuantes e Armadura Necessaria nas Lajes:"
    ListaPede 6, "Numero das Lajes que serao Listados os Momentos/Armaduras", "I/J/N a M/.../K  *TODAS*", "*TODAS*"
    LOCATE 11, 2: PRINT "Deseja Visualizar  <*1*> Momentos e Armaduras   <2> Momentos   <3> Armaduras"
    k = TeclaLer$
    visao = 1
    IF k = "2" THEN visao = 2
    IF k = "3" THEN visao = 3
    LOCATE 12, 2: PRINT "Visualizo <*T*>odas as Lajes  ou  cada Laje <I>solada"
    unica = (UCASE$(TeclaLer$) = "I")
    impr = SimNao%(14, "Imprimo Relatorio com Momentos/Armaduras  S/*N*", 0)
    visu = SimNao%(15, "Visualizo todo o painel com os Momentos/Armaduras  S/*N*", 0)
    CalculaObra
    RelLimpa
    MontaMomArm visao, 0
    IF impr THEN RelGrava
    IF visu THEN
        IF unica THEN
            FOR i = 1 TO LajQtd
                IF Sel(i) THEN
                    RelLimpa
                    MontaMomArm visao, i
                    RelMostra
                END IF
            NEXT
        ELSE
            RelMostra
        END IF
    END IF
END SUB

' Monta as tabelas de momentos e/ou armaduras: todas as lajes marcadas (sIdx = 0) ou so a sIdx.
' visao: 1 = momentos e armaduras, 2 = momentos, 3 = armaduras.
SUB MontaMomArm (visao AS INTEGER, sIdx AS INTEGER)
    DIM i AS INTEGER, ok AS INTEGER, marcada AS INTEGER
    IF visao <> 3 THEN
        RelAdd "MOMENTOS ATUANTES NAS LAJES"
        RelAdd "Laje     H       M+ principal    M+ secundario    M- maior      M- menor"
        FOR i = 1 TO LajQtd
            marcada = (sIdx = 0 AND Sel(i)) OR (i = sIdx)
            IF marcada THEN
                ok = (Laj(i).temRes <> 0)
                RelAdd Pad$(RTRIM$(Laj(i).nome), 8) + FormataNumero$(Laj(i).h, 2, 9) + Campo$(Laj(i).mx, ok, 16) + Campo$(Laj(i).my, ok, 17) + Campo$(MaxQ#(Laj(i).x1, Laj(i).x2, Laj(i).x3, Laj(i).x4), ok, 15) + Campo$(MinQ#(Laj(i).x1, Laj(i).x2, Laj(i).x3, Laj(i).x4), ok, 12)
            END IF
        NEXT
    END IF
    IF visao <> 2 THEN
        RelAdd "ARMADURAS NAS LAJES"
        RelAdd "Laje     H      As+ principal   As+ secundario   As- maior     As- menor"
        FOR i = 1 TO LajQtd
            marcada = (sIdx = 0 AND Sel(i)) OR (i = sIdx)
            IF marcada THEN
                ok = (Laj(i).temRes <> 0)
                RelAdd Pad$(RTRIM$(Laj(i).nome), 8) + FormataNumero$(Laj(i).h, 2, 9) + Campo$(Laj(i).asx, ok, 16) + Campo$(Laj(i).asy, ok, 17) + Campo$(MaxQ#(Laj(i).as1, Laj(i).as2, Laj(i).as3, Laj(i).as4), ok, 15) + Campo$(MinQ#(Laj(i).as1, Laj(i).as2, Laj(i).as3, Laj(i).as4), ok, 12)
            END IF
        NEXT
    END IF
END SUB

' Tela 3.5: reequilibra os negativos das lajes escolhidas (o LcCalculaTodas compatibiliza
' os bordos de mesma viga) e mostra, por bordo engastado, momento, armadura e relacao.
SUB Otimizacao
    DIM k AS STRING, i AS INTEGER, b AS INTEGER, j AS INTEGER, xk AS DOUBLE, ak AS DOUBLE, ra AS DOUBLE
    TelaFundo
    LOCATE 4, 2: PRINT "Otimizacao dos Momentos Negativos"
    LOCATE 6, 2: PRINT "A Otimizacao dos Momentos Negativos consiste  em  Equilibrar  os  momentos oriundos de Lajes Adjacentes.   Este processo podera ser feito manualmente pelas rotinas de  CONTINUIDADE - IMPOSICAO DE ARMADURA  ou  atraves  deste procedimento automatizado."
    LOCATE 11, 2: PRINT "Caso tenha sido Imposta Armadura nos trechos de Continuidade, tambem serao Verificadas as Armaduras Necessarias e Impostas."
    LOCATE 14, 2: PRINT "Deseja <E>scolher as lajes  ou  <*T*>odas serao equilibradas"
    k = UCASE$(TeclaLer$)
    IF k = "E" THEN
        ListaPede 16, "Lajes que serao equilibradas", "I/J/N a M/.../K  *TODAS*", "*TODAS*"
    ELSE
        ListaSel "*TODAS*"
    END IF
    LOCATE 20, 2: PRINT "Acione  *<Enter> para Interromper"
    CalculaObra
    RelLimpa
    FOR i = 1 TO LajQtd
        IF Sel(i) THEN
            RelAdd "Laje que sera Equilibrada *" + Pad$(RTRIM$(Laj(i).nome), 8)
            FOR b = 1 TO 4
                IF MID$(Laj(i).bordos, b, 1) = "E" THEN
                    j = VizinhaDe%(i, b)
                    IF j > 0 THEN RelAdd "Continuidade com a Laje " + RTRIM$(Laj(j).nome)
                    xk = MomBordo#(i, b)
                    ak = AsBordo#(i, b)
                    IF Laj(i).mx > 0# THEN ra = ABS(xk) / Laj(i).mx ELSE ra = 0#  ' RECONSTRUCAO: relacao Mneg/Mpos = |M-| / M+ principal
                    RelAdd "M =" + FormataNumero$(xk, 2, 9) + "      As =" + FormataNumero$(ak, 2, 8) + "    Mneg/Mpos = " + FormataNumero$(ra, 2, 6)
                    RelAdd "Armadura Necessaria               As =" + FormataNumero$(ak, 2, 8) + " cm2/m"
                END IF
            NEXT
        END IF
    NEXT
    RelMostra
END SUB

' Momento negativo do lado k da laje i.
FUNCTION MomBordo# (i AS INTEGER, k AS INTEGER)
    SELECT CASE k
        CASE 1: MomBordo# = Laj(i).x1
        CASE 2: MomBordo# = Laj(i).x2
        CASE 3: MomBordo# = Laj(i).x3
        CASE 4: MomBordo# = Laj(i).x4
    END SELECT
END FUNCTION

' Armadura negativa do lado k da laje i.
FUNCTION AsBordo# (i AS INTEGER, k AS INTEGER)
    SELECT CASE k
        CASE 1: AsBordo# = Laj(i).as1
        CASE 2: AsBordo# = Laj(i).as2
        CASE 3: AsBordo# = Laj(i).as3
        CASE 4: AsBordo# = Laj(i).as4
    END SELECT
END FUNCTION

' Devolve a laje j que divide o lado k da laje i, ou 0: o lado oposto kk de j tem a mesma
' viga e os dois lados se sobrepoem na mesma linha (viga continua passa por varias lajes).
FUNCTION VizinhaDe% (i AS INTEGER, k AS INTEGER)
    DIM j AS INTEGER, kk AS INTEGER, v AS STRING
    VizinhaDe% = 0
    v = LcViga$(Laj(i).vigas, k)
    IF v = "" OR v = "-" THEN EXIT FUNCTION
    IF k <= 2 THEN kk = k + 2 ELSE kk = k - 2
    FOR j = 1 TO LajQtd
        IF j <> i THEN
            IF LcViga$(Laj(j).vigas, kk) = v AND LcSobrepoe%(i, k, j, kk) THEN
                VizinhaDe% = j
                EXIT FUNCTION
            END IF
        END IF
    NEXT
END FUNCTION

' Roda o calculo da LAJCALC.BM sobre as lajes da obra e mostra os avisos.
SUB CalculaObra
    DIM msg AS STRING, i AS INTEGER, v AS DOUBLE
    TelaStatus "Aguarde ...!"
    FOR i = 1 TO LajQtd
        v = LcMu#(i, MuLaje#(i))
    NEXT
    v = LcLinhaNeutra#(Cfg.linhaNeutra)
    LcCalculaTodas Cfg.fck, Cfg.fyk, Cfg.gf, Cfg.gc, Cfg.gs, Cfg.cob, Cfg.acresc, Cfg.hmin, Cfg.relTot, Cfg.relAcid, Cfg.iE, Cfg.taxaPos, Cfg.taxaNeg, Cfg.dens, msg
    Alterado = -1
    IF msg <> "" THEN MostraErro msg
END SUB

' Esvazia o buffer de relatorio.
SUB RelLimpa
    RelQtd = 0
END SUB

' Acrescenta uma linha ao buffer de relatorio (600 linhas no maximo).
SUB RelAdd (t AS STRING)
    IF RelQtd < 600 THEN
        RelQtd = RelQtd + 1
        Rel(RelQtd) = t
    END IF
END SUB

' Mostra o buffer na tela, 20 linhas por pagina.
SUB RelMostra
    DIM i AS INTEGER, lin AS INTEGER, k AS STRING
    CLS
    lin = 0
    FOR i = 1 TO RelQtd
        IF lin = 20 THEN
            TelaStatus "Qualquer Tecla para Continuar "
            k = TeclaLer$
            CLS
            lin = 0
        END IF
        PRINT Rel(i)
        lin = lin + 1
    NEXT
    TelaStatus "Qualquer Tecla para Continuar "
    k = TeclaLer$
END SUB

' Grava o buffer em <obra>_LAJECALC.LST na pasta de dados (acrescenta ao arquivo).
SUB RelGrava
    DIM arq AS STRING, i AS INTEGER, k AS STRING
    arq = DirDados + Obra + "_LAJECALC.LST"
    OPEN arq FOR APPEND AS #1
    FOR i = 1 TO RelQtd
        PRINT #1, Rel(i)
    NEXT
    PRINT #1, ""
    CLOSE #1
    TelaStatus "Relatorio gravado em " + arq
    k = TeclaLer$
END SUB

' Formata um numero para coluna de tabela; sem calculo (ok = 0) escreve um traco.
FUNCTION Campo$ (v AS DOUBLE, ok AS INTEGER, larg AS INTEGER)
    IF ok THEN
        Campo$ = FormataNumero$(v, 2, larg)
    ELSE
        Campo$ = SPACE$(larg - 1) + "-"
    END IF
END FUNCTION

' Completa s com espacos a direita ate n caracteres.
FUNCTION Pad$ (s AS STRING, n AS INTEGER)
    Pad$ = LEFT$(s + SPACE$(n), n)
END FUNCTION

' Maior de quatro valores.
FUNCTION MaxQ# (a AS DOUBLE, b AS DOUBLE, c AS DOUBLE, d AS DOUBLE)
    DIM r AS DOUBLE
    r = a
    IF b > r THEN r = b
    IF c > r THEN r = c
    IF d > r THEN r = d
    MaxQ# = r
END FUNCTION

' Menor de quatro valores.
FUNCTION MinQ# (a AS DOUBLE, b AS DOUBLE, c AS DOUBLE, d AS DOUBLE)
    DIM r AS DOUBLE
    r = a
    IF b < r THEN r = b
    IF c < r THEN r = c
    IF d < r THEN r = d
    MinQ# = r
END FUNCTION

' Indice da laje de nome dado (sem diferenciar maiusculas), ou 0.
FUNCTION LajAcha% (nome AS STRING)
    DIM i AS INTEGER
    LajAcha% = 0
    FOR i = 1 TO LajQtd
        IF UCASE$(RTRIM$(Laj(i).nome)) = UCASE$(nome) THEN
            LajAcha% = i
            EXIT FUNCTION
        END IF
    NEXT
END FUNCTION

' Mostra a pergunta e a dica da lista de lajes, le a resposta e marca Sel().
SUB ListaPede (lin AS INTEGER, pergunta AS STRING, dica AS STRING, padrao AS STRING)
    LOCATE lin, 2
    PRINT pergunta
    LOCATE lin + 1, 2
    PRINT dica
    ListaSel EntradaTexto$(lin + 2, 2, 40, padrao)
END SUB

' Marca em Sel() as lajes da lista: "A/B/C" ou intervalo "A a D". Vazio: nenhuma; *TODAS*: todas.
SUB ListaSel (txt AS STRING)
    DIM i AS INTEGER, t AS STRING, pc AS STRING, p AS INTEGER, q AS INTEGER, a AS INTEGER, b AS INTEGER, s AS INTEGER
    FOR i = 1 TO LajQtd
        Sel(i) = 0
    NEXT
    t = UCASE$(LTRIM$(RTRIM$(txt)))
    IF t = "*TODAS*" OR t = "T" THEN
        FOR i = 1 TO LajQtd
            Sel(i) = -1
        NEXT
        EXIT SUB
    END IF
    DO WHILE t <> ""
        p = INSTR(t, "/")
        IF p > 0 THEN
            pc = LEFT$(t, p - 1)
            t = MID$(t, p + 1)
        ELSE
            pc = t
            t = ""
        END IF
        q = INSTR(pc, " A ")
        IF q > 0 THEN
            a = LajAcha%(LTRIM$(RTRIM$(LEFT$(pc, q - 1))))
            b = LajAcha%(LTRIM$(RTRIM$(MID$(pc, q + 3))))
            IF a > 0 AND b > 0 THEN
                IF a > b THEN
                    s = a
                    a = b
                    b = s
                END IF
                FOR i = a TO b
                    Sel(i) = -1
                NEXT
            END IF
        ELSE
            a = LajAcha%(LTRIM$(RTRIM$(pc)))
            IF a > 0 THEN Sel(a) = -1
        END IF
    LOOP
END SUB

' Pergunta S/N na linha lin; Enter ou ESC usam o padrao (1 = S, 0 = N). Devolve -1 para S.
FUNCTION SimNao% (lin AS INTEGER, txt AS STRING, padrao AS INTEGER)
    DIM k AS STRING
    LOCATE lin, 2
    PRINT txt;
    DO
        k = UCASE$(TeclaLer$)
        IF k = CHR$(13) OR k = CHR$(27) THEN
            SimNao% = padrao
            EXIT FUNCTION
        END IF
        IF k = "S" THEN
            SimNao% = -1
            EXIT FUNCTION
        END IF
        IF k = "N" THEN
            SimNao% = 0
            EXIT FUNCTION
        END IF
    LOOP
END FUNCTION

'$INCLUDE: '../common/SISCOMUM.BM'
'$INCLUDE: '../common/SISDADOS.BM'
'$INCLUDE: '../common/CALCCA.BM'
'$INCLUDE: 'LAJCALC.BM'
