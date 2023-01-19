<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

## Policy 1

Description: The configured "instance_type" should be an Intel Xeon 3rd Generation(code-named Ice Lake) Scalable processors

Resource type: aws_instance(need to update w/ GCP )

Parameter: instance_type

Allowed Types
- **General Purpose:**  N2-Standard:  n2-standard-2, n2-standard-4, n2-standard-8, n2-standard-16, n2-standard-32, n2-standard-64, n2-standard-80, n2-standard-96, n2-standard-128
- **Compute Optimized:** N2-HighMemory: n2-highmem-2, n2-highmem-4, n2-highmem-8, n2-highmem-16, n2-highmem-32, n2-highmem-48, n2-highmem-64, n2-highmem-80, n2-highmem-96, n2-highmem-128
#N2-HighCpu: n2-highcpu-2, n2-highcpu-4, n2-highcpu-8, n2-highcpu-16, n2-highcpu-32, n2-highcpu-48, n2-highcpu-64, n2-highcpu-80, n2-highcpu-96
- **Compute Optimized:** C2-standard: c2-standard-4, c2-standard-8, c2-standard-16, c2-standard-30, c2-standard-60
- **Memory Optimized:** m3-ultramem-32, m3-ultramem-64, m3-ultramem-128, m3-megamem-64, m3-megamem-128



## Links
https://cloud.google.com/compute/docs/cpu-platforms

