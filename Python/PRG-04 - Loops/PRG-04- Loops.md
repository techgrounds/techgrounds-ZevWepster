**PRG-04 - Loops **
===
**Key-terms**
---
**Loop**: A loop is a control structure that allows you to repeatedly execute a block of code. It helps automate tasks that need to be performed multiple times.

**Iteration**: Each individual execution of a loop is called an iteration. The loop continues to iterate until a specified condition is met.

**For Loop**: A for loop is used to iterate over a sequence (such as a list, tuple, or string) and execute a block of code for each item in the sequence.

**While Loop**: A while loop is used to repeatedly execute a block of code as long as a specified condition remains true.

**Loop Control Statements**: These are statements that control the flow of execution within loops. Common loop control statements include:

        **break**: Terminates the loop prematurely, regardless of the loop's condition.
        **continue**: Skips the remaining code in the current iteration and proceeds to the next iteration.
        **pass**: A placeholder statement that does nothing, commonly used when a statement is syntactically required but no action is needed.




**Opdracht**
---

**Exercise 1:**

- Create a new script.
- Create a variable x and give it the value 0.
- Use a while loop to print the value of x in every iteration of the loop. After printing, the value of x should increase by 1. The loop should run as long as x is smaller than or equal to 10.

![0-10](<../../00_includes/Python/PRG-04 -  Loops/0-10loop.png>)

**Exercise 2:**
- Create a new script.
- Copy the code below into your script.

        for i in range(10):
        #do something here

- Print the value of i in the for loop. You did not manually assign a value to i. Figure out how its value is determined.
- Add a variable x with value 5 at the top of your script.
- Using the for loop, print the value of x multiplied by the value of i, for up to 50 iterations.

Code used:

        # range is 0-9 because the range starts at 0 and therefor counts 10numbers up including 0.

    for i in range(10):
    print(i)



    # If i want 1-10 i could use this
    for i in range (1,11):
    print(i)


    # and now for the last part of the assignment, to multiply it by 5 you can add 5 after the specified range.

    x = 5

    for i in range (10):
    print(x*i)

    # A way of adding a number (to 50 in this case) is by doing it like this
    for i in range(0, 55, 5):
     print(i)

**Exercise 3:**
- Create a new script.
- Copy the array below into your script.
            
        arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]
- Use a for loop to loop over the array. Print every name individually.


code used:

    arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia", "Zev"]

    for x in arr:
    print(x)



*Gebruikte bronnen*

[3wschools](https://www.w3schools.com/python/)

*Ervaren problemen*
---

Geen ervaren problemen

*Resultaat!*
---

