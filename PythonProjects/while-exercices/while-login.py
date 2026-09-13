import time
user = "rafael1"
senha = "1234"
contador = 0

us = input("Usuario: ")
sen = input("Senha: ")


while (us != user and sen != senha):
    print("Usuário ou Senha incorretos.")
    um = input("Usuario: ")
    sen = input("Senha: ")
    contador += 1
    ct = 2 ** contador
    print(f"Aguarde por {ct} segundos")
    t1 = time.time()
    time.sleep(2 ** contador)
    t2 = time.time()

    if contador == 5:
        print("Tente novamente em 30 minutos.")
        time.sleep(30 * 60)

print("Acesso")


