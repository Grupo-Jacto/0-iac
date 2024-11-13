# Módulo Database AWS

[IAC](../../README.md) / [db](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de RDS na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

module "storage_aws" {
  source = "github.com/Grupo-Jacto/iac/db/aws?ref=v1.0.0"
}
## Resources

| Name | Type |
|------|------|
| [aws_db_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_rds_cluster.db_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.db_cluster_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | Quantidade de storage a ser utilizado | `number` | `25` | no |
| <a name="input_db_availability_zone"></a> [db\_availability\_zone](#input\_db\_availability\_zone) | Zonas de disponibilidade para o banco de dados (Ex: 'us-east-1a','us-east-1b','us-east-1c','us-east-1d' ou 'us-west-1a','us-west-1b','us-west-1c','us-west-1d') | `string` | `"us-east-1a"` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | Tempo de retenção de backup do banco de dados em dias | `number` | `7` | no |
| <a name="input_db_cluster_availability_zones"></a> [db\_cluster\_availability\_zones](#input\_db\_cluster\_availability\_zones) | Zonas de disponibilidade para o banco de dados (Ex: 'us-east-1a','us-east-1b','us-east-1c','us-east-1d' ou 'us-west-1a','us-west-1b','us-west-1c','us-west-1d') | `list(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b",<br/>  "us-east-1c"<br/>]</pre> | no |
| <a name="input_db_cluster_count_instances"></a> [db\_cluster\_count\_instances](#input\_db\_cluster\_count\_instances) | Quantidade de instancias para o cluster | `number` | `1` | no |
| <a name="input_db_cluster_preferred_backup_window"></a> [db\_cluster\_preferred\_backup\_window](#input\_db\_cluster\_preferred\_backup\_window) | Intervalo de tempo para executar o backup caso esteja ativo (ex: '07:00-09:00'AM) | `string` | `"07:00-09:00"` | no |
| <a name="input_db_database_name"></a> [db\_database\_name](#input\_db\_database\_name) | Nome do database dentro do banco de dados | `string` | `"my-db"` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Engine do banco de dados selecionado (Mysql, Postgresql, Oracle ou Sql Server) | `string` | `"postgres"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Versão da engine (Ex: mysql -> 8.x - 5.x \| postgresql -> 16.x e etc) | `string` | `"16.3"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | Instancia do banco de dados | `string` | `"db.t4g.medium"` | no |
| <a name="input_db_multi_az"></a> [db\_multi\_az](#input\_db\_multi\_az) | Ativar mais zonas de disponibilidade para o banco de dados | `bool` | `false` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Senha do usuario root do banco de dados | `string` | `"}8ky9#V-mS]F~jb]t7'&"` | no |
| <a name="input_db_resource_type"></a> [db\_resource\_type](#input\_db\_resource\_type) | Tipo de recurso a ser criado ('db' -> para bancos Mysql, Postgresql, Oracle ou Sql Server \| 'db\_cluster' para bancos Aurora MySql e Aurora Postgresql) | `string` | `"db"` | no |
| <a name="input_db_skip_final_snapshot"></a> [db\_skip\_final\_snapshot](#input\_db\_skip\_final\_snapshot) | Pular a criação do backup final ao destruir o banco de dados | `bool` | `true` | no |
| <a name="input_db_storage_encrypted"></a> [db\_storage\_encrypted](#input\_db\_storage\_encrypted) | Ativar a criptografia de storage | `bool` | `true` | no |
| <a name="input_db_timeout_create"></a> [db\_timeout\_create](#input\_db\_timeout\_create) | Tempo para executar um create em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas) | `string` | `"0s"` | no |
| <a name="input_db_timeout_delete"></a> [db\_timeout\_delete](#input\_db\_timeout\_delete) | Tempo para executar um delete em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas) | `string` | `"0s"` | no |
| <a name="input_db_timeout_update"></a> [db\_timeout\_update](#input\_db\_timeout\_update) | Tempo para executar um update em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas) | `string` | `"0s"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Nome do usuario root do banco de dados | `string` | `"root"` | no |
| <a name="input_pg_family"></a> [pg\_family](#input\_pg\_family) | Familia de parametros da engine escolhida no banco de dados | `string` | `"postgres16"` | no |
| <a name="input_pg_name"></a> [pg\_name](#input\_pg\_name) | Nome do grupo de parametros | `string` | `"my-parameter-group"` | no |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | Ambiente do seu projeto. Ex: prd,prod,dev,hml,homol | `string` | `"prd"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do seu projeto | `string` | `"my-project"` | no |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | Região do seu projeto | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db"></a> [db](#output\_db) | Dados - Banco de dados(RDS) |
| <a name="output_db_allocated_storage"></a> [db\_allocated\_storage](#output\_db\_allocated\_storage) | Espaço em disco alocado para o banco de dados |
| <a name="output_db_availability_zone"></a> [db\_availability\_zone](#output\_db\_availability\_zone) | Zonas de disponibilidade do banco de dados |
| <a name="output_db_backup_retention_period"></a> [db\_backup\_retention\_period](#output\_db\_backup\_retention\_period) | Tempo de retenção de backup do banco de dados |
| <a name="output_db_cluster"></a> [db\_cluster](#output\_db\_cluster) | Dados - Cluster banco de dados(RDS Cluster) |
| <a name="output_db_cluster_instance"></a> [db\_cluster\_instance](#output\_db\_cluster\_instance) | n/a |
| <a name="output_db_engine"></a> [db\_engine](#output\_db\_engine) | Engine do banco de dados |
| <a name="output_db_instance_class"></a> [db\_instance\_class](#output\_db\_instance\_class) | Tipo da instancia do banco de dados |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Nome da instancia do banco de dados |
| <a name="output_db_parameter_group"></a> [db\_parameter\_group](#output\_db\_parameter\_group) | Dados - Grupo de parametros do banco de dados |
| <a name="output_db_skip_final_snapshot"></a> [db\_skip\_final\_snapshot](#output\_db\_skip\_final\_snapshot) | Pular imagem final do banco de dados |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | Grupo de subnets do banco de dados |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | Nome do usuario root do banco de dados |
<!-- END_TF_DOCS -->