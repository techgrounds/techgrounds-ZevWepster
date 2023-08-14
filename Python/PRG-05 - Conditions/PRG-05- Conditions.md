**PRG-05 - Conditions **
===
**Key-terms**
---





**Opdracht**
---

**Exercise 1:**
- Create a new script.
- Use the input() function to ask the user of your script for their name. If the name they input is your name, print a personalized welcome message. If not, print a different personalized message.

**Exercise 2:**
- Create a new script.
- Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
- Make the game repeat until the user inputs 100.

**Voor het eindresultaat  zie kop Resultaat!**

*Gebruikte bronnen*


*Ervaren problemen*
---


*Resultaat!*
---
Om te ontdekken of coderen iets voor mij is heb ik na Pathways iets soortgelijks gemaakt, ik zal dit hier onder laten zien met comments.


       

        import random   #voor het genereren van random getallen
        import time     #om tijd tussen de commands te kunnen toevoegen voor een soepeler lopend verhaal.

        # intro van spel

        print("Welcome to my random # guesser!")
        print("After you type in your answer, press ENTER to submit it.")
        time.sleep(3)



        top_range = input("Pick a number: ")        #input voor tot welk nummer je wilt spelen
        time.sleep(1)
        print(".")
        time.sleep(1)
        print(".")
        time.sleep(1)
        print(".")      #simuleren van ... als laadscherm

        if top_range.isdigit:               #checkt of de input een nummer is
            top_range = int(top_range) 
        
        elif top_range <= 0:        #actie voor als er een getal onder de 0 word gegeven als input
            print("Please type a number larger than 0 next time.")
            quit()      #stopt het programma
        else:
            print('Please type a number next time')     #actie voor als er een letter of woord als input word gegeven
            quit()
            
        random_number = random.randint(0, top_range)        #als gegeven input een getal is boven de 0 kan het spel verder
        
        while True:
        user_guess = input('Now take a guess!: ')
        time.sleep(1)
        if user_guess.isdigit():                #check of de input een getal is.
            user_guess = int(user_guess)
        else:
            print('please type a number next time.')        #zo niet, komt de vraag dit te doen en krijg je opnieuw de kans hiervoor
            continue
        
        if user_guess == random_number:         #is het je input hetzelfde als het random gegenereerde getal dan heb je gewonnen en stopt het spel
            print("You got it!")
            break
        else:
           print("You got it wrong! Please try again.")          #is de input niet gelijk aan het random gegenereerde getal geeft het aan dat dit fout is en kan je het nog een keer proberen.


Voorbeeld van output:

![output](<../../00_includes/Python/PRG-05 - Conditions/outputRandom.png>)