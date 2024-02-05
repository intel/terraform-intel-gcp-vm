<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## Intel Red Hat Enterprise Linux GCP VM Example

This module creates a Red Hat Enterprise Linux (RHEL) VM on the Intel Sapphire Rapids CPU. The virtual machine is created on an Intel Sapphire Rapids c3-standard-4 by default.

Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-RHEL-VM".

For the list of publicly available images for compute engines see https://cloud.google.com/compute/docs/images OR run gcloud compute images list --project gce-uefi-images to see the name, project, family and status easily in the CLI

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

module "rhel_vm" {
  source              = "intel/gcp-vm/intel"
  project             = var.project
  boot_image_family   = "rhel-8"
  boot_image_project  = "rhel-cloud"
  name                = "vm1"
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
- The GCP zone can be updated in the providers.tf file under this example folder for "GCP-RHEL-VM"
- Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-RHEL-VM"
- The VM is created using the default network in the GCP zone configured in the providers.tf file. Please make sure you have a default network in the GCP zone of your choice
