p = next_prime(5555)
q = 3

def enc(m,pk):
    return m + 2*randint(1,11) + pk

def dec(c,sk):
    return mod(mod(c,pk),2)

pk = p*q
sk = p

m1 = 1
m2 = 0

c1 = enc(m1,pk)
c2 = enc(m2,pk)

# Server rechnet
s1 = c1 + c2
s2 = c1*c2

# Client
dec(s1,sk) == m1 + m2
dec(s2,sk) == m1*m2
