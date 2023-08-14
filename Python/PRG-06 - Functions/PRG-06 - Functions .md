**PRG-06 - Functions **
===
**Key-terms**
---





**Opdracht**
---
**Exercise 1:**
- Create a new script.
- Import the random package.
- Print 5 random integers with a value between 0 and 100.

Code used:

    import random

    for amount in range(5):
        random_int = random.randint(0, 100)
        print(random_int)    

**Exercise 2:**
- Create a new script.
- Write a custom function myfunction() that prints “Hello, world!” to the terminal. 
- Call myfunction.
- Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.

Code used:

        def my_func(fname):
    print("Hello, " + fname)
          
    my_func("Zev")

Exercise 3:
- Create a new script.
- Copy the code below into your script.

def avg():

	# write your code here

# you are not allowed to edit any code below here

x = 128

y = 255

z = avg(x,y)

print("The average of",x,"and",y,"is",z)

- Write the custom function avg() so that it returns the average of the given parameters. You are not allowed to edit any code below the second comment.

Code used:
   
    def avg(x, y):
        return (x + y)/2

    x = 128
    y = 255
    z = avg(x,y)
    print("The average of",x,"and",y,"is",z)


*Gebruikte bronnen*

[3wschools](https://www.w3schools.com/python/python_functions.asp)

*Ervaren problemen*
---
Geen ervaren problemen.

*Resultaat!*
---

