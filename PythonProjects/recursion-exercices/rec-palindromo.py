texto = "arara"

def palindromo(texto):
    texto2 = ""

    for i in range(len(texto) - 1, -1, -1):
        texto2 += texto[i]

    return texto2 == texto

print(palindromo(texto))
