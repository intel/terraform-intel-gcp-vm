########################
####     Intel      ####
########################
# See policies.md, Intel recommends the 3rd Generation Intel® Xeon® Platinum (Ice Lake) based instances. It is the latest Intel CPU generation globally available
# at the time of creation of this repo
# General Purpose N2-Standard:  n2-standard-2, n2-standard-4, n2-standard-8, n2-standard-16, n2-standard-32, n2-standard-48, n2-standard-64, n2-standard-80, n2-standard-96, n2-standard-128
# General Purpose N2-HighMemory: n2-highmem-2, n2-highmem-4, n2-highmem-8, n2-highmem-16, n2-highmem-32, n2-highmem-48, n2-highmem-64, n2-highmem-80, n2-highmem-96, n2-highmem-128
# General Purpose N2-HighCPU: n2-highcpu-2, n2-highcpu-4, n2-highcpu-8, n2-highcpu-16, n2-highcpu-32, n2-highcpu-48, n2-highcpu-64, n2-highcpu-80, n2-highcpu-96
# Compute Optimized C2-standard: c2-standard-4, c2-standard-8, c2-standard-16, c2-standard-30, c2-standard-60, c3-highcpu-4, c3-highcpu-8, c3-highcpu-22, c3-highcpu-44, c3-highcpu-88, c3-highcpu-176
# Memory Optimized m3-ultramem-32, m3-ultramem-64, m3-ultramem-128, m3-megamem-64, m3-megamem-128

#"minCpuPlatform": Intel Cascade Lake, Intel Ice Lake, Intel Sapphire Rapids

# https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform#availablezones
variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "n2-standard-2"
}

########################
####    Required    ####
########################
variable "name" {
  type        = string
  description = "A unique name for the resource, required by GCE. Changing this forces a new resource to be created."
}

########################
####     Other      ####
########################

variable "desired_status" {
  type        = string
  description = "Desired status of the instance."
  default     = "RUNNING"
}

variable "network" {
  type        = string
  description = "The name or self_link of the network to attach this interface to."
  default     = "default"
}

variable "network_ip" {
  type        = string
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned."
  default     = ""
}

variable "nic_type" {
  type        = string
  description = "The type of vNIC to be used on this compute instance."
  default     = null
}

variable "stack_type" {
  type        = string
  description = "he stack type for this network interface to identify whether the IPv6 feature is enabled or not."
  default     = "IPV4_ONLY"
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the subnetwork to attach this interface to. Either network or subnetwork must be provided. "
  default     = null
}

variable "subnetwork_project" {
  type        = string
  description = "The project in which the subnetwork belongs. If the subnetwork is a name and this field is not provided, the provider project is used."
  default     = null
}

variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
  default     = ""
}

variable "service_account" {
  type = object({
    service_email = optional(string, null)
    scopes        = optional(set(string), [])
  })
  default     = {}
  description = "Service account and scopes that will be associated with the GCE instance."
}

############################
####     Boot Disk      ####
############################

variable "boot_image_family" {
  type        = string
  description = "The image from which to initialize this disk"
  default     = "debian-10"
}

variable "boot_disk_size" {
  type        = number
  description = "Size of the OS disk"
  default     = 100
}

variable "boot_disk_type" {
  type        = string
  description = "Disk type associated with the OS disk"
  default     = "pd-ssd"
}

variable "boot_image_project" {
  type        = string
  description = "The ID of the project in which the source image resides."
  default     = "ubuntu-os-cloud"
}

variable "zone" {
  type        = string
  description = "The zone that the machine should be created in. If it is not provided, the provider zone is used."
  default     = null
}

variable "can_ip_forward" {
  type        = bool
  description = "Conditional that allows sending and receiving of packets with non-matching source or destination IPs."
  default     = false
}

#TODO get feedback on what we want for this setting
variable "allow_stopping_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance to update its properties"
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "A list of network tags to attach to the instance"
  default     = []
}

variable "description" {
  type        = string
  description = "A brief description of this resource"
  default     = "Intel accelerated virtual machine."
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection on this instance"
  default     = false
}

variable "hostname" {
  type        = string
  description = "A custom hostname for the instance. Must be a fully qualified DNS name and RFC-1035-valid"
  default     = null
}

#TODO get feedback on this value
variable "preemptible" {
  type        = bool
  description = "Specifies if the instance is preemptible. If this field is set to true, then automatic_restart must be set to false."
  default     = false
}

variable "automatic_restart" {
  type        = bool
  description = "Specifies if the instance should be restarted if it was terminated by Compute Engine (not a user)."
  default     = true
}

variable "provisioning_model" {
  type        = string
  description = "Describe the type of preemptible VM. This field accepts the value STANDARD or SPOT"
  default     = "STANDARD"
}

variable "on_host_maintenance" {
  type        = string
  description = "Describes maintenance behavior for the instance. Can be MIGRATE or TERMINATE"
  validation {
    condition     = contains(["MIGRATE", "TERMINATE"], var.on_host_maintenance)
    error_message = "on_host_maintenance must have a value of \"MIGRATE\" or \"TERMINATE\"."
  }
  default = "MIGRATE"
}

variable "access_config" {
  type = list(object({
    nat_ip                 = optional(string, null)
    public_ptr_domain_name = optional(string)
    network_tier           = optional(string)
  }))
  default     = []
  description = "Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps"
}

variable "ipv6_access_config" {
  type = list(object({
    public_ptr_domain_name = optional(string, null)
    network_tier           = optional(string, null)
  }))
  default     = []
  description = "Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps"
}

variable "enable_nested_virtualization" {
  type        = bool
  description = "Boolean that specifies if nested virtualization should be enabled or disabled on the instance."
  default     = false
}

variable "termination_action" {
  type        = string
  description = "The action that will be applied to the instance when it is terminated."
  default     = null
}

variable "threads_per_core" {
  type        = number
  description = "The action that will be applied to the instance when it is terminated."
  default     = null
}


variable "enable_secure_boot" {
  type        = bool
  description = "Verify the digital signature of all boot components, and halt the boot process if signature verification fails."
  default     = false
}

variable "enable_vtpm" {
  type        = bool
  description = "Use a virtualized trusted platform module, which is a specialized computer chip you can use to encrypt objects like keys and certificates."
  default     = true
}

variable "enable_integrity_monitoring" {
  type        = bool
  description = "Compare the most recent boot measurements to the integrity policy baseline and return a pair of pass/fail results depending on whether they match or not."
  default     = true
}

variable "boot_disk_auto_delete" {
  type        = bool
  description = "Whether the disk will be auto-deleted when the instance is deleted."
  default     = true
}

variable "boot_disk_mode" {
  type        = string
  description = "The mode in which to attach this disk, either READ_WRITE or READ_ONLY."
  default     = "READ_WRITE"
}


variable "boot_disk_source" {
  type        = string
  description = "The name or self_link of the existing disk (such as those managed by google_compute_disk) or disk image."
  default     = null       
}

variable "boot_disk_byo_encryption_key" {
  type        = string
  description = "A 256-bit [customer-supplied encryption key] (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in RFC 4648 base64 to encrypt this disk."
  default     = null
}

variable "boot_disk_labels" {
  type        = map(string)
  description = "A set of key/value label pairs assigned to the disk. This field is only applicable for persistent disks."
  default     = {}
}

variable "visible_core_count" {
  type        = number
  description = "The number of physical cores to expose to an instance."
  default     = null
}