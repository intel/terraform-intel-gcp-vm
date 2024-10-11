<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## GCP C3 4th Gen Xeon(code named Sapphire Rapids) & Intel® Optimized Cloud Recipe for Stable Diffusion

This demo will showcase Stable Diffusion CPU inferencing using 5th Gen Xeon Scalable Processors on GCP.

## Usage

1. Log on to GCP Portal
2. Enter the GCP Cloud Shell (terminal button on top right of page)
3. Run the following commands in order: 


```bash
git clone https://github.com/intel/terraform-intel-gcp-vm.git
cd terraform-intel-gcp-vm/examples/gcp-linux-stable-diffusion
terraform init 
terraform apply

# (enter your GCP project ID and "yes" to confirm)

```

## Run the Stable Diffusion Intel® OpenVino Optimized Demo

**NOTE - Wait ~5 minutes for the software to install**

**1-SSH into newly created GCP VM and run `source /usr/local/bin/run_demo.sh`**

**2-On your computer open a browser and navigate to http://<VM_PLUBLIC_IP>:5000**

## OPTIONAL - Run the default stock Stable Diffusion demo (not optimized)

**1-SSH into VM and run `source /usr/local/bin/not_optimized_run_demo.sh`**

**2-Browse to port 5001 instead http://<VM_PLUBLIC_IP>:5001**


Note: You may need permissions to run Terraform https://cloud.google.com/docs/terraform/get-started-with-terraform 

### Pre-requisites for running on a Workstation (bypass if using GCP Cloud Shell)

1. Google Cloud CLI: https://cloud.google.com/sdk/docs/install
2. CGP account access configured: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#running-terraform-on-your-workstation
3. Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
4. Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
