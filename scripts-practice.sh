#!/bin/bash 

USERD_ID=$(id -u)

if [ $USER_ID -ne 0 ]
 then
   echo "ERROR: Please run script with root access"
 else
   echo "INFO: Script is running with root access"
fi

VALIDATE()
if [ $? -ne 0]
 then
  echo "$1 ... $2 FAILURE"
  exit 1
 else
  echo "$1 ... $2 SUCCESS"
fi

yum install mysql -y
VALIDATE $? "Installation of mysql"

yum install postfix -y
VALIDATE $? "Installation of postfix"