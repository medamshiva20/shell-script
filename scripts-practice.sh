USER_ID=$(id -u)

if [ $USER_ID -nt 0 ]
then
    echo "ERROR: This script please run with root access or sudo access"
    exit 1
fi


yum install mysql -y