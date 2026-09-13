nas = float(input("Digite o ano que você nasceu: "))
ano = int(input("Digite o ano atual: "))
idade = ano - nas

if idade >= 16:
    print("Você pode votar")
else:
    resto = 16 - idade
    resto = int(resto)
    print(f"faltam {resto} anos para você poder votar")