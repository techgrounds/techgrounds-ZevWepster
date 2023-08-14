#Exercise 1
import random

for amount in range(5):
    random_int = random.randint(0, 100)
    print(random_int)

#Exercise 2

def my_func(fname):
    print("Hello, " + fname)
          
my_func("Zev")

#Exercise 3

def avg(x, y):
   return (x + y)/2

x = 128
y = 255
z = avg(x,y)
print("The average of",x,"and",y,"is",z)