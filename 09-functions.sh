#!/bin/bash 
USERID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
#This function should validate the previous command status and inform to user it is success or failure
VALIDATE(){
 #$1 --> It will receive the argument1
 if [ $1 -ne 0 ]
  then 
      echo "$2 ...FAILURE"
      exit 1
  else
      echo "$2 ...SUCCESS"
 fi
}

if [ $USERID -ne 0 ]
  then
       echo "ERROR:: Please run this script with root access"
       exit 1
  else
       echo "INFO: you are root user"
fi

yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installation of Mysql"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installation of postfix"