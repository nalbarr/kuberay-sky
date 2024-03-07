#!/bin/bash

# NA
# - i.e., https://docs.ray.io/en/latest/cluster/kubernetes/getting-started/raycluster-quick-start.html

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
