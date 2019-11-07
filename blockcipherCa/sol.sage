def stat():
    m = matrix(16)
    for D in range(16):
        for y in range(16):
            # dd(x) = y dann m[D,y]+1
            for x in range(16):
                if b2n(dd(x,D)) == y:
                    m[D,y]+=1
    return m
