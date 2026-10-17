"""Gera a sonda grafica (mesmas DATA para o QB4.5 do oraculo e para o QB64 com RT45GFX).

Uso: python -I gera_sonda.py <pasta .dados do oraculo> <BAS do QB64> [nome]
  - escreve <pasta>/<NOME>.BAS (QuickBASIC 4.5, comandos nativos) e o programa QB64
    (mesmas DATA, chamando RT_LINE/RT_PSET/RT_CIRCLE/RT_PMAP do RT45GFX.BM).
Cada cena termina com um despejo da memoria de video: no QB4.5 por BSAVE (CGA: B800, 16 KB;
EGA: os 4 planos de A000, 28000 bytes cada), no QB64 pelos indices de cor (G<n>.RAW).
Operacoes (DATA): 1 SCREEN m | 2 VIEW t,x1,y1,x2,y2,cor,borda | 3 WINDOW t,x1,y1,x2,y2 |
4 LINE f,x1,y1,x2,y2,cor,estilo | 5 PSET f,x,y,cor | 6 CIRCLE f,x,y,r,cor,ini,fim,asp |
7 despejo n | 8 VIEW+WINDOW+CLS | 9 GET/PUT x1,y1,x2,y2,px,py | 10 PMAP v,n | 0 fim.
Bits de f: 1 1o ponto, 2 STEP no 1o, 4 STEP no 2o, 8 cor, 16 B, 32 BF, 64 estilo,
128 PRESET, 256 inicio, 512 fim, 1024 aspecto.
"""
import random
import sys

R = random.Random(45)
ops = []          # linhas de DATA
lin_var = set()   # variantes de LINE usadas
pt_var = set()
ci_var = set()
vw_var = set()


def q(v):
    """numero para DATA (quartos de unidade ou decimal curto)"""
    if isinstance(v, int):
        return str(v)
    s = repr(float(v))
    if s.endswith(".0"):
        s = s[:-2]
    return s


def op(*a):
    ops.append(",".join(q(x) for x in a))


def screen(m):
    op(1, m)


def view(t, x1=0, y1=0, x2=0, y2=0, cor=-1, borda=-1):
    vw_var.add((t, cor >= 0, borda >= 0))
    op(2, t, x1, y1, x2, y2, cor, borda)


def window(t, x1=0, y1=0, x2=0, y2=0):
    op(3, t, x1, y1, x2, y2)


def line(f, x1, y1, x2, y2, cor=-1, est=0):
    if cor >= 0 or cor < -1:
        f |= 8
    lin_var.add(f)
    op(4, f, x1, y1, x2, y2, cor, est)


def pset(f, x, y, cor=-1):
    if cor != -1:
        f |= 8
    pt_var.add(f)
    op(5, f, x, y, cor)


def circle(f, x, y, r, cor=-1, ini=0, fim=0, asp=0):
    if cor != -1:
        f |= 8
    ci_var.add(f)
    op(6, f, x, y, r, cor, ini, fim, asp)


def despeja(n):
    op(7, n)


def limpa():
    op(8)


def getput(x1, y1, x2, y2, px, py):
    op(9, x1, y1, x2, y2, px, py)


gp_var = set()


def getput2(f, x1, y1, x2, y2, px, py):
    """GET/PUT com STEP: f 2 = STEP no 1o ponto do GET, 4 = no 2o, 8 = STEP no PUT"""
    gp_var.add(f)
    op(11, f, x1, y1, x2, y2, px, py)


def pmap(v, n):
    op(10, v, n)


def fr(a, b):
    """quarto de unidade aleatorio em [a, b]"""
    return R.randint(a * 4, b * 4) / 4


def cor_al(m):
    return 1 if m == 2 else R.randint(1, 15)


def cenas(m, base, quais):
    W, H = 640, (200 if m == 2 else 350)
    screen(m)
    # 1 leque inteiro a partir do centro e dos cantos
    R.seed(m * 100 + 1)
    if 1 in quais:
        cx, cy = W // 2, H // 2
        for x in range(0, W, 24):
            line(1, cx, cy, x, 0, cor_al(m))
            line(1, x, H - 1, cx, cy, cor_al(m))
        for y in range(0, H, 16):
            line(1, cx, cy, 0, y, cor_al(m))
            line(1, W - 1, y, cx, cy, cor_al(m))
        despeja(base + 1)
        limpa()
    # 2 retas inteiras aleatorias dentro da tela
    R.seed(m * 100 + 2)
    if 2 in quais:
        for _ in range(70):
            line(1, R.randint(0, W - 1), R.randint(0, H - 1), R.randint(0, W - 1), R.randint(0, H - 1), cor_al(m))
        despeja(base + 2)
        limpa()
    # 3 retas com pontas fora (recorte)
    R.seed(m * 100 + 3)
    if 3 in quais:
        for _ in range(50):
            line(1, R.randint(-2000, 2600), R.randint(-1000, 1300), R.randint(-300, 940), R.randint(-200, 500), cor_al(m))
        for _ in range(20):
            line(1, R.randint(-30000, 30000), R.randint(-30000, 30000), R.randint(-30000, 30000), R.randint(-30000, 30000), cor_al(m))
        despeja(base + 3)
        limpa()
    # 4 coordenadas fracionarias sem WINDOW (arredondamento)
    R.seed(m * 100 + 4)
    if 4 in quais:
        for _ in range(50):
            line(1, fr(-20, W + 20), fr(-20, H + 20), fr(-20, W + 20), fr(-20, H + 20), cor_al(m))
        for i in range(120):
            pset(1, fr(0, W - 1), fr(0, H - 1), cor_al(m) if i % 3 else -1)
        for i in range(16):
            pset(1, 10 + i * 0.5, 3, -1)
            pset(1, 10 + i * 0.25, 5, -1)
        despeja(base + 4)
        limpa()
    # 5 estilos, cadeias LINE -(x,y) e STEP
    R.seed(m * 100 + 5)
    if 5 in quais:
        est = [-21846, 4369, -3856, -32767, 21845, 255, -256, 1]
        for _ in range(30):
            line(1 | 64, R.randint(-50, W + 50), R.randint(-50, H + 50), R.randint(0, W - 1), R.randint(0, H - 1), cor_al(m), R.choice(est))
        for _ in range(6):
            line(1 | 16 | 64, R.randint(-20, W), R.randint(-20, H), R.randint(0, W + 20), R.randint(0, H + 20), cor_al(m), R.choice(est))
        line(1, 100, 100, 150, 120, cor_al(m))
        for _ in range(15):
            line(0, R.randint(0, W - 1), R.randint(0, H - 1), 0, 0, cor_al(m))
        for _ in range(15):
            line(4, 0, 0, R.randint(-60, 60), R.randint(-40, 40), cor_al(m))
        for _ in range(10):
            line(1 | 2 | 4, R.randint(-30, 30), R.randint(-30, 30), R.randint(-80, 80), R.randint(-50, 50), cor_al(m))
        for _ in range(10):
            pset(2, R.randint(-20, 20), R.randint(-20, 20), cor_al(m))
        despeja(base + 5)
        limpa()
    # 6 caixas B e BF, dentro e fora (inclusive inteiramente a esquerda/acima)
    R.seed(m * 100 + 6)
    if 6 in quais:
        for _ in range(12):
            line(1 | 16, R.randint(-100, W + 100), R.randint(-100, H + 100), R.randint(-100, W + 100), R.randint(-100, H + 100), cor_al(m))
        for _ in range(8):
            x, y = R.randint(-50, W), R.randint(-50, H)
            line(1 | 32, x, y, x + R.randint(-60, 60), y + R.randint(-40, 40), cor_al(m))
        line(1 | 32, -10, -10, -5, -5, cor_al(m))
        line(1 | 32, -30, 50, -20, 60, cor_al(m))
        line(1 | 32, 50, -30, 70, -20, cor_al(m))
        line(1 | 32, W + 5, 50, W + 20, 60, cor_al(m))
        line(1 | 32, 300, H + 5, 320, H + 9, cor_al(m))
        line(1 | 16, -10, -10, -5, -5, cor_al(m))
        despeja(base + 6)
        limpa()
    # 7 VIEW (0,0)-(639,191) + WINDOW SCREEN (0,0)-(640,192) (esquema da VIGA) e PMAP
    R.seed(m * 100 + 7)
    if 7 in quais:
        view(2, 0, 0, 639, 191)
        window(1, 0, 0, 640, 192)
        for _ in range(60):
            line(1, fr(-10, 650), fr(-10, 200), fr(-10, 650), fr(-10, 200), cor_al(m))
        for _ in range(150):
            pset(1, fr(0, 640), fr(0, 192), cor_al(m))
        for _ in range(8):
            circle(1, fr(20, 620), fr(20, 170), fr(1, 60), cor_al(m))
        for v in (0, 0.5, 1, 319.5, 320, 320.5, 639.75, 640, -3.25, 1000):
            pmap(v, 0)
            pmap(v, 1)
        despeja(base + 7)
        limpa()
    # 8 VIEW comum deslocado com borda + WINDOW cartesiano; STEP logico
    R.seed(m * 100 + 8)
    if 8 in quais:
        view(2, 20, 10, 600, H - 20, 0, cor_al(m))
        window(2, -10, -5, 100, 50)
        for _ in range(40):
            line(1, fr(-30, 120), fr(-20, 70), fr(-30, 120), fr(-20, 70), cor_al(m))
        for _ in range(60):
            pset(1, fr(-10, 100), fr(-5, 50), cor_al(m))
        for _ in range(6):
            circle(1, fr(0, 90), fr(0, 45), fr(1, 20), cor_al(m))
        line(1, 0, 0, 10, 10, cor_al(m))
        for _ in range(10):
            line(4, 0, 0, fr(-5, 5), fr(-5, 5), cor_al(m))
        for _ in range(5):
            line(1 | 2 | 4, fr(-3, 3), fr(-3, 3), fr(-8, 8), fr(-8, 8), cor_al(m))
        for _ in range(5):
            line(1 | 16, fr(-15, 105), fr(-10, 55), fr(-15, 105), fr(-10, 55), cor_al(m))
        line(1 | 32, 60, 30, 70, 40, cor_al(m))
        for v in (-10, 0, 0.25, 45.5, 100, -20):
            pmap(v, 0)
            pmap(v, 1)
        despeja(base + 8)
        limpa()
    # 9 VIEW SCREEN + WINDOW SCREEN (escala sobre a tela inteira?)
    R.seed(m * 100 + 9)
    if 9 in quais:
        view(1, 50, 20, 590, H - 30)
        window(1, 0, 0, 100, 100)
        for _ in range(40):
            line(1, fr(-10, 110), fr(-10, 110), fr(-10, 110), fr(-10, 110), cor_al(m))
        for _ in range(4):
            circle(1, fr(20, 80), fr(20, 80), fr(2, 20), cor_al(m))
        for v in (0, 50, 100):
            pmap(v, 0)
            pmap(v, 1)
        despeja(base + 9)
        limpa()
    # 10 circulos sem WINDOW, aspecto padrao
    R.seed(m * 100 + 10)
    if 10 in quais:
        for r in list(range(0, 12)) + [15, 20, 33, 47, 64, 99, 150, 260]:
            circle(1, R.randint(0, W - 1), R.randint(0, H - 1), r, cor_al(m))
        for _ in range(10):
            circle(1, fr(-50, W + 50), fr(-50, H + 50), fr(0, 120), cor_al(m))
        despeja(base + 10)
        limpa()
    # 11 aspecto explicito
    R.seed(m * 100 + 11)
    if 11 in quais:
        for a in (0.3, 0.5, 0.75, 1, 1.25, 1.5, 2, 3.7, 1.3150685, 0.004, 0.41666, 2.4, 0.9990):
            circle(1 | 1024, R.randint(60, W - 60), R.randint(40, H - 40), R.randint(5, 70), cor_al(m), 0, 0, a)
        despeja(base + 11)
        limpa()
    # 12 arcos (inicio/fim, negativos = raio, inicio > fim)
    R.seed(m * 100 + 12)
    if 12 in quais:
        angs = [0, 0.5, 0.7853982, 1, 1.5707963, 2, 3.1416, 3.5, 4.712389, 5.5, 6.2831]
        for _ in range(14):
            a1, a2 = R.choice(angs), R.choice(angs)
            if R.random() < 0.3:
                a1 = -a1 if a1 else -0.001
            if R.random() < 0.3:
                a2 = -a2 if a2 else -0.001
            f = 1 | 256 | 512
            if R.random() < 0.3:
                f |= 1024
            circle(f, R.randint(50, W - 50), R.randint(40, H - 40), R.randint(5, 60), cor_al(m), a1, a2, R.choice((0.5, 1, 2)))
        circle(1 | 256, 100, 100, 30, cor_al(m), 1, 0, 0)
        circle(1 | 512, 200, 100, 30, cor_al(m), 0, 2, 0)
        circle(1 | 256 | 512, 300, 100, 30, cor_al(m), 0, 3.1416, 0)
        circle(1 | 256 | 512 | 1024, 400, 100, 30, cor_al(m), 0, 3.1416, 0.5)
        despeja(base + 12)
        limpa()
    # 13 GET/PUT com WINDOW SCREEN em coordenadas fracionarias
    R.seed(m * 100 + 13)
    if 13 in quais:
        view(2, 0, 0, 639, H - 9)
        window(1, 0, 0, 640, H - 8)
        for _ in range(40):
            line(1, fr(0, 640), fr(0, H - 8), fr(0, 640), fr(0, H - 8), cor_al(m))
        for _ in range(6):
            x, y = fr(10, 500), fr(5, H - 60)
            getput(x, y, x + fr(5, 60), y + fr(5, 40), fr(0, 560), fr(0, H - 60))
        despeja(base + 13)
        limpa()



def cenas2(m, base, quais):
    W, H = 640, (200 if m == 2 else 350)
    screen(m)
    # 14 empates exatos (fator 0,5) em WINDOW SCREEN e cartesiano
    R.seed(m * 100 + 14)
    if 14 in quais:
        view(2, 10, 10, 210, 110)
        window(1, 0, 0, 400, 200)
        for _ in range(40):
            line(1, fr(-20, 420), fr(-20, 220), fr(-20, 420), fr(-20, 220), cor_al(m))
        for _ in range(60):
            pset(1, fr(0, 400), fr(0, 200), cor_al(m))
        for _ in range(4):
            circle(1, fr(50, 350), fr(50, 150), R.randint(3, 40) + 0.5, cor_al(m))
        for v in (1, 3, 5, 0.5, 1.5, 2.5):
            pmap(v, 0)
            pmap(v, 1)
            pmap(v, 2)
            pmap(v, 3)
        view(2, 300, 10, 500, 110)
        window(2, 0, 0, 400, 200)
        for _ in range(40):
            line(1, fr(-20, 420), fr(-20, 220), fr(-20, 420), fr(-20, 220), cor_al(m))
        for _ in range(60):
            pset(1, fr(0, 400), fr(0, 200), cor_al(m))
        for _ in range(4):
            circle(1, fr(50, 350), fr(50, 150), R.randint(3, 40) + 0.5, cor_al(m))
        for v in (1, 3, 5, 0.5, 1.5, 2.5):
            pmap(v, 1)
            pmap(v, 3)
        despeja(base + 14)
        limpa()
    # 15 circulos grandes, fora da tela, STEP, aspecto > 1 com arco, inicio = fim
    R.seed(m * 100 + 15)
    if 15 in quais:
        for _ in range(8):
            circle(1, R.randint(-400, W + 400), R.randint(-300, H + 300), R.randint(150, 900), cor_al(m))
        circle(1, 320, H // 2, 3000, cor_al(m))
        pset(1, 100, 50, cor_al(m))
        circle(2, 20, 10, 15, cor_al(m))
        circle(2, 40, 10, 15, cor_al(m))
        for a in (1.5, 2, 3, 5, 0.25):
            circle(1 | 256 | 512 | 1024, R.randint(60, W - 60), R.randint(40, H - 40), R.randint(10, 60), cor_al(m), R.choice((0.3, 1, 2.5)), R.choice((-4, 5, 6.283185)), a)
        circle(1 | 256 | 512, 500, 60, 25, cor_al(m), 1, 1, 0)
        circle(1 | 256 | 512, 560, 60, 25, cor_al(m), -1, -1, 0)
        circle(1 | 256 | 512, 500, 140, 25, cor_al(m), -0.001, -6.283185, 0)
        circle(1 | 256 | 512, 560, 140, 25, cor_al(m), -2, 1, 0)
        circle(1 | 256 | 512, 440, 140, 25, cor_al(m), 6.283185, 0, 0)
        circle(1 | 256 | 512, 380, 140, 0, cor_al(m), -1, -2, 0)
        circle(1 | 256 | 512, 300, 160, 2, cor_al(m), -1, -2, 0)
        view(2, 100, 20, 300, 120, -1, cor_al(m))
        window(2, -10, -10, 10, 10)
        circle(1, 0, 0, 5, cor_al(m))
        circle(1 | 256 | 512, 2, 2, 7.5, cor_al(m), -0.5, -2.5, 0)
        circle(1 | 1024, -3, 1, 4, cor_al(m), 0, 0, 2)
        despeja(base + 15)
        limpa()
    # 16 estilo com recorte de VIEW
    R.seed(m * 100 + 16)
    if 16 in quais:
        view(1, 100, 50, 500, H - 50)
        est = [-21846, 4369, -3856, -32767, 21845, 255, -256, 1, 3855]
        for _ in range(40):
            line(1 | 64, R.randint(-100, W + 100), R.randint(-100, H + 100), R.randint(-100, W + 100), R.randint(-100, H + 100), cor_al(m), R.choice(est))
        for _ in range(8):
            line(1 | 16 | 64, R.randint(50, 300), R.randint(20, H // 2), R.randint(300, 600), R.randint(H // 2, H), cor_al(m), R.choice(est))
        for _ in range(6):
            line(1 | 32, R.randint(50, 300), R.randint(20, H // 2), R.randint(300, 600), R.randint(H // 2, H), cor_al(m))
        despeja(base + 16)
        limpa()
    # 17 cores e PRESET
    R.seed(m * 100 + 17)
    if 17 in quais:
        cores = [0, 1, 2, 3, 255, 256, 257, -2, 15, 16, 20, 300, 7]
        for i, c in enumerate(cores):
            line(1 | 32, 10 + 45 * i, 10, 40 + 45 * i, 60, c)
            line(1, 10 + 45 * i, 70, 40 + 45 * i, 90, c)
            circle(1, 25 + 45 * i, 120, 12, c)
            pset(1, 25 + 45 * i, 100, c)
        line(1 | 32, 10, 140, 600, 190, cor_al(m))
        for _ in range(60):
            pset(1 | 128, R.randint(10, 600), R.randint(140, 190), -1)
        for _ in range(20):
            pset(1 | 128, R.randint(10, 600), R.randint(140, 190), cor_al(m))
        view(1, 200, 150, 400, 180)
        for _ in range(60):
            pset(1, R.randint(150, 450), R.randint(130, 199), cor_al(m))
        despeja(base + 17)
        limpa()
    # 18 ultimo ponto: depois de SCREEN, VIEW e WINDOW
    R.seed(m * 100 + 18)
    if 18 in quais:
        screen(m)
        line(0, 0, 0, 10, 10, cor_al(m))
        view(2, 100, 50, 400, H - 30)
        line(4, 0, 0, 30, 20, cor_al(m))
        window(1, 0, 0, 50, 50)
        pset(2, 3, 3, cor_al(m))
        line(4, 0, 0, 5, -10, cor_al(m))
        view(2, 50, 20, 300, H - 60)
        line(4, 0, 0, -5, 10, cor_al(m))
        window(2, -5, -5, 5, 5)
        line(4, 0, 0, 2, 2, cor_al(m))
        view(0)
        line(4, 0, 0, 1, -3, cor_al(m))
        window(0)
        line(4, 0, 0, 40, 5, cor_al(m))
        despeja(base + 18)
        limpa()
    # 19 estouro de 16 bits e de 32 bits
    R.seed(m * 100 + 19)
    if 19 in quais:
        for x, y in ((70000, 50), (-70000, 60), (65636, 70), (32767.75, 80), (-32768.5, 90), (100000.25, 100000.5), (65536 + 320, 100)):
            line(1, 320, 20, x, y, cor_al(m))
            pset(1, x, y, cor_al(m))
        window(1, 0, 0, 1, 1)
        for x in (100, -100, 52, 1000):
            line(1, 0.5, 0.5, x, 0.25, cor_al(m))
        line(1, 0.5, 0.5, 4000000, 0.3, cor_al(m))
        pset(1, 0.25, 0.75, cor_al(m))
        despeja(base + 19)
        limpa()
    # 20 GET/PUT sem WINDOW, coordenadas fracionarias e STEP
    R.seed(m * 100 + 20)
    if 20 in quais:
        for _ in range(40):
            line(1, R.randint(0, W - 1), R.randint(0, H - 1), R.randint(0, W - 1), R.randint(0, H - 1), cor_al(m))
        for _ in range(4):
            x, y = fr(10, 500), fr(5, H - 60)
            getput(x, y, x + fr(5, 60), y + fr(5, 40), fr(0, 560), fr(0, H - 60))
        for f in (2, 4, 6, 8, 12):
            x, y = R.randint(10, 500), R.randint(5, H - 60)
            getput2(f, x if not f & 2 else R.randint(-5, 5), y if not f & 2 else R.randint(-5, 5), R.randint(5, 50), R.randint(5, 30), R.randint(0, 100), R.randint(0, 50))
        view(2, 20, 10, 600, H - 10)
        window(1, 0, 0, 100, 100)
        for f in (0, 4, 8):
            getput2(f, fr(5, 40), fr(5, 40), fr(5, 20) if f & 4 else fr(50, 70), fr(5, 20) if f & 4 else fr(50, 70), fr(10, 20) if f & 8 else fr(40, 80), fr(5, 20) if f & 8 else fr(20, 60))
        despeja(base + 20)
        limpa()

def gera_qb45(nome):
    L = []
    a = L.append
    a("' Sonda grafica do BRUN45 (gerada por tests/retraducao/gfx/gera_sonda.py; nao editar)")
    a("DEFINT A-Z")
    a("DIM SHARED buf(8000)")
    a('OPEN "C:\\%s.TXT" FOR OUTPUT AS #9' % nome)
    a("ON ERROR GOTO erro")
    a("DO")
    a("  READ op: k = k + 1")
    a("  SELECT CASE op")
    a("  CASE 0: EXIT DO")
    a("  CASE 1: READ m: SCREEN m: modo = m")
    a("  CASE 2: READ v, x1!, y1!, x2!, y2!, c, b: GOSUB visao")
    a("  CASE 3: READ v, x1!, y1!, x2!, y2!")
    a("    IF v = 0 THEN WINDOW")
    a("    IF v = 1 THEN WINDOW SCREEN (x1!, y1!)-(x2!, y2!)")
    a("    IF v = 2 THEN WINDOW (x1!, y1!)-(x2!, y2!)")
    a("  CASE 4: READ v, x1!, y1!, x2!, y2!, c, s: GOSUB linha")
    a("  CASE 5: READ v, x1!, y1!, c: GOSUB ponto")
    a("  CASE 6: READ v, x1!, y1!, r!, c, a1!, a2!, asp!: GOSUB circulo")
    a("  CASE 7: READ n: GOSUB despeja")
    a("  CASE 8: VIEW: WINDOW: CLS")
    a("  CASE 9: READ x1!, y1!, x2!, y2!, px!, py!: GET (x1!, y1!)-(x2!, y2!), buf: PUT (px!, py!), buf, PSET")
    a("  CASE 10: READ x1!, n: PRINT #9, k; PMAP(x1!, n)")
    a("  CASE 11: READ v, x1!, y1!, x2!, y2!, px!, py!: GOSUB getput")
    a("  END SELECT")
    a("LOOP")
    a("CLOSE #9")
    a("SCREEN 0")
    a("END")
    a("erro:")
    a('PRINT #9, "ERRO"; ERR; "op"; k')
    a("RESUME NEXT")
    a("despeja:")
    a('n$ = "C:\\G" + LTRIM$(STR$(n))')
    a('IF modo = 2 THEN DEF SEG = &HB800: BSAVE n$ + ".CGA", 0, 16384: DEF SEG')
    a("IF modo = 9 THEN")
    a("  FOR p = 0 TO 3")
    a("    OUT &H3CE, 4: OUT &H3CF, p")
    a('    DEF SEG = &HA000: BSAVE n$ + ".E" + LTRIM$(STR$(p)), 0, 28000: DEF SEG')
    a("  NEXT")
    a("END IF")
    a("RETURN")
    a("visao:")
    for (t, tc, tb) in sorted(vw_var):
        if t == 0:
            st = "VIEW"
        else:
            st = "VIEW " + ("SCREEN " if t == 1 else "") + "(x1!, y1!)-(x2!, y2!)"
            ex = [("c" if tc else ""), ("b" if tb else "")]
            while ex and ex[-1] == "":
                ex.pop()
            if ex:
                st += ", " + ", ".join(ex)
        a("IF v = %d AND (c >= 0) = %d AND (b >= 0) = %d THEN %s" % (t, -1 if tc else 0, -1 if tb else 0, st))
    a("RETURN")
    a("linha:")
    a("SELECT CASE v")
    for f in sorted(lin_var):
        p1 = ""
        if f & 1:
            p1 = ("STEP" if f & 2 else "") + "(x1!, y1!)"
        st = "LINE " + p1 + "-" + ("STEP" if f & 4 else "") + "(x2!, y2!)"
        ex = ["c" if f & 8 else "", "BF" if f & 32 else ("B" if f & 16 else ""), "s" if f & 64 else ""]
        while ex and ex[-1] == "":
            ex.pop()
        if ex:
            st += ", " + ", ".join(ex)
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("RETURN")
    a("ponto:")
    a("SELECT CASE v")
    for f in sorted(pt_var):
        st = ("PRESET " if f & 128 else "PSET ") + ("STEP" if f & 2 else "") + "(x1!, y1!)"
        if f & 8:
            st += ", c"
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("RETURN")
    a("getput:")
    a("SELECT CASE v")
    for f in sorted(gp_var):
        a("CASE %d: GET %s(x1!, y1!)-%s(x2!, y2!), buf: PUT %s(px!, py!), buf, PSET" % (f, "STEP" if f & 2 else "", "STEP" if f & 4 else "", "STEP" if f & 8 else ""))
    a("END SELECT")
    a("RETURN")
    a("circulo:")
    a("SELECT CASE v")
    for f in sorted(ci_var):
        st = "CIRCLE " + ("STEP" if f & 2 else "") + "(x1!, y1!), r!"
        ex = ["c" if f & 8 else "", "a1!" if f & 256 else "", "a2!" if f & 512 else "", "asp!" if f & 1024 else ""]
        while ex and ex[-1] == "":
            ex.pop()
        if ex:
            st += ", " + ", ".join(ex)
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("RETURN")
    for i in range(0, len(ops), 8):
        a("DATA " + ", ".join(ops[i:i + 8]))
    return "\r\n".join(L) + "\r\n"


def gera_qb64(nome):
    L = []
    a = L.append
    a("' Sonda grafica no QB64 com RT45GFX (gerada por gera_sonda.py; nao editar)")
    a("' Saida: <pasta de SISTRUT_SAIDA ou corrente>G<n>.RAW (indices de cor) e %s.TXT" % nome)
    a("'$INCLUDE: '../../../src-original/comum/RT45.BI'")
    a("'$INCLUDE: '../../../src-original/comum/RT45GFX.BI'")
    a("DIM SHARED buf(8000) AS INTEGER")
    a("DIM SHARED k AS LONG, op AS INTEGER, v AS INTEGER, m AS INTEGER, n AS INTEGER")
    a("DIM SHARED x1 AS SINGLE, y1 AS SINGLE, x2 AS SINGLE, y2 AS SINGLE, c AS INTEGER, b AS INTEGER, s AS INTEGER")
    a("DIM SHARED r AS SINGLE, a1 AS SINGLE, a2 AS SINGLE, asp AS SINGLE, px AS SINGLE, py AS SINGLE")
    a("DIM SHARED saida AS STRING, nativo AS INTEGER")
    a('saida = ENVIRON$("SISTRUT_SAIDA")')
    a('nativo = (ENVIRON$("GFX_NATIVO") <> "")')
    a('OPEN saida + "%s.TXT" FOR OUTPUT AS #9' % nome)
    a("ON ERROR GOTO erro")
    a("DO")
    a("  READ op: k = k + 1")
    a("  SELECT CASE op")
    a("  CASE 0: EXIT DO")
    a("  CASE 1: READ m: RT_SCREEN m")
    a("  CASE 2: READ v, x1, y1, x2, y2, c, b: RT_VIEW v, CINT(x1), CINT(y1), CINT(x2), CINT(y2), c, b")
    a("  CASE 3: READ v, x1, y1, x2, y2: RT_WINDOW v, x1, y1, x2, y2")
    a("  CASE 4: READ v, x1, y1, x2, y2, c, s")
    a("    IF nativo THEN LINHA_NATIVA ELSE RT_LINE x1, y1, x2, y2, v, c, s")
    a("  CASE 5: READ v, x1, y1, c")
    a("    IF nativo THEN PONTO_NATIVO ELSE RT_PSET x1, y1, v, c")
    a("  CASE 6: READ v, x1, y1, r, c, a1, a2, asp")
    a("    IF nativo THEN CIRCULO_NATIVO ELSE RT_CIRCLE x1, y1, r, v, c, a1, a2, asp")
    a("  CASE 7: READ n: DESPEJA n")
    a("  CASE 8: RT_VIEW 0, 0, 0, 0, 0, -1, -1: RT_WINDOW 0, 0, 0, 0, 0: CLS")
    a("  CASE 9: READ x1, y1, x2, y2, px, py")
    a("    IF nativo THEN")
    a("      GET (x1, y1)-(x2, y2), buf(): PUT (px, py), buf(), PSET")
    a("    ELSE")
    a("      RT_GCAIXA x1, y1, x2, y2, 0: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), buf(): RT_GFIM")
    a("      RT_GPONTO px, py, 0: PUT (RG_GX1, RG_GY1), buf(), PSET: RT_GFIM")
    a("    END IF")
    a("  CASE 10: READ x1, n: PRINT #9, k; RT_PMAP!(x1, n)")
    a("  CASE 11: READ v, x1, y1, x2, y2, px, py")
    a("    IF nativo THEN")
    a("      GETPUT_NATIVO")
    a("    ELSE")
    a("      RT_GCAIXA x1, y1, x2, y2, v AND 6: GET (RG_GX1, RG_GY1)-(RG_GX2, RG_GY2), buf(): RT_GFIM")
    a("      RT_GPONTO px, py, (v AND 8) \\ 4: PUT (RG_GX1, RG_GY1), buf(), PSET: RT_GFIM")
    a("    END IF")
    a("  END SELECT")
    a("LOOP")
    a("CLOSE #9")
    a("SYSTEM")
    a("erro:")
    a('PRINT #9, "ERRO"; ERR; "op"; k')
    a("RESUME NEXT")
    for i in range(0, len(ops), 8):
        a("DATA " + ", ".join(ops[i:i + 8]))
    a("")
    a("' Indices de cor da pagina de desenho, linha a linha (sem VIEW/WINDOW).")
    a("SUB DESPEJA (n AS INTEGER)")
    a("    DIM mm AS _MEM, t AS STRING, f AS INTEGER")
    a("    mm = _MEMIMAGE(_DEST)")
    a("    t = SPACE$(_WIDTH(_DEST) * _HEIGHT(_DEST))")
    a("    _MEMGET mm, mm.OFFSET, t")
    a("    _MEMFREE mm")
    a('    f = FREEFILE: OPEN saida + "G" + LTRIM$(STR$(n)) + ".RAW" FOR OUTPUT AS #f: CLOSE #f')
    a('    OPEN saida + "G" + LTRIM$(STR$(n)) + ".RAW" FOR BINARY AS #f: PUT #f, , t: CLOSE #f')
    a("END SUB")
    a("")
    # versoes nativas (comparacao do QB64 sem RT45GFX)
    a("SUB LINHA_NATIVA")
    a("SELECT CASE v")
    for f in sorted(lin_var):
        p1 = ""
        if f & 1:
            p1 = ("STEP" if f & 2 else "") + "(x1, y1)"
        st = "LINE " + p1 + "-" + ("STEP" if f & 4 else "") + "(x2, y2)"
        ex = ["c" if f & 8 else "", "BF" if f & 32 else ("B" if f & 16 else ""), "s" if f & 64 else ""]
        while ex and ex[-1] == "":
            ex.pop()
        if ex:
            st += ", " + ", ".join(ex)
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("END SUB")
    a("SUB PONTO_NATIVO")
    a("SELECT CASE v")
    for f in sorted(pt_var):
        st = ("PRESET " if f & 128 else "PSET ") + ("STEP" if f & 2 else "") + "(x1, y1)"
        if f & 8:
            st += ", c"
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("END SUB")
    a("SUB GETPUT_NATIVO")
    a("SELECT CASE v")
    for f in sorted(gp_var):
        a("CASE %d: GET %s(x1, y1)-%s(x2, y2), buf(): PUT %s(px, py), buf(), PSET" % (f, "STEP" if f & 2 else "", "STEP" if f & 4 else "", "STEP" if f & 8 else ""))
    a("END SELECT")
    a("END SUB")
    a("SUB CIRCULO_NATIVO")
    a("SELECT CASE v")
    for f in sorted(ci_var):
        st = "CIRCLE " + ("STEP" if f & 2 else "") + "(x1, y1), r"
        ex = ["c" if f & 8 else "", "a1" if f & 256 else "", "a2" if f & 512 else "", "asp" if f & 1024 else ""]
        while ex and ex[-1] == "":
            ex.pop()
        if ex:
            st += ", " + ", ".join(ex)
        a("CASE %d: %s" % (f, st))
    a("END SELECT")
    a("END SUB")
    a("")
    a("'$INCLUDE: 'stubs_rt45.bm'")
    a("'$INCLUDE: '../../../src-original/comum/RT45.BM'")
    a("'$INCLUDE: '../../../src-original/comum/RT45GFX.BM'")
    return "\r\n".join(L) + "\r\n"


if __name__ == "__main__":
    # uso: gera_sonda.py <pasta .dados> <BAS QB64> <NOME> <modo> <cenas separadas por virgula>
    dados, bas64, nome, modo = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
    quais = [int(x) for x in sys.argv[5].split(",")]
    cenas(modo, 100 if modo == 2 else 200, [k for k in quais if k <= 13])
    if any(k > 13 for k in quais):
        cenas2(modo, 100 if modo == 2 else 200, [k for k in quais if k > 13])
    op(0)
    with open(dados + "/" + nome + ".BAS", "w", newline="") as f:
        f.write(gera_qb45(nome))
    with open(bas64, "w", newline="") as f:
        f.write(gera_qb64(nome))
    print(nome, len(ops), "operacoes;", sum(len(o) for o in ops), "bytes de DATA")
