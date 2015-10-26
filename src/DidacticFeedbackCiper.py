txt = '751a6f1d3d5c3241365321016c05620a7e5e34413246660461412e5a2e412c49254a24'
tab = [int(txt[i:i+2], 16) for i in xrange(2, len(txt), 2)]
k = int('75', 16)
s = [chr(tab[i] ^ tab[i+1]) for i in xrange(0, len(tab) - 1)]
print "".join(s)
