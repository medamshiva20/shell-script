USER_ID=$(id -u)

if [ $USER_ID -nt 0]
then
    echo "ERROR: This script please run with root access or sudo access"
else
    echo "INFO: Script is running with root access"
fi


yum install mysql -y