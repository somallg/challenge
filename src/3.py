import re
text = ''.join( [ line.rstrip() for line in open('3.data') ] )
m = re.findall('[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]', text )
print ''.join(m)

