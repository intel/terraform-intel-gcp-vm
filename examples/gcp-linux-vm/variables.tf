variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
  default = intel-csa-resource-gcp
}

# variable "boot_disk_type" {
#   type        = string
#   description = "Disk type associated with the OS disk. Values can be either pd-ssd, local-ssd, or pd-standard"
#   default     = "local-ssd"
# }

variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "c4-standard-4-lssd"
}
