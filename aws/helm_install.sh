#!/bin/bash

# Enable Logging - refer to /var/log/user-data.log for k3s installation messages
exec >> /var/log/user-data.log 2>&1
set -x

# Download and install Helm
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash