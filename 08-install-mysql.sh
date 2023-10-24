#1.check root user or not 
#2.if not root user, exit the program and inform user to run with sudo access
#3.if root user install mysql
# root user id -u --> 0
#non root user id -u -->1000 or above(ex:not zero)

#/bin/bash

#our program goal is to install mysql
USERID=$(id -u) # it will get the output and store into USERID 'id -u command it will only user id'
if [ $USERID -ne 0 ]
then
  echo "ERROR:: Please run this script with root access"
  exit 1 # it will stop the script execution and can't execute further or remaining script
else
  echo "INFO: you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ] #$? this command will result like if it 0 means success and if it is 1 means failure
then
 echo "Installation of mysql is error"
 exit 1
else
 echo "Installation of mysql is success"
 fi