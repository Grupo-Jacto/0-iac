# Módulo Storage AWS

[IAC](../../README.md) / [Storage](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de S3 buckets na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

module "storage_aws" {
  source = "github.com/paulosfjunior/iac/storage/aws?ref=v1.0.0"

  bucket = <YOUR_BUCKET_NAME>
}

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.service-user-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.grant-storage-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.service-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.grant-users-access-storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [local_file.storage-account-key-export](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | ID da sua conta AWS | `number` | n/a | yes |
| <a name="input_iam_policy_action"></a> [iam\_policy\_action](#input\_iam\_policy\_action) | Ação na política | `list(string)` | <pre>[<br/>  "s3:*"<br/>]</pre> | no |
| <a name="input_iam_policy_effect"></a> [iam\_policy\_effect](#input\_iam\_policy\_effect) | Efeito na política | `list(string)` | <pre>[<br/>  "Allow"<br/>]</pre> | no |
| <a name="input_iam_user_name"></a> [iam\_user\_name](#input\_iam\_user\_name) | Nome do usuário | `string` | `"my-user"` | no |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | Usuários para conceder acesso ao bucket storage | `list(string)` | <pre>[<br/>  null<br/>]</pre> | no |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | Ambiente do seu projeto. Ex: prd,prod,dev,hml,homol | `string` | `"prod"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do seu projeto | `string` | `"my-project"` | no |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | Região do seu projeto | `string` | `"us-east-1"` | no |
| <a name="input_storage_activate_user_creation"></a> [storage\_activate\_user\_creation](#input\_storage\_activate\_user\_creation) | Ativar criação de usuário | `bool` | `true` | no |
| <a name="input_storage_allowed_headers"></a> [storage\_allowed\_headers](#input\_storage\_allowed\_headers) | Conjunto de cabeçalhos especificados no cabeçalho Access-Control-Request-Headers | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_storage_allowed_methods"></a> [storage\_allowed\_methods](#input\_storage\_allowed\_methods) | Conjunto de métodos HTTP que você permite que a origem execute. Valores válidos são GET, PUT, HEAD, POST e DELETE | `list(string)` | <pre>[<br/>  "GET",<br/>  "PUT",<br/>  "POST",<br/>  "DELETE"<br/>]</pre> | no |
| <a name="input_storage_allowed_origins"></a> [storage\_allowed\_origins](#input\_storage\_allowed\_origins) | Conjunto de origens que você deseja permitir que os clientes acessem o bucket | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_storage_error_index"></a> [storage\_error\_index](#input\_storage\_error\_index) | Índice de erro do seu site | `string` | `"error.html"` | no |
| <a name="input_storage_expose_headers"></a> [storage\_expose\_headers](#input\_storage\_expose\_headers) | Conjunto de cabeçalhos na resposta que você deseja que os clientes possam acessar de suas aplicações | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_storage_force_destroy"></a> [storage\_force\_destroy](#input\_storage\_force\_destroy) | Forçar destruição do seu storage | `bool` | `false` | no |
| <a name="input_storage_index"></a> [storage\_index](#input\_storage\_index) | Índice do seu site | `string` | `"index.html"` | no |
| <a name="input_storage_lifecycle_rule"></a> [storage\_lifecycle\_rule](#input\_storage\_lifecycle\_rule) | Regra de ciclo de vida para modificações no seu bucket | `bool` | `false` | no |
| <a name="input_storage_objects_expiration_days"></a> [storage\_objects\_expiration\_days](#input\_storage\_objects\_expiration\_days) | Dias para expiração da transição | `number` | `0` | no |
| <a name="input_storage_objects_transition_days"></a> [storage\_objects\_transition\_days](#input\_storage\_objects\_transition\_days) | Dias para transição de objetos | `number` | `60` | no |
| <a name="input_storage_target_prefix"></a> [storage\_target\_prefix](#input\_storage\_target\_prefix) | Para especificar um prefixo de chave para objetos de log. | `string` | `"log/"` | no |
| <a name="input_storage_versioning_enabled"></a> [storage\_versioning\_enabled](#input\_storage\_versioning\_enabled) | Ativar versionamento dos objetos no bucket | `bool` | `false` | no |
| <a name="input_storage_website"></a> [storage\_website](#input\_storage\_website) | Habilitar bucket como site | `bool` | `false` | no |
| <a name="input_transition_storage_class"></a> [transition\_storage\_class](#input\_transition\_storage\_class) | Classe de armazenamento para transição -> STANDARD \| GLACIER \| STANDARD\_IA \| ONEZONE\_IA \| INTELLIGENT\_TIERING \| DEEP\_ARCHIVE \| GLACIER\_IR | `string` | `"STANDARD_IA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_count_users_atached_on_storage_policy"></a> [count\_users\_atached\_on\_storage\_policy](#output\_count\_users\_atached\_on\_storage\_policy) | Quantidade de usuarios com acesso ao Storage Bucket |
| <a name="output_iam_storage_service_user_arn"></a> [iam\_storage\_service\_user\_arn](#output\_iam\_storage\_service\_user\_arn) | Arn do usuario de servico com acesso ao Storage Bucket |
| <a name="output_iam_storage_service_user_key"></a> [iam\_storage\_service\_user\_key](#output\_iam\_storage\_service\_user\_key) | Chave de usuario do usuario de servico |
| <a name="output_resource_bucket_storage"></a> [resource\_bucket\_storage](#output\_resource\_bucket\_storage) | Dados do Storage Bucket |
| <a name="output_resource_bucket_storage_iam"></a> [resource\_bucket\_storage\_iam](#output\_resource\_bucket\_storage\_iam) | Politicas de acesso ao storage bucket |
| <a name="output_storage_arn"></a> [storage\_arn](#output\_storage\_arn) | Arn do Storage bucket |
| <a name="output_storage_id"></a> [storage\_id](#output\_storage\_id) | Id do Storage Bucket |
| <a name="output_storage_name"></a> [storage\_name](#output\_storage\_name) | Nome do Storage Bucket |
| <a name="output_storage_object_class"></a> [storage\_object\_class](#output\_storage\_object\_class) | Tipo de classe para objetos do Storage Bucket |
| <a name="output_storage_policy"></a> [storage\_policy](#output\_storage\_policy) | Nome da politica de acesso ao Storage Bucket |
| <a name="output_storage_region"></a> [storage\_region](#output\_storage\_region) | Regiao do Storage Bucket |
| <a name="output_storage_service_user_name"></a> [storage\_service\_user\_name](#output\_storage\_service\_user\_name) | Nome do usuario de servico com acesso ao Sotrage Bucket |
| <a name="output_users_with_permission_on_this_storage"></a> [users\_with\_permission\_on\_this\_storage](#output\_users\_with\_permission\_on\_this\_storage) | Nome dos usuarios com acesso ao Storage Bucket |
<!-- END_TF_DOCS -->