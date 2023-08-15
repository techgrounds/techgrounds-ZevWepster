# PRG-07 - Lists


## Key-terms

**List**: A list is a built-in data type in Python that represents an ordered collection of items. These items can be of any data type, and they are enclosed within square brackets []. Lists are mutable, meaning you can change their contents after creation.

**Index**: Each item in a list has a specific index, which is its position within the list. Indexing in Python starts from 0. You can access items in a list using their index, like my_list[0] to access the first item.

**List Methods**: List methods are built-in functions that can be applied to lists to perform various operations. Examples of list methods include:

- **append()**: Adds an item to the end of the list.
- **insert()**: Inserts an item at a specific index in the list.
- **pop()**: Removes and returns an item from a specific index or the end of the list.
- **remove()**: Removes the first occurrence of a specified value from the list.
- **len()**: Returns the number of items in the list.


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

[3wschools](https://www.w3schools.com/python/)

### Ervaren problemen


### Resultaat

