# Módulos IAC para recursos na GCP

[IAC](../README.md) / **[GCP](./README.md)**

Módulos de infraestrutura como código (IAC) para provisionamento de recursos na GCP.

## Módulos

### [**SQL e AlloyDB**](../db/gcp/README.md)

Módulo para provisionamento de SQL e AlloyDB na GCP.

- **Requisitos**: [Lista de Requisitos](../storage/gcp/README.md#requisitos)
- **Inputs**: [Lista de Inputs](../storage/gcp/README.md#inputs)
- **Outputs**: [Lista de Outputs](../storage/gcp/README.md#outputs)
- **Uso**:

```hcl
  module "db_gcp" {
    source = "github.com/paulosfjunior/iac/db/gcp?ref=v1.0.0"
    // ... parâmetros
  }
```

### [**VPC**](../vpc/gcp/README.md)

Módulo para provisionamento de VPC na GCP.

- **Requisitos**: [Lista de Requisitos](../vpc/gcp/README.md#requisitos)
- **Inputs**: [Lista de Inputs](../vpc/gcp/README.md#inputs)
- **Outputs**: [Lista de Outputs](../vpc/gcp/README.md#outputs)
- **Uso**:

```hcl
  module "vpc_gcp" {
    source = "github.com/paulosfjunior/iac/vpc/gcp?ref=v1.0.0"
    // ... parâmetros
  }
```

## Versões

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.22, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.44.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_alloydb_cluster.db_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_cluster) | resource |
| [google_alloydb_instance.db_cluster_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_instance) | resource |
| [google_alloydb_user.db_cluster_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_user) | resource |
| [google_compute_network.db_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_sql_database.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_ssl_cert.db_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert) | resource |
| [google_sql_user.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_choose_db"></a> [choose\_db](#input\_choose\_db) | Seleção do tipo de banco de dados que deseja criar | `string` | `"db"` | no |
| <a name="input_db_certificate"></a> [db\_certificate](#input\_db\_certificate) | Cria um certificado ssl para o db | `bool` | `true` | no |
| <a name="input_db_certificate_name"></a> [db\_certificate\_name](#input\_db\_certificate\_name) | Nome do certificado SSL pro banco de dados | `string` | `"my-cert"` | no |
| <a name="input_db_cluster_instance_name"></a> [db\_cluster\_instance\_name](#input\_db\_cluster\_instance\_name) | Nome da instancia do cluster de banco dados | `string` | `"my_db_instance"` | no |
| <a name="input_db_cluster_instance_type"></a> [db\_cluster\_instance\_type](#input\_db\_cluster\_instance\_type) | Tipo de instancia usada no cluster, consulte em:https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_instance | `string` | `"PRIMARY"` | no |
| <a name="input_db_cluster_user_role"></a> [db\_cluster\_user\_role](#input\_db\_cluster\_user\_role) | Role para liberar acesso do usuario ao cluster de banco de dados | `list(string)` | <pre>[<br/>  "alloydbsuperuser"<br/>]</pre> | no |
| <a name="input_db_cluster_user_type"></a> [db\_cluster\_user\_type](#input\_db\_cluster\_user\_type) | Tipo de usuario para o db cluster:<br/>Use ALLOYDB\_BUILT\_IN para criar usuários que serão gerenciados exclusivamente dentro do AlloyDB.<br/>Use ALLOYDB\_IAM\_USER para criar usuários que serão gerenciados pelo IAM e podem precisar acessar outros serviços do Google Cloud. | `string` | `"ALLOYDB_BUILT_IN"` | no |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Ativa a proteção contra deleção do db | `bool` | `true` | no |
| <a name="input_db_disk_size"></a> [db\_disk\_size](#input\_db\_disk\_size) | Tamanho do disco para o banco de dados | `number` | `10` | no |
| <a name="input_db_instance_name"></a> [db\_instance\_name](#input\_db\_instance\_name) | Nome da instancia do banco de dados | `string` | `"my-instance"` | no |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | Tipo de instancia do db | `string` | `"db-f1-micro"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Nome do banco de dados | `string` | `"my-db"` | no |
| <a name="input_db_region"></a> [db\_region](#input\_db\_region) | Regiao para a instancia do banco de dados | `string` | `"us-central1"` | no |
| <a name="input_db_user_name"></a> [db\_user\_name](#input\_db\_user\_name) | Nome do usuario do banco de dados | `string` | `"root"` | no |
| <a name="input_db_version_engine"></a> [db\_version\_engine](#input\_db\_version\_engine) | Versao da engine do rds usada, veja as opções em 'https://cloud.google.com/sql/docs/db-versions?hl=pt-br' | `string` | `"POSTGRES_16"` | no |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | Abreviação do ambiente. Valores suportados: `sbx` para sandbox, `dev` para desenvolvimento, `hml` para homologação e `prd` para produção. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID do projeto | `string` | `"ditie-devops"` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | Quantidade de caracteres para o valor randomico | `number` | `16` | no |
| <a name="input_random_password_override_special"></a> [random\_password\_override\_special](#input\_random\_password\_override\_special) | Define quais caracteres especiais usar na geração do valor aleatorio | `string` | `"!#$%&*()-+"` | no |
| <a name="input_random_password_special"></a> [random\_password\_special](#input\_random\_password\_special) | Inclui caracteres especiais na senha | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db"></a> [db](#output\_db) | Dados - Banco de dados(Cloud SQL) |
| <a name="output_db_certificate_id"></a> [db\_certificate\_id](#output\_db\_certificate\_id) | ID do certificado do banco de dados |
| <a name="output_db_certificate_name"></a> [db\_certificate\_name](#output\_db\_certificate\_name) | Nome do certificado do banco de dados |
| <a name="output_db_cluster"></a> [db\_cluster](#output\_db\_cluster) | Dados - Cluster(AlloyDB) |
| <a name="output_db_cluster_instance"></a> [db\_cluster\_instance](#output\_db\_cluster\_instance) | Dados - Instancia do Cluster(AlloyDB) |
| <a name="output_db_database_engine"></a> [db\_database\_engine](#output\_db\_database\_engine) | Engine do banco de dados |
| <a name="output_db_deletion_protection"></a> [db\_deletion\_protection](#output\_db\_deletion\_protection) | Proteção contra destruição pro banco de dados |
| <a name="output_db_id"></a> [db\_id](#output\_db\_id) | ID do banco de dados |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Nome do banco de dados |
| <a name="output_db_region"></a> [db\_region](#output\_db\_region) | Regiao do banco de dados |
| <a name="output_db_user_id"></a> [db\_user\_id](#output\_db\_user\_id) | ID do usuario do banco de dados |
| <a name="output_db_user_name"></a> [db\_user\_name](#output\_db\_user\_name) | Nome do usuario do banco de dados |
| <a name="output_db_user_password"></a> [db\_user\_password](#output\_db\_user\_password) | Senha do usuario do banco de dados |
<!-- END_TF_DOCS -->