R = "Recomendar o filme"
N = "Não recomendar o filme"
G = input("O filme é de um gênero preferido do usuário?(S/N) ").strip().upper()
A = input("O filme possúi avaliação alta?(S/N) ").strip().upper()
P = input("O film é popular?(S/N) ").strip().upper()
J = input("O usuário já assistiu o filme?(S/N) ").strip().upper()

if A == "S" and J == "N" and (P == "S" or G == "S"):
    print(R)
else:
    print(N)
