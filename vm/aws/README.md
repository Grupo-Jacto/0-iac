# Módulo VM AWS

[IAC](../../README.md) / [VM](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de Vm's Ec2 na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

module "vm_aws" {
  source = "github.com/paulosfjunior/iac/vm/aws?ref=v1.0.0"

  name = "single-instance"
}

## Inputs

| Name | Description       | Type     | Default | Required |
| ---- | ----------------- | -------- | ------- | :------: |
| most_recent | Filtra a AMI mais recente | `bool` | n/a     |   yes    |
| filter.name | Nome da imagem para busca | `string` | n/a     |   yes    |
| filter.values | Caminho da imagem para busca | `string` | n/a     |   yes    |
| vm_name | Nome da vm | `string` | n/a     |   yes    |
| count | Quantidade de vm que deseja subir | `number` | n/a     |   no    |
| key_name | Nome da chave de acesso para vm | `string` | n/a     |   no    |
| instance_type | Tipo de instancia da vm | `string` | n/a     |   yes    |
| associate_public_ip_address | Associar um ip publico na vm | `bool` | n/a     |   no    |
| availability_zone | Zona de disponibilidade para replicar a vm | `string` | n/a     |   no    |
| subnet_id | Subnets para associar a vm | `list(string)` | n/a     |   yes    |
| key_name | Nome da chave de acesso para a vm | `string` | n/a     |   yes    |
| public_key | Chave publica da chave de acesso a vm | `string` | n/a     |   yes    |


## Outputs

| Name                    | Description                         | Type     |
| ----------------------- | ----------------------------------- | -------- |
| resource_vm | Dados do recurso da VM. | `object` |
| resource_vm_key_pair | Dados do recurso da Chave de acesso da VM. | `object` |
| vm_id | ID da VM. | `string` |
| vm_region | Região da VM. | `string` |
| vm_name | Nome da VM. | `string` |
| vm_arn | Arn da VM. | `string` |
| vm_instance_type | Instance Type da VM | `string` |
| vm_ami_name | Nome da imagem da VM | `string` |
| vm_private_ip | Ip privado da VM | `string` |
| vm_public_ip | Ip publico da VM | `string` |
| vm_subnet_attached | Subnets associadas a VM | `string` |
| vm_keypair_id | ID da chave de acesso a VM | `string` |
| vm_keypair_name | Nome da chave de acesso a VM | `string` |