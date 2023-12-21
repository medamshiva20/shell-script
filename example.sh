# We have to write shell script we have to say user input Hello World
# We have to write length of the string 
# Convert string to upper case 

#!/bin/bash 

variable1=$1

echo "String name is: $variable1"
echo "Stirng count is: ${#variable1}"
echo "$variable1" | awk ' {print toupper ($0)}'

# str="$variable1"
# n=0
# while read -n1 character; do
#     n=$((n+1)); 
# done << (echo -n "$str")
# echo "Length of the string is : $n "