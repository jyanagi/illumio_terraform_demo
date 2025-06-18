#!/bin/bash

# Install Illumio Kubelink Operator
helm install illumio -f /tmp/illumio-values.yaml oci://quay.io/illumio/illumio --namespace illumio-system --create-namespace
