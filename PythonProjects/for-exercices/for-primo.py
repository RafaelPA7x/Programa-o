from operator import inv

n = int(input("Digite um número inteiro: "))
i = 0
p = True
for i in range(2, n, 1):
    if n % i == 0:
        p = False
if p == True:
    print("Primo")
else:
    print("Não primo")