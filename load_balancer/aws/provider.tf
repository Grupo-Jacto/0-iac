terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.73.0"
    }
  }
}
provider "aws" {
  region  = var.project_region
  profile = "lab"
  default_tags {
    tags = {
      Project     = "${var.project_name}"
      Environment = "${var.project_env}"
      iac         = "terraform"
      service     = "load_balancer"
    }
  }
}