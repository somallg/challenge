import urllib

for line in urllib.urlopen('http://www.wechall.net/challenge/training/get_sourced/index.php'):
	if "password:" in line:
		print line

