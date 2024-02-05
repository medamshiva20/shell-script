#!/bin/bash

PERSON1=Virat
PERSON2=Rohit

echo "Hello World, I am practicing Devops with AWS"
echo "$PERSON1: Hi $PERSON2, Good Morning"
echo "$PERSON2: Good Morning $PERSON1"
echo "$PERSON1: How are you $PERSON2"
echo "$PERSON2: I am good, how are you $PERSON1"

unset $PERSON1

echo "Hello testing variable1 whether we accessing or not:$PERSON1"