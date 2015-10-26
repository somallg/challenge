import sys


def main():
    raw_input()
    for i in sys.stdin:
        s = ""
        op = []

        for j in i:
            if 'a' <= j <= 'z':
                s += j
            elif j == ')':
                s += op.pop()
            elif j != '(':
                op.append(j)
        print s


main()
