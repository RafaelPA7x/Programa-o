joao = 0
carlos = 0
valor = True
print("Escolha o canididato qeu deseja votar")
print("28765 - João da Silva")
print("32928 - Carlos Alberto")
print("Digite ENCERRAR para finalizar o processo de votação")
print("Digite RESULTADO para ver o rsultado parcial da votação")
voto = input()
while valor == True:
    if voto == "28765":
        print("Voto realizado para Joao da Silva")
        joao += 1
        voto = input()
    elif voto == "32928":
        print("Voto realizado para Carlos Alberto")
        carlos += 1
        voto = input()
    elif voto == "ENCERRAR":
        valor = False
    elif voto == "RESULTADO":
        print(f"João da Silva obteve {joao} voto(s)")
        print(f"Carlos Alberto obteve {carlos} voto(s)")
        voto = input()
    else:
        print("Digite algo válido")
        voto = input()

print("RESULTADO FINAL")
if joao > carlos:
    print(f"João da Silva foi eleito com {joao} voto(s)")
elif carlos > joao:
    print(f"Caros Alberto foi eleito com {carlos} voto(s)")
else:
    print(f"Houve um empate. ambos com {joao} voto(s)")


