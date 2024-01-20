#!/bin/bash 

USERD_ID=$(id -a)
LOG_DIR=/home/centos/shell-script/scriptlog
SCRIPT_NAME=$0
DATE=$(date +%F)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERD_ID -ne 0 ]
 then
   echo "ERROR: Please script with root access"
   exit 1
 else
   echo "INFO: script is running with root user"
fi

for i in $@
do
 yum install $i -y
done