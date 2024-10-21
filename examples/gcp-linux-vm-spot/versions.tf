terraform {
  required_version = "~> 1.6" # see https://releases.hashicorp.com/terraform/

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.5"
    }
  }
}