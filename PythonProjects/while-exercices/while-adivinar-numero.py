import random
num = random.randint(1, 100)
print(num)
num_usr = -1
count = 0

while num_usr != num and count <= 5:
    num_usr = int(input("Digite um numero inteiro qualquer: "))
    diff = abs(num_usr - num)
    if diff < 10:
        print("Quente.")
    elif diff < 30:
        print("Morno.")
    else:
        print("Frio.")
    if num_usr < num:
        print("O número é maior.")
    else:
        print("O número é menor")
    count += 1

if count <= 5:
    print(f"você acertou em {count} tentativas")
else:
    print("Máximo de tentativas alcançdas")