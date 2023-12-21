#!/bin/bash 

APP_LOGS_DIR=/home/centos/app-logs/
DATE=$(date +%F:%H:%M:%S)
LOGS_DIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOG_FILE=$LOGS_DIR/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
echo "Script is executing at $DATE" &>>$LOG_FILE
while read line 
do
  rm -rf $line
  echo "Deleting $line" &>>$LOG_FILE
done <<< $FILES_TO_DELETE
