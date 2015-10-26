def main():
    n = int(raw_input())  # number of test case
    for i in xrange(n):
        nr = int(raw_input())  # number of rows
        m = []  # matrice
        for i in xrange(nr):
            m.append(map(int, raw_input().split()))

        for i in xrange(len(m) - 2, -1, -1):
            for j in xrange(len(m[i])):
                if m[i + 1][j] > m[i + 1][j + 1]:
                    m[i][j] += m[i + 1][j]
                else:
                    m[i][j] += m[i + 1][j + 1]

        print m[0][0]


main()

            

