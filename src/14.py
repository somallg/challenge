# 100 * 100 = (100 + 99 + 99 + 98) + ....
def seq(n):
    yield n
    while n > 1:
        n -= 1
        yield n
        yield n

test = [ i for i in seq(100) ]

count = 0
for i in seq(100):
    for j in range(i):
        count += 1

print count

