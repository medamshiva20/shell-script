#!/bin/bash

# Define an array
numbers=(10 5 8 15 20 12)

# Initialize the maximum variable with the first element of the array
max=${numbers[0]}

# Loop through the array to find the maximum number
for num in "${numbers[@]}"
do
    if [ "$num" -gt "$max" ]; then
        max="$num"
    fi
done

# Print the result
echo "The biggest number in the array is: $max"
