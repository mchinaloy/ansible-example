#!/bin/bash

CMD=$1

if [[ ${CMD} = "create"  ]]; then
  ansible-playbook --flush-cache playbooks/aws_create/tasks/main.yml -i inventories/aws/aws.yml --tags "create_aws"
  ./scripts/update_inventory.sh
elif [[ ${CMD} = "terminate" ]]; then
  ansible-playbook --flush-cache playbooks/aws_terminate/tasks/main.yml -i inventories/aws/aws.yml --tags "terminate_aws"
elif [[ ${CMD} = "deploy-nginx" ]]; then
  echo "Executing - ansible-playbook --flush-cache site.yml -i inventories/aws/aws.yml ${@:2}"
  ansible-playbook --flush-cache site.yml -i inventories/aws/aws.yml ${@:2} --vault-password-file ansible_vault_password.txt
fi
