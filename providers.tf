provider "infomaniak" {
  host  = "https://api.infomaniak.com"
  token = var.infomaniak_token
}

provider "kubernetes" {
  config_path = "${path.module}/kubeconfig"
}

provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig"
  }
}

provider "kubectl" {
  config_path = "${path.module}/kubeconfig"
}
