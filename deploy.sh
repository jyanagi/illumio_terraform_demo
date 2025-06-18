#!/bin/bash
set -e  # Exit on any error

# Deploy Illumio first
terraform -chdir=illumio init
terraform -chdir=illumio apply -auto-approve

# Then deploy aws
terraform -chdir=aws init
terraform -chdir=aws apply -auto-approve
