#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y python-botocore python-boto3 python3 python3-pip ansible
pip3 install awscli --upgrade --user
