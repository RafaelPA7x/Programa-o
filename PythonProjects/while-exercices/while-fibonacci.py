cont = 2
a = 0
b = 1
n = 7

print(a, b)

while cont <= n:
    c = a + b
    print(c)
    a, b = b, c
    cont += 1