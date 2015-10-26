txt = 'e5534adac53023aaad55518ac42671f8a1471d94d8676ce1b11309c1c27a64b1ae1f4a91c73f2bfce74c5e8e826c27e1f74c4f8081296ff3ee4519968a6570e2aa0709c2c4687eece44a1589903e79ece75117cec73864eebe57119c9e367fefe9530dc1'

tab = [int(txt[i:i+2], 16) for i in xrange(2, len(txt), 2)]

key = [tab[i:i+4] for i in xrange(0, len(txt), 4)]

index = 0
s = ''
for i in xrange(4, len(tab) - 4, 4):
	k = key[index]
	for j in xrange(4):
		s += chr(tab[i+j] ^ k[j])
	index += 1

print s

