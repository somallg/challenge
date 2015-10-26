####
f = open('flatfile.txt', 'r')

s      = 0
n      = 0
name   = ""
salary = 0

for line in f:
	line = line.strip()
	l = line.split('|', 3)
	if l[0] == "15879042": 
		print l
		name  = l[1]
		salary = int(l[2])
	s += int(l[2])
	n += 1

print name + str(salary) + str(s/float(n))



