#!/bin/bash

# NA
# - i.e., https://docs.ray.io/en/latest/cluster/kubernetes/getting-started/raycluster-quick-start.html

helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
helm install kuberay-operator kuberay/kuberay-operator --version 1.0.0
helm install raycluster kuberay/ray-cluster --version 1.0.0
