terraform {
  required_version = ">= 0.13"

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 5.22, < 6"
    }
  }
}

provider "google" {
  project = var.project_id
}