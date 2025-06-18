#!/bin/bash
set -e  # Exit on any error

# Deploy Illumio first
terraform -chdir=illumio init
terraform -chdir=illumio apply -auto-approve

# Then deploy aws
terraform -chdir=aws init
terraform -chdir=aws apply -auto-approve

# Then perform post-deployment activities
terraform -chdir=post-deploy init
terraform -chdir=post-deploy -auto-approve
