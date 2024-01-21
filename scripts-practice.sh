#!/bin/bash 

NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
AMI_ID=ami-0f3c7d07486cad139
SECURITY_GROUP_ID=sg-005b676c6b9725e11

for i in "${NAMES[@]}"
do
  if [[ $i == "mongodb" || $i == "mysql" ]]
   then
     INSTANCE_TYPE="t3.medium"
   else
     INSTANCE_TYPE="t2.micro"
  fi
  echo "creating $i instance"
  IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI_ID  --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
  echo "Instance $i created:$IP_ADDRESS"
done