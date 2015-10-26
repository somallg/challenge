txt = "31cf55aa0c91fb6fcb33f34793fe00c72ebc4c88fd57dc6ba71e71b759d83588"

tab = [int(txt[i:i+2], 16) for i in xrange(2, len(txt), 2)]

for x in xrange(256):
	for b in xrange(256):
		s = ""
		for i in tab:
			if 31 < (i ^ b) < 127:
				s += chr(i ^ b)
			b = (b + x) % 256
		if len(s) == len(tab):
			print s
