# Variáveis referentes ao projeto
variable "project_id" {
  type        = string
  description = "ID do projeto"
}
variable "project_env" {
  type        = string
  description = "Abreviação do ambiente"
}
variable "project_name_base" {
  type        = string
  description = "Um texto para utilizar como base para criar os recursos e serviços"
}
variable "project_location" {
  type        = string
  description = "Localização macro que o serviço vai estar hospedado"
  default     = "US"
}
variable "project_region" {
  type        = string
  description = "Região especifica que o serviço vai estar hospedado"
  default     = "us-central1"
}
variable "project_labels" {
  type        = object({
    owner       = string
    technician  = string
  })
  description = "Labels adicionais para o recurso"
}

# Variáveis referentes ao Storage Bucket
variable "storage_name" {
  type = string
  description = "Nome do Storage Bucket"
  default = "generic"
}
variable "storage_class" {
  type        = string
  description = "Tipo de storage que será aplicado ao bucket"
  default     = "STANDARD"
}
variable "storage_uniform_access" {
  type        = bool
  description = "Ativa ou desativa o acesso uniforme ao bucket"
  default     = true
}
variable "storage_force_destroy" {
  type        = bool
  description = "Força exclusão do bucket mesmo contendo arquivos"
  default     = true
}
variable "storage_cors_age" {
  type        = number
  description = "Tempo em segundos que cache de segurança fica no navegador"
  default     = 60
}
variable "storage_cors_origin" {
  type        = list(string)
  description = "Lista de origens que o cors aceita"
  default     = ["*"]
}
variable "storage_cors_method" {
  type        = list(string)
  description = "Lista de métodos que o cors do bucket aceita"
  default     = ["GET"]
}
variable "storage_cors_header" {
  type        = list(string)
  description = "Lista de cabeçalhos que o cors do bucket aceita"
  default     = ["Access-Control-Allow-Origin"]
}
variable "storage_website" {
  type        = bool
  description = "Ativa ou desativa o website do bucket"
  default     = false  
}
variable "storage_website_main" {
  type        = string
  description = "Arquivo que será utilizado como página principal do bucket, (index.html por padrão)"
  default     = "index.html"
}
variable "storage_website_error" {
  type        = string
  description = "Arquivo que será utilizado como página não encontrado do bucket, (404.html por padrão)"
  default     = "404.html"
}

# Variáveis referentes ao IAM de acesso public para Storage Bucket
variable "storage_iam_public" {
  type        = bool
  description = "Ativa ou desativa a permissão de visualização publica"
  default     = true
}
variable "storage_iam_role" {
  type        = string
  description = "Permissão de visualização de objetos no bucket"
  default     = "roles/storage.objectViewer"
}
variable "storage_iam_members" {
  type        = list(string)
  description = "Lista com o allUsers para adicionar permissão de visualizar"
  default     = ["allUsers"]
}

# Variáveis referentes ao IAM de acesso admin para Storage Bucket
variable "storage_account_create" {
  type        = bool
  description = "Ativa ou desativa a criação de uma conta de serviço para o bucket"
  default     = true  
}
variable "storage_account_condition" {
  type = bool
  description = "Ativa ou desativa a condição de acesso ao bucket"
  default = false
}
variable "storage_account_member" {
  type = string
  description = "Membro para dar acesso ao bucket"
  default = "member"
}
variable "storage_account_iam_role" {
  type        = string
  description = "Permissão de Administrador de Objeto do Storage"
  default     = "roles/storage.objectAdmin"
}

# Variáveis referentes as configurações key do Storage Bucket
variable "storage_account_key_private_type" {
  type        = string
  description = "Tipo de chave privada a ser criada"
  default     = "TYPE_GOOGLE_CREDENTIALS_FILE"
}
variable "storage_account_key_public_type" {
  type        = string
  description = "Tipo de chave publica a ser criada"
  default     = "TYPE_X509_PEM_FILE"
}
