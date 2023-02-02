locals {
  config = var.access_config
}



variable "access_config" {
  type = map(object({
    nat_ip = optional(string)
    public_ptr_domain = optional(string)
    network_tier = optional(string)
  }))
  default = {}
}
