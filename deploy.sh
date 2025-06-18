#!/bin/bash
set -e  # Exit on any error

# Deploy Illumio first
terraform -chdir=illumio init
terraform -chdir=illumio apply -auto-approve

# Then deploy aws
terraform -chdir=aws init
terraform -chdir=aws apply -auto-approve

# Run Post-Deployment Shell Script
chmod +x post-deploy/post-deploy.sh
./post-deploy.sh

# Then perform post-deployment Terraform activities
terraform -chdir=post-deploy init
terraform -chdir=post-deploy -auto-approve
