terraform {
  required_version = "~> 1.5.2" # see https://releases.hashicorp.com/terraform/

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.50"
    }
  }
}