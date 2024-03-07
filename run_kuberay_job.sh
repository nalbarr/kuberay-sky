#!/bin/bash

# NA
# 1. Find Kuberay head node
# 2. Submit Kuberay job
# - i.e., https://docs.ray.io/en/latest/cluster/kubernetes/getting-started/raycluster-quick-start.html

export HEAD_POD=$(kubectl get pods --selector=ray.io/node-type=head -o custom-columns=POD:metadata.name --no-headers)
echo $HEAD_POD

kubectl exec -it $HEAD_POD -- python -c "import ray; ray.init(); print(ray.cluster_resources())"
