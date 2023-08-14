# range is 0-9 because the range starts at 0 and therefor counts 10numbers up including 0.

for i in range(10):
    print(i)



# If i want 1 -10 i could use this
for i in range (1,11):
    print(i)


# and now for the last part of the assignment, to multiply it by 5 you can add 5 after the specified range.

x = 5

for i in range (10):
    print(x*i)

# A way of adding a number (to 50 in this case) is by doing it like this
for i in range(0, 55, 5):
     print(i)


