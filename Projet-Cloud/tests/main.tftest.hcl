run "verify_dev_deployment" {
  command = plan

  variables {
    project_name = "test-project"
    environment  = "dev"
  }

  assert {
    condition     = module.s3.bucket_id == "test-project-dev-bucket"
    error_message = "Le nom du bucket S3 calculé est incorrect."
  }

  assert {
    condition     = module.dynamodb.table_name == "test-project-dev-table"
    error_message = "Le nom de la table DynamoDB calculé est incorrect."
  }
}
