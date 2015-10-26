x = 42
x = x**99999
x = [i for i in str(x)]

while len(x) > 9:
    x = x[1::2]

print "".join(x)

# 850675375 #

