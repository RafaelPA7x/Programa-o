rpositivas = 0
r1 = input("Telefonou para a vítima?[S/N]: ")
if r1 == "S" or r1 == "s":
    rpositivas += 1
r2 = input("Esteve no local do crime? [S/N]: ")
if r2 == "S" or r2 == "s":
    rpositivas += 1
r3 = input("Mora perto da vítima? [S/N]: ")
if r3 == "S" or r3 == "s":
    rpositivas += 1
r4 = input("Tinha alguma dívida com a vítima? [S/N]: ")
if r4 == "S" or r4 == "s":
    rpositivas += 1
r5 = input("Já trabalhou com a vítima? [S/N]: ")
if r5 == "S" or r5 == "s":
    rpositivas += 1

if rpositivas == 2:
    print("Suspeito")
elif rpositivas == 3 or rpositivas == 4:
    print("Cúmplice")
elif rpositivas == 5:
    print("Assassino")
else:
    print("Inocente")
