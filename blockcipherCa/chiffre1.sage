def enc1(m, k1, k2):
    u = m + k1
    v = S(u)
    e = v + k2
    return u, v, e

def candidate1(k1, k2, m1, m2):
    u1, v1, c1 = enc1(m1, k1, k2)
    u2, v2, c2 = enc1(m2, k1, k2)
    for k in B:
        v11 = c1 + k
        v22 = c2 + k
        u11 = Sinv(v11)
        u22 = Sinv(v22)
        if u11 + u22 == m1 + m2:
            print('candidate for k2: ' + b2nh(k))
