<p align="center">
  <img src="https://github.com/OTCShare2/terraform-intel-hashicorp/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Intel GCP VM with network creation

This module creates a new network on GCP, then creates a VM that is in that specific network.  Update the project with a corresponding project id in GCP. 

## Usage

**See examples folder for complete examples.**

variables.tf

```hcl
variable "project" {
  description = "Project id in GCP"
  type        = string
}
```
main.tf
```hcl

resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  network       = google_compute_network.my_network.self_link
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  network_interface {
    network    = google_compute_network.my_network.name
    subnetwork = google_compute_subnetwork.my_subnetwork.name
    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
}
```



Run Terraform

```hcl
export TF_VAR_db_password ='<USE_A_STRONG_PASSWORD>'

terraform init  
terraform plan
terraform apply 
```
## Considerations
Add additional considerations here

self link existing disk or disk image - modify boot_disk_source = null to point to the disk/disk image.  also modify main.tf in master repo to REM out 
```hcl
    initialize_params {
      image  = data.google_compute_image.image.self_link
      size   = var.boot_disk_size
      type   = var.boot_disk_type
      labels = var.boot_disk_labels
    }
```