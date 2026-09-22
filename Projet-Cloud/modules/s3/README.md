## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environnement de déploiement | `string` | `"dev"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Permet la suppression du bucket même s'il contient des objets | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Préfixe du nom du bucket S3 | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags associés aux ressources S3 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN du bucket S3 |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Identifiant (nom) du bucket S3 |
