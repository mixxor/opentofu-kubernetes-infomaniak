resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }

  depends_on = [
    infomaniak_kaas_instance_pool.instance_pool
  ]
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "9.3.1"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }

  depends_on = [
    infomaniak_kaas_instance_pool.instance_pool
  ]
}

resource "kubectl_manifest" "cluster_essentials" {
  yaml_body = <<-YAML
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: cluster-essentials
      namespace: argocd
    spec:
      project: default
      destination:
        server: https://kubernetes.default.svc
        namespace: default
      source:
        repoURL: https://github.com/mixxor/argocd-cluster-essentials
        path: applicationsets/
        targetRevision: HEAD
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
        syncOptions:
          - CreateNamespace=true
  YAML

  depends_on = [helm_release.argocd]
}
