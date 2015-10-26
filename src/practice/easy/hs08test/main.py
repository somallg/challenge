i = raw_input().split(' ')
x = float(i[0])
y = float(i[1])

if x % 5 != 0 or y - x < 0.5:
    res = y
else:
    res = y - 0.5 - x

print "%.2f" % res
