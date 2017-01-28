#!/bin/bash

echo "Updating inventory..."

getIpAddresses() {
echo `aws ec2 describe-instances | jq '.Reservations[].Instances[] | select(.State.Code != 48) | select(.Tags[] | select(.Key=="Name") | select(.Value == "ansible_example")) | [(.PrivateIpAddress),(.PublicIpAddress)]'`
}

ANSIBLE_TEST_IPS=`getIpAddresses`

ANSIBLE_TEST=(`echo ${ANSIBLE_TEST_IPS} | tr -d '[]",'`)

echo "
[ansible_example]
${ANSIBLE_TEST[1]} private_ip=${ANSIBLE_TEST[0]} ansible_connection=ssh
" > inventories/aws/aws.yml
echo "
[docker:children]
ansible_example

[nginx:children]
ansible_example

[nginx_conf:children]
ansible_example
" >> inventories/aws/aws.yml

echo "Finished Updating inventory"