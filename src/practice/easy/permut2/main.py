import sys


def checkp(p):
    for i in xrange(len(p)):
        if i + 1 != p[p[i] - 1]:
            return "not ambiguous"
    return "ambiguous"


def main():
    while True:
        n = int(sys.stdin.readline())
        if n == 0:
            break
        p = map(int, sys.stdin.readline().split())
        print checkp(p)


main()

            

