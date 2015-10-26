import Image
im = Image.open("7.png")

data = []
for p in list(im.getdata()):
    if p[0] == p[1] == p[2]:
        data.append( chr(p[0]) )

print ''.join(data[0:-1:7])

message = [105, 110, 116, 101, 103, 114, 105, 116, 121]
print ''.join( chr(x) for x in message )

#integrity
