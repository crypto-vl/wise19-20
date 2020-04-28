def linConGen(m, a, c, x0, n):
    '''A linear congruential sequence generator.
    
    Param m is the integer modulus to use in the generator.
    Param a is the integer multiplier.
    Param c is the integer increment.
    Param x0 is the integer seed.
    Param n is the integer number of desired pseudo-random numbers.
    
    Returns a list of n pseudo-random integer modulo m numbers.'''
    
    x = x0 # the seed
    retValue = [Mod(lift(Mod(x,m)),2)]  # start the list with x=x0
    for i in range(2, n+1, 1):
        x = mod(a * x + c, m) # the generator, using modular arithmetic
        retValue.append(mod(lift(x),2)) # append the new x to the list
    return retValue

def lcg53(x0):
    return linConGen(31,3,5,x0,10)

def l2n(lst):
    return Integer(lst,2)


def statistik():
    stat={}
    for s in range(31):
        t = lcg53(s)
        if t[8] == t[9]:
            continue
        tn = l2n(t)
        if tn in stat.keys():
            stat[tn]+=1
        else:
            stat[tn]=1
    return stat


