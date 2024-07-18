resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  version    = "3.27.0"

  set {
    name  = "server.extraArgs"
    value = "--insecure"
  }

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = "${var.github_webhook_secret}"
  }
}
