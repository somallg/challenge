# Paste x here #
x = [1, 2, 3]
y = 0
for p in x:
    if p % 2 == 0:
        r = p - 1
        r = r * 3
        y = y + r
    else:
        r = p * 2
        y = y + r


print y


