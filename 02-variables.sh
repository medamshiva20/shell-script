##declaring inside script
##How to execute a command inside shell script and take the output(Interview Question)

#!/bin/bash 
DATE=$(date)

#shell script run the command inside $() and stores the output into variable called DATE
echo "Hello, this script is executed at timestamp: $DATE"