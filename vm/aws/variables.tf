variable "project_name" {
  type        = string
  description = "Nome do seu projeto"
}
variable "project_env" {
  type        = string
  description = "Abreviação do ambiente. Valores suportados: `sbx` para sandbox, `dev` para desenvolvimento, `hml` para homologação e `prd` para produção."
  validation {
    condition     = var.project_env == null || can(lower(regex("^(sbx|dev|prd|prod|hml|homol)$", var.project_env)))
    error_message = "O project_env deve ser nulo ou um dos seguintes valores: 'sbx', 'dev', 'hml' ou 'prd'."
  }
}

variable "project_region" {
  type        = string
  description = "Região do seu projeto"
  default     = "us-east-1"
  validation {
    condition     = var.project_region == null || length(var.project_region) > 5 || can(regex(!startswith("^(?i)(us|eu|ap)$", var.project_region)))
    error_message = "Região inválida. Regioes aceitas: 'us-east-[1-2]', 'us-west-[1-2], 'eu-west-[1-2]','ap-southeast-[1-2]'"
  }

  validation {
    condition = var.project_region == "us" ? "us-east-1" : null || var.project_region == "eu" ? "eu-west-1" : null || var.project_region == "ap" ? "ap-southeast-1" : null
    error_message = "Região inválida. Regioes aceitas: 'us-east-[1-2]', 'us-west-[1-2], 'eu-west-[1-2]','ap-southeast-[1-2]'"
  }
}
variable "filter_ami_name" {
  type        = string
  description = "Qual o tipo de filtro esta sendo feito, no caso padrão: 'name'"
  default     = "name"
}
variable "filter_ami_path" {
  type        = list(string)
  description = "Path for ami installation"
  default     = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
variable "vm_name" {
  type        = string
  description = "Nome da vm"
  default     = "my-vm"
  validation {
    condition     = var.vm_name == null || length(var.vm_name) > 0
    error_message = "O tamanho do nome é invalido"
  }
}
variable "instance_type" {
  type        = string
  description = "Tipo da instancia para a vm"
  default     = "t3a.micro" # Minimal type
  validation {
    condition     = var.instance_type == null || length(var.instance_type) > 5 && length(var.instance_type) <= 10
    error_message = "Consulte os tipos de instancia disponiveis em: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html"
  }
}
variable "associate_public_ip" {
  type        = bool
  description = "Associate public ip on Ec2"
  default     = true
  validation {
    condition     = var.associate_public_ip == null || contains([true, false], var.associate_public_ip)
    error_message = "O valor deste parametro precisar ser true ou false"
  }
}
variable "availability_zones" {
  type        = string
  description = "Região do seu projeto"
  default     = "us-east-1"
  validation {
    condition     = var.availability_zones == null || length(var.availability_zones) > 5 || can(regex(!startswith("^(?i)(us|eu|ap)$", var.availability_zones)))
    error_message = "Região inválida. Regioes aceitas: 'us-east-[1-2]', 'us-west-[1-2], 'eu-west-[1-2]','ap-southeast-[1-2]'"
  }
}
variable "subnet_id" {
  type        = string
  description = "ID of subnet to launch ec2"
  default     = ""
  validation {
    condition     = length(var.subnet_id) > 20 || length(var.subnet_id) <= 30
    error_message = "Id da subnet invalido"
  }
}
variable "vm_count" {
  type        = number
  description = "Quantidade de vms que precisa subir"
  default     = 1
  validation {
    condition     = var.vm_count > 0
    error_message = "A quantidade de vms precisa ser maior que 0"
  }
}
variable "key_name" {
  type        = string
  description = "Key name to access your ec2 instance"
  default     = "my-key-pair"
  validation {
    condition     = var.key_name == null || length(var.key_name) >= 1 || length(var.key_name) <= 10
    error_message = "O nome da chave é invalido"
  }
}
variable "public_key" {
  type        = string
  description = "Public key for instance key"
  #Example to use:
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
  validation {
    condition     = var.public_key == null || length(var.public_key) > 10
    error_message = "A chave publica é invalida"
  }
}
