import random
import time

# checks for valid move
def valid_move(move, options):
    return move in options
# computer move generator
def gen_comp_move(options):
    return random.choice(options)
# round winner/ game rules
def determine_round_winner(user_choice, computer_choice):
    if user_choice == computer_choice:
        return "Tie"
    elif (user_choice == "Rock" and computer_choice == "Scissors") or \
         (user_choice == "Paper" and computer_choice == "Rock") or \
         (user_choice == "Scissors" and computer_choice == "Paper"):
        return "Player"
    else:
        return "Computer"
#score update   
def update_score(result, score):
    if result == "Player":
        score["player"] += 1
    elif result == "Computer":
        score["computer"] += 1

print("Welcome to my Rock Paper Scissors game!")

def begin():
    options = ["Rock", "Paper", "Scissors"]
    score = {"player": 0, "computer": 0}

    while True: 
        try:
            amount_rounds = int(input("How many rounds would you like to play?: "))
            break 
        except ValueError:
            print("Please enter a number...")

    while True:  
        confirm_rounds = input("Are you sure? Press 'y' for YES and 'n' for NO: ")
        if confirm_rounds == 'y':
            break 
        elif confirm_rounds == 'n':
            continue  
        else:
            print("Invalid input. Press 'y' for YES and 'n' for NO.")

    print("Time to play!")
    ready = input("Press ENTER to start ")
    
    if ready == '':
       for _ in range(amount_rounds):
        user_choice = input("Choose Rock, Paper, or Scissors: ")
        while not valid_move(user_choice, options):
            user_choice = input("Invalid choice. Choose Rock, Paper, or Scissors: ")
            
        computer_choice = random.choice(options)

        print("You chose:", user_choice)
        print("Computer chose:", computer_choice)

        round_winner = determine_round_winner(user_choice, computer_choice)
        update_score(round_winner, score)
        

        if user_choice == computer_choice:
                print("It's a tie!")
        elif (user_choice == "Rock" and computer_choice == "Scissors") or \
                 (user_choice == "Paper" and computer_choice == "Rock") or \
                 (user_choice == "Scissors" and computer_choice == "Paper"):
                print("You win!")
        else:
                print("Computer wins!")
        print(score)

begin()


while True:
    again = input("Would you like to play again? Press 'y' for YES and 'n' for NO: ")
    if again == 'y':
        begin() 
    elif again == 'n':
        print("Oh...")
        time.sleep(1)
        print(".")
        time.sleep(1)
        print("Okay...")
        time.sleep(1)
        print(".")
        time.sleep(1)
        print("See you next time!")
        
        break 
    else:
        print("Invalid input. Press 'y' for YES and 'n' for NO.")
