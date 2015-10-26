import pickle

banner = pickle.load(open('5.p', 'r'))
data = []
for item in banner:
	for seq in item:
		data.append(seq[0]*seq[1])
	data.append('\n');

print "".join(data)

# channel.html
