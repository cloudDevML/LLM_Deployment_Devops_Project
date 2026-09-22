output "table_name" {
  description = "Nom de la table DynamoDB"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "ARN de la table DynamoDB"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "ID de la table DynamoDB"
  value       = aws_dynamodb_table.this.id
}
