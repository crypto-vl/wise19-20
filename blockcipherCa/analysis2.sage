k1 = n2b(11)
k2 = n2b(3)
k3 = n2b(9)

delta = n2b(15)
diff = n2b(13)

encd = {}
encinvd = {}

for m in B:
    _, _, _, _, c = enc2(m, k1, k2, k3)
    encd[b2n(m)] = b2n(c)
    encinvd[b2n(c)] = b2n(m)

def guesswork(k, ca, cb):
    x1 = ca + k
    x2 = cb + k
    w1 = Sinv(x1)
    w2 = Sinv(x2)
    print('k={0:x}: w1={1:x},w2={2:x},wd={3:x},x1={4:x},x2={5:x},xd={6:x}'
          .format(b2n(k),b2n(w1),b2n(w2),b2n(w1+w2),b2n(x1),b2n(x2),b2n(x1+x2) ))

def run():
    for m1 in B:
        m2 = m1 + delta
        u1, v1, w1, x1, c1 = enc2(m1, k1, k2, k3)
        u2, v2, w2, x2, c2 = enc2(m2, k1, k2, k3)
        print('m1={0:x},m2={1:x},u1={2:x},u2={3:x},ud={4:x},v1={5:x},v2={6:x},vd={7:x},w1={8:x},w2={9:x},wd={10:x},x1={11:x},x2={12:x},xd={13:x},c1={14:x},c2={15:x}'
              .format(b2n(m1),b2n(m2),b2n(u1),b2n(u2),b2n(u1+u2),b2n(v1),b2n(v2),b2n(v1+v2),
                      b2n(w1),b2n(w2),b2n(w1+w2),b2n(x1),b2n(x2),b2n(x1+x2),b2n(c1),b2n(c2)))
        for k in B:
            guesswork(k,c1,c2)
    


def delta_out(m,k):
    _, _, _, _, c1 = enc2(m, k1, k2, k)
    _, _, _, _, c2 = enc2(m+delta, k1, k2, k)
    print('m={0:x}, k={1:x}, delta_c={2:x}'.format(b2n(m), b2n(k), b2n(c1+c2)))
