p = 283
q = 47
t = 5
alphaI = primitive_root(p)
R = IntegerModRing(p)
alpha = R(alphaI)
g = alpha^((p-1)/q)
a = 35
v = g^(-a)

def find_example(e):
    v1 = v^e
    l = -1
    for i in range(q):
        if g^i == v1:
            l = i
            break
    y1 = ZZ.random_element(0,q)
    r1 = ZZ.random_element(0,q)
    y2 = (y1-l)%p
    r2 = (e+r1)%p
    return y1, y2, r1, r2
