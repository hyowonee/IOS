numDicts = dict()
alphabets = input().upper()
maxNum = -1
maxKey = ""
for alphabet in alphabets :
    if alphabet in numDicts:
        numDicts[alphabet] += 1    
    else:
        numDicts[alphabet] = 1
for key, value in numDicts.items():
    if value > maxNum:
        maxNum = value
        maxKey = key
    elif value == maxNum:
        maxKey = "?"
print(maxKey)