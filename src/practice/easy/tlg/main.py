import sys


def main():
    m = 0
    diff = 0
    p = 0

    for i in xrange(int(sys.stdin.readline())):
        score = map(int, sys.stdin.readline().split())
        diff += score[0] - score[1]
        if abs(diff) > abs(m):
            m = diff

    if m > 0:
        p = 1
    else:
        p = 2

    print str(p), str(abs(m))


main()
