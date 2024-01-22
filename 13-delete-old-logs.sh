#!/bin/bash 

log_location=/home/centos/app-logs/
noofdays=+1
cd $log_location
for zipfile in `find . -type f \(-name "log_" -o -name "log-" -name "log." \) printf "%f\n"`
do
  gzip $zipfile
  wait $!
done
DATE=$(date +%F:%H:%M:%S)
LOGS_DIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOG_FILE=$LOGS_DIR/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $log_location -name "*.log" -type f -mtime +14)

echo "Script is executing at $DATE" &>>$LOG_FILE
while read line 
do
  rm -rf $line
  echo "Deleting $line" &>>$LOG_FILE
done <<< $FILES_TO_DELETE
