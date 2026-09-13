texto = "estamos APRENDENDO ascii"
convertido = ""

for caracter in texto:
    ascii = ord(caracter)
    if ord("A") <= ascii <= ord("Z"):
        ascii += 32
    elif ord("a") <= ascii <= ord("z"):
        ascii -= 32
    convertido += chr(ascii)
print(texto)
print(convertido)
texto = ""
texto = texto.lower()
print(texto)