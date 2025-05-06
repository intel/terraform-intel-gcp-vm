<p align="center">
  <img src="https://github.com/intel/terraform-intel-gcp-vm/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## GCP C4 Instance with 5th Generation Intel® Xeon® Scalable Processor (Emerald Rapids) & Open Platform for Enterprise AI (OPEA) ChatQnA Example

This demo will showcase Retrieval Augmented Generation (RAG) CPU inference using 5th Gen Xeon Scalable Processors on GCP using the OPEA ChatQnA Example. For more information about OPEA, go [here](https://opea.dev/). For more information on this specific example, go [here](https://github.com/opea-project/GenAIExamples/tree/main/ChatQnA).

## Usage

## After cloning the repo, modify /examples/gen-ai-xeon-opea-chatqna/variables.tf to add your Huggingface Token

Some Models required a Token. Modify the Huggingface Token variable to your specific Huggingface Token, for information on creating a Huggingface token go [here](https://huggingface.co/docs/hub/en/security-tokens)

```hcl
variable "huggingface_token" {
  description = "Huggingface Token"
  default     = " <YOUR HUGGINGFACE TOKEN> "
  type        = string
}
```

**If needed, also modify values on /examples/gen-ai-xeon-opea-chatqna/main.tf to match your needs**

## GCP Cloud Shell Usage

1. Log on to GCP Portal
2. Enter the GCP Cloud Shell (terminal button on top right of page)
3. Run the following commands in order: 


```bash
git clone https://github.com/intel/terraform-intel-gcp-vm.git
cd terraform-intel-gcp-vm/examples/gen-ai-xeon-opea-chatqna
# ADD TOKEN TO variables.tf (SEE ABOVE)
terraform init 
terraform plan
terraform apply

# (enter your GCP project ID and "yes" to confirm)

```

After the Terraform module successfully creates the GCP VM instance, **wait ~15 minutes** for the module to launch the containers and download the LLMs before continuing.

## Accessing the Demo

You can access the demos using the following:

- OPEA ChatQnA: `http://yourpublicip:5174`


## Deleting the Demo

To delete the demo, run `terraform destroy` to delete all resources created.

## Pre-requisites for running on a local Workstation (disregard if using GCP Cloud Shell)

1. Google Cloud CLI: https://cloud.google.com/sdk/docs/install
2. CGP account access configured: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#running-terraform-on-your-workstation
3. Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
4. Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
