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
  type        = string
  description = "The ID of the project in which the resource resides."
  default     = "intel-csa-resource-gcp"
}

variable "nat_ip" {
  type        = string
  description = "Public ip address"
  default     = null
}

variable "public_ptr_domain_name" {
  type        = string
  description = "The DNS domain name for the public PTR record"
  default     = null
}

variable "network_tier" {
  type        = string
  description = "Network network_tier"
  default     = "PREMIUM"
}
```
main.tf
```hcl

module "linux_vm" {
  source              = "../../"
  project             = var.project
  boot_image_family   = "ubuntu-2004-lts"
  name                = "this-is-a-linux-vm"
  network             = "default"
  on_host_maintenance = "TERMINATE"
  access_config = [{
    nat_ip                 = var.nat_ip
    public_ptr_domain_name = var.public_ptr_domain_name
    network_tier           = var.network_tier
  }, ]
  boot_disk_source = null
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