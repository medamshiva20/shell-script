#!/bin/bash 

USER_ID=$(id -u)
LOGFILE_DIRECTORY=/TMP
SCRIPT_NAME=$0
DATE=$(date +%F)
LOG_FILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -h | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1

while IFS= read line
do 
  usage=$(echo $line | awk {'print $6'} | cut -d % -f1)
  partition=$(echo $line | awk {'print $1'})
  echo "Usage is : $usage"
  echo "Partition is : $partition"
done <<< $DISK_USAGE
