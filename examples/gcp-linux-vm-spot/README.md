<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## Intel GCP Spot VM creation on the default network

This module creates a Linux Spot VM on the default network.  Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM-Spot"

## Usage

**See examples folder for complete examples.**

variables.tf

```hcl
variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
}
```

main.tf
```hcl
# You will need to provide value of the variable project, which is your GCP project id when you do terraform apply

module "spot_vm" {
  source                    = "intel/gcp-vm/intel"
  project                   = var.project
  boot_image_family         = "ubuntu-2204-lts"
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
terraform apply -var="project=<your_your_gcp_project_id>"
```

## Considerations
Add additional considerations here:
- The GCP zone can be updated in the providers.tf file under this example folder for "GCP-Linux-VM-Spot"
- Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM-Spot"
- The Spot VM is created using the default network in the GCP zone configured in the providers.tf file. Please make sure you have a default network in the GCP zone of your choice
