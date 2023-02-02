locals {
  config = var.ipv6_access_config
}




variable "ipv6_access_config" {
  type = list(object({
    public_ptr_domain_name = optional(string, null)
    network_tier           = optional(string, null)
  }))
  default     = []
  description = "Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps"
}

variable "ipv6_access_config" {
  type = object({
    public_ptr_domain_name = string
    network_tier           = string
  })
  default     = {}
  description = "Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network. This can be represented as multiple maps"
}