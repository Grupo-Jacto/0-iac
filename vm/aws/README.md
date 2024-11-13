# Módulo Virtual Machine AWS

[IAC](../../README.md) / [vm](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de EC2 na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

```hcl
module "vm_aws" {
  source = "github.com/Grupo-Jacto/iac/vm/aws?ref=v1.0.0"

  aws_account_id = "<ACCOUNT_ID>"
  project_name = "<PROJECT_NAME>"
  project_env = "<PROJECT_ENV>"
}
```

## Resources

| Name                                                                                                                 | Type        |
| -------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_instance.vm-instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)     | resource    |
| [aws_key_pair.vm-instance-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource    |
| [aws_ami.choose_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)             | data source |

## Inputs

| Name                | Description                                                    | Type           | Default                                                                                                                                                                                                                                                                                                                                                                                                            | Required |
| ------------------- | -------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: |
| associate_public_ip | Associate public ip on Ec2                                     | `bool`         | `true`                                                                                                                                                                                                                                                                                                                                                                                                             |    no    |
| availability_zones  | Região do seu projeto                                          | `string`       | `"us-east-1"`                                                                                                                                                                                                                                                                                                                                                                                                      |    no    |
| filter_ami_name     | Qual o tipo de filtro esta sendo feito, no caso padrão: 'name' | `string`       | `"name"`                                                                                                                                                                                                                                                                                                                                                                                                           |    no    |
| filter_ami_path     | Path for ami installation                                      | `list(string)` | `[ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" ]`                                                                                                                                                                                                                                                                                                                                                    |    no    |
| instance_type       | Tipo da instancia para a vm                                    | `string`       | `"t3a.micro"`                                                                                                                                                                                                                                                                                                                                                                                                      |    no    |
| key_name            | Key name to access your ec2 instance                           | `string`       | `"my-key-pair"`                                                                                                                                                                                                                                                                                                                                                                                                    |    no    |
| project_env         | Ambiente do seu projeto. Ex: prd,prod,dev,hml,homol            | `string`       | n/a                                                                                                                                                                                                                                                                                                                                                                                                                |   yes    |
| project_name        | Nome do seu projeto                                            | `string`       | n/a                                                                                                                                                                                                                                                                                                                                                                                                                |   yes    |
| project_region      | Região do seu projeto                                          | `string`       | `"us-east-1"`                                                                                                                                                                                                                                                                                                                                                                                                      |    no    |
| public_key          | Public key for instance key                                    | `string`       | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"` |    no    |
| subnet_id           | ID of subnet to launch ec2                                     | `string`       | `""`                                                                                                                                                                                                                                                                                                                                                                                                               |    no    |
| vm_count            | Quantidade de vms que precisa subir                            | `number`       | `1`                                                                                                                                                                                                                                                                                                                                                                                                                |    no    |
| vm_name             | Nome da vm                                                     | `string`       | `"my-vm"`                                                                                                                                                                                                                                                                                                                                                                                                          |    no    |

## Outputs

| Name                 | Description                               |
| -------------------- | ----------------------------------------- |
| resource_vm_key_pair | Informacoes da keypair usada na(s) vm('s) |
| vm_ami_name          | n/a                                       |
| vm_arn               | n/a                                       |
| vm_id                | n/a                                       |
| vm_info              | n/a                                       |
| vm_instance_type     | n/a                                       |
| vm_keypair_id        | n/a                                       |
| vm_keypair_name      | n/a                                       |
| vm_name              | n/a                                       |
| vm_private_ip        | n/a                                       |
| vm_public_ip         | n/a                                       |
| vm_region            | n/a                                       |
| vm_subnet_attached   | n/a                                       |

<!-- END_TF_DOCS -->
