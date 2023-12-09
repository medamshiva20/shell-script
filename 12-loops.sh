# improvements
# implement log files
# implement colors
# implement validations
# implement validations through functions
# your script should check package is already installed or not, if already installed print yellow color
# if installed just print package is alredy installed, it should not run install command

#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME/$DATE.log

R="\e[31m"
G="\e\[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
     then
       echo -e "$2...$R FAILURE $N"
       exit 1
     else
       echo -e "$2...$G SUCCESS $N"
    fi
}

#All args are in $@
for i in $@
do
 yum install $i -y &>>$LOGFILE
 VALIDATE $? "Installation of $@"
done