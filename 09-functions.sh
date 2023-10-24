#!/bin/bash 
#our program goal is to install mysql
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#This function should validate the previous command status and inform to user it is success or failure
VALIDATE(){
    #$1 --> It will receive the argument1
    if [ "$1" -ne 0 ]
    then
     echo "$2 ... FAILURE"
     exit 1
    else
     echo "$2 ... SUCCESS"
    fi
}


USERID=$(id -u) # it will get the output and store into USERID 'id -u command it will only give user id'
if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1
# else
#    echo "INFO: you are root user"
fi

yum install mysql -y &>>$LOGFILE
#It is our responsibility again to check installation is success or not
VALIDATE $? "Installing MySQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"

yum install maven -y &>>$LOGFILE

VALIDATE $?m "Installing Maven"