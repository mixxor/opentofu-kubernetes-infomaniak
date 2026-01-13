resource "infomaniak_kaas" "cluster" {
  public_cloud_id         = var.public_cloud_id
  public_cloud_project_id = var.public_cloud_project_id

  name               = var.cluster_name
  pack_name          = var.pack_name
  kubernetes_version = var.kubernetes_version
  region             = var.region
  # no labels unfortuantely
}

resource "infomaniak_kaas_instance_pool" "instance_pool" {
  public_cloud_id         = infomaniak_kaas.cluster.public_cloud_id
  public_cloud_project_id = infomaniak_kaas.cluster.public_cloud_project_id
  kaas_id                 = infomaniak_kaas.cluster.id

  name              = "instance-pool-1"
  flavor_name       = "a2-ram4-disk20-perf1"
  min_instances     = 1
  max_instances     = 1
  availability_zone = "az-1"

  labels = {
    "node-role.kubernetes.io/worker" = "high"
  }
}
