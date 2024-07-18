provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = kubernetes_namespace.argocd.metadata[0].name
  }

  spec {
    type = "LoadBalancer"

    selector = {
      app = "argocd-server"
    }

    port {
      port        = 80
      target_port = 8080
    }

    port {
      port        = 443
      target_port = 8080
    }
  }
}

resource "kubernetes_secret" "argocd_initial_admin_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = kubernetes_namespace.argocd.metadata[0].name
  }

  data = {
    password = "admin"
  }
}

resource "kubernetes_cluster_role_binding" "argocd_cluster_role_binding" {
  metadata {
    name = "argocd-cluster-admin-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "kube-system"
  }
}


resource "null_resource" "install_argocd" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    EOT
  }
}

resource "null_resource" "github_webhook" {
  provisioner "local-exec" {
    command = <<EOT
      ./github_webhook.sh
    EOT
    environment = {
      GITHUB_TOKEN = "your_github_token"
      REPO_URL = var.github_repo_url
      WEBHOOK_URL = "https://${helm_release.argocd.name}.${kubernetes_namespace.argocd.metadata[0].name}.svc.cluster.local/api/webhook"
      SECRET = var.github_webhook_secret
    }
  }

  depends_on = [helm_release.argocd]
}

resource "kubernetes_secret" "argocd_webhook_secret" {
  metadata {
    name      = "argocd-webhook-secret"
    namespace = kubernetes_namespace.argocd.metadata[0].name
  }

  data = {
    "webhook.secret" = base64encode(var.github_webhook_secret)
  }
}
