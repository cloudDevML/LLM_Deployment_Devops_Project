module "s3" {
  source = "./modules/s3"

  name        = local.resource_prefix
  environment = var.environment
  tags        = local.common_tags
}

module "dynamodb" {
  source = "./modules/dynamodb"

  name        = local.resource_prefix
  environment = var.environment
  tags        = local.common_tags
}
