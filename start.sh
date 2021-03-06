#!/bin/bash

# add environment variables
source ./.env

#switch to the packer directory
cd ./packer

# run build with packer and store the packer output in the packer_output.txt file
# the output will contain the ami-id for the image that has been provisioned by packer
# this ami_id will be used by terraform to provition an instance
packer build ./packer_template.json 2>&1 | tee packer_output.txt

# exit the packer directory
cd ../

# the ami_extractor will get the ami_id of the image that has been provisioned using packer and ansible from the output file created
bash ami_extractor.sh

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
