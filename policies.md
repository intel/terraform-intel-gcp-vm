<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## GCP VM module

This file documents the HashiCorp Sentinel policies that apply to this module

## Policy 1

Description: The configured "machine_type" should be an Intel Xeon 3rd Generation(code-named Ice Lake) Scalable processors or an Intel Xeon 4th Generation(code-named Sapphire Rapids) Scalable processors. For c2-standard-* machine types, we have made an exception to include Intel 2nd Gen Xeon (code-named Cascade), since it is not available on Icelake platform

Resource type: google_compute_instance

Parameter: machine_type

Allowed Types

- **General Purpose:**  N2-Standard:  n2-standard-2, n2-standard-4, n2-standard-8, n2-standard-16, n2-standard-32, n2-standard-48, n2-standard-64, n2-standard-80, n2-standard-96, n2-standard-128
- **General Purpose:** N2-HighMem: n2-highmem-2, n2-highmem-4, n2-highmem-8, n2-highmem-16, n2-highmem-32, n2-highmem-48, n2-highmem-64, n2-highmem-80, n2-highmem-96, n2-highmem-128
- **General Purpose:** N2-HighCPU: n2-highcpu-2, n2-highcpu-4, n2-highcpu-8, n2-highcpu-16, n2-highcpu-32, n2-highcpu-48, n2-highcpu-64, n2-highcpu-80, n2-highcpu-96
- **General Purpose:** C3-Standard:
c3-standard-4, c3-standard-8, c3-standard-22, c3-standard-44, c3-standard-88, c3-standard-176
- **General Purpose with Local SSD:** C3-Standard-LSSD: c3-standard-4-lssd, c3-standard-8-lssd, c3-standard-22-lssd, c3-standard-44-lssd, c3-standard-88-lssd, c3-standard-176-lssd
- **Compute Optimized:** C3-HighCPU: c3-highcpu-4, c3-highcpu-8, c3-highcpu-22, c3-highcpu-44, c3-highcpu-88, c3-highcpu-176
- **Memory Optimized:** c3-HighMem: c3-highmem-4, c3-highmem-8, c3-highmem-22, c3-highmem-44, c3-highmem-88, c3-highmem-176
- **Memory Optimized:** m3-UltraMem: m3-Ultramem-32, m3-ultramem-64, m3-ultramem-128, m3-megamem-64, m3-megamem-128

## Policy 2

Description: This policy will be based on the google_compute_instance resource type and the minimum cpu platform (min_cpu_platform) parameter. This policy will allow "Intel Ice Lake", "Intel Sapphire Rapids" CPU platforms.

Resource type: google_compute_instance

Parameter: min_cpu_platform

Allowed Types

- Intel Ice Lake, Intel Sapphire Rapids

## Links
<https://cloud.google.com/compute/docs/cpu-platforms>
