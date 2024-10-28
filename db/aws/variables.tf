############ Tipo de banco de dados escolhido:
variable "db_resource_type" {
  type        = string
  description = "Tipo de recurso a ser criado ('db' -> para bancos Mysql, Postgresql, Oracle ou Sql Server | 'db_cluster' para bancos Aurora MySql e Aurora Postgresql)"
}
############################################################################################################################
#Project
variable "project_name" {
  type        = string
  description = "Name of your project"
}
variable "project_env" {
  type        = string
  description = "Enviroment of your project"
}
variable "project_region" {
  type        = string
  description = "Region of your project"
  default     = "us-east-1"
}
variable "project_tags" {
  type        = map(string)
  description = "Tags of your project"
}

#RDS
variable "db_allocated_storage" {
  type        = number
  description = "Quantidade de storage a ser utilizado"
}
variable "db_database_name" {
  type = string
  description = "Nome do database dentro do banco de dados"
}
variable "db_engine" {
  type        = string
  description = "Engine do banco de dados selecionado (Mysql, Postgresql, Oracle ou Sql Server)"
}
variable "db_engine_version" {
  type        = string
  description = "Versão da engine (Ex: 8.0 - 5.7 - 4.5 - 5.0)"
}
variable "db_availability_zone" {
  type = string
  description = "Zonas de disponibilidade para o banco de dados (Ex: 'us-east-1a','us-east-1b','us-east-1c','us-east-1d' ou 'us-west-1a','us-west-1b','us-west-1c','us-west-1d')"
}
variable "db_instance_class" {
  type        = string
  description = "Instancia do banco de dados"
}
variable "db_username" {
  type        = string
  description = "Nome do usuario root do banco de dados"
}
variable "db_password" {
  type        = string
  description = "Senha do usuario root do banco de dados"
}
variable "db_skip_final_snapshot" {
  type        = bool
  description = "Pular a criação do backup final ao destruir o banco de dados"
}
variable "db_backup_retention_period" {
  type        = number
  description = "Tempo de retenção de backup do banco de dados em dias"
}
variable "db_subnet_group_name" {
  type        = string
  description = "Nome do grupo de subnets para o banco de dados"
}
variable "db_multi_az" {
  type        = bool
  description = "Ativar mais zonas de disponibilidade para o banco de dados"
}
variable "db_storage_encrypted" {
  type        = bool
  description = "Ativar a criptografia de storage"
}
variable "db_timeout_create" {
  type        = string
  description = "Tempo para executar um create em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas)"
  default     = "0s"
}
variable "db_timeout_delete" {
  type        = string
  description = "Tempo para executar um delete em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas)"
  default     = "0s"
}
variable "db_timeout_update" {
  type        = string
  description = "Tempo para executar um update em algum recurso do banco de dados (Ex: 10s para segundos, 10m para minutos e 10h para horas)"
  default     = "0s"
}

# Cluster RDS
variable "db_cluster_availability_zones" {
  type = list(string)
  default = [ "us-east-1a" ]
  description = "Zonas de disponibilidade para o banco de dados (Ex: 'us-east-1a','us-east-1b','us-east-1c','us-east-1d' ou 'us-west-1a','us-west-1b','us-west-1c','us-west-1d')"
}
variable "db_cluster_preferred_backup_window" {
  type = string
  description = "Intervalo de tempo para executar o backup caso esteja ativo (ex: '07:00-09:00'AM)"
}

#Parameter group
variable "pg_name" {
  type        = string
  description = "Nome do grupo de parametros"
}
variable "pg_family" {
  type        = string
  description = "Familia de parametros da engine escolhida no banco de dados"
}
variable "pg_parameter_server_name" {
  type    = string
  default = "character_set_server"
}
variable "pg_parameter_server_value" {
  type    = string
  default = "utf8"
}
variable "pg_parameter_client_name" {
  type    = string
  default = "character_set_client"
}
variable "pg_parameter_client_value" {
  type    = string
  default = "utf8"
}