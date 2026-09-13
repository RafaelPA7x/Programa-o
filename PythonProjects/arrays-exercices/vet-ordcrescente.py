arr = [5,1,3,4,2]
n = len(arr)
for i in range(n-1):
    min = i
    for j in range(i+1,n):
        if arr[j] < arr[min]:
            min = j

    tmp = arr[i]
    arr[i] = arr[min]
    arr[min] = tmp

print(arr)