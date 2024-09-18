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
variable "filter_ami_name" {
  type = string
  description = "Name of ami you are searching"
  default = "ubuntu"
}
variable "filter_ami_path" {
  type = list(string)
  description = "Path for ami installation"
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
variable "ami" {
  type = string
  description = "AMI for ec2 instance"
  default = ""
}
variable "instance_type" {
  type = string
  description = "Ec2 Instance type"
  default = "t4g.micro" # Minimal type
}
variable "associate_public_ip" {
  type = bool
  description = "Associate public ip on Ec2"
}
variable "availability_zones" {
  type = string
  description = "Availability zone to replicate your ec2"
}
variable "subnet_id" {
  type = string
  description = "ID of subnet to launch ec2"
}
variable "key_name" {
  type = string
  description = "Key name to access your ec2 instance"
}
variable "public_key" {
  type = string
  description = "Public key for instance key"
  #Example to use:
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
