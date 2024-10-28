# Service User
variable "account_id" {
  type = string
  description = "ID do projeto na GCP"
}
variable "service_user_name" {
  type = string
  description = "Nome do usuario de serviço"
}

#VM
variable "vm_count" {
  type = number
  default = 1
  description = "Numero de instancias que deseja subir"
}
variable "vm_name" {
  type = string
  description = "Nome da vm"
}
variable "vm_machine_type" {
  type = string
  description = "Tipo da instancia da vm"
}
variable "vm_zone" {
  type = string
  description = "Zona de disponibilidade da vm"
}
variable "vm_tags" {
  type = list(string)
  default = [ "Terraform" ]
  description = "Tags para associar recursos a vm. Ex: Firewall rules"
}
variable "vm_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
  description = "Imagem a ser utilizada na vm com o formato aceito em 'https://cloud.google.com/compute/docs/images#gcloud'"
}
variable "vm_disk_interface" {
  type = string
  default = "NVME" 
  description = "Tipo do disco ssd utilizado, por padrao o NVME é o mais rapido e barato"
}
variable "vm_network_interface" {
  type = string
  default = "default"
  description = "Configurações da interface de rede da vm"
}
variable "vm_service_account_scopes" {
  type = list(string)
  default = ["cloud-platform"]
  description = "Permissao do usuario de serviço a apis da Google cloud. 'cloud-platform' por padrão com acesso a ALL Api's"
}

#VM Firewall
variable "vm_firewall_name" {
  type = string
  description = "Nome do firewall para a vm"
}
variable "vm_firewall_allow_protocols" {
  type = string
  description = "Protocolos para liberação na regra de firewall"
}
variable "vm_firewall_allow_ports" {
  type = list(string)
  description = "Portas para liberação na regra de firewall"
}