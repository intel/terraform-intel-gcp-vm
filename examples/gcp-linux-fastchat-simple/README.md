<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## GCP C4 5th Gen Xeon(code named Emerald Rapids) & Intel® Optimized Cloud Recipe for FastChat

This demo will showcase Large Language Model(LLM) CPU inference using 5th Gen Xeon Scalable Processors on GCP.

## Usage

1. Log on to GCP Portal
2. Enter the GCP Cloud Shell (terminal button on top right of page)
3. Run the following commands in order: 


```bash
git clone https://github.com/intel/terraform-intel-gcp-vm.git
cd terraform-intel-gcp-vm/examples/gcp-linux-fastchat-simple
terraform init 
terraform apply

# (enter your GCP project ID and "yes" to confirm)

```

## Running the Demo

1. **Wait ~10 minutes** for the Recipe to download/install FastChat and the LLM model before continuing
2. SSH into newly created GCP VM
3. **Run `source /usr/local/bin/run_demo.sh`**
4. On your local computer, open a browser and navigate to **http://<VM_PLUBLIC_IP>:7860**. Get your Public IP from the "Compute Engine" section of the VM in the GCP console.

Note: You may need permissions to run Terraform https://cloud.google.com/docs/terraform/get-started-with-terraform 

## Pre-requisites for running on a Workstation (bypass if using GCP Cloud Shell)

1. Google Cloud CLI: https://cloud.google.com/sdk/docs/install
2. CGP account access configured: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#running-terraform-on-your-workstation
3. Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
4. Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
