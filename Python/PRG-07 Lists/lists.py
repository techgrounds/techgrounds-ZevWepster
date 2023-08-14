#Exercise 1

names = ["Kaman", "Sinan", "Jeroen", "Jordan", "Zev"]
for x in names:
    print(x)

#Exercise 2

numbers = [12, 56, 16, 25, 10]
print(numbers)

list_lenght = len(numbers)

for i in range(list_lenght):
    curr_item = numbers[i]
    next_item = numbers[(i + 1) % list_lenght]

    
    result = curr_item + next_item
    
    print(result)