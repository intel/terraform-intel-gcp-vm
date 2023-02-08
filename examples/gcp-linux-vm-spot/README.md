<p align="center">
  <img src="https://github.com/OTCShare2/terraform-intel-hashicorp/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Intel GCP VM with network creation

This module creates a new network on GCP, then creates a VM that is in that specific network. 

## Usage

**See examples folder for complete examples.**

variables.tf

```hcl
<EXAMPLE>
```
main.tf
```hcl
<EXAMPLE>
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