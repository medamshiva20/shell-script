#!/bin/sh
NUM=200 #This is the global variable it will access through the program or shell script
getNUM(){
    #NUM=100 #This is local variable it will access with in this block of code only
    echo "$NUM - inside function" 
}

echo "$NUM - outside function" 

getNUM 