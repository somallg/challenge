s = ''.join( [ line.rstrip() for line in open('2.data') ] )
OCC = {}
for c in s:
    OCC[c] = OCC.get(c, 0) + 1

avgOCC = len(s) // len(OCC)
print ''.join( [ c for c in s if OCC[c] < avgOCC ] )

# equality
