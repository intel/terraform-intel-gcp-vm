<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2023, Intel Corporation

## Intel GCP VM on default network

This module creates a Intel Confiddential Compute Linux VM on the default network with Intel Xeon 5th Generation Scalable processors (code-named Emerald Rapids) VM with Confidential Computing and Intel Trust Domain Extension (Intel TDX) technology.  

Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM"

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

module "linux_vm" {
  source              = "intel/gcp-vm/intel"
    project             = var.project
    name                = "intel-tdx-linux01"
 
 #required for Intel Confidential Compute VM with TDX
 enable_confidential_compute = var.enable_confidential_compute
 confidential_instance_type  = var.confidential_instance_type
 on_host_maintenance = "TERMINATE"

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
- The GCP zone can be updated in the providers.tf file under this example folder for "GCP-Linux-VM"
- Update the project with a your project id in GCP. It is located on the variables.tf file under this example folder for "GCP-Linux-VM"
- The VM is created using the default network in the GCP zone configured in the providers.tf file. Please make sure you have a default network in the GCP zone of your choice
