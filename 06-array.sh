#!/bin/bash

#This is called array, Instead of single value it can hold multiple values
PERSONS=("Ramesh" "Suresh" "Sachin")
#Inside array we always refer values with index and it starts from 0

echo "First Person: ${PERSONS[0]}"

#echo "All Persons: ${PERSONS[@]}"