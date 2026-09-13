import random

n = 4
def p(n):
    if n == -1:
        return
    p(n - 1)
    print(n)

p(n)