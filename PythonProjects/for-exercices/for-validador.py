ma = 0
num = 0
esp = 0

senha = input("Digite uma senha")

tam = len(senha)
if (tam < 8):
    print("Sua senha deve ter ao menos 8 caracteres")

for i in range(0, tam):
    c = senha[i]
    nc = ord(c)
    if (nc >= 65 and nc <= 90):
        ma += 1
    elif (nc >= 48 and nc <= 57):
        num += 1
    elif (not(nc >= 97 and nc <= 122)):
        esp += 1
    if(esp >= 2 and ma >= 2 and num >= 2):
        print("Senha Resgistrada")
