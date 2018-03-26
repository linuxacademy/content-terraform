condition=$(aws ec2 describe-security-groups \
--filters Name=group-name,Values='*cloud9*' \
Name=ip-permission.from-port,Values='8080' \
Name=ip-permission.to-port,Values='8080' \
--query 'SecurityGroups[*].GroupId' --output text)

    if [ -z "$condition" ];
then
    echo "Port 8080 not open! Adding Security Group rule!"
    secgrp=$(aws ec2 describe-security-groups \
    --filters Name=group-name,Values='*cloud9*' \
    --query 'SecurityGroups[*].GroupId' --output text)
    aws ec2 authorize-security-group-ingress \
    --group-id $secgrp \
    --protocol tcp \
    --port 8080 \
    --cidr 0.0.0.0/0 
    echo "Successfully added port 8080 to the security group for access!"
else
    echo "We're all good, port 8080 is accessible"
fi