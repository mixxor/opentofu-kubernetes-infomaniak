variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "kubeconfig_context" {
  description = "Kubernetes context to use"
  type        = string
  default     = null
}

variable "infomaniak_token" {
  description = "Infomaniak API token for authentication"
  type        = string
  sensitive   = true
}

variable "public_cloud_id" {
  description = "The ID of the Infomaniak Public Cloud"
  type        = number
}

variable "public_cloud_project_id" {
  description = "The ID of the Infomaniak Public Cloud project"
  type        = number
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "cluster"
}

variable "pack_name" {
  description = "KaaS pack name (shared, dedicated)"
  type        = string
  default     = "shared"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.31"
}

variable "region" {
  description = "Infomaniak region for the cluster"
  type        = string
}
