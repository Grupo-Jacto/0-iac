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

variable "aws_account_id" {
  type        = number
  description = "ID da sua conta AWS"
  validation {
    condition     = var.aws_account_id > 12
    error_message = "ID da conta inválido"
  }
}

variable "storage_force_destroy" {
  type        = bool
  description = "Forçar destruição do seu storage"
  default     = false
  validation {
    condition     = var.storage_force_destroy == null || contains([true, false], var.storage_force_destroy)
    error_message = "A force_destroy precisa ser true ou false."
  }
}

variable "storage_lifecycle_rule" {
  type        = bool
  description = "Regra de ciclo de vida para modificações no seu bucket"
  default     = false
  validation {
    condition     = var.storage_lifecycle_rule == null || contains([true, false], var.storage_lifecycle_rule)
    error_message = "O valor do parametro necessita ser true ou false"
  }
}

variable "transition_storage_class" {
  type        = string
  description = "Classe de armazenamento para transição -> STANDARD GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR"
  default     = "STANDARD_IA"
  validation {
    condition     = var.transition_storage_class == null || contains(["STANDARD", "GLACIER", "STANDARD_IA", "ONEZONE_IA", "INTELLIGENT_TIERING", "DEEP_ARCHIVE", "GLACIER_IR"], var.transition_storage_class)
    error_message = "A classe de storage precisa ser: 'STANDARD', 'GLACIER', 'STANDARD_IA', 'ONEZONE_IA', 'INTELLIGENT_TIERING','DEEP_ARCHIVE','GLACIER_IR'"
  }
}

variable "storage_objects_transition_days" {
  type        = number
  description = "Dias para transição de objetos"
  default     = 60
  validation {
    condition     = var.storage_objects_transition_days == null || var.storage_objects_transition_days > 0
    error_message = "A quantidade de dias precisa maior que 0"
  }
}

variable "storage_objects_expiration_days" {
  type        = number
  description = "Dias para expiração da transição"
  default     = 0
  validation {
    condition     = var.storage_objects_expiration_days == null || var.storage_objects_expiration_days >= 0
    error_message = "A quantidade de dia para expirar precisa ser maior que 0"
  }
}

variable "storage_allowed_headers" {
  type        = list(string)
  description = "Conjunto de cabeçalhos especificados no cabeçalho Access-Control-Request-Headers"
  default     = ["GET"]
  validation {
    condition = var.storage_allowed_headers == null || alltrue([for header in var.storage_allowed_headers : contains(["GET", "PUT", "POST", "DELETE", "HEAD", "*"], header)])
    # condition     = var.storage_allowed_headers == null || !strcontains([var.storage_allowed_headers], ["*"]) && !strcontains(var.storage_allowed_headers, "GET") && !strcontains(var.storage_allowed_headers, "PUT") && !strcontains(var.storage_allowed_headers, "POST") && !strcontains(var.storage_allowed_headers, "DELETE") && !strcontains(var.storage_allowed_headers, "HEAD")
    error_message = "Insira os parametros que precisam ser liberados dentro dos disponiveis:GET, PUT, POST, DELETE, HEAD ou * para todos os anteriores"
  }
}

variable "storage_allowed_methods" {
  type        = list(string)
  description = "Conjunto de métodos HTTP que você permite que a origem execute. Valores válidos são GET, PUT, HEAD, POST e DELETE"
  default     = ["*"]
  validation {
    condition     = var.storage_allowed_methods == null || alltrue([for header in var.storage_allowed_methods : contains(["GET", "PUT", "POST", "DELETE", "HEAD", "*"], header)])
    error_message = "Os valores precisam ser 'GET','PUT'. 'POST', 'DELETE'"
  }
}

variable "storage_allowed_origins" {
  type        = list(string)
  description = "Conjunto de origens que você deseja permitir que os clientes acessem o bucket"
  default     = ["*"]
  validation {
    condition     = var.storage_allowed_origins == null || alltrue([for origin in var.storage_allowed_origins : can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", origin)) || origin == "*"])
    error_message = "Passe um range de ip valido"
  }
}

variable "storage_expose_headers" {
  type        = list(string)
  description = "Conjunto de cabeçalhos na resposta que você deseja que os clientes possam acessar de suas aplicações"
  default     = ["*"]
  validation {
    condition     = var.storage_expose_headers == null || length(var.storage_expose_headers) > 0
    error_message = "O header não pode ser nulo"
  }
}

variable "storage_versioning_enabled" {
  type        = bool
  description = "Ativar versionamento dos objetos no bucket"
  default     = false
  validation {
    condition     = var.storage_versioning_enabled == null || contains([true, false], var.storage_versioning_enabled)
    error_message = "O valor do parametro precisa ser true ou false."
  }
}

variable "storage_website" {
  type        = bool
  description = "Habilitar bucket como site"
  default     = false
  validation {
    condition     = var.storage_website == null || contains([true, false], var.storage_website)
    error_message = "O valor do parametro precisa ser true ou false."
  }
}

variable "storage_index" {
  type        = string
  description = "Índice do seu site"
  default     = "index.html"
  validation {
    condition     = var.storage_index == null || length(var.storage_index) >= 4
    error_message = "O arquivo nao segue o padrão desejado: <nome>.html"
  }
}

variable "storage_error_index" {
  type        = string
  description = "Índice de erro do seu site"
  default     = "error.html"
  validation {
    condition     = var.storage_error_index == null || length(var.storage_error_index) >= 4
    error_message = "O arquivo nao segue o padrão desejado: <nome_error>.html"
  }
}

variable "storage_activate_user_creation" {
  type        = bool
  description = "Ativar criação de usuário"
  default     = true
  validation {
    condition     = var.storage_activate_user_creation == null || contains([true, false], var.storage_activate_user_creation)
    error_message = "O valor do parametro para criacao do usuario precisa ser true ou false."
  }
}

variable "iam_user_name" {
  type        = string
  description = "Nome do usuário"
  default     = "my-user"
  validation {
    condition     = var.iam_user_name == null || length(var.iam_user_name) > 0
    error_message = "O nome do usuario iam precisa ser maior que 0"
  }
}

variable "iam_users" {
  type        = list(string)
  description = "Usuários para conceder acesso ao bucket storage"
  default     = [null]
  validation {
    condition     = var.iam_users == null || length(var.iam_users) > 0
    error_message = "O nome de usuario é invalido"
  }
}

variable "iam_policy_action" {
  type        = list(string)
  description = "Ação na política"
  default     = ["s3:*"]
  validation {
    condition     = var.iam_policy_action == null || alltrue([for action in var.iam_policy_action : can(regex("^s3:[a-zA-Z]+", action)) || can(regex("^[a-zA-Z]+", action))])
    error_message = "A ação na politica precisa seguir o seguinte padrão: 's3:<action>' ou '<action>' Ex: 's3:GetObject'"
  }
}

variable "iam_policy_effect" {
  type        = list(string)
  description = "Efeito na política"
  default     = ["Allow"]
  validation {
    condition     = var.iam_policy_effect == null || alltrue([for effect in var.iam_policy_effect : effect == "Allow" || effect == "Deny"])
    error_message = "O valor do parametro precisa ser Allow ou Deny."
  }
}