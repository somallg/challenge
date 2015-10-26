def count(n):
    # A B C D E F G H I J K L M N O P I Q R S T U V W X Y Z
    count = 0
    for i in n:
        if i in ["A", "D", "O", "P", "Q", "R"]:
            count += 1
        elif i == "B":
            count += 2
        else:
            continue
    return count


def main():
    t = input()
    for i in range(t):
        s = list(raw_input())  # important #
        print count(s)


main()
