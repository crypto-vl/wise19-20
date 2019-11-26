

def lsb(x):
    if x.is_square():
        y = x.sqrt()
        return Integer(y).bits()[0]


def appl(yy, N):
    Zn = IntegerModRing(N)
    half = Zn(1/2)
    a0 = Zn(7)
    uu = 1/7
    y = Zn(yy)
    for k in range(N):
        a0 = a0*half
        uu = (uu + lsb(a0^2*y))/2
        print(a0, uu*N, Zn(uu*N))
