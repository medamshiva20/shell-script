#1.check root user or not
#2.if not root user, exit the program and inform user to run with sudo access
#3.if root user install mysql
# root user id -u --> 0
#non root user id -u -->1000 or above(ex:not zero)

#!/bin/bash 

USERID=$(id -u)
if [ $USERID -ne 0 ]
 then
   echo "ERROR:: Please run this script with root access"
   exit 1
#  else
#    echo "INFO: yor are root user"
fi

yum install mysqlll -y 
