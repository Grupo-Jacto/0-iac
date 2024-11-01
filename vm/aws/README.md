<!-- BEGIN_TF_DOCS -->
# Módulo Vm AWS

[IAC](../../README.md) / [vm](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de Ec2 vm's na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

module "vm_aws" {
  source = "github.com/paulosfjunior/iac/vm/aws?ref=v1.0.0"
}

## Resources

| Name | Type |
|------|------|
| [aws_instance.vm-instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.vm-instance-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_ami.choose_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Associate public ip on Ec2 | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Região do seu projeto | `string` | `"us-east-1"` | no |
| <a name="input_filter_ami_name"></a> [filter\_ami\_name](#input\_filter\_ami\_name) | Qual o tipo de filtro esta sendo feito, no caso padrão: 'name' | `string` | `"name"` | no |
| <a name="input_filter_ami_path"></a> [filter\_ami\_path](#input\_filter\_ami\_path) | Path for ami installation | `list(string)` | <pre>[<br/>  "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"<br/>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Tipo da instancia para a vm | `string` | `"t3a.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name to access your ec2 instance | `string` | `"my-key-pair"` | no |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | Ambiente do seu projeto. Ex: prd,prod,dev,hml,homol | `string` | `"prd"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do seu projeto | `string` | `"my-project"` | no |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | Região do seu projeto | `string` | `"us-east-1"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Public key for instance key | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of subnet to launch ec2 | `string` | `""` | no |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Quantidade de vms que precisa subir | `number` | `1` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Nome da vm | `string` | `"my-vm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_vm_key_pair"></a> [resource\_vm\_key\_pair](#output\_resource\_vm\_key\_pair) | Informacoes da keypair usada na(s) vm('s) |
| <a name="output_vm_ami_name"></a> [vm\_ami\_name](#output\_vm\_ami\_name) | n/a |
| <a name="output_vm_arn"></a> [vm\_arn](#output\_vm\_arn) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_info"></a> [vm\_info](#output\_vm\_info) | n/a |
| <a name="output_vm_instance_type"></a> [vm\_instance\_type](#output\_vm\_instance\_type) | n/a |
| <a name="output_vm_keypair_id"></a> [vm\_keypair\_id](#output\_vm\_keypair\_id) | n/a |
| <a name="output_vm_keypair_name"></a> [vm\_keypair\_name](#output\_vm\_keypair\_name) | n/a |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | n/a |
| <a name="output_vm_private_ip"></a> [vm\_private\_ip](#output\_vm\_private\_ip) | n/a |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | n/a |
| <a name="output_vm_region"></a> [vm\_region](#output\_vm\_region) | n/a |
| <a name="output_vm_subnet_attached"></a> [vm\_subnet\_attached](#output\_vm\_subnet\_attached) | n/a |
<!-- END_TF_DOCS -->