#!/bin/bash 

USER_ID=$(id -u)
LOGFILE_DIRECTORY=/TMP
SCRIPT_NAME=$0
DATE=$(date +%F)
LOG_FILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
message=""

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -h | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1

while IFS= read line
do 
  usage=$(echo $line | awk {'print $5'} | cut -d % -f1)
  partition=$(echo $line | awk {'print $1'})
  #echo "Usage is : $usage"
  #echo "Partition is : $partition"
  if [ $usage -gt $DISK_USAGE_THRESHOLD ]
   then
     message+="HIGH DISK USAGE ON $partition : $usage\n"
  fi
done <<< $DISK_USAGE

