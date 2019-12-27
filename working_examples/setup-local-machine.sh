#!/bin/bash

apt-add-repository ppa:ansible/ansible

apt-get update
apt-get upgrade -y

apt-get install python-botocore python-boto3 ansible