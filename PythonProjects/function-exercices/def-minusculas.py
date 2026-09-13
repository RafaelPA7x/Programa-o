texto = "CONVERTER PARA MINUSCULAS"
def lower_(texto):
    textomin = ""
    for c in texto:
        codigo = ord(c)
        if ord('A') <= codigo <= ord('Z'):
            textomin += chr(codigo + 32)
        else:
            textomin += c
    return textomin
print(lower_(texto))