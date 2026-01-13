output "cluster_id" {
  description = "The ID of the KaaS cluster"
  value       = infomaniak_kaas.cluster.id
}

output "kubeconfig" {
  description = "Kubeconfig to access the cluster"
  value       = infomaniak_kaas.cluster.kubeconfig
  sensitive   = true
}
