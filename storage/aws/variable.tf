variable "project_name" {
  type        = string
  description = "Nome do seu projeto"
}

variable "project_env" {
  type        = string
  description = "Ambiente do seu projeto"
  validation {
    condition     = can(regex("^(?i)(dev|prd|hml)$", var.project_env))
    error_message = "O valor da variável project_env deve ser 'dev', 'prd' ou 'hml' (sem case sensitive)."
  }
}

variable "project_region" {
  type        = string
  description = "Região do seu projeto"
  default     = "us-east-1"
  validation {
    condition     = length(var.project_region) > 5
    error_message = "Região inválida."
  }
}

variable "project_tags" {
  type        = map(string)
  description = "Tags do seu projeto"
}

variable "aws_account_id" {
  type        = number
  description = "ID da sua conta AWS"
  validation {
    condition     = length(var.aws_account_id) > 12
    error_message = "ID da conta inválido."
  }
}

variable "force_destroy" {
  type        = bool
  description = "Forçar destruição do seu bucket"
  default     = false
  validation {
    condition     = contains([true, false], var.force_destroy)
    error_message = "A force_destroy precisa ser true ou false."
  }
}

variable "s3_lifecycle_rule" {
  type        = bool
  description = "Regra de ciclo de vida para modificações no seu bucket"
  default     = false
}

variable "transition_storage_class" {
  type        = string
  description = "Classe de armazenamento para transição -> STANDARD | GLACIER | STANDARD_IA | ONEZONE_IA | INTELLIGENT_TIERING | DEEP_ARCHIVE | GLACIER_IR"
  default     = "STANDARD_IA"
  validation {
    condition = contains(["STANDARD", "GLACIER", "STANDARD_IA", "ONEZONE_IA", "INTELLIGENT_TIERING","DEEP_ARCHIVE","GLACIER_IR"])
    error_message = "A classe de storage precisa ser: 'STANDARD', 'GLACIER', 'STANDARD_IA', 'ONEZONE_IA', 'INTELLIGENT_TIERING','DEEP_ARCHIVE','GLACIER_IR'"
  }
}

variable "transition_days" {
  type        = number
  description = "Dias para transição de objetos"
  default     = 60
}

variable "expiration_days" {
  type        = number
  description = "Dias para expiração da transição"
  default     = 0
}

variable "allowed_headers" {
  type        = list(string)
  description = "Conjunto de cabeçalhos especificados no cabeçalho Access-Control-Request-Headers"
  default     = ["*"]
}

variable "allowed_methods" {
  type        = list(string)
  description = "Conjunto de métodos HTTP que você permite que a origem execute. Valores válidos são GET, PUT, HEAD, POST e DELETE"
  default     = ["GET", "PUT", "POST", "DELETE"]

  validation {
    condition = contains(["GET", "PUT", "POST", "DELETE"])
    error_message = "Os valores precisam ser 'GET','PUT'. 'POST', 'DELETE'"
  }
}

variable "allowed_origins" {
  type        = list(string)
  description = "Conjunto de origens que você deseja permitir que os clientes acessem o bucket"
  default     = ["*"]
}

variable "expose_headers" {
  type        = list(string)
  description = "Conjunto de cabeçalhos na resposta que você deseja que os clientes possam acessar de suas aplicações"
  default     = ["*"]
}

variable "target_prefix" {
  type        = string
  description = "Para especificar um prefixo de chave para objetos de log."
  default     = "log/"
}

variable "versioning_enabled" {
  type        = bool
  description = "Ativar versionamento no bucket"
  validation {
    condition     = contains([true, false], var.force_destroy)
    error_message = "A versioning_enabled precisa ser true ou false."
  }
}

variable "s3_website" {
  type        = bool
  description = "Habilitar bucket como site"
  default     = false
  validation {
    condition     = contains([true, false], var.force_destroy)
    error_message = "A s3_website precisa ser true ou false."
  }
}

variable "index" {
  type        = string
  description = "Índice do seu site"
  default     = "index.html"
}

variable "error_index" {
  type        = string
  description = "Índice de erro do seu site"
  default     = "error.html"
}

variable "activate_user_creation" {
  type        = bool
  description = "Ativar criação de usuário"
  default     = true
  validation {
    condition     = contains([true, false], var.force_destroy)
    error_message = "A activate_user_creation precisa ser true ou false."
  }
}

variable "user_name" {
  type        = string
  description = "Nome do usuário"
}

variable "users" {
  type        = list(string)
  description = "Usuários para conceder acesso ao bucket S3"
}

variable "iam_policy_action" {
  type        = list(string)
  description = "Ação na política"
  default     = ["s3:*"]
}

variable "iam_policy_effect" {
  type        = list(string)
  description = "Efeito na política"
  default     = ["Allow"]
  validation {
    condition     = contains(["Allow", "Deny"], var.force_destroy)
    error_message = "A iam_policy_effect precisa ser Allow ou Deny."
  }
}
