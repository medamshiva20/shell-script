#!/bin/bash 

APP_LOGS_DIR=/home/centos/shell-script/app-logs/
DATE=$(date +%F:%H:%M:%S)
LOG_DIR=/home/centos/shell-script/shellscript-logs
SCRIPT_NAME=$0
LOG_FILE=$LOG_DIR/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
echo "Script is executing at: $DATE" &>>$LOG_FILE
while read line
do
 rm -rf $line
 echo "Deleting logs $line" &>>$LOG_FILE
done <<< $FILES_TO_DELETE