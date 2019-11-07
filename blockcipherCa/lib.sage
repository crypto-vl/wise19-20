b_len=4

B = VectorSpace(GF(2),b_len)

Sb = [6, 4, 0xc, 5, 0, 7, 2, 0xe, 1, 0xf, 3, 0xd, 8, 0xa, 9, 0xb]
Rb = [4, 8, 6, 0xa, 1, 3, 0, 5, 0xc, 0xe, 0xd, 0xf, 2, 0xb, 7, 9] # inv of S

def n2b(x):
    '''
    Transform an integer x0 + 2 x1+ 4 x2 + 8 x3 into the element
    (x0, x1, x2, x3) of B.
    '''
    xL = Integer(x).bits()
    for i in range(b_len - len(xL)):
        xL.append(0)
    return B(xL)

def b2n(b):
    '''
    Transform an element of b into an integer.
    (x0, x1, x2, x3) is mapped to x0 + 2 x1+ 4 x2 + 8 x3
    '''
    return Integer(b.list(), 2)

def b2nh(b):
    return (Integer(b.list(), 2)).hex()

def S(b):
    return n2b(Sb[b2n(b)])

def Sinv(b):
    return n2b(Rb[b2n(b)])

def string2b(s):
    '''
    Take a string of four hexadecimal characters and return them as
    four elements of B
    '''
    return n2b(int(s[0],16)), n2b(int(s[1],16)), n2b(int(s[2],16)),
    n2b(int(s[3],16))

def b2string(b1, b2, b3, b4):
    '''
    Take four elements of B and return them as a hexadecimal string
    '''
    return b2nh(b1)+ b2nh(b2) + b2nh(b3) + b2nh(b4)

def addb(s,t):
    s1, s2, s3, s4 = string2b(s)
    t1, t2, t3, t4 = string2b(t)
    return b2string(s1+t1, s2+t2, s3+t3, s4+t4)

def StatS():
    cnt = matrix(16)
    for f in B:
        nf= b2n(f)
        for x in B:
            t = S(x) + S(x+f)
            nt = b2n(t)
            cnt[nt,nf] = cnt[nt,nf]+1
    return cnt
        
