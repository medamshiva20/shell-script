#!/bin/bash 
USERID=$(id -u)
#This function should validate the previous command status and inform to user it is success or failure
VALIDATE(){
 #$1 --> It will receive the argument1
 if [ $1 -ne 0 ]
  then 
      echo "Installation is ...FAILURE"
      exit 1
  else
      echo "Installation is ...SUCCESS"
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