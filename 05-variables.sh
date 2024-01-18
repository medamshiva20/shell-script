##We can get the values prompting through read command

#!/bin/bash
echo "Please enter your username"
read USERNAME #This is the variable where the value of the user entered

#This is only for validation, we should not print in the terminal
echo "Username entered is: $USERNAME"
echo "Please enter your password"
read -s PASSWORD
echo "Password entered is: $PASSWORD"