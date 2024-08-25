variable "project_name" {
  type = string
  description = "Name of your project"
}
variable "project_env" {
  type = string
  description = "Enviroment of your project"
}
variable "project_region" {
  type = string
  description = "Region of your project"
  default = "us-east-1"
}
variable "project_tags" {
  type = map(string)
  description = "Tags of your project"
}
variable "aws_account_id" {
  type = number
  description = "Your aws account ID"
}
variable "force_destroy" {
  type = bool
  description = "Force destroy your bucket"
  default = false
}
variable "s3_lifecycle_rule" {
  type = bool
  description = "Lifecycle Rule for modifications on your bucket"
  default = false
}
variable "transition_storage_class" {
  type = string
  description = "Storage class to transition -> GLACIER | STANDARD_IA | ONEZONE_IA | INTELLIGENT_TIERING | DEEP_ARCHIVE | GLACIER_IR"
  default = "STANDARD_IA"
}
variable "transition_days" {
  type = number
  description = "Days to trasition objects"
  default = 60
}
variable "expiration_days" {
  type = number
  description = "Days to expirate the transition"
  default = 0
}
variable "allowed_headers" {
  type = list(string)
  description = " Set of Headers that are specified in the Access-Control-Request-Headers header"
  default = [ "*" ]
}
variable "allowed_methods" {
  type = list(string)
  description = "Set of HTTP methods that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE"
  default = [ "GET", "PUT", "POST", "DELETE" ]
}
variable "allowed_origins" {
  type = list(string)
  description = " Set of origins you want customers to be able to access the bucket from"
  default = [ "*" ]
}
variable "expose_headers" {
  type = list(string)
  description = "Set of headers in the response that you want customers to be able to access from their applications"
  default = [ "*" ]
}
variable "target_prefix" {
  type = string
  description = "To specify a key prefix for log objects."
  default = "log/"
}
variable "versioning_enabled" {
  type = bool
  description = "Activate versioning on bucket"
}
variable "s3_website" {
  type = bool
  description = "Enable web site bucket"
  default = false
}
variable "index" {
  type = string
  description = "Index of your web site"
  default = "index.html"
}
variable "error_index" {
  type = string
  description = "Error index of your web site"
  default = "error.html"
}
variable "activate_user_creation" {
  type = bool
  description = "Activate user creation"
  default = true
}
variable "user_name" {
  type = string
  description = "User name"
}
variable "users" {
  type = list(string)
  description = "Users to grant access to s3 bucket"
}
variable "iam_policy_action" {
  type = list(string)
  description = "Action on policy"
  default = "s3:*"
}
variable "iam_policy_effect" {
  type = list(string)
  description = "Effect on policy"
  default = "Allow"
}