#!/bin/bash 

USER_ID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOG_FILE=/tmp/$SCRIPT_NAME-$DATE

R="\e[31m"
G="\e[32m"
N="\e[0m"


if [ $USER_ID -ne 0 ]
 then
   echo "ERROR: Please run script with root access"
   exit 126
 else
   echo "INFO: Script is running with root access"
fi

VALIDATE(){

if [ $1 -ne 0 ]
 then
  echo "$2 ...$R FAILURE $N"
  exit 1
 else
  echo "$2 ... $G SUCCESS $N"
fi

}

yum install mysql -y >>$LOG_FILE
VALIDATE $? "Installation of mysql" >>$LOG_FILE

yum install postfix -y >>$LOG_FILE
VALIDATE $? "Installation of postfix" >>$LOG_FILE