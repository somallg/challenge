def look_and_say(member):
    while True:
        yield member
        breakpoints = ( [0] + [ i for i in range(1, len(member) )
                                if member[i - 1] != member[i] ]
                        + [ len(member) ] )

        groups = [member[breakpoints[i - 1]:breakpoints[i]]
                  for i in range(1, len(breakpoints))]
        
        member = ''.join(str(len(group)) + group[0] for group in groups)


sequence = look_and_say("1")
for i in range(31):
    n = sequence.next()
    print n
    print len(n)

# 5808
