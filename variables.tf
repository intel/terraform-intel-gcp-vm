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


#"minCpuPlatform": Intel Icelake

# See more:
# https://cloud.google.com/compute/docs/cpu-platforms

########################
####    Required    ####
########################
variable "machine_type" {
  description = "The type of VM instance for each nodes. See https://cloud.google.com/compute/docs/machine-types"
  type        = string
  default     = "f1-micro"
}


########################
####     Other      ####
########################

# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "instance_name" {
  description = "A name to identify the VM instance."
  type        = string
}

variable "boot_disk_image" {
  description = "The source image to build the VM's boot disk from. Can be specified by the image's self-link, projects/{project}/global/images/{image}, projects/{project}/global/images/family/{family}, global/images/{image}, global/images/family/{family}, family/{family}, {project}/{family}, {project}/{image}, {family}, or {image}. Run 'gcloud compute images list' to get a list of compatible public images. Can also use custom image paths instead."
  type        = string
}

variable "vpc_subnetwork" {
  description = "A reference (self link) to the VPC subnet to host the VM instance in."
  type        = string
}

variable "network_tags" {
  description = "List of network tags for the VM instance. These tags are used for setting up firewall rules to & from the VM instance. Setting this is permanent. Changing it later will require the VM to be destroyed and re-created. Use empty array [] if you intend to not use any netowrk tags for this VM instance."
  type        = list(string)
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------


variable "zone" {
  description = "The GCloud zone-letter to launch the VM instance in. Options are \"a\" or \"b\" or \"c\" or \"d\". Defaults to \"a\" zone of the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones."
  type        = string
  default     = "a"
}

variable "source_external_ip" {
  description = "An existing external IP to be attached to the VM instance. VM will become publicly reachable if this is specified. Gets disregarded if \"var.create_external_ip\" is set to \"true\"."
  type        = string
  default     = ""
}

variable "create_external_ip" {
  description = "Whether to create a new external IP to be attached to the VM instance. VM will become publicly reachable if this is specified. Setting this to \"true\" will cause \"var.source_external_ip\" to be disregarded."
  type        = bool
  default     = false
}

variable "external_ip_name" {
  description = "An arbitrary name to identify the External IP that will be generated & attached to the VM instance (if \"var.create_external_ip\" is set to \"true\"). Uses \"var.instance_name\" if nothing is specified here."
  type        = string
  default     = ""
}

variable "allow_login" {
  description = "Whether the \"OS Login\" feature will be allowed in the VM instance. CoreOS instances require \"allow_stopping_for_update\" to be \"true\" for the changes to take effect. See https://cloud.google.com/compute/docs/instances/managing-instance-access. Setting this to \"true\" also creates firewall rules which allow SSH / RDP access to the VM via IAP tunnelling. See https://cloud.google.com/iap/docs/using-tcp-forwarding"
  type        = bool
  default     = false
}

variable "allow_stopping_for_update" {
  description = "Allows Terraform to stop the VM instance to update its properties."
  type        = bool
  default     = true
}

variable "boot_disk_size" {
  description = "The size of the boot disk in GigaBytes. Must be at least the size of the boot disk image."
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "The GCE disk type. May be set to \"pd-standard\", \"pd-balanced\" or \"pd-ssd\"."
  type        = string
  default     = "pd-standard"
}

variable "sa_name" {
  description = "An arbitrary name to identify the ServiceAccount that will be generated & attached to the VM instance. Uses \"var.instance_name\" if nothing is specified. Gets disregarded if \"var.sa_email\" is specified."
  type        = string
  default     = ""
}

variable "sa_description" {
  description = "An arbitrary description for the ServiceAccount that will be generated & attached to the VM instance. Gets disregarded if \"var.sa_email\" is specified."
  type        = string
  default     = "Manages permissions available to the VM instance."
}

variable "sa_roles" {
  description = "IAM roles to be granted to the ServiceAccount which is generated & attached to the VM instance. Gets disregarded if \"var.sa_email\" is specified."
  type        = list(string)
  default     = []
}

variable "sa_email" {
  description = "Email address of another ServiceAccount that will be attached to the VM instance. If specified, it disregards \"var.sa_name\", \"var.sa_description\", \"var.sa_roles\"."
  type        = string
  default     = ""
}

variable "login_user_groups" {
  description = "List of usergroup emails that maybe allowed access to login to the VM instance. For example: SSH login via CloudSHell. Requires \"var.allow_login\" to be set to \"true\"."
  type        = list(string)
  default     = []
}

variable "login_admin_groups" {
  description = "List of usergroup emails that maybe allowed root (superuser) (sudo) access to the VM instance. For example: SSH login via CloudSHell and then 'sudo su'. Requires \"var.allow_login\" to be set to \"true\"."
  type        = list(string)
  default     = []
}

variable "login_service_accounts" {
  description = "List of ServiceAccount emails that maybe allowed access to login to the VM instance. For example: SSH login from a remote CI/CD pipeline. Requires \"var.allow_login\" to be set to \"true\"."
  type        = list(string)
  default     = []
}

variable "fw_allowed_cidrs" {
  description = "List of IP CIDRs to be allowed by the VM firewall rules for incoming traffic."
  type        = list(string)
  default     = []
}

variable "fw_allowed_ports" {
  description = "List of ports to be opened by the VM firewall rules for incoming traffic."
  type        = list(string)
  default     = []
}