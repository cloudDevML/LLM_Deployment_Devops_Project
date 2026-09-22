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
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Mode de facturation DynamoDB (PAY\_PER\_REQUEST ou PROVISIONED) | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environnement de déploiement | `string` | `"dev"` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | Nom de la clé de partition (hash key) | `string` | `"id"` | no |
| <a name="input_hash_key_type"></a> [hash\_key\_type](#input\_hash\_key\_type) | Type de la clé de partition (S, N, B) | `string` | `"S"` | no |
| <a name="input_name"></a> [name](#input\_name) | Préfixe du nom de la table DynamoDB | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags associés à la table DynamoDB | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_table_arn"></a> [table\_arn](#output\_table\_arn) | ARN de la table DynamoDB |
| <a name="output_table_id"></a> [table\_id](#output\_table\_id) | ID de la table DynamoDB |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | Nom de la table DynamoDB |
