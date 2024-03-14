variable "project" {
  type        = string
  description = "The ID of the project in which the resource resides."
}
variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "n4-standard-4"
}
variable "boot_disk_type" {
  type        = string
  description = "Disk type associated with the OS disk."
  #There are several disk types and the values can be:
  # pd-ssd = pd-ssd stands for "Persistent Disk - Solid State Drive"
  # local-ssd = Local SSD (Solid State Drive) temporary storage
  # pd-standard = Standard Hard Disk Drive (HDD)
  # hyperdisk-balanced persistent disk designed to offer a balanced combination of performance, durability, and cost-effectiveness
  # 5th Generation Intel Xeon N4 instance types require hyperdisk-balanced
  default     = "hyperdisk-balanced"
}
