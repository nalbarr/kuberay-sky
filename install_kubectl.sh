#!/bin/bash

# NA
# - i.e., https://docs.ray.io/en/latest/cluster/kubernetes/getting-started/raycluster-quick-start.html

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

