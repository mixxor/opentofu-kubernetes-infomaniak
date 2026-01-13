# OpenTofu Kubernetes Infrastructure

Infrastructure as Code for Kubernetes using OpenTofu.


thx

@

https://yewolf.fr/blog/building-my-infra-on-infomaniak-kubernetes-managed/

## Prerequisites

- [OpenTofu](https://opentofu.org/) >= 1.6.0
- [pre-commit](https://pre-commit.com/)
- [tflint](https://github.com/terraform-linters/tflint)
- [terraform-docs](https://terraform-docs.io/)

### macOS (Homebrew)

```bash
brew install opentofu pre-commit tflint terraform-docs
```

## Setup

```bash
# Install pre-commit hooks
pre-commit install

# Initialize OpenTofu
tofu init

# Copy example variables
cp example.tfvars terraform.tfvars
# Edit terraform.tfvars with your values
```

## Usage

```bash
# Plan changes
tofu plan

# Apply changes
tofu apply

# Destroy resources
tofu destroy
```

## Pre-commit Hooks

This repo uses pre-commit hooks for:
- `tofu_fmt` - Format OpenTofu files
- `tofu_validate` - Validate configuration
- `tofu_docs` - Auto-generate documentation
- `tofu_tflint` - Lint configuration
- `gitleaks` - Detect secrets

Run manually:
```bash
pre-commit run -a
```

<!-- BEGIN_TF_DOCS -->


## Usage

```hcl
module "example" {
  source = "path/to/module"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12 |
| <a name="requirement_infomaniak"></a> [infomaniak](#requirement\_infomaniak) | ~> 1.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.25 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_infomaniak"></a> [infomaniak](#provider\_infomaniak) | 1.3.6 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [infomaniak_kaas.cluster](https://registry.terraform.io/providers/Infomaniak/infomaniak/latest/docs/resources/kaas) | resource |
| [infomaniak_kaas_instance_pool.instance_pool](https://registry.terraform.io/providers/Infomaniak/infomaniak/latest/docs/resources/kaas_instance_pool) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_infomaniak_token"></a> [infomaniak\_token](#input\_infomaniak\_token) | Infomaniak API token for authentication | `string` | n/a | yes |
| <a name="input_public_cloud_id"></a> [public\_cloud\_id](#input\_public\_cloud\_id) | The ID of the Infomaniak Public Cloud | `number` | n/a | yes |
| <a name="input_public_cloud_project_id"></a> [public\_cloud\_project\_id](#input\_public\_cloud\_project\_id) | The ID of the Infomaniak Public Cloud project | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Infomaniak region for the cluster | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster | `string` | `"cluster"` | no |
| <a name="input_kubeconfig_context"></a> [kubeconfig\_context](#input\_kubeconfig\_context) | Kubernetes context to use | `string` | `null` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | Path to the kubeconfig file | `string` | `"~/.kube/config"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version for the cluster | `string` | `"1.31"` | no |
| <a name="input_pack_name"></a> [pack\_name](#input\_pack\_name) | KaaS pack name (shared, dedicated) | `string` | `"shared"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the KaaS cluster |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | Kubeconfig to access the cluster |
<!-- END_TF_DOCS -->
