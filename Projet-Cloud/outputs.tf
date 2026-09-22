output "storage_name" {
  description = "Nom du bucket S3 créé par le module S3"
  value       = module.s3.bucket_id
}

output "storage_arn" {
  description = "ARN du bucket S3"
  value       = module.s3.bucket_arn
}

output "database_name" {
  description = "Nom de la table DynamoDB créée par le module DynamoDB"
  value       = module.dynamodb.table_name
}

output "database_arn" {
  description = "ARN de la table DynamoDB"
  value       = module.dynamodb.table_arn
}
