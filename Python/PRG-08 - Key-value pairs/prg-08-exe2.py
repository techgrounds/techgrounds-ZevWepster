# Excercise 2

import csv
import os #so it can run on every OS 

# a function that gives the input for the csv file
def user_input():
    firstName = input("What is your first name? ")
    lastName = input("What is your last name? ")
    jobTitle = input("What is your occupation? ")
    company = input("For what company? ")
    return {
        "First name ": firstName,
        "Last name ": lastName,
        "Job title ": jobTitle,
        "Company ": company

    }
# write to csv
def write_to_csv(data):
    file_exists = os.path.exists("user_info.csv")
    with open("user_info.csv", mode="a", newline="") as csvfile: #opens csv file in "Append mode" to add new line, newline="" sets it so the default settings are used.
        fieldnames = ["First name ", "Last name ", "Job title ", "Company "]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        if not file_exists: # if the file does not exist it creates it
            writer.writeheader()
        writer.writerow(data)

if __name__ == "__main__": # The script checks if the module is run directly 
    user_data = user_input() # calls the input function to collect data
    write_to_csv(user_data) # calls function to write the data to the csv file
    print("User input has been written to user_info.csv.") #to give any visible conformation it worked.