#!/bin/bash 
USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

#This function should validate the previous command status and inform to user it is success or failure
VALIDATE(){
 #$1 --> It will receive the argument1
 if [ $? -ne 0 ] # Here we should use $1 or $? it will give same result
  then 
      echo -e "Installation of Mysql ...$R FAILURE $N"
      exit 1
  else
      echo -e "Installation of postfix ...$G SUCCESS $N"
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
VALIDATE 

yum install postfix -y &>>$LOGFILE
VALIDATE  