#!/bin/bash

# Enable Logging - refer to /var/log/user-data.log for k3s installation messages
exec > /var/log/k3s-install.log 2>&1
set -x

# Disable UFW (Ubuntu)
sudo ufw disable > /dev/null 2>&1

# Export K3s flags before calling the K3s installer
export INSTALL_K3S_EXEC="--disable traefik --disable metrics-server"

# Install K3s without Traefik and metrics-server
echo "Installing K3s..."
curl -sfL https://get.k3s.io -o install_k3s.sh
chmod +x install_k3s.sh
./install_k3s.sh

# Verify install
/usr/local/bin/k3s --version || echo "K3s not found!"

# Wait for kubeconfig to be created
for i in {1..10}; do
  [ -f /etc/rancher/k3s/k3s.yaml ] && break
  sleep 5
done

# Set KUBECONFIG
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Symlink k3s to kubectl if not already present
ln -sf /usr/local/bin/k3s /usr/local/bin/kubectl

# Apply manifest if present
if [ -f /tmp/guestbook-php.yaml ]; then
  /usr/local/bin/kubectl apply -f /tmp/guestbook-php.yaml
fi
