#!/bin/bash
set -e

# Fix curl conflict on Amazon Linux 2023
yum install -y curl --allowerasing

# Install latest stable k3s (single-node)
curl -sfL https://get.k3s.io | sh -

# Configure kubeconfig for ec2-user
mkdir -p /home/ec2-user/.kube
cp /etc/rancher/k3s/k3s.yaml /home/ec2-user/.kube/config
chown ec2-user:ec2-user /home/ec2-user/.kube/config

