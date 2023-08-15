# Key-value pairs

Key-value pairs are a general concept you will definitely encounter. Some examples of where you will find them are NoSQL databases or AWS/Azure resource tags. Dictionaries (**dict**) in Python also use key-value pairs to store information.

Dicts in Python are written using curly brackets {}. You can get values from the dict by calling its key. 

## Key-terms

**Key-Value Pair**: A key-value pair is a fundamental concept in computer science and data structures. It consists of two parts: a key, which is a unique identifier, and a value, which is associated with that key. This pairing allows for efficient data retrieval and organization.

**Dictionary**: A dictionary is a data structure that stores key-value pairs. Each key in a dictionary is associated with a corresponding value, allowing you to retrieve values quickly by using their keys.

**Hashing**: Hashing is a process used in dictionaries and other data structures to convert keys into a numerical index. This index is used to locate the corresponding value in memory, providing fast access to the value associated with a given key.

**Immutable Key**: In dictionaries, keys must be immutable. This means they cannot be changed after being created. Common examples of immutable keys are strings, numbers, and tuples.

**Mapping**: A mapping refers to the relationship between keys and their associated values in a dictionary. It signifies how values are linked to specific keys, enabling efficient lookup and retrieval of data.

## Opdracht

**Exercise 1:**

- Create a new script.
- Create a dictionary with the following keys and values:

| Key | Value |
|----------|----------|
| First name | Zev |
| Last name | Wepster |
|Job title | Student | 
| Company | Techgrounds |


- Loop over the dictionary and print every key-value pair in the terminal.

[Script exercise 1](prg-08-exe1.py)

**Exercise 2**:

- Create a new script.
- Use user input to ask for their information (first name, last name, job title, company). Store the information in a dictionary.
- Write the information to a csv file (comma-separated values). The data should not be overwritten when you run the script multiple times.

[Script exercise 2](prg-08-exe2.py)


### Gebruikte bronnen

[Youtube](https://www.youtube.com/watch?v=cVxS5vfu-lQ)

[docs.python](https://docs.python.org/3/library/os.html)

[docs.python](https://docs.python.org/3/library/csv.html)

[3wschools](https://www.w3schools.com/python/python_file_write.asp)

### Ervaren problemen
Ik had hier ten opzichte van de vorige opdrachten nog geen voorkennis van en dit werd gelijk een stuk ingewikkelder.
Daarnaast vond ik veel verschillende manieren om tot hetzelfde resultaat te komen. Hier keuzes in maken vind ik nog lastig.

### Resultaat

![csv](<../../00_includes/Python/PRG-08 - Key-values pairs/csvfile.png>)