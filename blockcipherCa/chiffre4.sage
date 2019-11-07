def cround(m,k):
    m1, m2, m3, m4 = string2b(m)
    k1, k2, k3, k4 = string2b(k)
    t1 = S(k1+m1)
    t2 = S(k2+m2)
    t3 = S(k3+m3)
    t4 = S(k4+m4)
    return b2string(t1,t2,t3,t4)

def perm(x):
    t1, t2, t3, t4 = string2b(x)
    r1 = B([0,0,0,0])
    r2 = B([0,0,0,0])
    r3 = B([0,0,0,0])
    r4 = B([0,0,0,0])

    r4[3] = t1[0]
    r4[2] = t2[0]
    r4[1] = t3[0]
    r4[0] = t4[0]

    r3[3] = t1[1]
    r3[2] = t2[1]
    r3[1] = t3[1]
    r3[0] = t4[1]

    r2[3] = t1[2]
    r2[2] = t2[2]
    r2[1] = t3[2]
    r2[0] = t4[2]

    r1[3] = t1[3]
    r1[2] = t2[3]
    r1[1] = t3[3]
    r1[0] = t4[3]

    return b2string(r1, r2, r3, r4)



def lastkey(m, k):
    return addb(m,k)

