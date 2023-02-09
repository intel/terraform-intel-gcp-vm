

<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## GCP VM module
This module provides the functionality to ensure that you are utilizing Intel's latest generation processor in the creation of a virtual machine in GCP.   

## Usage

See examples folder for code ./examples/intel-gcp-vm/main.tf

Example of main.tf

```hcl
data "google_compute_image" "image" {
  family  = var.boot_image_family
  project = var.boot_image_project
}



```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply

```

Note that this example may create resources. Run `terraform destroy` when you don't need these resources anymore.

## Considerations  

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_image.image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_config"></a> [access\_config](#input\_access\_config) | Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps | <pre>list(object({<br>    nat_ip                 = optional(string, null)<br>    public_ptr_domain_name = optional(string)<br>    network_tier           = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | If true, allows Terraform to stop the instance to update its properties | `bool` | `null` | no |
| <a name="input_automatic_restart"></a> [automatic\_restart](#input\_automatic\_restart) | Specifies if the instance should be restarted if it was terminated by Compute Engine (not a user). | `bool` | `true` | no |
| <a name="input_boot_disk_auto_delete"></a> [boot\_disk\_auto\_delete](#input\_boot\_disk\_auto\_delete) | Whether the disk will be auto-deleted when the instance is deleted. | `bool` | `true` | no |
| <a name="input_boot_disk_byo_encryption_key"></a> [boot\_disk\_byo\_encryption\_key](#input\_boot\_disk\_byo\_encryption\_key) | A 256-bit [customer-supplied encryption key] (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in RFC 4648 base64 to encrypt this disk. | `string` | `null` | no |
| <a name="input_boot_disk_labels"></a> [boot\_disk\_labels](#input\_boot\_disk\_labels) | A set of key/value label pairs assigned to the disk. This field is only applicable for persistent disks. | `map(string)` | `{}` | no |
| <a name="input_boot_disk_mode"></a> [boot\_disk\_mode](#input\_boot\_disk\_mode) | The mode in which to attach this disk, either READ\_WRITE or READ\_ONLY. | `string` | `"READ_WRITE"` | no |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Size of the OS disk | `number` | `100` | no |
| <a name="input_boot_disk_source"></a> [boot\_disk\_source](#input\_boot\_disk\_source) | The name or self\_link of the existing disk (such as those managed by google\_compute\_disk) or disk image. | `string` | `"READ_WRITE"` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Disk type associated with the OS disk | `string` | `"pd-ssd"` | no |
| <a name="input_boot_image_family"></a> [boot\_image\_family](#input\_boot\_image\_family) | The image from which to initialize this disk | `string` | `"debian-10"` | no |
| <a name="input_boot_image_project"></a> [boot\_image\_project](#input\_boot\_image\_project) | The ID of the project in which the source image resides. | `string` | `"ubuntu-os-cloud"` | no |
| <a name="input_can_ip_forward"></a> [can\_ip\_forward](#input\_can\_ip\_forward) | Conditional that allows sending and receiving of packets with non-matching source or destination IPs. | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection on this instance | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A brief description of this resource | `string` | `"Intel accelerated virtual machine."` | no |
| <a name="input_desired_status"></a> [desired\_status](#input\_desired\_status) | Desired status of the instance. | `string` | `"RUNNING"` | no |
| <a name="input_enable_integrity_monitoring"></a> [enable\_integrity\_monitoring](#input\_enable\_integrity\_monitoring) | Compare the most recent boot measurements to the integrity policy baseline and return a pair of pass/fail results depending on whether they match or not. | `bool` | `true` | no |
| <a name="input_enable_nested_virtualization"></a> [enable\_nested\_virtualization](#input\_enable\_nested\_virtualization) | Boolean that specifies if nested virtualization should be enabled or disabled on the instance. | `bool` | `false` | no |
| <a name="input_enable_secure_boot"></a> [enable\_secure\_boot](#input\_enable\_secure\_boot) | Verify the digital signature of all boot components, and halt the boot process if signature verification fails. | `bool` | `false` | no |
| <a name="input_enable_vtpm"></a> [enable\_vtpm](#input\_enable\_vtpm) | Use a virtualized trusted platform module, which is a specialized computer chip you can use to encrypt objects like keys and certificates. | `bool` | `true` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | A custom hostname for the instance. Must be a fully qualified DNS name and RFC-1035-valid | `string` | `null` | no |
| <a name="input_ipv6_access_config"></a> [ipv6\_access\_config](#input\_ipv6\_access\_config) | Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps | <pre>list(object({<br>    public_ptr_domain_name = optional(string, null)<br>    network_tier           = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to create | `string` | `"n2-standard-2"` | no |
| <a name="input_min_cpu_platform"></a> [min\_cpu\_platform](#input\_min\_cpu\_platform) | Specifies a minimum CPU platform for the VM instance | `string` | `"Intel Ice Lake"` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name for the resource, required by GCE. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name or self\_link of the network to attach this interface to. | `string` | `"default"` | no |
| <a name="input_network_ip"></a> [network\_ip](#input\_network\_ip) | The private IP address to assign to the instance. If empty, the address will be automatically assigned. | `string` | `""` | no |
| <a name="input_nic_type"></a> [nic\_type](#input\_nic\_type) | The type of vNIC to be used on this compute instance. | `string` | `null` | no |
| <a name="input_on_host_maintenance"></a> [on\_host\_maintenance](#input\_on\_host\_maintenance) | Describes maintenance behavior for the instance. Can be MIGRATE or TERMINATE | `string` | `"MIGRATE"` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Specifies if the instance is preemptible. If this field is set to true, then automatic\_restart must be set to false. | `bool` | `false` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource resides. | `string` | `""` | no |
| <a name="input_provisioning_model"></a> [provisioning\_model](#input\_provisioning\_model) | Describe the type of preemptible VM. This field accepts the value STANDARD or SPOT | `string` | `"STANDARD"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account and scopes that will be associated with the GCE instance. | <pre>object({<br>    service_email = optional(string, null)<br>    scopes        = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_stack_type"></a> [stack\_type](#input\_stack\_type) | he stack type for this network interface to identify whether the IPv6 feature is enabled or not. | `string` | `"IPV4_ONLY"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name or self\_link of the subnetwork to attach this interface to. Either network or subnetwork must be provided. | `string` | `null` | no |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | The project in which the subnetwork belongs. If the subnetwork is a name and this field is not provided, the provider project is used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of network tags to attach to the instance | `list(string)` | `[]` | no |
| <a name="input_termination_action"></a> [termination\_action](#input\_termination\_action) | The action that will be applied to the instance when it is terminated. | `string` | `null` | no |
| <a name="input_threads_per_core"></a> [threads\_per\_core](#input\_threads\_per\_core) | The action that will be applied to the instance when it is terminated. | `number` | `null` | no |
| <a name="input_visible_core_count"></a> [visible\_core\_count](#input\_visible\_core\_count) | The number of physical cores to expose to an instance. | `number` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that the machine should be created in. If it is not provided, the provider zone is used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_boot_disk_size"></a> [boot\_disk\_size](#output\_boot\_disk\_size) | Size of the boot disk of the instance |
| <a name="output_cpu_platform"></a> [cpu\_platform](#output\_cpu\_platform) | The CPU platform of the VM instance |
| <a name="output_current_status"></a> [current\_status](#output\_current\_status) | Current status of the VM instance |
| <a name="output_id"></a> [id](#output\_id) | An identifier for the resource |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The server-assigned unique identifier of this instance |
| <a name="output_machine_type"></a> [machine\_type](#output\_machine\_type) | Type of the machine created |
| <a name="output_min_cpu_platform"></a> [min\_cpu\_platform](#output\_min\_cpu\_platform) | Minimum CPU platform for the VM instance |
| <a name="output_name"></a> [name](#output\_name) | Unique name of the instance created |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Internal IP address of the instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP address of the instance |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource |
<!-- END_TF_DOCS -->