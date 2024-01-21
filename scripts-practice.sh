#!/bin/bash 

APP_LOGS_DIR=/home/centos/shell-script/app-logs/
DATE=$(date +%F:%H:%M:%S)
LOG_DIR=/home/centos/shell-script/shellscript-logs/
SCRIPT_NAME=$0
LOG_FILE=$LOG_DIR-$SCRIPT_NAME-$DATE
FILES_TO_DELETE=$(find * -name "*.log" -type f -mtime +14)
while read line
do
 rm -rf $line
 echo "Deleting logs $line"
done <<< $FILES_TO_DELETE