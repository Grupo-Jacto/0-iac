<!-- BEGIN_TF_DOCS -->
# Módulo Vm AWS

[IAC](../../README.md) / [vm](../README.md) / **[GCP](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de Compute Engine vm's na GCP.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

module "vm_aws" {
  source = "github.com/paulosfjunior/iac/vm/gcp?ref=v1.0.0"
}

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.vm_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_service_account.service_account_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | Abreviação do ambiente. Valores suportados: `sbx` para sandbox, `dev` para desenvolvimento, `hml` para homologação e `prd` para produção. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID do projeto | `string` | `"ditie-devops"` | no |
| <a name="input_service_user_name"></a> [service\_user\_name](#input\_service\_user\_name) | Nome do usuario de serviço | `string` | `"my-su-compute-engine"` | no |
| <a name="input_source_ranges"></a> [source\_ranges](#input\_source\_ranges) | Ranges liberados para ingress na regra de firewall | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_use_service_user"></a> [use\_service\_user](#input\_use\_service\_user) | Ativa ou não a criação do usuario de serviço | `bool` | `true` | no |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Numero de instancias que deseja subir | `number` | `1` | no |
| <a name="input_vm_disk_interface"></a> [vm\_disk\_interface](#input\_vm\_disk\_interface) | Tipo do disco ssd utilizado, por padrao o NVME é o mais rapido e barato | `string` | `"NVME"` | no |
| <a name="input_vm_firewall_allow_ports"></a> [vm\_firewall\_allow\_ports](#input\_vm\_firewall\_allow\_ports) | Portas para liberação na regra de firewall, usar nos seguintes formatos: [22], [80, 443], and ['12345-12349'] | `list(number)` | <pre>[<br/>  80,<br/>  8080<br/>]</pre> | no |
| <a name="input_vm_firewall_allow_protocols"></a> [vm\_firewall\_allow\_protocols](#input\_vm\_firewall\_allow\_protocols) | Protocolos para liberação na regra de firewall, algumas opções de exemplo: ssh, tcp, udp, icmp, esp, ah, sctp, ipip, all | `string` | `"all"` | no |
| <a name="input_vm_firewall_name"></a> [vm\_firewall\_name](#input\_vm\_firewall\_name) | Nome do firewall para a vm | `string` | `"my-firewall-for-vm"` | no |
| <a name="input_vm_image"></a> [vm\_image](#input\_vm\_image) | Imagem a ser utilizada na vm com o formato aceito em 'https://cloud.google.com/compute/docs/images#gcloud' | `string` | `"ubuntu-os-cloud/ubuntu-2004-lts"` | no |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | Tipo da instancia da vm, verifique todas as disponiveis em: https://cloud.google.com/compute/docs/machine-resource | `string` | `"e2-micro"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Nome da vm: <br/>- letras minúsculas<br/>- número<br/>- hifén. | `string` | `"my-vm"` | no |
| <a name="input_vm_network_interface"></a> [vm\_network\_interface](#input\_vm\_network\_interface) | Configurações da interface de rede da vm | `string` | `"default"` | no |
| <a name="input_vm_service_account_scopes"></a> [vm\_service\_account\_scopes](#input\_vm\_service\_account\_scopes) | Permissao do usuario de serviço a apis da Google cloud. 'cloud-platform' por padrão com acesso a ALL Api's. Veja as opções em:<br/> https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_vm_zone"></a> [vm\_zone](#input\_vm\_zone) | Zona de disponibilidade da vm, consulte todas as zonas disponiveis em: https://cloud.google.com/compute/docs/regions-zones | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_user"></a> [service\_user](#output\_service\_user) | Dados do usuario de serviço |
| <a name="output_service_user_vm_id"></a> [service\_user\_vm\_id](#output\_service\_user\_vm\_id) | ID do usuario de serviço pra vm |
| <a name="output_service_user_vm_name"></a> [service\_user\_vm\_name](#output\_service\_user\_vm\_name) | Nome do usuario de serviço para a vm |
| <a name="output_vm"></a> [vm](#output\_vm) | Dados da vm |
| <a name="output_vm_firewall_allow_ports"></a> [vm\_firewall\_allow\_ports](#output\_vm\_firewall\_allow\_ports) | Portas liberadas na regra de firewall para a vm |
| <a name="output_vm_firewall_allowed_protocol"></a> [vm\_firewall\_allowed\_protocol](#output\_vm\_firewall\_allowed\_protocol) | Protocolos liberados para a regra da vm |
| <a name="output_vm_firewall_id"></a> [vm\_firewall\_id](#output\_vm\_firewall\_id) | ID da regra de firewall para a vm |
| <a name="output_vm_firewall_name"></a> [vm\_firewall\_name](#output\_vm\_firewall\_name) | Nome da regra de firewall para a vm |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | ID da vm |
| <a name="output_vm_image"></a> [vm\_image](#output\_vm\_image) | Imagem sendo usada na vm |
| <a name="output_vm_machine_type"></a> [vm\_machine\_type](#output\_vm\_machine\_type) | Tipo da instancia sendo usada na vm |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | Nome da vm |
| <a name="output_vm_private_ip"></a> [vm\_private\_ip](#output\_vm\_private\_ip) | Ip privado da vm |
| <a name="output_vm_zone"></a> [vm\_zone](#output\_vm\_zone) | Zona da vm |
<!-- END_TF_DOCS -->