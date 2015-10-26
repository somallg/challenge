data = open("12.gfx").read()
[ open("12_f%d.dat" %i, "w").write( data[i::5] ) for i in range(5) ]

# disproportional
