help:
	@echo kind-create
	@echo kind-delete
	@echo ""
	@echo helm-repo-add
	@echo helm-repo-update
	@echo ""
	@echo kubectl-get-pods
	@echo ""
	@echo make sky-aws-init
	@echo ""
	@echo make sky-launch-master-uv
	@echo ""
	@echo ssh-ray-dashboard
	@echo make open-ray-dashboard-remote
	@echo ""
	@echo make sky-kind-rayjob-from-disk-uv 
	@echo make sky-kind-rayservice-from-disk-uv 

kind-create:
	kind create cluster --image=kindest/node:v1.23.0

kind-delete:
	kind delete cluster --image=kindest/node:v1.23.0

helm-repo-add:
	helm repo add kuberay https://ray-project.github.io/kuberay-helm/

helm-repo-update:
	helm repo update

helm-install-kuberay:
	helm install kuberay-operator kuberay/kuberay-operator --version 1.0.0

kubectl-get-pods:
	kubectl get pods

helm-install-raycluster:
	helm install raycluster kuberay/ray-cluster --version 1.0.0


kubectl-get-rayclusters:
	kubectl get rayclusters

kubectl-get-pods-kuberay:
	kubectl get pods --selector=ray.io/cluster=raycluster-kuberay

kubctl-describe:
	kubectl describe pod 

sky-aws-init:
	@echo NOTE: set AWS credentials!!!
	@echo "source ~/aws-utils/set-<aws_env>.sh"

CLUSTER_NAME=kind

sky-launch-master-uv:
	sky launch -c master infra/sky-kind-master-uv.yaml \
		--cpus=4 \
		-i 60

# NA
# - TODO: not yet working
ssh-ray-dashboard:
	ssh -L 8265:localhost:8265 master

# NA
# - TODO: not yet working
open-ray-dashboard-remote:
	open http://localhost:8265

sky-launch-kind-rayjob-from-disk-uv:
	sky launch -c kind-rayjob --clone master

sky-launch-kind-rayservice-from-disk-uv:
	sky launch -c kind-rayservice --clone master
