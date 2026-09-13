n = 2236

def pares(n):
    if n == 0:
        return True

    if n % 10 % 2 != 0:
        return False

    return pares(n // 10)

print(pares(n))
