########################
####     Intel      ####
########################
# See policies.md, Intel recommends the 3rd Generation Intel® Xeon® Platinum (Ice Lake) based instances.
#N2-Standard:  n2-standard-2, n2-standard-4, n2-standard-8, n2-standard-16, n2-standard-32, n2-standard-64, n2-standard-80, n2-standard-96, n2-standard-128
#N2-HighMemory: n2-highmem-2, n2-highmem-4, n2-highmem-8, n2-highmem-16, n2-highmem-32, n2-highmem-48, n2-highmem-64, n2-highmem-80, n2-highmem-96, n2-highmem-128
#N2-HighCpu: n2-highcpu-2, n2-highcpu-4, n2-highcpu-8, n2-highcpu-16, n2-highcpu-32, n2-highcpu-48, n2-highcpu-64, n2-highcpu-80, n2-highcpu-96
#Compute
#C2-standard: c2-standard-4, c2-standard-8, c2-standard-16, c2-standard-30, c2-standard-60
#Memory Opitimized: m3-ultramem-32, m3-ultramem-64, m3-ultramem-128, m3-megamem-64, m3-megamem-128


#"minCpuPlatform": Intel Ice Lake

# https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform#availablezones
variable "min_cpu_platform" {
  type        = string
  description = "Specifies a minimum CPU platform for the VM instance"
  default     = "Intel Ice Lake"
}

########################
####    Required    ####
########################
variable "boot_disk" {
  type        = map(any)
  description = "The boot disk for the instance"
  default     = {}
}

variable "name" {
  type        = string
  description = "A unique name for the resource, required by GCE. Changing this forces a new resource to be created."
}

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

variable "service_account_email" {
  type        = string
  description = "Service account to attach to the instance"
  default     = ""
}

variable "service_account_scopes" {
  type        = list(string)
  description = "Service account to attach to the instance"
  default     = []
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

########################
####     Other      ####
########################

variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "n2-standard-2"
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
  type = map(object({
    nat_ip            = optional(string, null)
    public_ptr_domain = optional(string)
    network_tier      = optional(string)
  }))
  default     = {}
  description = "Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps"
}

variable "ipv6_access_config" {
  type = object({
    public_ptr_domain_name = optional(string, null)
    network_tier           = optional(string, "PREMIUM")
  })
  default     = null
  description = "An array of IPv6 access configurations for this interface. Currently, only one IPv6 access config, DIRECT_IPV6, is supported. If there is no ipv6AccessConfig specified, then this instance will have no external IPv6 Internet access"
}


variable "enable_nested_virtualization" {
  type        = bool
  description = "Boolean that specifies if nested virtualization should be enabled or disabled on the instance."
  default     = false
}

variable "threads_per_core" {
  type        = number
  description = "The number of threads per physical core. To disable simultaneous multithreading (SMT) set this to 1"
  default     = 1
}

variable "termination_action" {
  type        = string
  description = "The action that will be applied to the instance when it is terminated."
  default     = false
}