txt = "8776459cf37d459fbb7b5ecfbb7f5fcfb23e478aaa3e4389f378439aa13e4e96a77b5fc1f358439df36a4486a03e4381b63e5580a66c0c8ebd6d5b8aa13e459cf34e4d9fa67f02cf90714288a17f589abf7f5886bc705fcfbc700c96bc6b5ecfb7775f8cbc68499daa3f"
def checkKey(tab):
	res = []
	for k in xrange(256):
		s = ""
		for i in tab:
			if 31 < (i ^ k) < 127:
				s += chr(i ^ k)
				continue
			break
		if len(s) == len(tab):
			res.append(s)
	return res

def fuse(str1, str2, str3, str4):
	s = ""
	for i in xrange(min(len(str1), len(str2), len(str3), len(str4))):
		s += ''.join([str1[i], str2[i], str3[i], str4[i]])
	return s

tab = [int(txt[i:i+2], 16) for i in xrange(2, len(txt), 2)]
tab0 = checkKey([tab[i] for i in xrange(0, len(tab), 4)])
tab1 = checkKey([tab[i] for i in xrange(1, len(tab), 4)])
tab2 = checkKey([tab[i] for i in xrange(2, len(tab), 4)])
tab3 = checkKey([tab[i] for i in xrange(3, len(tab), 4)])

print fuse(tab0[-2], tab1[7], tab2[-9], tab3[-8])



