variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "image_env_tag" {
  description = "The image tag to use for dev/prod environment"
  type        = string
}

variable "github_webhook_secret" {
  description = "The webhook secret for connecting to GitHub"
  type        = string
}

variable "github_repo_url" {
  description = "The url of the GitHub repository"
  type        = string
  default     = "https://github.com/{{cookiecutter.repository_owner}}/{{cookiecutter.repository_name}}"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "{{cookiecutter.gcp_region}}"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "{{cookiecutter.gcp_cluster_name}}"
}

variable "{{cookiecutter.frontend_name}}_image" {
  description = "Node {{cookiecutter.frontend_name}} Docker image"
  type        = string
  default     = "{{cookiecutter.frontend_image_name}}"
}

variable "{{cookiecutter.frontend_name}}_port" {
  description = "Port for {{cookiecutter.frontend_name}}"
  type        = string
  default     = "{{cookiecutter.frontend_port}}"
}

variable "{{cookiecutter.backend_name}}_image" {
  description = "Python {{cookiecutter.backend_name}} Docker image"
  type        = string
  default     = "{{cookiecutter.backend_image_name}}"
}

variable "{{cookiecutter.backend_name}}_port" {
  description = "Port for {{cookiecutter.backend_name}}"
  type        = string
  default     = "{{cookiecutter.backend_port}}"
}

variable "machine_type" {
  description = "Type of machine for services"
  type        = string
  default     = "e2-micro"
}
