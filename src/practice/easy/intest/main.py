import sys

n, k = [int(i) for i in raw_input().split(" ")]
count = 0
for i in sys.stdin:
    if int(i) % k == 0:
        count += 1

print count
