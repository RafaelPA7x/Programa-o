nota1 = float(input("Digite sua primeira nota: "))
nota2 = float(input("Digite sua segunda nota: "))
nota3 = float(input("Digite sua terceira nota: "))

media = (nota1 + nota2 + nota3) / 3
if media <= 10.0 and media >= 9.0:
    clas = ("a")
    print("A")
elif media >= 7.5:
    clas = ("b")
    print("B")
elif media >= 6.0:
    clas = ("c")
    print("C")
elif media >= 4.0:
    clas = ("d")
    print("D")
elif media >= 0:
    clas = ("e")
    print("E")
elif media < 0:
    print("Inválido")
if clas == "c" or clas == "d" or clas == "e":
    print("Reprovado")
else:
    print("Aprovado")