#!/bin/sh

getNUM(){
    NUM=100 #local variable
    echo "$NUM - inside function" 
}

echo "$NUM - outside function" 
getNUM 