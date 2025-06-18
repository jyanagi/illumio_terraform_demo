#!/bin/bash
set -e  # Exit on any error

# Deploy and Configure Illumio
cd illumio
terraform init
terraform  apply -auto-approve
chmod +x illumio-script.sh
./illumio-script.sh

# Then deploy aws
cd ../aws
terraform init
terraform apply -var-file=../shared.tfvars -auto-approve 

# Then perform post-deployment activities

cd ../post-deploy
terraform init
terraform apply -var-file=../shared.tfvars -auto-approve
