resource "aws_s3_bucket" "this" {
  bucket        = "${var.name}-bucket"
  force_destroy = var.force_destroy

  tags = merge(var.tags, {
    Name        = "${var.name}-bucket"
    Service     = "S3"
    Environment = var.environment
  })
}
