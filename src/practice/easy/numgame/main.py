import sys


def main():
    raw_input()
    for i in sys.stdin:

        if int(i) & 1:
            print "BOB"
        else:
            print "ALICE"


main()
