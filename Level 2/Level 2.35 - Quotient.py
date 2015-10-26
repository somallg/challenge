import itertools
from sets import Set

p = itertools.permutations( '0123456789', 10 )

# A D E G I O R T U Y
# 0 1 2 3 4 5 6 7 8 9
for i in p:
    if i[3] == '0' or i[7] == '0' or i[1] == '0':
        continue
    grea  = int(''.join([i[3], i[6], i[2], i[0]]))
    tyou  = int(''.join([i[7], i[9], i[5], i[8]]))
    didit = int(''.join([i[1], i[4], i[1], i[4], i[7]]))

    if ( grea + tyou == didit ) :
        print "  ", grea
        print "+ ", tyou
        print "---------"
        print didit
        print "---------"
        print "".join(i)
        print "---------"


