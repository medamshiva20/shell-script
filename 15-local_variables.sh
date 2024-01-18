#!/bin/sh

getNUM(){
    NUM=100 #local variable
    echo "$NUM - inside function" 
}

echo "$NUM - outside function" #Here it will not call the variable(NUM) value because it is inside funcvtion only
getNUM 