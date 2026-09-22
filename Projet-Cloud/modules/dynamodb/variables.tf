variable "name" {
  type        = string
  description = "Préfixe du nom de la table DynamoDB"

  validation {
    condition     = length(var.name) > 0
    error_message = "Le nom de la table ne peut pas être vide."
  }
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement"
  default     = "dev"
}

variable "billing_mode" {
  type        = string
  description = "Mode de facturation DynamoDB (PAY_PER_REQUEST ou PROVISIONED)"
  default     = "PAY_PER_REQUEST"

  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.billing_mode)
    error_message = "Le billing_mode doit être 'PAY_PER_REQUEST' ou 'PROVISIONED'."
  }
}

variable "hash_key" {
  type        = string
  description = "Nom de la clé de partition (hash key)"
  default     = "id"
}

variable "hash_key_type" {
  type        = string
  description = "Type de la clé de partition (S, N, B)"
  default     = "S"

  validation {
    condition     = contains(["S", "N", "B"], var.hash_key_type)
    error_message = "Le hash_key_type doit être 'S' (string), 'N' (number) ou 'B' (binary)."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags associés à la table DynamoDB"
  default     = {}
}
