p1 = input("Digite um nome: ")
t1 = len(p1)
i1 = int(input("Digite a idade: "))
p2 = input("Digite outro nome: ")
t2 = len(p2)
i2 = int(input("Digite a idade: "))
if t1 > t2:
    print(f"{p1} é maior que {p2}")
else:
    print(f"{p2} é maior que {p1}")
if i1 > i2:
    print(f"{p1} é mais velho que {p2}")
else:
    print(f"{p2} é mais velho que {p1}")