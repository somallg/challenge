import zipfile,re
idx="90052"
file = zipfile.ZipFile("6.zip", "r")
history = []
while True:
	history.append(idx)
	data = file.read(idx + ".txt")
	print "File", idx + ":\t" + data
	idx = "".join(re.findall('[0-9.]', data))
	if len(idx) == 1:
		break

print ''.join([file.getinfo(i + '.txt').comment for i in history])

# oxygen
