#!/bin/bash
exec > /var/log/kubelink-install.log 2>&1
set -x

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Create Namespace and Configmap for Private PKI
kubectl create namespace illumio-system
kubectl -n illumio-system create configmap private-ca --from-file=/tmp/private-ca.crt

# Install Illumio Kubelink Operator
helm install illumio -f /tmp/illumio-values.yaml oci://quay.io/illumio/illumio --namespace illumio-system #--create-namespace
