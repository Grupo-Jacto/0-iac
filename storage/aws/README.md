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

## Inputs

| Name | Description       | Type     | Default | Required |
| ---- | ----------------- | -------- | ------- | :------: |
| bucket | Nome do bucket S3 | `string` | n/a     |   yes    |
| force_destroy | Força a destruicao do seu storage | `bool` | n/a     |   no    |
| storage_lifecycle_rule | Ativa regra de ciclo de vida para modificações no seu bucket | `bool` | n/a     |   no    |
| transition_storage_class | Classe de armazenamento para transição | `string` | n/a     |   no    |
| storage_objects_transition_days | Dias para transição de objetos | `number` | n/a     |   no    |
| storage_objects_expiration_days | Dias para expiração da transição | `number` | n/a     |   no    |
| storage_allowed_headers | Conjunto de cabeçalhos especificados no cabeçalho Access-Control-Request-Headers | `list(string)` | n/a     |   no    |
| storage_allowed_methods | Conjunto de métodos HTTP que você permite que a origem execute. | `list(string)` | n/a     |   no    |
| storage_allowed_origins | Conjunto de origens que você deseja permitir que os clientes acessem o bucket | `list(string)` | n/a     |   no    |
| storage_expose_headers | Conjunto de cabeçalhos na resposta que você deseja que os clientes possam acessar de suas aplicações | `list(string)` | n/a     |   no    |
| storage_target_prefix | Para especificar um prefixo de chave para objetos de log | `string` | n/a     |   no    |
| storage_versioning_enabled | Ativar versionamento no bucket | `bool` | n/a     |   no    |
| storage_website | Habilitar bucket como site | `bool` | n/a     |   no    |
| storage_index | Índice do seu site | `string` | n/a     |   no    |
| storage_error_index | Índice de erro do seu site | `string` | n/a     |   no    |
| storage_activate_user_creation | Ativar criação de usuário | `bool` | n/a     |   no    |
| iam_user_name | Nome do usuário | `string` | n/a     |   no    |
| iam_users | Usuários para conceder acesso ao storage | `list(string)` | n/a     |   no    |
| iam_policy_action | Ação na política | `list(string)` | n/a     |   no    |
| iam_policy_effect | Efeito na política | `list(string)` | n/a     |   no    |

## Outputs

| Name                    | Description                         | Type     |
| ----------------------- | ----------------------------------- | -------- |
| resource_storage_name | Dados do recurso do Bucket Storage. | `object` |
| resource_iam_policy | Dados do recurso do Iam policy. | `object` |
| storage_id | ID do storage | `string` |
| storage_region | Regiao do storage | `string` |
| storage_name | Nome do storage | `string` |
| storage_arn | Arn do storage | `string` |
| storage_object_class | Classe de armazenamento dos objetos no storage | `string` |
| storage_policy | Nome da politica objetos no storage | `string` |
| storage_service_user_name | Nome do usuario de serviço do storage | `string` |
| iam_storage_service_user_arn | Arn do usuario de serviço do storage | `string` |
| iam_storage_service_user_key | Key do usuario de serviço do storage | `string` |
| count_users_atached_on_storage_policy | Quantidade de usuarios de serviço com acesso ao storage | `number` |
| users_with_permission_on_this_storage | Nome dos usuarios de serviço com acesso ao storage | `list(string)` |