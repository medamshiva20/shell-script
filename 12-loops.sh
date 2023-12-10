# improvements
# implement log files
# implement colors
# implement validations
# implement validations through functions
# your script should check package is already installed or not, if already installed print yellow color
# if installed just print package is alredy installed, it should not run install command

#!/bin/bash
USERID=$(id -u)
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=/tmp/$LOGSDIR/$SCRIPT_NAME-$DATE.log


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi

#This function should validate the previous command status and inform to user it is success or failure
VALIDATE(){
 #$1 --> It will receive the argument1
 if [ $1 -ne 0 ]
  then 
      echo -e "$2 ...$R FAILURE $N"
      exit 1
  else
      echo -e "$2 ...$G SUCCESS $N"
 fi
}

#All args are in $@
for i in $@
do
  yum list installed $i &>>$LOGFILE
  
 if [ $? -ne 0 ]
  then
    echo "$i is not installed, let's install it"
    yum install $i -y &>>$LOGFILE
    VALIDATE $? "$i"
  else
     echo "$Y $i is already installed $N"
 fi
done