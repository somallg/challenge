import pickle

p = pickle.load(open('data.p', 'r'))
data = []
for i in p:
	for seq in i:
		data.append(seq[0] * seq[1])
	data.append('\n')

print "".join(data)
