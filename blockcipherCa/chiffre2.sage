def enc2(m, k1, k2, k3):
    u = m + k1
    v = S(u)
    w = v + k2
    x = S(w)
    c = x + k3
    return u, v, w, x, c

def sbox_stat(x):
    for y in B:
        print(b2nh(y), b2nh(x+y), b2nh(S(y) + S(x+y)))

def S_stat(n):
    for ib in B:
        f = n2b(n)
        jb = ib+f
        print('i={}, j={}, S(i)+S(j)={}'.format(b2nh(ib), hex(int(b2n(jb))), hex(int(b2n(S(ib)+S(jb))))))

def attack2(k1, k2, k3, delta, diff):
    '''
    For every message block m, encrypt m and m + delta to c1 and c2.
    For every key k3, compute w1 and w2.
    If w1 + w2 == diff, k3 is a candidate for the correct
    key, because diff is very likely to occur as
    output difference of S.
    '''
    stat = [0 for i in range(16)]

    for m in B:
        _,v1,_,_,c1 = enc2(m, k1, k2, k3)
        _,v2,_,_,c2 = enc2(m+delta, k1, k2, k3)

        for k in B:
            w1 = Sinv(k+c1)
            w2 = Sinv(k+c2)
            if w1+w2 == diff:
                stat[b2n(k)]+=1
    return stat, b2nh(n2b(stat.index(max(stat))))
