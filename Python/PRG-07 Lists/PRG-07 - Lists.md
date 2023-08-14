# PRG-07 - Lists


## Key-terms

## Opdracht

**Exercise 1:**
- Create a new script.
- Create a variable that contains a list of five names.
- Loop over the list using a for loop. Print every individual name in the list on a new line.

Used code:

        names = ["Kaman", "Sinan", "Jeroen", "Jordan", "Zev"]
        for x in names:
            print(x)

**Exercise 2:**
- Create a new script.
- Create a list of five integers.
- Use a for loop to do the following for every item in the list:
- Print the value of that item added to the value of the next item in the list. If it is the last item, add it to the value of the first item instead (since there is no next item).

Code used:

        numbers = [12, 56, 16, 25, 10]

        list_lenght = len(numbers)

        for i in range(list_lenght):
            curr_item = numbers[i]
            next_item = numbers[(i + 1) % list_lenght]

            result = curr_item + next_item
            print(result)



### Gebruikte bronnen


### Ervaren problemen


### Resultaat

