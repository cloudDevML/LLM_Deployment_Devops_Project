resource "aws_dynamodb_table" "this" {
  name         = "${var.name}-table"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  tags = merge(var.tags, {
    Name        = "${var.name}-table"
    Service     = "DynamoDB"
    Environment = var.environment
  })
}
