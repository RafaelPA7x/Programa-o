n = int(input("Digite um número inteiro: "))

primo = True
if n % 2 == 0:
    primo = False
    print(f"{n} não é primo")

else:
    for i in range(2, n, 1):
        if n % i == 0 :
            primo = False
            break
    if primo:
        print(f"{n} é um número primo")
    else:
        print(f"{n} não é primo")

#divisiveis
n = int(input("Digite um número inteiro:"))

for i in range(2, 10):
    if n % i == 0:
        print(i)


#tabuada
j = int(input("Digite um número inteiro:"))
t = 0
for i in range(1, 11):
    t = j * i
    print(t)
