import binascii

f = open('nekhbet', 'rb')
h = []
i = 1
try:
    byte = f.read(1)
    while byte != "":
        if i % 2 != 0:
            h.append(byte)
        byte = f.read(1)
        i += 1
finally:
    f.close

i = 0
res = 0
while i < len(h):
    res += ord(h[i]) * ord(h[i+1])
    i += 2

print res

