def z(n):
    count = 0
    while n >= 5:
        count += n / 5
        n /= 5

    return count


def main():
    t = input()
    for i in range(t):
        n = input()
        print z(n)


main()
