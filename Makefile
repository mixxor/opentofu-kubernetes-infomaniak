.PHONY: init apply destroy clean plan

init:
	tofu init

plan: init
	@if [ -f kubeconfig ]; then \
		tofu plan; \
	else \
		echo "Kubeconfig not found. Run 'make apply' to create the cluster first."; \
		tofu plan -target=infomaniak_kaas.cluster -target=infomaniak_kaas_instance_pool.instance_pool -target=local_sensitive_file.kubeconfig; \
	fi

apply: init
	@if [ -f kubeconfig ]; then \
		echo "Kubeconfig exists, applying all resources..."; \
		tofu apply; \
	else \
		echo "Stage 1: Creating cluster and kubeconfig..."; \
		tofu apply -target=infomaniak_kaas.cluster -target=infomaniak_kaas_instance_pool.instance_pool -target=local_sensitive_file.kubeconfig; \
		echo "Stage 2: Applying remaining resources..."; \
		tofu apply; \
	fi

destroy:
	tofu destroy

clean:
	rm -f kubeconfig
	rm -rf .terraform

kubeconfig:
	@echo "Fetching kubeconfig from cluster..."
	tofu apply -target=local_sensitive_file.kubeconfig -auto-approve
