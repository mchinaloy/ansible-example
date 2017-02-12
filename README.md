# ansible-example

This is project demonstrates how we can use the IT automation tool Ansible to create AWS hosts and deploy an Nginx container.

### How to use this project

1. Create an AWS account
2. Specify your PEM, Key and Secret in inventories/aws/group_vars/all.yml
3. Create your host:
```
./scripts/cluster.sh create
```
4. Deploy the Nginx Docker container:
```
./scripts/cluster.sh deploy-nginx
```
5. To terminate your instance:
```
./scripts/cluster.sh terminate
```

Note * There is a secrets file included to demonstrate how we can use ansible-vault but it is not required for this example.
