USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then
    echo "ERROR: This script please run with root access or sudo access"
    exit 1
fi


yum install mysql -y

if [ $? -ne 0 ]
 then
   echo "FAILURE ... Installation of mysql"
   exit 10
 else
   echo "SUCCESS ... Installation of mysql"
fi
