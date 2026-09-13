texto = "converter para maiuscuLa"
def upper_(texto):
    textomax = ''
    for c in texto:
        codigo = ord(c)
        if ord('a') <= codigo <= ord('z'):
            textomax += chr(codigo - 32)
        else:
            textomax += c
    return textomax
print(upper_(texto))