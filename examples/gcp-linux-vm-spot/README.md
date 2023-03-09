<p align="center">
  <img src="https://github.com/OTCShare2/terraform-intel-hashicorp/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Intel GCP Spot VM creation on the default network

This module creates a Linux Spot VM on the default network.  Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM-Spot"

## Usage

**See examples folder for complete examples.**

variables.tf

```hcl
variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
  default     = "intel-csa-resource-gcp"
}
```

main.tf
```hcl
module "spot_vm" {
  source                    = "../../"
  project                   = var.project
  boot_image_family         = "ubuntu-2004-lts"
  name                      = "this-is-a-spot-vm"
  on_host_maintenance       = "TERMINATE"
  preemptible               = true
  allow_stopping_for_update = true
  access_config = [{
    nat_ip                 = null
    public_ptr_domain_name = null
    network_tier           = "PREMIUM"
  }, ]
}
```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply 
```

## Considerations
Add additional considerations here:
- The GCP zone can be updated in the providers.tf file under this example folder for "GCP-Linux-VM-Spot"
- Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM-Spot"
- The Spot VM is created using the default network in the GCP zone configured in the providers.tf file. Please make sure you have a default network in the GCP zone
of your choice