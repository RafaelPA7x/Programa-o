print("Pedra = 1")
print("Papel = 2")
print("Tesoura = 3")

n1 = input("Nome do Jogador um: ")
n2 = input("Nome do Jogador dois: ")
j1 = int(input(f"vez de {n1}: "))
j2 = int(input(f"vez de {n2}: "))

if j1 == 1 and j2 != 1:
    if j2 == 3:
        print(f" {n1} venceu")
    else:
        print(f"{n2} venceu")
elif j1 == 2 and j2 != 2:
    if j2 == 3:
        print(f"{n2} venceu")
    else:
        print(f"{n1} venceu")
elif j1 == 3 and j2 != 3:
    if j2 == 1:
        print(f"{n2} venceu")
    else:
        print(f"{n1} venceu")
else:
    print("Empate")