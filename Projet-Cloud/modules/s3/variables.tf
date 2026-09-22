variable "name" {
  type        = string
  description = "Préfixe du nom du bucket S3"

  validation {
    condition     = length(var.name) > 0
    error_message = "Le nom du bucket ne peut pas être vide."
  }
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement"
  default     = "dev"
}

variable "force_destroy" {
  type        = bool
  description = "Permet la suppression du bucket même s'il contient des objets"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags associés aux ressources S3"
  default     = {}
}
