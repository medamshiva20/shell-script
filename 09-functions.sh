#!/bin/bash 

#our program goal is to install mysql
USERID=$(id -u) # it will get the output and store into USERID 'id -u command it will only user id'
#This function should validate the previous command and inform user it is success or failure
VALIDATE(){
    if [ $? -ne 0 ]
    then
     echo "Installation ... FAILURE"
     exit 1
    else
     echo "Installation ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1
else
   echo "INFO: you are root user"
fi

yum install mysql -y

VALIDATE $?

yum install postfix -y 

VALIDATE $?