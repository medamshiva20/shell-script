#!/bin/bash 

NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
AMI_ID=ami-0f3c7d07486cad139
SECURITY_GROUP_ID=sg-005b676c6b9725e11
DOMAIN_NAME=sivadevops.website

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
aws route53 change-resource-record-sets --hosted-zone-id Z02176093W0IKU2YA447H --change-batch '
    {
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                            "Name": "'$i.$DOMAIN_NAME'",
                            "Type": "A",
                            "TTL": 1,
                            "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
                        }}]
    }
    '
done