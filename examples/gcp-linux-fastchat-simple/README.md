<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## GCP C3 4th Gen Xeon(code named Sapphire Rapids) & Intel® Cloud Optimized Recipe for FastChat

This demo will showcase Large Language Model(LLM) CPU inference using 4th Gen Xeon Scalable Processors on GCP.

## Usage

You may need to change the appropriate IAM settings as described here: https://cloud.google.com/docs/terraform/get-started-with-terraform 

1. Log on to CGP Portal
2. Enter the GCP Cloud Shell (terminal button on top right of page)
3. Run the following commands in order: 

`git clone https://github.com/intel/terraform-intel-gcp-vm.git`

`cd terraform-intel-gcp-vm/examples/gcp-linux-fastchat-simple` 

`terraform init` 

`terraform apply`

## Running the Demo


1. **Wait ~10 minutes** for the Recipe to download/install FastChat and the LLM model before continuing
2. SSH into newly created GCP VM
3. **Run `source /usr/local/bin/run_demo.sh`**
4. If you did not choose to open a port, your app will be proxied through gradio. See https://xxxxxxx.gradio.live URL that is generated during the gradio run.
5. Otherwise, if you choose to open port 7860 in main.tf: on your computer, open a browser and navigate to **http://<VM_PLUBLIC_IP>:7860**. Get your Public IP from the "Compute Engine" section of the GCP console.

<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/gradio.png?raw=true" alt="Intel Logo" width="250"/>
</p>


--- KNOWN ISSUE ---

The demo may initially fail. In this case, run

`pip install gradio==3.10`

`pip install gradio==3.35.2`

Then, run:

`source /usr/local/bin/run_demo.sh` 

And navigate again using your browser.

## Pre-requisites for running on a Workstation (bypass if using GCP Cloud Shell)

1. Google Cloud CLI: https://cloud.google.com/sdk/docs/install
2. CGP account access configured: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#running-terraform-on-your-workstation
3. Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
4. Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git