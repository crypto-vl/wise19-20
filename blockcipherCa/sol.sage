def dd(x,D):
    xb = n2b(x)
    Db = n2b(D)
    return S(xb) + S(xb + Db)

def stat():
    m = matrix(16)
    for D in range(16):
    	for x in range(16):
	    y = b2n(dd(x,D))
            m[D,y]+=1
    return m
