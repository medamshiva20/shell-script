#!/bin/bash 

#This is the comment, we need to develop a program that can do addition of 2 numbers

NUMBER1=$1
NUMBER2=$2

#I need to run a commnd inside shell script to add these 2 numbers
SUM=$((NUMBER1+NUMBER2))

echo "Addition of two numbers is: $SUM"