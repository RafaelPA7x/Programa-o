n = 1206

def tem_zero(n):
    if n == 0:
        return True

    if n < 10:
        return False

    if n % 10 == 0:
        return True

    return tem_zero(n // 10)

print(tem_zero(n))
