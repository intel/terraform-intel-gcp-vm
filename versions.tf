terraform {
  required_version = ">= 1.6" # see https://releases.hashicorp.com/terraform/

  required_providers {
    google = {
      source  = "hashicorp/google"
      #version = "~> 4.79"
      #For GCP Intel TDX Testing
       version = "~> 6.5"
    }
  }
}
