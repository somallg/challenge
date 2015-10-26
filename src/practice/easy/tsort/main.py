import sys


def main():
    t = int(raw_input())
    l = []
    for i in sys.stdin:
        l.append(int(i))
    l.sort()
    print "\n".join(map(str, l))


main()
