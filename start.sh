#!/bin/bash

# add environment variables
source ./.env

# run build with packer and get the packer output
packer build ./packer/packer_template.json 2>&1 | tee packer/packer_output.txt

# get the AMI id
bash packer/ami_extractor.sh

# switch to the terraform directory
cd ./terraform

# initialize terraform
terraform init

# run the terraform plan
terraform plan

# apply the terraform plan
terraform apply -auto-approve

# remove the files for getting the ami
rm ../packer/packer_output.txt
