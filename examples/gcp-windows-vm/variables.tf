variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
  default     = "intel-csa-resource-gcp"
}

variable "nat_ip" {
  type        = string
  description = "Public ip address"
  default     = null
}

variable "public_ptr_domain_name" {
  type        = string
  description = "The DNS domain name for the public PTR record"
  default     = null
}

variable "network_tier" {
  type        = string
  description = "Network network_tier"
  default     = "PREMIUM"
}