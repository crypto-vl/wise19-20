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
