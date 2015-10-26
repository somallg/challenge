x = range(65,123)
for a1 in x:
    for a2 in x:
        for a3 in x:
            for a4 in x:
                for a5 in x:
                    if a1 * 3 + a2 * 4 + a3 * 5 + a4 * 6 + a5 * 7 == 2308:
                        print ''.join(map(chr, [a1, a2, a3, a4, a5]))
