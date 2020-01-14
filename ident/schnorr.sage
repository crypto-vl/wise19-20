p = 283
q = 47
t = 5
alphaI = primitive_root(p)
R = IntegerModRing(p)
alpha = R(alphaI)
g = alpha^((p-1)/q)
a = 35
v = g^(-a)

def response(challenge):
    k = ZZ.random_element(0,q) 
    gamma = g^k
    y = Mod(k + a*challenge, q)
    return gamma, y


def bob(gamma, y,challenge):
    return gamma == g^y * v^challenge


