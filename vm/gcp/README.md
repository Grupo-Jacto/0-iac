<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.vm_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_service_account.service_account_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | ID do projeto na GCP | `string` | n/a | yes |
| <a name="input_service_user_name"></a> [service\_user\_name](#input\_service\_user\_name) | Nome do usuario de serviço | `string` | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Numero de instancias que deseja subir | `number` | `1` | no |
| <a name="input_vm_disk_interface"></a> [vm\_disk\_interface](#input\_vm\_disk\_interface) | Tipo do disco ssd utilizado, por padrao o NVME é o mais rapido e barato | `string` | `"NVME"` | no |
| <a name="input_vm_firewall_allow_ports"></a> [vm\_firewall\_allow\_ports](#input\_vm\_firewall\_allow\_ports) | Portas para liberação na regra de firewall | `list(string)` | n/a | yes |
| <a name="input_vm_firewall_allow_protocols"></a> [vm\_firewall\_allow\_protocols](#input\_vm\_firewall\_allow\_protocols) | Protocolos para liberação na regra de firewall | `string` | n/a | yes |
| <a name="input_vm_firewall_name"></a> [vm\_firewall\_name](#input\_vm\_firewall\_name) | Nome do firewall para a vm | `string` | n/a | yes |
| <a name="input_vm_image"></a> [vm\_image](#input\_vm\_image) | Imagem a ser utilizada na vm com o formato aceito em 'https://cloud.google.com/compute/docs/images#gcloud' | `string` | `"ubuntu-os-cloud/ubuntu-2004-lts"` | no |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | Tipo da instancia da vm | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Nome da vm | `string` | n/a | yes |
| <a name="input_vm_network_interface"></a> [vm\_network\_interface](#input\_vm\_network\_interface) | Configurações da interface de rede da vm | `string` | `"default"` | no |
| <a name="input_vm_service_account_scopes"></a> [vm\_service\_account\_scopes](#input\_vm\_service\_account\_scopes) | Permissao do usuario de serviço a apis da Google cloud. 'cloud-platform' por padrão com acesso a ALL Api's | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_vm_tags"></a> [vm\_tags](#input\_vm\_tags) | Tags para associar recursos a vm. Ex: Firewall rules | `list(string)` | <pre>[<br/>  "Terraform"<br/>]</pre> | no |
| <a name="input_vm_zone"></a> [vm\_zone](#input\_vm\_zone) | Zona de disponibilidade da vm | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_user_vm_id"></a> [service\_user\_vm\_id](#output\_service\_user\_vm\_id) | n/a |
| <a name="output_service_user_vm_name"></a> [service\_user\_vm\_name](#output\_service\_user\_vm\_name) | n/a |
| <a name="output_vm_firewall_allow_ports"></a> [vm\_firewall\_allow\_ports](#output\_vm\_firewall\_allow\_ports) | n/a |
| <a name="output_vm_firewall_allowed_protocol"></a> [vm\_firewall\_allowed\_protocol](#output\_vm\_firewall\_allowed\_protocol) | n/a |
| <a name="output_vm_firewall_id"></a> [vm\_firewall\_id](#output\_vm\_firewall\_id) | VM Firewall |
| <a name="output_vm_firewall_name"></a> [vm\_firewall\_name](#output\_vm\_firewall\_name) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_image"></a> [vm\_image](#output\_vm\_image) | n/a |
| <a name="output_vm_machine_type"></a> [vm\_machine\_type](#output\_vm\_machine\_type) | n/a |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | n/a |
| <a name="output_vm_private_ip"></a> [vm\_private\_ip](#output\_vm\_private\_ip) | n/a |
| <a name="output_vm_zone"></a> [vm\_zone](#output\_vm\_zone) | n/a |
<!-- END_TF_DOCS -->