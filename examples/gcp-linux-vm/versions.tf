terraform {
  required_version = "~> 1.4.5" # see https://releases.hashicorp.com/terraform/

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.50"
    }
  }
}