#!/bin/bash 

USER_ID=$(id -a)
LOG_DIR=/home/centos/shell-script/scriptlog
SCRIPT_NAME=$0
DATE=$(date +%F)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
     then
      echo -e "$2 ... $R FAILURE $N"
     else
      echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $USER_ID -ne 0 ]
 then
   echo "ERROR: Please script with root access"
   exit 1
 else
   echo "INFO: script is running with root user"
fi

for i in $@
do
yum list installed $i 
if [ $? -ne 0 ]
 then
  echo "$i packages are not installed let's do install"
  yum install $i -y
 else
   echo -e "$Y ... $i package is already installed"
fi
done

VALIDATE $? "$i is installed"