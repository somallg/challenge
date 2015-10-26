txt = '310a7718781f734c31425e775a314f3b40132c5122720599b2dfb790fd8ff894add2a4bdc5d1a6e987a0ed8eee94adcfbb94ee88f382127819623a404d3f'
tab = [int(txt[i:i+2], 16) for i in xrange(0, len(txt), 2)]

#s = [chr(tab[i] ^ tab[i+1]) for i in xrange(0, len(tab) - 1)]
#print ''.join(s)
for x in xrange(256):
	#for i in xrange(1, len(tab) - 1):
	#	k = ((tab[i - 1] + x) % 256) ^ tab[i]
	s = [chr(((tab[i-1] + x) % 256) ^ tab[i]) for i in xrange(1, len(tab))]
	print "".join(s)
