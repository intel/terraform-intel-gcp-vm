<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>
# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## GCP C3 4th Gen Xeon(codenamed Sapphire Rapids) + Cloud Optimized Recipe for FasChat

This demo will demonstrate the 1.3x speedup in Large Language Model CPU inference from 3rd gen Xeon to 4th gen Xeon

## Pre-requisites

1. Install Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
2. Install Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Usage

You may need to change the appropriate IAM settings as described here: https://cloud.google.com/docs/terraform/get-started-with-terraform 

Next, enter the cloud shell in GCP (terminal button on top right of page) 

Run the following commands in order: 

`git clone https://github.com/intel/terraform-intel-gcp-vm.git`

`cd terraform-intel-gcp-vm/examples/gcp-linux-fastchat` 

`terraform init` 

`terraform apply`

## Running the Demo

**NOTE: This demo requires port 7860 to be open.** If you are running this on GCP, you will need to open this port in the GCP Firewall Policies. If you are running this on AWS, you will need to open this port in the AWS security group.

**1-SSH into newly created GCP VM and run `source /usr/local/bin/run_demo.sh`**

**2-On your computer open a browser and navigate to http://<VM_PLUBLIC_IP>:7860**


--- KNOWN ISSUE ---

This may fail. In this case, run

`pip install gradio==3.10`

`pip install gradio==3.35.2`

Then, run:

`source /usr/local/bin/run_demo.sh` 

and navigate to http://<VM_PLUBLIC_IP>:7860 on your computer.

 
