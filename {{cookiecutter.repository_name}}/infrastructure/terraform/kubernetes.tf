provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "default" {
  metadata {
    name = "default"
  }
}

resource "kubernetes_deployment" "{{cookiecutter.gcp_frontend_deployment_name}}" {
  metadata {
    name      = "{{cookiecutter.gcp_frontend_deployment_name}}"
    namespace = "kubernetes_namespace.default.metadata[0].name"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "{{cookiecutter.gcp_frontend_deployment_name}}"
      }
    }

    template {
      metadata {
        labels = {
          app = "{{cookiecutter.gcp_frontend_deployment_name}}"
        }
      }

      spec {
        container {
          name  = "{{cookiecutter.frontend_name}}"
          image = ".${var.{{cookiecutter.frontend_name}}_image}:.${var.image_tag}"
        }
      }
    }
  }
}

resource "kubernetes_service" "{{cookiecutter.gcp_frontend_service_name}}" {
  metadata {
    name      = "{{cookiecutter.gcp_frontend_service_name}}"
    namespace = "kubernetes_namespace.default.metadata[0].name"
  }

  spec {
    selector = {
      app = "{{cookiecutter.gcp_frontend_service_name}}"
    }

    port {
      port        = var.{{cookiecutter.frontend_name}}_port
      target_port = var.{{cookiecutter.frontend_name}}_port
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "{{cookiecutter.gcp_backend_deployment_name}}" {
  metadata {
    name      = "{{cookiecutter.gcp_backend_deployment_name}}"
    namespace = "kubernetes_namespace.default.metadata[0].name"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "{{cookiecutter.gcp_backend_deployment_name}}"
      }
    }

    template {
      metadata {
        labels = {
          app = "{{cookiecutter.gcp_backend_deployment_name}}"
        }
      }

      spec {
        container {
          name  = "{{cookiecutter.backend_name}}"
          image = ".${var.{{cookiecutter.backend_name}}_image}:.${var.image_tag}"
        }
      }
    }
  }
}

resource "kubernetes_service" "{{cookiecutter.gcp_backend_service_name}}" {
  metadata {
    name      = "{{cookiecutter.gcp_backend_service_name}}"
    namespace = "kubernetes_namespace.default.metadata[0].name"
  }

  spec {
    selector = {
      app = "{{cookiecutter.gcp_backend_service_name}}"
    }

    port {
      port        = var.{{cookiecutter.backend_name}}_port
      target_port = var.{{cookiecutter.backend_name}}_port
    }

    type = "LoadBalancer"
  }
}
