variable "project_name" {
  type        = string
  description = "Nom du projet utilisé pour le préfixage des ressources"
  default     = "cloud-project"

  validation {
    condition     = length(var.project_name) >= 3 && can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Le nom du projet doit comporter au moins 3 caractères et ne contenir que des minuscules, des chiffres et des tirets."
  }
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement (dev, staging, prod)"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "L'environnement doit être 'dev', 'staging' ou 'prod'."
  }
}

variable "aws_region" {
  type        = string
  description = "Région AWS simulée pour Floci"
  default     = "us-east-1"
}

variable "floci_endpoint" {
  type        = string
  description = "URL de l'endpoint local Floci"
  default     = "http://localhost:4566"
}
