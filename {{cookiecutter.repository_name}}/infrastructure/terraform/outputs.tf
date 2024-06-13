output "{{cookiecutter.frontend_name}}_service_ip" {
  value = kubernetes_service.frontend.status[0].load_balancer[0].ingress[0].ip
}

output "{{cookiecutter.backend_name}}_service_ip" {
  value = kubernetes_service.backend.status[0].load_balancer[0].ingress[0].ip
}
