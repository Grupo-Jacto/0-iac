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

variable "vpc_id" {
  type        = string
  description = "ID da sua vpc caso esteja criada"
  validation {
    condition     = can(regex("^[a-z0-9]$")) || length(var.vpc_id) > 0
    error_message = "O id da vpc é invalido"
  }
}

#Load balancer
variable "lb_name" {
  type        = string
  default     = "my-lb"
  description = "Nome do load balancer"
  validation {
    condition     = var.lb_name == null || can(regex("^[a-z0-9]-[a-z0-9]$", var.lb_name)) || length(var.lb_name) > 0
    error_message = "O nome precisa seguir os seguintes parametros:\n- "
  }
}
variable "lb_internal" {
  type        = bool
  default     = false
  description = "Define se o load balancer será acessado apenas internamente ou externamente"
  validation {
    condition     = contains([true, false], var.lb_internal) || var.lb_internal == null
    error_message = "O valor precisa ser 'true' para interno e 'false' para externo"
  }
}
variable "lb_type" {
  type        = string
  description = "Selecione o tipo de load balancer 'application', 'network' ou 'gateway'"
  default     = "application"
  validation {
    condition     = var.lb_type == null || contains(["application", "network", "gateway"], var.lb_type)
    error_message = "O tipo do load balancer precisa ser 'application', 'network' ou 'gateway'"
  }
}
variable "lb_deletion_protection" {
  type        = bool
  default     = true
  description = "Habilita o proteção contra deleção do load balancer"
  validation {
    condition     = contains([true, false], var.lb_deletion_protection)
    error_message = "O valor precisa ser 'true' ou 'false' para este parametro"
  }
}

#Security Group
variable "sg_name" {
  type        = string
  default     = "my-lb-security-group"
  description = "Nome do security group"
  validation {
    condition     = var.sg_name == null || can(regex("^[a-z0-9]-[a-z0-9]$", var.sg_name)) || length(var.sg_name) > 0
    error_message = "O nome precisa seguir os seguintes parametros:\n- "
  }
}

# LB Listener
variable "listener_count" {
  type        = number
  default     = 1
  description = "Quantidade de regras dentro do load balancer"
}
variable "listener_port" {
  type        = number
  default     = 80
  description = "Porta a ser liberada para 'ouvir' chamados"
  validation {
    condition     = var.listener_port >= 0 && var.listener_port <= 65535
    error_message = "A porta deve estar entre 0 e 65535."
  }
}
variable "listener_protocol" {
  type        = string
  default     = "HTTP"
  description = "Procolo que esta sendo usado no ouvinte do listener"
  validation {
    condition     = can(regex("(HTTP|HTTPS|TCP|TLS|UDP|TCP_UDP|)", var.listener_protocol))
    error_message = "Os tipos de procolos suportados por lb são:\n- Application: HTTP e HTTPS\n- Network TCP, TLS, UDP e TCP_UDP"
  }
}
variable "listener_default_action" {
  type        = string
  default     = "forward"
  description = "Ação padrão da listener. Possiveis prametros: 'forward', 'redirect', 'fixed-response', 'authenticate-cognito' e 'authenticate-oidc'"
  validation {
    condition     = can(contains(["forward", "redirect", "fixed-response", "authenticate-cognito", "authenticate-oidc"], var.listener_default_action))
    error_message = "A ação padrão precisa ser: 'forward', 'redirect', 'fixed-response', 'authenticate-cognito' ou 'authenticate-oidc'"
  }
}

# Target group
variable "target_group_name" {
  type        = string
  default     = "my-target-group"
  description = "Nome do target group usado no listener do load balancer"
  validation {
    condition     = var.target_group_name == null || can(regex("^[a-z0-9]-[a-z0-9]$", var.target_group_name)) || length(var.target_group_name) > 0
    error_message = "O nome do target group precisa seguir os seguintes requisitos:\n- Letra minuscula\n- Numero\n- Caractere especial"
  }
}
variable "target_group_port" {
  type        = number
  default     = 80
  description = "Porta a ser liberada para 'ouvir' chamados no target group"
  validation {
    condition     = var.target_group_port >= 0 && var.target_group_port <= 65535
    error_message = "A porta deve estar entre 0 e 65535."
  }
}
variable "target_type" {
  type        = string
  default     = "ip"
  description = "Tipo de target a ser associado no target group"
  validation {
    condition     = contains(["instance", "ip", "lambda", "alb"], var.target_type)
    error_message = "O tipo de target precisa ser entre: 'instance','ip','lambda','alb'"
  }
}
variable "target_id" {
  type        = string
  default     = ""
  description = "O target(instancia, container, load balancer) a ser atachado no target group"
}