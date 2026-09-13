n = int(input("Digite um número inteiro: "))
f = 1
for i in range(n, 1, -1):
    f *= i
print(f)