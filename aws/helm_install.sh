#!/bin/bash

# Enable Logging - refer to /var/log/user-data.log for k3s installation messages
exec > /var/log/helm-install.log 2>&1
set -x

# Export K3s flags before calling helm installer
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Download and install Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
