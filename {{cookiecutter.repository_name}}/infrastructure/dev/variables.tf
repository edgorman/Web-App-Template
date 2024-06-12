variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "{{cookiecutter.gcp_region_dev}}"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "{{cookiecutter.gcp_cluster_name}}"
}

variable "frontend_image" {
  description = "Node frontend Docker image"
  type        = string
  default     = "{{cookiecutter.frontend_image_name}}:{{cookiecutter.dev_image_tag}}"
}

variable "frontend_port" {
  description = "Port for frontend"
  type        = string
  default     = "{{cookiecutter.frontend_port}}"
}

variable "backend_image" {
  description = "Python backend Docker image"
  type        = string
  default     = "{{cookiecutter.backend_image_name}}:{{cookiecutter.dev_image_tag}}"
}

variable "backend_port" {
  description = "Port for backend"
  type        = string
  default     = "{{cookiecutter.backend_port}}"
}
