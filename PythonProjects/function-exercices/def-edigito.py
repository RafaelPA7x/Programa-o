c = "9"
def isdigit(c):
    tf = False
    for i in c:
        codigo = ord(c)
        if ord('0') <= codigo <= ord('9'):
            tf = True
    return tf
print(isdigit(c))