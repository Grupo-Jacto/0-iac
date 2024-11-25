terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.73.0"
    }
  }
}
provider "aws" {
  region                   = var.project_region
  profile                  = "lab" #Essa tem que todos os recursos fora REDE
  shared_config_files      = ["C:\\Users\\signacio\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\signacio\\.aws\\credentials"]
  default_tags {
    tags = {
      Project     = "${var.project_name}"
      Environment = "${var.project_env}"
      iac         = "terraform"
      service     = "s3"
    }
  }
}
