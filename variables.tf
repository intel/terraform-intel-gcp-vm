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

# variable "network_interface" {
#   type        = map(any)
#   description = "Networks to attach to the instance"
# }

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



#TODO Check for default value when provisioning instance
variable "stop_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance to update its properties."
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
  default = {
  }
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

variable "allow_stopping_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance to update its properties"
  default     = true
}

variable "tags" {
  type        = list(string)
  description = "A list of network tags to attach to the instance"
  default     = []
}

# variable "attached_disk" {
#   type        = map(any)
#   description = "Additional disks to attach to the instance. Can be repeated multiple times for multiple disks"
#   default = {}
# }

# variable "can_ip_forward" {
#   type        = bool
#   description = "Whether to allow sending and receiving of packets with non-matching source or destination IPs"
#   default = false
# }

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

# variable "guest_accelerator" {
#   type        = list(string)
#   description = "List of the type and count of accelerator cards attached to the instance"
# }

# variable "labels" {
#   type        = map(any)
#   description = "A map of key/value label pairs to assign to the instance"
# }

# variable "metadata" {
#   type        = map(any)
#   description = "Metadata key/value pairs to make available from within the instance"
# }

# variable "metadata_startup_script" {
#   type        = string
#   description = "An alternative to using the startup-script metadata key, except this one forces the instance to be recreated (thus re-running the script) if it is changed. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously."
# }

# variable "scheduling" {
#   type        = map(any)
#   description = "The scheduling strategy to use"
# }

# variable "scratch_disk" {
#   type        = map(string)
#   description = "Scratch disks to attach to the instance"
# }

# variable "service_account" {
#   type        = map(string)
#   description = "Service account to attach to the instance"
# }



# variable "shielded_instance_config" {
#   type        = map(bool)
#   description = " Enable Shielded VM on this instance. Shielded VM provides verifiable integrity to prevent against malware and rootkits"
# }

# variable "enable_display" {
#   type        = bool
#   description = "Enable Virtual Displays on this instance"
# }

# variable "resource_policies" {
#   type        = list(any)
#   description = "A list of self_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate"
# }

# variable "reservation_affinity" {
#   type        = map(string)
#   description = "Specifies the reservations that this instance can consume from"
# }

# variable "confidential_instance_config" {
#   type        = map(any)
#   description = "Enable Confidential Mode on this VM"
# }

# variable "advanced_machine_features" {
#   type        = map(any)
#   description = "Configure Nested Virtualisation and Simultaneous Hyper Threading on this VM"
#   default = {}
# }

# variable "network_performance_config" {
#   type        = map(string)
#   description = "Optional, Beta Configures network performance settings for the instance"
# }












































































































