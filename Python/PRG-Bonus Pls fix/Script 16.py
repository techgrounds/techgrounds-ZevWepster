'''
The output should be:

'''
import random

# generate random int
goal = random.randint(1,100)

win = False # after discussing with my peers we understood the question asked better and changing this to True will give you a blank outcome (as asked)
tries = 0

while win == False and tries < 7:
	try:
		# ask for input
		inpt = int(input("Please input a number between 1 and 100: "))
		# count attempt as a try
		tries += 1

		# check for match
		if inpt == goal:
			win = True
			print("Congrats, you guessed the number!")
			print("It took you", tries, "tries")
		# give hints
		elif inpt < goal:
			print("The number should be higher")
		else:
			print("The number should be lower")

	except:
		print("Please type an integer")

# 
if win == False:
	print("Game over! You took more than seven tries")
	print("The correct number was:", goal) #in my opinion the game was not complete, adding a extra print to give the answer solves that.
	
	